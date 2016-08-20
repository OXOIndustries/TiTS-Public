package classes.Characters 
{
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.GLOBAL;
	
	/* Basically used to track basic baby data determined by original genetics inherited from player character. */
	
	// Since this is kind of a mandatory thing that would lead to glitches and broken scenes if ignored, I feel like it should probably be a forced Codex alert that the player has to engage with before moving on. Like it pops up after taking one step or right when they load or something.
	
	// Also, do we know for certain that this feature would include the parser calls like [baby.eyeColor], [baby.hairColor], and [baby.skinColor]? The way character creation handles hair and fur/scale color is a bit weird, they're all rolled into one option, so scales and fur may need their own calls of [baby.furColor] and [baby.scaleColor] or something. I don't really know. :P 
	
	public class PlayerOffspring extends Creature
	{
		public function PlayerOffspring() 
		{
			_latestVersion = 1;
			version = _latestVersion;
			_neverSerialize = false;
			
			short = "baby";
			originalRace = "NOT SET";
			a = "your ";
			capitalA = "Your ";
			long = "";
			customDodge = "";
			customBlock = "";
			isPlural = false;
			
			skinTone = "NOT SET";
			lipColor = "NOT SET";
			nippleColor = "NOT SET";
			eyeColor = "NOT SET";
			hairColor = "NOT SET";
			scaleColor = "NOT SET";
			furColor = "NOT SET";
			
			_isLoading = false;
		}
	}
}
