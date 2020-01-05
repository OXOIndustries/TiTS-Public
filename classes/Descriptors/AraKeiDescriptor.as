package classes.Descriptors {
    
    import classes.Creature;
    import classes.Descriptors.CreatureDescriptor;
    
    public class AraKeiDescriptor extends CreatureDescriptor {
        public function AraKeiDescriptor(ownerObj: ObjectAccessor) {
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