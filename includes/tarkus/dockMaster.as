public function showDockmistress(nude:Boolean = false):void
{
	showBust("RASKVEL_DOCKMASTER" + (nude ? "_NUDE":""));
	showName("\nDOCKMASTER");
}

public function dockmasterBonus():Boolean
{
	if(flags["MET_DOCKMISTRESS"] == undefined)
	{
		output("\n\nIt’s hard to tell who’s in charge among the dozens of Raskvel scampering around the hangar bay - at least until you see the gigantic glowing techno-wrench ominously swaying around. In its wake a couple of the mechanical shorties sprawl away with a yelp, and you can just about make out the call if <i>“Fuck off, you scrappy bastards! This is fer sale! Not fixin’!”</i>");
	}
	else
	{
		output("\n\nThis time when you look for the dockmaster, your eyes are already scanning the horizon for purple and silver. For now she seems to have been left alone, stood next to a giant propped-up wrench and eyeing a dangerously-sparking module. You can practically hear the clicking of her tongue as she yanks out a wire and lets it gutter out into nothing.");
	}
	addButton(0, "Dockmaster", raskvelDockmaster);
	return false;
}


public function raskvelDockmaster(back:Boolean = false):void
{
	clearOutput();
	showDockmistress();
	author("SomeKindofWizard");

	if(back) 
	{
		output("The dockmaster shrugs. <i>“Anything else then?”</i>");
		processTime(1);
	}
	//First Time
	else if(flags["MET_DOCKMISTRESS"] == undefined)
	{		
		output("The dockmaster, who is clearly a 'she,' now that you're getting a closer look at her, lets out a withering sigh, slapping her cheeks in an idle attempt to get her business-face fixed in place. You’re treated to an " + (silly ? "ass-toundingly":"astoundingly") + " curvaceous rask. Her skin is a deep purple that goes a long way to helping with standing out from most of the horny mini-lizards you’ve spotted so far, but by far the most eye-catching of her features is all of the chrome.");
		output("\n\nLimbs laden with silver and gold catch the reflections of far-off arc-welders and sparks, and despite the oil stains that mark her apron, they’re positively spotless. She looks like she’s about to speak up before noticing the eye-fucking you’re giving her, instead opting for giving you a casual turn-around.");
		output("\n\nThis woman has a spectacular ass. From behind you can tell that she’s wearing nothing but her apron and a deep black thong, and with a frame of silver and gold there’s nothing to see but two shiny purple asscheeks larger than your torso. Silvery metal makes its way down her spine where a long segmented mechanical tail is mounted, and her large sweeping ears are similarly capped in chrome. There’s the occasional glowing light on her body, bleeping or chirping in response to some kind of feedback you can only guess the source of.");
		output("\n\n<i>“Like what you see?”</i> she eventually asks with a smirk, leaning on her monstrous wrench. She hefts it without a hint of effort, which is surprising considering her arms seem to be the only parts of her body not modified. <i>“I should hope so! Limbs are easy, and when it comes to the craft, I’m an artisan...”</i>");
		output("\n\nThe dockmaster slaps an open palm on the front-face of her wrench, as though to make a point.");
		processTime(7);
		//[Talk] //Get Educated [Ship] //Repair, Re-tool, Recycle [Flirt] //This. You want this.
	}
	//Repeat
	else
	{
		output("Once you’re close enough to get the dockmaster's attention, she looks you up and down with an easy smile before hopping to her metal feet with a soft clickedy-click. You take the chance to drink her imposing assets while she closes those last few steps.");
		processTime(2);
	}
	//First Time
	if(flags["MET_DOCKMISTRESS"] == undefined)
	{
		flags["MET_DOCKMISTRESS"] = 1;
		output("\n\n<i>“How can I help you, Spacer?”</i> She asks, toes clicking on the ground like a musical beat. <i>“I’m the dockmaster here, and the best shipwright you’ll find in this rust-forsaken scrap-hole.”</i>");
		if(pc.tallness >= 6*12 && pc.biggestCockLength() >= 10) output("\n\nYou’re pretty certain she’s growling at you though, and grinding her plump thighs together. You would appear to be ‘her type’.");
	}
	//Greeting Not Eggnant
	else if(9999 == 9999)
	{
		output("\n\n<i>“Hey Spacer. Managed to keep your ass out of trouble?”</i> She asks, looking you up and down appraisingly. <i>“Or perhaps that’s why you’re here. A few holes need patching up?");
		if(pc.tallness >= 6*12 && pc.biggestCockLength() >= 10) output(" ...Or perhaps just one hole filled?”</i> She adds on with a lusty little growl.");
		else output("”</i>");
	}
	//Was Eggnant
	else
	{
		output("\n\n<i>“Just the spacer I was thinking of... or was earlier when I was busy pushing out some eggs.”</i> She chews on her lip for a few moments with a muted ‘mnf’, before focusing on you properly. <i>“Come for a repeat performance? Or have you managed to explode something, or press a shiny button you shouldn’t have?”</i>");
	}
	raskvelDockmasterMenu();
}

