package classes.Resources.Busts 
{
	/**
	 * ...
	 * @author Gedan
	 */
	public class JamesABBusts 
	{
		public function get PREVIEW():Class { return Bust_YANCY; }
	
		[Embed(source = "../../../assets/images/npcs/jamesab/yancy.png", mimeType = "image/png")]
		public var Bust_YANCY:Class;

		CONFIG::IMAGEPACK
		{
			[Embed(source = "../../../assets/images/npcs/jamesab/hr/yancy.png", mimeType = "image/png")]
			public var Full_YANCY:Class;
		}
	}

}