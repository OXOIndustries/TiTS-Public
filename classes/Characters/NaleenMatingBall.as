package classes.Characters
{
	import classes.Creature;
	import classes.GameData.SingleCombatAttack;
	import classes.GLOBAL;
	import classes.Items.Miscellaneous.NaleenNip;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.GameData.CodexManager;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.GameData.CombatManager;
	import classes.GameData.CombatAttacks;
	import classes.Engine.Interfaces.output;
	import classes.Engine.Combat.*;
	
	public class NaleenMatingBall extends Creature
	{
		//constructor
		public function NaleenMatingBall()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "dozens of naleen";
			this.originalRace = "naleen";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = "You are embroiled in the Naleen Mating Ball! Here, deep in the caverns below the waterfall, a whole host of the feline naga have made a wide hollow their own, and are in the middle of enthusiastically expressing their desire for the naleen race to persist. Their smooth, leathery coils and soft fur shifts languorously beneath your [pc.skinFurScales], and the smell of musk and excitement is overpowering in the still, oppressive darkness. You can’t tell how many of them there are - their sibilant hisses, titters and moans echo back to you through the caves, as if the whole warren is carpeted with serpent shag - however the ratio of fluffy boobs to double dicks pressing into you suggest there’s more female naleen here than male.\n\nTheir attention is constantly drifting back to each other, but when they are focused on you they use their sure hands, sharp teeth and frighteningly strong tails to drag you further into their writhing midst, hungry for their orgy to grow ever larger and more exciting.";
			this.customBlock = "";
			this.isPlural = true;
						
			meleeWeapon.attackVerb = "swipe";
			meleeWeapon.attackNoun = "claw";
			meleeWeapon.longName = "claws";
			meleeWeapon.baseDamage.kinetic.damageValue = 2;
			meleeWeapon.addFlag(DamageFlag.PENETRATING);
			meleeWeapon.hasRandomProperties = true;

			this.armor.longName = "shimmering scales";
			this.armor.defense = 6;
			this.armor.hasRandomProperties = true;

			baseHPResistances = new TypeCollection();
			baseHPResistances.drug.damageValue = 25.0;
			baseHPResistances.tease.damageValue = 25.0;
			baseHPResistances.pheromone.damageValue = 25;
			
			this.physiqueRaw = 10;
			this.reflexesRaw = 1;
			this.aimRaw = 15;
			this.intelligenceRaw = 12;
			this.willpowerRaw = 10;
			this.libidoRaw = 80;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 25;
			this.level = 7;
			this.XPRaw = normalXP();
			this.credits = 0;
			this.HPMod = 400;
			this.HPRaw = this.HPMax();

			this.femininity = 5;
			this.eyeType = GLOBAL.TYPE_FELINE;
			this.eyeColor = "green";
			this.tallness = 73;
			this.thickness = 42;
			this.tone = 75;
			this.hairColor = "red";
			this.scaleColor = "green";
			this.furColor = "black";
			this.hairLength = 33;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_FUR;
			this.skinTone = "pale";
			this.skinFlags = [GLOBAL.FLAG_FLUFFY];
			
			this.faceType = GLOBAL.TYPE_HUMAN;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_SNAKE;
			this.lipMod = 1;
			this.earType = GLOBAL.TYPE_FELINE;
			this.antennae = 0;
			this.antennaeType = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = 0;
			this.gills = false;
			this.wingType = 0;
			this.legType = GLOBAL.TYPE_NAGA;
			this.legCount = 1;
			this.legFlags = [GLOBAL.FLAG_PREHENSILE, GLOBAL.FLAG_TENDRIL, GLOBAL.FLAG_SCALED];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_SNAKE;
			this.tailCount = 0;
			this.tailFlags = new Array();
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
			this.buttRatingRaw = 2;
			//No dicks here!
			this.cocks = new Array();
			//balls
			this.balls = 2;
			this.cumMultiplierRaw = 3;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 1.5;
			this.ballFullness = 100;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 6;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 9991;
			this.minutesSinceCum = 9000;
			this.timesCum = 998;
			this.cockVirgin = false;
			this.vaginalVirgin = true;
			this.analVirgin = false;
			this.vaginas = new Array();
			this.cocks = new Array();
			this.createCock();
			this.createCock();
			this.cocks[0].cLengthRaw = 8;
			this.cocks[1].cLengthRaw = 8;
			this.cocks[0].cockColor = "purple";
			this.cocks[0].cType = GLOBAL.TYPE_SNAKE;
			this.cocks[1].cockColor = "purple";
			this.cocks[1].cType = GLOBAL.TYPE_SNAKE;
			this.vaginas = new Array();
			this.createVagina();
			this.vaginas[0].hymen = false;
			this.vaginas[0].clits = 1;
			this.vaginas[0].wetnessRaw = 4;
			this.vaginas[0].loosenessRaw = 3;
			this.vaginas[0].bonusCapacity = 1000;
			this.vaginas[0].type = GLOBAL.TYPE_NAGA;
			this.vaginas[0].vaginaColor = "pink";
			//Goo is hyper friendly!
			this.elasticity = 1.4;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1.30;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 0;
			this.nippleColor = "black";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 1;
			this.ass.wetnessRaw = 0;
			this.ass.loosenessRaw = 3;
			this.ass.bonusCapacity = 1000;
			
			this.createStatusEffect("Disarm Immune");

			this.inventory.push(new NaleenNip());
			this.inventory[0].quantity = 5;
			
			isUniqueInFight = true;
			btnTargetText = "Naleen";
			this._isLoading = false;
			kGAMECLASS.mhengaSSTDChance(this);
		}
		
		override public function get bustDisplay():String
		{
			return "NALEEN_BALL";
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			var attacks:Number = naleenAttacks();
			var attacksMade:Number = 0;
			var choices:Array = [];

			if(hasStatusEffect("Constrict CD")) 
			{
				addStatusValue("Constrict CD",1,-1);
				if(statusEffectv1("Constrict CD") == 0) removeStatusEffect("Constrict CD");
			}
			while(attacks > 0)
			{
				if(attacksMade > 0) output("\n\n");
				choices = [];
				if(target.shields() > 0) choices.push(snakeyslappy);
				if(target.shields() > 0) choices.push(snakeyslappy);
				if(target.shields() > 0) choices.push(snakeyslappy);
				choices.push(naleenSuperBitePowersActivate);
				if(!hasStatusEffect("Constrict CD")) choices.push(constrictyDicty);
				choices.push(femaleTeezyBeezy);
				choices.push(maleTeezyBrazza);
				choices.push(twinTeez);

				choices[rand(choices.length)](target);
				attacks--;
				attacksMade++;
			}
			endOfTurnBoopage();

		}
		//Attacks
		//Snake Slap
		//Kinetic. Only procs if shield still up. 1.5x vs shield
		public function snakeyslappy(target:Creature):void
		{
			meleeWeapon.attackVerb = "slap";
			meleeWeapon.attackNoun = "slap";
			meleeWeapon.longName = "tail";
			meleeWeapon.baseDamage.kinetic.damageValue = 0;
			meleeWeapon.addFlag(DamageFlag.PENETRATING);

			output("Irritated by your kinetic barrier butting into them, a naleen rears his lower half out of the morass and smashes himself into it as hard as he can.");
			var damage:TypeCollection = meleeDamage();
			if(target.shields() >= 0) damage.multiply(1.5);
			applyDamage(damageRand(damage, 15), this, target);
			if(target.shields() < 0) output(" Your shield can’t hold out anymore, and the thick whip of lithe muscle carries straight on into you.");

			meleeWeapon.attackVerb = "swipe";
			meleeWeapon.attackNoun = "claw";
			meleeWeapon.longName = "claws";
			meleeWeapon.baseDamage.kinetic.damageValue = 2;
			meleeWeapon.addFlag(DamageFlag.PENETRATING);
		}
		//Bite
		//Ignores shield. Small kinetic damage, degrades physique, reflexes and willpower. Does not stack
		public function naleenSuperBitePowersActivate(target:Creature):void
		{
			output("Wet pressure spreads itself over a spot on your side, a libidinous love bite which culminates in needle-like teeth sinking past your [pc.skin].");

			if(!target.hasStatusEffect("Naleen Venom")) 
			{
				output(" You grit your teeth as you feel venom work its way into your bloodstream, tightening up your muscles and clouding your mind.");
				target.createStatusEffect("Naleen Venom",0,0,0,0,false,"Poison","This <b>strong</b> venom reduces strength, aim, reflexes, and willpower!",false,10,0xFF0000);
				target.physiqueMod -= 5;
				target.aimMod -= 5;
				target.willpowerMod -= 5;
				target.reflexesMod -= 5;
				target.addStatusValue("Naleen Venom", 1, 5);
				applyDamage(new TypeCollection( { drug: 3 + rand(3) } ), this, target, "minimal");
			}
			else 
			{
				output(" Already relaxed by the previous dose, you find yourself excited by this one! Arousal thunders through your veins, pouring into your crotch.");
				applyDamage(new TypeCollection( { drug: 5 + rand(5) } ), this, target, "minimal");
			}
		}
		//Constrict
		//Only procs if shield is down. PC bound
		public function constrictyDicty(target:Creature):void
		{
			output("Smooth, warm scales slide around your [pc.legs], a naleen’s tail curling itself around you, a loop that draws ever tighter. ");
			if(target.physique()/2 + rand(20) + 1 > this.physique()/2 + 20) output("You manage to wrench yourself clear.");
			else 
			{
				output("Your movements are limited in this pit of writhing, sighing flesh, and you can’t get yourself clear of it in time. A few moments more of sinuous movement, and you are completely bound in the naleen’s coils.");
				target.createStatusEffect("Naleen Coiled",0,0,0,0,false,"Constrict","You’re trapped in the naleen’s coils!",true,0,0xFF0000);
				createStatusEffect("Constrict CD",5,0,0,0);
			}
		}
		//Female Tease
		//Tease lust damage
		public function femaleTeezyBeezy(target:Creature):void
		{
			output("A female naleen rears up in front of you; making hushing, soothing noises, she grasps your head and presses it between the soft, warm fluff of her breasts");
			if(target.hasHair()) output(", stroking your [pc.hair] as she does so");
			output(".");
			if(target.willpower()/2 + rand(20)+1 >= 22) output("\n<b>You resist the sensual ploy!</b>");
			else applyDamage(new TypeCollection( { tease: 5 + rand(3) } ), this, target, "minimal");
		}
		//Male Tease
		//Tease lust damage
		public function maleTeezyBrazza(target:Creature):void
		{
			output("Strong hands curl between your [pc.thighs] and slowly advance up your midriff to your [pc.chest]. His hard pecs rubbing against your back, the male naleen breathes a leopard’s growl in your ear, evidently enjoying what he’s touching.");
			if(target.willpower()/2 + rand(20)+1 >= 22) output("\n<b>You resist the sensual ploy!</b>");
			else applyDamage(new TypeCollection( { tease: 5 + rand(3) } ), this, target, "minimal");
		}
		//Twin Tease
		//Tease lust damage
		public function twinTeez(target:Creature):void
		{
			output("A naleen collapses on top of you, pinning you beneath her soft, fluffy front. Muscular arms reaching around you to clasp themselves around her has you realize that you aren’t her focus of attention. The two predators kiss hungrily over your head, molding their fit, lithe bodies into you passionately: a snake-kitten toasty.");
			if(target.willpower()/2 + rand(20)+1 >= 30) output("\n<b>You resist the sensual ploy!</b>");
			else applyDamage(new TypeCollection( { tease: 8 + rand(3) } ), this, target, "minimal");
		}
		//Claw
		//Kinetic damage
		public function naleenClaw(target:Creature):void
		{
			output("Many hands are touching you, in all sorts of ways; a fondle, a clasp, a stroke. And, as a reminder of the savagery of these primordial predators, a violent, fully-clawed swipe. ");
			var damage:TypeCollection = meleeDamage();
			applyDamage(damageRand(damage, 15), this, target);
			applyDamage(new TypeCollection( { tease: 5 + rand(3) } ), this, target, "minimal");
		}
		//When the Booping’s Good
		//Passively raises lust on self at end of each round by 3-6.
		public function endOfTurnBoopage():void
		{
			output("\n\nThe slathering ball of lusty naleen shivers and squirms, their passions growing ever more intense.");
			var preLust:Number = this.lust();
			this.lust(3+rand(4));
			var newLust:Number = this.lust();
			//No. of attacks: 25-38 lust = 2, 39-60 = 3, 61-75 = 4, 76-89 = 5, 90-100 = 6
			if((preLust < 25 && newLust >= 25) || (preLust < 39 && newLust >= 39) || (preLust < 61 && newLust >= 61) || (preLust < 76 && newLust >= 76) || (preLust < 90 && newLust >= 90)) output(" <b>The mating ball has gotten more frantic!</b>");
		}
		public function naleenAttacks():Number
		{
			var newLust:Number = this.lust();
			if(newLust < 25) return 1;
			else if(newLust < 39) return 2;
			else if(newLust < 61) return 3;
			else if(newLust < 76) return 4;
			else if(newLust < 90) return 5;
			else return 6;
		}
	}
}
