package classes.GameData.Pregnancy 
{
	/**
	 * ...
	 * @author Gedan
	 */
	public class UniqueChild extends Child
	{
		public var Name:String;
		
		// I imagine for unique children we might also do some feature randomisation based on the pcs race at conception/birth
		// but we can handle storing/querying that on a per-child basis, ie, similar to how we ave lots of Creature subclasses
		// we can have a bunch of UniqueChild subclasses.
		
		override public function GetSaveObject():Object
		{
			var o:Object = super.GetSaveObject();
			o.Name = Name;
			return o;
		}
		
		override public function LoadSaveObject(o:Object):void
		{
			Name = o.Name;
			super.LoadSaveObject(o);
		}
	}

}