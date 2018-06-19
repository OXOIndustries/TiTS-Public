package classes.Engine.Utility 
{
	import classes.Engine.Utility.num2Text;
	import classes.Engine.Utility.rand;
	/**
	 * ...
	 * @author ...
	 */
	public function num2Word(iNum:int, casualOnly:Boolean = false, article:Boolean = true): String 
	{
		if(casualOnly || rand(2) == 0)
		{
			switch(iNum)
			{
				case 1: return (article ? "a" : "one"); break;
				case 2: return (article ? "a couple" : "couple of"); break;
				case 3: return (article ? "a few" : "few"); break;
				case 4: return "some"; break;
				case 5: return (article ? "a number of" : "number of"); break;
				case 6: return "several"; break;
			}
		}
		return num2Text(iNum);
	}

}