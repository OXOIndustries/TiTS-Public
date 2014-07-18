package classes.TITSSaveEdit.Data 
{
	import classes.VaginaClass;
	/**
	 * ...
	 * @author Gedan
	 */
	public class CoCCharacterData 
	{
		// Something I think might be kinda cool (as in I'm going to do this before we "release" the save editor") is making a few quick references to CoC the first time you load a save that had a CoC char imported.
		// I'll round up some progression flags or properties to maybe hang off once this is all working at a minimum level.
		
		public var short:String;
		
		public var level:int;
		public var xp:int;
		
		public var femininity:int;
		
		public var skinAdj:String;
		public var skinDesc:String;
		public var skinTone:String;
		
		public var skinType:int;
		
		public var tailType:int;
		public var tallness:int;
		public var tone:int;
		public var thickness:int;
		public var tongueType:int;
		public var wingDesc:String;
		public var wingType:int;
			
		public var nippleLength:Number;
		
		public var armType:int;
		public var eyeType:int;
		public var faceType:int
		
		public var hairColor:String;
		public var hairType:int;
		public var hairLength:int;
		public var hipRating:int;
		public var hornType:int;
		public var horns:int;
		public var hoursSinceCum:int;
		
		public var balls:int;
		public var ballSize:Number;
		
		public var buttRating:Number;
		public var clitLength:Number;
		
		public var cumMultiplier:Number;
		public var earType:int;
		// public var earValue:int; // Appears to be a dead property. It's only ever assigned to twice in the entirety of the CoC codebase and never seems to be checked against.
		
		
		public var ass:VaginaClass;
		public var breastRows:Array;
		public var cocks:Array;
		public var vaginas:Array;
		
		public function CoCCharacterData() 
		{
			short = "";
		}
		
		public function loadSaveObject(o:Object):void
		{
			var inData:Object = clone(o);
			
			
		}
		
		private function clone(o:Object):Object
		{
			var cp:ByteArray = new ByteArray();
			cp.writeObject(o);
			cp.position = 0;
			var newO:Object = cp.readObject();
			return newO;
		}		
	}

}