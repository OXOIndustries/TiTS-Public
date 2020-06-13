package classes.Items.Apparel
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.DamageTypes.DamageFlag;
	
	/**
	 * @author Zavos
	 */
	 
	public class RogueRags extends ItemSlotClass
	{
		//Level 4 (common). Balance 2.0
		public function RogueRags()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.CLOTHING;
			
			//Used on inventory buttons
			this.shortName = "R. Rags";
			
			//Regular name
			this.longName = "Rogue’s Rags";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "an outfit of Raskvel rags";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "a complex array of rags, straps and pouches fashioned from ruddy cloth. Similar, if more revealing, to what many of Novahome’s Raskvel wear. While surprisingly comfortable and easy to move around in, this getup provides makes no attempts to cover your groin or chest, letting everything hang free.";

			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null"; 
			
			//Information
			this.basePrice = 400;
			this.attack = 4; 
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 10;
			this.sexiness = 3;
			this.resolve = 2;
			this.critBonus = 0;
			this.evasion = 6;
			this.fortification = 0;
			
			
			
			itemFlags = [];
			itemFlags.push(GLOBAL.ITEM_FLAG_EXPOSE_FULL);
			
			
			this.version = _latestVersion;
		}
	}
}