package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Guns.PlasmaPistol;
	import classes.Items.Protection.DecentShield;
	import classes.Items.Miscellaneous.MightyTight;
	import classes.Items.Miscellaneous.Sterilex;
	import classes.Items.Miscellaneous.ChillPill;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Items.Transformatives.DrySpell;
	import classes.kGAMECLASS;
	
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Engine.Combat.*; 
	import classes.Engine.Interfaces.output;
	
	public class DoctorLash extends Creature
	{	
		//constructor
		public function DoctorLash()
		{
			this._latestVersion = 1;
			this.version = this._latestVersion;
			this._neverSerialize = true;
			
			inventory.push(new Sterilex());
			inventory.push(new MightyTight());
			inventory.push(new ChillPill());
			inventory.push(new DrySpell());
			
			sellMarkup = 1.5;
			keeperBuy = "You ask to see the doctor’s inventory.\n\nOpening a case lined with pill packets, the doctor responds, <i>“I’ll accept your credits if you are willing to end your species’ nasty habit of procreation. If one is not going to rid themselves of disgusting genitalia, then at least try to make them as useless as possible. Perhaps these can help...”</i>\n";
			keeperSell = ".....\n";
			keeperGreeting = ".....\n";
			
			this.short = "Dr. Lash";
			this.originalRace = "????";
			this.a = "";
			this.capitalA = "";
			this.long = "Doctor Lash is a six foot tall alien of indeterminate build; his labcoat conceals the bulk of his musculature. There’s no hiding his six arms - or the glowing weapons clutched in each of his long-fingered hands. His imperious gaze is channeled through a pair of glowing goggles, occasionally shifting to different colors as they cycle through various spectrums. There is not a shred of mercy upon his gray, unfeeling face.";
			this.customDodge = "Dr. Lash twists aside with surprising ease.";
			this.customBlock = "Obvious placeholder is obvious.";
			this.isPlural = false;
			
			this.rangedWeapon = new PlasmaPistol();
			this.rangedWeapon.hasRandomProperties = true;
			this.rangedWeapon.attackVerb = "shoot";
			this.rangedWeapon.attackNoun = "shot";
			
			this.armor.longName = "armor";
			this.armor.defense = 25;
			this.armor.hasRandomProperties = true;
			this.shield = new DecentShield();
			shield.hasRandomProperties = true;
			shield.shields = 400;
			
			this.level = 15;
			this.physiqueRaw = 35;
			this.reflexesRaw = 60;
			this.aimRaw = 45;
			this.intelligenceRaw = 75;
			this.willpowerRaw = 70;
			this.libidoRaw = 5;
			this.HPMod = 500;
			this.shieldsRaw = this.shieldsMax();
			this.HPRaw = this.HPMax();
			this.energyRaw = 100;
			this.lustRaw = 1;
			this.XPRaw = bossXP();

			baseHPResistances = new TypeCollection();
			baseHPResistances.drug.resistanceValue = 80.0;
			baseHPResistances.tease.resistanceValue = 85.0;
			
			this.credits = 999999;
			
			this.femininity = 0;
			this.eyeType = 0;
			this.eyeColor = "crimson";
			//============THESE VALUES BE PLACEHOLDER, YAR ================//
			this.tallness = 75;
			this.thickness = 15;
			this.tone = 85;
			this.hairColor = "none";
			this.scaleColor = "";
			this.furColor = "";
			this.hairLength = 0;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_SKIN;
			this.skinTone = "gray";
			this.skinFlags = new Array();
			this.faceType = 0;
			this.faceFlags = new Array();
			this.tongueType = 0;
			this.addTongueFlag(GLOBAL.FLAG_LONG);
			this.lipMod = 0;
			this.earType = 0;
			this.antennae = 0;
			this.antennaeType = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = 0;
			this.gills = false;
			this.wingType = 0;
			this.legType = 0;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = 0;
			this.tailCount = 0;
			this.tailFlags = [GLOBAL.FLAG_FLUFFY];
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
			this.hipRatingRaw = 0;
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
			this.buttRatingRaw = 2;
			//No dicks here!
			this.cocks = new Array();
			//balls
			this.balls = 0;
			this.cumMultiplierRaw = 0;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 3;
			this.ballFullness = 100;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 30;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 1;
			this.minutesSinceCum = 2000;
			this.timesCum = 27;
			this.cockVirgin = false;
			this.vaginalVirgin = true;
			this.analVirgin = true;
			//Goo is hyper friendly!
			this.elasticity = 1;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1;
			this.clitLength = .25;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 0;
			this.nippleColor = "dark gray";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			this.ass.loosenessRaw = 1;

			this.createPerk("Multiple Attacks",5,0,0,0,"");
			this.createPerk("Multiple Shots",5,0,0,0,"");
			this.createStatusEffect("Flee Disabled",0,0,0,0,true,"","",false,0);
			createStatusEffect("Disarm Immune", 0, 0, 0, 0, true, "", "", false, 0);
			
			isUniqueInFight = true;
			btnTargetText = "Dr. Lash";
			sexualPreferences.setRandomPrefs(0,1);
			
			_isLoading = false;
		}	
		
		override public function get bustDisplay():String
		{
			return "DR_LASH";
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			output("<i>“Goodbye,”</i> the doctor bids.\n");
			CombatAttacks.RangedAttack(this, target);
		}
		
		override public function onLeaveBuyMenu():void
		{
			kGAMECLASS.mainGameMenu();
		}
	}
}