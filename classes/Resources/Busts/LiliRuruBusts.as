package classes.Resources.Busts 
{
	import flash.geom.Rectangle;
	/**
	 * ...
	 * @author Gedan
	 */
	public class LiliRuruBusts 
	{
		public function get PREVIEW():Class { return Bust_ERRA; }
		
		[Embed(source = "../../../assets/images/npcs/liliruru/erra.png", mimeType = "image/png")]
		public var Bust_ERRA:Class;
		[Embed(source = "../../../assets/images/npcs/liliruru/erra_nude.png", mimeType = "image/png")]
		public var Bust_ERRA_NUDE:Class;
		[Embed(source = "../../../assets/images/npcs/liliruru/erra_puppy_nude.png", mimeType = "image/png")]
		public var Bust_ERRA_PUPPY_NUDE:Class;

		[Embed(source = "../../../assets/images/npcs/liliruru/fisianna.png", mimeType = "image/png")]
		public var Bust_FISIANNA:Class;
		[Embed(source = "../../../assets/images/npcs/liliruru/fisianna_nude.png", mimeType = "image/png")]
		public var Bust_FISIANNA_NUDE:Class;
		[Embed(source = "../../../assets/images/npcs/liliruru/fisianna_bra.png", mimeType = "image/png")]
		public var Bust_FISIANNA_BRA:Class;
		
		CONFIG::IMAGEPACK
		{
			[Embed(source = "../../../assets/images/npcs/liliruru/hr/erra.png", mimeType = "image/png")]
			public var Full_ERRA:Class;
			[Embed(source = "../../../assets/images/npcs/liliruru/hr/erra_nude.png", mimeType = "image/png")]
			public var Full_ERRA_NUDE:Class;
			[Embed(source = "../../../assets/images/npcs/liliruru/hr/erra_puppy_nude.png", mimeType = "image/png")]
			public var Full_ERRA_PUPPY_NUDE:Class;

			[Embed(source = "../../../assets/images/npcs/liliruru/hr/fisianna.png", mimeType = "image/png")]
			public var Full_FISIANNA:Class;
			[Embed(source = "../../../assets/images/npcs/liliruru/hr/fisianna_nude.png", mimeType = "image/png")]
			public var Full_FISIANNA_NUDE:Class;
			[Embed(source = "../../../assets/images/npcs/liliruru/hr/fisianna_bra.png", mimeType = "image/png")]
			public var Full_FISIANNA_BRA:Class;
		}
	}

}