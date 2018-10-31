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
	import classes.GameData.CodexManager;
	
	public class MindwashVisor extends ItemSlotClass
	{
		//constructor
		public function MindwashVisor()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.GADGET;
			//Used on inventory buttons
			this.shortName = "MW Visor";
			//Regular name
			this.longName = "mindwash visor";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a mindwash visor";
			//Displayed on tooltips during mouseovers
			this.tooltip = "A pair of shallow, nipple-like plates that - once attached to the head - link via a hardlight holo-screen. Apparently Badger heavily modified this so that it broadcasts porn directly onto your memories, as if they were little more than blank canvas. Dangerous to use out in the open, so you’ll have to install it in your ship if you want to try it out.\n\n<b>Requires ship installation.</b>\n<b>Known to cause low to extreme amounts of taint. Check your Codex for details.</b>";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			//Information
			this.basePrice = 5250;
			
			this.addFlag(GLOBAL.NOT_CONSUMED_BY_DEFAULT);
			
			this.version = this._latestVersion;
		}
		
		//METHOD ACTING!
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			if(target is PlayerCharacter)
			{
				kGAMECLASS.installTheMindwashVisor();
			}
			//Not player!
			else
			{
				clearOutput();
				output(target.capitalA + target.short + " takes a look at the visor, then shakes " + target.mfn("his","her","its") + " head.");
			}
			return false;
		}
	}
}

