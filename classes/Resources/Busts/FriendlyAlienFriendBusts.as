package classes.Resources.Busts 
{
	import flash.geom.Rectangle;
	/**
	 * ...
	 * @author Fen
	 */
	public class FriendlyAlienFriendBusts 
	{
		public function get PREVIEW():Class { return Bust_ANNO_HUSKAR; }
		
		[Embed(source = "../../../assets/images/npcs/friendlyalienfriend/anno_huskar.png", mimeType = "image/png")]
		public var Bust_ANNO_HUSKAR:Class;
		public var Bounds_ANNO_HUSKAR:Rectangle = new Rectangle(30, 5, 70, 70);
		[Embed(source = "../../../assets/images/npcs/friendlyalienfriend/anno_huskar_nude.png", mimeType = "image/png")]
		public var Bust_ANNO_HUSKAR_NUDE:Class;
		
		CONFIG::IMAGEPACK
		{
			[Embed(source = "../../../assets/images/npcs/friendlyalienfriend/hr/anno_huskar.png", mimeType = "image/png")]
			public var Full_ANNO_HUSKAR:Class;
			[Embed(source = "../../../assets/images/npcs/friendlyalienfriend/hr/anno_huskar_nude.png", mimeType = "image/png")]
			public var Full_ANNO_HUSKAR_NUDE:Class;
		}
	}

}