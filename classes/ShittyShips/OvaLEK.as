package classes.ShittyShips
{
	import classes.Creature;
	import classes.ShittyShip;
	import classes.GLOBAL;
	import classes.Items.Protection.NovaShield;
	import classes.Items.Miscellaneous.EmptySlot;
	import classes.ShittyShips.ShittyShipGear.Guns.MGun;
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
	
	public class OvaLEK extends ShittyShip
	{
		//constructor
		public function OvaLEK()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = false;
			
			this.short = "Ova'LEK";
			this.originalRace = "ship";
			this.shieldDisplayName = "SHIELDS";
			this.hpDisplayName = "ARMOR";
			this.captainDisplay = "UNKNOWN";
			this.modelDisplay = "OVIR";
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
			this.long = "The Ova’LEK was a joint project developed by the ovir and the U.G.C. The ovir, new to the galactic community as a whole, needed a ship that suited their needs. Not ones to be front line fighters even on their home planet, the ovir excelled in other areas: stealth and speed. New ovir engineers proved themselves to the galaxy’s best by designing new, more efficient stealth modules and more powerful maneuvering engines. The ovir, it seemed, understood the concepts of stealth in and out of space to a degree not seen by humans before. The Ova’LEK clearly outclassed other U.G.C. stealth ships after its deployment.";
			this.customBlock = "<b>Placeholder</b>.";
			this.customDodge = "It’s too evasive!";
			this.isPlural = false;

			//this.meleeWeapon.attack = 2;
			this.meleeWeapon = new EmptySlot();
			this.rangedWeapon = new EmptySlot();

			this.armor = new ShipArmor();
			this.armor.defense = 20;
			this.armor.hasRandomProperties = true;

			this.inventory.push();
						
			this.shield = new ShipShield();
			this.shield.shieldDefense = 30;
			this.shield.shields = 3500;
			this.shield.hasRandomProperties = true;

			this.HPMod = 2500;

			//SPEED / THRUST
			this.physiqueRaw = 32;
			//AGILITY:
			this.reflexesRaw = 40;
			//SENSORS
			this.aimRaw = 40;
			//SYSTEMS
			this.intelligenceRaw = 30;
			//POWER GEN
			this.willpowerRaw = 15;

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
			this.credits = 34999;

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
			btnTargetText = "Ova'LEK";

			//kGAMECLASS.tarkusSSTDChance(this);
			this._isLoading = false;
		}
		override public function energyMax(): Number {
			return 350;
		}
		override public function get bustDisplay():String
		{
			return "OVALEK";
		}
	}
}