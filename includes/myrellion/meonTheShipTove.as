import classes.ShittyShips.MSXI;
import classes.ShittyShips.ClydesdaleK7;
import classes.ShittyShips.SledgehammerMkII;
//By Fenfen
/*Myrellion: Tove Ship Trader named Meon.
	Aegis MX-XI
	Steeletech Clydesdale K7
	Reaper Armaments Sledgehammer MkII

Uveto: Mechanic
	Habitation Module
	Auxillary Thrusters (+20 speed)
	Thrust Vectoring System (+20 Agility)
	Capacitor Vampire - req's shields be down. Steals cap. 1x/fite
*/
public function showMeon():void
{
	showName("\nMEON");
	showBust("MEON");
}
public function meonBonus():void
{
	if(flags["MET_MEON"] == undefined) 
	{
		if(!CodexManager.entryUnlocked("Toves")) 
		{
			output("\n\nA squat, bird-like creature stands atop a pile of creates, shouting over the din of hurried Rushers and flaring spaceship engines to proclaim that he’s got the best deals on ships anywhere.");
			addButton(0,"Bird-Creature",meonApproach);
		}
		else 
		{
			output("\n\nA green-feathered Tove makes up for his diminutive height by standing atop a haphazard collection of crates, bellowing that he has the best deals on ships anywhere.");
			addButton(0,"Tove",meonApproach);
		}
	}
	else 
	{
		output("\n\nMeon is at his usual place: pacing back and forth atop a small mountain of crates, shouting the merits of his wares to any who will listen. The green-feathered tilts his head respectfully at the sight of you but refuses to slow his brash hawking in the slightest.");
		addButton(0,"Meon",meonApproach,undefined,"Meon","See what the fast-talking Meon has for sale.");
	}
}

public function meonApproach():void
{
	clearOutput();
	showMeon();
	author("Fenoxo");
	//Approach 1st time
	if(flags["MET_MEON"] == undefined)
	{
		flags["MET_MEON"] = 1;
		output("Interested in seeing what he’s selling, you walk up to four-eyed ");
		if(CodexManager.entryUnlocked("Toves")) output("Tove");
		else output("bird-person");
		output(" and call out a greeting of your own.");
		output("\n\n<i>“Oh, delirious delights! Finally, a sapient of class and intelligence.”</i> He lowers his voice to a more comfortable volume and puffs out what passes for his chest. <i>“You have the good fortune of conversating with Meon the fair, a Tove who is as renowned for his appealing appearance as for the equitability of his dealings, but let’s keep that between you and me. If word got out I was this pretty, I’d be disowned.”</i> He winks. <i>“Seriously though, if my mother finds out I haven’t fleeced you for every credit, I really would be disowned.”</i> This time he winks with three eyes. <i>“But enough about my own personage! Tell me about yourself. Who are you, and which of these fine vessels will you fly home in today?”</i>");
		output("\n\n<i>“[pc.name],”</i> you admin, trying to catch up with the fast-talking alien.");
		output("\n\n<i>“Perfectitastic! You sound like a [pc.manWoman] of means and determination.”</i> Meon smiles somehow, in spite of his beak. <i>“Lay your occular organs upon the beauty of my vessels, and you’ll find yourself grateful to empty your proverbial wallet upon my altar.”</i> He slaps a black crate, hard, and a holographic display full of prices springs up. <i>“I promise. Ask any other Rusher, and they will sing praises to Meon the fair. Now please, explore the wares I have so dutifully assembled for your express pleasure.”</i>");
		if(!CodexManager.entryUnlocked("Toves")) 
		{
			output("\n\nAccording to your Codex, he belongs to a mercantile species known as Toves.");
			CodexManager.unlockEntry("Toves");
		}
	}
	//Repeat approach
	else
	{
		output("You step up to Meon’s mountain of crates with a smile and a wave. <i>“I came back.”</i>");
		output("\n\n<i>“You did!”</i> Meon’s four eyes radiate happiness. <i>“That means you quantifitify for my patented returning customer benefits!”</i> He kicks one of the crates, hard, and a holographic display springs into being, listing his inventory once more. The prices are exactly the same as before. Meon must see the look spreading across your face, because he hastily adds, <i>“Non-cash benefits, of course. Returning customers are imparted with platinum-level service and a warranty that’s good for more than 26 kiloflorps!”</i>");
		output("\n\nUnsure if such a warranty would be good for anything, you nonetheless look through his wares.");
	}
	processTime(2);
	clearMenu();
	var moon:ShittyShip = new MSXI();
	var k7:ShittyShip = new ClydesdaleK7();
	var sledge:ShittyShip = new SledgehammerMkII();
	shopkeep = new Meon();
	addButton(0,"Aegis MS-XI",shipBuyScreen,moon,"Aegis MS-XI",shipCompareString(moon));
	addButton(1,"ClydesdaleK7",shipBuyScreen,k7,"ClydesdaleK7",shipCompareString(k7));
	addButton(2,"Sledgehammr",shipBuyScreen,sledge,"Sledgehammer Mark II",shipCompareString(sledge));
	addButton(14,"Leave",leaveMeon);
}

//Leave
public function leaveMeon():void
{
	clearOutput();
	showMeon();
	author("Fenoxo");
	output("You turn to leave.");
	output("\n\n<i>“Wait!”</i> Meon is stretching his arms out at you, as if his petite limbs could somehow reach you. <i>“What if I threw in complimentary rust-proofing, de-varminting, and an additional 30 giga-glorp warranty?”</i>");
	output("\n\n<i>“Maybe later,”</i> you say, stepping further away.");
	output("\n\nMeon beams. <i>“Of course! Later! I shall eagerly await your return, [pc.name].”</i>");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}