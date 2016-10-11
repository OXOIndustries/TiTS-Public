package classes.GameData.Pregnancy 
{
	/**
	 * ...
	 * @author Gedan
	 */
	public class UniqueChild extends Child
	{
		public var Name:String;
		public var UniqueParent:String; // For attaching to a specific character.
		
		// I imagine for unique children we might also do some feature randomisation based on the pcs race at conception/birth
		// but we can handle storing/querying that on a per-child basis, ie, similar to how we ave lots of Creature subclasses
		// we can have a bunch of UniqueChild subclasses.
		
		public var originalRace:String = "NOT SET"; // For very specific race designation that "RaceType" can't offer?
		public var skinTone:String = "NOT SET";
		public var lipColor:String = "NOT SET";
		public var nippleColor:String = "NOT SET";
		public var eyeColor:String = "NOT SET";
		public var hairColor:String = "NOT SET";
		public var scaleColor:String = "NOT SET";
		public var furColor:String = "NOT SET";
		
		public function hybridizeRace(mRace:String = "", cRace:String = ""):String
		{
			var newRace:String = cRace;
			mRace = stripRace(mRace);
			cRace = stripRace(cRace);
			
			if(mRace != "" && cRace != "" && mRace != cRace) newRace = (mRace + "-" + mRace + " hybrid");
			else newRace = cRace;
			
			// Insert special cases here!
			if(newRace.indexOf("robot-") != -1 || newRace.indexOf("-robot") != -1) newRace = "cyborg";
			if(newRace == "") newRace = "NOT SET";
			
			return newRace;
		}
		private function stripRace(sRace:String = ""):String
		{
			if(sRace.indexOf("half-") != -1) sRace = sRace.replace("half-", "");
			if(sRace.indexOf("half ") != -1) sRace = sRace.replace("half ", "");
			if(sRace.indexOf("-morph") != -1) sRace = sRace.replace("-morph", "");
			if(sRace.indexOf(" morph") != -1) sRace = sRace.replace(" morph", "");
			if(sRace.indexOf("-hybrid") != -1) sRace = sRace.replace("-hybrid", "");
			if(sRace.indexOf(" hybrid") != -1) sRace = sRace.replace(" hybrid", "");
			if(sRace.indexOf("-taur") != -1) sRace = sRace.replace("-taur", "");
			if(sRace.indexOf("NOT SET") != -1) sRace = "";
			
			return sRace;
		}
		
		override public function GetSaveObject():Object
		{
			var o:Object = super.GetSaveObject();
			
			o.Name = Name;
			o.UniqueParent = UniqueParent;
			
			o.originalRace = originalRace;
			o.skinTone = skinTone;
			o.lipColor = lipColor;
			o.nippleColor = nippleColor;
			o.eyeColor = eyeColor;
			o.hairColor = hairColor;
			o.scaleColor = scaleColor;
			o.furColor = furColor;
			
			return o;
		}
		
		override public function LoadSaveObject(o:Object):void
		{
			Name = o.Name;
			UniqueParent = o.UniqueParent;
			
			originalRace = o.originalRace;
			skinTone = o.skinTone;
			lipColor = o.lipColor;
			nippleColor = o.nippleColor;
			eyeColor = o.eyeColor;
			hairColor = o.hairColor;
			scaleColor = o.scaleColor;
			furColor = o.furColor;
			
			super.LoadSaveObject(o);
		}
	}

}