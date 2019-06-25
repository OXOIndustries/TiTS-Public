package classes.ShittyShips
{
	import classes.Creature;
	import classes.ShittyShip;
	import classes.GLOBAL;
	import classes.Items.Protection.NovaShield;
	import classes.Items.Miscellaneous.EmptySlot;
	import classes.ShittyShips.ShittyShipGear.Guns.MGun;
	import classes.ShittyShips.ShittyShipGear.Guns.LCannon;
	import classes.ShittyShips.ShittyShipGear.Misc.ShipArmor;
	import classes.ShittyShips.ShittyShipGear.Misc.ShipShield;
	import classes.ShittyShips.ShittyShipGear.Gadgets.ShieldDisruptor;
	import classes.ShittyShips.ShittyShipGear.Gadgets.RepairModule;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.GameData.CodexManager;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Engine.Combat.*;
	import classes.Engine.Interfaces.output;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	
	public class Casstech extends ShittyShip
	{
		//constructor
		public function Casstech()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = false;
			
			this.short = "Casstech Z14";
			this.originalRace = "ship";
			this.shieldDisplayName = "SHIELDS";
			this.hpDisplayName = "ARMOR";
			this.captainDisplay = "UNKNOWN";
			this.modelDisplay = "CT.Z14";
			this.factionDisplay = "UNKNOWN";

			wardrobeSizeRaw = 10;
			equipmentSizeRaw = 10;
			consumableSizeRaw = 10;
			valuablesSizeRaw = 10;
			toysSizeRaw = 10;
			
			shipCapacityRaw = 4;
			shipGunCapacityRaw = 2;

			this.a = "the ";
			this.capitalA = "The ";
			this.long = "It’s been painted bright red with silvery stripes. Looking at it again, you realize that you recognize this from some of your father’s holo-pics, at least the ones he’d let you see. This is the same ship that he took out on the Thirteenth Planet Rush, almost two centuries ago.";
			this.customBlock = "<b>Placeholder</b>.";
			this.customDodge = "It’s too evasive!";
			this.isPlural = false;

			//this.meleeWeapon.attack = 2;
			this.meleeWeapon = new EmptySlot();
			this.rangedWeapon = new MGun();

			this.armor = new ShipArmor();
			this.armor.defense = 30;
			this.armor.hasRandomProperties = true;

			this.inventory.push(new LCannon());
			
			this.shield = new ShipShield();
			this.shield.shieldDefense = 20;
			this.shield.shields = 3000;
			this.shield.hasRandomProperties = true;

			this.HPMod = 2000;

			//SPEED / THRUST
			this.physiqueRaw = 33;
			//AGILITY:
			this.reflexesRaw = 20;
			//SENSORS
			this.aimRaw = 14;
			//SYSTEMS
			this.intelligenceRaw = 25;
			//POWER GEN
			this.willpowerRaw = 25;

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
			this.credits = 25000;
			this.HPRaw = this.HPMax();
			this.shieldsRaw = this.shieldsMax();
			this.energyRaw = this.energyMax();

			/*
			this.createStatusEffect("Flee Disabled", 0, 0, 0, 0, true, "", "", false, 0);
			this.createPerk("Tough 2",0,0,0,0);
			this.createPerk("Juggernaut",0,0,0,0);
			this.createPerk("Iron Will",0,0,0,0);
			this.createPerk("Single Minded",0,0,0,0);
			*/
			this.createPerk("PCs",0,0,0,0);
			//this.createPerk("TACTICAL_AI",0,0,0,0);

			isUniqueInFight = true;
			btnTargetText = "CT.Z14";
			

			//kGAMECLASS.tarkusSSTDChance(this);
			this._isLoading = false;
		}
		override public function energyMax(): Number {
			return 200;
		}
		override public function get bustDisplay():String
		{
			return "Z14";
		}
	}
}