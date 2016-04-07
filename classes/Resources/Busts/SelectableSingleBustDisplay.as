package classes.Resources.Busts 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.AntiAliasType;
	import flash.text.TextField;
	import classes.kGAMECLASS;
	import classes.UIComponents.UIStyleSettings;
	import classes.GLOBAL;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class SelectableSingleBustDisplay extends Sprite
	{
		private var _artistName:String;
		public function get artistName():String { return _artistName; }
		
		public function get selected():Boolean { return (_edge ? _edge.visible : false); }
		public function set selected(v:Boolean):void { if (_edge) _edge.visible = v; }
		
		private var _background:Sprite;
		private var _edge:Sprite;
		private var _nameText:TextField;
		private var _contBack:Sprite;
		private var _bustPreview:Sprite;
		
		public function SelectableSingleBustDisplay(artistName:String) 
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			Build();
		}
		
		private function Build():void
		{
			addEventListener(MouseEvent.CLICK, selectOverride);
						
			var artistDisplayName:String = GLOBAL.VALID_ARTISTS_NAMES[GLOBAL.VALID_ARTISTS.indexOf(artistName)];
			
			_background = new Sprite();
			_background.graphics.beginFill(UIStyleSettings.gBackgroundColour);
			_background.graphics.drawRect(0, 0, 230, 270);
			_background.graphics.endFill();
			addChild(_background);
			
			_edge = new Sprite();
			_edge.graphics.lineStyle(3, UIStyleSettings.gHighlightColour);
			_edge.graphics.drawRect(0, 0, 230, 270);
			_edge.graphics.endFill();
			_edge.visible = false;
			addChild(_edge);
			
			_nameText = new TextField();
			_nameText.border = false;
			_nameText.background = false;
			_nameText.multiline = false;
			_nameText.wordWrap = false;
			_nameText.embedFonts = true;
			_nameText.antiAliasType = AntiAliasType.ADVANCED;
			_nameText.width = 220;
			_nameText.x = 5
			_nameText.y = 5
			_nameText.styleSheet = UIStyleSettings.gSharedStyleSheet;
			_nameText.text = "<span class='words'><p>" + artistDisplayName + "</p></span>";
			_nameText.height = 30;
			addChild(_nameText);
			
			_contBack = new Sprite();
			_contBack.x = 5;
			_contBack.y = _nameText.y + _nameText.height;
			_contBack.graphics.beginFill(UIStyleSettings.gBackgroundColour);
			_contBack.graphics.drawRect(0, 0, 220, 220);
			_contBack.graphics.endFill();
			addChild(_contBack);
			
			_bustPreview = new Sprite();
			_contBack.addChild(_bustPreview);
			
			mouseEnabled = true;
			mouseChildren = true;
		}
		
		private function selectOverride(e:Event):void
		{
			var setState:Boolean = !selected;
			
			(this.parent as CharacterBustOverrideSelector).deselectChildren();
			
			selected = setState;
		}
	}

}