package classes.Util 
{
	import classes.Engine.Utility.rand;

	public function ShuffleArray(array:Array):Array
	{
		var temp:*;
		var tempOffset:int;
		for (var i:int = array.length - 1; i >= 0; i--)
		{
			tempOffset = rand(i+1);
			temp = array[i];
			array[i] = array[tempOffset];
			array[tempOffset] = temp;
		}
		return array;
	}
}