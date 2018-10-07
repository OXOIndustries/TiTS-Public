package classes.UIComponents.ContentModules 
{
	import classes.Characters.PlayerCharacter;
	import classes.Creature;
	import classes.UIComponents.ContentModule;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.AntiAliasType;
	import classes.UIComponents.UIStyleSettings;
	import classes.UIComponents.ContentModuleComponents.VerticalPointsBar;
	import classes.UIComponents.ContentModuleComponents.LevelUpStatBar;
	import classes.kGAMECLASS;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class LevelUpStatsModule extends ContentModule
	{
		// Unique assets used by this module
		[Embed(source = "../../../assets/modules/levelup/levelup_arrow_new.png", mimeType = "image/png")]
		private static var Levelup_Arrow:Class;
		
		// Display elements
		private var _levelupArrow:DisplayObject;
		private var _levelText:TextField;
		private var _levelValueText:TextField;
		
		private var _pointsBar:VerticalPointsBar;
		
		private var _statBars:Vector.<LevelUpStatBar>;
		private var _barLabels:Array = ["physique", "reflexes", "aim", "intelligence", "willpower"];
		
		public function LevelUpStatsModule() 
		{
			leftBarEnabled = true;
			rightBarEnabled = true;
			fullButtonTrayEnabled = true;
			_moduleName = "LevelUpStats";
			
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			
			this.Build();
		}
		
		private function Build():void
		{
			_levelupArrow = new Levelup_Arrow();
			_levelupArrow.x = 15;
			_levelupArrow.y = 50;
			this.addChild(_levelupArrow);
			
			_levelText = new TextField();
			_levelText.border = false;
			_levelText.background = false;
			_levelText.multiline = false;
			_levelText.wordWrap = false;
			_levelText.embedFonts = true;
			_levelText.antiAliasType = AntiAliasType.ADVANCED;
			_levelText.defaultTextFormat = UIStyleSettings.gLevelLabelText;
			_levelText.mouseEnabled = false;
			_levelText.mouseWheelEnabled = false;
			_levelText.x = 280;
			_levelText.y = 70;
			_levelText.height = 140;
			_levelText.width = 250;
			_levelText.text = "LEVEL";
			this.addChild(_levelText);
			
			_levelValueText = new TextField();
			_levelValueText.border = false;
			_levelValueText.background = false;
			_levelValueText.multiline = false;
			_levelValueText.wordWrap = false;
			_levelValueText.embedFonts = true;
			_levelValueText.antiAliasType = AntiAliasType.ADVANCED;
			_levelValueText.defaultTextFormat = UIStyleSettings.gLevelValueLabelText;
			_levelValueText.mouseEnabled = false;
			_levelValueText.mouseWheelEnabled = false;
			_levelValueText.x = 530;
			_levelValueText.y = 30;
			_levelValueText.width = 200;
			_levelValueText.height = 200;
			_levelValueText.text = "10";
			this.addChild(_levelValueText);
			
			_pointsBar = new VerticalPointsBar();
			_pointsBar.x = 138;
			_pointsBar.y = 287;
			this.addChild(_pointsBar);
			
			_statBars = new Vector.<LevelUpStatBar>();
			for (var i:int = 0; i < _barLabels.length; i++)
			{
				var newBar:LevelUpStatBar = new LevelUpStatBar();
				this.addChild(newBar);
				
				newBar.barLabel = (_barLabels[i] as String).toUpperCase();
				newBar.name = (_barLabels[i] as String).toLowerCase();
				
				newBar.addArrow.addEventListener(MouseEvent.CLICK, arrowHandler);
				newBar.remArrow.addEventListener(MouseEvent.CLICK, arrowHandler);
				
				newBar.x = 225;
				newBar.y = 286 + ((60 + 10) * i);
				
				_statBars.push(newBar);
			}
		}
		
		private var _targetCreature:PlayerCharacter;
		private var _pointDistribution:Array;
		private var _availablePoints:int;
		private var _initialPoints:int;
		
		public function setCreatureData(tarCreature:PlayerCharacter):void
		{
			trace("Showing levelup screen for " + tarCreature.short);
			
			// Update the level number
			_levelValueText.text = String(tarCreature.level);
			
			// Make some buttons available
			kGAMECLASS.userInterface.clearGhostMenu();
			kGAMECLASS.userInterface.addGhostButton(14, "Back", kGAMECLASS.backToPrimaryOutput);
			
			_targetCreature = tarCreature;
			_pointDistribution = new Array();
			
			_availablePoints = tarCreature.unspentStatPoints;
			_initialPoints = tarCreature.unspentStatPoints;
			_pointsBar.initialPointsValue = _initialPoints;
			
			for (var i:int = 0; i < _barLabels.length; i++)
			{
				_pointDistribution[i] = 0;
			}
			
			updateBarStates();
		}
		
		// This function could also be used to ensure that there are regular buttons available.
		// Something to consider for accessibility reasons; I don't want to be exclusive of those that
		// are relying on screen readers and the like.
		private function updateBarStates():void
		{
			_pointsBar.pointsValue = _availablePoints;
			
			for (var i:int = 0; i < _barLabels.length; i++)
			{
				var barVal:Number = (Math.max(_targetCreature[_barLabels[i]](), _targetCreature[_barLabels[i] + "Raw"]) + _pointDistribution[i]);
				
				//_statBars[i].barValue = _targetCreature[_barLabels[i]]() + _pointDistribution[i];
				//_statBars[i].barValue = _targetCreature[_barLabels[i] + "Raw"] + _pointDistribution[i];
				_statBars[i].barValue = String(Math.floor(barVal));
				
				// General bar settings
				//if ((_targetCreature[_barLabels[i]]() + _pointDistribution[i]) < _targetCreature[_barLabels[i] + "Max"]())
				//if ((_targetCreature[_barLabels[i] + "Raw"] + _pointDistribution[i]) < _targetCreature[_barLabels[i] + "Max"]()) // Take account Mod values!
				if (barVal < _targetCreature[_barLabels[i] + "Max"](true))
				{
					_statBars[i].setBarChangeableMode();
				}
				else
				{
					_statBars[i].setBarMaxedMode();
				}
				
				// Change value and +/- buttons
				if (_pointDistribution[i] > 0)
				{
					_statBars[i].changeValue = _pointDistribution[i];
					_statBars[i].showChangeValue();
					_statBars[i].showRemArrow();
				}
				else
				{
					_statBars[i].hideChangeValue();
					_statBars[i].hideRemArrow();
				}
				
				// Hide add arrows when there are no more points to spend
				if (_availablePoints == 0)
				{
					_statBars[i].hideAddArrow();
				}
			}
			
			updateButton();
		}
		
		private function updateButton():void
		{
			// No points spent
			if (_availablePoints == _initialPoints) 
			{
				kGAMECLASS.userInterface.addGhostButton(0, "Skip", confirmPoints, undefined, "Skip Allocation", "Skip assigning stat points.");
				kGAMECLASS.userInterface.addDisabledGhostButton(1, "Reset");
			}
			else 
			{
				kGAMECLASS.userInterface.addGhostButton(0, "Confirm", confirmPoints, undefined, "Confirm Allocation", "Confirm the current stat allocation. Any remaining unallocated points may be assigned at any time by reviewing the level up page.");
				kGAMECLASS.userInterface.addGhostButton(1, "Reset", resetPoints, undefined, "Reset Allocation", "Reset the currently allocated points.");
			}
		}
		
		private function arrowHandler(e:Event = null):void 
		{
			var statIndex:int = _barLabels.indexOf(e.target.parent.name);
			
			if (e.target.name == "add")
			{
				_pointDistribution[statIndex]++;
				_availablePoints--;
			}
			
			if (e.target.name == "rem")
			{
				_pointDistribution[statIndex]--;
				_availablePoints++;
			}
			
			updateBarStates();
			updateButton();
		}
		
		private function resetPoints():void
		{
			_availablePoints = _initialPoints;
			for (var i:int = 0; i < _barLabels.length; i++)
			{
				_pointDistribution[i] = 0;
			}
			updateBarStates();
		}
		
		private function confirmPoints():void
		{
			var gavePoints:Boolean = false;
			
			// Remove the spent points from the creature object
			_targetCreature.unspentStatPoints = _availablePoints;
			
			for (var i:int = 0; i < _barLabels.length; i++)
			{
				//_targetCreature[_barLabels[i]](_pointDistribution[i]);
				_targetCreature[_barLabels[i] + "Raw"] += _pointDistribution[i];
				if(_pointDistribution[i] > 0) gavePoints = true;
			}
			
			// This is where we'd hook into the second stage of the levelling process
			kGAMECLASS.userInterface.showLevelUpPerks(_targetCreature, gavePoints);
		}
	}

}