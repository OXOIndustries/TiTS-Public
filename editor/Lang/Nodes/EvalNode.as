package editor.Lang.Nodes {
    import editor.Lang.TextRange;

    public class EvalNode extends Node {
        public static const OpDefault: int = 0;
        public static const OpRange: int = 1;
        public static const OpEqual: int = 2;
        
        /**
         * @param range
         * @param children [RetrieveNode, ArgsNode, ResultsNode]
         * @param operator Use EvalNode.Op<Type>
         */
        public function EvalNode(range: TextRange, children: Array, operator: int) {
            super(NodeType.Eval, range, children, operator);
        }
    }
}