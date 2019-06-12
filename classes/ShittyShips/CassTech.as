package classes.ShittyShips
{
	import classes.Creature;
	import classes.ShittyShip;
	import classes.GLOBAL;
	import classes.Items.Protection.NovaShield;
	import classes.Items.Miscellaneous.EmptySlot;
	import classes.ShittyShips.ShittyShipGear.MGun;
	import classes.ShittyShips.ShittyShipGear.LCannon;
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
			this.shieldDisplayName = "SHIELDS2";
			this.hpDisplayName = "ARMOR";
			this.captainDisplay = "THRALL";
			this.modelDisplay = "Z14";
			this.factionDisplay = "T.HORDE";

			this.a = "a ";
			this.capitalA = "A ";
			this.long = "It’s been painted bright red with silvery stripes. Looking at it again, you realize that you recognize this from some of your father’s holo-pics, at least the ones he’d let you see. This is the same ship that he took out on the Thirteenth Planet Rush, almost two centuries ago.";
			this.customBlock = "<b>Placeholder</b>.";
			this.customDodge = "It's too evasive!";
			this.isPlural = false;

			//this.meleeWeapon.attack = 2;
			this.meleeWeapon = new EmptySlot();
			
			this.armor.longName = "hull plating";
			this.armor.description = "hull plates";
			this.armor.defense = 20;
			this.armor.hasRandomProperties = true;

			this.inventory.push(new MGun());
			this.inventory.push(new LCannon());
			
			this.shield = new NovaShield();

			//SPEED / THRUST
			this.physiqueRaw = 33;
			//AGILITY:
			this.reflexesRaw = 20;
			//SENSORS
			this.aimRaw = 14;
			//SYSTEMS
			this.intelligenceRaw = 25;
			//POWER GEN
			this.willpowerRaw = 20;

			//UNUSED
			this.libidoRaw = 50;

			//Raw stat start
			this.shieldsRaw = 0;
			this.energyRaw = 100;
			this.lustRaw = 0;

			baseHPResistances = new TypeCollection();
			baseHPResistances.burning.damageValue = 35;
			baseHPResistances.kinetic.damageValue = -25;

			/*baseHPResistances.tease.damageValue = 25.0;
			baseHPResistances.drug.damageValue = 50.0;
			baseHPResistances.burning.damageValue = 50.0;*/
			
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