package editor.Lang.Nodes {
    import editor.Lang.TextRange;

    public class ArgsNode extends Node {
        /**
         * @param range
         * @param children Array of StringNode or NumberNode
         */
        public function ArgsNode(range: TextRange, children: Array) {
            super(NodeType.Args, range, children, null);
        }
    }
}