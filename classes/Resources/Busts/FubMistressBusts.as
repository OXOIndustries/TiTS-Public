package classes.Resources.Busts 
{
	import flash.geom.Rectangle;
	/**
	 * ...
	 * @author Gedan
	 */
	public class FubMistressBusts 
	{
		public function get PREVIEW():Class { return Bust_BRIGET; }
		
		[Embed(source = "../../../assets/images/npcs/fubMistress/briget.png", mimeType = "image/png")]
		public var Bust_BRIGET:Class;
		
		CONFIG::IMAGEPACK
		{
			[Embed(source = "../../../assets/images/npcs/fubMistress/hr/briget.png", mimeType = "image/png")]
			public var Full_BRIGET:Class;
		}
	}
}