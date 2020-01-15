package editor.Lang.Nodes {
    import editor.Lang.TextRange;

    public class RetrieveNode extends Node {
        /**
         * @param range
         * @param children Array of IdentityNode
         */
        public function RetrieveNode(range: TextRange, children: Array) {
            super(NodeType.Retrieve, range, children, null);
        }
    }
}