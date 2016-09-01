import classes.GameData.CommandContainers.FapCommandContainer;
import classes.Items.Armor.GooArmor;
import classes.Items.Miscellaneous.MagicMilker;
import classes.Items.Toys.HoverHole;
import classes.Items.Toys.NivasBionaHole;
import classes.Items.Toys.TamaniBionaHole;
import classes.Items.Toys.BubbleBuddy;
import classes.Items.Toys.SukMastr;

public function canArouseSelf():Boolean
{
	var faps:Array = nonLustFaps();
	if(faps.length > 0) return true;
	return false;
}
public function nonLustFaps():Array
{
	var faps:Array = new Array();
	
	if (pc.canLactate())
	{
		if (pc.hasItem(new MagicMilker(), 1))
		{
			faps.push(["Magic Milker", joyCoMagicMilker7Sucks, "", ""]);
		}
		
		faps.push(["Hand Milk", milkturbation, "", ""]);
	}
	if(hasSmutOptions() && InShipInterior())
	{
		faps.push(["Smut", smutFapMenu, "Smut", "You could go check out some smutty videos on the extranet."]);
	}
	return faps;
}
public function arousalMenu():void {
	clearOutput();
	clearMenu();
	
	var aborted:Boolean = false;
	
	if(rooms[currentLocation].hasFlag(GLOBAL.NOFAP))
	{
		output("Masturbating here would be impossible.");
		aborted = true;
	}
	else if(rooms[currentLocation].hasFlag(GLOBAL.FAPPING_ILLEGAL))
	{
		output("Public masturbation is illegal here. Trying to masturbate would almost certainly land you in jail.");
		aborted = true;
	}
	else if(rooms[currentLocation].hasFlag(GLOBAL.PUBLIC) && pc.exhibitionism() >= 66)
	{
		output("Out here? In public?\n\n...Yeah, that'll do nicely.\n\n");
	}
	else if(rooms[currentLocation].hasFlag(GLOBAL.PUBLIC) && pc.exhibitionism() >= 33)
	{
		output("Out here? In public?\n\n...<b>it'll have to do</b>.\n\n");
	}
	
	if(aborted)
	{
		addButton(0,"Next",mainGameMenu);
		return;
	}
	var faps:Array = nonLustFaps();
	var i:int = 0;
	var btnSlot:int = 0;
	
	output("What do you choose to do?");
	
	for(i = 0; i < faps.length; i++)
	{
		if(btnSlot >= 14 && (btnSlot + 1) % 15 == 0)
		{
			addButton(btnSlot, "Back", mainGameMenu);
			btnSlot++;
		}
		
		addButton(btnSlot, faps[i][0], faps[i][1], undefined, faps[i][2], faps[i][3]);
		btnSlot++;
		
		if(faps.length > 14 && (i + 1) == faps.length)
		{
			while((btnSlot + 1) % 15 != 0) { btnSlot++; }
			addButton(btnSlot, "Back", mainGameMenu);
		}
	}
	addButton(14, "Back", mainGameMenu);
}

public function availableFaps(roundTwo:Boolean = false):Array
{
	var faps:Array = new Array();
	var fap:FapCommandContainer;
	
	// Overrides
	// If any of these are true, do whatever you need and return after pushing a single function into the array
	// We can then autoexecute on the only available option
	if (pc.hasCuntSnake() && pc.hasCock() && !pc.isTaur() && (pc.cockThatFits(pc.tailCuntCapacity()) >= 0) && flags["DAYS_SINCE_FED_CUNT_TAIL"] != undefined && flags["DAYS_SINCE_FED_CUNT_TAIL"] >= 7)
	{
		clearOutput();
		output("An insatiable hunger from your tail overwhelms you. <b>You have to feed it!</b>");
		addButton(0, "Next", cuntTailFapScene);
		
		return null;
	}
	
	if (pc.milkFullness >= 150 && pc.isLactating() && flags["SUPRESS_TREATED_MILK_FAP_MESSAGE"] == undefined)
	{
		// Super-lactation, must resist urge to fap!
		if(pc.isMilkTank())
		{
			clearOutput();
			output("<b>You feel a strong urge to relieve the unbearable pressure your lactating mammaries are experiencing; but thanks to the enhancements to your [pc.fullChest], you are confident they won't ever stop - or even slow down - [pc.milk] production, and you find it easy to resist.</b>");
			clearMenu();
			addButton(0, "Next", function():void 
			{
				flags["SUPRESS_TREATED_MILK_FAP_MESSAGE"] = 1;
				masturbateMenu(false);
				flags["SUPRESS_TREATED_MILK_FAP_MESSAGE"] = undefined;
			}, undefined, "Masturbate", "Choose something else...");
			addButton(1,"Milk",milkturbation, undefined ,"Milk Anyway","Release the pressure now!");
			addButton(14,"Back", mainGameMenu);
		}
		// Your will is weak, now it's milky fun tiems, yay!
		else milkturbation();
		return null;
	}
	
	// Previous fap has moved to consumers of the faps array.
	// This enables us to check if the LAST_FAP targetted command is available (it'll be in the array), otherwise hide repeat.
	
	// List all the faps!
	if (InShipInterior() && celiseIsCrew() && pc.hasTailCock())
	{
		fap = new FapCommandContainer();
		fap.text = "Porn&Celise";
		fap.func = tailCockCeliseFaps;
		faps.push(fap);
	}
	
	if (pc.hasVagina())
	{
		fap = new FapCommandContainer();
		fap.text = "Vaginal";
		fap.func = vaginalFap;
		faps.push(fap);
	}
	
	if (pc.hasCock())
	{
		fap = new FapCommandContainer();
		fap.text = "Penis";
		fap.func = singleDickFap;
		faps.push(fap);
	}
	
	if (pc.cockTotal() >= 2)
	{
		fap = new FapCommandContainer();
		fap.text = "Penises";
		fap.func = multiCockFap;
		faps.push(fap);
	}
	if (pc.hasCock() && pc.hasItem(new HoverHole()))
	{
		fap = new FapCommandContainer();
		fap.text = "HoverHole";
		fap.func = hoverholeFapFapFap;
		faps.push(fap);
	}
	
	if (((pc.canLactate() || pc.milkQ() >= 200) && !roundTwo) || (pc.isLactating() && pc.milkFullness >= 70 && roundTwo))
	{
		if (pc.hasItem(new MagicMilker(), 1))
		{
			fap = new FapCommandContainer();
			fap.text = "Magic Milker";
			fap.func = joyCoMagicMilker7Sucks;
			fap.ignoreRandomSelection = true;
			faps.push(fap);
		}
		
		fap = new FapCommandContainer();
		fap.text = "Hand Milk";
		fap.func = milkturbation;
		fap.ignoreRandomSelection = true;
		faps.push(fap);
	}
	
	if (hasFeedableMimbranes() && mimbranePrivateLocation())
	{
		if (pc.hasCock())
		{
			fap = new FapCommandContainer();
			fap.text = "Penis Feed";
			fap.func = feedMimbranesWithCock;
			faps.push(fap);
		}
		
		if (pc.hasVagina())
		{
			fap = new FapCommandContainer();
			fap.text = "Vaginal Feed";
			fap.func = feedMimbranesWithPussy;
			faps.push(fap);
		}
	}
	
	if (pc.hasCuntTail())
	{
		fap = new FapCommandContainer();
		fap.text = "Tailingus";
		fap.func = tailingusFapReqsCuntTail;
		faps.push(fap);
		
		if (pc.hasCock() && !pc.isTaur() && (pc.cockThatFits(pc.tailCuntCapacity()) >= 0))
		{
			fap = new FapCommandContainer();
			fap.text = "TailFuck";
			fap.func = cuntTailFapScene;
			faps.push(fap);
		}
	}

	if (!pc.isTaur())
	{
		fap = new FapCommandContainer();
		fap.text = "ButtFinger";
		fap.func = wutwutindabuttbuttFap;
		faps.push(fap);
	}

	//tentacle massage fun
	//Accessed from masturbate menu on ship. Req's genitals.
	if(celiseIsCrew() && flags["GIGACELISE"] == 1&& (pc.hasCock() || pc.hasVagina()) && InShipInterior())
	{
		fap = new FapCommandContainer();
		fap.text = "GooMassage";
		fap.func = tentacleMassageFunShit;
		faps.push(fap);
	}

	//Boobswell pads. Need a way to exclude this from random selection sometime.
	if(pc.hasStatusEffect("Boobswell Pads")) 
	{
		fap = new FapCommandContainer();
		fap.text = "Remove B.Swell";
		fap.func = removeBoobswellPads;
		fap.ignoreRandomSelection = true;
		faps.push(fap);
	}

	if (hasGooArmor())
	{
		fap = new FapCommandContainer();
		fap.text = "Goo Dicks";
		fap.ttHeader = "Goo Dicks";
		fap.ttBody = "Have [goo.name] fill all of your holes and fuck you.";
		fap.func = gooDickFap;
		fap.ignoreRandomSelection = false;
		faps.push(fap);

		if (pc.hasCock())
		{
			fap = new FapCommandContainer();
			fap.text = "GooSleeve";
			fap.ttHeader = "Goo Cocksleeve";
			fap.ttBody = "Have [goo.name] jack you off.";
			fap.func = grayGooCockSleeve;
			fap.ignoreRandomSelection = false;
			faps.push(fap);
		}
	}
	//PANTY FAPS!
	if(pc.hasCock()) 
	{
		//Has panties for faps:
		if(pantyFapCount() > 0)
		{
			fap = new FapCommandContainer();
			fap.text = "Panty Fap";
			fap.ttHeader = "Panty Fap";
			fap.ttBody = "Use a pair of panties that you've collected as a cumrag.";
			fap.func = futaBabePantyfapsRouter;
			fap.ignoreRandomSelection = false;
			faps.push(fap);
		}		
	}
	//PANTY SCHLICK!
	if(pc.hasVagina())
	{
		//Has panties?
		if(pantyFapCount() > 0)
		{
			fap = new FapCommandContainer();
			fap.text = "PantySchlick";
			fap.ttHeader = "PantySchlick";
			fap.ttBody = "Use a pair of panties that you've collected as fuel for feminine masturbation.";
			fap.func = futaBabePantySchlicksRouter;
			fap.ignoreRandomSelection = false;
			faps.push(fap);
		}
	}
	if(pc.hasItem(new NivasBionaHole()) && pc.hasCock())
	{
		fap = new FapCommandContainer();
		fap.text = "NivasB.Hole";
		fap.ttHeader = "Nivas Oxonef BionaHole";
		fap.ttBody = "Take the Nivas Oxonef Bionahole for a spin.";
		fap.func = nivasFapSetup;
		faps.push(fap);
	}
	if(pc.hasItem(new NivasBionaHole()) && pc.hasCock() && flags["NIVAS_TUTORIAL"] != undefined)
	{
		fap = new FapCommandContainer();
		fap.text = "NivasTutorial";
		fap.ttHeader = "Nivas Tutorial";
		fap.ttBody = "Run through the tutorial for your Nivas Oxonef BionaHole once more.";
		fap.func = bionaHoleInstructionalBullshit;
		faps.push(fap);
	}
	if(pc.hasItem(new TamaniBionaHole()) && pc.hasCock())
	{
		fap = new FapCommandContainer();
		fap.text = "Tamani B.H.";
		fap.ttHeader = "Tamani BionaHole";
		fap.ttBody = "Take the Tamani Ultralux edition BionaHole for a spin.";
		fap.func = TamaniFapSetup;
		faps.push(fap);
	}
	if(pc.hasItem(new TamaniBionaHole()) && pc.hasCock() && flags["TAMANI_HOLED"] != undefined)
	{
		fap = new FapCommandContainer();
		fap.text = "Tamani Tut.";
		fap.ttHeader = "Tamani Tutorial";
		fap.ttBody = "Run through the tutorial for your Tamani Ultralux edition BionaHole once more.";
		fap.func = tamaniBionaholeInstruction;
		faps.push(fap);
	}
	//Use Vi's vagina, if ye fit.
	if(pc.hasKeyItem("Vi's Vagina"))
	{
		fap = new FapCommandContainer();
		fap.text = "Vi's Vagina";
		fap.ttHeader = "Vi's Vagina";
		fap.ttBody = "Use the vagina you took from the V-Ko droid on Myrellion to sate yourself.";
		fap.func = viPussyFapScene;
		faps.push(fap);
	}
	//Special new texas shit
	if(pc.hasItem(new GravCuffs()) && rooms[currentLocation].planet == "PLANET: NEW TEXAS" && rooms[currentLocation].hasFlag(GLOBAL.PUBLIC))
	{
		fap = new FapCommandContainer();
		fap.text = "CuffSelf";
		fap.ttHeader = "Cuff Yourself";
		fap.ttBody = "You bet that if you cuffed yourself naked somewhere public, there'd be at least one randy bull or cow to give you a reaming.";
		fap.func = cuffSelfRouter;
		faps.push(fap);
	}
	if(hasSmutOptions() && InShipInterior())
	{
		fap = new FapCommandContainer();
		fap.text = "Smut";
		fap.ttHeader = "Smut";
		fap.ttBody = "You could go check out some smutty videos on the extranet.";
		fap.func = smutFapMenu;
		fap.ignoreRandomSelection = true;
		faps.push(fap);
	}
	if(hasRedDildo() || hasGoldDildo())
	{
		fap = new FapCommandContainer();
		fap.text = "StolenDildo";
		fap.ttHeader = "Stolen Dildo";
		fap.ttBody = "Make use of the dildo you stole from the smutty myr deserter.";
		fap.func = stolenDildoFap;
		faps.push(fap);
	}
	if(pc.hasItem(new BubbleBuddy()) && pc.hasCock())
	{
		fap = new FapCommandContainer();
		fap.text = "BubbleBuddy";
		fap.ttHeader = "Bubble Buddy";
		fap.ttBody = "Smaller and thinner than a  normal onahole but larger than a prophylactic, the lilac-colored Bubble Buddy is a self-lubricating pocket pussy that will \"contain and sustain\" the semen of its user. Though only six inches long, the gelatinous surface seems VERY stretchy.";
		fap.func = jackIntoDaBubbleBooty;
		faps.push(fap);
	}
	if(pc.hasItem(new SukMastr()) && pc.hasVagina())
	{
		fap = new FapCommandContainer();
		fap.text = "SukMastr";
		fap.ttHeader = "SukMastr 2000";
		fap.ttBody = "This high-quality pussy pump is perfect for a little bit of cunt-expanding fun. Comes with pump, vaginal cup, and remote.";
		fap.func = useTheSuckMasta;
		faps.push(fap);
	}
	return faps;
}

public function cuffSelfRouter():void
{
	if(pc.hasCock() && rand(2) == 0) gravCuffsCowgirlBangu();
	else newTexanGanguBangu();
}

public function nivasFapSetup():void
{
	bionaholeUse("Nivas");
}
public function TamaniFapSetup():void
{
	bionaholeUse("Tamani");
}

public function selectRandomFap(faps:Array):void
{
	// Don't allow milk scenes to be selected randomly
	var filtFaps:Array = faps.filter(function(item:*, index:int, array:Array):Boolean {
		if ((item as FapCommandContainer).ignoreRandomSelection == true) return false;
		return true;
	});
	
	filtFaps[rand(filtFaps .length)].execute();
}

public function masturbateMenu(roundTwo:Boolean = false):void {
	
	if (flags["KASHIMA_STATE"] == 1 && flags["CHIEF_NEYKKAR_WITH_PC"] == 1 && (pc.hasCock() || pc.hasVagina()))
	{
		lustyBugpony();
		return;
	}
	
	clearOutput();
	clearMenu();
	
	var aborted:Boolean = false;
	
	//Masturbation prevention
	if(rooms[currentLocation].hasFlag(GLOBAL.NOFAP))
	{
		output("Masturbating here would be impossible.");
		aborted = true;
	}
	else if(rooms[currentLocation].hasFlag(GLOBAL.FAPPING_ILLEGAL))
	{
		output("Public masturbation is illegal here. Trying to masturbate would almost certainly land you in jail.");
		aborted = true;
	}
	//Exhibitionist fap! - overrides all other faps
	else if(rooms[currentLocation].hasFlag(GLOBAL.PUBLIC) && pc.exhibitionism() >= 66)
	{
		output("Out here? In public?\n\n...Yeah, that'll do nicely.\n\n");
		
		addButton(0,"Exhibitionism",goddamnitJimTAndYourExhibitionism);
		//Special new texas shit
		if(pc.hasItem(new GravCuffs()) && rooms[currentLocation].planet == "PLANET: NEW TEXAS" && rooms[currentLocation].hasFlag(GLOBAL.PUBLIC))
		{
			addButton(1,"CuffSelf",cuffSelfRouter,undefined,"Cuff Yourself","You bet that if you cuffed yourself naked somewhere public, there'd be at least one randy bull to give you a reaming.");
		}
		addButton(14,"Back",mainGameMenu);
		return;
	}
	//Low Exhibitionist fap! - overrides all other faps
	else if(rooms[currentLocation].hasFlag(GLOBAL.PUBLIC) && pc.exhibitionism() >= 33)
	{
		output("Out here? In public?\n\n...<b>it'll have to do</b>.\n\n");
		
		addButton(0,"Exhibitionism",moderateExhibitionOmniFap);
		//Special new texas shit
		if(pc.hasItem(new GravCuffs()) && rooms[currentLocation].planet == "PLANET: NEW TEXAS" && rooms[currentLocation].hasFlag(GLOBAL.PUBLIC))
		{
			addButton(1,"CuffSelf",cuffSelfRouter,undefined,"Cuff Yourself","You bet that if you cuffed yourself naked somewhere public, there'd be at least one randy bull to give you a reaming.");
		}
		addButton(14,"Back",mainGameMenu);
		return;
	}
	//Pussy out, unless you're being force-fapped.
	else if(rooms[currentLocation].hasFlag(GLOBAL.PUBLIC) && pc.libido() < 70)
	{
		if(pc.libido() < 10) output("You'd never even consider masturbating in public!");
		else if(pc.libido() < 20) {
			output("No way. You aren't the kind of person that would masturbate in public");
			if(pc.lust() >= 75) output(", no matter how horny you are!");
			else output(".");
		}
		else if(pc.libido() < 30) output("The galaxy may be a wide-open place with all kinds of different social norms concerning publicly self-satisfying sexual needs, but you're too nervous to engage in that sort of thing yourself.");
		else if(pc.libido() < 40) output("This is a public place! You aren't keen on the idea of masturbating here. Maybe slip back to somewhere a little more private.");
		else if(pc.libido() < 50) output("You aren't the kind of person to just drop trou and take care of business in public, even if it would be kind of hot.")
		else if(pc.libido() < 60) 
		{
			output("Yeah, you definitely want to masturbate, but this is a public place! Everyone would be able to see you there with your [pc.butt] in the dirt, ");
			if(pc.hasCock()) output("jacking off like wild.");
			else if(pc.hasVagina()) output("grinding your [pc.vaginas] like wild.");
			else output("playing with yourself like some kind of wild animal.");
			pc.lust(5);
			output(" Fuck! Now you're even hornier.");
		}
		else 
		{
			output("You consider masturbating here, but ultimately, you can't. It doesn't matter that having people watching you masturbating would be totally hot. You're still too nervous about it all. What if someone took a picture and put it up on the extranet? You can imagine the tabloids now: some garish headline plastered above a picture of you with both hands");
			if(pc.hasCuntTail() && pc.hasCock()) output(" pumping your cunt-tail up and down on [pc.oneCock].");
			else if(pc.hasCock() && pc.canAutoFellate(-1)) output(" aiming your wildly orgasming cock into your own mouth, your [pc.lips] sealed tightly about the head.");
			else if(pc.hasCock()) output(" vigorously pumping at [pc.oneCock].");
			else if(pc.hasVagina()) output(" doing your level best to fist [pc.oneVagina], your other hand toying with a [pc.nipple].");
			else output(" roaming licentiously across your own body.");
			output("\n\nYou whimper. The idle thoughts have you feeling even hotter now. You'd better find a good place to relieve yourself.");
		}
		output("\n\n(70 libido or sufficient exhibitionism experience is required to masturbate in public spaces.)");
		aborted = true;
		if(pc.perkv1("'Nuki Nuts") > 0) 
		{
			output("\n\n<b>No! You have to do this! You're getting too swollen not to!</b> You'll have to just blush and bear it!");
			aborted = false;
		}
		else if(roundTwo)
		{
			output("\n\n<b>No! You have to - you're too turned on from milking yourself!");
			aborted = false;
		}
		output("\n\n");
	}
	if(aborted)
	{
		addButton(0,"Next",mainGameMenu);
		return;
	}
	// Get available faps
	var faps:Array = availableFaps(roundTwo);
	var i:int = 0;
	var btnSlot:int = 0;
	
	// If we got back a null array from the listing functor, it should have created the button for us.
	if (faps == null)
	{
		return;
	}
	
	if (roundTwo == true)
	{
		//If anything on the screen, do as a next
		if(userInterface.outputBuffer != "\n")
		{
			addButton(0,"Next",selectRandomFap,faps);
		}
		else selectRandomFap(faps);
		return;
	}
	
	// If only one fap came back, just execute it
	if (faps is Array && faps.length == 1)
	{
		faps[0].execute();
		return;
	}
	
	output("What do you choose to do?");
	
	// If last is available, show repeat button
	var showRepeat:Boolean = false;
	
	if (flags["LAST_FAP"] != undefined)
	{
		var filtFaps:Array = faps.filter(function(item:*, index:int, array:Array):Boolean {
			if (flags["LAST_FAP"] == item.text) return true;
			return false;
		});
		
		// Available, show repeat
		if (filtFaps.length > 0)
		{
			showRepeat = true;
		}
		// Unavailable, so we'll just not show the button (in case player backs out and comes back later when the scene is available)
	}
	
	// Repeat button
	if (showRepeat)
	{
		addButton(btnSlot, "Repeat", filtFaps[0].func);
		btnSlot++;
	}
	// Random button
	if (faps.length > 0)
	{
		addButton(btnSlot, "Random", selectRandomFap, faps);
		btnSlot++;
	}

	// Generate all the buttons for the available funcs
	for(i = 0; i < faps.length; i++)
	{
		if(btnSlot >= 14 && (btnSlot + 1) % 15 == 0)
		{
			addButton(btnSlot, "Back", mainGameMenu);
			btnSlot++;
		}
		
		addButton(btnSlot, faps[i].text, faps[i].execute, undefined, faps[i].ttHeader, faps[i].ttBody);
		btnSlot++;
		
		if(faps.length > 14 && (i + 1) == faps.length)
		{
			while((btnSlot + 1) % 15 != 0) { btnSlot++; }
			addButton(btnSlot, "Back", mainGameMenu);
		}
	}
	addButton(14, "Back", mainGameMenu);
}

