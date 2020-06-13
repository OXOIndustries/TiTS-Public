package classes.Items.Apparel 
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.StringUtil;
	import classes.GameData.TooltipManager;
	import classes.Creature;
	
	public class SchoolgirlCostume extends ItemSlotClass
	{
		//Sexu schoolgrill.
		public function SchoolgirlCostume() 
		{
			_latestVersion = 1;
			
			quantity = 1;
			stackSize = 1;
			type = GLOBAL.CLOTHING;
			
			shortName = "S.Girl C.";
			
			longName = "schoolgirl costume";
			
			TooltipManager.addFullName(shortName, StringUtil.toTitleCase(longName));
			
			description = "a sexy schoolgirl costume";
			
			tooltip = "[altTooltip SchoolgirlCostume]";
			
			TooltipManager.addTooltip(shortName, tooltip);
			
			attackVerb = "";
			
			this.basePrice = 3400;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.sexiness = 5;
			this.critBonus = 0;
			this.evasion = 7;
			this.fortification = 0;
			
			resistances.tease.resistanceValue = 20.0;
			
			version = _latestVersion;
		}
		
		override public function onEquip(targetCreature:Creature, outputText:Boolean = false):void
		{
			targetCreature.createStatusEffect("Sexy Costume", 10, 0, 0, 0, false, "LustUp", "The outfit you are wearing is making you feel randier than usual.", false, 0, 0xB793C4);
		}
		
		override public function onRemove(targetCreature:Creature, outputText:Boolean = false):void
		{
			targetCreature.removeStatusEffect("Sexy Costume");
		}
	}
}
