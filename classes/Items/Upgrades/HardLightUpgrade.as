package classes.Items.Upgrades 
{
	import classes.Creature;
	import classes.Characters.PlayerCharacter;
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Interfaces.*;
	
	public class HardLightUpgrade extends ItemSlotClass
	{
		
		public function HardLightUpgrade() 
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 1;
			this.type = GLOBAL.GADGET;
			
			this.shortName = "HLU";
			this.longName = "hardlight upgrade module";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			this.description = "a hardlight upgrade module";
			
			this.tooltip = "This sophisticated electronics package is designed to work with the latest in solid photon phalli. Simply place the low-profile modules against the intended garment, and they will automatically integrate themselves into the subsystems - and bind themselves in place. Best of all, they are easy to remove and reuse, allowing you to have full control over the size of any future holo-dong on the go!\n\n(Using this item will place the “Hardlight Strap-on Upgrades” in your Key Items, potentially unlocking more scenes for use with your equipment.)";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.basePrice = 8500;
			
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
			
			output("You open up the package and skim through the directions.");
			if(target.hasHardLightEquipped()) output(" After a minute to familiarize yourself with the pieces, you’re able to attach a few control pieces to your hardlight-packing garments. This could make for some fun in the future!");
			else output(" After a minute to familiarize yourself with the pieces, you realize they won’t do you much good if you don’t have hardlight-equipped undies. Maybe a vendor on Tavros could help you out with that? At least the pieces are small enough not to take up any space.");
			if(!target.hasKeyItem("Hardlight Strap-on Upgrades"))
			{
				output("\n\n(<b>Key Item Gained:</b> Hardlight Strap-on Upgrades! Used for underwear with a hardlight strap-on function.)");
				target.createKeyItem("Hardlight Strap-on Upgrades");
			}
			return false;
		}
	}
}