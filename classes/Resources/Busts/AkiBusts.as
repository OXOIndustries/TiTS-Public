package classes.Resources.Busts 
{
	/**
	 * ...
	 * @author Gedan
	 */
	public class AkiBusts
	{
		public function get PREVIEW():Class { return Bust_SERA; }

		[Embed(source = "../../../assets/images/npcs/aki/sera.png", mimeType = "image/png")]
		public var Bust_SERA:Class;
		
		CONFIG::IMAGEPACK
		{
			[Embed(source = "../../../assets/images/npcs/aki/hr/sera.png", mimeType = "image/png")]
			public var Full_SERA:Class;
		}
	}

}