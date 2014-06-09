//Kelly works at Xenogen from 6AM till 5PM. Impliment a way to lock down the xenogen building when she's not there.

function showKellyName():void
{
	if(flags["KELLY_MET"] == undefined) userInterface.showName("BUNNY\nGIRL");
	else userInterface.showName("\nKELLY");
}

// Stubtown4compile
public function kellyAttraction(modValue:int = 0):int
{
	throw new Error("Not Implemented Yet");
}

//Appearance
function kellyAppearance():void {
	clearOutput();
	userInterface.showBust("KELLY");
	showKellyName();
	author("Quiet Browser & LD");
	output("Louise \"Kelly\" Epona, though if you dare call her <i>Louise</i> she’d be pretty mad at you, is a gene-modded laquine you met on the planet Mhen'gha in the town of Esbeth.");
	output("\n\nStanding five feet and nine inches tall with a buxom, curvy body strongly resembling a humanoid rabbit, she stares at you through amber eyes with a confident smile. Her rabbit-like ears fall down the back of her skull from the top of her head to her shoulders in an iconic \"Floppy-eared bunny\" look. A rabbit-like tail flashes above her bum, and her bare feet extend into rabbit-like appendages, her legs jointed in an odd fashion that lets her stand on both the balls of her feet, making them digitigrade, or on the heels of her feet, making them look plantigrade, like a human's.");
	output("\n\nHer face is unquestionably rabbit-like, with a short muzzle. However, you note that her features are possessed of soft, feminine curves that make her quite attractive. Her lips in particular are full and enticing, naturally kissable and prone to a seemingly unconscious pout that amplifies the sexiness of her smile. Her whole body");
	//if not sexed:
	if(flags["KELLY_SEXED"] == undefined) output(" , you presume,");
	output(" is covered in soft, downy, fine fur, ");
	//At work
	if(9999 == 9999) output("though she’s currently covering up most of it in her clothes, ");
	output("with shoulder-length casually brushed hair.");

	output("\n\nHer most striking feature, at first sight, is her strange coloration. Reminiscent of a bumble-bee, her entire body");
	//At work
	if(9999 == 9999) output(", from what you can see,");
	output(" is covered in yellow and black stripes, except for her tail and ears, which are slightly orange. She exudes a scent that reminds you keenly of honey, but you also detect a distinctly feminine undertone.");
	if(flags["KELLY_SEXED"] == undefined) output(" Perhaps a perfume of some kind?");
	else output(" The knowledge that this is her natural aroma is both enticing and exotic. One would think the smell of honey would be sickening after so long, but you’ve come to enjoy it.");

	//If AtWork:
	if(9999 == 9999) output("\n\nShe is wearing a formal suit, as befits a representative for the Xenogen Corporation. A subtle and refined piece, it wouldn't go out of place on any businessman or woman. Seated behind her desk as she is, you cannot see her lower torso, but even the formal tone of her suit and her tie fails to completely obscure the impressive DD-cup swell of her bosom.\n\nA soft cough draws your attention back to her. <i><i>\"" + pc.mfn("Sir","Madam","Excuse me") + "? May I help you?\"</i></i>");
	//If OffWork:
	else {
		output("\n\nNo longer having to worry about office image, Kelly is letting it all hang out - quite literally. Her top is straining the limits of the word \"bikini,\" little more than triangles of fabric stretched over her perky nipples and held in place by straps that crisscross over her impressive DD-cup tits. For pants, she is wearing the cut-short denim jeans you have heard of as \"Daisy Dukes,\" which seem to be just barely big enough to fit her and leave nothing to the imagination regarding her perky, full, squeezable ass. Or her gender.\n\nDespite the feminine nature of the rest of her body, the front of her shorts bulges obscenely, straining to cover a clearly monstrous masculinity, stretched so tight it gives her a blatant camel-toe. Yet, somehow, it manages to do so without bursting its zipper.");
		if(flags["KELLY_SEXED"] != undefined) output(" You know from personal experience that her shorts are concealing a truly incredible array of sexual organs; a vagina, two cocks, and four balls. Her vagina is deep and wet, yet wonderfully flexible and tight. Her balls are the size of grapefruit, and her cocks, whilst normally 12\" long by 2\" horse-like shafts, can grow up to 36\" long and 4\" thick if she neglects her medication and lets herself get aroused.");
		output("\n\nShe giggles, drawing your attention back to her smiling face. <i><i>\"You know, it’s not very fun if you just sit there gawking at me. How about we do something else? Hmm?\"</i></i>");
	}
	//Display options//
	kellysOfficeMenu();
}

//At Xenogen Research Labs
//In The XRL Reception Hall
function kellysOfficeBonusFunction():Boolean
{
	userInterface.showBust("KELLY");
	showKellyName();
	author("Quiet Browser & LD");
	//If Player has not met Kelly Yet:
	if(flags["KELLY_MET"] == undefined) {
		output("\n\nA strange figure is seated behind the receptionist counter; a bipedal female humanoid who looks... well, like an anthropomorphic rabbit. But with a vaguely bee-like fur pattern of black stripes on yellow, offset by honey-orange hair. Maybe she's one of those furry gene-modders?"); 
		if(flags["MET_PENNY"] != undefined) output(" Like Penny?");
		output(" She calls for you to approach.");

		//1st Time:
		output("\n\nYou walk over to the rabbit-like receptionist, currently busy going over some files. One flopping ear, nearly hidden amongst the lush strands of honey-orange hair she has, twitches as you approach and she looks up towards you with a beaming smile. \"<i>Why, hello there, and welcome to Xenogen Research Labs, where the wonders of biotechnology never cease! My name is Kelly, the receptionist - how may I help you today?</i>\" Though her words are professional and welcoming, her tone is sincerely chirpy and friendly, suggesting she's quite happy to see you.");
		//If no Laquine entry in codex:
		if(9999 == 0)
		{
			output("\n\nYour codex gives a beep, signalling that Kelly is a member of an alien race. Stealthily, you check it out and skim the summary; Kelly here is a member of a race of rabbit-like anthro aliens known as the Laquines. They're most well-known for their high rate of hermaphroditism, and their rabbit-like breeding abilities, though in recent decades a mysterious \"sterility plague\" has been afflicting the race.");
			//9999 unlock codex.
		}
		output("\n\nHer fingers tap away at the keyboard, and she scans the screen professionally. <i>\"Hmm... I see we don't have your ID in our registry. Before we can allow you into the building or offer any kind of services to you, we require that you fill out a registry form, " + pc.mf("sir","madam") + ". Would you like to register now, " + pc.mf("sir","madam") + "?\"</i></i>");
		
		processTime(2);
		//[Yes][No]
		clearMenu();
		addButton(0,"Yes",registerAtKellysOffice);
		addButton(1,"No",dontRegisterInKellysOffice);
		return true;
	}
	else
	{
		output("\n\nKelly is at her usual position behind the receptionist counter, idly going over her work. She sees you entering and smiles, giving you a friendly wave, before getting back to work.");
		addButton(0,"Kelly",kellyOfficeApproach);
	}
	
	return false;
}

//Approach
function kellyOfficeApproach():void {
	clearOutput();
	userInterface.showBust("KELLY");
	showKellyName();
	author("Quiet Browser & LD");
	output("Kelly looks up at your approach, smiling to see you with her usual chipper attitude. \"<i>Welcome back to Xenogen Research Labs, where the wonders of biotechnology never cease! How may I help you, ");
	output("[pc.name]");
	//{my friend}/{honey}
	output("?</i>\"");
	processTime(1);
	//[PurchaseMods] [Talk] [Flirt] [Leave]
	kellysOfficeMenu();
}	

function kellysOfficeMenu():void {
	clearMenu();
	userInterface.showBust("KELLY");
	showKellyName();
	author("Quiet Browser & LD");
	addButton(0,"Appearance",kellyAppearance);
	addButton(1,"Talk",talkToKellyInOffice);
	addButton(14,"Leave",mainGameMenu);
}

//[=No=]
function dontRegisterInKellysOffice():void {
	clearOutput();
	userInterface.showBust("KELLY");
	showKellyName();
	author("Quiet Browser & LD");
	output("You apologize, but you don’t feel like registering now, so you’ll be leaving.");
	output("\n\n<i><i>\"I understand sir, Xenogen thanks you for your visit. Please come again.\"</i></i> she says with a polite smile and a nod, indicating the door.\n\nYou walk out.");
	//Leave the area and redo everything in case the PC comes back.
	
	clearMenu();
	addButton(0,"Next",move,"SOUTH ESBETH 2");
}

//[=Yes=]
function registerAtKellysOffice():void {
	clearOutput();
	userInterface.showBust("KELLY");
	showKellyName();
	author("Quiet Browser & LD");
	flags["KELLY_MET"] = 1;
	output("Sure thing, you reply.");
	output("\n\n<i>\"Excellent. Now, if you would just give me your name, " + pc.mf("sir","madam") + ",\"</i> she begins....");
	output("\n\nYou follow her instructions, and after a short while you are finished with your registration.");
	output("\n\n<i>\"And finished,\"</i> she says brightly. <i>\"Xenogen welcomes you, " + pc.mf("Mister","Miss") + " Steele, to their family. You now have full access to all services that we provide here at Xenogen labs. How may I assist you further?\"</i>");
	processTime(3+rand(3));
	//Display Kelly at Xenogen Options//
	kellysOfficeMenu();
}

//Talk
function talkToKellyInOffice(display:Boolean = true):void {
	if(display)
	{
		clearOutput();
		output("\"<i>A friendly chat?</i>\" Kelly repeats. \"<i>Well, sure, I suppose I could use a short break anyway. What do you want to talk about?</i>\"");
	}
	userInterface.showBust("KELLY");
	showKellyName();
	author("Quiet Browser & LD");
	//Display options
	//Regardless of Talk option chosen, give +5 Attraction.
	clearMenu();
	addButton(0,"Herself",talkToKellyAboutHerself);
	addButton(1,"Her Role",talkToKellyAboutHerRoleAtXenogen);
	addButton(2,"Working Here",talkToKellyAboutWorkingHere);
	addButton(3,"Flirt",flirtWithKellyInTheOffice);
	addButton(14,"Back",kellysOfficeMenu);
}

//Herself
function talkToKellyAboutHerself():void
{
	clearOutput();
	userInterface.showBust("KELLY");
	showKellyName();
	author("Quiet Browser & LD");
	output("<i><i>\"Now, now.\"</i></i> She waves a finger at you. <i><i>\"Aren’t you getting a little ahead of yourself?\"</i></i> She smiles disarmingly.");
	output("\n\nYou apologise, you didn’t mean to offend her. You were just interested in getting to know her a little better.");
	output("\n\n<i><i>\"Flirting at work is forbidden, you know? How about you catch me off the clock? Then you and I can get to know each other a bit better,\"</i></i> she smirks.");
	output("\n\nYou nod and tell her you’d like that.");
	output("\n\n<i><i>\"Excellent, now... anything else?\"</i></i> She bats her eyes.");
	//Kelly at the Mead Hall unlocked
	//Revert to default Kelly options
	talkToKellyInOffice(false);
	removeButton(0);

}

//Role at XRL
function talkToKellyAboutHerRoleAtXenogen():void
{
	clearOutput();
	output("\"<i>My role here at Xenogen? Well, that's an easy question,</i>\" she giggles. \"<i>I'm basically a receptionist - you know, I interact with customers, handle intra-office mail, generally try and keep the place running smoothly down here on the ground level, you know?</i>\" she shrugs her shoulders and grins, unabashed by her rather low-level position. \"<i>I suppose the most interesting part of my job is the mod dispensing,</i>\" she adds.");
	output("\n\nWhen you ask what that means, she puffs her chest out proudly and launches into her explanation. \"<i>Here at Xenogen, we make a wide variety of modifications. Many of our clients come for personally customised changes and transformations, but we do get a significant amount who ultimately are after the same sorts of basic mods. These popularised \"com-mods\" are so frequently requested that we have them stocked and ready. I'm empowered to sell these basic mods literally over the counter to people who are willing to pay the credits for them.</i>\"");
	output("\n\nShe then smiles at you playfully. \"<i>So, are you interested in buying anything?</i>\"");
	//Display default Kelly menu options
	talkToKellyInOffice(false);
	removeButton(1);
}

//Working Here
function talkToKellyAboutWorkingHere():void {
	clearOutput();
	output("\"<i>Are you asking how I came to be working here, or if I like working here?</i>\" She giggles, batting her eyelids at you playfully. \"<i>Well, I suppose I can answer both...</i>\" she pokes her tongue out at you momentarily, then looks more serious.");
	output("\n\n\"<i>I basically hitchhiked my way here after my old ship broke down - stupid overpriced lame piece of crap conked out a couple of systems over. I hocked it for scrap and started thumbing my way; wound up left here because of my last jerkwad captain - probably because I wouldn't sleep with her, the damn size-queen bitch,</i>\" she grumbles at the memory. \"<i>I still had enough credits to get a cheap place to stay, but they weren't going to last forever, and I didn't want to be stuck on this rock permanently, so I started looking around. Xenogen was offering a receptionist position, and I took it.</i>\"");
	output("\n\n\"<i>As for working here,</i>\" she shrugs her shoulders with an amiable smile. \"<i>I don't intend to stay here forever, I'm saving up credits to buy a new little starrider of my own when I can, but it's a nice enough job. Good pay, good hours, fairly simple work, I'm out of the worst of the heat, and I even get something of an employee's discount on buying my own mods,</i>\" she tells you, then claps her hands sharply. \"<i>So, that's that done, anything else I can help you with?</i>\"");
	//Display default Kelly menu options
	talkToKellyInOffice(false);
	removeButton(2);
}

//Purchase Mods (requires GUI update)
//9999
//"<i>Oh, you'd like to purchase some of our basic modification programs? Why, certainly,</i>" she chimes merrily. 

//Flirt
function flirtWithKellyInTheOffice():void {
	clearOutput();
	output("<b>This scene is meant to unlock later but I'm allowing it until the rest of her content is in.\nWARNING: HERM WITH TWO BIG DICKS.</b>\n\n");
	output("You wonder how Kelly would react if you were to flirt with her a little....");
	output("\n\nYou lean over her table wearing a seductive expression and ask Kelly how she’s doing.");
	output("\n\nShe looks back at you with an amused expression. <i><i>\"I’m better now that you are here. I’ve been bored here, all by myself, for a while now.\"</i></i> She smiles.");
	output("\n\nSlow day, huh?");
	output("\n\n<i><i>\"Yeah....\"</i></i> She stretches herself on her chair, popping her shoulders in the process. <i><i>\"So why exactly are you here? Fraid you haven’t told me what you are up to yet, honey.\"</i></i>");
	output("\n\nYou were wondering if she’s up for some <i>fun</i>.");
	output("\n\nA knowing smirk spreads on her lips, but she shakes her head. <i><i>\"Sorry, honey, but I’m strictly forbidden from flirting at work. And I do like this job enough that I don’t care for getting fired, but if you wait until later I’d be happy to continue this train of thought.\"</i></i>");
	processTime(3+rand(2));
	//[FlirtAnyway][Wait]
	clearMenu();
	addButton(0,"Flirt Anyway",flirtWithKellyAnyway);
	addButton(1,"Wait",dontFlirtWithKelly);
}

//[=Wait=]
function dontFlirtWithKelly():void {
	clearOutput();
	output("In that case, you guess you’ll just have to wait until later.");
	output("\n\n<i>\"Don't worry, [pc.name], I promise you I'll make it worthwhile,\"</i> she purrs, and winks. <i>\"Now, how else may I help you?\"</i>");
	//(Display Options)
	kellysOfficeMenu();
}

