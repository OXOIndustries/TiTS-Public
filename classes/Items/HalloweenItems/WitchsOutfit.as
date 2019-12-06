package classes.Items.HalloweenItems
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.StringUtil;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.GameData.TooltipManager;
	import classes.Engine.Interfaces.output;
	import classes.Engine.Interfaces.clearOutput;
	import classes.Characters.PlayerCharacter;
	import classes.Items.HalloweenItems.WitchsRobe;
	import classes.Items.HalloweenItems.WitchsCorset;
	import classes.Items.HalloweenItems.WitchsPanty;
	
	//Level 6 (Common). Balance 2.0
	public class WitchsOutfit extends ItemSlotClass
	{
		public function WitchsOutfit()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 1;
			
			type = GLOBAL.GADGET;
			
			shortName = "Witch.O";
			
			longName = "packaged witch’s outfit";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a packaged witch’s outfit";
			
			tooltip = "Advertised as a fetishized witch outfit, this package contains everything you need to look like the spookiest enchanter around!\n\n(<b>Using this item will consume it and cause you to loot three wearable costume pieces.</b>)";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			attackVerb = "";
			
			basePrice = 3000;
			attack = 0;
			defense = 0;
			shields = 0;
			sexiness = 0;
			critBonus = 0;
			evasion = 0;
			fortification = 0;
			
			//resistances.burning.resistanceValue = 10.0;
			//resistances.freezing.resistanceValue = 10.0;
			
			// Note: Since the suit creates a stable environment any gaseous based damage wouldn't work against it.
			itemFlags = [];
			//itemFlags.push(GLOBAL.ITEM_FLAG_AIRTIGHT);
			
			version = _latestVersion;
		}
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			if(target is PlayerCharacter)
			{
				clearOutput();
				output("You start removing the witch outfit from its packaging. With the first scraps of plastic removed, you begin to examine the contents.");
				output("\n\nFirst is the hat, black and pointed. Despite being squished in the package for Void knows how long, it readily snaps back to shape. Running your hands through the fabric, you feel the softness of the fabric, as well as an unexpected resistance. Clearly there is some hidden technology that allows the hat to retain it’s pointy shape.");
				output("\n\nNext comes the robe, soft and flowing. Black velvet ripples at your touch, causing the unearthed garment to shimmer with reflected brilliance. Lifting it up, you see that it won’t cover the chest... or anything below the chest. " + (target.exhibitionism() >= 33 ? "You grin at the thought, the prospect of wearing this outfit au natural fresh on your mind":"Sighing, you set the robe aside, hoping something remaining in the package will provide at least an illusion of modesty") + ".");
				output("\n\nThe rest of the package is filled with numerous knicknacks: Various leather accessories, a corset, shiny black boots and a pair of panties. Disposing of the packaging, you gather up the unpackaged outfit.\n\n");
				//Consume even if infinite items:
				if(kGAMECLASS.infiniteItems()) quantity--;
				//Take new costume pieces.
				kGAMECLASS.quickLoot(new WitchsRobe(), new WitchsPanty(), new WitchsCorset());
				return true;
			}
			else
			{
				kGAMECLASS.clearOutput();
				kGAMECLASS.output("Nope.");
			}
			return false;
		}

	}
}
