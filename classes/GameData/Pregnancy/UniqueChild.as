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
			
			return newRace;
		}
		private function stripRace(race:String = ""):String
		{
			if(race.indexOf("half-") != -1) race = race.replace("half-", "");
			if(race.indexOf("half ") != -1) race = race.replace("half ", "");
			if(race.indexOf("-morph") != -1) race = race.replace("-morph", "");
			if(race.indexOf(" morph") != -1) race = race.replace(" morph", "");
			if(race.indexOf("-taur") != -1) race = race.replace("-taur", "");
			
			return race;
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