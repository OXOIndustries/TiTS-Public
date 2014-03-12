//Appearance
function kellyAppearance():void {
	clearOutput();
	userInterface.showBust("KELLY");
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
	if(9999 == 9999) output("\n\nShe is wearing a formal suit, as befits a representative for the Xenogen Corporation. A subtle and refined piece, it wouldn't go out of place on any businessman or woman. Seated behind her desk as she is, you cannot see her lower torso, but even the formal tone of her suit and her tie fails to completely obscure the impressive DD-cup swell of her bosom.\n\nA soft cough draws your attention back to her. <i>“" + pc.mfn("Sir","Madam","Excuse me") + "? May I help you?”</i>");
	//If OffWork:
	else {
		output("\n\nNo longer having to worry about office image, Kelly is letting it all hang out - quite literally. Her top is straining the limits of the word \"bikini,\" little more than triangles of fabric stretched over her perky nipples and held in place by straps that crisscross over her impressive DD-cup tits. For pants, she is wearing the cut-short denim jeans you have heard of as \"Daisy Dukes,\" which seem to be just barely big enough to fit her and leave nothing to the imagination regarding her perky, full, squeezable ass. Or her gender.\n\nDespite the feminine nature of the rest of her body, the front of her shorts bulges obscenely, straining to cover a clearly monstrous masculinity, stretched so tight it gives her a blatant camel-toe. Yet, somehow, it manages to do so without bursting its zipper.");
		if(flags["KELLY_SEXED"] != undefined) output(" You know from personal experience that her shorts are concealing a truly incredible array of sexual organs; a vagina, two cocks, and four balls. Her vagina is deep and wet, yet wonderfully flexible and tight. Her balls are the size of grapefruit, and her cocks, whilst normally 12\" long by 2\" horse-like shafts, can grow up to 36\" long and 4\" thick if she neglects her medication and lets herself get aroused.");
		output("\n\nShe giggles, drawing your attention back to her smiling face. <i>“You know, it’s not very fun if you just sit there gawking at me. How about we do something else? Hmm?”</i>");
	}
	//Display options//
	kellysOfficeMenu();
}

