package classes.Lang.Nodes {
    import classes.Lang.TextRange;
    import classes.Lang.Node;
    import classes.Lang.NodeType;

    public class AccessNode extends Node {
        public function AccessNode(range: TextRange, children: *) {
            super(NodeType.Access, range, children, null);
        }
    }
}