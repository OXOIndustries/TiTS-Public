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
	if(flags["WULFE_ON_SHIP"] == false) return "\n\nYou remember an order you placed for a Siegwulfe... <b>perhaps you should check to see if it arrived in your ship’s storage?</b>";
	// No Siegwulfe!
	if((!fromInv && !hasSiegwulfe()) || pc.hasItemInStorageByClass(SiegwulfeItem)) return "";
	
	var bonusText:String = "";
	
	if (siegwulfeIsCrew()) bonusText += "\n\n[wulfe.name] is probably somewhere nearby.";
	else bonusText += "\n\n[wulfe.name] is wandering around near you.";
	
	addButton(btnSlot, (chars["WULFE"].short), approachSiegwulfe, [true, fromInv], (chars["WULFE"].short), ("Check up on your loyal " + (chars["WULFE"].isBimbo() ? "bimbobot" : "Siegwulfe") + "."));
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
		// SW is currently on ship
		if(InShipInterior() && !hasSiegwulfe())
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
		if(!pc.hasAccessory() || pc.inventory.length < pc.inventorySlots()) addButton(4, "Take", doSiegwulfeAction, ["take", fromInv], ("Take " + chars["WULFE"].short), "Ask [wulfe.name] to tag along with you.");
		else addDisabledButton(4, "Take", ("Take " + chars["WULFE"].short), "You don’t have any extra room to take her! Try emptying your inventory or taking off your accessory first.");
	}
	addButton(5, "Appearance", siegwulfeAppearance);
	if(debug) addButton(6, "Rename", renameSiegwulfe, fromInv, "Rename", "Change [wulfe.name]’s name to something else.");
	if(fromInv) addButton(14, "Back", itemInteractMenu);
	else addButton(14, "Leave", doSiegwulfeAction, ["leave", fromInv]);
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
		output("\n\nAt present, she’s wearing nothing but a pair of metal shoulder-guards that display " + (9999 == 0 ? "your company’s" : "the Fenrir Robotics") + " logo, surrounded by cute little pink hearts. Why would she cover her body when it’s been designer-made to entice, to draw every wandering stare and leave you wanting more. A tight leather collar, complete with dog-tags, clings to her neck -- a sign of submission, loyalty, and your ownership of her all at once.");
		output("\n\n<i>“Still think I’m, like, super pretty, [pc.master]?”</i> [wulfe.name] purrs pleasantly, taking a step closer and hefting her massive milk-jugs up for your inspection. <i>“Wanna touch? Or can I make you feel suuuuper good and stuff with them? Anything you want, I’m your girl!”</i>");
		output("\n\nShe giggles and wiggles her hips, putting everything on offer.");
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
			output("\n\nHer circuits light up as she eagerly nods, <i>“" + (chars["WULFE"].isBimbo() ? "Like, yes, [pc.master]! We are gonna have so much fun!" : "Of course, [pc.master], I am at your side.") + "”</i>");
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
			output("You give [wulfe.name] a pat on the head and leave her to her own devices for a bit.");
			
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

