package classes.Resources.Busts 
{
	/**
	 * ...
	 * @author Gedan
	 */
	public class CyanCapsuleBusts
	{
		public function get PREVIEW():Class { return Bust_MILLIE; }

		[Embed(source = "../../../assets/images/npcs/cyancapsule/millie.png", mimeType = "image/png")]
		public var Bust_MILLIE:Class;
		[Embed(source = "../../../assets/images/npcs/cyancapsule/millie_nude.png", mimeType = "image/png")]
		public var Bust_MILLIE_NUDE:Class;
	}

}