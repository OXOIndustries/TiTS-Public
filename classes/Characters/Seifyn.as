﻿package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Miscellaneous.*;
	import classes.Items.Combat.CrystalShard;
	import classes.Items.Melee.NyreanSpear;
	import classes.Items.Melee.MilitaryPick;
	import classes.Items.Armor.ChitinArmor;
	import classes.Items.Armor.NyreanChain;
	import classes.Items.Accessories.MuskRepel;
	import classes.Items.Transformatives.NyreanCandy;
	import classes.Items.Upgrades.ExpandedBackpackIPtV;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	
	public class Seifyn extends Creature
	{
		//constructor
		public function Seifyn()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "Seifyn";
			originalRace = "nyrea";
			
			this.inventory.push(new NyreanSpear());
			this.inventory.push(new ChitinArmor());
			this.inventory.push(new MilitaryPick());
			this.inventory.push(new NyreanChain());
			this.inventory.push(new ExpandedBackpackIPtV());
			this.inventory.push(new CrystalShard());
			this.inventory.push(new FungalExtract());
			this.inventory.push(new MuskRepel());
			this.inventory.push(new NyreanCandy());
			this.typesBought[this.typesBought.length] = GLOBAL.ARMOR;
			this.typesBought[this.typesBought.length] = GLOBAL.MELEE_WEAPON;
			this.typesBought[this.typesBought.length] = GLOBAL.RANGED_WEAPON;
			this.typesBought[this.typesBought.length] = GLOBAL.SHIELD;
			this.typesBought[this.typesBought.length] = GLOBAL.ACCESSORY;
			this.typesBought[this.typesBought.length] = GLOBAL.GADGET;
			this.typesBought[this.typesBought.length] = GLOBAL.GEM;
			this.sellMarkup = .9;
			this.buyMarkdown = .5;

			this.femininity = 85;
		}
		
		override public function onLeaveBuyMenu():void
		{
			kGAMECLASS.repeatSeifynMeeting();
		}
	}
}