package classes.Lang {
    /**
     * @author end5
     */

    public class StringStream {
        public var pos: uint = 0;
        private var str: String;

        public function StringStream(str: String) {
            this.str = str;
        }

        /**
         * Returns true only if the stream is at the end of the string.
         */
        public function eos(): Boolean {
            return this.pos >= this.str.length;
        }

        /**
         * Returns char at pos without incrementing pos
         */
        public function peek(): String {
            return this.str.charAt(this.pos);
        }

        /**
         * If the next character in the stream 'matches' the given argument, it is consumed and returned.
         * Otherwise, undefined is returned.
         * @param match A character
         */
        public function eat(match: String): String {
            if (this.str.charAt(this.pos) === match) return this.str.charAt(this.pos++);
            return null;
        }

        /**
         * Repeatedly eats characters that do not match the given characters. Returns true if any characters were eaten.
         * @param notChars Characters that do not match the string
         */
        public function eatWhileNot(...notChars: Array): Boolean {
            var startPos: uint = this.pos;
            var index: uint = startPos;
            var matchFound: Boolean = false;

            for each (var char: String in notChars) {
                index = this.str.indexOf(char, startPos);

                // Match was found
                if (~index) {
                    matchFound = true;
                    // char found at start position
                    // cannnot progress
                    if (index === startPos) {
                        this.pos = startPos;
                        break;
                    }
                    // Match found at farther position
                    if (this.pos > index || this.pos === startPos)
                        this.pos = index;
                }
            }

            // Nothing matched so the rest of the string is ok
            if (!matchFound)
                this.pos = this.str.length;

            return this.pos > startPos;
        }
    }
}
