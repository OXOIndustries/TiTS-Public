package classes.Characters 
{
	import classes.CockClass;
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.ItemSlotClass;
	import classes.kGAMECLASS;
	import classes.Util.RandomInCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	import classes.Items.Miscellaneous.EmptySlot;
	import classes.Items.Melee.SurvivalAxe;
	import classes.Items.Guns.HuntingRifle;
	import classes.Items.Miscellaneous.Picardine;
	import classes.Items.Miscellaneous.Kirkite;
	import classes.Items.Miscellaneous.Satyrite;
	import classes.Items.Drinks.RedMyrVenom;

	import classes.GLOBAL;
	
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Engine.Combat.*; 
	import classes.Engine.Interfaces.output;
	
	/**
	 * ...
	 * @author My Butt
	 */
	
	public class MyrGoldSquad extends Creature
	{
		private var specialCD:int = 0;
					
		public function MyrGoldSquad() 
		{
			this._latestVersion = 1;
			this.version = this._latestVersion;
			this._neverSerialize = true; // Setting this will stop a given NPC class from ever being serialized.
			
			this.short = "gold squad";
			this.originalRace = "myrmedion";
			this.a = "the ";
			this.capitalA = "The ";
			this.tallness = 62;
			this.scaleColor = "gold";
			
			this.long = "";

			this.isPlural = true;
			
			shield = new EmptySlot();
			meleeWeapon = new SurvivalAxe();
			meleeWeapon.baseDamage.kinetic.damageValue = 25;
			rangedWeapon = new HuntingRifle();
			rangedWeapon.baseDamage.kinetic.damageValue = 28;

			armor.longName = "thick chitin";
			armor.defense = 14;
			armor.hasRandomProperties = false;
			
			this.physiqueRaw = 27;
			this.reflexesRaw = 32;
			this.aimRaw = 27;
			this.intelligenceRaw = 25;
			this.willpowerRaw = 26;
			this.libidoRaw = 20;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 25;
			
			baseHPResistances = new TypeCollection();
			baseHPResistances.kinetic.damageValue = 25.0;
			baseHPResistances.electric.damageValue = -25.0;
			baseHPResistances.tease.damageValue = -25.0;
			baseHPResistances.pheromone.damageValue = -25.0;
			baseHPResistances.drug.damageValue = -25.0;
			
			this.level = 7;
			this.XPRaw = normalXP();
			this.credits = 0;
			this.HPMod = 350;
			this.HPRaw = this.HPMax();
			
			//MUCH IS PLACEHOLDER DUE TO LACK OF MYR TYPE PARTS AT CODE TIME.
			this.femininity = 85;
			this.eyeType = 0;
			this.eyeColor = "black";
			this.thickness = 40;
			this.tone = 29;
			this.hairColor = "black";
			this.furColor = "black";
			this.hairLength = 3;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_SKIN;
			this.skinTone = "gold";
			this.skinFlags = new Array();
			this.faceType = 0;
			this.faceFlags = new Array();
			this.tongueType = 0;
			this.lipMod = 1;
			this.earType = 0;
			this.antennae = 2;
			this.antennaeType = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = 0;
			this.gills = false;
			this.wingType = 0;
			this.legType = 0;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE,GLOBAL.FLAG_CHITINOUS];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = 0;
			this.tailCount = 1;
			this.tailFlags = [GLOBAL.FLAG_CHITINOUS];
			
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
			this.hipRatingRaw = 6;
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
			this.buttRatingRaw = 6;
			
			//balls
			this.balls = 0;
			this.cumMultiplierRaw = 10;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 0;
			this.ballFullness = 100;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 4;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 9991;
			this.minutesSinceCum = 635;
			this.timesCum = 255;
			this.cockVirgin = true;
			this.vaginalVirgin = false;
			this.analVirgin = false;
			//Goo is hyper friendly!
			this.elasticity = 1;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 12;
			this.nippleColor = "red";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			this.milkRate = 1;
			this.ass.wetnessRaw = 0;
			this.ass.loosenessRaw = 3;

			//NO DIX
			this.cocks = new Array();
			//One normalish cunt
			this.vaginas = new Array();
			this.createVagina();
			this.vaginas[0].type = GLOBAL.TYPE_INHUMAN;
			this.vaginas[0].wetnessRaw = 2;
			this.vaginas[0].loosenessRaw = 3;
			
			isUniqueInFight = true;
			btnTargetText = "Gold Squad";
			
			createPerk("Can Crit",0,0,0,0);
			this.createStatusEffect("Flee Disabled", 0, 0, 0, 0, true, "", "", false, 0);
			//credits = rand(200);
			sexualPreferences.setRandomPrefs(2 + rand(3), 1);
			
			var foo:int = rand(3);
			switch(foo){
				case 0:	inventory.push(new Picardine()); break;
				case 1:	inventory.push(new Kirkite()); break;
				case 2:	inventory.push(new Satyrite()); break;
			}
			
			
			_isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return "GOLD_REMNANT_FIGHTER";
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			if(this.HPQ() <= 25 && !this.hasStatusEffect("Brute Wall"))
			{
				myrSquadCover(target);
				return;
			}
			
			var attacks:Array = new Array();
			if(target.hasArmor() && !target.hasStatusEffect("Sundered")) attacks.push(myrSquadSunder);
			if(!target.hasStatusEffect("Tripped")) attacks.push(myrSquadDogpile);
			//attacks.push(myrSquadShoot);
			attacks.push(myrSquadShoot);
			attacks.push(myrSquadCharge);
			
			attacks[rand(attacks.length)](target);			
		}
		
		private function myrSquadShoot(target:Creature):void
		{
			var damage:TypeCollection;
			var leftOverDamage:Number;
			
			output("The cluster of myrish soldiers take aim with their rifles and let loose a volley of rapid shots, working the bolts as quick as they can. ");
			
			aimMod += 15;
			if (!rangedCombatMiss(this, target)) 
			{
				output("You’re hammered with several successive shots, grazing your " + (target.shieldsRaw > 0 ? "shields" : " [pc.skinFurScales]") + ".");
				applyDamage(rangedDamage(), this, target, "minimal");
			}
			else output("Somehow you come out of it unharmed!");
			aimMod -= 15;
		}
		
		private function myrSquadCharge(target:Creature):void
		{
			output("<i>“Charge!”</i> one of the myr screams, before hurling herself at you brandishing a quartet of axes. Several of the others follow suit, lunges with long knives, hatchets, and any other sharp implement at hand. ");
			
			if (combatMiss(this, target))
			{
				output("You dodge past the first myr’s bull-rush, grab another and shove her back into her fellows, barreling the lof of them over and ending their charge.");
			}
			else
			{
				output("The sheer press of golden-plated bodies overwhelms your defenses, and you’re battered down by dozens of strikes and slashes!");
				
				var damage:TypeCollection = meleeDamage().multiply(1.2);
				if(target.hasStatusEffect("Tripped")) damage.multiply(2.5);
				applyDamage(damage, this, target, "minimal");
			}
		}
		
		private function myrSquadCover(target:Creature):void
		{
			output("Seeing things getting dangerous, one of the myr grabs her sisters, and together they push over one of the beds and flip the table, creating a barrier of cover for themselves. The remaining fighters crouch behind their impromptu barricade, for what that’s worth -- <b>it’ll be a little harder to hit them now, at least.</b>");
			this.createStatusEffect("Brute Wall", 0, 0, 0, 0, false, "DefenseUp", "The Myr Squad is behind makeshift cover!\nEvasion increased 20%.", true, 0, 0xFFFFFF);
		}
		
		private function myrSquadSunder(target:Creature):void
		{
			output("One of the myr lunges at you with a wickedly-sharp axe held in three hands, swinging it in an overhead blow. You dodge as best you can, ");
			
			if (combatMiss(this, target))
			{
				output("narrowly avoiding the deadly slice.");
			}
			else
			{
				output("but the blow slices into your [pc.armor], leaving you staggering back");
				
				var damage:TypeCollection = meleeDamage();
				damage.multiply(1.8);
				if(target.physique()/2 + rand(20) + 1 < this.physique()/2 + 13 || target.hasStatusEffect("Tripped"))
				{
					CombatAttacks.applySunder(target, 4);
					output(" with your armor in tatters. <b>It’s been sundered!</b>");
				}
				else output(".");
				applyDamage(damage, this, target, "minimal");
			}
		}
		
		private function myrSquadDogpile(target:Creature):void
		{
			output("Shrieking with rage, several of the myr lunge at you in a surge of hardened bodies. ");
			
			if((target.reflexes()/2 + rand(20) + 1 < this.reflexes()/2 + 13) && !target.isPlanted())
			{
				output("They leap on you, grabbing your arms and [pc.legs] and barreling you to the ground. You’re trapped beneath a writhing pile of bodies, all struggling to keep you from getting up while their sisters ready for another attack! <b>You’re prone!</b>");
				
				CombatAttacks.applyTrip(target);
			}
			else output("You manage to leap out of the way, letting the girls’ momentum carry them right past you. ");
		}
	}

}