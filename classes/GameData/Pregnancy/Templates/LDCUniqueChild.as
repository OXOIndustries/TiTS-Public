package classes.GameData.Pregnancy.Templates
{
	import classes.GLOBAL;
	import classes.kGAMECLASS;
	import classes.GameData.ChildManager;
	import classes.GameData.Pregnancy.UniqueChild;
	import classes.Engine.Utility.rand;
	import classes.Util.RandomInCollection;
	
	public class LDCUniqueChild extends UniqueChild
	{
		public function LDCUniqueChild()
		{
			Name = "";
			UniqueParent = "L. D. C.";
			
			originalRace = "laquine";
			skinTone = "fair";
			lipColor = "pink";
			nippleColor = "pink";
			eyeColor = "purple";
			hairColor = "pink";
			furColor = "jet-black";
			scaleColor = "NOT SET";
			chitinColor = "NOT SET";
			featherColor = "NOT SET";
		}
	}
}