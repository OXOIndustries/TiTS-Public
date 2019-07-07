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

		/* Disabled for now since it doesn't match either of her current ingame appearances. Save this for follower xpack, IMO.
		[Embed(source = "../../../assets/images/npcs/liliruru/sam.png", mimeType = "image/png")]
		public var Bust_SAM:Class;
		[Embed(source = "../../../assets/images/npcs/liliruru/sam_nude.png", mimeType = "image/png")]
		public var Bust_SAM_NUDE:Class;*/
		
		CONFIG::IMAGEPACK
		{
			[Embed(source = "../../../assets/images/npcs/liliruru/HR/erra.png", mimeType = "image/png")]
			public var Full_ERRA:Class;
			[Embed(source = "../../../assets/images/npcs/liliruru/HR/erra_nude.png", mimeType = "image/png")]
			public var Full_ERRA_NUDE:Class;
			[Embed(source = "../../../assets/images/npcs/liliruru/HR/erra_puppy_nude.png", mimeType = "image/png")]
			public var Full_ERRA_PUPPY_NUDE:Class;

			[Embed(source = "../../../assets/images/npcs/liliruru/HR/fisianna.png", mimeType = "image/png")]
			public var Full_FISIANNA:Class;
			[Embed(source = "../../../assets/images/npcs/liliruru/HR/fisianna_nude.png", mimeType = "image/png")]
			public var Full_FISIANNA_NUDE:Class;
			[Embed(source = "../../../assets/images/npcs/liliruru/HR/fisianna_bra.png", mimeType = "image/png")]
			public var Full_FISIANNA_BRA:Class;

			/* Disabled for now since it doesn't match either of her current ingame appearances. Save this for follower xpack, IMO.
			[Embed(source = "../../../assets/images/npcs/liliruru/HR/sam.png", mimeType = "image/png")]
			public var Full_SAM:Class;
			[Embed(source = "../../../assets/images/npcs/liliruru/HR/sam_nude.png", mimeType = "image/png")]
			public var Full_SAM_NUDE:Class;*/
		}
	}

}