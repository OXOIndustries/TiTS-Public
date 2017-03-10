package classes.Resources.Busts 
{
	import flash.geom.Rectangle;
	/**
	 * ...
	 * @author Gedan
	 */
	public class PeeKayBusts
	{
		public function get PREVIEW():Class { return Bust_KARA; }
	
		[Embed(source = "../../../assets/images/npcs/peekay/kara.png", mimeType = "image/png")]
		public var Bust_KARA:Class;
		public var Bounds_KARA:Rectangle = new Rectangle(0, 7, 70, 80);
		public function get Bust_KARA_NUDE():Class { return Bust_KARA; }

		CONFIG::IMAGEPACK
		{
			[Embed(source = "../../../assets/images/npcs/peekay/hr/kara.png", mimeType = "image/png")]
			public var Full_KARA:Class;
			public function get Full_KARA_NUDE():Class { return Full_KARA; }
		}
	}

}