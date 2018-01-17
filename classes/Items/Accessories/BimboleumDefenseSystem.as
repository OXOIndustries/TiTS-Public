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
	public class BimboleumDefenseSystem extends ItemSlotClass
	{
		public function BimboleumDefenseSystem() 
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.ACCESSORY;
			
			//Used on inventory buttons
			this.shortName = "B.D.S.";
			
			//Regular name
			this.longName = "Bimboleum Defense System";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a Bimboleum Defense System";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "Like all self-defense systems, it harvests energy from the attacks that impact a shield. However this one has been heavily modified to release a blinding flash of erogenously enticing radiation. The more damage the shield can resist the stronger the radiation will be. It'll trigger when the shield can't take more hits.";
			
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
			resistances.psionic.resistanceValue = 5.0;
			
			itemFlags = [];
			//itemFlags.push(GLOBAL.ITEM_FLAG_COVER_BODY);
			
			this.version = _latestVersion;
		}	
	}
}
