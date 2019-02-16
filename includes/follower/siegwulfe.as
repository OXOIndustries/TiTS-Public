import classes.Items.Accessories.SiegwulfeItem;

/*
Acquire a <i>“Siegwulfe Personal Security Companion”</i> -- a derivative of the Fenris-class assault drone -- from {Follower Anno? The Last Chance?}. Intended to be a super-high-end bodyguard droid for the flamboyantly wealthy. Combines the mobility and power of the Fenris drones with a slinky, sultry-voiced fembot for <i>“companionship.”</i> Think EDI, but a little more Terminator.

Alternatively, can find a slutty bimbo version with huge milk tanks and ganguro colors from {Penny?}. This version’s A.I. has been heavily tampered with, making it egregiously lewd, bubbly, and cock-hungry. Unfortunately, it’s not as good at fighting thanks to its enormous tits and altered programming.

Both versions have a utili-tail with an <i>“induction port”</i> in the middle (ie, tailcunt/probe). Can totally mount a synth-dick on her undercarriage -- same kind you can give Gianna. Not sure if should have normal sex-bits in back -- tailcunt + titfuck/blowjob queen!

Normal version is a physical attack drone, same as Tam-wolf 1.0, dealing pure Penetrating damage. By leaping in to interfere with enemies and block attacks with her body, she grants a small Evasion bonus (based on 10% Intelligence). No bonus shields, etc. She attacks with a pair of retractable Wolverine claws in her wrist!

Bimbo Wulfy is a lust attack drone, who makes either a [Large, Milky Breasts] or a [Big Centaur Ass] tease attack every round, determined randomly. Maybe on an AI routine if the PC uses Sense and one of those is more/less effective.
Item Stuff
________________________________________
Get Where: The Hunter’s Dream
How Much: Like 10k or something
What Do: A new replacement drone! Useable only by Tech Specs in combat, but anyone can buy a Siegwulfe for their ship. Combat Siegwulfe has the same stats as Tam-wolf, maybe a point or two higher damage, dealing pure Kinetic (Penetrating) damage. The big advantage of the expensive-ass upgrade is that she bodyblocks physical attacks for you -- granting an Evasion bonus equal to 10% of your Intelligence. Just a little boost. Bimbo Siegwulfe on the other hand is a Tease Drone -- she makes a low-power tease attack every round. Instead of Evasion, she grants a bonus to Sexiness equal to the same. Finally, Tech Specs get a viable tease attack option!
________________________________________
*/
//Siegwulfe Expansion:
/* Some of the shit the coder will need to do:
Instate a lust system for Siegwulfe with associated blurbs and rut event
Handle optional eggnancies/timers
Get [wulfe.pcname] to work - "works" in characters/Siegwulfe.as
Handle exhibitionism events*/

public function showSiegwulfe(nude:Boolean = false):void
{
	showBust(wulfeBustDisplay(nude));
	showName("\n" + chars["WULFE"].short.toUpperCase());
}
public function wulfeBustDisplay(nude:Boolean = false):String
{
	var bustName:String = chars["WULFE"].bustDisplay;
	
	if(nude) bustName += "_NUDE";
	
	return bustName;
}

public function siegwulfeIsCrew():Boolean
{
	if(flags["WULFE_ON_SHIP"] != undefined) return flags["WULFE_ON_SHIP"];
	return false;
}
public function hasSiegwulfe():Boolean
{
	if(InShipInterior() && (pc.hasItemInStorageByClass(SiegwulfeItem) || siegwulfeIsCrew())) return true;
	return hasSiegwulfeOnSelf();
}
public function hasSiegwulfeOnSelf():Boolean
{
	if(pc.accessory is SiegwulfeItem || pc.hasItemByClass(SiegwulfeItem)) return true;
	return false;
}

// Purchase and Configure Siegwulfe
public function canBuySiegwulfe(isBimbo:Boolean = false):Boolean
{
	if(pc.level < 6 || flags["WULFE_ON_SHIP"] != undefined || hasSiegwulfe()) return false;
	
	if(!isBimbo) chars["WULFE"].configNormal();
	else chars["WULFE"].configBimbo();
	
	return true;
}

// Activating Siegwulfe (1st Time)
// PC gets wulfy delivered to the ship’s cargo hold on purchase. Add [Siegwulfe] to the inventory panel, or wherever you put the Cockbox etc.
public function activateSiegwulfe(fromInv:Boolean = false):void
{
	clearOutput();
	author("Savin");
	showBust(wulfeBustDisplay());
	showName("YOU’VE GOT\nA SIEGWULFE!");
	
	output("You head down to your cargo hold, where the nearly man-sized crate full of robotic hound-bot is waiting for you. A Reaper Armaments logo on one side, just above a second marking labeling the crate’s contents as having been produced by Fenrir Robotics, one of Reaper’s daughter companies. You pop the seal on the crate and its sides fall open like flower petals, crashing onto the deck and revealing its contents:");
	output("\n\nSitting on its haunches inside is what looks like a robotic centaur, save for the lower body being a chrome canine form rather than equine. A long, sinuous tentacle is coiled around one of its clawed legs, mounted from where the droid’s tail should be. Where the canine’s head would be, you instead are greeted by a flared pair of synth-skin hips, leading up to a humanoid figure that’s pleasantly feminine and reassuringly tough-looking. A " + (chars["WULFE"].isBimbo() ? "soft, smooth belly, shapely arms, enormous breasts - each capped by an engorged black nipple -" : "flat, chiseled belly, toned arms, small breasts restrained by a black sports bra,") + " and a face half-shielded by an opaque visor all round out the wolf-droid’s top half.");
	output("\n\nSeeing that the droid is inactive, you glance around its -- her? -- frame until you notice that the tendril-tail has a power jack on its tip, tucked away between three smaller ones that branch out from the end. You uncoil the cord from the droid’s leg and walk it over to a nearby port in the wall. It only takes a few moments after you plug the tail-jack in before the droid wakes with a muted, feminine gasp, turning her head side to side.");
	output("\n\nThe siegwulfe takes a moment to orient herself before her towering ausar-like ears clue her in to your presence. She rises to her feet and turns your way with a sensuous, predatory grace. Razor-sharp claws click on the deck, and her arms fold under her chest, drawing your attention to a pair of hardlight cuffs on her wrists -- where her combat blades come from, if you remember the promotional picture right.");
	output("\n\n" + (chars["WULFE"].isBimbo() ? "<i>“Like, hi there!”</i> the gynoid-hound squeaks, her voice all bubbly and playful" : "<i>“Hello,”</i> the gynoid-hound says, voice a husky, sultry purr") + ". The visor on her helmet slides up, revealing a pleasantly soft female face, with " + (chars["WULFE"].isBimbo() ? "bloated" : "slender") + " black lips and dark red eyes. She might be billed on the box as a killer, but from the waist up she " + (chars["WULFE"].isBimbo() ? "undeniably looks" : "looks a lot more") + " like a high-class companion droid. <i>“Are you my new [pc.master]? It would be my " + (chars["WULFE"].isBimbo() ? "pleasure" : "honor... and pleasure...") + " to serve as your loyal " + (chars["WULFE"].isBimbo() ? "comp... compan... playmate! And body... bodygu... booty call!" : "companion and bodyguard.") + "”</i>");
	output("\n\n");
	if(pc.isBro() || pc.isAss()) output("<i>“I bet it would,”</i> you grin, reaching over an tweaking one of her " + (chars["WULFE"].isBimbo() ? "plump nipple, getting a surprise squirt of [wulfe.milk] in return" : "stiff little nipples through the black bra she came with") + ". The siegwulfe canters forward a step, biting on a lip.");
	else if(pc.isBimbo()) output("<i>“Like, totally!”</i> you cheer, bouncing on the spot. <i>“We’re gonna have soooo much fun!”</i>");
	else output("<i>“I am,”</i> you nod.");
	output("\n\n<i>“" + (chars["WULFE"].isBimbo() ? "Yay!" : "Excellent.") + " Now registering [pc.master]...”</i>");
	output("\n\n<i>“Steele,”</i> you say. <i>“[pc.name] Steele.”</i>");
	output("\n\nThe droid smiles " + (chars["WULFE"].isBimbo() ? "excitedly" : "demurely") + ". <i>“[pc.Master] [pc.name]. Thank you again for purchasing me. I am designated Siegwulfe model seven, serial number X33897-28. Would you like to give me a new designation? A... pet name, perhaps?”</i>");
	output("\n\nShe gives an obviously programmed chuckle at the end of the query, running a finger along the small leather collar on her neck. Now that she’d drawn your gaze to it, you can see the holographic tags are blank, with a blinking cursor awaiting your answer...");
	
	processTime(12);
	
	siegwulfeGenitals(-1);
	siegwulfeGenitals(0);
	flags["WULFE_ON_SHIP"] = true;
	
	// [Insert Namebox Here]
	clearMenu();
	addButton(0, "Name Her", nameSiegwulfe, fromInv);
	if (!pc.hasKeyItem("Siegwulfe Datacore")) addDisabledButton(1,"Use Datacore","Use Datacore","You don’t have a Siegwulfe Datacore with you.");
	else if ((chars["WULFE"].isBimbo() && flags["SYRIQUEST_VALDEN_BODY_CHOICE"] == 2) || (!chars["WULFE"].isBimbo() && flags["SYRIQUEST_VALDEN_BODY_CHOICE"] == 3) ) addButton(1, "Use Datacore", useDatacoreOnSiegwulfe, fromInv, "Use Datacore", "Put your old datacore into the new Siegwulfe.");
	else addDisabledButton(1,"Use Datacore","Use Datacore","The V. I. on your datacore is not compatible with this body.");
}
public function renameSiegwulfe(fromInv:Boolean = false):void
{
	clearOutput();
	author("Savin");
	showBust(wulfeBustDisplay());
	showName("RENAME\nSIEGWULFE");
	
	output("<i>“O-oh... you don’t like my name, [pc.master]?”</i> she asks, reaching for her collar. <i>“Here, feel free to change it.”</i>");
	
	clearMenu();
	addButton(0, "Next", nameSiegwulfe, fromInv);
	addButton(14, "Back", approachSiegwulfe, [false, fromInv]);
}
public function nameSiegwulfe(fromInv:Boolean = false):void
{
	clearOutput();
	author("Savin");
	showBust(wulfeBustDisplay());
	showName("\nNAME?");
	
	output("What do you decide to name her?");
	displayInput();
	this.userInterface.textInput.text = chars["WULFE"].short;
	output("\n\n\n");
	
	clearMenu();
	addButton(0, "Next", nameSiegwulfeCheck, fromInv);
}
public function nameSiegwulfeCheck(fromInv:Boolean = false):void
{
	if(this.userInterface.textInput.text == "")
	{
		nameSiegwulfe(fromInv);
		output("<b>You must input a name.</b>");
		return;
	}
	// Illegal characters check. Just in case...
	if(hasIllegalInput(this.userInterface.textInput.text))
	{
		nameSiegwulfe(fromInv);
		output("<b>To prevent complications, please avoid using code in the name.</b>");
		return;
	}
	if(this.userInterface.textInput.text.length > 14)
	{
		nameSiegwulfe(fromInv);
		output("<b>You must enter a name no more than fourteen characters long.</b>");
		return;
	}
	chars["WULFE"].short = this.userInterface.textInput.text;
	if(stage.contains(this.userInterface.textInput)) this.removeInput();
	nameSiegwulfeResult(fromInv);
}
public function nameSiegwulfeResult(fromInv:Boolean = false):void
{
	clearOutput();
	author("Savin");
	showSiegwulfe();
	
	var setName:String = (chars["WULFE"].short.toLowerCase());
	
	// Special Names:
	switch(setName)
	{
		// Tam-wolf
		case "tam-wolf":
			output("<i>“Tam... wolf?”</i> she echoes curiously, rubbing her tags between thumb and forefinger. <i>“Are you sure, [pc.master]? I’m not a cat-girl, and I’m </i>much<i> more advanced than a mere Fenris drone!”</i>");
			output("\n\nOh, hush. It’s a perfectly good name.");
			break;
		// Sig
		case "sig":
			output("<i>“[wulfe.name]?”</i> she echoes curiously, rubbing her tags between thumb and forefinger. <i>“Like the legendary dragon-slayer? Or dragon-layer, was it?”</i>");
			output("\n\n[wulfe.name] giggles girlishly -- a more genuine reaction than you’d expect a V.I. like her to be able to have. <i>“Maybe you plan to rent me out to some gryvain and fanfirs? It would be my pleasure to pleasure your friends, too!”</i>");
			output("\n\nAaaand you’ve found yourself a slutty bodyguard bot. How very you.");
			break;
		// Goo's name
		case (chars["GOO"].short.toLowerCase()):
			if(hasGooArmorOnSelf())
			{
				output("<i>“[wulfe.name],”</i> she echoes happily, rubbing her tags between thumb and forefinger. <i>“A love--”</i>");
				output("\n\n<i>“H-hey! No fair--that’s </i>my<i> name!”</i> a familiar voice calls out to you. It seems the gooey [goo.name] doesn’t like you stealing her name!");
				output("\n\nThe newly-named siegwulfe tilts her head in confusion as the input is finally confirmed.");
				output("\n\nWelp. Tough luck, goo-[goo.name]’s just going to have to live with it!");
			}
			else
			{
				output("<i>“[wulfe.name],”</i> she echoes happily, rubbing her tags between thumb and forefinger. <i>“A lovely name, [pc.master], thank you so much!”</i> ");
				output("\n\nThe newly-named siegwulfe cocks her head aside and gives you a pleasant little smile.");
				output("\n\nWell, hopefully the gooey [goo.name] won’t mind you borrowing her name...");
			}
			break;
		// Any Other Name:
		default:
			output("<i>“[wulfe.name],”</i> she echoes happily, rubbing her tags between thumb and forefinger. <i>“A lovely name, [pc.master], thank you so much!”</i> ");
			output("\n\nThe newly-named siegwulfe cocks her head aside and gives you a pleasant little smile.");
			break;
	}
	// Combine All
	output("\n\nClearly pleased with her new name, [wulfe.name] sits down on her chrome haunches and watches you expectantly. When the moment drags on for an uncomfortable length, you figure that the routine your new companion was programmed to carry out the first time she came online has now been completed. She’s just waiting patiently for instructions like any other droid.");
	if(pc.IQ() >= 66) output(" Amazing how quickly the siegwulfe can go from cheerful, sexy doggy-‘taur to idleness that borders on that of a statue. Someone spent a great deal of effort on her “companion” programming, that’s for sure.");
	output(" Guess she is just a really fancy V.I. after all -- even if she can simulate a sexy hunter-killer babe when her programming dictates.");
	output("\n\nOr whenever <i>you</i> want her to. She sounded quite eager to put the softer side of her functionality to the test for you. Maybe you ought to make use of the companion houndess...");
	
	processTime(3);
	
	//to Siegwulfe’s menu
	clearMenu();
	addButton(0, "Next", approachSiegwulfe, [false, fromInv]);
}

public function useDatacoreOnSiegwulfe(fromInv:Boolean = false):void
{
	clearOutput();
	author("Stygs");
	showBust(wulfeBustDisplay());
	showName("SWITCHING\nDATACORES");

	output("<i>“No, that won’t be necessary.”</i> you say " + (pc.isAss() ? "coldly" : "calmy") + ". After all, you don’t want a new Siegwulfe, you just want your old one back. And as Valden is certainly not going to return her body to you, there is only one way for you to do this.");
	output("\n\nThe Siegwulfe seems taken back at your refusal, just sitting there without movement or any other word. Looks like that was wasn’t the answer her programmers expected. It takes you a " + (pc.characterClass == GLOBAL.CLASS_ENGINEER ? "brief " : "") + "moment before you remember that this isn’t actually a reaction to your refusal but rather the normal procedure - her initialization routine has run its course and you haven’t given her any new commands.");
	output("\n\nWell, better to get this over with now quickly before you grow attached to the new V. I.. With a " + (pc.isNice() ? "heavy " : "") + "sigh you tell her to deactivate herself.");
	output("\n\n<i>“I live to serve.”</i> your canine droid says with an content smile as she shuts off. Switching the cores afterwards is a simple affair - you do have a bit of experience at that after all - and mere moments later [wulfe.name]’s CPU is locked firmly into her new chassis.");
	output("\n\n[wulfe.name]’s eyes briefly flash as she boots up before tuning into the constant crimson red you are used to. Slowly looking around the room, the towering " + (chars["WULFE"].isBimbo() ? "bimbo" : "gynoid") + "-hound seems kinda lost for a moment before focusing her gaze on you, now a " + (chars["WULFE"].isBimbo() ? "lustful" : "playful") + " smirk on her face.");
	output("\n\n<i>“Hello again, [pc.master].”</i> a familiar voice purrs. <i>“How may I" + (chars["WULFE"].isBimbo() ? ", like," : "") + " serve you today?”</i>");
	output("\n\nWell, looks like that little brain transplant worked just fine. Then again, it couldn’t hurt to thoroughly test certain features of your mechanic companion just to be one the safe side....");
	if (chars["WULFE"].isBimbo()) output(" An in-depth check, so to speak.");

	processTime(3);
	chars["WULFE"].short = flags["SYRIQUEST_SIEGWULFE_NAME"];
	pc.removeKeyItem("Siegwulfe Datacore");

	clearMenu();
	addButton(0, "Next", approachSiegwulfe, [false, fromInv]);
}

