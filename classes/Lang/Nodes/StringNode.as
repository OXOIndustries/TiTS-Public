package classes.Lang.Nodes {
    import classes.Lang.TextRange;
    import classes.Lang.Node;
    import classes.Lang.NodeType;

    public class StringNode extends Node {
        public function StringNode(range: TextRange, value: String) {
            super(NodeType.String, range, [], value);
        }
    }
}