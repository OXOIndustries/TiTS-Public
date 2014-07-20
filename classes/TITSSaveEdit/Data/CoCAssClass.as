package classes.TITSSaveEdit.Data 
{
	/**
	 * ...
	 * @author Gedan
	 */
	public class CoCAssClass 
	{
		public var analLooseness:int;
		public var analWetness:int;
		public var fullness:int;
		
		public function CoCAssClass() 
		{
			analLooseness = 0;
			analWetness = 0;
			fullness = 0;
		}
		
		public function loadSaveObject(o:Object):void
		{
			this.analLooseness = o.analLooseness;
			this.analWetness = o.analWetness;
			this.fullness = o.fullness;
		}
	}

}