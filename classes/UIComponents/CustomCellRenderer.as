package classes.UIComponents 
{
	import fl.controls.listClasses.CellRenderer;
	import flash.display.MovieClip;
	import flash.text.TextFormat;
	
	/**
	 * ...
	 * @author Gedan
	 */
	public class CustomCellRenderer extends CellRenderer
	{
		public function CustomCellRenderer() 
		{
			setStyle("embedFonts", true);
			setStyle("textFormat", UIStyleSettings.gTextInputFormatter);
			setStyle("antiAliasType", "advanced");
		}		
	}
}