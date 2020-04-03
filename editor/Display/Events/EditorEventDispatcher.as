package editor.Display.Events {
    import flash.events.EventDispatcher;

    public class EditorEventDispatcher extends EventDispatcher {
        private static var _instance: EditorEventDispatcher;
        public static function get instance(): EditorEventDispatcher {
            if (_instance == null)
                _instance = new EditorEventDispatcher();
            return _instance;
        }

        public function EditorEventDispatcher() {
            if (_instance != null)
                throw new Error("Instance of EditorEventDispatcher already exists. Use EditorEventDispatcher.instance");
            else
                _instance = this;
        }
    }
}
