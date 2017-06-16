package classes.Items.Apparel
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Creature;
	
	public class HardlightAGJock extends ItemSlotClass
	{
		public function HardlightAGJock()
		{
			this._latestVersion = 1;

			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.LOWER_UNDERGARMENT;
			
			this.shortName = "HL Jock";
			this.longName = "hardlight anti-grav jock";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a hardlight anti-gravity jock";
			
			// Written By: ThaumX
			this.tooltip = "A narrow metallic waistband fitted with a hard light projector. Upon activation it coats the wearer’s genitals in dazzling sapphire light, leaving them in full view as they press against the transparent glow. Designed to comfortably support even the largest endowments; the hard light field will lift, spread, and nudge any wearer’s assets into the most provocative display possible.";
			//this.tooltip += " While the extra support does help keep anatomy out of the way while walking, a small warning inside the belt states that the projector is rated for no more than 1,000 pounds.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "null";
			
			this.basePrice = 2000;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 3;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			itemFlags = [];
			itemFlags.push(GLOBAL.ITEM_FLAG_TRANSPARENT);
			itemFlags.push(GLOBAL.ITEM_FLAG_ANTIGRAV);
			
			this.version = _latestVersion;
		}
		
		public function toggleSexiness(toggleOn:Boolean = false):void
		{
			hasRandomProperties = true;
			if(toggleOn)
			{
				sexiness = 4;
			}
			else
			{
				sexiness = 3;
			}
		}
		
		override public function onEquip(targetCreature:Creature):void
		{
			toggleSexiness(targetCreature.hasStatusEffect("Jock Sexiness"));
		}
		
		override public function onRemove(targetCreature:Creature):void
		{
			toggleSexiness(false);
		}
	}
}