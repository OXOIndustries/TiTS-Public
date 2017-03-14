package classes.Items.Miscellaneous
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;	
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class Ovilium extends ItemSlotClass
	{
		public function Ovilium()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 10;
			type = GLOBAL.PILL;
			
			shortName = "Ovilium";
			longName = "bottle of Ovilium";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a bottle of Ovilium";
			
			tooltip = "This bottle of Ovilium is about as tall as the average shampoo container. Its curved sides are shaped like an elongated valentine heart. The cap is a small glass egg, and through it, you can see the soft white glow of the liquid inside. The bottle itself is smooth like porcelain, but made of a much more resilient material.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			basePrice = 300;
			
			version = _latestVersion;
		}
		
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			kGAMECLASS.clearOutput();
			if(target is PlayerCharacter)
			{
				kGAMECLASS.oviliumEffects();
			}
			else
			{
				kGAMECLASS.output(target.capitalA + target.short + " drinks the Ovilium to no effect.");
			}
			return false;			
		}
	}
}
