package classes.UIComponents.ContentModuleComponents 
{
	import classes.UIComponents.ContentModuleComponents.CodexTreeHeader;
	import fl.containers.ScrollPane;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import classes.GameData.CodexManager;
	import classes.UIComponents.UIStyleSettings;
	import flash.text.AntiAliasType;
	import flash.events.TextEvent;
	
	/**
	 * OH GOD. OH GOD OH GOD OHGODOHGODOHGOD.
	 * OH GOD. OH GOD OH GOD OHGODOHGODOHGOD.
	 * OH GOD. OH GOD OH GOD OHGODOHGODOHGOD.
	 * OH GOD. OH GOD OH GOD OHGODOHGODOHGOD.
	 * OH GOD. OH GOD OH GOD OHGODOHGODOHGOD.
	 * OH GOD. OH GOD OH GOD OHGODOHGODOHGOD.
	 * OH GOD. OH GOD OH GOD OHGODOHGODOHGOD.
	 * OH GOD. OH GOD OH GOD OHGODOHGODOHGOD.
	 * @author Gedan
	 */
	public class CodexTreeElementContainer extends ScrollPane
	{
		private var _content:MovieClip;
		
		private var _headers:Vector.<CodexTreeHeader>;
		
		private var _currentLinks:TextField;
		private var _currentHeader:CodexTreeHeader;
		private var _currentLinkSplice:int;
		
		private var _previousLinks:TextField;
		private var _previousHeader:CodexTreeHeader;
		private var _previousLinkSplice:int;
		
		public function CodexTreeElementContainer() 
		{			
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			
			_headers = new Vector.<CodexTreeHeader>();
			this.opaqueBackground = null;
			
			this._currentHeader = null;
			this._currentLinkSplice = -1;
			
			this._previousHeader = null;
			this._previousLinkSplice = -1;
			
			_content = new MovieClip();
			_content.name = "controlContent";
			this.source = _content;
			
			this.InitLayout();
			
			this.update();
		}
		
		private function InitLayout():void
		{
			var headers:Array = CodexManager.getCodexCategories();
			
			for (var i:int = 1; i < headers.length; i++)
			{
				var newHeader:CodexTreeHeader = new CodexTreeHeader();
				_content.addChild(newHeader);
				newHeader.addEventListener(MouseEvent.CLICK, clickHandler);
				newHeader.name = String(i);
				newHeader.labelText = headers[i];
				newHeader.x = 0;
				newHeader.y = (_headers.length == 0) ? 5 : _headers[i - 2].y + _headers[i - 2].height + 5;
				_headers.push(newHeader);
			}
		}
		
		private function clickHandler(e:Event):void
		{
			var clickedHeader:CodexTreeHeader = e.currentTarget as CodexTreeHeader;
			
			if (_currentHeader != null)
			{
				// Probably need to ensure any previous Tween is finished / things are positioned as expected before doing this
				
				_previousHeader = _currentHeader;
				_previousLinkSplice = _currentLinkSplice;
				_previousHeader.DeHighlight();
			}
			
			_currentHeader = clickedHeader;
			_currentLinkSplice = int(clickedHeader.name);
			_currentHeader.Highlight();
			
			populateText();
			reposition();
			
			this.update();
		}
		
		private function reposition():void
		{
			// Move headers back to default positions
			for (var i:int = 0; i < _headers.length; i++)
			{
				_headers[i].y = (i == 0) ? 5 : _headers[i - 1].y + _headers[i - 1].height + 5;
			}
			
			// Position the new text in the container properly
			_currentLinks.y = _headers[_currentLinkSplice - 1].y + _headers[_currentLinkSplice - 1].height;// + 5;
			
			// And then for every header AFTER the link header, move them below it
			var newY:Number = _currentLinks.y + _currentLinks.height;// + 5;
			
			for (var ii:int = _currentLinkSplice; ii < _headers.length; ii++)
			{
				_headers[ii].y = newY;
				newY += _headers[ii].height + 5;
			}
		}
		
		private function populateText():void
		{
			// Get the new tree we need to insert
			var newTree:Object = CodexManager.getCodexTree(int(_currentHeader.name));
			var displayString:String = "<span class='words'><p><textformat tabstops='15,30,45,60,75,90'>" + buildTextTree(newTree) + "</textformat></p></span>";
			trace(displayString);
			
			// Remove the previous old text
			if (_previousLinks != null && _previousLinks.parent != null)
			{
				_content.removeChild(_previousLinks);
			}
			
			// Bump current to old
			_previousLinks = _currentLinks;
			
			// Temp, throw the old one out too
			if (_previousLinks != null && _previousLinks.parent != null)
			{
				_content.removeChild(_previousLinks);
			}
			
			// Build new
			_currentLinks = linkContainer();
			_currentLinks.htmlText = "<span class='words'><p>" + displayString + "</p></span>";
			_currentLinks.height = _currentLinks.textHeight + 5;
		}
		
		private function linkContainer():TextField
		{
			var tf:TextField = new TextField();
			tf.styleSheet = UIStyleSettings.gMainTextCSSStyleSheet;
			tf.width = 170;
			tf.multiline = true;
			tf.wordWrap = false;
			tf.embedFonts = true;
			tf.border = false;
			tf.antiAliasType = AntiAliasType.ADVANCED;
			tf.addEventListener(TextEvent.LINK, linkHandler);
			tf.selectable = false;
			_content.addChild(tf);
			
			return tf;
		}
		
		private function linkHandler(e:TextEvent):void
		{
			CodexManager.getEntryFunctor(e.text)();
			this.updateContent();
		}
		
		private function buildTextTree(treeBranch:Object, level:int = 0):String
		{
			var msg:String = "";
			var hasEntries:Boolean = false;
			
			var children:Array = new Array();
			
			for (var key:String in treeBranch)
			{
				hasEntries = true;
				
				if (treeBranch[key]["functor"] != undefined)
				{
					children.push({index:key, child:buildLeaf(treeBranch, key, level)});
				}
				else
				{
					children.push({index:key, child:(key as String) + "\n", subChildren:buildTextTree(treeBranch[key], level + 1)});
				}
			}
			
			if (hasEntries == false)
			{
				msg += "None Available";
			}
			else
			{
				children.sortOn("index", Array.CASEINSENSITIVE);
				
				for (var i:int = 0; i < children.length; i++)
				{
					msg += children[i].child;
					
					if (children[i].subChildren != undefined)
					{
						msg += children[i].subChildren;
					}
				}
			}
			
			return msg;
		}
		
		private function buildLeaf(leaf:Object, key:String, level:int = 0):String
		{
			var msg:String = "";
			
			for (var i:int = 0; i < level; i++)
			{
				msg += "\t";
			}
			
			if (CodexManager.entryUnlocked(key))
			{
				if (CodexManager.entryViewed(key))
				{
					msg += "<span class='viewed'><a href='event:" + key + "'>" + key + "</a></span>\n";
				}
				else
				{
					msg += "<span class='new'><a href='event:" + key + "'>" + key + "</a></span>\n";
				}
			}
			else
			{
				msg += "<span class='locked'>Locked</span>\n";
			}
			
			return msg;
		}
		
		public function updateContent():void
		{
			if (_currentHeader != null)
			{
				populateText();
				reposition();
			
				this.update();
			}
		}
	}

}