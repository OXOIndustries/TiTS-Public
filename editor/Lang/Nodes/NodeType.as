package editor.Lang.Nodes {
    public class NodeType {
        public static var Identity: int = 0;
        public static var String: int = 1;
        public static var Number: int = 2;
        public static var Concat: int = 3;
        public static var Eval: int = 4;
        public static var Retrieve: int = 5;
        public static var Args: int = 6;
        public static var Results: int = 7;
        
        public static var Names: Array = [
            'Identifier',
            'String',
            'Number',
            'Concat',
            'Eval',
            'Retrieve',
            'Args',
            'Results'
        ];
    }
}