package classes.Items.Transformatives
{	
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.StringUtil;
	import classes.ItemSlotClass;
	import classes.GameData.TooltipManager;
	import classes.Engine.Interfaces.author;
	import classes.Engine.Interfaces.output;

	public class Reptilum extends ItemSlotClass
	{
		public function Reptilum()
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 20;
			type = GLOBAL.PILL;
			shortName = "Reptilum";
			longName = "Reptilum";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a brightly packaged bottle of murky liquid labeled 'Reptilum'";
			tooltip = "This package contains a bottle of murky, gray liquid, all but hidden by layers of brightly colored packaging and gaudy decals. Originally created during an early rush for settlers acclimating onto a tropical planet, this transformative has undergone many iterations through the generations. Consuming the contents of the bottle should grant a sleek, reptilian form.";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			attackVerb = "error";
			
			basePrice = 1000;
			
			version = _latestVersion;
		}
		
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			kGAMECLASS.clearMenu();
			kGAMECLASS.clearOutput();
			author("Zavos");
			
			output("You unscrew the cap on the bottle and begin to drink. The taste is bitter and dry, but smooth enough that you don’t immediately retch it back up. Before you know it, the bottle is empty, though you are sure you have not drunk more than two or three mouthfuls. You set the bottle down, bracing yourself for whatever transformations might come.");
			return true;
		}
	}
}