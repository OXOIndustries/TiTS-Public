package classes.Items.Treasures 
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.kGAMECLASS;
	import classes.Creature;
	import classes.StringUtil;
	import classes.Items.Armor.SpacesuitIncomplete;
	import classes.Items.Armor.SpacesuitComplete;
	import classes.Characters.PlayerCharacter;
	
	public class SpacesuitHelmet extends ItemSlotClass
	{
		public function SpacesuitHelmet() 
		{
			_latestVersion = 1;

			quantity = 1;
			stackSize = 1;
			type = GLOBAL.GADGET;
			
			shortName = "Sp.Helmet";
			
			longName = "spacesuit helmet";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a spacesuit helmet";
			
			tooltip = "This primitive helmet boasts an airtight locking collar for use with a separate spacesuit. By combining the two together, you should be safe from the vacuum of space.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			attackVerb = "null";
			
			basePrice = 300;
			attack = 0;
			defense = 0;
			shieldDefense = 0;
			shields = 0;
			sexiness = 0;
			critBonus = 0;
			evasion = 0;
			fortification = 0;
			
			version = _latestVersion;
		}
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			kGAMECLASS.clearOutput();
			if (!(target is PlayerCharacter))
			{
				kGAMECLASS.output(target.capitalA + target.short + " has no use for this.");
				return false;
			}
			if(target.armor is SpacesuitIncomplete)
			{
				kGAMECLASS.output("You snap the helmet onto the incomplete spacesuit to make an airtight garment capable of protecting you from the harsh vacuum of space. Good thing you were already wearing it! <b>Now you have a complete spacesuit, and you're dressed for vacuum!</b>");
				target.armor = new SpacesuitComplete();
				target.destroyItemByClass(SpacesuitHelmet);
				return false;
			}
			else if(target.hasItemByClass(SpacesuitIncomplete))
			{
				//if(!kGAMECLASS.infiniteItems()) quantity++;
				kGAMECLASS.output("You snap the helmet onto the incomplete spacesuit to make an airtight garment capable of protecting you from the harsh vacuum of space.");
				target.destroyItemByClass(SpacesuitIncomplete);
				target.destroyItemByClass(SpacesuitHelmet);
				kGAMECLASS.quickLoot(new SpacesuitComplete());
				return true;
			}
			else
			{
				if(!kGAMECLASS.infiniteItems()) quantity++;
				kGAMECLASS.output("You need to find a spacesuit to combine with this!");
			}
			return false;
		}
	}
}
