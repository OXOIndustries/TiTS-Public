package editor.Display {
    import flash.text.TextField;
    import flash.text.TextFormat;
    import flash.text.TextFieldType;
    
    public class InputField extends TextField implements IThemeUpdate {
        public const textFormat: TextFormat = new TextFormat();
        private static const replaceWithNewline: RegExp = /\r/g;

        public function InputField() {   
            textFormat.size = 18;
            textFormat.font = 'Consolas';
            textFormat.leading = 0;
            textFormat.kerning = true;

            type = TextFieldType.INPUT;
            background = true;
            multiline = true;
            wordWrap = true;

            themeUpdate();
        }
        
        public function getText(): String {
            return this.text.replace(replaceWithNewline, '\n');
        }

        public function themeUpdate(): void {
            textFormat.color = Themes.active.base03;
            backgroundColor = Themes.active.base00;
            setTextFormat(textFormat);
            defaultTextFormat = textFormat;
        }
    }
}