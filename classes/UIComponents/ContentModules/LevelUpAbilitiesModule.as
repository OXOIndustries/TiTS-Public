package UIComponents.ContentModules 
{
	import classes.UIComponents.ContentModule;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class LevelUpAbilitiesModule extends ContentModule
	{
		
		public function LevelUpAbilitiesModule() 
		{
			leftBarEnabled = true;
			rightBarEnabled = true;
			fullButtonTrayEnabled = true;
			_moduleName = "LevelUp";
			
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			
			this.Build();
		}
		
		private function Build():void
		{
			
		}
	}

}