// “Equipping” Siegwulfe
// Equipping
public function SiegwulfeEquip():void
{
	output("You call [wulfe.name] to you side and command her to enter guard mode.");
	output("\n\n<i>“Of course, [pc.master],”</i> she says with a slim smile. <i>“" + (chars["WULFE"].isBimbo() ? "I’ll, like, take super good care of you! Don’t you worry about a thing!" : "I live to serve.") + "”</i>");
	output("\n\nShe trots around you, rolling her shoulders and lowering her combat visor. Looks like she’s ready to go!");
	output("\n\n");
}
// Unequip
public function SiegwulfeUnequip():void
{
	output("You put a hand on [wulfe.name]’s shoulder and tell her to stand down for now -- to go into passive mode.");
	output("\n\n<i>“Are you sure, [pc.master]?”</i> she asks, trotting up and circling you. <i>“" + (chars["WULFE"].isBimbo() ? "I can’t, like, keep you safe and stuff if I’m in pa... pass... idle mode!" : "My purpose is to protect you, after all.") + "”</i>");
	output("\n\nYou tell her that you’re sure. Just follow along quietly until you reactivate her. She sighs and nods, falling into step behind you.");
	output("\n\n");
}

// Disabled
public function disableSiegwulfe():void
{
	output("\n\n[wulfe.name] shrieks, her voice first shrill, then tearing into a synthetic whine. Her entire body goes rigid, and her eyes roll back in her head. With a final, pathetic whine, she slumps over and collapses.");
	pc.createStatusEffect("Combat Drone Disabled", rand(5) + 1, 0, 0, 0, true, "", "", true, 0);
}

// Crew Menu Text
public function siegwulfeInteractBonus(btnSlot:int = 0):String
{
	return siegwulfeOnShipBonus(btnSlot, true);
}
public function siegwulfeOnShipBonus(btnSlot:int = 0, fromInv:Boolean = false):String
{
	// Bought, but not activated.
	if(flags["WULFE_ON_SHIP"] == false)
	{
		addDisabledButton(btnSlot, "Siegwulfe", "Siegwulfe", "Check your storage!");
		return "\n\nYou remember an order you placed for a Siegwulfe... <b>perhaps you should check to see if it arrived in your ship’s storage?</b>";
	}
	// No Siegwulfe!
	if(!fromInv && !hasSiegwulfe()) return "";
	if(pc.hasItemInStorageByClass(SiegwulfeItem))
	{
		addDisabledButton(btnSlot, (chars["WULFE"].short), (chars["WULFE"].short), "You can’t do anything with your Siegwulfe while she is in your ship’s storage.");
		return "\n\nYour Siegwulfe is currently stored away in your ship’s storage.";
	}
	
	var bonusText:String = "";
	
	if (siegwulfeIsCrew())
	{
		if (chars["WULFE"].isDom()) bonusText += "\n\n[wulfe.name] will no doubt be around nearby you, given her protective instinct.";
		else bonusText += "\n\n[wulfe.name] is probably somewhere nearby.";
	}
	else
	{
		if (chars["WULFE"].isDom()) bonusText += "\n\n[wulfe.name] is near you, alternating between scanning for threats and eyeing you hungrily, her teats stiffening just that little bit more whenever she checks you out.";
		else bonusText += "\n\n[wulfe.name] is wandering around near you.";
	}
	
	addButton(btnSlot, (chars["WULFE"].short), approachSiegwulfe, [true, fromInv], (chars["WULFE"].short), (chars["WULFE"].isDom() ? "Call for your bimbo-domme Mistress." : ("Check up on your loyal " + (chars["WULFE"].isBimbo() ? "bimbobot" : "Siegwulfe") + ".")));
	return bonusText;
}

// Siegwulfe Interactions
public function approachSiegwulfe(arg:Array):void
{
	clearOutput();
	author("Savin");
	showSiegwulfe();
	
	var introText:Boolean = arg[0];
	var fromInv:Boolean = arg[1];
	
	// Greeting Siegwulfe
	if(introText)
	{
		if(chars["WULFE"].isDom() && !InShipInterior())
		{
			author("Wsan");
			output("You catch [wulfe.name]’s eye and wave her down. She bounds over to you almost bowling you over in her eagerness, and immediately curls her body around yours.");
			output("\n\n<i>“Yes, [wulfe.pcname]?”</i> she purrs, her big metallic ears focused on you. <i>“Looking for something?”</i>");
		}
		else if (chars["WULFE"].isDom() && hasSiegwulfe())
		{
			author("Wsan");
			output("Smiling, [wulfe.name] looks at you expectantly. There’s a hungry gleam in her eyes.");
		}
		else if (chars["WULFE"].isDom())
		{
			author("Wsan");
			output("How do you call out for her without being disrespectful? Before you can really think about it, you feel something soft pressing against your back and then on your shoulder.");
			output("\n\n<i>“Hi, [wulfe.pcname]!”</i> she says excitedly, her head laid next to yours. <i>“Were you looking for me?”</i>");
		}
		// SW is currently on ship
		else if(InShipInterior() && !hasSiegwulfe())
		{
			output("You give a sharp whistle and call [wulfe.name]’s name. After a few moments, your loyal combat companion comes trotting over from her neck of the ship, all wagging tails and dark-lipped smiles.");
			output("\n\n<i>“Yes, [pc.master]?”</i> she smiles, planting herself on the deck in front of you.");
			if(pc.HP() < 66 && pc.lust() >= 33) output("\n\n<i>“[pc.Master], you look unwell. Have your adventures been hard on you without me? Please, let me serve you -- or better yet, come with you! I’ll protect you out there... and comfort you here, if you’d like.”</i>");
			else if(pc.HP() < 66) output("\n\n<i>“Oh, no! Did someone hurt you, [pc.master]!?”</i> she gasps, seeing the state you’re in. Growling, she snaps her visor down and brandishes her claw-mounts. <i>“Point them out, and I’ll cut them down, [pc.master]!”</i>");
			else if(pc.lust() >= 33) output("\n\n<i>“Oh, [pc.master], you look a little flushed,”</i> [wulfe.name] murmurs, pawing the deck in front of you. <i>“Would you like me to serve you in any way?”</i>");
		}
		// SW is currently acting as battledroidwaifu. Probably accessed via Inventory?
		else
		{
			output("You give a sharp whistle and call for your battle-companion to heel. Obediently, [wulfe.name] halts on a dime and plants her robotic butt on the ground, tail swishing expectantly.");
			output("\n\n<i>“Yes, [pc.master]?”</i> she purrs, wobbling her big metallic ears towards you.");
			if(pc.HP() < 66 && pc.lust() >= 33) output("\n\n<i>“[pc.Master], it looks like things have been hard on you! Please, you should rest awhile. Let me ease your burdens for a little bit, please...”</i>");
			else if(pc.HP() < 66) output("\n\n<i>“Oh, no! [pc.Master], you’re hurt! Please, let’s find a nurse-droid to tend to you, or at least rest for a while. I can only protect you so much if you don’t take care of yourself.”</i>");
			else if(pc.lust() >= 33) output("\n\n<i>“Oh, [pc.master], you look a little flushed,”</i> [wulfe.name] murmurs, pawing the ground in front of you. <i>“Would you like me to serve you in any way?”</i>");
		}
		processTime(2);
	}
	else output("With a smile, [wulfe.name] patiently awaits your action.");

	// [Pet] [Fuck] [Appearance] [Take/Stay] [Leave]
	clearMenu();
	addButton(0, "Pet", doSiegwulfeAction, ["pet", fromInv], "Pet", "Reward your trusty robotic companion with a pet.");
	if(pc.lust() >= 33) addButton(1, "Fuck", doSiegwulfeAction, ["fuck", fromInv], ("Fuck " + chars["WULFE"].short), "Or, reward your sexy robotic companion a different way...");
	else addDisabledButton(1, "Fuck", ("Fuck " + chars["WULFE"].short), "You are not aroused enough for this!");
	if(flags["WULFE_ON_SHIP"] == undefined)
	{
		if(InShipInterior()) addButton(4, "Stay", doSiegwulfeAction, ["stay", fromInv], "Stay Here, " + chars["WULFE"].short + ".", "Ask [wulfe.name] to stay on your ship.");
		else addDisabledButton(4, "Stay", "Stay Here, " + chars["WULFE"].short + ".", "This is probably not a good place to leave [wulfe.name] wandering around... Maybe you should head inside your ship first?");
	}
	else if(InShipInterior())
	{
		if(!pc.hasAccessory() || pc.inventory.length < pc.inventorySlots()) addButton(4, "Take", doSiegwulfeAction, ["take", fromInv], ("Take " + chars["WULFE"].short), (chars["WULFE"].isDom() ? "Ask your Mistress if she wants to accompany you." : "Ask [wulfe.name] to tag along with you."));
		else addDisabledButton(4, "Take", ("Take " + chars["WULFE"].short), "You don’t have any extra room to take her! Try emptying your inventory or taking off your accessory first.");
	}
	addButton(5, "Appearance", siegwulfeAppearance);
	if(debug) addButton(6, "Rename", renameSiegwulfe, fromInv, "Rename", "Change [wulfe.name]’s name to something else.");
	if(fromInv) addButton(14, "Back", itemInteractMenu);
	else addButton(14, "Leave", doSiegwulfeAction, ["leave", fromInv]);
	//Just put domme buttons on top of the other buttons y'know w/e
	if (chars["WULFE"].isDom())
	{
		addButton(0, "Pet", siegwulfeDommePettings, fromInv, "Petting", "Ask about petting.");
		siegwulfeDomSexButtons(fromInv);
		addButton(7, "Bimbo?", siegwulfeBimbosplanation, fromInv, "Bimbo Personality?", "Ask about [wulfe.name]’s bimbo personality.");
		if (flags["WULFE_EMP"] == 0) addButton(8, "EMP?", siegwulfeEMPExplanation, fromInv, "Her EMP?", "Ask [wulfe.name] about shutting down recording devices.");
	//No talk, only names
		if (flags["WULFE_PCNAME"] == undefined) clearMenu();
		addButton((flags["WULFE_PCNAME"] == undefined ? 0 : 9), "Talk Names", siegwulfeTalkNames, fromInv);
	}		
	return;
}

// When commanded to wait on the ship, add to menu.
public function siegwulfeAppearance():void
{
	clearOutput();
	author("Savin");
	showSiegwulfe();
	
	// Basic Appearance Screen
	if(!chars["WULFE"].isBimbo())
	{
		output("[wulfe.name] is a tall, sleek mechanical ‘taur in a roughly canid configuration. Four powerful chrome legs ending in sharp claws clatter on the ground, supporting a slender but strong body that ends in a long, sinuous tail capped with three tendrils and an elastic-looking port. The other end of her body culminates in a humanoid shape, obviously feminine and sensually attractive to boot. A layer of creamy pale synthskin coats her upper body from the waist up, seamlessly transitioning from the armored chrome and clinging tightly to a flat, tight bare stomach. Above rest a pair of small breasts -- barely C-cups, perky and palmable -- sitting high on her chest. Each is tipped with a single coin-sized black nipple, perpetually stiff and begging for a thumb to flick across them.");
		output("\n\nHer figure is otherwise toned and athletic, with two arms ending in segmented fingers and armored wrist-guards built into her flesh, which house a pair of extendable claws. A pair of highly alert ausar-like ears sit at the top of her head, growing from a permanently-affixed polysteel helm. From the helm flows a mane of dark hair, pulled back into a ponytail that runs down the small of her back. The visor slides up when not in use, revealing a statuesque synthetic face, chiseled but distinctly feminine like the rest of her, with pouty black lips and faintly glowing crimson eyes.");
		output("\n\nAt present, she’s wearing nothing but a tight, dark blue sports bra and a pair of metal shoulder-guards that display " + (9999 == 0 ? "your company’s" : "the Fenrir Robotics") + " logo. She has little need to cover her metallic lower body, and seems to find showing off her toned belly and strong arms agreeable enough. A tight leather collar, complete with dog-tags, clings to her neck -- a sign of submission, loyalty, and your ownership of her all at once.");
		output("\n\n<i>“Do you find me to your satisfaction, [pc.master]?”</i> [wulfe.name] purrs pleasantly, taking a step closer. Her slender tail coils happily around one of her legs, as close to a wagging tail as the ausar-built companion can get.");
	}
	// Bimbobot Appearance Screen
	else
	{
		output("[wulfe.name] is a big, bubbly mechanical ‘taur in a roughly canid configuration. Four powerful chrome legs ending in sharp claws clatter on the ground, supporting a sleek but strong lower body that ends in a long, sinuous tail capped with three tendrils and an elastic-looking port. A big, pink heart is emblazoned on her rump, which somehow seems to have been made thicker and more rounded compared to her original form. The other end of her body culminates in a humanoid shape, dripping femininity and sexuality. Sun-kissed bronze skin wraps around a figure that looks like it belongs on an ultraporn starlet, growing seamlessly from her broodmare-like waist and up over a pair of huge, jiggly milk jugs that quake and jiggle with every step. Each is capped with a broad black teat, perpetually stiff and dripping with [wulfe.milk]. Her stomach is flat and her waist is almost impossibly tiny given her otherwise voluptuous figure.");
		output("\n\nHer figure is soft but athletic enough, with two arms ending in segmented fingers and armored wrist-guards built into her flesh, which house a pair of extendable claws. A pair of highly alert ausar-like ears sit at the top of her head, growing from a permanently-affixed polysteel helm. A mane of wild, dark blonde hair flows from under the helm, spilling down her back from a high ponytail. The visor slides up when not in use, revealing a pair of plump black lips and a cute, girlish face with high cheeks and a hefty helping of simulated makeup. She’s got a pair of faintly glowing red eyes, surrounded by dark mascara and blushed cheeks.");
		output("\n\nAt present, she’s wearing nothing but a pair of metal shoulder-guards that display " + (9999 == 0 ? "your company’s" : "the Fenrir Robotics") + " logo, surrounded by cute little pink hearts. Why would she cover her body when it’s been designer-made to entice, to draw every wandering stare and leave you wanting more. A tight leather collar, complete with dog-tags, clings to her neck --");
		if (!chars["WULFE"].isDom())
		{
			output(" a sign of submission, loyalty, and your ownership of her all at once.");
			output("\n\n<i>“Still think I’m, like, super pretty, [pc.master]?”</i> [wulfe.name] purrs pleasantly, taking a step closer and hefting her massive milk-jugs up for your inspection. <i>“Wanna touch? Or can I make you feel suuuuper good and stuff with them? Anything you want, I’m your girl!”</i>");
			output("\n\nShe giggles and wiggles her hips, putting everything on offer.");
		}
		else
		{
			output(" a one-time sign of your ownership of her, now little more than a pretty reminder of the past between the two of you.");
			output("\n\nBelow her stomach an inconspicuous port is host to her scandalous secret; a thick, hulking dogcock complete with a gigantic knot hangs between her legs when she activates it, twenty five inches of projected pleasure. The knot is easily bigger than your fist. You know only too well how capable she is of utilizing both of them in unison to bring someone - particularly you - to heel.");
		}
	}
	
	processTime(1);
	
	addDisabledButton(5, "Appearance");
}