//[=FlirtAnyway=]
function flirtWithKellyAnyway():void {
	clearOutput();
	output("You are not taking no for an answer. Without giving her time to react, you grab her by the shoulder and draw her into a kiss.");
	output("\n\nStunned, she doesn’t put up any resistance as you thrust your [pc.tongue] into her mouth, tasting her as you maneuver yourself over her table.");
	output("\n\nShe almost starts kissing you back before she comes to her senses and pushes you back. <i><i>\"[pc.name]! What the hell!? I already told you we can’t flirt-\"</i></i> You silence her with a finger, not bothering to grace her with reply. You want her, and you want her now! As a matter of fact... you know she wants you too, if the bulge in her skirt is any indication.");
	output("\n\nYou duck under her table, ");
	if(pc.reflexes() >= 40) output("nimbly unfastening her belt, ");
	else output("struggling a bit before you can get her belt undone, ");
	output("and pulling her skirt down.");

	output("\n\nHer twin erections spring out of the once-restraining fabric, bouncing eagerly into place before you, already starting to ooze an orangey syrup-like precum from their flat heads, a sweet scent wafting from them. She moans plaintively. \"[pc.short], seriously... we can't... I can't get caught,\"</i> she protests.");

	output("\n\n<i><i>\"Then you’ll just have to stay quiet and pretend nothing is happening,\"</i></i> you reply without a care. Now to give these tasty morsels before you the treatment they deserve....");
	output("\n\nShe bites her lip at that, visibly wrestling with the dilemma before her. On the one hand, she clearly does fear for her job. On the other hand, that this has her turned on is as obvious as the straining cocks in your hands. <i>\"I... oooh, alright. Make sure no one spots you,\"</i> she says, sliding her chair forwards in an attempt to further conceal you, unintentionally thrusting one of her flared tips against your lips.");
	output("\n\nYou knew she’d come around. Casually, you extend your tongue to lap off a dollop of syrupy pre off her offered cock, earning yourself a barely suppressed moan from above your head, a quiver racing down Kelly's body and visibly shuddering through her shafts.");
	output("\n\nEmboldened, you lean forward to meet the tip of the closest dick and gently lap at its blunt glans with your [pc.tongue], allowing the strange, sweet, sugary taste of her pre-cum to roll across your tongue. Finding it to your liking, you gently continue to lick it, switching over to her second cock to catch the precum dripping from it when the first one is rendered momentarily clean. Kelly makes no sound, and you can just envision her biting her lip to keep from doing so, but her enjoyment is made quite clear.");
	output("\n\nWithout further ado, you guide her tip into your mouth and engulf it within your warm mouth. A moaning sigh escapes her, a spurt of sweet syrup entering your mouth. The taste of it assaults your senses with sweetness from her pre-cum, tinged with the salt from her skin. You caress the length in your mouth with your [pc.tongue], moving your [pc.lips] as you bob your head gently back and forth. Your hands, now freed, stroke the other shaft in rhythm so that it won't get lonely while you tend to this one.");
	output("\n\nShe bites back any noises she may be tempted to make, but from the way she twitches and the firmness of her dick in your mouth, you know she's enjoying this. Her second cock butts insistently against your chin, as if demanding you pay attention to it too.");
	output("\n\nHaving tasted enough of her first horsehood, you decide to switch to the other and give it the same treatment, tasting more of her sweetness as you do so.");
	output("\n\nShe does moan at that, softly, but then stiffens - and not in a way that shows she's enjoying the feel of your tongue on her hot flesh. <i>\"[pc.name]! Ix-nay on that! Somebody's here,\"</i> she hisses to you urgently. <i>\"Why, hello there, and welcome to Xenogen Research Labs, where the wonders of biotechnology never cease! My name is Kelly, the receptionist - how may I help you today?\"</i> she says in the same professional yet friendly tone she first used when you arrived - clearly addressing this to her new customer.");
	output("\n\nYou consider stopping for a moment... but what would be the fun in that? Besides, you're too absorbed in your task to bother stopping now. You release her current cock and immediately engulf the other one, continuing your switcheroo blowjob.");
	output("\n\nKelly's whole body twitches, but she somehow avoid letting out anything other than a tiny squeak when you switch over. <i>\"Y-you're here for your appointment sir - er, madam? Yes, of c-course I can he-elp you,\"</i> she says, struggling to keep her words level and even despite your assault on her tender parts. One foot delivers a pointed kick to your ribs, not hard enough to hurt, but enough to warn you not to push her further.");
	output("\n\nYou cough around her cock at the kick. Not too happy, you release her cocks and grab the offending foot instead. Then, With an evil smirk, you begin tickling between her toes.");

	output("\n\n<i>\"Ach! Ah - no! No, I'm fine, madam! J-just a slight cramp in my legs,\"</i> Kelly says desperately, trying to wriggle her foot out of your hand... though that might just be her jolting around as you tickle her. Looks like you've caught a sweet spot for doing that to her....");
	output("\n\nYou let go of her foot, confident she won’t kick you again, and resume your sucking and massaging of her cocks.");

	output("\n\nThe sound of Kelly's fingers flying across her keyboard can be heard, and she comments with open relief. <i>\"Ah, here you are, madam. Please, follow the green line to reach your destination,\"</i> she informs her customer. Her voice quivers a little, but evidently she pulled it off, as you can hear her customer leaving. <i>\"Oh, gods...\"</i> she whimpers quietly, her self-control crumbling under your pleasurable onslaught.");

	output("\n\nYou feel her cocks throb in your grasp; looks like she doesn’t have long. With that in mind you switch again and redouble your efforts. As your mouth envelops and caresses the second dick, your hands move, fingers teasingly trailing down both of the laquine's engorged lengths to reach her inhumanly stuffed sac. Four nuts the size of grapefruits sway under your caressing fingers, black fur stretched taut over their liquid contents. Even as you suckle hungrily at each dick in turn, your fingers stroke her swollen balls, sliding underneath to find the dampness of her pussy, which ripples invitingly at the touch of your fingers. You stroke her plump netherlips, feeling them drool her slick lube across your fingers, then gently slide them in - ah!");
	output("\n\nShe was waiting for that, it seems. You feel her cunt clench down around your fingers, uncaring of the fact they are not a prick, squeezing you tightly and rippling around you as if trying to milk you of the semen that your digits do not, in fact, have. You wriggle them inside of her as best you can, as much to try and find a way to slip free of the silken vice they are trapped in as to pleasure her. She visibly quakes and shudders, grapefruit-sized balls swaying back and forth, cunt spasming and opening wide enough to let you pull your fingers free.");
	output("\n\n<i>\"C-can't hold it back,\"</i> she moans, her whole body twitching as she fights against the inevitable. You hear her clattering around the contents of her desk as she grabs for something, before her hand thrusts itself into view, an abnormally large-sized coffee-mug in her grip.");
	processTime(25+rand(10));
	pc.lust(30 + rand(10));
	//New Page//
	clearMenu();
	addButton(0,"Next",flirtWithKellyAnywayPartII);
}
function flirtWithKellyAnywayPartII():void {
	clearOutput();
	output("Not feeling in the mood for a belly-bloating, you wetly pop your mouth free of the cock currently in it and take hold of both of the long, swollen shafts, snatching the mug from Kelly's hand and positioning it to catch the resultant semen.");
	output("\n\nYou watch in lustful amusement as Kelly's twin glans flare out, swelling into wide flattened heads, visibly bulging as her four balls unleash their copious load. The scent of honey fills the air an instant before great spurts of syrupy orange semen come flying from her dicks, splattering thickly into the mug and rolling over your fingers. You close your eyes to avoid being blinded, the overpowering sweetness filling the air as Kelly just keeps on cumming, and cumming....");
	output("\n\nThe mug fills rapidly, but her production is way more than it can hold, and soon it's just pouring over the rim and puddling messily upon the floor. By the time she stops at last, you are kneeling in a puddle that is sluggishly oozing into a surreptitious drain.");
	output("\n\n<i>\"Oh... gods, gods, gods,\"</i> she whines softly as her impressive balls finally empty themselves, her shafts going soft. She gestures for the mug and you hand her the sticky, slowly sloshing cup to her, whereupon she lifts it back out of sight. She pants heavily and repeatedly, slowly catching her breath as she comes down from the pleasure of her climax.");
	output("\n\nHappy that you brought your laquine lover over the edge, you crawl away and emerge from under her desk with a pleased smile of accomplishment.");
	output("\n\nShe just sits there for a moment, eyes looking at you as you stand up again. When you get close enough, though, her hand shoots out like lightning, cracking audibly against your cheek. <i>\"Jackass! Just what were you thinking?! I told you that I can't be caught fucking around on the job - I'd lose my position here!\"</i> She snaps at you. <i>\"All I wanted was for you to wait two minutes whilst I sorted that out, you have any idea how much risk you put me in with those little games of yours?!\"</i> She snarls, panting again in her anger.");
	output("\n\nYou rub your cheek and throw her an apology, admitting that maybe you were a little out of line.");
	output("\n\nShe takes a deep breath and then slowly exhales it, visibly calming down. <i>\"And with that out of the way... thank you. That really was exactly what I needed, all things considered. Oh!\"</i> She giggles softly. <i>\"Come here a sec, please?\"</i> As you bend your face closer to hers, she closes her eyes and sticks her tongue out, the yellow appendage snaking sinuously through the air and gently lapping at the corner of your mouth, drawing slowly over your lips and then retracting. She opens her eyes with a coy smile. <i>\"I sprayed you with some,\"</i> she says by way of explanation.");
	output("\n\nAnd then her hands grab you and pull you into a full-on kiss, her tongue authoritatively thrusting itself into your mouth, trying to dominate you with its supple length. You are bit stunned by her initial move, but quickly recompose yourself and kiss her back. Your tongues and lips wrestle for a pleasurable minute or two. As she breaks the kiss she sighs in satisfaction. <i>\"Just don't do that again, buster,\"</i> she warns you, a twinkle in her eye.");
	output("\n\nShe stretches herself luxuriantly after she releases you. <i>\"Now, I really need a drink,\"</i> she comments, gently taking the mugful of her jism she captured early and taking a swig. With the ease that bespeaks of plenty of practice, she chugs the whole thing, then licks her lips clean, her eyes darting in your direction. <i>\"Down, " + pc.mf("boy","girl") + "; you've had your fun for a while.\"</i>");
	output("\n\nShe gets to her feet and pulls up her skirt, refastening her belt with a strangely authoritative gesture. Once that's done, she starts to push you towards the door. <i>\"Come on, let's get you out of here before you get any more bright ideas,\"</i> she says, but she's grinning as she does so.");
	output("\n\nYou don’t bother protesting as you are shoved towards the door by the eager modded laquine.");
	output("\n\nAs she gets you to the door proper, she stops. <i>\"Don't be a stranger though, okay, honey?\"</i> she asks with a grin you can just hear, then pushes you through. The door closes itself behind you, but you can hear a brief conversation coming from inside.");
	output("\n\n<i>\"Good morning, Ms. Epona,\"</i> an unfamiliar voice says.");
	output("\n\n<i>\"Ah! G-good morning, sir,\"</i> she replies.");
	output("\n\n<i>\"So, you're still wearing that special honey-scented perfume of yours? Might I suggest you start wearing a little less, please? The whole lobby smells like a beehive.\"</i>");
	output("\n\n<i>\"Oh! Ah, yes, yes sir, I'll keep that in mind,\"</i> she apologetically replies.");
	output("\n\nYou leave with a knowing chuckle.");
	processTime(10+rand(5));
	clearMenu();
	addButton(0,"Next",move,"SOUTH ESBETH 2");
}


//At Burt's Mead Hall
//In The Mead Hall
//Requires player has activated Kelly at the XRLs
//Add to bar bonus func.
function kellyAtTheBar():void
{
	output("\n\nKelly is sitting in one of the quieter, more out of the way tables, with a single, barely-touched bottle of mead and a cup in front of her. She spots you and waves cheerfully, clearly recognizing you.");
}

//Approach
function approachKellyAtTheBar():void
{
	clearOutput();
	//1st Time:
	if(flags["KELLY_ENCOUNTERED_AT_THE_BAR"] == undefined)
	{
		flags["KELLY_ENCOUNTERED_AT_THE_BAR"] = 1;
		output("You waltz up to the friendly receptionist and greet her with a wave.");
		output("\n\n<i>\"Why hello, there, " + pc.mf("handsome","beautiful") + ", going my way?\"</i> she purrs, openly checking you out.");
		output("\n\nSeeing no reason not to, you decide to return the favor.");
		output("\n\nNow that she's out of that stuffy uniform, you can really see how well-stacked this girl is. She's barely wearing any clothes at all, with a teeny-tiny bikini struggling to simply hide her nipples, nevermind obscure her luscious DD-cups. You can see for yourself that her yellow and black color-scheme goes <i>everywhere</i> as your eyes trail down, over her flat stomach, towards her shapely legs. She's squeezed herself into jeans cut down into miniature shorts, just barely enough to cover her ass and loins... and what loins. A monstrous bulge bloats the front of her shorts, and when she shifts, crossing one leg over the other, you can see the fabric beneath hugging a blatant camel-toe.");
		output("\n\n<i>\"Mmm... do you like what you see, " + pc.mf("handsome","beautiful") + "? Because I certainly do,\"</i> she says, openly licking her lips in a salacious gesture.");
		output("\n\nYou have to admit it’s quite a change from seeing her in a traditional business suit. She looks almost naked... in fact her choice of attire really leaves nothing to imagination.");
		output("\n\n<i>\"And is that such a bad thing,\"</i> she teasingly asks. <i>\"When you're as sexy as I am, why, it's a crime to hide it... besides, fair is fair when it comes to letting folks know what you're packing, don't you think?\"</i> she questions, uncrossing her legs and patting her bulging crotch. <i>\"Not to mention, I spend all day stuffed into one of those suits at work - I deserve the opportunity to get out of those awful things and let myself have some air.\"</i>");
		output("\n\nWell, you for one appreciate knowing what you’re getting into. Especially when they’ve such an impressive bulge.");
		output("\n\n<i>\"Aw, what's wrong, honey-buns? Don't you like a girl with something extra upfront?\"</i> she asks in one of those over-sweet, exaggerated tones. <i>\"Is it really such a turn off to see a chick with a nice, meaty dick of her own?\"</i>");
		processTime(2);
		//[Yes][No]
		clearMenu();
		addButton(0,"Yes",yesKellyDickChicksAreATurnOff);
		addButton(1,"No",noKellyIFuckingLoveDickgirls);
	}
	else
	{
		output("You make your way towards Kelly’s table and without another word you pull a seat beside her and seat yourself. You make yourself comfortable and smile at Kelly as she takes a swig of her drink.");
		output("\n\n<i>\"Well, well, well. Like bees to flowers. Tell me now, honey, what brings you here to lighten up this otherwise dull and dreary evening? Good company? Drinks? Honey?\"</i> She gasps in mock surprise. <i>\"Could it be <b>my</b> honey? Or maybe all of the above? Tell me.\"</i> She grins and takes another swig.");
		//Display options//
		//9999
	}
}

//[=Yes=]
function yesKellyDickChicksAreATurnOff():void
{
	clearOutput();
	output("She adopts a sorrowful expression and makes a tutting noise, shaking her head. <i>\"Aw, you really think that way? Well, don't worry, a little time with honey-bunny Kelly and your opinion will change,\"</i> she says, now sporting a cocky grin. <i>\"Once you've actually gotten to know the loveliness that is a dickgirl, you'll see just how wrong you used to be,\"</i> she purrs, openly fondling herself now. <i>\"Once you try me out, you'll never go back, I guarantee,\"</i> she sticks her tongue out, wriggling it in an obscene gesture before she draws it back inside, looking full of pride.");
	clearMenu();
	processTime(1);
	addButton(0,"Next",mainGameMenu);
}
//[=No=]
function noKellyIFuckingLoveDickgirls():void
{
	clearOutput();
	output("<i>\"Oh ho,\"</i> she says, grinning smugly. <i>\"Does somebody have a dickgirl fetish, hmm? Do you like a chick with a big, fat cock between her legs...? Well, who wouldn't? Mmm, there's no one better at sex than a herm, you know,\"</i> she croons, leaning back and blatantly caressing her bulging loins. <i>\"Boobs, butt, pole and hole, we've got it all. But then, what am I doing this for? Clearly, you have your head screwed on straight... though if it's a major lack of screwing in your life, don't worry, I can fix that in a jiff,\"</i> she giggles, winking at you saucily.");
	output("\n\nShe straightens up and stops cupping herself, resting her chin on her breasts and casting you flirtatious eyes across the tables. <i>\"Now that we have that settled... Seems to me there's nobody here with the balls to talk to me apart from you. So, lucky " + pc.mfn("boy","girl","cutey") + ", that means you and I can flirt... all. Night. Long.\"</i> She smirks.");
	output("\n\nLifting her head out of her cleavage, she slaps down a bit of paper and scribbles something at it, then holds it out to you. <i>\"Will you do a girl a favor, " + pc.mf("handsome","beautiful") + "? Run and take this to Burt over there, I need another drink. Get yourself one while you're there, too. My treat.\"</i>");
	output("\n\nQuite bossy isn’t she? Well you suppose it’s no work since you’re also getting a free drink out of it. With a nod you take the offered slip and head over towards the bar. As you make your way, you hear Kelly calling out shamelessly from behind you, <i>\"Now get that <b>sweet</b> [pc.ass] of yours back here to your honey-bunny ASAP, alright?\"</i>");
	output("\n\nYou shake your head with a chuckle, you barely know her and you already know she’s incorrigible. Once you get to the bar, you offer the slip to the bartender. He takes one look at the slip and shoots you a knowing look. <i>\"What it’ll be for you?\"</i> he asks.");
	output("\n\nYou place your order and he sets about mixing Kelly’s drink. With nothing to do, you lean back against the bar, checking out your surroundings. A catcall breaks your musing and you look at its source, not at all surprised to notice that it was aimed at a certain barely dressed bunny.");
	output("\n\nKelly doesn't look ruffled in the slightest, instead smirking proudly and then rolling her eyes. <i>\"Only a whistle? Is that all you think I'm worth? Or is it that you can't control your tongue any better around a sexy woman, huh? Is that why you don't come over and have a chat - you're scared you slip on your own drool? Come and see me when you get your tongue back, then I might be interested,\"</i> she replies dryly. You can hear the perp's buddies razzing on their compatriot for getting ripped up.");
	output("\n\nYou chuckle at the poor chap leaving with a low head. Looks like Kelly really knows how to put up a show. You feel a tap on your shoulder and turn to face the bartender, handing you your drinks. You take them and make your way back.");
	output("\n\n<i>\"Took your sweet time, huh?\"</i> she grins, then indicates a seat beside hers with a nod of her head. <i>\"Come on, pull up a seat, I don't bite... unless you ask nicely.\"</i> A wicked smile crosses her lips at the thought.");
	output("\n\nYou lay the drink on the table and pull up a chair beside her. As you sit, you note that the scent of booze is slowly being replaced by that sweet honey-scented perfume she seems to wear. Quite fond of it ain’t she?");
	output("\n\n<i>\"Oh, yes, I am.\"</i> she agrees, then smirks. <i>\"It's only fitting, after all; what better scent for a sweet girl with a sweet tooth? Besides, I rather like bees - or couldn't you tell?\"</i> she giggles, indicating her coat. <i>\"And... it's not exactly perfume,\"</i> she adds casually.");
	output("\n\nYou stare at her in confusion.");
	output("\n\n<i>\"It's a long story,\"</i> she says, <i>\"But I suppose I can give you the bullet point version. Basically, there's a species on this planet called the Zil, who have honey for their sexual fluids - pussy juices, milk and cum. I thought that sounded really, really hot. I happen to work at a genetic engineering lab... and we laquines? We make a lot of cum. Getting the picture now?\"</i> she smirks, patting the stretched front of her pants.");
	output("\n\nYou nod in understanding, guessing that makes sense.");
	output("\n\n<i>\"I've never regretted my choice, either,\"</i> she informs you. <i>\"Smelling like honey all the time is a small price to pay... not that I mind, I think it's a nice natural perfume. First up, who wouldn't want nice, sweet honey at the end of a blowjob, rather than salty, bitter cum, huh? Secondly, it means I never need to worry about running out of syrup for breakfast,\"</i> she giggles. <i>\"And last, but certainly not least, all this honey, rich and thick and healthy... mmm, you know how good this stuff is for skin and hair? Why, I'm a walking one-girl beauty salon, with the body to match,\"</i> she preens, holding out her arms and shifting slightly to pose. <i>\"...Matter of fact, I could really, really go for a fix of jizz right now,\"</i> she purrs, caressing her crotch. Then she frowns. <i>\"Oh wait, there's that pesky public indecency law... phooey.\"</i> She pouts.");
	output("\n\nYou just stare at her. She looks really pleased with her choices, good for her.");
	output("\n\nShe takes her glass and gulps down a shot, sighing contentedly. <i>\"Ah, that hits the spot. So, what can I do you for?\"</i> she grins.");
	processTime(3);
	//Display options//
	//9999
}

