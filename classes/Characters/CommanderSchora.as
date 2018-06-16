package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Apparel.UGCUniform;
	import classes.Items.Melee.Tonfas;
	import classes.Items.Guns.HammerPistol;
	import classes.Items.Protection.BasicShield;
	import classes.Items.Protection.JoyCoPremiumShield;
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

	public class CommanderSchora extends Creature
	{
		
		
		//constructor
		public function CommanderSchora()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "Commander Schora";
			this.originalRace = "human";
			this.a = "";
			this.capitalA = "";
			this.long = "uncreated";
			this.customDodge = "uncreated";
			this.customBlock = "uncreated";
			this.isPlural = false;
			
			this.meleeWeapon = new Tonfas();
			this.armor = new UGCUniform();
			
			this.shield = new JoyCoPremiumShield();

			this.physiqueRaw = 10;
			this.reflexesRaw = 8;
			this.aimRaw = 6;
			this.intelligenceRaw = 4;
			this.willpowerRaw = 3;
			this.libidoRaw = 40;
			this.shieldsRaw = 20;
			this.energyRaw = 100;
			this.lustRaw = 85;
			
			this.level = 10;
			this.XPRaw = normalXP();
			this.credits = 0;
			this.HPMod = 200;
			this.HPRaw = this.HPMax();
			
			this.femininity = 85;
			this.eyeType = 0;
			this.eyeColor = "blue";
			this.tallness = 60;
			this.thickness = 40;
			this.tone = 70;
			this.hairColor = "red";
			this.scaleColor = "bronze";
			this.furColor = "tawny";
			this.hairLength = 3;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_FUR;
			this.skinTone = "pink";
			this.skinFlags = new Array();
			this.faceType = GLOBAL.TYPE_VULPINE;
			this.faceFlags = new Array();
			this.tongueType = 0;
			this.lipMod = 1;
			this.earType = GLOBAL.TYPE_VULPINE;
			this.antennae = 0;
			this.antennaeType = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = 0;
			this.gills = false;
			this.wingType = 0;
			this.legType = 0;
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
			this.cocks[0].cThicknessRatioRaw = 1.2;
			this.cocks[0].cLengthRaw = 18;
			this.cocks[0].cType = GLOBAL.TYPE_HUMAN;
			this.cocks[0].cockColor = "red";
			this.cocks[0].addFlag(GLOBAL.FLAG_TAPERED);
			this.cocks[0].addFlag(GLOBAL.FLAG_KNOTTED);
			//balls
			this.balls = 2;
			this.cumMultiplierRaw = 1.5;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 2;
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
			
			this.breastRows[0].breastRatingRaw = 6;
			this.nippleColor = "pink";
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
			return "VERUSHA";
		}