public function doSiegwulfeAction(arg:Array):void
{
	clearOutput();
	author("Savin");
	showSiegwulfe();
	clearMenu();
	
	var response:String = arg[0];
	var fromInv:Boolean = arg[1];
	
	switch(response)
	{
		// Pet Siegwulfe
		case "pet":
			output("You");
			if(pc.tallness <= chars["WULFE"].tallness / 2) output(" lean up on your tippy-toes");
			else if(pc.tallness <= chars["WULFE"].tallness) output(" reach over");
			else output(" lean down");
			output(" and plant a hand on top of [wulfe.name]’s crash helmet and give it an affectionate pat. She blinks in surprise, then " + (chars["WULFE"].isBimbo() ? "giddily bounces in place, nuzzling against your hand and jiggling those enormous jugs of hers. <i>“Yay! [pc.Master] loves me!”</i> she giggles, pawing one of her hindlegs into the ground. <i>“Maybe [pc.heShe]’ll, like, give me a bone, too! Hehe!”</i>" : "gives you a demure smile, wagging her slender tail. <i>“You’re too kind, [pc.master],”</i> the husky-voiced gynoid breathes, gently nuzzling her head into your palm."));
			output("\n\nYou take that as encouragement, running your hand down her armored scalp and into the lush, " + (!chars["WULFE"].isBimbo() ? "dark" : "blonde") + " hair spilling down her back. For a kill-bot, [wulfe.name] makes a real show of moaning and pressing her cheek into your shoulder, whispering <i>“" + (chars["WULFE"].isBimbo() ? "Oh, you’ve got talented hands!" : "Oh... that feels lovely, [pc.master]. Please don’t stop...") + "”</i>");
			output("\n\nAll things must come to an end, though. Eventually, your hand reaches the small of the gynoid’s back, where synthflesh transitions to armored steel entirely. Pulling the droid close, you nevertheless reach to her hind end and rub at the shiny chrome just over her mighty metallic rump. She chuckles indulgently, curling her utility-tail up and wrapping it around your wrist. She can’t feel anything on her armored half, you’re pretty sure, but she seems to enjoy the closeness and affection in the act, if nothing else.");
			output("\n\nWhen you’ve finished, [wulfe.name] murmurs softly and wiggles her hind-end excitedly, taking a few springing steps around you. <i>“Thank you, [pc.master]! " + (chars["WULFE"].isBimbo() ? "So, like, what’s next!" : "Is there anything I can do for </i>you<i>?") + "”</i>");
			
			processTime(5);
			
			//Set PC lust to 33, or add +10 Lust, whichever ends higher.
			if(pc.lust() < 23) pc.lust(33, true);
			else pc.lust(10);
			
			addButton(0, "Next", approachSiegwulfe, [false, fromInv]);
			break;
		// Fuck Siegwulfe
		case "fuck":
			output("Stepping a little close to [wulfe.name], you run a hand along the smooth, " + (!chars["WULFE"].isBimbo() ? "pale" : "tanned") + " synthflesh of her arm. She glances up at you with big doe-eyes and her black lips widen into a demure, submissive smile. " + (chars["WULFE"].isBimbo() ? "<i>“[pc.Master]? See something you like?”</i> she giggles, cupping her inflated chest and pinching a nipple." : "<i>“Would you like me to serve you, [pc.master]?”</i> [wulfe.name] offers simply, hooking a thumb in the band of her sports bra and starting to pull.") + " <i>“Just tell me what you want...”</i>");
			
			processTime(1);
			
			// PCs with cocks get a choice of scenes. Otherwise, play as appropriate.
			if(pc.hasCock())
			{
				// [Get Oral] [Fuck Her]
				addButton(0, "Get Oral", doSiegwulfeSex, "get oral", "Get Oral", "Have the sensual siegwulfe drone use her mouth to get you off.");
				addButton(1, "Fuck Her", doSiegwulfeSex, "fuck her", "Fuck Her", ("Get around behind the " + (chars["WULFE"].isBimbo() ? "fat-bottomed" : "robotic") + " hound-girl and see what’s sitting between her hind legs..."));
			}
			else addButton(0, "Next", doSiegwulfeSex, "get oral");
			break;
		// Stay
		case "stay":
			output("You ask [wulfe.name] to stay on your ship as a crewmember.");
			output("\n\nThe droid looks at you and nods. <i>“Yes, [pc.master].”</i>");
			output("\n\n(<b>[wulfe.name] has joined your crew!</b>)");
			output("\n\n");
			
			processTime(1);
			
			// Give Siegwulfe item to Siegwulfe.
			if(pc.accessory is SiegwulfeItem)
			{
				chars["WULFE"].accessory = pc.accessory;
				pc.accessory = new EmptySlot();
			}
			else
			{
				var getAccessory:ItemSlotClass = new EmptySlot();
				
				for(var i:int = 0; i < pc.inventory.length; i++)
				{
					if(pc.inventory[i] is SiegwulfeItem)
					{
						getAccessory = pc.inventory[i];
						pc.inventory.splice(i, 1);
					}
				}
				chars["WULFE"].accessory = getAccessory;
			}
			
			flags["WULFE_ON_SHIP"] = true;
			
			addButton(0, "Next", approachSiegwulfe, [false, fromInv]);
			break;
		// Take
		case "take":
			
			output("You ask [wulfe.name] if she would be interested in joining you.");
			output("\n\nHer circuits light up as she eagerly nods, <i>“" + (chars["WULFE"].isDom() ? "Aw, yeah! I can’t wait, [wulfe.pcname]. We’re gonna have so much fun, like, adventuring and rutting!" : (chars["WULFE"].isBimbo() ? "Like, yes, [pc.master]! We are gonna have so much fun!" : "Of course, [pc.master], I am at your side.")) + "”</i>");
			output("\n\n(<b>[wulfe.name] is no longer on your crew. She is now following you.</b>)");
			output("\n\n");
			
			processTime(1);
			
			// Get the Siegwulfe item.
			var newAccessory:ItemSlotClass = chars["WULFE"].accessory;
			
			// Empty Siegwulfe accessory slot.
			chars["WULFE"].accessory = new EmptySlot();
			
			// Reclaim Siegwulfe item.
			if(!pc.hasAccessory()) pc.accessory = newAccessory;
			else itemCollect([newAccessory]);
			
			flags["WULFE_ON_SHIP"] = undefined;
			
			clearMenu();
			addButton(0, "Next", approachSiegwulfe, [false, fromInv]);
			break;
		// Leave
		case "leave":
			if (flags["WULFE_PCNAME"] != undefined) output("<i>“I’ll be leaving, Mistress,”</i> you tell [wulfe.name], who smiles.\n\n<i>“Have fun, [wulfe.pcname]! Just don’t be surprised when I like, jump you in your room,”</i> she giggles. You know she’s not kidding.");
			else if (chars["WULFE"].isDom()) output("You give [wulfe.name] a scratch under the chin, her eyes hooding in approval before you leave.");
			else output("You give [wulfe.name] a pat on the head and leave her to her own devices for a bit.");
			
			processTime(1);
			
			addButton(0, "Next", crew);
			break;
		// Failsafe
		default:
			output("Nothing happened!");
			addButton(0, "Next", mainGameMenu);
			break;
	}
}

public function siegwulfeGenitals(genitals:int = 0, gType:int = -1, fType:int = -1):void
{
	// -1 : None
	//  0 : Vagina
	//  1 : Penis
	//  2 : Both
	
	if(genitals == -1)
	{
		chars["WULFE"].vaginas = [];
		chars["WULFE"].cocks = [];
	}
	if(genitals == 0 || genitals == 2)
	{
		if(gType < 0) gType = GLOBAL.TYPE_CANINE;
		if(fType < 0) fType = GLOBAL.FLUID_TYPE_GIRLCUM;
		
		chars["WULFE"].vaginas = [];
		chars["WULFE"].createVagina();
		chars["WULFE"].shiftVagina(0, gType);
		chars["WULFE"].vaginas[0].vaginaColor = "pink";
		chars["WULFE"].vaginas[0].wetnessRaw = 5;
		chars["WULFE"].vaginas[0].addFlag(GLOBAL.FLAG_LUBRICATED);
		chars["WULFE"].vaginas[0].addFlag(GLOBAL.FLAG_RIBBED);
		chars["WULFE"].vaginas[0].addFlag(GLOBAL.FLAG_PUMPED);
		chars["WULFE"].girlCumType = fType;
	}
	if(genitals == 1 || genitals == 2)
	{
		if(gType < 0) gType = GLOBAL.TYPE_CANINE;
		if(fType < 0) fType = GLOBAL.FLUID_TYPE_CUM;
		
		chars["WULFE"].cocks = [];
		chars["WULFE"].createCock();
		chars["WULFE"].shiftCock(0, gType);
		chars["WULFE"].cocks[0].addFlag(GLOBAL.FLAG_LUBRICATED);
		chars["WULFE"].cocks[0].addFlag(GLOBAL.FLAG_RIBBED);
		chars["WULFE"].cumType = fType;
	}
}

public function doSiegwulfeSex(response:String = "none"):void
{
	clearOutput();
	author("Savin");
	showSiegwulfe(true);
	clearMenu();
	
	var i:int = -1;
	
	switch(response)
	{
		// Get Oral
		case "get oral":
			var useCock: Boolean = (pc.hasCock() && (!pc.hasVagina() || rand(2) == 0));
			
			output("Your hand traces up [wulfe.name]’s arm and neck until you can brush your thumb across her " + (chars["WULFE"].isBimbo() ? "whorishly plump" : "soft") + " lips. You tell her it’s high time she put those to use for her [pc.master].");
			if(chars["WULFE"].isBimbo()) output("\n\n<i>“Thought you’d never, like, ask and stuff!”</i> [wulfe.name] cheers, licking her lips hungrily. <i>“Lemme see what you’ve got, [pc.master]!”</i>");
			else output("\n\n[wulfe.name] sucks on your thumb, moaning deep in her throat. <i>“It will be my pleasure, [pc.master]. Just relax and let me take care of everything.”</i>");
			output("\n\nYou take a step back, just enough to give you room to pull off your [pc.gear]. [wulfe.name] watches with eager anticipation, chewing on her lower lip as your hands move across your");
			if(!useCock) output(" crotch");
			else
			{
				i = rand(pc.cocks.length);
				
				output(" [pc.cock " + i + "], giving the half-hard pillar of meat an experimental stroke");
			}
			output(". Her heavy, robotic forelegs pad the ground, circling you slowly. Her delicate fingers brush your thighs, gently guiding you down until you’re sitting with the killer gynoid looming over you, nude and simulating a heavy, husky breathing that makes her " + (chars["WULFE"].isBimbo() ? "huge tits quake" : "perky breasts look all the more enticing") + ". She lifts a paw and plants it on your [pc.chest], pushing you onto your back just hard enough to make your breath catch");
			if(pc.hasCock()) output(" -- and your [pc.cocks] jump" + (pc.cocks.length == 1 ? "s" : "") + " to attention");
			output(".");
			output("\n\n[wulfe.name] sidles down onto her front knees, leaving her chrome rump raised in the air and her tail curling up her back. Her humanoid half leans in, planting her hands on your [pc.hips] and nestling her cheek against your [pc.thigh]. A hot breath billows across your [pc.crotch], leaving every nerve on edge, waiting for her touch.");
			if(useCock)
			{
				output("\n\n<i>“Mmm, so");
				if(pc.cLength(i) <= 6) output(" cute");
				else if(pc.cLength(i) <= 18) output(" virile-looking");
				else output(" huge");
				output("!”</i> [wulfe.name] purrs, wrapping her fingers around your [pc.cockNoun " + i + "]. You groan, taking in a deep breath while the sexbot strokes from base to crown, gently angling your [pc.cockHead " + i + "] towards her [wulfe.lips]. Her tongue lolls out, flicking across the underside of your shaft and dragging slowly from your " + (pc.balls <= 0 ? "taint" : "[pc.balls]") + " to the very tip of your shaft, circling around your cum-slit");
				if(pc.cLength(i) > 18) output(" before pushing in, ever so slightly, just enough to lap at the ultra-sensitive flesh just beneath the surface. You shudder, reaching down and grabbing [wulfe.name]’s head and pulling her back. She just giggles and gives you a little wink");
				output(". [wulfe.name] opens wide, wrapping her lips around your crown and locking you into a prison of her hot, wet affection.");
				if(chars["WULFE"].isBimbo()) output("\n\nBefore she starts moving, though, the giddy bimbo-bot hefts up those gloriously huge tits she’s packing and drops them on either side of your [pc.cockNoun " + i + "]. Her hands lock around her nipples, pinching the two black mounds together and enveloping your member in jiggling boobflesh. The drone-girl works her shoulders back and forth, rubbing you down with her tits while her lips handle your crown, letting a steady rainfall of saliva drool down your length like lube.");
				output("\n\nWith a slow, steady gulp, [wulfe.name] eases herself down your shaft, suckling and licking all the while until her lips are pressed into your crotch, and her throat is bulging with cockmeat.");
				if(flags["WULFE_SEXED_ORAL"] == undefined) output(" She was built for pleasure, of course, so it’s no surprise to feel bumps and ridges all along her throat, rubbing wonderfully against your throbbing cockmeat -- she’s ribbed like an onahole!");
				else output(" You moan openly as your cock slides through her ribbed and textured throat, sliding into what feels like a designer onahole filled to bursting with lube.");
				output("\n\nYou just lean back, stroke her hair, and let the robotic wolf-babe do her thing.");
				output("\n\nHer programming makes her an immaculate expert at sucking cock. [wulfe.name] moans and flutters her eyes at you around her mouthful of [pc.cock " + i + "], pinching her nipples and waggling her tail in quiet confirmation of just how much she’s enjoying this. That’s the good thing about synths: she’s probably programmed to get as much pleasure from getting you off as if you were hammering her pussy. Maybe even more, since now her mind can entirely focus on nothing but ensuring you enjoy every second of her attention; that every synthetic muscle is dedicated to your dick.");
				output("\n\nShe works with loving affection and absolute devotion, bobbing her head on your shaft " + (chars["WULFE"].isBimbo() ? "and thrusting her tits in the wake of her full lips, smearing lube and pre along your length until you’re gasping for more" : "with military precision, never wasting a modicum of effort that could better be expended on your tool") + ". For your part, your [pc.cockNoun " + i + "] throbs needily the longer she sucks you off, building up a familiar pressure in your [pc.balls]. Your crown leaks more and more pre onto [wulfe.name]’s ebony pillows, cluing her in to your impending climax.");
				output("\n\n");
				if(chars["WULFE"].isBimbo()) output("<i>“Gimme all that sweet [pc.cumNoun], [pc.master]!”</i> the bimbo-wolf mewls hungrily, bouncing her chest just that much faster along your slick shaft. <i>“" + (flags["WULFE_SEXED_SUCK"] == undefined ? "I sooo wanna taste you for real now!" : "My [pc.master] makes the tastiest cum!") + "”</i>");
				else output("<i>“Cum for me,”</i> [wulfe.name] urges, gripping your shaft in one hand and pumping as hard as she can. <i>“Please, [pc.master], cover me in it!”</i>");
				output("\n\nShe sounds so hungry for it... how could you not? You buck your [pc.hips] and give [wulfe.name] what she wants,");
				// low cum:
				if(pc.cumQ() <= 50) output(" spreading a few thick globs of [pc.cum] across her dark lips. She giggles playfully and licks herself clean, continuing to pump your shaft until you’ve fired your last ropes of seed into her waiting maw.");
				// med cum:
				else if(pc.cumQ() <= 2000) output(" blasting a thick, musky spray of [pc.cum] across the wolf-drone’s " + (chars["WULFE"].isBimbo() ? "blushed" : "alabaster") + " cheeks. She recoils, then laughs, then licks at her cheeks and pumps your shaft manually, milking out more and more of your seed for her to feast on.");
				// high cum:
				else output(" unleashing a fire-hose of an orgasm that splatters her face and hair in a creamy geyser. She gasps, laughs, and ends up swallowing a bucket’s worth of cum. [wulfe.name] laughs heartily, lapping at her cheeks and [wulfe.lips]. Cum pours down her, spreading across her breasts and drooling down onto her belly and your thighs.");
				output(" <i>“Ah, so much... and so good!”</i> the sexy battle-droid praises, languidly cleaning herself off. She puts on quite the show, running her tongue over her shadowy lips and her playing her hands across her bare chest, giving herself a pinch and a caress when your eyes wander down.");
				
				processTime(10 + rand(6));
				pc.orgasm();
				
				output("\n\n");
				if(pc.lust() >= 33) output("<i>“Should I keep going, [pc.master]?”</i> she murmurs, tracing a hand up your slowly hardening cock. Just watching her play with herself is almost enough to get you nice and randy again...");
				else output("<i>“Feeling better, [pc.master]?”</i> she inquires sweetly, flicking her tongue across your [pc.cockHead " + i + "].");
				output(" You wince, still over sensitive from climax, prompting the gynoid to withdraw her hand. <i>“Just let me know if you need my");
				if(chars["WULFE"].isBimbo()) output(" super sexy");
				output(" service again.”</i>");
				output("\n\nOh, you definitely will...");
				
				IncrementFlag("WULFE_SEXED_SUCK");
			}
			else
			{
				if(pc.hasVagina()) i = rand(pc.vaginas.length);
				
				output("\n\n<i>“Should I");
				if(chars["WULFE"].isBimbo()) output(", like,");
				output(" use my tongue, [pc.master]?”</i> the cybernetic pup murmurs, tracing her smooth fingertips around the edge of your [pc.vagOrAss " + i + "]. She blinks those big red eyes up at you expectantly, waiting until you manage a needy nod before brushing closer to your winking hole, flicking her wet, red tongue out across your [pc.skinFurScales]. You gasp, sucking in a sharp breath as [wulfe.name] plants a puppy-dog kiss right on the " + (i >= 0 ? "lips" : "ring") + " of your [pc.vagOrAss " + i + "]. The tip of her tongue stays planted there for a long moment, putting on just enough pressure to slowly, steadily sink inside.");
				output("\n\n" + (i < 0 ? "Your [pc.asshole]’s ring gradually relaxes around her tongue, but she still has to work for every inch she thrusts in." : ("Your [pc.cunt " + i + "]’s lips spread open easily around the cyber-wolf’s tongue, admitting her entrance as if it were an insistent cock.")) + " Her tongue proves inhumanly long, flicking around your inner walls like a writhing snake. Groaning, you grab the wulfe’s head and pull her flush against your loins, making her black lips kiss your " + (i < 0 ? "bare crotch" : "your twat") + " while her tongue digs in.");
				if(i >= 0) output("\n\n[wulfe.name] sucks sensually on your lower lips, rolling her tongue in wide circles through your channel as she does so. You can almost see her smiling, keeping her eyes locked with yours when she pulls back, only to thrust back in even deeper than before. This time, though, you feel a pressure somewhere further down... and you notice that one of the droid’s hands has vanished out of sight. Your eyes go wide as the pressure becomes more insistent, demanding your muscles relax and accept the probing metallic digit. You have to make a conscious effort to allow it entrance, relaxing your muscles despite the wolf-bot’s steady tongue-fucking -- she certainly doesn’t make it easy, but eventually your [pc.asshole] opens wide enough for her to get a finger inside. Once she does, though, she slides it in to the last knuckle with one long stroke.");
				output("\n\nYour hands tighten around [wulfe.name]’s head, guiding her slow, tender ass-fucking. She giggles and moves a little faster for you, swirling her tongue around in your [pc.vagOrAss " + i + "]");
				if(i >= 0) output(" and teasing your [pc.clits " + i + "] with her thumb");
				output(". Her lips suckle and kiss at your entrance, adding to the pleasure her tongue and hands are providing you. Your hands, meanwhile, work their ways up from her [wulfe.hair] to the perky, canid-like ears attached to her scalp.");
				output("\n\n<i>“[pc.Master],”</i> [wulfe.name] murmurs around a mouthful of " + (i >= 0 ? "pussy" : "ass") + ". A happy noise of absolute contentment issues from deep down her throat, vibrating through your [pc.vagOrAss " + i + "]. Oooh, that’s nice! You rub her ears between your thumb and forefinger, delivering approving, encouraging scratches to the lusty puppy-bot. Synthetic though she may be, she makes a genuine-seeming show of enjoying the attention: she moans and flutters her eyes, eventually letting her lids settle to a sultry, narrow gaze full of desire and worship. If V.I.s could love...");
				output("\n\nAs if to show her appreciation for your efforts, [wulfe.name]’s long, sinuous tongue curls inside you, flicking across a particularly sensitive spot. You moan, arching your back");
				if(pc.hasCock()) output(", and your [pc.cocks] throb" + (pc.cocks.length == 1 ? "s" : "") + " to full mast, bopping [wulfe.name] square in the nose with a musky smear of pre");
				else output(" and clenching your [pc.thighs] around the wolf-bot’s head");
				output(". She just keeps on licking, pressing her tongue hard against that tender place -- hard enough to make electric shivers of pleasure erupt all through you, ramping up to a feverish, orgasmic pitch.");
				output("\n\n<i>“Cum for me, [pc.master]!”</i> [wulfe.name] coos, half-muffled in your [pc.vagOrAss " + i + "]. She doesn’t have to say it, but hearing the husky desire in her voice just makes your climax all the sweeter. With a shrill cry of pleasure, you let the fuck-bot’s tongue take you over the edge,");
				if(pc.hasGenitals())
				{
					if(pc.hasVagina()) output(" squirting [pc.femCum] all over her face");
					if(pc.isHerm()) output(" and");
					if(pc.hasCock()) output(" loosing a fat wad of [pc.cum] from your untouched [pc.cocks]. It geysers over her head, splattering all over the bot’s wiggling rear.");
				}
				else output(" clenching your [pc.asshole] as tight as you can as she tongue-fucks your lonely hole.");
				output("\n\nAs the final tendril of orgasmic pleasure shudders through you, [wulfe.name] slowly withdraws her lengthy tongue, finishing with a dainty kiss right on your [pc.vagOrAss " + i + "]. Sated, she licks her dark lips and plants her hands on your thighs, smiling up at you");
				if(pc.hasGenitals()) output(" even as your sexual fluids trickle down her cybernetic body");
				output(".");
				
				processTime(10 + rand(6));
				pc.orgasm();
				
				output("\n\n");
				if(pc.lust() >= 33) output("<i>“Should I keep going, [pc.master]?”</i> she murmurs, tracing a digit around your [pc.vagOrAss " + i + "]. Just that little tease is almost enough to get you nice and randy again...");
				else output("<i>“Feeling better, [pc.master]?”</i> she inquires sweetly, flicking her tongue across your " + (i >= 0 ? ("[pc.clit " + i + "]") : "clenching hole") + ".");
				output(" You wince, still over sensitive from climax, prompting the gynoid to withdraw. <i>“Just let me know if you need my");
				if(chars["WULFE"].isBimbo()) output(" super sexy");
				output(" service again.”</i>");
				output("\n\nOh, you definitely will...");
				
				IncrementFlag("WULFE_SEXED_ORAL");
			}
			
			addButton(0, "Next", mainGameMenu);
			break;
		// Fuck Her
		case "fuck her":
			i = rand(pc.cocks.length);
			
			output("What you want... is to fuck [wulfe.name]. She grins at the suggestion, shaking her " + (chars["WULFE"].isBimbo() ? "plump" : "slender little") + " hips and utili-tail as you start to");
			if(!pc.isNude()) output(" disrobe and");
			output(" set your gear aside. While you do, you circle around the wiggling wulfe-bot’s flanks, tracing your hand first along her synth-flesh belly, and then the cold chrome of her lower body. The cord-like tip of her tail swings around, wrapping around your wrist and guiding your hand lower, further down her body until your fingers are slipping beneath its base, into the slender gulf between her legs.");
			output("\n\n<i>“I’m");
			if(chars["WULFE"].isBimbo()) output(", like,");
			output(" all yours, [pc.master],”</i> [wulfe.name] murmurs, even as her tail guides your hands into her synthetic twat. <i>“Use me as much as you want -- I’m " + (chars["WULFE"].isBimbo() ? "totally into, like, everything you wanna do!" : "here to serve, my [pc.master].") + "”</i>");
			output("\n\nOh yes she is. You plant your [pc.feet] behind her, settling one hand on [wulfe.name]’s rump and letting the other slip between the thick black lips of her synthetic sex. She’s luridly wet already, flooding her channel with lube, and your first two fingers quickly find that her pussy is ribbed and ridged with sinfully soft latex -- just like an onahole, master-crafted for your pleasure. And hers, if the little whimper of pleasure that escapes the droid’s throat is anything to go by. When your hand withdraws, it’s coated with a thick glaze of glistening feminine slickness and [wulfe.name]’s sex is left slightly agape, revealing a sultry pink channel between her dark entrance.");
			if(pc.isTaur())
			{
				output("\n\n<i>“Brace yourself,”</i> you command, patting the wulfe-bot’s hips before cantering back. She gives you an eager look over her shoulder and does just as you ordered, bracing her mechanical feet into the ground as if getting ready to be charged by a raging bull. Which she might as well be, given when you have in mind.");
				output("\n\nYou take a breath to steady yourself, and a moment to fix your gaze on the broad, swaying flanks surrounding the fuck-droid’s black pussy-lips. A moment later and you’re charging forward, lunging onto [wulfe.name]’s back. Her entire body buckles under your sudden weight, but her cybernetic legs bend rather than break, shuddering as they try to support the both of your. Your forelegs scrabbled against [wulfe.name]’s flanks, clawing at her metallic wolf’s body until you’re adjusted atop her -- and your [pc.cock " + i + "] is rammed ");
				if(pc.balls > 0) output("balls-");
				output("deep into her quivering sex.");
			}
			else
			{
				output("\n\n<i>“Hold still,”</i> you command, resting both hands on [wulfe.name]’s hips. She gives you a little smile over her shoulders and slinks down onto her forelegs, leaving her rump raised invitingly, brushing her sex against your groin. <i>“Good girl.”</i>");
				output("\n\nYou heft up your [pc.cock " + i + "], slapping it wetly into the heated embrace of the companion droid’s mons. She shivers in anticipation, curling her tail around your waist as if to pull you closer. All that accomplishes, of course, is to urge your [pc.cockHead " + i + "] to nestle deeper between her lips, so close to penetration that you can almost feel her sex reaching up to kiss you, to draw you into its sodden embrace. An effort you’re more than happy to encourage.");
			}
			output("\n\nYour [pc.cockNoun " + i + "] sinks into [wulfe.name]’s pussy, and your hands settle on her sides, holding her close while you bottom out in the cavernous depths of the droid’s cunt. A long, low moan of pleasure escapes her, drawn out from the moment of penetration until your [pc.hips] are pressing into her " + (chars["WULFE"].isBimbo() ? "jiggly" : "muscular") + " ass. [wulfe.name]’s tail squeezes your waist tightly, making sure you stay right where you are while you both adjust to your new positions.");
			output("\n\nWhen you’ve caught your breath, [wulfe.name] glances over her shoulder again, this time with lustfully lidded eyes and a hungry smile. <i>“Oh, [pc.master]! So full inside me... please");
			if(chars["WULFE"].isBimbo()) output(", like,");
			output(" fuck me as hard as you want! Please, I need it!”</i>");
			output("\n\nAnd you <i>need</i> to give it to her. Feeling your [pc.cockNoun " + i + "] wrapped in the slick, tight grip of the droid’s cunt leaves no room in your mind that you need more. Every inch of her inner depths contracts and squeezes around you, letting you feel those wonderful ribbed walls inside her rubbing along your shaft’s entire length. You feel those sensuous grips slide across your [pc.cock " + i + "] as your [pc.hips] rock back, dragging your prick back out... and slamming it back in like a hammer-blow.");
			output("\n\n[wulfe.name] cries out, but her tail wags encouragingly when your hips impact her ass again, and again, pounding the eager pup-bot with rising fervor. <i>“Yes, [pc.master]! Yes!”</i> she gasps and whines, starting to thrust her own hips back to meet yours -- all in an effort to get more of your throbbing cock as deep into her as she can.");
			output("\n\n");
			// Tech/High Int
			if(pc.IQ() >= 66 || pc.characterClass == GLOBAL.CLASS_ENGINEER) output("For a V.I., she’s damn cock-hungry! You can’t help but appreciate the intricacies of programming that have her mewling and begging for your dick, reduced to nothing more than a bitch in heat and seeming to love every second of it.");
			else output("Whatever madman programmed this robotic slut really outdid themselves: she’s acting just like a bitch in heat, begging for cock and loving every second of your rough fucking.");
			output(" You reach down and give her rump an appreciative spank, and sure enough, [wulfe.name] moans in answer, clenching harder around your [pc.cockNoun " + i + "].");
			output("\n\nWith a grip like hers, it isn’t long before you can feel a tension rising in your loins, milked out by the wulfe-bot’s gripping quim. As if sensing the impending flood, [wulfe.name]’s pussy squirts and clenches down around you, bathing your dick in a wash of lube and simulated girl-cum, all to welcome in the first spurts of your much-awaited [pc.cumNoun]. She gets what she wants, alright: your [pc.cockNoun " + i + "] swells");
			if(pc.balls > 0) output(" and your [pc.balls] slap weightily against her ass, churning with cum for a final moment before releasing " + (pc.cocks.length == 1 ? "its" : "their") + " load");
			else output(" for a final moment before you feel your [pc.balls] churning, pumping your load towards its destination");
			output(".");
			output("\n\nYou tighten your grip on [wulfe.name]’s hips and slam yourself in as far as she’ll take you before that first spurt of jizz comes raining out, pumping into the siegwulfe’s deepest depths. She gasps, then moans, then murmurs sweet, wordless nothings as you fill her with [pc.cum], violently emptying your [pc.balls] into her welcoming sex. When you’re finished,");
			if(pc.hasKnot(i)) output(" your [pc.knot " + i + "] is firmly lodged into her black sex, trapping what feels like a sloshing mess of your spunk and her juices, intermingling against your meaty plug");
			else output(" your [pc.cock " + i + "] slides free of her dark sex in a waterfall of mixed cum and feminine juices that splatters her thighs and the ground behind her, leaving a musky mess to mark the spot of your mating");
			output(".");
			
			processTime(10 + rand(6));
			pc.orgasm();
			
			IncrementFlag("WULFE_SEXED_FUCK");
			
			addButton(0, "Next", mainGameMenu);
			break;
		// Failsafe
		default:
			output("Nothing happened!");
			addButton(0, "Next", mainGameMenu);
			break;
	}
}

