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
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	import classes.GameData.CodexManager;
	import classes.Engine.Combat.DamageTypes.*;
	import classes.Engine.Combat.*;
	import classes.Engine.Interfaces.output;
	import classes.GameData.CombatAttacks;
	import classes.GameData.CombatManager;
	
	public class MSXI extends ShittyShip
	{
		//constructor
		public function MSXI()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = false;
			
			this.short = "MS-XI";
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

			this.a = "the ";
			this.capitalA = "The ";
			this.long = "The Aegis MS-XI has strong shielding and firepower, putting it near the top of its class in terms of combat ability - though the secondary systems and high crew capacity necessitates that some compromise was made in the ship’s impact armor, which is fairly light. Still, the ship has more than enough kick to blast through most threats, and enough shielding to allow the crew to escape even with the MS-XI’s slower speed - another product of its large size.";
			this.customBlock = "<b>Placeholder</b>.";
			this.customDodge = "It’s too evasive!";
			this.isPlural = false;

			//this.meleeWeapon.attack = 2;
			this.meleeWeapon = new MissileTurret();
			//this.rangedWeapon = new EMCannon();
			this.accessory = new ShieldBoosterForShips();

			this.armor = new ShipArmor();
			this.armor.defense = 20;
			this.HPMod = 2000;
			this.armor.hasRandomProperties = true;

			this.inventory.push();
						
			this.shield = new ShipShield();
			this.shield.shieldDefense = 30;
			this.shield.shields = 5000;
			this.shield.hasRandomProperties = true;

			//SPEED / THRUST
			this.physiqueRaw = 25;
			//AGILITY:
			this.reflexesRaw = 26;
			//SENSORS
			this.aimRaw = 45;
			//SYSTEMS
			this.intelligenceRaw = 40;
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
			
			this.level = 0;
			this.XPRaw = bossXP();
			this.credits = 249999;
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

			isUniqueInFight = true;
			btnTargetText = "MS-XI";
			

			//kGAMECLASS.tarkusSSTDChance(this);
			this._isLoading = false;
		}
		override public function energyMax(): Number {
			return 300;
		}
		override public function get bustDisplay():String
		{
			return "MSXI";
		}
	}
}