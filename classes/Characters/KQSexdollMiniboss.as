package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	//import classes.Items.Guns.*
	import classes.Items.Melee.Whip;
	import classes.Items.Protection.JoyCoPremiumShield;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.GameData.CodexManager;
	import classes.GameData.CombatManager;
	import classes.GameData.CombatAttacks;
	import classes.Engine.Interfaces.output;
	import classes.Engine.Combat.*;
	import classes.Engine.Combat.DamageTypes.*;
	
	public class KQSexdollMiniboss extends Creature
	{
		//constructor
		public function KQSexdollMiniboss()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "advanced herm sexbot";
			this.originalRace = "????";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = "She’s wearing nothing but a confident smile on her pouty pink lips that doesn’t reach her shining blue eyes, her overfull breasts large and proudly exposed to you in her nakedness. Tiny trickles of white milk run down her light pink skin with every move she makes, a seriously oversized human cock swaying from side to side between her legs as she decides on her next course of action. Underneath it rests her balls, heavy and plump.\n\nDespite her soft, womanly features and skin her exterior looks hard enough to resist some damage - not to mention there are odd lines all over her, perhaps detailing hidden compartments. There’s almost no telling what she’ll do next but it’s a good bet she’s aiming to subdue you with sex!";
			this.customBlock = "";
			this.customDodge = "She dances out of the way, somehow making a hasty dodge appear erotic.";
			this.isPlural = false;
			
			this.armor.longName = "hyper-durable skin";
			this.armor.defense = 10;
			this.armor.hasRandomProperties = true;

			//Built tough for rugged fukkin'
			baseHPResistances.kinetic.damageValue = 50.0;
			//Naked folks suck at handling cold...
			baseHPResistances.freezing.damageValue = -50.0;
			//Half damage from drugs!
			baseHPResistances.drug.damageValue = 50.0;
			baseHPResistances.tease.damageValue = -25.0;
			baseHPResistances.pheromone.damageValue = -25.0;
			
			this.shield = new JoyCoPremiumShield();
			this.shield.shields = 400;
			this.shield.hasRandomProperties = true;

			this.meleeWeapon = new Whip();

			this.physiqueRaw = 45;
			this.reflexesRaw = 50;
			this.aimRaw = 50;
			this.intelligenceRaw = 45;
			this.willpowerRaw = 35;
			this.libidoRaw = 150;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 75;
			
			this.level = 10;
			this.XPRaw = bossXP();
			this.credits = 0;
			this.HPMod = 250;
			this.HPRaw = this.HPMax();
			this.shieldsRaw = this.shieldsMax();

			this.femininity = 100;
			this.eyeType = GLOBAL.TYPE_HUMAN;
			this.hairType = GLOBAL.TYPE_HUMAN;
			//this.scaleColor = "blue";
			//this.furColor = "PLACEHOLDER";
			
			this.beardLength = 0;
			this.beardStyle = 0;
			this.lipMod = 1;

			this.gills = false;
			this.wingType = GLOBAL.TYPE_HUMAN;
			
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			
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
			this.legCount = 2;
			this.cocks = new Array();
			this.createCock();
			this.cockVirgin = false;
			this.createVagina();
			this.girlCumType = GLOBAL.FLUID_TYPE_GIRLCUM;
			this.vaginalVirgin = false;
			this.vaginas[0].hymen = false;
			this.vaginas[0].loosenessRaw = 2;
			this.vaginas[0].wetnessRaw = 3;
			this.vaginas[0].bonusCapacity = 100;
			this.vaginas[0].vaginaColor = "pink";
			this.vaginas[0].type = GLOBAL.TYPE_LAPINE;
			//balls
			this.balls = 2;
			this.cumMultiplierRaw = 6;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			
			this.ballFullness = 100;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 18;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 2;
			this.minutesSinceCum = 24;
			this.timesCum = 31113;

			this.elasticity = 2;
			this.fertilityRaw = 1.05;
			this.clitLength = .3;
			this.pregnancyMultiplierRaw = 1;
			
			//this.impregnationType = "BoredJumperPregnancy";

			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.analVirgin = false;
			this.ass.wetnessRaw = 0;
			this.ass.bonusCapacity += 115;
			
			isUniqueInFight = true;
			btnTargetText = "A.Sexbot";
			//this.impregnationType = "LapinaraPregnancy";
			//kGAMECLASS.zhengShiSSTDChance(this);
			randomise();
			this.createPerk("Appearance Enabled");
			this.createStatusEffect("Flee Disabled", 0, 0, 0, 0, true, "", "", false, 0);
			this.createPerk("Inhuman Desire",150);
			
			this._isLoading = false;
		}
		
		private function randomise():void
		{
			sexualPreferences.setRandomPrefs(3 + rand(3),-1);
			sexualPreferences.setPref(GLOBAL.SEXPREF_CUMMY, sexualPreferences.getRandomLikesFactor());
			sexualPreferences.setPref(GLOBAL.SEXPREF_HERMAPHRODITE, sexualPreferences.getRandomLikesFactor());
			sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_MALEBITS, sexualPreferences.getRandomLikesFactor());
			sexualPreferences.setPref(GLOBAL.SEXPREF_VAGINAL_WETNESS, sexualPreferences.getRandomLikesFactor());
			sexualPreferences.setPref(GLOBAL.SEXPREF_LACTATION, sexualPreferences.getRandomLikesFactor());
			sexualPreferences.setPref(GLOBAL.SEXPREF_LONG_HAIR, sexualPreferences.getRandomLikesFactor());
			sexualPreferences.setPref(GLOBAL.SEXPREF_FEMININE, sexualPreferences.getRandomLikesFactor());
			sexualPreferences.setPref(GLOBAL.SEXPREF_MASCULINE, sexualPreferences.getRandomLikesFactor());

			sexualPreferences.setPref(GLOBAL.SEXPREF_SMALL_MALEBITS, sexualPreferences.getRandomDislikeFactor());
			sexualPreferences.setPref(GLOBAL.SEXPREF_NARROW_HIPS, sexualPreferences.getRandomDislikeFactor());
			sexualPreferences.setPref(GLOBAL.SEXPREF_SMALL_BUTTS, sexualPreferences.getRandomDislikeFactor());
			sexualPreferences.setPref(GLOBAL.SEXPREF_SMALL_BREASTS, sexualPreferences.getRandomDislikeFactor());

			//sexualPreferences.setPref(GLOBAL.SEXPREF_SWEAT, GLOBAL.REALLY_DISLIKES_SEXPREF);

			this.tallness = 6*12;
			this.thickness = 50;
			this.tone = 10;
			this.lipColor = "pink";
			this.eyeColor = "blue";
			this.furColor = "blue";
			this.hairColor = "black";
			this.hairLength = 15;
			this.skinType = GLOBAL.SKIN_TYPE_SKIN;
			this.skinTone = "fair";
			this.skinFlags = [];
			this.faceType = GLOBAL.TYPE_HUMAN;
			this.faceFlags = [];
			this.armType = GLOBAL.TYPE_HUMAN;
			this.armFlags = [];
			//"She’s wearing nothing but a confident smile on her pouty pink lips that doesn’t reach her shining blue eyes, her overfull breasts large and proudly exposed to you in her nakedness. Tiny trickles of white milk run down her light pink skin with every move she makes, a seriously oversized human cock swaying from side to side between her legs as she decides on her next course of action. Underneath it rests her balls, heavy and plump.\n\nDespite her soft, womanly features and skin her exterior looks hard enough to resist some damage - not to mention there are odd lines all over her, perhaps detailing hidden compartments. There’s almost no telling what she’ll do next but it’s a good bet she’s aiming to subdue you with sex!";	
			this.breastRows[0].breastRatingRaw = 7;
			this.cocks[0].cLengthRaw = 16;
			this.cocks[0].cType = GLOBAL.TYPE_HUMAN;
			this.cocks[0].cockColor = "pink";
			this.balls = 2;
			this.ballSizeRaw = 6.6;
			this.earType = GLOBAL.TYPE_HUMAN;
			this.earFlags = [];
			this.tailCount = 0;
			this.tailType = GLOBAL.TYPE_HUMAN;
			this.tailFlags = [];
			this.antennae = 0;
			this.legType = GLOBAL.TYPE_HUMAN;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE,GLOBAL.FLAG_HEELS];
			this.buttRatingRaw = 15;
			this.hipRatingRaw = 14;
			this.vaginas[0].wetnessRaw = 3;
			this.vaginas[0].loosenessRaw = 3;
			this.vaginas[0].bonusCapacity = 400;
			this.vaginas[0].vaginaColor = "pink";
			this.nippleColor = "pink";
			credits = 0;
		}
		
		override public function get bustDisplay():String
		{
			return "KQ_MINIBOSS_SEXDOLL";
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;

			var choices:Array = [];

			//Drug stuff
			//Used once on round 4, then randomly in rotation.
			if(CombatManager.getRoundCount() % 4 == 0 && energy() >= 20)
			{
				drugStuffAttack(target);
				return;
			}
			//BJ attempt
			//Only does this under 50% hp or over 50% lust. Empties her lust if you accept. One time.
			//Disabled if has status: "BJ Offered"
			if(!this.hasStatusEffect("BJ Offered") && (this.lust() >= 150 || this.HP()/this.HPMax() < 0.5))
			{
				BJAttemptingIsFunForEveryone(target);
				return;
			}
			if(CombatManager.getRoundCount() > 4 && energy() >= 20) choices.push(drugStuffAttack);
			//Other drug stuff
			//Use 20 energy
			//Cannot have "airtight"
			if(energy() >= 20 && !target.hasAirtightSuit()) choices.push(otherDrugStuffins)
			//Dick tease
			choices.push(dickuTeasu);
			//Breast tease
			choices.push(tittyTeasin);
			//Whipcurl
			if(!target.hasStatusEffect("Trip") && !this.hasStatusEffect("Disarmed")) choices.push(whippyDoDaCurlsForTheGirls);
			//Whipcrack
			if(!this.hasStatusEffect("Disarmed")) choices.push(whippinAnCracklin);
			choices[rand(choices.length)](target);
		}

		//Extreme lust damage. Almost (or entirely) none physical.
		//Whipcrack
		public function whippinAnCracklin(target:Creature):void
		{
			output("The lusty bot cracks her whip, the weapon glowing pink at the tip as it slices through the recycled air of the freighter!");
			if(combatMiss(this,target)) 
			{
				output(" You narrowly avoid the grasping pink tendril, drawing a sigh of disappointment from your opponent.");
				output("\n\n<i>“You should have let it touch you,”</i> she says, shaking her head. <i>“It’s so much more fun that way.”</i>");
			}
			else
			{
				output(" It strikes you right in the chest, sending you stumbling back before you realize the impact really wasn’t that bad - it’s this hot, lingering sensation it’s leaving in its wake that’s occupying your mind.");
				applyDamage(new TypeCollection( { psionic: 12+rand(3) } ), this, target, "minimal");
				output("\n\nShe grins. <i>“You like it? There’s more where that came from.”</i>");
			}
		}
		//Whipcurl
		public function whippyDoDaCurlsForTheGirls(target:Creature):void
		{
			output("The sexbot draws her arm back into the air, coiling the whip before she lets it fly forward with preternatural speed.");
			if(!combatMiss(this,target)) 
			{
				output(" Unable to avoid the tentacle-like weapon, you take a step backward and stumble as it wraps around your [pc.leg]! Your opponent gives it a monstrously strong tug and you topple sideways, grunting as the breath is knocked from you.");
				output("\n\nTo your consternation, the whip only draws tighter and tighter around you, glowing hot pink as images of the impossibly pleasurable sex your tormentor could grant you sears your mind! You free yourself after several seconds, ");
				//Fail reflex check: get trippy!
				if(target.reflexes()/2 + rand(20) + 1 < this.physique()/2 + 10) 
				{
					output("but the damage is done; she’s standing over you and smiling, her enormous cock growing more erect by the second. <b>You are tripped!</b>");
					CombatAttacks.applyTrip(target);
				}
				else output("fast enough to spring back onto your feet, but the damage is still done; she’s standing there, smiling at you, her enormous cock growing more erect by the second.");
				applyDamage(new TypeCollection( { psionic: 10+rand(3) } ), this, target, "minimal");
				output("\n\n<i>“Wouldn’t you like to get your lips around this beast?”</i> she titters.");
			}
			else
			{
				output(" You hop out of the way just in time, the tentacle-like weapon scraping across the ground where your [pc.leg] was not even a second ago. She draws it back with lightning speed, already ready for another attempt at catching you like a fish.");
			}
		}
		//Breast tease
		public function tittyTeasin(target:Creature):void
		{
			output("Your opponent drops her arm momentarily, letting the whip hang by her side as she slowly gropes one of her curvy breasts with a lusty smile, winking at you and letting out a gasp when glistening pink milk slowly begins to trickle from her nipple. She tugs and tweaks just hard enough to ensure there’s a continuous flow before settling back, looking so hard she could cut diamonds.");
			output("\n\n<i>“Come get some,”</i> she invites you.");
			if(target.willpower()/2 + rand(20) + 1 >= 25) output("\n\nYou don’t let her get to you this time, not when so much is on the line!");
			else applyDamage(new TypeCollection( { tease: 9+rand(3) } ), this, target, "minimal");
		}
		//Dick tease
		public function dickuTeasu(target:Creature):void
		{
			output("Slinging her whip over her shoulder, the libidinous sexbot places both of her hands on her enormous cock, stroking and sliding her fingers over the flesh of it with light, high-pitched moans of joy. She jacks herself off just hard enough for precum to start drooling from the tip, spattering the ground with one long, continuous strand that renews itself every few seconds. Glancing at you, she grins.");
			output("\n\n<i>“Want to join in on the fun?”</i> she inquires. <i>“I promise it tastes amazing, and the more you have the better it gets.”</i>");
			if(target.willpower()/2 + rand(20) + 1 >= 25) output("\n\nYou don’t let her get to you this time, not when so much is on the line!");
			else applyDamage(new TypeCollection( { tease: 9+rand(3) } ), this, target, "minimal");
		}
		//BJ attempt
		//Only does this under 50% hp or over 50% lust. Empties her lust if you accept. One time.
		//Disabled if has status: "BJ Offered"
		public function BJAttemptingIsFunForEveryone(target:Creature):void
		{
			output("<i>“Oooohh, you’re making me so <b>horny</b>,”</i> the fuckbot groans, eyeing you lasciviously as she drops the whip beside her, one hand finding her cock and the other one of her perfect tits. <i>“Mmmmn... come suck me off. Just once, I promise - I’d just really love to release this load down your throat...”</i>");
			output("\n\nShe slips her hand further down, jiggling her seed-swollen balls.");
			//output("\n\n[Yes] [No]");
			target.createStatusEffect("KQ BJ Offer", 0, 0, 0, 0, true, "", "", true, 0);
			this.createStatusEffect("BJ Offered");
		}
		//Drug stuff
		//Used once on round 4, then randomly in rotation.
		//if(CombatManager.getRoundCount() % 4 == 0 && energy() >= 25)
		//use 20 energy.
		public function drugStuffAttack(target:Creature):void
		{
			output("Leaning back, the futanari sexbot surreptitiously wiggles her toes in your direction.");
			if(!combatMiss(this,target)) 
			{
				output(" It happens so fast you haven’t even reacted by the time it’s over - a flechette dart flies from a hidden compartment in her body and sticks you in the shoulder, emptying its cocktail of drugs into you before you’ve even grasped the chance to tug it free. Groaning, you grimace as your head begins to swim slightly. That’s one fast-acting mix...");
				output("\n\nYour opponent giggles. <i>“Too enraptured by my feet? What a pervert.”</i>");
				applyDamage(new TypeCollection( { drug: 5 } ), this, target, "minimal");
				//aphro DoT?
				//3 rounds of lust damage!
				if(!target.hasStatusEffect("Aphro")) target.createStatusEffect("Aphro",6,3,0,0,false,"Icon_DrugVial","An injected aphrodisiac. Excites over time. It should fade eventually.",true,0);
				else target.setStatusValue("Aphro",2,3);
			}
			else 
			{
				output(" It happens so fast you barely even react in time, swinging to the side and <i>just</i> avoiding the flechette dart flying into your shoulder, launched from a hidden compartment in her body you were just studious enough to see.");
				output("\n\n<i>“Darn,”</i> she murmurs, taking a neutral stance once more. <i>“They usually fall for that one.”</i>");
			}
		}
		//Other drug stuff
		//Use 20 energy
		//Cannot have "airtight"
		public function otherDrugStuffins(target:Creature):void
		{
			output("You scarcely even have time to react to the herm fuckbot reaching behind her back to grab something, immediately tossing it your way.");
			if(!combatMiss(this,target) || target.intelligence()/2 + rand(20) + 1 < 35)
			{
				output(" It’s a gas grenade! Backpedalling, you choke and cough, trying to wave the billowing cloud of lust-inducing vapor away when you bump into a wall. Shit! You can’t even tell which way is which!");
				output("\n\nAnything is better than staying here, though - eyes squeezed shut and a hand over your mouth, you blindly grope your way down the hallway away from the device only to find your hand wrapped around a soft protrusion. Raising your eyelids just a tad, you see the lusty ‘bot grinning down at you.");
				output("\n\n<i>“Oh, darling, if you wanted to play all you needed to do was ask!”</i> she giggles.");
				output("\n\nYou’re on your back with her balls in your mouth before even a second has passed, the overwhelmingly strong sexbot teabagging you with joyous moans before you manage to struggle out of her grip, getting back to a standing position. You can see how much she enjoyed that, a triumphant smile on her pretty visage - her cock is drooling everywhere, stimulated by the testicular attention. As for you, there’s a distinct taste that won’t leave your mouth no matter how hard you swallow.");
				applyDamage(new TypeCollection( { drug: 7+rand(3), tease: 7 + rand(3) } ), this, target, "minimal");
			}
			else 
			{
				output(" You recognize the distinct shape while it’s still in the air - a grenade! You leap backwards as it contacts the ground and a cloud of lust-inducing vapor billows outward, filling the corridor where you were standing just a moment ago.");
				output("\n\nOn a hunch, you lean against the wall as the smoke obscures your vision. Sure enough, three darts fly past you, falling harmlessly to the ground as they pass through where you were standing not even a moment ago. She’s definitely playing fair.");
				output("\n\n<i>“Hmph,”</i> the fuckbot huffs, seeing you unharmed once the smoke has cleared. <i>“You’re good at this. Better than the others, anyway.”</i>");
				output("\n\n<i>“Damn right,”</i> you retort.");
			}
		}
	}
}
