package classes.GameData.Pregnancy.Templates
{
	import classes.GLOBAL;
	import classes.kGAMECLASS;
	import classes.GameData.ChildManager;
	import classes.GameData.Pregnancy.UniqueChild;
	import classes.Engine.Utility.rand;
	import classes.Util.RandomInCollection;
	
	public class SeraUniqueChild extends UniqueChild
	{
		public function SeraUniqueChild()
		{
			Name = "";
			UniqueParent = "SERA";
			
			originalRace = "human";
			skinTone = "fair";
			lipColor = "red";
			nippleColor = "light pink";
			eyeColor = "brown";
			hairColor = "hazel";
			scaleColor = "NOT SET";
			furColor = "NOT SET";
		}
	}
}