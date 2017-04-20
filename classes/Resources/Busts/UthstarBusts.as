package classes.Resources.Busts 
{
	/**
	 * ...
	 * @author Gedan
	 */
	public class UthstarBusts
	{
		public function get PREVIEW():Class { return Bust_SEXBOT_FEMALE; }

		[Embed(source = "../../../assets/images/npcs/uthstar/kaska.png", mimeType = "image/png")]
		public var Bust_KASKA:Class;
		public function get Bust_KASKA_NUDE():Class { return Bust_KASKA; }
		
		[Embed(source = "../../../assets/images/npcs/uthstar/sexbot_female.png", mimeType = "image/png")]
		public var Bust_SEXBOT_FEMALE:Class;

		CONFIG::IMAGEPACK
		{
			[Embed(source = "../../../assets/images/npcs/uthstar/hr/kaska.png", mimeType = "image/png")]
			public var Full_KASKA:Class;
			public function get Full_KASKA_NUDE():Class { return Full_KASKA; }
			
			[Embed(source = "../../../assets/images/npcs/uthstar/hr/sexbot_female.png", mimeType = "image/png")]
			public var Full_SEXBOT_FEMALE:Class;
		}
	}

}