public function dockmasterAppearance():void
{
	clearOutput();
	showDockmistress();
	author("SomeKindofWizard");
	output("The dockmaster is a violet-skinned beauty with mechanically-augmented limbs of silver and gold that far outshine the murky gunmetals of everything else in the dock. A chrome mount runs down her spine and holds up a segmented techno-tail, and glowing metal caps are locked firmly around the tips of her long flapping ears. She's a muscular lady with plenty of curve, and – especially when you consider her compared to most other rasks you’ve seen – happens blessed with a pair of plush jiggly E-cups that fight to escape an oil-stained apron. Her ass is a thing of broad beauty that puts the term ‘heart-shaped’ to shame, especially since it’s framed by silver and gold like all works of art deserve.");
	output("\n\nOnly a little dark makeup accentuates her features, but they’re mostly obscured by the natural bright and flowing feathers of her hair.");
	processTime(1);
	clearMenu();
	addButton(0,"Next",raskvelDockmaster,true);
}

//Talk
public function shipTalkWithDockmaster():void
{
	clearOutput();
	showDockmistress();
	author("SomeKindofWizard");
	output("You ask the dockmaster more about herself.")
	//First Time
	if(flags["DOCKMISTRESS_SHIPTALK"] == undefined)
	{
		flags["DOCKMISTRESS_SHIPTALK"] = 1;
		output("\n\nThe dockmaster adjusts her standing, tail idly sway around with an almost menacing series of metallic clicks. <i>“Well, simple enough. I fix ships primarily; bloody scummy pirates just love taking potshots at people between jerking off and snorting paint.”</i> She pauses, paying a little more careful attention to your attire. <i>“You don’t look like a pirate-y " + pc.mf("lad","lass") + ", so you won’t hear complaints from me.”</i>");
		output("\n\n<i>“I also fit parts onto ships, either basic stuff that we sell here – and fair warning half of it’s been glued together entirely at random – or whatever you bring with you. And trust me, if it’s a really exciting piece of kit? You’ll make my whole shift.”</i>");
		output("\n\nShe rolls her neck idly, looking in the direction of your parked ship. <i>“I can also yank bits out. We don’t faff around with reselling or trading, especially after a few... issues. So you’ll get scrap cost out of us and some other mech-head will worry about the headache.”</i>");
	}//[Ship] //Acquire her services [Flirt] //Acquire her *services*
	//Repeat
	else
	{
		output("\n\nThe dockmaster quirks a brow at you, tapping a foot. <i>“You been drinking, Spacer? I may not like putting names to faces, but I know I’ve told you this all before. I fix broken ships, I fit parts if you bring them to me or buy some basics of of us, and I will remove and scrap crap if you don’t want it anymore... and of course you get the junk money.”</i>");
		if(pc.isDrunk() || pc.isSmashed() || pc.isBuzzed()) output("\n\nWell, okay you <i>have</i> been drinking, but that’s hardly fair.");
		//[Ship] //Acquire her services [Flirt] //Acquire her *services*
	}
	clearMenu();
	addButton(0,"Next",raskvelDockmaster,true);
}

