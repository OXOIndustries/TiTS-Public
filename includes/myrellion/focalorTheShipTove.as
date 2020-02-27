import classes.ShittyShips.MSXI;
import classes.ShittyShips.ClydesdaleK7;
import classes.ShittyShips.SledgehammerMkII;
//By Fenfen
/*Myrellion: Tove Ship Trader named Focalor.
	Aegis MX-XI
	Steeletech Clydesdale K7
	Reaper Armaments Sledgehammer MkII

Uveto: Mechanic
	Habitation Module
	Auxillary Thrusters (+20 speed)
	Thrust Vectoring System (+20 Agility)
	Capacitor Vampire - req's shields be down. Steals cap. 1x/fite
*/
public function showFocalor():void
{
	showName("\nFOCALOR");
	showBust("FOCALOR");
}
public function focalorBonus():void
{
	if(flags["MET_Focalor"] == undefined) 
	{
		if(!CodexManager.entryUnlocked("Toves")) 
		{
			output("\n\nA squat, bird-like creature in a pristine white jacket stands atop a pile of crates, shouting over the din of hurried Rushers and flaring spaceship engines to proclaim that he’s got the best deals on ships anywhere.");
			addButton(0,"Bird-Creature",focalorApproach);
		}
		else 
		{
			output("\n\nA green-feathered Tove in a pristine white jacket makes up for his diminutive height by standing atop a haphazard collection of crates, bellowing that he has the best deals on ships anywhere.");
			addButton(0,"Tove",focalorApproach);
		}
	}
	else 
	{
		output("\n\nFocalor is at his usual place: pacing back and forth atop a small mountain of crates, shouting the merits of his wares to any who will listen, the gold buttons on his jacket flashing. The green-feathered tilts his head respectfully at the sight of you but refuses to slow his brash hawking in the slightest.");
		addButton(0,"Focalor",focalorApproach,undefined,"Focalor","See what the fast-talking Focalor has for sale.");
	}
}

public function focalorApproach(back:Boolean = false):void
{
	clearOutput();
	showFocalor();
	author("Fenoxo");
	if(!back)
	{
		//Approach 1st time
		if(flags["MET_Focalor"] == undefined)
		{
			flags["MET_Focalor"] = 1;
			output("Interested in seeing what he’s selling, you walk up to four-eyed ");
			if(CodexManager.entryUnlocked("Toves")) output("Tove");
			else output("bird-person");
			output(" and call out a greeting of your own.");
			output("\n\n<i>“Oh, delirious delights! Finally, a sapient of class and intelligence.”</i> He lowers his voice to a more comfortable volume and puffs out what passes for his chest. <i>“You now have the good fortune of conversating with Fair-shake Focalor, a tove who--if I do so humbleflatter myself--is as reknowned for his artistocomely appearance as for the equitability of his dealings, but let’s keep that between you and me. If word got out I was this pretty, I’d be disowned and discomissioned.”</i> He winks, buffing his nails against his jacket. <i>“Seriously though, if my dear, sweet mother - profits bless her revenerable webbed feet - finds out I haven’t struck the most parsimiserly deal possible, I really would be disowned... and probably defenestrated.”</i> This time he winks with three eyes. <i>“But enough about my own personage! Tell me about yourself, my refined, unfeathered friend. What’s your eponymoniker, and which of these cherrymint vessels will you be flying home in today?”</i>");
			output("\n\n<i>“[pc.name],”</i> you admit, trying to catch up with the fast-talking alien.");
			output("\n\n<i>“Perfectitastic! You sound like a [pc.manWoman] of means and determination.”</i> Focalor smiles somehow, in spite of his beak. <i>“Behold my heavenly stable of interstellar vessels, verifitable chariots of the non-denominational gods, and you’ll find yourself gratified to empty your proverbial wallet upon my humblest of altars. Aheheh,”</i> he chuckles smugly. Two of his hands slap a black crate hard, and a holographic display full of prices springs up. <i>“I promise. Ask any other Rusher, and they will sing hosannas to Fair-Shake Focalor. Now please, perusify the wares I have so painstakingly presentified for your perspicacious purchasing pleasure.”</i>");
			if(!CodexManager.entryUnlocked("Toves")) 
			{
				output("\n\nAccording to your Codex, he belongs to a mercantile species known as Toves.");
				CodexManager.unlockEntry("Toves");
			}
		}
		//Repeat approach
		else
		{
			output("You step up to Focalor’s mountain of crates with a smile and a wave. <i>“I came back.”</i>");
			output("\n\n<i>“You did say that, my beamish palaquaintance, and color me octarine, there you are!”</i> Focalor’s four eyes radiate happiness. <i>“Well frabjous day! That means you quantifitify for my regaloyalty returning customer rewards!”</i> He kicks one of the crates, hard, and a holographic display springs into being, listing his inventory once more. The prices are exactly the same as before. Focalor must see the look spreading across your face, because he hastily adds, <i>“Non-cash benefits, of course. Returning customers are imparted with platinum-level service and a warranty that’s good for more than 26 kiloflorps!”</i>");
			output("\n\nUnsure if such a warranty would be good for anything, you nonetheless look through his wares.");
		}
		processTime(2);
	}
	else
	{
		output("What ship are you interested in buying?");
	}
	clearMenu();
	shopkeep = chars["FOCALOR"];
	shopkeep.inventory = [];
	var ships:Array = [];
	ships.push(["Aegis MS-XI", "Aegis MS-XI", new MSXI()]);
	ships.push(["ClydesdaleK7", "ClydesdaleK7", new ClydesdaleK7()]);
	ships.push(["Sledgehammr", "Sledgehammer Mark II", new SledgehammerMkII()]);
	for(var i:int = 0; i < ships.length; i++)
	{
		addShipCompareButton(i,shits["SHIP"],ships[i][2],ships[i][0],shipBuyScreen,ships[i][2],ships[i][1]);
	}
	addButton(13,"Current Ship",shipStatistics,focalorApproachBack,"Current Ship Stats","Look over your ship and its equipped modules.");
	addButton(14,"Leave",leaveFocalor);
}
public function focalorApproachBack():void { return focalorApproach(true); }

//Leave
public function leaveFocalor():void
{
	clearOutput();
	showFocalor();
	author("Fenoxo");
	output("You turn to leave.");
	output("\n\n<i>“Wait!”</i> Focalor is stretching all four of his arms out at you, palms open. <i>“Now hold on there, palaquaintance! What if I threw in accomplemating rust-proofing, de-varminting, and an additional 30 giga-glorp warranty?”</i>");
	output("\n\n<i>“Maybe later,”</i> you say, stepping further away.");
	output("\n\nFocalor beams. <i>“Of course! And I know you’re a [pc.manWoman], just like me, and I look forward to seeing you as soon as you finish up your other business, [pc.name].”</i>");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}