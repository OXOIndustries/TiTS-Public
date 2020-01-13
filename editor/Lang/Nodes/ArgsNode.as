package editor.Lang.Nodes {
    import editor.Lang.TextRange;

    public class ArgsNode extends Node {
        public function ArgsNode(range: TextRange, children: *) {
            super(NodeType.Args, range, children, null);
        }
    }
}