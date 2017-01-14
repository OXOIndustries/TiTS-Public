package classes.Items.Accessories 
{
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class ExplorersCloak extends ItemSlotClass
	{
		
		
		public function ExplorersCloak() 
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.ACCESSORY;
			
			//Used on inventory buttons
			this.shortName = "Exp. Cloak";
			
			//Regular name
			this.longName = "explorers cloak";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "an explorers cloak";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "A cloak made of what looks like glass with the texture of cloth. When a button on the clasp is pressed it blends in with the surrounding environment. The blend is far from perfect, creating a dazzling array of colors when moved. It wouldn’t totally hide anyone, but it might make distant viewers doubt what they saw.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null";
			
			//Information
			this.basePrice = 5000;
			this.attack = 0;
			this.defense = 1;
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
