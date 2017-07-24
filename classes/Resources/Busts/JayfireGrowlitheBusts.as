package classes.Resources.Busts 
{
	import flash.geom.Rectangle;
	/**
	 * ...
	 * @author Fenbutt
	 */
	public class JayfireGrowlitheBusts 
	{
		public function get PREVIEW():Class { return Bust_RASKVEL_FEMALE; }
				
		[Embed(source = "../../../assets/images/npcs/jayfireGrowlithe/raskvel.png", mimeType = "image/png")]
		public var Bust_RASKVEL_FEMALE:Class;
		[Embed(source = "../../../assets/images/npcs/jayfireGrowlithe/raskvel_nude.png", mimeType = "image/png")]
		public var Bust_RASKVEL_FEMALE_NUDE:Class;
		
		CONFIG::IMAGEPACK
		{
			[Embed(source = "../../../assets/images/npcs/jayfireGrowlithe/hr/raskvel.png", mimeType = "image/png")]
			public var Full_RASKVEL_FEMALE:Class;
			[Embed(source = "../../../assets/images/npcs/jayfireGrowlithe/hr/raskvel_nude.png", mimeType = "image/png")]
			public var Full_RASKVEL_FEMALE_NUDE:Class;
		}
	}
}