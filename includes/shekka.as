//Shekka's Widget Warehouse
//Your one-stop shop for saucy Raskvel funtimes.
//Author: Fenbroxo

/*Notes & Plans:
Last name potentially Mechflai.
Small B-cup, though she doesn't wear a bra.
3'7". Dicks over 14" long can't bottom out in her without some kind of elasticization upgrade. Perhaps Sparrow Brand Flexibility Serum?
Red skin (the color of Stowaway's Scalia (sorry, Savin) [why.jpg]), pink hair (dyed?)
Deep purple vagina. Aft clit is slightly bigger than fore, leading to preference for doggystyle. Nipples eggplant colored.
Tongue is unusually long (8") and the same color as her cooch.
Pink eyes. Vertically slit like a reptile.
"Hair" (pink) is on the long side with a bit of a mane.
Has a subdermal vibrator implanted in her tail. "I'm my own sex toy!"
Tech fetishist (not in the sexual sense. Loves all the gadgetry from the rest of the universe).
Hates "The Mess" and feels like it's just a setup to scout raskvel for sexual slavery under the guise of providing food.
A bit flighty emotionally but cares deeply for her people.
Wears a welding mask and a JoyCo jumpsuit (think Miranda's hexagon-butt suit from ME2 but super thin for maximum camel toe and nip display.
Ears almost reach the floor, and decorated with chiming piercings. Stealth is not her strong suit.
Tail wags when happy.
Nearly infertile - only ever lays one to two eggs that are never fertilized.
Sells a hoverboard (reduces movement times) and other gadgets
*/

//Widget Warehouse Description\
function widgetWarehouseBonusFuntimes():Boolean
{
	output("Reddish dust filters down from the improvised rafters of this small, warehouse-like structure. The door snaps shut behind you with the audible hiss you'd expect from a high-efficiency starship hatch in spite of its placement in a ramshackle hut. Ancient, rusted bins and buckets are stacked into wobbly pillars, each holding mechanical parts, circuits and devices in far better shape than themselves. The light from a dozen fixtures of various designs and luminances shines off the stored machine parts brightly enough to make you shield your eyes as you look around. Leaning against the far wall like an exhausted soldier is an improvised workbench. Why, its middle is built on the back of a torso from a hollowed-out construction droid.");
	output("\n\nThere can be no doubt; you're in an engineer's workshop.");

	//Shekka's Room Appearance Blurb
	//Not met
	if(flags["MET_SHEKKA"] == undefined)
	{
		output("\n\nCrackles and zaps from welding equipment silhoutte the distinctive figure of a long-eared raskvel at work. Her rounded, egg-bearing hips identify her as a female of the species long before anything else. She doesn't seem to be paying attention to you just yet, but you could easily get her attention. This is supposed to be a shop, right?");
		addButton(0,"Mechanic",approachShekka);
	}
	//Met
	else 
	{
		output("\n\nShekka seems to be busy welding together parts from a dozen disparate machines into something new and different. Her tail wags back and forth while she works, brushing against her nearly floor-dragging ears and causing the piercings embedded in them to chime musically.");
		addButton(0,"Shekka",approachShekka);
	}	
	return false;
}

function approachShekka():void
{
	clearOutput();
	userInterface.showBust("SHEKKA");
	userInterface.showName("\nSHEKKA");
	//Approach Introductions
	if(flags["MET_SHEKKA"] == undefined)
	{
		flags["MET_SHEKKA"] = 1;
		output("You noisily clear your throat to get her attention.");
		output("\n\nShe doesn't react.");
		output("\n\n<i>\"Excuse me, miss?\"</i> you try again.");
		output("\n\nNothing but the loud hiss of her welder.");
		//Nice
		if(pc.isNice()) output("\n\nSighing, you call out, <i>\"Miss! Are you open?\"</i>");
		//Mischievous
		else if(pc.isMischievous()) output("\n\nSmirking, you tap her on the shoulder.");
		//Hard
		else output("\n\nFrowning, you yell, <i>\"What kind of shopkeep doesn't keep an eye out for customers!?\"</i>");

		//Merge
		output("\n\nThe little mechanic nearly jumps out of her jumpsuit (a feat you would have thought impossible prior) and screams, <i>\"Eyaaaaaaaaah!\"</i> Her torch flies from suddenly nerveless fingers, but the safety kicks in, disabling it before the arcing electrical discharges can transform the workshop into a blazing inferno.");
		output("\n\nYou step back from the tiny, gasping figure with its face hidden behind a welding mask. Are all raskvel this jumpy?");
		output("\n\n<i>\"Damnit, you nearly gave me a heart attack! Do ya' just go about scaring harmless folk for your own sick pleasure, or did you not see me working here?\"</i> She rounds on you, lifting her mask to reveal luminous pink eyes, a button nose, and unruly, salmon-tinted feathers in place of hair. She inhales sharply at the sight of you, interrupting her own tirade, <i>\"Well... hello there, offworlder. Pardon my rudeness; I thought you might be a youngling with a bit too much time on his hands. I have to chase them out of my shop at least twice a rotation, it seems. \"</i> The raskvel smiles sheepishly before extending her hand. <i>\"The name's Shekka, and this here's my shop. Nice to meet ya.\"</i>");
		output("\n\nYou shake the diminutive girl's hand and introduce yourself. Then, you muse aloud, <i>\"This whole shop is yours?\"</i>");
		output("\n\n<i>\"You betcha,\"</i> she reports, her grin widening into a sassy smile. <i>\"Don't underestimate what one of us small folk can accomplish.");
		if(pc.tallness <= 50) output(" I suppose you wouldn't though. Always nice to get to talk to someone eye to eye, if you catch my meaning.");
		output("\"</i> Turning away, she reaches for the torch and unintentionally gives you an eyeful of her wide-hipped derriere, framed by a broad thigh-gap that gives you a decent look at an alien camel-toe through the thin fabric of her white, hexagon-patterned jumpsuit. The clang of the tool being set on her half-finished project draws your attention back up before you get caught staring.");
		output("\n\n<i>\"I'm the best gadget dealer in all of Novahome. Whether it's a custom-built repair from the scrapheap or an order from a core-based megacorp, I've got what you need,\"</i> Shekka proudly declares. <i>\"What can I help you with?\"</i>");
	}
	//Repeat Approach
	else
	{
		output("You call out her name, and Shekka immediately steps away from her current project. The welding mask pops up out of the way to reveal a smiling face below. <i>\"Welcome back, [pc.name]. Got a purchase to make or did you want to jabber a bit?");
	}
	//Menu
	shekkaMainMenu();
}

function shekkaMainMenu():void
{
	shopkeep = chars["SHEKKA"];
	chars["SHEKKA"].keeperBuy = "<i>\"I'd like to buy something,\"</i> you offer. <i>\"What have you got for sale?\"</i>\n\nShekka spreads her arms to encompass her entire shop. <i>\"Just about anything you see is for sale, but you probably don't have much interest in buying your gadgets by the part. I've got a few items that seem pretty popular among you rushers. One second.\"</i> She fiddles with a slim, sparking device atop her workbench to little effect. Growling, she grabs a wrench and whacks it. A flickering, holographic menu displays her wares and their prices. <i>\"There we go!\"</i>\n";
	//List prices and whatnot. Back should go back to Jade's main menu.
	//Sell Menu
	chars["SHEKKA"].keeperSell = "Shekka remarks, <i>\"I'll buy if it's something worth using.\"</i>\n";
	chars["SHEKKA"].keeperGreeting = "Shekka shrugs. <i>\"Well, what do you want then?\"</i>\n";
	clearMenu();
	addButton(0,"Appearance",shekkaAppearance,undefined,"Appearance","Review what Shekka looks like in detail.");
	addButton(1,"Talk",talkToShekka,undefined,"Talk","Talk to Shekka about a range of topics.");
	if(pc.lust() >= 33)
	{
		if(flags["TIMES_SEXED_SHEKKA"] == undefined) addButton(2,"Flirt",shekkaFlirtSexMenu,undefined,"Flirt","Flirt with Shekka in hopes of getting some action.");
		else addButton(2,"Sex",shekkaFlirtSexMenu,undefined,"Sex","See if Shekka is up for some sex.");
	}
	else
	{
		if(flags["TIMES_SEXED_SHEKKA"] == undefined) addDisabledButton(2,"Flirt","Flirt","You aren't turned on enough to try for sex right now.");
		else addDisabledButton(2,"Sex","Sex","You aren't turned on enough to be interested in sex.");
	}
	addButton(5,"Buy",buyItem);
	addButton(6,"Sell",sellItem);
	if(pc.hasStatusEffect("Rusted Emitters")) addButton(7,"Fix Emit.",fixMyEmittersShekka,undefined,"Fix Emit.","See if Shekka can possibly fix your sydian-damaged shield emitters.");
	else addDisabledButton(7,"Fix Emit.","Fix Emit.","Your shield emitters are totally undamaged. Don't worry about it.");
	addButton(14,"Back",mainGameMenu);
}

function fixMyEmittersShekka():void
{
	clearOutput();
	userInterface.showBust("SHEKKA");
	userInterface.showName("\nSHEKKA");
	output("<i>\"One of the sydians did a number on my shield emitters. You think you could fix them?\"</i>");
	output("\n\nShekka circles you, looking your equipment over with a practiced eye before blurting out, <i>\"Oh, wow! The projector is all corroded, and I can see some degradation of the cabling here and here!\"</i> She jabs a finger into your side and your chest before launching herself onto your back to get at your shield projector directly. You stumble around the shop under the surprise weight, trying to catch yourself on the piles of junk. Shekka's hands seem to be everywhere at once, and she never stops streaming technobabble into your ears.");
	output("\n\nYou interrupt her. <i>\"Can you fix it?\"</i>");
	if(pc.hasHair()) output("\n\nRuffling your [pc.hair]");
	else output("\n\nRubbing your head for good luck");
	output(", she declares, <i>\"A simple job like this? You bet your ass I can.\"</i> She slows her excited scrambling. <i>\"Oh, and I guess it should cost... 50 credits? Gotta make a living, you know.\"</i>");
	output("\n\nWill you pay her 50 credits to fix your emitters?");
	//[Yes/No]
	clearMenu();
	if(pc.credits >= 50) addButton(0,"Yes",shekkaActuallyFixesEmitters,undefined,"Yes","Pay Shekka 50 creds to fix your emitters.");
	else addDisabledButton(0,"Yes","Yes","You can't afford to have her fix your emitters.");
	addButton(1,"No",turnDownEmitterFixingFromShekka,undefined,"No","Turn down getting your emitters fixed for right now.");
}

