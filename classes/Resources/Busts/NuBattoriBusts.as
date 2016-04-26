package classes.Resources.Busts 
{
	/**
	 * ...
	 * @author Fenbutts
	 */
	public class NuBattoriBusts 
	{
		public function get PREVIEW():Class { return Bust_BRIHA; }
		
		[Embed(source = "../../../assets/images/npcs/NuBattori/briha.png", mimeType = "image/png")]
		public var Bust_BRIHA:Class;
		
		CONFIG::IMAGEPACK
		{
			[Embed(source = "../../../assets/images/npcs/NuBattori/hr/briha.png", mimeType = "image/png")]
			public var Full_BRIHA:Class;
		}
	}

}