//At Xenogen Research Labs
//In The XRL Reception Hall
function kellysOfficeBonusFunction():Boolean
{
	userInterface.showBust("KELLY");
	author("Quiet Browser & LD");
	//If Player has not met Kelly Yet:
	if(flags["KELLY_MET"] == undefined) {
		output("\n\nA strange figure is seated behind the receptionist counter; a bipedal female humanoid who looks... well, like an anthropomorphic rabbit. But with a vaguely bee-like fur pattern of black stripes on yellow, offset by honey-orange hair. Maybe she's one of those furry gene-modders?"); 
		if(flags["MET_PENNY"] != undefined) output(" Like Penny?");
		output(" She calls for you to approach.");

		//1st Time:
		output("\n\nYou walk over to the rabbit-like receptionist, currently busy going over some files. One flopping ear, nearly hidden amongst the lush strands of honey-orange hair she has, twitches as you approach and she looks up towards you with a beaming smile. \"<i>Why, hello there, and welcome to Xenogen Research labs, where the wonders of biotechnology never cease! My name is Kelly, the receptionist - how may I help you today?</i>\"  though her words are professional and welcoming, her tone is sincerely chirpy and friendly, suggesting she's quite happy to see you.");
		output("\n\nHer fingers tap away at the keyboard and she scans the screen professionally. <i>\"Hmm... I see we don't have your ID in our registry. Before we can allow you into the building or offer any kind of services to you, we require that you fill out a registry form, " + pc.mf("sir","madam") + ". Would you like to register now, " + pc.mf("sir","madam") + "?”</i>");
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
	author("Quiet Browser & LD");
	output("Kelly looks up at your approach, smiling to see you with her usual chipper attitude. \"<i>Welcome back to Xenogen Research labs, where the wonders of biotechnology never cease! How may I help you, ");
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
	author("Quiet Browser & LD");
	addButton(0,"Appearance",kellyAppearance);
	addButton(1,"Talk",talkToKellyInOffice);
	addButton(14,"Leave",mainGameMenu);
}

//[=No=]
function dontRegisterInKellysOffice():void {
	clearOutput();
	userInterface.showBust("KELLY");
	author("Quiet Browser & LD");
	output("You apologize, but you don’t feel like registering now, so you’ll be leaving.");
	output("\n\n<i>“I understand sir, Xenogen thanks you for your visit. Please come again.”</i> she says with a polite smile and a nod, indicating the door.\n\nYou walk out.");
	//Leave the area and redo everything in case the PC comes back.
	
	clearMenu();
	addButton(0,"Next",move,"SOUTH ESBETH 2");
}

//[=Yes=]
function registerAtKellysOffice():void {
	clearOutput();
	userInterface.showBust("KELLY");
	author("Quiet Browser & LD");
	flags["KELLY_MET"] = 1;
	output("Sure thing, you reply.");
	output("\n\n<i>\"Excellent. Now, if you would just give me your name, " + pc.mf("sir","madam") + ",\"</i>  she begins....");
	output("\n\nYou follow her instructions, and after a short while you are finished with your registration.");
	output("\n\n<i>\"And finished,\"</i>  she says brightly. <i>\"Xenogen welcomes you, " + pc.mf("Mister","Miss") + " Steele, to their family. You now have full access to all services that we provide here at Xenogen labs. How may I assist you further?\"</i>");
	processTime(3+rand(3));
	//Display Kelly at Xenogen Options//
	kellysOfficeMenu();
}

//Talk
function talkToKellyInOffice(display:Boolean = true):void {
	if(display)
	{
		clearOutput();
		output("\"<i>A friendly chat?</i>\"  Kelly repeats. \"<i>Well, sure, I suppose I could use a short break anyway. What do you want to talk about?</i>\"");
	}
	userInterface.showBust("KELLY");
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
	author("Quiet Browser & LD");
	output("<i>“Now, now.”</i>  She waves a finger at you. <i>“Aren’t you getting a little ahead of yourself?”</i>  She smiles disarmingly.");
	output("\n\nYou apologise, you didn’t mean to offend her. You were just interested in getting to know her a little better.");
	output("\n\n<i>“Flirting at work is forbidden, you know? How about you catch me off the clock? Then you and I can get to know each other a bit better,”</i>  she smirks.");
	output("\n\nYou nod and tell her you’d like that.");
	output("\n\n<i>“Excellent, now... anything else?”</i>  She bats her eyes.");
	//Kelly at the Mead Hall unlocked
	//Revert to default Kelly options
	talkToKellyInOffice(false);
	removeButton(0);

}

//Role at XRL
function talkToKellyAboutHerRoleAtXenogen():void
{
	clearOutput();
	output("\"<i>My role here at Xenogen? Well, that's an easy question,</i>\"  she giggles. \"<i>I'm basically a receptionist - you know, I interact with customers, handle intra-office mail, generally try and keep the place running smoothly down here on the ground level, you know?</i>\"  she shrugs her shoulders and grins, unabashed by her rather low-level position. \"<i>I suppose the most interesting part of my job is the mod dispensing,</i>\"  she adds.");
	output("\n\nWhen you ask what that means, she puffs her chest out proudly and launches into her explanation. \"<i>Here at Xenogen, we make a wide variety of modifications. Many of our clients come for personally customised changes and transformations, but we do get a significant amount who ultimately are after the same sorts of basic mods. These popularised \"com-mods\" are so frequently requested that we have them stocked and ready. I'm empowered to sell these basic mods literally over the counter to people who are willing to pay the credits for them.</i>\"");
	output("\n\nShe then smiles at you playfully. \"<i>So, are you interested in buying anything?</i>\"");
	//Display default Kelly menu options
	talkToKellyInOffice(false);
	removeButton(1);
}

//Working Here
function talkToKellyAboutWorkingHere():void {
	clearOutput();
	output("\"<i>Are you asking how I came to be working here, or if I like working here?</i>\"  She giggles, batting her eyelids at you playfully. \"<i>Well, I suppose I can answer both...</i>\"  she pokes her tongue out at you momentarily, then looks more serious.");
	output("\n\n\"<i>I basically hitchhiked my way here after my old ship broke down - stupid overpriced lame piece of crap conked out a couple of systems over. I hocked it for scrap and started thumbing my way; wound up left here because of my last jerkwad captain - probably because I wouldn't sleep with her, the damn size-queen bitch,</i>\"  she grumbles at the memory. \"<i>I still had enough credits to get a cheap place to stay, but they weren't going to last forever, and I didn't want to be stuck on this rock permanently, so I started looking around. Xenogen was offering a receptionist position, and I took it.</i>\"");
	output("\n\n\"<i>As for working here,</i>\"  she shrugs her shoulders with an amiable smile. \"<i>I don't intend to stay here forever, I'm saving up credits to buy a new little starrider of my own when I can, but it's a nice enough job. Good pay, good hours, fairly simple work, I'm out of the worst of the heat, and I even get something of an employee's discount on buying my own mods,</i>\"  she tells you, then claps her hands sharply. \"<i>So, that's that done, anything else I can help you with?</i>\"");
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
	output("\n\nShe looks back at you with an amused expression. <i>“I’m better now that you are here. I’ve been bored here, all by myself, for a while now.”</i>  She smiles.");
	output("\n\nSlow day, huh?");
	output("\n\n<i>“Yeah....”</i>  She stretches herself on her chair, popping her shoulders in the process. <i>“So why exactly are you here? Fraid you haven’t told me what you are up to yet, honey.”</i>");
	output("\n\nYou were wondering if she’s up for some <i>fun</i>.");
	output("\n\nA knowing smirk spreads on her lips, but she shakes her head. <i>“Sorry, honey, but I’m strictly forbidden from flirting at work. And I do like this job enough that I don’t care for getting fired, but if you wait until later I’d be happy to continue this train of thought.”</i>");
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
	output("\n\n<i>\"Don't worry, [pc.Name], I promise you I'll make it worthwhile,\"</i>  she purrs, and winks. <i>\"Now, how else may I help you?\"</i>");
	//(Display Options)
	kellysOfficeMenu();
}

//[=FlirtAnyway=]
function flirtWithKellyAnyway():void {
	clearOutput();
	output("You are not taking no for an answer. Without giving her time to react, you grab her by the shoulder and draw her into a kiss.");
	output("\n\nStunned, she doesn’t put up any resistance as you thrust your [pc.tongue] into her mouth, tasting her as you maneuver yourself over her table.");
	output("\n\nShe almost starts kissing you back before she comes to her senses and pushes you back. <i>“[pc.name]! What the hell!? I already told you we can’t flirt-”</i>  You silence her with a finger, not bothering to grace her with reply. You want her, and you want her now! As a matter of fact... you know she wants you too, if the bulge in her skirt is any indication.");
	output("\n\nYou duck under her table, ");
	if(pc.reflexes() >= 40) output("nimbly unfastening her belt, ");
	else output("struggling a bit before you can get her belt undone, ");
	output("and pulling her skirt down.");

	output("\n\nHer twin erections spring out of the once-restraining fabric, bouncing eagerly into place before you, already starting to ooze an orangey syrup-like precum from their flat heads, a sweet scent wafting from them. She moans plaintively. \"[pc.short], seriously… we can't... I can't get caught,\"</i>  she protests.");

	output("\n\n<i>“Then you’ll just have to stay quiet and pretend nothing is happening,”</i>  you reply without a care. Now to give these tasty morsels before you the treatment they deserve….");
	output("\n\nShe bites her lip at that, visibly wrestling with the dilemma before her. On the one hand, she clearly does fear for her job. On the other hand, that this has her turned on is as obvious as the straining cocks in your hands. <i>\"I... oooh, alright. Make sure no one spots you,\"</i>  she says, sliding her chair forwards in an attempt to further conceal you, unintentionally thrusting one of her flared tips against your lips.");
	output("\n\nYou knew she’d come around. Casually, you extend your tongue to lap off a dollop of syrupy pre off her offered cock, earning yourself a barely suppressed moan from above your head, a quiver racing down Kelly's body and visibly shuddering through her shafts.");
	output("\n\nEmboldened, you lean forward to meet the tip of the closest dick and gently lap at its blunt glans with your [pc.tongue], allowing the strange, sweet, sugary taste of her pre-cum to roll across your tongue. Finding it to your liking, you gently continue to lick it, switching over to her second cock to catch the precum dripping from it when the first one is rendered momentarily clean. Kelly makes no sound, and you can just envision her biting her lip to keep from doing so, but her enjoyment is made quite clear.");
	output("\n\nWithout further ado, you guide her tip into your mouth and engulf it within your warm mouth. A moaning sigh escapes her, a spurt of sweet syrup entering your mouth. The taste of it assaults your senses with sweetness from her pre-cum, tinged with the salt from her skin. You caress the length in your mouth with your [pc.tongue], moving your [pc.lips] as you bob your head gently back and forth. Your hands, now freed, stroke the other shaft in rhythm so that it won't get lonely while you tend to this one.");
	output("\n\nShe bites back any noises she may be tempted to make, but from the way she twitches and the firmness of her dick in your mouth, you know she's enjoying this. Her second cock butts insistently against your chin, as if demanding you pay attention to it too.");
	output("\n\nHaving tasted enough of her first horsehood, you decide to switch to the other and give it the same treatment, tasting more of her sweetness as you do so.");
	output("\n\nShe does moan at that, softly, but then stiffens - and not in a way that shows she's enjoying the feel of your tongue on her hot flesh. <i>\"[pc.name]! Ix-nay on that! Somebody's here,\"</i>  she hisses to you urgently. <i>\"Why, hello there, and welcome to Xenogen Research labs, where the wonders of biotechnology never cease! My name is Kelly, the receptionist - how may I help you today?\"</i>  she says in the same professional yet friendly tone she first used when you arrived - clearly addressing this to her new customer.");
	output("\n\nYou consider stopping for a moment… but what would be the fun in that? Besides, you're too absorbed in your task to bother stopping now. You release her current cock and immediately engulf the other one, continuing your switcheroo blowjob.");
	output("\n\nKelly's whole body twitches, but she somehow avoid letting out anything other than a tiny squeak when you switch over. <i>\"Y-you're here for your appointment sir - er, madam? Yes, of c-course I can he-elp you,\"</i>  she says, struggling to keep her words level and even despite your assault on her tender parts. One foot delivers a pointed kick to your ribs, not hard enough to hurt, but enough to warn you not to push her further.");
	output("\n\nYou cough around her cock at the kick. Not too happy, you release her cocks and grab the offending foot instead. Then, With an evil smirk, you begin tickling between her toes.");

	output("\n\n<i>\"Ach! Ah - no! No, I'm fine, madam! J-just a slight cramp in my legs,\"</i>  Kelly says desperately, trying to wriggle her foot out of your hand... though that might just be her jolting around as you tickle her. Looks like you've caught a sweet spot for doing that to her....");
	output("\n\nYou let go of her foot, confident she won’t kick you again, and resume your sucking and massaging of her cocks.");

	output("\n\nThe sound of Kelly's fingers flying across her keyboard can be heard, and she comments with open relief. <i>\"Ah, here you are, madam. Please, follow the green line to reach your destination,\"</i>  she informs her customer. Her voice quivers a little, but evidently she pulled it off, as you can hear her customer leaving. <i>\"Oh, gods...\"</i>  she whimpers quietly, her self-control crumbling under your pleasurable onslaught.");

	output("\n\nYou feel her cocks throb in your grasp; looks like she doesn’t have long. With that in mind you switch again and redouble your efforts. As your mouth envelops and caresses the second dick, your hands move, fingers teasingly trailing down both of the laquine's engorged lengths to reach her inhumanly stuffed sac. Four nuts the size of grapefruits sway under your caressing fingers, black fur stretched taut over their liquid contents. Even as you suckle hungrily at each dick in turn, your fingers stroke her swollen balls, sliding underneath to find the dampness of her pussy, which ripples invitingly at the touch of your fingers. You stroke her plump netherlips, feeling them drool her slick lube across your fingers, then gently slide them in - ah!");
	output("\n\nShe was waiting for that, it seems. You feel her cunt clench down around your fingers, uncaring of the fact they are not a prick, squeezing you tightly and rippling around you as if trying to milk you of the semen that your digits do not, in fact, have. You wriggle them inside of her as best you can, as much to try and find a way to slip free of the silken vice they are trapped in as to pleasure her. She visibly quakes and shudders, grapefruit-sized balls swaying back and forth, cunt spasming and opening wide enough to let you pull your fingers free.");
	output("\n\n<i>\"C-can't hold it back,\"</i>  she moans, her whole body twitching as she fights against the inevitable. You hear her clattering around the contents of her desk as she grabs for something, before her hand thrusts itself into view, an abnormally large-sized coffee-mug in her grip.");
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
	output("\n\n<i>\"Oh... gods, gods, gods,\"</i>  she whines softly as her impressive balls finally empty themselves, her shafts going soft. She gestures for the mug and you hand her the sticky, slowly sloshing cup to her, whereupon she lifts it back out of sight. She pants heavily and repeatedly, slowly catching her breath as she comes down from the pleasure of her climax.");
	output("\n\nHappy that you brought your laquine lover over the edge, you crawl away and emerge from under her desk with a pleased smile of accomplishment.");
	output("\n\nShe just sits there for a moment, eyes looking at you as you stand up again. When you get close enough, though, her hand shoots out like lightning, cracking audibly against your cheek. <i>\"Jackass! Just what were you thinking?! I told you that I can't be caught fucking around on the job - I'd lose my position here!\"</i>  She snaps at you. <i>\"All I wanted was for you to wait two minutes whilst I sorted that out, you have any idea how much risk you put me in with those little games of yours?!\"</i>  She snarls, panting again in her anger.");
	output("\n\nYou rub your cheek and throw her an apology, admitting that maybe you were a little out of line.");
	output("\n\nShe takes a deep breath and then slowly exhales it, visibly calming down. <i>\"And with that out of the way... thank you. That really was exactly what I needed, all things considered. Oh!\"</i>  She giggles softly. <i>\"Come here a sec, please?\"</i>  As you bend your face closer to hers, she closes her eyes and sticks her tongue out, the yellow appendage snaking sinuously through the air and gently lapping at the corner of your mouth, drawing slowly over your lips and then retracting. She opens her eyes with a coy smile. <i>\"I sprayed you with some,\"</i>  she says by way of explanation.");
	output("\n\nAnd then her hands grab you and pull you into a full-on kiss, her tongue authoritatively thrusting itself into your mouth, trying to dominate you with its supple length. You are bit stunned by her initial move, but quickly recompose yourself and kiss her back. Your tongues and lips wrestle for a pleasurable minute or two. As she breaks the kiss she sighs in satisfaction. <i>\"Just don't do that again, buster,\"</i>  she warns you, a twinkle in her eye.");
	output("\n\nShe stretches herself luxuriantly after she releases you. <i>\"Now, I really need a drink,\"</i>  she comments, gently taking the mugful of her jism she captured early and taking a swig. With the ease that bespeaks of plenty of practice, she chugs the whole thing, then licks her lips clean, her eyes darting in your direction. <i>\"Down, " + pc.mf("boy","girl") + "; you've had your fun for a while.\"</i>");
	output("\n\nShe gets to her feet and pulls up her skirt, refastening her belt with a strangely authoritative gesture. Once that's done, she starts to push you towards the door. <i>\"Come on, let's get you out of here before you get any more bright ideas,\"</i>  she says, but she's grinning as she does so.");
	output("\n\nYou don’t bother protesting as you are shoved towards the door by the eager modded laquine.");
	output("\n\nAs she gets you to the door proper, she stops. <i>\"Don't be a stranger though, okay, honey?\"</i>  she asks with a grin you can just hear, then pushes you through. The door closes itself behind you, but you can hear a brief conversation coming from inside.");
	output("\n\n<i>\"Good morning, Ms. Epona,\"</i>  an unfamiliar voice says.");
	output("\n\n<i>\"Ah! G-good morning, sir,\"</i>  she replies.");
	output("\n\n<i>\"So, you're still wearing that special honey-scented perfume of yours? Might I suggest you start wearing a little less, please? The whole lobby smells like a beehive.\"</i>");
	output("\n\n<i>\"Oh! Ah, yes, yes sir, I'll keep that in mind,\"</i>  she apologetically replies.");
	output("\n\nYou leave with a knowing chuckle.");
	processTime(10+rand(5));
	clearMenu();
	addButton(0,"Next",move,"SOUTH ESBETH 2");
}

