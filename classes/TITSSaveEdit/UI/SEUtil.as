package classes.TITSSaveEdit.UI 
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Gedan
	 */
	public class SEUtil 
	{
		
		public static function RemoveSpriteChildren(obj:Sprite):void 
		{
			while (obj.numChildren > 0)
			{
				obj.removeChildAt(0);
			}
		}
		
	}

}