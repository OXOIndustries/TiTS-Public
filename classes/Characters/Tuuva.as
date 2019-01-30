package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Melee.SaviciteLightMaul;
	import classes.Items.Melee.MasterworkYappiStrap;
	import classes.Items.Guns.KorgGreatBow;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.Engine.Combat.*;
	import classes.Engine.Combat.DamageTypes.DamageResult;
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	import classes.Engine.Interfaces.output;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	
	public class Tuuva extends Creature
	{
		//constructor
		public function Tuuva()
		{
			this._latestVersion = 2;
			this.version = _latestVersion;
			this._neverSerialize = false;
			fluidSimulate = false;
			statusSimulate = false;
			this.short = "Tuuva";
			originalRace = "korgonne";
			this.a = "";
			this.capitalA = "";
			this.long = "Tuuva stands proud next to you in her hefty plate-mail, excitedly raising her massive hammer, ready to strike.";
			this.customDodge = "Tuuva scampers out of the way!";
			this.isPlural = false;
			
			keeperBuy = "";
			keeperSell = "";
			
			inventory.push(new SaviciteLightMaul());
			inventory.push(new MasterworkYappiStrap());
			inventory.push(new KorgGreatBow());

			this.typesBought = [GLOBAL.MELEE_WEAPON,GLOBAL.RANGED_WEAPON,GLOBAL.ARMOR];
			
			this.sellMarkup = 1.0;
			this.buyMarkdown = .25;

			this.meleeWeapon.attackVerb = "swing";
			this.meleeWeapon.longName = "hammer";
			this.meleeWeapon.description = "a massive hammer";
			this.meleeWeapon.attackNoun = "hammerstrike";
			this.meleeWeapon.baseDamage.kinetic.damageValue = 10;
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

			this.physiqueRaw = 36;
			this.reflexesRaw = 15;
			this.aimRaw = 24;
			this.intelligenceRaw = 22;
			this.willpowerRaw = 26;
			this.libidoRaw = 80;
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 10;
			
			this.level = 6;
			this.XPRaw = normalXP();
			//Credits set below.
			this.credits = 100;
			this.HPMod = 15;
			this.HPRaw = this.HPMax();
			this.shieldsRaw = this.shieldsMax();

			this.femininity = 85;
			this.eyeType = GLOBAL.TYPE_KORGONNE;
			this.eyeColor = "hazel";
			this.tallness = 59;
			this.thickness = 65;
			this.tone = 50;
			this.hairColor = "blonde";
			this.hairType = GLOBAL.HAIR_TYPE_HAIR;
			this.scaleColor = "blue";
			this.furColor = "brown";
			this.hairLength = 2;

			this.beardLength = 0;
			this.beardStyle = 0;
			this.skinType = GLOBAL.SKIN_TYPE_FUR;
			this.skinTone = "white";
			this.skinFlags = new Array();
			this.faceType = GLOBAL.TYPE_KORGONNE;
			this.faceFlags = [GLOBAL.FLAG_MUZZLED, GLOBAL.FLAG_FURRED];
			this.tongueType = GLOBAL.TYPE_CANINE;
			this.lipMod = 0;
			this.earType = GLOBAL.TYPE_KORGONNE;
			this.antennae = 0;
			this.antennaeType = GLOBAL.TYPE_HUMAN;
			this.horns = 0;
			this.hornType = 0;
			this.armType = GLOBAL.TYPE_KORGONNE;
			this.armFlags = [GLOBAL.FLAG_FURRED, GLOBAL.FLAG_PAWS, GLOBAL.FLAG_FURRED];
			this.gills = false;
			this.wingType = GLOBAL.TYPE_HUMAN;
			this.legType = GLOBAL.TYPE_KORGONNE;
			this.legCount = 2;
			this.legFlags = [GLOBAL.FLAG_DIGITIGRADE, GLOBAL.FLAG_PAWS, GLOBAL.FLAG_FURRED];
			//0 - Waist
			//1 - Middle of a long tail. Defaults to waist on bipeds.
			//2 - Between last legs or at end of long tail.
			//3 - On underside of a tail, used for driders and the like, maybe?
			this.genitalSpot = 0;
			this.tailType = GLOBAL.TYPE_KORGONNE;
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

			this.vaginas = new Array();
			this.createVagina();
			this.vaginas[0].type = GLOBAL.TYPE_CANINE;
			this.vaginas[0].hymen = false;
			this.vaginas[0].wetnessRaw = 2;
			this.vaginas[0].loosenessRaw = 2;
			this.vaginas[0].vaginaColor = "black";
			this.vaginas[0].vagooFlags = [];

			this.cocks = new Array();
			this.createCock();
			this.shiftCock(0,GLOBAL.TYPE_CANINE);
			this.cocks[0].cLengthRaw = 8;
			this.cocks[0].cockColor = "black";
			this.balls = 2;
			this.ballSizeRaw = 5;
			this.cumMultiplierRaw = 20;
			this.ballEfficiency = 60;

			//Scales from 0 (never produce more) to infinity.
			this.refractoryRate = 9991;
			this.minutesSinceCum = 25;
			this.timesCum = 2508;
			this.cockVirgin = false;
			this.vaginalVirgin = false;
			this.analVirgin = false;
			this.elasticity = 1.5;

			this.breastRows[0].breastRatingRaw = 13;
			this.nippleColor = "black";
			this.milkMultiplier = 0;
			this.milkType = GLOBAL.FLUID_TYPE_MILK;
			//The rate at which you produce milk. Scales from 0 to INFINITY.
			this.milkRate = 0;
			this.ass.wetnessRaw = 0;
			this.ass.bonusCapacity += 15;
			
			isUniqueInFight = true;
			btnTargetText = "Tuuva";
			
			this._isLoading = false;
		}
		override public function get bustDisplay():String
		{
			return kGAMECLASS.tuuvaBustString();
		}
		public function descUpdate():void
		{
			if(this.HP()/this.HPMax() > .7) output("Tuuva stands proud next to you in her hefty plate-mail, excitedly raising her massive hammer, ready to strike.");
			else if(this.HP()/this.HPMax() > .33) output("Tuuva looks battered, but not nearly out of this yet.");
			else output("Tuuva is on her last legs, but she's holding in there, ready to give her all!");
		}
		override public function downedViaLust():String
		{
			return "<b>Tuuva is down for the count, offering herself up for whatever lewd ideas [enemy.combatName] has to offer.</b>";
		}
		override public function downedViaHP():String
		{
			return "<b>Tuuva is down for the count, trying and failing to drag herself back up to her feet.</b>";
		}
		override public function CombatAI(alliedCreatures:Array, hostileCreatures:Array):void
		{
			var target:Creature;
			if (target == null) target = selectTarget(hostileCreatures);
			//AI
			//Uses Power Strike on first turn, and has a chance to use it every turn after if the enemy is above 50% HP.
			//If the enemy is below 50% HP, she has a chance to use Go for the Knees! (Fen note: Cut this.)
			//Otherwise will use Basic Attack.
			if(CombatManager.getRoundCount() == 1) tuuvaPowerStroke(target);
			else if(rand(3) == 0 && this.energy() >= 25) tuuvaPowerStroke(target);
			else tuuvaBasicAttk(target);
		}
		//Basic Attack
		public function tuuvaBasicAttk(target:Creature):void
		{
			output("Tuuva hoists her hammer up high and charges directly at " + target.getCombatName() + "!");
			if(!combatMiss(this, target))
			{
				output(" Her hammer blow strikes true!");
				var damage:TypeCollection = meleeDamage();
				applyDamage(damageRand(damage, 15), this, target,"minimal");
			}
			else output(" " + target.mfn("He","She","It") + " ducks out of the way of her swing, moving back to safety as Tuuva recovers.");
		}
		//Power Strike
		public function tuuvaPowerStroke(target:Creature):void
		{
			this.energy(-25);
			//high damage, lower accuracy, chance to stun.
			output("Tuuva takes a deep breath, steadies herself, and charges " + target.getCombatName() + " with everything she has!");
			if(!combatMiss(this, target))
			{
				output(" She hops up n the air with surprising strength and delivers a good, hard, leaping blow!");
				var damage:TypeCollection = meleeDamage();
				damage.multiply(2);
				applyDamage(damageRand(damage, 15), this, target,"minimal");
			}
			else output(" She hops into the air to try and deliver a leaping strike, but " + target.getCombatName() + " rolls out of the way, letting the ferocious korg impact the ground with a mighty shake.");
		}
		public function UpgradeVersion1(dataObject:Object):void
		{
			if(dataObject.cocks.length > 0 && dataObject.cocks[0].cType == GLOBAL.TYPE_EQUINE)
			{
				dataObject.cocks[0].cLengthRaw = 16;
			}
		}
		override public function onLeaveBuyMenu():void
		{
			kGAMECLASS.approachTuuva();
		}
	}
}