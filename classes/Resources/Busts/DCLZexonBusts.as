package classes.Resources.Busts 
{
	/**
	 * ...
	 * @author Fen
	 */
	public class DCLZexonBusts
	{
		public function get PREVIEW():Class { return Bust_ZIRESH }
		//public function get SIGNATURE():Class { return SigEmbed; }
		
		//[Embed(source = "../../../assets/images/sig/bng.png", mimeType = "image/png")]
		//public var SigEmbed:Class;

		[Embed(source = "../../../assets/images/npcs/dclzexon/ziresh.png", mimeType = "image/png")]
		public var Bust_ZIRESH:Class;
		
		[Embed(source = "../../../assets/images/npcs/dclzexon/berwyn.png", mimeType = "image/png")]
		public var Bust_BERWYN:Class;

		CONFIG::IMAGEPACK
		{
			[Embed(source = "../../../assets/images/npcs/dclzexon/HR/ziresh.png", mimeType = "image/png")]
			public var Full_ZIRESH:Class;

			[Embed(source = "../../../assets/images/npcs/dclzexon/HR/berwyn.png", mimeType = "image/png")]
			public var Full_BERWYN:Class;
		}
	}

}