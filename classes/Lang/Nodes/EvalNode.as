package classes.Lang.Nodes {
    import classes.Lang.TextRange;
    import classes.Lang.Node;
    import classes.Lang.NodeType;

    public class EvalNode extends Node {
        public function EvalNode(range: TextRange, children: *) {
            super(NodeType.Eval, range, children, null);
        }
    }
}