package classes.Resources.Busts 
{
	/**
	 * ...
	 * @author Gedan
	 */
	public class RenezuoBusts
	{
		public function get PREVIEW():Class { return Bust_GIANNA_NUDE; }
		
		[Embed(source = "../../../assets/images/npcs/renezuo/gianna.png", mimeType = "image/png")]
		public var Bust_GIANNA_NUDE:Class;

		[Embed(source = "../../../assets/images/npcs/renezuo/sera.png", mimeType = "image/png")]
		public var Bust_SERA:Class;
		[Embed(source = "../../../assets/images/npcs/renezuo/sera_nude.png", mimeType = "image/png")]
		public var Bust_SERA_NUDE:Class;

		CONFIG::IMAGEPACK
		{
			[Embed(source = "../../../assets/images/npcs/renezuo/hr/gianna.png", mimeType = "image/png")]
			public var Full_GIANNA_NUDE:Class;
			
			[Embed(source = "../../../assets/images/npcs/renezuo/hr/sera.png", mimeType = "image/png")]
			public var Full_SERA:Class;
			[Embed(source = "../../../assets/images/npcs/renezuo/hr/sera_nude.png", mimeType = "image/png")]
			public var Full_SERA_NUDE:Class;
		}
	}

}