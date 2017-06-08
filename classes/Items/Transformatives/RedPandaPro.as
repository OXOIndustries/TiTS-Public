package classes.Items.Transformatives
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class RedPandaPro extends ItemSlotClass
	{
		public function RedPandaPro()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 10;
			type = GLOBAL.PILL;
			
			shortName = "R.PandaPro+";
			longName = "Red Panda Pro Plus";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a medipen labeled ‘Red Panda Pro Plus’";
			tooltip = "A sister brand to the transformative, ‘Panda Pro’, this medipen is half red, half black and stamped with flashier logos than its older counterpart. Manufactured by Xenogen Biotech, Red Panda Pro Plus is the treatment for those who want to gain the red panda look with no strings attached. Contained in an injectable medipen, its bevy of gene-reprogramming microsurgeons packing extended program buffers are sure to give any user the fuzzier, cute look they’ve always wanted. A small sticker on the side of the packaging displays a claim that the product has gone through rigorous testing so that it no longer affects a user’s body shape, extremities, or reflexes. Great!";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			basePrice = 32000;
			
			version = _latestVersion;
		}
		
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			RedPandaneen.RedPandaTFs(target, true);
			return false;
		}
	}
}

