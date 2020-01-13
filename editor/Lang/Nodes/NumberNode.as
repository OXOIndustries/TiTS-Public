package editor.Lang.Nodes {
    import editor.Lang.TextRange;

    public class NumberNode extends Node {
        public function NumberNode(range: TextRange, value: Number) {
            super(NodeType.String, range, [], value);
        }
    }
}