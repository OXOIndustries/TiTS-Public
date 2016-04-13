package classes.Resources.Busts 
{
	/**
	 * ...
	 * @author Gedan
	 */
	public class DoxyBusts 
	{
		public function get PREVIEW():Class { return Bust_ZODEE; }
		
		[Embed(source = "../../../assets/images/npcs/doxy/zodee.png", mimeType = "image/png")]
		public var Bust_ZODEE:Class;
		
		CONFIG::IMAGEPACK
		{
			[Embed(source = "../../../assets/images/npcs/doxy/hr/zodee.png", mimeType = "image/png")]
			public var Full_ZODEE:Class;
		}
	}

}