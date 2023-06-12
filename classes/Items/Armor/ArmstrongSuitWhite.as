package classes.Items.Armor
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.StringUtil;
	import classes.GameData.TooltipManager;
	
	public class ArmstrongSuitWhite extends ItemSlotClass
	{
		//Level 6 (Common). Balance 2.0
		public function ArmstrongSuitWhite()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 1;
			
			type = GLOBAL.ARMOR;
			
			shortName = "PWA Suit";
			
			longName = "premium Armstrong suit";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a copy of a white suit made for Liriel Armstrong";
			
			tooltip = "The Premium Armstrong Suit is a white outfit made of fabric that is latex-tight, yet silky smooth against the skin. The suit itself leaves little to the imagination, with holes designed to leave your ass, chest and groin free for easy access. Regardless, you probably shouldn’t wear this anywhere you can’t walk around naked. As an added bonus, special microbots within the fabric help to enhance your shields.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			attackVerb = "";
			
			basePrice = 3800;
			attack = 0;
			defense = 0;
			shields = 20;
			sexiness = 5;
			critBonus = 0;
			evasion = 10;
			fortification = 0;
			
			resistances.tease.resistanceValue = 10.0;
			// Note: The Premium White Armstrong Suit is meant to be a teasing item but as the genitals are exposed the character should still be flagged for being naked if possible. If not the description/tooltip can be modified upon request.
			itemFlags = [];
			itemFlags.push(GLOBAL.ITEM_FLAG_SWIMWEAR);
			itemFlags.push(GLOBAL.ITEM_FLAG_EXPOSE_FULL);
			
			version = _latestVersion;
		}
	}
}
