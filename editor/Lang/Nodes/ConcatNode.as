package editor.Lang.Nodes {
    import editor.Lang.TextRange;

    public class ConcatNode extends Node {
        public function ConcatNode(range: TextRange, children: Array) {
            super(NodeType.Concat, range, children, null);
        }
    }
}