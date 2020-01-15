package classes.Resources.Busts 
{
	import flash.geom.Rectangle;
	/**
	 * ...
	 * @author Fen
	 */
	public class R4Busts 
	{
		public function get PREVIEW():Class { return Bust_SIDEWINDER; }
		
		[Embed(source = "../../../assets/images/npcs/r4/sidewinder.png", mimeType = "image/png")]
		public var Bust_SIDEWINDER:Class;
		public var Bounds_SIDEWINDER:Rectangle = new Rectangle(0, 20, 90, 80);
		
		CONFIG::IMAGEPACK
		{
			[Embed(source = "../../../assets/images/npcs/r4/HR/sidewinder.png", mimeType = "image/png")]
			public var Full_SIDEWINDER:Class;
		}
	}

}