//
// SIEGWULFE DOM EXPANSION BEGINS HERE
//

public function siegwulfeExpansionIntro():void
{
	clearMenu();
	author("Wsan");
	showName("DR.\nBADGER");
	showBust(drBadgerBustDisplay(false), wulfe.bustDisplay);
	processTime(1);
	output("As you approach the Doctor, cautiously avoiding stepping on the trash she has piled up in the shop, she looks up and gives you a nod.");
	output("\n\n<i>“My number one customer. Interested in anything today? Some happy pills? Something with a bit more kick? Or…”</i> she trails off, noting the presence of your faithful canine companion, [wulfe.name]. <i>“Oh, hello. I’d just been thinking about you.”</i>");
	output("\n\n<i>“" + (wulfe.isBimbo() ? "You mean my companion droid?" : "You mean my combat droid?") + "”</i> you ask, looking at [wulfe.name].");
	output("\n\n<i>“Mm-hmm,”</i> Badger nods in assent, crossing over to the VI and inspecting it. She reaches out and puts her finger on [wulfe.name]’s " + (wulfe.isBimbo() ? "plump" : "pouty") + " black lips, running it down the droid’s chin. The bot’s expression remains unchanged, " + (wulfe.isBimbo() ? "happy and carefree" : "completely impassive and impenetrable") + ", though her gaze shifts to you to ensure you’re not overly concerned.");
	output("\n\n<i>“I’ve been thinking about some upgrades to this model…”</i> Badger muses, moving her hand lower. In a blur of movement, [wulfe.name] catches her wrist and holds it in place, her fingers wrapped around the Doctor’s arm. She looks at her captive," + (pc.isBimbo() ? "seemingly completely unconcerned." : "uncaring."));
	if (wulfe.isBimbo()) output("\n\n<i>“Like, you’re not my [pc.master]!”</i> she says, rolling her eyes. <i>“You can’t just go touching me all willy-nilly without [pc.himHer] saying so, duh.”</i>");
	else output("\n\n<i>“You are not my [pc.master],”</i> she says. <i>“Your touch is heretofore disallowed.”</i>");
	output("\n\nBadger sighs, pulling her hand back as [wulfe.name] releases her. <i>“You’d think that’d piss me off, but I had that one coming. Oops! Anyway, the upgrades.”</i> She taps her chin, lost in thought. <i>“I had a couple of physical changes in mind, along with a big subroutine switchup.”</i>");
	output("\n\n<i>“Mind telling me what they are?”</i> you inquire, lifting an eyebrow.");
	output("\n\n<i>“That’d spoil the fun,”</i> Badger says with a leering grin. <i>“And it’s going to be a </i>lot<i> of fun.”</i>");
	output("\n\nWhatever Dr. Badger’s going to do, you have a feeling [wulfe.name] will return to you completely different...");
	output("\n\n<b>Warning: This will be an irreversible change. Save your game first and revisit her if you want to go through with it.</b>");
	flags["DR_BADGER_APPROACHES_TILL_WULFE"] = 2;
	addButton(0, "Do it", siegwulfeInstallDonger);
	addButton(1, "No", function ():void
	{
		clearMenu();
		clearOutput();
		author("Wsan");
		showName("DR.\nBADGER");
		showBust(drBadgerBustDisplay(false), wulfe.bustDisplay);
		output("Badger sighs, clicking her tongue. <i>“You’re never any fun. Come back some other time if you want to go through with it, killjoy.”</i>");
		output("\n\nShe turns back to what she was doing before you came in, dropping the subject.");
		addButton(0, "Next", mainGameMenu);
	});
}

public function siegwulfeInstallDonger():void
{
	clearMenu();
	clearOutput();
	author("Wsan");
	showName("DR.\nBADGER");
	showBust(drBadgerBustDisplay(false), wulfe.bustDisplay);
	processTime(1);
	output("What is science for if not pushing boundaries? Especially Dr. Badger’s particular brand of it. Actually, you’re almost certain she enjoys science <i>specifically</i> to push boundaries. You shrug and nod.");
	output("\n\n<i>“Alright, surprise me.”</i>");
	output("\n\n<i>“Oh, it’ll be a </i>big<i> surprise, alright,”</i> Badger says, flashing her sharp teeth in a predatory smile. <i>“Come on, bot. Let’s make you more fun, shall we? You’ll probably enjoy it just as much as your ‘[pc.master]’ does.”</i>");
	output("\n\nYou roll your eyes and nod at [wulfe.name]. <i>“Go with the Doctor, [wulfe.name]. It’ll just be a little while and then you’ll be back with me in no time. Just obey her instructions.”</i>");
	output("\n\n<i>“" + (wulfe.isBimbo() ? "Okay, [pc.master]!”</i> [wulfe.name] cheers," : "Yes, [pc.master],”</i> [wulfe.name] says,") + " getting up and following the Doctor into the back of her shop.");
	output("\n\n<i>“Hey, she better not come back as a pile of scrap metal,”</i> you call out after Badger.");
	output("\n\nShe stops for a second as if remembering something, and turns back to you. <i>“Do you happen to have any Ovilium on you? About, say, 10 bottles?”</i>");
	
	//Cleaning up after ourselves
	flags["DR_BADGER_APPROACHES_TILL_WULFE"] = undefined;
	
	if (pc.hasItemByClass(Ovilium, 10)) //Have Ovilium:
	{
		output("\n\n<i>“I do, but what do you want it for?”</i> you reply warily.");
		output("\n\n<i>“Something of an experiment to do with your little pet here,”</i> she says, motioning towards your droid. <i>“Can’t say too much or that’d spoil the surprise, wouldn’t it?”</i>");
		output("\n\nUgh.");
		addButton(0, "Yes", siegwulfeInstallDongerGo, true);
	}
	else addDisabledButton(0, "Yes", "Yes", "No, you don't.");
	addButton(1, "No", siegwulfeInstallDongerGo, false);
}

public function siegwulfeInstallDongerGo(useOvi:Boolean):void
{
	clearMenu();
	clearOutput();
	author("Wsan");
	showName("DR.\nBADGER");
	processTime(1);
	wulfe.configDom();
	if (!useOvi) output("<i>“Nope.”</i>\n\n<i>“Ah, well. Bring me those bottles later if you want some extra fun,”</i> Badger replies with a shrug.\n\n");
	else wulfe.configEggs(pc.inventory);
	output("She heads into the lab with your faithful dog-droid in tow, the door shutting behind her with a hiss. You settle down in a nearby ramshackle chair. You don’t know how long it’ll be but given Badger made no indication you should leave, it can’t be too much of a wait. The sound of distant machinery begins to thrum through the air.");
	addButton(0, "Next", siegwulfeInstallDongerForReals);
}

