package classes.Resources.Busts 
{
	import flash.geom.Rectangle;
	/**
	 * ...
	 * @author Gedan
	 */
	public class TsudaBusts 
	{
		public function get PREVIEW():Class { return Bust_KALLY; }
		
		[Embed(source = "../../../assets/images/npcs/tsuda/kiro.png", mimeType = "image/png")]
		public var Bust_KIRO:Class;
		//[Embed(source = "../../../assets/images/npcs/tsuda/kiro_nude.png", mimeType = "image/png")]
		//public var Bust_KIRO_NUDE:Class;
		public function get Bust_KIRO_NUDE():Class { return Bust_KIRO; }
		public function get Bust_KIRO_1():Class { return Bust_KIRO; }
		public function get Bust_KIRO_1_NUDE():Class { return Bust_KIRO_NUDE; }
		public function get Bust_KIRO_2():Class { return Bust_KIRO; }
		public function get Bust_KIRO_2_NUDE():Class { return Bust_KIRO_NUDE; }
		public function get Bust_KIRO_SM_NUDE():Class { return Bust_KIRO_NUDE; }
		public function get Bust_KIRO_SM_1_NUDE():Class { return Bust_KIRO_NUDE; }
		public function get Bust_KIRO_SM_2_NUDE():Class { return Bust_KIRO_NUDE; }
		public function get Bust_KIRO_LG_NUDE():Class { return Bust_KIRO_NUDE; }
		public function get Bust_KIRO_LG_1_NUDE():Class { return Bust_KIRO_NUDE; }
		public function get Bust_KIRO_LG_2_NUDE():Class { return Bust_KIRO_NUDE; }
		public function get Bust_KIRO_XL_NUDE():Class { return Bust_KIRO_NUDE; }
		public function get Bust_KIRO_XL_1_NUDE():Class { return Bust_KIRO_NUDE; }
		public function get Bust_KIRO_XL_2_NUDE():Class { return Bust_KIRO_NUDE; }

		[Embed(source = "../../../assets/images/npcs/tsuda/kally.png", mimeType = "image/png")]
		public var Bust_KALLY:Class;
		//[Embed(source = "../../../assets/images/npcs/tsuda/kally_nude.png", mimeType = "image/png")]
		//public var Bust_KALLY_NUDE:Class;

		CONFIG::IMAGEPACK
		{
			[Embed(source = "../../../assets/images/npcs/tsuda/hr/kiro.png", mimeType = "image/png")]
			public var Full_KIRO:Class;
			//[Embed(source = "../../../assets/images/npcs/tsuda/hr/kiro_nude.png", mimeType = "image/png")]
			//public var Full_KIRO_NUDE:Class;
			//PLACEHOLDER TILL ABOVE IS DONE
			public function get Full_KIRO_NUDE():Class { return Full_KIRO; }
			public function get Full_KIRO_1():Class { return Full_KIRO; }
			public function get Full_KIRO_1_NUDE():Class { return Full_KIRO_NUDE; }
			public function get Full_KIRO_2():Class { return Full_KIRO; }
			public function get Full_KIRO_2_NUDE():Class { return Full_KIRO_NUDE; }
			public function get Full_KIRO_SM_NUDE():Class { return Full_KIRO_NUDE; }
			public function get Full_KIRO_SM_1_NUDE():Class { return Full_KIRO_NUDE; }
			public function get Full_KIRO_SM_2_NUDE():Class { return Full_KIRO_NUDE; }
			public function get Full_KIRO_LG_NUDE():Class { return Full_KIRO_NUDE; }
			public function get Full_KIRO_LG_1_NUDE():Class { return Full_KIRO_NUDE; }
			public function get Full_KIRO_LG_2_NUDE():Class { return Full_KIRO_NUDE; }
			public function get Full_KIRO_XL_NUDE():Class { return Full_KIRO_NUDE; }
			public function get Full_KIRO_XL_1_NUDE():Class { return Full_KIRO_NUDE; }
			public function get Full_KIRO_XL_2_NUDE():Class { return Full_KIRO_NUDE; }

			[Embed(source = "../../../assets/images/npcs/tsuda/hr/kally.png", mimeType = "image/png")]
			public var Full_KALLY:Class;
			//[Embed(source = "../../../assets/images/npcs/tsuda/hr/kally_nude.png", mimeType = "image/png")]
			//public var Full_KALLY_NUDE:Class;
		}
	}

}