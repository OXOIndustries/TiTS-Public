package classes.Lang.Nodes {
    import classes.Lang.TextRange;
    import classes.Lang.Node;
    import classes.Lang.NodeType;

    public class ConcatNode extends Node {
        public function ConcatNode(range: TextRange, children: *) {
            super(NodeType.Concat, range, children, null);
        }
    }
}