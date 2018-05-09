package classes.Engine.Utility 
{
	import classes.Engine.Utility.num2Word;
	/**
	 * ...
	 * @author ...
	 */
	public function shortMinutes(nMinutes:Number, casualOnly:Boolean = false, article:Boolean = true):String
	{
		var retStr:String = "";
		var aTime:Array = [];
		var nHours:Number = 0;
		var nDays:Number = 0;
		var nWeeks:Number = 0;
		var nMonths:Number = 0;
		var nYears:Number = 0;
		
		// Years
		if(nMinutes > 525600)
		{
			nYears = Math.floor(nMinutes/525600);
			nMinutes -= 525600 * nYears;
		}
		// Months
		if(nMinutes > 43200)
		{
			nMonths = Math.floor(nMinutes/43200);
			nMinutes -= 43200 * nMonths;
		}
		// Weeks
		if(nMinutes > 10080)
		{
			nWeeks = Math.floor(nMinutes/10080);
			nMinutes -= 10080 * nWeeks;
		}
		// Days
		if(nMinutes > 1440)
		{
			nDays = Math.floor(nMinutes/1440);
			nMinutes -= 1440 * nDays;
		}
		// Hourz
		if(nMinutes > 60)
		{
			nHours = Math.floor(nMinutes/60);
			nMinutes -= 60 * nHours;
		}
		// Minutes
		nMinutes = Math.floor(nMinutes);
		
		if(nYears > 0) aTime.push(num2Word(nYears, casualOnly, article) + " year" + (nYears == 1 ? "" : "s"));
		if(nMonths > 0) aTime.push(num2Word(nMonths, casualOnly, article) + " month" + (nMonths == 1 ? "" : "s"));
		if(nWeeks > 0) aTime.push(num2Word(nWeeks, casualOnly, article) + " week" + (nWeeks == 1 ? "" : "s"));
		if(nDays > 0) aTime.push(num2Word(nDays, casualOnly, article) + " day" + (nDays == 1 ? "" : "s"));
		if(nHours > 0) aTime.push((nHours == 1 && article) ? "an hour" : (num2Word(nHours, casualOnly, article) + " hour" + (nHours == 1 ? "" : "s")));
		if(nMinutes > 0) aTime.push(num2Word(nMinutes, casualOnly, article) + " minute" + (nMinutes == 1 ? "" : "s"));
		
		if(aTime.length > 0)
		{
			for(var i:int = 0; i < aTime.length; i++)
			{
				if(i != 0)
				{
					if(i == aTime.length - 1) retStr += " and ";
					else retStr += ", ";
				}
				retStr += aTime[i];
			}
		}
		
		if(retStr == "") return "no time";
		return retStr;
	}

}