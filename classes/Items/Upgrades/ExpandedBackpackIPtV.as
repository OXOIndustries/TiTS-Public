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
	
	public class ExpandedBackpackIPtV extends ItemSlotClass
	{
		
		public function ExpandedBackpackIPtV() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.GADGET;
			
			this.shortName = "(18s)Pack";
			this.longName = "nyrean pack";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a nyrean pack";
			
			this.tooltip = "Nyrea may not wear much in the way of clothing, but they understand the importance of securing stashes of food and plunder. As such, they've created a far finer pack than you'd expect from such an uncouth race. The fabric is woven from a fibrous, organic material - probably something mushroom based. A few extra pouches and pockets provide places for smaller items to be secured, while the primary storage space is exceedingly voluminous. Hand-shaped mineral rods provide a stable frame, and the addition of a belt strap allows for more efficient weight distribution.\n\n(Using this item will raise your base inventory slots to 18 if not yet upgraded, <b>consuming this item in the process</b>. It will not have any effect on larger inventories.)";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.basePrice = 12000;
			
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
			if(target.statusEffectv1("Backpack Upgrade") >= 8)
			{
				output("This backpack isn't any better than what you're already using.");
				if(!kGAMECLASS.infiniteItems()) quantity++;
				return false;
			}
			else
			{
				output("You discard your previous equipment and don the new pack. It's as comfy as it is well-crafted, and with it, you'll be toting far more prizes back to your ship.");
				if(!target.hasStatusEffect("Backpack Upgrade")) target.createStatusEffect("Backpack Upgrade");
				target.setStatusValue("Backpack Upgrade",1,8);
			}
			return false;
		}
	}
}