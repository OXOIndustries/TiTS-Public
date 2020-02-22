package classes.Characters
{
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.GameData.CombatAttacks;
	import classes.Creature;
	import classes.GLOBAL;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.GameData.CombatManager;
	import classes.Engine.Utility.num2Text;
	import classes.Util.RandomInCollection;
	import classes.Engine.Combat.DamageTypes.DamageResult;
	import classes.Engine.Combat.*;
	import classes.Engine.Interfaces.*;
	
	public class CuntSnake extends Creature
	{
		
		
		//constructor
		public function CuntSnake()
		{	
			this._latestVersion = 2;
			this.version = this._latestVersion;
			this._neverSerialize = true; // Setting this will stop a given NPC class from ever being serialized.
			
			this.short = "cunt snake";
			this.originalRace = "cunt snake";
			this.a = "the ";
			this.capitalA = "The ";
			this.tallness = 24 + rand(36);
			this.scaleColor = "green";
			this.long = "The green-hued cunt snake blends in well with vegetation. It has no visible eyes, though there are two sensory bulbs atop its head. The reptilian alien is somewhere around " + num2Text(Math.round(this.tallness/12)) + " feet in length and moves with such sinuous, unpredictable grace that it would be difficult to hit from long range, but the fangs seem to suggest you keep your distance. A moist, drooling pussy is visible at the end of its body. It often shifts to point it towards you so that you can see just how sopping wet the hole is.";
			this.customDodge = "Your attack slips between the writhing coils, accomplishing nothing.";
			this.customBlock = "Your attack deflects off the cunt snake’s " + this.scaleColor + " scales!";
			this.isPlural = false;
			
			isLustImmune = true;
			
			this.meleeWeapon.attackVerb = "bite";
			meleeWeapon.attackNoun = "bite";
			meleeWeapon.baseDamage.kinetic.damageValue = 4;
			meleeWeapon.baseDamage.addFlag(DamageFlag.PENETRATING);
			this.meleeWeapon.attack = 2;
			this.meleeWeapon.longName = "fangs";
			this.meleeWeapon.hasRandomProperties = true;
			
			this.armor.longName = "glittering scales";
			this.armor.defense = 0;
			this.armor.hasRandomProperties = true;
			
			this.physiqueRaw = 1;
			this.reflexesRaw = 5;
			this.aimRaw = 4;
			this.intelligenceRaw = 1;
			this.willpowerRaw = 1;
			this.libidoRaw = 50;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 15;
			this.level = 1;
			this.XPRaw = normalXP();
			this.credits = 0;
			this.HPMod = 0;
			this.HPRaw = this.HPMax();
			
			this.femininity = 50;
			this.eyeType = 0;
			this.eyeColor = "red";
			this.thickness = 1;
			this.tone = 80;
			this.hairColor = "red";
			this.furColor = "tawny";
			this.hairLength = 0;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_SCALES;
			this.skinTone = "pink";
			this.skinFlags = new Array();
			this.faceType = GLOBAL.TYPE_CUNTSNAKE;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_CUNTSNAKE;
			this.lipMod = 1;
			this.earType = GLOBAL.TYPE_CUNTSNAKE;
			this.antennae = 0;
			this.antennaeType = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = 0;
			this.gills = false;
			this.wingType = 0;
			this.legType = GLOBAL.TYPE_CUNTSNAKE;
			this.legCount = 1;
			this.legFlags = [GLOBAL.FLAG_TENDRIL];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_CUNTSNAKE;
			this.tailCount = 1;
			this.tailFlags = [GLOBAL.FLAG_SCALED, GLOBAL.FLAG_LONG, GLOBAL.FLAG_THICK, GLOBAL.FLAG_PREHENSILE];
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
			
			this.breastRows[0].breastRatingRaw = 0;
			this.nippleColor = "green";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 1;
			this.ass.wetnessRaw = 0;
			
			this.createPerk("Ranged Immune",0,0,0,0);
			this.createStatusEffect("Disarm Immune");
			isUniqueInFight = true;
			btnTargetText = "Cuntsnake";
			randomise();
			
			this._isLoading = false;
		}
		
		private function randomise():void
		{
			tallness = 24 + rand(36);
			scaleColor = "green";
			long = "The green-hued cunt snake blends in well with vegetation. It has no visible eyes, though there are two sensory bulbs atop its head. The reptilian alien is somewhere around " + num2Text(Math.round(tallness/12)) + " feet in length and moves with such sinuous, unpredictable grace that it would be difficult to hit from long range, but the fangs seem to suggest you keep your distance. A ";
			
			if(rand(5) == 0) 
			{
				tailGenitalArg = GLOBAL.TYPE_HUMAN;
				tailGenitalColor = "pink";
				long += "<b>slippery, " + tailGenitalColor + " terran-like cunt</b>";
			}
			else if(rand(4) == 0) 
			{
				tailGenitalArg = GLOBAL.TYPE_EQUINE;
				tailGenitalColor = RandomInCollection("pink", "black");
				long += "<b>puffy, " + tailGenitalColor + " horse-like gash</b>";
			}
			else if(rand(3) == 0) 
			{
				tailGenitalArg = GLOBAL.TYPE_CANINE;
				tailGenitalColor = "pink";
				long += "<b>slippery, " + tailGenitalColor + " dog-like slit</b>";
			}
			else if(rand(2) == 0) 
			{
				tailGenitalArg = GLOBAL.TYPE_GOOEY;
				if(rand(5) == 0) tailGenitalColor = "semi-transparent ";
				else tailGenitalColor = "";
				if(rand(10) == 0 && kGAMECLASS.pc.skinTone != "") tailGenitalColor = kGAMECLASS.pc.skinTone;
				else tailGenitalColor += RandomInCollection("red", "orange", "yellow", "green", "blue", "purple", "white", "pink");
				long += "<b>slippery slime creature’s " + tailGenitalColor + " cunt</b>";
			}
			else 
			{
				tailGenitalArg = GLOBAL.TYPE_SIREN;
				if(rand(5) == 0) tailGenitalColor = "luminous ";
				else tailGenitalColor = "";
				if(rand(10) == 0 && kGAMECLASS.pc.skinAccent != "") tailGenitalColor = kGAMECLASS.pc.skinAccent;
				else tailGenitalColor += RandomInCollection("purple", "blue", "pink");
				long += "<b>slick, " + tailGenitalColor + " cilia-filled tunnel</b>";
			}	

			long += " is visible at the end of its body. It often shifts to point it towards you so that you can see just how sopping wet the hole is.";
			customDodge = "The cunt snake sways aside at the last second!";
			customBlock = "Your attack deflects off the cunt snake’s " + scaleColor + " scales!";
		}
		
		override public function get bustDisplay():String
		{
			return "CUNTSNAKE";
		}
		
		public function UpgradeVersion1(dataObject:Object):void
		{
			if (dataObject.legFlags.length == 0)
			{
				dataObject.legFlags.push(GLOBAL.FLAG_TENDRIL);
			}
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			
			if (target == null) return;
			
			if (target.hasCock() && rand(3) == 0) 
			{
				if(rand(4) == 0) paralyzingVenom(target);
				else aphrodisiacBite(target);
			}
			else if (CombatManager.getRoundCount() % 5 == 0) 
			{
				paralyzingVenom(target);
			}
			else if (rand(4) == 0) 
			{
				aphrodisiacBite(target);
			}
			else if (rand(3) == 0) 
			{
				NPCTripAttackGo(target);
			}
			else if (rand(2) == 0) 
			{
				slapAttackFromCuntSnake(target);
			}
			else 
			{
				CombatAttacks.MeleeAttack(this, target);
			}
		}
		
		private function slapAttackFromCuntSnake(target:Creature):void
		{
			output("Coiling its body like a spring, the cunt snake launches its body towards you!");

			// standard miss/block text
			if (combatMiss(this, target))
			{
				output(" It misses!");
			}
			//Blind miss
			else if(hasStatusEffect("Blinded") && rand(2) == 0) output(" It misses due to its blindness!");
			// hit
			else
			{
				output(" It twists to slap at your [pc.face]");
				
				var damage:TypeCollection = new TypeCollection( { kinetic: 5 } );
				damageRand(damage, 15);
				var damageResult:DamageResult = calculateDamage(damage, this, target);
				var bStun:Boolean = false;
				
				if (damageResult.shieldDamage > 0)
				{
					if (target.shieldsRaw > 0) output(", bouncing off your shield with a loud ‘snap’!");
					else output(", breaching your shield.");
				}
				
				if (damageResult.hpDamage > 0)
				{
					if (damageResult.shieldDamage > 0) output(" You’re sent reeling from the impact while it flops onto the ground.");
					else output(", sending you reeling from the impact while it flaps onto the ground.");
					
					if (!target.hasStatusEffect("Stunned") && target.physique() + rand(20) + 1 < 15)
					{
						output(" <b>The hit was hard enough to stun you!</b>");
						bStun = true;
					}
				}
				
				outputDamage(damageResult);
				if(bStun) CombatAttacks.applyStun(target, 1);
			}
		}
		
		private function NPCTripAttackGo(target:Creature):void
		{
			output("Your foe contorts its body inward and abruptly snaps its tail around like a whip, directed at your [pc.feet]! ");
			// standard miss/block text
			if (combatMiss(this, target))
			{
				output("It misses!");
			}
			//Blind miss
			else if(hasStatusEffect("Blinded") && rand(2) == 0) output("It misses due to its blindness!");
			// hit
			else
			{
				output("Your [pc.legOrLegs]");
				if(target.legCount == 1) output(" is");
				else output(" are");
				output(" swept out from beneath you and you land hard");
				
				var damage:TypeCollection = new TypeCollection( { kinetic: 5 } );
				damageRand(damage, 15);
				var damageResult:DamageResult = calculateDamage(damage, this, target);
				
				if (damageResult.shieldDamage > 0)
				{
					if (target.shieldsRaw > 0) output(", shield cushioning your impact.");
					else output(", shattering your energy shield.");
				}
				
				if (damageResult.hpDamage > 0)
				{
					output(" Your backside fares little better.");
				}
				
				outputDamage(damageResult);

				//If cock!
				if (target.hasCock())
				{
					output("\n\nThe end of the snake loops around your waist and rubs against ");
					if(!target.isCrotchGarbed()) output("your [pc.leg]");
					else if(target.armor.shortName != "") output("the front of your [pc.armor]");
					else output("the front of your [pc.lowerUndergarment]");
					output(", trying to get at [pc.oneCock]. Moist secretions stain your crotch as you find yourself becoming unintentionally aroused by the contact.");
					target.changeLust(3+rand(3));
				}
				// not defeated
				output(" You roll aside and climb upright, feeling a little more sore");
				if(target.hasCock()) output(" and horny");
				output(" than before.");
			}
		}
		
		private function aphrodisiacBite(target:Creature):void
		{
			output("The snake coils up, then flashes out at you with mouth open and fangs exposed. ");
			// standard miss/block text
			if (combatMiss(this, target)) 
			{
				output(" It misses!");
			}
			//Blind miss
			else if(hasStatusEffect("Blinded") && rand(2) == 0) output("It misses due to its blindness!");
			// hit
			else 
			{
				output("Two spears of hot lust slip through your defenses and straight into your vulnerable veins. In a second, genitalia-engorging chemicals are pumped throughout your body. More and more of them spread through you as the snake injects artificial ardor straight into you.");
				target.changeLust(10+rand(5));
				if (target.lust() >= target.lustMax()) 
				{
					output("\n\nYou moan and lie back, ");
					if(target.armor.shortName != "") output("digging into your [pc.armor]");
					else if(target.lowerUndergarment.shortName != "") output("digging into your [pc.lowerUndergarment]");
					else if(target.hasVagina()) output("digging into [pc.oneVagina]");
					else if(target.hasCock()) output("grabbing your [pc.cock]");
					else output("grabbing your [pc.nipples] in an attempt");
					output(" to satisfy the urges welling up within you.");
				}
				// not defeated
				else output("\n\nYou wriggle away as hard as you can, and the snake releases its grip on you. The holes its fangs left close up almost as soon as they emptied, leaving you sore and aroused.");
			}
		}
		
		private function paralyzingVenom(target:Creature):void
		{
			output("The snake coils up, then flashes out at you with mouth open and fangs exposed.");
			// standard miss/block text
			if (combatMiss(this, target)) 
			{
				output(" It misses!");
			}
			//Blind miss
			else if(hasStatusEffect("Blinded") && rand(2) == 0) output(" It misses due to its blindness!");
			// hit
			else 
			{
				if (target.shieldsRaw > 0) output(" It passes right through your shields, and i");
				else output(" I");
				output("ts attack lands, and you feel the needles sliding through your [pc.skin]. There is a moment of burning pain as the venom enters your bloodstream followed by the gentle deadness of numbed sensation.");
				// no save
				if (target.physique() + rand(20) + 1 < 15) 
				{
					if (target.hasStatusEffect("Paralyzed")) 
					{
						output(" <b>You’re even more paralyzed than before!</b>");
					}
					else
					{
						output(" <b>After a second, you realize you’ve been paralyzed by the creature’s bite!</b>");
						CombatAttacks.applyParalyze(target, 2, false, "You are paralyzed and cannot move until the venom wears off!");
					}
				}
				// resist/make save
				else 
				{
					output(" You yank it off before it can deposit its entire payload, rubbing the sore, rapidly healing spot on your arm in irritation.");
				}
			}
		}
	}
}
