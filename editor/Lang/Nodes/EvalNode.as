package editor.Lang.Nodes {
    import editor.Lang.TextRange;

    public class EvalNode extends Node {
        public function EvalNode(range: TextRange, children: Array) {
            super(NodeType.Eval, range, children, null);
        }
    }
}