package classes.Resources.Busts 
{
	import flash.geom.Rectangle;
	/**
	 * ...
	 * @author Fenoxo
	 */
	public class FubMistressBusts 
	{
		public function get PREVIEW():Class { return Bust_BRIGET; }
		
		[Embed(source = "../../../assets/images/npcs/fubMistress/briget.png", mimeType = "image/png")]
		public var Bust_BRIGET:Class;

		[Embed(source = "../../../assets/images/npcs/fubMistress/busky.png", mimeType = "image/png")]
		public var Bust_BUSKY:Class;
		[Embed(source = "../../../assets/images/npcs/fubMistress/busky_aroused_nude.png", mimeType = "image/png")]
		public var Bust_BUSKY_NUDE:Class;
		
		CONFIG::IMAGEPACK
		{
			[Embed(source = "../../../assets/images/npcs/fubMistress/hr/briget.png", mimeType = "image/png")]
			public var Full_BRIGET:Class;

			[Embed(source = "../../../assets/images/npcs/fubMistress/hr/busky.png", mimeType = "image/png")]
			public var Full_BUSKY:Class;
			[Embed(source = "../../../assets/images/npcs/fubMistress/hr/busky_aroused_nude.png", mimeType = "image/png")]
			public var Full_BUSKY_NUDE:Class;
		}
	}
}