package classes.Resources.Busts 
{
	/**
	 * ...
	 * @author Gedan
	 */
	public class DocBadgerBusts 
	{
		public function get PREVIEW():Class { return Bust_DRBADGER; }
		public function get SIGNATURE():Class { return SigEmbed; }
		
		[Embed(source = "../../../assets/images/npcs/docbadger/HR/sig.png", mimeType = "image/png")]
		public var SigEmbed:Class;
		
		// More assumptions
		
		[Embed(source = "../../../assets/images/npcs/docbadger/drBadger.png", mimeType = "image/png")]
		public var Bust_DRBADGER:Class;
		[Embed(source = "../../../assets/images/npcs/docbadger/dr_badger_bimbo.png", mimeType = "image/png")]
		public var Bust_DR_BADGER_BIMBO:Class;

		CONFIG::IMAGEPACK
		{
			[Embed(source = "../../../assets/images/npcs/docbadger/hr/drBadger.png", mimeType = "image/png")]
			public var Full_DRBADGER:Class;
			[Embed(source = "../../../assets/images/npcs/docbadger/hr/dr_badger_bimbo.png", mimeType = "image/png")]
			public var Full_DR_BADGER_BIMBO:Class;
		}
	}

}