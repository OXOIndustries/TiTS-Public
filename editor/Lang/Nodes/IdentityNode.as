package editor.Lang.Nodes {
    import editor.Lang.TextRange;

    public class IdentityNode extends Node {
        public function IdentityNode(range: TextRange, value: *) {
            super(NodeType.Identity, range, [], value);
        }
    }
}