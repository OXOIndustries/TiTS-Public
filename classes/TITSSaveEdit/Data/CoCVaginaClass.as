package classes.TITSSaveEdit.Data 
{
	/**
	 * ...
	 * @author Gedan
	 */
	public class CoCVaginaClass 
	{
		public var vaginalWetness:Number;
		public var vaginalLooseness:Number;
		public var type:int;
		public var virgin:Boolean;
		public var fullness:Number;
		public var labiaPierced:Number;
		public var labiaPShort:String;
		public var labiaPLong:String;
		public var clitPierced:Number;
		public var clitPShort:String;
		public var clitPLong:String;
		
		public function CoCVaginaClass() 
		{
			vaginalWetness = 0;
			vaginalLooseness = 0;
			type = 0;
			virgin = true;
			fullness = 0;
			labiaPierced = 0;
			labiaPShort = "";
			labiaPLong = "";
			clitPierced = 0;
			clitPShort = "";
			clitPLong = "";
		}
		
		public function loadSaveObject(o:Object):void 
		{
			this.clitPLong = o.clitPLong;
			this.clitPShort = o.clitPShort;
			this.clitPierced = o.clipPierced;
			this.fullness = o.fullness;
			this.labiaPLong = o.labiaPLong;
			this.labiaPShort = o.labiaPShort;
			this.labiaPierced = o.labiaPierced;
			this.type = o.type;
			this.vaginalLooseness = o.vaginalLooseness;
			this.vaginalWetness = o.vaginalWetness;
			this.virgin = o.virgin;
		}
		
		public function capacity():Number
		{
			switch (vaginalLooseness) 
			{
				case 0: return 8;
				case 1:	return 16;
				case 2: return 24;
				case 3: return 36;
				case 4: return 56;
				case 5: return 100;
				default: return 10000;
			}
		}
	}

}