//Repair
//greyed out if your ship is undamaged
public function repairMePleaseDockMistress():void
{
	clearOutput();
	showDockmistress();
	author("SomeKindofWizard");
	var HPPercent:Number = shits["SHIP"].HP()/shits["SHIP"].HPMax();
	var cost:Number = Math.round((shits["SHIP"].HPMax() - shits["SHIP"].HP())/10);
	//Lightly Damaged
	if(HPPercent >= 0.5)
	{
		output("The dockmaster scampers over to a box and pulls out a scanner before following you to your ship. She holds it aloft and takes a picture of your pride and joy, chewing on her lip while she checks the damage. <i>“Not too bad honestly. I can get this done in about an hour. Work well for you?”</i>");
		output("\n\nYou give her an affirmative nod and consult your bank account.");
		output("\n(Repairs will cost " + cost + " credits.)");
		//[Repair] //Show a cost, idfk [Leave] //Maybe repairs can wait
		clearMenu();
		addButton(0,"Repair",raskvelRepair,cost,"Repair","Repair your damaged ship for " + cost + " credits.");
	}
	//Completely shagged
	else
	{
		output("The dockmaster isn’t even halfway to your ship with you before her jaw drops. She grabs your arm and spins you around, pointing at your battle-scarred baby. <i>“What in the rust-bleeding hell did you </i>do<i> to that thing Spacer?! I’m amazed it’s not on fire!”</i>");
		output("\n\nShe swallows down a string of curses, not even bothering to get a scanner in order to appraise the damage. <i>“This isn’t going to be cheap.”</i> She sighs, turning her attention back towards you after mastering herself somewhat. <i>“That damage is downright criminal, and I sure hope the pirates responsible were shunted into a bleeding star.”</i>");
		output("\n\n(Repairs will cost " + cost + " credits.)");
		//[Repair] //Show a cost (probably cap it out at a certain percentage?) [Leave] //Maybe repairs can wait
		clearMenu();
		addButton(0,"Repair",raskvelRepairIntense,cost,"Repair","Repair your damaged ship for " + cost + " credits.");
	}
	processTime(5);
	addButton(4,"Back",backFromRepair);
}

//Repair
public function raskvelRepair(credits:Number):void
{
	clearOutput();
	showDockmistress();
	author("SomeKindofWizard");
	output("She takes your credits with an easy smile, hefting her massive wrench... right before sighing and putting it down before claiming a more sanely-sized tool. <i>“Go relax at the bar or something. I’ll be done quick as you please.”</i>");
	processTime(1);
	pc.credits -= credits;
	clearMenu();
	addButton(0,"Next",raskvelRepair2);
}

public function raskvelRepair2():void
{
	clearOutput();
	showDockmistress();
	author("SomeKindofWizard");
	output("After a little time napping on a sofa at the bar there’s a ping from your codex. You make your way back to your ship to find the faithful machine looking essentially spotless. The dockmaster is just wiping some oil off of her hands as you approach, a little sweatier but somehow those limbs of her are pristine.");
	output("\n\n<i>“Even scrubbed down a few scorch marks and had one of the little-er scamps repaint a few bits. Not bad eh?”</i>");
	output("\n\nNot bad indeed.");
	shits["SHIP"].HP(shits["SHIP"].HPMax());
	processTime(59);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
	//[Leave] //Back to business [Flirt] //She *does* look all sweaty and sexy right now.
}

//Leave
public function backFromRepair():void
{
	clearOutput();
	showDockmistress();
	author("SomeKindofWizard");
	output("With a sigh, you decline for now. It’s only a bit of superficial damage to your ship, and space awaits you. The dockmaster frowns a little, looking between you and the ship before patting you on the " + (pc.tallness >= 60 ? "hip":"shoulder") + ". <i>“If you’re sure Spacer. Make sure to check for any leaks or explode-y things later though.”</i>");
	processTime(2);
	clearMenu();
	addButton(0,"Next",raskvelDockmaster,true);
}

//Repair
public function raskvelRepairIntense(credits:Number):void
{
	clearOutput();
	showDockmistress();
	author("SomeKindofWizard");
	output("The dockmaster accepts your payment without a second thought, whistling for the attention of a few hangers-on. <i>“I get to use the </i>big<i> wrench this time.”</i> She says with no small amount of glee before turning back towards you. <i>“If it were just me this’d take a bloody year. Buuut with a few extra hands? Come back in about three, maybe four hours. We’ll have your baby looking brand new.”</i>");
	output("\n\nShe scowls as a little pink-scaled rask runs by with a bucket over their head, nearly knocking her over. <i>“Probably.”</i>");
	pc.credits -= credits;
	processTime(2);
	clearMenu();
	addButton(0,"Next",raskvelRepair2Intense);
}

public function raskvelRepair2Intense():void
{
	clearOutput();
	showDockmistress();
	output("You’re not the only one sat at the bar waiting for repairs, but more than a few of your fellow spacers and rushers give you a pity clap on the shoulder or a beer after finding out that wreckage belongs to you.");
	output("\n\nBy the time three and a half hours are up you’re basically chewing your own fingers off and fidgeting; the last thing you’d heard from one passing raskvel was that your baby was practically inside-out. At long last there’s a chime from your codex addressed from the dock master.");
	output("\n\nWhen you return to your ship it looks practically brand new. The dockmaster is sat heavily on a crate, dutifully making sure her mechanical limbs are shiny and oil-free. Her feathery hair is a little wilted and stuck to hear head by a sheen of sweat, but otherwise she seems satisfied. <i>“She’s as good as new, but perhaps you could avoid using it to crack open space stations? Heck, it even has guns. I bet they’d work way better than the nose, because it sure as rust looks like you took it through the ringer.”</i>");
	output("\n\nYou roll your eyes, waiting for the violet-skinned miracle worker to get her sass finished.");
	shits["SHIP"].HP(shits["SHIP"].HPMax());
	processTime(165);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
	//output("\n\n[Leave] //Space awaits [Flirt] //She *does* look all sweaty and sexy right now.");
}

