package classes.Items.Transformatives
{	
	import classes.GLOBAL;
	import classes.Creature;
	import classes.StringUtil;
	import classes.ItemSlotClass;
	import classes.GameData.TooltipManager;
	import classes.Engine.Interfaces.output;

	public class OrefishShard extends ItemSlotClass
	{
		public function OrefishShard()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 20;
			type = GLOBAL.PILL;
			shortName = "O.F. Shard";
			longName = "Orefish Shard";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a hard tablet labeled 'Orefish Shard'";
			tooltip = "Originally distributed as a mineral-rich pick-me-up for saurmorians situated far from Molis, this product became obsolete once advances in medicine and genetics allowed their metabolism to properly absorb the nutrients needed from alien foods. Later interest from Xenogen, however, led to a co-developed gene-therapy mod under the same name - saurmorian hierarchy having been assured of the potential profit.\n\nThe rebranded shard is an iridescent lozenge shaped like a thick fish scale - though no longer from an actual orefish - and packed with potent nanomachines that cause the consumer to gain authentic saurmorian features. It's surprisingly heavy for such a small item.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			attackVerb = "glitch";
			
			basePrice = 750;
			
			version = _latestVersion;
		}
		
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			output("stuf");
			return true;
		}
	}
}