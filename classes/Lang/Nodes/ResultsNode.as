package classes.Lang.Nodes {
    import classes.Lang.TextRange;
    import classes.Lang.Node;
    import classes.Lang.NodeType;

    public class ResultsNode extends Node {
        public function ResultsNode(range: TextRange, children: *) {
            super(NodeType.Results, range, children, null);
        }
    }
}