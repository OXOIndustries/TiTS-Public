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
			if (kGAMECLASS.pc.short == "uncreated")
			{
				return;
			}
			
			Cheats.OutputStuff();
			
			var lootArray:Array = new Array();
			var loot:ZilRation = new ZilRation();
			loot.quantity = 5;
			lootArray.push(loot);
			kGAMECLASS.itemCollect(lootArray);
		}
		
		public static function RoomTeleport():void
		{
			if (kGAMECLASS.pc.short == "uncreated")
			{
				return;
			}
			
			Cheats.OutputStuff();
			
			kGAMECLASS.output("\nGimme a room name to TP to cheater!");
			kGAMECLASS.displayInput();
			kGAMECLASS.clearMenu();
			kGAMECLASS.addButton(0, "Tele", Cheats.TryRoomTeleport);
			kGAMECLASS.addButton(1, "Nah", Cheats.BackOutFromTeleport);
		}
		
		public static function TryRoomTeleport():void
		{
			if (kGAMECLASS.userInterface.textInput.text == "")
			{
				Cheats.RoomTeleport();
				kGAMECLASS.output("\n\n\n\nYou gots to gimme a room name yo.");
				return;
			}
			
			if (kGAMECLASS.rooms[kGAMECLASS.userInterface.textInput.text] == undefined)
			{
				Cheats.RoomTeleport();
				kGAMECLASS.output("\n\n\n\nCouldn't find yo room. Wakka wakka.");
				return;
			}
			
			var room:String = kGAMECLASS.userInterface.textInput.text;
			kGAMECLASS.removeInput();
			kGAMECLASS.move(room);
		}
		
		public static function BackOutFromTeleport():void
		{
			kGAMECLASS.removeInput();
			kGAMECLASS.mainGameMenu();
		}
	}
}