/*
//Dance with the dzaan, combat style.

Schora has lots of health and decent armor, some shields, cripplingly low Lust resistance. She deals high Kinetic damage with her basic attacks, and can drop some sicknasty debilitating effects on the player. She fights like a PC mercenary in a lot of respects.

Like Kaska, "Low Blow" deals hella bonus damage to her.

The PC picks up an Aegis LMG from her as loot. 

You're fighting Commander Schora, the woman in charge of security here at the Akkadi facility, and previously the pilot of the shielded dropship. She's a tall, curvy dzaan that flaunts her hermaphroditism under her skin-tight jumpsuit pants, hugging her plump balls and thick dick. The ballistic vest that marks her as part of the station's security detachment must have been heavily altered to accommodate her prodigious bust, barely held back by all the bullet-proof material she's wearing. She's currently wielding a bulty machine gun, pressed tight to her shoulder and ready to sling lead with a tap of the trigger.


Machinegun Burst
Schora advances, quick and precise, squeezing the trigger on her gun as she does so. The weapon barks loudly, streaming bursts of red-hot lead with every step its owner takes. {You're raked by impacts from the gun! //else: Several shots impact all around you!}

Chaff Grenade
//Rare. Sets PC's Accuracy bonus to 0 for 3 turns. AIM is unaffected. Any drone the PC has is shut down for the duration.
Scora pulls a small blue sphere off her belt, knocks it against on her horns, and throws it at your feet. You jump back, expecting an explosion -- instead, the grenade lets out a little spark and what feels like a wave of static electricity in the air.

Underslung Shotgun
//Uncommon. Can't miss. Inflicts heavy Kinetic damage. Sunders the PC's armor if their Shields are down.
Schora pumps a shotgun slung under her machinegun's barrel and squeezes a secondary trigger, sending a blast of metal pellets at you! {has Armor, can be Sundered: The blast rips into your armor, tearing it apart! <b>It's Sundered!</b>}

Incendiary Rounds
//Rare. Deals Thermal damage, causes Burning if the PC fails a PHYS save.
With a wicked grin, Schora taps a button on the side of her gun. The muzzle glows red-hot for a split second before its owner fires, sending streaks of red-hot lead your way. Each shot leaves a trail of fiery orange behind it, melting the snow as it passes! {Miss: You grab cover before the burst hits you; the only thing you feel is water from where the shots hit, melting the ice encrusting the helipad. //Hit: The rounds splatter against you like some infernal jelly, smearing across your {armor/[pc.skinFurScales]} with a sizzling agony!}
*/

		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			if(target.hasStatusEffect("Grappled")) return;
			
			//Switch to lust mode:
			if (lust() > 45 && !hasStatusEffect("Futa Lust")) 
			{
				kaskaFutaLusts(target);
				return;
			}

			var choices:Array = new Array();
			//HP Shit
			if(!hasStatusEffect("Futa Lust"))
			{
				if(CombatManager.getRoundCount() % 6 == 0 && CombatManager.getRoundCount() != 0 && !hasStatusEffect("Disarmed") && energy() >= 20)
				{
					CombatAttacks.DisarmingShot.execute(alliedCreatures, hostileCreatures, this, target);
					return;
				}
				if(!hasStatusEffect("Stealth Field Generator") && rand(3) == 0 && energy() >= 20)
				{
					CombatAttacks.StealthFieldGenerator.execute(alliedCreatures, hostileCreatures, this, target);
					return;
				}
				if(target.shields() > 0 && !hasStatusEffect("Disarmed"))
				{
					choices[choices.length] = shieldBusta;
					choices[choices.length] = shieldBusta;
				}
				if(!hasStatusEffect("Disarmed"))
				{
					choices[choices.length] = kaskaVolleyShot;
					choices[choices.length] = CombatAttacks.Overcharge;
				}
				if(!target.hasStatusEffect("Blinded")) choices[choices.length] = CombatAttacks.FlashGrenade;

			}
			//Lust Shit
			else
			{
				if(CombatManager.getRoundCount() % 5 == 0 && CombatManager.getRoundCount() != 0)
				{
					tittyGrapple(target);
					return;
				}
				choices[choices.length] = crateTeaseFromKaska;
				choices[choices.length] = futaSnuggleAttack;
				if(!target.hasStatusEffect("Disarmed")) choices[choices.length] = kaskaHighKick;
			}
			//Pick one
			if (choices.length > 0)
			{
				var sel:* = choices[rand(choices.length)];
				if (sel is SingleCombatAttack) (sel as SingleCombatAttack).execute(alliedCreatures, hostileCreatures, this, target);
				else sel(target);
			}
			else CombatAttacks.MeleeAttack(this, target);
		}
		
		private function kaskaHighKick(target:Creature):void
		{
			output("Spinning like a top, Kaska launches kick after kick in your direction. You manage to dodge the first few, but the canny pirate had never planned on hurting you. The next two knock your [pc.meleeWeapon] and [pc.rangedWeapon] away. She slows, landing her heel on your shoulder while you’re still reeling from the loss of your weapons, a pose that gives you a perfect, unobstructed view from her ankles to her thighs, to her exposed crotch. You can see her veins pulse with excitement - excitement for you!");
			applyDamage(new TypeCollection( { tease: 3 + rand(4) } ), this, target, "minimal");
			CombatAttacks.applyDisarm(target, 3);
			if(target.lust() >= target.lustMax()) output("\n\nIt’s too much. You can’t keep up the facade of fighting her any longer.");
			else output("\n\nYou stumble back, more aroused by the view than you care to admit.");
		}
		
		private function futaSnuggleAttack(target:Creature):void
		{
			output("Kaska feigns a kick one way before reversing and coming up inside your guard. Her toned body wraps briefly around your own, ");
			if(target.armor.shortName == "") output("leaving you intimately aware of the feeling of her devilishly hot member grinding on your [pc.thigh]");
			else output("leaving you intimately aware of the pressure of her dick on your [pc.armor]");
			output(". She licks the lobe of your ear, whispering, <i>“I could do things to you that no mere woman or man could dream of.”</i>");
			applyDamage(new TypeCollection( { tease: 9 + rand(5) } ), this, target, "minimal");
			if (target.lust() < target.lustMax()) output("\n\nThe horny dick-girl doesn’t bother resisting when you push her away, but her scent and warmth remain.");
			else output("You’re enjoying this far too much to push her away.");
		}
		
		private function crateTeaseFromKaska(target:Creature):void
		{
			output("Groaning, Kaska leans back against a crate. Her toned thighs flex once, quivering slightly as if fighting some unknown force, slicked with sweat that can’t be explained away by the fight alone. Suddenly, the quivering stops, and the pirate’s legs spread, lifting up off the ground entirely until they’re in a perfect, suspended split. You can see the dusky, glistening lips of the woman’s sex from underneath her swollen balls and dripping, erect phallus. Holding herself like that, Kaska curls her toes as if to beckon you forward. <i>“You know you want it.”</i>");
			applyDamage(new TypeCollection( { tease: 8 + rand(10) } ), this, target, "minimal");
		}
		
		private function tittyGrapple(target:Creature):void
		{
			output("Kaska tosses a metallic sphere the size of a golfball between you. It hisses, releasing a cloud of smoke. You hold your breath, fearing poison, only to have a pair of caramel-colored tits part the smoke, pressing against either side of your head. The owner of the cushy mounds wraps surprisingly strong arms around you, pinning you in the middle of her more than ample cleavage, limiting your senses’ input to the sight, smell, taste, and feel of her bosom.\n\n<b>You are grappled!</b>");
			CombatAttacks.applyGrapple(target, 30);
		}
		
		private function kaskaFutaLusts(target:Creature):void
		{
			output("Kaska looks visibly perturbed. She chews on her lip, looking you up and down over the sights on her gunbarrel before relaxing her posture. While her weapon drifts down, so too does her gaze, flicking across the expanse of her chest to take in the sight of now hardened nipples. Her brows knit when her eyes alight on the sight of her hard, throbbing cock jutting out from her crotch.");
			output("\n\n<i>“Oh... fuck it.”</i> the aggressive pirate lets her machinegun drop. It bounces off the deck, clattering noisily before ricochetting into a crate thanks to the zero-G. <i>“It looks like you get to live, assuming you can finish what you’ve started.”</i>");
			output("\n\nWith her hands freed, Kaska is able to take her length, now about ten inches, and rub it, milking a few drops of pre into her other palm without ever taking her eyes off you. She stops after a second and flicks a dollop your way. It slaps into your cheek. <i>“I have missed having a harem. You can be my first " + target.mf("“wife”","wife") + ".”</i>");
			createStatusEffect("Futa Lust",0,0,0,0);
			//+5 lust each
			applyDamage(new TypeCollection( { tease: 5 } ), this, target, "minimal");
			applyDamage(new TypeCollection( { tease: 5 } ), this, this, "suppress");
		}
		
		private function kaskaVolleyShot(target:Creature):void
		{
			output("The scantily clad pirate lifts the butt of her gun to her shoulder, shifting to a two-handed grip before pulling down the trigger, spraying a huge volley of shots from both barrels at once. Glowing orange-red beams and bullets fill the air with a lethal rain.");
	
			// Ideally copypasta and run this twice.
			var damage:TypeCollection = damage(false);
			damage.add(new TypeCollection( { burning: 1, electric: 1 } ));
			damage.addFlag(DamageFlag.LASER);
			damage.add(aim() / 2);
			
			damage.kinetic.damageValue -= 3;
			damage.burning.damageValue -= 3;
			damage.electric.damageValue -= 3;
			if (damage.kinetic.damageValue < 1) damage.kinetic.damageValue = 1;
			if (damage.burning.damageValue < 1) damage.burning.damageValue = 1;
			if (damage.electric.damageValue < 1) damage.electric.damageValue = 1;
			
			var attacks:uint = 4;
			
			for (var i:uint = 0; i < attacks; i++)
			{
				if (rangedCombatMiss(this, target))
				{
					output("You manage to avoid " + a + possessive(short) + " " + rangedWeapon.attackNoun + ".");
				}
				else if (rand(100) <= 45 && !target.isImmobilized())
				{
					if (target.customDodge.length > 0) output(target.customDodge);
					else output("You manage to avoid " + a + possessive(short) + " " + rangedWeapon.attackNoun + ".");
				}
				else if (kGAMECLASS.mimbraneFeetBonusEvade(target, this))
				{
					output(kGAMECLASS.mimbraneFeetBonusEvadeBonus());
				}
				else
				{
					output(capitalA + short + " connects with " + mfn("his", "her", "its") + " " + rangedWeapon.longName + "!");
					
					applyDamage(damage, this, target, "ranged");
				}
				output("\n");
			}
		}
		
		private function shieldBusta(target:Creature):void
		{
			output("Kaska flicks a switch the side of her gun, and the indicator lights on the bottom barrel dim. <i>“Let’s see how your shields like laser!”</i> she cries.\n");
			
			for (var i:int = 0; i < 5; i++)
			{
				output("\n");
				CombatAttacks.SingleRangedAttackImpl(this, target, true);
			}
		}
	}
}