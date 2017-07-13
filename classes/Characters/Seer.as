package classes.Characters
{
	import classes.Creature;
	import classes.GLOBAL;
	import classes.kGAMECLASS;
	import classes.Engine.Utility.rand;
	
	public class Seer extends Creature
	{
		//constructor
		public function Seer()
		{
			this.sellMarkup = 1.2;
		}
		
		override public function onLeaveBuyMenu():void
		{
			kGAMECLASS.approachSeer();
		}
	}

}
