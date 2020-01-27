package editor.Display {
    import flash.text.TextField;
    import flash.text.TextFormat;
    import flash.text.TextFormatAlign;
    
    public class OutputTypeButton extends TextField implements IThemeUpdate {
        private const textFormat: TextFormat = new TextFormat();

        public function OutputTypeButton(name: String, text: String) {        
            textFormat.size = 18;
            textFormat.align = TextFormatAlign.CENTER;
            textFormat.font = 'Consolas';
            textFormat.leading = 0;
            textFormat.kerning = true;

            selectable = false;
            background = true;

            this.name = name;
            this.text = text;
            
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