//Tailcock Fapping w/ Celise
//By Savin
//{Accessed from Masturbate menu whilst shipboard}
public function tailCockCeliseFaps():void {
	clearOutput();
	author("Savin");
	output("God damn you're horny.");
	output("\n\nYou breathe a lusty sigh as the heat of arousal courses through your body, demanding release. You ");
	if(pc.armor.shortName != "") output("strip out of your [pc.armor] and ");
	output("toss your gear aside before flopping down on your bed, ");
	if(pc.isTaur()) output("your [pc.legs] curled up under your belly");
	else output("your [pc.legOrLegs] kicked up behind you");
	output(" as you grab your codex tablet and hook it into its stand at your bedside. Opening up the extranet, you flick through a quick search for free porn. Your hand idly reaches around as you scroll, grabbing your [pc.tailCock] and gently stroking it to hardness as you search, browsing past a dozen quick vids of buxom women and chisel-chested men of a dozen races, all oiled up with bodies entangled in myriad erotic poses. Hot. Your stroking slowly picks up in pace");
	if(pc.biggestTitSize() > 1) output(", your hand occasionally trailing from the tablet to grope and squeeze your [pc.chest], pinching the hardening teats atop them");
	output(".");
	output("\n\nIt takes a good long while to finally find a good vid: one you think you can actually stomach all the way through. One of the actors is a little butter-faced, but hey, the curves on the other one... damn. Oh, that's nice.... You stroke harder and faster as the foreplay starts in earnest, a meaty cock finding a nice sheath in an alien girl's mouth, making her throat bulge with the gene-spliced boy's massive girth. Your tail-wang writhes in your hand, straining against your grasp as you jerk it, the first pearly beads forming at your tip.");
	output("\n\nThe way it pools and dribbles in your hand makes you think of a certain galotian who's probably about ready for a snack. Getting a nice and dirty thought forming in your mind, you key the ship's intercom and call the goo-girl up to your quarters for a meal at the captain's mess. She's quick on her... uh... gooey amorphus mass... and before the first blowjob scene's over, you hear a faint knock on your door. About as heavy as a goo-girl can manage, given her make-up. You call, <i>“Enter,”</i> shooting the green girl a grin, making sure she can see exactly what's on screen and just how hard your [pc.tailCock] is.");
	output("\n\nShe may not be a genius, but Celise's cock-hungry nature takes the fore as she slithers over, her blobby mass of green gel rolling over itself as she approaches, a great big smile on her face. <i>“Oooh, I don't get to come up here much,”</i> she says, looking around your cabin with mock interest, her eyes never leaving the cock in your hand. <i>“But if I knew there were going to be treats like that, I'd be up here like, every day.”</i>");
	output("\n\nYou feel a surge of affection at her eagerness, and quickly lay back down on your belly, tail wagging enticingly at the galotian in the closest facsimile to a <i>“come hither”</i> waggle as you can manage with a rock-hard pre-dripping tail-cock. Celise hops into your bed, snuggling up next to you, her flank sticking wetly to your [pc.skin]. <i>“Oooh, whatcha watching?”</i>");
	output("\n\nYou hover a finger over the name of the vid, but the sudden insertion of a huge cock into a huge-titted bimbo's asshole opposite the two in her mouth gets the point across pretty quickly. Celise licks her lips as she watches the holo-vid progress, but you've got more in mind than just snuggling with a porno. You reach your tail around and nuzzle it against her cheek, letting it practically submerge in the hot, viscous gel of her body. With a squeal of delight, Celise rolls onto her back, taking your tail-cock in her mouth as her eyes keep trained on the vid. You let out a contented little sigh as your [pc.tailCock] finds a nice, warm, wet sheathe to hold it, but that turns into a low moan of pleasure as Celise's mouth starts to work its wonders, gyrating and washing over and around your cock rather than simply fellating it, getting the most out of her alien biology as her semi-liquid body churns around your member.");
	output("\n\nMmmm, that's niiiiice. Your breath comes heavier as Celise suckles from your cock, little droplets of pre starting to float listlessly in her transparent head. You see a hand vanish down into her crotch, pleasuring her one constant feature -- her big, loose, gooey cunt - as she watches the porno progress from DP to cowgirl as the busty alien rides a huge cock, giving handies to two other males and a hung hermaphrodite pleasures herself with the whore's big tits. Following along herself, Celise pops your [pc.tailCock] out of her mouth, shifting it downward to her big, bouncy teats and locking it between them, binding your dick in a prison of soft warm goo-tit. Still raptly watching the orgy onscreen, Celise starts to squeeze and move her tits, wanking you off between the two huge orbs. You moan, hips wiggling happily as your cock is coated in green slime, slipping easily through her cleavage again and again, with just enough resistance to let you feel the cum bubbling up through your prick, making you even harder as your seed comes up to feed your gooey friend.");
	output("\n\nWith your cock submerged in Celise's gooey tits, your orgasm mounts toward the inevitable, spurred on by her slick sliding tits as she moves them faster and faster. But just before your climax can come, the pornstar's position changes, the girl rolling onto all fours to be pounded in every hole by her lovers. A moment later, she slides up onto your back, flopping down atop you with breasts pressing into your back, hands stroking your shoulders soothingly as her big, bubbly buttcheeks lock around your [pc.tailCock], squeezing it ever so smoothly. Celise flexes her cheeks, massaging your prick as she works your shoulders, cheek nuzzling against your own as you watch the money shot, cum splattering everywhere on the bimbo's body, three cocks all coating her in a multi-colored spunk parade.");
	output("\n\n<i>“You wanna cum, too?”</i> Celise asks, her breasts pressing down into your back, practically folding around you. Her ass never stops jacking you off, harder and faster until she's leaving you with little choice but to join in on the on-screen debauchery. With a grunt and a lusty moan, you feel the spunk traveling up your tail as you finally reach the pinnacle of pleasure, and a moment later Celise yelps with sudden glee as the first of many great [pc.cumColor] globs burst out from between her ass cheeks, raining down onto her back. She rolls over, mouth open wide as your spunk falls all over her, absorbed into her gooey body as she feeds on your sexual release.");
	output("\n\nYou ride the orgasm out, humping your hips against her quivering body as Celise sucks up every drop you have to give her; soon she's got your cock plugged into her twat, wringing out anything that didn't burst onto her back moments before. When the [pc.cumColor] explosion comes to an end, Celise seems awfully pleased, rolling back onto her belly, practically wrapping your head in her giant tits as she plants a kiss on your head. <i>“That was a nice snack, cap'n. We should do this again sometime, like, soon.”</i>");
	output("\n\nYou nod, yawning powerfully as your tailcock slithers out of her, wrapping back around");
	if(pc.legCount > 1) output(" one of");
	output(" your [pc.legOrLegs]. To your surprise, though, the goo's already curled up on you, snoring softly. You sigh and reach back, patting her jiggling ass cheek before locking your arms under your own [pc.face] for a quick nap in the afterglow.");
	processTime(45 + rand(5));
	pc.orgasm();
	celise.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Vaginal Fap
public function vaginalFap():void {
	clearOutput();
	output("You ");
	if(pc.isNude() || (pc.isCrotchExposed() && pc.isChestCovered())) {
		output("lazily twist what little gear you wear to the side so as not to bump your arm into it while masturbating and smile to yourself about the practical advantages of being");
		if(pc.isNude()) output(" nude");
		else output(" mostly naked");
		output(".");
	}
	else {
		clearList();
		if(!(pc.lowerUndergarment is EmptySlot) && !pc.lowerUndergarment.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL) && !pc.lowerUndergarment.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_GROIN)) {
			addToList("push your [pc.lowerUndergarment] down");
			trace("LOWER ON LIST");
		}
		if(!(pc.upperUndergarment is EmptySlot) && !pc.upperUndergarment.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL) && !pc.upperUndergarment.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_CHEST)) {
			addToList("pull your [pc.upperUndergarment] off");
			trace("UPPER ON LIST");
		}
		output(formatList());
		//trace("UP SHORT: " + pc.upperUndergarment.shortName);
		//trace("LOW SHORT: " + pc.lowerUndergarment.shortName);
		output(".");
	}
	output(" Exposed to the air, your [pc.vaginas] ");
	if(pc.vaginaTotal() == 1) output("simmers");
	else output("simmer");
	output(" with latent, low-level arousal that is soon to bloom in an inferno of ardor and desire. The feminine scent of girlish arousal reaches your nose a moment before your fingers reach ");
	if(pc.vaginaTotal() == 1) output("your");
	else output("a");
	output(" cleft, and you let out a happy, contented sigh as you start to deal with your baser needs.");
	
	output("\n\nThe ");
	if(pc.vaginas[0].wetness() <= 1) output("slightly damp entrance your fingers slide against");
	else if(pc.vaginas[0].wetness() <= 2) output("sticky, simmering delta your fingers slip against");
	else if(pc.vaginas[0].wetness() <= 3) output("unmistakably wet and ready slit your fingers almost slip into");
	else if(pc.vaginas[0].wetness() <= 4) output("oozing, overly-lubricated entrance that nearly sucks your fingers in");
	else output("soaking-wet, crotch-drenching entrance that would be oh so easy to enter");
	output(" quivers deliciously at your touch, the folds engorging as they fill with unspent desire, their flesh sensitive and achy.");
	if(pc.totalClits() > 0) {
		output(" You slide your palm across the slowly-stiffening surface of your clitroral hood");
		if(pc.totalClits() > 1) output("s before they swell");
		else output(" before it swells");
		output(" enough to become exposed.");
	}
	output(" Your body gives a gentle shudder at that");
	if(pc.hasTail()) output(", your [pc.tail] flicking wildly behind you");
	output(".");
	if(rooms[currentLocation].hasFlag(GLOBAL.BED)) output(" You're thankful to have a bed, and you lean back against the headboard, letting your [pc.legOrLegs] splay wide and twitch in a visible display of your enjoyment.");
	else if(InShipInterior()) output(" You're thankful to be in the comfort of your ship and splay your [pc.legOrLegs] out as much as the ship will allow, flexing your muscles in rapacious enjoyment.");
	else
	{
		output(" You slump down against the nearest upright surface since your [pc.legOrLegs] seem");
		if(pc.legCount == 1) output("s");
		output(" to be too busy quivering to properly support you.");
	}
	
	//Second coochie touches!
	if(pc.vaginaTotal() > 1) {
		output("\n\nIf one is this good... you thrust your other hand down to your crotch as fast as you can, brushing past your other wrist as you find your way to your [pc.vagina 1] and stroke it with eager, feverish need. Paroxysms of pleasure rock your body, alternately locking and convulsing your muscles but not quite bringing you off yet; this is still mere foreplay. You curl your hand into a fist and drag your knuckles up and down that slit, spreading its lips slightly around your digit, rubbing yourself with both hands and letting out quiet little moans of enjoyment. This taste of ecstasy is almost too much and yet not nearly enough, and you plunge two sets of fingers into your eager openings.");
	}
	//Nipple fucky
	//9999
	if(pc.hasFuckableNipples()) {
		output("\n\nYour other hand finds its way up to your [pc.chest], and more importantly, to one of your ");
		if(pc.nipplesPerBreast > 1) output("clusters of ");
		output("[pc.nipples]. The ");
		if(!pc.hasLipples()) output("tender slit");
		else output("tender lips");
		output(" easily part around your intruding digit, letting you into another ecstatically clenching tunnel. Trembling contractions run up and down the interior of your sensitive, penetrable nipple as you plumb its moist depths. You slip a second finger in after the first, squelching noisily, shaking your [pc.chest] with the force of it, and you cannot resist mimicking the action down at [pc.oneVagina], thrusting inside, pumping your pussy with lewd, wet squelches of female bliss.");
	}
	//Regular Nips
	else {
		//9999
		output("\n\nYour other hand finds its way to your [pc.chest], and more importantly, to one of your ");
		if(pc.nipplesPerBreast > 1) output("clusters of ");
		output("[pc.nipples]. You pinch and tweak at your sensitive bud, really working it back and forth as you toy with your nethers, tugging it from time to time to shoot darts of pleasurable agony through your licentiously contorting form. With one back-arching plunge, you work a pair of fingers into your needy slit, thrusting again and again, so hard that the wet squelches of female bliss are distinctly audible.");
	}
	output("\n\nYou moan, loud and low but inexorably rising higher with each touch and caress, each thrusting slip through your needy crevice. Arching your [pc.hips], you hump against your hand, grinding back into your quickly moving fingers");
	if(pc.totalClits() > 0) output(", some plunging inside while others tend to [pc.oneClit]");
	output(", your body practically on autopilot at this point - a quivering, pre-orgasm wreck. It's no surprise to you; this is what you wanted after all. A high pitched, keening whine escapes your [pc.lips] as you climb towards the peak of pleasure, and your fingers are rapidly becoming soaked with your [pc.girlCum].");
	
	output("\n\nThen, it comes all at once, an explosion of ecstasy strong enough to make your eyes roll back and your body go on autopilot: fingers thrusting, [pc.hips] lurching, [pc.legOrLegs] quivering. Your wail turns into a lurid moan every bit as sloppy as your spasming [pc.vaginas]");
	if(pc.isSquirter()) output(", just before you squirt out ribbons of [pc.girlCum]");
	output(".");
	if(pc.hasFuckableNipples()) output(" Your [pc.nipples] react similarly, and you wind up pulling your soaked fingers free in the throes of your passion.");
	output(" Drool from your lolling tongue drips to your [pc.chest], warm on your heaving [pc.skinFurScales] as you shudder one last, climactic time, letting the supernova-hot explosion of bliss roll up from your crotch to your brain. It bursts across your consciousness like a plasma-bolt comprised of pleasure, rolling back your eyes and turning your thoughts to nothing more than animal pleasure.");
	
	if(pc.hasCock()) {
		output("\n\nYour male anatomy goes off as well, triggered by the squelching blissplosions in your [pc.vaginas]. [pc.Cum] launches out of [pc.eachCock] in thick ropes onto your [pc.belly] and [pc.chest].");
		if(pc.cumQ() < 25) output(" By the time you finish, you've got a nice little puddle there.");
		else if(pc.cumQ() <= 100) output(" By the time you finish, you've soaked yourself and have thick ribbons of [pc.cumColor] goo rolling down either side of your [pc.hips].");
		else if(pc.cumQ() <= 300) {
			output(" By the time you finish, you've soaked yourself in [pc.cumColor] from the waist to the neck in your lovegoo, and huge streamers of the stuff are running off you to puddle on the ");
			if(rooms[currentLocation].hasFlag(GLOBAL.BED)) output("bed");
			else if(InShipInterior()) output("deck");
			else output("ground");
			output(".");
			applyCumSoaked(pc);
		}
		else {
			output(" It never really seems to end, not until you've splattered huge [pc.cumColor] gobs across your [pc.face] a half-dozen times and thoroughly painted the whole of your body with the seed-filled fluid.");
			if(pc.cumQ() >= 10000) output(" Warm wetness rises up around you as you finish out, blissed out and semi-conscious.");
			applyCumSoaked(pc);
			if(pc.cumQ() > 5000) applyCumSoaked(pc);
			if(pc.cumQ() > 10000) applyCumSoaked(pc);
			if(pc.cumQ() > 30000) applyCumSoaked(pc);
			if(pc.cumQ() > 50000) applyCumSoaked(pc);
		}
	}
	output("\n\nYou come to a little later, reeking of sex, your fingers stained with girlish goo, and smile, sated... for now.");
	processTime(45 + rand(5));
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}


//Single Dick Fap
public function singleDickFap():void {
	clearOutput();
	clearList();
	if(pc.isNude() || pc.isCrotchExposed()) output("You sigh and stretch, letting [pc.eachCock] hang free. Sometimes, it's good to be nude. You");
	else {
		if(!pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL) && !pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_GROIN)) {
			output("You go ahead and pop open the bottom half of your [pc.armor]");
			if(!pc.lowerUndergarment.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL) && !pc.lowerUndergarment.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_GROIN)) output(" and [pc.lowerUndergarment]");
			output(" to free [pc.eachCock], and you");
		}
		else output("You go ahead and pull down your [pc.lowerUndergarment] to free [pc.eachCock], and you");
	}
	output(" idly reach down to toy with [pc.oneCock], grabbing hold and feeling it fill out in your palm, stiffening in anticipatory lust - not that you needed any more. You're plenty horny, and you begin to stroke, working yourself towards greater levels of pleasure with great vigor, pumping hard and fast on your ");
	if(pc.cockTotal() > 1) output("chosen ");
	output(" phallus. The [pc.cockHead] plumps up nice and full in your grip, already swelling out to its full size");
	if(pc.hasCockFlag(GLOBAL.FLAG_FLARED)) output(", the flare dangerously expanding already");
	output(", hot, lusty, and ready for action.");
	//In ship? Pull up porno!
	if(InShipInterior()) {
		output("\n\nWith your other hand, you manipulate the ship's computer to pull up some pornography from the extranet. At first, all you get are a bunch of pop-up holos about getting a space-order bride, pirating music, and cleaning malware off your computer systems, but eventually, you hit the jackpot");
		if(silly) output(": XMiniatureGiantSpaceHamster.com");
		output(". There's four breasted whores from Omikron Perseus VI, three-cocked trannies masturbating, and even missionary sex in the missionary position for the sole purpose of procreation. You scroll through, picking video after video, watching increasingly debauched activities until [pc.eachCock] feels so full that it could burst.");
	}
	//Bottom of dick intro
	var selector:Array = new Array();
	if(pc.hasCockFlag(GLOBAL.FLAG_KNOTTED)) selector[selector.length] = GLOBAL.FLAG_KNOTTED;
	if(pc.hasCockFlag(GLOBAL.FLAG_SHEATHED)) selector[selector.length] = GLOBAL.FLAG_SHEATHED;
	if(pc.hasCockFlag(GLOBAL.FLAG_STINGER_BASED)) selector[selector.length] = GLOBAL.FLAG_STINGER_BASED;
	if(selector.length == 0) selector[selector.length] = GLOBAL.TYPE_HUMAN;
	var temp:int = selector[rand(selector.length)];
	//Knotted
	if(temp == GLOBAL.FLAG_KNOTTED) {
		output("\n\nYou start by gently feeling around the bottom of your ");
		if(pc.cocks[0].knotMultiplier <= 1.4) output("dutifully swelling");
		else if(pc.cocks[0].knotMultiplier <= 1.6) output("nice, thick");
		else if(pc.cocks[0].knotMultiplier <= 1.9) output("bloated");
		else if(pc.cocks[0].knotMultiplier <= 2.5) output("obscenely swollen");
		else output("ridiculously fat");
		output(" knot, feeling the swollen cocklump pulse with every beat of your heart. The many veins visible around its circumference tingle pleasantly as they drum against your palm.");
	}
	//Sheath
	else if(temp == GLOBAL.FLAG_SHEATHED) output("\n\nYou start by gently feeling around the sheath, rubbing the sensitive skin that would usually conceal your organ were it not so erect, and even let your fingers dip down into the folds between, running them around the inside, feeling your hands on your dick and yet at the same time penetrating you. By the time you pull them free, your heady, musky aroma is thick in the air. You move up to the shaft a nano-second later, eager to get into the real action.");
	//Anemone Wavy
	else if(temp == GLOBAL.FLAG_STINGER_BASED) {
		output("\n\nYou start by gently feeling around the base of your shaft, letting your wriggling tendrils brush your knuckles, their stinging venom both painful and pleasant all at once. A chemical excitement spreads up your arm, darkening the [pc.skin]");
		if(pc.skinType != GLOBAL.SKIN_TYPE_SKIN) output(" under your [pc.skinFurScales]");
		output(", exciting your heart until you feel it's about to thud its way out of your chest. A ripple of sensual pleasure spreads out from your crotch as the venom circulates through your bloodstream to its goal.");
	}
	//Nothing special:
	else output("\n\nYou start by gently caressing yourself, twisting your fingers around your dick, caressing the sensitive underside of your dick as your lasciviousness mounts. Every contact of [pc.skinFurScales] on skin sends electric currents of pleasure shooting through your body.");
	
	//Top of dick intro
	selector = new Array();
	if(pc.hasCockFlag(GLOBAL.FLAG_TAPERED)) selector[selector.length] = GLOBAL.FLAG_TAPERED;
	if(pc.hasCockFlag(GLOBAL.FLAG_FLARED)) selector[selector.length] = GLOBAL.FLAG_FLARED;
	if(pc.hasCockFlag(GLOBAL.FLAG_PREHENSILE)) selector[selector.length] = GLOBAL.FLAG_PREHENSILE;
	if(pc.hasCockFlag(GLOBAL.FLAG_STINGER_TIPPED)) selector[selector.length] = GLOBAL.FLAG_STINGER_TIPPED;
	if(selector.length == 0) selector[selector.length] = GLOBAL.TYPE_HUMAN;
	temp = selector[rand(selector.length)];
	
	//Pointed
	if(temp == GLOBAL.FLAG_TAPERED) {
		output("\n\nSoon, you're panting with excitement, thrusting against your hand when your fingers touch the sensitive point to bury yourself back to down to your [pc.knot] in your hand's reflexively tight grip. You stroke up again, fondle yourself, and whine as your body forces you to thrust, embedding your pointed prick deep into your hand once more, pleasuring yourself with rapid humps and vice-like squeezes.");
	}
	//Flared
	else if(temp == GLOBAL.FLAG_FLARED) {
		output("\n\nSoon, you're panting with excitement, your [pc.hips] quivering as you dance your touches up past the middle of your flexing member. Your member gives a mighty shudder when you approach the flare, and that masculine ring thickens in response, engorging with fresh blood and becoming even more responsive to your touches.");
		if(pc.isTaur()) output(" You fail to suppress a muted whinney as your body gives in to its animalistic instincts.");
	}
	//Anemone Wavy
	else if(temp == GLOBAL.FLAG_STINGER_TIPPED) {
		output("\n\nSoon, you're panting with excitement and stroking your hand up and down your length. It's hard and sensitive as you've come to expect, but on your upstrokes, you get to your favorite part: the squirming tendrils that ring your crown. They have all the sensitivity of your cocktip, but at the same time, they also move with their own independant skills and desires, slipping between your fingers and dosing you with even more of your own venom.");
	}
	//Prehensile
	else if(temp == GLOBAL.FLAG_PREHENSILE) {
		output("\n\nSoon, you're panting with excitement and handling the [pc.cockTip], twitching excitedly as it squirms against your hand, wrapping around your wrist and tugging it to make it move faster. Your own cock is encouraging you to jack off, driving your arm with pistol-like speed, forcing you to drive your need even hire, until it becomes a palpable, almost tangible thing. You cry out and jack harder, faster, and your cock straightens out under the assault, letting you pleasure its entire length unimpeded.");
	}
	//Nothing special
	else output("\n\nSoon, you are panting with excitement, your hips giving little upward lurches when you fondle your [pc.cockHead], letting your fingers play over it while you imagine it's actually some cute alien doing the touching.");
	
	//Precum addendum: requires high ball fullness or production!
	if(pc.ballFullness >= 33 || pc.cumQ() >= 500) {
		if(pc.cumQ() <= 25) output(" A single droplet of pre beads from your cumslit, and you gather it up to smear along your length, lubricating your playful fingertips.");
		else if(pc.cumQ() <= 150) output(" A single droplet of pre beads from your cumslit, but it turns out to be the first of many when that droplet turns into a river of lubricating cockslime. You gather up the musky, sexual efflux and smear it over your shaft in a lubricating layer.");
		else if(pc.cumQ() <= 150) output(" A single droplet of pre beads from your cumsit, but it turns out to be the first of many when that droplet turns into a river of lubricating cockslime. You gather up the musky, sexual efflux and smear it over your shaft in a lubricating layer.");
		else output(" Fat droplets of pre roll out of your cumslit one after another, so fast that your crotch soon becomes sticky with the leaking sexual stuff. You gather up a handful of the stuff and smear it over your shaft, lubricating yourself for your playful fingertips.");
		//Precum finisher
		output(" The sound of your masturbation takes on a decidedly moist quality, schlicking hard and fast as you rise towards your peak.");
		if(pc.balls > 0) {
			output(" Grabbing your [pc.balls] with one hand, you gently rub and caress your [pc.sack], massaging it to make yourself even harder, even more erect.");
			if(pc.balls == 1) output(" It churns");
			else output("They churn");
			output(" in needy anticipation, clinging tighter to your body in the moment before you explode.");
		}
		else output(" A lusty heat surges through your core, pumping and squeezing as pressure grows, and you realize that you're about to explode.");
	}
	//Cumming!
	output("\n\nAt that moment, your climax hits you, fissuring through your brain in cerebellum-cleaving tremors of pure bliss. Your [pc.cock] bloats as your rational thought shuts down, twitching in wild, uncontrolled spasms.");
	if(pc.cumQ() <= 3) output(" Only a single droplet of [pc.cum] escapes. Perhaps you should give your [pc.balls] a break?");
	else if(pc.cumQ() <= 10) {
		output(" A few weak spurts of [pc.cum] emerge from your cumslit");
		if(pc.ballFullness <= 10) output(", way below your normal output. It might be worth taking a day or two off from all the sex");
		output(".");
	}
	else if(pc.cumQ() <= 100) {
		output(" A few thick spurts of [pc.cum] shoot out to paint your ");
		clearList();
		addToList("[pc.belly]");
		if(pc.cumQ() >= 35) addToList("[pc.chest]");
		else if(pc.cumQ() >= 65) addToList("[pc.face]");
		output(formatList() + ".");
	}
	else if(pc.cumQ() <= 250) {
		output(" Thick spurt after thick spurt emerges from your cumslit, painting you from your [pc.belly] to your [pc.hair] in [pc.cumColor] relief.");
	}
	else if(pc.cumQ() <= 500) {
		output(" Big squirts of [pc.cum] fire out one after another, each easily thicker and larger than an average human's by far. They splatter across nearly every inch of your body, so thick that runnels of your spent goo drip down the sides of your [pc.chest] and [pc.face].");
	}
	else {
		output(" Large torrents of [pc.cum] spray out of your cumslit with such vigor that you're able to watch them arc through the air before they rain down around you, each many times the size of a normal orgasm in its own right. The [pc.cumColor] rain slicks you from [pc.feet] to [pc.face], staining you the proof of your incredible virility");
		if(pc.cumQ() < 1000) {}
		else if(pc.cumQ() < 2000) output(", never mind the growing puddle below");
		else if(pc.cumQ() <= 5000) output(", never mind the inch-deep puddle below");
		else if(pc.cumQ() <= 10000) output(", never mind the deep, wide puddle below");
		else if(pc.cumQ() <= 20000) output(", never mind the small, growing lake below");
		else if(pc.cumQ() <= 30000) output(", never mind the rapidly-deepening lake below");
		else if(pc.cumQ() <= 50000) {
			if(rooms[currentLocation].hasFlag(GLOBAL.OUTDOOR)) output(", never mind the swimming pool-like lake below");
			else output(", never mind the room-flooding pool you've created");
		}
		else output(", never mind the physics-defying amount in the lake below");
		output(".");
		applyCumSoaked(pc);
		if(pc.cumQ() > 5000) applyCumSoaked(pc);
		if(pc.cumQ() > 10000) applyCumSoaked(pc);
		if(pc.cumQ() > 30000) applyCumSoaked(pc);
		if(pc.cumQ() > 50000) applyCumSoaked(pc);
	}
	if(pc.libido() <= 33) output("\n\nYou exhale a few long, slow pants as you come down from that glorious, orgasmic high");
	else if(pc.libido() <= 66) output("\n\nYou let out a dazed, happy smile now that you're sexually sated");
	else output("\n\nYou groan, wish you had time for a repeat performance");
	output(", straighten yourself up a little, and prepare to resume your journeys.");
	processTime(45 + rand(5));
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function multiCockFap():void {
	clearOutput();
	output("There's no time like the present to deal with the insistent pulsations originating down south. You ");
	if(!pc.isNude() || (!pc.isCrotchExposed() && !pc.isChestExposed())) {
		output("strip out of your ");
		clearList();
		if(pc.armor.shortName != "" && !pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL) && !pc.armor.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_GROIN)) addToList("[pc.armor]");
		if(pc.lowerUndergarment.shortName != "" && !pc.lowerUndergarment.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL) && !pc.lowerUndergarment.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_GROIN)) addToList("[pc.lowerUndergarment]");
		if(pc.upperUndergarment.shortName != "" && !pc.upperUndergarment.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_FULL) && !pc.upperUndergarment.hasFlag(GLOBAL.ITEM_FLAG_EXPOSE_CHEST)) addToList("[pc.upperUndergarment]");
		output(formatList() + " to expose your [pc.cocks]. With the multiple endowments that you bear, there's no doubt that this is going to be a very messy, if enjoyable, experience.");
	}
	else output("find yourself a good spot to settle your nude form and remove the few pieces of kit you keep with you. There's no point in making a mess of your equipment after all.");
	if(pc.libido() <= 33) {
		output(" Your [pc.cocks] don't seem to react much to the changing environs, ");
		if(pc.lust() <= 50) output("aside from slowly stiffening thanks to a few quick pumps");
		else output("aside from getting a little harder when your hands make contact with one of them");
	}
	else if(pc.libido() <= 66) output("Your [pc.cocks] react like slowly-rousing beasts, each one getting thicker, harder, and eager for contact as though they're aware of what's to come");
	else output("Your [pc.cocks] react like well-trained animals, stiffening to firm, full mast in seconds, so eager for pleasure that they bob in place excitedly whenever your hand comes close");
	output(", and you sigh as your hands commence true self-pleasure.");
	
	//Two cocks: The ol' double-stroke
	if(pc.cockTotal() == 2) {
		output("\n\nYour groin seems perfectly made for you to masturbate; your [pc.cock 0] is in your right hand and your [pc.cock 1] is in your left. There's no worry of having a penis left out and trying to juggle it into some kind of rotation. You don't need to double-up both hands on one dick to try and increase the sensation. You can just... lie back and stroke. Up and down, you slide your hands on the slow journey, sometimes keeping them in a steady, matched rhythm, and other times alternating so that you jack up one while the other is on an oh-so-pleasurable downstroke.");
	}
	var tailPussied:Boolean = false;
	var titFucked:Boolean = false;
	var nippleFucked:Boolean = false;
	var sucked:Boolean = false;
	//Three dicks+
	if(pc.cockTotal() > 2) {
		output("\n\nYour groin seems almost too bountiful, if such a thing is possible. There's all these wonderfully erect phalluses aching to be touched and yet you only have two hands to tend to them with.");
		if(pc.hasTailCunt() && pc.tailCount >= pc.cockTotal() - 2) {		
			output(" Without a single thought from you, your ");
			if(pc.cockTotal() > 3) output("tails snake around and cover");
			else output("tail snakes around and covers");
			output(" every single unclaimed cock with a tight, fleshy sleeve");
			if(pc.biggestCockVolume() > pc.tailCuntCapacity()) output(", even though at least one of your members is far too thick for a tail to handle more than the head");
			output(". You whimper as feelings of fucking and being fucked war with the sensation of doubled masturbation at the forefront of your mind. The only winner here is pleasure, and you subsume yourself in it, stroking like wild while trying to hold back the mother of all orgasms.");
			tailPussied = true;
		}
		else if(pc.tailCount >= pc.cockTotal() - 2 && pc.hasTailFlag(GLOBAL.FLAG_PREHENSILE) && pc.tailType != GLOBAL.TYPE_HUMAN) {
			output(" Lucky for you, you've got [pc.tails] that are more than capable of wrapping around an unclaimed tool and stroking up and down, letting you please every single cock at once in a symphony of pleasure ");
			if(pc.cockTotal() >= 7) output("with so many different harmonies that it almost overloads your mind");
			else output("so powerful that it's hard not to slip away into the ecstasy immediately");
			output(".");
		}
		else output(" You aren't one to give up on a challenge, and you stroke yourself in earnest, letting each cock have a few strong pumps up and down before moving to the next of your many penises. You circle around, never staying on one cock too long, always moving to the next once it's aching for a touch, so much more sensitive after tasting a moment of denial.");
	}
	
	
	//precum options!
	if(pc.ballFullness >= 33 || pc.cumQ() >= 500) {
		output("\n\n");
		if(pc.cumQ() <= 25) output("After a while of this, single pearls of pre-cum bead on your tips to shine in the light, begging to be touched and smeared over your sexy, throbbing fuck-sticks.");
		else if(pc.cumQ() <= 150) output("After a while of this, single droplets of pre bead from your cumslits. They are the vanguard of a small contingent of lubricating leakages that rolls down the surfaces of your [pc.cockHeads] in a delightful way.");
		else output("After a while of this, big droplets of pre-cum emerge from your cumslits, one after another. Each is hot on the heels of its predecessor, and in moments, your multitudinous masts are wreathed in eager cock-slime. There's so much that the rest of your crotch grows sticky with the wet-hot mess.");
		output(" You gather up the distilled eagerness in the palm of each hand and firmly smear it down your lengths");
		if(pc.cockTotal() > 2) {
			output(", repeating the action ");
			if(pc.cockTotal() == 3) output("once more");
			else output("over and over");
		}
		output(" to ensure that every single shaft has a thick coating of its glorious ooze. The nerves inside [pc.eachCock] alight with pleasure at these touches, and you find yourself milking bigger and bigger deposits of liquid lust with each stroke until your masturbation fills the air with sloppy-sounding schlicks.");
		//{tailcunt sucking going down}
		if(tailPussied) {
			output("Of course, the pre-cum from your member");
			if(pc.cockTotal() >= 4 && pc.tailCount >= 2) output("s");
			output(" subsumed in tail-mounted pussy is quickly devoured by your symbiotic appendages, but ");
			if(pc.cockTotal() >= 4 && pc.tailCount >= 2) output("those dicks get");
			else output("that dick gets");
			output(" a coating of much slicker, more feminine fluids.");
		}
		//PRECUM END
	}
	//Vaginal blurb
	if(pc.hasVagina()) {
		output("\n\n[pc.EachVagina] is hot and wet ");
		if(pc.balls > 0) {
			output("enough to soak the underside of your [pc.sack], but you're far too busy to give ");
			if(pc.vaginaTotal() == 1) output("it");
			else output("them");
			output(" the fucking ");
			if(pc.vaginaTotal() > 1) output("they deserve");
			else output("it deserves");
			output(" right this minute. The sinful friction of your ball-skin against your vaginal lips will have to remain a simmering undercurrent of additional enjoyment while you focus on pleasing your pricks.");
		}
		else output("enough to look puffy and enticing, begging to be fucked, but you're far too busy with your pricks to divert into a simmering snatch right now.");
	}
	var choices:Array = new Array();
	//Randomly select from available!
	var x:int = pc.longestCockIndex();
	if(pc.hasFuckableNipples() && pc.biggestTitSize() >= 3 && pc.cocks[0].cLength()/pc.tallness >= 1/6) 
		choices[choices.length] = 1;
	if(pc.hasTailCunt() && !tailPussied) choices[choices.length] = 2;
	if(pc.canAutoFellate(x)) 
		choices[choices.length] = 3;
	if(pc.biggestTitSize() >= 5) choices[choices.length] = 4;
	if(choices.length == 0) choices[choices.length] = 0;
	var select:int = choices[rand(choices.length)];
	//Nipplefuck
	if(select == 1) {
		nippleFucked = true;
		output("\n\nThe excitement builds inside you, but you aren't yet ready to cum. You've got wonderful little [pc.nipples] perfectly made to assist in this task, and you're ");
		if(pc.cocks[0].cLength()/pc.tallness >= 1/5) output("plenty ");
		output("long enough to pull it off. Bending forward, you lower your [pc.fullChest] to line up ");
		if(pc.cockTotal() > 2) output("the pulsating phalluses lucky enough to be in your hands");
		else output("the dual phalluses");
		output(" with your chest-mounted dick-pleasers. When the paired pairs of sexual organs make contact, the resulting electric tingle nearly causes you to jerk them out of alignment. You manage to hold firm... barely, leaning down and pushing one [pc.cockHead] in your left side and one [pc.cockHead 1] in the other. Once you've sunk a few inches of phallic flesh directly into your ");
		if(!pc.hasLipples()) output("squeezing cunt-nipples");
		else output("suckling, fellating lipples");
		output(", you hold your position, jacking up and down the exposed lengths while shifting your posture slightly to ensure there's a constant deluge of sensation assaulting the sensitive, paired glans.");
		if(pc.totalNipples() > 2) output(" If only you had more hands to guide the rest into your other unoccupied tit-twats.");
	}
	//Single tailpussy, assumes the earlier tailpussy thing didn't happen. Requires a cock that fits.
	else if(select == 2) {
		tailPussied = true;
		output("\n\n");
		if(pc.tailCount > 1) output("One of y");
		else output("Y");
		output("our [pc.tail] arcs around while you are handling your [pc.cocks] in a way that reminds you vaguely of a snake's sinuous slithering, only with dripping pussy-juice in place of baleful hissing. It quickly snaps down onto [pc.oneCockHead], butting its outstretched folds against it before parting them with a quick thrust downward, devouring much of the shaft. You throw back your head and moan out at the overwhelmingly blissful gratification of fucking a pussy and having an overly-sensitive pussy fucked all at the same. Meanwhile, the greedy tail-twat pushes down until it hits your fast-pumping knuckle, and there, it stops, squeezing tight and beginning to ripple in heavenly contractions that threaten to milk every drop of pre-cum from your body.");
	}
	//Hugecock lick - 1/6th body height and less than 1/2 body height or prehensile!.
	else if(select == 3) {
		sucked = true;
		output("\n\nAs you stroke, the gleaming, sensitive [pc.cockHead " + x + "] of your [pc.cock " + x + "] bounces ");
		if(pc.cocks[x].cLength()/pc.tallness < 1/2.5) output("at the bottom of your view, desperate for attention.");
		else output("in front of your [pc.face], so hard and needy, practically begging for attention.");
		output(" You humor it by ");
		if(pc.cocks[x].cLength()/pc.tallness >= 1/2.5) output("bending the anxious, phallic peak toward your mouth");
		else output("bending down toward the anxious, phallic peak");
		output(", planting a gentle kiss upon it. It immediately returns the kiss with a dollop of warm, wet pre-cum, sliming your [pc.lips] in a cock-gifted shine. You playfully extend your [pc.tongue] and lick around the circumference of your crown in slow circuits of wonderfully fellatic pleasure, swallowing whatever juices your member sees fit to express its joy with.");
	}
	//Titfuck - needs DD cups or higher and a dick at 1/6th height
	else if(select == 4) {
		titFucked = true;
		output("\n\nYou decide to help yourself out by squishing ");
		if(pc.totalcThickness() <= 6) output("all of your tools");
		else {
			if(pc.cockTotal() == 2) output("both");
			else output("two");
			output(" of your [pc.cocks]");
		}
		output(" into your cleavage and wrapping your arms around the whole mass, pinning the pre-leaking pricks into a valley of soft, supple [pc.skinFurScales] that you never want them to escape from. Once secure, you bounce yourself up and down along your lengths by leaning forward and back, letting your heavy breasts jiggle and shake around their charges, smothering yourself in the warm heaven of a bountiful bosom. It's so damn good that you have a hard time hanging to your senses - excepting touch, of course.");
	}
	//Can't quality for anything special, get half-assed scene.
	else {
		output("\n\nAt first, you try to keep your pace fairly steady, but the longer you go, the longer you stroke, the more anxious and jerky your hands become. Your [pc.hips] occasionally twitch as well, and your [pc.legOrLegs]");
		if(pc.legCount == 1) output(" is");
		else output(" are");
		output(" soon shaking in excitement. Moaning, you pick up the tempo, pumping [pc.eachCock] with long, furious strokes. You feel almost possessed by the building pleasure (and consummately increasing pressure), forced past the point where you could stop if you wanted to. Now, the brake handle has snapped off, and you're on a one-way train to ecstasy.");
	}
	//Stock pre-orgasm message
	if(pc.balls > 0) {
		output("\n\nYour [pc.balls] ");
		if(pc.balls > 2) output("start to lurch and churn");
		else output("starts to lurch and churn");
		output(" in your tightening [pc.sack] as a satisfying warmth spreads through your core, squeezed through internal passageways by involuntary clenching and contracting muscles.");
	}
	else output("\n\nThe muscles in your abdomen abruptly begin to tighten and contract, squeezing in ways that make your [pc.cocks] jump in your hands, and you feel a building sense of warmth that's spreading through your core.");
	output(" The further the heat spreads, the better it feels, and at the same time, the more you feel like you NEED to cum... to release all that pent-up, rising wave of passion before it overwhelms you.");
	//JIZZBOMB!
	output("\n\n");
	//Bits for tailpussies/tailpussy
	if(tailPussied) {
		var singular:Boolean = (pc.tailCount == 1 || pc.tailCount < pc.cockTotal() - 2);
		if(!singular) {
			output("Your [pc.cum] erupts into the suckling, fluid-hungry entrances your [pc.tailCunts] provide, ");
			if(pc.cumQ() <= 5) output("giving them a tiny appetizer.");
			else if(pc.cumQ() <= 10) output("giving them a tasty snack.");
			else if(pc.cumQ() <= 50) output("filling them with a tail-filling meal.");
			else if(pc.cumQ() <= 150) output("flooding them with a tail-bloating feast.");
			else output("filling them to such a degree that much of your ejaculate backwashes out the entrances as they weakly detach, too full for more.");
		}
		else {
			output("Your [pc.cum] erupts into the suckling, fluid-hungry entrance your [pc.tailCunt] provides, ");
			if(pc.cumQ() <= 5) output("giving it a tiny appetizer.");
			else if(pc.cumQ() <= 10) output("giving it a tasty snack.");
			else if(pc.cumQ() <= 50) output("filling it with a tail-filling meal.");
			else if(pc.cumQ() <= 150) output("flooding it with a tail-bloating feast.");
			else output("filling it to such a degree that much of your ejaculate backwashes out the entrance as it weakly detaches, too full for more.");
		}
		output(" ");
	}
	//Bits for titfuck
	else if(titFucked) {
		if(pc.cumQ() <= 5) output("A few weak droplets of cum leak into the space between your breasts, the only proof of your ecstasy.");
		else if(pc.cumQ() <= 30) output("Splashes of [pc.cum] splatter across the tops of your quivering jugs as you unload, [pc.cumColor]-washing your chest with your passionate fluid.");
		else if(pc.cumQ() <= 150) {
			output("Large spurts of [pc.cum] fire out of [pc.eachCock], to drench your chest with a coat of [pc.cumColor] that drips off the sides in long rivulets. Some even lands ");
			if(pc.isBald()) output("on your head");
			else output("in your [pc.hair]");
			output(" to drip down over your eyes.");
		}
		else {
			output("Torrential geysers of [pc.cum] erupt from each of your tit-enclosed [pc.cockHeads], painting you in thick cock-juice from your head to your waist.");
			if(pc.cumQ() >= 1000) output(" It drips everywhere, and yet there always seems to be more shooting out of your tit-enclosed phalluses.");
		}
	}
	//Bits for suckin dat shit
	else if(sucked) {
		output("Your orgasm bursts right out of your [pc.cockHead] and into your mouth");
		if(pc.cumQ() <= 5) output(", leaving a drop of [pc.cum] for you to savor as you ride out the culmination of your masturbation session.");
		else if(pc.cumQ() <= 15) output(", leaving you with a few nicely-sized blobs of [pc.cum] to swallow as you ride out the culmination of your masturbation session.");
		else if(pc.cumQ() <= 50) output("filling your cheeks with a hot load of liquid bliss for you to hurriedly gulp down.");
		else if(pc.cumQ() <= 200) output("flooding your cheeks with so much that you have to hurriedly gulp to keep it from leaking out your [pc.lips].");
		else if(pc.cumQ() <= 750) output("stuffing your cheeks with so much that even with you hurriedly gulping there's still blobs of [pc.cumColor] squrting at leaking out of the corners of your mouth, making a mess of your face and your cock.");
		else output("flooding your cheeks so effectively with the first pulse that the second pushes your mouth clean off your [pc.cockHead], forcing you to get a head-drenching facial so thick that you're likely unrecognizable.");
		output(" ");
		pc.loadInMouth(pc);
	}
	//Bits for nipplefucking
	else if(nippleFucked) {
		output("Your [pc.chest] becomes sensuously, perfectly warm as your [pc.cocks] unload into your [pc.nipples], slicking their internal passages with a ");
		if(pc.cumQ() <= 5) output("dainty");
		else if(pc.cumQ() <= 50) {}
		else if(pc.cumQ() <= 150) output("large");
		else output("tunnel-flooding");
		output(" deposit of your liquid love. ");
		pc.loadInNipples(pc);
	}
	//Everybody gets dese
	if(!titFucked) {
		output("You slam your hands down to your ");
		if(pc.hasSheath(0) && pc.hasSheath(1)) output("sheaths");
		else if(pc.hasSheath(0) || pc.hasSheath(1)) output("base and sheath");
		else output("bases");
		output(" and squeeze tight as you orgasm. ");
		if(pc.cumQ() <= 5) output("[pc.Cum] shoots out in tiny, droplet-sized volleys. There's so little that you have to wonder if you should give your body time to recuperate or perhaps investigate something to decrease your refractory period.");
		else if(pc.cumQ() <= 25) output("[pc.Cum] launches out in average volleys, spilling droplets all over your [pc.belly] that combine into a fair-sized pool.");
		else if(pc.cumQ() <= 100) output("[pc.Cum] shoots out in thick ropes of creamy bliss, splattering across your [pc.fullChest] and [pc.belly] in such quantity that it would shame a human.");
		else if(pc.cumQ() <= 500) {
			output("[pc.Cum] fires out of your [pc.cockHeads] in such huge, long ropes that you practically end up painting your [pc.belly] and [pc.chest] in a thick layer of the stuff.");
			if(pc.cumQ() >= 250) output(" Small rivers of goo roll down your sides to puddle below you as your orgasm drags on.");
		}
		else {
			output("[pc.Cum] erupts in torrents, each shot easily as big as the totally ejaculate of a normal man and then some. It not only splatters your [pc.belly], but also your [pc.chest], shoulders, and [pc.face]. Again and again, the huge pulses of goop fire, not stopping until you are suitably soaked and your [pc.balls] ");
			if(pc.balls <= 1) output("is");
			else output("are");
			output(" significantly drained.");
		}
	}
	//Wrap-up, no new PG
	output(" Your [pc.legOrLegs] quiver");
	if(pc.legCount == 1) output("s");
	output(" and involuntarily thrust");
	if(pc.legCount == 1) output("s");
	output(" until you are spent, and then, you lie there, coated with your goo and grinning a sated smile.");
	if(pc.libido() <= 25) output("\n\nYou wipe up as best you can and gear up after a few minutes of rest, feeling like you can take on the world.");
	else if(pc.libido() <= 50) output("\n\nYou make a half-hearted attempt to wipe up before getting your gear back on and getting ready go back to exploring.");
	else if(pc.libido() <= 75) output("\n\nYou barely bother to clear your sexual juices from your body before getting dressed and getting back to exploring the universe for sexy aliens to fuck.");
	else output("\n\nYou get your gear back on without bothering to clean up. You're just going to find something to fuck anyway.");
	processTime(45 + rand(5));
	pc.orgasm();
	applyCumSoaked(pc);
	if(pc.cumQ() > 5000) applyCumSoaked(pc);
	if(pc.cumQ() > 10000) applyCumSoaked(pc);
	if(pc.cumQ() > 30000) applyCumSoaked(pc);
	if(pc.cumQ() > 50000) applyCumSoaked(pc);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//*Tailingus
