package classes.Engine 
{
	/**
	 * Check if the current date falls within a target range.
	 * @author Gedan
	 */
	public function checkDate(day:int, month:int, dayRange:int):Boolean
	{
		// Milliseconds per day (1000*60*60*24)
		var msd:int = 86400000;
		
		var curDate:Date = new Date();
		
		var tarDate:Date = new Date();
		tarDate.setFullYear(curDate.getFullYear());
		tarDate.setMonth(month - 1);
		tarDate.setDate(day);
		
		var minBound:Number = tarDate.getTime();
		minBound -= (msd * dayRange);
		
		var maxBound:Number = tarDate.getTime();
		maxBound += (msd * dayRange);
		
		if ((curDate.getTime() >= minBound) && (curDate.getTime() <= maxBound)) return true;
		return false;
	}

}