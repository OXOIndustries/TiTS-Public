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
	import classes.Items.Upgrades.HardLightUpgrade;
	import classes.Items.Transformatives.KorgonneSnacks;


	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.GameData.CodexManager;
	import classes.Engine.Combat.DamageTypes.*;
	
	import classes.Engine.Interfaces.output;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CodexManager;
	import classes.Engine.Combat.*;
	
	public class KorgonneFemale extends Creature
	{
		//constructor
		public function KorgonneFemale()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "female korgonne barbarian";
			this.originalRace = "korgonne";
			this.a = "the ";
			this.capitalA = "The ";
			this.long = "The short, plump canid is outfitted with an eclectic assortment of arms, some clearly forged by her people, others presumably scavenged from invading off-worlders. The faint crackle of a simple shield sizzles the billowing snow around her while the savage hefts a spear tipped with black, glossy stone in one hand. In the other, she wields a foot-long, thickly-braided strap. Her coat bulges with shallow pockets, the shape of various firearms sticking out at odd angles. Her eyes flare with viridian recklessness, but her too-calm movements remind you more of an arctic wolf circling its prey.";
			this.customDodge = "She lunges forward under your attack, surprisingly agile for such a stocky pup! Inches from your face, she holds you in the thrall of her deformed pupils; her teal tongue licking the tip of her turquoise nose before she rolls to one side.";
			this.isPlural = false;

			this.meleeWeapon.attackVerb = "whack";
			this.meleeWeapon.longName = "yappi strap";
			this.meleeWeapon.attackNoun = "smack";
			this.meleeWeapon.hasRandomProperties = true;
				
			baseHPResistances = new TypeCollection();
			baseHPResistances.freezing.damageValue = 90.0;
			baseHPResistances.tease.damageValue = 35.0;
			baseHPResistances.drug.damageValue = 50.0;
			baseHPResistances.pheromone.damageValue = -30.0;
			baseHPResistances.burning.damageValue = -25.0;

			//armorbutt
			this.armor.longName = "fur-padded hides";
			this.armor.defense = 2;
			this.armor.hasRandomProperties = true;
			
			//wat shield - randomized below.
			//this.shield = new ImprovisedShield();

			this.physiqueRaw = 25;
			this.reflexesRaw = 28;
			this.aimRaw = 21;
			this.intelligenceRaw = 18;
			this.willpowerRaw = 31;
			this.libidoRaw = 80;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 10;
			
			this.level = 7;
			this.XPRaw = normalXP();
			//Credits set below.
			this.credits = 100;
			this.HPMod = 15;
			this.HPRaw = this.HPMax();
			this.shieldsRaw = this.shieldsMax();

			this.femininity = 85;
			this.eyeType = GLOBAL.TYPE_KORGONNE;
			this.eyeColor = "violet";
			this.tallness = 58;
			this.thickness = 65;
			this.tone = 32;
			this.hairColor = "dirty blonde";
			this.hairType = GLOBAL.TYPE_RASKVEL;
			this.scaleColor = "blue";;
			this.furColor = "tan";
			this.hairLength = 14;
			
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
			this.createVagina();
			this.girlCumType = GLOBAL.FLUID_TYPE_GIRLCUM;
			this.vaginalVirgin = false;
			//Vaginal looseness and wetness set by randomizer function
			this.vaginas[0].type = GLOBAL.TYPE_CANINE;
			this.vaginas[0].clits = 1;
			this.vaginas[0].vaginaColor = "cerulean";
			//balls
			this.balls = 0;
			this.cumMultiplierRaw = 6;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 0;
			this.ballFullness = 1;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 10;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 6;
			this.minutesSinceCum = 420;
			this.timesCum = 3890;

			this.elasticity = 2;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1.05;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;

			this.breastRows[0].breastRatingRaw = 0;
			this.nippleColor = "cerulean";
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
			return "KORGONNE_FEMALE";
		}
		
		private function randomise():void
		{
			//"Hard" level preferences.
			sexualPreferences.setRandomPrefs(4 + rand(3),2);
			//Bigdick replaces normal dick love
			if(kGAMECLASS.flags["KORGI_BIG_DICKED"] != undefined)
			{
				sexualPreferences.removePref(GLOBAL.SEXPREF_COCKS);
				sexualPreferences.removePref(GLOBAL.SEXPREF_HYPER);
				sexualPreferences.setPref(GLOBAL.SEXPREF_COCKS, GLOBAL.KINDA_LIKES_SEXPREF);
				sexualPreferences.setPref(GLOBAL.SEXPREF_HYPER, GLOBAL.KINDA_DISLIKES_SEXPREF);
			}
			else
			{
				sexualPreferences.removePref(GLOBAL.SEXPREF_HYPER);
				sexualPreferences.removePref(GLOBAL.SEXPREF_COCKS);
				sexualPreferences.setPref(GLOBAL.SEXPREF_HYPER, GLOBAL.REALLY_LIKES_SEXPREF);
				sexualPreferences.setPref(GLOBAL.SEXPREF_COCKS, GLOBAL.KINDA_LIKES_SEXPREF);
			}
			
			//Pick a shield generator
			if(rand(4) == 0) this.shield = new ImprovisedShield();
			else if(rand(3) == 0) this.shield = new ArcticWarfareBelt();
			else if(rand(2) == 0) this.shield = new JoyCoPremiumShield();
			else this.shield = new SalamanderShield();
			shieldsRaw = shieldsMax();

			ass.loosenessRaw = rand(4) + 1;
			vaginas[0].loosenessRaw = rand(4) + 1;
			vaginas[0].wetnessRaw = 2 +rand(4);
			credits = 200+rand(100);

			//5% chance to drop shield generator
			if(rand(20) == 0) inventory.push(shield.makeCopy());
			//5% chance of yappstrapp
			if(rand(20) == 0) inventory.push(new YappiStrap());
			//5% chance of InsulatedCoat
			if(rand(20) == 0) inventory.push(new InsulatedCoat());
			//Temporarily put on these snowbitches till I find a real home for it.
			if(!kGAMECLASS.pc.hasHardLightUpgraded() && rand(10) == 0) inventory.push(new HardLightUpgrade());
			if(rand(4) == 0 && inventory.length == 0) inventory.push(new KorgonneSnacks());
			/*
			if (rand(10) == 0)
			{
				inventory.push(new RaskvelWrench());
			}
			else if(rand(8) <= 6) inventory.push(new Ruskvel());*/
		}
		
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature = selectTarget(hostileCreatures);
			if (target == null) return;
			
			if(hasStatusEffect("Disarmed"))
			{
				korgiPounce(target);
			}
			//Snow Blindness
			else if(!hasStatusEffect("Korgi Blind Used") && rand(7) == 0) korSnowBlind(target);
			//Rage
			else if(!hasStatusEffect("Raging") && HP()/HPMax() < 0.5 && rand(2) == 0) korgiRage();
			//Heavy Gun
			else if(statusEffectv1("Heavy Gun") < 3 && rand(3) == 0) heavyGunForKorgi(target);
			else if(rand(3) == 0) blackrockSpearAttack(target);
			else if(rand(3) == 0) korgiPounce(target);
			else yappiStrapAttack(target);
		}
		
		//Rage
		//May only be used at 50% health or lower. Lasts until the end of battle. Combat effect may be to increase her accuracy and/or increase the damage she does on a successful hit. Defense effects may be to reduce her block/dodge to zero but reduce the damage she takes from successful attacks or taunts.
		public function korgiRage():void
		{
			output("The barbarian girl snaps her teeth in the icy air, her nose and lips flushing to a deep indigo. Her dense fur stands on end, and her curled tail practically vibrates in place. Her hackles up, the savage’s horizontally slitted pupils dilate to nearly swallow her irises entirely. Frothy, foaming saliva leaks from her open mouth, and her long tongue hangs as if forgotten from the side.");
			if(kGAMECLASS.silly) output(" <i>“Many fierce!”</i> she barks. <i>“Am rage! Wow so scare.”</i>");
			long = "The short, plump canid is outfitted with an eclectic assortment of arms, some clearly forged by her people, others presumably scavenged from invading off-worlders. The faint crackle of a simple shield sizzles the billowing snow around her while the savage hefts a spear tipped with black, glossy stone in one hand. In the other, she wields a and a foot-long, thickly-braided strap. Her coat bulges with shallow pockets, the shape of various firearms sticking out at odd angles. Her eyes flare with viridian recklessness.\n\nThe barbarian’s chest rises and falls with the carnal lust for battle overtaking her. Hot breath steams between clenched teeth, saliva leaking down the sides of her mouth.";
			reflexesRaw += 20;
			physiqueRaw += 20;
			willpowerRaw = 1;
			baseHPResistances.kinetic.damageValue = -25.0;
			baseHPResistances.tease.damageValue = 10.0;
			baseHPResistances.drug.damageValue = 70.0;
			baseHPResistances.pheromone.damageValue = -50.0;
			baseHPResistances.burning.damageValue = -100.0;
			createStatusEffect("Raging",0,0,0,0,false,"Icon_OffUp","Dropped all pretense of defense to go on an all-out offensive!",true);
		}
		//Snow Blindness
		//(one use) - createStatusEffect("Korgi Blind Used");
		public function korSnowBlind(target:Creature):void
		{
			output("Grabbing an armful of snow, the native throws an icy sheet of glittering dust at your face. You shield yourself from the childish attack and glance back just in time to see her fish a scavenged Giga Lantern from one of pockets. Her strange pupils narrow to horizontal slits as she squeezes the hand-held flash bulb!");
			if(reflexes() + rand(20) + 1 < target.reflexes() + 10 || target.hasBlindImmunity())
			{
				output("\n\nYou turn away");
				if(!target.hasBlindImmunity()) output(", hands clasped over your eyes");
				output(" as the overcharged light bursts in a blinding flare and sears white afterimages into your eyes");
				if(target.hasBlindImmunity()) output(" -- though to little effect");
				output(". You blink the ghostly after image away and turn back to the barbarian, who drops the burnt-out device with a curse, shaking her singed paw.");
			}
			else
			{
				output("\n\nYou try to close your eyes, but it’s not enough. The flare turns the reflective snow all around you into diamond-sharp luminance that feels like it’s cauterizing your eyes. Your head reels, a slight ringing in your ears as you blink rapidly, unable to clear the white emptiness that fills your sight. <b>You have been blinded!</b>");
				//(Inflicts the “Blindness” status)
				CombatAttacks.applyBlind(target, rand(3) + 1);
			}
			createStatusEffect("Korgi Blind Used");
		}
		//Pounce
		public function korgiPounce(target:Creature):void
		{
			//(First time)
			if(!hasStatusEffect("Korgi Pounce"))
			{
				output("Crouching low, the furred woman shifts her weight from one leg to the other and springs! She chucks her spear and you dodge to one side, realizing too late that the throw was a feint. She launches herself directly at where you’ve dodged, her substantial frame hurtling toward you in an attempt to body slam you into the snow and ice!");
				//(deals kinetic + cold damage, may cause knock down)
				createStatusEffect("Korgi Pounce");
			}
			//(Repeat)
			else
			{
				output("The savage launches herself at you, attempting to drag you to the ground once more!");
				if(kGAMECLASS.korgiSillyTranslate())
				{
					if(kGAMECLASS.silly) output(" <i>“Very brr! Such frolic!”</i>");
				}
			}
			if(combatMiss(this, target))
			{
				output("\nYou barely manage to twist to the side, evading her.");
			}
			else
			{
				output("\nYou can’t quite get out of the way, and in a flash of fur and ice, you’re left cold and smarting from the hit.")
				var damage:TypeCollection = new TypeCollection( { kinetic: (physique()-5), freezing: 10 } );
				damageRand(damage, 15);
				applyDamage(damage, this, target);
				if(!target.hasStatusEffect("Tripped") && !target.isPlanted() && target.reflexes() + rand(20) + 1 < 35)
				{
					CombatAttacks.applyTrip(target);
					output("\nWorst of all, <b>You’re stuck in the snow for the moment, tripped up.</b>");
				}
			}
		}
		//Heavy Gun
		public function heavyGunForKorgi(target:Creature):void
		{
			//(three uses) - statusEffectv1("Heavy Gun") < 3
			output("Fishing one of the guns from her pocket, the barbarian struggles with the device for a minute before gripping it properly, pointing the armament in your direction. She jerks the trigger and to her shock, loses control of the gun as it discharges its magazine in rapid succession. Before she can adjust her aim, she’s emptied it entirely.");
			if(kGAMECLASS.korgiSillyTranslate())
			{
				if(!kGAMECLASS.silly) output(" <i>“Dumb, tiny darts! You too fast!”</i>");
				else output(" <i>“So zip! Very recoil. Wow! Much junk!”</i>");
				output(" Annoyed, she hauls back and pitches the heavy, metal piece at your head!");
				//(deals kinetic damage and chance to stun)
				if(rangedCombatMiss(this, target)) output(" The gun flies wide!");
				else
				{
					output("\nIt flies true, striking you on the noggin.")
					var damage:TypeCollection = new TypeCollection( { kinetic: (aim() + physique()/3) });
					damageRand(damage, 15);
					applyDamage(damage, this, target);
					if (!target.hasStatusEffect("Stunned") && target.physique() + rand(20) + 1 < physique() + 4)
					{
						CombatAttacks.applyStun(target, 1);
						output("\n<b>The blow leaves you stunned and reeling.</b>");
					}
				}
			}
			if(hasStatusEffect("Heavy Gun")) createStatusEffect("Heavy Gun",1);
			else addStatusValue("Heavy Gun",1,1);
		}
		//Blackrock Spear
		private function blackrockSpearAttack(target:Creature):void
		{
			output("Twirling the spear, the savage closes the distance with a swift, striding gait. The blackrock blade glints like a razor’s edge as she launches into a flurry of thrusts!\n");
			//(attacks 3-6 times for kinetic damage, higher accuracy/damage vs. prone targets)
			var limit:int = 3 + rand(4);
			for (var i:int = 0; i < limit; i++)
			{
				CombatAttacks.SingleMeleeAttackImpl(this, target, true);
				//No new space on the last line.
				if(i != limit - 1) output("\n");
			}
		}
		//Yappi Strap
		private function yappiStrapAttack(target:Creature):void
		{
			var damage:TypeCollection
			//(First time per battle)
			if(!this.hasStatusEffect("Yappi Strappy"))
			{
				output("The heavy, braided leather strap in the girl’s off hand swings back and forth, thongs of tanned hide dangling from its bulbous end. She dodges in close, keeping your attention with her spear while she twirls and whips the woven weapon at you. Throwing up your [pc.meleeWeapon] in a quick block, you’re nearly jerked off your feet from the impact! The bulb at the end must hold a metal ball, because the contact leaves your arm aching. She swings the bludgeon up and around for another strike!");
				//(deals kinetic damage)
				damage = new TypeCollection( { kinetic: (physique()-8) });
				damageRand(damage, 15);
				applyDamage(damage, this, target);
				createStatusEffect("Yappi Strappy");
			}
			//(Repeat)
			else
			{
				output("She comes in close with her strap once more, whipping the rib-cracking bulb and flesh-peeling thongs through the air!");
				//(may cause staggered condition condition)
				//Hit
				if(!combatMiss(this, target))
				{
					damage = new TypeCollection( { kinetic: (physique()+5) });
					damageRand(damage, 15);
					applyDamage(damage, this, target);
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
	}
}