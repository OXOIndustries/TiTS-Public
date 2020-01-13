package editor.Lang.Nodes {
    import editor.Lang.TextRange;

    public class ResultsNode extends Node {
        public function ResultsNode(range: TextRange, children: *) {
            super(NodeType.Results, range, children, null);
        }
    }
}