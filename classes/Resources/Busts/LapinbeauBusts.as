package classes.Resources.Busts 
{
	/**
	 * ...
	 * @author Gedan
	 */
	public class LapinbeauBusts 
	{
		public function get PREVIEW():Class { return Bust_FYN; }
		
		[Embed(source = "../../../assets/images/npcs/lapinbeau/fyn.png", mimeType = "image/png")]
		public var Bust_FYN:Class;
		
		CONFIG::IMAGEPACK
		{
			[Embed(source = "../../../assets/images/npcs/lapinbeau/hr/fyn.png", mimeType = "image/png")]
			public var Full_FYN:Class;
		}
	}
}