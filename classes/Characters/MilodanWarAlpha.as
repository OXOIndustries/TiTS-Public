package classes.Characters
{
	import classes.Creature;
	import classes.GameData.SingleCombatAttack;
	import classes.GLOBAL;
	import classes.StorageClass;
	//import classes.Items.Guns.*
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.GameData.CodexManager;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.GameData.CombatManager;
	import classes.GameData.CombatAttacks;
	import classes.Items.Transformatives.OmegaOil;
	import classes.Items.Guns.PlasmaPistol;
	import classes.Items.Guns.LaserPistol;
	import classes.Items.Protection.BasicShield;
	import classes.Engine.Interfaces.output;
	import classes.Engine.Combat.*;
	import classes.Util.RandomInCollection;
	import classes.StringUtil;
	
	public class MilodanWarAlpha extends Creature
	{
		//constructor
		public function MilodanWarAlpha()
		{
			this._latestVersion = 1
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "war-alpha";
			this.originalRace = "milodan";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = "Your foe prowls around the royal chambers like the hunting cat he so resembles. The form-fitting Pyrite Heavy Industries jumpsuit he wears shows every bit of his incredibly muscled, seven foot frame - including a highly visible bulge half hidden beneath his bulky, gadget-bedecked shield belt. He holds a plasma pistol in one hand, but the glint of his razor-sharp claws reminds you that staying close won't make much of a difference. You don’t want to take a hit from either.";
			this.isPlural = false;

			this.meleeWeapon.attack = 3;
			this.meleeWeapon.baseDamage.kinetic.damageValue = 10;
			this.meleeWeapon.longName = "claw";
			this.meleeWeapon.description = "a sharp claw";
			this.meleeWeapon.attackVerb = "swipe";
			this.meleeWeapon.attackNoun = "swipe";
			this.meleeWeapon.hasRandomProperties = true;

			rangedWeapon = new PlasmaPistol(); 
			rangedWeapon.baseDamage.burning.damageValue = 15;
			this.rangedWeapon.hasRandomProperties = true;

			this.armor.longName = "jumpsuit";
			this.armor.defense = 3;
			this.armor.hasRandomProperties = true;

			baseHPResistances = new TypeCollection();
			baseHPResistances.freezing.damageValue = 90.0;
			baseHPResistances.electric.damageValue = 90.0;
			baseHPResistances.kinetic.damageValue = -50.0;
			baseHPResistances.tease.damageValue = 0.0;
			baseHPResistances.drug.damageValue = -50.0;
			baseHPResistances.pheromone.damageValue = -50.0;
			baseHPResistances.burning.damageValue = -25.0;
			
			this.shield = new BasicShield;
			this.shield.shields = 200;
			this.shield.hasRandomProperties = true;

			this.physiqueRaw = 40;
			this.reflexesRaw = 30;
			this.aimRaw = 25;
			this.intelligenceRaw = 15;
			this.willpowerRaw = 37;
			this.libidoRaw = 40;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 25;
			
			this.level = 9;
			this.XPRaw = bossXP();
			this.credits = 0;
			this.HPMod = 350;
			this.HPRaw = this.HPMax();
			this.shieldsRaw = this.shieldsMax();

			this.femininity = 10;
			this.eyeType = GLOBAL.TYPE_FELINE;
			this.eyeColor = "violet";
			this.tallness = 8*12+2;
			this.thickness = 65;
			this.tone = 85;
			this.hairColor = "blue";
			//this.hairType = GLOBAL.TYPE_FELINE;
			//this.scaleColor = "red";;
			this.furColor = "white";
			this.hairLength = 3;
			
			//this.beardLength = 0;
			//this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_FUR;
			this.skinTone = "silver";
			//this.skinFlags = new Array();
			this.faceType = GLOBAL.TYPE_FELINE;
			this.faceFlags = [GLOBAL.FLAG_MUZZLED, GLOBAL.FLAG_FURRED];
			this.tongueType = GLOBAL.TYPE_FELINE;
			this.lipMod = 0;
			this.earType = GLOBAL.TYPE_FELINE;
			//this.antennae = 0;
			this.antennaeType = GLOBAL.TYPE_HUMAN;
			this.horns = 0;
			this.hornType = 0;
			this.armType = GLOBAL.TYPE_FELINE;
			this.gills = false;
			this.wingType = GLOBAL.TYPE_HUMAN;
			this.legType = GLOBAL.TYPE_FELINE;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE,GLOBAL.FLAG_FURRED];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_FELINE;
			this.tailCount = 1;
			this.tailFlags = [GLOBAL.FLAG_LONG,GLOBAL.FLAG_PREHENSILE]
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
			this.hipRatingRaw = 4;
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
			this.buttRatingRaw = 8;
			//No dicks here!
			this.cocks = new Array();
			this.createCock();
			this.girlCumType = GLOBAL.FLUID_TYPE_GIRLCUM;
			this.cockVirgin = false;
			this.cocks[0].cLengthRaw = 12.5;
			this.cocks[0].cType = GLOBAL.TYPE_FELINE;
			this.cocks[0].cockColor = "black";
			this.cocks[0].addFlag(GLOBAL.FLAG_KNOTTED);
			this.cocks[0].addFlag(GLOBAL.FLAG_NUBBY);
			//balls
			this.balls = 2;
			this.cumMultiplierRaw = 6;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.impregnationType = "MilodanPregnancy";
			this.cumQualityRaw = 3;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 15;
			this.ballFullness = 100;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 7;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 6;
			this.minutesSinceCum = 420;
			this.timesCum = 850;

			this.elasticity = 1;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1;
			//this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;

			this.breastRows[0].breastRatingRaw = 0;
			this.nippleColor = "blue";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			this.ass.loosenessRaw = 2;
			this.ass.bonusCapacity += 125;
			
			isUniqueInFight = true;
			btnTargetText = "WarAlpha";

			this.createStatusEffect("Flee Disabled", 0, 0, 0, 0, true, "", "", false, 0);
			this.createStatusEffect("Not Busted");
			
			randomise();
			kGAMECLASS.uvetoSSTDChance(this);
			this._isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			var str:String = "WAR_ALPHA";
			return str;
		}
		override public function lustMax():Number
		{
			if(this.hasStatusEffect("Not Busted")) return super.lustMax();
			else return 200;
		}
		override public function isDefeated():Boolean
		{
			//Once twice busted, as normal
			if (!this.hasStatusEffect("Not Busted")) 
			{
				if (HP() <= 0 || lust() >= lustMax()) return true;
				return false;
			}
			//Only HP till then.
			if (HP() <= 0) return true;
			return false;
		}

		public function phase2Configure():void
		{
			this.long = "Your foe’s idle prowling has morphed into strutting, confident strides. The milodan war-alpha lets his dick lead the way when he moves, and what a dick it is! A hint over a foot long and glossy black, his length throbs at full attention, covered in pulsating nubs. The rounded hint of a bulb at its base suggests a bit of canine heritage or ausar mods, and while you watch, a dollop of crystalline pre emerges from the tip, heavy with the arousal you have stoked within him. His pistol is forgotten.\n\nThe milodan war-alpha is no longer interested in fighting - only fucking you.";
			
			//Transition to phase 2
			output("The war-alpha shudders, then rears back and pistons his hips forward. A faint buzzing sound blossoms into the tearing of violently splitting fabric. A very bare, glossy cock appears. The war alpha-stares at you like a tiger eyeing a juicy morsel while his member bounces in excitement. His lip peels back into a slight snarl. <i>“New plan. I fuck you and make the princess watch.”</i>");
			output("\n\nHe advances once more, swaggering with an overflowing wellspring of sexual intent when he should be disabled by desire. <b>It’ll take so much more than this to break the war-lion’s resolve!</b>");
			output(" (<b>Max L: +<span class='lust'>" + 100 + "</span></b>)");
			this.removeStatusEffect("Not Busted");
			this.baseHPResistances = new TypeCollection();
			this.baseHPResistances.tease.damageValue = -33.0;
			this.baseHPResistances.pheromone.damageValue = -33.0;
			this.baseHPResistances.drug.damageValue = -33.0;
			
			//Fen note: RIP interesting encounter with multiple unusual damage types :[    ]:

			/*this.meleeWeapon.baseDamage.poison.damageValue = 0;
			this.meleeWeapon.baseDamage.drug.damageValue = 5;
			this.meleeWeapon.longName = "lust-venomed claw";
			this.meleeWeapon.description = "an aphrodisiac-tipped claw";
			this.meleeWeapon.attackVerb = "swipe";
			this.meleeWeapon.attackNoun = "drug injection";*/
			/*
			short = "milodan brute";
			baseHPResistances.tease.damageValue = 25.0;
			baseHPResistances.pheromone.damageValue = -50.0;
			this.HPMod = 150;
			this.armor.defense = 10;
			this.armor.longName = "combat armor";
			this.armor.description = "a suit of combat armor";
			this.shield = new BasicShield();
			this.shield.shields = 100;
			this.shield.hasRandomProperties = true;
			this.hairColor = "white";
			this.inventory = new Array();
			this.meleeWeapon.attack = 9;
			this.meleeWeapon.baseDamage.electric.damageValue = 6;
			this.meleeWeapon.baseDamage.kinetic.damageValue = 6;
			this.meleeWeapon.longName = "shock baton";
			this.meleeWeapon.description = "a shock baton";
			this.meleeWeapon.attackVerb = "swing";
			this.meleeWeapon.attackNoun = "sizzling smack";
			this.rangedWeapon = new LaserPistol();
			this.rangedWeapon.longName = "Pyrite Industries laser pistol";
			this.rangedWeapon.description = "a Pyrite Industries laser pistol";
			this.rangedWeapon.hasRandomProperties = true;
			this.shieldsRaw = this.shieldsMax();
			this.createStatusEffect("Flee Disabled", 0, 0, 0, 0, true, "", "", false, 0);*/
		}
		private function randomise():void 
		{
			sexualPreferences.setRandomPrefs(3 + rand(3));
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			var attackChoices:Array = new Array();
			var bro:Creature = alliedCreatures[1];
			
			//PHASE 1.
			if(this.hasStatusEffect("Not Busted"))
			{
				//Big procs :3
				if(this.lust() >= 100) 
				{
					phase2Configure();
					return;
				}
				else if(this.lust() >= 50 && !this.hasStatusEffect("Bulge Adjusted")) fixBulge();
				else if(this.hasStatusEffect("Disarmed") && !this.hasStatusEffect("Disarm Immune")) antidisarmShit();

				//Special Ability usages:			
				//Shield recover:
				else if(this.shields() + 30 <= this.shieldsMax() && target.shields() >= 20 && this.energy() >= 35 && rand(2) == 0) shieldLeech(target);
				//bro toss
				else if(!bro.isDefeated() && !bro.isImmobilized() && !bro.isBlind() && !bro.hasStatusEffect("Tripped") && rand(6) == 0) henchBoiGo(target,bro);
				else
				{
					//porno hack
					if(target.hasPerk("Attack Drone") && target.shields() > 0 && !target.hasStatusEffect("Porno Hacked Drone") && !target.accessory.hasFlag(GLOBAL.ITEM_FLAG_COMBAT_DRONE) && this.energy() >= 10) attackChoices.push(droneHackGo);
					//Gas Grenado:
					if(this.energy() >= 20) attackChoices.push(gasGasGrenade);
					//Pew
					if(!this.hasStatusEffect("Disarm Immune") && !this.hasStatusEffect("Disarmed")) attackChoices.push(pistolShotStuff);
					attackChoices.push(doubleClawAttack);
					attackChoices[rand(attackChoices.length)](target);
				}
			}
			//PHASE 2
			else
			{
				/* Press 'F' to pay respects.
				attackChoices.push(lustPricklyDoodles);

				FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF */
				
				attackChoices.push(mountingBitches);
				attackChoices.push(promisesPromises);
				attackChoices[rand(attackChoices.length)](target);
			}	
		}
		//Phase 1 ability: Lose turn due to adjusting bulge at halfway to 100 lust
		public function fixBulge():void
		{
			output("The war-alpha winces, then scowls at you as he adjusts the growing bulge in his crotch into a more palatable arrangement. The distended cucumber shape that presents itself through the fabric reveals just how seriously he’s packing: at least 12 or 13 inches rock-hard milodan is right there, practically begging to be touched...");
			this.createStatusEffect("Bulge Adjusted");
		}
		//Phase 1 ability: disarmed - draws a weaker laser pistol, ending disarm
		public function antidisarmShit():void
		{
			if(this.rangedWeapon is PlasmaPistol)
			{
				output("The war-alpha scowls at his empty hand and loboriously reaches behind his back to procure a new weapon: a dated-looking laser pistol. It won’t pack as much bite, that’s for sure.");
				this.aimRaw /= 2;
				this.rangedWeapon = new LaserPistol();
				this.rangedWeapon.longName = "rusty laser pistol";
				this.rangedWeapon.description = "a rusty laser pistol";
				this.rangedWeapon.hasRandomProperties = true;
			}
			//Phase 1 ability: disarmed again - stops using ranged weapons. Round of irritation.
			else
			{
				output("With a snarl of irritation, the war-alpha shakes away the pain in his hand. <i>“Fine. I don’t need a gun to take you.”</i>");
				this.createStatusEffect("Disarm Immune");
			}
		}
		//Phase 1 ability: Double Claw
		public function doubleClawAttack(target:Creature):void
		{
			output("The war-alpha lashes out with his claws!");
			for (var i:int = 0; i < 2; i++)
			{
				output("\n");
				CombatAttacks.SingleMeleeAttackImpl(this, target, true);
			}
		}
		//Phase 1 ability: Pistol Shot
		//Nothing special
		public function pistolShotStuff(target:Creature):void
		{
			CombatAttacks.SingleRangedAttackImpl(this, target, false);
		}
		override public function hasAirtightSuit():Boolean
		{
			return ((hasArmor() && armor.hasFlag(GLOBAL.ITEM_FLAG_AIRTIGHT)) || this.hasStatusEffect("Gasu Masku"));
		}
		//Phase 1 ability: Gas Greande - HP damaging dot. Lasts five rounds. Used only once.
		public function gasGasGrenade(target:Creature):void
		{
			this.energy(-20);
			output("The war-alpha grabs a cylinder from his belt and casually tosses it to the floor. " + (!this.hasStatusEffect("Gasu Masku") ? "He also produces a small breathing apparatus and snaps it onto his snout":"He adjusts his breathing apparatus for a better seal") + ", smirking as the grenade begins to belch forth a steady flow of poisonous gas.");
			if(!this.hasStatusEffect("Gasu Masku")) this.createStatusEffect("Gasu Masku");
			if(!target.hasAirtightSuit()) applyDamage(damageRand(new TypeCollection( { poison: 45 } ), 15), this, target, "minimal");
			else output(" <b>Good thing you're sealed in, airtight.</b>");
		}
		//Phase 1 ability: Shield Leech - Steal 50% of HP shield total for himself. If high amount stolen, also blinds you for being OP.
		public function shieldLeech(target:Creature):void
		{
			this.energy(-35);
			output("Tapping at a display on his bracer, the war-alpha’s shields shimmer violently. A split-second later, your own do as well. The grinning cat is literally siphoning your shields away! ");
			var stolen:Number = Math.floor(target.shields()/2);
			target.shields(-stolen);
			this.shields(+stolen);
			output("(<b>S: -<span class='shield'>" + stolen + "</span></b>)");
			if(stolen > 50)
			{
				output(" A snapping, sizzling corona of energy forms around him from the sheer amount of energy he’s drawing in, exploding into a sunburst of blinding light.");
				if(target.intelligence()/2 + rand(20) + 1 > this.intelligence()/2 + 10) output(" You barely shield your eyes in time.");
				else
				{
					output(" <b>You’re blinded!</b>");
					CombatAttacks.applyBlind(this, 1);
				}
			}
			output("(<b>S: +<span class='shield'>" + stolen + "</span></b>)");
		}
		//Phase 1 ability: Fastball Claw - launched by henchman for one big hit. (disabled if hench down)
		//Uses henchmen attack
		public function henchBoiGo(target:Creature, bro:Creature):void
		{
			output("The war-alpha signals to his companion, who kneels. Then, stepping back into his partner’s palms, he launches off with the combined strength of two milodans, spearing through the air straight at your chest!");
			if(rangedCombatMiss(this, target)) output("\n\nYou dive out of the way, and the war-alpha rolls back up onto his paws, ready for more.");
			//Hit: Use minimal
			else
			{
				applyDamage(damageRand(new TypeCollection( { kinetic: 60 } ), 15), this, target, "minimal");
			}
			CombatAttacks.applyStun(bro,1);
		}
		//Phase 1 ability: Drone Hack - as per the sexbot ability
		public function droneHackGo(target:Creature):void
		{
			this.energy(-10);
			output("The war-alpha taps at a gadget on his wrist, causing your drone to wobble unsteadily. <i>“No more of that...”</i>");
			//Fail: 
			if(rand(20) + 1 + target.intelligence()/2 >= this.intelligence()/2 + 10)
			{
				output("\n\nYou breathe a sigh of relief as your drone successfully fights off the outside interference and rights itself.");
			}
			//Success: 
			else
			{
				output("\n\nYour drone rights itself... and then turns itself to you, green light beaming out of its optical sensors. Images flicker all around it, endlessly changing images of soft flesh, breasts, ass, bulging phalli, pink on pink, pink on brown, blue on mauve.... It’s accompanied with the moans, grunts and slurps of the extranet porn it is now helplessly streaming and projecting in ways you never thought it had the capacity to do. You bat it away, irritated, and it immediately flies back. It hovers near your shoulder, forcing the sounds and images into your head.");
				target.createStatusEffect("Porno Hacked Drone", 2 + rand(3), 0, 0, 0, false, "Charmed", "Your drone has been hacked to broadcast porn at you! You’ll have to wait for your programming to overcome the rogue process. Hopefully it won’t take too long!", true, 0);
			}
		}
		//Phase 2 ability: lust prickles - grabs you and injects with aprhodisiacs through claws (drug)
		/* Press 'F' to pay respects.

		FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF

		*/
		public function lustPricklyDoodles(target:Creature):void
		{
			output("The war lion lunges forward");
			//dodge:
			if(combatMiss(this, target)) output(", but you roll aside!");
			//hit
			else
			{
				output(", grabbing you the shoulders, needle-like claws not-so-gently sinking into your [pc.skinFurScales]. You push him away, but the damage is already done. Pleasant warmth radiates out from a place that should have nothing but pain. You can feel the forced flush spreading, oozing and sliding through your body until it feels like it’s puddling in your " + (target.hasCock() ? "ever-stiffer":"oh-so-empty") + " loins. Your heart beats faster while the ");
				if(target.lust() < 25) {}
				else if(target.lust() < 50) output("<b>handsome</b>");
				else if(target.lust() < 75) output("<b>dashing</b>");
				else if(target.lust() < 90) output("<b>sexy</b>");
				else output("<b>god-like</b>");
				output(" milodan backs away, entirely aware of how your gaze is flickering down to his dick.");
				applyDamage(damageRand(this.meleeDamage(), 15), this, target, "minimal");
				//applyDamage(damageRand(new TypeCollection( { drug: 15 } ), 15), this, target, "minimal");
			}
		}
		//Phase 2 ability: mount - forces you to the ground and grinds his crotch into your face (tease/pheromone)
		public function mountingBitches(target:Creature):void
		{
			if(!this.hasStatusEffect("Mounts")) output("Scampering back, the war-alpha circles the room. He braces one foot against the wall, narrowing his eyes, then his whole body winds tighter than a spring on the verge of snapping. He launches forward in the blink of an eye.");
			else output("The war-alpha springs forward again");
			//Dodge
			if(combatMiss(this, target)) output((this.statusEffectv1("Mounts") == 0 ? " You barely roll out of the way.":", but you’re ready for him, rolling to side."));
			//Hit
			else
			{
				//First time
				if(!this.hasStatusEffect("Mounts"))
				{
					if(this.hasStatusEffect("Mounts")) this.createStatusEffect("Mounts");
					output("\n\nYou can’t possible get out of the way. He bowls you flat onto your back. For a cat so large, he perches on your shoulders as lightly as a songbird - except for his crotch, which comes to rest quite heavily upon your [pc.face]. You’re too shocked to resist the musky intrusion - or hold your breath. Milodan cock is all you can see, all you can smell, and all you can feel.");
					if(target.hasAirtightSuit()) 
					{
						output(" Or it would be if you hadn’t packed an airtight suit, but not even that can get the sight out of your head.");
						applyDamage(damageRand(new TypeCollection( { tease: 8 } ), 15), this, target, "minimal");
					}
					else applyDamage(damageRand(new TypeCollection( { tease: 8, pheromone: 8 } ), 15), this, target, "minimal");
				}
				//Second timo
				else
				{
					output(".");
					output("\n\nHundreds of pounds of muscle and fur slam into you and you bowl you flat on your back. Supine, you can’t stop him from slapping his rigid, drooling dick onto your cheek. You can’t force him off before he’s rubbed his oily member across your nose and lips, marking you with the pungent pheromonal force of his scent.");
					if(target.hasAirtightSuit()) applyDamage(damageRand(new TypeCollection( { tease: 8 } ), 15), this, target, "minimal");
					else applyDamage(damageRand(new TypeCollection( { tease: 8, pheromone: 8 } ), 15), this, target, "minimal");
					if(target.lust() >= target.lustMax()) output(" You can’t remember why you wanted to push him away... or why you shouldn’t be rolling out your tongue like a red carpet.");
					else output(" You sputter and push him away");
					if(target.hasAirtightSuit()) output(", so glad that you’re wearing some airtight protection");
					output(".");
				}
			}
		}
		//Phase 2 ability: promises promises - dialogue telling how he will fuck you. (tease)
		public function promisesPromises(target:Creature):void
		{
			if(rand(3) == 0) output("<i>“So cute, thinking you can stop me.”</i> The war-alpha steps forward, almost drooling. <i>“You’re going to love my dick. Love being on it. Love making me cum.”</i> He idly fluffs his hair with his needle-tipped digits. <i>“Of course you’ll forget about all that other stuff.”</i> Pre dribbles down his length to shine his balls.");
			//Alt promises
			else if(rand(2) == 0) output("Grabbing his length one-handed, the war-alpha slowly pumps up and down his considerable length, smearing an even coat of pre over everything so that it glistens hypnotically in the light. <i>“Just drop to your knees and start sucking. Save us both some time.”</i>");
			//Alt
			else output("<i>“I’m gonna fuck you so hard you won’t be able to stand, let alone fight back.”</i> He steps closer, rolling his hips to bounce the large length of his feline penis in crude circles. <i>“Not that you’ll want to, once you’ve had a taste.”</i>");
			if(target.willpower()/2 + rand(20) + 1 >= 25) output("\n\n<b>You're too focused to fall for his teasing!</b>")
			else applyDamage(damageRand(new TypeCollection( { tease: 15 } ), 15), this, target, "minimal");
		}
	}
}