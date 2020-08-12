package classes.GameData.Pregnancy.Templates
{
	import classes.GLOBAL;
	import classes.kGAMECLASS;
	import classes.GameData.ChildManager;
	import classes.GameData.Pregnancy.UniqueChild;
	
	public class MakiusUniqueChild extends UniqueChild
	{
		public function MakiusUniqueChild()
		{
			RaceType = GLOBAL.TYPE_VENARIAN;
			MaturationRate = 1;
			UniqueParent = "MAKIUS";
			originalRace = "venarian";
		}
	}
}