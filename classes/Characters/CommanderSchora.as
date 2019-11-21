package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Apparel.TSTArmorMkII;
	import classes.Items.Melee.Tonfas;
	import classes.Items.Guns.AegisLightMG;
	import classes.Items.Protection.ReaperArmamentsMarkIShield;
	import classes.Items.Accessories.FlashGoggles;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.GameData.CodexManager;
	import classes.GameData.SingleCombatAttack;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Engine.Combat.*;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	import classes.Engine.Interfaces.output;
	import classes.Engine.Utility.possessive;

	import classes.UIComponents.UIStyleSettings;
	
	public class CommanderSchora extends Creature
	{
		//constructor
		public function CommanderSchora()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "Commander Schora";
			this.originalRace = "dzaan";
			this.a = "";
			this.capitalA = "";
			this.isPlural = false;
			
			this.meleeWeapon = new Tonfas();
			this.rangedWeapon = new AegisLightMG();
			this.inventory.push(new AegisLightMG());
			this.armor = new TSTArmorMkII();
			
			this.shield = new ReaperArmamentsMarkIShield();

			this.physiqueRaw = 36;
			this.reflexesRaw = 37;
			this.aimRaw = 42;
			this.intelligenceRaw = 28;
			this.willpowerRaw = 20;
			this.libidoRaw = 60;
			this.energyRaw = 100;
			this.lustRaw = 25;
			this.shieldsRaw = shieldsMax();
			
			//Where do these come out of? My ass.
			baseHPResistances.tease.damageValue = -15;
			baseHPResistances.drug.damageValue = -10;
			baseHPResistances.pheromone.damageValue = -25;
			
			
			this.level = 10;
			this.XPRaw = normalXP();
			this.credits = 0;
			this.HPMod = 200;
			this.HPRaw = this.HPMax();
			
			this.femininity = 85;
			this.eyeType = GLOBAL.TYPE_HUMAN;
			this.eyeColor = "red";
			this.tallness = 88;
			this.thickness = 40;
			this.tone = 70;
			this.hairColor = "strawberry blonde";
			this.scaleColor = "bronze";
			this.furColor = "brown";
			this.hairLength = 7;
			this.hairType = GLOBAL.HAIR_TYPE_REGULAR;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_SKIN;
			this.skinTone = "bronze";
			this.skinFlags = new Array();
			this.faceType = GLOBAL.TYPE_DZAAN;
			this.faceFlags = new Array();
			this.tongueType = 0;
			this.lipMod = 1;
			this.earType = GLOBAL.TYPE_DZAAN;
			this.earLength = 4;
			this.antennae = 0;
			this.antennaeType = 0;
			this.horns = 2;
			this.hornType = GLOBAL.TYPE_DZAAN;
			this.hornLength = 4;
			this.armType = GLOBAL.TYPE_DZAAN;
			this.gills = false;
			this.wingType = 0;
			this.legType = GLOBAL.TYPE_DZAAN;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_DIGITIGRADE];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
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
			this.hipRatingRaw = 8;
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
			this.buttRatingRaw = 7;
			//No dicks here!
			this.cocks = new Array();
			this.createCock();
			this.cocks[0].cThicknessRatioRaw = 1.75;
			this.cocks[0].cLengthRaw = 5.125;
			this.cocks[0].cType = GLOBAL.TYPE_DZAAN;
			this.cocks[0].cockColor = "red";
			this.cocks[0].addFlag(GLOBAL.FLAG_TAPERED);
			this.cocks[0].addFlag(GLOBAL.FLAG_KNOTTED);
			//balls
			this.balls = 2;
			this.cumMultiplierRaw = 1.5;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 20;
			this.ballFullness = 100;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 4;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 9999;
			this.minutesSinceCum = 9000;
			this.timesCum = 785;
			this.cockVirgin = true;
			this.vaginalVirgin = false;
			this.analVirgin = false;
			this.vaginas = new Array();
			this.createVagina();
			this.vaginas[0].hymen = false;
			this.vaginas[0].clits = 1;
			this.vaginas[0].wetnessRaw = 2;
			this.vaginas[0].loosenessRaw = 1;
			this.vaginas[0].bonusCapacity = 20;
			//Goo is hyper friendly!
			this.elasticity = 3;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 12;
			this.nippleColor = "black";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 1;
			this.ass.wetnessRaw = 0;
			
			this.createStatusEffect("Flee Disabled",0,0,0,0,true,"","",false,0);

			isUniqueInFight = true;
			btnTargetText = "Schora";

			this._isLoading = false;
		}
		override public function get bustDisplay():String
		{
			return "SCHORA";
		}
