package classes.Resources.ImagePack 
{
	import flash.display.MovieClip;
	import flash.display.Bitmap;
	import classes.Resources.ImagePack;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class FlahneUnderDeskC extends MovieClip
	{
		public var bmp:Bitmap;
		public function FlahneUnderDeskC()
		{
			super();
			bmp = new ImagePack.FlahneUnderDeskT();
			this.addChild(bmp);
		}
	}

}