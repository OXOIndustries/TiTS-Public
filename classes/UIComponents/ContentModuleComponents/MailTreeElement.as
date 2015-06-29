package classes.UIComponents.ContentModuleComponents 
{
	import classes.Engine.Utility.DateContainer;
	import classes.UIComponents.ContentModules.MailModule;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.AntiAliasType;
	import classes.UIComponents.UIStyleSettings;
	import classes.GameData.MailManager;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class MailTreeElement extends Sprite
	{
		private var _isUnread:Boolean = true;
		
		private var _subjectT:String;
		private var _subject:TextField;
		
		private var _fromT:String;
		private var _from:TextField;
		
		private var _dateT:int;
		private var _date:TextField;
		
		private var _key:String;
		
		private var _handler:Function;
		public function set handler(v:Function):void { _handler = v; }
		
		public function set subject(v:String):void
		{ 
			_subjectT = v;
			_subject.htmlText = "<span class='" + (_isUnread ? "unread" : "read") + "'><p>" + v + "</p></span>";
		}
		public function set from(v:String):void
		{ 
			_fromT = v;
			_from.htmlText = "<span class='" + (_isUnread ? "unread" : "read") + "'><p>" + v + "</p></span>";
		}
		public function set date(v:int):void 
		{ 
			//_date.text = dt.toString();
			//_date.text = "Day 555 @ 23:50";
			
			_dateT = v;
			var dt:DateContainer = new DateContainer(v);
			_date.htmlText = "<span class='" + (_isUnread ? "unread" : "read") + "'><p>" + dt.toString() + "</p></span>";
		}
		
		public function set key(v:String):void { _key = v; }
		public function get key():String { return _key; }
		
		private var _hitTarget:Sprite;
		
		public function MailTreeElement() 
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			Build();
		}
		
		public function clear():void
		{
			_subject.text = "";
			_from.text = "";
			_date.text = "";
		}
		
		private function Build():void
		{
			addEventListener(MouseEvent.CLICK, _handler);
			
			_subject = new TextField();
			_subject.x = 0;
			_subject.y = 0;
			_subject.width = 230;
			_subject.height = 25;
			_subject.embedFonts = true;
			_subject.antiAliasType = AntiAliasType.ADVANCED;
			_subject.styleSheet = UIStyleSettings.gMailListCSSStyleSheet;
			_subject.text = "Subject";
			_subject.mouseEnabled = false;
			_subject.mouseWheelEnabled = false;
			addChild(_subject);
			
			_from = new TextField();
			_from.x = 235;
			_from.y = 0;
			_from.width = 125;
			_from.height = 25;
			_from.embedFonts = true;
			_from.antiAliasType = AntiAliasType.ADVANCED;
			_from.styleSheet = UIStyleSettings.gMailListCSSStyleSheet;
			_from.text = "From";
			_from.mouseEnabled = false;
			_from.mouseWheelEnabled = false;
			addChild(_from);
			
			_date = new TextField();
			_date.x = 365;
			_date.y = 0;
			_date.width = 110;
			_date.height = 25;
			_date.embedFonts = true;
			_date.antiAliasType = AntiAliasType.ADVANCED;
			_date.styleSheet = UIStyleSettings.gMailListCSSStyleSheet;
			_date.text = "Date";
			_date.mouseEnabled = false;
			_date.mouseWheelEnabled = false;
			addChild(_date);
		}
		
		public function SetUnread():void
		{
			if (_isUnread == false)
			{
				_isUnread = true;
				_subject.htmlText = "<span class='unread'><p>" + _subjectT + "</p></span>";
				_from.htmlText = "<span class='unread'><p>" + _fromT + "</p></span>";
				var dt:DateContainer = new DateContainer(_dateT);
				_date.htmlText = "<span class='unread'><p>" +  dt.toString() + "</p></span>";
			}
		}
		
		public function SetRead():void
		{
			if (_isUnread == true)
			{
				_isUnread = false;
				_subject.htmlText = "<span class='read'><p>" + _subjectT + "</p></span>";
				_from.htmlText = "<span class='read'><p>" + _fromT + "</p></span>";
				var dt:DateContainer = new DateContainer(_dateT);
				_date.htmlText = "<span class='read'><p>" +  dt.toString() + "</p></span>";
			}
		}
	}

}