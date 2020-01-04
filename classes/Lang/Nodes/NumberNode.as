package classes.Lang.Nodes {
    import classes.Lang.TextRange;
    import classes.Lang.Node;
    import classes.Lang.NodeType;

    public class NumberNode extends Node {
        public function NumberNode(range: TextRange, value: Number) {
            super(NodeType.String, range, [], value);
        }
    }
}