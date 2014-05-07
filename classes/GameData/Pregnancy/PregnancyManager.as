package classes.GameData.Pregnancy 
{
	/**
	 * ...
	 * @author Gedan
	 */
	public class PregnancyManager 
	{
		private var _pregHandlers:Vector.<BasePregnancyHandler>;
		
		public function PregnancyManager() 
		{
			_pregHandlers = new Vector.<BasePregnancyHandler>();
		}
		
		public function insertNewHandler(pHandler:BasePregnancyHandler):void
		{
			_pregHandlers.push(pHandler);
		}
	}

}