package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Apparel.AnnosBlouse;
	import classes.Items.Apparel.AnnosCatsuit;
	import classes.Items.Apparel.TSTArmor;
	import classes.Items.Armor.ArmorSteeleSuit;
	import classes.Items.Guns.HammerCarbine;
	import classes.Items.Guns.LaserCarbine;
	import classes.Items.Guns.Goovolver;
	import classes.Items.Guns.ZKRifle;
	import classes.Items.Miscellaneous.AusarTreats;
	import classes.Items.Miscellaneous.EMPGrenade;
	import classes.Items.Miscellaneous.GrayMicrobots;
	import classes.Items.Miscellaneous.ACock;
	import classes.Items.Miscellaneous.AHCock;
	import classes.Items.Miscellaneous.ADCock;
	import classes.Items.Protection.DecentShield;
	
	import classes.Engine.Interfaces.output;
	import classes.Engine.Combat.*;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	
	import classes.kGAMECLASS;
	
	public class Anno extends Creature
	{
		//constructor
		public function Anno()
		{
			this._latestVersion = 14;
			this.version = this._latestVersion;
			this._neverSerialize = false;
			
			// set up with annoShopSetup() in tarkus/anno.as
			inventory = new Array();
			
			this.typesBought[this.typesBought.length] = GLOBAL.ARMOR;
			this.typesBought[this.typesBought.length] = GLOBAL.RANGED_WEAPON;
			this.typesBought[this.typesBought.length] = GLOBAL.SHIELD;
			this.sellMarkup = 1.2;
			this.buyMarkdown = .80;

			this.short = "Anno";
			this.originalRace = "ausar";
			this.a = "";
			this.capitalA = "";
			this.long = "Anno’s crouched just over an arm’s length away, her compact holdout held close at a low-ready as she waits for an opportunity to fire. Her bushy tail is tucked in tight, ears lowered against her head as she moves from cover to cover, ducking around incoming attacks.";
			this.customDodge = "Anno Don’t Dodge Foo";
			this.customBlock = "Obvious placeholder is obvious.";
			this.isPlural = false;
			
			this.meleeWeapon.attackVerb = "punch";
			this.meleeWeapon.attackNoun = "punch";
			this.meleeWeapon.longName = "fist";
			this.meleeWeapon.hasRandomProperties = true;
			
			this.rangedWeapon = new HammerCarbine();
			this.rangedWeapon.longName = "holdout pistol";
			this.rangedWeapon.description = "Anno’s holdout pistol";
			this.rangedWeapon.hasRandomProperties = true;
			
			this.armor.longName = "coat";
			this.armor.defense = 1;
			this.armor.hasRandomProperties = true;
			
			this.physiqueRaw = 8;
			this.reflexesRaw = 10;
			this.aimRaw = 17;
			this.intelligenceRaw = 19;
			this.willpowerRaw = 14;
			this.libidoRaw = 55;
			this.HPMod = 15;
			this.shieldsRaw = this.shieldsMax();
			this.HPRaw = this.HPMax();
			this.energyRaw = 100;
			this.lustRaw = 15;
			this.level = 4;
			this.XPRaw = normalXP();
			this.credits = 0;
			
			this.femininity = 80;
			this.eyeType = 0;
			this.eyeColor = "blue";
			this.tallness = 70;
			this.thickness = 40;
			this.tone = 30;
			this.hairColor = "white";
			this.scaleColor = "ebony";
			this.furColor = "white";
			this.hairLength = 32;
			this.hairType = 0;
			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_SKIN;
			this.skinTone = "pale";
			this.skinFlags = [GLOBAL.FLAG_FLUFFY];
			this.faceType = 0;
			this.faceFlags = new Array();
			this.tongueType = 0;
			this.lipMod = 2;
			this.earType = GLOBAL.TYPE_CANINE;
			this.antennae = 0;
			this.antennaeType = 0;
			this.horns = 0;
			this.hornType = 0;
			this.armType = GLOBAL.TYPE_CANINE;
			this.gills = false;
			this.wingType = 0;
			this.legType = GLOBAL.TYPE_CANINE;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_PLANTIGRADE];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_CANINE;
			this.tailCount = 1;
			this.tailFlags = [GLOBAL.FLAG_FLUFFY];
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
			this.hipRatingRaw = 10;
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
			this.buttRatingRaw = 9;
			//No dicks here!
			this.cocks = new Array();
			//balls
			this.balls = 0;
			this.cumMultiplierRaw = 3;
			//Multiplicative value used for impregnation odds. 0 is infertile. Higher is better.
			this.cumQualityRaw = 1;
			this.cumType = GLOBAL.FLUID_TYPE_CUM;
			this.ballSizeRaw = 2;
			this.ballFullness = 100;
			//How many "normal" orgams worth of jizz your balls can hold.
			this.ballEfficiency = 15;
			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 9991;
			this.minutesSinceCum = 65;
			this.timesCum = 9001;
			this.cockVirgin = false;
			this.vaginalVirgin = false;
			//Goo is hyper friendly!
			this.elasticity = 1.5;
			//Fertility is a % out of 100. 
			this.fertilityRaw = 1.05;
			this.clitLength = .5;
			this.pregnancyMultiplierRaw = 1;
			
			this.breastRows[0].breastRatingRaw = 5;
			this.nippleColor = "pink";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			this.ass.loosenessRaw = 1;
			this.ass.bonusCapacity = 30;
			this.analVirgin = true;
			this.createVagina();
			this.vaginas[0].wetnessRaw = 6;
			this.vaginas[0].loosenessRaw = 1;
			this.vaginas[0].bonusCapacity = 20;
			this.vaginas[0].hymen = false;
			vaginas[0].type = GLOBAL.TYPE_INHUMAN;
			
			isUniqueInFight = true;
			
			shield = new DecentShield();
			this.shieldsRaw = this.shieldsMax();
			this.HPRaw = this.HPMax();
			
			this._isLoading = false;
		}
		
		override public function get bustDisplay():String
		{
			if(kGAMECLASS.annoIsHuskar()) return "ANNO_HUSKAR";
			return "ANNO";
		}
		
		public function UpgradeVersion1(dataObject:Object):void
		{
			dataObject.rangedWeapon = new HammerCarbine().getSaveObject();
		}
		
		public function UpgradeVersion2(dataObject:Object):void
		{
			dataObject.inventory = new Array();
			dataObject.inventory.push(new Goovolver().getSaveObject());
			dataObject.inventory.push(new AusarTreats().getSaveObject());
			
			dataObject.armor = new AnnosCatsuit().getSaveObject();
		}
		
		public function UpgradeVersion3(dataObject:Object):void
		{
			dataObject.inventory = new Array();
			dataObject.inventory.push(new AusarTreats().getSaveObject());
			dataObject.inventory.push(new HammerCarbine().getSaveObject());
			dataObject.inventory.push(new LaserCarbine().getSaveObject());
			dataObject.inventory.push(new EMPGrenade().getSaveObject());
			dataObject.inventory.push(new TSTArmor().getSaveObject());
			dataObject.inventory.push(new Goovolver().getSaveObject());
		}
		public function UpgradeVersion4(dataObject:Object):void
		{
			dataObject.inventory.push(new ACock().getSaveObject());
			dataObject.inventory.push(new AHCock().getSaveObject());
		}
		public function UpgradeVersion5(dataObject:Object):void
		{
			dataObject.inventory.push(new ADCock().getSaveObject());
		}
		public function UpgradeVersion6(dataObject:Object):void
		{
			dataObject.vaginas[0].type = GLOBAL.TYPE_INHUMAN;
		}
		public function UpgradeVersion7(d:Object):void
		{
			delete d.meleeWeapon;
			delete d.armor;
			delete d.bonusResistances;
			delete d.resistances;
			delete d.lustVuln;
			delete d.bonusLustVuln;
		}
		public function UpgradeVersion8(dataObject:Object):void
		{
			dataObject.vaginas[0].hymen = false;
		}
		public function UpgradeVersion9(dataObject:Object):void
		{
			dataObject.tone = 30;
		}
		public function UpgradeVersion10(dataObject:Object):void
		{
			dataObject.rangedWeapon.longName = "holdout pistol";
			dataObject.rangedWeapon.description = "Anno’s holdout pistol";
			dataObject.rangedWeapon.hasRandomProperties = true;
		}
		public function UpgradeVersion11(dataObject:Object):void
		{
			dataObject.skinType = GLOBAL.SKIN_TYPE_SKIN;
		}
		public function UpgradeVersion12(dataObject:Object):void
		{
			dataObject.balls = 0;
		}
		public function UpgradeVersion13(dataObject:Object):void
		{
			dataObject.inventory.push(new ArmorSteeleSuit().getSaveObject());
		}
		public function UpgradeVersion14(dataObject:Object):void
		{
			dataObject.inventory = new Array();
		}
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature;
			var bSneak:Boolean = false;
			
			// More complex target selection to leverage some of Annos abilities
			for (var i:int = 0; i < hostileCreatures.length; i++)
			{
				// skip deadies
				if ((hostileCreatures[i] as Creature).isDefeated()) continue;
				
				if (hostileCreatures[i].hasStatusEffect("Stunned") || hostileCreatures[i].hasStatusEffect("Blinded"))
				{
					target = hostileCreatures[i] as Creature;
					bSneak = true;
				}
				break;
			}
			
			if (target == null) target = selectTarget(hostileCreatures);
			
			// Normally I'd just try and grab this through kGAMECLASS, but I'm doing
			// this as a tester to ensure everything is getting where it needs
			var pc:PlayerCharacter;
			for (i = 0; i < alliedCreatures.length; i++)
			{
				if (alliedCreatures[i] is PlayerCharacter) pc = alliedCreatures[i] as PlayerCharacter;
				break;
			}
			
			if (!hasStatusEffect("Sensor Link Cooldown") && rand(4) == 0) sensorLinkBuff(target, pc);
			else if (pc.HP() / pc.HPMax() <= 0.5 && !hasStatusEffect("HP Boost Cooldown"))
			{
				hpBooster(pc);
			}
			else if (bSneak && !hasStatusEffect("Disarmed"))
			{
				var bonusDamage:int = level * 2;
				if (target.hasStatusEffect("Blinded") && target.hasStatusEffect("Stunned")) bonusDamage += level;
				
				regularAttack(bonusDamage, target);
			}
			else if(!hasStatusEffect("Disarmed"))
			{
				regularAttack(0, target);
			}
			else annoNoAction();
		}
		
		public function grappleStruggle(sEnemy:String):Boolean
		{
			if (sEnemy == "gray prime" && CombatManager.hasEnemyOfClass(GrayPrime))
			{
				var chance:int = statusEffectv1("Grappled");
				
				output("Anno struggles against the gray goo’s assault, trying to escape her death-grasp.");
					
				if (rand(3) <= chance)
				{
					// Slip a cooldown on the hostile
					var hostiles:Array = CombatManager.getHostileActors();
					var gPrime:GrayPrime = hostiles[0];
					gPrime.createStatusEffect("Grapple Cooldown", 3);
					
					removeStatusEffect("Grappled");
					output(" Anno finally brings her gun to bear and fires, pumping her entire magazine into the goo’s tits. The gray body explodes in a rain of goop, only to reform a moment later across the room as Anno slams a new mag into her holdout. <i>“I’m fine, I’m fine!”</i> Anno groans, rubbing at her throat, now visibly bruising.");
				}
				else
				{
					addStatusValue("Grappled", 1, 1);
				}
				//output("\n");
				return true;
			}
			return false;
		}
		
		private function sensorLinkBuff(target:Creature, pc:Creature):void
		{
			output("Anno levels her left wrist at");
			if (CombatManager.multipleEnemies()) output(" one of");
			else output(" the");
			output(" " + target.short + " and taps a key on her tiny computer. A visible targeting reticle forms around your opponent");
			if (CombatManager.multipleEnemies()) output("s");
			output(", linking up with your own equipment in the process.\n<b>Accuracy increased!</b>");
			
			createStatusEffect("Sensor Link Cooldown", 5, 0, 0, 0, true, "", "", true, 0);
			pc.createStatusEffect("Sensor Link", 5, 0, 0, 0, false, "Radio", "Anno has linked her equipment’s targeting systems with yours, improving your combat accuracy.", true, 0);
			pc.aimMod += 5;
		}
		
		private function hpBooster(target:Creature):void
		{
			var hpGained:int = target.HPMax() * 0.1;
			output("Anno runs up to you and passes her wrist computer over your shoulder, uploading an advanced program to your onboard microsurgeons. Your wounds start to knit together in no time! <b>Gained " + hpGained + " health!</b>");

			target.HP(hpGained);

			createStatusEffect("HP Boost Cooldown", 5, 0, 0, 0, true, "", "", true, 0);
		}
		
		private function regularAttack(bonusDamage:int, target:Creature):void
		{
			output("Anno levels her holdout pistol and fires off a quick shot");

			if (rangedCombatMiss(this, target)) output(", though she misses her target.");
			else
			{
				output(", landing a solid hit");
				if (CombatManager.hasEnemyOfClass(GrayPrime) || CombatManager.hasEnemyOfClass(GigaGoo)) output(" on the goo");
				else output(" on " + target.a + target.uniqueName);
				output("!");

				if (bonusDamage > 0) output(" Her attack is super-effective while her target is incapacitated!");

				var damage:TypeCollection = rangedDamage();
				damage.add(bonusDamage);
				applyDamage(damage, this, target, "minimal");
			}
		}
		
		private function annoNoAction():void
		{
			output("Anno attempts to get a hold of her holdout pistol as the battle ensues but is unsuccessful.");
		}
		
		override public function onLeaveBuyMenu():void
		{
			if (!kGAMECLASS.annoIsCrew()) kGAMECLASS.repeatAnnoApproach();
			else kGAMECLASS.annoFollowerApproach();
		}
	}
}
