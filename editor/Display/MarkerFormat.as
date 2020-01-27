package editor.Display {
    import flash.text.TextFormat;
    
    public class MarkerFormat extends TextFormat implements IThemeUpdate {
        private var base: String;
        public function MarkerFormat(base: String) {   
            this.base = base;
            themeUpdate();
        }

        public function themeUpdate(): void {
            this.color = Themes.active[this.base];
        }
    }
}