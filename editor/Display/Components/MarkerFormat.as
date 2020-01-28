package editor.Display.Components {
    import editor.Display.Events.*;
    import editor.Display.Themes.*;
    import flash.events.Event;
    import flash.text.TextFormat;

    public class MarkerFormat extends TextFormat {
        private var base: String;
        public function MarkerFormat(base: String) {   
            this.base = base;
            EditorEventDispatcher.instance.addEventListener(EditorEvents.THEME_CHANGE, themeUpdate);
        }

        public function themeUpdate(event: Event): void {
            this.color = ThemeManager.instance.currentTheme[this.base];
        }
    }
}