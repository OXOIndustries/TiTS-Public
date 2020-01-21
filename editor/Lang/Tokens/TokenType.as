package editor.Lang.Tokens {
    public class TokenType {
        public static var EOS: int = 0;
        public static var Text: int = 1;
        public static var Space: int = 2;
        public static var Newline: int = 3;
        public static var LeftBracket: int = 4;
        public static var RightBracket: int = 5;
        public static var Dot: int = 6;
        public static var Pipe: int = 7;
        
        public static var Names: Array = [
            'EOS',
            'Text',
            'Space',
            'Newline',
            'LeftBracket',
            'RightBracket',
            'Dot',
            'Pipe'
        ];
    }
}