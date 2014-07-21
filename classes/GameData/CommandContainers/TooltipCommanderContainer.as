package classes.GameData.CommandContainers 
{
	import classes.GameData.CommandContainer;
	/**
	 * ...
	 * @author Gedan
	 */
	public class TooltipCommanderContainer extends CommandContainer
	{
		public var ttBody:String;
		public var ttHeader:String;
		public var consumed:Boolean;
		
		public function TooltipCommanderContainer() 
		{
			ttBody = null;
			ttHeader = null;
			consumed = false;
		}
		
	}

}