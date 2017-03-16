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
		
		[Embed(source = "../../../assets/images/npcs/jay_echo/alex.png", mimeType = "image/png")]
		public var Bust_ALEX:Class;
		public function get Bust_ALEX_NUDE():Class { return Bust_ALEX; }
		
		[Embed(source = "../../../assets/images/npcs/jay_echo/amara.png", mimeType = "image/png")]
		public var Bust_AMARA:Class;
		public var Bounds_AMARA:Rectangle = new Rectangle(28, 2, 58, 64);
		
		[Embed(source = "../../../assets/images/npcs/jay_echo/busky.png", mimeType = "image/png")]
		public var Bust_BUSKY:Class;
		[Embed(source = "../../../assets/images/npcs/jay_echo/busky_nude.png", mimeType = "image/png")]
		public var Bust_BUSKY_NUDE:Class;

		[Embed(source = "../../../assets/images/npcs/jay_echo/ehstraffe.png", mimeType = "image/png")]
		public var Bust_EHSTRAFFE:Class;
		public var Bounds_EHSTRAFFE:Rectangle = new Rectangle(28, 0, 60, 60);
		
		[Embed(source = "../../../assets/images/npcs/jay_echo/inessa_nude.png", mimeType = "image/png")]
		public var Bust_INESSA_NUDE:Class;
		
		[Embed(source = "../../../assets/images/npcs/jay_echo/giala_honey.png", mimeType = "image/png")]
		public var Bust_GIALA:Class;

		[Embed(source = "../../../assets/images/npcs/jay_echo/goo_knight_blue.png", mimeType = "image/png")]
		public var Bust_GOO_KNIGHT_BLUE:Class;
		[Embed(source = "../../../assets/images/npcs/jay_echo/goo_knight_green.png", mimeType = "image/png")]
		public var Bust_GOO_KNIGHT_GREEN:Class;

		[Embed(source = "../../../assets/images/npcs/jay_echo/mayren.png", mimeType = "image/png")]
		public var Bust_MAYREN:Class;

		[Embed(source = "../../../assets/images/npcs/jay_echo/nayna.png", mimeType = "image/png")]
		public var Bust_NAYNA:Class;
		[Embed(source = "../../../assets/images/npcs/jay_echo/nayna_nude.png", mimeType = "image/png")]
		public var Bust_NAYNA_SUIT:Class;
		[Embed(source = "../../../assets/images/npcs/jay_echo/nayna_nude.png", mimeType = "image/png")]
		public var Bust_NAYNA_SUIT_NUDE:Class;
		
		[Embed(source = "../../../assets/images/npcs/jay_echo/sellera.png", mimeType = "image/png")]
		public var Bust_SELLERA:Class;
		[Embed(source = "../../../assets/images/npcs/jay_echo/sellera_nude.png", mimeType = "image/png")]
		public var Bust_SELLERA_NUDE:Class;
		
		[Embed(source = "../../../assets/images/npcs/jay_echo/sierva.png", mimeType = "image/png")]
		public var Bust_SIERVA:Class;

		[Embed(source = "../../../assets/images/npcs/jay_echo/yarasta.png", mimeType = "image/png")]
		public var Bust_YARASTA:Class;
		
		CONFIG::IMAGEPACK
		{
			[Embed(source = "../../../assets/images/npcs/jay_echo/hr/alex.png", mimeType = "image/png")]
			public var Full_ALEX:Class;
			public function get Full_ALEX_NUDE():Class { return Full_ALEX; }
			
			[Embed(source = "../../../assets/images/npcs/jay_echo/hr/amara.png", mimeType = "image/png")]
			public var Full_AMARA:Class;
			
			[Embed(source = "../../../assets/images/npcs/jay_echo/hr/busky.png", mimeType = "image/png")]
			public var Full_BUSKY:Class;
			[Embed(source = "../../../assets/images/npcs/jay_echo/hr/busky_nude.png", mimeType = "image/png")]
			public var Full_BUSKY_NUDE:Class;

			[Embed(source = "../../../assets/images/npcs/jay_echo/hr/ehstraffe.png", mimeType = "image/png")]
			public var Full_EHSTRAFFE:Class;
			
			[Embed(source = "../../../assets/images/npcs/jay_echo/hr/inessa_nude.png", mimeType = "image/png")]
			public var Full_INESSA_NUDE:Class;
			
			[Embed(source = "../../../assets/images/npcs/jay_echo/hr/giala_honey.png", mimeType = "image/png")]
			public var Full_GIALA:Class;

			[Embed(source = "../../../assets/images/npcs/jay_echo/hr/goo_knight_blue.png", mimeType = "image/png")]
			public var Full_GOO_KNIGHT_BLUE:Class;
			[Embed(source = "../../../assets/images/npcs/jay_echo/hr/goo_knight_green.png", mimeType = "image/png")]
			public var Full_GOO_KNIGHT_GREEN:Class;

			[Embed(source = "../../../assets/images/npcs/jay_echo/hr/mayren.png", mimeType = "image/png")]
			public var Full_MAYREN:Class;

			[Embed(source = "../../../assets/images/npcs/jay_echo/hr/nayna.png", mimeType = "image/png")]
			public var Full_NAYNA:Class;
			[Embed(source = "../../../assets/images/npcs/jay_echo/hr/nayna_nude.png", mimeType = "image/png")]
			public var Full_NAYNA_SUIT:Class;
			[Embed(source = "../../../assets/images/npcs/jay_echo/hr/nayna_nude.png", mimeType = "image/png")]
			public var Full_NAYNA_SUIT_NUDE:Class;
			
			[Embed(source = "../../../assets/images/npcs/jay_echo/hr/sellera.png", mimeType = "image/png")]
			public var Full_SELLERA:Class;
			[Embed(source = "../../../assets/images/npcs/jay_echo/hr/sellera_nude.png", mimeType = "image/png")]
			public var Full_SELLERA_NUDE:Class;
			
			[Embed(source = "../../../assets/images/npcs/jay_echo/hr/sierva.png", mimeType = "image/png")]
			public var Full_SIERVA:Class;

			[Embed(source = "../../../assets/images/npcs/jay_echo/hr/yarasta.png", mimeType = "image/png")]
			public var Full_YARASTA:Class;
		}
	}

}