//Confession
//Requires Kelly has >=50 Attraction//
//Plays instead of Approach//
function kellyConfessesHerAffectionForYouAt():void
{
	clearOutput();
	output("Kelly visibly brightens up when she sees you approaching her. <i>\"[pc.name]! Honey, it's good to see you,\"</i> she jubilantly professes, then looks a little shifty. <i>\"I... ah, I had something I wanted to get off my chest.\"</i>");
	//Mischievous:
	if(pc.isMischievous()) 
	{
		output("\n\nHer boobs? Is she lactating now? You suggest innocently.");
		output("\n\n<i>\"Har-de har no, moron,\"</i> she snaps, scowling at you as she folds her arms over her bustline. <i>\"I’m being serious here. So take a hint, honey,\"</i> she says, throwing you a raspberry.");
		output("\n\nYou chuckle and apologize, but you couldn’t resist. She was set up for that one so nicely it’d be a waste not to use it.");
		output("\n\nShe chuckles right back at you. <i>\"You're right, you're right, and ordinarily I'd have found that hysterical. But, right now, there really is something I wanna talk to you about.\"</i>");
		output("\n\nYou look at her curiously, waiting for her to continue.");
	}
	else
	{
		output("\n\nYou look at her in curiosity. What is it?");
	}
	output("\n\n<i>\"Can we step outside for a little while? Take a walk together? This isn't something I want to really go over around so many prying ears around,\"</i> she sighs.");
	output("\n\nSeeing no reason to refuse, you accept her invitation, prompting her to lead the way.");
	output("\n\nA grateful smile crosses her face as she stands up and leads you towards the door and out into the streets. As she starts leading you along the road, she sighs softly to herself. <i>\"Alright... I wanted to talk about us,\"</i> she informs you. <i>\"See, I've been thinking....\"</i>");
	output("\n\nShe stops talking there, closing her eyes and rubbing her temples with thumb and forefinger, visibly puzzling over how to say whatever it is she wants to say. Opening her eyes, she throws a half-hearted kick at a nearby stone, sending it clattering away, before she takes a deep breath. <i>\"Well, what I'm trying to say is, I've been having some conflicts with my lifestyle, since we started hanging out together,\"</i> she admits.");

	//Kind:
	if(pc.isNice()) {
		output("\n\nConflicts? You’re not causing her any trouble, are you?");
		output("\n\n<i>\"No, certainly not!\"</i> she chuckles. <i>\"Sweet thing like you would never be any trouble,\"</i> she adds, still grinning at the thought. <i>\"No, the problem is this....\"</i>");
	}
	//Else:
	else
	{
		output("\n\nConflicts? How so? Last you recall the two of you had a great time together whenever you met.");
		output("\n\n<i>\"I don't mean that sort of conflict,\"</i> she explains absently. <i>\"How should I put it...?\"</i>");
	}
	output("\n\nShe stops and looks down an alleyway, pointedly not meeting your eyes. <i>\"Before we met, I... wasn't exactly Miss Chastity Mhen'ga, you know? I mightn't have come to the bar looking for it every night, but if I felt like a sweet bit of tail or a nice piece of meat, I certainly didn't hesitate to go and hunt it down. Some might have looked down on me for that, but I didn't care. Still don't, if I'm being honest,\"</i> she notes as an aside. <i>\"But... nowadays, I don't want to do that anymore. Go chasing for one night stands, I mean.\"</i>");
	output("\n\nOh?");
	output("\n\nShe inhales deeply, then turns to face you again, looking you straight in the eye. <i>\"The reason I don't do that is because... well, I don't feel up to it, anymore. It just... doesn't feel like it used to,\"</i> she shrugs helplessly, clearly groping for words she's not sure of. <i>\"But... I go to the bar now more than ever. And do you know why?\"</i> she asks you, tilting her head in a quizzical expression.");
	output("\n\nTo see you? You chance.");
	output("\n\nShe gives an amused, if unladylike, snort at your guess. <i>\"Right answer. When I walk through those doors and sit down, I find myself waiting for you to join me. When I hear the door open, my ears prick up,\"</i> she glances at her permanently down-flowing lop-ears as she says that, <i>\"so to speak. When it's you, my heart starts thumping and I find myself hoping you'll walk over my way. If you don't....\"</i> She looks down, tenderly placing one palm against her chest. <i>\"It hurts, and it's never done that before.\"</i> She shakes her head and looks back at you. <i>\"And if you don't show up, no matter how many cute guys or hot girls there are, I just don't feel in the mood for anything. I just go home and I jerk myself off.\"</i>");
	output("\n\nSo... you’re the reason for all that? And it’s bad because?");
	output("\n\nShe lets out a half-hearted laugh. <i>\"Did I say it was bad?\"</i> she asks, shaking her head. <i>\"I just... look, I don't know if you have any deeper interests in me or if I'm just reading too much into two friends who have great sex. But I... I wanna be something more. I want to 'deepen our relationship', and all that soft-hearted mush you normally hear from those prudes who don't want to put out,\"</i> she admits.");
	output("\n\nShe lets that hang in the wind for a spell, then she laughs softly. <i>\"Sorry, honey. Guess all laquines have their day. But... umm... listen. No pressure, alright? I’m not that good at this confession thing, and I don’t want to jeopardize what we have,\"</i> she smiles softly, patting you on the shoulder. <i>\"I’m not one of those prudish types that’ll refuse a great lay just cuz I got rejected, alright? Even if you don’t feel for me the way I feel for you, I’m not going to hold it against you. But do be a dear and send me some pics every now and then, ok? A girl can only masturbate to the same pics for so long, no?\"</i>");
	output("\n\nWait... when did she take pictures of you?");
	output("\n\n<i>\"Seeeeecret!\"</i> is her grinning reply. She gives you a soft slap on your [pc.butt] giggling away as you return her slap with a smile of your own.");
	output("\n\nThe two of you continue your walk in silence for a few moments, before you hear her clearing her throat. <i>\"So... I was wanting to tell you....\"</i>");
	output("\n\nYou look at her in curiosity.");
	output("\n\nShe shies away for a moment, before smiling back. <i>\"Y’know... I don’t like to hide things from my partners, right?\"</i>");
	output("\n\nYou nod.");
	output("\n\n<i>\"Well, there is one little thing I keep hidden. And if I have any hopes of you considering, ah, a more ‘permanent’ arrangement between us...\"</i> she swallows audibly. <i>\"I think you should know what you’re getting into.\"</i>");
	//Kind:
	if(pc.isNice()) output("\n\nShe doesn’t have to tell you if she doesn’t want to. You know everyone has their secrets.\n\nShe smiles as you say that. <i>\"Thank you, honey, but I want to tell you. I need to tell you this.\"</i>");
	else output("\n\nOkay, that has got your curiosity piqued. What exactly did she keep hidden from you?");
	if(pc.isMischievous()) output("\n\nIs she some sort of intergalactic crime kingpin? Maybe a super heroine? Though you just have to say, and she doesn’t need to take that personally, that <i>gene lab receptionist</i> is such a cliche cover....\n\n<i>\"I'd like to think I'd be smart enough to pick a better cover than <b>that</b>,\"</i> she giggles, poking her tongue out at the \"insult.\" <i>\"No, I'm not a crime-queen or a superheroine. It's something else.\"</i>");
	output("\n\nWith a quiet sigh, she reaches down and gently pats the bulge between her legs. <i>\"You know I'm not exactly Miss Underendowed, right? Well... what would you say if I were to tell you if you haven't seen all I have down here?\"</i> she asks.");
	output("\n\nYou just eye her with curiosity. She’s not giving you much to go on here....");
	output("\n\n<i>\"Okay... I guess I'm too used to keeping shut about this,\"</i> she apologises. <i>\"What I'm saying is that, the twelve inches I'm currently sporting? That's me on reducing medicine. If I don't keep up the dosage, I get bigger. A <b>lot</b> bigger.\"</i>");
	output("\n\nHow big, exactly?");
	output("\n\nShe holds her hands about a foot apart. <i>\"This is me on the drugs,\"</i> she tells you. Then she starts moving her hands back... and back... and back. <i>\"And this is me au naturale. Thirty inches of four-inch-thick, Prime A laquine-cock, in double portions,\"</i> she concludes.");
	output("\n\nThat’s... pretty big, you admit. Can she even move when she’s that big?");
	output("\n\n<i>\"The first year or two after they came in, I couldn't,\"</i> she admits. <i>\"But I got used to them over puberty. I'm a lot slower when I'm horny, though; they're not so bad flaccid, but when I get an erection, it's like trying to run around with twin fishing poles in my shorts,\"</i> she notes.");
	output("\n\nAnd that’s her big secret? She needs to take medicine to keep her cocks <i>small</i>?");
	output("\n\n<i>\"...Yeah, that's it,\"</i> she tells you. <i>\"I just... wanted to be honest with you. So, now that you know... what do you think?\"</i>");
	pc.lust(9+rand(4));
	processTime(12);
	//[Hot][Thankful][Dunno]
	//9999
	addButton(0,"Hot",hugeCockLacquinesAreHottKelly);
	addButton(1,"Thankful",thankfulForKellyConfessions);
	addButton(2,"Dunno",dunnoAboutGiantLaquineCocksKelly);
}

//[=Hot=]
function hugeCockLacquinesAreHottKelly():void
{
	clearOutput();
	output("Personally, you think that’s really hot.");
	output("\n\n<i>\"Umm... what?\"</i> she blinks in surprise.");
	output("\n\nHow come she’s ashamed of that? You were expecting something more pressing, you admit, but heck. While you admit that it can be a bit difficult to carry on normally when she’s that big, growing big has its advantages. In fact, you’d like to see it sometime, maybe even give them a spin.");
	output("\n\nKelly just looks at you for a moment, soaking in your words, but then she beams in delight, giggling. <i>\"Oh, [pc.name], you really are a treasure,\"</i> she titters, smiling like it's her birthday. <i>\"You really think that it's hot? Well... I can't really afford to go keeping myself off the medicine twenty-four seven, it's just too much hassle while I gotta go to work here, but I can tell you this...\"</i> she steps closer, leaning towards your [pc.ear] and stage-whispering, <i>\"There's this not-quite-legal dick-growing mod, called Throbb. It, kind of, counteracts my meds. Bring some of that to my place, and I'll show you what I'm like when I let it <b>all</b> hang out,\"</i> she purrs, kisses your cheek and then steps back.");
	output("\n\nIf that’s the case, maybe you should procure some....");
	processTime(1);
	pc.lust(10);
	endOfLoppeConfession();
}

//[=Thankful=]
function thankfulForKellyConfessions():void
{
	clearOutput();
	output("You thank her for her honesty, but honestly? If this is the worst she can do, then you don’t really have much to worry about. Plus she seems to have the situation under control anyway.");
	output("\n\nKelly lets out a breath she wasn't aware she was holding. <i>\"You really have no idea how good it is to hear that - I've had other laquines run away screaming at the sight of what I was packing,\"</i> she tells you. <i>\"I really do appreciate you taking this so calmly,\"</i> she adds, a sincere look on her face.");
	processTime(1);
	endOfLoppeConfession();
}

//[=Dunno=]
function dunnoAboutGiantLaquineCocksKelly():void
{
	clearOutput();
	output("You’re not sure what to think of it. Personally you expected something more pressing, not that this revelation isn’t important, but... well... you need to think about that.");
	output("\n\n<i>\"...Well, you haven't run for the hills yet, so I'll take that as a win,\"</i> she comments.");
	processTime(1);
	endOfLoppeConfession();
}

//All options join here.
function endOfLoppeConfession():void
{
	output("\n\nThe rest of the walk goes by in silence, tho Kelly does shoot you some seductive gestures.");
	output("\n\n<i>\"So... thanks for the company this evening. But....\"</i> she trails off with a mischievous smile.");
	output("\n\nBut?");
	output("\n\n<i>\"You did come to see me at the bar, and I can’t help but think you were expecting something when you did,\"</i> she smirks.");
	output("\n\nThat's when she stops, and you realise you’re standing just outside her house.");
	output("\n\nShe raises her arms above her head in a full-body stretch, breasts jiggling nicely as she does so. <i>\"So, what do you say, honey? Care to come in for a nice hot coffee? My own special blend,\"</i> she promises, eye closing in a teasing wink.");
	processTime(10);
	//[Yes][No]
	clearMenu();
	addButton(0,"Yes",sureGiveMeCumCoffeeKelly);
	addButton(1,"No",noHotCofeeCheatsPleaseKelly);
}

//[=Yes=]
function sureGiveMeCumCoffeeKelly():void
{
	clearOutput();
	output("<i>\"Two hot, steamy cups coming right up,\"</i> she laughs, turning on her heel to lead the way through the door, ass unabashedly shaking from side to side as she goes. <i>\"Come on in, honey, and I'll set you up a treat,\"</i> she calls over her shoulder to you.");
	output("\n\nYou eagerly follow after her bobbing tail. Once inside, though, she actually does head straight for the kitchen, where she flicks on a coffee machine on the counter, then bustles to fetch two cups. <i>\"Now...\"</i> she turns to look at you bouncing over. <i>\"While the machine works, I’m sure we can find a way to pass the time?\"</i>");
	processTime(1);
	pc.lust(33);
	//(Display Sex Options)
	//9999
}

