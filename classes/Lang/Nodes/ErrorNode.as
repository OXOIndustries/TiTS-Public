package classes.Lang.Nodes {
    import classes.Lang.TextRange;
    import classes.Lang.Node;
    import classes.Lang.NodeType;
	
    public class ErrorNode extends Node {
        public function ErrorNode(range: TextRange, value: *) {
            super(NodeType.Error, range, [], value);
        }
    }
}