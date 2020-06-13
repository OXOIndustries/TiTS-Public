package classes.Resources.Busts 
{
	import flash.geom.Rectangle;
	/**
	 * ...
	 * @author Fen
	 */
	public class DeimacosBusts 
	{
		public function get PREVIEW():Class { return Bust_BLADE; }
		
		[Embed(source = "../../../assets/images/npcs/deimacos/blade.png", mimeType = "image/png")]
		public var Bust_BLADE:Class;
		public var Bounds_BLADE:Rectangle = new Rectangle(10, 10, 130, 120);
		
		CONFIG::IMAGEPACK
		{
			[Embed(source = "../../../assets/images/npcs/deimacos/HR/blade.png", mimeType = "image/png")]
			public var Full_BLADE:Class;
		}
	}

}