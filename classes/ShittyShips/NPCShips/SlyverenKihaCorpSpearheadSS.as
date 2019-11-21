package classes.ShittyShips.NPCShips
{
	import classes.Creature;
	import classes.ShittyShip;
	import classes.GLOBAL;
	import classes.Items.Protection.NovaShield;
	import classes.Items.Miscellaneous.EmptySlot;
	import classes.ShittyShips.ShittyShipGear.Guns.LCannon;
	import classes.ShittyShips.ShittyShipGear.Guns.CoilCannon;
	import classes.ShittyShips.ShittyShipGear.Guns.EMCannon;
	import classes.ShittyShips.ShittyShipGear.Misc.ShipArmor;
	import classes.ShittyShips.ShittyShipGear.Misc.ShipShield;
	import classes.ShittyShips.ShittyShipGear.Gadgets.ShieldDisruptor;
	import classes.ShittyShips.ShittyShipGear.Gadgets.ShieldBoosterForShips;
	import classes.ShittyShips.ShittyShipGear.Gadgets.RepairModule;
	import classes.ShittyShips.ShittyShipGear.Gadgets.StealthFieldForShips;
	import classes.ShittyShips.ShittyShipGear.Upgrades.SensorSuite;
	import classes.ShittyShips.ShittyShipGear.Upgrades.HeavyArmor;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.GameData.CodexManager;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Engine.Combat.*;
	import classes.Engine.Interfaces.output;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	
	public class SlyverenKihaCorpSpearheadSS extends ShittyShip
	{
		//constructor
		public function SlyverenKihaCorpSpearheadSS()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = false;
			
			this.short = "Star Viper Spearhead SS";
			this.originalRace = "ship";
			this.shieldDisplayName = "SHIELDS";
			this.hpDisplayName = "ARMOR";
			this.captainDisplay = "UNKNOWN";
			this.modelDisplay = "KIHACORP";
			this.factionDisplay = "UNKNOWN";

			wardrobeSizeRaw = 20;
			equipmentSizeRaw = 20;
			consumableSizeRaw = 20;
			valuablesSizeRaw = 20;
			toysSizeRaw = 20;

			shipCapacityRaw = 6;
			shipGunCapacityRaw = 4;

			this.a = "the ";
			this.capitalA = "The ";
			this.long = "The KihaCorp Spearhead is a Terran-designed ship intended for planetary exploration and scout missions. The Spearhead houses four large but powerful XFold engines whose unique design allows for unparalleled maneuverability both in space and in atmosphere. Modern XFolds have low fuel consumption and run quieter than any other engines in their class.";
			this.customBlock = "<b>Placeholder</b>.";
			this.customDodge = "It’s too evasive!";
			this.isPlural = false;

			//this.meleeWeapon.attack = 2;
			this.meleeWeapon = new LCannon();
			this.rangedWeapon = new CoilCannon();
			this.accessory = new EMCannon();

			this.armor = new ShipArmor();
			this.armor.defense = 15;
			this.armor.hasRandomProperties = true;

			this.inventory = [new SensorSuite(), new StealthFieldForShips(), new HeavyArmor(), new HeavyArmor()];
						
			this.shield = new ShipShield();
			this.shield.shieldDefense = 20;
			this.shield.shields = 2000;
			this.shield.hasRandomProperties = true;

			this.HPMod = 4500;

			//SPEED / THRUST
			this.physiqueRaw = 35;
			//AGILITY:
			this.reflexesRaw = 35;
			//SENSORS
			this.aimRaw = 25;
			//SYSTEMS
			this.intelligenceRaw = 35;
			//POWER GEN
			this.willpowerRaw = 50;

			//UNUSED
			this.libidoRaw = 50;

			//Raw stat start
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 0;

			//(Handled via armor)
			//baseHPResistances = new TypeCollection();
			
			this.level = 7;
			this.XPRaw = normalXP();
			this.credits = 3500+rand(1000);

			/*
			this.createStatusEffect("Flee Disabled", 0, 0, 0, 0, true, "", "", false, 0);
			this.createPerk("Tough 2",0,0,0,0);
			this.createPerk("Juggernaut",0,0,0,0);
			this.createPerk("Iron Will",0,0,0,0);
			this.createPerk("Single Minded",0,0,0,0);
			*/
			//this.createPerk("PCs",0,0,0,0);
			this.HPRaw = this.HPMax();
			this.shieldsRaw = this.shieldsMax();
			this.energyRaw = this.energyMax();

			isUniqueInFight = true;
			btnTargetText = "S.SS";
			this.createPerk("TACTICAL_AI");			

			//kGAMECLASS.tarkusSSTDChance(this);
			this._isLoading = false;
		}
		override public function energyMax(): Number {
			return 250;
		}
		override public function get bustDisplay():String
		{
			return "SPEARHEAD_SS";
		}
	}
}