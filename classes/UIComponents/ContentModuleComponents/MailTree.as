package classes.UIComponents.ContentModuleComponents 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import classes.UIComponents.UIStyleSettings;
	import flash.text.AntiAliasType;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class MailTree extends Sprite
	{
		/*
			Base background sidebar
			> 3 stripe sprites to form columns
			> scrollpane overlaid
			>> each mail entry
			>>> background block of column color to provide hittarget expansion from text
		*/
		private var _background:Sprite;
		
		private var _sortOn:String;
		private var _sortDir:uint;
		
		private var _subjectHeader:TextField;
		private var _subjectSortIcon:Sprite;
		private var _subjectBkg:Sprite;
		
		private var _fromHeader:TextField;
		private var _fromSortIcon:Sprite;
		private var _fromBkg:Sprite;
		
		private var _dateHeader:TextField;
		private var _dateSortIcon:Sprite;
		private var _dateBkg:Sprite;
		
		private var _headerUnderline:Sprite;
		
		private var _mailEntries:MailTreeElementContainer;
		
		public function MailTree() 
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			BuildContainer();
			BuildElementContainer();
		}
		
		private function BuildContainer():void
		{
			_background = new Sprite();
			_background.graphics.beginFill(UIStyleSettings.gForegroundColour, 1);
			_background.graphics.drawRect(0, 0, 500, 740);
			_background.graphics.endFill();
			addChild(_background);
			
			_headerUnderline = new Sprite();
			_headerUnderline.graphics.beginFill(UIStyleSettings.gHighlightColour, 1);
			_headerUnderline.graphics.drawRect(0, 0, _background.width - 10, 3);
			_headerUnderline.graphics.endFill();
			_headerUnderline.x = 10;
			_headerUnderline.y = 32;
			addChild(_headerUnderline);
			
			_subjectHeader = new TextField();
			_subjectHeader.x = 6;
			_subjectHeader.y = 4;
			_subjectHeader.width = 200;
			_subjectHeader.height = 34;
			_subjectHeader.defaultTextFormat = UIStyleSettings.gNameHeaderFormatter;
			_subjectHeader.embedFonts = true;
			_subjectHeader.antiAliasType = AntiAliasType.ADVANCED;
			_subjectHeader.text = "Subject";
			_subjectHeader.mouseEnabled = false;
			_subjectHeader.mouseWheelEnabled = false;
			addChild(_subjectHeader);

			_subjectBkg = new Sprite();
			_subjectBkg.graphics.beginFill(UIStyleSettings.gBackgroundColour, 1);
			_subjectBkg.graphics.drawRect(0, 0, 230, 695);
			_subjectBkg.graphics.endFill();
			_subjectBkg.x = 5;
			_subjectBkg.y = 40;
			addChild(_subjectBkg);
			
			_fromHeader = new TextField();
			_fromHeader.x = 240;
			_fromHeader.y = 4;
			_fromHeader.width = 75;
			_fromHeader.height = 34;
			_fromHeader.defaultTextFormat = UIStyleSettings.gNameHeaderFormatter;
			_fromHeader.embedFonts = true;
			_fromHeader.antiAliasType = AntiAliasType.ADVANCED;
			_fromHeader.text = "From";
			_fromHeader.mouseEnabled = false;
			_fromHeader.mouseWheelEnabled = false;
			addChild(_fromHeader);

			_fromBkg = new Sprite();
			_fromBkg.graphics.beginFill(UIStyleSettings.gBackgroundColour, 1);
			_fromBkg.graphics.drawRect(0, 0, 125, 695);
			_fromBkg.graphics.endFill();
			_fromBkg.x = 240;
			_fromBkg.y = 40;
			addChild(_fromBkg);

			_dateHeader = new TextField();
			_dateHeader.x = 370;
			_dateHeader.y = 4;
			_dateHeader.width = 75;
			_dateHeader.height = 34;
			_dateHeader.defaultTextFormat = UIStyleSettings.gNameHeaderFormatter;
			_dateHeader.embedFonts = true;
			_dateHeader.antiAliasType = AntiAliasType.ADVANCED;
			_dateHeader.text = "Date";
			_dateHeader.mouseEnabled = false;
			_dateHeader.mouseWheelEnabled = false;
			addChild(_dateHeader);

			_dateBkg = new Sprite();
			_dateBkg.graphics.beginFill(UIStyleSettings.gBackgroundColour, 1);
			_dateBkg.graphics.drawRect(0, 0, 110, 695);
			_dateBkg.graphics.endFill();
			_dateBkg.x = 370;
			_dateBkg.y = 40;
			addChild(_dateBkg);
		}
		
		private function BuildElementContainer():void
		{
			var ns:MovieClip = new MovieClip();
			
			_mailEntries = new MailTreeElementContainer();
			_mailEntries.x = 5;
			_mailEntries.y = 40;
			_mailEntries.width = _background.width - _mailEntries.x;
			_mailEntries.height = _background.height - _mailEntries.y - 5;
			_mailEntries.setStyle("skin", ns);
			_mailEntries.setStyle("upSkin", ns);
			addChild(_mailEntries);
		}
		
		public function hiddenFromStage():void
		{
			_mailEntries.hiddenFromStage();
		}
		
		public function update():void
		{
			_mailEntries.updateContent();
		}
	}

}