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
		
		[Embed(source = "../../../assets/images/npcs/jassbefrold/casstech_z14.png", mimeType = "image/png")]
		public var Bust_Z14:Class;
		
		
		CONFIG::IMAGEPACK
		{
			[Embed(source = "../../../assets/images/npcs/jassbefrold/HR/casstech_z14.png", mimeType = "image/png")]
			public var Full_Z14:Class;
		}
	}

}