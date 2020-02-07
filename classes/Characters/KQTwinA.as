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

	public class KQTwinA extends Creature
	{
		//constructor
		public function KQTwinA()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			this.short = "Model 17";
			this.originalRace = "ausar";
			this.a = "the";
			this.capitalA = "The";
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

			this.femininity = 80;
			this.eyeType = 0;
			this.eyeColor = "glowing red";
			this.tallness = 77;
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
			this.cocks[0].cLengthRaw = 39;
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
			btnTargetText = "Model 17";
			this.impregnationType = "AusarPregnancy";
			//kGAMECLASS.zhengShiSSTDChance(this);
			this.createStatusEffect("Disarm Immune");
			this.createStatusEffect("Flee Disabled", 0, 0, 0, 0, true, "", "", false, 0);
			this.createPerk("Inhuman Desire",150);

			this._isLoading = false;
		}
		override public function get bustDisplay():String
		{
			return "KQ_TWIN_A";
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

			for(var i:int = 0; i < alliedCreatures.length; i++)
			{
				if(alliedCreatures[i] is KQTwinB) bot18 = alliedCreatures[i];
			}
			//Constantly lusting
			applyDamage(new TypeCollection( { tease: 5 } ), this, this, "suppress");
			//Make sure they both stay even with lust
			if (bot18lust() > this.lust()) this.lust() = bot18.lust();

			var choices:Array = [];

			//Single Attacks
			choices.push(bot17Pummel);
			choices.push(bot17Burn);
			if (!target.hasStatusEffect("Injected")) choices.push(bot17Inject);
			if (this.hasStatusEffect("Frenzy")) choices.push(bot17SprayDown);
			//Combination Attacks. Requires both to be up. To do this, I had bot 17 activate them, and 18 just has no ai for that round
			if (!bot18.isDefeated())
			{
				choices.push(botsOverload);
				if (this.hasStatusEffect("Frenzy")) choices.push(botsGangbang);
			}
			if(!target.hasStatusEffect("Trip") && !this.hasStatusEffect("Disarmed")) choices.push(whippyDoDaCurlsForTheGirls);
			
			//Frenzy Shift. Overrides other attacks
			if (this.lust() >= this.lustMax()) choices = [frenzyShift17];
			choices[rand(choices.length)](target);
		}
		//Pummel
		public function bot17Pummel(target:Creature):void
		{
			output("17 bares her fists and charges you, her battle lust obvious even with her face completely covered.");
			if(combatMiss(this,target))
			{
				output("\n\nHer ‘extra mass’ makes her pretty clumsy, and you’re able to avoid her frantic blows with relative ease.");
			}
			else
			{
				output("\n\nHer fists connect with shocking force, pummeling you with blow after blow. Each hit is just subdued enough that you don’t think they’d break your bones. Instead, it seems like she’s just tenderizing you for what they have planned!");
				output("\n\nShe grins. <i>“You like it? There’s more where that came from.”</i>");
				for (var i:int = 0; i < 4; i++)
				{
					applyDamage(new TypeCollection( { kinetic: 5 } ), this, target, "minimal");
				}
			}
		}
		//Inject
		//Gives lust gain, reduces physique and reflexes
		//+1 taint on hit
		public function bot17Inject(target:Creature):void
		{
			output("17 clicks something on her wrist, causing needles to sprout at the tips of her fingers. She wiggles them playfully at you before charging you.");
			if(combatMiss(this,target))
			{
				output("\n\nHer ‘extra mass’ makes her pretty clumsy, and you’re able to avoid her with relative ease.");
			}
			else
			{
				output("\n\nDespite your best efforts to fight her off, she manages to stick you with the needles, injecting their contents into your body. Heat starts to build at the injected area, slowly spreading out as your body fills with lust! At the same time, you feel yourself become heavier, more sluggish like the poison is numbing your muscles.");
				applyDamage(new TypeCollection( { drug: 7 } ), this, target, "minimal");
				target.physiqueMod -= 4;
				target.reflexesMod -= 4;
				target.taint(1);
				if(!target.hasStatusEffect("Injected")) target.createStatusEffect("Injected",5,3,0,0,false,"Icon_DrugVial","An injected aphrodisiac. Excites over time. It should fade eventually.",true,0);
				else target.addStatusValue("Injected",2,1);
			}
		}
		//Spray-Down
		public function bot17SprayDown(target:Creature):void
		{
			output("17 suddenly seizes up and starts thrusting in place. She’s in an almost trance-like state as her cock and balls twitch violently, working up towards orgasm. Just when she’s about to blow, she suddenly grabs her cock and aims it straight at you as she moans in ecstasy.");
			if(combatMiss(this,target))
			{
				if (target.isBimbo() || target.isCumslut()) output("\n\nDespite your best efforts, you fail to catch the creamy deluge. A powerful throb forces her cock off course at the last moment, sending it flying in seemingly every direction that isn’t yours. Rude!");
				else output("You dodge out of the way, letting her titanic orgasm flow passed you like a rushing river. Thankfully she’s so distracted by her orgasm that she doesn’t bother readjusting until it’s too late.");
				output("\n\n<i>“You should have let it touch you,”</i> she says, shaking her head. <i>“It’s so much more fun that way.”</i>");
			}
			else
			{
				output("\n\nThe force of the blast splatters against you like a high-powered firehose, nearly knocking you off of your [pc.feet]. She cakes it onto you, layer after layer clinging to your unprepared body like hot glue. It overloads all of your senses; sight, smell, touch, the works. By the time it’s done, you feel like you’re more cum than [pc.race]. It feels like it’s seeping into your pores, delivering some faint but effective aphrodisiac into your blood, making your heart race and blood rocket to your crotch.");
				if (target.isBimbo() || target.isCumslut()) output(" Of course, you take the time to lick up as much yummy cummy as possible. Can’t, like, fight on an empty stomach!");
				target.applyCumSoaked();
				applyDamage(new TypeCollection( { tease: 10+rand(3) } ), this, target, "minimal");
			}
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
		//Chemical Burner
		//Low damage, lust gain.
		public function bot17Burn(target:Creature):void
		{
			output("Without warning, 17 aims her arms straight at you. Small mechanisms open up on her wrists and blinding pink arcs of flame fire out at you.");
			if (combatMiss(this,target))
			{
				output("\n\nYou dodge out of the way of the flames, watching them sail passed your head. Strangely, the smoke smells faintly of cherries.");
			}
			else 
			{
				output("\n\nThe flames lick across your skin, leaving a strange sensation in their wake. The feeling quickly sinks into your skin, and you almost immediately realize it’s an aphrodisiac. The flames still burn, but it’s far less intense compared to the influx of lust.");
				applyDamage(new TypeCollection( { drug: 3+rand(3), burn: 3 + rand(3) } ), this, target, "minimal");
			}
		}
		//Overload
		//Very low accuracy, very high damage, guaranteed stun on hit.
		//Increases lust for both.
		public function botsOverload(target:Creature):void
		{
			output("18 activates the implants on her arm, transforming it into a small-scale tesla coil. She takes aim at you but relents on actually firing, looking unsatisfied.");
			output("\n\n<i>“It’d be boring to just shock you like this, wouldn’t it? Lucky I have an idea! Sister, be a dear and come over here.”</i> 17 comes as instructed. <i>“Let’s link up.”</i> At that prompt, 17 wraps her arms around 18, grabbing her massive tits by the huge, meaty nipples and humping her totemic member through her sister’s thick legs.");
			output("\n\nYou’re baffled, initially, until you take notice of the sparks flying off of 17 into 18’s arm. The coils hum and glow brighter and brighter as the more vocal sister moans louder and louder at her sister’s groping. Her moans reach crescendo just as the machinery on her arm starts to shake like it were about to blow. In a way, it does, as a massive surge of electricity and force fires out in your general direction, sending the two girls flying backward.");

		}




{The wave of force crashes into you like a loaded freighter as it passes through your body. You feel your {bones almost compress/form destabilize} as you’re knocked to the ground, writhing as electric shocks cook you from the inside out. <b>In addition to the extreme pain, her attack has left you completely stunned!</b>/The blast goes wide enough that you’re able to duck down and avoid it completely. There’s still enough force to nearly knock you off your feet, and enough electricity {to make your [pc.hair] stand up/that your hair would probably be standing up if you had any}.}

		//Frenzy Shift
		//Happens at full lust.
		//If one is downed, they will get back up at half health. If either is below half health, they will be brought up to half health
		//Both gain new attacks.
		//Both gain damage resistance.
		public function frenzyShift17(target:Creature):void
		{
			output("As ");
			for(var i:int = 0; i < alliedCreatures.length; i++)
			{
				if (alliedCreatures[i] is KQTwinB) bot18 = alliedCreatures[i];
			}
			if (bot18.isDefeated()) output("17 falls to the ground, joining her sister in panting, disabling lust");
			else output("the two modded-out puppers fall to the ground, panting in lust and looking like they’re about to give in");
			output(", you get ready to celebrate another one of your patented Steele charm victories. Your self-congratulation is interrupted when the twins start writhing and moaning strangely. They shudder as the small tanks on their backs whur to life, pumping unknown chemicals into their bodies.");
			output("\n\nBoth girls spring back to life,");
			if (bot18.isDefeated()) output(" despite 18 being down for the count before, ");
			output(" moaning in mind-bending bliss as their cocks spray thick cum in what seems like a continuous, shared orgasm.");
			output("\n\n<i>“So horny! So hard! Need to fuck! Need to fuck! NEED TO FUCK! FUCK NOW!”</i>");
			output("\n\nLooks like this is far from over!");
			this.createStatusEffect("Frenzy");
			bot18.createStatusEffect("Frenzy");
		}
/*
if (inCombat())
{
	output("\n\n");
	CombatManager.genericVictory();
}
else
{
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
public function leaveMiloFutaAfterWin():void
{
  output("You leave the Milodan Amazon behind you and continue on your way.\n\n");
  CombatManager.genericVictory();
}
*/
