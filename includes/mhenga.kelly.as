//Kelly works at Xenogen from 6AM till 5PM. Impliment a way to lock down the xenogen building when she's not there.

public function showKellyName():void
{
	if(flags["KELLY_MET"] == undefined) userInterface.showName("BUNNY\nGIRL");
	else userInterface.showName("\nKELLY");
}

// Stubtown4compile
public function kellyAttraction(modValue:int = 0):int
{
	if(flags["KELLY_ATTRACTION"] == undefined) flags["KELLY_ATTRACTION"] = 0;
	flags["KELLY_ATTRACTION"] += modValue;
	return flags["KELLY_ATTRACTION"];
}

public function kellyFucked():void
{
	if(flags["KELLY_SEXED"] == undefined) flags["KELLY_SEXED"] = 0;
	flags["KELLY_SEXED"]++;
}

public function tempNudeOn():void
{
	if(!pc.hasStatusEffect("Temporary Nudity Cheat")) pc.createStatusEffect("Temporary Nudity Cheat",0,0,0,0,true,"","",false);
}
public function tempNudeOff():void
{
	pc.removeStatusEffect("Temporary Nudity Cheat");
}

//Appearance
public function kellyAppearance():void {
	clearOutput();
	userInterface.showBust("KELLY");
	showKellyName();
	author("Quiet Browser & LD");
	output("Louise \"Kelly\" Epona, though if you dare call her <i>Louise</i> she’d be pretty mad at you, is a gene-modded laquine you met on the planet Mhen'gha in the town of Esbeth.");
	output("\n\nStanding five feet and nine inches tall with a buxom, curvy body strongly resembling a humanoid rabbit, she stares at you through amber eyes with a confident smile. Her rabbit-like ears fall down the back of her skull from the top of her head to her shoulders in an iconic \"Floppy-eared bunny\" look. A rabbit-like tail flashes above her bum, and her bare feet extend into rabbit-like appendages, her legs jointed in an odd fashion that lets her stand on both the balls of her feet, making them digitigrade, or on the heels of her feet, making them look plantigrade, like a human's.");
	output("\n\nHer face is unquestionably rabbit-like, with a short muzzle. However, you note that her features are possessed of soft, feminine curves that make her quite attractive. Her lips in particular are full and enticing, naturally kissable and prone to a seemingly unconscious pout that amplifies the sexiness of her smile. Her whole body");
	//if not sexed:
	if(flags["KELLY_SEXED"] == undefined) output(", you presume,");
	output(" is covered in soft, downy, fine fur, ");
	//At work 6AM till 5PM.
	if(hours >= 6 && hours < 17) output("though she’s currently covering up most of it in her clothes, ");
	output("with shoulder-length casually brushed hair.");

	output("\n\nHer most striking feature, at first sight, is her strange coloration. Reminiscent of a bumble-bee, her entire body");
	//At work
	if(hours >= 6 && hours < 17) output(", from what you can see,");
	output(" is covered in yellow and black stripes, except for her tail and ears, which are slightly orange. She exudes a scent that reminds you keenly of honey, but you also detect a distinctly feminine undertone.");
	if(flags["KELLY_SEXED"] == undefined) output(" Perhaps a perfume of some kind?");
	else output(" The knowledge that this is her natural aroma is both enticing and exotic. One would think the smell of honey would be sickening after so long, but you’ve come to enjoy it.");

	//If AtWork:
	if(hours >= 6 && hours < 17) output("\n\nShe is wearing a formal suit, as befits a representative for the Xenogen Corporation. A subtle and refined piece, it wouldn't be out of place on any businessman or woman. Seated behind her desk as she is, you cannot see her lower torso, but even the formal tone of her suit and her tie fails to completely obscure the impressive DD-cup swell of her bosom.\n\nA soft cough draws your attention back to her. <i>\"" + pc.mfn("Sir","Madam","Excuse me") + "? May I help you?\"</i>");
	//If OffWork:
	else {
		output("\n\nNo longer having to worry about office image, Kelly is letting it all hang out - quite literally. Her top is straining the limits of the word \"bikini,\" little more than triangles of fabric stretched over her perky nipples and held in place by straps that crisscross over her impressive DD-cup tits. For pants, she is wearing the cut-short denim jeans you have heard of as \"Daisy Dukes,\" which seem to be just barely big enough to fit her and leave nothing to the imagination regarding her perky, full, squeezable ass. Or her gender.\n\nDespite the feminine nature of the rest of her body, the front of her shorts bulges obscenely, straining to cover a clearly monstrous masculinity, stretched so tight it gives her a blatant camel-toe. Yet, somehow, it manages to do so without bursting its zipper.");
		if(flags["KELLY_SEXED"] != undefined) output(" You know from personal experience that her shorts are concealing a truly incredible array of sexual organs; a vagina, two cocks, and four balls. Her vagina is deep and wet, yet wonderfully flexible and tight. Her balls are the size of grapefruit, and her cocks, whilst normally 12\" long by 2\" horse-like shafts, can grow up to 36\" long and 4\" thick if she neglects her medication and lets herself get aroused.");
		output("\n\nShe giggles, drawing your attention back to her smiling face. <i>\"You know, it’s not very fun if you just sit there gawking at me. How about we do something else? Hmm?\"</i>");
	}
	//Display options//
	kellysOfficeMenu();
}

//At Xenogen Research Labs
//In The XRL Reception Hall
public function kellysOfficeBonusFunction():Boolean
{
	if(hours >= 6 && hours < 17)
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
			output("\n\nYou walk over to the rabbit-like receptionist, currently busy going over some files. One floppy ear, nearly hidden among her lush strands of honey-orange hair, twitches as you approach and she looks up towards you with a beaming smile. \"<i>Why, hello there, and welcome to Xenogen Research Labs, where the wonders of biotechnology never cease! My name is Kelly, the receptionist - how may I help you today?</i>\" Though her words are professional and welcoming, her tone is sincerely chirpy and friendly, suggesting she's quite happy to see you.");
			//If no Laquine entry in codex:
			if(!CodexManager.entryUnlocked("Laquines"))
			{
				output("\n\nYour codex gives a beep, signalling that Kelly is a member of an alien race. Stealthily, you check it out and skim the summary; Kelly here is a member of a race of rabbit-like anthro aliens known as the Laquines. They're most well-known for their high rate of hermaphroditism, and their rabbit-like breeding abilities, though in recent decades a mysterious \"sterility plague\" has been afflicting the race.");
				CodexManager.unlockEntry("Laquines");
			}
			output("\n\nHer fingers tap away at the keyboard, and she scans the screen professionally. <i>\"Hmm... I see we don't have your ID in our registry. Before we can allow you into the building or offer any kind of services to you, we require that you fill out a registry form. Would you like to register now, " + pc.mf("sir","madam") + "?\"</i>");
			
			processTime(2);
			//[Yes][No]
			clearMenu();
			addButton(0,"Yes",registerAtKellysOffice);
			addButton(1,"No",dontRegisterInKellysOffice);
			return true;
		}
		else
		{
			CodexManager.unlockEntry("Laquines");
			output("\n\nKelly is at her usual position behind the receptionist counter, idly going over her work. She sees you entering and smiles, giving you a friendly wave, before getting back to work.");
			addButton(0,"Kelly",kellyOfficeApproach);
		}
		return false;
	}
	else
	{
		output("\n\n<b>Xenogen Biotech is currently closed. You'll have to come back later.</b>");
		clearMenu();
		addButton(0,"Next",move,"SOUTH ESBETH 2");
		return true;
	}
	return false;
}

//Approach
public function kellyOfficeApproach():void {
	clearOutput();
	userInterface.showBust("KELLY");
	showKellyName();
	author("Quiet Browser & LD");

	//Update her sold items for old saves:
	if(flags["CAPTURED_A_MALE_ZIL_FOR_DR_HASWELL"] != undefined)
	{
		if(!chars["KELLY"].hasItem(new HoneySeed())) chars["KELLY"].inventory.push(new HoneySeed());
	}
	if(flags["CAPTURED_A_FEMALE_ZIL_FOR_DR_HASWELL"] != undefined)
	{
		if(!chars["KELLY"].hasItem(new Honeydew())) chars["KELLY"].inventory.push(new Honeydew());
		if(!chars["KELLY"].hasItem(new Honeypot())) chars["KELLY"].inventory.push(new Honeypot());
	}
	output("Kelly looks up at your approach, smiling to see you with her usual chipper attitude. \"<i>Welcome back to Xenogen Research Labs, where the wonders of biotechnology never cease! How may I help you, ");
	output("[pc.name]");
	//{my friend}/{honey}
	output("?</i>\"");
	processTime(1);
	//[PurchaseMods] [Talk] [Flirt] [Leave]
	kellysOfficeMenu();
}	

public function kellysOfficeMenu():void {
	clearMenu();
	userInterface.showBust("KELLY");
	showKellyName();
	shopkeep = chars["KELLY"];
	author("Quiet Browser & LD");
	addButton(0,"Appearance",kellyAppearance);
	addButton(1,"Talk",talkToKellyInOffice);
	if(chars["KELLY"].inventory.length == 0) addDisabledButton(2,"Buy","Buy","Kelly does not currently have anything to sell you.");
	else addButton(2,"Buy",buyItem,undefined,"Buy","Buy some of Xenogen Biotech's wares.");
	addButton(3,"Sell",sellItem,undefined,"Sell","Sell Kelly some of your excess mods.");
	addButton(14,"Leave",mainGameMenu);
}

//[=No=]
public function dontRegisterInKellysOffice():void {
	clearOutput();
	userInterface.showBust("KELLY");
	showKellyName();
	author("Quiet Browser & LD");
	output("You apologize, but you don’t feel like registering now, so you’ll be leaving.");
	output("\n\n<i>\"I understand " + pc.mf("sir","ma'am") + ", Xenogen thanks you for your visit. Please come again.\"</i> she says with a polite smile and a nod, indicating the door.\n\nYou walk out.");
	//Leave the area and redo everything in case the PC comes back.
	
	clearMenu();
	addButton(0,"Next",move,"SOUTH ESBETH 2");
}

//[=Yes=]
public function registerAtKellysOffice():void {
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
public function talkToKellyInOffice(display:Boolean = true):void {
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
	if(flags["KELLY_SEXED"] != undefined && kellyAttraction() >= 25) addButton(3,"Flirt",flirtWithKellyInTheOffice);
	else addDisabledButton(3,"Flirt","Flirt","Maybe you should get to know her off hours before trying to pull anything at work....");
	addButton(14,"Back",kellysOfficeMenu);
}

//Herself
public function talkToKellyAboutHerself():void
{
	clearOutput();
	userInterface.showBust("KELLY");
	showKellyName();
	author("Quiet Browser & LD");
	output("<i>\"Now, now.\"</i> She waves a finger at you. <i>\"Aren’t you getting a little ahead of yourself?\"</i> She smiles disarmingly.");
	output("\n\nYou apologise, you didn’t mean to offend her. You were just interested in getting to know her a little better.");
	output("\n\n<i>\"Flirting at work is forbidden, you know? How about you catch me off the clock? Then you and I can get to know each other a bit better,\"</i> she smirks.");
	output("\n\nYou nod and tell her you’d like that.");
	output("\n\n<i>\"Excellent, now... anything else?\"</i> She bats her eyelashes.");
	processTime(2);
	kellyAttraction(5);
	//Kelly at the Mead Hall unlocked
	//Revert to default Kelly options
	talkToKellyInOffice(false);
	removeButton(0);

}

//Role at XRL
public function talkToKellyAboutHerRoleAtXenogen():void
{
	clearOutput();
	userInterface.showBust("KELLY");
	showKellyName();
	author("Quiet Browser & LD");
	output("\"<i>My role here at Xenogen? Well, that's an easy question,</i>\" she giggles. \"<i>I'm basically a receptionist - you know, I interact with customers, handle intra-office mail, generally try and keep the place running smoothly down here on the ground level, you know?</i>\" she shrugs her shoulders and grins, unabashed by her rather low-level position. \"<i>I suppose the most interesting part of my job is the mod dispensing,</i>\" she adds.");
	output("\n\nWhen you ask what that means, she puffs her chest out proudly and launches into her explanation. \"<i>Here at Xenogen, we make a wide variety of modifications. Many of our clients come for personally customised changes and transformations, but we do get a significant amount who ultimately are after the same sorts of basic mods. These popularised \"com-mods\" are so frequently requested that we have them stocked and ready. I'm empowered to sell these basic mods literally over the counter to people who are willing to pay the credits for them.</i>\"");
	output("\n\nShe then smiles at you playfully. \"<i>So, are you interested in buying anything?</i>\"");
	processTime(2);
	kellyAttraction(5);
	//Display default Kelly menu options
	talkToKellyInOffice(false);
	removeButton(1);
}

//Working Here
public function talkToKellyAboutWorkingHere():void {
	clearOutput();
	userInterface.showBust("KELLY");
	showKellyName();
	author("Quiet Browser & LD");
	output("\"<i>Are you asking how I came to be working here, or if I like working here?</i>\" She giggles, batting her eyelids at you playfully. \"<i>Well, I suppose I can answer both...</i>\" she pokes her tongue out at you momentarily, then looks more serious.");
	output("\n\n\"<i>I basically hitchhiked my way here after my old ship broke down - stupid overpriced lame piece of crap conked out a couple of systems over. I hocked it for scrap and started thumbing my way; wound up left here because of my last jerkwad captain - probably because I wouldn't sleep with her, the damn size-queen bitch,</i>\" she grumbles at the memory. \"<i>I still had enough credits to get a cheap place to stay, but they weren't going to last forever, and I didn't want to be stuck on this rock permanently, so I started looking around. Xenogen was offering a receptionist position, and I took it.</i>\"");
	output("\n\n\"<i>As for working here,</i>\" she shrugs her shoulders with an amiable smile. \"<i>I don't intend to stay here forever, I'm saving up credits to buy a new little starrider of my own when I can, but it's a nice enough job. Good pay, good hours, fairly simple work, I'm out of the worst of the heat, and I even get something of an employee's discount on buying my own mods,</i>\" she tells you, then claps her hands sharply. \"<i>So, that's that done, anything else I can help you with?</i>\"");
	processTime(2);
	kellyAttraction(5);
	//Display default Kelly menu options
	talkToKellyInOffice(false);
	removeButton(2);
}

//Flirt
public function flirtWithKellyInTheOffice():void {
	clearOutput();
	userInterface.showBust("KELLY");
	showKellyName();
	author("Quiet Browser & LD");
	output("You wonder how Kelly would react if you were to flirt with her a little....");
	output("\n\nYou lean over her table wearing a seductive expression and ask Kelly how she’s doing.");
	output("\n\nShe looks back at you with an amused expression. <i>\"I’m better now that you are here. I’ve been bored here, all by myself, for a while now.\"</i> She smiles.");
	output("\n\nSlow day, huh?");
	output("\n\n<i>\"Yeah....\"</i> She stretches herself on her chair, popping her shoulders in the process. <i>\"So why exactly are you here? 'Fraid you haven’t told me what you are up to yet, honey.\"</i>");
	output("\n\nYou were wondering if she’s up for some <i>fun</i>.");
	output("\n\nA knowing smirk spreads on her lips, but she shakes her head. <i>\"Sorry, honey, but I’m strictly forbidden from flirting at work. And I do like this job enough that I don’t care for getting fired, but if you wait until later I’d be happy to continue this train of thought.\"</i>");
	processTime(3+rand(2));
	//[FlirtAnyway][Wait]
	clearMenu();
	addButton(0,"Flirt Anyway",flirtWithKellyAnyway);
	addButton(1,"Wait",dontFlirtWithKelly);
}

//[=Wait=]
public function dontFlirtWithKelly():void {
	clearOutput();
	userInterface.showBust("KELLY");
	showKellyName();
	author("Quiet Browser & LD");
	output("In that case, you guess you’ll just have to wait until later.");
	output("\n\n<i>\"Don't worry, [pc.name], I promise you I'll make it worthwhile,\"</i> she purrs, and winks. <i>\"Now, how else may I help you?\"</i>");
	//(Display Options)
	kellysOfficeMenu();
}

//[=FlirtAnyway=]
public function flirtWithKellyAnyway():void {
	clearOutput();
	userInterface.showBust("KELLY");
	showKellyName();
	author("Quiet Browser & LD");
	output("You are not taking no for an answer. Without giving her time to react, you grab her by the shoulder and draw her into a kiss.");
	output("\n\nStunned, she doesn’t put up any resistance as you thrust your [pc.tongue] into her mouth, tasting her as you maneuver yourself over her table.");
	output("\n\nShe almost starts kissing you back before she comes to her senses and pushes you back. <i>\"[pc.name]! What the hell!? I already told you we can’t flirt-\"</i> You silence her with a finger, not bothering to grace her with reply. You want her, and you want her now! As a matter of fact... you know she wants you too, if the bulge in her skirt is any indication.");
	output("\n\nYou duck under her table, ");
	if(pc.reflexes() >= 40) output("nimbly unfastening her belt, ");
	else output("struggling a bit before you can get her belt undone, ");
	output("and pulling her skirt down.");

	output("\n\nHer twin erections spring out of the once-restraining fabric, bouncing eagerly into place before you, already starting to ooze an orangey syrup-like precum from their flat heads, a sweet scent wafting from them. She moans plaintively. <i>\"[pc.short], seriously... we can't... I can't get caught,\"</i> she protests.");

	output("\n\n<i>\"Then you’ll just have to stay quiet and pretend nothing is happening,\"</i> you reply without a care. Now to give these tasty morsels before you the treatment they deserve....");
	output("\n\nShe bites her lip at that, visibly wrestling with the dilemma before her. On the one hand, she clearly does fear for her job. On the other hand, that this has her turned on is as obvious as the straining cocks in your hands. <i>\"I... oooh, alright. Make sure no one spots you,\"</i> she says, sliding her chair forwards in an attempt to further conceal you, unintentionally thrusting one of her flared tips against your lips.");
	output("\n\nYou knew she’d come around. Casually, you extend your tongue to lap off a dollop of syrupy pre off her offered cock, earning yourself a barely suppressed moan from above your head, a quiver racing down Kelly's body and visibly shuddering through her shafts.");
	output("\n\nEmboldened, you lean forward to meet the tip of the closest dick and gently lap at its blunt glans with your [pc.tongue], allowing the strange, sweet, sugary taste of her pre-cum to roll across your tongue. Finding it to your liking, you gently continue to lick it, switching over to her second cock to catch the precum dripping from it when the first one is rendered momentarily clean. Kelly makes no sound, and you can just envision her biting her lip to keep from doing so, but her enjoyment is made quite clear.");
	output("\n\nWithout further ado, you guide her tip into your mouth and engulf it in warm wetness. A moaning sigh escapes her, a spurt of sweet syrup hitting your tongue. The taste of it assaults your senses with sweetness from her pre-cum, tinged with the salt from her skin. You caress the length in your mouth with your [pc.tongue], moving your [pc.lips] as you bob your head gently back and forth. Your hands, now freed, stroke the other shaft in rhythm so that it won't get lonely while you tend to this one.");
	output("\n\nShe bites back any noises she may be tempted to make, but from the way she twitches and the firmness of her dick in your mouth, you know she's enjoying this. Her second cock butts insistently against your chin, as if demanding you pay attention to it too.");
	output("\n\nHaving tasted enough of her first horsehood, you decide to switch to the other and give it the same treatment, tasting more of her sweetness as you do so.");
	output("\n\nShe does moan at that, softly, but then stiffens - and not in a way that shows she's enjoying the feel of your tongue on her hot flesh. <i>\"[pc.name]! Ix-nay on that! Somebody's here,\"</i> she hisses to you urgently. <i>\"Why, hello there, and welcome to Xenogen Research Labs, where the wonders of biotechnology never cease! My name is Kelly, the receptionist - how may I help you today?\"</i> she says in the same professional yet friendly tone she first used when you arrived - clearly addressing this to her new customer.");
	output("\n\nYou consider stopping for a moment... but what would be the fun in that? Besides, you're too absorbed in your task to bother stopping now. You release her current cock and immediately engulf the other one, continuing your switcheroo blowjob.");
	output("\n\nKelly's whole body twitches, but she somehow avoids letting out anything other than a tiny squeak when you switch over. <i>\"Y-you're here for your appointment sir - er, madam? Yes, of c-course I can he-elp you,\"</i> she says, struggling to keep her words level and even despite your assault on her tender parts. One foot delivers a pointed kick to your ribs, not hard enough to hurt, but enough to warn you not to push her further.");
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
public function flirtWithKellyAnywayPartII():void {
	clearOutput();
	userInterface.showBust("KELLY");
	showKellyName();
	author("Quiet Browser & LD");
	output("Not feeling in the mood for a belly-bloating, you wetly pop your mouth free of the cock currently in it and take hold of both of the long, swollen shafts, snatching the mug from Kelly's hand and positioning it to catch the resultant semen.");
	output("\n\nYou watch in lustful amusement as Kelly's twin glans flare out, swelling into wide flattened heads, visibly bulging as her four balls unleash their copious load. The scent of honey fills the air an instant before great spurts of syrupy orange semen come flying from her dicks, splattering thickly into the mug and rolling over your fingers. You close your eyes to avoid being blinded, the overpowering sweetness filling the air as Kelly just keeps on cumming, and cumming....");
	output("\n\nThe mug fills rapidly, but her production is way more than it can hold, and soon it's just pouring over the rim and puddling messily upon the floor. By the time she stops at last, you are kneeling in a puddle that is sluggishly oozing into a surreptitious drain.");
	output("\n\n<i>\"Oh... gods, gods, gods,\"</i> she whines softly as her impressive balls finally empty themselves, her shafts going soft. She gestures for the mug and you hand her the sticky, slowly sloshing cup to her, whereupon she lifts it back out of sight. She pants heavily and repeatedly, slowly catching her breath as she comes down from the pleasure of her climax.");
	output("\n\nHappy that you brought your laquine lover over the edge, you crawl away and emerge from under her desk with a pleased smile of accomplishment.");
	output("\n\nShe just sits there for a moment, eyes looking at you as you stand up again. When you get close enough, though, her hand shoots out like lightning, cracking audibly against your cheek. <i>\"Jackass! Just what were you thinking?! I told you that I can't be caught fucking around on the job - I'd lose my position here!\"</i> She snaps at you. <i>\"All I wanted was for you to wait two minutes whilst I sorted that out, you have any idea how much risk you put me in with those little games of yours?!\"</i> She snarls, panting again in her anger.");
	output("\n\nYou rub your cheek and throw her an apology, admitting that maybe you were a little out of line.");
	output("\n\nShe takes a deep breath and then slowly exhales it, visibly calming down. <i>\"And with that out of the way... thank you. That really was exactly what I needed, all things considered. Oh!\"</i> She giggles softly. <i>\"Come here a sec, please?\"</i> As you bend your face closer to hers, she closes her eyes and sticks her tongue out, the yellow appendage snaking sinuously through the air and gently lapping at the corner of your mouth, drawing slowly over your lips and then retracting. She opens her eyes with a coy smile. <i>\"I sprayed you with some,\"</i> she says by way of explanation.");
	output("\n\nAnd then her hands grab you and pull you into a full-on kiss, her tongue authoritatively thrusting itself into your mouth, trying to dominate you with its supple length. You are bit stunned by her initial move, but quickly recompose yourself and kiss her back. Your tongues and lips wrestle for a pleasurable minute or two. As she breaks the kiss she sighs in satisfaction. <i>\"Just don't do that again, buster,\"</i> she warns you, a twinkle in her eye.");
	output("\n\nShe stretches herself luxuriantly after she releases you. <i>\"Now, I really need a drink,\"</i> she comments, gently taking the mugful of her jism she captured earlier and taking a swig. With the ease that bespeaks of plenty of practice, she chugs the whole thing, then licks her lips clean, her eyes darting in your direction. <i>\"Down, " + pc.mf("boy","girl") + "; you've had your fun for a while.\"</i>");
	output("\n\nShe gets to her feet and pulls up her skirt, refastening her belt with a strangely authoritative gesture. Once that's done, she starts to push you towards the door. <i>\"Come on, let's get you out of here before you get any more bright ideas,\"</i> she says, but she's grinning as she does so.");
	output("\n\nYou don’t bother protesting as you are shoved towards the door by the eager modded laquine.");
	output("\n\nAs she gets you to the door proper, she stops. <i>\"Don't be a stranger though, okay, honey?\"</i> she asks with a grin you can just hear, then pushes you through. The door closes itself behind you, but you can hear a brief conversation coming from inside.");
	output("\n\n<i>\"Good morning, Ms. Epona,\"</i> an unfamiliar voice says.");
	output("\n\n<i>\"Ah! G-good morning, sir,\"</i> she replies.");
	output("\n\n<i>\"So, you're still wearing that special honey-scented perfume of yours? Might I suggest you start wearing a little less, please? The whole lobby smells like a beehive.\"</i>");
	output("\n\n<i>\"Oh! Ah, yes, yes sir, I'll keep that in mind,\"</i> she apologetically replies.");
	output("\n\nYou leave with a knowing chuckle.");
	pc.exhibitionism(2);
	processTime(10+rand(5));
	clearMenu();
	addButton(0,"Next",move,"SOUTH ESBETH 2");
}

//At Burt's Mead Hall
//In The Mead Hall
//Requires player has activated Kelly at the XRLs
//Add to bar bonus func.
public function kellyAtTheBar():void
{
	output("\n\nKelly is sitting in one of the quieter, more out of the way tables, with a single, barely-touched bottle of mead and a cup in front of her. She spots you and waves cheerfully, clearly recognizing you.");
	if(!rooms["BURT'S BACK END"].hasFlag(GLOBAL.NPC)) rooms["BURT'S BACK END"].addFlag(GLOBAL.NPC);
	addButton(0,"Kelly",approachKellyAtTheBar);
}

//Approach
public function approachKellyAtTheBar():void
{
	clearOutput();
	CodexManager.unlockEntry("Laquines");
	userInterface.showBust("KELLY");
	showKellyName();
	author("Quiet Browser & LD");
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
		output("\n\n<i>\"And is that such a bad thing?\"</i> she teasingly asks. <i>\"When you're as sexy as I am, why, it's a crime to hide it... besides, fair is fair when it comes to letting folks know what you're packing, don't you think?\"</i> she questions, uncrossing her legs and patting her bulging crotch. <i>\"Not to mention, I spend all day stuffed into one of those suits at work - I deserve the opportunity to get out of those awful things and let myself have some air.\"</i>");
		output("\n\nWell, you for one appreciate knowing what you’re getting into. Especially when they’ve such an impressive bulge.");
		output("\n\n<i>\"Aw, what's wrong, honey-buns? Don't you like a girl with something extra upfront?\"</i> she asks in one of those over-sweet, exaggerated tones. <i>\"Is it really such a turn off to see a chick with a nice, meaty dick of her own?\"</i>");
		processTime(2);
		//[Yes][No]
		clearMenu();
		addButton(0,"Yes",yesKellyDickChicksAreATurnOff);
		addButton(1,"No",noKellyIFuckingLoveDickgirls);
	}
	else if(kellyAttraction() >= 50 && flags["KELLY_CONFESSED"] == undefined) kellyConfessesHerAffectionForYouAt();
	else
	{
		output("You make your way towards Kelly’s table and without another word you pull a seat beside her and seat yourself. You make yourself comfortable and smile at Kelly as she takes a swig of her drink.");
		output("\n\n<i>\"Well, well, well. Like bees to flowers. Tell me now, honey, what brings you here to lighten up this otherwise dull and dreary evening? Good company? Drinks? Honey?\"</i> She gasps in mock surprise. <i>\"Could it be <b>my</b> honey? Or maybe all of the above? Tell me.\"</i> She grins and takes another swig.");
		//Display options//
		kellyBarMenu();
	}
}

//[=Yes=]
public function yesKellyDickChicksAreATurnOff():void
{
	clearOutput();
	userInterface.showBust("KELLY");
	showKellyName();
	author("Quiet Browser & LD");
	output("She adopts a sorrowful expression and makes a tutting noise, shaking her head. <i>\"Aw, you really think that way? Well, don't worry, a little time with honey-bunny Kelly and your opinion will change,\"</i> she says, now sporting a cocky grin. <i>\"Once you've actually gotten to know the loveliness that is a dickgirl, you'll see just how wrong you used to be,\"</i> she purrs, openly fondling herself now. <i>\"Once you try me out, you'll never go back, I guarantee,\"</i> she sticks her tongue out, wriggling it in an obscene gesture before she draws it back inside, looking full of pride.");
	clearMenu();
	processTime(1);
	flags["KELLY_ENCOUNTERED_AT_THE_BAR"] = undefined;
	addButton(0,"Next",mainGameMenu);
}
//[=No=]
public function noKellyIFuckingLoveDickgirls():void
{
	clearOutput();
	userInterface.showBust("KELLY");
	showKellyName();
	author("Quiet Browser & LD");
	output("<i>\"Oh ho,\"</i> she says, grinning smugly. <i>\"Does somebody have a dickgirl fetish, hmm? Do you like a chick with a big, fat cock between her legs...? Well, who wouldn't? Mmm, there's no one better at sex than a herm, you know,\"</i> she croons, leaning back and blatantly caressing her bulging loins. <i>\"Boobs, butt, pole and hole, we've got it all. But then, what am I doing this for? Clearly, you have your head screwed on straight... though if it's a major lack of screwing in your life, don't worry, I can fix that in a jiff,\"</i> she giggles, winking at you saucily.");
	output("\n\nShe straightens up and stops cupping herself, resting her chin on her breasts and casting you flirtatious eyes across the tables. <i>\"Now that we have that settled... Seems to me there's nobody here with the balls to talk to me apart from you. So, lucky " + pc.mfn("boy","girl","cutey") + ", that means you and I can flirt... all. Night. Long.\"</i> She smirks.");
	output("\n\nLifting her head out of her cleavage, she slaps down a bit of paper and scribbles something on it, then holds it out to you. <i>\"Will you do a girl a favor, " + pc.mf("handsome","beautiful") + "? Run and take this to Burt over there, I need another drink. Get yourself one while you're there, too. My treat.\"</i>");
	output("\n\nQuite bossy isn’t she? Well you suppose it’s no work since you’re also getting a free drink out of it. With a nod you take the offered slip and head over towards the bar. As you make your way, you hear Kelly calling out shamelessly from behind you, <i>\"Now get that <b>sweet</b> [pc.butt] of yours back here to your honey-bunny ASAP, alright?\"</i>");
	output("\n\nYou shake your head with a chuckle, you barely know her and you already know she’s incorrigible. Once you get to the bar, you offer the slip to the bartender. He takes one look at the slip and shoots you a knowing look. <i>\"What it’ll be for you?\"</i> he asks.");
	output("\n\nYou place your order and he sets about mixing Kelly’s drink. With nothing to do, you lean back against the bar, checking out your surroundings. A catcall breaks your musing and you look at its source, not at all surprised to notice that it was aimed at a certain barely dressed bunny.");
	output("\n\nKelly doesn't look ruffled in the slightest, instead smirking proudly and then rolling her eyes. <i>\"Only a whistle? Is that all you think I'm worth? Or is it that you can't control your tongue any better around a sexy woman, huh? Is that why you don't come over and have a chat - you're scared you slip on your own drool? Come and see me when you get your tongue back, then I might be interested,\"</i> she replies dryly. You can hear the perp's buddies razzing on their compatriot for getting ripped up.");
	output("\n\nYou chuckle at the poor chap leaving with a low head. Looks like Kelly really knows how to put up on show. You feel a tap on your shoulder and turn to face the bartender, handing you your drinks. You take them and make your way back.");
	output("\n\n<i>\"Took your sweet time, huh?\"</i> she grins, then indicates a seat beside hers with a nod of her head. <i>\"Come on, pull up a seat, I don't bite... unless you ask nicely.\"</i> A wicked smile crosses her lips at the thought.");
	output("\n\nYou lay the drink on the table and pull up a chair beside her. As you sit, you note that the scent of booze is slowly being replaced by that sweet honey-scented perfume she seems to wear. Quite fond of it ain’t she?");
	output("\n\n<i>\"Oh, yes, I am,\"</i> she agrees, then smirks. <i>\"It's only fitting, after all; what better scent for a sweet girl with a sweet tooth? Besides, I rather like bees - or couldn't you tell?\"</i> She giggles, indicating her coat. <i>\"And... it's not exactly perfume,\"</i> she adds casually.");
	output("\n\nYou stare at her in confusion.");
	output("\n\n<i>\"It's a long story,\"</i> she says, <i>\"But I suppose I can give you the bullet point version. Basically, there's a species on this planet called the Zil, who have honey for their sexual fluids - pussy juices, milk and cum. I thought that sounded really, really hot. I happen to work at a genetic engineering lab... and we laquines? We make a lot of cum. Getting the picture now?\"</i> She smirks, patting the stretched front of her pants.");
	output("\n\nYou nod in understanding, guessing that makes sense.");
	output("\n\n<i>\"I've never regretted my choice, either,\"</i> she informs you. <i>\"Smelling like honey all the time is a small price to pay... not that I mind, I think it's a nice natural perfume. First up, who wouldn't want nice, sweet honey at the end of a blowjob, rather than salty, bitter cum, huh? Second, it means I never need to worry about running out of syrup for breakfast,\"</i> she giggles. <i>\"And last, but certainly not least, all this honey, rich and thick and healthy... mmm, you know how good this stuff is for skin and hair? Why, I'm a walking one-girl beauty salon, with the body to match,\"</i> she preens, holding out her arms and shifting slightly to pose. <i>\"...Matter of fact, I could really, really go for a fix of jizz right now,\"</i> she purrs, caressing her crotch. Then she frowns. <i>\"Oh wait, there's that pesky public indecency law... phooey.\"</i> She pouts.");
	output("\n\nYou just stare at her. She looks really pleased with her choices, good for her.");
	output("\n\nShe takes her glass and gulps down a shot, sighing contentedly. <i>\"Ah, that hits the spot. So, what can I do you for?\"</i> she grins.");
	processTime(3);
	//Display options//
	kellyBarMenu();
}

public function kellyBarMenu():void
{
	clearMenu();
	userInterface.showBust("KELLY");
	showKellyName();
	author("Quiet Browser & LD");
	addButton(0,"Talk",talkToKellyAtBar,undefined,"Talk","Bring up Kelly's talk menu.");
	addButton(1,"Flirt",flirtWithKellyUnknown,undefined,"Flirt","Flirt with the horny laquine. You'll probably get laid.");
	addButton(14,"Leave",mainGameMenu);
}


//Confession
//Requires Kelly has >=50 Attraction//
//Plays instead of Approach//
public function kellyConfessesHerAffectionForYouAt():void
{
	clearOutput();
	userInterface.showBust("KELLY");
	showKellyName();
	author("Quiet Browser & LD");
	flags["KELLY_CONFESSED"] = 1;
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
	clearMenu();
	//[Hot][Thankful][Dunno]
	addButton(0,"Hot",hugeCockLacquinesAreHottKelly);
	addButton(1,"Thankful",thankfulForKellyConfessions);
	addButton(2,"Dunno",dunnoAboutGiantLaquineCocksKelly);
}

//[=Hot=]
public function hugeCockLacquinesAreHottKelly():void
{
	clearOutput();
	userInterface.showBust("KELLY");
	showKellyName();
	author("Quiet Browser & LD");
	output("Personally, you think that’s really hot.");
	output("\n\n<i>\"Umm... what?\"</i> she blinks in surprise.");
	output("\n\nHow come she’s ashamed of that? You were expecting something more pressing, you admit, but heck. While you admit that it can be a bit difficult to carry on normally when she’s that big, growing big has its advantages. In fact, you’d like to see it sometime, maybe even give them a spin.");
	output("\n\nKelly just looks at you for a moment, soaking in your words, but then she beams in delight, giggling. <i>\"Oh, [pc.name], you really are a treasure,\"</i> she titters, smiling like it's her birthday. <i>\"You really think that it's hot? Well... I can't really afford to go keeping myself off the medicine twenty-four seven, it's just too much hassle while I gotta go to work here, but I can tell you this...\"</i> she steps closer, leaning towards your [pc.ear] and stage-whispering, <i>\"There's this not-quite-legal dick-growing mod, called Throbb. It, kind of, counteracts my meds. Bring some of that to my place, and I'll show you what I'm like when I let it <b>all</b> hang out,\"</i> she purrs, kisses your cheek and then steps back.");
	output("\n\nIf that’s the case, maybe you should procure some....");
	processTime(1);
	kellyAttraction(10);
	pc.lust(10);
	endOfLoppeConfession();
}

//[=Thankful=]
public function thankfulForKellyConfessions():void
{
	clearOutput();
	userInterface.showBust("KELLY");
	showKellyName();
	author("Quiet Browser & LD");
	output("You thank her for her honesty, but honestly? If this is the worst she can do, then you don’t really have much to worry about. Plus she seems to have the situation under control anyway.");
	output("\n\nKelly lets out a breath she wasn't aware she was holding. <i>\"You really have no idea how good it is to hear that - I've had other laquines run away screaming at the sight of what I was packing,\"</i> she tells you. <i>\"I really do appreciate you taking this so calmly,\"</i> she adds, a sincere look on her face.");
	processTime(1);
	kellyAttraction(5);
	endOfLoppeConfession();
}

//[=Dunno=]
public function dunnoAboutGiantLaquineCocksKelly():void
{
	clearOutput();
	userInterface.showBust("KELLY");
	showKellyName();
	author("Quiet Browser & LD");
	output("You’re not sure what to think of it. Personally you expected something more pressing, not that this revelation isn’t important, but... well... you need to think about that.");
	output("\n\n<i>\"...Well, you haven't run for the hills yet, so I'll take that as a win,\"</i> she comments.");
	processTime(1);
	endOfLoppeConfession();
}

//All options join here.
public function endOfLoppeConfession():void
{
	userInterface.showBust("KELLY");
	showKellyName();
	author("Quiet Browser & LD");
	output("\n\nThe rest of the walk goes by in silence, tho Kelly does shoot you some seductive gestures.");
	output("\n\n<i>\"So... thanks for the company this evening. But....\"</i> she trails off with a mischievous smile.");
	output("\n\nBut?");
	output("\n\n<i>\"You did come to see me at the bar, and I can’t help but think you were expecting something when you did,\"</i> she smirks.");
	output("\n\nThat's when she stops, and you realize you’re standing just outside her house.");
	output("\n\nShe raises her arms above her head in a full-body stretch, breasts jiggling nicely as she does so. <i>\"So, what do you say, honey? Care to come in for a nice hot coffee? My own special blend,\"</i> she promises, eye closing in a teasing wink.");
	processTime(10);
	//[Yes][No]
	clearMenu();
	addButton(0,"Yes",sureGiveMeCumCoffeeKelly);
	addButton(1,"No",noHotCofeeCheatsPleaseKelly);
}

//[=Yes=]
public function sureGiveMeCumCoffeeKelly():void
{
	clearOutput();
	userInterface.showBust("KELLY");
	showKellyName();
	author("Quiet Browser & LD");
	output("<i>\"Two hot, steamy cups coming right up,\"</i> she laughs, turning on her heel to lead the way through the door, ass unabashedly shaking from side to side as she goes. <i>\"Come on in, honey, and I'll set you up a treat,\"</i> she calls over her shoulder to you.");
	output("\n\nYou eagerly follow after her bobbing tail. Once inside, though, she actually does head straight for the kitchen, where she flicks on a coffee machine on the counter, then bustles to fetch two cups. <i>\"Now...\"</i> she turns to look at you bouncing over. <i>\"While the machine works, I’m sure we can find a way to pass the time?\"</i>");
	processTime(1);
	pc.lust(33);
	//(Display Sex Options)
	kellyBarSexMenu();
}

//[=No=]
public function noHotCofeeCheatsPleaseKelly():void
{
	clearOutput();
	userInterface.showBust("KELLY");
	showKellyName();
	author("Quiet Browser & LD");
	output("<i>\"No?\"</i> she repeats, brow furrowed. <i>\"Come on, after all I just told you, you’re going to make me wank tonight?\"</i> She slumps her shoulders in a defeated sigh. <i>\"Ok, I guess I can’t force you. Just promise me you’ll come see me soon, ok? Toys just don’t feel as good as the real thing, and my job can be pretty stressful. So it’s your responsibility to help me get off,\"</i> she says, showing you her tongue.");
	output("\n\n<i>\"Can I at least get a goodbye kiss?\"</i>");
	output("\n\nThat, you can do.");

	output("\n\nShe smiles and opens her arms, crossing the distance between the two of you and throwing her arms around you. One leg lifts itself up behind her as she squeezes your waist, eyes closing as her lips are drawn to yours like iron filings to a magnet. Hungrily she kisses you, passion bleeding through the ferocity of her lips on yours, her limbs holding her against you. You can feel her nipples perking through her top, grinding into your [pc.skinFurScales], her cocks hard against your [pc.leg]. Something warm and wet prods insistently at your [pc.lips], her tongue demanding entrance, but she backs off before forcing her way in, instead letting you go and stepping back with a pant of frustrated lust. <i>\"Better stop, or I mightn't stop at just a kiss,\"</i> she mumbles - ostensibly to herself, but you certainly don't have any problems hearing her. She opens her eyes and smiles at you. <i>\"Don't be a stranger, honey... now, I got to go and take care of these little problems.\"</i> She indicates her aroused state with a hand, then, with a last flirty wink, turns and sashays into her home.");
	pc.lust(15);
	processTime(4);
	clearMenu();
	addButton(0,"Next",move,"SOUTH ESBETH 2");
}

//Talk
public function talkToKellyAtBar():void
{
	clearOutput();
	userInterface.showBust("KELLY");
	showKellyName();
	author("Quiet Browser & LD");
	//if Not Sexed:
	if(flags["KELLY_SEXED"] == undefined)
	{
		output("<i>\"Talk?\"</i> she says, pouting in dismay. <i>\"What, all of this isn't enough for you? Come on, I'm a prime-grade sex machine! ...Oh, very well, if you really want to just talk, I'll humour you. But trust me, a night with me is something you'll <b>never</b> forget.\"</i> She winks lewdly for emphasis.");
	}
	else //If Sexed:
	{
		output("<i>\"Oooh; great in bed <b>and</b> actually interested in me to boot? Talk about hitting the jackpot!\"</i> she laughs, making a cheering motion with her arm. <i>\"I’m listening honey,\"</i> she informs you, and blows you a kiss.");
	}
	//Regardless of Talk option chosen, increase Kelly's Attraction meter by +5//
	kellyAttraction(5);
	//Display Options//
	kellyBarTalkOptions();
}

public function kellyBarTalkOptions():void
{
	clearMenu();
	userInterface.showBust("KELLY");
	showKellyName();
	author("Quiet Browser & LD");
	addButton(0,"About Her",talkToKelly,undefined,"About Her","Ask Kelly about herself.");
	addButton(1,"Her Mods",talkToKellyAboutHerMods,undefined,"Her Mods","Ask Kelly about what kind of mods she's picked up working for Xenogen.");
	addButton(2,"ZilFetish?",askKellyAboutHerZilFetish,undefined,"Zil Fetish?","Ask her if she has a zil fetish.");
	addButton(3,"ShareMeal",shareAMealWithKelly,undefined,"Share a Meal","Hang out with Kelly and have some dinner together.");
}

//About Her
public function talkToKelly():void
{
	clearOutput();
	userInterface.showBust("KELLY");
	showKellyName();
	author("Quiet Browser & LD");
	output("\"<i>You'd like to know a little about me?</i>\" Kelly replies, momentarily puzzled before regaining her good cheer. \"<i>Well, sure, I can share a few things. My name is Louise Epona - yeah, I know, it sounds kind of odd that I go by Kelly, but I always felt more like a Kelly than a Louise.</i>\" She giggles and pokes her tongue out - it's very long and vibrant yellow, you notice - at how silly her real name is. \"<i>Parents, what can you do about them, huh?</i>\" she says, shrugging her shoulders. <i>\"But seriously, call me Louise and we’re going to have a problem.\"</i> She winks at you. Despite her mocking tone, you do detect a hint of threat....");
	output("\n\n\"<i>Now, I know what you're probably thinking - I'm a modder as well as a staff member, right? This gorgeous furry coat and these sweet ears and all the rest of it, it all came out of a bio-sculptor's toolkit, yeah?</i>\" she smirks at you and then shakes her head, floppy ears swishing through the air from the motions. \"<i>Well, you'd be partly right. I do have a couple of mods in my system, and I'm very happy with them. However, the most obvious things about me? All natural, I assure you. See, I'm not one of those 'furries' that you humans have, who mod themselves to look more animal-like - though we do have one of those here in Esbeth; you met Penny yet? She's our chief of security, really nice girl, sure you'd like her,</i>\" she interjects into her own conversation. \"<i>Now, where was I? Ah, yes, I'm not a human at all. I'm a laquine.</i>\"");
	output("\n\nJust as suddenly as she began, she stops herself, smiling at you and wagging a finger. \"<i>And I think that's enough about me for now.\"</i> She rests her chin in her hands, giving you a coy look. <i>\"If you wanna know more, you’re going to have to pry the information.... From. My. Lips.\"</i> Her eyes hood themselves in a seductive smoulder, her lips pouting invitingly.");
	processTime(3);
	pc.lust(2);
	//[KissHer][DoNothing]
	clearMenu();
	addButton(0,"KissHer",kissKellyForSecrets,undefined,"Kiss Her","Kiss the girl.");
	addButton(1,"DoNothing",waitKellyOutAfterFlattering,undefined,"Do Nothing","Why are you even talking to her if you don't want to kiss her?");
}

//[=KissHer=]
public function kissKellyForSecrets():void
{
	clearOutput();
	userInterface.showBust("KELLY");
	showKellyName();
	author("Quiet Browser & LD");
	output("You boldly lean forward in an attempt to kiss her.");
	processTime(2);
	//if Affection < 25:
	if(kellyAttraction() < 25)
	{
		output("\n\nQuicker than you'd thought, she pulls her head back, a soft giggle escaping her. <i>\"Uh uh, that's a no-no there, [pc.name]. You haven't earned that right just yet - I'm not the kind of girl to just kiss anybody,\"</i> she chides you gently, a mocking grin on her lips as she waves her finger at you in reproach.");
		output("\n\nYou are a bit disappointed by this turn of events, but you understand. You apologize.");
		output("\n\n<i>\"Now, don't get me wrong, I like a brave " + pc.mf("guy","girl") + " like yourself, but you just don't have the right yet,\" she says with a wry smirk. \"But go on, ask me another question, I promise that this one I'll answer,\" she insists, winking at you slyly.");
		processTime(1);
		//Display Meadhall Talk options, minus About Her//
		kellyBarTalkOptions();
		removeButton(0);
		addDisabledButton(0,"About Her");
	}
	else
	{
		output("\n\nShe closes her eyes, a soft humming noise escaping her as your lips capture her own. She wastes no time in returning your kiss, passionately pressing back against you, her long tongue worming through into your mouth to trace your own [pc.tongue] in a feather-light touch. She breaks the kiss with a satisfied smile and huge sigh, batting her eyes dreamily at you.");
		output("\n\n<i>\"Mmm... you're good. I do so love a " + pc.mf("man","woman") + " who knows when to seize the day,\"</i> she purrs, one hand starting to massage a tit, the other fondling her bulging crotch. <i>\"Nothing more enticing than a partner that knows when to take charge... Alright, you've earned a little more about yours truly, I guess. I have two parents and four little sisters, being the eldest of five,\"</i> she smirks.");
		output("\n\nSo she’s the eldest? Go figure, you could swear she was actually the youngest. You tease her.");
		output("\n\n<i>\"Why? Because of my natural youthful beauty?\"</i> she coos in delight, batting her eyes at you.");
		processTime(1);
		pc.lust(4);
		//[Tease][Flatter]
		clearMenu();
		addButton(0,"Tease",teaseKellyPostKiss,undefined,"Tease","Tease Kelly about being immature.");
		addButton(1,"Flatter",flatterKellyPostKiss,undefined,"Flatter","Flatter Kelly.");
	}
}

//[=Tease=]
public function teaseKellyPostKiss():void
{
	clearOutput();
	userInterface.showBust("KELLY");
	showKellyName();
	author("Quiet Browser & LD");
	output("No, because most of the time she doesn’t seem very mature.");
	output("\n\nIf you were expecting that to upset her, though, you'd be quite disappointed. She laughs in delight. <i>\"You know what they say; growing old is mandatory, growing up is optional,\"</i> she says, and salutes you with her glass.");
	processTime(1);
	kellyBarTalkOptions();
	removeButton(0);
	addDisabledButton(0,"About Her");
}
//[=Flatter=]
public function flatterKellyPostKiss():void
{
	clearOutput();
	userInterface.showBust("KELLY");
	showKellyName();
	author("Quiet Browser & LD");
	output("Yes, actually. She just seems so energetic... hmm... now you wonder how old she really is?");
	output("\n\n<i>\"Didn't they ever teach you it's not polite to ask a girl her age?\"</i> she giggles, waving a finger at you as if you were a misbehaving child.");
	processTime(1);
	//[Tease][Playful][WaitOut]
	clearMenu();
	addButton(0,"Tease",teaseKellyAfterFlattering,undefined,"Tease","Tease her a bit about her scolding. Maybe she'll find a nice way to teach you to remember....");
	addButton(1,"Playful",playfulKellyAfterFlattering,undefined,"Playful","Play along with her scolding. After all, she's not your mother.")
	addButton(2,"WaitOut",waitKellyOutAfterFlattering,undefined,"WaitOut","Just let her do the talking.");
}

//[=Tease=]
public function teaseKellyAfterFlattering():void
{
	clearOutput();
	userInterface.showBust("KELLY");
	showKellyName();
	author("Quiet Browser & LD");
	output("Maybe, you don’t recall. Maybe she could teach you again? Make sure you won’t forget this time?");
	output("\n\nShe chuckles to herself. <i>\"Ah, [pc.name], what will I ever do with you?\"</i>");
	clearMenu();
	addButton(0,"Next",waitKellyOutAfterFlattering);
}
//[=Playful=]
public function playfulKellyAfterFlattering():void
{
	clearOutput();
	userInterface.showBust("KELLY");
	showKellyName();
	author("Quiet Browser & LD");
	output("Rolling your eyes in mock exasperation you say, <i>\"Yes, mommy Kelly.\"</i>");
	output("\n\n<i>\"That's a good " + pc.mf("boy","girl") + ",\"</i> she replies in a soothing, motherly tone, grinning at your dirty look.");
	clearMenu();
	addButton(0,"Next",waitKellyOutAfterFlattering);
}

//[=WaitOut=] //No text, just proceed.
public function waitKellyOutAfterFlattering():void
{
	clearOutput();
	userInterface.showBust("KELLY");
	showKellyName();
	author("Quiet Browser & LD");
	output("<i>\"If you really must know, I'm 24 standard years old,\"</i> she tells you casually, and takes a sip from her cup. Once she's finished wetting her throat, she continues, <i>\"I grew up in a spaceport, so, growing up, I saw a lot of aliens. I don't know, maybe that's why I always wanted to see what was out there... or maybe I just wanted to share myself with the universe,\"</i> she grins arching her shoulders in a way that makes her bosom heave quite nicely.");
	output("\n\n<i>\"So, about three years ago, I took my savings and I bought myself a little one-girl starrider and blasted off, just sort of bumming my way across the galaxy. It was just incredible... right up until the day that the stupid thing broke down on me, a couple of systems over,</i>\" she adds, idly thumbing in the direction of galactic south.");
	output("\n\nThat sucks, you note. But at least she seems to be doing well for herself.");
	output("\n\n<i>\"From where I started out when that happened, sure, this is up,\"</i> she agrees with a nod of her head. <i>\"You see, luckily, I was near a space-port, so I was able to crawl into civilisation. I ended up selling my ship to a spare parts merchant, but that didn't leave me with enough to do... well, anything. I couldn't buy a new ship, I couldn't purchase a ride back home, I certainly couldn't stay where I was. I managed to basically hitchhike my way from the station to here - unfortunately for me, the captain who took me here had certain ulterior motivations and, when I wouldn't put out for her, she abandoned me here.</i>\" She looks angry, spitting a curse on the individual in question. <i>\"I know I'm drop-dead sexy and all, but to strand me because I won't fuck you?! What kind of person does that?\"</i> she demands angrily.");
	output("\n\nYou keep silent, allowing her to cool off with another gulp from her mug before she continues. <i>\"So, there I was, stuck here with not too much more than what I had on my back and in my carry bags. I certainly didn't have a lot of credits left, but fortunately, flats in a frontier town come cheap. So I started looking for a job; I figured there had to be someone here who could and would hire me. And of course, I was right,\"</i> she smirks, buffing her nails on her breast's fur. <i>\"Xenogen was looking for a receptionist, and I was the first one to get my foot in the door. And so I've been here ever since; modding myself with spare savings, and building up my credits until the day comes I can buy a new ship and take off on my own again.\"</i> She sighs wistfully at the thought.");
	output("\n\nShe went through a lot, that’s for sure. You tap her arm comfortingly and tell her that once you get to the bottom, only way left is up. Plus she doesn’t seem to be type to let the world kick her about.");
	output("\n\n<i>\"You got that right, buster; when life kicks me, I kick it right back!\"</i> she cheers. Then she looks at you and smiles. <i>\"But it's nice to hear some support, now and then, so... thanks. Well, enough about where I came from; was there anything else you wanted?\"</i>");
	processTime(7);
	//Display Meadhall Kelly Options//
	kellyBarMenu();
}

//Mods
public function talkToKellyAboutHerMods():void
{
	clearOutput();
	userInterface.showBust("KELLY");
	showKellyName();
	author("Quiet Browser & LD");
	output("<i>\"Modifications, huh? You sure you wouldn't rather have a little hand's on analysis, hmm? Wouldn't that be a much more fun way to find out?\"</i> she winks suggestively at you.");
	//[Yes] [No]
	clearMenu();
	addButton(0,"Yes",yesHandsOnModAnalysisIsTheWayToGoKelly);
	addButton(1,"No",noJackingKellyOffToTestMods);
}

//[=Yes=]
public function yesHandsOnModAnalysisIsTheWayToGoKelly():void
{
	clearOutput();
	userInterface.showBust("KELLY");
	showKellyName();
	author("Quiet Browser & LD");
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
		userInterface.showBust("KELLY_NUDE");
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
		output("\n\nHer tongue wrings your finger one last time and then uncurls itself, her lips unsealing and setting your finger free with a wet pop, momentarily linked by a glistening strand before she laps it up. She opens her eyes and looks you squarely, a mischievous smirk on her lips. <i>\"Well, honey? Have I been a good girl?\"</i> she asks you, her voice a husky, lustful exhalation as she bats her eyelashes at you.");
		output("\n\nYou believe she did show she can be good, so you’ll let her <i>spring free</i> this time. You move a hand to her shorts and rub her cocks through the fabric. She moans, screwing her eyes closed in ecstasy as her dicks thrust themselves brutally against the fabric, which is growing increasingly damp and sticky, a sweet smell filling the air. Larger and harder the bulge swells, until her poor shorts button can't take it and pops off, flying away to the floor. \"<i>Oopsie,</i>\" she giggles.");
		output("\n\nYou waste no time in pulling down her zipper to let her shafts pop from their fabric prison, lest she pop the zipper too!");
			
		output("\n\nShe lets out a moan of release as the two horse-like pricks spring forward, each dripping a honey-colored goo from their tips. <i>\"Mmm, that feels so much better,\"</i> she says, leaning backwards until she is laying down on the bed, arms and legs spread, cocks carelessly thrusting up towards the ceiling.");

		output("\n\nYou stop for a moment to admire her twin spires, juicy and throbbing, dribbling honey. Before you get to that, though, you decide to finish removing her shorts. You push her legs up and pull her shorts off, tossing them away to join her bikini top.");
		output("\n\nShe smiles up at you and spreads her legs so that you have a full, unobstructed view of everything that lays between them. <i>\"Enjoying the view?\"</i> she asks mischievously, the look on her face making it clear she assumes the answer to be \"yes.\"");
		output("\n\nYou don’t grace her with an answer, instead you step forward and grab one of her legs. You caress her thighs, slowly making your way towards her dainty feet, checking her muscles along the way. An appreciative groan escapes her throat, and she flexes her legs, wriggling her feet at the sensation. You grab her foot, massaging it as you check each of her padded toes.");

		output("\n\n<i>\"Mmm... that feels nice. Can't remember the last time I got a footrub,\"</i> she mumbles appreciatively, trying to stare down the length of her body and watch you work, despite her impressive cleavage and twin-shafts being in the way.");

		output("\n\nYou smile mischievously yourself and press your fingers against her most sensitive spots, tickling her with gusto.");

		output("\n\nShe squeals in glee and wriggles frantically, kicking out in an effort to shake off your grip, but not hard enough to actually succeed.");

		output("\n\nYou stop with a grin, looks like her reflexes are in order.\n\n<i>\"Wait until I test your reflexes,\"</i> she promises you, a wicked grin on her face as she contemplates her payback.");

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
		pc.lust(20);
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
		else
		{
			clearMenu();
			// This is what it LOOKS like the scene intended to do in the doc to me
			addButton(0, "Next", getKellyOff, true);
			//addButton(0,"Next",noJackingKellyOffToTestMods);
		}
	}
}

//[=Confident=]
public function confidentLoppeWillLetYouPoundHerShitTillShesLoose():void
{
	clearOutput();
	userInterface.showBust("KELLY");
	showKellyName();
	author("Quiet Browser & LD");
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
public function beConfidentAboutNailingKellySheDoOOOOOO():void
{
	clearOutput();
	userInterface.showBust("KELLY");
	showKellyName();
	author("Quiet Browser & LD");
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

public function getKellyOff(newScreen:Boolean = false):void
{
	if(newScreen) clearOutput();
	else output("\n\n");
	userInterface.showBust("KELLY_NUDE");
	showKellyName();
	author("Quiet Browser & LD");
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
	if(pc.hasTailFlag(GLOBAL.FLAG_PREHENSILE) && pc.hasTailFlag(GLOBAL.FLAG_LONG) && pc.tailCount > 0)
	{
		output("\n\nYou adjust your [pc.tails], tickling her clit with the tip. She wriggles at the ticklish sensation, letting out a soft moan of pleasure. Without warning you plunge into her depths, stretching her around you as you invade with a wet schluk.");
		output("\n\nA cry spills from her throat as your tail plunges into her depths, the hot, wet flesh stretching around your ");
		if(!pc.hasCockTail()) output("make-shift ");
		output("cock and eagerly gulping you down as far as you dare to enter.");
		//if more than one tail:
		if(pc.tailCount > 1)
		{
			output("\n\nNot satisfied with just stuffing her pussy, you align your second [pc.tail] with her tight ass.");
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
			output("\n\n<i>\"Maybe we should try using ");
			if(pc.tailCount == 1) output("that");
			else output("those");
			output(" on my dick");
			if(pc.tailCount > 1) output("s");
			output(" next time?\"</i> she suggests, an eager glint in her eyes. Then she moans again. <i>\"Not that this isn't fun too,\"</i> she admits.");
		}
		else 
		{
			output("\n\n<i>\"Mmm... that feels good,\"</i> she groans luxuriantly, arching her back and clenching down against your [pc.tail]. If she cares at all that ");
			if(pc.tailCount == 1) output("it's");
			else output("they're");
			output(" not ");
			if(pc.tailCount == 1) output("a real dick");
			else output("real dicks");
			output(", she certainly doesn't show it.");
		}
	}

	output("\n\nYou speed up your pace, filling the room with slick sounds of flesh slapping on flesh as you masturbate her furiously.");

	output("\n\nEyes screwed shut the laquine moans like a whore, hot shafts pulsing in your grip, sending twin streamers of thick, sweet semen washing down her lengths and bathing your fingers, aiding your strokes and caresses as they lubricate her dicks. Her ");
	if(pc.hasTailFlag(GLOBAL.FLAG_PREHENSILE) && pc.hasTailFlag(GLOBAL.FLAG_LONG)) output("tail-stuffed");
	else output("neglected");
	output(" pussy drools a slickness of its own, her breasts bouncing pleasantly with each passionate inhalation and exhalation she makes. She grunts and gasps, totally helpless under your onslaught, and clearly loving every moment of it.");

	output("\n\nYou stop in your tracks, calling out to her with a smirk.");

	output("\n\n<i>\"What?\"</i> she whines, irritated at your stopping.");

	output("\n\n<i>\"Just cum already,\"</i> you reply. You grip and yank her shaft");
	if(pc.tailCount > 1)
	{
		output(", while you push [pc.tails] as far as possible inside her hungry hole");
		if(pc.tailCount > 1) output("s");
	}
	output(".");

	output("\n\nA delighted squeal ripples from her throat, she arches her back and clenches down");
	if(pc.hasTailFlag(GLOBAL.FLAG_PREHENSILE) && pc.hasTailFlag(GLOBAL.FLAG_LONG))
	{
		output(", inadvertently squeezing your [pc.tails] in the silken vice of her depths");
	}
	output(", before her cocks bulge once more and send twin streamers of semen flying for the ceiling. Though they make a spirited attempt, they fall short, and instead drop like molten meteors back down to splat wetly against her already-smeared face and belly. She moans and cries and whimpers in ecstasy as she paints herself a second time; finally coming to a halt, she is completely plastered in her own herm-goo, panting for breath in a near-palpable fug of honeyed sex fumes.");

	output("\n\nYou release her");
	if(pc.hasTailFlag(GLOBAL.FLAG_PREHENSILE) && pc.hasTailFlag(GLOBAL.FLAG_LONG))
	{
		output(", withdrawing your [pc.tails] from her abused hole");
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
	addButton(0,"Next",move,"SOUTH ESBETH 2");
}

//[=No=]
public function noJackingKellyOffToTestMods():void
{
	clearOutput();
	userInterface.showBust("KELLY");
	showKellyName();
	author("Quiet Browser & LD");
	output("<i>\"Party pooper,\"</i> she huffs. <i>\"Well, alright, if you'd rather I just tell you...\"</i>");
	//Yes with insufficient Attraction joins here//
	kellyModsEpilogue();
}

public function kellyModsEpilogue(clearScreen:Boolean = false):void
{
	if(clearScreen) clearOutput();
	else output("\n\n");
	userInterface.showBust("KELLY");
	showKellyName();
	author("Quiet Browser & LD");
	output("<i>\"As you might have guessed, my fur's modded; we don't normally come in quite this sexy a coat pattern,\"</i> she giggles. <i>\"I wound up with a zil tongue kind of by accident, but I kept it because I really like what I can do with it,\"</i> as if in emphasis, she sticks it out of her mouth, curling it into a corkscrew pattern before pulling the prehensile appendage back inside. She then looks thoughtful and taps her chin. <i>\"Hmm... do they count if they're inherited from my parents?\"</i> she asks you.");

	output("\n\nShe shakes her head. <i>\"Eh, close enough. Well, my dad, he figured that getting double the balls would give him better chances of fathering kids. Guess who wound up inheriting dad's mod?\"</i> she winks at you. <i>\"Where the other dick came from, though, is a surprise; doctors figure it's a genetic hiccup, probably in response to the quad-balls mod I inherited,\"</i> she adds.");

	output("\n\n<i>\"And, of course, there's the big one, my first real mod. When I cum? Dicks or pussy, I make honey. Sweet, rich, tasty honey,\"</i> she grins gleefully at the thought. She stretches luxuriantly. <i>\"And that's all of them,\"</i> she informs you. <i>\"So, anything else on your mind?\"</i>");
	processTime(4);
	//Display Kelly at Bar options//
	kellyBarMenu();
	removeButton(1);
	addDisabledButton(1,"Her Mods");
}

//Zil Fetish
public function askKellyAboutHerZilFetish():void
{
	clearOutput();
	userInterface.showBust("KELLY");
	showKellyName();
	author("Quiet Browser & LD");
	output("<i>\"Zil fetish, huh?\"</i> She takes a swig of her drink. <i>\"Well, [pc.name]. You really shouldn’t believe everything people say. Always take rumors with a grain of salt,\"</i> she chuckles.");
	output("\n\n<i>\"Oh, I know I make it an easy one, with the colors and all, but, honestly, I don't have a <b>zil</b> fetish,\"</i> she insists. There's a particular emphasis on the word <i>\"zil\"</i> that makes you suspicious that she's not telling the whole truth.... She sees your look and gives you a knowing grin. <i>\"What? Don't believe me?\"</i> she asks, one hand raising genteelly to her impressive chest.");

	output("\n\nYou don’t bother saying anything, instead you roll your eyes and continue to glare at her.");

	output("\n\n<i>\"Oh, alright, if you must twist my arm,\"</i> she smirks. <i>\"I'll admit I have a bee fetish, but that doesn't mean I have a zil fetish. Zil are... well, they're cute enough, with those adorable big black eyes and the delicate, veil-like wings that the boys have, not to mention that sweet color scheme of theirs and - oh! Did I mention the curves? They're just so yummy to look at,\"</i> she leers, sculpting a curvaceous outline in the air with her hands, as if molesting an invisible zil. <i>\"Not to mention, cumming honey? So damn hot... just the thought of it turns me on,\"</i> she purrs, one hand sliding down her belly and coming to a rest between her legs, cupping the bulge that awaits there..");

	output("\n\nYou chuckle, with the way she’s describing them, no wonder people would talk about her having a fetish for them.");

	output("\n\n<i>\"No, I have an appreciation for them. There's a difference,\"</i> she insists, a grin on her lips. <i>\"Just because I like how they look, it doesn't excuse their flaws.\"</i> She shakes her head. <i>\"Now, I'm hardly going to qualify for Miss Chastity, but even so, a girl likes a little consensus to her encounters - I don't approve of them dropping out of trees and trying to knock me out so they can have their wicked way with me. They could at least buy me a drink first!\"</i> she pouts.");

	output("\n\n<i>\"I mean, there I was, new to town; young, innocent, dumb and virginal... well, alright, maybe not virginal,\"</i> she amends at your skeptical look. <i>\"I didn't really know anything about the zil other than that they were natives, they were hot, and the locals apparently found it easy to have sex with them. So, out I went into the jungle one hot evening, looking to get lucky. I found two sexy bee-boys and a hot bee-girl hanging out near a fruiting tree, so I wander over to say hello... guess what happens?\"</i> she asks you with mock seriousness.");
	output("\n\n<i>\"They look up, they see me, and next thing I know, they're charging me!\"</i> she snaps indignantly. <i>\"I tried to protest that I wasn't there to fight, but next thing I know, I'm seeing stars, looking up at the canopy as one sits on my chest and the others are wrestling down at my legs.\"</i> She shakes her head at the memory.");

	output("\n\nShe looks at you sidelong and smirks. <i>\"I don't think you need to hear the grisly details, but suffice to say, I was a real mess when I got back, and I made up my mind I wasn't going out there for zil-sexing again. I'm not <b>that</b> easy, and while I've never heard of them keeping their bitches, I don't intend to be the first exception to the rule,\"</i> she informs you.");

	output("\n\n<i>\"So, yeah; great looks, rotten attitude, that's how I'd sum up the zil. Still, they were good for one thing... they made getting my mods super-cheap, because all I needed was a bit of zil gene-splicing,\"</i> she grins confidently, wrapping her arms behind her head and stretching, surely <i>coincidentally</i> displaying her black and yellow tits for your appraisal as she does so.");

	output("\n\nThat’s an interesting story, tho you admit a part of is rather curious about the <i>grisly details</i>. So... as long as it got stripes, honey and doesn’t try to rape her, she’s game?");

	//If PC has Zil or otherwise Bee Coloration AND HoneyCum OR HoneyFemCum:
	if(pc.zilScore() > 2)
	{
		output("\n\nKelly opens her mouth as if to say something, then stops, rubbing her chin as she eyes you over. <i>\"Actually... I'm a bit fussier than that,\"</i> she remarks, a growing grin on her lips. <i>\"See, I don't want just someone with bee stripes and honeyed jism... no, what I want is someone who has that, who's about your size; a " + pc.mf("handsome boy","girl") + " with a nice ");
		if(pc.biggestTitSize() < 1) output("flat chest");
		else if(pc.bRows() == 1) output("pair of [pc.breasts]");
		else output("set of [pc.breasts]");
		output(", a [pc.butt]");
		if(pc.hasCock()) output(", " + num2Text(pc.cockTotal()) + " [pc.cocks]");
		if(pc.hasVagina()) output(", " + num2Text(pc.vaginaTotal()) + " [pc.vaginas]");
		output("....");

		output("\n\nShe smiles, looking at you. <i>\"The ability to hold a conversation, too, is definitely a big plus in my book... So, know where I might be able to find someone like that?\"</i> she grins.");

		output("\n\nFiguring the game she’s trying to play, you decide to play along. Maybe you do, but she’s going to have to do a bit of looking around.");

		output("\n\nShe smirks. <i>\"Oh, dear, now wherever shall I look?\"</i> she laments in the most hamtastic fashion, making a show of looking around the room. Then her eyes fall upon you and she leers at you. <i>\"Oh, my, I do think I found them,\"</i> she giggles, her hand reaching across the table to gently brush yours. <i>\"Now, whatever shall I do with you, hmm? Kidnap you and carry you away to my little lovenest...?\"</i> she purrs this at you, bending forward slightly and batting her eyes at you.");
		processTime(9);
		//[Sex][Refuse]
		clearMenu();
		addButton(0,"Sex",chooseToGoToKellysLovenest,undefined,"Head to Kelly's lovenest for some love.");
		addButton(1,"Refuse",refuseToGoKellysLoveNest,undefined,"Refuse","Refuse sexytimes. Maybe you need to save up some cum or take a break from sex.");
	}
	//Else:
	else
	{
		output("\n\nShe purses her lips, a finger pressed against them in thought, and hums as if thinking about it... for all of five seconds. <i>\"Being able to hold a decent conversation is always a plus, but....\"</i> she grins wickedly. <i>\"Pretty much,\"</i> she says unabashedly.");

		output("\n\nShe stretches luxuriantly. <i>\"Alright, was there anything else on your mind?\"</i>");
		processTime(9);
		//Display Kelly at Meadhall Options//
		kellyBarMenu();
	}
	
}

//[=Refuse=]
public function refuseToGoKellysLoveNest():void
{
	clearOutput();
	userInterface.showBust("KELLY");
	showKellyName();
	author("Quiet Browser & LD");
	output("Maybe some other time, you reply.");

	output("\n\nShe pouts and huffs <i>\"no fun meanie,\"</i> at you, and then straightens up and stretches. <i>\"Well, is there anything else you wanted?\"</i>");
	//Display Kelly at Meadhall Options//
	processTime(1);
	kellyBarMenu();
}

//[=Sex=]
public function chooseToGoToKellysLovenest():void
{
	clearOutput();
	userInterface.showBust("KELLY");
	showKellyName();
	author("Quiet Browser & LD");
	output("Since she seems to have gotten you, you really have little choice in the matter. You smirk seductively.");

	output("\n\nShe grins a cat that stole the cream grin, reaching out to caress your [pc.face]. <i>\"Indeed... Well, come then, my sweet ");
	if(pc.tallness < 60) output("little ");
	output("bee; your flower awaits,\"</i> she purrs, rising from her seat and seductively sashaying her way towards the door.");
	processTime(1);
	//Go to sex menu//
	kellyBarSexMenu();
}

//Share Meal
public function shareAMealWithKelly():void
{
	clearOutput();
	userInterface.showBust("KELLY");
	showKellyName();
	author("Quiet Browser & LD");
	processTime(2);
	//1st time:
	if(flags["KELLY_HAD_A_MEAL_SHARED"] == undefined)
	{
		flags["KELLY_HAD_A_MEAL_SHARED"] = 0;
		output("Sitting here amongst a crowd of people all eating or drinking and chatting away has left you feeling a bit peckish. You think about getting something to eat and offer to buy something for Kelly too.");
		output("\n\n<i>\"Buy something?\"</i> she repeats, looking a little skeptical. She mulls it over, then shakes her head. <i>\"Nah, no thanks, [pc.name]; no offense to Burt, but he's hardly the best cook in town.\"</i>");
		output("\n\nWell, you’d offer to take her to the restaurant, but with the way she’s dressed....");
		output("\n\n<i>\"Screw them, I'm not going to go and get dressed up all fancy just to have something to eat,\"</i> she replies defiantly.");
		output("\n\nYou shrug in exasperation, what does she want to do then? You don’t want to be eating while she keeps looking at you.");
		output("\n\n<i>\"Well, if you're really that hungry, I might know a solution,\"</i> she replies, carelessly examining her fingernails. <i>\"We could always have something to eat at my place.\"</i>");
		output("\n\nOh? So is she going to cook for you?");
		output("\n\n<i>\"Only if you <b>help</b> me,\"</i> is her teasing response.");
		output("\n\nYou wonder for a moment if you should take her invitation.");
		//[Accept][Refuse]
		processTime(3);
		clearMenu();
		addButton(0,"Accept",helpKellyOutDinnerDate);
		addButton(1,"Refuse",refuseKellysDinnerFirstTimeInvite);
	}
	else
	{
		//if Attraction =< 25 :
		if(kellyAttraction() <= 25)
		{
			output("Kelly giggles at your offer. <i>\"My, somebody feels confident, don't they? We have dinner together and you feel entitled to just pop on by whenever you please...?\"</i> She lets the silence linger, and then winks at you, a mischievous grin on her lips. <i>\"I like that sort of confidence,\"</i> she purrs. <i>\"Come along then,\"</i> she says, hopping to her feet.");
		}
		//Else if Attraction =< 50:
		else if(kellyAttraction() <= 50)
		{
			output("<i>\"Do you like my cooking that much?\"</i> she asks with a confident smirk. <i>\"Or is this just to get out of having to cook your own dinner?\"</i> she suggests, winking at you. <i>\"Well, I guess I can't let you starve... let's get going,\"</i> she tells you, already leaving her seat.");
		}
		//Else if Attraction =< 75 :
		else if(kellyAttraction() <= 75)
		{
			output("She chuckles at your suggestion. <i>\"Getting quite attached to your place at my dinner table, aren't we? Well, I have to admit, cooking for two is more fun...\"</i> she gives you a suggestive look as she says that. <i>\"Of course you can come to dinner,\"</i> she tells you, hopping to her feet as she does.");
		}
		//Else if Attraction =< 100 :
		else if(kellyAttraction() <= 100)
		{
			output("She smiles, looking unabashedly into your eyes. <i>\"You know, I've gotten quite attached to having you around. Meals are so much nicer with good company. If you're feeling peckish, you can always drop by for a quick snack... or something a little more elaborate,\"</i> she purrs, giving you one of those lewd winks of hers before standing up, stretching as she does and \"coincidentally\" thrusting out her breasts. <i>\"Come on, then, let's go get cooking,\"</i> she cheerfully declares.");
		}
		kellyShopping();
	}
}

public function kellyShopping():void
{
	userInterface.showBust("KELLY_NUDE");
	showKellyName();
	author("Quiet Browser & LD");
	output(" Shopping with her is quite an experience. Kelly can be quite the energetic hopping bunny when she wants to. Since you’re getting a free meal out of this, you don’t mind helping, however it’s true that this is more than simple <i>grocery shopping</i>. Unless skin care, fur care and cleaning supplies suddenly became a part of the cooking process when you were not looking....");
	//if Strength <= 30:
	if(pc.physique() <= 20)
	{
		output("\n\nAs the bags start piling up it becomes harder and harder to keep up with her. You find yourself getting winded easily - of course, the fact that you don’t really have time to sit down and adjust the bags to make them more convenient could be a factor.");
		output("\n\n<i>\"Hey, [pc.name], what's up? You're slower than a honey-glazed snail,\"</i> Kelly comments as she finds herself continually delayed by you. She takes a look at you and blinks as she sees just how much you're struggling with her groceries. <i>\"Ah. Okay, we've got enough for today, we can head back to my place now,\"</i> she promises you.");
		output("\n\nYou sigh with relief when you start to head to her home.");
	}
	else
	{
		output("\n\nHer bags soon start piling up and you’re thankful that you’re strong enough to carry them. Still, keeping up with Kelly can be quite difficult. She shows no shame as she starts to pile bag upon bag whilst you’re carrying.");
		output("\n\n<i>\"It's so nice to have a strong " + pc.mf("man","woman") + " along to help out; it's such a bother having to make multiple trips every time I want to get some shopping done. You're so sweet to help me out like this, [pc.name],\"</i> she chirps gleefully.");
		output("\n\nBy the time you start heading back to her house you admit you were getting tired, you were running of room to carry her stuff too.");
	}
	output("\n\n<i>\"And that's the last of it,\"</i> she declares happily, closing the final cupboard. <i>\"You're such a sweet " + pc.mf("man","woman") + ", to help a little lady like myself,\"</i> she says, turning her head to look over her shoulder to shoot a mock-innocent smile at you as she does. With a sigh of relief, she starts to fiddle with her bra-like mini-top, casually dropping it to the floor once it springs free of her breasts, then bending over to start removing her pants, ass up and pointed towards you, each shapely curve of buttock and leg emphasised as her pants slide with slow, deliberate motion down to the floor. She steps out of them with one foot, and then a delicate backwards kick flicks the garment away.");
	output("\n\n<i>\"Much better,\"</i> she announces. <i>\"Always so much more comfortable like this; it's nice to let the girls breathe.\"</i> She stops and giggles to herself. <i>\"My moms would spank my cute little bunny-butt until it glowed red for doing this... but that's half the fun, isn't it?\"</i> she asks; you're not sure if she's being hypothetical or not. <i>\"Oh, please, don't be shy on my account; my home is your home. Go on and make yourself comfortable, too,\"</i> she adds, almost as an afterthought.");
	processTime(7);
	//[GetComfy][No]
	clearMenu();
	addButton(0,"GetComfy",getComfyAfterKellyShopping);
	addButton(1,"No",noToChoiceAtEndOfKellyShopping);
}

//[=Refuse=]
public function refuseKellysDinnerFirstTimeInvite():void
{
	clearOutput();
	userInterface.showBust("KELLY");
	showKellyName();
	author("Quiet Browser & LD");
	output("You tell her that it’s fine. She doesn’t have to get out of her way for you.");

	output("\n\nShe huffs at that. <i>\"What’s the problem, honey? Don’t you want me to make you a meal? A complete course with dessert?\"</i> She bats her eyelashes. <i>\"Or are you just worried about the <b>help</b> I’m in need of?\"</i>");

	output("\n\nYou admit you are curious about that.");

	output("\n\n<i>\"My, my. You have such a dirty mind [pc.name]. I just want some help with the groceries. Can’t cook you anything without the ingredients.\"</i>");

	output("\n\n...Well that certainly is not the kind of help you expected her to ask for.");

	output("\n\n<i>\"So?\"</i>");
	processTime(2);
	//[Accept][Refuse]
	clearMenu();
	addButton(0,"Accept",helpKellyOutDinnerDate);
	addButton(1,"Refuse",doubleRefuseKellyDinnerYouAsshat);
}

//[=Refuse=]
public function doubleRefuseKellyDinnerYouAsshat():void
{
	clearOutput();
	userInterface.showBust("KELLY");
	showKellyName();
	author("Quiet Browser & LD");
	output("Though she’s not really asking for much, you still decline her invitation. Maybe some other time.");

	output("\n\n<i>\"Aw, you’re no fun,\"</i> she sighs in mock exasperation. <i>\"And here I was thinking this would be the perfect excuse to take you home. Anyway, wanna do something else?\"</i>");
	//(Display Options)
	processTime(1);
	kellyBarMenu();
}

//[=Accept=]
public function helpKellyOutDinnerDate():void
{
	clearOutput();
	userInterface.showBust("KELLY");
	showKellyName();
	author("Quiet Browser & LD");
	output("You suppose there’s not harm in <i>helping</i> her then.");

	output("\n\nShe pushes her chair away from the table and hops back on her feet. <i>\"I just need to clear my tab and we can go.\"</i>");

	output("\n\nYou nod and follow her.");
	kellyShopping();
}

//[=No=]
public function noToChoiceAtEndOfKellyShopping():void
{
	clearOutput();
	userInterface.showBust("KELLY");
	showKellyName();
	author("Quiet Browser & LD");
	output("You are pretty comfortable as you are already, so you see no sense in stripping down.");

	output("\n\n<i>\"Suit yourself,\"</i> she declares; if she feels at all disappointed, she's doing a great job hiding that fact.");
	kellyDinnerPrepGogo();

}

//[=GetComfy=]
public function getComfyAfterKellyShopping():void
{
	clearOutput();
	userInterface.showBust("KELLY_NUDE");
	showKellyName();
	author("Quiet Browser & LD");
	output("Well, it’s unfair to have her give you so much eye-candy without paying her back for it. That said you start stripping off your [pc.gear], laying it neatly on a nearby table.");
	//if Attraction =< 50:
	if(kellyAttraction() <= 50) output("\n\nKelly turns to watch you, openly enjoying every moment as your clothes come off and you are standing naked before her. She lets out a wolf whistle of delight once the last comes off. <i>\"Now there's a sight to admire; stick around after dinner, maybe we'll have a bit of my special dessert,\"</i> she coos, winking at you.");
	else output("\n\nKelly immediately snaps around to face you, blatantly ogling with glee as you make yourself as naked as she is. With an almost predatory intensity she struts towards you, making a circuit around you as the last bit of gear hits the floor. <i>\"Now you, honey, are what we call <b>damn</b> fine... you have <b>got</b> to stick around after dinner, try some of my special dessert,\"</i> she coos. The sudden admiring slap she delivers to your [pc.butt] in emphasis of the word \"special\" leaves you with little doubt as to what's on her mind.");
	tempNudeOn();
	kellyDinnerPrepGogo();
}

public function kellyDinnerPrepGogo():void
{
	userInterface.showBust("KELLY_NUDE");
	showKellyName();
	author("Quiet Browser & LD");
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
public function useKellysHoneyForCooking():void
{
	clearOutput();
	userInterface.showBust("KELLY_NUDE");
	showKellyName();
	author("Quiet Browser & LD");
	var x:int = -1;
	if(pc.hasCock()) x = pc.cockThatFits(chars["KELLY"]);
	output("You sneak up on her and without warning hug her midriff, quickly moving a hand to her balls, brimming with honey. You ask why she’s bothering to look for the jar when she has a sack-full of honey handy.");
	output("\n\nShe moans appreciatively as she feels your fingers cupping her sack. <i>\"Mmm... some folks don't like eating it when they know where it comes from,\"</i> she replies absently. <i>\"But maybe you're different...?\"</i> she suggests, a hopeful note in her voice and an eager grin on her lips.");
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
		pc.cockChange();
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

	output("\n\nReleasing ");
	if(x >= 0) output("and pulling out of ");
	output("her, you watch as she crumbles to her knees, barely supporting herself on the counter. With a smile you kneel down, grabbing hold of her sensitive shaft and milking a few more dollops. A deep, throaty moan is all that she can muster in response to this. You manage to catch it all within the glass, despite it already being close to overflowing.");

	output("\n\nKelly puffs and pants, head hanging low in her post-orgasm exhaustion, almost collapsing bonelessly upon the floor, but managing to hold herself upright, even if she wobbles a little before she catches her breath and finds her footing.");

	output("\n\nWhat a messy cook she is, splattering her counter with honey. You calmly place the glass on the counter, sure that you have collected far more than necessary.");

	output("\n\nShe puffs a little, but manages to grin at you. <i>\"You know what they say, half the fun is making the mess... or something. Besides, I'll clean it up once I'm done mixing the glaze.\"</i> She waves a hand in dismissal.");

	//if cock:
	if(x >= 0)
	{
		output("\n\nPersonally, you could use some help cleaning up right now. You thrust your half-erect ");
		output("[pc.cockNounSimple " + x + "]");
		output(" out for her.");
		output("\n\nShe glances towards it, and then smirks. <i>\"Well... I suppose it wouldn't hurt to clean it now,\"</i> she confesses, licking her lips. She kneels down to better facilitate herself, reaching out and tenderly taking hold of your member. She leans her head forward, but stops shy of actually kissing it, instead opening her mouth and letting her tongue extend. It writhes sinuously through the air, undulating as it twines itself about your length, rippling gently as it strokes up and down.");
		output("\n\nYou grin to yourself as her tongue quickly brings you back to full mast. You pat her head appreciatively as you sigh in pleasure; Kelly is such a good girl, cleaning up after herself like this. If she continues being this dedicated you’ll just have to give her a treat.");
		output("\n\nHer eyes light up at your praise and her tongue redoubles its assault on your sensitive parts, caressing you with the most inhumanly skilled and delicious tenderness along your length and across your girth, squeezing and rubbing, now fast, now slow, now tender, now rough, milking you with more skill than any ordinary hand could.");
		output("\n\nHer tongue feels too good, the irregular motions only spur you on. You find yourself gripping her hair, out of reaction rather than any intention of hurting her, though you are quick to release her and pat her head apologetically. It doesn’t seem she’s mad, though; actually, seeing how she’s driving you nuts with her limb-like tongue only makes her try all the harder. It’s all you can take, and without warning you groan and climax right then and there.");
		output("\n\nHer tongue uncoils itself like a whip, letting your cock go loose and dangling freely as she closes her eyes and opens her mouth, letting you spray your [pc.cumNoun] all over her face. Her lips are curled into a blissful expression, seemingly lost in a perverse rapture as your semen washes over her. She turns her face to this angle and that, striving to make sure you cover every last inch of her face, her neglected shafts now hard again between her legs.");
		output("\n\nYou take a step back and admire your handiwork. Kelly’s face is completely plastered with [pc.cum]. Much to her apparent enjoyment. She lifts her head up, letting it run down her cheeks and neck, dribbling into the canyon of her cleavage, then sighs hugely. <i>\"Nothing feels as good as a nice plaster of cum, that's what I always say,\"</i> she giggles, finally opening her eyes and batting them at you. <i>\"What do you think? Do I look better with this on?\"</i> she suggests, then shrugs. <i>\"But ah well, I can't wear this forever,\"</i> she notes to herself. As you watch, her inhuman tongue stretches out and begins to rub itself over her face, lapping up every drop with lewd slurps until she is clean as a whistle. Patting her belly appreciatively, she climbs back to her feet.");
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
	addButton(1,"Serve Her",serveKellyDindinsAfterUsingHerHoney,undefined,"Serve Her","You will serve dinner.");
	addButton(2,"No",noServingFoodAfterKellyUsesHerCum,undefined,"No","Everyone will get their own meal.");
}

//[=Yes=]
public function haveKellyServeAfterUsingHerHoney():void
{
	clearOutput();
	userInterface.showBust("KELLY_NUDE");
	showKellyName();
	author("Quiet Browser & LD");
	output("Nodding you take your plate and hand it over for her.");

	output("\n\nShe smiles and accepts it from you, placing it in front of her and taking up the carving knife, meat fork and salad tongs in turn. <i>\"Now, lets see here... first, some salad; need to eat healthy if you want plenty of stamina,\"</i> she notes, applying a generous helping of salad as she speaks. <i>\"And next, a nice, big, thick, juicy cut of meat; just the way you like it,\"</i> she notes, winking at you as she slices a sizable piece from the ham and applies it to your plate in turn. Stopping, she looks at your plate and shakes her head. <i>\"That should be enough; don't want you getting overstuffed before dessert, no?\"</i> she comments, smirking as she does.");

	output("\n\nCome to think of it, you don’t recall seeing her prepare anything for dessert. So what is she planning? You ask teasingly.");

	output("\n\n<i>\"Oh, I think you'll like it. It's a special recipe all my own; very sticky and sweet, and oh, so messy, too, but that's just part of the fun,\"</i> she grins.");

	output("\n\nIn that case, you’ll be looking forward to it.");

	output("\n\nShe grins at hearing that, hands you your now-filled plate, and then turns to filling her own plate in turn.");
	processTime(2);
	clearMenu();
	addButton(0,"Next",eatingWithKellysHoneyForSeasoning);
}

//[=ServeHer=]
public function serveKellyDindinsAfterUsingHerHoney():void
{
	clearOutput();
	userInterface.showBust("KELLY_NUDE");
	showKellyName();
	author("Quiet Browser & LD");
	output("You get up and extend your hands, motioning for her to hand over her plate. You don’t trust her to set up her dish herself, so you’ll be doing that for her. Make sure she eats all the healthy stuff. Otherwise it’ll all wind up going to her ass and breasts.");

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
public function noServingFoodAfterKellyUsesHerCum():void
{
	clearOutput();
	userInterface.showBust("KELLY_NUDE");
	showKellyName();
	author("Quiet Browser & LD");
	output("You get up, taking you own plate in hand. You thank her, but it’s simpler if you get the food yourself.");

	output("\n\nKelly just smiles and nods in an understanding fashion. <i>\"Okay, that's fine,\"</i> she replies. <i>\"Just give me the utensils when you're done so I can get my own.\"</i>");

	output("\n\nYou quickly fill your plate with the appropriate portions you’ll be having, handing over the utensils for Kelly to gather her own food. She wastes little time in dishing up her own servings as well.");
	processTime(1);
	clearMenu();
	addButton(0,"Next",eatingWithKellysHoneyForSeasoning);
}

//All rejoin here//
public function eatingWithKellysHoneyForSeasoning():void
{
	clearOutput();
	userInterface.showBust("KELLY_NUDE");
	showKellyName();
	author("Quiet Browser & LD");
	output("Now that both of you have loaded plates in front of you, Kelly raises her cutlery with a gleeful expression. <i>\"Alright, let's eat!\"</i> she cheers, already putting fork and knife to her ham.");

	output("\n\nWithout further ado, you stab your ham and cut off a piece. It tastes great, you find yourself humming as you bite into the soft flesh. The sauce adds a great aftertaste and you can really tell the bittersweet taste of honey with a touch of lemon.");

	output("\n\nKelly watches you hungrily; even as her own hands cut some ham on auto-pilot, her eyes never leave you or your plate, a faint smirk on her lips. <i>\"Good stuff, isn't it?\"</i> she asks, taking a mouthful of herself and humming with delight as she savors it.");

	output("\n\nYou nod in agreement.");

	output("\n\n<i>\"I knew it would be,\"</i> she says, visibly preening. <i>\"My honey's better than any brand you'll get out of a bottle, I'd bet on that,\"</i> she boasts.");

	output("\n\nYou roll your eyes. She sure likes to keep bragging about her honey, doesn’t she?");
	if(pc.hasCock())
	{
		if(pc.hasCock() && pc.cumType == GLOBAL.FLUID_TYPE_HONEY) 
		{
			output(" Perhaps <b>you</b> should provide the honey next time.");
		}
		else if(pc.hasCock())
		{
			output(" It might not be honey, but perhaps <b>you</b> should provide the seasoning next time?");
		}
		if(pc.isNude()) output(" You reach under the table to stroke your [pc.cockBiggest].");

		output("\n\n<i>\"Hey, if you got it, flaunt it,\"</i> she states, unabashed at being called a braggart. <i>\"But as for trying <b>your</b> ");
		if(pc.cumType == GLOBAL.FLUID_TYPE_HONEY) output("honey");
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
	//link to sex scenes with special intros turned off.
	addButton(0,"BlowHer",kellysCocksGetBLOWN,undefined,"Blow Her","Give Kelly a blowjob.");
	addButton(1,"EatHerOut",eatOutKellysQuoteUnquoteCunny,undefined,"Eat Her Out","Eat Kelly out.");
	addButton(3,"Refuse",refuseDesertFromKellysWang);
}

//[=Refuse=]
public function refuseDesertFromKellysWang():void
{
	clearOutput();
	userInterface.showBust("KELLY_NUDE");
	showKellyName();
	author("Quiet Browser & LD");
	output("You shake your head at Kelly. She really has a one-track mind doesn’t she? Well, you apologise, but you’ll have to refuse her invitation.");
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
	tempNudeOff();
	if(!pc.isNude()) output(" With a quick stop to gather your gear and dress up, y");
	else output(" Y");
	output("ou thank her for the food and make your way towards the door.");

	output("\n\n<i>\"Come back anytime, honey; you might be a tease, but you're still damn fine company,\"</i> Kelly calls after you before you close the door.");
	processTime(7);
	clearMenu();
	addButton(0,"Next",move,"SOUTH ESBETH 2");
}

//[=HelpHer=]
public function helpKellyFindHerHoneyThisWasntAPloyForCumPlayAtAll():void
{
	clearOutput();
	userInterface.showBust("KELLY_NUDE");
	showKellyName();
	author("Quiet Browser & LD");
	output("You easily locate the jar and with a gentle tap on her shoulder you hold it out for her.");

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
		
		output("\n\nKelly stretches and makes herself comfortable. <i>\"So... we got time until dinner is served.\"</i> She leans over, batting her eyes at you. <i>\"Why don’t you tell me more about yourself? The brave Captain Steele?\"</i>");

		output("\n\nWell, since she’s been nice enough to invite you for dinner, you suppose you could share a bit about yourself.");
		if(pc.isNude()) 
		{
			output(" Besides, it’s not like you got anything to hide. You stretch yourself, displaying your body in all its naked glory for her benefit.");
			output("\n\nShe openly ogles your nude form, licking her lips, but surprisingly doesn't do anything more than that, letting her appreciation speak for itself. ");
		}
		else output("\n\n");
		output("She smiles and draws herself up. <i>\"So, " + pc.mf("mister","miss") + " big, bad space explorer; what tales do you have to tell of Mhen'ga? I hear our jungles are full of all sorts of strange critters; surely someone as brave as you has met a few of them?\"</i> she grins, leaning herself against you, one breast pressed insistently against your [pc.chest]. <i>\"I've... had a bad experience or two in the woods, so I stay in town, where it's safe, but I still always wanted to know more about what's out there, ya know?\"</i> she asks, shrugging her shoulders.");
		
		//build 
		var choices:Array = new Array();
		//Zil
		if(flags["TIMES_MET_FEMZIL"] != undefined || flags["ENCOUNTERED_ZIL"] != undefined) choices[choices.length] = 1;
		//Naleen
		if(flags["TIMES_MET_NALEEN"] != undefined || flags["TIMES_MET_MALE_NALEEN"] != undefined) choices[choices.length] = 2;
		//Venus Pitcher
		if(flags["TIMES_MET_VENUS_PITCHER"] != undefined || flags["TIMES_CAUGHT_BY_ELDER_VENUS_PITCHER"] != undefined) choices[choices.length] = 3;
		//Cunt Snake
		if(flags["MET_CUNT_SNAKE"] != undefined) choices[choices.length] = 4;
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
		}
	}
	else
	{
		output("\n\n<i>\"Hi honey; miss me?\"</i> she giggles, draping an arm over your shoulder and snuggling close to you, her breasts pushing against your own [pc.chest].");

		output("\n\nYou reach down to cup one of her breasts, giving it a quick grope. Your other hand reaching around her to hug her and bring her chin up so you can give her a friendly peck on her lips.");

		output("\n\nShe lets out an appreciative mumble as your fingers close over sensitive titflesh, gladly letting you lean in to kiss her. Her arms wrap themselves over your shoulders, pulling you tighter against her body as she deepens the kiss, her zil-like tongue probing insistently at your [pc.lips], looking for the slightest weakness to slide inside.");

		output("\n\nYou accept her and move your other hand to her breast. You cup both orbs, hefting and massaging them; every now and then you give her nipples a little tug, earning an excited squeak out of your laquine lover.");

		output("\n\nWith a pleased hum she shifts on the couch, falling over onto her back and dragging you down with her, her long, powerful legs wrapping themselves around your waist to hug you closer to her. ");
		if(!pc.isNude()) output("Her twin shafts brush against your [pc.crotchGarments], warm enough that you can feel a sense of heat against your [pc.belly] even through them.");
		else output("Naked as you are, there is nothing to keep her shafts pushing against your [pc.belly], hot and hard against your [pc.skin].");
		output(" She keeps kissing you, tongue squirming as it wraps affectionately around your own [pc.tongue], then slurps lewdly out between your lips as she breaks the kiss, eyes half-closed and chest heaving as she pants for breath. Her arms move and pull you down against her, burying your face squarely in her cleavage. <i>\"Oh, I do love it when you want to play,\"</i> she giggles, smooshing your face a little deeper into her tits, then smirking down at you.");

		output("\n\nYou take advantage of your position to attack her pillowy mounds, nuzzling and gently nipping her erect nubs.");

		output("\n\nShe moans and gasps, arching her back, her buttons stiff and firm against your lips, shafts hot and hard against your belly. <i>\"Mmm...somebody wanna have some fun while we wait for supper?\"</i> she suggests, licking her lips and giggling at the thought. Her hands stroke their way down your back to give the cheeks of your [pc.butt] an inviting squeeze.");

		output("\n\nMight as well. She looks like she needs it and you want it too, just have to be careful not to let the ham burn, or you’ll have to find something else to eat.");

		output("\n\nKelly titters at that, then leans in for another kiss....");
		pc.lust(33);
	}
	output("\n\nTime passes quite enjoyably, and soon enough, the two of you are in the kitchen, dishing up hearty servings of glazed ham and salad, grabbing some cutlery from the drawers before heading back to the table to eat.");

	output("\n\nDespite what one might think, Kelly certainly knows how to set a table. A beautiful floral-printed green tablecloth covers a richly polished table of local hardwood, chairs of the same material and engraved with floral and vine designs positioned around it. She's set out two plates, actual old-fashioned china, each delicately painted with alien symbols and plants, and beside each are knives and forks that are either real silver or highly polished stainless steel. A high fluted glass vase containing some of the local blooms takes pride of place near the center of the table.");
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
public function helpKellyCleanUpAfterDindinsWithNormalHoney():void
{
	clearOutput();
	userInterface.showBust("KELLY_NUDE");
	showKellyName();
	author("Quiet Browser & LD");
	output("You decide you’d rather help her get the dishes done. It’s the least you can do, besides you can relax with her later.");
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
	else if(pc.isNice())
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
public function relaxAfterEatingRegularHoneyMealWithKelly():void
{
	clearOutput();
	userInterface.showBust("KELLY_NUDE");
	showKellyName();
	author("Quiet Browser & LD");
	output("Nodding, you head over to her couch, plopping down and sighing as you lean back and close your eyes for a spell.");
	output("\n\nKelly carries on into the kitchen nonplussed, and from within you can hear the sounds of running water and dishes being scrubbed. Soon enough, she finishes her tasks and comes out to join you.");
	postMealEpilogue();
}

//Both choices join here
public function postMealEpilogue():void
{
	userInterface.showBust("KELLY_NUDE");
	showKellyName();
	author("Quiet Browser & LD");
	output("\n\n<i>\"Well, honey... since dinner went down so smooth, how about some dessert before you go, hmm?\"</i> Kelly's voice is husky with desire as she suggests this, one hip outthrust, shafts rising shamelessly before her, one hand kneading her breasts with abandon as she awaits your decision.");
	tempNudeOff();
	processTime(12);
	//Display Sex Scene options, PC gains a boost to Attraction (say, 15, 20?)//
	kellyAttraction(15);
	kellyBarSexMenu();
}

//Flirt
public function flirtWithKellyUnknown():void
{
	clearOutput();
	userInterface.showBust("KELLY");
	showKellyName();
	author("Quiet Browser & LD");
	output("Kelly's lips curl into a faint grin and she closes her eyes, giving her head a small shake. <i>\"Aw, surely you can do better than that, honey? Don't I deserve a little more attention than that?\"</i> she teases you, opening her eyes as she awaits your response.");
	processTime(1);
	//[Aggressive][Mischievous]
	clearMenu();
	addButton(0,"Aggressive",aggressiveFlirtingWithKelly,undefined,"Flirt","Flirt aggressively.");
	addButton(1,"Mischievous",mischievouslyFlirtingWithKelly,undefined,"Flirt","Flirt with Kelly mischievously.");
}

//[=Aggressive=]
public function aggressiveFlirtingWithKelly():void
{
	clearOutput();
	userInterface.showBust("KELLY_NUDE");
	showKellyName();
	author("Quiet Browser & LD");
	output("So, she wants more? You’ll give her more....");
	output("\n\nWithout saying a word, you get up, knocking ");
	if(!pc.isTaur()) output("your chair");
	else output("a nearby chair");
	output(" on the floor as you advance on her. With one hand, you grab a luscious breast, pulling her bikini up as you pinch her nipple. Your other hand undoes the button to her jean shorts, forcing her zipper down as you grasp a cock.");

	output("\n\nKelly gasps in shock, mouth falling open at your boldness. <i>\"[pc.name]-\"</i>");

	output("\n\nYou silence her with a rough kiss, not waiting for her to come to terms with your actions as you thrust your [pc.tongue] into her maw.");

	output("\n\nA muffled moan reverberates along your [pc.tongue], Kelly's eyes sinking closed as she enjoys your dominance of her mouth, her cock growing hard and firm under your fingers... but then her eyes spring open and she shoves back against your chest, pushing you out of her mouth. <i>\"Whoa, honey, stop it!\"</i> she protests. <i>\"Not that I don't like you when you're forceful, but Burt promised he'd throw me out on my cute little ass for life if I messed up his bar again - and this is the only bar on the planet!\"</i> she gasps in dismay. <i>\"Why don't you let me take you home, huh? We can make as much mess as we want there...\"</i> she purrs seductively, changing from pushing you away to cuddling meaningfully up against you.");

	output("\n\nYou pull back, zipping her jeans back up and pulling her bikini top down on her nipple again. Fine, but she’d better be quick, or you’ll pull her pants down and have your way with her on the street.");

	output("\n\nShe lets out a lusty chuckle at that. <i>\"You do say the sweetest things, honey... come on, let's make tracks,\"</i> she says, climbing to her feet and heading for the door.");
	processTime(2);
	pc.lust(15);
	clearMenu();
	addButton(0,"Next",kellyBarFlirtContinuation);
}

//[=Mischievous=]
public function mischievouslyFlirtingWithKelly():void
{
	clearOutput();
	userInterface.showBust("KELLY");
	showKellyName();
	author("Quiet Browser & LD");
	output("Better? Well if she says so....");

	output("\n\nYou get back on your [pc.feet] and proceed towards the nearest group of stranger you can find.");

	output("\n\n<i>\"Hey, wait!\"</i> Kelly splutters indignantly, springing to her feet and slamming her hands angrily on the table behind you. <i>\"You can't just walk up to me and then go chasing some other piece of tail!\"</i> she protests. <i>\"I thought you wanted me?!\"</i>");

	output("\n\nShe said you could do better, who are you to dispute? You smirk.");

	output("\n\n<i>\"Better than me? As if! Nobody here's better than me! You just come back home with me and I'll prove it!\"</i> she snaps, drawing herself upright with all the wounded pride she can muster.");

	output("\n\nYou shrug, if she’s so sure she wants you, fine. You smile.");

	output("\n\n<i>\"You bet your sweet ass I... oh, you dirty little; you just played me, didn't you?\"</i> Kelly asks , realisation visibly dawning on her face. <i>\"Oh, well-played, " + pc.mf("sir","madam") + ", well-played indeed,\"</i> she giggles, clearly amused at how you tricked her. A coy look in her eyes suggests she's plotting how to get you back for that, as she starts strutting proudly towards you. <i>\"C'mere, you; you want me, you got me... or do I have you?\"</i> she suggests, taking your hand and dragging you towards the door.");

	output("\n\nYou chuckle. You don’t know, does she?");

	output("\n\nShe grins at you, ogling you hungrily. <i>\"We'll see when we get home, honey....\"</i>");
	processTime(2);
	pc.lust(5);
	clearMenu();
	addButton(0,"Next",kellyBarFlirtContinuation);
}

//Both options rejoin here//
public function kellyBarFlirtContinuation():void
{
	clearOutput();
	userInterface.showBust("KELLY_NUDE");
	showKellyName();
	author("Quiet Browser & LD");
	output("As a young frontier town, it doesn't take long to reach Kelly's home, a prefabricated bungalow. Despite being prefabricated, it's roomy enough, with separate rooms for kitchen, living room, bathroom and bedroom. Kelly's taken steps to make it more \"homey\", but you don't get much of a chance to observe these; the moment you are inside, she turns and hungrily kisses you, rubbing herself against your front and letting you feel her erections and the hardness of her nipples as she grinds on you.");

	output("\n\nYou push the amorous laquine away for a moment. You can’t get to the good bit if she’s still dressed.");

	output("\n\nShe pants heartily in her lust, swallows, and nods dumbly in agreement, stepping back and holding still to let you take her clothes off.");

	output("\n\nYou immediately work the button on her jeans shorts and pull the zipper down. You don’t even have to pull it down yourself, as her erections jump up like accusing fingers, knocking her lower garments down as they begin to bead. She’s really looking forward to this, huh?");

	output("\n\n<i>\"Gee, and here I thought I was always this horny,\"</i> Kelly replies, her sarcasm less than effective when she giggles at it a heartbeat later. Evidently she's not content to wait for you, though, as her \"top\" promptly drifts to the floor beside you. <i>\"There I am... so, do I get to return the favor?\"</i> she asks, licking her lips.");

	output("\n\nIt’s not like you have anything to hide, you smile.");

	output("\n\nShe smiles back and steps in closer to remove your [pc.gear]; she doesn't rip it off of you, like you might have expected, but she visibly savors everything that is revealed, tongue darting out to caress your [pc.nipple] as she makes her way down your chest, loudly inhaling your musk as she exposes your loins. <i>\"Mmm... much better,\"</i> she declares, standing up again. <i>\"So, honey, had anything in particular in mind, now that we're here...?\"</i>");
	processTime(20);
	pc.lust(10+rand(3));
	//Display sex options//
	kellyBarSexMenu();
}
public function kellyBarSexMenu():void
{
	clearMenu();
	userInterface.showBust("KELLY_NUDE");
	showKellyName();
	author("Quiet Browser & LD");
	//Sex Scenes
	//Hyperplay
	//Requires Affection >=50% & PC has a dick.
	if(kellyAttraction() >= 50 && pc.cockThatFits(chars["KELLY"].vaginalCapacity()) >= 0) addButton(0,"HyperPlay",kellyHyperPlayAwwwYiss,undefined,"Hyper Play","Fuck Kelly with a cock and see how big hers will grow in the process. Note that this will consume a Throbb if you have one in your inventory (once only).");
	else addDisabledButton(0,"HyperPlay","Hyper Play","You need to be able to fuck her vagina with a penis for this scene, and Kelly's affection for you must be fairly high.");
	//Get Blown
	if(pc.hasCock()) addButton(1,"GetBlown",getBlownByKelly,false,"GetBlown","Get a blowjob from the horny herm.");
	else addDisabledButton(1,"GetBlown","GetBlown","You can't get a blowjob without first having an eligible penis.");
	//Get Licked
	if(pc.hasVagina()) addButton(2,"GetLicked",getLickedOutByKellllaaaahhhh,false,"GetLicked","Get a vagina properly served by the laquine.");
	else addDisabledButton(2,"GetLicked","GetLicked","You need a pussy in order to get your pussy licked.");
	if(pc.hasCock() || pc.hasVagina()) addButton(3,"Oral Her",oralHer,undefined,"Oral Her","Go down on Kelly or suck her cocks, whichever you prefer.");
	else addDisabledButton(3,"Oral Her","Oral Her","This scene does not current support genderless characters.");
	if(pc.hasVagina() && pc.isTaur()) addButton(4,"Get DPed",kellyDPForTaursThatWannaGetDPed,undefined,"Get DPed","Take one of Kelly's lengths in each hole. Of course any vaginas will get priority.");
	else if(pc.hasVagina()) addButton(4,"Get DPed",getDPedByKelly,undefined,"Get DPed","Take one of Kelly's lengths in each hole. Priority is given to multiple vaginas over assholes.");
	else addDisabledButton(4, "Get DPed", "Get DPed", "You need to have two holes close together for this scene to work.");
	if (kellyAttraction() >= 50 && pc.cockThatFits(chars["KELLY"].analCapacity()) >= 0) addButton(5, "Assfuck", doKellyInTheBumBUMBUMMMMMMMM, undefined, "Assfuck", "Do her right up the bumhole!");
	else addDisabledButton(5, "Assfuck", "Assfuck", "You need a cock that'll fit into her butt, and Kelly's affection for you must be fairly high.");
	
	addButton(14,"Leave",move,"SOUTH ESBETH 2");
}

//Sex Scenes
//Hyperplay
//Requires Affection >=50% & PC has a dick.
public function kellyHyperPlayAwwwYiss():void
{
	var x:int = pc.cockThatFits(chars["KELLY"].vaginalCapacity());
	if(x < 0) x = pc.smallestCockIndex();
	var y:int = -1;
	//If you got two dicks, check to see if one will fit elsewhere
	if(pc.cockTotal() > 1) y = pc.cockThatFits2(chars["KELLY"].vaginalCapacity());
	
	clearOutput();
	userInterface.showBust("KELLY_NUDE");
	showKellyName();
	author("Quiet Browser & LD");
	//1st time
	if(flags["KELLY_HYPERPLAY_COUNT"] == undefined || flags["KELLY_HYPERPLAY_COUNT"] == 0)
	{
		//1st Time (Repeatable)
		//Play each time the PC triggers HyperPlay without providing a dose of Throbb
		if(flags["KELLY_HYPERPLAY_COUNT"] == 0)
		{
			output("Kelly swallows, but nods, body betraying her true feelings as her shafts rise up towards her belly. <i>\"You're sure, then? You really want to see my full size? Alright, but I still haven't been able to get a hold of any Throbb myself - I'll keep looking, but it'd be quicker if you found it. Have you had any luck there?\"</i> she asks, rubbing her erections in anticipation.");
		}
		else
		{
			flags["KELLY_HYPERPLAY_COUNT"] = 0;
			output("Kelly's expression is baffled. <i>\"You want what? [pc.name], you do remember what I said, right? These monsters here even scare other laquines,\"</i> she pats the impressive mass of exposed shafts and balls between her legs for emphasis. She shakes her head. <i>\"I tell you, not only do all the partners I try to get run away at the sight of them, it's impossible to actually squeeze them in if they don't, and if I let them pitch for me instead, they keep getting in the way. I can hardly wear anything for fear I'll burst out of it if I get an erection, they make it plain to see when I'm turned on, and they're so sensitive I get horny really easy - even easier than I do now,\"</i> she amends herself.");

			output("\n\n<i>\"So, you don’t like being big?\"</i> you ask her.");

			output("\n\nKelly winces at that question, biting her lip as she visibly contemplates how to answer that. <i>\"Well... I didn’t say that,\"</i> she confesses hesitantly. <i>\"I mean, they might get in the way a lot, but all that flesh to stroke and touch... it certainly makes handjobs a lot more fun,\"</i> she admits. Almost unthinkingly, her hand reaches down to one of her her two cocks, the already half-erect member growing stiffer as her finger trails across its flat glans. <i>\"Actually... to have all that thick, virile meat hanging out of me, slapping between my legs when they're flaccid, bouncing between my boobs when they're up, just waiting for me to reach out and kiss them... mmm... it's actually kind of sexy,\"</i> she shyly states, both members now pointing up towards her tits now, hard against her belly.");

			output("\n\nWell, there’s her chance now. You want to see her big and she likes being big. Perfect.");

			output("\n\nKelly bites her lip indecisively, but from the way you can see precum starting to bead at the tip of each dick and drool down, you know you've got her. <i>\"O-okay,\"</i> she declares, nodding as she convinces herself. <i>\"If you want to see all of me, then I'll give you a show to remember.\"</i> she declares. <i>\"But my medicine just doesn't wear off like that; I'll need a counter-agent first. There's this mod I've heard of called Throbb; a small dose of that should be just the trick. But I don't have any on me, and it's not the sort of thing I can get at work, though I could synthesize more for my needs if I did have some. Do you have any?\"</i> she asks.");
		}
		//No Throbb in inventory:
		if(!pc.hasItem(new Throbb(),1))
		{
			output("\n\nYou shrug. Sadly you don’t really have any on yourself. But you’ll keep this chat of yours in mind in case you ever come across any.");
			output("\n\n<i>\"Good idea,\"</i> Kelly grins. <i>\"But, since we both seem to be in the mood for some 'fun', I'm sure there's plenty of other things we can do together,\"</i> she suggests, posing slightly for emphasis.");
			processTime(4);
			//(display sex options)
			kellyBarSexMenu();
			return;
		}
		else
		{
			output("\n\nYou dig through yours stuff and come up with the mod for Kelly.");

			output("\n\nKelly takes it from you, a little uncertainly, but with a determined look on her face, already adjusting the delivery mechanism. <i>\"Right, I just need a little of this; too much and I might end up getting modded, not countered,\"</i> she explains. Satisfied with her tweaking, she nods and brings the business end of it to rest against the base of her shafts. <i>\"Alright, here goes nothing,\"</i> she declares, and depresses the trigger, hissing as the minute dose rushes into her bloodstream.");
			output("\n\nShe shivers, and rubs the injection site tenderly. <i>\"Okay now... it's going to take time for this stuff to kick in, but arousal should help; why don't you and I have a little fun to give it a jumpstart?\"</i> she suggests. <i>\"Your cock in my cunt would be just the thing... besides, it'd be more fun than just sitting around watching my junk,\"</i> she manages to quip dryly.");
			output("\n\nSounds like a plan.");
			pc.destroyItem(new Throbb(),1);
		}
	}
	//After Throbb (Repeatable)
	//Regular scene after providing the one Throbb
	else
	{
		output("Kelly chuckles and shakes her head. <i>\"I can't believe I finally found a lover who isn't scared of what I'm packing - and a hottie, no less!\"</i> she giggles. <i>\"Oh, but honey, I'm ready to grow for you whenever you like - I love letting it all hang out, but when it means I get to let you play with them to your heart's content too? Really gets my motor running,\"</i> she purrs.");
		//Kind:
		if(pc.isNice())
		{
			output("\n\nNo sense putting it off then. Let’s get started!");
			output("\n\nKelly laughs at that. <i>\"You sound more eager than I do! Alright, honey, let's have some fun, but give me a minute to get my new medicine,\"</i> she purrs, then struts off to fetch her personal supply of Throbb.");
		}
		//Mischievous:
		else if(pc.isMischievous())
		{
			output("\n\nYou grab her shoulders, spin her around and send her off with a slap on the butt. <i>\"Go get ready then. That Throbb isn’t going to apply itself.\"</i>");
			output("\n\nThe laquine catches herself neatly, smirking back over her shoulder at you, but says nothing, instead giving you a cheeky little wave of her tail before heading on to do just that.");
		}
		//Hard:
		else
		{
			output("\n\n<i>\"Well, I’m waiting,\"</i> you tell her, crossing your arms.");

			output("\n\nKelly simply giggles and wags a finger at you. <i>\"Patience, honey. Just let me get my grow-juice,\"</i> she informs you with a smile. Despite her words, she wastes no time in crossing the room to where she keeps that 'grow-juice' stashed.");
		}
		output("\n\nWith the mod recovered, Kelly returns to you, brandishing it with a grin and a flourish. <i>\"Ready? Here we go!\"</i> she cheers, plunging it without hesitation into the base of her dicks and depressing the trigger. She shudders appreciatively as she withdraws it, then places it aside. <i>\"Now, let me guess; you'd like to do a little hands-on coaxing for my growth? Hmm?\"</i> she asks you, a cheeky grin writ wide on her face.");
		output("\n\nYou walk up to her, caressing her side as you circle her and hug her from behind. A hand on her hip and another encircling her topmost shaft. A teasing stroke drawing a small moan from the laquine.");
		output("\n\n<i>\"Mmm... let's take this to bed, shall we?\"</i> Kelly suggests. WIth no reason to oppose her, you let her lead the way to the bedroom.");
	}
	//All variants rejoin here//
	output("\n\nOnce in the bedroom, Kelly wastes no time; she steals a quick kiss from you, then clambers onto the bed in a kneeling position, one leg half-curled under her, exposing the juicy bunny-cunny that her four bloated balls would normally obscure. <i>\"I'm waiting~\"</i> she says, drawing the word out and then giggling, tail flicking teasingly towards you. <i>\"Let's do it this way; it's easier to find your target,\"</i> she chuckles.");

	output("\n\nWell, if that's what she wants, who are you to argue? You close the distance between you, reaching out with one hand to gently cup one cheek of her luscious ass, feeling the plump muscle squish pleasingly under your grip. Your partner lets out a trilling noise of approval, shaking her hips and the air filling with a sweet scent as her twin shafts rain a steady trickling stream of precum. You continue to grope and squeeze, caressing her ass with your fingers in approval.");
	//Kind:
	if(pc.isNice()) output("\n\nHer butt feels really nice on your hands, you remark.");
	//Mischievous
	else if(pc.isMischievous()) output("\n\nIt’s surprising how great her butt is, considering she spends most of her day sitting on it.");
	//Hard:
	else output("\n\nThis is a butt you could see yourself slapping over and over. So firm and yet so soft. You’d love to see it jiggle for you.");
	output("\n\n<i>\"I work out,\"</i> she professes candidly. <i>\"Now, nice as that feels, though, I think somebody is getting a little distracted...?\"</i> she teasingly asks.");

	output("\n\nYou respond to that with a slap on one ass-cheek, the crack of flesh on flesh audibly as it jiggles before you, an appreciative moan rippling its way out of the laquine's throat. <i>\"Patience, patience,\"</i> you instruct her. She needs to get into the mood for this, first. Still, as fun as it may be, it is time to move on from her ass... and so, laying yourself down behind her, you bring your face closer to her feminine treasure. She wriggles slightly as she feels your hot breath on her labia, but holds herself still. You're dimly aware of her cocks growing bigger, slowly but steadily, out of the corner of your eye, but you have something else in mind. Opening your mouth, you let your [pc.tongue] extend out, then lean close enough to slowly swipe it through her netherlips.");

	output("\n\nAn appreciative coo echoes from the direction of Kelly's head, but you are more concerned with savoring her flavors. Though it's not the honey that is steadily seeping from her twin shafts, it's still a very sweet flavor - sugary sweet, in fact. Certainly pleasant enough to encourage you to take a second lick, and then a third, rolling your tongue through her plump pussy and plumbing her wet depths, soaking up the tastes that ensue. A steady stream of approving groans and moans fill the air, as does the sweet scent of honey, Kelly's arousal increasing with each caress you give her fem-sex. Her cunt winks and ripples, trying to catch and hold your squirming tongue in her depths, but you slide free, teasing her at her futile efforts.");

	//Long or SuperLong Tongue
	if(pc.hasTongueFlag(GLOBAL.FLAG_LONG))
	{
		output("\n\nAware of her quad swaying back and forth as she rocks under your ministrations, a wicked idea comes to mind. Your inhuman [pc.tongue] worms its way through her slick netherlips and slithers downwards; even as some of it continues stroking and teasing her femininity, the rest of it writhes like a tentacle, brushing gently over the swollen skin of her quad-stuffed girlsac. It moves across the tender flesh with tantalizing strokes, reaching along and then looping itself around the base of her two shafts, filling your senses with the strange cocktail of tastes: her sugary-sweet pussy-juices, mingling with the honeyed taste of her precum as it paints her shafts, all undercut with just the faintest salty tang of sweet.");
		output("\n\n<i>\"Oh, gods... I'm gonna have to remember that trick,\"</i> Kelly groans, deep and low in her throat, longing filling her voice.");
	}

	output("\n\nYour partner grunts and gasps, making you decide that she's had enough foreplay and prompting you to remove your [pc.tongue] and straighten up again, which elicits a groan of disappointment from the squirming laquine. Pulling yourself into position behind her, you squeeze an asscheek and ask if she's ready now.");

	output("\n\n<i>\"No, I'm always this hot and bothered, with my cunt gushing like a drinking fountain and my cocks trying to be waterspouts,\"</i> she replies dryly. Her follow-up giggle undercuts her words. <i>\"So come on baby, light my fire, I feel ready to burn...\"</i> she purrs to you.");

	output("\n\nIgnoring the somewhat cheesy invitation, you align [pc.oneCock] with her slavering pussy");
	if(y >= 0) output(" and your second cock with her asshole; she's got two, she must like taking it up both holes, right?");
	else output(".");
	output(" Steadying yourself on her hips, you slide home; so well-lubed is she that you glide in, sliding into warm, wet, velvety depths that wring your dick with greedy eagerness.");
	if(y >= 0) output(" Her ass accepts you with equal fervour, the laquine's tailhole not quite as slick, but still loose and tight at just the right moments.");
	output(" She arches her back and lets out a moan, deep in her throat, husky with lust. <i>\"Mmm... that feels good,\"</i> she purrs luxuriantly. <i>\"");
	if(y >= 0) output("And in both holes at once?");
	else if(pc.hasVagina()) output("Why, we're just made for each other, darling,");
	else output("I just wish I could show you how good this feels,");
	output("\"</i> she murmurs. You can feel her inner walls squeezing you, simultaneously milking your shaft and sucking you inside, hungry to have you in to the hilt");
	if(y >= 0) output(", both shafts frictioning each other through her flesh");
	output(". With little reason not to comply, you push deeper, making your partner moan and buck back against you, her fluffy little tail tickling against your [pc.belly] as you rut her passionately.");
	pc.cockChange();

	output("\n\nThe room is filled with the sound of flesh on flesh as your respective hips collide, Kelly moaning under you in pleasure, you voicing your own sounds of pleasure above her. Her fingers squeeze at her bedding for support, eyes screwed shut as she loses herself in the sensations. As you continue to plough her, though, you become aware of a strange dissonance in the background; a wet slapping noise that isn't the two of you. Twisting around is a little awkward, but you manage to find the source; it's Kelly's cocks! Under your ministrations, her two horse-like shafts have grown into 20-inch long monsters, bouncing forcibly against her belly and into the canyon of her cleavage in rough synchronicity with the thrusting of your hips.");

	output("\n\nHmm... if you were to get a little more involved, you might be able to see how big she can <b>really</b> get. But, it would probably require touching her dicks...");
	if(silly) output(" and it's only gay your dick touches hers, right? Hands are okay.")

	processTime(10);
	pc.lust(33);
	//[KeepGoing] [AddHandjob]
	clearMenu();
	addButton(0,"Keep Going",keepGoingWithFuckingHyperModeKelly);
	addButton(1,"AddHandJob",addAHandjobToKellyHyperFuckPlay)
}

//[=KeepGoing=]
public function keepGoingWithFuckingHyperModeKelly():void
{
	var x:int = pc.cockThatFits(chars["KELLY"].vaginalCapacity());
	if(x < 0) x = pc.smallestCockIndex();
	var y:int = -1;
	//If you got two dicks, check to see if one will fit elsewhere
	if(pc.cockTotal() > 1) y = pc.cockThatFits2(chars["KELLY"].vaginalCapacity());

	clearOutput();
	userInterface.showBust("KELLY_NUDE");
	showKellyName();
	author("Quiet Browser & LD");
	output("Your hands remain right where they are, locked onto her hips for support. Let her tend to her own maleness; you're more interested in her female parts. With this in mind, you start to thrust even harder than before, your fur-covered lover grunting in effort as she matches you thrust for thrust, moaning her pleasure for all to hear.");

	output("\n\nYou both give yourselves over to the rhythm, feeling the pleasure washing through your bodies, letting yourselves drown in the sensations of each other's bodies. Kelly's cunt");
	if(y >= 0) output(" and ass milk");
	else output("s");
	output(" you like a well-oiled machine, hot fluids slopping over your ");
	if(y >= 0) output("shafts");
	else output("shaft");
	output(" even as velvety flesh grips you like a vice. From the lustful noises that wring their way out of Kelly's throat, the feel of your ");
	if(y >= 0) output("pricks");
	else output("prick");
	output(" inside of her is just as good.");

	output("\n\nBoth of you are close; you can feel it.... It becomes a competition, then, to see who can make the other climax first. Kelly's pussy ripples and flexes with inhuman strength and dexterity, massaging every inch of your shaft.");
	if(y >= 0) output(" Although less effective, her ass does its best to keep up with her cunt.");
	output(" You, in turn, do your best to seek the most sensitive spots in her vagina, aiming for the legendary G-spot");
	if(y >= 0) output(" and doing your best to milk her oversized prostate");
	output(".");

	//Make a Willpower Check to see who cums first; you and I will need to discuss that, Fenoxo//
	//If PC cums first:
	if(pc.willpower()/2 + rand(20) + 1 < chars["KELLY"].willpower()/2 + rand(20) + 1)
	{
		output("\n\nYou just can't hold out against Kelly's milking ");
		if(y >= 0) output("holes ");
		output("and, crying out in release, you empty yourself into her.");

		//CumQuantity=Normal:
		if(pc.cumQ() < 500)
		{
			output("\n\nYour semen vanishes into the rapacious void that is the horny laquine's pussy, swallowed without a trace it was ever there... at least, externally. Kelly moans as you empty yourself inside of her. <i>\"Oh, yes!\"</i> she wails even as her own quad clenches and her cocks distend, erupting in twin cannons of jizz that send honey spraying all over, flooding her bedding, spraying against the underside of her boobs, and puddling in a great sticky pool on the floor. The air is filled with the sweet scent of her jizz, so strong it's overpowering, even as she sighs in release. <i>\"Mmm, that hit the spot.... Oh, don't worry, [pc.name]; It doesn't matter if you don't shoot much cum. All we gotta do is make you shoot a bunch of times and it'll all add up,\"</i> she giggles, rubbing her belly.");
		}
		//CumQuantity=High:
		else if(pc.cumQ() <= 2000)
		{
			output("\n\nKelly moans in pleasure as you flood her waiting womb, her stomach rising like the proverbial bun in the oven. <i>\"Oh... that did it, that did - IT!\"</i> she wails, arching her back as the feeling of your [pc.cum] inside of her pushes her past her limits and she cums, her belly interfering with the two cum-cannons somewhat, but nowhere near enough to hinder her in her efforts to try and flood the room with honey, a goal she makes a very considerable try at. Finally sighing as she spurts a last few globs of seed, she pats her belly. <i>\"Mmm... there's nothing quite like a nice, heavy load of spooge in your belly to add to some great sex, now isn't there?\"</i> she giggles.");
		}
		//CumQuantity=VeryHigh:
		else if(pc.cumQ() <= 10000)
		{
			output("\n\nKelly squeals in delight as your inhuman cascade of seed floods inside of her. <i>\"Oh, gods, yes! Fuck! Fill me up - give it to me!\"</i> she exhorts, her own cocks erupting as she climaxes; she barely even notices the honey shooting everywhere, too wrapped up in the sensations she's receiving from you. The feeling of your cock flooding her cunt, of her womb stretching rounder and fuller... she looks more and more pregnant, and still she clutches it, writhing in ecstasy, until at last even your limits are met and you have nothing more to give her. You lay there, panting, hands roaming over the dome-like expanse of her newly engorged stomach, until Kelly breaks the silence. <i>\"Now that... was incredible. A fantastic lover is one thing, but one who can cum worthy of a laquine? I might just have to keep you,\"</i> she says, in a tone such that you can almost hear her grinning mischievously. She pats her stomach, producing a muffled drum-like thumping as she does so. <i>\"Mmm... nothing like a great big belly full of jizz,\"</i> she giggles.");
		}
		//CumQuantity=Extreme:
		else
		{
			output("\n\n<i>\"F-fuck! Fuck me, fuck me, fuck me!\"</i> Kelly cries out, writhing helplessly as your deluge of semen crashes against her womb, swamping her interior in an enormous flood of [pc.cum]. So huge does her belly grow, and so rapidly, that she has to wriggle slightly onto her side and cock a leg to let her own male climax erupt, painting great streaks of honey all over the floor, filling the air with the scent of her modified semen even as some of your own spunk spurts back out around her desperately grasping netherlips, mixing your scent with hers. By the time you are both finished, the floor is covered in an inches-deep puddle of honey undercut with");
			if(pc.cumType == GLOBAL.FLUID_TYPE_HONEY) output(" more honey");
			else output(" [pc.cumNoun]");
			output(", whilst Kelly is wobbling slightly atop a belly like a beachball. She gasps and pants, too dazed from the fucking she just received to say anything coherent... though she does eventually mumble a dreamy, <i>\"Where have you been all my life?\"</i> in your direction.");
		}
	}
	//If Kelly cums first:
	else
	{
		output("\n\nYour ministrations prove superior, and it is Kelly who groans in a most exquisite defeat as climax rips its way through her body. A great deluge of honey erupts from the laquine under you, her pricks almost seeming to compete to see which can dredge up another steaming hot load of yellow-orange seed and spray it over her bed. Words cannot describe the mess she makes as her quartette of grapefruit-sized girlballs empty themselves up her monstrous chickdicks, a veritable fountain of honey flooding her bedding, spraying against the underside of her boobs, and puddling in a great sticky pool on the floor. The air is filled with the sweet scent of her jizz, so strong it's overpowering, your own ");
		if(y >= 0) output("shafts ");
		output("being milked ravenously as her cunt has its own orgasm.");
		output("\n\nIt's all too much for you and you make your own ecstatic noises as you empty yourself into Kelly's waiting womb");
		if(y >= 0) output(" and gut");
		output(".");

		//CumQuantity=Normal
		if(pc.cumQ() < 250)
		{
			output("\n\nYour semen vanishes into the rapacious void that is a horny laquine's pussy, swallowed without a trace it was ever there. <i>\"Mmm, that feels good; just the right spot,\"</i> she assures you sincerely, her tone bespeaking the smile on her lips as she rubs gently at her belly.");
		}
		//CumQuantity=High
		else if(pc.cumQ() <= 1000)
		{
			output("\n\nAlthough your shots pale in comparison to the sheer volume of your lover's, her belly still starts to bulge as you fill her womb with gush after gush of [pc.cum]. She moans like a whore as her belly rises, hands instinctively grabbing onto the swelling stomach and cradling it proudly, even as you reach your limits. <i>\"That's the way to do it, lover-" + pc.mf("boy","girl") + ",\"</i> she giggles to you.");
		}
		//CumQuantity=VeryHigh
		else if(pc.cumQ() <= 10000)
		{
			output("\n\nKelly might be a very productive girl, but you're easily a match for her. She squeals in delight, all but gibbering in ecstasy as your cum hammers into her womb with the subtlety of a mallet to the face, stretching her fatter and fuller with each passing heartbeat. Her belly grows out and out, rounder and riper with your liquid love, stretching down until it brushes the soaked bedding underneath.");
			output("\n\nShe groans softly as you finish, wriggling slightly as she adjusts to being stretched so swollen <i>\"Do you believe what they say about us laquines? That we're all mad for being crammed full of jizz?\"</i> she asks, sarcastically. Then, with a smile you can hear, <i>\"Because in my case, it's absolutely true,\"</i> she laughs.");
		}
		//CumQuantity=Extreme
		else
		{
			output("\n\nKelly babbles deliriously in shock and pleasure as your veritable tidal wave of spooge washes into her depths. Her stomach almost explodes outwards, her once-slender waistline swallowed by gallon after gallon of [pc.cum] as it floods her womb, filling it to capacity and beyond, squirting splashes of jizz back around your [pc.legs] as she wriggles and writhes against the onslaught. Any doubts that she's enjoying this are quashed when the pleasure wrings a second orgasm from her, great sprays of honey sweeping from her flares to splatter messily against the wall. Finally, mercifully, you run empty, leaving Kelly more resting atop a belly like an overinflated black-and-yellow beachball than supporting herself with her limbs.");
			output("\n\n<i>\"Oh, gods... so full...\"</i> she moans softly, swaying under the weight. <i>\"...I love it. Don't ever leave me...\"</i> she mumbles dreamily, patting her taut flesh and eliciting an almost drum-like thumping noise in response.");
		}
	}
	processTime(12);
	clearMenu();
	if(pc.cumQ() > 1000) addButton(0,"Next",kellyHyperPlayEpilogue,true);
	else addButton(0,"Next",kellyHyperPlayEpilogue);
	pc.orgasm();
}

//[=AddHandjob=]
public function addAHandjobToKellyHyperFuckPlay():void
{
	var x:int = pc.cockThatFits(chars["KELLY"].vaginalCapacity());
	if(x < 0) x = pc.smallestCockIndex();
	var y:int = -1;
	//If you got two dicks, check to see if one will fit elsewhere
	if(pc.cockTotal() > 1) y = pc.cockThatFits2(chars["KELLY"].vaginalCapacity());

	clearOutput();
	userInterface.showBust("KELLY_NUDE");
	showKellyName();
	author("Quiet Browser & LD");
	output("Well, polite is polite....");
	output("\n\nShe grunts as you drape yourself over her back for added support. <i>\"Wha?\"</i> she starts to ask, then lets out a soft gasp of realisation as she feels your hands closing around the base of each shaft. She purrs approvingly, leaning her head back to try and nuzzle her cheek against yours. Your present position makes thrusting into her a little awkward, but you certainly have a good grip on her dicks, which you put to good use.");

	output("\n\nYour hands slide up and down the twin equine shafts, exploring their immense lengths - and Kelly's not done growing yet, either. You can feel them stretching longer and longer under your touch, growing fatter and rounder in your hands. You let one girlcock go to examine her straining balls, feeling the almost cantaloup-sized globes and their sloshing weight of honeycum, rubbing your fingers across the sensitive skin, much to Kelly's enjoyment.");

	output("\n\nBending your head a little closer to one of her long, floppy ears, you stage-whisper into it, <i>\"Grow for me,\"</i> even as your hands continue to dance along her dicks and you hump against her eager pussy.");

	output("\n\n<i>\"Mmm... you only had to ask,\"</i> she replies, her voice a luxuriant purr of rapture, eyes screwed closed so she can concentrate on what you're doing to her. She shifts her weight slightly, so she is holding herself up on only three limbs, her free hand moving to her crotch. She places it gently atop your hand, for a moment, and then glides up her lengths towards her breasts, trying her best to titfuck her super-sized shafts in the position she's in. She moans in pleasure, and you shift your attention from <i>\"merely\"</i> handjobbing her to helping her with her impromptu boobjob. You squeeze and knead her ample bust, timing your thrusts to help her push her shafts through her cleavage, enveloping her cocks in warm, soft flesh even as your own");
	if(y >= 0) output(" are");
	else output(" is");
	output(".");

	output("\n\nThe treatment seems to be working; the scent of honey is overpowering now, and you realize you can actually see the heads of her shafts even when her own hips are thrusting away; she's grown up and through her boob-canyon.");

	output("\n\nShe giggles absently. <i>\"You think that's something? I'm not done yet,\"</i> she chuckles, opening her mouth and closing her eyes. You watch in fascination as her tongue stretches out...and out; a foot long bright yellow appendage that coils itself around her heads in a figure-8 loop. Muffled hums escape her throat as she wriggles and undulates, teasing her slowly-flaring tips even as you continue to fuck her womanhood and use her tits on the lower parts of her shaft. Under your combined ministrations, she just keeps getting bigger and bigger; by the time she stops, she's got twin meter-long shafts jutting from her loins, each four inches thick and gushing honeyed precum like an open tap. Her tongue-tip lifts itself to each flared head in turn, and you can actually see it bulging as it somehow sucks her juices through the tip.");

	output("\n\nYou can feel her cunt ");
	if(y >= 0) output("and tailhole ");
	output("clenching you like ");
	if(y >= 0) output("a pair of velvety vices");
	else output("a velvety vice");
	output(", and she grunts something muffled, but clearly important to her from the tone. As you feel her whole body clamp down on you, her tongue snapping back into her mouth as she cries out, breasts actually pushing against your hands from the size of the bulge racing up each shaft, it's not hard to work out what she meant.");

	output("\n\nA great deluge of honey erupts from the laquine under you, her pricks almost seeming to compete to see which can dredge up another steaming hot load of yellow-orange seed and spray it over her bed. Words cannot describe the mess she makes as her quartette of cantaloupe-sized girlballs empty themselves up her monstrous shecocks, a veritable fountain of honey flooding her bedding and puddling in a great sticky pool on the floor. The air is filled with the sweet scent of her jizz, so strong it's overpowering, your own shaft");
	if(y >= 0) output("s");
	output(" being milked ravenously as her cunt has its own orgasm.");

	output("\n\nIt's all too much for you and you make your own ecstatic noises as you empty yourself into Kelly's waiting womb");
	if(y >= 0) output(" and gut");
	output(".");

	//CumQuantity=Normal
	if(pc.cumQ() < 250) output("\n\nYour semen vanishes into the rapacious void that is a horny laquine's pussy, swallowed without a trace it was ever there. Still, small as it might be compared to her world, it's evidently enough to quench the fires burning inside her, and she moans low and exultantly as she feels your seed swirling through her depths.");
	//CumQuantity=High
	else if(pc.cumQ() <= 1000) output("\n\nAlthough your shots pale in comparison to the sheer volume of your lover's, her belly still starts to bulge as you fill her womb with gush after gush of [pc.cum]. She moans like a whore as her belly rises, hands instinctively grabbing onto the swelling stomach and cradling it proudly, even as you reach your limits.");
	//CumQuantity=VeryHigh
	else if(pc.cumQ() <= 10000) output("\n\nKelly might be a very productive girl, but you're easily a match for her. She squeals in delight, all but gibbering in ecstasy as your cum hammers into her womb with the subtlety of a mallet to the face, stretching her fatter and fuller with each passing heartbeat. Her belly grows out and out, rounder and riper with your liquid love, stretching down until it brushes the soaked bedding underneath. She groans softly as you finish, wriggling slightly as she adjusts to being stretched so swollen, looking so hugely mock-pregnant with your climax.");
	//CumQuantity=Extreme
	else output("\n\nKelly babbles deliriously in shock and pleasure as your veritable tidal wave of spooge washes into her depths. Her stomach almost explodes outwards, her once-slender waistline swallowed by gallon after gallon of [pc.cum] as it floods her womb, filling it to capacity and beyond, squirting splashes of jizz back around your [pc.legs] as she wriggles and writhes against the onslaught. Any doubts that she's enjoying this are quashed when the pleasure wrings a second orgasm from her, great sprays of honey sweeping from her flares to splatter messily against the wall. Finally, mercifully, you run empty, leaving Kelly more resting atop a belly like an overinflated black-and-yellow beachball than supporting herself with her limbs. A moan of equal parts exhaustion, pleasure and triumph heaves from her; you just know she's smiling triumphantly at taking your inhuman climax.");
	processTime(15);
	clearMenu();
	if(pc.cumQ() > 1000) addButton(0,"Next",kellyHyperPlayEpilogue,true);
	else addButton(0,"Next",kellyHyperPlayEpilogue);
	pc.orgasm();
}

//Both variants go to new page and display following text//
public function kellyHyperPlayEpilogue(hugeLoad:Boolean = false):void
{
	var x:int = pc.cockThatFits(chars["KELLY"].vaginalCapacity());
	if(x < 0) x = pc.smallestCockIndex();
	var y:int = -1;
	//If you got two dicks, check to see if one will fit elsewhere
	if(pc.cockTotal() > 1) y = pc.cockThatFits2(chars["KELLY"].vaginalCapacity());
	clearOutput();
	userInterface.showBust("KELLY_NUDE");
	showKellyName();
	author("Quiet Browser & LD");
	output("With a contented groan, Kelly allows herself to sink to her now-soaked bedding, instinctively shifting to her side");
	if(hugeLoad) output(", allowing her great belly to slosh and wobble to a stillness");
	output(" as she lands. Pulling your own ");
	if(y >= 0) output("shafts");
	else output("shaft");
	output(" free, you join her in laying there to catch your breath, the two of you simply relaxing and breathing in the strong, sweet smell that you have created together.");

	output("\n\nKelly speaks first. <i>\"It feels so good to scratch that itch, [pc.name] - thank you,\"</i> she says sweetly, snuggling up against you.");

	output("\n\n<i>\"The pleasure was all yours,\"</i> you reply, caressing one of her luscious breasts, something that elicits a knowing grin but little else from the laquine.");

	output("\n\nThe two of you remain there until you inform her that you must leave. Getting out is a little tricky with all the sticky fluid everywhere, but eventually you are off, leaving Kelly behind to clear up the mess.");
	processTime(19);
	flags["KELLY_HYPERPLAY_COUNT"]++;
	kellyFucked();
	clearMenu();
	addButton(0,"Next",move,"SOUTH ESBETH 2");
}

//Do Kelly's Ass
//Naturally, PC needs a dick.
public function doKellyInTheBumBUMBUMMMMMMMM():void
{
	clearOutput();
	userInterface.showBust("KELLY_NUDE");
	showKellyName();
	author("Quiet Browser & LD");
	var x:int = pc.cockThatFits(chars["KELLY"].analCapacity());
	if(x < 0) x = pc.smallestCockIndex();

	output("She smiles as she hears your suggestion. <i>\"Does somebody have a craving for bouncy bunny butts, hmm?\"</i> she asks, eying you as she studies your face. <i>\"Well, maybe I can oblige,\"</i> she muses, pursuing her lips and tapping her chin in thought. <i>\"But first I need to know if you think you can handle it, honey,\"</i> she grins mischievously at you.");
	//Kind:
	if(pc.isNice())
	{
		output("\n\nWell, there’s really only one way to find out. Plus for all you know <b>she</b> is the one that might not be able to handle you.");

		output("\n\n<i>\"You are just too sweet for your own good, honey,\"</i> she chuckles, crossing the distance between the two of you and draping her arms over your shoulders. <i>\"But throw in that confident streak of yours, and that's one of the reasons I like you,\"</i> she giggles, then kisses you quickly on the lips. <i>\"Now, let's indulge one of those other reasons, hmm?\"</i> she suggests, winking as her hand drifts down to caress your [pc.cock " + x + "].");

		output("\n\nBrushing her fingers tantalizingly across your shaft, she takes gentle hold of you and starts to lead you towards the couch. Only once you have reached it does she let go and position herself on the seat, resting against the back and turning her head to look at you over her shoulder. <i>\"Well? Come on, lets see what you got, sweet thing,\"</i> she giggles, shaking her butt slightly for emphasis.");

		output("\n\nYou caress her pillowy cheeks, fingers brushing teasingly against her tight backdoor. She closes her eyes, a soft exclamation of approval humming from her lips. You adjust her position so you can get easy access to her goods.");

		output("\n\n<i>\"I thought you wanted the other hole?\"</i> she jokes back at you.");

		output("\n\nPatience, you tell her. You want to enjoy this and she should too. You move a hand between her legs, caressing her soft folds.");

		output("\n\nAn approving moan escapes her throat, eyes closing again as she savors the feeling of your touch.");

		output("\n\nWithout uttering a single word, you bury two of your fingers into her sodden snatch.");

		output("\n\n<i>\"Ooh! What are you - ?\"</i> She starts to ask, visibly tensing as your fingers penetrate her, the velvety flesh clamping down on your fingers.");

		output("\n\nJust getting some lube, you explain, giving her back a kiss. She hums softly, smiling, but turns her head back away from you, squeezing your fingers a little tighter with her cunt, silky flesh rippling around the intruding digits before releasing you.");

		output("\n\nWhen you deem her sufficiently wet, you remove your fingers and begin gathering her juices with your hands. Your [pc.cock " + x + "] throbs in your hands as you apply a shining layer of Kelly’s honey to your length. Her pretty little rosebud receives a similar treatment. You rub plenty of her honey around and inside her little hole, taking the opportunity to stretch her out a little.");

		output("\n\nShe moans softly as you worm your fingers inside of her, tailhole tensing as she fights to keep it from clamping down on your intruding digits, quietly squelching shut once your fingers are out.");

		output("\n\nSatisfied with your handywork, you take hold of her buttcheeks and spread them. Moments later you’re aligned and pressing into the tight butthole.");

		output("\n\n<i>\"Mmm... yes,\"</i> she purrs, arching her neck and holding onto the back of the chair for support, her rosebud stretching around your [pc.cockHead " + x + "].");

		output("\n\nThe penetration goes smoothly. As well lubed as she is, Kelly is no stranger to anal. She starts sucking you in the moment you get past her resisting sphincter. In no time, you’re safely nestled between a pair of cushiony bunny-bums.");
		pc.cockChange();
	}
	//Mischievous:
	else if(pc.isMischievous())
	{
		output("\n\nYou roll your eyes, take a step back and grab your [pc.cock " + x + "]. Without uttering a single word, you slowly begin to stroke yourself. Not quite what you expected, but masturbating to an audience can be fun too....");
		output("\n\n<i>\"Hey! I didn't ask you here to watch you jerk yourself off!\"</i> Kelly protests, eyes furrowed indignantly as she points an accusing finger at you.");

		output("\n\nYou came here for big bunny butts, not big bunny teases. You grin mischievously at her. Since she was taking her sweet time, you just thought you’d get started before her.");

		output("\n\n<i>\"Oh, no; I'm getting in on this too,\"</i> she insists, licking her lips as her gaze falls upon your [pc.cock " + x + "]. She closes the distance and her hands lunge forward, groping shamelessly at your shaft as she tries to push your hands aside and take hold of it herself.");
		output("\n\nYou release your [pc.cock " + x + "] and let her just grab you. However you aren’t beat yet. Since she’s got ");
		if(pc.cockTotal() > 1) output("one of ");
		output("yours, it’s only fair you get one of hers. With a playful grin you grab her topmost shaft right behind her flare, stroking her tip with your thumb.");
		output("\n\nA giggling moan escapes her, beads of sticky pre-cum smearing against your thumb. WIth a grin, she starts to play with the cock in her hands, fingers dancing across your shaft, thumbs rubbing your tip.");
		output("\n\nAs much as you appreciate getting some help, this is something you can do on your own. Now, if she’d be so kind as to stop holding out on your promised bunny butts?");
		output("\n\n<i>\"Well... since you seem to be ready,\"</i> she suggestively notes, removing her fingers from your prick and rubbing the pre-cum she has gathered between thumb and forefinger. <i>\"Come on, sweet thing,\"</i> she purrs, before she sashays her way over to the couch. Clambering onto the seat with deliberate motions, kneeling on it to make herself comfortable, she drapes herself over the back, tail flicking like a rabbit's as if beckoning you to join her.");
		output("\n\nYou follow that bobbing tuft of fur, playfully biting it.");
		output("\n\n<i>\"H-hey!\"</i> She says with a gasp. <i>\"Just what do you think you're doing?\"</i> she demands of you.");
		output("\n\nYou apologise, laughing. It just looked so tasty you couldn’t resist. Now, there’s another thing that looks tasty from your angle....");
		output("\n\n<i>\"And what might that be, hmm?\"</i> she questions, keeping her face turned away so as not to spoil the surprise.");
		output("\n\nShe gasps as you bury your face between her legs, licking into her soft folds with gusto.");
		output("\n\n<i>\"Ohhh...\"</i> she sighs softly in pleasure, nether-lips squirming around your [pc.tongue], wrapping their silken walls around it as you burrow inside, the unmistakable taste of sex-tinged honey washing over your senses. Above you, Kelly wriggles a little. <i>\"A-as good as that feels,\"</i> she says, tone swinging across the scale as you keep hitting sensitive spots. <i>\"I-I thought you were after the other hole?\"</i>");
		output("\n\nWithdrawing from her folds and licking a stray string of honey you reply, <i>\"You can’t expect me to work you over with a little snack first, can you?\"</i>");
		output("\n\n<i>\"I suppose I can't...\"</i> she says, failing to sound reluctant at all. <i>\"Well, go on; eat up; you're going to need your strength,\"</i> she giggles.");
		output("\n\nYou dig back into those yielding folds, drinking more of her. When you deem her wet enough for your purposes, you clamber up behind her and sandwich your dick between her nethers.");
		output("\n\nShe lets out a crooning noise as she feels your dick. <i>\"Don't tell me; your cock needs a snack too?\"</i> she jokes.");
		output("\n\nJust getting some lube. You want to make sure you both enjoy this, and the only way this is happening is if you can glide right in and make her feel like her ass exists solely for the purpose of sheathing your dick.");
		output("\n\n<i>\"Mmm... you do know how to paint a pretty picture, honey,\"</i> she purrs. <i>\"Well, what are you waiting for? An invitation?\"</i>");
		output("\n\nFunny, that’s exactly what you were waiting for....");
		output("\n\nYou climb down and pull her ass in position. Nestling your [pc.cockHead " + x + "] against her pucker you whisper into her ear, <i>\"You’re my queen bee, let me show you my stinger.\"</i>");
		output("\n\nShe moans as she feels your [pc.cockHead " + x + "] pushing inside her, arching her back as her fingers clench onto the couch for support.");
		output("\n\nShe resists at first, but after a few pumps her sphincter yields nicely around your girth. From there on it’s one smooth ride as you feed her more of your cock while she sucks you in. <i>\"Yes, take it all like a good girl.\"</i>");
		pc.cockChange();
		output("\n\n<i>\"G-gladly,\"</i> she replies, shoulders tensing as she focuses on moving her rosebud's walls to draw you inside, determined to take you to the hilt. Inch after inch penetrates the moaning laquine, until finally you have nothing left to feed to her. <i>\"T-there you are, nice and snug,\"</i> she says, sounding pleased with herself.");
		output("\n\nYou thank her for the hospitality. She really knows how to make a " + pc.mf("guy","girl") + " feel welcome.");
	}
	//Hard:
	else
	{
		output("\n\nYou grab her by the shoulders and pull her into a forceful kiss. Tongue easily breaching her lips, you stimulate her as you feed her your saliva.");

		output("\n\nShe gasps when you break the kiss, as forcefully and as suddenly as you started. With a loud smack on her round jiggly cheek, you tell her to bend over. <i>\"I’m going to fuck you raw, and you’ll love every second of it,\"</i> you punctuate your sentence with another loud smack on her cheek.");

		output("\n\nShe swallows and nods. <i>\"I think I just might,\"</i> she mumbles to herself.");

		output("\n\nYou grab her by her wrist and push her towards the couch. Less talking, more bending. She nods eagerly and darts over to the couch, practically leaping into it.");

		output("\n\nYou follow after her, adjusting her position as you bark orders at her.");

		output("\n\nKelly rolls her eyes, but allows you to take the lead, hastening to position herself where you instruct and giving no resistance to your hands as you adjust her on the seat.");

		output("\n\nYou spread her ass, rubbing your thumb against her little backdoor, testing the hole.");

		output("\n\nShe stifles a quiet noise of approval, but her tailhole clenches itself shut, refusing to let your thumb slip inside so casually.");

		output("\n\nIf you want to give this pretty pucker the pounding it deserves you’re going to need some lube. Thankfully you know exactly where to get some. You clamber up behind Kelly...");

		output("\n\n<i>\"[pc.name]? What -\"</i>");

		output("\n\nYou interrupt her by shoving your [pc.cock " + x + "] between her legs, roughly grinding your member against the soft folds of her nether-lips.");

		output("\n\nShe gasps in shock at the sudden thrust and the friction against her pussy, then moans as the stimulation begins reaching her and turning her on.");

		output("\n\nIt doesn’t take long before she’s dripping all over you, just like you wanted. When you deem yourself ready, you let go and pull her plump butt in position. Not really giving her any time to recover you tell her to hold her cheeks open for you.");

		output("\n\nShe lets out a soft groan, but reaches back with her hands, spreading her fluffy-textured luscious butt apart as you commanded, letting you get a good eyeful of her rosebud.");

		output("\n\nWithout further ado, you shove forward and thrust your [pc.cock " + x + "] into her butthole. Bullseye! You bury half your shaft into her in one go.");
		pc.cockChange();

		output("\n\nA howl of surprise, pleasure and pain escapes Kelly, whose whole body tenses up, back arching as you assault her so suddenly.");

		output("\n\nAnother thrust and you bury a little more of yourself in. Her anus seems to be resisting your entrance, but that’s all the better. It makes you feel extra good to know that you’re pummeling past her resistance with such ease. Yes, Kelly has one fine ass....");

		output("\n\nShe moans softly and bites back a whimper, wriggling slightly in a futile attempt to adjust to being penetrated so suddenly and forcibly, attempting to make herself stop resisting.");

		output("\n\nYou pull your hips back and with a powerful pump you hilt yourself completely inside her. Her resistance turning to acceptance as you slip in with a wet schluck. The first of many to follow, no doubt. You hold yourself still for a moment, letting her adapt to your shaft.");

		output("\n\nShe pants for breath as her asshole recovers from your brutal entry. <i>\"You, [pc.name], are a real asshole, you know that? Lucky for you, I don't mind it rough,\"</i> she growls for emphasis, grinding back against you.");

		output("\n\nMind it? If anything you’d say she loves it. Her cocks have been leaking pre the moment you first slapped her juicy butt.");

		output("\n\n<i>\"Just be ready to take what you dish out, honey,\"</i> she warns you, her hot walls clenching down on you with a sudden surge of vice-like strength for emphasis.");
	}
	output("\n\nAny pretense of taking it slow died the moment you broke down her resistance. Her butthole welcomed you in and is currently in the process of massaging every last drop of spunk you can muster. You confess you’re also too turned on to take it slow, so it’s for your mutual benefit that you begin fucking her in earnest. Wet, slapping sounds echo around you as you imprint yourself inside your laquine partner.");
	output("\n\nKelly is no passive partner in this, moaning and growling as she thrusts back as best she can in her position, tailhole milking you with surreal efficiency. Every rut you make inside of her is met with a thrust back, just as hard and fast, Her four balls bounce and jiggle along the cushioned seating below her, almost visibly swollen and bloated with semen as her arousal pumps them fuller and fuller.");
	output("\n\nEvery pump, every throb, every wet slap; mixing and matching into a wonderful symphony of debauchery. The perfect background for sodomizing. You drag Kelly with you, steadily pulling her off the couch as she struggles to grip the back of the seat. Her cocks flow like open faucets, bobbing and showering the couch with honey-jizz. Her moans are like music to your ears, the undeniable proof that she’s enjoying this just as much as you are.");

	output("\n\n<i>\"Oh...! Honey, I, I don't think I can hold it...\"</i> she groans, arching her back, a huge double-shot of thick honey-cum spurting from her twin glans, steadily flaring out in her arousal, perfect emphasis to her claims.");

	output("\n\nYou are almost there yourself. It’s time to finish this. And you’re going to make sure Kelly remembers it. There’s two ways you could finish her off. You could turn her around and see her face screw into the perfect visage of a properly fucked bunny, but there’s a fair chance you’ll wind up getting showered by her honey. Or you could grab her and dig balls-deep");
	if(pc.balls == 0) output(", metaphorically speaking,");
	output(" and watch her dicks turn into a perverted fountain of honey.");
	processTime(14);
	pc.lust(50)
	//[DeepFuck][GetGlazed]
	clearMenu();
	addButton(0,"Deep Fuck",deepFuckKellysButthole);
	addButton(1,"GetGlazed",getGlazedWhileButtFuckingTheHoneyBunny);
}

//[=GetGlazed=]
public function getGlazedWhileButtFuckingTheHoneyBunny():void
{
	clearOutput();
	userInterface.showBust("KELLY_NUDE");
	showKellyName();
	author("Quiet Browser & LD");
	var x:int = pc.cockThatFits(chars["KELLY"].analCapacity());
	if(x < 0) x = pc.smallestCockIndex();

	output("You pull out of her, leaving her anal ring to grasp at a phantom member.");

	output("\n\nShe moans plaintively. <i>\"Honey -?\"</i> she begins to say something more, a question or a complaint, who knows.");

	output("\n\nYou spin her around, too horny to be gentle.");

	output("\n\nShe grunts as she lands heavily on the seat, legs splaying out onto the floor, sliding down so that her ass is hanging partially off the cushion, blinking at you as she tries to process what's happening.");

	output("\n\nYou watch her face turn from one of confusing to one of pleasure as you spear right back into her, pummeling her against the back of the couch as you border the inevitable edge of your climax. Not keen on leaving her unattended, you grab her shafts, stroking them furiously as you dump your load into her accepting ass.");

	//CumQuantity=Normal:
	if(pc.cumQ() < 500)
	{
		output("\n\nKelly moans appreciatively as she feels your [pc.cum] gushing inside of her, a hand automatically going to her lower belly, as if trying to seek out the warmth.");
	}
	//CumQuantity=High:
	else if(pc.cumQ() < 1000)
	{
		output("\n\nA giggling gasp escapes your laquine lover as you flood her stomach with your [pc.cum], her hand darting to her stomach and pressing itself eagerly there as it visibly bulges before your eyes, bee-colored coat stretching over the newfound roundness, which she pets approvingly.");
	}
	//CumQuantity=VeryHigh:
	else if(pc.cumQ() < 10000)
	{
		output("\n\nShe moans loud and exultantly as your cascade of [pc.cum] pours inside of her, belly bloating second after second. <i>\"Oh, yeah, fill me up!\"</i> she hollers joyously as your load keeps flooding her guts, puffing her stomach out into a pregnant-looking swell that she rubs with both hands.");
	}
	//CumQuantity=Extreme:
	else output("\n\nA squeal of pleasure escapes her, eyes rolling back in their sockets and back arching as your inhuman tidal wave of [pc.cum] fills her to her very limits. Her greedy asshole gorges itself on your seed, gush after belly-bloating gush washing inside the exuberant laquine, swelling her to pregnancy and beyond as you empty yourself. Rounder and rounder she gets, weighed back down against her seat, pinned helplessly beneath her new liquid immensity before you finally finish. Her eyes open and stare in wonder at her cum-gut, hands tracing it almost reverently. <i>\"...where have you been all my life?\"</i> she dreamily wonders to herself.");

	output("\n\nThat was the last straw for her; her tailhole clamps down on you like a vice, milking the last of your seed from you as she cries out in pleasure. Balls clench down and cocks bulge as they erupt like twin fountains, spraying thick streamers of orange-yellow semen squarely at you.");

	output("\n\nYou close your eyes as her seed sprays all over yourself, only to rain back down at her. By the time she’s done you look like a mess, she looks like a mess, the couch looks like a mess.");

	output("\n\nA deep, loud groan escapes Kelly, who bonelessly collapses back against her seat, cocks falling limply against her ");
	if(pc.cumQ() > 1000) output("swollen ");
	output("stomach and slowly sliding back into her sheaths. <i>\"I...I think I'm done now,\"</i> she mumbles, opening her eyes to take in what she did. <i>\"Wow, I sure did a number on us, didn't I?\"</i> she asks. She sounds quite pleased with the sheer amount of mess she's made.");

	//Kind:
	if(pc.isNice())
	{
		output("\n\nYes, she sure did, you admit. Looking yourself over, you are absolutely glazed with honey-cum. Despite your messy self, you feel pretty proud for being able to make her cum this hard.");
		output("\n\n<i>\"I see that look,\"</i> Kelly says with a giggle, one hand reaching out to gently pat your cheek. <i>\"But I don't make this kind of mess for just anyone, so you wear it with pride, honey. Actually,\"</i> she smirks. <i>\"I think you wear that honey pretty well too,\"</i> she giggles, then her long tongue darts out, sliding quickly over your face - and quite purposely over your [pc.lips] - before darting back inside, Kelly visibly savoring it. <i>\"Deelicious,\"</i> she announces.");
		output("\n\nYou guess you should probably bathe before going.");
		output("\n\n<i>\"But I just gave you a bath. Don't you know how good honey is for your skin?\"</i> she giggles. <i>\"But, if you insist, I suppose we can go and wash up, make you smell a little less like I just marked you as mine when you go,\"</i> she suggests.");
		output("\n\nYou, the couch and herself, you add. As much as you’d like to stay, you really have to be going.");
		output("\n\n<i>\"Oh, okay,\"</i> she sighs. <i>\"I'd rather sit here for a while, but if you insist... you'll kind of need to pull out of me first, though,\"</i> she informs you.");
		output("\n\nYou chuckle. Yes, you suppose you should... and just when it was starting to get comfy too.");
		output("\n\n<i>\"I'm sure it was,\"</i> she chuckles back.");
		output("\n\nYou pull out of her butt and help her to her feet.");
		output("\n\nShe stretches luxuriantly, ");
		if(pc.cumQ() > 1000) output("gives her belly an appreciative pat, ");
		output("and takes you by the hand. <i>\"Come on, the shower's this way....\"</i>");
		output("\n\nClean, for the moment, you don your [pc.gear] and set out with a parting kiss.");
		output("\n\nKelly folds her arms around you while she can, and then steps back with a smile. <i>\"Don't be a stranger, sweet thing. I'm always happy to have you,\"</i> she tells you as you leave.");
	}
	//Mischievous:
	else if(pc.isMischievous())
	{
		output("\n\nYeah, but you can’t say that wasn’t expected. You did set out on a mission to ruin her couch, after all.");
		output("\n\n<i>\"Oh, did you now?\"</i> she asks with a smirk. <i>\"And was getting a proper laquine marking for yourself part of that mission, or just a happy bonus?\"</i> she winks at you.");
		output("\n\nLike she’s one to talk... plus you’re pretty sure you marked her good too.");
		output("\n\n<i>\"You? Marked me? I don't see any markings from you,\"</i> she replies, sticking her nose up in a mock huff.");
		output("\n\nReaaaaly? You pull out and reach inside her still loose ass to fetch a gob of your [pc.cum]. You hold it right in front of her face. What does she call this then? You marked her so good you could probably charge rent off her ass. Speaking of which, you’d like to claim your deed now.");
		output("\n\n<i>\"Deed? But we haven't finished discussing the terms for it, yet,\"</i> she says, finger on her chin, thoughtful expression spoiled by her cheeky grin.");
		output("\n\nWhat is there to discuss? You’ll come by, do your taxes and she gets to look after your favorite bit of land in Esbeth.");
		output("\n\n<i>\"Taxes? I like the sound of that,\"</i> she purrs. <i>\"But you know taxes on this world are collected regularly, right? You'll need to come by quite often to fill those out,\"</i> she tells you, winking as she does.");
		output("\n\nYou had a feeling she’d say that. Not a problem though, you chuckle.");
		output("\n\n<i>\"That's just what I wanted to hear,\"</i> she grins, steepling her fingers in front of her.");
		output("\n\nYou look at Kelly, then yourself, then the couch. <i>\"Kelly, Kelly... what a messy girl you are, Kelly,\"</i> you say.");
		output("\n\n<i>\"Of course I am; that's why I have so much fun,\"</i> she giggles, looking proudly at the spooge dripping off of you, her and the couch. Then she sighs and adopts a long-suffering expression. <i>\"But I suppose you want to get cleaned up, right?\"</i>");
		output("\n\nYou nod. And you expect her to take responsibility for all this mess by helping you clean.");
		output("\n\n<i>\"Okay then... come here,\"</i> she purrs, reaching up and twining her arms around your neck, pulling you closer to her. Her tongue undulates from her mouth and she gives you a long, sloppy lick, noisily slurping the honey from your [pc.lips].");
		output("\n\nYou take the opportunity to grab her head and give her a kiss.");
		output("\n\nWith a muffled hum of approval she sinks into the kiss, shamelessly smearing her slimy, seed-coated body against yours, tongue worming its way into your mouth to caress your [pc.tongue]. She holds you like that for several pleasurable minutes, then noisily breaks the kiss, tongue slurping out of your mouth. She smacks her lips and gives you a mischievous smile. <i>\"Nice as that was, I can't clean you up too quickly if you keep doing that, honey,\"</i> she playfully chides you.");
		output("\n\nThen she should stop giving you opportunities to take advantage of her. you tap her on the nose playfully before telling her to get back to work.");
		output("\n\nHer tongue flicks out and brushes the tip of your nose mockingly in reply, then she bends her head and starts lapping her way down your body. Patiently and diligently the laquine's tongue criss-crosses your body, slurping up every last dripping morsel of sweet semen. It dances over your [pc.nipples], slides down your [pc.belly] to tickle your belly-button, washes off your face, caresses along your fingers... it gets everywhere. Throughout it all, Kelly seems drawn to your more sensitive spots, teasingly licking and kissing and suckling you as she cleans you off. Finally, though she teases you to distraction in the process, Kelly finishes, licking her lips and stifling a belch. <i>\"There we are, good as new,\"</i> she proclaims with a satisfied grin.");
		output("\n\nYou pat her head. <i>\"Good girl,\"</i> you praise her.");
		output("\n\n<i>\"It was my pleasure,\"</i> she giggles, hugging you.");
		output("\n\nAs much as you’d love to stay, you really should be going. You put on your [pc.gear], kiss your girl and proceed to leave.");
		output("\n\n<i>\"Don't be a stranger now, honey; you're always welcome here,\"</i> Kelly calls after you.");
	}
	//Hard:
	else
	{
		output("\n\nYou told her she was going to enjoy it, you grin smugly.");

		output("\n\n<i>\"Hmph. I suppose,\"</i> she admits, shifting a little in her seat. <i>\"Once we got over the start, anyway.\"</i>");

		output("\n\nYou put a hand on her head. She should be more honest with herself. Can she really say she didn’t enjoy being owned like the delicious piece of bunny meat she is? Even when there’s plenty of proof on you, her <b>and</b> the couch?");

		output("\n\nShe can't meet your eyes at that, instead drumming her fingers on her stomach. Long moments of silence tick by, before she lifts her head to meet your gaze. <i>\"...You may be right,\"</i> she concedes slowly.");

		output("\n\nYou pat her head, then pull her chin up for another big wet kiss.");

		output("\n\nShe closes her eyes and presses her lips to yours, warmly and affectionately accepting your kiss, a hum of pleasure rumbling up her throat.");

		output("\n\nYou break the kiss, licking a stray strand of saliva connecting your lips. See? Good girls get rewarded when they’re honest. Now, if she would be so kind as to clean up her mess?");

		output("\n\n<i>\"Well, I suppose I can do that,\"</i> she grins, then takes your [pc.face] in her hands, holding it still as she leans forward. Her long yellow tongue slithers out of her mouth, then writhes through the air to caress your face, worming its sinuous path across your [pc.skinFurScales] and lapping up her cum with slow, deliberate strokes.");
		output("\n\nYou decide to sit back and enjoy her ministrations. Nothing like a tongue-bath after such a good fucking.");
		output("\n\nPatiently and diligently the laquine's tongue criss-crosses your body, slurping up every last dripping morsel of sweet semen. It dances over your [pc.nipples], slides down your [pc.belly] to tickle your belly-button, washes off your face, caresses along your fingers... it gets everywhere. Finally, though she leans back and nods her head in satisfaction. <i>\"That's it, I got everything,\"</i> she informs you, then burps softly. <i>\"Excuse me,\"</i> she begs you, giggling softly.");
		output("\n\n<i>\"That’s a good girl,\"</i> you say, patting her head. You get up and put on your [pc.gear]. After one final check to see if you aren’t forgetting anything you stride up to Kelly and give her one last kiss, promising to be back for more later.");
		output("\n\n<i>\"I'm sure you will,\"</i> Kelly replies with a grin, waving you off as you leave.");
	}
	processTime(21);
	pc.orgasm();
	kellyFucked();
	pc.shower();
	clearMenu();
	addButton(0,"Next",move,"SOUTH ESBETH 2");
}

//[=DeepFuck=]
public function deepFuckKellysButthole():void
{
	clearOutput();
	userInterface.showBust("KELLY_NUDE");
	showKellyName();
	var x:int = pc.cockThatFits(chars["KELLY"].vaginalCapacity());
	if(x < 0) x = pc.smallestCockIndex();
	author("Quiet Browser & LD");
	output("In one fell swoop, you hook your arms around her middle and pull her with you as you spin around.");

	output("\n\nA loud grunt escapes her at the sudden impact, Kelly sprawling heavily back against you. <i>\"Honey, what's going on?\"</i> she demands.");

	output("\n\nYou dig your [pc.feet] into the floor and thrust with all your might, reaching depths no one’s ever explored within Kelly.");

	output("\n\nA scream of pleasure erupts from the laquine atop you, her whole body clamping down on your prick like a vice as she climaxes. Wetness, hot and sticky, sprays over your [pc.legs] as her womanhood gushes honey-like fluids, even as her cocks begin erupting above her. Great golden arcs fly towards the ceiling, only to submit to gravity and fall back down, bombarding the laquine stretched above you. Kelly gladly makes herself a \"human shield\", stretching her arms out in open invitation as it drenches her full breasts, mouth open and tongue out as she attempts to catch the globs inside it.");

	output("\n\nHer ass squeezing down on you, demanding your seed. The perverted fountain of honey-jizz she’s spewing into the air. It’s all too much for you. You let loose a scream of pleasure as you paint her innards with your [pc.cum].");

	//CumQuantity=Normal:
	if(pc.cumQ() <= 250) output("\n\nAs you empty yourself inside of her, Kelly's rosebud milks you, doing it's best to suck you completely dry. When nothing more is forthcoming, it clenches down on you, holding you in a vice-like grip.");
	//CumQuantity=High:
	else if(pc.cumQ() <= 1000) output("\n\nKelly grinds herself back into you, wringing your dick for all it's worth even as her stomach begins to stretch from the sheer quantity of cum you've given her. Even as your prodigious load ebbs away, her tailhole keeps on gently milking you, as if hoping there's yet more to come.");
	//CumQuantity=VeryHigh:
	else if(pc.cumQ() <= 10000) output("\n\nYou can feel the weight of the laquine in your lap increasing as your [pc.cum] pours inside of her, bloating her belly into a pregnant-looking bulge. Throughout it all her ass suckles from you, its hunger insatiable, gobbling down each great globule of jism without pause. When you finally run dry, it clamps down on you, determined to not let a single drop escape.");
	//CumQuantity=Extreme:
	else output("\n\nKelly's stomach balloons outwards under the inhuman tidal wave of [pc.cum] that is your orgasm, her whole body writhing atop you as you fill her to her very limits. If she weren't so busy catching her own cum with her mouth, she'd probably be crying out in ecstasy at being crammed so very full, stomach visible to you even from your position behind and under her. Through it all, her ravenous ass shows no signs of relenting its efforts of milking you, even as her cum-gut sloshes and wobbles with each twitch of her orgasmic form. Only the slightest of moisture escapes to wet your dick once you have finished, the rest locked away inside her stomach.");
	output("\n\nYou hug your lapful of laquine. Not really caring that you wind up with a bit of her honey on your arms. You feel pretty warm right now. The afterglow after such a great climax must be settling in. Without thinking you hug Kelly just a bit tighter, feeling her bosom press against your [pc.skinFurScales]. Her little nipples feel like small pebbles poking against your arm.");
	output("\n\nKelly moans softly and shifts gingerly in your arms, audibly wincing as she does so. <i>\"[pc.name]? Honey? That was incredible, but...\"</i> she groans again and shifts once more. <i>\"I am going to be feeling this for days,\"</i> she whimpers.");
	var bigCum:Boolean = false;
	if(pc.cumQ() > 1000) bigCum = true;
	processTime(10);
	pc.orgasm();

	//Kind:
	if(pc.isNice())
	{
		output("\n\nYou apologise. Seems like you got a bit carried away.");
		output("\n\n<i>\"Maybe just a little,\"</i> she concedes, before she nuzzles back against you. <i>\"Still, I think it was worth it,\"</i> she sighs contentedly. <i>\"Who needs to sit down when you can get sex this good in exchange?\"</i> she giggles.");
		output("\n\nYou chuckle. Yeah, that was pretty good wasn’t it? It’s not everyday you get to bury yourself ");
		if(pc.balls > 0) output("balls-deep");
		else output("so deep");
		output(" into a cute bunny-bum.");

		output("\n\n<i>\"Yessirree, you're a lucky " + pc.mf("boy","girl") + ", aren't you?\"</i> Kelly chuckles softly. <i>\"The cutest bunny-bum on the planet, and it's all yours to play with - I hope you appreciate this.\"</i>");
		output("\n\nOh, you certainly do. You appreciate everything, you say, giving her a kiss on the back of her neck.");
		output("\n\nShe giggles and wriggles a little at your gesture, only to let out a soft hiss. <i>\"Nnn... honey? Do you think I can maybe get up now? I really am kind of sore down there,\"</i> she admits, abused rosebud rippling around your shaft, still plugged inside of her.");
		output("\n\nYou promptly release her.");
		output("\n\nWith a sigh and a moan, Kelly squirms free of your lap and shuffles awkwardly to the floor, groaning softly. Rivulets of [pc.cumColor] begin visibly leaking from her ass, currently gaping in the perfect shape to contour to your mighty prick. She staggers slightly, and then straightens up, turning to give you a slightly strained smile. <i>\"Oooh,\"</i> she moans softly to herself, hand reaching behind her to gently play with her ass. <i>\"It feels kind of empty now... don't think I like that,\"</i> she pouts.");
		output("\n\nYou ask if she has anything you could get her to dull the pain. Maybe a lotion or something?");
		output("\n\nShe looks thoughtful, visibly contemplating. <i>\"I have a jar of Peggy's Elasticizing Oil brand lubricant in my room, near the bed; that ought to help,\"</i> she suggests.");
		output("\n\nNodding, you run off to fetch the jar. Locating it in a moment, you bring her the requested jar.");
		output("\n\nShe smiles as she sees it. <i>\"Thank you... now, I don't suppose you'd be a dear and help me apply it?\"</i> she suggests, a mischievous light in her eye.");
		output("\n\nIf she insists....");
		output("\n\n<i>\"Oh, I do, I do,\"</i> she purrs, already shuffling over to the couch and leaning over against it, using it for support and thrusting her ass up in the air for your ministrations.");
		output("\n\nYou open the jar and grab a handful of the gel, then apply it directly above her abused tail-hole.");
		output("\n\nShe moans softly, in equal parts relief and pain, backside quivering against your fingers.");
		output("\n\nYou slowly rub it around her loosened hole, trying your best not to aggravate her pain. Once you’re satisfied with your work on the outside, you gather a bit of the gel and press it inside her. Some of it naturally gets mixed with your [pc.cum]. Honestly, it’s kind of a turn on to see what you’ve done with her backdoor... but now is not the time for this. You finish applying the product and declare her <i>fit for duty</i> with a gentle pat on her butt.");
		output("\n\nA great sigh of relief rolls out of her throat at that and she straightens up. <i>\"Thank you, honey, that feels so much better,\"</i> she declares, turning to face you. <i>\"Now, I think someone so sweet deserves a little reward,\"</i> she purrs, closing the distance between you and kissing you sweetly on the lips. She holds you like that for several long, pleasant moments, and then releases you. <i>\"Now, I'm sure you have other things to do today, so I'll see you next time... I'm going to go and have a laydown, give myself a chance to recover some more,\"</i> she announces, taking the jar of lube from you and limping towards her bedroom.");
		output("\n\nYou wish her a nice rest and put your [pc.gear] back on, then leave her to her own devices.");
	}
	//Mischievous:
	else if(pc.isMischievous())
	{
		output("\n\nOh? Well, you did mean to give her something to remember you by, so... mission accomplished?");
		output("\n\n<i>\"Oh, definitely. If your mission was to be a literal pain in the ass,\"</i> she snarks, one hand worming between you to rub gingerly at her buttocks. <i>\"Seriously, I might not walk right for days,\"</i> she grumbles.");
		output("\n\nYou tell her not to be like that. A couple more sessions and she’ll get used to it. Plus you didn’t exactly get out of this unscathed, she has strong ass-muscles.");
		output("\n\n<i>\"That's what you get for sticking your cock in tight places,\"</i> she quips, removing her hand and placing it back in her lap. <i>\"Maybe we'll both have trouble walking after this.\"</i>");
		output("\n\nYou think it was worth it though. This just means the two of you have to keep practicing. You should have more anal with her.");
		output("\n\n<i>\"Hmm... I can live with that,\"</i> she says, giggling. <i>\"But... not right this moment, okay? I'm too sore,\"</i> she huffs.");
		output("\n\nAww, and here you were hoping for sloppy seconds.");
		output("\n\n<i>\"And they say I'm sex-mad,\"</i> she says, mockingly rolling her eyes. <i>\"Now, how about letting me up, huh? This isn't the most comfortable seat I could have,\"</i> she drawls.");
		output("\n\nYou do as she asks. Pity, you were getting kinda comfy.");
		output("\n\nShe awkwardly hops out of your lap, groaning as she hits the floor. <i>\"Think you can help me out? I've got some Peggy's Elasticizing Oil brand lubricant in my room, near the bed - would you mind grabbing it and helping me put some on? Ought to help me feel better,\"</i> she explains.");
		output("\n\nNodding you get up on your [pc.feet] and go off to fetch her jar, returning mere moments later with the jar in hand.");
		output("\n\nBy this time, Kelly has laid herself down on her belly on the couch, buttocks up in the air due to being draped over one arm. <i>\"Ah, good, you found it,\"</i> she says with a relieved smile. <i>\"Can you put some on?\"</i>");
		output("\n\nSure you can, you reply excitedly.");
		output("\n\nShe grins at your enthusiasm. <i>\"I thought you might,\"</i> she notes, making herself comfortable once more.");

		//if High Libido/Lust/Min Lust:
		if(pc.lustMin() >= 33 || pc.libido() >= 80)
		{
			output("\n\nSeeing her in this position gives you a great idea, one that your [pc.cock " + x + "] seems to agree on. Chuckling, you pick up a handful and lather your half-erect shaft with a generous layer.");
			output("\n\n<i>\"[pc.name]? What are you doing?\"</i> Kelly asks, ears visibly twitching as she hears you applying the lube to your cock.");
			output("\n\nYou grab her butt and slap your dick right on top of her loose hole.");
			output("\n\n<i>\"Hey, I asked you to lube me up!\"</i> She squeals in protest, trying to wriggle away from you, but trapped by her choice in reclining positions so that she can't escape.");
			output("\n\nAnd you are, you reply. Just because you chose this specific way to do it, doesn’t mean you aren’t. Now, if she doesn’t stop moving around you can’t do a proper job. You tell her she has nothing to worry about, you’ll make her enjoy this too.");
			output("\n\n<i>\"So you say,\"</i> is the sarcastic reply she voices, but she stops struggling, trying instead to find a position where she is more comfortable. Her fingers clench into the cushion for support and she takes two deep, slow breaths. <i>\"Alright, ready as I'll ever be,\"</i> she informs you.");
			output("\n\nYou nod, though she can’t quite see you in this position. First you move slowly, grinding against her opening and spreading the lube around opening. You grab her buttcheeks and push them together so you can properly hot-dog her.");
			output("\n\nShe arches her back and groans softly, doing her best to get in on the fun by trying to squeeze her luscious buttocks together and make it a tighter grip on you.");
			output("\n\nOnce you’re satisfied, you decide to use your [pc.cockHead " + x + "] to slowly massage her sphincter. You don’t outright penetrate her, instead you nudge her open with short and slow strokes.");
			output("\n\nKelly moans softly, her rosebud squeezing hesitantly back against you, but with nowhere near the energy or force of before.");
			output("\n\nYou pull away to apply another layer of the lube to your shaft and align yourself with her abused opening once more. Kelly squirms a bit in response, but you comfort her by gently caressing her butt. Gently, you ease yourself back in. Since she’s still quite loose from your earlier fun, you find that with the lube’s aid you can pretty much glide in. There is not even a single ounce of resistance as you massage her abused opening by slowly pumping yourself in and out of her.");
			output("\n\nShe groans softly, not in pain but in a mixture of soft pleasure and relief, clearly feeling the effects of your intimate massage of the soothing lube into her roughly-used walls.");
			output("\n\nNot so bad, huh? You ask her.");
			output("\n\n<i>\"No... not bad at all,\"</i> she mumbles dreamly.");
			output("\n\nOnce you are satisfied that the relevant areas have been completely soaked in lube, you pull out and pat her butt gently. She’s good to go, you declare.");
			output("\n\n<i>\"Thank you, honey,\"</i> she replies, smiling as she looks back towards you. <i>\"Can you see yourself out? I think I'm just gonna lie here, get a little rest...\"</i> her head sinks back down onto the sofa's still-sticky cushions and she squirms forward a little, getting into a more comfortable position.");
			output("\n\nYou pat her arm softly and give her forehead a quick peck. Then you put your [pc.gear] back on and make your way out. Hmm... this little epilogue to your play did excite you quite a bit, but you can’t really demand an encore with her in such condition. Maybe next time....");
			pc.lust(20);
		}
		else
		{
			output("\n\nYou get yourself a handful of the slick gel and put a generous helping on top of her tail-hole.");
			output("\n\nA soft moan of anticipation escapes the prone laquine, who wriggles slightly as the coolness of the lubricant penetrates her flesh.");
			output("\n\nWith your thumbs, you gently rub it around her opening. In the meantime you also use your remaining fingers to massage her pillowy butt, enjoying the way her soft flesh yields under your advances. No sense why you shouldn’t have a bit of fun while you help her.");
			output("\n\nKelly groans deep and luxuriantly, shiftly softly in place as you grope and massage her. Stretched out as it is from your recent fun, her ass barely clenches as your fingers touch it, and she seems quite content to let you do as you please.");
			output("\n\nYou rub around the circumference of her sphincter, slowly pushing more and more of your thumbs in. Slowly, you coax her to open up and accept you. A task that is not too difficult considering the earlier fucking.");
			output("\n\n<i>\"Mmm... that feels good,\"</i> she replies dreamily, tailhole clutching weakly at your thumbs.");
			output("\n\nYou get another handful and apply it to her sore hole. Using your index, you thrust inside her and massage her innards.");
			output("\n\nA soft gasp of shock escapes her and she wriggles slightly, but evidently you've applied enough that she's in no pain, as that is the limit of her reaction.");
			output("\n\nOnce you are satisfied with your handiwork, you declare her fully lubed. Now if she would just give you a few minutes, you’re sure you can whip up an encore for the earlier performance.");
			output("\n\n<i>\"...Not a chance,\"</i> she tells you, her tone flat and brooking no argument.");
			output("\n\nYou chuckle, telling her you were just joking. You don’t think you could fuck her like that again so soon either. But she’d best rest up, you’ll be back for more later.");
			output("\n\nShe yawns loudly. <i>\"That sounds just fine to me,\"</i> she mutters, already closing her eyes and wriggling into a more comfortable position on the couch.");
			output("\n\nA little peck on her lips, a few moments to don your [pc.gear] and you’re ready to go. Mindful of disturbing her rest, you take great care when closing her door behind you.");
		}
	}
	//Hard:
	else
	{
		output("\n\nShe might be hurting now, but you’re pretty sure it was worth it. For both you, you add. Plus this gives her something to look forward to. You doubt there’s anyone that can make her cum this hard from buttsex in Esbeth. You cup one of her breasts, gently fondling it.");
		output("\n\nShe groans in pleasure and shifts a little, wincing as she does so. <i>\"I'd have to say you're right about that,\"</i> she admits.");
		output("\n\nOf course you are. You give her a couple more pumps and hug her tight, kissing her on the back of her neck.");
		output("\n\nShe hisses softly as you pump inside of her again, clenching her ass weakly on your dick as she does so. <i>\"Don't tell me you want another round?\"</i> she asks in disbelief, wriggling as you kiss her neck.");
		output("\n\nDoes she?");
		output("\n\nShe goes quiet for a moment, visibly thinking it over, then shakes her head once. <i>\"Not right now, no. Don't think I could get into it... then again, I didn't think you could get into me this far, either,\"</i> she quips.");
		output("\n\nYou chuckle at her statement. Just a taste of things to come, you promise. But if she doesn’t feel like having a second go, it’s fine. You shift a bit, adjusting her on your lap. Kelly winces in pain as you do so.");
		output("\n\nThat bad, huh? Guess you really broke her in.");
		output("\n\n<i>\"Broke? No. Severely bent, yes,\"</i> she replies, chuckling at her own lame joke.");
		output("\n\nYou fondle her breasts and ask if she has anything that could dull the pain. Can’t have her wincing in pain next time, it’s not fun if she doesn’t enjoy it too.");
		output("\n\nShe makes a contemplative noise, lifting a hand to her chin in thought. <i>\"I've got some elasticizing lubricant in my bedroom; it's not exactly pain-relief ointment, but it should do the trick,\"</i> she suggests to you.");
		output("\n\nAlright then. You heft her off your lap, pulling out of her slick ass as your leftover seed ");
		if(!bigCum) output("trickles");
		else output("cascades");
		output(" out of her abused tail-hole.");
		output("\n\nShe groans deep and low, clearly relieved to be unplugged at last. Her ass has been well and truly stretched to fit around the contours of your [pc.cock " + x + "], and it doesn't look likely to close on its own anytime soon.");
		output("\n\nYou deposit her on her side, mindful of her <i>condition</i>, then run off to fetch the lube.");
		output("\n\nWhen you return, you are treated to the sight of Kelly bent over the armrest, bunny-bum up in the air. You can’t resist commenting on the nice view.");
		output("\n\n<i>\"It'd be even nicer if you didn't try to wreck it earlier,\"</i> she half-chides you, unable to keep a grin off her face at the praise. <i>\"But if you want to admire it while you fix it... be my guest,\"</i> she giggles.");

		//if High Libido/Lust/Min Lust:
		if(pc.lustMin() >= 33 || pc.libido() >= 80)
		{
			output("\n\nWell, you are still kinda horny, and from what you could see Kelly did enjoy your rough treatment. Perhaps you should treat her to a memorable aftermath? Your [pc.cock " + x + "] throbs in agreement, already beginning to harden once more. Sounds like a plan.");
			output("\n\nYou take a large helping of the lube and apply it in a dense layer all over your member. Kelly seems oblivious of what you have in mind thus far. Just as well, you want to surprise her.");
			output("\n\n<i>\"[pc.name]? What's taking you?\"</i> Kelly asks. Then, with a smirk you can hear, she asks, <i>\"Is the sight of my ass just that enthralling, huh? You can't take your eyes off it to apply the lube?\"</i>");
			output("\n\nYou tell her not to get ahead of herself, lube is coming alright. You set on hand on her left cheek, then one on her right cheek, then press the [pc.cockHead " + x + "] of your [pc.cock " + x + "] against her abused hole.");
			output("\n\n<i>\"That doesn't feel like your fingers!\"</i> she protests, her panic ringing in her voice.");
			output("\n\nShe asked for lube, and you’re going to apply it... with your dick.");
			output("\n\n<i>\"But -! Ohhh...\"</i> she sighs, long and soft as your shaft gently slides into her gaping rosebud, slowly pushing its lubed surface along her walls and back inside of her once more. <i>\"That... that doesn't feel so bad,\"</i> she mumbles.");
			output("\n\nYour seed coupled with the lube makes for a very smooth mixture. Plus Kelly’s just recently been broken open by you, so you find that you can easily glide in and out of her. Still, you maintain a gentle pace. You want to soothe her, not break her... for now.");
			output("\n\nShe sighs again, contentedly. <i>\"That... that really feels good. So much better now.\"</i>");
			output("\n\nIt feels pretty good for you too, you admit. If you keep this up you might even be able to cum again.");
			//If Attraction >=75:
			if(kellyAttraction() >= 75)
			{
				output("\n\n<i>\"Mmm... sounds good to me,\"</i> she purrs, rosebud weakly rippling around your shaft as her overstretched muscles try and fail to hold you. <i>\"I've always got room for another dose of you,\"</i> she giggles.");
				output("\n\nIf she insists, then you really oughta give her another dose. Though you doubt you could put out one as big as the last one so soon.");
				output("\n\n<i>\"That's alright, honey; every little drop helps, as they say,\"</i> she sniggers.");
				output("\n\nQuite the horny-bunny you seem to have gotten for yourself. But that’s for the best, you like horny-bunnies, and you promise to use her as much as you can.");
				output("\n\n<i>\"Promises, promises,\"</i> she giggles.");
			}
			else
			{
				output("\n\nShe chuckles weakly to that. <i>\"And people say I'm a hornball. You must really let yourself get pent up to get off on this.\"</i>");
				output("\n\nIs she trying to imply she doesn’t want this?");
				output("\n\nShe groans softly as you slide in again. <i>\"No, just saying, that's all. If you really need me to tend to you more often, honey, you only have to ask,\"</i> her tone practically smiles for her.");
				output("\n\nIn that case you’ll make sure to use her as much as you can, you grin.");
				output("\n\n<i>\"Just try not to be so rough you break me,\"</i> she reminds you.");
			}
			output("\n\nYou up the pace, setting on a gentle yet brisk rhythm. Your earlier climax has made you sensitive enough that you don’t really need much more to find release, so you keep pumping.");
			output("\n\nKelly can't really get into it in her present position, but from the chorus of lusty moans and mewls she puts out, she's clearly enjoying this just as much as you are. Her stretched walls gently hold your shaft as it glides in and out, unable or perhaps unwilling to squeeze, but still clearly reacting to your presence.");
			output("\n\nYou continue with your motions until you feel yourself nearing your peak. Rather than dumping it all deep inside her like earlier, you decide to mix things up and pull away until only your [pc.cockHead " + x + "] remains inside her. Then you furiously stroke yourself, bringing you over the edge as");
			if (pc.balls > 0) output(" your balls churn and"); 
			output(" you creampie her butt with your [pc.cum]. The lewd mixture of cum and lube pouring out around your shaft as you make a veritable mess of the bee-bunny’s behind.");
			output("\n\nA great sigh of contentment flows from Kelly's mouth as she goes limp there. <i>\"That feels so much better... nothing like a nice wet dollop of ointment to soothe sore muscles, right?\"</i> There's a mischievous tint to her words that makes you positive she's smiling as she says this.");
			output("\n\nYou’d have to agree, you say whilst giving her butt a friendly slap. Now if she’d only be a dear and clean you up so you can put your [pc.gear] back on?");
			output("\n\n<i>\"Of course,\"</i> she heaves a long-suffering sigh. <i>\"Why don't you come up here where I can reach you, then?\"</i> she suggests, in a much more enthusiastic tone.");
			output("\n\nYou help her off the armrest and sit yourself down on a clean spot on the couch.");
			output("\n\nKelly sinks to her knees on the floor before you, then licks her lips with slow deliberation, letting you get a good long at her inhumanly long, flexible tongue. Placing her hands on your [pc.thighs] for support, she leans in and lets her tongue roll out, curling around your [pc.cock " + x + "] like a hand. Starting at the base, she draws the curled appendage up your length, twisting it over your sensitive prickflesh before sliding back down, then drawing it up and corkscrewing it around your dick.");
			output("\n\nYou just sit back and enjoy her treatment for a while, relaxing as her nimble tongue cleans out every last remnant of your spilt load.");
			output("\n\nFinally, her tongue whiplashes back into her mouth. <i>\"There we are; all clean,\"</i> she announces, slowly pushing herself back upright.");
			output("\n\nYou thank her, both for the buttfuck and for cleaning you up. Not every day you meet someone as receptive to a good fucking as her <b>and</b> willing to clean up after themselves.");
			output("\n\n<i>\"Well, it's only polite to clean up the mess you made,\"</i> she grins, folding her arms authoritatively over her chest. She then eyes the honey she sprayed everywhere with a thoughtful look, then shakes her head. <i>\"But don't worry; technically, <b>I</b> made this mess, so you can run along back to your ship. I'll clean it up... later,\"</i> she amends herself, stretching and yawning. <i>\"Right now, I think I'm going to go take a lay-down,\"</i> she declares.");
			output("\n\nYou get up and pat her on the butt. Yes, she’d best rest. You need her to stay in shape for next time. Putting your [pc.gear] back on, you wish her a good rest and proceed to leave.");
			output("\n\n<i>\"Come back any time,\"</i> she calls after you.");
		}
		else
		{
			output("\n\nA fun idea comes to your mind. Something you could do that would be fun for the both of you.");
			output("\n\nYou get yourself a handful of lube and spread it nicely over your fingers and hands, forming a nice, thick layer of the product.");
			output("\n\n<i>\"[pc.name]? What's taking you?\"</i> Kelly asks. Then, with a smirk you can hear, she asks, <i>\"Is the sight of my ass just that enthralling, huh? You can't take your eyes off it to apply the lube?\"</i>");
			output("\n\nYou apply a generous amount right on top of her loose backdoor, pressing a finger into her.");
			output("\n\nShe lets out a squeak as she feels you intruding into her tailhole, though she's too stretched out to clamp down on you like she would. <i>\"Ooh! [pc.name], what are you -?\"</i>");
			output("\n\nWorking the lube in, like she asked you to. You leisurely pump your finger in and out of her, massaging her sphincter and her innards.");
			output("\n\nShe moans luxuriantly. <i>\"Mmm, yeah, that feels good,\"</i> she tells you absently, rosebud fluttering around your finger. <i>\"Please, give me more,\"</i> she pleads.");
			output("\n\nSmiling at her request, you feed her another finger. And here you thought she was too worn out for more fun....");
			output("\n\n<i>\"Real fun, yeah. Laying here and letting you - ah! - touch me in all the right places ? Now that I've got energy for,\"</i> she boasts, shuffling a little in her position. The reason why is obvious from your position; slowly, but surely, both of her shafts are starting to slide back out of their leathery sheaths.");
			output("\n\nGood to see she’s enjoying herself, but it’s time to up the ante. You poke yet another finger in her overstretched bunny-butt, lightly pumping and snooping around inside her. You grin when you touch a spot that makes her cry out, her prostate.");
			output("\n\nHer tailhole squeezes your fingers back as best it can, the laquine's eyes screwed close as she concentrates solely on your actions. She even tries feebly to pump her ass back against your hand as you continue to rub and thrust and caress her sensitive flesh. And through it all, her cocks get longer and harder, pussy starting to glisten with the feminine equivalent of pre-cum....");
			output("\n\nYou ask her if she’s enjoying herself.");
			output("\n\n<i>\"Mmm... w-what do you - ah! - think?\"</i> she drawls sarcastically, in between whimpering gasps of pleasure and satisfied groans, visibly humping the couch by this point.");
			output("\n\nThat it’s time to go, you tell her. Unceremoniously you pull your fingers away, wiping them off on her butt.");
			output("\n\n<i>\"Wha? Hey! That's not fair!\"</i> she protests, pushing herself up and twisting around to glare at you. <i>\"You can't just get me all worked up like this and then bugger off!\"</i>");
			output("\n\nCourse you can, you reply whilst collecting your [pc.gear]. Plus you think you’ve already given her enough for the day. You gave her an ass-pounding unlike any she’d ever get from anyone else, a sore that accompanies any good fuck and a pair of lovely erections. So she’s perfectly capable of masturbating herself to an orgasm whilst fantasizing about earlier.");
			output("\n\nShe scowls at hearing that, then, eventually, heaves a sigh of acceptance. <i>\"You're a real prick, [pc.name], you know that?\"</i>");
			output("\n\nYes you do, and that’s just the way she likes it too, you know.");
			output("\n\n<i>\"I like it better when you finish me off,\"</i> she mutters, but squirms herself into a more comfortable position on the couch, one hand already reaching for her shaft. <i>\"If you're in that much of a hurry to leave, then go. Don't let the door catch you in the ass on the way out,\"</i> here she stops and smirks. <i>\"That's my job,\"</i> she tells you.");
			output("\n\nYou chuckle as you leave.");
		}
	}
	processTime(20+rand(5));
	
	kellyFucked();
	clearMenu();
	addButton(0,"Next",move,"SOUTH ESBETH 2");
}

//Oral Her
//If coming from <i>\"Share a Meal\"</i> automatically go to one of the variants, skipping the setup completely.
public function oralHer():void
{
	clearOutput();
	userInterface.showBust("KELLY_NUDE");
	showKellyName();
	author("Quiet Browser & LD");
	output("Kelly grins widely upon hearing your proposal. <i>\"Somebody's feeling hungry, eh? Well then...\"</i> she turns and beckons you to follow her as she heads for the dining room table. With a single graceful motion she springs atop it, momentarily posing with one legs outstretched to help show off her haunches, then curling her legs so that she is kneeling before the edge. Her twin erections bob proudly before her, jutting a foot over the edge as she raises her torso and puts her hands on her ample hips. <i>\"Dinner's on me, honey; today's special is honey-glazed footlongs. Get 'em while they're hot,\"</i> she declares, throwing you a saucy wink.");
	processTime(1);
	//[BlowHer][EatHerOut]
	clearMenu();
	addButton(0,"BlowHer",kellysCocksGetBLOWN,undefined,"Blow Her","Give Kelly a blowjob.");
	addButton(1,"EatHerOut",eatOutKellysQuoteUnquoteCunny,undefined,"Eat Her Out","Eat Kelly out.");
}

//Kelly's Cocks
public function kellysCocksGetBLOWN():void
{
	clearOutput();
	userInterface.showBust("KELLY_NUDE");
	showKellyName();
	author("Quiet Browser & LD");
	if(flags["KELLY_BLOWJOBS_GIVEN"] == undefined) flags["KELLY_BLOWJOBS_GIVEN"] = 1;
	else flags["KELLY_BLOWJOBS_GIVEN"]++;
	//If Clothed:
	if(!pc.isNude() && !(pc.hasStatusEffect("Temporary Nudity Cheat")))
	{
		output("<i>\"Hold it!\"</i> Kelly suddenly interjects, frowning as she holds up a hand for emphasis. <i>\"Off with the [pc.gear] first, sugar; I'm a very messy honey-bunny, and take it from me, bunny-honey is very hard to get out of clothes. You just take your things off and put them out of the way before we start; save you some very nasty cleaning bills after we're done,\"</i> she declares.");
		output("\n\nConceding she has a point, you see no reason to refuse. So you strip off your [pc.gear] and lay it neatly on a table in the living room. Somewhere where you don’t think she has a chance in heavens of hitting.\n\n");
	}
	output("You stroke her topmost shaft, admiring it. The texture, the warmth, the way it throbs before you. Her flared tip has already worked itself into a translucent, yellowish honey-glaze. And it drips down with each little twitch of her shaft. Encircling her pole with a hand, you gently test it with a squeeze. This nets you a small burst of pre from her tip. Truly, Kelly has one fine pair of juicy horse-dongs.");
	//Kind:
	if(pc.isNice()) output("\n\nWell, time for dessert! You lick your lips and glomp her topmost shaft without hesitation.");
	//Mischievous:
	else if(pc.isMischievous()) output("\n\nTime to take these ponies out for a stroll! And get some candy while at it too! You lick the flared tip of Kelly’s topmost shaft, teasing her cumslit with the tip of your [pc.tongue] and welcoming it into the warmth of your mouth as you do so.");
	//Hard:
	else output("\n\nThese juicy cocks are too beautiful to be shared with others. You’ll give Kelly the blowjob of her life. One so good that she’ll be masturbating to the memory for months. You give her shaft a suckling kiss, just behind her flare. Mouthing your way around her honey-spitting tip as you suck her into your mouth.");

	output("\n\nA great humming moan of approval blossoms from the laquine's throat, Kelly's eyes closing as she savors the feel of your warm, wet mouth closing around her glans. <i>\"Yeah... sugar, you sure have a sweet mouth,\"</i> she purrs, a throb pulsing along her shaft so you can feel it against your tongue, leaking sweet pre-cum syrup unabashedly into your mouth and down onto the table. <i>\"Why don't you show me just how sweet?\"</i> she suggests.");

	//Hard:
	if(pc.isAss())
	{
		output("\n\nYou reach for her balls and give it a sharp squeeze. Not hard enough to pain her, but hard enough that she feels it.");
		output("\n\n<i>\"Dessert doesn’t talk,\"</i> you remark.");
		output("\n\nShe winces at the pressure on her sensitive nuts, but manages a cheerfully mocking grin. Still, as per your <i>\"suggestion,\"</i> she doesn't say anything.");
		output("\n\nGood girl. The problem being solved, you begin bobbing your head.");
	}
	else output("\n\nRolling your eyes at her antics, you begin bobbing your head.");

	output("\n\n<i>\"Oh, yeah,\"</i> Kelly groans in pleasure at your ministrations, arching her back slightly. A delighted grin on her lips, she places one hand atop your head, gently stroking your ");
	if(pc.horns > 0) output("[pc.horns] before moving on to caress your ");
	output("[pc.hair], a hum of appreciation dripping from her lips as she lovingly kneads at your scalp.");

	output("\n\nHer lower shaft bumps against your neck, smearing her honeyed-pre with each bop. With a smile, or at least as much of one as you can manage with a footlong of horse-cock up your mouth, you move your hands to encircle her other shaft. The one on her shaft proper stroking her languidly, loose grip on the way down, strong grip on the way up. The one on her flared head busies itself by smearing her leaking pre around her flare. Hands moving to open her cumvein whenever you feel you could use a fresh batch.");

	output("\n\nNaturally, you’re not going to forget about the delicious honey-baguette inside your mouth. You roll her shaft around, smearing her delicious pre all over your taste buds, enjoying each throb as you deepen your bobs, intent on deep throating her.");

	output("\n\nFrom the moans and grunts bubbling from the laquine's throat, she's enjoying your ministrations all too well. You can hear her tongue slapping wetly against her breast as it lolls from pleasure-slackened jaws, slurping noisily as she realizes what she's done and sucks it back inside. Her fingers atop your scalp start to clench, but she forces herself to stop before she might hurt you in her enthusiasm. Instead, her hand moves slightly, to keep you in place and to help her balance, even as her hips start to buck slowly, thrusting her into your mouth in clumsy time with your own bobbing, spare cock sliding through your fingers and bobbing meatily against your chin. In her eagerness, she wriggles forward on her knees, inching closer to the edge.");

	output("\n\nYou move a hand to knead her balls, coaxing them to produce more tasty honey for you. Kelly’s movements help you open your throat and her moving a bit closer makes your job easier. You redouble your efforts at pleasuring her. Collecting some pre leaking from her lower shaft to smear it atop her upper shaft like a perverted frosting. This slows your rhythm a bit, but you make up for it by gently using your lips to massage her shaft, just behind her flare.");

	output("\n\nA trill of bliss bursts from Kelly's lips, interrupted when you start smearing her precum along her upper shaft by a faint giggle and a full-body shiver that you can feel right through the cock in your mouth. The laquine's ticklish, it seems... but it also seems that she rather enjoys it, since she inches forward again, trying to avoid moving in such a way that she'll accidentally pop her dick from your mouth, her other hand joining the first atop your head to help her balance.");

	output("\n\nNot that you don’t appreciate her enthusiasm, but if she keeps moving like that she’ll miss the table sometime soon. You would warn her if you weren’t so busy with her cock stuffed in your mouth. But surely she must realize this?");
	if(flags["KELLY_BLOWJOBS_GIVEN"] > 1 && flags["KELLY_BLOWJOBS_GIVEN"] != undefined) output(" It’s not like she’d repeat her mistake from last time. That table of hers can only take so much abuse before it shatters into a million splinters. There’s no way she’s that much of an air-head... right?");

	output("\n\nEvidently, no, she doesn't realize it. She just keeps on blindly inching forward, a slave to her lusts and her fixation on your mouth, pumping her hips even as she crawls forward. Finally, she pushes her luck too far; as you are lifting your head back along her shaft, she pumps forward in an effort to keep it inside of your mouth, only to lose her balance completely! With a startled yelp, Kelly falls clean off the table, sending it clattering off its legs behind her as she hurtles down right on top of you!");

	output("\n\n");
	if(flags["KELLY_BLOWJOBS_GIVEN"] > 1 && flags["KELLY_BLOWJOBS_GIVEN"] != undefined) output("Oh bother, not again! ");
	output("You steel yourself to catch the falling laquine as you immediately hop back to avoid getting hurt by the crashing table. ");
	//Strength Check:
	if(pc.physique() > 30) output("Luckily you’re strong enough to heft her up as a loud bang of wood-meets-floor resounds around the kitchen.");
	else output("Though you manage to catch her, you’re not strong enough to heft her up and avoid falling on your ass. Luckily you’re still able to bend in a way to avoid any serious injury as the loud bang of wood-meets-floor resounds around the kitchen.");

	//Kind:
	if(pc.isNice())
	{
		output("\n\nQuickly recovering from the sudden events, you ask if Kelly is alright.");
		output("\n\nKelly groans slightly, then shakes her head and smiles at you. <i>\"Yeah, honey, I'm just fine. Can't believe I got so careless,\"</i> she sighs, more than a little exaggeration in her tone as she adds, <i>\"I guess I'm a bit more of a bimbo than I like to think.\"</i>");
		output("\n\nYou take her by the chin and give her a tender kiss. It’s fine, you like her just the way she is. Bimbo or not.");
		output("\n\nShe smiles softly, eyes closing as she kisses you back, arms draping themselves gently around your neck as she leans in as close as she can. When you release her, she nuzzles tenderly against your cheek. <i>\"I like me the way I am too... but I like the way you are a whole lot more,\"</i> she giggles.");
		output("\n\nRight... now about your dessert? You’re not done yet.");
		output("\n\n<i>\"I was hoping you'd say that,\"</i> she giggles.");
	}
	//Mischievous:
	else if(pc.isMischievous())
	{
		output("\n\nAfter recovering, you can’t resist lifting Kelly’s chin to look into your eyes and quip, <i>\"So... can’t get your hands off me, huh?\"</i> you smile widely as she pants.");
		output("\n\n<i>\"I might say it's the other way around,\"</i> she returns. <i>\"Or are those somebody else's sweet little fingers admiring the juicy sweetness that is my hot little butt?\"</i> she adds, a wicked gleam in her eye and a grin on her lips that, combined with the way she wiggles her ass against your hands, makes it quite clear she's unbothered by their presence.");
		output("\n\n<i>\"Well, I’m not the one who literally flew into my arms\"</i> you retort.");
		output("\n\n<i>\"Like you wouldn't have done the same if our positions were reversed,\"</i> she retorts, tongue flicking out to emphasise her point by licking the tip of your nose.");
		//If flyable wings:
		if(pc.canFly())
		{
			output("\n\nYou extend your [pc.wings] and point a thumb at them. Clearly you’d have flown over her head and landed safely and sound away from this mess, or better yet....");
		}
		output("\n\nYou wouldn’t have made this mess in the first place.");
		if(flags["KELLY_BLOWJOBS_GIVEN"] > 1 && flags["KELLY_BLOWJOBS_GIVEN"] != undefined) output(" Much less repeat it after the first time, you add.");
		output(" Closing your hand you lightly knock on her head. Is there a brain in there or is she just not using it? You doubt you’ve managed to suck her brains out through her dick yet.");
		output("\n\n<i>\"Yes, there's a brain in there,\"</i> she pouts at you in wounded dignity. <i>\"But, like I always say, if you have time to use your brain when you're fucking, you're clearly not enjoying yourself properly,\"</i> she declares with a huff, folding her arms under her impressive cleavage for emphasis.");
		output("\n\nChuckling, you tug on her nipple and muffle her moan with a kiss. Alright, she has a point, you concede. Now, back to dessert?");
		output("\n\n<i>\"I thought you'd never ask,\"</i> she purrs, stealing a quick kiss from you.");
	}
	//Hard:
	else
	{
		output("\n\nAfter a speedy recovery, you click your tongue. What an air-headed bimbo your little Kelly is. Look at the mess she’s made. She must be punished.");
		output("\n\nWithout another word you adjust her and bend her over your lap, lifting a hand and spanking her pretty butt hard enough to leave hand imprints.");
		output("\n\nKelly yelps and squirms at each slap, but the throbbing of her cocks against your thighs and the sticky smears they leave as each impact makes them rub against your [pc.skinFurScales] makes it clear that she's not entirely put out by the roughness. When you finally deign to stop spanking her, she lets out a childish moan of disapproval, one hand reaching back to gently stroke the now-tenderised flesh of her butt. <i>\"Why'd you do that? It was an accident,\"</i> she whines.");
		output("\n\n");
		if(flags["KELLY_BLOWJOBS_GIVEN"] > 1 && flags["KELLY_BLOWJOBS_GIVEN"] != undefined) output("She obviously didn’t learn her lesson the first time, so a repeat of her punishment is in order, you retort.");
		else output("An accident that could have been easily avoided if she was less of a slut or less of a showoff, you retort.");
		output(" She was a bad girl, messing up the kitchen like that. And you punish your girls when they’re naughty. It’s only logical, you explain.");
		output("\n\n<i>\"I guess,\"</i> she declares, clearly trying to sound grudging as she does so. <i>\"Though I suppose I'm lucky; my mom spanks me a lot harder than that when I do something wrong,\"</i> she admits, actually giggling as she does so, her former gloom brushed to the wayside now.");
		output("\n\nOh? Is this an invitation for you to go harder on her?");
		output("\n\nShe stiffens, you're sure that she pales under her fluffy coat, and quickly shakes her head. <i>\"Oh, no! I mean, when you spank me it.... well, it's kinda hot,\"</i> she admits, downcast gaze going to her now-revealed cocks, which haven't gotten any softer since you stopped sucking. <i>\"But getting spanked like my mom does... I mean, talk about a turn off,\"</i> she proclaims, waving her hand idly.");
		output("\n\nYou drape an arm over her shoulders, smiling confidently. She’s got one little detail wrong. It’s always sexy when it’s you doing the spanking. Now if she doesn’t want another. You haven’t finished your dessert yet.");
		output("\n\n<i>\"Oh? Still hungry? Well...\"</i> she trails off, making a show of thinking about, one hand placing its fingers delicately upon her chin, the other tracing idle circles atop the nearest of her flat glanses. <i>\"I think I can still give you what you need,\"</i> she declares, a wicked smirk on her lips.");
	}
	output("\n\nLifting herself daintily from your lap, the horny laquine sashays over to a chair that remained standing when she brought down the table. With an exaggerated flick of her tail - and the luscious ass underneath - she plonks herself down upon it, balls hanging comfortably over the edge , grinning as she awaits your approach.");
	output("\n\nYou spread her legs and kneel before her, but before you continue you’re just going to have to confirm. <i>\"You’re going to stay in your seat this time, right?\"</i>");
	output("\n\nKelly pouts indignantly. <i>\"Yes, I am,\"</i> she huffs, turning her nose up at the comment that has so wounded her pride.");
	output("\n\nYou chuckle at her reaction. Well, no sense in dilly-dallying. You lean over her twin masts and give the lower one a soft kiss, right on its flared tip.");
	output("\n\nA soft titter escapes her, and she wriggles on her seat in ticklish pleasure at the kiss. <i>\"Mmm, that feels nice,\"</i> she croons, arching her back as if for emphasis. <i>\"You're the best " + pc.mf("boy","girl") + "friend a girl could ever hope to have...\"</i> she sighs. <i>\"Mmm, I would kill for another minute between those lips,\"</i> she purrs, her tongue lavishly caressing her own pouting, kissable lips before she turns her attention back towards you. <i>\"Kiss me some more?\"</i> she asks hopefully, giving you a surprisingly innocent look for such a lusty bunny.");
	output("\n\nSince she’s asked so nicely.... You move to her topmost shaft and give it a similar treatment, extending your tongue to tease her cumslit.");
	output("\n\nShe lets out an appreciative moan at the gesture, eyes half-closing as she savors the contact of flesh on flesh.");
	output("\n\nYou lean over to the side, licking along her lengths. Your hands cup her flares to collect some of her sweet honey and spread along her members as you continue to lick her ponies like a pair of honeyed lollipops. Kissing along her length, delivering teasing licks to the part where her sheath connects to her cocks and even suckling behind her flare. You draw her cock with you as you pull away with your suckling kiss to let it slap lewdly on its twin, sending both shafts bobbing and flinging her pre about.");
	output("\n\nEach touch you make elicits a shiver or a squeak of pure delight from the laquine, and when you make the two dicks slap against each other, she moans like a whore. <i>\"Mmm, you kiss good,\"</i> she purrs, but then opens her eyes wide into a pleading look. <i>\"But won't you please suck on me, now? Pretty please?\"</i> she begs, lips curled into her sexiest pout, arms moved just so to press her boobs together most enticingly.");

	//Mischievous:
	if(pc.isMischievous())
	{
		output("\n\nAh... the age old sexy pout slash big boobies combo. That is such an effective way to ask for stuff. Fine then. <i>\"You want me to suck? Fine. But I expect you to moan like a shameless slut while I’m doing so.\"</i>");
	}
	else output("\n\nWith a smile, you reply, <i>\"Sure thing.\"</i>");

	output("\n\nWithout further ado you return to her topmost shaft and opening your mouth, you slide her cock in. Your hands waste no time in kneading her lower shaft. Pressing and turning and rubbing it like soft clay ready to be molded by an artisan’s hand.");

	output("\n\nKelly's mouth opens in a soft mewl of delight, eyes closing as she loses herself in your ministrations. Her hands reach out to your head, caressing your cheeks before placing themselves atop your scalp, but she makes no move to plunge you further down her shaft, nor does she buck her hips; evidently, she's waiting to see you make the next step.");

	output("\n\nYou pull away from her top shaft with a pop. Time to give some attention to its twin. Your hands migrate to her upper shaft while your mouth kisses and then suckles her lower one in.");

	output("\n\n<i>\"Oh, yes,\"</i> she purrs absently, clearly approving of your actions.");

	output("\n\nYou continue teasing and switching her shafts around. Submitting both of her ponies to the ministrations provided both by your mouth and your kneading hands. You can only guess how that must feel for the shuddering bee-laquine.");

	output("\n\nKelly's hands are clenched tight atop your head, her eyes screwed shut. Wordless gasps and mewls of pleasure bubble from her throat, any coherence driven from her by your touch. With the way she’s throbbing both in your mouth and on your hands, you reckon she won’t last much longer. Now you’ve got a choice to make. With some technique you might be able to close off one of her shafts and make those churning balls of hers pump all their sweet load up the topmost shaft. This way you could drink it all. Or you could just let her paint you with lower shaft while you enjoy a lighter load from her topmost shaft.");

	processTime(20+rand(3));
	pc.lust(15);
	tempNudeOff();
	//[Splatter][DrinkAll]
	clearMenu();
	addButton(0,"Splatter",splatterYourselfWithHoneyBunnysCumAfterGivingHerABJ,undefined,"Splatter","Splatter yourself with Kelly's honey.");
	addButton(1,"DrinkAll",drinkAllOfKellysSpoo,undefined,"Drink All","Try not to waste a single drop of Kelly's copious honey.");
}

//[=DrinkAll=]
public function drinkAllOfKellysSpoo():void
{
	clearOutput();
	userInterface.showBust("KELLY_NUDE");
	showKellyName();
	author("Quiet Browser & LD");
	output("Without so much as a warning, you deepthroat her topmost shaft and clamp down her lower one, right at the base, in a vice-like grip.");
	output("\n\n<i>\"Ack!\"</i> She squeals, her whole body clenching in her chair. <i>\"Honey, w-wha-?\"</i> She moans in pleasure, her whorish cry choking off whatever it was that she was about to say.");
	output("\n\nSmiling inwardly, you swallow, letting your throat muscles milk her shaft.");
	output("\n\nKelly hisses loudly, her legs folding in to encircle your shoulders and keep you in place. She bucks her hips once, twice, and then cries out as she climaxes. You can feel her cock bloating in your hands as it struggles in vain to force half of her monstrous cumshot out around your hands, but your grip is certain and only a comparatively small, almost pathetic river gushes out, smearing itself all along your arm and squirting weakly onto your [pc.chest]. But with that dick blocked, the rest of it is going right into the other one, which is erupting like a honey-volcano squarely into your mouth.");
	output("\n\nIf you hadn't been smart enough to deep-throat her, there would have been no way you could handle all that she's giving you. It's like an endless cascade of sperm-laden sweetness, flowing straight down your throat, so fast and so furious that some of it bubbles back around her dick despite your intentions and floods back into your mouth. Sweetness coats your tongue as it trickles around your lips, but most of it's going right where it belongs: down inside your greedy belly.");
	output("\n\nYou can feel your stomach stretching as it is inundated with the flood of modded laquine semen, the weird pain-pleasure sensations crackling along your nerves and dancing along your skin as she just keeps on cumming and cumming. The vague thought that you might have bitten off more than you can chew dances across your forebrain, but is lost in the sensory overload. You can't even feel Kelly's other pathetic streamer as it splashes over your [pc.chest] and stomach; all you can feel is the sensation of being bloated, a sensation that just keeps on getting stronger and more intense with every second. Gods, it's almost orgasmic....");
	output("\n\nFinally, with some very unlady-like grunts and moans, Kelly's monstrous orgasm comes to an end, her shafts going slack against you. From above, you can hear her heaving for breath, panting like a marathon runner who just finished a four-minute mile. <i>\"By all the old gods, that was intense,\"</i> she sighs eventually, utter satisfaction dripping from her words. Tension suddenly fills her body as she remembers that she wasn't alone for this climax. <i>\"Oh gods - honey, are you okay?!\"</i> she yelps.");
	output("\n\nYou pull away with a grunt, coughing shortly after. With a groan you pat your distended belly. That was quite a load she was carrying. Still you could use a little more sweetness. You lean over and lift her previously neglected lower shaft, sucking on its flared tip like a straw and draining her of every little bit of stray honey that might’ve escaped through your grip.");
	output("\n\nKelly bites her lip and whimpers in pleasure as you complete your task of emptying her, then lets out a laugh of equal parts amusement and disbelief. <i>\"I've heard of gluttons for punishment before, sugar, but you take the honeycake,\"</i> she giggles, reaching down a hand to gently stroke your cheek. <i>\"So, are you full now? Because if the answer is no,\"</i> a quick glance down at your monstrously bloated stomach and the smirk on her face makes it clear she's not expecting a \"no\" from you, <i>\"I have to confess I can't give you anymore. I think you've literally sucked me dry,\"</i> she declares. Her tone tries to be lamentful, but the self-satisfied smile that splits her face makes a total lie of the effort.");
	output("\n\nYeah, you’ll have to refuse. How about she help you get on the couch so you can have a few moments to rest?");
	output("\n\n<i>\"Sure thing, sugar,\"</i> she replies with a grin. Unfurling her legs from around you, she clambers off of her chair, wobbling a little at first as she takes the floor. Once her own legs are straight beneath her, she leans down to help you up, offering you her shoulder and struggling to lift you to your [pc.feet].");
	output("\n\n<i>\"Ooof! You're heavy, honey,\"</i> she complains, even as she starts awkwardly walking to over to the couch. She carefully makes sure that you're ready first, and then lowers you down; the springs complain a little, but it holds up under you.");
	output("\n\nThanking her for the aid, you let her know you just need a quick rest before you go on your way. She’s really filled you up with her special dessert.");
	output("\n\nKelly nods absently, even as she drums idly on your belly with her fingertips, an introspective look on her face. Finally, she nods again and looks you in the eye. <i>\"Sugar? There's an old laquine home remedy for helping folks in your... situation... to get over it quicker. You want me to give it a shot?\"</i> she purrs as she asks. As if to give you a clue as to what she means, her fingers trail playfully down your belly towards your loins, her tongue slurping lewdly from her mouth and flailing in the air before her before she sucks it back inside.");
	output("\n\nYou can't do much in your condition, so you tell her, <i>\"Sure, go on.\"</i>");

	output("\n\nKelly grins the grin of a cat who's about to get all the cream she wants. <i>\"Trust me, you're going to love this,\"</i> she purrs, already starting to kneel down before you, eventually vanishing beneath your stomach.");
	if(pc.hasCock() && pc.hasVagina()) output(" From her position, however, you can hear her calling up to you, <i>\"Do you want me to do your cock? Or your pussy?\"</i>");
	pc.lust(35);
	processTime(12);
	pc.loadInMouth(chars["KELLY"]);
	pc.loadInMouth(chars["KELLY"]);
	//[Cock][Pussy]
	clearMenu();
	if(pc.hasCock()) addButton(0,"Cock",getBlownByKelly);
	else addDisabledButton(0,"Cock","Cock","You need a cock for Kelly to suck it.");
	if(pc.hasVagina()) addButton(1,"Pussy",getLickedOutByKellllaaaahhhh);
	else addDisabledButton(1,"Pussy","Pussy","You need a pussy in order for Kelly to lick it.");
}

//Go to appropriate/selected "Kelly gives the PC oral" sex scene//
//[=Splatter=]
public function splatterYourselfWithHoneyBunnysCumAfterGivingHerABJ():void
{
	clearOutput();
	userInterface.showBust("KELLY_NUDE");
	showKellyName();
	author("Quiet Browser & LD");
	output("You move your hands to knead her balls. Not having a concentrated jet means you’ll lose some pressure and precious honey. So you gotta at least ensure that she’ll cum as much she can to make up for it.");
	output("\n\n<i>\"Gods, you make me feel so good,\"</i> Kelly moans, thrusting her hips forward for emphasis. You almost think you can feel her balls bulging back against your fingers, growing rounder and riper as they swell with seed in response to your touch. <i>\"Those fingers of yours are pressing all my buttons.");
	if(kellyAttraction() <= 50) output(" Are you that familiar with horse-dicks? - Ah! - Even so... such intimate knowledge of my bits. You must be a sex genius.");
	else output(" Such intimate knowledge of my body. - Hmm - You’re really one of a kind, honey. I’m putty and you’re the artisan honey, don't stop!");
	output("\"</i>");

	output("\n\nKelly pants in her excitement, the short, sharp breaths making her tits bounce about most enticingly. Her hands unthinkingly fly from your head to catch them, kneading the soft fur covering their expanse, thumbs and forefingers moving to pinch the diamond-hard black nubs of her nipples as they jut out in her excitement. She moans like a whore as your tongue caresses her cum-vein. <i>\"That mouth of yours.... gods, I could just melt in your mouth. ");
	 //if Affection < 50:
	 if(kellyAttraction() <= 50) output("How can you take it so well? - Ah! - I don't know if there's some very heartbroken she-stallion pining for you out there - ohhh! - or if you're just that damn good at sucking girl-cock!");
	 else output("I want to be your favorite sweet treat, lover - please, let me just melt away in that mouth of yours! Hot and wet and tight, sucking me dry, I wanna give you everything I have!");
	 output("\"</i>");

	output("\n\nSeeing Kelly react so delighted at your ministrations is almost a reward unto itself. Almost. Your real reward though is still a ways away. But judging by her throbbing and the ever expanding gouts of pre she’s been leaking from her duo of ponies, you don’t think you’ll have to wait much longer. Either way, time to level this up a notch!");

	output("\n\nAdjusting yourself, you take Kelly as deep into your throat as you can manage and hold her there, swallowing around her cock-flesh. Your hands form a tight circle both behind her flare and at the base of her sheath. You compress her cock by moving your hands together and stretch it by moving them apart, loosening her cumvein so she can let the contents of her heavy, sloshing balls out.");

	output("\n\nKelly's head lifts towards the sky, a deep cry of bliss rumbling up her throat as her whole body quakes. Forgotten below her, the laquine's pussy gushes slick, sweet femcum all over her chair, obscured by the monstrous masculine eruption that occurs. The cock in your mouth seems to explode, gushing thick gouts of sweet, sticky seed over your tongue, swirling around your teeth. The one below, not so obstructed, instead fires volleys of spooge all over your [pc.chest] and [pc.belly], attempting to paint every inch of your front below the neck with a thick glaze of orange-yellow honey-cum.");

	output("\n\nRivulets of Kelly's sweetness squirt between your lips at the sudden pressure of her eruption, making you hasten to take hold of the cock in your mouth with both hands as you swallow for all you're worth. No sooner has one thick, gooey mouthful slid down your throat than a second drenches your tongue, forcing you to lap and suckle and gulp with all your might. A moment's thought tells you it's a small mercy that she's not as thick or sticky as real honey, but it is swept away in a tide of sweetness. You close your eyes, the air around you growing thick with the fug of sex and honey as you swallow mouthful after delicious mouthful. Your stomach starts to protest its fullness, but you keep on swallowing. Even when Kelly's hands place themselves atop your head to help her balance, you keep on swallowing.");

	output("\n\nFinally, however, even the laquine's mighty reserves run dry. <i>\"Nnnghn! Ohh! Ah! L-last - one!\"</i> she manages to bark out, thrusting her hips forward and loosing one last gut-glazer into your mouth. With a great heaving sigh of satisfaction, she slumps back against her chair, panting for breath. <i>\"Gods, I <b>love</b> cutting loose like that,\"</i> she moans to herself, once she's caught it. Sleepily, she opens her eyes and smiles at you. <i>\"You okay, sweet thing?\"</i> she asks, gently stroking your head as she does.");

	output("\n\nYou get up from between her legs, licking a stray strand of honey off your lips. Patting your belly, you inform her that you’ll be fine once you’ve actually had a bath. Kelly’s done a number on you. You motion to your honey-drenched self.");
	pc.loadInMouth(chars["KELLY"]);
	//If Attraction < 50:
	if(kellyAttraction() < 50)
	{
		output("\n\nKelly smiles pleasantly at that, openly ogling your semen-drenched, swollen-bellied form. <i>\"Well... much as I might think you look better like this, I guess you have a point,\"</i> she giggles. <i>\"Feel free to use my bathroom and clean up, if you really must.\"</i> This last part she adds with a seductive look and a lustful lilt to her voice.");
		output("\n\nYou thank her and head to get clean.");
		processTime(10);
		pc.lust(10);
		//Think back to street.
		clearMenu();
		addButton(0,"Next",move,"SOUTH ESBETH 2");
		return;
	}
	else
	{
		output("\n\n<i>\"You sure you need a bath? You look good enough to eat, to me,\"</i> Kelly giggles. At your look, she huffs and pouts in a jokingly offended manner. <i>\"Oh, very well; come here, lover,\"</i> she tells you, a crooked finger motioning you to approach, a knowing leer on her lips. When you get close enough, she pulls you into her lap, as best she can, and bends her head forward, her long yellow tongue telescoping out. Without hesitation she starts to lap at your front, licking her way from the crook of your neck down towards your loins, hungrily slurping up her own perverse leavings.");
		output("\n\nBut there's more than simple hunger for jism motivating her. Any doubts about that are quickly lost when she first reaches your [pc.nipples], her tongue trailing across them with deliberate, purposeful motions. She circles your areolas with quick, teasing flicks, then slowly");
		if(!pc.hasFuckableNipples())
		{
			output(" curls it deliberately around your erect ");
			if(!pc.hasDickNipples()) output("nipple");
			else output("nipple-cock");
			//tenta-nipple
		}
		else
		{
			output("invades your hole, teasing the interior of your ");
			if(!pc.hasLipples()) output("nipple-cunt");
			else output("breast-mouth");
			output(" with her tongue-tip");
		}
		output(". She keeps this up for several very pleasant moments, trying to see if she can make you squirm.");

		output("\n\nOnce she's bored with your [pc.chest], she continues making her way down your body, leaning you back slightly to help her better reach the cum-swollen stretch of your stomach. Tingles race across your nerves as her tongue glides over the stretched [pc.skinFurScales], circling almost playfully around your bellybutton.");
		output("\n\nAs fascinated as she seems to be, your gut doesn't hold her interest for long; she helps you up from her lap, and then, in a quick blur of motion, spins the two of you around so that you are the one sitting and Kelly is standing - now kneeling - before you. In your new position, Kelly wastes no time, moving down the underside of your belly, skipping past your loins to tackle your [pc.legs]. She glides down, all the way to your [pc.feet], then back up again.");
		output("\n\nFinally, she smacks her lips, hiccups softly and grins up at you. <i>\"There we are; all neat and clean. How'd you like your bunny-bath?\"</i> she asks, giggling at her lame pun.");
		//Kind:
		if(pc.isNice())
		{
			output("\n\nYou thank Kelly for the bath, though what you had in mind actually involved soap and not a certain bee-bunny’s tongue.");
			output("\n\n<i>\"Eh, soap and water's overrated. My way is much more fun,\"</i> Kelly declares flippantly, a cocky smirk plastering itself on her face as she dismisses your concerns with a wave of her hand.");
		}
		//Mischievous:
		else if(pc.isMischievous())
		{
			output("\n\n<i>\"That was good,\"</i> you tell her. <i>\"But who’s going to clean me off of bunny-girl spit now?\"</i> you smirk.");
			output("\n\n<i>\"I could have just left you covered in bunny-girl spunk instead, would you have preferred that?\"</i> she asks dryly, a playful twinkle in her eye.");
			output("\n\nShe could never have done that. You point out that she loves cum too much to let it all go down the drain. Plus she loves you too much to let you marinate in her spunk.");
			output("\n\n<i>\"Oh, I love you alright,\"</i> she agrees instantly. <i>\"But why would that stop me marinating you? I think it'd be pretty hot, if I could taste myself on you whenever I kiss you... mmm, you'd have to pry me off of you with a crowbar, if that was the case,\"</i> she purrs, licking her lips at the thought.");
			output("\n\nShe means her usual clinginess is not actually her maximum clinginess? Maybe you should buy a second crowbar, just in case.");
			output("\n\nShe bursts out laughing at that. <i>\"Maybe you should... but don't deny it; you love me when I'm clingy,\"</i> she croons, pushing her tits out as if to emphasize part of the reason why you \"obviously\" feel that way.");
			output("\n\nOnly if she’s not glazed herself, you tell her with a grin.");
			output("\n\nAt that, she pouts and sticks out her tongue, clearly unable to think of a verbal retort to that.");
		}
		//Hard:
		{
			output("\n\nA fine job, but you already expected as much from your bitch-bunny.");
			output("\n\n<i>\"But of course,\"</i> she grins smugly. <i>\"Only the finest for my rose,\"</i> she declares in a triumphant, closing the distance between you so that she is sitting on your lap, more or less, arms going around your neck, clearly a moment's whim away from closing the distance and kissing you.");
			output("\n\nYou grab her bouncing titties and give her nipples a little twist. Kelly gasps in surprise and you attack her by kissing her, tongue first.");
			output("\n\nKelly is caught off-guard by your initial assault, but recovers with considerable speed, swiftly tightening her grip around your shoulders and hungrily ravishing your mouth in reply. Her tongue grapples desperately with yours, attempting to seize it in writhing coils and make it submit to her will, even as she suckles upon it with a lustful moan.");
			output("\n\nYou break the kiss and push her off, getting up after her. That’ll be enough for now.");
			output("\n\nKelly simply grins, giggling softly as she nods in agreement.");
		}
		output("\n\nNow that you’re clean of her honeyed batter, you decide a small rest is in order. So you make your way to her couch, where you plop down.");
		output("\n\nThe laquine looks at you, studying you. <i>\"Would you like something, sugar? You look a little worn out.\"</i>");
		output("\n\nA drink would be fine right now, you tell her.");
		output("\n\n<i>\"Coming right up,\"</i> Kelly replies, already walking towards the kitchen. Within moments, she returns with a glass filled with cold water, which she presents to you.");
		output("\n\nTaking the offered glass, you down it in a single gulp and lay it on a table nearby, whilst sighing in relief.");
		output("\n\n<i>\"Not thirsty anymore?\"</i> She asks. At your nod, she grins a grin that you have come to know very well. <i>\"That's good, but now, I'm just dying for a drink... and I'm not interested in water,\"</i> she croons. As if she really needs the emphasis, she leans forward and rubs at your ");
		if(pc.hasCock()) output("[pc.cockBiggest]");
		else output("[pc.vaginas]");
		output(", still naked and exposed, making it very clear what sort of \"drink\" she wants.");

		processTime(10);
		pc.lust(20);
		pc.shower();
		//[GetBlown] [GetLicked]
		clearMenu();
		if(pc.hasCock()) addButton(0,"GetBlown",getBlownByKelly);
		else addDisabledButton(0,"GetBlown","GetBlown","You need a cock for Kelly to suck it.");
		if(pc.hasVagina()) addButton(1,"GetLicked",getLickedOutByKellllaaaahhhh);
		else addDisabledButton(1,"GetLicked","GetLicked","You need a pussy in order for Kelly to lick it.");
	}
}

//Kelly's Cunny
public function eatOutKellysQuoteUnquoteCunny():void
{
	pc.girlCumInMouth(chars["KELLY"]);
	clearOutput();
	userInterface.showBust("KELLY_NUDE");
	showKellyName();
	author("Quiet Browser & LD");
	kellyFucked();
	pc.lust(15+rand(5));
	processTime(13+rand(3));
	output("You approach her, looking over what she’s offering you. Then you grab one of her shafts and pull on it, bringing Kelly ever closer to the edge.");

	output("\n\nKelly quickly adjusts to the motion, sliding her legs over the edge so that she is now sitting on the table, legs and loins hanging over the side, rather than kneeling atop it. She gives you a quizzical look, but keeps her mouth shut.");

	output("\n\nYou place a hand on each of her thighs, then hoist them up!");

	output("\n\nCaught by the sudden action, Kelly offers no resistance and lands flat on her back across the table - fortunately, it's wide enough to hold her. <i>\"Ooof! What's going on, honey? It's not like you couldn't get at my cocks before,\"</i> she asks, though she sounds more amused than anything.");

	//Kind:
	if(pc.isNice())
	{
		output("\n\nAs much as you appreciate her offer, you’d rather eat some honey directly from her honey-pot.");
		output("\n\n<i>\"Well, for such a nice " + pc.mf("boy","girl") + ", how could I possibly refuse? Eat your fill,\"</i> she giggles.");
		output("\n\nQuite an enticing invitation... and since she’s given you free reign, you’ll do just as you want. You lift her balls off her moist snatch, inhaling her honeyed scent, licking your lips in anticipation.");
		output("\n\nKelly simply smiles and spreads her legs a little more, making sure your access is as unrestricted as possibly. She reaches down and gently shifts her four over-sized balls out of the way, brushing against your fingers with her own as she takes over the task of keeping them off of her juicy snatch.");
		output("\n\nYou start off with a tender kiss to her folds, extending your [pc.tongue] just enough to lick along her slick opening. From top to bottom, you barely part her folds as you tease her with the very tip of your tongue.");
		output("\n\nThe laquine shivers, sticky sweet fluids already dabbing at your tongue's tip as it passes through them, making it evident that there's going to be plenty of juice when you start licking for real. She says nothing, though, apart from a contented hum.");
		output("\n\nSeeing no reason to hold back any longer, you plunge into her depths. A sloppy lick here, a teasing one there, a little kiss here and pinch there. You pleasure her in earnest as you enjoy the sweetness of her fluids.");
		output("\n\nThe laquine moans like a whore, not holding back her appreciation of your efforts. She's hot and wet, slick with sweet, sex-and-honey-scented juices, her folds rippling around your tongue and playfully clamping down on it, making teasing attempts to trap it inside of herself.");
		output("\n\nYou smile to yourself, seems like she’s enjoying it. Not that you could complain yourself. But it’s much too early for her to cum. You drag your [pc.tongue] out of her, teasing her folds once more, making out with her nether-lips like a tender lover.");
		output("\n\nShe groans luxuriantly, wetness flowing thick and freely across your [pc.lips], down your chin. <i>\"Mmm, sweet thing, you're good at this,\"</i> she croons dreamily. Her hands have shifted from holding her male bits out of the way to actively caressing them; stroking and kneading her balls, pumping her shafts in erratic strokes. Her legs twitch within your hands, clearly wanting to curl themselves over your back and pull you in deeper.");
		output("\n\nLicking all around her labia one more time, you plunge back into her depths. It’s time to finish this and reap your reward for cleaning out this delicious honey-pot of Kelly’s.");
		output("\n\nKelly reacts to your efforts with obvious enthusiasm, moaning and gasping with every twirl and flick of your tongue, writhing against the table. Her eyes are screwed shut, her long tongue lolling down to undulate like an agitated serpent between her tits, barely capable of remembering to keep her balls out of your face as she bucks and heaves. <i>\"Oh... gods!\"</i> She arches her back and screams in pleasure as her orgasm finally washes over her, twin shafts geysering honey across her belly, breasts and face, pussy clamping down on your tongue and gushing honeyed femcum into your face like a drinking faucet.");
		output("\n\nYou do your best to drink down the flood she sets off upon you. Naturally you wind up completely drenched in honeyed juices, but it’s such a tasty treat you don’t really mind. Plus you’re no worse for wear, while Kelly is completely plastered with honey-cum.");
		output("\n\nKelly twitches a little, fires off a last few sizable spurts, and then slumps against the table with a huge sigh of release. <i>\"...That was wonderful, sweet thing. You really know your way around my honey-pot,\"</i> she pants to you. She manages a weak giggle, <i>\"Did you enjoy it? Get your fill of sweetness?\"</i>");
		output("\n\nYes you did, you reply. Though you’re pretty sure the both of you could use a bath now.");
		output("\n\n<i>\"Well,\"</i> she sing-songs, <i>\"I do have a pretty good-sized shower. Perhaps we can share...?\"</i> she trails off meaningfully, awaiting your response.");
		output("\n\nSomehow you figured it would end this way. You extend a hand to help her up and motion for her to show you the way.");
		output("\n\nThe sticky, gooey bunny-herm slides easily off the table, still dripping thick globs of honey. She stretches a kink from her back, favors you with a smile, and starts leading the way to the bathroom, still holding you by the hand.");
		output("\n\n<b>Later....</b>");
		//if clothed:
		if(!pc.isNude())
		{
			output("\n\nYou move to sit on Kelly’s couch, still stark naked, but clean. She said your [pc.gear] would take a while to finish washing, so she told you to just make yourself comfortable while she finishes bathing. Apparently bunny-honey tends to stick to her fur.");
		}
		else output("\n\nYou move to sit on Kelly’s couch, still stark naked, but clean. You’ve been feeling a bit tired after your little encounter. Not that Kelly’s playfulness during the bath helped either. So you decide to make good on her offer to just relax while she finishes bathing. Maybe it’s her way of apologizing for wearing you out... not that you minded.");
		output("\n\nAs you lounge on her couch, you find that your little stint with the bee-bunny has gotten you a bit aroused");
		if(pc.hasCock()) 
		{
			output(" if your half-erect [pc.cocks] ");
			if(pc.cockTotal() > 1) output("are");
			else output("is");
			output(" any indication.");
		}
		else if(pc.hasVagina()) 
		{
			output(" if your rapidly moistening [pc.vaginas] ");
			if(pc.vaginaTotal() > 1) output("are");
			else output("is");
			output(" any indication");
		}
		output(". You wonder if you should do anything about that....");
		//[Masturbate][Nap]
		clearMenu();
		if(!pc.hasCock() && !pc.hasVagina()) addButton(0,"Next",takeANapAfterNiceCunnilingus);
		else
		{
			addButton(0,"Masturbate",masturbateAfterKellyLingus);
			addButton(1,"Nap",takeANapAfterNiceCunnilingus);
		}
	}
	//Mischievous:
	else if(pc.isMischievous())
	{
		output("\n\nYou weren’t really feeling in the mood for honey-buns, but you could totally go for some honey-pie. And since she has such a delicious looking one, you thought you’d indulge.");
		output("\n\n<i>\"Yes, it is a sweet-looking pie, isn't it? I suppose the customer is always right,\"</i> she chuckles, clearly not phased at all by your choice.");
		output("\n\nOf course you are, but you’re not content being just a customer, you explain.");
		output("\n\nShe gives you a quizzical look from her position, which is honestly kind of comical.");
		output("\n\nYou shove a finger inside her, twisting it around to stimulate her entrance. What you really want, is to own this delectable joint. Totally and completely.");
		output("\n\nShe bites back a gasp or a moan at the surprise penetration, trained pussy stretching wonderfully around your intruding digit, but the look on her face makes it clear that you're succeeding in stimulating her. <i>\"Ah... I'm not selling,\"</i> she pants, unable to keep a grin off her face as she gives you a playfully defiant look.");
		output("\n\nO-ho! But she hasn’t even heard your proposal yet? You promise to make her an offer she just. Can’t. Refuse. You say, pumping your finger inside her with each word.");
		output("\n\nKelly lets out a short gasp, clenching down on your finger with surprising force, eyes half-hooded as she basks in the stimulus. <i>\"So sure of yourself, honey? Well, alright... let's hear this offer of yours. But it's going to need to be spectacular,\"</i> she purrs, winking cheekily at you for emphasis.");
		output("\n\nYou chuckle, she has no idea.... You slowly slide your finger out of her, lightly touching her as you slide it down her taint. Leaning close, you extend your [pc.tongue] to give her sloppy cunt and equally sloppy lap, wrapping your lips around her erect little pleasure buzzer in a perverted kiss.");
		output("\n\nKelly moans in desire, arching her back slightly as you lips close around her clit, eyes closed as she savors the feeling.");
		output("\n\nYou continue to suckle her clit, licking it softly as you prod at her tight little rosebud. You could just shove your finger inside, as well lubed as it is, but that would be no fun. No... you want her ass to work for its prize, you want her to plead for you to violate her rosebud with your intruding finger. You want to tease her until she’s a screaming pile of oversexed bunny.");
		output("\n\nKelly tries instinctively to squeeze your finger between her luscious buttcheeks, but in her position, she can't really manage it. <i>\"Ah! ...Is that the best you got? N-nng!-Nothing special yet,\"</i> she pants, moaning as you delicately scrape the very tip of her little button with your teeth.");
		output("\n\nChuckling to yourself, you decide to up the ante. Slowly you begin feeding her winking anus your finger, just barely penetrating it with the very tip. You push in enough that she can’t clench her butt closed, but not far enough that she’s got anything substantial to squeeze on. Despite how much you want to dig in that delicious cunt of hers, you resolve to hold your position. Still licking around her clitty with your [pc.tongue], of course.");
		output("\n\nShe lets out a frustrated whimpering growl, rosebud fluttering as it tries and fails to grasp your finger, even though there's nothing inside of it, labia visibly winking at you as they clench in sympathy, trying to trap something that isn't inside of her. She wriggles and squirms, but grits her teeth. <i>\"I... y-you haven't beat me yet!\"</i> she manages to gasp, still clinging desperately to her defiance.");
		output("\n\nBeaten her? This wasn’t even a fight to begin with. It was over before you began. Now she knows what she’s gotta say if she wants you to keep going, or you could just go. You pull your finger away and give her clitty another kiss.");
		output("\n\nShe sighs. <i>\"You’re one tough customer, honey. Well, if you really want a piece of me. I should have you know I expect to paid in full, up-front. Now quit being a tease and give me what we both want, alright honey?\"</i>");
		output("\n\nAlright, you agree. It’s time to show her you always keep your end of the bargain. Without another word you plunge your finger into her butt, stroking past her tight ring as you look for whatever special spot you can find. You nuzzle her cunny, kissing her labia and piercing her with your [pc.tongue]. This time plunging it as far as you can and tasting the sweetness within. Warm, wet and inviting, just the way you like it.");
		output("\n\nKelly moans, deep and low, a sigh of deepest satisfaction, whole body loosening as you finally penetrate her. Her sopping folds wrap themselves around your [pc.tongue], holding it in a hot, sweet, silken vice, drawing it as deeply into her as you can reach.");
		//if long tongue:
		if(pc.hasTongueFlag(GLOBAL.FLAG_LONG))
		{
			output("\n\nShe wants more, and you’re happy to oblige. Using your [pc.tongue] to its fullest, you plunge into her as far as you can reach. Her cervix tries its best to deter your advances, and while it does take some work for you to find wiggle room, you eventually pierce that barrier guarding her innermost sanctuary.");
			output("\n\nKelly arches her back with an ecstatic cry of pleasure, her cunt greedily clenching down on your tongue as it penetrates her very womb, soaking you in the taste of her honeyed fluids.");
		}
		output("\n\n<i>\"I'm sooo close,\"</i> she moans luxuriantly, barely able to keep her balls out of your face as she caresses and kneads her own dripping shafts in erratic strokes. Her long tongue slithers from her mouth and sinuously caresses her erect nipples, tantalising flickers teasing each nub in turn as she helps push herself towards her inevitable climax. She can't take much more....");
		output("\n\nWithdrawing from her pussy, you grin widely. If she’s so close, just cum already. You feed her butt a second finger, just as you give her buzzer a complementary lick.");
		output("\n\nHer pussy ripples, her ass clenches down tightly on your fingers and she wriggles, trying to fight it back, but she can't. With a squeal of delight she erupts in a veritable fountain of honeyed jism, thick gushes of girlcum washing over your chin and spilling down your front, over your [pc.breasts], whilst her twin cocks start painting her belly, breasts and even face with long golden ropes of sperm-laden honey. The laquine bucks and heaves as her abundantly liquid orgasm pours forth, covering her and the tabletop and the floor below in thick sex-juices, filling the air with a heavy fug of honey and musk. Finally, however, even her prodigious reserves run empty and she slumps back, panting slow and deep, eyes screwed closed as she savors the afterglow.");
		output("\n\n<i>\"...You were right,\"</i> she comments softly, once she can speak again. She's wearing a huge smile as she adds, <i>\"totally worth the price.\"</i>");
		output("\n\nTeaches her to not question you next time. You lick your lips of her excess juice. Kelly is a messy girl, not only did she soak you, but she’s also managed to soak herself. And what a pretty sight this is, you add.");
		output("\n\n<i>\"Flatterer,\"</i> she chuckles, clearly unabashed.");
		output("\n\nNow, as the one responsible for this mess, how does she plan on making up for soiling you with bunny-honey?");
		output("\n\n<i>\"First... can you help me up, sweet thing? You really did a number on me,\"</i> she giggles, lazily waving a hand in the air as invitation. Once you've helped her sit up, the dripping laquine sighs in satisfaction before looking you over.");
		if(!pc.isNude())
		{
			output("\n\nShe takes in your condition and shakes her head with a disapproving click of her tongue. <i>\"Now, what a silly " + pc.mf("boy","girl") + " to not get undressed before we started,\"</i> she giggles. <i>\"Alright, let me see....\"</i> She hops neatly down from her perch on the table, stands up and approaches you. Her hands reach out to start removing your [pc.gear], the laquine openly ogling your naked form as more and more of you is revealed.");
			output("\n\nOnce you are naked, you can't resist striking a pose and asking if she likes what she sees.");
			output("\n\n<i>\"You know I do, honey,\"</i> she replies, batting her eyes flirtatiously at you. <i>\"Now, you just go and make yourself comfortable; I've got some special stuff that'll take the honey right out, but washing these things will still take a while,\"</i> she informs you, already bundling your gear off to the laundry.");
			output("\n\nWith nothing better to do for the time being, you decide to just lounge on the couch. This latest encounter with Kelly has left you feeling a bit randy yourself.");
			//Genderless auto-pick Nap.
			//[Masturbate][Nap]
			clearMenu();
			if(!pc.hasCock() && !pc.hasVagina()) addButton(0,"Next",mischievousNapAfterCunnilingateKelly);
			else
			{
				addButton(0,"Masturbate",mischievousMasturbateAfterCunnilingateKelly);
				addButton(1,"Nap",mischievousNapAfterCunnilingateKelly);
			}
		}
		else
		{
			output("\n\n<i>\"Smart " + pc.mf("man","woman") + ", aren't we? Be a shame to get all that honey smeared onto your clothes - trust me, I know how hard it can be to get it out,\"</i> she giggles. <i>\"Now, let's get you cleaned up,\"</i> she purrs, already pushing herself off of the table and onto the floor. Kelly pads towards you, reaching up to gently take your face with her hands, then leans in, lips opening and tongue curling outwards.");
			output("\n\nYou weren’t expecting a tongue-bath. Not that you’re complaining.");
			output("\n\nWith deliberate languid strokes her tongue dances across your [pc.face], slithering across your [pc.lips] and gliding down your chin, swiping up every last drop of her feminine fluids there. She sucks it back into her mouth and swallows, pointedly, then extends it again and bends in to start lapping at the curve of your throat. Down she goes, slowly and steadily, licking and sucking all the way. She hums to herself as she reaches your [pc.chest], moving purposefully to your ");
			if(pc.totalNipples() > 2) output("first pair of ");
			output("[pc.nipples] and pointedly curling her tongue around them. She near-nurses at your breast, moving from nipple to nipple after teasing you with lips and tongue, then descends down to your [pc.belly], sliding her tongue in a spiral pattern that ends with her ticklishly flicking your bellybutton. After doing that, though, she withdraws her tongue and stands back up, smacking her lips. <i>\"All done,\"</i> she announces proudly. <i>\"Feel better now?\"</i>");
			output("\n\nYou nod, complimenting her on a job well done.");
			output("\n\n<i>\"Mmm, my pleasure, sweet thing,\"</i> she tells you, noisily sucking at a finger. <i>\"But, if you'll excuse me, I need to wash up, or I'm going to track honey everywhere again,\"</i> she tells you before turning and heading to the bathroom.");
			output("\n\nWith nothing better to do for the time being, you decide to just lounge on the couch. This latest encounter with Kelly has left you feeling a bit randy yourself.");
			//Genderless auto-pick Nap.
			//[Masturbate][Nap]
			clearMenu();
			if(!pc.hasCock() && !pc.hasVagina()) addButton(0,"Next",nudeNapAfterKellyCunnilingus);
			else
			{
				addButton(0,"Masturbate",kellyNudeMasturbateAfterCunnilingate);
				addButton(1,"Nap",nudeNapAfterKellyCunnilingus);
			}
		}
	}
	//Hard:
	else
	{
		output("\n\nYou don’t want cock, you want pussy. Her pussy. And you always get what you want.");
		output("\n\n<i>\"My, my, the take charge type, are we? Well, if that's what you want, I'm happy to let you have all you can eat,\"</i> she smirks.");
		output("\n\nAs if she had any choice in the matter. You lift her balls out of the way, parting her folds with a pair of fingers as you watch her slick honeypot drool its juices down her taint. Wet and juicy, just as you expected. But not nearly enough to satisfy you just yet.");
		output("\n\nYou know just how to solve that issue. Without warning you plunge a finger inside her, all the way to the knuckle, stirring her honey-pot as you wiggle your finger.");
		output("\n\nKelly arches her back at the sudden forceful penetration, a deep moan spilling from her throat. <i>\"Hey, not so rough...\"</i> she groans, a chastising tone in her words belied by the eagerness with which she clamps down on you, walls already starting to feel wetter as they begin to ripple around the digit as if it were a cock the were about to milk. As your wriggling finger touches something deep inside of her, she shudders, lips momentarily curling in an expression of pleasure - you clearly found a spot she likes.");
		output("\n\nNever slowing down, you smirk confidently at her. You heard her mouth plead something, but her body is pleading something else. So, which is it? Does she really want you to be less rough? Or was that just her begging for something more? You shove a second finger in.");
		output("\n\nShe squeezes tighter at the intrusion, though who can say whether it's a futile effort to keep you out or just to enjoy it more. Given the steady increase in wetness, the enthusiasm with which her flesh is rippling around you, the soft pant of lust that escapes her... you'd probably say the latter. <i>\"B-bite my sweet ass,\"</i> she growls, gasping as one particularly deep thrust of your fingers hits another sweet spot.");
		output("\n\nFeisty... but feisty can be fun too. If that’s what she wants, you’d be happy to oblige. You lean closer to her and using your other hand lift up a leg. Then without warning you deliver a bite, right on her butt. Naturally, you’re careful not to draw blood with your teeth. But you still want her to feel it.");
		output("\n\nThe laquine lets out a squeal and wriggles on the table as your teeth close on her skin, though a giggle escapes her despite her efforts to stifle it. Her cunt squeezes you, as if anxious to milk your fingers of cum that they don't have, her eyes closed as if to heighten her resolve.");
		output("\n\nLet it never be said that you’re not willing to accommodate your partner’s kinks, you smile. Her pussy’s moist enough to take a third digit, you think. And you so you feed her a third, now outright stretching her opening as you occasionally rub against her g-spot.");
		output("\n\nShe moans like a whore, panting like a dog in heat as her now sopping love-tunnel does its best to grind your fingers together. The laquine is trying to buck back against you from her somewhat awkward position, your own pistoning evidently not enough for her. <i>\"Ohh... d-don't get any bright ideas about fisting me,\"</i> she warns you, in between gasps. <i>\"B-but this... oh, gods, this is goood...\"</i> she whimpers, squeezing you for all she's worth.");
		output("\n\n<i>\"Why? Are you going to get mad at me for sticking my whole hand into the honey-pot?\"</i> you tease her.");
		output("\n\n<i>\"D-did I say that?\"</i> she asks, hissing as you stroke her G-spot again. <i>\"But the l-last one to try that with no buildup...\"</i> she moans as you plunge into her again. <i>\"Had to get a pin in their j-jaw.\"</i>");
		output("\n\nIt’s not like you want to, but her greedy pussy’s been sucking on your fingers so eagerly that you may not have a choice in the matter. In fact it’s starting to get a bit difficult for you to pull away.");
		output("\n\n<i>\"Stick your hand in the honeypot, and it may get stuck,\"</i> she says, managing to giggle despite your reaming her cunt. <i>\"It's such a nice hand, I may just keep it, if it wants to be so friendly...\"</i> As if for emphasis, she gives you one of those really tight, finger-grinding squeezes with her pussy, honey oozing thick and wet across your knuckles as she sucks them back inside herself.");
		output("\n\nWhat a depraved honey-bunny you’ve got yourself into. Well, you’re too far down this rabbit-hole to go looking for another, and you really want some honey. So, take this! You shove yet another finger inside, now actively working on fully stretching her out.");
		output("\n\nThe laquine's head falls back, tongue lolling out as an incoherent moan of pleasure rockets up from inside of her. Her slick, oozing love-canal opens to receive you, the tight flesh inside hungrily stretching over your fingers and clamping down with wince-inducing force. <i>\"I - gah! - I'm not t-that delicate!\"</i> she brays defiantly, almost whinnying in delight as your fingers twist and wriggle inside of her, stroking everywhere in a way that no ordinary cock could match'.");
		output("\n\nYou can’t believe this is the girl that said she’d kick you in the face if you fisted her. As worked up as she is, you don’t really need that much effort to feed her your fist. In fact, you push your hand inside her, as if proving a point. Surely enough, your hand sinks inside her, far more than it would under normal circumstances.");
		if(pc.hasCock() && pc.biggestCockVolume() >= 500) output(" You laugh, with a pussy like that she might even be able to take you in all your glory. You’re going to have to take her for a spin sometime.");
		else output(" Just how big would be too big for this slut? With a pussy like that she could probably take just about any cock.");
		output("\n\nKelly says nothing, simply moaning and whimpering, clenching down on your hand and wrist with incredible force - it's almost painful, the intensity with which she's gripping you now. But it looks like you've pushed her to her very limits now; arching her whole body as if electrocuted, she screams in ecstasy as she erupts like a veritable fountain, soaking your arm to the elbow in quite-literal female honey, twin shafts vomiting geysers of mutated semen across her upper torso. She holds a rather impressive note as she spasms and writhes in her climax, squeezing your hand so hard you can feel the bones grinding together, but finally, mercifully, she collapses in a panting heap on the table, going limp everywhere - especially where it counts most.");
		output("\n\nYou remove your hand from her hungry pussy, leisurely licking your fingers clean. Hmm, tasty. Now if that isn’t a proper honey-pot. Just begging to be eaten. You lean close and extend your tongue, licking down her moistness with abandon. True, you don’t catch as much as you would have if you had eaten her out from the start. But what’s there is still plentiful enough that you can satisfy yourself.");
		output("\n\nKelly sighs heavily, moaning appreciatively as your tongue caresses her loosened labia. Other than that, though, she lets you drink your fill.");
		output("\n\nLicking your lips as you drink the last of her honey, you can’t resist commenting that Kelly should quit her job at Xenogen and become a performer instead. Her hand disappearing trick is truly unique.");
		output("\n\n<i>\"Nah, takes too long to pull off; nobody would watch it,\"</i> she quips. <i>\"I need at least a little time to loosen up first before I can take that much, I'm not completely made of elastic,\"</i> she giggles. She then sighs hugely. <i>\"Damn, but it's good when I pull it off, though... really feel sated after that. Course, I'll be sore for hours, but damn, totally worth it,\"</i> she declares.");
		output("\n\nYes, now if she’d be a good girl and help you clean up?");

		if(!pc.isNude()) output(" She’s soiled your [pc.gear] with her excess honey.");
		else output(" Your entire arm is soaked with her excess honey.");
		//If Clothed:
		if(!pc.isNude())
		{
			output("\n\n<i>\"Well, honestly, that's kind of your fault.\"</i> Kelly notes casually. <i>\"I mean, seriously, you came home with me and you didn't think to get naked when you knew sex was on the table?\"</i> she shakes her head. <i>\"Honestly, I have two pairs of balls and they're both big as cantaloupes; you should have expected it to be messy. Hell, I can fill a bathtub with these babies... okay, I was stinking drunk and I hadn't had sex for a week and it was a college dare, but it still counts,\"</i> she comments to herself. She shakes her head suddenly, sending honey flying with each motion. <i>\"Right, sorry, clean up... I can do that. Ah... mind giving me a hand up? I don't think I can move my legs just yet,\"</i> she sheepishly explains.");
			output("\n\nRolling your eyes, you extend a hand to help her.");
			output("\n\nShe clasps your hand with her own and painstakingly hauls herself upright, using you for leverage as she drops to the floor, a little bowlegged at first, but slowly steadying herself on her feet. <i>\"Alright; if you give me your things, you can wait on the couch while I put them through the washing machine,\"</i> she offers.");
			output("\n\nYou undress and hand her your [pc.gear]. But you’re not going to lazy about on the couch as she suggested. Someone has to keep an eye on her; make sure she’s doing a proper job washing your stuff. And if she isn’t, someone has to punish her for that. You punctuate your sentence by grabbing her butt and dipping a finger back into her honeypot.");
			output("\n\nKelly groans deep and soft, her quivering quim immediately folding itself tightly back around your probing finger. <i>\"Promises, promises, sweet thing,\"</i> she declares with a smile, giving her ass a shake under your hands. And with that she sets off walking, trusting you to follow - which you do, holding her ass all the while as she leads you to the laundry.");
			output("\n\n<b>Later....</b>");
			output("\n\n<i>\"And there we are... huh, gotta say, I'm more used to helping people take their clothes off,\"</i> Kelly remarks, even as the last of your gear is put in its proper place.");
			output("\n\nOnce you’ve double-checked to make sure nothing is missing, you pull Kelly in for a kiss. Then make your way out of her home.");
			output("\n\n<i>\"Come back when I'm not so sore - I promise you'll enjoy it,\"</i> Kelly calls after you with a smirk. <i>\"Of course, it might be you who walks away sore the next time,\"</i> she giggles, before closing the door behind you.");
			clearMenu();
			addButton(0,"Next",move,"SOUTH ESBETH 2");
			return;
		}
		else
		{
			output("\n\n<i>\"Clean you up?\"</i> she repeats, blinking at you. Her eyes drift towards your honey-drenched arm and a smirk crosses her lips. <i>\"Sure, I can clean you up,\"</i> she agrees. When she tries to push herself off of the table, though, she can't seem to make it off. <i>\"...don't suppose you'd mind giving me your hand? My legs aren't working,\"</i> she suggests. She sounds more proud of that fact than dismayed, though.");
			output("\n\nYou reach out a hand for her and help her sit up. Some of the mess she’s made all over herself beginning its descent in honeyed rivulets. What a messy girl....");
			output("\n\n<i>\"You know you love it,\"</i> she quips back. She still has hold of your hand, and she smirks to see it's the one covered in her feminine fluids. Gently yet insistently she draws it towards her mouth, eyes clothing and lips opening as her tongue slithers out. She takes a long, languid lick up the length of your arm, her warm wet tongue scraping over your [pc.skin] as she laps up a good mouthful of her femcum. Once her tongue is good and soaked in it, she draws it back inside, noisily smacking her lips as she swallows. <i>\"Delicious,\"</i> she trills, eyes opening enough to give you a mischievous look.");
			output("\n\nHeh, it’s not everyday you meet someone so eager to clean up the mess they made and enjoy it. She missed a spot, you tell her whilst presenting a finger.");
			output("\n\n<i>\"Cleaning's the best part,\"</i> she giggles. <i>\"As for missing a spot,\"</i> she croons in a coy tone. <i>\"I only just got started, silly " + pc.mf("boy","girl") + "... but let me have that...\"</i> she delicately takes your offered hand and closes her mouth tenderly around the proffered digit, sucking greedily at it with wet slurping sounds, her tongue wrapping itself around it and milking it dry of every last trace of her juices. She sucks away for a few moments, then noisily pops it free of her mouth, a thin strand of saliva momentarily linking it to her mouth. <i>\"All clean,\"</i> she announces. <i>\"Now, for the rest of you...\"</i> and back she bends to her task. She lavishes the same attention on each finger in turn, then turns your hand over and starts lapping at your palm, tongue slurping wetly over your flesh and insinuating itself around the base of each finger.");
			output("\n\nYou patiently for her to lick your whole hand, petting her and telling her to clean up all her mess like a good girl.");
			output("\n\nShe rolls her eyes at that, lips curling in a smirk, but she certainly doesn't lose any enthusiasm. Once your hand is glistening clean, she starts to lap and lick her way down your arm, the unnaturally long tongue curling completely around your wrist to ensure she cleans it all off. With wet, noisy slurps she licks your forearm clean, then tugs you forward so that she can keep licking your upper arm too, until finally she has followed your arm to your torso and is toying with your closest [pc.nipple].");
			output("\n\nYou place a hand behind her head and pull her towards your [pc.breasts]");
			if(pc.biggestTitSize() >= 20) output(", nearly smothering her with your breast-flesh");
			output(". If she’s going to tease your nipples, the least she could do is do it properly, you note.");

			output("\n\nKelly wastes no time in getting to work, abandoning her licking to instead suckle at your bosom, her tongue ");
			if(!pc.hasFuckableNipples())
			{
				output("coiling around and stroking your ");
				if(pc.hasDickNipples()) output("[pc.dickNipple]");
				else output("[pc.nipple]");
			}
			else
			{
				output("worming inside of your [pc.nipple]");
			}
			output(" to heighten the experience.");
			if(pc.isLactating()) 
			{
				output(" Your [pc.milk] begins to flow into her mouth and she lets out an initial muffled squeak of surprise, then hums contentedly and starts suckling all the harder, blithely nursing at you and drinking every drop of [pc.milk] you are willing to shed into her mouth.");
			}
			//if nipple-cunts or nipple-dicks or lactation:
			if(pc.hasDickNipples() || pc.hasFuckableNipples() || pc.isLactating())
			{
				output("\n\nWhat a greedy bunny, trying to drain you of all your ");
				if(pc.hasDickNipples()) output("[pc.cum]");
				else output("[pc.milk]");
				output(". At least she seems to be doing a good job now. Pleasure radiates from your bosom as she suckles, licks and nibbles. You can’t help but compare her to a child nursing from " + pc.mf("papa","mama") + " Steele.");
				output("\n\nKelly's eyes are screwed closed, so if she's rolling them, you can't tell. She seems to like the comment, though, as she doesn't stop sucking, instead noisily continuing to slurp and nuzzle at your teat.");
			}
			output("\n\nWith a chuckle, you remind her not to forget your other breast");
			if(pc.totalBreasts() > 2) output("s");
			output(". If she keeps her attention focused only on one, she’s going to wind up deforming your [pc.chest], and then you’ll have to punish her.");

			output("\n\nWetly, she pops her mouth free and smacks her lips. <i>\"Well, we wouldn't want that, would we?\"</i> she giggles, shaking her head at the mere thought of you with a lopsided [pc.chest]. Holding onto you for support, she closes her eyes again and attacks your ");
			if(pc.totalNipples() == 2) output("other");
			else output("second");
			output(" nipple with equal fervor, making no attempt to hide the gluttonous slurping and slavering noises her mouth and stroking tongue produce.");
			output("\n\nGrinning, you ");
			if(!pc.isTaur()) output("pull up a chair and ");
			output("sit down so you can relax while she lavishes you in attention. A nice tongue-bath is the perfect way to end this little session of yours. So relaxed you are that you even find yourself drifting. Maybe a short nap wouldn’t be so bad....");
			//Always go to HARD nap.
			clearMenu();
			addButton(0,"Next",kellyCunnilingusHardEndingNap);
		}
	}
	pc.shower();
	tempNudeOff();
}

//[=Nap=]
public function takeANapAfterNiceCunnilingus():void
{
	clearOutput();
	userInterface.showBust("KELLY_NUDE");
	showKellyName();
	author("Quiet Browser & LD");
	output("You don’t feel like masturbating now, so perhaps a quick nap would help.");
	//Attraction >= 50:
	if(kellyAttraction() >= 50)
	{
		output("\n\nYour soft breathing is interrupted by a pair of soft lips pressing against your own. Though you don’t open your eyes you do inhale sharply through your nose when you feel a familiar tongue worming its way inside.");
		output("\n\nKelly hums softly into your mouth, her tongue shamelessly feeding itself into your own and coiling possessively around your own [pc.tongue]. Her hands gently take your [pc.face] so that you can't move it away, her breasts laying flush against your own [pc.chest]. She kisses you deeply, tongue wriggling in your mouth as it stakes its claim, but then she breaks the kiss, wetly slurping her tongue back into her own mouth and lifting herself off of you a tad. <i>\"Sorry, sweet thing, but I just couldn't resist,\"</i> she giggles. <i>\"You looked so cute sleeping there like that.... guess you're feeling tired, huh?\"</i> She pushes up off of you and stretches.");
		output("\n\nYou nod in agreement. Chuckling as you inform her that she has a way of wearing you out.");
		output("\n\n<i>\"Don't tell me you don't love it,\"</i> she smirks, poking playfully at your nose. <i>\"But, if you're so tired... I'd be happy to loan you my bed for the night, if you don't mind sharing, but I suppose a big, bold spaceship captain would rather sleep on " + pc.mf("his","her") + " ship, huh?\"</i> she comments, winking at you.");
		output("\n\nNo offense, but if you took her up on her offer you’d likely get no sleep at all and wind up even more worn out. Plus you’re pretty sure you might be responsible for her missing work tomorrow.");
		output("\n\n<i>\"No you wouldn't,\"</i> she huffs, adopting a wounded-looking pout. She manages to hold it for roughly all of three, maybe four seconds before she bursts into giggles at your look. <i>\"Okay, you're probably right, I would. I think it'd be worth it, though. But, if you really have to go,\"</i> she sighs at the mere thought, a momentary flicker of melodrama, <i>\"I won't try and keep you here.\"</i>");
		output("\n\nChuckling you pat her on the arm. Hey, it’s not like she has anything to worry about. You’ll be back for more later.");
		output("\n\n<i>\"Of course you will,\"</i> she states matter of factly, smiling even as she offers you an arm to help you get out of the couch.");
		output("\n\nA few moments later and you’re fully geared up and ready to go.");
		output("\n\nThe laquine smiles and steps forward to embrace you, kissing you with surprising daintiness on the lips. <i>\"Come back anytime, my little sugar-flower. You know I'm always happy to see you,\"</i> she tells you, releasing you so that you can head back to the ship.");
	}
	else
	{
		output("\n\n<i>\"[pc.name]? Come on, honey; I know it's a nice couch, but you don't wanna spend the night here, do you? Come on, time to wake up,\"</i> Kelly gently calls to you, even as she carefully shakes you by the shoulder.");
		output("\n\nYou open your eyes and look at her, mildly annoyed at being shaken awake. And you were just starting to feel comfy too....");
		output("\n\nKelly just smiles brightly at you. <i>\"That's better; I know you were starting to doze off, but I thought you'd much rather go back to your ship and get some rest there than camp out here on my couch. It's not the best bed on the planet. Believe me, I'd know,\"</i> she chuckles.");
		output("\n\nYou nod, yawning as you do so. Alright, maybe she has a point.");
		output("\n\nKelly gives an understanding nod and offers you a hand to get out of the couch. In a few moments, you have all your things ready and are about to leave. The laquine smiles and steals a quick kiss on your cheek, before clapping you on the shoulder. <i>\"Don't be a stranger, honey. I like having you around,\"</i> she informs you, waving to you as you leave.");
	}
	processTime(46);
	clearMenu();
	addButton(0,"Next",move,"SOUTH ESBETH 2");
}

//[=Masturbate=]
public function masturbateAfterKellyLingus():void
{
	clearOutput();
	userInterface.showBust("KELLY_NUDE");
	showKellyName();
	author("Quiet Browser & LD");
	if(pc.hasCock()) output("Wrapping a hand around your [pc.cockBiggest], you begin to gently stroke yourself. Kelly’s naked body serving as a nice mental picture to aid you in the task");
	if(pc.hasVagina() && pc.hasCock()) output(" while your other hand");
	else if(pc.hasVagina()) output("Your hand");
	if(pc.hasVagina()) output(" strokes the folds of [pc.oneVagina]. Images of the honey-bunny’s twin shafts bringing a smile to your face");
	output(".");

	output("\n\nYou feel a bit guilty about masturbating so shamelessly in someone’s living room. But it feels too good to stop now. Plus you don’t think Kelly would mind that, you tell yourself as you close your eyes for a spell.");

	output("\n\n<i>\"Aw... you poor thing; why didn't you tell me you were all pent up?\"</i> Kelly's voice drifts to you, her tone a sweet sing-song, underlaid with a trace of amusement.");

	output("\n\nYou open your eyes to gaze at her smirking face. Bent over the back of the couch as she is, you can’t help but also feel the familiar swells of her breasts pressing against your ");
	if(pc.horns > 0) output("[pc.horns]");
	else if(pc.tallness < 60) output("head");
	else output("neck");
	output(".");

	output("\n\nShe reaches down and trails her fingers gently over your own, still smirking at you. <i>\"I can do much better things for you than your hands... why not let me give you a proper thanks for what you did before?\"</i> she suggests, tongue sliding out over her lips to trail quickly over your cheek before darting back into her mouth.");

	output("\n\nWell, since she’s offering and you do feel a bit horny. Why not?");

	output("\n\nWith a giggle of delight she literally vaults over the couch, landing with surprising grace on the floor at your [pc.feet]. From there, she moves to a kneeling position in front of you, which makes you adjust your position to give her a better view of things.");

	processTime(7);
	//PC=herm:
	if(pc.hasCock() && pc.hasVagina())
	{
		output("\n\nShe pauses for a moment, looking contemplatively at your binary genitalia sets. <i>\"Honey, which would you prefer me to please?\"</i>");
	}
	clearMenu();
	if(pc.hasCock()) addButton(0,"Cock",getBlownByKelly);
	else addDisabledButton(0,"Cock","Cock","You need a cock for Kelly to suck it.");
	if(pc.hasVagina()) addButton(1,"Pussy",getLickedOutByKellllaaaahhhh);
	else addDisabledButton(1,"Pussy","Pussy","You need a pussy in order for Kelly to lick it.");
}

//MISCHIEVOUS RESULTS:
//CLOTHED
//[=Nap=]
public function mischievousNapAfterCunnilingateKelly():void
{
	clearOutput();
	userInterface.showBust("KELLY_NUDE");
	showKellyName();
	author("Quiet Browser & LD");
	output("Maybe a short nap would be fine....");
	output("\n\n<i>\"[pc.name]? [pc.name]? Come on, honey, it's time to wake up - you don't really wanna spend the night on my couch, do you?\"</i> a familiar giggle follows those words, chasing you back to the land of the living. As your eyes open, you see Kelly is standing over you, gently shaking you by the shoulder. She smiles at you and offers you your freshly-cleaned gear. <i>\"Here you are; didn't mean to keep you waiting so long. But, if you're that tired, maybe you ought to head back to your ship?\"</i> she suggests.");
	if(kellyAttraction() >= 50) output(" She then pauses and looks thoughtful, before giving you a wicked smile. <i>\"Unless you'd rather camp here for the night?\"</i> she adds.");

	output("\n\nYou take your [pc.gear] and put it on, shooting Kelly a quick thanks.");

	output("\n\n<i>\"It's no worries,\"</i> she assures you. <i>\"Come back any time, honey,\"</i> she tells you before you leave.");
	processTime(46);
	clearMenu();
	addButton(0,"Next",move,"SOUTH ESBETH 2");
}

//[=Masturbate=]
public function mischievousMasturbateAfterCunnilingateKelly():void {
	clearOutput();
	userInterface.showBust("KELLY_NUDE");
	showKellyName();
	author("Quiet Browser & LD");
	//if cock:
	if(pc.hasCock()) output("Wrapping a hand around your [pc.cockBiggest] you begin to gently stroke yourself. The still lingering scent of Kelly’s climax fueling your desire");
	if(pc.hasCock() && pc.hasVagina()) output(" while your other hand");
	else if(pc.hasVagina()) output("Your hand");
	if(pc.hasVagina()) output(" strokes the folds of [pc.oneVagina]. Images of the honey-bunny’s seed fountaining through the air bringing a smile to your face.");

	output("\n\nClosing your eyes, you continue masturbating yourself.");

	output("\n\n<i>\"What's this? Aw, did I put on that good of a show for you, honey? Feeling a little pent up yourself?\"</i> Kelly grins at your reaction, having slipped into the room whilst you had your eyes closed. <i>\"You know... one good turn does deserve another...\"</i> she trails off suggestively, yellow tongue slithering meaningfully across her lips as she stares at your crotch.");

	output("\n\nIf she feels that way, you’d be happy to accept her <i>thanks</i>.");

	output("\n\n<i>\"Of course you would,\"</i> she purrs, already kneeling down before you.");
	processTime(7);
	//If PC=Herm: 
	if(pc.hasCock() && pc.hasVagina()) 
	{
		output("\n\nShe pauses, looking at your mixed genitalia, then looks at you. <i>\"Got any preferences here, honey?\"</i>");
		//[Cock] [Pussy]
	}
	clearMenu();
	if(pc.hasCock()) addButton(0,"Cock",getBlownByKelly);
	else addDisabledButton(0,"Cock","Cock","You need a cock for Kelly to suck it.");
	if(pc.hasVagina()) addButton(1,"Pussy",getLickedOutByKellllaaaahhhh);
	else addDisabledButton(1,"Pussy","Pussy","You need a pussy in order for Kelly to lick it.");
}
//NUDE
//[=Nap=]
public function nudeNapAfterKellyCunnilingus():void
{
	clearOutput();
	userInterface.showBust("KELLY_NUDE");
	showKellyName();
	author("Quiet Browser & LD");
	output("Maybe a short nap would be fine....");
	output("\n\n<i>\"[pc.name]? [pc.name]? Come on, honey, it's time to wake up - you don't really wanna spend the night on my couch, do you?\"</i> a familiar giggle follows those words, chasing you back to the land of the living. As your eyes open, you see Kelly is standing over you, gently shaking you by the shoulder. She gives you a cheeky grin upon realising you're awake. <i>\"What, is my couch that comfy?\"</i> she asks. <i>\"Personally, I can't recommend it; if you're tired, it might be better to get back to your ship and get some shuteye,\"</i> she recommends.");
	//Attraction =<50: 
	if(kellyAttraction() <= 50) output(" She then gives you a coy look. <i>\"Of course, there's plenty of room for another in my bed...\"</i> she trails off meaningfully.");

	output("\n\nYou get up, stretching yourself. Just taking a short rest. Pleasuring horny bunnies can really wear people out.");

	output("\n\n<i>\"But it's certainly a fun way to get tired,\"</i> she quips back.");

	output("\n\nYou put on your [pc.gear] and give her a goodbye kiss.");

	output("\n\nShe lets out a wordless noise of approval and kisses you back, stealing a quick hug from you before you separate yourselves. <i>\"Don't be a stranger, honey,\"</i> she tells you before you leave.");
	processTime(46);
	clearMenu();
	addButton(0,"Next",move,"SOUTH ESBETH 2");
}

//[=Masturbate=]
public function kellyNudeMasturbateAfterCunnilingate():void
{
	clearOutput();
	userInterface.showBust("KELLY_NUDE");
	showKellyName();
	author("Quiet Browser & LD");
	//if cock:
	if(pc.hasCock()) output("Wrapping a hand around your [pc.cockBiggest] you begin to gently stroke yourself. The still lingering scent of Kelly’s climax fueling your desire");
	if(pc.hasCock() && pc.hasVagina()) output(" while your other hand");
	else if(pc.hasVagina()) output("Your hand");
	if(pc.hasVagina()) output(" strokes the folds of [pc.oneVagina]. Images of the honey-bunny’s seed fountaining through the air bringing a smile to your face.");

	output("\n\nClosing your eyes, you continue masturbating yourself. You chuckle when you feel a hand that doesn’t belong to you make contact with your ");
	if(pc.hasCock()) output("[pc.cockBiggest]");
	else output("[pc.vagina]");
	output(". Is it that difficult for her to keep her hands off you?");

	output("\n\n<i>\"Aw, I just didn't want to get left out of the fun,\"</i> she giggles, her fingers continuing to stroke you gently. <i>\"How'd you like me to give you a proper thanks for what you did for me?\"</i> she purrs into your [pc.ear].");

	output("\n\nCome to think of it, you do believe she’s missed a spot when she was giving you a tongue-bath earlier. Maybe you’ll accept her offer.");

	output("\n\n<i>\"It'll be my pleasure,\"</i> she croons.");
	processTime(7);
	//If PC=Herm:
	if(pc.hasCock() && pc.hasVagina()) 
	{
		output(" She then stops and looks thoughtful for a second. <i>\"Any preferences here? I'm good either way,\"</i> she asks.");
		//[Cock] [Pussy]
	}
	clearMenu();
	if(pc.hasCock()) addButton(0,"Cock",getBlownByKelly);
	else addDisabledButton(0,"Cock","Cock","You need a cock for Kelly to suck it.");
	if(pc.hasVagina()) addButton(1,"Pussy",getLickedOutByKellllaaaahhhh);
	else addDisabledButton(1,"Pussy","Pussy","You need a pussy in order for Kelly to lick it.");
}

//HARD RESULTS
public function kellyCunnilingusHardEndingNap():void
{
	clearOutput();
	userInterface.showBust("KELLY_NUDE");
	showKellyName();
	author("Quiet Browser & LD");
	output("\n\n<i>\"[pc.name]? Come on, honey; time to wake up,\"</i> Kelly's voice cuts through your slumber, as does the gentle rocking motions of her shaking you. You wake to find yourself on the couch, wrapped in Kelly's arms for support.");

	output("\n\nYawning, you ask if she’s done servicing you yet.");

	output("\n\n<i>\"I was done about ten, twenty minutes ago,\"</i> she snarks, a grin on her lips.");

	output("\n\nThat’s a good girl. You pat her on the head.");

	output("\n\nShe smiles and closes her eyes, leaning in to the petting. <i>\"I really did enjoy that... too bad I'm gonna be sore for hours afterwards,\"</i> she sighs. <i>\"Seriously, I don't think I could even get it up again, I'm that tender down there... totally worth it, though.\"</i>");

	output("\n\nWell, in that case you’ll just have to come back and get her sore again some other time.");

	output("\n\n<i>\"Promises, promises,\"</i> she retorts with a cheeky roll of the eyes and a mischievous grin. Since you're now awake, she wriggles jauntily away from you and stretches her limbs. Her joints audibly popping, she walks away from you, a little more hesitantly than normal, and returns with your gear, which she offers to you. <i>\"Like some help?\"</i> she suggests, a twinkle in her eye at the prospect.");

	output("\n\nHaving no reason to refuse, you tell her get started.");

	output("\n\n<i>\"Well, if you insist,\"</i> she replies, already advancing on you with gear in hand. Painstakingly she fits each piece into its proper place on your body, until finally you are as dressed as you were when you entered. <i>\"There we are, good as new... gotta say, I'm better at undressing people than I am at dressing people,\"</i> Kelly muses.");

	output("\n\nDouble checking to make sure you’re not forgetting anything, you pull Kelly into a goodbye kiss. Then make your way out of her home.");

	output("\n\n<i>\"See you later sweet thing... maybe next time, you're the one who'll be going home sore?\"</i> Kelly calls after you, a wicked smirk on her lips at the thought.");
	processTime(45+rand(4));
	clearMenu();
	addButton(0,"Next",move,"SOUTH ESBETH 2");
}


//Kelly DP For Taurs
//By DiscordDavid (NOT FEN!)
public function kellyDPForTaursThatWannaGetDPed():void
{
	clearOutput();
	userInterface.showBust("KELLY_NUDE");
	showKellyName();
	author("DiscordDavid");
	output("You tell Kelly that you’d love it if she could please your entire back half at once.");
	output("\n\n<i>“<i>Well, I think I can arrange that for you, honey.</i>”</i> She says, biting her lower lip and eying your tauric body.");
	//If first time with Kelly as taur: 
	if(flags["KELLY_HAD_SPECIAL_TAUR_DP"] == undefined) output("<i>“<i>Though I must say, I’ve never gotten to double-penetrate such a special person before.</i>”</i> You grin and tell her that you’ll introduce her to a whole new world.");
	output("\n\nYou lean your torso forward and lick her tips, your ");

	var x:int = rand(pc.totalVaginas());
	var y:int = -1;
	if(pc.totalVaginas() > 1)
	{
		//Jump on the next cunt in line
		y = x+1;
		//If x was the last cunt, do the previous one in line.
		if(y >= pc.totalVaginas()) y = x-1;
	}
	//if single Vagina: 
	output("[pc.vaginas] aching with the desire of these proper cocks");
	if(flags["ENCOUNTERED_ZIL"] != undefined) output(", nothing like those zil. The biggest of their ‘men’ are barely eight inches! ");
	else output(", so deliciously thick and veiny! ");
	output("You pop her top cock with your mouth, enjoying the hollow echo, and turn around, careful not to knock anything over.");
	if(y >= 0)
	{
		output(" <i>“<i>Do you think that these both lead to your sweet little ovens? Well, double the chance that we make even more little taur-laprinas, right?</i>”</i> Kelly marvels at your twins for a moment, idly playing with her horse cocks, before regaining her composure.");
	}
	output("\n\nShe lets out her tongue and begins to lick your mons, allowing the tip of her amazing appendage suckle your [pc.clits].");
	if(pc.hasCock()) output(" She lets it drift around to your [pc.cocks] too, and you can feel the blood rush down from your massive taur heart, preparing to breed.");
	output(" She draws her tongue back in. ");
	if(pc.girlCumType == GLOBAL.FLUID_TYPE_HONEY || (pc.hasCock() && pc.cumType == GLOBAL.FLUID_TYPE_HONEY)) output("<i>“You are the sweetest thing I’ve ever tasted, honey-buns. Are you more like me than you let on?</i>”</i> You turn your humanoid torso, giving her a smile and a sultry ‘maybe’.\n\n");
	output("She climbs up onto her bed, while you angle yourself to match her cute little height. You can almost feel the floor getting wet under you, your [pc.vaginas] dripping, ready to take your bipedal stallion’s meat. She pushes her cocks in, stretching you in the most satisfying way. She begins to thrust inside you, your ");
	if(y < 0) output("[pc.vagina " + x + "] and [pc.asshole]");
	else output("[pc.vaginas]");
	output(" quivering in primal delight. Kelly leans forward and grabs onto your back, holding on as she tries to go deeper than her cocks allow. She clearly likes this new form she’s discovered, and might want to experiment with it later.");

	var tailginad:Boolean = false;
	if(pc.hasTailCunt()) 
	{
		output("\n\nKelly grabs ahold of your tail, ready to use it as an anchor, when she sees the slightest dribble of your [pc.girlCumColor] juice drip down from it onto your haunches. <i>“<i>Well, Someone likes this cute parasite, doesn’t [pc.heShe]? Or do you think of it more like a symbiote? Either way, I’m going to make all of your holes feel good.</i>”</i> She starts licking at it, and you can feel the nerves in your tail shooting pleasure into your brain. You have a strange conflict in your mind between wanting a dick in your rear, or in your tail.");
		
		if(pc.willpower()/2 + rand(20) + 1 > 15) output(" You manage to resist the [pc.tailGina]’s urges though, and let Kelly continue to pleasure it the way you want her to. It may have thought it was the predator, but now, it was the prey of your powerful mind.");
		else
		{
			tailginad = true;
			output(" You give in to the snake’s wants and ");
			if(pc.hasCock()) output("quickly pull it out of Kelly’s grasp down to your own [pc.cockNounComplex], where it begins to sate itself on you, coiling around your dick in a way that seems both wrong and so very right. Its slippery textures almost seem made to pleasure you.");
			else 
			{
				output(" You pull forwards and practically beg Kelly to fill up your tail with one of her cocks. You tell her, in so many ways, you need her to fill your tail with her seed. Kelly smiles knowingly.");
				output("\n\n<i>“<i>Honey, if you can’t control that thing, maybe you should head to the nurseroid. But don’t worry about that for now, I’ll make sure that your tail gets nice and full.</i>”</i> She takes the tail and spears it on her cock before returning to her ministrations, using the tail instead of ");
				if(y >= 0) output("your [pc.vagina " + y + "].");
				else output("your [pc.asshole]");
				output(".");
			}
		}
	}
	pc.cuntChange(x,chars["KELLY"].cockVolume(0),true,true,false);
	if(y < 0 && !(tailginad || pc.hasCock())) pc.buttChange(chars["KELLY"].cockVolume(0),true,true,false);
	else if(!(tailginad || pc.hasCock())) pc.cuntChange(y,chars["KELLY"].cockVolume(0),true,true,false);

	output("\n\nKelly continues her thrusts, which are becoming more erratic and animalistic. She’s going to cum soon; you can feel it.");
	
	//[Cum Inside] 
	//[Cum Outside]
	//Pass x variable. Add 100 if tailcunted!
	processTime(10);
	pc.lust(100);

	clearMenu();
	if(tailginad) x += 100;
	addButton(0,"CumInside",taurKellyDPCumInside,x,"Cum Inside","Have her nut inside you.");
	addButton(1,"CumOutside",getCummedOnByKellyDuringTaurDPs,x,"Cum Outside","Have her pull out and blow her load all over your tauric hindquarters.");
}

//Cum inside
public function taurKellyDPCumInside(x:int):void
{
	clearOutput();
	userInterface.showBust("KELLY_NUDE");
	showKellyName();
	author("DiscordDavid");

	var tailginad:Boolean = false;
	//If x is over 100, it means it's a tailgina scene.
	if(x >= 100)
	{
		tailginad = true;
		x -= 100;
	}
	var y:int = -1;
	if(pc.totalVaginas() > 1)
	{
		//Jump on the next cunt in line
		y = x+1;
		//If x was the last cunt, do the previous one in line.
		if(y >= pc.totalVaginas()) y = x-1;
	}

	output("You want all of double-dicked fuckbunny’s seed inside you, filling you impregnating you with her sheer volume of spunk.");
	if(pc.isPregnant(x) || (pc.isPregnant(y) && (!tailginad || pc.hasCock()))) output(" It’s a shame you’re already pregnant, unable to feel the visceral rush of having your womb filled with her warm, sweet jizz.");
	output(" You push back against her until she’s fallen on her back, her legs hanging open in the perfect position for you to take charge. You begin to gyrate and bob yourself on her, desperate to milk her of her delicious honey-cum. She finally begins to fill you, spilling inside and coating your walls in a sticky yellow.");
	output("\n\n");
	if(pc.isPregnant(x) || (pc.isPregnant(y) && (!tailginad || pc.hasCock()))) output("You can feel her hot spooge pouring out of you to puddle below, unable to penetrate your sealed cervix. Knowing that she’s cumming so hard, wasting all that virile seed on you, makes it all the more exciting. ");
	output("You can almost feel your belly swelling up underneath you. She may make others swell like balloons, but not you. ");
	if(tailginad) output("Your tail begins to swell, too much honey filling it. It quickly surrenders, and simply lets her cum drip out, like a perverted waterfall onto the bed. ");
	//if tailingulus: 
	if(pc.hasCuntTail() && !tailginad) output("You can feel your tail scrunch and almost flail in Kelly’s grip as she eats it, pressing down on its mons and pressing into your [pc.tailGina] insides. ");
	output("Rope after thick, impregnating rope of her jism fills you, making you cum in an almost motherly bliss.");
	if(pc.isPregnant(x) || (pc.isPregnant(y) && (!tailginad || pc.hasCock()))) output(" Maybe you'll let her knock you up one day.");
	else output(" You want her to make you pregnant, you don’t care about anything else right now. Pure instinct has you need to make life.");
	output(" You can feel her shots weakening, until they finally stop and she pulls out of you, panting.");

	output("\n\n<i>“<i>Warn me next time sweetie. That’s not to say I didn’t like it though.</i>”</i> She gets up, and you can feel her hand roll up your haunches.");

	//If Kelly’s first time with you as a taur:
	if(flags["KELLY_HAD_SPECIAL_TAUR_DP"] == undefined) output(" <i>“<i>I think I like this, maybe I should give you a call instead of waiting for you to come to me.</i>”</i>");
	output(" You stand up, shaking from the fucking, and give Kelly a light kiss before asking to use her shower.");

	processTime(11);
	pc.orgasm();
	pc.loadInCunt(chars["KELLY"],x);
	if(y >= 0 && (!tailginad || pc.hasCock())) pc.loadInCunt(chars["KELLY"],y);
	//FEED DA TAIL!
	if(tailginad) 
	{
		feedCuntSnake();
	}
	flags["KELLY_HAD_SPECIAL_TAUR_DP"] = 1;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Cum on your tauric torso
public function getCummedOnByKellyDuringTaurDPs(x:int):void
{
	var tailginad:Boolean = false;
	//If x is over 100, it means it's a tailgina scene.
	if(x >= 100)
	{
		tailginad = true;
		x -= 100;
	}
	var y:int = -1;
	if(pc.totalVaginas() > 1)
	{
		//Jump on the next cunt in line
		y = x+1;
		//If x was the last cunt, do the previous one in line.
		if(y >= pc.totalVaginas()) y = x-1;
	}

	clearOutput();
	userInterface.showBust("KELLY_NUDE");
	showKellyName();
	author("DiscordDavid");
	output("You take a step forward, wanting to feel her thick honey cover your rear. She obliges, pulling her cocks out.");

	//If fucking tail:
	if(tailginad && !pc.hasCock())
	{
		output(" Though as hard as she tries, your tail refuses to let go. You could swear it has a mind of it’s own, and of course, it does. You both give up quickly, and let the tail continue as Kelly strokes her other cock to cover you.");
	}
	output(" She let loose, her cum flying in long arcs across your back. The feeling of the cum on you ");
	if(tailginad && !pc.hasCock()) output("as well as your tail being filled up, ");
	output("pushes you over the edge, and you start cumming, releasing your [pc.girlCumColor] cum all over the floor.");
	if(pc.hasCock() && tailginad) output(" You can feel your [pc.cock] firing off cum, filling up your tail with your [pc.cumColor] jizz. It’s almost a sensory overload.");
	else if(pc.hasCuntTail() && !tailginad) output(" Your tail squirts onto Kelly’s face, and she smiles as much as she can while pleasuring the creature. She seems to like your pet. That seems like a nice thing to call it, a pet, and you’re its master.");
	if(pc.hasCock() && !tailginad) 
	{
		output(" You begin to cum from your own [pc.cocks], shooting [pc.cumColor] jism on her floor. It feels so weird, cumming from your cock");
		if(pc.cockTotal() > 1) output("s");
		output(" without touching ");
		if(pc.cockTotal() == 1) output("it");
		else output("them");
		output(". You don’t think you'll ever get used to it, not that you dislike it either.");
	}
	output(" As she finishes her orgasm, she falls back onto her bed, panting with a wonderful afterglow.");
	output("\n\n<i>“<i>That, was great [pc.name], you can really handle that body of yours well.</i>”</i> You agree, and ask if you can borrow her shower. After you finish cleaning up, you prepare to leave, and she smiles. <i>“<i>Don’t be a stranger - honey baths are free!</i>”</i>");
	processTime(11);
	flags["KELLY_HAD_SPECIAL_TAUR_DP"] = 1;
	//FEED DA TAIL!
	if(tailginad) 
	{
		feedCuntSnake();
	}
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
/*
output("\n\nCum on your terran torso");
output("\n\nShe pulls out of you {if you have a pussy-tail, and are not herm: ; much to your tail’s dismay}, and begins jacking off her twin spears. Kelly moans, and thrusts into your hands a few times before she starts cumming. Thick ropes of hot cum bathe your body, covering your [pc.breastCupSize] breasts, and midriff. You love the feeling. You’re responsible for her overwhelming pleasure, and you wouldn’t have it any other way. You continue to jerk her off, reveling in every twitch and throb that goes through her veins as she cums. {if herm and with tail:Your tail grabs your cock, hard, and coils, trying desperately to milk you. {If willpower>10: You let it, you’ve denied it enough, and you can’t help but adore the unique feeling of the [pc.tailCunt]. It’s unlike any other pussy, with the way it’s whole length can bend and twist to hit your sweetspots.} You feel the finish of Kelly’s fountain, and look down. Your [pc.skinFurScales] is now mostly a honey yellow from the sheer volume of her cock’s load, all over your body. You start to lick at it, using your fingers to bring her sweetness to your lips. Kelly soon joins you, and you’re sharing her honey between each other, occasionally letting an over-ambitious mouthful to be split between your mouth in a deep kiss. Soon you’re completely licked clean. {Without sufficient exhibition level: You almost consider not cleaning off before you ask to use her shower, as sexy as leaving with her smell on you seems.  You leave, ready to continue, at least until those tiny-pricked zil turn you on enough to come back for a pair of proper dicks.} {With sufficient exhibition level: You briefly consider asking to use the shower, but decide not to. You’re clean enough as is, and no one will question the smell of honey on you with those tiny-pricked zil running around in the jungle. Plus, the idea of being in public with the smell of your lover’s cum on you is just too hot an idea to pass up.}");*/


//Get DPed
//Requires player at least one vagina/
public function getDPedByKelly():void
{
	clearOutput();
	userInterface.showBust("KELLY_NUDE");
	showKellyName();
	author("Quiet Browser & LD");
	output("<i>\"Both at once, huh?\"</i> the laquine purrs as she ogles your naked form. Her long yellow tongue lecherously slides between her lips, eyes half-hooded as she nods to herself. <i>\"Alright, sweet thing, you got yourself a deal. Nothing I like more than putting both of these babies to work,\"</i> she pats her twin erections for emphasis, then pirouettes and starts strutting towards the bedroom, pausing only to turn and give you a crooked finger and a come-hither look.");

	output("\n\nKelly's bedroom is fairly small and cozy, dominated by her bed itself, which is a large and surprisingly ornate circular affair that rather reminds you of a flower, with how its sheeting and pillows are arranged. If Kelly gives a damn about the fetishistic implications of this, however, she sure doesn't show it; she's too busy sweeping you into a kiss, passionately devouring your [pc.lips] even as her twin erections grind hot and hard against your [pc.belly]. She breaks the kiss with a wet smack, eyes already hazy with lust as she stares deep into your own eyes.");

	output("\n\n<i>\"Oh, honey, this is gonna be great,\"</i> she promises, already sweeping you towards the bed and laying you down atop it - not roughly, but insistently. She kneels there at the edge of the bed, running her hands down your [pc.thighs] and gently spreading them to reveal your womanly treasure");
	if(pc.hasCock()) output(" underneath your [pc.cocks]");
	output(".");

	//if Vaginas == 2:
	if(pc.totalVaginas() == 2)
	{
		output("\n\n<i>\"Well, well, lookie what we got here; aren't we just a perfect match?\"</i> the laquine giggles at her own question, leaning in closer to examine your [pc.vaginas]. <i>\"I don't meet someone who can match me two-for-two every day,\"</i> she purrs, licking her lips at the thought.");
		//Kind:
		if(pc.isNice())
		{
			output("\n\nYou thought she’d appreciate that. Now why doesn’t she come and work those beautiful rods of her inside so you two can feel good?");
			output("\n\n<i>\"Mmm... you don't need to ask me twice,\"</i> she purrs in anticipation.");
		}
		//Mischievous:
		else if(pc.isMischievous())
		{
			output("\n\nShe’s always had the upper-hand when it comes to cock ratio. So let’s see how she handles herself when you take her advantage away. She might have the equipment, but does she have the skill?");
			output("\n\n<i>\"Honey, I have all the skill you'll need and then some,\"</i> she brags flippantly.");
		}
		//Hard:
		else
		{
			output("\n\n<i>\"Take a picture, it’ll last longer,\"</i> you tell her. You’re here to fuck, not get ogled at. So she’d better that lazy-bunny ass of hers into gear and start making you feel good, before you have to go up there and use her like your personal dildo.");
			output("\n\n<i>\"Hmm... that sounds like it could be fun, too,\"</i> she notes, pursing her lips thoughtfully. Then she shakes her head and leers at you. <i>\"But I think I wanna be in charge this time.\"</i>");
		}
	}
	//else if Vaginas > 2:
	else if(pc.totalVaginas() > 2)
	{
		output("\n\nShe can't repress the urge to shake her head as she examines your myriad pussies. <i>\"Wow, honey, I can't remember the last time I was with someone who had more holes than I had poles. Just what kind of parties do you get invited to? And what do I need to do to score an invite?\"</i> she giggles, winking at you. <i>\"Though, seriously, just what kind of partners are you into, anyway?\"</i> she asks.");
		//Kind:
		if(pc.isNice()) 
		{
			output("\n\n<i>\"Any kind,\"</i> you reply. Just because she can’t stuff all your holes doesn’t mean you won’t enjoy yourself.");
			output("\n\n<i>\"You're a sweet thing,\"</i> she chuckles. <i>\"Let's see if I can't be just as sweet to you....\"</i>");
		}
		//Mischievous
		else if(pc.isMischievous())
		{
			output("\n\nOh, is she feeling intimidated because you have more to offer than she has to give? What a pity, and here you pegged her for the confident type... but it’s alright. It’s the skill that matters, not the quantity. But you won’t deny that quantity helps, you add with a chuckle.");
			output("\n\n<i>\"It's not everyday that I have too few cocks for somebody,\"</i> she admits, but then shakes her head and smiles. <i>\"But, like you say, quality over quantity. I'll get you off, have no fear of that....\"</i>");
		}
		//Hard:
		else
		{
			output("\n\nThe kind that can make you feel good no matter what. if she doesn’t have the equipment she’ll just have to compensate somehow. Anyway, time’s passing and you’re not getting any closer to climaxing. When is she going to quit looking and start humping?");
			output("\n\n<i>\"Impatient, aren't we?\"</i> she comments, looking up at you. Then she smirks and, with a giggle, admits, <i>\"not that I wouldn't be impatient in your shoes too. Alright, honey, if you want it so badly, here I come....\"</i>");
		}
	}
	var x:int = pc.cuntThatFits(chars["KELLY"].cockVolume(0));
	if(x < 0) x = pc.biggestVaginaIndex();
	var y:int = -1;
	if(pc.vaginaTotal() > 1)
	{
		if(x == 0) y = 1;
		else y = 0;
	}
	output("\n\nHer eyes close and her mouth opens, letting her bright yellow tongue roll out - all twelve inches of it. Bending her head forward, the inhuman appendage slithers through the air and reaches for your [pc.vagina " + x + "], gliding warm and wet across the netherlips there before starting to insinuate itself inside of you. You gasp at her initial penetration. Her dexterous tongue worming its way is just what you needed to really get going.");

	output("\n\nKelly's lips twitch in the best smirk she can manage as she ravages your cunny with her tongue. With unnatural dexterity it plumbs your depths, rolling around your labia and tasting your juices, coating you nice and thick with Kelly's saliva. It reaches in to penetrate every nook and cranny you have - and a few you didn't realize you had - until it draws itself wetly from your depths, the laquine deeming you sufficiently lubed.");

	if(y >= 0) 
	{
		output("\n\nHer tongue immediately moves on to the next vagina, giving it the same treatment");
		if(pc.totalVaginas() > 2) output(" before moving on to each in turn");
		output(". Each lick chips away at your self control. The urge to pin Kelly down and just taking the ride you want from the laquine. Still you manage to hold yourself back, for now at least.");
	}

	output("\n\nHer hands move, worming their way under your [pc.legs] to grip the underside of your [pc.thighs], hoisting your [pc.butt] off of the bed even as her tongue slurps back into her mouth. <i>\"Alright, honey, just try to relax - this might feel a little weird,\"</i> she informs you, even as she ");
	if(pc.isNaga()) output("wraps your coils around her neck");
	else if(pc.isGoo()) output("wraps your gooey pseudopods around her neck");
	else output("drapes your [pc.legs] over her shoulders");
	output(" for support and moves to caress your butt. Reverently she squeezes each luscious cheek in turn, and then gently spreads them apart before leaning down, her tongue worming out once again.");

	output("\n\nFor anyone else, the position might be awkward, but it poses no problem to Kelly and her prehensile tongue. Like a perverse limb it reaches under your taint and then upwards, sliding teasingly through the canyon of your buttock cleavage before starting to circle your rosebud. Ticklishly she strokes you, rolling the pointed tip around and around, before she starts to push insistently at it and begins to press her way inside. Deeper and deeper into your ass it sinks, wriggling and squirming inside of you as it lubes you, pistoning gently in and out to facilitate its descent before Kelly pulls it free of your now-slick back passage. She swallows it back down, smacking her lips, even as she starts to rise from her kneeling position, still holding your ass off of the bed.");

	//Kind:
	if(pc.isNice())
	{
		output("\n\nWhat’s the verdict? You ready yet or is she going to lick you till you orgasm? Because you certainly feel ready. You hump the air for emphasis.");
		output("\n\n<i>\"Just making sure you were ready for me,\"</i> she grins back. <i>\"But I think you're all lubed up now; time for the real fun,\"</i> she announces hungrily.");
	}
	//Mischievous:
	else if(pc.isMischievous())
	{
		output("\n\nWhat a little tease. Did she forget how to use her tools? Do you need to teach her what goes where or is she going to get down to business?");
		output("\n\n<i>\"As tempting as a lesson may be,\"</i> she declares, the dryness of her tone undercut by the look on her face saying that, yes, she would like it, <i>\"I'll take a raincheck. Now that we're both ready...\"</i> she trails off meaningfully, giving a thrust of her hips to make it clear what she has in mind.");
	}
	//Hard:
	else
	{
		output("\n\nMore fucking, less teasing, you demand.");
		output("\n\n<i>\"But teasing you is such fun,\"</i> she giggles. <i>\"Oh, alright, I suppose I'm ready to get it down, too.\"</i> she says. From the tone of her voice, it's clearly not a hard choice for her to make.");
	}

	output("\n\nLicking her lips in anticipation, the laquine slides her hips closer, tantalisingly rubbing her twin shafts against your inner thighs. She holds you there, letting her footlong cocks drool syrupy-sweet precum onto your flesh with each pulse of her heartbeat, then takes aim at ");
	if(y < 0) output("your pussy and ass");
	else if(pc.totalVaginas() == 2) output("both of your pussies");
	else output("two of your " + num2Text(pc.totalVaginas()) + " cunts");
	output(". <i>\"Hope you’re ready for this, honey. Because I can’t hold back any more!\"</i> she exclaims, smiling. Her first shaft pierces your [pc.vagina " + x + "] with a wet squelch. Saliva, honeyed pre and your own [pc.girlCum] mingle to form a potent lubricant, perfect for the flared tip demanding entrance within your confines.");
	if(y < 0) output(" You’re thankful that she went through the trouble of getting your [pc.asshole] ready too. Her insistent pushing knocks your sphincter wide open as you’re forced to grant her entry.");
	else output(" Your other [pc.vagina " + y + "] welcomes her as easily as your first one.");
	output(" Inch by inch she feeds you, hands roaming over your body, tracing your [pc.chest], teasing your [pc.nipples]. When she gives your chest an appreciative lick you cry out in pleasure. Kelly’s warmth spreads throughout you, and you find yourself instinctively clamping down on her intruding shafts.");
	pc.cuntChange(x,chars["KELLY"].cockVolume(0),true,true,false);
	if(y < 0) pc.buttChange(chars["KELLY"].cockVolume(0),true,false);
	else pc.cuntChange(y,chars["KELLY"].cockVolume(0),true,true,false);

	output("\n\n<i>\"Ah!... Honey, if you keep holding me like that....\"</i> she trails off into a moan of her own. By the time you feel her hips flush against yours, you’re both a panting mess. Kelly strokes your cheek lovingly as you move your [pc.legs] to wrap around her, securing her in place and ensuring she can’t get away.");

	output("\n\nShe giggles, <i>\"You don’t have to hold me down, sweet thing. I’m not going anywhere. I’m exactly where I want to be,\"</i> she grins. Slowly, she leans down to wrap your [pc.lips] into a deep kiss. You welcome her questing tongue whilst feeding her your own. The two of you waiting as you conform to the shape of her pricks, tongues dancing as the flames of your lusts threaten to consume you.");

	output("\n\nWith a wet pop, Kelly frees her mouth of yours, tongue lolling momentarily, still linked to yours by a thin strand of saliva. Panting so heavily that her breasts jiggle hypnotically before your eyes, she pushes herself fully upright from where she was sprawled across your belly. A hand reaches down to your hip and pulls you closer to the edge of the bed, adjusting your position to better suit her needs.");

	//1 Vagina:
	if(y < 0)
	{
		output("\n\nWith each motion she makes, the cock in your pussy shifts slightly, squelching wetly as it stirs the mixture of your juices, her saliva, and her own syrupy precum. The cock in your anus rubs against your back passage so hard that you can feel every vein in it pulsing as they scrape your sensitive flesh, stirring the ");
		if(pc.ass.wetness() < 1) output("comparatively drier");
		else output("equally wet");
		output(" hole.");

		output("\n\n<i>\"Mmm, yeah, this is what I was made for,\"</i> Kelly purrs, caressing your ass. <i>\"Ass is nice, pussy is nice, but both at once? That's what I call paradise,\"</i> she notes, then giggles at her own cheap rhyme. Shaking her head, her expression turns back towards the lecherous as she returns to the matter at hand.");

		output("\n\nHer hands reach down to your hips, holding onto your for balance as she pushes back, digging her heels in to slide herself as far out of you as your [pc.legs] will let her, and then suddenly thrusting back home again with a meaty slap. An appreciative moan bubbles from her throat at the feel of herself being welcomed back inside of your holes, but she frowns in frustration. Bending down at the waist, she wraps you in a powerful hug and lifts you up from the bed so that you are upright, cuddled against her breast to ");
		if(pc.biggestTitSize() >= 1) output("breast");
		else output("chest");
		output(", staring into your eyes with a smile as she supports you more upon her hips.");

		output("\n\n<i>\"Yeah, much better; now I can watch that sweet look on your face, cutie pie,\"</i> she declares proudly, leaning in to playfully rub her nose against yours. Before you can properly respond, she lets out a grunt of effort and lifts you up, rising slowly off of her cocks, and then dropping you back down. Your respective hips meet in a loud, meaty slap of flesh on flesh, making the two of you groan. You clench your cunt and your ass with all your strength, trying to squeeze Kelly so tightly that she can't lift you up again. You fail, but the friction as you slowly drag across her lengths, feeling every vein and ridge and pulsation in both of your holes at once... the both of you shudder in pleasure, even as you slide roughly down again.");

		output("\n\nClinging onto your waist as if her life depends on it, Kelly bounces you in her lap in a smooth, steady rhythm. Her quartette of huge, honey-bloated balls bounce against your ass with juicy smacks in time to the thrusting of her hips, the sound eliciting a perverse grin from the bunny currently rutting you. <i>\"Ooof! C-can you hear that, honey? Can you feel how full they are, how heavy and round with bunny-honey they've gotten? Mmm! They're so swollen they feel like they're going to burst, sweetie, and they just keep getting - nngh! - tighter, and fatter,\"</i> a whorish moan interrupts her spiel, her head tilting back and her eyes screwing closed as she picks up the pace slightly.");
		output("\n\n<i>\"Oh, yeah... this is what you do to me, you incredible thing,\"</i> she groans loudly, as if to emphasize her words. Or perhaps her actions, as she ploughs her foot-longs inside of you to the hilt, grinding them against each other through the thin-stretched wall separating your passages. <i>\"Oh, gods, I love how you make me feel, sweetie,\"</i> she mewls, her lips seeking yours to kiss you hungrily, sucking at your bottom lip before wetly popping free. <i>\"You make me feel so fuuull,\"</i> she moans against your mouth, tongue darting from between her lips like a snake to caress your closest [pc.nipple], teasingly stroking it with its warm, wet tip before slurping back inside her gullet. <i>\"D-do you want me to make you full, too?\"</i> she pants, her tone anxious, staring hopefully into your eyes, visibly praying for you to say yes.");
		output("\n\nAudible slurps and squelchs are echoing through the room by this point, as splurts of her overabundant precum spray back out over her hips from her thrusts.");
		if(pc.hasCock()) 
		{
			output(" Shifting your weight slightly, her now-free hand shoots out to grab for your ");
			if(pc.cockTotal() > 1) output("first ");
			output("cock, pumping it with clumsy enthusiasm, stroking up and down with fast, jerky motions.");
		}
		output("\n\nYou can feel yourself getting close to the edge. Just a little longer and you’ll be able to cum. But you won’t be alone for this ride. You want Kelly to cum too, so you decide to up the ante. With all your might you will both your [pc.vagina " + x + "] and your [pc.asshole] to clamp down on Kelly intruding members, doubling your own pleasure as well as hers.");
		output("\n\nA wordless wail of pleasure ripples up the laquine's throat, her eyes screwing themselves closed and her head throwing itself back in warning as you push her over the edge. Inside of you, you can feel her shafts expanding, their heads flaring out to anchor themselves inside of your guts and womb. Kelly's shafts bulge - you can feel the swollen flesh pushing out your inner walls - as the first two shots of her honey rush up from her clenching quad-sack and erupt inside of you, glazing the interior of your stomach and your womb in one single burst. Your [pc.belly] practically explodes outwards, almost hitting the laquine in the face as it swells rounder and fuller. Kelly shifts you desperately in her arms to keep hold of you, gladly nuzzling your expanding gut even as she keeps pouring honey inside of it, making it swell by the second. Knowing that it is inevitable that you will push her off-balance and make her fall, she spins the two of you around so that when it happens, she will land upon the bed behind her with you atop her.");
		output("\n\nMolten heat boils through your insides, the titanic influx of warm, sweet, gooey honey overwhelming your last resistance. With a cry of ecstasy, your fingers gripping Kelly's shoulders hard, you cum yourself, your cunt drenching her slick loins with your female juices.");
		if(pc.hasCock())
		{
			output(" Above it, your neglected [pc.cocks] erupt in ");
			if(pc.cockTotal() == 1) output("its");
			else output("their");
			output(" own orgasm, washing Kelly's belly and tits with [pc.cum].");
		}
		output(" Your eager grinding proves too much for Kelly's sense of balance, and the laquine topples over onto her bed, smooshed under your growing belly - something that seems to make her cum even harder, from the size of the shots she fires into you in response. Moaning in pleasure, you grind your belly against her face, her arms shifting to encompass the honey-crammed globe obscuring her face, even as your twin holes continue to wring every last delicious drop out of her - you want it all!");

		output("\n\nTime fades away, lost as you are in the feeling of being stuffed ever fuller, of feeling every vein and twitch and shaft-stretching bulge of cum flooding up your ass and your cunt, honey starting to seep and flow down your holes to lube up the fucksticks impaling you so deliciously.... But, even Kelly's four cum-factories have their limits, and eventually the haze leaves you panting for breath, groaning as your stomach complains to the twin monster loads of jism currently crammed into it. You can't even see your laquine lover's upper half anymore; she's being smothered completely under your beachball of a belly. The arms wrapping themselves vainly around your gut, and the way it rises and falls in accordance with her own pants, makes it clear she's still alive, at least.");

		output("\n\nYou roll, falling on your side. A groan escaping you as the strain of your escapade with the honey-bunny takes its toll on you.");

		output("\n\n<i>\"Nnngn... honey? Are you alright? I think I - oohhh - might have overdone it,\"</i> Kelly calls to you; even with you both on your sides, she evidently still can't see you around your stomach. She shifts slightly, wriggling around, then seems to come to a decision. <i>\"I'm going to pull out, sweetie, so... try and relax, okay?\"</i>");
		output("\n\nYou give your assent, and the laquine starts to slide back, dragging her still partially-flared heads from you, sending sparks crackling through your nerves. A moan escapes your lips at the further treatment of your sore holes, but the honey has certainly made you wet and slick enough to help her escape. As she pulls free, you can feel it flowing, thick and steady, from your cunt and your ass. Kelly heaves a sigh of satisfaction. <i>\"There we are; just try and relax, and you'll drain in no time, I promise.\"</i> She gently touches your stomach for emphasis, then lays herself back down and curls up against you. <i>\"Until that happens, though... mmm; nothing like that warmth,\"</i> she purrs, nuzzling one fluffy cheek against your stretched [pc.skinNoun].");
		output("\n\nNot like you can do much else. For now you decide to just take her suggestion and relax....");
		output("\n\n<b>Later....</b>");
		output("\n\nYou pick up your [pc.gear] and put it on. Not having a gigantic, honey-belly to squeeze under your [pc.upperGarment] helps a lot. Fully dressed, you bid the laquine farewell.");
		output("\n\n<i>\"Mmm, don't be a stranger, sweet thing,\"</i> she purrs, stealing a quick kiss before you go.");
	}
	//2 Vaginas:
	else
	{
		output("\n\nThe walls between your cunts are deliciously full, so that you can feel each shaft grinding against the other through them. Kelly's tongue lolls from her mouth and she pants at the friction, shaking her head as she pulls herself back from the overwhelming feelings you are giving her. <i>\"Mmm... do you know what makes this so incredible, honey?\"</i> she asks. You grin and shake your head, wanting to hear her answer. <i>\"Because you've got two sweet little flowers down here,\"</i> she says, grinding herself lightly against your hips for emphasis. Then she half-hoods her eyes and leans in, sweetly kissing your lips, holding the kiss for several moments before letting you go with a soft smack. <i>\"But only one cute face for me to kiss up here,\"</i> she purrs, nuzzling you cheek to cheek.");
		output("\n\nDaintily she kicks her legs up behind herself, lifting her feet off of the floor and supporting herself more fully on your stomach. She wriggles forward into a slightly more comfortable position atop you, and then starts to lift her sweet ass up behind herself, drawing her shafts from their twin sheaths of flesh. You don't like this feeling of emptiness, reaching up and attempting to drag Kelly back down against you. The laquine giggles, playfully wrestling with you as she tries to escape your hold, but you overpower her and draw her back down inside of you, grinding your twin snatches against the very hilts of her dicks, squeezing them with all the strength your cunts can muster.");
		output("\n\nKelly moans above you, arching her back slightly. <i>\"Mmm, you like that, hun? Because I know that I do,\"</i> she purrs, pumping against you again, grinding her full, ripe, fluffy tits against your [pc.chest], letting you feel her own hard nubs against your [pc.nipples].");
		output("\n\nTired of hearing her talking, you reach up with your [pc.lips] and capture her mouth, authoritatively thrusting your tongue inside. The laquine purrs, vibrations racing along your [pc.tongue] even as her own prehensile appendage wrestles and coils against yours. The two of you grind together, wrestling as much as fucking, losing yourself to the pleasures of each other's body's. For Kelly, the feeling of your two cunts wrapped around her shafts, milking her dry as you squeeze and clench, making her fight for every inch she tries to pull free and swallowing her thrusts eagerly. For yourself, the feeling of having ");
		if(pc.totalVaginas() == 2) output("both of ");
		else output("your first two ");
		output("pussies stuffed so wonderfully full at the same time, the pumping with a synchronicity you could never get from two people at the same time, feeling them grinding against each other through the thin-stretched walls between your twin love-canals.");

		output("\n\nYou lose track of time; there is only the feel of Kelly's soft, silky fur against your skin, the weight of her atop you, her hard nipples dragging against your own, the lewd squelches and slurps of your thrusting against each other, her balls slapping against your [pc.thighs], her tongue in your mouth....");

		output("\n\nKelly arches her back suddenly, fiercely, lips breaking from yours, still linked by saliva as she pants aloud. <i>\"Ah! Oh, honey, I-I'm so close!\"</i> she pleads with you, continuing her manic thrusts. <i>\"Oh, gods, you get me so swollen... I'm so full of honey... lemme cum, please, let me fill you up!\"</i> she begs.");

		output("\n\nPanting, nerves afire, lost in your own lust, the thought of saying no never even occurs to you, You drag her back down against you, ravishing her mouth once more, your cunts milking her for all you're worth.");

		output("\n\nA wordless wail ripples out of Kelly's mouth, her eyes screwing closed as she clings to you for dear life. Inside of you, you can feel her shafts expanding, their heads flaring out to anchor themselves inside of your twinned pussies. Kelly's shafts bulge - you can feel the swollen flesh pushing out your inner walls - as the first two shots of her honey rush up from her clenching quad-sack and erupt inside of you, glazing the interior of each of your wombs in one single motion. Your [pc.belly] practically explodes outwards, nearly pushing Kelly off of you, but the laquine hangs on for all she's worth, practically humping your belly even as she continues to flood it ever-fuller with her load.");

		output("\n\nMolten heat boils through your insides, the titanic influx of warm, sweet, gooey honey overwhelming your last resistance. With a cry of ecstasy, your fingers gripping Kelly's shoulders hard, you cum yourself, your cunt drenching her slick loins with your female juices.");
		if(pc.hasCock())
		{
			output(" Above it, your neglected [pc.cocks] erupt in ");
			if(pc.cockTotal() == 1) output("its");
			else output("their");
			output(" own orgasm, washing Kelly's belly and tits with [pc.cum].");
		}

		output("\n\nTime fades away, lost as you are in the feeling of being stuffed ever fuller, of feeling every vein and twitch and shaft-stretching bulge of cum flooding up into each thirsty womb, honey starting to seep and flow down your holes to lube up the fucksticks impaling you so deliciously.... But, even Kelly's four cum-factories have their limits, and eventually the haze leaves you panting for breath, groaning as your stomach complains to the twin monster loads of jism currently crammed into it. Kelly herself is panting with exertion, moaning softly as she sprawls over the beachball-like swell of your stomach.");

		output("\n\nThe two of you lay there together, letting the heat wash off your bodies, the scent of sex and honey and sweat filling the room. Kelly is the first of you to move, sighing as she nuzzles your sensitive belly, letting twinges crackle across your senses. <i>\"Oh, gods, sugar; that was absolutely incredible. And I thought ass and cunt at the same time was incredible...\"</i> she yawns hugely, then giggles softly. <i>\"Mmm... you sure took it out of me. I'mma have a little... little nap...\"</i> she trails off dopily, smiling as she settles back down atop you, cuddling against your stomach as if it were her own personal waterbed.");

		output("\n\nHardly in any position to stop her, and feeling rather tired yourself, you settle back and make yourself comfortable, listening to the soft breathing of the laquine atop your belly as you drift off....");

		output("\n\n<b>Later....</b>");

		output("\n\nEventually, the two of you wake and Kelly helps you clean off, squeezing out most of the honey she stuffed you with in the process. Some of it's a little stubborn, remaining firmly packed in your wombs despite your best efforts");
		if (pc.isChestGarbed()) output(", but the resultant belly-chub isn't enough to interfere with putting your [pc.upperGarment] back on");
		else output(", but the resultant belly-chub doesn't hinder you too much in your quest to collect your [pc.gear]");
		output(".");
		output(" Kelly smiles once you're ready and playfully pets your slightly bulging stomach. <i>\"Good thing I take contraception seriously, or you'd be pregnant twice over,\"</i> she giggles, then steps in to kiss you affectionately. <i>\"Mmm... don't be a stranger, hear?\"</i> she purrs once she's released your lips, tongue darting out to affectionately flick the tip of your nose before she steps away.");

		output("\n\nSaying your goodbyes, you return to the ship.");
	}
	pc.loadInCunt(chars["KELLY"],x);
	pc.loadInCunt(chars["KELLY"],x);
	if(y >= 0) 
	{
		pc.loadInCunt(chars["KELLY"],y);
		pc.loadInCunt(chars["KELLY"],y);
	}
	else 
	{
		pc.loadInAss(chars["KELLY"]);
		pc.loadInAss(chars["KELLY"]);
	}
	processTime(30+rand(10));
	pc.orgasm();
	kellyFucked();
	clearMenu();
	addButton(0,"Next",move,"SOUTH ESBETH 2");
}

//Get Double-stuffed (canceled by QB/LD, open to rewrite)
public function getDoubleStuffedByKellyCancelled():void
{
	clearOutput();
	userInterface.showBust("KELLY_NUDE");
	showKellyName();
	author("Quiet Browser & LD");
	//If Affection < 50:
	if(kellyAttraction() < 50)
	{
		output("<i>\"Whoa, easy there cow" + pc.mf("boy","girl") + "!\"</i> she exclaims in surprise. <i>\"I’d love to stuff you full with my ponies and my honey, but I think this might be a bit much,\"</i> she explains. <i>\"Not that I’m doubting your capacity... I just dunno how to make this work without hurting you,\"</i> she adds.");
		//Kind:
		if(pc.isNice())
		{
			output("\n\nYou insist you’d like to try. You’re pretty sure she won’t hurt you at all.");
			output("\n\nKelly smiles gently at your words, but shakes her head. <i>\"I'm sorry, honey. I'm happy to hear that you trust me and all, but I really don't feel comfortable with us doing this sort of thing. Maybe after we get to know each other better?\"</i> she suggests hopefully. <i>\"If I was more familiar with your body - and more comfortable with how far we can go together - then I'd be happy to do this,\"</i> she explains.");
		}
		//Mischievous:
		else if(pc.isMischievous())
		{
			output("\n\nCome on. Isn’t she at least a bit curious to see how it’ll feel to have a tight hole wrapped around both her dicks? Or is she scared she won’t be able to contain herself?");
			output("\n\n<i>\"You're right,\"</i> Kelly agrees with a sagacious nod. <i>\"Both times. I am curious about how it'd feel, but I'm also scared that I wouldn't be able to control myself. I mean, I've tried it out with holos,\"</i> she admits, a faint wry grin forming, <i>\"but holos aren't people, now are they? I got pretty crazy with those holos, and I don't want to risk hurting anyone,\"</i> she states firmly, clearly not going to be swayed. <i>\"But, if you're really interested in this... if we get to know each other better, and I get more confident that I can do it without hurting you, well...\"</i> she trails off meaningfully, letting you form your own interpretation of what she means.");
		}
		//Hard:
		else
		{
			output("\n\nYou look her in the eyes and state plainly and simply, <i>\"You’re a slut.\"</i>");
			output("\n\nIf you were expecting to rattle her, you failed. Kelly simply snorts and folds her arms under her breasts. <i>\"Yes I am. So what?\"</i>");
			output("\n\nYou tell her you know that she wants this. Even if she’s unsure or denying the fact, you can still see the glint in her eyes. She wants to do it, and you want her to do it, so what’s the hang-up?");
			output("\n\n<i>\"The 'hang-up',\"</i> she drawls, <i>\"is that I don't want to hurt you when I do it. And I mean hurt you in the bad way, where it's not fun at all,\"</i> she adds. <i>\"Look, I'm not going to claim that I don’t want to give it a try, but I'm not going to until I'm much more familiar with your limits. When I know just how well I can cut loose on you without hurting you, then I'll do it,\"</i> she declares. From the look on her face, she's clearly not going to be back down on this.");
		}
		output("\n\nKelly manages to smile and shrug. <i>\"So, yeah... you wanna do something else, maybe?\"</i> she suggests.");
		//Display Sex options, minus DoubleStuff//
		kellyBarSexMenu();
	}
	//if first time:
	else if(flags["KELLY_TIMES_DOUBLESTUFFED_THE_PC"] == undefined)
	{
		flags["KELLY_TIMES_DOUBLESTUFFED_THE_PC"] = 0;
		output("Kelly's eyes bulge, looking to pop from their sockets in sheer excitement, her whole body trembling. She opens her mouth to say something, then clamps it shut again, biting back something she obviously didn't trust herself to say. She closes her eyes and then inhales and exhales twice, slowly and deeply. Once she's calmed down, she opens her eyes again and smiles at you.");
		output("\n\n<i>\"Sorry, just needed a handle on this. You have no idea how much I've been hoping you'd ask for something like this,\"</i> she chirps merrily, bouncing energetically on her heels in her excitement. <i>\"I'd love to give it a shot - but I'm not as stupid as I look,\"</i> she interjects, wagging her finger in a playful reprimand. <i>\"We both know that you need some stretching before we can get down to the fun stuff. So, if you'd be so kind as to take that damn fine ass of yours to my bedroom?\"</i> she purrs, gesturing in the appropriate direction, clearly hoping you'll lead the way.");
		//Kind:
		if(pc.isNice())
		{
			output("\n\nSince she’s asked so nicely, how could you refuse? You circle around her, sashaying your way to her bedroom as you pass her.");
			output("\n\n<i>\"Mmhmm... I hate to see you go, but I love to watch you leave,\"</i> Kelly purrs, hot on your proverbial heels.");
		}
		//Mischievous:
		else if(pc.isMischievous())
		{
			output("\n\n<i>\"How bossy,\"</i> you comment. <i>\"But I kinda like it,\"</i> you add. Without further ado you begin your march towards her bedroom, stopping momentarily to give her a bump using your [pc.hips]. Midway through you look behind and shake your [pc.butt] sexily at the laquine, enticing her to stop looking and follow.");
			output("\n\nKelly lets out an appreciative wolf-whistle, but is quick to start crossing the distance behind you, playfully reaching out with her hands in the direction of your butt and making squeezing motions. WIth a grin, you start moving again, letting her mock-chase you all the way into her bedroom.");
		}
		//Hard:
		else
		{
			output("\n\nYou walk towards her and grab one of her cocks, squeezing it almost painfully.");
			output("\n\nKelly moans almost despite herself, her turgid member throbbing in the tight prison of flesh that you have made for it. A bead of sticky precum wells from her cumslit and sluggishly glides down over your knuckles.");
			output("\n\nGiving it a small tug you tell your her, <i>\"Come on my pet, " + pc.mf("daddy","mommy") + " is going to take you for a walk. Make sure you keep your pace. We wouldn’t want anything bad to happen to your leash would we?\"</i> You grin.");
			output("\n\n<i>\"N-no, we wouldn't,\"</i> Kelly breathes absently, marching along in perfect lockstep as you lead her by the dick towards her bedroom.");
		}
	}
	else
	{
		output("Kelly beams with glee upon hearing that, giggling. <i>\"So, does one of mine just not cut it anymore? Do you need to have both of my little bunny-sticks up your greedy bum to get off, my sweet, sexy flower?\"</i> she asks, a surprisingly innocent lilt in her voice that is belied by the lusty appraisal she is giving you.");
		output("\n\nBefore you can answer, she sashays towards you, gently taking your face and then kissing you hungrily, her tongue boldly thrusting itself between your [pc.lips] as she ravages your mouth with it. She holds you like that long enough to make you breathless, and then pops noisily free, panting harshly herself.");
		output("\n\n<i>\"Oh, yeah...\"</i> she purrs absently. <i>\"Can't get enough of me? Because I know that I certainly can't get enough of you...\"</i> her hand unabashedly snakes around your back to squeeze your [pc.butt] firmly. <i>\"Now let's get you primed 'n' ready, sugar,\"</i> she states, letting you go and dancing around behind you, bumping you with her hip in a nudge strong enough to push you forward, making it clear she wants you in the bed, and she wants you there <b>now</b>.");
	}

	output("\n\nOnce you are in the bedroom, she claps her hands in anticipation. <i>\"Alright, sweet thing; climb up on my bed and make like we were going to do it doggy-style - I'll take care of the lubing,\"</i> she informs you cheerily.");
	output("\n\nYou follow her directions, raising your behind to allow her easy access as you find a comfortable position.");
	output("\n\nA soft, plump cushion is placed gently in front of your head, Kelly's lopsided beam coming into view close behind. <i>\"Just lay your head on this and relax, sweet thing. I swear, you're going to enjoy this almost as much as when we get down to the real fun.\"</i> With a giggle, she reaches in and gently taps your nose with her finger. <i>\"But don't get too carried away with enjoying the lubing, though, my naughty little lover. I want to make sure you've got lots of energy left for when my ponies get to ride your ass for all it's worth,\"</i> she playfully chides you.");
	output("\n\nAccepting her pillow, you lay down and do your best to relax. The anticipation has you feeling a bit antsy. But you bear it and patiently wait for Kelly to begin.");
	output("\n\nKelly busies herself somewhere beside you, humming a wordless tune as she rattles around in a draw and casually flicks it closed again. Springs protest as she climbs up onto the bed behind you, and you can clearly hear the distinctive sound of a bottle lid being unscrewed. Throughout it all, she keeps mumbling her little tune to herself, making it almost jarring when she stops.");

	output("\n\n<i>\"Alright now, honey; I want you to relax, can you do that for me? I'm just going to start with a finger's worth of lube.\"</i> Kelly's voice is warm and soothing, and you give her your assent once you feel you have it under control. The laquine's hands move, swift and steadily, to gently spread your cheeks apart and her lube-coated finger moves in, trailing softly down your crack and tracing circles around your back passage. It brushes the sensitive flesh there with featherlight touches, then gently starts to press its very tip into you, trying to wriggle inside of you.");
	output("\n\nYou shudder as the cool liquid touches your sensitive anus, gasping in surprise. But your gasp soon gives way to a hum of pleasure as you feel Kelly’s delicate touch. Her massaging fingers fill you with pleasure, and you slowly drop into a relaxed state, your [pc.asshole] twitching in anticipation as you wiggle your butt and tell her that you’re ready.");

	output("\n\nKelly simply giggles from behind you. <i>\"Not yet, you aren't. But soon,\"</i> as if in emphasis, her finger begins to feed itself inside of you, pushing gently through the relaxed ring of muscle to the knuckle, ticklishly stroking your interior. Gently pumping it, she adds, <i>\"very soon,\"</i> in an eager tone, continuing to smear lube inside of you wherever she can reach.");
	output("\n\nA few pumps and she carefully extracts herself from inside of you, a soft moan unthinkingly making its way from you in disappointment. Some wet squelching noises from behind you announce what she's doing, and it's two fingers that start to rub and push against your rosebud this time. Patiently and tenderly she presses them against you, coaxing your flesh to stretch and accept both of her fingers at the same time, smearing copious amounts of lube upon you and inside of you....");

	output("\n\nYou moan and buck against her, eager to take more of her inside. As careful as she’s being with your condition, you can’t help but feel like Kelly is a freaking tease. If you were hungry for her cocks when this first started. Now you’re positively ravenous. You urge her to move on. At least give you one so you can have some fulfillment!");

	output("\n\nA giggle echoes from behind you. <i>\"You want a cock already? Greedy thing,\"</i> she chides you, digging her fingers particularly deep inside of your yearning ass for emphasis. <i>\"But... I suppose one won't spoil your appetite,\"</i> she muses, seemingly to herself, even as she pries herself free of the grip your walls have on her fingers. For what seems like a small eternity, you are left empty and aching, before you feel something warm and wet and slimy being rubbed tantalizingly through the canyon of your ass-cleavage. <i>\"Alright honey; you wanted one? Here it comes,\"</i> Kelly chirps, even as she aligns her lube-smeared cock with your [pc.butt] and pushes it home, impaling you with the first of her pony-like fucksticks.");

	pc.buttChange(chars["KELLY"].cockVolume(0),true,false);

	output("\n\n<i>\"Yes!\"</i> you cry. Finally! You buck back, willing your [pc.asshole] to greedily swallow the offering and screaming at the laquine to take you. To rut you like you know she wants to. To show you just how much of a beast she is. You want to feel her lust, her desire. You want to know how much she wants you. And you want her to know how much you want her in turn. You clench your ass, strangling her cock in a vice-like grip.");

	output("\n\nA harsh moan echoes from behind you, the laquine's cock pulsing in need as your tight flesh wraps it in a stranglehold. <i>\"C-calm down, honey,\"</i> Kelly groans. <i>\"Or else I'm gonnna - gah! - I'm g-gonna lose control myself,\"</i> she hisses as she tries to withdraw slightly from the clutch of your ass. <i>\"Sheesh, you're almost as horny as I am,\"</i> she grunts.");

	output("\n\n<i>\"Is that a bad thing?\"</i> you ask, grinning.");

	output("\n\n<i>\"Bad thing?\"</i> Kelly repeats dumbly, then bursts out laughing. <i>\"Of course it's not a bad thing! Oh, gods, how I love this side of you...\"</i> she moans, almost unintentionally humping herself against you. <i>\"But, nngnn, right now isn't the time for it. As much as I - ooh - wanna give you my best, this time, I need to try and keep a grip on myself. And you're <b>so</b> not helping with that,\"</i> she sulkingly comments; you can literally hear her pouting in disapproval.");

	output("\n\n<i>\"That said,\"</i> she notes suddenly, with exaggerated casualness. <i>\"Do you really wanna know the answer to your question? Do ya?\"</i>");

	output("\n\nYou nod emphatically.");

	output("\n\n<i>\"Well, my answer is this,\"</i> Kelly states, then pushes forward with her hips; once she has buried herself to the hilt inside of you, she drapes herself over your back, letting you feel her warmth and her weight as she rests upon you, kissing playfully at the nape of your neck. <i>\"You are, without question, the sexiest thing on Mhen'ga, in my eyes. And, gods, I want you so badly that it hurts trying to hold myself back. But I'm going to hold back, and you're going to love me for it, because when I do cut loose....\"</i>");

	output("\n\nYou gasp as you feel a pair of fingers pressing under the seal of her cock, seeking passage.");

	output("\n\n<i>\"You're going to see that the wait was all worth it,\"</i> she purrs. Her long tongue slurps down along the side of your face, salaciously lapping at your cheek before withdrawing. The laquine straightens up again, her less awkward position allowing her to focus more on trying to slide her fingers around her shaft, stretching your ring wider than her girl-meat already has.");

	output("\n\nAwkward as it is, she manages to keep absently thrusting into you, slowly worming her fingers into the seal. The sensation is indescribable, but the lube seems to be doing its job, your ring slowly pulling itself wider and wider. You moan at the feelings, and Kelly's lush, bountiful breasts come to rest full and heavy against the small of your back, the laquine rubbing them in soft circles across your [pc.skin]. <i>\"Sshh, it's alright, lover, you'll be all stretched out, I promise,\"</i> she assures you, her tone soft and gentle, a giggle of anticipation following her words.");

	output("\n\nYou can feel a second set of fingers, thick and slimy with lube, pressing against your ass on the opposite side. Gently whispering encouragement, she begins to stroke your inner walls in half-circle orbits, alternatively sliding up and down on either side, slow and careful strokes, curled fingertips gently pulling you wider and wider....");

	output("\n\nIt’s hard to believe how far Kelly is stretching you. And it feels so good too. You fight your instinct to buck against her as you wait for her to continue.");

	output("\n\nPatiently the laquine works at lubing and stretching, stretching and lubing, her thrusts falling down in pace as she works on working your butthole further and further open. You realize that you are starting to feel her cock less and less, as she stretches you so wide that you aren't touching it anymore. There comes a point when you can barely feel it, as if she only has the tip inside of you, and a moan of dismay at being so empty rumbles out of you.");

	output("\n\n<i>\"Aw, you don't like that, do you sugar?\"</i> Kelly notes sadly. Then, in a tone dripping with mischief, she adds, <i>\"Well, this will fix that!\"</i> You can feel one set of fingers remove themselves from your gaping hole, the other applying themselves do your ass below the cock, pulling it down towards your ");
	if(!pc.hasVagina()) output("taint");
	else output("[pc.vaginas]");
	output(". Something hot and wet and slimy butts itself against the stretched walls of your anus, gliding over Kelly's pinning fingers to grind along against the underside of her shaft and the lower half of your ass alike.");

	output("\n\n<i>\"Think loose, sweetie! Here I come!\"</i> Kelly cheers exuberantly from behind you, withdrawing her fingers and pushing her second cock in at the same time, letting the thick piece of laquine-meat plunge inside of you, grinding against your walls even as it stretches them still further, forcing her upper cock harder against your flesh.");

	output("\n\nYou cringe with effort as you feel Kelly’s second mast push deep into your bowels, joining the first in stretching you out to your limits and beyond.");

	output("\n\nFingers squeeze into the flesh of your [pc.butt] for support, your laquine lover moaning above you in mingled pleasure and effort. <i>\"A-almost... aah....\"</i> She sighs in relief as her second cock finally joins its twin in being buried inside of you to the hilt, the thick girldicks stretching your [pc.butt] around their combined shafts. You can feel her heartbeat through her engorged members, and it feels like you are stretched over every ripple, lump and vein on the two. A shudder of pleasure ripples down the laquine's spine, Kelly's cocks jostling inside of you as she sways. <i>\"Gods, this feels so damn good - you're so hot, so tight");
	if(pc.ass.wetness() > 1) output(", so wet");
	output(",\"</i> she groans. <i>\"I love the way you make this feel... are you ready to get started for real?\"</i> she asks, and you can practically hear the grin she's wearing.");

	output("\n\nGroaning in exertion you ask Kelly to wait a little while. This is quite a bit to take in, even with all the stretching.");

	output("\n\n<i>\"Of course, sweet thing,\"</i> Kelly immediately replies. You can feel her members quivering inside of you as she shudders again. <i>\"I'm not going to get soft anytime soon, not with you wrapped around me like this,\"</i> she giggles.");

	output("\n\nYou will yourself to relax, letting Kelly’s pair of horse-dongs model your back passage. It takes a little longer than you’d like, but eventually you do feel well enough that she can probably start moving now. You give her the go ahead, telling her to be gentle.");

	output("\n\n<i>\"Gentle?\"</i> She repeats softly, and you can feel her fingers move to start tracing soft, soothing circles at the base of your spine");
	if(pc.tailCount > 0) output(", just above your [pc.tail]");
	output(", <i>\"I can do gentle,\"</i> she declares. A soft intake of air from behind you, and she starts to withdraw, slow and tender like you asked, the twin members creeping back through inch after inch of overstretched tunnel. She takes it back far enough that it seems like only the rims of her glanses are holding her inside, and then starts to push forward again at the same patient pace until you can feel her quad swaying against your [pc.thighs].");

	output("\n\nMore slow thrusts follow, Kelly patiently humping away at your ass. <i>\"How does that feel, honey? Not going too fast, am I?\"</i> she asks in concern, resuming her caressing of your back, massaging your lower back in an effort to help ease your tension.");

	//1st Time:
	if(flags["KELLY_TIMES_DOUBLESTUFFED_THE_PC"] == 0)
	{
		output("\n\n<i>\"Maybe this wasn't such a good idea - maybe I should pull out and we can do something else?\"</i> Kelly suggests, genuine nerves in her voice. <i>\"I don't want to hurt you just to get off, there's other things we can do,\"</i> she insists fervently.");
	}
	else
	{
		output("\n\n<i>\"It's so hard to hold myself back, sometimes, but you're such a trooper, doing this,\"</i> Kelly declares, even as her fingers continue their stroking and caressing. <i>\"But you don't have to force yourself to do this - I'm not that selfish. There's plenty of other things we can do, things that don't push you the way this does,\"</i> she admonishes you.");
	}

	//Kind:
	if(pc.isNice())
	{
		output("\n\nHey now. You’re the one that asked for this, and from what you gather she likes doing this. Despite the effort of having your ass stretched so far, it’s not like you missed her drooling her honeyed pre inside you. It may take you some time to adjust, but you like this too.");
		output("\n\n<i>\"You really are such a sweetheart, you know that, honey?\"</i> Kelly asks from behind you, but you can feel the tension draining out of her at your words. As best she can, given your positions, she leans forward, running an appreciative hand down the length of your back. <i>\"But if you're not giving up, then I'll keep going; trust me, the payoff is going to be sooo worth it....\"</i>");
	}
	//Mischievous:
	else if(pc.isMischievous())
	{
		output("\n\nYou’re the one getting over-stuffed with a pair of horse-cocks and she’s the one getting cold feet? You tell her to just be a good sport and let you adjust, then you’ll blow her mind... and maybe a couple other things too.");
		output("\n\n<i>\"That's not going to be hard to do,\"</i> she giggles, and you're very intimately aware of every lust-fueled pulse and throb of her cocks inside of you. <i>\"But since you want it so badly, I'm happy to oblige,\"</i> she declares confidently.");
	}
	//Hard:
	else
	{
		output("\n\n<i>\"Quit being a pussy,\"</i> you tell her. You wouldn’t have told her to stuff you if you couldn’t handle it. Just takes some time to adjust. <i>\"Get back to grinding,\"</i> you order her.");
		output("\n\nKelly snorts at your order. <i>\"Big tough " + pc.mf("guy","girl") + ", aren't we?\"</i> she asks sarcastically. <i>\"But, if you want it,\"</i> she punctuates her statement with an appreciative slap to your flank, the clap of flesh on flesh audible to your ears, <i>\"then I'll give it to you, alright.\"</i>");
	}

	output("\n\nA little more time is all you really need before any hint of pain disappears. Though you’re still left panting. Slowly, you begin rocking back against Kelly, setting the pace of this fucking yourself.");

	output("\n\nAn appreciative groan and twin spurts of precum meet your actions, fingers moving to take hold of your [pc.hips] like handholds as she eagerly works her own hips to meet the pace you're setting. From the trembling of her fingers, you can tell she's anxious to pick things up, but she forces herself to wait, trusting you to call the shots here.");

	output("\n\nIt doesn’t take much before things get heated. Kelly pants above you, moaning into the nape of your neck as she squishes her luscious boobs onto your back. You can feel every throb, every hot little wad of pre that spills and you know that all she needs is a little push before she blows.");

	output("\n\nWell, it’s time to make this laquine pop. With a grunt, you do your best to grip her cocks with your ass, practically sucking her in as you constrict her dicks.");

	output("\n\nA gasp echoes from behind you, Kelly's whole body quivering as you give her just the push she needs. Breasts squished firmly against your back, she cries out as she thrusts herself as deeply into you as she can manage and cums. Twin streams of hot honey surge into you with all the subtlety of liquid jackhammers, your stomach instantly bulging from the sheer force of the torrents inside of you. Jets of pressurised jism squirt back around the improper seal caused by her two cocks, plastering your ass and her body from the hips down in semen, but more and more keeps rushing inside of you. Kelly hisses and moans, tongue darting out and lapping instinctively at your [pc.ear] as she holds onto you for dear life, even as she continues trying to balloon you with honey-semen.");

	output("\n\nHer orgasm triggers your own. With a scream");

	//[Right; like I said in the Skype, let's call this scene a quit. Let someone else write it instead.]
	//9999
	//FINISH THIS SHIT OXO
}

//Get Blown
public function getBlownByKelly(noIntro:Boolean = false):void
{
	clearOutput();
	userInterface.showBust("KELLY_NUDE");
	showKellyName();
	author("Quiet Browser & LD");
	if(!noIntro)
	{
		output("Kelly visibly perks up at your suggestion, lips curving into a wide smile as she nods and replies, <i>\"Sure thing!\"</i> The exuberant laquine grins even wider at the look on your face. <i>\"Ah, my sweet [pc.name], you should know by now that, as much as I love giving cum...\"</i> she daintily crosses the distance and twines herself sinuously against you, her cocks hot and hard against your [pc.thigh] as she places her mouth as close to your [pc.ear] as she can get and finishes, in her best breathy stage-whisper, <i>\"I love taking cum, too.\"</i> She swipes her tongue playfully across your cheek, and then all but twirls you over towards her couch, where the release of her arms and a coy bump of her hip indicates she wants you to sit down.");
		output("\n\nOnce you are seated, Kelly quickly kneels before you, almost daintily until one notices the precum-dribbling dicks drooling syrup on the floor below you.\n\n");
	}
	//Give Oral - Masturbate=Cock rejoins here//
	output("Placing her hands on the couch beside your thighs for support, Kelly closes her eyes and leans in, sniffing deeply as she brings her nose close to your nethers, a contemplative expression on her face. <i>\"Hmm... wonderful aroma, with a nice, rich bouquet, full of subtle complexities...\"</i> she declares in her best <i>\"upper-class woman\"</i> voice. Then she opens her eyes and giggles at you, grinning widely. <i>\"Or, in language real people use, you smell totally yummy, sweetie,\"</i> she declares. Her brow furrows and she lifts a hand to rub her chin in thought. <i>\"I wonder if you taste as nice as you smell....\"</i>");

	output("\n\nOnly one way to find out.");
	if(pc.isAss()) output(" You grab her head and push it down towards your [pc.cockBiggest]. <i>\"Get started,\"</i> you order.");
	else if(pc.isMischievous()) output(" You lean back and tell her that unless she starts licking, she’ll never get to the creamy insides of your Steele lollipop.");
	else output(" You lean back, waiting for her to begin.");

	output("\n\nKelly giggles and opens her mouth, ");
	if(pc.isAss()) output("unphased by your roughness, ");
	output("letting her tongue loll out to its full foot-long length. She moves her head a little closer, but otherwise remains still; it is her tongue that begins to move, its narrow point of a tip reaching down to touch the very base of your [pc.cockBiggest] and then gliding smoothly upwards, gently wrapping itself around the curve of your shaft as it does so until it has given you a long, wet lick. It darts back into her mouth and the laquine smacks her lips, before letting it slide forward again. This time, it teasingly wraps itself around your [pc.cockHeadBiggest], coiling around your glans until it has been enveloped in a warm, wet cocoon of flesh, which ripples gently against the heated skin.");

	output("\n\nYou sigh in pleasure. Licking is good, but what you need is the warm mouth of an eager cum-bunny and a pair of soft, puffy lips to envelop your shaft.");
	if(pc.isMischievous()) output(" Kelly wouldn’t know where you could find that, would she?");

	output("\n\nWith a wet slurp, Kelly's tongue snaps back between her lips and she smirks up at you. <i>\"Oh, sugar-flower, no mere mouth will ever match my tongue,\"</i> she boasts. Before you can think to say anything, her tongue darts out of her mouth like a perverse snake, coiling itself around and around your dick until she has completely enveloped as much of it as she can in warm, wet tongue-flesh. She squeezes, not hard enough to hurt, but with delicious firmness, and then her tongue starts to undulate, rippling against your flesh and bobbing up and down ever-so-slightly upon your length.");

	output("\n\nOkay, maybe she’s onto something, you admit whilst stifling a moan. In that case you’ll just let her take the lead.");

	output("\n\nAs best she can with her mouth hanging open, Kelly grins a triumphant grin at hearing that. She mumbles something that could be, <i>\"That's a good " + pc.mf("boy","girl") + ",\"</i> and then turns her attention to the matter at hand. Or perhaps, more accurately, at tongue. Like a tentacle, the prehensile length of her yellow tongue ripples across your prickflesh, squeezing and kneading, slurping and lapping, all in the same sets of motions. Her warmth envelops the sensitive meat of your shaft, so tight you can feel the tiny buds of her tastebuds, wet drool slathering itself over your heated flesh. Her head moves only minimally, just enough to facilitate her tongue as it slides up and down, occasionally tightening or loosening a coil for maximum effect. And all the while, her eyes look up at you knowingly, basking in your expressions as she works to pleasure you.");

	output("\n\nAt one point, she unwinds her tongue partially, exposing some of the lower parts of your dick to the comparatively cooler air. Her reason for doing so becomes clear as the pointed tip flickers up to your [pc.cockHeadBiggest], dipping in gently towards your cumslit. An audible slurping noise reaches your ears as her perverse appendage uses its hollow tip to suckle at your precum, sucking up the beads of sex-juice washing down over its length before drinking straight from your \"tap\".");

	output("\n\nYou’re unable to resist bucking into her tongue’s grasp, shooting her a warning that if she keeps this up");
	if(pc.isMischievous()) output(" she’s going to reach your creamy insides very soon.");
	else output(" you’re going to cum.");

	output("\n\nKelly's tongue twitches, squeezing you a little, and now she moves, lifting her head to bring it closing down over your cock, swallowing ");
	if(pc.biggestCockVolume() < 500) output("all of it");
	else output("as much of it as she can fit");
	output(", until you can feel it pushing against the back of her throat. With no hesitation, she continues impaling herself upon you, letting you slide into the hot, wet depths of her throat without so much as a hint of a gag reflex.");
	if(kellyAttraction() >= 50) output(" Given what she told you about her true size, that's logical, though; she's probably deep-throated herself plenty of times before.");
	output(" Her tongue continues to dance madly around your prick, sliding down to ");
	if(pc.balls == 0 && !pc.hasVagina()) output("lap at the blankness between your [pc.thighs]");
	else if(pc.balls > 0) output("slide teasingly over your [pc.balls], ticklishly tracing your stretched nutsack");
	else output("lapping wetly against your labia, worming its way into your cunt");
	output(".");

	output("\n\nThe confines of Kelly’s tight throat sucking down your length is too much to bear. With a cry of pleasure you twitch and grab her head, holding her in place as ");
	if(pc.balls > 0) output("your balls churn and ");
	output("you let loose your lust upon the receptive bunny’s cock-sleeve of a throat.");

	//CumQuantity=Normal:
	if(pc.cumQ() < 250)
	{
		output("\n\nYour load of [pc.cum] vanishes down Kelly's throat like water down a drain, with barely a gurgle of effort as she swallows. From the blissed look on her face as her eyes sink closed to savor its flavor, and the hum of contentment that rumbles delightfully across your now-limp shaft, she enjoyed it all the same. Her tongue writhes around your swallowed length, painstakingly lapping you clean before she pops wetly free of you, dabbing at your glans with her tongue before settling back on her knees and looking at you.");
	}
	//CumQuantity=High:
	else if(pc.cumQ() < 1000)
	{
		output("\n\nIf you were expecting to catch the laquine off-guard with your greater-than-average cumshot, you failed. With masterful skill, Kelly gulps and gurgles and swallows each great streamer of [pc.cum] that you unload into her mouth, letting it all gush down her throat. Though you pack her belly full until it visibly bulges, she takes it all with aplomb, smiling as best she can around her cock-stuffed mouth.");
		output("\n\nWhen you are finished, she starts to loosen her mouth and tongue, lapping gently at your cock to clean off anything left behind before wetly letting you fall from between her lips. She looks up at you and pets her bulging belly with a grin, hiccuping loudly as she does so.");
	}
	//CumQuantity=VeryHigh:
	else if(pc.cumQ() < 10000)
	{
		output("\n\nA gurgle of seemingly equal parts surprise and delight bubbles wetly from Kelly's throat as the first of your massive output of [pc.cum] washes into her mouth. Gamely she sucks away at you, determined to spill not so much as a drop of cum even as her belly begins to bulge from the amount of fluid you are pumping into her. Madly she gulps and swallows, using her tongue to help seal her mouth around your cock, until finally even you run dry.");
		output("\n\nThe laquine pants heavily for breath upon your cock, slowly lapping at it once she has inhaled enough air through her nostrils to catch her breath, and then wetly pops herself free. She wallows back on her knees, stomach huge and gravid before her, and she strokes it with a proud look. Furrows cross her brow before she belches wetly, filling the air with a stink of sex, her fingers darting daintily to her embarrassed lips. <i>\"Excuse me,\"</i> she giggles, an embarrassed grin on her face.");
	}
	//CumQuantity=Extreme:
	else
	{
		output("\n\nKelly's eyes bulge as your cumshot erupts in her mouth like a cannon, splatters of [pc.cum] actually squirting out between her lips from the force of it before she shifts her tongue to further blockade the seal of her mouth and starts swallowing in earnest. Frantically she gulps and quaffs, stomach visibly swelling under her titanic liquid repast, but even she can't keep up with it completely; [pc.cum] sprays out thinly from around her lips, runs down her nose, painting her face and her breasts in streaks and splashes of [pc.cumColor] before you finally empty yourself.");
		output("\n\nKelly's jaws fall slack, letting your [pc.cockBiggest] fall wetly from her lips to land against her cleavage, panting for breath as drops of cum continue to drip off of her chin. With a soft groan, she shifts to make herself more comfortable, her floor-dragging gut audibly giving a soft liquid sloshing at the motion that elicits a comforting stroke from her hand. She looks at you as if about to say something, but instead simply belches like a thunderclap, filling the air with a thick fug of sexual musk. An apologetic smile and a weak giggle is all the reaction she can muster, and instead she meekly hangs her head, turning her long, dexterous tongue to the slow task of cleaning herself and you of the spilt remnants of her lewd liquid meal. That done, she hiccups loudly, strokes her belly again, and looks up at you.");
	}
	output("\n\n<i>\"So... was it everything I promised? Hmm?\"</i> she asks you, a cocky smirk on her lips.");

	output("\n\nYou gotta admit, she has one hell of a mouth on her pretty face. That was pretty good.");

	//Kind:
	if(pc.isNice())
	{
		output("\n\n<i>\"Thanks for that,\"</i> you say, giving her a friendly pat on the head.");
		output("\n\nShe croons in pleasure, leaning in to your hand, eyes half-closed. <i>\"Mmm, the pleasure was all mine,\"</i> she replies.");
	}
	//Mischievous:
	else if(pc.isMischievous())
	{
		output("\n\nWell, you suppose you should have expected that. Kelly must’ve had a lot of practice to pull that off.");
		if(kellyAttraction() >= 50) output(" Did she practice on herself too? Nevermind, that’s a thought for another time.");
		output(" You praise her skill, saying that she’s your favorite bimbo-bunny.");
		output("\n\n<i>\"Of course I am,\"</i> she chirpily agrees, grinning up at you. <i>\"I'm the best bimbo-bunny on the planet; why wouldn't I be your favorite?\"</i>");
	}
	//Hard:
	else
	{
		output("\n\nYou pat her head, scratching behind her ears like a pet. Just as you expected from your pretty slut-bunny. She keeps this up and you might let her do this more often.");
		output("\n\nShe grins at that, leaning in to your scratching fingers. <i>\"I certainly wouldn't complain if you did,\"</i> she chuckles.");
	}

	output("\n\nAs fun as that was, you should be going. You pat Kelly once more and run off to put your [pc.gear] back on. Satisfied that everything is in place, you wave as you leave Kelly’s place.");

	output("\n\n<i>\"Goodbye, sugar! Don't be a stranger now; drop by any time,\"</i> the laquine calls to you. A mischievous grin on her lips, she adds, <i>\"Especially when you have a nice, big, thick, well-aged load for me,\"</i> she giggles, closing the door as she steps back inside.");
	processTime(25+rand(10));
	kellyFucked();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",move,"SOUTH ESBETH 2");
}

//Get Licked
public function getLickedOutByKellllaaaahhhh(noIntro:Boolean = false):void
{
	clearOutput();
	userInterface.showBust("KELLY_NUDE");
	showKellyName();
	author("Quiet Browser & LD");
	if(!noIntro)
	{
		output("A beaming grin splits the laquine's features as she nods in response to your suggestion. <i>\"What kind of bunny-bee would I be I to turn down a chance to savor so rare and special a flower?\"</i> she asks, striking her best dramatic pose as she does. She manages to take herself seriously for all of ten, twenty seconds before she bursts into giggles at her own comical posturing. With a surprisingly courtly bow, she indicates the couch to you, signalling that is where she wants you.");

		//ind:
		if(pc.isNice()) output("\n\nSmiling, you follow her lead and seat yourself.");
		//Mischievous:
		else if(pc.isMischievous()) output("\n\nYou walk around her, giving her butt a loud smack as you settle yourself down. Smirking seductively at her, naturally.");
		//Hard:
		else output("\n\nRolling your eyes, you follow her lead. Let’s hope she doesn’t act like <b>that</b> when she’s licking you.");

		output("\n\nWith quick steps and a cheerful smile, Kelly settles herself before you, kneeling down on the floor so that her head is properly level with your crotch.");
	}
	//Give Oral - Masturbate=Pussy rejoins here//
	//If PC hasCock=True:
	if(pc.hasCock())
	{
		output("\n\nShe smirks up at you and runs swift, dextrous fingers up and down the base of your [pc.cockBiggest]. <i>\"");
		if(pc.cockTotal() == 1) output("This is a lot of fun too");
		else output("These can be pretty fun too");
		output(",\"</i> she notes. <i>\"But that's not what you and I are here for, is it?\"</i> Her tongue slurps wetly out between pursed lips and sloppily licks its way up your [pc.cockBiggest], from base to tip, before it shoots back inside and her hands move to get your male genitalia out of the way, exposing your [pc.vagina] for her.");
	}

	output("\n\nLeaning in for a better view, she scrutinises your womanhood, smiling with satisfaction as it evidently passes whatever test she had in mind. With a grin, she plants a warm, wet kiss right at the base of your netherlips, then retreats her head, just enough that you can see as her tongue slides from her mouth like a perverse, bright yellow tentacle and reaches for your outer lips. She keeps her eyes focused on your face, even as her warm, wet tongue begins to glide smoothly and steadily around the rim of your pussy, the very tip dipping itself shallowly inside and curving in under the lips as she slides up and down first one wall, and then the other.");

	output("\n\nYou hiss at her teasing caresses, [pc.legs] tensing as she continues to do so. There’s a part of you that just wants to grab her and shove her into your muff so she can properly do her job. But for now you decide to let her take the lead. After all, you can take a little teasing.");

	output("\n\nThe laquine's eyes glint with mischief at your expression, and her tongue continues its tantalising caressing of your sensitive flesh. As [pc.oneClit] exposes itself, however, her attention is diverted, tongue snapping back between her jaws. <i>\"Look who came out to play; now we can really have some fun,\"</i> she giggles, bowing her head once more to plant a soft, feather-light kiss on your clitoris. Her tongue flows forth again, Kelly moving her head back to not block the view as it brushes itself against your sensitive buzzer, slathering you with drool before trying to coil around it like a snake with its prey, encircling it in a hot ring that squeezes down before releasing you. It slides its excess length back between her lips, the pointed tip hovering before the tip of your button and then descending to it. Sparks crackle across your [pc.vaginaColor] skin as the strangest sensation hits your senses; the tip of Kelly's tongue has opened up, and it's now sucking away industriously at your [pc.clit], as if trying to slurp it inside of itself!");

	output("\n\nHowever, it looks like even her obscene appendage isn't that stretchy, and after a few deliciously long moments, it releases its grip upon you, darting down to lap at the wetness pooling between your cunt-lips. It undulates luxuriantly amongst your folds, then curls back up to Kelly's mouth, the laquine making a perverse show of swallowing as she tastes you. <i>\"Hmm... not bad; and now that you're wet, we can really start to play....\"</i>");

	output("\n\nFast as lightning, your hands shoot out, grabbing Kelly’s head by her sides. <i>\"Wha? Hey!\"</i> she protests.");

	//Kind:
	if(pc.isNice())
	{
		output("\n\nYou ask if Kelly could do you a favor.");
		output("\n\n<i>\"Sure... what is it?\"</i>");
		output("\n\n<i>\"Be silent,\"</i> you state. Then push her head straight towards your [pc.vagina], not stopping till you feel her nose contact ");
		if(pc.clitLength > 3) output("the base of ");
		output("your [pc.clit].");
	}
	//Mischievous:
	else if(pc.isMischievous())
	{
		output("\n\nYou ask if she wants to hear a little secret.");
		output("\n\n<i>\"Uh... sure?\"</i> she replies, blinking in confusion.");
		output("\n\nNobody likes a blabber-mouth, particularly when there’s something far more important she could be doing with those plump lips of hers. Having said that you waste no time in burying her short muzzle into your [pc.vagina " + x + "], gasping when you feel her nose make contact with ");
		if(pc.clitLength > 3) output("the base of ");
		output("your [pc.clit].");
	}
	//Hard:
	else
	{
		output("\n\nYou ask Kelly if she knows what she’s supposed to do.");
		output("\n\n<i>\"I think I can take a wild guess,\"</i> she declares cockily, a bold smirk on her face but making no action to move her head. <i>\"But why don't you give me a clue?\"</i> she taunts you.");
		output("\n\nSince she’s asked so nicely. You shove her forcefully against your [pc.vagina], not caring that you seem to be smothering her in-between your [pc.thighs].");
	}


	output("\n\nAh yes... much better now, you sigh in pleasure.");

	output("\n\nFrom the muffled giggle that tingles so pleasantly against your pussy, Kelly seems to agree with your opinion. You can feel her breath tickling against your clit as she exhales through her nose, and then her tongue slides between her lips and laps at your juices once more. It strokes you once, almost perfunctorily, and then it starts to feed itself inside of you, working its way deep as any cock, undulating in a sinuous, prehensile fashion as it goes. Even as her pointed tip burrows into you, as if trying to worm its way to your womb, the base of it coils and flexes, rotating against your sides and moving all too deliciously inside of you, pressing against each spot that makes you flinch, moan or shudder in response. Deeper and deeper Kelly goes, until you can feel it butting with surprising force against a barrier deep inside of you; she's actually reached your cervix, and from the pressure she's exerting, she might be able to go inside if you will only let her.");

	output("\n\nThat doesn't seem to be her plan, though; you can feel her licking inside of you, teasing your opening, but then her tongue begins withdrawing as she instead focuses on feeling back around your depths, searching for your g-spot. Pleasure washes across you as she undulates her tongue within you, seeming to be everywhere at once, and you moan as she finally touches the elusive spot. At once, her tongue flexes, moving to bring her tip directly to that spot and start suckling away.");

	output("\n\nYou cry out. It’s such an unusual feeling having her tongue sucking exactly on your spot. You can feel the edge approaching, too fast to allow you time to warn the laquine. Before you can utter a single syllable, you moan whorishly as your [pc.vagina] clamps down on Kelly’s tongue. Milking it like a phallus. And then your pent up juices finally flood the laquine’s muzzle.");

	output("\n\nKelly doesn't seem even the faintest bit bothered by the sudden cascade of femjuices sluicing across her face. If anything, she starts sucking harder, the free length of her tongue slurping and flailing around inside of you as she tries to catch as much of your juice as she can. She seems more interested in the taste than preventing the mess, though, blithely letting it flow across her cheeks and roll down her chin, muffled moans rumbling wonderfully through your muff.");
	if(pc.hasCock()) output(" She certainly doesn't seem to care about the [pc.cum] raining down upon her back and flowing wetly into her hair as [pc.eachCock] geysers above her.");
	output(" Finally, however, even her teasing tongue can't prolong your climax any further and you slump back against the seat with a moan. She continues to leisurely stroke your inner walls, lapping up every drop she can find, and then sluggishly withdraws her tongue back into her mouth. <i>\"Mmm... you delicious,\"</i> she says - or something like that; her mouth is still jammed inside your cunt, after all, so she's rather muffled. <i>\"You gonna let me up now?\"</i>");

	output("\n\nRealising that you’re still holding her against your muff, you release her.");
	if(pc.isNice()) output(" Then apologize for the roughness.");
	else if(pc.isMischievous()) output(" And just when you were getting used to having her muzzle in there....");
	else output(" Can’t have her drowning on your juices. At least not yet.");

	output("\n\nKelly's head slowly rises into view as she pushes herself up from your crotch, a grin on her lips, your juices flowing openly down her chin");
	if(pc.hasCock()) output(", your jizz in her hair");
	output(". <i>\"I'd ask if it was good for you,\"</i> she begins, slowly clambering up onto the seat beside you. <i>\"But I think I know the answer,\"</i> she smirks, tongue rolling out to lap some of the worst of the smears off her face. <i>\"Mm-mm... I knew you'd be the sweetest flower I ever tasted. I could drink your nectar all day,\"</i> she purrs, petting your cheek affectionately, then resting comfortably against your shoulder.");

	output("\n\n<i>\"Sorry about the mess,\"</i> she giggles. <i>\"I’ll help you clean up soon, but let’s just stay like this a while longer.\"</i>");
	if(kellyAttraction() >= 50) output(" She hugs your arm, nuzzling into your shoulder with a happy smile.");
	//Kind:
	if(pc.isNice()) output("\n\nWell, that seems like a reasonable request. So you’ll comply.");
	//Mischievous:
	else if(pc.isMischievous()) output("\n\nCan’t get enough of you, huh? Alright, since she was such a fine cunt-licker, you think you can oblige.");
	//Hard:
	else output("\n\nYou have things to do... but a little rest wouldn’t be so bad. So you decide to stay a little longer.");

	output("\n\nEventually, you're rested, cleaned, dressed and on your way. Kelly stops you at the door long enough to steal a kiss, telling you not to be a stranger even as she waves you off.");
	processTime(30+rand(10));
	pc.orgasm();
	kellyFucked();
	clearMenu();
	addButton(0,"Next",move,"SOUTH ESBETH 2");
}
