package classes.ShittyShips
{
	import classes.Creature;
	import classes.ShittyShip;
	import classes.GLOBAL;
	import classes.Items.Protection.NovaShield;
	import classes.Items.Miscellaneous.EmptySlot;
	import classes.ShittyShips.ShittyShipGear.GunTurrets.MissileTurret;
	import classes.ShittyShips.ShittyShipGear.Guns.EMCannon;
	import classes.ShittyShips.ShittyShipGear.Misc.ShipArmor;
	import classes.ShittyShips.ShittyShipGear.Misc.ShipShield;
	import classes.ShittyShips.ShittyShipGear.Gadgets.ShieldDisruptor;
	import classes.ShittyShips.ShittyShipGear.Gadgets.ShieldBoosterForShips;
	import classes.ShittyShips.ShittyShipGear.Gadgets.RepairModule;
	import classes.ShittyShips.ShittyShipGear.Upgrades.HeavyArmor;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.GameData.CodexManager;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Engine.Combat.*;
	import classes.Engine.Interfaces.output;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	
	public class Sidewinder extends ShittyShip
	{
		//constructor
		public function Sidewinder()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = false;
			
			this.short = "Sidewinder";
			this.originalRace = "ship";
			this.shieldDisplayName = "SHIELDS";
			this.hpDisplayName = "ARMOR";
			this.captainDisplay = "UNKNOWN";
			this.modelDisplay = "Z.SHI";
			this.factionDisplay = "UNKNOWN";

			wardrobeSizeRaw = 30;
			equipmentSizeRaw = 30;
			consumableSizeRaw = 30;
			valuablesSizeRaw = 30;
			toysSizeRaw = 30;

			shipCapacityRaw = 10;
			shipGunCapacityRaw = 3;

			this.a = "the ";
			this.capitalA = "The ";
			this.long = "The <i>Sidewinder</i> is the culmination of months of work by a coalition of Zheng Shi's pirate gangs. It is a ship built to travel at extreme speeds - to blow through blockades and leave pursuit lost in the space-dust. With its main drive engines accounting for more than half the ship's mass, it has much less interior space than vessels of similar size, but she's got it where it counts.";
			this.customBlock = "<b>Placeholder</b>.";
			this.customDodge = "It’s too evasive!";
			this.isPlural = false;

			//this.meleeWeapon.attack = 2;
			//this.meleeWeapon = new MissileTurret();
			//this.rangedWeapon = new EMCannon();
			this.accessory = new HeavyArmor();

			this.armor = new ShipArmor();
			this.armor.defense = 20;
			this.HPMod = 6000;
			this.armor.hasRandomProperties = true;

			this.inventory.push();
						
			this.shield = new ShipShield();
			this.shield.shieldDefense = 30;
			this.shield.shields = 6000;
			this.shield.hasRandomProperties = true;

			//SPEED / THRUST
			this.physiqueRaw = 120;
			//AGILITY:
			this.reflexesRaw = 30;
			//SENSORS
			this.aimRaw = 65;
			//SYSTEMS
			this.intelligenceRaw = 55;
			//POWER GEN
			this.willpowerRaw = 85;

			//UNUSED
			this.libidoRaw = 50;

			//Raw stat start
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 0;

			//(Handled via armor)
			//baseHPResistances = new TypeCollection();
			
			this.level = 0;
			this.XPRaw = bossXP();
			this.credits = 2999999;

			/*
			this.createStatusEffect("Flee Disabled", 0, 0, 0, 0, true, "", "", false, 0);
			this.createPerk("Tough 2",0,0,0,0);
			this.createPerk("Juggernaut",0,0,0,0);
			this.createPerk("Iron Will",0,0,0,0);
			this.createPerk("Single Minded",0,0,0,0);
			*/
			this.createPerk("PCs",0,0,0,0);
			this.HPRaw = this.HPMax();
			this.shieldsRaw = this.shieldsMax();
			this.energyRaw = this.energyMax();

			isUniqueInFight = true;
			btnTargetText = "Sidewindr";
			

			//kGAMECLASS.tarkusSSTDChance(this);
			this._isLoading = false;
		}
		override public function energyMax(): Number {
			return 400;
		}
		override public function get bustDisplay():String
		{
			return "SIDEWINDER";
		}
	}
}