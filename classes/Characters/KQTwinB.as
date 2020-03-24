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
	import classes.Engine.Interfaces.author;

	public class KQTwinB extends Creature
	{
		//constructor
		public function KQTwinB()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			this.short = "Model 18";
			this.originalRace = "ausar";
			this.a = "";
			this.capitalA = "";
			this.long = "Placeholder";
			this.customDodge = "";
			this.customBlock = "";
			this.isPlural = false;
			
			this.meleeWeapon.attackVerb = "punch";
			this.meleeWeapon.longName = "fist";
			this.meleeWeapon.hasRandomProperties = true;
			
			this.armor.longName = "hyper-durable skin";
			this.armor.defense = 10;
			this.armor.hasRandomProperties = true;

			//Built tough for rugged fukkin'
			baseHPResistances.kinetic.damageValue = 50.0;
			//Naked folks suck at handling cold...
			baseHPResistances.freezing.damageValue = -50.0;
			//Immune to drugs
			baseHPResistances.drug.damageValue = 100.0;
			//Lil bit tease/pheromone vuln
			baseHPResistances.tease.damageValue = -25.0;
			baseHPResistances.pheromone.damageValue = -25.0;
			
			this.physiqueRaw = 50;
			this.reflexesRaw = 50;
			this.aimRaw = 35;
			this.intelligenceRaw = 20;
			this.willpowerRaw = 15;
			this.libidoRaw = 150;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 40;
			
			this.level = 10;
			this.XPRaw = bossXP();
			this.HPMod = 200;
			this.HPRaw = this.HPMax();
			this.shieldsRaw = this.shieldsMax();
			
			this.femininity = 80;
			this.eyeType = 0;
			this.eyeColor = "glowing red";
			this.tallness = 83;
			this.thickness = 50;
			this.tone = 0;
			this.hairColor = "brown";
			this.scaleColor = "ebony";
			this.furColor = "brown";
			this.hairLength = 3;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_SKIN;
			this.skinTone = "brown";
			this.skinFlags = [];
			this.faceType = GLOBAL.TYPE_HUMAN;
			this.faceFlags = [];
			this.tongueType = GLOBAL.TYPE_CANINE;
			this.lipMod = 3;
			this.earType = GLOBAL.TYPE_CANINE;
			this.earFlags = [GLOBAL.FLAG_FURRED];
			this.antennae = 0;
			this.antennaeType = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = GLOBAL.TYPE_CANINE;
			this.armFlags = [GLOBAL.FLAG_FURRED];
			this.gills = false;
			this.wingType = 0;
			this.legType = GLOBAL.TYPE_CANINE;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE, GLOBAL.FLAG_FURRED, GLOBAL.FLAG_PAWS];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_CANINE;
			this.tailCount = 1;
			this.tailFlags = [GLOBAL.FLAG_FLUFFY, GLOBAL.FLAG_FURRED];
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
			this.hipRatingRaw = 17;
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
			this.buttRatingRaw = 19;
			//No dicks here!
			this.cocks = new Array();
			this.createCock();
			this.cocks[0].cThicknessRatioRaw = 1.5;
			this.cocks[0].cLengthRaw = 13;
			this.cocks[0].addFlag(GLOBAL.FLAG_TAPERED);
			this.cocks[0].addFlag(GLOBAL.FLAG_KNOTTED);
			//balls
			this.balls = 2;
			this.cumMultiplierRaw = 30;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 20;
			this.ballFullness = 100;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 90;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 9991;
			this.minutesSinceCum = 65;
			this.timesCum = 12133;
			this.cockVirgin = false;
			this.analVirgin = false;
			this.vaginalVirgin = false;
			
			this.createVagina();
			this.vaginas[0].bonusCapacity = 500;
			this.vaginas[0].loosenessRaw = 4;
			this.vaginas[0].wetnessRaw = 5;
			this.elasticity = 5;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1.05;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 31;
			this.nippleColor = "black";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			this.ass.loosenessRaw = 4;
			this.ass.bonusCapacity = 100;

			isUniqueInFight = true;
			btnTargetText = "Model 18";
			this.impregnationType = "AusarPregnancy";
			//kGAMECLASS.zhengShiSSTDChance(this);
			this.createStatusEffect("Disarm Immune");
			this.createStatusEffect("Flee Disabled", 0, 0, 0, 0, true, "", "", false, 0);
			this.createPerk("Inhuman Desire",150);

			this._isLoading = false;
		}

		override public function get bustDisplay():String
		{
			return "KQ_TWIN_B";
		}
		override public function isDefeated():Boolean
		{
			//Can't lose to lust
			if (HP() <= 0) return true;
			return false;
		}
		
		//Cannot be beaten with lust.
		//Both gain lust passively, at the same rate.
		//Teasing one gives the same amount of lust build-up to both.
		//When lust is maxed, both will enter a Frenzy state, regaining health (and also getting one back up if they’ve been knocked down) and gaining new attacks.
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;

			var bot17:KQTwinA;
			for(var i:int = 0; i < alliedCreatures.length; i++)
			{
				if(alliedCreatures[i] is KQTwinA) bot17 = alliedCreatures[i];
			}
			//Constantly lusting
			applyDamage(new TypeCollection( { tease: 5 } ), this, this, "suppress");
			//Make sure they both stay even with lust
			if (bot17.lust() > this.lust()) this.lust(bot17.lust() - this.lust());

			var choices:Array = [];

			choices.push(bot18Pummel);
			if (!target.hasStatusEffect("Stunned")) choices.push(bot18Lightning);
			if (!target.hasStatusEffect("Injected")) choices.push(bot18Inject);

			//Frenzy Shift. Overrides other attacks
			if (this.lust() >= this.lustMax() && !this.hasStatusEffect("Frenzy")) choices = [frenzyShift18];
			choices[rand(choices.length)](target,bot17);
			
		}
		//Pummel
		public function bot18Pummel(target:Creature,bot17:Creature):void
		{
			author("QuestyRobo");
			output("18 bares her fists and charges you, her battle lust obvious even with her face completely covered.");
			if(combatMiss(this,target))
			{
				output(" Her ‘extra mass’ makes her pretty clumsy, and you’re able to avoid her frantic blows with relative ease.");
			}
			else
			{
				output(" Her mitts connect with shocking force, pummeling you with blow after blow. Each hit is just subdued enough that you don’t think they’d truly injure you. Instead, it seems like she’s just tenderizing you for something else!");
				for (var i:int = 0; i < 4; i++)
				{
					applyDamage(new TypeCollection( { kinetic: 15 } ), this, target, "minimal");
				}
				output("\n\nShe grins. <i>“You like it? There’s more where that came from.”</i>");
			}
		}
		//Inject
		//Gives lust gain, reduces int and willpower
		//+1 taint on hit
		public function bot18Inject(target:Creature,bot17:Creature):void
		{
			author("QuestyRobo");
			output("18 clicks something on her wrist, causing needles to sprout at the tips of her fingers. She wiggles them playfully at you before charging.");
			if(combatMiss(this,target))
			{
				output(" Her ‘extra mass’ makes her pretty clumsy, and you’re able to avoid her with relative ease.");
			}
			else
			{
				output(" Despite your best efforts to fight 18 off, she manages to stick you with the needles, injecting their contents into your body. Heat starts to build at the prickled site, slowly spreading out as your body fills with lust! You start feeling lightheaded and unfocused, almost like your brain is filling up with cotton.");
				applyDamage(new TypeCollection( { drug: 12 } ), this, target, "minimal");
				target.taint(1);
				if(!target.hasStatusEffect("Injected")) 
				{
					target.createStatusEffect("Injected",5,3,1,0,false,"Icon_DrugVial","An injected aphrodisiac. Excites over time. It should fade eventually.",true,0);
					target.intelligenceMod -= 5;
					target.willpowerMod -= 5;
				}
				else target.addStatusValue("Injected",2,1);
			}
		}
		//Spray-Down
		public function bot18SprayDown(target:Creature,bot17:Creature):void
		{
			author("QuestyRobo");
			output("18 suddenly seizes up and starts thrusting in place. She’s in an almost trance-like state as her cock and balls twitch violently, working up towards orgasm. Just when she’s about to blow, she suddenly grabs her cock and aims it straight at you as she moans in ecstasy.");
			if(rangedCombatMiss(this,target))
			{
				if (target.isBimbo() || target.isCumSlut()) output("\n\nDespite your best efforts, you fail to catch the creamy deluge. A powerful throb forces her cock off course at the last moment, sending it flying in seemingly every direction that isn’t yours. Rude!");
				else output("You dodge out of the way, letting her titanic orgasm flow passed you like a rushing river. Thankfully she’s so distracted by her orgasm that she doesn’t bother readjusting until it’s too late.");
				output("\n\n<i>“You should have let it touch you,”</i> she says, shaking her head. <i>“It’s so much more fun that way.”</i>");
			}
			else
			{
				output("\n\nThe force of the blast splatters against you like a high-powered fire hose, nearly knocking you off of your [pc.footOrFeet]. She cakes it onto you, layer after layer clinging to your unprepared body like hot glue. It overloads all of your senses; sight, smell, touch, the works. By the time it’s done, you feel like you’re more cum than [pc.race]. It feels like it’s seeping into your pores, delivering some faint but effective aphrodisiac into your blood, making your heart race and blood rocket to your crotch.");
				if (target.isBimbo() || target.isCumSlut()) output(" Of course, you take the time to lick up as much yummy cummy as possible. Can’t, like, fight on an empty stomach!");
				target.applyCumSoaked();
				applyDamage(new TypeCollection( { tease: 12+rand(3) } ), this, target, "minimal");
			}
		}
		//Lightning Burst
		//Chance to stun
		public function bot18Lightning(target:Creature,bot17:Creature):void
		{
			author("QuestyRobo");
			output("18 starts twitching, at least more so than usual. You wonder if she’s finally starting to crack only for her to thrust her arm out at you, revealing a series of implants that create a small-scale tesla coil, arcing electricity throughout her body as it charges up. She moans ecstatically as the machinery in whines louder and louder. The modded-out fuckdoll cries out in faux-orgasm as electricity fires out at you!");
			if (rangedCombatMiss(this,target)) 
			{
				output(" You dive out of the way and manage to avoid the brunt of the attack, only getting a bit of static.");
				applyDamage(new TypeCollection( { electric: 1 } ), this, target, "minimal");
			}
			else
			{
				output("\n\nArcs of electricity surge into you, frying your nerves more than actually burning you. She’s obviously trying to disable you and not outright kill you, but it still hurts like hell!");
				applyDamage(new TypeCollection( { electric: 43+rand(3) } ), this, target, "minimal");
				if (this.aim()/2 + rand(20) + 1 >= target.physique()/2 + 10 && !this.hasStatusEffect("bot18Lightning Stun Cooldown"))
				{
					createStatusEffect("bot18Lightning Stun Cooldown", 6);
					output(" Even after she finishes you can still feel the shocks working through your body, heavily limiting your movement. <b>You’re stunned!</b>");
					CombatAttacks.applyStun(target,1);
				}
			}
		}
		//Frenzy Shift
		//Happens at full lust.
		//If one is downed, they will get back up at half health. If either is below half health, they will be brought up to half health
		//Both gain new attacks.
		//Both gain damage resistance.
		public function frenzyShift18(target:Creature,bot17:Creature):void
		{
			author("QuestyRobo");
			output("As ");
			if (bot17.isDefeated()) output("18 falls to the ground, joining her sister in panting, disabling lust");
			else output("the two modded-out puppers fall to the ground, panting in lust and looking like they’re about to give in");
			output(", you get ready to celebrate another one of your patented Steele charm victories. Your self-congratulation is interrupted when the twins start writhing and moaning strangely. They shudder as the small tanks on their backs whur to life, pumping unknown chemicals into their bodies.");
			output("\n\n<b>Both girls spring back to life</b>,");
			if (bot17.isDefeated()) output(" despite 17 being down for the count before, ");
			output(" moaning in mind-bending bliss as their cocks spray thick cum in what seems like a continuous, shared orgasm.");
			output("\n\n<i>“So horny! So hard! Need to fuck! Need to fuck! NEED TO FUCK! FUCK NOW!”</i>");
			output("\n\nLooks like this is far from over!");
			//Increase hp to half if below
			if(this.HPQ() < 50)  this.HP(this.HPMax()/2 - this.HP());
			if(bot17.HPQ() < 50) bot17.HP(bot17.HPMax()/2 - bot17.HP());
			//make sure ally is full lust too
			bot17.maxOutLust();
			this.createStatusEffect("Frenzy");
			bot17.createStatusEffect("Frenzy");
		}
	}
}