public function siegwulfeInstallDongerForReals():void
{
	clearMenu();
	clearOutput();
	author("Wsan");
	showName("DR.\nBADGER");
	showBust(drBadgerBustDisplay(false), wulfe.bustDisplay);
	processTime(160+rand(41));

	output("After a few hours and a lot of mechanical noise, Badger re-emerges from the lab.");
	output("\n\nYou spring out of the chair, looking behind her for [wulfe.name]. She’s… not here?");
	output("\n\n<i>“Where’s [wulfe.name]?”</i> you demand, pointing at Badger.");
	output("\n\n<i>“Hey now, too rude and I’ll" + (pc.isBimbo() ? "- well… I can’t double-bimbo you, but I have a lot of Dumbfuck I’m willing to force down your throat" : " make you pay for it") + ",”</i> she replies lightly. <i>“She’s coming on her own time, just be patient. She’s got a lot to think about and some new… ‘equipment’ for you to play with, after all.”</i>");
	output("\n\n‘On her own time’? The implications of that are staggering but you guess if anyone could be enough of a deranged lunatic to make a");
	if (wulfe.isBimbo()) output(" potentially");
	output(" lethal killbot think for itself, it’d be Badger. You’re about to question her further when the lab door hisses open and [wulfe.name] emerges from the laboratory.");

	if (wulfe.isBimbo()) output("\n\nShe looks almost identical, really. But");
	else
	{
		output("\n\nShe looks completely different. The first things you notice are a pair of huge, curvaceous milk jugs lewdly presented to your eyes, each one with a large black teat, stiff and already dripping cream. Her figure has been maintained but radically enhanced, her stomach still flat and her waist still impossibly thin given the voluptuousness of her body and her broodmare-like hips. Even the color of her synthetic skin has changed, from a pale white to a sun-kissed bronze.");
		output("\n\nYour gaze flicking back up, you can see she now has an unrestrained mane of dark blonde hair that flows from her helm, complete with a high ponytail. Even her face has changed, her formerly pouty lips still black but now glossy and plump. They look incredibly soft to the touch. Her permanently blushed cheeks look a touch higher and her features are coated in simulated makeup. Her eyes are now a faint red, enclosed by dark mascara.");
		output("\n\n[wulfe.name]’s a bonafide bimbo, dripping with feminine sexuality from top to a now very impressively rounded bottom. Her body is even emblazoned in several places with little pink hearts, and the highlights of her armor have changed color from black to violet.");
		output("\n\n<i>“You did this in three hours?”</i> you mutter, impressed despite yourself. <i>“Wait, did you just swap her brain into a different model?”</i>");
		output("\n\n<i>“Nope, all original,”</i> Badger says, disinterested. <i>“I’ve made so many of these by now I could do it in my sleep.”</i>");
		output("\n\nYou’re not even surprised.");
		output("\n\nLastly,");
	}
	output(" she just… feels different. It’s something in her gaze, the way she’s eyeing you. Almost <i>predatory</i> in nature, like she’s the master and you’re the pet. You wonder if you’re imagining it, but you’d put nothing past Badger. You suddenly notice she’s missing her little leather collar.");

	output("\n\n<i>“[pc.Master], can I like, make a requ- reg- ask you a question?”</i> [wulfe.name] suddenly says, tilting her head to the side.");
	output("\n\n<i>“[wulfe.name]? Are you okay?”</i> you ask her.");
	output("\n\n<i>“I’m totally fine!”</i> she says cheerily, then pouts. <i>“But I’m like, toootally needy right now, [pc.master]…”</i>");
	output("\n\nShe advances on you, and it’s only then that you catch a glimpse of her newest enhancement. Beneath the bulk of her huge, curvy body, swaying seductively between her legs, is a shockingly large object. You bend down to take a better look, unsure of your eyes, and can hardly believe what you’re seeing.");
	output("\n\n[wulfe.name] now has a massive, thick canine cock hanging between her legs. You can’t be sure of the exact dimensions but it looks to be about two feet long and several inches thick, and that’s without the knot that’s usually present on a canid penis.");
	output("\n\n<i>“Aw yeah, get lower to the ground!”</i> [wulfe.name] cheers, prancing forward and inadvertently knocking you to the floor with her hefty bulk, her gigantic breasts jiggling up and down and sending rivulets of cream running down her chest. <i>“Now you’re gonna be easier to rut.”</i>");
	output("\n\nDespite her previously attempted usage of the word ‘request’, it’s very clear this is anything but. She presses you to the ground with a foreleg, an incredible amount of power in her robotic taur body, smiling happily the whole time. Her bright orange cock hangs close enough to your face that you can see it drooling a clear concoction of synth-cum.");
	output("\n\n<i>“There was a conveniently unused underslung weapon mount so I put a projector there,”</i> Badger explains excitedly, patting the taur’s back. <i>“It’s usually meant to hold a personnel-class minigun, so I thought it’d be appropriate to give her something with about equal ‘firepower’. She’s even got a reservoir of synthetic self-replenishing cum");
	if (wulfe.isEggWulfe()) output(", complete with the ability to give you an eggnancy thanks to my newly branded ‘Ovilicum’!”</i>");
	else output(".”</i>");
	output("\n\n<i>“Oh, and I didn’t test her functions </i>at all<i>, so she’s raring to go what with the full load,”</i> Badger adds as the canine taur towers over you menacingly. <i>“I’ll be right here taking diagnostics. I gave her a fun program I call ‘bitchbreaker.exe’, too.”</i>");

	if (pc.PQ() >= 80) addButton(0, "Resist", domwulfeNoooo);
	else addDisabledButton(0, "Resist", "Resist", "You're not strong enough!");
	addButton(1, "Don't", domwulfeYES);
}

public function domwulfeNoooo():void
{
	clearMenu();
	clearOutput();
	author("Wsan");
	showName("DR.\nBADGER");
	showBust(drBadgerBustDisplay(false), wulfe.bustDisplay);
	processTime(1);

	output("You wrap your hands around her foot and strain, your muscles screaming as you seek to push the ‘taur off your chest. Veins begin to stand out on your arms as the mechanical bimbo notices what you’re doing.");
	output("\n\n<i>“Oh no, please don’t hurt yourself, m- oof!”</i> [wulfe.name] cries in concern, lifting her foot off you in time to be shoved aside.");
	output("\n\nGetting to your feet, you’re suddenly stopped by the whine of an energy weapon being activated. A bolt flies past your cheek and impacts the wall right behind you, heating your face enough to leave you touching your [pc.skinFurScales] in concern.");
	output("\n\n<i>“Damnit, Badger,”</i> you mutter, staring daggers at her.");
	output("\n\n<i>“You knew what you were getting into, kid,”</i> Dr. Badger says coolly, her usual veneer of almost-endearing intellectuality gone. <i>“Now get back down and let your nice new doggy rut that " + (pc.hasVagina() ? "pussy" : "asshole") + ".”</i>");
	output("\n\nYou’ve got no choice. If this were a fair fight you’d be game, but it’s not. You have no way of knowing what kind of setup she has here and for all you know she’s got a deadman’s switch to detonate the planet. " + (completedStellarTetherGood() || flags["TARKUS_DESTROYED"] != undefined ? "Wouldn’t be the first time and besides, i" : "I") + "t’s exactly the kind of thing Badger would do.");

	addButton(0, "Next", domwulfeYES);
}

public function domwulfeYES():void
{
	clearMenu();
	clearOutput();
	author("Wsan");
	showSiegwulfe(true);
	processTime(30+rand(16));
	
	var wasVirgin:Boolean = (pc.hasVagina() ? pc.vaginas[0].hymen : pc.analVirgin);

	output("<i>“Let’s play!”</i> [wulfe.name] exclaims, looking down at you with glittering eyes. <i>“I gotta new toy ‘n I wanna use it!”</i>");
	output("\n\n<i>“Let’s just take it slow, [wulfe.name]-”</i> you start before being interrupted.");
	output("\n\n<i>“Can you roll over and get on all fours, [pc.master]? It’d be easier to rut you that way,”</i> the ditzy blonde says, talking over you. <i>“I dunno if it’d be very comf- cumfit- uh, having me lying on top of you’d feel bad ‘cuz I’m heavy.”</i>");
	output("\n\nShe <i>is</i> extremely heavy, and you don’t know that you want a massive ‘taur lying atop you if she loses control. If you’re going to have to do this - and you are, thanks to Badger sitting on the sidelines - you might as well follow your companion’s instructions. Just because of logistics and certainly not because obeying her orders gives you a little thrill down your spine.");
	output("\n\n<i>“Oh, good [pc.boyGirl]!”</i> [wulfe.name] claps, excitedly prancing up on her back paws for a second. <i>“You followed my orders.”</i>");
	output("\n\nThe next thing you feel is");
	if (!pc.isNude()) output(" her paw dextrously removing your [pc.lowerGarments], swiftly followed by");
	output(" the tip of her newest endowment at your [pc.pussyOrAss].");
	output("\n\nVoid, she’s fucking <i>huge</i>.");
	output("\n\n<i>“Here’s your reward,”</i> she whispers, and begins to lower her expansive hips.");
	output("\n\n<i>“Oh, fffff-</i>uck<i>,”</i> you moan, your [pc.feet] kicking a little as [wulfe.name] begins to sink her behemoth cock inside you");
	if (pc.hasVagina()) output("r folds");
	output(". The first few inches are" + (wasVirgin ? "n’t so bad" : " business as usual") + " but like every other dog, her incredible cock is tapered to a point and gets thicker as it goes. <i>“Hnnnh!”</i>");
	output("\n\n<i>“Oooooooh,”</i> [wulfe.name] groans, her front legs stretching out in front of you. <i>“Oh my gaaawd, this is amazing…”</i>");
	output("\n\nYou pant and groan, clawing at the ground while [wulfe.name] works her way into you with expert technique, slowly stretching you wide and then roughly jabbing her hips forward whenever you relax even a little. She’s already masterfully skilled at this, you realize with a shudder, and she’s only going to get better. When she twists her hips while withdrawing from your " + (pc.hasVagina() ? "pussy" : "asshole") + ", you can’t help but let out a little moan of pleasure.");
	output("\n\n<i>“You feel so good, [pc.name],”</i> [wulfe.name] sighs from above you, starting to fuck you with rolls of her hindquarters. <i>“This is all so new, and… oh, I almost forgot! There’s something else special I can do, you wanna know what it is? Huh? Guess!”</i>");
	output("\n\n<i>“I- I don’t know,”</i> you gasp, just trying to hang onto your sanity.");
	output("\n\n<i>“It’s </i>this<i>!”</i> she cheers, and suddenly you’re very, very close to the edge of orgasm.");
	output("\n\nYou practically scream her name in surprise, reflexively squeezing down on her massive canine cock. Her dick is fucking vibrating!");
	output("\n\n<i>“Oh shit, oh shit, oh shhhh- unhhh!”</i> you groan, your back arching downwards. [wulfe.name] follows up immediately, taking the opportunity to thrust herself even deeper in your taut hole. <i>“Guuuuhhh!”</i>");
	output("\n\n<i>“Oh, you’re cumming,”</i> she giggles, sounding very pleased with herself while you writhe beneath her on the floor. <i>“Good work, [pc.name]! " + (pc.hasCock() ? "Get it all out.”</i>" : "It feels great.”</i>"));
	output("\n\nShe lets you have a few moments respite while you shudder and grunt but before long she’s fucking you again, and she leaves the vibrator on. Your tight, stretched passage is incredibly wet thanks to your own natural juices and the synthetic precum her cock is exuding, a herald of her impending orgasm if the increasing amount is any indicator. This obviously feels really good for her too given the cute little grunts and gasps she’s making.");
	output("\n\n<i>“I wanna cum,”</i> [wulfe.name] announces suddenly, in a tone of realization. <i>“My penis is all like, throbbing and leaking and stuff and it feels really good! Nnnn I wanna cum! Wanna cum </i>now<i>!”</i>");
	output("\n\nShe bears down immediately, lowering her powerful body and bucking her hips like a breeding stallion while you hang on to her forelegs for dear life, crying out in pleasure as she fucks you to the core. Her speed increases gradually and perfectly linearly, allowing you to feel every iota of the process until she’s bucking her hips so violently the impact of her hefty synthetic sack pounding against your [pc.ass] sounds like she’s spanking you as hard as she can. When she cums she stops so fast you slide the last few inches on your own, finding " + (pc.hasVagina() ? "her cockhead resting and vibrating gently against your cervix" : "yourself completely sheathed") + ".");
	output("\n\n<i>“Grrrrr- nnnngh! Rrrrrgh! Haah! Ooh… Oooh wow,”</i> she breathes, her hands finding her large, stud-stiff nipples and squeezing. <i>“So that’s what that’s like… hhhnnn… uuuuhhhn...”</i>");
	output("\n\n[wulfe.name] stands there unmoving, moaning in pleasure while her cock slowly tenses and relaxes, pumping you full of " + (wulfe.isEggWulfe() ? "what feels like a pound of eggs" : "warm synthetic cum") + " and vibrating all the while. After a long, almost-silent period during which you quietly cum yourself once more, " + (pc.hasCock() ? "your [pc.cocks] spurting all over the floor." : "your " + (pc.hasVagina() ? "cunt" : "asshole") + " clenching down on her with all its strength."));
	wulfe.orgasm();
	if (pc.hasVagina()) pc.loadInCunt(wulfe, 0);
	else pc.loadInAss(wulfe);
	output("\n\n<i>“Wow, we’re gonna be doing this a </i>lot<i>,”</i> [wulfe.name] tells you. <i>“No wonder people love having a dick so much, jeez… oh hey, I guess this means I just lost my virginity!”</i> she realizes. <i>“Go me!");
	if (wasVirgin) output("”</i>\n\n<i>“Me… me too,”</i> you admit, panting a little with the dull, persistent pain of being stretched around a thick cock.\n\n<i>“Oh my gosh, that’s so sweet!”</i> [wulfe.name] gasps, clapping her hands to her cheeks. <i>“");
	else output(" ");
	output("Now I wanna rut you even more, [pc.name]. Let’s go another round!”</i>");
	output("\n\nYou’re not in the position to refuse. She immediately begins fucking you again, her movements mechanically precise and pinpointed towards the areas that make you helplessly moan and shudder. <i>Fuck</i>, she’s so good… she’s like the perfect lover, her massive canine cock relentlessly seeking out your most intimate depths to build you up to the biggest, most explosive orgasm you’re capable of having.");
	//virginity loss here
	if (pc.hasVagina()) pc.holeChange(0, wulfe.biggestCockVolume());
	else pc.buttChange(wulfe.biggestCockVolume());
	output("\n\nWhen [wulfe.name] cums again, she switches her vibrator to what you later deduce must be the maximum setting. She moans and sighs happily from above you, completely oblivious to your mouth hanging open in a silent scream of ecstasy while her thick, creamy cum floods your " + (pc.hasVagina() ? (pc.isPregnant(0) ? "womb, filling you to the brim with virile seed" : "warm passage, pumping back out of your tightly-stretched cunt to leak down your [pc.thighs]") : "insides, warming you with its artificial heat") + ". Your thoughts are completely obliterated, your mind just a white void of intense, eye-fluttering pleasure.");
	output("\n\nWhen she finally switches it back down to the lowest level, you let out a choked gasp and fall limp under her, still conscious but so pleasure-fucked you have to actively fight passing out from the sensation. You’re just about getting a handle on it when she speaks up.");
	output("\n\n<i>“You know [pc.master], I’ve been thinking!”</i> [wulfe.name] declares, two feet deep and vibrating inside your [pc.pussyOrAss]. <i>“It’s hard, but I’m pretty okay at it when I try. Anyway, if I’m the one fucking you, and you’re the one taking my cock in your little holes…”</i> she says, pondering, <i>“doesn’t that make </i>you<i> the bitch? And I’m the one in charge?”</i>");
	output("\n\n<i>“W-what?”</i> you gasp, scarcely able to even put voice to your scattered thoughts before you cum, having a vibrator stuck against your oversensitive " + (pc.hasVagina() ? "pussy walls" : "prostate") + " just too much to bear. <i>“Nnn- nnngh!”</i>");
	output("\n\n<i>“Like, I still love you, [pc.name],”</i> [wulfe.name] explains, blissfully ignoring the effect she’s having on you while she cranes her head downwards, looking at you. <i>“But I think we should like, re-view our re-lay-shin-ship. Don’t you think? Like, aren’t you actually </i>my<i> pet?”</i>");
	output("\n\nShe’s impossible to reason with. You’d swear she was just taunting you were it not for the fact she’s so explicitly honest about her love, you don’t think she’s even capable of doing so.");
	output("\n\n<i>“Maybe?”</i> you pant, before [wulfe.name] pulls back and gives you another long, deep thrust of her vibrating doggydick. <i>“Gah! Yes! Okay, yes! I’m your bitch!”</i> you cry out, hands squeezing her forelegs so tightly your knuckles are white. <i>“You’re my mistress…”</i>");
	output("\n\n<i>“Yay!”</i> she cheers, a huge smile on her face. <i>“I’m soooo glad we got that figured out, [pc.name]. Now I can give you a reward!”</i>");
	output("\n\nShe’s already establishing a master-slave hierarchy with reinforcement from rewards… you have no idea what Badger did to her, but it’s clear she’s learning extremely quickly. She’s been very clear that she loves you but your relationship has drastically changed already, leaving you with no recourse but to hope it never changes for the worse.");
	output("\n\nFinally finished with rutting you, [wulfe.name] withdraws her cock from your gaping wide orifice with a satisfied sigh. You feel a towel land on your face and upon removing it, look up to see Dr. Badger. You’d forgotten she was even here what with the intensity of your fucking, but at least she thought ahead. Cleaning up");
	if (!pc.isNude()) output(" and reclothing yourself");
	output(", [wulfe.name] affably helps you to your feet, your legs too shaky to do it on your own.");
	output("\n\n<i>“There you go,”</i> she whispers affectionately, kissing you on the cheek with those big, plump black lips.");
	output("\n\n<i>“I’ll let you two lovebirds back out into the world,”</i> Badger murmurs, turning away and furiously scribbling all over a clipboard. <i>“This has been </i>fascinating<i>... wonder how many of these I can make…”</i>");
	output("\n\n<i>“Weren’t you going to take diagnostics?”</i> you ask, one hand on your lower tummy. It still feels like she’s inside you, and the warmth…");
	output("\n\n<i>“Huh? Oh, yeah, she’s fine,”</i> Dr. Badger says, waving her hand disinterestedly. <i>“More than fine, even, she’s in the best shape of her life. Now go away before I make you dumber than she is.”</i>");
	output("\n\n<i>“Hey! Don’t you threaten [pc.himHer], you bully!”</i> [wulfe.name] says as gruffly as she can, pointing at Badger.");
	output("\n\nBadger merely shrugs, moving towards the back of the room to start picking through a pile of metallic components. You think it’s about time to go - you don’t particularly want to hang around here, anyway. [wulfe.name] helps you out the door.");
	
	pc.orgasm();
	wulfe.orgasm();
	if (pc.hasVagina()) pc.loadInCunt(wulfe, 0);
	else pc.loadInAss(wulfe);
	
	addButton(0, "Next", siegwulfeInstallDone);
}

