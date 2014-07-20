package classes.TITSSaveEdit.Data 
{
	/**
	 * ...
	 * @author Gedan
	 */
	public class CoCCockClass 
	{
		public var cockLength:Number;
		public var cockThickness:Number;
		public var cockType:int;
		public var knotMultiplier:Number;
		public var isPierced:Boolean;
		public var pierced:Number;
		public var pShortDesc:String;
		public var pLongDesc:String;
		public var sock:String;
		
		public function CoCCockClass() 
		{
			cockLength = 5.5;
			cockThickness = 1;
			cockType = 0;
			pierced = 0;
			knotMultiplier = 1;
			isPierced = false;
			pShortDesc = "";
			pLongDesc = "";
			sock = "";
		}
		
		public function loadSaveObject(o:Object):void
		{
			this.cockLength = o.cockLength;
			this.cockThickness = o.cockThickness;
			this.cockType = o.cockType;
			this.knotMultiplier = o.knotMultiplier;
			this.pLongDesc = o.pLongDesc;
			this.pShortDesc = o.pShortDesc;
			this.pierced = o.pierced;
			this.sock = o.sock;
		}
		
		// Assistance methods so we can figure
		// out ways to mod values into
		// TiTs standards
		public function cArea():Number
		{
			return cockThickness * cockLength;
		}
	}

}