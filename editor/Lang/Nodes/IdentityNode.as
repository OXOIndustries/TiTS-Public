package editor.Lang.Nodes {
    import editor.Lang.TextRange;

    public class IdentityNode extends Node {
        public function IdentityNode(range: TextRange, value: String) {
            super(NodeType.Identity, range, [], value);
        }
    }
}