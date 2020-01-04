package classes.Lang.Nodes {
    import classes.Lang.TextRange;
    import classes.Lang.Node;
    import classes.Lang.NodeType;

    public class IdentityNode extends Node {
        public function IdentityNode(range: TextRange, value: *) {
            super(NodeType.Identity, range, [], value);
        }
    }
}