package classes.Resources.Busts 
{
	import flash.geom.Rectangle;
	/**
	 * ...
	 * @author Fenoxo
	 */
	public class YohSLBusts 
	{
		public function get PREVIEW():Class { return Bust_ARAKEI; }

		[Embed(source = "../../../assets/images/npcs/yoh_SL/ara_kei.png", mimeType = "image/png")]
		public var Bust_ARAKEI:Class;
		
		CONFIG::IMAGEPACK
		{
			[Embed(source = "../../../assets/images/npcs/yoh_SL/HR/ara_kei.png", mimeType = "image/png")]
			public var Full_ARAKEI:Class;
		}
	}
}