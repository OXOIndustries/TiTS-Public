package classes.Items.Transformatives
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
	
	public class EggBlueLarge extends ItemSlotClass
	{
		private var eggSize:String = "large";
		private var eggColor:String = "blue";
		
		public function EggBlueLarge()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 24;
			type = GLOBAL.FOOD;
			
			shortName = "Lg.BluEgg";
			longName = eggSize + ", " + eggColor + " egg";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = indefiniteArticle(eggSize) + ", " + eggColor + " egg";
			
			tooltip = kGAMECLASS.oviliumEggTooltip(eggSize, eggColor);
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			basePrice = 60;
			
			combatUsable = true;
			targetsSelf = true;
			
			version = _latestVersion;
		}
		
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			if(target is PlayerCharacter)
			{
				kGAMECLASS.eatOviliumEgg(eggSize, eggColor);
			}
			else
			{
				kGAMECLASS.npcEatOviliumEgg(target, eggSize, eggColor);
			}
			return false;
		}
	}
}

