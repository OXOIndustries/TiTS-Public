package classes.ShittyShips.NPCShips
{
	import classes.Creature;
	import classes.ShittyShip;
	import classes.GLOBAL;
	import classes.Items.Protection.NovaShield;
	import classes.Items.Miscellaneous.EmptySlot;
	import classes.ShittyShips.ShittyShipGear.GunTurrets.MissileTurret;
	import classes.ShittyShips.ShittyShipGear.Guns.EMCannon;
	import classes.ShittyShips.ShittyShipGear.Guns.ThermalProjector;
	import classes.ShittyShips.ShittyShipGear.Guns.LCannon;
	import classes.ShittyShips.ShittyShipGear.Guns.CoilCannon;
	import classes.ShittyShips.ShittyShipGear.Misc.ShipArmor;
	import classes.ShittyShips.ShittyShipGear.Misc.ShipShield;
	import classes.ShittyShips.ShittyShipGear.Gadgets.ShieldDisruptor;
	import classes.ShittyShips.ShittyShipGear.Gadgets.ShieldBoosterForShips;
	import classes.ShittyShips.ShittyShipGear.Gadgets.RepairModule;
	import classes.ShittyShips.ShittyShipGear.Gadgets.ShieldVampire;
	import classes.ShittyShips.ShittyShipGear.Gadgets.CapacitorBank;
	import classes.ShittyShips.ShittyShipGear.Upgrades.ShieldUpgrade;
	import classes.ShittyShips.ShittyShipGear.Upgrades.TunedEmitters;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.GameData.CodexManager;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Engine.Combat.*;
	import classes.Engine.Interfaces.output;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	
	public class TeyaalsMSXI extends ShittyShip
	{
		//constructor
		public function TeyaalsMSXI()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = false;
			
			this.short = "Dr. Teyaal's MS-XI";
			this.originalRace = "ship";
			this.shieldDisplayName = "SHIELDS";
			this.hpDisplayName = "ARMOR";
			this.captainDisplay = "UNKNOWN";
			this.modelDisplay = "AEGIS";
			this.factionDisplay = "UNKNOWN";

			wardrobeSizeRaw = 30;
			equipmentSizeRaw = 30;
			consumableSizeRaw = 30;
			valuablesSizeRaw = 30;
			toysSizeRaw = 30;

			shipCapacityRaw = 9;
			shipGunCapacityRaw = 4;

			this.a = "";
			this.capitalA = "";
			this.long = "The Aegis MS-XI has strong shielding and firepower, putting it near the top of its class in terms of combat ability - though the secondary systems and high crew capacity necessitates that some compromise was made in the ship’s impact armor, which is fairly light. Still, the ship has more than enough kick to blast through most threats, and enough shielding to allow the crew to escape even with the MS-XI’s slower speed - another product of its large size.";
			this.customBlock = "<b>Placeholder</b>.";
			this.customDodge = "It’s too evasive!";
			this.isPlural = false;

			//this.meleeWeapon.attack = 2;
			this.meleeWeapon = new ThermalProjector();
			this.rangedWeapon = new LCannon();

			this.armor = new ShipArmor();
			this.armor.defense = 20;
			this.HPMod = 2000;
			this.armor.hasRandomProperties = true;

			this.inventory.push(new EMCannon());
			this.inventory.push(new CoilCannon());
			this.inventory.push(new ShieldUpgrade());
			this.inventory.push(new TunedEmitters());
			this.inventory.push(new ShieldVampire());
			this.inventory.push(new CapacitorBank());
			this.inventory.push(new ShieldDisruptor());
						
			this.shield = new ShipShield();
			this.shield.shieldDefense = 30;
			this.shield.shields = 5000;
			this.shield.hasRandomProperties = true;

			//SPEED / THRUST
			this.physiqueRaw = 25;
			//AGILITY:
			this.reflexesRaw = 26;
			//SENSORS
			this.aimRaw = 100;
			//SYSTEMS
			this.intelligenceRaw = 65;
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
			
			this.level = 9;
			this.XPRaw = normalXP();
			this.credits = 0;

			/*
			this.createStatusEffect("Flee Disabled", 0, 0, 0, 0, true, "", "", false, 0);
			this.createPerk("Tough 2",0,0,0,0);
			this.createPerk("Juggernaut",0,0,0,0);
			this.createPerk("Iron Will",0,0,0,0);
			this.createPerk("Single Minded",0,0,0,0);
			*/
			this.createPerk("AGGRESSIVE_AI");
			this.HPRaw = this.HPMax();
			this.shieldsRaw = this.shieldsMax();
			this.energyRaw = this.energyMax();

			isUniqueInFight = true;
			btnTargetText = "MS-XI";
			


			//kGAMECLASS.tarkusSSTDChance(this);
			this._isLoading = false;
		}
		override public function energyMax(): Number {
			return 400;
		}
		override public function get bustDisplay():String
		{
			return "MSXI";
		}
	}
}