package classes.Resources
{
	public class ImagePack
	{
		CONFIG::IMAGEPACK {
			import classes.Resources.ImagePack.*;
			
			[Embed(source = "../../assets/images/imagepack/flahne/whitedevil_flahne_wallpaper_HQ.png", mimeType = "image/png")]
			public static const FlahneUnderDeskT:Class;
			public static const FlahneUnderDesk:Class = FlahneUnderDeskC;
		}

	}
}