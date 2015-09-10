package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Guns.SalamanderRifle;
	import classes.Items.Guns.SalamanderPistol;
	import classes.Items.Melee.VampBlade;
	import classes.Items.Melee.LavaSaber;
	import classes.Items.Melee.Jolthammer;
	import classes.Items.Protection.SalamanderShield;
	import classes.Items.Protection.OzoneAegis;
	import classes.Items.Accessories.SalamanderDuster;
	import classes.kGAMECLASS;
	import classes.rand;
	
	public class Emmy extends Creature
	{
		//constructor
		public function Emmy()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "Emmy";
			
			keeperBuy = "";
			keeperSell = "";
			
			inventory.push(new SalamanderRifle());
			inventory.push(new SalamanderPistol());
			inventory.push(new SalamanderDuster());
			inventory.push(new SalamanderShield());
			inventory.push(new VampBlade());
			inventory.push(new LavaSaber());
			inventory.push(new Jolthammer());
			inventory.push(new OzoneAegis());

			
			this.typesBought = [GLOBAL.MELEE_WEAPON,GLOBAL.RANGED_WEAPON,GLOBAL.SHIELD,GLOBAL.ACCESSORY];
			
			this.sellMarkup = 1.0;
			this.buyMarkdown = .25;

			this.femininity = 85;
		}
	}
}