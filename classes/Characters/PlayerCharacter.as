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
		
		override public function loadInCunt(cumFrom:Creature, vagIndex:int = -1):Boolean
		{
			kGAMECLASS.mimbraneFeed("vagina");
			return this.tryKnockUp(cumFrom, vagIndex);
		}
		
		override public function loadInAss(cumFrom:Creature):Boolean
		{
			kGAMECLASS.mimbraneFeed("ass");
			return this.tryKnockUp(cumFrom, 3);
		}
		
		override public function loadInMouth(cumFrom:Creature):Boolean
		{
			kGAMECLASS.mimbraneFeed("face");
			return false;
		}
		
		// *shrug*
		override public function loadInNipples(cumFrom:Creature):Boolean
		{
			kGAMECLASS.mimbraneFeed("boobs");
			return false;
		}
		
		override public function loadInCuntTail(cumFrom:Creature):Boolean
		{
			if (this.hasTailCunt()) kGAMECLASS.feedCuntSnake();
			return this.tryKnockUp(cumFrom, 4);
		}
		
		public var ShipStorageInventory:Array = [];
	}
}