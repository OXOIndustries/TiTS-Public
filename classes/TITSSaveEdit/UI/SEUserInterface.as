package classes.TITSSaveEdit.UI 
{
	import classes.TITSSaveEdit.Data.TiTsCharacterData;
	import classes.TITSSaveEdit.UI.Controls.FluidSettings;
	import classes.UIComponents.MainButton;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.AntiAliasType;
	import classes.UIComponents.UIStyleSettings;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class SEUserInterface extends Sprite
	{
		private var _leftBar:SELeftBar;
		private var _mainDisplay:SEMainDisplay;
		
		private var _loadTextDisplay:TextField;
		private var _buff:String;
		
		public function get newButton():MainButton { return _leftBar.newButton; }
		public function get loadButton():MainButton { return _leftBar.titsButton; }
		public function get resetButton():MainButton { return _leftBar.resetButton; }
		public function get importButton():MainButton { return _leftBar.importButton; }
		public function get saveButton():MainButton { return _leftBar.saveButton; }
		
		public function get topText():TextField { return _leftBar.topText; }
		public function get middleText():TextField { return _leftBar.middleText; }
		public function get bottomText():TextField { return _leftBar.bottomText; }
		
		public function output(msg:String):void
		{
			_buff += msg;
		}
		
		public function clearOutput():void
		{
			_buff = "";
		}
		
		public function buffRender():void
		{
			_loadTextDisplay.htmlText = "<span class='words'><p>" + _buff + "</p></span>";
		}
		
		public function SEUserInterface() 
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			_buff = "";
			
			Build();
			setCharacterData(new TiTsCharacterData()); // Inits the UI defaults.
		}
		
		private function Build():void
		{
			_leftBar = new SELeftBar();
			this.addChild(_leftBar);
			
			_mainDisplay = new SEMainDisplay();
			this.addChild(_mainDisplay);
			_mainDisplay.x = 200;
			
			_loadTextDisplay = new TextField();
			this.addChild(_loadTextDisplay);
			_loadTextDisplay.border = false;
			_loadTextDisplay.background = false;
			_loadTextDisplay.multiline = true;
			_loadTextDisplay.wordWrap = true;
			_loadTextDisplay.embedFonts = true;
			_loadTextDisplay.antiAliasType = AntiAliasType.ADVANCED;
			_loadTextDisplay.x = 205;
			_loadTextDisplay.y = 5;
			_loadTextDisplay.height = 800;
			_loadTextDisplay.width = 800;
			_loadTextDisplay.styleSheet = UIStyleSettings.gMainTextCSSStyleSheet;
		}
		
		public function hideMain():void
		{
			_mainDisplay.visible = false;
			_loadTextDisplay.visible = true;
		}
		
		public function showMain():void
		{
			_mainDisplay.visible = true;
			_loadTextDisplay.visible = false;
		}
		
		public function hideAll():void
		{
			_mainDisplay.visible = false;
			_loadTextDisplay.visible = false;
		}
		
		public function setCharacterData(char:TiTsCharacterData):void
		{
			_mainDisplay.generalStats.playerName = char.short;
			_mainDisplay.generalStats.level = char.level;
			_mainDisplay.generalStats.xp = char.XPRaw;
			_mainDisplay.generalStats.credits = char.credits;
			_mainDisplay.generalStats.characterClass = char.characterClass;
			_mainDisplay.generalStats.personality = char.personality;
			
			_mainDisplay.coreStats.physique = char.physiqueRaw;
			_mainDisplay.coreStats.reflexes = char.reflexesRaw;
			_mainDisplay.coreStats.aim = char.aimRaw;
			_mainDisplay.coreStats.intelligence = char.intelligenceRaw;
			_mainDisplay.coreStats.willpower = char.willpowerRaw;
			_mainDisplay.coreStats.libido = char.libidoRaw;
			_mainDisplay.coreStats.affinity = char.affinity;
			
			_mainDisplay.combatStats.hpMod = char.HPMod;
			_mainDisplay.combatStats.energyMod = char.energyMod;
			_mainDisplay.combatStats.lust = char.lustRaw;
			
			_mainDisplay.tailAppearance.tailType = char.tailType;
			_mainDisplay.tailAppearance.tailCount = char.tailCount;
			_mainDisplay.tailAppearance.tailFlags = char.tailFlags;
			_mainDisplay.tailAppearance.tailGenitalArg = char.tailGenital;
			_mainDisplay.tailAppearance.tailGenitalType = char.tailGenitalArg;
			
			_mainDisplay.fluidSettings.cumType = char.cumType;
			_mainDisplay.fluidSettings.girlCumType = char.girlCumType;
			_mainDisplay.fluidSettings.ballFullness = char.ballFullness;
			_mainDisplay.fluidSettings.ballEfficiency = char.ballEfficiency;
			_mainDisplay.fluidSettings.cumMultiplier = char.cumMultiplierRaw;
			_mainDisplay.fluidSettings.refractoryRate = char.refractoryRate;
			_mainDisplay.fluidSettings.milkType = char.milkType;
			_mainDisplay.fluidSettings.milkMultiplier = char.milkMultiplier;
			_mainDisplay.fluidSettings.milkStorageMultiplier = char.milkStorageMultiplier;
			_mainDisplay.fluidSettings.milkFullness = char.milkFullness;
			_mainDisplay.fluidSettings.milkRate = char.milkRate;
			
			_mainDisplay.generalGender.genitalSpot = char.genitalSpot;
			_mainDisplay.generalGender.minutesSinceCum = char.minutesSinceCum;
			_mainDisplay.generalGender.timesCum = char.timesCum;
			
			_mainDisplay.generalAppearance.femininity = char.femininity;
			_mainDisplay.generalAppearance.tallness = char.tallness;
			_mainDisplay.generalAppearance.thickness = char.thickness;
			_mainDisplay.generalAppearance.tone = char.tone;
			_mainDisplay.generalAppearance.hipRating = char.hipRatingRaw;
			_mainDisplay.generalAppearance.buttRating = char.buttRatingRaw;
			_mainDisplay.generalAppearance.bellyRating = char.bellyRatingRaw;
			
			_mainDisplay.hairAppearance.hairType = char.hairType;
			_mainDisplay.hairAppearance.hairColor = char.hairColor;
			_mainDisplay.hairAppearance.hairLength = char.hairLength;
			
			_mainDisplay.skinAppearance.skinTone = char.skinTone;
			_mainDisplay.skinAppearance.furColor = char.furColor;
			_mainDisplay.skinAppearance.scaleColor = char.scaleColor;
			_mainDisplay.skinAppearance.skinType = char.skinType;
			_mainDisplay.skinAppearance.skinFlags = char.skinFlags;
			
			_mainDisplay.headAppearance.faceType = char.faceType;
			_mainDisplay.headAppearance.faceFlags = char.faceFlags;
			_mainDisplay.headAppearance.tongueType = char.tongueType;
			_mainDisplay.headAppearance.tongueFlags = char.tongueFlags;
			_mainDisplay.headAppearance.lipMod = char.lipMod;
			_mainDisplay.headAppearance.lipColor = char.lipColor;
			_mainDisplay.headAppearance.earType = char.earType;
			_mainDisplay.headAppearance.horns = char.horns;
			_mainDisplay.headAppearance.hornType = char.hornType;
			_mainDisplay.headAppearance.hornLength = char.hornLength;
			_mainDisplay.headAppearance.eyeType = char.eyeType;
			_mainDisplay.headAppearance.eyeColor = char.eyeColor;
			
			_mainDisplay.bodyAppearance.armType = char.armType;
			_mainDisplay.bodyAppearance.wingType = char.wingType;
			_mainDisplay.bodyAppearance.legType = char.legType;
			_mainDisplay.bodyAppearance.legFlags = char.legFlags;
			_mainDisplay.bodyAppearance.legCount = char.legCount;
			
			_mainDisplay.cockAppearance.balls = char.balls;
			_mainDisplay.cockAppearance.ballSize = char.ballSizeRaw;
			_mainDisplay.cockAppearance.cockVirgin = char.cockVirgin;
			_mainDisplay.cockAppearance.cocks = char.cocks;
			
			_mainDisplay.vaginaAppearance.clitLength = char.clitLength;
			_mainDisplay.vaginaAppearance.elasticity = char.elasticity;
			_mainDisplay.vaginaAppearance.vaginalVirgin = char.vaginalVirgin;
			_mainDisplay.vaginaAppearance.vaginas = char.vaginas;
			
			_mainDisplay.breastAppearance.nippleColor = char.nippleColor;
			_mainDisplay.breastAppearance.nipplesPerBreast = char.nipplesPerBreast;
			_mainDisplay.breastAppearance.nippleLengthRatio = char.nippleLengthRatio;
			_mainDisplay.breastAppearance.nippleWidthRatio = char.nippleWidthRatio;
			_mainDisplay.breastAppearance.dickNippleMultiplier = char.dickNippleMultiplier;
			_mainDisplay.breastAppearance.dickNippleType = char.dickNippleType;
			_mainDisplay.breastAppearance.breastRows = char.breastRows;
			
			_mainDisplay.assSettings.analVirgin = char.analVirgin;
			_mainDisplay.assSettings.ass = char.ass;
		}
		
		public function getCharacterData(char:TiTsCharacterData):void
		{
			char.short = _mainDisplay.generalStats.playerName;
			char.level = _mainDisplay.generalStats.level;
			char.XPRaw = _mainDisplay.generalStats.xp;
			char.credits = _mainDisplay.generalStats.credits;
			char.characterClass = _mainDisplay.generalStats.characterClass;
			char.personality = _mainDisplay.generalStats.personality;
			
			char.physiqueRaw = _mainDisplay.coreStats.physique;
			char.reflexesRaw = _mainDisplay.coreStats.reflexes;
			char.aimRaw = _mainDisplay.coreStats.aim;
			char.intelligenceRaw = _mainDisplay.coreStats.intelligence;
			char.willpowerRaw = _mainDisplay.coreStats.willpower;
			char.libidoRaw = _mainDisplay.coreStats.libido;
			char.affinity = _mainDisplay.coreStats.affinity;
			
			char.HPMod = _mainDisplay.combatStats.hpMod;
			char.energyMod = _mainDisplay.combatStats.energyMod;
			char.lustRaw = _mainDisplay.combatStats.lust;
			
			char.tailType = _mainDisplay.tailAppearance.tailType;
			char.tailCount = _mainDisplay.tailAppearance.tailCount;
			char.tailFlags = _mainDisplay.tailAppearance.tailFlags;
			char.tailGenital = _mainDisplay.tailAppearance.tailGenitalArg;
			char.tailGenitalArg = _mainDisplay.tailAppearance.tailGenitalType;
			
			char.cumType = _mainDisplay.fluidSettings.cumType;
			char.girlCumType = _mainDisplay.fluidSettings.girlCumType;
			char.ballFullness = _mainDisplay.fluidSettings.ballFullness;
			char.ballEfficiency = _mainDisplay.fluidSettings.ballEfficiency;
			char.refractoryRate = _mainDisplay.fluidSettings.refractoryRate;
			char.milkType = _mainDisplay.fluidSettings.milkType;
			char.milkMultiplier = _mainDisplay.fluidSettings.milkMultiplier;
			char.milkStorageMultiplier = _mainDisplay.fluidSettings.milkStorageMultiplier;
			char.milkFullness = _mainDisplay.fluidSettings.milkFullness;
			char.milkRate = _mainDisplay.fluidSettings.milkRate;
			
			char.genitalSpot = _mainDisplay.generalGender.genitalSpot;
			char.minutesSinceCum = _mainDisplay.generalGender.minutesSinceCum;
			char.timesCum = _mainDisplay.generalGender.timesCum;
			
			char.femininity = _mainDisplay.generalAppearance.femininity;
			char.tallness = _mainDisplay.generalAppearance.tallness;
			char.thickness = _mainDisplay.generalAppearance.thickness;
			char.tone = _mainDisplay.generalAppearance.tone;
			char.hipRatingRaw = _mainDisplay.generalAppearance.hipRating;
			char.buttRatingRaw = _mainDisplay.generalAppearance.buttRating;
			char.bellyRatingRaw = _mainDisplay.generalAppearance.bellyRating;
			
			char.hairType = _mainDisplay.hairAppearance.hairType;
			char.hairColor = _mainDisplay.hairAppearance.hairColor;
			char.hairLength = _mainDisplay.hairAppearance.hairLength;
			
			char.skinTone = _mainDisplay.skinAppearance.skinTone;
			char.furColor = _mainDisplay.skinAppearance.furColor;
			char.scaleColor = _mainDisplay.skinAppearance.scaleColor;
			char.skinType = _mainDisplay.skinAppearance.skinType;
			char.skinFlags = _mainDisplay.skinAppearance.skinFlags;
			
			char.faceType = _mainDisplay.headAppearance.faceType;
			char.faceFlags = _mainDisplay.headAppearance.faceFlags;
			char.tongueType = _mainDisplay.headAppearance.tongueType;
			char.tongueFlags = _mainDisplay.headAppearance.tongueFlags;
			char.lipMod = _mainDisplay.headAppearance.lipMod;
			char.lipColor = _mainDisplay.headAppearance.lipColor;
			char.earType = _mainDisplay.headAppearance.earType;
			char.horns = _mainDisplay.headAppearance.horns;
			char.hornType = _mainDisplay.headAppearance.hornType;
			char.hornLength = _mainDisplay.headAppearance.hornLength;
			
			char.armType = _mainDisplay.bodyAppearance.armType;
			char.wingType = _mainDisplay.bodyAppearance.wingType;
			char.legType = _mainDisplay.bodyAppearance.legType;
			char.legFlags = _mainDisplay.bodyAppearance.legFlags;
			char.legCount = _mainDisplay.bodyAppearance.legCount;
			
			char.balls = _mainDisplay.cockAppearance.balls;
			char.ballSizeRaw = _mainDisplay.cockAppearance.ballSize;
			char.cockVirgin = _mainDisplay.cockAppearance.cockVirgin;
			char.cocks = _mainDisplay.cockAppearance.cocks;
			
			char.clitLength = _mainDisplay.vaginaAppearance.clitLength;
			char.elasticity = _mainDisplay.vaginaAppearance.elasticity;
			char.vaginalVirgin = _mainDisplay.vaginaAppearance.vaginalVirgin;
			char.vaginas = _mainDisplay.vaginaAppearance.vaginas;
			
			char.nippleColor = _mainDisplay.breastAppearance.nippleColor;
			char.nipplesPerBreast = _mainDisplay.breastAppearance.nipplesPerBreast;
			char.nippleLengthRatio = _mainDisplay.breastAppearance.nippleLengthRatio;
			char.nippleWidthRatio = _mainDisplay.breastAppearance.nippleWidthRatio;
			char.dickNippleMultiplier = _mainDisplay.breastAppearance.dickNippleMultiplier;
			char.dickNippleType = _mainDisplay.breastAppearance.dickNippleType;
			char.breastRows = _mainDisplay.breastAppearance.breastRows;
			
			char.analVirgin = _mainDisplay.assSettings.analVirgin;
			char.ass = _mainDisplay.assSettings.ass;
		}
		
	}

}