package editor.Display.Panes {
    import editor.Display.Components.Box;
    import editor.Display.Components.StaticField;
    import editor.Display.Events.*;
    import editor.Display.UIInfo;
    import editor.Evaluator;
    import flash.events.*;
    import flash.utils.describeType;

    public class InfoPane extends Box {
        private var codeField: StaticField = new StaticField();
        private var evaluator: Evaluator;

        public function InfoPane(evaluator: Evaluator) {
            this.evaluator = evaluator;
            addChild(codeField);

            addEventListener(Event.ADDED_TO_STAGE, init);
        }

        private function init(event: Event): void {
            codeField.x = 0;
            codeField.y = 0;
            codeField.nsWidth = nsWidth;
            codeField.nsHeight = nsHeight;
            codeField.text = describeValue('Global', evaluator.global, 0);
        }

        private function describeClass(name: String, obj: Object, indent: int): String {
            var description: XML = describeType(obj);
            const typeKeysObj: Object = new Object();
            groupByTypes(typeKeysObj, description..accessor);
            groupByTypes(typeKeysObj, description..constant);
            groupByTypes(typeKeysObj, description..variable);
            for each(var item: XML in description..method) {
                if (typeKeysObj['Method'] == null)
                    typeKeysObj['Method'] = new Array();
                typeKeysObj['Method'].push(item.@name.toString());
            }
            //trace(JSON.stringify(groupObj));
            
            var text: String = '';
            for (var type: String in typeKeysObj) {
                if (typeof obj[typeKeysObj[type][0]] === 'object') {
                    text += describeValue(typeKeysObj[type].sort().join(', '), obj[typeKeysObj[type][0]], indent);
                }
                else {
                    trace('type: ' + type + ' ' + typeof obj[typeKeysObj[type][0]]);
                    for each (var key: String in typeKeysObj[type].sort())
                        text += describeValue(key, obj[typeKeysObj[type][0]], indent);
                }
            }

            return text;
        }

        private function groupByTypes(groupObj: Object, list: XMLList): void {
            var type: String;
            var name: String;
            for each(var item: XML in list) {
                type = item.@type.toString();
                name = item.@name.toString();
                if (name.indexOf('__info') === -1) {
                    if (groupObj[type] == null)
                        groupObj[type] = new Array();
                    groupObj[type].push(name);
                }
            }
        }

        private function describeValue(name: String, value: * , indent: int): String {
            //trace('name: ' + name + ' type: ' + typeof value);
            switch (typeof value) {
                case 'string': return indentText(indent) + name + ': text\n';
                case 'boolean': return indentText(indent) + name + ': yes or no\n';
                case 'object': {
                    var text: String = indentText(indent) + name + '\n' + describeClass(name, value, indent + 1);
                    for (var id: String in value)
                        text += describeValue(id, value, indent + 1);
                    return text;
                }
                default: return indentText(indent) + name + ': ' + (typeof value) + '\n';
            }
        }
        
        private function indentText(amt: int): String {
            var text: String = '';
            for (var idx: int = 0; idx < amt; idx++)
                text += '--';
            return text;
        }
    }
}