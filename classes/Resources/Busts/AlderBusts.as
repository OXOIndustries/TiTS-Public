package classes.Resources.Busts 
{
	import flash.geom.Rectangle;
	/**
	 * ...
	 * @author Gedan
	 */
	public class AlderBusts 
	{
		public function get PREVIEW():Class { return Bust_KAEDE; }
		public function get SIGNATURE():Class { return SigEmbed; }
		
		[Embed(source = "../../../assets/images/npcs/alder/HR/sig.png", mimeType = "image/png")]
		public var SigEmbed:Class;

		[Embed(source = "../../../assets/images/npcs/alder/kaede.png", mimeType = "image/png")]
		public var Bust_KAEDE:Class;

		CONFIG::IMAGEPACK
		{
			[Embed(source = "../../../assets/images/npcs/alder/hr/kaede.png", mimeType = "image/png")]
			public var Full_KAEDE:Class;
		}
	}

}