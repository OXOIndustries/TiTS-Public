package classes.UIComponents.ContentModuleComponents 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	/**
	 * ...
	 * @author Gedan
	 */
	public class PerkDetailsPane extends Sprite
	{
		private var _selectedText:TextField;
		private var _selectedPerkName:TextField;
		
		private var _textBlock:Sprite;
		private var _selectedPerkText:TextField;
		
		public function PerkDetailsPane() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		this.Build();
		
	}

}