package classes.UIComponents.ContentModules 
{
	import classes.Characters.PlayerCharacter;
	import classes.Creature;
	import classes.UIComponents.ContentModule;
	import classes.UIComponents.ContentModuleComponents.PerkButton;
	import classes.UIComponents.ContentModuleComponents.PerkButtonGroup;
	import classes.UIComponents.ContentModuleComponents.PerkClassTree;
	import fl.containers.ScrollPane;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.AntiAliasType;
	import classes.UIComponents.UIStyleSettings;
	import classes.UIComponents.ContentModuleComponents.PerkDetailsPane;
	import classes.GLOBAL;
	import classes.kGAMECLASS;
	import classes.GameData.Perks;
	import classes.GameData.PerkData;
	import classes.Engine.Interfaces.ExtendLogEvent;
	import classes.Engine.Interfaces.AddLogEvent;
	import classes.Engine.Interfaces.ParseText;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class LevelUpPerksModule extends ContentModule
	{
		private var _moduleHeader:TextField;
		private var _perkList:PerkClassTree;
		private var _selectedPerkDetails:PerkDetailsPane;
		
		private var _targetCreature:Creature;
		private var _selectedPerkButton:PerkButton;
		
		public function LevelUpPerksModule() 
		{
			leftBarEnabled = true;
			rightBarEnabled = true;
			fullButtonTrayEnabled = false;
			_moduleName = "LevelUpPerks";
			
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			
			this.Build();
		}
		
		private function Build():void
		{
			_moduleHeader = new TextField();
			_moduleHeader.border = false;
			_moduleHeader.background = false;
			_moduleHeader.multiline = false;
			_moduleHeader.wordWrap = false;
			_moduleHeader.embedFonts = true;
			_moduleHeader.antiAliasType = AntiAliasType.ADVANCED;
			_moduleHeader.defaultTextFormat = UIStyleSettings.gPerkHeaderLabelTextFormat;
			_moduleHeader.mouseEnabled = false;
			_moduleHeader.mouseWheelEnabled = false;
			_moduleHeader.width = 800;
			_moduleHeader.height = 150;
			_moduleHeader.x = 0;
			_moduleHeader.y = 5;
			_moduleHeader.text = "[CLASS] ABILITIES";
			this.addChild(_moduleHeader);
			
			_selectedPerkDetails = new PerkDetailsPane();
			_selectedPerkDetails.x = 0;
			_selectedPerkDetails.y = 550;
			this.addChild(_selectedPerkDetails);
			
			var nullSkin:MovieClip = new MovieClip();
			
			_perkList = new PerkClassTree(perkButtonHandler);
			_perkList.x = 5;
			_perkList.y = 90;
			_perkList.width = 790;
			_perkList.height = 470;
			_perkList.setStyle("skin", nullSkin);
			_perkList.setStyle("upSkin", nullSkin);
			this.addChild(_perkList);
		}
		
		public function setCreatureData(creature:Creature, gavePoints:Boolean = false):void
		{
			_targetCreature = creature;
			
			_moduleHeader.text = (GLOBAL.CLASS_NAMES[creature.characterClass] as String).toUpperCase() + " ABILITIES";
			
			_perkList.setInitialState(creature);
			
			// Give ourselves a disabled button
			kGAMECLASS.userInterface.addGhostButton(0, "Confirm", confirmSelection, gavePoints, "Confirm Selection", "Confirm the current perk selection, if any.");
		}
		
		public function perkButtonHandler(e:Event):void
		{
			var tarButton:PerkButton = e.target as PerkButton;
			var buttonGroup:PerkButtonGroup = tarButton.parent as PerkButtonGroup;
			
			if (!tarButton.isSelected)
			{
				tarButton.setSelected();
				if (buttonGroup.buttonOne == tarButton) buttonGroup.buttonTwo.removeSelected();
				else buttonGroup.buttonOne.removeSelected();
				
				if (_selectedPerkButton != null && (_selectedPerkButton.isUnavailable || _selectedPerkButton.isTaken)) _selectedPerkButton.removeSelected();
			}
			else
			{
				tarButton.removeSelected();
			}
			
			_selectedPerkButton = tarButton;
			_selectedPerkDetails.selectedPerkName = _selectedPerkButton.perkReference.perkName;
			_selectedPerkDetails.selectedPerkText = ParseText(_selectedPerkButton.perkReference.perkDescription);
		}
		
		public function confirmSelection(gavePoints:Boolean = false):void
		{
			// Figure out autoperks that need to be applied
			var _autoPerks:Vector.<PerkData> = kGAMECLASS.perkDB.getAutoPerksForCreature(_targetCreature);
			
			// Get perk selections in the UI
			var _selectedPerks:Vector.<PerkData> = _perkList.getSelectedPerks();
			
			var msg:String = "";
			var i:int = 0;
			var leveledUp:Boolean = false;
			var gainedPerks:int = _selectedPerks.length;
			for (i = 0; i < _autoPerks.length; i++)
			{
				// Auto perks only gained after level up!
				if (!_targetCreature.hasPerk(_autoPerks[i].perkName)) { gainedPerks++; leveledUp = true; }
			}
			
			if(leveledUp || gavePoints || gainedPerks > 0)
			{
				if(leveledUp) msg += "You have gained a level. ";
				msg += "You";
				if(gavePoints) msg += "r stats have increased";
				if(gavePoints && gainedPerks > 0) msg += " and you";
				if(gainedPerks > 0) msg += " have gained " + (gainedPerks == 1 ? "a new ability" : "new abilities");
				msg += "!";
			}
			
			for (i = 0; i < _autoPerks.length; i++)
			{
				if (!_targetCreature.hasPerk(_autoPerks[i].perkName))
				{
					_autoPerks[i].applyTo(_targetCreature);
					msg += ("\n\nLevel " + _autoPerks[i].levelLimit + " Auto Perk: <b>" + _autoPerks[i].perkName + "</b> - " + _autoPerks[i].perkDescription);
				}
			}
			
			for (i = 0; i < _selectedPerks.length; i++)
			{
				_selectedPerks[i].applyTo(_targetCreature);
				(_targetCreature as PlayerCharacter).unclaimedClassPerks--;
				msg += ("\n\nLevel " + _selectedPerks[i].levelLimit + " Selected Perk: <b>" + _selectedPerks[i].perkName + "</b> - " + _selectedPerks[i].perkDescription);
			}
			
			if(msg != "") AddLogEvent(msg, "good");
			
			kGAMECLASS.mainGameMenu();
		}
	}
}