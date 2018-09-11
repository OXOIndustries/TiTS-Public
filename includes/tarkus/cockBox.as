//Potential Names:
//A TamaniCorp Hora Series Dong Designer

import classes.Items.Transformatives.DongDesigner;

//Discovery
public function cockBoxDiscoveryBlurb():Boolean
{
	if(flags["LOOTED_COCKBOX"] == undefined)
	{
		output("\n\nA gleam of shining metal catches your eye from amongst the mounds of detritus. Looking closer, you pick out the shape of an oblong console of alloy and composite, scratched in a half-dozen places but otherwise intact. Do you investigate it?");
		addButton(0,"Investigate",investigateTheCockBox);
	}
	else if(flags["LOOTED_COCKBOX"] == 0)
	{
		output("\n\nA gleam of light indicates that the TamaniCorp Dong Designer is still sitting where you last found it. You can pick it up if you have the room for it.");
		addButton(0,"Take It",takeDatCockBawks);
	}
	return (rustRidgesEncounters());
}

public function cockboxUpgraded(inShip:Boolean):Boolean
{
	if(!inShip) return true;
	else return (flags["COCKBOX_UPGRADE"] != undefined);
}
//Investigate the Cock Box
public function investigateTheCockBox():void
{
	clearOutput();
	author("Fenoxo");
	showName("STRANGE\nBOX");
	showBust("DONG_DESIGNER");
	output("You climb through the wasted machines and rust-scaled heaps to get a closer look, even going so far as to brush away the grit and grime that covers it. Lettering in luminescent paint declares it to be a TamaniCorp Dong Designer. What a find! These things are incredibly expensive, even in the core. You’ve seen them in less savory holos - they get installed in elite nightclubs or exclusive spas, particularly along the human/ausar border worlds where the two races mix.");
	output("\n\nBedding an ausar lady? Punch a few buttons on a Dong Designer, stick your dick inside, and you’ll be knotting her in no time. Need something to properly scratch a kaithrit’s itch? Satisfaction is a button press away. About the only thing they can’t do is make you bigger - or smaller. And once you’ve had your fun, a return to normalcy is just a touch away.");
	output("\n\nBut how the hell did one of these wind up out here, thrown away in a galactic trash heap? The caustic atmosphere hasn’t had time to corrode the metal, and the safety cover on the phallus input port should have kept the planet’s grime from mucking it up. It <i>looks</i> in good condition. The gauges all read good, save for power. All you’ve got to do is lug it back to the ship and plug it in.");
	output("\n\nDo you pick it up? You’ll move twice as slowly while dragging the heavy thing around.");
	processTime(2);
	flags["LOOTED_COCKBOX"] = 0;
	clearMenu()
	addButton(0,"Take It",takeDatCockBawks)
	addButton(1,"Leave It",mainGameMenu);
}

