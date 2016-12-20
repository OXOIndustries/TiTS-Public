package classes.Items.Miscellaneous
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;	
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Interfaces.*;
	
	public class Curdsonwhey extends ItemSlotClass
	{
		public function Curdsonwhey()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 10;
			type = GLOBAL.DRUG;
			
			shortName = "Curdsonwhey";
			longName = "bottle of Ovilium";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a curdsonwhey lozenge";
			
			tooltip = "This medicine is based upon a traditional myr remedy, administered to counteract the hormones released by bothrioc impregnation. It appears as a rather unappetizing, large brown lozenge.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			basePrice = 300;
			
			version = _latestVersion;
		}
		
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			kGAMECLASS.clearOutput();
			if(target is PlayerCharacter)
			{
				output("You pop the lozenge into your mouth. Ugh! So bitter. With some effort you swallow, carrying the unpleasant flavor away from your taste buds and down to your gut.");
			}
			else
			{
				kGAMECLASS.output(target.capitalA + target.short + " gobs the pill to no effect.");
			}
			return false;			
		}
	}
}
