package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Guns.TeyaalsHeavyPlasmaCaster;
	import classes.Items.Protection.ImprovisedShield;
	import classes.Items.Piercings.GeddaniumRingPiercing;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.Engine.Interfaces.output;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Engine.Combat.DamageTypes.DamageResult;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.*;
	import classes.Engine.Interfaces.author;
	
	public class Teyaal extends Creature
	{
		//constructor
		public function Teyaal()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "Dr. Teyaal";
			this.originalRace = "gryvain";
			this.a = "";
			this.capitalA = "";
			this.long = "She’s a tall, voluptuous gryvain - a real paragon of that draconic race, with blue-hued scales covering her forelimbs all the way up to her waist, and a quartet of mighty wings beating powerfully behind her. A pair of gnarled horns sweep back over a wild mane of azure hair, giving her a feral appearance when matched with her pronounced fangs. Teyaal’s largely nude, with only a lab coat buttoned once underneath her matronly bosom. She’s drawn an overcharged plasma hand cannon, crackling with barely-constrained energy at the muzzle.";

			this.customDodge = "Dr. Teyaal slides aside, wings flapping.";
			this.customBlock = "Bluh.";
			this.isPlural = false;
			
			this.meleeWeapon.attackVerb = "swipe";
			this.meleeWeapon.attackNoun = "claw";
			this.meleeWeapon.longName = "claws";
			
			meleeWeapon.baseDamage.kinetic.damageValue = 2;
			meleeWeapon.addFlag(DamageFlag.PENETRATING);
			
			this.meleeWeapon.hasRandomProperties = true;

			this.rangedWeapon = new TeyaalsHeavyPlasmaCaster();
			this.rangedWeapon.baseDamage.burning.damageValue = 15;
			this.rangedWeapon.hasRandomProperties = true;
			
			this.armor.longName = "lab coat";
			this.armor.description = "a lab coat";
			this.armor.defense = 0;
			this.armor.hasRandomProperties = true;

			this.shield = new ImprovisedShield();
			this.shield.shields = 700;
			this.shield.hasRandomProperties = true;
			
			this.physiqueRaw = 23;
			this.reflexesRaw = 35;
			this.aimRaw = 45;
			this.intelligenceRaw = 50;
			this.willpowerRaw = 39;
			this.libidoRaw = 50;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 5;
			this.level = 10;
			this.XPRaw = bossXP();
			this.credits = 3309;
			this.HPMod = 25;
			this.HPRaw = this.HPMax();
			this.shieldsRaw = this.shieldsMax();

			this.characterClass = GLOBAL.CLASS_ENGINEER;

			this.femininity = 100;
			this.eyeType = GLOBAL.TYPE_GRYVAIN;
			this.eyeColor = "gold";
			this.tallness = 84;
			this.thickness = 75;
			this.tone = 20;
			this.hairColor = "azure";
			this.scaleColor = "blue";
			this.furColor = "blue";
			this.hairLength = 14;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_SCALES;
			this.skinTone = "pale";
			this.skinFlags = [];
			
			this.faceType = GLOBAL.TYPE_HUMAN;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_GRYVAIN;
			this.lipMod = 0;
			this.earType = GLOBAL.TYPE_GRYVAIN;
			this.antennae = 0;
			this.antennaeType = 0;
			this.horns = 2;
			this.hornType = GLOBAL.TYPE_GRYVAIN;
			this.hornLength = 10;
			this.armType = GLOBAL.TYPE_GRYVAIN;
			this.gills = false;
			this.wingType = GLOBAL.TYPE_GRYVAIN;
			this.legType = GLOBAL.TYPE_GRYVAIN;
			this.wingCount = 4;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE, GLOBAL.FLAG_SCALED];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_GRYVAIN;
			this.tailCount = 1;
			this.tailFlags = [GLOBAL.FLAG_SCALED,GLOBAL.FLAG_LONG,GLOBAL.FLAG_PREHENSILE];
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
			this.hipRatingRaw = 19;
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
			this.buttRatingRaw = 12;
			//No dicks here!
			this.cocks = new Array();
			//balls
			this.balls = 0;
			this.cumMultiplierRaw = 100;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 30;
			this.ballFullness = 100;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 60;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 9991;
			this.minutesSinceCum = 45;
			this.timesCum = 25002;
			this.cockVirgin = false;
			this.vaginalVirgin = false;
			this.analVirgin = false;
			this.vaginas = new Array();
			this.cocks = new Array();
			this.createCock();
			this.cocks[0].cLengthRaw = 12;
			this.cocks[0].cockColor = "blue";
			this.cocks[0].cType = GLOBAL.TYPE_GRYVAIN;
			//Goo is hyper friendly!
			this.elasticity = 1;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1.0;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 10;
			this.breastRows[0].piercing = new GeddaniumRingPiercing();

			this.nippleColor = "blue";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 1;
			this.ass.wetnessRaw = 0;
			this.ass.loosenessRaw = 1;
			this.ass.bonusCapacity = 1000;

			this.createVagina();
			this.vaginas[0].wetnessRaw = 3;
			this.vaginas[0].loosenessRaw = 4;
			this.vaginas[0].type = GLOBAL.TYPE_GRYVAIN;
			this.vaginas[0].vaginaColor = "blue";
			this.vaginas[0].clits = 20;
			
			//this.createStatusEffect("Disarm Immune");
			createStatusEffect("Force Fem Gender");

			this.inventory.push(new TeyaalsHeavyPlasmaCaster());
			
			isUniqueInFight = true;
			btnTargetText = "Dr.Teyaal";
			sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_BUTTS, GLOBAL.REALLY_LIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_SCALIES, 	GLOBAL.REALLY_LIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_COCKS, 	GLOBAL.KINDA_LIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_HYPER, 	GLOBAL.REALLY_DISLIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_MASCULINE, GLOBAL.REALLY_DISLIKES_SEXPREF);

			this.createPerk("Deadly Shock");
			this.createStatusEffect("Flee Disabled", 0, 0, 0, 0, true, "", "", false, 0);

			this._isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return "TEYAAL";
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			//Charge shield
			if (!this.hasStatusEffect("Shield Charged")) chargeShield(alliedCreatures,hostileCreatures,target);
			//Switch to lust mode!
			else if(!this.hasStatusEffect("LUST MODE") && this.shields() <= 0) teyalShieldsPopped4Gud();
			//Evasion Boost
			else if(!this.hasStatusEffect("Evasion Boost") && rand(3) == 0 && energy() >= 33) takeWing();
			//Paralyze~
			else if (nextParalyzeAvailable >= CombatManager.getRoundCount() && energy() >= 15) paralyzeShock(alliedCreatures,hostileCreatures,target);

			else if(this.hasStatusEffect("LUST MODE")) teaseModeAttacksGo(target);
			else if(hasStatusEffect("Disarmed"))
			{
				output("Dr. Tayaal scowls but moves carefully, recovering her energy.");
				this.energy(25);
			}
			else plasmaBoltAttack(target);
		}
		private var nextParalyzeAvailable:int = -1;
		//Paralyzing Shock
		public function paralyzeShock(alliedCreatures:Array, hostileCreatures:Array, target:Creature):void
		{
			energy(-15);
			//Has the Deadly Shock perk added on. Put on a 4-round CD.
			//As per PC ability
			nextParalyzeAvailable = CombatManager.getRoundCount()+4;
			CombatAttacks.ParalyzingShockImpl(alliedCreatures, hostileCreatures, this, target);
		}
		//Charge Shield
		//As per PC ability. 1/encounter.
		public function chargeShield(alliedCreatures:Array, hostileCreatures:Array, target:Creature):void
		{
			CombatAttacks.ChargeShieldImpl(alliedCreatures, hostileCreatures, this, target);
			this.createStatusEffect("Shield Charged");
		}
		//Plasma Bolt
		//Basic attack. Has a chance to inflict Burning DoT.
		public function plasmaBoltAttack(target:Creature):void
		{
			output("Teyaal wings backwards, planting her feet on the bulkhead and digging her clawed digits in as she squeezes the trigger on her hand cannon. The barrel glows with baleful light before erupting in a stream of argent plasma that ");
			if(rangedCombatMiss(this, target)) output("blasts right past you, searing the walls");
			else 
			{
				output("slams into you with searing force!");
				applyDamage(damageRand(rangedDamage(), 20), this, target, "minimal");
				if(rand(3) == 0 && !target.hasStatusEffect("Burn")) 
				{
					CombatAttacks.applyBurn(target, 3);
					output(" The burning plasma clings to you, burning horribly!");
				}
			}
		}
		//Take Wing!
		//Raise her Evasion for ~3 turns.
		public function takeWing():void
		{
			this.energy(-33);
			output("The gryvain spreads her wings and launches herself backwards, hovering just out of reach. While she might have been slow on the ground, she’s suddenly taken on a grace and speed that seems almost unnatural. <b>She’ll be harder to hit now!</b>");
			createStatusEffect("Evasion Boost",45,0,0,0,false,"Icon_DefUp","+45% Evasion!",true,3);
		}
		//When Teyaal’s shields are finally broken for realz, play the following at the start of her turn:
		public function teyalShieldsPopped4Gud():void
		{
			output("With the concussive <i>bang!</i> of her shields buckling, Dr. Teyaal stumbles back, breathing hard. One particularly deep breath causes the button to pop on her jacket, sending it flying as her tits spill out of their confines.");
			output("\n\n<i>“Oh, you ignorant slave... or slave-to-be! I will not let you stand between me and greatness! I have been denied my freedom for far too long!”</i>");
			output("\n\nShe grabs her tits in both hands, sauntering towards you with fierce determination. A rivulet of milk streams from each of her cobalt nipples, staining her fingers. <i>“I’m going to make you my slave, claim the reward out on you, and ride your face all the way to the stars when this damned ship is done. Get ready for it!”</i>");
			this.createStatusEffect("LUST MODE");
		}
		//Teyaal now uses Tease attacks instead of Plasma bolts. Continues to use other abilities.
		//Tease Attack
		public function teaseModeAttacksGo(target:Creature):void
		{
			output("Teyaal grabs her tits and gives them a squeeze, causing a trickle of milk to leak from each. Her dick throbs and bobs with the sway of her hips, swinging ropes of lurid pre-cum around her office. <i>“Get used to the sight, my young slave. You’ll be seeing these every day for the rest of your life now!”</i>");
			if(target.willpower()/2+rand(20)+1 > 39) output("\n\nYou shrug off the licentious display.");
			else applyDamage(damageRand(new TypeCollection( { tease: 20 } ),20), target, this,"minimal");
		}
	}
}
