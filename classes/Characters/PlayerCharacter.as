package classes.Characters 
{
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.GLOBAL;
	
	/**
	 * Yeah this is kinda bullshit, but it also means we can version the PC data structure like NPCs.
	 * Might be useful, but its mainly here to do some proper error checking.
	 * @author Gedan
	 */
	public class PlayerCharacter extends Creature
	{
		public function PlayerCharacter() 
		{
			this._latestVersion = 1;
			this.version = _latestVersion;
			this._neverSerialize = false;
			this._isLoading = false;
		}
		
		// Level up stuff
		public var unspentStatPoints:int = 0;
		public var unclaimedClassPerks:int = 0;
		public var unclaimedGenericPerks:int = 0;
		
		public function levelUpAvailable():Boolean
		{
			if (unspentStatPoints > 0) return true;
			if (unclaimedClassPerks > 0) return true;
			//if (unclaimedGenericPerks > 0) return true; // Placeholder for possible future usage.
			return false;
		}
		
		override public function loadInCunt(cumFrom:Creature, vagIndex:int = 0):void
		{
			kGAMECLASS.mimbraneFeed("vagina");
			
			// If we've got a valid cunt to fill, call the knockup routine
			this.tryKnockUp(cumFrom, vagIndex);
		}
		
		override public function loadInAss(cumFrom:Creature):void
		{
			kGAMECLASS.mimbraneFeed("ass");
			this.tryKnockUp(cumFrom, 3);
		}
		
		override public function loadInMouth(cumFrom:Creature):void
		{
			kGAMECLASS.mimbraneFeed("face");
		}
		
		// *shrug*
		override public function loadInNipples(cumFrom:Creature):void
		{
			kGAMECLASS.mimbraneFeed("boobs");
		}
		
		override public function loadInCuntTail(cumFrom:Creature):void
		{
			if (this.hasTailCunt()) kGAMECLASS.feedCuntSnake();
		}
		
		// If you wanna do unique stuff for the player, override the pregnancy method here. Swish.
		// override public function tryKnockUp(cumFrom:Creature, pregSlot:int = 0):void {}
	}
}