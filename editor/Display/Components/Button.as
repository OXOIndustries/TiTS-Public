package editor.Display.Components {
    import editor.Display.Events.*;
    import editor.Display.Themes.ThemeManager;
    import flash.events.Event;
    import flash.text.TextFormat;
    import flash.text.TextFormatAlign;

    public class Button extends TextBox {
        private const textFormat: TextFormat = new TextFormat();

        public function Button(text: String) {        
            textFormat.size = 18;
            textFormat.align = TextFormatAlign.CENTER;
            textFormat.font = 'Consolas';
            textFormat.leading = 0;
            textFormat.kerning = true;

            selectable = false;
            background = true;

            this.text = text;
            
            EditorEventDispatcher.instance.addEventListener(EditorEvents.THEME_CHANGE, themeUpdate);
        }

        public function themeUpdate(event: Event): void {
            textFormat.color = ThemeManager.instance.currentTheme.base05;
            backgroundColor = ThemeManager.instance.currentTheme.base00;
            setTextFormat(textFormat);
            defaultTextFormat = textFormat;
        }
    }
}