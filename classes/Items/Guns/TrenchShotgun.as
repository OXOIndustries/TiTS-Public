package classes.Items.Guns
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	public class TrenchShotgun extends ItemSlotClass
	{
		//constructor
		public function TrenchShotgun()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.RANGED_WEAPON;
			
			//Used on inventory buttons
			this.shortName = "Shotgn";
			
			//Regular name
			this.longName = "trench shotgun";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a trench shotgun";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "It took you this long to find a goddamn shotgun? It’s pretty rudimentary in design, just a quick and easy breech that you can thumb a pair of shells into. The real quality is what you want to load into it - with a thick gauge, as long as you have enough time to prepare, this’ll put the hurt on anything. Just... do it slowly, sausagefingers.";
			//No damage type - not weak to anything! Not strong to anything, either. Nothing special stats wise.
			this.attackVerb = "shoot";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 2300;
			this.attack = 25;
			
			baseDamage.kinetic.damageValue = 10;
			baseDamage.addFlag(DamageFlag.BULLET);
			
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;

			this.version = _latestVersion;
		}
	}
}