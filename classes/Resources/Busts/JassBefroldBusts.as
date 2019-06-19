package classes.Resources.Busts 
{
	import flash.geom.Rectangle;
	/**
	 * ...
	 * @author Gedan
	 */
	public class JassBefroldBusts 
	{
		public function get PREVIEW():Class { return Bust_Z14; }
		
		[Embed(source = "../../../assets/images/npcs/jassbefrold/pyrite_colt_xlr.png", mimeType = "image/png")]
		public var Bust_COLT_XLR:Class;
		[Embed(source = "../../../assets/images/npcs/jassbefrold/gabilani_moondast_gruss.png", mimeType = "image/png")]
		public var Bust_MOONDAST_GRUSS:Class;
		[Embed(source = "../../../assets/images/npcs/jassbefrold/ovalek.png", mimeType = "image/png")]
		public var Bust_OVALEK:Class;
		[Embed(source = "../../../assets/images/npcs/jassbefrold/kihacorp_spearhead_ss.png", mimeType = "image/png")]
		public var Bust_SPEARHEAD_SS:Class;
		[Embed(source = "../../../assets/images/npcs/jassbefrold/casstech_z14.png", mimeType = "image/png")]
		public var Bust_Z14:Class;
		[Embed(source = "../../../assets/images/npcs/jassbefrold/casstech_z7.png", mimeType = "image/png")]
		public var Bust_Z7:Class;
		
		
		CONFIG::IMAGEPACK
		{
			[Embed(source = "../../../assets/images/npcs/jassbefrold/HR/pyrite_colt_xlr.png", mimeType = "image/png")]
			public var Full_COLT_XLR:Class;
			[Embed(source = "../../../assets/images/npcs/jassbefrold/HR/gabilani_moondast_gruss.png", mimeType = "image/png")]
			public var Full_MOONDAST_GRUSS:Class;
			[Embed(source = "../../../assets/images/npcs/jassbefrold/HR/ovalek.png", mimeType = "image/png")]
			public var Full_OVALEK:Class;
			[Embed(source = "../../../assets/images/npcs/jassbefrold/HR/kihacorp_spearhead_ss.png", mimeType = "image/png")]
			public var Full_SPEARHEAD_SS:Class;
			[Embed(source = "../../../assets/images/npcs/jassbefrold/HR/casstech_z14.png", mimeType = "image/png")]
			public var Full_Z14:Class;
		}
	}

}