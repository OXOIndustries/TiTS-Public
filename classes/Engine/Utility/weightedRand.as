package classes.Engine.Utility 
{
	/**
	 * ...
	 * @author Gedan
	 */
	public function weightedRand(... args):*
	{
		var opts:Array;
		
		if (args.length > 0 && args[0] is Array)
		{
			opts = args[0];
		}
		else
		{
			opts = args;
		}
		
		// args = objs
		// { v: value, w: weight };
		// { v: funcRef, w: 10 }, { v: rareFuncRef, w: 1 }
		
		var total:int = 0;
		for (var i:int = 0; i < opts.length; i++)
		{
			total += opts[i].w;
		}
		
		var randSelection:int = rand(total);
		randSelection += 1; 
		// the weights are effectively 1-index, not 0, so if we bump up 1 we'll get the correct answer
		// 4 numbers with the same weight:
		// WRand test: 2499,2461,2561,2479
		
		for (i = 0; i < opts.length; i++)
		{
			randSelection -= opts[i].w;
			if (randSelection <= 0) return opts[i].v;
		}
		
		// fallback
		return args[rand(opts.length)].v;
	}
}