/*
//Dance with the dzaan, combat style.

Schora has lots of health and decent armor, some shields, cripplingly low Lust resistance. She deals high Kinetic damage with her basic attacks, and can drop some sicknasty debilitating effects on the player. She fights like a PC mercenary in a lot of respects.


Like Kaska, "Low Blow" deals hella bonus damage to her.
-dun

The PC picks up an Aegis LMG from her as loot.
-dun

You’re fighting Commander Schora, the woman in charge of security here at the Akkadi facility, and previously the pilot of the shielded dropship. She’s a tall, curvy dzaan that flaunts her hermaphroditism under her skin-tight jumpsuit pants, hugging her plump balls and thick dick. The ballistic vest that marks her as part of the station’s security detachment must have been heavily altered to accommodate her prodigious bust, barely held back by all the bullet-proof material she’s wearing. She’s currently wielding a bulky machine gun, pressed tight to her shoulder and ready to sling lead with a tap of the trigger.


Machinegun Burst
Schora advances, quick and precise, squeezing the trigger on her gun as she does so. The weapon barks loudly, streaming bursts of red-hot lead with every step its owner takes. {You’re raked by impacts from the gun! //else: Several shots impact all around you!}

Chaff Grenade
//Rare. Sets PC's Accuracy bonus to 0 for 3 turns. AIM is unaffected. Any drone the PC has is shut down for the duration.
Scora pulls a small blue sphere off her belt, knocks it against on her horns, and throws it at your feet. You jump back, expecting an explosion -- instead, the grenade lets out a little spark and what feels like a wave of static electricity in the air.

Underslung Shotgun
//Uncommon. Can't miss. Inflicts heavy Kinetic damage. Sunders the PC's armor if their Shields are down.
Schora pumps a shotgun slung under her machinegun’s barrel and squeezes a secondary trigger, sending a blast of metal pellets at you! {has Armor, can be Sundered: The blast rips into your armor, tearing it apart! <b>It’s Sundered!</b>}

Incendiary Rounds
//Rare. Deals Thermal damage, causes Burning if the PC fails a PHYS save.
With a wicked grin, Schora taps a button on the side of her gun. The muzzle glows red-hot for a split second before its owner fires, sending streaks of red-hot lead your way. Each shot leaves a trail of fiery orange behind it, melting the snow as it passes! {Miss: You grab cover before the burst hits you; the only thing you feel is water from where the shots hit, melting the ice encrusting the helipad. //Hit: The rounds splatter against you like some infernal jelly, smearing across your {armor/[pc.skinFurScales]} with a sizzling agony!}
*/

		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;	
			
			
			var choice:int = rand(8);
			
			if (hasStatusEffect("Disarmed")) electricDakka(target);
			else if (choice < 4) basicDakka(target);
			else if (choice < 6) shottyDakka(target);
			else if (choice < 7) burningDakka(target);
			else electricDakka(target);
		}
		
		private function basicDakka(target:Creature):void
		{
			output("Schora advances, quick and precise, squeezing the trigger on her gun as she does so. The weapon barks loudly, streaming bursts of red-hot lead with every step its owner takes.");
			if (rangedCombatMiss(this, target) || blindMiss(this, target)) output(" Several shots impact all around you!");
			else
			{
				output(" You’re raked by impacts from the gun!");
				applyDamage(rangedDamage(), this, target, "minimal");
			}
		}
		
		private function shottyDakka(target:Creature):void
		{
			output("Schora pumps a shotgun slung under her machinegun’s barrel and squeezes a secondary trigger, sending a blast of metal pellets at you!");
			applyDamage(damageRand(rangedDamage().multiply(1.5), 10), this, target, "minimal");
			if (target.hasArmor() && target.shields() <= 0 && !target.hasStatusEffect("Sundered")){
				output("\n\nThe blast rips into your armor, tearing it apart! <b>It’s Sundered!</b>");
				CombatAttacks.applySunder(target);
			}
		}
		
		private function burningDakka(target:Creature):void
		{
			output("With a wicked grin, Schora taps a button on the side of her gun. The muzzle glows red-hot for a split second before its owner fires, sending streaks of red-hot lead your way. Each shot leaves a trail of fiery orange behind it, melting the snow as it passes!");
			if (rangedCombatMiss(this, target) || blindMiss(this, target)) output(" You grab cover before the burst hits you; the only thing you feel is water from where the shots hit, melting the iceencrusting the helipad.");
			else
			{
				output(" The rounds splatter against you like some infernal jelly, smearing across your " + (target.hasArmor() ? target.armor.longName : target.skinFurScales()) + " with a sizzling agony!");
				var damage:TypeCollection = new TypeCollection({burning:rangedDamage()});
				applyDamage(damage, this, target, "minimal");
				if (target.physique()/2 + rand(20) + 1 < this.aim()/2+10) 
				{
					CombatAttacks.applyBurn(target);
					output(" <b>You are burning!</b>");
				}
			}
		}
		
		private function electricDakka(target:Creature):void
		{
			output("Schora pulls a small blue sphere off her belt, knocks it against on her horns, and throws it at your feet. You jump back, expecting an explosion -- instead, the grenade lets out a little spark and what feels like a wave of static electricity in the air.");
			if (target.hasStatusEffect("Chaff Grenade")) target.setStatusValue("Chaff Grenade", 1, 3);
			else target.createStatusEffect("Chaff Grenade",3,0,0,0,false,"Icon_Paralysis","Removes all bonuses to accuracy!",true,0,UIStyleSettings.gShieldColour);
		}
	}
}