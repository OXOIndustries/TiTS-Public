package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	//import classes.Items.Guns.*
	import classes.Items.Protection.BasicShield;
	import classes.Items.Melee.RaskvelWrench;
	//import classes.Items.Miscellaneous.*
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.GameData.CodexManager;
	import classes.GameData.CombatManager;
	import classes.GameData.CombatAttacks;
	import classes.Engine.Interfaces.output;
	import classes.Engine.Combat.*;
	import classes.Engine.Combat.DamageTypes.*;
	
	public class LapinaraFemale extends Creature
	{
		//constructor
		public function LapinaraFemale()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "female lapinara";
			this.originalRace = "lapinara";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = ""; // Implementation in prepForCombat
			this.customBlock = "Somehow, the attack doesn't penetrate the lapinara's fur!";
			this.customDodge = "The lapinara uses its small size to slip out of the way.";
			this.isPlural = false;
			
			meleeWeapon.baseDamage.kinetic.damageValue = 2;
			this.meleeWeapon.attack = 0;
			this.meleeWeapon.longName = "fist";
			this.meleeWeapon.attackVerb = "punch";
			this.meleeWeapon.attackNoun = "punch";
			this.meleeWeapon.hasRandomProperties = true;
			
			rangedWeapon.baseDamage.kinetic.damageValue = 1;
			this.rangedWeapon.attack = 0;
			this.rangedWeapon.longName = "rock";
			this.rangedWeapon.attackVerb = "smash";
			this.rangedWeapon.attackNoun = "smash";
			this.rangedWeapon.hasRandomProperties = true;
			
			this.armor.longName = "thick fur";
			this.armor.defense = 1;
			this.armor.hasRandomProperties = true;
			
			this.shield = new BasicShield();

			this.physiqueRaw = 7;
			this.reflexesRaw = 10;
			this.aimRaw = 10;
			this.intelligenceRaw = 5;
			this.willpowerRaw = 5;
			this.libidoRaw = 70;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 50;
			
			this.level = 2;
			this.XPRaw = normalXP();
			this.credits = 25;
			this.HPMod = -10;
			this.HPRaw = this.HPMax();
			this.shieldsRaw = this.shieldsMax();

			this.femininity = 85;
			this.eyeType = GLOBAL.TYPE_RASKVEL;
			this.eyeColor = "cloudy";
			this.tallness = 48;
			this.thickness = 42;
			this.tone = 44;
			this.hairColor = "PLACEHOLDER";
			this.hairType = GLOBAL.TYPE_RASKVEL;
			this.scaleColor = "blue";;
			this.furColor = "PLACEHOLDER";
			this.hairLength = 12;
			
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_FUR;
			this.skinTone = "pale";
			this.skinFlags = new Array();
			this.faceType = GLOBAL.TYPE_RASKVEL;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_RASKVEL;
			this.lipMod = 0;
			this.earType = 0;
			this.antennae = 0;
			this.antennaeType = GLOBAL.TYPE_HUMAN;
			this.horns = 2;
			this.hornType = GLOBAL.TYPE_DEMONIC;
			this.armType = GLOBAL.TYPE_HUMAN;
			this.gills = false;
			this.wingType = GLOBAL.TYPE_HUMAN;
			this.legType = GLOBAL.TYPE_RASKVEL;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_RASKVEL;
			this.tailCount = 1;
			this.tailFlags = new Array();
			this.addTailFlag(GLOBAL.FLAG_LONG);
			this.addTailFlag(GLOBAL.FLAG_PREHENSILE);
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
			this.buttRatingRaw = 8;
			//No dicks here!
			this.cocks = new Array();
			this.createVagina();
			this.girlCumType = GLOBAL.FLUID_TYPE_GIRLCUM;
			this.vaginalVirgin = false;
			this.vaginas[0].loosenessRaw = 2;
			this.vaginas[0].wetnessRaw = 4;
			this.vaginas[0].bonusCapacity = 10;
			this.vaginas[0].vaginaColor = "pink";
			this.vaginas[0].type = GLOBAL.TYPE_LAPINARA;
			//balls
			this.balls = 0;
			this.cumMultiplierRaw = 6;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 0;
			this.ballFullness = 1;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 10;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 6;
			this.minutesSinceCum = 420;
			this.timesCum = 1111;

			this.elasticity = 1.4;
			this.fertilityRaw = 1.05;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;

			this.breastRows[0].breastRatingRaw = 0;
			this.nippleColor = "purple";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			this.ass.bonusCapacity += 15;
			
			isUniqueInFight = true;
			btnTargetText = "Lapinara";
			randomise();
			
			this._isLoading = false;
		}
		
		private function randomise():void
		{
			sexualPreferences.setRandomPrefs(3 + rand(3));
			tallness = 36 + rand(13);
			//Hair
			if(rand(3) == 0) hairColor = "white";
			else if(rand(2) == 0) hairColor = "silver";
			else hairColor = "gray";
			furColor = hairColor;
			
			long = "A typical example of the parasitic gender, according to your Codex, the lapinara stands at no more than " + height() + " tall. From her head grows medium-length, wild " + hairColor + " hair styled into a perm. A pair of metal-reinforced horns poke out from under her bangs. A long, whip-like tail hangs from above her ass, thrashing about menacingly. She wears a rather intimidating spiked gauntlet on each hand, her chest protected by a metal armor plate. There is a leather belt about her waist, holding an assortment of syringes at her side, likely drugs. She is unarmored from the waist down, her pseudopenis ovipositor standing at attention, faux testicles heavy and swollen with the eggs that they're holding."
			ass.loosenessRaw = rand(4) + 1;
			vaginas[0].loosenessRaw = rand(4) + 1;
			credits = 25+rand(25);
		}
		
		override public function get bustDisplay():String
		{
			return (hairColor == "silver" ? "LAPINARA_2" : "LAPINARA");
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			if(rand(3) == 0) lapinaraHornCharge(target);
			else if(rand(2) == 0) lapinaraFalconPunch(target);
			else lapinaraBite(target);
		}
		
		private function lapinaraHornCharge(target:Creature):void
		{
			if(combatMiss(this, target)) output("The lapinara charges at you. Thanks to your evasive skills, you manage to sidestep her attack. She stumbles slightly as she misses her target.");
	//Hit (shield is down): 
			else
			{
				var damage:TypeCollection = meleeDamage();
				damage.add(8);
				damageRand(damage, 15);
				
				if(target.shields() > 0) 
				{
					output("The lapinara charges at you, ramming your shield.");
					applyDamage(damage, this, target);
				}
				else
				{
					//Hit (backfire, rare; requires armor):
					if (target.armor.defense > 0 && rand(3) == 0) 
					{
						output("The lapinara charges at you, ramming you. However, thanks to your protective armor, she is instead knocked aback, stunned.");
						createStatusEffect("Stunned",1,0,0,0,false,"Stun","Cannot act for a turn.",true,0,0xFF0000);
					}
					else 
					{
						output("The lapinara charges at you, ramming you, the painful impact briefly staggering you.");
						applyDamage(damage, this, target);
					}
				}
			}
		}
		
		private function lapinaraFalconPunch(target:Creature):void
		{
			if(combatMiss(this, target)) output("The lapinara attempts to swing at you, but you deftly dodge and deflect every punch she sends your way.");
			else {
				if(target.shields() > 0) output("The lapinara punches, aiming for your gut, but instead connecting with your shield.");
				else output("The lapinara delivers a swift blow to your gut, briefly doubling you over. Ow.");
				
				var damage:TypeCollection = meleeDamage();
				damageRand(damage, 15);
				applyDamage(damage, this, target);
			}
		}
		
		private function lapinaraBite(target:Creature):void
		{
			var damage:TypeCollection = new TypeCollection( { kinetic: 5 + (physique() / 2) }, DamageFlag.PENETRATING);
	damageRand(damage, 15);
	
			//Dodge: 
			if(combatMiss(this, target)) output("The lapinara lunges at you. Thanks to your evasive skills, you manage to sidestep her attack. She stumbles slightly as she misses her target.");
			else
			{
				//Hit (shield is up): 
				if(target.shields() > 0) output("The lapinara lunges forward, attempting to bite you. Instead, her powerful teeth connect with your shield. She jumps back, rubbing her mouth in pain.");
				//Hit (shield is down):
				else output("The lapinara lunges forward, grabbing ahold of your arm and painfully sinking her teeth into your flesh.");
				applyDamage(damage, this, target);
			}
		}
	}
}
