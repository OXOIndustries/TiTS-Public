package classes.ShittyShips.NPCShips
{
	import classes.Creature;
	import classes.ShittyShip;
	import classes.GLOBAL;
	import classes.Items.Protection.NovaShield;
	import classes.Items.Miscellaneous.EmptySlot;
	import classes.ShittyShips.ShittyShipGear.Guns.MGun;
	import classes.ShittyShips.ShittyShipGear.Guns.ThermalProjector;
	import classes.ShittyShips.ShittyShipGear.Misc.ShipArmor;
	import classes.ShittyShips.ShittyShipGear.Misc.ShipShield;
	import classes.ShittyShips.ShittyShipGear.Gadgets.RepairModule;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.GameData.CodexManager;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Engine.Combat.*;
	import classes.Engine.Interfaces.output;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	
	public class Pyrotech extends ShittyShip
	{
		//constructor
		public function Pyrotech()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "modified Z7";
			this.originalRace = "ship";
			this.shieldDisplayName = "SHIELDS";
			this.hpDisplayName = "ARMOR";
			this.captainDisplay = "S1CKM0V3S";
			this.modelDisplay = "CT.Z7";
			this.factionDisplay = "C.LORDS";

			wardrobeSizeRaw = 10;
			equipmentSizeRaw = 2;
			consumableSizeRaw = 10;
			valuablesSizeRaw = 10;
			toysSizeRaw = 10;
			shipCapacityRaw = 3;

			this.a = "the ";
			this.capitalA = "The ";
			this.long = "This tiny, ancient Casstech Z7 makes Dad’s old Z14 look like a pleasure yacht, but what it lacks in size, it makes up for in thrust. Brand new engines shine with glossy, factory finishes, ready to run down vulnerable Rushers in a heartbeat. Once it catches its prey, it’s ready to unload with standard-issue machine gun and some kind of short ranged energy weapon.\n\nA flashy insignia on the side proudly declares it to be a member of the “Corona Lords.”";
			this.customBlock = "<b>Placeholder</b>.";
			this.customDodge = "It’s too evasive!";
			this.isPlural = false;

			//this.meleeWeapon.attack = 2;
			this.meleeWeapon = new EmptySlot();
			this.rangedWeapon = new MGun();

			this.armor = new ShipArmor();
			this.armor.defense = 20;
			this.armor.hasRandomProperties = true;

			this.inventory.push(new ThermalProjector());
			this.inventory.push(new RepairModule());
			//this.inventory.push(new ShieldBooster());
			
			this.shield = new ShipShield();
			this.shield.shieldDefense = 20;
			this.shield.shields = 500;
			this.shield.hasRandomProperties = true;

			this.HPMod = 3500;

			//SPEED / THRUST
			this.physiqueRaw = 40;
			//AGILITY:
			this.reflexesRaw = 40;
			//SENSORS
			this.aimRaw = 20;
			//SYSTEMS
			this.intelligenceRaw = 15;
			//POWER GEN
			this.willpowerRaw = 30;

			//UNUSED
			this.libidoRaw = 50;

			//Raw stat start
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 0;

			//(Handled via armor)
			//baseHPResistances = new TypeCollection();
			
			this.level = 2;
			this.XPRaw = normalXP();
			this.credits = 1500+rand(100);
			
			this.HPRaw = this.HPMax();
			this.shieldsRaw = this.shieldsMax();
			this.energyRaw = this.energyMax();

			this.createPerk("AGGRESSIVE_AI");
			this.createPerk("PIRATE");

			/*
			this.createStatusEffect("Flee Disabled", 0, 0, 0, 0, true, "", "", false, 0);
			this.createPerk("Tough 2",0,0,0,0);
			this.createPerk("Juggernaut",0,0,0,0);
			this.createPerk("Iron Will",0,0,0,0);
			this.createPerk("Single Minded",0,0,0,0);
			this.createPerk("Riposte",0,0,0,0);*/
			isUniqueInFight = true;
			btnTargetText = "Z7";
			

			//kGAMECLASS.tarkusSSTDChance(this);
			this._isLoading = false;
		}
		override public function energyMax(): Number {
			return 150;
		}
		override public function get bustDisplay():String
		{
			return "Z7";
		}
	}
}