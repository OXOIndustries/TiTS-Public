package editor.Lang.Parse {
    import editor.Lang.Errors.*;
    import editor.Lang.Nodes.Node;

    public class ParseResult {
        public var root: Node;
        public var errors: Vector.<LangError>;

        public function ParseResult(root: Node, errors: Vector.<LangError>) {
            this.root = root;
            this.errors = errors;
        }
    }
}