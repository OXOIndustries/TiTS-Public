package classes.Resources.Busts 
{
	import flash.geom.Rectangle;
	/**
	 * ...
	 * @author Gedan
	 */
	public class JayEchoBusts 
	{
		public function get PREVIEW():Class { return Bust_AMARA; }
		
		[Embed(source = "../../../assets/images/npcs/jay_echo/amara.png", mimeType = "image/png")]
		public var Bust_AMARA:Class;
		public var Bounds_AMARA:Rectangle = new Rectangle(28, 2, 58, 64);
		
		[Embed(source = "../../../assets/images/npcs/jay_echo/inessa_nude.png", mimeType = "image/png")]
		public var Bust_INESSA_NUDE:Class;
		
		[Embed(source = "../../../assets/images/npcs/jay_echo/giala_honey.png", mimeType = "image/png")]
		public var Bust_GIALA:Class;

		[Embed(source = "../../../assets/images/npcs/jay_echo/mayren.png", mimeType = "image/png")]
		public var Bust_MAYREN:Class;
		
		[Embed(source = "../../../assets/images/npcs/jay_echo/sellera.png", mimeType = "image/png")]
		public var Bust_SELLERA:Class;
		[Embed(source = "../../../assets/images/npcs/jay_echo/sellera_nude.png", mimeType = "image/png")]
		public var Bust_SELLERA_NUDE:Class;
		
		[Embed(source = "../../../assets/images/npcs/jay_echo/sierva.png", mimeType = "image/png")]
		public var Bust_SIERVA:Class;

		[Embed(source = "../../../assets/images/npcs/jay_echo/yarasta.png", mimeType = "image/png")]
		public var Bust_YARASTA:Class;
	}

}