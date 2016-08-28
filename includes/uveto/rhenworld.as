

public function showKyris(nude:Boolean = false):void
{
	if(nude) showBust("KYRIS_NUDE");
	else showBust("KYRIS");
	if(9999 == 0) showName("\nKYRIS");
	else showName("\nSECRETARY");
	author("Savin");
}
public function showAnyxine(nude:Boolean = false):void
{
	if(nude) showBust("ANYXINE_NUDE");
	showBust("ANYXINE");
	showName("\nANYXINE");
	author("Savin");
}

// Anyxine's Office
public function rhenWorldEntranceBonus():Boolean
{
	showBust("KYRIS");
	
	output("The RhenWorld Stellar Excavations offices are warmer than the rest of the ship, and brightly colored with sandy wallpapers and potted plants surrounding an interior fountain -- very expensive decorations on a space station. A half dozen female");
	if (CodexManager.hasUnlockedEntry("Leithans")) output(" leithans");
	else output(" plated, six-legged centaurs with ashen skin");
	output(" are sitting on their legs behind ‘U’-shaped desks, busily working on holoscreens.");
	if (!CodexManager.hasUnlockedEntry("Leithans"))
	{
		output(" <b>Your codex identifies them as leithans.</b>");
		CodexManager.unlockEntry("Leithans");
	}

	if (flags["RHENWORLD_OFFICE_VISITED"] == undefined)
	{
		output("\n\nOne of the leithan girls smiles as you wander into the offices. <i>“Hello! Welcome to RhenWorld, " + pc.mf("Mr.", "Ms.") + "... Steele!”</i> she says, eyeing a dataslate to identify you. <i>“Miss Rhenesunne is currently in her office. Please, go ahead.”</i>");

		output("\n\nShe sweeps one of her black, plated arms towards the southern door.");
		
		flags["RHENWORLD_OFFICE_VISITED"] = 1;
	}
	else
	{
		output("\n\n<i>“Welcome back, " + pc.mf("Mr.", "Ms.") + " Steele!”</i> the leithan secretary nearest the south door says, flashing you an adorable smile.");
	}
	
	return false;
}

// Anyxine's Office
public function rhenesunneOfficeBonus():Boolean
{
	showBust("ANYXINE");
	
	if (flags["MET_RHENESUNNE"] == undefined)
	{
		output("\n\nYou might have expected a leithan woman after the group of them out in the lobby, but instead you're treated to the sight of a tall, slender bipedal woman with lustrous black hair pulled back into a ponytail. A pair of blue, glittering eyes glance up at you from the screens and the woman leans back in her chair, revealing a svelte, athletic body with curves that strain against a very expensive looking bodysuit.");

		output("\n\n<i>“I wasn’t aware I had an appointment,”</i> she says coolly, eyeing you. <i>“Please, have a seat.”</i>");
		
		flags["MET_RHENESUNNE"] = 1;
	}
	else
	{
		output("\n\n<i>“Ah, Steele,”</i> Anyxine says, leaning back in her chair and steepling her fingers as you approach.");
	}

	return false;
}