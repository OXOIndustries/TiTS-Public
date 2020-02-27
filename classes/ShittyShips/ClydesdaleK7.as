package classes.ShittyShips
{
	import classes.Creature;
	import classes.ShittyShip;
	import classes.GLOBAL;
	import classes.Items.Protection.NovaShield;
	import classes.Items.Miscellaneous.EmptySlot;
	import classes.ShittyShips.ShittyShipGear.GunTurrets.EMTurret;
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
	
	public class ClydesdaleK7 extends ShittyShip
	{
		//constructor
		public function ClydesdaleK7()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = false;
			
			this.short = "Clydesdale K7";
			this.originalRace = "ship";
			this.shieldDisplayName = "SHIELDS";
			this.hpDisplayName = "ARMOR";
			this.captainDisplay = "UNKNOWN";
			this.modelDisplay = "STEELETECH";
			this.factionDisplay = "UNKNOWN";

			wardrobeSizeRaw = 50;
			equipmentSizeRaw = 50;
			consumableSizeRaw = 50;
			valuablesSizeRaw = 50;
			toysSizeRaw = 50;

			shipCapacityRaw = 14;
			shipGunCapacityRaw = 2;

			this.a = "the ";
			this.capitalA = "The ";
			this.long = "The Clydesdale K7 comes from an unlikely source: Steele Tech. Victor’s company may not operate extensive ship foundries like KihaCorp or Aegis, but it has taken to producing in-house vessels to serve its own industrial interests. The Clydesdale, much like its namesake, is a heavy, plodding thing designed to shift cargo using its own bloated mass. In Rusher hands, it does all that and more. The copious interior space allows for near infinite customization via upgrades or the presence of a small army of support staff. Many foolhardy captains have made the mistake of underestimating the venerable K7, to their own detriment.";
			this.customBlock = "<b>Placeholder</b>.";
			this.customDodge = "It rolls aside!";
			this.isPlural = false;

			//this.meleeWeapon.attack = 2;
			this.meleeWeapon = new EMTurret();
			//this.rangedWeapon = new EMCannon();
			//this.accessory = new ShieldBoosterForShips();

			this.armor = new ShipArmor();
			this.armor.defense = 10;
			this.HPMod = 2500;
			this.armor.hasRandomProperties = true;

			this.inventory.push();
						
			this.shield = new ShipShield();
			this.shield.shieldDefense = 20;
			this.shield.shields = 3000;
			this.shield.hasRandomProperties = true;

			//SPEED / THRUST
			this.physiqueRaw = 40;
			//AGILITY:
			this.reflexesRaw = 10;
			//SENSORS
			this.aimRaw = 35;
			//SYSTEMS
			this.intelligenceRaw = 20;
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
			this.credits = 299999;

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
			btnTargetText = "Clydesdale";
			

			//kGAMECLASS.tarkusSSTDChance(this);
			this._isLoading = false;
		}
		override public function energyMax(): Number {
			return 200;
		}
		override public function get bustDisplay():String
		{
			return "CLYDESDALE_K7";
		}
	}
}