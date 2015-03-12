package classes.Engine.Utility 
{
	/**
	 * ...
	 * @author Gedan
	 */
	import classes.Util.InCollection;
	
	public function indefiniteArticle(msg:String, outputCombined:Boolean = true):String
	{
		var match:Array = /\w+/.exec(msg);
		if (match)
		{
			var word:String = match[0];
		}
		else
		{
			if (outputCombined) return "an " + msg;
			return "an";
		}

		var l_word:String = word.toLowerCase();
    
		// Specific start of words that should be preceeded by 'an'
		var alt_cases:Array = [
			"honest", 
			"hour", 
			"hono"
		];
		
		for (var tCase:String in alt_cases) 
		{
			if (l_word.indexOf(alt_cases[tCase]) == 0)
			{
				if (outputCombined) return "an " + msg;
				return "an";
			}
		}

		// Single letter word which should be preceeded by 'an'
		if (l_word.length == 1) 
		{
			if ("aedhilmnorsx".indexOf(l_word) >= 0)
			{
				if (outputCombined) return "an " + msg;
				return "an";
			}
			else
			{
				if (outputCombined) return "a " + msg;
				return "a";
			}
		}

		// Capital words which should likely be preceeded by 'an'
		if (word.match(/(?!FJO|[HLMNS]Y.|RY[EO]|SQU|(F[LR]?|[HL]|MN?|N|RH?|S[CHKLMNPTVW]?|X(YL)?)[AEIOU])[FHLMNRSX][A-Z]/)) 
		{
			if (outputCombined) return "an " + msg;
			return "an";
		}

		// Special cases where a word that begins with a vowel should be preceeded by 'a'
		var regexes:Array = [
			/^e[uw]/, 
			/^onc?e\b/, 
			/^uni([^nmd]|mo)/, 
			/^u[bcfhjkqrst][aeiou]/
		];
		
		for (var i:* in regexes) 
		{
			if (l_word.match(regexes[i]))
			{
				if (outputCombined) return "a " + msg;
				return "a";
			}
		}

		// Special capital words (UK, UN)
		if (word.match(/^U[NK][AIEO]/)) 
		{
			if (outputCombined) return "a " + msg;
			return "a";
		}
		else if (word == word.toUpperCase()) 
		{
			if ("aedhilmnorsx".indexOf(l_word.charAt(0)) >= 0)
			{
				if (outputCombined) return "an " + msg;
				return "an";
			}
			else
			{
				if (outputCombined) return "a " + msg;
				return "a";
			}
		}

		// Basic method of words that begin with a vowel being preceeded by 'an'
		if ("aeiou".indexOf(l_word.charAt(0)) >= 0)
		{
			if (outputCombined) return "an " + msg;
			return "an";
		}

		// Instances where y follwed by specific letters is preceeded by 'an'
		if (l_word.match(/^y(b[lor]|cl[ea]|fere|gg|p[ios]|rou|tt)/))
		{
			if (outputCombined) return "an " + msg;
			return "an";
		}

		// FALLBACK HO
		if (outputCombined) return "a " + msg;
		return "a";
	}

}