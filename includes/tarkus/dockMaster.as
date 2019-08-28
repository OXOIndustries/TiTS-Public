import classes.ShittyShips.ShittyShipGear.GunTurrets.*;
import classes.ShittyShips.ShittyShipGear.Upgrades.*;
public function showDockmistress(nude:Boolean = false):void
{
	showBust("RASKVEL_DOCKMASTER" + (nude ? "_NUDE":""));
	showName("\nDOCKMASTER");
}

public function dockmasterBonus():Boolean
{
	if(flags["MET_DOCKMISTRESS"] == undefined)
	{
		output("\n\nIt’s hard to tell who’s in charge among the dozens of Raskvel scampering around the hangar bay - at least until you see the gigantic glowing techno-wrench ominously swaying around. In its wake a couple of the mechanical shorties sprawl away with a yelp, and you can just about make out the call of: <i>“Fuck off, you scrappy bastards! This is fer sale! Not fixin’!”</i>");
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
	
	//Been 5+ days since impregnated her?
	if(flags["DOCKMASTER_PREGNANT"] != undefined && flags["DOCKMASTER_PREGNANT"] + (60*24*5) < GetGameTimestamp())
	{
		//If it hasnt been 10+, do post-birth talk.
		if(flags["DOCKMASTER_PREGNANT"] + (60*24*11) > GetGameTimestamp())
		{
			dockMasterEggnancyProc();
			return;
		}
		//Apply preg stats whether PC finds out or not:
		StatTracking.track("pregnancy/raskvel sired/total",flags["DOCKMASTER_EGGS"]);
		StatTracking.track("pregnancy/total sired",flags["DOCKMASTER_EGGS"]);
		flags["DOCKMASTER_EGGS"] = undefined;
		flags["DOCKMASTER_PREGNANT"] = undefined;
		IncrementFlag("DOCKMASTER_EGGOES");
	}

	if(back) 
	{
		output("The dockmaster shrugs. <i>“Anything else then?”</i>");
		processTime(1);
	}
	//First Time
	else if(flags["MET_DOCKMISTRESS"] == undefined)
	{		
		output("The dockmaster, who is clearly a ‘she,’ now that you’re getting a closer look at her, lets out a withering sigh, slapping her cheeks in an idle attempt to get her business-face fixed in place. You’re treated to an " + (silly ? "ass-toundingly":"astoundingly") + " curvaceous rask. Her skin is a deep purple that goes a long way to helping with standing out from most of the horny mini-lizards you’ve spotted so far, but by far the most eye-catching of her features is all of the chrome.");
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
		output("Once you’re close enough to get the dockmaster’s attention, she looks you up and down with an easy smile before hopping to her metal feet with a soft clickedy-click. You take the chance to drink her imposing assets while she closes those last few steps.");
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
	else if(flags["DOCKMASTER_EGGOES"] == undefined)
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
	output("The dockmaster is a violet-skinned beauty with mechanically-augmented limbs of silver and gold that far outshine the murky gunmetals of everything else in the dock. A chrome mount runs down her spine and holds up a segmented techno-tail, and glowing metal caps are locked firmly around the tips of her long flapping ears. She’s a muscular lady with plenty of curve, and – especially when you consider her compared to most other rasks you’ve seen – happens blessed with a pair of plush jiggly E-cups that fight to escape an oil-stained apron. Her ass is a thing of broad beauty that puts the term ‘heart-shaped’ to shame, especially since it’s framed by silver and gold like all works of art deserve.");
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
		output("\n\nThe dockmaster quirks a brow at you, tapping a foot. <i>“You been drinking, Spacer? I may not like putting names to faces, but I know I’ve told you this all before. I fix broken ships, I fit parts if you bring them to me or buy some basics of us, and I will remove and scrap crap if you don’t want it anymore... and of course you get the junk money.”</i>");
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
	if(pc.lust() >= 33) addButton(2,"Flirt",flirtWivRaskDock,true,"Flirt","She <b>does</b> look all sweaty and sexy right now.");
	else addDisabledButton(2,"Flirt","Flirt","You aren’t horny enough for this.");
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
	if(pc.lust() >= 33) addButton(2,"Flirt",flirtWivRaskDock,true,"Flirt","She <b>does</b> look all sweaty and sexy right now.");
	else addDisabledButton(2,"Flirt","Flirt","You aren’t horny enough for this.");
	//output("\n\n[Leave] //Space awaits [Flirt] //She *does* look all sweaty and sexy right now.");
}

//Fits
//Greyed out if there’re no empty modules
//Show fitting ship menu
public function dockmasterAddonsShop():void
{
	clearOutput();
	showDockmistress();
	shopkeep = chars["DOCKMASTER"];
	shopkeep.inventory = [];
	output("<i>“Alright, let me see what you’ve got. We charge a standard rate for the hookup.”</i>\n\n");
	shopkeep.inventory.push(new CapacitorBank());
	shopkeep.inventory.push(new ShieldUpgrade());
	shopkeep.inventory.push(new TunedEmitters());
	shopkeep.inventory.push(new RedundantPlating());
	shopkeep.inventory.push(new HeavyArmor());
	shopkeep.inventory.push(new SensorSuite());
	shopkeep.inventory.push(new HardenedSystems());
	shopkeep.inventory.push(new PowerCoreTuner());

	//shopkeep.inventory.push(new LCannon());
	//shopkeep.inventory.push(new ThermalProjector());
	buyShipFitItem();
}

public function dockmasterWeaponShop():void
{
	clearOutput();
	showDockmistress();
	shopkeep = chars["DOCKMASTER"];
	shopkeep.inventory = [];
	output("<i>“Alright, let me see what you’ve got. We charge a standard rate for the hookup.”</i>\n\n");
	shopkeep.inventory.push(new CoilCannon());
	shopkeep.inventory.push(new EMTurret());
	shopkeep.inventory.push(new MGun());
	shopkeep.inventory.push(new MTurret());
	shopkeep.inventory.push(new MissileBay());
	shopkeep.inventory.push(new MissileTurret());
	shopkeep.inventory.push(new LTurret());
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
	if(pc.hasKeyItem("Panties - The Dockmaster's - Black-buttoned thong."))
	{
		chars["DOCKMASTER"].sellMarkup = 0.95;
		chars["DOCKMASTER"].buyMarkdown = 0.70;
	}
	
	clearMenu();
	addButton(0,"About You?",shipTalkWithDockmaster,undefined,"About You?","Ask her more about who she is and what she does around here.");
	addButton(1,"Appearance",dockmasterAppearance,undefined,"Appearance","Take a closer look at her.");
	if(pc.lust() >= 33) addButton(2,"Flirt",flirtWivRaskDock,false,"Flirt","She does look like she could use a break from all the hard work...");
	else addDisabledButton(2,"Flirt","Flirt","You aren’t horny enough for this.");
	if(shits["SHIP"].HP() < shits["SHIP"].HPMax()) addButton(4,"Repair",repairMePleaseDockMistress,undefined,"Repair","Inquire about having your ship repaired. The mechanic back on Tavros Station might do it for free, but the raskvel will do it fast - if you’re comfortable paying.");
	else addDisabledButton(4,"Repair","Repair","Your ship is not damaged.");
	addButton(5,"Ship Weapons",dockmasterWeaponShop,undefined,"Ship Weapons","Purchase weapons for your ship.");
	addButton(6,"Ship Upgrades",dockmasterAddonsShop,undefined,"Ship Upgrades","Purchase upgrade modules for your ship.");
	addButton(7,"Uninstall",uninstallRaskStyle,undefined,"Uninstall","Uninstall and sell an upgrade or weapon you no longer wish to keep.");
	addButton(10,"Buy A Ship",buyAShipFromTrashRat,undefined,"Buy A Ship","See what the raskvel have for sale.");
	addButton(14,"Leave",mainGameMenu);
}

//Remove and Sell
public function uninstallRaskStyle():void
{
	clearOutput();
	showDockmistress();
	author("SomeKindofWizard");
	shopkeep = chars["DOCKMASTER"];
	shopkeep.inventory = [];
	output("<i>“I do enjoy taking stuff out. I get to use my big girl here.”</i> She fondly strokes her wrench, looking over your ship. <i>“What do you need?”</i>\n\n");
	//Ship part removal menu
	unfitShipItem();
}

public function buyAShipFromTrashRat(back:Boolean = false):void
{
	clearOutput();
	showDockmistress();
	author("Fenoxo");
	if(!back)
	{
		output("You ask her if they have any ships for sale... specifically ships you would actually want. Anything as rusty as the <b>Nova</b> itself is bound to be a hard no.");
		output("\n\nThe dockmaster brushes a sweep of cyan hair aside in annoyance. <i>“‘Course we got the goods. Though you’ll have to trade in whatever you’re flying for it. This hangar’s too tight for anybody to use it as a glorified garage, I don’t care how shiny their scales.”</i>");
		processTime(2);
	}
	else
	{
		output("What ship are you looking to trade for?");
	}
	clearMenu();
	shopkeep = chars["DOCKMASTER"];
	shopkeep.inventory = [];
	//Initialize all ships, pass to tooltip generating func.
	var ships:Array = [];
	ships.push(["M.Gruss", "Moondast Gruss", new MoondastGruss()]);
	for(var i:int = 0; i < ships.length; i++)
	{
		addShipCompareButton(i,shits["SHIP"],ships[i][2],ships[i][0],shipBuyScreen,ships[i][2],ships[i][1]);
	}
	addButton(13,"Current Ship",shipStatistics,buyAShipFromTrashRatBack,"Current Ship Stats","Look over your ship and its equipped modules.");
	addButton(14,"Back",raskvelDockmaster,true);
}
public function buyAShipFromTrashRatBack():void { return buyAShipFromTrashRat(true); }

//Flirt
public function flirtWivRaskDock(repaired:Boolean = false):void
{
	clearOutput();
	showDockmistress();
	author("SomeKindofWizard");
	var x:int = pc.cockThatFits(800);
	if(x < 0 && !pc.hasVagina())
	{
		if(pc.hasCock()) output("With a wicked smirk, the dockmaster brazenly ogles your titan-sized bulge. <i>“Spacer, I’m all for climbing mountains, but... damn.”</i> She whistles, stalking in a slow circle around you. <i>“I have hips like a cargoship, and that’d split me in half.”</i> Brushing back her hair, she sighs in annoyance. <i>“There’s nothing I’d like more than to sample a heaping slice of off-worlder pie, but it’s just not physically possible. Sorry, hun.”</i>");
		else 
		{
			output("Stalking forward like a hunting animal, the dockmaster closes half the distance, then wrinkles her nose in disappointment. <i>“You don’t have any genitals, do you?”</i> She rubs her cheeks in annoyance. <i>“Nothing fun between the thighs. Not even a rask-sized dick for me to play with. No,”</i> she pauses, <i>“we’ll be keeping things professional for the time being... until you come back with something I can enjoy.”</i>");
		}
		raskvelDockmasterMenu();
		return;
	}
	//Big Dommes with Dicks
	if(x >= 0 && pc.tallness >= 6*12 && pc.cocks[x].cLength() >= 12)
	{
		//Repaired Ship
		if(repaired)
		{
			output("With a wicked smirk you drop a hand onto her head, rubbing the point where ear meets skull until she’s shivering at you. <i>“What’s this Spacer? I don’t remember you paying for any extra business.”</i> Her eyes descend on your bulge " + (silly ? "and you can all but hear the OwO in her voice":"with a hungry growl") + ". You roughly sink the other hand into her cleavage and fondle a tit until the dark cap of a nipple is hard against your palm.");
			output("\n\nJust the process of working hard on your ship has her smelling like a wanton, lusty fuck, and now you can practically hear her cunt dripping with anticipation. You take the giant wrench from her hands and set it down by a series of random crates before scooping her up into your arms. She laughs loudly and grinds herself against you as she’s squeezed out of her apron, burying her face into your neck while you carry her up to your ship.");
			//[Next] //jump to mating press
		}
		//Didn’t Repair
		else
		{
			output("Grinning, you shake your head at the prospect of her mechanical expertise. Her eyes are already making their way to your crotch before you close the final distance, mashing her face into it until she’s drunk on the scent of a horny breeder. <i>“O-oh. Oh yeah that’s the stuff...”</i> She says, looking up at you with naked desire. <i>“Take me, you glorious sexy giant. Fill me with eggs. Big, thick eggs.”</i>");
			//[Next] //jump to mating press
		}
	}
	//Other
	else
	{
		if(repaired)
		{
			output("She looks utterly captivating, and the scent of sweat and oil clinging to her reminds you more of the bedroom than the workplace. She seems to catch the look in your eyes before turning her attention to your more sexual assets. <i>“What’s this, Spacer? Looking to kill a few extra hours with me?”</i>");
			output("\n\nThe purple rask’s flesh and scales are so shiny it does an injustice to her mechanical limbs, and she takes one of your hands before sinking it into a lush forgiving tit. <i>“Let’s go to your bed, I think we can work something out.”</i>");
			//[Next] //Get fucked dick or dickless
		}
		//Didn’t Repair
		else
		{
			output("Well, she may not have been dropping all of the signs on you, but this curvy dockmaster has a body that’s built to fuck. And you’re sure that she could do all manner of wonderful things to you.");
			output("\n\nHer eyes give you the once-over before her lips break into a confident smirk. <i>“Feeling a little needy, Spacer? Can’t say I blame you...”</i> She looks around the hangar, humming pensively. <i>“Ah to rust with it. You’ve got a bed on that ship, don’t ’cha? How about I show you how a real woman breaks it in.”</i>");
		}
		//[Next] //Get fucked dick or dickless
	}
	clearMenu();
	addButton(0,"Next",sexRouterForDockmaster);
}

//Sex
public function sexRouterForDockmaster():void
{
	var scenes:Array = [];
	//If has a cock that fits
	var x:int = pc.cockThatFits(800); 
	if(x >= 0)
	{
		if(pc.tallness >= 6*12 && pc.cocks[x].cLength() >= 12) scenes.push(matingPressAndPinfuckTheDockmastah);
		else scenes.push(getFuckedWivADick); 
	}
	if(pc.hasVagina() && scenes.length == 0) scenes.push(dicklessTakingTail);

	if(scenes.length == 0) mainGameMenu();
	else scenes[rand(scenes.length)]();
}

//Pin & Fuck
//Big dommes get to mating press this woman.
public function matingPressAndPinfuckTheDockmastah():void
{
	clearOutput();
	showDockmistress(true);
	author("SomeKindofWizard");
	var x:int = pc.cockThatFits(800);
	if(x < 0) x = pc.smallestCockIndex();
	output("This horny, curvy, bottom-heavy shortstack seems utterly thrilled that you can haul her around like luggage. Her hands scrabble at your gear in a desperate attempt to undress you before you reach the threshold, but you’ve got her basically at your mercy.");
	output("\n\nShe lets out an uncharacteristically high-pitched yelp when you throw her onto the bed, before rolling onto her front for you. She tugs off her apron while you’re getting yourself appropriately nude and treats you to a most delightful sight. Her nipples are broad, hard nubs of a deeper purple than the rest of her flushed violet flesh. The dockmaster’s eyes immediately snap to your [pc.cock " + x + "], drinking you in like she’s dying of thirst.");
	output("\n\nThere’s a dark black thong that’s doing little to hide her soaking twat, and your bedroom immediately smells like fertile breed-slut. When she shivers and flicks a little button, the dark fabric all but flies off towards you. You catch the sodden material and grind it against your cock until it’s the perfect blend of musk and pussy, stalking towards your shivering prize. <i>“Oh damn, Spacer. Look at you. You’re perfect. Bloody perfect...”</i> She gawps in open admiration, squeezing her own tits so hard you can actually see moisture beading on her nips.");
	output("\n\nAs tempting as it would be to cram your [pc.cock " + x + "] into those quivering canyons, her juicy snatch is what you’re really after right now. You climb up onto the bed and cram the moist panties right into her mouth, earning a gurgle and a groan out of her before you slip your hands beneath her.");
	output("\n\nHer gasp is muffled when you flip her over, but she quickly lifts her ass and reaches back to spread her cheeks wide for you. Gods it’s a lot of ass. There’s a nervous wink from her ring, but your true destination awaits just a little further down, framed by twin clits. Her tail clicks from side-to-side a few times before settling for going limp and hanging off of the bed out of the way, and your hands give her an experimental stroke from clit-to-clit. Her response is a whorish moan granted extra depth by a mouthful of smut-scented thong.");
	output("\n\nOh, and a great big squirt of juices that actually manages to hit you in the abdomen. Apparently this Raskvel was made extra juicy – presumably down to all of the egg laying – and perfect for entry. You flop your beefy [pc.cockType " + x + "] prick right down into her monumental ass-cleavage before grinding your tip against her bottom – or top considering you’ve got this bitch on her front – clit until she’s gasping as the sensitive pleasure-sensors are set to sparking. Again you’re tempted to sink your whole fist into her, just because you’re sure she could take you without an issue... but that breeder-scent is so deep in your nostrils now that your brain’s become nothing but need and fuck.");
	output("\n\nThe dockmaster muffles something that sounds like ‘what are you waiting for?’... or perhaps ‘press me into the floor’. Maybe both, whatever. Indecision grips you for a moment before you decide to let your hormones take the wheel. You sink a hand into her slowly, grinning as she drenches you up to the wrist, bouncing her hips and squeezing hard enough to nearly crush you. Her grip on those titanic asscheeks slips, obscuring you from view and encasing you in heat while you fist-fuck her gushing cunt. Your other hand releases its grip on the base of your dick, instead dishing out a series of spanks that send her tail twitching and her ears flapping. Her epic rear jiggles wildly before she finally gets a grip on it again and spreads wide.");

	output("\n\nWhen you retrieve your hand it’s perfectly covered in breeder-lube, and you lather your length from crown-to-base. The dockmaster is a shuddering, shivering wreck and you’re pretty sure she’s already riding out a wave of miniature orgasms. You throw yourself onto her and push her right down into the mattress, prick flush with the scalding depths of her egg-maker. She gurgles for you again at being savagely ridden down into the bed, humping against you in a desperate attempt to get you inside of her. Still, the moment isn’t <i>quite</i> perfect. Even after coating your cock in Rasky juices there’s plenty of lube left, and so you pluck out the spit-pre-and-cunt-soaked thong from her mouth and replace that empty space with your glazed digits. She sucks on you dutifully, long alien tongue wrapping around your fingers in order to explore her own taste.");
	pc.cockChange();

	output("\n\nHer groans vibrate right into you when you finally hilt yourself in her... well, you say finally; it’s probably only been a minute since you’ve thrown her to the bed, but that’s already a minute too long. It doesn’t matter <i>how</i> large you are; she swallows you to the hilt, gripping her asscheeks so hard that her knuckles turn pink. Her cheeks concave from sucking on your fingers while you immediately mash your length into not one, but two g-spots judging by the way it makes her moan and thrash.");
	output("\n\nYour whole weight is thrown onto her in a brutal mating press, not stopping until you’re hilted hard enough to grind your flesh into her clits. You reach around with your other hand and roughly grip a tit hard enough to make her breasts squirt in time with her pussy, and she wrings your dick for dear life in return. Her great robotic tail slaps the side of the bed helplessly at the bliss washing over her mind...");
	output("\n\nThen you start moving properly.");
	output("\n\nHer gasps are choked off around a gobful of finger, and you hurriedly turn your hips into a brutal blur. Her ass jiggles and quakes as you clap down against her with enough force to make your reinforced bed creak and squeak dangerously. Her pussy has the perfect give, gushing and sticking to you with every backstroke in a desperate attempt to keep you buried in her, while turning into a voice on the downward hilt so that you’re being wrung and milked for your precious jizz.");
	output("\n\nIt isn’t long before your [pc.cumFlavor] cum is starting to mix with your pre, turned to a thick foamy ring around your [pc.sheath " + x + "] that’s thoroughly mixed in salty-sweet rask-juice. She slaps her hand down on the mattress, releasing her ass for a moment when you pinch her nipple and give it a rough twist.");
	output("\n\nShe doesn’t let go for long though once it becomes apparent that her callipygean bootie is stealing precious inches of penetration away, alerted by " + (silly ? "the clap of her ass cheeks":"a sudden lack of womb-crushing depth") + ". You only wait for the barest seconds your frayed will can afford, far too devoted to filling this bitch with seed until she’s swollen and pregnant. At some point she’s managed to such your fingers clean, but all that means is that you’ve got an extra limb to milk her tits with. There’s nowhere for the rask-milk to go but into the mattress, but it doesn’t bother you when you’re treated to the sounds of an un-muffled mouth.");
	output("\n\n<i>“Oh stars and rust, Spacer! Fuck! You’re an animal, a bloody brutal beast! Fill me! Take me! Milk me!”</i> She cries, bucking against you as hard as she can... which considering she’s trapped, isn’t especially hard. Luckily the dockmaster bends well at the waist, giving you enough space to wrap the entirety of her breasts up in your hands and knead them hard enough to squirt out thick gouts of milk. <i>“Cumming! Oh yes! Cumming so...”</i>");
	output("\n\nThe dockmaster trails off, eyes rolling back into her head and tongue lolling out far enough to taste her own pool of milk. Her orgasming cunt assaults your length with squeezes and teases completely out of rhythm with your thrusts, adding a boobgasm to her list of bacchanal delights. You’re treating her like a breedslut, crushing her into the bed and wringing every drop of milk and girl-cum out of her that you can. She only rides out the rough treatment harder, practically blossoming around your dick in anticipation of a womb full of baby-batter.");
	output("\n\nFurther adding to your domination of this curvaceous breed-slut, you bite down on the base of one flapping ear and give her one final brutal thrust. Her whole body goes stiff – but for the lashing of her mechanical tail – before turning limp. Your prostate feels like a thick weight full of molten iron, tightening up in you while every muscle works in tandem to fire away.");
	output("\n\nAnd fire away you do; the first thick rope of cum to come blasting out of your [pc.cockHead " + x + "] is hard enough to actually sting, immediately filling her up. ");
	var cumQ:Number = pc.cumQ();
	//Small cummies:
	if(cumQ < 1000) output("That first vigorous rush of seed just about wipes you out, but you make sure to remain hilted in her now that she’s got a nice [pc.cumColor] womb-plastering.");
	//medium cummies:
	else if(cumQ < 3000) output("You don’t stop there either; her stomach visibly swells after the next few loads jet out, going beyond filling her and causing a backlash of your own [pc.cumFlavor] seed to squirt out around a deluge of her own raskvel girlcum.");
	//big or hyper cummies: 
	else output("Of course, you’re a [pc.manWoman] of prodigious production. You don’t just stop at filling her up. No, you’ve got her trapped under you, and there’s so much seed passing through your cock that it’s swelling her stomach up until she already looks thoroughly eggnant. Cum pools out in thick waves around the seal of your cock – thick, despite being thinned out by raskvel girlcum – but you don’t unhilt until you’re properly finished.");
	output("\n\nOnce you finally pull out, the dockmaster is whimpering and moaning. She pulls your hands off of her drained tits and kisses them in admiration, looking over her shoulder with eyes full of worship for your titanic, dominant form. <i>“So good. Gonna egg so hard. Soooo hard...”</i>");
	output("\n\nYou stagger back, dropping onto a chair beside your desk while the dockmaster strokes her tummy and purrs like an animal. Now that’s a well-fucked slut. Now that the breed-need is out of your system, you have plenty of time to admire her beautiful form while she’s shakily getting out of your sticky bed.");
	output("\n\nIt takes her a little while to find her ruined thong, but apparently she doesn’t mind all that much. She reaches into an apron pocket, pulls out a vibrator, and sinks it into her creamy pussy before buttoning her thong back on. Damn, she’s a thirsty girl. <i>“Catch you later, Spacer.”</i> She eventually manages, before sashaying out and rubbing down her sweaty tits.");
	moveTo("SHIP INTERIOR");
	//[Next] //back to sat-on-your-ship in dock.
	processTime(30);
	new RaskvelFemale().loadInCunt(pc,0);
	impregnateDockmasterChance();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Get Fucked (Has Dick)
//If you’re short and subby she’ll ride you into the ground cowgirl style.
public function getFuckedWivADick():void
{
	clearOutput();
	showDockmistress(true);
	moveTo("SHIP INTERIOR");
	var x:int = pc.cockThatFits(800);
	if(x < 0) x = pc.smallestCockIndex();
	output("Your journey back up to your ship – and more importantly your bedroom – is made difficult by liberty of the strong hand gripping and squeezing your ass. Her tail clicks noisily against the floor and walls; if not for the fact that it’s thrashing around in anticipation, you would have guessed she was sounding out your corridor for faults.");
	output("\n\nYou barely get through the threshold before she’s shoving you onto the bed and helping tear you out of your equipment, grinning wickedly at what she reveals. ");
	if(pc.cocks[x].cLength() < 6) output("A cute little [pc.cockType " + x + "] cock, already aching with need and drooling a line of precum.");
	else if(pc.cocks[x].cLength() < 11) output("A modest [pc.cockType " + x + "] cock, whose head already glistens with [pc.cumFlavor] goodness.");
	else if(pc.cocks[x].cLength() < 18) output("Your beastly [pc.cockType " + x + "] cock, already plenty to give this Raskvel something to think about.");
	else output("An absolute monster that would take a feat of strength to ride right down to the hilt.");
	output(" Her soft laugh doesn’t do much to disrupt how hard you’ve already gotten, and judging by the glistening sheen already developing on the fleshy portions of her thighs she’s more than ready for you.");
	output("\n\nIt comes as no surprise when she throws off her tight engineering apron, throws herself onto the bed with you, and drags your hands up into her bouncy cleavage. There’s the faintest squirt of milk against your palms while she’s wiggling her hips, trying to get herself properly lined up with your [pc.cock " + x + "].");
	output("\n\n<i>“There, that’ll about do it.”</i> She sighs, pushing herself harder into you. There’s yet another soft click-clack from her tail before it wraps possessively around " + (pc.legCount > 1 ? "one of your [pc.legs]":"your [pc.leg]") + ", and you become intensely aware of the sultry heat and moisture that’s now dripping from a soaking gash and right onto your crotch. With your hands more-or-less locked in place at her tits, she throws back her hair, unbuttons and removes a thong before it can disappear into her cunt, and pushes it right into your mouth.");
	output("\n\nYour " + pc.mf("horny","sultry") + " moans are immediately muffled by the sopping fabric, and the scent of a needy breeder assaults your nostrils until there’s blood pounding in your ears with anticipation. Now within that painfully thin fabric separating your bodies from one-another she starts to grind against your shaft with a wicked smile. It’s possible to feel not just her juicy pussy pressing against you, but both clits as she grinds you from end to end. If your hands weren’t otherwise busy tweaking and pinching her nipples, you’d love to give those twinned pleasure-buttons a tweak.");
	output("\n\nInstead her grinding just gets her closer and closer to sneaking your [pc.cockHead " + x + "] into her. There’s yet another affirmative squeeze from her tail, and when she lifts her hips again there’re strands of the thick girly lubricant still clinging to your body. <i>“You look real good down there, Spacer. You’re gonna let me milk a ton of cum out of you, right?”</i> Despite the slow raise of her eyebrow, it doesn’t sound much like a question; if anything the touch of a threatening growl in her throat has you absolutely shivering with desire. Another squeeze of her tits catches you off guard by blasting you in the face with twin squirts, adding to the mess her underwear has already made of you.");
	output("\n\nWith one hand pushing down hard on your [pc.chest], the other sneaks down to take a proper hold of your [pc.cock " + x + "]. ");
	//hyperdicks:
	if(pc.cocks[x].cLength() >= 20) output("She has to literally stand up on your bed a moment later on realizing just how improbably large your beefy prick is, but soon enough you’re pulsing beneath her and flush with the lips of her twat. ");
	output("Scalding hot breeder-liquids trickle down your shaft, pooling " + (pc.balls > 1 ? "atop your balls":"between your thighs") + ". At last she drops herself down on you, chewing her bottom lip and growling more like a predator. Heat and ecstasy suffuse your dick, and the slicked-up dockmaster’s horny twat doesn’t stop until she’s slamming you down into the bed, ass jiggling furiously.");
	output("\n\nThe wind is nearly crushed out of you; it’s not just a fat ass, this rask is a lot of metal and muscle to boot. Her own mouth hangs open in wanton delight, and yours likely would be too if not for the fact that you’ve been gagged with her underwear. The longer she stays bottomed out on you, the harder it gets to breathe until there are sparks beginning to build up in the corners of your vision. When she finally lifts her hips again it’s accompanied by the lurid squelch of juices being stirred up inside her. If not for the piston-tight grip her cunt keeps around your prick, you’re sure those juices would now be painting you.");
	output("\n\nThinking about her egg-laying body’s special penchant for producing all the lubrication in the world is actually pretty difficult, you’re much too glad to be drawing in air now that she’s holding herself up.");
	output("\n\nTo a degree at least; you can only breathe through your nose, ensuring you’re going to be mired in the scent of fucking for hours to come later. You try and hump upwards into her, gratified to hear that noisily slap of flesh-on-flesh and feel the hard button of her topmost clit mash into your sticky abdomen. Your effort earns you an appreciative growl, but she quickly pins you right down into the mattress with her next thrust.");
	output("\n\nOnce again your heart is hammering and blood is rushing through your extremities once her callipygean bulk is squeezing the air right out of you, and you’re distinctly aware of her tail’s grip on your leg growing a little tighter in time. It takes a few moments to realize she’s punishing you; your hands are still latched onto her luscious tits, but they’re just resting there; a true crime.");
	output("\n\nThe moment your hands start milking her breasts – directly onto your face and chest with little regard for the mess – she relieves you of the pressure and lifts up again. You’re not left wanting for long, either. You can feel well-trained walls hug and milk your dick for dear life, and she starts to ride you properly.");
	output("\n\nThere’s a gentle clink-clank entirely at odds with her animalistic humping and every time she bounces atop you, you squeeze her breasts and twist her nipples until she’s basically a faucet from both ends. The dark caps of her nipples grow darker as your touch gets them extra sensitive, but her bucking body is nearly pulling them out of your grasp and forcing you to hold on tighter. You try to get your knees up a little to arrest that downwards momentum – certain that she’s going to bruise your hips – but your legs are quickly smashed back down into the bed’s embrace.");
	output("\n\nHer growl isn’t quite threatening, but it doesn’t feel safe to try and wrest control away from the dominant, fuck-hungry lizard. She speeds up her thrusting, moaning when you manage to grind your shaft against a few sensitive spots. With one hand still " + (pc.biggestTitSize() >= 1 ? "on your chest":"between your breasts") + " the other travels down in order to fan her clit, and despite the vacuum-tight seal between her cunt and cock there’s still a squirt of sticky goodness getting out. When you try to spit her panties from your mouth in order to moan along she pushes it right back down with fingers stained by her own juices. <i>“Hhah... not, yet... Spacer.”</i>");

	output("\n\nWhen she pushes her feathery hair back again it leaves a smear of sexual liquids on her, but she doesn’t appear overly concerned. The base of your dick is covered in a foamy ring of churned up precum and the copious secretions of her needy breed-hole. Heat begins to build up in your prostate, accompanied by a weighty tightness");
	if(pc.balls > 0) output(" (only outstripped by the increasing heft of your ball" + (pc.balls > 1 ? "s":""));
	output(" that heralds the impending end.");
	output("\n\nThe dockmaster looks close to completion too; the purple of her skin is deep and flushed, and drool drips from the tip of a long coiling tongue. Her tail has ceased its rough grip on your leg in order to thrash about wildly from the mixed signals assaulting it, and every time her hips slam down there’s a bounce to her chest that forces out yet more milk.");
	output("\n\nEven prepared as you are, it seems only right to hold out until she’s cumming and properly-flowered to take as much of your potent seed as possible.");
	output("\n\nThe only downside is that the dockmaster appears to be waiting for you to give in first, alternating between brutal bed-shaking thrusts to slow rides accompanied by the rolling of her broad broodmare hips. She squeezes you tightly with her thighs and groans, at last plucking her panties up from your mouth.");
	output("\n\nThose gulps of fresh air aren’t exactly ‘fresh’ considering the taste of girlcum that still coats your lips, but it’s an amazing source of extra oxygen that gets you to your second wind. Heck, you’re even able to concentrate more fully on the sight of her writhing body. Once more her feathered hair is obscuring a sweaty face, and all of the moisture on her body makes her glisten in the room-light. She starts to relax her milking grip on your dick, allowing yet more lubricious cunt-goodness to escape. With a wicked smirk on her lips she mops up the flow with her panties before holding them out again.");
	output("\n\nYour groan of complaint falls on deaf ears – really deaf considering the size of them – and it turns briefly into a pained gasp when she gives you one hell of a thigh squeeze. She takes the chance to cram them back in your maw and return to her violent ride. Her tail swats your own thighs in time with each bottoming-out, and she grunts at you when you dare to slow down in milking her tits like a breed-steed.");
	output("\n\nThe question of who comes first is answered, surprisingly, with a tie. It’s impossible to hear her cries of ecstasy with the sound of your own beating heart drowning it out, but you can definitely feel the way her channel spasms and squirts around you. At the same time you all but explode, cumming hard enough to feel a stinging pain in your depths. A boobgasm follows on the heels of you both, apparently draining her dry with two last, incredibly thick gouts of milk that spray in wild directions between the pinching of your fingers.");
	output("\n\nShe stays locked to you moments later, thoroughly bottomed out – albeit thankfully supporting her own deadly weight – while you do your best to meet her need to breed. ");
	var cumQ:Number = pc.cumQ();
	if(cumQ < 150) output("Unfortunately despite the hard work she’s put you through, you taper off after a decent creampie. You have no doubt that her eggs are bathing in [pc.cumColor] goodness, but she’s definitely pouting when the flow of scalding-hot jizz comes to a stop.");
	else if(cumQ < 5000) output("Her mouth opens with another, longer groan as rope after rope of your potent [pc.cumColor] " + (silly ? "goo":"cum") + " paints her walls. She’s a quivering wreck atop you, holding herself up on metallic knees with one hand behind her so that she can pinch both of her clits at once. By the time you’re finished there’s a little paunch to her otherwise flat tummy from the prodigious load she’s milked right out of you.");
	else output("Her sweaty body cavorts atop you, and she has to hold herself up on her metallic knees in order to hold her growing tummy aloft with one hand and finger-fan her clit with the other. She swells more and more with every potent rope of [pc.cumFlavor]-flavored deliciousness, enough that it’s squirting out around your dick despite the force with which she clamps down on your bone. To her credit she waits until you’re completely finished before letting your cock escape and a few litres of cum with it... there’s still more than enough to have her eggnant to an unbelievable degree.");
	output("\n\nYou’d like to say you barely notice when she gets off of you, but that weight removing itself from your crotch and abdomen is a raw relief that you’re sure is going to be pronounced by some bruising tomorrow. A trail of cum puddles on the floor at the foot of your bed, which she quickly plugs up with the thick tip of her own tail. <i>“Oooh... yeah. Okay. I’m good now. You’d better believe I’m going to be pushing out so many big thick spacer-eggs later...”</i> You spit out her underwear and she snatches it from the air with a smirk, not even bothering to unwad them.");
	output("\n\n");
	if(cumQ < 150) output("She pauses, looking you over afterwards and giving her now-emptier breasts an idle squeeze. <i>“Although next time you’re coming to me for a slam-down, try to pack a bigger load, yeah Spacer?”</i>");
	else output("She’s crouching very carefully to keep her tail from slipping out thanks to the sheer load of cum being held back. When she gets her apron on it’s with a satisfied sigh. <i>“You’re an absolute cum-cannon for a tiny little sex-pet. We should do this again when you’re all loaded up.”</i>");
	output("\n\nThe dockmaster treats you to a wicked grin before leaving – well, waddling out of – your room. Rolling onto your side only proves just how drenched your bedding is with girl-cum and milk." + (celiseIsCrew() ? " Luckily you’ve got the perfect gooey-green-jizz-janitor to clean up after you.":""));

	processTime(30);

	pc.applyPussyDrenched();
	pc.applyMilkBathed();
	//[Next] //back to being in your ship menu, empty balls, covered in cum, lust spent, sore muscles
	new RaskvelFemale().loadInCunt(pc,0);
	impregnateDockmasterChance();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[LAST SCENE] Get Fucked (Dickless)
//Look at that tail. Just fucking look at it. That baby’s going places.
public function dicklessTakingTail():void
{
	clearOutput();
	showDockmistress(true);
	author("SomeKindofWizard");
	moveTo("SHIP INTERIOR");
	output("Making your way to your bedroom is a challenge, all things told. The dockmaster’s hands keep squeezing your ass, bringing you to a temporary halt each time her thumbs stray a little too close to your waiting [pc.pussy].");
	output("\n\nBy the time you’ve reached the base of your bed, there’s a burning ache in the core of your body. The scent of sweaty breeder flowing off of the dockmaster is rivaled only by your own, and she wastes no time in peeling you out of your clothes and pushing you into your own mattress.");
	output("\n\nYou roll around onto your back to get a proper look at her, just in time to see her tug away her apron and reveal those glorious bouncing breasts. It’s hard to forget just how flat the majority of the raskvel are, that she stands out more like a glorious fertility idol than a mechanic. But there they are, and when she squeezes the undersides you can just about make out the beading of milk from her nipples.");
	output("\n\nThe way her tail click-clacks gently around behind her is almost as menacing as the hungry growl in her voice while she looks you up and down with consideration. <i>“Now then Spacer, what’s a gal to do with you?”</i> The dockmaster wonders aloud, pausing only to nibble on her bottom lip. <i>“See, if you had a cock there’d be no question. And I don’t have the means to fill you with eggs in return...”</i>");
	output("\n\nAs though with a mind of its own, her segmented mechanical tail flicks up and around to her own lips in time for a long and lurid lick. <i>“I bet this would fit really nicely in a slutty little wanderer like you though, hm?”</i> She releases the grip she’s got on her tits, letting gravity take hold of them once more as she climbs up onto the bed. Her tits drag along your [pc.legOrLegs], leaving little trails of moisture while she climbs her way up your body before she gets a grip on your hips. <i>“Other way. We’re going to take you like a breeder at least!”</i>");
	output("\n\nYour bedroom is temporarily upside-down when she flips you over, only gaining rightness when she hikes your ass up in the air. A silent thanks begins to form on your lips when you remember that her hands are flesh and blood when she spanks you, but that moment is quickly spent when you realize she’s muscular enough to bruise you with a bare hand. Apparently you make a good show of bouncing for her, considering she lays into your other cheek too until you’re all but gasping for mercy.");
	output("\n\nShe still has your ass in the air when you feel her stand up and straddle it, planting the weight of her great crushing thighs on your stinging buttocks. Even despite that, you can feel hot moisture trickling between your crack and down towards your own moist cunny. This dockmaster slut is so juicy it’s literally dripping into you, and whenever her thighs sandwich your ass together it feels connected by the sticky strands for a few moments. There’s not too much strain yet to keep your ass in the air, but you’re not exactly certain you’ll last if she starts pounding down on you for real.");
	output("\n\nAny musings are brought short though when she plants her hands on your shoulder and grinds her cunt down against you, and the mechanical click-clack of her tail is the only warning you get before the first thick segment – the tip – is parting the gates to your gooey center. Thankfully it’s not cold metal, whatever it’s made of. Especially when she sinks that first segment into you until you’re gripping the bedsheets and curling up beneath her, unable to drop your head with the grip on your shoulders. Her ears flap noisily to either side of you when she leans down a little, working to get a better angle to tail-fuck you with. <i>“You’re not going to collapse on me now, are you Spacer?”</i>");
	var x:int = rand(pc.totalVaginas());
	
	output("\n\nYou hadn’t even noticed there’s already a tremble in your [pc.legOrLegs], but you grind yourself back against her tail and insist that’s just a shake of pleasure. The dockmaster doesn’t seem entirely convinced, shifting some of her weight to the tips of her metallic toesies. If she seems concerned about bending her tail to an improbable angle it doesn’t show... not that you’d be able to see her while she’s riding your ass.");
	output("\n\nAnd then her tail sinks into you deeper; another rigid segment of tech-tail spreads you wider until your sodden folds are clinging to the smooth metal. Now that there’s at least one joint inside you, the tip can start exploring your depths properly.");
	pc.cuntChange(x,50);
	output("\n\nIt doesn’t take long for the dockmaster to find your g-spot, especially when you cry out in delight at the smooth metal end pushing right across the length of that extra-sensitive flesh. The dommy rask laughs, bouncing on you again and moving her tail away. <i>“Woah there, don’t want you cumming yet now, do we?”</i> She leans back to pat your ass a few times self-assuredly. <i>“This baby can hold so much more tail.”</i>");
	output("\n\nYour lusty moan just barely hides her husky laughter, and yet again another tail-segment begins to feed itself into your waiting twat. The fear of a pinch is thankfully washed away when you realize there’s a decent amount of space between the joins of each segment, and that they don’t ever close together completely. How do you know that? Because right now your body is reflexively clenching around that tail so tightly you can make out every luscious contour.");
	output("\n\nShe doesn’t stop at that either; a couple more faux-penis partitions are slammed into you, not stopping until the tip’s pushing gently on the last barrier before your womb. The raskvel doesn’t start slamming away at it, and there’s a wicked smile on her face that you can hear in her laughter more than see for yourself. That tip stays solidly in contact with your cervix, but it’s the rest of her tail that starts moving properly.");
	pc.cuntChange(x,250);
	output("\n\nActually, moving does a criminally woeful job of describing the way it writhes around inside you like a mechanical tentacle. Yet more metal is pushed into your waiting cunt, but only so that she has extra weight to start pushing down on your walls. You can hear the liquids inside of you being churned up, and they’re starting to drip down and onto the bed between your knees. And it’s not all your juices too; by now the rask’s own cunt has been drooling so much liquid love between your asscheeks that it’s go your asshole looking pornstar-ready, and it mixes into a potent breed-thirsty mess around the lips of your twat.");
	output("\n\nUp until now though, the dockmaster has only been urging you on with little moans and groans from her submissive throne. Her tail’s done the majority of the work, exploring you until it’s as intimately familiar with your pussy as you are. Again there’s another tremble in your [pc.legOrLegs], forcing her to slow down before you collapse. But this time it’s not just down to her overtly bottom-heavy proportions, but the butting heat in your core that precludes a hard cum. She hikes herself up on you just in time for her tail to take the entirety of your weight as your [pc.legOrLegs] give" + (pc.legCount == 1 ? "s":"") +" in, which only serves to make the waves of orgasm gripping you far more intense.");
	output("\n\nYour depths all but stretch around her tail while your muscles wildly milk it, setting you off over and over until it’s impossible to scream any louder. While you’re gasping for air and laid out flat and squirming the curvy Rask drops her weight back onto your ass, pinning you to the mattress in the damp patch of your own girl-cum. <i>“You lasted a bit longer than I expected, but how do you expect me to get mine, huh?”</i> She bounces on your ass, mashing her soaking cunt against you while her tail continues to lazily coil around in your womanhood.");
	output("\n\nGroaning out a response seems impossible, but it turns out that question was rhetorical when she starts to slide further down your body. <i>“Just stay laid out there hun, I’ve got you right where I want you.”</i>");
	output("\n\nIt only takes a few moments to realize that she’s got her own pussy pressed down on her tail, and you can even feel her juices trickle down it and into you. Seriously; egg sluts are the wettest aliens you’ve ever met. Previously her tail had only been moving inside of you ever since that first thrust, but now you’re finally treated to the sensation of those ridged sections pulling out of you, grinding on your g-spot in rolling waves until just the tip keeps your pussy apart. The dockmaster smirks and sinks her thumb into your glistening asshole when you start groaning and fidgeting, keeping you rooted to the spot. <i>“Hold still spacer, it’ll take a while if I start slipping off!”</i>");
	output("\n\nAfter having her tail buried in you for the last few minutes it almost aches to be empty now, but she doesn’t leave you wanting for long. There’s the slick sound of lubed-up-flesh as her own tail-ridges strike not just one, but two clits in a wicked barrage at the same time as they’re being driven into your waiting cunt. Sparks burn in the edges of your vision, and it becomes hard to tell if it’s pleasure or lack of oxygen with her weight bearing down into you from behind. The only time you can gulp down air – heavy with the scent of two fuck-hungry women – is when she pulls back out of you, and then she’s driving her thumb so deep into you with those small muscular hands that it makes you want to gasp anyway.");
	output("\n\nA few more strokes later and she transitions from just hammering your box to a wicked series of short-thrusts that are just enough to set both of her pleasure-buzzers to sparking while your g-spot is battered by the tip. Mixed girl-juices begin to form an ever-larger pool of sexual slickness, far beyond the mattress’ capacity to absorb while you’re ravaged. And now the dockmaster’s whines and moans are beginning to form a wonderful chorus with your own, even as they’re broken up into a staccato mess from the pounding.");
	output("\n\nAs her tail starts to speed up, you can feel that point of resistance keeping her out of your womb grow weaker and weaker with every collision; it’s only a matter of time before she breaches your baby-maker. It’s a shame her tail really can’t cum, you’re practically flowering for her now.");

	output("\n\nJust as you’re starting to crest the ridge to another world-shattering orgasm there’s another sensation, so unexpected that you’re taken entirely aback.");
	output("\n\nHot streams of liquid are splashing down on your back, and when you peak over your shoulder you’re struck clean in the face by the source; the curvy dockmaster milking her tits hard enough to turn her nipples dark. Cream trickles between her fingers, and a long alien tongue drools into her cleavage while she double-clit-tribs her tail between every thrust. At least she’s stopped pounding your cunt-soaked asshole with that thumb, and the sight of her going breed-happy against your body is going to stick with you for a long time. If not for the way she has you possessively fucked into the bedding you’d love to wrap your lips around them, but if you open wide you can catch a few streams in the mouth.");
	output("\n\nAny further hand-eye coordination becomes immediately impossible when your world becomes focused on the singular sensation of your cervix opening wide and permitting her tail into your womb. The dockmaster notices that extra few inches of depth by the fact that she comes to a halt, pressed against you and pausing mid-milking. <i>“Oooh stars and rust there hun! I think we’ve struck deep!”</i> She cries out, bouncing a few more times for good measure while the segmented tip goes wild in you. Nerve endings unused to drastic stimulation fire off chemicals into your animal brain, sending your whole body wild with enough force to nearly push her right back out of you.");
	output("\n\nWith a soft growl the dockmaster re-hilts into you, joining along in cumming as you spray around the tight seal between tail and twat. Her milky tits follow along with a messy boobgasm to further " + (pc.hasFur() ? "mat your [pc.furColor] fur":"soak your back") + ", thicker gouts of cream compared to the thin sticky juices that spray up against your ass. You slap your palm a few times on the bedding, digging your face into the pillow so that you can scream even louder while you ride the lengthy " + (silly ? "cummy":"orgasm") + " out.");
	output("\n\nWhen spots and stars stop clouding your vision and the weight lifts itself off your ass, you’re able to gingerly roll onto your back... just in time to catch one last squirt from her now-drained tits. The dockmaster wipes back her feathery hair, glistening with sweat and panting for breath in a way that manages to get both her chest and ass to jiggle with rhythm. Her hand slaps down on your now-gaping cunt, pinching your clit a little for good measure in order to gather up your girlcum.");
	output("\n\nShe gives herself a slow, satisfied lick before stroking her own twat and lapping up the juices. <i>“No eggs to be expected, but that was a pretty good showing. Feel free to bend over for me again, Spacer.”</i>");
	output("\n\nYou give her an affirmative mumble and watch as she throws on her apron. It’s slightly less snug of a fit after she’s had a proper milking, but she has herself one last little bounce for you with a mechanical click. You’re already starting to stick to the cum-and-milk covered bed, and so worn out from keeping your bones from being crushed that perhaps a nap would do you well.");
	output("\n\nThe dockmaster’s callipygean features look damn good walking out of the room at least.");
	processTime(30);
	pc.applyPussyDrenched();
	pc.applyMilkBathed();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
//[Next] //Pass time half an hour, become sticky and messy, lust spent


//Extras
//The Dockmaster’s Eggnancy
//If the dockmaster has popped out ten+ eggs, this dialogue happens next time you talk to her
public function dockMasterEggnancyProc():void
{
	clearOutput();
	showDockmistress();
	author("SomeKindofWizard");
	output("The dockmaster is leant heavily on her wrench, yawning and rubbing her abdomen. As you approach her, that rub turns into a trailing of fingers down her front where they can slip between their thighs.");
	output("\n\n<i>“Hey... Spacer. I just got finished with your latest gift... damn near came my brains out with those eggs. ");
	if(!pc.hasKeyItem("Panties - The Dockmaster's - Black-buttoned thong.")) 
	{
		output("Tell you what, you keep this up? Then how about I offer you a little cash-off? Nothing big, I’m a busy woman.”</i>");
		output("\n\nShe gnaws on her lip and eyes you over again. <i>“Just you make sure to keep paying me visits. We wouldn’t want your deal to expire.”</i>");
		output("\n\nShe saunters even closer, until her body’s practically grinding against you. <i>“Don’t forget your coupon.”</i>");
		output("\n\n(<b>Gained Key Item: Panties - The Dockmaster’s</b>.)");
		pc.createKeyItem("Panties - The Dockmaster's - Black-buttoned thong.", 0, 0, 0, 0, "This surprisingly modest thong is built to be buttoned on, because there’s no way it’s slipping past the original owner’s gigantic ass otherwise.");
	}
	else
	{
		author("SKoW & Fen");
		output("Tell you what, the best part about this so-called Planet Rush is getting stuffed full by strong alien breeders like yourself.”</i> She gnaws on her lip and eyes you over again. <i>“Just make sure to stuff another load in me soon, or your coupon might expire.”</i>");
		output("\n\nThe mental image of her cunt-soaked panties comes to mind. You doubt that coupon will be expiring any time soon.");
	}
	StatTracking.track("pregnancy/raskvel sired/total",flags["DOCKMASTER_EGGS"]);
	StatTracking.track("pregnancy/total sired",flags["DOCKMASTER_EGGS"]);
	flags["DOCKMASTER_EGGS"] = undefined;
	flags["DOCKMASTER_PREGNANT"] = undefined;
	IncrementFlag("DOCKMASTER_EGGOES");
	processTime(5);
	raskvelDockmasterMenu();
}

public function impregnateDockmasterChance():void
{
	if(pc.virility() <= 0) return;
	//If one's already preggos, no go
	if(flags["DOCKMASTER_PREGNANT"] == undefined)
	{
		var bonusChance:int = 0;
		var cumQ:Number = pc.cumQ();
		if(cumQ >= 50) bonusChance += 5;
		if(cumQ >= 150) bonusChance += 5;
		if(cumQ >= 500) bonusChance += 10;
		if(cumQ >= 1000) bonusChance += 10;
		if(cumQ >= 4000) bonusChance += 10;
		if(cumQ >= 10000) bonusChance += 20;
		// Multiply the chances based on virility
		bonusChance = Math.round(bonusChance);
		//Roll the dice - base 10% pregrate
		if(rand(100) + 1 <= (10*pc.virility()) + bonusChance)
		{
			var bonusEggs:int = Math.round(rand(Math.floor(cumQ/500)+2) * pc.virility());
			if(bonusEggs > 12) bonusEggs = 12;
			//Succeed! Induce Preggoz
			flags["DOCKMASTER_EGGS"] = 3 + bonusEggs;
			//Five days till eggpop!
			flags["DOCKMASTER_PREGNANT"] = GetGameTimestamp();
			pc.clearRut();
		}
	}
}