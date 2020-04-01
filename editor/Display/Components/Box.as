package editor.Display.Components {
    import flash.display.Sprite;

    public class Box extends Sprite {
        private var noScaleWidth:Number = 0;
        private var noScaleHeight:Number = 0;
        public function get nsWidth():Number {
            return noScaleWidth;
        }
        
        public function set nsWidth(value:Number):void {
            noScaleWidth = value;
        }
        
        public function get nsHeight():Number {
            return noScaleHeight;
        }
        
        public function set nsHeight(value:Number):void {
            noScaleHeight = value;
        }
    }
}