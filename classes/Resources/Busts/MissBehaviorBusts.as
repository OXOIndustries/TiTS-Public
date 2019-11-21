package classes.Resources.Busts 
{
	import flash.geom.Rectangle;
	/**
	 * ...
	 * @author Fen
	 */
	public class MissBehaviorBusts 
	{
		public function get PREVIEW():Class { return Bust_AKANE; }
		
		[Embed(source = "../../../assets/images/npcs/missbehavior/akane.png", mimeType = "image/png")]
		public var Bust_AKANE:Class;
		[Embed(source = "../../../assets/images/npcs/missbehavior/akane_nude.png", mimeType = "image/png")]
		public var Bust_AKANE_NUDE:Class;
		
		CONFIG::IMAGEPACK
		{
			[Embed(source = "../../../assets/images/npcs/missbehavior/HR/akane.png", mimeType = "image/png")]
			public var Full_AKANE:Class;
			[Embed(source = "../../../assets/images/npcs/missbehavior/HR/akane_nude.png", mimeType = "image/png")]
			public var Full_AKANE_NUDE:Class;
		}
	}
}