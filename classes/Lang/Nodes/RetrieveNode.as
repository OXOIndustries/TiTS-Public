package classes.Lang.Nodes {
    import classes.Lang.TextRange;
    import classes.Lang.Node;
    import classes.Lang.NodeType;

    public class RetrieveNode extends Node {
        public function RetrieveNode(range: TextRange, children: Array) {
            super(NodeType.Retrieve, range, children, null);
        }
    }
}