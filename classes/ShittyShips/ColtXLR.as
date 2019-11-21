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
	
	public class ColtXLR extends ShittyShip
	{
		//constructor
		public function ColtXLR()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = false;
			
			this.short = "Colt XLR";
			this.originalRace = "ship";
			this.shieldDisplayName = "SHIELDS";
			this.hpDisplayName = "ARMOR";
			this.captainDisplay = "UNKNOWN";
			this.modelDisplay = "PYRITE";
			this.factionDisplay = "UNKNOWN";

			wardrobeSizeRaw = 30;
			equipmentSizeRaw = 30;
			consumableSizeRaw = 30;
			valuablesSizeRaw = 30;
			toysSizeRaw = 30;

			shipCapacityRaw = 6;
			shipGunCapacityRaw = 3;

			this.a = "the ";
			this.capitalA = "The ";
			this.long = "A relatively old model by current standards, the <b>Pyrite Heavy Industries</b> Colt XLR is nevertheless a prized addition to any construction or cargo-hauling company. The pickup truck of starships, it offers a good combination of armor protection, cargo space, and raw physical power thanks to its mighty engines. It is, however, known for being relatively lightly shielded, much of its power better used to operate the engines on evasive dodges rather than trying to overclock the basic navigational shield installed.\n\nStill, any trucker or terraformer who uses the XLR swears by its reliability and durability.";
			this.customBlock = "<b>Placeholder</b>.";
			this.customDodge = "It’s too evasive!";
			this.isPlural = false;

			//this.meleeWeapon.attack = 2;
			this.meleeWeapon = new MGun();
			this.rangedWeapon = new EmptySlot();

			this.armor = new ShipArmor();
			this.armor.defense = 40;
			this.armor.hasRandomProperties = true;

			this.inventory.push();
						
			this.shield = new ShipShield();
			this.shield.shieldDefense = 10;
			this.shield.shields = 1000;
			this.shield.hasRandomProperties = true;

			this.HPMod = 5000;

			//SPEED / THRUST
			this.physiqueRaw = 40;
			//AGILITY:
			this.reflexesRaw = 25;
			//SENSORS
			this.aimRaw = 30;
			//SYSTEMS
			this.intelligenceRaw = 15;
			//POWER GEN
			this.willpowerRaw = 32;

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
			this.credits = 39999;
			
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
			btnTargetText = "ColtXLR";

			//kGAMECLASS.tarkusSSTDChance(this);
			this._isLoading = false;
		}
		override public function energyMax(): Number {
			return 250;
		}
		override public function get bustDisplay():String
		{
			return "COLT_XLR";
		}
	}
}