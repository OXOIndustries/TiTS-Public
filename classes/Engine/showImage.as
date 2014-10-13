package classes.Engine 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;
	import flash.utils.getQualifiedClassName;
	import flash.utils.getDefinitionByName;
	import classes.kGAMECLASS;
	import classes.Resources.ImagePack;
	import classes.Resources.ImagePackAssets.ImageContainer;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public function showImage(imgName:String):void
	{
		if (CONFIG::IMAGEPACK == true)
		{			
			if (ImagePack[imgName] != undefined)
			{
				var classT:Class = ImagePack[imgName];
				var classP:* = new classT();
				
				var width:Number = classP.width;
				var height:Number = classP.height;
				
				var scale:Number = 387 / width;
				
				if (height * scale > 630)
				{
					scale = 630 / height;
				}
				
				width *= scale;
				height *= scale;
				
				// Haha fuck you AS3
				trace("Displaying image: " + imgName);
				ImagePack.ImageRequestT = classT;
				
				kGAMECLASS.output("<img src='" + getQualifiedClassName(ImageContainer) + "' width='" + width + "' height='" + height + "'>");
			}
			else
			{
				classT = null;
			}
		}
	}

}