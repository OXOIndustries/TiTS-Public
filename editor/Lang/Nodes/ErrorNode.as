package editor.Lang.Nodes {
    import editor.Lang.TextRange;
    
    public class ErrorNode extends Node {
        public function ErrorNode(range: TextRange, value: *) {
            super(NodeType.Error, range, [], value);
        }
    }
}