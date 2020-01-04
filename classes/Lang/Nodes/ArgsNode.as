package classes.Lang.Nodes {
    import classes.Lang.TextRange;
    import classes.Lang.Node;
    import classes.Lang.NodeType;

    public class ArgsNode extends Node {
        public function ArgsNode(range: TextRange, children: *) {
            super(NodeType.Args, range, children, null);
        }
    }
}