package editor.Lang.Nodes {
    import editor.Lang.TextRange;
    
    public class ErrorNode extends Node {
        public function ErrorNode(range: TextRange, value: String) {
            super(NodeType.Error, range, [], value);
        }
    }
}