package editor.Display.Panes {
    import editor.Display.Components.Box;
    import editor.Display.Components.InputField;
    import editor.Display.Components.StaticField;
    import editor.Display.Events.*;
    import editor.Display.UIInfo;
    import editor.Evaluator;
    import editor.Lang.Interpret.Interpreter;
    import flash.events.*;
    import flash.utils.describeType;

    public class InfoPane extends Box {
        private var searchField: InputField = new InputField();
        private var listField: StaticField = new StaticField();
        private var evaluator: Evaluator;

        public function InfoPane(evaluator: Evaluator) {
            this.evaluator = evaluator;
            addChild(searchField);
            addChild(listField);

            searchField.addEventListener(Event.CHANGE, updateList);
            searchField.addEventListener(MouseEvent.CLICK, removeSearchText);

            addEventListener(Event.ADDED_TO_STAGE, init);
        }

        private function init(event: Event): void {
            searchField.x = 0;
            searchField.y = 0;
            searchField.nsWidth = nsWidth;
            searchField.nsHeight = 30 - UIInfo.BORDER_SIZE;
            searchField.text = 'Search...';

            listField.x = 0;
            listField.y = searchField.height + UIInfo.BORDER_SIZE;
            listField.nsWidth = nsWidth;
            listField.nsHeight = nsHeight;

            updateList(event);
        }

        private function removeSearchText(event: Event): void {
            if (searchField.text === 'Search...')
                searchField.text = '';
        }

        private function updateList(event: Event): void {
            var keys: Array = searchField.text.split('.');

            // Traverse global object using keys
            var obj: * = evaluator.global;
            for (var idx: int = 0; idx < keys.length - 1; idx++) {
                if (!keys[idx] || !(keys[idx] in obj)) break;
                obj = obj[keys[idx]];
            }

            if (typeof obj == 'object' || keys.length == 0)
                listField.text = describeObj(keys.length > 0 ? keys[keys.length - 1] : '', obj);
            else
                listField.text = describeValue(keys[keys.length - 1], getTypeName(typeof obj));
        }

        private function describeValue(name: String, type: String): String {
            return name + ': ' + type + '\n';
        }

        private function getTypeName(type: String): String {
            switch (type) {
                case 'string': return 'text';
                case 'boolean': return 'yes or no';
                case 'object': return 'container';
                default: return type;
            }
        }

        private function isFuncInfo(name: String): Boolean {
            return name.slice(name.length - Interpreter.FUNC_INFO_STRING.length) == Interpreter.FUNC_INFO_STRING;
        }

        private function startsWith(str: String, test: String): Boolean {
            return test.length == 0 || str == test || str.substr(0, test.length) == test;
        }

        private function describeObj(key: String, obj: Object): String {
            var arr: Array = new Array();

            var description: XML = describeType(obj);
            var name: String;
            for each (var item: XML in description..accessor) {
                name = item.@name.toString();
                if (!isFuncInfo(name) && startsWith(name, key))
                    arr.push(name);
            }
            for each (item in description..constant) {
                name = item.@name.toString();
                if (!isFuncInfo(name) && startsWith(name, key))
                    arr.push(name);
            }
            for each (item in description..variable) {
                name = item.@name.toString();
                if (!isFuncInfo(name) && startsWith(name, key))
                    arr.push(name);
            }
            for each (item in description..method) {
                name = item.@name.toString();
                if (!isFuncInfo(name) && startsWith(name, key))
                    arr.push(name);
            }

            for (var key: String in obj)
                arr.push(key);

            arr = arr.sort();

            var text: String = '';
            for each (key in arr)
                text += describeValue(key, getTypeName(typeof obj[key]));

            return text;
        }
    }
}