package classes.Items.Toys
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.inCombat;
	import classes.GameData.CodexManager;
	
	public class TwinsVRProgram extends ItemSlotClass
	{
		public function TwinsVRProgram()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.GADGET;
			
			this.shortName = "Twins VR";
			this.longName = "twins VR program";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a virtual reality program for fighting 'the twins'";
			
			this.tooltip = "Using this item will unlock a virtual reality version of two of Doctor Po’s most virulent creations, already subdued and begging you for a good time.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.basePrice = 100;
			
			this.version = _latestVersion;
		}
		
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			if(target is PlayerCharacter)
			{
				kGAMECLASS.clearOutput();
				kGAMECLASS.output("You can now access simulated sexdoll combat with compatible VR devices.");
				kGAMECLASS.pc.createKeyItem("VR Program: The Twins");
			}
			else
			{
				kGAMECLASS.output("Nope.");
			}
			return false;
		}
	}
}
