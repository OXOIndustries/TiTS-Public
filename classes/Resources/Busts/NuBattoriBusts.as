package classes.Resources.Busts 
{
	/**
	 * ...
	 * @author Fenbutts
	 */
	public class NuBattoriBusts 
	{
		public function get PREVIEW():Class { return Bust_BRIHA; }
		
		[Embed(source = "../../../assets/images/npcs/NuBattori/briha.png", mimeType = "image/png")]
		public var Bust_BRIHA:Class;
		public function get Bust_BRIHA_NUDE():Class { return Bust_BRIHA; }
		public function get Bust_BRIHA_PREGNANT():Class { return Bust_BRIHA; }
		public function get Bust_BRIHA_PREGNANT_NUDE():Class { return Bust_BRIHA; }
		
		CONFIG::IMAGEPACK
		{
			[Embed(source = "../../../assets/images/npcs/NuBattori/hr/briha.png", mimeType = "image/png")]
			public var Full_BRIHA:Class;
			public function get Full_BRIHA_NUDE():Class { return Full_BRIHA; }
			public function get Full_BRIHA_PREGNANT():Class { return Full_BRIHA; }
			public function get Full_BRIHA_PREGNANT_NUDE():Class { return Full_BRIHA; }
		}
	}

}