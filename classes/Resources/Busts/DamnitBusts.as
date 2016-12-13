package classes.Resources.Busts 
{
	/**
	 * ...
	 * @author Gedan
	 */
	public class DamnitBusts 
	{
		public function get PREVIEW():Class { return Bust_HOLIDAY; }
		public function get SIGNATURE():Class { return SigEmbed; }
		
		[Embed(source = "../../../assets/images/npcs/damnit/HR/sig.png", mimeType = "image/png")]
		public var SigEmbed:Class;
		// Making assumptions here
		
		[Embed(source = "../../../assets/images/npcs/damnit/holiday.png", mimeType = "image/png")]
		public var Bust_HOLIDAY:Class;
		[Embed(source = "../../../assets/images/npcs/damnit/holiday_horse.png", mimeType = "image/png")]
		public var Bust_HOLIDAY_HORSE:Class;
		[Embed(source = "../../../assets/images/npcs/damnit/holiday_trap.png", mimeType = "image/png")]
		public var Bust_HOLIDAY_TRAP:Class;
		
		CONFIG::IMAGEPACK
		{
			[Embed(source = "../../../assets/images/npcs/damnit/HR/holiday.png", mimeType = "image/png")]
			public var Full_HOLIDAY:Class;
			[Embed(source = "../../../assets/images/npcs/damnit/HR/holiday_horse.png", mimeType = "image/png")]
			public var Full_HOLIDAY_HORSE:Class;
			[Embed(source = "../../../assets/images/npcs/damnit/HR/holiday_trap.png", mimeType = "image/png")]
			public var Full_HOLIDAY_TRAP:Class;
		}
		
	}

}