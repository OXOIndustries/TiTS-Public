package classes.Resources.Busts 
{
	import flash.geom.Rectangle;
	/**
	 * ...
	 * @author Gedan
	 */
	public class MoiraBusts 
	{
		public function get PREVIEW():Class { return Bust_PAIGE_CASUAL; }
		//public function get SIGNATURE():Class { return SigEmbed; }
				
		[Embed(source = "../../../assets/images/npcs/moira/paige_casual.png", mimeType = "image/png")]
		public var Bust_PAIGE_CASUAL:Class;
		/* Fen note: not used
		[Embed(source = "../../../assets/images/npcs/moira/paige_underwear.png", mimeType = "image/png")]
		public var Bust_PAIGE_UNDERWEAR:Class;*/
		[Embed(source = "../../../assets/images/npcs/moira/paige_yoga.png", mimeType = "image/png")]
		public var Bust_PAIGE_YOGA:Class;
		[Embed(source = "../../../assets/images/npcs/moira/paige_nude.png", mimeType = "image/png")]
		public var Bust_PAIGE_NUDE:Class;

		CONFIG::IMAGEPACK
		{
			[Embed(source = "../../../assets/images/npcs/moira/HR/paige_casual.png", mimeType = "image/png")]
			public var Full_PAIGE_CASUAL:Class;
			/*Fen note: not used:
			[Embed(source = "../../../assets/images/npcs/moira/HR/paige_underwear.png", mimeType = "image/png")]
			public var Full_PAIGE_UNDERWEAR:Class;*/
			[Embed(source = "../../../assets/images/npcs/moira/HR/paige_yoga.png", mimeType = "image/png")]
			public var Full_PAIGE_YOGA:Class;
			[Embed(source = "../../../assets/images/npcs/moira/HR/paige_nude.png", mimeType = "image/png")]
			public var Full_PAIGE_NUDE:Class;
		}
	}
}