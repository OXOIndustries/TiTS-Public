package editor.Lang.Nodes {
    import editor.Lang.TextRange;

    public class EvalNode extends Node {        
        /**
         * @param range
         * @param children [RetrieveNode, ArgsNode, ResultsNode]
         */
        public function EvalNode(range: TextRange, children: Array) {
            super(NodeType.Eval, range, children, null);
        }
    }
}