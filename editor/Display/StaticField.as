package editor.Display {
    import flash.text.TextField;
    import flash.text.TextFormat;
    
    public class StaticField extends TextField implements IThemeUpdate {
        private const textFormat: TextFormat = new TextFormat();

        public function StaticField() {   
            textFormat.size = 18;
            textFormat.font = 'Consolas';
            textFormat.leading = 0;
            textFormat.kerning = true;

            background = true;
            multiline = true;
            wordWrap = true;
            
            themeUpdate();
        }
        
        public function themeUpdate(): void {
            textFormat.color = Themes.active.base05;
            backgroundColor = Themes.active.base00;
            setTextFormat(textFormat);
            defaultTextFormat = textFormat;
        }
    }
}