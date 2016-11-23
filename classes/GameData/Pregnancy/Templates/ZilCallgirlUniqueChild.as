package classes.GameData.Pregnancy.Templates
{
	import classes.GLOBAL;
	import classes.kGAMECLASS;
	import classes.GameData.ChildManager;
	import classes.GameData.Pregnancy.UniqueChild;
	import classes.Engine.Utility.rand;
	import classes.Util.RandomInCollection;
	
	public class ZilCallgirlUniqueChild extends UniqueChild
	{
		public function ZilCallgirlUniqueChild()
		{
			Name = "";
			UniqueParent = "Zheniya";
			
			originalRace = "zil";
			skinTone = "gold";
			lipColor = "black";
			nippleColor = "black";
			eyeColor = "black";
			hairColor = RandomInCollection(["black", "black", "yellow", "yellow and black striped"]);
			furColor = "yellow";
			scaleColor = "NOT SET";
			chitinColor = "black";
			featherColor = "NOT SET";
		}
	}
}