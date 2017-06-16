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
	
	public class OvalastingEggLarge extends ItemSlotClass
	{
		public function OvalastingEggLarge()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 10;
			type = GLOBAL.GADGET;
			
			shortName = "Lg.OvaEgg";
			longName = "large, pink Ovalasting egg";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a large, pink Ovalasting egg";
			
			tooltip = "Cleaned up, these things are about the size of an ostrich egg. Looking at them, it’s a slightly frightening miracle that you were able to produce them, a testament to your remarkably well-trained and nurturing body. Their hard yet uniquely absorbent nature surely makes them worth something? If you’re shameless enough to present them at a pawnshop, anyway.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			basePrice = 20;
			
			isUsable = false;
			
			version = _latestVersion;
		}
	}
}

