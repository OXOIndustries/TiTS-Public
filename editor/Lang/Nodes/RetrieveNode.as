package editor.Lang.Nodes {
    import editor.Lang.TextRange;

    public class RetrieveNode extends Node {
        public function RetrieveNode(range: TextRange, children: Array) {
            super(NodeType.Retrieve, range, children, null);
        }
    }
}