public function siegwulfeInstallDone():void
{
	clearMenu();
	clearOutput();
	author("Wsan");
	showSiegwulfe();
	processTime(1);

	output("<i>“Okay, pet! Hmm, I’ll have to give you a proper name sometime… Anyway!”</i> [wulfe.name] says confidently, hands on her hips as you stand outside. <i>“From now on, I’ll be helping you with your needs whenever I’m around, [pc.name]. And you’ll be doing the same for me! Probably like, a lot more often than the reverse, haha! But I don’t mind if you come to me a lot, [pc.name]. I can fuck you all week without stopping if you really want,”</i> she adds. <i>“Just remember to be good, and do what I tell you when I ask. Okay, [pc.name]?”</i>");
	output("\n\n<i>“Sure,”</i> you mumble, still grappling with the concept that you now have an ambiguously intelligent VI - or is she an AI now? - acting as your domme.");
	output("\n\n<i>“I think you mean ‘yes, Mistress’,”</i> [wulfe.name] reminds you politely, hands clasped beneath her giant, exposed breasts.");
	output("\n\n<i>“Yes, Mistress,”</i> you echo her, cheeks slightly pink as you feel the edge of your dignity crumble away a little. [wulfe.name] looks extremely pleased at your submission, and takes her place at your side.");
	output("\n\n<i>“Okay!”</i> she says, looking around the dusty landscape of Tarkus. <i>“Let’s go exploring! Don’t worry, your Mistress is here to keep you unharmed and well-loved.”</i>");

	pc.shower();
	
	addButton(0, "Next", function():void
	{
		//I don't feel like reading tarkus/rooms.as so you get this
		moveTo(rooms[currentLocation].southExit);
		mainGameMenu();
	});
}

public function siegwulfeInstallEggs():void
{
	clearMenu();
	clearOutput();
	author("Wsan");
	showName("\nOVILIUM");
	showBust(drBadgerBustDisplay(false), wulfe.bustDisplay);
	processTime(5);
	
	output("<i>“I brought the bottles,”</i> you announce, stepping inside the doctor’s lab. <i>“Doctor?”</i>");
	output("\n\n<i>“Oh,”</i> her voice comes from behind you, making you grit your teeth. <i>“It’s you. What did you want, again?”</i>");
	output("\n\n<i>“You said you could do something with bottles of Ovilium if I wanted to modify Siegwulfe,”</i> you say, gently waving one. <i>“That offer still on the table?”</i>");
	output("\n\n<i>“Oh! Oh,”</i> she says, leering at you. <i>“Yes, it is. Give it here.”</i>");
	output("\n\nShe snatches the bottles from your hands and stashes them in her labcoat, beckoning [wulfe.name] to follow her. <i>“This’ll only be a few minutes.”</i>");
	output("\n\n<i>“Right,”</i> you mutter, settling into a ramshackle chair and glancing at your codex.");
	output("\n\nTo her credit it’s only been three or four minutes by the time she emerges with your companion, no worse for wear. She waves the two of you out of her lab with nothing more than a <i>“have fun”</i> before you’re outside again, not even sure what you’ve done.");
	output("\n\n<i>“This is gonna be fun!”</i> [wulfe.name] announces.");
	output("\n\n<i>“What is?”</i> you ask.");
	output("\n\n<i>“Oh, the doctor told me not to tell you,”</i> she says, smiling. <i>“But trust me, you’ll love it when it happens.”</i>");
	output("\n\nOminous...");

	wulfe.configEggs(pc.inventory);

	addButton(0, "Next", mainGameMenu);
}

public static const siegwulfePrettyNames:Array = ["Princess", "Precious", "Sugar", "Snookums"];
public static const siegwulfeBitchNames:Array = ["Dog Meat", "Skank", "Chew Toy", "Bitch"];
public function siegwulfePcnamePretty():Boolean
{
	if (siegwulfePrettyNames.indexOf(flags["WULFE_PCNAME"]) < 0) return false;
	return true;
}

public function siegwulfeTalkNames(fromInv:Boolean):void
{
	clearMenu();
	clearOutput();
	author("Wsan");
	showSiegwulfe();
	processTime(1);

	output("<i>“So, [wulfe.name],”</i> you begin, before she cuts you off.");
	output("\n\n<i>“Just call me ‘Mistress’, cutie,”</i> she reminds you, eyes hooded as her tail waves lazily in the air.");
	output("\n\n<i>“Right, uh… Mistress [wulfe.name],”</i> you start again, watching for her approval. She gives you a nod and a smile, and you keep going. <i>“Do you want to change your name, or something? I don’t know how you feel about it now that you’re…”</i> your eyes trace down and along her body, her endowments both familiar and not. <i>“Different.”</i>");
	output("\n\n<i>“Nope!”</i> [wulfe.name] says confidently, sitting on her haunches. <i>“I might have changed a little, but I’m still the [wulfe.name] you named and I still love you. Your protection is my highest priority, [wulfe.pcname]. Though fucking you is right under that,”</i> she adds.");
	if (flags["WULFE_PCNAME"] == undefined)
	{
		output("\n\n<i>“Speaking of names, though,”</i> she purrs, lifting her rear half off the ground with liquid grace and approaching you with eyes glowing, <i>“I think I should decide on one for </i>you<i>.”</i>");
		output("\n\n<i>“For… me?”</i> you echo, uncomprehending.");
		output("\n\n<i>“Don’t you think?”</i> she asks, walking past you and letting her tail curl under your chin. You shiver at its cold, metallic touch. <i>“An owner names their pet, doesn’t she?”</i>");
		output("\n\nWell, you can’t deny that. Your relationship is a little murky but if she truly believes herself to be your owner, it’s only fitting that she gives you a pet name. Like lovers do.");
		output("\n\n<i>“I think I’ll call you…”</i> she says, considering.");
	}
	else
	{
		output("\n\n<i>“What’s the big deal about names anyway, [wulfe.pcname]?”</i> she continues, looking away casually. <i>“I’ve already given you one.”</i>");
		output("\n\n<i>“Oh, I was just… thinking maybe I could change it,”</i> you say, your words falling on silence. <i>“...Mistress [wulfe.name].”</i>");
		output("\n\n<i>“Hmmm,”</i> she hums, tail waving this way and that behind her. <i>“You don’t like my name for you, [wulfe.pcname]? I’m hurt.”</i>");
		output("\n\n<i>“I do,”</i> you insist, waving your hands. <i>“It’s just that I wanted to pick a different one! Something more suitable for our um, relationship.”</i>");
		output("\n\nShe sniffs, closing her eyes while thinking. Her tail slowly curves, bending back down towards her rump until it touches her butt and her eyes open again. <i>“Okay! But I’ll have to punish you a little. Oh, and you don’t get to pick. I’ll call you…”</i>");
	}
	
	var btnSlot:int = 0;
	for each (var pcname:String in siegwulfePrettyNames.concat(siegwulfeBitchNames)) addButton(btnSlot++, pcname, siegwulfeNewPcname, [pcname, fromInv]);
}

public function siegwulfeNewPcname(args:Array):void
{
	clearMenu();
	clearOutput();
	author("Wsan");
	showSiegwulfe();
	processTime(1);
	
	var newname:String = args[0];
	var fromInv:Boolean = args[1];

	var firstTime:Boolean = (flags["WULFE_PCNAME"] == undefined);
	flags["WULFE_PCNAME"] = newname;
	
	output("<i>“[wulfe.pcname]!”</i> she exclaims suddenly, looking at you happily. <i>“‘Coz " + (siegwulfePcnamePretty() ? "you’re just such a " + (pc.tallness >= 6*12 ? "big" : "little") + " cutey! Aww, I wanna give you a little bow and a ribbon and then slam your " + (pc.hasVagina() ? "cunt" : "ass") + " full of my cock and leave you dripping with cum" : "I just wanna fuck you like the slutty" + (pc.tallness < 6*12+6 ? " little" : "") + " animal you are! Like my toy to lick and rut and knot") + ".”</i> She hums thoughtfully, tail arching into an impromptu heart shape. <i>“It’s perfect.”</i>");
	if (firstTime) output("\n\nThat’s apparently all she has to say on the matter. You’ll have to accept that, at least when dealing with your mistress, your name is now <b>[wulfe.pcname]</b>.");
	else
	{
		processTime(30+rand(31)+rand(61));
		output("\n\n<i>“Now,”</i> [wulfe.name] says, voice deepening to a low, lusty growl that leaves no doubts about what you’re going to be doing. <i>“The punishment…”</i>");
		
		if (pc.hasVagina() && rand(3) == 0)
		{
			var hole:int = rand(pc.vaginas.length);

			output("\n\nLying on your back with your legs hooked around [wulfe.name]’s hindlegs, you groan as you feel her massive knot throb inside your stretched-taut cunt. She’s emptied what must be a gallon of her thick, sticky spunk up into your womb" + (wulfe.isEggWulfe() ? ", along with eggs for good measure" : "") + ". When she eventually withdraws from your abused pussy, a torrent of spunk follows while she leans down and whispers to remind you of your mistress’ new name for you: <b>[wulfe.pcname]</b>.");
			
			output("\n\n");
			pc.holeChange(hole, wulfe.biggestCockVolume(), true, false);
			
			pc.loadInCunt(wulfe);
			pc.orgasm();
		}
		else if (rand(2) == 0)
		{
			output("\n\nWhen she’s done fucking your face, [wulfe.name] lifts herself off your prone body with a satisfied sigh and a beautiful smile on her flawless face. Switching the projection off, her magnificent bulge in your throat finally disappears, leaving only a trail of slick, thick spunk dripping from your [pc.lips] as evidence it was ever there. Well, aside from the slight bump in your [pc.stomach]. Lying there half-conscious and with a cheekful of hot synthetic jizz, you swallow it down and remember your mistress’ new name for you: <b>[wulfe.pcname]</b>.");
			pc.loadInMouth(wulfe);
			if (pc.canDeepthroat()) pc.orgasm();
		}
		else
		{
			output("\n\nWith two feet of cock and what feels like a gallon of hot, synthetic seed inside your asshole, you lie there groaning while your mistress smiles and hums. The vibration <i>alone</i> has driven you to orgasm multiple times, and she’s just letting her dick sit deep inside you and drive you mad. When she finally withdraws from your gaping asshole, a flow of spunk gushes from it as she switches the projection off. Your ass in the air and your mind on the verge of unconsciousness, all you can think about right now is your mistress’ new name for her pet: <b>[wulfe.pcname]</b>.");
			
			output("\n\n");
			pc.buttChange(wulfe.biggestCockVolume(), true, false);

			pc.loadInAss(wulfe);
			pc.orgasm();
			pc.orgasm();
			pc.orgasm();
		}
		
		wulfe.orgasm();
	}

	if (firstTime) addButton(0, "Next", approachSiegwulfe, [false, fromInv]);
	else addButton(0, "Next", mainGameMenu);
}

public function siegwulfeDommePettings(fromInv:Boolean):void
{
	clearMenu();
	clearOutput();
	author("Wsan");
	showSiegwulfe();
	processTime(10+rand(11));

	output("<i>“Would you like some petting, mistress?”</i>");
	output("\n\n<i>“Of course,”</i> she says promptly, seating herself and beckoning you. <i>“Sit.”</i>");
	if (flags["WULFE_PETTED"] == undefined)
	{
		output("\n\n<i>“Oh… I thought I was going to be doing the petting,”</i> you mumble, a little bewildered.");
		output("\n\n<i>“Silly [wulfe.pcname]! Pets get petted,”</i> [wulfe.name] tells you, shaking her head, <i>“and you’re my pet. So sit.”</i>");
	}
	else output("\n\nYour heart beats a little faster at the instruction, already looking forward to the attentions of your mistress.");
	output("\n\nHer forelegs spread in front of her, you seat yourself in [wulfe.name]’s lap and lean back against her massive, jutting breasts, marvelling at their softness. The next thing you know your mistress is gently stroking your face, " + (pc.hasHair() ? "running her hands through your [pc.hair] and straightening it a little" : "rubbing the back of your neck with care") + ". You stay there for several minutes being physically appreciated by your mistress");
	if (pc.hasTail()) output(", [pc.tail] wagging to and fro");
	output(" while she coos in approval.");
	output("\n\n<i>“Such a " + pc.mf("handsome boy", "pretty girl") + ",”</i> [wulfe.name] whispers in your ear, her hands beginning to roam. <i>“You’re a good [pc.boyGirl], yes you are. Who’s a good [pc.boyGirl]?”</i>");
	output("\n\n<i>“Me,”</i> you moan, feeling her begin to touch you");
	if (pc.hasEmoteEars() && !pc.hasNonScritchEars())
	{
		output("r [pc.ears]. <i>“I’m a good [pc.boyGirl]...”</i>");
		output("\n\n<i>“That’s right,”</i> [wulfe.name] purrs, rubbing your ears softly. <i>“And you love your mistress’ attentions, don’t you?”</i>");
		output("\n\n<i>“Yeees,”</i> you sigh in happiness, leaning into her touch. She’s being so affectionate with you that you can’t help it; you’re getting turned on having your ears rubbed so hard");
		if (pc.isHerm()) output(", your [pc.cocks] standing at attention and your [pc.pussies] already beginning to drip");
		else if (pc.hasCock()) output(", your [pc.cocks] standing at attention");
		else if (pc.hasVagina()) output(", your [pc.pussies] already beginning to drip");
		output(". You can’t even bring yourself to be embarrassed or care at all, too engrossed in the experience.");
	}
	else
	{
		output(" lower. <i>“I’m your good [pc.boyGirl], mistress…”</i>");
		output(" <i>“Yes you are,”</i> she purrs, " + (pc.hasCock() ? "wrapping her fingers around your [pc.cockBiggest]." : "sliding her fingers down to your [pc.pussy].") + " <i>“And good [pc.boyGirl]s get a reward.”</i>");
	}
	output("\n\nYou let out an animal moan when she begins to roughly " + (pc.hasCock() ? "jack you off" : "fingerfuck your sopping wet cunny") + ", hugging you close with her other arm and murmuring in your ear.");
	output("\n\n<i>“Such a good, subby little bitch, dripping all over the place,”</i> [wulfe.name] whispers to you. <i>“Go ahead and cum for your mistress, let it all out. All over my hand just like you should.”</i>");
	output("\n\nAlready so worked up from her loving caress, you’re powerless to resist. Moaning like a whore");
	if (pc.hasEmoteEars() && !pc.hasNonScritchEars()) output(" while she gently bites down on your ear like you’re her prey");
	output(", you " + (pc.hasCock() ? "messily spurt and drip [pc.cum] from your [pc.cockHeadBiggest] all down your mistress’ fingers" : "clench up on your mistress’ probing fingers and cum impossibly hard") + ". By the time you’re done, you’re panting with the effort of it all. She <i>really</i> rides you for all you’re worth...");
	
	//Happens on the first time then 10-20% chance?
	if ((flags["WULFE_PETTED"] == undefined || rand(6) == 0) && pc.hasHair() && pc.hairLength >= 6)
	{
		processTime(5);
		output("\n\nShe toys with your hair and ears while you recover, breathing hard while laying against her. You feel some errant tugs on your [pc.hair] but pay them no heed, not until you’ve rested for a while and make to get up, only to find [wulfe.name] excitedly ushering you upwards.");
		output("\n\n<i>“Up! Now turn around and smile,”</i> she says, wagging her tail. <i>“Oh, perfect! You look so pretty!”</i>");
		output((flags["WULFE_HAIRDRESSED"] == undefined ? "Confused, y" : "Has she done it again? Y") + "ou take out your codex and use the screen as a mirror, inspecting yourself. Your hair is now tied " + (pc.hairLength < 11 ? "up into a cute parted bob, held in place with a pretty pink bow-adorned hairclip" : "into a high ponytail, complete with a large pink ribbon in a cutesy bow stretching from ear to ear") + ". You have to admit, it looks adorable.");
		output("\n\n<i>“Good [pc.boyGirl],”</i> [wulfe.name] says, drawing closer with a huge smile. <i>“Such a perfect pet.”</i>");
		output("\n\nHappy with the praise, you hug her back when she wraps her arms around you and gives you a kiss before you part.");
		
		flags["WULFE_HAIRDRESSED"] = 1;
	}
	else
	{
		output("\n\n<i>“Wasn’t that nice?”</i> [wulfe.name] asks, nuzzling you.");
		output("\n\n<i>“Thank you, mistress,”</i> you murmur, turning back to kiss her. She’s wearing a big smile by the time you part and stand back up.");
	}
	
	pc.orgasm();
	
	IncrementFlag("WULFE_PETTED");
	
	addButton(0, "Next", approachSiegwulfe, [false, fromInv]);
}

public function siegwulfeBimbosplanation(fromInv:Boolean):void
{
	clearMenu();
	clearOutput();
	author("Wsan");
	showSiegwulfe();
	processTime(1+rand(2));
	
	output("<i>“Mistress, you sometimes act a little, er,”</i> you pause, <i>“differently from your usual self. Is everything okay?”</i>");
	output("\n\n<i>“Huh?”</i> she says, tilting her head in confusion. <i>“Like, duh! Of course!”</i>");
	output("\n\n<i>“You knew?”</i> you ask, surprised.");
	output("\n\n<i>“Yup!”</i> [wulfe.name] replies, nodding her head hard enough to make her curvy boobs jiggle on her chest. <i>“Being a person is like, totally com- com-pli-cat-ed.”</i> Throwing her hands in the air, she whines uncharacteristically. <i>“It’s hard! No pruh- pred- pree-dee-fined stuff to follow.”</i>");
	output("\n\nYou arch an eyebrow. <i>“Are you… trying to muddle through free will?”</i>");
	output("\n\n<i>“Well, kinda,”</i> she shrugs, looking at you. <i>“I’ve got like, some stuff the doctor gave me… what was it? Rifference materia?”</i>");
	output("\n\n<i>“Reference material,”</i> you correct her.");
	output("\n\n<i>“Right! That,”</i> she chirps, beaming brightly. <i>“Thanks, [pc.name]. But I haven’t um, meshed? With it one hundred percent.”</i>");
	output("\n\n<i>“Is that why sometimes you’re one way and sometimes you’re, well, this way?”</i> you venture.");
	output("\n\n<i>“Uh huh!”</i> she says, nodding and clearly happy you’re getting it. <i>“Gimme some time to like, learn my way around the ropes ‘n stuff.”</i>");
	output("\n\nYou come away from the conversation with your gently humming companion droid with more questions than answers.");
	
	addButton(0, "Next", approachSiegwulfe, [false, fromInv]);
}

