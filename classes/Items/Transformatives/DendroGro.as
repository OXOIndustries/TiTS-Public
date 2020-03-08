package classes.Items.Transformatives
{
	import classes.Engine.Interfaces.*;
	import classes.Engine.Utility.num2Ordinal;
	import classes.Engine.Utility.formatFloat;
	import classes.Engine.Utility.rand;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class DendroGro extends ItemSlotClass
	{
		public function DendroGro()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 10;
			type = GLOBAL.PILL;
			shortName = "DendroGro";
			longName = "DendroGro";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a DendroGro medipen";
			tooltip = "An old Xenogen classic, DendroGro was created with the old Terran saying: “Girth over length,” in mind. Staying true to that adage, DendroGro increases the girth of an injected penis without affecting its overall length by fattening the tissue and widening the veins, allowing more blood to circulate within it. Near the bottom of the medipen, there is a warning label stating that although not life threatening to user, over usage is strongly discouraged since most lifeforms simply won’t be able to fit it.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			attackVerb = "";
			
			basePrice = 250;
			
			version = _latestVersion;
		}
		
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			clearOutput();
			kGAMECLASS.showName("\nDENDROGRO");
			author("FrankenApple");
			
			if(target is PlayerCharacter)
			{
				var i:int = -1;
				var x:int = 0;
				var btnSlot:int = 0;
				var nonChubCocks:Array = [];
				
				// Scan genitals
				if(target.hasCock())
				{
					for(i = 0; i < target.cocks.length; i++)
					{
						if(target.cocks[i].cThicknessRatioRaw < 3)
						{
							nonChubCocks.push(i);
						}
					}
				}
				
				if(nonChubCocks.length <= 0)
				{
					if(!kGAMECLASS.infiniteItems()) quantity++;
					
					if(target.hasCock())
					{
						kGAMECLASS.output("You take out and fumble the medipen in your hand. While it would be fucking awesome to have an even fatter dick, would it really be necessary? You already have plenty of meat to pound hungry holes with... if there are any that can take it anyway...");
						kGAMECLASS.output("\n\nDeciding not to take it too far, you abide by the warning and put away the medipen.")
					}
					else
					{
						kGAMECLASS.output("Unfortunately, you do not have any valid genitalia to use this on.");
						kGAMECLASS.output("\n\nYou put the item back in your inventory.");
					}
					
					return false;
				}
				else if(nonChubCocks.length == 1)
				{
					cockTF([target, nonChubCocks[0]]);
					return true;
				}
				
				kGAMECLASS.output("You have more than one eligible cock. Which one will you inject with DendroGro?\n");
				
				kGAMECLASS.clearMenu();
				if(nonChubCocks.length > 0)
				{
					for(i = 0; i < nonChubCocks.length; i++)
					{
						output("\n<b>" + StringUtil.capitalize(num2Ordinal(nonChubCocks[i] + 1)) + " Cock:</b>");
						if(target.cocks[i].cockFlags.length > 0)
						{
							for(x = 0; x < target.cocks[i].cockFlags.length; x++)
							{
								output(" " + GLOBAL.FLAG_NAMES[target.cocks[i].cockFlags[x]] + ",");
							}
						}
						if(target.cocks[i].cockColor != "") output(" " + StringUtil.toDisplayCase(target.cocks[i].cockColor) + ",");
						output(" " + GLOBAL.TYPE_NAMES[target.cocks[i].cType]);
						if(target.cocks[i].cLength() > 0) output(", " + formatFloat(target.cocks[i].cLength(), 3) + " in long");
						if(target.cocks[i].thickness() > 0) output(", " + formatFloat(target.cocks[i].thickness(), 3) + " in thick");
						
						addButton(btnSlot, "Cock " + (nonChubCocks[i] + 1), cockTF, [target, nonChubCocks[i]], StringUtil.capitalize(num2Ordinal(nonChubCocks[i] + 1)) + " Cock", "Use this on your [pc.cock " + nonChubCocks[i] + "].");
						btnSlot++;
					}
				}
				
				return true;
			}
			else
			{
				kGAMECLASS.output(target.capitalA + target.short + " uses the medipen but to no effect.");
			}
			return false;
		}
		private function cockTF(arg:Array):void
		{
			clearOutput();
			kGAMECLASS.showName("\nDENDROGRO");
			author("FrankenApple");
			
			var target:Creature = arg[0];
			var i:int = arg[1];
			
			output("You");
			if(!target.isCrotchExposed()) output(" expose your crotch,");
			output(" bring the medipen to your [pc.cockNoun " + i + "] and swiftly jab it into the base to get it over with quickly... but it doesn’t hurt at all.");
			output("\n\nAlmost instantly, you feel a pleasant warmth developing at the injection spot, slowly spreading all the way up to the tip. Soon after, your [pc.cockNoun " + i + "] begins to rise in slow, throbbing fits to full mast, but it doesn’t stop there. The warmth is quickly replaced by an irritating, tingly feeling, and your [pc.cock " + i + "] begins fattening up, again starting at the base all the way to the tip. The tingling finally fades and you are left with a noticeably thicker wiener. You could stop here, or you could go for more; those holes ain’t gonna plug themselves--and what better to plug them with than a fat monster cock?");
			
			target.cocks[i].cThicknessRatioRaw += 0.1;
			target.changeLust(10);
			
			kGAMECLASS.clearMenu();
			kGAMECLASS.addButton(0,"Next",kGAMECLASS.useItemFunction);
		}
	}
}

