package editor.Lang.Nodes {
    import editor.Lang.TextRange;

    /**
     * Node used in parsing tree
     * Subclass for specific node
     */
    public class Node {
        /**
         * Use NodeType only
         */
        public var type: int;
        public var range: TextRange;
        public var children: Array;
        public var value: *;
            
        public function Node(type: int, range: TextRange, children: Array, value: *) { 
            this.type = type;
            this.range = range;
            this.children = children;
            this.value = value;
        }

        public function toString(): String {
            return 'Node|type: ' + this.type + ' range: ' + this.range + ' value: [' + this.value + ']';
        }
    }
}