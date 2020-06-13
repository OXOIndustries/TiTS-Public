package classes.Items.Apparel
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.kGAMECLASS;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Creature;
	import classes.Engine.Interfaces.AddLogEvent;

	public class GabilaniPanties extends ItemSlotClass
	{
		public function GabilaniPanties()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 1;
			type = GLOBAL.LOWER_UNDERGARMENT;
			
			shortName = "Gab.Panty";
			longName = "gabilani panties";
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a pair of panties made for gabilani women";
			
			tooltip = "These panties are made out of a flexible material, made to stretch over gabilani womens’ voluminous hips and butts. The fabric gets more sheer the more it has to stretch, so on those with the most thunderous thighs or the junkiest trunks, it’ll be practically see-through.\n\n(<b>Sexiness</b> and <b>Resolve</b> scale appropriately based on the size of your hips and/or butt. Large enough assets will even render them transparent!)";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			basePrice = 800;
			sexiness = 1;
			resolve = 2;
			
			itemFlags = [GLOBAL.ITEM_FLAG_STRETCHY];
			
			version = _latestVersion;
		}
		
		override public function onEquip(targetCreature:Creature, outputText:Boolean = false):void
		{
			stretchUpdateCheck(targetCreature,true);
		}
		public function stretchUpdateCheck(targetCreature:Creature, outputText:Boolean = false):void
		{
			var bigness:Number = 0;
			var currentStretch:int = sexiness;
			this.hasRandomProperties = true;
			bigness = Math.max(targetCreature.hipRating(), targetCreature.buttRating());
			//Determine sexiness
			if (bigness < 5) 
			{
				if(outputText) 
				{
					if(currentStretch > 0) AddLogEvent("Your panties tighten up on your smaller rear, looking more reserved and less sexy than before.");
				}
				sexiness = 0;
				resolve = 3;
				deleteFlag(GLOBAL.ITEM_FLAG_TRANSPARENT);
			}
			else if (bigness < 12) 
			{
				sexiness = 1;
				resolve = 2;
				if(outputText) 
				{
					if(currentStretch == 0) AddLogEvent("Your panties stretch out to cover your expanded assets, getting a bit more sheer and sexy.");
					if(currentStretch > 1) AddLogEvent("Without quite so much junk in your trunk, your panties are can condense down to a less sheer, less sexy look.");
				}
				deleteFlag(GLOBAL.ITEM_FLAG_TRANSPARENT);
			}
			else if (bigness < 15) 
			{
				sexiness = 2;
				resolve = 1;
				if(outputText) 
				{
					if(currentStretch < 2) AddLogEvent("Your panties pull tight around your [pc.hips] and [pc.butt], sheer and sexy.");
					if(currentStretch > 2) AddLogEvent("No longer straining into transparency, your still-taut panties cling tightly to your curvaceous hindquarters.");
				}
				deleteFlag(GLOBAL.ITEM_FLAG_TRANSPARENT);
			}
			else
			{
				sexiness = 3;
				resolve = 0;
				if(outputText) 
				{
					if(currentStretch < 3) AddLogEvent("Your panties are pulled so tight by your excessive attributes that they're completely see-through and incredibly sexy.");
				}
				addFlag(GLOBAL.ITEM_FLAG_TRANSPARENT);
			}
		}
		override public function onRemove(targetCreature:Creature, outputText:Boolean = false):void
		{
			sexiness = 1;
			resolve = 2;
			deleteFlag(GLOBAL.ITEM_FLAG_TRANSPARENT);
		}
	}
}