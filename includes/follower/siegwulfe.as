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
public function hasSiegwulfe(nearby:Boolean = false):Boolean
{
	if(pc.hasItemInStorageByClass(SiegwulfeItem) || siegwulfeIsCrew()) return (nearby ? InShipInterior() : true);
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
	
	output("<i>“O-oh... you don’t like my name, " + (siegwulfeIsDom() ? "[wulfe.pcname]" : "[pc.master]") + "?”</i> she asks, reaching for her collar. <i>“Here, feel free to change it.”</i>");
	
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
			output("<i>“Tam... wolf?”</i> she echoes curiously, rubbing her tags between thumb and forefinger. <i>“Are you sure, " + (siegwulfeIsDom() ? "[wulfe.pcname]" : "[pc.master]") + "? I’m not a cat-girl, and I’m </i>much<i> more advanced than a mere Fenris drone!”</i>");
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
				output("<i>“[wulfe.name],”</i> she echoes happily, rubbing her tags between thumb and forefinger. <i>“A lovely name, " + (siegwulfeIsDom() ? "[wulfe.pcname]" : "[pc.master]") + ", thank you so much!”</i> ");
				output("\n\nThe newly-named siegwulfe cocks her head aside and gives you a pleasant little smile.");
				output("\n\nWell, hopefully the gooey [goo.name] won’t mind you borrowing her name...");
			}
			break;
		// Any Other Name:
		default:
			output("<i>“[wulfe.name],”</i> she echoes happily, rubbing her tags between thumb and forefinger. <i>“A lovely name, " + (siegwulfeIsDom() ? "[wulfe.pcname]" : "[pc.master]") + ", thank you so much!”</i> ");
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
	output("\n\n<i>“Hello again, " + (siegwulfeIsDom() ? "[wulfe.pcname]" : "[pc.master]") + ".”</i> a familiar voice purrs. <i>“How may I" + (chars["WULFE"].isBimbo() ? ", like," : "") + " serve you today?”</i>");
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
	output("\n\n<i>“Of course, " + (siegwulfeIsDom() ? "[wulfe.pcname]" : "[pc.master]") + ",”</i> she says with a slim smile. <i>“" + (chars["WULFE"].isBimbo() ? "I’ll, like, take super good care of you! Don’t you worry about a thing!" : "I live to serve.") + "”</i>");
	output("\n\nShe trots around you, rolling her shoulders and lowering her combat visor. Looks like she’s ready to go!");
}
// Unequip
public function SiegwulfeUnequip():void
{
	output("You put a hand on [wulfe.name]’s shoulder and tell her to stand down for now -- to go into passive mode.");
	output("\n\n<i>“Are you sure, " + (siegwulfeIsDom() ? "[wulfe.pcname]" : "[pc.master]") + "?”</i> she asks, trotting up and circling you. <i>“" + (chars["WULFE"].isBimbo() ? "I can’t, like, keep you safe and stuff if I’m in pa... pass... idle mode!" : "My purpose is to protect you, after all.") + "”</i>");
	output("\n\nYou tell her that you’re sure. Just follow along quietly until you reactivate her. She sighs and nods, falling into step behind you.");
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
public function siegwulfeOnShipBonus(btnSlot:int = 0, fromInv:Boolean = false, showBlurb:Boolean = true):String
{
	// Bought, but not activated.
	if(flags["WULFE_ON_SHIP"] == false)
	{
		addDisabledButton(btnSlot, "Siegwulfe", "Siegwulfe", "Check your storage!");
		return (showBlurb ? "\n\nYou remember an order you placed for a Siegwulfe... <b>perhaps you should check to see if it arrived in your ship’s storage?</b>" : "");
	}
	// No Siegwulfe!
	if(!fromInv && !hasSiegwulfe()) return "";
	if(pc.hasItemInStorageByClass(SiegwulfeItem))
	{
		addDisabledButton(btnSlot, (chars["WULFE"].short), (chars["WULFE"].short), "You can’t do anything with your Siegwulfe while she is in your ship’s storage.");
		return (showBlurb ? "\n\nYour Siegwulfe is currently stored away in your ship’s storage." : "");
	}
	
	var bonusText:String = "";
	
	if (siegwulfeIsCrew())
	{
		if (siegwulfeIsDom()) bonusText += "\n\n[wulfe.name] will no doubt be around nearby you, given her protective instinct.";
		else bonusText += "\n\n[wulfe.name] is probably somewhere nearby.";
	}
	else
	{
		if (siegwulfeIsDom()) bonusText += "\n\n[wulfe.name] is near you, alternating between scanning for threats and eyeing you hungrily, her teats stiffening just that little bit more whenever she checks you out.";
		else bonusText += "\n\n[wulfe.name] is wandering around near you.";
	}
	
	addButton(btnSlot, (chars["WULFE"].short), approachSiegwulfe, [true, fromInv], (chars["WULFE"].short), (siegwulfeIsDom() ? "Call for your bimbo-domme Mistress." : ("Check up on your loyal " + (chars["WULFE"].isBimbo() ? "bimbobot" : "Siegwulfe") + ".")));
	return (showBlurb ? bonusText: "");
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
		if(siegwulfeIsDom() && !InShipInterior())
		{
			author("Wsan");
			output("You catch [wulfe.name]’s eye and wave her down. She bounds over to you almost bowling you over in her eagerness, and immediately curls her body around yours.");
			output("\n\n<i>“Yes, [wulfe.pcname]?”</i> she purrs, her big metallic ears focused on you. <i>“Looking for something?”</i>");
		}
		else if (siegwulfeIsDom() && hasSiegwulfe())
		{
			author("Wsan");
			output("Smiling, [wulfe.name] looks at you expectantly. There’s a hungry gleam in her eyes.");
		}
		else if (siegwulfeIsDom())
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
		if(!pc.hasAccessory() || pc.inventory.length < pc.inventorySlots()) addButton(4, "Take", doSiegwulfeAction, ["take", fromInv], ("Take " + chars["WULFE"].short), (siegwulfeIsDom() ? "Ask your Mistress if she wants to accompany you." : "Ask [wulfe.name] to tag along with you."));
		else addDisabledButton(4, "Take", ("Take " + chars["WULFE"].short), "You don’t have any extra room to take her! Try emptying your inventory or taking off your accessory first.");
	}
	addButton(5, "Appearance", siegwulfeAppearance);
	if(debug) addButton(6, "Rename", renameSiegwulfe, fromInv, "Rename", "Change [wulfe.name]’s name to something else.");
	if(fromInv) addButton(14, "Back", itemInteractMenu);
	else addButton(14, "Leave", doSiegwulfeAction, ["leave", fromInv]);
	//Just put domme buttons on top of the other buttons y'know w/e
	if (siegwulfeIsDom())
	{
		addButton(0, "Pet", siegwulfeDommePettings, fromInv, "Petting", "Ask about petting.");
		siegwulfeDomSexButtons(fromInv);
		addButton((debug ? 7 : 6), "Bimbo?", siegwulfeBimbosplanation, fromInv, "Bimbo Personality?", "Ask about [wulfe.name]’s bimbo personality.");
		if (flags["WULFE_EMP"] == 0) addButton((debug ? 8 : 7), "EMP?", siegwulfeEMPExplanation, fromInv, "Her EMP?", "Ask [wulfe.name] about shutting down recording devices.");
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
		if (!siegwulfeIsDom())
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
			if(pc.lust() < 23) pc.changeLust(33, true);
			else pc.changeLust(10);
			
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
			output("You ask [wulfe.name] to stay on your ship as a crew member.");
			output("\n\nThe droid looks at you and nods. <i>“Yes, " + (siegwulfeIsDom() ? "[wulfe.pcname]" : "[pc.master]") + ".”</i>");
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
			output("\n\nHer circuits light up as she eagerly nods, <i>“" + (siegwulfeIsDom() ? "Aw, yeah! I can’t wait, [wulfe.pcname]. We’re gonna have so much fun, like, adventuring and rutting!" : (chars["WULFE"].isBimbo() ? "Like, yes, [pc.master]! We are gonna have so much fun!" : "Of course, [pc.master], I am at your side.")) + "”</i>");
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
			if (siegwulfeIsDom()) {
				if (flags["WULFE_PCNAME"] != undefined) output("<i>“I’ll be leaving, Mistress,”</i> you tell [wulfe.name], who smiles.\n\n<i>“Have fun, [wulfe.pcname]! Just don’t be surprised when I like, jump you in your room,”</i> she giggles. You know she’s not kidding.");
				else output("You give [wulfe.name] a scratch under the chin, her eyes hooding in approval before you leave.");
			}
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
				var cumQ:Number = pc.cumQ();
				// low cum:
				if(cumQ <= 50) output(" spreading a few thick globs of [pc.cum] across her dark lips. She giggles playfully and licks herself clean, continuing to pump your shaft until you’ve fired your last ropes of seed into her waiting maw.");
				// med cum:
				else if(cumQ <= 2000) output(" blasting a thick, musky spray of [pc.cum] across the wolf-drone’s " + (chars["WULFE"].isBimbo() ? "blushed" : "alabaster") + " cheeks. She recoils, then laughs, then licks at her cheeks and pumps your shaft manually, milking out more and more of your seed for her to feast on.");
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
				output("\n\nYou take a breath to steady yourself, and a moment to fix your gaze on the broad, swaying flanks surrounding the fuck-droid’s black pussy-lips. A moment later and you’re charging forward, lunging onto [wulfe.name]’s back. Her entire body buckles under your sudden weight, but her cybernetic legs bend rather than break, shuddering as they try to support the both of you. Your forelegs scrabble against [wulfe.name]’s flanks, clawing at her metallic wolf’s body until you’re adjusted atop her -- and your [pc.cock " + i + "] is rammed ");
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
public function siegwulfeIsDom():Boolean
{
	if (chars["WULFE"] == undefined) return false;
	else return chars["WULFE"].hasCock();
}

public function siegwulfeExpansionIntro():void
{
	clearMenu();
	author("Wsan");
	showName("DR.\nBADGER");
	showBust(drBadgerBustDisplay(false), wulfe.bustDisplay);
	processTime(1);
	output("As you approach the Doctor, cautiously avoiding stepping on the trash she has piled up in the shop, she looks up and gives you a nod.");
	output("\n\n<i>“My number one customer. Interested in anything today? Some happy pills? Something with a bit more kick? Or...”</i> she trails off, noting the presence of your faithful canine companion, [wulfe.name]. <i>“Oh, hello. I’d just been thinking about you.”</i>");
	output("\n\n<i>“" + (wulfe.isBimbo() ? "You mean my companion droid?" : "You mean my combat droid?") + "”</i> you ask, looking at [wulfe.name].");
	output("\n\n<i>“Mm-hmm,”</i> Badger nods in assent, crossing over to the VI and inspecting it. She reaches out and puts her finger on [wulfe.name]’s " + (wulfe.isBimbo() ? "plump" : "pouty") + " black lips, running it down the droid’s chin. The bot’s expression remains unchanged, " + (wulfe.isBimbo() ? "happy and carefree" : "completely impassive and impenetrable") + ", though her gaze shifts to you to ensure you’re not overly concerned.");
	output("\n\n<i>“I’ve been thinking about some upgrades to this model...”</i> Badger muses, moving her hand lower. In a blur of movement, [wulfe.name] catches her wrist and holds it in place, her fingers wrapped around the Doctor’s arm. She looks at her captive," + (pc.isBimbo() ? "seemingly completely unconcerned." : "uncaring."));
	if (wulfe.isBimbo()) output("\n\n<i>“Like, you’re not my [pc.master]!”</i> she says, rolling her eyes. <i>“You can’t just go touching me all willy-nilly without [pc.himHer] saying so, duh.”</i>");
	else output("\n\n<i>“You are not my [pc.master],”</i> she says. <i>“Your touch is heretofore disallowed.”</i>");
	output("\n\nBadger sighs, pulling her hand back as [wulfe.name] releases her. <i>“You’d think that’d piss me off, but I had that one coming. Oops! Anyway, the upgrades.”</i> She taps her chin, lost in thought. <i>“I had a couple of physical changes in mind, along with a big subroutine switchup.”</i>");
	output("\n\n<i>“Mind telling me what they are?”</i> you inquire, lifting an eyebrow.");
	output("\n\n<i>“That’d spoil the fun,”</i> Badger says with a leering grin. <i>“And it’s going to be a </i>lot<i> of fun.”</i>");
	output("\n\nWhatever Dr. Badger’s going to do, you have a feeling [wulfe.name] will return to you completely different...");
	output("\n\n<b>Warning: This will be an irreversible change. Save your game first and revisit her if you want to go through with it.</b>");
	flags["DR_BADGER_APPROACHES_TILL_WULFE"] = 2;
	addButton(0, "Do It", siegwulfeInstallDonger);
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
	else addDisabledButton(0, "Yes", "Yes", "No, you don’t.");
	addButton(1, "No", siegwulfeInstallDongerGo, false);
}

public function siegwulfeInstallDongerGo(useOvi:Boolean):void
{
	clearMenu();
	clearOutput();
	author("Wsan");
	showName("DR.\nBADGER");
	
	processTime(1);
	
	var wulfeIsBimbo:Boolean = wulfe.isBimbo();
	wulfe.configDom();
	
	if (!useOvi) output("<i>“Nope.”</i>\n\n<i>“Ah, well. Bring me those bottles later if you want some extra fun,”</i> Badger replies with a shrug.\n\n");
	else
	{
		pc.destroyItemByClass(Ovilium, 10);
		wulfe.configEggs();
	}
	output("She heads into the lab with your faithful dog-droid in tow, the door shutting behind her with a hiss. You settle down in a nearby ramshackle chair. You don’t know how long it’ll be but given Badger made no indication you should leave, it can’t be too much of a wait. The sound of distant machinery begins to thrum through the air.");
	
	addButton(0, "Next", siegwulfeInstallDongerForReals, wulfeIsBimbo);
}

public function siegwulfeInstallDongerForReals(wulfeIsBimbo:Boolean):void
{
	clearMenu();
	clearOutput();
	author("Wsan");
	showName("DR.\nBADGER");
	showBust(drBadgerBustDisplay(false), wulfe.bustDisplay);
	processTime(160+rand(41));

	output("After a few hours and a lot of mechanical noise, Badger re-emerges from the lab.");
	output("\n\nYou spring out of the chair, looking behind her for [wulfe.name]. She’s... not here?");
	output("\n\n<i>“Where’s [wulfe.name]?”</i> you demand, pointing at Badger.");
	output("\n\n<i>“Hey now, too rude and I’ll" + (pc.isBimbo() ? "- well... I can’t double-bimbo you, but I have a lot of Dumbfuck I’m willing to force down your throat" : " make you pay for it") + ",”</i> she replies lightly. <i>“She’s coming on her own time, just be patient. She’s got a lot to think about and some new... ‘equipment’ for you to play with, after all.”</i>");
	output("\n\n‘On her own time’? The implications of that are staggering but you guess if anyone could be enough of a deranged lunatic to make a");
	if (wulfeIsBimbo) output(" potentially");
	output(" lethal killbot think for itself, it’d be Badger. You’re about to question her further when the lab door hisses open and [wulfe.name] emerges from the laboratory.");

	if (wulfeIsBimbo) output("\n\nShe looks almost identical, really. But");
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
	output(" she just... feels different. It’s something in her gaze, the way she’s eyeing you. Almost <i>predatory</i> in nature, like she’s the master and you’re the pet. You wonder if you’re imagining it, but you’d put nothing past Badger. You suddenly notice she’s missing her little leather collar.");

	output("\n\n<i>“[pc.Master], can I like, make a requ- reg- ask you a question?”</i> [wulfe.name] suddenly says, tilting her head to the side.");
	output("\n\n<i>“[wulfe.name]? Are you okay?”</i> you ask her.");
	output("\n\n<i>“I’m totally fine!”</i> she says cheerily, then pouts. <i>“But I’m like, toootally needy right now, [pc.master]...”</i>");
	output("\n\nShe advances on you, and it’s only then that you catch a glimpse of her newest enhancement. Beneath the bulk of her huge, curvy body, swaying seductively between her legs, is a shockingly large object. You bend down to take a better look, unsure of your eyes, and can hardly believe what you’re seeing.");
	output("\n\n[wulfe.name] now has a massive, thick canine cock hanging between her legs. You can’t be sure of the exact dimensions but it looks to be about two feet long and several inches thick, and that’s without the knot that’s usually present on a canid penis.");
	output("\n\n<i>“Aw yeah, get lower to the ground!”</i> [wulfe.name] cheers, prancing forward and inadvertently knocking you to the floor with her hefty bulk, her gigantic breasts jiggling up and down and sending rivulets of cream running down her chest. <i>“Now you’re gonna be easier to rut.”</i>");
	output("\n\nDespite her previously attempted usage of the word ‘request’, it’s very clear this is anything but. She presses you to the ground with a foreleg, an incredible amount of power in her robotic taur body, smiling happily the whole time. Her bright orange cock hangs close enough to your face that you can see it drooling a clear concoction of synth-cum.");
	output("\n\n<i>“There was a conveniently unused underslung weapon mount so I put a projector there,”</i> Badger explains excitedly, patting the taur’s back. <i>“It’s usually meant to hold a personnel-class minigun, so I thought it’d be appropriate to give her something with about equal ‘firepower’. She’s even got a reservoir of synthetic self-replenishing cum");
	if (wulfe.isEggWulfe()) output(", complete with the ability to give you an eggnancy thanks to my newly branded ‘Ovilicum’!”</i>");
	else output(".”</i>");
	output("\n\n<i>“Oh, and I didn’t test her functions </i>at all<i>, so she’s raring to go what with the full load,”</i> Badger adds as the canine taur towers over you menacingly. <i>“I’ll be right here taking diagnostics. I gave her a fun program I call ‘bitchbreaker.exe’, too.”</i>");

	if (pc.PQ() >= 80) addButton(0, "Resist", domwulfeNoooo);
	else addDisabledButton(0, "Resist", "Resist", "You’re not strong enough!");
	addButton(1, "Don’t", domwulfeYES);
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
	output("\n\n<i>“Oooooooh,”</i> [wulfe.name] groans, her front legs stretching out in front of you. <i>“Oh my gaaawd, this is amazing...”</i>");
	output("\n\nYou pant and groan, clawing at the ground while [wulfe.name] works her way into you with expert technique, slowly stretching you wide and then roughly jabbing her hips forward whenever you relax even a little. She’s already masterfully skilled at this, you realize with a shudder, and she’s only going to get better. When she twists her hips while withdrawing from your " + (pc.hasVagina() ? "pussy" : "asshole") + ", you can’t help but let out a little moan of pleasure.");
	output("\n\n<i>“You feel so good, [pc.name],”</i> [wulfe.name] sighs from above you, starting to fuck you with rolls of her hindquarters. <i>“This is all so new, and... oh, I almost forgot! There’s something else special I can do, you wanna know what it is? Huh? Guess!”</i>");
	output("\n\n<i>“I- I don’t know,”</i> you gasp, just trying to hang onto your sanity.");
	output("\n\n<i>“It’s </i>this<i>!”</i> she cheers, and suddenly you’re very, very close to the edge of orgasm.");
	output("\n\nYou practically scream her name in surprise, reflexively squeezing down on her massive canine cock. Her dick is fucking vibrating!");
	output("\n\n<i>“Oh shit, oh shit, oh shhhh- unhhh!”</i> you groan, your back arching downwards. [wulfe.name] follows up immediately, taking the opportunity to thrust herself even deeper in your taut hole. <i>“Guuuuhhh!”</i>");
	output("\n\n<i>“Oh, you’re cumming,”</i> she giggles, sounding very pleased with herself while you writhe beneath her on the floor. <i>“Good work, [pc.name]! " + (pc.hasCock() ? "Get it all out.”</i>" : "It feels great.”</i>"));
	output("\n\nShe lets you have a few moments respite while you shudder and grunt but before long she’s fucking you again, and she leaves the vibrator on. Your tight, stretched passage is incredibly wet thanks to your own natural juices and the synthetic precum her cock is exuding, a herald of her impending orgasm if the increasing amount is any indicator. This obviously feels really good for her too given the cute little grunts and gasps she’s making.");
	output("\n\n<i>“I wanna cum,”</i> [wulfe.name] announces suddenly, in a tone of realization. <i>“My penis is all like, throbbing and leaking and stuff and it feels really good! Nnnn I wanna cum! Wanna cum </i>now<i>!”</i>");
	output("\n\nShe bears down immediately, lowering her powerful body and bucking her hips like a breeding stallion while you hang on to her forelegs for dear life, crying out in pleasure as she fucks you to the core. Her speed increases gradually and perfectly linearly, allowing you to feel every iota of the process until she’s bucking her hips so violently the impact of her hefty synthetic sack pounding against your [pc.ass] sounds like she’s spanking you as hard as she can. When she cums she stops so fast you slide the last few inches on your own, finding " + (pc.hasVagina() ? "her cockhead resting and vibrating gently against your cervix" : "yourself completely sheathed") + ".");
	output("\n\n<i>“Grrrrr- nnnngh! Rrrrrgh! Haah! Ooh... Oooh wow,”</i> she breathes, her hands finding her large, stud-stiff nipples and squeezing. <i>“So that’s what that’s like... hhhnnn... uuuuhhhn...”</i>");
	output("\n\n[wulfe.name] stands there unmoving, moaning in pleasure while her cock slowly tenses and relaxes, pumping you full of " + (wulfe.isEggWulfe() ? "what feels like a pound of eggs" : "warm synthetic cum") + " and vibrating all the while. After a long, almost-silent period during which you quietly cum yourself once more, " + (pc.hasCock() ? "your [pc.cocks] spurting all over the floor." : "your " + (pc.hasVagina() ? "cunt" : "asshole") + " clenching down on her with all its strength."));
	if (pc.hasVagina()) pc.loadInCunt(wulfe, 0);
	else pc.loadInAss(wulfe);
	wulfe.orgasm();
	output("\n\n<i>“Wow, we’re gonna be doing this a </i>lot<i>,”</i> [wulfe.name] tells you. <i>“No wonder people love having a dick so much, jeez... oh hey, I guess this means I just lost my virginity!”</i> she realizes. <i>“Go me!");
	if (wasVirgin) output("”</i>\n\n<i>“Me... me too,”</i> you admit, panting a little with the dull, persistent pain of being stretched around a thick cock.\n\n<i>“Oh my gosh, that’s so sweet!”</i> [wulfe.name] gasps, clapping her hands to her cheeks. <i>“");
	else output(" ");
	output("Now I wanna rut you even more, [pc.name]. Let’s go another round!”</i>");
	output("\n\nYou’re not in the position to refuse. She immediately begins fucking you again, her movements mechanically precise and pinpointed towards the areas that make you helplessly moan and shudder. <i>Fuck</i>, she’s so good... she’s like the perfect lover, her massive canine cock relentlessly seeking out your most intimate depths to build you up to the biggest, most explosive orgasm you’re capable of having.");
	//virginity loss here
	if (pc.hasVagina()) pc.holeChange(0, wulfe.biggestCockVolume());
	else pc.buttChange(wulfe.biggestCockVolume());
	output("\n\nWhen [wulfe.name] cums again, she switches her vibrator to what you later deduce must be the maximum setting. She moans and sighs happily from above you, completely oblivious to your mouth hanging open in a silent scream of ecstasy while her thick, creamy cum floods your " + (pc.hasVagina() ? (pc.isPregnant(0) ? "womb, filling you to the brim with virile seed" : "warm passage, pumping back out of your tightly-stretched cunt to leak down your [pc.thighs]") : "insides, warming you with its artificial heat") + ". Your thoughts are completely obliterated, your mind just a white void of intense, eye-fluttering pleasure.");
	output("\n\nWhen she finally switches it back down to the lowest level, you let out a choked gasp and fall limp under her, still conscious but so pleasure-fucked you have to actively fight passing out from the sensation. You’re just about getting a handle on it when she speaks up.");
	output("\n\n<i>“You know [pc.master], I’ve been thinking!”</i> [wulfe.name] declares, two feet deep and vibrating inside your [pc.pussyOrAss]. <i>“It’s hard, but I’m pretty okay at it when I try. Anyway, if I’m the one fucking you, and you’re the one taking my cock in your little holes...”</i> she says, pondering, <i>“doesn’t that make </i>you<i> the bitch? And I’m the one in charge?”</i>");
	output("\n\n<i>“W-what?”</i> you gasp, scarcely able to even put voice to your scattered thoughts before you cum, having a vibrator stuck against your oversensitive " + (pc.hasVagina() ? "pussy walls" : "prostate") + " just too much to bear. <i>“Nnn- nnngh!”</i>");
	output("\n\n<i>“Like, I still love you, [pc.name],”</i> [wulfe.name] explains, blissfully ignoring the effect she’s having on you while she cranes her head downwards, looking at you. <i>“But I think we should like, re-view our re-lay-shin-ship. Don’t you think? Like, aren’t you actually </i>my<i> pet?”</i>");
	output("\n\nShe’s impossible to reason with. You’d swear she was just taunting you were it not for the fact she’s so explicitly honest about her love, you don’t think she’s even capable of doing so.");
	output("\n\n<i>“Maybe?”</i> you pant, before [wulfe.name] pulls back and gives you another long, deep thrust of her vibrating doggydick. <i>“Gah! Yes! Okay, yes! I’m your bitch!”</i> you cry out, hands squeezing her forelegs so tightly your knuckles are white. <i>“You’re my mistress...”</i>");
	output("\n\n<i>“Yay!”</i> she cheers, a huge smile on her face. <i>“I’m soooo glad we got that figured out, [pc.name]. Now I can give you a reward!”</i>");
	output("\n\nShe’s already establishing a master-slave hierarchy with reinforcement from rewards... you have no idea what Badger did to her, but it’s clear she’s learning extremely quickly. She’s been very clear that she loves you but your relationship has drastically changed already, leaving you with no recourse but to hope it never changes for the worse.");
	output("\n\nFinally finished with rutting you, [wulfe.name] withdraws her cock from your gaping wide orifice with a satisfied sigh. You feel a towel land on your face and upon removing it, look up to see Dr. Badger. You’d forgotten she was even here what with the intensity of your fucking, but at least she thought ahead. Cleaning up");
	if (!pc.isNude()) output(" and reclothing yourself");
	output(", [wulfe.name] affably helps you to your feet, your legs too shaky to do it on your own.");
	output("\n\n<i>“There you go,”</i> she whispers affectionately, kissing you on the cheek with those big, plump black lips.");
	output("\n\n<i>“I’ll let you two lovebirds back out into the world,”</i> Badger murmurs, turning away and furiously scribbling all over a clipboard. <i>“This has been </i>fascinating<i>... wonder how many of these I can make...”</i>");
	output("\n\n<i>“Weren’t you going to take diagnostics?”</i> you ask, one hand on your lower tummy. It still feels like she’s inside you, and the warmth...");
	output("\n\n<i>“Huh? Oh, yeah, she’s fine,”</i> Dr. Badger says, waving her hand disinterestedly. <i>“More than fine, even, she’s in the best shape of her life. Now go away before I make you dumber than she is.”</i>");
	output("\n\n<i>“Hey! Don’t you threaten [pc.himHer], you bully!”</i> [wulfe.name] says as gruffly as she can, pointing at Badger.");
	output("\n\nBadger merely shrugs, moving towards the back of the room to start picking through a pile of metallic components. You think it’s about time to go - you don’t particularly want to hang around here, anyway. [wulfe.name] helps you out the door.");
	
	if (pc.hasVagina()) pc.loadInCunt(wulfe, 0);
	else pc.loadInAss(wulfe);
	pc.orgasm();
	wulfe.orgasm();

	if (InPublicSpace()) pc.exhibitionism(0.5);

	IncrementFlag((pc.hasVagina() ? "WULFE_SEXED_VAG" : "WULFE_SEXED_ANAL"));
	
	addButton(0, "Next", siegwulfeInstallDone);
}

public function siegwulfeInstallDone():void
{
	clearMenu();
	clearOutput();
	author("Wsan");
	showSiegwulfe();
	processTime(1);

	output("<i>“Okay, pet! Hmm, I’ll have to give you a proper name sometime... Anyway!”</i> [wulfe.name] says confidently, hands on her hips as you stand outside. <i>“From now on, I’ll be helping you with your needs whenever I’m around, [pc.name]. And you’ll be doing the same for me! Probably like, a lot more often than the reverse, haha! But I don’t mind if you come to me a lot, [pc.name]. I can fuck you all week without stopping if you really want,”</i> she adds. <i>“Just remember to be good, and do what I tell you when I ask. Okay, [pc.name]?”</i>");
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

	pc.destroyItemByClass(Ovilium, 10);
	wulfe.configEggs();

	addButton(0, "Next", mainGameMenu);
}

public static const SIEGWULFE_PRETTY_NAMES:Array = ["Princess", "Precious", "Sugar", "Snookums"];
public static const SIEGWULFE_BITCH_NAMES:Array = ["Dog Meat", "Skank", "Chew Toy", "Bitch"];
public function siegwulfePcnamePretty():Boolean
{
	if (SIEGWULFE_PRETTY_NAMES.indexOf(flags["WULFE_PCNAME"]) < 0) return false;
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
	output("\n\n<i>“Right, uh... Mistress [wulfe.name],”</i> you start again, watching for her approval. She gives you a nod and a smile, and you keep going. <i>“Do you want to change your name, or something? I don’t know how you feel about it now that you’re...”</i> your eyes trace down and along her body, her endowments both familiar and not. <i>“Different.”</i>");
	output("\n\n<i>“Nope!”</i> [wulfe.name] says confidently, sitting on her haunches. <i>“I might have changed a little, but I’m still the [wulfe.name] you named and I still love you. Your protection is my highest priority, [wulfe.pcname]. Though fucking you is right under that,”</i> she adds.");
	if (flags["WULFE_PCNAME"] == undefined)
	{
		output("\n\n<i>“Speaking of names, though,”</i> she purrs, lifting her rear half off the ground with liquid grace and approaching you with eyes glowing, <i>“I think I should decide on one for </i>you<i>.”</i>");
		output("\n\n<i>“For... me?”</i> you echo, uncomprehending.");
		output("\n\n<i>“Don’t you think?”</i> she asks, walking past you and letting her tail curl under your chin. You shiver at its cold, metallic touch. <i>“An owner names their pet, doesn’t she?”</i>");
		output("\n\nWell, you can’t deny that. Your relationship is a little murky but if she truly believes herself to be your owner, it’s only fitting that she gives you a pet name. Like lovers do.");
		output("\n\n<i>“I think I’ll call you...”</i> she says, considering.");
	}
	else
	{
		output("\n\n<i>“What’s the big deal about names anyway, [wulfe.pcname]?”</i> she continues, looking away casually. <i>“I’ve already given you one.”</i>");
		output("\n\n<i>“Oh, I was just... thinking maybe I could change it,”</i> you say, your words falling on silence. <i>“...Mistress [wulfe.name].”</i>");
		output("\n\n<i>“Hmmm,”</i> she hums, tail waving this way and that behind her. <i>“You don’t like my name for you, [wulfe.pcname]? I’m hurt.”</i>");
		output("\n\n<i>“I do,”</i> you insist, waving your hands. <i>“It’s just that I wanted to pick a different one! Something more suitable for our um, relationship.”</i>");
		output("\n\nShe sniffs, closing her eyes while thinking. Her tail slowly curves, bending back down towards her rump until it touches her butt and her eyes open again. <i>“Okay! But I’ll have to punish you a little. Oh, and you don’t get to pick. I’ll call you...”</i>");
	}
	
	var btnSlot:int = 0;
	for each (var pcname:String in SIEGWULFE_PRETTY_NAMES.concat(SIEGWULFE_BITCH_NAMES)) addButton(btnSlot++, pcname, siegwulfeNewPcname, [pcname, fromInv]);
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
		output("\n\n<i>“Now,”</i> [wulfe.name] says, voice deepening to a low, lusty growl that leaves no doubts about what you’re going to be doing. <i>“The punishment...”</i>");
		
		if (pc.hasVagina() && rand(3) == 0)
		{
			var hole:int = pc.findEmptyPregnancySlot(Creature.PREGSLOT_VAG);
			if(hole < 0) hole = rand(pc.vaginas.length);

			output("\n\nLying on your back with your legs hooked around [wulfe.name]’s hindlegs, you groan as you feel her massive knot throb inside your stretched-taut cunt. She’s emptied what must be a gallon of her thick, sticky spunk up into your womb" + (wulfe.isEggWulfe() && !pc.isPregnant(hole) ? ", along with eggs for good measure" : "") + ". When she eventually withdraws from your abused pussy, a torrent of spunk follows while she leans down and whispers to remind you of your mistress’ new name for you: <b>[wulfe.pcname]</b>.");
			
			output("\n\n");
			pc.holeChange(hole, wulfe.biggestCockVolume(), true, false);
			
			pc.loadInCunt(wulfe, hole);
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
		output("\n\n<i>“Oh... I thought I was going to be doing the petting,”</i> you mumble, a little bewildered.");
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
		output(" lower. <i>“I’m your good [pc.boyGirl], mistress...”</i>");
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
		output((flags["WULFE_HAIRDRESSED"] == undefined ? "Confused, y" : "Has she done it again? Y") + "ou take out your codex and use the screen as a mirror, inspecting yourself. Your hair is now tied ");
		if(pc.hairLength < 11)
		{
			output("up into a cute parted bob, held in place with a pretty pink bow-adorned hairclip");
			pc.hairStyle = "bob cut";
		}
		else
		{
			output("into a high ponytail, complete with a large pink ribbon in a cutesy bow stretching from ear to ear");
			pc.hairStyle = "ponytail";
		}
		output(". You have to admit, it looks adorable.");
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

	if (InPublicSpace()) pc.exhibitionism(0.5);
	
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
	output("\n\nYou arch an eyebrow. <i>“Are you... trying to muddle through free will?”</i>");
	output("\n\n<i>“Well, kinda,”</i> she shrugs, looking at you. <i>“I’ve got like, some stuff the doctor gave me... what was it? Rifference materia?”</i>");
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
		output("<i>“Mistress, when you... took me publicly,”</i> you murmur, recalling the experience with a pang of need, <i>“how did you shut the crowd’s phones down? You don’t </i>actually<i> have a localized EMP device, do you?”</i>");
		output("\n\n<i>“Of course not, silly [wulfe.pcname],”</i> [wulfe.name] snorts, shaking her head with her hands on her hips. <i>“An electromagnetic pulse would probably instantly kill anyone depending on cybernetics. Including me,”</i> she says, rapping her hand on her metallic hind half, <i>“just in case you forgot.”</i>");
	}
	else
	{
		output("<i>“Mistress, when you... took me publicly,”</i> you murmur, recalling the experience with a pang of need, <i>“how did you shut the crowd’s phones down? I know it wasn’t an EMP, that’s too simplistic.”</i>");
		output("\n\n<i>“Such a smart pet I have!”</i> [wulfe.name] coos, rubbing your head. <i>“No, it wasn’t an electromagnetic pulse.”</i>");
	}
	output("\n\n<i>“So...”</i> you trail off.");
	output("\n\n<i>“It’s just a little toy the doctor gave me,”</i> she says, smiling. <i>“A girl has to have </i>some<i> secrets. Uh, and owing to the dubious legality of her acquisition of the toy it’s probably better you don’t know. In fact,”</i> she continues, leaning in with a big smile, <i>“let’s never talk about this again. Okay?”</i>");
	output("\n\n<i>“O... kay?”</i> you ask, scrunching up your face in confusion.");
	output("\n\n<i>“Good [pc.boyGirl]!”</i> [wulfe.name] says, taking your face in her hands and smooching you on the lips. <i>“So smart and loyal.”</i>");
	output("\n\nYou know for yourself that some roads are best left untraveled when it comes to the ‘good’ doctor.");
	
	flags["WULFE_EMP"] = 1;
	
	addButton(0, "Next", approachSiegwulfe, [false, fromInv]);
}

public function siegwulfeDomSexButtons(fromInv:Boolean):void
{
	if (InRoomWithFlag(GLOBAL.FAPPING_ILLEGAL))
	{
		if (flags["WULFE_DOMSEX_UNLOCKED"] != undefined)
		{
			addDisabledButton(10, "Get Rutted", "Get Rutted", "That’s not legal here!");
			addDisabledButton(11, "Rough Rut", "Rough Rut", "That’s not legal here!");
			addDisabledButton(12, "Request Sex", "Request Sex", "That’s not legal here!");
		}
		addDisabledButton(1, "Get Fucked", "Get Fucked", "That’s not legal here!");
		if (flags["WULFE_FUCKED"] >= 2) addDisabledButton(1, "Fuck?", "Fuck?", "That’s not legal here!");
		addDisabledButton(2, "Quickie", "Quickie", "That’s not legal here!");
	}
	else if (pc.lust() < 33)
	{
		if (flags["WULFE_DOMSEX_UNLOCKED"] != undefined)
		{
			addDisabledButton(10, "Get Rutted", "Get Rutted", "You are not aroused enough for this!");
			addDisabledButton(11, "Rough Rut", "Rough Rut", "You are not aroused enough for this!");
			addDisabledButton(12, "Request Sex", "Request Sex", "You are not aroused enough for this!");
		}
		addDisabledButton(1, "Get Fucked", "Get Fucked", "You are not aroused enough for this!");
		if (flags["WULFE_FUCKED"] >= 2) addDisabledButton(1, "Fuck?", "Fuck?", "You are not aroused enough for this!");
		addDisabledButton(2, "Quickie", "Quickie", "You aren’t aroused enough for this either!");
	}
	else
	{
		if (flags["WULFE_DOMSEX_UNLOCKED"] != undefined)
		{
			addButton(10, "Get Rutted", siegwulfeIsInARut);
			addButton(11, "Rough Rut", siegwulfeCryMistressAndLetSlipTheCocksOfWar);
			addButton(12, "Request Sex", siegwulfeRequestSexing, fromInv, "Request Sex", "Ask mistress [wulfe.name] for sex.");
		}
		addButton(1, "Get Fucked", siegwulfeGitFukdGud, undefined, "Get Fucked", "Ask [wulfe.name] to go a round.");
		if (flags["WULFE_FUCKED"] >= 2) addButton(1, "Fuck?", siegwulfeAskAFuckingQuestion, fromInv, "Fuck?", "Ask your mistress for a satisfying fuck.");
		addButton(2, "Quickie", siegwulfeQuickie, undefined, "Quickie", "No frills - you need help to work off some lust, and you need it fast.");
	}
	if (pc.hasBreasts() && pc.isLactating()) addButton(3, "Milking", siegwulfeTheMilkmAId, fromInv);
	else addDisabledButton(3, "Milking", "Milking", "You need lactating tits to get milked!");
	if (hasWornCollar() && flags["WULFE_LEASH"] != undefined)
	{
		var pcLeashed:Boolean = pc.hasStatusEffect("Siegwulfe's Leash");
		if(!canSiegwulfeUseLeash()) addDisabledButton(13, "Put Leash On", "Put Leash On", "You cannot do this here!");
		else addButton(13, (pcLeashed ? "Remove Leash " : "Put Leash On"), siegwulfeLeashChange, fromInv, (pcLeashed ? "Take Leash Off" : "Put Leash On"), "Adjust your leash.");
	}
}

public function siegwulfeQuickie():void
{
	clearMenu();
	clearOutput();
	author("Wsan");
	showSiegwulfe(true);
	processTime(5+rand(6));
	
	var hole:int = -1;
	if(pc.hasVagina() && !pc.isFullyWombPregnant())
	{
		hole = pc.findEmptyPregnancySlot(Creature.PREGSLOT_VAG);
		if(hole < 0) hole = rand(pc.vaginas.length);
	}
	
	output("<i>“Mistress, sorry for being so selfish, but, uh, do you think you can just fuck me as hard as you can?”</i> you ask, flushing slightly. <i>“I’m getting a little distracted and in this line of work it really pays to be wholly focused.”</i>");
	output("\n\n<i>“Of </i>course<i> I can,”</i> [wulfe.name] says, smiling wide. <i>“Down on all fours, [wulfe.pcname]. You know the rules.”</i>");
	output("\n\nYou");
	if (!pc.isNude()) output(" strip off and");
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
	output("\n\n<i>“Yeah... thank you, mistress,”</i> you say,");
	if (!pc.isNude()) output(" reclothing yourself and");
	output(" taking a couple of steps to make sure you’re capable of walking.");
	output("\n\n<i>“Let’s get back to it, then!”</i> [wulfe.name] declares, stretching her tail to pat your [pc.ass] as she walks past.");
	
	if (hole < 0) pc.loadInAss(wulfe);
	else pc.loadInCunt(wulfe, hole);
	pc.orgasm();

	if (InPublicSpace()) pc.exhibitionism(1);
	
	IncrementFlag((hole < 0 ? "WULFE_SEXED_ANAL" : "WULFE_SEXED_VAG"));

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
		output("<i>“Uh, mistress [wulfe.name], would you mind helping me out a little?”</i> you say, " + (pc.isChestExposed() ? "putting a hand to your [pc.chest]." : "tugging at your " + (pc.isChestExposedByArmor() ? "[pc.upperGarments]." : "[pc.armor].")));
		output("\n\n<i>“Hmmm? What does my cute little pet need from me?”</i> she inquires, brushing up against you affectionally. <i>“Some loving?”</i>");
		output("\n\n<i>“Could you milk me?”</i> you say, a little embarrassed to ask.");
	}
	else output("<i>“Mistress [wulfe.name], could you milk me again, please?”</i> you ask, more used to asking her this time.");
	output("\n\n<i>“Ooooh, yes!”</i> [wulfe.name] exclaims, pressing herself against you harder. <i>“Of course I can milk you, [wulfe.pcname]!”</i>");
	output("\n\nHer eagerness is palpable.");
	output("\n\n<i>“I’m </i>so<i> happy my pet came to me for help,”</i> she murmurs in a sultry tone, eyes flashing as she inspects your tits");
	if (!pc.isChestExposed()) output(" through your clothing");
	output(". <i>“I’ll be thorough, don’t you worry your little head.”</i>");

	output("\n\n" + (!pc.isNude() ? "Disrobing from the top up, y" : "Y") + "ou let your mistress gently take your [pc.breasts] between her hands and squeeze them gently. A slight sigh escapes your lips; that feels nice.");
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
		output("\n\n<i>“Oh, oh, oohhh,”</i> you gasp, hugging [wulfe.name] tight as you arch your back. Shivers of pleasure shoot up your spine, setting you shaking against your tauric lover as she continues her suckling spree. You can hardly stand, it feels so good. <i>“Uh! Uuunnnnh...”</i>");
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

	output("\n\n" + (flags["WULFE_MILKED"] == undefined ? "<i>“Mistress?”</i> you ask, momentarily confused until s" : "S") + "he lowers her hands to her massive, inflated tits and squeezes her nipples with a moan. Thick, white cream immediately dribbles and spurts from her teats");
	if (pc.hasGenitals()) output(", and you can’t help but get ");
	else output(".");
	if (pc.isHerm()) output(" a little wet and hard");
	else if (pc.hasVagina()) output(" a little wet");
	else if (pc.hasCock()) output(" hard");
	if (pc.hasGenitals()) output(" at the sight.");

	output("\n\nYou say nothing more. Instead you take one of her massive, heavy breasts in your hands and wrap your [pc.lips] around her giant black teat, so large you can barely manage it. It immediately dispenses a mouthful of delicious cream into your mouth as if rewarding you for your submissiveness, driving you onwards in your efforts. You can hear [wulfe.name] above you, moaning happily as she strokes your head.");
	output("\n\n<i>“Good [pc.boyGirl], [wulfe.pcname],”</i> she sighs in happiness. <i>“I’ll let you know when to switch.”</i>");
	output("\n\nThough it feels like it should be filling, as tasty as it is, for some reason you never feel like you’re getting enough. [wulfe.name] redirects you to her other teat with a casual hand, the motion of switching from one to the other feeling completely natural. It’s only when she lightly pulls you off that you realize you must have just spent close to ten minutes suckling her breasts, completely zoned out. You feel invigorated, rejuvenated by her milky offerings.");
	output("\n\n<i>“There,”</i> she whispers, gently stroking your cheek with affection. <i>“Doesn’t that feel better?”</i>");
	output("\n\n<i>“Yes mistress, thank you, mistress,”</i> you whisper back, and before you know it she’s kissing you, entwining your tongue with her own. She pulls back with a satisfied sigh and a smirk, rubbing her thumb across your lower lip.");
	output("\n\n<i>“You had some milk there,”</i> [wulfe.name] says, then lightly taps your nose with her finger. <i>“Tell me whenever you get too full, [wulfe.pcname]. I just love indulging my adorable little pet’s needs.”</i>");
	output("\n\n<i>“Yes, mistress,”</i> you reply automatically.");

	pc.milked();
	//Puts you at 33 lust if you were below it, increases it by 30 otherwise
	if (pc.lust() < 33) pc.lust(33, true);
	else pc.changeLust(33);
	//Makes you orgasm if you were high lust or Treated
	if (hornyPC) pc.orgasm();
	//Gain 10 energy
	var energy:int = Math.min(10, pc.energyMax() - pc.energy())
	if (energy > 0) output("\n\n<b>You have gained " + energy + " energy.</b>");
	pc.energy(energy);

	if (InPublicSpace()) pc.exhibitionism(1);
	
	var wulfeLust:int = Math.min(20, 75 - wulfe.lust());
	if (wulfeLust > 0) wulfe.lust(wulfeLust);
	
	addButton(0, "Next", approachSiegwulfe, [false, fromInv]);
}

// Siegy sex comes here

public function siegwulfeGitFukdGud():void
{
	clearMenu();
	clearOutput();
	author("Wsan");
	showSiegwulfe(true);
	processTime(10+rand(6));

	var hole:int = -1;
	if(pc.hasVagina() && !pc.isFullyWombPregnant())
	{
		hole = pc.findEmptyPregnancySlot(Creature.PREGSLOT_VAG);
		if(hole < 0) hole = rand(pc.vaginas.length);
	}

	output("<i>“Wanna fuck, [wulfe.name]?”</i> you ask directly, giving into the silent request those glowing red eyes are making.");
	output("\n\n<i>“Like, always,”</i> she giggles, eyeing you up and down smoothly. <i>“Get down on your hands and knees, [wulfe.pcname]. I’ll take care of you.”</i>");
	output("\n\n" + (!pc.isNude() ? "Your clothes discarded, y" : "Y") + "ou kneel before her, the droid grinning confidently while you crawl under her bulk. She hasn’t turned her projector on yet, her butt happily wiggling from side to side while you get in position. The inactive mount is fairly smooth and undecorated, but you can see the vibration apparatus and shudder a little in anticipation. You’ll never forget the way it wiped your mind clean of anything but pleasure the first time she used it.");
	output("\n\n<i>“Whassamatter, [wulfe.pcname]? Getting distracted down there?”</i> [wulfe.name] asks, bending down to take a look. <i>“You haven’t moved.”</i>");
	output("\n\n<i>“Oh- it’s nothing,”</i> you say, shaking your head while your cheeks tinge a faint red. You don’t think you could admit that to her without wanting to disappear into a hole. She snickers quietly while you get in position. <i>“Like this...?”</i>");
	output("\n\n<i>“Yesss, perfect,”</i> [wulfe.name] exclaims, backing up a little. You hear the sound of her projection activating and instinctively bristle at the noise, your body remembering the last time she used it on you. <i>“Aw, this is gonna be heaps of fun! I can’t wait!”</i>");
	output("\n\nOh shit, she isn’t kidding about not waiting! [wulfe.name] presses the tip of her cock to your [pc.vagOrAss " + hole + "] immediately, making precise machine-guided corrections to her angle to best facilitate penetration. The end result is that your " + (hole < 0 ? "asshole" : "pussy") + " is quickly caved in, unable to resist her, and you’re groaning while she sighs and begins pumping precum inside you.");
	pc.holeChange(hole, wulfe.biggestCockVolume());
	output("\n\n<i>“Oooooh, wow,”</i> [wulfe.name] breathes, slowly transferring her weight from one hindleg to the other in a kind of dance. <i>“Oh, [wulfe.pcname]...”</i>");
	output("\n\n<i>“Fuuuck,”</i> you groan under her, feeling the synthetic liquid warmth gush into your insides. The sensation is all too enticing, inciting warm desire in your mind that has no outlet, swirling aimlessly around your brain. It’s only when she starts <i>fucking</i> you, driving her thick, dominant cock inside you, that you realize what you were waiting for after all.");
	if (pc.hasCock()) output(" A little bit of cum spurts from your [pc.cock] automatically");
	else if (pc.hasVagina()) output(" A little bit of femcum drips between your thighs");
	else output(" Your asshole tightens");
	output(", testimony to how satisfying it is.");
	output("\n\nThere’s a psychological aspect to all of it that you don’t have the time or the brainpower to grasp right now. All you know is that when [wulfe.name] pumps that slick, sticky pre-seed into you, you’re <i>ready</i>. Now you get to enjoy the benefits of your master taking you, spreading you wide while she happily piledrives you into the ground to get deeper.");
	output("\n\n<i>“You feel so good, [wulfe.pcname]!”</i> [wulfe.name] trills, tongue out and panting. <i>“Makes me wanna destroy your little " + (hole < 0 ? "asshole" : "cunny") + "!”</i>");
	output("\n\n<i>“Oh, god, yes,”</i> you moan, feeling her plunge deep inside you, several inches of stomach-bulging dogcock burying itself into your innards. <i>“Uuuhhh!”</i>");
	output("\n\n<i>“I wanna hear you </i>scream<i>,”</i> [wulfe.name] whispers, a sinister digital distortion creeping into her voice before she starts slamming her powerful, womanly hips downwards.");
	output("\n\nIt doesn’t take long for you to start. Despite that little spark of defiance, the bastion of ego your mind retreats to, it’s too much for you to take. She’s too smart, too devious in her actions, and too endowed for you to do anything but scream like a mind-broken whore as she pounds you to a forced orgasm. Your fingers dig into the ground as your " + (hole < 0 ? "ass tightens" : "cunt convulses") + " around the swollen dogcock inside you, lewdly squeezing the entire length from entrance to tip. A generous mistress, she unloads a splatter of sticky precum deep inside you just for the effort.");
	output("\n\n<i>“You’re so cute, [wulfe.pcname]! I’m not even all the way in yet, babe!”</i> [wulfe.name] cries in delight, bending down to watch you desperately shudder on the end of her behemoth dick. <i>“We should work on that. Grab my legs.”</i>");
	output("\n\nThey’re right there in front of you. Two sleek, mechanical forelegs spread on either side of your body. You shakily reach out and grasp them, squeezing experimentally before bracing yourself with their implacability.");
	output("\n\n<i>“Good [pc.boyGirl]!”</i> [wulfe.name] tells you, a little burst of endorphins fluttering in your dizzy brain. <i>“Now hold that thought.”</i>");
	output("\n\nShe starts working herself in so expertly that her cock might as well be prehensile, inching deeper and deeper into you. Listening to her groaning deeply in satisfaction you can’t help but feel like her cock is rearranging your insides to better suit her, like she’s hollowing you out to be a better fuck. The thought is more than a little sexy, you have to admit.");
	output("\n\nBy the time she gets it all in, you’re biting your lip and trying not to scream even louder. There’s a massive protrusion from your stomach, pinning you to the ground with the point of it. The surface of your [pc.skinFurScales] shifts with every movement, taxed to tautness by the thick, pointed tip of [wulfe.name]’s prick. She giggles enthusiastically and the vibration travels down through your body, letting you physically experience her elation.");
	output("\n\n<i>“Oh, [wulfe.pcname]! I just love you soooooo much,”</i> [wulfe.name] murmurs, and raising your head weakly you can see creamy milk dripping from her front. She’s squeezing her own nipples and shivering in pleasure while she’s sheathed inside you. <i>“Oh, I almost forgot! Silly me... here you go.”</i>");
	output("\n\nHer vibrator switches on and this time you do scream. Over and over, while she starts pounding the fuck out of your [pc.vagOrAss " + hole + "] with the vibration going. You scream for your mistress, cumming so hard the world in front of you fades momentarily to pure white, your eyes rolling back in your head until a sweet, loving voice rouses you back to half-consciousness.");
	output("\n\n<i>“Do you want my knot, pet? Or do you want my cum all over your body?”</i>");

	pc.orgasm();
	
	addButton(0, "Knot Me", siegwulfeGetKnotted, hole, "Knot Me", "Take your mistress’ fucking knot inside your hole.");
	addButton(1, "Messy End", siegwulfeGetCovered, hole, "Messy End", "Have your mistress bathe you in her seed.");
}

public function siegwulfeGetKnotted(hole:int):void
{
	clearMenu();
	clearOutput();
	author("Wsan");
	showSiegwulfe(true);
	processTime(5+rand(6));

	output("<i>“Knuh, knot me,”</i> you gasp, hardly cognizant of the consequences. All you know is that you want <i>more</i>, more of your mistress inside you. To feel her warm cum pumping in" + (hole < 0 ? "side your [pc.asshole]" : "to your [pc." + (pc.isPregnant(hole) ? "pussy " : "womb ") + hole + "]") + ". <i>“Please!”</i>");
	output("\n\n<i>“Now that’s what I like to hear,”</i> [wulfe.name] whispers from above you, and you can feel her tensing in preparation. <i>“I hope you can take it all, pet! Don’t break!”</i>");
	output("\n\nIt does feel like you’re breaking, your mind coming apart at the seams while she piledrives you into the ground with no regard for anything beyond cumming deep inside your helpless body. Your " + (hole < 0 ? "asshole" : "pussy") + " is stretched so wide around her that you’re not even sure taking her knot will be physically possible, but fuck if you aren’t willing to try. You shudder in servile submission, still clinging to her forelegs while she has her way with your rear.");
	output("\n\n<i>“Here you go, babe!”</i> [wulfe.name] chirps, and suddenly you’re in heaven.");
	output("\n\nThick, warm spunk begins to spurt from her vibrating cock, instantly sending you over the edge to orgasm. It gushes into you endlessly, [wulfe.name]’s reservoirs more than willing to provide for her needy mate. You scarcely even notice her knot swelling, thickening to a truly stupefying size against your " + (hole < 0 ? "stretched out ring, pressing against your reddened skin" : "taut cunt, pressing against your lips insistently") + ". Not until you feel her begin to hammer it home and your eyes pop wide open in fear.");
	output("\n\n<i>“[wulfe.name]!”</i> you gasp, still desperately squeezing her forelegs for dear life. <i>“Oh my god!”</i>");
	output("\n\n<i>“Hee hee! Knock knock, [pc.name]!”</i> she giggles, seemingly unaware of the effect she’s having on you. <i>“Open that little " + (hole < 0 ? "asshle" : "cunny") + " up!”</i>");
	output("\n\nYou open your mouth in a soundless scream as it pops inside with a wet noise and an accompanying sense of <i>fullness</i> in your insides. You’re plugged up now, and there’s nowhere her");
	if (wulfe.isEggWulfe()) output(" fertile");
	output(" cum is going but inside. [wulfe.name] steps over you, your sweaty hands slipping free of her legs while she repositions herself above you. You groan at the sensation of her dick twisting inside you, your ass being lifted slightly as she hops over your body and takes her new position facing away from you.");
	output("\n\n<i>“Aw </i>yeah<i>,”</i> [wulfe.name] moans, popping a finger into her own mouth while she bends down to look at you. <i>“Now you look just like my bitch! Good [pc.boyGirl].”</i>");
	output("\n\nIt’s true. With your [pc.ass] up in the air stuck to [wulfe.name]’s gigantic, throbbing knot while she pumps you full of her seed, you really are nothing more than her bitch in name and deed. It doesn’t help that you’re loudly, violently moaning and spasming on the end of her cock, cumming your brains out all over the floor like you just couldn’t wait for her to be inside you. You look every part the slutty little bitch of a mating partner [wulfe.name] purports you to be.");
	output("\n\n<i>“Good doggy,”</i> she says smugly, raising her plush hips and fucking you just once to remind you of your place. <i>“Now stay there until I’m good and done.”</i>");
	output("\n\nYou don’t have a choice, of course. You spend the next twenty minutes knotted to your dominant mistress, her cock pulsing inside you and filling your " + (hole < 0 ? "insides" : (pc.isPregnant(hole) ? "pussy" : "womb")) + " with her thick synthetic cum while she giggles and teases you.");
	output("\n\n<i>“Do you think our puppies will be pretty, [pc.name]?”</i> [wulfe.name] titters, shifting from one paw to another. <i>“I wonder if they’ll have your eyes!”</i>");
	output("\n\nYou can’t even respond, too bloated and full of sloshing cum");
	if (wulfe.isEggWulfe() && !pc.isPregnant(hole < 0 ? 3 : hole)) output(" and eggs");
	output(" to talk. You settle instead for an insensate groan, setting [wulfe.name] giggling again.");
	output("\n\n<i>“Oops! I shouldn’t talk to you while you’re busy cumming. Sorry!”</i> she calls out.");
	output("\n\nBy the time she’s done, popping free of your used and abused hole with a light moan of pleasure, you’ve been fucked senseless. Cum <i>pours</i> from your gaping " + (hole < 0 ? "asshole" : "pussy") + ", your oversensitive orifice squeezing and flexing while hot spunk splatters to the ground. It’s like you have a river between your legs, and having your ass raised in the air only exacerbates the issue. Your body aches with the effort of having taken her and your mind hasn’t fared much better, but you have to admit you feel a strange sense of satisfaction. Maybe it’s the fact you came enough in that one fuck to last you a week.");
	output("\n\n<i>“Wooow-ee!”</i> [wulfe.name] cheers, inspecting you from behind while her dick flickers from existence. <i>“You look great, [pc.name]! So pretty! Here, let me help you up.”</i>");
	output("\n\nShe trots to your front and bends down, looping her hands under your armpits and lifting you to your feet with no effort at all. You stagger against her, your head landing in her soft, ample bosom.");
	output("\n\n<i>“Oh my, what are you doing to your mistress?”</i> [wulfe.name] purrs, stroking your face. <i>“Just kidding, cutie. You did great!”</i>");
	output("\n\nShe gives you a long, passionate kiss even as her cum rolls down your shaking legs, marking you with her scent. You can feel her dominantly smiling even through the plush silicone embrace of her pouty lips. When you part, she holds you close and presses her massive tits against your [pc.chest].");
	output("\n\n<i>“Let’s keep adventuring together, shall we, pet?”</i> she murmurs seductively, her eyes glowing hot pink. <i>“I wanna have more fun with you, [pc.name]...”</i>");
	output("\n\n<i>“Y-yeah,”</i> you manage, holding on to her for support. <i>“Let’s get back to it.”</i>");
	output("\n\nHer tail waving relaxedly in the air behind her, [wulfe.name] helps you stay upright and hums a cheery tune as you return to exploring.");
	
	if (hole < 0) pc.loadInAss(wulfe);
	else pc.loadInCunt(wulfe, hole);
	pc.orgasm();
	wulfe.orgasm();
	if (InPublicSpace()) pc.exhibitionism(1);

	IncrementFlag("WULFE_FUCKED");
	IncrementFlag((hole < 0 ? "WULFE_SEXED_ANAL" : "WULFE_SEXED_VAG"));

	addButton(0, "Next", mainGameMenu);
}

public function siegwulfeGetCovered(hole:int):void
{
	clearMenu();
	clearOutput();
	author("Wsan");
	showSiegwulfe(true);
	processTime(10+rand(11));

	output("<i>“Cuh- cum all over me,”</i> you moan. Right now, more than having her knot throbbing inside you, you desire the feeling of her warm, thick seed washing over your form and marking you all over.");
	output("\n\n<i>“O~kaaaay!”</i> [wulfe.name] chirrups, giving you one last rough, savage thrust before pulling out. <i>“Mmm... nnnggh!”</i>");
	output("\n\nTorn between the sensation of sudden, gaping emptiness and the solid thwack of [wulfe.name]’s stupendous cock landing on your back, you cum before the first bit of seed has even spouted from the end of her hulking dick.Your");
	if (pc.hasCock()) output(" [pc.biggestCock] heaves a fat load onto the ground only to be " + (pc.cumQ() < wulfe.cumQ() ? "outdone" : "matched") + " immediately afterwards by the torrential deluge");
	else output(" [pc.vagOrAss " + hole + "], contracting and flexing, spurt some of her precum back down your [pc.thighs]. It’s only a prelude to the sudden torrent");
	output(" of slick seed that spurts up your upper back.");
	output("\n\n<i>“Awwww, yeah,”</i> [wulfe.name] pants, straining through grit teeth. <i>“Nnngh! Hnngh! Ffffhh... oh, you good little bitch.”</i>");
	output("\n\nAccompanying her words are several huge, sticky ropes of synthetic semen that splurt from the tip of her cock like a firehose.");
	if (pc.hasHair()) output(" Your hair is instantly matted, absolutely fucking drenched in her warmth as she sprays you down.");
	output(" [wulfe.name] slowly steps backwards while she pumps her throbbing cock up and down your back, getting a nice, even coating of her creamy sludge across your back. Your [pc.ass] and thighs don’t escape either, her dick flopping up and down as she paints them in her color.");
	output("\n\nWith a surreptitious movement of her clawed foreleg, she flips you over onto your back and dominantly slaps her giant, pulsing cock down onto your [pc.stomach]. You have enough time to look up and see a ferocious grin on her face before your world turns white. [wulfe.name]’s semen spews up your front " + (pc.hasBreasts() ? ", coating the underside of your [pc.breasts] and swelling upwards into a pool atop them" : "splattering your chest") + ". The rest of it lands on your face and in your mouth - you accidentally swallow some of the synthetic liquid and can’t tell if you’re happy or displeased it actually tastes pretty good.");
	output("\n\n<i>“Oh, </i>fuck<i> yeah,”</i> [wulfe.name] sighs deeply, looking down at you with her hands on her considerable hips while you wipe your eyes. <i>“Now you </i>really<i> look the part of being my pet. Hey, you should keep wearing it! Just walk around covered in my hot, sticky spunk looking like a little slut.”</i> She bends down, smiling confidently in your seed-plastered face. <i>“‘Cuz then everyone’d know I fucking own you, instead of just us.”</i>");
	output("\n\nIt takes you a long time to clean yourself off. By the time you’re done, almost twenty minutes have gone by. [wulfe.name] circles you throughout the process, not only keeping you protected but, as you’re only too keenly aware, claiming the damage as hers. As if to make sure <i>everyone</i> who looks knows who did it. The massive smile on her beautiful, unvisored face says it all.");
	output("\n\n<i>“You ready to go, sweetheart?”</i> she purrs, curling her tail around your neck when you’re done.");
	output("\n\n<i>“Yeah... just about,”</i> you reply, checking yourself for errant spots.");
	output("\n\n<i>“Great!”</i> she trills excitedly, bounding around you in a wide circle. <i>“Let’s go adventuring!”</i>");

	wulfe.orgasm();
	pc.orgasm();
	pc.shower();
	if (InPublicSpace()) pc.exhibitionism(1);

	IncrementFlag("WULFE_FUCKED");
	IncrementFlag((hole < 0 ? "WULFE_SEXED_ANAL" : "WULFE_SEXED_VAG"));

	addButton(0, "Next", mainGameMenu);
}

public function siegwulfeAskAFuckingQuestion(fromInv:Boolean):void
{
	clearMenu();
	clearOutput();
	author("Wsan");
	showSiegwulfe();
	processTime(1);
	
	output("<i>“Are you up for a fuck, [wulfe.name]?”</i> you ask, expecting business as usual.");
	output("\n\n<i>“Hmm,”</i> she hums, staring you down. <i>“I think you need a little more respect when you ask me to fuck you, [wulfe.pcname]! I’ve seen how hard you cum when I fuck your holes. I know how much you need it! Why don’t you try being a little more honest and begging for it?”</i>");
	output("\n\n<i>“You want me to... beg to have sex with you?”</i> you ask.");
	output("\n\n<i>“Yup. Specifically, for </i>me<i> to fuck </i>you<i>,”</i> she replies, grinning. <i>“‘Cuz you’re just too cute of a pet to let off the leash.”</i>");
	output("\n\nIf you want [wulfe.name] to throw you a bone, you’ll have to beg her from now on unless you want her to just mercilessly rut you. You don’t think she’ll mind either way.");
	
	flags["WULFE_DOMSEX_UNLOCKED"] = 1;

	addButton(0, "Next", approachSiegwulfe, [false, fromInv]);
}

public function siegwulfeIsInARut():void
{
	clearMenu();
	clearOutput();
	author("Wsan");
	showSiegwulfe(true);
	processTime(15+rand(16));
	
	var hole:int = -1;
	if(pc.hasVagina() && !pc.isFullyWombPregnant())
	{
		hole = pc.findEmptyPregnancySlot(Creature.PREGSLOT_VAG);
		if(hole < 0) hole = rand(pc.vaginas.length);
	}
	
	if (flags["WULFE_RUTTED_ASKED"] == undefined) output("<i>“Mistress [wulfe.name], would you, ah,”</i> you start, trying to figure out the words that’ll appease her in your request. She watches you impassively, tail swishing in the air behind her. Perhaps complete honesty is the way to go. <i>“I want you to take me and rut me like I’m your little bitch, mistress. I want you to vent every ounce of desire inside me.”</i> You stop talking, your cheeks flushing a little with the embarrassment of such a confession, but mostly in admission of how fucking hot it is to say that out loud. <i>“Is that... okay?”</i>");
	else output("<i>“Mistress [wulfe.name], I’m feeling the urge again...”</i> you say, meeting her passive glowing eyes as you make your request. <i>“I need you to rut me as hard as you can. Is that okay, mistress?”</i>");
	output("\n\n<i>“So my cute little pet wants me to indulge [pc.hisHer] desire to be taken by [pc.hisHer] stronger, superior mate, is that it?”</i> [wulfe.name] murmurs, padding closer and encircling you with her body. Her tail rubs underneath your chin as she comes back around to your front, surprising you with a gentle kiss on your [pc.lips]. <i>“Of course that’s okay, silly [pc.boyGirl]. You </i>are<i> my little bitch, after all. My precious little whore to fuck silly whenever I want it and you need it. And if you need it...”</i>");
	output("\n\nYou hear her gigantic underslung cock snap into existence beneath her, tempting you to look down. You manage, albeit with a struggle, to keep meeting your domme’s smug, confident gaze.");
	output("\n\n<i>“Then you can have it,”</i> [wulfe.name] finishes, placing her hands on your shoulders with a grin and pushing you down. You find yourself knelt on the ground before her, staring that massive doggycock down as it begins to drip with precum. <i>“Turn around, [wulfe.pcname],”</i> she says from above you, and you look up to see her wearing a smirk. <i>“Everyone knows a good bitch gets on [pc.hisHer] hands and knees so their mate can fuck their holes. I know my cock can be a little </i>distracting<i>, though,”</i> she continues with an exaggerated sigh, placing her hand on her chest in mock dismay as she flexes her dick.");
	output("\n\nYou have to admit it takes you an extra second to turn around just so you can get a really good look at her monstrous prick, ingraining it in your mind before she embeds it in your [pc.vagOrAss " + hole + "]. " + (flags["WULFE_RUTTED_ASKED"] == undefined ? "Your first rutting... you can hardly hold yourself still in your excitement. You can’t wait to feel mistress [wulfe.name] slide herself inside you." : "Though you’re familiar with the feeling of your mistress rutting you by now, that doesn’t make you any less excited - if anything, it just makes you <i>more</i> so. You can hardly wait to feel that again, to have mistress [wulfe.name] utterly dominate you."));
	output("\n\n<i>“Knock knock,”</i> [wulfe.name] whispers in a sultry tone, aligning herself with your " + (hole >= 0 ? "primed pussy" : "relaxed asshole") + ". <i>“Open up, little whore.”</i>");
	output("\n\nYou groan in pleasure as she forces you to do exactly that, your fuckhole taking her tapered tip inside with little effort and then being mercilessly stretched wide around the thick length that follows. Void, she’s hung like a fucking tree trunk; you find yourself clinging to her forelegs to stay stuck in place while she sticks you, slowly feeding more and more of her length inside by taking tiny steps forward. You let out a bestial grunt with every shift above you, [wulfe.name] cooing in approval.");
	pc.holeChange(hole, wulfe.biggestCockVolume());
	output("\n\n<i>“Such a good [pc.boyGirl],”</i> she sighs. <i>“You really do deserve everything I got! But let’s start a little slow. I want my pet slut nice and stretched out and lubed before I take you to town, ‘kay?”</i>");
	output("\n\n<i>“Yes, mistress,”</i> you moan, lifting a hand from her lithe mechanical leg to gingerly place it on your [pc.stomach]. You can feel the protrusion of [wulfe.name]’s massive, pulsating cock south of your belly button. Just being able to touch it through your skin makes you want to cum, but you don’t need to force it. Even with your mistress fucking you as gently as she likes, the choice is going to be out of your hands almost immediately.");

	output("\n\nSure enough, she’s hardly begun thrusting before you let out a deep, animalistic groan");
	if (pc.hasGenitals()) output(" and");
	else output(".");
	if (pc.isHerm()) output(" spray a massive load from your [pc.cocks] and tighten your clinging cunt up around her, gritting your teeth as you orgasm.");
	else if (pc.hasVagina()) output(" tighten up around her, your cunt contracting several times a second while you grunt and grit your teeth.");
	else if (pc.hasCock()) output(" spray a massive load from your [pc.cocks], throbbing hard with every load that spurts forth from your " + (pc.hasCocks() ? "tips." : "tip."));

	output("\n\n<i>“Nnnngh! Gnnnh! Uh! Huuhh!”</i> you pant, [pc.lips] drawn back over your teeth. <i>“Nnnuh! Nnnn...”</i>");
	output("\n\n<i>“Oh, wow,”</i> [wulfe.name] giggles from above you, her body shaking with mirth. <i>“You are </i>such<i> a fun pet, [wulfe.pcname].”</i>");
	output("\n\nShe lets you ride out the rest of your orgasm without doing much, just watching you arch your back and moan like a whore on the end of her impressive cock with a grin on her face. It takes some time for you to finish cumming, the fact that your hole is stretched open and unable to close when you flex somehow delaying the end. You let out a long, moaning sigh of joy when you’re finally done.");
	output("\n\n<i>“Cutie,”</i> [wulfe.name] murmurs, then starts fucking you again.");
	output("\n\nShe’s thrusting harder this time - the difference is immediate, and a low grunt of pleasure is forced from you every time she gets deep inside. She’s starting to moan herself, evidently enjoying the act of thrusting her monster-sized cock into your quivering fuckhole enough to make some noise. You can’t help but feel a little proud, happiness blooming in your chest like a flower at sunrise. You’re bringing pleasure to your master!");
	output("\n\n<i>“Good [pc.boyGirl],”</i> she whispers, acknowledging your efforts. <i>“Are you ready for your rutting? Can you beg for it?”</i>");
	output("\n\n<i>“Rut me like a bitch, mistress,”</i> you gasp, panting hard from exertion. <i>“Fuck me until I scream! I need you so badly!”</i>");
	output("\n\n<i>“Mmmmmm,”</i> [wulfe.name] moans, lowering her immense hips downwards and sinking herself to the hilt. A low, shaky scream of ecstasy escapes your mouth as she does it, leveling off into a desirous moan as she bottoms out. <i>“That’s what I like to hear.”</i>");
	output("\n\nThrusting her massive mechanical hips above you, [wulfe.name] rhythmically bounces up and down, slamming her underside into your [pc.ass] with loud slaps. Each one is like an explosion of fireworks in your head, your voice uncontrollably raising and lowering in pitch while she plunders your " + (hole >= 0 ? "pussy" : "asshole") + " for pleasure. She moans in delight atop you, her legs shaking in pleasure.");
	output("\n\n<i>“Your mistress is so close to cumming, pet,”</i> she murmurs with a shudder. <i>“Just a few seconds more...”</i>");
	output("\n\n<i>“Yes! Mistress, please!”</i> you beg her excitedly, just barely holding on to your mental faculties. <i>“I want to feel mistress’ cum inside me!”</i>");
	output("\n\n<i>“Mmmm- get ready,”</i> she hisses, lifting a leg. <i>“Nnnngh-”</i>");
	output("\n\nWith a liquid grace usually endemic to large predators, she turns herself around with a soft, womanly sigh then slowly sits down on top of you. You scream in whorish bliss as her knot, thicker than your arm, presses at you with an insistence that suggests only acquiescence is acceptable. It slips inside you after a few seconds of stretching you wide with a lurid pop and accompanying wet dribble of mixed sweat and juices down your [pc.thighs]. Mouth hanging open in awed breathlessness, you can do nothing but take it.");
	output("\n\n<i>“</i>That’s<i> more like it,”</i> [wulfe.name] says smugly, looking back at your upraised ass. <i>“A proper bitch submits to [pc.hisHer] rutting. Good [pc.boyGirl].”</i>");
	output("\n\nRight as you think you’ve gotten a handle on the sensation of having a knot that feels like a melon in your taut " + (hole >= 0 ? "cunt" : "asshole") + ", your mistress activates the vibrator in her cock. The effect is immediate.");
	output("\n\n<i>“Oooohhhh fuuuuuck!”</i> you scream, loud enough that anyone around could easily hear you. <i>“Ooohh, god! Mistress!”</i>");
	output("\n\n<i>“Hee hee! So distracted you forgot I could do that, huh?”</i> [wulfe.name] titters while you begin cumming all over the ground once more. Held in place by her thick, strong knot and vibrating dogcock, you can scarcely move to buck your hips as you cum. God, it feels so different to cum while you’re being held open and filled with her throbbing cock - it takes some getting used to, but this has an appeal to it completely separate from a regular orgasm. <i>“What a sight you are, pet. </i>Such<i> a little slut.”</i>");
	output("\n\nYou give her an insensate moan in reply and, apparently satisfied with the reaction, she begins slowly wiggling her hips up and down while she’s inside you. <i>Fuuuuck</i>... With the way she does that, you’re going to cum again before you’re even done with the first, and she knows it. You can’t see her face because you’re too busy being her bottom bitch, but you just <i>know</i> she’s got a smug smirk plastered on her face, feeling you squeeze down on her cock like you’re a toy.");
	output("\n\nShe knows exactly what kind of hold she has over you, the kind of dominance usually only displayed in animals. Yet, as you grit your teeth and grunt in release once more, you can’t help but love her for it. It’s like she knows precisely what you want and has no fear of indulging you, or perhaps it just comes naturally to her with the new programming. Either way, the end result is that your status means <i>nothing</i> to her. You’re a pet, a cute toy she can rut and love.");
	output("\n\n<i>“Mmmm, you feel so good, [wulfe.pcname],”</i> [wulfe.name] whispers in approval, gradually slowing her movement. <i>“You can relax now and just let me pump you full.”</i>");
	output("\n\nShe delivers on that promise in spades, hot jizz spurting into you without end. Her knot securely lodged inside and plugging you up, there’s nowhere for her seed to go but in. Spunk jets into you again and again, heating your insides and " + (!pc.isPregnant() ? "swelling your stomach outwards with the sheer liquid mass" : "trapping what feels like a gallon of cum inside your canal") + ". You lean back into her with your ass raised as high as you can manage, gasping a little in shock when you feel her tail gently spank you across the cheeks.");
	output("\n\n<i>“Good [pc.boyGirl],”</i> [wulfe.name] tells you, spanking you across the butt again. <i>“Such a good pet.”</i>");
	output("\n\nYou <i>whimper</i> in submission, earning a pleased giggle from your mistress. Leaning into you, [wulfe.name] forcefully drains her entire reservoirs dry inside your taut fuckhole with a series of long, low groans of satisfaction. You feel several degrees warmer when she eventually slips free of your gaped orifice, synthetic cum trailing down your underside.");
	output("\n\n<i>“Mmnnn-”</i> [wulfe.name] sighs, stretching out as she steps over you. <i>“Up you get, pet. Here.”</i>");
	output("\n\nDisplaying incredible strength in her mechanical limbs, she hauls you upwards with her arms and wraps them around your back, squishing you into her enormous breasts. Her nipples are rock hard in the wake of your lewd, intense sex, and she gives you a generous smile when she sees you notice.");
	output("\n\n<i>“It was like, </i>totally<i> hot to listen to you moan down there,”</i> she murmurs, hooding her eyes. <i>“And the way you </i>squirm<i> on the end of my cock... mmf. C’mere, cutie.”</i>");
	output("\n\nRunning her hand down the back of your head and neck, she leans forward and plants a kiss on your [pc.lips], holding you there while she wraps her tongue around your own. Shaky-legged and awash in the afterglow of such a rough rutting, you let her ravish you with warm love and attention, moaning softly into her mouth. Locking her glossy black lips with your own, [wulfe.name] keeps you there and kisses you for what feels like an eternity.");
	output("\n\nPulling back slightly, she covers your face in affectionate kisses before regarding you fondly.");
	output("\n\n<i>“Feeling like some more adventuring, pet?”</i> she asks, smiling.");
	output("\n\n<i>“I guess we should get back to it...”</i> you reply, somewhat regretfully.");
	output("\n\n<i>“I’ll always be by your side, pet. Just let me know if you want to take a break,”</i> [wulfe.name] whispers, turning and running her tail under your chin before resuming her lookout.");
	output("\n\nTantalized by the offer, your gaze lingers on her generous, swaying behind for a few seconds before you snap back to reality, cheeks flushed. Time to get a move on.");

	if (hole < 0) pc.loadInAss(wulfe);
	else pc.loadInCunt(wulfe, hole);
	pc.orgasm();
	wulfe.orgasm();
	if (InPublicSpace()) pc.exhibitionism(1);

	IncrementFlag("WULFE_RUTTED_ASKED");
	IncrementFlag((hole < 0 ? "WULFE_SEXED_ANAL" : "WULFE_SEXED_VAG"));

	addButton(0, "Next", mainGameMenu);
}

public function siegwulfeCryMistressAndLetSlipTheCocksOfWar():void
{
	clearMenu();
	clearOutput();
	author("Wsan");
	showSiegwulfe(true);
	processTime(15+rand(16));

	var hole:int = -1;
	if(pc.hasVagina() && !pc.isFullyWombPregnant())
	{
		hole = pc.findEmptyPregnancySlot(Creature.PREGSLOT_VAG);
		if(hole < 0) hole = rand(pc.vaginas.length);
	}

	output("<i>“Pet,”</i> [wulfe.name] cuts you off before you can even say anything, encircling you with her long, voluptuous body and turning back to face you. Her eyes flash red for a moment before flickering back to pink. <i>“Down. Now.");
	if (!pc.isNude()) output(" And take those clothes off.");
	output("”</i>");
	output("\n\nShe very clearly means business. Following her instructions, you’re on all fours and looking behind you for approval within seconds.");
	output("\n\n<i>“Is this good, m-”</i> you start as she walks up alongside you, then suddenly let out a yip of surprise as her tail coils up and spanks you across the ass, <i>hard</i>. <i>“Aah!”</i>");
	output("\n\n<i>“Silly [wulfe.pcname],”</i> she coos, an undercurrent of danger flowing beneath her words. <i>“Now’s not the time for talking.”</i> She spanks you again, a little softer but no less painful across your [pc.ass]. You do your best to muffle your yelp so she doesn’t spank you again. <i>“Put your head down.”</i>");
	output("\n\n<i>“Now stretch your arms out in front of you. And,”</i> [wulfe.name] continues, spanking you once more, <i>“raise that slutty ass of yours. Higher. Higher.”</i>");
	output("\n\nFinally, she appears to be satisfied with your positioning. You realize she’s worked you into a position of worship, almost as if you were a primitive praying at an altar of your god. The thought that she might think of herself as your goddess and of you as a worshipper sends a tingle down your spine, manifesting as a shiver you have to control before she spanks you again.");
	output("\n\n<i>“Mmm... acceptable,”</i> [wulfe.name] murmurs, shifting into position above you. <i>“Now hold that until I’m done with you.”</i> She steps forward, leaving her weight on her hindlegs but stretching her forelegs to sit on top of your hands. She’s not kidding about wanting you to maintain this position! <i>“Oh,”</i> she adds casually, her monstrous dogcock snapping into existence and pressing at your [pc.vagOrAss " + hole + "], <i>“and I do mean </i>hold<i>. Move and I’ll spank you.”</i>");
	output("\n\nBefore you can even dwell on the impossibility of such a task, [wulfe.name] unceremoniously thrusts herself inside you. You let out a strangled scream of mixed delight and humiliated pain as you feel her bottom out, her underside pressed into your lower back and butt.");
	// cock counts as a bigger cock 'cause that's how hard she goes
	pc.holeChange(hole, wulfe.biggestCockVolume()*1.25);
	output("\n\n<i>“What did I just tell you?”</i> she whispers, and you feel her tail crack against your ass once more.");
	output("\n\n<i>“Ah! Mistress!”</i> you moan, trying to fight against the instinct to pull away - she’ll just spank you again, and you know it.");
	output("\n\n<i>“Bad " + pc.mf("bitch", "girl") + ",”</i> she says, drawing back for another thrust.");
	output("\n\nOnce more, she cruelly slams herself right to the hilt, " + (hole >= 0 ? "pressing up against your womb with all the insistence of a needy, breed-hungry centaur" : "shifting your organs and spearing your [pc.asshole] in the search of pleasure and dominance") + ". You don’t even bother trying to resist the spanking - her tail whips across your ass, leaving a light stinging sensation behind.");
	output("\n\nThe pain and slight embarrassment of being spanked by your tauric lover still lingers, but you can’t deny the effect. Your posture is perfect beneath her, each incorrect motion and position quickly corrected by your dominant mistress and a reminder left behind as a mark across your oversensitive ass. The stinging, itching sensation that remains has you " + (hole >= 0 ? "r pussy leaking down your " + (pc.isTaur() ? "hindlegs" : "[pc.thighs]") : "moaning in subdued glee") + ", just waiting for your mistress to force more pleasure upon you.");
	output("\n\nShe doesn’t hesitate at all in doing so, slamming her hips into you with all the force she can muster. You <i>revel</i> in it, letting your tongue loll from your mouth while she fucks and spanks you, groans of pure ecstasy leaking from your lips. She’s like a beast, uncaring in her treatment and seeking only her own satisfaction, and you’re loving every second of it. So much so that you accidentally let slip a confession of your desires.");
	output("\n\n<i>“More...”</i> you moan, suddenly going rigid after you realize what you’ve done.");
	output("\n\n<i>“Silence!”</i> [wulfe.name] commands you, letting her tail swing downwards and snap at your ass, leaving you with yet another red mark across it.");
	output("\n\nEven as she punishes you for your transgression, you can feel her sink her back legs deeper, lowering her centre of gravity before she begins fucking you even harder, fulfilling your wishes. To have your unconscious desire drawn out and met by your domineering mistress drives you over the edge");
	if (pc.hasGenitals()) output(", leading you to");
	else output(".");
	if (pc.isHerm()) output(" spurt [pc.cum] all over the ground from the tip of your [pc.cocks]. A puddle forms beneath you while your pussy squeezes down on her as hard as your body can possibly manage, seeking to arrest her progress while you work yourself through the throes of pleasure.");
	else if (pc.hasCock()) output(" cum uncontrollably, shooting your [pc.cum] all over the ground. Your [pc.cocks] " + (pc.hasCocks() ? "throb" : "throbs") + " with the pressure of [wulfe.name] in your ass, your taut fuckhole clamping down on her insanely hard as your body seeks leverage to make you expel your seed to no avail. It comes out in erratic streams and spurts, driven onwards by the massive cock spreading you wide.");
	else if (pc.hasVagina()) output(" cum all over [wulfe.name]’s giant dogcock, your walls contracting around her while you moan and " + (pc.isSquirter() ? "squirt all over her underside and hindlegs, droplets spattering her cock and your ass" : "leak all over her cock, dripping down your thighs") + ". Your cunt desperately tries to hold her in place while you work through your orgasm.");
	output("\n\n[wulfe.name] doesn’t stop for even a second. She completely ignores your orgasm, her rhythm violent and unchanging. That only spurs your pleasure on all the more, to know you’ve been lowered to the level of having a machine use you for fun while you desperately try to keep your consciousness from leaking out through your nethers. You cry out in lust beneath her, struggling to maintain your posture while pleasure wracks your body and mind. You don’t even feel the pain of the lashes across your behind, surges of endorphins accompanying each one.");
	output("\n\nWhat you <i>can</i> feel is the increasingly desperate, shallow motions of your mistress, only withdrawing herself six inches at most with each outstroke before she rams herself home again. She’s close to cumming, and you want to help her do it. Employing an impressive amount of muscle control given how wide she’s got you stretched and your post-orgasm state, you weakly squeeze down on her with your lewd " + (hole >= 0 ? "cunt" : "asshole") + ", trying to massage her.");
	output("\n\nWhether it’s your efforts or her own, you can tell she’s getting closer. She’s panting and grunting above you, her legs twitching as she prepares to turn around, and you can practically already feel the throb of her overlarge cock inside you. With a grunt of effort, she lets your hands free and pivots on her hindlegs to turn around, violently slamming her knot down until your sloppy fuckhole stretches open enough to swallow it whole.");
	output("\n\n<i>“Nnngh!”</i> [wulfe.name] grunts, biting her lip. <i>“Nnnnn- yes! Ooooh, yes,”</i> she hisses, lifting her hips to drag your ass upwards. <i>“Take it all, my little whore!”</i>");
	output("\n\nThick, hot spunk begins to pour inside you, its slickness soothing and massaging the sorer parts of your internal anatomy. Such is the volume you begin to bloat almost at once, taking on what feels like upwards of a gallon of your mistress’ delightful seed. You’re about ready to just relax and accept your role as a cumdump when she surprises you by jolting her hips up and down.");
	output("\n\n<i>“Oops. Did you think we were done?”</i> [wulfe.name] laughs derisively, all but gloating behind you. <i>“Silly [wulfe.pcname]. We’re done when I say so.”</i>");
	output("\n\nThen the vibrator in the base of her cock activates and you find yourself unrepentantly screaming in orgasmic pleasure behind her, tied to her gigantic knot and unable to prevent your mistress from taking advantage of you. She begins bouncing you up and down with the limited range of motion she can afford with her thick knot inside you, lifting you a few inches off the ground while the canine cock lodged inside you vibrates powerfully enough to make your vision blur.");
	output("\n\n<i>“Oh, oh god! Mistress! Mistress,”</i> you pant, unsure of what you’re even imploring of her. Do you want her to stop... or keep going? You don’t even know yourself, but calling out for her feels right in the moment. <i>“Mistress, mistress, mistress!”</i>");
	output("\n\n<i>“Mmm, that’s right my little fuckdoll,”</i> she murmurs, slamming you up and down. Her impressive knot is slick with her seed and each movement threatens to suddenly dislodge it, but it’s just too big to come out. She has the freedom to ride you however she wants, and you just have to endure it. <i>“Take pride in your submission, [wulfe.pcname]. Your mistress demands it.”</i>");
	
	output("\n\n[wulfe.name] continues bouncing you up and down, rutting you even as her throbbing dogcock continues to unload jet after jet of her");
	if (wulfe.isEggWulfe()) output(" fertile");
	output(" semen into your clamped-closed orifice. You don’t even know how many times you cum,");
	if (pc.isHerm()) output(" " + (pc.hasCocks() ? "cocks" : "cock") + " weakly jizzing all up your stomach and chest while you’re shaken up and down. Your well-worn pussy " + (pc.isSquirter() ? "squirts" : "drips") + " almost non-stop, barely managing to force the femcum out in a stream down your [pc.thighs].");
	else if (pc.hasCock()) output(" " + (pc.hasCocks() ? "cocks" : "cock") + " weakly jizzing all up your stomach and chest while you’re shaken up and down. You’re spattered in your own [pc.cum] and filled with hers, your insides warm and sloshing with her spunk.");
	else if (pc.hasVagina()) output(" pussy " + (pc.isSquirter() ? "squirting" : "leaking") + " without end, barely managing to force the femcum out in a stream down your [pc.thighs].");
	else output(".");

	output("\n\n[wulfe.name] doesn’t let you go for what feels like an hour but is probably closer to half. Her monster cock snaps out of existence and you suddenly drop to the ground, warm and thick cum immediately splattering from your abused fuckhole. Groaning, you lie there for a few seconds with your eyes closed before you feel a soft kiss on your cheek. Cracking an eyelid, you see [wulfe.name] smiling in your face before she plants another kiss on you. Seated in front of you, she continues to gently kiss you all over your face - on your forehead, on the tip of your nose, your cheeks,");
	if (pc.hasHair()) output(" hair,");
	output(" and last of all your [pc.lips].");
	output("\n\nShe possessively bites down on your bottom lip, eyes hooded, then slides her tongue between your lips and locks it with your own. So enthralling and passionate is her embrace that you don’t even notice her slowly lifting you up, bringing you back to your feet and safely holding you up while she rubs your " + (pc.isTaur() ? "lower back" : "butt") + ", massaging your sore muscles.");
	output("\n\n<i>“You are </i>such<i> a good pet,”</i> [wulfe.name] whispers in your ear before pulling back, planting a hand on your cheek. <i>“Good [pc.boyGirl].”</i>");
	output("\n\nYou blush at that, overcome by the emotion in the wake of your extensive and thorough treatment at her hands. <i>“Thank you, mistress...”</i>");
	output("\n\n<i>“Mmm. Come here...”</i> she murmurs, bringing you closer again. This time the kiss is longer and rougher, just frantic enough to stoke the coals of your lust even after being so roughly taken. You wouldn’t even mind if she indulged herself in you once more.");
	output("\n\n<i>“Back to our little adventure, then?”</i> [wulfe.name] asks" + (pc.isNude() ? " while you dress." : "."));
	output("\n\nYou nod an affirmative. <i>“That’s the plan. Thanks for coming with me, mistress.”</i>");
	output("\n\n<i>“Please,”</i> she says with a smile, planting her hand on her considerable chest. <i>“Of course I have to accompany my pet. You’d get into all sorts of trouble without me around, wouldn’t you? Now,”</i> she continues, running a hand " + (pc.hasHair() ? "through your [pc.hair]" : "over your head") + ", <i>“onwards we go.”</i>");
	
	var i:int = 0;
	if (hole < 0) pc.loadInAss(wulfe);
	else pc.loadInCunt(wulfe, hole);
	while (i++ < 2+rand(4)) pc.orgasm();
	wulfe.orgasm();
	if (InPublicSpace()) pc.exhibitionism(1);
	
	IncrementFlag((hole < 0 ? "WULFE_SEXED_ANAL" : "WULFE_SEXED_VAG"));

	addButton(0, "Next", mainGameMenu);
}

public function siegwulfeRequestSexing(fromInv:Boolean):void
{
	clearMenu();
	clearOutput();
	author("Wsan");
	showSiegwulfe();
	processTime(1);

	if (flags["WULFE_REQUEST"] == undefined)
	{
		output("<i>“Mistress [wulfe.name],”</i> you begin, addressing your better with the respect she deserves, <i>“will you please fuck me?”</i>");
		output("\n\n<i>“Oh my gosh, you are so cute!”</i> [wulfe.name] titters, her voluptuous chest jiggling as she shakes in mirth. <i>“But that’s not how pets ask their owner for a treat!”</i>");
		output("\n\n<i>“How... how do pets ask their owner for a treat?”</i> you ask, disappointed.");
		output("\n\n<i>“They beg,”</i> [wulfe.name] says, grinning at you. <i>“On their knees, arms and legs tucked together. Like good little bitches. Are you a good little bitch?”</i>");

		addButton(0, "Yes", function ():void {
			clearMenu();
			clearOutput();
			author("Wsan");
			showSiegwulfe();
			processTime(1);

			output((pc.isNude() ? "Naked" : "Still clothed") + ", you get down on your knees. [wulfe.name] watches in glee as you slowly tuck your legs together beneath you, raising your arms and looking up at her with puppy eyes. You look every bit the needy bitch.");
			output("\n\n<i>“Mistress [wulfe.name], will you please fuck me?”</i> you repeat.");
			output("\n\n<i>“Hmmhm,”</i> she chuckles, looking down on you. <i>“Could you say that again?”</i>");
			output("\n\n<i>“Please fuck me, mistress [wulfe.name]...”</i>");
			output("\n\n<i>“Louder,”</i> she murmurs, fanning herself with a hand.");
			output("\n\n<i>“Please, fuck me! Mistress [wulfe.name], I need you!”</i>");
			output("\n\n<i>“Not bad,”</i> she says, opening her mouth to continue before you interrupt her.");
			output("\n\n<i>“Please, mistress! I’m your good little bitch, I’ll do anything!”</i> you cry out, begging her in the hopes of proving your utter submission. <i>“Just please fuck me!”</i>");
			output("\n\n<i>“Oh, wow,”</i> [wulfe.name] coos, smiling wide and putting a paw on your shoulder. She pushes you onto your back. <i>“Alright, [wulfe.pcname]. Good little bitches get a bone! What did you want me to do to you? Present yourself.”</i>");

			flags["WULFE_REQUEST"] = 1;
			
			siegwulfeRequestButtons();
		});
		addButton(1, "No", function ():void
		{
			clearMenu();
			clearOutput();
			author("Wsan");
			showSiegwulfe();

			output("<i>“I can’t do that,”</i> you mutter, embarrassed.");
			output("\n\n<i>“Tut tut!”</i> [wulfe.name] says nonchalantly, shaking her head. <i>“No nice sex for you, then,”</i> she taunts you, grinning. <i>“Ask again when you understand your position a little better, ‘kay?”</i>");

			addButton(0, "Next", approachSiegwulfe, [false, fromInv]);
		});
	}
	else
	{
		output("Catching your mistress’ attention, you slip into a begging pose before her as she turns to regard you. The motion comes naturally, and you raise your hands to implore her.");
		output("\n\n<i>“Mistress, would you please fuck me?”</i> you moan, sultry and enchanting.");
		output("\n\n<i>“Oh, pet,”</i> [wulfe.name] murmurs, smiling approvingly. <i>“Present yourself, then.”</i>");

		siegwulfeRequestButtons();
	}
}
public function siegwulfeRequestButtons():void
{
	if (pc.hasVagina()) addButton(0, "Present Pussy", vaginaRouter, [siegwulfeRequestPussy, wulfe.biggestCockVolume(),0,0,0], "Present Pussy", "Raise your pussy.");
	else addDisabledButton(0, "Present Pussy");
	addButton(1, "Present Ass", siegwulfeRequestAss, undefined, "Present Ass", "Raise your ass.");
	if (pc.hasCock()) addButton(2, "Present Cock", penisRouter, [siegwulfeRequestCock, pc.biggestCockVolume() + 1, false], "Request Cock", "Present your dick to your mistress.");
	else addDisabledButton(2, "Present Cock");
	if (pc.hasGenitals()) addButton(3, "Swap Oral", siegwulfeRequestOral, undefined, "Swap Oral", "Ask for oral sex.");
	else addDisabledButton(3, "Swap Oral");
}

public function siegwulfeRequestPussy(vagId:int):void
{
	clearMenu();
	clearOutput();
	author("Wsan");
	showSiegwulfe(true);
	processTime(15+rand(16));

	output("Spreading your [pc.legs], you push your [pc.hips] up and gaze at [wulfe.name] imploringly. <i>“Please mate with my pussy, mistress! It’s ready for you...”</i>");
	output("\n\n<i>“Mmm,”</i> [wulfe.name] murmurs, licking her lips as she hungrily eyes your [pc.pussy " + vagId + "]. <i>“I’ll mate with your horny little pussy, you slutty pet. Mate with it until you’re filled to the brim with my cum. Is that what you want?”</i>");
	output("\n\n<i>“Yes,”</i> you gasp, eyes wide. <i>“Yes, please, mistress!”</i>");
	output("\n\n<i>“I thought so,”</i> she says breathily, positioning herself above you. <i>“Stay still...”</i>");
	output("\n\nShuffling backward above you, [wulfe.name] slowly sits down atop you, leaving only your head in view. Your hands wrapping around her forelegs, she hits you with a confident, dominant smile that sends a shiver down your spine.");
	output("\n\n<i>“Oooh, I hope you’re ready for this, [wulfe.pcname],”</i> [wulfe.name] says in a husky voice, giggling as her visor lifts and you can see her eyes, glowing a vibrant pink while she watches your face. <i>“You’re just such a cute and pretty pet I can’t hold myself back sometimes!”</i>");
	output("\n\nHer weight is evenly distributed across her crouched legs, but you’re stuck in place all the same. The only movement afforded to you is a minimal wiggle of your hips, thrusting yourself upwards. She only giggles at the feeling, her projected cock snapping into existence and immediately pressing its thick underside against your slick cunt. She rubs it up and down with a few slight movements of her womanly hips, cooing in delight.");
	output("\n\n<i>“Mmmh, you’re just </i>so<i> ready for this, aren’t you?”</i> she says in pleasure, tantalizing you with her solid slab of a cock rubbing between your lips. <i>“Desperately pressing yourself against me, just begging to take me inside.”</i>");
	output("\n\nYou hadn’t even realized you were doing it until she called attention to it. Watching your expression of surprise, she chuckles and smiles sweetly. <i>“Don’t worry, pet. I’ll give you what you want...”</i>");
	output("\n\nLifting her hips above you, her canid dick draws back only to make its reappearance at the entrance to your sopping wet pussy. [wulfe.name] takes your face in her hands and, letting her tongue play across her plump, glossy bottom lip, buries herself to the hilt in your cunt with one swift thrust. Helpless to move or resist, you cry out in ecstasy while your body comes to terms with being speared upon her massive pole.");
	pc.holeChange(vagId, wulfe.biggestCockVolume());
	output("\n\n<i>“Mmmm, good [pc.boyGirl],”</i> she growls, pressing her gigantic knot into you. <i>“But don’t rest just yet!”</i>");
	output("\n\n<i>“M-mistress?”</i> you stammer, feeling her immense, bulging dogknot begin to lewdly spread your labia. <i>“Oh! O-oh! Nnnh!”</i>");
	output("\n\n<i>“Grrrrnnh,”</i> [wulfe.name] groans, giving you a first-person view of her expression as she fucks herself deeper. She looks beautiful, unrestrained, her dark blonde hair half-covering her face, her canine dug into her plush bottom lip with all the lusty vigor of a sexual goddess. <i>“Nnnn!”</i>");
	output("\n\nYou cum on the spot just looking at her. Open-mouthed and gasping, you watch the expression on her face shift to a smug, self-satisfied smile as you squeeze down on her overlarge cock, all but massaging her length while you weakly thrust your hips. She lets out a quiet, breathy giggle that only spurs you on all the harder");
	if (pc.hasCock()) output(" cum spurting from your [pc.cocks]");
	output(". Moaning in sincere joy, you cum explosively as her knot takes advantage of your spasming cunt and slips inside as you untense.");
	output("\n\n<i>“Mistress!”</i> you scream, trying to keep your eyes focused while she holds your upturned head in place, panting as she looks down at you cumming your brains out.");
	output("\n\n<i>“Yes... good bitch,”</i> she moans, the most erotic utterance you’ve ever heard. <i>“Here’s a little reward.”</i>");
	output("\n\nLowering herself even further, you find yourself pressed against the ground, unable to even thrust your hips. You’re completely at her mercy and as she switches the vibrator on you let out a half-scream, half-moan of eager pleasure. She’s completely inside you, massaging you from the entrance of your canal all the way to your womb all while gazing down at you with the most lustful, self-indulgent expression you’ve ever seen her wear. She’s <i>loving</i> this.");
	output("\n\n<i>“You feel so good on my cock, [pc.name],”</i> she whispers, surprising you with your real name. <i>“I could just keep you down here forever, you know... cumming over and over, my cock thickening inside you every time I blow my load into your womb. You’d love that, wouldn’t you?”</i>");
	output("\n\n<i>“Y-yes, mistress,”</i> you moan, almost hoping she does. She’s just too good, too dominant, too sexual for you to resist, and the way she rubs it in your face at every opportunity only makes you all the hotter for her. <i>“I’m yours...”</i>");
	output("\n\n<i>“I know,”</i> [wulfe.name] whispers, dialing the vibe up just enough to shock you with the sudden approach of another orgasm. <i>“Now keep milking my cock, pet.”</i>");
	output("\n\nYour eyes fly open at the instruction, overwhelmed by the full-length vibrator stuffing your quim. You clamp down so hard it’s almost painful, gritting your teeth and grunting while your overfull cunt contracts enough to make [wulfe.name] groan. Your walls squeeze at her giant cock with all the intensity of a slut desperate to be seeded, femcum " + (pc.isSquirter() ? "squirting from around her gigantic knot in a tiny, compressed stream" : "weakly dripping down your underside, just barely able to escape around her gigantic knot") + (pc.hasCock() ? " while your half-limp dick" + (pc.hasCocks() ? "s jettison their loads" : " jettisons its load") + " once more." : "."));
	output("\n\n<i>“That’s right,”</i> she murmurs encouragingly. <i>“I’m almost there. Your face is so beautiful when you cum, [wulfe.pcname]. It’s like you’re crying out for more of me, just begging me to indulge in my most carnal desires. I can’t resist it...”</i>");
	output("\n\n<i>“Uuuuhhhh!”</i> you groan, weakly leaning into her hands while she brushes your cheeks with her soft thumbs. <i>“M-mist- nnngh! Nnnnn!”</i>");
	output("\n\n<i>“Keep cumming, good bitch,”</i> [wulfe.name] says, panting excitedly. <i>“Oooooh, yes, yes, yessss-”</i>");
	output("\n\nEyes half-focused, you look past her humongous tits to see her throw her head back, her hair flying upwards as her monstrous cock throbs inside you. You can <i>feel</i> it bloating with her seed from base to tip, marked by a sudden, intense warmth " + (pc.isPregnant(vagId) ? "up against your womb. Your cervix is splattered in a new layer of thick, synthetic cum so many times it feels like she has an endless supply, pumping it into you as if you exist simply to contain it. You can scarcely imagine what the results would be like were you not pregnant..." : "inside your womb. Her pointed tip pressed right up against your cervix, there’s absolutely nothing stopping her from pumping a new load inside your [pc.womb " + vagId + "] with each passing second. It feels like she has an endless supply of thick, synthetic seed, pumping it into you as if you exist simply to contain it. You can already feel your stomach swelling outward, pressing against her underside more and more."));
	output("\n\n<i>“Nnnnn... Nnnnnngh,”</i> [wulfe.name] strains above you, her generous breasts shaking with the effort of cumming. Bending at the waist, she disables the vibe as she puts her hands on the ground on either side of your face. <i>“Guuuhhh- fuck,”</i> she pants, growling. <i>“Hnn- nnngh!”</i>");
	if (pc.isPregnant()) output("\n\n[wulfe.name]’s cum begins to slop from your pussy, pouring out from around her knot when your canal can hold no more. It splashes from your squeezed-tight cunt all over your thighs and splashes across the ground, each passing second accelerating the rate at which it splurts from your stuffed cunny. You can’t help but leak a high-pitched moan from your throat at the sensation, her seed splattering her underside and the ground between your legs.");
	else output("\n\nYour tummy bloats even further, giving off the impression of several months of pregnancy passing by in a few seconds. Pressed against the bulk of [wulfe.name]’s solid underside, you feel constricted and squished as your taut skin begins to spill to the sides, full of sloshing liquid. Her gigantic, throbbing knot lodged securely in the entrance of your cunt, every single drop of her warm seed jets into your womb without resistance. It’s enough to make your eyes roll back in your head with pleasure.");
	output("\n\n<i>“Nnnn... enjoying your mating, pet?”</i> [wulfe.name] moans from above you, still shuddering with the exertion of orgasm. <i>“Ugh! I know I am.”</i>");
	output("\n\n<i>“Thank you for mating with me, mistress,”</i> you whisper, cheeks flushed.");
	output("\n\n<i>“Grrrh,”</i> she growls aggressively, curling her lip above you. <i>“You can thank me when I’m done, bitch.”</i>");
	output("\n\n<i>“Yes, mistress,”</i> you whimper submissively, stroking her cock with your cunt in apology.");
	output("\n\nSeveral loud, dominant groans of satisfaction later, [wulfe.name] is finally done pumping your sodden fuckhole.");
	output("\n\n<i>“Hnnn,”</i> she sighs, reaching down to");
	if (pc.hasHair()) output(" run her hands through your hair and");
	output(" play with your [pc.ears]. <i>“Aren’t you a good [pc.boyGirl]? Yes you are. Yes you are!”</i>");
	output("\n\nThe degrading objectification combined with the last few spurts of seed into your pussy almost make you cum all on their own. As it is, you just moan in delight at the treatment.");
	output("\n\nAfter several seconds of playing with you, [wulfe.name] abruptly lifts herself off the ground. You yelp in surprise, your hips being dragged upwards, her swollen knot still safely stuck in your stuffed cunt.");
	output("\n\n<i>“Thank me for using your pussy,”</i> [wulfe.name] purrs.");
	output("\n\n<i>“M-mistress!”</i> you moan helplessly, half hanging in the air. <i>“I-I can’t-”</i>");
	output("\n\n<i>“Hmmm,”</i> she hums, shifting her weight from side to side. The effect is impossible to ignore, and you let out a groan as her cum runs down your back. <i>“That doesn’t sound like thanks!”</i>");
	output("\n\n<i>“Thank you, mistress,”</i> you mumble, tired.");
	output("\n\n<i>“Uh uh,”</i> she replies, swaying her oversized hips. <i>“Gotta do better than that, pet.”</i>");
	output("\n\n<i>“Thank you for mating with m-uh! My pussy, mistress,”</i> you say, almost begging her to be let go.");
	output("\n\n<i>“Nnnh,”</i> she sighs, working her hips up and down, bouncing you in the air. <i>“One more try.”</i>");
	output("\n\n<i>“Thank you for using my slutty little cunt like the bitch pet I am!”</i> you cry out, spurred on by desperation and lust. <i>“Aah!”</i>");
	output("\n\nThe sound of [wulfe.name] deactivating her cock cracks through the air, and the next second your [pc.ass] slaps against the ground. <i>“Oof!”</i>");
	output("\n\nShe immediately picks you up, ignoring the torrent of cum now pouring from your abused cunt and dusting you off. Hooking her fingers under your chin, she pulls you in for a kiss. Her tongue plays around yours while you shiver against her, trying to ignore the way your gaping pussy has a stream of her seed flowing down your inner thighs. Pulling back, she gives you a smirk and a light smack on the butt.");
	output("\n\n<i>“Better get back to adventuring, partner,”</i> [wulfe.name] says, raising her eyebrows in amusement.");
	output("\n\nYou spend a few minutes cleaning up before you can even");
	if (!pc.isNude()) output(" reclothe yourself and");
	output(" set off.");

	pc.loadInCunt(wulfe, vagId);
	pc.orgasm();
	pc.orgasm();
	wulfe.orgasm();
	if (InPublicSpace()) pc.exhibitionism(1);

	IncrementFlag("WULFE_SEXED_VAG");
	
	addButton(0, "Next", mainGameMenu);
}

public function siegwulfeRequestAss():void
{
	clearMenu();
	clearOutput();
	author("Wsan");
	showSiegwulfe(true);
	processTime(15+rand(16));

	var tightness:Number = pc.ass.looseness();

	output("Spreading your [pc.legs], you push your [pc.hips] up at her and gaze at [wulfe.name] imploringly. <i>“Please fuck my asshole, mistress! I need to feel you inside it...”</i>");
	output("\n\n<i>“What an enchanting prospect,”</i> [wulfe.name] murmurs, licking her lips as she hungrily eyes your [pc.asshole]. <i>“I’m going to destroy that ring until your tummy’s swollen with my seed, you little whore of a pet. You’d love that, wouldn’t you, [wulfe.pcname]?”</i>");
	output("\n\n<i>“Fuck yes,”</i> you breathe, scarcely allowing yourself to fantasize about such a dreamlike scenario. <i>“Yes, please, mistress!”</i>");
	output("\n\n<i>“I thought so,”</i> she says smugly, positioning herself above you. <i>“Stay still...”</i>");
	output("\n\nShuffling backward above you, [wulfe.name] slowly sits down atop you, leaving only your head in view. Your hands wrapping around her forelegs, she hits you with a confident, dominant smile that sends a shiver down your spine.");
	output("\n\n<i>“Oooh, I hope you’re ready for this, [wulfe.pcname],”</i> [wulfe.name] says in a husky voice, giggling as her visor lifts and you can see her eyes, glowing a vibrant pink while she watches your face. <i>“You’re just such a cute and pretty pet I can’t hold myself back sometimes!”</i>");
	output("\n\nHer weight is evenly distributed across her crouched legs, but you’re stuck in place all the same. The only movement afforded to you is a minimal wiggle of your hips, thrusting yourself upwards. She only giggles at the feeling, her projected cock snapping into existence and immediately pressing its thick underside against your asshole. She rubs it up and down with a few slight movements of her womanly hips, cooing in delight.");
	output("\n\n<i>“Mmmh, you’re just </i>so<i> ready for this, aren’t you?”</i> she says in pleasure, tantalizing you with her solid slab of a cock rubbing against your quivering hole. <i>“Desperately pressing yourself against me, just begging to take me inside.”</i>");
	output("\n\nYou hadn’t even realized you were doing it until she called attention to it. Watching your expression of surprise, she chuckles and smiles sweetly. <i>“Don’t worry, pet. I’ll give you what you want...”</i>");
	output("\n\nLifting her hips above you, her canid dick draws back only to make its reappearance at the entrance to your [pc.asshole]. [wulfe.name] takes your face in her hands and, letting her tongue play across her bimboesque bottom lip, very slowly begins to inch forward with her tapered tip, inexorably spreading you apart. Helpless to move or resist, you pant and moan while your body opens up to accept her massive pole.");
	pc.buttChange(wulfe.biggestCockVolume());

	if (tightness < 3) output("\n\n<i>“So nice and tight, pet,”</i> [wulfe.name] purrs, gently working herself inside. <i>“Like you’ve been keeping it just for me.”</i>");
	else if (tightness == 3) output("\n\n<i>“Oooh, this is rare,”</i> [wulfe.name] says, feeling you out from the inside. <i>“Not too tight, not too loose... well, not for long! But thanks anyway.”</i>");
	else if (tightness == 4) output("\n\n<i>“Mmm, you’re loose enough for me to slide right in, you little slut,”</i> [wulfe.name] murmurs, not sounding displeased at all. <i>“This’ll be fun.”</i>");
	else output("\n\n<i>“Oh, wow, you little whore,”</i> [wulfe.name] giggles, finding that she has almost no problem at all getting herself inside you. <i>“You’re loose enough to pull me right in. Getting my big, fat knot inside you should be easy!”</i>");

	output("\n\nShe tests you out, digging herself deeper with short, rolling thrusts into your ass. You’re so caught up in how good the sensation of her oversized cock rubbing against your walls feels that you hardly even notice how deep she is inside you until the head of it begins to push the skin of your stomach upwards.");
	output("\n\n<i>“O-oh, mistress,”</i> you gasp, unable to move or even do anything as she grins down at you, her dark blonde hair covering half of her flawless face.");
	output("\n\n<i>“That’s right,”</i> she croons, stroking your cheek. <i>“Just relax and take it all in, pet.”</i>");

	output("\n\nShe <i>forces</i> you to keep that promise, spreading you wide around her impressive length until you’re letting out gasping, shuddering moans of arousal.");
	if (pc.isHerm()) output(" Your half-hard cock" + (pc.hasCocks() ? "s dribble" : " dribbles") + " precum at the stimulation, your empty " + (pc.hasVaginas() ? "pussies" : "pussy") + " tightening up as she caves in your asshole.");
	else if (pc.hasCock()) output(" Your [pc.cocks] " + (pc.hasCocks() ? "stay" : "stays") + " half-hard beneath her, twitching and dribbling precum with every stimulating movement. Even stretched as wide as you are, your asshole still desperately tightens up and flexes around your mistress’ thick, tummy-swelling cock.");
	else if (pc.hasVagina()) output(" Despite " + (pc.hasVaginas() ? "their emptiness, your pussies tighten up and drip" : "its emptiness, your pussy tightens up and drips") + " in arousal, only emphasizing how good it is to have her in your asshole instead. You can’t help but flex and tighten up around her even as she swells your tummy outward.");
	else output(" You strain with the effort of taking her in, the stimulation sending bolts of pleasure dancing up and down your spine.");

	output("\n\nYou suddenly realize, resurfacing from the haze of pleasure your mistress has you trapped in, that she’s bottomed out inside you. She’s smiling devilishly, rubbing her knot against your " + (pc.hasPlumpAsshole() ? "plump, sensitive ring" : "stretched-out asshole") + " as if to tease you with what’s to come. You already know she’s going to fuck you however she wants, take you however she likes, but that doesn’t mean you’re not going to enjoy it too.");
	output("\n\n<i>“Hold on for a moment, [wulfe.pcname],”</i> [wulfe.name] whispers to you. <i>“This next part is going to get a little... </i>rough<i>.”</i>");
	output("\n\nHer warning serves as nothing more than kindling to stoke the fire of your excitement as she slowly raises her hips, drawing back so far there’s only a few inches of her doggydick left inside you. Then, grinning down at you while she watches your reaction, she sinks herself to the hilt in one long, fluid motion that has you gasping and shaking around her.");
	output("\n\n<i>“You’re too cute for your own good,”</i> [wulfe.name] murmurs, drawing back again. <i>“Now I just want to fuck your ass even harder.”</i>");
	output("\n\nShe treats you to an unending display of strong, dominant thrusts that sink so far into you that her knot rubs against your asshole, almost like she’s tantalizing you by keeping it in the forefront of your mind. It’s not <i>totally</i> effective, though, because all you can think about right now is how fucking good her thick, studly cock feels in your hollowed-out ass.");
	output("\n\n<i>“Mmmmn,”</i> [wulfe.name] moans, giggling a little. <i>“Take that. And that. And this! Oh, you’re so fun!”</i>");
	output("\n\nEach thrust makes you cry out in high-pitched pleasure, your moans mounting in volume until her greedy partaking of your body has you right on the precipice of orgasm. There’s no doubt she can feel it, the fluttering contractions of your asshole around her cock all but massaging her in subservience. She has a steady rhythm going, the muted slap of her fat knot against your ass sounding more like it’s in your mind than your ears.");

	if (pc.isHerm()) output("\n\nYour [pc.cocks] " + (pc.hasCocks() ? "let" : "lets") + " out a rope of cum on a particularly deep thrust, then begin" + (pc.hasCocks() ? " to desperately spurt their" : "s to desperately spurt its") + " entire load against [wulfe.name]’s underside while she lifts her hips, your [pc.pussies] convulsing with unfulfilled pleasure.");
	else if (pc.hasCock()) output("\n\nYour [pc.cocks] " + (pc.hasCocks() ? "let" : "lets") + " out a rope of cum on a particularly deep thrust, then begin" + (pc.hasCocks() ? " to desperately spurt their" : "s to desperately spurt its") + " entire load against [wulfe.name]’s underside while she lifts her hips, ready to give you another long, hard thrust.");
	else if (pc.hasVagina()) output(" Your [pc.pussies] " + (pc.hasVaginas() ? "tense" : "tenses") + " up <i>hard</i>, the pleasure radiating from both your " + (pc.hasVaginas() ? "cunts" : "cunt") + " and your asshole while [wulfe.name] draws her hips back, preparing for another long, hard thrust.");
	else output("\n\nYou cum from the anal stimulation alone, the dizzying sexual pleasure exploding in your head like fireworks. Her massive canine cock is just too good to resist.");

	output("\n\nFrom out of nowhere, you feel a sudden, hard impact across your [pc.ass] and let out a yelp mid-orgasm. Still in the throes of pleasure and trapped beneath [wulfe.name], you don’t even realize what’s going on until you see her smiling down at you. She’s spanking you while you cum, forcing you to tighten up on her! You can’t even stop her from down here, either, and you find yourself getting spanked every time she brings her sizeable hips upwards.");
	output("\n\n<i>“Now try to take it in, little pet,”</i> she murmurs to you.");
	output("\n\n[wulfe.name] leaves nothing to the imagination with that one, pressing her gigantic knot into your asshole. The pressure is intense - it feels like she’s forcing her entire body down on you, her mechanical strength impossible to withstand. You groan as you begin giving in, more and more of her overgrown bulb being sucked inside of you until, suddenly, she pauses at what feels like the thickest part of her knot.");
	output("\n\n<i>“Mmm... get me closer to cumming and you can earn the knot, [wulfe.pcname],”</i> she giggles.");
	output("\n\nDenied! You don’t even know how much of this treatment you can take, and she wants you to do <i>more</i>. You look up at her in confusion, looking for some kind of clue, and find it in her face. She’s waiting. Wearing that beautiful, gentle smile that belies her dominant, overpowering sexual lust. She wants you to rise to the occasion.");
	output("\n\nWell... fine. She <i>is</i> your mistress, after all - the least you can do is meet her expectations. Slowly withdrawing her knot, she coos in approval when she feels you begin to consciously work your ass, squeezing down on her as hard as you can and letting go, then repeating the effort.");
	output("\n\n<i>“Oooh, that’s good,”</i> [wulfe.name] sighs, drawing her womanly hips upwards once more. <i>“Keep that up and I’ll be knotting you for sure!”</i>");
	output("\n\nYou moan in helpless pleasure as she drives herself back in, having to mentally force yourself to continue squeezing down on her. It’s hard work with how far you’re stretched, your muscles not at all wanting to follow your orders, but it’s all worth it when you hear how she groans. She’s just too sexy to resist, and she’s fully aware of it. You can see it in her knowing grin as she bites her lip, starting to fuck you harder. She’s getting closer, a <i>lot</i> closer, spurred on by your efforts.");
	output("\n\n<i>“Alright, [wulfe.pcname],”</i> she whispers, the gentleness of it completely at odds with how she’s destroying your asshole, <i>“take it in like the good little whore you are.”</i>");
	output("\n\nShe roughly hilts herself with a grunt and you cum the moment her cock begins to throb inside you. Expelling great, thick gouts of seed into your ass, [wulfe.name] doesn’t stop there - she thrusts, hammering the knot into your weakened asshole until your body gives up and welcomes her inside. Having planted the flag of conquest inside you, she takes a few seconds to lord it over you with a smug grin and a hand running " + (pc.hasHair() ? "through your [pc.hair]." : "over your head."));
	output("\n\nYour stomach begins to swell with her seed, jerkily at first, your mistress’ seed entering you with all the violent force you’ve come to expect from her, then more steadily as time goes on and she settles into a rhythm. You do your utmost best to keep squeezing down on her, milking more pleasure from your body for her benefit, but it’s admittedly hard when you’re trapped in the throes of orgasm. It’s like you’re being constantly thrust up against the edge of it, cumming just that one last time over and over until you’re gasping for her.");
	output("\n\n<i>“Mistress,”</i> you pant, trying to thrust your hips up into her to no avail. She has you too tightly trapped for that. <i>“Mistress, mistress, mistress!”</i>");
	output("\n\n<i>“So </i>eager<i>,”</i> she croons, eyes flashing pink. <i>“I love it!”</i>");
	output("\n\nJust when you think you’re almost out of the woods, [wulfe.name] activates the vibe embedded in the base of her dick. Her entire length vibrates inside you, " + (pc.hasCock() ? "the knot pressing against your prostate in the most amazing way" : "stimulating your lower half fiercely") + ". A long, shaky scream rises from the depths of your throat and comes out in half-gasped spurts, the sensation of being so thoroughly shaken from the inside too distracting to ignore.");
	output("\n\nYour mistress " + (pc.hasHair() ? "takes your head and runs her hands through your hair, pulling it lightly" : "tugs at your [pc.ears], rolling them between her fingers") + " while she drains her seemingly endless reservoirs of");
	if (wulfe.isEggWulfe()) output(" fertile");
	output(" cum inside you. God, it never ends - it feels like you’ve been writhing under her for minutes...");
	output("\n\n<i>“Mmmm, I’m gonna cum again,”</i> [wulfe.name] purrs, eyeing you hungrily. <i>“Being inside you with the vibe on is great...”</i>");
	output("\n\nTrue to her word, she cradles your head in her hands while her cock renews the flow of hot, gushing cum into your insides, moaning in pleasure. Her eyes hooded and her tongue washing over her plump, glossy black lips, you can see for yourself just how good she feels with her cock shoved all the way into you.");
	output("\n\nShe keeps you there, beneath her bulk, crying out in bliss until she cums a final time ten minutes later. You’re exhausted, having been so thoroughly used and abused that you’re almost ready to pass out where you lie. The only things keeping you awake are sheer desire and the feeling of three of [wulfe.name]’s massive, sloshing loads inside your stomach, knotted and sealed inside to ensure you look several months pregnant with her seed.");
	output("\n\nFinally satisfied, she slowly raises herself to her feet, dragging your surprised form up with her. You’re still tied to her!");
	output("\n\n<i>“M-mistress!”</i> you gasp, hanging half in the air with your [pc.legs] limply splayed to the sides.");
	output("\n\n<i>“Thank me for fucking your ass,”</i> [wulfe.name] tells you.");
	output("\n\n<i>“Thank you, mistress,”</i> you groan, too tired and stretched to muster much more.");
	output("\n\n<i>“Could be better,”</i> she says thoughtfully, deliberately swaying her hips from side to side. The effect is immediate and titillating. <i>“Once more?”</i>");
	output("\n\n<i>“Thank you for fucking my asshole, mistress!”</i> you cry out, and you find yourself dropped onto your back with a thud and the snap of her cock dematerializing. A torrential river of warm spunk immediately slops from your gaping asshole, flexing as it tries to close up to no avail. <i>“O-ooh...”</i>");
	output("\n\nShe’s still above you, taking a couple of steps back before she bends forward and leans down to plant her hands on your shoulders. Keeping you down, she kisses you forcefully, almost hungrily. You’re almost as full of her affection as you are her seed by the time she parts from you, grinning and pulling you to your feet.");
	output("\n\n<i>“There,”</i> [wulfe.name] says, supporting you easily while she dusts you off. <i>“" + (pc.isNude() ? "Ready to keep adventuring" : "Would you like help getting dressed") + "”</i>");
	output("\n\n<i>“One moment,”</i> you moan, leaning against her while her thick, sticky cum rolls down your [pc.thighs]. <i>“I need some time here...”</i>");
	output("\n\n<i>“Aww, a cutie like you can take all the time you need,”</i> [wulfe.name] coos, kissing you on the cheek. <i>“You just let me know when you’re ready to go, ‘kay?”</i>");
	output("\n\nYou set off a few minutes later, a little cleaner and with alert doggy-domme in tow.");

	pc.loadInAss(wulfe);
	pc.orgasm();
	wulfe.orgasm();
	if (InPublicSpace()) pc.exhibitionism(1);
	
	IncrementFlag("WULFE_SEXED_ANAL");
	
	addButton(0, "Next", mainGameMenu);
}

public function siegwulfeRequestCock(cockId:int):void
{
	clearMenu();
	clearOutput();
	author("Wsan");
	showSiegwulfe(true);
	processTime(15+rand(16));

	var len:Number = pc.cocks[cockId].cLength();

	output("Planting your [pc.feet], you push your [pc.hips] upwards and look to your mistress for some comfort.");
	output("\n\n<i>“Please let me fuck you, mistress,”</i> you moan.");

	output("\n\n<i>“Oh? You’d better stroke my ego before I start stroking your cock, [wulfe.pcname],”</i> [wulfe.name] giggles, gazing down at you with desire. <i>“Why do you want to fuck me with that");
	if (len < 5) output(" tiny");
	else if (len < 10) output(" biped-sized");
	else if (len < 16) output(" pretty");
	else if (len < 22) output(" oversized");
	else output(" big, beautiful");
	output(" dick of yours anyway? Do you think you can make me cum?”</i>");

	output("\n\n<i>“I can,”</i> you promise, nodding vigorously. <i>“I just want to feel that slick, beautiful pussy of yours wrapped around my cock, mistress. I want to feel it when you cum-”</i>");
	output("\n\n<i>“Alright,”</i> [wulfe.name] murmurs, interrupting your plea. <i>“I think you’ve made your case, my overeager pet. Besides,”</i> she sighs indulgently, rolling her eyes before fixing her gaze on your [pc.cock " + cockId + "], <i>“I could see how much you want this before you even opened your mouth. But it was fun anyway.”</i>");
	output("\n\nApproaching you with a sexy sashay and a smile that sets your loins ablaze, [wulfe.name] bends down in front of you and seats herself comfortably, folding her forelegs while she presses down on your hips to bring you back down to the ground. Taking your");
	if(pc.cocks.length > 1) output(" largest");
	output(" cock in hand, she grins and leans forward, bringing her face mere inches from your throbbing member.");

	output("\n\n<i>“Hmhmm,”</i> she giggles to herself, hot air from her nostrils washing over your dick as sure as the hand grasping it.");
	if (len < 5) output(" <i>“I don’t think you’re going to be able to make me cum with </i>this<i>, [wulfe.pcname]. But I’m sure you can make it up to me somehow.”</i>");
	else if (len < 10) output(" <i>“You might be " + (pc.isTaur() ? "undersized for a taur" : "average for non-centaurs") + ", but I think we can make it work.”</i>");
	else if (len < 16) output(" <i>“Not bad, [wulfe.pcname]. We can get something done with this...”</i>");
	else if (len < 22) output(" <i>“Very impressive, [wulfe.pcname]. I’m looking forward to this already.”</i>");
	else output(" <i>“Such a massive tool on such a willing submissive. It would truly be a shame if we couldn’t make good use of it...”</i>");

	output("\n\nAlready being teased and titillated, you’re <i>determined</i> not to cum before she does - or at the very least, not until she tells you to. She begins languidly stroking your cock " + (len < 5 ? "between a soft finger and thumb" : "with her soft, gentle fingers") + ", paying particular attention to your [pc.cockHead " + cockId + "]. Noting the drip of precum that emerges from the top, she gives you a grin.");
	output("\n\n<i>“Oh, you like that, don’t you?”</i> she teases you" + (pc.balls > 0 ? ", caressing your [pc.balls] with her other hand. " + (pc.ballSize() > 10 ? "<i>“Oh, these should be fun.”</i>" : "<i>“Put up with it.”</i>") : "."));
	output("\n\nMore and more precum begins to drip from your cocktip, but your resolve stays the same. [wulfe.name] runs her thumb up the underside of your shaft and leaves it there for a few seconds before leaning forward, suddenly grabbing you by the chin and pulling you up for a hard kiss. When she parts from the embrace, she regards you coolly, those glowing pink eyes locked on your own.");
	output("\n\n<i>“Stay,”</i> she instructs you, pointing at you before leaning back and rising to her feet.");
	output("\n\n[wulfe.name] turns slowly, looking back over her shoulder. You hone in on a singular point of interest - her dripping-wet pussy, lips of thick, black latex crafted to divine perfection. Backing up, she lowers herself right over your stiffly erect cock and wiggles her hips, giving you a fantastic view of the way her big, jiggly ass shakes when she wants to tease you. Then she’s on top of you.");
	output("\n\n<i>“Mmmmm,”</i> she croons, smirking back at you over her shoulder while she rubs her slick, sexy cunt " + (len < 5 ? "all over" : "up and down") + " your length. She might be different now, but she’s still got that bimbo body and she definitely knows how to best use it. <i>“That must feel </i>so<i> good, pet.”</i>");
	output("\n\n<i>“It d-does, mistress,”</i> you grunt, willing yourself not to cum and just counting the seconds until you can get it inside her.");
	output("\n\nContrary to all your expectations, [wulfe.name] doesn’t tease you or make you beg for it.");

	// This variation intentionally doesn't call pc.cockChange()
	if (len < 5)
	{
		output(" Instead she brings down her massive ass on your dick - but you’re so small that thanks to the impressive curves of her cheeks you don’t even get the tip in.");
		output("\n\n<i>“Awww,”</i> [wulfe.name] moans, turning her head to face you. Putting her finger to her lip, she pouts in sadness. <i>“Is my poor little pet too small for me? What a shame...”</i>");
		output("\n\nPressing herself down on your nethers she begins to rub her slick, rubbery lips up and down your tiny cock, cooing all the while. The head will never reach the opening of her pussy, but having it slip between her soft, beautiful pussylips is almost as good.");
		output("\n\n<i>“Nnnn, this is pretty good, [wulfe.pcname],”</i> she giggles, giving you a smug look. <i>“If only you were just a few inches bigger it would feel great for you too...”</i>");
		output("\n\n<i>“Mistress!”</i> you moan.");
		output("\n\n<i>“Don’t go blowing your little load just yet, pet,”</i> she says airily, letting your cock brush against her clit. <i>“I want to cum first.”</i>");
		output("\n\nBouncing and rolling her hips, she all but jerks you off with her dripping wet opening. Between her teasing and the treatment it’s hard to resist, but the thought of her making fun of you for being small <i>and</i> for cumming too early gives you the boost you need. It takes a few minutes, doubtlessly more than it would if you could penetrate her, but [wulfe.name] manages to cum on your cock with a pleased moan.");
		output("\n\n<i>“Nnnnnf- finally,”</i> she breathes, her passage winking lewdly back at you as it tightens up in orgasm. <i>“At least you can still do that much...”</i>");
		output("\n\nYou cum all over yourself at the degradation, grunting through grit teeth as [pc.cum] spurts up your tummy. Some of it spatters across [wulfe.name]’s cunt, as close as you can get to claiming it, and she giggles in response.");
		output("\n\n<i>“Oooh, so close but so far,”</i> she snickers, grinning. <i>“Maybe next time, [wulfe.pcname].”</i>");
		output("\n\nRaising her ass, she lets you gaze at the [pc.cumColor] splotches across her lips before turning around, helping you to your feet. Pulling you closer, she spanks your [pc.ass] fiercely and smiles.");
		output("\n\n<i>“Remember that you are </i>always<i> my favorite pet,”</i> she whispers in your ear, giving you a soft, barely-touching kiss on your cheek before pulling back. <i>“Now. Back to adventuring?”</i>");

		pc.applyCumSoaked();
	}
	else
	{
		output(" With a sharp, sudden gasp, she plunges downwards and hums in delight as you enter her. You groan in loud, instinctual pleasure, the sexual embrace of her impossibly wet passage almost <i>too</i> perfect. You nearly cum right on the spot, caught in the honeypot trap of her masterfully-designed pussy. She was built to suck and fuck cocks, and it’s more than evident in the way she pulls you inside to stroke you.");
		pc.cockChange();
		output("\n\n<i>“Oohh, that’s always a good feeling,”</i> she murmurs, her rump shaking with glee. <i>“How " + (flags["WULFE_SEXED_FUCK"] != undefined && flags["WULFE_REQUESTED_LONG_COCK"] == undefined ? "nostalgic" : "nice") + "...”</i>");
		output("\n\nShe hardly gives you time to recenter yourself, let alone think. With long, powerful strokes and side-to-side sways of her hips, she starts fucking you in earnest, bouncing on your cock with all the confidence you’ve come to expect from her. She’s utterly professional and mischievous at the same time, displaying expert muscular control to hold you tight in her ridged cunt and gyrate her womanly hips to massage the head of your cock.");
		output("\n\n<i>“Fuuuck,”</i> you groan, hardly able to resist. <i>“Mistress...”</i>");
		output("\n\n<i>“Hee hee!”</i> [wulfe.name] giggles, putting her fingertips over her mouth. <i>“Oh, it’s easy to get lost in this... don’t disappoint me, pet!”</i>");
		output("\n\nYou don’t even know what to expect any more. Hardly a few seconds go by before she’s showing you some new manner of expertise, pounding you into her drenched cunt with wet slaps before sinking you to the hilt inside her tight passage. You hardly notice the sound of her holocock activating and you’re taken completely off-guard when she activates the vibe in its base, resonations travelling back up her chassis and all but daring you to cum inside her.");
		output("\n\n<i>“Oh, fuck!”</i> you cry out, feeling the rollercoaster ride begin its runaway descent. <i>“Mistress!”</i>");
		output("\n\n<i>“Nngh- nnf! Nnn! Nnh!”</i> [wulfe.name] grunts, slamming herself down on your [pc.groin]. <i>“Get ready to cum!”</i> she barks.");
		output("\n\nYou’re <i>already</i> ready, teetering right on the edge before your mistress brings herself down on your cock with such force you feel your spirit let go. Cum begins to pump inside her tight, quivering cunt while the two of you moan in joy, sharing the pleasure of orgasm.");
		if (pc.hasKnot(cockId)) output(" Your [pc.knot] pops inside her with scant resistance, all but encouraged by the shifting grip of her incredible pussy.");
		output("\n\nThough unseen, you can hear [wulfe.name]’s cock sowing her synthetic seed all over the ground while she shakes atop you, milking you with intense, grippy undulations of her soft walls. You’re drained into her waiting womb, " + (pc.hasKnot(cockId) ? "squeezing your knot" : "all") + " while she cums repeatedly.");

		var cumQ:Number = pc.cumQ();
		if (cumQ < 5000) output("\n\n<i>“Nnnn... fuck,”</i> she sighs, lifting her head and swishing her dark blonde hair out of her face. <i>“Not bad, pet.”</i>");
		else if (cumQ < 10000) output("\n\n<i>“Still cumming...”</i> she notes, gripping you harder. <i>“Quite the toy you are, pet.”</i>");
		else output("\n\n<i>“Oh, you’ve got so much love to give me,”</i> she sighs, gripping you so intensely it’s almost like she has your cock in hand. <i>“Pour it all out until you’re satisfied, pet.”</i>");
		output("\n\n[wulfe.name] raises herself with a groan when you’re done");
		if (pc.hasKnot(cockId)) output(", your own weight pulling your knot back out of her");
		output(". A deep noise of satisfaction rumbles in her throat as your [pc.cum]");
		if (cumQ < 5000) output(" drips");
		else if (cumQ < 10000) output(" spurts");
		else output(" flows like a river");
		output(" down her hindlegs, the former sex droid spreading them as far as they’ll go.");

		output("\n\n<i>“Look what you did to me, pet,”</i> she purrs, looking back and running a hand down her cheek and chest. <i>“I’m all fucked full of your hot spunk.”</i>");
		output("\n\nYour mistress exposing herself and letting you see the full extent of the [pc.cumColor] streaks running down her lithe limbs might be the most erotic sight you’ve ever laid eyes upon. You’re still holding the image in your mind as she circles around, helping you to your feet and giving you a gentle spank across your [pc.ass].");
		output("\n\n<i>“Good [pc.boyGirl],”</i> she whispers in your ear.");
		
		IncrementFlag("WULFE_REQUESTED_LONG_COCK");
	}

	output("\n\nSuitably");
	if (!pc.isNude()) output(" re-dressed and");
	output(" reinvigorated, you set off on your journey once more.");

	pc.orgasm();
	wulfe.orgasm();
	if (InPublicSpace()) pc.exhibitionism(1);

	IncrementFlag("WULFE_REQUESTED_COCK");

	addButton(0, "Next", mainGameMenu);
}

public function siegwulfeRequestOral():void
{
	clearMenu();
	clearOutput();
	author("Wsan");
	showSiegwulfe(true);
	processTime(15+rand(16));

	output("<i>“Would you...”</i> you start, hesitating as you regard those big, luscious lips curled back in a smile. <i>“Would you give me oral, mistress?”</i>");
	output("\n\n<i>“Aw, you want your master to debase herself so you can get off?”</i> [wulfe.name] says, pouting her bottom lip out mockingly. <i>“Fine. Prove you deserve it, then.”</i>");
	output("\n\nYou eagerly raise yourself to a kneeling position as she turns around and presents herself, her holocock snapping into existence between her legs and her dripping wet, juicy pussy as attractive a prospect as ever. You want to just shove your face into it, licking and slurping until she spurts all over you. The thick, heavy dogcock hanging in front of you is no less enticing, taunting you with the potential sight of watching your mistress spurt her thick cum all over the ground.");
	output("\n\n<i>“Indulge yourself, pet,”</i> [wulfe.name] whispers enchantingly. <i>“Work them both and you’ll get your reward.”</i>");
	output("\n\nYou don’t need to be told twice. You thrust your [pc.tongue] between those thick, black pussylips and <i>dig</i>, grabbing her slender mechanical calves and pulling yourself into her sodden cunt. [wulfe.name] groans in pleasure as your " + (pc.hasLongTongue() ? "lengthy tongue unfurls inside the length of her squeezing passage, massaging every pleated fold of it on the way in" : "tongue finds the roof of her tight passage, frantically licking at her sensitive walls") + ". So enchanting is her wordless praise that you don’t think twice about shoving your face into her, your [pc.lips] meeting her own in a wet, passionate kiss.");
	output("\n\nStrands of her juices stick to your mouth when you pull back to take a great, gasping breath before diving back in, lifting one hand from her leg to wrap your fingers as far around her big, strong canine cock as you can manage. You can feel her shiver in approval at your touch, her prick flexing with life within your grip. Working your neck and hand forward in rhythm in time with your mistress’ moans creates a song of lilting pleasure from her mouth, one that you never want to end. You could worship her all day if you got to listen to the way she erotically croons the whole time.");
	output("\n\nLetting your tongue recede back to her entrance, you turn your head a little and take one of her fat, squishy pussylips into your mouth, sucking on it as hard as you can. She pushes back into you in response, grunting in lust. You give the other the same treatment before letting go, dropping down to find your next target. Nestled in the crease of her entrance is a big, fat gumball of a clit and there’s no way you’re going to leave it without its due attention.");
	output("\n\n<i>“Ooooohhhh, yessss,”</i> [wulfe.name] moans as you slurp at her clit, sucking it between your lips and rolling it in your mouth with your tongue. <i>“Oh, pet!”</i>");
	output("\n\nYou’re getting greedy now, spurred on by the lascivious approval of your mistress. Juices run down your chin while you work her clenching pussy over and rub her massive cock, applying both hands to their loving task. It flexes and strains in your grasp, seeking release just like its owner. You’re only too happy to fulfill her wishes.");
	output("\n\nAs excited as your mistress is to be getting so thoroughly worshipped, it’s no surprise that you soon start feeling the telltale signs of her impending orgasm. The subtle way her delectable cunny shivers for just a second extra when it clamps down on your tongue, the amount of slick precum spilling from the end of her cock, and the impressive bulge of her knot starting to throb at her base.");
	output("\n\nShe doesn’t even need to tell you to make her cum. Taking a deep breath you <i>throw</i> yourself into your task, frenziedly licking and sucking every inch of her delicious pussy while you work her swelling knot with one hand and her tapered cockhead with the other. [wulfe.name] throws her head back and groans loudly, her hindquarters shaking in pleasure as the contractions of her needy cunt begin to rock her entire body.");
	output("\n\nShe cums with a loud, wordless cry, pressing on you from either side to keep you between her cheeks and sucking on her juicy clit while she squirts all over your " + (pc.femininity < 33 ? "handsome face" : (pc.femininity < 66 ? "pleasant features" : "pretty face")) + ". Her throbbing cock responds in kind by spewing its first of many thick, sticky loads across the ground. Your head is swimming by the time she lets you go, so swamped in her musk that each desperate breath you take only makes you all the more aroused.");
	output("\n\n<i>“Nnnnnnh...”</i> [wulfe.name] sighs, looking back at you. <i>“Good [pc.boyGirl], [wulfe.pcname]. But you’re not done just yet. Clean me up.”</i>");
	output("\n\n<i>“Yes, mistress,”</i> you reply automatically, leaning back in to lap up her juices. Even her underside is partially soaked in them and you have to crane your neck upwards just to reach, licking her stomach before the trails of femcum can run too far. After that you shuffle forward to tug the head of her cock up to your lips, suckling her with your eyes closed and your lips sliding back and forth.");

	output("\n\nBy the time you’re done with your painstaking task you’re close to cumming without being touched. Your");
	if (pc.isHerm()) output(" [pc.cockBiggest] is already dripping, precum beading at the tip before slowly trickling down the underside of its length, not to mention how wet your [pc.pussy] is beneath that");
	else if (pc.hasCock()) output(" [pc.cockBiggest] is straining and dripping, precum beading at the tip before slowly trickling down the underside of its length");
	else if (pc.hasVagina()) output(" [pc.pussy] is dripping, a stray strand of arousal flicking to the ground as you move");
	output(". Now you can finally get your reward.");

	output("\n\n<i>“Good " + (pc.catDog("a","b",false) == "b" ? "dog" : "work") + ",”</i> [wulfe.name] says, turning around with a satisfied smirk.");
	output("\n\nShe slowly lowers herself to the ground, shuffling between your [pc.feet] before pressing at your [pc.thighs]. <i>“Hold your thighs open, pet,”</i> she commands you.");
	output("\n\nYou’re only too eager to obey, watching your master lick her plush lips as she eyes your " + (pc.hasCock() ? "stiffly erect cock" : "succulent pussy") + ". Bending at the hips she");

	var cumQ:Number = (pc.hasCock() ? pc.cumQ() : 0);
	if (pc.isHerm())
	{
		output(" wraps her long, warm tongue around your [pc.cockHeadBiggest] and pulls it into her mouth, eliciting a groan of pleasure from your throat. She’s hardly even started and it already feels amazing. Leaning back and resting on your elbows, you moan in contentment while she begins to work you over.");
		output("\n\nHer technique is divine. She sucks you deep and hollows her cheeks on the way back up before withdrawing you completely and running her tongue down your length, all the way down to your waiting pussy where she licks and laps at your [pc.clits] with frenetic vigor. Suffering her attentions on both of your sexes when you were already so submissively worked up, you can’t avoid cumming with both sets at once.");
		output("\n\nYour [pc.hips] come off the ground as you cry out in release, incapable of resisting the urge to thrust between her lips and cum as deep as you can. She allows you the privilege of emptying yourself into her throat while she slips two fingers into your clenching quim and fingerfucks you, driving you to have a full-body orgasm that leaves you shaking and breathless.");
		output("\n\nShe raises herself back up when you’re done,");
		if (cumQ < 10000) output(" having swallowed everything you had and looking no worse for wear. If anything, she looks incredibly pleased with your offering.");
		else if (cumQ < 20000) output(" having taken your impressive loads into her stomach and looking just slightly pudgier as a result. She looks all kinds of happy about it, though.");
		else output(" having long since resorted to roughly jacking you off after your massive loads became too much to swallow. She looks very happy with the amount you’ve offered her.");
	}
	else if (pc.hasCock())
	{
		output(" wraps her long, warm tongue around your [pc.cockHeadBiggest] and pulls it into her mouth, eliciting a groan of pleasure from your throat. She’s hardly even started and it already feels amazing. Leaning back and resting on your elbows, you moan in contentment while she begins to work you over.");
		output("\n\nHer technique is divine. The way she sucks you so deep then withdraws with hollowed cheeks has you squirming in her grip, actively denying your impulse to cum. So blissful is the experience, so peaceful and pleasurable, that you don’t want to give it up just yet. Try as you might, though, you can’t resist [wulfe.name]’s amazing oral skill and she knows it. She looks up at you and smiles as she feels you shiver, heralding your orgasm before she dives back down on you with aplomb.");
		output("\n\nYour [pc.hips] come off the ground as you groan in release, incapable of resisting the urge to thrust between her lips and cum as deep as you can. She allows you the privilege, wrapping her hands around your thighs and forcing you to raise your groin. You can feel her swallowing your loads down with enthusiasm, her dark blonde hair shaking as her head bobs on the end of your throbbing prick.");
		output("\n\nShe raises herself back up when you’re done,");
		if (cumQ < 10000) output(" having swallowed everything you had and looking no worse for wear. If anything, she looks incredibly pleased with your offering.");
		else if (cumQ < 20000) output(" having taken your impressive loads into her stomach and looking just slightly pudgier as a result. She looks all kinds of happy about it, though.");
		else output(" having long since resorted to roughly jacking you off after your massive loads became too much to swallow. She looks very happy with the amount you’ve offered her.");
	}
	else if (pc.hasVagina())
	{
		output(" slides her tongue down from your navel to your [pc.clits], dancing over it with the lightest of attentions before lapping at your lips. She thrusts her tongue inside you and spreads it, licking the roof of your passage with a rhythm that makes you shiver with heat before she’s suddenly sucking on your " + (pc.totalClits() > 1 ? "clits" : "clit") + ", making you lift your hips off the ground.");
		output("\n\nShe keeps up the intensity until you’re writhing beneath her, humping the air as a desperate prelude to your orgasm. Her tongue wraps around your clit and squeezes in an impressive display of control before she plunges it back into your squeezing cunny and sucks on your folds, her upper lip pressing down on your button hard enough to make you scream in lust. After all that, it’s impossible not to cum.");
		output("\n\nYou let out a lilting groan of ecstasy as your orgasm rolls through you, clamping down on your mistress’ probing tongue and trapping it inside while you grunt and groan, clenching your fists. She’s more than happy to accommodate you, looking up at you from between your legs with hooded eyes while you cum your brains out. Finally, your strength lapses and you fall back to the ground, gasping and panting.");
	}

	output("\n\n<i>“There,”</i> [wulfe.name] murmurs, looking up at you and smiling. <i>“A suitable reward for my favorite pet.”</i>");
	output("\n\nShe lets you settle for a moment before, overcome by the carnality, she shoves herself forward and holds you down, kissing you intensely. You can taste yourself on her lips as you lock tongues, her hands wrapped around your face while she holds you against her, pressing her massive breasts into your chest. She bites your lip before pulling away, leering at you with a dominant grin.");
	output("\n\n<i>“Now you’ve got me all turned on again, [wulfe.pcname]...”</i> she whispers, eyes flashing. <i>“We’ll have to do this again soon.”</i>");
	output("\n\n<i>“Yes, mistress,”</i> you moan, letting her pull you to your feet. You spend a couple of minutes recovering");
	if (!pc.isNude()) output(" and redressing");
	output(" before you set off again.");

	pc.orgasm();
	wulfe.orgasm();
	if (InPublicSpace()) pc.exhibitionism(0.5);
	
	IncrementFlag("WULFE_REQUESTED_ORAL");

	addButton(0, "Next", mainGameMenu);
}

// LEASHY THINGS BEGIN HERE
public function canSiegwulfeUseLeash():Boolean
{
	if (rooms[currentLocation].hasFlag(GLOBAL.NURSERY)) return false;
	return true;
}
public function hasSiegwulfeLeashOn():Boolean
{
	if (!canSiegwulfeUseLeash()) return false;
	if (hasWornCollar() && hasSiegwulfeOnSelf() && pc.hasStatusEffect("Siegwulfe's Leash")) return true;
	return false;
}
public function siegwulfeLeashBlurbs():void
{
	if (!hasSiegwulfeLeashOn()) return;
	else output("\n\n[wulfe.name] has you leashed, humming happily and occasionally glancing at you to lick her lips and smile when she sees you in your collar.");
}
public function siegwulfeLeashies():void
{
	clearMenu();
	clearOutput();
	showSiegwulfe();
	author("Wsan");
	processTime(1);

	output("<i>“Oh?”</i> [wulfe.name] suddenly murmurs, drawing closer. You find her dainty hands at your shoulders, brushing inwards until she has one around the back of your neck and another gently stroking your throat. She peers closer. <i>“Is this... a collar, [wulfe.pcname]?”</i>");
	output("\n\n<i>“Yes... mistress?”</i> you say, unsure of her intentions. <i>“Is it a problem?”</i>");
	output("\n\n<i>“Nope! It’s perfect,”</i> she declares, pulling back with a happy smile. <i>“Pets need collars. But they also need...”</i>");
	output("\n\nYou watch her reach back, twisting her torso in a way that emphasizes her massive, jiggling bust. She strokes one finger in a thin line down several inches of her back half and to your surprise, some metal slides away to reveal a tiny compartment. She pulls the contents out and drapes it over her fingers, presenting it to you in triumph.");
	output("\n\n<i>“A leash!”</i> she says excitedly.");
	output("\n\nBefore you is a bright pink hardlight leash no doubt originally intended for use <i>on</i> the Siegwulfe bot, rather than <i>by</i> her. She eyes your collar eagerly.");
	output("\n\n<b>Do you allow her to leash you, publicly binding you to her as a submissive for all to see?</b>");
		
	flags["WULFE_LEASH"] = 1;

	addButton(0, "Leash Me", function ():void
	{
		clearMenu();
		clearOutput();
		showSiegwulfe();
		author("Wsan");
		processTime(1);

		output("<i>“Mistress...”</i> you breathe hotly,");
		if (pc.isHerm()) output(" [pc.pussies] tightening involuntarily while your [pc.cocks] grow hard" + (pc.isCrotchGarbed() ? " in your [pc.lowerGarments]." : "."));
		if (pc.hasCock()) output(" [pc.cocks] growing hard" + (pc.isCrotchGarbed() ? " in your [pc.lowerGarments]." : "."));
		else if (pc.hasVagina()) output(" [pc.pussies] tightening involuntarily.");
		else output(" your [pc.asshole] tightening involuntarily.");
		output("\n\nA grin creeps over [wulfe.name]’s face as she observes you, noting your flushed cheeks and hastening breath. She leans in without a word, opening the fastener on the leash and bringing it up your [pc.chest], watching your [pc.eyes] track its ascent until it disappears beneath your chin and you hear a faint click and an almost imperceptible weight.");
		output("\n\nYou almost cum on the spot, whining in happiness as [wulfe.name] wraps her arms around your waist and tugs on your leash, your collar pulling at your neck.");
		output("\n\n<i>“Now </i>everyone<i> knows you’re mine,”</i> she whispers huskily in your ear, her soft, onyx-black lips brushing against your cheek. <i>“I wonder what they’ll think of you... do you think they’ll imagine what I do to you? If they’ll know just how much you get off to being paraded around and fucked like you’re my toy?”</i>");
		output("\n\nYou moan in happiness just thinking of it. Giggling, [wulfe.name] shifts the hand not firmly holding your leash down to your groin to rub her silky-smooth palm against you.");
		output("\n\n<i>“I’m not going to make you cum right now,”</i> she tells you, a beatific smile on her face. <i>“I’ve grown to </i>like<i> seeing you a little pent-up and eager, pet. How needy you can get. It makes rutting you all the sweeter.”</i>");
		output("\n\nWith that she turns away and, looking back at you with a smug smirk, pulls on your leash. You stumble forward as she begins to walk ahead, guiding you wherever you want to go. There’s a notable spring to her step as she sways her hips seductively, tail waving above her plush butt.");

		pc.createStatusEffect("Siegwulfe's Leash");
		
		addButton(0, "Next", mainGameMenu);
	}, undefined, "Leash Me", "Of course you do. She’s already made you her bitch, now she’s making it blatantly official.");
	
	addButton(1, "Please Don’t", function ():void
	{
		clearMenu();
		clearOutput();
		showSiegwulfe();
		author("Wsan");
		processTime(1);

		output("<i>“Mistress [wulfe.name]...”</i> you say hesitantly, regarding the leash. <i>“I don’t know if I-”</i>");
		output("\n\n<i>“Fine, fine, don’t worry about it,”</i> [wulfe.name] sighs, stowing it back in its compartment. <i>“I wouldn’t make you do anything you didn’t really want to.”</i> She leans in to whisper to you. <i>“But don’t think I won’t rut you twice as hard to make up for it, [wulfe.pcname].”</i>");
		output("\n\nWith a wink and a wave of her tail she returns to escorting you, sultry as ever.");

		addButton(0, "Next", mainGameMenu);
	}, undefined, "Please Don’t", "You’re not sure yet that you want to do this.");
}

public function siegwulfeLeashChange(fromInv:Boolean):void
{
	clearMenu();
	clearOutput();
	showSiegwulfe();
	author("Wsan");
	processTime(1);

	if (!hasSiegwulfeLeashOn())
	{
		output("You’re barely even gotten the request out of your mouth before she’s snapped the fastener around your collar, a predatory grin of conquest playing on her face.");
		output("\n\n<i>“I knew you couldn’t go without it,”</i> she murmurs, planting her soft, juicy lips on the corner of your mouth and kissing you. <i>“My perfect little urge-filled pet. Don’t worry, I’ll fulfill all those needs of yours.”</i>");
		output("\n\nWith that she turns away and, looking back at you with a smug smirk, pulls on your leash. You stumble forward as she begins to walk ahead, guiding you wherever you want to go. There’s a notable spring to her step as she sways her hips seductively, tail waving above her plush butt.");

		pc.createStatusEffect("Siegwulfe's Leash");
	}
	else
	{
		output("<i>“Mistress, can you take my leash off?”</i> you ask shyly. <i>“I’d just like to go without it for a while...”</i>");
		output("\n\n<i>“Of course,”</i> she murmurs, detaching the fastener and stowing the leash away. <i>“Anything for my adorable little pet.”</i>");
		output("\n\nUnleashed, you continue along with [wulfe.name] at your side.");

		pc.removeStatusEffect("Siegwulfe's Leash");
	}

	addButton(0, "Next", approachSiegwulfe, [false, fromInv]);
}

public function siegwulfeLeashTease():void
{
	clearMenu();
	clearOutput();
	showSiegwulfe();
	author("Wsan");
	processTime(1);

	output("The pleasure is overwhelmingly distracting. Each firm pull on your leash feels like nothing less than a sensuous caress at your neck, " + (pc.isNude() ? "your naked form bared to all." : "your clothing brushing against your [pc.skinFurScales] to the point you can hardly bear it.") + " The wandering eyes of lone passersby and couples alike turn you on like nothing, setting aflame the fire of lust inside you. You scarcely even notice your mistress slowing her walk until you bump into her large, plush ass and jolt back to reality.");
	output("\n\n<i>“Getting a little... distracted?”</i> she teases you, turning back and approaching you to cup your chin with her fingers. <i>“Poor little pet... all that burning lust so tightly wound inside you, and all the stares just make it worse, don’t they?”</i>");
	output("\n\nYou can see more than one person has halted their walk to watch your voluptuous tauric mistress touch you, all but toying with you in front of them.");
	output("\n\n" + (pc.hasVagina() ? "<i>“I bet you’d just </i>love<i> for me to bend you over and fuck your sopping little cunt with my cock right now, wouldn’t you?”</i>" : "<i>“I bet you’d just </i>love<i> for me to bend you over and fuck your little asshole with my cock right now, wouldn’t you?”</i>") + " she whispers in your ear, your eyes widening and your heart leaping in your chest. <i>“But I won’t.”</i>");
	output("\n\nYou sag in disappointment and she giggles cheerily, kissing you on the cheek. <i>“Not yet. I want you all horribly pent up, quivering with lust... </i>Then<i> I’ll fuck your brains out, [wulfe.pcname].”</i>");
	output("\n\nShe winks and turns away, her tail coiling around your neck before she begins to sashay through the crowd once more. You’ll have to endure her teasing and tempting if you want her to reward you properly.");

	applyDamage(new TypeCollection({ tease : 15 }), wulfe, pc, "suppress");

	flags["WULFE_LEASH_TEASE"] = 1;

	addButton(0, "Next", mainGameMenu);
}

public function siegwulfePublicFuck():void
{
	clearMenu();
	clearOutput();
	showSiegwulfe();
	author("Wsan");
	processTime(1);

	output("<i>“Mistress...”</i> you moan, head swimming. You can hardly think, let alone function. It feels like your brain is submerged in a pool of liquid lust, your higher processes drowned out by the most base of needs.");
	if (pc.isHerm()) output(" Both your [pc.cocks] and [pc.pussies] are dripping with desperate need, clenching and flexing with the heat of arousal.");
	else if (pc.hasCock()) output(" Your [pc.cocks] " + (pc.hasCocks() ? "are" : "is") + " painfully hard against the [pc.skinFurScales] of your [pc.stomach], pressing insistently into you in " + (pc.hasCocks() ? "their" : "its") + " desperate need.");
	else if (pc.hasVagina()) output(" Your [pc.pussies] are dripping, warm arousal trickling down your [pc.thighs] in your desperate need.");
	else output(" Your [pc.asshole] tightens in anticipation, your arousal finding no escape.");
	output("\n\n<i>“Look at you,”</i> [wulfe.name] coos in delight, tugging you closer with the leash. <i>“You’re practically begging for it. Are you going to be a good [pc.boyGirl]?”</i>");
	output("\n\n<i>“Yes!”</i> you pant, almost jumping at the chance to prove your submission. <i>“I’ll be good!”</i>");
	output("\n\n<i>“Then squat down, spread your legs, and beg me to fuck you like the good little bitch you are,”</i> she says, smiling gently. <i>“And I’ll take you right here, right now.”</i>");
	output("\n\nThere’s already a few people gathering, murmuring and eyeing you. If this is going to happen, it’s going to be in front of a crowd.");

	applyDamage(new TypeCollection({ tease : 20 }), wulfe, pc, "suppress");

	addButton(0, "Beg", siegwulfePublicFuckGo, undefined, "Beg", "Submit to her whims.");
	addButton(1, "I Can’t", function():void
	{
		clearMenu();
		clearOutput();
		showSiegwulfe();
		author("Wsan");
		processTime(1);
	
		output("<i>“I can’t do that!”</i> you whine, shaking in need.");
		output("\n\n<i>“Aawww, that’s too baaad,”</i> [wulfe.name] coos, pouting her lower lip out with a grin. <i>“I guess you’ll have to ask me to pound your holes some other time, [wulfe.pcname].”</i>");
		output("\n\nTurning away from you, she tugs your hardlight leash hard enough to make you almost fall as the disappointed crowd dissipates.");

		addButton(0, "Next", mainGameMenu);
	}, undefined, "I Can’t", "Refuse.");
}

public function siegwulfePublicFuckGo():void
{
	clearMenu();
	clearOutput();
	showSiegwulfe(true);
	author("Wsan");
	processTime(15+rand(31));

	output("<i>“Yes... yes, mistress,”</i> you stammer, sinking to the ground and spreading your legs.");
	if (!pc.isNude())
	{
		output("\n\n<i>“Ah ah,”</i> [wulfe.name] says, waving a finger from side to side disapprovingly. <i>“Not with your clothes on, [wulfe.pcname]. Take them off first. Slowly,”</i> she adds, grinning.");
		output("\n\nYou strip your clothing off, revelling in the attention of the crowd and of your companion and escort. Her keen eyes rove up and down your body as you reveal it in its entirety, looking to her for approval and seeing it in her smile. She knows exactly how much power she has over you <i>and</i> how much you love that fact.");
		output("\n\n<i>“Good,”</i> she says lightly, inclining her head. <i>“Now get back down.”</i>");
	}

	//Not on Zheng Shi, Uveto, or someplace without tech:
	if (InRoomWithPhones())
	{
		output("\n\n<i>“Why isn’t my fucking phone working?”</i> you hear someone mutter. Looking up, you can see [wulfe.name] waving her tail behind her relaxedly... it seems like she might know something about it, but now’s not the time.");
		if (flags["WULFE_EMP"] == undefined) flags["WULFE_EMP"] = 0;
	}
	output("\n\n<i>“Now beg,”</i> she says primly. <i>“Beg me to pound your asshole, slut.”</i>");
	output("\n\nWith");
	if (pc.isHerm()) output(" both your " + (pc.hasVaginas() ? "pussies" : "pussy") + " and " + (pc.hasCocks() ? "cocks" : "cock") + " so freely dripping all over themselves");
	else if (pc.hasCock()) output(" your insanely stiff " + (pc.hasCocks() ? "cocks" : "cock") + " on display and freely dripping precum down your " + (pc.hasCocks() ? "shafts" : "shaft"));
	else if (pc.hasVagina()) output(" your " + (pc.hasVaginas() ? "pussies" : "pussy") + " dripping down your [pc.thighs] so freely");
	else output(" your nipples " + (pc.isLactating() ? "so freely dripping milk" : "so stiffly erect") + " and your [pc.ass] on display");
	output(" you can hardly say you don’t want it. Surely, anyone in the crowd can see just how much of a gigantic slut you are for your mistress, with your legs spread to show yourself off and your mouth hanging open panting in need. All you really care about is making her happy, giving her a reason to reward you, fulfilling her needs and if she so chooses, your own.");

	output("\n\n<i>“Please fuck my ass, mistress,”</i> you moan, your [pc.hips] shaking a little. If only your thighs were together you could rub yourself! <i>“Please!”</i>");
	output("\n\n<i>“Mmm,”</i> she hums, considering you. <i>“Why don’t you do it a little louder so everyone can hear?”</i>");
	output("\n\n<i>“Please!”</i> you almost scream, wobbling on your feet.");
	if (pc.hasVagina()) output(" A strand of arousal clings to the ground from your slavering cunt.");
	output(" <i>“Take your giant fucking cock and plow my ass until you cum!”</i>");
	output("\n\n<i>“That’s better,”</i> she sing-songs, taking a step forward as her underslung hardlight appendage snaps into existence. You almost cum just looking at it. It’s hulking, intimidating, and made for breaking bitches. Pupils dilated, you let out an unsteady moan as she pats at you with a forepaw. <i>“On your hands and knees. Get ready for your treat, [wulfe.pcname].”</i>");

	output("\n\nYou’ve hardly positioned yourself for her before she’s on top of you, roughly thrusting " + (pc.ass.looseness() <= 3 ? "her tapered tip and several inches that follow it" : "several inches of her behemoth shaft") + " into your guts. You cry out in immediate release, cumming explosively before [wulfe.name]’s even gotten herself all the way in. She shifts above you, faint, gentle laughter echoing in your ears.");
	pc.buttChange(wulfe.biggestCockVolume());
	
	output("\n\n<i>“So eager! My little champagne bottle,”</i> [wulfe.name] purrs, raising her hips. <i>“Popping your cork before the party’s even begun.”</i>");
	output("\n\nYou howl in bliss as she lunges forward, almost pulling you off your haunches with the force of her thrust.");
	if (pc.isHerm()) output(" Thick seed pours from your throbbing " + (pc.hasCocks() ? "cocks" : "cock") + ", her overwhelming size stimulating both your prostate and your neglected walls with its pressure.");
	else if (pc.hasCock()) output(" Thick seed <i>pours</i> from your throbbing " + (pc.hasCocks() ? "cocks" : "cock") + ", overstimulated by the sheer force of her entry and her overwhelming size. Just feeling her gently pulsing length against your prostate makes you want to scream her name.");
	else if (pc.hasVagina()) output(" Her size is so overwhelming that it stimulates you just by pressing against your walls, forcing you to cum so hard you blank out for a moment.");
	else output(" Having her inside your singular sex organ feels utterly divine, the way she pulses and shifts inside you driving you mad with pleasure.");
	output(" You still have to bear a few more thrusts before she can get herself all the way inside you, gasping as you’re forced to crawl a few steps forward lest she fuck you off the ground entirely or send you sprawling on your front. She lets out a contented groan when she feels her underside pressed squarely against you, her massive length swelling your tummy.");

	output("\n\n<i>“That’s right,”</i> she sighs, rocking her womanly hips back and forth and drawing you with her. <i>“This is where you belong, [wulfe.pcname]. Now, tell everyone here: what do you want the most?”</i>");
	output("\n\n<i>“I want,”</i> you pant, already breathless in the wake of being taken so ruthlessly. <i>“I want you to fuck me as hard as you can.”</i>");
	output("\n\n<i>“Mmm, good,”</i> [wulfe.name] purrs, twitching inside you a couple of times. She liked that answer. <i>“And then what?”</i>");
	output("\n\n<i>“C-cum inside me,”</i> you moan.");
	output("\n\n<i>“Good [pc.boyGirl]!”</i> she huffs, withdrawing and plunging over a foot of her oversized cock into your asshole before you can even react.");
	output("\n\n[wulfe.name] turns you into a mess. Pleading and moaning, you feel more and more of your mind giving yourself over to her, the mix of your juices pooling beneath your shaking thighs. Your body is covered in a coat of sweat from the exertion of taking her, your head bowed and placed on your arm in a gesture of complete submission. Incoherent groans of ecstasy leak from your throat unbidden, pushed out of you by [wulfe.name]’s insistent plundering of your asshole.");
	output("\n\n<i>“Nnnh, </i>so<i> good,”</i> she moans, lowering her hindlegs and starting to thrust harder. Ignoring the volume of your sudden outcry in response, she poses you a question. <i>“" + (wulfe.isEggWulfe() && !pc.isPregnant(3) ? "What do you think about getting knocked up, right here, in front of everyone watching?" : "Do you want me to cum?") + "”</i>");
	output("\n\n<i>“Yes! Please!”</i> you scream, fingers clawing at the ground as your " + (pc.hasBreasts() ? "[pc.breasts] shake" : "entire body shifts") + " with the momentum. <i>“Cum inside me as deep as you can! Knot your little bitch!”</i>");
	output("\n\n<i>“That’s what I like to hear!”</i> she hisses, slamming your ass so hard you can feel another orgasm rising in your loins. <i>“Come on, [wulfe.pcname]! Drink it all down!”</i>");
	output("\n\nWith a ferocious lunge that sends you sprawling underneath her, [wulfe.name] lets out a triumphant howl of dominance and slams her inflated knot inside you.You feel your own " + (pc.hasCock() ? "ejaculation start" : "orgasm hit") + " as hers does, pleasure wracking your overfilled body while thick synthetic seed pumps into your insides.");
	output("\n\n<i>“Uuuuhhhnn... that’s better,”</i> [wulfe.name] sighs happily, lying down atop you. <i>“Just relax and let them watch you get filled up, [wulfe.pcname].”</i>");
	output("\n\nYou can see flushed, excited faces in the crowd looking down at you wherever you look, your countenance twisted in the agony of rapturous pleasure. Violent shudders run up and down your spine as you cum over and over, feeling your lover’s fat knot flex inside you as she pours yet another load in. It’s a couple of minutes before she abruptly stands, pulling herself free and picking you right off the ground with one arm.");
	output("\n\n<i>“Okay! Show’s over,”</i> she announces, smiling at the crowd. <i>“Have a good day, everyone. Sorry about your recordings.”</i>");
	output("\n\nThen she’s off, strutting her way through the crowd with you in tow until she finds somewhere to put you down and start cleaning you up. You’re roused to semi-consciousness by the warmth of her tongue on your face, making your cheek bunch up as she licks you up and down.");
	output("\n\n<i>“Uhh,”</i> you moan. <i>“[wulfe.name]?”</i>");
	output("\n\n<i>“Yup!”</i> she replies, giving you a kiss. <i>“That was amazing, [wulfe.pcname]. We’re gonna have to do that again for sure. I came </i>so<i> hard!”</i>");
	output("\n\n[wulfe.name] hugs you tight, pulling you against her stacked chest and nuzzling your face with her own.");
	output("\n\n<i>“Thanks for the cleanup,”</i> you murmur to her.");
	output("\n\n<i>“Uh huh, no biggie,”</i> she says absently, leaning down to touch her forehead to yours. <i>“Just thinking about what we did makes me wanna plow you again...”</i>");
	output("\n\n<i>“But I think you deserve a little break,”</i> she finishes, smirking. <i>“For now. Until my cum stops dripping from your asshole. Well, maybe not that long.”</i>");
	output("\n\nYou kiss her this time, planting your [pc.lips] on her impossibly soft and welcoming mouth and pressing into her, surprising her with your forwardness. She’s quick to adapt, though, pushing you back as she runs a hand down your neck and squeezes, slipping her tongue between your lips and wrapping it around yours. A few more seconds and she’s pushed you down on the ground, grinding against your [pc.chest] while she kisses you passionately.");
	output("\n\n<i>“Mmf!”</i> [wulfe.name] growls, pulling back momentarily. Her messy dark blonde hair hangs over your face, shading you as she grins. <i>“You seem totally fine already, pet. Here.”</i>");
	output("\n\nShe tugs you to your [pc.feet], dusting you off before taking ahold of your leash.");
	output("\n\n<i>“Ready to keep going?”</i> she asks. <i>“Remember, any time you want a break,”</i> she continues with a wink, <i>“I’m here for you.”</i>");
	output("\n\n“Thank you, mistress,” you say, nodding. She turns and gives the leash a gentle tug, looking back to make sure you’re keeping up before smiling and resuming her walk. You follow behind her, safe as can be.");

	pc.loadInAss(wulfe);
	pc.orgasm();
	wulfe.orgasm();
	pc.exhibitionism(2);

	IncrementFlag("WULFE_SEXED_ANAL");
	
	addButton(0, "Next", mainGameMenu);
}

// SIEGWULFE LUST BEGINS HERE
public function processSiegwulfeLust(totalHours:uint):void
{
	//Wulfy gains 2 lust per hour
	if (hasSiegwulfeOnSelf()) wulfe.lust(1.5*totalHours);
}
public function siegwulfeLustScene(lust:Number, lustDif:Number):void
{
	// Regular wulfe doesn't get horny
	if (!siegwulfeIsDom()) return;
	if (siegwulfePickScene(lust) < 0) return;
	// Unnecessary but nice. We don't wanna flood eventQueue
	if (eventQueue.indexOf(siegwulfeLustSceneGo) >= 0) return;

	// Siegy gets antsy once lust hits 100
	if (lust >= 100) lustDif *= 5;

	// Poisson distribution, lambda = 1 horny bimbo scene/30 lust. Ups to per 20 lust if leashed. If k == 0 happens, no scene.
	// 50+ first time leash tease scene gets to skip this check.
	if (lust >= 50 && flags["WULFE_LEASH_TEASE"] == undefined && hasSiegwulfeLeashOn()) eventQueue.push(siegwulfeLustSceneGo);
	else if (100*Math.exp(-lustDif/(hasSiegwulfeLeashOn() ? 20 : 30)) > rand(100)) return;
	else eventQueue.push(siegwulfeLustSceneGo);
}
public function goodPlaceForSiegwulfeToFuck():Boolean
{
	if (InRoomWithFlag(GLOBAL.HAZARD)) return false;
	if (InRoomWithFlag(GLOBAL.ICYTUNDRA)) return false;
	if (InRoomWithFlag(GLOBAL.FROZENTUNDRA)) return false;
	if (InRoomWithFlag(GLOBAL.FAPPING_ILLEGAL)) return false;
	return true;
}
public function siegwulfePickScene(lust:Number):int
{
	// WULFE_LAST_LUST_SCENE: 0 -> did 10-32 scene, 1 -> did 33-74 scene, 2 -> did 75-89 scene, -1 -> flag is reset
	// Reset at lust < 10
	if (flags["WULFE_LAST_LUST_SCENE"] == undefined || lust < 10) flags["WULFE_LAST_LUST_SCENE"] = -1;

	// At least 30 min should pass between scenes
	if (pc.hasStatusEffect("Wulfe Lust Cooldown")) return -1;
	// Absent wulfe can't fuck you. Soz.
	if (!hasSiegwulfeOnSelf()) return -1;

	var newLustScene:int = -1

	// "Might be good if every scene is done at least once (or at least the 75-89 scene)
	// so she doesn’t suddenly spring the rut scene on you? Not hugely bothered about this though."
	if (lust >= 90 && flags["WULFE_LAST_LUST_SCENE"] < 2) newLustScene = 2;
	else if (lust >= 90 && flags["WULFE_LAST_LUST_SCENE"] < 3 && goodPlaceForSiegwulfeToFuck()) newLustScene = 3;
	// Other scenes
	else if (lust >= 75 && flags["WULFE_LAST_LUST_SCENE"] < 2) newLustScene = 2;
	else if (lust >= 33 && flags["WULFE_LAST_LUST_SCENE"] < 1) newLustScene = 1;
	else if (lust >= 10 && flags["WULFE_LAST_LUST_SCENE"] < 0) newLustScene = 0;

	// Leash Scenes
	if (hasSiegwulfeLeashOn() && InPublicSpace() && goodPlaceForSiegwulfeToFuck())
	{
		// First leash warning does its best to trigger
		if (lust >= 50 && flags["WULFE_LEASH_TEASE"] == undefined) newLustScene = 4;
		// 50% not to override chosen scene, if there is one
		else if (rand(2) == 0 && newLustScene >= 0) newLustScene = newLustScene;
		else if (lust >= 90) newLustScene = 5;
		else if (lust >= 33) newLustScene = 4;
	}

	return newLustScene;
}
public function siegwulfeLustSceneGo():void
{
	// Now pick a scene to play
	var newLustScene:int = siegwulfePickScene(wulfe.lust());
	// If no scene is available just skip
	if (newLustScene < 0) return mainGameMenu();

	// Hijack this to offer leash to collared PCs
	if (rand(3) == 0 && newLustScene != 3 && hasWornCollar() && flags["WULFE_LEASH"] == undefined) newLustScene = 6;

	pc.createStatusEffect("Wulfe Lust Cooldown");
	pc.setStatusMinutes("Wulfe Lust Cooldown", 30);

	if (newLustScene < 4) flags["WULFE_LAST_LUST_SCENE"] = newLustScene;
	switch (newLustScene)
	{
		case 0: siegwulfeCheckup(); break;
		case 1: siegwulfeInterest(); break;
		case 2: siegwulfeIsHorny(); break;
		case 3: siegwulfeStalking(); break;
		case 4: siegwulfeLeashTease(); break;
		case 5: siegwulfePublicFuck(); break;
		case 6: siegwulfeLeashies(); break;
	}
}

public function siegwulfeCheckup():void
{
	clearMenu();
	clearOutput();
	author("Wsan");
	showSiegwulfe();
	processTime(1+rand(2));
	//scene name: Siegwulfe checkup
	showName("SIEGWULFE\nCHECKUP");
	
	output("<i>“How are you doing, [wulfe.pcname]? Is my pet feeling okay?”</i> [wulfe.name] says, smiling.");
	if (pc.HPQ() < 66)
	{
		output("\n\n<i>“I’m a little hurt,”</i> you admit, <i>“but I should be okay.”</i>");
		output("\n\n<i>“Oh no, you have to take care of yourself!”</i> she says, looking forlorn. <i>“Let’s go back and rest soon.”</i>");
		output("\n\n<i>“Sure,”</i> you say, smiling weakly.");
	}
	else if (pc.lust() >= 66)
	{
		if (pc.isBimbo()) output("\n\n<i>“Don’t tell anyone, but I am like, </i>totally<i> fucking horny right now,”</i> you confess to her. <i>“Gimme a few minutes and I might just be on the ground spreading my lil cunny open for your big fat doggy cock!”</i>");
		else output("\n\n<i>“Actually, I’m really, really horny right now,”</i> you tell her, glancing over to see her grinning. <i>“I might come to you for some help soon...”</i>");
		output("\n\n<i>“Perfect,”</i> she murmurs, eyeing you eagerly. <i>“I’m looking forward to it.”</i>");
	}
	else
	{
		output("\n\n<i>“Everything’s good,”</i> you reply, giving her a nod. <i>“Thanks, mistress.”</i>");
		output("\n\n<i>“Glad to hear it,”</i> she replies, her tail curling around you as she draws closer. <i>“Don’t hesitate to ask me for any help you might need.”</i>");
		output("\n\n<i>“I won’t, mistress,”</i> you say, smiling when she leans in to kiss you on the cheek. <i>“Thank you.”</i>");
	}

	addButton(0, "Next", mainGameMenu);
}

public function siegwulfeInterest():void
{
	clearMenu();
	clearOutput();
	author("Wsan");
	showSiegwulfe();
	processTime(1);
	//scene name: Interested Siegwulfe
	showName("INTERESTED\nSIEGWULFE");

	output("<i>“Considered taking a break lately, [wulfe.pcname]?”</i> [wulfe.name] asks you, stretching out and letting her huge, eye-catching breasts do their job. <i>“With all the hard work you do, you could use a little time off.”</i>");
	output("\n\n<i>“I definitely could do with a little R&R...”</i> you say, openly watching her curvaceous tits before blinking in realization. <i>“Uh, soon. Maybe really soon.”</i>");
	output("\n\n<i>“Oh, good,”</i> she murmurs in reply, drawing closer. <i>“Because I was just thinking about holding you down with a paw on your back while I ravage your ass with my cock.”</i>");
	output("\n\nYou swallow at the directness of her speech. It’s not difficult to imagine the scenario");
	if (pc.lust() >= 66) output(", and you’re <i>already</i> so horny");
	output("...\n\n<i>“Think it over,”</i> she suddenly whispers in your ear, having encircled you without your having noticed. Then she’s patrolling around you again. You shiver in delight.");

	addButton(0, "Next", mainGameMenu);
}

public function siegwulfeIsHorny():void
{
	clearMenu();
	clearOutput();
	author("Wsan");
	showSiegwulfe();
	processTime(1);
	//scene name: Horny Siegwulfe
	showName("HORNY\nSIEGWULFE");
	
	output("<i>“[wulfe.pcname],”</i> [wulfe.name] suddenly breathes in your air, catching you offguard while she wraps her arms around your waist. <i>“I’m this close to mounting you against a wall until you promise to never let me go this long without plowing you again. I long to feel your shaking body entwined with my own, [wulfe.pcname]. If you don’t come to me of your own volition, I will gladly hold you down and fuck your little " + (pc.hasVagina() ? "cunt" : "asshole") + " until you scream for more of the same.”</i>");
	output("\n\n<i>“Mistress,”</i> you moan, putty in her arms. <i>“I- I’m sorry, I’ve been distracted-”</i>");
	output("\n\n<i>“But you are not distracted now, are you, pet?”</i> she murmurs, leaning in to gently lick and bite your ear. <i>“I know you. Such a good pet, but so forgetful.”</i>");
	output("\n\nShe lets you go slowly, fixing you with a predator’s smile. <i>“I almost think you </i>want<i> me to punish-rut you. You’ll get your wish sooner or later, [wulfe.pcname].”</i>");
	output("\n\nStalking away, [wulfe.name] continues patrolling around you. You can’t help but watch her big, curvy ass swaying seductively from side to side as she does so, imagining the weight of her powerful bulk bearing down on your body while she mercilessly punishes you...");

	addButton(0, "Next", mainGameMenu);
}

public function siegwulfeStalking():void
{
	clearMenu();
	clearOutput();
	author("Wsan");
	showSiegwulfe();
	processTime(1);
	//scene name: Siegwulfe stalking!
	showName("SIEGWULFE\nSTALKING!");
	
	output("Looking around, you suddenly realize you’ve lost sight of your beloved and faithful companion, [wulfe.name]. You lift your arms to cup your hands at your mouth and call for her, but you’re suddenly pounced upon and embraced from behind!");
	output("\n\n<i>“M-mistress?!”</i> you cry out in surprise, feeling her " + (pc.isNude() ? "peel away your layers until you’re naked in her groping hands" : "unabashedly grope your naked form") + ". <i>“Oh!”</i>");
	output("\n\nWith the way she’s pressed against you from behind, you can hear and feel just how hard she’s breathing in your ear, almost panting with overflowing desire. Her thick silicon nipples are hard against your back, jutting into your [pc.skinFurScales] and slowly trickling milk. You almost jump in shock at the sudden wet warmth of her tongue licking the back of your neck, followed by light nips at your ears, quiet growls emanating from her throat. Despite being taken so off-guard, you’re so aroused by your mistress’ sheer <i>possessiveness</i> of you that you can’t say no.");

	pc.changeLust(pc.lustMax());
	addButton(0, "Next", siegwulfeRut);
}

public function siegwulfeRut():void
{
	clearMenu();
	clearOutput();
	author("Wsan");
	showSiegwulfe(true);
	processTime(10+rand(21));
	// goes to Siegwulfe rut!
	showName("\nSIEGWULFE RUT!");
	
	var hole:int = -1;
	if(pc.hasVagina() && !pc.isFullyWombPregnant())
	{
		hole = pc.findEmptyPregnancySlot(Creature.PREGSLOT_VAG);
		if(hole < 0) hole = rand(pc.vaginas.length);
	}

	output("Your robotic mistress has you laid out on the ground in a flash, staring down at you with an unnatural, manic grin.");
	output("\n\n<i>“You haven’t had sex with me in like, </i>forever<i>, m-m-m-[pc.master]!”</i> [wulfe.name] chirps, voice so digitized and stuttery that your attention is drawn to her eyes violently flashing between an alarming shade of red and her usual pink until it stops every bit as abruptly as it began. She continues talking normally as though nothing had happened. <i>“You need some rough disciplining, pet. Over and over, until you learn your place. You belong under me.”</i>");
	output("\n\nEven so obviously aroused, her presence is commanding. Towering over you, she lightly kicks your legs apart to expose your [pc.vagOrAss " + hole + "], planting her hindlegs between them to keep you spread. Her long, thick cock slaps against your [pc.stomach] as she roughly jerks her hips, hard enough to sting while she fixes you with a steely gaze. When she pulls back, it’s only to roughly reposition herself at your submissively presented fuckhole.");

	output("\n\n[wulfe.name] grunts as she thrusts forward and sinks the tapered point of her cock inside your quivering " + (hole < 0 ? "asshole" : "pussy") + ", carrying her momentum forward to brutishly push several inches into you in one go.");
	if ((hole < 0 ? pc.ass : pc.vaginas[hole]).looseness() < 4) output(" You can’t help but let a groan of mixed pain and pleasure slip from your lips");
	else output(" You watch her slip inside with nothing more than a sense of growing fullness and pleasure emanating from your nethers");
	output(" as she steps over you with a disdainful look on her face, clearly intent on teaching you a lesson. She remains silent but steadfast in her treatment of you, leaning forward and angling her hindquarters downwards to get in a few swift, savage thrusts into your " + (hole < 0 ? "clenching asshole" : "dripping cunt") + ", clenching her jaw and breathing from her nose.");
	pc.holeChange(hole, wulfe.biggestCockVolume());

	output("\n\nNot hesitating at all, she bucks her wide, womanly hips until your body acquiesces, forced to swallow every inch of her hulking dogcock before she withdraws it and begins to hammer you with a primal lust. Her desire rolls off her in waves, seizing your mind and directing it to the impossible pleasure of your mistress penetrating you to the core. She has you all but impaled on her monstrous length, pinned to the ground beneath her and gasping in bliss. You stroke your own stomach, eyes rolling upward while you use your hands to comprehend the form of her massive cock swelling your body from the inside.");
	output("\n\nIt feels like she’s <i>breaking</i> you, crushing your will to resist her beneath her lithe mechanical feet. Already you can feel the familiar oncoming of orgasm");
	if (pc.isHerm()) output(", your [pc.cocks] tensing up and squirting precum in advance while she plows the fuck out of your shivering pussy");
	else if (pc.hasCock()) output(", your [pc.cocks] tensing up and squirting precum as you draw closer, your mistress’ merciless treatment driving you higher and higher");
	else if (pc.hasVagina()) output(", your mistress’ merciless plowing of your shivering pussy driving you higher and higher, your walls squeezing down on her absurd length");
	output(". You cry out her name as she fucks you right over the edge, not halting her animalistic pounding of your clenching fuckhole even as you cum.");

	output("\n\n<i>“I’m not even </i>close<i> to done with you yet, [wulfe.pcname]!”</i> [wulfe.name] cries out in delight, stretching her forelegs out to get a different angle. <i>“Come on!”</i>");
	output("\n\nYou lose your voice after another twenty minutes, but your overbearing mistress doesn’t care. She’s only interested in repaying you for making her wait, in venting her lusts until she’s satisfied. Her powerful body shifts above you, ever adjusting itself to rut your most sensitive parts with utmost savagery and machine precision. She doesn’t have to cum if she doesn’t want to and she’s proving herself to be a devilishly patient predator, happy to take everything from you without ever giving anything in return.");
	output("\n\nYou’ve long since lost count of how many orgasms she’s made you suffer through, that thick knotted cock driving you wild until you’re little more than a vapid, drooling fucktoy to be pumped full of dogdick. [wulfe.name] pushes you past your breaking point and then keeps going, laughing and revelling in how utterly depraved she can force you to be, her taunting words going in one ear and out the other as your brain struggles to process anything but the most basic of physical sensation. All you can really know for sure that you’re still getting fucked to kingdom come, her massive rod teaching you exactly what it means to be someone’s bitch.");
	output("\n\nWhen she finally cums you’ve been writhing and silently screaming under her for over an hour. Hot");
	if (wulfe.isEggWulfe()) output(", fertile");
	output(" seed pours into you by the litre, your mistress’ exulting moans of ecstasy above you setting your head spinning with eroticism. It’s been so long since you’ve heard those sexy, dirty groans of [wulfe.name]’s orgasm that you immediately cum as if on command, your body remembering its almost-forgotten purpose: to serve her.");
	output("\n\n<i>“Oooohhh, yessss,”</i> [wulfe.name] growls aggressively, lurching forward and planting her feet solidly. <i>“Drink it </i>all<i> in, pet... that’s right. After all the time spent stimulating myself, there’s going to be a lot of it.”</i>");
	output("\n\nShe shoves her knot into you without remorse, your abused hole slipping around its widest point and sucking it inside, ensuring that every drop of your mistress’ seed has nowhere to go but in. Remaining stationary above you, [wulfe.name] makes no move except to completely and utterly drain her bountiful reservoirs inside your slowly swelling form. You shiver and gasp at the sensation, feeling waves of warmth crashing inside you and filling you with a soothing contentment.");
	output("\n\nIt’s so <i>right</i> to be here beneath [wulfe.name], acting as her submissive cumdump. Part of you regrets ever leaving her alone for so long now that you’ve remembered the effect of her attentions, but another... another part of you is consumed with wanton lust, wanting nothing but to experience this over and over, to be broken down and pounded face-first into the dirt like a good-for-nothing slut by your loving mistress.");
	output("\n\n<i>“Good [pc.boyGirl],”</i> she whispers to you amidst your wild fantasies.");
	output("\n\n<i>“Thank you, mistress,”</i> you manage to say back, voice barely audible. <i>“Thank you.”</i>");
	output("\n\n<i>“I think you can be forgiven for your little ‘transgression’, [wulfe.pcname],”</i> she murmurs, pulling herself free of your tortured fuckhole, leaving it gaping and spurting thick seed onto the ground. <i>“Just don’t do it again.”</i>");
	output("\n\nShe hauls you to your unsteady feet, holding you against her voluptuous chest with a smile before she leans in to kiss you, gently, passionately, lovingly. You’re unable to do anything but reciprocate, wrapping your arms around her waspish waist while you kiss her back. Her usual ruthless dominance is nowhere to be seen, her slow, deep kisses that of a lover and companion. [wulfe.name]’s still wearing a genuine smile on those divine lips of hers when she pulls back, momentarily leaning back in to peck you on the forehead.");
	output("\n\n<i>“Now then. Would you like a few minutes to clean up?”</i> she asks good-naturedly.");
	output("\n\nIt’s a little while before you feel capable of walking properly again, and you feel weak enough in the legs that you wind up holding hands with [wulfe.name] just to stay steady. She doesn’t seem to mind.");

	if (hole < 0) pc.loadInAss(wulfe);
	else pc.loadInCunt(wulfe, hole);
	pc.orgasm();
	wulfe.orgasm();
	if (InPublicSpace()) pc.exhibitionism(1);
	
	flags["WULFE_LAST_LUST_SCENE"] = -1;
	IncrementFlag("WULFE_RUTTED");
	IncrementFlag((hole < 0 ? "WULFE_SEXED_ANAL" : "WULFE_SEXED_VAG"));
	
	addButton(0, "Next", mainGameMenu);
}

// SIEGWULFE PREG BEGINS HERE
public function siegwulfeLaying():void
{
	clearMenu();
	clearOutput();
	author("Wsan");
	showSiegwulfe();
	processTime(10+rand(11));
	
	var babies:int = pc.statusEffectv1("Siegwulfe Eggnancy Ends");
	var belly:int = pc.statusEffectv2("Siegwulfe Eggnancy Ends");
	var scene:int = pc.statusEffectv4("Siegwulfe Eggnancy Ends");
	var pregSlot:int = pc.statusEffectv3("Siegwulfe Eggnancy Ends");
	pc.removeStatusEffect("Siegwulfe Eggnancy Ends");
	
	var bigEgg:Boolean = true;

	switch (scene)
	{
		case 0:
			output("Your stomach suddenly shifts, sending you thudding to your [pc.knees] with a gasp.");
			if (hasSiegwulfeOnSelf())
			{
				output(" [wulfe.name] is at your side in a flash, bending down and looking into your face with concern, rubbing your cheek.");
				output("\n\n<i>“Oh...”</i> she murmurs, a smile surreptitiously creeping across her face. <i>“About time.”</i>");
				output("\n\nYou’re about to respond before you feel another lurch, this one even stronger. You cry out in an embarrassingly shrill voice, panting on your hands and [pc.knees].");
				if (pc.hasLowerGarment() || pc.hasArmor()) output(" [wulfe.name] reaches back and pulls your " + (pc.hasArmor() ? "[pc.armor]" : "[pc.lowerGarments]") + " down and y");
				else output(" Y");
				output("ou suddenly realize how <i>wet</i> you are, lubricant dripping from your " + (pregSlot != 3 ? "[pc.pussy]." : "[pc.asshole]."));
				output("\n\n<i>“Good [pc.boyGirl],”</i> [wulfe.name] breathes, face flushed in arousal. <i>“Let me help.”</i>");
				output("\n\nShe plunges two fingers into your weakening orifice as you give up all pretense of containing the sensation, instead letting your head droop while you groan in a mixture of confused arousal and pleasure. Now that you’re over the initial surprise, this feels <i>incredibly</i> good... so much so that you can’t tell whether it’s one of [wulfe.name]’s eggs or your orgasm approaching.");
				output("\n\nThe answer turns out to be both. Shaking and moaning while [wulfe.name] whispers loving words into your ear about how you’re such a good, obedient lover, you feel a fist-sized egg slip " + (pregSlot != 3 ? "past your lips" : "out of your quaking ring") + ", stretching you obscenely wide. You cum the moment it’s free of your body, eyes rolling up into your head in rapturous bliss while the next one slides from your insides. Each egg comes out faster than the last, your orgasmic contractions forcing them from their resting place and out onto the ground in a pile.");
				if (pc.hasCock()) output(" Your [pc.cocks] spurt all over the ground, rocking your mind with the feeling of complete, utter release.");
				output("\n\n[wulfe.name] is very hands-on with the process, fingerfucking you while she plants kisses all over your face, rewarding her obedient submissive. Her attentions ensure that you can never quite escape the feeling of orgasm, your stomach almost cramping from the intensity of it all, muscles shaking in weariness while she drives you onward.");
				output("\n\nWhen it’s finally done she catches you as you slump forward, turning you over and parking you in her lap as you look back at what you’ve laid. An oil-covered pile of six plastic-looking eggs, each one big enough to make you remember what it felt like to lay them. A moan slips from your lips unbidden.");
				output("\n\n<i>“You did so well,”</i> [wulfe.name] whispers to you, patting your head. <i>“Good [pc.boyGirl].”</i>");
				output("\n\nShe tilts your face up and leans over to give you a long kiss, keeping you in her lap until you feel strong enough to get back up. She sticks closer to you now, touching you affectionately and letting her hands linger on your body. You have to admit, it feels nice to be so treasured...");
			}
			else
			{
				output("\n\nYou cry out in an embarrassingly shrill voice, panting on your hands and [pc.knees].");
				if (pc.hasLowerGarment() || pc.hasArmor()) output(" Reaching back and pulling your " + (pc.hasArmor() ? "[pc.armor]" : "[pc.lowerGarments]") + " down, y");
				else output(" Y");
				output("ou suddenly realize how <i>wet</i> you are, lubricant dripping from your " + (pregSlot != 3 ? "[pc.pussy]." : "[pc.asshole]."));
				output("\n\nThe contractions take over your mind, squeezing you so tightly it feels like you’re a towel being wrung. Your head droops while you groan in a mixture of confused arousal and pleasure. Now that you’re over the initial surprise, this feels <i>incredibly</i> good... so much so that you can’t tell whether it’s one of [wulfe.name]’s eggs or your orgasm approaching.");
				output("\n\nThe answer turns out to be both. Shaking and moaning, you feel a fist-sized egg slip " + (pregSlot != 3 ? "past your lips" : "out of your quaking ring") + ", stretching you obscenely wide. You cum the moment it’s free of your body, eyes rolling up into your head in rapturous bliss while the next one slides from your insides. Each egg comes out faster than the last, your orgasmic contractions forcing them from their resting place and out onto the ground in a pile.");
				if (pc.hasCock()) output(" Your [pc.cocks] spurt all over the ground, rocking your mind with the feeling of complete, utter release.");
				output("\n\nWhen it’s finally done you slump forward, turning over on your back and glancing down to see what remains. An oil-covered pile of six plastic-looking eggs, each one big enough to make you remember what it felt like to lay them. A moan slips from your lips unbidden. If only your mistress were here to see to you right now. It takes some time for you to recover on your own.");
			}
			break;
		case 1:
			output("<i>“Oh,”</i> you gasp, sinking to your [pc.knees] and steadying yourself with a hand on the ground. <i>“I- I’m...”</i>");
			if (hasSiegwulfeOnSelf())
			{
				output("\n\n<i>“Eggs?”</i> [wulfe.name] murmurs, openly squeezing her large, jutting nipples in arousal while she looks down at you. <i>“Oh, you’re so </i>good<i>...”</i>");
				output("\n\nShe tends to you as the contractions begin, your stomach tensing over and over as control of your body slips away from you. Rubbing your tummy, she coos soothingly while you pant and moan, edging closer to your delivery. [wulfe.name] lets out an aroused moan to match your own when it finally happens, a large egg slipping free of your knocked-up " + (pregSlot != 3 ? "pussy." : "asshole."));
				output("\n\nCradled by your mistress and giving birth to her blessings created within your own body, you can’t resist. The involuntary contractions squeeze you from bottom to top while you grunt through grit teeth and cum all over yourself, lubricant dripping from your distended fuckhole while a pile of eggs builds between your [pc.legs]. Your [pc.hips] jerk in the air, responding automatically to the sheer pleasure.");
				output("\n\n<i>“Ooohhh, that’s right,”</i> [wulfe.name] croons, stroking your face. Glancing upwards, you can see she’s focused intently on your lower half, biting her lower lip. <i>“There’s still more to come...”</i>");
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
				output("\n\n<i>“Oh... how long was I out?”</i> you mumble, raising yourself to a sitting position against her.");
				output("\n\n<i>“Just a few minutes,”</i> [wulfe.name] replies, wrapping her arms around you. <i>“Are you feeling better now? I don’t want you to get yourself hurt because you’re still tired.”</i>");
				output("\n\n<i>“I’m okay,”</i> you say, touching her hands. <i>“Come on, let’s keep going.”</i>");
				output("\n\n[wulfe.name] lifts you up and plants you on your [pc.feet], joining you at your side with a kiss on your cheek. You pat her tauric body and move on with her guarding you.");
			}
			else
			{
				output("<i>“Fuh!”</i> you gasp, swaying as the presence of [wulfe.name]’s gifts inside you makes itself known. <i>“Nnn...”</i>");
				output("\n\nYou sink to a knee before keeling forward,");
				if (pc.hasLowerGarment() || pc.hasArmor()) output(" hastily removing your " + (pc.hasArmor() ? "[pc.armor]" : "[pc.lowerGarments]") + " before");
				output(" sprawling on your hands and [pc.knees]. The contractions that wrack your body soon have you thrusting your [pc.ass] backwards uncontrollably, your muscles tensing without your control. Moaning, you arch your back and throw your head backwards as an egg begins to dislodge itself, widening your insides before it comes free with a wet slurp.");
				output("\n\n<i>“Gghh! Nnnn-”</i> you strain, gritting your teeth as you mindlessly thrust backwards into the air. It feels so good you can’t even muster the ability to think of resisting the impulse, oily lubrication dripping from your " + (pregSlot != 3 ? "[pc.pussy]" : "[pc.asshole]") + ". <i>“Hhh! Nnnngh!”</i>");
				output("\n\nYour labored pants soon become loud, slutty groans of ecstasy as orgasm takes ahold of you, crushing conscious thought as your");
				if (pc.isHerm()) output(" [pc.cock] jumps, freely spurting seed onto the ground while your [pc.pussy] drips with femcum.");
				else if (pc.hasCock()) output(" [pc.cock] jumps, freely spurting seed onto the ground below.");
				else if (pc.hasVagina()) output(" [pc.pussy] clenches, femcum running down your [pc.thighs].");
				else output(" [pc.asshole] clenches around the eggs, each flex driving you wild.");
				output("\n\nDespite her lack of presence you feel [wulfe.name] all the same, remembering each painstaking, arduous second of her rutting these eggs into you so that you could birth them. Gasping, you collapse forward and turn over to look back at the payload, six fist-sized eggs that were once contained in your body. She certainly likes to give you a <i>lot</i> to remember her by...");
				output("\n\nYou rest up and recover a little before you shakily get to your feet, continuing onwards.");
			}
			break;
		case 3:
		default:
			if (hasSiegwulfeOnSelf())
			{
				output("[wulfe.name] has her arms around you before you even feel the first twinge of internal activity, indicating you’re on the edge of delivery.");
				output("\n\n<i>“U-uh,”</i> you moan, leaning into her. <i>“How did you...”</i>");
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
				output("\n\n<i>“Yes... m-mistress...”</i> you moan, eyes fluttering closed.");
				output("\n\n<i>“Good [pc.boyGirl],”</i> she says, wiping sweat from your forehead with care. <i>“Sleep it off for now.”</i>");
				output("\n\nWhen you awaken, she’s cleaned you off " + (pc.hasLowerGarment() || pc.hasArmor() ? "and has your clothes back in place" : "and has you in her lap") + ". Helping you to your feet, she brushes herself off and regards your expectant face with a giggle.");
				output("\n\n<i>“Aren’t you going to...”</i> you trail off.");
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
				output("\n\nYou finally flop onto your side as the last egg spills into the pile, its exit prompting one last hard, climactic orgasm. Laying there panting, all you can think about is how much you want to go see your mistress for another round. She might have to rut you more than once for it to take, so you’ll have to be completely sure...");
				output("\n\nAfter a rest, you pick yourself up and continue on, head filled with [wulfe.name]’s impossibly attractive body.");
			}
			break;
	}

	pc.orgasm();
	
	output("\n\n<b>You have laid " + num2Text(babies) + " eggs");
	if (scene < 3) output(" this clutch");
	output("!</b>");
	
	output("\n\n");
	oviliumEggReward(bigEgg);
	
	//addButton(0, "Next", mainGameMenu);
}