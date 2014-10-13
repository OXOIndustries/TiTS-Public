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
	/**
	 * ...
	 * @author Gedan
	 */
	public function showImage(imgName:String):void
	{
		if (CONFIG::IMAGEPACK == true)
		{
			import classes.Resources.ImagePack;
			import flash.display.Bitmap;
			
			if (ImagePack[imgName] != undefined)
			{
				var classT:Class = ImagePack[imgName];
				var classP:* = new classT();
				
				var width:Number = classP.bmp.width;
				var height:Number = classP.bmp.height;
				
				var scale:Number = 387 / width;
				
				if (height * scale > 630)
				{
					scale = 630 / height;
				}
				
				width *= scale;
				height *= scale;
				
				// Haha fuck you AS3
				trace("Displaying image: " + imgName);
				kGAMECLASS.output("<img src='" + getQualifiedClassName(classT) + "' width='" + width + "' height='" + height + "'>");
			}			
		}
	}

}