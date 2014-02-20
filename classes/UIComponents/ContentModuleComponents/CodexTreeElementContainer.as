package classes.UIComponents.ContentModuleComponents 
{
	import classes.UIComponents.ContentModuleComponents.CodexTreeHeader;
	import fl.containers.ScrollPane;
	import flash.events.Event;
	/**
	 * OH GOD. OH GOD OH GOD OHGODOHGODOHOGOD.
	 * @author Gedan
	 */
	public class CodexTreeElementContainer extends ScrollPane
	{
		private var _headers:Vector.<CodexTreeHeader>;
		
		public function CodexTreeElementContainer() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			
			_headers = new Vector.<CodexTreeHeader>();
			this.opaqueBackground = null;
			
			this.BuildTestHeaders();
		}
		
		private function BuildTestHeaders():void
		{
			var header:CodexTreeHeader = new CodexTreeHeader();
			this.addChild(header);
			header.labelText = "PEOPLE";
			header.x = 0;
			header.y = 5;
			_headers.push(header);
			
			header = new CodexTreeHeader();
			this.addChild(header);
			header.labelText = "RACES";
			header.x = 0;
			header.y = _headers[0].y + _headers[0].height + 5;
			_headers.push(header);
			header.Highlight();
			
			header = new CodexTreeHeader();
			this.addChild(header);
			header.labelText = "PLACES";
			header.x = 0;
			header.y = _headers[1].y + _headers[1].height + 5;
			_headers.push(header);
			
			header = new CodexTreeHeader();
			this.addChild(header);
			header.labelText = "EVENTS";
			header.x = 0;
			header.y = _headers[2].y + _headers[2].height + 5;
			_headers.push(header);
		}
		
	}

}