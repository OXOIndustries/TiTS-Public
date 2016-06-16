package classes.Items.Transformatives
{
	import classes.Characters.PlayerCharacter;
	import classes.Creature;
	import classes.Engine.Interfaces.*;
	import classes.Engine.Utility.*;
	import classes.GameData.TooltipManager;
	import classes.GLOBAL;
	import classes.Items.Miscellaneous.ImmunoBooster;
	import classes.ItemSlotClass;
	import classes.kGAMECLASS;
	import classes.StringUtil;
	import classes.Util.*;

	/**
	 * Vulpine transformative, Uveto edition.
	 * 
	 * @see Foxfire for main part.
	 */
	public class Frostfire extends ItemSlotClass
	{
		private var counter:int = 0;
		private var options:Array = [];
		
		public function Frostfire(dataObject:Object=null)
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.POTION;
			//Used on inventory buttons
			this.shortName = "Frostfire";
			//Regular name
			this.longName = "a vial labelled Frostfire";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a vial of Frostfire";
			//Displayed on tooltips during mouseovers
			this.tooltip = "After the questionable success of Catnip (Effective, but overly expensive), Stellar Furnace worked hard on developing an affordable alternative in their line of TF-solutions. This vial of hair dye is actually a rather unique transformative, created with ancient technology of symbiotic fungi rather than modern microsurgeons. After application it takes root, slowly but reliably transforming its host towards an animalistic vulpine form. This specific variation is greatly altered to provide efficient natural protection against harsh environments, by a combination of a thick fur coat and metabolism tuning to create effective heterothermic heat management.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 7000; // LeithaCharm effectively have 8750 credits cost and is reusable...
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			this.combatUsable = false;
			this.targetsSelf = true;
			
			this.addFlag(GLOBAL.NOT_CONSUMED_BY_DEFAULT);
			
			this.version = this._latestVersion;
		}
		
		//METHOD ACTING!
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			clearOutput();
			if (target is PlayerCharacter)
			{
				return Foxfire.useMenu(target, Frostfire);
			}
			//Not player!
			else
			{
				output(target.capitalA + target.short + " doesn't seem interested in using this item....");
			}
			return false;
		}
	}
}
