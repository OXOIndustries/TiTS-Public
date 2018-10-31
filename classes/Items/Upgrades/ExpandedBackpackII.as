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
	
	public class ExpandedBackpackII extends ItemSlotClass
	{
		
		public function ExpandedBackpackII() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.GADGET;
			
			this.shortName = "(20s)Pack";
			this.longName = "deluxe backpack";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a deluxe backpack";
			
				this.tooltip = "This deluxe backpack is the absolute pinnacle of hand-woven storage. Reinforced fabric ensures a comfortable surface that’s as soft against your skin as it is against the valuables inside, supported by a self-repairing layer filled with maintenance microbots in case of damage. Over fifteen pockets, pouches, and mesh nets allow for massive storage of a variety of items. Finally, someone has sewn a small gravity buffer into the bottom to reduce the overall carry weight, so long as you remember to charge it between journeys.\n\n(Using this item will raise your base inventory slots to 20 if not yet upgraded, <b>consuming this item in the process</b>. It will not have any effect on larger inventories.)";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.basePrice = 25000;
			
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
			if(target.statusEffectv1("Backpack Upgrade") >= 10)
			{
				output("This backpack isn’t any better than what you’re already using.");
				if(!kGAMECLASS.infiniteItems()) quantity++;
				return false;
			}
			else
			{
				output("You discard your previous equipment and don the new pack. It’s as comfy as it looks, and with it, you’ll be toting far more prizes back to your ship.");
				if(!target.hasStatusEffect("Backpack Upgrade")) target.createStatusEffect("Backpack Upgrade");
				target.setStatusValue("Backpack Upgrade",1,10);
			}
			return false;
		}
	}
}