package editor.Display.Components {
    import flash.text.TextField;

    public class TextBox extends TextField {
        public function get nsWidth():Number {
            return width;
        }
        
        public function set nsWidth(value:Number):void {
            width = value;
        }
        
        public function get nsHeight():Number {
            return height;
        }
        
        public function set nsHeight(value:Number):void {
            height = value;
        }
    }
}