package classes.Characters
{
	import classes.Creature;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Items.Miscellaneous.EmptySlot;
	import classes.Items.Guns.SlutRay;
	import classes.Items.Guns.SlutRayHeavy;
	import classes.Items.Protection.ReaperArmamentsMarkIIShield;
	import classes.Items.Miscellaneous.Throbb;
	import classes.Items.Armor.StarViperSlutwear;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.Engine.Interfaces.output;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Engine.Combat.DamageTypes.DamageResult;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.*;
	import classes.Engine.Interfaces.author;
	
	public class SlyverenSlavebreaker extends Creature
	{
		//Fen did dis.
		//constructor
		public function SlyverenSlavebreaker()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "slyveren slavebreaker";
			this.originalRace = "slyveren";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = "";
			this.customDodge = "The slyveren sensuously wiggles aside.";
			this.customBlock = "Bluh.";
			this.isPlural = false;
			
			meleeWeapon.attackVerb = "punch";
			meleeWeapon.attackNoun = "fist";
			meleeWeapon.longName = "fist";
			meleeWeapon.description = "a fist";
			meleeWeapon.baseDamage.kinetic.damageValue = 1;
			//meleeWeapon.addFlag(DamageFlag.PENETRATING);
			meleeWeapon.hasRandomProperties = true;

			this.rangedWeapon = new SlutRay();
			this.rangedWeapon.baseDamage.tease.damageValue = 1;
			this.rangedWeapon.attackNoun = "beam of psychic, erotic energies";
			this.rangedWeapon.hasRandomProperties = true;
			
			this.armor = new StarViperSlutwear();
			//this.armor.defense = 5;
			//this.armor.hasRandomProperties = true;

			this.shield = new ReaperArmamentsMarkIIShield();
			this.shield.shields = 300;
			this.shield.hasRandomProperties = true;
			
			this.physiqueRaw = 25;
			this.reflexesRaw = 40;
			this.aimRaw = 40;
			this.intelligenceRaw = 30;
			this.willpowerRaw = 30;
			this.libidoRaw = 60;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 20;
			this.level = 10;
			this.XPRaw = normalXP();
			this.credits = 0;
			this.HPMod = 150;
			this.HPRaw = this.HPMax();
			this.shieldsRaw = this.shieldsMax();

			this.femininity = 90;
			this.eyeType = GLOBAL.TYPE_SNAKE;
			this.eyeColor = "gold";
			this.tallness = 78;
			this.thickness = 60;
			this.tone = 60;
			this.hairColor = "pink";
			this.scaleColor = "black";
			this.furColor = "black";
			this.hairLength = 0;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_SCALES;
			this.skinTone = "ebony";
			this.skinAccent = "gold";
			this.skinFlags = [];
			
			this.faceType = GLOBAL.TYPE_SNAKE;
			this.faceFlags = [GLOBAL.FLAG_MUZZLED];
			this.tongueType = GLOBAL.TYPE_SNAKE;
			this.tongueFlags = [GLOBAL.FLAG_LONG,GLOBAL.FLAG_PREHENSILE];
			this.lipMod = 2;
			this.lipColor = "black";
			this.earType = GLOBAL.TYPE_SNAKE;
			this.antennae = 0;
			this.antennaeType = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = 0;
			this.armFlags = [GLOBAL.FLAG_SCALED]
			this.gills = false;
			this.wingType = 0;
			this.legType = GLOBAL.TYPE_HUMAN;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE, GLOBAL.FLAG_SCALED];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_SNAKE;
			this.tailCount = 1;
			this.tailFlags = [GLOBAL.FLAG_SCALED,GLOBAL.FLAG_LONG,GLOBAL.FLAG_PREHENSILE];
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
			this.hipRatingRaw = 18;
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
			this.buttRatingRaw = 15;
			//No dicks here!
			this.cocks = new Array();
			//balls
			this.balls = 0;
			this.cumMultiplierRaw = 100;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 30;
			this.ballFullness = 100;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 60;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 9991;
			this.minutesSinceCum = 9000;
			this.timesCum = 9000;
			this.cockVirgin = true;
			this.vaginalVirgin = false;
			this.analVirgin = false;
			this.vaginas = new Array();
			this.cocks = new Array();
			//Goo is hyper friendly!
			this.elasticity = 1.5;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1.05;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 23;
			this.nippleColor = "black";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 1;
			this.ass.wetnessRaw = 0;
			this.ass.loosenessRaw = 1;
			this.ass.bonusCapacity = 400;

			this.createVagina();
			this.vaginas[0].wetnessRaw = 4;
			this.vaginas[0].loosenessRaw = 3;
			this.vaginas[0].bonusCapacity = 400;
			this.vaginas[0].type = GLOBAL.TYPE_INHUMAN;
			this.vaginas[0].vaginaColor = "blue";
			
			//this.createStatusEffect("Disarm Immune");
			createStatusEffect("Force Fem Gender");
			createPerk("Appearance Enabled");

			inventory = [];

			var lossLoot:Array = [];
			
			isUniqueInFight = true;
			btnTargetText = "Slyveren";
			sexualPreferences.setRandomPrefs(4,3);
			sexualPreferences.setPref(GLOBAL.SEXPREF_COCKS, sexualPreferences.getRandomLikesFactor());
			sexualPreferences.setPref(GLOBAL.SEXPREF_BALLS, sexualPreferences.getRandomLikesFactor());

			this._isLoading = false;
			kGAMECLASS.zhengShiSSTDChance(this);
			randomise();
		}

		public function randomise():void
		{
			//Wsans
			if(rand(2) == 0)
			{
				//She loves 'em big
				sexualPreferences.setPref(GLOBAL.SEXPREF_BIG_MALEBITS, GLOBAL.REALLY_LIKES_SEXPREF);
				this.scaleColor = "purple";
				this.skinAccent = "neon blue";
				this.lipColor = "pink";
				this.eyeColor = "pink";
				this.nippleColor = "pink";
				this.long = "Eyeing you up is a beautiful, curvy snakewoman with scaled purple skin, highlighted with a glowing blue you just somehow know is designed to draw your eyes to her sexual nature. Though her body is kept tautly contained in her leather top, she clearly has no problem showing it off to you. The way her clothing compresses her ample breasts creates a valley of cleavage for you to look at, a reminder of her fertility and wanton lust. Her glowing pink eyes seem to rove over you as if in search of answers, imploring you to reveal yourself.\n\nShe purses her large, pink lips and blows you a kiss, winking coquettishly. She wants this to end amicably, no doubt. It’s just a question of who comes out on top of the other.";
			}
			else
			{
				//Nothing needs changed :3
				this.long = "The sea of her glittering black scales would swallow your gaze up whole were it not for the bioluminescent gold patterns that twist and twirl around her curvaceous body. You almost wish you could see beneath the cups of her revealing, pink-dyed leather top to see how they frame the jiggling mounds upon which they dwell. A bit further down, her tattoos spiral around her tail until they converge in a bioluminescent singularity of eye-trapping amber. Equally golden (though no less enchanting) orbs leer back at you from beneath an enormous cobra hood, so heavy it droops slightly on one side. She licks her glistening ebony lips and winks at you, a not-so-subtle reminder that she likes to break her slaves with pleasure rather than pain.";
			}
			if(rand(3) <= 2)
			{
				this.inventory.push(new Throbb());
				if(rand(2) == 0) this.inventory[0].quantity++;
			}
			if(rand(10) == 0) this.inventory.push(new StarViperSlutwear());
			else if(rand(10) == 0) this.inventory.push(new SlutRayHeavy());
		}
		override public function get bustDisplay():String
		{
			if(this.scaleColor == "purple") return "SLAVEBREAKER_2";
			else return "SLAVEBREAKER_1";
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			var canSiphonShields:Boolean = (target.hasShields() && target.shields() > 0);
			
			if(this.hasStatusEffect("Disarmed")) 
			{
				if(target.hasStatusEffect("Grappled")) slyverenGrappleEffects(target);
				else if(this.energy() >= 33 && this.shields()/this.shieldsMax() < 0.5 && canSiphonShields) shieldSiphon(target);
				else if(!this.hasStatusEffect("Optic Blur")) bonusEvadeGo(target);
				else if(!target.hasStatusEffect("Weapon Lock") && !target.hasStatusEffect("Special Lock") && this.energy() >= 33 && rand(2) == 0) mentalLockAttack(target);
				else if(rand(3) <= 1) 
				{
					output("<i>“The slyveren slavebreaker leans low, pressing her tits together. <i>“I don’t need a weapon to break you.”</i>");
					applyDamage(new TypeCollection( { tease: 16 } ), target, this,"minimal");
				}
				else snakeSnekGrapple(target);
			}
			else if(target.hasStatusEffect("Grappled")) slyverenGrappleEffects(target);
			else if(target.aim() >= 30 && !this.hasStatusEffect("Optic Blur")) bonusEvadeGo(target);
			//Chance of siphon below 75%.
			else if(this.energy() >= 33 && this.shields()/this.shieldsMax() < 0.75 && rand(2) == 0 && canSiphonShields) shieldSiphon(target);
			//Always try at 0.
			else if(this.energy() >= 33 && this.shields() <= 0 && canSiphonShields) shieldSiphon(target);
			//Overcharge after 50 lust sometimes, energy permitting
			else if(this.lust() >= 50 && this.energy() >= 20 && rand(4) == 0) overchargedSlootRay(target);
			//20% chance of using a lock attack.
			else if(!target.hasStatusEffect("Weapon Lock") && !target.hasStatusEffect("Special Lock") && this.energy() >= 33 && rand(5) == 0) mentalLockAttack(target);
			//Grapples!
			else if(!target.hasStatusEffect("Grappled") && rand(5) == 0) snakeSnekGrapple(target);
			else slutRayShot(target);
		}
		
		//Slut ray shot:
		public function slutRayShot(target:Creature):void
		{
			output("The slyveren slavebreaker raises her pistol! ");
			//Standard rangedAttackImpl
			CombatAttacks.SingleRangedAttackImpl(this, target, false);
		}
		//If pc.aim >= 30, bonus ranged evade
		//"Optic Blur"
		public function bonusEvadeGo(target:Creature):void
		{
			output("The slyveren slavebreaker eyes your [pc.rangedWeapon] warily, then taps a device on her wrist. An optic blur appears, obscuring her profile. She’ll be harder to hit with ranged weapons!");
			this.createStatusEffect("Optic Blur", 30, 0, 0, 0, false, "DefenseUp", "Increases evasion against ranged attacks by 30%!", true, 0);
		}
		//Overcharged Slut Ray - used if she’s horny
		public function overchargedSlootRay(target:Creature):void
		{
			this.energy(-20);
			output("The slavebreaker slaps a dial on her weapon up to maximum, then twists it a notch beyond, uncaring at the pink sparks it throws off. The tip glows with a sort of carnal menace as she guides the barrel in your direction.");
			//Miss
			if(rangedCombatMiss(this, target)) output("\n\tThe shot goes wide!");
			//Hit - randomly one of the following
			else
			{
				if(rand(6) == 0) output("\n\n<i>Titties titties titties! Bouncy breasts jiggling against your face and in your lip. Sweet supple breasts in every direction and on your every pore.</i>");
				else if(rand(5) == 0) output("\n\n<i>The scent of pussy in your nostrils. The slyveren’s legs wrapped around your head. The slick heat of sex seeping into your [pc.skinFurScales] hours of animalistic fucking.</i>");
				else if(rand(4) == 0) output("\n\n<i>Ropes and chains digging into you, binding and presenting you. Scaly maidens circling you with lust in their eyes. Hours in their bedchambers being taken, one after another.</i>");
				else if(rand(3) == 0) output("\n\n<i>Want. You want. You desire. You crave. Sex dances behind your eyes. The slyveren’s glittering scales reflect a fractal wheel of her nude body from every angle, each offered to you in the same moment.</i>");
				//dix only
				if(target.hasCock() && rand(2) == 0) output("\n\n<i>The slyveren’s lips sealed tight around your [pc.cock], bobbing back and forth in heedless passion. Slurps and suckles fill your ears. Her pillowy dick-pleasures squeeze tight. When you blink, those luscious angel bows remain to kiss your very mind.</i>");
				//puss
				else if(target.hasVagina() && rand(2) == 0) output("\n\n<i>The slyveren’s lips sealed tight against your [pc.vagina], slipping up and down in headless passion. Lurid slurps fill your ears. Her tongue digs deep. Those pillowy puss-pleasers squeeze tight. When you blink, the luscious angel bows remain to cunnilingate your very mind.</i>");
				//more
				else output("\n\n<i>Hips gyrating against your own. Breasts sliding against your chest. Hands in your bare loins, exploring with rapt attention. A tail, curling around your [pc.leg] and slapping at your [pc.butt]. Glowing pink lips against your own, exhaling pure need.</i>");
				//Merge
				output("\n\nYou feel woozy and horny. The images remain even as the sexy slyveren fans her briefly overheating weapon.");
				if(target.lust() >= 95) output(" <b>You never stood a chance against a woman that gorgeous.</b>");
				
				var d:TypeCollection = this.rangedDamage();
				d.multiply(1.4);
				damageRand(d, 15);
				applyDamage(d, this, target, "minimal");

				if (this.intelligence() / 2 + rand(20) + 1 >= target.willpower() / 2 + 10 && !target.hasStatusEffect("Stunned") && !target.hasStatusEffect("Stun Immune"))
				{
					output("\n\t");
					if (target is PlayerCharacter) output("<b>You are stunned!</b>");
					else output("<b>" + StringUtil.capitalize(target.getCombatName(), false) + " " + (target.isPlural ? "are" : "is") + " stunned!</b>");
					CombatAttacks.applyStun(target, 1);
				}
			}
		}
		//Mental Lock
		//33 energy
		public function mentalLockAttack(target:Creature):void
		{
			output("The slyveren’s eyes erupt with " + (this.eyeColor == "gold" ? "golden":"pinkish") + " fire, her gaze drilling deep into you.");
			this.energy(-33);
			//Resist
			if(rand(20)+1+this.intelligence()/2 < target.willpower()/2+10)
			{
				output("\n\nClosing your eyes feels harder than lifting a 100 pound weight, but you do it. The mental pressure falls away, and when you dare another look, the snake-woman wears a mask of irritation.");
			}
			//Fail
			else
			{
				//Weapon Lock
				if(!target.hasStatusEffect("Weapon Lock") && (rand(2) == 0 || target.hasStatusEffect("Special Lock")))
				{
					output("\n\nYou try to close your eyes, but it’s like trying to push a door closed in a hurricane. The torrential force of her gorgeous gaze presses inside of you. Somehow, you resist the attempt to drop you to your knees. If only you could bring yourself to utilize your weaponry! The very act of violence seems so... so... awful when you could end this with nonviolent means.");
					target.createStatusEffect("Weapon Lock", 5, 0, 0, 0, false, "Icon_OffDown", "You cannot bring yourself to use your weapons!", true, 0, 0xFF0000);
				}
				//Special Lock
				else
				{
					output("\n\nYou try to block it out, but you can’t close your eyes. It takes every ounce of will to keep yourself from dropping to the ground. Forgetting how to use your special abilities seems a small price to pay for staying in the fight!");
					target.createStatusEffect("Special Lock", 5, 0, 0, 0, false, "Icon_Confused", "You can’t remember how to use your special abilities!", true, 0, 0xFF0000);
				}
			}
		}
		//Shield Siphon
		//33 energy
		public function shieldSiphon(target:Creature):void
		{
			output("A quick key-tap on the snake-woman’s belt causes it to begin humming. Her shield shimmers, strengthening, feeding off your own.");

			var damage:TypeCollection = new TypeCollection({ electric: 100 }, DamageFlag.ONLY_SHIELD);
			applyDamage(damage, this, target, "minimal");
			this.energy(-33);
			//damage.multiply(0.5);
			//output("\nTEST DATA: " + damage.getTotal());
			this.shields(Math.round(damage.getTotal()));
			output("\n<b>She sapped your shields!</b>");
		}
		//Grapple
		public function snakeSnekGrapple(target:Creature):void
		{
			output("The slyveren slavebreaker springs off one leg, lands gracefully on the other, and propels herself in low, under your guard.");
			//Miss
			if(combatMiss(this, target)) output("\n\nYou brace as she tries to pull you off balance, then push back twice as hard. The snake-woman bristles in annoyance as she staggers back into a combat stance.");
			//Hit
			else
			{
				output("\n\nShe pulls your [pc.legOrLegs] hard. You go down with her on top of you. Grinning, the slyveren does her best to keep you pinned. <b>You are grappled!</b>");
				target.createStatusEffect("Grappled", 0, 65, 0, 0, false, "Constrict", "The slyveren has you pinned!", true, 0);
			}
		}
		public function slyverenGrappleEffects(target:Creature):void
		{
			//Grappled but not crotch covered:
			if(!target.isCrotchExposedByArmor())
			{
				this.createStatusEffect("SLYVEREN_HAZ_UR_LOOT");
				output("With a none-too-innocent giggle, the slyveren’s fingers burrow into your equipment. <b>She pops you out of your [pc.armor]</b> faster than a galotian on stims. <i>“Slaves don’t need this, silly!”</i> The equipment lands nearby.");
				if(target.willpower()/2+rand(20)+1 >= 35) output("\n\tYou resist her attempts to arouse you, even if you’re much more exposed.");
				else applyDamage(new TypeCollection( { tease: 6 } ), target, this,"minimal");
				/*
				var temp:ItemSlotClass = target.armor;
				this.inventory.push(temp);
				target.armor = new EmptySlot();
				*/
				if(target is PlayerCharacter) (target as PlayerCharacter).takeArmor();
			}
			//Grappled but underwear covered
			else if(!target.isCrotchExposedByLowerUndergarment())
			{
				this.createStatusEffect("SLYVEREN_HAZ_UR_LOOT");
				output("<i>“Let’s see what you’re packing!”</i> The <b>slyveren slavebreaker gleefully strips off your [pc.lowerUndergarment]</b>, revealing your [pc.crotch]. <i>“");
				if(target.hasCock()) output("Oh yes.");
				else if(target.hasVagina()) output("Oooh, so that’s what you were hiding.");
				else output("Huh.");
				output("”</i>");
				if(target.willpower()/2+rand(20)+1 >= 35) output("\n\tYou resist her attempts to arouse you, even if you’re completely exposed.");
				else applyDamage(new TypeCollection( { tease: 6 } ), target, this,"minimal");
				/*
				var temp2:ItemSlotClass = target.lowerUndergarment;
				this.inventory.push(temp2);
				target.lowerUndergarment = new EmptySlot();
				*/
				if(target is PlayerCharacter) (target as PlayerCharacter).takeLowerUndergarment();
			}
			//Grappled, no genitals
			else if(!target.hasGenitals())
			{
				output("<i>“What a waste of time.”</i> She climbs up off of you and dusts her hands. <i>“What sort of slave doesn’t have </i>any<i> genitals?”</i>\n\t<b>You are no longer grappled!</b>");
				target.removeStatusEffect("Grappled");
			}
			else if(this.hasStatusEffect("genitalSucked"))
			{
				output("<i>“Oh my, you are a good slave,”</i> the slyveren coos, resuming the slow polishing of your genitals. Whether it’s the words or her lips and tongue, you aren’t sure, but it generates an erotic thrill all the same. This time, she’s down there for a full minute ");
				var damage:TypeCollection = new TypeCollection({ tease: 26 });
				var dr2:DamageResult = applyDamage( damage , this, target, "suppress");

				if(target.lust() < target.lustMax()) output(" before you remember to struggle.");
				else output("before you decide to give in.");
				outputDamage(dr2);
			}
			//Balls
			else if(target.balls > 0 && rand(3) == 0)
			{
				output("<i>“Oh yes,”</i> the slavebreaker moans, climbing down to nuzzle into your [pc.sack]. Her tongue flicks out rapid-fire to taste your sweat and musk, but it’s the machine-gun kisses she lays on your [pc.balls] after a few moments of that that really get you going. Cradling you like that, she worships you for a solid minute before either of you remember what you were doing.");
				if(target.willpower()/2+rand(20)+1 >= 35) 
				{
					output("\n\tYou resist... as much as you can.");
					applyDamage(new TypeCollection( { tease: 6 } ), target, this,"minimal");
				}
				else applyDamage(new TypeCollection( { tease: 18 } ), target, this,"minimal");
				//She gains lust tooo~
				output("\n\nThe slavebreaker is breathing heavily!");
				applyDamage(new TypeCollection( { tease: 10 } ), this, target,"minimal");
				this.createStatusEffect("genitalSucked");
			}
			//Grappled and exposed dick
			else if(target.hasCock() && (!target.hasVagina() || rand(2) == 0))
			{
				output("<i>“Give up,”</i> the slavebreaker implores. She bends low and wraps her lips around [pc.oneCock], briefly bobbing her head. It feels better than you could have imagined. The snake-woman’s plush maw feels made to slurp on cock. By the time she pops off and repeats, <i>“Give up,”</i> you’re considering it.");
				if(target.willpower()/2+rand(20)+1 >= 35) 
				{
					output("\n\tYou resist... as much as you can.");
					applyDamage(new TypeCollection( { tease: 6 } ), target, this,"minimal");
				}
				else applyDamage(new TypeCollection( { tease: 22 } ), target, this,"minimal");
				this.createStatusEffect("genitalSucked");
			}
			//Grappled, exposed cunny
			else
			{
				output("<i>“We could be having fun,”</i> the slavebreaker offers. She leans down and presses her lips to [pc.oneVagina]. The softness of her lips is heavenly against your [pc.clits], and when her tongue whips through your slit, you can’t help but seriously consider her offer.");
				if(target.willpower()/2+rand(20)+1 >= 35) 
				{
					output("\n\tYou resist... as much as you can.");
					applyDamage(new TypeCollection( { tease: 6 } ), target, this,"minimal");
				}
				else applyDamage(new TypeCollection( { tease: 20 } ), target, this,"minimal");
				this.createStatusEffect("genitalSucked");
			}
		}
	}
}