function shekkaActuallyFixesEmitters():void
{
	clearOutput();
	userInterface.showBust("SHEKKA");
	userInterface.showName("\nSHEKKA");
	output("<i>\"Sure thing.\"</i> You transfer the credits as fast as you can with sixty pounds of rambunctious alien prodding you everywhere. It's tough to keep track of her, but you're pretty sure that she crawls around your middle at one point. A second later, she's hanging down by your [pc.butt] with her feet clutching tightly to your head. You try not to blush from her intimate closeness.");
	output("\n\nBefore you know it, your emitters are fixed and the sassy mechanic is springing off of you. <i>\"A pleasure as always, [pc.name]. You be sure and come back to me if you have any more sydian problems, okay?\"</i>");
	output("\n\nYou nod, uncomfortably aware of the residual warmth she left behind while she snaps her welding mask back into place and resumes working.");
	//+lust
	pc.lust(5);
	//-50creds
	pc.credits -= 50;
	//2m pass
	processTime(2);
	pc.removeStatusEffect("Rusted Emitters");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
function turnDownEmitterFixingFromShekka():void
{
	clearOutput();
	userInterface.showBust("SHEKKA");
	userInterface.showName("\nSHEKKA");
	output("Finally managing to get a grip on the rambunctious mechanic, you peel her off and lower her to the floor, uncomfortably aware of how her body had been pressing into yours. <i>\"Not right now. I might have the credits to spare later, though.\"</i>");
	output("\n\nShekka shrugs and smiles. <i>\"Suit yourself. Something else you want?\"</i>");
	//+lust
	pc.lust(5);
	processTime(1);
	//Main menu
	shekkaMainMenu();
}

//Appearance Screen
function shekkaAppearance():void
{
	clearOutput();
	userInterface.showBust("SHEKKA");
	userInterface.showName("\nSHEKKA");
	output("From Shekka's distinctively long ears to egg-bearing hips that easily dwarf her narrow shoulders, she is a prime example of a healthy raskvel woman. Her feathery plumage is long for her species, down past the nape of her neck and dyed into a comely pink mane. A twist of wire wraps some of the feathers together into a tight cord that hangs down the side of her face for simple ornamentation. Just above it, her ears emerge. They're long and floppy, as you've come to expect, and dangle down to her ankles. She has perhaps the biggest ears of any raskvel you've met, and they are so heavily pierced that her every movement is accompanied by musical chiming.");
	output("\n\nShekka's face features two pink, slitted eyes, a button nose, and large but uncared for lips. She could really doll herself up if she desired, but it's clear that the inquisitive raskvel has interests beyond her own potential beauty. Her smile is still quite winsome, and her large eyes make you question if you'd be able to turn her down if she were to beg for something.");
	output("\n\nThe rest of her body, including her hands, feet and tail, is shrink-wrapped in a white, hex-patterned jumpsuit bearing the symbol the Aegis Shipyards LLC over one B-cup breast. In spite of the full body cover, she manages to make it look absolutely lewd. Her nipples stick out as if shrink-wrapped, and her lush netherlips appear enhanced rather than covered by the nano-weave fabric. You can even make out the twin bumps of her front and rear clits! Given the intelligent gleam in her eyes, you can only assume that she doesn't care much for modesty. One doesn't simply \"forget\" to wear underwear with a garment like that.");
	if(flags["TIMES_SEXED_SHEKKA"] != undefined) output("\n\nYou know from experience that her pussy and tongue are both a deep, vibrant purple, while her nipples are a lighter eggplant shade. Her scales are pale red from the top of her head to her toes.");
	else output("\n\nYou can only guess at the coloration of her alien genitalia, but one thing you can tell is that her scales are a pale red in hue. Likely the pigmentation continues below the neckline of her jumpsuit. You'd have to talk her out of it if you wanted to confirm, though.");
	//No new paragraph:
	output(" All together, her narrow form only takes up a little over three and a half feet of space. They do say big things can come in small packages, however.");
	clearMenu();
	addButton(0,"Next",approachShekka);
}

//Talk
function talkToShekka():void
{
	clearOutput();
	userInterface.showBust("SHEKKA");
	userInterface.showName("\nSHEKKA");
	trace("SHEKKA TALKS:" + flags["SHEKKA_TALK_COOLDOWN"]);
	//Good to talk [First Time]
	if(flags["SHEKKA_TALK_COOLDOWN"] == undefined)
	{
		flags["SHEKKA_TALK_COOLDOWN"] = 6;
		output("Shekka smiles. <i>\"You sure you're a real rusher? The rest of them buy what they need and charge out into the wilderness without looking at me twice. If you spend too much time schmoozing with the locals, how do you expect to make a fortune?\"</i> She blinks innocently. <i>\"That's not to say that I don't mind your company. I just don't want to cost you anything more than what I actually charge.\"</i>");
		output("\n\nYou inform her that you only have to beat one person out there. Even then, you'll get to go up against " + chars["RIVAL"].mf("him","her") + " a lot more before this is all over.");
		output("\n\n<i>\"Great! I was wanting to take a break anyway. Got something in mind?\"</i> Shekka asks with a tilt of her head. Her ears softly jingle.");
	}
	//Talked Within The Past Six Hours
	else if(flags["SHEKKA_TALK_COOLDOWN"] != 0)
	{
		output("Shekka shakes her head. <i>\"Sorry, [pc.name], but I've got a lot of work to get done around here. I can't very well sit around chatting all day!\"</i> She brushes a bound strand of feathers out of her eyes. <i>\"We can still do business if you need something.\"</i>");
		//Main menu with talk disabled
		shekkaMainMenu();
		removeButton(1);
		addDisabledButton(1,"Talk","Talk","You'll have to wait a while until Shekka has time to talk once more.");
		return;
	}
	//Repeat Good To Talk
	else
	{
		flags["SHEKKA_TALK_COOLDOWN"] = 6;
		output("Shekka grins. <i>\"You know, if you keep visiting me like this, I'm going to think you're developing a raskvel kink.\"</i> She whispers, <i>\"You wouldn't be the first.\"</i> You start to answer, but she cracks up with infectious laughter. <i>\"Relax, [pc.name], it's not a big deal. As a species, we, well... we like to fuck - a lot. It's a fact. If you put together a chart of the sluttiest races in the galaxy, we'd be in the top twenty five percent, if not higher.\"</i> She snorts, <i>\"I guess we're getting popular, in a way. I can't say I really mind.\"</i>");
		output("\n\nThe tiny mechanic puts a hand on her hip, cocking it to the side. <i>\"I assume that if you wanted to talk about how easy we are, you would've been a little flirtier. Anyway... what did you want to talk about?\"</i>");
	}
	//Didn't return out? TALK MANU!
	clearMenu();
	addButton(0,"Tarkus",talkToShekkaAboutTarkus,undefined,"Tarkus","Ask Shekka about Tarkus to find out more about it from a local's point of view.");
	if(flags["SHEKKA_TALKED_TARKUS"] != undefined) addButton(1,"Raskvel",talkToShekkaAboutRaskvel,undefined,"Raskvel","Ask about Shekka's race, the raskvel.");
	else addDisabledButton(1,"Raskvel","Raskvel","You'll need to talk about Tarkus before getting into a discussion about its inhabitants.");
	if(flags["SHEKKA_TALKED_RASKVEL"] != undefined) addButton(2,"Her Plan",shekkasPlanDiscussion,undefined,"Her Plain","Discuss Shekka's plan in detail.");
	else addDisabledButton(2,"Her Plan","Her Plan","You'll need to talk to Shekka about her people, the raskvel, before learning about her plan.");
	if(flags["SHEKKA_TALKED_TARKUS"] != undefined) addButton(3,"Novahome",talkToShekkaAboutNovahome,undefined,"Novahome","Inquire about the Novahome in detail.");
	else addDisabledButton(3,"Novahome","You'll need to ask about Tarkus first.");
	if(flags["SHEKKA_TALKED_TARKUS"] != undefined) addButton(4,"The Wastes",talkToShekkaAboutTheWastes,undefined,"The Wastes","Ask Shekka about the wastes and what they're like.");
	else addDisabledButton(4,"The Wastes","The Wastes","You'll need to ask about Tarkus in general first.");
	if(flags["SHEKKA_TALKED_NOVAHOME"] != undefined) addButton(5,"Her Shop",talkToShekkaAboutHerShop,undefined,"Her Shop","Ask Shekka about her shop.");
	else addDisabledButton(5,"Her Shop","Her Shop","You'll need to ask about the Novahome before asking about her shop.");
	if(flags["SHEKKA_TALKED_HERSHOP"] != undefined) addButton(6,"Herself",talkToShekkaAboutHerself,undefined,"Herself","Ask Shekka about herself.");
	else addDisabledButton(6,"Herself","Herself","You'll need to ask about Shekka's shop before asking about her personally.");
	addButton(7,"The Mess",talkToShekkaAboutTheMess,undefined,"The Mess","Ask Shekka about the nearby food place, \"The Mess.\"");
	addButton(14,"Back",approachShekka);
}

//Tarkus
function talkToShekkaAboutTarkus():void
{
	clearOutput();
	userInterface.showBust("SHEKKA");
	userInterface.showName("\nSHEKKA");
	output("You mention that you'd like to hear more about Tarkus from a local's perspective.");
	output("\n\n<i>\"That's... a smart question, [pc.name],\"</i> Shekka observes. <i>\"Most people that stop to ask me something are either trying to make a joke at my expense or wanting to know if our vaginal secretions are acidic.\"</i> She rolls her eyes. <i>\"I even had someone asking me if goo-girls were likely to gum up artificial genitalia. I told him no, of course. Any cybernetic dick worth its cock-mustard would be built to handle a little aqueous loving.\"</i>");
	output("\n\nThere is no way you can avoid cocking an eyebrow to such a fact.");
	output("\n\n<i>\"Pshhh, if that makes your carburetor sputter, I've got some stories for you!\"</i> Shekka teases while walking over to her workbench. She leans against it like an old friend. <i>\"But you wanted to hear about Tarkus, so I might as well stick to the topic at hand.\"</i>");
	output("\n\nYou ");
	if(pc.isNice()) output("smile and");
	else if(pc.isMischievous()) output("grin and");
	else output("coldly");
	output(" agree.");
	output("\n\n<i>\"I can tell you what my people know, which is about as limited as a sexbots vocabulary, unfortunately. We've never been much for record-keeping,\"</i> the raskvel notes, <i>\"but so far as we can tell, Tarkus is put together from two different half-planets of about the same size and composition. We figure the goblins must have trashed them both and then picked up the pieces rather than jumping out of system. There's more than a few asteroid belts out there thanks to them.\"</i> She sighs. <i>\"They might be the only ones on this rust ball more destructive than my own people.\"</i>");
	output("\n\n<i>\"What do you mean?\"</i> you ask.");
	output("\n\nSighing even more heavily, Shekka goes on, <i>\"Most raskvel don't really... What's the word you humans have for it? Oh! Plan! They don't really plan ahead. If a tribe is already straining their food supply, they'll keep on fucking like nobody's business. If there's no more room in the warrens for any more of us, they'll just keep laying eggs and kick out the least popular among them.\"</i> She puffs out her cheeks in frustration. <i>\"We're the same way with machines too. Put a radiation-spewing reactor a few miles away from a tribe, and in a few weeks we'll either have it fixed or be dying from radiation poisoning.\"</i>");
	output("\n\nReally? You can't help but look a little incredulous.");
	output("\n\nShekka nods. <i>\"Really. We can't help it. When we see something broken - the more technological the better - we get almost like this itch in the back of our heads. We have to go poke around it, prod it, and try to fix it. It's impossible not to! And then when we do fix something?\"</i> She sags a little bit against the bench, her fingers gripping it hard. <i>\"It's almost as good as sex. Not as passionate or pleasure-filled, but the satisfaction... ohhh, the satisfaction. You ever have a nice meal after having to go hungry for a while? Turning something from garbage into a working, productive machine is at least twice that good.\"</i> Her pink, slitted eyes twinkle. <i>\"Why do you think I'm here, making my living fixing and selling gadgets?\"</i>");
	output("\n\nYou tell her she ought to consider lowering her prices.");
	output("\n\n<i>\"Not on your life, [pc.name]. I'm the best mechanic in Novahome, and you're nuts if you think that I'm going to cheapen my skills just because I get a thrill out of practicing them!\"</i> She shakes her head. <i>\"Anyways, the goblins fucked this planet up something fierce. Some of 'em live in the filth around us, but a fair portion of them moved up into their space station. Now they just make us mine up resources or enslave us while the rest of us try to make a living off their garbage.\"</i> Scowling, Shekka pushes off her workbench and paces. <i>\"They treat us like animals.\"</i>");
	output("\n\nA gout of steam issues forth from a device that looks like little more than tangled pipes strapped to a display, starting the both of you. Shekka straightens, though her shoulders seem burdened by unspoken responsibility. <i>\"Looks like duty calls, [pc.name]. Talk later, 'kay?\"</i>");
	flags["SHEKKA_TALKED_TARKUS"] = 1;
	processTime(15+rand(10));
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Raskvel
function talkToShekkaAboutRaskvel():void
{
	clearOutput();
	userInterface.showBust("SHEKKA");
	userInterface.showName("\nSHEKKA");
	//Unlocked via Tarkus Chat
	output("You ask her if she'd like to talk more about her race, the raskvel.");
	output("\n\n<i>\"Seems a little narcissistic, but if you really want, I suppose I could jabber about my people a little,\"</i> Shekka answers with an exaggerated shrug of her tiny shoulders. She gestures for you to follow and starts milling around pillars of buckers and parts, rambling all the while. <i>\"Near as I see it, we're a byproduct of this metallic dustball your people have christened Tarkus.\"</i> She stops at an oversized bucket and roots around inside it for a part. Her feet flail in the air when she dives a little too deeply and nearly falls in, but she keeps talking all the same.");
	output("\n\n<i>\"We figure we probably started out on the other half of the planet; there's a lot more of us over there. The farther you get from the divide - that's the space where the planet halves meet - the less of us you tend to run into, at least on this side. Over there we're as thick as fermites in a ruined girder,\"</i> Shekka explains while climbing her way out of the bin and searching around for another, still working on something. <i>\"Not just us either. The Lapinara are the same way. Maybe we both came from the same ancestor, I don't know. There's enough similarities to make you wonder, right?\"</i>");
	output("\n\nYou find yourself nodding, though Shekka is too busy examining serial numbers on power converters to see.");
	output("\n\n<i>\"Anyhow, like I was saying, I think we're the way we are because of the way Tarkus is. It's a terribly dangerous place filled with poisons, radiation, and machinery that's as likely to rust away as kill you. And us? We're able to identify plenty of poisons by scent alone. We're immune half a dozen others. We can cope with radiation better than most, and we breed almost as fast as we mature. Oh, and there's the bit about us being naturally inclined to tinker and repair with just about anything you put in front of us.\"</i> She comes up with a gleaming cylinder and smiles, first at it, then you.");
	output("\n\nThose do seem to be traits well matched to surviving in a place like this. You tell her as much.");
	output("\n\nShekka shakes her head sadly while hooking her prize on a thin belt attached to her jumpsuit. <i>\"Yeah, good for surviving here, but not so good for making it on our own. Focusing on fixing things is great when you've got a race like the goblins leaving broken tech left and right, but what happens if we want to make our own start somewhere? Without something to fix, we're more likely to laze around and fuck than do anything productive. Then what? We overpopulate and starve ourselves out.\"</i> The little mechanic sighs heavily. <i>\"Sorry if I'm getting a little bit grim, but I've been thinking about this a lot.\"</i>");
	output("\n\n<i>\"I don't mind,\"</i> you reply. <i>\"I did want to learn about your people, remember?\"</i>");
	output("\n\nSmiling, the short-statured alien places her hands on her significant hips and says, <i>\"Well aren't you a breath of contaminant-free air.\"</i> She turns to walk in another direction, crooking a finger your way to indicate that you should keep up. ");
	if(pc.tallness < 50) output("Luckily, you're short enough to slip after without having to duck under a low arch of well-stacked light fixtures.");
	else output("You have to duck under an arch of well-stacked light fixtures to follow.");
	output(" <i>\"So, yeah... we're ideal for surviving on Tarkus, but not for mastering it. We just don't seem to have that creative spark that the goblins are so flush with or the inherent need for greatness that so drives the terrans.\"</i>");
	output("\n\nTrailing off as she navigates a through a web of charging cables, the sad-eyed raskvel looks for a battery among hundreds. <i>\"I never really thought about this kind of stuff until we found Novahome, and even then, I never dwelled on it 'til the rush found us. It was hard enough just to survive, you know?\"</i>");
	output("\n\nYou give an understanding nod while trying to puzzle out what she's working on.");
	output("\n\n<i>\"Now it's all I can think about - aside from finding new tech to fiddle with. If we don't do something fast, we're going to wind up as little more than slaves, either to the goblins or the rest of the universe.\"</i> You think you see a little moisture pooling at the corner of one slitted eye, but she wipes her hand past it before you can be sure. <i>\"Naturally, I realized that we were broken, and it suddenly made sense why I was thinking about this so much.\"</i>");
	output("\n\nYou retort, <i>\"But how could you fix yourselves? That seems impossible, or at least improbable.\"</i>");
	output("\n\nShekka plucks a battery from a charging bay and hooks it on her belt before straightening to look you dead in the eye. <i>\"It's that or give up, and I don't give up.\"</i>");
	output("\n\n<i>\"Well, how do you propose to fix an entire species?\"</i> It seems a task far beyond a simple mechanic.");
	output("\n\nShekka starts off again, her tail looping over your [pc.butt] to tug you along after her. <i>\"I didn't know at first, but your extranet gave me the idea.\"</i> She clicks her tongue. <i>\"That's a fantastic piece of work, let me tell you. A galactic network of data exchange at near synchronous speeds is quite the panty-soaking technological feat. Luckily, I don't wear any.\"</i> She turns to wink slyly at you. Her footsteps have almost carried her back to her workbench, specifically a part of it that houses a powered-down robot.");
	output("\n\nSetting the gathered components next to this obvious side project, the raskvel tries to hide her blushing from you. It isn't that obvious, but you can pick out a certain crimson brightness on her pale red cheeks. <i>\"When it comes down to it, we're all basically biological machines. Sure, we have more freedom than a 'bot, but ultimately we're still prisoners to our body's drives. A few terrans may manage chastity, but most can't. We're better about some things but worse about lots of others. Ya know?\"</i>");
	output("\n\nShekka pries open an access panel, not even bothering to wait for a response before continuing. <i>\"Well, you guys - the rest of the universe, I guess - has been working on gene modifications for centuries. Why else do you think the median terran and ausar phallus sizes have increased so rapidly?\"</i> She rearranges some wires and inserts the power converter. <i>\"All I want to do is put that to work. See if I can broaden our drive to fix into a desire to create. Tamp down our breeding instincts a little, too. If we're not dying by the thousands to freak ");
	if(!silly) output("industrial");
	else output("gasoline fight");
	output(" accidents, there's no need to have so many kids. Maybe we could just tweak down the number of eggs we lay at a time.\"</i>");
	output("\n\nShaking her head, the girl skillfully tightens something inside the machine's chest cavity. <i>\"Anyway, the point is that if we can scrape together enough credits, maybe we can get a modification package put together that will fix us. That way, we can do more than fuck, eat and kill ourselves on dangerous tech.\"</i> She snaps the battery into robot and closes the hatch. <i>\"Just like this robot. It was out there killing people.\"</i> Her finger flicks the activation stud. <i>\"Now it's going to be somebody's bodyguard.\"</i>");
	output("\n\nYou step back in alarm, a hand on your " + pc.meleeWeapon.longName + " just in case something goes wrong once it's activation sequence completes. The barrel-chested machine jolts upright, deadly blades at the end of its arms folding into narrow fingers. <i>\"Shekkatech B.D. Guard at your service. Master designation not found. Who is my master?\"</i> Its flickering amber eyes search around the room.");
	output("\n\nShekka clicks the machine off for now. <i>\"He still needs a little more work on his circuits, but he's getting there.\"</i> Looking up at you, she admits, <i>\"I didn't think you'd stick around through all of that, to be honest, but that's my plan.\"</i> She looks like she's expecting judgement or reproach, but when none comes, she breaks into a smile. <i>\"It'll be expensive as all hell, I know. The elders see the wisdom in it, though. We figure in a few years, we'll have the credits stored up. We just to keep your megacorps from ruining our little haven until then.\"</i>");
	output("\n\nTaking you by the ");
	if(pc.tallness >= 84) output("[pc.leg]");
	else if(pc.tallness >= 70) output("[pc.hip]");
	else if(pc.tallness >= 60) output("waist");
	else output("[pc.chest]");
	output(", Shekka plants an affectionate kiss on your ");
	if(pc.tallness >= 84) output("[pc.skinFurScales]");
	else if(pc.tallness >= 70) output("hip");
	else if(pc.tallness >= 60) output("arm");
	else if(pc.tallness >= 55) output("shoulder");
	else output("cheek");
	output(". <i>\"Thanks for listening. I could probably talk about our the plan all day long, but I should really get back to work on one of my bigger commissions. Cya around, [pc.name].\"</i>");
	//Unlocks "Her Plan"
	processTime(15+rand(5));
	flags["SHEKKA_TALKED_RASKVEL"] = 1;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Her Plan
//Unlocked via "Raskvel"
function shekkasPlanDiscussion():void
{
	clearOutput();
	userInterface.showBust("SHEKKA");
	userInterface.showName("\nSHEKKA");
	output("<i>\"Your plan's pretty ambitious. Do you mind telling me a little more about it?\"</i> you question.");
	output("\n\nShekka shrugs noncommittally. <i>\"I suppose. There's still a lot I'm not sure about myself.\"</i>");
	output("\n\nYou ask, <i>\"Like?\"</i>");
	output("\n\n<i>\"Well... for starters, there's the ethical quandaries it brings to the table,\"</i> Shekka explains while wringing her hands. <i>\"Anything we do isn't likely to have that big of an effect on adults treated with it, since our thought patterns and drives are fairly developed and entrenched. We wouldn't really be changing our way of life at all, but we would be essentially reprogramming our youngs' mental processes. Even if it's for the better, it gives me the willies knowing that I'd be responsible for widespread, biological mind control.\"</i>");
	output("\n\nShivering, the little aliens wraps her arms around herself, looking very small and more than a little out of her element. <i>\"Then I remind myself that I'm just trying to fix the fucked up drives that mother nature gave us. That's enough to get me to sleep at night, but I still toss and turn thinking about it. Who am I - or even the elders - to judge something like this? By my own admission, we're pretty fucked up as a race.\"</i> She nervously fidgets, grabbing hold of one of her ears and lifting it in front of her, holding onto it like a life preserver.");
	//Bimbo
	if(pc.hasPerk("Ditz Speech") || pc.hasPerk("Brute Speech")) 
	{
		output("\n\nYou ");
		if(pc.hasPerk("Ditz Speech")) output("giggle");
		else output("chuckle");
		output(" and try to come up with something to comfort the little thing. She's so cute when she's worried! <i>\"");
		if(pc.hasPerk("Ditz Speech")) output("Like, don't worry about any of that! You sound super smart, and you like, totally care about them! That's what's important and stuff!");
		else output("Heh, don't worry too much about it, babe. You definitely sound like you're doing what's best for them.");
		output("\"</i>");
	}
	//Nice
	else if(pc.isNice())
	{
		output("\n\nYou put a hand on her shoulder and pull her into a tight hug. <i>\"Someone always has to decide these kinds of things. Better it be someone who cares about the morality of her choices than a cold-hearted politician.\"</i>");
	}
	//Mischievous
	else if(pc.isMischievous())
	{
		output("\n\nYou lean down and poke your finger against the tip of her nose. <i>\"I know this is serious, but you sound like you've got all the angles figured. You shouldn't stress too hard over life - you'll never make it out alive.\"</i> You neglect to mention that you heard something to that effect in an ancient movie.");
	}
	//Hard
	else output("\n\nYou cross your arms and look her square in the eye. <i>\"I don't see the problem here. You don't have any other choice if you want your people to chart their own destiny.\"</i>");
	output("\n\nShekka swallows noisily. <i>\"I know, I know, but it's good to consider all the options. The worst part of it all is that even if we get a treatment designed, we won't be able to force all the tribes to take it. Those of us in Novahome shouldn't be a problem - we can see the problems first hand now that we have the rest of the galaxy to measure against, but the wilders won't accept something like this. Nor are we the type to force it on them.\"</i> Dropping her ear, she starts drumming on the countertop as she thinks. <i>\"The wilders will outbreed the civilized raskvel dozens to one, and I fear that outside of well-defended towns like this one, there will be no change.\"</i>");
	output("\n\nYou think aloud, <i>\"Though your civilized brothers and sisters would be better able to put down roots and develop their own safe havens. They might get a little watered down through crossbreeding, but once they established proper towns and farming, they'd outlive the wilders by a massive margin.\"</i>");
	output("\n\nShekka nods. <i>\"That's the best case scenario anyway. We'll have to see how it all pans out in the long run.\"</i> She runs a hand through her feathers to buy her time to gather her thoughts. <i>\"If I keep talking about this, I'm probably going to start rambling about interstellar philosophy. Maybe it's best we wrapped this up for now.\"</i>");
	flags["SHEKKA_TALKED_PLAN"] = 1;
	processTime(15+rand(5));
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Novahome
//Unlocked via "Tarkus"
function talkToShekkaAboutNovahome():void
{
	clearOutput();
	userInterface.showBust("SHEKKA");
	userInterface.showName("\nSHEKKA");
	output("You ask about Novahome.");
	output("\n\n<i>\"Oh isn't it just the best!\"</i> Shekka throws her arms up in the air and practically dances in place, revealing the flighty side that most of her race seem to spend all their time exposing. <i>\"It's way better than living in some smoky hole in the ground, fighting the sydians or rogue bots every rotation. Hell, it's hard enough to keep the parasitic lapinara from tunneling into our homes, looking for warm bodies to inseminate. We might like laying eggs, but we want them to be our own!\"</i> She puffs her chest out in pride, clearly outlining the curves of her small bosom for all to see. Her nipples stick out like tiny, sore thumbs, begging to be tweaked or touched. You restrain yourself for now, wanting to hear the rest of her words.");
	output("\n\nShekka explains, <i>\"I was pretty young when my tribe moved in. I can still remember huddling in a leaky old cave around the warmth of a dozen half-repaired generators at night. Luckily, one of our neighboring tribes, the Gyss, found the Nova while foraging. They wanted to make it their home, but there were too many sydians inside for them to take on their own, not to mention all the aquiara inside.\"</i>");
	output("\n\n<i>\"Aquiara?\"</i> you wonder.");
	output("\n\n<i>\"Sorry, the translators are still playing catch-up with some of our slang. I'm surprised you understand so many of the idioms I've been throwing out,\"</i> Shekka dutifully apologizes. <i>\"I think most rushers have taken to calling them... gray... goo? Something like that.\"</i>");
	output("\n\nYou tip your head to let her know that you understand now.");
	output("\n\nShekka smirks. <i>\"So anyway, the Nova was full of sydians and gray goo. Rather than fighting each other, they had actually settled into an odd sort of symbiosis. The rust monsters were in a paradise of food, of course. They used their secretions to render the metals digestible. At the same time, the gray goo already in the ship found another use for them: lubricant and protein supply. Somehow, they got the sydians to keep their corrosive tendrils away from them, and in exchange, they served sexually in every way.\"</i>");
	output("\n\nThe little alien giggles, her eyes a little wistful. <i>\"Apparently the goo got so good at fucking the sydians that they all but stopped breeding with each other, content to let the pliant artificial creatures service them while they lounged around, consuming untouched metals from the interior of the ship.\"</i> As an aside, she adds, <i>\"That's why so many of the hatches in here are corroded shut. Too many sydians lived here for too long, and all the original tech in central Novahome was eaten or ruined as well.\"</i>");
	output("\n\nYou say, <i>\"So how did you guys take over?\"</i>");
	output("\n\nShekka smirks. <i>\"They got complacent. That's how! Most of the sydians inside the Nova were old by the time we found it. If they had brought in new blood or produced their own offspring, we would've never stood a chance.\"</i> Shekka pulls a wrench off the table and gestures with it, mock fighting. <i>\"Our tribe, the Gyss, and the Plo banded together our best warriors and took it overnight.\"</i>");
	output("\n\nYou frown. They killed all the sydians?");
	output("\n\nThe raskvel's confident expression slips, and she puts up her hands while shaking her head. <i>\"No-no-no, we didn't even kill any of them. We did drive of most of them off, but a few of the less combative ones wanted to stay. The gray goo had to go, though. We get off on birthing eggs more than sex alone, so we weren't going to slip into the same trap as those metal-eaters.\"</i>");
	output("\n\n<i>\"All of them?\"</i> you ask.");
	output("\n\n<i>\"Well... most of them,\"</i> Shekka admits. <i>\"The sydians that stayed behind kept their \"wives\" and \"husbands\" of course. We made them swear to stop eating the ship itself, and we give them machinery that's too far gone to fix instead. They're kind of like our own garbage disposals, albeit ones that you can talk to or bed down for a fun, inter-species three-way.\"</i>");
	output("\n\nYou chuckle at that. <i>\"Maybe I should go visit them sometime, then.\"</i>");
	output("\n\nShekka looks you up and down and suggests, <i>\"If you do, bring me too. I could use a good lay.\"</i>");
	output("\n\n<i>\"Is that so?\"</i> you ask with an appraising glance. Are her nipples sticking out a little further? It's hard to tell, but her camel-toe has definitely grown a little deeper.");
	output("\n\nShe smirks. <i>\"It is, but as soon as I finish this story, I've got work to do. Any potential eggs can keep until then.\"</i>");
	output("\n\nYou nod");
	if(pc.lust() >= 75 || pc.libido() >= 75) output(", a little sad that you won't get to peel her out of her jumpsuit right now");
	output(".");
	output("\n\n<i>\"So we took the Novahome, but it took us the better part of a decade to get it built up to where it is now. There weren't even any working power plants back then, and the electrical systems were fried. We're still trying to get the west half of the ship lit properly.\"</i> Shekka gestures towards a window in her \"little\" workshop. <i>\"It won't be long now till we get most of the ship up and running - even the engines. Unfortunately, when this thing crashed, all the repulsors along the underside were completely decimated. It won't be going orbital without a few years of excavation and repairs.\"</i>");
	output("\n\n<i>\"Since it crashed,\"</i> you start, <i>\"was there any evidence of the original crew?\"</i>");
	output("\n\nShekka shakes her head. <i>\"None. The place was empty except for the goo and the sydians. There weren't even skeletons anywhere. We knew it was alien from the alphabets being used, but until we got linked into the rest of the galaxy, we had no idea who made it.\"</i> She points at a bulkhead with terran-style lettering. <i>\"Turns out it was ");
	if(pc.race() == "human") output("you");
	else output("the");
	output(" humans. She was some kind of exploratory science vessel, launched well before the first gates were discovered or placed. They built her to last, and she did. It's just... something happened to her crew, and without guidance, the whole mess must have crashed down onto Tarkus.\"</i>");
	output("\n\nShekka sighs and pats the wall affectionately. <i>\"The </i>Nova<i> is Novahome now. She's our home. Maybe someday she'll be the first capital ship in the raskvel navy, once we get ourselves sorted out.\"</i>");
	output("\n\nYou wouldn't mind seeing that.");
	output("\n\nSmiling, the mechanic turns back to her work. <i>\"I really should get some of these job orders done. Just give me a holler if you need to buy anything, okay?\"</i> She flips her welding mask down and sparks her torch.");
	processTime(15+rand(5));
	flags["SHEKKA_TALKED_NOVAHOME"] = 1;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//The Wastes
//Unlocked after talking about Tarkus
function talkToShekkaAboutTheWastes():void
{
	clearOutput();
	userInterface.showBust("SHEKKA");
	userInterface.showName("\nSHEKKA");
	output("<i>\"Could you tell me about the wastes?\"</i> you ask.");
	output("\n\nShekka takes off her welding mask, a somber look on her pink-topped visage. <i>\"Yeah, though there isn't much to tell, I think. It’s hot in the sun and cold in the night. Actual food is scarce - finding healthy plants is like discovering buried treasure, and seeds are guarded with our lives. We can usually rig up small underground fields to feed ourselves, but once there's enough of us in a tribe, we wind up either leaving eggs in the wilds or kicking a few unlucky souls.\"</i> She shudders. <i>\"It's a pretty horrible life, to be honest.\"</i>");
	output("\n\n<i>\"It sounds awful.\"</i>");
	output("\n\n<i>\"It is,\"</i> Shekka agrees. <i>\"You've got to forage for supplies without raising the ire of the other tribes or running into something worse, like a thirsty goo or an irritable sydian. Bam!\"</i> She pounds one fist into the other out of nowhere. <i>\"You lose a whole day worth of foraging and wind up laying in the dirt, holes stretched. Sure, you got your rocks off, but you're left hungry, empty-handed and alone.\"</i>");
	output("\n\nYou mention that it sounds a little like your own experiences with the planet rush.");
	output("\n\nThe corner of the little alien's mouth quirks up at that. <i>\"Really?\"</i>");
	output("\n\nYou nod. <i>\"Really.\"</i> You then proceed to detail some of your previous adventures in sordid detail.");
	output("\n\n<i>\"Damn,\"</i> the reddish raskvel mutters, <i>\"I guess you haven't had it too easy either.\"</i> She taps her chin, thinking. <i>\"There's other areas like the wastes that are just about as bad if not worse. For one, there's the scything glades. Trees grow there, metallic, predatory trees that lash out at anything that comes too close with razor-sharp blades. There's usually a few safe paths through them, but you'd best keep your wits about you if you don't want to wind up cut to ribbons with your blood used as fertilizer.\"</i>");
	output("\n\n<i>\"That's terrifying!\"</i>");
	output("\n\nShekka ticks off her fingers, counting in her head. <i>\"Then there's the Oil Sea. It isn't really just oil either. It's full of liquid metals, pollutants, corrosives, and the like. The place has been swarming with the goos since we kicked them out of Novahome. I guess the lubricants and moisture there have helped them reproduce.\"</i> She moves on to the next finger. <i>\"Watch out around the iron ridges too. All these metal plates make it the perfect place for ambushes. Our tribe never really went there - there's lapinara and worse aplenty.\"</i>");
	output("\n\nYou make a mental note about that and thank for the intel.");
	output("\n\n<i>\"Just don't get caught in a storm, and you'll be fine. They don't happen often, but the metal flakes will cut you to ribbons in minutes if you're out in the open,\"</i> Shekka warns. <i>\"Make sure you've always got an eye on a potential bolt-hole. You'll do fine, [pc.name]. You've got a good head on you");
	if(pc.hasPerk("Ditz Speech")) output(", I think....");
	output("\"</i> She turns away from you, and busies herself putting her mask back on. <i>\"That's it. You be safe out here, and I'll try not to lose any fingers to my welding torch. Deal?\"</i>");
	output("\n\nDeal.");
	processTime(15+rand(5));
	flags["SHEKKA_TALKED_WASTES"] = 1;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Her Shop
//Unlocked after asking about the Nova{home}
function talkToShekkaAboutHerShop():void
{
	clearOutput();
	userInterface.showBust("SHEKKA");
	userInterface.showName("\nSHEKKA");
	output("<i>\"How about this shop?\"</i> you casually inquire.");
	output("\n\nShekka runs a hand along her workbench lovingly. <i>\"She's not much, but she's mine. I moved in back before our tribes grew to fill this place to the brim, so getting a decent-sized area classified as mine wasn't that hard. I just had to build the shop here.\"</i> She knocks a wrench on the wall. <i>\"Turns out that if you aren't bumping uglies all day, you can get a lot done!\"</i>");
	output("\n\nYou smirk. <i>\"Is that much of a problem for you?\"</i>");
	output("\n\nThis time, you get a blush out of the little mechanic. The crimson glow practically radiates through her scales and colors her jumpsuit pink! <i>\"Well, yes and no.\"</i>");
	output("\n\nYou cross your arms. <i>\"Which is it?\"</i>");
	output("\n\nShekka frowns and rants, <i>\"It's complicated, okay! And it's personal, too. Besides, you wanted to know about my shop!\"</i>");
	output("\n\nYou put your hands up and apologize. You didn't mean to pry.");
	output("\n\n<i>\"Just... ask me about that stuff later, okay?\"</i> Shekka pouts more than a little. It's obvious she'd prefer to stick to the topic at hand.");
	output("\n\n<i>\"Sure thing,\"</i> you answer. <i>\"So, you built this place yourself?\"</i>");
	output("\n\n<i>\"Is it that obvious?\"</i> Shekka looks about nervously, explaining, <i>\"We aren't exactly the best at construction, but the Nova is already sheltering us from the elements. All I needed to do was make it secure enough to be considered my private space.\"</i>");
	output("\n\nUpon closer inspection, it's clear you wouldn't want to live in a place like this, but as far as Tarkusian homes go, it's one of the better ones. <i>\"It could use a little work.\"</i>");
	output("\n\nShekka puffs her cheeks out before exhaling, deflating under your scrutiny. <i>\"Yeah, I guess so, but it'll have to do for now. I've gotta bank up all the credits I can, which means not spending any more than I have to on frivolous stuff like pretty walls or a watertight roof.\"</i> Folding her arms across her insignificant chest, she continues. <i>\"I do well enough for myself here anyway. None of the other builds are any better, and it's enough to count as a permanent address for ordering goods from the core.\"</i>");
	output("\n\nYou wonder aloud, <i>\"You order from the core?\"</i>");
	output("\n\nLeaning against her workbench a little more comfortably, Shekka nods. <i>\"Yeah, when I think I'll be able to resell it at a premium. A lot of you rushers will pay pretty well for some core comforts, and Tarkus is pretty rough on clothes. Keeping some smartclothes in stock has been one of the best ideas I've had for my profit margins. Between them, custom repairs and selling whatever else I can get working, business has been pretty good.\"</i>");
	output("\n\n<i>\"What about taxes?\"</i> you ask.");
	output("\n\nShekka smirks. <i>\"Tarkus isn't officially a member planet of the U.G.C. We aren't paying them squat... yet. Our own people aren't really much for governing constructs like taxes either. The elders know I'm putting my money into the tribe's well being, and they do what they can to make sure I'm going to be successful. It's a simpler way, and it works for now.\"</i>");
	output("\n\nYou scratch your chin and ask, <i>\"Your tribes seem pretty big now. Is that kind of informal structure going to hold up on a larger scale?\"</i>");
	output("\n\n<i>\"Probably not,\"</i> Shekka thinks aloud, <i>\"but it's working now. Hopefully by the time that becomes a problem we'll have new generations of more level-headed thinkers to help us figure out a better answer.\"</i>");
	output("\n\n<i>\"Procrastination isn't a solution.\"</i>");
	output("\n\nShekka snorts, <i>\"Yeah, but you've got to crawl before you can walk.\"</i> The little alien seems uncomfortable with her lack of a clear answer, fidgeting nervously in place, but she declines to offer up a better answer, instead saying, <i>\"Look, I should get back to work. We can talk later.\"</i>");
	processTime(15+rand(5));
	flags["SHEKKA_TALKED_HERSHOP"] = 1;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Her
//Unlocked after asking about her shop.
function talkToShekkaAboutHerself():void
{
	clearOutput();
	userInterface.showBust("SHEKKA");
	userInterface.showName("\nSHEKKA");
	output("You ask her about her love life, as it were. She did tell you that you could ask about it later, after all.");
	output("\n\nShekka's nipples visibly perk, and her cleft gets a little more noticeable under the painted-on veneer of her jumpsuit. To her credit, she manages not to blush this time. <i>\"Well... yeah, I can talk about that stuff, if you really want to hear the sordid details.\"</i>");
	output("\n\nYou smile");
	if(pc.hasPerk("Ditz Speech") || pc.hasPerk("Brute Speech"))
	{
		output(", barely suppressing a");
		if(pc.hasPerk("Ditz Speech")) output("n airheaded giggle");
		else output(" brutish chuckle");
	}
	if(pc.isNice()) output(" warmly");
	output(".");
	output("\n\n<i>\"All right, all right... so, like I said before, it's kind of complicated,\"</i> Shekka starts haltingly, speaking with greater speed and confidence as she finally opens up about it. <i>\"I love sex and egg-laying about as much as the next raskvel, but I spend a LOT less time fucking than the rest of us.\"</i> Her shoulders slump, and she leans more heavily against her bench for support. The effect is so startling that you almost wonder if she's suddenly become more susceptible to gravity. <i>\"It's not entirely by choice either....\"</i> She fidgets nervously.");
	output("\n\n<i>\"What is it?\"</i> you ask, trying to contain your piqued curiosity. As an afterthought, you add, <i>\"Surely it can't be that bad. I've seen plenty of sexual weirdness out there. A little thing like you isn't going to shock me.\"</i>");
	output("\n\nBrushing a strand of tightly-wrapped feathers away from her watery eyes, Shekka looks up at you curiously. A smile spreads across her features when she sees the genuine expression on your face. <i>\"Thanks, but.... Well, there's really no other way to say it. I think I'm infertile.\"</i>");
	output("\n\nYou tilt your head to the side quizzically and ask why that would stop her from having sex.");
	output("\n\n<i>\"It isn't as simple for us as it might be for you - sex isn't just about the physical pleasure with us,\"</i> Shekka tries to explain, gesticulating wildly. <i>\"Pregnancy and – more specifically – laying are a near universal kink for my people, and once a male realizes that a tryst isn't going to turn you into a belly-immobilized egg-factory, he loses interest pretty quickly. If I'm lucky, I'll make one or two unfertilized eggs after a good fuck. That's it.\"</i> Her arms drop limply to her sides. <i>\"My suitors dropped off pretty quickly when word got around.\"</i>");
	if(!pc.isAss()) output("\n\nThat's awful!");
	else output("\n\nThat's pretty understandable.");
	output(" <i>\"Can't you just buy a gene mod or treatment to fix yourself?\"</i>");
	output("\n\nThe little mechanic shakes her head sadly, her ears chiming sad musical notes. <i>\"Not yet. Not safely, anyway. It'll be a little while yet until the pharmaceutical companies have finished unwinding the details of our genome to see which products are safe for us and which could kill or mutate us. If I took the wrong thing, I could wind up producing eggs until I rupture my abdomen or making ones that are too big for the thickness of their shells. The potential problems are endless.</i>\" She shudders, <i>\"I can wait. Besides, my sterility has had some upsides.\"</i>");
	output("\n\nThat's more that attitude you'd expect from one of her species: always looking for the upsides. <i>\"Oh?\"</i>");
	output("\n\nShekka nods eagerly. <i>\"It's a lot easier to take a long view when you're not throwing your legs in the air every hour or two. I never would have been this successful if I was lazing around between layings trying to entice the boys into swelling me up more eggs.\"</i> She waggles a finger in your direction. <i>\"That sort of thing is all too common for a lot of girls, and if you were to ask them, they couldn't be happier. I'd imagine that's true with all the endorphins swimming around inside them.\"</i>");
	output("\n\n<i>\"Is that a note of jealousy I hear in your voice?\"</i> you question.");
	output("\n\n<i>\"A little bit, maybe, but just because they're riding a biological high doesn't mean I'm going to join them any time soon.\"</i> She shakes her head, saying, <i>\"My work and helping to chart a course for my people's future... those are fulfillment on a whole different level. Besides, I still get to take the occasional egg-break when a big, strong offworlder decides to pack me full of cum.\"</i> Shekka shivers, her eyes half closing at a fond memory. <i>\"Those kui-tan sure know how to fill a womb!\"</i>");
	output("\n\nYour ");
	if(pc.lust() >= 70) output("lust");
	else output("discomfort");
	output(" must show, because Shekka smirks. <i>\"I laid three whole eggs that time! You should've seen it; I almost got as big as some of my sisters, and the laying... oh the laying!\"</i> Her whole body shivers, and her nipples are as big as you've seen them, wholly engorged. Shekka fans herself to try and cool off. <i>\"The point is that most of you rushers don't care whether I produce eggs or not. It's just two of us together, revelling in the pleasures of each others' bodies.\"</i> The diminutive handywoman pitchers her voice into a low whisper, <i>\"Besides, I get a naughty thrill in knowing that big, strong aliens");
	if(pc.PQ() >= .75 && pc.tallness >= 60) output(" like you");
	output(" choose me over the fertile ones. To ");
	if(pc.PQ() >= .75 && pc.tallness >= 60) output("you");
	else output("them");
	output(" I must seem a little more restrained, sane maybe.\"</i>");
	output("\n\nShe makes a good point.");
	output("\n\nShekka gives her hips a sexy little wiggle and gloats, <i>\"Oh, the icy glares I get from the younger ones that don't know me better. That keeps me cool on the hottest, most sweltering days. They treat me better once they learn about all the things I'm trying to do for our people, but I still get a thrill out of it. It's nice to feel desired.\"</i>");

	//Hasn't fucked Shekka
	if(flags["TIMES_SEXED_SHEKKA"] == undefined)
	{
		output("\n\n<i>\"What about you, [pc.name]?\"</i> Shekka asks, a hand on her egg-bearing hips. <i>\"You've spent an awful lot of time talking to me. You want to turn this talk break into something a little more physically demanding?\"</i> She strides forward, hypnotically undulating her wide hips before pressing herself against you. <i>\"This conversation has got my motor revving, and I think");
		if(pc.hasCock()) output(" your dipstick would be just the thing to check my oil....");
		else output("you might want to feel the vibrations....");
		output("\"</i>");
	}
	//Fucked Shekka
	else
	{
		output("\n\nShekka advances on you, her tremendous hips swaying, her ears jingling and bouncing to the timing of her hypnotic undulations. She presses herself against you, saying <i>\"And your desire is as sweet as the dew from a perfectly repaired moisture devaporator.\"</i> Her hand squeezes a cheek affectionately, <i>\"I'm starting to think you asked me about this just to get my motor revved up again.\"</i> She grabs your hand and presses it between her large thighs. The suit audibly squishes as it deforms around your fingers. She whispers, <i>\"It worked. Wanna fuck?\"</i>");
		//Same choices as unsexed. Sex is always available this way!
	}
	flags["SHEKKA_TALKED_HERSELF"] = 1;
	processTime(15+rand(5));
	pc.lust(5+rand(3));
	clearMenu();
	addButton(0,"Yes",yesShekkaLetsFuck,undefined,"Yes","Consent to sex with Shekka.");
	addButton(1,"No",noShekkaLetsNotFuck,undefined,"No","Try to talk your way out of sex with Shekka.");
}

//Yes -> Sex Menu
function yesShekkaLetsFuck():void
{
	//Sex menu hooo!
	shekkaSexMenu();
	//Cut back button if some catch-all scenes get added (Here's looking at you, Savin)
	addButton(14,"Back",approachShekka);
}
function noShekkaLetsNotFuck():void
{
	clearOutput();
	userInterface.showBust("SHEKKA");
	userInterface.showName("\nSHEKKA");
	//Bimbo No
	if(pc.hasPerk("Ditz Speech"))
	{
		output("You start to say no, but then you remember how like, totally awesome sex is. And then, you're fantasizing about all the sexual gymnastics you could do with the little slut, your hypersexed mind putting nine out of ten brain cells towards plotting the best vector for a quick fuck.");
		//To sex menu!
		shekkaSexMenu();
		addButton(14,"Back",approachShekka);
		//make sure to strip back button when some catchalls are written
		return;
	}
	//No
	else if(pc.lust() < pc.lustMax())
	{
		output("You extricate yourself from the press of her excited body with more than a little difficulty{, fighting down the rising tide of lust within you}. <i>\"Not now, Shekka. I think we both have things we need to do be doing besides fucking ourselves silly.\"</i>");
		output("\n\nPouting, Shekka takes a deep breath, then another. <i>\"Right... right... okay, that's fine. You're definitely right.\"</i> She brushes herself down, shuddering a little bit when her hands pass over her nipples. <i>\"I should work.\"</i> She turns away from you with a disheartened sigh, flipping her welding mask back into place.");
		processTime(1);
		clearMenu();
		addButton(0,"Next",mainGameMenu);
		return;
	}
	//Alt No
	else
	{
		output("You attempt to extricate yourself from the press of her excited body, but she's so close and rubbing so pleasantly against you. Your will gives out under the weight of an ocean of ardor.");
		//(Sex menu anyway!)\
		shekkaSexMenu();
		addButton(14,"Back",approachShekka);
		//make sure to strip back button when some catchalls are written
		return;
	}
}

//The Mess
//Always available.
function talkToShekkaAboutTheMess():void
{
	clearOutput();
	userInterface.showBust("SHEKKA");
	userInterface.showName("\nSHEKKA");
	output("You ask about that food place next door, the Mess.");
	output("\n\n<i>\"Fuck that place!\"</i> Shekka snarls at you, baring her teeth savagely, <i>\"Fuck them, fuck that bullshit catering company, and fuck the people that are dumb enough to eat there!\"</i>");
	output("\n\n<i>\"Whoah, wait, what?\"</i>");
	output("\n\nShekka jabs her finger into your ");
	if(pc.tallness >= 84) output("[pc.leg]");
	else if(pc.tallness >= 60) output("[pc.hip]");
	else output("chest");
	output(". <i>\"That place and the company that runs it are everything that's wrong with Novahome right now! Did you know we found a hydroponics bay that's capable of feeding the entire ship and then some? All we need are the hands to work it, but why bother producing healthy food when you can sit around screwing, then lounge around the Mess until someone hands you edible slop?\"</i>");
	output("\n\nYou offer, <i>\"Surely offering cheap food isn't that bad?\"</i>");
	output("\n\nScowling, the little raskvel shakes her head. <i>\"That's not all they're doing. I'm sure of it. They can't be turning a profit on food with rates like that. Personally, I think the whole thing is a front for illegal slave trade. They lure us in with cheap food, then sort through the cam footage for the sexiest, sluttiest rask. So many of us wind up getting lost or killed in the wastes that no one asks questions when someone leaves... no one except me.\"</i>");
	output("\n\nOh, so she has evidence? You ask her about it.");
	output("\n\n<i>\"Nothing concrete, but a couple of my friends have disappeared - all pretty girls, one at a time. It started with my friend Chass. She told me that they had offered her some pretty good pay to wait tables at an off-world restaurant they ran. I told her to call me once she settled in, and she hasn't. It's as if she's vanished. The same thing happened to another friend, Jalie. She got a job offer and vanished not long after. None of her mates have heard from her. I'm pretty sure they're being turned into slaves or indentured servants, probably shipped off world for training,\"</i> Shekka explains with a scowl plain on her face. <i>\"I'd love to get some hard evidence on them, but I just can't seem to get anything solid. They won't even let me in the building anymore, and any evidence of their wrongdoing is likely kept behind locks I haven't been able to hack. Besides, I can't afford to get caught too deep in their operation. If I get myself captured and turned into a sex slave... there'll be no one left to save them.\"</i>");
	output("\n\nShekka paces back and forth. <i>\"So for now, we have to play the slow game. If we can get enough bodies working the hydroponics bay, we can put them out of business with free, good food. With no customers, they'll have no reason to stay and leave for greener pastures.\"</i> She snaps her fingers. <i>\"Maybe you could keep your eyes open if you're over there too. There's got to be something we can use against them!\"</i>");
	output("\n\nYou aren't too sure about that, but you don't want to dissuade her while she seems so hopeful.");
	output("\n\n<i>\"Just don't get complacent in there. They're not good people,\"</i> she warns before returning to her work.");
	output("\n\nYou promise to keep your wits about you.");
	processTime(15+rand(5));
	flags["SHEKKA_TALKED_THE_MESS"] = 1;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Flirt -> Sex
function shekkaFlirtSexMenu():void
{
	clearOutput();
	userInterface.showBust("SHEKKA");
	userInterface.showName("\nSHEKKA");
	processTime(1);
	//First Time
	if(flags["TIMES_SEXED_SHEKKA"] == undefined)
	{
		//No talks done yet.
		if(flags["SHEKKA_TALKED_HERSELF"] == undefined && flags["SHEKKA_TALKED_HERSHOP"] == undefined && flags["SHEKKA_TALKED_TARKUS"] == undefined && flags["SHEKKA_TALKED_NOVAHOME"] == undefined && flags["SHEKKA_TALKED_WASTES"] == undefined && flags["SHEKKA_TALKED_RASKVEL"] == undefined && flags["SHEKKA_TALKED_PLAN"] == undefined && flags["SHEKKA_TALKED_THE_MESS"] == undefined)
		{
			output("Putting on your winningest smile, you size up the little mechanic. She wouldn't wear something so exposing if she wasn't looking for a fuck, would she? Her pert little nipples are like tiny cherries, just waiting to be plucked.");
			output("\n\nShe must see the look in your eye, because before you can utter a single word, she shakes her head. <i>\"Much as my pussy would love to be let out for a little playtime, I have a lot of work to get done. Maybe once we know each other a little better I'll be able to make some time, okay?\"</i> She licks her lips before turning back to her work.");
			clearMenu();
			addButton(0,"Next",mainGameMenu);
			return;
		}
		//Know her well enough to succeed
		else
		{
			output("You let your face slowly spread into a grin as you look");
			if(pc.tallness >= 60) output(" down");
			output(" at Shekka. Surprisingly aware, the little mechanic grins back, sashaying up to you before you can utter a single word. <i>\"I know that look,\"</i> she says, <i>\"You wanna fuck.\"</i> Wrapping her tail up the back of your [pc.leg], Shekka presses herself against you. <i>\"You know what?\"</i> She pauses long enough for you to fumble for a response before going on. <i>\"I do too.\"</i> Her face splits into a lusty smile, her eyes tracing down your [pc.belly] to your crotch.");
			output("\n\nWell, this is a welcome twist. <i>\"Shall we?\"</i> you ask while considering the sexual options your petite lover's body offers.");
		}
	}
	//Repeat Intro
	else
	{
		if(chars["SHEKKA"].lust() >= 33)
		{
			output("<i>\"How about we take a little recreational break?\"</i> you offer.");
			output("\n\nShekka puts her hands on her considerable hips. <i>\"Why, Captain Steele, are you propositioning me?\"</i> Her lips split into a wide grin. <i>\"Because that would be an absolute delight.\"</i> The lithe, little alien practically slithers up against your [pc.leg], her tail cupping against your [pc.butt]. <i>\"A girl has needs, after all.\"</i>");
			output("\n\nWell, she's feeling feisty at the moment. What are you going to do with her?");
		}
		//Shekka isn't turned on
		else
		{
			output("<i>\"How about we take a little recreational break?\"</i> you offer.");
			output("\n\nShekka smirks openly. <i>\"Give it a rest, tiger. My body might be up for an all-day marathon fuck, but I've got things I need to get done.\"</i> She twirls in low, gives your crotch an affectionate squeeze and pivots back to her work in the blink of an eye. <i>\"A little later maybe.\"</i>");
			clearMenu();
			addButton(0,"Next",mainGameMenu);
			return;
		}
	}
	//Didn't get returned? QUICK, SEX MENU!
	shekkaSexMenu();
	addButton(14,"Back",approachShekka);
}

function shekkaSexMenu():void
{
	clearMenu();
	if(pc.hasCock())
	{
		if(pc.cockThatFits(chars["SHEKKA"].vaginalCapacity()) >= 0) addButton(0,"Fuck Her",bendShekkaOverHerWorkbenchAndHaveHerFixWhileYouBang,undefined,"Fuck Her","Bend Shekka over her desk and fuck her while she tries to keep working.");
		else addDisabledButton(0,"Fuck Her","Fuck Her","You don't have a dick small enough to fit her.");
	}
	else addDisabledButton(0,"Fuck Her","Fuck Her","You need to have a penis in order to bend her over her desk and fuck her.");
	if(pc.hasVagina()) addButton(1,"Tribadism",tailbadism,undefined,"Tribadism","A little bit of tribadism with the raskvel's tail in the middle for added texture.");
	else addDisabledButton(1,"Tribadism","Tribadism","Tribadism requires you to have a vagina.");
}


//Bend Her Over Her Workbench And Make Her Work It
function bendShekkaOverHerWorkbenchAndHaveHerFixWhileYouBang():void
{
	clearOutput();

	userInterface.showBust("SHEKKA");
	userInterface.showName("\nSHEKKA");
	var x:int = pc.cockThatFits(chars["SHEKKA"].vaginalCapacity());
	if(x < 0) x = pc.smallestCockIndex();
	var y:int = -1;
	if(pc.cockTotal() > 1) y = pc.cockThatFits2(chars["SHEKKA"].vaginalCapacity());
	output("You turn her back around towards her bench. <i>\"Why don't you go ahead and keep doing your job. Let me do all the work.\"</i> Your fingers trace up her spine to her neck where a small, hidden clasp resides. Once you find it, you artfully twist your thumb and index finger, releasing the catch and revealing her jumpsuit's seam. The fabric parts slowly, opening just enough to let her pale crimson flesh peek through, the light sparkling off glossy scales as they're exposed. <i>\"Go ahead and fix something.\"</i>");
	output("\n\nShekka, usually sassy and quick to react, looks at you uncertainly. Her tail swishes back and forth nervously, but she does as you ask, grabbing parts from all over her workbench into a smile pile before you. A moment later, her confident smile returns. She presses her large rump back against you, curling her tail around your side so as not to interfere with the soft, sensuous press of her buttocks against your package. With just an earnest flex, her cheeks squeeze your [pc.cocks] harder.");
	output("\n\nOhhh, that feels nice. Blood surges to your genitals, and your breath shortens as your heartbeats accelerate. Grunting softly, you grab hold of her slowly releasing suit by its edges and tug, baring her shoulders in an instant. The edge of the fabric catches on her nipples, revealing the soft, eggplant-colored areolae a second before the tips of her nipples pop out over the edge. From there, it's easy to peel the obstructing garment down past Shekka's bare belly to her hips. The fit is much tighter there, and the press of her ass against your [pc.cocks] makes choosing between continuing to grind against her or getting her out of her clothes an agonizingly difficult decision.");
	output("\n\n<i>\"What's the matter?\"</i> Shekka wonders, applying some ED-80 to some rusted screws to help loosen them. <i>\"Having a little trouble with unwrapping me?\"</i>");
	if(pc.hasCock() || pc.hasVagina()) 
	{
		output(" She brings her tail up between your [pc.legs] to slide alongside ");
		if(pc.balls > 0) output("your [pc.sack]");
		else if(pc.hasVagina()) output("[pc.oneVagina]");
		else output("your [pc.base " + x + "]");
	}
	else output(" She curls her tail around to tease your [pc.asshole], the tip circling around the edge of your ring.");
	if(!pc.isNude()) output(" <i>\"You haven't even gotten yourself naked yet.\"</i>");
	//Not naked yet
	if(!pc.isNude())
	{
		output("Shuddering, you respond to her critique by stepping back and tearing out of your [pc.gear] in seconds, piling the obstructing equipment on the bench just out of her reach. You ask, <i>\"How's that?\"</i> though it's revealed as a prideful hypothetical when your nude form presses back against hers.");
	}
	//Merge
	output("\n\nYou press your [pc.cocks] harder against her - hard enough ");
	if(pc.cockTotal() > 1) output("for one ");
	output("to feel her clenching ring. Shifting the angle, you thread yourself lower between her thighs, pressing your length against the bump of her rear clit, feeling the suit sink into her slit around you as you tease her. Shekka's busy motions on the table slow before being interrupted by an instinctive twitch of pleasure. The sound of her moan is muffled by her tightly-closed lips, but you hear it nonetheless.");
	output("\n\n<i>\"What's the matter?\"</i> it's your turn to ask. <i>\"No wonder you're so worried about sex interfering with your work. All it takes is a little rub on one of your knobs to interrupt you.\"</i>");
	output("\n\nShekka picks up the screwdriver she just dropped and grits her teeth. <i>\"It... it just slipped is all!\"</i> She goes back to work, pausing to whimper every now and again when [pc.oneCock] grinds against her clitty in a particularly delicious way. <i>\"I'll fix this before you figure out how to... mmm... fuck my pussy.\"</i> She glances over her shoulder to stick her tongue out at you and wink. That lengthy tongue shivers across her lips sensuously on the next thrust before she turns away once more. The little slut is egging you on!");
	output("\n\nTaking one hand off her skin-tight suit, you press your palm to her [shekka.belly], sliding it down to her mons from the opposite side of your slowly thrusting dick. You find the bump of her second clit and press your middle finger down, swiping it back and forth across the pleasure-sensitive bud.");
	output("\n\nShekka barks, <i>\"Fuck, [pc.name]! Ung! T-take it easy, oooookay?\"</i> Her gratuitous hips give a sexy wiggle, wanting more.");
	if(silly) output(" Those hips don't lie.");
	output("\n\n<i>\"Are you sure?\"</i> You press and rub her from both sides, still peeling her out of her jumpsuit with your free hand while she twitches and bucks. The alabaster fabric rolls halfway down her ass before catching between your paired forms. The front is hooked by your busily gyrating finger as well. Somehow she hasn't lost her grip on her screwdriver. She's even managed to pop the cover off the item she's working on; it's a flashlight, albeit an archaically designed one.");
	output("\n\n<i>\"Y-y-yes,\"</i> Shekka answers, dropping her tool not because of the overwhelming feelings coming from her thighs but because she's finished with it. It's hard to tell if she was answering your question or merely giving voice to her pleasure. Upon reflection, you realize that it doesn't really matter much either way. Your [pc.cocks] ");
	if(pc.cockTotal() == 1) output("is as hard as a titanium bar");
	else output("are as hard as titanium bars");
	output(", and there's no way you're going to pass up on your raskvel honey's pussy.");
	output("\n\nYou pull away from the fidgeting mechanic. Her hands are shaking as she swaps components, and her breath is as ragged as and endurance runner's. She's still managing to do her work, though. The jumpsuit gives way around her hips, stretching before rolling down her scaly hips. It clings to her sopping-wet slit in liquid-assisted defiance before finally breaking away, carrying a glossy sheen as a moment of its time wedged into her crotch. You grunt in appreciation of the fine ass you've revealed while you push her clothing to the ground.");
	output("\n\nShekka's tail pats the side of your face, right on your cheek, and she purrs, <i>\"Mmmm, good " + pc.mf("boy","girl") + ", but I think I might get this repaired before you can cum inside me.\"</i> The naughty little limb snakes down your neck to your chest then around to your [pc.butt]. It slaps you for good measure. <i>\"If this is the best you've got, maybe I should just let you at me the whole damn day. I could get so much done before you even wring a single orgasm out of my dripping... wet... cunt.\"</i> She steps further apart to show you just how wet she's become.");
	output("\n\nOh wow, is it ever. Her violet lips are absolutely sopping. Beads of clear lubricant hang from her labia as rain clings to a spider’s web. Plump and engorged, her meaty vulva is begging for a fuck. Both her clits are jutting out from between the soaked lips, and droplets hang on slick strands from them, sometimes releasing to patter on the floor. A small puddle has formed beneath the juicy raskvel, matching the one in her suit, proof of just how badly she needs you to fuck her.");
	output("\n\nIt's too much: her taunting words, the tantalizing gates of pleasure so close that can feel the heat steaming off of them, and the submissive, bent-over pose. Even if you were determined not to fuck her, you couldn't stop your [pc.hips] from lurching forward. You couldn't stop your [pc.cock " + x + "] from spreading them wide");
	if(y >= 0) output(" or your [pc.cock " + y + "] from battering into her tight asshole");
	output(". You certainly wouldn't be capable of holding back the growl that rips its way out of your throat as your body asserts its primal need to fuck and breed the female its been presented with.");
	output("\n\nShekka's legs slam against the table as you take her from behind, pressing on her hard enough that she winds up pressing her tits around her project and sending her tools scattering away. Her lips cling to your piston like oiled cylinder walls, and as you really start to give it to her they only seal tighter around you. Every forceful thrust is accompanied by lurid squelches, every cock-hilting thrust matched by affectionate, muscular squeezes from Shekka's box. The impacts cause you to bump her rearward clit repeatedly, and she moans each time. These raskvel were made to be fucked from any angle; no matter how you take them, one of their clits will be happily sparking.");
	cockChange(true,false);
	output("\n\nYou settle into an easy musical rhythm. Her swaying, pierced ears provide a pleasant jingling background while her staccato moans provide proof positive that's getting the hard fucking she wanted. Shekka's petite body feels almost entirely wrapped around your [pc.cock " + x + "] even though such a thing is impossible. Her tail is wrapped around your waist encouragingly, helping you to thrust into her as hard as absolutely possible. If you weren't so caught up in the moment, you might be worried that you would bruise her thighs against the workbench. She wouldn't let you stop, though. She'd tell you to get back to work. After all, she's working.");
	output("\n\nIt's hard to tell if she's still working, actually. She did manage to pull the cylindrical device out from between her perky tits. Damn, her nipples look hard. And she seems to be trying to do something with it, but she keeps throwing back her head and moaning. Her free hand keeps dropping screws and scrabbling against the workbench's unforgiving surface. Shekka might have made some good progress on her toy, but there's no way she's going to finish it in this condition.");
	output("\n\nShe's little more than a slutty mess of fuckjuice and pleasure now - a tingling bundle of nerves spasming around your ");
	if(y >= 0) output("doubled dicks");
	else output("[pc.cock " + x + "]");
	output(" in an effort to please you. Her tongue lolls out of her mouth. There's at least half a foot of organ there, leading you to wonder what a blowjob from the little gadget-slut would be like. Holding her by the hips, you pound away, feeling her start to orgasm underneath you, gushing fluid over your [pc.knot " + x + "]");
	if(y >= 0) output(" and clenching around your [pc.cock " + y + "] with her pucker");
	output(". Right now, she's the perfect little sextoy, and you're using her like one.");
	output("\n\nFuck, she's getting tighter every time! It's actually starting to get hard to pull out of her, and the soaking-wet girl goo bathing you is challenging you to erupt. No, worse than that, her whole body is begging for a thick wad of your [pc.cumNoun]");
	if(y >= 0) output(" - even her ass");
	output(".");
	output("\n\nShekka babbles in a brief interlude between orgasms, <i>\"Fucking fuck me! Cum!\"</i> Of course, her pink eyes roll back and a second later, and her words transform into poorly enunciated \"yes\"es and \"ahh\"s of pleasure. Bending low over top of her, you feel the rising heat inside you, signaling that your own release is soon at hand. You wrap an arm under her chest, lifting her to press against your [pc.chest]. Grabbing tight, your palm encircles her breast, and you bottom out one last time");
	var knot:Boolean = false;
	var knots:Boolean = false;
	if(pc.hasKnot(x)) knot = true;
	if(y >= 0)
	{
		if(pc.hasKnot(y)) knot = true;
		if(pc.hasKnot(x)) knots = true;
	}
	if(knot) 
	{
		output(", your expanding knot");
		if(knots) output("s");
		output(" slipping in");
	}
	output(".");

	//The knots have it
	if(knot)
	{
		output("\n\nThe feeling of seating yourself deeply inside her and being locked in place by your expanding biology only makes your climax that much hotter.");
		if(knots) output(" Doing that to both her holes at once is even better.");
		if(pc.cumQ() < 10)
		{
			output(" Dribs and drabs of [pc.cum] leak out from your ");
			if(y >= 0) output("doubled dicks");
			else output("[pc.cock " + x + "]");
			output(", oozing in thin flows into her oh-so-receptive body. You run out long before the ecstasy subsides. Perhaps you should let your [pc.balls] rest a bit in between orgasms.");
		}
		else if(pc.cumQ() < 25)
		{
			output(" Spurts of [pc.cum] splatter into her waiting body with explosive eagerness, your [pc.hips] twitching a little further forward with each successive ejaculation.");
		}
		else if(pc.cumQ() < 250)
		{
			output(" Thick blobs of [pc.cumNoun] explode out of you one after another, bathing Shekka's interior");
			if(y >= 0) output("s");
			output(" in a thick coat of your [pc.cumColor] love. You hold position, secure in the knowledge that your knot");
			if(knots) output("s");
			output(" will pin every drop inside her.");
		}
		else if(pc.cumQ() < 2000)
		{
			output(" Massive blobs of [pc.cum] pour out of you, so voluminous that each barely has time to finish before the next ejaculation is erupting like a volcano. Poor Shekka's body is absolutely filled with your [pc.cumColor] seed.");
			if(y >= 0) output(" Her belly even rounds from the combined injections.");
		}
		else
		{
			output(" Gigantic blasts of [pc.cum] force their way into Shekka's eager tunnel");
			if(y >= 0) output("s");
			output(" packing them full with the first few injections. The next ones, sealed in by your knot");
			if(y >= 0) output("s");
			output(", swell her [shekka.belly] with added weight, giving her a positively pregnant appearance.");
			if(!knots) output(" Sadly, you don't have knots to plug both sides, and waves of hot-pumping [pc.cumNoun] vent out over one of your [pc.cocks].");
			if(pc.cumQ() >= 5000) output(" Her wobbly, spunk-stuffed tummy grows so big that you worry for her health, but by then the fluid distention widens her passage enough for streams of it to sluice out over your crotch, venting the pressure.");
		}
		output("\n\nYou go limp, your ardor spent, but your knot");
		if(knots) output("s hold");
		else output("holds");
		output(" you secure inside of her, giving you time to appreciate the outlines of her shoulderblades and the natural fragrance of her feathery hair.");
	}
	//No knot for you, come back next year.
	else
	{
		output("\n\nHer wet, milking walls coax you to a glorious a climax");
		if(y >= 0) output(", and the way her asshole is tugging at your dick doesn't hurt either");
		output(". ");
		if(pc.cumQ() < 10) 
		{
			output("Dribs and drabs of [pc.cum] leak out from your ");
			if(y >= 0) output("doubled dicks");
			else output("[pc.cock " + x + "]");
			output(", oozing in thin flows into her oh-so-receptive body. You run out long before the ecstasy subsides. Perhaps you should let your [pc.balls] rest a bit in between orgasms.");
		}
		else if(pc.cumQ() < 25) 
		{
			output("Spurts of [pc.cum] splatter into her waiting body with explosive eagerness, your [pc.hips] twitching a little further forward with each successive ejaculation.");
		}
		else if(pc.cumQ() < 250)
		{
			output("Thick blobs of [pc.cumNoun] explode out of you one after another, bathing Shekka's interior");
			if(y >= 0) output("s");
			output(" in a thick coat of your [pc.cumColor] love. You hold position, feeling some of it slop back out around your [pc.cock " + x + "], ");
			if(pc.balls == 0) output("running down your [pc.leg].");
			else output("clinging to your [pc.sack] to make it shine with sex.");
		}
		else if(pc.cumQ() < 2000)
		{
			output("Massive blobs of [pc.cum] pour out of you, so voluminous that each barely has time to finish before the next ejaculation is erupting like a volcano. Poor Shekka's body is absolutely filled with your [pc.cumColor] seed.");
			if(y >= 0) output(" Her belly even rounds from the combined injections.");
		}
		else
		{
			output("Gigantic blasts of [pc.cum] force their way into Shekka's eager tunnel");
			if(y >= 0) output("s");
			output(" packing them full with the first few injections. The next ones, heavy as they are, swell her [shekka.belly] with added weight, giving her a positively pregnant appearance. Waves of excess, hot-pumping [pc.cumNoun] vent out over your [pc.cocks] as you continue to ejaculate, sluicing down your ");
			if(pc.balls > 0) output("[pc.balls]");
			else output("[pc.leg]");
			output(".");
			if(pc.hasCockFlag(GLOBAL.FLARED)) output(" Your flared tip makes sure a fair portion of it shoots directly against her cervix.");
		}
		output("\n\nYou go limp, your ardor spent and your softening length{s} slipping halfway out of her. You take the moment to appreciate the shapeliness of her shoulder blades and the natural scent of her air.");
	}
	//Merge
	output("\n\nAfter a while of holding her like this, she comes down from her own plateau and cranes her head around to look at you, smiling. It isn't a mere sated smile either - the kind that telegraphs just how well fucked she's been. No. It's a gloating, knowing smile. She flicks a switch on the flashlight, and a beam of incandescent light illuminates her work area. Shekka gently pushes you back with her feet, letting your soaked [pc.cocks] fall away. She pulls herself up onto her workbench, rubbing her belly, a slightly vacant look in her eyes. <i>\"I think we both won that little competition.\"</i>");
	output("\n\n<i>\"Oh?\"</i> you say while wiping up.");
	output("\n\nShekka nods, giggling, her hand still on her belly. <i>\"Fuck yes. Cumming and fixing something? That was nirvana. We have got to do this again sometime. I'll try and score a bunch more broken things to fix, and we can do this every time.\"</i>");
	output("\n\nYou shrug, unable to hide the grin on your face. Your [pc.cum] is pooling between her legs on her bench, and she hasn't noticed. <i>\"Sure thing, babe.\"</i>");
	output("\n\nShekka doesn't even bother cleaning herself up. She just starts tugging on her jumpsuit, making sure its tight enough against her swollen crotch to hold in every drop. Judging by the audible squish it makes as it presses against her nethers, you can only assume it caught a fair amount of liquid action itself. She doesn't comment on it, instead mentioning something about washing up after work, but you think she might just like the feel of her pussy swimming in it.");
	fuckedShekka();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
//Tribadism Around A Vibrating Tail
function tailbadism():void
{
	clearOutput();
	userInterface.showBust("SHEKKA");
	userInterface.showName("\nSHEKKA");
	var x:int = rand(pc.totalVaginas());
	output("<i>\"Lets have a little bit of girlish fun, just you and me,\"</i> you offer, flicking a sign on the door to read <i>\"Closed.\"</i>");
	output("\n\nShekka's tail gently swats your [pc.butt] before you finish. <i>\"Sure thing, but we'll have to see if you can keep up with me.\"</i>");
	output("\n\nSpinning about, you ");
	if(pc.tallness >= 72) output("drop low to ");
	output("grab her around the waist, pulling her into a surprise kiss - your payback for her tail's probing. Her lips are soft against your own, compressed down by the force of the kiss, but her long, sinuous tongue winds into your own mouth, its pernicious wiggling inciting your [pc.tongue] into a dance. You grab her by the back of the neck, the pink feathers of her hair soft between your fingers, and press her closer, tighter, her budding breasts against your [pc.chest].");
	output("\n\nShekka's fingers are no less busy");
	if(!pc.isNude()) output(", moving amidst your [pc.gear], separating it from your [pc.skinFurScales] with deft contortions of her fingers");
	else output(", moving over your [pc.skinFurScales]");
	output(", crawling over your body to your [pc.nipples]. They gently tweak them while her tongue curls around your own, filling your mouth with inch after inch of the pliable organ. You stumble around the room from junkpile to junkpile. Your [pc.legs] unsteadily wobble as you try to focus on twisting tongues and the slim fingers prodding at your");
	if(!pc.isNude()) output(" increasingly nude");
	output(" form.");

	output("\n\nThe raskvel rides you like a bucking bronco, taking you to the ground once your excitement overwhelms your motor control. She breaks the kiss at last with a satisfied sigh. Her lips are glossy with shared saliva, and her meager chest is heaving with panting breaths. Shekka grins and raises a finger to the neckline of her jumpsuit. <i>\"Just a little bit of girlish fun.\"</i> The suit parts, a line opening up down the center of her chest. She ");
	if(pc.biggestTitSize() < 1) output("greedily caresses your own, letting her fingernail dig in just a little.");
	else output("greedily gropes your tits, squeezing and caressing the orbs impulsively.");
	output(" <i>\"Just a little bit.\"</i>");

	output("\n\nThe slowly opening divide in the alabaster fabric widens with torturous slowness, but it affords you a detailed view of Shekka's reddish scales and well-formed breasts. You grab hold of it on both sides and tug. It gives as if there was never anything holding it at all, allowing you to to yank it down to her flared hips in an instant. The raskvel's puffy nipples pebble in the cool air, and you let go of her suit to brush one with your thumb, eliciting a gasp of delight from the tiny alien.");
	output("\n\nShekka giggles and squirms, but she lifts her shapely bottom up off of you to to aid you in disrobing her. You tug it down her legs to her knees before giving up on the current positioning and rolling, pinning her underneath you so that you pull the offending garment entirely away. You toss it over your shoulder, and it lands in a shimmery heap, it's owner naked and vulnerable below. You echo, <i>\"A little fun,\"</i> now that you're above her, your [pc.vaginas] close enough to hers to kiss, the glittering wetness of your anticipation hanging from a [pc.clit] like a drop of dew.");
	output("\n\nHer tail curls up between your bodies to bar her violet entrance from sight. She giggles playfully, then bucks her hips upward, slamming the slightly-ridged texture of her tail into [pc.oneVagina]. You gasp in surprise and pleasure. The sudden press of her warm body against your entrance is at once tantalizing and mildly painful - more the former than the latter. Then, with a knowing grin, Shekka closes her eyes, an expression of pleased focus on her features.");
	//Happened before
	if(flags["TIMES_TAILVIBED_WITH_SHEKKA"] != undefined)
	{
		output("\n\nYou remember the vibrator in her tail a second before it activates, but nothing could prepare you for how good her scales feel buzzing against your puffy, aroused entrance.");
	}
	//Not before
	else output("\n\nYou look on in confusion, but her tail answers your unspoken question with a powerful, throbbing buzz, vibrating wildly against your puffy, aroused entrance. It obviously has some kind of implant that lets it shake so... so... well.");
	//Merge
	output("\n\nA high pitched whimper slips from your lips while your [pc.hips] react to the pleasure with an instinctive, powerful thrust, pinning the ");
	if(pc.tallness >= 55) output("smaller");
	else output("equally small");
	output(" mechanic to the ground with your creaming-wet pussy, wrapping half of her tail with your folds. On the other side, her immensely engorged labia spread until you can feel them kissing around the trembling intruder. Both pussies lock into a sopping-wet embrace around her vibrating tail; you barely seem to be different creatures. Where once there were two aroused beings, there remains only a single, writhing beast of sapphic desire.");
	output("\n\nThe buzz quiets, drowned in a sea of feminine lubricants, but you are far from idle. Supporting yourself with one hand, you reach for one of Shekka's breasts, grabbing on for dear life. It's soft and supple, blushing hotly. You can feel the little raskvel's tiny heart hammering in her chest as you squeeze. The eager pushes and prods of her own fingers against your [pc.chest] abate. Instead, her arms close around your neck and pull you into her, kissing you once more. Her nails dig into your back, but your sense of pain is deadened by white hot bar of pleasure assailing your loins.");
	output("\n\nDamn, Shekka's tongue is long. She could probably loop it around your tonsils if she wanted to, but she seems content to slide it against your mouth's muscle, curling and squeezing it, sometimes constricting, boa-like around it. You lose yourself in the tangle of limbs, the ecstasy of one body pressed against another and the constant vibrations torturing your [pc.clit] with pleasure. The room seems to be spinning.... Wait, it is spinning!");
	output("\n\nShekka pins you flat on your back, but it frees you to reach down and grab her ass, to feel her cheeks twitch and her muscles dance when a spasm of uncontrollable sexual energy convulses through her hips. She squirms, moaning into you. Your hands pull her harder against you, increasing the force of the tremors wracking your cunt - and hers. The scaley slut screams into your mouth and finally breaks the kiss, shrieking into your shoulder as she cums. Her juices spatter over your [pc.legs] like rain from a typhoon. It's all you can do to steady her thrashing form from tumbling to the floor while avoiding a cunt-wrenching cum all your own.");
	output("\n\nNervelessly fluttering, Shekka's fingers telegraph her orgasm directly into your ");
	if(pc.biggestTitSize() >= 1) output("breasts");
	else output("chest");
	output(", catching on your [pc.nipples] and pressing into the soft, nerve-packed tips. You close your eyes and grit your teeth, holding yourself back from the edge by sheer force of will. The petite beauty above twists and wiggles through euphoric spasms, secure in your arms, juicing twat still pressed to yours around the intrusive wiggling of her tail. You press your lips to hers in a tender kiss, and she slowly stills, only occasionally trembling through aftershocks.");
	output("\n\nStill holding tight to her, you feel the heated waves of ecstasy fluttering in your nethers, as irresistible as the ocean tides. The cunt-clenching tsunami crashes over your crumbling wall of willpower, bathing everything in tidepools of pleasure. Your eyes roll back a second before Shekka's clear. The crafty girl acts as soon as she realizes what's going on. Her tail, once a passive participant for you to grind against, slithers into your [pc.vagina " + x + "], still vibrating. Your convulsing, bliss-filled walls clamp onto it. You can feel the vibrations carry through your pliant, clinging flesh all the way to your [pc.clits].");
	if(pc.hasCock()) output(" Your [pc.cocks], pinned between the two of you, spurt{s} your [pc.cum] between your slick, squirming forms, simultaneously forgotten and yet adding another layer of bliss to your overpowering release.");
	//Cuntchange
	cuntChange(x,5,true,true,false);
	output("\n\nYou twist on the floor, the raskvel riding you, pumping you wildly. The air fills with the high-pitched sounds of your passion and the scent of your mixed secretions almost seems to steam the air around your sweaty, entwined bodies. Shekka pulls partway out to hold her tip against [pc.oneClit], and the vibrating length drives your consciousness away in an explosion of ecstasy.");
	processTime(40+rand(10));
	pc.orgasm();
	chars["SHEKKA"].orgasm();
	clearMenu();
	addButton(0,"Next",shekkaGrindsFinish);
}

//Next
function shekkaGrindsFinish():void
{
	clearOutput();
	userInterface.showBust("SHEKKA");
	userInterface.showName("\nSHEKKA");
	output("You come to feeling wet and sticky all over, a small form perched atop you. Its brilliant, exuberant eyes blink at you, and your groggy mind identifies it as Shekka. She giggles, kissing you on the lips once more before standing up and offering a hand");
	if(pc.tallness >= 60) output(", a gesture that's almost comical given the size difference");
	output(".");
	output("\n\n<i>\"Wow,\"</i> you pant, still a little stunned.");
	//Never had vibrations before
	if(flags["TIMES_TAILVIBED_WITH_SHEKKA"] == undefined)
	{
		flags["TIMES_TAILVIBED_WITH_SHEKKA"] = 0;
		output("\n\nShekka beams. <i>\"Subdermal vibrator implant.\"</i>");
		output("\n\nThere's no hiding your surprise.");
		output("\n\n<i>\"What? You don't have those back home?\"</i>");
		output("\n\n<i>\"No,\"</i> you answer. At least, you're pretty sure you don't. You haven't seen one before, anyway.");
		output("\n\nShe waggles her wiggly little appendage. <i>\"Well, it's nice, isn't it?\"</i>");
		output("\n\nIt is indeed.");
	}
	//Had 'em before
	else
	{
		output("\n\nShekka smirks as you get up on wobbly [pc.legs]. <i>\"It was only a little fun....\"</i>");
		output("\n\nYou roll your eyes. <i>\"It's a good thing you're not any bigger then! I'm not sure I could handle any more of you vibrating like that.\"</i>");
	}
	//Merge
	output("\n\nGathering your [pc.gear], you and the little raskvel make yourselves as decent as you can, though the scent of your recent lovemaking hangs heavy in the air around you. Anyone with a keen sense of smell will be sure to smell the evidence of your recent tryst, no doubt. Before you flip the sign back to mark the shop as being open, Shekka gives you a wink. Then, her welding mask flips closed, and she goes back to work.");
	flags["TIMES_TAILVIBED_WITH_SHEKKA"]++;
	fuckedShekka();
	//Pass 70-80 minutes
	processTime(30+rand(5));
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

function fuckedShekka():void
{
	if(flags["TIMES_SEXED_SHEKKA"] == undefined) flags["TIMES_SEXED_SHEKKA"] = 0;
	flags["TIMES_SEXED_SHEKKA"]++;
}