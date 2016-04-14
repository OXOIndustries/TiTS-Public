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
		
		[Embed(source = "../../../assets/images/npcs/uthstar/sexbot_female.png", mimeType = "image/png")]
		public var Bust_SEXBOT_FEMALE:Class;

		CONFIG::IMAGEPACK
		{
			[Embed(source = "../../../assets/images/npcs/uthstar/hr/kaska.png", mimeType = "image/png")]
			public var Full_KASKA:Class;
			
			[Embed(source = "../../../assets/images/npcs/uthstar/hr/sexbot_female.png", mimeType = "image/png")]
			public var Full_SEXBOT_FEMALE:Class;
		}
	}

}