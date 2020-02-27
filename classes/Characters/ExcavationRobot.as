package classes.Characters
{
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Engine.Interfaces.output;
	import classes.Engine.Combat.*;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Guns.LaserCarbine;
	/*import classes.Items.Miscellaneous.Picardine;
	import classes.Items.Miscellaneous.Kirkite;
	import classes.Items.Treasures.Savicite;
	import classes.Items.Miscellaneous.Satyrite;*/
	import classes.Items.Protection.ProtoShield;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.Engine.Utility.possessive;
	
	public class ExcavationRobot extends Creature
	{
		public function ExcavationRobot()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "excavation robot";
			this.originalRace = "robot";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = "You’re fighting some kind of monstrous crab-spider made of black metal and grinding gears, equipped with several gnashing claws and drills for extraterrestrial excavation. A pair of glowing red “eyes” - really sensors, and clearly quite powerful - stare down at you, one over the other. The steel beast has no mouth, its lunges and strikes are all accompanied by howls of crackling static across all channels, giving it an almost bestial roar!";
			this.customDodge = "It’s bouncing, insectoid movements carry it out of the way!";
			this.customBlock = "The machine’s thick plates cause the attack to glance off!";
			this.isPlural = false;
			
			isLustImmune = true;
			
			this.meleeWeapon.attackVerb = "drill";
			this.meleeWeapon.longName = "pincers";
			this.meleeWeapon.attackNoun = "drill";
			
			meleeWeapon.baseDamage.kinetic.damageValue = 3;
			meleeWeapon.baseDamage.addFlag(DamageFlag.PENETRATING);
			
			this.meleeWeapon.hasRandomProperties = true;

			this.rangedWeapon = new LaserCarbine();
			
			this.armor.longName = "metal plates";
			this.armor.defense = 15;
			this.armor.hasRandomProperties = true;

			this.shield = new ProtoShield();
			
			//50% kinetic res, 100% elec vuln!
			//baseHPResistances.kinetic.damageValue = 50.0;
			baseHPResistances.electric.damageValue = -100.0;
			
			this.physiqueRaw = 45;
			this.reflexesRaw = 1;
			this.aimRaw = 30;
			this.intelligenceRaw = 10;
			this.willpowerRaw = 1;
			this.libidoRaw = 0;
			this.shieldsRaw = this.shieldsMax();
			this.energyRaw = 100;
			this.lustRaw = 0;
			this.level = 10;
			this.XPRaw = bossXP();
			this.credits = 0;
			this.HPMod = 900;
			this.HPRaw = this.HPMax();

			this.femininity = 5;
			this.eyeType = 0;
			this.eyeColor = "red";
			this.tallness = 12*12;
			this.thickness = 50;
			this.tone = 50;
			this.hairColor = "none";
			this.scaleColor = "none";
			this.furColor = "none";
			this.hairLength = 0;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = 0;
			this.skinTone = "metal";
			this.skinFlags = new Array();
			
			this.faceType = GLOBAL.TYPE_HUMAN;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_HUMAN;
			this.lipMod = 0;
			this.earType = GLOBAL.TYPE_HUMAN;
			this.antennae = 2;
			this.antennaeType = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = 0;
			this.gills = false;
			this.wingType = 0;
			this.legType = 0;
			this.legCount = 0;
			this.legFlags = new Array();
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = 0;
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
			this.buttRatingRaw = 0;
			//No dicks here!
			this.cocks = new Array();
			//balls
			this.balls = 0;
			this.cumMultiplierRaw = 0;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 0;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 0;
			this.ballFullness = 0;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 0;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 0;
			this.minutesSinceCum = 9999;
			this.timesCum = 0;
			this.cockVirgin = true;
			this.vaginalVirgin = true;
			this.analVirgin = true;
			this.vaginas = new Array();
			this.cocks = new Array();
			//Goo is hyper friendly!
			this.elasticity = 0;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 0;
			this.clitLength = 0;
			this.pregnancyMultiplierRaw = 0;
			
			this.createStatusEffect("Infertile");
			
			this.breastRows[0].breastRatingRaw = 0;
			this.nippleColor = "black";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			this.ass.loosenessRaw = 0;
			this.ass.bonusCapacity = 0;
			
			this.createStatusEffect("Disarm Immune");
			this.createStatusEffect("Stun Immune");
			this.createStatusEffect("Force It Gender");
			
			isUniqueInFight = true;
			btnTargetText = "E.Rbt";
			randomise();
			this._isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return "EXCAVATION_ROBOT";
		}

		public function randomise():void
		{
			/*if(rand(2) == 0) this.inventory.push(new Picardine());
			if(rand(2) == 0) this.inventory.push(new Kirkite());
			if(rand(2) == 0) this.inventory.push(new Savicite());
			if(rand(2) == 0) this.inventory.push(new Satyrite());
			if(this.inventory.length == 0) this.inventory.push(new Satyrite());*/
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			if(rand(3) == 0) meanLeftHook(target);
			else if(rand(3) == 0) eyebiteNom(target);
			else if(rand(2) == 0) flammewerfer(target);
			else biteTheCurbBitch(target);
		}

		//Mean Left Hook
		//Basic attack, deals massive Kinetic/Crushing damage.
		public function meanLeftHook(target:Creature):void
		{
			output("The bestial robot scuttles forward, swinging its two massive grappling arms at you like a pair of tree trunks. There’s a massive roar across the comms as the beast comes in for the kill");
			if(combatMiss(this, target)) output(", but you’re able to awkwardly duck down and avoid the strikes!");
			else 
			{
				output(". You tank the hit right in the chest, staggering back with the devastating impact!");
				meleeWeapon.baseDamage.kinetic.damageValue = 10;
				meleeWeapon.baseDamage.addFlag(DamageFlag.CRUSHING);
				meleeWeapon.baseDamage.removeFlag(DamageFlag.PENETRATING);
				applyDamage(meleeDamage(), this, target, "minimal");
			}
		}
		//Flammenwerfer
		//Werfs flammen. Moderate fire damage; Reflex save negates. Causes DoT whether the initial attack hits or misses.
		public function flammewerfer(target:Creature):void
		{
			output("One of the fuel lines on the mining bot has ruptured, and it has no problem squirting fuel at you in big, floating globs of colorful fluid. It would be almost pretty... if the bastard didn’t immediately turn an internal laser cutter towards a thick wad of floating explosive and zap it. There’s an immediate burst of flames, roiling and splattering across you in the gravity-less void of space; even that which doesn’t hit you now remains floating around you, threatening to burn you any moment!");
			if(target.reflexes()/2 + rand(20) + 1 >= this.aim()/2 + 10) output("\nYou safely avoid the fire!");
			else
			{
				var damage:TypeCollection = new TypeCollection({ burning: 70 });
				applyDamage( damage , this, target, "minimal");
			}
		}
		//Bite The Curb, Bitch
		//Causes knockdown and massive physical damage. PC must pass an INT save or take INT and PHYS damage for the fight.
		public function biteTheCurbBitch(target:Creature):void
		{
			output("One of the massive mining machine’s grappling claws swings in, ");
			if(combatMiss(this, target)) output("trying to grab you. You manage to duck away just in time!");
			else 
			{
				output("grabbing your bubble helm by the face plate and slamming you backwards! You go down with a sharp cry of pain, feeling the deck shudder under you. The claws squeeze and its saws buzz, trying to tear through your helmet!");
				
				meleeWeapon.baseDamage.kinetic.damageValue = 5;
				meleeWeapon.baseDamage.addFlag(DamageFlag.PENETRATING);
				meleeWeapon.baseDamage.removeFlag(DamageFlag.CRUSHING);
				applyDamage(meleeDamage(), this, target, "minimal");

				if(!target.hasStatusEffect("Tripped") && !target.isPlanted()) 
				{
					CombatAttacks.applyTrip(target);
					output(" <b>You’re prone (tripped)!</b>");
				}
				if(target.intelligence()/2 + rand(20) + 1 > 20) output("\n\nYou manage to keep your wits about you and direct the suit’s auto-repair to full bore on your faceplate, preventing too much oxygen from bleeding out. It doesn’t make your injuries hurt any less!");
				else 
				{
					output("\n\nYou panic, trying to keep the suit together; luckily there’s an automated repair function, otherwise you’d be breathing space and sucking sawblades - but before it can seal up, a great deal of air hisses out into the aether, leaving you gasping for breath and feeling painfully light-headed.");
					target.changeEnergy(-40);
				}
			}
		}
		//Eyebite
		//One high damage laser shot - the eyes count as one attack together.
		public function eyebiteNom(target:Creature):void
		{
			output("The robot plants its many feet, slamming them into the stone and the catwalk to brace itself as the bright glow of its eyes increases exponentially. The light erupts into a beam of searing red light, lancing across the deck and right towards you!");
			if(rangedCombatMiss(this, target)) output(" You throw yourself onto the deck, barely dodging the blast!");
			else 
			{
				output(" Your lucky there’s heat shields on this suit, otherwise you’d have just gotten cut in half!");
				rangedWeapon.baseDamage.burning.damageValue = 70;
				rangedWeapon.baseDamage.addFlag(DamageFlag.LASER);
				applyDamage(rangedDamage(), this, target, "minimal");
			}
		}
	}
}
