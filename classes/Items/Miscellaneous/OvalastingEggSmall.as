package classes.Items.Miscellaneous
{
	import classes.Engine.Interfaces.*;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;	
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Utility.indefiniteArticle;
	
	public class OvalastingEggSmall extends ItemSlotClass
	{
		public function OvalastingEggSmall()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 20;
			type = GLOBAL.GADGET;
			
			shortName = "Sm.OvaEgg";
			longName = "small, pink Ovalasting egg";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a small, pink Ovalasting egg";
			
			tooltip = "Cleaned up, these things are slightly bigger than chicken eggs. They look remarkably wholesome, good enough to eat, although an experimental nibble is enough to dispel that notion. Still, their hard yet uniquely absorbent nature surely makes them worth something? If you’re shameless enough to present them at a pawnshop, anyway.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			basePrice = 5;
			
			isUsable = false;
			
			version = _latestVersion;
		}
	}
}

