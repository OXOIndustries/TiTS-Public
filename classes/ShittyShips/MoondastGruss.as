package classes.ShittyShips
{
	import classes.Creature;
	import classes.ShittyShip;
	import classes.GLOBAL;
	import classes.Items.Protection.NovaShield;
	import classes.Items.Miscellaneous.EmptySlot;
	import classes.ShittyShips.ShittyShipGear.Guns.CoilCannon;
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
	
	public class MoondastGruss extends ShittyShip
	{
		//constructor
		public function MoondastGruss()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = false;
			
			this.short = "Moondast Gruss";
			this.originalRace = "ship";
			this.shieldDisplayName = "SHIELDS";
			this.hpDisplayName = "ARMOR";
			this.captainDisplay = "UNKNOWN";
			this.modelDisplay = "PYRITE";
			this.factionDisplay = "UNKNOWN";

			wardrobeSizeRaw = 5;
			equipmentSizeRaw = 5;
			consumableSizeRaw = 5;
			valuablesSizeRaw = 5;
			toysSizeRaw = 5;

			shipCapacityRaw = 4;
			shipGunCapacityRaw = 3;

			this.a = "the ";
			this.capitalA = "The ";
			this.long = "A ship hailing from the junkyard wasteland of Tarkus, the Moondast Gruss isn’t a single specification of ship design, but rather a class of junker built by the technologically advanced local groups before First Contact with the U.G.C. The Moondast Gruss is little more than a gunboat, several hull pieces patched together from available technology around a heavy cannon. Surprisingly, all that firepower and armor leave it able to stand up to the best UGC civilian vessels. Decent engines and a complete lack of storage space round it out its status as a Rush-world bruiser without compare.";
			this.customBlock = "<b>Placeholder</b>.";
			this.customDodge = "It lumbers aside!";
			this.isPlural = false;

			//this.meleeWeapon.attack = 2;
			this.meleeWeapon = new EmptySlot();
			this.rangedWeapon = new CoilCannon();
			this.accessory = new RepairModule();

			this.armor = new ShipArmor();
			this.HPMod = 7000;
			this.armor.defense = 60;
			this.armor.hasRandomProperties = true;

			this.inventory.push();
						
			this.shield = new EmptySlot();
			//this.shield.shieldDefense = 10;
			//this.shield.shields = 1000;
			//this.shield.hasRandomProperties = true;

			//SPEED / THRUST
			this.physiqueRaw = 45;
			//AGILITY:
			this.reflexesRaw = 10;
			//SENSORS
			this.aimRaw = 20;
			//SYSTEMS
			this.intelligenceRaw = 20;
			//POWER GEN
			this.willpowerRaw = 38;

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
			this.credits = 50000;

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
			btnTargetText = "M.Gruss";

			//kGAMECLASS.tarkusSSTDChance(this);
			this._isLoading = false;
		}
		override public function energyMax(): Number {
			return 300;
		}
		override public function get bustDisplay():String
		{
			if(hasPerk("PIRATE_GUN")) return "TAMTURRETS";
			return "MOONDAST_GRUSS";
		}
	}
}