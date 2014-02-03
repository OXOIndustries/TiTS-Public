package classes.Items.Guns
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class ScopedPistol extends ItemSlotClass
	{
		
		//constructor
		public function ScopedPistol()
		{
			this._latestVersion = 1;
			
			//Scoped Pistol
			//2
			
			//this.indexNumber = 2;
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.RANGED_WEAPON;
			//Used on inventory buttons
			this.shortName = "S.Pistol";
			//Regular name
			this.longName = "scoped pistol";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a scoped pistol";
			//Displayed on tooltips during mouseovers
			this.tooltip = "This pistol is equiped with a rather impressive scope of your own manufacture. It's quite accurate but low caliber.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "shoot";
			//Information
			this.basePrice = 350;
			this.attack = 2;
			this.damage = 4;
			this.damageType = GLOBAL.KINETIC;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			this.bonusResistances = new Array(0,0,0,0,0,0,0,0);
			
			this.version = _latestVersion;
		}
	}
}