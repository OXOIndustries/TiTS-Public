package classes.Characters 
{
	import classes.CockClass;
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Items.Melee.NyreanSpear;
	import classes.Items.Miscellaneous.EmptySlot;
	import classes.Items.Protection.DecentShield;
	import classes.Items.Armor.PolishedPlate;
	import classes.ItemSlotClass;
	import classes.kGAMECLASS;
	import classes.Util.RandomInCollection;
	
	import classes.GLOBAL;
	
	import classes.Engine.Combat.*;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Engine.Interfaces.output;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	
	import classes.Engine.Utility.weightedRand;
	
	/**
	 * ...
	 * @author Gedan
	 */
	
	public class Queensguard extends Creature
	{
		
		public function Queensguard() 
		{
			this._latestVersion = 1;
			this.version = this._latestVersion;
			this._neverSerialize = true; // Setting this will stop a given NPC class from ever being serialized.
			
			this.short = "Queensguard";
			this.originalRace = "nyrea";
			this.a = "";
			this.capitalA = "";
			this.tallness = 72;
			this.scaleColor = "green";
			
			long = "Queensguard, the knightly nyrean warrior, stands between you and Queen Taivra - and the probe that makes up her throne. The warrior before you is clad from head to toe in heavy metal plates, like a medieval soldier’s, supplementing her natural chitin with forged steel. She carries a hefty kite-style shield, bearing the same crest as the tyrant she serves’, plus a glistening longsword that twirls about her with expert skill. Clearly the queen has chosen her personal guard well!\n\nYou can see Dane and [rival.name] in their cages, just behind the valiant knight. They’re both yelling and screaming, much to the disdain of their huntresses standing guard by the cages. <b>You’re too far away to try and break them out - and Queensguard is blocking any chance of shooting them out.</b>";
			
			this.isPlural = false;
			
			this.meleeWeapon = new NyreanSpear();
			this.meleeWeapon.hasRandomProperties = true;
			this.meleeWeapon.attackVerb = "slash";
			this.meleeWeapon.attackNoun = "slash";
			this.meleeWeapon.longName = "polished longsword";
			this.meleeWeapon.baseDamage.kinetic.damageValue = 4;
			this.armor = new PolishedPlate();
						
			this.physiqueRaw = 22;
			this.reflexesRaw = 22;
			this.aimRaw = 20;
			this.intelligenceRaw = 15;
			this.willpowerRaw = 15;
			this.libidoRaw = 80;
			this.shieldsRaw = this.shieldsMax();
			this.energyRaw = 100;
			this.lustRaw = 25;
			
			baseHPResistances = new TypeCollection();
			baseHPResistances.kinetic.damageValue = 25.0;
			baseHPResistances.electric.damageValue = 25.0;
			baseHPResistances.burning.damageValue = 25.0;
			
			this.level = 8;
			this.XPRaw = normalXP();
			this.credits = 0;
			this.HPMod = 130;
			this.HPRaw = this.HPMax();
			
			this.femininity = 100;
			this.eyeType = 0;
			this.eyeColor = "red";
			this.thickness = 40;
			this.tone = 29;
			this.hairColor = "red";
			this.furColor = "tawny";
			this.hairLength = 0;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_SCALES;
			this.skinTone = "pink";
			this.skinFlags = new Array();
			this.faceType = GLOBAL.TYPE_NYREA;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_NYREA;
			this.lipMod = 1;
			this.earType = GLOBAL.TYPE_NYREA;
			this.antennae = 0;
			this.antennaeType = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = 0;
			this.gills = false;
			this.wingType = 0;
			this.legType = GLOBAL.TYPE_NYREA;
			this.legCount = 2;
			this.legFlags = [];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = 0;
			this.tailCount = 0;
			this.tailFlags = [];
			
			//Used to set cunt or dick type for cunt/dick tails!
			this.tailGenitalArg = 0;
			//tailGenital:
			//0 - none.
			//1 - cock
			//2 - vagina
			this.tailGenital = 0;
			//Tail venom is a 0-100 slider used for tail attacks. Recharges per hour.
			this.tailVenom = 0;
			//Tail recharge determines how fast venom/webs comes back per hour.
			this.tailRecharge = 5;
			//hipRating
			//0 - boyish
			//2 - slender
			//4 - average
			//6 - noticable/ample
			//10 - curvy//flaring
			//15 - child-bearing/fertile
			//20 - inhumanly wide
			this.hipRatingRaw = 10;
			//buttRating
			//0 - buttless
			//2 - tight
			//4 - average
			//6 - noticable
			//8 - large
			//10 - jiggly
			//13 - expansive
			//16 - huge
			//20 - inconceivably large/big/huge etc
			this.buttRatingRaw = 10;
			//No dicks here!
			this.cocks = new Array();
			//balls
			this.balls = 0;
			this.cumMultiplierRaw = 1.5;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 2;
			this.ballFullness = 100;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 4;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 9991;
			this.minutesSinceCum = 9000;
			this.timesCum = 122;
			this.cockVirgin = true;
			this.vaginalVirgin = false;
			this.analVirgin = true;
			//Goo is hyper friendly!
			this.elasticity = 3;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 6;
			this.nippleColor = "green";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			this.milkRate = 1;
			this.ass.wetnessRaw = 0;
			this.ass.loosenessRaw = 2;
			
			this.hairLength = 10;
			
			this.cocks = [];
			this.createVagina();
			this.vaginas[0].type = GLOBAL.TYPE_INHUMAN;
			this.vaginas[0].wetnessRaw = 2;
			this.vaginas[0].loosenessRaw = 3;
			this.vaginas[0].hymen = false;
			this.vaginalVirgin = false;
			this.analVirgin = false;
			//createStatusEffect("Force Male Gender");
			createStatusEffect("Force Fem Gender");
			this.createStatusEffect("Flee Disabled",0,0,0,0,true,"","",false,0);
			
			isUniqueInFight = true;
			btnTargetText = "Queensguard";
			sexualPreferences.setRandomPrefs(8, 2);
			this._isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return "QUEENSGUARD";
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			queensguardLongUpdate(target);
			
			if(HP()/HPMax() < 0.6 && statusEffectv1("Fungaled") < 3) queensGuardFungalButts();
			else if(lust() >= 75 && !hasStatusEffect("Focused")) queensGuardLust(target);
			else if(rand(5) == 0 && !hasStatusEffect("Disarmed")) queensGuardThunderKick(target);
			else if(rand(3) == 0 || hasStatusEffect("Disarmed")) queensguardShieldBash(target);
			else if(!target.hasStatusEffect("Stunned") && rand(5) == 0) powerAttackQueensguard(target);
			else sliceAndDiceQueenieGuardieRetardie(target);
		}
		
		public function queensguardLongUpdate(target:Creature):void
		{
			long = "Queensguard, the knightly nyrean warrior, stands between you and Queen Taivra - and the probe that makes up her throne. The warrior before you is clad from head to toe in heavy metal plates, like a medieval soldier’s, supplementing her natural chitin with forged steel. She carries a hefty kite-style shield, bearing the same crest as the tyrant she serves’, plus a glistening longsword that twirls about her with expert skill. Clearly the queen has chosen her personal guard well!";
			long += "\n\nYou can see Dane and [rival.name] in their cages, just behind the valiant knight. They’re both yelling and screaming, much to the disdain of their huntresses standing guard by the cages. <b>";
			if(target.statusEffectv1("Cage Distance") == 2) long += "You’re too far away to try and break them out - and Queensguard is blocking any chance of shooting them out.";
			else if(target.statusEffectv1("Cage Distance") == 1) long += "You’re about half way to Dane and [rival.name]’s cages now!";
			else long += "You’re close enough to bash the lock to Dane’s cage if you wanted. Maybe the big bastard could help you out!";
			long += "</b>";
		}
		
		private function weaponToggle(toShield:Boolean = false):void
		{
			if (toShield == false)
			{
				meleeWeapon.attackVerb = "slash";
				meleeWeapon.attackNoun = "slash";
				meleeWeapon.longName = "polished longsword";
				meleeWeapon.baseDamage.kinetic.damageValue = 4;
			}
			else
			{
				meleeWeapon.attackVerb = "smack";
				meleeWeapon.attackNoun = "smack";
				meleeWeapon.longName = "shield";
				meleeWeapon.baseDamage.kinetic.damageValue = -4;
			}
		}
		
		private function queensGuardLust(target:Creature):void
		{
			output("<i>“Calm yourself, dearest,”</i> Taivra murmurs from her throne, still fucking away at her harem with her bushel of tentacle cocks. <i>“Focus on the fight.”</i>");
			output("\n\nQueensguard tries to nod, but you can see her breathing hard... see her knees quaking ever so slightly. She clearly wants what you’re selling!");
			output("\n\n<i>“Beat this star-walker, my guardian, and I promise I will breed you. It’s been so many years, hasn’t it? Do you even remember what it’s like to feel your belly swelling with our young? Think of me, my dearest - don’t let your lusts wander from me now.”</i>");
			output("\n\nThe Queensguard takes a deep breath to steady herself, turning her amethyst-colored eyes to you with renewed vigor.");
			lust(-30);
			output(" (-30 Lust)");
			createStatusEffect("Focused",0,0,0,0);
		}
		
		private function queensGuardThunderKick(target:Creature):void
		{
			output("Queensguard feints, drawing your defenses to her sword, only to kick you square in the gut. You stumble back, but she’s not done yet: the knight pirouettes and slams her shield into you");
			if(!target.isPlanted())
			{
				output(", <b>leaving you staggered</b>");
				if (target.hasStatusEffect("Staggered"))
				{
					target.setStatusValue("Staggered", 1, 5);
				}
				else
				{
					CombatAttacks.applyStagger(target, 5);
				}
			}
			else output("--the impact almost staggering you, but you are too firmly planted to the ground for that to happen");
			output(".");
			applyDamage(meleeDamage(), this, target, "melee");
		}
		
		private function queensGuardFungalButts():void
		{
			output("Queensguard grabs a vial from her belt and pulls up her helm’s visor, just enough to knock back the soupy liquid within - and give you a hint of a scarred, but firmly feminine face underneath. (+50 HP)");
			HP(50);
			if(!hasStatusEffect("Fungaled")) createStatusEffect("Fungaled",0,0,0,0);
			else addStatusValue("Fungaled",1,1);
		}
		
		private function powerAttackQueensguard(target:Creature):void
		{
			output("The nyrean knight bellows out a warcry and leaps at you, sword held overhead for a brutal strike! ");
			if(combatMiss(this, target))
			{
				output("You manage to dodge, avoiding what could very well have been a lethal blow!");
			}
			else
			{
				output("You try and block, but to no avail! Queensguard’s sword slams into you with bone-crushing force, throwing you back and leaving you reeling.");
				var damage:TypeCollection = damage();
				damage.add(physique() / 2);
				damage.multiply(1.4);
				damageRand(damage, 15);
				applyDamage(damage, this, target, "melee");
				if(physique()/2 + rand(20) + 1 >= target.physique()/2 + 10 && !target.hasStatusEffect("Stunned"))
				{
					output("\n<b>You’re stunned by the blow!</b>");
					CombatAttacks.applyStun(target, 1);
				}
			}
		}
		
		private function sliceAndDiceQueenieGuardieRetardie(target:Creature):void
		{
			var damage:DamageResult = new DamageResult();
			
			output("Queensguard charges you, swinging her blade in a wide arc. You ");
			if(combatMiss(this, target)) output("parry it");
			else
			{
				output("stagger back as it strikes you");
				damage.addResult(applyDamage(meleeDamage(), this, target, "suppress"));
			}
			output(", only to ");
			if(!combatMiss(this, target)) 
			{
				output("be slammed with her shield a moment later");
				weaponToggle(true);
				damage.addResult(applyDamage(meleeDamage(), this, target, "suppress"));
				weaponToggle(false);
			}
			else output("have to dodge a shield swipe a second later");
			output(". A third strike, with her sword again this time, follows up, lunging for your chest. You ");
			if(combatMiss(this, target)) output("barely manage to dodge it");
			else
			{
				output("yelp as the blade slams into you, leaving you reeling");
				damage.addResult(applyDamage(meleeDamage(), this, target, "suppress"));
			}
			output("!");
			
			if (damage.totalDamage > 0) outputDamage(damage);
		}
		
		private function queensguardShieldBash(target:Creature):void
		{
			output("With a battle roar that reverberates off the stone walls, the Queensguard charges forward shield-first, trying to slam the steel bulwark into you!");
			if(combatMiss(this, target))
			{
				output("\nYou nimbly side-step the attack, letting the nyrean knight’s momentum carry her right past you!");
			}
			else
			{
				output("\nYou catch the sides of her shield, grunting with effort and pain as steel slams against your ");
				if(!(target.armor is EmptySlot)) output("[pc.armor]");
				else output("bare [pc.skinFurScales]");
				output(".");

				output(" The sheer weight of the impact");
				if((target.physique() + rand(20) + 1 >= physique() + 10) || target.isPlanted()) output(" nearly staggers you");
				else
				{
					if(target.statusEffectv1("Cage Distance") < 2) 
					{
						output(", forcing you back");
						target.addStatusValue("Cage Distance",1,1);
						queensguardLongUpdate(target);
					}
					else
					{
						output(", knocking the wind out of you enough that the knight is easily able to strike you again, sending you flat on your back. <b>You’re knocked prone!</b>");
						CombatAttacks.applyTrip(target);
					}
				}
				output("!");
				//Swap in shield and back out to sword
				weaponToggle(true);
				applyDamage(meleeDamage(), this, target, "minimal");
				weaponToggle(false);
			}
		}
		
	}

}
