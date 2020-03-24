package classes.Items.Apparel
{
	import classes.Engine.Interfaces.*;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Creature;
	
	public class HardlightAGThong extends ItemSlotClass
	{
		public function HardlightAGThong()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.LOWER_UNDERGARMENT;
			
			this.shortName = "HL Thong";
			this.longName = "hardlight anti-grav thong";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a hardlight anti-gravity thong";
			
			// Written By: AHornyPanda
			this.tooltip = "A narrow metallic waistband fitted with a hardlight projector. Upon activation it coats the wearer’s genitals in dazzling sapphire light, leaving them in full view as they press against the transparent glow. A delta of light is projected at the wearer’s buttcrack and connects to the genitals through a thin string of light. Designed to tightly, but comfortably, fit around the wearer’s genitals and ass, it will sexily flaunt their assets to all onlookers. In addition to the activation button, there is a button to project a cock when a strap-on is needed, and with additional buttons to fill the wearer with a number of hardlight dildos.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null";
			
			this.basePrice = 5000;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 3;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			hardLightEquipped = true;
			
			itemFlags = [];
			itemFlags.push(GLOBAL.ITEM_FLAG_TRANSPARENT);
			itemFlags.push(GLOBAL.ITEM_FLAG_ANTIGRAV);
			
			this.version = _latestVersion;
		}
		
		override public function onEquip(targetCreature:Creature, outputText:Boolean = false):void
		{
			if(outputText) output("\n\n(You can also make adjustments to this item in the <b>Interact</b> menu of your inventory.)");
			
			targetCreature.createStatusEffect("HL Thong", 0, 0, 0, 0, true, "", "", false, 0);
		}
		
		override public function onRemove(targetCreature:Creature, outputText:Boolean = false):void
		{
			targetCreature.removeStatusEffect("HL Thong");
		}
	}
}