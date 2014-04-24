package classes.UIComponents.ContentModules 
{
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
		
		public function setCreatureData(creature:Creature):void
		{
			_targetCreature = creature;
			
			_moduleHeader.text = (GLOBAL.CLASS_NAMES[creature.characterClass] as String).toUpperCase() + " ABILITIES";
			
			_perkList.setInitialState(creature);
			
			// Give ourselves a disabled button
			kGAMECLASS.userInterface.addDisabledGhostButton(4, "Confirm", "Confirm Selection", "You must select an available perk before you can confirm!");
		}
		
		public function perkButtonHandler(e:Event):void
		{
			var tarButton:PerkButton = e.target as PerkButton;
			var buttonGroup:PerkButtonGroup = tarButton.parent as PerkButtonGroup;
			
			tarButton.setSelected();
			
			if (buttonGroup.buttonOne == tarButton) buttonGroup.buttonTwo.setAvailable();
			else buttonGroup.buttonOne.setAvailable();
			
			_selectedPerkButton = tarButton;
			_selectedPerkDetails.selectedPerkName = _selectedPerkButton.perkReference.perkName;
			_selectedPerkDetails.selectedPerkText = _selectedPerkButton.perkReference.perkDescription;
			
			kGAMECLASS.userInterface.addGhostButton(4, "Confirm", confirmSelection, undefined, "Confirm Selection", "Confirm the selected perk.");
		}
		
		public function confirmSelection():void
		{
			var _autoPerk:PerkData = kGAMECLASS.perkDB.getAutoPerkForCreature(_targetCreature);
			_autoPerk.applyTo(_targetCreature);
			_selectedPerkButton.perkReference.applyTo(_targetCreature);
			
			kGAMECLASS.eventBuffer += "\n\nYou have gained a level. Your stats have increased and you have gained new abilities.";
			kGAMECLASS.eventBuffer += "\n\nAuto Perk: <b>" + _autoPerk.perkName + "</b> - " +  _autoPerk.perkDescription;
			kGAMECLASS.eventBuffer += "\n\nSelected Perk: <b>" + _selectedPerkButton.perkReference.perkName + "</b> - " + _selectedPerkButton.perkReference.perkDescription;
			
			kGAMECLASS.mainGameMenu();
		}
	}
}