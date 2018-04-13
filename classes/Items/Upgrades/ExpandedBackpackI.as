package classes.Items.Upgrades 
{
	import classes.Creature;
	import classes.Characters.PlayerCharacter;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Interfaces.*;
	import classes.kGAMECLASS;
	
	public class ExpandedBackpackI extends ItemSlotClass
	{
		
		public function ExpandedBackpackI() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.GADGET;
			
			this.shortName = "(15s)Pack";
			this.longName = "large backpack";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a large backpack";
			
			this.tooltip = "This traditional-style backpack is anything but traditional in construction. Instead of fabric, it is woven from an exotic spun metal. It has at least ten different pouches in addition to the sizeable main compartment. The straps are padded for comfort and lined with a nanite-infused sweat-wicking system to keep you clean, dry, and comfortable on the move.\n\n(Using this item will raise your base inventory slots to 15 if not yet upgraded, <b>consuming this item in the process</b>. It will not have any effect on larger inventories.)";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.basePrice = 9000;
			
			this.version = this._latestVersion;
		}
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			clearOutput();
			if (!(target is PlayerCharacter))
			{
				output(target.capitalA + target.short + " thanks you for the generous gift.");
				return false;
			}
			if(target.statusEffectv1("Backpack Upgrade") >= 5)
			{
				output("This backpack isn’t any better than what you’re already using.");
				if(!kGAMECLASS.infiniteItems()) quantity++;
				return false;
			}
			else
			{
				output("You discard your previous equipment and don the new pack. It’s as comfy as it looks, and with it, you’ll be toting far more prizes back to your ship.");
				if(!target.hasStatusEffect("Backpack Upgrade")) target.createStatusEffect("Backpack Upgrade");
				target.setStatusValue("Backpack Upgrade",1,5);
			}
			return false;
		}
	}
}