public function takeDatCockBawks():void
{
	flags["LOOTED_COCKBOX"] = 1;
	var cockbox:DongDesigner = new DongDesigner();
	lootScreen = takeDatCockBawksCheck;
	itemCollect([cockbox], true);
}
public function takeDatCockBawksCheck():void
{
	if(pc.hasItemByClass(DongDesigner))
	{
		mainGameMenu();
		return;
	}
	
	clearOutput();
	output("Being way too big to fit in your inventory, you leave the box where it is.");
	flags["LOOTED_COCKBOX"] = 0;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function cockBoxInstallation():void
{
	clearOutput();
	showBust("DONG_DESIGNER");
	//Not in ship.
	if(!InShipInterior())
	{
		showName("DONG\nDESIGNER");
		output("You can’t make use of it without any power. Maybe take it back to your ship?");
	}
	//In ship
	else
	{
		//No room - pending ship upgrade system
		if(9999 == 0)
		{
			showName("DONG\nDESIGNER");
			output("There’s not any room to install this in your ship. You’ll have to clear out some space if you want to try and put this baby to use.");
		}
		//Else
		else
		{
			showName("\nUNINSTALLING...");
			output("Now that you’ve got it on your ship, it’s time to plug in this Dong Designer thing and make sure it’s still in working order. Finding a clear spot with good access to a suitable power port takes a few minutes. You can’t just have it propped up anywhere, particularly if ");
			if(pc.hasCock()) output("you’re gonna be sticking your dick in it.");
			else output("someone is going to wind up sticking their dick in it.");
			output(" Finally, you settle on a quiet corner. It’ll be a good home for it if it works and give you plenty of room to work on it if it doesn’t.");
			output("\n\nThe original cable is long gone, but machines like this have used standardized power cabling for years. Moment of truth time. You plug it in.");
			output("\n\n...And nothing happens.");
			output("\n\nGrunting in irritation, you notice a button on the back and depress it. It gives way with a satisfyingly meaty click, and you hear the soft whine of long-dormant machinery coming to life. Flickering at first, a purple-tinted holoscreen projects above it at about chest height");
			if(pc.tallness < 60 || pc.tallness >= 84) output(" for most galactic races");
			output(", displaying a three-dimensional view of an astounding array of potential erections. It looks like it works!");
			if(pc.characterClass != GLOBAL.CLASS_ENGINEER) output(" A good thing too. You didn’t exactly spend a lot of time learning about tech repair growing up.");
			output("\n\nJust to be sure, you tap through the settings screen and summon up a self-diagnostic routine. A mechanical whirring rises from deep inside the box, the mechanical parts humming busily as they verify their integrity. It clicks a few times, and then displays a notification of full functionality.");
			output("\n\n<b>You’ve installed a TamaniCorp Hora Series Dong Designer in your ship! You can access it from the storage menu.</b>");
			
			processTime(8);
			flags["DONG_DESIGNER_INSTALLED"] = 1;
			
			pc.destroyItemByClass(DongDesigner);
		}
	}
}
public function cockBoxUninstallation():void
{
	clearOutput();
	showBust("DONG_DESIGNER");
	showName("\nUNINSTALLING...");
	
	output("You take some time to uninstall the dedicated dick-transforming device.");
	output("\n\n<b>You no longer have the Dong Designer installed!</b>");
	
	processTime(12);
	flags["DONG_DESIGNER_INSTALLED"] = undefined;
	
	//clearMenu();
	//addButton(0, "Next", mainGameMenu);
	output("\n\n");
	quickLoot(new DongDesigner());
}

public function cockCanFitCockBox(cIdx:int = 0):Boolean
{
	if(cockboxUpgraded(InShipInterior())) return true;
	return (pc.cocks[cIdx].thickness() <= 4 && pc.cocks[cIdx].cLength() <= 20);
}

//Use the Cock Box!
public function useInstalledDickBox():void
{
	clearOutput();
	author("Fenoxo");
	showName("DONG\nDESIGNER");
	showBust("DONG_DESIGNER");
	if(InShipInterior())
	{
		output("The Dong Designer is still plugged in and working where you left it. The holographic display is as obscene as ever, offering you a bevy of different reproductive organs.");
	}
	else
	{
		output("The Dong Designer’s holographic display lights up when you get closer, displaying an obscene menagerie of various alien organs.");
	}
	output(" The scrolling lettering indicates that you need to insert your penis into the pink-rimmed opening to begin. A nearby lever allows you to adjust the height for comfort.");

	//1 dick
	if(pc.totalCocks() == 1)
	{
		//Doesn’t fit
		if(!cockCanFitCockBox(0)) 
		{
			output("\n\nYou’re too big to cram into such an undersized hole.");
		}
		//Fits
		else output("\n\nDo you stick your dick in the box?");
	}
	//Multidick
	else if(pc.hasCock())
	{
		//Check to see if any fit
		var noneFit:Boolean = true;
		for(var x:int = 0; x < pc.totalCocks(); x++)
		{
			if(cockCanFitCockBox(x)) noneFit = false;
		}
		//None fit
		if(noneFit)
		{
			output("\n\nNone of your [pc.cocks] will fit in such an undersized hole.");
			if(silly) 
			{
				output(" What is this, a machine for ants?");
				if (CodexManager.entryUnlocked("Gold Myr")) output(" No, it probably couldn’t even handle a myrmedion.");
			}
		}
		//Fit
		output("\n\nWhich of your [pc.cocks] will you put inside, if you use it at all?");
	}
	output("\n\n");
	processTime(1);
	clearMenu();
	//Build dis menu
	for(var y:int = 0; y < pc.totalCocks(); y++)
	{
		output("<b>#" + (y+1) + ":</b> " + formatFloat(pc.cLength(y),3) + " in long, " + pc.cocks[y].cockColor + " [pc.accurateCockName " + y + "]\n");
		if(cockCanFitCockBox(y)) addButton(y,"#" + (y+1),cockBoxUse,y,"#"+(y+1),"Stick your [pc.cockNoun " + y + "] in there.");
		else addDisabledButton(y,"#" + (y+1),"#" + (y+1),"Your [pc.cockNoun " + y + "] is too big to fit in the hole.");
	}
	if(!pc.hasCock()) addDisabledButton(0,"No Penis","Use Dong Designer","You don’t have a penis to insert into the machine.");
	if(pc.cockTotal() == 1)
	{
		if(!cockCanFitCockBox(0)) addDisabledButton(0,"Use","Use Dong Designer","Your [pc.cockNoun] is too big to fit in the hole.");
		else addButton(0,"Yes",cockBoxUse,0,"Use Dong Designer","Yes, you will stick your dick in that box.");
	}
	
	if(InShipInterior())
	{
		if(flags["DONG_DESIGNER_INSTALLED"] != undefined) addButton(13, "Uninstall", cockBoxUninstallation, undefined, "Uninstall Device", "Unplug the machine and put it in your inventory.");
		addButton(14,"Back",shipStorageMenuRoot);
	}
	else addButton(14,"Leave",mainGameMenu);
}

//Insert Dick
public function cockBoxUse(x:int):void
{
	clearOutput();
	author("Fenoxo");
	showName("DONG\nDESIGNER");
	//Repeats are for cool kids
	if(flags["USED_DONG_DESIGNER"] != undefined)
	{
		output("Gently adjusting your [pc.hips], you’re careful to properly line [pc.oneCock] up with the slot, not wanting to injure yourself before another ");
		//Ever “FAILED”:
		if(flags["DONG_DESIGNER_MALFUNCTIONED"] != undefined) output("potentially ");
		output("magnificent transformation. Puffs of electrochemically-warmed air roll out of the entrance, a palpable reminder of just how warm the embrace of the TamaniCorp Dong Designer is going to be once you finally push forward.");
		output("\n\nThe parting of the machine’s pink-colored liner is just as pleasurable as you remember, both slick and purposefully textured to stimulate your flesh on the way through. They seal tight around your [pc.base " + x + "], firm enough to make your [pc.cock " + x + "] bloat, but not painfully so. You could probably fuck this thing if you wanted to, but there’s really no need to. It’ll do all the work once you select the kind of prick you want.");
		output("\n\nSloshing audibly around your girth, the fluid-rich interior floods in an instant, submerging you in hot, sticky-slick goo that rapidly firms around your [pc.dickColor " + x + "] boner, cupping it like a lover’s hand. As it is, you can feel your length twitching against the gelatinous embrace while it shapes into a perfect mold of your [pc.cock " + x + "].");
		output("\n\nYou could swear the machine gives you a loving caress when it finishes, but your attention is pulled away by a flash of the holographic display. The waiting screen has vanished, replaced by pictures of a bevy of alien boners. All you have to do is pick one.");
		if(flags["DONG_DESIGNER_MALFUNCTIONED"] != undefined) output(" Hopefully it’ll work correctly this time...");
	}
	//First time!
	else
	{
		output("Gingerly, you shift your [pc.hips] to line [pc.oneCock] up with the slot. The air around it is pleasantly warm, warm enough that you only pause for a half-second before breathlessly plunging inside. Slick, artificial flesh parts around your [pc.cock " + x + "] like a pair of velvet curtains, just tight enough to form a perfect seal without being uncomfortable. The interior is... wet. Not like, horny slut wet. More like a galotian with the genome of industrial-strength lubricant.");
		output("\n\nIt feels kind of good in a passive, enjoyable way, just enough to keep your heart pumping and your prick suitably erect. You sigh and look at the control panel, but the dick selection menu has disappeared behind a slowly spinning circle. Gradually, the silken wetness congeals into a form-fitting, gelatinous vice. It tingles with tiny, infinitesimal vibrations as it settles into an inverse mold of your [pc.cock " + x + "].");
		output("\n\nYou could swear it finishes with a firm, joyous squeeze.");
		output("\n\nOnly then does the loading screen vanish and allow you to select a new form for your dick. What do you press?");
	}
	cockBoxMenu(x);
}

//Dick Select:
public function cockBoxMenu(x:int):void
{
	clearMenu();
	
	var cockList:Array = [];
	var i:int = 0;
	var btnSlot:int = 0;
	
	cockList.push([GLOBAL.TYPE_HUMAN, "Terran", "Human", "Get a fleshy, pink penis, like a terran."]);
	cockList.push([GLOBAL.TYPE_CANINE, "Ausar", "Ausar", "Get a knotted, ausar penis."]);
	cockList.push([GLOBAL.TYPE_FELINE, "Kaithrit", "Kaithrit", "Get a penis with textured nubs like a kaithrit."]);
	cockList.push([GLOBAL.TYPE_KUITAN, "Kui-Tan", "Kui-Tan", "Get a bulbous penis, like the kui-tan."]);
	cockList.push([GLOBAL.TYPE_NAGA, "Leithan", "Leithan", "Get a smooth, tapered penis like that of a leithan."]);
	cockList.push([GLOBAL.TYPE_GRYVAIN, "Gryvain", "Gryvain", "Get a scaly knotted, ribbed penis, like that of a gryvain."]);
	cockList.push([GLOBAL.TYPE_EQUINE, "Equine", "Equine", "Get a penis like that of a terran horse."]);
	// Unlockables
	if(cockboxUpgraded(InShipInterior()))
	{
		cockList.push([GLOBAL.TYPE_VULPINE, "Vulpine", "Vulpine", "Get a tapered and knotted vulpine penis."]);
		cockList.push([GLOBAL.TYPE_SWINE, "Swine", "Swine", "Get a corkscrew-shaped pig dick."]);
		cockList.push([GLOBAL.TYPE_DEMONIC, "Demonic", "Demonic", "Get a knotted, nubby and sinister-looking penis."]);
		cockList.push([GLOBAL.TYPE_TENTACLE, "Tentacle", "Tentacle", "Get a prehensile tentacle penis."]);
		cockList.push([GLOBAL.TYPE_DRACONIC, "Draconic", "Draconic", "Get a tapered and knotted dragon penis."]);
		cockList.push([GLOBAL.TYPE_SAURIAN, "Saurian", "Dinosaur", "Get a giant dinosaur dick."]);
	}
	
	for(i = 0; i < cockList.length; i++)
	{
		if(btnSlot >= 14 && (btnSlot + 1) % 15 == 0)
		{
			addButton(btnSlot, "Back", useInstalledDickBox);
			btnSlot++;
		}
		
		addButton(btnSlot, cockList[i][1], dickBoxTFColorSelect, [x, cockList[i][0]], cockList[i][2], cockList[i][3]);
		btnSlot++;
		
		if(cockList.length > 14 && (i + 1) == cockList.length)
		{
			while((btnSlot + 1) % 15 != 0) { btnSlot++; }
			addButton(btnSlot, "Back", useInstalledDickBox);
		}
	}
	addButton(14, "Back", useInstalledDickBox);
}

//Dick Chosen.
//Pick Color - CUT! For now... (Now included!)
public function dickBoxTFColorSelect(args:Array):void
{
	var cIdx:int = args[0];
	var cType:int = args[1];
	
	if(!cockboxUpgraded(InShipInterior()))
	{
		dickBoxTF([cIdx, cType]);
		return;
	}
	
	clearOutput();
	author("Fenoxo");
	showName("DONG\nDESIGNER");
	output("The holographic menu depresses beneath your finger. The other dicks disappear, and the icon you’ve chosen splits into a variety of different colorations.");
	output("\n\nWhat color would you like your soon-to-be improved manhood to be?");
	
	var colorList:Array = [];
	var i:int = 0;
	var btnSlot:int = 0;
	
	// Standard Colors
	colorList.push(["pink", "Pink"]);
	colorList.push(["red", "Red"]);
	colorList.push(["bright red", "BrightRed"]);
	colorList.push(["dark red", "DarkRed"]);
	colorList.push(["orange", "Orange"]);
	colorList.push(["amber", "Amber"]);
	colorList.push(["green", "Green"]);
	colorList.push(["blue", "Blue"]);
	colorList.push(["purple", "Purple"]);
	colorList.push(["mottled pink and black", "Mottled"]);
	colorList.push(["black", "Black"]);
	colorList.push(["gray", "Gray"]);
	colorList.push(["silver", "Silver"]);
	colorList.push(["null", "Natural"]);
	
	for(i = 0; i < colorList.length; i++)
	{
		if(btnSlot >= 14 && (btnSlot + 1) % 15 == 0)
		{
			addButton(btnSlot, "Back", cockBoxDickSelect, cIdx);
			btnSlot++;
		}
		
		var sTitle:String = StringUtil.toDisplayCase(colorList[i][0]);
		var sTooltip:String = "Your cock will be colored " + colorList[i][0] + ".";
		if(colorList[i][0] == "null") { sTitle = "Natural"; sTooltip = "Your cock will be a random color, natural to the penis type."; }
		else if(colorList[i][0] == "mottled pink and black") sTooltip = "Your cock will be colored in a mottled pink and black pattern.";
		
		addButton(btnSlot, colorList[i][1], dickBoxTF, [cIdx, cType, colorList[i][0]], sTitle, sTooltip);
		btnSlot++;
		
		if(colorList.length > 14 && (i + 1) == colorList.length)
		{
			while((btnSlot + 1) % 15 != 0) { btnSlot++; }
			addButton(btnSlot, "Back", cockBoxDickSelect, cIdx);
		}
	}
	addButton(14, "Back", cockBoxDickSelect, cIdx);
}

//Return. Choose dick again...
public function cockBoxDickSelect(x:int):void
{
	clearOutput();
	showName("DONG\nDESIGNER");
	output("Changing your mind, you press the button to go back to the dick type menu.");
	output("\n\nWhat cock shape do you choose?");
	
	cockBoxMenu(x);
}

//Actual Transformation Scene
//First time!
public function dickBoxTF(args:Array):void
{
	clearOutput();
	author("Fenoxo");
	showName("DONG\nDESIGNER");
	
	var inShip:Boolean = InShipInterior();
	
	pc.taint(2);
	if((rand(10) == 0 && flags["USED_DONG_DESIGNER"] != undefined) || (debug && rand(2) == 0))
	{
		if(pc.cockTotal() < 10)
		{
			cockBoxDickDoublingHijinx(args);
			return;
		}
	}
	output("As soon as you");
	if(cockboxUpgraded(inShip)) output(" select a color");
	else output(" finalize your selection");
	output(", the machine hums into action, vibrating vigorously around your [pc.cock " + args[0] + "]. ");
	if(flags["USED_DONG_DESIGNER"] == undefined) output("It’s more intense than you expected.");
	else output("It’s just as intense as you remembered.");
	output(" You’d have to hold a dozen high-strength vibrators against yourself to approach such an effect. The stampede of sensation makes it difficult to focus on much else, driving you to a lusty plateau by massaging your individual neurons until they spark with wild delight. You let your head loll and your jaw hang open, prevented from thrusting by the machine’s grip and already closing in on the brink.");
	if(flags["USED_DONG_DESIGNER"] == undefined) output("\n\nStrangely, the vibrations don’t manage to escape the confines of your mechanical lover. You’d expect to feel them shuddering through the flesh at your root, but all you’re getting are the rhythmic spasms your body’s ejaculatory preparations.");
	else output("\n\nYou know those vibrations can’t be real. It has to be caused by the microsurgeon cocktail you’re currently swimming in. Those microscopic wonders must be designed to interact with your nervous system as they go to work on your transforming tool.");

	if(flags["USED_DONG_DESIGNER"] == undefined) output("\n\nWhat’s happening to your [pc.cock " + args[0] + "] inside that box? It’s getting warmer inside there. At least, that’s what it feels like to you - like hundreds of miniaturized vibrators directly applied to your sense of pleasure and left to buzz their lurid heat into your reproductive core.");
	else output("\n\nYou almost wish you had access to the machine’s programming. You’d love to know how it’s making you feel so warm and wet, like thousands of gel-coated vibrators warming your flesh by pleasant undulations alone.");
	//NO new PG:
	output(" It’s so hot, and so sinfully wet and gooey. You’re practically melting from the pleasure.");
	output(" Surely you’re ");
	if(pc.cumQ() < 100) output("dribbling");
	else if(pc.cumQ() < 1000) output("squirting");
	else output("gushing");
	output(" pre with how wildly your technology-tamed prick is spasming, but you’ve no way of knowing. It can’t possibly get any more slick.");

	output("\n\nYour eyes snap open in alarm to the sound of panting, but you calm when you realize the origin point of the lewd sound is your own lips.");
	if(pc.hasVagina())
	{
		output(" [pc.GirlCum] ");
		if(pc.isSquirter()) output("streams down your thighs");
		else if(pc.wettestVaginalWetness() >= 2) output("trickles down your thighs");
		else output("threatens to drip down your thighs");
		output(".");
	}
	output(" The box is squelching wetly even through the seal. Every lewd squish is matched by a consummate increase in the bubbling bliss around your [pc.cock " + args[0] + "], wreathing it so deeply in pernicious warmth that it may as well be a part of you.");

	output("\n\nYou can’t tell where the electric ecstasy originates on your [pc.cock " + args[0] + "] anymore. Everything is like a formless blob of pleasure. It could be coming from your underside or your [pc.cockHead " + args[0] + "], and you’d be helpless to identify the source. The only thing left to do is grip the machine and try to keep your weakening [pc.legOrLegs] from dropping you to the floor. A" + pc.mf("n aggressive growl"," whorish moan") + " winds its way out of your throat as your climax mounts.");
	output("\n\nYou feel like a star about to go nova, shooting incandescent flares of ");
	if(pc.balls > 0) output("ball-draining");
	else output("[pc.cumVisc]");
	output(" delight. Only... nothing is coming out. The pressure is still there inside you, climbing as potent paroxysms wrack your frame.");
	if(flags["USED_DONG_DESIGNER"] != undefined) output(" No matter how often you do this, nothing prepares you for how completely the sensation of pent-up desire overwhelms you. Holding on as best you can, you promise yourself it’ll all be worth it when you’re finally allowed to cum with a new, custom-designed phallus.");
	var testChar:Creature = new Creature();
	testChar.createCock();
	testChar.shiftCock(0,args[1]);
	//Cause ausar and kaithrit are too cool for sheaths.
	if(InCollection(args[1], GLOBAL.TYPE_CANINE, GLOBAL.TYPE_FELINE)) testChar.cocks[0].delFlag(GLOBAL.FLAG_SHEATHED);
	if(args[1] == GLOBAL.TYPE_FELINE) testChar.cocks[0].delFlag(GLOBAL.FLAG_TAPERED);
	if(testChar.hasKnot(0) && !pc.hasKnot(args[0]))
	{
		output(" Your [pc.cock " + args[0] + "] feels like one giant, swelling bulb, probably the beginnings of a knot.");
	}
	else if(!testChar.hasKnot(0) && pc.hasKnot(args[0])) output(" Your [pc.cock " + args[0] + "] feels like it’s smoothing out, gaining definition at the expense of a knot.");
	if(testChar.hasCockFlag(GLOBAL.FLAG_FLARED,0) && !pc.hasCockFlag(GLOBAL.FLAG_FLARED,args[0])) output(" The edges of the gelatinous enclosure firmly grip your swelling head, forced to distend with your newly growing flare.");
	else if(!testChar.hasCockFlag(GLOBAL.FLAG_FLARED,0) && pc.hasCockFlag(GLOBAL.FLAG_FLARED,args[0])) output(" The tightly-clenched enclosure loosens around your flare, reluctantly closing around it as you lose the horse-like feature.");
	output(" Transformative shivers slip along your length, allowing you to enjoy the white-hot lust of the change in greater fidelity.");
	if(testChar.hasCockFlag(GLOBAL.FLAG_BLUNT,0) && !pc.hasCockFlag(GLOBAL.FLAG_BLUNT,args[0])) 
	{
		output(" Your tip is flattening and fattening, becoming blunted and bloated");
		if(testChar.hasCockFlag(GLOBAL.FLAG_FLARED,0)) output(" - more suited to the way it flares at the edges");
		output(". It might be a bit harder to get inside a potential mate, but bludgeoning your way past her lips is going to be magnificent.");
	}
	else if(testChar.hasCockFlag(GLOBAL.FLAG_TAPERED,0) && !pc.hasCockFlag(GLOBAL.FLAG_TAPERED,args[0]))
	{
		output(" Your tip is narrowing by the second, becoming almost pointed, perfect for easing ");
		if(pc.cockVolume(args[0]) >= 400) output("your massive erection ");
		output("inside a partner.");
	}
	if(testChar.hasCockFlag(GLOBAL.FLAG_FORESKINNED,0) && !pc.hasCockFlag(GLOBAL.FLAG_FORESKINNED,args[0])) output(" Folds of expanding foreskin slip and slide around you, so sensitive and yet perfect for easing your back-and-forth passage through a set of honeyed folds.");
	if(testChar.hasCockFlag(GLOBAL.FLAG_SHEATHED,0) && !pc.hasCockFlag(GLOBAL.FLAG_SHEATHED,args[0])) output(" Skin bunches up around your base into a loose, musky sheath, the perfect place for your orgasm-locked dick to retreat to once you finally manage to cum.");
	if(testChar.hasCockFlag(GLOBAL.FLAG_NUBBY,0) && !pc.hasCockFlag(GLOBAL.FLAG_NUBBY,args[0])) output(" Maddeningly, tiny, exquisitely sensitive nubs grow in along the whole of your trembling meat, each demanding in no uncertain terms that you cum and cum hard. How do kaithrit and those like them keep from cumming as soon as they slide inside?");
	if(testChar.hasCockFlag(GLOBAL.FLAG_SMOOTH,0) && !pc.hasCockFlag(GLOBAL.FLAG_SMOOTH,args[0])) output(" The shaft’s surface smooths out, much more so than is normal, potentially making penetration a lot less painful for both you and your partner.");
	if(testChar.hasCockFlag(GLOBAL.FLAG_LUBRICATED,0) && !pc.hasCockFlag(GLOBAL.FLAG_LUBRICATED,args[0])) output(" Your pleasure-pole sweats profusely while inside the grips of the glory box and it doesn’t take you too long to realize that your cock has developed some over-active, self-lubricating glands!");
	if(testChar.hasCockFlag(GLOBAL.FLAG_STICKY,0) && !pc.hasCockFlag(GLOBAL.FLAG_STICKY,args[0])) output(" You are encountering a lot of friction between your shaft and the walls of the box’s orifice... Your cock has developed a stickier reaction to penetration now.");
	if(testChar.hasCockFlag(GLOBAL.FLAG_PREHENSILE,0) && !pc.hasCockFlag(GLOBAL.FLAG_PREHENSILE,args[0])) output(" Your cock thrashes about within the glory hole and with a little concentration, you can feel yourself bending and moving your now-prehensile cock at will!");
	if(testChar.hasCockFlag(GLOBAL.FLAG_APHRODISIAC_LACED,0) && !pc.hasCockFlag(GLOBAL.FLAG_APHRODISIAC_LACED,args[0])) output(" A musky scent strikes your nostrils as you can smell the cloud of aphrodisiacs wafting from your man meat.");
	if(testChar.hasCockFlag(GLOBAL.FLAG_OVIPOSITOR,0) && !pc.hasCockFlag(GLOBAL.FLAG_OVIPOSITOR,args[0])) output(" You feel internal muscular contractions pushing along the length of your shaft as if to allow the passage of some item through and out your phallus--and not just cum either...");

	output("\n\nFeeling so overwhelmingly hard that you fear you’ll burst, you notice the almost ethereal bath of molten pleasure recede, leaving you nothing but the company of your redoubling climactic spasms. [pc.Cum] hoses out of your transformed tip in long ropes, finally registering to your senses. Relief at last! Uncontrollable trembles run through your body as you gain your long-denied release");
	if(pc.cumQ() <= 100) output(", pumping your meager orgasm into the machine’s moist interior.");
	else output(", pumping what feels like gallons into the machine’s greedy interior.");

	//Not backwashing out: 
	if(pc.cumQ() < 1500)
	{
		output("\n\nNo amount of your [pc.cum] seems to faze the device; it squeezes and tugs your newly-designed dick until you go dry. When it finally flashes “complete” along with the winking visage of a huge-breasted ausar hyper-porn star, you’re able to slip out with ease, revealing your new [pc.cockNoun " + args[0] + "] to the world. It shines with rapidly evaporating moisture but seems as clean and fresh as if you had just stepped out of the shower.");
		if(pc.cockTotal() > 1)
		{
			output(" Of course, you’ll need to mop up the mess your spare cock");
			if(pc.cockTotal() > 2) output("s");
			output(" made on the floor...");
		}
		//Ever backwashed+:
		if(flags["DONG_DESIGNER_BACKWASHED"] != undefined || flags["DONG_DESIGNER_FLOODED"] != undefined) output(" You’re more than a little disappointed in yourself. You couldn’t even make it leak this time. At least it’ll save on cleaning.");
	}
	//Some backwash
	else if(pc.cumQ() < 5000)
	{
		output("\n\nAt first, it seems that no amount of [pc.cum] will faze the device, but the interior gets more and more soupy with your [pc.cumNoun] after every pulse. The seal at your [pc.sheath " + args[0] + "] struggles vainly, but streamers of [pc.cum] pour out like water from a failing hydro facility.");
		if(pc.cockTotal() > 1)
		{
			output(" All the extra jism your other cock");
			if(pc.cockTotal() > 2) output("s hose");
			else output(" hoses");
			output(" out onto the floor doesn’t help matters.");
		}
		output(" Turning red, the holographic panel displays a pouting, big-breasted kui-tan and a warning not to use the machine until a custodian has come by to clean up your mess.");
		if(celiseIsCrew()) output(" Celise is in for a treat.");
		output("\n\nOnce your body finishes attempting to impregnate the device, you slip your [pc.cumNoun]-soaked prick free. It looks exactly as promised minus the licentious paint job you’ve accidentally given it. Nothing a quick shower and a little time with a mop and bucket won’t fix...");
		if(flags["DONG_DESIGNER_FLOODED"] != undefined) 
		{
			output("\n\nYou’re both disappointed and relieved that you didn’t wind up flooding the room this time");
			if(inShip) output(" - relieved that your ship won’t smell like [pc.cum] for a day while it airs out and disappointed in your apparently weakened virility");
			output(".");
		}
		//Shower!
		pc.applyCumSoaked();
		if(inShip) pc.shower();
		IncrementFlag("DONG_DESIGNER_BACKWASHED");
	}
	//Backblasted out
	else
	{
		output("\n\nIt never stood a chance. Your first few pulses rapidly overwhelmed the device’s capacity to handle cum, and each subsequent eruption further increases the internal pressure. Streamers of [pc.cumNoun] pour from the straining artificial lips. Part of you is worried that you’ll break the poor thing, but you’re cumming too hard to care. The drizzling spray of [pc.cumColor] fuckjuice intensifies until it’s taking everything you have just to hold yourself inside the velvety interior.");
		output("\n\nThe console rips itself from your hands; holding out against such incredible overpressure was just too much. Your back slams hard into a bulkhead, thankfully numbed by the swarms of endorphins flooding your bloodstream as you continue to cum, painting your way from the machine to the ceiling to your own face. You grab hold of your newborn dick, slick with its pleasure-fluids of its birth, and stroke it wildly, pumping huge blasts of [pc.cum] into your mouth and anything else that looks like it could use a coat of [pc.cumColor].");
		output("\n\nWhen you come down, you note the machine has a red hologram of a big-breasted kui-tan above it along with a warning not to use the device until it has been cleaned by a custodian. Fuck the machine - you’re going to need a shower.");
		if(inShip)
		{
			if(celiseIsCrew()) output(" Celise can handle this mess.");
		}
		else output(" You can take care of this mess after.");
		pc.applyCumSoaked();
		pc.applyCumSoaked();
		pc.loadInMouth(pc);
		if(inShip) pc.shower();
		IncrementFlag("DONG_DESIGNER_FLOODED");
	}
	IncrementFlag("USED_DONG_DESIGNER");
	processTime(5);
	pc.shiftCock(args[0],args[1]);
	//Coloration
	if(args.length > 2)
	{
		var cColor:String = args[2];
		if(cColor.length > 0 && cColor != "null") pc.cocks[args[0]].cockColor = cColor;
	}
	//Cause ausar are too cool for sheaths.
	if(args[1] == GLOBAL.TYPE_CANINE) pc.cocks[args[0]].delFlag(GLOBAL.FLAG_SHEATHED);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",useInstalledDickBox);
}
	
//Something’s Gone Wrong! [Dick Doubler!]
public function cockBoxDickDoublingHijinx(args:Array):void
{
	clearOutput();
	author("Fenoxo");
	showName("\nUH OH!");
	showBust("TAMANI");
	pc.taint(4);
	output("The moment you");
	if(cockboxUpgraded(InShipInterior())) output(" select a chosen color");
	else output(" finalize your selection");
	output(", something goes wrong. A flashing orange and red notification appears above a crossed-out progress bar:\n\n\t<b>Warning: Multiple phalli detected. TamaniCorp can not be held responsible for any deviations in our advanced mutation protocols.</b>\n\t<b>Compensating...</b>\n\t<b>Error: Single phallus detected in multiple mode. Reverting to prevent damage to user. Please do not attempt to remove your penises from the device or irreversible genetic damage may occur.</b>");
	if(flags["DONG_DESIGNER_MALFUNCTIONED"] == undefined) output("\n\nUh oh.");
	else output("Fuck, not again.");
	output("\n\nThe inside of the Dong Designer is already vibrating and hot, like before, but this time it’s almost too hot, uncomfortably so. Sweat breaks out on your forehead");
	if(pc.hasScales()) output(", slipping out from between your scales");
	else if(pc.hasFur()) output(" and drips from your fur");
	else output(" dripping down your face");
	output(". A part of you is dreadfully afraid you’ve accidentally thrust yourself into a malfunctioning cock-smelter, but the rest of you is paradoxically excited by the too-warm massage coming from the box’s interior.");
	output("\n\nA winking woman with pointed ears and a glowing shock of purple hair appears overtop of the fading warnings accompanied by a pre-recorded voice clip, <i>“Please try to remain still while we take care of this little hiccup. Remember, here at TamaniCorp, your junk is our treasure! Our Hora Series devices are built with multiple redundancies to ensure complete customer satisfaction.”</i>");
	output("\n\nThe recording ends about the same time the heat changes texture, suffusing your [pc.cock " + args[0] + "] so completely that it’s difficult to determine if the box is still warming you up or if you penis has transformed into a miniature fusion reactor. It’s like your length is being force-fed distilled ambrosia until you can scarcely determine where your cock ends and the rhythmically squeezing box begins.");
	output("\n\nThe punky elf-girl returns. This time she’s far enough away from the holocam for you make out two corset-straining breasts. She knows it too, judging by the way she’s leaning forward to give you a look straight into the beckoning canyon of cleavage. <i>“We apologize for this small error, and I assure you that technicians will be dispatched to ensure this unit functions as exactly as well as your own...”</i> Sparkling violet eyes glance downward toward your crotch. While a glowing message declares, <i>“UNIT OUT OF WARRANTY. PLEASE REPLACE.”</i>");
	output("\n\nYou grunt and try not to cum to the sight of the jiggling sexpot they’ve programmed into the machine. You’d love to have eye-candy like this when your salvaged cock box is actually working properly...");
	output("\n\nThe slut’s image flickers, and her syrupy voice coos, <i>“We’ll have both of those dicks modded back to normal in no time, unless you’re two brave boys who decided to go into the machine together.”</i> She giggles. <i>“If that’s the case, you guys might wind up with identical cocks, but that’s nothing a solo trip to one of our Hora Series Dong Designers won’t fix!”</i> Tugging at the top left of her latex corset, the tart pops a glossy, purple nipple into view. It engorges before your eyes. <i>“Thank you for your patience, " + pc.mf("stud","hot stuff") + ". As the chief customer relations officer, advertising model, test subject, CEO, and owner of TamaniCorp, I assure you that I want nothing more than for you to have a happy, safe, and fuck-filled day.”</i> She flicks her nipple and squeaks.");
	output("\n\nBoth dicks? The machine releases a noisy squelch, and your stomach flutters in confusion. There’s so much more sensation than before, so many tingles and sizzles of red-hot bliss coursing into you. You can feel it twisting and tugging, pulling you every which way, like you’ve got two ghostly hands jacking you off in a pool of liquid chocolate. Is it... is it actually giving you two dicks? Blinking your eyes closed to focus on your sense of touch, you try to keep the pleasure center of your brain from shorting out. There’s definitely two sources of bliss burning hot inside the device, and they’re gaining definition by the second. You can almost feel the [pc.cockHead " + args[0] + "] flexing with desire, demanding to fire twin ropes of [pc.cum] into the malfunctioning machine’s internals....");
	
	processTime(5);
	clearMenu();
	addButton(0,"Next",cockBoxDickDoublingHijinxII, args);
}
public function cockBoxDickDoublingHijinxII(args:Array):void
{
	clearOutput();
	author("Fenoxo");
	showName("\nUH OH!");
	showBust("TAMANI_NUDE");
	output("The hologram flickers. When it comes back, the top-heavy spokesmodel-slash-owner is completely topless. Her other nipple is pierced with a ring of amethyst hardlight, and she’s openly rubbing both of them with her manicured fingernails, pulling and squeezing them encouragingly, making her valley-like cleavage shift with every jiggle of her mountainous melons. <i>“If you’re seeing me here, about to cum for you, then we’re almost done fixing our mistake! Thanks for being such a w-wonderful... " + pc.mf("handsome","sexy") + "... customer, and feel free to cum whenever the need takes you.”</i>");
	output("\n\nHer words couldn’t come at a better time. Your obviously doubled dongs are getting harder by the second, almost impossibly so. [pc.Cum] slowly bubbles up inside you, pumped toward inevitable release by violent clenches of your abdominal muscles.");
	if(pc.balls > 0) output(" Even your [pc.sack] feels pulled tight.");
	if(pc.cockTotal() == 2) output(" Your other dick - the one not in the machine - unashamedly weeps strands of pre-cum down the side of the box.");
	else if(pc.cockTotal() > 2) output(" Your other dicks - the ones not in the machine - unashamedly weep strands of pre-cum down the side of the box.");
	output("\n\nThe sensuous CEO visibly shudders and cums when she tugs on her violaceous nipples, her piercing flashing bright to announce her orgasm’s arrival. And you climax right on with her, suddenly screaming and thrashing as you unload [pc.cum] through one more dick than you expected to have to today, so drenched in orgiastic ecstasy that your body can’t even keep your ejaculation from being trembling, misfiring things.");
	output("\n\nYou flop your torso through the busty hologram and over the top of the machine, bonelessly ejaculating for what feels like hours but must only be a minute at the most.");
	if(pc.cumQ() >= 1000) 
	{
		output(" When you come to, you discover thick streams of [pc.cum] have broken through the seal around your newly doubled dicks and puddled on the floor.");
		if(pc.cumQ() >= 5000)
		{
			output(" Although, puddle is hardly a fitting word for the lake you’ve created.");
			pc.applyCumSoaked();
		}
		if(celiseIsCrew()) output(" Celise will certainly be pleased.");
		pc.applyCumSoaked();
	}
	output("\n\n<i>“Thanks again for using Tamani-brand products in your INVALID FACILITY TYPE!”</i> The purple-haired harlot winks and blows a kiss down at you from above. <i>“Cum back soon!”</i> She flickers out of existence with a saucy, satisfied smile.");
	output("\n\nIt’s hard to be mad at her after getting off like that, even when you pull out and find that <b>the dick you put into the machine has divided its mass into two smaller penises.</b> You could probably find someone on Novahome to help you get rid of the extra if you wanted.");

	var cloneDick:CockClass = new CockClass;

	var newLength:Number = Math.round(Math.pow((pc.cocks[args[0]].cLengthRaw * pc.cocks[args[0]].cLengthRaw * pc.cocks[args[0]].cLengthRaw / 2), 1/3)*10)/10;

	pc.cocks[args[0]].cLengthRaw = newLength;

	cloneDick.cLengthRaw = pc.cocks[args[0]].cLengthRaw;
	cloneDick.cThicknessRatioRaw = pc.cocks[args[0]].cThicknessRatioRaw;
	cloneDick.cType = pc.cocks[args[0]].cType;
	cloneDick.cockColor = pc.cocks[args[0]].cockColor;
	cloneDick.knotMultiplier = pc.cocks[args[0]].knotMultiplier;
	cloneDick.flaccidMultiplier = pc.cocks[args[0]].flaccidMultiplier;
	for(var x:int = 0; x < pc.cocks[args[0]].cockFlags.length; x++)
	{
		cloneDick.cockFlags.push(pc.cocks[args[0]].cockFlags[x]);
	}
	
	pc.cocks.splice(args[0],0,cloneDick);
	processTime(2);
	pc.orgasm();
	pc.orgasm();
	IncrementFlag("USED_DONG_DESIGNER");
	IncrementFlag("DONG_DESIGNER_MALFUNCTIONED");
	clearMenu();
	addButton(0,"Next",useInstalledDickBox);
}
