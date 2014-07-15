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
			super();
			setStyle("embedFonts", true);
			setStyle("textFormat", UIStyleSettings.gSaveEditorInputEnabledTextFormat);
			setStyle("disabledTextFormat", UIStyleSettings.gSaveEditorInputDisabledTextFormat);
			setStyle("antiAliasType", "advanced");
		}
	}
}