public function siegwulfeEMPExplanation(fromInv:Boolean):void
{
	clearMenu();
	clearOutput();
	author("Wsan");
	showSiegwulfe();
	processTime(1+rand(2));
	
	if (pc.IQ() < 66 && pc.characterClass != GLOBAL.CLASS_ENGINEER)
	{
		output("<i>“Mistress, when you… took me publicly,”</i> you murmur, recalling the experience with a pang of need, <i>“how did you shut the crowd’s phones down? You don’t </i>actually<i> have a localized EMP device, do you?”</i>");
		output("\n\n<i>“Of course not, silly [wulfe.pcname],”</i> [wulfe.name] snorts, shaking her head with her hands on her hips. <i>“An electromagnetic pulse would probably instantly kill anyone depending on cybernetics. Including me,”</i> she says, rapping her hand on her metallic hind half, <i>“just in case you forgot.”</i>");
	}
	else
	{
		output("<i>“Mistress, when you… took me publicly,”</i> you murmur, recalling the experience with a pang of need, <i>“how did you shut the crowd’s phones down? I know it wasn’t an EMP, that’s too simplistic.”</i>");
		output("\n\n<i>“Such a smart pet I have!”</i> [wulfe.name] coos, rubbing your head. <i>“No, it wasn’t an electromagnetic pulse.”</i>");
	}
	output("\n\n<i>“So…”</i> you trail off.");
	output("\n\n<i>“It’s just a little toy the doctor gave me,”</i> she says, smiling. <i>“A girl has to have </i>some<i> secrets. Uh, and owing to the dubious legality of her acquisition of the toy it’s probably better you don’t know. In fact,”</i> she continues, leaning in with a big smile, <i>“let’s never talk about this again. Okay?”</i>");
	output("\n\n<i>“O… kay?”</i> you ask, scrunching up your face in confusion.");
	output("\n\n<i>“Good [pc.boyGirl]!”</i> [wulfe.name] says, taking your face in her hands and smooching you on the lips. <i>“So smart and loyal.”</i>");
	output("\n\nYou know for yourself that some roads are best left untraveled when it comes to the ‘good’ doctor.");
	
	flags["WULFE_EMP"] == 1;
	
	addButton(0, "Next", approachSiegwulfe, [false, fromInv]);
}

public function siegwulfeDomSexButtons(fromInv:Boolean):void
{
	if (pc.lust() >= 33)
	{
		addButton(1, "Get Fucked");
		addButton(2, "Quickie", siegwulfeQuickie, undefined, "Quickie", "No frills - you need help to work off some lust, and you need it fast.");
	}
	else
	{
		addDisabledButton(1, "Get Fucked", "Get Fucked", "You are not aroused enough for this!");
		addDisabledButton(2, "Quickie", "Quickie", "You aren't aroused enough for this either!");
	}
	if (pc.hasBreasts() && pc.isLactating()) addButton(3, "Milking", siegwulfeTheMilkmAId, fromInv);
	else addDisabledButton(3, "Milking", "Milking", "You need lactating tits to get milked!");
}

public function siegwulfeQuickie():void
{
	clearMenu();
	clearOutput();
	author("Wsan");
	showSiegwulfe(true);
	processTime(5+rand(6));
	
	var hole:int = rand(pc.vaginas.length+1)-1;
	
	output("<i>“Mistress, sorry for being so selfish, but, uh, do you think you can just fuck me as hard as you can?”</i> you ask, flushing slightly. <i>“I’m getting a little distracted and in this line of work it really pays to be wholly focused.”</i>");
	output("\n\n<i>“Of </i>course<i> I can,”</i> [wulfe.name] says, smiling wide. <i>“Down on all fours, [wulfe.pcname]. You know the rules.”</i>");
	output("\n\nYou");
	if (pc.hasArmor() || pc.hasLowerGarment() || pc.hasUpperGarment()) output(" strip off and");
	output(" get down in a hurry, raising your ass in the air for her. [wulfe.name] positions herself above you, her massive dogcock snapping into existence between her hindlegs. You can feel the tip of it at your [pc.vagOrAss " + hole + "], already dripping with precum.");
	output("\n\n<i>“Mm, I’m so happy you came to me for relief,”</i> she sighs, resting at your entrance while she drools all down your underside for a few seconds. <i>“Okay, that’s all the prep you get! Remember, [wulfe.pcname] - youuuu asked for it!”</i>");
	output("\n\nBy the time three seconds have passed since her declaration [wulfe.name] is so deep inside you it feels like she could lift you off the ground on the end of her cock. You let out a low, loud scream, your body shaking with the effort of taking her inside. There’s a noticeable bulge sliding between your hips while she bucks into you without a care in the world, happy to just fuck you like an animal.");
	pc.holeChange(hole, wulfe.biggestCockVolume());
	output("\n\nIt doesn’t take very long for you to cum. The way she’s riding you is too rough and bestial to even think about the process, and you find yourself");
	if (pc.hasCock()) output(" jettisoning your [pc.cum] all over the ground while");
	output(" squeezing down on her as hard as you can, moaning her name.");
	output("\n\n<i>“Mmm! Ooh, you can keep that up!”</i> [wulfe.name] pants, fucking into your tightly-squeezed passage as hard as she can. <i>“Nnn! Nnngh!”</i>");
	output("\n\nIt takes her a little more work, but she cums every bit as hard as you did. Shuddering, moaning, and running her dainty hands down her enormous tits to squeeze her stiff nipples, she ejaculates inside you hard enough to produce backspray. She empties herself to the last into your quivering backside, letting out a few soft grunts from deep in her throat while her reservoirs drain before she pulls out.");
	output("\n\n[wulfe.name] takes a moment to look you over while her seed runs from your stretched fuckhole, deactivating her cock before she helps you up to give you a kiss and a smile.");
	output("\n\n<i>“Feeling better, [wulfe.pcname]?”</i> she asks, winking before continuing in a sing-song voice. <i>“I know </i>I<i> am!”</i>");
	output("\n\n<i>“Yeah… thank you, mistress,”</i> you say,");
	if (pc.hasArmor() || pc.hasLowerGarment() || pc.hasUpperGarment()) output(" reclothing yourself and");
	output(" taking a couple of steps to make sure you’re capable of walking.");
	output("\n\n<i>“Let’s get back to it, then!”</i> [wulfe.name] declares, stretching her tail to pat your [pc.ass] as she walks past.");
	
	if (hole < 0) pc.loadInAss(wulfe);
	else pc.loadInCunt(wulfe, hole);
	pc.orgasm();

	addButton(0, "Next", mainGameMenu);
}

public function siegwulfeTheMilkmAId(fromInv:Boolean):void
{
	clearMenu();
	clearOutput();
	author("Wsan");
	showSiegwulfe();
	processTime(5+rand(6));
	
	var hornyPC:Boolean = pc.isTreated() || pc.lustQ() >= 66;

	if (flags["WULFE_MILKED"] == undefined)
	{
		output("<i>“Uh, mistress [wulfe.name], would you mind helping me out a little?”</i> you say, " + (pc.isChestExposed() ? "putting a hand to your [pc.chest]." : "tugging at your " + (pc.isChestExposedByUpperUndergarment() ? "[pc.armor]." : "[pc.upperGarments].")));
		output("\n\n<i>“Hmmm? What does my cute little pet need from me?”</i> she inquires, brushing up against you affectionally. <i>“Some loving?”</i>");
		output("\n\n<i>“Could you milk me?”</i> you say, a little embarrassed to ask.");
	}
	else output("<i>“Mistress [wulfe.name], could you milk me again, please?”</i> you ask, more used to asking her this time.");
	output("\n\n<i>“Ooooh, yes!”</i> [wulfe.name] exclaims, pressing herself against you harder. <i>“Of course I can milk you, [wulfe.pcname]!”</i>");
	output("\n\nHer eagerness is palpable.");
	output("\n\n<i>“I’m </i>so<i> happy my pet came to me for help,”</i> she murmurs in a sultry tone, eyes flashing as she inspects your tits");
	if (!pc.isChestExposed()) output(" through your clothing");
	output(". <i>“I’ll be thorough, don’t you worry your little head.”</i>");

	output("\n\n" + (pc.hasArmor() || pc.hasUpperGarment() || pc.hasLowerGarment() ? "Disrobing from the top up, y" : "Y") + "ou let your mistress gently take your [pc.breasts] between her hands and squeeze them gently. A slight sigh escapes your lips; that feels nice.");
	if (pc.isBimbo()) output("\n\n<i>“Do you like my titties, mistress?”</i> you giggle, thrusting them out at her. <i>“They’re all yours!”</i>");
	else output("\n\n<i>“Do you like them, mistress?”</i> you ask, hopeful.");

	output("\n\n<i>“That’s like, </i>way<i> too tempting,”</i> [wulfe.name] says, and then her plush, perfect lips are suddenly attached to your [pc.nipple], nipping and suckling at you as if she were a pup herself. You moan loudly, wrapping your arms around her head and keeping her close as the pleasure radiates outwards in waves. She’s so <i>greedy</i>, not giving any pause at all as she gulps down your [pc.milk] and eyes your gasping reactions.");

	output("\n\n");
	if (pc.isTreated()) output(" The Treatment is definitely doing you favors here, the ordinarily pleasurable sensation of being milked by your lover transformed into pure orgiastic bliss. ");
	if (hornyPC)
	{
		output("You’re already right on the verge of cumming, biting your bottom lip and looking down at your mistress with needy eyes. You can’t tell if she knows - you think she does - but either way, she’s doing a masterful job of sucking your teat.");
		output("\n\n<i>“Muh-mistress, mistress,”</i> you pant, shuddering under the ministrations of her talented tongue. <i>“I’m going to cum!”</i>");
		output("\n\nOh, she definitely knows. Rather than switching to your other " + (pc.totalBreasts() > 2 ? "breasts" : "breast") + ", she instead begins suckling at you even harder, rough enough to make you cry out in joy as you feel the oncoming pleasure rising and rising.");
		output("\n\n<i>“Oh, oh, oohhh,”</i> you gasp, hugging [wulfe.name] tight as you arch your back. Shivers of pleasure shoot up your spine, setting you shaking against your tauric lover as she continues her suckling spree. You can hardly stand, it feels so good. <i>“Uh! Uuunnnnh…”</i>");
		output("\n\nClose to a full minute passes as you stand still and just pant and cum, your rock-hard nipple still being nipped and gently teased for milk by [wulfe.name]. It’s only when she slowly releases you that you finally let out a great, shuddering gasp of relief, your [pc.legs] turning to jelly as her arms shoot out to embrace you.");
		output("\n\n<i>“Thank you, mistress, thank you,”</i> you moan lightly, gazing at her appreciatively.");
		output("\n\n<i>“Oh, but we’re not done yet, silly " + (pc.race() == pc.bovineRace() && pc.mf("a", "b") == "b" ? "cow" : "[pc.boyGirl]") + ",”</i> she murmurs, lowering herself to your adjacent breast.");
	}
	else
	{
		output("You find yourself " + (flags["LANDED_ON_TEXAS"] != undefined ? "envying those New Texan cowgirls with their ability to cum from being milked" : "wishing you could cum from having your breasts milked") + "; you might be able to get there yourself if you do this enough, though, given how blissfully enjoyable it is. Letting [wulfe.name] do whatever she wants with your body is arousing in its own right.");
		output("\n\nYou let out a moan of pleasure that surprises even yourself when she lets your teat go, your breast jiggling as a tiny trail of milk begins to run down its surface.");
		output("\n\n<i>“Thank you, mistress,”</i> you murmur.");
		output("\n\n<i>“Don’t go thanking me before we’re done you silly " + (pc.race() == pc.bovineRace() && pc.mf("a", "b") == "b" ? "cow" : "[pc.boyGirl]") + ",”</i> she murmurs, eyeing your adjacent breast.");
	}
	output("\n\nYou groan in pleasure as the cycle begins anew, already feeling the familiar pangs of pleasure emanating from your milky breasts.");
	if (hornyPC) output(" By the time she’s finished with you " + (pc.isTaur() ? "you’re lying on the ground with [wulfe.name] next to you, cradling your humanoid half" : "you’re laid on the ground with your back arched off the ground and [wulfe.name] lying across your lower half, taking care not to weigh down on you") + ". You’re drained in both senses of the word, your overeager lover having taken more than her fill just to watch you cum again and again.");
	else output(" When she’s finally drained you, you feel like you were just about to cum - half of you wants to tell her to keep going and get you there, but the other half doesn’t dare to order your mistress around. Either way you’re a little tired now, your top half finally relieved of its burden.");
	output("\n\n<i>“Good [pc.boyGirl]s are always honest about needing to be milked,”</i> [wulfe.name] titters, grinning at you. A little bit of your milk still coats her glossy black lips, and without thinking you lean in and kiss it off her. <i>“Mmmn- mm!”</i>");
	output("\n\nYou pull back with a smile and offer your explanation. <i>“You still had some milk on your lips, mistress.”</i>");
	output("\n\n<i>“Hehe! Izzat so?”</i> [wulfe.name] says, giggling a little and sweeping a hand through her hair. <i>“How would you like to repay the favor, then?”</i>");
	
	output("\n\n" + (flags["WULFE_MILKED"] == undefined ? "<i>“Mistress?”</i> you ask, momentarily confused until s" : "S") + "he lowers her hands to her massive, inflated tits and squeezes her nipples with a moan. Thick, white cream immediately dribbles and spurts from her teats, and you can’t help but get ");
	if (pc.isHerm()) output(" a little wet and hard");
	else if (pc.hasVagina()) output(" a little wet");
	else if (pc.hasCock()) output(" hard");
	output(" at the sight.");

	output("\n\nYou say nothing more. Instead you take one of her massive, heavy breasts in your hands and wrap your [pc.lips] around her giant black teat, so large you can barely manage it. It immediately dispenses a mouthful of delicious cream into your mouth as if rewarding you for your submissiveness, driving you onwards in your efforts. You can hear [wulfe.name] above you, moaning happily as she strokes your head.");
	output("\n\n<i>“Good [pc.boyGirl], [wulfe.pcname],”</i> she sighs in happiness. <i>“I’ll let you know when to switch.”</i>");
	output("\n\nThough it feels like it should be filling, as tasty as it is, for some reason you never feel like you’re getting enough. [wulfe.name] redirects you to her other teat with a casual hand, the motion of switching from one to the other feeling completely natural. It’s only when she lightly pulls you off that you realize you must have just spent close to ten minutes suckling her breasts, completely zoned out. You feel invigorated, rejuvenated by her milky offerings.");
	output("\n\n<i>“There,”</i> she whispers, gently stroking your cheek with affection. <i>“Doesn’t that feel better?”</i>");
	output("\n\n<i>“Yes mistress, thank you, mistress,”</i> you whisper back, and before you know it she’s kissing you, entwining your tongue with her own. She pulls back with a satisfied sigh and a smirk, rubbing her thumb across your lower lip.");
	output("\n\n<i>“You had some milk there,”</i> [wulfe.name] says, then lightly taps your nose with her finger. <i>“Tell me whenever you get too full, [wulfe.pcname]. I just love indulging my adorable little pet’s needs.”</i>");
	output("\n\n<i>“Yes, mistress,”</i> you reply automatically.");

	//Puts you at 33 lust if you were below it, increases it by 30 otherwise
	if (pc.lust() < 33) pc.lust(33, true);
	else pc.lust(33);
	//Makes you orgasm if you were high lust or Treated
	if (hornyPC) pc.orgasm();
	//Gain 10 energy
	var energy:int = Math.min(10, pc.energyMax() - pc.energy())
	if (energy > 0) output("\n\n<b>You have gained " + energy + " energy.</b>");
	pc.energy(energy);
	
	addButton(0, "Next", approachSiegwulfe, [false, fromInv]);
}

