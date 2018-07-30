package classes.Characters 
{
	import classes.CockClass;
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Items.Melee.TaivrasSpear;
	import classes.Items.Protection.ReaperArmamentsMarkIShield;
	import classes.Items.Miscellaneous.EmptySlot;
	import classes.ItemSlotClass;
	import classes.kGAMECLASS;
	import classes.Util.RandomInCollection;
	
	import classes.Items.Guns.HammerPistol;
	import classes.Items.Guns.EagleHandgun;
	import classes.Items.Guns.LaserPistol;
	
	import classes.GLOBAL;
	
	import classes.Engine.Combat.*;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Engine.Interfaces.output;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	
	import classes.Engine.Utility.weightedRand;
	import classes.Engine.Utility.rand;

	/**
	 * ...
	 * @author Gedan
	 */
	
	public class Princess extends Creature
	{
		
		public function Princess() 
		{
			this._latestVersion = 1;
			this.version = this._latestVersion;
			this._neverSerialize = true; // Setting this will stop a given NPC class from ever being serialized.
			
			this.short = "princess";
			this.originalRace = "nyrea";
			this.a = "the ";
			this.capitalA = "The ";
			this.tallness = 72;
			this.scaleColor = "green";
			
			this.long = "The nyrean princess glares at you from across the room, her boytoys taking refuge in the shadowed recesses of the chamber. The citrine gems interwoven into her slender head-spikes have shifted with her clumsy attempts at combat so that they hang askew, less like a regal crown and more like a classless harlot’s glass jewelry. It is a sight that is nonetheless steeped in sexuality, even if it has been overlaid in bandoleers of red myrmedion drug-spit. You almost wish you had the time to admire how her heaving bust is just this side of too large for her frame, but if you’re going to get out of here without joining her harem, you’d best keep your eyes on the fight.";
			
			this.isPlural = false;
			
			this.shield = new EmptySlot();
			this.meleeWeapon = new TaivrasSpear();
			
			this.physiqueRaw = 20;
			this.reflexesRaw = 20;
			this.aimRaw = 29;
			this.intelligenceRaw = 10;
			this.willpowerRaw = 5;
			this.libidoRaw = 60;
			this.shieldsRaw = this.shieldsMax();
			this.energyRaw = 100;
			this.lustRaw = 5;
			
			baseHPResistances = new TypeCollection();
			baseHPResistances.kinetic.damageValue = 25.0;
			baseHPResistances.electric.damageValue = 25.0;
			baseHPResistances.burning.damageValue = 25.0;
			
			this.level = 7;
			this.XPRaw = normalXP();
			this.credits = 0;
			this.HPMod = 55;
			this.HPRaw = this.HPMax();
			this.shieldsRaw = this.shieldsMax();
			
			this.femininity = 90;
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
			this.ass.loosenessRaw = 1;
			
			this.hairLength = 10;
			
			this.cocks = [];
			this.cocks.push(new CockClass());
			(this.cocks[0] as CockClass).cType = GLOBAL.TYPE_NYREA;
			(this.cocks[0] as CockClass).cLengthRaw = 8;
			(this.cocks[0] as CockClass).cThicknessRatioRaw = 1.66;
			(this.cocks[0] as CockClass).addFlag(GLOBAL.FLAG_KNOTTED);
			(this.cocks[0] as CockClass).virgin = false;
			this.cockVirgin = false;
			createStatusEffect("Force Fem Gender");
			this.createStatusEffect("Flee Disabled",0,0,0,0,true,"","",false,0);
			this.createStatusEffect("Disarm Immune");
			
			isUniqueInFight = true;
			btnTargetText = "Princess";
			
			tallness = 68 + (rand(12) - 6);
			rangedWeapon = new (RandomInCollection(EagleHandgun, HammerPistol, LaserPistol))();
			sexualPreferences.setRandomPrefs(7, 1);
			inventory.push(new ReaperArmamentsMarkIShield());
			this._isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return "PRINCESS_BANDOLEER";
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			if(lust() >= 60) princessNutBuster();
			else if(!(shield is ReaperArmamentsMarkIShield) && HP()/HPMax() < .5) princessGetsAShield();
			else vialGetsHockedAtPCFaaaace(target);
		}
		
		private function princessGetsAShield():void
		{
			output("<i>“Ouch! Stop it! Don’t you know how much that hurts!”</i> The haughty royal reaches under her bed to pull out a sophisticated-looking device. Even by core standards, it looks like a substantial piece of tech, covered in traceries of glowing circuitry. She flicks it around her waist, allowing it to snap closed entirely on its own, guided by embedded electromagnets. A faint hum flickers into audibility, followed by the appearance of a near-invisible outline around princess.");
			output("\n\nThat shield belt is going to make this more of a fight than you thought!");
			output("\n\n<i>“Now, get on all fours, and I’ll make sure you get enough venom to love how I pay you back.”</i>");
			shield = new ReaperArmamentsMarkIShield();
			shields(shieldsMax());
		}
		
		private function princessNutBuster():void
		{
			output("The princess pants, her eyes wide and nipples hard. <i>“It’ll take more than that to beat me! Latiku! Attend!”</i> She gestures imperiously at her drooling, hard erection. Even the nubs around her flared crown look angry and inflamed, desperate for a fuck.");
			output("\n\nOne of the slaves, her eyes gleaming with fanaticism, launches herself onto the royal nyrea and wraps her arms around the princess’s neck, her legs around her waist, and her folds around her pulsing, too-hard boner.");
			output("\n\nA few powerful thrusts bounce the soft-bottomed slave into the air. She has to cling tightly to keep from being bucked off by the bitch’s vicious bounces. Her quavering moans leave you no doubt as to her enjoyment of the brief rut, and the traitorous slut even looks over her mistress’s shoulder at you, smiling as light purple cream begins to drip from between her thighs.");
			output("\n\nThe princess shudders, then bodily tosses her submissive cum-receptacle across the room and onto the bed. Her face is flushed, but much of the tension has left her body. Fuck. So long as she can get off so quickly and so easily with her slaves, you won’t be able to beat her this way. <b>You’ll have to try a different tactic.</b>");
			lust(-100);
		}
		
		private function vialGetsHockedAtPCFaaaace(target:Creature):void
		{
			output("The nyrean princess lobs a vial of red-tinted myr-spit at you!");
			//Dodge
			if(rangedCombatMiss(this, target)) 
			{
				output("\nYou slip away from the clumsy projectile");
				if(rand(3) == 0) output(", leaving it to shatter on the upraised arm of one of her harem slaves. The unfortunate creature’s eyes dilate until they look like inky saucers, and she slumps to the floor, her hips quivering weakly along the way.");
				else if(rand(2) == 0) output(", letting it impact on a wall behind you. One of the harem slaves dives for it, crying out when she misses her chance to catch the drugged liquid in her mouth.");
				else output(", allowing it to bounce off a cushion and into the chitinous palms of a grinning slave. You don’t get a chance to see what she does with it.");
			}
			//Impact
			else
			{
				output("\nDespite your attempts to avoid it, it ");
				if(target.shields() > 0) output("slips through your shield, too slow to be blocked, and ");
				output("crashes into your upraised forearm. The thin glass shatters, you’re splattered in one of the more potent aphrodisiacs this side of the Milky Way.");
				if(!(target.armor is EmptySlot)) 
				{
					if(!target.hasAirtightSuit()) output(" Your [pc.armor] doesn’t do much to stop it either. The insidious stuff slips through cracks and seams with alarming ease. You doubt anything but an airtight suit could stop it.");
					else 
					{
						output(" Your [pc.armor] handles the stuff with almost contemptuous ease, allowing the insidious fluid to drip down its airtight surface to the floor where it can’t trouble anything but rock.");
						return;
					}
				}
				// Permeated armor or no armor:
				output(" Once it hits your [pc.skinFurScales], it soaks ");
				if(!target.hasFur() && !target.hasScales()) output("in");
				else output("into the [pc.skin] beneath");
				output(" with alarming speed. Attempts to wipe it away just smear the crimson narcotic across your fingers, giving it another vector to worm its way into your system.");
				
				var damage:DamageResult = applyDamage(new TypeCollection({ drug: 10+rand(4) } ), this, target, "suppress");
				
				//New PG. Lust reaction!
				//0-10 Lust
				if (target.lust() <= 10) output("\n\nYou can feel your cheeks heating against your will, and it’s suddenly more difficult to pull your eyes from the bouncing nyrean royalty so close at hand.");
				//11-20
				else if(target.lust() <= 20) output("\n\nWhy haven’t you noticed how cute the princess’s nose is before  now? And her lips... her lips are magnificent – a work of art. You shake your head to clear the errant thoughts away.");
				///21-30
				else if(target.lust() <= 30) output("\n\nThe princess’s breasts bounce in the most hypnotic way. You regretfully tug your eyes away, but they unerringly wind their way back to her purplish, jutting nipples. Did she spill some on herself, or is she getting off on this?");
				//31 – 40
				else if(target.lust() <= 40) output("\n\nYou feel a stirring in your loins. At least if you end up giving in you’ll wind up enjoying whatever the princess does to you.");
				//41-50
				else if(target.lust() <= 50) output("\n\nOooh, that felt... good. There’s no hiding your growing arousal anymore, not from the princess and certainly not from yourself. Your body wants her, wants her like a thirsty man craves a glass of water, or a man on a diet aches for a cheeseburger.");
				//51-60
				else if(target.lust() <= 60) output("\n\nYour heart flutters with excitement and vulnerability. You can feel your muscles wanting to slacken, wanting to ease you into the princess’s arms. You fight the narcotic euphoria off with a grunt of irritation. You can’t take many more hits like that.");
				//61-70
				else if(target.lust() <= 70) 
				{
					output("\n\nYou realize that you’ve started panting a moment later, but your body doesn’t seem to want to stop.");
					if(target.race() == "ausar" || target.race() == "half-ausar" || target.originalRace == "half-ausar") output(" Must be some kind of ausar instinct.");
					output(" You’re horny, damnit, and there’s a nyrea right over there that’s willing to fuck you. All you have to do is submit to her, let her put a few eggs into you, then you can get relief. It’s quite tempting.");
				}
				//71-80
				else if(target.lust() <= 80) 
				{
					if(target.hasCock() && target.hasVagina()) output("\n\nGoddamn, having two sets of genitals has never felt more like a liability than at this very moment. Desires to fuck and <i>be fucked</i> battle over the hormones and endorphins flooding your bloodstream. You sway on your feet, painfully aware of just how easy it would be to kneel to the princess and satisfy it all, again and again and again...");
					else if(target.hasCock()) 
					{
						output("\n\nDamn, it feels less like you’ve got ");
						if(target.cockTotal() == 1) output("an erection");
						else output("erections");
						output(" and more like you’ve sprouted ");
						if(target.cockTotal() == 1) output("an aching length");
						else output("aching lengths");
						output(" of stone with ");
						if(target.cockTotal() == 1) output("a creamy center");
						else output("creamy centers");
						output(" just waiting to burst free.");
					}
					else if (target.hasVagina()) 
					{
						output("\n\nFuck, you’re so warmed up that you feel less like you’ve got ");
						if(target.totalVaginas() == 1) output("a vagina");
						else output("vaginas");
						output(" between your legs and more like ");
						if(target.totalVaginas() == 1) output("a ");
						output("hot spring");
						if(target.totalVaginas() > 1) output("s");
						output(", bubbling with effervescent warmth that erodes your willpower as easily as grains of sand.");
					}
					else output("\n\nUgh, how can you be entirely without normal genitalia and yet so excited by the prospect of intercourse? Your [pc.asshole] clenches at the thought of the princess’s less-than-feminine member prying your sphincter open to deposit some eggs.");
				}
				//81-90
				else if(target.lust() <= 90)
				{
					output("\n\nYou whimper – actually whimper – with need. You don’t want to, but your body... your body needs to. Mere arousal doesn’t describe what you feel any longer. A white-hot inferno of passion rages within your breast, threatening to burn away your reason and replace it with a primal, pernicious desire to fuck, to procreate and revel in the act of giving over to pure, animal instinct.");
				}
				//Hit max?
				else if(target.lust() >= target.lustMax())
				{
					output("\n\nNo more... you can’t handle anymore. Your venom-fueled ardor bursts through the levee of your restraint, and with a moan of unrepentant, animalistic desire, you give in.");
				}
				//91-100
				else if(target.lust() <= 100)
				{
					output("\n\n[pc.LegOrLegs] quaking, you struggle to stay upright and fight. Your body wants to sag down and present itself for a good fucking, whether by another member of the harem or the princess herself. You’re certain that a single, stray drop of that venom would push you over the edge at this point. If you don’t want to be a mewling fucktoy, you’ll have to act and act now.");
				}
				//101-110
				else if(target.lust() <= 110)
				{
					output("\n\nIf you were any normal person, the liquid, aphrodisiac-enhanced desire coursing through your veins would have you rutting with the horny, nyrean sluts surrounding you, but to you... to you, you’re just starting to enjoy yourself. Do you want to fuck so badly that it’s impossible to think of anything else? Sure. Do you want to cede control of the situation over to this stuck up bitch? No way, it doesn’t matter how languid your muscles are getting.");
				}
				//111+
				else
				{
					output("\n\nYour [pc.skin] is so hot and so tender that every breeze, every swishing gush of air across your body sends sparks of ecstasy up your spine. Superhuman as your libido may be, there are limits to what the mortal mind can endure. Submitting would be so much easier....");
				}
				outputDamage(damage);
			}
		}
	}

}