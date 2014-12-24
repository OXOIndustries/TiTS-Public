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
		tarDate.setDate(day);
		tarDate.setMonth(month);
		
		var minBound:Date = new Date(tarDate.getTime() - (msd * dayRange));
		var maxBound:Date = new Date(tarDate.getTime() + (msd * dayRange));
		
		if (curDate.getTime() >= minBound.getTime() && curDate.getTime() <= maxBound.getTime()) return true;
		return false;
	}

}