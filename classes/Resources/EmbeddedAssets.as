package classes.Resources
{
	/**
	 * Basically, a static library of embedded asset references. You can target things in this class to grab
	 * class type references and instantiate new versions of the assets; 
	 * f.ex var thing:* = new EmbeddedAssets.Icon_Missing();
	 * @author Gedan
	 */
	public class EmbeddedAssets 
	{
		[Embed(source = "../../assets/icons/statuseffects/blocked.svg", mimeType = "image/svg")]
		public static var Icon_Missing:Class;
		
		[Embed(source = "../../assets/icons/statuseffects/radiosignal.svg", mimeType = "image/svg")]
		public static var Icon_RadioSignal:Class;
	}

}