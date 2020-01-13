package editor.Lang.Nodes {
    import editor.Lang.TextRange;

    public class StringNode extends Node {
        public function StringNode(range: TextRange, value: String) {
            super(NodeType.String, range, [], value);
        }
    }
}