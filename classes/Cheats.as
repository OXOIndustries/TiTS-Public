package classes 
{
	import classes.Items.Miscellaneous.ZilRation;
	import classes.Resources.StatusIcons;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class Cheats 
	{
		
		public function Cheats() 
		{
			
		}
		
		public static function OutputStuff():void
		{
			kGAMECLASS.clearOutput();
			kGAMECLASS.output("Cheat Activated!\n");
		}
		
		public static function GiveZilRations():void
		{
			Cheats.OutputStuff();
			
			var lootArray:Array = new Array();
			var loot:ZilRation = new ZilRation();
			loot.quantity = 5;
			lootArray.push(loot);
			kGAMECLASS.itemCollect(lootArray);
		}
	}
}