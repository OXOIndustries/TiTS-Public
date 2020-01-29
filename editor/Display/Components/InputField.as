package editor.Display.Components {
    import editor.Display.Events.*;
    import editor.Display.Themes.ThemeManager;
    import flash.events.Event;
    import flash.text.TextFormat;
    import flash.text.TextFieldType;

    public class InputField extends TextBox {
        public const textFormat: TextFormat = new TextFormat();
        private static const replaceWithNewline: RegExp = /\r/g;

        public function InputField() {   
            textFormat.size = 14;
            textFormat.font = 'Consolas';
            textFormat.leading = 0;
            textFormat.kerning = true;

            type = TextFieldType.INPUT;
            background = true;
            multiline = true;
            wordWrap = true;

            EditorEventDispatcher.instance.addEventListener(EditorEvents.THEME_CHANGE, themeUpdate);
        }

        public function getText(): String {
            return text.replace(replaceWithNewline, '\n');
        }

        public function themeUpdate(event: Event): void {
            textFormat.color = ThemeManager.instance.currentTheme.base03;
            backgroundColor = ThemeManager.instance.currentTheme.base00;
            setTextFormat(textFormat);
            defaultTextFormat = textFormat;
        }
    }
}