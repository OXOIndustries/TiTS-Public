package classes.Characters
{
	import classes.Creature;
	import classes.Engine.Combat.DamageTypes.DamageResult;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.GLOBAL;
	import classes.Items.Melee.Fists;
	import classes.Items.Miscellaneous.*
	import classes.Items.Guns.PrimitiveBow;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.GameData.CodexManager;
	import classes.GameData.CombatManager;
	import classes.GameData.CombatAttacks;
	import classes.Engine.Utility.num2Text;
	import classes.Engine.Interfaces.output;
	import classes.Engine.Combat.*;
	
	public class ZilMale extends Creature
	{
		//constructor
		public function ZilMale()
		{
			this._latestVersion = 2;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			// Originally a clone of the zilpack
			// Needs a few things checked.
			this.short = "zil male";
			this.originalRace = "zil";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = "OHGODFIXME";
			this.customDodge = "The zil zips out of the way with a swift contortion of his agile frame.";
			this.customBlock = "The zil’s chitinous armor deflects your attack.";
			this.isPlural = false;
			this.meleeWeapon = new Fists();
			
			this.armor.longName = "chitinous plating";
			this.armor.defense = 0;
			this.armor.hasRandomProperties = true;
			
			this.physiqueRaw = 3;
			this.reflexesRaw = 2;
			this.aimRaw = 1;
			this.intelligenceRaw = 1;
			this.willpowerRaw = 1;
			this.libidoRaw = 40;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 45;
			this.level = 1;
			this.XPRaw = normalXP();
			this.credits = 0;
			this.HPMod = 7;
			this.HPRaw = this.HPMax();
			
			this.femininity = 35;
			this.eyeType = GLOBAL.TYPE_BEE;
			this.eyeColor = "black";
			this.tallness = 54;
			this.thickness = 20;
			this.tone = 70;
			this.hairColor = "black";
			this.scaleColor = "black";
			this.furColor = "yellow";
			this.hairLength = 3;
			this.hairType = GLOBAL.HAIR_TYPE_HAIR;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_CHITIN;
			this.skinTone = "black";
			this.skinFlags = new Array();
			this.faceType = GLOBAL.TYPE_HUMAN;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_BEE;
			this.lipMod = 0;
			this.earType = 0;
			this.antennae = 2;
			this.antennaeType = GLOBAL.TYPE_BEE;
			this.horns = 0;
			this.hornType = 0;
			this.armType = GLOBAL.TYPE_BEE;
			this.gills = false;
			this.wingType = GLOBAL.TYPE_BEE;
			wingCount = 2;
			this.legType = GLOBAL.TYPE_BEE;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE];
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
			this.buttRatingRaw = 2;
			//No dicks here!
			this.cocks = new Array();
			this.createCock();
			this.cocks[0].cLengthRaw = 6;
			this.cocks[0].cThicknessRatioRaw = 1.75;
			this.cocks[0].cockColor = "black";
			this.cocks[0].cType = GLOBAL.TYPE_BEE;
			//balls
			this.balls = 2;
			this.cumMultiplierRaw = 6;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_HONEY;
			this.ballSizeRaw = 1;
			this.ballFullness = 1;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 10;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 6;
			this.minutesSinceCum = 3650;
			this.timesCum = 321;
			
			//Goo is hyper friendly!
			this.elasticity = 1;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1.05;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;
			
			impregnationType = "ZilPregnancy";
			
			this.breastRows[0].breastRatingRaw = 0;
			this.nippleColor = "black";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_HONEY;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			this.ass.bonusCapacity += 15;

			this.createStatusEffect("Disarm Immune");
			this.createPerk("Appearance Enabled");
			
			isUniqueInFight = true;
			btnTargetText = "ZilMale";
			
			this._isLoading = false;
			
			sexualPreferences.setRandomPrefs(5+rand(3));
			tallness = 60 + rand(7);
			cocks[0].cLengthRaw = 4 + rand(5);
			long = "The male zil would stand roughly " + displayTallness() + " tall were he to touch the ground, but instead, he’s supporting himself on rapidly fluttering wings, keeping his genitals at just the right height to waft his sweet musk in your direction. His only ‘armament’ is a " + num2Text(longestCockLength()) + "-inch penis with a tight, hairless sack underneath; he bears no weapon in his hand and no stinger. The zil’s body is almost entirely covered by an ebony carapace";
			if(rand(2) == 0) 
			{
				long += ", though some areas are striped in bright yellow";
				cocks[0].cockColor = "gold";
			}
			long += ".";
			if(rand(5) == 0) inventory.push(new PrimitiveBow());
			else inventory.push(new ZilRation());

			createStatusEffect("Flying", 0, 0, 0, 0, false, "Icon_Wings", "Flying, cannot be struck by normal melee attacks!", true, 0);

			kGAMECLASS.mhengaSSTDChance(this);
		}
		
		override public function get bustDisplay():String
		{
			return "ZIL";
		}
		
		public function UpgradeVersion1(dataObject:Object):void
		{
			if (dataObject.legFlags.length == 0)
			{
				dataObject.legFlags.push(GLOBAL.FLAG_PLANTIGRADE);
			}
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			
			if (target == null) return;
			
			if(((HPMax() - HP())/HPMax()) * 200 > rand(100))
			{
				if(CombatManager.getRoundCount() % 4 == 0) zilHardenSingle();
				else if(rand(4) == 0) flurryOfBlows(target);
				else if(rand(3) == 0) zilFlyingSpinKickSingle(target);
				else if(rand(2) == 0) zilDrop(target);
				else CombatAttacks.MeleeAttack(this, target);
			}
			else 
			{
				if(rand(3) == 0) zilCrotchGrind(target);
				else if(rand(2) == 0) zilPheromoneFan(target);
				else zilHoneyDrip(target);
			}
		}
		
		private function zilCrotchGrind(target:Creature):void
		{
			output("Zipping forward, the zil brings his ");
			if(lust() < 33) output("sensitive");
			else if(lust() <= 66) output("stiff");
			else if(lust() <= 75) output("throbbing");
			else if(lust() <= 85) output("dripping");
			else output("drooling");
			output(" dick right into your [pc.face]. The soft shroud of his foreskin rubs hotly against you, peeling back to barely expose the ebony glans that is prodding your forehead.");
			if(target.hasAirtightSuit())
			{
				output(" You gasp and stumble away when you see his cock produce an oily streak. Pheromones, no doubt. Fortunately for you, your [pc.armor] is airtight, so any reactions you could have had to it are assuredly blocked.");
			}
			else
			{
				output(" You gasp and stumble away, not realizing your mistake until the chemical deluge hits your senses.");
				if(target.lust() <= 33) output(" Uh, wow... you could probably go for another sniff of that.");
				else if(target.lust() <= 66) output(" Mmmm, he smells so good that you could just drop down to your knees and let him drag it all over.");
				else if(target.lust() <= 75) output(" Yum! You inhale another deep drag of his diminishing aroma and wonder if it wouldn’t be too bad to give in to him.");
				else output(" Ungh, why aren’t you letting him fuck your mouth so that you can breathe in more?");
				if(kGAMECLASS.flags["TIMES_LOST_TO_ZIL"] == 1) output(" You’ve let him win before and nothing bad came of it, what’s wrong with one more submission?");
				else if(kGAMECLASS.flags["TIMES_LOST_TO_ZIL"] == 2) output(" You’ve given into these aliens twice already. Surely the third time is the charm...");
				else if(kGAMECLASS.flags["TIMES_LOST_TO_ZIL"] == 3) output(" You’ve let them use you a handful of times. What’s once more?");
				else if(kGAMECLASS.flags["TIMES_LOST_TO_ZIL"] != undefined) output(" You’ve given in countless times already, why not live it up?");
				target.lust(10+target.libido()/10);
			}
		}
		
		private function zilPheromoneFan(target:Creature):void
		{
			output("The zil abruptly begins to fondle his [zil.cock], stimulating the organ as he alters his wingbeats to gust musk-laced air in your direction. He floats up high and flies erratically enough that you doubt you could hit him.");
			if(target.hasAirtightSuit())
			{
				output("\n\nLuckily your [pc.armor] is sealed tight, so you are unaffected by it. He grumps at his failed attempt. You definitely came prepared!");
			}
			// Moderate toughness check pass
			else if(target.physique() + rand(20) + 1 > 20) {
				output(" There’s nothing to do but try and hold your breath!");
				output("\nHe gets tired long before you do and gives up, but it still leaves a cloud of his delicious aroma floating around you. It’s strong enough to make your pulse quicken.");
				target.lust(5+target.libido()/20);
			}
			else {
				output(" There’s nothing to do but try and hold your breath!");
				output("\nEventually, you can hold your breath no longer, and you’re forced to inhale the potent cloud deep into your lungs. Your heart hammers in your chest faster and faster while your [pc.skin] flushes and your lips unconsciously purse.");
				if(target.lust() < 33) output(" A tingling warmth in your crotch leaves no doubts as to the effectiveness of your alien foe’s ‘attack’.");
				else if(target.lust() <= 66) output(" The warm, incessantly building heat in your loins is getting hotter and hotter with every breath you take.");
				else
				{
					output(" Your crotch feels so hot that you know you just HAVE to touch it soon. Damn this alien and his ");
					if(kGAMECLASS.silly) output("stupid ");
					output("sexy dick-scent!");
				}
				target.lust(10+target.libido()/10);
			}
		}
		
		private function zilHoneyDrip(target:Creature):void
		{
			output("Zipping high into the air, the Zil begins to jack himself off, stroking his thick, scented dong while amber droplets drip out of his voluptuous dickskin. His pre-cum drips down around you in long strings, some falling across your shoulders, head and face. It smells sweet and floral, like honey, and though it doesn’t seem laced with his pheromones, the lewdness of it all quickens your pulse.");
			target.lust(5+target.libido()/20);
		}
		
		private function flurryOfBlows(target:Creature):void
		{
			output("The zil launches a flurry of blows in your direction!\n");
			for (var i:int = 0; i < 3; i++)
			{
				CombatAttacks.SingleMeleeAttackImpl(this, target, true);
				output("\n");
			}
		}
		
		private function zilFlyingSpinKickSingle(target:Creature):void
		{
			output("An irritated snarl crosses the alien’s smooth lips, and he launches himself towards you. His body pivots in mid-air, accelerated by his wings, and he snaps his heel out towards your face at the last second.");
			if (combatMiss(this, target)) 
			{
				output("\nYou duck aside of his flying heel!");
			}
			else 
			{
				var damage:TypeCollection = damage(true);
				damage.add(physique() / 2);
				damageRand(damage, 15);
				var damageResult:DamageResult = calculateDamage(damage, this, target);
				
				if (damageResult.shieldDamage > 0)
				{
					if (damageResult.hpDamage == 0) output(" Your shield crackles but holds.");
					else output(" There is a concussive boom and tingling aftershock of energy as your shield is breached.");
				}
				
				if (damageResult.hpDamage > 0)
				{
					if (damageResult.shieldDamage == 0) output(" The armored bootheel connects with your cheek hard enough to turn your head and leave you seeing stars.");
					
					if (!target.hasStatusEffect("Stunned"))
					{
						output("<b> It’s concussive enough to leave you stunned.</b>");
						CombatAttacks.applyStun(target, 1);
					}
				}
				
				outputDamage(damageResult);
			}
		}
		
		private function zilDrop(target:Creature):void
		{
			output("The zil lowers his shoulder and charges at you, but it’s a feint! He diverts at the last second and makes to grab you under the arms as he passes.");
			if (combatMiss(this, target)) 
			{
				output(" You avoid it!");
				return;
			}
			// lift fail
			if((target.thickness + 100) * target.tallness >= 9900) {
				output(" He strains for a second, but the zil just can’t get your [pc.feet] up off the ground. Frustrated, he kicks off your back just before you can react.");
				// low damage
				applyDamage(new TypeCollection( { kinetic: 1 + rand(4) } ), this, target);
			}
			else 
			{
				output(" He proves strong enough to separate you from your footing. You struggle, but the ground gets further and further away. Then, he lets you go. ");
				if (!target.canFly()) 
				{
					output("There’s a moment of stomach-churning weightlessness followed by the hard crunch of you smacking into the forest floor.");
					applyDamage(new TypeCollection( { kinetic: 5 + rand(5) } ), this, target);
				}
				else output("You flutter down safely under your own power. It’s so good to be able to fly.");
				
			}
		}
		
		private function zilHardenSingle():void
		{
			output("Closing his onyx eyes, the zil flexes, and you hear quiet, barely audible cracks filling the busy, woodland air. You peer closer and realize that the zil’s carapace seems shinier, and perhaps a bit more formidable... just barely thicker, somehow.");
	
			var newRes:Number = (100 - baseHPResistances.kinetic.resistanceValue) / 5;
			baseHPResistances.kinetic.resistanceValue += newRes;
			createStatusEffect("Harden", 0, 30, 0, 0, false, "DefenseUp", "Defense against all forms of attack has been increased!", true, 0);
		}
	}
}
