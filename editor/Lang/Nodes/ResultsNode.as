package editor.Lang.Nodes {
    import editor.Lang.TextRange;

    public class ResultsNode extends Node {
        /**
         * @param range
         * @param children Array of StringNode or ConcatNode or EvalNode
         */
        public function ResultsNode(range: TextRange, children: Array) {
            super(NodeType.Results, range, children, null);
        }
    }
}