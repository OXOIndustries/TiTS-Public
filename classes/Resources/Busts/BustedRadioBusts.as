package classes.Resources.Busts 
{
	/**
	 * ...
	 * @author Fenbooty
	 */
	public class BustedRadioBusts
	{
		public function get PREVIEW():Class { return Bust_LIAMME; }

		[Embed(source = "../../../assets/images/npcs/bustedradio/liamme.png", mimeType = "image/png")]
		public var Bust_LIAMME:Class;
		[Embed(source = "../../../assets/images/npcs/bustedradio/liamme_nude.png", mimeType = "image/png")]
		public var Bust_LIAMME_NUDE:Class;
				
		CONFIG::IMAGEPACK
		{
			[Embed(source = "../../../assets/images/npcs/bustedradio/hr/liamme.png", mimeType = "image/png")]
			public var Full_LIAMME:Class;
			[Embed(source = "../../../assets/images/npcs/bustedradio/hr/liamme_nude.png", mimeType = "image/png")]
			public var Full_LIAMME_NUDE:Class;
		}
	}
}