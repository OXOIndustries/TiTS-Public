package classes.Engine.Interfaces 
{
	import classes.GameData.CommandContainer;
	import classes.Engine.Interfaces.StructureButtons;
	
	/**
	 * This has bugged me for years, but it comes up so infrequently I've never done anything about it.
	 * Until now.
	 * 
	 * This is a helper function that you feed a list of button configuration options too, and then it tweaks
	 * all of the offsets to ensure that slot 14 on each page contains a back button when required.
	 * 
	 * @param	opts			An array of CommandContainer objects. Can contain nulls to indicate empty spaces.
	 * @param	backCC			A CommandContainer representing the back button
	 * @param	useButtonColors	Clears the default button color arrangement and instead leans on setButtonPurple() to highlight indexes.
	 */
	public function StructureButtons(opts:Array, backCC:CommandContainer, setButtonColors:Boolean = false):void
	{
		if (setButtonColors)
		{
			setAllButtonColors(true);
		}
		
		var btnI:int = 0;
		for (var i:int = 0; i < opts.length; i++)
		{
			if (btnI > 0 && btnI % 14 == 0)
			{
				i--;				
				backCC.AddAsButton(btnI++);
				continue;
			}
			
			var cc:CommandContainer = opts[i];
			if (cc != null)
			{
				if (cc.IsPurple)
				{
					setButtonPurple(btnI);
				}
				
				cc.AddAsButton(btnI++);
			}
			else
			{
				btnI++;
			}
			
		}
		
		// Ensure there's always an instance of the back button at the last position on the first page.
		if (opts.length < 14)
		{
			backCC.AddAsButton(14);
		}
	}

}