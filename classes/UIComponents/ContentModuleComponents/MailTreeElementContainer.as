package classes.UIComponents.ContentModuleComponents 
{
	import classes.UIComponents.ContentModules.MailModule;
	import fl.containers.ScrollPane;
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import classes.GameData.MailManager;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class MailTreeElementContainer extends ScrollPane
	{
		private var _content:MovieClip;
		
		private var _sortOn:String = "ViewedTimestamp";
		private var _sortDir:uint = Array.DESCENDING;
		
		public function set sortOn(v:String):void { _sortOn = v; }
		public function set sortDir(v:uint):void { _sortDir = v; }
		
		public function MailTreeElementContainer() 
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
			opaqueBackground = null;
			_content = new MovieClip();
			_content.name = "controlContent";
			source = _content;
			mouseChildren = true;
		}
		
		private function sortEntries(entries:Array):Array
		{
			switch (_sortOn)
			{
				case "SUBJECT":
					entries.sortOn(["SubjectCache", "UnlockedTimestamp"], [Array.CASEINSENSITIVE, Array.NUMERIC | Array.DESCENDING]);
					return entries;
					break;
					
				case "SENDER":
					entries.sortOn(["FromCache", "UnlockedTimestamp"], [Array.CASEINSENSITIVE, Array.NUMERIC | Array.DESCENDING]);
					return entries;
					break;
					
				case "DATE":
					entries.sortOn("UnlockedTimestamp", Array.NUMERIC | Array.DESCENDING);
					return entries;
					break;
				
				case "UNREAD":
				default:
					var un:Array = [];
					var r:Array = [];
					
					// split into read/unread
					for (var i:int = 0; i < entries.length; i++)
					{
						if (entries[i].ViewedTimestamp == null || entries[i].ViewedTimestamp == undefined)
						{
							un.push(entries[i]);
						}
						else
						{
							r.push(entries[i]);
						}
					}
					
					un.sortOn("UnlockedTimestamp", Array.NUMERIC | Array.DESCENDING);
					r.sortOn("UnlockedTimestamp", Array.NUMERIC | Array.DESCENDING);
					
					entries = un.concat(r);
					return entries;
					break;
			}
		}
		
		public function updateContent():void
		{
			var cEntries:Array = MailManager.getUnlockedEntries();
			
			// When sorting by "sent" date/time, we should really sort by multiple fields to ensure a consistent order
			// (as the entry data is stored in an Object, the order-of-access to create the array returned by getUnlockedEntries()
			// is not consistent - we can't count on it to be the same, ao every update would change the order mails are displayed).
			// In reality though, it's unlikely we'd ever have to deal with this JUST for unlocked/viewed datetimes so.
			cEntries.sortOn(_sortOn, _sortDir);
			
			for (var i:int = 0; i < cEntries.length; i++)
			{
				if (_content.numChildren == 0 || _content.numChildren < i + 1)
				{
					var elem:MailTreeElement = new MailTreeElement();
					elem.handler = clickHandler;
					
					if (_content.numChildren > 0)
					{
						var aelem:DisplayObject = _content.getChildAt(_content.numChildren - 1);
						elem.y = aelem.y + aelem.height;
					}
					_content.addChild(elem);
				}
				
				var tar:MailTreeElement = _content.getChildAt(i) as MailTreeElement;
				tar.visible = true;
				
				tar.clear();
				
				tar.subject = cEntries[i].SubjectCache;
				tar.from = cEntries[i].FromCache;
				tar.date = cEntries[i].UnlockedTimestamp;
				
				if (cEntries[i].ViewedTimestamp == undefined)
				{
					tar.SetUnread();
				}
				else
				{
					tar.SetRead();
				}
				
				tar.key = cEntries[i].KeyReference;
			}
			
			for (; i < _content.numChildren; i++)
			{
				var blank:MailTreeElement = _content.getChildAt(i) as MailTreeElement;
				blank.visible = false;
			}
			
			update();
		}
		
		public function hiddenFromStage():void
		{
			
		}
		
		private function clickHandler(e:MouseEvent):void
		{
			var key:String = (e.target as MailTreeElement).key;
			(parent.parent as MailModule).displayFor(key);
		}
		
	}

}