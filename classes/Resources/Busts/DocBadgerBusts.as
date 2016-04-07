package classes.Resources.Busts 
{
	/**
	 * ...
	 * @author Gedan
	 */
	public class DocBadgerBusts 
	{
		public function get PREVIEW():Class { return Bust_DRBADGER; }
		
		// More assumptions
		
		[Embed(source = "../../../assets/images/npcs/drBadger.png", mimeType = "image/png")]
		public var Bust_DRBADGER:Class;
		[Embed(source = "../../../assets/images/npcs/dr_badger_bimbo.png", mimeType = "image/png")]
		public var Bust_DR_BADGER_BIMBO:Class;
		
	}

}