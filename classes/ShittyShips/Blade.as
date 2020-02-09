package classes.ShittyShips
{
	import classes.Creature;
	import classes.StorageClass;
	import classes.ShittyShip;
	import classes.GLOBAL;
	import classes.Items.Protection.NovaShield;
	import classes.Items.Miscellaneous.EmptySlot;
	import classes.ShittyShips.ShittyShipGear.GunTurrets.MissileTurret;
	import classes.ShittyShips.ShittyShipGear.Guns.EMCannon;
	import classes.ShittyShips.ShittyShipGear.Guns.LCannon;
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
	
	public class Blade extends ShittyShip
	{
		//constructor
		public function Blade()
		{
			this._latestVersion = 2;
			this.version = _latestVersion;
			this._neverSerialize = false;
			
			this.short = "Blade";
			this.originalRace = "ship";
			this.shieldDisplayName = "SHIELDS";
			this.hpDisplayName = "ARMOR";
				this.captainDisplay = "UNKNOWN";
			this.modelDisplay = "AEGIS";
			this.factionDisplay = "UNKNOWN";

			wardrobeSizeRaw = 40;
			equipmentSizeRaw = 40;
			consumableSizeRaw = 40;
			valuablesSizeRaw = 40;
			toysSizeRaw = 40;

			shipCapacityRaw = 8;
			shipGunCapacityRaw = 4;

			this.a = "the ";
			this.capitalA = "The ";
			this.long = "The <i>Blade</i> is a former pleasure yacht manufactured by Aegis turned outlaw base by Lysander Chow, then Kiro Tamahime. The latter stripped away some of the excessive hardpoints to make for a more nimble craft with greater cargo capacity, though it still punches above its weight class for raw firepower. The interior is still appointed in luxury fashion. More importantly: it comes equipped with a trophy room to house a galaxy's worth of Kiro's sexual conquests.";
			this.customBlock = "<b>Placeholder</b>.";
			this.customDodge = "It’s too evasive!";
			this.isPlural = false;

			//this.meleeWeapon.attack = 2;
			this.meleeWeapon = new LCannon();
			this.rangedWeapon = new MissileTurret();
			//this.accessory = new HeavyArmor();

			this.armor = new ShipArmor();
			this.armor.defense = 60;
			this.HPMod = 3500;
			this.armor.hasRandomProperties = true;

			this.inventory.push();
						
			this.shield = new ShipShield();
			this.shield.shieldDefense = 60;
			this.shield.shields = 3500;
			this.shield.hasRandomProperties = true;

			//SPEED / THRUST
			this.physiqueRaw = 45;
			//AGILITY:
			this.reflexesRaw = 70;
			//SENSORS
			this.aimRaw = 25;
			//SYSTEMS
			this.intelligenceRaw = 50;
			//POWER GEN
			this.willpowerRaw = 75;

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
			this.credits = 800855;

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
			btnTargetText = "Blade";
			this.createPerk("No Rename");
			this.createPerk("No Sell");

			//kGAMECLASS.tarkusSSTDChance(this);
			this._isLoading = false;
		}
		override public function energyMax(): Number {
			return 350;
		}
		override public function get bustDisplay():String
		{
			return "BLADE";
		}
		
		public function UpgradeVersion1(d:Object):void
		{
			d.a = "the ";
			d.capitalA = "The ";
			d.short = "Blade";
			
			var se:StorageClass;
			var perkNoName:Boolean = true;
			var perkNoSell:Boolean = true;
			
			for(var i:int = 0; i < d.perks.length; i++)
			{
				if(d.perks[i].storageName == "No Rename") perkNoName = false;
				if(d.perks[i].storageName == "No Sell") perkNoSell = false;
			}
			if(perkNoName)
			{
				se = new StorageClass();
				se.storageName = "No Rename";
				d.perks.push(se.getSaveObject());
			}
			if(perkNoSell)
			{
				se = new StorageClass();
				se.storageName = "No Sell";
				d.perks.push(se.getSaveObject());
			}

			d.perks.sortOn("storageName", Array.CASEINSENSITIVE);
		}
	}
}