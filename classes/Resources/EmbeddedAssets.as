package classes.Resources
{
	/**
	 * Basically, a static library of embedded asset references. You can target things in this class to grab
	 * class type references and instantiate new versions of the assets; 
	 * f.ex var thing:* = new EmbeddedAssets.Icon_Missing();
	 * 
	 * The include path is relative to the location of the file defining the embeds. I'm trying to keep everything
	 * under <PROJECT_FOLDER>/assets/*, so we gots to walk back from the location of the AS source to get there.
	 * @author Gedan
	 */
	public class EmbeddedAssets 
	{
		[Embed(source = "../../assets/icons/statuseffects/blocked.svg", mimeType = "image/svg")]
		public static var Icon_Missing:Class;
		
		[Embed(source = "../../assets/icons/statuseffects/radiosignal.svg", mimeType = "image/svg")]
		public static var Icon_RadioSignal:Class;
		
		[Embed(source = "../../assets/images/stowaway_helia_r.png", mimeType = "image/png")]
		public static var Image_Helia:Class;
	}

}