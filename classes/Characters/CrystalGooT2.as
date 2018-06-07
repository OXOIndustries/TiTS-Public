package classes.Characters 
{
	import classes.Creature;
	import classes.DataManager.Errors.VersionUpgraderError;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Utility.MathUtil;
	import classes.GameData.Pregnancy.PregnancyStageProgression;
	import classes.GLOBAL;
	import classes.Items.Apparel.GooeyCoverings;
	import classes.Items.Melee.Fists;
	import classes.Items.Guns.HammerPistol;
	import classes.Items.Melee.GooeyPsuedopod;
	import classes.Items.Miscellaneous.EmptySlot;
	import classes.Items.Protection.BasicShield;
	import classes.Items.Protection.JoyCoPremiumShield;
	import classes.Items.Transformatives.GooBallBlue;
	import classes.Items.Transformatives.GooBallGreen;
	import classes.ItemSlotClass;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.GameData.CodexManager;
	
	import classes.Engine.Combat.*;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Engine.Interfaces.output;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	
	import classes.Engine.Utility.weightedRand;
	import classes.Engine.Utility.rand;
	
	/**
	 * Hook damage processing to call OnTakeDamage to heal from burning/freezing whilst armor is gone.
	 * Figure out how to implement this:
	 * 		(in-game effect: chance of damage reduction from or percent resistance to kinetic attacks until armor hits 0)
	 */
	public class CrystalGooT2 extends Creature
	{
		private var baseReflexes:Number;
		private var baseShieldKineticResistance:Number;
		private var kickMeleeWeapon:ItemSlotClass;
		private var slapMeleeWeapon:ItemSlotClass;
		
		public function CrystalGooT2() 
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "ganrael deadeye";
			this.originalRace = "ganrael";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = "";
			this.customDodge = "The goo’s liquid flexibility allows [enemy.himHerIt] to handily avoid your attack.";
			this.customBlock = "The goo’s liquidity absorbs a great deal of punishment - without taking damage.";
			this.isPlural = false;
			
			baseHPResistances = new TypeCollection();
			
			kickMeleeWeapon = new GooeyPsuedopod();
			kickMeleeWeapon.attackVerb = "kick";
			kickMeleeWeapon.attackNoun = "kick";
			kickMeleeWeapon.baseDamage.kinetic.damageValue = 20;
			kickMeleeWeapon.baseDamage.addFlag(DamageFlag.PENETRATING);
			kickMeleeWeapon.hasRandomProperties = true;
			
			slapMeleeWeapon = new GooeyPsuedopod();
			slapMeleeWeapon.baseDamage.kinetic.damageValue = 10;
			slapMeleeWeapon.hasRandomProperties = true;
			
			meleeWeapon = kickMeleeWeapon;
			
			armor = new GooeyCoverings();
			armor.defense = 10;
			armor.resistances.burning.resistanceValue = 10.0;
			armor.resistances.freezing.resistanceValue = -10.0;
			armor.resistances.electric.resistanceValue = -30.0;
			armor.resistances.drug.resistanceValue = -30.0;
			armor.resistances.poison.resistanceValue = -30.0;
			armor.resistances.kinetic.resistanceValue = 15.0;
			armor.resistances.addFlag(DamageFlag.MIRRORED);
			armor.hasRandomProperties = true;
			
			this.rangedWeapon = new EmptySlot();
			
			shield = new BasicShield();
			shield.shields = 100;
			baseShieldKineticResistance = shield.resistances.kinetic.resistanceValue = 25.0;
			shield.resistances.electric.resistanceValue = 50.0;
			shield.resistances.burning.resistanceValue = 30.0;
			shield.resistances.freezing.resistanceValue = 30.0;
			shield.resistances.poison.resistanceValue = 100.0;
			shield.resistances.drug.resistanceValue = 100.0;
			shield.hasRandomProperties = true;
			shield.resistances.addFlag(DamageFlag.CRYSTALGOOARMOR);
			

			
			this.physiqueRaw = 30;
			baseReflexes = reflexesRaw = 19;
			this.aimRaw = 12;
			this.intelligenceRaw = 1;
			this.willpowerRaw = 14;
			this.libidoRaw = 50;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 20;
			
			this.level = 7;
			this.XPRaw = normalXP();
			this.credits = 0;
			this.HPMod = 5;
			this.shieldsRaw = this.shieldsMax();
			this.HPRaw = this.HPMax();
			this.shieldDisplayName = "ARMOR";
			
			this.femininity = 50;
			this.eyeType = GLOBAL.TYPE_HUMAN;
			this.eyeColor = "green";
			this.tallness = 24;
			this.thickness = 70;
			this.tone = 80;
			this.hairColor = "none";
			this.scaleColor = "none";
			this.furColor = "none";
			this.hairLength = 0;
			this.hairType = GLOBAL.TYPE_HUMAN;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_GOO;
			this.skinTone = "green";
			this.skinFlags = new Array();
			addSkinFlag(GLOBAL.FLAG_ABSORBENT);
			this.faceType = GLOBAL.TYPE_HUMAN;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_HUMAN;
			this.lipMod = 0;
			this.earType = 0;
			this.antennae = 1;
			this.antennaeType = GLOBAL.TYPE_HUMAN;
			this.horns = 0;
			this.hornType = 0;
			this.armType = GLOBAL.TYPE_HUMAN;
			this.gills = false;
			this.wingType = GLOBAL.TYPE_HUMAN;
			this.legType = GLOBAL.TYPE_GOOEY;
			this.legCount = 1;
			this.legFlags = [GLOBAL.FLAG_AMORPHOUS];
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_HUMAN;
			this.tailCount = 1;
			this.tailFlags = new Array();
			this.tailGenitalArg = 0;
			this.tailGenital = 0;
			this.tailVenom = 0;
			this.tailRecharge = 5;
			this.hipRatingRaw = 2;
			this.buttRatingRaw = 2;
			this.cocks = new Array();
			
			this.createStatusEffect("Disarm Immune");
			this.createStatusEffect("Stun Immune");
			
			isUniqueInFight = true;
			btnTargetText = "GooDeadeye";
			sexualPreferences.setRandomPrefs(2 + rand(3));
			sexualPreferences.setPref(GLOBAL.SEXPREF_CUMMY, sexualPreferences.getRandomLikesFactor());
			if(rand(2) == 0) sexualPreferences.setPref(GLOBAL.SEXPREF_SWEAT, sexualPreferences.getRandomLikesFactor());
			
			Randomise();
			
			this._isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return "CRYSTAL_GOO_T2_"+skinTone.toUpperCase() + (hasStatusEffect("Unarmored") ? "_UNARMORED" : "");
		}
		
		public function Randomise():void
		{
			var colours:Array = [];
			colours.push( { v: "green", w: 39 } );
			colours.push( { v: "blue", w: 25 } );
			colours.push( { v: "yellow", w: 20 } );
			colours.push( { v: "pink", w: 15 } );
			colours.push( { v: "red", w: 1 } );
			
			skinTone = weightedRand(colours);
			
			UpdateState();
		}
		
		public function UpdateState():void
		{
			if (!hasStatusEffect("Unarmored"))
			{
				long = "The alien facing you may seem a bit too stiff to be a threat, but really, she’s just lazy and vain. If you stop admiring her smooth " + skinTone+" curves, teardrop breasts, and pixie face for even a moment, she’ll have no qualms about throwing as many sharp objects as it takes to get your attention again.";
				if (shields() < shieldsMax()) long += "The chips your attacks have left in her don’t seem to impede her ego in the least.";
			}
			else
			{
				long = "The ganrael’s ego has collapsed with its armor. No longer the picture of a busty heroine, the sexless, faceless "+skinTone+" blank that was inside has redoubled its offense and its hand hovers over the next missile almost as soon as it’s thrown one. You should finish this quickly, unless you like being pelted with anything and everything that’s not nailed down."
			}
			
			if (shields() > 0)
			{
				if (hasStatusEffect("Force It Gender")) removeStatusEffect("Forced It Gender");
				if (!hasStatusEffect("Forced Fem Gender")) createStatusEffect("Force Fem Gender");
			}
			else
			{
				if (!hasStatusEffect("Force It Gender")) createStatusEffect("Force It Gender");
				if (hasStatusEffect("Force Fem Gender")) removeStatusEffect("Force Fem Gender");
			}
			
			// Interpolate the armor value as a percent between a multiplier between 1 and 0.33. Use this multiplier to modify the base reflex value of the enemy.
			reflexesRaw = MathUtil.LinearInterpolate(0.33, 1, shields() / shieldsMax()) * baseReflexes;
			shield.resistances.kinetic.resistanceValue = MathUtil.LinearInterpolate(0, 1, shields() / shieldsMax()) * baseShieldKineticResistance;
		}
		
		private var _hasChangedColour:Boolean = false;
		
		override public function OnTakeDamage(incomingDamage:TypeCollection):void
		{			
			if (shields() <= 0)
			{
				if (!hasStatusEffect("Unarmored")) 
				{
					createStatusEffect("Unarmored");
				}
				else
				{
					var typedDamageTotal:int = 0;
					typedDamageTotal = incomingDamage.freezing.damageValue;
					typedDamageTotal = incomingDamage.burning.damageValue;
					
					if (typedDamageTotal > 0)
					{
						shieldsRaw = (typedDamageTotal * 0.66);
						
						if (incomingDamage.burning.damageValue > 0) OnTakeDamageOutput = "The scorched flesh hisses and bubbles at the site of the damage, hardening into a jagged, scar-like plate!";
						else OnTakeDamageOutput = "The cold causes hundreds of tiny crystals to form, clouding and stiffening the site into a sandpapery plate!";
					}
				}
			}
			
			if (skinTone == "green" || skinTone == "pink")
			{
				if (incomingDamage.electric.damageValue > 0)
				{
					if (OnTakeDamageOutput == null) OnTakeDamageOutput = "";
					else OnTakeDamageOutput += "\n\n";
					
					OnTakeDamageOutput += "The ganrael’s body spasms from the electrical current, and jagged purple scores follow the paths of the arcing bolts!";
					skinTone = "purple";
					_hasChangedColour = true;
				}
			}
			else if (skinTone == "blue" || skinTone == "red")
			{
				if (incomingDamage.freezing.damageValue > 0)
				{
					if (OnTakeDamageOutput == null) OnTakeDamageOutput = "";
					else OnTakeDamageOutput += "\n\n";
					
					OnTakeDamageOutput += "A splotch of light orange color appears at the locus of your freezing attack, and spreads out as the ganrael shivers!";
					skinTone = "orange";
					_hasChangedColour = true;
				}
			}
			else if (skinTone == "yellow")
			{
				if (incomingDamage.burning.damageValue > 0)
				{
					if (OnTakeDamageOutput == null) OnTakeDamageOutput = "";
					else OnTakeDamageOutput += "\n\n";
					
					OnTakeDamageOutput += "The ganrael’s body burns a scarlet, angry red where your thermal attack struck, not only outside but inside as well!";
					skinTone = "red";
					_hasChangedColour = true;
				}
			}
		}
			
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			UpdateState();
			
			if (_skipRound)
			{
				_skipRound = false;
				return;
			}
			
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			if (OnTakeDamageOutput != null)
			{
				output(OnTakeDamageOutput + "\n\n");
				OnTakeDamageOutput = null;
			}
			
			var attacks:Array = [];
			
			if (!hasStatusEffect("Blinded"))
			{
				if (energy() >= 15) attacks.push( { v: ThrowPick, w: 30 } );
				if (energy() >= 15 && target.hasStatusEffect("Bleeding")) attacks.push( { v: ThrowNeedle, w: 30 } );
				attacks.push( { v: CrystalBackhand, w: 10 } );
				if (energy() <= 15) attacks.push( { v: ThrowImprov, w: 20 } );
			}
			else
			{
				attacks.push( { v: CrystalBackhand, w: 10 } );
			}
			
			if (energy() >= 50 && CombatManager.getRoundCount() >= 4) attacks.push( { v: ThrowAFit, w: 1000 } );
			
			weightedRand(attacks)(target);
		}
		
		private function CGender(a:String, b:String):String
		{
			if (!hasStatusEffect("Unarmored")) return a;
			return b;
		}
		
		public function ShouldIntercept(attackOpts:Object):Boolean
		{
			if (attackOpts.isWait != undefined || attackOpts.isFantasize != undefined || attackOpts.isPsionic != undefined)
			{
				if (hasStatusEffect("Blinded")) return false;
				if (hasStatusEffect("Unarmored")) return false;
				return true;
			}
			return false;
		}
		
		private var _skipRound:Boolean = false;
		
		public function SpecialAction(attackOpts:Object):void
		{
			// only used if the ganrael is not blind or unarmored and the player selects ‘Wait’,‘Fantasize’, 
			// or any other choice where PC stops acting and pays full attention to the ganrael (e.g. concentrating hard to deliver a psionic tease)
			// NPC aborts any other attack and strikes a pose for a random effect (basically pauses combat to wait for PC to act again)

			// lusty pose - always if PC uses psionic tease (when added), randomly otherwise
			// adds lust to PC
			
			_skipRound = true;
			
			var randSelect:int = rand(3);
			
			// if (attackOpts["isPsionic"] != undefined)
			if (9999 == 0 || randSelect == 0)
			{
				output("\n\nThe ganrael");
				// psi tease
				if (9999 == 0) output(" reacts to the perverted images you’re sending by acting them out,");
				else output(" basks in your attention,");
				output(" groping her chest and spreading her legs to expose her groin. A hand slides into her crotch, and she claps her thighs together with a whorish moan. She holds the pose, trembling slightly and drinking in your gaze as blood rushes to your crotch. If her mask could wink, she’d be doing it hard enough to shake eyelashes loose.");
			}
			else if (randSelect == 2)
			{
				//grow a needle
				//restores one needle(‘s worth of energy)
				energy(15);
				output("\n\nThe ganrael makes good use of the lull in combat. Flourishing one hand, she grips a fingertip and begins to pull, stretching out the soft gap and twisting it into a thin braid. The flesh clouds and hardens, and she breaks the finger at the narrowest place to form a new needle!");
			}
			else
			{
				//silly martial valor pose
				//no effect
				output("\n\nThe ganrael takes advantage of your attention to strike a military pose, holding her head high and raising a hand in salute to an unseen superior. The out-of-place patriotism makes you miss civilization a little.");
			}
		}
		
		private function ThrowImprov(target:Creature):void
		{
			//never used unless missile inventory/energy is too low to attack with the selected projectile
			//slings an item from the ground (usually a rock), does rock damage
			//if current NPC armor < max armor, chance of throwing an armor shard with slight bonus damage (compared to rock) and bleed

			output("The ganrael snatches at " + CGender("her", "its") +" body for something to throw but comes up empty. With a jerky sweep, " + CGender("she", "it") +" grabs an object from the ground and flings it instead!");
			
			if (rangedCombatMiss(this, target))
			{
				output(" You move and it sails by harmlessly.");
			}
			else
			{
				var bShard:Boolean = false;
				if (shields() < shieldsMax() && rand(5) >= 1) bShard = true;
				
				var rockDamage:TypeCollection = new TypeCollection( { kinetic: 7 } );
				var shardDamage:TypeCollection = new TypeCollection( { kinetic: 15 }, DamageFlag.PENETRATING);
				
				var dr:DamageResult = applyDamage(bShard ? shardDamage : rockDamage, this, target, "suppress");
				
				if (dr.shieldDamage > 0 && dr.hpDamage <= 0)
				{
					output(" It glances off your shield.");
				}
				else if (dr.hpDamage > 0)
				{
					if (!bShard)
					{
						output(" A rock hits you!");
					}
					else
					{
						output(" A sharp pain spreads and you look down to see a shard of crystal plating sticking out!");
						if (!target.hasStatusEffect("Bleeding")) output(" <b>You’re bleeding!</b>");
						else output(" <b>You’re bleeding a little!</b>");
						CombatAttacks.applyBleed(target, 1, 3, 15);
					}
				}
				
				outputDamage(dr);
			}
		}
		
		private function ThrowAFit(target:Creature):void
		{
			energy( -55); // enfroce only once use / fight via energycost
			
			//throws out multiple projectiles of both types for 70-80% inventory cost and multiple hits/bleeds (big damage upfront and harsh bleed for huge damage total spread over multiple turns)
			//number of attacks and or a modifier should allow for blunderbuss-style accuracy even if PC re-blinds her on the turn of the attack
			output("Shaking with anger, the ganrael throws out picks and needles in handfuls, barraging you with a hail of jagged crystal!");
			
			for (var i:int = 0; i < 5; i++)
			{
				output("\n");
				if (rand(2) == 0) ThrowPick(target, false);
				else ThrowNeedle(target, false);
			}
		}
		
		private function ThrowPick(target:Creature, bInitial:Boolean = true):void
		{
			if (bInitial)
			{
				energy( -15);

				output("The ganrael grabs the ‘shroom stalk of one of");
				if (hasStatusEffect("Unarmored")) output(" its");
				else output(" her"); 
				output(" picks and hurls it at you!");
			}
			else
			{
				output("The ganrael hurls a pick at you!");
			}
			
			if (rangedCombatMiss(this, target))
			{
				output(" You step aside ably.");
			}
			else
			{
				var dr:DamageResult = applyDamage(new TypeCollection( { kinetic: (bInitial ? 20 : 10) }, DamageFlag.PENETRATING), this, target, "suppress");
				
				if (dr.shieldDamage > 0 && dr.hpDamage <= 0) output(" It bounces off your shield, leaving a streak of jagged light that slowly fades.");
				else if (dr.hpDamage > 0) output(" It embeds itself, creating a painful, ragged puncture.");
				
				outputDamage(dr);
				
				if (dr.hpDamage > 0)
				{
					if (!target.hasStatusEffect("Bleeding")) output(" <b>You’re bleeding!</b>");
					else output(" <b>Your bleeding is aggravated further!</b>");
					CombatAttacks.applyBleed(target, 1, 3, 15);
				}
			}
		}
		
		private function ThrowNeedle(target:Creature, bInitial:Boolean = true):void
		{
			if (bInitial)
			{
				energy( -15);
				
				output("The alien pulls a needle from");
				if (!hasStatusEffect("Unarmored")) output(" under her plating");
				else output(" its skin");
				output(" and flings it at you!");
			}
			else
			{
				output("The ganrael hurls a needle at you!");
			}
			
			if (rangedCombatMiss(this, target))
			{
				output(" It whizzes by as you twist away.");
			}
			else
			{
				var dr:DamageResult = applyDamage(new TypeCollection( { kinetic: (bInitial ? 15 : 7.5) }, DamageFlag.PENETRATING), this, target, "suppress");
				
				if (dr.shieldDamage > 0 && dr.hpDamage <= 0) output(" It pings off your shield.");
				else if (dr.hpDamage > 0) output(" The needle’s splintered tip catches in your skin, causing pain every time you move!");
				
				outputDamage(dr);
				
				if (dr.hpDamage > 0)
				{
					if (target.hasStatusEffect("Bleeding"))
					{
						output(" <b>Your bleeding is aggravated further!</b>");
						target.addStatusValue("Bleeding", 1, 1);
						target.setStatusValue("Bleeding", 2, 3);
					}
				}
			}
		}
		
		public function CrystalBackhand(target:Creature):void
		{
			output("The ganrael casts aside " + CGender("her", "its") +" dignity and slaps at you with " + CGender("her", "its") +" hands!\n");
			if (hasStatusEffect("Blinded")) output(CGender("Her", "Its") +" frustration at being unable to see you comes out in wide, flailing blows!");
			
			var currDam:TypeCollection;
			var dam:TypeCollection 
			
			// switch out melee weapon based on armor state
			if (hasStatusEffect("Unarmored"))
			{
				// light kin dam
				dam = new TypeCollection( { kinetic: 10 } );
				currDam = meleeWeapon.baseDamage;
				meleeWeapon.baseDamage = dam;
			}
			else
			{
				// med kin crushing dam
				dam = new TypeCollection( { kinetic: 20 }, DamageFlag.CRUSHING);
				currDam = meleeWeapon.baseDamage;
				meleeWeapon.baseDamage = dam;
			}
			
			CombatAttacks.MeleeAttack(this, target);
			
			meleeWeapon.baseDamage = currDam;
		}
		
	}
}
