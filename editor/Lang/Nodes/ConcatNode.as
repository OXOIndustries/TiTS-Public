package editor.Lang.Nodes {
    import editor.Lang.TextRange;

    public class ConcatNode extends Node {
        /**
         * @param range
         * @param children Array of StringNode or ConcatNode or EvalNode
         */
        public function ConcatNode(range: TextRange, children: Array) {
            super(NodeType.Concat, range, children, null);
        }
    }
}