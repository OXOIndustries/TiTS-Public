package classes 
{
	import classes.Items.Miscellaneous.ZilRation;
	import classes.Resources.EmbeddedAssets;
	
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
		
		public static function HeliaStahp():void
		{
			var tImg:* = new EmbeddedAssets.Image_Helia();
			tImg.name = "ragetime";
			
			kGAMECLASS.clearOutput();
			kGAMECLASS.clearMenuProxy();
			
			kGAMECLASS.userInterface.mainTextField.visible = false;
			
			kGAMECLASS.stage.addChild(tImg);
			tImg.x = kGAMECLASS.userInterface.mainTextField.x;
			
			kGAMECLASS.userInterface.addButton(0, "PLZSTAHP", Cheats.OkStahp);
		}
		
		public static function OkStahp():void
		{
			kGAMECLASS.stage.removeChild(kGAMECLASS.stage.getChildByName("ragetime"));
			kGAMECLASS.userInterface.mainTextField.visible = true;
			
			if (kGAMECLASS.chars["PC"].short == "uncreated")
			{
				kGAMECLASS.mainMenu();
			}
			else
			{
				kGAMECLASS.mainGameMenu();
			}
		}
	}
}