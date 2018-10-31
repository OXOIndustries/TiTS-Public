package classes.Characters
{
	import classes.CockClass;
	import classes.Creature;
	import classes.GameData.SingleCombatAttack;
	import classes.GLOBAL;
	import classes.Items.Guns.SecureMP;
	import classes.Items.Guns.MagnumPistol;
	import classes.Items.Melee.LightningRod;
	import classes.Items.Protection.ArcticWarfareBelt;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.VaginaClass;
	import classes.Characters.GunTurret;
	
	import classes.Engine.Combat.*;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Engine.Interfaces.output;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	
	import classes.Engine.Utility.weightedRand;
	import classes.Engine.Utility.num2Text;
	import classes.StringUtil;
	import classes.Items.Miscellaneous.EmptySlot;
	
	//Low health, mid armor, heavy shields. Carries a rapid-fire, low-damage gun. Level 5.

	public class Krym extends Creature
	{
		//constructor
		public function Krym()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "Krymhilde";
			this.originalRace = "human";
			this.a = "";
			this.capitalA = "";
			// this.long = "You're fighting a pirate techie, an ausar woman in a flight suit with a machine pistol at her hip. She's got a shock of blonde hair, perky breasts under her suit, and a shield generator that's thrumming with overcharged energy."
			this.long = "The woman standing between you and the warmth of the camp isn’t terribly imposing in her own right, standing shy of six feet and kitted up in snowy armor that hugs her womanly curves almost like a bodysuit, but she’s packing enough weaponry to arm a small colony. Krym is carrying a crackling energy pike in one hand and a hardlight shield in the other, and you can see a laser pistol slung on one of her hips... and something tells you all those turrets and traps around the arena aren’t off-limits to the feisty Lancer.";
			this.customBlock = "Her armor deflects your attack with an alarming ease.";
			this.isPlural = false;
			isLustImmune = false;
	
			//Krym should be an extremely durable enemy - sub-average damage, but huge Defense, Shields, and Evasion combine to make her hard to take down.
			//She’s a Level 9 enemy, with all the class perks of a Tech Specialist, including the flurry Second Shot attack. Wears heavy armor, an Arctic Warfare belt, and a lightning-charged lance and laser machine pistol.
			this.meleeWeapon = new LightningRod();
			this.rangedWeapon = new SecureMP();
			this.rangedWeapon.longName = "laser machine pistol";
			this.rangedWeapon.description = "a laser machine pistol";
			rangedWeapon.hasRandomProperties = true;
			rangedWeapon.baseDamage.burning.damageValue = 4;
			rangedWeapon.baseDamage.electric.damageValue = 1;
			rangedWeapon.baseDamage.kinetic.damageValue = 0;
			rangedWeapon.baseDamage.addFlag(DamageFlag.ENERGY_WEAPON);
			rangedWeapon.baseDamage.removeFlag(DamageFlag.BULLET);

			this.shield = new ArcticWarfareBelt();
			
			this.armor.longName = "heavy armor";
			this.armor.defense = 10;
			this.armor.evasion = 20;
			this.armor.hasRandomProperties = true;
			
			//baseHPResistances.tease.resistanceValue = 0.0;
			this.physiqueRaw = 35;
			this.reflexesRaw = 45;
			this.aimRaw = 38;
			this.intelligenceRaw = 41;
			this.willpowerRaw = 38;
			this.libidoRaw = 20;
			this.shieldsRaw = shieldsMax();
			this.energyRaw = 100;
			this.lustRaw = 25;
			
			this.level = 9;
			this.XPRaw = normalXP();
			this.credits = 0;
			this.HPMod = 0;
			this.HPRaw = this.HPMax();
			
			this.femininity = 90;
			this.eyeType = GLOBAL.TYPE_HUMAN;
			this.eyeColor = "blue";
			this.tallness = 70;
			this.thickness = 60;
			this.tone = 70;
			this.hairColor = "blonde";
			this.scaleColor = "blonde";
			this.furColor = "blonde";
			this.hairLength = 10;
			this.hairType = GLOBAL.TYPE_HUMAN;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_SKIN;
			this.skinTone = "pale";
			this.skinFlags = new Array();
			this.faceType = GLOBAL.TYPE_HUMAN;
			this.faceFlags = new Array();
			this.tongueType = GLOBAL.TYPE_HUMAN;
			this.lipMod = 0;
			this.earType = 0;
			this.antennae = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = GLOBAL.TYPE_HUMAN;
			this.gills = false;
			this.legType = GLOBAL.TYPE_HUMAN;
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
			this.hipRatingRaw = 12;
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
			this.createVagina();
			this.girlCumType = GLOBAL.FLUID_TYPE_GIRLCUM;
			this.vaginalVirgin = false;
			this.vaginas[0].loosenessRaw = 2;
			this.vaginas[0].wetnessRaw = 4;
			this.vaginas[0].bonusCapacity = 10;
			this.vaginas[0].vaginaColor = "pink";
			this.vaginas[0].type = GLOBAL.TYPE_HUMAN;
			//balls
			this.balls = 0;
			this.cumMultiplierRaw = 6;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 3.4;
			this.ballFullness = 100;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 10;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 6;
			this.minutesSinceCum = 2200;
			this.timesCum = 4500;
			
			//Goo is hyper friendly!
			this.elasticity = 1;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1.05;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 3;
			this.nippleColor = "pink";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			
			//createStatusEffect("Flee Disabled", 0, 0, 0, 0, true, "", "", false, 0);
			createPerk("Overcharge", 0, 0, 0, 0, "Overcharged Shot");
			createPerk("Weapon Hack", 0, 0, 0, 0, "Weapon Hack");
			createPerk("Shield Tweaks",0,0,0,0,"Shield Tweaks");
			createPerk("Shield Booster",0,0,0,0,"Shield Booster");
			createPerk("Enhanced Dampeners",0,0,0,0,"Enhanced Dampeners");
			createPerk("Armor Tweaks",0,0,0,0,"Armor Tweaks");
			createPerk("Fight Smarter",0,0,0,0,"Fight Smarter");
			createPerk("Heroic Reserves",0,0,0,0,"Heroic Reserves");
			createPerk("Second Shot",0,0,0,0,"Second Shot");
			this.shieldsRaw = shieldsMax();

			isUniqueInFight = true;
			btnTargetText = "Krym";
			sexualPreferences.setRandomPrefs(4, 2);
			
			_isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			return "KRYM";
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			//Bonus free shield recovery:
			if(this.shields() <= 0 && !this.hasStatusEffect("Shield Regened")) shieldRegen(target);
			//1x: shield recovery:
			if(this.shields()/this.shieldsMax() <= 0.5 && !this.hasStatusEffect("Deflect Regened")) 
			{
				deflectorRegen(target);
				return;
			}
			//Special flying overrides
			if(this.hasStatusEffect("Flying"))
			{
				if(this.isImmobilized()) 
				{
					stunDatJetpackBiyatch(target);
					return;
				}
			}
			var attackChoices:Array = [];
			if(!hasStatusEffect("Flying") && this.energy() >= 25) attackChoices.push(jetPack);
			attackChoices.push(machinePistolBarrage);
			attackChoices.push(lanceCharge);
			if(this.energy() >= 50) 
			{
				attackChoices.push(turretTrap);
			}
			if(this.energy() >= 25) attackChoices.push(chargedStrike);
			if(this.energy() >= 20 && target.defense() > 2) attackChoices.push(sunderingSlice);
			attackChoices.push(cuncussionGrenade);
			attackChoices[rand(attackChoices.length)](target);
		}
		
		//Combat Design/Notes:
		

		//She has a jetpack equipped, basically a toggle on she engages once the player hits her with a melee attack or two. While airborne, she’s immune to melee attacks unless the PC also has a jetpack or wings. Once she’s airborne, the player has to stun her, EMP her, or shoot the jetpack to cause her to crash.

		//She carries an energy buckler, which gives her a significant block chance. EMP disables it, as does her Shields going down. Each time she blocks an attack from an energy weapon, she gains a <i>“charge,”</i> which she’ll use to throw down some of her most powerful abilities.

		//Krym Combat Abilities:
		//Shield Block
		//So long as Krym’s shields are up, she gains a 33% Block chance.
		//Fen note: Not doing this.
		//Krym gets her shield up just in time, taking your {shot / strike} on the shimmering hardlight buckler. {if energy hit: <b>The shield glows brighter 	after you hit her, like it’s overcharged with energy!</b>

		//Deflector Regeneration
		//As per Tech Spec ability. Uses once shields are 50% or below. 1/encounter.
		public function deflectorRegen(target:Creature):void
		{
			output("With a grunt of annoyance, Krym hits a button on her shield belt. It sparks and flickers with light just over her crotch, making her shout something that’s lost in the howl of the wind. She slaps the controls again, and suddenly her shields thrum to life with growing power. They’re charging back up!");
			createStatusEffect("Deflect Regened");
			var amount:Number = Math.ceil((bimboIntelligence() * 1.5 + rand(level) + shieldsMax() * 0.25));
			if (amount + this.shields() > this.shieldsMax()) amount = this.shieldsMax() - this.shields();
			shields(amount);
			output(" (" + amount + ")");
		}
		//Shield Regen (Passive, 1/encounter)
		public function shieldRegen(target:Creature):void
		{
			output("The moment Krym’s shields buckle, sending out a concussive boom across the plateau, a backup battery kicks in. She grins down at you as the glowing barrier resumes around her, surrounding the valkyrie in glistening light.");
			var amount:Number = Math.ceil((bimboIntelligence() * 1.5 + rand(level) + shieldsMax() * 0.25));
			if (amount + this.shields() > this.shieldsMax()) amount = this.shieldsMax() - this.shields();
			createStatusEffect("Shield Regened");
			shields(amount);
			output(" (" + amount + ")\n\n");
		}
		//Jetpack Takeoff
		public function jetPack(target:Creature):void
		{
			this.energy(-25);
			output("Krym kicks off from the ground into a high jump, and the jetpack strapped to her back roars to life, hurtling her up into the air. She hoots and hollers excitedly, swinging her weapon around to steady herself until she stabilizes. Once she does, she grins down at you and couches her lightning lance under her arm. <i>“Come and get some, Steele!”</i> she shouts down, dancing through the air.");
			createStatusEffect("Flying", 0, 0, 0, 0, false, "Icon_Wings", "Flying, cannot be struck by normal melee attacks!", true, 0);
		}
		//Jetpack Crash
		//Any crash landing deals heavy Kinetic damage, bypassing shields.
		//PC EMPs her
		public function empCrashGo(target:Creature):void
		{
			output("When the EMP goes off, her jetpack shuts off with a puttering poot of gasses that leave her flailing in the air. She screams and plummets to the ground, smashing face-first into the snow.");
			jetpackCrashEpilogue(target);
		}
		//PC shoots jetpack with a damage-dealing weapon
		/* Fen note: Fuck this noise.
		public function jetpackShooterGo(target:Creature):void
		{
			output("Your ");
			if(9999) output("shot");
			else output("throw");
			output(" connects, taking a chunk out of the side of Krym’s backpack. A jet of blue flame shoots out of the crack in the material, and then suddenly the valkyrie is screaming and flying wildly, hurtling through the air in spinning arcs until the jetpack cuts out completely, and she goes falling face-first into the snow.");
		}*/
		//PC Stuns her
		public function stunDatJetpackBiyatch(target:Creature):void
		{
			output("Krym stumbles back in the air, kicking her legs wildly as she tries to recover from the stunning strike. Her control over the jetpack she’s riding on slips in the moment, and before you can blink the gout of flames behind her cut out, and Krym goes tumbling into the snow!");
			jetpackCrashEpilogue(target);
		}
		//Combine, new para:
		public function jetpackCrashEpilogue(target:Creature):void
		{
			output("\n\nKrym groans, pulling herself up on her elbows and spitting out a mouthful of snow. <i>“Fuck!”</i> she snarls, struggling up to her feet and leaning heavily on her spear. <i>“Oh, I am going to make you pay for that, Steele!”</i>");
			var damage:TypeCollection = new TypeCollection({kinetic: 25});
			applyDamage(damage, target, this, "minimal");
			this.removeStatusEffect("Flying");
		}
		//Machine Pistol Barrage
		//5 Flurry attacks with her laser pistol. Low damage per hit. Slightly more accurate if her shields are up. Basic ranged attack.
		public function machinePistolBarrage(target:Creature):void
		{
			output("Krym lets her spear hang on its strap and draws a handgun from her belt. A hardlight grip and stock spring to life when she racks the slide on her armor. ");
			if(this.shields() > 0) output("Shield up: She braces the weapon on the top of her shield, steadying it as she takes aim. ");
			output("Krym pulses the trigger once she’s lined up a shot, sending a hail of laser bolts flying your way!");
			for (var i:int = 0; i < 5; i++)
			{
				output("\n");
				CombatAttacks.SingleRangedAttackImpl(this, target, true);
			}
		}
		//Lance Charge
		//Kinetic + Electric damage. Basic melee attack. Deals bonus damage if she’s airborne.
		public function lanceCharge(target:Creature):void
		{
			output("Krym couches her lance under her arm and ");
			if(this.hasStatusEffect("Flying")) output("fires up her jetpack, using it to boost her towards you like a knight on horseback");
			else output("lunges through the snow at you");
			output(". She lets out a fearsome warcry, echoing across the windy plateau. She leaps the last distance, thrusting the shock-charged tip of the weapon right at your chest!");
			//Miss:
			if(combatMiss(this, target)) output(" You leap to the side, tumbling through the snow and letting Krym’s momentum carry her right past you. She kicks off an obsidian pillar, spinning back your way with a wicked glare.");
			else
			{
				output(" You can’t get out of the way in time, and take a massive blow from the lance. She twists it at the last moment, only using the blunted sides to strike you, but the electric charge on the spearhead still zaps you good!");
				var damage:TypeCollection = meleeDamage();
				applyDamage(damageRand(damage, 15), this, target, "minimal");
			}
		}
		//Turret Trap
		//Add a Turret to the battlefield. Has no shields, but decent armor and Health. Shoots an Electric gun at the PC each turn. Activating costs 30 ENG.
		public function turretTrap(target:Creature):void
		{
			this.energy(-50);
			if(!hasStatusEffect("Flying")) output("Running");
			else output("Flying");
			output(" back to put some distance between you, Krym taps a few buttons on her wrist computer. A moment later, you hear a mechanical buzzing from somewhere nearby; you have just enough time to duck behind a pillar of obsidian stone before a bolt of lightning shoots over your head, leaving an acid scent in the air. Glancing over, you can see a small black turret has popped up from where it was hidden under the snow. An electro-gun tracks your movements, discharging stun bolts at you whenever you peek your head out of cover.");
			output("\n\n<i>“Surprise!”</i> Krym laughs, getting cover from you for a moment. <i>“Gotta keep you on your toes, Steele!”</i>");
			var newTurr:GunTurret = new GunTurret();
    		CombatManager.addHostileActor(newTurr);
		}
		//Holographic Projectors
		//Create 2 holographic clones of Krym on the field. They don’t take actions, and go down in one hit, but the <i>“real”</i> Krym is mixed up among them - clones need to mimic her stats. Costs 25 ENG.
		public function holographicProjectors(target:Creature):void
		{
			output("Krym pulls a small, flat black disc out of her belt and hurls it into the snow. You jump back, shielding your eyes as the disc explodes in a cloud of grey gass. When it starts to clear, there’s not one but <b>three identical Krym</b>’s blowing raspberries at you, waving their spears as if to say <i>“come get some.”</i>");
			output("\n\n...Which one’s the real one?");
			//9999
		}
		//Charged Strike
		//Super high damage melee attack. Deals 150% damage +10% per Charge; expends all Charges. Expends half charges on a miss. Costs 25 ENG.
		public function chargedStrike(target:Creature):void
		{
			output("Staring you down with narrowed eyes, Krym slams her spear on her shield, thumping the two together in a rhythmic beat. She advances on you slowly, hammering her weapons together again and again until, with a roar, she pulls them apart in a corona of sparks and lightning. She charges, hurtling at you ");
			if(!hasStatusEffect("Flying")) output("through the snow");
			else output("on the wings of her burning jetpack");
			output(", swinging her lightning spear in a savage overhand blow!");

			if(combatMiss(this, target)) output(" Krym’s strike is slow and predictable, easily dodged. The head of her lance impacts the snow where you’d been standing before, unleashing a shockwave of thunder and lightning that sends snow exploding into the air.");
			else 
			{
				output(" Krym brings her lance down on you hard, slamming into you with bone-shaking force! On contact, the power built up in her erupts in a burst of lightning and a peal of thunder. Every hair stands on end, and a horrible burning smell suffuses the battlefield.");
				var damage:TypeCollection = meleeDamage();
				damage.multiply(2);
				applyDamage(damageRand(damage, 15), this, target, "minimal");
				//output("\n\nWhen the dust clears, Krym’s left panting, grasping her spear in both hands and surrounded by smoke and mist from melted snow. The vibrant glow on her gear has faded, leaving her looking much less radiant - and dangerous - for the moment.");
			}
			this.energy(-25);
		}
		//Concussion Grenade
		//Deals Sonic damage, with a chance to Stagger if the PC fails a Physique Save.
		public function cuncussionGrenade(target:Creature):void
		{
			output("Krym pulls a small black disc off her belt and hurls it at you - or rather, the ground at your [pc.feet]. The object hits the snow and goes <b>BANG</b>, sending snow exploding into the air and hitting you with a shockwave that feels like getting flattened by a kassyran freighter.");
			var damage:TypeCollection = new TypeCollection({kinetic: 12});
			applyDamage(damage, target, this, "minimal");
			if(this.aim()/2 + rand(20) + 1 >= target.physique()/2 + 10 && !target.hasStatusEffect("Staggered"))
			{
				output(" The deafening blast leaves you reeling, trying to catch your balance and failing miserably. You manage to avoid falling over yourself, but the whole world’s still spinning. <b>You’re staggered!</b>");
				target.createStatusEffect("Staggered", 0, 0, 0, 0, false, "Icon_OffDown", (target is PlayerCharacter ? "You are" : (StringUtil.capitalize(target.getCombatName()) + " is")) + " staggered, and " + target.getCombatPronoun("hisher") + " aim and reflexes have been reduced!", true, 0, 0xFF0000);
			}
		}
		//Sundering Slice
		//Single melee attack against foes with armor. Always follows up with either a Lance Charge or Charged Strike, if she has charges available.
		//Costs 2 Charges.
		public function sunderingSlice(target:Creature):void
		{
			this.energy(-20);
			output("Kryn lunges with her spear, but as you twist aside, you realize it was only a feint! ");
			//Miss: 
			if(combatMiss(this, target)) output("You jump back just as the two-pronged head of the bident grabs at your [pc.armor]. It hooks in for a moment, but you’re able to pull yourself free!");
			else 
			{
				output("The two-pronged bident’s head hooks into your [pc.armor] and yanks, discharging electricity through your gear and right into you!");
				var damage:TypeCollection = meleeDamage();
				applyDamage(damageRand(damage, 15), this, target, "minimal");
				if(this.physique()/2 + rand(20) + 1 >= target.reflexes()/2 + 10 && !target.hasStatusEffect("Sundered")) 
				{
					output(" Worse, as you’re yelping in pain, Krym twists her spear-haft and pulls, tearing your [pc.armor] halfway off you! <b>Your armor is sundered!</b>");
					target.createStatusEffect("Sundered", 0, 0, 0, 0, false, "DefenseDown", "Defense is reduced by 50%!", true, 0, 0xFF0000);
				}
			}
		}
	}
}