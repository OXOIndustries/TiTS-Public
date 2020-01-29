package editor.Display.Themes {
    public class ThemeManager {
        private static var _instance: ThemeManager;
        public static function get instance(): ThemeManager {
            if (_instance == null)
                _instance = new ThemeManager();
            return _instance;
        }
        
        private var idx: int = 0;
        private const themeList: Array = [
            Themes.base16_harmonic_dark,
            Themes.base16_helios,
            Themes.base16_materia,
            Themes.base16_material_dark,
            Themes.base16_solarized_dark,
            Themes.base16_tomorrow_night,
            Themes.base16_tomorrow_night_eighties
        ];

        public function ThemeManager() {
            if (_instance != null)
                throw new Error("Instance of ThemeManager already exists. Use ThemeManager.instance");
            else
                _instance = this;
        }

        public function changeTheme(): void {
            ++idx;
            if (idx >= themeList.length)
                idx = 0;
        }

        public function get currentTheme(): Base16Theme {
            return themeList[idx];
        }
    }
}
