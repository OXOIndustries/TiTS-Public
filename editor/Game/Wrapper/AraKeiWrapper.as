package editor.Game.Wrapper {
    /**
     * This is used to limit the interpreter's access
     * AraKei creature has a getDesc override
     */
    public class AraKeiWrapper extends CreatureWrapper {
        public function AraKeiWrapper(ownerObj: ObjectAccessor) {
            super(ownerObj);
        }
        
        override public function get he(): String {
            return this.owner.mfn("he", "she", "they");
        }
        
        override public function get his(): String {
            return this.owner.mfn("his", "her", "their");
        }
            
        override public function get him(): String {
            return this.owner.mfn("him", "her", "them");
        }
            
        public function himself(): String {
            return this.owner.mfn("himself", "herself", "themselves");
        }
    }
}