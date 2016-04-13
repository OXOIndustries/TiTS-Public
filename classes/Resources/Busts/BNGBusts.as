package classes.Resources.Busts 
{
	/**
	 * ...
	 * @author Gedan
	 */
	public class BNGBusts
	{
		public function get PREVIEW():Class { return Bust_NEVRIE; }

		[Embed(source = "../../../assets/images/npcs/bng/nevrie.png", mimeType = "image/png")]
		public var Bust_NEVRIE:Class;
		
		CONFIG::IMAGEPACK
		{
			[Embed(source = "../../../assets/images/npcs/bng/hr/nevrie.png", mimeType = "image/png")]
			public var Full_NEVRIE:Class;
		}
	}

}