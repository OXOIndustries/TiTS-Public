package editor.Lang.Tokens {
    public class TokenType {
        public static const EOS: int = 0;
        public static const Text: int = 1;
        public static const Space: int = 2;
        public static const Newline: int = 3;
        public static const LeftBracket: int = 4;
        public static const RightBracket: int = 5;
        public static const Dot: int = 6;
        public static const Pipe: int = 7;
        public static const GreaterThan: int = 8;
        public static const Equal: int = 9;
        public static const At: int = 10;
        public static const LeftParen: int = 11;
        public static const RightParen: int = 12;
        
        public static const Names: Array = [
            'EOS',
            'Text',
            'Space',
            'Newline',
            'LeftBracket',
            'RightBracket',
            'Dot',
            'Pipe',
            'GreaterThan',
            'Equal',
            'At',
            'LeftParen',
            'RightParen'
        ];
    }
}