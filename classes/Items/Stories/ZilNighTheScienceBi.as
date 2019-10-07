package classes.Items.Stories
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.inCombat;
	import classes.Engine.Map.InShipInterior;
	import classes.GameData.CodexManager;
	
	public class ZilNighTheScienceBi extends ItemSlotClass
	{
		public function ZilNighTheScienceBi()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.GADGET;
			
			this.shortName = "Vid: ZNtSB";
			this.longName = "code for “Zil Nigh the Science Bi”";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a video-chip for “Zil Nigh the Science Bi”";
			
			this.tooltip = "Using this item in your ship will add the video “Zil Nigh the Science Bi” to your ship’s smut menu.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.basePrice = 100;

			this.addFlag(GLOBAL.NOT_CONSUMED_BY_DEFAULT);
			
			this.version = _latestVersion;
		}
		
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			if(target is PlayerCharacter)
			{
				kGAMECLASS.clearOutput();
				if(target.hasKeyItem("Video - Zil Nigh the Science Bi")) kGAMECLASS.output("You realize that you already have this video and put away the useless chip.");
				else if (!InShipInterior()) kGAMECLASS.output("Try as you might to squint hard enough to see the bits in this chip, you'll need your ship's video display to watch this.");
				else
				{
					kGAMECLASS.zilNightScienceBiPlay();
					target.createKeyItem("Video - Zil Nigh the Science Bi");
					target.destroyItemByReference(this);
				}
			}
			else
			{
				kGAMECLASS.output("Nope.");
			}
			return false;
		}
	}
}
