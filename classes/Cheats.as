package classes 
{
	import classes.Characters.PlayerCharacter;
	import classes.Items.Miscellaneous.ZilRation;
	import classes.Resources.StatusIcons;
	import classes.Engine.Interfaces.*;
	
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
		public static function MitziUnlock():void
		{
			if (kGAMECLASS.pc.short == "uncreated" || kGAMECLASS.pc.short.length == 0)
			{
				return;
			}
			Cheats.OutputStuff(true);
			kGAMECLASS.flags["MITZI_RESCUED"] = (kGAMECLASS.GetGameTimestamp() - (60*24*8));
			//if(kGAMECLASS.flags["MITZI_RESCUED"] < 0) kGAMECLASS.flags["MITZI_RESCUED"] = 0;
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
			kGAMECLASS.flags["CANADA_UNLOCKED"] = 1;

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
			kGAMECLASS.addButton(1, "Nah", Cheats.cheatsReturnToMain);
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
			kGAMECLASS.userInterface.textInput.text = "";
			kGAMECLASS.clearMenu();
			kGAMECLASS.addButton(0, "Execute", Cheats.TrySceneExecute);
			kGAMECLASS.addButton(1, "Args", Cheats.SceneExecuteArgs);
			kGAMECLASS.addButton(2, "Nah", Cheats.cheatsReturnToMain);
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
		
		public static function SceneExecuteArgs():void
		{
			if (kGAMECLASS.userInterface.textInput.text == "")
			{
				Cheats.SceneExecute();
				kGAMECLASS.output("\n\n\n\nYou gots to gimme a scene name yo.");
				return;
			}
			
			var func:String = kGAMECLASS.userInterface.textInput.text;
			
			if (!kGAMECLASS.IsFunction(func))
			{
				kGAMECLASS.output("\n\n\n\nNot a valid function name, welp.");
				return;
			}
			
			OutputStuff(true);
			output("\nSmash in a JSON formatted string of arguments.\n\nYou will have to quote string arguments \"like so\".\n\nIf you want more than a single argument, you will have to wrap them in \\\[ \\\] like this:\n\\\[\"mystringarg\", 123456\\\].");
			kGAMECLASS.removeInput();
			kGAMECLASS.displayInput();
			kGAMECLASS.userInterface.textInput.text = "";
			
			clearMenu();
			addButton(0, "Execute", GoSceneExecuteArgs, func);
			addButton(1, "Nah", cheatsReturnToMain);
		}
		
		public static function GoSceneExecuteArgs(func:String):void
		{
			if (kGAMECLASS.userInterface.textInput.text == "")
			{
				try
				{
					kGAMECLASS.ExecuteFunction(func);
					kGAMECLASS.removeInput();
					kGAMECLASS.flags["USED SCENE EXECUTE FUNCTION"] = 1;
				}
				catch (e:Error)
				{
					kGAMECLASS.output("\n\n\n\nERROR: ");
					kGAMECLASS.output("\n\n" + e.name);
					kGAMECLASS.output("\n" + e.message);
				}
				
				return;
			}
			
			var input:String = kGAMECLASS.userInterface.textInput.text;
			var json:String = "{\"r\":" + input + "}";
			var jObject:Object = JSON.parse(json);
			
			try
			{
				kGAMECLASS.ExecuteFunctionArgs(func, jObject.r);
				kGAMECLASS.removeInput();
				kGAMECLASS.flags["USED SCENE EXECUTE FUNCTION"] = 1;
			}
			catch (e:Error)
			{
				kGAMECLASS.output("\n\n\n\nERROR: ");
				kGAMECLASS.output("\n\n" + e.name);
				kGAMECLASS.output("\n" + e.message);
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
				kGAMECLASS.output("\n\n\n\nCouldn’t find yo room. Wakka wakka.");
				return;
			}
			
			var room:String = kGAMECLASS.userInterface.textInput.text;
			kGAMECLASS.removeInput();
			kGAMECLASS.move(room);
		}
		
		public static function cheatsReturnToMain():void
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
		
		public static function TimeSkip():void
		{
			if (kGAMECLASS.pc.short == "uncreated" || kGAMECLASS.pc.short.length == 0)
			{
				return;
			}
			
			Cheats.OutputStuff(true);
			
			kGAMECLASS.output("\nEnter an amount and select a unit of time to skip ahead. MAX: 50 Years");
			kGAMECLASS.displayInput();
			kGAMECLASS.userInterface.textInput.text = "";
			kGAMECLASS.output("\n\n\n\n<b>It is possible when skipping extremely large amounts of time for certain events to not process correctly. USE AT YOUR OWN RISK.</b>");
			kGAMECLASS.clearMenu();
			kGAMECLASS.addButton(0, "Minutes", Cheats.TryTimeSkip, 0);
			kGAMECLASS.addButton(1, "Hours", Cheats.TryTimeSkip, 1);
			kGAMECLASS.addButton(2, "Days", Cheats.TryTimeSkip, 2);
			kGAMECLASS.addButton(3, "Months", Cheats.TryTimeSkip, 3);
			kGAMECLASS.addButton(4, "Years", Cheats.TryTimeSkip, 4);
			kGAMECLASS.addButton(14, "Back", Cheats.cheatsReturnToMain);
		}
		
		public static function TryTimeSkip(unit:int):void
		{
			if (kGAMECLASS.userInterface.textInput.text == "" || int(kGAMECLASS.userInterface.textInput.text) <= 0)
			{
				Cheats.TimeSkip();
				kGAMECLASS.output("\n\n\n\nYou gots to gimme an amount yo.");
				return;
			}
			
			var sTime:int = int(kGAMECLASS.userInterface.textInput.text);
			
			switch(unit)
			{
				case 1: sTime *= 60; break;
				case 2: sTime *= 60*24; break;
				case 3: sTime *= 60*24*30; break;
				case 4: sTime *= 60*24*365; break;
			}
			
			if(sTime > 60*24*365*50)
			{
				Cheats.TimeSkip();
				kGAMECLASS.output("\n\n\n\nBAD! You can’t skip more than 50 years at a time.");
				return;
			}
			//Breaking it up into 1 processTime/day calls should make stuff proc more consistently
			else if(sTime >= 60*24)
				for(var i:int = 0; i < sTime/(60*24); i++)
					kGAMECLASS.processTime(60*24);
			else kGAMECLASS.processTime(sTime);
			
			Cheats.TimeSkip();
		}
		
		// Toggle holiday seasons.
		private static var toggleSeasonList:Array = [
			// flag, short, long
			//["NEW_YEARS", "NewYrs", "New Years"],
			//["LUNAR_NEW_YEAR", "Lunar", "Lunar New Years"],
			//["VALENTINES", "Valent.", "Valentine’s"],
			//["ST_PATRICKS", "StPatty", "Saint Patrick’s"],
			["APRIL_FOOLS", "AprFool", "April Fools"],
			["EASTER", "Easter", "Easter"],
			["JULY_4TH", "July4th", "July 4th"],
			//["OKTOBERFEST", "OktFest", "Oktoberfest"],
			["HALLOWEEN", "Spooky", "Halloween"],
			["THANKSGIVING", "Thxgvg", "Thanksgiving"],
			["CHRISTMAS", "X-Mas", "Christmas"],
		];
		public static function toggleSeasons():void
		{
			if (kGAMECLASS.pc.short == "uncreated" || kGAMECLASS.pc.short.length == 0)
			{
				return;
			}
			
			kGAMECLASS.userInterface.resetPCCaptions();
			
			Cheats.OutputStuff(true);
			
			kGAMECLASS.output("\nToggle the seasonal events you want to activate or disable:");
			kGAMECLASS.output("\n\n<b><u>Holiday Seasons</u></b>");
			
			var btnSlot:int = 0;
			kGAMECLASS.clearMenu();
			for(var idx:int = 0; idx < Cheats.toggleSeasonList.length; idx++)
			{
				kGAMECLASS.output("\n<b>* " + Cheats.toggleSeasonList[idx][2] + ":</b> ");
				
				var toggleSetting:String = "";
				var btnTooltip:String = "";
				if(kGAMECLASS.gameOptions.seasonalOverridePreferences[Cheats.toggleSeasonList[idx][0]] == undefined)
				{
					kGAMECLASS.output("Automatic");
					toggleSetting = "Auto";
					btnTooltip = "Currently set to Automatic. Select to toggle to Always On.";
				}
				else if(kGAMECLASS.gameOptions.seasonalOverridePreferences[Cheats.toggleSeasonList[idx][0]] == true)
				{
					kGAMECLASS.output("Always On");
					toggleSetting = "On";
					btnTooltip = "Currently set to Always On. Select to toggle to Always Off.";
				}
				else
				{
					kGAMECLASS.output("Always Off");
					toggleSetting = "Off";
					btnTooltip = "Currently set to Always Off. Select to toggle to Automatic.";
				}
				
				kGAMECLASS.addButton(btnSlot, (Cheats.toggleSeasonList[idx][1] + ":" + toggleSetting), Cheats.toggleSeason, Cheats.toggleSeasonList[idx][0], Cheats.toggleSeasonList[idx][2], btnTooltip);
				
				btnSlot++;
			}
			
			kGAMECLASS.addButton(13, "Default", Cheats.toggleSeasonDefault, undefined, "Default All Seasons", "Reset all holiday seasons to Automatic.");
			kGAMECLASS.addButton(14, "Back", Cheats.cheatsReturnToMain);
		}
		private static function toggleSeason(season:String = ""):void
		{
			if(kGAMECLASS.gameOptions.seasonalOverridePreferences[season] == undefined) kGAMECLASS.gameOptions.seasonalOverridePreferences[season] = true;
			else if(kGAMECLASS.gameOptions.seasonalOverridePreferences[season] == true) kGAMECLASS.gameOptions.seasonalOverridePreferences[season] = false;
			else kGAMECLASS.gameOptions.seasonalOverridePreferences[season] = undefined;
			toggleSeasons();
		}
		private static function toggleSeasonDefault():void
		{
			for(var idx:int = 0; idx < Cheats.toggleSeasonList.length; idx++)
			{
				kGAMECLASS.gameOptions.seasonalOverridePreferences[Cheats.toggleSeasonList[idx][0]] = undefined;
			}
			kGAMECLASS.gameOptions.seasonalOverridePreferences = { };
			
			toggleSeasons();
		}
	}
}
