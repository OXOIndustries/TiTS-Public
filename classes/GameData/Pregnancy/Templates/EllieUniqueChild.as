package classes.GameData.Pregnancy.Templates
{
	import classes.GLOBAL;
	import classes.kGAMECLASS;
	import classes.GameData.ChildManager;
	import classes.GameData.Pregnancy.UniqueChild;
	import classes.Engine.Utility.rand;
	import classes.Util.RandomInCollection;
	
	public class EllieUniqueChild extends UniqueChild
	{
		public function EllieUniqueChild()
		{
			Name = "";
			UniqueParent = "ELLIE";
			
			originalRace = "leithan";
			skinTone = "gray";
			lipColor = "light pink";
			nippleColor = "light pink";
			eyeColor = "blue";
			hairColor = "gray";
			furColor = "gray";
			scaleColor = "dark gray";
			chitinColor = "NOT SET";
			featherColor = "NOT SET";
		}
	}
}