package classes.ShittyShips
{
	import classes.Creature;
	import classes.ShittyShip;
	import classes.GLOBAL;
	import classes.Items.Protection.NovaShield;
	import classes.Items.Miscellaneous.EmptySlot;
	import classes.ShittyShips.ShittyShipGear.MGun;
	import classes.ShittyShips.ShittyShipGear.LCannon;
	import classes.ShittyShips.ShittyShipGear.ShipArmor;
	import classes.ShittyShips.ShittyShipGear.ShipShield;
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
			this.modelDisplay = "Z14";
			this.factionDisplay = "UNKNOWN";

			wardrobeSize = 10;
			equipmentSize = 2;
			consumableSize = 10;
			valuablesSize = 10;
			toysSize = 10;

			this.a = "a ";
			this.capitalA = "A ";
			this.long = "It’s been painted bright red with silvery stripes. Looking at it again, you realize that you recognize this from some of your father’s holo-pics, at least the ones he’d let you see. This is the same ship that he took out on the Thirteenth Planet Rush, almost two centuries ago.";
			this.customBlock = "<b>Placeholder</b>.";
			this.customDodge = "It's too evasive!";
			this.isPlural = false;

			//this.meleeWeapon.attack = 2;
			this.meleeWeapon = new EmptySlot();
			this.rangedWeapon = new MGun();

			this.armor = new ShipArmor();
			this.armor.defense = 30;
			this.armor.hasRandomProperties = true;

			this.inventory.push(new LCannon());
			//this.inventory.push(new LCannon());
			
			this.shield = new ShipShield();
			this.shield.shieldDefense = 20;
			this.shield.shields = 3000;
			this.shield.hasRandomProperties = true;

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
			this.credits = 0;
			this.HPMod = 3000;
			this.HPRaw = this.HPMax();
			this.shieldsRaw = this.shieldsMax();
			
			/*
			this.createStatusEffect("Flee Disabled", 0, 0, 0, 0, true, "", "", false, 0);
			this.createPerk("Tough 2",0,0,0,0);
			this.createPerk("Juggernaut",0,0,0,0);
			this.createPerk("Iron Will",0,0,0,0);
			this.createPerk("Single Minded",0,0,0,0);
			this.createPerk("Riposte",0,0,0,0);*/
			isUniqueInFight = true;
			btnTargetText = "CT.Z14";
			

			//kGAMECLASS.tarkusSSTDChance(this);
			this._isLoading = false;
		}

		override public function get bustDisplay():String
		{
			return "Z14";
		}
	}
}