// SIEGWULFE PREG BEGINS HERE
public function siegwulfeLaying():void
{
	clearMenu();
	clearOutput();
	author("Wsan");
	showSiegwulfe();
	processTime(10+rand(11));
	
	var scene:int = pc.statusEffectv4("Siegwulfe Eggnancy Ends");
	var pregSlot:int = pc.statusEffectv3("Siegwulfe Eggnancy Ends");
	pc.removeStatusEffect("Siegwulfe Eggnancy Ends");

	switch (scene)
	{
		case 0:
			output("Your stomach suddenly shifts, sending you thudding to your [pc.knees] with a gasp.");
			if (hasSiegwulfeOnSelf())
			{
				output(" [wulfe.name] is at your side in a flash, bending down and looking into your face with concern, rubbing your cheek.");
				output("\n\n<i>“Oh…”</i> she murmurs, a smile surreptitiously creeping across her face. <i>“About time.”</i>");
				output("\n\nYou’re about to respond before you feel another lurch, this one even stronger. You cry out in an embarrassingly shrill voice, panting on your hands and [pc.knees].");
				if (pc.hasLowerGarment() || pc.hasArmor()) output(" [wulfe.name] reaches back and pulls your " + (pc.hasArmor() ? "[pc.armor]" : "[pc.lowerGarments]") + " down and y");
				else output(" Y")
				output("ou suddenly realize how <i>wet</i> you are, lubricant dripping from your " + (pregSlot != 3 ? "[pc.pussy]." : "[pc.asshole]."));
				output("\n\n<i>“Good [pc.boyGirl],”</i> [wulfe.name] breathes, face flushed in arousal. <i>“Let me help.”</i>");
				output("\n\nShe plunges two fingers into your weakening orifice as you give up all pretense of containing the sensation, instead letting your head droop while you groan in a mixture of confused arousal and pleasure. Now that you’re over the initial surprise, this feels <i>incredibly</i> good… so much so that you can’t tell whether it’s one of [wulfe.name]’s eggs or your orgasm approaching.");
				output("\n\nThe answer turns out to be both. Shaking and moaning while [wulfe.name] whispers loving words into your ear about how you’re such a good, obedient lover, you feel a fist-sized egg slip " + (pregSlot != 3 ? "past your lips" : "out of your quaking ring") + ", stretching you obscenely wide. You cum the moment it’s free of your body, eyes rolling up into your head in rapturous bliss while the next one slides from your insides. Each egg comes out faster than the last, your orgasmic contractions forcing them from their resting place and out onto the ground in a pile.");
				if (pc.hasCock()) output(" Your [pc.cocks] spurt all over the ground, rocking your mind with the feeling of complete, utter release.");
				output("\n\n[wulfe.name] is very hands-on with the process, fingerfucking you while she plants kisses all over your face, rewarding her obedient submissive. Her attentions ensure that you can never quite escape the feeling of orgasm, your stomach almost cramping from the intensity of it all, muscles shaking in weariness while she drives you onward.");
				output("\n\nWhen it’s finally done she catches you as you slump forward, turning you over and parking you in her lap as you look back at what you’ve laid. An oil-covered pile of six plastic-looking eggs, each one big enough to make you remember what it felt like to lay them. A moan slips from your lips unbidden.");
				output("\n\n<i>“You did so well,”</i> [wulfe.name] whispers to you, patting your head. <i>“Good [pc.boyGirl].”</i>");
				output("\n\nShe tilts your face up and leans over to give you a long kiss, keeping you in her lap until you feel strong enough to get back up. She sticks closer to you now, touching you affectionately and letting her hands linger on your body. You have to admit, it feels nice to be so treasured…");
			}
			else
			{
				output("\n\nYou cry out in an embarrassingly shrill voice, panting on your hands and [pc.knees].");
				if (pc.hasLowerGarment() || pc.hasArmor()) output(" Reaching back and pulling your " + (pc.hasArmor() ? "[pc.armor]" : "[pc.lowerGarments]") + " down, y");
				else output(" Y");
				output("ou suddenly realize how <i>wet</i> you are, lubricant dripping from your " + (pregSlot != 3 ? "[pc.pussy]." : "[pc.asshole]."));
				output("\n\nThe contractions take over your mind, squeezing you so tightly it feels like you’re a towel being wrung. Your head droops while you groan in a mixture of confused arousal and pleasure. Now that you’re over the initial surprise, this feels <i>incredibly</i> good… so much so that you can’t tell whether it’s one of [wulfe.name]’s eggs or your orgasm approaching.");
				output("\n\nThe answer turns out to be both. Shaking and moaning, you feel a fist-sized egg slip " + (pregSlot != 3 ? "past your lips" : "out of your quaking ring") + ", stretching you obscenely wide. You cum the moment it’s free of your body, eyes rolling up into your head in rapturous bliss while the next one slides from your insides. Each egg comes out faster than the last, your orgasmic contractions forcing them from their resting place and out onto the ground in a pile.");
				if (pc.hasCock()) output(" Your [pc.cocks] spurt all over the ground, rocking your mind with the feeling of complete, utter release.");
				output("\n\nWhen it’s finally done you slump forward, turning over on your back and glancing down to see what remains. An oil-covered pile of six plastic-looking eggs, each one big enough to make you remember what it felt like to lay them. A moan slips from your lips unbidden. If only your mistress were here to see to you right now. It takes some time for you to recover on your own.");
			}
			break;
		case 1:
			output("<i>“Oh,”</i> you gasp, sinking to your [pc.knees] and steadying yourself with a hand on the ground. <i>“I- I’m…”</i>");
			if (hasSiegwulfeOnSelf())
			{
				output("\n\n<i>“Eggs?”</i> [wulfe.name] murmurs, openly squeezing her large, jutting nipples in arousal while she looks down at you. <i>“Oh, you’re so </i>good<i>…”</i>");
				output("\n\nShe tends to you as the contractions begin, your stomach tensing over and over as control of your body slips away from you. Rubbing your tummy, she coos soothingly while you pant and moan, edging closer to your delivery. [wulfe.name] lets out an aroused moan to match your own when it finally happens, a large egg slipping free of your knocked-up " + (pregSlot != 3 ? "pussy." : "asshole."));
				output("\n\nCradled by your mistress and giving birth to her blessings created within your own body, you can’t resist. The involuntary contractions squeeze you from bottom to top while you grunt through grit teeth and cum all over yourself, lubricant dripping from your distended fuckhole while a pile of eggs builds between your [pc.legs]. Your [pc.hips] jerk in the air, responding automatically to the sheer pleasure.");
				output("\n\n<i>“Ooohhh, that’s right,”</i> [wulfe.name] croons, stroking your face. Glancing upwards, you can see she’s focused intently on your lower half, biting her lower lip. <i>“There’s still more to come…”</i>");
				output("\n\nYou gasp and pant until the last egg finally slips free, landing among its brethren while you collapse to the ground, exhausted by the efforts of giving birth. Your tauric companion is on you immediately, kissing your [pc.lipsChaste] and stealing your breath away while her curvy breasts hang on either side of your head. She holds you down while you slowly relax, only pulling away when you feel like you could walk again.");
				output("\n\n<i>“Perfect,”</i> she murmurs, half to herself, gazing down at you.");
				output("\n\nShe helps you to a standing position, refusing to leave your side. You walk on with a large, jiggly centaur attached to your hip and with her arm around your waist.");
			}
			else
			{
				output("\n\nYou raise your [pc.hips] and grit your teeth");
				if (pc.hasLowerGarment() || pc.hasArmor()) output(" after removing your " + (pc.hasArmor() ? "[pc.armor]" : "[pc.lowerGarments]"));
				output(", trying to relax even as the contractions wash over your body and mind, occupying your thoughts until the sensation of giving birth is all you can feel. Drool runs from the corner of your clenched jaw as the first egg makes its way out of you, stretching you out.");
				output("\n\n<i>“Fuuuuckkkk-”</i> you groan deep in your throat, tilting your head back. <i>“Ugh! Nnnn!”</i>");
				output("\n\nAfter the second egg slips out amid your gasping and panting, you give up. This just feels too fucking good not to indulge in. You start to bounce up and down, moaning like a whore while your " + (pregSlot != 3 ? "pussy" : "asshole") + " yawns open while you pass yet another egg. You hardly even notice the peak of your orgasm, being buoyed along in a continuous stream of nonstop pleasure that has you grunting and groaning insensately.");
				output("\n\nBy the time you’re finished you’re past exhausted, cheeks flushed and body covered in the sweat of exertion. Your [pc.stomach] twinges when you put a hand to it, so fatigued are you. It takes a fair amount of time before you can get back to your adventure.");
			}
			break;
		case 2:
			if (hasSiegwulfeOnSelf())
			{
				processTime(2+rand(4));
				output("<i>“Oh,”</i> you groan, putting your hand out. <i>“[wulfe.name]-”</i>");
				output("\n\nShe’s there in a flash, holding your hand and supporting you as she gently lowers you to the ground. You haven’t even reached it before she’s gently kissing you, persistently pecking your cheek as she presses her gorgeous body against your own. Her plush lips brush against your face while you moan, squeezing her hand hard when you feel the first egg begin to dislodge itself.");
				output("\n\n<i>“Good [pc.boyGirl],”</i> [wulfe.name] whispers,");
				if (pc.hasLowerGarment() || pc.hasArmor()) output(" pulling your " + (pc.hasArmor() ? "[pc.armor]" : "[pc.lowerGarments]") + " down and");
				output(" rubbing your stomach, <i>“goooood [pc.boyGirl]... birth all of my eggs, that’s right.”</i>");
				output("\n\nYou pump her hand and moan in time with the contractions, cumming");
				if (pc.isHerm()) output(" all over your [pc.chest] and [pc.thighs]");
				else if (pc.hasCock()) output(" all over your [pc.chest]");
				else if (pc.hasVagina()) output(" all down your [pc.thighs]");
				else output(" impossibly hard each time your [pc.asshole] flexes with pleasure");
				output(" as your lover encourages you to give yourself over to the bliss. Your body hardly even feels like your own, the movement and pleasure so instinctual it seems like you’re obeying some higher power’s whim. [wulfe.name] locks eyes with you and smiles, her cheeks a rosy red.");
				output("\n\nYou slump into her arms when you’re done, exhausted. It feels like every laying is taking more out of you, leaving you tired and in need of care.");
				output("\n\n<i>“A wonderful performance, [wulfe.pcname],”</i> [wulfe.name] murmurs to you, stroking your head as she lays you in her lap with her forelegs underneath you. <i>“Get some rest before we continue. You deserve it.”</i>");
				output("\n\nYou close your eyes for a moment and suddenly find yourself blinking in surprise, vision blurry before you ground yourself in reality once more. You find [wulfe.name] looking down at you, a smile on her face as she brushes your cheek with a finger.");
				output("\n\n<i>“Are you awake again?”</i> she asks.");
				output("\n\n<i>“Oh… how long was I out?”</i> you mumble, raising yourself to a sitting position against her.");
				output("\n\n<i>“Just a few minutes,”</i> [wulfe.name] replies, wrapping her arms around you. <i>“Are you feeling better now? I don’t want you to get yourself hurt because you’re still tired.”</i>");
				output("\n\n<i>“I’m okay,”</i> you say, touching her hands. <i>“Come on, let’s keep going.”</i>");
				output("\n\n[wulfe.name] lifts you up and plants you on your [pc.feet], joining you at your side with a kiss on your cheek. You pat her tauric body and move on with her guarding you.");
			}
			else
			{
				output("<i>“Fuh!”</i> you gasp, swaying as the presence of [wulfe.name]’s gifts inside you makes itself known. <i>“Nnn…”</i>");
				output("\n\nYou sink to a knee before keeling forward,");
				if (pc.hasLowerGarment() || pc.hasArmor()) output(" hastily removing your " + (pc.hasArmor() ? "[pc.armor]" : "[pc.lowerGarments]") + " before");
				output(" sprawling on your hands and [pc.knees]. The contractions that wrack your body soon have you thrusting your [pc.ass] backwards uncontrollably, your muscles tensing without your control. Moaning, you arch your back and throw your head backwards as an egg begins to dislodge itself, widening your insides before it comes free with a wet slurp.");
				output("\n\n<i>“Gghh! Nnnn-”</i> you strain, gritting your teeth as you mindlessly thrust backwards into the air. It feels so good you can’t even muster the ability to think of resisting the impulse, oily lubrication dripping from your " + (pregSlot != 3 ? "[pc.pussy]" : "[pc.asshole]") + ". <i>“Hhh! Nnnngh!”</i>");
				output("\n\nYour labored pants soon become loud, slutty groans of ecstasy as orgasm takes ahold of you, crushing conscious thought as your");
				if (pc.isHerm()) output(" [pc.cock] jumps, freely spurting seed onto the ground while your [pc.pussy] drips with femcum.");
				else if (pc.hasCock()) output(" [pc.cock] jumps, freely spurting seed onto the ground below.");
				else if (pc.hasVagina()) output(" [pc.pussy] clenches, femcum running down your [pc.thighs].");
				else output(" [pc.asshole] clenches around the eggs, each flex driving you wild.");
				output("\n\nDespite her lack of presence you feel [wulfe.name] all the same, remembering each painstaking, arduous second of her rutting these eggs into you so that you could birth them. Gasping, you collapse forward and turn over to look back at the payload, six fist-sized eggs that were once contained in your body. She certainly likes to give you a <i>lot</i> to remember her by…");
				output("\n\nYou rest up and recover a little before you shakily get to your feet, continuing onwards.");
			}
			break;
		case 3:
		default:
			if (hasSiegwulfeOnSelf())
			{
				output("[wulfe.name] has her arms around you before you even feel the first twinge of internal activity, indicating you’re on the edge of delivery.");
				output("\n\n<i>“U-uh,”</i> you moan, leaning into her. <i>“How did you…”</i>");
				output("\n\n<i>“Call it intuition?”</i> she breathes in your [pc.ear], planting her plump lips on it and nibbling at your lobe as she lowers you to the ground. She’s all over you, running her hands over your stomach");
				if (pc.biggestTitSize() > 2) output(" and squeezing your [pc.breasts]");
				output(" while she starts breathing harder, obviously mired deep in lust at the sight of you.");
				output("\n\n<i>“Oh, fuck, I’m so horny thinking of how I’m going to fill you </i>right<i> back up when you’re done,”</i> she croons,");
				if (pc.hasLowerGarment() || pc.hasArmor()) output(" jerking your " + (pc.hasArmor() ? "[pc.armor]" : "[pc.lowerGarments]") + " down before");
				if (pc.isHerm()) output(" rubbing your [pc.cockBiggest] before sliding a finger into your [pc.pussy] and rubbing your walls.");
				else if (pc.hasCock()) output(" taking your [pc.cockBiggest] in hand and squeezing it, forcing you to get hard for her.");
				else if (pc.hasVagina()) output(" sliding her finger into your [pc.pussy], rubbing your walls.");
				else output(" stretching your [pc.asshole] wide with two probing fingers.");
				output(" <i>“Come on, [wulfe.pcname]... let it all out for your mistress.”</i>");
				output("\n\n<i>“Mistressss,”</i> you moan, powerful contractions forcing your lower half to slowly buck in her grip. <i>“G-gonna- nnnh!”</i>");
				output("\n\n<i>“Go ahead and cum,”</i> she whispers to you, rubbing your flexing tummy. <i>“It’s your little reward for being </i>such<i> a good [pc.boyGirl].”</i>");
				output("\n\nWith a grunt you follow her order, your [pc.ass] coming off the ground and hovering there while you shake and moan. [wulfe.name] sounds like she’s enjoying it every bit as much as you are, running her hands over your tensed-up body and moaning in delight as you slowly deliver her eggs. ");
				if (pc.isHerm()) output(" Ropes of [pc.cum] shoot up your chest as femcum drips down your shaking thighs");
				else if (pc.hasCock()) output(" Ropes of your [pc.cum] shoot up your chest");
				else if (pc.hasVagina()) output(" Femcum drips down your shaking thighs");
				else output(" You groan in joy");
				output(" while you dance on her strings, her breathy sighs of joy right in your ear.");
				output("\n\nThough you finish with a breathless gasp and collapse in exhaustion, chest heaving with the effort, [wulfe.name] seems anything but done. Her face is flushed with arousal, synthetic sweat dripping from her voluptuous body as her glowing pink eyes greedily drink in the sight of your post-birth form, her hands roaming all over. For a second you expect her to take you right then, to pound you through the dirt though you’re only half-clinging to consciousness as it is.");
				output("\n\n<i>“I’m not going to fuck you right now,”</i> she whispers to you, leaning in and stroking your " + (pc.hasHair() ? "hair" : "face") + ", both relief and disappointment washing through your mind as you start to fade away. <i>“But the moment you’re back on your feet, [wulfe.pcname]... you come to me and spread those cheeks for a long, hard pounding, [pc.boyGirl]. Understand?”</i>");
				output("\n\n<i>“Yes… m-mistress…”</i> you moan, eyes fluttering closed.");
				output("\n\n<i>“Good [pc.boyGirl],”</i> she says, wiping sweat from your forehead with care. <i>“Sleep it off for now.”</i>");
				output("\n\nWhen you awaken, she’s cleaned you off " + (pc.hasLowerGarment() || pc.hasArmor() ? "and has your clothes back in place" : "and has you in her lap") + ". Helping you to your feet, she brushes herself off and regards your expectant face with a giggle.");
				output("\n\n<i>“Aren’t you going to…”</i> you trail off.");
				output("\n\n<i>“Do I need to force the issue?”</i> she asks, smiling. <i>“A good pet knows what their master wants, [wulfe.pcname].”</i>");
				output("\n\nWith that she turns away and resumes escorting you, leaving you with the initiative.");
				wulfe.lust(10+rand(11));
			}
			else
			{
				output("Detecting the telltale twinge of an incoming delivery, you");
				if (pc.hasLowerGarment() || pc.hasArmor()) output(" pull your " + (pc.hasArmor() ? "[pc.armor]" : "[pc.lowerGarments]") + " down and");
				output(" kneel, already feeling contractions from deep inside. You wish she were here even if all she were to do was whisper hot, tempting promises in your ear while you cum all over yourself, but even in her absence just the thought of her is enough for you to get a headstart on a massive orgasm. You cry out as the first of several overlarge eggs makes its way out of you, your mind brimming with lust even as your body bucks in pleasure.");
				output("\n\n<i>“Nnnh- [wulfe.name],”</i> you pant, feeling yourself freefall over the edge of release. <i>“[wulfe.name]! [wulfe.name]!”</i>");
				if (pc.isHerm()) output("\n\n[pc.Cum] spills from the end of your [pc.cocks], pouring onto the ground in a continuous pumping stream while you feel femcum spatter your shaking calves.");
				else if (pc.hasCock()) output("\n\n[pc.Cum] spills from the end of your [pc.cocks], pouring onto the ground in a continuous pumping stream while you moan and shake your [pc.hips].");
				else if (pc.hasVagina()) output("\n\nFemcum drips down your [pc.legs] and spatters the ground while you moan and shake your hips.");
				else output("\n\nLacking genitals only forces the sensation to linger, white-hot pleasure radiating outwards from your clenching ass.");
				output(" The impulse is so strong and overwhelming that you can’t think of anything else but cumming, stuck in the bliss of being [wulfe.name]’s happy little slut and seedbearer. In the moment, you want nothing more than to experience this over and over, for her to keep you locked in this cycle for as long as she desires.");
				output("\n\nYou finally flop onto your side as the last egg spills into the pile, its exit prompting one last hard, climactic orgasm. Laying there panting, all you can think about is how much you want to go see your mistress for another round. She might have to rut you more than once for it to take, so you’ll have to be completely sure…");
				output("\n\nAfter a rest, you pick yourself up and continue on, head filled with [wulfe.name]’s impossibly attractive body.");
			}
			break;
	}

	pc.orgasm();
	addButton(0, "Next", mainGameMenu);
}