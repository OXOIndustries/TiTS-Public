package classes.Resources.Busts 
{
	import flash.geom.Rectangle;
	/**
	 * ...
	 * @author Fen
	 */
	public class JLikesToDrawBusts 
	{
		public function get PREVIEW():Class { return Bust_AKANE; }
		
		[Embed(source = "../../../assets/images/npcs/jlikestodraw/akane.png", mimeType = "image/png")]
		public var Bust_AKANE:Class;
		[Embed(source = "../../../assets/images/npcs/jlikestodraw/akane_nude.png", mimeType = "image/png")]
		public var Bust_AKANE_NUDE:Class;
		
		CONFIG::IMAGEPACK
		{
			[Embed(source = "../../../assets/images/npcs/jlikestodraw/hr/akane.png", mimeType = "image/png")]
			public var Full_AKANE:Class;
			[Embed(source = "../../../assets/images/npcs/jlikestodraw/hr/akane_nude.png", mimeType = "image/png")]
			public var Full_AKANE_NUDE:Class;
		}
	}
}