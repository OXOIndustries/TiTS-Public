package editor.Lang.Parse {
    import editor.Lang.Errors.*;
    import editor.Lang.Nodes.Node;

    public class ParseResult {
        /**
         * The start/root of tree
         */
        public var root: Node;
        /**
         * Errors from parsing
         */
        public var errors: Vector.<LangError>;

        public function ParseResult(root: Node, errors: Vector.<LangError>) {
            this.root = root;
            this.errors = errors;
        }
    }
}