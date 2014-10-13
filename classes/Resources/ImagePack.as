package classes.Resources 
{
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	import flash.geom.Rectangle;
	import classes.Resources.ImagePack.*;
	/**
	 * ...
	 * @author Gedan
	 */
	public class ImagePack 
	{
		[Embed(source = "../../assets/images/imagepack/flahne/whitedevil_flahne_wallpaper_HQ.png", mimeType = "image/png")]
		public static const FlahneUnderDeskT:Class;
		public static const FlahneUnderDesk:Class = FlahneUnderDeskC;
	}
}