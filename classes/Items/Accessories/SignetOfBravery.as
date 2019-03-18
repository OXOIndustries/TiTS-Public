package classes.Items.Accessories 
{
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	/**
	 * ...
	 * @author DAT FENBOIIIII
	 */
	public class SignetOfBravery extends ItemSlotClass
	{
		public function SignetOfBravery() 
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.ACCESSORY;
			
			//Used on inventory buttons
			this.shortName = "BraveSig";
			
			//Regular name
			this.longName = "signet of bravery";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a signet of bravery";
			
			//ring of solid diamond shrouded in a twisting, silver spear. +5 physique/aim and +25 HP but disables flee.
			//Displayed on tooltips during mouseovers
			this.tooltip = "This ring is made from a solid diamond that's been cut into the shape of a twisting, glimmering spear. Silver-red streaks of some strange impurity are the only sign of its primitive manufacture, though you wager a coreward jeweler could judge it better than you.\n\n(Increases maximum aim and physique by +5)\n(Increases maximum HP by 25.)\n(Cannot <b>flee</b> combat.)";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null";
			
			//Information
			this.basePrice = 45000;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 25;
			
			//resistances = new TypeCollection();
			//resistances.freezing.resistanceValue = 35.0;
			
			//itemFlags = [];
			//itemFlags.push(GLOBAL.ITEM_FLAG_COVER_BODY);
			
			this.version = _latestVersion;
		}	
	}
}
