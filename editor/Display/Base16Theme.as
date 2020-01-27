package editor.Display {
    public class Base16Theme {
        private const arr: Array = new Array(16);
        public function get base00(): uint { return this.arr[0x00]; }
        public function get base01(): uint { return this.arr[0x01]; }
        public function get base02(): uint { return this.arr[0x02]; }
        public function get base03(): uint { return this.arr[0x03]; }
        public function get base04(): uint { return this.arr[0x04]; }
        public function get base05(): uint { return this.arr[0x05]; }
        public function get base06(): uint { return this.arr[0x06]; }
        public function get base07(): uint { return this.arr[0x07]; }
        public function get base08(): uint { return this.arr[0x08]; }
        public function get base09(): uint { return this.arr[0x09]; }
        public function get base0A(): uint { return this.arr[0x0A]; }
        public function get base0B(): uint { return this.arr[0x0B]; }
        public function get base0C(): uint { return this.arr[0x0C]; }
        public function get base0D(): uint { return this.arr[0x0D]; }
        public function get base0E(): uint { return this.arr[0x0E]; }
        public function get base0F(): uint { return this.arr[0x0F]; }

        public function Base16Theme(
            base00: uint,
            base01: uint,
            base02: uint,
            base03: uint,
            base04: uint,
            base05: uint,
            base06: uint,
            base07: uint,
            base08: uint,
            base09: uint,
            base0A: uint,
            base0B: uint,
            base0C: uint,
            base0D: uint,
            base0E: uint,
            base0F: uint
        ) {
            this.arr[0x00] = base00;
            this.arr[0x01] = base01;
            this.arr[0x02] = base02;
            this.arr[0x03] = base03;
            this.arr[0x04] = base04;
            this.arr[0x05] = base05;
            this.arr[0x06] = base06;
            this.arr[0x07] = base07;
            this.arr[0x08] = base08;
            this.arr[0x09] = base09;
            this.arr[0x0A] = base0A;
            this.arr[0x0B] = base0B;
            this.arr[0x0C] = base0C;
            this.arr[0x0D] = base0D;
            this.arr[0x0E] = base0E;
            this.arr[0x0F] = base0F;
        }
    }
}
