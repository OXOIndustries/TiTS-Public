package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Protection.ImprovisedShield;
	import classes.Items.Protection.ArcticWarfareBelt;
	import classes.Items.Protection.JoyCoPremiumShield;
	import classes.Items.Protection.SalamanderShield;
	import classes.Items.Guns.HammerPistolScavenged;
	import classes.Items.Melee.YappiStrap;
	import classes.Items.Armor.InsulatedCoat;
	import classes.Items.Transformatives.KorgonneSnacks;
	import classes.Items.Upgrades.HardLightUpgrade

	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.GameData.CodexManager;
	import classes.Engine.Combat.DamageTypes.*;
	
	import classes.Engine.Interfaces.output;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CodexManager;
	import classes.Engine.Combat.*;
	import classes.Util.RandomInCollection;
	import classes.Util.InCollection;
	
	public class KorgonneMale extends Creature
	{
		//constructor
		public function KorgonneMale()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "korgonne raider";
			this.originalRace = "korgonne";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = "The korgonne raider facing you is a stocky, {furcolor}-furred alien, no more than {height} tall. He wears a thick hide coat with many pockets, and from the fur-lined hood pokes a short, canid nose. His legs are bound in hide wraps, and he stands atop the snow on his large, wide-splayed toes. The pockets of his coat bulge suspiciously... every minute, it seems like he dips into one for a new weapon or tool.";
			this.customDodge = "The korgonne raider flops backward into a snowdrift, letting the attack pass harmlessly overhead.";
			this.isPlural = false;

			this.meleeWeapon.attackVerb = "strike";
			this.meleeWeapon.longName = "ulu knife";
			this.meleeWeapon.attackNoun = "slash";
			this.meleeWeapon.hasRandomProperties = true;

			this.shield = new ImprovisedShield();
			this.shield.shields = 55;
			this.shield.hasRandomProperties = true;
				
			baseHPResistances = new TypeCollection();
			baseHPResistances.freezing.damageValue = 90.0;
			baseHPResistances.tease.damageValue = 65.0;
			baseHPResistances.drug.damageValue = 20.0;
			baseHPResistances.pheromone.damageValue = -30.0;
			baseHPResistances.burning.damageValue = -25.0;

			//armorbutt
			this.armor.longName = "fur-padded hides";
			this.armor.defense = 2;
			this.armor.hasRandomProperties = true;
			
			//wat shield - randomized below.
			//this.shield = new ImprovisedShield();

			this.physiqueRaw = 35;
			this.reflexesRaw = 15;
			this.aimRaw = 25;
			this.intelligenceRaw = 12;
			this.willpowerRaw = 31;
			this.libidoRaw = 30;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 10;
			
			this.level = 7;
			this.XPRaw = normalXP();
			//Credits set below.
			this.credits = 100;
			this.HPMod = -15;
			this.HPRaw = this.HPMax();
			this.shieldsRaw = this.shieldsMax();

			this.femininity = 25;
			this.eyeType = GLOBAL.TYPE_KORGONNE;
			this.eyeColor = "violet";
			this.tallness = 58; //between 4'6"-5'6" (mid-upper of range in codex)
			this.thickness = 62;
			this.tone = 55;
			this.hairColor = "dirty blonde";
			this.hairType = GLOBAL.TYPE_RASKVEL;
			this.scaleColor = "blue";;
			this.furColor = "tan";
			this.hairLength = 2;
			
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_FUR;
			this.skinTone = "white";
			this.skinFlags = new Array();
			this.faceType = GLOBAL.TYPE_CANINE;
			this.faceFlags = [GLOBAL.FLAG_MUZZLED];
			this.tongueType = GLOBAL.TYPE_CANINE;
			this.lipMod = 0;
			this.earType = GLOBAL.TYPE_CANINE;
			this.antennae = 0;
			this.antennaeType = GLOBAL.TYPE_HUMAN;
			this.horns = 0;
			this.hornType = 0;
			this.armType = GLOBAL.TYPE_CANINE;
			this.armFlags = [GLOBAL.FLAG_FURRED, GLOBAL.FLAG_PAWS];
			this.gills = false;
			this.wingType = GLOBAL.TYPE_HUMAN;
			this.legType = GLOBAL.TYPE_CANINE;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_DIGITIGRADE, GLOBAL.FLAG_PAWS];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_CANINE;
			this.tailCount = 1;
			this.tailFlags = [GLOBAL.FLAG_LONG, GLOBAL.FLAG_FLUFFY, GLOBAL.FLAG_FURRED];
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
			this.hipRatingRaw = 13;
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
			this.createCock();
			this.cocks[0].addFlag(GLOBAL.FLAG_TAPERED);
			this.cocks[0].addFlag(GLOBAL.FLAG_KNOTTED);
			this.cocks[0].addFlag(GLOBAL.FLAG_SHEATHED);
			this.cocks[0].cockColor = "black";

			this.cocks[0].cType = GLOBAL.TYPE_CANINE;
			this.vaginas = new Array();
			this.vaginalVirgin = true;
			this.analVirgin = true;
			this.cockVirgin = false;
			//balls
			this.balls = 1;
			this.cumMultiplierRaw = 20;
			this.impregnationType = "KorgonnePregnancy";
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 3;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 25;
			this.ballFullness = 100;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 80;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 2;
			this.minutesSinceCum = 420;
			this.timesCum = 1250;

			this.elasticity = 2;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1.05;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;

			this.breastRows[0].breastRatingRaw = 0;
			this.nippleColor = "black";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			this.ass.bonusCapacity += 15;
			
			isUniqueInFight = true;
			btnTargetText = "Korgonne";
			
			randomise();
			kGAMECLASS.uvetoSSTDChance(this);
			this._isLoading = false;
		}
		override public function get bustDisplay():String
		{
			//this.furColor = RandomInCollection(["white","tawny","gray-speckled"]);
			var colorString:String = "WHITE";
			if(this.furColor == "tawny") colorString = "TAWNY";
			else if(this.furColor == "gray-speckled") colorString = "GRAY";
			return "KORGONNE_MALE_" + colorString;
		}	
		private function randomise():void
		{
			//sex: male
			//height: between 4'6"-5'6" (mid-upper of range in codex)
			this.tallness = 54 + rand(13);
			//weight: 140-170 lbs (heavy side of codex range)
			//thickness: 60+ (maybe not as high as the females though)
			this.thickness = 50+rand(25);
			//tone: 50-60
			this.tone = 50+rand(11);
			//femininity: -60 to -70 (masculine)
			this.femininity = 20 + rand(10);
			//skin colors: same as females (according to codex: Tan, pale blue, or chocolate brown with black pigmentation common near the genitals)
			this.skinTone = RandomInCollection(["tan","pale blue","chocolate brown"]);
			//hair type: hair (or copy from female)
			//skin covering: fur/hair
			//fur/hair colors: same as female (codex: A mixture of white and tawny with black down the back)
			this.furColor = RandomInCollection(["white","tawny","gray-speckled"]);
			//ears: 2, canine (triangular and sit atop the head)
			//arms: 2, furred
			//legs: 2, furred, digitigrade
			//face: korgonne (codex: Humanoid in appearance with wide, expressive eyes and a short muzzle capped by a black, moist nose)
			//eyes: 2, caprine (goat-like pupils)
			//eye colors: brown, hazel, green
			this.eyeColor = RandomInCollection(["brown","hazel","green","violet"]);
			this.long = "The korgonne raider facing you is a stocky, " + furColor + "-furred alien, no more than " + Math.floor(tallness / 12) + "'";
			if(tallness % 12 != 0) long += tallness%12 + "\"";
			long += " tall. He wears a thick hide coat with many pockets, and from the fur-lined hood pokes a short, canid nose. His legs are bound in hide wraps, and he stands atop the snow on his large, wide-splayed toes. The pockets of his coat bulge suspiciously... every minute, it seems like he dips into one for a new weapon or tool.";

			//cocks: 1
			//cock type: korgonne
			this.cocks[0].cLengthRaw = 10 + rand(5);
			//cock size: 10-14" long, 1-1.5" thick at shaft
			//, 3-4" thick at knot when inflated (these are just guesses based on the female's scenes, e.g. using a balled fist as a knot replacement -- please double-check the female's capacity)
			this.cocks[0].knotMultiplier = 2.5+rand(20)/10;
			//anal capacity: idk, probably fits own cock range without knot at least
			//breasts: 2, flat
			//nipples: 1 per breast, normal type

			//"Hard" level preferences.
			sexualPreferences.setRandomPrefs(4 + rand(3),2);
			
			//Korg love 'dem hips
			sexualPreferences.removePref(GLOBAL.SEXPREF_WIDE_HIPS);
			sexualPreferences.setPref(GLOBAL.SEXPREF_WIDE_HIPS, GLOBAL.REALLY_LIKES_SEXPREF);

			credits = 200+rand(100);

			//old loot from females. Maybe reuse
			//5% chance of InsulatedCoat
			if(rand(20) == 0) inventory.push(new InsulatedCoat());
			//5% chance of yappstrapp
			if(rand(20) == 0) inventory.push(new YappiStrap());
			if(rand(4) == 0 && inventory.length == 0) inventory.push(new KorgonneSnacks());
			
			//Temporarily put on these snowbitches till I find a real home for it.
			if(!kGAMECLASS.pc.hasHardLightUpgraded() && rand(10) == 0) inventory.push(new HardLightUpgrade());
		}
		//combat A.I. and characteristics:
		//male korgonne fighting style is dirty and endurance-themed; aims to stun PC and to keep his own shield healthy with shield-drain until PC's shield fails and he can begin applying poison/bleed degen
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			//need disarmed ability!
			if(hasStatusEffect("Disarmed"))
			{
				uluKnifing(target);
			}

			//if korg is <20% HP or >80% lust, small (~25-33%) chance of using suspicious surrender (limit one use per battle and always activates&outputs /after/ PC's action for fidelity)
			//the turn after a suspicious surrender, /always/ use mercy's reward 'attack' to check whether PC has waited or not
			if(statusEffectv2("SURPRISE_MUTHA_TRUCKAH") != 1 && (hasStatusEffect("SURPRISE_MUTHA_TRUCKAH") || rand(3) == 0) && (this.HP()/this.HPMax() < 0.2 || this.lust() >= 80 || this.hasStatusEffect("SURPRISE_MUTHA_TRUCKAH")))
			{
				suspiciousSurrender(target);
			}
			//if PC's shield is up and korgonne's shield is >=40%, korgonne favors knife strike and yappi strap
			else if(target.shields() > 0 && this.shields()/this.shieldsMax() >= 0.4)
			{
				if(rand(3) == 0) yappiStrapAttack(target);
				else uluKnifing(target);
			}
			//if PC is shielded /and/ korgonne's shield is <40%, favor vamp knife charge to maintain shield
			else if(target.shields() > 0)
			{
				if(this.energy() >= 20 && rand(3) != 0) vampKnifeKorg(target);
				else if(rand(3) == 0) yappiStrapAttack(target);
				else uluKnifing(target);
			}
			//if PC is unshielded, favor pufferfish dart or knife strike depending on which degen status the PC /doesn't/ have (and whether enough energy to dart),  alternate with yappi strap to stun
			else
			{
				//Prioritize missing status!
				if(this.energy() >= 5 && target.hasStatusEffect("Bleeding") && !target.hasStatusEffect("Poison"))
				{
					korgoDartoAttack(target);
				}
				else if(!target.hasStatusEffect("Bleeding") && target.hasStatusEffect("Poison"))
				{
					uluKnifing(target);
				}
				//Neither status or both - random!
				if(this.energy() >= 5 && rand(2) == 0) korgoDartoAttack(target);
				else uluKnifing(target);
			}		
		}
		
		//attacks:
		//yappi strap slap
		//same as female; hits with yappi strap in off-hand for yappi strap damage+effect at yappi strap energy cost
		//attack noun: ‘lash’ (I think)
		//Yappi Strap
		private function yappiStrapAttack(target:Creature):void
		{
			var damage:TypeCollection
			//(First time per battle)
			if(!this.hasStatusEffect("Yappi Strappy"))
			{
				output("The korgonne distracts you with jab feints of his knife until he perceives an opening, then swings his leather thong hard at your midsection!");
				//(deals kinetic damage)
				damage = new TypeCollection( { kinetic: (physique()-8) });
				damageRand(damage, 15);
				applyDamage(damage, this, target, "minimal");
				createStatusEffect("Yappi Strappy");
			}
			//(Repeat)
			else
			{
				output("The raider charges you, whipping his leather thong and flail through the air like a berserker and trying to score a hit by luck alone!");
				//(may cause staggered condition condition)
				//Hit
				if(!combatMiss(this, target))
				{
					damage = new TypeCollection( { kinetic: (physique()+5) });
					damageRand(damage, 15);
					applyDamage(damage, this, target, "minimal");
					if((target.physique()/2 + rand(20) + 1 < 10 + this.physique()/2) && !target.isPlanted())
					{
						output("\n<b>You are sent reeling by the blow, staggered.</b>");
						CombatAttacks.applyStagger(target, 5, true);
					}
				}
				//Miss
				else
				{
					output("\nYou dodge!");
				}
			}
		}
		//ulu knife strike
		//costs no energy
		//punches/lashes with ulu knife in main hand, does kinetic pierce damage plus starts bleeding on PC unless shielded
		//noun: ‘strike’
		public function uluKnifing(target:Creature):void
		{
			if(hasStatusEffect("Disarmed")) output("The korgonne swipes at you at you with his claws!");
			//text 1
			else if(rand(2) == 0) output("The korgonne jumps at you and swings his ulu knife in a chopping downward punch!");
			//text 2
			else output("The korgonne rushes in and uppercuts with his ulu knife!");
			if(!combatMiss(this,target))
			{
				var damage:TypeCollection = meleeDamage();
				if(hasStatusEffect("Disarmed")) damage = new TypeCollection( { kinetic: this.physique()-5 });
				damageRand(damage, 15);
				applyDamage(damage, this, target, "minimal");
				if(target.shields() <= 0)
				{
					if (!target.hasStatusEffect("Bleeding")) output("\n<b>You’re bleeding!</b>");
					else output("\n<b>Your bleeding is aggravated further!</b>");
					CombatAttacks.applyBleed(target, 1, 3, 5);
				}
			}
			else output(" He misses!");
		}
		//homemade vamp-knife charge
		//medium-low energy attack (limited uses, say ~20 energy?)
		//deals kinetic slash damage equal to ulu strike, plus elec damage; hit refills korgonne shields (only ~33-50% as effective at transfer as a commercial blade)
		//as it is a knife strike, it can also inflict an incidental bleed if it breaches shields, but this is not the purpose of the attack
		//noun: ‘slash’
		public function vampKnifeKorg(target:Creature):void
		{
			this.energy(-20);
			output("The korgonne produces a beat-up, bulging battery from one of his pouches and jams it into a compartment in his knife handle; the blade crackles and begins to hum with electricity. He kicks a flurry of snow at you and then darts in, slashing furiously!");
			//hit/miss text, damage nums, and bleeding notification go here
			if(combatMiss(this,target)) output(" He misses!");
			else
			{
				//add elec damage to normal ulu knife damage and restore korg shields by percentage of damage dealt
				this.meleeWeapon.baseDamage.electric.damageValue = 10;
				var damage:TypeCollection = meleeDamage();
				this.meleeWeapon.baseDamage.electric.damageValue = 0;
				damageRand(damage, 15);
				//(if hit, restore korg’s shield)
				if(target.shields() > 0) 
				{
					output(" The korgonne’s improvised shield is restored slightly at the expense of your own!");
					applyDamage(damage, this, target, "minimal");
					this.shields(Math.ceil(damage.getTotal()/2));
				}
				else applyDamage(damage, this, target, "minimal");
				if(target.shields() <= 0)
				{
					if (!target.hasStatusEffect("Bleeding")) output("\n<b>You’re bleeding!</b>");
					else output("\n<b>Your bleeding is aggravated further!</b>");
					CombatAttacks.applyBleed(target, 1, 3, 5);
				}
			}
			output("\nWhen the assault ends, he hurriedly pulls the battery and drops it in the snow. It begins to pop and leak.");
		}
		//pufferfish dart
		//low energy-cost attack (~5-10); chucks fishbone darts coated in toxin
		//used in place of vamp knife charge when PC’s shields are down, regardless of korg’s shield strength
		//noun: ‘dart’
		//on unshielded hit, does small kinetic damage plus medium poison damage and poisons PC if it penetrates shield
		//if shielded (e.g. if PC used a shield charge booster), does only 1-2 points of kinetic damage
		public function korgoDartoAttack(target:Creature):void
		{
			this.energy(-5);
			output("The korgonne dips into his back pocket and surreptitiously throws a dart! ");
			if(rangedCombatMiss(this,target))
			{
				output("You turn aside at the last moment and it sails by!");
			}
			else
			{
				//(if hit and penetrating a restored shield somehow)
				if(target.shields() > 0)
				{
					output("It pings off your newly regenerated shields!");
					applyDamage(new TypeCollection ( { kinetic: 3 } ), this, target, "minimal");
				}
				else
				{
					output("The dart embeds itself in your [pc.skin]!");
					var damage:TypeCollection = new TypeCollection( { kinetic: 10 });
					damageRand(damage, 15);
					applyDamage(damage, this, target, "minimal");
					//(if poisoned by hit)
					if(target.shields() <= 0 && target.physique()/2 + rand(20) + 1 < 28)
					{
						if (!target.hasStatusEffect("Poison")) output("\n<b>You’re poisoned!</b>");
						else output("\n<b>More poison courses through you!</b>");
						CombatAttacks.applyPoison(target, 1, 3, 5);
					}
				}
			}
		}
		//suspicious surrender
		//next turn, PC can ‘Wait’ next turn to receive mercy’s reward, below, or ignore and fight continues normally
		//only used once per fight; if PC cancels by not ‘Wait’ing or the korg plays a trick, it cannot be used again
		//always outputs /after/ PC’s action text to prevent confusing text order (any problem with this?)
		public function suspiciousSurrender(target:Creature):void
		{
			if(!this.hasStatusEffect("SURPRISE_MUTHA_TRUCKAH"))
			{
				output("Dropping to his knees, the korgonne raider raises one paw in submission. He barks, <i>“Mercy! Please... no fight. Maybe I give present?”</i>");
				output("\n\nHis other paw slips into a large pocket at his hip, but he doesn’t pull it back out. Instead, he continues to watch you, hand in pocket, waiting for your reaction. It’s impossible to read his true intentions in his caprine eyes - <b>you can ‘Wait’ and see what he does, or not.</b>");
				//queue up mercy’s reward for next turn
				this.createStatusEffect("SURPRISE_MUTHA_TRUCKAH",0);
			}
			//mercy’s reward
			else
			{
				//Flag this bit as being done with. NO MORE MUTHATRUCKS :3
				setStatusValue("SURPRISE_MUTHA_TRUCKAH",2,1);
				//used on the turn after a surrender
				//if PC attacks, korg selects an attack and resumes fighting (if possible, else just default to something)
				if(statusEffectv1("SURPRISE_MUTHA_TRUCKAH") != 1)
				{
					output("When you continue to act, the korgonne grunts in disappointment. <i>“No " + target.mf("mister nice guy","miss nice girl") + "?”</i> he huffs. He pulls his hand from his pocket and resumes his attack!\n");
					uluKnifing(target);
					output("\n");
				}
				//if PC ‘Waits’, choose from results below (tweak percentages as needed):
				//25% of dirty trick; korg lashes out with a high-accuracy, very-high-damage strike and the fight continues
				if(rand(4) == 0)
				{
					//dirty trick, 25% chance
					output("The korgonne looks extremely pleased when you remain still. He sidles up to you, very respectfully, before speaking in a quiet voice. <i>“You nice. This for you... </i>stupid ");
					//(if PC milodan, kaithrit, or other catrace)
					if(InCollection(target.raceShort(), ["kaithrit", "milodan", "feline"])) output("cat");
					else if (InCollection(target.raceShort(), ["ausar", "huskar", "korgonne", "canine", "vulpine", "lupine"])) output("outsider");
					else output("alien");
					output("<i>!”</i>");

					output("\n\nHis hand emerges holding the warhead of an anti-ship micromissile! With an awful laugh, he drops it at your feet and dives for cover!");

					//warhead deals big kinetic/burning explosive damage with very high accuracy (if not 100% acc.)
					//maybe destroy/disable any of PC’s active drones, if supported?
					//combat continues if PC survives
					var damage:TypeCollection = new TypeCollection( { burning: 35, kinetic: 50 } );
					damageRand(damage, 15);
					applyDamage(damage, this, target, "minimal");
				}
				else
				{
					//Else end combat and queue up win protocols.
					this.changeHP(-1000);
					output("The korgonne raider nods gravely.");
					this.createStatusEffect("PEACEFUL_WIN");
					if(rand(3) == 0) setStatusValue("PEACEFUL_WIN",1,2);
					else setStatusValue("PEACEFUL_WIN",1,1);
				}
			}
		}
	}
}