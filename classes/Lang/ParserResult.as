package classes.Lang {
    /**
     * @author end5
     */

    import classes.Lang.Node;
    import classes.Lang.ParserError;

    public class ParserResult {
        public var root: Node;
        public var errors: Vector.<ParserError>;

        public function ParserResult(root: Node, errors: Vector.<ParserError>) {
            this.root = root;
            this.errors = errors;
        }
    }
}