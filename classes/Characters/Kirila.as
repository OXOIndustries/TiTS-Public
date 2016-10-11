package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	//import classes.Items.Guns.PlasmaBore;
	/*import classes.Items.Combat.CrystalShard;
	import classes.Items.Melee.NyreanSpear;
	import classes.Items.Melee.MilitaryPick;
	import classes.Items.Armor.ChitinArmor;
	import classes.Items.Armor.NyreanChain;
	import classes.Items.Accessories.MuskRepel;
	import classes.Items.Transformatives.NyreanCandy;*/
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	
	public class Kirila extends Creature
	{
		//constructor
		public function Kirila()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "Kirila";
			originalRace = "spinarran";
			this.keeperBuy = "";
			this.keeperSell = "";
			//this.inventory.push(new PlasmaBore());
			//this.inventory.push(new ChitinArmor());
			//this.inventory.push(new MilitaryPick());
			//this.inventory.push(new NyreanChain());
			//this.inventory.push(new CrystalShard());
			//this.inventory.push(new FungalExtract());
			//this.inventory.push(new MuskRepel());
			//this.inventory.push(new NyreanCandy());
			this.typesBought[this.typesBought.length] = GLOBAL.ARMOR;
			this.typesBought[this.typesBought.length] = GLOBAL.MELEE_WEAPON;
			this.typesBought[this.typesBought.length] = GLOBAL.RANGED_WEAPON;
			this.typesBought[this.typesBought.length] = GLOBAL.GEM;
			this.sellMarkup = 1.1;
			this.buyMarkdown = .3;

			this.femininity = 85;
		}
		
		override public function onLeaveBuyMenu():void
		{
			kGAMECLASS.backFromShop();
		}
	}
}