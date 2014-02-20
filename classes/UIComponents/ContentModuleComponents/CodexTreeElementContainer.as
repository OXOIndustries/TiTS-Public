package classes.UIComponents.ContentModuleComponents 
{
	import classes.UIComponents.ContentModuleComponents.CodexTreeHeader;
	import fl.containers.ScrollPane;
	import flash.events.Event;
	import flash.text.TextField;
	import classes.GameData.CodexManager;
	
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
		private var _headers:Vector.<CodexTreeHeader>;
		
		private var _activeHeader:int;
		
		private var _currentLinks:TextField;
		private var _currentLinkSplice:int;
		
		private var _previousLinks:TextField;
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
			this._activeHeader = -1;
			this._currentLinkSplice = -1;
			this._previousLinkSplice = -1;
			
			this.InitLayout();
		}
		
		private function InitLayout():void
		{
			var headers:Array = CodexManager.getCodexCategories();
			
			for (var i:int = 0; i < headers.length; i++)
			{
				var newHeader:CodexTreeHeader = new CodexTreeHeader();
				this.addChild(newHeader);
				newHeader.x = 0;
				newHeader.y = (i == 0) ? 5 : _headers[i - 1].y + _headers[i - 1].height;
				_headers.push(newHeader);
			}
		}
		
		public function updateContent():void
		{
			
		}
	}

}