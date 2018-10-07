package classes.GameData 
{
	import classes.Characters.PlayerCharacter;
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.DamageResult;
	import classes.Items.Accessories.SiegwulfeItem; 
	import classes.Items.Accessories.BimboleumDefenseSystem;
	import classes.Items.Accessories.SalamanderDefenseSystem;
	import classes.Items.Accessories.KordiiakLeash;
	import classes.Items.Accessories.ShoulderGrunchLeash;
	import classes.Items.Accessories.GrunchLeash;
	import classes.Items.Apparel.Harness;
	import classes.Items.Armor.GooArmor;
	import classes.Items.Transformatives.ThiccNShake;
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
	import classes.Engine.Combat.applyTeaseDamage;
	import classes.StringUtil;
	import classes.Items.Miscellaneous.*;
	import classes.Engine.Utility.num2Text;
	import flash.utils.getQualifiedClassName;
	import flash.utils.getDefinitionByName;
	import classes.Util.InCollection;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.UIComponents.UIStyleSettings;
	
	public class GroundCombatContainer extends CombatContainer 
	{		
		override public function displayFightLocation():void
		{
			var r:String = (roomString != null ? "FIGHT:\n" + roomString : kGAMECLASS.userInterface.roomText);
			var p:String = (planetString != null ? planetString : kGAMECLASS.userInterface.planetText);
			var s:String = (systemString != null ? systemString : kGAMECLASS.userInterface.systemText);
			
			kGAMECLASS.setLocation(r, p, s); // This should only override whats set, ie if planet is null it
			// should inherit the currently set planet
		}
		
		public static const NO_GROUP:String = "no_group";
		public static const FRIENDLY_GROUP:String = "friendly_group";
		public static const HOSTILE_GROUP:String = "hostile_group";
		
		public function displayBusts(group:String = NO_GROUP):void
		{
			
			// Speical handle for ZILPACK- use ZIL, ZIL
			// ^ PRAETORIAN => PRAETORIAN x3
			// ^ TAIVRADANE => TAIVRA, DANE
			
			var overrides:Array = ["ZILPACK", "PRAETORIAN", "TAIVRADANE", "TAMTURRETS"];
			var bustIdx:String = (_hostiles[0] as Creature).bustDisplay;
			
			if (InCollection(bustIdx, overrides))
			{
				switch (bustIdx)
				{
					case "ZILPACK": kGAMECLASS.showBust("ZIL", "ZIL"); break;
					//case "RASKVEL_GANG": kGAMECLASS.showBust("RASKVEL_MALE", "RASKVEL_MALE", "RASKVEL_MALE"); break;
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
			if (pc.hasStatusEffect("leithanUnloading"))
			{
				var f:ForgeHound = _hostiles[0];
				if(!f.hasStatusEffect("Overheated"))
				{
					clearMenu();
					if(pc.inPowerArmor()) addButton(0,"Hold Ground",kGAMECLASS.holdGroundBois,undefined,"Hold Ground","Stand and fire!");
					else addDisabledButton(0,"Hold Ground","Hold Ground","That’s suicide!");
					addButton(1,"Sprint!",kGAMECLASS.sprintToSafetyBois,undefined,"Sprint!","Run for it!");
					return true;
				}
			}
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
					output("\n\nThe poor thing doesn’t seem to realize that you’re missing the requisite parts.");
					addDisabledButton(1, "Quickie");
					return true;
				}
			}
			
			if (pc.hasStatusEffect("Trigger Game Over"))
			{
				clearMenu();
				kGAMECLASS.badEnd("GAME OVER.");
				return true;
			}
			
			if (hasEnemyOfClass(Ehstraffe))
			{
				var ehs:Ehstraffe = getEnemyOfClass(Ehstraffe);
				ehs.fazianAppeal();
			}
			
			if (hasCombatEffect("Lust Spores Output"))
			{
				removeCombatEffect("Lust Spores Output");
			}
			
			if (hasCombatEffect("Lust Spores Used"))
			{
				removeCombatEffect("Lust Spores Used");
			}
			
			if (hasEnemyOfClass(CommanderHenderson))
			{
				var h:CommanderHenderson = _hostiles[0];
				if (h.hasStatusEffect("Parasite Cure") && h.statusEffectv1("Parasite Cure") == 4)
				{
					h.setStatusValue("Parasite Cure", 1, 5);
					h.triggerAlarm(true);
				}
				
				if (h.hasStatusEffect("Free Chief"))
				{
					if (h.statusEffectv1("Free Chief") == 0)
					{
						h.setStatusValue("Free Chief", 1, 1);
					}
					else if (h.statusEffectv1("Free Chief") == 1)
					{
						h.actuallyFreeChief();
					}
				}
			}
			//Shield pop here:
			//v1 or 1 means queued, v2 means procced already this combat.
			if(pc.statusEffectv1("Def Proc") == 1)
			{
				var shieldTarget:Creature = _hostiles[0];
				//Default damage:
				var damage:TypeCollection = new TypeCollection( { kinetic: Math.round(pc.shieldsMax() * 0.6) });
				if(pc.accessory is SalamanderDefenseSystem)
				{
					output("\n\n<b>Your self-defense system releases a wave of extreme heat as your shields buckle!</b>");
					damage = new TypeCollection( { burning: Math.round(pc.shieldsMax() * 0.7) });
				}
				else if(pc.accessory is BimboleumDefenseSystem)
				{
					output("\n\n<b>Your self-defense system releases a wave of concentrated, psychic slut-energy as your shields buckle!</b>");
					damage = new TypeCollection( { psionic: Math.round(pc.shieldsMax() * 0.5) });
				}
				if(_hostiles.length == 1) applyDamage(damage, pc, shieldTarget);
				else
				{
					for(var i:int = 0; i < _hostiles.length; i++)
					{
						shieldTarget = _hostiles[i];
						if(!shieldTarget.isDefeated())
						{
							output("\n" + StringUtil.capitalize(shieldTarget.getCombatName(), false) + " " + (!shieldTarget.isPlural ? "is" : "are") + " hit!");
							applyDamage(damage, pc, shieldTarget);
						}
					}
				}
				pc.addStatusValue("Def Proc",1,1);
			}
			//Shield regen stuff here!
			if(pc.hasStatusEffect("Shields Damaged")) pc.removeStatusEffect("Shields Damaged");
			else if(pc.hasShields() && pc.hasPerk("Rapid Recharge"))
			{
				pc.shields(pc.bimboIntelligence()/3+3);
			}
			if(!pc.hasShields() || pc.shields() <= 0)
			{
				if(pc.hasCombatDrone(true) && !pc.accessory.hasFlag(GLOBAL.ITEM_FLAG_INTERNAL_POWER) && !pc.hasStatusEffect("Varmint Buddy"))
				{
					output("\n\n<b>Without your shields to sustain it, your drone collapses. It won’t be doing any more damage until you bring your shields back up!</b>");
					pc.createStatusEffect("Drone Disabled",1,0,0,0,false,"Icon_Paralysis","Without shields, your drone cannot attack!",true,0,0xFF0000);
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
			
			if(hasEnemyOfClass(EstalliaTank))
			{
				kGAMECLASS.fedQuestQueenBonusMenu();
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
				addButton(13, "Surrender", kGAMECLASS.queenOfTheDeepSurrenderCombat, undefined, "Surrender", "Maybe you can still make it out of this alive. Throw down your weapons and surrender yourself to the lake monster. Maybe she’ll go easy on you...");
				if (pc.hasStatusEffect("Watered Down")) addButton(12, "Climb", kGAMECLASS.queenOfTheDeepClimb, undefined, "Climb", "If you’re quick and careful, you might be able to evade the monster woman’s deadly claws and legs long enough to climb up on her back. You’ll definitely have an easier time of it up there, though getting there’s going to be risky...");
				return;
			}
			
			if (!pc.hasStatusEffect("Tripped") && (hasEnemyOfClass(Queensguard) || hasEnemyOfClass(Taivra)))
			{
				if (flags["FREED_DANE_FROM_TAIVRA"] == undefined)
				{
					if (pc.statusEffectv1("Cage Distance") != 0) addButton(10, "Cage", function():void {
						kGAMECLASS.setEnemy(_hostiles[0]);
						kGAMECLASS.moveToCage();
						kGAMECLASS.setEnemy(null);
					}
					, undefined, "Cage", "Attempt to move closer to Dane and [rival.name]’s cage.");
					
					else addButton(10, "BreakCage", function():void {
						kGAMECLASS.setEnemy(_hostiles[0]);
						kGAMECLASS.breakOutDane();
						kGAMECLASS.setEnemy(null);
					}, undefined, "Break Cage", "Try and break Dane out - that big, burly ausar might just level the playing field!");
					return;
				}
			}
			
			if (pc.hasStatusEffect("Web") && hasEnemyOfClass(BothriocQuadomme))
			{
				var quadomme:BothriocQuadomme = _hostiles[0];
				addButton(2, "Attack Web", quadomme.attackWeb, pc, "Attack Web", "Try and hack back the bothrioc’s webs so they don’t stick to you.");
			}
			
			if (hasEnemyOfClass(StormguardMale))
			{
				var stormy:StormguardMale = _hostiles[0];
				if(stormy.hasStatusEffect("Flying")) addButton(2,"ShootJetpack",stormy.jetpackShot,pc,"Shoot Jetpack","It’s possible you could shoot his jetpack from here. It’s a small target, he’s weaving around and the conditions are wretched, though...");
			}
			
			if (hasEnemyOfClass(CommanderHenderson))
			{
				var h:CommanderHenderson = _hostiles[0];
				
				if (!h.hasStatusEffect("Free Chief"))
				{
					if (h.hasStatusEffect("Blinded") || h.hasStatusEffect("Stunned") || h.hasStatusEffect("Staggered") || h.hasStatusEffect("Paralyzed"))
					{
						addButton(10, "Free Chief", h.freeChief, undefined, "Free Chief", "Get Chief Neykkar out of there! She might be able to lend a helping hand!");
					}
					else
					{
						addDisabledButton(10, "Free Chief", "Free Chief", "It’s way too dangerous to try this now! You’ve got to do something to buy yourself some time!");
					}
				}
				
				if (kGAMECLASS.pc.hasKeyItem("Parasite Cure"))
				{
					if (!h.hasStatusEffect("Parasite Cure") || h.statusEffectv1("Parasite Cure") < 3)
					{
						addButton(11, "Use Cure", h.attemptCure, undefined, "Use the Cure", "Use the cure you and Doc Vanderbilt made. You’ll have to get to the Fire Suppression system, access its internal supply, and then insert the cure spray. With any luck, that will start spreading the cure, and neutralize the infected.");
					}
				}
				else if (h.statusEffectv1("Parasite Cure") == 3)
				{
					addButton(11, "Fire Alarm", h.triggerAlarm, false, "Trigger Fire Alarm", "Hit the alarm to release the cure!");
				}
			}
			
			if (hasEnemyOfClass(Estallia))
			{
				var e:Estallia = _hostiles[0];
				
				if(!e.hasStatusEffect("Tranq'd") && pc.hasKeyItem("Myr Heavy Tranquilizer Dart")) addButton(10, "UseTranq", e.attemptTranq, undefined, "Use Tranquilizer", "See if the tranquilizer Lieve gave you will have any effect on the War Queen.");
			}
		}
		
		/**
		 * Place code in this function for any status effect that impacts the creature
		 * it is on outside of its mere presence (ie DoT ticks, stat changes etc)
		 * @param	target
		 */
		private function updateStatusEffectsFor(target:Creature):void
		{
			//SyriQuest bots don't need to be alive to be awesome
			if (target is AkkadiSecurityRobots)
			{
				(target as AkkadiSecurityRobots).botHeal();
			}
			
			if (target.isDefeated()) return;
			
			var ew:StorageClass = target.getStatusEffect("Empowering Word");
			if (ew != null)
			{
				ew.value1--;
				if (ew.value1 < 0)
				{
					// Only do output if not stunned and v3 is not 1
					// v3 stops multiple outputs from happening on different creatures in the same round but still allows the effect to be removed
					if (!target.hasStatusEffect("Stunned") && ew.value3 != 1)
					{
						var numMales:int = 0;
						for (var i:int = 0; i < _hostiles.length; i++)
						{
							var tC:Creature = _hostiles[i] as Creature;
							if (tC is MilodanMaleGroup && !tC.isDefeated())
							{
								numMales++;
								var ewT:StorageClass = tC.getStatusEffect("Empowering Word");
								if (ewT != null) ewT.value3 = 1;
							}
						}
						
						output("\n\n<b>The male" + (numMales == 1 ? " shakes his head" : "s shake their heads") + " as if coming out of a daze, blinking and looking around. The glow’s gone now, thank goodness.</b>");
					}
					
					target.removeStatusByRef(ew);
				}
			}
			
			
			var le:StorageClass = target.getStatusEffect("Leech Empowerment");
			
			if (le != null)
			{
				le.value1--;
				if (le.value1 < 0)
				{
					target.removeStatusByRef(le);
				}
			}
			
			var pl:StorageClass = target.getStatusEffect("Psychic Leech");
			
			if (pl != null)
			{
				pl.value1--;
				if (pl.value1 < 0)
				{
					output("\n\nYou feel a surge of regained strength -- <b>the witch’s leeching power has worn off!</b>");
					
					target.removeStatusByRef(pl);
				}
			}
			
			if (target.hasStatusEffect("Pushed"))
			{
				target.setStatusValue("Pushed", 2, 0);
				if (target.statusEffectv1("Pushed") > 0)
				{
					target.addStatusValue("Pushed", 1, -1);
				}
			}
			if (target.hasStatusEffect("Shields Up") && !(target is PlayerCharacter))
			{
				target.addStatusValue("Shields Up",1,-1);
				if(target.statusEffectv1("Shields Up") > 0) output("\n\n<b>He’s still covering himself with his shield.</b>");
				else
				{
					target.removeStatusEffect("Shields Up");
					output("\n\n<b>With a tired huff, the male zil’s allows his guard to sink back down.</b>");
					target.shield.shields -= 40;
					target.shields(-40);
				}
			}
			if (target.hasPerk("Shield Regen") && target.hasShields() && target.shields() <= 0 && target.shieldsMax() > 0 && !target.hasStatusEffect("Used Shield Regen"))
			{
				if (target is PlayerCharacter)
				{
					output("\n\n<b>Your shields power back up at one quarter power. Now’s your chance to turn this around!</b>");
				}
				else
				{
					output("\n\n<b>" + StringUtil.capitalize(possessive(target.getCombatName()), false) + " shield powers back up at one quarter power!</b>");
				}
				target.shields(Math.round(target.shieldsMax()/4));
				target.createStatusEffect("Used Shield Regen",0,0,0,0,true,"","",true,0);
			}

			if (target.hasStatusEffect("Riposting")) target.removeStatusEffect("Riposting");
			if (target.hasStatusEffect("Bloodthirsted")) target.removeStatusEffect("Bloodthirsted");
	
			if (target.hasPerk("Juggernaut"))
			{
				if (target.hasStatusEffect("Staggered") && rand(4) == 0)
				{
					if (target is PlayerCharacter) output("\n\n<b>You shake off the stagger! You’re unstoppable!</b>");
					else output("\n\n<b>" + StringUtil.capitalize(target.getCombatName(), false) + " shakes off the stagger!</b>");
					target.removeStatusEffect("Staggered");
				}
				if (target.hasStatusEffect("Stunned") && rand(4) == 0)
				{
					if (target is PlayerCharacter) output("\n\n<b>You shake off the stun! You’re unstoppable!</b>");
					else output("\n\n<b>" + StringUtil.capitalize(target.getCombatName(), false) + " shakes off the stun!</b>");
					target.removeStatusEffect("Stunned");
				}
				if (target.hasStatusEffect("Paralyzed") && rand(4) == 0)
				{
					if (target is PlayerCharacter) output("\n\n<b>You shake off the paralysis! You’re unstoppable!</b>");
					else output("\n\n<b>" + StringUtil.capitalize(target.getCombatName(), false) + " shakes off the paralysis!</b>");
					target.removeStatusEffect("Paralyzed");
				}
			}
			
			if (target.hasStatusEffect("Deep Freeze"))
			{
				target.addStatusValue("Deep Freeze", 1, -1);
				if (target.hasStatusEffect("Burning")) target.addStatusValue("Deep Freeze", 1, -1);
				if (target.hasStatusEffect("Burn")) target.addStatusValue("Deep Freeze", 1, -1);
				if (target.statusEffectv1("Deep Freeze") <= 0)
				{
					if (target is PlayerCharacter) output("\n\n<b>After the frost melts away, you shake from the deep freeze and ready yourself for action!</b>");
					else output("\n\n<b>After the frost melts away, " + target.getCombatName() + " shake" + (!target.isPlural ? "s" : "") + " from the deep freeze and " + (!target.isPlural ? "is" : "are") + " ready for action!</b>");
					target.removeStatusEffect("Deep Freeze");
				}
				else
				{
					if (target is PlayerCharacter) output("\n\n<b>You slowly defrost, but your body is still in a deep freeze...</b>");
					else output("\n\n<b>" + StringUtil.capitalize(target.getCombatName()) + " slowly defrost" + (!target.isPlural ? "s" : "") + ", but " + target.getCombatPronoun("pa") + " body is still in a deep freeze...</b>");
				}
			}
			
			if (target.hasStatusEffect("Burning"))
			{
				target.addStatusValue("Burning", 1, -1);
				if (!target.willTakeBurnDamage(target.statusEffectv2("Burning"))) target.addStatusValue("Burning", 1, -1);
				//Remove status!
				if (target.statusEffectv1("Burning") <= 0)
				{
					target.removeStatusEffect("Burning");
					if (target is PlayerCharacter) output("\n\n<b>At last you manage to stifle the life out of the fire on your " + (target.hasArmor() ? target.armor.longName : "body") + ". The smell of pork hangs in your nose. You try not to think about it.</b>");
					else output("\n\n<b>" + StringUtil.capitalize(target.getCombatName(), false) + " manages to stifle the life out of the flames on " + target.getCombatPronoun("hisher") + " " + (target.hasArmor() ? target.armor.longName : "body") + "!</b>");
				}
				//Keep status!
				else
				{
					if (target is PlayerCharacter) output("\n\n<b>You desperately slap at your body, trying to extinguish the flames that have taken to your " + (target.hasArmor() ? target.armor.longName : "person") + " but it stubbornly clings to you, blackening and bubbling everything it touches. It burns!</b>");
					else output("\n\n<b>" + StringUtil.capitalize(target.getCombatName()) + " desperately slaps at " + target.getCombatPronoun("hisher") + " body, trying to extinguish the flames licking at " + target.getCombatPronoun("hisher") + " " + (target.hasArmor() ? target.armor.longName : "person") + " but to no avail!</b>");
					applyDamage(new TypeCollection( { burning: target.statusEffectv2("Burning") } ), null, target);
				}
			}
			
			if(target.hasStatusEffect("Burn"))
			{
				var burnValue:Number = 3 + rand(4);
				target.addStatusValue("Burn", 1, -1);
				if (!target.willTakeBurnDamage(burnValue)) target.addStatusValue("Burn", 1, -1);
				
				if (target is PlayerCharacter)
				{
					output("\n\n<b>The flames slowly lick at you, " + (target.statusEffectv1("Burn") > 0 ? "resisting any attempt to put them out" : "refusing to go out until they’ve done their foul work") + ".</b>");
				}
				else
				{
					output("\n\n<b>Flames slowly lick at " + target.getCombatName() + ", " + (target.statusEffectv1("Burn") > 0 ? "resisting any attempt to put them out" : "refusing to go out until they’ve done their foul work") + ".</b>");
				}
				
				if (target.statusEffectv1("Burn") <= 0)
				{
					target.removeStatusEffect("Burn");
				}
				
				applyDamage(new TypeCollection( { burning: burnValue } ), null, target);
			}
			
			//Does v1 lust damage every turn. V2 is turn counter (negative = infinite)!
			if (target.hasStatusEffect("Aphro"))
			{
				target.addStatusValue("Aphro", 2, -1);
				if (target.statusEffectv2("Aphro") <= 0)
				{
					if (target is PlayerCharacter) output("\n\n<b>The aphrodisiac in your bloodstream has faded!</b>");
					else output("\n\n<b>The aphrodisiac in " + possessive(target.getCombatName()) + " bloodstream has faded!</b>");
					target.removeStatusEffect("Aphro");
				}
				else
				{
					if (target is PlayerCharacter) output("\n\n<b>The aphrodisiac in your bloodstream continues to excite your body!</b>");
					else output("\n\n<b>The aphrodisiac in " + possessive(target.getCombatName()) + " bloodstream continues to excite " + target.getCombatPronoun("himher") + "!</b>");
					applyDamage(new TypeCollection( { drug: target.statusEffectv1("Aphro") } ), null, target);
				}
			}
			//"Toxic Trickery"
			if (target.hasStatusEffect("Toxic Trickery"))
			{
				target.addStatusValue("Toxic Trickery",1,-1);
				//Status time out!
				if(target.statusEffectv1("Toxic Trickery") <= 0)
				{
					output("\n\n<b>The leaden feeling in your arms finally subsides. Looks like the poison’s run its course...</b>");
					target.physiqueMod += 4;
					target.aimMod += 4;
					target.removeStatusEffect("Toxic Trickery");
				}
				//Effect gooo!
				else
				{
					output("\n\n<b>You’re still feeling warm and lethargic from her poison...</b>");
					applyDamage(new TypeCollection( { drug: 2+rand(3) } ), null, target);
				}
			}
			//"Gravitational Anomaly" reduces kinetic damage!
			if(target.hasStatusEffect("Gravitational Anomaly"))
			{
				target.addStatusValue("Gravitational Anomaly",1,-1);
				if(target.statusEffectv1("Gravitational Anomaly") <= 0)
				{
					output("\n\n<b>The gravitational field fades.</b>");
					target.removeStatusEffect("Gravitational Anomaly");
				}
			}
	
			// player takes 4-9 lust damage every turn, per stack of “Vibe” DoT
			if (target.hasStatusEffect("Vibed"))
			{
				output("\n\n<b>The bio-magnetic vibes keep buzzing away! Their stimulation starts getting to you, and before long, you’re panting and having difficulty keeping your balance.</b>");
				var amount:Number = 0;
				//Add damage per stack.
				for(var xx:int = 0; xx < target.statusEffectv1("Vibed"); xx++)
				{
					amount += 4 + rand(6);
				}
				applyDamage(new TypeCollection( { tease: amount } ), target, target);
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
					else output("\n\n<b>The cloud of aphrodisiac continues to linger around " + target.getCombatName() + "!</b>");
					applyDamage(new TypeCollection( { drug: target.statusEffectv1("Aphro Gas") } ), target, target);
				}
			}
			
			if (target.HP()/target.HPMax() < 0.5 && target.hasPerk("Survival Instincts") && !target.hasStatusEffect("Survivaled"))
			{
				output("\n\n<b>Your survival instincts kick in! Now would be a good time to run!</b>");
				//Stun, Stagger, or Knockdown
				if(target.hasStatusEffect("Stun") || target.hasStatusEffect("Stunned"))
				{
					output("\nYou are no longer stunned!");
					target.removeStatusEffect("Stun");
					target.removeStatusEffect("Stunned");
				}
				if(target.hasStatusEffect("Staggered"))
				{
					output("\nYou are no longer staggered!");
					target.removeStatusEffect("Staggered");
				}
				if(target.hasStatusEffect("Tripped"))
				{
					output("\nYou are no longer tripped!");
					target.removeStatusEffect("Tripped");
				}
				target.createStatusEffect("Survivaled",0,0,0,0,true,"","",true);
			}

			if (target.hasStatusEffect("Evasion Boost"))
			{
				if (target.getStatusMinutes("Evasion Boost") > 0) 
				{
					if(target is RKLah) output("\n\n<b>The ausar continues to jitter and start forwards and backwards unexpectedly. It’s a nightmare drawing a bead on him.</b>");
					else if(target is Teyaal) output("\n\nThe gryvain is still fluttering about on her wings and hard to hit.");
					else if(target is PlayerCharacter) output("\n\n<b>Your evasion is still enhanced!</b>");
					else output("\n\n<b>" + StringUtil.capitalize(possessive(target.getCombatName()), false) + " evasion is still enhanced!</b>");
					target.addStatusMinutes("Evasion Boost",-1);
				}
				else 
				{
					if(target is RKLah) output("\n\n<b>The ausar finally starts moving with something approaching normalcy, his burst of nervous energy exhausted.</b>");
					else if(target is Teyaal) output("\n\nTeyaal lands on the balls of her feet, momentarily supporting herself with her tail and wings as well - she looks like a feral dragon for that brief second until she regains her proper footing.");
					else if (target.isPlural) output("\n\n<b>" + StringUtil.capitalize(target.getCombatName(), false) + " no longer have boosted evasion!</b>");
					else if(target is PlayerCharacter) output("\n\n<b>Your limbs feel heavier, slower than they were a moment ago. Your boosted evasion has worn off!</b>");
					else output("\n\n<b>" + StringUtil.capitalize(possessive(target.getCombatName()), false) + " enhanced evasion fades!</b>");
					target.removeStatusEffect("Evasion Boost");
				}
			}
			if (target.hasStatusEffect("Poison"))
			{
				if (target is PlayerCharacter) output("\n\n<b>The poison continues to exhaust you" + (target.statusEffectv2("Poison") >= 1 ? ". You’re ready for this fight to be over!" : ", though you feel a bit better after. It must be <i>wearing off</i>.") + "</b>");
				else output("\n\n<b>" + StringUtil.capitalize(possessive(target.getCombatName()), false) + " movements become more sluggish" + (target.statusEffectv2("Poison") ? "; poison flows through " + target.getCombatPronoun("hisher") + " wounds, weakening them further." : ", though the poison is fading, its damage done.") + "</b>");
				if (target.statusEffectv2("Poison") >= 1)
				{
					target.addStatusValue("Poison", 2, -1);
				}
				else
				{
					target.removeStatusEffect("Poison");
				}
				applyDamage(damageRand(new TypeCollection( { poison: target.statusEffectv1("Poison") * target.statusEffectv3("Poison") } ), 15), null, target);
				target.energy(-5);
			}
			if (target.hasStatusEffect("Bleeding"))
			{
				if (target is PlayerCharacter) output("\n\n<b>Your wounds continue to take their toll on your body; " + (target.statusEffectv2("Bleeding") >= 1 ? "your microsugeons working overtime to stem the ongoing damage" : "your microsurgeons have triaged the worst of it, but you’ll need proper rest to heal") + ".</b>");
				else output("\n\n<b>" + StringUtil.capitalize(possessive(target.getCombatName()), false) + " wounds continue to take a toll on " + target.getCombatPronoun("hisher") + " body; " + (target.statusEffectv2("Bleeding") ? "blood liberally flows from " + target.getCombatPronoun("hisher") + " wounds as " + target.getCombatPronoun("himher") + " frantically attempt to stem the bleeding." : "the bleeding has finally stopped, but it’d take anybody some rest to properly recover from those kinds of wounds!") + "</b>");
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
					if (target is PlayerCharacter) output("\n\n<b>You’re still reeling from the force of the blows to which you’ve been subjected.</b>");
					else output("\n\n<b>" + StringUtil.capitalize(target.getCombatName(), false) + " is still reeling from the force of the blows to which " + (!target.isPlural ? (target.getCombatPronoun("heshe") + "’s") : "they’ve") + " been subjected!</b>");
				}
				else
				{
					target.removeStatusEffect("Staggered");
					if (target is PlayerCharacter)
					{
						output("\n\n<b>You finally shake away the stars from your vision");
						if(target.hasFlightEffects()) output(" and reorient yourself in the air");
						else output(", your [pc.feet] firmly planted on the floor once again");
						output(".</b>");
					}
					else
					{
						output("\n\n<b>" + StringUtil.capitalize(target.getCombatName(), false) + " finally shake" + (!target.isPlural ? "s" : "") + " away the cobwebs");
						if(target.hasFlightEffects()) output(" and return" + (!target.isPlural ? "s" : "") + " to the air");
						else output(", " + target.getCombatPronoun("hisher") + " " + target.feet() + " planted firmly on the floor once again");
						output(".</b>");
					}
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
						CombatAttacks.applyBlind(target, 2);
					}
				}
			}
			
			if (target.hasStatusEffect("Tripped"))
			{
				if(target.hasPerk("Leap Up"))
				{
					if (target is PlayerCharacter) output("\n\n<b>You roll up onto your [pc.feet] immediately thanks to your quick reflexes.</b>");
					else output("\n\n<b>" + StringUtil.capitalize(target.getCombatName(), false) + " jumps back onto " + target.getCombatPronoun("hisher") + " " + target.feet() + " almost immediately!</b>");
					target.removeStatusEffect("Tripped");
				}
			}
	
			if (target.hasStatusEffect("Blinded"))
			{
				target.addStatusValue("Blinded",1,-1);
				if (target.statusEffectv1("Blinded") <= 0) 
				{
					target.removeStatusEffect("Blinded");
					if (target is PlayerCharacter)
					{
						if (CombatManager.hasEnemyOfClass(DrCalnor)) output("\n\nYou finally blink out the rest of the stars swimming in your vision, regaining your sight!");
						else output("\n\n<b>You can see again!</b>");
					}
					else if (target.isPlural) output("\n\n<b>" + StringUtil.capitalize(target.getCombatName(), false) + " are no longer blinded!</b>");
					else output("\n\n<b>" + StringUtil.capitalize(target.getCombatName(), false) + " is no longer blind!</b>");
				}
				else if (target.hasPerk("Sharp Eyes") && target.statusEffectv1("Blinded") <= 1) 
				{
					target.removeStatusEffect("Blinded");
					if (target is PlayerCharacter) output("\n\n<b>You can see again!</b>");
					else if (target.isPlural) output("\n\n<b>" + StringUtil.capitalize(target.getCombatName(), false) + " are no longer blinded!</b>");
					else output("\n\n<b>" + StringUtil.capitalize(target.getCombatName(), false) + " is no longer blind!</b>");
				}
				else
				{
					if (target is PlayerCharacter) output("\n\n<b>You are blind!</b>");
					else if (target.isPlural) output("\n\n<b>" + StringUtil.capitalize(target.getCombatName(), false) + " are blind.</b>");
					else output("\n\n<b>" + StringUtil.capitalize(target.getCombatName(), false) + " is blind.</b>");
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
					else output("\n\n<b>" + StringUtil.capitalize(target.getCombatName(), false) + " looks a little more confident in " + target.getCombatPronoun("hisher") + " aim!</b>");
				}
			}
	
			if (target.hasStatusEffect("Paralyzed")) 
			{
				target.addStatusValue("Paralyzed",1,-1);
				if (target.statusEffectv1("Paralyzed") <= 0) 
				{
					target.removeStatusEffect("Paralyzed");
					if (target is PlayerCharacter) output("\n\n<b>The paralytic venom wears off, and you are able to move once more.</b>");
					else output("\n\n<b>The paralysis affecting " + StringUtil.capitalize(target.getCombatName(), false) + " seems to wear off, motion returning to " + target.getCombatPronoun("hisher") + " limbs!</b>");
				}
				else
				{
					if (target is PlayerCharacter) output("\n\n<b>You’re paralyzed and unable to move!</b>");
					else output("\n\n<b>" + StringUtil.capitalize(target.getCombatName(), false) + " is paralyzed and unable to move!</b>");
				}
			}
	
			if(target.hasStatusEffect("Stealth Field Generator"))
			{
				target.addStatusValue("Stealth Field Generator",1,-1);
				if(target.statusEffectv1("Stealth Field Generator") <= 0)
				{
					if (target is PlayerCharacter) output("\n\n<b>Your stealth field generator collapses.</b>");
					else output("\n\n<b>" + StringUtil.capitalize(possessive(target.getCombatName()), false) + " stealth drops abruptly!</b>");
					target.removeStatusEffect("Stealth Field Generator");
				}
				else 
				{
					if (target is PlayerCharacter) output("\n\n<b>You are practically invisible thanks to your stealth field generator.</b>");
					else output("\n\n<b>" + StringUtil.capitalize(target.getCombatName(), false) + " is practically invisible thanks to " + target.getCombatPronoun("hisher") + " stealth field generator.</b>");
				}
			}
	
			if (target.hasStatusEffect("Taking Cover"))
			{
				target.addStatusValue("Taking Cover",1,-1);
				if (target.statusEffectv1("Taking Cover") <= 0)
				{
					target.removeStatusEffect("Taking Cover");
					if (target is PlayerCharacter) output("\n\n<b>You are no longer taking cover!</b>");
					else output("\n\n<b>" + StringUtil.capitalize(target.getCombatName(), false) + " is no longer taking cover!</b>");
				}
				else 
				{
					if (target is PlayerCharacter) output("\n\n<b>Your enemies will have a hard time hitting you behind your cover!</b>");
					else output("\n\n<b>You’ll have a hard time hitting " + target.getCombatName() + " with " + target.getCombatPronoun("himher") + " hiding behind cover!</b>");
				}
			}
	
			if (target.hasStatusEffect("Deflector Regeneration") && target.hasShields())
			{
				target.addStatusValue("Deflector Regeneration",1,-1);
				var temp:Number = target.statusEffectv2("Deflector Regeneration");
				if(temp + target.shields() > target.shieldsMax()) temp = target.shieldsMax() - target.shields();
				if(temp > 0) 
				{
					if (target is PlayerCharacter) output("\n\n<b>You recover " + temp + " points of shielding.</b>");
					else output("\n\n<b>" + StringUtil.capitalize(possessive(target.getCombatName()), false) + " recovers " + temp + " points of shielding!</b>");
					target.shields(temp);
				}
				target.energy(10);
				if(target.statusEffectv1("Deflector Regeneration") <= 0)
				{
					if (target is PlayerCharacter) output("\n\n<b>Your shields are no longer regenerating!</b>");
					else output("\n\n<b>" + StringUtil.capitalize(possessive(target.getCombatName()), false) + " shields are no longer regenerating!</b>");
					target.removeStatusEffect("Deflector Regeneration");
				}
			}
	
			if (target.statusEffectv1("Used Smuggled Stimulant") > 0)
			{
				target.addStatusValue("Used Smuggled Stimulant",1,-1);
				target.energy(25);
				if (target is PlayerCharacter) output("\n\n<b>A rush of energy fills you as the smuggled stimulant affects you.</b>");
				else output("\n\n<b>" + StringUtil.capitalize(target.getCombatName(), false) + " is filled with a sudden rush of energy!</b>");
			}
	
			if (target.hasStatusEffect("Porno Hacked Drone") && target.hasCombatDrone(true))
			{
				if(target.shields() > 0 || pc.accessory.hasFlag(GLOBAL.ITEM_FLAG_INTERNAL_POWER))
				{
					target.addStatusValue("Porno Hacked Drone",1,-1);
					if(target.statusEffectv1("Porno Hacked Drone") <= 0)
					{
						if (target is PlayerCharacter) output("\n\n<b>With a grinding click the porn beaming out of your drone snuffs out, finally getting the better of the hacking routine, and returns to your side.</b>");
						else output("\n\n<b>" + StringUtil.capitalize(possessive(target.getCombatName()), false) + " drone whirrs slightly, the porn beaming from it snuffing out in short order. Having finally managed to expel the rogue instructions hacked into the thing, it returns to its owner’s side.</b>");
						target.removeStatusEffect("Porno Hacked Drone");
					}
					else
					{
						//Combat blurb:
						if (target is PlayerCharacter) output("\n\n<b>Your hacked drone continues to fly into your line of sight and near your ear no matter how many times you slap it away, inundating your senses with garish, shifting and teasing smut.</b>");
						else output("\n\n<b>" + StringUtil.capitalize(possessive(target.getCombatName()), false) + " hacked drone continues to fly around " + target.getCombatPronoun("himher") + ", projecting a series of ever lewder smutty visuals directly at " + target.getCombatPronoun("himher") + "!</b>");
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
						output("\n\n<b>The parasite’s venom is coursing through your veins. Your sexual desire is rising at an alarming rate.</b>");
					}
				}
				else
				{
					kGAMECLASS.cloudDebuffHandler(target);
				}
			}
			
			if (target.hasStatusEffect("Disarmed") && (!(target is PlayerCharacter) || flags["CHECKED_GEAR_AT_OGGY"] == undefined))
			{
				target.addStatusValue("Disarmed",1,-1);
				if(target.statusEffectv1("Disarmed") <= 0)
				{
					target.removeStatusEffect("Disarmed");
					if (target is PlayerCharacter) output("\n\n<b>You are no longer disarmed!</b>");
					else if (target.isPlural) output("\n\n<b>" + StringUtil.capitalize(target.getCombatName(), false) + " are no longer disarmed!</b>");
					else output("\n\n<b>" + StringUtil.capitalize(target.getCombatName(), false) + " is no longer disarmed!</b>\n");
				}
				else 
				{
					if (target is PlayerCharacter) output("\n\n<b>You are disarmed and cannot use weapon based attacks.</b>");
					else if (target.isPlural) output("\n\n<b>" + StringUtil.capitalize(target.getCombatName(), false) + " are disarmed.</b>");
					else output("\n\n<b>" + StringUtil.capitalize(target.getCombatName(), false) + " is disarmed.</b>");
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
							else if(target.accessory is KordiiakLeash) output("\n\n<b>A deep roar alerts you that your kor’diiak has recovered. It lumbers up onto its legs, growling.</b>");
							else if(target.accessory is ShoulderGrunchLeash) output("\n\n<b>Quiet chitters alert you that your grunch has recovered.</b>");
							else output("\n\n<b>There’s a familiar and welcome sound of whirring servos above you. Your righted drone moves back down to your side to aid you.</b>");
						}
						else output("\n\n<b>A telling hum returns to the battlefield. " + StringUtil.capitalize(possessive(target.getCombatName()), false) + " combat drone returns to the fold!</b>");
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
					if (target is PlayerCharacter) output("\n\n<b>Your equipments connection to Anno’s wanes as combat draws on, your improved accuracy diminishing.</b>");
					else output("\n\n<b>" + StringUtil.capitalize(possessive(target.getCombatName()), false) + " equipment interlink wanes, the extra assistance diminishing!</b>");
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
			
			if (target.hasStatusEffect("Resolve"))
			{
				target.addStatusValue("Resolve",1,-1);
				if (target.statusEffectv1("Resolve") <= 0)
				{
					target.removeStatusEffect("Resolve");
					output("\n\n<b>" + StringUtil.capitalize(target.getCombatName(), false) + " is no longer resolved!</b>");
					target.baseHPResistances.tease.resistanceValue -= 100;
					target.baseHPResistances.drug.resistanceValue -= 50;
					target.baseHPResistances.pheromone.resistanceValue -= 50;
				}
				else
				{
					output("\n\n<b>" + StringUtil.capitalize(target.getCombatName(), false) + " has a resolved, steely look in " + target.getCombatPronoun("hisher") + " eyes!</b>");
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
				if (target.hasStatusEffect("Lust Stunned")) output("<b>Your teasing has the poor " + target.mfn("boy", "girl", "thing") + " in a shuddering mess as " + target.getCombatPronoun("heshe") +" tries to regain control of " + target,mfn("his", "her", "its") + " lust addled nerves.</b>\n");
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
				
				output("\n\n[goo.name] dances around, flashing plenty of tits and ass for " + target.getCombatName() + ".");
				if (lFailed || (dResult && (dResult.lustDamage <= 0 || dResult.lustResisted)))
				{
					output(" " + StringUtil.capitalize(target.getCombatPronoun("heshe")) + " looks on, clearly unimpressed.");
				}
				else
				{
					output(" " + StringUtil.capitalize(target.getCombatPronoun("heshe")) + " stares mesmerized at [goo.name]’s dance, flushing with lust.");
				}
				
				if (!lFailed)
				{
					outputDamage(dResult);
				}
			}
			
			if (target.hasStatusEffect("Resin"))
			{
				target.addStatusValue("Resin",1,-1);
				if (target.statusEffectv1("Resin") <= 0) 
				{
					target.removeStatusEffect("Resin");
					if (target is PlayerCharacter) output("\n\nHardened resin snaps and clinks as it drops off of you. Not enough of it remains to act as a shield anymore.");
					else output("\n\n" + StringUtil.capitalize(target.getCombatName(), false) + " no longer " + (target.isPlural ? "have" : "has") + " the protection of the hardened resin.");
					
				}
			}
			if (target.hasStatusEffect("Resin Aroma"))
			{
				var resinFailed:Boolean = false;
				
				if (target.isLustImmune == true) resinFailed = true;
				if (target.hasAirtightSuit()) resinFailed = true;
				if (target.getLustResistances().tease.resistanceValue >= 100.0) resinFailed = true;
				
				if (!resinFailed)
				{
					var resinDamage:TypeCollection = new TypeCollection( { tease: 1 + rand(3) } );
					var resinResult:DamageResult = applyDamage(resinDamage, pc, target, "suppress");
				}
				
				target.addStatusValue("Resin Aroma",1,-1);
				if (target.statusEffectv1("Resin Aroma") <= 0) 
				{
					target.removeStatusEffect("Resin Aroma");
				}
				else
				{
					output("\n\nThe sweet, warm pine smell of your resin is heavy in the air.");
					if(!resinFailed)
					{
						output(" " + ((target is PlayerCharacter) ? "You look" : (StringUtil.capitalize(target.getCombatName(), false) + " look" + (target.isPlural ? "" : "s"))) + " rather flushed, unable to stop eyeing " + ((target is PlayerCharacter) ? "your enemy’s" : "your") + " strong, unshakable body.");
						if(target.lust() > 66) output(" Increasingly, " + target.getCombatPronoun("heshe") + " can’t seem to tear " + target.getCombatPronoun("hisher") + " eyes away from " + ((target is PlayerCharacter) ? "your opponent" : "you") + "...");
						outputDamage(resinResult);
					}
					else
					{
						if(target.hasAirtightSuit())
						{
							if (target is PlayerCharacter) output(" Fortunately, you came prepared with an airtight suit, blocking the lust-inducing aroma.");
							else output(" Unfortunately, your opponent came prepared with an airtight suit, blocking the lust-inducing aroma.");
						}
						else
						{
							if (target is PlayerCharacter) output(" Fortunately, it’s having no effect on you.");
							else output(" Unfortunately, it’s having no effect on your lust-resistant opponent.");
						}
					}
				}
			}
			
			if (target.hasStatusEffect("Pollen Veil"))
			{
				target.addStatusValue("Pollen Veil",1,-1);
				if (target.statusEffectv1("Pollen Veil") <= 0) 
				{
					target.removeStatusEffect("Pollen Veil");
					output("\n\nThe yellow haze has gone from the battlefield. Your pollen has dissipated, and your opponent breathes easily again.");
				}
			}
			if (target.hasStatusEffect("Pollen Lust"))
			{
				var pollenFailed:Boolean = false;
				
				if (target.isLustImmune == true) pollenFailed = true;
				if (target.hasAirtightSuit()) pollenFailed = true;
				if (target.getLustResistances().tease.resistanceValue >= 100.0) pollenFailed = true;
				
				if (!pollenFailed)
				{
					var pollenDamage:TypeCollection = new TypeCollection( { tease: 6 + rand(3) } );
					var pollenResult:DamageResult = applyDamage(pollenDamage, pc, target, "suppress");
				}
				
				target.addStatusValue("Pollen Lust",1,-1);
				if (target.statusEffectv1("Pollen Lust") <= 0) 
				{
					target.removeStatusEffect("Pollen Lust");
				}
				else
				{
					output("\n\nCurrents of bright yellow pollen drift through the air around you.");
					if(!pollenFailed)
					{
						output(" " + ((target is PlayerCharacter) ? "You look" : "Your opponent looks") + " flushed and short of breath.");
						if(target.lust() > 66) output(" Increasingly, " + target.getCombatPronoun("heshe") + " can’t seem to tear " + target.getCombatPronoun("hisher") + " eyes away from " + ((target is PlayerCharacter) ? "your foe" : "you") + "...");
						outputDamage(pollenResult);
					}
					else
					{
						if(target.hasAirtightSuit())
						{
							if (target is PlayerCharacter) output(" Fortunately, you came prepared with an airtight suit, making the attack quite useless!");
							else output(" Unfortunately, your opponent came prepared with an airtight suit, making your attack quite useless!");
						}
						else
						{
							if (target is PlayerCharacter) output(" Fortunately, it’s having no effect on you.");
							else output(" Unfortunately, it’s having no effect on your lust-resistant opponent.");
						}
					}
				}
			}
			
			if (target.hasStatusEffect("Lust Spores"))
			{
				var sporesFailed:Boolean = false;
				var sporesEnded:Boolean = false;
				
				if (target.isLustImmune) sporesFailed = true;
				if (target.hasAirtightSuit()) sporesFailed = true;
				if (target.getLustResistances().drug.resistanceValue >= 100) sporesFailed = true;
				
				if (!sporesFailed)
				{
					var sd:TypeCollection = new TypeCollection( { drug: 3 + rand(3) } );
					var sr:DamageResult = applyDamage(sd, null, target, "suppress");
				}
				
				target.addStatusValue("Lust Spores", 1, -1);
				if (target.statusEffectv1("Lust Spores") <= 0)
				{
					target.removeStatusEffect("Lust Spores");
				}
				
				if (!hasCombatEffect("Lust Spores Output"))
				{
					addCombatEffect(new StorageClass("Lust Spores Output"));
				
					output("\n\nThe hazy cloud of spores continues to swirl around in the air, enveloping every thing and every one in their foul touch.");
					if (!sporesFailed)
					{
						outputDamage(sr);
					}
				}
			}
			
			if (target.hasStatusEffect("Crushing Worms"))
			{
				output("\n\nThe little tentacles keep hammering at " + target.getCombatName() +", smashing their blunt faces and squeezing as hard as they can!");
				applyDamage(damageRand(new TypeCollection( { kinetic: 5 }, DamageFlag.BYPASS_SHIELD), 15), null, target, "minimal");
			}
			
			if (target.hasStatusEffect("Psychic Miasma"))
			{
				
				if (target.willpower() + 10 > rand(100))
				{
					target.removeStatusEffect("Psychic Miasma");
					if (target is PlayerCharacter) output("\n\nYou push aside the effects of the psionic drone.");
					else output("\n\n<b>" + StringUtil.capitalize(target.getCombatName(), false) + " resists the psionic drone.</b>");
					
					target.aimMod += 5
					target.reflexesMod += 5
				}
			}
			
			//Akane/Shukuchi stoofs
			if (target.hasStatusEffect("Fade-cloak"))
			{
				target.addStatusValue("Fade-cloak",1,-1);
				if (target.hasStatusEffect("Fade-cloak struck") || target.statusEffectv1("Fade-cloak") < 0)
				{
					target.removeStatusEffect("Fade-cloak");
					if (target.hasStatusEffect("Fade-cloak struck")) target.removeStatusEffect("Fade-cloak struck");
				}
			}
			if (target.hasStatusEffect("Internal Bleeding")) target.HP(-target.statusEffectv1("Internal Bleeding"));
			if (target.hasStatusEffect("Restricted"))
			{
				if (!target.hasStatusEffect("Grappled")) target.removeStatusEffect("Restricted");
				else
				{
					if (target is PlayerCharacter) output("\n\nThe lashes continue to damage you! ");
					var dam:TypeCollection = new TypeCollection({kinetic: target.statusEffectv1("Restricted"), electric: target.statusEffectv2("Restricted")});
					applyDamage(dam, null, target, "minimal");
				}
			}
			if (target.hasStatusEffect("Petra overcharge"))
			{
				target.addStatusValue("Petra overcharge", 1, -1);
				if (target.statusEffectv1("Petra overcharge") < 0)
				{
					target.baseHPResistances.add(-target.statusEffectv2("Petra overcharge"));
					target.removeStatusEffect("Petra overcharge");
				}
			}
			
			if (target.hasStatusEffect("Target Link") && target.statusEffectv1("Target Link") != 0)
			{
				target.addStatusValue("Target Link", 1, -1);
				//Interrupt effect
				if (target.isImmobilized() || target.hasStatusEffect("Tripped") || target.statusEffectv1("Target Link") == 0)
				{
					if (target is AkkadiSecurityRobots) (target as AkkadiSecurityRobots).endTargetLink();
					//Should never happen since non-akkadibots shouldn't get it at all
					else target.removeStatusEffect("Target Link");
				}
			}
			
			if (target.hasStatusEffect("Bottled Poison"))
			{
				//output("<b>Bottle Mins: </b>" + target.getStatusMinutes("Bottled Poison"));
				target.addStatusMinutes("Bottled Poison",-1);
				if(target.getStatusMinutes("Bottled Poison") <= 0)
				{
					//output("<b>Bottle REMOVEMINS: </b>" + target.getStatusMinutes("Bottled Poison"));
					target.physiqueMod += target.statusEffectv1("Bottled Poison");
					target.reflexesMod += target.statusEffectv1("Bottled Poison");
					target.aimMod += target.statusEffectv1("Bottled Poison");
					target.removeStatusEffect("Bottled Poison");
					output("\n\n<b>The poison fades!</b>");
				}
				else output("\n\n<b>The bottled poison still courses through your system!</b>");
			}

			genericStatusEffectUpdate(target, "Tracer Rounds");
			genericStatusEffectUpdate(target, "Torra Lust Weakness");
			genericStatusEffectUpdate(target, "Chaff Grenade");
			genericStatusEffectUpdate(target, "Weapon Lock");
			genericStatusEffectUpdate(target, "Special Lock");
			
			if (target.hasStatusEffect("SHIZZY CUM"))
			{
				output("\n\n<b>She reeks so strongly of pheromones that it’s starting to get to you.</b>");
				applyDamage(damageRand(new TypeCollection({pheromone:target.statusEffectv1("SHIZZY CUM")}), 20), null, target, "minimal");
			}
			
			// Zweet Breeze
			// Pheromonal lust damage after all attacks are resolved. Starts strong, incrementally decreases as each of them is KO’d.
			if (target.statusEffectv1("Zweet Breeze") > 0)
			{
				var totalZil:Number = target.statusEffectv1("Zweet Breeze");
				
				if (target is PlayerCharacter)
				{
					output("\n\nAs the zil move" + (totalZil != 1 ? "" : "s") + " around you, wings out and weapon" + (totalZil != 1 ? "s" : "") + " at the ready, " + (totalZil != 1 ? "they fan their" : "he fans his") + " sweet smell towards you, the undeniably horny smell of fit, aroused zil males. The claws of lust sink themselves deeper and deeper into you...");
					if(totalZil < 3) output(" It’s undeniably not as strong, though, since you put " + (totalZil == 1 ? "two" : "one") + " of them out of commission.");
					else output(" Maybe if you took one or two of them out, it wouldn’t be so overpowering.");
				}
				
				var damage:TypeCollection = new TypeCollection( { pheromone: 5 + rand(4) } );
				applyDamage(damage.multiply(totalZil), null, target, "minimal");
			}
		}
		
		//Lowers v1 by 1 and removes the status if it's value is 0 afterwards, hope there wasn't a function to do this already
		public function genericStatusEffectUpdate(target:Creature, statusName:String):void
		{
			if (target.hasStatusEffect(statusName))
			{
				target.addStatusValue(statusName, 1, -1);
				if (target.statusEffectv1(statusName) <= 0) target.removeStatusEffect(statusName);
			} 
		}
		
		public function updateStatusEffects(collection:Array):void
		{
			for (var i:int = 0; i < collection.length; i++)
			{
				updateStatusEffectsFor(collection[i]);
			}
		}
		
		override public function showCombatMenu():void
		{
			displayFightLocation();
			displayBusts();
			//removeAllButtonHighlights();
			
			if (!doneRoundActions())
			{
				// do anything that only happens once per round here.
				if (hasEnemyOfClass(CaptainKhorganMech)) kGAMECLASS.updateKhorganMechCover();
				if (hasEnemyOfClass(EstalliaTank)) kGAMECLASS.fedQuestQueenUpdateCover();
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
		private function generateCombatMenu(fromMenu:Boolean = false):void
		{
			clearMenu();
			if (hasEnemyOfClass(Celise))
			{
				if (roundCounter == 1) addButton(0, "Attack", selectSimpleAttack, { func: CombatAttacks.MeleeAttack });
				else if (roundCounter == 2) addButton(1, StringUtil.upperCase(pc.rangedWeapon.attackVerb), selectSimpleAttack, { func: CombatAttacks.RangedAttack });
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
				if (pc.hasStatusEffect("Stunned")) output("\n\n<b>You’re still stunned!</b>");
				addButton(0, "Recover", doStunRecover, pc);
				return;
			}
			
			if (pc.hasStatusEffect("Naleen Coiled") || pc.hasStatusEffect("Mimbrane Smother") || pc.hasStatusEffect("Grappled"))
			{
				if (pc.hasStatusEffect("Naleen Coiled"))
				{
					output("\n\n<b>You are wrapped up in coils!</b>");
				}
				else if (pc.hasStatusEffect("Mimbrane Smother"))
				{
					output("\n\n<b>You are being smothered by a Mimbrane!</b>");
				}
				else if(hasEnemyOfClass(RKLah))
				{
					output("\n\n<b>You are forced to stare dizzily at the ground, the bay and throb of the crowd in your ears, Lah’s hard, wiry arms locked firmly around your neck. You’ve got to get him off you!</b>");
				}
				else
				{
					output("\n\n<b>You are grappled and unable to fight normally!</b>");
				}
				
				addButton(0, "Struggle", doStruggleRecover, pc);
				
				if (pc.hasPerk("Static Burst") && (!hasEnemyOfClass(NyreaAlpha) && !hasEnemyOfClass(NyreaBeta)))
				{
					if(!pc.hasShields() || pc.shields() <= 0) addDisabledButton(3,"StaticBurst","Static Burst","You need shields available to overload in order for static burst to function.");
					else if(pc.energy() >= 5) addButton(3,"StaticBurst", doStaticBurst);
					else addDisabledButton(3,"StaticBurst");
				}
				
				if (hasEnemyOfClass(Kaska))
				{
					addButton(10, "Nip-Pinch", kGAMECLASS.pinchKaskaNipple, undefined, "Nip-Pinch", "Maybe pinching Kaska’s nipple will get her to release you.");
				}
				if (hasEnemyOfClass(NyreaBeta) && kGAMECLASS.bothriocQuestBetaNyreaMiniquestActive())
				{
					addDisabledButton(10, "Retreat", "Retreat", "You’ll need to shake off this blasted net before trying this!");
				}
				
				addButton(4, "Do Nothing", waitRound);
				return;
			}
			
			if (hasEnemyOfClass(MyrGoldOfficer) && flags["FEDERATION_QUEST_WINDOW"] == 1)
			{
				output("\n\n<b>Your vision is obstructed by smoke, making you effectively blind!</b>");
				addButton(10, "BreakWindow", kGAMECLASS.fedQuestOfficerBreakWindow, undefined, "Break Window", "Maybe this’ll get rid of the smoke?");
			}
			if (hasEnemyOfClass(NyreaBeta) && kGAMECLASS.bothriocQuestBetaNyreaMiniquestActive())
			{
				addButton(10, "Retreat", kGAMECLASS.bothriocQuestBetaNyreaRetreat, undefined, "Retreat", "Retreat slowly in the direction of the Quadomme Bothrioc.");
			}

			if (hasEnemyOfClass(ForgeHound) && flags["FORGEHOUND_APOLIFUCKED"] != undefined && rand(12) == 0)
			{
				output("\n\n<b>It’s so hard not to daydream around him...</b>");
				addButton(0,"Daydream",kGAMECLASS.addictionTurnWaster);
				return;
			}
			
			//Combat Notes :
			//PC has status Strangely Warm or Blood Fevered :
			if((pc.hasStatusEffect("Fuck Fever") || pc.hasStatusEffect("Flushed")) && hasDickedEnemy())
			{
				if(!fromMenu && pc.lust() < pc.lustMax())
				{
					output("\n\nOh, something");
					if(pc.hasAirtightSuit()) output(" looks <i>divine</i>... like pure sex in physical form");
					else output(" smells <i>divine</i>... like pure sex in vapor form");
					output(". It makes your [pc.asshole] clench, hungry for cock. <b>Looks like you’re not gonna be able to ");
					if(pc.canFly()) output("fly");
					else output("weasel");
					output(" your way out of this encounter!</b>");
				}
			}

			// attack
			if (flags["CHECKED_GEAR_AT_OGGY"] != undefined && hasEnemyOfClass(Varmint) && pc.hasKeyItem("Lasso"))
			{
				addButton(0, "Lasso", selectSimpleAttack, { func: kGAMECLASS.lassoAVarmint }, "Lasso", "Use this lasso you’ve been provided with to properly down this varmint.");
			}
			else
			{
				var af:Function = pc.meleeWeapon.attackImplementor == null ? CombatAttacks.MeleeAttack : pc.meleeWeapon.attackImplementor;
				if(pc.hasStatusEffect("Weapon Lock")) addDisabledButton(0, "Attack", "Melee Attack", "You can’t bring yourself to resort to using a weapon right now!");
				else if(pc.meleeWeapon.hasFlag(GLOBAL.ITEM_FLAG_POWER_ARMOR) && !pc.canUsePowerArmorWeapon()) addDisabledButton(0, "Attack", "Melee Attack", "Your melee weapon is too heavy to lift and use!");
				else addButton(0, "Attack", selectSimpleAttack, { func: af, isMelee: true }, "Melee Attack", "Attack a single enemy with a melee strike. Damage is based on physique.");
			}
			
			// shoot
			var sf:Function = pc.rangedWeapon.attackImplementor == null ? CombatAttacks.RangedAttack : pc.rangedWeapon.attackImplementor;
			if(pc.hasStatusEffect("Weapon Lock")) addDisabledButton(1, StringUtil.upperCase(pc.rangedWeapon.attackVerb), "Ranged Attack", "You can’t bring yourself to resort to using a weapon right now!");
			else if(pc.rangedWeapon.hasFlag(GLOBAL.ITEM_FLAG_POWER_ARMOR) && !pc.canUsePowerArmorWeapon()) addDisabledButton(1, StringUtil.upperCase(pc.rangedWeapon.attackVerb), "Ranged Attack", "Your ranged weapon is too heavy to lift and use!");
			else if(pc.rangedWeapon.hasFlag(GLOBAL.ITEM_FLAG_HIGH_PHYSIQUE) && !pc.canUsePowerArmorWeapon() && pc.PQ() < 66) addDisabledButton(1, StringUtil.upperCase(pc.rangedWeapon.attackVerb), "Ranged Attack", "You lack the physique necessary to use such a weapon! You need at least " + Math.ceil(pc.physiqueMax() * 66/100) + " physique to use it.");
			else addButton(1, StringUtil.upperCase(pc.rangedWeapon.attackVerb), selectSimpleAttack, { func: sf, isRanged: true }, "Ranged Attack", "Attack a single enemy with a ranged weapon. Damage is based on aim.");
			
			//
			// inventory
			addButton(3, "Inventory", kGAMECLASS.inventory, undefined, "Inventory", "Use items in combat.");
			// specials

			if(pc.hasStatusEffect("Special Lock")) addDisabledButton(4,"Specials","Specials","You can’t remember how to use your special abilities right now...");
			else addButton(4, "Specials", generateSpecialsMenu, undefined, "Specials", "The special attacks you have available to you are listed in this menu.");
			
			// tease
			if (pc.hasStatusEffect("Myr Venom Withdrawal")) addDisabledButton(5, "Tease", "Tease", "Without the venom, teasing just seems... fruitless.");
			else addButton(5, "Tease", selectSimpleAttack, { func: generateTeaseMenu }, "Tease Menu", "Opens up your menu of available lust-targeting attacks. It is recommended that the ‘Sense’ option be used beforehand.");
			
			// sense
			addButton(6, "Sense", selectSimpleAttack, { func: generateSenseMenu }, "Sense", "Attempts to get a feel for a foe’s likes and dislikes. Absolutely critical for someone who plans on seducing " + pc.mf("his", "her") + " way out of a fight.");
			
			if(_hostiles[0].hasPerk("Appearance Enabled")) addButton(7,"Closer Look",combatAppearance,undefined,"Closer Look","Take a closer look at your foe’s appearance.\n\nThis does not consume your action for this round.");

			// fantasize
			addButton(8, "Fantasize", fantasizeRound, undefined, "Fantasize", "Fantasize about your foe until you’re helpless and on your [pc.knees] before them.");
			// wait
			addButton(9, "Wait", waitRound, undefined, "Wait", "There’s no real reason to this unless you’re just dragging out combat to see what your enemy will do.");
			
			//
			//
			//
			// run
			if (pc.hasStatusEffect("Cockvine Grip") && pc.statusEffectv1("Cockvine Grip") > 0)
			{
				if (pc.hasPerk("Static Burst"))
				{
					if (!pc.hasShields() || pc.shields() <= 0) addDisabledButton(3,"StaticBurst","Static Burst","You need shields available to overload in order for static burst to function.");
					else if (pc.energy() >= 5) addButton(3, "StaticBurst", doStaticBurst);
					else addDisabledButton(3, "StaticBurst");
				}
				addButton(14, "Struggle", kGAMECLASS.adultCockvineStruggleOverride, undefined, "Struggle", "Struggle free of the Cockvines crushing grip.");
			}
			else if (pc.hasStatusEffect("Tripped"))
			{
				// trip
				addButton(14, "Stand Up", standupRound, undefined, "Stand Up", "Stand up, getting rid of the “Trip” status effect. This will consume your offensive action for this turn.");
			}
			else if (_hostiles.length == 1 && _hostiles[0] is Shizuya)
			{
				addDisabledButton(14, "Run", "Run", "You agreed to this, no turning back now.");
			}
			else
			{
				addButton(14, "Run", runAway, undefined, "Run", "Attempt to run away from your enemy. Success is greatly dependent on reflexes. Immobilizing your enemy before attempting to run will increase the odds of success.");
			}
			
			// Hook in any additional menu entries -- allowing the hooks to override
			// default entries
			additionalCombatMenuEntries();
		}
		public function combatAppearance():void
		{
			clearOutput();
			kGAMECLASS.appearance(_hostiles[0]);
			clearMenu();
			addButton(14, "Back", generateCombatMenu, true);
		}
		private function waitRound():void
		{
			clearOutput();
			if (pc.hasStatusEffect("Grappled"))
			{
				if (hasEnemyOfClass(Kaska)) kGAMECLASS.doNothingWhileTittyGrappled();
				else if (hasEnemyOfClass(GrayPrime)) kGAMECLASS.grayPrimeFailEscape();
				else if (hasEnemyOfClass(MaidenVanae) || hasEnemyOfClass(HuntressVanae))
				{
					kGAMECLASS.setEnemy(_hostiles[0]);
					kGAMECLASS.vanaeWaitWhilstGrappled();
					kGAMECLASS.setEnemy(null);
				}
				else output("You choose not to act.");
				waitRoundEffects();
			}
			else
			{
				output("You choose not to act.");
				if (_hostiles.length == 1 && _hostiles[0] is CrystalGooT1 && (_hostiles[0] as CrystalGooT1).ShouldIntercept({isWait: true}))
				{
					(_hostiles[0] as CrystalGooT1).SneakSqueezeAttackReaction( { isWait: true } );
				}
				else if (_hostiles.length == 1 && _hostiles[0] is CrystalGooT2 && (_hostiles[0] as CrystalGooT2).ShouldIntercept({ isWait: true }))
				{
					(_hostiles[0] as CrystalGooT2).SpecialAction( { isWait: true } );
				}
				//Flag PC as having waited like a good boy and or girl.
				else if (_hostiles.length == 1 && _hostiles[0] is KorgonneMale)
				{
					(_hostiles[0] as KorgonneMale).setStatusValue("SURPRISE_MUTHA_TRUCKAH",1,1);
				}
				waitRoundEffects();
			}
		}
		public function waitRoundEffects():void
		{
			kGAMECLASS.sneezingTitsCombatWaitBonus(_hostiles);
			processCombat();
		}
		
		private function fantasizeRound():void
		{
			clearOutput();

			output("You decide you’d rather fantasize than fight back at this point. Why bother when your enem");
			if(enemiesAlive() > 1) output("ies are");
			else output("y is");
			output(" so alluring?");
			pc.lust(20 + rand(20));
			
			if (_hostiles.length == 1 && _hostiles[0] is CrystalGooT1 && (_hostiles[0] as CrystalGooT1).ShouldIntercept({ isFantasize: true }))
			{
				(_hostiles[0] as CrystalGooT1).SneakSqueezeAttackReaction( { isFantasize: true } );
			}
			else if (_hostiles.length == 1 && _hostiles[0] is CrystalGooT2 && (_hostiles[0] as CrystalGooT2).ShouldIntercept({ isFantasize: true }))
			{
				(_hostiles[0] as CrystalGooT2).SpecialAction( { isFantasize: true } );
			}
			
			processCombat();
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
				if(pc.canFly() && pc.hasWings()) output("Moving your powerful [pc.wingsNoun], you manage to lift yourself up and get back onto your [pc.feet].");
				else output("You climb up onto your [pc.feet].");
				pc.removeStatusEffect("Tripped");
			}
			processCombat();
		}
		
		private function doTripRecover(target:Creature):void
		{
			if (target.hasStatusEffect("Tripped"))
			{
				if(target.statusEffectv1("Tripped") > 0 && !target.canFly())
				{
					output(StringUtil.capitalize(target.getCombatName(), false) + " struggles to get");
					if(target.isPlural) output(" themselves");
					else output(" " + target.mfn("him", "her", "it") + "self");
					output(" up, but can’t.");
					target.addStatusValue("Tripped", 1, -1);
				}
				else
				{
					if(target.canFly() && target.hasWings())
					{
						output("With " + target.getCombatPronoun("hisher") + " " + target.wingsDescript(true) + " quickly flapping, " + target.getCombatName());
					}
					else output(StringUtil.capitalize(target.getCombatName(), false));
					output(" lifts");
					if(target.isPlural) output(" themselves from the floor and gets their " + target.feet() + " back under themselves.");
					else output(" " + target.mfn("him", "her", "it") + "self from the floor and gets " + target.mfn("his", "her", "its") + " " + target.feet() + " back under " + target.mfn("him", "her", "it") + "self.");
					target.removeStatusEffect("Tripped");
				}
			}
		}
		
		private function runAway():void
		{
			clearOutput();
			if (pc.inRut() && hasDickedEnemy())
			{
				//Attempt to flee vs enemy with cock.
				output("You can’t flee, not when there’s a challenge to defeat. Especially not when said challenge has a penis. The mere thought of giving up enrages you!");
				processCombat();
				return;
			}
			output("You attempt to flee from your opponent");
			if (hasEnemyOfClass(QueenOfTheDeep))
			{
				output(", but you don’t have a lot of options down here!");
				processCombat();
				return;
			}
			if(CombatManager.multipleEnemies()) output("s");
			output("! ");
			//Autofail conditions first!
			if(pc.isImmobilized()) {
				output("You cannot run while you are " + (pc.isGrappled() ? "in the enemy’s grip" : "immobilized") + "!");
				processCombat();
				return;
			}
			if (isFleeDisabled()) {
				output("<b>You cannot escape from this fight!</b>");
				processCombat();
				return;
			}
			if((pc.hasStatusEffect("Fuck Fever") || pc.hasStatusEffect("Flushed")) && hasDickedEnemy())
			{
				output("<b>");
				if(pc.hasStatusEffect("Flushed")) output("The warmth in your lower body");
				else output("The Fuck Fever");
				output(" won’t let you get away from a potential dicking!</b>");
				processCombat();
				return;
			}
			if (kGAMECLASS.debug)
			{
				output("You escape on wings of debug!");
				CombatManager.abortCombat();
				return;
			}
			if (hasEnemyOfClass(Frostwyrm))
			{
				output("The frostwyrm doesn’t give chase, letting you escape.");
				CombatManager.abortCombat();
				return;
			}
			// TODO rework this somehow
			
			var numActiveHostiles:int = 0;
			var hostilesLevel:Number = 0;
			var hostileReflexes:Number = 0;
			var hostilesFlying:int = 0;
			var hostilesImmobile:int = 0;
			var hostilesBlind:int = 0;
			for(var i:int = 0; i < _hostiles.length; i++)
			{
				if(!_hostiles[i].isDefeated())
				{
					if(hostilesLevel < _hostiles[i].level) hostilesLevel = _hostiles[i].level;
					if(!_hostiles[i].isImmobilized())
					{
						if(hostileReflexes < _hostiles[i].reflexes()) hostileReflexes = _hostiles[i].reflexes();
						if(_hostiles[i].canFly()) hostilesFlying++;
					}
					else hostilesImmobile++;
					if(_hostiles[i].isBlind()) hostilesBlind++;
					numActiveHostiles++;
				}
			}
			
			var x:int = 0;
			//determine difficulty class based on reflexes vs reflexes comparison, easy, low, medium, hard, or very hard
			var difficulty:int = 0;
			//easy = succeed 75%
			//low = succeed 50%
			//medium = succeed 35%
			//hard = succeed 20;
			//very hard = succeed 10%
			//Easy: PC has twice the reflexes
			if(pc.reflexes() >= hostileReflexes * 2) difficulty = 0;
			//Low: PC has more than +33% more reflexes
			else if(pc.reflexes() >= hostileReflexes * 1.333) difficulty = 1;
			//Medium: PC has more than -33% reflexes
			else if(pc.reflexes() >= hostileReflexes * .6666) difficulty = 2;
			//Hard: PC pretty slow
			else if(pc.reflexes() >= hostileReflexes * .3333) difficulty = 3;
			//Very hard: PC IS FUCKING SLOW
			else difficulty = 4;

			//Multiple NPCs? Raise difficulty class for each one!
			difficulty += (numActiveHostiles - 1);
			
			// Endowment penalty
			if(pc.hasStatusEffect("Egregiously Endowed")) difficulty++;

			//Raise difficulty for having awkwardly huge genitalia/boobs sometime!
			if(pc.energy() < (Math.round(pc.energyMax()/3)))
			{
				var desc: String = "";
				//Get the info and adjust difficulty to match
				// Breasts:
				if(pc.isHeavy("boobs")) {
					difficulty++;
					if(desc.length > 0) desc += ",";
					desc += " [pc.boobs]";
				}
				// Belly:
				if(pc.isHeavy("belly")) {
					difficulty++;
					if(desc.length > 0) desc += ",";
					desc += " [pc.belly]";
				}
				// Butt: Big Booty Bitches! Oooooooooo!
				if(pc.isHeavy("butt")) {
					difficulty++;
					if(desc.length > 0) desc += ",";
					desc += " [pc.butt]";
				}
				// Clitoris:
				if(pc.isHeavy("clits")) {
					difficulty++;
					if(desc.length > 0) desc += ",";
					desc += " [pc.clits]";
				}
				// Penis:
				if(pc.isHeavy("cocks")) {
					difficulty++;
					if(desc.length > 0) desc += ",";
					desc += " [pc.cocks]";
				}
				// Testicles:
				if(pc.isHeavy("balls")) {
					difficulty++;
					if(desc.length > 0) desc += ",";
					desc += " [pc.balls]";
				}
				if(desc.length > 0) output("Though due to the weight of your" + desc + " and your low stamina, you are finding it a bit difficult to run... ");
			}
			
			//Cap it
			if(difficulty > 5) difficulty = 5;

			//Lower difficulty for flight if enemy cant!
			if(pc.canFly() && hostilesFlying <= 0) difficulty--;
			//Lower difficulty for blind foe
			if(hostilesBlind > 0) difficulty -= hostilesBlind;
			//Lower difficulty for immobilized foe
			if(hostilesImmobile > 0) difficulty -= (2 * hostilesImmobile);
			//Easy mode is magic!
			if(kGAMECLASS.easy)
			{
				if(difficulty > 0) difficulty--;
				if(difficulty > 0) difficulty--;
				if(difficulty > 0) difficulty--;
			}
			//Outlevel the enemy? Make easier
			if(pc.level >= hostilesLevel + 2) difficulty--;
			if(pc.level >= hostilesLevel + 3) difficulty--;
			if(pc.level >= hostilesLevel + 4) difficulty--;
			if(pc.level >= hostilesLevel + 5) difficulty--;

			//Grunch makes easier!
			if(pc.accessory is GrunchLeash) difficulty -= 2;

			//Set threshold value and check!
			if(difficulty < 0) difficulty = 100;
			else if(difficulty == 0) difficulty = 75;
			else if(difficulty == 1) difficulty = 50;
			else if(difficulty == 2) difficulty = 35;
			else if(difficulty == 3) difficulty = 20;
			else if(difficulty == 4) difficulty = 10;
			else difficulty = 5;
			//Special succeeeeeesss!
			if(pc.hasStatusEffect("Survivaled") || hostilesImmobile >= numActiveHostiles) difficulty = 110;
			trace("Successful escape chance: " + difficulty + " %")
			//Success!
			if (rand(100) + 1 <= difficulty) {
				if (hasEnemyOfClass(Cockvine))
				{
					kGAMECLASS.adultCockvinePCEscapes();
					CombatManager.abortCombat();
					return;
				}
				if (hasEnemyOfClass(NyreaBeta) && kGAMECLASS.bothriocQuestBetaNyreaMiniquestActive())
				{
					kGAMECLASS.bothriocQuestBetaNyreaMiniquestRun();
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
				return;
			}
			else {
				output("It doesn’t work!");
				processCombat();
				return;
			}
		}
		
		private function doStaticBurst():void
		{
			clearOutput();
			pc.energy(-5);
			if (hasEnemyOfClass(AkkadiSecurityRobots))
			{
				output("You send a burst of electricity back along the grappling line, right into the offending security bot.");
			}
			else
			{
				output("You release a discharge of electricity, momentarily weakening your ");
				if(_hostiles[0].isPlural || enemiesAlive() > 1) output("foes’");
				else output("foe’s");
				output(" grip on you!");
			}
			if (pc.hasStatusEffect("Naleen Coiled"))
			{
				pc.removeStatusEffect("Naleen Coiled");
				output("\nThe naleen’s tail spasms as you easily slip out of its coils.");
			}
			if (pc.hasStatusEffect("Mimbrane Smother"))
			{
				pc.removeStatusEffect("Mimbrane Smother");
				output("\nYou manage to force your fingers under the edge of the Mimbrane smothering you, and easily pluck it off from your face.");
			}
			if(pc.hasStatusEffect("Grappled"))
			{
				pc.removeStatusEffect("Grappled");
				if (hasEnemyOfClass(AkkadiSecurityRobots)) output("\nIt lurches backward and squeals, disconnecting the grappling line. The magnets deactivate, releasing you from the robot’s grasp.");
				else output("\nYou slip free of the grapple.");
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
			var stunEffect:StorageClass = target.getStatusEffect("Stunned");
			
			if (stunEffect != null)
			{
				if (target is PlayerCharacter) clearOutput();
				
				stunEffect.value1--;
				
				if (stunEffect.value1 <= 0)
				{
					target.removeStatusByRef(stunEffect); // removed from the creature
					// but we still hold a ref to it for further processing!
					if (target is PlayerCharacter)
					{
						//For Kane shit
						if(target.hasStatusEffect("Kane's Honey"))
						{
							//PC lust < 70:
							if(target.lust() < 70) output("You shove the zil off you and grasp your [pc.weapon] firmly once again.");
							else output("You manage to break away from the zil, grasping your [pc.weapon] and taking deep breaths, trying to control the arousal running fierce in your veins.");
							target.removeStatusEffect("Kane's Honey");
						}
						else if (stunEffect.value2 == 1)
						{
							output("You shake yourself off, blinking rapidly. Whatever mental influence had crept into your brain seems to have flushed out, leaving your mind a bit foggy, but ready to fight regardless.");
						}
						else
						{
							output("You manage to recover your wits and adopt a fighting stance!");
						}
					}
					else if (!target.isPlural)
					{
						output(StringUtil.capitalize(target.getCombatName(), false) + " manages to recover " + target.mfn("his","her","its") + " wits and adopt a fighting stance!");
					}
					else
					{
						output(StringUtil.capitalize(target.getCombatName(), false) + " manage to recover their wits and adopt a fighting stance!");
					}
				}
				else
				{
					if (target is PlayerCharacter) output("You’re still too stunned to act!");
					else
					{
						if (!target.hasStatusEffect("Lust Stunned"))
						{
							if (!target.isPlural) output(StringUtil.capitalize(target.getCombatName(), false) + " is still too stunned to act!");
							else output(StringUtil.capitalize(target.getCombatName(), false) + " are still too stunned to act!");
						}
						else
						{
							if (!target.isPlural) output("<b>Your teasing has " + (_hostiles.length == 1 ? ("the poor " + target.mfn("boy", "girl", "thing")) : target.getCombatName()) + " in a shuddering mess as " + target.mfn("he", "she", "it") +" tries to regain control of " + target.mfn("his", "her", "its") + " lust addled nerves.</b>");
							else output("<b>Your teasing has " + target.getCombatName() + " in a shuddering mess as they try to regain control of their lust addled nerves.</b>");
						}
					}
				}
			}
			
			if (target.hasStatusEffect("Paralyzed"))
			{
				if (target is PlayerCharacter)
				{
					clearOutput();
					if (target.statusEffectv1("Paralyzed") <= 1) output("The venom seems to be weakening, but you can’t move yet!");
					else output("You try to move, but just can’t manage it!");
				}
				else
				{
					if (target.statusEffectv1("Paralyzed") <= 1) output(StringUtil.capitalize(target.getCombatName(), false) + " show" + (!target.isPlural ? "s" : "") + " slight signs of movement, the venom seems to be weakening!");
					else output(StringUtil.capitalize(target.getCombatName(), false) + " " + (!target.isPlural ? "is" : "are") + " still too paralyzed to move!");
				}
			}
	
			if (target is PlayerCharacter) processCombat();
		}
		
		private function doStruggleRecover(target:Creature):void
		{
			var latexBonus:int = 0;
			var panicJack:Boolean = (target.hasPerk("Panic Ejaculation") && target.hasCock());
			var panicBonus:int = 0;
			var slipperyBonus:int = 0;
			if(panicJack) panicBonus = 5;
			if (target.hasStatusEffect("Oil Slicked")) slipperyBonus = 5;
			if(target.hasPerk("Black Latex")) latexBonus = 2;
			// TODO Tweak the shit out of this probably for other NPCs to be able to call into it			
			if (target is PlayerCharacter) clearOutput();
			else if (target is Anno)
			{
				(target as Anno).grappleStruggle();
			}
			
			//Track if struggled for Maike
			if(hasEnemyOfClass(Maike)) pc.createStatusEffect("MaikeStruggled", 0, 0, 0, 0, true, "", "", true);

			if (hasEnemyOfClass(Cockvine) && target is PlayerCharacter)
			{
				// TODO pull this in!
				kGAMECLASS.adultCockvineStruggleOverride();
				return;
			}
			// Bothrioc Quadomme - PC struggles
			else if (hasEnemyOfClass(BothriocQuadomme) && target is PlayerCharacter)
			{
				var quadomme:BothriocQuadomme = _hostiles[0];
				quadomme.webStruggle(target);
				return;
			}
			// Naleen coil grapple text
			else if (hasEnemyOfClass(Naleen) || hasEnemyOfClass(NaleenMale) || hasEnemyOfClass(NaleenMatingBall) || hasEnemyOfClass(NaleenBrotherA) || hasEnemyOfClass(NaleenBrotherB))
			{
				if(target.hasPerk("Escape Artist"))
				{
					if(target.reflexes() + rand(20) + 6 + latexBonus + panicBonus + target.statusEffectv1("Naleen Coiled") * 5 + slipperyBonus > 24) {
						if(target is PlayerCharacter) output("You display a remarkable amount of flexibility as you twist and writhe through the coils to freedom.");
						else output(target.getCombatName() + " display" + (!target.isPlural ? "s" : "") + " a remarkable amount of flexibility as " + target.getCombatPronoun("s") + " twist" + (!target.isPlural ? "s" : "") + " and writhe" + (!target.isPlural ? "s" : "") + " through the coils to freedom.");
						if(panicJack)
						{
							if(target is PlayerCharacter) output(" The [pc.cumNoun] you squirt helps a little too.");
							else output("... with some extra lewd lube, too.");
							target.lust(-10);
						}
						target.removeStatusEffect("Naleen Coiled");
					}
				}
				//Limber confers a 20% escape chance.
				else if(target.hasPerk("Limber") && rand(10) <= 1)
				{
					output("You contort your body wildly to escape! All that time spent practicing yoga with Paige has paid off!");
					if(panicJack)
					{
						output(" The [pc.cumNoun] you squirt helps a little too.");
						pc.lust(-10);
					}
					target.removeStatusEffect("Naleen Coiled");
				}
				else
				{
					if(target.physique() + rand(20) + 1 + latexBonus + panicBonus + target.statusEffectv1("Naleen Coiled") * 5 + slipperyBonus > 24) {
						if(target is PlayerCharacter) output("With a mighty heave, you tear your way out of the coils and onto your [pc.feet].");
						else output("With a heave, " + target.getCombatName() + " tear" + (!target.isPlural ? "s" : "") + " " + target.getCombatPronoun("s") + " way out of the coils and adopt" + (!target.isPlural ? "s" : "") + " a fighting stance.");
						if(panicJack)
						{
							if(target is PlayerCharacter) output(" The [pc.cumNoun] you squirt helps a little too.");
							else output("... with some extra lewd lube, too.");
							target.lust(-10);
						}
						target.removeStatusEffect("Naleen Coiled");
					}
				}
				//Fail to escape: 
				if(target.hasStatusEffect("Naleen Coiled"))
				{
					if(target is PlayerCharacter)
					{
						if(CombatManager.hasEnemyOfClass(Naleen)) output("You groan in pain, struggling madly to escape the brutal confines of the naleen’s coils. She grins down at you with a feral look in her eyes....");
						else if(CombatManager.hasEnemyOfClass(NaleenMatingBall)) output("You struggle madly to escape from the coils but ultimately fail. The pin does feel a little looser as a result, however.");
						else output("You groan in pain, struggling madly to escape the brutal confines of the naleen’s coils. He grins down at you with a predatory glint in his eye, baring his fangs....");
					}
					else output(target.getCombatName() + " groan" + (!target.isPlural ? "s" : "") + " in pain, struggling madly to escape the brutal confines of the naleen’s coils, but to no avail...");
					target.addStatusValue("Naleen Coiled",1,1);
					if(panicJack)
					{
						if(target is PlayerCharacter) output(" Not even your miniature, [pc.cumNoun]-squirting orgasms can help.")
						else output(" Not even the extra lewd lube squirted can help the matter...");
						target.lust(-10);
					}
				}
			}
			// Mimbrane grapplestruggle
			else if (hasEnemyOfClass(Mimbrane))
			{
				if (target.hasPerk("Escape Artist"))
				{
					if (target.reflexes() + rand(10) + latexBonus > target.statusEffectv1("Mimbrane Smother") * 5)
					{
						output("You keep your cool, calmly feeling around the edges of the parasite attached to your face and manage to find a weakness in its hold; working your fingers into the small imperfection in the Mimbranes seal around your features, you manage to pry it away from you.");
						target.removeStatusEffect("Mimbrane Smother");
					}
				}
				else
				{
					if (target.physique() + rand(10) + latexBonus > target.statusEffectv1("Mimbrane Smother") * 5)
					{
						output("You manage to force your fingers under the edge of the Mimbrane smothering you, and forcefully tear it away from your face.");
						target.removeStatusEffect("Mimbrane Smother");
					}
				}
				
				// Failure to escape
				if (target.hasStatusEffect("Mimbrane Smother"))
				{
					target.lust(10 + target.libido()/10);

					// fail to escape 1
					if (target.statusEffectv1("Mimbrane Smother") == 0)
					{
						output("Your hands fail to find purchase on the slippery surface of your aggressor. The Mimbrane continues squeezing and sliding against your head.");
						target.setStatusValue("Mimbrane Smother", 1, 1);
					}
					// fail to escape 2
					else if (target.statusEffectv1("Mimbrane Smother") == 1)
					{
						output("The Mimbrane’s advance over you puts you into a slight daze, overpowered by the artificial desire being forced upon you. You snap back to your senses and resume your struggle to free yourself.")
						target.setStatusValue("Mimbrane Smother", 1, 2);
					}
					// defeated
					else if (target.statusEffectv1("Mimbrane Smother") == 2)
					{
						output("The aphrodisiacal rag around your head proves to be too much, dissolving the last of your will and dropping you to your [pc.knees]. You breathe heavily, sucking in increasing amounts of the parasite’s infatuating perspiration and causing its skin to compress and inflate over your mouth. Sensing your defeat, the Mimbrane slowly unfurls from your head. Lines of oily sweat snap apart as the parasite peels off of you. It sizes up its prize, deciding how to proceed.");
						target.lust(target.lustMax(), true);
					}
					if(panicJack)
					{
						output(" Not even your miniature, [pc.cumNoun]-squirting orgasms can help.")
						if(pc.lust() < pc.lustMax()) pc.lust(-10);
					}
				}
			}
			// Standard grapple text
			else
			{
				if (target.hasPerk("Escape Artist") && target.reflexes() >= target.physique())
				{
					if (target.reflexes() + rand(20) + 7 + latexBonus + panicBonus + target.statusEffectv1("Grappled") * 5 + slipperyBonus > target.statusEffectv2("Grappled"))
					{
						if (hasEnemyOfClass(SexBot)) output("You almost dislocate an arm doing it, but, ferret-like, you manage to wriggle out of the sexbot’s coils. Once your hands are free, the droid does not seem to know how to respond, and you are able to grapple the rest of your way out easily, ripping away from its molesting grip. The sexbot clicks and stutters a few times before going back to staring at you blankly, swinging its fibrous limbs over its head.");
						else if (hasEnemyOfClass(MaidenVanae) || hasEnemyOfClass(HuntressVanae)) kGAMECLASS.vanaeEscapeGrapple("Escape Artist");
						else if (hasEnemyOfClass(BothriocPidemme) || hasEnemyOfClass(BothriocQuadomme))
						{
							output("You struggle against the bindings, trying to shove your assailant off you so you can tear free. Shooting the bothrioc atop you a winning smile, you wriggle your way out from under them back between their legs, squirming out of your bindings as you take to your feet.");
						}
						else output("You display a remarkable amount of flexibility as you twist and writhe to freedom.");
						if(panicJack)
						{
							output(" The [pc.cumNoun] you squirt helps a little too.");
							pc.lust(-10);
						}
						target.removeStatusEffect("Grappled");
					}
				}
				//Limber confers a 20% escape chance.
				else if(target.hasPerk("Limber") && rand(10) <= 1)
				{
					output("You contort your body wildly to escape! All that time spent practicing yoga with Paige has paid off!");
					if(panicJack)
					{
						output(" The [pc.cumNoun] you squirt helps a little too.");
						pc.lust(-10);
					}
					target.removeStatusEffect("Grappled");
				}
				else
				{
					if(target.physique() + rand(20) + 6 + latexBonus + panicBonus + target.statusEffectv1("Grappled") * 5 + slipperyBonus > target.statusEffectv2("Grappled"))
					{
						// TODO It might be an idea to do something similar to how drone targets work now, in that the actual
						// enemy DOING the grappling is stored as a transient property on the victim of the grapple,
						// allowing us to extract this information
						// The same will also be said of the grapler in instances where grapples can happen with multiple
						// enemies- we'll need to know which one, specifically, is out of action for other attacks
						
						if (hasEnemyOfClass(SexBot)) output("You almost tear a muscle doing it, but, you manage to heave apart the sexbot’s coils. Once your hands are free, the droid does not seem to know how to respond, and you are able to grapple the rest of your way out easily, ripping away from its molesting grip. The sexbot clicks and stutters a few times before going back to staring at you blankly, swinging its fibrous limbs over its head.");
						else if (hasEnemyOfClass(MaidenVanae) || hasEnemyOfClass(HuntressVanae)) kGAMECLASS.vanaeEscapeGrapple();
						else if (hasEnemyOfClass(GrayPrime) && target is PlayerCharacter) kGAMECLASS.grayPrimeEscapeGrapple();
						else if (hasEnemyOfClass(NyreaAlpha) || hasEnemyOfClass(NyreaBeta)) output("You pull and heave at the thick, knotted ropes of the nyrea’s net, finally managing to pry a gap large enough for you to squeeze your frame through!");
						//else if (enemy is GoblinGadgeteer) output("You manage to untangle your body from the net, and prepare to fight the goblin again.");
						else if (hasEnemyOfClass(Goocubator))
						{
							output("You manage to tear yourself out of the goo’s grasp, wrenching your limbs free one by one. She squeals as you pop yourself out of her, eyes crossing as her whole body quakes with the aftershocks.");
							output("\n\n<i>“Aww, why do you have to be that way?”</i> she pouts, wiggling away from you.");
						}
						else if (hasEnemyOfClass(BothriocPidemme))
						{
							output("You struggle against the bindings, trying to shove your assailant off you so you can tear free. You heave the bothrioc off of you, granting you the time needed to extricate yourself from the bolo.");
						}
						else if (hasEnemyOfClass(BothriocQuadomme))
						{
							output("You struggle against the bindings, trying to shove your assailant off you so you can tear free. You heave the bothrioc off of you, granting you the time needed to extricate yourself from the tight web.");
						}
						else if (hasEnemyOfClass(RKLah)) output("You pull him to one side, before delivering a sucker punch hard and low from the other. Lah gasps in pain, and you manage to rip out of his grasp.");
						else if (hasEnemyOfClass(AkkadiSecurityRobots)) output("You finally manage to tear your way out of the net!");
						else output("With a mighty heave, you tear your way out of the grapple and onto your [pc.feet].");
						if(panicJack)
						{
							output(" The [pc.cumNoun] you squirt helps a little too.");
							pc.lust(-10);
						}
						target.removeStatusEffect("Grappled");
					}
				}

				
				// Failure to escape grapple
				if(target.hasStatusEffect("Grappled"))
				{
					if(hasEnemyOfClass(SexBot)) output("You struggle as hard as you can against the sexbot’s coils but the synthetic fiber is utterly unyielding.");
					else if (hasEnemyOfClass(Kaska)) kGAMECLASS.failToStruggleKaskaBoobs();
					else if (hasEnemyOfClass(MaidenVanae) || hasEnemyOfClass(HuntressVanae)) output("You wriggle in futility, helpless as she lubes you up with her sensuous strokes. This is serious!");
					else if (hasEnemyOfClass(GrayPrime) && target is PlayerCharacter) kGAMECLASS.grayPrimeFailEscape();
					else if (hasEnemyOfClass(NyreaAlpha) || hasEnemyOfClass(NyreaBeta)) output("Try as you might, struggling against the heavy ropes of the nyrea huntresses net, you just can’t find a way out of the net that has you restrained.");
					else if (hasEnemyOfClass(BothriocPidemme))
					{
						output("You struggle against the bindings, trying to shove your assailant off you so you can tear free. The bindings loosen a little, but your freedom is still out of reach... for now.");
					}
					else if (hasEnemyOfClass(BothriocQuadomme))
					{
						output("You struggle against the bindings, trying to shove your assailant off you so you can tear free. The webs loosen a little, but your freedom is still out of reach... for now.");
					}
					else if (hasEnemyOfClass(RKLah)) output("You claw blindly at his face and try and buck furiously, to no avail.\n\n<i>“Stuck pig,”</i> grits the ausar, tightening his hold. <i>“Give in already.”</i>");
					//else if (enemy is GoblinGadgeteer) output("You manage to untangle your body from the net, and prepare to fight the goblin again.");
					else output("You struggle madly to escape from the pin but ultimately fail. The pin does feel a little looser as a result, however.");
					if(panicJack)
					{
						output(" Not even your miniature, [pc.cumNoun]-squirting orgasms can help.")
						pc.lust(-10);
					}
					target.addStatusValue("Grappled",1,1);
				}
			}
			if (target is PlayerCharacter) processCombat();
		}
		
		private function specialsButtonAdjustment(bOff:int):int
		{
			if (bOff == 13) bOff++;
			return ++bOff;
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
					addButton(bOff, atk.ButtonName, selectAttack, atk, atk.TooltipTitle, atk.TooltipBody + (atk.EnergyCost > 0 ? "\n\n<b>Costs " + atk.EnergyCost + " energy to use.</b>" : "" ));
				}
				else
				{
					addDisabledButton(bOff, atk.ButtonName, atk.TooltipTitle, atk.TooltipBody);
				}
				bOff = specialsButtonAdjustment(bOff);
			}
			
			// Special shits
			if (pc.armor is GooArmor)
			{
				if (!pc.hasStatusEffect("Reduced Goo"))
				{
					addButton(bOff, "Goo Clone", selectSimpleAttack, { func: kGAMECLASS.pcGooClone, isSpecial: true }, "Goo Clone", "Have [goo.name] hop off and start teasing your enemy. Reduces your armor value, but inflicts lust over time.");
				}
				else
				{
					addButton(bOff, "Recall Goo", kGAMECLASS.pcRecallGoo, undefined, "Recall Goo", "Call [goo.name] back to you, restoring your gooey armor.");
				}
				bOff = specialsButtonAdjustment(bOff);
			}
			if (pc.hasCombatDrone())
			{
				if (pc.hasActiveCombatDrone())
				{
					if(pc.hasStatusEffect("Varmint Buddy")) addButton(bOff, "Varmint", selectDroneTarget, undefined, "Varmint, Go!", ("Have your varmint target " + (_hostiles.length > 1 ? "an" : "the") + " enemy."));
					else if(pc.hasStatusEffect("Disarmed") && flags["CHECKED_GEAR_AT_OGGY"] != undefined)
					{
						if(pc.hasTamWolf()) addDisabledButton(bOff, "TamWolf", "Tam-wolf, Go!", "You are disarmed and can’t communicate with Tam-wolf right now!");
						else if(pc.accessory is SiegwulfeItem) addDisabledButton(bOff, "Siegwulfe", "Siegwulfe, Go!", "You are disarmed and can’t communicate with [wulfe.name] right now!");
						else if(pc.accessory.hasFlag(GLOBAL.ITEM_FLAG_COMBAT_DRONE) && pc.accessory.shortName != "") addDisabledButton(bOff, pc.accessory.shortName, "Accessory Target", ("You are disarmed and can’t access your " + pc.accessory.longName + " right now!"));
						else if(pc.accessory is KordiiakLeash) addDisabledButton(bOff, "Kor’diiak", "Kor’diiak, Go!", "You are disarmed and had to leave your pet bear behind!");
						else if(pc.accessory is ShoulderGrunchLeash) addDisabledButton(bOff, "Kor’diiak", "Kor’diiak, Go!", "You are disarmed and had to leave your pet behind!");
						else addDisabledButton(bOff, "Drone Target", "Drone Target", "You are disarmed and can’t access your combat drone right now!");
					}
					else if(pc.hasTamWolf()) addButton(bOff, "TamWolf", selectDroneTarget, undefined, "Tam-wolf, Go!", ("Have Tam-wolf target " + (_hostiles.length > 1 ? "an" : "the") + " enemy."));
					else if(pc.accessory is KordiiakLeash) addButton(bOff, "Kor’diiak", selectDroneTarget, undefined, "Kor’diiak, Go!", ("Have your ice bear target " + (_hostiles.length > 1 ? "an" : "the") + " enemy. Hopefully."));
					else if(pc.accessory is ShoulderGrunchLeash) addButton(bOff, "Grunch", selectDroneTarget, undefined, "Grunch, Go!", ("Have your grunch target " + (_hostiles.length > 1 ? "an" : "the") + " enemy."));
					else if(pc.accessory is SiegwulfeItem) addButton(bOff, "Siegwulfe", selectDroneTarget, undefined, "Siegwulfe, Go!", ("Have [wulfe.name] target " + (_hostiles.length > 1 ? "an" : "the") + " enemy."));
					else if(pc.accessory.hasFlag(GLOBAL.ITEM_FLAG_COMBAT_DRONE) && pc.accessory.shortName != "") addButton(bOff, pc.accessory.shortName, selectDroneTarget, undefined, "Accessory Target", ("Have your " + pc.accessory.longName + " target " + (_hostiles.length > 1 ? "an" : "the") + " enemy."));
					else addButton(bOff, "Drone Target", selectDroneTarget, undefined, "Drone Target", ("Have your drone target " + (_hostiles.length > 1 ? "an" : "the") + " enemy."));
				}
				else
				{
					if(pc.hasStatusEffect("Varmint Buddy")) addDisabledButton(bOff, "Varmint", "Varmint, Go!", "You can’t communicate with your varmint right now!");
					if(pc.accessory is KordiiakLeash) addDisabledButton(bOff, "Kor’diiak", "Kor’diiak, Go!", "You can’t communicate with your kor’diiak right now!");
					if(pc.accessory is ShoulderGrunchLeash) addDisabledButton(bOff, "Grunch", "Grunch, Go!", "You can’t communicate with your pet right now!");
					else if(pc.hasTamWolf()) addDisabledButton(bOff, "TamWolf", "Tam-wolf, Go!", "You can’t communicate with Tam-wolf right now!");
					else if(pc.accessory is SiegwulfeItem) addDisabledButton(bOff, "Siegwulfe", "Siegwulfe, Go!", "You can’t communicate with [wulfe.name] right now!");
					else if(pc.accessory.hasFlag(GLOBAL.ITEM_FLAG_COMBAT_DRONE) && pc.accessory.shortName != "") addDisabledButton(bOff, pc.accessory.shortName, "Accessory Target", ("You can’t access your " + pc.accessory.longName + " right now!"));
					else addDisabledButton(bOff, "Drone Target", "Drone Target", "You can’t access your combat drone right now!");
				}
				bOff = specialsButtonAdjustment(bOff);
			}
			
			// TODO sort pages and shit
			addButton(14, "Back", generateCombatMenu, true);
		}
		
		private function selectDroneTarget():void
		{
			clearMenu();
			
			if(pc.droneTarget == null && !pc.hasStatusEffect("Drone Targeting"))
			{
				pc.droneTarget = CombatAttacks.GetBestPotentialTarget(_hostiles);
				if(pc.droneTarget == null) 
				{
					if(pc.accessory is KordiiakLeash) pc.createStatusEffect("Drone Targeting", -1, 0, 0, 0, true, "Radio", ("Your kor’diiak is targeting..."), true, 0, 0xFFFFFF);
					else if(pc.accessory is ShoulderGrunchLeash) pc.createStatusEffect("Drone Targeting", -1, 0, 0, 0, true, "Radio", ("Your pet is targeting..."), true, 0, 0xFFFFFF);
					else pc.createStatusEffect("Drone Targeting", -1, 0, 0, 0, true, "Radio", ("Your " + (pc.hasStatusEffect("Varmint Buddy") ? "varmint" : "drone") + " is targeting..."), true, 0, 0xFFFFFF);
				}
			}
			
			var bOff:int = 0;
			if(_hostiles.length > 1)
			{
				for (var i:int = 0; i < _hostiles.length; i++)
				{
					if (!_hostiles[i].isDefeated())
					{
						if(_hostiles[i] == pc.droneTarget && pc.hasStatusEffect("Drone Targeting")) addDisabledButton(bOff, (_hostiles[i] as Creature).buttonText, StringUtil.toDisplayCase((_hostiles[i] as Creature).getCombatName()), ("Already targeting " + (_hostiles[i] as Creature).getCombatName() + "."));
						else addButton(bOff, (_hostiles[i] as Creature).buttonText, selectDroneTargetSpecial, (_hostiles[i] as Creature), StringUtil.toDisplayCase((_hostiles[i] as Creature).getCombatName()), ("Target " + (_hostiles[i] as Creature).getCombatName() + "."));
						bOff++;
					}
					else if(pc.statusEffectv1("Drone Targeting") > 0 && _hostiles[i] == pc.droneTarget)
					{
						pc.droneTarget = null;
						pc.setStatusValue("Drone Targeting", 1, -1);
					}
				}
				if(!pc.hasStatusEffect("Drone Targeting")) addDisabledButton(12, "Auto", "Automatic", "Targeting is set to automatic.");
				else addButton(12, "Auto", selectDroneTargetAuto, undefined, "Automatic", "Automatically select the best target.");
				if(pc.statusEffectv1("Drone Targeting") < 0 || pc.droneTarget == null) addDisabledButton(13, "None", "No Target", "Currently not targeting anything.");
				else addButton(13, "None", selectDroneTargetSpecial, undefined, "No Target", "Don’t target anything.");
			}
			else
			{
				if(!pc.hasStatusEffect("Drone Targeting")) addDisabledButton(0, "Target", "Target", "Currently targeting enemy.");
				else addButton(0, "Target", selectDroneTargetAuto, undefined, "Target", "Target the enemy.");
				if(pc.statusEffectv1("Drone Targeting") < 0 || pc.droneTarget == null) addDisabledButton(1, "Withdraw", "No Target", "Currently not targeting enemy.");
				else addButton(1, "Withdraw", selectDroneTargetSpecial, undefined, "No Target", "Don’t target enemy.");
			}
			
			addButton(14, "Back", generateSpecialsMenu);
		}
		private function selectDroneTargetSpecial(target:Creature = null):void
		{
			if(!pc.hasStatusEffect("Drone Targeting")) 
			{
				//pc.createStatusEffect("Drone Targeting", 0, 0, 0, 0, true, "Radio", ("Your " + (pc.hasStatusEffect("Varmint Buddy") ? "varmint" : "drone") + " is targeting..."), true, 0, 0xFFFFFF);
				if(pc.accessory is KordiiakLeash) pc.createStatusEffect("Drone Targeting", 0, 0, 0, 0, true, "Radio", ("Your kor’diiak is targeting..."), true, 0, 0xFFFFFF);
				else if(pc.accessory is ShoulderGrunchLeash) pc.createStatusEffect("Drone Targeting", 0, 0, 0, 0, true, "Radio", ("Your pet is targeting..."), true, 0, 0xFFFFFF);
				else pc.createStatusEffect("Drone Targeting", 0, 0, 0, 0, true, "Radio", ("Your " + (pc.hasStatusEffect("Varmint Buddy") ? "varmint" : "drone") + " is targeting..."), true, 0, 0xFFFFFF);
			}
			else
			{
				if(target == null) pc.setStatusValue("Drone Targeting", 1, -1);
				else pc.setStatusValue("Drone Targeting", 1, 1);
			}
			pc.droneTarget = target;
			selectDroneTarget();
		}
		private function selectDroneTargetAuto():void
		{
			pc.removeStatusEffect("Drone Targeting");
			pc.droneTarget = CombatAttacks.GetBestPotentialTarget(_hostiles);
			selectDroneTarget();
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
			
			addButton(14, "Back", generateCombatMenu, true);
		}
		
		private function executeAttack(opts:Object):void
		{
			clearOutput();
			clearMenu();
			
			if (opts.tar is CrystalGooT1 && (opts.tar as CrystalGooT1).ShouldIntercept(opts.attack.GetAttackTypeFlags()))
			{
				(opts.tar as CrystalGooT1).SneakSqueezeAttackReaction(opts.attack.GetAttackTypeFlags());
			}
			else if (opts.tar is CrystalGooT2 && (opts.tar as CrystalGooT2).ShouldIntercept(opts.attack.GetAttackTypeFlags()))
			{
				(opts.tar as CrystalGooT2).SpecialAction(opts.attack.GetAttackTypeFlags());
			}
			else
			{
				opts.attack.execute(_friendlies, _hostiles, pc, opts.tar);
			}
			
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
					addButton(bOff, (_hostiles[i] as Creature).buttonText, function(in_opts:Object, in_target:Creature):Function {
						return function():void {
							in_opts.tar = in_target;
							executeSimpleAttack(in_opts);
						}
					}(attackOpts, _hostiles[i]));
					
					bOff++;
				}
			}
			
			addButton(14, "Back", generateCombatMenu, true);
		}
		
		private function executeSimpleAttack(opts:Object):void
		{
			clearOutput();
			clearMenu();
			
			kGAMECLASS.setTarget(opts.tar);
			kGAMECLASS.setAttacker(pc);
			kGAMECLASS.setEnemy(opts.tar);
			
			if (opts.func != generateTeaseMenu && opts.tar is CrystalGooT1 && (opts.tar as CrystalGooT1).ShouldIntercept(opts))
			{
				(opts.tar as CrystalGooT1).SneakSqueezeAttackReaction(opts);
			}
			else if (opts.func != generateTeaseMenu && opts.tar is CrystalGooT2 && (opts.tar as CrystalGooT2).ShouldIntercept(opts))
			{
				(opts.tar as CrystalGooT2).SpecialAction(opts);
			}
			else
			{
				opts.func(pc, opts.tar);
			}
			
			// Hacky workaround to defer process combat for special cases.
			if (opts.func != generateTeaseMenu)
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
			if(pc.hasStatusEffect("Blinded") || target.isInvisible())
			{
				clearOutput();
				output("You can try to tease your foe" + (target.isPlural ? "s" : "") + " into submission...");
				output("\n<b>Unfortunately, you can’t see the enemy clearly enough to do that!</b>");
				
				clearMenu();
				addButton(14, "Back", showCombatMenu);
				return;
			}
	
			clearOutput();
			output("Which tease will you use?");
			
			var teases:Array = [
				Math.min((flags["TIMES_BUTT_TEASED"] == undefined ? 0 : flags["TIMES_BUTT_TEASED"]), 100),
				Math.min((flags["TIMES_CHEST_TEASED"] == undefined ? 0 : flags["TIMES_CHEST_TEASED"]), 100),
				Math.min((flags["TIMES_CROTCH_TEASED"] == undefined ? 0 : flags["TIMES_CROTCH_TEASED"]), 100),
				Math.min((flags["TIMES_HIPS_TEASED"] == undefined ? 0 : flags["TIMES_HIPS_TEASED"]), 100),
				Math.min((flags["TIMES_ORAL_TEASED"] == undefined ? 0 : flags["TIMES_ORAL_TEASED"]), 100),
			];
			var i:int = 0;
			
			output("\nAss tease skill: " + teases[0] + "/100");
			output("\nChest tease skill: " + teases[1] + "/100");
			output("\nCrotch tease skill: " + teases[2] + "/100");
			output("\nHips tease skill: " + teases[3] + "/100");
			output("\nOral tease skill: " + teases[4] + "/100");
			
			output("\n\nYour ability at a tease can increase both its success rate and total damage.");
			
			var teaseList:Array = [];
			var btnSlot:int = 0;
			var backTooltip:String = "Back out. Recommended if you haven’t yet used “Sense” to determine your foe’s likes and dislikes. Remember you can pull up your appearance screen in combat or use the scene buffer buttons in the lower left corner to compare yourself to your foe’s preferences!";
			
			// Basic Teases
			teaseList.push(["Ass", teaseButt, target, "Ass Tease", "Use your [pc.butt] to tease your enemy."]);
			teaseList.push(["Chest", teaseChest, target, "Chest Tease", "Use your [pc.chest] to tease your enemy."]);
			if (pc.hasGenitals()) teaseList.push(["Crotch", teaseCrotch, target, "Crotch Tease", "Use your [pc.crotch] to tease your enemy."]);
			else teaseList.push(["Crotch", null, null, "Crotch Tease", "You’ll need crotch-based genitals to do this."]);
			teaseList.push(["Hips", teaseHips, target, "Hips Tease", "Use your [pc.hips] to tease your enemy."]);
			// 9999 teaseList.push(["Oral", teaseOral, target, "Oral Tease", "Use your [pc.lips] to tease your enemy."]);
			
			// Milk Squirt
			if (pc.canMilkSquirt())
				teaseList.push(["Milk Squirt", teaseSquirt, target, "Milk Squirt", "Spray the enemy with your [pc.milk], arousing " + target.getCombatPronoun("o") + "."]);
			else if (InCollection(pc.milkType, GLOBAL.FLUID_TYPE_VANAE_MAIDEN_MILK, GLOBAL.FLUID_TYPE_VANAE_HUNTRESS_MILK) || pc.isMilkTank())
				teaseList.push(["Milk Squirt", null, null, "Milk Squirt", "You do not currently have enough [pc.milkNoun] available to squirt any."]);
			
			// Dick Slap
			if(pc.biggestCockLength() >= 12 && pc.hasCockFlag(GLOBAL.FLAG_APHRODISIAC_LACED, pc.biggestCockIndex())) {
				if(!pc.hasFlightEffects() && target.hasFlightEffects()) teaseList.push(["Dick Slap", null, null, "Dick Slap", "Your enemy is flying and you cannot reach " + target.getCombatPronoun("o") + " for a slap."]);
				else teaseList.push(["Dick Slap", dickslap, target, "Dick Slap", "Slap the enemy with your aphrodisiac-coated dick."]);
			}
			
			// Myr Venom
			if (pc.hasPerk("Myr Venom") && target.isLustImmune == false) {
				if(!pc.hasFlightEffects() && target.hasFlightEffects()) teaseList.push(["Myr Venom", null, null, "Myr Venom Bite", "Your enemy is flying and you cannot reach " + target.getCombatPronoun("o") + " for a bite."]);
				else teaseList.push(["Myr Venom", myrVenomBite, target, "Myr Venom Bite", "Bite the enemy and inject " + target.getCombatPronoun("o") + " with your red myr venom."]);
			}
			
			clearMenu();
			for(i = 0; i < teaseList.length; i++)
			{
				if(btnSlot >= 14 && (btnSlot + 1) % 15 == 0)
				{
					addButton(btnSlot, "Back", showCombatMenu, undefined, "Back", backTooltip);
					btnSlot++;
				}
				
				if(teaseList[i][1] != null) addButton(btnSlot, teaseList[i][0], teaseList[i][1], teaseList[i][2], teaseList[i][3], teaseList[i][4]);
				else addDisabledButton(btnSlot, teaseList[i][0], teaseList[i][3], teaseList[i][4]);
				btnSlot++;
				
				if(teaseList.length > 14 && (i + 1) == teaseList.length)
				{
					while((btnSlot + 1) % 15 != 0) { btnSlot++; }
					addButton(btnSlot, "Back", showCombatMenu, undefined, "Back", backTooltip);
				}
			}
			addButton(14, "Back", showCombatMenu, undefined, "Back", backTooltip);
		}
		public function globalTeaseAdjustments(target:Creature):Array
		{
			var likeAdjustments:Array = new Array();
			//Masc/Fem
			if(pc.femininity > 50 && target.sexualPreferences.getPref(GLOBAL.SEXPREF_FEMININE) > 0)
				likeAdjustments[likeAdjustments.length] = target.sexualPreferences.getPref(GLOBAL.SEXPREF_FEMININE);
			if(pc.femininity <= 50 && target.sexualPreferences.getPref(GLOBAL.SEXPREF_MASCULINE) > 0)
				likeAdjustments[likeAdjustments.length] = target.sexualPreferences.getPref(GLOBAL.SEXPREF_MASCULINE);
			//Hair or lack thereof!
			if(!pc.hasHair() && target.sexualPreferences.getPref(GLOBAL.SEXPREF_BALDNESS) > 0)
				likeAdjustments[likeAdjustments.length] = target.sexualPreferences.getPref(GLOBAL.SEXPREF_BALDNESS);
			if(pc.hasHair() && pc.hairLength >= 8 && target.sexualPreferences.getPref(GLOBAL.SEXPREF_LONG_HAIR) > 0)
				likeAdjustments[likeAdjustments.length] = target.sexualPreferences.getPref(GLOBAL.SEXPREF_LONG_HAIR);
			//Coatings:
			if(pc.hasStatusEffect("Sweaty") && target.sexualPreferences.getPref(GLOBAL.SEXPREF_SWEAT) > 0)
				likeAdjustments[likeAdjustments.length] = target.sexualPreferences.getPref(GLOBAL.SEXPREF_SWEAT);
			if((pc.hasStatusEffect("Cum Soaked") || pc.hasStatusEffect("Pussy Drenched")) && target.sexualPreferences.getPref(GLOBAL.SEXPREF_CUMMY) > 0)
				likeAdjustments[likeAdjustments.length] = target.sexualPreferences.getPref(GLOBAL.SEXPREF_CUMMY);
			//Shit 4chan hates:
			if(pc.hasFur() && target.sexualPreferences.getPref(GLOBAL.SEXPREF_FURRIES) > 0)
				likeAdjustments[likeAdjustments.length] = target.sexualPreferences.getPref(GLOBAL.SEXPREF_FURRIES);
			if(pc.hasScales() && target.sexualPreferences.getPref(GLOBAL.SEXPREF_SCALIES) > 0)
				likeAdjustments[likeAdjustments.length] = target.sexualPreferences.getPref(GLOBAL.SEXPREF_SCALIES);
			if(pc.hasFeathers() && target.sexualPreferences.getPref(GLOBAL.SEXPREF_FEATHERS) > 0)
				likeAdjustments[likeAdjustments.length] = target.sexualPreferences.getPref(GLOBAL.SEXPREF_FEATHERS);
			if(pc.hasChitin() && target.sexualPreferences.getPref(GLOBAL.SEXPREF_CHITIN) > 0)
				likeAdjustments[likeAdjustments.length] = target.sexualPreferences.getPref(GLOBAL.SEXPREF_CHITIN);
			return likeAdjustments;
		}
		
		private function teaseButt(target:Creature):void
		{
			var teaseCount:Number = 0;
			var likeAdjustments:Array = new Array();
			
			//Get tease count updated
			teaseCount = Math.min((flags["TIMES_BUTT_TEASED"] == undefined ? 0 : flags["TIMES_BUTT_TEASED"]), 100);
			
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
			//Global adjustments for things like fur, sweat, cum-covered, etc.
			likeAdjustments.concat(globalTeaseAdjustments(target));

			clearOutput();
			
			buttTeaseText(target);
			applyTeaseDamage(pc, target, teaseCount, "BUTT", likeAdjustments);
			
			if (target is CrystalGooT1 && (target as CrystalGooT1).ShouldIntercept({ isTease: true }))
			{
				(target as CrystalGooT1).SneakSqueezeAttackReaction( { isTease: true } );
			}
			else if (target is CrystalGooT2 && (target as CrystalGooT2).ShouldIntercept( { isTease: true } ))
			{
				(target as CrystalGooT2).SpecialAction( { isTease: true } );
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
			if(!pc.isCrotchExposed() && pc.hasCock() && (pc.balls == 0 || pc.hasStatusEffect("Uniball")) && !pc.hasVagina() && pc.femininity >= 60) choices.push(8);
			if(pc.hasVagina() && pc.wettestVaginalWetness() >= 3) choices.push(9);

			//pick our winner!
			var select:int = choices[rand(choices.length)];

			//75+
			if(select == 0)
			{
				output("Turning away at an opportune moment, you slip down your clothes and reach back, slapping your [pc.butt] into a bounce before shaking it for " + target.getCombatName() + ". Your technique has grown impeccable, and you bounce your [pc.butt] masterfully, even reaching back and spreading your cheeks, giving " + target.getCombatName() + " an excellent view of your ");
				kGAMECLASS.clearList();
				kGAMECLASS.addToList("[pc.asshole]");
				if(pc.hasVagina()) kGAMECLASS.addToList("[pc.vaginas]");
				if(pc.balls > 0) kGAMECLASS.addToList("[pc.balls]");
				output(kGAMECLASS.formatList() + ".");
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
				output("and tempting " + target.getCombatName() + " with your ");
				if(pc.lowerUndergarment.shortName != "") output("unseen ");
				output("goods. Your ass shaking has gotten faster and more tasteful with all of that practice, and you rock your [pc.butt] as best as you can to show that off.");
			}
			else if(select == 2)
			{
				output("You quickly");
				if(pc.hasArmor() && !pc.isCrotchExposed()) output(" strip out of your [pc.armor] and");
				output(" turn around, giving your [pc.butt] a hard slap and showing your enemy the real prize: your [pc.asshole]. With a smirk, you easily plunge your hand inside, burying yourself up to the wrist inside your anus. You give yourself a quick fisting, watching the enemy over your shoulder while you moan lustily, being sure to give " + target.getCombatName() + " a good show. You withdraw your hand and give your ass another sexy spank before readying for combat again.");
			}
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
				else output(" just enough to reveal a bit of the interior. You take it slow on opening your tailcunt the rest of the way, until you can use two fingers to hold the dripping entrance open, leaving your other hand free to run its fingers over the exotic folds, pressing in just enough to show your foe how slippery soft your tailpussy really is.");
			}
			//Reqs: PC has a cock-tail
			else if(select == 7)
			{
				output("You curl your [pc.cockTail] around to flex it back and forth a bit in front of your foe, showing off the alien endowment you’ve picked up. You arrange your tail into a spiral shape and then piston it sharply like a coiled spring, making a loud snapping sound from the force of it striking the air.");
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
				if(!pc.isCrotchExposed()) output("You open your [pc.lowerGarments] as you");
				else output("You");
				output(" turn and bend over to show off your [pc.butt]");
				if(pc.hasCock()) output(", [pc.cocks],");
				output(" and [pc.vaginas]");
				output(", though your attention goes to the last. You’re practically dripping by this point, as you slowly rub your index finger across the cleft of ");
				if(pc.totalVaginas() > 1) output("one cunny");
				else output("your cunny");
				output(" and stick your thumb inside your [pc.asshole], beginning to lightly finger your backdoor. You pull your fingers away");
				if(!pc.isCrotchExposed()) output(" and slide your [pc.lowerGarments] back into place");
				output(", looking over your shoulder at your foe seductively.");
			}
			else if(select == 3) {
				output("You turn away");
				if(!pc.isCrotchExposed()) output(", slide down your clothing,");
				output(" and bounce your [pc.butt] up and down hypnotically");
				//Big butts = extra text + higher success
				if(pc.buttRating() >= 10) {
					output(", making it jiggle delightfully. Your target even gets a few glimpses of the [pc.asshole] between your cheeks.");
				}
				//Small butts = less damage, still high success
				else {
					output(", letting your target get a good look at your [pc.asshole]");
					if(pc.hasVagina()) output(" and a glimpse of your [pc.vaginas]");
					output(".");
				}
			}
			
			if(pc.hasStatusEffect("Thicc&Shake")) output(ThiccNShake.teaseCheck(pc, false));
		}

		private function teaseChest(target:Creature):void
		{
			var teaseCount:Number = 0;
			var likeAdjustments:Array = new Array();
			
			//Get tease count updated
			teaseCount = Math.min((flags["TIMES_CHEST_TEASED"] == undefined ? 0 : flags["TIMES_CHEST_TEASED"]), 100);
			
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
			//Global adjustments for things like fur, sweat, cum-covered, etc.
			likeAdjustments.concat(globalTeaseAdjustments(target));

			clearOutput();
			
			chestTeaseText(target);
			applyTeaseDamage(pc, target, teaseCount, "CHEST", likeAdjustments);
				
			if (target is CrystalGooT1 && (target as CrystalGooT1).ShouldIntercept({ isTease: true }))
			{
				(target as CrystalGooT1).SneakSqueezeAttackReaction( { isTease: true } );
			}
			else if (target is CrystalGooT2 && (target as CrystalGooT2).ShouldIntercept( { isTease: true } ))
			{
				(target as CrystalGooT2).SpecialAction( { isTease: true } );
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
					if(!pc.isChestExposed()) output("Shedding your [pc.upperGarments], you");
					else output("You");
					output(" flex your arms, showing off the bulging biceps. After a bit of posing");
					output(" you slap your chest with one hand, producing a loud crack of muscle on muscle as your palm meets your iron-hard pectoral.");
					output(" After a good few seconds of showing off,");
					if(!pc.isChestExposed()) output(" you close your [pc.upperGarments] and");
					else output(" you cease your posing and");
					output(" return your gaze to the fight.");
				}
				//if pc is wearing harness upper undergarment
				else if(rand(1) == 0 && pc.upperUndergarment is Harness) 
				{ 
					if(!pc.isChestExposed()) output("You tear off your [pc.armor] and reveal");
					else output("You throw your arms wide to present");
					output(" your chest, the harness tight around your [pc.chest]. You flex and stretch in the harness, showing how it constrains you. You flaunt your");
					output(pc.mf(" masculinity", " femininity") + " a short while longer before covering up.");
				}
				else if(!pc.isChestExposed()) output("You peel open your [pc.upperGarments] to expose your [pc.chest] and [pc.nipples], running a hand up your [pc.skinFurScales] to one as you lock eyes with your target. You make sure that every bit of your musculature is open and on display before you bother to cover back up.");
				else output("Naked as you are, there’s nothing you need to do to expose your [pc.chest] and [pc.nipples], and running a hand up your [pc.skinFurScales] only enhances the delicious exposure. You make sure that every bit of your musculature is open and on display before you adopt a less sensual pose.")
			}
			//Titties!
			else 
			{
				var choices:Array = new Array();
				if(pc.milkFullness > 50 && !pc.isChestExposed()) 
				{
					choices.push(0);
					choices.push(0);
					choices.push(0);
				}
				choices.push(1);
				//Reqs: PC is wearing clothes but no bra, PC’s biggest breast row is at least a D-cup
				if(pc.isChestGarbed() && !pc.hasUpperGarment() && pc.biggestTitSize() >= 4) choices.push(2);
				//Reqs: PC is wearing something covering their top, has at least as many prehensile tails as nips
				if(!pc.isChestExposed() && pc.tailCount >= pc.totalNipples()) choices.push(3);
				//Reqs: PC has very high tone
				if(pc.tone >= 70) choices.push(4);
				//Reqs: PC is wearing Harness upper undergarment
				if(pc.upperUndergarment is Harness) choices.push(5);

				//pick our winner!
				var select:int = choices[rand(choices.length)];

				//User submitted milkiness! 75%!
				if(select == 0)
				{
					//If Breasts Tease >=75 Lactating.
					if(pc.milkFullness >= 75)
					{
						output("Drawing your hands sensuously up your [pc.belly], you cup your milky tits, giving one a firm squeeze as you let out a low, lusty moan. With " + possessive(target.getCombatName()) + " gaze firmly captured, you pull away your [pc.upperGarments], releasing your [pc.fullChest] to the world, the fresh air blowing across your [pc.nipples]. You aren’t done teasing yet; a delicious idea slips into your devious mind.");
						output("\n\nGrabbing both of your exposed melons, you jiggle them, causing a hypnotizing earthquake of mammary delight while taking care to pinch your nipples. The stimulation is just enough to get you started. Your [pc.milk] flows out as you begin to rub it into your [pc.skinFurScales], the [pc.milkColor] liquid soaking into your [pc.chest]. It takes you a tremendous effort to stop yourself and cover your jugs up again. Licking your fingers clean with an <i>“Mmmmm...”</i> for show, you ready yourself, noting that you’ll have to clean up a little later.");
					}
					//If Breast tease <75 Lactating.
					else
					{
						output("Fumbling with your [pc.upperGarments] you release your [pc.chest], letting your bounty free with an enticing jiggle. You can feel " + possessive(target.getCombatName()) + " eyes on you, running over your [pc.chest], and you take advantage of that, swaying your shoulders to set off all kinds of pleasant jiggles. It’s not until you feel your [pc.milk] start to dribble out of your [pc.nipples] that you realize just what you’ve done. Reaching up, you grab the swells of your [pc.chest] to put them away, but you only succeed in coating yourself in your [pc.milk]. You can’t help but feel a little embarrassed and maybe a little aroused as you tuck your [pc.fullChest] away.");
					}
				}
				else if(select == 1)
				{
					//HYPER TIIIIITS
					if(pc.biggestTitSize() >= 15) {
						if(!pc.isChestExposed()) output("With a slow pivot and sultry look, you reach up to your [pc.upperGarments] and peel away the offending coverings with deliberate slowness. With each inch of breast-flesh you expose, your smile grows wider. You pause above your [pc.nipples] before letting them out with a flourish, digging your hands in to your soft, incredibly well-endowed chest in a display of mammary superiority. You cover up after a moment with a knowing smile.");
						else output("Your [pc.fullChest] is already completely uncovered, but that doesn’t stop you from bringing your hands up to the more-than-ample cleavage and enhancing it by pressing down from each side. Your fingers sink deeply into your busty bosom as you look up at your chosen target, then, with a smile, you gentle shake them, making your titanic mammaries wobble oh-so-enticingly.")
						if(pc.biggestTitSize() >= 25) output(" There’s just so much breastflesh there; it feels good to use it.");
					}
					//Big TiTS!
					else if(pc.biggestTitSize() >= 4) {
						if(!pc.isChestExposed()) output("You peel away your [pc.upperGarments] with careful, slow tugs to expose your [pc.fullChest]. Only after you’ve put yourself on display do you look back at your target and truly begin to tease, starting with a knowing wink. Then, you grab hold of your [pc.chest] and cup them to enhance your cleavage, lifting one then the other in a slow, sensuous display. Covering them up is something you do a little a regretfully.");
						else output("You delicately trace a finger up your [pc.belly] to your exposed cleavage, slowing as it nestles in place. Your motion causes your breasts to gently sway as you explore yourself, and you pause to look at your target. With one hand, you squeeze your left tit, crushing your other hand’s finger into it while you grope yourself. With your erotic display complete, you release yourself and stretch, glad to be uncovered.");
					}
					//Petite ones!
					else {
						if(!pc.isChestExposed()) output("You remove your [pc.upperGarments] with ease to free the perfectly rounded, perky breasts. You run your hands across the [pc.skinFurScales] to thumb at your nipples and grace your target with a lascivious look before putting the girls away a little regretfully.");
						else output("With your [pc.fullChest] on complete display, you arch your back to present yourself as pleasingly as possible. Your hands wind their way up to your [pc.nipples] and give them a little tweak, sliding down the supple curve of your underbust. You give your target a smile before you stop, but even now, your bared [pc.skinFurScales] will taunt " + target.getCombatPronoun("himher") + ".");
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
					if(!pc.isChestExposed()) output("Shedding your [pc.upperGarments], you");
					else output("You");
					output(" flex your arms, showing off the bulging biceps. After a bit of posing");
					if(pc.biggestTitSize() < 1) output(" you slap your chest with one hand, producing a loud crack of muscle on muscle as your palm meets your iron-hard pectoral.");
					else if(pc.biggestTitSize() <= 3) output(" you stretch to show off your sleek chest, turning your upper body so they can see the way your breasts fit the form of your highly-toned physique.");
					else output(" you give one of your breasts a grope, showing off how you’re every bit as curvy as a girl without your incredible musculature.");
					output(" After a good few seconds of showing off,");
					if(!pc.isChestExposed()) output(" you close your [pc.upperGarments] and");
					else output(" you cease your posing and");
					output(" return your gaze to the fight.");
				}
				//Reqs: PC is wearing Harness upper undergarment
				else if (select == 5)
				{
					if(!pc.isChestExposed()) output("You tear off your [pc.armor] and reveal");
					else output("You throw your arms wide to present");
					output(" your chest, the harness tight around your [pc.chest]. You flex and stretch in the harness, showing how it constrains you. You flaunt your");
					output(pc.mf(" masculinity", " femininity") + " a short while longer before covering up.");
				}
			}
		}

		private function teaseHips(target:Creature):void
		{
			var teaseCount:Number = 0;
			var likeAdjustments:Array = new Array();
			
			//Get tease count updated
			teaseCount = Math.min((flags["TIMES_HIPS_TEASED"] == undefined ? 0 : flags["TIMES_HIPS_TEASED"]), 100);
			
			if(pc.hipRating() >= 10 && target.sexualPreferences.getPref(GLOBAL.SEXPREF_WIDE_HIPS) > 0)
				likeAdjustments[likeAdjustments.length] = target.sexualPreferences.getPref(GLOBAL.SEXPREF_WIDE_HIPS);
			if(pc.hipRating() < 4 && target.sexualPreferences.getPref(GLOBAL.SEXPREF_NARROW_HIPS) > 0)
				likeAdjustments[likeAdjustments.length] = target.sexualPreferences.getPref(GLOBAL.SEXPREF_NARROW_HIPS);
			if((pc.isTaur() || pc.isNaga() || pc.isGoo()) && target.sexualPreferences.getPref(GLOBAL.SEXPREF_EXOTIC_BODYSHAPE) > 0) 
				likeAdjustments[likeAdjustments.length] = target.sexualPreferences.getPref(GLOBAL.SEXPREF_EXOTIC_BODYSHAPE);
			//Global adjustments for things like fur, sweat, cum-covered, etc.
			likeAdjustments.concat(globalTeaseAdjustments(target));

			clearOutput();
			
			hipsTeaseText(target);
			applyTeaseDamage(pc, target, teaseCount, "HIPS", likeAdjustments);
			
			if (target is CrystalGooT1 && (target as CrystalGooT1).ShouldIntercept({ isTease: true }))
			{
				(target as CrystalGooT1).SneakSqueezeAttackReaction( { isTease: true } );
			}
			else if (target is CrystalGooT2 && (target as CrystalGooT2).ShouldIntercept( { isTease: true } ))
			{
				(target as CrystalGooT2).SpecialAction( { isTease: true } );
			}

			processCombat();
		}
		public function hipsTeaseText(target:Creature):void 
		{
			var msg:String = "";
			var choices:Array = new Array();

			if(pc.hipRating() < 4) choices.push(0);
			else if(pc.hipRating() >= 10) choices.push(1);
			else choices.push(2);
			//Reqs: PC has a naga tail
			if(pc.isNaga()) choices.push(3);
			//Reqs: PC is in combat with a naleen, PC has a naga tail
			if(target.originalRace == "naleen" && pc.isNaga()) choices.push(4);
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
				var isNaleen:Boolean = (pc.raceShort() == "naleen");
				msg = "You slither towards the ";
				if(isNaleen) msg += "other ";
				msg += "naleen, idly swaying your [pc.hips] to show off your tail.";
				//PC’s original race is not some sort of naga that may be introduced in the future:
				msg += " <i>“I used to have spindly little legs, you know.”</i>";
				//PC’s original race is some sort of naga: msg += " <i>“Plenty of other races out there have spindly little legs they have to move around on.”</i>";
				msg += " You offer a smirk of superiority as you slither in a circle around your foe, your tail leaving a trail in the brush where it passes. <i>“This is </i>much<i> better, don’t you agree?";
				if(!isNaleen) msg += " I may not be a naleen, but I can still appreciate a strong, </i>thick<i> snake tail like mine... or yours.";
				else msg += " Becoming a naleen’s given me an appreciation for big, long tails like this one... or like yours.";
				msg += "”</i> You let your tailtip brush over some of your foe’s length before you pull away, allowing " + target.getCombatPronoun("himher") + " a brief view of your backside and your tail curling up to support you as you resume the fight.";
				output(msg);
			}
			//Reqs: Hips skill 75+
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
				output(" before drawing your hands up over your head. You start in on rocking your [pc.hips], treating your foe to a dance");
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
			
			if(pc.hasStatusEffect("Thicc&Shake")) output(ThiccNShake.teaseCheck(pc, true));
		}
		
		private function teaseCrotch(target:Creature):void
		{
			var teaseCount:Number = 0;
			var likeAdjustments:Array = new Array();
			
			//Get tease count updated
			teaseCount = Math.min((flags["TIMES_CROTCH_TEASED"] == undefined ? 0 : flags["TIMES_CROTCH_TEASED"]), 100);
			
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
			if((pc.hasCock() && pc.longestCockLength() >= 18) && target.sexualPreferences.getPref(GLOBAL.SEXPREF_HYPER) > 0) 
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
			//Global adjustments for things like fur, sweat, cum-covered, etc.
			likeAdjustments.concat(globalTeaseAdjustments(target));

			clearOutput();
			
			crotchTeaseText(target);
			applyTeaseDamage(pc, target, teaseCount, "CROTCH", likeAdjustments);
			
			if (target is CrystalGooT1 && (target as CrystalGooT1).ShouldIntercept({ isTease: true }))
			{
				(target as CrystalGooT1).SneakSqueezeAttackReaction( { isTease: true } );
			}
			else if (target is CrystalGooT2 && (target as CrystalGooT2).ShouldIntercept( { isTease: true } ))
			{
				(target as CrystalGooT2).SpecialAction( { isTease: true } );
			}
			processCombat();
		}
		//Reqs: PC has an aphrodisiac-laced cock big enough to slap
		//if(pc.biggestCockLength() >= 12 && pc.hasCockFlag(GLOBAL.FLAG_APHRODISIAC_LACED, pc.biggestCockIndex()) && rand(5) == 0)
		private function dickslap(target:Creature):void
		{
			var teaseCount:Number = 0;
			var likeAdjustments:Array = new Array();
			
			//Get tease count updated
			teaseCount = Math.min((flags["TIMES_CROTCH_TEASED"] == undefined ? 0 : flags["TIMES_CROTCH_TEASED"]), 100);
			
			if(pc.hasCock() && target.sexualPreferences.getPref(GLOBAL.SEXPREF_COCKS) > 0)
				likeAdjustments[likeAdjustments.length] = target.sexualPreferences.getPref(GLOBAL.SEXPREF_COCKS);
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
			if (pc.hasCock() && pc.hasVagina() && target.sexualPreferences.getPref(GLOBAL.SEXPREF_HERMAPHRODITE) > 0)
				likeAdjustments[likeAdjustments.length] = target.sexualPreferences.getPref(GLOBAL.SEXPREF_HERMAPHRODITE);
			//Global adjustments for things like fur, sweat, cum-covered, etc.
			likeAdjustments.concat(globalTeaseAdjustments(target));

			clearOutput();
			output("Smiling coyly, you run up to " + ((_hostiles.length == 1 && !target.isPlural) ? "your opponent" : target.getCombatName()) + " and knock " + target.getCombatPronoun("himher") + " down. Before " + target.getCombatPronoun("heshe") + " can react, you");
			if(!pc.isCrotchExposed())
			{
				output(" wrestle your cock out of your");
				if(pc.hasArmor() && !pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL) && !pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_GROIN)) output(" armor");
				else output(" clothes");
			}
			else output(" grab your dick");
			if(target.isPlural) output(" and use it to slap them across their faces a few times. You make sure that some of your aphrodisiac dick oil is smeared on them before jumping back to a safe distance.");
			else output(" and use it to slap " + target.mfn("him","her","it") + " across the face a few times. You make sure that some of your aphrodisiac dick oil is smeared on " + target.mfn("his","her","its") + " face before jumping back to a safe distance.");
			
			applyTeaseDamage(pc, target, teaseCount, "DICK SLAP", likeAdjustments);
			
			if (target is CrystalGooT1 && (target as CrystalGooT1).ShouldIntercept({ isTease: true }))
			{
				(target as CrystalGooT1).SneakSqueezeAttackReaction( { isTease: true } );
			}
			else if (target is CrystalGooT2 && (target as CrystalGooT2).ShouldIntercept( { isTease: true } ))
			{
				(target as CrystalGooT2).SpecialAction( { isTease: true } );
			}
			processCombat();
		}
		private function crotchTeaseText(target:Creature):void 
		{
			var msg:String = "";
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
				if(pc.isTaur() && (pc.hasVaginaType(GLOBAL.TYPE_EQUINE) || pc.hasVaginaType(GLOBAL.TYPE_LEITHAN))) choices[choices.length] = 5;
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
			if((target is ZilFemale || target is ZilMale || target is ZilPack) && pc.hasVaginaType(GLOBAL.TYPE_BEE)) choices.push(13);
			//Reqs: PC has at least 3 vaginal wetness
			if(pc.hasVagina() && pc.wettestVaginalWetness() >= 3) choices.push(14);
			//Reqs: PC is wearing harness upper undergarment + has cock
			if(pc.upperUndergarment is Harness && pc.hasCock()) choices.push(15);

			var select:int = choices[rand(choices.length)];
			//1 - dick!
			if(select == 1) {
				if(!pc.isCrotchExposed()) output("You open your [pc.lowerGarments] just enough to let ");
				else output("You shift position while ");
				output("your [pc.cocks]");
				if(pc.balls > 0) output(" and [pc.balls]");
				output(" dangle");
				if(pc.cockTotal() + pc.balls == 1) output("s");
				output(" free. ");
				if(pc.lust() >= 66) output("A shiny rope of pre-cum dangles from your cock, showing that your reproductive system is every bit as ready to pleasure as the rest of you.");
				else output("Your motions are just enough to make your equipment sway back and forth before your target’s eyes.")
			}
			//2 - covered dick!
			else if(select == 2) {
				output("You lean back and pump your hips at your target in an incredibly vulgar display. The bulging, barely-contained outline of your package presses hard into your [pc.lowerUndergarment]. This feels so crude, but at the same time, you know it’ll likely be effective.");
				output(" You go on like that, humping the air for your target’s benefit, trying to entice " + target.getCombatPronoun("himher") + " with your nearly-exposed meat.");
			}	
			//3 - cunt!
			else if(select == 3) {
				if(!pc.isCrotchExposed()) output("You coyly open your [pc.lowerGarments]");
				else output("You coyly gesture to your groin");
				if(pc.hasPerk("Ditz Speech")) output(" and giggle, <i>“Is this, like, what you wanted to see?”</i> ");
				else {
					msg = " and purr, <i>“Does the thought of a hot, ";
					if(pc.hasCock() && pc.hasVagina()) msg += "futanari ";
					else msg += "sexy ";
					msg += "body turn you on?”</i> ";
					output(msg);
				}
				if(target.isPlural) output(possessive(target.getCombatName()) + " gazes are riveted on your groin as you run your fingers up and down your folds seductively.");
				else output(possessive(target.getCombatName()) + " gaze is riveted on your groin as you run your fingers up and down your folds seductively.");
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
				output("You let out a bestial whinny and stomp your [pc.feet] at your enemy. They prepare for an attack, but instead you kick your front [pc.feet] off the ground, revealing the hefty horsecock hanging beneath your belly. You let it flop around, quickly getting rigid and to its full erect length. You buck your hips as if you were fucking a mare in heat, letting your opponent know just what’s in store for " + target.getCombatPronoun("himher") + " if " + target.getCombatPronoun("heshe") + " surrender" + (!target.isPlural ? "s" : "") + " to pleasure...");
			}
			//5 Cunt grind tease
			else if(select == 5) {
				output("You gallop toward your unsuspecting enemy, dodging " + target.getCombatPronoun("hisher") + " defenses and knocking " + target.getCombatPronoun("himher") + " to the ground. Before " + target.getCombatPronoun("heshe") + " can recover, you slam your massive centaur ass down upon " + target.getCombatPronoun("himher") + ", stopping just short of using crushing force to pin " + target.getCombatPronoun("himher") + " underneath you. In this position, your opponent’s face is buried right in your girthy horsecunt. You grind your cunt into your target’s face for a moment before standing. When you do, you’re gratified to see your enemy covered in your lubricant and smelling powerfully of horsecunt.");
			}
			//Reqs: PC has at least 3 vaginal wetness
			else if(select == 14)
			{
				//PC has clothes or a lower undergarment on: 
				if(!pc.isCrotchExposed()) output("You open your [pc.lowerGarments] to reveal");
				else output("You direct your foe’s attention to");
				output(" [pc.oneVagina], already dripping wet. A brush of your fingers across your folds leaves them glistening with [pc.girlCumVisc] fluid, and you give your target a grin before popping your fingers into your mouth, working your [pc.tongue] around the intruding digits to lick up every last [pc.girlCumFlavor] drop.");
				if ((pc.armor.shortName == "" && pc.lowerUndergarment.shortName != "") || (pc.armor.shortName != "" && pc.lowerUndergarment.shortName == ""))
				{
					output(" You close back up your [pc.lowerGarments], a drip of [pc.girlCum] leaving a dark stain");
					if (pc.legCount > 1) output(" between your legs.");
					else output(" on your crotch.");
				}
				//PC has both undergarments and clothes:
				else if (!pc.isCrotchExposed()) output(" You close back up your [pc.lowerGarments], flushing slightly at the sensation of the fluid trapped within your [pc.lowerGarment].");
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
				if(!pc.isCrotchExposed()) output("You slip off your [pc.lowerGarments]");
				else output("You only need to face your [pc.crotch] towards your enemy");
				output(" and cock your hips to one side, letting the [pc.girlCum] gushing from between your thighs speak for itself. You casually drop a hand to between your [pc.thighs] and sample a bit of the river, popping your fingers into your mouth to savor the [pc.girlCumFlavor] treat.");
				//Skill 50+:
				if(flags["TIMES_CROTCH_TEASED"] > 50) output(" You dip your fingers into the [pc.girlCumNoun] again, this time holding out your fingers towards your foe invitingly before again licking yourself clean. <i>“Imagine what it’s like when I’m actually cumming.”</i>");
				output(" You give your foe a heady grin as you ");
				if(!pc.isCrotchExposed()) output("pull your [pc.lowerGarments] back up, producing a wet sound as your endless flow is plugged back up - for now.");
				else output("return your attention to the fight, [pc.girlCumColor] still streaming freely down your [pc.legOrLegs].");
			}
			//Reqs: PC has a cock with a knot
			else if(select == 7)
			{
				//Clothed: 
				if(!pc.isCrotchExposed()) output("You open your [pc.lowerGarments]");
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
				if(!pc.isCrotchExposed())
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
				if(!pc.isCrotchExposed()) output("you close up your [pc.lowerGarments]");
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
				if(!pc.isCrotchExposed()) output("You open your [pc.lowerGarments] and");
				else output("You");
				output(" draw attention to [pc.oneCock], your flare already getting nice and wide. Your finger traces around the edge and underside of the thick ring, before coming up and over to brush the [pc.cockHead " + temp + "] above it. A bit of [pc.cum] comes away with your fingertip, showing off just how ready your flare is to be plunged inside the nearest willing hole... if they can take it. The thought of it makes you smirk as you ");
				if(!pc.isCrotchExposed()) output("cover up");
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
				if(!pc.isCrotchExposed()) output("As your [pc.lowerGarments] come away from");
				else output("As you draw your foe’s attention to");
				output(" your [pc.cocks], you opt to focus on a different part of your shaft from the usual. Your hand goes up to your [pc.cockHead " + temp + "], but soon slides halfway down your shaft to the masculine ring wrapped around the center of your dick. Your finger traces around its edge, pressing inward just enough to showcase the slightly spongy texture of your all-natural ribbing. You pull your hand away");
				if(!pc.isCrotchExposed()) output(" and cover up.");
				else output(" and let your cock relax.");
			}
			//Reqs: PC has a dick, PC has extremely high cum volume
			else if(select == 11)
			{
				//Clothed:
				if(!pc.isCrotchExposed()) output("You open your [pc.lowerGarments]");
				else output("You direct your foe’s attention to between your thighs");
				if(pc.hasSheath(0)) output(" and let [pc.oneCock] out of its sheath");
				else if(pc.hasStatusEffect("Genital Slit")) output(" and let [pc.oneCock] slip out of your genital slit");
				output(", a little bit of pre-cum already bubbling from your [pc.cockHead]. You give yourself a light handjob, enough to make your [pc.cumVisc] fluid squirt with volume comparable to a normal human’s full orgasm. <i>“My [pc.balls] can barely keep all this [pc.cumNoun] in.... Think your " + target.vagOrAss(0) + " can do any better?”</i> You let go of your cum-packed cock");
				if(!pc.isCrotchExposed()) output(" and cover up");
				output(", ready to resume the fight.");
			}
			//Reqs: Crotch skill 50+
			else if(select == 12)
			{
				//Clothed: 
				if(!pc.isCrotchExposed()) output("You slip off your [pc.lowerGarments]");
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

				msg = "\n\n<i>“";
				if(pc.hasCock() && pc.hasVagina()) msg += "[pc.CumFlavor] and [pc.girlCumFlavor], two great tastes that go great together. Herm " + pc.mf("boys","girls") + " really do get the best of everything.";
				//Male: 
				else if(pc.hasCock()) msg += "Sure you don’t want some of this [pc.cumNoun] for yourself? It’s nice and [pc.cumFlavor], " + pc.mf("a real man’s spunk","perfect for a “girl” like me") + ".";
				else if(pc.hasVagina()) 
				{
					msg += "Mmm, can’t get enough of that all-natural [pc.girlCumFlavor] taste. Come get some";
					if(pc.wettestVaginalWetness() >= 3) msg += ". I’ve got plenty to go around";
					msg += ".";
				}
				msg += "”</i>";
				output(msg);

				output("\n\nYou don’t give your foe much longer to watch your self-serve taste test before you ");
				if(!pc.isCrotchExposed()) output(" cover back up");
				else 
				{
					output(" return your attention to the fight");
					if(pc.hasCock())
					{
						if(pc.hasSheath() || pc.hasStatusEffect("Genital Slit")) output(", your [pc.cock] returning to its container");
					}
				}
				output(", but they can still see vestiges of ");
				if (pc.hasCock()) output("[pc.cumColor] [pc.cumNoun]");
				if (pc.cumType != pc.girlCumType || !pc.hasCock()) {
					if (pc.hasVagina() && pc.hasCock()) output(" and ");
					if (pc.hasVagina()) output("[pc.girlCumColor] [pc.girlCumNoun]");
				}
				output(" on your lips.");
			}
			//Reqs: PC is in combat with a zil male, zil female, or the dual zil when meeting Penny, PC has a zil vagina
			else if(select == 13)
			{
				//PC is relevantly clothed: 
				if(!pc.isCrotchExposed()) output("You slip your [pc.lowerGarments] down just enough to reveal");
				else output("You adjust your thighs to highlight");
				output(" where your [pc.skinFurScalesColor] starts to give way to the dusky shade of [pc.oneVagina], drawing your target’s gaze.");
				msg = "\n\n<i>“Surprised? When I saw ";
				if(target is ZilFemale) msg += "you girls";
				else msg += "your zil girls";
				msg += " with those exotic pussies, I just had to try it for myself.”</i>";
				output(msg);
				//clothed:
				if(!pc.isCrotchExposed()) output(" Your [pc.lowerGarment] comes down the rest of the way");
				else output(" You move your thighs away");
				output(", allowing you to spread yourself to reveal your [pc.vaginaColor] interior.");
				//[pc.vaginaColor == gold]
				if(pc.vaginas[0].vaginaColor == "gold") 
				{
					msg = " <i>“See? Just like ";
					if(target is ZilFemale) msg += "yours";
					else msg += "the ones you’re used to";
					msg += ".”</i>";
					output(msg);
				}
				else output(" <i>“But I thought another color on the inside would look even nicer.”</i>");
				//[pc.girlCum == honey]
				if(pc.girlCumType == GLOBAL.FLUID_TYPE_HONEY) 
				{
					msg = "\n\n<i>“I even cum honey now";
					if(pc.vaginas[0].wetness() >= 3) msg += ", a lot more than most zil even";
					msg += ".”</i>";
					output(msg);
				}
				else 
				{
					msg = "\n\n<i>“The taste is totally different, though. So, [pc.girlCumFlavor] compared to what you’re used to, though I bet you’d love it if you tried it.";
					if(pc.vaginas[0].wetness() >= 3) msg += " There’s a lot, so you’d have to make sure to drink up every drop.";
					msg += "”</i>";
					output(msg);
				}
				output("\n\nYou allow your fingers to rub up and down across your folds, showcasing it for your foe. <i>“I’ve gotta say, I’m really loving having a honeypot like this... maybe I’ll give you a taste, if you’re a good" + target.mfn(" boy"," girl","... thing") + ".”</i>");
				//Clothed:
				if(!pc.isCrotchExposed()) output(" You close up your [pc.lowerGarments]");
				else output(" You adjust your thighs back to their normal stance");
				output(" as you say this, taking a moment to suck your fingers clean with a wink.");
			}
			//Reqs: PC is wearing harness upper undergarment + has cock
			else if (select == 15)
			{
				if(pc.hasArmor()) output("You undo the lower half of your [pc.armor] to let [pc.eachCock] fall out and [pc.balls] hang loose.");
				else output("You roll back your shoulders and angle up your hip to show off your [pc.eachCock] and swinging [pc.balls].");
				output(" Coincidentally [pc.oneCock] is hung inside of your harness, it’s [pc.cockHead] utterly covered in precum, showing how virile and ready to please you are. You stroke [pc.oneCock] until a glob of precum lands on your hand. Lifting it above your mouth you slowly let your [pc.cumVisc] precum slide into your mouth. After letting it rest on your tongue for a bit, you swallow. You open your mouth and show " + target.getCombatName() + " that your mouth is now empty. You quickly cover back up.");
			}
		}
		
		private function teaseOral(target:Creature):void
		{
			var teaseCount:Number = 0;
			var likeAdjustments:Array = new Array();
			
			//Get tease count updated
			teaseCount = Math.min((flags["TIMES_ORAL_TEASED"] == undefined ? 0 : flags["TIMES_ORAL_TEASED"]), 100);
			
				if((pc.lipRating() > 6) && target.sexualPreferences.getPref(GLOBAL.SEXPREF_HYPER) > 0) 
					likeAdjustments[likeAdjustments.length] = target.sexualPreferences.getPref(GLOBAL.SEXPREF_HYPER);
				//Global adjustments for things like fur, sweat, cum-covered, etc.
				likeAdjustments.concat(globalTeaseAdjustments(target));

			clearOutput();
			
			oralTeaseText(target);
			applyTeaseDamage(pc, target, teaseCount, "ORAL", likeAdjustments);
			
			if (target is CrystalGooT1 && (target as CrystalGooT1).ShouldIntercept({ isTease: true }))
			{
				(target as CrystalGooT1).SneakSqueezeAttackReaction( { isTease: true } );
			}
			else if (target is CrystalGooT2 && (target as CrystalGooT2).ShouldIntercept( { isTease: true } ))
			{
				(target as CrystalGooT2).SpecialAction( { isTease: true } );
			}
			processCombat();
		}
		private function oralTeaseText(target:Creature):void 
		{
			var msg:String = "";
			var temp:int = 0;
			var choices:Array = new Array();
			
			choices.push(0);
			choices.push(1);
			choices.push(2);
			choices.push(3);
			
			var select:int = choices[rand(choices.length)];
			
			// Airtight check
			if(pc.hasAirtightSuit()) output("You swiftly remove your helmet to reveal your [pc.lips]... ");
			
			// 9999: Please write!
			// Texts here
			switch(select)
			{
				case 0:
					output("");
					break;
				case 1:
					output("");
					break;
				case 2:
					output("");
					break;
				case 3:
					output("");
					break;
			}
			
			
			if(pc.hasAirtightSuit()) output(" You then redon your helmet.");
		}
		
		private function myrVenomBite(target:Creature):void
		{
			clearOutput();
			if(CombatAttacks.myrVenomBite(pc, target))
			{
				var teaseCount:Number = 0;
				var likeAdjustments:Array = new Array();
				
				//Get tease count updated
				teaseCount = Math.min((flags["TIMES_ORAL_TEASED"] == undefined ? 0 : flags["TIMES_ORAL_TEASED"]), 100);
				
				if((pc.lipRating() > 6) && target.sexualPreferences.getPref(GLOBAL.SEXPREF_HYPER) > 0) 
					likeAdjustments[likeAdjustments.length] = target.sexualPreferences.getPref(GLOBAL.SEXPREF_HYPER);
				//Global adjustments for things like fur, sweat, cum-covered, etc.
				likeAdjustments.concat(globalTeaseAdjustments(target));
				
				applyTeaseDamage(pc, target, teaseCount, "MYR VENOM", likeAdjustments);
			}
			processCombat();
		}
		
		private function teaseSquirt(target:Creature):void
		{
			var teaseCount:Number = 0;
			var likeAdjustments:Array = new Array();
			
			//Get tease count updated
			teaseCount = Math.min((flags["TIMES_CHEST_TEASED"] == undefined ? 0 : flags["TIMES_CHEST_TEASED"]), 100);
			
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
			//Global adjustments for things like fur, sweat, cum-covered, etc.
			likeAdjustments.concat(globalTeaseAdjustments(target));

			clearOutput();
			
			squirtTeaseText(target);
			applyTeaseDamage(pc, target, teaseCount, "SQUIRT", likeAdjustments);
			
			if (target is CrystalGooT1 && (target as CrystalGooT1).ShouldIntercept({ isSquirt: true }))
			{
				(target as CrystalGooT1).SneakSqueezeAttackReaction( { isSquirt: true } );
			}
			else if (target is CrystalGooT2 && (target as CrystalGooT2).ShouldIntercept( { isSquirt: true } ))
			{
				(target as CrystalGooT2).SpecialAction( { isSquirt: true } );
			}
			
			processCombat();
		}
		
		private function squirtTeaseText(target:Creature):void
		{
			output("You grab the sides of your [pc.breasts]. With a single squeeze, you squirt a stream of [pc.milk] at your opponent!");
			pc.milked(25);
		}
		
		private function generateSenseMenu(attacker:Creature, target:Creature):void
		{
			clearOutput();
			
			if(pc.hasStatusEffect("Blinded") || target.isInvisible())
			{
				output("You try to get a feel for " + possessive(target.getCombatName()) + " likes and dislikes...");
				output("\n<b>Unfortunately, you can’t see the enemy clearly enough for it to work!</b>");
				processCombat();
				return;
			}
			
			if (target is Cockvine)
			{
				kGAMECLASS.adultCockvineSenseOverride();
				processCombat();
				return;
			}
			
			output("You try to get a feel for " + possessive(target.getCombatName()) + " likes and dislikes!");
			var buffer:String = "";
			var prefs:int = 0;
			var PCBonus:Number = pc.intelligence() / 2 + pc.libido() / 20;
			if (pc.hasPerk("Fuck Sense")) PCBonus = pc.libido();
			
			if (target.isLustImmune) output("\nYou don’t think sexuality can win this fight!");
			else
			{
				for(i = 0; i < GLOBAL.MAX_SEXPREF_VALUE; i++) {
					buffer = GLOBAL.SEXPREF_DESCRIPTORS[i];
					if(target.sexualPreferences.getPref(i) != 0) {
						output("\n");
						//If succeeds at sense check!
						if(PCBonus + rand(20) + 1 >= target.level * 3 * (150-target.libido())/100) 
						{
							switch(target.sexualPreferences.getPref(i))
							{
								case GLOBAL.REALLY_LIKES_SEXPREF: 		output(buffer + ": Really likes!"); break;
								case GLOBAL.KINDA_LIKES_SEXPREF: 		output(buffer + ": Kinda likes!"); break;
								case GLOBAL.KINDA_DISLIKES_SEXPREF: 	output(buffer + ": Dislikes!"); break;
								case GLOBAL.REALLY_DISLIKES_SEXPREF:	output(buffer + ": Dislikes a lot!"); break;
								default: output(buffer + ": ERROR"); break;
							}
						}
						//if fails!
						else 
						{
							output(buffer + ": You aren’t sure.")
						}
					}
					prefs++;
				}
				
				var damIdx:uint = 0;
				
				output("\n\n<b><u>Lust Resistances</u></b>");
				var lR:TypeCollection = target.getLustResistances();
				for (i = 0; i < DamageType.LustDamageTypes.length - 1; i++)
				{
					damIdx = DamageType.LustDamageTypes[i];
					var rValue:Number = lR.getType(damIdx).damageValue;
					
					output("\n* <b>" + lR.getType(damIdx).longName + " Resistance:</b> ");
					if (PCBonus + rand(20) + 1 >= target.level * 3 * (150 - target.libido()) / 100)
					{
						output(" " + String(Math.round(lR.getType(damIdx).damageValue * 100) / 100) + " %");
					}
					else
					{
						output(" You aren’t sure.");
					}
				}
			}
			if(target is HandSoBot) output("\nWhilst your teases have some effect on synthetics designed for sex, you sense there is no point whatsoever trying it on with what amounts to a bipedal forklift truck.");
			else if (!target.isLustImmune && prefs <= 0) output("\nIt seems " + target.getCombatPronoun("pa") + " sexual preferences do not sway strongly in one way or another...");
			
			var pcGearEyeballBonus:Number = pc.intelligence() / 2 + (pc.willpower() / (target.willpowerMax() / 5));
			if (pc.hasPerk("Keen Eyes")) pcGearEyeballBonus = pc.perkv1("Keen Eyes");
			
			output("\n\nCasting a glance over " + possessive(target.getCombatName()) + " equipment, you try and get some measure of " + target.getCombatPronoun("pa") + " combat prowess.");
			output("\n\n<b><u>Damage Resistances</u></b>");
			var tarC:TypeCollection = target.shields() > 0 ? target.getShieldResistances() : target.getHPResistances();
			for (var i:int = 0; i < DamageType.HPDamageTypes.length - 1; i++)
			{
				damIdx = DamageType.HPDamageTypes[i];
				output("\n* <b>" + tarC.getType(damIdx).longName + " Resistance:</b> ");
				
				if (pcGearEyeballBonus + rand(20) + 1 >= target.level * 3 * ((target.willpowerMax() * 1.5) - target.willpower()) / target.willpowerMax())
				{
					output(String(Math.round(tarC.getType(damIdx).damageValue * 100) / 100) + " %");
				}
				else
				{
					output("You can’t tell.");
				}
			}
		}
		
		private function checkForLoss(atEndOfRound:Boolean = false):Boolean
		{
			var tEnemy:Creature;
			
			var bLossCond:Boolean = playerLossCondition(atEndOfRound);
			
			// Naleen special loss handling
			if (!bLossCond)
			{
				bLossCond = (hasEnemyOfClass(Naleen) || hasEnemyOfClass(NaleenMale) || hasEnemyOfClass(NaleenBrotherA)) && (pc.hasStatusEffect("Naleen Venom") && (pc.physique() == 0 || pc.willpower() == 0));
			}
			
			if (bLossCond && lossCondition == CombatManager.ESCAPE && atEndOfRound)
			{
				tEnemy = _hostiles[0];
				
				CombatManager.showCombatUI();
				clearMenu();
				
				addButton(0, "Defeat", function(t_enemy:Creature, t_lossFunctor:Function):Function {
					return function():void {
						clearOutput();
						kGAMECLASS.setEnemy(t_enemy);
						CombatManager.showCombatUI();
						t_lossFunctor();
					}
				}(tEnemy, _lossFunction));
				return true;
			}
			else if (bLossCond)
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
		
		private function checkForVictory(atEndOfRound:Boolean = false):Boolean
		{
			if (playerVictoryCondition(atEndOfRound))
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
						//Special texts for this :3
						if (t_enemy.hasStatusEffect("PEACEFUL_WIN")) {}
						else if (t_enemy.HP() <= 0) output("<b>You’ve knocked the resistance out of " + t_enemy.getCombatName() + ".</b>\n\n");
						else if (t_enemy.lust() >= 100) 
						{
							var msg:String = "";
							msg = "<b>" + t_enemy.capitalA + t_enemy.short;
							if(CombatManager.multipleEnemies()) msg += " are";
							else msg += " is";
							msg += " too turned on to fight.</b>\n\n";
							output(msg);
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
		
		public function GroundCombatContainer()
		{ 
			_roundCounter = 1;
			
			genericVictory = function(func:Function):void {
				_continue = func;
				StatTracking.track("combat/wins");
				getCombatPrizes();
				doCombatCleanup();
			}
			
			genericLoss = function(func:Function):void {
				_continue = func;
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
			output("(If you’re struggling with combat difficulty, consider accessing <b>easy mode</b>. Easy mode reduces all damage (both normal and lust) by 50%. You can turn it on at any time by bringing up the menu and entering the options submenu.\n\nThe menu button is located in the bottom left of the interface - the three horizontal lines. It has been highlighted for convenience.");
			kGAMECLASS.userInterface.mainMenuButton.Glow();
			output("\n\nAdditionally, remember that you should have at least one class ability to use as well as tease attacks. Several melee weapons are also available in Esbeth can be purchased for a reasonable amount of money - if you’d like a little extra punch.)");
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
		override public function doneRoundActions():Boolean
		{
			if (_initForRound == _roundCounter) return true;
			return false;
		}
				
		protected var _roundCounter:int = 0;
		override public function get roundCounter():int { return _roundCounter; }
		
		protected var _entryFunction:Function;
		
		public function get entryFunction():Function { return _entryFunction; }
		public function set entryFunction(v:Function):void { _entryFunction = v; }
		
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
		
		override public function setPlayerGroup(... args):void
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
		override public function addFriendlyActor(newC:*):void
		{
			if (!(newC is Creature)) throw new Error("New actor is not a creature.");
			
			prepFriendlyForCombat(newC);
			_friendlies.push(newC);
			makeCharacterUnique(newC, FRIENDLY_GROUP);
			showCombatUI();
		}
		
		// Store the next for name-append in the class, so we can use it
		// later if we need it.		
		override public function setEnemyGroup(... args):void
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
		
		override public function addHostileActor(newC:*):void
		{
			if (!(newC is Creature)) throw new Error("New actor is not a creature.");
			
			prepHostileForCombat(newC);
			_hostiles.push(newC);
			makeCharacterUnique(newC, HOSTILE_GROUP);
			showCombatUI(); // force an update
		}
		
		override public function removeHostileActor(remC:*):void
		{
			if (!(remC is Creature)) throw new Error("Removed actor is not a creature.");
			
			_hostiles.splice(_hostiles.indexOf(remC), 1);
			showCombatUI();
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
		
		override public function doCombatCleanup():void
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
		
		override public function beginCombat():void
		{
			validateContainer();
			//showCombatDescriptions();
			showCombatMenu();
			showCombatUI(true);
			userInterface().levelUpOff();
			userInterface().messengerOff();
		}
		
		private function validateContainer():void
		{
			if (_victoryFunction == null) throw new Error("No victory function has been specified.");
			if (_lossFunction == null) throw new Error("No loss function has been specified.");
			
			if (encounterTextGenerator != null)
			{
				encounterText = encounterTextGenerator();
			}
		}
		
		override public function showCombatUI(setAsInit:Boolean = false):void
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
			
			var i:int = 0;
			
			for (i = 0; i < _friendlies.length; i++)
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
				output("ou’re fighting ");
				if (enemiesAlive() == 1) output("one hostile:");
				else output(num2Text(enemiesAlive()) + " hostiles:");
			}
			
			// TODO: I guess this would be the place to point out blindness or whatever.
			if(kGAMECLASS.uvetoBlizzardCombat()) {
				for (i = 0; i < _hostiles.length; i++)
				{
					if(!_hostiles[i].hasBlindImmunity()) CombatAttacks.applyBlind(_hostiles[i], 3, true, "The blizzard running through the environment makes it difficult to see!\n\nAccuracy is reduced, and ranged attacks are far more likely to miss.");
				}
				for (i = 0; i < _friendlies.length; i++)
				{
					if(!_friendlies[i].hasBlindImmunity()) CombatAttacks.applyBlind(_friendlies[i], 3, true, "The blizzard running through the environment makes it difficult to see!\n\nAccuracy is reduced, and ranged attacks are far more likely to miss.");
				}
			}
			var totalBlinded:int = 0;
			for (i = 0; i < _friendlies.length; i++)
			{
				if(_friendlies[i].hasStatusEffect("Blinded")) totalBlinded++;
			}
			if(pc.hasStatusEffect("Blinded"))
			{
				output("\n\n<b>Unfortunately, you");
				if(_friendlies.length == 2 && totalBlinded == 2) output(" and your partner are blind");
				else if(totalBlinded > 2) output("r team and you have been blinded");
				else output("r vision is obscured");
				output(" and you can’t see the status of");
				if(_hostiles.length == 1 && !_hostiles[0].isPlural) output(" the enemy");
				else output(" your foes");
				output(" properly!</b>");
				
				return;
			}
			
			for (i = 0; i < _hostiles.length; i++)
			{
				displayHostileStatus(_hostiles[i]);
				//Furpies bonus damage warning!
				if (_hostiles[i].hasFur())
				{
					if (pc.statusEffectv2("Furpies Simplex H") == 1 || pc.statusEffectv2("Furpies Simplex C") == 1 || pc.statusEffectv2("Furpies Simplex D") == 1)
					{
						if(_hostiles[i].hasGenitals())
						{
							if(_hostiles[i].isPlural)
							{
								output("\n\nTheir fur is so incredibly sexy! Better <b>hope they don’t tease you or you’ll be forced to pile with them to get some personal grooming!</b>");
							}
							//Foe is masculine furry
							else if(_hostiles[i].mf("m","f") == "m")
							{
								output("\n\nHe’s got such sexy fur covering his body! You could just snuggle into it and let him have his way with you... <b>Better hope he doesn’t tease you or you’ll spread your legs like a " + ((pc.hasVaginaType(GLOBAL.TYPE_EQUINE) || pc.horseScore() >= 3) ? "mare" : "bitch") + " in heat!</b>");
							}
							//Foe is feminine furry
							else
							{
								output("\n\nHer fur is so shimmery and sexy! Better <b>hope she doesn’t tease you or you’ll be putty in her paws - a docile, domesticated mate, even!</b>");
							}
						}
					}
				}
				if (_hostiles[i].hasStatusEffect("Undetected Sneezing Tits"))
				{
					kGAMECLASS.sneezingTitsCombatTurnBonus(_hostiles[i], roundCounter);
				}
			}
			if(pc.hasKeyItem("RK Lah - Captured")) kGAMECLASS.lahAddendumToCombat();

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
				var dvh:String = target.downedViaHP();
				if (dvh != null)
				{
					if (dvh.length > 0) output("\n\n" + dvh);
				}
				else
				{
					output("\n\n<b>You’ve knocked the resistance out of " + target.getCombatName() + ".</b>");
				}
			}
			else if (target.lust() >= target.lustMax())
			{
				var dvl:String = target.downedViaLust();
				if (dvl != null)
				{
					if (dvl.length > 0) output("\n\n" + dvl);
				}
				else
				{
					output("\n\n<b>" + StringUtil.capitalize(target.getCombatName(), false) + ((target.isPlural == true) ? " are" : " is") + " too turned on to fight.</b>");
				}
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
						output("\n\n<b>" + StringUtil.toTitleCase((target.uniqueName && target.uniqueName.length > 0) ? target.uniqueName : target.short) + ":</b>");
						if(target.isInvisible()) output("\n<i>The enemy is practically invisible to you!</i>");
						else if (target.long.length > 0) output("\n" + target.long);
						else if(target.lust() < 50 || target.isLustImmune == true) output("\n<i>Nothing in particular to take note of.</i>");
						else showMonsterArousalFlavor(target);
					}
				}
				
				// TODO Blinds had some effect on this...
				if (target is QueenOfTheDeep && !pc.hasStatusEffect("Watered Down"))
				{
					output("\n<b>You’re still clinging to the monster’s topside, limiting her ability to fight you!</b>");
					
					if (target.lust() >= 50) output("\nYou can see her breath quickening, her massive chest heaving with nipples as hard as diamonds. She looks almost ready to cum just from your confrontation...");
				}
				
				if (encounterText != null && !(target is QueenOfTheDeep) && !(target is Cockvine) && !(target is MyrGoldRemnant) && !(target is MyrGoldBrute))
				{
					if (_hostiles.length == 1)
					{
						kGAMECLASS.setEnemy(target);
						target.getCombatDescriptionExtension();
						showMonsterArousalFlavor(target);
						kGAMECLASS.setEnemy(null);
					}
					else
					{
						target.getCombatDescriptionExtension();
						output("\n\n<b>" + StringUtil.toTitleCase((target.uniqueName && target.uniqueName.length > 0) ? target.uniqueName : target.short) + ":</b>");
						if(target.isInvisible()) output("\n<i>The enemy is practically invisible to you!</i>");
						else if(target.lust() < 50 || target.isLustImmune == true) output("\n<i>Nothing in particular to take note of.</i>");
						else showMonsterArousalFlavor(target);
					}
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
				output("\n\n<b>" + StringUtil.capitalize(target.getCombatName(), false) + " is down and out for the count!</b>");
			}
			else if (target.lust() >= target.lustMax())
			{
				output("\n\n<b>" + StringUtil.capitalize(target.getCombatName(), false) + ((target.isPlural == true) ? " are" : " is") + " too turned on to fight.</b>");
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
				else output("<b>" + StringUtil.capitalize(_hostiles[0].getCombatName(), false) + " has knocked you off your " + pc.feet() + "</b>");
			}
			else if (pc.HP() <= 0)
			{
				if (enemiesAlive() > 1 || _hostiles[0].isPlural) output("<b>Your enemies have turned you on too much to keep fighting. You give in....</b>");
				else output("<b>" + StringUtil.capitalize(_hostiles[0].getCombatName(), false) + " has turned you on too much to keep fighting. You give in....</b>"); // TODO should be able to pick out a defined 'leader'
			}
			else if (_hostiles.length == 1 && _friendlies.length == 1)
			{
				output("<b>You’re fighting " + _hostiles[0].getCombatName() + ".</b>");
			}
			else
			{
				// TODO Some decent player status output
				if(pc.isGrappled()) output("You’re trapped in the enemy’s grip to do much");
				else if(pc.hasStatusEffect("Stunned")) output("You’ve been stunned by the enemy and can’t do much");
				else if(pc.hasStatusEffect("Paralyzed")) output("You’ve been paralyzed by the enemy and can’t do much");
				else
				{
					output("You perch behind cover wherever you can find it,");
					if(pc.hasStatusEffect("Disarmed"))
					{
						if(pc.hasKeyItem("Lasso") && flags["CHECKED_GEAR_AT_OGGY"] != undefined) output(" ready to swing your lasso");
						else output(" readying yourself");
					}
					else if(pc.hasWeapon() && rand(2) == 0) output(" [pc.readyingWeapon]");
					else if(pc.hasRangedWeapon()) output(" ready to return fire");
					else if(pc.hasMeleeWeapon()) output(" ready to strike back");
					else output(" ready to throw down");
				}
				if (_friendlies.length > 1)
				{
					output(", side-by-side with your");
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
				if(target.lust() < 60) output("\n" + StringUtil.capitalize(possessive(target.getCombatName()), false) + " skins remain flushed with the beginnings of arousal.");
				else if(target.lust() < 70) output("\n" + StringUtil.capitalize(possessive(target.getCombatName()), false) + " eyes constantly dart over your most sexual parts, betraying their lust.");
				else if (target.lust() < 85)
				{
					if(target.hasCock()) output("\n" + StringUtil.capitalize(target.getCombatName(), false) + " are having trouble moving due to the rigid protrusions in their groins.");
					if(target.hasVagina()) output("\n" + StringUtil.capitalize(target.getCombatName(), false) + " are obviously turned on; you can smell their arousal in the air.");
				}
				else
				{
					if(target.hasCock()) output("\n" + StringUtil.capitalize(target.getCombatName(), false) + " are panting and softly whining, each movement seeming to make their bulges more pronounced. You don’t think they can hold out much longer.");
					if(target.hasVagina()) output("\n" + StringUtil.capitalize(possessive(target.getCombatName()), false) + " " + plural(target.vaginaDescript()) + " are practically soaked with their lustful secretions.");
				}
			}
			else
			{
				if(target.lust() < 60) output("\n" + StringUtil.capitalize(possessive(target.getCombatName()), false) + " " + target.skin() + " remains flushed with the beginnings of arousal.");
				else if(target.lust() < 70) output("\n" + StringUtil.capitalize(possessive(target.getCombatName()), false) + " eyes constantly dart over your most sexual parts, betraying " + target.getCombatPronoun("hisher") + " lust.");
				else if (target.lust() < 85)
				{
					if(target.hasCock()) output("\n" + StringUtil.capitalize(target.getCombatName(), false) + " is having trouble moving due to the rigid protrusion in " + target.getCombatPronoun("hisher") + " groin.");
					if(target.hasVagina()) output("\n" + StringUtil.capitalize(target.getCombatName(), false) + " is obviously turned on, you can smell " + target.getCombatPronoun("hisher") + " arousal in the air.");
				}
				else
				{
					if(target.hasCock()) output("\n" + StringUtil.capitalize(target.getCombatName(), false) + " is panting and softly whining, each movement seeming to make " + target.getCombatPronoun("hisher") + " bulge more pronounced. You don’t think " + target.getCombatPronoun("heshe") + " can hold out much longer.");
					if(target.hasVagina()) output("\n" + StringUtil.capitalize(possessive(target.getCombatName()), false) + " " + target.vaginaDescript() + " is practically soaked with " + target.getCombatPronoun("hisher") + " lustful secretions.");
				}
			}
		}
		
		override public function processCombat():void
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
			if(droneUser == pc && pc.hasStatusEffect("Disarmed") && flags["CHECKED_GEAR_AT_OGGY"] != undefined)
			{
				if(!pc.hasStatusEffect("Varmint Buddy")) return;
			}
			
			//Chaff stahps roboty drones
			if(droneUser.hasStatusEffect("Chaff Grenade") && droneUser.hasCombatDrone(true)) return;
			
			//TAMWULF DOESNT NEED POWAAAAAHHHHH
			if (droneUser.hasCombatDrone(true) && !droneUser.hasStatusEffect("Varmint Buddy"))
			{
				if(((droneUser.hasShields() && droneUser.shields() > 0) || droneUser.accessory.hasFlag(GLOBAL.ITEM_FLAG_INTERNAL_POWER)) && droneUser.hasStatusEffect("Drone Disabled"))
				{
					droneUser.removeStatusEffect("Drone Disabled");
					if(droneUser == pc) output("\n\nWith shield power restored, <b>your drone buzzes back to life</b>, ready to attack once more!");
				}
				else if((!droneUser.hasShields() || droneUser.shields() <= 0) && !droneUser.accessory.hasFlag(GLOBAL.ITEM_FLAG_INTERNAL_POWER))
				{
					//This is done elsewhere for PCs, but we'll just do it late and silent for NPCs cause fuck if I can be bothered -Fen
					if(droneUser != pc) droneUser.createStatusEffect("Drone Disabled",0,0,0,0,false,"Icon_Paralysis","Without shields, the drone cannot attack!",true,0,0xFF0000);
				}
			}
			
			if(droneUser == pc)
			{
				// Auto-target unless targets are set.
				if(!pc.hasStatusEffect("Drone Targeting")) droneUser.droneTarget = CombatAttacks.GetBestPotentialTarget(_hostiles);
			}
			else if(_friendlies.indexOf(droneUser) != -1) droneUser.droneTarget = CombatAttacks.GetBestPotentialTarget(_hostiles);
			else if(_hostiles.indexOf(droneUser) != -1) droneUser.droneTarget = CombatAttacks.GetBestPotentialTarget(_friendlies);
			else droneUser.droneTarget = null;
			
			/*Kor'diiak Leash!
			if(droneUser == pc && droneUser.accessory is KordiiakLeash)
			{
				if(!droneUser.droneTarget.isDefeated())
				{
					output("\n\n");
					droneUser.accessory.droneAttack(droneUser, droneUser.droneTarget);
				}
			}*/

			if (droneUser.hasActiveCombatDrone() && droneUser.droneTarget != null)
			{
				var target:Creature = droneUser.droneTarget;
				if (!target.isDefeated())
				{
					output("\n\n");
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
						if(_hostiles[i].hasFlightEffects()) _hostiles[i].clearFlightEffects();
						
						output("\n\n" + StringUtil.capitalize(_hostiles[i].getCombatName(), false) + " falls to the ground,");
						if (_hostiles[i].HP() <= 0) output(" defeated.");
						else output(" stricken with lust.");
					}
				}
				else if (_hostiles[i].isDefeated() && _hostiles[i].alreadyDefeated == true)
				{
					output("\n\n" + StringUtil.capitalize(_hostiles[i].getCombatName(), false));
					if(_hostiles[i].hasFlightEffects())
					{
						_hostiles[i].clearFlightEffects();
						output(" falls to");
					}
					else output(" lies on");
					output(" the ground, defeated.");
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
				
				if (target.hasStatusEffect("Paralyzed") && !(target is Urbolg))
				{
					// noop, handled by updateStatusEffects
				}
				else if (target.hasStatusEffect("Grappled"))
				{
					output("\n\n");
					doStruggleRecover(target);
				}
				else if (target.hasStatusEffect("Stunned") && !(target is Urbolg))
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
					if(_friendlies[i].hasFlightEffects()) _friendlies[i].clearFlightEffects();
					_friendlies[i].alreadyDefeated = true;
					if (_friendlies[i] is PlayerCharacter) output("\n\nYou fall to the ground,");
					else output("\n\n" + StringUtil.capitalize(_friendlies[i].getCombatName(), false) + " falls to the ground,");
					if (_friendlies[i].HP() <= 0) output(" defeated.");
					else output(" stricken with lust.");
				}
			}
			
			showCombatUI();
			
			if (!postHostileTurnActions())
			{
				endCombatRound();
			}
			
			// Regenerate encounter text once per round after everything has resolved
			if (encounterTextGenerator != null)
			{
				encounterText = encounterTextGenerator();
			}
		}
		
		override public function endCombatRound():void
		{
			// Early-out if the players group lost
			if (checkForVictory(true)) return;
			if (checkForLoss(true)) return;
			
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
				
				//Valdey gets to act always, even if just to jump around.
				//@future generations: please add any status effects that get their section below (like Paralyzed)
				//to AkkadiSecurityRobots.mustJumpNames or valden will happily ignore them, the cheating bastard
				if (target.hasStatusEffect("Valden-Possessed"))
				{
					if (AkkadiSecurityRobots.ValdenAI(target, _hostiles, _friendlies))
					{
						doCombatDrone(target);
						continue;
					}
				}
				
				if (target.hasStatusEffect("Paralyzed") && !(target is Urbolg))
				{
					// noop, this is handled as part of updateStatusEffectsFor()
				}
				//Lock ended
				else if(target.hasStatusEffect("Target Lock") && (target.hasStatusEffect("Stunned") || target.isBlind())) 
				{
					output("\n\nYour attack seems to short out Roz’s sensors for a moment - <b>the target lock is broken!</b>");
					target.removeStatusEffect("Target Lock");
				}
				else if (target.hasStatusEffect("Grappled"))
				{
					output("\n\n");
					doStruggleRecover(target);
				}
				else if (target.hasStatusEffect("Stunned") && !(target is MilodanMale) && !(target is Urbolg) && !(target is Agrosh))
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
		
		private function playerVictoryCondition(atEndOfRound:Boolean = false):Boolean
		{
			if (victoryCondition == CombatManager.ENTIRE_PARTY_DEFEATED || (victoryCondition == CombatManager.SURVIVE_WAVES && !atEndOfRound))
			{
				for (var i:int = 0; i < _hostiles.length; i++)
				{
					if (!_hostiles[i].isDefeated()) return false;
				}
				return true;
			}
			else if (victoryCondition == CombatManager.SURVIVE_WAVES && atEndOfRound)
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
			else if (victoryCondition == CombatManager.ANY_TARGET_DEFEATED)
			{
				for (var ii:int = 0; ii < _hostiles.length; ii++)
				{
					if (_hostiles[ii].isDefeated()) return true;
				}
				return false;
			}
			return false;
		}
		
		private function playerLossCondition(atEndOfRound:Boolean = false):Boolean
		{
			if (lossCondition == CombatManager.ENTIRE_PARTY_DEFEATED || (lossCondition == CombatManager.SURVIVE_WAVES && !atEndOfRound))
			{
				for (var i:int = 0; i < _friendlies.length; i++)
				{
					if (!_friendlies[i].isDefeated()) return false;
				}
				return true;
			}
			else if (lossCondition == CombatManager.SURVIVE_WAVES && atEndOfRound)
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
			else if (lossCondition == CombatManager.ANY_TARGET_DEFEATED)
			{
				for (var ii:int = 0; ii < _friendlies.length; ii++)
				{
					if (_friendlies[ii].isDefeated()) return true;
				}
				return false;
			}
			else if (lossCondition == CombatManager.ESCAPE && atEndOfRound)
			{
				if (lossArgument == null) throw new Error("Loss argument unset for loss condition setting.");
				if (_roundCounter >= lossArgument) return true;
				return false;
			}
			
			return false;
		}
		
		override public function enemiesAlive():int
		{
			var num:int = 0;
			for (var i:int = 0; i < _hostiles.length; i++)
			{
				if (!_hostiles[i].isDefeated()) num++;
			}
			return num;
		}
		
		override public function hasEnemyOfClass(classT:Class):Boolean
		{
			for (var i:int = 0; i < _hostiles.length; i++)
			{
				if (_hostiles[i] is classT) return true;
			}
			return false;
		}
		
		override public function getEnemyOfClass(classT:Class):*
		{
			for (var i:int = 0; i < _hostiles.length; i++)
			{
				if (_hostiles[i] is classT) return _hostiles[i];
			}
			return null;
		}

		public function hasDickedEnemy():Boolean
		{
			for (var i:int = 0; i < _hostiles.length; i++)
			{
				if (_hostiles[i].hasCock()) return true;
			}
			return false;
		}

		override public function hasFriendlyOfClass(classT:Class):Boolean
		{
			for (var i:int = 0; i < _friendlies.length; i++)
			{
				if (_friendlies[i] is classT) return true;
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
			if (_continue != null) _continue();
			else kGAMECLASS.mainGameMenu();
		}
		
		override public function getCombatPrizes():void
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
			var article:Array = [];
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
					article[t.short] = t.a;
					numDistinct++;
				}
				else
				{
					enemyNames[t.short]++;
				}
			}
			
			pc.credits += sumCredits;
			
			// Emit some shit to state what the player got/did
			output("You defeated ");
			for (var key:String in enemyNames)
			{
				// This needs reworking to handle the/a/etc pulled from the creatures base data in the correct instances.
				if (enemyNames[key] > 1) output(String(enemyNames[key]) + "x " + plural(key));
				else output(article[key] + key);
				
				numDistinct--;
				
				if (numDistinct > 1) output(", ");
				if (numDistinct == 1) output(" and ");
			}
			output("!");
			
			kGAMECLASS.earnXP(sumXP, false);
			
			//Monies!
			if (sumCredits > 0) 
			{
				output("\n");
				if(CombatManager.multipleEnemies()) output("They had ");
				else output(StringUtil.capitalize(_hostiles[0].getCombatPronoun("heshe")) + " had ");
				output(String(sumCredits) + " credit");
				if(sumCredits > 1) output("s");
				output(" loaded on " + (CombatManager.multipleEnemies() ? "anonymous credit chits" : "an anonymous credit chit") + " that you appropriate.");
			}
			
			//Rare loot chance 2.0
			loot = kGAMECLASS.genericRareDrops(loot);

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
				clearMenu();
				addButton(0, "Next", postCombatReturnToMenu);
			}
			
			//output("\n\n");
		}
	}
}