//[=No=]
function noHotCofeeCheatsPleaseKelly():void
{
	clearOutput();
	output("<i>\"No?\"</i> she repeats, brow furrowed. <i>\"Come on, after all I just told you, you’re going to make me wank tonight?\"</i> She slumps her shoulders in a defeated sigh. <i>\"Ok, I guess I can’t force you. Just promise me you’ll come see me soon, ok? Toys just don’t feel as good as the real thing, and my job can be pretty stressful. So it’s your responsibility to help me get off,\"</i> she says, showing you her tongue.");
	output("\n\n<i>\"Can I at least get a goodbye kiss?\"</i>");
	output("\n\nThat, you can do.");

	output("\n\nShe smiles and opens her arms, crossing the distance between the two of you and throwing her arms around you. One leg lifts itself up behind her as she squeezes your waist, eyes closing as her lips are drawn to yours like iron filings to a magnet. Hungrily she kisses you, passion bleeding through the ferocity of her lips on yours, her limbs holding her against you. You can feel her nipples perking through her top, grinding into your [pc.skinFurScales], her cocks hard against your [pc.leg]. Something warm and wet prods insistently at your [pc.lips], her tongue demanding entrance, but she backs off before forcing her way in, instead letting you go and stepping back with a pant of frustrated lust. <i>\"Better stop, or I mightn't stop at just a kiss,\"</i> she mumbles - ostensibly to herself, but you certainly don't have any problems hearing her. She opens her eyes and smiles at you. <i>\"Don't be a stranger, honey... now, I got to go and take care of these little problems.\"</i> She indicates her aroused state with a hand, then, with a last flirty wink, turns and sashays into her home.");
	pc.lust(15);
	processTime(4);
	//9999 Silently move PC to a space outside her "house"
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Talk
function talkToKellyAtBar():void
{
	clearOutput();
	//if Not Sexed:
	if(flags["KELLY_SEXED"] == undefined)
	{
		output("<i>\"Talk?\"</i> she says, pouting in dismay. <i>\"What, all of this isn't enough for you? Come on, I'm a prime-grade sex machine! ...Oh, very well, if you really want to just talk, I'll humour you. But trust me, a night with me is something you'll <b>never</b> forget,\"</i> she winks lewdly for emphasis.");
	}
	else //If Sexed:
	{
		output("<i>\"Oooh; great in bed <b>and</b> actually interested in me to boot? Talk about hitting the jackpot!\"</i> she laughs, making a cheering motion with her arm. <i>\"I’m listening honey,\"</i> she informs you, and blows you a kiss.");
	}
	//Regardless of Talk option chosen, increase Kelly's Attraction meter by +5//
	kellyAttraction(5);
	//Display Options//
	//9999
}

//About Her
function talkToKelly():void
{
	clearOutput();
	output("\"<i>You'd like to know a little about me?</i>\" Kelly replies, momentarily puzzled before regaining her good cheer. \"<i>Well, sure, I can share a few things. My name is Louise Epona - yeah, I know, it sounds kind of odd that I go by Kelly, but I always felt more like a Kelly than a Louise,</i>\" she giggles and pokes her tongue out - it's very long and vibrant yellow, you notice - at how silly her real name is. \"<i>Parents, what can you do about them, huh?</i>\" she says, shrugging her shoulders. <i>\"But seriously, call me Louise and we’re going to have a problem.\"</i> She winks at you. Despite her mocking tone, you do detect a hint of threat....");
	output("\n\n\"<i>Now, I know what you're probably thinking - I'm a modder as well as a staff member, right? This gorgeous furry coat and these sweet ears and all the rest of it, it all came out of a bio-sculptor's toolkit, yeah?</i>\" she smirks at you and then shakes her head, floppy ears swishing through the air from the motions. \"<i>Well, you'd be partly right. I do have a couple of mods in my system, and I'm very happy with them. However, the most obvious things about me? All natural, I assure you. See, I'm not one of those 'furries' that you humans have, who mod themselves to look more animal-like - though we do have one of those here in Esbeth; you met Penny yet? She's our chief of security, really nice girl, sure you'd like her,</i>\" she interjects into her own conversation. \"<i>Now, where was I? Ah, yes, I'm not a human at all. I'm a laquine.</i>\"");
	output("\n\nJust as suddenly as she began, she stops herself, smiling at you and wagging a finger. \"<i>And I think that's enough about me for now.\"</i> She rests her chin in her hands, giving you a coy look. <i>\"If you wanna know more, you’re going to have to pry the information.... From. My. Lips.\"</i> Her eyes hood themselves in a seductive smoulder, her lips pouting invitingly.");
	processTime(3);
	//[KissHer][DoNothing]
	clearMenu();

}

//[=KissHer=]
function kissKellyForSecrets():void
{
	clearOutput();
	output("You boldly lean forward in an attempt to kiss her.");
	processTime(2);
	//if Affection < 25:
	if(kellyAttraction() < 25)
	{
		output("\n\nQuicker than you'd thought, she pulls her head back, a soft giggle escaping her. <i>\"Uh uh, that's a no-no there, [pc.name]. You haven't earned that right just yet - I'm not the kind of girl to just kiss anybody,\"</i> she chides you gently, a mocking grin on her lips as she waves her finger at you in reproachment.");
		output("\n\nYou are a bit disappointed by this turn of events, but you understand. You apologize.");
		output("\n\n<i>\"Now, don't get me wrong, I like a brave " + pc.mf("guy","girl") + " like yourself, but you just don't have the right yet,\" she says with a wry smirk. \"But go on, ask me another question, I promise that this one I'll answer,\" she insists, winking at you slyly.");
		//Display Meadhall Talk options, minus About Her//
		//9999
	}
	else
	{
		output("\n\nShe closes her eyes, a soft humming noise escaping her as your lips capture her own. She wastes no time in returning your kiss, passionately pressing back against you, her long tongue worming through into your mouth to trace your own [pc.tongue] in a feather-light touch. She breaks the kiss with a satisfied smile and huge sigh, batting her eyes dreamily at you.");
		output("\n\n<i>\"Mmm... you're good. I do so love a " + pc.mf("man","woman") + " who knows when to seize the day,\"</i> she purrs, one hand starting to massage a tit, the other fondling her bulging crotch. <i>\"Nothing more enticing than a partner that knows when to take charge... Alright, you've earned a little more about yours truly, I guess. I have two parents and four little sisters, being the eldest of five,\"</i> she smirks.");
		output("\n\nSo she’s the eldest? Go figure, you could swear she was actually the youngest. You tease her.");
		output("\n\n<i>\"Why? Because of my natural youthful beauty?\"</i> she coos in delight, batting her eyes at you.");
		//[Tease][Flatter]
		//9999
	}
}

//[=Tease=]
function teaseKellyPostKiss():void
{
	clearOutput();
	output("No, because most of the time she doesn’t seem very mature.");
	output("\n\nIf you were expecting that to upset her, though, you'd be quite disappointed. She laughs in delight. <i>\"You know what they say; growing old is mandatory, growing up is optional,\"</i> she says, and salutes you with her glass.");
	//9999
}
//[=Flatter=]
function flatterKellyPostKiss():void
{
	clearOutput();
	output("Yes, actually. She just seems so energetic... hmm... now you wonder how old she really is?");
	output("\n\n<i>\"Didn't they ever teach you it's not polite to ask a girl her age?\"</i> she giggles, waving a finger at you as if you were a misbehaving child.");
	//[Tease][Playful][WaitOut]
	clearMenu();
	addButton(0,"Tease",teaseKellyAfterFlattering,undefined,"Tease","Tease her a bit about her scolding. Maybe she'll find a nice way to teach you to remember....");
	addButton(1,"Playful",playfulKellyAfterFlattering,undefined,"Playful","Play along with her scolding. After all, she's not your mother.")
	addButton(2,"WaitOut",waitKellyOutAfterFlattering,undefined,"WaitOut","Just let her do the talking.");
}

//[=Tease=]
function teaseKellyAfterFlattering():void
{
	clearOutput();
	output("Maybe, you don’t recall. Maybe she could teach you again? Make sure you won’t forget this time?");
	output("\n\nShe chuckles to herself. <i>\"Ah, [pc.name], what will I ever do with you?\"</i>");
	clearMenu();
	addButton(0,"Next",waitKellyOutAfterFlattering);
}
//[=Playful=]
function playfulKellyAfterFlattering():void
{
	clearOutput();
	output("Rolling your eyes in mock exasperation you say, <i>\"Yes, mommy Kelly.\"</i>");
	output("\n\n<i>\"That's a good " + pc.mf("boy","girl") + ",\"</i> she replies in a soothing, motherly tone, grinning at your dirty look.");
	clearMenu();
	addButton(0,"Next",waitKellyOutAfterFlattering);
}

//[=WaitOut=] //No text, just proceed.
function waitKellyOutAfterFlattering():void
{
	clearOutput();
	output("<i>\"If you really must know, I'm 24 standard years old,\"</i> she tells you casually, and takes a sip from her cup. Once she's finished wetting her throat, she continues, <i>\"I grew up in a spaceport, so, growing up, I saw a lot of aliens. I don't know, maybe that's why I always wanted to see what was out there... or maybe I just wanted to share myself with the universe,\"</i> she grins arching her shoulders in a way that makes her bosom heave quite nicely.");
	output("\n\n<i>\"So, about three years ago, I took my savings and I bought myself a little one-girl starrider and blasted off, just sort of bumming my way across the galaxy. It was just incredible... right up until the day that the stupid thing broke down on me, a couple of systems over,</i>\" she adds, idly thumbing in the direction of galactic south.");
	output("\n\nThat sucks, you note. But at least she seems to be doing well for herself.");
	output("\n\n<i>\"From where I started out when that happened, sure, this is up,\"</i> she agrees with a nod of her head. <i>\"You see, luckily, I was near a space-port, so I was able to crawl into civilisation. I ended up selling my ship to a spare parts merchant, but that didn't leave me with enough to do... well, anything. I couldn't buy a new ship, I couldn't purchase a ride back home, I certainly couldn't stay where I was. I managed to basically hitchhike my way from the station to here - unfortunately for me, the captain who took me here had certain ulterior motivations and, when I wouldn't put out for her, she abandoned me here.</i>\" She looks angry, spitting a curse on the individual in question. <i>\"I know I'm drop-dead sexy and all, but to strand me because I won't fuck you?! What kind of person does that?\"</i> she demands angrily.");
	output("\n\nYou keep silent, allowing her to cool off with another gulp from her mug before she continues. <i>\"So, there I was, stuck here with not too much more than what I had on my back and in my carry bags. I certainly didn't have a lot of credits left, but fortunately, flats in a frontier town come cheap. So I started looking for a job; I figured there had to be someone here who could and would hire me. And of course, I was right,\"</i> she smirks, buffing her nails on her breast's fur. <i>\"Xenogen was looking for a receptionist, and I was the first one to get my foot in the door. And so I've been here ever since; modding myself with spare savings, and building up my credits until the day comes I can buy a new ship and take off on my own again.\"</i> She sighs wistfully at the thought.");
	output("\n\nShe went through a lot, that’s for sure. You tap her arm comfortingly and tell her that once you get to the bottom, only way left is up. Plus she doesn’t seem to be type to let the world kick her about.");
	output("\n\n<i>\"You got that right, buster; when life kicks me, I kick it right back!\"</i> she cheers. Then she looks at you and smiles. <i>\"But it's nice to hear some support, now and then, so... thanks. Well, enough about where I came from; was there anything else you wanted?\"</i>");
	processTime(7);
	//Display Meadhall Kelly Options//
	//9999
}

//Mods
function talkToKellyAboutHerMods():void
{
	clearOutput();
	output("<i>\"Modifications, huh? You sure you wouldn't rather a little hand's on analysis, hmm? Wouldn't that be a much more fun way to find out?\"</i> she winks suggestively at you.");
	//[Yes] [No]
	clearMenu();
	addButton(0,"Yes",yesHandsOnModAnalysisIsTheWayToGoKelly);
	addButton(0,"No",noJackingKellyOffToTestMods);
}

//[=Yes=]
function yesHandsOnModAnalysisIsTheWayToGoKelly():void
{
	clearOutput();
	//If Attraction <= 25:
	if(kellyAttraction() <= 25)
	{
		output("Kelly just giggles and shakes a finger at you in a chastising fashion. <i>\"Sorry, honey; I'm not <b>that</b> easy... but that doesn’t mean I’m <b>that</b> difficult, either. Maybe when we get to know each other better....\"</i>");
		output("\n\nWell, why doesn’t she tell you about it then?");
		output("\n\n<i>\"Okay then, if you really wanna know,\"</i> she replies in a perky tone.");
		//Link to explanation from No choice//
		//No next button needed!
		kellyModsEpilogue();
	}
	//Else:
	else
	{
		output("At your answer, her eyes light up. <i>\"Good choice, honey; I much prefer a hands on sort of demonstration,\"</i> she smirks, pushing herself up from her seat. <i>\"Come on; I'd rather do this sort of testing in my own 'secret lab',\"</i> she informs you, waiting for you to rise as well.");
		output("\n\nYou rise yourself and follow after her.");
		output("\n\nSince Esbeth is a young frontier town, Kelly's current choice of home, a cheap little rental unit, doesn't take too long for you to reach. She opens the door quickly and leads the way inside, closing the door after you've followed.");
		output("\n\nKelly's home may be small and cheap, but she's done it up quite nicely. A pair of handy shelves groan on the weight of myriad books and magazines - ranging in topics from fashion and cooking magazines to scientific newsletters and textbooks on engineering and genetics. A number of bee and flower-themed ornaments are scattered around, pride of place being given to several incense holders that fill the room with a sweet, floral scent. Her bed is the most ornate of all, being structured to actually look like a huge flower.");
		output("\n\nKelly grins as she enthusiastically seats herself atop her bed, bouncing as she settles, kicking her legs in glee. <i>\"So.. you want that hands on demonstration, honey? Well...\"</i> she crooks a finger in invitation, a mischievous light in her eyes.");
		output("\n\nWalking up to her, you gently set your hands on her shoulders, caressing her back as you make your way down.");
		output("\n\nShe closes her eyes and lets out a purring noise of approval, leaning into your touch.");

		output("\n\nRemoving her bikini top is a simple affair, and in no time the offending fabric is lying discarded on the floor. You take a moment to admire her pillowy breasts, hefting each orb in your hands and letting them jiggle enticingly when you let go. A soft giggle escapes her and she opens her eyes so she can look at yours while you \"work.\" You massage each in turn, feeling each orb yield in your hands. With a mischievous grin, you tweak her nipples, enjoying the feeling of the erect nubs between your fingers.");
		output("\n\nA moan escapes Kelly's lips, her shorts starting to visibly strain to contain her twin shafts as they attempt to force their way from the tight fabric confines. Instinctively a hand of hers moves towards her crotch, clearly intending to release some of the pressure.");
		output("\n\nYou notice her wandering hand and quickly give it a playful slap. <i>\"Bad girl, it’s my time now,\"</i> you chastise her playfully. She withdraws her hand quickly and shakes it; a childish \"owie\" escapes her as she pouts at your slap. Still, she remains seated and doesn't make any move to deny your command.");
		output("\n\nYou gently bop her on the nose with a finger and tell her that if she’s a good girl and shows she’s sorry, you’ll consider helping her relieve some pressure. Can she promise to be good now? You bop her on the nose once more.");
		output("\n\nHer hand snaps up and catches hold of your wrist - not hurting you, just holding you there. She smiles and begins to nuzzle your palm, gently rubbing her nose and lips along the underside of your fingers. <i>\"Wouldn't you rather I promise to be bad?\"</i> she smirks, a knowing light in her eyes.");
		output("\n\nDelicately her lips part and she draws your index finger inside, eyes half-closing in a rapturous expression as she starts to suckle upon it, tongue twining sinuously around your digit and caressing it with inhuman dexterity. A lustful moan works its way up her throat, even as she continues to suck your finger as if it were a cock.");
		output("\n\nYou watch her work your finger enraptured, wondering how it’d feel to have her do that on a real dick. Preferably yours");
		if(!pc.hasCock()) output(", if you had one");
		output(". Yes, you’d make sure to reward her like the naughty girl she is.... You feel yourself growing flush with arousal at your thoughts.");
		output("\n\nHer tongue wrings your finger one last time and then uncurls itself, her lips unsealing and setting your finger free with a wet pop, momentarily linked by a glistening strand before she laps it up. She opens her eyes and looks you squarely, a mischievous smirk on her lips. <i>\"Well, honey? Have I been a good girl?\"</i> she asks you, her voice a husky, lustful exhalation as she bats her eyes at you.");
		output("\n\nYou believe she did show she can be good, so you’ll let her <i>spring free</i> this time. You move a hand to her shorts and rub her cocks through the fabric. She moans, screwing her eyes closed in ecstasy as her dicks thrust themselves brutally against the fabric, which is growing increasingly damp and sticky, a sweet smell filling the air. Larger and harder the bulge swells, until her poor shorts button can't take it and pops off, flying away to the floor. \"Oopsie,\" she giggles.");
		output("\n\nYou waste no time in pulling down her zipper to let her shafts pop from their fabric prison, lest she pop the zipper too!");
			
		output("\n\nShe lets out a moan of release as the two horse-like pricks spring forward, each dripping a honey-colored goo from their tips. <i>\"Mmm, that feels so much better,\"</i> she says, leaning backwards until she is laying down on the bed, arms and legs spread, cocks carelessly thrusting up towards the ceiling.");

		output("\n\nYou stop for a moment to admire her twin spires, juicy and throbbing, dribbling honey. Before you get to that, though, you decide to finish removing her shorts. You push her legs up and pull her shorts off, tossing them away to join her bikini top.");
		output("\n\nShe smiles up at you and spreads her legs so that you have a full, unobstructed view of everything that lays between them. <i>\"Enjoying the view?\"</i> she asks mischievously, the look on her face making it clear she assumes the answer to be \"yes.\"");
		output("\n\nYou don’t grace her with an answer, instead you step forward and grab one of her legs. You caress her thighs, slowly making your way towards her dainty feet, checking her muscles along the way. An appreciative groan escapes her throat, and she flexes her legs, wriggling her feet at the sensation. You grab her foot, massaging it as you as you check each of her padded toes.");

		output("\n\n<i>\"Mmm... that feels nice. Can't remember the last time I got a footrub,\"</i> she mumbles appreciatively, trying to stare down the length of her body and watch you work, despite her impressive cleavage and twin-shafts being in the way.");

		output("\n\nYou smile mischievously yourself and press your fingers against her most sensitive spots, tickling her with gusto.");

		output("\n\nShe squeals in glee and wriggles frantically, kicking out in an effort to shake off your grip, but not hard enough to actually succeed.");

		output("\n\nYou stop with a grin, looks like her reflexes are in order. <i>\"Wait until I test your reflexes,\"</i> she promises you, a wicked grin on her face as she contemplates her payback.");

		output("\n\nNow back to business. You lift her her legs over her shoulders, bending her over awkwardly. Thankfully she does not seem to complain, watching what you’re doing with amusement. You shuffle onto the bed, overlooking her amused expression over her tight ass, damp pussy, churning balls and throbbing shafts.");

		output("\n\n<i>\"What's your poison?\"</i> she chuckles. <i>\"Quite spoiled for choice, aren't I?\"</i>");

		output("\n\nYou give her bunny tail a short yank, not strong enough to actually cause pain, but strong enough to make her gasp and stop in her tracks. She talks too much, you note. <i>\"Now be a good girl and hold this position for me.\"</i>");

		output("\n\nShe pouts at the tail-pulling, but nods. <i>\"Alright, I'll be good,\"</i> she promises you. Looping her arms behind her knees in an effort to hold herself for you, she goes quiet, an open invitation for you to proceed.");

		output("\n\nYou start off by spreading her cheeks apart, stretching her little ring as you press a thumb against it, testing for elasticity.");

		output("\n\nShe moans as you work your way inside of her; though it stretches smooth and easily around your intruding digit, enveloping you in hot, wet, almost pussy-like flesh, it clamps down on you with eager tightness. Looks like she has a well-trained asshole, one that will stretch whilst still being tight.");

		output("\n\nYou twist your thumb, testing exactly how malleable she really is, pushing to stretch her backdoor more and more.");

		output("\n\nShe gasps and groans, dicks throbbing as you stimulate her, thick rivulets of honey-jism bubbling from their flat heads and running in steady rivulets onto the fur of her belly and spattering the underside of her breasts.");

		output("\n\nYou force her to spread around your digits as you probe her depths in one fell swoop, quickly finding her prostrate.");

		output("\n\n<i>\"Oh! D-don't do that! I-I'm gonna...\"</i> she gasps and whimpers, biting her lip as fresh rivulets of honey pour from her cocks, her drooling netherlips slick with her arousal, visibly fighting against a miniature orgasm.");

		output("\n\nYou remove your fingers with a smile, slapping her upturned butt teasingly.");

		output("\n\nShe lets out a piteous mewl, but whether at your slap or because you didn't finish her off, who can say? But the light in her eyes as she watches you makes it clear she's enjoying this.");

		output("\n\nNot done with your inspection just yet, you set your eyes onto the next target. Before you even lay a finger on her glistening cunt, you know you just have to have a taste. You bend over, extending your [pc.tongue] and lapping it, all the way to her erect clitty, which you kiss. Hmm... sweet.");

		output("\n\nAn amused giggle escapes her lips as you lean in, giving way to a yelp of pleasure as your [pc.tongue] first makes contact with her sensitive flesh.");

		output("\n\nYou continue to lap her, drawing short gasps and moans with each lick. You can feel her trembling in excitement, for a moment you spot her arms going slack at the pleasure, but she quickly recovers. Satisfied for the moment, you move your fingers to spread her open.");

		output("\n\nShe whimpers and inhales sharply as her sensitive netherlips are drawn apart, instinctively trying to clench them back together despite your probing fingers. Her hands clutch onto her thighs as she holds on for all she's worth.");

		output("\n\nHer folds are bright pink and smell strongly of both female and honey. An unusual combination, but a delightful one. You insert your index, testing for elasticity, much like you did her butt. To your surprise there doesn’t seem to be a single drop of resistance, and you find yourself able to add finger upon finger with ease. It’s very pleasant to see she can remain this tight, when she’s built to take so much.");

		output("\n\n<i>\"Mmm... naturally,\"</i> she groans in pleasure as your fingers stretch her out. <i>\"Only thing worse than being too small is being too loose. That's no fun for anyone involved.\"</i>");

		output("\n\nYou can see the perks of having her body built like that... does that mean she’s a size queen too? You tease her.");

		output("\n\n<i>\"A size queen wouldn't care about staying tight,\"</i> she says, trying to adopt an expression of wounded pride, but too busy enjoying you fingering her brains out to hold it.");

		processTime(12);
		//if PC’s cock is really big:
		if(pc.hasCock())
		{
			if(pc.biggestCockVolume() >= 500) 
			{
				output("\n\nThat’s too bad, you were hoping she’d like to be stretched to her limits. And, of course, you’d be the one doing the stretching.\n\nDespite everything you are doing to her, she manages to chuckle. <i>\"Did I say I didn't like testing my limits? But I'm not sure that you'd get to do that for me,\"</i> she replies.");
				clearMenu();
				//[Confident][LeaveIt]
				addButton(0,"Confident",confidentLoppeWillLetYouPoundHerShitTillShesLoose);
				//[=LeaveIt=] (No text, straight to next paragraph.)
				addButton(1,"Leave It",noJackingKellyOffToTestMods);
			}
			else
			{
				output("\n\nThat’s good, you like the fact that she keeps herself nice and tight for you.");
				output("\n\nShe laughs at that, somewhat unsteadily from the manipulation of her cunt. <i>\"I think you're almost as cocky as I am,\"</i> she tells you. <i>\"I just like to be tight, it's not necessarily for your sake...\"</i>");
				clearMenu();
				//[Confident][LeaveIt]
				addButton(0,"Confident",beConfidentAboutNailingKellySheDoOOOOOO);
				//[=LeaveIt=] (No text, straight to next paragraph.)
				addButton(1,"Leave It",noJackingKellyOffToTestMods);
			}
		}
	}
}

//[=Confident=]
function confidentLoppeWillLetYouPoundHerShitTillShesLoose():void
{
	clearOutput();
	output("Of course you would. She’s a smart girl, she knew from the very beginning what she was getting into when you first spent the night. She said you’d be hooked after one night with her, but you think it was the other way around. She’s the one that got hooked, and after you’ve stretched her out, she won’t be able to fit anyone but you... not that she’d want to anyway.");

	output("\n\n<i>\"Don't flatter yourself,\"</i> she giggles, pitch fluctuating as your fingers continue their dance. <i>\"You're good, but you're not that good... at least, not yet, anyway. Maybe, with a little practice, you might be speaking the truth...\"</i> she trails off, a mischievous smirk on her lips, the tilt of her eyebrow a direct challenge to you.");

	output("\n\nIs that so? In that case she doesn’t mind you stopping now?");

	output("\n\n<i>\"Of course I'd mind - I'm so close!\"</i> she says, whimpering as her whole body clenches, relaxing as she proves she's not ready to cum just yet.");

	output("\n\nDidn’t she say you just weren’t good enough? What’s the point of continuing?");

	output("\n\nShe grits her teeth and growls in frustration. <i>\"Alright, fine! I was lying! Just don't stop, please!\"</i> she begs you, unable to writhe in her current position, but surely wishing she could.");

	output("\n\nNow that’s what you like to hear....");
	processTime(5);
	clearMenu();
	addButton(0,"Next",getKellyOff,true);
}

//[=Confident=]
function beConfidentAboutNailingKellySheDoOOOOOO():void
{
	clearOutput();
	output("But of course it is. She’s a smart girl, she knew from the very beginning what she was getting into when you first spent the night. She said you’d be hooked after one night with her, but you think it was the other way around. She’s the one that got hooked. She needs to keep herself tight so she can enjoy what you have to offer to the fullest.");


	output("\n\n<i>\"Don't flatter yourself,\"</i> she giggles, pitch fluctuating as your fingers continue their dance. <i>\"You're good, but you're not that good... at least, not yet, anyway. Maybe, with a little practice, you might be speaking the truth...\"</i> she trails off, a mischievous smirk on her lips, the tilt of her eyebrow a direct challenge to you.");

	output("\n\nIs that so? In that case she doesn’t mind you stopping now?");

	output("\n\n<i>\"Of course I'd mind - I'm so close!\"</i> she says, whimpering as her whole body clenches, relaxing as she proves she's not ready to cum just yet.");

	output("\n\nDidn’t she say you just weren’t good enough? What’s the point of continuing?");

	output("\n\nShe grits her teeth and growls in frustration. <i>\"Alright, fine! I was lying! Just don't stop, please!\"</i> she begs you, unable to writhe in her current position, but surely wishing she could.");

	output("\n\nNow that’s what you like to hear....");
	processTime(5);
	clearMenu();
	addButton(0,"Next",getKellyOff,true);
}

function getKellyOff(newScreen:Boolean = false):void
{
	if(newScreen) clearOutput();
	else output("\n\n");
	output("Focusing back on her velvety interior; you pump your fingers erratically, stimulating her walls and quickly building her up for another orgasm.");

	output("\n\nShe pants and gasps, trying to clench at your fingers with her cunt; if it weren't for her awkward position, you know she'd be humping back against you. <i>\"Oh, gods, so good,\"</i> she grunts, eyes screwed shut as she moans like a whore in heat. <i>\"I... I don't think I can last much longer,\"</i> she whimpers.");

	output("\n\nThose were the magic words, and you pluck your honey-slick fingers from her pussy, eliciting an indignant squeal from the laquine. <i>\"What gives?!\"</i> she demands.");

	output("\n\nWith a malicious grin, you reach for her throbbing shafts, giving each a yank and pointing them at her face.");

	output("\n\n<i>\"Oh, yes... give it to me,\"</i> she pleads in rapturous delight, seeing exactly what you have in mind and loving the idea. Her juices are flowing thick and fast, her pussy squeezing tight in anticipation of a cock that isn't there, even her asshole is clenching down in pursuit of the orgasm to come. Finally, with an ecstatic moan of relief, she cums, honey gushing from her dicks and cunt with equal fervor.");

	output("\n\nYou pump each in turn, effectively milking her honey out as she drenches herself with her honey. Her arms finally give, but you quickly adjust yourself to hold her in position.");

	output("\n\nNeglected pussy pouring honey down her ass, running through her crack to mat her tail, her twin shafts bulge in unison as thick load after load of honey forces its way from her swollen quad. Great globs spatter over her face and her tits, smearing thickly over her features, eyes closed and mouth open to try and catch it, but not trying particularly hard. Any that enters her mouth is more of a fluke than deliberate, and you have a feeling that's intentional. It plasters her cheeks and soaks her ears, strings drooling wetly onto her belly after each shot is fired, and still more keeps coming. Only when she is totally drenched and laying in a thick pool of sweet, sticky orange-yellow semen do her cocks finally go slack, her whole body unclenching with a huge sigh of release.");

	output("\n\nYou release her and let her drop on her side, completely worn out.");

	output("\n\nShe heaves lungfuls of air, a blissed-out expression on her face. <i>\"Damn... that's the hardest I ever came without directly involving a cock and a hole,\"</i> she comments once she's caught her breath.");

	output("\n\nYou watch her curiously, and on a whim reach between her legs to fondle her balls. Hmm... these don’t feel empty yet, you suggest.");

	output("\n\n<i>\"They won't get any emptier if you keep fondling them, either,\"</i> she remarks dryly, an amused smirk on her face, even though her eyes are still closed. She shifts a little, tail twitching atop her rear, but doesn't make any move to stop you either. <i>\"So, think you figured out what all my mods are?\"</i> she asks.");

	output("\n\nFor the moment, yes. You nod in agreement, even as you continue fondling her balls, rolling her " + chars["KELLY"].ballsDescript() + " around.");

	output("\n\nShe groans luxuriantly as you continue to play with her. <i>\"Feels good... somebody still frisky, or is that only me?\"</i> she asks, opening her eyes and giving you a wicked look.");

	output("\n\nYou note that your inspection wasn’t quite done yet. You completely forgot to check her balls out. You grip her balls a couple times, feeling the liquid weight contained within beginning to build up again.");

	output("\n\nA soft gasp escapes her throat and she closes her eyes again, letting out a purring noise as her shafts start to rise again. <i>\"Mmm, I like where this is going,\"</i> she giggles. Her dicks continue to grow harder again, slowly rising to their foot-long lengths again, her balls almost palpably swelling in your grip as they work to replenish themselves. She groans luxuriantly as your fingers massage the bulging orbs, unthinkingly humping the bedsheets with her twin shafts.");

	output("\n\nShe looks ready, you declare. Then spin her around, legs spread, so you’re kneeling between them. With a teasing pat to her quad-nads you tell her that you’re going to begin the extraction process.");

	output("\n\nShe stares up at you with an expression of equal parts lust and amusement. <i>\"Extract away, honey,\"</i> she informs you.");

	output("\n\nYou grip each of her shafts, slick with honeyed pre, and begin pumping. She closes her eyes and whimpers softly at the feel of your fingers on her sensitive shafts. You alternate your strokes, sometimes stopping at her flared tips to coax more honey out of them. She groans and wriggles under your ministrations, bucking her hips against your touches.");

	//If prehensile tail: //Assuming this also includes cock-tails
	if(pc.hasTailFlag(GLOBAL.PREHENSILE) && pc.hasTailFlag(GLOBAL.LONG))
	{
		output("\n\nYou adjust your [pc.tails], tickling her clit with the tip. She wriggles at the ticklish sensation, letting out a soft moan of pleasure. Without warning you plunge into her depths, stretching her around you as you invade with a wet schluk.");
		output("\n\nA cry spills from her throat as your tail plunges into her depths, the hot, wet flesh stretching around your ");
		if(!pc.hasCockTail()) output("make-shift ");
		output("cock and eagerly gulping you down as far as you dare to enter.");
		//if more than one tail:
		if(pc.tailCount > 1)
		{
			output("\n\nNot satisfied with just stuffing her pussy, you align your second [pc.tail] with tight ass.");
			output("\n\n<i>\"Wha? Oh, you clever " + pc.mf("boy","girl") + "...\"</i> she remarks with glee, grinning eagerly up at you as she awaits her double-stuffing.");
			output("\n\nStimulating her pussy with your first tail, you drain a stream of honey-juice from her stretched pussy. The small rivulet, aided by gravity, slides across her butt cleavage. You intercept it with your [pc.tail], lathering your tip on the juices and finally press your tail tip against her sphincter, applying pressure and entering her.");

			output("\n\nAn eager moan spills from her and her ass swallows your tail with rabid hunger; she's no stranger to anal penetration, it seems.");

			output("\n\nOnce the first few inches are in, you stop and grinning mischievously you ask, <i>\"Comfy?\"</i>");

			output("\n\nShe opens her eyes to look at you. <i>\"What do you - <b>THINK!?</b>\"</i> she squeals the last word as your tail suddenly rams itself into her greedy ass, gulped down by her tailhole as far as you're willing to put it. She moans and shifts slightly, trying to get comfortable again, clamping down on you almost despite herself. <i>\"A little warning would have been nice, [pc.name],\"</i> she grumbles indignantly, wincing a little.");
			output("\n\nYou chuckle at her reaction. She’s talking like she didn’t like to be surprised.");

			output("\n\n<i>\"Maybe I ought to show you a surprise or two of my own next time,\"</i> she says, still pouting.");
		}
		output("\n\nYou assault her vulnerable hole");
		if(pc.tailCount > 1) output("s");
		output(" unrestrained, eager to see her writhe.");
		//if cunt-tails:
		if(pc.hasCuntTail())
		{
			output("\n\n<i>\"Ohhh, wha? What are you?\"</i> she moans as your perverse tails begin to slurp at her interior. <i>\"Gods, how are you doing that?\"</i> she asks, shaking her head in amazement.");
			output("\n\nYou just wink at her, not bothering to reply.");
			output("\n\n<i>\"Maybe we should try using those on my dick");
			if(pc.tailCount > 1) output("s");
			output(" next time?\"</i> she suggests, an eager glint in her eyes. Then she moans again. <i>\"Not that this isn't fun too,\"</i> she admits.");
		}
		else 
		{
			output("\n\n<i>\"Mmm... that feels good,\"</i> she groans luxuriantly, arching her back and clenching down against your [pc.tail]. If she cares at all that ");
			if(pc.tailCount == 1) output("it's");
			else output("they're");
			output(" not ");
			if(pc.tailCOunt == 1) output("a real dick");
			else output("real dicks");
			output(", she certainly doesn't show it.");
		}
	}

	output("\n\nYou speed up your pace, filling the room with slick sounds of flesh slapping on flesh as you masturbate her furiously.");

	output("\n\nEyes screwed shut the laquine moans like a whore, hot shafts pulsing in your grip, sending twin streamers of thick, sweet semen washing down her lengths and bathing your fingers, aiding your strokes and caresses as they lubricate her dicks. Her ");
	if(pc.hasTailFlag(GLOBAL.PREHENSILE) && pc.hasTailFlag(GLOBAL.LONG)) output("tail-stuffed");
	else output("neglected");
	output(" pussy drools a slickness of its own, her breasts bouncing pleasantly with each passionate inhalation and exhalation she makes. She grunts and gasps, totally helpless under your onslaught, and clearly loving every moment of it.");

	output("\n\nYou stop in your tracks, calling out to her with a smirk.");

	output("\n\n<i>\"What?\"</i> she whines, irritated at your stopping. ");

	output("\n\n<i>\"Just cum already,\"</i> you reply. You grip and yank her shaft");
	if(pc.tailCount > 1)
	{
		output(", while you push [pc.tails] as far as possible inside her hungry hole");
		if(pc.tailCount > 1) output("s");
	}
	output(".");

	output("\n\nA delighted squeal ripples from her throat, she arches her back and clenches down");
	if(pc.hasTailFlag(GLOBAL.PREHENSILE) && pc.hasTailFlag(GLOBAL.LONG))
	{
		output(", inadvertently squeezing your [pc.tails] in the silken vice of her depths");
	}
	output(", before her cocks bulge once more and send twin streamers of semen flying for the ceiling. Though they make a spirited attempt, they fall short, and instead drop like molten meteors back down to splat wetly against her already-smeared face and belly. She moans and cries and whimpers in ecstasy as she paints herself a second time; finally coming to a halt, she is completely plastered in her own herm-goo, panting for breath in a near-palpable fug of honeyed sex fumes.");

	output("\n\nYou release her");
	if(pc.hasTailFlag(GLOBAL.PREHENSILE) && pc.hasTailFlag(GLOBAL.LONG))
	{
		output(", withdrawing your [pc.tails] from her abused holes");
		if(pc.tailCount > 1) output("s");
	}
	output(". You reach for her balls, cupping and weighting them. Seems like she’s drained now.");

	output("\n\nShe inhales deeply and nods her head. <i>\"Seems like it,\"</i> she agrees in a conversational voice. <i>\"I could probably go again...\"</i> she winces, interrupting herself. <i>\"But I'd like a half-hour break first, please.\"</i> she informs you.");

	output("\n\nSo you wore her out then? Honestly, you expected more from someone who keeps boasting like she does.");

	//If Attraction <= 50%:
	if(kellyAttraction() <= 50)
	{
		output("\n\nShe looks offended at that, sniffing haughtily and pouting with wounded pride. <i>\"Oh, shush - you just caught me on a bad day! Bet next time I'll be the one to wear you out,\"</i> she declares with a confident smile.");
		output("\n\nYou’ll hold her to that bet.");
	}
	//else if Attraction <= 75%:
	else if(kellyAttraction() <= 75)
	{
		output("\n\nShe sticks her tongue out upon hearing that. <i>\"Pfyeah, like you could really handle me if I was getting serious. You might be getting better, but I'm still the best,\"</i> she proclaims, a twinkle in her eye and a grin on her lips.");
		output("\n\nWhatever she says, you shrug. Doesn’t change the fact that she’s the one having to catch her breath.");
		output("\n\n<i>\"And you think our positions wouldn't be reversed if I was the one playing you, huh?\"</i> she jibes you.");
		output("\n\nYou never said you wouldn’t get worn out. But that doesn’t change the fact you showed her up this time.");
		output("\n\n<i>\"Yeah, yeah, whatever,\"</i> she says, smirking as she brushes it off.");
	}
	//else: //Attraction <=100%:
	else
	{
		output("\n\nShe just waves negligently. <i>\"Whatever, we both know it's not me being bad, it's you being so damn good. Honestly, I’ve never found somebody that could play me like that. Let's just hope you won’t lose your touch,\"</i> she winks, a wicked grin on her lips.");
		output("\n\nFlattery... you weren’t expecting that.");
		output("\n\n<i>\"What, don't you think I can give compliments?\"</i> she asks you, still smiling. <i>\"Besides, you know what they say about flattery...\"</i> she trails off, a suggestive look on her face.");
	}
	output("\n\nShe yawns loudly and sprawls back, contentedly wriggling about in her puddle of honey-jism. <i>\"Mmm... I feel sooo good right now,\"</i> she informs you. <i>\"Come back and see me any time, honey; if I'm off work, I'll always make time for you,\"</i> she grins.");
	output("\n\nIsn’t she going to bathe? Her honey-cum is going to dry up on her fur if she sleeps like that.");
	output("\n\n<i>\"Oh, I'm not going to sleep,\"</i> she assures you. <i>\"Just wanna rest here a little while, let it soak in - then I'll go and wash it off. Really does wonder for your hair and your skin; how do you think I keep my coat so soft and glossy?\"</i> she asks, an amused grin on her lips.");
	output("\n\nYou just smile and shake your head, hopping off the bed. You bid her farewell and go back to your business, satisfied with the encounter for the moment.");
	//(Increase PC Lust.)
	pc.lust(50+rand(10));
	processTime(43);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[=No=]
function noJackingKellyOffToTestMods():void
{
	clearOutput();
	output("\n\n<i>\"Party pooper,\"</i> she huffs. <i>\"Well, alright, if you'd rather I just tell you...\"</i>");
	//Yes with insufficient Attraction joins here//
}

function kellyModsEpilogue(clearScreen:Boolean = false):void
{
	if(clearScreen) clearOutput();
	else output("\n\n");
	output("<i>\"Okay then. As you might have guessed, my fur's modded; we don't normally come in quite this sexy a coat pattern,\"</i> she giggles. <i>\"I wound up with a zil tongue kind of by accident, but I kept it because I really like what I can do with it,\"</i> as if in emphasis, she sticks it out of her mouth, curling it into a corkscrew pattern before pulling the prehensile appendage back inside. She then looks thoughtful and taps her chin. <i>\"Hmm... do they count if they're inherited from my parents?\"</i> she asks you.");

	output("\n\nShe shakes her head. <i>\"Eh, close enough. Well, my dad, he figured that getting double the balls would give him better chances of fathering kids. Guess who wound up inheriting dad's mod?\"</i> she winks at you. <i>\"Where the other dick came from, though, is a surprise; doctors figure it's a genetic hiccup, probably in response to the quad-balls mod I inherited,\"</i> she adds.");

	output("\n\n<i>\"And, of course, there's the big one, my first real mod. When I cum? Dicks or pussy, I make honey. Sweet, rich, tasty honey,\"</i> she grins gleefully at the thought. She stretches luxuriantly. <i>\"And that's all of them,\"</i> she informs you. <i>\"So, anything else on your mind?\"</i>");
	processTime(4);
	//Display Kelly at Bar options//
	//9999
}


//Zil Fetish
function askKellyAboutHerZilFetish():void
{
	clearOutput();
	output("\n\n<i>\"Zil fetish, huh?\"</i> She takes a swig of her drink. <i>\"Well, {name}. You really shouldn’t believe everything people say. Always take rumors with a grain of salt,\"</i> she chuckles.");
	output("\n\n<i>\"Oh, I know I make it an easy one, with the colors and all, but, honestly, I don't have a <b>zil</b> fetish,\"</i> she insists. There's a particular emphasis on the word <i>\"zil\"</i> that makes you suspicious that she's not telling the whole truth.... She sees your look and gives you a knowing grin. <i>\"What? Don't believe me?\"</i> she asks, one hand raising genteelly to her impressive chest.");

	output("\n\nYou don’t bother saying anything, instead you roll your eyes and continue to glare at her.");

	output("\n\n<i>\"Oh, alright, if you must twist my arm,\"</i> she smirks. <i>\"I'll admit I have a bee fetish, but that doesn't mean I have a zil fetish. Zil are... well, they're cute enough, with those adorable big black eyes and the delicate, veil-like wings that the boys have, not to mention that sweet color scheme of theirs and - oh! Did I mention the curves? They're just so yummy to look at,\"</i> she leers, sculpting a curvaceous outline in the air with her hands, as if molesting an invisible zil. <i>\"Not to mention, cumming honey? So damn hot... just the thought of it turns me on,\"</i> she purrs, one hand sliding down her belly and coming to a rest between her legs, cupping the bulge that awaits there..");

	output("\n\nYou chuckle, with the way she’s describing them, no wonder people would talk about her having a fetish for them.");

	output("\n\n<i>\"No, I have an appreciation for them. There's a difference,\"</i> she insists, a grin on her lips. <i>\"Just because I like how they look, it doesn't excuse their flaws.\"</i> She shakes her head. <i>\"Now, I'm hardly going to qualify for Miss Chastity, but even so, a girl likes a little consensus to her encounters - I don't approve of them dropping out of trees and trying to knock me out so they can have their wicked way with me. They could at least buy me a drink first!\"</i> she pouts.");

	output("\n\n<i>\"I mean, there I was, new to town; young, innocent, dumb and virginal... well, alright, maybe not virginal,\"</i> she amends at your skeptical look. <i>\"I didn't really know anything about the zil other than that they were natives, they were hot, and the locals apparently found it easy to have sex with them. So, out I went into the jungle one hot evening, looking to get lucky. I found two sexy bee-boys and a hot bee-girl hanging out near a fruiting tree, so I wander over to say hello... guess what happens?\"</i> she asks you with mock seriousness.");
	output("\n\n<i>\"They look up, they see me, and next thing I know, they're charging me!\"</i> she snaps indignantly. <i>\"I tried to protest that I wasn't there to fight, but next thing I know, I'm seeing stars, looking up at the canopy as one sits on my chest and the others are wrestling down at my legs.\"</i> She shakes her head at the memory.");

	output("\n\nShe looks at you sidelong and smirks. <i>\"I don't think you need to hear the grisly details, but suffice to say, I was a real mess when I got back, and I made up my mind I wasn't going out there for zil-sexing again. I'm not <b>that</b> easy, and while I've never heard of them keeping their bitches since then, I don't intend to be the first exception to the rule,\"</i> she informs you.");

	output("\n\n<i>\"So, yeah; great looks, rotten attitude, that's how I'd sum up the zil. Still, they were good for one thing... they made getting my mods super-cheap, because all I needed was a bit of zil gene-splicing,\"</i> she grins confidently, wrapping her arms behind her head and stretching, surely <i>coincidentally</i> displaying her black and yellow tits for your appraisal as she does so.");

	output("\n\nThat’s an interesting story, tho you admit a part of is rather curious about the <i>grisly details</i>. So... as long as it got stripes, honey and doesn’t try to rape her, she’s game?");

	//If PC has Zil or otherwise Bee Coloration AND HoneyCum OR HoneyFemCum:
	if(pc.zilScore() > 2)
	{
		output("\n\nKelly opens her mouth as if to say something, then stops, rubbing her chin as she eyes you over. <i>\"Actually... I'm a bit fussier than that,\"</i> she remarks, a growing grin on her lips. <i>\"See, I don't want just someone with bee stripes and honeyed jism... no, what I want is someone who has that, who's about your size; a " + pc.mf("handsome boy","girl") + " with a nice ");
		if(pc.biggestTitSize() < 1) output("flat chest");
		else if(pc.bRows() == 1) output("pair of [pc.breasts]");
		else output("set of [pc.breasts]");
		output(", a [pc.ass]");
		if(pc.hasCock()) output(", " + num2Text(pc.cockTotal()) + " [pc.cocks]");
		if(pc.hasVagina()) output(", " + num2Text(pc.vaginaTotal()) + " [pc.vaginas]");
		output("....");

		output("\n\nShe smiles, looking at you. <i>\"The ability to hold a conversation, too, is definitely a big plus in my book... So, know where I might be able to find someone like that?\"</i> she grins.");

		output("\n\nFiguring the game she’s trying to play, you decide to play along. Maybe you do, but she’s going to have to do a bit of looking around.");

		output("\n\nShe smirks. <i>\"Oh, dear, now wherever shall I look?\"</i> she laments in the most hamtastic fashion, making a show of looking around the room. Then her eyes fall upon you and she leers at you. <i>\"Oh, my, I do think I found them,\"</i> she giggles, her hand reaching across the table to gently brush yours. <i>\"Now, whatever shall I do with you, hmm? Kidnap you and carry you away to my little lovenest...?\"</i> she purrs this at you, bending forward slightly and batting her eyes at you.");
		processTime(9);
		//[Sex][Refuse]
		//9999
	}
	//Else:
	else
	{
		output("\n\nShe purses her lips, a finger pressed against them in thought, and hums as if thinking about it... for all of five seconds. <i>\"Being able to hold a decent conversation is always a plus, but....\"</i> she grins wickedly. <i>\"Pretty much,\"</i> she says unabashedly.");

		output("\n\nShe stretches luxuriantly. <i>\"Alright, was there anything else on your mind?\"</i>");
		processTime(9);
		//Display Kelly at Meadhall Options//
		//9999
	}
	
}

//[=Refuse=]
function refuseToGoKellysLoveNest():void
{
	clearOutput();
	output("\n\nMaybe some other time, you reply.");

	output("\n\nShe pouts and huffs <i>\"no fun meanie,\"</i> at you, and then straightens up and stretches. <i>\"Well, is there anything else you wanted?\"</i>");
	//Display Kelly at Meadhall Options//
	//9999
}

//[=Sex=]
function chooseToGoToKellysLovenest():void
{
	clearOutput();
	output("\n\nSince she seems to have gotten you, you really have little choice in the matter. You smirk seductively.");

	output("\n\nShe grins a cat that stole the cream grin, reaching out to caress your [pc.face]. <i>\"Indeed... Well, come then, my sweet ");
	if(pc.tallness < 60) output("little ");
	output("bee; your flower awaits,\"</i> she purrs, rising from her seat and seductively sashaying her way towards the door.");
	//Go to sex menu//
	//9999
}

//Share Meal
function shareAMealWithKelly():void
{
	clearOutput();
	processTime(2);
	//1st time:
	if(flags["KELLY_HAD_A_MEAL_SHARED"] == undefined)
	{
		flags["KELLY_HAD_A_MEAL_SHARED"] = 0;
		output("\n\nSitting here amongst a crowd of people all eating or drinking and chatting away has left you feeling a bit peckish. You think about getting something to eat and offer to buy something for Kelly too.");
		output("\n\n<i>\"Buy something?\"</i> she repeats, looking a little skeptical. She mulls it over, then shakes her head. <i>\"Nah, no thanks, [pc.name]; no offense to Burt, but he's hardly the best cook in town.\"</i>");
		output("\n\nWell, you’d offer to take her to the restaurant, but the with the way she’s dressed....");
		output("\n\n<i>\"Screw them, I'm not going to go and get dressed up all fancy just to have something to eat,\"</i> she replies defiantly.");
		output("\n\nYou shrug in exasperation, what does she want to do then? You don’t want to be eating while she keeps looking at you.");
		output("\n\n<i>\"Well, if you're really that hungry, I might know a solution,\"</i> she replies, carelessly examining her fingernails. <i>\"We could always have something to eat at my place.\"</i>");
		output("\n\nOh? So is she going to cook for you?");
		output("\n\n<i>\"Only if you <b>help</b> me,\"</i> is her teasing response.");
		output("\n\nYou wonder for a moment if you should take her invitation.");
		//[Accept][Refuse]
		//9999
	}
	else
	{
		//if Attraction =< 25 :
		if(kellyAttraction() <= 25)
		{
			output("\n\nKelly giggles at your offer. <i>\"My, somebody feels confident, don't they? We have dinner together and you feel entitled to just pop on by whenever you please...?\"</i> She lets the silence linger, and then winks at you, a mischievous grin on her lips. <i>\"I like that sort of confidence,\"</i> she purrs. <i>\"Come along then,\"</i> she says, hopping to her feet.");
		}
		//Else if Attraction =< 50:
		else if(kellyAttraction() <= 50)
		{
			output("\n\n<i>\"Do you like my cooking that much?\"</i> she asks with a confident smirk. <i>\"Or is this just to get out of having to cook your own dinner?\"</i> she suggests, winking at you. <i>\"Well, I guess I can't let you starve... let's get going,\"</i> she tells you, already leaving her seat.");
		}
		//Else if Attraction =< 75 :
		else if(kellyAttraction() <= 75)
		{
			output("\n\nShe chuckles at your suggestion. <i>\"Getting quite attached to your place at my dinner table, aren't we? Well, I have to admit, cooking for two is more fun...\"</i> she gives you a suggestive look as she says that. <i>\"Of course you can come to dinner,\"</i> she tells you, hopping to her feet as she does.");
		}
		//Else if Attraction =< 100 :
		else if(kellyAttraction() <= 100)
		{
			output("\n\nShe smiles, looking unabashedly into your eyes. <i>\"You know, I've gotten quite attached to having you around. Meals are so much nicer with good company. If you're feeling peckish, you can always drop by for a quick snack... or something a little more elaborate,\"</i> she purrs, giving you one of those lewd winks of hers before standing up, stretching as she does and \"coincidentally\" thrusting out her breasts. <i>\"Come on, then, let's go get cooking,\"</i> she cheerfully declares.");
		}
		kellyShopping();
	}
}

function kellyShopping():void
{
	output("\n\nShopping with her is quite an experience, Kelly can be quite the energetic hopping bunny when she wants to. Since you’re getting a free meal out of this, you don’t mind helping, however it’s true that this is more than simple <i>grocery shopping</i>. Unless skin care, fur care and cleaning supplies suddenly became a part of the cooking process when you were not looking....");
	//if Strength <= 30:
	if(pc.physique() <= 20)
	{
		output("\n\nAs the bags start piling up it becomes harder and harder to keep up with her. And you find yourself getting winded easily, of course, the fact that you don’t really have time to sit down and adjust the bags so you can carry more could be a factor.");
		output("\n\n<i>\"Hey, [pc.name], what's up? You're slower than a honey-glazed snail,\"</i> Kelly comments as she finds herself continually delayed by you. She takes a look at you and blinks as she sees just how much you're struggling with her groceries. <i>\"Ah. Okay, we've got enough for today, we can head back to my place now,\"</i> she promises you.");
		output("\n\nYou sigh with relief when you start to head to her home.");
	}
	else
	{
		output("\n\nHer bags soon start piling up and you’re thankful that you’re strong enough to carry them. Still, keeping up with Kelly can be quite difficult. She shows no shame as she starts to pile bag upon bag whilst you’re carrying.");
		output("\n\n<i>\"It's so nice to have a strong " + pc.mf("man","woman") + " along to help out; it's such a bother having to make multiple trips every time I want to get some shopping done. You're so sweet to help me out like this, [pc.name],\"</i> she chirps gleefully.");
		output("\n\nBy the time you start heading back to her house you admit you were getting tired, you were running of room to carry her stuff too.");
	}
	output("\n\n<i>\"And that's the last of it,\"</i> she declares happily, closing the final cupboard. <i>\"You're such a sweet " + pc.mf("man","woman") + ", to help a little lady like myself,\"</i> she says, turning her head to look over her shoulder to shoot a mock-innocent smile at you as she does. With a sigh of relief, she starts to fiddle with her bra-like mini-top, casually dropping it to the floor once it springs free of her breasts, then bending over to start removing her pants, ass up and pointed towards you, each shapely curve of buttock and leg emphasised as her pants slide with slow, deliberate motion down t the floor. She steps out of them with one foot, and then a delicate backwards kick flicks the other away.");
	output("\n\n<i>\"Much better,\"</i> she announces. <i>\"Always so much more comfortable like this; it's nice to let the girls breathe.\"</i> She stops and giggles to herself. <i>\"My moms would spank my cute little bunny-butt until it glowed red for doing this... but that's half the fun, isn't it?\"</i> she asks; you're not sure if she's being hypothetical or not. <i>\"Oh, please, don't be shy on my account; my home is your home. Go on and make yourself comfortable, too,\"</i> she adds, almost as an afterthought.");
	processTime(7);
	//[GetComfy][No]
	//9999
}

//[=Refuse=]
function refuseKellysDinnerFirstTimeInvite():void
{
	clearOutput();
	output("\n\nYou tell her that it’s fine. She doesn’t have to get out of her way for you.");

	output("\n\nShe huffs at that. <i>\"What’s the problem, honey? Don’t you want me to make you a meal? A complete course with dessert?\"</i> She bats her eyes. <i>\"Or are you just worried about the <b>help</b> I’m in need of?\"</i>");

	output("\n\nYou admit you are curious about that.");

	output("\n\n<i>\"My, my. You have such a dirty mind {name}. I just want some help with the groceries. Can’t cook you anything without the ingredients.\"</i>");

	output("\n\n...Well that certainly is not the kind of help you expected her to ask for.");

	output("\n\n<i>\"So?\"</i>");

	//[Accept][Refuse]
}

//[=Refuse=]
function doubleRefuseKellyDinnerYouAsshat():void
{
	clearOutput();
	output("\n\nThough she’s not really asking for much, you still decline her invitation. Maybe some other time.");

	output("\n\n<i>\"Aw, you’re no fun,\"</i> she sighs in mock exasperation. <i>\"And here I was thinking this would be the perfect excuse to take you home. Anyway, wanna do something else?\"</i>");
	//(Display Options)
	//9999
}

//[=Accept=]
function helpKellyOutDinnerDate():void
{
	clearOutput();
	output("\n\nYou suppose there’s not harm in <i>helping</i> her then.");

	output("\n\nShe pushes her chair away from the table and hops back on her feet. <i>\"I just need to clear my tab and we can go.\"</i>");

	output("\n\nYou nod and follow her.");
	//9999?
}

//[=No=]
function noToChoiceAtEndOfKellyShopping():void
{
	clearOutput();
	output("You are pretty comfortable as you are already, so you see no sense in stripping down.");

	output("\n\n<i>\"Suit yourself,\"</i> she declares; if she feels at all disappointed, she's doing a great job hiding that fact.");
	//9999
}

//[=GetComfy=]
function getComfyAfterKellyShopping():void
{
	clearOutput();
	output("Well, it’s unfair to have her give you so much eye-candy without paying her back for it. That said you start stripping off your [pc.gear], laying it neatly on a nearby table.");
	//if Attraction =< 50:
	if(kellyAttraction() <= 50) output("\n\nKelly turns to watch you, openly enjoying every moment as your clothes come off and you are standing naked before her. She lets out a wolf whistle of delight once the last comes off. <i>\"Now there's a sight to admire; stick around after dinner, maybe we'll have a bit of my special dessert,\"</i> she coos, winking at you.");
	else output("\n\nKelly immediately snaps around to face you, blatantly ogling with glee as you make yourself as naked as she is. With an almost predatory intensity she struts towards you, making a circuit around you as the last bit of gear hits the floor. <i>\"Now you, honey, are what we call <b>damn</b> fine... you have <b>got</b> to stick around after dinner, try some of my special dessert,\"</i> she coos. The sudden admiring slap she delivers to your [pc.ass] in emphasis of the word \"special\" leaves you with little doubt as to what's on her mind.");

	output("\n\nWith a merry chuckle, she strides back towards the kitchen, stopping at the opening and pulling on a cute apron she had hanging nearby. Properly kitted out to protect herself, she heads on in.");

	output("\n\nYou watch Kelly’s naked butt sway enticingly as she hums while preparing the things needed. She barks you a few orders to set up the table, cut a few vegetables, and so on; but otherwise she leaves you to observe.");

	output("\n\nFrom the looks of it, the choice dish will be ham. The laquine hums to herself as she concentrates on her part of the cooking, almost bouncing in place as she wraps up the ham in foil and slides it into the oven, bending over a lot lower than she probably has to and sticking her perky ass up in the air as a consequence. As her tail flicks in time with her humming, you can actually see the wet lips of her pussy above her dangling quad.");
	if(pc.hasCock() || pc.hasTailCock()) output(" If you wanted to, you could probably take her right here and now....");
	else output(" It's just begging for some attention, you'd swear it....");

	output("\n\nBefore you can make up your mind on that, however, she straightens up again, closing the oven and bustling over to retrieve some other ingredients and a large bowl. As you watch, she throws some cornstarch, brown sugar, red pepper flakes, and cayenne pepper into the bowl. She mixes it all up, then steps back.");

	output("\n\n<i>\"Now, where did I put that honey?\"</i> she muses aloud, seemingly to herself.");

	output("\n\nPart of you is amused that she bothered to buy honey instead of just using her own. But you suppose she doesn’t want to use hers for cooking, or maybe she’s doing that for you? In any case it’s kind of funny that she’s forgotten where she’s placed it, you should help her out.");

	processTime(10);
	//[UseHers][HelpHer]
	clearMenu();
	addButton(0,"UseHers",useKellysHoneyForCooking,undefined,"Use Hers","Use Kelly's \"all natural\" honey for flavoring. Warning: may contain giant hermcock.");
	addButton(1,"Help Her",helpKellyFindHerHoneyThisWasntAPloyForCumPlayAtAll,undefined,"Help Her","Help Kelly find her honey jar.");
}

//[=UseHers=]
function useKellysHoneyForCooking():void
{
	clearOutput();
	var x:int = -1;
	if(pc.hasCock()) x = pc.cockThatFits(chars["KELLY"]);
	output("You sneak up on her and without warning hug her midriff, quickly moving a hand to her balls, brimming with honey. You ask why she’s bothering to look for the jar when she has a sack-full of honey handy.");
	output("\n\nShe moans appreciatively as she feels your fingers cupping her sack. <i>\"Mmm... some folks don't like eating it when they know where it comes from,\"</i> she replies absently. <i>\"But maybe you're different...?\"</i> she suggests, a hopeful tone in her voice and an eager grin on her lips.");
	//if PC is naked and has a dick
	if(x >= 0) output("\n\nYou adjust yourself so the [pc.cockHead " + x + "] of your erect [pc.cockNounSimple " + x + "] is nestled between the folds of her inviting pussy.");
	else if(pc.hasTailCock()) output("\n\nYou move your [pc.tail], gently rubbing her folds before nestling the [pc.tailCockHead] against her moist entrance.");
	
	output("\n\nGently, you fondle her balls and whisper into her ear that if she’s going to cook for you, might as well as use fresh ingredients. You already helped her shop, you wouldn’t mind helping her extract some honey either.");

	output("\n\n<i>\"Ohhh... talk about music to my ears,\"</i> she purrs, grinding her ass back against your ");
	if(!pc.hasCockTail()) output("crotch");
	else output("tail");
	output(". <i>\"If you're hungry for my personal brand... well, I'm eager to accommodate you,\"</i> she giggles, twin shafts already starting to slide from her leathery sheaths, rising upwards in synchronised erections. <i>\"But may I take the proper position first?\"</i> she asks, a mocking attempt at pleading in her tone.");

	output("\n\nYou bite her ear lightly, licking it slowly. A squeak escapes her lips, followed by an appreciative giggle. You tell her that you don’t intend to let her go so easily, so if she intends to take any position, she’s going to have to do it with you attached.");
	if(x >= 0 || pc.hasTailCock()) output(" You give her a short thrust to draw more moisture from her dripping folds, effectively sandwiching your shaft between her folds.\n\nKelly moans like a whore in heat as she feels your dick brushing through her womanhood, the first thick, fat drops of syrupy precum drooling from her twin shafts in her excitement. <i>\"You make a <b>very</b> convincing argument,\"</i> she informs you in a stage whisper. <i>\"...So what are you waiting for?\"</i>");
	else output("\n\n<i>\"Sounds like somebody has plans,\"</i> she giggles. Then she leans back against you for a moment. <i>\"I like a " + pc.mf("boy","girl") + " who knows what " + pc.mf("he","she") + " wants,\"</i> she informs you, straightening back up again. <i>\"I can't wait to see what you have in mind....\"</i>");

	output("\n\nSmiling at being given free reign, you move your hands to her shafts, beginning to expertly stroke her.");
	if(x >= 0 || pc.hasTailCock()) 
	{
		output(" At the same time, you pull away from her nethers and instead align yourself with her tight pucker. She groans appreciatively, wriggling her ass as if in open invitation for you to penetrate her, visibly keeping herself from joining your fingers as they dance along her dicks.");
		cockChange();
	}
	output("\n\n<i>\"Oh, you're good... really know how to make a girl feel <b>wanted</b>,\"</i> she growls lustfully");
	if(x >= 0 || pc.hasTailCock()) 
	{
		output(", grinding her ass back against your cock, teasing its ");
		if(x >= 0) output("[pc.cockHead " + x + "]");
		else output("[pc.cockTailHead]");
		output(" but refraining from actually penetrating herself with it");
	}
	output(".");

	//if Cock or Tailcock:
	if(x >= 0 || pc.hasTailCock())
	{
		output("\n\nYou push forward; lubed as you are from her female juices you find almost no resistance as you feel her stretch around you. An appreciative moan spills from her throat and she arches her back, pushing back against you to help you reach deeper. Inch after inch, you feed her ass until you are completely sheathed inside her.");
		output("\n\n<i>\"Ah... oh, that feels so good,\"</i> she moans eagerly, syrup spurting in a splattering squirt from each shaft, her cunt drooling wetness onto the floor below.");
		output("\n\nYou waste no time and eagerly start humping her, being especially attentive to her prostate.");
		output("\n\nShe groans and grunts and gasps with each thrust, humping herself back against you in counterpoint. Her pussy drips ceaselessly, but it is her cocks that are drooling like open faucets, each brush against the swollen bulge of her prostate causing her to spurt a glob of semen-syrup onto the floor.");
	}
	output("\n\nYour hands massage her pair of pricks; her slick honey makes the process smoother by the second. In no time at all your hands become a blur, alternatively milking her shafts.");

	output("\n\nMoaning and whimpering, she hisses and shudders in your grip, syrup coating your hands and drooling steadily down over her balls to puddle on the floor. The stuff is flowing thick and fast now, the laquine writhing in the throes of her pleasure, totally lost to the sensation of your hands on her cocks");
	if(x >= 0 || pc.hasCockTail()) output(" and your cock in her ass");
	output(".");

	output("\n\nFeeling her teetering on the edge of an orgasm, you quickly grab a nearby glass and hold it above one of her tips, your other hand moving to fondle her balls as you bite her ear once more.");

	//if cock/tailcock:
	if(x >= 0 || pc.hasTailCock())
	{
		output("\n\nWithout warning you bury yourself inside her and groan as you orgasm; sputtering your seed deep into her bowels.");
		if(pc.cumQ() >= 1000) output(" You easily fill her to the brim, to the point your [pc.cum] starts dripping around the seal of your shaft, yet you are relentless. You continue to pound her even as you turn her abused hole into a veritable mess.");
		output("\n\n<i>\"I... oh, gods, oh gods...\"</i> she moans, bucking against you, so very close, yet not quite there just yet....");
	}
	output("\n\n<i>\"Cum,\"</i> you whisper to her. She needs no second instruction, her whole body tensing as she erupts into a wet climax; the shaft you are guiding hammers a torrent of honey into the glass, almost knocking it from your grip with the force. The other, left to its own devices, sends a great arc of orange-yellow semen flying through the air to splatter wetly across the counter, almost hitting the bowl in its own right, but falling just a little short. She gasps and moans as she empties herself, until finally it seems that she's drained.");

	output("\n\nReleasing {and pulling out of} her, you watch as she crumbles to her knees, barely supporting herself on the counter. With a smile you kneel down, grabbing hold of her sensitive shaft and milking a few more dollops from her shaft. A deep, throaty moan is all that she can muster in response to this. You manage to catch it all within the glass, despite it already being close to overflowing.");

	output("\n\nKelly puffs and pants, head hanging low in her post-orgasm exhaustion, almost collapsing bonelessly upon the floor, but managing to hold herself upright, even if she wobbles a little before she catches her breath and finds her footing.");

	output("\n\nWhat a messy cook she is, splattering her counter with honey. You calmly place the glass on the counter, sure that you have collected far more than necessary. ");

	output("\n\nShe puffs a little, but manages to grin at you. <i>\"You know what they say, half the fun is making the mess... or something. Besides, I'll clean it up once I'm done mixing the glaze.\"</i> She waves a hand in dismissal.");

	//if cock:
	if(x >= 0)
	{
		output("\n\nPersonally, you could use some help cleaning up right now. You thrust your half-erect ");
		output("[pc.cockNounSimple " + x + "]");
		output(" out for her.");
		output("\n\nShe glances towards it, and then smirks. <i>\"Well... I suppose it wouldn't hurt to clean it now,\"</i> she confesses, licking her lips. She kneels down to better facilitate herself, reaching out and tenderly taking hold of your member. She leans her head forward, but stops shy of actually kissing it, instead opening her mouth and letting her tongue extend. It writhes sinuously through the air, undulating as it twines itself about your length, rippling gently as it strokes up and down. ");
		output("\n\nYou grin to yourself as her tongue quickly brings you back to full mast. You pat her head appreciatively as you sigh in pleasure; Kelly is such a good girl, cleaning up after herself like this. If she continues being this dedicated you’ll just have to give her a treat.");
		output("\n\nHer eyes light up at your praise and her tongue redoubles its assault on your sensitive parts, caressing you with the most inhumanly skilled and delicious tenderness along your length and across your girth, squeezing and rubbing, now fast, now slow, now tender, now rough, milking you with more skill than any ordinary hand could.");
		output("\n\nHer tongue feels too good, the irregular motions only spur you on. You find yourself gripping her hair, out of reaction rather than any intention of hurting her, though you are quick to release her and pat her head apologetically. It doesn’t seem she’s mad, though; actually, seeing how she’s driving you nuts with her limb-like tongue only makes her try all the harder. It’s all you can take, and without warning you groan and climax right then and there.");
		output("\n\nHer tongue uncoils itself like a whip, letting your cock go loose and dangling freely as she closes her eyes and opens her mouth, letting you spray your [pc.cumNoun] all over her face. Her lips are curled into a blissful expression, seemingly lost in a perverse rapture as your semen washes over her. She turns her face to this angle and that, striving to make sure you cover every last inch of her face, her neglected shafts now hard again between her legs.");
		output("\n\nYou take a step back and admire your handiwork. Kelly’s face is completely plastered with {cum}. Much to her apparent enjoyment. She lifts her head up, letting it run down her cheeks and neck, dribbling into the canyon of her cleavage, then sighs hugely. <i>\"Nothing feels as good as a nice plaster of cum, that's what I always say,\"</i> she giggles, finally opening her eyes and batting them at you. <i>\"What do you think? Do I look better with this on?\"</i> she suggests, then shrugs. <i>\"But ah well, I can't wear this forever,\"</i> she notes to herself. As you watch, her inhuman tongue stretches out and begins to rub itself over her face, lapping up every drop with lewd slurps until she is clean as a whistle. Patting her belly appreciatively, she climbs back to her feet.");
	}
	//else if tailcock
	else if(pc.hasTailCock())
	{
		output("\n\nPersonally, you think she should clean up at least part of the mess she made with her antics. You maneuver your [pc.tailCock], placing its [pc.tailCockHead] against her lips.");
		output("\n\nShe doesn't even bother wasting time with words; the light in her eyes makes her intent obvious enough. Gently taking hold of your inhuman shaft, she opens her mouth, closes her eyes, and guides it inside, her elongated tongue coiling about it and drawing it inside the warm wetness of her mouth. She sucks away contentedly, bobbing up and down its length, tickling and caressing you with her prehensile tongue as she does so.");
		output("\n\nYou groan as she plays with your sensitive [pc.tailCock]. Eagerly, you begin to thrust yourself into her mouth, effectively face-fucking her; something she seems to approve, judging by her moans. While you do that, you embrace her, grabbing her pillowy tits and massaging them. Since she’s being such a good girl, you don’t see why she shouldn’t feel good too.");
		output("\n\nShe moans in appreciation, the vibration rippling along your [pc.tailCock] and sending sparks of pleasure through you, before she begins to redouble her suckling, lewdly slurping and gulping as she seeks an oral injection of your seed.");
		output("\n\nWith a groan and a squeeze on her voluminous chest, you give her what she wants. Spurt after delicious spurt of [pc.cum] exits your [pc.tailCockHead] to enter her hungry mouth and settle in her hungry stomach.");
		//if high cum amount:
		if(pc.cumQ() >= 1000) output(" You wonder for a moment if she’s even going to be able to eat after you’re finished, so great is the amount of seed you feed her. However you don’t have to worry too much about that, as another shuddering wave of orgasmic high wipes your mind clean of any coherent thought.");
		output("\n\nShe steadfastly sucks and slurps, swallowing every mouthful you give her as fast as she can, tongue occasionally tickling your shaft to coax a litte more from you, until at last you have finished and, as pleasurable as her continued suckling is, you have nothing more to give her. She painstakingly polishes your tail's phallic tip off with her tongue, and then lets you pop free of her mouth, panting slightly as she catches up with her need for air. Fingers genteely cover her lips as she hiccups, then giggles an apology to you. <i>\"Mmm... all nice and clean now,\"</i> she informs you.");
		output("\n\nYou thank her for a job well done. <i>\"It was my pleasure,\"</i> she assures you, licking her lips to ensure she catches anything that might have spilt.");
	}
	output("\n\nHumming contentedly, she walks back over to the counter, taking the glass of freshly jizzed honey and pouring it into the dry mix, softly singing snatches of something to herself as she mixes it all together to make a glaze, which she then starts cooking over the oven top.");

	output("\n\nYou watch her finish the last steps, preparing everything for when its time to apply the glaze and let it cook.");

	output("\n\n<i>\"Alrighty, now we just wait,\"</i> she explains, washing her hands off in the sink. ");
	if(kellyAttraction() < 50) output("<i>\"So... wanna chat for a bit to pass the time?\"</i> she asks.");
	else output("<i>\"So... just waiting here is boring. How about some fun? On the couch?\"</i> She smiles innocently.");

	output("\n\nSounds like a plan....");

	output("\n\nKelly visibly perks up as the timer goes off for the last. <i>\"Oh, would you get that please, [pc.name]? I'll set the table,\"</i> she says, pushing herself up from her seat and literally hopping to her feet, tits and ass jiggling nicely from the motion as she does so.");

	output("\n\nYou do as requested, fetching the bowl of salad first and laying it on the table, then walking towards the oven to fetch the ham. Careful not to burn yourself, you use a cloth to take the ham off the oven and lay it nicely on a tray. Satisfied, you leave the cloth behind and take the tray back to the table.");

	output("\n\nDespite what one might think, Kelly certainly knows how to set a table. A beautiful floral-printed green tablecloth covers a richly polished table of local hardwood, chairs of the same and engraven with floral and vine designs positioned around it. She's set out two plates, actual old-fashioned china, each delicately painted with alien symbols and plants, and beside each are knives and forks that are either real silver or highly polished stainless steel. A high fluted glass vase containing some of the local blooms takes pride of place near the center of the table.");
	if(kellyAttraction() >= 50) output(" An antique-looking candlestand, lit by a single gently burning candle, has been placed at the end of the table where the two of you will be sitting, and the lights have been dimmed just enough to make its own light visible.");

	//1st time:
	if(flags["KELLY_HAD_A_MEAL_SHARED"] == 0) output("\n\nYou admire the whole set up, nodding as you take a step to pull your chair. That’s pretty fancy, you comment. Far more than you expected anyway.");
	else output("\n\nAh, Kelly; she's never going to change, is she? Such a contradictory creature, she is. You can't help but let your feelings show on your face.");

	output("\n\n<i>\"What? You think just because I like a bit of casualness in life I'm completely unsophisticated?\"</i> she giggles, then moves to pull out her own chair, stopping before actually seating herself. <i>\"Ah, guests first?\"</i> she suggests with a smile, indicating your seat with her hand. <i>\"That's what my moms always said.\"</i>");

	output("\n\nSeeing no reason to refuse her invitation, you take your seat and patiently wait for her to take hers. Happily she flops down into her seat and pulls herself in to the table. <i>\"Alright! I'm so hungry... I was starting to wonder just how long this stupid ham was gonna take to cook,\"</i> she pouts. But then she shakes her head. <i>\"Ah well, you know what they say; nothing adds spice to the appetite like hunger. Would you like me to serve?\"</i> she asks you.");

	//[Yes][ServeHer][No]
	processTime(20);
	clearMenu();
	addButton(0,"Yes",haveKellyServeAfterUsingHerHoney,undefined,"Yes","Kelly will serve dinner.");
	addButton(1,"Serve Her",haveKellyServeAfterUsingHerHoney,undefined,"Serve Her","You will serve dinner.");
	addButton(2,"No",haveKellyServeAfterUsingHerHoney,undefined,"No","Everyone will get their own meal.");
}

//[=Yes=]
function haveKellyServeAfterUsingHerHoney():void
{
	clearOutput();
	output("\n\nNodding you take your plate and hand it over for her.");

	output("\n\nShe smiles and accepts it from you, placing it in front of her and taking up the carving knife, meat fork and salad tongs in turn. <i>\"Now, lets see here... first, some salad; need to eat healthy if you want plenty of stamina,\"</i> she notes, applying a generous helping of salad as she speaks. <i>\"And next, a nice, big, thick, juicy cut of meat; just the way you like it,\"</i> she notes, winking at you as she slices a sizable piece from the ham and applies it to your plate in turn. Stopping, she looks at your plate and shakes her head. <i>\"That should be enough; don't want you getting overstuffed before dessert, no?\"</i> she comments, smirking as she does.");

	output("\n\nCome to think of it, you don’t recall seeing her prepare anything for dessert. So what is she planning? You ask teasingly.");

	output("\n\n<i>\"Oh, I think you'll like it. It's a special recipe all my own; very sticky and sweet, and oh, so messy, too, but that's just part of the fun,\"</i> she grins.");

	output("\n\nIn that that case, you’ll be looking forward to it.");

	output("\n\nShe grins at hearing that, hands you your now-filled plate, and then turns to filling her own plate in turn.");
	processTime(2);
	clearMenu();
	addButton(0,"Next",eatingWithKellysHoneyForSeasoning);
}

//[=ServeHer=]
function serveKellyDindinsAfterUsingHerHoney():void
{
	clearOutput();
	output("\n\nYou get up and extend your hands, motioning for her to hand over her plate. You don’t trust her to set up her dish herself, so you’ll be doing that for her. Make sure she eats all the healthy stuff. Otherwise it’ll all wind up going to her ass and breasts.");

	output("\n\n<i>\"Really?\"</i> she asks, lifting an eyebrow and then looking down at her bust, hands reaching up to cradle her bulging tits, running sensuously over their round, pert mass. <i>\"Mmm... that doesn't sound like such a bad thing to me. After all, what's a sexy bunny without a big sexy butt?\"</i> she jokes, winking at you. <i>\"And don't think I haven't noticed you staring at my boobs, either; I think I wouldn't be the only one happy to give them a few extra inches,\"</i> she smirks. This doesn't stop her from handing you her plate, though.");

	output("\n\nMaybe you would, but doing that using food is just wrong. It’s common knowledge that the only proper way to expand a sexy bunny’s assets is through careful massage and the special application of <i>beauty creams</i>.");

	output("\n\n<i>\"Oh, I'm all for using those, too,\"</i> she purrs. <i>\"But it can be so hard to get the rubbing done right... maybe some sweet thing would be willing to give me a hand or two the next time...?\"</i>");

	output("\n\nMaybe... if she behaves and asks you nicely.");

	output("\n\n<i>\"Behave? Who brought you home to dinner? Who slaved over a hot oven to give you a hand-cooked meal? More importantly, who promised to help me earlier?\"</i> she pouts.");

	output("\n\nYou already helped her with shopping, not to mention how you helped her get honey for cooking. You’re pretty sure that covers your debt... for the moment.");

	output("\n\n<i>\"I... oh, that's right. In fact, considering what you've done, I think it might be <b>me</b> who's in debt to <b>you</b> now,\"</i> she comments, looking thoughtful. <i>\"Yes... well, I'll have to do something about that,\"</i> she notes, smiling to herself as she nods her head decisively. She then grimaces, her stomach audibly growling. <i>\"But first... let's have dinner,\"</i> she tells you.");
	output("\n\nYou nod and hand over her plate before starting to gather food for yourself.");
	processTime(2);
	clearMenu();
	addButton(0,"Next",eatingWithKellysHoneyForSeasoning);
}

//[=No=]
function noServingFoodAfterKellyUsesHerCum():void
{
	clearOutput();
	output("\n\nYou get up, taking you own plate in hand. You thank her, but it’s simpler if you get the food yourself.");

	output("\n\nKelly just smiles and nods in an understanding fashion. <i>\"Okay, that's fine,\"</i> she replies. <i>\"Just give me the utensils when you're done so I can get my own.\"</i>");

	output("\n\nYou quickly fill your plate with the appropriate portions you’ll be having, handing over the utensils for Kelly to gather her own food. She wastes little time in dishing up her own servings as well.");
	processTime(1);
	clearMenu();
	addButton(0,"Next",eatingWithKellysHoneyForSeasoning);
}

//All rejoin here//
function eatingWithKellysHoneyForSeasoning():void
{
	clearOutput();
	output("\n\nNow that both of you have loaded plates in front of you, Kelly raises her cutlery with a gleeful expression. <i>\"Alright, let's eat!\"</i> she cheers, already putting fork and knife to her ham.");

	output("\n\nWithout further ado, you stab your ham and cut off a piece. It tastes great, you find yourself humming as you bite into the soft flesh. The sauce adds a great aftertaste and you can really tell the bittersweet taste of honey with a touch of lemon.");

	output("\n\nKelly watches you hungrily; even as her own hands cut some ham on auto-pilot, her eyes never leave you or your plate, a faint smirk on her lips. <i>\"Good stuff, isn't it?\"</i> she asks, taking a mouthful of herself and humming with delight as she savors it.");

	output("\n\nYou nod in agreement.");

	output("\n\n<i>\"I knew it would be,\"</i> she says, visibly preening. <i>\"My honey's better than any brand you'll get out of a bottle, I'd bet on that,\"</i> she boasts.");

	output("\n\nYou roll your eyes. She sure likes to keep bragging about her honey, doesn’t she?");
	if(pc.hasCock())
	{
		if(pc.hasCock() && pc.cumType == GLOBAL.HONEY) 
		{
			output(" Perhaps <b>you</b> should provide the honey next time.");
		}
		else if(pc.hasCock())
		{
			output(" It might not be honey, but perhaps <b>you</b> should provide the seasoning next time?");
		}
		if(pc.isNude()) output(" You reach under the table to stroke your [pc.cockBiggest].");

		output("\n\n<i>\"Hey, if you got it, flaunt it,\"</i> she states, unabashed at being called a braggart. <i>\"But as for trying <b>your</b> ");
		if(pc.cumType == GLOBAL.HONEY) output("honey");
		else output("special seasoning");
		output("...\"</i> she leans over the table and licks her lips, slowly and deliberately. <i>\"I'm game if you are, honey. I <b>love</b> trying new flavors,\"</i> she purrs, then settles back in her chair,");
	}
	output("\n\nThe meal passes companionably enough from that point; though hungry enough that she isn't so outrageously flirtatious, Kelly still drops a few innuendo-laced comments and flirtations in between mouthfuls. She laughs at your responses, enjoying your efforts to give as good as you get. As the meal proceeds, you notice a sweet, piquant scent starting to underlace the air. You have obvious suspicions about the source... especially when you notice Kelly occasionally biting her lip, as if to hold back a whimper or a moan. Completely devoid of shame, she never looks away from your eyes.");
	output("\n\nSated for the moment, you set your cutlery down and wipe your mouth with a napkin.");
	output("\n\nKelly smiles as she sets her own cutlery down, but prefers to use her elongated tongue rather than a napkin. Standing up, she starts to gather the cutlery and plates, clearly intending to clear the table. <i>\"Ah, good food and great company; what more could a girl want?\"</i> she sighs contentedly. <i>\"It's actually pretty nice to have someone over for dinner,\"</i> she notes, more musing to herself than anything.");

	output("\n\nWhat about dessert? You question, as you watch her come and go.");

	output("\n\n<i>\"Dessert?\"</i> she repeats as she returns from delivering the last of the tableware. She pauses and looks thoughtful, tapping her chin with a finger as if contemplating the question. There's a glint in her eye that bespeaks her true thoughts, even before she suddenly springs forward, bounding atop the table and settling gracefully into a kneeling position in front of you, her twin foot-long shafts bouncing before you from the motion. Even as they stop waving, each continues drooling a steady stream of her unique herm-goo, filling your nostrils with the same sweet scent as before.");

	output("\n\n<i>\"Ah, yes, dessert,\"</i> she purrs, one hand reaching down to trail tenderly along her topmost shaft. <i>\"My own special recipe, sweet and juicy honey-stuffed bun-buns... care for one?\"</i>");
	pc.lust(11);
	processTime(25);
	//[BlowHer][EatHerOut][Refuse]
	clearMenu();
	//9999
	addButton(3,"Refuse",refuseDesertFromKellysWang);
}

//[=Refuse=]
function refuseDesertFromKellysWang():void
{
	clearOutput();
	output("\n\nYou shake your head at Kelly. She really has a one-track mind doesn’t she? Well, you apologise, but you’ll have to refuse her invitation.");
	//if Mischievous:
	if(pc.isMischievous())
	{
		output("\n\nYou do have to watch for your figure, plus your dentist won’t be too happy if you keep eating honey.");
	}
	output("\n\n<i>\"Aw...\"</i> she sulks, eyes drooping in disappointment, bottom lip wobbling as she pouts. <i>\"But you went and got me so horny... are you really gonna leave me like this?\"</i>");

	output("\n\nOf course you are, gotta keep her yearning for the next time, no?");

	output("\n\n<i>\"But I'm yearnin' now!\"</i> she whines, drawing her hands up into a pleading pose and batting her eyes at you. <i>\"Oh, pretty please, won't you stay for a little after-dinner fun?\"</i>");

	output("\n\nYou confidently puff out your chest. No matter how cute she is, no amount of begging is going to make you reconsider. You want her ready for next time, so you can’t afford to ‘ride her hard and put her away wet’.");

	output("\n\n<i>\"Who'd put who away?\"</i> she grumbles to herself, pouting in a sulky fashion. <i>\"Alright, fine, I guess I'll take care of this myself, then,\"</i> she says, clearly not enthusiastic about the prospect. <i>\"Some kind of manners you have; come to a girl's house, eat her food, get her all worked up, then won't help her blow off steam before you go....\"</i>");

	//if Attraction >= 75:
	if(kellyAttraction() >= 75)
	{
		output("\n\nWith a confident grin, you lurch forward, grabbing her by the shoulders and pulling her into a deep, wet kiss.");
		output("\n\nShe lets out a squeak of shock at your actions, quickly muffled by your lips wrapped around hers, then closes her eyes and melts against you, a soft sigh of delight whispering into your mouth.");
		output("\n\nYou break the kiss, as suddenly as you’ve begun. Food for thought, you tell her. Something to help her get off.");
		output("\n\n<i>\"That'll do it,\"</i> she giggles dreamily, still looking a little dopey.");
	}
	output("\n\nYou apologise, but you really should get going.");
	if(!pc.isNude()) output(" With a quick stop to gather your gear and dress up, y");
	else output(" Y");
	output("ou thank her for the food and make your way towards the door.");

	output("\n\n<i>\"Come back anytime, honey; you might be a tease, but you're still damn fine company,\"</i> Kelly calls after you before you close the door.");
	processTime(7);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[=HelpHer=]
function helpKellyFindHerHoneyThisWasntAPloyForCumPlayAtAll():void
{
	clearOutput();
	output("\n\nYou easily locate the jar and with a gentle tap on her shoulder you hold it out for her.");

	output("\n\n<i>\"Oh! Thanks, [pc.name],\"</i> she replies, reaching out and taking it from you, then turning back to the bowl of ingredients, where she pours in some honey and starts mixing it all to make a glaze. <i>\"This will take a little while to cook, so I suggest you make yourself comfortable,\"</i> she informs you.");

	output("\n\nWith a smile, you nod and tell her not to be long.");

	output("\n\n<i>\"Hey, culinary art takes time,\"</i> she smirks over her shoulder, then bends back to her task, finishing the mixing and taking it to the stove to start cooking it properly.");

	output("\n\nEventually, Kelly is finished with the glaze and has set it aside for when the meat is ready, coming out and plopping herself casually on the couch beside you.");

	//if Attraction <= 50:
	if(kellyAttraction() <= 50) 
	{
		output("\n\n<i>\"Sorry it took so long; you must have been bored stiff waiting for me,\"</i> she apologises to you.");
		//if Mischievous:
		if(pc.isMischievous())
		{
			output("\n\nYes, what kind of hostess is she? Leaving you all alone to sit on the couch?");
			output("\n\n<i>\"I know, I'm so sorry, but I'll make it up to you, I promise,\"</i> she giggles, grinning shamelessly. <i>\"Trust me, dinner will be well worth the wait.\"</i>");
		}
		else output("\n\nNot at all, is your curt reply.");
	}
	output("\n\nKelly stretches and makes herself comfortable. <i>\"So... we got time until dinner is served.\"</i> She leans over, batting her eyes at you. <i>\"Why don’t you tell me more about yourself? The brave Captain Steele?\"</i>");

	output("\n\nWell, since she’s been nice enough to invite you for dinner, you suppose you could share a bit about yourself. ");
	if(pc.isNude()) 
	{
		output(" Besides, it’s not like you got anything to hide. You stretch yourself, displaying your body in all its naked glory for her benefit.");
		output("\n\nShe openly ogles your nude form, licking her lips, but surprisingly doesn't do anything more than that, letting her appreciation speak for itself. ");
	}
	else output("\n\n");
	output("She smiles and draws herself up. <i>\"So, " + pc.mf("mister","miss") + " big, bad space explorer; what tales do you have to tell of Mhen'ga? I hear our jungles are full of all sorts of strange critters; surely someone as brave as you has met a few of them?\"</i> she grins, leaning herself against you, one breast pressed insistently against your [pc.chest]. <i>\"I've... had a bad experience or two in the woods, so I stay in town, where it's safe, but I still always wanted to know more about what's out there, ya know?\"</i> she asks, shrugging her shoulders.");
	
	//9999 build 
	var choices:Array = new Array();
	//Zil
	if(9999) choices[choices.length] = 1;
	//Naleen
	if(9999) choices[choices.length] = 2;
	//Venus Pitcher
	if(9999) choices[choices.length] = 3;
	//Cunt Snake
	if(9999) choices[choices.length] = 4;
	//Failsafe.
	if(choices.length == 0) choices[choices.length] = 0;

	var select:int = choices[rand(choices.length)];

	//if the PC haven’t met any enemies yet:
	if(select == 0)
	{
		output("\n\nYou admit, a bit awkwardly, that you haven’t been out of the city limits yourself. At least not yet.");

		output("\n\n<i>\"Oh...\"</i> she notes quietly, looking a little disappointed. Then she brightens and shrugs her shoulder. <i>\"Okay then, nevermind. I'm sure you must have other stories to tell about yourself? Maybe something from your past?\"</i> she suggests.");

		output("\n\nYou nod, of course. Now where to start....");
	}
	else
	{
		output("\n\nWell, in that case you’d be happy to tell her about your experiences.");

		output("\n\nShe draws herself up and watches you expectantly, a smile on her lips as she gleefully awaits your story.");
		//Zil:
		if(select == 1)
		{
			output("\n\nShe knows the Zil, of course. You’ve certainly seen your share of them, they aren’t exactly difficult to get around.");
			output("\n\n<i>\"Maybe for you,\"</i> she mutters a little sourly, clearly not having had such an easy time when she's encountered it. <i>\"What's your secret to handling them?\"</i> she asks, curiously.");
			output("\n\nMost people have weaknesses that can be exploited. You’ve had enough training that you’ve developed a keen eye when analyzing your enemies. It’s like you can sense what is more or less likely to work. After you got that down, it’s just a matter of exploiting it.");
			output("\n\n<i>\"Ah, just like fixing an engine,\"</i> she notes, openly proud at making the connection. <i>\"First you study it, then you break it down, then you eliminate what isn't relevant, then you fix what is,\"</i> she concludes.");
			output("\n\nYou think over the subject for a moment. Yeah, it’s somewhat like that, but not really. You’ll try to explain if she wants, but it’s not really something you can teach in short notice. You know she’s a bright girl, but that’s one of the things you only get with experience.");
			output("\n\nShe thinks it over. <i>\"...Nah, maybe some other time? But I'd love to hear more about how you 'handle' them, personally....\"</i>");
			output("\n\nNow, that’s a tale in its own right....");
		}
		//Naleen:
		else if(select == 2)
		{
			output("\n\nYou’ve met an interesting species that look like a mix of cats and snakes. Their upper halves look like humanoid cats, while their lower halves is like a snake.");
			output("\n\n<i>\"Half snake, half cat? That's a pretty weird look,\"</i> Kelly notes. <i>\"So, what do they do when you meet them?\"</i>");
			output("\n\nYou explain that they’re quite predatory. The ones you’ve met are mostly hunters, and if they get you... well... they live in a forest, surrounded by zil pheromones. It’s not too difficult to imagine what they do when they catch their prey.");
			output("\n\n<i>\"Figures,\"</i> she notes, a wry smile on her lips as she nods.");
			output("\n\nThey are not likely to come close to the city though. From what you gather, they prefer to be sneaky, so it’s not likely they’d expose themselves.");
			output("\n\n<i>\"I... guess that's good to hear,\"</i> she admits, looking distracted.");
			output("\n\nYou begin to recount the details of your encounter, warning her about the dangers one might pose....");
		}
		//Venus Pitcher:
		else if(select == 3)
		{
			output("\n\nYou’ve seen a curious plant. It tries to lure you using a bait that looks like a girl so it can trap you into a pod and have its way with you.");
			output("\n\n<i>\"Whoa... horny plants? That's weird.\"</i> she notes, furrowing her brow in thought. <i>\"But the girls they use... are they cute?\"</i> she asks you eagerly, looking excited at the thought.");
			//if PC has ever fallen for it:
			if(flags["TIMES_CAUGHT_BY_ELDER_VENUS_PITCHER"] != undefined)
			{
				output("\n\nPositively enthralling, you tell her.");
				output("\n\nShe raises an eyebrow, clearly intrigued. <i>\"Oh, really? Tell me more...\"</i> she purrs, snuggling up against you. <i>\"Maybe you can introduce me to one sometime; sounds like it'd be fun....\"</i>");
				output("\n\nYou idly begin to detail your encounter with their kind....");
			}
			else
			{
				output("\n\nYou confess you’re not sure. You hear they are quite a sight. Most people wind up drawn to them, anyway. But you’ve always avoided them; you’re not keen on falling into any traps after all.");
				output("\n\nShe bursts out laughing, then forces herself to choke it back. <i>\"Sorry, sorry, you just... I just had the funniest joke come to mind,\"</i> she giggles. <i>\"But alright; maybe you can tell me where you've seen them? Give me clues on how to recognize them?\"</i>");
				output("\n\nWhy? Is she going to go looking for one?");
				output("\n\nShe adopts an innocent expression. <i>\"Maybe...\"</i> she says.");
				output("\n\nYou chuckle at that. Alright then, she’s a big girl, she can go look for trouble anywhere she wants to. You idly begin detailing what you know about them....");
			}
		}
		//Cunt Snakes:
		else if(select == 4)
		{
			output("\n\nThere are a few parasitic snakes commonly known as cunt snakes. They got a nasty bite.");
			output("\n\n<i>\"I can imagine,\"</i> she says, wincing. <i>\"But why do they call them cunt snakes? Sounds like they crawl up inside girls' pussies and make nests in there,\"</i> she seems rather grossed out by the notion.");
			output("\n\nYou shake your head. You explain that it’s actually because they have what looks like a pussy on their other end.");
			output("\n\n<i>\"...That's one reason to call them that,\"</i> she admits, clearly trying to picture that in her head. <i>\"But you said they were parasites? How do they work?\"</i>");
			//if Cunt Tail:
			if(pc.hasCuntTail())
			{
				output("\n\nYou admit you’ve been victimized, displaying your cunt-tail for her perusal.");
				output("\n\nShe looks it over intensely, a mixture of surprise, curiosity and perverse interest in her eyes. <i>\"Wow...\"</i> she reaches out and tries to take hold of it, wanting to examine the mock-pussy that is your tail-tip.");
				output("\n\nYou gasp as her fingers touch the opening to your prehensile, pussy-tipped tail. It’s sensitive!");
				output("\n\n<i>\"So I see,\"</i> she giggles. Gently she lifts it towards her face, closing her eyes and sniffing at the orifice opening. <i>\"Smells just like a real pussy,\"</i> she notes, then extends her tongue and begins to playfully trace it over your tail's netherlips.");
				output("\n\nYou gasp and let out a small moan as you feel her licking your tail-end.");
				output("\n\n<i>\"Tastes just like one too,\"</i> she laughs, withdrawing her slurping appendage. <i>\"But what about the tail itself? The pussy obviously works, but can you feel this?\"</i> she asks, even as she strokes your tail's length, as if masturbating some especially long cock.");
				output("\n\nYes, it’s completely melded with you. But feeling her stroke your tail like that doesn’t feel nearly as good as having her toy with the pussy.");
				output("\n\n<i>\"I see... maybe your tail and one of my dicks can get acquainted, sometime?\"</i> she suggests, brushing your tail-cunt against her glans for emphasis, but letting go so you can take your tail back.");
				output("\n\nYou shudder at the sensation of being almost penetrated. You’ll think about it, you tell her. But for now, why don’t you tell her how, exactly, you came to posses a cunt-tail?");
				output("\n\n<i>\"That sounds fun,\"</i> she notes, though she can't resist casting a hopeful glance in your tail's direction.");
				output("\n\nYou begin to recount the details of your encounter....");
			}
			//else if no dick:
			else if(!pc.hasCock())
			{
				output("\n\nThey leave you alone for the most part, tho. Apparently they are only interested in people with dicks.");
				output("\n\n<i>\"I guess that makes sense,\"</i> she notes, nodding her head. <i>\"I guess I'd be a pretty tempting target for them, huh?\"</i> she jests, a little weakly at the thought.");
				output("\n\nNo kidding, you state. You begin to recount your encounter, warning her not to go looking for one....");
			}
			else
			{
				output("\n\nA few have tried to attack you, but you dealt with them just fine.");
				output("\n\n<i>\"That doesn't surprise me at all, honey; you look just like someone who can take care of themselves,\"</i> the laquine purrs, leaning against you again, one hand delicately tracing a circle on your [pc.chest].");
				output("\n\nYes, indeed. You ask if she wants to hear how you’ve dealt with them in the past?");
				output("\n\nShe nods her head excitedly at the prospect, snuggling up against you to listen.");
				output("\n\nYou begin to recount the details of your encounter....");
			}
		}
		output("\n\n<i>\"Hi honey; miss me?\"</i> she giggles, draping an arm over your shoulder and snuggling close to you, her breasts pushing against your own [pc.chest].");

		output("\n\nYou reach down to cup one of her breasts, giving it a quick grope. Your other hand reaching around her to hug her and bring her chin up so you can give her a friendly peck on her lips.");

		output("\n\nShe lets out an appreciative mumble as your fingers close over sensitive titflesh, gladly letting you lean in to kiss her. Her arms wrap themselves over your shoulders, pulling you tighter against her body as she deepens the kiss, her zil-like tongue probing insistently at your [pc.lips], looking for the slightest weakness to slide inside.");

		output("\n\nYou accept her and move your other hand to her breast. You cup both orbs, hefting and massaging them; every now and then you give her nipples a little tug, earning an excited squeak out of your laquine lover.");

		output("\n\nWith a pleased hum she shifts on the couch, falling over onto her back and dragging you down with her, her long, powerful legs wrapping themselves around your waist to hug you closer to her. ");
		if(!pc.isNude()) output("Her twin shafts brush against your [pc.crotchGarments], warm enough that you can feel a sense of heat against your [pc.belly] even through them.");
		else output("Naked as you are, there is nothing to keep her shafts pushing against your [pc.belly], hot and hard against your [pc.skin].");
		output(" She keeps kissing you, tongue squirming as it wraps affectionately around your own [pc.tongue], then slurps lewdly out between your lips as she breaks the kiss, eyes half-closed and chest heaving as she pants for breath. Her arms move and pull you down against her, burying your face squarely in her cleavage. <i>\"Oh, I do love it when you want to play,\"</i> she giggles, smooshing your face a little deeper into her tits, then smirking down at you.");

		output("\n\nYou take advantage of your position to attack her pillowy mounds, nuzzling and gently nipping her erect nubs.");

		output("\n\nShe moans and gasps, arching her back, her buttons stiff and firm against your lips, shafts hot and hard against your belly. <i>\"Mmm...somebody wanna have some fun while we wait for supper?\"</i> she suggests, licking her lips and giggling at the thought. Her hands stroke their way down your back to give the cheeks of your [pc.ass] an inviting squeeze.");

		output("\n\nMight as well. She looks like she needs it and you want it too, just have to be careful not to let the ham burn, or you’ll have to find something else to eat.");

		output("\n\nKelly titters at that, then leans in for another kiss....");
	}
	output("\n\nTime passes quite enjoyably, and soon enough, the two of you are in the kitchen, dishing up hearty servings of glazed ham and salad, grabbing some cutlery from the drawers before heading back to the table to eat.");

	output("\n\nDespite what one might think, Kelly certainly knows how to set a table. A beautiful floral-printed green tablecloth covers a richly polished table of local hardwood, chairs of the same and engraven with floral and vine designs positioned around it. She's set out two plates, actual old-fashioned china, each delicately painted with alien symbols and plants, and beside each are knives and forks that are either real silver or highly polished stainless steel. A high fluted glass vase containing some of the local blooms takes pride of place near the center of the table.");
	if(kellyAttraction() >= 50) output(" An antique-looking candlestand, lit by a single gently burning candle, has been placed at the end of the table where the two of you will be sitting, and the lights have been dimmed just enough to make its own light visible.");

	//1st time:
	if(flags["KELLY_HAD_A_MEAL_SHARED"] == 0) output("\n\nYou admire the whole set up, nodding as you take a step to pull your chair. That’s pretty fancy, you comment. Far more than you expected anyway.");
	else output("\n\nAh, Kelly; she's never going to change, is she? Such a contradictory creature, she is. You can't help but let your feelings show on your face.");

	output("\n\n<i>\"What? You think just because I like a bit of casualness in life I'm completely unsophisticated?\"</i> she giggles, then moves to pull out her own chair, stopping before actually seating herself. <i>\"Ah, guests first?\"</i> she suggests with a smile, indicating your seat with her hand. <i>\"That's what my mom always said.\"</i>");
	output("\n\nSeeing no reason to refuse her invitation, you take your seat, place your serving in front of you, and patiently wait for her to take hers. Happily she flops down into her seat and pulls herself in to the table. <i>\"Alright! I'm so hungry... I was starting to wonder just how long this stupid ham was gonna take to cook,\"</i> she pouts, her belly grumbling as if in emphasis.");

	output("\n\nYou exchange smiles and promptly dig in. The ham is delicious, you compliment Kelly on her recipe.");

	output("\n\n<i>\"Thank you!\"</i> she beams, already forking up a big piece for herself. <i>\"I'm quite proud of my cooking - I didn't go to home economics class for nothing, I'll have you know,\"</i> she jokes, then gobbles down her forkful.");

	output("\n\nThe rest of the meal passes mostly in silence. Of course, there’s always some time for small-talk, but the both of you focus on filling your respective bellies whilst enjoying each other’s company.");

	output("\n\nIt doesn’t take long for you to finish stuffing yourself. You drain the last of your drink and sigh, completely satisfied for the moment. Once more, you compliment Kelly’s cooking.");

	output("\n\n<i>\"You're welcome,\"</i> she tells you, hiccups, then giggles. <i>\"Sorry, ate a bit too fast there,\"</i> she apologises, then climbs to her feet. <i>\"Just sit back and relax, honey. I’ll just clear the table and be with you in a second,\"</i> she tells you, blowing you a kiss. Then she sets about gathering up her cutlery and taking yours, stacking it atop hers and strutting off to the kitchen, humming contentedly as she goes.");
	processTime(35);
	//[HelpHer][Relax]
	clearMenu();
	addButton(0,"HelpHer",helpKellyCleanUpAfterDindinsWithNormalHoney);
	addButton(1,"Relax",relaxAfterEatingRegularHoneyMealWithKelly);
}

//[=HelpHer=]
function helpKellyCleanUpAfterDindinsWithNormalHoney():void
{
	clearOutput();
	output("\n\nYou decide you’d rather help her get the dishes done. It’s the least you can do, besides you can relax with her later.");
	output("\n\nKelly pauses, looking back at you in surprise. <i>\"You wha-?\"</i> she starts, then shakes her head and grins. <i>\"Why, thank you, honey... or do you have some ulterior motive in mind, hmm?\"</i> she grins and pokes her tongue out at you teasingly, then continues on to the kitchen; if that is the case, it clearly doesn't bother her.");
	output("\n\nYou go after her, rolling your eyes at her antics.");

	output("\n\nKelly places the dirty things in the sink and starts to fill it. <i>\"I'll wash, you dry; okay by you?\"</i> she asks, moving over slightly to give you room to join her.");
	//Mischievous:
	if(pc.isMischievous())
	{
		output("\n\nYou get in position, smiling mischievously as you give her hips a nudge with your own, pushing her slightly as you grin.");
		output("\n\nShe meets your grin with one of her own, returning your hip bump. <i>\"Down, " + pc.mf("boy","girl") + "; time for that after we're done,\"</i> she giggles.");
		output("\n\nNot being one to back down from a hip-bump fight, you throw her off again.");
		output("\n\nThe return bump is much harder, enough to make you rock back a step, Kelly grinning mischievously as she does. <i>\"Whoops,\"</i> she says, clearly not apologetic at all.");
		output("\n\nSo that’s how she wants to play, huh? Well two can play that game! You bump her right back.");
		output("\n\nShe lets out a grunt of surprise, giggling as she resettles herself. <i>\"Alright, alright, truce! Before I end up falling into the sink.\"</i>");
		output("\n\nFine, fine. You’ve had your fun... for now.");
	}
	//Kind:
	else if(pc.isKind())
	{
		output("\n\nNonsense, you can take care of everything by yourself.");
		output("\n\n<i>\"Don't tempt me,\"</i> she drawls, then grins. <i>\"But thanks for the offer,\"</i> she adds, before plunging her hands into the soapy water.");
		output("\n\nWell, you tried. You give her back an appreciative tap as you wait for her to handle you the dishes to dry. She smiles at the gesture and sets to work at a leisurely yet productive pace.");
	}
	else
	{
		output("\n\nYou nod and get in position.");
	}
	output("\n\nThings go smoothly, and in no time you’re both finished.");

	output("\n\n<i>\"And done,\"</i> she says with a grin as the last piece is put away, the sink giving out a final gurgle as the last of the water runs down the drain. <i>\"Thanks for the help, sweet thing,\"</i> she says, turning to face you. <i>\"I think somebody's earned themselves a little reward...\"</i> she purrs as she says this, arms draping over your shoulders, one leg tucking itself up behind her as she bends in and kisses you sweetly on the lips. She holds you there for a moment or two, then lets you go and steps back. <i>\"But I don't feel like doing anything in the kitchen now... how about we go back to the living room?\"</i> she suggests.");

	output("\n\nSeeing no reason to refuse, yet. You agree to go with her.");

	output("\n\nShe smiles and struts towards the door, wiggling her bouncy bunny butt with deliberate seductive intent as she goes.");
	postMealEpilogue();
}

//[=Relax=]
function relaxAfterEatingRegularHoneyMealWithKelly():void
{
	clearOutput();
	output("\n\nNodding, you head over to her couch, plopping down and sighing as you lean back and close your eyes for a spell.");
	output("\n\nKelly carries on into the kitchen nonplussed, and from within you can hear the sounds of running water and dishes being scrubbed. Soon enough, she finishes her tasks and comes out to join you.");
	postMealEpilogue();
}

//Both choices join here
function postMealEpilogue():void
{
	output("\n\n<i>\"Well, honey... since dinner went down so smooth, how about some dessert before you go, hmm?\"</i> Kelly's voice is husky with desire as she suggests this, one hip outthrust, shafts rising shamelessly before her, one hand kneading her breasts with abandon as she awaits your decision.");
	processTime(12);
	//Display Sex Scene options, PC gains a boost to Attraction (say, 15, 20?)//
	//9999
}

//Flirt
function flirtWithKellyUnknown():void
{
	clearOutput();
	output("\n\nKelly's lips curl into a faint grin and she closes her eyes, giving her head a small shake. <i>\"Aw, surely you can do better than that, honey? Don't I deserve a little more attention than that?\"</i> she teases you, opening her eyes as she awaits your response.");
	//[Aggressive][Mischievous]
	//9999
}

//[=Aggressive=]
function aggressiveFlirtingWithKelly():void
{
	clearOutput();
	output("\n\nSo, she wants more? You’ll give her more....");
	output("\n\nWithout saying a word, you get up, knocking ");
	if(!pc.isTaur()) output("your chair");
	else output("a nearby chair");
	output(" on the floor as you advance on her. With one hand, you grab a luscious breast, pulling her bikini up as you pinch her nipple. Your other hand undoes the button to her jean shorts, forcing her zipper down as you grasp a cock.");

	output("\n\nKelly gasps in shock, mouth falling open at your boldness. <i>\"[pc.name]-\"</i>");

	output("\n\nYou silence her with a rough kiss, not waiting for her to come to terms with your actions as you thrust your [pc.tongue] into her maw.");

	output("\n\nA muffled moan reverberates along your [pc.tongue], Kelly's eyes sinking closed as she enjoys your dominance of her mouth, her cock growing hard and firm under your fingers... but then her eyes spring open and she shoves back against your chest, pushing you out of her mouth. <i>\"Whoa, honey, stop it!\"</i> she protests. <i>\"Not that I don't like you when you're forceful, but Burt promised he'd throw me out on my cute little ass for life if I messed up his bar again - and this is the only bar on the planet!\"</i> she gasps in dismay. <i>\"Why don't you let me take you home, huh? We can make as much mess as we want there...\"</i> she purrs seductively, changing from pushing you away to cuddling meaningfully up against you.");

	output("\n\nYou pull back, zipping her jeans back up and pulling her bikini top down on her nipple again. Fine, but she’d better be quick, or you’ll pull her pants down and have your way with her on the street.");

	output("\n\nShe lets out a lusty chuckle at that. <i>\"You do say the sweetest things, honey... come on, let's make tracks,\"</i> she says, climbing to her feet and heading for the door.");
	//9999
}

//[=Mischievous=]
function mischievouslyFlirtingWithKelly():void
{
	clearOutput();
	output("\n\nBetter? Well if she says so....");

	output("\n\nYou get back on your {feet} and proceed towards the nearest group of stranger you can find.");

	output("\n\n<i>\"Hey, wait!\"</i> Kelly splutters indignantly, springing to her feet and slamming her hands angrily on the table behind you. <i>\"You can't just walk up to me and then go chasing some other piece of tail!\"</i> she protests. <i>\"I thought you wanted me?!\"</i>");

	output("\n\nShe said you could do better, who are you to dispute? You smirk.");

	output("\n\n<i>\"Better than me? As if! Nobody here's better than me! You just come back home with me and I'll prove it!\"</i> she snaps, drawing herself upright with all the wounded pride she can muster.");

	output("\n\nYou shrug, if she’s so sure she wants you, fine. You smile.");

	output("\n\n<i>\"You bet your sweet ass I... oh, you dirty little; you just played me, didn't you?\"</i> Kelly asks , realisation visibly dawning on her face. <i>\"Oh, well-played, " + pc.mf("sir","madam") + ", well-played indeed,\"</i> she giggles, clearly amused at how you tricked her. A coy look in her eyes suggests she's plotting how to get you back for that, as she starts strutting proudly towards you. <i>\"C'mere, you; you want me, you got me... or do I have you?\"</i> she suggests, taking your hand and dragging you towards the door.");

	output("\n\nYou chuckle. You don’t know, does she?");

	output("\n\nShe grins at you, hungrily looking you down. <i>\"We'll see when we get home, honey....\"</i>");

}

//Both options rejoin here//
function kellyBarFlirtContinuation():void
{
	clearOutput();
	output("\n\nAs a young frontier town, it doesn't take long to reach Kelly's home, a prefabricated bungalow. Despite being prefabricated, it's roomy enough, with separate rooms for kitchen, living room, bathroom and bedroom. Kelly's taken steps to make it more \"homey\", but you don't get much of a chance to observe these; the moment you are inside, she turns and hungrily kisses you, rubbing herself against your front and letting you feel her erections and the hardness of her nipples as she grinds on you.");

	output("\n\nYou push the amorous laquine away for a moment. You can’t get to the good bit if she’s still dressed.");

	output("\n\nShe pants heartily in her lust, swallows, and nods dumbly in agreement, stepping back and holding still to let you take her clothes off.");

	output("\n\nYou immediately work the button on her jeans shorts and pull the zipper down. You don’t even have to pull it down yourself, as her erections jump up like accusing fingers, knocking her lower garments down as they begin to bead. She’s really looking forward to this, huh?");

	output("\n\n<i>\"Gee, and here I thought I was always this horny,\"</i> Kelly replies, her sarcasm less than effective when she giggles at it a heartbeat later. Evidently she's not content to wait for you, though, as her \"top\" promptly drifts to the floor beside you. <i>\"There I am... so, do I get to return the favor?\"</i> she asks, licking her lips.");

	output("\n\nIt’s not like you have anything to hide, you smile.");

	output("\n\nShe smiles back and steps in closer to remove your [pc.gear]; she doesn't rip it off of you, like you might have expected, but she visibly savors everything that is revealed, tongue darting out to caress your [pc.nipple] as she makes her way down your chest, loudly inhaling your musk as she exposes your loins. <i>\"Mmm... much better,\"</i> she declares, standing up again. <i>\"So, honey, had anything in particular in mind, now that we're here...?\"</i>");
	//Display sex options//
	//9999
}