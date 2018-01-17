package classes.Items.Accessories 
{
	import classes.Engine.Combat.DamageTypes.TypeCollection;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	/**
	 * ...
	 * @author Fenbuttso
	 */
	public class SalamanderDefenseSystem extends ItemSlotClass
	{
		public function SalamanderDefenseSystem() 
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.ACCESSORY;
			
			//Used on inventory buttons
			this.shortName = "S.D.S.";
			
			//Regular name
			this.longName = "Salamander Defense System";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a Salamander Defense System";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "Designed by KihaCorp, the Salamander Self-defense System harvests energy from the heat generated when an attack impacts a shield to unleash a devastating burning attack later. The more damage the shield can resist the stronger the attack will be. It'll trigger when the shield can't take more hits.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null";
			
			//Information
			this.basePrice = 9000;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			resistances = new TypeCollection();
			resistances.burning.resistanceValue = 5.0;
			
			itemFlags = [];
			//itemFlags.push(GLOBAL.ITEM_FLAG_COVER_BODY);
			
			this.version = _latestVersion;
		}	
	}
}
