package classes.Resources.Busts 
{
	/**
	 * ...
	 * @author Gedan
	 */
	public class BNGBusts
	{
		public function get PREVIEW():Class { return Bust_NEVRIE; }
		//public function get SIGNATURE():Class { return SigEmbed; }
		
		//[Embed(source = "../../../assets/images/sig/bng.png", mimeType = "image/png")]
		//public var SigEmbed:Class;

		[Embed(source = "../../../assets/images/npcs/bng/nevrie.png", mimeType = "image/png")]
		public var Bust_NEVRIE:Class;
		public function get Bust_NEVRIE_NUDE():Class { return Bust_NEVRIE; }
		
		[Embed(source = "../../../assets/images/npcs/bng/nuka_a.png", mimeType = "image/png")]
		public var Bust_NUKA_A:Class;
		
		[Embed(source = "../../../assets/images/npcs/bng/nuka_b.png", mimeType = "image/png")]
		public var Bust_NUKA_B:Class;
		
		CONFIG::IMAGEPACK
		{
			[Embed(source = "../../../assets/images/npcs/bng/HR/nevrie.png", mimeType = "image/png")]
			public var Full_NEVRIE:Class;
			
			[Embed(source = "../../../assets/images/npcs/bng/HR/nuka_a.png", mimeType = "image/png")]
			public var Full_NUKA_A:Class;
			
			[Embed(source = "../../../assets/images/npcs/bng/HR/nuka_b.png", mimeType = "image/png")]
			public var Full_NUKA_B:Class;
		}
	}

}