package classes.UIComponents.SideBarComponents 
{
	import classes.Characters.NyreaAlpha;
	import classes.Characters.NyreaBeta;
	import classes.Creature;
	import classes.UIComponents.SideBarComponents.BigStatBlock;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import classes.UIComponents.UIStyleSettings;
	import flash.text.AntiAliasType;
	import classes.UIComponents.StatusEffectComponents.StatusEffectsDisplay;
	import classes.StringUtil;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class EnemyEncounterBlock extends Sprite
	{
		private var _statBlock:BigStatBlock; // LOOKIT THIS! CODE REUSE!!!1
		private var _levelDisplay:StatBar;
		private var _raceDisplay:StatBar;
		private var _sexDisplay:StatBar;
		private var _statusEffects:StatusEffectsBlock;
		
		public function get shieldBar():StatBar { return _statBlock.shieldBar; }
		public function get hpBar():StatBar { return _statBlock.hpBar; }
		public function get lustBar():StatBar { return _statBlock.lustBar; }
		public function get energyBar():StatBar { return _statBlock.energyBar; }
		public function get levelBar():StatBar { return _levelDisplay; }
		public function get raceBar():StatBar { return _raceDisplay; }
		public function get sexBar():StatBar { return _sexDisplay; }
		public function get statusEffects():StatusEffectsDisplay { return _statusEffects.statusDisplay; }
		
		public function EnemyEncounterBlock() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}

		private function init(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			
			_statBlock = new BigStatBlock(true, "ENCOUNTER STATUS");
			this.addChild(_statBlock);
			
			this.BuildInfoBars();
			
			_statusEffects = new StatusEffectsBlock(false);
			_statusEffects.y = Math.floor(_sexDisplay.y + (_sexDisplay.height - 7));
			this.addChild(_statusEffects);
			
			_statusEffects.displayText = "ENEMY STATUS";
		}
		
		private function BuildInfoBars():void
		{
			_levelDisplay = new StatBar(StatBar.MODE_NOBAR);
			this.addChild(_levelDisplay);
			_levelDisplay.x = 10;
			_levelDisplay.y = _statBlock.y + _statBlock.height;
			_levelDisplay.caption = "LEVEL";
			_levelDisplay.value = "5";
			
			_raceDisplay = new StatBar(StatBar.MODE_NOBAR);
			this.addChild(_raceDisplay);
			_raceDisplay.x = 10;
			_raceDisplay.y = _levelDisplay.y + 30; // Carefully calculated magic number to sort padding (bars are 20y + 6 pad)
			_raceDisplay.caption = "RACE";
			_raceDisplay.value = "Galotian";
			
			_sexDisplay = new StatBar(StatBar.MODE_NOBAR);
			this.addChild(_sexDisplay);
			_sexDisplay.x = 10;
			_sexDisplay.y = _raceDisplay.y + 30;
			_sexDisplay.caption = "SEX";
			_sexDisplay.value = "Unknown";
		}
		
		public function removeGlows():void
		{
			_statBlock.removeGlows();
			_levelDisplay.clearGlow();
			_raceDisplay.clearGlow();
			_sexDisplay.clearGlow();
		}
		
		public function resetItems():void
		{
			_statBlock.resetItems();
			_levelDisplay.resetBar();
			_raceDisplay.resetBar();
			_sexDisplay.resetBar();
		}
		
		public function showStatsForCreature(char:Creature, asInit:Boolean = false):void
		{
			if (_statBlock.shieldBar != null && char != null && char.shieldDisplayName != null)
			{
				_statBlock.shieldBar.caption = char.shieldDisplayName;
			}
			else if (_statBlock.shieldBar != null && char == null)
			{
				_statBlock.shieldBar.caption = "SHIELD";
			}
			
			_statBlock.shieldBar.updateBar(char.shields(), char.shieldsMax(), asInit);
			_statBlock.hpBar.updateBar(char.HP(), char.HPMax(), asInit);
			_statBlock.lustBar.updateBar(char.lust(), char.lustMax(), asInit);
			_statBlock.energyBar.updateBar(char.energy(), char.energyMax(), asInit);
			_levelDisplay.updateBar(String(char.level), Number.NaN, asInit);
			_raceDisplay.updateBar(StringUtil.toTitleCase(char.originalRace), Number.NaN, asInit);
			
			var genderText:String;
			if (char.genderTextOverride() != "") genderText = char.genderTextOverride();
			else if (char.hasStatusEffect("Force It Gender")) genderText = "???";
			else if (char.hasStatusEffect("Force Fem Gender")) genderText = "Female";
			else if (char.hasStatusEffect("Force Male Gender")) genderText = "Male";
			else if (char.hasStatusEffect("Force Herm Gender")) genderText = "Herm";
			else if (char.isHerm()) genderText = "Herm";
			else if (char.hasCock()) genderText = "Male";
			else if (char.hasVagina()) genderText = "Female";
			else genderText = "???";
			_sexDisplay.updateBar(genderText);
			
			_statusEffects.statusDisplay.updateDisplay(char.statusEffects);
		}
	}
}