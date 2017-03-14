package classes.Resources.Busts 
{
	/**
	 * ...
	 * @author Gedan
	 */
	public class ManiacPaintBusts
	{
		public function get PREVIEW():Class { return Bust_LIEVE; }
	
		[Embed(source = "../../../assets/images/npcs/maniacpaint/lieve.png", mimeType = "image/png")]
		public var Bust_LIEVE:Class;
		public function get Bust_LIEVE_NUDE():Class { return Bust_LIEVE; }
		
		CONFIG::IMAGEPACK
		{
			[Embed(source = "../../../assets/images/npcs/maniacpaint/hr/lieve.png", mimeType = "image/png")]
			public var Full_LIEVE:Class;
			public function get Full_LIEVE_NUDE():Class { return Full_LIEVE; }
		}
	}

}