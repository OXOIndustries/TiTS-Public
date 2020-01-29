package editor.Display.Components {
    import editor.Display.Events.*;
    import editor.Display.Themes.ThemeManager;
    import flash.events.Event;
    import flash.text.TextFormat;

    public class StaticField extends TextBox {
        private const textFormat: TextFormat = new TextFormat();

        public function StaticField() {   
            textFormat.size = 14;
            textFormat.font = 'Consolas';
            textFormat.leading = 0;
            textFormat.kerning = true;

            background = true;
            multiline = true;
            wordWrap = true;
            
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