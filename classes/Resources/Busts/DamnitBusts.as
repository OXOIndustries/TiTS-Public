package classes.Resources.Busts 
{
	/**
	 * ...
	 * @author Gedan
	 */
	public class DamnitBusts 
	{
		public function get PREVIEW():Class { return Bust_HOLIDAY; }
		// Making assumptions here
		
		[Embed(source = "../../../assets/images/npcs/holiday.png", mimeType = "image/png")]
		public var Bust_HOLIDAY:Class;
		[Embed(source = "../../../assets/images/npcs/holiday_horse.png", mimeType = "image/png")]
		public var Bust_HOLIDAY_HORSE:Class;
		[Embed(source = "../../../assets/images/npcs/holiday_trap.png", mimeType = "image/png")]
		public var Bust_HOLIDAY_TRAP:Class;
		
	}

}