package classes.GameData.Pregnancy 
{
	/**
	 * ...
	 * @author Gedan
	 */
	
	public class BasePregnancyHandler 
	{
		private var _handlesType:int;
		public function get handlesType():int { return _handlesType; }
		
		public function BasePregnancyHandler(pType:int) 
		{
			_handlesType = pType;
		}
	}
}