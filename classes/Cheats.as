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
		
		public static function OutputStuff(light:Boolean = false):void
		{
			kGAMECLASS.clearOutput();
			kGAMECLASS.output("Cheat Activated!\n");
			
			if(!light)
			{
				kGAMECLASS.clearMenu();
				kGAMECLASS.addButton(0, "Next", kGAMECLASS.mainGameMenu);
			}
		}
		
		public static function GiveZilRations():void
		{
			if (kGAMECLASS.pc.short == "uncreated" || kGAMECLASS.pc.short.length == 0)
			{
				return;
			}
			
			Cheats.OutputStuff(true);
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
		
		public static function infiniteItemUse():void
		{
			if (kGAMECLASS.pc.short == "uncreated" || kGAMECLASS.pc.short.length == 0)
			{
				return;
			}
			
			Cheats.OutputStuff();
			if(kGAMECLASS.flags["INFINITE_ITEMS"] == undefined)
			{
				kGAMECLASS.output("\n<b>Items can now be used infinitely.");
				kGAMECLASS.flags["INFINITE_ITEMS"] = 1;
			}
			else
			{
				kGAMECLASS.output("\n<b>Items can no longer be used indefinitely.");
				kGAMECLASS.flags["INFINITE_ITEMS"] = undefined;
			}
		}
		public static function exploreUnlock():void
		{
			if (kGAMECLASS.pc.short == "uncreated" || kGAMECLASS.pc.short.length == 0)
			{
				return;
			}
			
			Cheats.OutputStuff();
			kGAMECLASS.output("\n<b>All locations have been unlocked.</b>");
			kGAMECLASS.flags["UNLOCKED_JUNKYARD_PLANET"] = 1;
			kGAMECLASS.flags["PLANET_3_UNLOCKED"] = 1;
			kGAMECLASS.flags["NEW_TEXAS_COORDINATES_GAINED"] = 1;
			kGAMECLASS.flags["HOLIDAY_OWEEN_ACTIVATED"] = kGAMECLASS.GetGameTimestamp();
			kGAMECLASS.flags["UVETO_UNLOCKED"] = 1;
		}
		public static function toggleDebug():void
		{
			if (kGAMECLASS.pc.short == "uncreated" || kGAMECLASS.pc.short.length == 0)
			{
				return;
			}
			
			Cheats.OutputStuff();
			if(!kGAMECLASS.debug)
			{
				kGAMECLASS.output("\n<b>Debug mode enabled. Expect broken shit.");
				kGAMECLASS.debug = true;
			}
			else
			{
				kGAMECLASS.output("\n<b>Debug mode disabled. Atta " + kGAMECLASS.pc.mf("boy","girl") + "!");
				kGAMECLASS.debug = false;
			}
		}
		public static function RoomTeleport():void
		{
			if (kGAMECLASS.pc.short == "uncreated" || kGAMECLASS.pc.short.length == 0)
			{
				return;
			}
			
			Cheats.OutputStuff(true);
			
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
			
			Cheats.OutputStuff(true);
			
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
		
		// Treatment Haxxx
		public static function TryTreatmentHaxCowGirl():void { TryTreatmentHax(0); }
		public static function TryTreatmentHaxBull():void { TryTreatmentHax(1); }
		public static function TryTreatmentHaxCumCow():void { TryTreatmentHax(2); }
		public static function TryTreatmentHaxFauxCow():void { TryTreatmentHax(3); }
		public static function TryTreatmentHaxAmazon():void { TryTreatmentHax(4); }
		public static function TryTreatmentHaxDouble():void { TryTreatmentHax(5); }
		public static function TryTreatmentHaxMini():void { TryTreatmentHax(6); }
		private static function TryTreatmentHax(variant:int = -1):void
		{
			if(variant >= 0)
			{
				var msg:String = "\nNext Treatment dose is a guaranteed ";
				
				switch(variant)
				{
					case 0: msg += "Cow-Girl"; break;
					case 1: msg += "Bull"; break;
					case 2: msg += "Cum-Cow"; break;
					case 3: msg += "Faux-Cow"; break;
					case 4: msg += "Amazon"; break;
					case 5: msg += "Double Stud"; break;
					case 6: msg += "Undersized"; break;
				}
				msg += "!";
				
				kGAMECLASS.flags["TREATMENT_HAX"] = variant;
				
				Cheats.OutputStuff();
				kGAMECLASS.output(msg);
			}
		}
	}
}
