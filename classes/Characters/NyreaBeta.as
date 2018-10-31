package classes.Characters 
{
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Items.Melee.Fists;
	import classes.Items.Protection.NovaShield;
	import classes.kGAMECLASS;
	import classes.Util.RandomInCollection;

	import classes.Items.Melee.NyreanSpear;
	import classes.Items.Miscellaneous.Picardine;
	import classes.Items.Miscellaneous.Kirkite;
	import classes.Items.Miscellaneous.Satyrite;
	import classes.Items.Drinks.RedMyrVenom;
	import classes.Items.Transformatives.NyreanCandy;
	
	import classes.GLOBAL;
	import classes.CockClass;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Engine.Combat.*; 
	import classes.Engine.Interfaces.output;
	
	/**
	 * ...
	 * @author Gedan
	 */
	
	public class NyreaBeta extends Creature
	{
		
		public function NyreaBeta() 
		{
			this._latestVersion = 1;
			this.version = this._latestVersion;
			this._neverSerialize = true; // Setting this will stop a given NPC class from ever being serialized.
			
			this.short = "nyrea huntress";
			this.originalRace = "nyrea";
			this.a = "the ";
			this.capitalA = "The ";
			this.tallness = 72;
			this.scaleColor = "green";
			this.long = "This insectile woman looks like a black-armored amazon, tall and exceptionally buxom, with dark chitin plates covering her arms and legs, combining into an underbust corset of armor to protect her torso -- though conveniently leaving her big tits and groin exposed -- a groin which is sporting an impressive cock. Easily a foot long, her shaft is barely restrained by a padded chainmail bikini, though even partially covered you can see how thick and heavy it is. Even as one weapon draws your attention, the huntress moves with preternatural grace, circling you, probing at your defenses with her long, steel-tipped spear. Any hesitation, any weakness, and she’ll be on you!";
			
			this.isPlural = false;
			
			this.meleeWeapon = new NyreanSpear();
			
			this.physiqueRaw = 13;
			this.reflexesRaw = 19;
			this.aimRaw = 13;
			this.intelligenceRaw = 6;
			this.willpowerRaw = 6;
			this.libidoRaw = 40;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 10;
			
			baseHPResistances = new TypeCollection();
			baseHPResistances.kinetic.damageValue = 15.0;
			baseHPResistances.electric.damageValue = 15.0;
			baseHPResistances.burning.damageValue = 15.0;
			
			this.level = 6;
			this.XPRaw = normalXP();
			this.credits = 0;
			this.HPMod = 25;
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
			this.cumType = GLOBAL.FLUID_TYPE_NYREA_CUM;
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
			this.ass.wetnessRaw = 1;
			this.ass.loosenessRaw = 4;
			
			this.hairLength = 10;
			
			this.cocks = [];
			this.cocks.push(new CockClass());
			(this.cocks[0] as CockClass).cType = GLOBAL.TYPE_NYREA;
			(this.cocks[0] as CockClass).cLengthRaw = 13;
			(this.cocks[0] as CockClass).cThicknessRatioRaw = 1.66;
			(this.cocks[0] as CockClass).addFlag(GLOBAL.FLAG_KNOTTED);
			(this.cocks[0] as CockClass).virgin = false;
			this.cockVirgin = false;
			
			createStatusEffect("Force Fem Gender");
			
			isUniqueInFight = true;
			btnTargetText = "Nyrea";
			
			tallness = 60 + (rand(10) - 5);
			
			if (rand(20) == 0) inventory.push(new Kirkite());
			else if(rand(20) == 0) inventory.push(new Satyrite());
			else if (rand(20) == 0) inventory.push(meleeWeapon.makeCopy());
			else if (rand(5) == 0)
			{
				inventory.push(new NovaShield());
				shield = new NovaShield();
				shields(shieldsMax());
				this.long += "\n\n<b>This Nyrea has a shield generator! If you can beat her, you can claim it for yourself...</b>";
				this.HPMod = -10;
				this.HPRaw = this.HPMax();
			}
			if (rand(3) == 0) inventory.push(new NyreanCandy());
			if (rand(3) == 0) inventory.push(new RedMyrVenom());
			
			sexualPreferences.setPref(GLOBAL.SEXPREF_FEMININE,		GLOBAL.REALLY_LIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_BREASTS,		GLOBAL.REALLY_LIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_BUTTS,		GLOBAL.KINDA_LIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_NEUTER,			GLOBAL.KINDA_DISLIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_VAGINAL_WETNESS,	GLOBAL.KINDA_LIKES_SEXPREF);
			sexualPreferences.setPref(GLOBAL.SEXPREF_MASCULINE,		GLOBAL.KINDA_LIKES_SEXPREF);
			kGAMECLASS.myrellionSSTDChance(this);
			this._isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return "NYREA_BETA";
		}

		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			var attacks:Array = [];

			var lustChance:int = ((HP() / HPMax()) * 100) - 20; // as they take damage, will switch to more physical attacks

			if (rand(100) >= lustChance && !hasStatusEffect("Disarmed"))
			{
				attacks.push(nyreaSpearThrust);
				attacks.push(nyreaPowerStrike);
				if (!target.hasStatusEffect("Grappled") && !hasStatusEffect("Net Cooldown")) attacks.push(nyreaNetThrow);
			}
			else
			{
				attacks.push(nyreaMeatSpin);
				attacks.push(nyreaPoledance);
				attacks.push(nyreaMilkRub);
			}

			attacks[rand(attacks.length)](target);
		}
		
		public function nyreaMilkRub(target:Creature):void
		{
			//Light lust attack, heals some of her HP
			output("Giving you a cocky look, the nyrea pulls up the thin veneer of chain covering her ample bosom and cups her tits, giving them a long, obviously-pleasurable squeeze. A trickle of cream-colored milk spurts out at her touch, barely needing to be coaxed. She winks at you, bringing one of her teats to her lips and drinking long as the other drizzles all over her body, which she deftly rubs into her skin and armor.\n");

			var damage:TypeCollection = new TypeCollection( { tease: 15 } );
			;

			if (rand(10) <= 3 && !target.hasAirtightSuit())
			{
				output("\nGod, that smells delicious...");
			}
			else
			{
				output("\nYou try to contain the watering of your mouth as you watch the lewd display in front of you. What you wouldn’t give for a taste of that sweet cream...");
			}

			applyDamage(damageRand(damage, 15), this, target);
		}
		
		public function nyreaNetThrow(target:Creature):void
		{
			createStatusEffect("Net Cooldown", 5, 0, 0, 0, true);

			output("Using her longspear to force some distance between you, the nyrea reaches into her pack and pulls out another hunting net. With a flick of her wrist, she hurls it at you.\n");

			if (rangedCombatMiss(this, target, 0, 3))
			{
				output("\nYou roll aside, letting the net go clattering off into the darkness.\n");
			}
			else
			{
				output("\nYou try and dodge, but too late! You give a yelp as the heavy net carries you down to the ground, entangling you!");
				CombatAttacks.applyGrapple(target, 35, false, "You’re stuck in a nyrea’s hunting net!");
			}
		}
		
		public function nyreaPoledance(target:Creature):void
		{
			//Her preferred lust attack against males. 
			output("The nyrea plants her spear in the ground, leaning heavily on the sturdy shaft, pressing it between her impressive rack. <i>“Like what you see?”</i> she giggles, voice suddenly sultry as she leans back from the haft, twisting around you give you a full view of her taut ass and long, chitinous legs. She bends over, rubbing her spear through her crack, smearing it with her psuedo-cock’s ample pre. <i>“Come off it already... put your weapons down...</i>");
			output("<i> I promise you’ll be glad you did</i>");
			output("<i>.”</i>\n");

			// 9999
			if (target.lust() >= target.lustMax() * 0.75)
			{
				output("\nYou look away from her tantalizing display, doing your best to contain your lust.");
			}
			else
			{
				output("\nYou can’t deny the growing heat in your loins as the nyrea puts on a show for you, all but inviting you into her embrace...");

				var damage:TypeCollection = new TypeCollection( { tease: 15 } );
				applyDamage(damageRand(damage, 15), this, target);
			}
		}
		
		private function nyreaSpearThrust(target:Creature):void
		{
			//Basic Attack
			output("The nyrea charges forward, thrusting her heavy spear at you!\n");

			if (combatMiss(this, target))
			{
				output("\nYou duck aside, letting her momentum carry her past you.");
			}
			else
			{
				output("\nShe turns the blade at the last second, slamming the blunted haft of the spear into your chest, throwing you back with the force of the blow! ");

				applyDamage(damageRand(meleeDamage(), 15), this, target);
			}
		}
		
		private function nyreaMeatSpin(target:Creature):void
		{
			//Basic lust attack. She'll use this especially against females.
			output("With a lusty grin, the nyrean woman pulls up her chainmail bikini, letting her massive pseudo-cock flop out. Her hands rub across the long length, emphasizing its huge, blunted head and the fearsomely thick knot at its base, clearly ready to tie you like a bitch. She thrusts her hips, making the semi-turgid member bounce. A dribble of lubricant is flicked out, splattering across your");
			
			if(target.hasAirtightSuit())
			{
				output(" face.");
				output("\n\nLuckily, your head is protected and you quickly wipe the cock-drool off.");
				return;
			}
			
			output(" [pc.face].\n");

			// 9999
			if (rand(10) == 0)
			{
				output("\nYou wipe her cock-drool off with disgust.");
			}
			else
			{
				output("\nUnwittingly, you breathe in at that exact moment, getting a full blast of the potent sexual aroma the insectile beauty is giving off.");

				var damage:TypeCollection = new TypeCollection( { tease: 7, pheromone: 7 } );
				applyDamage(damageRand(damage, 15), this, target);
			}
		}
		
		private function nyreaPowerStrike(target:Creature):void
		{
			//Rarest of her attacks, ramps up use on low HP. Lower chance to hit, but HEAVY damage. Has a chance to STAGGER the PC.
			output("The nyrea woman rushes at you, leaping into the air and issuing a mighty warcry as she slams her spear down at you with crushing force.");

			if (combatMiss(this, target) || target.isPlanted())
			{
				output(" You tumble out of the way in the nick of time, looking back to see the huntress crash into the ground, nearly falling over thanks to the force of her attack. She staggers to her feet and scowls. <i>“You wanted to do this the hard way!”</i>");
			}
			else
			{
				output(" You cry out as the spear crashes into you, throwing you to the ground with nearly bonecrushing force.");
				
				var damage:TypeCollection = meleeDamage();
				damage.multiply(1.25);
				applyDamage(damageRand(damage, 15), this, target);

				if (rand(2) == 0)
				{
					output("\nYou blink hard");
					if (target.shieldsRaw > 0) output(" thankful your shields held");
					else output(" wiping blood from your brow");
					output(" as your vision swims. The nyrea, battered herself, scowls at you. <i>“You wanted to do this the hard way!”</i>");

					CombatAttacks.applyTrip(target);
				}
			}
		}
		
	}

}