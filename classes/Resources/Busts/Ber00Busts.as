package classes.Resources.Busts 
{
	public class Ber00Busts 
	{
		public function get PREVIEW():Class { return Bust_SHIZUYA; }
				
		[Embed(source = "../../../assets/images/npcs/ber00/shizuya.png", mimeType = "image/png")]
		public var Bust_SHIZUYA:Class;
		[Embed(source = "../../../assets/images/npcs/ber00/shizuya_nude.png", mimeType = "image/png")]
		public var Bust_SHIZUYA_NUDE:Class;
		
		CONFIG::IMAGEPACK
		{
			[Embed(source = "../../../assets/images/npcs/ber00/HR/shizuya.png", mimeType = "image/png")]
			public var Full_SHIZUYA:Class;
			[Embed(source = "../../../assets/images/npcs/ber00/HR/shizuya_nude.png", mimeType = "image/png")]
			public var Full_SHIZUYA_NUDE:Class;
		}
	}
}