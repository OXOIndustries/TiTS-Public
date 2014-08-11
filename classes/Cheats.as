package classes 
{
	import classes.Characters.PlayerCharacter;
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
			if (kGAMECLASS.pc.short == "uncreated" || kGAMECLASS.pc.short.length == 0)
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
		
		public static function XPToLevel():void
		{
			if (kGAMECLASS.pc.short == "uncreated" || kGAMECLASS.pc.short.length == 0)
			{
				return;
			}
			
			Cheats.OutputStuff();
			kGAMECLASS.output("\n\nGiving XP to next level!");
			(kGAMECLASS.pc as PlayerCharacter).XPRaw = (kGAMECLASS.pc as PlayerCharacter).XPMax();
		}
		
		public static function RoomTeleport():void
		{
			if (kGAMECLASS.pc.short == "uncreated" || kGAMECLASS.pc.short.length == 0)
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
		
		public static function SceneExecute():void
		{
			if (kGAMECLASS.pc.short == "uncreated" || kGAMECLASS.pc.short.length == 0)
			{
				return;
			}
			
			Cheats.OutputStuff();
			
			kGAMECLASS.output("\nGive a target scene function name to execute.");
			kGAMECLASS.displayInput();
			kGAMECLASS.clearMenu();
			kGAMECLASS.addButton(0, "Execute", Cheats.TrySceneExecute);
			kGAMECLASS.addButton(1, "Nah", Cheats.BackOutFromTeleport);
		}
		
		public static function TrySceneExecute():void
		{
			if (kGAMECLASS.userInterface.textInput.text == "")
			{
				Cheats.SceneExecute();
				kGAMECLASS.output("\n\n\n\nYou gots to gimme a scene name yo.");
				return;
			}
			
			var func:String = kGAMECLASS.userInterface.textInput.text;
			
			if (kGAMECLASS.IsFunction(func))
			{
				try
				{
					kGAMECLASS.ExecuteFunction(func);
					kGAMECLASS.removeInput();
					// A marker to make an informed decision about a bug reporters method of potentially encountering a bug. If the flag is set, ima be asking questions.
					kGAMECLASS.flags["USED SCENE EXECUTE FUNCTION"] = 1; 
				}
				catch (e:Error)
				{
					kGAMECLASS.output("\n\n\n\nERROR: ");
					kGAMECLASS.output("\n\n" + e.name);
					kGAMECLASS.output("\n" + e.message);
				}
			}
			else
			{
				kGAMECLASS.output("\n\n\n\nNot a valid function name, welp.");
				return;
			}
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