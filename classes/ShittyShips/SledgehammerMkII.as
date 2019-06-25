package classes.ShittyShips
{
	import classes.Creature;
	import classes.ShittyShip;
	import classes.GLOBAL;
	import classes.Items.Protection.NovaShield;
	import classes.Items.Miscellaneous.EmptySlot;
	import classes.ShittyShips.ShittyShipGear.Guns.ThermalProjector;
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
	
	public class SledgehammerMkII extends ShittyShip
	{
		//constructor
		public function SledgehammerMkII()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = false;
			
			this.short = "Sledgehammer";
			this.originalRace = "ship";
			this.shieldDisplayName = "SHIELDS";
			this.hpDisplayName = "ARMOR";
			this.captainDisplay = "UNKNOWN";
			this.modelDisplay = "REAPER";
			this.factionDisplay = "UNKNOWN";

			wardrobeSizeRaw = 25;
			equipmentSizeRaw = 25;
			consumableSizeRaw = 10;
			valuablesSizeRaw = 10;
			toysSizeRaw = 10;

			shipCapacityRaw = 7;
			shipGunCapacityRaw = 4;

			this.a = "the ";
			this.capitalA = "The ";
			this.long = "The Sledgehammer Mark II is one of the most powerful, combat-ready ships on the market. Produced by Reaper Armaments for the 14th Planet Rush, this space-faring bludgeon is fully capable of rendering most pirates down to floating scrap and even standing up to similarly-sized military vessels for a time. Remember, when you’re flying a Sledgehammer, every problem’s just another nail.";
			this.customBlock = "<b>Placeholder</b>.";
			this.customDodge = "It rolls aside!";
			this.isPlural = false;

			//this.meleeWeapon.attack = 2;
			this.meleeWeapon = new ThermalProjector();
			this.rangedWeapon = new ShieldDisruptor();
			//this.accessory = new ShieldBoosterForShips();

			this.armor = new ShipArmor();
			this.armor.defense = 50;
			this.HPMod = 4000;
			this.armor.hasRandomProperties = true;

			this.inventory.push();
						
			this.shield = new ShipShield();
			this.shield.shieldDefense = 30;
			this.shield.shields = 4000;
			this.shield.hasRandomProperties = true;

			//SPEED / THRUST
			this.physiqueRaw = 45;
			//AGILITY:
			this.reflexesRaw = 45;
			//SENSORS
			this.aimRaw = 20;
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
			this.credits = 399999;
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
			btnTargetText = "Sledgehammer";
			

			//kGAMECLASS.tarkusSSTDChance(this);
			this._isLoading = false;
		}
		override public function energyMax(): Number {
			return 300;
		}
		override public function get bustDisplay():String
		{
			return "SLEDGEHAMMER_MKII";
		}
	}
}