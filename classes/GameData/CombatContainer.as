package classes.GameData 
{
	import classes.Characters.PlayerCharacter;
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.DamageResult;
	import classes.Items.Armor.GooArmor;
	import classes.ItemSlotClass;
	import classes.StorageClass;
	import classes.Engine.Interfaces.*;
	import classes.Characters.*;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.Engine.Utility.possessive;
	import classes.Engine.Utility.plural;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.applyDamage;
	import classes.GLOBAL;
	import flash.utils.Dictionary;
	import classes.Engine.Combat.damageRand;
	import classes.Engine.Combat.outputDamage;
	import classes.StringUtil;
	import classes.Items.Miscellaneous.*;
	import classes.Engine.Utility.num2Text;
	import flash.utils.getQualifiedClassName;
	import flash.utils.getDefinitionByName;
	import classes.Util.InCollection;
	
	/**
	 * TODO:
	 * Tweak status effects that cause damage to store the damage they should do in one of the value stores:
	 * 		f.ex Burning damage was based purely off enemy's level + 4. Calculate-on-apply, no more lookups etc
	 * A lot of the additional messages that this has added will probably need tuning.
	 * 		To get through this I haven't really applied *logic* in terms of what the messages are saying, and they
	 * 		are mostly just a slight tweak on what was being output for the player, so sometimes they don't make much sense.
	 * A shared repository for things like cooldown effects to tune combat
	 * during group fights:
	 * 		f.ex stopping a flashbang from being used too often when many
	 * enemies can use the ability
	 */
	
	/**
	 * Documentation on things!
	 * 
	 * AUTOMATICALLY HANDLED COOLDOWN EFFECTS.
	 * Include the text "Cooldown" in the name of an effect. 
	 * - The game will automatically tick it down per-round, and be removed when the
	 * tracking value moves below 0 (this means an effect starting at 5 will be unavailable for 5 rounds AFTER it is
	 * applied, as it will decrement in the round it is USED).
	 * - V1 is used as the duration remaining
	 * - V2 marks the effect state. If it is anything but zero it will not count down.
	 * 
	 * AUTOMATICALLY HANDLED CONTROL EFFECTS.
	 * Effects named "Grappled", "Stunned", "Tripped" and "Blinded" are automatically handled.
	 * Some of these are handled at a "basic" level for NPCs too. Certain effects can be wired in to
	 * subvert the usual AI-movement-process, to default handling for things that remove control (and thus,
	 * provides automatic action-selections to be taken to clean these up).
	 * 
	 * PROCESS COMBAT SHOULD ONLY BE CALLED ONCE
	 * ProcessCombat demarks the final player input that actually takes an action. 
	 * It should only be called a single time. Attack implementations should not require it,
	 * as the method that executes the attack implementors calls it.
	 * NPC actions do not require it, at all- it is simply the means that "kicks off" the process
	 * of resolving a round of combat once a player action has been taken.
	 * 
	 * TRANSIENT PROPERTIES TO ENABLE EASIER LINKAGES
	 * Peep the bottom of the Creature class- there are a handful of properties designed
	 * to act as "transient" storage, that link to other creatures. They won't be serialized
	 * out to the save file and should only potentially be valid during combat.
	 * This enables a couple of things. For instance, the best example:
	 * 		Knowing which creature is grappling which other creature, allowing "followups"
	 * to the inital grapple state to resolve correctly (specalized messages, stopping the
	 * correct Creatures from taking other combat actions etc).
	 * 
	 * PREP FOR COMBAT REWORKED
	 * prepForCombat is no longer an overridable function on the creature objects.
	 * Instead, there is a generic "prep for combat" function as part of the combat container, which should enforce
	 * certain properties on the creature objects to be in a known default state. This will mostly be ensuring that
	 * certain properties are null. Nothing should need "unique" prep- if it comes up, the ability should be added
	 * to the container in a generic method for everything in future.
	 * f.ex One thing I'm considering is storing the grappler/grapplee as a transient property on the creatures involved
	 * in a grapple, allowing grapples to function in a multi-friendly & multi-hostile fight.
	 * 
	 * NEW METHOD OF TESTING FOR A SPECIFIC CREATURE
	 * there's a function kicking around on CombatManager to test if a specific type of creature is involved in
	 * combat; hasEnemyOfClass(class type) ex: hasEnemyOfClass(Dane)
	 * This will probably be good enough for 99% of cases (as you don't care WHICH creature is involved to make
	 * a determination- most of the time you just need to know if any one of them is involved to know for sure
	 * which actual fight is currently executing.
	 * 
	 * TESTING FOR PLURALITY
	 * Another new function, exposed by CombatManager-- CombatManager.multipleEnemies(). Use this to wrap up
	 * whatever plurality checks you want to do (ie more than 1 enemy creature, creature has isPlural set etc).
	 * It's ropey at the minute, could probably do with some more tweaking, but is a good start.
	 * 
	 * ROUND STATUS EFFECT GONE
	 * The round status effect is gone. It's now available through CombatManager.getRoundCount().
	 * 
	 * EXTENDED OR MUTATING COMBAT DESCRIPTIONS
	 * Creatures that have either a description-extension based on state, custom properties that change during combat, or otherwise
	 * need to modify their combat description should override a function in their class- getCombatDescriptionExtension().
	 * Just output() stuff here based on whatever logic you want- this'll let you output custom stuff decoupled from the actual combatai
	 * execution, so it'll show up in the proper order for multi-enemy fights.
	 * @author Gedan
	 */
	public class CombatContainer 
	{
		// Local accessors to simplify coding throught this class
		private function get pc():PlayerCharacter { return kGAMECLASS.pc; }
		private function get flags():Dictionary { return kGAMECLASS.flags; }
		
		public var roomString:String = null;
		public var planetString:String = null;
		public var systemString:String = null;
		
		public function displayFightLocation():void
		{
			var r:String = (roomString != null ? "FIGHT:\n" + roomString : kGAMECLASS.userInterface.roomText);
			var p:String = (planetString != null ? planetString : kGAMECLASS.userInterface.planetText);
			var s:String = (systemString != null ? systemString : kGAMECLASS.userInterface.systemText);
			
			kGAMECLASS.setLocation(r, p, s); // This should only override whats set, ie if planet is null it
			// should inherit the currently set planet
		}
		
		public var encounterText:String = null;
		
		public static const NO_GROUP:String = "no_group";
		public static const FRIENDLY_GROUP:String = "friendly_group";
		public static const HOSTILE_GROUP:String = "hostile_group";
		
		public function displayBusts(group:String = NO_GROUP):void
		{
			
			// Speical handle for ZILPACK- use ZIL, ZIL
			// ^ RASKVEL_GANG => RASKVEL_MALE x3
			// ^ PRAETORIAN => PRAETORIAN x3
			// ^ TAIVRADANE => TAIVRA, DANE
			
			var overrides:Array = ["ZILPACK", "RASKVEL_GANG", "PRAETORIAN", "TAIVRADANE", "TAMTURRETS"];
			var bustIdx:String = (_hostiles[0] as Creature).bustDisplay;
			
			if (InCollection(bustIdx, overrides))
			{
				switch (bustIdx)
				{
					case "ZILPACK": kGAMECLASS.showBust("ZIL", "ZIL"); break;
					case "RASKVEL_GANG": kGAMECLASS.showBust("RASKVEL_MALE", "RASKVEL_MALE", "RASKVEL_MALE"); break;
					case "PRAETORIAN": kGAMECLASS.showBust("PRAETORIAN", "PRAETORIAN", "PRAETORIAN"); break;
					case "TAIVRADANE": kGAMECLASS.showBust("TAIVRA", "DANE"); break;
					case "TAMTURRETS": kGAMECLASS.showBust("TAMTAM", "TAMWOLF"); break;
				}
				
				return;
			}
			
			if (group == NO_GROUP)
			{
				kGAMECLASS.showBust(bustIdx);
			}
			else
			{
				var busts:Array = [];
				
				if (group == FRIENDLY_GROUP && _friendlies.length > 1)
				{
					// show friendlies but only if the player has a companion, otherwise do nothing
					for (var i:int = 0; i < _friendlies.length; i++)
					{
						if (_friendlies[i] is PlayerCharacter) continue;
						
						busts.push((_friendlies[i] as Creature).bustDisplay);
					}
				}
				else
				{
					// show hostiles
					for (i = 0; i < _hostiles.length; i++)
					{
						busts.push((_hostiles[i] as Creature).bustDisplay);
					}
				}
				
				kGAMECLASS.showBust(busts);
			}
		}
		
		/**
		 * Hook function.
		 * Any action that should be taken at the /end/ of a combat round, but before the
		 * next begins, should be done in this function.
		 */
		private function postHostileTurnActions():Boolean
		{
			// seductionChance()
			if (pc.hasStatusEffect("Attempt Seduction"))
			{
				pc.removeStatusEffect("Attempt Seduction");
				
				if(pc.hasVagina() && pc.mf("he","she") == "she" && pc.IQ() >= 70 && (pc.isBimbo() || pc.sexiness() >= 3) && !pc.hasStatusEffect("Seduction Declined") && !pc.hasStatusEffect("Stunned"))
				{
					output("\n\n<b>It occurs to you that there might be another, cleaner way out of this... if you use your feminine wiles to your best advantage.</b>");
					//[[Seduce]]
					clearMenu();
					addButton(0,"Seduce", kGAMECLASS.seduceTheRaskvelAttackYaNerd, undefined,"Seduce","You could probably seduce your way out of this. These boys will be easy to manipulate...");
					addButton(1,"No, Fight!", kGAMECLASS.nopeGonnaFightCapn);
					return true;
				}
			}
			
			// grayGooHarden() quickie offer
			if (pc.hasStatusEffect("Goo Harden Offer"))
			{
				pc.removeStatusEffect("Goo Harden Offer");
				
				clearMenu();
				addButton(0, "DoNothing", kGAMECLASS.dontDoAnythingFromHardenAttack);
				if (pc.hasCock() || pc.hasVagina())
				{
					addButton(1, "Quickie!", kGAMECLASS.quickieAfterGooHarden, undefined, "Quickie", "Have a quickie with the gray goo girl, resetting both of your lust scores.");
					return true;
				}
				else
				{
					output("\n\nThe poor thing doesn't seem to realize that you're missing the requisite parts.");
					addDisabledButton(1, "Quickie");
					return true;
				}
			}
			
			return false;
		}
		
		/**
		 * Hook function.
		 * Run as part of combat menu generation- extend this with extra available options
		 * against specific enemies and such.
		 * This is executed after the basic menu buttons are created, so you can override
		 * the default options that are displayed.
		 */
		private function additionalCombatMenuEntries():void
		{
			if (hasEnemyOfClass(CaptainKhorganMech))
			{
				kGAMECLASS.khorganMechBonusMenu();
				return;
			}
			
			if (hasEnemyOfClass(GardeBot))
			{
				kGAMECLASS.setEnemy(_hostiles[0]);
				kGAMECLASS.gardeBotBonusButtons();
				kGAMECLASS.setEnemy(null);
				return;
			}
			
			if (hasEnemyOfClass(QueenOfTheDeep))
			{
				addButton(13, "Surrender", kGAMECLASS.queenOfTheDeepSurrenderCombat, undefined, "Surrender", "Maybe you can still make it out of this alive. Throw down your weapons and surrender yourself to the lake monster. Maybe she'll go easy on you...");
				if (pc.hasStatusEffect("Watered Down")) addButton(12, "Climb", kGAMECLASS.queenOfTheDeepClimb, undefined, "Climb", "If you're quick and careful, you might be able to evade the monster woman's deadly claws and legs long enough to climb up on her back. You'll definitely have an easier time of it up there, though getting there's going to be risky...");
				return;
			}
			
			if (!pc.hasStatusEffect("Tripped") && (hasEnemyOfClass(Queensguard) || hasEnemyOfClass(Taivra)))
			{
				if (kGAMECLASS.flags["FREED_DANE_FROM_TAIVRA"] == undefined)
				{
					if (pc.statusEffectv1("Cage Distance") != 0) addButton(10, "Cage", function():void {
						kGAMECLASS.setEnemy(_hostiles[0]);
						kGAMECLASS.moveToCage();
						kGAMECLASS.setEnemy(null);
					}
					, undefined, "Cage", "Attempt to move closer to dane and [rival.name]'s cage.");
					
					else addButton(10, "BreakCage", function():void {
						kGAMECLASS.setEnemy(_hostiles[0]);
						kGAMECLASS.breakOutDane();
						kGAMECLASS.setEnemy(null);
					}, undefined, "Break Cage", "Try and break Dane out - that big, burly ausar might just level the playing field!");
					return;
				}
			}
		}
		
		/**
		 * Place code in this function for any status effect that impacts the creature
		 * it is on outside of its mere presence (ie DoT ticks, stat changes etc)
		 * @param	target
		 */
		private function updateStatusEffectsFor(target:Creature):void
		{
			if (target.isDefeated()) return;
			
			if (target.hasPerk("Shield Regen") && target.shields() <= 0 && target.shieldsMax() > 0 && !target.hasStatusEffect("Used Shield Regen"))
			{
				if (target is PlayerCharacter)
				{
					output("\n\n<b>Your shields power back up at one quarter power. Now's your chance to turn this around!</b>");
				}
				else
				{
					output("\n\n<b>" + target.capitalA + possessive(target.uniqueName) + " shield powers back up at one quarter power!</b>");
				}
				pc.shields(Math.round(pc.shieldsMax()/4));
				pc.createStatusEffect("Used Shield Regen",0,0,0,0,true,"","",true,0);
			}
			
			if (target.hasStatusEffect("Riposting")) target.removeStatusEffect("Riposting");
			if (target.hasStatusEffect("Bloodthirsted")) target.removeStatusEffect("Bloodthirsted");
	
			if (target.hasPerk("Juggernaught"))
			{
				if (target.hasStatusEffect("Stunned") && rand(4) == 0)
				{
					if (target is PlayerCharacter) output("\n\n<b>You shake off your stun! You're unstoppable!</b>");
					else output("\n\n<b>" + target.capitalA + target.uniqueName + " shakes off their stun!</b>");
					target.removeStatusEffect("Stunned");
				}
				if (target.hasStatusEffect("Paralyzed") && rand(4) == 0)
				{
					if (target is PlayerCharacter) output("\n\n<b>You shake off the paralysis! You're unstoppable!</b>");
					else output("\n\n<b>" + target.capitalA + target.uniqueName + " shakes off the paralysis!</b>");
					target.removeStatusEffect("Paralyzed");
				}
			}
			if (target.hasStatusEffect("Burning"))
			{
				target.addStatusValue("Burning", 1, -1);
				//Remove status!
				if (target.statusEffectv1("Burning") <= 0)
				{
					target.removeStatusEffect("Burning");
					if (target is PlayerCharacter) output("\n\n<b>At last you manage to stifle the life out of the fire on your " + target.armor.longName + ". The smell of pork hangs in your nose. You try not to think about it.</b>");
					else output("\n\n<b>" + target.capitalA + target.uniqueName + " manages to stifle the life out of the flames on their " + target.armor.longName + "!</b>");
				}
				//Keep status!
				else
				{
					if (target is PlayerCharacter) output("\n\n<b>You desperately slap at your body, trying to extinguish the flames that have taken to your " + target.armor.longName + " but it stubbornly clings to you, blackening and bubbling everything it touches. It burns!</b>");
					else output("\n\n<b>" + target.capitalA + target.uniqueName + " desperately slaps at their body, trying to extingquish the flames licking at their " + target.armor.longName + " to no avail!</b>");
					applyDamage(new TypeCollection( { burning: target.statusEffectv2("Burning") } ), null, target);
				}
			}
			
			//Does v1 lust damage every turn. V2 is turn counter (negative = infinite)!
			if (target.hasStatusEffect("Aphro"))
			{
				target.addStatusValue("Aphro", 2, -1);
				if (target.statusEffectv2("Aphro") == 0)
				{
					if (target is PlayerCharacter) output("\n\n<b>The aphrodisiac in your bloodstream has faded!</b>");
					else output("\n\n<b>The aphrodisiac in " + target.capitalA + possessive(target.uniqueName) + " bloodstream has faded!</b>");
					target.removeStatusEffect("Aphro");
				}
				else
				{
					if (target is PlayerCharacter) output("\n\n<b>The aphrodisiac in your bloodstream continues to excite your body!</b>");
					else output("\n\n<b>The aphrodisiac in " + target.capitalA + possessive(target.uniqueName) + " bloodstream continues to excite " + target.mfn("him", "her", "it") + "!</b>");
					applyDamage(new TypeCollection( { drug: target.statusEffectv1("Aphro") } ), null, target);
				}
			}
			
			//Does v1 lust damage every turn. V2 is turn counter (negative = infinite)!
			if(target.hasStatusEffect("Aphro Gas"))
			{
				target.addStatusValue("Aphro Gas", 2, -1);
				if(target.statusEffectv2("Aphro Gas") == 0)
				{
					output("\n\n<b>The aphrodisiac cloud has dispersed!</b>");
					target.removeStatusEffect("Aphro Gas");
				}
				else
				{
					if (target is PlayerCharacter) output("\n\n<b>The cloud of aphrodisiac continues to excite your body!</b>");
					else output("\n\n<b>The cloud of aphrodisiac continues to linger around " + target.a + target.uniqueName + "!</b>");
					applyDamage(new TypeCollection( { drug: target.statusEffectv1("Aphro Gas") } ), null, target);
				}
			}
			
			if(target.hasStatusEffect("Burn"))
			{
				if (target is PlayerCharacter)
				{
					output("\n\n<b>The flames slowly lick at you, " + (target.statusEffectv1("Burn") > 1 ? "resisting any attempt to put them out" : "refusing to go out until they've done their foul work") + ".</b>");
					if(target.statusEffectv1("Burn") > 1) 
					{
						target.addStatusValue("Burn",1,-1);
					}
					else 
					{
						target.removeStatusEffect("Burn");
					}
				}
				else
				{
					output("\n\n<b>Flames slowly lick at " + target.a + target.uniqueName + ", " + (target.statusEffectv1("Burn") > 1 ? "resisting any attempt to put them out" : "refusing to go out until they've done their foul work") + ".</b>");
					if (target.statusEffectv1("Burn") > 1)
					{
						target.addStatusValue("Burn", 1, -1);
					}
					else
					{
						target.removeStatusEffect("Burn");
					}
				}
				applyDamage(new TypeCollection( { burning: 3 + rand(4) } ), null, target);
			}
				
			if (target.hasStatusEffect("Bleeding"))
			{
				if (target is PlayerCharacter) output("\n\n<b>Your wounds continue to take their toll on your body; " + (target.statusEffectv2("Bleeding") >= 1 ? "your microsugeons working overtime to stem the ongoing damage" : "your microsurgeons have triaged the worst of it, but you'll need proper rest to heal") + ".</b>");
				else output("\n\n<b>" + target.capitalA + possessive(target.uniqueName) + " wounds continue to take a toll on their body; " + (target.statusEffectv2("Bleeding") ? "blood liberally flows from their wounds as they frantically attempt to stem the bleeding." : "the bleeding has finally stopped, but it'd take anybody some rest to properly recover from those kinds of wounds!") + "</b>");
				if (target.statusEffectv2("Bleeding") >= 1)
				{
					target.addStatusValue("Bleeding", 2, -1);
				}
				else
				{
					target.removeStatusEffect("Bleeding");
				}
				applyDamage(damageRand(new TypeCollection( { kinetic: target.statusEffectv1("Bleeding") * target.statusEffectv3("Bleeding") } ), 15), null, target);
			}
	
			if (target.hasStatusEffect("Staggered"))
			{
				if (target.statusEffectv1("Staggered"))
				{
					target.addStatusValue("Staggered", 1, -1);
					if (target is PlayerCharacter) output("\n\n<b>You're still reeling from the force of the blows to which you've been subjected.</b>");
					else output("\n\n<b>" + target.capitalA + target.uniqueName + " is still reeling from the force of the blows to which they've been subject!</b>");
				}
				else
				{
					target.removeStatusEffect("Staggered");
					if (target is PlayerCharacter) output("\n\n<b>You finally shake away the stars from your vision, your [pc.feet] planted on the floor firmly once again.</b>");
					else output("\n\n<b>" + target.capitalA + target.uniqueName + " finally shakes away the cobwebs, their " + target.feet() + " planted firmly on the floor once again.</b>");
				}
			}
	
			// Should never be applicable to non-PCs
			if (target is PlayerCharacter)
			{
				if(!target.hasStatusEffect("Blinded") && target.hasStatusEffect("Quivering Quasar"))
				{
					if(rand(10) == 0) 
					{
						output("\n\n<b>You abruptly go blind, perhaps an effect of the Quivering Quasar you drank.</b>")
						pc.createStatusEffect("Blinded",2,0,0,0,false,"Blind","You're blinded and cannot see! Accuracy is reduced, and ranged attacks are far more likely to miss.",true,0);
					}
				}
			}
			
			if (target.hasStatusEffect("Tripped"))
			{
				if(target.hasPerk("Leap Up"))
				{
					if (target is PlayerCharacter) output("\n\n<b>You roll up onto your [pc.feet] immediately thanks to your quick reflexes.</b>");
					else output("\n\n<b>" + target.capitalA + target.uniqueName + " jumps back onto their " + target.feet() + " almost immediately!</b>");
					target.removeStatusEffect("Tripped");
				}
			}
	
			if (target.hasStatusEffect("Blinded"))
			{
				target.addStatusValue("Blinded",1,-1);
				if (target.statusEffectv1("Blinded") <= 0) 
				{
					target.removeStatusEffect("Blinded");
					if (target is PlayerCharacter) output("\n\n<b>You can see again!</b>");
					else if (target.isPlural) output("\n\n<b>" + target.capitalA + target.uniqueName + " are no longer blinded!</b>");
					else output("\n\n<b>" + target.capitalA + target.uniqueName + " is no longer blind!</b>");
				}
				else if (target.hasPerk("Sharp Eyes") && target.statusEffectv1("Blinded") <= 1) 
				{
					target.removeStatusEffect("Blinded");
					if (target is PlayerCharacter) output("\n\n<b>You can see again!</b>");
					else if (target.isPlural) output("\n\n<b>" + target.capitalA + target.uniqueName + " are no longer blinded!</b>");
					else output("\n\n<b>" + target.capitalA + target.uniqueName + " is no longer blind!</b>");
				}
				else
				{
					if (target is PlayerCharacter) output("\n\n<b>You are blind!</b>");
					else if (target.isPlural) output("\n\n<b>" + target.capitalA + target.uniqueName + " are blind.</b>");
					else output("\n\n<b>" + target.capitalA + target.uniqueName + " is blind.</b>");
				}
			}
	
			if (target.hasStatusEffect("Smoke Grenade")) 
			{
				target.addStatusValue("Smoke Grenade", 1, -1);
				if (target.statusEffectv1("Smoke Grenade") <= 0) 
				{
					target.removeStatusEffect("Smoke Grenade");
					output("\n\n<b>The cloud of smoke finally dissipates!</b>");
				}
				else if (target.hasPerk("Smoke Grenade") && target.statusEffectv1("Blinded") <= 1) 
				{
					target.removeStatusEffect("Smoke Grenade");
					if (target is PlayerCharacter) output("\n\n<b>You can see again!</b>");
					else output("\n\n<b>" + target.capitalA + target.uniqueName + " looks a little more confident in their aim!</b>");
				}
			}
	
			if (target.hasStatusEffect("Paralyzed")) 
			{
				target.addStatusValue("Paralyzed",1,-1);
				if (target.statusEffectv1("Paralyzed") <= 0) 
				{
					target.removeStatusEffect("Paralyzed");
					if (target is PlayerCharacter) output("\n\n<b>The paralytic venom wears off, and you are able to move once more.</b>");
					else output("\n\n<b>The paralysis affecting " + target.a + target.uniqueName + " seems to wear off, motion returning to " + target.mfn("his", "her", "its") + " limbs!</b>");
				}
				else
				{
					if (target is PlayerCharacter) output("\n\n<b>You're paralyzed and unable to move!</b>");
					else output("\n\n<b>" + target.capitalA + target.uniqueName + " is paralyzed and unable to move!</b>");
				}
			}
	
			if(target.hasStatusEffect("Stealth Field Generator"))
			{
				target.addStatusValue("Stealth Field Generator",1,-1);
				if(target.statusEffectv1("Stealth Field Generator") <= 0)
				{
					if (target is PlayerCharacter) output("\n\n<b>Your stealth field generator collapses.</b>");
					else output("\n\n<b>" + target.capitalA + possessive(target.uniqueName) + " stealth drops abruptly!</b>");
					target.removeStatusEffect("Stealth Field Generator");
				}
				else 
				{
					if (target is PlayerCharacter) output("\n\n<b>You are practically invisible thanks to your stealth field generator.</b>");
					else output("\n\n<b>" + target.capitalA + target.uniqueName + " is practically invisible thanks to their stealth field generator.</b>");
				}
			}
	
			if (target.hasStatusEffect("Taking Cover"))
			{
				target.addStatusValue("Taking Cover",1,-1);
				if (target.statusEffectv1("Taking Cover") <= 0)
				{
					target.removeStatusEffect("Taking Cover");
					if (target is PlayerCharacter) output("\n\n<b>You are no longer taking cover!</b>");
					else output("\n\n<b>" + target.capitalA + target.uniqueName + " is no longer taking cover!</b>");
				}
				else 
				{
					if (target is PlayerCharacter) output("\n\n<b>Your enemies will have a hard time hitting you behind your cover!</b>");
					else output("\n\n<b>You'll have a hard time hitting " + target.a + target.uniqueName + " with them hiding behind cover!</b>");
				}
			}
	
			if (target.hasStatusEffect("Deflector Regeneration"))
			{
				target.addStatusValue("Deflector Regeneration",1,-1);
				var temp:Number = target.statusEffectv2("Deflector Regeneration");
				if(temp + target.shields() > target.shieldsMax()) temp = target.shieldsMax() - target.shields();
				if(temp > 0) 
				{
					if (target is PlayerCharacter) output("\n\n<b>You recover " + temp + " points of shielding.</b>");
					else output("\n\n<b>" + target.capitalA + target.uniqueName + " recovers " + temp + " points of shielding!</b>");
					target.shields(temp);
				}
				if(target.statusEffectv1("Deflector Regeneration") <= 0)
				{
					if (target is PlayerCharacter) output("\n\n<b>Your shields are no longer regenerating!</b>");
					else output("\n\n<b>" + target.capitalA + possessive(target.uniqueName) + " shields are no longer regenerating!</b>");
					target.removeStatusEffect("Deflector Regeneration");
				}
			}
	
			if (target.statusEffectv1("Used Smuggled Stimulant") > 0)
			{
				target.addStatusValue("Used Smuggled Stimulant",1,-1);
				target.energy(25);
				if (target is PlayerCharacter) output("\n\n<b>A rush of energy fills you as the smuggled stimulant affects you.</b>");
				else output("\n\n<b>" + target.capitalA + target.uniqueName + " is filled with a sudden rush of energy!</b>");
			}
	
			if (target.hasStatusEffect("Porno Hacked Drone"))
			{
				if(target.shields() > 0)
				{
					target.addStatusValue("Porno Hacked Drone",1,-1);
					if(target.statusEffectv1("Porno Hacked Drone") <= 0)
					{
						if (target is PlayerCharacter) output("\n\n<b>With a grinding click the porn beaming out of your drone snuffs out, finally getting the better of the sexbot’s hacking routine, and returns to your side.</b>");
						else output("\n\n<b>" + target.capitalA + possessive(target.uniqueName) + " drone whirrs slightly, the porn beaming from it snuffing out in short order. Having finally managed to expel the rouge instructions hacked into the thing, it returns to its owners side.</b>");
						target.removeStatusEffect("Porno Hacked Drone");
					}
					else
					{
						//Combat blurb:
						if (target is PlayerCharacter) output("\n\n<b>Your hacked drone continues to fly into your line of sight and near your ear no matter how many times you slap it away, inundating your senses with garish, shifting and teasing smut.</b>");
						else output("\n\n<b>" + target.capitalA + possessive(target.uniqueName) + " hacked drone continues to fly around them, projecting a series of ever lewder smutty visuals directly at " + target.mfn("him", "her", "it") + "!</b>");
						target.lust(4);
					}
				}
			}
			
			if (target.hasStatusEffect("Mimbrane Lust Cloud"))
			{
				if (target is PlayerCharacter)
				{
					target.addStatusValue("Mimbrane Lust Cloud", 2, -1);
					if (target.statusEffectv1("Mimbrane Lust Cloud") <= 0)
					{
						target.removeStatusEffect("Mimbrane Lust Cloud");
						output("\n\n<b>The parasite’s noxious perspiration has faded away.</b>");
					}
					else
					{
						target.lust(5 + rand(10));
						if (target is PlayerCharacter) output("\n\n<b>The parasite's venom is coursing through your veins. Your sexual desire is rising at an alarming rate.</b>");
					}
				}
				else
				{
					kGAMECLASS.cloudDebuffHandler(target);
				}
			}
			
			if (target.hasStatusEffect("Disarmed") && (!(target is Varmint) && !(hasEnemyOfClass(Varmint))))
			{
				target.addStatusValue("Disarmed",1,-1);
				if(target.statusEffectv1("Disarmed") <= 0)
				{
					target.removeStatusEffect("Disarmed");
					if (target is PlayerCharacter) output("\n\n<b>You are no longer disarmed!</b>");
					else if (target.isPlural) output("\n\n<b>" + target.capitalA + target.uniqueName + " are no longer disarmed!</b>");
					else output("\n\n<b>" + target.capitalA + target.uniqueName + " is no longer disarmed!</b>\n");
				}
				else 
				{
					if (target is PlayerCharacter) output("\n\n<b>You are disarmed and cannot use weapon based attacks.</b>");
					else if (target.isPlural) output("\n\n<b>" + target.capitalA + target.uniqueName + " are disarmed.</b>");
					else output("\n\n<b>" + target.capitalA + target.uniqueName + " is disarmed.</b>");
				}
			}
	
			if (target.hasStatusEffect("Combat Drone Disabled"))
			{
				target.addStatusValue("Combat Drone Disabled", 1, -1);
				if (target.statusEffectv1("Combat Drone Disabled") <= 0)
				{
					target.removeStatusEffect("Combat Drone Disabled");
					if (target.hasCombatDrone())
					{
						if (target is PlayerCharacter)
						{
							if(target.hasStatusEffect("Varmint Buddy")) output("\n\n<b>A loud howl alerts you that your pet varmint has fully recovered. It quickly shakes itself awake and leaps back to your side, gnashing its razor-sharp teeth at the enemy.</b>");
							else output("\n\n<b>There’s a familiar and welcome sound of whirring servos above you. Your righted drone moves back down to your side to aid you.</b>");
						}
						else output("\n\n<b>A telling hum returns to the battlefield. " + target.capitalA + possessive(target.uniqueName) + " combat drone returns to the fold!</b>");
					}
				}
			}
	
			// Annoquest stuffs
	
			if (target.hasStatusEffect("Sensor Link"))
			{
				target.addStatusValue("Sensor Link", 1, -1);
				if (target.statusEffectv1("Sensor Link") <= 0)
				{
					target.removeStatusEffect("Sensor Link");
					target.aimMod -= 5;
					if (target is PlayerCharacter) output("\n\n<b>Your equipments connection to Anno's wanes as combat draws on, your improved accuracy diminishing.</b>");
					else output("\n\n<b>" + target.capitalA + possessive(target.uniqueName) + " equipment interlink wanes, the extra assistance diminishing!</b>");
				}
			}
	
			if (target.hasStatusEffect("HP Boost CD"))
			{
				target.addStatusValue("HP Boost CD", 1, -1);
				if (target.statusEffectv1("HP Boost CD") <= 0)
				{
					target.removeStatusEffect("HP Boost CD");
				}
			}
	
			if(target.hasStatusEffect("Evasion Boost"))
			{
				target.addStatusMinutes("Evasion Boost",-1);
				if(target.getStatusMinutes("Evasion Boost") <= 0)
				{
					if (target.isPlural) output("\n\n<b>" + target.capitalA + target.uniqueName + " no longer have boosted evasion!</b>");
					else if (target is PlayerCharacter) output("\n\n<b>Your limbs feel heavier, slower than they were a moment ago. Your boosted evasion has worn off!</b>");
					else output("\n\n<b>" + target.capitalA + target.uniqueName + " no longer has boosted evasion!</b>");
					target.removeStatusEffect("Evasion Boost");
				}
			}
		
			if (target.hasStatusEffect("Resolve"))
			{
				target.addStatusValue("Resolve",1,-1);
				if (target.statusEffectv1("Resolve") <= 0)
				{
					target.removeStatusEffect("Resolve");
					output("\n\n<b>" + target.capitalA + target.uniqueName + " is no longer resolved!</b>");
					target.baseHPResistances.tease.resistanceValue -= 100;
					target.baseHPResistances.drug.resistanceValue -= 50;
					target.baseHPResistances.pheromone.resistanceValue -= 50;
				}
				else
				{
					output("\n\n<b>" + target.capitalA + target.uniqueName + " has a resolved, steely look in " + target.mfn("his","her","its") + " eyes!</b>");
				}
			}
		
			if (target.hasStatusEffect("Lust Stunned"))
			{
				target.addStatusValue("Lust Stunned",1,-1);
				if (target.statusEffectv1("Lust Stunned") <= 0)
				{
					target.removeStatusEffect("Lust Stunned");
				}
			}
		
			// This is basically irrelevent now-
			// NPCs use the same method (doStunRecover) as the player to recover from stunned effects
			// automatically.
			
			/*
			if (target.hasStatusEffect("Stunned"))
			{
				if (target.hasStatusEffect("Lust Stunned")) output("<b>Your teasing has the poor " + target.mfn("boy", "girl", "thing") + " in a shuddering mess as " + target.mfn("he", "she", "it") +" tries to regain control of " + target,mfn("his", "her", "its") + " lust addled nerves.</b>\n");
				else if (target.plural) output("<b>" + target.capitalA + target.short + " are stunned and unable to act!</b>\n");
				else output("<b>" + target.capitalA + target.short + " is stunned and unable to act!</b>\n");
			}
			*/
		
			/**
			 * TODO: Ensure this is wrapped up properly somehow!
			 */
			if (target.hasStatusEffect("Gray Goo Clone"))
			{
				var lFailed:Boolean = false;
				
				if ((target as Creature).isLustImmune == true) lFailed = true;
				if ((target as Creature).getLustResistances().tease.resistanceValue >= 100.0) lFailed = true;
				
				if (!lFailed)
				{
					var lDamage:TypeCollection = new TypeCollection( { tease: 5 + rand(3) } );
					var dResult:DamageResult = applyDamage(lDamage, pc, target, "suppress");
				}
				
				output("\n\n[goo.name] dances around, flashing plenty of tits and ass for " + target.a + target.uniqueName + ".");
				if (lFailed || (dResult && (dResult.lustDamage <= 0 || dResult.lustResisted)))
				{
					output(" " + target.capitalA + target.uniqueName + " looks on, clearly unimpressed.");
				}
				else
				{
					output(" " + target.capitalA + target.uniqueName + " stares mesmerized at [goo.name]'s dance, flushing with lust.");
				}
				
				if (!lFailed)
				{
					outputDamage(dResult);
				}
			}
		}
		
		public function updateStatusEffects(collection:Array):void
		{
			for (var i:int = 0; i < collection.length; i++)
			{
				updateStatusEffectsFor(collection[i]);
			}
		}
		
		public function showCombatMenu():void
		{
			displayFightLocation();
			displayBusts();
			//removeAllButtonHighlights();
			
			if (!doneRoundActions())
			{
				// do anything that only happens once per round here.
				if (hasEnemyOfClass(CaptainKhorganMech)) kGAMECLASS.updateKhorganMechCover();
				if (hasEnemyOfClass(GardeBot))
				{
					kGAMECLASS.setEnemy(_hostiles[0]);
					kGAMECLASS.updateGardeBotCover();
					kGAMECLASS.setEnemy(null);
				}
				// updateCombatStatuses(); // Status effects are handled during action-resolution (ie after the player takes an action)
			}
			
			clearOutput();
			clearMenu();
			
			showCombatUI();
			
			if (checkForVictory()) return;
			if (checkForLoss())
			{
				// Special output for instantly losing a fight
				if (roundCounter == 1)
				{
					if (pc.lust() >= pc.lustMax())
					{
						clearOutput();
						output("<b>It’s no use - you’re simply too turned on to fight back right now!</b>");
					}
					else
					{
						clearOutput();
						output("<b>It’s no use - you’re simply too worn out to fight back right now!</b>");
					}
				}
				return;
			}
			
			showCombatDescriptions();
			generateCombatMenu();
			
			_initForRound = _roundCounter;
		}
		
		/**
		 * Generate the actual button elements for the combat menu
		 */
		private function generateCombatMenu():void
		{
			clearMenu();
			if (hasEnemyOfClass(Celise))
			{
				if (roundCounter == 1) addButton(0, "Attack", selectSimpleAttack, CombatAttacks.MeleeAttack);
				else if (roundCounter == 2) addButton(1, StringUtil.upperCase(pc.rangedWeapon.attackVerb), selectSimpleAttack, CombatAttacks.RangedAttack);
				else
				{
					if (pc.biggestTitSize() > 2) addButton(5, "Tease", function():void {
						clearOutput();
						chestTeaseText(_hostiles[0]);
						processCombat();
					});
					else addButton(5, "Tease", function():void {
						clearOutput();
						crotchTeaseText(_hostiles[0]);
						processCombat();
					});
				}
				return;
			}
			
			if (pc.hasStatusEffect("Stunned") || pc.hasStatusEffect("Paralyzed"))
			{
				if (pc.hasStatusEffect("Stunned")) output("\n<b>You're still stunned!</b>");
				addButton(0, "Recover", doStunRecover, pc);
				return;
			}
			
			if (pc.hasStatusEffect("Naleen Coiled") || pc.hasStatusEffect("Mimbrane Smother") || pc.hasStatusEffect("Grappled"))
			{
				if (pc.hasStatusEffect("Naleen Coiled"))
				{
					output("\n<b>You are wrapped up in coils!</b>");
				}
				else if (pc.hasStatusEffect("Mimbrane Smother"))
				{
					output("\n<b>You are being smothered by a Mimbrane!</b>");
				}
				else
				{
					output("\n<b>You are grappled and unable to fight normally!</b>");
				}
				
				addButton(0, "Struggle", doStruggleRecover, pc);
				
				if (pc.hasPerk("Static Burst") && (!hasEnemyOfClass(NyreaAlpha) && !hasEnemyOfClass(NyreaBeta)))
				{
					if(pc.shields() <= 0) addDisabledButton(3,"StaticBurst","StaticBurst","You need shields available to overload in order for static burst to function.");
					else if(pc.energy() >= 5) addButton(3,"StaticBurst", doStaticBurst);
					else addDisabledButton(3,"StaticBurst");
				}
				
				if (hasEnemyOfClass(Kaska))
				{
					addButton(10, "Nip-Pinch", kGAMECLASS.pinchKaskaNipple, undefined, "Nip-Pinch", "Maybe pinching Kaska's nipple will get her to release you.");
				}
				
				addButton(4, "Do Nothing", waitRound);
				return;
			}
			
			// attack
			if (hasEnemyOfClass(Varmint) && pc.hasKeyItem("Lasso"))
			{
				addButton(0, "Lasso", selectSimpleAttack, kGAMECLASS.lassoAVarmint, "Lasso", "Use this lasso you've been provided with to properly down this varmint.");
			}
			else
			{
				var af:Function = pc.meleeWeapon.attackImplementor == null ? CombatAttacks.MeleeAttack : pc.meleeWeapon.attackImplementor;
				addButton(0, "Attack", selectSimpleAttack, { func: af, isMelee: true }, "Attack", "Attack a single enemy with a melee strike. Damage is based on physique.");
			}
			
			// shoot
			var sf:Function = pc.rangedWeapon.attackImplementor == null ? CombatAttacks.RangedAttack : pc.rangedWeapon.attackImplementor;
			addButton(1, StringUtil.upperCase(pc.rangedWeapon.attackVerb), selectSimpleAttack, { func: sf, isRanged: true }, "Ranged Attack", "Attack a single enemy with a ranged weapon. Damage is based on aim.");
			
			//
			// inventory
			addButton(3, "Inventory", kGAMECLASS.inventory, undefined, "Inventory", "Use items in combat.");
			// specials
			addButton(4, "Specials", generateSpecialsMenu, undefined, "Specials", "The special attacks you have available to you are listed in this menu.");
			
			// tease
			if (pc.hasStatusEffect("Myr Venom Withdrawal")) addDisabledButton(5, "Tease", "Tease", "Without the venom, teasing just seems... fruitless.");
			else addButton(5, "Tease", selectSimpleAttack, { func: generateTeaseMenu }, "Tease Menu", "Opens up your menu of available lust-targeting attacks. It is recommended that the ‘Sense’ option be used beforehand.");
			
			// sense
			addButton(6, "Sense", selectSimpleAttack, { func: generateSenseMenu }, "Sense", "Attempts to get a feel for a foe's likes and dislikes. Absolutely critical for someone who plans on seducing " + pc.mf("his", "her") + " way out of a fight.");
			
			// wait
			addButton(8, "Wait", waitRound, undefined, "Wait", "There's no real reason to this unless you're just dragging out combat to see what your enemy will do.");
			// fantasize
			addButton(9, "Fantasize", fantasizeRound, undefined, "Fantasize", "Fantasize about your foe until you're helpless and on your [pc.knees] before them.");
			
			// trip
			if (pc.hasStatusEffect("Tripped")) addButton(10, "Stand Up", standupRound, undefined, "Stand Up", "Stand up, getting rid of the \"Trip\" status effect. This will consume your offensive action for this turn.");
			
			//
			//
			//
			// run
			if (pc.hasStatusEffect("Cockvine Grip") && pc.statusEffectv1("Cockvine Grip") > 0)
			{
				if (pc.hasPerk("Static Burst"))
				{
					if (pc.shields() <= 0) addDisabledButton(3,"StaticBurst","StaticBurst","You need shields available to overload in order for static burst to function.");
					else if (pc.energy() >= 5) addButton(3, "Static Burst", doStaticBurst);
					else addDisabledButton(3, "Static Burst");
				}
				
				addButton(14, "Struggle", kGAMECLASS.adultCockvineStruggleOverride, undefined, "Struggle", "Struggle free of the Cockvines crushing grip.");
			}
			else
			{
				addButton(14, "Run", runAway, undefined, "Run", "Attempt to run away from your enemy. Success is greatly dependant on reflexes. Immobilizing your enemy before attempting to run will increase the odds of success.");
			}
			
			// Hook in any additional menu entries -- allowing the hooks to override
			// default entries
			additionalCombatMenuEntries();
		}
		
		private function waitRound():void
		{
			clearOutput();
			if (pc.hasStatusEffect("Grappled"))
			{
				if (hasEnemyOfClass(Kaska)) kGAMECLASS.doNothingWhileTittyGrappled();
				else if (hasEnemyOfClass(GrayPrime)) kGAMECLASS.grayPrimeFailEscape();
				else if (hasEnemyOfClass(MaidenVanae) || hasEnemyOfClass(HuntressVanae)) kGAMECLASS.vanaeWaitWhilstGrappled();
				else output("You choose not to act.");
				processCombat();
			}
			else if (_hostiles.length == 1 && _hostiles[i] is CrystalGooT1 && (_hostiles[i] as CrystalGooT1).ShouldIntercept())
			{
				(_hostiles[i] as CrystalGooT1).SneakSqueezeAttackReaction( { isWait: true } );
			}
			else
			{
				output("You choose not to act.");
				processCombat();
			}
		}
		
		private function fantasizeRound():void
		{
			clearOutput();
			
			if (_hostiles.length == 1 && _hostiles[i] is CrystalGooT1 && (_hostiles[i] as CrystalGooT1).ShouldIntercept())
			{
				(_hostiles[i] as CrystalGooT1).SneakSqueezeAttackReaction( { isFantasize: true } );
			}
			else
			{
				output("You decide you'd rather fantasize than fight back at this point. Why bother when your enem");
				if(enemiesAlive() > 1) output("ies are");
				else output("y is");
				output(" so alluring?");
				pc.lust(20+rand(20));
				processCombat();	
			}
		}
		
		private function standupRound():void
		{
			clearOutput();
			//RASK DUDEPILE BE SPECUAL
			if (hasEnemyOfClass(RaskvelMale))
			{
				//Get back up
				if(!pc.hasStatusEffect("Raskvel Pile"))
				{
					output("Quickly you heave yourself back on your [pc.feet], dusting yourself down with a scowl.");
					pc.removeStatusEffect("Tripped");
					pc.removeStatusEffect("Raskvel Pile");
				}
				//Get back up under pile on:
				if(pc.physique() + pc.statusEffectv1("Raskvel Pile") >= 30)
				{
					output("You tense yourself up and with a sudden upward heave send the raskvel flying off you. You scramble back on your [pc.feet], feeling intense relief from escaping that suffocating helplessness.");
					pc.removeStatusEffect("Tripped");
					pc.removeStatusEffect("Raskvel Pile");
				}
				//Fail to get back up under pile on:
				else
				{
					output("You try and elbow your way back up and duly collapse straight back into the dirt again. These little bastards are heavy!");
					pc.addStatusValue("Raskvel Pile",1,10);
				}
			}
			//GENERIC
			else
			{
				output("You climb up onto your [pc.feet].");
				pc.removeStatusEffect("Tripped");
			}
			processCombat();
		}
		
		private function doTripRecover(target:Creature):void
		{
			if (target.hasStatusEffect("Tripped"))
			{
				output(target.capitalA + target.uniqueName + " lifts themselves from the floor and gets their feet back under " + target.mfn("him", "her", "it") + "self.");
				target.removeStatusEffect("Tripped");
			}
		}
		
		private function runAway():void
		{
			clearOutput();
			output("You attempt to flee from your opponent");
			if (hasEnemyOfClass(QueenOfTheDeep))
			{
				output(", but you don't have a lot of options down here!");
				processCombat();
				return;
			}
			if(CombatManager.multipleEnemies()) output("s");
			output("! ")
			//Autofail conditions first!
			if(pc.isImmobilized()) {
				output("You cannot run while you are immobilized!");
				processCombat();
			}
			else if (isFleeDisabled()) {
				output("<b>You cannot escape from this fight!</b>");
				processCombat();
			}
			else if (kGAMECLASS.debug)
			{
				output("You escape on wings of debug!");
				CombatManager.abortCombat();
			}
			else 
			{
				// TODO rework this somehow
				
				var x:int = 0;
				//determine difficulty class based on reflexes vs reflexes comparison, easy, low, medium, hard, or very hard
				var difficulty:int = 0;
				//easy = succeed 75%
				//low = succeed 50%
				//medium = succeed 35%
				//hard = succeed 20;
				//very hard = succeed 10%
				//Easy: PC has twice the reflexes
				if(pc.reflexes() >= _hostiles[0].reflexes() * 2) difficulty = 0;
				//Low: PC has more than +33% more reflexes
				else if(pc.reflexes() >= _hostiles[0].reflexes() * 1.333) difficulty = 1;
				//Medium: PC has more than -33% reflexes
				else if(pc.reflexes() >= _hostiles[0].reflexes() * .6666) difficulty = 2;
				//Hard: PC pretty slow
				else if(pc.reflexes() >= _hostiles[0].reflexes() * .3333) difficulty = 3;
				//Very hard: PC IS FUCKING SLOW
				else difficulty = 4;

				//Multiple NPCs? Raise difficulty class for each one!
				difficulty += _hostiles.length - 1;
				//Raise difficulty for having awkwardly huge genitalia/boobs sometime! TODO!
				if(pc.ballDiameter() >= 9) difficulty++;
				if(pc.ballDiameter() >= 18) difficulty++;

				//Cap it
				if(difficulty > 5) difficulty = 5;

				//Lower difficulty for flight if enemy cant!
				if(pc.canFly() && (!_hostiles[0].canFly() || _hostiles[0].isImmobilized())) difficulty--;
				//Lower difficulty for immobilized foe
				if(_hostiles[0].isImmobilized()) difficulty--;
				//Easy mode is magic!
				if(kGAMECLASS.easy)
				{
					if(difficulty > 0) difficulty--;
					if(difficulty > 0) difficulty--;
					if(difficulty > 0) difficulty--;
				}		

				//Set threshold value and check!
				if(difficulty < 0) difficulty = 100;
				else if(difficulty == 0) difficulty = 75;
				else if(difficulty == 1) difficulty = 50;
				else if(difficulty == 2) difficulty = 35;
				else if(difficulty == 3) difficulty = 20;
				else if(difficulty == 4) difficulty = 10;
				else difficulty = 5;
				trace("Successful escape chance: " + difficulty + " %")
				//Success!
				if (rand(100) + 1 <= difficulty) {
					if (hasEnemyOfClass(Cockvine))
					{
						kGAMECLASS.adultCockvinePCEscapes();
						CombatManager.abortCombat();
						return;
					}
					if (pc.canFly()) 
					{
						if (pc.legCount == 1) output("Your [pc.foot] leaves");
						else output("Your [pc.feet] leave");
						output(" the ground as you fly away, leaving the fight behind.");
					}
					else output("You manage to leave the fight behind you.")
					kGAMECLASS.processTime(8);
					CombatManager.abortCombat();
				}
				else {
					output("It doesn’t work!");
					processCombat();
				}
			}
		}
		
		private function doStaticBurst():void
		{
			clearOutput();
			pc.energy(-5);
			output("You release a discharge of electricity, momentarily weakening your ");
			if(_hostiles[0].isPlural || enemiesAlive() > 1) output("foes'");
			else output("foe's");
			output(" grip on you!");
			if (pc.hasStatusEffect("Naleen Coiled"))
			{
				pc.removeStatusEffect("Naleen Coiled");
				output("\nThe naleen's tail spasms as you easily slip out of its coils.");
			}
			if(pc.hasStatusEffect("Grappled"))
			{
				pc.removeStatusEffect("Grappled");
				output("\nYou slip free of the grapple.");
			}
			if (pc.hasStatusEffect("Cockvine Grip"))
			{
				pc.addStatusValue("Cockvine Grip", 1, -2);
				if (pc.statusEffectv1("Cockvine Grip") < 0) pc.setStatusValue("Cockvine Grip", 1, 0);
			}
			if(hasEnemyOfClass(MaidenVanae) || hasEnemyOfClass(HuntressVanae))
			{
				pc.removeStatusEffect("Tripped");
			}
			processCombat();
		}
		
		private function doStunRecover(target:Creature):void
		{
			if (target.hasStatusEffect("Stunned"))
			{
				if (target is PlayerCharacter) clearOutput();
				
				target.addStatusValue("Stunned", 1, -1);
				
				if (target.statusEffectv1("Stunned") <= 0)
				{
					target.removeStatusEffect("Stunned");
					if (target is PlayerCharacter) output("You manage to recover your wits and adopt a fighting stance!");
					else if (!target.isPlural) output(target.capitalA + target.uniqueName + " manages to recover " + target.mfn("his","her","its") + " wits and adopt a fighting stance!");
					else output(target.capitalA + target.uniqueName + " manage to recover their wits and adopt a fighting stance!");
				}
				else
				{
					if (target is PlayerCharacter) output("You're still too stunned to act!");
					else
					{
						if (!target.hasStatusEffect("Lust Stunned"))
						{
							if (!target.isPlural) output(target.capitalA + target.uniqueName + " is still too stunned to act!");
							else output(target.capitalA + target.uniqueName + " are still too stunned to act!");
						}
						else
						{
							output("<b>Your teasing has the poor " + target.mfn("boy", "girl", "thing") + " in a shuddering mess as " + target.mfn("he", "she", "it") +" tries to regain control of " + target.mfn("his", "her", "its") + " lust addled nerves.</b>");
						}
					}
				}
			}
			
			if (target.hasStatusEffect("Paralyzed"))
			{
				if (target is PlayerCharacter) clearOutput();
				
				if (target.statusEffectv1("Paralyzed") <= 1) output("The venom seems to be weakening, but you can't move yet!");
				else output("You try to move, but just can't manage it!");
			}
	
			if (target is PlayerCharacter) processCombat();
		}
		
		private function doStruggleRecover(target:Creature):void
		{
			// TODO Tweak the shit out of this probably for other NPCs to be able to call into it			
			if (target is PlayerCharacter) clearOutput();
			else if (target is Anno)
			{
				(target as Anno).grappleStruggle();
			}
			
			if (hasEnemyOfClass(Cockvine))
			{
				// TODO pull this in!
				kGAMECLASS.adultCockvineStruggleOverride();
				return;
			}
			// Naleen coil grapple text
			else if (hasEnemyOfClass(Naleen) || hasEnemyOfClass(NaleenMale))
			{
				if(target.hasPerk("Escape Artist"))
				{
					if(target.reflexes() + rand(20) + 6 + target.statusEffectv1("Naleen Coiled") * 5 > 24) {
						output("You display a remarkable amount of flexibility as you twist and writhe through the coils to freedom.");
						target.removeStatusEffect("Naleen Coiled");
					}
				}
				else 
				{
					if(target.physique() + rand(20) + 1 + target.statusEffectv1("Naleen Coiled") * 5 > 24) {
						output("With a mighty heave, you tear your way out of the coils and onto your [pc.feet].");
						target.removeStatusEffect("Naleen Coiled");
					}
				}
				//Fail to escape: 
				if(target.hasStatusEffect("Naleen Coiled"))
				{
					if(CombatManager.hasEnemyOfClass(Naleen)) output("You groan in pain, struggling madly to escape the brutal confines of the naleen's coils. She grins down at you with a feral look in her eyes....");
					else output("You groan in pain, struggling madly to escape the brutal confines of the naleen's coils. He grins down at you with a predatory glint in his eye, baring his fangs....");
					target.addStatusValue("Naleen Coiled",1,1);
				}
			}
			// Mimbrane grapplestruggle
			else if (hasEnemyOfClass(Mimbrane))
			{
				if (target.hasPerk("Escape Artist"))
				{
					if (target.reflexes() + rand(10) > target.statusEffectv1("Mimbrane Smother") * 5)
					{
						output("You keep your cool, calmly feeling around the edges of the parasite attached to your face and manage to find a weakness in its hold; working your fingers into the small imperfection in the Mimbranes seal around your features, you manage to pry it away from you.");
						target.removeStatusEffect("Mimbrane Smother");
					}
				}
				else
				{
					if (target.physique() + rand(10) > target.statusEffectv1("Mimbrane Smother") * 5)
					{
						output("You manage to force your fingers under the edge of the Mimbrane smothering you, and forcefully tear it away from your face.");
						target.removeStatusEffect("Mimbrane Smother");
					}
				}
				
				// Failure to escape
				if (target.hasStatusEffect("Mimbrane Smother"))
				{
					// lust tick
					target.lust(10 + target.libido()/10);

					//{fail to escape 1} 
					if (target.statusEffectv1("Mimbrane Smother") == 0)
					{
						output("Your hands fail to find purchase on the slippery surface of your aggressor. The Mimbrane continues squeezing and sliding against your head.");
						target.setStatusValue("Mimbrane Smother", 1, 1);
					}
					//{fail to escape 2} 
					else if (target.statusEffectv1("Mimbrane Smother") == 1)
					{
						output("The Mimbrane’s advance over you puts you into a slight daze, overpowered by the artificial desire being forced upon you. You snap back to your senses and resume your struggle to free yourself.")
						target.setStatusValue("Mimbrane Smother", 1, 2);
					}
					//{defeated} 
					else if (target.statusEffectv1("Mimbrane Smother") == 2)
					{
						output("The aphrodisiacal rag around your head proves to be too much, dissolving the last of your will and dropping you to your [pc.knees]. You breathe heavily, sucking in increasing amounts of the parasite’s infatuating perspiration and causing its skin to compress and inflate over your mouth. Sensing your defeat, the Mimbrane slowly unfurls from your head. Lines of oily sweat snap apart as the parasite peels off of you. It sizes up its prize, deciding how to proceed.");
						target.lust(target.lustMax(), true);
					}
				}
			}
			// Standard grapple text
			else
			{
				if (target.hasPerk("Escape Artist") && target.reflexes() >= target.physique())
				{
					if (target.reflexes() + rand(20) + 7 + target.statusEffectv1("Grappled") * 5 > target.statusEffectv2("Grappled"))
					{
						if (hasEnemyOfClass(SexBot)) output("You almost dislocate an arm doing it, but, ferret-like, you manage to wriggle out of the sexbot’s coils. Once your hands are free, the droid does not seem to know how to respond, and you are able to grapple the rest of your way out easily, ripping away from its molesting grip. The sexbot clicks and stutters a few times before going back to staring at you blankly, swinging its fibrous limbs over its head.");
						else if (hasEnemyOfClass(MaidenVanae) || hasEnemyOfClass(HuntressVanae)) kGAMECLASS.vanaeEscapeGrapple("Escape Artist");
						else output("You display a remarkable amount of flexibility as you twist and writhe to freedom.");
						target.removeStatusEffect("Grappled");
					}
				}
				else
				{
					if(target.physique() + rand(20) + 6 + target.statusEffectv1("Grappled") * 5 > target.statusEffectv2("Grappled"))
					{
						// TODO It might be an idea to do something similar to how drone targets work now, in that the actual
						// enemy DOING the grappling is stored as a transient property on the victim of the grapple,
						// allowing us to extract this information
						// The same will also be said of the grapler in instances where grapples can happen with multiple
						// enemies- we'll need to know which one, specifically, is out of action for other attacks
						
						if (hasEnemyOfClass(SexBot)) output("You almost tear a muscle doing it, but, you manage to heave apart the sexbot’s coils. Once your hands are free, the droid does not seem to know how to respond, and you are able to grapple the rest of your way out easily, ripping away from its molesting grip. The sexbot clicks and stutters a few times before going back to staring at you blankly, swinging its fibrous limbs over its head.");
						else if (hasEnemyOfClass(MaidenVanae) || hasEnemyOfClass(HuntressVanae)) kGAMECLASS.vanaeEscapeGrapple();
						else if (hasEnemyOfClass(GrayPrime)) kGAMECLASS.grayPrimeEscapeGrapple();
						else if (hasEnemyOfClass(NyreaAlpha) || hasEnemyOfClass(NyreaBeta)) output("You pull and heave at the thick, knotted ropes of the nyrea's net, finally managing to pry a gap large enough for you to squeeze your frame through!");
						//else if (enemy is GoblinGadgeteer) output("You manage to untangle your body from the net, and prepare to fight the goblin again.");
						else if (hasEnemyOfClass(Goocubator))
						{
							output("You manage to tear yourself out of the goo’s grasp, wrenching your limbs free one by one. She squeals as you pop yourself out of her, eyes crossing as her whole body quakes with the aftershocks.");
							output("\n\n<i>“Aww, why do you have to be that way?”</i> she pouts, wiggling away from you.");
						}
						else output("With a mighty heave, you tear your way out of the grapple and onto your [pc.feet].");
						target.removeStatusEffect("Grappled");
					}
				}
				
				// Failure to escape grapple
				if(target.hasStatusEffect("Grappled"))
				{
					if(hasEnemyOfClass(SexBot)) output("You struggle as hard as you can against the sexbot’s coils but the synthetic fiber is utterly unyielding.");
					else if (hasEnemyOfClass(Kaska)) kGAMECLASS.failToStruggleKaskaBoobs();
					else if (hasEnemyOfClass(MaidenVanae) || hasEnemyOfClass(HuntressVanae)) output("You wriggle in futility, helpless as she lubes you up with her sensuous strokes. This is serious!");
					else if (hasEnemyOfClass(GrayPrime)) kGAMECLASS.grayPrimeFailEscape();
					else if (hasEnemyOfClass(NyreaAlpha) || hasEnemyOfClass(NyreaBeta)) output("Try as you might, struggling against the heavy ropes of the nyrea huntresses net, you just can't find a way out of the net that has you restrained.");
					//else if (enemy is GoblinGadgeteer) output("You manage to untangle your body from the net, and prepare to fight the goblin again.");
					else output("You struggle madly to escape from the pin but ultimately fail. The pin does feel a little looser as a result, however.");
					target.addStatusValue("Grappled",1,1);
				}
			}
			if (target is PlayerCharacter) processCombat();
		}
		
		private function generateSpecialsMenu():void
		{
			clearMenu();
			var attacks:Array = CombatAttacks.GetAttacksFor(pc);
			
			var bOff:int = 0;
			for (var i:int = 0; i < attacks.length; i++)
			{
				var atk:SingleCombatAttack = attacks[i] as SingleCombatAttack;
				if (atk.IsAvailable(pc))
				{
					addButton(bOff, atk.ButtonName, selectAttack, atk, atk.TooltipTitle, atk.TooltipBody);
				}
				else
				{
					addDisabledButton(bOff, atk.ButtonName, atk.TooltipTitle, atk.TooltipBody);
				}
				bOff++;
			}
			
			// Special shits
			if (pc.armor is GooArmor)
			{
				if (!pc.hasStatusEffect("Reduced Goo"))
				{
					addButton(bOff, "Goo Clone", selectSimpleAttack, kGAMECLASS.pcGooClone, "Goo Clone", "Have [goo.name] hop off and start teasing your enemy. Reduces your armor value, but inflicts lust over time.");
				}
				else
				{
					addButton(bOff, "Recall Goo", kGAMECLASS.pcRecallGoo, undefined, "Recall Goo", "Call [goo.name] back to you, restoring your gooey armor.");
				}
				bOff++;
			}
			
			// TODO sort pages and shit
			addButton(14, "Back", generateCombatMenu);
		}
		
		private function selectAttack(atk:SingleCombatAttack):void
		{
			if (!atk.RequiresTarget)
			{
				clearOutput();
				atk.execute(_friendlies, _hostiles, pc, null);
				processCombat();
				return;
			}
			
			var t:Creature = null;
			
			if (_hostiles.length == 1)
			{
				t = _hostiles[0];
			}
			else if (enemiesAlive() == 1)
			{
				for (var i:int = 0; i < _hostiles.length; i++)
				{
					if (!_hostiles[i].isDefeated())
					{
						t = _hostiles[i];
						break;
					}
				}
			}
			
			if (t == null)
			{
				selectTarget(atk);
			}
			else
			{
				clearOutput();
				clearMenu();
				
				atk.execute(_friendlies, _hostiles, pc, t);
				processCombat();
			}
		}
		
		private function selectTarget(atk:SingleCombatAttack):void
		{	
			clearMenu();
			
			var bOff:int = 0;
			for (var i:int = 0; i < _hostiles.length; i++)
			{
				if (!_hostiles[i].isDefeated())
				{
					addButton(bOff, (_hostiles[i] as Creature).buttonText, executeAttack, { attack: atk, tar: _hostiles[i] } );
					bOff++;
				}
			}
			
			addButton(14, "Back", generateCombatMenu);
		}
		
		private function executeAttack(opts:Object):void
		{
			clearOutput();
			clearMenu();
			
			opts.attack.execute(_friendlies, _hostiles, pc, opts.tar);
			
			processCombat();
		}
		
		public function selectSimpleAttack(attackOpts:Object):void
		{
			var t:Creature = null;
			
			if (_hostiles.length == 1)
			{
				t = _hostiles[0];
			}
			else if (enemiesAlive() == 1)
			{
				for (var i:int = 0; i < _hostiles.length; i++)
				{
					if (!_hostiles[i].isDefeated())
					{
						t = _hostiles[i];
						break;
					}
				}
			}
			
			if (t == null)
			{
				selectSimpleTarget(attackOpts);
			}
			else
			{
				attackOpts.tar = t;
				executeSimpleAttack(attackOpts);
			}
		}
		
		public function selectSimpleTarget(attackOpts:Object):void
		{
			clearMenu();
			
			var bOff:int = 0;
			for (var i:int = 0; i < _hostiles.length; i++)
			{
				if (!_hostiles[i].isDefeated())
				{
					addButton(bOff, (_hostiles[i] as Creature).buttonText, executeSimpleAttack, attackOpts );
					bOff++;
				}
			}
			
			addButton(14, "Back", generateCombatMenu);
		}
		
		private function executeSimpleAttack(opts:Object):void
		{
			clearOutput();
			clearMenu();
			
			kGAMECLASS.setTarget(opts.tar);
			kGAMECLASS.setAttacker(pc);
			kGAMECLASS.setEnemy(opts.tar);
			
			if (opts.tar is CrystalGooT1 && (target as CrystalGooT1).ShouldIntercept())
			{
				(opts.tar as CrystalGooT1).SneakSqueezeAttackReaction(opts);
			}
			else
			{
				opts.func(pc, opts.tar);
			}
			
			// Hacky workaround to defer process combat for special cases.
			if (opts.func != generateTeaseMenu && opts.func != generateSenseMenu)
			{
				processCombat();
			}
		}
		
		private function generateTeaseMenu(attacker:Creature, target:Creature):void
		{
			if (target is Celise)
			{
				clearOutput();
				output("You put a hand on your hips and lewdly expose your groin, wiggling to and fro in front of the captivated goo-girl.");
				processCombat();
				return;
			}
	
			clearOutput();
			output("Which tease will you use?");
			if (flags["TIMES_CHEST_TEASED"] == undefined) flags["TIMES_CHEST_TEASED"] = 0;
			if (flags["TIMES_HIPS_TEASED"] == undefined) flags["TIMES_HIPS_TEASED"] = 0;	
			if (flags["TIMES_BUTT_TEASED"] == undefined) flags["TIMES_BUTT_TEASED"] = 0;
			if (flags["TIMES_CROTCH_TEASED"] == undefined) flags["TIMES_CROTCH_TEASED"] = 0;
			
			var teases:Array = [
				flags["TIMES_BUTT_TEASED"],
				flags["TIMES_CHEST_TEASED"],
				flags["TIMES_CROTCH_TEASED"],
				flags["TIMES_HIPS_TEASED"]
			];
			
			for(var i:int = 0; i < teases.length; i++) 
			{ 
				if(teases[i] > 100) teases[i] = 100;
			}
			
			output("\nAss tease skill: " + teases[0] + "/100");
			output("\nChest tease skill: " + teases[1] + "/100");
			output("\nCrotch tease skill: " + teases[2] + "/100");
			output("\nHips tease skill: " + teases[3] + "/100");
			
			output("\n\nYour ability at a tease can increase both its success rate and total damage.");
		
			clearMenu();
			addButton(0, "Ass", teaseButt, target, "Ass Tease", "Use your [pc.butt] to tease your enemy.");
			
			addButton(1, "Chest", teaseChest, target, "Chest Tease", "Use your [pc.chest] to tease your enemy.");
			
			if (pc.hasCock() || pc.hasVagina()) addButton(2, "Crotch", teaseCrotch, target, "Crotch Tease", "Use your [pc.crotch] to tease your enemy.");
			else addDisabledButton(2, "Crotch");
		
			addButton(3, "Hips", teaseHips, target, "Hips Tease", "Use your [pc.hips] to tease your enemy.");
			
			if ((InCollection(pc.milkType, GLOBAL.FLUID_TYPE_VANAE_MAIDEN_MILK, GLOBAL.FLUID_TYPE_VANAE_HUNTRESS_MILK) && pc.isLactating()) || (pc.isMilkTank() && pc.canMilkSquirt())) addButton(4, "Milk Squirt", teaseSquirt, target, "Milk Squirt", "Spray the enemy with your [pc.milk], arousing them.");
			else if (InCollection(pc.milkType, GLOBAL.FLUID_TYPE_VANAE_MAIDEN_MILK, GLOBAL.FLUID_TYPE_VANAE_HUNTRESS_MILK) || pc.isMilkTank()) addDisabledButton(4, "Milk Squirt", "Milk Squirt", "You do not currently have enough [pc.milkNoun] available to squirt any.");
			addButton(14, "Back", generateCombatMenu, undefined, "Back", "Back out. Recommended if you haven't yet used \"Sense\" to determine your foe's likes and dislikes. Remember you can pull up your appearance screen in combat or use the scene buffer buttons in the lower left corner to compare yourself to your foe's preferences!");
		}
		
		private function teaseButt(target:Creature):void
		{
			var teaseCount:Number = 0;
			var likeAdjustments:Array = new Array();
			
			//Get tease count updated
			if(flags["TIMES_BUTT_TEASED"] == undefined) flags["TIMES_BUTT_TEASED"] = 0;
			teaseCount = flags["TIMES_BUTT_TEASED"];
			if(teaseCount > 100) teaseCount = 100;
			
			if(pc.buttRating() >= 10 && target.sexualPreferences.getPref(GLOBAL.SEXPREF_BIG_BUTTS) > 0)
				likeAdjustments[likeAdjustments.length] = target.sexualPreferences.getPref(GLOBAL.SEXPREF_BIG_BUTTS);
			if(pc.buttRating() < 4 && target.sexualPreferences.getPref(GLOBAL.SEXPREF_SMALL_BUTTS) > 0)
				likeAdjustments[likeAdjustments.length] = target.sexualPreferences.getPref(GLOBAL.SEXPREF_SMALL_BUTTS);
			if(pc.ass.looseness() >= 4 && target.sexualPreferences.getPref(GLOBAL.SEXPREF_GAPE) > 0) 
				likeAdjustments[likeAdjustments.length] = target.sexualPreferences.getPref(GLOBAL.SEXPREF_GAPE);
			if(pc.tailCount > 0 && target.sexualPreferences.getPref(GLOBAL.SEXPREF_TAILS) > 0) 
				likeAdjustments[likeAdjustments.length] = target.sexualPreferences.getPref(GLOBAL.SEXPREF_TAILS);
			if(pc.tailCount > 0 && (pc.hasTailCock() || pc.hasTailCunt()) && target.sexualPreferences.getPref(GLOBAL.SEXPREF_TAILGENITALS) > 0) 
				likeAdjustments[likeAdjustments.length] = target.sexualPreferences.getPref(GLOBAL.SEXPREF_TAILGENITALS);
			if((pc.isTaur() || pc.isNaga()) && target.sexualPreferences.getPref(GLOBAL.SEXPREF_EXOTIC_BODYSHAPE) > 0) 
				likeAdjustments[likeAdjustments.length] = target.sexualPreferences.getPref(GLOBAL.SEXPREF_EXOTIC_BODYSHAPE);
			
			clearOutput();
			
			if (target is CrystalGooT1 && (target as CrystalGooT1).ShouldIntercept())
			{
				(target as CrystalGooT1).SneakSqueezeAttackReaction( { isTease: true } );
			}
			else
			{
				buttTeaseText(target);
				applyTeaseDamage(pc, target, teaseCount, "BUTT", likeAdjustments);
			}
			
			processCombat();
		}
				
		public function buttTeaseText(target:Creature):void 
		{
			var choices:Array = new Array();
			choices.push(3);
			if(flags["TIMES_BUTT_TEASED"] > 75) choices.push(0);
			if(flags["TIMES_BUTT_TEASED"] > 75 && pc.armor.shortName != "") choices.push(1);
			if(pc.analCapacity() >= 450) choices.push(2);
			if(pc.hasTail() && pc.hasTailFlag(GLOBAL.FLAG_FLUFFY)) choices.push(4);
			if(pc.hasCuntTail()) choices.push(5);
			if(pc.hasCuntTail() && flags["TIMES_BUTT_TEASED"] > 25) choices.push(6);
			if(pc.hasCockTail()) choices.push(7);
			//Reqs: PC is clothed, PC has a cock and either a trap-pouch, internal gonads or no balls, PC has no vagina, PC is feminine-looking
			if(pc.isCrotchGarbed() && pc.hasCock() && (pc.balls == 0 || pc.hasStatusEffect("Uniball")) && !pc.hasVagina() && pc.femininity >= 60) choices.push(8);
			if(pc.hasVagina() && pc.wettestVaginalWetness() >= 3) choices.push(9);

			//pick our winner!
			var select:int = choices[rand(choices.length)];

			//75+
			if(select == 0)
			{
				output("Turning away at an opportune moment, you slip down your clothes and reach back, slapping your [pc.butt] into a bounce before shaking it for " + target.a + target.uniqueName + ". Your technique has grown impeccable, and you bounce your [pc.butt] masterfully, even reaching back and spreading your cheeks, giving " + target.a + target.uniqueName + " an excellent view of your [pc.asshole]");
				if(pc.hasVagina() && pc.balls > 0) output(" and [pc.vaginas] and [pc.balls]");
				else if(pc.hasVagina()) output(" and [pc.vaginas]");
				else if(pc.balls > 0) output(" and [pc.balls]");
				output(".");
			}
			//50+
			else if(select == 1)
			{
				output("Swirling away, you find yourself facing away from your enemy. A cunning smile slaps itself across your [pc.face] as you hook your fingers into your " + pc.armor.longName + " and pull down your bottoms to expose your ");
			if(pc.lowerUndergarment.shortName != "") output(pc.lowerUndergarment.longName + " and ");
			output("[pc.butt].");
			if(pc.legCount > 1) output(" Spreading your [pc.legs], y");
			else output(" Y");
			output("ou begin to shake your [pc.butt], bouncing ");
				if(pc.lowerUndergarment.shortName != "") output("in your [pc.lowerUndergarment] ");
				output("and tempting " + target.a + target.uniqueName + " with your ");
				if(pc.lowerUndergarment.shortName != "") output("unseen ");
				output("goods. Your ass shaking has gotten faster and more tasteful with all of that practice, and you rock your [pc.butt] as best as you can to show that off.");
			}
			else if(select == 2) output("You quickly strip out of your [pc.armor] and turn around, giving your [pc.butt] a hard slap and showing your enemy the real prize: your [pc.asshole].  With a smirk, you easily plunge your hand inside, burying yourself up to the wrist inside your anus.  You give yourself a quick fisting, watching the enemy over your shoulder while you moan lustily, being sure to give them a good show.  You withdraw your hand and give your ass another sexy spank before readying for combat again.");
			//Reqs: PC has at least one tail with the Fluffy tag
			else if(select == 4)
			{
				output("You turn around and bend over, then raise your [pc.tails], shaking ");
				if(pc.tailCount == 1) output("it");
				else output("them");
				output(" enticingly. <i>“These things are made for touching, you know. So nice and soft...”</i>");
			}
			//Reqs: PC has a cunt-tail
			else if(select == 5)
			{
				output("You");
				if(pc.legCount > 1) output(" reach your hand between your [pc.legs] and");
				output(" grab your [pc.tailgina] then pull it under your waist and up to your stomach, you flick your [pc.tails] to let a bit of fluid drip from it. Giving your opponent a sly look you curl your tail up and take a lick, letting your [pc.tongue] probe the folds of your tail-mounted snatch for a few seconds.");
				if(flags["TIMES_BUTT_TEASED"] > 75 && pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output(" You work your tail itself around a little bit, just enough to show off where it’s bulging around your deep-diving tongue.");
				output(" A thin string of [pc.girlCumVisc] fluid connects your mouth and [pc.oneTailgina] as you pull it away, flashing the moist opening towards your foe for a moment.");
			}
			//Reqs: PC has a cunt-tail, skill >25
			else if(select == 6)
			{
				output("You raise your [pc.tailgina] and point it towards your foe, taking hold of the exotic appendage with both of your hands. Your fingers brush across the opening at its tip, pulling the lips apart");
				if(flags["TIMES_BUTT_TEASED"] < 50) 
				{
					output(" to reveal the slick entrance. A bit of fluid drips from the tip of your [pc.tailgina], wet and ready for mating.");
				}
				else output(" just enough to reveal a bit of the interior.  You take it slow on opening your tailcunt the rest of the way, until you can use two fingers to hold the dripping entrance open, leaving your other hand free to run its fingers over the exotic folds, pressing in just enough to show your foe how slippery soft your tailpussy really is.");
			}
			//Reqs: PC has a cock-tail
			else if(select == 7)
			{
				output("You curl your [pc.cockTail] around to flex it back and forth a bit in front of your foe, showing off the alien endowment you’ve picked up.  You arrange your tail into a spiral shape and then piston it sharply like a coiled spring, making a loud snapping sound from the force of it striking the air.");
			}
			//Reqs: PC is clothed, PC has a cock and either a trap-pouch, internal gonads or no balls, PC has no vagina, PC is feminine-looking
			else if(select == 8)
			{
				output("You pull down your [pc.lowerGarments] as you turn around");
				if(pc.hasStatusEffect("Genital Slit")) output(", carefully tucking your [pc.cocks] inside your genital slit");
				else if(pc.legCount > 1) output(", carefully tucking your [pc.cocks] between your legs");
				output(".");
				//PC has a trap-pouch:
				if(pc.hasStatusEffect("Uniball")) output(" You carefully arrange your [pc.sack] to look like a feminine crease");
				else if(pc.balls == 0) output(" You feel a rush of pleasure");
				output(" as you shake your ass, letting out a girly giggle. You don’t give your foe time to tell what");
				if(pc.legCount > 1) output("’s really between your [pc.legs]");
				else output(" gender you really are");
				output(" before you pull your [pc.lowerGarments] back up and turn back around, giving a sly smile.");
			}
			//Reqs: PC has a vagina with 3+ wetness
			else if(select == 9)
			{
				//Clothed:
				if(pc.isCrotchGarbed()) output("You open your [pc.lowerGarments] as you");
				else output("You");
				output(" turn and bend over to show off your [pc.butt]");
				if(pc.hasCock()) output(", [pc.cocks],");
				output(" and [pc.vaginas]");
				output(", though your attention goes to the last. You’re practically dripping by this point, as you slowly rub your index finger across the cleft of ");
				if(pc.totalVaginas() > 1) output("one cunny");
				else output("your cunny");
				output(" and stick your thumb inside your [pc.asshole], beginning to lightly finger your backdoor. You pull your fingers away");
				if(pc.isCrotchGarbed()) output(" and slide your [pc.lowerGarments] back into place");
				output(", looking over your shoulder at your foe seductively.");
			}
			else if(select == 3) {
				output("You turn away");
				if(pc.isCrotchGarbed()) output(", slide down your clothing,");
				output(" and bounce your [pc.butt] up and down hypnotically");
				//Big butts = extra text + higher success
				if(pc.buttRating() >= 10) {
					output(", making it jiggle delightfully.  Your target even gets a few glimpses of the [pc.asshole] between your cheeks.");
				}
				//Small butts = less damage, still high success
				else {
					output(", letting your target get a good look at your [pc.asshole]");
					if(pc.hasVagina()) output(" and a glimpse of your [pc.vaginas]");
					output(".");
				}
			}
		}

		private function teaseChest(target:Creature):void
		{
			var teaseCount:Number = 0;
			var likeAdjustments:Array = new Array();
			
			//Get tease count updated
			if(flags["TIMES_CHEST_TEASED"] == undefined) flags["TIMES_CHEST_TEASED"] = 0;
			teaseCount = flags["TIMES_CHEST_TEASED"];
			if(teaseCount > 100) teaseCount = 100;
			
			if(pc.biggestTitSize() >= 5 && target.sexualPreferences.getPref(GLOBAL.SEXPREF_BIG_BREASTS) > 0)
				likeAdjustments[likeAdjustments.length] = target.sexualPreferences.getPref(GLOBAL.SEXPREF_BIG_BREASTS);
			if(pc.biggestTitSize() < 4 && target.sexualPreferences.getPref(GLOBAL.SEXPREF_SMALL_BREASTS) > 0)
				likeAdjustments[likeAdjustments.length] = target.sexualPreferences.getPref(GLOBAL.SEXPREF_SMALL_BREASTS);
			if((pc.bRows() > 1 || pc.totalBreasts() / pc.bRows() > 2) && target.sexualPreferences.getPref(GLOBAL.SEXPREF_MULTIPLES) > 0) 
				likeAdjustments[likeAdjustments.length] = target.sexualPreferences.getPref(GLOBAL.SEXPREF_MULTIPLES);
			if(pc.biggestTitSize() >= 25 && target.sexualPreferences.getPref(GLOBAL.SEXPREF_HYPER) > 0) 
				likeAdjustments[likeAdjustments.length] = target.sexualPreferences.getPref(GLOBAL.SEXPREF_HYPER);
			if(pc.hasFuckableNipples() && target.sexualPreferences.getPref(GLOBAL.SEXPREF_NIPPLECUNTS) > 0) 
				likeAdjustments[likeAdjustments.length] = target.sexualPreferences.getPref(GLOBAL.SEXPREF_NIPPLECUNTS);
			if(pc.isLactating() && target.sexualPreferences.getPref(GLOBAL.SEXPREF_LACTATION) > 0) 
				likeAdjustments[likeAdjustments.length] = target.sexualPreferences.getPref(GLOBAL.SEXPREF_LACTATION);
			
			clearOutput();
			
			if (target is CrystalGooT1 && (target as CrystalGooT1).ShouldIntercept())
			{
				(target as CrystalGooT1).SneakSqueezeAttackReaction( { isTease: true } );
			}
			else
			{
				chestTeaseText(target);
				applyTeaseDamage(pc, target, teaseCount, "CHEST", likeAdjustments);
			}
			
			processCombat();
		}
		
		public function chestTeaseText(target:Creature):void 
		{
			if (pc.biggestTitSize() < 1) 
			{
				if(rand(3) != 0 && pc.tone >= 70)
				{
					//Clothed:
					if(pc.isChestGarbed()) output("Shedding your [pc.upperGarments], you");
					else output("You");
					output(" flex your arms, showing off the bulging biceps.  After a bit of posing");
					output(" you slap your chest with one hand, producing a loud crack of muscle on muscle as your palm meets your iron-hard pectoral.");
					output(" After a good few seconds of showing off,");
					if(pc.isChestGarbed()) output(" you close your [pc.upperGarments] and");
					else output(" you cease your posing and");
					output(" return your gaze to the fight.");
				}
				else if(pc.isChestGarbed()) output("You peel open your [pc.upperGarments] to expose your [pc.chest] and [pc.nipples], running a hand up your [pc.skinFurScales] to one as you lock eyes with your target. You make sure that every bit of your musculature is open and on display before you bother to cover back up.");
				else output("Naked as you are, there's nothing you need to do to expose your [pc.chest] and [pc.nipples], and running a hand up your [pc.skinFurScales] only enhances the delicious exposure. You make sure that every bit of your musculature is open and on display before you adopt a less sensual pose.")
			}
			//Titties!
			else 
			{
				var choices:Array = new Array();
				if(pc.milkFullness > 50 && pc.isChestGarbed()) 
				{
					choices.push(0);
					choices.push(0);
					choices.push(0);
				}
				choices.push(1);
				//Reqs: PC is wearing clothes but no bra, PC’s biggest breast row is at least a D-cup
				if(pc.isChestGarbed() && !pc.hasUpperGarment() && pc.biggestTitSize() >= 4) choices.push(2);
				//Reqs: PC is wearing something covering their top, has at least as many prehensile tails as nips
				if(pc.isChestGarbed() && pc.tailCount >= pc.totalNipples()) choices.push(3);
				//Reqs: PC has very high tone
				if(pc.tone >= 70) choices.push(4);

				//pick our winner!
				var select:int = choices[rand(choices.length)];

				//User submitted milkiness! 75%!
				if(select == 0)
				{
					//If Breasts Tease >=75 Lactating.
					if(pc.milkFullness >= 75)
					{
						output("Drawing your hands sensuously up your [pc.belly], you cup your milky tits, giving one a firm squeeze as you let out a low, lusty moan. With " + target.a + target.uniqueName + "’s gaze firmly captured, you pull away your [pc.upperGarments], releasing your [pc.fullChest] to the world, the fresh air blowing across your [pc.nipples]. You aren’t done teasing yet; a delicious idea slips into your devious mind.");
						output("\n\nGrabbing both of your exposed melons, you jiggle them, causing a hypnotizing earthquake of mammary delight while taking care to pinch your nipples. The stimulation is just enough to get you started. Your [pc.milk] flows out as you begin to rub it into your [pc.skinFurScales], the [pc.milkColor] liquid soaking into your [pc.chest]. It takes you a tremendous effort to stop yourself and cover your jugs up again. Licking your fingers clean with an <i>Mmmmm...</i> for show, you ready yourself, noting that you’ll have to clean up a little later.");
					}
					//If Breast tease <75 Lactating.
					else
					{
						output("Fumbling with your [pc.upperGarments] you release your [pc.chest], letting your bounty free with an enticing jiggle. You can feel " + target.a + target.uniqueName + "s eyes on you, running over your [pc.chest], and you take advantage of that, swaying your shoulders to set off all kinds of pleasant jiggles. It’s not until you feel your [pc.milk] start to dribble out of your [pc.nipples] that you realize just what you’ve done. Reaching up, you grab the swells of your [pc.chest] to put them away, but you only succeed in coating yourself in your [pc.milk]. You can’t help but feel a little embarrassed and maybe a little aroused as you tuck your [pc.fullChest] away.");
					}
				}
				else if(select == 1)
				{
					//HYPER TIIIIITS
					if(pc.biggestTitSize() >= 15) {
						if(pc.isChestGarbed()) output("With a slow pivot and sultry look, you reach up to your [pc.upperGarments] and peel away the offending coverings with deliberate slowness. With each inch of breast-flesh you expose, your smile grows wider. You pause above your [pc.nipples] before letting them out with a flourish, digging your hands in to your soft, incredibly well-endowed chest in a display of mammary superiority. You cover up after a moment with a knowing smile.");
						else output("Your [pc.fullChest] is already completely uncovered, but that doesn't stop you from bringing your hands up to the more-than-ample cleavage and enhancing it by pressing down from each side. Your fingers sink deeply into your busty bosom as you look up at your chosen target, then, with a smile, you gentle shake them, making your titanic mammaries wobble oh-so-enticingly.")
						if(pc.biggestTitSize() >= 25) output(" There's just so much breastflesh there; it feels good to use it.");
					}
					//Big TiTS!
					else if(pc.biggestTitSize() >= 4) {
						if(pc.isChestGarbed()) output("You peel away your [pc.upperGarments] with careful, slow tugs to expose your [pc.fullChest]. Only after you've put yourself on display do you look back at your target and truly begin to tease, starting with a knowing wink. Then, you grab hold of your [pc.chest] and cup them to enhance your cleavage, lifting one then the other in a slow, sensuous display. Covering them up is something you do a little a regretfully.");
						else output("You delicately trace a finger up your [pc.belly] to your exposed cleavage, slowing as it nestles in place. Your motion causes your breasts to gently sway as you explore yourself, and you pause to look at your target. With one hand, you squeeze your left tit, crushing your other hand's finger into it while you grope yourself. With your erotic display complete, you release yourself and stretch, glad to be uncovered.");
					}
					//Petite ones!
					else {
						if(pc.isChestGarbed()) output("You remove your [pc.upperGarments] with ease to free the perfectly rounded, perky breasts. You run your hands across the [pc.skinFurScales] to thumb at your nipples and grace your target with a lascivious look before putting the girls away a little regretfully.");
						else output("With your [pc.fullChest] on complete display, you arch your back to present yourself as pleasingly as possible. Your hands wind their way up to your [pc.nipples] and give them a little tweak, sliding down the supple curve of your underbust. You give your target a smile before you stop, but even now, your bared [pc.skinFurScales] will taunt " + target.mfn("him","her","it") + ".");
					}
				}
				//Reqs: PC is wearing clothes but no bra, PC’s biggest breast row is at least a D-cup
				else if(select == 2)
				{
					output("<i>“Want to see just how perky these are?”</i> You give your target a sly smile while opening up your [pc.upperGarments], bouncing lightly on your [pc.feet] to make your [pc.fullChest] jiggle. Once the jiggle subsides a bit you pass a hand across the space under your [pc.biggestBreastDescript], showing off how they return to sitting good and high on your chest once they stop bouncing. <i>“Isn’t modern medicine great? No need for a bra with these big girls.”</i> You flash a coy wink as you cover back up.");
				}
				//Reqs: PC is wearing something covering their top, has at least as many prehensile tails as nips
				else if(select == 3)
				{
					output("You start to strip off your [pc.upperGarments], but curl your [pc.tails] around as you do. Just as your [pc.fullChest] is coming into view you cover up each of your nipples with one of your tails, winking and sticking your tongue out.");
					output("\n\n<i>“Ooh, sorry, were you wanting to see these?”</i> You make small circles with your tailtips, allowing your target glimpses of [pc.nippleColor] peeking out around the edges but nothing more. <i>“You could give up and maybe I’ll reward you with a real show.”</i> You pull your tails away just as your [pc.upperGarments] close back over your chest, giving another wink as you cover up.");
				}
				//Reqs: PC has very high tone
				else if(select == 4)
				{
					//Clothed:
					if(pc.isChestGarbed()) output("Shedding your [pc.upperGarments], you");
					else output("You");
					output(" flex your arms, showing off the bulging biceps.  After a bit of posing");
					if(pc.biggestTitSize() < 1) output(" you slap your chest with one hand, producing a loud crack of muscle on muscle as your palm meets your iron-hard pectoral.");
					else if(pc.biggestTitSize() <= 3) output(" you stretch to show off your sleek chest, turning your upper body so they can see the way your breasts fit the form of your highly-toned physique.");
					else output(" you give one of your breasts a grope, showing off how you’re every bit as curvy as a girl without your incredible musculature.");
					output(" After a good few seconds of showing off,");
					if(pc.isChestGarbed()) output(" you close your [pc.upperGarments] and");
					else output(" you cease your posing and");
					output(" return your gaze to the fight.");
				}
			}
		}

		private function teaseHips(target:Creature):void
		{
			var teaseCount:Number = 0;
			var likeAdjustments:Array = new Array();
			
			//Get tease count updated
			if(flags["TIMES_HIPS_TEASED"] == undefined) flags["TIMES_HIPS_TEASED"] = 0;
			teaseCount = flags["TIMES_HIPS_TEASED"];
			if(teaseCount > 100) teaseCount = 100;
			
			if(pc.hipRating() >= 10 && target.sexualPreferences.getPref(GLOBAL.SEXPREF_WIDE_HIPS) > 0)
				likeAdjustments[likeAdjustments.length] = target.sexualPreferences.getPref(GLOBAL.SEXPREF_WIDE_HIPS);
			if(pc.hipRating() < 4 && target.sexualPreferences.getPref(GLOBAL.SEXPREF_NARROW_HIPS) > 0)
				likeAdjustments[likeAdjustments.length] = target.sexualPreferences.getPref(GLOBAL.SEXPREF_NARROW_HIPS);
			if((pc.isTaur() || pc.isNaga()) && target.sexualPreferences.getPref(GLOBAL.SEXPREF_EXOTIC_BODYSHAPE) > 0) 
				likeAdjustments[likeAdjustments.length] = target.sexualPreferences.getPref(GLOBAL.SEXPREF_EXOTIC_BODYSHAPE);
		
			clearOutput();
			
			if (target is CrystalGooT1 && (target as CrystalGooT1).ShouldIntercept())
			{
				(target as CrystalGooT1).SneakSqueezeAttackReaction( { isTease: true } );
			}
			else
			{
				hipsTeaseText(target);
				applyTeaseDamage(pc, target, teaseCount, "HIPS", likeAdjustments);
			}
			processCombat();
		}
		
		public function hipsTeaseText(target:Creature):void 
		{
			var choices:Array = new Array();

			if(pc.hipRating() < 4) choices.push(0);
			else if(pc.hipRating() >= 10) choices.push(1);
			else choices.push(2);
			//Reqs:  PC has a naga tail
			if(pc.isNaga()) choices.push(3);
			//Reqs: PC is in combat with a naleen, PC has a naga tail
			if(target is Naleen && pc.isNaga()) choices.push(4);
			//Reqs: Hips skill 75+
			if(flags["TIMES_HIPS_TEASED"] >= 75) choices.push(5);

			var select:int = choices[rand(choices.length)];

			//Small hips!
			if(select == 0) {
				output("Putting a hand on your [pc.hips], you stretch, sliding your palms up and down them for emphasis, really showing off how narrow they are.");
			}
			//Big hips!
			else if(select == 1) {
				output("With a sinuous undulation, you rock your [pc.hips] out to the right side, then the left. You gracefully strut around, swaying to a rhythm only you can hear and doing your best to keep curviness on full display throughout.");
			}
			//Generic hips!
			else if(select == 2) {
				output("Watching your target, you place a hand upon your [pc.hips] and sway them in the other direction then back again like a pendulum. You let the hypnotic undulations go on as long as you dare and smile triumphantly as you stop.");
			}
			//Reqs: PC has a naga tail
			else if(select == 3)
			{
				output("You run a hand down your [pc.hips] and across the surface of your tail, making a slow circle as you do to show off every last foot of its thick, winding length.");
			}
			//Reqs: PC is in combat with a naleen, PC has a naga tail
			else if(select == 4)
			{
				output("You slither towards the ");
				if(pc.race() == "naleen") output("other ");
				output("naleen, idly swaying your [pc.hips] to show off your tail.");
				//PC’s original race is not some sort of naga that may be introduced in the future:
				output(" <i>“I used to have spindly little legs, you know.”</i>");
				//PC’s original race is some sort of naga: <i>“Plenty of other races out there have spindly little legs they have to move around on.”</i>
				output(" You offer a smirk of superiority as you slither in a circle around your foe, your tail leaving a trail in the brush where it passes. <i>“This is </i>much<i> better, don’t you agree?");
				if(pc.race() != "naleen") output(" I may not be a naleen, but I can still appreciate a strong, </i>thick<i> snake tail like mine... or yours.");
				else output(" Becoming a naleen’s given me an appreciation for big, long tails like this one... or like yours.");
				output("”</i> You let your tailtip brush over some of your foe’s length before you pull away, allowing them a brief view of your backside and your tail curling up to support you as you resume the fight.");
			}
			//Reqs: Hips skill 75+
			//flags["TIMES_HIPS_TEASED"]
			else if(select == 5)
			{
				//Clothed:
				if(pc.armor.shortName != "")
				{
					output("You shed your [pc.armor] to leave yourself");
					if(pc.upperUndergarment.shortName != "" && pc.lowerUndergarment.shortName != "") output(" in your [pc.upperGarment] and [pc.lowerGarment]");
					//if bra only: 
					else if(pc.upperUndergarment.shortName != "") output(" in just your [pc.upperGarment]");
					else if(pc.lowerUndergarment.shortName != "") output(" in just your [pc.lowerGarment]");
					else output(" nude");
				}
				//Nude:
				else output("You take a moment to ready yourself");
				output(" before drawing your hands up over your head.  You start in on rocking your [pc.hips], treating your foe to a dance");
				if(pc.tone < 30 && pc.thickness >= 60) output(" that gets your [pc.belly] jiggling");
				else output(" that shows off your [pc.belly], the light glinting off your [pc.skinFurScales] as it moves");
				output(". Your hands slowly descend and move outwards to your sides, remaining largely steady while the bulk of your motion remains in your hips and belly, though there’s just enough motion in your [pc.legOrLegs] to show those off as well");
				if(pc.biggestTitSize() >= 4) output(", and the motion is plenty to set your [pc.chest] quaking in time with your dance");
				if(pc.hasHair() && pc.hairLength >= 8) output(" while your [pc.hair] sways in concert with your hips");
				output(".");
				output("\n\nFinally you stop and take a moment to wipe the sweat off your brow");
				if(pc.armor.shortName != "") output(" before putting your [pc.armor] back on");
				output(".");
			}
		}

		private function teaseCrotch(target:Creature):void
		{
			var teaseCount:Number = 0;
			var likeAdjustments:Array = new Array();
			
			//Get tease count updated
			if(flags["TIMES_CROTCH_TEASED"] == undefined) flags["TIMES_CROTCH_TEASED"] = 0;
			teaseCount = flags["TIMES_CROTCH_TEASED"];
			if(teaseCount > 100) teaseCount = 100;
			
			if(pc.hasCock() && target.sexualPreferences.getPref(GLOBAL.SEXPREF_COCKS) > 0)
				likeAdjustments[likeAdjustments.length] = target.sexualPreferences.getPref(GLOBAL.SEXPREF_COCKS);
			if(pc.hasVagina() && target.sexualPreferences.getPref(GLOBAL.SEXPREF_PUSSIES) > 0)
				likeAdjustments[likeAdjustments.length] = target.sexualPreferences.getPref(GLOBAL.SEXPREF_PUSSIES);
			if(pc.balls > 0 && target.sexualPreferences.getPref(GLOBAL.SEXPREF_BALLS) > 0) 
				likeAdjustments[likeAdjustments.length] = target.sexualPreferences.getPref(GLOBAL.SEXPREF_BALLS);
			if(pc.hasCock() && pc.longestCockLength() >= 12 && target.sexualPreferences.getPref(GLOBAL.SEXPREF_BIG_MALEBITS) > 0) 
				likeAdjustments[likeAdjustments.length] = target.sexualPreferences.getPref(GLOBAL.SEXPREF_BIG_MALEBITS);
			if(pc.hasCock() && pc.shortestCockLength() < 7 && target.sexualPreferences.getPref(GLOBAL.SEXPREF_SMALL_MALEBITS) > 0) 
				likeAdjustments[likeAdjustments.length] = target.sexualPreferences.getPref(GLOBAL.SEXPREF_SMALL_MALEBITS);
			if((pc.cockTotal() > 1 || pc.vaginaTotal() > 1) && target.sexualPreferences.getPref(GLOBAL.SEXPREF_MULTIPLES) > 0) 
				likeAdjustments[likeAdjustments.length] = target.sexualPreferences.getPref(GLOBAL.SEXPREF_MULTIPLES);
			if((pc.hasCock() || pc.longestCockLength() >= 18) && target.sexualPreferences.getPref(GLOBAL.SEXPREF_HYPER) > 0) 
				likeAdjustments[likeAdjustments.length] = target.sexualPreferences.getPref(GLOBAL.SEXPREF_HYPER);
			if(pc.hasVagina() && pc.gapestVaginaLooseness() >= 4 && target.sexualPreferences.getPref(GLOBAL.SEXPREF_GAPE) > 0) 
				likeAdjustments[likeAdjustments.length] = target.sexualPreferences.getPref(GLOBAL.SEXPREF_GAPE);
			if(pc.hasVagina() && pc.wettestVaginalWetness() >= 4 && target.sexualPreferences.getPref(GLOBAL.SEXPREF_VAGINAL_WETNESS) > 0) 
				likeAdjustments[likeAdjustments.length] = target.sexualPreferences.getPref(GLOBAL.SEXPREF_VAGINAL_WETNESS);
			if(pc.hasVagina() && pc.driestVaginalWetness() <= 1 && target.sexualPreferences.getPref(GLOBAL.SEXPREF_VAGINAL_DRYNESS) > 0) 
				likeAdjustments[likeAdjustments.length] = target.sexualPreferences.getPref(GLOBAL.SEXPREF_VAGINAL_DRYNESS);
			if (!pc.hasCock() && !pc.hasVagina() && target.sexualPreferences.getPref(GLOBAL.SEXPREF_NEUTER) > 0)
				likeAdjustments[likeAdjustments.length] = target.sexualPreferences.getPref(GLOBAL.SEXPREF_NEUTER);
			if (pc.hasCock() && pc.hasVagina() && target.sexualPreferences.getPref(GLOBAL.SEXPREF_HERMAPHRODITE) > 0)
				likeAdjustments[likeAdjustments.length] = target.sexualPreferences.getPref(GLOBAL.SEXPREF_HERMAPHRODITE);
			
			clearOutput();
			
			if (target is CrystalGooT1 && (target as CrystalGooT1).ShouldIntercept())
			{
				(target as CrystalGooT1).SneakSqueezeAttackReaction( { isTease:true } );
			}
			else
			{
				crotchTeaseText(target);
				applyTeaseDamage(pc, target, teaseCount, "CROTCH", likeAdjustments);
			}
			processCombat();
		}
		
		private function crotchTeaseText(target:Creature):void 
		{
			var temp:int = 0;
			var choices:Array = new Array();
			if(pc.hasCock()) {
				if(pc.isTaur() && pc.cockTotal(GLOBAL.TYPE_EQUINE) > 0) choices[choices.length] = 4;
				else 
				{
					if(pc.armor.shortName == "" && pc.lowerUndergarment.shortName != "") choices[choices.length] = 2;
					choices[choices.length] = 1;
				}		
			}
			if(pc.hasVagina()) {
				if(pc.isTaur()) choices[choices.length] = 5;
				else choices[choices.length] = 3;
			}
			//Reqs: PC has a vagina with maximum wetness
			if(pc.hasVagina() && pc.wettestVaginalWetness() >= 5) choices.push(6);
			//Reqs: PC has a cock with a knot
			if(pc.hasAKnot()) choices.push(7);
			//Reqs: PC has a cock with foreskin
			if(pc.hasACockFlag(GLOBAL.FLAG_FORESKINNED)) choices.push(8);
			//Reqs: PC has a cock with a flare
			if(pc.hasACockFlag(GLOBAL.FLAG_FLARED)) choices.push(9);
			//Reqs: PC has a cock with a medial ring
			if(pc.hasCock(GLOBAL.TYPE_EQUINE)) choices.push(10);
			//Reqs: PC has a dick, PC has extremely high cum volume
			if(pc.hasCock() && pc.cumQ() >= 1000) choices.push(11);
			//Reqs: Crotch skill 50+
			if(flags["TIMES_CROTCH_TEASED"] >= 50 && pc.hasCock() || pc.hasVagina()) choices.push(12);
			//Reqs: PC is in combat with a zil male, zil female, or the dual zil when meeting Penny, PC has a zil vagina
			if((target is ZilFemale || target is ZilMale || target is ZilPack) && pc.hasVagina(GLOBAL.TYPE_BEE)) choices.push(13);
			//Reqs: PC has at least 3 vaginal wetness
			if(pc.hasVagina() && pc.wettestVaginalWetness() >= 3) choices.push(14);

			var select:int = choices[rand(choices.length)];
			//1 - dick!
			if(select == 1) {
				if(pc.isCrotchGarbed()) output("You open your [pc.lowerGarments] just enough to let ");
				else output("You shift position while ");
				output("your [pc.cocks]");
				if(pc.balls > 0) output(" and [pc.balls]");
				output(" dangle");
				if(pc.cockTotal() + pc.balls == 1) output("s");
				output(" free. ");
				if(pc.lust() >= 66) output("A shiny rope of pre-cum dangles from your cock, showing that your reproductive system is every bit as ready to pleasure as the rest of you.");
				else output("Your motions are just enough to make your equipment sway back and forth before your target's eyes.")
			}
			//2 - covered dick!
			else if(select == 2) {
				output("You lean back and pump your hips at your target in an incredibly vulgar display. The bulging, barely-contained outline of your package presses hard into your [pc.lowerUndergarment]. This feels so crude, but at the same time, you know it'll likely be effective.");
				output(" You go on like that, humping the air for your target's benefit, trying to entice them with your nearly-exposed meat.");
			}	
			//3 - cunt!
			else if(select == 3) {
				if(pc.isCrotchGarbed()) output("You coyly open your [pc.lowerGarments]");
				else output("You coyly gesture to your groin");
				if(pc.hasPerk("Ditz Speech")) output(" and giggle, <i>\"Is this, like, what you wanted to see?\"</i>  ");
				else {
					output(" and purr, <i>\"Does the thought of a hot, ");
					if(pc.hasCock() && pc.hasVagina()) output("futanari ");
					else output("sexy ");
					output("body turn you on?\"</i>  ");
				}
				if(target.isPlural) output(possessive(target.capitalA + target.uniqueName) + " gazes are riveted on your groin as you run your fingers up and down your folds seductively.");
				else output(possessive(target.capitalA + target.uniqueName)  + "'s gaze is riveted on your groin as you run your fingers up and down your folds seductively.");
				if(pc.hasClit())
				{
					if(pc.clitLength > 3) output(" You smile as [pc.eachClit] swells out from the folds and stands proudly, begging to be touched.");
					else output(" You smile and pull apart your lower lips to expose your [pc.clits], giving the perfect view.");
				}
				else output(" You smile and pull apart your lower lips to expose your sex, giving the perfect view.");
				if(pc.cockTotal() > 0) output(" Meanwhile, [pc.eachCock] bobs back and forth with your gyrating hips, adding to the display.");
			}
			//4 Horsecock centaur tease
			else if(select == 4) {
				output("You let out a bestial whinny and stomp your hooves at your enemy.  They prepare for an attack, but instead you kick your front hooves off the ground, revealing the hefty horsecock hanging beneath your belly.  You let it flop around, quickly getting rigid and to its full erect length.  You buck your hips as if you were fucking a mare in heat, letting your opponent know just what's in store for them if they surrender to pleasure...");
			}
			//5 Cunt grind tease
			else if(select == 5) {
				output("You gallop toward your unsuspecting enemy, dodging their defenses and knocking them to the ground.  Before they can recover, you slam your massive centaur ass down upon them, stopping just short of using crushing force to pin them underneath you.  In this position, your opponent's face is buried right in your girthy horsecunt.  You grind your cunt into your target's face for a moment before standing.  When you do, you're gratified to see your enemy covered in your lubricant and smelling powerfully of horsecunt.");
			}
			//Reqs: PC has at least 3 vaginal wetness
			else if(select == 14)
			{
				//PC has clothes or a lower undergarment on: 
				if(pc.isCrotchGarbed()) output("You open your [pc.lowerGarments] to reveal");
				else output("You direct your foe’s attention to");
				output(" [pc.oneVagina], already dripping wet. A brush of your fingers across your folds leaves them glistening with [pc.girlCumVisc] fluid, and you give your target a grin before popping your fingers into your mouth, working your [pc.tongue] around the intruding digits to lick up every last [pc.girlCumFlavor] drop.");
				if ((pc.armor.shortName == "" && pc.lowerUndergarment.shortName != "") || (pc.armor.shortName != "" && pc.lowerUndergarment.shortName == ""))
				{
					output(" You close back up your [pc.lowerGarments], a drip of [pc.girlCum] leaving a dark stain");
					if (pc.legCount > 1) output(" between your legs.");
					else output(" on your crotch.");
				}
				//PC has both undergarments and clothes:
				else if (pc.isCrotchGarbed()) output(" You close back up your [pc.lowerGarments], flushing slightly at the sensation of the fluid trapped within your [pc.lowerGarment].");
				//PC is nude or only has a bra:
				else 
				{
					output(" You return your attention to your foe, stray [pc.girlCumNoun]");
					if(pc.legCount > 1) 
					{
						output(" dripping to the ground between your [pc.legs]");
						//PC has wetness 5:
						if(pc.wettestVaginalWetness() >= 5) output(" in a steady stream of droplets");
					}
					//PC has one leg such as a naga tail:
					else 
					{
						output(" winding a");
						if(pc.wettestVaginalWetness() >= 3) output(" trail");
						else if(pc.wettestVaginalWetness() >= 4) output(" stream");
						else output(" river");
						output(" down your [pc.legOrLegs]");
					}
					output(".");
				}
			}
			//Reqs: PC has a vagina with maximum wetness
			else if(select == 6)
			{
				if(pc.isCrotchGarbed()) output("You slip off your [pc.lowerGarments]");
				else output("You only need to face your [pc.crotch] towards your enemy");
				output(" and cock your hips to one side, letting the [pc.girlCum] gushing from between your thighs speak for itself. You casually drop a hand to between your [pc.thighs] and sample a bit of the river, popping your fingers into your mouth to savor the [pc.girlCumFlavor] treat.");
				//Skill 50+:
				if(flags["TIMES_CROTCH_TEASED"] > 50) output(" You dip your fingers into the [pc.girlCumNoun] again, this time holding out your fingers towards your foe invitingly before again licking yourself clean.  <i>“Imagine what it’s like when I’m actually cumming.”</i>");
				output(" You give your foe a heady grin as you ");
				if(pc.isCrotchGarbed()) output("pull your [pc.lowerGarments] back up, producing a wet sound as your endless flow is plugged back up - for now.");
				else output("return your attention to the fight, [pc.girlCumColor] still streaming freely down your [pc.legOrLegs].");
			}
			//Reqs: PC has a cock with a knot
			else if(select == 7)
			{
				//Clothed: 
				if(pc.isCrotchGarbed()) output("You open your [pc.lowerGarments]");
				else
				{
					if(!pc.isTaur()) output("You stand with your");
					else output("You pose with your");
					if(pc.legCount > 1) output(" [pc.legs] apart");
					else output(" crotch out");
				}
				output(" and let your [pc.cocks]");
				if (!pc.hasStatusEffect("Genital Slit")) output(" hang out");
				else output(" slide out");
				
				var knottedSheath:Boolean = false;
				for(var sheathCounter: int = 0; sheathCounter < pc.totalCocks(); sheathCounter++)
				{
					if(pc.hasSheath(sheathCounter) && pc.hasKnot(sheathCounter)) knottedSheath = true;
				}
				if(knottedSheath) 
				{
					output(", slipping out of ");
					if(pc.hasSheaths()) output("their sheaths");
					else output("its sheath");
				}
				//PC has a genital slit:
				else if(pc.hasStatusEffect("Genital Slit")) 
				{
					output(", standing proudly from the slit ");
					if(pc.cockTotal() == 1) output("it");
					else output("they");
					output(" normally hide within");
				}
				output(". You wrap a hand around your knot and give it a squeeze, showing off its size. <i>“Think that " + target.vagOrAss(0) + " of yours can take the whole thing?”</i>");
			}
			//Reqs: PC has a cock with foreskin
			//FLAG_FORESKINNED
			else if(select == 8)
			{
				temp = -1;
				for(var foreskinCounter:int = 0; foreskinCounter < pc.totalCocks(); foreskinCounter++)
				{
					if(temp == -1 && pc.cocks[foreskinCounter].hasFlag(GLOBAL.FLAG_FORESKINNED)) temp = foreskinCounter;
				}
				if(temp == -1)
				{
					output("FORESKIN ERROR: 8===D");
				}
				//Clothed:
				if(pc.isCrotchGarbed())
				{
					output("You free your [pc.cocks] from ");
					if(pc.cockTotal() == 1) output("its");
					else output("their");
					output(" confinement");
				}
				else
				{
					output("You draw your foe’s attention to your [pc.cocks]");
				}
				output(", taking hold of your foreskin between two fingers and lightly tugging on it to show off its stretchy length.");
				if(flags["TIMES_CROTCH_TEASED"] > 25)
				{
					output(" You angle your tugs a little to one side, making a slow circle that reveals the silhouette of your [pc.cockHead " + temp + "] trapped within.");
				}
				if(flags["TIMES_CROTCH_TEASED"] > 50) output(" Getting a little creative, you slip one of your fingers inside your exotic covering to stroke the [pc.cockHead " + temp + "] within and draw out a little of [pc.cumVisc] preseed before you pinch the base of your foreskin and draw your fingers upward, causing a little bit of [pc.cumColor] fluid to bubble from the opening of your shroud.");
				output(" After a few moments, ");
				if(pc.isCrotchGarbed()) output("you close up your [pc.lowerGarments]");
				else output("you let go of yourself");
				output(" and return your eyes to the fight.");
			}
			//Reqs: PC has a cock with a flare
			else if(select == 9)
			{
				temp = -1;
				for(var flareCounter:int = 0; flareCounter < pc.totalCocks(); flareCounter++)
				{
					if(temp == -1 && pc.cocks[flareCounter].hasFlag(GLOBAL.FLAG_FLARED)) temp = flareCounter;
				}
				if(temp == -1)
				{
					output("FLARE ERROR: 8===D");
				}
				//Clothed:
				if(pc.isCrotchGarbed()) output("You open your [pc.lowerGarments] and");
				else output("You");
				output(" draw attention to [pc.oneCock], your flare already getting nice and wide. Your finger traces around the edge and underside of the thick ring, before coming up and over to brush the [pc.cockHead " + temp + "] above it. A bit of [pc.cum] comes away with your fingertip, showing off just how ready your flare is to be plunged inside the nearest willing hole... if they can take it.  The thought of it makes you smirk as you ");
				if(pc.isCrotchGarbed()) output("cover up");
				else output("return to attention");
				output(", ready to continue.");
			}
			//Reqs: PC has a cock with a medial ring
			//if(pc.hasCock(GLOBAL.TYPE_EQUINE))
			else if(select == 10)
			{
				temp = -1;
				for(var ringCounter:int = 0; ringCounter < pc.totalCocks(); ringCounter++)
				{
					if(temp == -1 && pc.cocks[ringCounter].cType == GLOBAL.TYPE_EQUINE) temp = ringCounter;
				}
				if(temp == -1)
				{
					output("MEDIAL RING ERROR: 8===D");
				}
				//Clothed:
				if(pc.isCrotchGarbed()) output("As your [pc.lowerGarments] come away from");
				else output("As you draw your foe’s attention to");
				output(" your [pc.cocks], you opt to focus on a different part of your shaft from the usual.  Your hand goes up to your [pc.cockHead " + temp + "], but soon slides halfway down your shaft to the masculine ring wrapped around the center of your dick.  Your finger traces around its edge, pressing inward just enough to showcase the slightly spongy texture of your all-natural ribbing.  You pull your hand away");
				if(pc.isCrotchGarbed()) output(" and cover up.");
				else output(" and let your cock relax.");
			}
			//Reqs: PC has a dick, PC has extremely high cum volume
			else if(select == 11)
			{
				//Clothed:
				if(pc.isCrotchGarbed()) output("You open your [pc.lowerGarments]");
				else output("You direct your foe’s attention to between your thighs");
				if(pc.hasSheath(0)) output(" and let [pc.oneCock] out of its sheath");
				else if(pc.hasStatusEffect("Genital Slit")) output(" and let [pc.oneCock] slip out of your genital slit");
				output(", a little bit of pre-cum already bubbling from your [pc.cockHead]. You give yourself a light handjob, enough to make your [pc.cumVisc] fluid squirt with volume comparable to a normal human’s full orgasm. <i>“My [pc.balls] can barely keep all this [pc.cumNoun] in.... Think your " + target.vagOrAss(0) + " can do any better?”</i> You let go of your cum-packed cock");
				if(pc.isCrotchGarbed()) output(" and cover up");
				output(", ready to resume the fight.");
			}
			//Reqs: Crotch skill 50+
			else if(select == 12)
			{
				//Clothed: 
				if(pc.isCrotchGarbed()) output("You slip off your [pc.lowerGarments]");
				else output("You take a moment to relish being uncovered");
				output(" and let your hands descend to your [pc.crotch]. ");
				if(pc.hasCock()) output("One of your hands takes [pc.oneCock] near the tip, thumb circling the [pc.cockHead]. ");
				if(pc.hasVagina() && !pc.hasCock())
				{
					output("One of your hands");
				}
				else if(pc.hasVagina()) output("Your other hand");
				if(pc.hasVagina()) output(" opens [pc.oneVagina], giving your foe a good view of the glorious [pc.vaginaColor] interior. ");
				output("After a bit, ");
				if(pc.hasCock()) output("[pc.cum] begins to bubble from your dick");
				if(pc.hasVagina() && pc.hasCock()) output(" while");
				if(pc.hasVagina()) output(" [pc.girlCum] gleams fresh in your cunt");
				output(", and you sample your ");
				if(!(pc.hasCock() && pc.hasVagina())) output("fluid");
				else output("fluids");
				output(" to take a taste.");

				output("\n\n<i>“");
				if(pc.hasCock() && pc.hasVagina()) output("[pc.CumFlavor] and [pc.girlCumFlavor], two great tastes that go great together. Herm " + pc.mf("boys","girls") + " really do get the best of everything.");
				//Male: 
				else if(pc.hasCock()) output("Sure you don’t want some of this [pc.cumNoun] for yourself? It’s nice and [pc.cumFlavor], " + pc.mf("a real man’s spunk","perfect for a “girl” like me") + ".");
				else if(pc.hasVagina()) 
				{
					output("Mmm, can’t get enough of that all-natural [pc.girlCumFlavor] taste. Come get some");
					if(pc.wettestVaginalWetness() >= 3) output(". I’ve got plenty to go around");
					output(".");
				}
				output("”</i>");

				output("\n\nYou don’t give your foe much longer to watch your self-serve taste test before you ");
				if(pc.isCrotchGarbed()) output(" cover back up");
				else 
				{
					output(" return your attention to the fight");
					if(pc.hasCock())
					{
						if(pc.hasSheath() || pc.hasStatusEffect("Genital Slit")) output(", your [pc.cock] returning to its container");
					}
				}
				output(", but they can still see vestiges of ");
				if(pc.hasCock()) output("[pc.cumColor]");
				if(pc.hasVagina() && pc.hasCock()) output(" and ");
				if(pc.hasVagina()) output("[pc.girlCumColor]");
				output(" on your lips.");
			}
			//Reqs: PC is in combat with a zil male, zil female, or the dual zil when meeting Penny, PC has a zil vagina
			else if(select == 13)
			{
				//PC is relevantly clothed: 
				if(pc.isCrotchGarbed()) output("You slip your [pc.lowerGarments] down just enough to reveal");
				else output("You adjust your thighs to highlight");
				output(" where your [pc.skinFurScalesColor] starts to give way to the dusky shade of [pc.oneVagina], drawing your target’s gaze.");
				output("\n\n<i>“Surprised? When I saw ");
				if(target is ZilFemale) output("you girls");
				else output("your zil girls");
				output(" with those exotic pussies, I just had to try it for myself.”</i>");
				//clothed:
				if(pc.isCrotchGarbed()) output(" Your [pc.lowerGarment] comes down the rest of the way");
				else output(" You move your thighs away");
				output(", allowing you to spread yourself to reveal your [pc.vaginaColor] interior.");
				//[pc.vaginaColor == gold]
				if(pc.vaginas[0].vaginaColor == "gold") 
				{
					output(" <i>“See? Just like ");
					if(target is ZilFemale)  output("yours");
					else output("the ones you’re used to");
					output(".”</i>");
				}
				else output(" <i>“But I thought another color on the inside would look even nicer.”</i>");
				//[pc.girlCum == honey]
				if(pc.girlCumType == GLOBAL.FLUID_TYPE_HONEY) 
				{
					output("\n\n<i>“I even cum honey now");
					if(pc.vaginas[0].wetness() >= 3) output(", a lot more than most zil even");
					output(".”</i>");
				}
				else 
				{
					output("\n\n<i>“The taste is totally different, though.  So, [pc.girlCumFlavor] compared to what you’re used to, though I bet you’d love it if you tried it.");
					if(pc.vaginas[0].wetness() >= 3) output(" There's a lot, so you’d have to make sure to drink up every drop.");
					output("”</i>");
				}
				output("\n\nYou allow your fingers to rub up and down across your folds, showcasing it for your foe.  <i>“I’ve gotta say, I’m really loving having a honeypot like this... maybe I’ll give you a taste, if you’re a good " + target.mfn("boy","girl","...thing") + ".”</i>");
				//Clothed:
				if(pc.isCrotchGarbed()) output(" You close up your [pc.lowerGarments]");
				else output(" You adjust your thighs back to their normal stance");
				output(" as you say this, taking a moment to suck your fingers clean with a wink.");
			}
		}
		
		private function teaseSquirt(target:Creature):void
		{
			var teaseCount:Number = 0;
			var likeAdjustments:Array = new Array();
			
			//Get tease count updated
			if(flags["TIMES_CHEST_TEASED"] == undefined) flags["TIMES_CHEST_TEASED"] = 0;
			teaseCount = flags["TIMES_CHEST_TEASED"];
			if(teaseCount > 100) teaseCount = 100;
			
			if(pc.biggestTitSize() >= 5 && target.sexualPreferences.getPref(GLOBAL.SEXPREF_BIG_BREASTS) > 0)
				likeAdjustments[likeAdjustments.length] = target.sexualPreferences.getPref(GLOBAL.SEXPREF_BIG_BREASTS);
			if(pc.biggestTitSize() < 4 && target.sexualPreferences.getPref(GLOBAL.SEXPREF_SMALL_BREASTS) > 0)
				likeAdjustments[likeAdjustments.length] = target.sexualPreferences.getPref(GLOBAL.SEXPREF_SMALL_BREASTS);
			if((pc.bRows() > 1 || pc.totalBreasts() / pc.bRows() > 2) && target.sexualPreferences.getPref(GLOBAL.SEXPREF_MULTIPLES) > 0) 
				likeAdjustments[likeAdjustments.length] = target.sexualPreferences.getPref(GLOBAL.SEXPREF_MULTIPLES);
			if(pc.biggestTitSize() >= 25 && target.sexualPreferences.getPref(GLOBAL.SEXPREF_HYPER) > 0) 
				likeAdjustments[likeAdjustments.length] = target.sexualPreferences.getPref(GLOBAL.SEXPREF_HYPER);
			if(pc.hasFuckableNipples() && target.sexualPreferences.getPref(GLOBAL.SEXPREF_NIPPLECUNTS) > 0) 
				likeAdjustments[likeAdjustments.length] = target.sexualPreferences.getPref(GLOBAL.SEXPREF_NIPPLECUNTS);
			if(pc.isLactating() && target.sexualPreferences.getPref(GLOBAL.SEXPREF_LACTATION) > 0) 
				likeAdjustments[likeAdjustments.length] = target.sexualPreferences.getPref(GLOBAL.SEXPREF_LACTATION);
			
			clearOutput();
			
			if (target is CrystalGooT1 && (target as CrystalGooT1).ShouldIntercept())
			{
				(target as CrystalGooT1).SneakSqueezeAttackReaction( { isSquirt: true } );
			}
			else
			{
				squirtTeaseText(target);
				applyTeaseDamage(pc, target, teaseCount, "SQUIRT", likeAdjustments);
			}
			processCombat();
		}
		
		private function squirtTeaseText(target:Creature):void
		{
			output("You grab the sides of your [pc.breasts]. With a single squeeze, you squirt a stream of [pc.milk] at your opponent!");
			pc.milked(25);
		}
		
		private function applyTeaseDamage(attacker:Creature, target:Creature, teaseCount:Number, teaseType:String, likeAdjustments:Array = null):void
		{
			if (target is Celise)
			{
				output("\n");
				processCombat();
				return;
			}
			
			var factor:Number = 1;
			var bonus:int = 0;
			
			if (likeAdjustments && likeAdjustments.length > 0)
			{
				for (var i:int = 0; i < likeAdjustments.length; i++) factor *= likeAdjustments[i];
			}
			
			if (attacker.hasStatusEffect("Sex On a Meteor") || attacker.hasStatusEffect("Tallavarian Tingler")) factor *= 1.5;
			if (target.originalRace == "nyrea" && attacker.hasPerk("Nyrean Royal")) factor *= 1.1;
			
			if (factor > 2) factor = 2;
		
			if (attacker.hasPerk("Pheromone Cloud")) bonus += 1;
			if (teaseType == "SQUIRT") bonus += 2;
			
			var sweatyBonus:int = 0;
			if(attacker.hasStatusEffect("Sweaty") && target.hasPerk("Likes_Sweaty")) 
			{
				//-5 per level normally, so add twice that since we flippin it'
				sweatyBonus = attacker.statusEffectv1("Sweaty") * 10;
				//Furries dont benefit quite as much.
				if(attacker.hasFur()) sweatyBonus = attacker.statusEffectv1("Sweaty") * 5;
			}
			
			if (target.isLustImmune || (target.willpower() / 2 + rand(20) + 1 > attacker.level * 2.5 * factor + 10 + teaseCount / 10 + attacker.sexiness() + bonus + sweatyBonus))
			{
				if(target is HandSoBot)
				{
					output("\n\n<i>“An attempt to confuse and overwhelm an enemy with an overt display of sexual dominance,”</i> says So. She sounds genuinely interested. <i>“An unorthodox but effective strategy in many known organic cultures’ approach to war. I was unaware sentients of a human upbringing had any experience of such a thing, however. Perhaps that explains why you are attempting it against a foe that cannot in any way feel desire.”</i>");
				}
				else if(target.isLustImmune == true) 
				{
					output("\n\n<b>" + target.capitalA + target.uniqueName  + " </b>");
					if(target.isPlural) output("<b>don't</b>");
					else output("<b>doesn't</b>");
					output("<b> seem to care to care for your erotically-charged display.</b>");
				}
				else if(teaseType == "SQUIRT") 
				{
					output("\n\nYour milk goes wide.");
					teaseSkillUp(teaseType);
				}
				else if (target is HuntressVanae || target is MaidenVanae)
				{
					output("\n\n");
					output(teaseReactions(0, target));
					output(" (0)");
					teaseSkillUp(teaseType);
				}
				else if (target is WetraHound)
				{
					output("\n\n");
					kGAMECLASS.wetraHoundAnimalIntellect();
					output(" (0)");
					teaseSkillUp(teaseType);
				}
				else {
					output("\n\n" + target.capitalA + target.uniqueName  + " ");
					if(target.isPlural) output("resist");
					else output("resists");
					output(" your erotically charged display... this time.");

					teaseSkillUp(teaseType);
				}
			}
			else
			{
				var damage:Number = 10 * (teaseCount / 100 + 1) + attacker.sexiness() / 2 + sweatyBonus / 2;
				if (teaseType == "SQUIRT") damage += 5;
				if (attacker.hasPerk("Pheromone Cloud")) damage += 1 + rand(4);
				damage *= (rand(31) + 85) / 100;
				
				if (damage > 15 + attacker.level * 2) damage = 15 + attacker.level * 2;
				damage *= factor;
				
				damage = (1 - (target.getLustResistances().tease.damageValue / 100)) * damage;
				if (damage > 25 + attacker.level * 2) damage = 25 + attacker.level * 2;
				
				if(target.lust() + damage > target.lustMax()) damage = target.lustMax() - target.lust();
				damage = Math.ceil(damage);
			
				output("\n\n");
				if(teaseType == "SQUIRT") 
				{
					if(target.isPlural) output(target.capitalA + target.uniqueName  + " are splattered with your [pc.milk], unable to get it off. All of a sudden, their faces begin to flush, and they look quite aroused.");
					else output(target.capitalA + target.uniqueName  + " is splattered with your [pc.milk], unable to get it off. All of a sudden, " + target.mfn("his","her","its") + " " + target.face() + " begins to flush, and " + target.mfn("he","she","it") + " looks quite aroused.");
				}
				else output(teaseReactions(damage,target));
				target.lust(damage);
				
				var damageResult:DamageResult = new DamageResult();
				if (damage > 0)
				{
					damageResult.lustDamage = damage;
					damageResult.typedLustDamage.tease.damageValue = damage;
				}
				else
				{
					damageResult.lustResisted = true;
				}
				
				outputDamage(damageResult);
				
				teaseSkillUp(teaseType);
				if(target is MyrInfectedFemale && damage >= 10)
				{
					//output("\n\n<b>Your teasing has the poor girl in a shuddering mess as she tries to regain control of her lust addled nerves.</b>");
					var stunDur:int = 1 + rand(2);
					target.createStatusEffect("Stunned",stunDur,0,0,0,false,"Stun","Cannot take action!",true,0);
					target.createStatusEffect("Lust Stunned",stunDur,0,0,0,true,"Stun","Cannot take action!",true,0);
				}
			}
			
			// kGAMECLASS.setEnemy(target);
			if (attacker is PlayerCharacter) kGAMECLASS.playerMimbraneSpitAttack();
		}
		
		public static function teaseReactions(damage:Number, target:Creature):String 
		{
			var pc:Creature = kGAMECLASS.pc;
			
			var buffer:String = "";
			var textRands:Array = [];
			if (target is PlayerCharacter)
			{
				if (damage == 0) buffer = "You seem unimpressed.";
				else if (damage < 4) buffer = "You look a little intrigued by what you see.";
		 		else if (damage < 10) buffer = "You definitely seem to be enjoying the show.";
		 		else if (damage < 15) buffer = "You openly touch yourself as you watch lustfully.";
		 		else if (damage < 20) buffer = "You flush hotly with desire, your eyes filled with longing.";
		 		else buffer = "You lick your lips in anticipation, your hands idly stroking your own body.";
			}
			else if (target is HuntressVanae)
			{
				if (damage == 0)
				{
					textRands = [
						"The blind huntress snorts at your display and makes a quick jab at you with her spear. You leap out of the way just in time. <i>“All you're doing is leaving yourself open, " + ((pc.zilScore() >= 4 || pc.naleenScore() >= 5) ? "[pc.race]" : "outsider") + "!”</i> she exclaims.",
						"You utterly fail to entice the huntress. You barely dodge an attack that causes you to cease your efforts. You're going to have to do better, or try something else...",
						"The alien huntress seems to be getting into it, moving towards you... only to swipe her spear at your head. You barely duck in time. Seems she didn't go for it at all!"
					];
					
					buffer = textRands[rand(textRands.length)];
				}
				else if (damage < 4) buffer = "The busty huntress moans and begins cupping one of her " + target.breastDescript(0) + ", clearly titillated by your performance.";
				else if (damage < 10) buffer = "Your stacked opponent huskily moans and slips a webbed hand between her thighs, lewdly stroking her slit. She snaps out of it a few seconds later, biting her lip.";
				else if (damage < 20) buffer = "The alien huntress clenches her thighs together as she watches you, rubbing them together as she desperately tries to hide her arousal. Clearly you're having an effect on her!"
				else buffer = "The busty amazon parts her thighs and begins to stroke her twin clits to your lewd display, unable to stop herself. A few seconds later she jerks her webbed hand back, flushing wildly.";
			}
			else if (target is MaidenVanae)
			{
				if (damage == 0)
				{
					textRands = [
						"The young alien huntress jabs at you with her spear, forcing you to leap out of the way. <i>“Hey, this may be my first time, but I'm not </i>that<i> easy!”</i> she exclaims.",
						"The virgin huntress quirks her head, clearly baffled by your actions. It seems you utterly failed to entice her....",
						"The alien huntress fans her face with a webbed hand and moves closer to you. <i>“Oooh, I think I'm getting the vapors... </i>psyche<i>!”</i>",
					];
					
					buffer = textRands[rand(textRands.length)];
				}
				else if (damage < 4) buffer = "The virgin huntress blushes and begins eagerly touching one of her [vanaeMaiden.nipples]. She's clearly aroused by your performance.";
				else if (damage < 10) buffer = "The virgin huntress lets out a little moan and slips one of her webbed hands between her thighs. She awkwardly teases her glistening slit, getting all worked up.";
				else if (damage < 20) buffer = "The young alien huntress places a hand over her loins and rubs her thighs together. She's desperately trying to hide her rather obvious arousal. The sweet scent of her arousal fills the air.";
				else buffer = "The wispy amazon parts her thighs and begins to stroke her twin clits to your lewd display, unable to stop herself. A few seconds later she jerks her webbed back, flushing wildly.";
			}
			else if (target.isPlural) {
				if (damage == 0) buffer = target.capitalA + target.uniqueName  + " seem unimpressed.";
				else if (damage < 4) buffer = target.capitalA + target.uniqueName + " look intrigued by what they see.";
				else if (damage < 10) buffer = target.capitalA + target.uniqueName + " definitely seem to be enjoying the show.";
				else if (damage < 15) buffer = target.capitalA + target.uniqueName + " openly stroke themselves as they watch you.";
				else if (damage < 20) buffer = target.capitalA + target.uniqueName + " flush hotly with desire, their eyes filled with longing.";
				else buffer = target.capitalA + target.uniqueName + " lick their lips in anticipation, their hands idly stroking their bodies.";
			}
			else {
				if (damage == 0) buffer = target.capitalA + target.uniqueName + " seems unimpressed.";
				else if (damage < 4) buffer = target.capitalA + target.uniqueName + " looks a little intrigued by what " + target.mf("he","she") + " sees.";
				else if (damage < 10) buffer = target.capitalA + target.uniqueName + " definitely seems to be enjoying the show.";
				else if (damage < 15) buffer = target.capitalA + target.uniqueName + " openly touches " + target.mfn("him","her","it") + "self as " + target.mfn("he","she","it") + " watches you.";
				else if (damage < 20) buffer = target.capitalA + target.uniqueName + " flushes hotly with desire, " + target.mfn("his","her","its") + " eyes filled with longing.";
				else buffer = target.capitalA + target.uniqueName + " licks " + target.mfn("his","her","its") + " lips in anticipation, " + target.mfn("his","her","its") + " hands idly stroking " + target.mfn("his","her","its") + " own body.";
			}
			return buffer;
		}
		
		private function teaseSkillUp(teaseType:String):void
		{
			if (teaseType == "SQUIRT") teaseType = "CHEST";
			flags["TIMES_" + teaseType + "_TEASED"]++; // the menu display handles wrapping this so w/e
		}
		
		private function generateSenseMenu(attacker:Creature, target:Creature):void
		{
			clearOutput();
	
			if (target is Cockvine)
			{
				kGAMECLASS.adultCockvineSenseOverride();
				processCombat();
				return;
			}
			
			output("You try to get a feel for " + possessive(target.a + target.uniqueName) + " likes and dislikes!");
			if(target.isLustImmune) output("\nYou don't think sexuality can win this fight!");
			var buffer:String = "";
			var PCBonus:Number = pc.intelligence()/2 + pc.libido()/20;
			if(pc.hasPerk("Fuck Sense")) PCBonus = pc.libido();
			for(var i:int = 0; i < GLOBAL.MAX_SEXPREF_VALUE; i++) {
				buffer = GLOBAL.SEXPREF_DESCRIPTORS[i];
				//If has a preference set, talk about it!
				if(target.sexualPreferences.getPref(i) != 0) {
					output("\n");
					//If succeeds at sense check!
					if(PCBonus + rand(20) + 1 >= target.level * 3 * (150-target.libido())/100) 
					{
						if(target.sexualPreferences.getPref(i) == GLOBAL.REALLY_LIKES_SEXPREF)
						{
							output(buffer + ": Really likes!");
						}
						else if(target.sexualPreferences.getPref(i) == GLOBAL.KINDA_LIKES_SEXPREF)
						{
							output(buffer + ": Kinda likes!");
						}
						else if(target.sexualPreferences.getPref(i) == GLOBAL.KINDA_DISLIKES_SEXPREF)
						{
							output(buffer + ": Dislikes!");
						}
						else if(target.sexualPreferences.getPref(i) == GLOBAL.REALLY_DISLIKES_SEXPREF)
						{
							output(buffer + ": Dislikes a lot!");
						}
						else 
						{
							output(buffer + ": ERROR");
						}
					}
					//if fails!
					else 
					{
						output(buffer + ": You aren't sure.")
					}
				}
			}
			if(target is HandSoBot) output("\n\nWhilst your teases have some effect on synthetics designed for sex, you sense there is no point whatsoever trying it on with what amounts to a bipedal forklift truck.");
		}
		
		private function checkForLoss():Boolean
		{
			var tEnemy:Creature;
			
			var lossCondition:Boolean = playerLossCondition();
			
			// Naleen special loss handling
			if (!lossCondition)
			{
				lossCondition = (hasEnemyOfClass(Naleen) || hasEnemyOfClass(NaleenMale)) && (pc.hasStatusEffect("Naleen Venom") && (pc.physique() == 0 || pc.willpower() == 0));
			}
			
			if (lossCondition)
			{
				if (victoryCondition == CombatManager.SPECIFIC_TARGET_DEFEATED)
				{
					tEnemy = victoryArgument;
				}
				else
				{
					tEnemy = _hostiles[0];
				}
				
				CombatManager.showCombatUI();
				
				clearMenu();
				addButton(0, "Defeat", function(t_enemy:Creature, t_lossFunctor:Function):Function {
					return function():void {
						clearOutput();
						
						if (pc.lust() >= pc.lustMax() || pc.HP() <= 0) 
						{
							if (pc.HP() <= 0) 
							{
								if(CombatManager.multipleEnemies()) output("<b>Your enemies have knocked you off your " + pc.feet() + "!</b>\n\n");
								else output("<b>" + t_enemy.capitalA + t_enemy.short + " has knocked you off your " + pc.feet() + "!</b>\n\n");
							}
							else
							{
								if (CombatManager.multipleEnemies()) output("<b>Your enemies have turned you on too much to keep fighting. You give in....</b>\n\n");
								else output("<b>" + t_enemy.capitalA + t_enemy.short + " has turned you on too much to keep fighting. You give in....</b>\n\n");
							}
						}
						
						kGAMECLASS.setEnemy(t_enemy);
						CombatManager.showCombatUI();
						t_lossFunctor();
					}
				}(tEnemy, _lossFunction));
				return true;
			}
			return false;
		}
		
		private function checkForVictory():Boolean
		{
			if (playerVictoryCondition())
			{
				// TODO Here is where we could potentially need some indirection, depending
				// on author intenent.
				// Basically, we need kGAMECLASS.enemy to be valid before allowing
				// _victoryFunction to execute, as this replaces enemy.
				// ERGO, for most scenes, kGAMECLASS.setEnemy(_hostiles[0]) will suffice,
				// but some multi-enemy fights may want to offer the option to "select"
				// a victim (or an 'attacker' as it were) somehow.
				// _victoryFunction itself could handle this, but potentially enabling
				// some level of menu selection to be configured as part of the 
				// combatContainer itself could be useful.
				
				// FOR NOW, we'll just ensure enemy is set to _hostiles[0], and if anything
				// different needs to happen, the individual _victoryFunctions will have
				// to do what they want
				
				var tEnemy:Creature;
				
				// If it is a 'special' target, assume that will be the enemy we care about
				if (victoryCondition == CombatManager.SPECIFIC_TARGET_DEFEATED)
				{
					tEnemy = victoryArgument;
				}
				else
				{
					tEnemy = _hostiles[0];
				}
				
				CombatManager.showCombatUI();
				
				clearMenu();
				addButton(0, "Victory", function(t_enemy:Creature, t_victoryFunctor:Function):Function {
					return function():void {
						clearOutput();
						
						if (t_enemy.HP() <= 0) output("<b>You’ve knocked the resistance out of " + t_enemy.a + t_enemy.uniqueName + ".</b>\n\n");
						else if (t_enemy.lust() >= 100) 
						{
							output("<b>" + t_enemy.capitalA + t_enemy.short + " </b>");
							if(CombatManager.multipleEnemies()) output("<b>are </b>");
							else output("<b>is </b>");
							output("<b>too turned on to fight.</b>\n\n");
						}
						
						kGAMECLASS.setEnemy(t_enemy);
						CombatManager.showCombatUI();
						t_victoryFunctor();
					}
				}(tEnemy, _victoryFunction));
				return true;
			}
			return false;
		}
		
		public function CombatContainer()
		{ 
			_roundCounter = 1;
			
			genericVictory = function():void {
				StatTracking.track("combat/wins");
				getCombatPrizes();
				doCombatCleanup();
			}
			
			genericLoss = function():void {
				StatTracking.track("combat/losses");
				clearMenu();
				if (StatTracking.getStat("combat/wins") == 0 && StatTracking.getStat("combat/losses") == 3)
				{
					addButton(0, "Next", helpBadPCsOut);
				}
				else if (StatTracking.getStat("combat/wins") == 0 && StatTracking.getStat("combat/losses") == 5)
				{
					addButton(0, "Next", helpReallyBadPCsOut);
				}
				else if (pc.level == 1 && (hasEnemyOfClass(NaleenMale) || hasEnemyOfClass(Naleen) || hasEnemyOfClass(HuntressVanae) || hasEnemyOfClass(MaidenVanae))) addButton(0, "Next", helpDumbPCsOut);
				else addButton(0, "Next", postCombatReturnToMenu);
				doCombatCleanup();
			}
		}
		
		private function helpBadPCsOut():void
		{
			clearOutput();
			kGAMECLASS.showName("T.I.T.S.\nHELP")
			output("(If you're struggling with combat difficulty, consider accessing <b>easy mode</b>. Easy mode reduces all damage (both normal and lust) by 50%. You can turn it on at any time by bringing up the menu and entering the options submenu.\n\nThe menu button is located in the bottom left of the interface - the three horizontal lines. It has been highlighted for convenience.");
			kGAMECLASS.userInterface.mainMenuButton.Glow();
			output("\n\nAdditionally, remember that you should have at least one class ability to use as well as tease attacks. Several melee weapons are also available in Esbeth can be purchased for a reasonable amount of money - if you'd like a little extra punch.)");
			clearMenu();
			addButton(0,"Next", postCombatReturnToMenu);
		}
		
		private function helpReallyBadPCsOut():void
		{
			clearOutput();
			kGAMECLASS.showName("T.I.T.S.\nHELP")
			output("(Are you having difficulty winning fights? If so, select yes for a minor statistical boost to your combat prowess.)");
			clearMenu();
			addButton(0,"Boost Me",boostMeCaptain);
			addButton(1,"No", postCombatReturnToMenu);
		}
		
		private function boostMeCaptain():void
		{
			pc.physique(1);
			pc.reflexes(1);
			pc.aim(1);
			pc.intelligence(1);
			pc.willpower(1);
			pc.HP(pc.HPMax());
			pc.energy(pc.energyMax());
			postCombatReturnToMenu();
		}
		
		private function helpDumbPCsOut():void
		{
			clearOutput();
			kGAMECLASS.showName("T.I.T.S.\nHELP")
			output("(That foe was unsuitable for a character of your level. Consider taking the northern path out of Esbeth until after you have reached level two or three.)");
			clearMenu();
			addButton(0,"Next",postCombatReturnToMenu);
		}
		
		private var _initForRound:int = -1;
		public function doneRoundActions():Boolean
		{
			if (_initForRound == _roundCounter) return true;
			return false;
		}
		
		public var genericLoss:Function;
		public var genericVictory:Function;
		
		protected var _roundCounter:int = 0;
		public function get roundCounter():int { return _roundCounter; }
		
		protected var _entryFunction:Function;
		
		public function get entryFunction():Function { return _entryFunction; }
		public function set entryFunction(v:Function):void { _entryFunction = v; }
		
		protected var _victoryFunction:Function;
		protected var _lossFunction:Function;
		public function victoryScene(func:Function):void
		{
			_victoryFunction = func;
		}
		public function lossScene(func:Function):void
		{
			_lossFunction = func;
		}
		
		protected var _friendlies:Array = null;
		protected var _hostiles:Array = null;
		public var noImportProcess:Boolean = false;
		
		private function prepFriendlyForCombat(target:Creature):void
		{
			target.droneTarget = null;
			target.alreadyDefeated = false;
			if (!(target is PlayerCharacter))
			{
				// TODO: Realistically, characters that join the player in combat should be subject to the same passage of time rules... but that's another story
				target.HPRaw = target.HPMax();
				target.shieldsRaw = target.shieldsMax();
				target.lustRaw = 0;
			}
		}
		
		private function prepHostileForCombat(target:Creature):void
		{
			target.droneTarget = null;
		}
		
		public function setPlayerGroup(... args):void
		{
			if (args.length > 1)
			{
				_friendlies = args;
			}
			else if (args.length == 1)
			{
				if (args[0] is Array)
				{
					_friendlies = args[0];
				}
				else if (args[0] is Creature)
				{
					_friendlies = [args[0]];
				}
			}
			
			for (var i:int = 0; i < _friendlies.length; i++)
			{
				prepFriendlyForCombat(_friendlies[i]);
				makeCharacterUnique(_friendlies[i], FRIENDLY_GROUP);
			}
		}
		public function addFriendlyCreature(newC:Creature):void
		{
			prepFriendlyForCombat(newC);
			_friendlies.push(newC);
			makeCharacterUnique(newC, FRIENDLY_GROUP);
			showCombatUI();
		}
		
		// Store the next for name-append in the class, so we can use it
		// later if we need it.		
		public function setEnemyGroup(... args):void
		{
			if (args.length > 1)
			{
				_hostiles = args;
			}
			else if (args.length == 1)
			{
				if (args[0] is Array)
				{
					_hostiles = args[0];
				}
				else if (args[0] is Creature)
				{
					_hostiles = [args[0]];
				}
			}
			
			for (var i:int = 0; i < _hostiles.length; i++)
			{
				prepHostileForCombat(_hostiles[i]);
				makeCharacterUnique(_hostiles[i], HOSTILE_GROUP);
			}
		}
		public function addHostileCreature(newC:Creature):void
		{
			prepHostileForCombat(newC);
			_hostiles.push(newC);
			makeCharacterUnique(newC, HOSTILE_GROUP);
			showCombatUI(); // force an update
		}
		
		private function makeCharacterUnique(target:Creature, asGroup:String):void
		{
			var appends:Array = ["A", "B", "C", "D", "E"];
			
			var thisIndex:int = 0;
			var hasSameType:Boolean = false;
			var tType:Class = Class(getDefinitionByName(getQualifiedClassName(target)));
			var collection:Array = (asGroup == HOSTILE_GROUP ? _hostiles : _friendlies);
			
			var currIndex:int = 0;
			
			// Loop over all the current creatures
			for (var i:int = 0; i < collection.length; i++)
			{
				var currTarget:Creature = collection[i] as Creature;
				
				// Looking for creatures of the same type as the one we're adding
				if (currTarget is tType && currTarget != target)
				{
					// Fuck it, just force set these every time through :V
					/*
					// Check if it has a unique character appended
					var lastChar:String = currTarget.uniqueName.charAt(currTarget.uniqueName.length - 1);
					
					// If it doesn't, append the one relative to the currentTargets position in the array
					if (!InCollection(lastChar, appends))
					{
					*/
						currTarget.uniqueName = currTarget.short + " " + appends[currIndex];
						currTarget.buttonText = currTarget.btnTargetText + " " + appends[currIndex];
					/*
					}
					*/
					hasSameType = true;
					currIndex++;
				}
			}
			
			// We ain't fiddled the one we're adding, so it'll be unique so just treat it as such
			if (!hasSameType)
			{
				target.uniqueName = target.short;
				target.buttonText = target.btnTargetText;
			}
			else
			{
				target.uniqueName = target.short + " " + appends[currIndex];
				target.buttonText = target.btnTargetText + " " + appends[currIndex];
			}
		}
		
		public var victoryCondition:String = CombatManager.ENTIRE_PARTY_DEFEATED;
		public var victoryArgument:* = null;
		public var lossCondition:String = CombatManager.ENTIRE_PARTY_DEFEATED;
		public var lossArgument:* = null;
		
		protected var _combatEffects:Object = { };
		public function addCombatEffect(effect:StorageClass):void
		{
			if (!hasCombatEffect(effect.storageName))
			{
				_combatEffects[effect.storageName] = effect;
			}
			else
			{
				throw new Error("CombatEffect \"" + effect.storageName + "\" already exists.");
			}
		}
		public function removeCombatEffect(effectName:String):void
		{
			if (hasCombatEffect(effectName))
			{
				delete _combatEffects[effectName];
			}
		}
		public function hasCombatEffect(effectName:String):Boolean
		{
			if (_combatEffects[effectName] != undefined) return true;
			return false;
		}
		
		public function doCombatCleanup():void
		{
			kGAMECLASS.setEnemy(null);
			kGAMECLASS.setAttacker(null);
			kGAMECLASS.setTarget(null);
			
			doCleanup(_friendlies);
		}
		
		private function doCleanup(group:Array):void
		{
			for (var i:int = 0; i < group.length; i++)
			{
				doCleanupFor(group[i]);
			}
		}
		
		private function doCleanupFor(target:Creature):void
		{
			// Remove all combat effects
			target.clearCombatStatuses();
			target.alreadyDefeated = false;
		}
		
		public function beginCombat():void
		{
			validateContainer();
			showCombatDescriptions();
			showCombatMenu();
			showCombatUI(true);
			userInterface().levelUpOff();
		}
		
		private function validateContainer():void
		{
			if (_victoryFunction == null) throw new Error("No victory function has been specified.");
			if (_lossFunction == null) throw new Error("No loss function has been specified.");
		}
		
		public function showCombatUI(setAsInit:Boolean = false):void
		{
			if (setAsInit)
			{
				userInterface().resetNPCStats();
				if (_friendlies.length > 1) userInterface().resetPCStats();
			}
			
			userInterface().showPlayerParty(_friendlies, false);
			userInterface().showHostileParty(_hostiles, false);
		}
		
		private function showCombatDescriptions():void
		{
			showPlayerStatus();
			
			for (var i:int = 0; i < _friendlies.length; i++)
			{
				displayFriendlyStatus(_friendlies[i]);
			}
			
			if (encounterText != null)
			{
				output("\n\n" + encounterText);
			}
			else if (_hostiles.length > 1)
			{
				if (_friendlies.length > 1) output("\n\nTogether, y");
				else output("\n\nY");
				output("ou're fighting ");
				if (enemiesAlive() == 1) output("one hostile:");
				else output(num2Text(enemiesAlive()) + " hostiles:");
			}
			
			// TODO: I guess this would be the place to point out blindness or whatever.
			for (i = 0; i < _hostiles.length; i++)
			{
				displayHostileStatus(_hostiles[i]);
			}
		}
		
		private function displayHostileStatus(target:Creature):void
		{
			if (target is Celise)
			{
				kGAMECLASS.setEnemy(target);
				output("\n\n" + target.long);
				showMonsterArousalFlavor(target);
				kGAMECLASS.setEnemy(null);
				
				if(roundCounter == 1) output("\n\nVictor instructs, <i>“<b>Try and strike her, " + pc.short + ". Use a melee attack.</b>”</i>\n");
				else if(roundCounter == 2) output("\n\n<i>“Some foes are more vulnerable to ranged attacks than melee attacks or vice versa. <b>Why don’t you try using your gun?</b> Don’t worry, it won’t kill her.”</i> Victor suggests.\n");
				else if(roundCounter == 3) output("\n\n<i>“Didn’t work, did it? Celise’s race does pretty well against kinetic damage. Thermal weapons would work, but you don’t have any of those. You’ve still got one more weapon that galotians can’t handle - sexual allure. They’re something of a sexual predator, but their libidos are so high that teasing them back often turns them on to the point where they masturbate into a puddle of quivering sex.”</i> Victor chuckles. <i>“<b>Go ahead, try teasing her.</b> Fighting aliens is about using the right types of attacks in the right situations.”</i>\n");
				return;
			}
			
			if (target.HP() <= 0)
			{
				output("\n\n<b>You've knocked the resistance out of " + target.a + target.uniqueName + ".</b>");
			}
			else if (target.lust() >= target.lustMax())
			{
				output("\n\n<b>" + target.capitalA + target.uniqueName + ((target.isPlural == true) ? " are" : " is") + " too turned on to fight.</b>");
			}
			else
			{				
				if (encounterText == null)
				{
					if (_hostiles.length == 1 && _friendlies.length == 1 && target.long.length > 0)
					{
						kGAMECLASS.setEnemy(target);
						output("\n\n" + target.long);
						kGAMECLASS.setEnemy(null);
					}
					else
					{
						output("\n\n<b>" + StringUtil.toTitleCase(target.uniqueName) + ":</b>");
						if (target.long.length > 0) output("\n" + target.long);
						else if(target.lust() < 50 || target.isLustImmune == true) output("\n<i>Nothing in particular to take note of.</i>");
					}
				}
				
				// TODO Blinds had some effect on this...
				if (target is QueenOfTheDeep && !pc.hasStatusEffect("Watered Down"))
				{
					output("\n<b>You're still clinging to the monster's topside, limiting her ability to fight you!</b>");
					
					if (target.lust() >= 50) output("\nYou can see her breath quickening, her massive chest heaving with nipples as hard as diamonds. She looks almost ready to cum just from your confrontation...");
				}
				
				if (!(target is QueenOfTheDeep) && !(target is Cockvine))
				{
					kGAMECLASS.setEnemy(target);
					target.getCombatDescriptionExtension();
					showMonsterArousalFlavor(target);
					kGAMECLASS.setEnemy(null);
				}
			}
		}
		
		private function displayFriendlyStatus(target:Creature):void
		{
			if (target is PlayerCharacter)
			{
				return;
			}
				
			if (target.HP() <= 0)
			{
				output("\n\n<b>" + target.capitalA + target.uniqueName + " is down and out for the count!</b>");
			}
			else if (target.lust() >= target.lustMax())
			{
				output("\n\n<b>" + target.capitalA + target.uniqueName + ((target.isPlural == true) ? " are" : " is") + " too turned on to fight.</b>");
			}
			else if (target.long.length > 0)
			{
				/*
				var pHealth:Number = target.HP() / target.HPMax();
				var pShield:Number = target.shieldsRaw / target.shieldsMax();
				
				pHealth *= 100;
				pShield *= 100;
				
				var dHealth:int = Math.round(pHealth);
				var dShield:int = Math.round(pShield);
				*/

				output("\n\n" + target.long); // + " (<b>S: " + dShield + "% / H: " + dHealth + "%</b>)");
			}
		}
		
		private function showPlayerStatus():void
		{
			if (pc.lust() >= pc.lustMax())
			{
				if (enemiesAlive() > 1 || _hostiles[0].isPlural) output("<b>Your enemies have knocked you off your " + pc.feet() + "!</b>");
				else output("<b>" + _hostiles[0].capitalA + _hostiles[0].uniqueName + " has knocked you off your " + pc.feet() + "</b>");
			}
			else if (pc.HP() <= 0)
			{
				if (enemiesAlive() > 1 || _hostiles[0].isPlural) output("<b>Your enemies have turned you on too much to keep fighting. You give in....</b>");
				else output("<b>" + _hostiles[0].capitalA + _hostiles[0].uniqueName + " has turned you on too much to keep fighting. You give in....</b>"); // TODO should be able to pick out a defined 'leader'
			}
			else if (_hostiles.length == 1 && _friendlies.length == 1)
			{
				output("<b>You’re fighting " + _hostiles[0].a + _hostiles[0].uniqueName + ".</b>");
			}
			else
			{
				// TODO Some decent player status output
				output("You perch behind cover wherever you can find it, ready to return fire");
				if (_friendlies.length > 1)
				{
					output(" side-by-side with your");
					if (_friendlies.length > 2) output(" allies");
					else output(" companion");
				}
				output(".");
			}
			
			kGAMECLASS.mutinousMimbranesCombat();
			kGAMECLASS.neglectedMimbranesCombat();
		}
		
		private function showMonsterArousalFlavor(target:Creature):void
		{
			if (target.lust() < 50 || target.isLustImmune == true)
			{ 
				return; 
			}
			else if (target.isPlural)
			{
				if(target.lust() < 60) output("\n" + target.capitalA + possessive(target.uniqueName) + " skins remain flushed with the beginnings of arousal.");
				else if(target.lust() < 70) output("\n" + target.capitalA + possessive(target.uniqueName) + " eyes constantly dart over your most sexual parts, betraying their lust.");
				else if (target.lust() < 85)
				{
					if(target.hasCock()) output("\n" + target.capitalA + target.uniqueName + " are having trouble moving due to the rigid protrusions in their groins.");
					if(target.hasVagina()) output("\n" + target.capitalA + target.uniqueName + " are obviously turned on; you can smell their arousal in the air.");
				}
				else
				{
					if(target.hasCock()) output("\n" + target.capitalA + target.uniqueName + " are panting and softly whining, each movement seeming to make their bulges more pronounced.  You don't think they can hold out much longer.");
					if(target.hasVagina()) output("\n" + target.capitalA + possessive(target.uniqueName) + " " + plural(target.vaginaDescript()) + " are practically soaked with their lustful secretions.");
				}
			}
			else
			{
				if(target.lust() < 60) output("\n" + target.capitalA + possessive(target.uniqueName) + " " + target.skin() + " remains flushed with the beginnings of arousal.");
				else if(target.lust() < 70) output("\n" + target.capitalA + possessive(target.uniqueName) + " eyes constantly dart over your most sexual parts, betraying " + target.mfn("his","her","its") + " lust.");
				else if (target.lust() < 85)
				{
					if(target.hasCock()) output("\n" + target.capitalA + target.uniqueName + " is having trouble moving due to the rigid protrusion in " + target.mfn("his","her","its") + " groin.");
					if(target.hasVagina()) output("\n" + target.capitalA + target.uniqueName + " is obviously turned on, you can smell " + target.mfn("his","her","its") + " arousal in the air.");
				}
				else
				{
					if(target.hasCock()) output("\n" + target.capitalA + target.uniqueName + " is panting and softly whining, each movement seeming to make " + target.mfn("his","her","its") + " bulge more pronounced.  You don't think " + target.mfn("he","she","it") + " can hold out much longer.");
					if(target.hasVagina()) output("\n" + target.capitalA + possessive(target.uniqueName) + " " + target.vaginaDescript() + " is practically soaked with " + target.mfn("his","her","its") + " lustful secretions.  ");
				}
			}
		}
		
		public function processCombat():void
		{
			displayBusts();
			doCombatDrone(pc);
			processFriendlyGroupActions();
			if (hasEnemyOfClass(Varmint))
			{
				// TODO: might be an idea to make this more resilient
				var varm:Varmint = _hostiles[0];
				if (varm.statusEffectv1("Lassoed") == 1) { /* Hogtied! */ }
				else varm.removeStatusEffect("Lassoed");
			}
		}
		
		private function doCombatDrone(droneUser:Creature):void
		{
			if (droneUser.hasCombatDrone() && droneUser.droneTarget != null && droneUser.shields() > 0)
			{
				var target:Creature = droneUser.droneTarget;
				if (!target.isDefeated())
				{
					output("\n");
					
					// If the user has an accessory equipped that potentially overrides the drone attack to use, use that.
					if (droneUser.accessory.droneAttack != null)
					{
						droneUser.accessory.droneAttack(droneUser, target);
					}
					else
					{
						CombatAttacks.DroneAttack(droneUser, target);
					}
				}
			}
		}
		
		private function processFriendlyGroupActions():void
		{
			displayBusts(FRIENDLY_GROUP);
			applyFriendlyActions();
			updateStatusEffects(_friendlies);
			updateCooldowns(_friendlies);
			
			// Mark anything that the players group has beaten as done so now, so that it
			// cannot act during the next hostile group update
			for (var i:int = 0; i < _hostiles.length; i++)
			{
				if (_hostiles[i].isDefeated() && _hostiles[i].alreadyDefeated == false)
				{
					_hostiles[i].alreadyDefeated = true;
					
					// Legacy mode kinda- if we're in a single-enemy fight, don't output anything.
					if (_hostiles.length > 1)
					{
						output("\n\n" + StringUtil.capitalize(_hostiles[i].uniqueName, false) + " falls to the ground,");
						if (_hostiles[i].HP() <= 0) output(" defeated.");
						else output(" stricken with lust.");
					}
				}
				else if (_hostiles[i].isDefeated() && _hostiles[i].alreadyDefeated == true)
				{
					output("\n\n" + StringUtil.capitalize(_hostiles[i].uniqueName, false) + " lies on the ground, defeated.");
				}
			}
			
			// Add an early-out to avoid a hostile-round-display where no actions can be
			// done
			if (checkForVictory()) return;
			
			// Force a combatUI update
			showCombatUI();
			
			// If the player is not alone, scene-break
			if (_friendlies.length > 1)
			{
				clearMenu();
				addButton(0, "Next", processHostileGroupActions);
			}
			// Otherwise, tag the hostile actions on straight after
			else
			{
				processHostileGroupActions();
			}
		}
		
		private function applyFriendlyActions():void
		{
			for (var i:int = 0; i < _friendlies.length; i++)
			{
				if (enemiesAlive() == 0) break;
				
				var target:Creature = _friendlies[i];
				
				if (target is PlayerCharacter) continue;
				if (target.isDefeated()) continue; // TODO maybe allow the combatAI method to handle this- allows for a certain degree of cheese in encounter impl.
				
				if (target.hasStatusEffect("Paralyzed"))
				{
					// noop, handled by updateStatusEffects
				}
				else if (target.hasStatusEffect("Grappled"))
				{
					output("\n\n");
					doStruggleRecover(target);
				}
				else if (target.hasStatusEffect("Stunned"))
				{
					output("\n\n");
					doStunRecover(target);
				}
				else if (target.hasStatusEffect("Tripped"))
				{
					output("\n\n");
					doTripRecover(target);
				}
				else
				{
					output("\n\n");
					target.CombatAI(_friendlies, _hostiles);
				}
				
				doCombatDrone(target);
			}
		}
		
		private function processHostileGroupActions():void
		{
			if (_friendlies.length > 1)
			{
				clearOutput();
				output("<b>Hostile party actions:</b>");
			}
			
			displayBusts(HOSTILE_GROUP);
			applyHostileActions();
			updateStatusEffects(_hostiles);
			updateCooldowns(_hostiles);
			
			// Early-out in case a DOT tick defeated enemies
			if (checkForVictory()) return;
			
			for (var i:int = 0; i < _friendlies.length; i++)
			{
				if ((_friendlies[i] as Creature).isDefeated() && _friendlies[i].alreadyDefeated == false)
				{
					_friendlies[i].alreadyDefeated = true;
					if (_friendlies[i] is PlayerCharacter) output("\n\nYou fall to the ground,");
					else output("\n\n" + _friendlies[i].capitalA + _friendlies[i].uniqueName + " falls to the ground,");
					if (_friendlies[i].HP() <= 0) output(" defeated.");
					else output(" stricken with lust.");
				}
			}
			
			showCombatUI();
			
			if (!postHostileTurnActions())
			{
				endCombatRound();
			}
		}
		
		public function endCombatRound():void
		{
			// Early-out if the players group lost
			if (checkForVictory()) return;
			if (checkForLoss()) return;
			
			_roundCounter++;
			
			//removeAllButtonHighlights();
			clearMenu();
			addButton(0, "Next", showCombatMenu);
		}
		
		private function applyHostileActions():void
		{
			for (var i:int = 0; i < _hostiles.length; i++)
			{
				var target:Creature = _hostiles[i];
				
				if (target.isDefeated()) continue;
				
				if (target.hasStatusEffect("Paralyzed"))
				{
					// noop, this is handled as part of updateStatusEffectsFor()
				}
				else if (target.hasStatusEffect("Grappled"))
				{
					output("\n\n");
					doStruggleRecover(target);
				}
				else if (target.hasStatusEffect("Stunned"))
				{
					output("\n\n");
					doStunRecover(target);
				}
				else if (target.hasStatusEffect("Tripped"))
				{
					output("\n\n");
					doTripRecover(target);
				}
				else
				{
					output("\n\n");
					target.CombatAI(_hostiles, _friendlies);
				}
				
				doCombatDrone(target);
			}
		}
		
		private function updateCooldowns(group:Array):void
		{
			for (var i:int = 0; i < group.length; i++)
			{
				updateCooldownsFor(group[i]);
			}
		}
		
		private function updateCooldownsFor(target:Creature):void
		{
			var remove:Array = [];
			
			for (var i:int = 0; i < target.statusEffects.length; i++)
			{
				var se:StorageClass = target.statusEffects[i];
				
				if (se.storageName.indexOf("Cooldown") != -1)
				{
					if (se.value2 == 0) // V2 != 0 == till-end-of-combat cooldown
					{
						se.value1--; // Only decrement cooldowns we actually want here.
						
						if (se.value1 < 0)
						{
							remove.push(se.storageName);
						}
					}
				}
			}
			
			for (i = 0; i < remove.length; i++)
			{
				target.removeStatusEffect(remove[i]);
			}
		}
		
		private function playerVictoryCondition():Boolean
		{
			if (victoryCondition == CombatManager.ENTIRE_PARTY_DEFEATED)
			{
				for (var i:int = 0; i < _hostiles.length; i++)
				{
					if (!_hostiles[i].isDefeated()) return false;
				}
				return true;
			}
			else if (victoryCondition == CombatManager.SURVIVE_WAVES)
			{
				if (isNaN(victoryArgument) || victoryArgument <= 0) throw new Error("Wave survival declared as a win condition, with no target waves defined.");
				if (_roundCounter >= victoryArgument) return true;
				return false;
			}
			else if (victoryCondition == CombatManager.SPECIFIC_TARGET_DEFEATED)
			{
				if (victoryArgument == undefined || !(victoryArgument is Creature)) throw new Error("Unique target for victory declared as a win condition, with no target defined.");
				if (victoryArgument.isDefeated()) return true;
				return false;
			}
			
			return false;
		}
		
		private function playerLossCondition():Boolean
		{
			if (lossCondition == CombatManager.ENTIRE_PARTY_DEFEATED)
			{
				for (var i:int = 0; i < _friendlies.length; i++)
				{
					if (!_friendlies[i].isDefeated()) return false;
				}
				return true;
			}
			else if (lossCondition == CombatManager.SURVIVE_WAVES)
			{
				if (isNaN(lossArgument) || lossArgument <= 0) throw new Error("Wave limit declared as a loss condition, with no target defined.");
				if (_roundCounter >= lossArgument) return true;
				return false;
			}
			else if (lossCondition == CombatManager.SPECIFIC_TARGET_DEFEATED)
			{
				if (lossArgument == null || _friendlies.indexOf(lossArgument) == -1) throw new Error("Unique target for loss as a win condition, with no target defined.");
				if (lossArgument.isDefeated()) return true;
				return false;
			}
			
			return false;
		}
		
		public function enemiesAlive():int
		{
			var num:int = 0;
			for (var i:int = 0; i < _hostiles.length; i++)
			{
				if (!_hostiles[i].isDefeated()) num++;
			}
			return num;
		}
		
		public function hasEnemyOfClass(classT:Class):Boolean
		{
			for (var i:int = 0; i < _hostiles.length; i++)
			{
				if (_hostiles[i] is classT) return true;
			}
			return false;
		}
		
		public function isFleeDisabled():Boolean
		{
			for (var i:int = 0; i < _friendlies.length; i++)
			{
				var t:Creature = _friendlies[i] as Creature;
				if (t.hasStatusEffect("Flee Disabled")) return true;
			}
			
			for (i = 0; i < _hostiles.length; i++)
			{
				t = _hostiles[i] as Creature;
				if (t.hasStatusEffect("Flee Disabled")) return true;
			}
			
			return false;
		}
		
		private function postCombatReturnToMenu():void
		{
			userInterface().mainButtonsReset();
			userInterface().hideNPCStats();
			userInterface().leftBarDefaults();
			kGAMECLASS.mainGameMenu();
		}
		
		public function getCombatPrizes():void
		{
			// Abandon ship for Celise!
			if (_hostiles.length == 1 && _hostiles[0] is Celise)
			{
				return;
			}
			
			var loot:Array = [];
			var sumXP:int = 0;
			var sumCredits:int = 0;
			
			var enemyNames:Object = { };
			var numDistinct:int = 0;
			
			// Grab all the details from the collective hostiles
			for (var i:int = 0; i < _hostiles.length; i++)
			{
				var t:Creature = _hostiles[i];
				sumXP += t.XP();
				sumCredits += t.credits;
				
				for (var ii:int = 0; ii < t.inventory.length; ii++)
				{
					var tt:ItemSlotClass = t.inventory[ii];
					
					if (tt.quantity > 0)
					{
						loot.push(tt.makeCopy());
					}
				}
				
				if (enemyNames[t.short] == undefined)
				{
					enemyNames[t.short] = 1;
					numDistinct++;
				}
				else
				{
					enemyNames[t.short]++;
				}
			}
			
			pc.credits += sumCredits;
			
			// Add up XP, but don't permit the players current XP to overcap
			if (sumXP + pc.XP() > pc.XPMax())
			{
				sumXP = pc.XPMax() - pc.XP();
			}
			
			pc.XP(sumXP);
			
			// Emit some shit to state what the player got/did
			
			var numOutput:int = 0;
			
			output("You defeated ");
			for (var key:String in enemyNames)
			{
				// This needs reworking to handle the/a/etc pulled from the creatures base data in the correct instances.
				if (enemyNames[key] > 1) output(String(enemyNames[key]) + "x " + plural(key));
				else output(key);
				
				if (numDistinct > 1) output(", ");
				if (numOutput > 1 && numDistinct == 1) output("and ");
				numDistinct--;
				numOutput++;
			}
			output("!");
			
			if (sumXP > 0) output(" " + sumXP + " XP gained!");
			else
			{
				output("\n<b>Maximum XP attained! You need to level up to continue to progress.</b>");
				if(pc.level == 1) output("\n<b>Find a bed to sleep on in order to level up (like on your ship).</b>");
			}
	
			//Monies!
			if (sumCredits > 0) 
			{
				output("\n");
				if(CombatManager.multipleEnemies()) output("They had ");
				else output(_hostiles[0].mfn("He","She", "It") + " had ");
				output(String(sumCredits) + " credit");
				if(sumCredits > 1) output("s");
				output(" loaded on " + (CombatManager.multipleEnemies() ? "anonymous credit chits" : "an anonymous credit chit") + " that you appropriate.");
			}
			
			clearMenu();
	
			if (loot.length > 0)
			{
				output("\n");
				kGAMECLASS.itemScreen = postCombatReturnToMenu;
				kGAMECLASS.lootScreen = postCombatReturnToMenu;
				kGAMECLASS.useItemFunction = postCombatReturnToMenu;
				kGAMECLASS.itemCollect(loot);
			}
			else
			{
				addButton(0, "Next", postCombatReturnToMenu);
			}
		}
	}
}
