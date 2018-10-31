package classes.Characters
{
	import classes.Creature;
	import classes.GameData.SingleCombatAttack;
	import classes.GLOBAL;
	import classes.Items.Accessories.FlashGoggles;
	import classes.Items.Melee.Fists;
	import classes.Items.Miscellaneous.*
	import classes.Items.Protection.BasicShield;
	import classes.VaginaClass;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.GameData.CodexManager;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Engine.Interfaces.output;
	import classes.Engine.Combat.*;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Engine.Utility.weightedRand;
	
	public class SydianFemale extends Creature
	{
		//constructor
		public function SydianFemale()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			// Originally a clone of the zilpack
			// Needs a few things checked.
			this.short = "sydian female";
			this.originalRace = "sydian";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = "Placeholder";
			this.customDodge = "The sydian rolls aside in a remarkable display of agility for one with such a large frame.";
			this.customBlock = "The alien’s chitin deflects the attack.";
			this.isPlural = false;
			
			this.meleeWeapon = new Fists();
			this.meleeWeapon.attackNoun = "kick";
			this.meleeWeapon.attackVerb = "kick";
			this.meleeWeapon.longName = "foot";
			this.meleeWeapon.baseDamage.kinetic.damageValue = 15;
			this.meleeWeapon.hasRandomProperties = true;
			
			this.armor.longName = "chitinous plating";
			this.armor.defense = 3;
			this.armor.resistances.corrosive.resistanceValue = -25.0;
			this.armor.resistances.addFlag(DamageFlag.ABLATIVE);
			this.armor.hasRandomProperties = true;
			
			this.shieldDisplayName = "ARMOR";
			this.shield = new BasicShield();
			this.shield.shields = 100;
			this.shield.resistances.addFlag(DamageFlag.SYDIANARMOR);
			this.shield.hasRandomProperties = true;
			
			this.physiqueRaw = 15;
			this.reflexesRaw = 18;
			this.aimRaw = 10;
			this.intelligenceRaw = 15;
			this.willpowerRaw = 17;
			this.libidoRaw = 35;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 33;
			
			this.level = 4;
			this.XPRaw = normalXP();
			this.credits = 0;
			this.HPMod = 0;
			this.HPRaw = this.HPMax();
			this.shieldsRaw = 100;
			
			this.femininity = 70;
			this.eyeType = GLOBAL.TYPE_SYDIAN;
			this.eyeColor = "black";
			this.tallness = 85;
			this.thickness = 70;
			this.tone = 80;
			this.hairColor = "black";
			this.scaleColor = "orange";
			this.furColor = "orange";
			this.hairLength = 6;
			this.hairType = GLOBAL.TYPE_HUMAN;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_CHITIN;
			this.skinTone = "orange";
			this.skinFlags = new Array();
			this.faceType = GLOBAL.TYPE_HUMAN;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_SYDIAN;
			this.lipMod = 0;
			this.earType = 0;
			this.antennae = 2;
			this.antennaeType = GLOBAL.TYPE_SYDIAN;
			this.horns = 0;
			this.hornType = 0;
			this.armType = GLOBAL.TYPE_SYDIAN;
			this.gills = false;
			this.wingType = GLOBAL.TYPE_HUMAN;
			this.legType = GLOBAL.TYPE_SYDIAN;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_SYDIAN;
			this.tailCount = 1;
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
			this.buttRatingRaw = 6;
			//No dicks here!
			this.cocks = [];
			var v:VaginaClass = new VaginaClass();
			v.loosenessRaw = 3;
			v.wetnessRaw = 2;
			v.hymen = false;
			v.type = GLOBAL.TYPE_SYDIAN;
			vaginas = [v];
			
			//balls
			this.balls = 0;
			this.cumMultiplierRaw = 6;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_SYDIAN_CUM;
			this.ballSizeRaw = 3;
			this.ballFullness = 1;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 100;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 20;
			this.minutesSinceCum = 2110;
			this.timesCum = 1722;
			
			//Goo is hyper friendly!
			this.elasticity = 1;
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
			this.ass.bonusCapacity += 15
			this.ass.loosenessRaw = 2;

			this.createStatusEffect("Disarm Immune");
			
			isUniqueInFight = true;
			btnTargetText = "Sydian";
			
			randomise();
			kGAMECLASS.tarkusSSTDChance(this);
			this._isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return "SYDIAN_FEMALE";
		}
		
		override public function get long():String
		{
			var str:String = "This alien spends so much time moving and lashing her brushed tail that it’s difficult to see details. She’s within inches of five feet, and her untidy " + hairColor + " hair shifts with her movement, parting around her fluffy antennae and sometimes hiding her " + eyeColor + " eyes. An orange wink is visible between her legs, unconcealed by any scrap of clothing.";
			if (shields() >= shieldsMax() * 0.8) str += " Segmented armor plates cover her whole body except her face and scalp. Incredibly flexible, she drops to all fours when the terrain is too uneven, always moving, always watching you.";
			else if (shields() >= 0) str += " Segmented insectoid armor covers her, though major cracks are visible on her chest and stomach. She crouches and crawls often, trying to protect these areas as she circles you.";
			else str += " Segmented chitin armor covers some of her, but the ‘plates’ from her throat down to her groin have collapsed under your attacks, revealing soft skin underneath. She’s moving far more evasively than when the fight began.";
			return str;
		}
		
		private function randomise():void
		{
			sexualPreferences.setRandomPrefs(2 + rand(3));
			
			var hcolour:Array = [
				{ v: "orange", w: 1 },
				{ v: "dark green", w: 1 },
				{ v: "brick red", w: 1 },
				{ v: "brown", w: 5 }
			];
			
			hairColor = weightedRand(hcolour);
			
			eyeColor = rand(5) == 0 ? "green" : "black";
		}
			
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			if (shields() <= 0 && !hasStatusEffect("Unarmored"))
			{
				createStatusEffect("Unarmored", 0, 0, 0, 0, true, "", "", true, 0, 0xFFFFFF);
				reflexesRaw += 5;
			}
			
			var atks:Array = [];
			
			if (hasStatusEffect("Unarmored"))
			{
				if (!target.hasStatusEffect("Tripped"))
				{
					atks.push( { v: TailWhipHigh, w: 2 } );
					atks.push( { v: TailWhipLow, w: 2 } );
				}
				else
				{
					atks.push( { v: Kicker, w: 2 } );
				}
				
				if (!target.hasStatusEffect("Blinded"))
				{
					if (energy() >= 15) atks.push( { v: ThrowDirt, w: 5 } );
				}
			}
			else
			{
				if (!target.hasStatusEffect("Tripped")) 
				{
					atks.push( { v: CrawlingOnMySkin, w: 2 } );
					atks.push( { v: TickleTrip, w: 1 } );
				}
				else
				{
					atks.push( { v: CaterpillarTraffic, w: 1 } );
				}
				
				if (!hasStatusEffect("Enzyme") && energy() >= 50) atks.push( { v: OilUp, w: 3 } );
			}
			
			weightedRand(atks)(target);
		}
		
		//attack 4: tail whip high - med. HP dmg, gain lust
		private function TailWhipHigh(target:Creature):void
		{
			output("The sydian lashes her fluffy tail at you, aiming high on your body.");
			if (combatMiss(this, target))
			{
				output(" Your superior reflexes allow you to slip right under it.");
			}
			else
			{
				output(" It hits you in the side of the face, knocking you silly and leaving a blush of tingly chemicals on your [pc.skinFurScales].");
				
				var dd:Number = 0;
				
				if (!target.hasAirtightSuit())
				{
					dd = 6;
					if (hasStatusEffect("Enzyme")) dd *= 1.33;
				}
				
				applyDamage(new TypeCollection( { kinetic: 14, drug: dd } ), this, target, "minimal");
			}
		}

		//attack 5: tail whip low - small HP dmg, gain small lust, can stun and trip PC, never used if PC is tripped and not so often that the kick below becomes unfair
		private function TailWhipLow(target:Creature):void
		{
			var dd:Number = 0;
			
			output("The sydian drops low and spins her tail at you.");
			if (combatMiss(this, target))
			{
				output(" You easily jump over it.");
			}	
			else
			{
				if ((target.physique() + rand(20) + 1 < 15) && !target.isPlanted())
				{
					output(" It lashes your [pc.leg], leaving a swipe of enzyme and taking your support from under you! With a thud, you hit the ground.");
					
					if (!target.hasAirtightSuit())
					{
						dd = 4;
						if (hasStatusEffect("Enzyme")) dd *= 1.33;
					}
					
					applyDamage(new TypeCollection( { kinetic: 9 + rand(2), drug: dd } ), this, target, "minimal");
					
					CombatAttacks.applyTrip(target);
				}
				else
				{
					output(" It lashes your [pc.leg], leaving a swipe of enzyme, but you manage to stay upright.");
					
					if (!target.hasAirtightSuit())
					{
						dd = 4;
						if (hasStatusEffect("Enzyme")) dd *= 1.33;
					}
					
					applyDamage(new TypeCollection( { kinetic: 5 + rand(2), drug: dd } ), this, target, "minimal");
				}
			}
		}

		//attack 6: start kick’er - replaces either tail whip if PC is grounded; multi-hit, med-high HP dmg overall (high enough to incentivize standing up), hard to dodge
		private function Kicker(target:Creature):void
		{
			output("The sydian takes advantage of your downed position to rain kicks on you with her clawed feet!");
			
			var numKicks:int = 2 + rand(3);
			for (var i:int = 0; i < numKicks; i++)
			{
				if (combatMiss(this, target, -1, 2))
				{
					output(" You block her clumsy kick!");
				}
				else
				{
					output(" Her kick connects with you!");
					applyDamage(new TypeCollection( { kinetic: 9 + rand(3) } ), this, target, "minimal");
				}
				output("\n");
			}
		}

		private function ThrowDirt(target:Creature):void
		{
			//attack 7: throw dirt - used often (enough to encourage lust attacks), blinds PC for 1-2 turns
			energy( -15);
			output("The sydian’s hands fly forward suddenly!");
			if (combatMiss(this, target))
			{
				output(" You cover your eyes, blocking the shower of dirt she threw.");
			}
			else if (target.hasAirtightSuit())
			{
				output(" Your faceguard protects your eyes.");
			}
			else if (target.accessory is FlashGoggles)
			{
				output(" Your goggles protect your eyes.");
			}
			else
			{
				output(" A shower of dirt hits your face,");
				if(target.hasBlindImmunity())
				{
					output(" to little effect.");
				}
				else
				{
					output(" blinding you!");
					CombatAttacks.applyBlind(target, 2 + rand(2));
				}
			}
		}
		
		private function CrawlingOnMySkin(target:Creature):void
		{
			output("The sydian drops to all fours and scuttles over.");
			if (combatMiss(this, target, 10, -1))
			{
				output(" You step back just as quickly, and she stumbles instead of latching onto you.");
			}
			else
			{
				output(" Before you can step back, she’s crawled " + (target.legCount > 1 ? "through" : "around") +" your [pc.legs] and up your back, exploring you with her fuzzy, aphrodisiac-spreading antennae. She goes right over the top, descending your front and treating you to an up-close view of her " + (lust() >= lustMax() * 0.66 ? "wet, sex-ready" : "cute orange") +" pussy before dismounting.");
				
				var dam:Number = 5 + rand(lust() / 4);
				if (hasStatusEffect("Enzyme")) dam *= 1.33;
				applyDamage(new TypeCollection( { tease: dam } ), this, target, "minimal");
			}
		}
		
		private function TickleTrip(target:Creature):void
		{
			output("The sydian thrusts her face toward yours with a curious, friendly expression.");
			if (combatMiss(this, target, 10, -1) || target.isPlanted())
			{
				output(" You ignore the distraction and pull your [pc.leg] away from the tail she’s trying to hook it with.");
			}
			else
			{
				output(" Her coy smile distracts you from the tail that caresses your [pc.leg] and then yanks it from under you!");
				output(" <b>You’re going to have a difficult time fighting from down here!</b>");
				CombatAttacks.applyTrip(target);
				applyDamage(new TypeCollection( { kinetic: 9 + rand(2) } ), this, target, "minimal");
			}
		}
		
		private function CaterpillarTraffic(target:Creature):void
		{
			output("Availing herself of your prone position, the woman probes you with her hands and antennae.");
			var dam:Number = 0;
			if (combatMiss(this, target, 20, -1))
			{
				output(" Even though you manage to keep her away from your sensitive areas, the sydian’s surface still leaves a dose of sex behind.");
				dam = 3;
			}
			else
			{
				output(" The tickly brushes and questing fingers are too numerous to stop, and your blood simmers as she searches out your most secret spots.");
				dam = 6;
			}
			if (hasStatusEffect("Enzyme")) dam *= 1.33;
			applyDamage(new TypeCollection( { tease: dam } ), this, target, "minimal");
		}
		
		private function OilUp(target:Creature):void
		{
			energy( -50);
			output("The sydian grabs each antenna and tail in turn, stimulating the bristles to release a large quantity of enzyme. She collects so much that her fingers and palms faintly glisten -");
			
			if (target.hasAirtightSuit())
			{
				output(" good thing your [pc.armor] is air tight!");
			}
			else
			{
				output(" you had better beware her touch now!");
				createStatusEffect("Enzyme", 0, 0, 0, 0, false, "LustUp", "The sydians fingers are glistening with enzyme!");
			}
		}
	}
}