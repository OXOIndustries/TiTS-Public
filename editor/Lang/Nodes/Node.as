package editor.Lang.Nodes {
    import editor.Lang.TextRange;

    public class Node {
        public var type: String;
        public var range: TextRange;
        public var children: Array;
        public var value: *;
            
        public function Node(type: String, range: TextRange, children: Array, value: *) { 
            this.type = type;
            this.range = range;
            this.children = children;
            this.value = value;
        }

        public static function isErrorNode(node: Node): Boolean {
            return node.type === NodeType.Error;
        }

        public function toString(): String {
            return 'Node|type: ' + this.type + ' range: ' + this.range + ' value: [' + this.value + ']';
        }
    }
}