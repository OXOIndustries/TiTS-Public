package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.Items.Miscellaneous.ImmunoBooster;
	import classes.Items.Protection.JoyCoEliteShield;
	import classes.Items.Recovery.ShieldBoosterMkII;
	import classes.Items.Accessories.MuskRepel;
	import classes.Items.Accessories.MuskLure;
	import classes.Items.Apparel.FemaleDoctorOutfit;
	import classes.Items.Apparel.MaleDoctorOutfit;

	import classes.Items.Combat.CrystalShard;
	import classes.Items.Melee.NyreanSpear;
	import classes.Items.Melee.MilitaryPick;
	import classes.Items.Armor.ChitinArmor;
	import classes.Items.Armor.NyreanChain;
	import classes.Items.Accessories.MuskRepel;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	
	public class Vi extends Creature
	{
		//constructor
		public function Vi()
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = true;
			
			this.short = "Vi";
			originalRace = "automaton";
			
			//Old V-Ko Menu
			this.inventory.push(new ShieldBoosterMkII());
			this.inventory.push(new JoyCoEliteShield());
			this.inventory.push(new MuskRepel());
			this.inventory.push(new MuskLure());
			this.inventory.push(new MaleDoctorOutfit());
			this.inventory.push(new FemaleDoctorOutfit());
			this.inventory.push(new ImmunoBooster());

			this.typesBought[this.typesBought.length] = GLOBAL.PILL;
			this.typesBought[this.typesBought.length] = GLOBAL.POTION;
			this.typesBought[this.typesBought.length] = GLOBAL.DRUG;
			this.typesBought[this.typesBought.length] = GLOBAL.SHIELD;
			this.sellMarkup = 1.15;
			this.buyMarkdown = .5;

			this.femininity = 85;

			this.elasticity = 3;
			this.createVagina();
			this.vaginas[0].wetnessRaw = 4;
			this.vaginas[0].loosenessRaw = 1;
			this.vaginas[0].bonusCapacity = 20;
		}
		
		override public function onLeaveBuyMenu():void
		{
			kGAMECLASS.approachVi();
		}
	}
}