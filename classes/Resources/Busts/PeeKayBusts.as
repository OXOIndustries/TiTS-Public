package classes.Resources.Busts 
{
	/**
	 * ...
	 * @author Gedan
	 */
	public class PeeKayBusts
	{
		public function get PREVIEW():Class { return Bust_KARA; }
	
		[Embed(source = "../../../assets/images/npcs/kara.png", mimeType = "image/png")]
		public var Bust_KARA:Class;
		public var Bounds_KARA:Rectangle = new Rectangle(0, 7, 70, 80);
		[Embed(source = "../../../assets/images/npcs/kara.png", mimeType = "image/png")]
		public var Bust_KARA_NUDE:Class;
	}

}