public function tailingusFapReqsCuntTail():void {
	clearOutput();
	output("Figuring that you may as well blow off some steam while you have time, you shuck out of your gear and arrange it in a nearby pile, careful with your possessions even though you’re planning on getting some lewd self-satisfaction in. Your [pc.tail] curls ");
	if(pc.isTaur()) output("up your back and shoulder to place itself against your [pc.chest]");
	else output("around your [pc.legOrLegs] and [pc.hips] to place itself against your [pc.belly] when you seat yourself");
	output(", nuzzling gently at your [pc.skinFurScales] as if to entice you to grab it. Pulses of pleasant, soothing warmth emanate from the appendage. The euphoria is almost addictive; perhaps you should hang onto this tail.");
	output("\n\nThe end of your [pc.tailCunt] dilates slightly and its clit engorges nicely into a visible nub. Your heart beats faster as barely-controlled sexual excitement wells up inside you, bringing a blush to your [pc.skin] as you admire the way your undulating opening leaks clear lubricants all over you. The trail of slime it leaves on your [pc.chest]");
	if(pc.biggestTitSize() >= 1) {
		output(", snaking through your bosom");
		if(pc.bRows() > 1) output("s");
		output(",");
	}
	output(" is just so... strange and erotic that you can’t help but giggle in anticipation, licking your lips and grabbing hold of your [pc.tail] with both hands to steady it.");
	
	output("\n\nYour slit wobbles unsteadily on its pillar of flesh, and you work your muscles to angle it more perfectly towards your other lips, the ones barely concealing your mischievous tongue. Guiding it a little closer, you breathe in its scent, admiring the almost sweet tang that your [pc.tailCunt] gives off. Unable and unwilling to restrain yourself, you dive into the picture-perfect pussy in front of you, letting the lubed-up clit bounce off your nose and mark your face with your own fragrant juices.");
	
	output("\n\nA shudder of involuntary pleasure works through your body, and you begin to cunnilingate yourself even more eagerly, attacking your pussy with your tongue. You lick with eager, unrestrained strokes, plunging deeply before circling around the outer lips. Sometimes, you break up the tempo by suckling the clit into your mouth and whimpering in bliss; the vibrations make the wondrous feelings that much more intense. A gush of girlish goo splatters into your mouth, and you drink it without complaint. You swoon and lick your labia as clean as you can, but your [pc.tailCunt] just keeps leaking, dripping all over your [pc.chest].");
	
	output("\n\nOne of your hands begins to caress the length of your [pc.tail], stroking the [pc.skin] like some kind of pretend phallus, but it feels good all the same. The pressure squeezes the internal walls together, sliding fold against fold and nerves and nerves. You jerk your tailcunt compulsively while you eat it out, soaking yourself as the desire for more and more pleasure overwhelms you. Soon you’re grunting like an animal in heat, pumping so fast your hand is a blur and cramming as much of your [pc.face] into your [pc.tailCunt] as you can.");
	
	output("\n\nThe orgasm is almost a surprise when it comes. Your eyes roll back halfway, buried under your drooping eyelids. Your hand strokes down powerfully, gripping the wriggling, spasmatic appendage it begins to gush waves of lady-spunk across your face and tongue. You swallow a few gulps before you lose control and it pulls back, gushing girl-goo across your [pc.chest], [pc.belly], and crotch.");
	if(pc.hasCock()) {
		output(" [pc.EachCock] spurts semen fitfully as it’s doused with cunt juice, getting off in pure sympathy. The stuff drizzles all over your [pc.legOrLegs], turning you into quite the mess.");
	}
	if(pc.hasVagina()) output(" At the same time, [pc.eachVagina] clenches and cums as well, hungrily fluttering and squeezing, aching for penetration.");
	
	output("\n\nYou flop down onto your back and pull the [pc.tailCunt] back onto your face, licking the last of your libertine secretions from the well-served orifice. You bet it will feel even better to feed it cum.... Where did that thought come from?");
	output("\n\nCleaning up as best you’re able, you get geared back up and ready to move, though you can’t seem to get the smell of pussy off your breath.");
	processTime(10+rand(15));
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
//*Cunt tail fap replacement B
//Not 4 Hoarses.
public function cuntTailFapScene():void {
	clearOutput();
	var x:int = pc.cockThatFits(pc.tailCuntCapacity());
	if(x < 0) x = pc.smallestCockIndex();
	var y:int = -1;
	if(pc.cockTotal() > 1) {
		for(var z:int = 0; z < pc.cockTotal(); z++) {
			if(z != x) y = z;
		}
	}
	output("You figure that now is a good time to give into your erotic urges and shuck your gear, assembling it into a neat pile beside you. Your [pc.tail] slithers up over your shoulder almost of its own volition, clearly thirsting for a fresh dose of cum, and you intend to give it exactly what it deserves. Thickening nicely, [pc.eachCock] engorges to a hard and ready state. You idly fondle your tentacle-like tail, slipping a finger into its moist opening to test its readiness. It’s soaking wet, of course, and ready to fuck.");
	
	if(pc.cockTotal() > 1) output("\n\nSelecting [pc.oneCock]");
	else output("\n\nGrabbing your [pc.cock]");
	output(", you idly fondle yourself");
	if(pc.balls > 0) output(", playing your fingers across your [pc.balls] whenever you have a spare moment");
	output(", slowly enjoying the sensitivity of your skin. It pulses with ardor and thickens slightly, growing ever more tumescent thanks to your skilled fondles. You sigh and relax, leaning back while you pump a dollop of pre out from your " + pc.cockDescript(x) + ". It trickles down only to be caught by your fingers and turned into slippery lube. You stroke faster and faster, barely noticing as your [pc.tailCunt] moves downward, spattering its natural secretions across your lower body.");
	output("\n\nYour [pc.tail] slows as it nears your " + pc.cockDescript(x) + ". Slippery soft wetness envelops your " + pc.cockHead(x) + " a quarter of an inch at a time as it engulfs your boner, slurping down the drops of pre-cum you start leaking in response. Your tool is immersed in soft, slippery coils of flesh as the outside of your tail ripples and squirms around in ways that make you dizzy with lust.");
	
	//{One other dick}
	if(pc.cockTotal() == 2 && y != -1) 
	{
		output("\n\nLuckily, you have an extra " + pc.cockDescript(y) + " to handle while your tail works to coax your orgasm free");
		if(pc.balls > 0) output(" from your [pc.balls]");
		output(". The pleasure from your prehensile pussy increases in response to that thought, and you settle into stroking your spare dick, jacking yourself off with strokes that are perfectly timed to the slurping tempo next door. It’s soon dripping out as much pre-cum as your snatch-snared mast, and you smear the clear juice over yourself, masturbating with long, hot, wet strokes. You bite your lip and try to endure the pleasure, but it feels sooo good.");
	}
	//{Two+ other dicks}
	else if(y >= 0) {
		output("\n\nLuckily, you’ve got enough extra dicks to go around. You grab ");
		if(pc.cockTotal() > 3) output("two");
		else output("both other");
		output(" dongs to work while your tail tries to coax your orgasm free");
		if(pc.balls > 0) output(" from your [pc.balls]");
		output(", figuring you can climax harder and feed your tail the cum it craves sooner. In response, a wave of euphoria rolls up your vaginal appendage and tickles at your consciousness, rewarding you for your aid. The pleasure of your lewdly pumping tail grows stronger with each lurid squelch from your sexual congress. Pre-cum oozes out of your " + num2Text(pc.cockTotal() - 1) + " leaky cum-slits, slicking your palms as you stroke yourself, bubbling around your fingers with each subsequent pump.");
	}
	output("\n\nYour [pc.tailCunt] clamps down at your [pc.sheath " + x + "], and the rippling motions its squeezing innards make as they roll up intensify, coming faster and stronger before. The nub of your clit rubs against your pubic region when your beast-like tail wiggles around your " + pc.cockDescript(x) + " violently. It suctions harder and harder, pumping your prick up with fresh blood. Your [pc.legOrLegs]");
	if(pc.legCount == 1) output(" is");
	else output(" are");
	output(" twitching wildly from the pleasure, and you struggle to hold yourself still as a wave of excitement rises up in your middle.");
	if(pc.balls > 1) output(" Twitching against you, your [pc.balls] bounce in their [pc.sack] as they ready a deluge of liquid love.");
	else if(pc.balls == 1) output(" Twitching against you, your [pc.balls] bounces in its [pc.sack] as it readies a deluge of liquid love.");
	
	output("\n\nPleasure slams into your skull with cannon-like force, launched from your tail, straight up your spine, and into your brain where it shatters into a concussive explosion of ecstasy. Your abdominals clench with your orgasm and move your creamy payload towards its eventual terminus, causing warm pressure to build and then release. A huge rope of [pc.cum] launches from you, and at the same time you get to feel the wonderful, blissful experience of having your tail stuffed with a juicy, delicious payload. Each ejaculation causes it to suck harder and faster, dragging your orgasm on longer");
	if(pc.cockTotal() > 1) {
		output(", while your other dick");
		if(pc.cockTotal() > 2) output("s launch their contributions");
		else output(" launches its contribution");
		output(" into the air. The [pc.cumColor] globules hang at the zenith of their parabolic arc for a perfect, blissful moment before they fall down in sexy splatters");
	}
	output(".");
	if(pc.cumQ() >= 500) output(" Your prehensile protuberance bloats from your large deposits, eventually giving up on milking you and pulling off to lamely drool [pc.cum] from its gaped orifice on the ground.");
	if(pc.cumQ() >= 1000) output(" You keep squirting even after all that, painting your [pc.belly] and [pc.fullChest] with the leftovers");
	if(pc.cumQ() >= 2000) output(", even though there’s so much that it puddles and runs off of you, collecting into a small lake around your [pc.butt]");
	if(pc.cumQ() >= 1000) output(".");
	output("\n\nSatisfaction radiates from your entire body in response, but the amount coming from your tail is disproportionately large, enough that you lie there panting while your [pc.tail] digests its load, dreamily toying with [pc.eachCock] until you settle down.");
	pc.loadInCuntTail(pc);
	pc.orgasm();
	processTime(20+rand(10));
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Gettin' Ready
public function milkturbation():void
{
	clearOutput();
	var milked:Boolean = false;
	author("Fenfen MilkCo.");
	//Passing time first for cheatsiedoodles.
	processTime(10+rand(5));
	//No top
	if(pc.isChestExposed())
	{
		output("Going around uncovered certainly makes it easier to get ahold of your ");
		if(pc.milkFullness >= 200) output("achy, leaking teats");
		else if(pc.milkFullness >= 150) output("[pc.milkNoun]-bloated teats");
		else if(pc.milkFullness >= 100) output("swollen nips");
		else if(pc.milkFullness >= 75) output("engorged tips");
		else if(pc.milkFullness < 25) output("sore nips");
		else output("[pc.nipples]");
		output(", something you're more than thankful for since you started lactating.");
	}
	//Clothed
	else
	{
		output("Modesty is all well and good, but it's a pain in the ass to strip out of your [pc.upperGarments] just to drain your ");
		if(pc.milkFullness >= 200) output("achy, leaking teats");
		else if(pc.milkFullness >= 150) output("[pc.milkNoun]-bloated teats");
		else if(pc.milkFullness >= 100) output("swollen nips");
		else if(pc.milkFullness >= 75) output("engorged tips");
		else if(pc.milkFullness < 25) output("sore nips");
		else output("[pc.nipples]");
		output(".");
	}
	//Merge
	if(!InShipInterior())
	{
		output(" Looking around to ");
		if(pc.libido() >= 75) output("make sure you've got an audience");
		else output("make sure no one is looking too closely");
	}
	else output(" Setting comfortably in a quiet corner");
	output(", you grab your [pc.chest] and squeeze, rubbing gently towards your [pc.nipples] to coax yourself into letting down. The lactating flesh feels wonderful in your hands, and you shudder with barely suppressed delight at how good it feels to get yourself ready.");

	//No Milk, Bra. Try but fail. Minor lust increase.
	if(!pc.isLactating() && pc.milkQ() < 200) 
	{
		output("\n\nYou work your chest with rhythmic, ");
		if(flags["TIMES_HAND_MILKED_SELF"] == undefined || flags["TIMES_HAND_MILKED_SELF"] < 4) output("almost ");
		output("practiced motions again and again, pinching your [pc.nipples] to try to squeeze out some [pc.milk]. However, all that you manage to do is make yourself irritated and sore. Whining in frustration, you tug harder at yourself, desperate to squeeze even a little bit of your [pc.cumColor] tit-cream out. It doesn't work though; you'll have to give your body time to build some up first.");
		pc.lust(5+rand(3));
		pc.boostLactation(1);
	}
	//Milk Success!
	//Look at all these bitchin' options
	else
	{
		milked = true;
		//Holy shit yer tits are full intro
		if(pc.milkFullness >= 125)
		{
			output("\n\n[pc.Milk] beads on your [pc.nippleColor] teats at the first touches, and just like that, your saturated bosom lets loose. An eager sigh slips through your [pc.lips] at the sudden release of pressure. You feel like a ");
			if(pc.totalBreasts() == 2) output("pair");
			else if(pc.totalBreasts() == 3) output("trio");
			else if(pc.totalBreasts() == 4) output("quartet");
			else output("army");
			output(" of soda bottles that have been shaken and had the caps unscrewed - so full of potential energy needing to leak and spray everywhere. That's precisely what you do: spray. Liberal amounts of [pc.milk] are rushing out in thin streams, but they're too fine to vent all of your pressure any time soon. You'll have to milk it all out by hand.");
		}
		//Fuck you needed some relief intro
		else if(pc.milkFullness >= 175)
		{
			output("\n\nIt does not take more than a second or two to make your [pc.nipples] shine with their own moisture, but you keep working yourself all the same. [pc.MilkColor] droplets hang from the tips of your tingling teats. You catch them in your palms and use them to lubricate your hands’ motions across your [pc.fullChest]. Soon, thin streams are spraying out even when you aren't squeezing. Your chest is clearly overdue for a good milking.");
		}
		//It was about time you tended to these tits intro
		else if(pc.milkFullness >= 90)
		{
			output("\n\nJudging by how full they feel, you've left them untended a little too long. It doesn't take long to tap the swollen milk-tanks; [pc.milk] bubbles out into a few pendulous droplets as you tug. You smear it over your [pc.nipples] as you work them, tugging and pulling until thin streams of [pc.milkColor] are arcing through the air with every movement of your hands. There's no disguising your sigh of relief or the mess you're starting to make now that you've gotten started.");
		}
		//Normal milking intro
		else if(pc.milkFullness >= 40)
		{
			output("\n\nPerhaps a minute passes; you can feel the liquid slowly moving inside of you, letting down towards your [pc.nipples]. You groan when the moisture hits your questing fingertips, lubricating their busy strokes across your bust. The [pc.milk] is soon leaking out enough to form droplets on the ends of your teats. You smile down at yourself, gloating over your own [pc.milkColor]-leaking chest as you get ready to drain your [pc.fullChest].");
		}
		//Gotta work pretty hard to start intro
		/*else {
			output("\n\nNo amount of tugging, squeezing, and pulling seems to be making any difference. You know you have some [pc.milk] inside you, not much but certainly enough to lactate. If only you could get it started! Groaning softly as your efforts turn your [pc.nipples], you keep at it with a persistence born of lactic desire. Dribbles of moisture trickle out eventually. To you, they're the texture of success, and you beam with enjoyment as you prepare to drain the rest.");
		}*/
		//Middle: Express a small amount of milk for a human
		if(pc.milkQ() < 300)
		{
			output("\n\nThe [pc.milk] comes out in slow dribbles and occasional squirts, running down your fingers to your knuckles before dripping off. Deciding to have a little fun with it, you start milking yourself more vigorously, spraying thin streams of the stuff this way and that, " + pc.mf("chuckling","giggling") + " in delight.");
			if(pc.biggestTitSize() >= 5)
			{
				output(" You even lift a [pc.chest] to your [pc.lips] and suckle some of your bounty from the tap.");
				pc.milkInMouth(pc);
			}
			else output(" You find yourself wishing your [pc.chest] were big enough to bring to your [pc.lips]. You'd like a taste, however brief.");
		}
		//Middle: Express a normal amount of milk for a human
		else if(pc.milkQ() <= 1000)
		{
			output("\n\nThe [pc.milk] comes out in steady streams and squirts, running down your fingers ");
			if(pc.biggestTitSize() >= 1) output("and [pc.chest] ");
			output("before dripping off. There seems to be plenty of it there, enough to feed a baby for sure, and you tend to your dripping nipples with consistent, busy pressure, making [pc.milkColor] puddles form by your [pc.feet].");
			if(pc.biggestTitSize() >= 5)
			{
				output(" You lift one to your [pc.lips] and drink deeply of your bounty. It floods your cheeks with its [pc.milkFlavor] flavor, and you greedily gulp it down.");
				pc.milkInMouth(pc);
			}
			else output(" You kind of wish you were big enough to drink it directly, just to sample it.");
		}
		//Middle: Express a large amount of milk for a human
		else if(pc.milkQ() <= 1600)
		{
			output("\n\nThe [pc.milk] comes out under your attentions in heavy drops and thick streams, splattering wetly on the floor with each exaggerated pump of your hands. It runs over your arms in thick streams. There's no way to avoid making a mess when you're producing this much, so you go with it, letting the [pc.milkColor] fluid run down your chest and [pc.belly]. Most terran mothers couldn't come anywhere close to your lactic prowess unaided.");
		}
		//Middle: Express milk like a cow (low)
		else if(pc.milkQ() <= 3000)
		{
			output("\n\nThe [pc.milk] forms into puddles between your [pc.feet] while you're still getting started, and as you settle into giving yourself a proper milking, they only get bigger. Streams of [pc.milkColor] spill down your forearms to your elbows before falling off in rivers. You groan in animal pleasure, unable to help yourself; there's just so much coming out of you, and it feels like such a relief. The human body wasn't made to gush like this, but isn't science wonderful?");
			if(pc.biggestTitSize() >= 5)
			{
				output(" Grabbing a teat, you lift it to your [pc.lips] for a sample. The flow is strong enough to flood your cheeks in spite of your gluttonous swallowing. Eventually you have to let go. Streamers of [pc.milk] come out in a spray.");
				pc.milkInMouth(pc);
			}
			else output(" Wishing you could lift a teat to your mouth to sample from, you tug with wild abandon, squeezing heavier and heavier flows from your body.");
		}
		//Middle: Express milk like a fucking cow
		else if(pc.milkQ() <= 7000)
		{
			output("\n\nThe [pc.milk] almost immediately gathers into deep puddles around your [pc.feet] as you extract the wondrous fluid. Cows and cow-like creatures are your only competition when it comes to unbridled lactation, and even then, you're sure such base creatures could never appreciate the heavenly sensations of it rolling down the underside of your [pc.chest] and arms. ");
			if(pc.biggestTitSize() >= 5)
			{
				output("Lifting one of your udders to your [pc.lips], you gleefully gulp the [pc.milkFlavor] liquid down. You let it fall away after a few swallows with a satisfied 'ahhh,' sating both your hunger and your need to empty your chest.");
				pc.milkInMouth(pc);
			}
			else output("Aiming down, you splatter more and more of your lactic cargo into the budding lake while wishing you could sample it yourself. If only your chest was bigger!");
		}
		//Middle: Express milk like a pent-up cow-girl
		else if(pc.milkQ() <= 10000)
		{
			output("\n\nThe [pc.milk] is expressed with blatantly super-human speed, puddling around your [pc.feet] with such speed that it splatters all over your [pc.legOrLegs]. The highly-modified indentured servant-girls of Venusia and their legendary milk-making capabilities would find themselves in a run for their money if pitted against you. As the fluid spills over your arms and [pc.fullChest] in small, frothy rivers, you realize that you could probably retire to such a life right now, if you wanted.");
			if(pc.biggestTitSize() >= 5)
			{
				output(" You mull it over as you lift a heavy teat to your lips, inadvertently hosing yourself down while trying to seat your mouth, managing a tight seal just in time to receive a mouthful of [pc.milkFlavor] flavor. You guzzle for a little while to fill your belly and burp noisily when you finish, still pouring more into the lake.");
				pc.milkInMouth(pc);
			}
		}
		//Middle: Express milk like a milk machine in the cafeteria
		else if(pc.milkQ() <= 20000)
		{
			output("\n\nThe [pc.milk] sprays out like soda from a fountain, foaming from its own incredible pressure as it escapes you. You ");
			if(pc.legCount <= 1) output("shift position");
			else output("spread your [pc.legs]");
			output(" to stop the inevitable splatters from soaking your lower body as you express the stuff with machine-like efficiency, flooding the area with more [pc.milk] than an organic has any business creating. There's so much that you can't help but stifle a smile; there isn't a cow-girl or alien in the galaxy that could keep up with you.");
			if(pc.biggestTitSize() >= 5)
			{
				output(" Lifting one weighty teat to your lips, you coat your chin and mouth immediately, getting a nice full draught of [pc.milkFlavor] to sample for your troubles.");
				pc.milkInMouth(pc);
			}
		}
		//Middle: Express milk like a someone in a furry's hyper story
		else if(pc.milkQ() <= 100000)
		{
			output("\n\nThe [pc.milk] gushes out of you in ");
			if(pc.totalNipples() == 2) output("twinned");
			else output("matched");
			output(" geysers, foaming and splattering from the liquid force, so powerful and yet so pleasant-feeling all at once. Holding onto your [pc.chest] for dear life, you give tentative, encouraging squeezes whenever your firehose-like lactation slows, instantly restarting the flagging [pc.milkColor] deluge. Your fingers sometimes find their way to your [pc.nipples] where they can playfully tug and caress the milk-slicked spouts, ignorant of the lake rising up around your [pc.legOrLegs]. Someone is going to have to clean all this up, but that's a problem for someone who isn't experiencing the incredible relief of squeezing out gallons of delicious [pc.milkNoun].");
		}
		//Middle: Express milk like you have debug mode on
		else
		{
			output("\n\nThe [pc.milk] explodes out of you like matter from a quasar, the overwhelming lactic mass practically a singularity of liquid fulfillment. You barely have to touch your [pc.chest] to keep it going once it starts. Your [pc.nipples] quiver and pulse as they disgorge the torrential [pc.milkColor] rivers. So much flows from you that you're soon lifted on a tide of your own making, floating in blissful relaxation while you shower yourself with even more, listening to the gentle patter of your rain impacting your new-born lake. Tugging nonstop, your fingers do their best to keep the milk eruptions going, or perhaps you're merely reveling in the sensation, stimulating yourself to a plateau of gushing bliss.");
		}
		//Orgasm Odds
		//10% per 400 mLs over 1L. So: 2L: 25%, 4L: 75%, etc
		var orgasmOdds:int = 0;
		if(pc.milkQ() >= 1000) orgasmOdds += (pc.milkQ() - 1000) / 40;
		if(pc.isTreated()) orgasmOdds = 100;
		var orgasmed:Boolean = (rand(100) + 1 <= orgasmOdds);
		//End: Didn't orgasm due to not enough milking (20% or less chance of orgasm)
		if(!orgasmed && orgasmOdds <= 20)
		{
			output("\n\nSlowing to a trickle as your supply exhausts itself, your " + possessive(pc.chestDesc()) + " flow finally gives up in spite of your relentless tugging. You've milked out as much as you can by hand, leaving yourself with sore, glossy nipples and a moistened front. Tending to such a sensitive area has left you with a certain residual warmth in your [pc.crotch]");
			pc.lust(10+rand(4));
			if(pc.lust() < pc.lustMax()) output(", but it's not unmanageable.");
			else {
				output(", and you're going to have to masturbate immediately if you want to have any chance of thinking straight in the near future.");
			}
		}
		//End: Got really close to orgasm but couldn't quite get there -> Immediately choose a random fap scene for next (had a chance above 20%)
		else if(orgasmOdds > 20 && !orgasmed)
		{
			output("\n\nMoaning as your flow gradually tapers off, your fingers go wild on your [pc.chest], tugging, squeezing, and pulling in an effort to take you to orgasm. Milking has felt so good, so wonderfully, sensuously swell, that you've let yourself grow aroused beyond reason. Your slick teats ache from the constant stimulation, but it's a wonderfully satisfying ache that sends tingles of ");
			if(pc.hasVagina()) output("crotch-dampening ");
			else if(pc.hasCock()) output("cock-thickening ");
			else if(pc.balls > 0) output("ball-teasing ");
			output("warmth to your most sensitive areas. You grind your [pc.hips] and cry out in need as the last droplets of [pc.milk], leaving you unfulfilled and delirious with need.");
			output("\n\n<b>You start masturbating before the thought even reaches your brain. You have to.</b>");
			pc.lust(9001);
		}
		//End: Minor orgasm all up in
		else if(pc.milkQ() <= 5000)
		{
			output("\n\nGroaning as the pleasure of it all wells up in your breast, you let your hands do as they will, mauling your [pc.chest] with eager squeezes, wringing every last drop of [pc.milk] out. Each tug on a sore teat is a percussive pleasure note against the backdrop of your chest's sensuous symphony, building inexorably towards what can only be a climax. You moan");
			if(pc.hasPerk("Ditz Speech") || pc.hasPerk("Brute Speech")) output(" brainlessly");
			output(" as the last few drops fall away, pinching harder, the pain and pleasure all mixing together to make you quiver with bliss. You sag back in the wake of it, a satisfied smile on your [pc.lips].");
		}
		//End: Mooing cow-gasm all up in
		//This one is for cow-girls. Requires boobs.
		else if(pc.hasBreasts() && pc.cowScore() >= 4)
		{
			output("\n\nMooing at the ecstatic release that only milking can provide, your body responds to the sensation of emptying its [pc.milk] reservoirs in the only way it knows: bombarding you with blissful tremors of bovine pleasure. You moo again, louder and firmer than the first time. The first time was an instinctual vocalization. This time, it's a intentional declaration of your very purpose. Your [pc.chest] and the pleasure are gifts given to you so that you can make as much [pc.milk] to share with the galaxy as possible. Your eyes roll back, ");
			if(pc.hasVagina())
			{
				output("your [pc.vaginas] gush");
				if(pc.totalVaginas() == 1) output("es");
				output(", ");
			}
			if(pc.hasCock())
			{
				output("your [pc.cocks] squirt");
				if(pc.cockTotal() == 1) output("s");
				output(", ");
			}
			output("your [pc.legOrLegs] quiver");
			if(pc.legCount == 1) output("s");
			output(", and your flow finally ends, leaving you messy but totally sated. You can't wait to lactate again.");
		}
		//End: Shuddering, milky messgasm - non-cow
		else
		{
			output("\n\nTwitching whenever your fingers pinch particularly aggressively, you feel the pleasure rising up in inverse proportion to the amount of [pc.milk] left inside you. You maul your own [pc.chest], panting, your eyes rolling back as the ecstasy overwhelms your consciousness.");
			if(pc.hasPerk("Ditz Speech")) output(" Airheaded giggles mix with your moans, declaring your status as a climax-addled milk-slut for the universe to see.");
			output(" The oiled slickness of your [pc.chest] makes your gropes all the more pleasant. Your misused nerves fire spasmodically, feeding your immense boobgasm until you're panting and gasping, your whole body shuddering in wild convulsions.");
			//Dick
			if(pc.hasCock())
			{
				output("\n\n[pc.Cum] sprays from your [pc.cocks] in lewd waves, unable to hold back with how good you're feeling. The hands-free ejaculation seems to keep going as long as you can keep your breasts cumming");
				if(pc.cumQ() <= 100) output(", though it rapidly diminishes to little more than dick-shakes and slow-leaking droplets.");
				else output(", spurting quite a bit of [pc.cum] everywhere.");
			}
			//Pussy
			if(pc.hasVagina())
			{
				output("\n\nDespite being entirely left out, your [pc.vaginas] reach");
				if(pc.vaginaTotal() == 1) output("es its");
				else output(" their");
				output(" own pleasure plateau. [pc.GirlCum] ");
				if(pc.isSquirter())
				{
					if(pc.lowerUndergarment.shortName != "") output("floods your " + pc.lowerUndergarment.longName + " with sticky love");
					else 
					{
						output("floods out of your uncovered entrance");
						if(pc.totalVaginas() > 1) output("s");
						output(", squirting sticky love into the air in glittering arcs");
					}
				}
				else 
				{
					if(pc.lowerUndergarment.shortName != "") output("soaks your " + pc.lowerUndergarment.longName + " with fragrant feminine love");
					else output("soaks your [pc.thighs] with your fragrant feminine love");	
				}
				output(". Your lower lips and [pc.clits] feel positively swollen as ");
				if(pc.totalVaginas() > 1) output("each of ");
				output("your canal");
				if(pc.totalVaginas() > 1) output("s");
				output(" squeezes around phantom intruders, climaxing back to back.");
			}
		}
		if(flags["TIMES_HAND_MILKED_SELF"] == undefined) flags["TIMES_HAND_MILKED_SELF"] = 0;
		flags["TIMES_HAND_MILKED_SELF"]++;
		if(orgasmed) pc.orgasm();
		pc.milked(pc.milkFullness);
	}
	//Force faps
	if(!orgasmed && milked && pc.lust() >= pc.lustMax())
	{
		clearMenu();
		addButton(0,"Next",masturbateMenu,true);
	}
	else
	{
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
}

public function removeBoobswellPads():void
{
	clearOutput();
	author("Fenoxo");
	pc.removeStatusEffect("Boobswell Pads");
	output("You peel the pads off your chest and breathe a sigh of relief now that the constant moisture and vibration is no longer rubbing at your [pc.nipples].\n\n<b>The boobswell pads shut down, their use expended.</b>");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function wutwutindabuttbuttFap():void
{
	clearOutput();
	author("Couch/Gedan");

	// {Clothes:
	if (!pc.isNude())
	{
		output("Your gear quickly finds itself thrown into an assorted pile of all manner of equipment, item after item being discarded to a soundtrack comprising of clattering metal and hollow thunks;");
		if (pc.hasArmor())
		{
			output(" your [pc.armor] finds itself added to the pile at a rapid pace");
			if (pc.hasLowerGarment() || pc.hasUpperGarment()) output(", closely followed by");
		} 
		if (pc.hasUpperGarment()) output(" your [pc.upperUndergarment]");
		if (pc.hasUpperGarment() && pc.hasLowerGarment()) output(" and");
		if (pc.hasLowerGarment()) output(" your [pc.lowerUndergarment]");
		if (!pc.hasArmor())
		{
			output(" quickly find");
			if (pc.hasUpperGarment() && pc.hasLowerGarment()) output(" themselves");
			else output(" itself");
			output(" added to the pile")
		}
		output(".");

		output("\n\nFreshly free from the confines of your clothes, y");
	}
	else
	{
		output("A quick fiddle with your [pc.gear], and a muted clatter soon follows as it finds itself hastily discarded. Finally you're free to truly enjoy being nude; not a single scrap of material clinging to your frame. No unsightly claps, no constricting holsters... freedom.");

		output("\n\nY");
	}

	if (pc.hasCock() && !pc.hasVagina())
	{
		output("our gaze wanders over [pc.eachCock]. You idly give [pc.oneCock] a teasing tug with one of your hands,");
	}
	else if (pc.hasVagina() && !pc.hasCock())
	{
		output("ou can feel [pc.eachVagina] wet and ready for something to pound");
		if (pc.vaginas.length == 1) output(" it");
		else output(" them");
		output(". You idly give [pc.oneVagina] a tantilizing stroke,");
	}
	else if (pc.hasCock() && pc.hasVagina())
	{
		output("our gaze wanders over your [pc.cocks] as a trickle of arousal meanders down the inside of your thigh, only serving to remind you that there's no shortage of choices to be made when it comes to relieving a little... tension.... You give [pc.oneCock] a teasing tug with one hand and [pc.oneVagina] a tantalizing stroke with the other,");
	}
	else
	{
		output("ou briefly rub your hand over the smooth and featureless mound between your [pc.thighs].");
	}
	
	if (pc.hasCock() || pc.hasVagina())
	{
		output(" but there's an itch that's been bothering you for the last few hours, and it's time to take care of it.");
	}

	output("\n\nYou draw your hands away from");
	if (pc.hasCock()) output(" your half-rigid cock");
	if (pc.cocks.length > 1) output("s");
	if (pc.hasCock() && pc.hasVagina()) output(" and");
	if (pc.hasVagina())
	{
		output(" your");
		if (pc.wettestVaginalWetness() <= 2) output(" damp");
		else if (pc.wettestVaginalWetness() <= 4) output(" sodden");
		else output(" drooling");
		output(" cunt");
		if (pc.vaginas.length > 1) output("s");
	}
	if (!pc.hasCock() && !pc.hasVagina()) output(" your groin");
	output(" and move them behind you, your digits nestling themselves between your [pc.butts].");

	//{pc.ass.looseness() <= 3
	if (pc.ass.looseness() <= 2)
	{
		output("\n\nOwing to your lack of");
		if (silly) output(" butt-stuff");
		else output(" anal");
		output(" experience,"); 

		if (pc.ass.wetness() >= 2) 
		{
			output(" you circle your fingertips around your wet bum, making sure to collect");
			if (pc.ass.wetness() >= 3) output(" a liberal amount of lubrication");
			else output(" as much lubrication as you can muster");
			output("; you have a feeling you'll need all the help you can get.");
		}
		else if (pc.hasVagina())
		{
			output(" you take advantage of your [pc.vagina " + pc.highestWetnessIndex() + "] and coat your fingers with a");
			if (pc.wettestVaginalWetness() >= 3) output(" liberal");
			output(" quantity of [pc.girlCum]; you have a feeling you'll need all the help you can get.");
		}
		else if (pc.hasCock())
		{
			output(" you take advantage of your [pc.cock] and trail your fingers lazily along its length; scooping up some of the [pc.cumColor] pre-cum drooling from its [pc.cockHead].")
		}
		else
		{
			output(" you divert one of your hands to your mouth and take a moment to");
			if (pc.ass.looseness() <= 1) output(" liberally");
			output(" slaver a finger with spittle; you have a feeling you'll need all the help you can get.");
		}

		if (pc.ass.looseness() <= 1)
		{
			if(pc.ass.wetness() < 2) output("\n\nProperly prepared, you use a solitary, lubricated finger to gingerly ply at the ring of your [pc.asshole], encountering plenty of resistance in the process.");
			else output("\n\nYou gingerly ply at the ring of your [pc.asshole] with your slicked fingers, encountering plenty of resistance in the process.");
		}
		else
		{
			if(pc.ass.wetness() < 2) output("\n\nProperly prepared, you gently prod at your [pc.asshole] with your lubricated fingers, carefully easing the tips past the tight ring.");
			else output("\n\nYou gently prod at your [pc.asshole] with your slicked fingers, carefully easing the tips past the tight ring.");
		}
	}
	else if (pc.ass.looseness() <= 4)
	{
		output("\n\nYour fingers tease at your [pc.asshole], slipping inside your cock-hungry ass with little effort.");
	}
	else
	{
		output("\n\nYour fingers poke at your [pc.asshole], swallowed whole in short order by your well-trained and cock-famished ass. You could probably slip your whole hand in without much effort....");
	}

	output("\n\nYou've soon");
	if (pc.ass.looseness() <= 2) output(" worked");
	else output(" slipped");
	output(" your finger");
	if (pc.ass.looseness() > 1) output("s");
	output(" in all the way, the bulk of your palm now stopping any further progress as you start to wriggle the invading digit");
	if (pc.ass.looseness() > 1) output("s");
	output(" around inside your [pc.asshole]");
	if (pc.hasCock())
	{
		output(", searching for the bump of your prostate. With a little stretch from");
		if (pc.ass.looseness() > 1) output(" one of");
		output(" your finger");
		if (pc.ass.looseness() > 1) output("s");
		output(", you find your target and tease out a fresh dollop of precum from the tip of [pc.eachCock]");
	}
	output(".");
	if (pc.hasVagina())
	{
		output(" [pc.GirlCum] dribbles freely from [pc.eachVagina],");
		if (pc.vaginas.length > 1) output(" each of them");
		output(" clenching as if wrapped around");
		if (pc.vaginas.length == 1) output(" a");
		output(" phantom cock");
		if (pc.vaginas.length > 1) output("s");
		output(".");
	}

	if (pc.biggestTitSize() >= 1)
	{
		output("\n\nYour free hand slips up to your [pc.fullChest], grabbing hold of one of your breasts and squeezing in time to the fingering of your ass.");
		if (pc.isLactating())
		{
			output(" A dribble of [pc.milk] escapes from your [pc.nipple]; a sight that only spurs you to lick your lips and pull your tit toward your mouth for a quick taste.");
			if (pc.milkQ() >= 500) output(" Soon you're suckling greedily from your [pc.nippleColor] teat, gulping down mouthful after mouthful of [pc.milkNoun].");
		}
		else if (pc.biggestTitSize() <= 3)
		{
			output(" Your tits are just the right size for one hand; perfect for groping and squeezing whilst you play with your [pc.asshole].");
		}
		else if (pc.biggestTitSize() > 3)
		{
			output(" Working your finger deeply into your ass has your whole body twisting and writhing in just the right way to make your tits jiggle and quake, every muscle, every inch of skin touched by the building pleasure.");
		}
	}

	output("\n\nYou moan");
	if (pc.isLactating() && pc.milkQ() >= 500 && pc.biggestTitSize() >= 5) output(", muffled as you are with a mouthful of your own tit,");
	output(" as your pleasure builds. Your [pc.hips] involuntarily twist back and forth as you drive your finger");
	if (pc.ass.looseness() > 3) output("s");
	output(" with increasing fervor into your [pc.asshole], trying to inch");
	if (pc.ass.looseness() > 3) output(" them");
	else output(" it");
	output(" just a little bit deeper.");
	if (pc.hasCock()) output(" Precum dribbles from [pc.eachCockHead], a stream that gets thicker every time you brush against the sensitive bulb of your prostate.");
	if (pc.hasVagina())
	{
		output(" You can feel [pc.eachVagina] squeezing even harder, milking");
		if (pc.vaginas.length == 1) output(" a phantom cock for all it’s worth");
		else if (pc.vaginas.length > 1) output(" those phantom cocks for all they’re worth");
		output(" and drenching your wrist in [pc.girlCum].");
	}
	output(" You can almost taste the release just over the horizon, and you make one final push to drive yourself over the edge.");

	output("\n\nWith one final wiggling thrust it finally hits, and you");
	if (pc.isLactating() && pc.milkQ() >= 500) output(" let your breast fall from your mouth as a scream of ecstasy rips itself from your throat");
	else output(" scream in ecstasy");
	output(". Your [pc.legOrLegs] lash");
	if(pc.legCount == 1) output("es");
	output(" out uncontrollably as a bolt of pleasure wracks your body, every muscle convulsing in shared bliss."); 
	if (pc.hasCock())
	{
		output(" All that attention to your prostate triggers [pc.eachCock] to usher forth their own proof of your pleasure,");
		if (pc.cumQ() < 20)
		{ 
			output(" though only a single weak spurt of [pc.cumNoun] escapes [pc.eachCockHead]");
		}
		else if (pc.cumQ() <= 100)
		{
			output(" a few weak spurts of [pc.cumNoun] spray from [pc.eachCockHead] to run down the sides of your dick");
			if (pc.cocks.length > 1) output("s");
		}
		else if (pc.cumQ() <= 1000)
		{
			output(" [pc.cumNoun] spurting freely from [pc.eachCockHead] to splatter across your abdomen");
		}
		else if (pc.cumQ() <= 2500)
		{
			output(" thick sprays of [pc.cumNoun] geysering from [pc.eachCockHead]");
		}
		else
		{
			output(" covering you in the flood of [pc.cumNoun] that sprays from [pc.eachCockHead] as you laugh in delight at your astounding, inhuman volume");
			applyCumSoaked(pc);
			if(pc.cumQ() > 5000) applyCumSoaked(pc);
			if(pc.cumQ() > 10000) applyCumSoaked(pc);
			if(pc.cumQ() > 30000) applyCumSoaked(pc);
			if(pc.cumQ() > 50000) applyCumSoaked(pc);
		}
		output(".");
	}
	if (pc.hasVagina())
	{
		output(" [pc.EachVagina] gushes with [pc.girlCum] that slathers your thighs");
		if (pc.hasCock() && pc.cumQ() > 100) output(", adding to the fluids already covering your body");
		output("."); 
	}
	if (pc.hasTailCock())
	{
		output(" A spray of [pc.cum] issues from the tip of your tail-mounted dick, angled to shoot all over your");
		if (pc.isLactating() && pc.milkQ() >= 500) output(" [pc.milkNoun]-covered");
		output(" [pc.chest].");
	}
	if (pc.hasTailCunt())
	{
		output(" Your");
		if(pc.hasParasiteTail()) output(" parasitic");
		output(" tail-cunt lets out its own squirt of feminine juices, wishing it was dousing a real dick with its [pc.girlCum].");
	}
	if (!pc.hasCock() && !pc.hasVagina() && !pc.hasTailCock() && !pc.hasTailCunt())
	{
		output(" Without any sexual organs you don’t really orgasm, but you feel a sensation of release wash over your body as if you had.");
	}

	output("\n\nYou’re left awash in thoughts of pure, base pleasure");
	if ((pc.hasCock() && pc.cumQ() >= 2500) || (pc.isLactating() && pc.milkQ() >= 500))
	{
		output("... not to mention");
		if (pc.hasCock() && pc.cumQ() >= 2500) output(" cum");
		if ((pc.hasCock() && pc.cumQ() >= 2500) && (pc.isLactating() && pc.milkQ() >= 500)) output(" and");
		if ((pc.isLactating() && pc.milkQ() >= 500)) output(" milk");
	}
	output(".");

	output("\n\nIt’s a good while before your senses return to you, with your lusts, and your ass, sated. For the moment at least.");

	processTime(20);

	pc.orgasm();

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}


//Masturbation (Public)
// By JimThermic
// Libido req: 30+
// Need to be in public place, obv.
// Taurs play with their tits. Non-taurs play with their cocks, pussies, or ass, searching for their existence in that order. This is an everybody scene with a number of 'if' statements.

public function goddamnitJimTAndYourExhibitionism():void
{
	clearOutput();
	showName("BLOWING\nOFF STEAM");
	if(silly) author("JimThermite the Termite");
	else author("JimThermic");

	//GotLowerGarment - armor or underwear:
	if(pc.isCrotchGarbed() && !pc.isCrotchExposed())
	{
		output("Void, you're so damn horny! Beneath your [pc.lowerGarment], your loins ache needily.");
		if(pc.hasCock() || pc.hasVagina()) 
		{
			output(" Throbbing with need,");
			if(pc.hasCock()) 
			{
				output(" your [pc.cocks] ");
				if(pc.cockTotal() == 1) output("is pitching a tent");
				else output("are pitching tents");
				if(pc.hasVagina()) output(", and ");
				else output(" in");
			}
			//GotPussies:
			if(pc.hasVagina()) 
			{
				output(" your [pc.pussies] ");
				if(pc.totalVaginas() == 1) output("is");
				else output("are");
				output(" rubbing wetly against");
			}
			output(" the all-too constricting fabric.");
		}
	}
	//else / Bottom Nudefucker:
	else
	{
		output("Void, you're so damn horny! Your loins ache with need, your bare crotch begging to be attended to.");
	}

	output("\n\nWith a flushing face, you look around. You're still in public. Could you masturbate... here? In front of all these people?");

	output("\n\nYou look into their eyes as the ");
	//Tavros:
	if(rooms[currentLocation].planet == "TAVROS STATION") output("station-goers");
	else if(rooms[currentLocation].planet == "PLANET: MHEN'GA") output("Esbethian citizens");
	else if(rooms[currentLocation].planet == "PLANET: TARKUS") output("raskvel");
	else if(rooms[currentLocation].planet == "PLANET: NEW TEXAS") output("New Texans");
	else if(rooms[currentLocation].planet == "PLANET: MYRELLION") output("myr");
	else output("onlookers");
	output(" peer at you curiously, wondering what's the matter. The longer they look, the fiercer the forbidden flame burns between your loins. You yearn to stroke it, <i>expose</i> it, display it in front of everyone....");

	//PCWearingArmor:
	if(!(pc.armor is EmptySlot))
	{
		output("\n\nBefore their eyes, you begin slowly stripping off your [pc.armor]. They watch on with wide open eyes and mouths as you peel it off your [pc.skinFurScales], exposing your bare body to the gaping onlookers. You can feel their looks lingering on and roaming around your body, causing you to shiver with delight.");
		//GotUpperUndergarment:
		if(!(pc.upperUndergarment is EmptySlot)) output(" Sliding your fingers up your bare flesh, you sensuously slide off your [pc.upperUndergarment]. The slowly gathering crowd gazes upon your [pc.chest] and you shiver with delight.");
		if(!(pc.lowerUndergarment is EmptySlot)) output(" Making a show of it, you hook your thumbs under your [pc.lowerUndergarment]. With a long, pointed bend, you strip them off, poking your bare [pc.skinFurScalesColor] buttocks at any watching bystanders. You try to control the quiver in your [pc.thighs] as you do so; it's hard to contain your mounting excitement!");
	}
	//Else if (PCNoArmor but wearing Upper and/or Lower Undergarment):
	else if(!pc.isNude())
	{
		output("\n\nBefore their gaze, you begin touching yourself. Of course, they're already <i>looking</i>, what with you traipsing around in nothing but your ");
		if(pc.isChestGarbed()) output("[pc.upperUndergarment]");
		if(pc.isChestGarbed() && pc.isCrotchGarbed()) output(" and ");
		if(pc.isCrotchGarbed()) output("[pc.lowerUndergarment]. The gaping onlookers look upon your exposed [pc.skinFurScales] with ");
		if(rooms[currentLocation].planet == "PLANET: NEW TEXAS" || rooms[currentLocation].planet == "PLANET: MYRELLION" || rooms[currentLocation].planet == "PLANET: TARKUS") output("obvious lust");
		else output("a mixture of scandal and lust");
		output(". You can feel their looks lingering on and roaming around your body, causing you to shiver with delight.");
	}
	//Else // PC is nude:
	else
	{
		output("\n\nYou're already butt-naked, of course, wearing nothing but your [pc.skinFurScales]. ");
		if(rooms[currentLocation].planet == "PLANET: NEW TEXAS" || rooms[currentLocation].planet == "PLANET: MYRELLION" || rooms[currentLocation].planet == "PLANET: TARKUS") output("Even here, such blatant nudity is met with lusty looks.");
		else output("The shocked and scandalized looks on their faces gives you a thrill - what you are doing is really, obviously <i>naughty</i>.");
		output(" They watch on with wide open eyes and mouths as you begin touching your bare body before the gaping onlookers. You can feel their looks lingering on and roaming around your body, causing you to shiver with delight.");
	}
	output("\n\nAs a number of ");
	if(rooms[currentLocation].planet == "TAVROS STATION") output("station visitors");
	else if(rooms[currentLocation].planet == "PLANET: MHEN'GA") output("frontier folk");
	else if(rooms[currentLocation].planet == "PLANET: TARKUS") output("the rabbit-like aliens");
	else if(rooms[currentLocation].planet == "PLANET: NEW TEXAS") output("curious New Texans");
	else if(rooms[currentLocation].planet == "PLANET: MYRELLION") output("female myr");
	else output("onlookers");
	output(" gather around you, you ");
	if(pc.biggestTitSize() > 2) output("heft");
	else output("stroke");
	output(" your [pc.chest] for their benefit. They're totally fixated on every detail of ");
	if(pc.biggestTitSize() < 1) output("it");
	else output("them");
	output(" and your [pc.nipples]. You grin and slide your hands down and along your [pc.belly]. Their ");
	if(rooms[currentLocation].planet == "PLANET: NEW TEXAS" || rooms[currentLocation].planet == "PLANET: MYRELLION" || rooms[currentLocation].planet == "PLANET: TARKUS") output("longing looks");
	else output("scandalized and stirred-up stares");
	output(" follow.");
	if(!pc.isTaur()) output(" You reach to your loins, drawing their attention <i>there</i>.");

	if(pc.isTaur())
	{
		output("\n\nGrabbing your [pc.nipples] once more, you tease and pinch them before their very eyes.");
	}
	else if(pc.hasCock()) output("\n\nGrabbing [pc.oneCock], you stroke it before their eyes.");
	else if(pc.hasVagina()) output("\n\nYou begin to stroke [pc.oneVagina] before their eyes.");
	else output("\n\nReaching behind you, you begin to finger your [pc.ass] before their eyes.");
	//NewTexas/Myrellion/Tarkus: 
	var lustPlanet:Boolean = (rooms[currentLocation].planet == "PLANET: NEW TEXAS" || rooms[currentLocation].planet == "PLANET: MYRELLION" || rooms[currentLocation].planet == "PLANET: TARKUS");
	if(lustPlanet) output(" A number of them lick their lips.");
	else output(" There are a few loud gasps and <i>lots</i> of whispering.");
	output(" You can feel all of them staring at your ");
	if(pc.isTaur()) output("[pc.chest]");
	else if(pc.hasCock()) output("[pc.cockHead]");
	else if(pc.hasVagina()) output("[pc.pussyColor] slit");
	else output("spread buttocks");
	output(", burning each and every detail of your ");
	if(pc.isTaur()) output("erect buds");
	else if(pc.hasCock()) output("swelling crown");
	else if(pc.hasVagina()) output("snatch");
	else output("fingered pucker");
	output(" into glorious memory.");

	output("\n\nYour sense of excitement skyrockets as they begin to whip out recording devices. Here you are, [pc.name], ");
	if(pc.isTaur()) output("playing with your [pc.nipples]");
	else if(pc.hasCock()) output("jerking your [pc.cocks] and fingering your ass");
	else if(pc.hasVagina()) output("frigging your [pc.vaginas] and fingering your ass");
	else output("fingering your ass");
	output(" in public, and everyone can see it - it's such a rush!");

	output("\n\n<i>“Go on, record me - spread it around!”</i> You cry out. The idea of a whole ");
	if(rooms[currentLocation].planet == "TAVROS STATION") output("station");
	else output("planet");
	output(" seeing you wildly masturbating makes you tremble and quake with delight. No matter how they look at you, you know half of them will be taking it home later, masturbating themselves to your ");
	if(pc.isTaur()) output("[pc.chest]....");
	else output("[pc.groin]....");

	output("\n\nYou simply lack the self control to keep it up. You let out a loud, lewd cry and the crowd of ");
	if(rooms[currentLocation].planet == "TAVROS STATION") output("station-goers");
	else if(rooms[currentLocation].planet == "PLANET: MHEN'GA") output("Esbeth citizens");
	else if(rooms[currentLocation].planet == "PLANET: TARKUS") output("raskvel");
	else if(rooms[currentLocation].planet == "PLANET: NEW TEXAS") output("New Texans");
	else if(rooms[currentLocation].planet == "PLANET: MYRELLION") output("myr");
	else output("onlookers");
	output(" gasp.");

	if(pc.hasCock())
	{
		output(" [pc.EachCock] flexes and fires");
		if(pc.cumQ() < 5) output(" blank shots, only the smallest droplets of [pc.cum] escaping your [pc.cockHeads].");
		else if(pc.cumQ() < 100) output(" thick spurts of [pc.cum] up and into the air. Some of it shoots into the crowd. Your spunk splatters on one of their faces, and they let out a shocked noise!");
		else output(" fountainous gushes of [pc.cum]. It surges forth from your [pc.cockHeads], splattering into the crowd and raising shocked cries.");
	}
	if(pc.hasVagina())
	{
		output(" Clenching your quaking thighs, you utterly cream yourself in front of them. Your [pc.thighs] are utterly drenched in your [pc.girlCum] as you tremble and twitch");
		if(pc.isSquirter()) output(", even squirting a little");
		output(" in delight.");
	}
	else 
	{
		output(" You tremble and dry-orgasm from your ");
		if(pc.isTaur()) output("tit-play");
		else output("ass fingering");
		output(", [pc.thighs] quaking in delight.");
	}
	output("\n\nDimly, you're aware of flashing around you as the assembled voyeurs take photos of your [pc.skinFurScalesColor], ");
	if(pc.hasCock() && pc.cumQ() >= 5) output("[pc.cumNoun]-splattered");
	else output("sweaty");
	output(" body. You bask in the afterglow for a good long while. Once you start getting cold, you pick yourself up and gather your things, feeling a fuzzy sense of fulfillment.");
	output("\n\nYou smile brightly and slip on your [pc.gear]. Sex really is better when you've got an audience, even when it's with yourself.");
	processTime(20);

	pc.orgasm();
	pc.exhibitionism(1);

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

//Futa Babe Pantyfaps
//Add [PantyFap] to masturbation menu. PC must have a dick + waifu panties. Open sub-menu to select which waifu's panties to jerk it into. 
public function futaBabePantyfapsRouter():void
{
	//Just one? Figure out which and send to the scene:	
	if(pantyFapCount() == 1) 
	{
		if(pc.hasKeyItem("Panties - Kiro's - Lacy, black, and crotchless.")) futaBabePantyfaps("Kiro");
		if(pc.hasKeyItem("Panties - Penny's - Plain, blue, and crotchless.")) futaBabePantyfaps("Penny");
		if(pc.hasKeyItem("Panties - Saendra's - Ultra-tight and bright pink.")) futaBabePantyfaps("Saendra");
		if(pc.hasKeyItem("Panties - Syri's - Sky blue, silky, and extra crotch room.")) futaBabePantyfaps("Syri");
		if(pc.hasKeyItem("Panties - Emmy's - Silky, purple, and cum-stained.")) futaBabePantyfaps("Emmy");
		if(pc.hasKeyItem("Panties - Embry's - Plain, girly pink panties with little hearts.")) jackOffWithLadyPantiesYouSicko("[embry.name]");
		if(pc.hasKeyItem("Panties - Xanthe's - Lacy, black siel-silk panties.")) jackOffWithLadyPantiesYouSicko("Xanthe");
		if(pc.hasKeyItem("Panties - Aina's - Extra-large, striped green centaur panties.")) jackOffWithLadyPantiesYouSicko("Aina");
		if(pc.hasKeyItem("Panties - Briha's - Nylon, camo-print T-back panties.")) jackOffWithLadyPantiesYouSicko("Briha");
		if(pc.hasKeyItem("Panties - Lys's - Sheer black panties.")) jackOffWithLadyPantiesYouSicko("Lys");
	}	
	//More than one pair? Build a menu.
	else
	{
		clearOutput();
		output("You've collected " + pantyFapCount() + " of 10 possible pairs of ladies' underwear. Which will you use?");
		clearMenu();
		var button:int = 0;
		if(pc.hasKeyItem("Panties - Emmy's - Silky, purple, and cum-stained."))
		{
			addButton(button,"Emmy's",futaBabePantyfaps,"Emmy","Emmy's Panties","Use Emmy's cum-stained, purple panties for a quick wank.");
			button++;
		}
		if(pc.hasKeyItem("Panties - Kiro's - Lacy, black, and crotchless.")) 
		{
			addButton(button,"Kiro's",futaBabePantyfaps,"Kiro","Kiro's Panties","Use Kiro's lacy, crotchless panties for a quick wank.");
			button++;
		}
		if(pc.hasKeyItem("Panties - Penny's - Plain, blue, and crotchless.")) 
		{
			addButton(button,"Penny's",futaBabePantyfaps,"Penny","Penny's Panties","Use Penny's blue (but crotchless) panties for a quick fap.");
			button++;
		}
		if(pc.hasKeyItem("Panties - Saendra's - Ultra-tight and bright pink."))
		{
			addButton(button,"Saendra's",futaBabePantyfaps,"Saendra","Saendra's Panties","Use Saendra's tight, pink panties to stroke one out.");
			button++;
		}
		if(pc.hasKeyItem("Panties - Syri's - Sky blue, silky, and extra crotch room.")) 
		{
			addButton(button,"Syri's",futaBabePantyfaps,"Syri","Syri's Panties","Use Syri's sky-blue, silky bloomers for a little self-pleasure.");
			button++;
		}
		if(pc.hasKeyItem("Panties - Embry's - Plain, girly pink panties with little hearts.")) 
		{
			addButton(button,embry.short + "'s",jackOffWithLadyPantiesYouSicko,"[embry.name]",embry.short + "'s Panties","Use [embry.name]'s pink, heart-covered panties for a little self-pleasure.");
			button++;
		}
		if(pc.hasKeyItem("Panties - Xanthe's - Lacy, black siel-silk panties.")) 
		{
			addButton(button,"Xanthe's",jackOffWithLadyPantiesYouSicko,"Xanthe","Xanthe's Panties","Use Xanthe's lacy black panties for a little self-pleasure.");
			button++;
		}
		if(pc.hasKeyItem("Panties - Aina's - Extra-large, striped green centaur panties.")) 
		{
			addButton(button,"Aina's",jackOffWithLadyPantiesYouSicko,"Aina","Aina's Panties","Use Aina's large, striped centaur panties for a little self-pleasure.");
			button++;
		}
		if(pc.hasKeyItem("Panties - Briha's - Nylon, camo-print T-back panties.")) 
		{
			addButton(button,"Briha's",jackOffWithLadyPantiesYouSicko,"Briha","Briha's Panties","Use Briha's nylon, camo-print panties for a little self-pleasure.");
			button++;
		}
		if(pc.hasKeyItem("Panties - Lys's - Sheer black panties.")) 
		{
			addButton(button,"Lys's",jackOffWithLadyPantiesYouSicko,"Lys","Lys's Panties","Use Lys's sheer black panties for a little self-pleasure.");
			button++;
		}
		addButton(14,"Back",masturbateMenu);
	}
}
public function futaBabePantySchlicksRouter():void
{
	//Just one? Figure out which and send to the scene:	
	if(pantyFapCount() == 1) 
	{
		if(pc.hasKeyItem("Panties - Kiro's - Lacy, black, and crotchless.")) futaPantiesFapInPussy("Kiro");
		if(pc.hasKeyItem("Panties - Penny's - Plain, blue, and crotchless.")) futaPantiesFapInPussy("Penny");
		if(pc.hasKeyItem("Panties - Saendra's - Ultra-tight and bright pink.")) futaPantiesFapInPussy("Saendra");
		if(pc.hasKeyItem("Panties - Syri's - Sky blue, silky, and extra crotch room.")) futaPantiesFapInPussy("Syri");
		if(pc.hasKeyItem("Panties - Emmy's - Silky, purple, and cum-stained.")) futaPantiesFapInPussy("Emmy");
		if(pc.hasKeyItem("Panties - Embry's - Plain, girly pink panties with little hearts.")) pureLadyWaifuPussyRubFap("[embry.name]");
		if(pc.hasKeyItem("Panties - Xanthe's - Lacy, black siel-silk panties.")) pureLadyWaifuPussyRubFap("Xanthe");
		if(pc.hasKeyItem("Panties - Aina's - Extra-large, striped green centaur panties.")) pureLadyWaifuPussyRubFap("Aina");
		if(pc.hasKeyItem("Panties - Briha's - Nylon, camo-print T-back panties.")) pureLadyWaifuPussyRubFap("Briha");
		if(pc.hasKeyItem("Panties - Lys's - Sheer black panties.")) pureLadyWaifuPussyRubFap("Lys");
	}	
	//More than one pair? Build a menu.
	else
	{
		clearOutput();
		output("You've collected " + pantyFapCount() + " of 10 possible pairs of ladies' underwear. Which will you use?");
		clearMenu();
		var button:int = 0;
		if(pc.hasKeyItem("Panties - Emmy's - Silky, purple, and cum-stained.")) 
		{
			addButton(button,"Emmy's",futaPantiesFapInPussy,"Emmy","Emmy's Panties","Use Emmy's purple, cummy panties for a quick jill-off session.");
			button++;
		}
		if(pc.hasKeyItem("Panties - Kiro's - Lacy, black, and crotchless.")) 
		{
			addButton(button,"Kiro's",futaPantiesFapInPussy,"Kiro","Kiro's Panties","Use Kiro's lacy, crotchless panties for a quick jill-off session.");
			button++;
		}
		if(pc.hasKeyItem("Panties - Penny's - Plain, blue, and crotchless.")) 
		{
			addButton(button,"Penny's",futaPantiesFapInPussy,"Penny","Penny's Panties","Use Penny's blue (but crotchless) panties for a quick bit of self-pleasure.");
			button++;
		}
		if(pc.hasKeyItem("Panties - Saendra's - Ultra-tight and bright pink."))
		{
			addButton(button,"Saendra's",futaPantiesFapInPussy,"Saendra","Saendra's Panties","Use Saendra's tight, pink panties to stroke one out.");
			button++;
		}
		if(pc.hasKeyItem("Panties - Syri's - Sky blue, silky, and extra crotch room.")) 
		{
			addButton(button,"Syri's",futaPantiesFapInPussy,"Syri","Syri's Panties","Use Syri's sky-blue, silky bloomers for a little self-pleasure.");
			button++;
		}
		if(pc.hasKeyItem("Panties - Embry's - Plain, girly pink panties with little hearts.")) 
		{
			addButton(button,embry.short + "'s",pureLadyWaifuPussyRubFap,"[embry.name]",embry.short + "'s Panties","Use [embry.name]'s pink, heart-covered panties for a little self-pleasure.");
			button++;
		}
		if(pc.hasKeyItem("Panties - Xanthe's - Lacy, black siel-silk panties.")) 
		{
			addButton(button,"Xanthe's",pureLadyWaifuPussyRubFap,"Xanthe","Xanthe's Panties","Use Xanthe's lacy black panties for a little self-pleasure.");
			button++;
		}
		if(pc.hasKeyItem("Panties - Aina's - Extra-large, striped green centaur panties.")) 
		{
			addButton(button,"Aina's",pureLadyWaifuPussyRubFap,"Aina","Aina's Panties","Use Aina's large, striped centaur panties for a little self-pleasure.");
			button++;
		}
		if(pc.hasKeyItem("Panties - Briha's - Nylon, camo-print T-back panties.")) 
		{
			addButton(button,"Briha's",pureLadyWaifuPussyRubFap,"Briha","Briha's Panties","Use Briha's nylon, camo-print panties for a little self-pleasure.");
			button++;
		}
		if(pc.hasKeyItem("Panties - Lys's - Sheer black panties.")) 
		{
			addButton(button,"Lys's",pureLadyWaifuPussyRubFap,"Lys","Lys's Panties","Use Lys's sheer black panties for a little self-pleasure.");
			button++;
		}
		addButton(14,"Back",masturbateMenu);
	}
}
public function pantyFapCount():Number
{
	var count:int = 0;
	if(pc.hasKeyItem("Panties - Kiro's - Lacy, black, and crotchless.")) count++;
	if(pc.hasKeyItem("Panties - Penny's - Plain, blue, and crotchless.")) count++;
	if(pc.hasKeyItem("Panties - Syri's - Sky blue, silky, and extra crotch room.")) count++;
	if(pc.hasKeyItem("Panties - Saendra's - Ultra-tight and bright pink.")) count++;
	if(pc.hasKeyItem("Panties - Emmy's - Silky, purple, and cum-stained.")) count++;
	if(pc.hasKeyItem("Panties - Embry's - Plain, girly pink panties with little hearts.")) count++;
	if(pc.hasKeyItem("Panties - Xanthe's - Lacy, black siel-silk panties.")) count++;
	if(pc.hasKeyItem("Panties - Aina's - Extra-large, striped green centaur panties.")) count++;
	if(pc.hasKeyItem("Panties - Briha's - Nylon, camo-print T-back panties.")) count++;
	if(pc.hasKeyItem("Panties - Lys's - Sheer black panties.")) count++;
	return count;
}

public function getPantyColor(waifu:String = ""):String
{
	var pantyColor:String = "CODERS DUN GOOFED";
	if(waifu == "Kiro") pantyColor = "black";
	else if(waifu == "Penny") pantyColor = "blue";
	else if(waifu == "Syri") pantyColor = "blue";
	else if(waifu == "Saendra") pantyColor = "bright pink";
	else if(waifu == "Emmy") pantyColor = "purple";
	else if(waifu == "[embry.name]") pantyColor = "pink";
	else if(waifu == "Xanthe") pantyColor = "black";
	else if(waifu == "Aina") pantyColor = "striped green";
	else if(waifu == "Briha") pantyColor = "camo-pattern";
	else if(waifu == "Lys") pantyColor = "black";
	return pantyColor;
}

/* Used in pure female JimT pantyfap scenes */
public function getPantyTexture(waifu:String = ""):String
{
	var pantyTexture:String = "CODERS DUN GOOFED";
	if(waifu == "[embry.name]") pantyTexture = "soft cotton";
	else if(waifu == "Xanthe") pantyTexture = "smooth siel-silk";
	else if(waifu == "Aina") pantyTexture = "stretchy cotton";
	else if(waifu == "Briha") pantyTexture = "thin nylon";
	else if(waifu == "Lys") pantyTexture = "sheer";
	return pantyTexture;
}

public function futaBabePantyfaps(waifu:String = ""):void
{
	clearOutput();
	showName("PANTY\nNAUGHTINESS");
	author("Savin");
	var pantyColor:String = getPantyColor(waifu);
	
	output("Overcome by your mounting lusts and the yearning desire for the warm touch of your lover, you pull out the underthings you got from " + waifu + ", eyes wandering over the " + pantyColor + " fabric. Memories of your prior entanglements, the tender embraces and lusty encounters you’ve shared in the past. Your [pc.cocks] start");
	if(pc.cockTotal() == 1) output("s");
	output(" to stiffen with excitement at the fond memories, and your hand slowly works its way down to your crotch. Smiling to yourself, you gently stroke yourself and slink down ");
	if(!InShipInterior()) output("onto the ground");
	else output("onto the edge of your bed");
	output(".");

	output("\n\nReclining back, you bring " + waifu + "’s panties up to your face and drink deep of the rich, musky scent of them, smelling so wonderfully of your lover that you could easily imagine her here with you, her crotch pressed into your face with a big, throbbing hard-on for you to worship. The thought of your lover’s tumescent cock rubbing against your face, her body wrapped around yours in a passionate embrace... her hands around your [pc.cock], stroking you... yeah, that’s enough to get you going.");

	output("\n\nYou pull off your [pc.gear] and get comfortable, stopping to run your tongue along the palm of your ");
	if(silly) output("fapping ");
	output("hand before reaching back down to encircle your prick, starting to jack off nice and easy, pretending that it’s " + waifu + "’s mouth instead. Chewing your lip, you sigh into the wonderful little shockwaves of pleasure spilling up from your dick. <i>“Ah yeah,”</i> you murmur to yourself, moving a little faster, caressing every inch of your stiffening cockflesh.");

	output("\n\nYou take a last, long sniff of your lover’s panties - and the intoxicating, masculine aroma clinging to them - before taking them down and wrapping the " + pantyColor + " fabric around your cock. You can’t help but smile at yourself, grinning at the perverse shame of using your lover’s cute " + pantyColor + " panties to jerk yourself off. Still, they feel wonderful on your sensitive cockflesh, and you let out a sultry little moan as you strike yourself with " + waifu + "’s panties.");

	output("\n\nThe longer you go, the heavier your breathing gets, and the more your cock throbs in its sheath of silky panty. You move them faster and faster, gliding along your [pc.cock] as your lust builds ever higher. Your [pc.hips] buck into the " + pantyColor + " panties, drooling thick streaks of [pc.cumColor] pre across the fabric with every thrust and adding your own flavor to your lover’s well-used underthings.");

	output("\n\n<i>“Gonna... gonna...”</i> you murmur under your breath, trying to hold back... and failing miserably. The perversion and pleasure and smell of sex all combine to overwhelm your senses, and your cock bulges with a rush of seed waiting to stain the " + pantyColor + " fabric [pc.cumColor]. With a final, exhilarated moan, you arch your back and thrust deep into the wadded mass of " + waifu + "’s panties, busting your nut into the musky crotch, right where she’d want it...");

	output("\n\nMoaning, panting, and cumming, you ");
	if(pc.cumQ() < 10) output("spurt trickles of [pc.cumFlavor] spooge all over " + waifu + "’s panties");
	else if(pc.cumQ() < 50) output("squirt thick load after load all over the panties");
	else if(pc.cumQ() < 250) output("blast the panties with cum, soaking them in your [pc.cumNoun]");
	else output("unleash an ungodly torrent of [pc.cumNoun] into the poor, abused panties, soaking them in what looks like buckets of [pc.cum]. They definitely are carrying <i>your</i> smell more than " + waifu + "’s now.");

	output("\n\nYou flop back and take a deep, satiated breath, mind flooded with fantasies of a pleasant afterglow in " + waifu + "’s arms. Slowly, [pc.eachCock] deflates from inside her bunched-up panties, and you eventually pick yourself up and ");
	if(!InShipInterior()) output("do what you can to clean your lover’s underwear off");
	else output("dump the panties into your clothes washer");
	output(" before you leave.");
	processTime(17+rand(4));
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function futaPantiesFapInPussy(waifu:String = ""):void
{
	clearOutput();
	showName("PANTY\nFUN");
	var pantyColor:String = getPantyColor(waifu);
	output("Feeling a touch naughty, you dig into your possessions for one of your favorite, naughty prizes - " + waifu + "’s panties, complete with lingering traces of her scent");
	if(waifu != "Syri") output(" - male and female");
	output(". If you look carefully, you can even see the remnants of an old cumstain, resilient despite repeated washings. Fuck, you wish you had her in your hands instead of this elastic trophy. You could squeeze her ass, kiss her full on the lips, and feel her aching hardness press against your chest, so full of need for you... and the gathering wetness");
	if(pc.legCount > 1) output(" between your thighs.");
	else output(" below.");

	//CrotchGarbed
	if(pc.isCrotchGarbed())
	{
		output("\n\nOoh, you’re getting a little hot to be penned up inside the confines of your [pc.lowerGarments]. Sometimes a [pc.boy]’s got to let [pc.hisHer] inner flower bloom, and quite frankly, your petals are already soaked with dew. You kick the offending equipment off with a few deft twists of your fingers and contemptuous snap of your [pc.foot]. Your heart races. It’s just you, " + waifu + "’s panties, and your eagerly wiggling fingers, now.");
	}
	//Nakkers
	else output("\n\nOoh, it’s a good thing you’re already naked. It wouldn’t do to have your own underwear as fragrant with lust as " + waifu + "’s. You’re not nearly that libidinous - you’re just a [pc.boy] whose needs have risen to the point where they need taken care of, like any normal U.G.C. citizen. Left to your own devices, you’ll need to pollinate your delicate, dewy flower with naught but your fingers and the too-rich scent of your absent lover. Good thing you’ve such a wonderfully stimulating aid.");
	//Merge
	output("\n\nYou run your palms down the [pc.skinFurScales] of your [pc.fullChest], pausing at each ");
	if(pc.hasInvertedNipples()) output("inverted nipple to gently probe the perfectly concealed nub");
	else if(pc.hasLipples()) output("pouting lipple to press your fingers inside, allowing the delightfully fuckable angel bows to clamp down for a little suck");
	else if(pc.hasFuckableNipples()) output("sensitive nipple to gently slip inside, discovering the wetness that is the hallmark of your delightfully fuckable chest");
	else output("stiff teat to gently pinch at flick at the pebbly flesh");
	output(". A thrill of delight shivers down your spine when your hands reach your [pc.belly], one still dragging the used underthings with them. Sighing dreamily, you pull the panties away just as the other set of questing digits nears their simmering target");
	if(pc.totalVaginas() > 1) output("s");
	output(". You can feel the heat sizzling close to your fingertips, a simple plunge away.");
	if(pc.totalVaginas() > 1)
	{
		output(" They’re spread to position themselves evenly across your expanse of womanly folds. Your body truly is a smorgasbord of sapphic-themed delights");
		if(pc.totalVaginas() > 2) output(", gifted with more glittering pussy than most lesbian couples");
		output(".");
	}
	output("\n\nHolding the soft fabric close to your face, you inhale. Somewhere, long ago, you learned that scent is powerfully bound to the terran memory, and it never seemed more true than at this very moment. The aroma of " + waifu + " conjures up her image in your mind’s eye, complete with a cunt-wrecking cock and a feverishly desirous gaze. You ought to pay her a special visit, the next time you have a chance, maybe sink to your knees and polish her with slow licks until she’s forced to give you the fucking you so crave.");
	output("\n\nAn audible squelch accompanies the riveting sensation of burying fingertips knuckle deep in your most feminine places. Something " + pantyColor + "-colored and silky soft muffles your joyous croon. You can only assume that you brought " + waifu + "’s panties closer whilst lost in the electric delight of labial friction, and now that you’re breathing through them, you can’t really be bothered to pull them away. " + waifu + " smells as good as you remember, giving your fingers all the reason they need to fly between your folds or feather your [pc.clits].");
	output("\n\nOpening your mouth, you stuff the panties inside, turning your lover’s underthings into an impromptu gag. It does quite an effective job of muffling your cries of pleasure, and an even better job of reminding you just what she tastes like. Your fingers squish and squelch on their way through your entrance, slipping on the warm, wet bounty that oozes from within. Pleasure races through your overactive nerves like data through quantum entangled relays, instantly transmitting the intense euphoria to your hormone-drenched mind.");
	output("\n\nWhimpering and quivering, you try to keep your [pc.legOrLegs] from shaking too hard. You can practically feel " + waifu + "’s dick inside you, the veiny girth trembling with its own unspent need. It throbs with sympathetic desire, rubbing your most sensitive spots just as you desire them touched. Carefully, you wad up the spit-drenched panties and shove them inside just as your thumb begins to anxiously circle [pc.oneClit], its shaking loosing thrills of ecstasy from the red-hot pleasure buzzer.");
	output("\n\nYou cum around those panties,");
	if(pc.isSquirter())
	{
		output(" drenching them in absolute torrent of [pc.girlCum]");
		if(pc.girlCumQ() >= 1000) 
		{
			output(". There’s so much even the sodden panties can’t plug your gushing quim");
			if(pc.totalVaginas() > 1) output("s");
			output(", and torrents of passionate fluid flood down your [pc.thighs]");
			applyPussyDrenched(pc);
			if(pc.girlCumQ() > 5000) applyPussyDrenched(pc);
			if(pc.girlCumQ() > 10000) applyPussyDrenched(pc);
			if(pc.girlCumQ() > 30000) applyPussyDrenched(pc);
			if(pc.girlCumQ() > 50000) applyPussyDrenched(pc);
		}
	}
	else output(" your muscles clamping down around them as the " + pantyColor + " underwear darkens with absorbed [pc.girlCum]");
	output(". It’s an exquisitely satisfying orgasm, almost as the ones you could wring from " + waifu + ". The fullness, artificial as it may be, feeds your clenching, spasming bliss until you go limp, utterly drained.");
	if(pc.hasCock())
	{
		output(" Only now do you realize that your [pc.cocks] ");
		if(pc.cockTotal() == 1) output("was");
		else output("were");
		output(" spurting ropes of [pc.cum] into the air.");

		if(pc.cumQ() > 30 && pc.cumQ() < 500) 
		{
			output(" Your [pc.chest] ");
			if(pc.biggestTitSize() < 1) output("is");
			else output("are");
			output(" soaked.");
			applyCumSoaked(pc);
		}
		else if(pc.cumQ() >= 500)
		{
			output(" You’re absolutely soaked.");
			applyCumSoaked(pc);
			if(pc.cumQ() > 5000) applyCumSoaked(pc);
			if(pc.cumQ() > 10000) applyCumSoaked(pc);
			if(pc.cumQ() > 30000) applyCumSoaked(pc);
			if(pc.cumQ() > 50000) applyCumSoaked(pc);
		}
	}
	output("\n\nYour eyes cross a little when you pull the sodden underwear from your [pc.vagina]");
	if(pc.hasCock())
	{
		output(", and your [pc.cocks] dribble");
		if(pc.cockTotal() == 1) output(" a little more, lurching visibly");
	}
	output(". The panties smell more like you than " + waifu + " for the moment, but a quick wash ought to help solve that");
	if(!InShipInterior()) output(", once you get back to the ship");
	output(".");
	if(InShipInterior()) 
	{
		output(" You guiltily glance around, then sneak one last sniff before tossing them in the wash.");
		if(crew(true) > 0) output(" Wouldn’t want your crew to walk in on you in a compromising position... at least not <i>that</i> compromising position.");
	}
	processTime(22);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Panties: Cock Faps
// PC must have a cock
public function jackOffWithLadyPantiesYouSicko(waifu:String):void
{
	clearOutput();
	showName("\nPANTIES!");
	author("ASpoopyGhost");
	output("You pull out " + waifu + "’s panties and hold the bunched up fabric in your hand. They’re your naughty prize, once resting intimately close to her pussy lips, and now yours to play with. Bringing the intimate undle to your face. you inhale deeply. Just smelling the scintillating scent of her sweat and sex–rubbing up against the " + getPantyTexture(waifu) + " all day long–is causing your [pc.cocksNounSimple] to considerably harden. Now you’ve got her scent, ");
	if(pc.cockTotal() == 1) output("it demands");
	else output("they demand");
	output(" to be buried in her musky snatch!");

	output("\n\nDizzy with arousal, you ");
	if(!pc.isCrotchExposed()) output("tear off your clothes and ");
	if(InShipInterior()) output("fall back into your cabin bed");
	else output("drop to the ground");
	output(", ");
	if(pc.legCount > 1) output("spreading your [pc.legs] as wide as you can");
	else output("succumbing to your desires");
	output(". You bring the bundle downward and press her intimate apparel against ");
	if(pc.cockTotal() == 1) output("your erect cock");
	else output("one of your cocks");
	output(", running it up and down the underside of your shaft. Where " + waifu + "’s loins once rubbed against is now rubbing against you, and with your head lolling back, you breathily picture her dripping labia lips wetly drawing up and down your length, her moist heat pressing excitedly against your raging rod. You moan out loud and step it up a notch, covering your twitching cockhead in her " + getPantyTexture(waifu) + " crotch-fabric and wrapping it around your crown like a glove. Her panty-fabric strains and shapes to match your pulsating knob. You’re pressing it <i>hard</i> into the place where her musky pussy once rested, fucking it like you were fucking her instead!");
	output("\n\nMoaning and bucking upwards, the texture of her well-used underwear teases your tip and dilating cockhole. It’s not long before you’re defiling her crotch-fabric with your sticky pre. Your slickness spreads out and forms dark spots in the fabric. With burning cheeks, you groan and buck harder, totally turned on by the idea of staining her sweet underthings with your naughty spunk. You’re breathing hard and wildly wringing the base of your twitching dick, the straining pressure of her panty fabric wildly stimulating your crown like you’re being squeezed by her sex!");

	//TinyJism:
	if(pc.cumQ() < 9) output("\n\nWith a joyous cry, you spasm and go over the edge, splattering the insides of " + waifu + "’s well-used panties with tiny splutters of your jism. The orgasm is incredibly explosive, even though you’re not, barely marking the inside of her unmentionables. You still wring your dick for every last drop, utterly high off ‘staining’ her precious treasures with your lewd jism. When you finally finish, you’re left panting for breath and thrumming with a glorious afterglow, not to mention a thin sheen of sweat. Wow!");
	//RegularCums:
	else if(pc.cumQ() < 100) output("\n\nWith a joyous cry, you spasm and go over the edge, spurting your spunk into the insides of " + waifu + "’s well-used panties. With every spasmic shot, you drench it with more and more of your lewd jism, marking her unmentionables with your own taint. You wring your dick for every last drop, riding the high all the way to the end. When you finally finish, you’re left panting for breath and thrumming with a glorious afterglow, not to mention a thin sheen of sweat. Wow!");
	//HugeCums:
	else 
	{
		output("\n\nWith a joyous cry, you spasm and go over the edge, blasting your spunk into the insides of " + waifu + "’s well-used panties. Your lewd jism utterly coats her unmentionables in no time at all, utterly drenching every inch with your tainting spunk and coating your entire waist at the same time. You wring your dick for every last gushing burst, riding the high all the way to the end. When you finally finish, you’re left panting for breath and thrumming with a glorious afterglow, not to mention being covered with your own cum. Wow!");
		applyCumSoaked(pc);
		if(pc.cumQ() > 5000) applyCumSoaked(pc);
		if(pc.cumQ() > 10000) applyCumSoaked(pc);
		if(pc.cumQ() > 30000) applyCumSoaked(pc);
		if(pc.cumQ() > 50000) applyCumSoaked(pc);
	}
	output("\n\nOnce you’re finally able to move, you pick up " + waifu + "’s sticky panties and do what you can to clean them of your spunk for future use. It takes you a while, but you’re pretty sure you’ve got them mostly cleaned of your [pc.cumNoun]. <i>Mostly!</i>");
	processTime(17+rand(4));
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Panties: Pussy Rubs
// PC must have a pussy
public function pureLadyWaifuPussyRubFap(waifu:String):void
{
	clearOutput();
	showName("\nPANTIES!");
	author("ASpoopyGhost");
	output("Whipping out " + waifu + "’s panties, you hold the bunched up fabric in your hand. You flush as you look at the naughty prize, knowing that these have been resting intimately close to her pussy all day long, and now belong to you. With bated breath, you bring them up to your nose and deeply inhale. You can still smell her delicious sweat and sex on the " + getPantyTexture(waifu) + ", rubbed up against and marked by her pussy, and now yours to enjoy. Your own nethers begin to tingle thinking about <i>hers</i>, and you feel a heightening urge to rub your pussy up against something like a cat!");
	output("\n\nThrumming with arousal, you ");
	if(!pc.isCrotchExposed()) output("pull off your clothes and ");
	if(InShipInterior()) output("flumph back into your cabin bed");
	else output("drop to the ground");
	output(", ");
	if(pc.legCount > 1) output("spreading your [pc.legs] as wide as you can");
	else output("succumbing to your desires");
	output(". Breathy and excited, you bring the bundle downwards and press her intimate apparel against ");
	if(!pc.hasVaginas()) output("your needy snatch");
	else output("one of your pussies");
	output(", rubbing it up and down your slickening slit. Where " + waifu + "’s loins once rubbed against is now rubbing against you in the same place, and with your head lolling back, you breathily picture her dripping labia lips wetly drawing up and down against yours, her moist heat pressing excitedly against you. Moaning out loud, you press it deeper and between your slickening lips, rubbing the " + getPantyTexture(waifu) + " up against your [pc.clits]. You’re fucking her panties as if you’re fucking her instead, the delicious texture stimulating your sensitive button");
	if(pc.totalClits() > 1) output("s");
	output(" and making your [pc.vaginas] sing.");

	output("\n\nBucking wildly against her " + getPantyColor(waifu) + " underwear, it’s not long before you’re defiling her crotch-fabric with your slick wetness, forming dark stains in the fabric. With burning cheeks, you moan and buck harder, totally turned on by the idea of staining her sweet underthings with your naughty girl juices. You’re breathing hard and wildly humping the fabric, knowing her muskiness is touching yours, the panty fabric stroking your [pc.clits] like her own sex meshing up against yours.");
	output("\n\nWith a deliriously happy cry, you spasm and go over the edge, coating the insides of her " + waifu + "’s well-used panties with your girl juices. You’re practically stuffing her underwear into your spasming pussy as you cum, your fingers dipping the fabric deep into your netherlips as you cum <i>hard</i> on them When you finally finish, you’re left panting for breath and thrumming with a glorious afterglow, not to mention a thin sheen of sweat. Wow!");
	output("\n\nOnce you’re finally able to move, you pick up " + waifu + "’s sticky panties and do what you can to clean them off for future use.");

	processTime(17+rand(4));
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
		
// By JimThermic
// Exhibition Score: Whatever 'moderate' is. Somewhere between won't publically masturbate at all and total exhibition whore.
// Need to be in public place, obv.
// Taurs and Neuters play with their tits. Males and Herms play with their dicks. Women play with their pussies. This is an everybody scene with a number of 'if' statements.

public function moderateExhibitionOmniFap():void
{
	clearOutput();
	author("JimThermic");
	showName("PUBLIC\nMASTURBATION");
	// PC is crotch garbed, not a neuter && not a taur OR a chestgarbed taur OR chestgarbed neuter.
	if((pc.isCrotchGarbed() && pc.hasGenitals() && !pc.isTaur()) || (pc.isTaur && pc.isChestGarbed()) || (!pc.hasGenitals() && pc.isChestGarbed()))
	{
		output("Void, it's so hard to <i>think</i> right now! Instead, your senses are reeling, your head filled with an all-consuming, lusty haze. Your ");
		//TaurOrNeuter:
		if(pc.isTaur() || !pc.hasGenitals()) output(" [pc.breasts] and [pc.nipples]");
		//Else if PC.GotCock: 
		else if(pc.hasCock()) output("[pc.cocks]");
		else output("[pc.vaginas]");
		output(" deliciously rub");
		if(!pc.isTaur() || pc.cockTotal() == 1 || (pc.totalVaginas() == 1 && !pc.hasCock())) output("s");
		output(" against your ");
		if(pc.isTaur() || !pc.hasGenitals()) output("[pc.upperGarment]");
		else output("[pc.lowerGarment]");
		output(". You sigh with pleasure - the subtle, sensuous friction is slowly driving you nuts!");
	}
	// else
	else
	{
		output("Void, it's so hard to <i>think</i> right now! Instead, your senses are reeling, your head filled with an all-consuming, lusty haze. Walking around ");
		if(!pc.isNude()) output("half-");
		output("naked has wound you all up - now your lewdly exposed ");
		if(pc.isTaur() || !pc.hasGenitals()) output("[pc.chest]");
		else if(pc.hasCock()) output("[pc.cocks]");
		else output("[pc.vaginas]");
		if(pc.isTaur() || !pc.hasGenitals() || pc.cockTotal() > 1 || (!pc.hasCock() && pc.totalVaginas() > 1)) output(" are");
		else output(" is");
		output(" thrumming with pent-up pleasure.");
	}
	output("\n\nShould you walk back to the ship to deal with it? Find somewhere private to touch yourself? Both of these options are going to take so long! In the meantime, your ");
	if(pc.isTaur() || !pc.hasGenitals()) output("[pc.nipples]");
	else output("aching loins");
	output(" are practically <i>begging</i> to be attended to - you’re not sure how much longer you can hold out");
	if(pc.isCrotchGarbed() && pc.hasGenitals()) output(" before you’re creaming in your [pc.lowerGarment]");
	output("!");


	output("\n\nWhat if... you weren’t to hold out? Just play with yourself here, in front of everyone? The mere thought sends a delicious shiver down your spine. You’ll just touch yourself ... just a <i>little</i> bit to calm yourself down.. then you’ll stop...");

	output("\n\n");
	if((pc.isTaur() || !pc.hasGenitals()) && pc.isChestGarbed()) output("You groan and quickly strip off your [pc.upperGarments].");
	//Crotchgarbed && Non-Neuter && Non Taur:
	else if(pc.isCrotchGarbed()) output("You groan and quickly strip off your [pc.lowerGarments].");
	output(" With trembling fingers, you slide your hands down ");
	var taurNeuter:Boolean = (pc.isTaur() || !pc.hasGenitals());
	//TaurORNeuter:
	if(taurNeuter) output("and stroke your [pc.chest]");
	else
	{
		output("your [pc.belly] and ");
		if(pc.hasCock())
		{
			output("wrap them around ");
			if(pc.cockTotal() > 2) output("a pair of ");
			output("your needy [pc.cocks]");
		}
		else output("seek out your needy [pc.pussies]");
	}
	output(". You can’t believe you’re really going to do this, out here where anyone could catch you!");

	output("\n\nYou’re definitely attracting the attention of ");
	if(rooms[currentLocation].planet == "TAVROS STATION") output("various station-goers");
	else if(rooms[currentLocation].planet == "PLANET: MHEN'GA") output("the Esbethian citizens");
	else if(rooms[currentLocation].planet == "PLANET: TARKUS") output("the raskvel");
	else if(rooms[currentLocation].planet == "PLANET: NEW TEXAS") output("the local bulls and cows");
	else if(rooms[currentLocation].planet == "PLANET: MYRELLION") output("the myr");
	else output("those around you");

	output(". They peer at you, blinking as you begin to shyly stroke yourself before their curious gaze. They’re staring right at your ");
	if(taurNeuter) output("[pc.chest] and [pc.nipples] as you pinch and squeeze them.");
	else if(pc.hasCock())
	{
		output("[pc.cocks] as you wring and jerk ");
		if(pc.cockTotal() == 1) output("it");
		else output("them");
		output(", pre-cum already lazily dribbling down your turgid shaft");
		if(pc.cockTotal() > 1) output("s");
		if(pc.balls > 0) output(" and rolling over your [pc.balls]");
		output(".");
	}
	else
	{

		output("[pc.vaginas] as you finger ");
		if(pc.totalVaginas() == 1) output("it");
		else output("them");
		output(", plunging your digits inside and wiggling it around inside of your wetness.");
	}
	output("\n\nYou flush as they");
	if(rooms[currentLocation].planet == "PLANET: TARKUS" || rooms[currentLocation].planet == "PLANET: NEW TEXAS") output(" stare lustily at");
	//else if Myrellion: 
	else if(rooms[currentLocation].planet == "PLANET: MYRELLION") output(" stare in awe of");
	else output(" stare, utterly scandalized, at");
	output(" your ");
	if(taurNeuter) output("bared chest");
	else output("loins");
	output(". You can feel them burning each and every detail of your ");
	if(taurNeuter) output("[pc.nipples] and [pc.skinFurScalesColor] body");
	else
	{
		if(pc.hasCock()) output("[pc.cockHeads]");
		if(pc.hasCock() && pc.hasVagina()) output(" and ");
		if(pc.hasVagina()) output("[pc.pussies]");
		output(" into glorious memory as you ");
		if(pc.hasCock()) output("stroke");
		if(pc.hasVagina() && pc.hasCock()) output(" and ");
		if(pc.hasVagina()) output("finger");
		output(" yourself!");
	}

	//pc.notTaur:
	if(!pc.isTaur())
	{
		output("\n\nThe excitement makes you bolder, more confident. Driven by lusty need, you impulsively lay down on the ground");
		if(pc.legCount > 1) output(" and spread your [pc.thighs] wide");
		output(". With one hand, you ");
		if(pc.hasCock()) output("continue to jerk off [pc.oneCock]");
		else if(pc.hasVagina()) output("spread your pussy lips for all to see, winking your wetness at them");
		else output("continue to tease your [pc.chest]");
		output(". With the other, you press two fingers inside of your [pc.asshole] and wiggle them lewdly about - naughtily ");
		if(pc.hasCock()) output("jerking off and fingering your [pc.butt]");
		else if(pc.hasVagina()) output("fingering [pc.oneVagina] and [pc.ass] at the same time");
		else output("fingering your [pc.ass] in front of them");
		output("!");

		output("\n\nBucking your hips wildly in the air, you groan and shiver, hearing the clicking and flashing of ");
		if(rooms[currentLocation].planet != "PLANET: MYRELLION") output("holo-");
		output("cameras around you. You can’t believe you - [pc.fullName] - are finger-fucking yourself in front of all these people");
		if(pc.hasCock()) output(", wildly jerking yourself off");
		output(" and showing them just how much of a slut you are!");
	}
	else
	{
		output("\n\nYou groan and shiver as you tease your [pc.chest], hearing clicking and flashing of ");
		//notMyrellion:
		if(rooms[currentLocation].planet != "PLANET: MYRELLION") output("holo-");
		output("cameras around you. You can’t believe you - [pc.fullName] - are lewdly pinching your [pc.nipples] in front of all these people, showing them just how much of a slut you are!");
	}
	//pc is taur or Neuter:
	if(taurNeuter)
	{
		output("\n\nThat naughty little thought pushes you right over the edge. With a sharp, high-pitched cry, you shiver");
		if(pc.hasGenitals()) output(", ");
		if(pc.hasCock()) output("shooting your [pc.cum] all over the ground");
		if(pc.hasCock() && pc.hasVagina()) output(" and ");
		if(pc.hasVagina()) 
		{
			if(pc.isSquirter()) output("squirting your");
			else output("gushing");
			output(" [pc.girlCum] from your [pc.pussies]");
		}
		if(!pc.hasGenitals()) output(" and utterly cream yourself");
		output(". ");
		//pc.lactating:
		if(pc.isLactating())
		{
			output("At the same time, [pc.milkVisc], [pc.milkColor] [pc.milkNoun] lewdly shoots from your [pc.nipples] as you boob-gasm in front of everyone! ");
		}
		output("You can hear the ");
		if(rooms[currentLocation].planet == "TAVROS STATION") output("station-goers");
		else if(rooms[currentLocation].planet == "PLANET: MHEN'GA") output("Esbethians");
		else if(rooms[currentLocation].planet == "PLANET: TARKUS") output("raskvel");
		else if(rooms[currentLocation].planet == "PLANET: NEW TEXAS") output("New Texans");
		else if(rooms[currentLocation].planet == "PLANET: MYRELLION") output("myr");
		else output("onlookers");
		output(" gasping as you groan and tremble, riding out your glorious orgasm for all it’s worth.");
	}
	else if(pc.hasCock())
	{
		output("\n\nThat naughty little thought pushes you right over the edge. With a sharp, high-pitched cry, you shiver and shoot your [pc.cumVisc], hot [pc.cumNoun] all over your [pc.belly], ");
		if(pc.cumQ() < 50) output("lightly splattering it with [pc.cumColor]");
		else if(pc.cumQ() < 250) output("coating it in glistening [pc.cumColor]");
		else if(pc.cumQ() < 1000) output("utterly coating it in glistening [pc.cumColor] as well as your [pc.chest] and chin.");
		else
		{
			output("utterly dousing it, your [pc.chest] and [pc.face] in gallons of glistening, glorious [pc.cumColor].");
			applyCumSoaked(pc);
			if(pc.cumQ() > 5000) applyCumSoaked(pc);
			if(pc.cumQ() > 10000) applyCumSoaked(pc);
			if(pc.cumQ() > 30000) applyCumSoaked(pc);
			if(pc.cumQ() > 50000) applyCumSoaked(pc);
		}
		//pc.lactating:
		if(pc.canMilkSquirt() && pc.isLactating()) output(" At the same time, [pc.milkVisc], [pc.milkColor] [pc.milkNoun] lewdly shoots from your [pc.nipples] and up in the air as you boob-gasm in front of everyone!");
		output(" You can hear the ");
		if(rooms[currentLocation].planet == "TAVROS STATION") output("station-goers");
		else if(rooms[currentLocation].planet == "PLANET: MHEN'GA") output("Esbethians");
		else if(rooms[currentLocation].planet == "PLANET: TARKUS") output("raskvel");
		else if(rooms[currentLocation].planet == "PLANET: NEW TEXAS") output("New Texans");
		else if(rooms[currentLocation].planet == "PLANET: MYRELLION") output("myr");
		else output("onlookers");
		output(" gasping as you groan and milk your [pc.cocks] for all ");
		if(pc.cockTotal() == 1) output("it’s");
		else output("they’re");
		output(" worth, perversely milking ");
		if(pc.cockTotal() == 1) output("it");
		else output("them");
		output(" and your prostate until you’ve fired every last drop.");
	}
	else // pc.hasPussy:
	{
		output("\n\nThat naughty little thought pushes you right over the edge. With a sharp, high-pitched cry, you shiver and ");
		if(pc.isSquirter()) output("squirt your");
		else output("gush");
		output(" [pc.girlCum] from your [pc.vaginas]");
		output(".");
		if(pc.isLactating() && pc.canMilkSquirt()) output(" At the same time, [pc.milkVisc], [pc.milkColor] [pc.milkNoun] lewdly shoots from your [pc.nipples] and up in the air as you boob-gasm in front of everyone!");
		//ElseNotLactating:
		else 
		{
			output(" It’s not long before your [pc.ass] is utterly covered in your lady juice, not to mention the floor ");
			if(pc.legCount > 1) output("between your [pc.thighs]");
			else output("underneath");
			output(".");
		}
		output(" You can hear the ");
		if(rooms[currentLocation].planet == "TAVROS STATION") output("station-goers");
		else if(rooms[currentLocation].planet == "PLANET: MHEN'GA") output("Esbethians");
		else if(rooms[currentLocation].planet == "PLANET: TARKUS") output("raskvel");
		else if(rooms[currentLocation].planet == "PLANET: NEW TEXAS") output("New Texans");
		else if(rooms[currentLocation].planet == "PLANET: MYRELLION") output("myr");
		else output("onlookers");
		output(" gasping as you groan and rub your [pc.vaginas] and [pc.asshole], perversely stretching out your orgasmic high for as long as you can!");
	}
	output("\n\nAfter the afterglow wears off, your cheeks burn as you realize just how much of a spectacle you made. You really didn’t mean to touch yourself that much! For some reason, you’re filled with a fuzzy sense of fulfilment. You’d better not do this kind of thing too often - it feels like it could be addictive!");
	if(pc.exhibitionism() >= 75) output(" Could... could you secretly be an exhibitionist, perhaps-?");
	processTime(20+rand(10));
	pc.exhibitionism(1);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}


/*BIONAHOLE SHIT
Tamani BionaHole
//Tooltip: A living sextoy, BionaHoles are cloned vaginas in advanced life-support sheaths. This particular model has a bright pink sheath with a sparkly silver signature on the side, and its label indicates it’s cloned and modded to be exactly like the vagina of TamaniCorp’s oversexed CEO.
//Cost: 5,000 C.
//biona.color = pink
//biona.sheathColor = pink
//biona.texture = Nubby

Nivas BionaHole
//Tooltip: A living sextoy, BionaHoles are cloned vaginas in advanced life-support sheaths. This particular model has a sheath so dark blue that it’s almost black, with a big red lipstick kiss on the side. The label tells you it’s cloned directly from galaxy-famous hyperporn starlet Nivas Oxonef.
//Cost: 5,000 C.
//biona.color = creamy
//bionaSheath.color = dark blue
//biona.texture = smooth
*/

public function bionaColor(arg:String = "Nivas"):String
{
	if(arg == "Nivas") return "creamy";
	else if(arg == "Tamani") return "pink";
	return "<b>ERROR UNDEFINED COLOR</b>";
}
public function bionaSheathColor(arg:String = "Nivas"):String
{
	if(arg == "Nivas") return "dark blue";
	else if(arg == "Tamani") return "black";
	return "<b>ERROR UNDEFINED SHEATH COLOR</b>";
}
public function bionaTexture(arg:String = "Nivas"):String
{
	if(arg == "Nivas") return "smooth";
	else if(arg == "Tamani") return "silken";
	return "<b>ERROR UNDEFINED TEXTURE</b>";
}

//Using a BionaHole
//Add each owned to Masturbation menu
public function bionaholeUse(arg:String = "Nivas"):void
{
	CodexManager.unlockEntry("BionaHoles");
	//Always tutorial firsttime.
	if(arg == "Nivas" && flags["NIVAS_TUTORIAL"] == undefined)
	{
		bionaHoleInstructionalBullshit();
		return;
	}
	else if(arg == "Tamani" && flags["TAMANI_HOLED"] == undefined)
	{
		tamaniBionaholeInstruction();
		return;
	}
	clearOutput();
	var x:int = pc.cockThatFits(500);
	if(x < 0) x = pc.smallestCockIndex();
	showName("BIONAHOLE\nUSAGE");
	author("Savin");
	output("Deciding to have a little fun with your living sextoy, you ");
	if(InShipInterior()) output("pop the BionaHole off its charger");
	else output("fish the BionaHole out of your pack");
	output(" and twist off the vented cap, revealing the " + bionaColor(arg) + " flesh beneath. The visible part of the toy looks exactly like a perfectly shaved woman’s vulva, complete with mons and lips that glisten with just a hint of moisture. The cloned cunt looks positively delicious - enough so that you bring it up to your [pc.lips] and give it an experimental lick. The taste is lush and <i>alive</i>, warm and sweet in the same way any other pussy ought to be. And like a real cunt, the lips flush with arousal when you touch them, gently clenching around your [pc.tongue] as it passes between them.");
	output("\n\nGrinning to yourself, you ");
	if(!pc.isNude()) output("slip out of your clothes");
	else output("toss your gear aside");
	output(" and slip down ");
	if(!InShipInterior()) output("onto the ground");
	else output("onto your cabin’s chair");
	output(", wrapping a hand around your [pc.cock " + x + "]. There’s no sense in foreplay with a sextoy, even a living one like this, so you give yourself a few quick strokes to hardness before aligning the " + bionaSheathColor(arg) + " sheath with your [pc.cockHead " + x + "], brushing the dark lips of the cloned pussy. Beads of moisture reach out to caress your crown, radiating a musky heat onto your [pc.cock " + x + "] that all but draws you in. The lips part effortlessly");
	//if bigcock:
	if(pc.cockVolume(x) >= 600) output(", inhumanly elastic for your pleasure");
	output(", letting you easily push the " + bionaSheathColor(arg) + " package down your rock-hard rod. The inside is as hot and wet as you’d expect from any girl, with " + bionaTexture(arg) + " walls that squeeze tightly around your schlong, throbbing in their own right as you stimulate the pussy’s tenderest spots.");
	output("\n\nYou sink the sheath down ");
	if(pc.cockVolume(x) < 500) output("until it’s pressing against your groin, completely enveloping your [pc.cock " + x + "] in its sultry embrace");
	else output("until your [pc.cockHead " + x + "] is battering against the sealed back of the pussy’s channel, wrapped so tightly by " + bionaTexture(arg) + " wetness that you can barely think");
	output(". Leaning back, you let your eyes roll closed and start to piston the BionaHole up and down your lube-slicked shaft. The toy is everything you’d expect it to be, reacting as if it was mounted between its owner’s legs, clenching and drooling and flushing with its own arousal. You can see its clit swelling, so sensitive that you can’t help but twist your thumb down to caress it. The pussy trembles at your touch, drenching you in sweet fem-cum at the apex of every thrust between its lips.");
	output("\n\nThe warmth and wetness shrouding your prick, the way the toy squeezes lovingly around your thrusting length, is enough to easily bring you over the edge. You gasp, sucking in a sharp breath as your whole body clenches in preparation, forcing you to arch your back");
	if(pc.tailCount > 0)
	{
		output(" and fling your tail");
		if(pc.tailCount > 1) output("s");
		output(" straight-out behind you");
	}
	output(" as you cum. A geyser of [pc.cumNoun] floods from your [pc.cockHead " + x + "] into the living sextoy’s waiting reservoir, filling the cloned cunny with your seed ");
	if(pc.cumQ() < 400) output("until you’re utterly spent.");
	else if(pc.cumQ() <= 1500) output("until the toy’s so full you’re afraid it will burst.");
	else output("as wave after wave of [pc.cumNoun] fills it with inhuman magnitude, quickly overwhelming the poor toy’s ability to cope. Spunk gushes out of its tight pussylips and onto your lap, washing you down in spooge.");

	output("\n\nWith a heavy sigh, you flop back and release your grip on the BionaHole, letting the " + bionaSheathColor(arg) + " case hang from your slowly deflating member");
	if(pc.hasKnot(x)) output(", caught on the bulk of your [pc.knot " + x + "]");
	output(". It takes a moment for you to catch your breath");
	if(pc.cumQ() > 1500) output(" and clean up the generous mess you’ve made");
	output(" before you pop the well-fucked toy off your cock and put its seal back on - lucky for you, it’s self cleaning.");

	output("\n\nYou ");
	if(currentLocation == "SHIP LOCATION") output("return it to its power charger");
	else output("toss it back in your pack");
	output(" and get ready to return to work.");
	IncrementFlag("NIVAS_BIONAHOLE_USES");
	processTime(25+rand(10));
	pc.orgasm();

	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Using Tamani’s BionaHole
//By Fenoxo
//purple hair
//Pointy ears
//Punky
//Corset(leather)-straining breasts - purple nips
//Violet eyes
//One nip pierced with hardlight ring
public function tamaniBionaholeInstruction():void
{
	clearOutput();
	showBust("TAMANI_NUDE");
	showName("\nTAMANI");
	author("Fenoxo Fenbutt");
	output("Excited to fuck a perfect copy of one of the galaxy’s top CEOs, you pull the protective cap off the Tamani Ultralux Edition BionaHole. Inside is as perfect a pubic mound as you’ve ever seen. Flawless, bubblegum-pink skin surrounds a puffy slit so vibrantly purple that it would look at home on an old-fashioned neon light. Moisture beads on the flush petals like morning dew, ensuring it’ll be lubricated and ready to go at a moment’s notice. You could probably pull it out of its case at any time, night or day, and Tamani’s cunt would be drooling for you all the same.");
	output("\n\nThere’s no need to rush into this, however. The high-tech sex-toy came with a holovid featuring the corporate tart herself, titled <i>“Fucking My Pussy,”</i> and ");
	if(flags["TAMANI_HOLED"] == undefined) output("you can think of no better time to watch it than now.");
	else output("it should be just as fun to watch as it was the first time.");
	if(!InShipInterior()) output(" You load it up on your Codex and prop it up so that you can get a good look at it while your hands are busy.");
	else output(" You load it up on your ship’s console. It beats the hell out of trying to use the tiny projectors in your Codex.");
	output(" A crack of static splits the air a moment before the hologram resolves into the unmistakable owner of the cloned cunt in your palm.");
	output("\n\nA vision of fushia curves gift-wrapped in lace gazes down somewhere to the left of you, a knowing smile across her purple-veneered lips. <i>“Hey there, " + pc.mf("stud","cutie") + ". If you’re watching me, then you’ve got the hottest, wettest, best-feeling pussy on this side of the core in your hands, but before you get started, please calibrate your projectors so that I’m appropriately positioned. I want you to get the complete experience, and it just wouldn’t be the same if it sounded like I was moaning for some");
	var x:int = pc.cockThatFits(400);
	if(x < 0) x = pc.smallestCockIndex();
	if(pc.mf("m","") == "m")
	{
		if(pc.cocks[x].cLength() >= 12) output(" other big-dicked boy");
		else output("one else’s delicious dick");
	}
	else
	{
		if(pc.cocks[x].cLength() >= 12) output(" other big-dicked breeder");
		else if(pc.hasVagina()) output(" other herm with a needy, pent-up dick");
		else output("one else’s delicious dick");
	}
	output(". Just give the ‘enter’ key a smack when you’re all done, and pretend it’s my ass.”</i>");

	output("\n\nYou tap a few buttons to rotate her to face you, then align her to be just above your crotch.");
	if(!InShipInterior())
	{
		output(" Sure, the miniature holo-projectors make her look a little small, ");
		if(CodexManager.entryUnlocked("Raskvel")) output("like a raskvel");
		else output("like some kind of oversized-pixie");
		output(", but you’re already pushing the limits of your Codex’s abilities.");
	}
	else output(" Her wide hips almost perfectly straddle your own, giving a convincing approximation of coitus with the dolled-up, executive slut.");
	output(" If it wasn’t for your arm disappearing into her holographic midsection, you could almost imagine the real Tamani was right here, on top of you and slowly dripping moisture onto your crotch. You smack the enter button, satisfied that her mischievous, violet eyes are meeting your own.");
	output("\n\n<i>“All finished? But we’re just getting started!”</i> Tamani feigns a pout while squeezing her tits together into a valley of cleavage. <i>“I’m sure you’ve got more of that warm, sticky stuff for me and my pretty, purple pussy, doncha?”</i> She bites her lower lip and looks over your [pc.chest]. <i>“Fuck, I can’t wait anymore. Go ahead and stick it in. Shove your cock in my pussy, " + pc.mf("stud","slut") + ". I promise, I won’t mind.”</i>");
	output("\n\nLining the BionaHole up with your [pc.cockNoun " + x + "] is surprisingly difficult when you can’t see either through the taut belly of your simulated sex partner, forcing you to rely on touch alone. Your [pc.cockHead " + x + "] bounces off the edge of the slippery flesh two or three times before you blindly hit paydirt, spreading the slippery entrance open with your turgid length. The buttery-slick curtains part around you, welcoming you, begging you to slide deeper, and you do, nestling yourself firmly into the slippery crevice. It’s just as warm as the real thing.");
	output("\n\nSlowly gyrating her hips in counterclockwise circles, Tamani quietly moans, obviously enjoying the feeling of something entering her snatch. <i>“Oooh, somebody’s eager to get inside. And here I thought you’d have the self control not to plunge in straightaway.”</i> She giggles, her projected breasts jiggling just before your eyes. <i>“But I guess my pussy really is irresistible, isn’t it? Once you’ve tasted it, you can’t think about anything else but nutting inside. I bet you’d enjoy that, right? The inside is just </i>so<i> warm and wet, so utterly and completely cum-hungry. You’ve just got to give it what it wants!”</i>");
	output("\n\nThere’s no point in arguing with her. Aside from the fact that she’s a holographic projection, she’s right - her cunt is squeezing down around your [pc.cock " + x + "] like a long lost lover, smothering you in velvety caresses, lashing your veiny length with whip-cracks of erotic sensation. You very nearly cum for her already, but you hold out for now. You’re just getting started, and you don’t want to cum before you get to the climax of this recording.");
	output("\n\nBouncing and gyrating atop you, Tamani coos, <i>“Come on, " + pc.mf("stud","slut") + ", really let me have it. Don’t hold back!”</i> She moans, high-pitched and feminine, an enticement to continue your ravaging of her vagina, holographic or otherwise. She’s all too happy to have you buried deep inside. <i>“It feels great, right? You know, the harder you fuck me, the wetter I’ll get. Make sure you bottom out every time, just like... just like that!”</i> Her voice lilts almost musically, driven to the upper register by the unsubtle intrusion of a too-eager phallus.");
	output("\n\nYour up-and-down stroking synced to the tempo of the bouncing harlot long ago. There’s no better way to do it really. It feels so much better when the quivering slit in your hand is pumping your cock right along with the moaning mess above. It’s so much more <i>real</i> that way, like you’re really fucking Tamani - like that lush, lewd body is trembling with the pleasure of mounting you. You groan and lift your hips to meet the downward sliding pocket-cunt. It splatters its libidinous drippings across your crotch");
	if(pc.balls > 0) output(", drenching your [pc.balls]");
	else if(pc.hasVagina())
	{
		output(", coating your cunt");
		if(pc.totalVaginas() > 0) output("s");
		output(" with foreign moisture");
	}
	output(". The real Tamani must drink gallons of water, just to feed her soaking quim.");
	output("\n\n<i>“Oh! Harder!”</i> the purple-haired hussy cries. <i>“Take me harder!”</i> Her skin has broken out in a fine sheen of sweat. Small droplets roll down her curves, beading off her amaranthine nipples. She glistens wetly, her narrow waist and wide hips allowing you to watch her gleaming ass flex with the effort of riding you. Tamani’s pussy clutches desperately to your cock when you bottom out, undulating up and down your shaft until you feel delirious with pleasure. She leans low, her tits swaying just in front of your face. You can pick out every bit of pebbly texture on her areolae, but it’s hard to keep your eyes from rolling back.");
	output("\n\nYou can feel your [pc.cocks] tightening and flexing from pleasure now.");
	if(pc.hasVagina()) 
	{
		output(" Juice dribbles down your [pc.thighs] - not just hers, but yours as well. You slide a few fingers into ");
		if(pc.totalVaginas() > 1) output("a");
		else output("the");
		output(" needy slit, strumming your own feminine folds and wishing you could somehow fuck them as well.");
	}
	output(" A rhythmic tightening ache wells up inside you, burning hot with the need for release. Tamani was right. You really do want to creampie her pussy. UGC peacekeepers could ");
	if(InShipInterior()) output("break down your cabin door");
	else output("catch you in the act right now");
	output(", and you wouldn’t care. They’d have to pry the lewdly slurping sex-toy out of your hands with a crowbar.");

	output("\n\nTamani visibly shudders, sending her breasts bouncing, slapping and jostling for far longer than you’d expect. You desperately wish you could reach up and grab hold of one, and vow to do just that should you ever get to fuck her for real. She moans, <i>“Mmmm, nothing like a little micro-orgasm to remind me of why I do this.”</i> Giving you a serious glance (but not slowing her gyrations in the slightest), Tamani asks, <i>“You haven’t cum yet, have you?”</i> Her pussy makes a lurid squelch as it bottoms out once more, fully engulfing your [pc.cock " + x + "]. <i>“No little orgasms for you, " + pc.mf("stud","slut") + ". I’m gonna give you a big one, and-mmm.... You’re gonna make it extra gooey for me.”</i> She gropes her own tit, twisting her hardlight nipple ring, any further words turned incoherent by libidinous moans.");
	output("\n\nThe elfin-eared woman is right. You can feel the heat of a powerful orgasm welling up from inside you, engorging your [pc.cocks] with almost painful amounts of blood. Right now, you’re as hard and as thick as you’ve ever been, and ");
	if(pc.cumQ() < 100) output("you’re definitely leaking pre-cum into her drooling depths");
	else if(pc.cumQ() < 1000) output("you’re definitely spilling streams of pre-cum into her sodden depths");
	else output("you’re practically pissing pre-cum into her sodden depths, flushing her lube out with your own virile excesses");
	output(". You could push yourself over the edge right now with a few too-quick pumps, but you hold off, letting the pleasure rise with maddening slowness to crescendo, building that ball of need within you until it feels white-hot and molten.");
	output("\n\n<i>“You’re getting so big inside me! I bet you want to cum now, right?”</i> Tamani shivers and grabs her boobs in both hands, none-too-gently kneading her pillowy mammaries. <i>“I think that’s a pretty good idea.”</i> She bites her lip to stifle a moan. <i>“It’s not healthy to hold it in </i>too<i> long. You should make sure you bottom out when you cum and give my cunt a spunk bath.”</i> She leans down, phantom breasts squishing down an inch above your [pc.fullChest]. <i>“I can’t imagine any of my pretty pussies going without a gooey filling, so you had better cum long and hard.”</i>");
	output("\n\nYou groan, your climax being coaxed out one filthy word at a time. Every nerve on your [pc.cockNoun " + x + "] is tingling and primed, ready to deliver waves of ejaculatory bliss.");
	output("\n\n<i>“Come on, " + pc.mf("stud", "slut") + ", cum for me. Give me every drop”</i> Tamani arches her back and howls in delight. <i>“That’s it, you just lie back and squirt squirt squirt”</i>");
	output("\n\nYou do just that, lancing [pc.cumNoun] arc after arc of [pc.cum] into the silk-textured depths of Tamani’s BionaHole. The slutty CEO doesn’t miss a beat, even though she’s obviously getting a filling of her own. Her belly visibly pudges out with some nameless pornstar’s seed, giving her a supple roundness that only enhances her feminine appeal. You easily imagine that it’s your own [pc.cumNoun] doing the inflating,");
	if(pc.cumQ() < 200) output(" even though the creampie you’re delivering is nowhere near stuffed enough for that.");
	else if(pc.cumQ() < 2000) output(" a task made easier by the way your ejaculate has pressurized her interior, causing your [pc.cumColor] spunk to spill out over your crotch in thick waves.");
	else output(" even though you could manage that from a single, potent squirt. Rivers of your [pc.cumColor] stuff boil out around your seizing member, running over your [pc.hips] and [pc.thighs] like flows from an erupting volcano.");
	output("\n\nTamani coos, gathering a strand of suspiciously white fluid from between her legs to suckle. <i>“Mmm!”</i> She shudders and shakes, eyelids fluttering in a cum-triggered orgasm.");
	if(pc.fluidColorSimple(pc.cumType) != "white") output(" A shame they couldn’t design the holo to color-correct the fluids to match your own.");
	output(" <i>“Good job, " + pc.mf("stud","slut") + ". Be sure to get some Spunkbuster supplements from your local TamaniCorp store, okay? I want you to take good care of my hungry little clone-cunt and bathe it in cum daily, okay?”</i>");
	output("\n\nShe blows you a kiss, and the projection fades away, leaving you flat on your back with a ");
	if(pc.cumQ() < 200) output("creampied pussy impaled on your [pc.cockNoun " + x + "].");
	else if(pc.cumQ() < 2000) output("absolutely flooded pussy impaled on your [pc.cockNoun " + x + "].");
	else output("flooded pussy impaled on your [pc.cockNoun " + x + "] and a puddle of [pc.cum] under your [pc.butt].");
	if(pc.cockTotal() == 2) output(" Your other penis went off too, painting your [pc.chest] with a thick layer of free-flying [pc.cumNoun].");
	else if(pc.cockTotal() > 2) output(" Your other penises went off too, painting your [pc.chest] with a thick layer of free-flying [pc.cumNoun].");
	output("\n\nDamn, what a slut.");
	IncrementFlag("TAMANI_HOLED");
	processTime(27);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//BionaHole Instructional Holodisk: Nivas Oxonef
//Get when you buy her bionahole. Stick in Key Items, access via Codex. Gotta have a cock for this scene.
//Always play this scene the first time you try and use her bionahole.
public function bionaHoleInstructionalBullshit():void
{
	clearOutput();
	author("Savin");
	showBust("NIVAS");
	showName("NIVAS\nOXONEF");
	var x:int = pc.cockThatFits(500);
	if(x < 0) x = pc.smallestCockIndex();
	output("Deciding you want to see what it’s like to fuck the galaxy’s most famous pornstar, you grab your ");
	if(flags["NIVAS_TUTORIAL"] == undefined) output("new");
	else output("trusty");
	output(" BionaHole and pull off its cap, revealing the perfectly smooth, creamy ausar mons mounted in the dark blue sheath. You immediately feel the warmth radiating off of Nivas Oxonef’s puffy pink pussylips; they seem to wink at you as you drink in its lush smell and heat, gently glistening with feminine moisture.");
	output("\n\nBut you don’t want to just sit down and jam your dick into the toy’s lips... at least, not without a little extra stimulation. As you get rid of your [pc.gear], you grab your Codex and prop it up where you can see the screen from ");
	if(!InShipInterior()) output("somewhere comfortable on the ground");
	else output("your bed");
	output(". Satisfied, you scroll through your stored media until you alight on the <i>“instructional”</i> holovid that came with the toy and punch it on.");

	output("\n\nYou sit and and start to gently caress your [pc.cock " + x + "] as the vid starts to play, scrolling quickly through a bunch of multi-language legalese and credits before opening to a shot of Nivas herself, sitting back and relaxing on a plush leather couch. She’s as smoking hot an ausar babe as you could expect: long hair dyed a lustrous dark blue parting around a pair of tall canid ears. She’s got a cutely feminine face with big almond-shaped blue eyes under a hint of aqua shadow, and full pink-painted lips. Nivas is rocking a pair of tight black latex booty shorts that show off a lot of long, slender leg, and a too-tight latex top revealing a very, very generous amount of creamy cleavage. Several colorful silk ribbons adorn her dark blue tail, swishing beside her on the seat as the camera pans up and down her half-bare body.");
	output("\n\n<i>“Hey there,”</i> the starlet purrs seductively as the camera drone settles on her face. She blows it - and you - a rosy-lipped kiss, wrapping her arms around the back of the couch and thrusting out her ample chest.");
	output("\n\n<i>“Hey,”</i> a disembodied masculine voice says from behind the camera. <i>“Why don’t you introduce yourself, beautiful?”</i>");
	output("\n\nNivas chuckles and rolls her eyes. <i>“I think we all know the answer. Why don’t you look at the side of that toy you’ve got there, big boy?”</i>");
	output("\n\nShe reaches under the camera’s view and retrieves a dark-cased BionaHole, the same as the one you’re holding in your hand. <i>“I’m Nivas Oxonef, and this is my pretty little pussy,”</i> she smiles, holding the sheathed twat up lips-first to the camera, giving you a good look at the clone of the toy in your hands. She brushes a blue-furred finger across one of its lips, using her long nail to peel them apart and reveal the dark, wet passage between them.");
	output("\n\n<i>“I’m here to show you just how to get the most out of </i>your<i> brand new TamaniCorp BionaHole, a perfect clone of the galaxy’s most well-fucked piece of ausar tail,”</i> Nivas says, running a pair of fingers from the lips of her BionaHole down to her latex shorts, rubbing the material just over her crotch. <i>“Guaranteed to satisfy you again and again and again, or... well, take the entire industry’s word for it: it will.”</i>");
	output("\n\nShe gives the camera another playful wink and stands up; her shorts ride high, digging into the crevice between her legs so tightly you’re sure you can see excitement glistening on her upper thighs. The porn star takes a few leggy strides, reaching out and grabbing the camera. It follows her back to one of the couch’s armrests, looking down the naked body of a human man who’s just laid down, hands wrapped around his thick cock. Nivas lets the drone go and climbs back onto the couch, straddling the man’s legs, putting chest and crotch right in the screen’s focus. You can’t even see much of the man from the drone, just his chest and erect cock - you’re in POV mode now!");
	output("\n\n<i>“I want you to just lay back, relax, and let my pussy do aaallll the work for you,”</i> she purrs at you, gently brushing the man’s hand aside to leave his cock standing straight up like a great big pole of meat. You mimic his position as best as you can, lying straight back and willing your cock to hardness.");
	output("\n\n<i>“You want to be nice and hard before we get started,”</i> she tells you, reaching out to grab the man’s cock in her furry hand. He gasps and grunts as she starts to stroke, saying, <i>“I like to use my hands for that part, but if you want to imagine my big, soft breasts wrapping around your meat...”</i> one hand reaches up to cup a tit through her latex top, squeezing hard through the creaking material. <i>“Well, I won’t blame you. Whatever gets you nice and hard for me...”</i>");
	output("\n\nLetting your imagination run wild, you wrap your hand around your [pc.cock " + x + "] and start to stroke, matching the motions of the seductive starlet on screen. It doesn’t take long before you’re at full mast, and as by some perfectly timed coincidence, Nivas decides her partner’s ready too. <i>“Mmm, that’s a tasty-looking cock. My pussy’s practically soaking itself already... it just can’t wait to feel you deep inside it.”</i>");
	output("\n\nYou watch eagerly as the starlet takes the dark blue sheath in her hands and angles it directly over her partner’s thick crown. <i>“Now here comes the best part... or the second best, anyway,”</i> Nivas croons, rocking the lips of her toy back and forth around the man’s cock; you mirror her movements, letting your [pc.cockHead " + x + "] bathe in the wet warmth of Nivas’s cloned cunny. Slowly, you and the dyed ausar babe both lower the toy down, agonizingly slowly, letting you wallow in just how hot she is, so smooth and slick that you feel like you could fall into it. She’s ");
	if(pc.cockVolume(x) < 200) output("not tight");
	else if(pc.cockVolume(x) < 400) output("actually kind of tight, but nowhere as much so as most girls would be");
	else output("blissfully tight");
	output(". Clearly the TamaniCorp designers made sure to capture the whole Nivas Oxonef experience - after all, she’s basically the galaxy’s biggest size queen! You moan in pleasure as the toy slowly sinks down ");
	if(pc.cockVolume(x) < 500) output("to encapsulate your entire shaft");
	else output("until your [pc.cockHead " + x + "] is battering the back of its throbbing canal");
	output("; all the while it throbs and clenches down around you like a pussy ought to, responding to your stimulation with lurid squeezes and drooling musky lube down your cock.");

	output("\n\n<i>“Mmm, you’re stretching me out sooo nice,”</i> Nivas moans, arching her back and wagging her tail frantically behind her. <i>“Nothing my pussy loves more than a big, thick cock. God, I’m so wet... aren’t I?”</i>");

	output("\n\nThe man grunts in affirmation, bucking his hips into the toy’s warm embrace. <i>“Mmm, now that you’re nice and deep, I want you to put your hands down. That’s right, let my pussy work... feel it squeezing down around you, so hot and wet... it’s so much more sensitive than you can imagine, like one big, throbbing clit. Feel it? Goooood, let it sit there, get used to you... enjoy that big cock inside it.”</i> Oh, you can feel it all right. The BionaHole feels like it might just be cumming, spurting juices down your rod and squeezing rhythmically all along your length. God damn, it feels good, even when it’s not moving...");

	output("\n\nYou don’t doubt the living toy could make you cum just like that, but Nivas has other plans in mind. Winking at the camera, she shifts forward, pressing her crotch up against the side of the sheath and groaning lowly. <i>“Alright. I think I’m nice and ready for you, huh? Now let’s get moving...”</i>");

	output("\n\nSlowly, Nivas rises on her knees, taking her drooling, cloned cunny up her partner’s shaft in sync with her hips, just as if it were her real pussy. The man moans, just like you do when you drag the toy all the way up until its lips are squeezing your [pc.cockHead]. Nivas smiles and bucks her hips, down and up and down again, vicariously bouncing on her partner’s cock. Her latex gear creaks and groans as she moves, trying valiantly to keep her big breasts from bouncing around under her top - and failing in the most alluring way, making her tits jiggle hypnotically beneath the dark latex.");

	output("\n\n<i>“Don’t hold back, now,”</i> she murmurs, moving her hips and toy faster. <i>“You don’t have to impress me... this is all about you, baby. All about how amazing my pussy feels for you, and how much you enjoy it draining all the cum from you! Now give me every drop, okay?”</i>");

	output("\n\nYou can’t argue with that logic - what’s to stop you from just surrendering to the pleasure? You ram your hips into the pistoning sextoy, letting the sodden twat milk your [pc.cock] for all its worth. It doesn’t take long to bring yourself to the brink, mimicking Nivas’s skillful ministrations on-screen that has her partner groaning and squirming, trying desperately not to cum - <i>“Naughty dick,”</i> Nivas chides, moving her hips faster. <i>“I told you to cum!”</i>");

	output("\n\nYou cum.");

	output("\n\nExplosively, violently, orgasmically, you unleash a torrent of seed into the cloned cunt in your hands, flooding the dark sheath with as much spunk as you can offer. As if she knows what’s going on in the real world, Nivas moans for the camera, grinding her hips as she milks out her partner’s spunk until it’s drooling back down his shaft, staining his crotch into a sloppy white mess.");
	if(pc.cumQ() < 200) output(" Damn, that’s a lot!");
	else if(pc.cumQ() < 1500) output(" Just like what you’re doing!");
	else output(" This guy’s got nothing on you, though - you’re going to be reeking of this lake of cum for hours!");

	output("\n\n<i>“Ohh, you must have been sooo pent up,”</i> Nivas coos, running a hand through the spunk on the man’s crotch and bringing it up to her lips, sampling the salty seed. <i>“Saving it all up for me, were you? How sweet... but now that you’ve got 24/7 access to this pussy, you never need to go blue-balled again.”</i>");

	output("\n\nGlancing up at the camera, Nivas relishes the bit of cum she’s cleaning off her wolfish claw. <i>“Feel free to use my pussy as much as you want. Every day... ten times a day... even more. I can take everything you can give me and then some, baby. Just plug this holo in and fap away...”</i>");

	output("\n\nShe blows the camera a kiss and pulls the BionaHole off her partner’s cock, letting a gush of spunk drool out from its lips. <i>“Now if you’ll excuse me, I’ve gotta clean up this awful mess I’ve made. See you around, cutey.”</i>");

	output("\n\nThe vid flicks off, leaving you to clean yourself up - probably the biggest difference between the toy and having a real cum-hungry whore to tongue-clean your [pc.cock " + x + "]...");
	flags["NIVAS_TUTORIAL"] = 1;
	IncrementFlag("NIVAS_BIONAHOLE_USES");
	processTime(37+rand(6));
	pc.orgasm();
	//[Next]
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}


/*
// Using Syri’s BionaHole
// Must have follower Syri, have gotten her twat-in-a-box. PC must have a cock that can fit.
// Add [BionaHole] to Syri’s menu.
// Tooltip: Ask Syri if you can borrow her perfectly packaged pussy for a little playtime.
public function bionaHoleSyri():void
{
	clearOutput();
	author("Savin");
	showSyri(true);
	
	var x:int = pc.cockThatFits(350);
	if (x < 0) x = pc.smallestCockIndex();
	
	output("You take a step towards your ausar lover, slipping one hand around Syri’s supple waist... and the other around behind her, to the hefty black pipe sitting on her desk. <i>“Mind if I borrow this?”</i> you ask with a coy smile, showing the randy pup what you’ve got in mind.");
	
	output("\n\n<i>“What? My ass not good enough for you, Steele?”</i> she teases, grabbing your [pc.butt]");
	if (!pc.isNude()) output(" through your clothes");
	output(" while you’re still so close. The way she moves against you, you can feel a very familiar stiffness growing against your");
	if (pc.tallness >= 84) output(" thigh");
	else if (pc.tallness >= 48) output(" belly");
	else output(" chest");
	output(" through Syri’s jeans. <i>“Yeah, I guess you can use it... if you don’t mind sloppy seconds. Let me tell you, I’ve been enjoying the hell out of it. Something just gets me going like crazy about fucking myself like that, watching those rosy red lips of mine quiver around my knot... mmf!”</i>");
	
	output("\n\nSyri chews her lip, blue eyes tracing you up and down. <i>“And one more thing. You can use it, but I get to watch. Deal?”</i>");
	
	output("\n\nWow, she really gets off on this! After a moment’s mock consideration, you agree to your lover’s terms and give her a gentle push back against the desk, a perfect place to perch while you sprawl out on her bed and get to work. Syri’s raven tail thumps audibly against the desk’s legs as she leans back against it, one hand supporting herself, the other starting to zip her fly down. Well, if that’s the way she wants it, you suppose you can put on a bit of show for the horny voyeur. You");
	if (!pc.isNude()) output(" pull off your clothes piece by piece, turning around to give Syri a good look at your [pc.butt] before showing off the half-hard rod of your [pc.cock], ready to plunge it into the wet vice of her erstwhile pussy.");
	else output(" don’t have much to strip off, and so spend a good deal of time crawling into the bed, showing off your bare ass and emphasizing your [pc.cock] - the last she’ll see of it before you sheath it in her erstwhile twat.");
	output(" Glancing over your shoulder, you see that even the barest bit of teasing has Syri breathing hard, her double-Ds pressing against the front of her T-shirt with a pair of very obvious promontories at the crest of the perfect mounds.");
	
	output("\n\nWinking at your lover, you lie back on her bed and pop the ventilated lid from her custom-made BionaHole, revealing the smooth pink flesh beneath. A pair of rose-red lips gently reach up from the surface, glistening with moisture. You can feel the heat radiating off of the bio-preserved pussy, a sultry, muggy warmth that begs for you to slip a finger in and play. It’s hard to pass up the opportunity, and you quickly shift your grip around the black sheath to let you brush a pair of fingers gently across Syri’s pussylips. Just like you’d expect, the crimson lips twitch in response to your touch, squeezing down ever so slightly around a fingertip that you slip inside.");
	
	output("\n\n<i>“Mmm, you really know how to treat a pussy right,”</i> Syri teases from her perch, sitting on the edge of the desk. Glancing her way, you see the lusty ausar’s fished her broad red puppy-cock out from her pants, and with her legs splayed wide open, you’re treated to a picture-perfect view of her pillar of dogmeat. Her black-furred hand is wrapped around the still-slender base, slowly rubbing her fuzzy fingertips around where her knot will soon appear. Given what you’re about to do, you’re surprised she’s playing with her cock and not, say, a thick dildo - is she fantasizing about being in your place, or her pussy’s?");
	
	output("\n\nEither way, you’re going to give her a hell of a lot of fapping fuel! You plunge a pair of fingers deep into the BionaHole: the preserved pussy makes a lurid, wet noise as you finger-fuck it, drooling moisture around your digits as it feebly clenches. It’s amazing how sensitive it seems... especially when you run your thumb across its tiny little clit, brushing back the hood and caressing the swollen nub. If the toy were attached to a person, you’re sure she’d be moaning and squirming around you. Instead, though, all Syri’s twat can do is quiver and drool its warm juices all over your hand, giving you plenty of lube for what’s to come.");
	
	output("\n\nSatisfied with your efforts, you pop your fingers out and shift the black sheath down towards your crotch. You");
	if (pc.hasLegs()) output(" spread your legs");
	else output(" move to emphasize your cock for Syri");
	output(", making sure your lover has a good view of the action. She certainly shows her appreciation, chewing her lower lip and fixing her big blue eyes on your [pc.cock]. Her hand moves faster around her own red prick, and you can see a faint glisten of white moisture on her pointed crown.");
	
	output("\n\nEmboldened by the effect you’re having on your lover, you press ahead, aligning your [pc.cockhead] with the sodden lips of her twat. The heat’s almost unbearable - her lips are hotter than any human girl’s could be, burning with alien desire even disembodied as it is. You’ve thoroughly turned her BionaHole on, and its flush lips draw you imperiously onward to penetration. Your breath catches as your");
	if (pc.cocks[x].hasFlag(GLOBAL.FLAG_FLARED)) output(" flared head presses against the pussylips, pushing in against them in demand of entrance");
	else output(" crown brushes between the lips of her pussy, hovering on the brink}. A second later and you’re in, pushing the hard black sheath down the length of your shaft.");
	
	output("\n\nGod damn, Syri was tight back in the day! Her cunt squeezes you");
	if (flags["FUCKED_SYRI_COUNT"] != undefined) output(" as tight as Syri’s ass ever has");
	else output(" like a soaked, smooth vice of flesh");
	output(". You slowly slide her BionaHole down, enveloping");
	if (pc.cocks[x].cLength() <= 8) output(" your entire");
	else output(" the first eight inches or so");
	output(" of your cock in her wet hole. As if it were still a part of her, Syri moans huskily, arching her back and furiously stroking herself; she’s definitely enjoying the show! <i>“Don’t be gentle, Steele,”</i> she grunts, taking her own advice as she beats her meat. <i>“I wanna see you pounding that filthy hole in!”</i>");
	
	output("\n\nYou’re more than happy to oblige. You stir the sheath around your [pc.cock], making sure you’re totally coated in her steamy juices before starting to pump it up and down your length; slowly at first, but you start to pick up the pace quickly enough, almost matching Syri’s own manic masturbation. She moans louder, her eyes narrowing until they’re almost closed, signaling her complete surrender to her primal urges. You don’t think your lover’s going to hold out much longer, and you’ve barely gotten started!");
	
	output("\n\nNot wanting let Syri get too far ahead, you prop up your [pc.legs] on the foot of the bed, giving you just enough leverage to start thrusting into her BionaHole’s slit. It clenches hard around you, a primitive reaction to a sudden onslaught of pleasure. Fem-juices drool down your shaft between thrusts, splattering your crotch");
	if (pc.cockTotal() > 1) output(" and other cocks");
	output(" with Syri’s own musky blend of girl-cum. The way the toy is twitching and squirming around you, you’re sure you’ve made it orgasm - if only it could talk! What you wouldn’t do to hear Syri’s screams if she were mounted on it.");
	
	output("\n\nYou’ll have to make do with the cries and moans she’s urging out of herself, pumping her shaft and groping her breasts. While you were distracted with her cunt, Syri’s ditched her coat and t-shirt, leaving those big, beautiful breasts of her bare for your gaze. Her dark little nipples look so stiff, eliciting a sharp gasp every time her furred hands move across them, pinching and pulling until she’s all but screaming.");
	
	output("\n\nJust like that, the dam breaks. Syri throws her head back at the peak of one of your thrusts, just as you’re");
	if (pc.balls <= 0) output(" hammering her pussy to the limit");
	else output(" going balls deep in her pussy");
	output(". She shrieks and bucks her hips into her hand, joining her BionaHole-bound twat in spraying her juices all over. You recoil as a geyser of pearly ausar cream splatters onto the bed, missing you by inches. A second wave falls short, dirtying Syri’s fingers and thighs with drooling spunk.");
	
	output("\n\n<i>“Oh, fuck,”</i> she gasps, stumbling back against the desk. Her knot is flush with the bottom of her fist, and little trickles of white cream are still spurting out of her pointed top, rolling down her shaft and into her hand-fur like creamy lava. <i>“Y-you came too, right?”</i>");
	
	output("\n\nYou shake your head apologetically, still fucking yourself full force with her pussy. Syri curses and drops her jeans, letting them clatter to the floor as she strides towards you. <i>“Shit. Guess I’ll just have to make sure you’re not far behind!”</i>");
	
	output("\n\nYou give her a quizzical look, but she makes her intentions known quick enough: your lover slips down onto her knees, nuzzling up");
	if (pc.balls > 0) output(" under your balls");
	else output(" to the base of your cock");
	output(" and running her tongue along your underside");
	if (pc.balls > 0) output(" until she’s got her lips around your sack. She gives you one hard, long suck before popping off to tend to your shaft");
	output(". You gasp as she licks all the way up to the lips of her twat, wrapping her hands around the base and starting to massage");
	if (pc.balls > 0) output(" your nuts");
	else if (pc.hasVagina()) output(" your [pc.cunt]");
	else output(" the skin over your prostate");
	output(". Between her lips, tongue, and fingers and the pussy squeezing down on your cock, there’s not much you can do to hold back the tide of rising pleasure.");
	
	output("\n\n<i>“Gonna... gonna...”</i> you stammer, furiously stroking yourself off. Syri answers with a lusty moan muffled in cock, licking all the harder. She only urges you on, until with a gasp of pleasure you feel your climax shooting up through your shaft and into the waiting reservoir of Syri’s disembodied cunt. The living sextoy responds with a gush of its own juices, making a creamy mire of its tight channel as you");
	if (pc.cumQ() < 50) output(" shoot your wad deep inside it");
	else if (pc.cumQ() < 200) output(" flood the BionaHole’s reservoir with your massive load");
	else output(" blast the BionaHole with more cum than even it can withstand, quickly covering yourself and Syri in a deluge of backwashed cum. Syri just laughs and licks her lips, cleaning herself off and swallowing down as much of your [pc.cumNoun] as she can get");
	output(". No sooner have you let loose into the flesh-filled sheath before Syri grabs it out of your hands, popping it wetly off your well-spent cock and bringing her rosey pussy-lips up to her mouth. Your eyes widen in surprise as Syri’s rough tongue vanishes into her own cunt, and she drinks down your steamy load from her juicy twat.");
	
	output("\n\n<i>“Mmm, delicious,”</i> she laughs, flashing you a cum-stained grin as she finishes her vulgar drink. <i>“Nothing better than cleaning up an epic creampie!”</i>");
	
	output("\n\nIf that’s how she likes it, you can only imagine the shenanigans she gets up to all by herself...");
	
	output("\n\nYou smile at Syri as she caps off her sheathed cunt and sets it aside before crawling into bed with you. Her tongue flicks across your [pc.cock], lapping up a bit of excess spooge before she curls up beside you, head resting on your [pc.chest]. <i>“I think that turned out to be a pretty fair deal...”</i>");
	
	output("\n\n<i>“Definitely,”</i> you agree, wrapping an arm around the ausar’s shoulders and pulling her close. The two of you enjoy the afterglow together for a long few minutes, nestled in each other’s arms, before you finally work up the strength to haul yourself out of bed and grab your gear. Syri gives you a playful swat on the [pc.butt] as you get up, telling you that <i>“Next time,");
	if (pc.hasVagina()) output(" your pussy’s getting fucked");
	else output(" maybe I’ll drill </i>you<i> instead");
	output("!”</i>");
	
	IncrementFlag("SYRI_BIONAHOLE_USES");
	processTime(30);
	pc.orgasm();
	// [Next]
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
*/

// Shower Fappings
public function shipShowerFaps(genButtons:Boolean = false):Number
{
	var showerSex:int = 0;
	
	if (pc.hasCock())
	{
		if(genButtons) addButton(showerSex, "Jerk Off", shipShowerFappening, "Jerk Off", "Jerk Off", "Time to lather up and beat off.");
		showerSex++;
	}
	if (pc.hasVagina())
	{
		if(genButtons) addButton(showerSex, "Use Nozzle", shipShowerFappening, "Use Nozzle", "Use Nozzle", "That shower head looks pretty tempting for your pussy...");
		showerSex++;
	}
	
	return showerSex;
}
public function shipShowerFappening(scene:String = ""):void
{
	clearOutput();
	
	var n:int = 0;
	
	// ButtFuck
	if (scene == "ButtFuck")
	{
		/* 9999 - Probably needs one here... */
	}
	// Jerk Off
	else if (scene == "Jerk Off")
	{
		author("Couch");
		
		n = rand(pc.cockTotal());
		
		output("You grab the bottle of body wash again, squeezing out a second dose into your palms. Rather than letting your hands roam over your body, though, this time you have a much more targeted place to apply it. You reach down and start to work the slippery lotion over [pc.oneCock], letting your hands slowly slide up and down");
		if(pc.cocks[n].cLength() == 1) output(" the full inch");
		else output(" all " + num2Text(pc.cocks[n].cLength()) + " inches");
		output(" of [pc.cockColor " + n + "] meat. Each pass makes you more and more slippery, making your [pc.hand] feel better and better each time it brushes your [pc.sheath " + n + "]. Your other hand tends to your [pc.cockHead " + n + "], working it up with an extra dose of lather for the extra-sensitive flesh.");
		output("\n\nSoon you’re lathered up and stroking away, [pc.chest] rising and falling in a steady rhythm as you bask in the lotion-slicked sensation of [pc.skinFurScalesNoun]-on-skin. Your free hand ");
		if (!pc.hasBreasts()) output(" rests comfortably on your hip, letting all the focus stay on your eager, throbbing dick.");
		else
		{
			output(" comes up to cup one of your breasts, caressing and gently squeezing the soft feminine flesh that’s such a pleasant contrast to your rock-hard masculine endowment. You tease and pinch at your [pc.nipples]");
			if (pc.isLactating()) output(", sending little ribbons of [pc.milkNoun] squirting out between your [pc.fingers]");
			output(" as you stroke, careful not to overdo it and take the focus away from your cock.");
		}
		output("\n\nYou lick your lips as you feel the first sense of pressure in the base of your dick, squeezing down to keep it slow, keep it gradual, really relish the sensation of cum slowly working its way upward. You let your hand come up to");
		if (pc.cocks[n].hasFlag(GLOBAL.FLAG_BLUNT) && !pc.cocks[n].hasFlag(GLOBAL.FLAG_FLARED)) output(" your cocktip, running a finger back and forth over the sharp angle between the cylinder of your shaft and the top of your fat, flat tip,");
		else if (pc.cocks[n].hasFlag(GLOBAL.FLAG_FLARED)) output(" your flare, teasing the underside of the ring that almost feels like a second erection when it stretches wide like this, every pulse transforming your dick from an instrument of penetration to one of sheer depth-stretching pleasure");
		else if (pc.cocks[n].hasFlag(GLOBAL.FLAG_TAPERED)) output(" your tapered tip, relishing the absence of any crown. Nothing but smooth, supple cockflesh, ready to train any hole by starting them off nice and easy with that thin, sharp tip");
		else if (pc.cocks[n].hasFlag(GLOBAL.FLAG_DOUBLE_HEADED)) output(" your twin crowns, slowly spiraling a finger up from base to tips, caressing your twitching cumslits");
		else output(" your crown, slowly spiraling a finger up from base to tip, caressing your twitching cumslit");
		output(".");
		if (pc.hasKnot(n)) output(" You tease your knot next, groping the thickening lump that makes your dick into a true tool of sexual conquest, ensuring no hole can escape being packed with every drop of [pc.cum] you have to offer.");
		output("\n\nYou briefly run your fingers down");
		if (pc.balls <= 0) output(" over the smooth flesh where someone else might need a ballsack, but you’ve been blessed with having all that tucked away inside. Why have a sack when you could feel your seed bubbling hot and fresh inside you?");
		else
		{
			output(" to cup your [pc.balls], feeling the");
			if (pc.ballDiameter() >= 2) output(" thick, heavy");
			output(" orbs tightening with the seed churning inside them.");
		}
		output(" The sense of your cumslit dilating, being filled with [pc.cumColor] itching to burst forth, is nothing short of sublime.");
		output("\n\nYou let go, moaning loudly as [pc.cum] splatters against the shower wall.");
		if (pc.cumQ() >= 1000) output(" You’re practically outpacing the shower itself with your hose of a cock, every spurt flowing up your shaft coming out with such pressure that you almost feel as though you’ll cum again just from the act of cumming.");
		if (pc.hasVagina()) output(" Below you feel [pc.eachVagina] add your feminine juices to the mix, a stream of [pc.girlCumColor] that accompanies the [pc.cumColor] spray from your cock.");
		output(" You tilt your head back and let your eyelids flutter, relishing your messy orgasm.");
		output("\n\nThankfully your choice of location means even the messiest orgasm is easy to clean up. You use the shower nozzle to hose down the side, and yourself, making sure you don’t leave any lotion behind on your dick. Once you’ve cleaned up, you step out of the shower and towel off, your loins satiated and your body cleaned up and ready for your next adventure.");
		
		processTime(10 + rand(6));
		pc.orgasm();
		pc.shower();
	}
	// Use Nozzle
	else if (scene == "Use Nozzle")
	{
		author("Couch");
		
		n = rand(pc.totalVaginas());
		
		output("You lick your lips as you eye the shower nozzle. It’s currently sitting in its dock, but all it takes is reaching up and pulling it out to get it in your [pc.hand]. You can already feel [pc.eachVagina] starting to moisten as you bring the nozzle down, the spray washing over your belly. Your free hand spreads your nether lips, so that when the water finally reaches its target you feel the spray focused on your bared [pc.vaginaColor " + n + "] [pc.vaginaNoun " + n + "]. You hold it there, moaning at the water striking your clit");
		if (pc.vaginas[n].clits != 1) output("s");
		output(" like a hundred rapidly-tapping fingers, slowly moving the shower head closer and closer until the tip slips inside you with a satisfied gasp. The sensations of the individual streams disappear now, replaced with a constant flooding pressure that forces its way inside you.");
		output("\n\nYou let out a long, sultry groan, water spurting out around the shower head now buried in your succulent snatch.");
		if (pc.vaginas[n].type != GLOBAL.TYPE_HUMAN)
		{
			output(" You work it around a bit just to relish the exotic shape you’ve been endowed with, your delicious twat that feels so good, so much better than a human’s ever could just by the sheer wrongness of it. It shouldn’t be down there");
			if (pc.genitalLocation() < 3)
			{
				if (pc.legCount == 1) output(" between your thighs");
				else output(" between your [pc.legs]");
			}
			output(", yet it is, providing you pleasures a woman was never meant to experience. Gods, you love having an ");
			if (InCollection(pc.vaginas[n].type, GLOBAL.TYPE_EQUINE, GLOBAL.TYPE_CANINE, GLOBAL.TYPE_NAGA)) output("animal’s");
			else output("alien");
			output(" cunt!");
		}
		if (pc.vaginas[n].looseness() <= 1) output(" It squeezes so hard without you even having to try, and when you clench your pussy muscles you’re almost afraid you’ll bend the metal out of shape from how tight you are. Afraid, yet you can’t help but grin at the thought. You know nobody out there could resist the thought of plunging their cock into a hole that promises such grip, such sinful squeezing.");
		else if (pc.vaginas[n].looseness() <= 3) output(" Your inner muscles massage that probing metal just right, offering pleasurable resistance but letting it slide as deep as you want it. It’s the perfect fit for your perfectly trained pussy, the product of experience making a once-inexperienced hole into a professional cock-milker.");
		else output(" You love the way the whole thing slips inside with nary a drop of resistance from your loose, sloppy hole. You feed it in further until only the tube is sticking out, careful not to let the water pressure make it slip out. Yet there’s hardly any pressure at all, just the sensation of water blasting away at your pussy walls, a sensation those silly tight girls could never experience. Your cunt is completely ruined, a total size queen’s twat, and you wouldn’t have it any other way.");
		if (pc.hasCock()) output("\n\nAbove the heady pleasure stemming from your pussy you feel yourself throbbing, your masculine aspect providing a perfect counterpoint to your steamy feminine slit. You don’t even want to touch right now. You don’t have to. You can just let [pc.eachCock] hang there and revel in your hermaphroditic endowments, each rhythmic clench of your cunt accompanied with a twitch of your cock. With every twitch you feel your cumslit widening from within, pushed open by that slowly-building pressure of preseed aching to come out.");
		output("\n\nYour free hand comes up,");
		if (!pc.hasBreasts()) output(" palm lying against the back of your head as you look down past your chest at the display. You don’t want to distract yourself with anything else, just relax and savor the pleasure of your pussy.");
		else if (pc.biggestTitSize() < 4) output(" cupping one of your breasts and setting to rubbing as you look down past your cleavage to watch your pussy in action. Your [pc.fingers] brush across your nipple, adding the occasional girlish gasp to the steadier moaning slipping forth from your lips. You’re just the right size to be able to see everything, and it makes you so very, very pleased. Maybe being bigger would be fun, but you’re pretty happy being able to watch when there’s a cock making your pussy sing with pleasure. Or a shower head, for that matter.");
		else
		{
			output(" [pc.fingers] sinking into the bountiful cleavage on display. You lift one of your breasts to run your tongue over your [pc.nippleColor] nipple");
			if (pc.biggestTitSize() >= 11) output(", absolutely loving how easy it is with how huge you are");
			output(". Big tits, wet pussy, what more could a [pc.boyGirl] want?");
			if (pc.isLactating())
			{
				output(" Your body answers the question for you as a spurt of [pc.milkColor] splashes onto your tongue. [pc.HeShe] could want [pc.milkFlavor] goodness on demand. You take a few gulps, careful not to get too greedy and take the focus away from the pleasure in your pussy.");
				pc.milkInMouth(pc);
			}
			else output(" You let your tongue wander of its own accord for a while, focusing on the pleasure brimming in your pussy.");
		}
		output("\n\nAnd it’s a grand pleasure indeed, the water relentless in teasing your cunny depths, stoking the fires of your lusts higher and higher with each passing moment. Your croons come faster, higher, louder, every sound you make a step closer to sweet release. Despite how long it takes, you barely feel prepared, the water joined by a burst of [pc.girlCum] as you give the loudest cry of all.");
		if (pc.hasCock()) output(" Spurts of [pc.cumNoun] join it, your male orgasm splattering against the shower wall in time with the contractions wracking your cunt.");
		output(" An intense shiver runs down your spine, the shower head slowly slipping from your pussy");
		if (pc.vaginas[n].looseness() <= 1) output(" despite your body’s best efforts");
		output(", your muscles quivering and weak. Even after cumming, you feel so deliciously wet.");
		output("\n\nBut the nicest thing about sex in the shower has to be the cleanup. You put the nozzle back in its place and let the water run for a minute longer, washing away the signs of your sinful soiree. Once you’ve cleaned up and calmed down a bit, you");
		if (pc.isNaga()) output(" slither");
		else if (pc.isGoo()) output(" slide");
		else output(" step");
		output(" out of the shower and towel off. Soon you’ve reclaimed your gear, thoroughly refreshed and ready to resume your adventure.");
		
		processTime(10 + rand(6));
		pc.orgasm();
		pc.shower();
	}
	// Nevermind
	else if (scene == "Nevermind")
	{
		author("Couch");
		output("On second thought, you’d rather save your strength for someone more appropriate. You wait for");
		if (pc.hasCock()) output(" your erection to subside and");
		output(" your urges to settle down before stepping out of the shower and toweling off. You slip your gear on with a refreshed smile, squeaky clean and ready to resume your adventure.");
		processTime(2);
	}
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}
