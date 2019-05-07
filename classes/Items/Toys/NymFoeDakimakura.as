package classes.Items.Toys
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Interfaces.*;
	
	public class NymFoeDakimakura extends ItemSlotClass
	{
		public function NymFoeDakimakura()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 1;
			type = GLOBAL.SEXTOY;
			
			shortName = "NymFoeDaki";
			longName = "Nym-Foe Dakimakura";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a life-sized Nym-Foe body pillow";
			tooltip = "This is a lewd body pillow of Nym-Foe, the nurse you once fought in Badger’s lab. It has a picture of the robo-nurse on either side.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			basePrice = 4000;
			
			addFlag(GLOBAL.NOT_CONSUMED_BY_DEFAULT);
			
			version = _latestVersion;
		}	
		
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			if (target is PlayerCharacter) 
			{
				return kGAMECLASS.badgerNymFoeDakimakuraUse();
			}
			else
			{
				clearOutput();
				output(target.capitalA + target.short + " cannot use the Nym-Foe body pillow.");
			}
			return false;
		}
	}
}