//Fits
//Greyed out if there’re no empty modules
//Show fitting ship menu
public function dockmasterAddonsShop():void
{
	clearOutput();
	showDockmistress();
	shopkeep = new Dockmaster();
	output("<i>“Alright, let me see what you’ve got. We charge a standard rate for the hookup.”</i>\n\n");
	shopkeep.inventory.push(new CapacitorBank());
	shopkeep.inventory.push(new MGun());
	shopkeep.inventory.push(new MissileBay());
	shopkeep.inventory.push(new CoilCannon());
	//shopkeep.inventory.push(new LCannon());
	//shopkeep.inventory.push(new ThermalProjector());
	buyShipFitItem();
}

//Fen note: I cut dis stuff because of how the shop code works. It was easier to just dump it to the generic "back" approach.
//[Leave]
//Choose no fitting
//<i>“Really?”</i> The dockmaster sighs, tapping her wrench idly. <i>“Well, I can hardly force you to upgrade your ship, but I </i>can<i> recommend it. Unused space is waste!”</i>
//She pauses and snatches a drink from a passing raskvel, grinning faintly at you before indicating the rest of the hangar. <i>“I’m still on shift for a little while if you change your mind and come back though.”</i>
//[Leave]

public function raskvelDockmasterMenu():void
{
	clearMenu();
	addButton(0,"About You?",shipTalkWithDockmaster,undefined,"About You?","Ask her more about who she is and what she does around here.");
	addButton(1,"Appearance",dockmasterAppearance,undefined,"Appearance","Take a closer look at her.");
	if(shits["SHIP"].HP() < shits["SHIP"].HPMax()) addButton(5,"Repair",repairMePleaseDockMistress,undefined,"Repair","Inquire about having your ship repaired. The mechanic back on Tavros Station might do it for free, but the raskvel will do it fast - if you're comfortable paying.");
	else addDisabledButton(5,"Repair","Repair","Your ship is not damaged.");
	addButton(6,"Ship Upgrades",dockmasterAddonsShop,undefined,"Ship Upgrades","Purchase weapons and upgrade modules for your ship.");
	addButton(7,"Uninstall",uninstallRaskStyle,undefined,"Uninstall","Uninstall and sell an upgrade or weapon you longer wish to keep.");
	addButton(10,"Buy A Ship",buyAShipFromTrashRat,undefined,"Buy A Ship","See what the raskvel have for sale.");
	addButton(14,"Leave",mainGameMenu);
}

//Remove and Sell
public function uninstallRaskStyle():void
{
	clearOutput();
	showDockmistress();
	author("SomeKindofWizard");
	shopkeep = new Dockmaster();
	output("<i>“I do enjoy taking stuff out. I get to use my big girl here.”</i> She fondly strokes her wrench, looking over your ship. <i>“What do you need?”</i>\n\n");
	//Ship part removal menu
	unfitShipItem();
}

public function buyAShipFromTrashRat():void
{
	clearOutput();
	showDockmistress();
	author("Fenoxo");
	output("You ask her if they have any ships for sale... speficially ships you would actually want. Anything as rusty as the <b>Nova</b> itself is bound to be a hard no.");
	output("\n\nThe dockmaster brushes a sweep of cyan hair aside in annoyance. <i>“’Course we got the goods. Though you’ll have to trade in whatever you’re flying for it. This hangar’s too tight for anybody to use it as a glorified garage, I don’t care how shiny their scales.”</i>");
	processTime(2);
	clearMenu();
	//Initialize all ships, pass to tooltip generating func.
	var moon:ShittyShip = new MoondastGruss();
	shopkeep = new Dockmaster();
	addButton(0,"M.Gruss",shipBuyScreen,moon,"M.Gruss",shipCompareString(moon));
	//addButton(1,"Colt XLR",shipBuyScreen,coltXLR,"Colt XLR",shipCompareString(coltXLR));
	//addButton(2,"Spearhead SS",shipBuyScreen,spearhead,"Spearhead SS",shipCompareString(spearhead));
	addButton(14,"Back",raskvelDockmaster,true);
}