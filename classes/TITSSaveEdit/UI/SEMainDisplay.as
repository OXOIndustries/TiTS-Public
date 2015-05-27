package classes.TITSSaveEdit.UI 
{
	import classes.TITSSaveEdit.UI.Controls.AssSettings;
	import classes.TITSSaveEdit.UI.Controls.BodyAppearance;
	import classes.TITSSaveEdit.UI.Controls.BreastSettings;
	import classes.TITSSaveEdit.UI.Controls.CombatStats;
	import classes.TITSSaveEdit.UI.Controls.FluidSettings;
	import classes.TITSSaveEdit.UI.Controls.GeneralAppearance;
	import classes.TITSSaveEdit.UI.Controls.GeneralGender;
	import classes.TITSSaveEdit.UI.Controls.GeneralStats;
	import classes.TITSSaveEdit.UI.Controls.CoreStats;
	import classes.TITSSaveEdit.UI.Controls.HairAppearance;
	import classes.TITSSaveEdit.UI.Controls.HeadAppearance;
	import classes.TITSSaveEdit.UI.Controls.Resistances;
	import classes.TITSSaveEdit.UI.Controls.SkinAppearance;
	import classes.TITSSaveEdit.UI.Controls.TailAppearance;
	import classes.TITSSaveEdit.UI.Controls.CockSettings;
	import classes.TITSSaveEdit.UI.Controls.VaginaSettings;
	import fl.containers.ScrollPane;
	import fl.controls.ComboBox;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import classes.TITSSaveEdit.UI.Controls.ComboLabelPair;
	import classes.UIComponents.UIStyleSettings;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class SEMainDisplay extends Sprite
	{
		private var _scrollPane:ScrollPane;
		private var _content:MovieClip;
		private var _left:Array;
		private var _right:Array;
		
		private var _generalStats:GeneralStats;
		private var _coreStats:CoreStats;
		private var _combatStats:CombatStats;
		private var _resistances:Resistances;
		private var _tailAppearance:TailAppearance
		private var _fluidSettings:FluidSettings;
		private var _generalGender:GeneralGender;
		
		private var _generalAppearance:GeneralAppearance;
		private var _hairAppearance:HairAppearance;
		private var _skinAppearance:SkinAppearance;
		private var _headAppearance:HeadAppearance;
		private var _bodyAppearance:BodyAppearance;
		private var _cockAppearance:CockSettings;
		private var _vaginaAppearance:VaginaSettings;
		private var _breastAppearance:BreastSettings;
		private var _assSettings:AssSettings;
		
		public function get generalStats():GeneralStats { return _generalStats; }
		public function get coreStats():CoreStats { return _coreStats; }
		public function get combatStats():CombatStats { return _combatStats; }
		public function get tailAppearance():TailAppearance { return _tailAppearance; }
		public function get fluidSettings():FluidSettings { return _fluidSettings; }
		public function get generalGender():GeneralGender { return _generalGender; }
		
		public function get generalAppearance():GeneralAppearance { return _generalAppearance; }
		public function get hairAppearance():HairAppearance { return _hairAppearance; }
		public function get skinAppearance():SkinAppearance { return _skinAppearance; }
		public function get headAppearance():HeadAppearance { return _headAppearance; }
		public function get bodyAppearance():BodyAppearance { return _bodyAppearance; }
		public function get cockAppearance():CockSettings { return _cockAppearance; }
		public function get vaginaAppearance():VaginaSettings { return _vaginaAppearance; }
		public function get breastAppearance():BreastSettings { return _breastAppearance; }
		public function get assSettings():AssSettings { return _assSettings; }
		
		public function SEMainDisplay() 
		{
			_left = new Array();
			_right = new Array();
			
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			Build();
			BuildControls();
		}
		
		private function Build():void
		{
			_scrollPane = new ScrollPane();
			_scrollPane.setSize(800, 800);
			
			this.opaqueBackground = null;
			
			var nullSkin:MovieClip = new MovieClip();
			_scrollPane.setStyle("skin", nullSkin);
			_scrollPane.setStyle("upSkin", nullSkin);
			
			this.addChild(_scrollPane);
			
			_content = new MovieClip();
			_content.name = "controlContent";
			
			_scrollPane.source = _content;
		}
		
		private static const LEFT_COL:Boolean = true;
		private static const RIGHT_COL:Boolean = false;
		
		private function AddControl(control:DisplayObjectContainer, left:Boolean = true):void
		{
			var numChildren:int = _content.numChildren;
			var yOffset:int = 0;
			var colArray:Array;
			
			_content.addChild(control);
			
			if (left)
			{
				colArray = _left;
				control.x = 0;
			}
			else
			{
				colArray = _right;
				control.x = 392;
			}
			
			if (colArray.length > 0)
			{
				var colArrayDOC:DisplayObjectContainer = colArray[colArray.length - 1];
				var lastChild:DisplayObject = colArrayDOC.getChildAt(colArrayDOC.numChildren - 1);
				
				yOffset = colArrayDOC.y + lastChild.y + lastChild.height + 15;
			}
			
			colArray.push(control);
			control.y = yOffset;
			_scrollPane.update();
		}
		
		private function generateBackgroundElem():void
		{
			var bSprite:Sprite = new Sprite();
			bSprite.graphics.beginFill(UIStyleSettings.gBackgroundColour);
			bSprite.graphics.drawRect(0, 0, _content.width, _content.height);
			bSprite.graphics.endFill();
			
			_content.addChildAt(bSprite, 0);
		}
		
		private function BuildControls():void
		{
			// LEFT
			_generalStats = new GeneralStats();
			AddControl(_generalStats, LEFT_COL);
			_generalStats.name = "generalstats";
			
			_coreStats = new CoreStats();
			AddControl(_coreStats, LEFT_COL);
			_coreStats.name = "corestats";
			
			_combatStats = new CombatStats();
			AddControl(_combatStats, LEFT_COL);
			_combatStats.name = "combatstats";
			
			_generalAppearance = new GeneralAppearance();
			AddControl(_generalAppearance, LEFT_COL);
			_generalAppearance.name = "generalappearance";
			
			_hairAppearance = new HairAppearance();
			AddControl(_hairAppearance, LEFT_COL);
			_hairAppearance.name = "hairappearance";
			
			_skinAppearance = new SkinAppearance();
			AddControl(_skinAppearance, LEFT_COL);
			_skinAppearance.name = "skinappearance";
			
			_headAppearance = new HeadAppearance();
			AddControl(_headAppearance, LEFT_COL);
			_headAppearance.name = "headappearance";
			
			_bodyAppearance = new BodyAppearance();
			AddControl(_bodyAppearance, LEFT_COL);
			_bodyAppearance.name = "bodyappearance";			
			
			_resistances = new Resistances();
			AddControl(_resistances, LEFT_COL);
			_resistances.name = "resistances";
				
			// RIGHT			
			_cockAppearance = new CockSettings();
			AddControl(_cockAppearance, RIGHT_COL);
			_cockAppearance.name = "cockappearance";
			
			_vaginaAppearance = new VaginaSettings();
			AddControl(_vaginaAppearance, RIGHT_COL);
			_vaginaAppearance.name = "vaginaappearance";
			
			_breastAppearance = new BreastSettings();
			AddControl(_breastAppearance, RIGHT_COL);
			_breastAppearance.name = "breastappearance";
			
			_assSettings = new AssSettings();
			AddControl(_assSettings, RIGHT_COL);
			_assSettings.name = "asssettings";
			
			_tailAppearance = new TailAppearance();
			AddControl(_tailAppearance, RIGHT_COL);
			_tailAppearance.name = "tailappearance";
			
			_fluidSettings = new FluidSettings();
			AddControl(_fluidSettings, RIGHT_COL);
			_fluidSettings.name = "fluidsettings";
			
			_generalGender = new GeneralGender();
			AddControl(_generalGender, RIGHT_COL);
			_generalGender.name = "generalgender";
			
			generateBackgroundElem();
		}
	}
}