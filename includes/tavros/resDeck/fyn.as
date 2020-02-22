import classes.StorageClass;

//Available Flags

//MET_FYN:						If the PC met Fyn (true or undefined)
//FYN_APARTMENT_ENTERED:		If the PC entered Fyn's apartment in the past
//FYN_RELATIONSHIP_STATUS:		What relationsip the PC an Fyn share - 0 acquaintances, 1 sex buddies, starts at 0
//FYN_TALKED_ABOUT_FYN:			If the player talked with Fyn about ...Fyn (true or undefined)
//FYN_TALKED_ABOUT_SEX:			If the player talked with Fyn about sex (true or undefined)
//FYN_TALKED_ABOUT_HOBBIES:		If the player talked with Fyn about his hobbies (true or undefined)
//FYN_TALKED_ABOUT_FENCING:		If the player talked with Fyn about fancing (true or undefined)
//FYN_TALKED_ABOUT_SAVEWORDS:	If the player talked with Fyn about save words (true or undefined)
//FYN_TAUGHT_DANCING:			If the player had dancing lessons (true or undefined)
//FYN_SEXED:					Counts the time the pc had sex with fyn (int 1+ or undefined)
//FYN_SEXED_DOUBLE_DICK:		If the player ever did Fyn's double dick scene (true or undefined)
//FYN_SEXED_ORC_RAVISH:			Counts the time the player was ravished by an orc Fyn (undefined or 1+)


//display fyn's name + author infos
public function showFyn(nude:Boolean = false):void
{
	if(flags["MET_FYN"]) showName("\nFYN");
	else showName("SHIRTLESS\nMAN");
	if(nude) showBust("FYN_NUDE");
	else showBust("FYN");
	author("JimThermic");
}

//get the int value of Fyns relationship status
public function fynRelationshipStatus():int 
{
	if(flags["FYN_RELATIONSHIP_STATUS"] == undefined) return 0;
	else return flags["FYN_RELATIONSHIP_STATUS"];
}

//update Fyns relationship status. Current min value is 0, max value is 1
public function fynAdjustRelationshipStatus(adjustment:int):void 
{
	if(flags["FYN_RELATIONSHIP_STATUS"] == undefined) flags["FYN_RELATIONSHIP_STATUS"] = 0;
	
	flags["FYN_RELATIONSHIP_STATUS"] += adjustment;
	
	if(flags["FYN_RELATIONSHIP_STATUS"] > 1) flags["FYN_RELATIONSHIP_STATUS"] = 1;
	else if(flags["FYN_RELATIONSHIP_STATUS"] < 0) flags["FYN_RELATIONSHIP_STATUS"] = 0;
}

//increase the amount fyn was sexed by x
public function fynSexed(times:int):void {
	if (flags["FYN_SEXED"] == undefined) flags["FYN_SEXED"] = 0;
	flags["FYN_SEXED"] += times;
}

public function finsApartmentBonus():Boolean
{
	if(flags["FYN_APARTMENT_ENTERED"] == true)
	{
		output("This incredibly large apartment must have cost a small fortune of credits to buy, far and above the normal fare in Tavros station. The polished synth-oak floors look indistinguishable from the real thing, giving the whole place a glamorous air. The common area is huge, filled with a circular island-like kitchen and seating around the outskirts. It’s the sort of place where many people can visit quite easily. There’s an open doorway leading to a lush looking bedroom with silky sheets and a king sized bed. The bedhead has silk ropes around it... whatever could <i>they</i> be for? Another room seems to lead to a dance studio.");
		
		addButton(0, "Fyn", fynMenu);
	}
	else
	{
		moveTo("RESIDENTIAL DECK 11");
		showLocationName();
		output("The door is closed. You’ll need to knock.");
		clearMenu();
		addButton(0,"Next", mainGameMenu);
		return true;
	}
	return false;
}

public function playFynsDoorScene(btnSlot:int = 0):void
{
	//only render knock button if player didn't yet enter Fyn's apartment yet
	if(flags["FYN_APARTMENT_ENTERED"] != true)
	{
		output("\n\nDo you knock on the large oak door?");
	
		processTime(1);
		
		addButton(btnSlot, "N. Knock", knockOnFynsDoor, undefined, "North Door Knock", "Why not? You’re kind of curious to see who lives inside... you only live once, right?");
	}

	if (MailManager.isEntryUnlocked("mirrin_tavros"))
	{
		output("\n\nAt the very end of the hall is a set of automatic sliding doors with a simple neon-white sign overhead: <i>SterkurHús</i>.");
		if (MailManager.isEntryViewed("mirrin_tavros")) output("\n\nMirrin’s new place of course!");
		if (!MailManager.isEntryViewed("mirrin_tavros") || pc.hasStatusEffect("MIRRIN_DISABLED") || mirrinWiffKiddos()) setNavDisabled(NAV_EAST_DISABLE);
	}
}

/*Cut do to reworking intro bits
public function walkAwayFromFynsDoor():void {
	clearOutput();
	showFyn();
	
	output("Deciding to not bother whoever lives here, you step back from the door. Who lives inside is just one more mystery in the universe left unsolved.");
	
	//throw player out on corridor
	currentLocation = "RESIDENTIAL DECK 11";
	
	processTime(1);
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}*/

public function knockOnFynsDoor():void {
	clearOutput();
	showFyn();
	
	if(flags["SEEN_FYN"] == undefined) {
		output("You decide to give in to your curiosity and rap your knuckles against the sturdy wooden door. Is it real oak, you wonder?");
		output("\n\nJust as you don’t think anyone’s going to answer, the door swings half open and a tall, shirtless man steps out. He quirks one of his distinctively dark brows, shooting you a curious, slightly amused look. <i>“...Well, you took your time.”</i>");
		output("\n\nWow. Looking at this guy is like looking at a work of art. Even though he’s clearly not human - the vermilion skin and pointed ears are a dead give away - his well-sculptured figure is distinctly terran in shape. His eyes are full of fire; passionate burning orbs with black, tiger-like slits.");
		output("\n\n<i>“So what are you waiting for? Come on inside, and let’s get started.”</i> The door is fully open now, and he’s gesturing for you to go inside.");
		output("\n\nFor some reason, standing this close to him, you can smell fresh male sweat. Has he been exercising? You can definitely see a slight sheen to his muscles.");
		output("\n\nWhat do you do?");
		
		processTime(5);
	}
	else 
	{
		output("You knock on the door again, deciding to give it another try. Not long after you’re finished knocking, the door swings half open and the same tall, shirtless man steps out. He quirks one of his distinctively dark brows, shooting you a curious, slightly amused look. <i>“...Back again? I’m not a doorman, you know. And I </i>do<i> charge by the hour.”</i>");
		output("\n\n<i>“So what are you waiting for? Come on inside, and let’s get started.”</i> The door is fully open now, and he’s gesturing for you to go inside. What do you do?");
	
		processTime(2);
	}
	
	flags["SEEN_FYN"] = true;
	
	clearMenu();
	addButton(0, "Go In", goIntoFynsApartment, undefined, "Go In", "Why not see where this goes? Could be kind of fun.");
	addButton(1, "Nope!", backOutOfGoingIntoFynsApartment, undefined, "Don’t Go In", "Time to back out of here. He’s clearly mistaken you for someone else!");
}

public function backOutOfGoingIntoFynsApartment():void {
	clearOutput();
	showFyn();
	
	if(pc.isNice()) output("Apologizing for wasting his time, you quickly back off and take your leave.");
	else if(pc.isMischievous()) output("<i>“Sorry, wrong apartment. Thanks for your time!”</i> you exclaim, taking your leave.");
	else output("<i>“Nope. Wrong door. See ya.”</i> You wave and hastily walk off.");
	
	output(" The look of amusement doesn’t leave the handsome crimson-skinned man’s face, even as he slips back inside and closes the door. What was <i>that</i> all about?");
	
	processTime(2);
	
	//throw player out on corridor
	currentLocation = "RESIDENTIAL DECK 11";
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function goIntoFynsApartment():void {
	clearOutput();
	showFyn();
	
	moveTo("RESIDENTIAL DECK 19");

	output("You go with the flow, stepping through the threshold. The door closes soundly behind you. The tall, shirtless man strides past you and through the apartment. Does he expect you to follow?");
	output("\n\nYou follow in his footsteps through the huge, luxurious apartment, reeling a little at the amount of credits it must have cost. From the polished synth-oak floors to the artwork pieces, there’s definitely a glamorous air to the place. Whoever he is, he’s definitely wealthy, there’s no doubt about that. Spotting an open doorway, you see the beginnings of a bedroom, replete with a silky, king sized bed. It’s not hard to see the silk ropes tied to the foot of the bed... it’s not hard to guess what <i>they</i> would be for.");
	output("\n\nYou’re not lead there, though, but rather to a circular island-like kitchen in the common area, surrounded by an abundance of seating. Your host turns to you and runs a hand through his long, midnight-black hair. <i>“...Would you like a drink? We’re pretty well stocked here.”</i>");

	output("\n\nYou");
	if(pc.isNice()) output(" politely");
	else if(pc.isMischievous()) output(" jovially");
	else output(" brusquely");
	
	output(" accept, and he fetches you both a drink, sitting down on one of the comfy-looking curved sofas. You sit opposite from him");
	
	if (pc.isTaur()) output(", crouching down with your tauric body");
	else output(", sinking into the cushions");
	
	output(". The devilish-looking man stretches out, absentmindedly baring his broad shoulders and chest. He looks perfectly at home without a shirt; but then again, he <i>is</i> home, isn’t he?");
	output("\n\n<i>“So, do you have a lot of experience, or is this first time?”</i>");
	
	processTime(5);
	
	clearMenu();
	addButton(0, "Lots", resolveFynConfusion, 'lots', "Lots", "Oh yeah, you’ve got, uh, *tons* of experience... in whatever it is that he’s talking about. Bluff like a pro!");
	addButton(1, "None", resolveFynConfusion, 'none', "None", "No experience whatsoever in whatever he’s talking about, probably.");
	addButton(2, "ComeClean", resolveFynConfusion, 'come_clean', "Come Clean", "Just tell him you have no idea what’s going on, and you just knocked on the door out of curiosity. Come clean!");
}

//come clean and tell fyn you have no idea what he is talking about
public function resolveFynConfusion(type:String):void {
	clearOutput();
	showFyn();
	
	switch(type) {
		case 'come_clean' :
			output("You figure it’s time to come clean, and admit that you have <i>no</i> idea what’s going on. His powerful brows raise in sudden comprehension, his whole face soon following suit.");
			output("\n\n<i>“Ah. So you knocked on the door, and then I assumed...”</i> Instead of looking upset, however, he looks deeply amused.");
			break;
		case 'lots' :
			output("<i>“Interesting. It’ll be good to do it with someone who can keep up,”</i> the dark-haired man smiles. He crooks a finger and touches his chin, looking at you with an intense and thoroughly <i>interested</i> gaze.");
			
			break;
		case 'none' :
			output("<i>“Oh, so I’ll be your first? That’s quite a responsibility,”</i> the dark-haired man smiles, a glint in his eyes. His intense brows are raised; he suddenly looks <i>very</i> interested in you.");
			break;
	}
	
	if(type == 'lots' || type == 'none') {
		output("\n\n<i>“...How about we just do it here and now, then?”</i> he offers, his baritone voice lowering to a distinctively sensual note. Hopping off the couch, he then confidently strides up to you, taking your hand and pointedly pulling you upright! You find yourself pressed against his superbly well formed chest");
		
		if(pc.tallness > 60 && pc.tallness < 84) output(", his narrow waist pressing against yours");
		output(".");
		output(" You gasp; is he rubbing <i>that</i> against");
		if(pc.hasCock()) output(" <i>yours</i>");
		else output(" you");
		output(" on purpose?");
		
		output("\n\n<i>“What, right here, in the living room?”</i>");
		output("\n\n<i>“Of course. No need to make a big song and dance about it.");
		if(type != "none") output(" After all, it’s not your first time, so the living room should be fine...");
		output("”</i> He grabs your hand in his, firmly grasping it, bringing his symmetrical face closer to yours. His body smell is masculine and fresh. <i>“...Are you ready?”</i>");
		output("\n\nYou nod, a hand reaching up to tentatively run through his dark, long hair. It’s so soft and shiny, almost criminally so, the sort that you could run your hands through for hours. <i>“...Yes. Let’s do it.”</i>");
		output("\n\nAt that moment, he pauses, looking deep into your eyes. His powerful brows then raise in sudden comprehension, his whole expression following suit. <i>“...Ah. You... have no idea what I’m talking about, do you?”</i>");
		output("\n\nYou shake your head, and he pulls back a little. Rather than bothered, he looks distinctly amused. <i>“You just walked up and knocked on my door, didn’t you? And then I assumed...”</i>");
		output("\n\n<i>“Yup.”</i>");
	}
	
	output("\n\n<i>“...Right. So, perhaps introductions, then?”</i>");
	output("\n\n<i>“Seems like a good place to start,”</i>");
	
	if(pc.isNice()) output(" you warmly answer.");
	else if(pc.isMischievous()) output(" you grin. It <i>was</i> pretty fun to lead him on like that.");
	else output("you bluntly respond.");
	
	output("\n\n<i>“I’m Fyn Wilder. Honestly, I thought you were here for some private dancing lessons. Samba, belly dancing, strip-tease, that sort of thing..”</i>");
	flags["MET_FYN"] = true;
	showName("\nFYN");
	output("\n\nFyn Wilder... Fyn Wilder... wait, you’ve heard that name before. Something in the recent holos, about a young, talented performer... but his face looks different from the images you’ve seen. When you question him about it, he gives a rich laugh.");
	output("\n\n<i>“That’s me. Though I very rarely go onto the stage with this face. Not unless I’m playing the terran devil, anyway. Usually something a little more like this...”</i> Fyn then waves a hand dramatically in front of his face. There’s a sudden shift, and you’re left gaping at a terran-looking man with surprisingly brown hair and facial stubble.");
	
	output("\n\n<i>“...You’re");
	if(CodexManager.entryUnlocked("Vildarii")) output(" a vildarii");
	else output(" a polymorph");
	output("!”</i> you exclaim in stunned surprise. His dark eyes are glinting with amusement, relishing in your reaction. A true performer, through and through.");
	
	output("\n\n<i>“Of course;");
	if(CodexManager.entryUnlocked("Vildarii")) output(" vildarii");
	else output(" we polymorphs");
	output(" are natural performers. Some better than others, of course,”</i> he adds, with no small hint of pride. <i>“Anyway, my cards are on the table. How about yours? You never told me your name.”</i>");
	
	output("\n\n<i>“[pc.name] Steele,”</i> you tell him. Fyn’s eyes definitely light up. After all, he’s not the only famous one in the room.");
	output("\n\n<i>“Heir to the mining magnate? Well, that’s something! I heard something about your cousin and you being in some sort of race?”</i>");
	output("\n\nYou grumble aloud. Yeah, " + chars["RIVAL"].mf("him","her") + ". Fyn diplomatically changes the topic. <i>“Ah, like that, huh? Anyway, enjoy your drink, and if you want, I’m doing private lessons. After all, I wouldn’t say no to having such a");
	
	if(pc.femininity >= 65) output(" beautiful");
	else if(pc.femininity <= 35) output(" handsome");
	else output(" striking-looking");
	
	output(" " + pc.mf("man", "woman")); 
	output(" as my student.”</i>");
	
	flags["FYN_APARTMENT_ENTERED"] = true;
	CodexManager.unlockEntry("Vildarii");
	
	processTime(10 + rand(5));
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function fynMenu():void {
	showFyn();
	clearOutput();
	
	//generate random number between 0-3
	var random:int = rand(4);
	
	switch(random) {
		case 0 :
			output("The devilish-looking dancer is leaning against the kitchen bench in the middle of the room. He waves as you enter, a glint in his fiery eyes.");
			output("\n\n<i>“Hello there, " + pc.mf("Mr.", "Ms.") + " Steele. Always delighted to see you walk through my door.”</i>");
			break;
		case 1 :
			output("Fyn is reclining in a comfy looking lounge chair, sipping a glass of whisky and listening to music. As you enter, he clicks it off, and stands up.");
			output("\n\n<i>“" + pc.mf("Mr.", "Ms.") + " Steele! I was just sitting and having a drink. Here for lessons, or perhaps something else?”</i>");
			break;
		case 2 :
			output("Fyn is doing some stretches, a look of intensity in his eyes. As you approach, however, his powerful brows relax and his eyes shine.");
			output("\n\n<i>“Ah, " + pc.mf("Mr.", "Ms.") + " Steele. What can I do for you today?”</i>");
			break;
		case 3 :
			output("You catch Fyn reading a book. He’s flicking through the pages, though he’s standing up as he reads it. When you come over, he grins and marks the page. It seems to be a book on bondage techniques.");
			output("\n\n<i>“Greetings! Just catching up on some light reading. Fascinating things those siel come up with. There’s more knots in some of these bindings than an ausar orgy.”</i>");
			break;
	}
	
	processTime(1);
	
	clearMenu();
	addButton(0, "Appearance", fynAppearance);
	addButton(1, "Talk", fynTalk);
	addButton(2, "Lesson", fynLessons);
	
	if(flags["FYN_TALKED_ABOUT_SEX"] == true)
	{
		if(pc.lust() >= 33) addButton(3, "Sex", fynSexMenu);
		else addDisabledButton(3, "Sex", "Sex", "You are not aroused enough for that.");
	}
	else addDisabledButton(3, "Sex", "Sex", "You don’t know him well enough to suggest that.");
	
	addButton(14, "Leave", mainGameMenu);
}

public function fynAppearance():void {
	clearOutput();
	showFyn();
	
	output("Looking at this tall man is like looking at some wild bacchian fae rather than an alien being.");
	output("\n\nStarting at the top, the devilish-looking man has dark, thick hair that reaches down to his shoulders; the sort you could stroke your hands through for hours. His eyes do nothing to soften his rather wicked appearance; they’re passionate, crimson orbs with black, tiger like slits, capped by powerful brows. His ears, like those of all vildarii, are pointed and elfin.");
	output("\n\nHis lips look rather inviting, and they’re rarely still, whether they’re moving with song, speech, or smile. If there’s one thing Fyn seems to pride himself on, it’s his oral skills.");
	output("\n\nLooking down from the nape of his neck, the first thing to notice is his broad, proud shoulders and chest. They’re held with some inner confidence that never seems to falter. Perhaps it’s his dancing training that gives him such perfect, unwavering poise. Said chest is well displayed by his silk black shirt, deliberately left open all the way down to his slender stomach. His whole body in fact has a perfect V-like shape, starting at the shoulders down to his narrow hips; and if his shapely ass is any indication, they possess some serious thrusting power.");
	output("\n\nHis pants are hugging his crotch in a rather suggestive way. They seem to be dance-compatible, allowing for ease of movement, and for the vildarii male to show off his impressive flexibility.");
	output("\n\nIndependent of his physique, whenever you’re close to him, you always catch a hint of a particular, alluring scent; a mixture between fresh rain and a distinctive <i>maleness</i>.");
	
	addDisabledButton(0, "Appearance");
}

public function fynTalk():void {
	clearOutput();
	showFyn();
	
	output("What do you want to talk about?");
	
	fynTalkNavigation();
}

public function fynTalkNavigation(activeTopic:Function = undefined):void {
	clearMenu();
	
	if(activeTopic == fynTalksAboutFyn) addDisabledButton(0, "Fyn", "Fyn", "You just spoke about that.");
	else addButton(0, "Fyn", fynTalksAboutFyn, undefined, "Fyn", "Ask Fyn about himself.");
	
	if(activeTopic == fynTalksAboutHobbies) addDisabledButton(1, "Hobbies", "Hobbies", "You just spoke about that.");
	else if(flags["FYN_TALKED_ABOUT_FYN"]) addButton(1, "Hobbies", fynTalksAboutHobbies, undefined, "Hobbies", "Ask Fyn about his hobbies."); 
	else addDisabledButton(1, "Hobbies", "Hobbies", "You don’t know him well enough to talk about that.");
	
	if(activeTopic == fynTalksAboutSex) addDisabledButton(2, "Sex", "Sex", "You just spoke about that.");
	else if(flags["FYN_TALKED_ABOUT_HOBBIES"] && fynRelationshipStatus() >= 1) addButton(2, "Sex", fynTalksAboutSex, undefined, "Sex", "Ask Fyn about his sexual interests.");
	else if (flags["FYN_TALKED_ABOUT_HOBBIES"] == undefined) addDisabledButton(2, "Sex", "Sex", "You don’t know him well enough to talk about that.");
	else addDisabledButton(2, "Sex", "Sex", "Fyn has no interest in talking about sex with you."); //pc did not firt and blocked sex menu
	
	if(activeTopic == fynTalksAboutVildarii) addDisabledButton(3, "Vildarii", "Vildarii", "You just spoke about that.");
	else addButton(3, "Vildarii", fynTalksAboutVildarii, undefined, "Vildarii", "Ask Fyn about his race.");
	if(activeTopic == fynTalksAboutCareer) addDisabledButton(4, "Career", "Career", "You just spoke about that.");
	else addButton(4, "Career", fynTalksAboutCareer, undefined, "Career", "Ask Fyn about his career.");
	if(activeTopic == fynTalksAboutDancing) addDisabledButton(5, "Dancing", "Dancing", "You just spoke about that.");
	else addButton(5, "Dancing", fynTalksAboutDancing, undefined, "Dancing", "Ask Fyn about dancing.");
	
	if(activeTopic == fynTalksAboutSinging) addDisabledButton(6, "Singing", "Singing", "You just spoke about that.");
	else if(flags["FYN_TALKED_ABOUT_FYN"]) addButton(6, "Singing", fynTalksAboutSinging, undefined, "Singing", "Ask Fyn about singing."); 
	else addDisabledButton(6, "Singing", "Singing", "You don’t know him well enough to talk about that.");
	
	if(activeTopic == fynTalksAboutFencing) addDisabledButton(7, "Fencing", "Fencing", "You just spoke about that.");
	else if(flags["FYN_TALKED_ABOUT_HOBBIES"]) addButton(7, "Fencing", fynTalksAboutFencing, undefined, "Fencing", "Ask Fyn about fencing.");
	else addDisabledButton(7, "Fencing", "Fencing", "You don’t know him well enough to talk about that.");
	
	addButton(14, "Back", fynMenu);
}

public function fynTalksAboutFyn():void {
	clearOutput();
	showFyn();
	clearMenu();
	
	if(flags["FYN_TALKED_ABOUT_FYN"] == undefined) {
		output("You ask Fyn a little bit about himself. The devilish dancer quirks an eyebrow, shooting you a deliberately sultry look.");
		output("\n\n<i>“Why, are you interested...?”</i> he asks, crossing his arms over his barely covered chest.");
		
		flags["FYN_TALKED_ABOUT_FYN"] = true;
		
		addButton(0, "Flirt", fynTalksAboutFynPcFlirts);
		addButton(1, "HardToGet", fynTalksAboutFynPcPlaysHardToGet);
		addButton(2, "NoWay!", fynTalksAboutFynPcIsNoFlirt);
	}
	else 
	{
		output("You ask Fyn about himself once more, curious to hear it again.");
		
		fynTalksAboutFynPartTwo();
		
		fynTalkNavigation(fynTalksAboutFyn);
	}
}

public function fynTalksAboutFynPcFlirts():void {
	clearOutput();
	showFyn();
	
	fynAdjustRelationshipStatus(1);
	
	output("<i>“And what if I was, hmm?”</i> you respond, sauntering up to him and stroking his cheek. He grabs your hand and kisses it, a very intense look in his eyes. You feel your heart skip, just a little, with the incredibly delicious tension in the air.");
	output("\n\n<i>“Well then, I’d just have to keep your interest, because you certainly have <i>mine</i>,”</i> Fyn intones, kissing your fingertips. Intoxicated by the sensation, you let out a little moan, wondering <i>where</i> this is headed. His hands then slide down your arms, trailing their way down to your waist. You’re pulled against him, deliciously close, your face ever so close to his... you can feel his gorgeous lips, his heated breath, brushing against the sensitive [pc.skinFurScales] of your neck.");
	output("\n\n<i>“Well... where to start? My name is Fyn Wilder, though that’s not my real name; just a stage name...”</i> He informs you, now kissing your ear. A tremble courses through your body; a wonderful little shock. <i>“My real name is Eriladar. I’m from Merope in the Pleaides star cluster.”</i>");
	output("\n\n<i>“Do you know of Merope? She was a nymph, a caretaker of Bacchus, the god of theatre, fertility, and ecstasy. They called him ‘the god who comes’.”</i>");
	output("\n\nHow fitting! As his soft, kissing lips trail sweetly down your neck, you quiver with delight. Ecstasy and coming are definitely on <i>your</i> mind! His fingers cling to your waist, holding you fast, and you lift your chin just a <i>little</i> so he can kiss you better. Meanwhile, his words are like honey to your ears...");
	output("\n\n<i>“Some of those earth cultures had real character. Loving terran culture is what attracted me to the stage. Good thing my family had me gene-modded before I was born; vocal cords touched up with a fanfir’s.”</i>");
	
	//Brief bit just for non taurs
	if(!pc.isTaur()) 
	{
		if(IsOneOf(pc.armor, MaidOutfit, SchoolgirlOutfit, 
				LibrarianOutfit, TopNSkirt, NurseOutfit, FemaleDoctorOutfit, 
				CheerleaderUniform, WaitressUniform, LittleBlackDress))
		{
			output("\n\nAt this point, Fyn’s hands slide around and down your back. You feel the hem of your [pc.armor] being hitched.");
			if (!(pc.lowerUndergarment is EmptySlot)) output(" Fingers slide down and beneath your [pc.lowerUndergarment], until your [pc.ass] is firmly in his hands.");
			else output(" Your naked ass is soon being firmly squeezed.");
			
			output(" You sigh happily and press yourself back into his hands with an eager little wiggle. It’s all you can do to stop your thighs from rubbing together,");
		}
		else 
		{
			output("\n\nAt this point, Fyn’s hands slide around and down your back, until your [pc.ass] is firmly in his hands. You sigh happily and press yourself back into his hands with an eager little wiggle. It’s all you can do to stop your thighs from rubbing together,");
		}
		
		if(pc.hasVagina()) output(" wetness");
		else if(pc.hasCock()) output(" hardness");
		else output(" hotness");
			
		output(" building");
			
		if(pc.hasLegs() && !pc.isNaga()) output(" between your legs.");
		else output(" down below.");
	}
	
	output("\n\n<i>“How about you, my dear - any modifications? I’d believe it; you’re criminally easy on the eyes,”</i> Fyn asks, suckling upon your neck. You gasp as your supple skin [pc.skinFurScalesNoun] is pulled into his mouth; almost torturously teased! H-how has he found your sweet spot already, the one between your collarbone and neck--?");
	output("\n\n<i>“Charmer...”</i> you breathily husk, <i>far</i> more interested in what’s happening with your neck and his lips.");
	output("\n\n...And then, he’s pulling back! You huff");
	
	if(pc.femininity >= 70) output(" and shoot him a pouty look");
	
	output(". He, however, has a sparkle in his eyes. <i>“Oh, did you want it to go further? You should have said so.”</i>");
	output("\n\nYou flush. He wants to hear it from your lips, to have <i>that</i> kind of power over you. Like a maestro, coaxing each lusty note from your lips. Do you dare give it to him?");
	
	//fynTalksAboutFynPartTwo();
	
	processTime(10 + rand(5));
	
	fynTalkNavigation(fynTalksAboutFyn);
}

public function fynTalksAboutFynPcPlaysHardToGet():void {
	clearOutput();
	showFyn();
	
	fynAdjustRelationshipStatus(1);
	
	output("You grin, telling him you don’t deny you find him <i>interesting</i>, but it’s simple curiosity, nothing more! By the telling glint in his eyes, you feel he doesn’t believe you; which isn’t surprising, since <i>you</i> don’t believe you. Still, he takes your word for it, quirking one of those delicious brows.");
	output("\n\n<i>“...Well, far be it from me to spurn the attentions of such a");
	
	if(pc.femininity >= 65) output(" gorgeous ");
	else output(" good-looking ");
	
	output(pc.mf("man", "woman"));
	output(". I suppose I’ll just have to tell you everything there is to know about myself.”</i>");
	
	fynTalksAboutFynPartTwo();
	
	processTime(2);
	
	fynTalkNavigation(fynTalksAboutFyn);
}

public function fynTalksAboutFynPcIsNoFlirt():void {
	clearOutput();
	showFyn();
	
	output("You cough, and");
	
	if(pc.isNice()) output(" politely");
	else if(pc.isMischievous()) output(" light-heartedly");
	else output(" bluntly");
	
	output(" tell Fyn that he’s not your type. He looks wounded, or perhaps faux-wounded? <i>“Ah, that’s a shame. Oh well, I suppose my loss is someone else’s gain.”</i>");
	
	fynTalksAboutFynPartTwo();
	
	processTime(2);
	
	fynTalkNavigation(fynTalksAboutFyn);
}

//the second part of Fyns flirt talk to be appended to all three possible answers
//as well as to the repeat scene of the flirt talk
public function fynTalksAboutFynPartTwo():void {
	output("\n\n<i>“My full name is Fyn Wilder; or at least, that’s my full stage name. Apparently ‘Eriladar’ wasn’t distinctive enough, or too hard to pronounce, so my agent suggested I axe it,”</i> he gives a light shrug, <i>“‘Fyn Wilder’ seemed like a good fit.”</i>");
	output("\n\n<i>“I’m twenty eight, and my home planet is Merope, in the Pleaides star cluster. That’s not too far from Terra, galaxy-wise, so we got a lot of terran culture growing up. I’m actually a bit of a terraphile, truth be told; some of the old Earth cultures had some real character.”</i>");
	output("\n\n<i>“Loving terran culture is probably what attracted me to the stage,”</i> the raven-haired man pointedly touches his throat, <i>“Thankfully, my family had me genetically modified before I was born; my vocal cords are spliced with a fanfir’s. It was all the rage with vildarii back then, and it really helped keep up with the competition.”</i>");

	processTime(5);
}

public function fynTalksAboutHobbies():void {
	clearOutput();
	showFyn();
	
	output("You ask him what his hobbies are, and he doesn’t even need time to think.");
	output("\n\n<i>“Sex. No doubt about it. It’s the only thing that comes close to performing. If I could fill my whole day with sex, I would,”</i> Fyn stretches, much like a cat. Or perhaps rather a tiger, given those distinctive eyes of his. <i>“That said, I do have </i>other<i> hobbies. Dancing and singing, obviously. Parties are pretty high up there; you can never go wrong with good company, drink, and music. I’m pretty sybaritic.”</i>");
	output("\n\n<i>“Other than that, I love to fence - which, let’s face it, is almost dancing - and bondage. Nothing more satisfying than finishing off a good bit of knotwork, particularly if you’re dressing up a pretty thing with it and putting [pc.himHer] on display.”</i>");
	
	if(fynRelationshipStatus() >= 1) output("\n\nBondage? You picture yourself trussed up in ropes of silk, put on display for Fyn’s satisfaction. That’s <i>one</i> way to get in his bedroom, apparently!");
	
	flags["FYN_TALKED_ABOUT_HOBBIES"] = true;
	processTime(5 + rand(5));
	
	fynTalkNavigation(fynTalksAboutHobbies);
}

public function fynTalksAboutSex():void {
	clearOutput();
	showFyn();
	
	output("Fyn seems awfully interested in sex. He also said he was into bondage. You ask the devilish-looking man if he’s a Dominant.");
	output("\n\n<i>“Yes, I’m definitely a Dom. That’s not to say I don’t like vanilla; I love a taste of the traditional just as much as I like having a tied-up treat in the playroom,”</i> he explains, then winks. <i>“And yes, I </i>do<i> have a playroom. I buy a lot from the Happy Tails, and not all of it fits in the bedroom.”</i>");
	output("\n\n<i>“Do you have a sub?”</i> you ask, and he shakes his head.");
	output("\n\n<i>“No, I </i>did<i> have one, but not anymore - a lover and a sub. I’m not polyamorous, so I like to be dedicated to one person at a time. I don’t mind if my lover sleeps around, so long as their heart belongs to me. I’m rather possessive that way.”</i>");
	output("\n\nIt’s a bit surprising to hear such a wild and wicked looking guy is actually somewhat monogamous. Or rather, he’s into open relationships, for all his kinks.");
	
	flags["FYN_TALKED_ABOUT_SEX"] = true;
	
	processTime(5 + rand(5));
	
	fynTalkNavigation(fynTalksAboutSex);
}

public function fynTalksAboutVildarii():void {
	clearOutput();
	showFyn();
	
	output("You ask Fyn about the vildarii. You’re interested to hear about his species. The midnight-haired man seems happy to answer your questions, leaning back a little as he does so.");
	output("\n\n<i>“Well, where to start? We’re fantastic, mostly because I’m one of them,”</i> Fyn states, a playful glint in his eyes.");
	output("\n\n<i>“Humble!”</i>");
	output("\n\n<i>“I know, I am. All performers are, you know,”</i> he winks, then crosses his arms. <i>“Hmm, I guess I should give a serious answer, spreading culture and all that. Where to start?”</i>");
	output("\n\n<i>“How about the fact you’re all polymorphs?”</i> you suggest, and he nods.");
	output("\n\n<i>“Yes, we are, though we’re not the best out there. Not the worst, either. A lot of people think we’re just all born with the ability to switch into whatever we please, but it’s not really that simple.”</i>");
	output("\n\n<i>“It actually takes an awful lot of training over many, many years, and even then, you’ve got to have a natural knack for it. It’s a bit like singing, in that respect. Most terrans and ausar can sing, for example, but not all are good at it.”</i>");
	output("\n\n<i>“Not only did I study polymorphing at school, I specialized in it at theatrical college. I also honed it as a stripper while I was paying off my tuition fees. It’s a lot of work, this face changing business,”</i> Fyn explains, giving a faux-sigh. <i>“Most everyday vildarii can only change their color, and the shape of our eyes and ears. The dead giveaways.”</i>");
	output("\n\n<i>“And you?”</i> you ask, your curiosity piqued.");
	output("\n\n<i>“Well, I can change the overall texture, shape, and color of everything, really. Sprouting ausar ears or kaithrit whiskers, for example, or even an extra phallus should the mood suit me. On a good day, I can do a tail, but that’s a </i>lot<i> of work.”</i>");
	output("\n\n<i>“That said, it’s not as easy as it looks. Every time I change, I need to binge eat like crazy; transforming burns up things like fats and sugars, so come performance time, I’ve got to chow down like my life depends on it. Not a bad deal, though, eating so much and never having it hit the hips.”</i>");
	flags["FYN_VILDARII_TALK"] = 1;
	
	processTime(10 + rand(5));
	
	fynTalkNavigation(fynTalksAboutVildarii);
}

public function fynTalksAboutCareer():void {
	clearOutput();
	showFyn();
	
	output("You ask Fyn about his career. You recall that he was meant to be a young up-and-coming actor, at least if the holos were to be believed.");
	output("\n\n<i>“Yeah. Well, I did make it big time. I was cast a big role with the Starlanders; that’s a theatrical company that do holo-productions as well. I would have been broadcast large as life, all three dimensions across countless star systems...”</i>");
	output("\n\nFyn pauses and looks off into a random direction, furrowing his brow. <i>“And someone very close to me died. I didn’t really have it in my heart to perform after that,”</i> he pauses for a moment. <i>“...It nearly killed my agent, but I decided to quit and come out here to the edges of Rush space.”</i>");
	output("\n\nYou ask him what he’s looking for, out here on the edges of known space, and Fyn gives a somber smile. <i>“Honestly? I don’t know. All I knew is I wasn’t going to find it back there in the core.”</i>");
	
	processTime(10 + rand(5));
	
	fynTalkNavigation(fynTalksAboutCareer);
}

public function fynTalksAboutDancing():void {
	clearOutput();
	showFyn();
	
	output("You ask Fyn why he loves dancing so much. The midnight-haired man strokes his chin, seemingly trying to articulate his answer.");
	output("\n\n<i>“Well, it’s expression. It’s energy. It’s... quite obviously hard to explain. You’re in the moment, and in that moment you’re </i>free<i>; nothing else matters. You’re just swallowed by this adrenaline rush, this sort of pure, all-encompassing joy.”</i>");
	output("\n\nBy the passionate glint in his eyes, it seems he <i>really</i> likes dancing. You ask him what kind he likes.");
	output("\n\n<i>“Well, I have a soft spot for ballroom dancing; there’s something particular about the intimate dynamic of two people dancing, bodies pressed together. Theatrical dance too, though that’s more expression.”</i>");
	output("\n\n<i>“Oh, and strip tease. Definitely strip tease.”</i>");
	output("\n\nYou remark that strip tease doesn’t seem to fit with the other two classical arts, and Fyn winks.");
	output("\n\n<i>“When I do it, hun, it’s an art. Trust me. Being able to make someone’s lusts and desires flutter back into their head, just with how much you’re winding them up? Forget art; that’s practically </i>magic<i>.”</i>");
	
	if(fynRelationshipStatus() >= 1) output("\n\nYou look down at Fyn’s hips, imagining him giving you a hot strip tease... and suddenly you feel <i>yourself</i> swooning. He’s not half wrong; that <i>would</i> be like magic.");
	
	processTime(10 + rand(5));
	
	fynTalkNavigation(fynTalksAboutDancing);
}

public function fynTalksAboutSinging():void {
	clearOutput();
	showFyn();
	
	output("You remember Fyn mentioning he was a singer who had fanfir gene mods spliced in before he was born, so you ask him about it.");
	output("\n\n<i>“Yeah; know much about the fanfir? Gigantic, dragon-like creatures, like out of Der Ring des Nibelungen. Actually, I sang with a female fanfir during Der Ring des Nibelungen; I was Sigurd, and she played the dragon. Her, uh hypnotic voice was </i>very<i> captivating. Even though I slayed her on stage, she was the one who felled </i>me<i>; apparently she had quite the taste for young male actors.”</i>");
	
	//if pc's intelligance is higher than half the current max
	if(pc.intelligence() > (pc.intelligenceMax() / 2))
	{
		output("\n\n<i>“Der Ring der Nibelungen? Isn’t the dragon meant to be played by a man?”</i> you ask, recalling the famous terran opera. The moment you say that, Fyn’s eyes fly open, and his smile couldn’t be wider.");
		output("\n\n<i>“You know it? Yes, the dragon </i>is<i> meant to be played by a man, traditionally. There were a few creative differences. The role of the Norn was played entirely by one siel woman, who had six arms to play string instruments with.”</i>");
		output("\n\n<i>“Nibelungen is rarely performed outside of the Sol system. My belief is Tiana, the lady fanfir, bankrolled the production to have her pick of young, strapping singers.”</i>");
	}
	else 
	{
		output("\n\nYou state that you’ve never heard of the piece, and Fyn nods. <i>“I’m not surprised. It’s a pretty rare piece, hardly performed outside of the sol system. My belief is Tiana, the lady fanfir, bankrolled the production to have her pick of young, strapping singers.”</i>");
	}
	
	output("\n\n<i>“If it wasn’t for the fact someone new came along to play with, I doubt I’d have escaped her clutches. The fanfir have highly evolved vocal cords; they can lightly manipulate your thoughts and even hormones through their singing. It’s much like being caught under a witch’s spell.”</i>");
	output("\n\n<i>“That said, even though I abhor being on the bottom, I’d </i>highly<i> recommend sleeping with a fanfir if you get the chance. It’s definitely an experience and a half.”</i>");
	output("\n\nSo, does that mean Fyn can do what fanfir can do? The singer smiles and shakes his head.");
	output("\n\n<i>“Not to that degree. I mean, fanfir have massive throats. Even when they talk, it’s truly captivating. My birthright only gives me a superior singing range.”</i>");
	
	processTime(10 + rand(5));
	
	fynTalkNavigation(fynTalksAboutSinging);
}

public function fynTalksAboutFencing():void {
	clearOutput();
	showFyn();
	
	output("Fencing seems like an interesting hobby, so you ask Fyn about it. He strides over to a wicker-basket and pulls out what looks like a fencing sword. The raven-haired man gives it a lazy flourish.");
	output("\n\n<i>“Good for footwork. That’s why I originally started. Some learn it for practicality - rushers in particular - while other for sport. Me? I do it for fun.”</i>");
	output("\n\nHe hands you the fencing sword, and you take it. Feels light, very light; some sort of special blade? There’s a switch at the handle, and you flick it. There’s suddenly a low hum coming from the blade, and when you touch it against the ground, there’s a light blue crack.");
	output("\n\n<i>“It’s a stun blade. I’m not one for wearing silly outfits or wearing shields. It’s one of the few sports that requires both mind and body in even measure. Self discipline, too. Whether you win or lose, with fencing, it’s up to you. Misinterpret a parry, you change tactics or you lose. You need quick thinking </i>and<i> quick feet.”</i>");
	output("\n\nJust like everything he does, Fyn seems rather passionate about fencing, too. You could probably get him to teach you a few things about it. Maybe it’ll help you out in rush space?");
	
	flags["FYN_TALKED_ABOUT_FENCING"] = true;
	
	processTime(10 + rand(5));
	
	fynTalkNavigation(fynTalksAboutFencing);
}

public function fynLessons():void {
	clearOutput();
	showFyn();
	
	output("What would you like a lesson in?");
	
	clearMenu();
	addButton(0, "Dancing", fynTeachesDancing);
	addButton(1, "Stripping", fynTeachesStripping);
	if(flags["FYN_TALKED_ABOUT_FENCING"] == true) addButton(2, "Fencing", fynTeachesFencing);
	
	addButton(14, "Back", fynMenu);
}

public function fynTeachesDancing():void {
	clearOutput();
	showFyn();
	
	if(flags["FYN_TAUGHT_DANCING"] == undefined || pc.isNude()) 
	{
		output("<i>“");
		if(flags["FYN_TAUGHT_DANCING"] == undefined) output("There’s a dance studio next door. ");
		output("You might want to change into something more comfortable, though,”</i> Fyn grins.");
		
		if(pc.isNude()) 
		{
			output("\n\n<i>“But why wear clothes when I could be naked?”</i> you ask, putting a pointed hand on your bare hip.");
		
			if (fynRelationshipStatus() >= 1) output("\n\n<i>“Well, if you dance like that, we’re not going to end up dancing; we’re going to end up in the bedroom,”</i> Fyn wiggles a brow. <i>“So it’s clothes and classes, or no clothes and no classes.”</i>");
			else output("\n\n<i>“Who said the clothes were for you? There’s no way I can teach you when you’re naked like that!”</i>");
			
			clearMenu();
			addButton(0, "Next", fynMenu);
			return;
		}
		
		output("\n\n");
	}
	//if pc had dance lessons before
	output("You head into a side room and, after throwing on some dance-friendly clothes");
	if (pc.isTaur() || pc.isNaga()) output(" onto your upper half");
	output(", meet him in the side studio. There’s some music already playing and Fyn is standing in the middle of the room. He then starts the lesson.");
	
	//generate random number between 0-4
	var random:int = rand(5);
	
	switch(random) {
		case 0 :
			output("\n\n<i>“Today, we’ll be doing general dance technique. Posture is important to all forms of dance,”</i> Fyn explains, straightening himself out, <i>“You need to stand straight, push your shoulders down and back, and hold your head up. Just this simple thing alone does wonders for any dancer.”</i>");
			output("\n\n<i>“Another simple yet effective trick is </i>smiling<i>. Whether you’re doing a striptease or a tango, a smile is an expression of pleasure, happiness, and amusement. If you smile while you’re dancing, people will get the feeling you love what you are doing. Even if you’re dancing on your own, smile - you love to dance, so let it show!”</i>");
			output("\n\nAfter going over the theory, the lesson turns to practice. Fyn coaches you on proper posture and poise, circling around and giving advice where he thinks it needs work.");
			output("\n\n<i>“Good job! The fundamentals are vitally important; no matter what you build, if the foundation is sloppy, the whole thing won’t stay standing. You can practice your poise while doing anything, so try to wherever and whenever you can!”</i>");
			break;
		case 1 :
			output("\n\n<i>“Today, we’ll be doing general dance technique,”</i> Fyn informs you, tapping his head. <i>“Half of becoming a good dancer is dealing with what’s up here. There’s anxieties and stresses that build up when you try to dance. There’s an inner critic in your head, just like a little child trying to distract you from doing worthwhile things. Telling you you’re being judged and you’re lacking. Hit the ignore button on them!”</i>");
			output("\n\n<i>“So instead of thinking, feel. Don’t focus on the actual steps, but think about how it feels. The more you allow your body to do the dance thinking, the more you’ll develop muscle memory, and stop worrying in your head.”</i>");
			output("\n\nAfter going over the theory, the lesson turns to practice. Just as he suggested, you try to dance on instinct, going with your feelings rather than your thoughts. It’s incredibly liberating, and you find your whole body relaxes, making it easier to dance in turn.");
			break;
		case 2 : 
			output("\n\n<i>“Today, we’ll be doing salsa lessons,”</i> Fyn grins, taking you by the hands. <i>“Now, Salsa is a popular kind of terran dance style that spread out to Alpha Centaurii. There, it turned into what’s called the ‘Hot Trot’; they ditched the twirls and kept the footwork.");
			if (pc.isTaur()) output(" Since you’re a taur, we’ll be doing the Hot Trot.");
			output("”</i>");
			output("\n\n<i>“The reason is simple; in many styles of Salsa, as a dancer shifts their weight by stepping, their upper body remains level and nearly unaffected. That means it’s perfect for leithans to show off their fancy hoofwork, so long as their partner isn’t trying to twirl them. Instead, they incorporated the swift side-trot and the cross-trot, allowing them to rotate around the floor in a fast, showy pattern.”</i>");
			output("\n\n<i>“Dancing with Cha-Cha music is a great way to practice Salsa, because it’s essentially Salsa, but slower. Now, as the follower, you need to be attuned to what the leader is telling you to do. Move instinctively in the direction I’m pushing you in, going with the flow.”</i>");
			output("\n\nYou practice Salsa, Hot Trot, and Cha-Cha with Fyn for a while, moving to the beat of the New Latin rhythm. Once you’re finished, you’re totally puffed! Fyn has a knowing look on his face.");
			output("\n\n<i>“Yeah, dancing those styles can be pretty exhausting; they’ve got a pretty high beat-count compared to normal dances, so you naturally speed up. But you should feel good, you nailed it!”</i>");
			break;
		case 3 : 
			output("\n\n<i>“Today, we’ll be doing belly dancing lessons,”</i> Fyn takes a step back and strips off his shirt.");
			if (fynRelationshipStatus() >= 1) output(" You try quite hard not to ogle his utterly male physique, but fail utterly!");
			output("<i>“Now, contrary to common belief, anyone can belly dance, no matter their sex or physique, so long as they have hips. Here, let me show you.”</i>");
			output("\n\nYou watch as Fyn sensually gyrates his narrow hips, then begins to thrust and punctuate it to the beat of the music. He uses hip rolls, lifts and twists in time with the music, even moving his chest and shoulders in time with the beat.");
			output("\n\n<i>“See? That’s one element of belly dancing; percussive movement. There’s also fluid movement - that’s the kind best suited to galotians and rahn - where you continuously move your body in flows and coils. It requires a great deal of abdominal muscle control. Then there’s shimmying, which can give the impression you’re moving a lot more than you are; shimmying with your knees, hips, shoulders, they all add to the dance.”</i>");
			output("\n\n<i>“Throw in some other movements like traveling steps, turns, spins, kicks, backbends, and head-tosses, and you’ve got yourself quite the show, no matter how masculine or feminine you look. We’ll go over each of these moves individually, then combine them over time, working our way up to a full-blown belly dance.”</i>");
			output("\n\nAfter going over the theory, the lesson turns to practice. Just as he said, you practice all the individual elements, then add them bit by bit to your dancing routine. By the end of the lesson, you’re totally exhausted; moving so much is a real workout!");
			break;
		case 4 :
			output("\n\n<i>“Today, we’ll be doing flamenco lessons,”</i> Fyn takes a step back. His fiery eyes are glinting. <i>“I have to admit, I </i>love<i> Flamenco. It’s one of my favorite styles of dance.”</i>");
			output("\n\n<i>“The word ‘flamenco’ comes from a terran word for ‘flame’ or ‘fire’, and that’s because it’s full of expressive, passionate, and seductive moves. It’s high intensity, and involves a lot of rhythm, finger-snapping and hand-claps. It also goes fantastically with singing, which, of course, I love.”</i>");
			output("\n\nFyn really does sound passionate about it! But then, what doesn’t he sound passionate about? <i>“Now, with flamenco, it can be performed solo, or with a partner. But most important is the feeling, the passion! You hold yourself proudly, expressively using your arms and stamping your feet. You must dance it as if you are on fire with your emotions.”</i>");
			output("\n\n<i>“Here are some moves, repeat after me. It’s mostly improvised - all passionate things are - so do not feel pressured to learn all the moves at once.”</i>");
			output("\n\nYou watch and try to repeat his passionate, flurrying dances, feeling the heat rise in the air. The dancing <i>is</i> wild, and outrageously fun, and even when you’re exhausted otherwise you <i>still</i> feel a lasting thrill.");
			output("\n\n<i>“Fantastic! The flamenco suits you. You must have a </i>lot<i> of passion in your heart,”</i> Fyn remarks, then winks, <i>“Remember to practice in your spare time. Just try not to be so hot that you set fire to something.”</i>");
			break;
	}
	
	processTime(30 + rand(10));
	applyFynTeachingEffect("dancing");
	
	flags["FYN_TAUGHT_DANCING"] = true;
	
	clearMenu();
	addButton(0, "Next", fynMenu);
}

public function fynTeachesStripping():void 
{
	clearOutput();
	showFyn();
	
	output("You ask Fyn for some striptease lessons, and he leads you to the dance studio next door. You both stroll out to the middle of the floor. Once there, the vildarii man waves his hand through the air, setting some tunes. He then starts the lesson.");
	
	//generate random number between 0-5
	var random:int = rand(6);
	
	switch(random) {
		case 0 :
			output("\n\n<i>“The most important part of a strip tease is often the most overlooked. It’s not your tits, your package, or your ass; it’s your </i>eyes<i>,”</i> he stresses, gesturing with twin fingers to his own fiery orbs. <i>“Keep eye contact! The way you look at your partner is the most vital and </i>powerful<i> elements of a striptease.”</i>");
			output("\n\n<i>“It helps to assume some kind of persona; something sexy, like a French dominatrix, or a Russian spy. Perhaps a devil; that’s my personal favorite.”</i>");
			output("\n\nAfter going over the theory, the lesson turns to practice. You attempt to dance while keeping steady eye contact... and it’s harder than it looks! Keeping a sensual stare while moving about is tricky, and you have a renewed respect for strippers. At the end of the lesson, Fyn grins and throws you a towel.");
			break;
		case 1 :
			output("\n\n<i>“Wearing nothing is for amateurs. There’s no surprise, no mystery, no presentation. If you want to truly tantalize someone, you want </i>layers<i>. Not too much, not too little. Things you can take off in a seemingly effortless manner, deliberately and slowly, in order to work your ‘victim’ into a sexual frenzy.”</i>");
			output("\n\n<i>“Don’t just choose your outfit for them; pick it for you, too. Wear something that fits you well and makes you feel sexy. A successful strip isn’t about what outfit the audience would prefer; it’s about exuding confidence and sensuality, so focus on what makes </i>you<i> feel that way.”</i>");
			output("\n\nAfter going over the theory, the lesson turns to practice. You’re given a few easy-to-wear pieces and asked to strip them off, slowly and sensually, projecting confidence. It’s tricky to not rush it! At the end of the lesson, Fyn grins and throws you a towel.");
			output("\n\n<i>“It’s harder with an outfit someone else gives you; you did well. Try stripping in a few different outfits. You never know </i>when<i> you’ll have to strip tease your way out of a situation,”</i> Fyn winks.");
			break;
		case 2 :
			output("\n\n<i>“Always remember, when it comes to stripping, there are no strict rules. Don’t just memorize a dance routine, or think there’s an ‘order’ of undressing. What a turn off, for you </i>and<i> the audience! Just play it by ear, </i>watch<i> their faces, do what you like, and above all, enjoy the process!”</i>");
			output("\n\n<i>“If you feel more comfortable with routine, that’s okay, but add your own touch - your own flair - to your performance. Own it, it’s yours!”</i>");
			output("\n\nAfter going over the theory, the lesson turns to practice. After dancing a few routines, you’re asked to free-style the strip tease. It takes a little getting used to making things up on the fly, but once you start to feel the music in the background, it becomes much easier.");
			break;
		case 3 :
			output("\n\n<i>“When it comes to stripping, a tried-and-true starter is going from the top - unbuttoning it slooowly - while making steady eye contact. Catch them with your gaze, draw it out, maybe move to your skirt or pants. Play around with your clothes a bit, twirling them, or throwing them at your audience. Make it fun, keep them guessing - it’s called a strip </i>tease<i> for a reason!”</i>");
			output("\n\n<i>“Don’t just throw things everywhere, though. Let some things fall to the floor; there’s things that fall down better than others. Slip tops, baby dolls - these are </i>perfect<i> for sliding down your body. Remove them while standing up, and make eye contact the entire time with your partner.”</i>");
			output("\n\nAfter going over the theory, the lesson turns to practice. Fyn asks you to undo your top slowly, and for some reason, it’s harder than it looks to make look sexy at the same time. You twirl around your top, tossing it at him, then do it again a few times with just letting it fall to the floor. At the end, the dancer gives a round of applause.");
			output("\n\n<i>“Good job! This lesson’s an easy one to practice, particularly in front of a mirror. Then again, an audience is always better, so maybe ask a lucky friend,”</i> Fyn suggests, wearing a very mischievous smile.");
			break;
		case 4 :
			output("\n\n<i>“You’re in control when it comes to the strip tease. Wherever you want your audience’s eyes to go? Make your hands go there. And whatever you do is right, because it’s your show, and you set the rules. You can even forbid them to touch you, if that’s your desire; the playful act will tease them even more, giving you more control over them and over the power of your dance.”</i>");
			output("\n\n<i>“Remember; it’s not your technique that seduces; it’s your mood and distinctive manner. Move confidently but slowly; if you breathe deeply, it will slow you down and add subtle sensuality to your moves.”</i>");
			output("\n\nAfter going over the theory, the lesson turns to practice. You practice breathing and using your hands to draw eyes where you want them to go, moving as slowly and confidently as possible. You seem to be doing well, because there’s an approving smile playing on Fyn’s lips.");
			break;
		case 5 :
			output("\n\n<i>“For most species, the groin is where an audience’s attention naturally wants to go. It’s also what you want to leave for </i>last<i>, whether you’re male, female, or otherwise.”</i>");
			output("\n\n<i>“Even if you’ve got the equipment to dazzle them, don’t. Mystery is a delicious spice that is at the heart of a striptease. If you wiggle your naked body around on stage, half the fun is already gone; they may as well pack up and leave.”</i>");
			output("\n\n<i>“Underwear last! And yes, remember to wear it before the performance begins. For those who can’t always reach their underwear, like leithans, it’s the top that comes last; whatever’s hiding your last erogenous zone. Your audience is salivating over whatever body parts they’re fantasizing about. Chest. Stomach. Ass. Groin. Reveal each one slowly, make them wait for it. Keep them on the edge of their seat!”</i>");
			output("\n\nAfter going over the theory, the lesson turns to practice. You practice drawing out your striptease, keeping particular parts of your body covered until the last moment, then saucily revealing it in slow, deliberate movements. When you finish, Fyn nods, a look of approval in his eyes.");
			break;
	}
	
	processTime(30 + rand(10));
	applyFynTeachingEffect("stripping");
	
	clearMenu();
	addButton(0, "Next", fynMenu);
}

public function fynTeachesFencing():void
{
	clearOutput();
	showFyn();
	
	output("You ask Fyn for some fencing lessons, and he leads you to the dance studio next door. You both stroll out to the middle of the floor. Once there, the vildarii man tosses you a stun saber. You both activate them, and they let out a low, crackling hum.");
	
	//generate random number between 0-4
	var random:int = rand(5);
	
	switch(random) {
		case 0 :
			output("\n\n<i>“Today, we’ll be focusing on lunging and flunging. A lunge is one of the most standard but highly effective attacking movements. First, assume the basic fencing position...”</i> Fyn gets in stance, <i>“...then, extend your right foot as far as possible without overstretching or losing your balance.”</i>");
			output("\n\n<i>“As you lunge towards your opponent, you want to </i>extend<i> your sword arm and engage them with a stab or slash. A flunge is basically a flying lunge - hence the name - where you do it with a flying leap. It gives you a greater element of surprise and speed, but don’t use it too much, because it leaves you wide open!”</i>");
			output("\n\nYou practice lunging, both on ground and in the air, with Fyn. The flurry of cracking blades is exhilarating, and you feel the adrenaline coursing through your body. When practice is finished, your heart is rushing, but you’re riding a fencer’s high!");
			break;
		case 1 :
			output("\n\n<i>“Today, we’ll be focusing on the ‘passata sotto’. It’s an evasive movement twist. First, I want you to attack me - go for my upper body or head.”</i>");
			output("\n\nYou lunge forward with the blade, striking where he says. As you do so, Fyn suddenly drops to one knee, placing one hand on the ground. As you loom over him, he straightens his sword arm, striking you on your exposed chest!");
			output("\n\n<i>“The ‘passata sotto’ is an evasive movement and counter-attack, involving a drop and twist. It’s a risky move, because if you time it wrong, or misread your opponent’s body language, you’re going to get skewered. Only use it when you’re sure where they’re going to strike! Now you try.”</i>");
			output("\n\nAs Fyn strikes at you with mock blows, you attempt to replicate the passata sotto, ducking under his blade and striking at his body. Getting the timing right is hard! It occurs to you that you could use this with either gun or sword, just so long as you evade and strike.");
			break;
		case 2 :
			output("\n\n<i>“Today, we’re working on parry and riposte. I want you to strike at me, wherever you wish.”</i>");
			output("\n\nYou lunge at Fyn, and he quickly parries your blade. While you’re outstretched, he quickly strikes back, tapping you on the arm.");
			output("\n\n<i>“A parry is a defensive move where you block or deflect an opponent’s attack with your blade. It doesn’t need to be your blade, though; it could be a gun barrel, or even an object you pick up off the ground. The main thing is to figure out where your opponent’s hit will land, then move your defending weapon in a certain sweeping path to knock it off course.”</i>");
			output("\n\n<i>“Like water, you want to redirect, not directly oppose. Then, when your opponent is stretched out, strike back! Nothing is more shocking in combat than reaching out to strike someone, and rather than landing the hit, getting struck back instead.”</i>");
			output("\n\nYou practice parrying and riposting with Fyn until you swear your arm is going to fall off! After the lesson, though, you’re feeling like you’re much better for drilling in the basics.");
			break;
		case 3 :
			output("\n\n<i>“Today, we’ll be working on counter-attacks and remise. A counter attack is where, as your opponent attacks, you launch one right back at them. The aim is not to parry, but to hit the opponent before they hit you. Even though they strike first, you want to </i>hit<i> first, and take them down before they land their hit.”</i>");
			output("\n\n<i>“From a counter-attack, we’ll practice going into a remise. A remise is a short series of attacks where you do not withdraw your weapon arm; you just keep on striking without mercy. When you’ve got an opponent off-guard and open, you want to deal all the damage you can, to put an end to the fight as soon as possible!”</i>");
			output("\n\nYou practice counter-attacking and remise with Fyn; it occurs to you as you train that the same principles apply for any weapon, not just fencing. At the end, you feel much more confident having something swung at you, and in the fact that if need be, <i>you’ll</i> be the last one standing at the end of a fight!");
			break;
		case 4 :
			output("\n\n<i>“Today, we’ll be practicing feints. Feints are one of the best moves in your repertoire; you always want to keep your opponents off-guard and guessing. Never be predictable,”</i> Fyn grins; you get the impression he doesn’t just mean with fencing!");
			output("\n\n<i>“...You want to trick your opponent by launching one or more fake attacks, with the intent of creating a gap in their defense. When you do, you want to do it from different distances and with many different footwork combinations. If you use the same feint, over and over, they’ll see through it in no time.”</i>");
			output("\n\nFyn feints against you for a while, leading by example and showing you some different kinds. You then practice what you’ve learned on him, trying to break through his defenses. Once the lesson is over, you feel like you’re more astute than ever, and on top of your game.");
			break;
	}
	
	processTime(30 + rand(10));
	applyFynTeachingEffect("fencing");
	
	clearMenu();
	addButton(0, "Next", fynMenu);
}

//Apply non-stacking status effects based on the lesson taken. They last three days.
public function applyFynTeachingEffect(lessonTaught:String = ""):void
{
	if(lessonTaught == "dancing" || lessonTaught == "stripping") 
	{
		if(!pc.hasStatusEffect("Sexy Moves")) 
		{
			pc.createStatusEffect("Sexy Moves",0,0,0,0,false,"OffenseUp","Your recent lessons pay off, you feel as sexy as ever - and it shows.",false,4320);
		} 
		else 
		{
			//reset duration to full length
			var effect:StorageClass = pc.getStatusEffect("Sexy Moves");
			effect.minutesLeft = 4320;
		}
		pc.removeStatusEffect("Lightning Moves");
	}
	if(lessonTaught == "fencing") 
	{
		if(!pc.hasStatusEffect("Lightning Moves")) 
		{
			pc.createStatusEffect("Lightning Moves",0,0,0,0,false,"OffenseUp","Your recent fencing lessons give you an edge during fights.",false,4320);
		} 
		else 
		{
			//reset duration to full length
			var effect2:StorageClass = pc.getStatusEffect("Lightning Moves");
			effect2.minutesLeft = 4320;
		}
		pc.removeStatusEffect("Sexy Moves");
	}
}

public function fynSexMenu():void 
{
	clearOutput();
	showFyn();
	
	//if first time sex move on to hike & fuck
	if(flags["FYN_SEXED"] == undefined) {
		fynSexHikeAndFuck();
	} 
	else 
	{
		output("What kind of sex?");
		
		//buttons need to be generated within the if/else to avoid overriding the buttons of hikeAndSex.
		clearMenu();
	
		var ravishText:String = (pc.isBimbo()) ? "HulkRavish" : "OrcRavish";
		
		addButton(0, "Hike&Fuck", fynSexHikeAndFuck, undefined, "Hike and Fuck", "Let him have his way with you.");
		addButton(1, "Double.D", fynSexDoubleD, undefined, "Double Dicked", "Ask him to use his polymorph ability to double the fun.");
		if(!pc.isTaur()) addButton(2, ravishText, fynSexOrcRavish, undefined, ravishText, "It involves getting butt ravished by an orc-transformed Fyn. Who’d have thunk it?");
		else addDisabledButton(2, ravishText, ravishText, "You can’t be a taur to get ravished by an orc-transformed Fyn.");
		//Seasonal Stuff		
		if(isChristmas())
		{
			if(flags["FYN_VILDARII_TALK"] != undefined) addButton(3,"Transform",fynTransformSex,undefined,"Transform","Ask Fyn for a little seasonal fun in the bedroom.");
			else addDisabledButton(3,"Locked","Locked","You ought to talk to Fyn about his race first...");
		}
		else addDisabledButton(3,"Seasonal","Seasonal","These scenes are available during the winter holidays.");

		addButton(14, "Back", fynMenu);
	}
}

public function fynSexHikeAndFuck():void 
{
	clearOutput();
	showFyn(true);
	
	var useVagina:Boolean = false;
	var vagIdx:int = -1;
	if(pc.hasVagina() && !pc.isTaur())
	{
		vagIdx = rand(pc.totalVaginas());
		useVagina = true;
	}
	
	output("You watch wide-eyed as Fyn suddenly strides towards you. There’s a purposeful look in his captivating eyes. He stops tantalizingly close");
	
	if(pc.tallness < 77) output(", looking down on");
	else output(" to");
	
	output(" you. Your gazes meet and lock, and you find yourself suddenly swept away from reality, caught up in the intensity of those fiery, glowing eyes.");
	output("\n\n<i>“Wuh-what are you doing?”</i> you half-whisper, under your breath.");
	output("\n\n<i>“I’m going to kiss you, of course,”</i> Fyn informs you, as if this was decided long ahead of time. As you open your mouth to protest, he leans forward and seals it with his own supple lips. His tongue, untamed, dances with yours, filling your mouth with an unspeakable, exquisite <i>sweetness</i>.");
	output("\n\nIt’s impossible not to swoon. You find your arms subconsciously slipping around his slender waist, your fingertips clasping desperately, frantically, at his delicious back. Do you want this? Right now you do, more than anything in your life; so much it hurts. Your tongue reaches out to his, yearningly, dancing with it in heavenly harmony.");
	output("\n\nYou feel a pressing at the small of your back; a hand, to stop you from falling? He pulls his lips back, and you’re left staring up into those impossibly handsome eyes that seem to hold all the mysteries of the universe. A pair of powerful hands slide up the side of your thighs");

	if(IsOneOf(pc.armor, MaidOutfit, SchoolgirlOutfit, 
		LibrarianOutfit, TopNSkirt, NurseOutfit, FemaleDoctorOutfit, 
		CheerleaderUniform, WaitressUniform, LittleBlackDress) && !pc.isTaur())
	{
		output(" and under the hem of your [pc.armor].");
		
		if(!(pc.lowerUndergarment is EmptySlot) && !pc.isTaur()) 
		{ 
			output(" Your [pc.lowerUndergarment] are pointedly pushed aside.");
		}
		
	} 
	else if(!(pc.armor is EmptySlot))
	{
		output(". In a frenzy of kisses, suddenly your [pc.armor] is being removed");
		if (!(pc.lowerUndergarment is EmptySlot)) output(" along with your [pc.lowerUndergarment]");
		output(".");
	}
	 
	if(useVagina) {
		output(" He pulls out his manhood and presses it against your slick wetness, joining his body to yours.");
		if(pc.vaginalVirgin) output(" You feel a momentary pain, followed by a warm trickling down your thigh. Blushing furiously, you cling to him, letting out a little whine.");
	}
	else
	{
		output(" He spins you on the spot and, pulling you back against his chest, presses his manhood between your buttocks. You blush as he parts your cheeks and presses inside of you, joining his body to yours. Blushing furiously, you try to relax your rectum,");
		if(pc.analVirgin) output(" letting him in where nobody has gone before! You whimper as he pushes deeper, his prick exploring your virgin depths.");
		else output(" letting him in with a happy tremble.");
	}
	
	//if a female vaginal virgin or a male anal virgin or a taur anal virgin (as fem taurs get anal pen.)
	if ((useVagina && pc.vaginalVirgin) || (!useVagina && pc.analVirgin)) 
	{
		output("\n\nFyn stops, pulling back with wide eyes. <i>“...I’m sorry, was I your first?”</i> You nod in response, nuzzling into him, and urging him to continue. ");
	}
	else {
		output("\n\n");
	}
	
	output("You gasp as you feel his engorged tip sliding up inside of you, making its way into your belly. Needily, you rock your hips and grind");
	if(useVagina) output(" against his hips and base");
	else output(" your [pc.ass] back against him");
	
	output(", groaning as his stiff rod stirs around and makes its presence felt inside of your");
	
	if(useVagina) output(" sex.");
	else output(" rump.");
	
	if(useVagina)
	{
		pc.cuntChange(vagIdx, chars["FYN"].cockVolume(0), true, true, false);
		pc.loadInCunt(chars["FYN"], vagIdx);
	}
	else 
	{
		pc.buttChange(chars["FYN"].cockVolume(0), true, true, false);
		pc.loadInAss(chars["FYN"]);
	}
	
	output("\n\nYour devilish lover’s muscular hips slap against your");
	if(useVagina) 
	{
		if (pc.hasLegs() && !pc.isNaga()) output(" inner thighs");
		else output(" body");
	}
	else {
		output(" cheeks");
	}
	
	output(". He’s groaning long and low, his own fingers clinging to your");
	
	if(useVagina) output(" back");
	else if(!pc.isTaur()) output(" stomach");
	else output(" animal ass");
	
	output(" as he pulls you as <i>close</i> and <i>hard</i> as he can onto his straining staff.");
	output("\n\nYou blush as you can feel his tip flexing deep inside of you, threatening to spill his seed inside you at any moment, filling you up with his liquid satisfaction. The thought makes you hotter, hornier, and you’re wildly arching and grinding up against him, utterly swallowed by lust. As you feel his final flex, you let out a sweet, shuddering cry and climax on top of his thrusting rod, clinging hard to him as you shiver and shake.");
	
	if(pc.hasCock() && pc.cocks.length == 1) output(" A hot jet of [pc.cumNoun] shoots up and splatters");
	if(pc.hasCock() && pc.cocks.length > 1) output(" Hot jets of [pc.cumNoun] shoot up and splatter");
	
	if(pc.hasCock() && pc.hasBreasts()) output(" the underside of your boobs.");
	if(pc.hasCock() && !pc.hasBreasts()) output(" your chest.");
	
	output(" You feel a slick warmth spreading out inside your");
	
	if(useVagina) output(" [pc.pussyNoun " + vagIdx + "]");
	else output(" ass");
	
	output(" as his cock flexes and clenches. You blush and swoon with delight; he’s cumming inside of you!");
	
	if(useVagina) output(" You bury your face into his neck, pressed sizzlingly close.");
	
	if(!pc.isTaur()) 
	{
		output("\n\nYou feel a stroke against your cheek. Crooning instinctively, you press yourself against his digits, feeling delightedly dazed.");
		if (pc.hasVagina()) output("\n\nThere’s a sweet pressing against your lips - another kiss! You return it instinctively, giddily, like embracing a long-time lover.");
	}
	
	output("\n\n<i>“...I can feel");
	
	if(useVagina) output(" you running down my cock");
	else output(" my heat filling you up");
	
	output(",”</i> Fyn deeply murmurs. You grin; you can <i>also</i> feel his creamy slickness");
	
	if(useVagina) output(" sliding out of where the two of you are joined. Far more, though, is still");
	output(" inside of you, penned in by his half-erect cock and leaving an exquisite warmth.");
	output("\n\nOnce he pulls out, you readjust yourself, feeling utterly dopey and quite flushed. Meanwhile, Fyn has a mischievous, self-satisfied look in his eyes; clearly he relished just ravishing you on the spot!");
	
	fynSexed(1);
	
	processTime(15 + rand(10));
	pc.orgasm();
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function fynSexDoubleD():void {
	clearOutput();
	showFyn(true);
	
	var useVagina:Boolean = false;
	var vagList:Array = [];
	if(pc.hasVagina())
	{
		vagList[0] = rand(pc.totalVaginas());
		if(pc.totalVaginas() > 1)
		{
			vagList[1] = rand(pc.totalVaginas());
			while (vagList[0] == vagList[1])
			{
				vagList[1] = rand(pc.totalVaginas());
			}
		}
		useVagina = true;
	}
	
	if(flags["FYN_SEXED_DOUBLE_DICK"] == undefined) {
		output("Curious, you ask Fyn if he’s able to grow a second dick? An amused look lights his face. Without warning, the dark-haired man shamelessly strips off his pants, leaving you staring at his scarlet manhood. It hangs in a foreskin halfway to his knee.");
	} 
	else {
		output("With flushing cheeks, you ask Fyn if he can do that trick where he grows two dicks again? He flashes you a roguish grin and nods. The dark-haired man then shamelessly strips off his pants, leaving you staring at his scarlet manhood, hanging halfway to his knee.");
	}
	
	output("\n\n<i>“Give me a moment,”</i> he states, closing his eyes in apparent focus. A second protrusion begins to form above his shaft. The lump grows in size and juts outwards, rolling down the length of his already existing cock. It stops short of his crown. It duplicates its shape, leaving him with two huge hanging dicks, one resting on top of the other. <i>“There you go. Interested in double the pleasure?”</i>"); 
	
	if(useVagina && !pc.isTaur()) 
	{
		output("\n\n<i>“Oh, I don’t know, are you?”</i> you grin");
		
		if(!pc.isNude()) {
			if(!(pc.armor is EmptySlot)) output(", sliding your [pc.armor] off. Then you");
			if(!(pc.lowerUndergarment is EmptySlot))
			{
				if(pc.armor is EmptySlot) output(". Then you");
				output(" slide your [pc.lowerUndergarment] to one side and");
			}
			output(" flash him your [pc.pussies].");
		}
		else 
		{
			output(" and gesture down to your [pc.pussies].");
		}
		output(" <i>“Care to use");
		if (vagList.length == 1) output(" this and my ass at the same time");
		else output(" these");
		output("?”</i>");
	}
	//else male or taur
	else
	{
		output("\n\n<i>“Of course! That is, if you think you can handle it?”</i> you tease,");
		if(!pc.isNude()) output(" stripping off and");
		output(" poking your");
		
		if(useVagina) output(" [pc.pussies] and");
		output(" [pc.ass] out teasingly at him.");
	}
	
	output("\n\nFyn grins and strides up, seizing your hips in his powerful hands. Already, you can feel his twin dicks teasingly touching");
	
	if(useVagina && !pc.isTaur()) output(" against your bared sex");
	else output(" between your buttocks");
	output(". The devilish man gives a pointed grind, and you feel his stiffening flesh coax and caress");
	
	if(useVagina) output(" your womanly lips");
	else output(" your crevasse");
	
	output(". A delicious shiver shoots up from your");
	
	if(useVagina) output(" loins");
	else output(" loins");
	
	output(" - the smallest sampling of the pleasure to come.");
	output("\n\n<i>“Suck me,”</i> Fyn commands, standing back. His crimson cocks are at half mast; it seems he wants them at full peak! Dropping to your [pc.knees], you inch towards his magnificent tools, greedily inhaling his musky scent. It’s even more potent with <i>two</i> dicks; you’re rendered positively dizzy by his potent penile aroma. You wrap one hand around his first prick, slowly jerking his foreskin as you kiss and suckle on its twin. The response is immediate: his pricks stiffening and twitching, and you feel a giddy sense of pride. Playing with <i>two</i> is so much more fun than one!");
	output("\n\n<i>“Enjoying yourself down there?”</i> You hear from above, and give a happy little nod. A large palm is rested on your head, giving you an encouraging stroke. You grin and wrap your [pc.lips] around his swelling glans. With little laps, you tease his flexing cockhole, relishing in his rumbling groans. The flavor of his muscular shafts is delicious; you could really suck and tease his twin shafts all day. You shiver as a thick, creamy dollop of pre drools out of the cockhead in your mouth, the other glistening just above your hand. Who said you can’t have your cake and eat it too? You hungrily lap it up, then look up at your double-dicked lover with wide, [pc.eyeColor] eyes for approval. He strokes your cheek, and you nuzzle into it with a muffled purr.");
	output("\n\n<i>“Bend over,”</i> Fyn orders you out of the blue, and you happily obey. Turning around, you raise your rump for him. You moan as his spit-slicked dick sliiiides into your");
	
	if(useVagina) output(" [pc.pussies]");
	else output(" [pc.asshole]");
	
	output(" and up inside of you, filling you in one swift motion. You groan as his powerful hips press flush against your ass. Inside your");
	
	if(useVagina) output(" belly");
	else output(" backside");
	
	output(", you can feel his engorged head flexing and straining against your inner walls. Absolute ecstasy swallows your senses, stirred further by every shift of his");
	
	if(useVagina) output(" pussy-plunged");
	else output(" butt-buried");
	
	output(" manhood.");
	
	if(useVagina) 
	{
		output("\n\nJust when you think it can’t get any better, you feel his <i>other</i> fleshy crown pressing against");
		if(vagList.length == 1) output(" your sensitive cunt");
		else output(" another pair of your sensitive lower lips");
		
		output(". You quiver and moan as he buries both manhoods inside you at once, twitching deliciously in your");
	
		if(vagList.length == 1) output(" [pc.pussyNoun " + vagList[0] + "] and butt");
		else if(pc.matchedVaginas()) output(" own twin pussies");
		else output(" own two pussies");
		
		output(". Ohhhh gooddd... it really <i>is</i> twice the pleasure, just like being double-teamed! You needily push yourself back against his glorious, pleasure-bringing thrusts, your [pc.thighs] quaking and covered in your [pc.girlCumVisc], streaming pussy juices.");
	}
	//male or taur
	else
	{
		output("\n\nJust when you think it can’t get any better, you feel his <i>other</i> fleshy rod sliding up between your [pc.thighs], until it’s resting against your");
		
		if(pc.hasCock()) output(" own [pc.biggestCock]");
		else output(" bare mound");
		output(". With one dick inside of your rump and another frotting, your muscular lover rides your [pc.ass]. Ohhhh gooddd... it really <i>is</i> twice the pleasure! You needily push yourself back against his glorious, pleasure-bringing thrusts, your [pc.thighs] quaking with delight.");
	}
	
	if (vagList.length > 1 && !pc.isTaur())
	{	
		pc.cuntChange(vagList[0], chars["FYN"].cockVolume(0), true, true, false);
		pc.cuntChange(vagList[1], chars["FYN"].cockVolume(0), true, true, false);
		pc.loadInCunt(chars["FYN"], vagList[0]);
		pc.loadInCunt(chars["FYN"], vagList[1]);
	}
	else 
	{
		if(vagList.length == 1)
		{
			pc.cuntChange(vagList[0], chars["FYN"].cockVolume(0), true, true, false);
			pc.loadInCunt(chars["FYN"], vagList[0]);
		}
		pc.buttChange(chars["FYN"].cockVolume(0), true, true, false);
		pc.loadInAss(chars["FYN"]);
	}
	
	output("\n\nWith a loud cry, you utterly cream yourself,");
	
	if(useVagina)
	{
		output(" spilling your [pc.girlCum] all over his");
		if(vagList.length == 1) output(" cock");
		else output(" cocks");
		if(useVagina && pc.hasCock()) output(" and");
	}
	if(pc.hasCock()) output(" shooting hot, sticky spunk all over your [pc.belly]");
	if(!pc.hasVagina() && !pc.hasCock()) output("spasmodically shaking in the throes of your genital-less orgasm");
	
	output(". Your cry is turned to a throaty, primal moan as you feel his hot seed shooting inside of your");
	
	if(useVagina)
	{
		output(" [pc.pussies]");
		if(vagList.length == 1) output(" and [pc.ass]");
		else output(", filling them up");
	}
	if(!pc.hasVagina()) output(" [pc.ass], filling it up");
	
	output(" to the spunk-soaked brim. When he finally pulls out with a loud ‘plop’, you moan and feel him leaking all down your [pc.legs], though much more of his warmth stays inside of you!");
	output("\n\n<i>“You’re right. Twice the pleasure is twice as good,”</i> Fyn grins, cleaning himself off and redressing. You look at his now cloth-covered loins. Some part of you wants even <i>more</i> of his cock, even though you just took two of them!");
	

	fynSexed(1);
	
	flags["FYN_SEXED_DOUBLE_DICK"] = true;
	
	processTime(15 + rand(10));
	pc.orgasm();
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function fynSexOrcRavish():void {
	clearOutput();
	showFyn(true);
	
	if(flags["FYN_TALKED_ABOUT_SAVEWORDS"] == undefined) 
	{
		output("You tell Fyn that you have a rather particular fantasy; one that involves getting forcefully ravished by, well,");
		
		if (pc.isBimbo()) output(" a hulking brute");
		else output(" an orc");
		
		output("! Is that the sort of thing he can do, you ask?");
		output("\n\nThere’s a distinctive glint in Fyn’s eyes, <i>“Of course. I can easily grant that sort of wish. But you know, once I get in character, it’s </i>very<i> hard to snap me out. For all intents and purposes, I </i>will<i> be a lusty");
		
		if (pc.isBimbo()) output(" hulk");
		else output(" orc");
		
		output(" trying to rape you. So we need a safe word.”</i>");
		output("\n\n<i>“A safe word?”</i> You muse, spying a dancing book on the table. <i>“How about... tango?”</i>");
		output("\n\n<i>“Tango will do. Are you sure you want to do this?”</i>");
		output("\n\nYou nod, cheeks burning. It’s always been a fantasy of yours!");
		
		flags["FYN_TALKED_ABOUT_SAVEWORDS"] = true;
	} 
	else if(flags["FYN_SEXED_ORC_RAVISH"] == 1)
	{
		output("You tell Fyn that you have a rather particular fantasy; one that involves getting forcefully ravished by, well,");
		
		if(pc.isBimbo()) output(" a hulking brute");
		else output("an orc");
		
		output("! Is that the sort of thing he can do, you ask?");
		output("\n\nThere’s a distinctive glint in Fyn’s eyes, <i>“Of course. I can easily grant that sort of wish. You remember the safe word, right?”</i>");
		output("\n\nYou nod. <i>“Tango, yeah? Do you think we’ll need it?”</i>");
		output("\n\n<i>“Of course. Once I get in character, I </i>will<i> be a lusty");
		
		if(pc.isBimbo()) output(" hulk");
		else output(" orc");
		
		output(" trying to rape you. Brace yourself, " + pc.mf("man", "woman") + ".”</i>");
		output("\n\nYou nod, cheeks burning. It seems your fantasy is going to come true again!");
	}
	else 
	{
		output("You ask Fyn if he can transform into an orc again and ravish you. With a glint in his eyes, he nods. <i>“Of course. It was a </i>lot<i> of fun last time.”</i>");
	}
	
	output("\n\nThe polymorph strips off his shirt and stands there. He closes his eyes and brings his closed fists to his waist. His head lowers, facial expression covered by his hair. His taut muscles then begin to shift and move. They begin to expand, becoming bulkier and more prominent. His pectorals protrude until they look like they belong on a professional body-builder... or more accurately, some sort of primal, tribal warrior. Similar changes occur down at his abs, arms, and legs, until the muscular man is nearly twice the size he was before - it’s incredible to watch! All of his skin begins to change at once, shifting to an olive green. His dark hair pulls back into his scalp");
	
	if(!pc.isBimbo()) output(", raising the curtain on the two pointed tusks he now has jutting out from his fat lower lip");
	else output(". You are now standing before what is unmistakably");
	
	if(pc.isBimbo()) output(" a sexual behemoth");
	else output(" a bulky behemoth of an orc");
	output(", with a whopping bulge in his torn pants to match.");
	
	output(" He narrows his eyes. A forceful shove. You’re knocked back and sprawling on to the carpet. As you topple ass over head, you let out a surprised shout. W-what’s going on?");
	if(!pc.isNude()) output(" When everything stops moving, you feel the fabric of your clothing being forcibly stripped off.");
	
	output(" You shiver, buck naked and upside down, your [pc.footOrFeet] somewhere near your cheeks! A fierce slap is delivered to your bare buttocks, and you squeal in surprise. It stings—but more than that, it’s embarrassing as hell!"); 
	output("\n\n<i>“Your [pc.skinColor] ass is mine now, bitch,”</i> the");
	
	if(pc.isBimbo()) output(" green");
	else output(" orcish");
	output(" man grunts. His thick, powerful digits squeeze your stinging butt. His property?! You gasp as he suddenly yanks you by your [pc.legs]. You’re left on your back, looking up at his fierce yellow eyes and");
	
	if(pc.isBimbo()) output(" powerful");
	else output(" tusked");
	output(" lips, curled in a snarl. And - oh fuck - you can see his massive green tool now, but it’s pink on top with pearly lumps. <i>“Time to get butt-bred."); 
	if(pc.isBimbo()) output(" Hulk smash puny hole!");
	else output(" For the goddamn horde.");
	output("”</i>");
	
	output("\n\nDespite your protests, you’re pinned down with a powerful hand, helpless as he");
	if(pc.hasLegs() && !pc.isNaga()) output(" spreads your legs and");
	output(" positions himself right at your poor, quivering buttocks. With a forceful press, he pushes himself between your quivering cheeks, worming his massive dick right up until it’s pressing at your twitching pucker. You groan as his contoured cockhead spreads your fleshy ring, insistently pushing inch by inch into your rectum. Fuuuck, he’s so big");
	if(pc.hasVagina()) output(", and he’s not even using your [pc.vaginas]");
	
	output("! You bite your lower lip as he caresses");
	if(pc.hasCock()) output(" your prostate. His massive tool rocks and rubs against your sweet spot, causing your [pc.cocks] to slap instinctively against your stomach!");
	else output(" your bowels with his extremely stiff cock.");
	
	//higher cockVolumn than in Fyn class because of orc transform
	pc.buttChange((chars["FYN"].cockVolume(0) * 4), true, true, false);
	
	output("\n\n<i>“Holding on, slut?”</i> He grunts. You nod, reaching up and clinging to a nearby pillow. Just in time! One powerful thrust of his hips later, and every inch of your parted rump is stuffed with");
	
	if(pc.isBimbo()) output(" cock bigger and greener than a zucchini");
	else output(" orcish cock");
	
	output("! You whimper with delight; as his primal prick stretches your inner rump, pleasure <i>explodes</i> out into every inch of your body. Your [pc.legs] can’t stop shaking! All you can do is moan and squeal as he thoroughly and possessively fucks your [pc.skinColor] butt, breeding you like the bitch you are!");
	output("\n\nWith each lusty thrust of his powerful hips, you feel yourself answering back, needily pressing your posterior towards and onto his turgid rod. His cockhead gets deeper, swells larger, caressing inside of you, driving you wild! You <i>know</i> you’re going to be the first to come; just looking up at his sexy, muscular body thrusting up against and claiming your [pc.ass] is getting your");
	
	if(pc.hasCock()) output(" [pc.cocksLight] hard");
	if(pc.hasCock() && pc.hasVagina()) output(" and your");
	if(pc.hasVagina()) output(" [pc.pussies] wet");
	if(!pc.hasCock() && !pc.hasVagina()) output("gears going");
	
	output(". You moan and relish in his liberal fucking of your [pc.asshole], [pc.thighs] quaking in delight. At last, you can take it no more, as an explosion of sheer bliss sweeps through you sweat-covered body. With a loud cry, you utterly cream yourself on his girthy cock,");
	
	if(pc.hasCock()) output(" shooting your own [pc.cumVisc] spunk all over your [pc.face]");
	if(pc.hasCock() && pc.hasVagina()) output(" and");
	if(pc.hasVagina()) 
	{
		if(pc.isSquirter()) output(" [pc.girlCumNoun] in a [pc.girlCumColor] stream high up in the air");
		else output("drooling [pc.girlCum] down your [pc.clits] and [pc.belly]");
	}
	if(!pc.hasCock() && !pc.hasVagina()) output("clenching the cushion above you");
	
	output(". Your quaking buttocks clench his girthy orchood, and with a guttural cry, you feel him flexing and shooting pure warmth deep inside of your rectum, filling it with his slick spunk.");
	
	output("\n\nWhen he pulls out, you can feel it lewdly rolling out and down your butt-crack and back. You blush furiously, reaching up and spreading your [pc.ass]. Your green-skinned lover takes one look at your parted, cum-smeared pucker and looks riled up again! Grabbing his stiffening rod, he plunges it back into your sloppy hole. Buried once more up to the hilt, he begins slapping enthusiastically against your already worn buttocks. After already cumming, you’re overloaded with such <i>intense</i> sensory feedback - it’s too much for you to handle! You babble and whimper in delight. Rolling back your eyes and drooling down your cheek, you’re a helpless passenger swept up in a storm of pleasure. Your mind is utterly swallowed by the tidal forces, yet your body instinctively bucks back against the rutting beast on its own. You cum <i>again</i>, shivering and twitching, your upper body limp and lower body spasming. It doesn’t stop him! He has his way with you until you have came more times than you can count, and at last, <i>he’s</i> entirely spent!");
	
	pc.buttChange(chars["FYN"].cockVolume(0) * 6, true, true, false);
	pc.loadInAss(chars["FYN"]);
	pc.loadInAss(chars["FYN"]);
	
	output("\n\nWhen you finally come to, you feel something soft beneath you. Your ass is unmistakably sore; even the slightest wiggle makes you wince! At the same time, it’s packed full of gooey warmth. Every inch of your [pc.skinFurScalesNoun] is singing with happiness. You are definitely one well bred slut! A dopey grin crosses your [pc.lips] as you swiftly fall back into slumber... you’re going to need to rest this one off...");
	output("\n\n<b>... A few hours later ...</b>");
	
	output("\n\nThere’s a poking at your cheek. You mumble and wave it away. There’s a rich chuckle. Opening a single eye, you see a scarlet face staring back at you. Fyn? It seems he’s transformed back. You realize you’re on the couch, underneath a blanket. Your polymorph lover is drinking what seems to be a shake of some kind, though there’s a lot of empty plates before him.");
	output("\n\n<i>“You’re awake. Guess we both had quite the recovery time,”</i> he remarks, sipping from the straw. <i>“Your");
	
	if(pc.isNude()) output(" things");
	else output(" clothes");
	
	output(" are there. I didn’t want to wake you. You looked like you needed the rest.”</i>");
	output("\n\nYou thank him, and after you’ve mustered the energy, slip your stuff back on. What a fucking! You rub your butt again, a dopey smile on your face. Geez, you’re still leaking down your [pc.legs]!");
	
	fynSexed(1);
	
	if(flags["FYN_SEXED_ORC_RAVISH"] == undefined) flags["FYN_SEXED_ORC_RAVISH"] = 1;
	else flags["FYN_SEXED_ORC_RAVISH"]++;
	
	processTime(150 + rand(15));
	for(var z:int = 0; z < 7; z++) { pc.orgasm(); }
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

/*Overview
By: Vixen_Vaccine
Title: Santa’s Little Helper
Fetishes: BDSM, Big Dick, Oral, Anal, Cumflation, Gentle Bondage

This route has no “If Male” options, as Fyn is heterosexual. Herm options were added for variety’s sake, but for the most part this is a female-friendly addition. This route should only appear 10 in-game days after last speaking to Fyn. It’s up to you whether or not you’d like Steele to be able to keep the holiday lingerie, but if you do:

Item Stats
Festive Bra (Red and Green)
A traditional satin bra in dark green, cheerfully decorated with dancing candy canes.
Sexiness: +2
Item Type: Upper Undergarment
Quantity: 1
Price: 500 Credits

Festive Panties (Red and Green)
A pair of traditional panties in dark green, cheerfully decorated with dancing candy canes.
Sexiness: +2
Item Type: Lower Undergarment
Quantity: 1
Price: 500 Credits

Festive Stockings (Green)
A pair of traditional nanoweave fishnet stockings in dark green, with alternating stripes of red and white running diagonally across the legs like candy canes.
Sexiness: +3
Item Type: Lower Undergarment
Quantity: 1
Price: 1000 Credits  

Festive Hat (Green)
A traditional dark green elf hat, with red trimming around the edges. Perfect for holiday roleplaying.
Item Type: Head
Quantity: 1
Price: 100 Credits

[Beginning conversation/Event]

Meeting Fyn in his apartment on Tavros, player selects “Vildarii” in the chat options and talks to him about his race. 
New option appears in Sex category: “Transform?”
*/
//Vanilla sex is still a clickable option, as well as these; Deck My Halls, Eat My Cookie, Suck My Candy Cane, and Show Me The South Pole.

//"Transform?" [Ask Fyn for a little fun in the bedroom.]
public function fynTransformSex():void
{
	clearOutput();
	showFyn();
	author("Vixen_Vaccine");
	output("<i>“Oh, you’d like to switch it up a little? What do you have in mind?”</i> His fiery eyes rove across your body, drinking in your [pc.hips] and [pc.belly].");
	output("\n\nYou hesitate for just a moment before sidling up to him, running your fingers across his muscular stomach and gazing into his fiery red eyes. A low growl emanates from his chest when you tell him what you want.");
	output("\n\n<i>“In the holiday spirit, are we?”</i> he remarks, bringing his hand up to run across your [pc.hair]. You wrap your arms around his shoulders, compelling him to gaze into your eyes.");
	clearMenu();
	if(pc.hasVagina()) 
	{
		addButton(0,"EatMyCookie",eatMyCookieDuuuuude,undefined,"Eat My Cookie","Ask him to lick your pussy.");
		addButton(1,"DeckMyHalls",deckMyHalls,undefined,"Deck My Halls","Ask him to fuck you like the bad little elf you are.");
	}
	else 
	{
		addDisabledButton(0,"EatMyCookie","Eat My Cookie","Doing this would require you to have a vagina.");
		addDisabledButton(1,"DeckMyHalls","Deck My Halls","You need a vagina that he could fuck for this.");
	}
	if(pc.isHerm()) 
	{
		addButton(2,"Get Reamed",showMeTheSouthPole,undefined,"Show Me The South Pole","Ask him to ream your backdoor.");
		addButton(3,"SuckMyCane",ifHermCandySuck,undefined,"Suck My Cane","Ask him to service your cock.");
	}
	else 
	{
		addDisabledButton(2,"Get Reamed","Get Reamed","This act requires you to have both sexes’ genitals.");
		addDisabledButton(3,"SuckMyCane","Suck My Cane","Fyn would prefer you to have a vagina and penis to play with for this.");
	}
	addButton(14,"Leave",leaveChristmasBehind);
}

//IF FEMALE:
//<i>“Deck my halls”</i> [Ask him to fuck you like the bad little elf you are]
public function deckMyHalls():void
{
	clearOutput();
	showFyn();
	author("Vixen_Vaccine");
	output("<i>“I want you to transform into Santa and fuck me, Fyn. I’ve been a bad little elf,”</i> you murmur in his pointed ear, continuing to slowly run your hands up and down his arms. He groans as you tense your fingers and start to lightly scratch his arms in circles, the bumps on his vermillion skin raising in response to your touch. His eyes close, content to let you brush your nails against his bare skin for a few moments as he considers your request.");
	output("\n\n<i>“It’ll take a lot of energy, but... Let’s see what I can do,”</i> he finally says, taking your hand in his and guiding you towards his bedroom. <i>“We’ll need a few things first. Wait here,”</i> he adds as he lets go of your hand and walks over to the right of his bed, opening the door to a closet you hadn’t noticed before.");
	output("\n\nHe digs around in a drawer for a few moments before pulling out a few tiny pieces of cloth and handing them to you. <i>“Good thing I remembered to save these for a snowy day,”</i> he grins as you hold them up for inspection.");
	output("\n\nIt’s lingerie alright. Red and white candy canes decorate the green bra and panties you’ve been given. A little dark green hat with matching stockings complete the ensemble. When you look up, you notice he’s already found a santa hat, which he places on top of his head with a flourish. He smiles as you giggle at his theatrics, and you watch with fascination as his whole body begins to transform right in front of your eyes.");
	output("\n\nLaying sideways on the bed, he puts on a show for you, playfully tousling his long raven hair as it coils and lightens until he’s left with a mop of curly gray locks. You watch in barely concealed fascination when he runs his fingers over his dark, serious brows and they lighten to gray at his touch. He gets on his knees on the bed and turns away from you, playfully wiggling his hips behind him, and as though performing for a crowd, he slowly turns back toward you, and you gasp as you see that he’s grown a full, curly beard, complete with a thick mustache.");
	output("\n\nHe winks at you, and when his eye opens you see that it’s no longer the fiery red color you’re accustomed to, but dark blue, with round pupils like that of a terran man. He makes a show of wiping his other eye, and when he gazes back at you playfully you can see that his eyes now match, dark pools of mischief that match the rest of his face.");
	output("\n\nAs he stretches his body back across the bed, his arms become larger, the muscles more defined, and his broad chest and stomach become bigger as well until he’s everything you wished for Christmas; Santa himself, albeit far sexier than you could’ve imagined.");
	output("\n\nWith a wave of his finger, he motions for you to put on your costume as well. <i>“Go on. I’ll be waiting,”</i> he smirks at you as you blush. You look down at the tiny garments and smile. This is going to be the most fun you’ve had in a long time.");

	processTime(15);
	pc.changeLust(15);
	clearMenu();
	addButton(0,"Next",deckMyHalls2);
}

public function deckMyHalls2():void
{
	clearOutput();
	showFyn(true);
	author("Vixen_Vaccine");
	output("A few minutes later, you come out of the bathroom wearing the ensemble he gave you. Stockings, clipped to your waist-high panties by candy cane garters, flatter your figure, and the matching bra pushes your [pc.breasts] up enticingly. You adjust the little elf hat on top of your head as you walk into the bedroom where Fyn is already waiting.");
	output("\n\nWith a small smile, you notice that he’s put on some Christmas music to help set the mood. Jingle bells ring lightly in the background as you gaze around the room. The window behind his bed, which normally displays the stars visible from the station, is now a scene straight from a terran winter of snow falling at night. A fire crackles on an adjacent tv, the sparks lighting the dim room in soft bursts of yellow light.");
	output("\n\nFyn’s blue eyes flare with desire as he drinks you in, the bulge in his pants enlarging considerably as he lays on the bed. You note that this package appears to be much bigger than usual, but you hope that his transformation didn’t make him too big for you.");
	output("\n\nTossing all doubts and misgivings aside, you swing your [pc.hips] seductively as you make your way to him. He waits, watching you, as you crawl over the massive king-size bed to him. You gaze into his blue eyes, so warm and inviting that you can’t help but shiver in anticipation for the things he’s going to do to you.");
	output("\n\nThe snick of his zipper sliding down breaks the brief silence that settled between you. You draw in a long, deep breath to steady your nerves as he slowly removes his pants, revealing his large, semi-erect member. Precum glistens on the large, bulbous tip, and veins pulse gently along his turgid length. It looks as though it could easily fill your stocking and then some.");
	output("\n\n<i>“Your getup suits you,”</i> he comments, eyes narrowing as his gaze travels down across your face and down your body, admiring the costume. <i>“But I think it’d look better on the floor.”</i>");
	output("\n\nYou take that as an instruction and begin slipping one of your bra straps down. <i>“Wait,”</i> he says, quickly wrapping his large hand over your wrist. <i>“Let Santa do the work.”</i>");
	output("\n\nHe gets up from his position on the bed and moves around you until he’s behind you, his large, warm chest pressed against your skin and his breath tickling the back of your neck.");
	output("\n\n<i>“So you want to be Santa’s little helper?”</i> he teases as his hands travel across your shoulders and down your sides. You nod your head vigorously as his hands move over your [pc.hips], pausing near your nethers before moving back up over your stomach.");
	output("\n\nWith a quick, well-practiced motion, he unclips your bra and slides it down, releasing your [pc.breasts]. His breathing becomes more ragged when his hands take hold of the mounds of your chest, squeezing your nipples roughly with strong, sure movements.");
	output("\n\nYou sigh as you lean back into him, your hands reaching up to guide his over your body as you arch your hips and grind against his engorged cock. His breath lowers to a growl and he pulls your hands away from your body.");
	output("\n\n<i>“Bad elves don’t decide where Santa puts his hands. On your back,”</i> he instructs, moving to the side so that you can lean back to lay on the bed. <i>“Arms up,”</i> he tells you, and you immediately oblige, wanting nothing more than to please him.");
	output("\n\nAs Fyn reaches over you, you realize with a start that he’s planning on putting those silk ropes you noticed earlier to good use. You close your eyes and shiver excitedly as he asks you to give him your hand, which you eagerly do.");

	//[Lust: 30]
	processTime(20);
	pc.changeLust(30);
	clearMenu();
	addButton(0,"Next",deckMyHalls3);
}

public function deckMyHalls3():void
{
	clearOutput();
	showFyn(true);
	author("Vixen_Vaccine");
	output("With a few quick knots, he ties your hand securely to the headboard, and when he reaches around to tie up the other one, your hand is already in place. You hear a low rumble emanating from his chest as he chuckles at your enthusiasm, and once he ties off the last knot, you feel warmth spread over your lips as he kisses you deep and hard. You keep your eyes closed and you push your head forward, exploring the plumpness of his lips and reveling in the taste of his tongue in your mouth.");
	output("\n\nHe straddles your hips and you blissfully stretch out your body as his hands explore every inch of you, roaming over your [pc.breasts] and massaging your trembling flesh until you’re left flushed and sensitive. You groan in unconcealed lust as he bites your lip, but he shushes your vocalizations with his tongue once more.");
	output("\n\nYou feel goosebumps rise on your skin as his hands travel lightly down towards the wetness between your thighs, but you whine quietly when he stops himself. He moves down your body, planting kisses over your stomach and licking his way over your hips and down your quivering thighs.");
	output("\n\nWith deliberate slowness, he hooks two fingers under your candy cane panties and pulls them down. They come off easily, and the soft rustling of the fabric sliding over your stockings is the only sound you can hear over the pounding of your heart as he gazes at you, tied up and vulnerable before him.");
	output("\n\nYou open your eyes and watch as his fingers hover over your slit, then shudder as you feel his digits penetrate your dribbling cunt. You beg him to quit teasing and just ravish you like the naughty little elf you are, but it’s clear that he has other plans.");
	output("\n\n<i>“Who’s my little ho-ho-hoe?”</i> he asks playfully as he slowly begins thrusting his fingers methodically in and out of your wetness. Your heart races and your fingers dig into the soft silken sheets in response to his rhythmic fingerfucking. <i>“I am,”</i> you breathe, your mind lost in ecstasy.");
	output("\n\n<i>“What’s that? I can’t hear you,”</i> he says, pausing his assault on your pussy. You shudder and arch your back, grinding your hips against his hand. <i>“I’m your naughty little hoe! Oh god Fyn, please let me cum!”</i>");
	output("\n\nHe doubles up the pace, adding another finger, and then another, until he’s all but fisting your slavering pussy. You buck and flex your hips in response to his thrusts, your eyes rolling to the back of your head from the delirium that quickly overtakes you. Warmth pools in your core as you feel yourself coming closer and closer to orgasm, your thighs twitching more and more the closer you come.");
	output("\n\n<i>“Stuff your big, hard coal into my little stocking! Oh, Santa, please”</i> you beg. Your taunts seem to spur him to action, and he gets on his knees and pulls your hips forward, lining his massive cock up to your moist slit.");
	output("\n\nWithout preamble, he pushes into you, rapidly filling your fuckhole with his meaty pole and driving the breath from your lungs. When he transformed into Santa, every part of him got bigger - including his massive cock. It’s so big you feel like it could split you in two, and you can feel your walls slowly expand to accommodate for the reaming it’s about to get.");
	pc.cuntChange(0,chars["FYN"].cockVolume(0)*1.5);
	output("\n\n<i>“Oh yeah,”</i> he sighs, <i>“Take Santa’s package.”</i> You flex your hips toward his when he pushes into you, sinking into a mindless rhythm as he dominates your box.");
	output("\n\nHe pounds faster and harder, his breath coming in ragged pants as he rams his dick deeper and deeper into your depths until it feels like he’s thrusting into your womb.");
	output("\n\nYou’re on the brink yourself, tugging limply at your restraints. At some point your mind goes blank, the warmth in your loins spreading through you as you come deliriously close to orgasm. You wish your hands could be free to touch him, to rub your clit, anything that would let you cum, but it’s clear that he wants you to edge towards bliss with him.");
	output("\n\nHe re-adjusts his grip on you, pulling your legs straight up and over his large, muscular shoulders. You gasp as you can feel his enormous manhood ream you at a deeper angle, his jingle balls bouncing against your bare backside and the ridges on his inflated dick rubbing deliciously against your slick inner walls.");
	output("\n\n<i>“Are you gonna”</i> you pant, <i>“Are you gonna cum down my chimney?”</i> You expect him to laugh, but he growls and his thrusting becomes erratic, his fingers digging into your supple flesh while he struggles not to cum.");
	output("\n\nHe releases a heavy breath, one hand coming down to rub your mound while his dick continues ravishing your sopping wet fuckhole. With each schlick of his tool beating into your Christmas pudding, you feel your impending orgasm rising as his hand rubs your clit in firm, circular motions and fans the coiling, twisting fire in your belly.");
	output("\n\nUnable to resist the sensation of both his immense cock ramming against your G-spot and his fingers deftly swirling over your clit, you cry out as your box clamps down on his hefty pole, spurting your cream all over the bed.");
	output("\n\n<i>“Santa’s coming to town!”</i> He yells as your twitching pussy drives him over the edge. You can feel his thick shaft throb as he cums, filling you to capacity. You arch your back and moan, feeling his massive, inhuman cock pump his ivory eggnog into the deepest parts of your trembling pussy.");
	output("\n\nFyn holds you close while you both cum, lost in the tingling pulses of your tandem orgasm. He cums so much that you can feel your belly distend from the sheer volume of his ejaculate, but trapped as you are underneath his large frame, it’s all you can do to ride out the waves of bliss as your slit clenches weakly around him.");

	//[Lust reduces to 0]
	processTime(25);
	pc.orgasm();
	pc.loadInCunt(chars["FYN"],0);
	clearMenu();
	addButton(0,"Next",deckMyHalls4);
}

public function deckMyHalls4():void
{
	clearOutput();
	showFyn(true);
	author("Vixen_Vaccine");
	output("When he rises, his dick slowly pulls out of you with a wet plop, and thin rivulets of his seed flow out of your cum-packed slit to mix with your cream on the bed.");
	output("\n\n<i>“I’m definitely going to have to spend some time cleaning up,”</i> he says, raising an eyebrow at you. <i>“But in the end I suppose you are a good little elf after all.”</i>");
	output("\n\nYour legs shake when you stand up to walk back towards the bathroom and change back into your things.");
	output("\n\nHe gives you a firm but gentle kiss when you exit the bedroom, and slaps your ass on the way out.");
	processTime(10);
	fynSexed(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//<i>“Eat My Cookie”</i> [Ask him to lick your pussy]
public function eatMyCookieDuuuuude():void
{
	clearOutput();
	showFyn();
	author("Vixen_Vaccine");
	output("<i>“I want you to eat me out,”</i> you say, running one finger across his chest. He licks his lips at the mention of tasting your pussy, and nods at your request.");
	output("\n\n<i>“I might be able to arrange something,”</i> he says, quickly grabbing your hand and leading you towards his bedroom. <i>“Did you have any ideas for what you’d like me to turn into? I can change my appearance,”</i> he says, winking one red eye and turning it blue. You giggle and mention that you’d like to try roleplaying as an elf, and that you’d like to see him as Santa.");
	output("\n\n<i>“Just wait here a minute,”</i> he grins at you, both of his eyes now flashing a bright blue. He turns toward his closet and starts rummaging around through piles of costumes and clothing, searching for something. At one point he finds a santa hat, which he puts on before continuing the search.");
	output("\n\nAfter a few moments, he turns back around and hands you an outfit, which you hold aloft for inspection. Red and white candy canes decorate the green bra and panties you’ve been given, and a little dark green hat with matching stockings complete the ensemble.");
	output("\n\nWhen you look up, you notice he’s already climbed into bed, and he cocks an eyebrow at you as you watch his hair begin to change color. He smiles at you, and you watch with fascination when his whole body begins to transform right in front of your eyes.");
	output("\n\nLaying sideways on the bed, he puts on a show for you, playfully tousling his long raven hair as it coils and lightens until he’s left with a mop of curly gray locks. You watch in barely concealed fascination when he runs his fingers over his dark, serious brows and they lighten to gray at his touch. He gets on his knees on the bed and turns away from you, playfully wiggling his hips behind him, and as though performing for a crowd, he slowly turns back toward you, and you gasp as you see that he’s grown a full, curly beard, complete with a thick mustache.");
	output("\n\nAs he stretches his body back across the bed, his arms become larger, the muscles more defined, and his broad chest and stomach become bigger as well until he’s everything you wished for Christmas; Santa himself, albeit far sexier than you could’ve imagined.");
	output("\n\nWith a wave of his finger, he motions for you to put on your costume as well. <i>“Go on. I’ll be waiting,”</i> he smirks at you as you blush. You look down at the tiny garments and smile. This is going to be the most fun you’ve had in a long time.");
	//[Lust: 15]
	processTime(15);
	pc.changeLust(15);
	clearMenu();
	addButton(0,"Next",eatMyCookieDuuuuude2);
}

public function eatMyCookieDuuuuude2():void
{
	clearOutput();
	showFyn(true);
	author("Vixen_Vaccine");
	output("You don’t even hesitate when you come out of the bathroom wearing the clothes he gave you. He grins devilishly as you saunter up to the bed, and you don’t struggle when he grabs you and pulls you in with him.");
	output("\n\nHe lifts himself up with his hands and leans over you, kissing you and licking all around your lips and leaving you mesmerized by the heady taste of him.");
	output("\n\nWarm hands close over your knees, guiding them as he spreads your legs. He pauses. <i>“Santa notices that you’ve been very good this year.”</i> He runs his fingers from where the insides of your thighs touch to your knees, lightly pinching your stockinged legs here and there and making you gasp. <i>“And you definitely deserve some kind of reward.”</i>");
	output("\n\nLowering his head, he begins licking and sucking on your hips, stopping to pause every few seconds and making your back arch in expectation and desire.");
	output("\n\nWith infinite patience, Fyn tugs the corner of your panties until he’s left gazing at the glory of your glistening cunt. He grins mischievously at you, his sky blue eyes connecting with yours. His large Santa beard tickles your face as he tenderly kisses you before moving down to between your thighs, affectionately nuzzling the entrance of your [pc.pussy].");
	output("\n\nYou groan in anticipation as you feel Fyn’s hot breath hover inches away from your slit. His hands run over your [pc.skin], exploring how well the straps and belts of your elf outfit suit you. You let out a sultry moan as he opens his luscious mouth, running the tip of his tongue down your gash.");
	output("\n\n<i>“This is the best cookie I’ve ever tasted,”</i> he breathes, digging his delicate tongue deeper into your trembling honey-pot, his hands sliding along your navel and over your stockings. Fyn steadily intensifies his rhythmic motions, his narrow tongue unravelling the petals of your pink flower.");
	output("\n\nDigging hungrily along your labia, Fyn transitions into wide, passionate licks as he slides his tongue along your [pc.clit]. You groan as your big muscular Santa works his Christmas magic over your sopping wet cunt.");
	output("\n\nAfter a few intense circuits, the Vildarii man slips two thick fingers inside your pussy, then three. He curls them one by one inside of you, rhythmically massaging your g-spot as he showers your clit in sloppy kisses.");
	output("\n\nHe sucks at your pleasure zone with his lips as he collects your viscous girlcum around his soaking digits. You grab Fyn’s head, your legs quivering in the air as the both of you writhe in pleasure. His unoccupied hand moves down to stroke his own turgid erection.");
	output("\n\nThe both of you moan in ecstasy as the sexy Santa hotly services your pussy. You watch as he shudders between your legs, his muscles straining as he pumps his dick in time with his tongue, desperately worshipping your cunt while he gets himself off. You can feel heat coiling in your core as you edge closer to the inevitable orgasm, the steady rhythm of Fyn’s ministrations pushing you over the edge into mind-blowing oblivion.");
	output("\n\nHe continues sucking on your engorged clit while he fingers your slit, and you completely lose control, crying out his name as your cunt clamps down on his fingers in a rush of orgasmic bliss.");
	output("\n\nYou whimper and moan as shudders continue to wrack your body, and he hungrily swallows the rush of girlcum that flows into his mouth. He quickly gets up onto his knees and cums a moment later, the veins on his cock bulging as he follows you in orgasm. He groans, his hands continuing to stroke his large terran cock as it pumps arc after arc of cum onto your stomach and breasts.");
	processTime(15);
	pc.orgasm();
	pc.applyCumSoaked();
	clearMenu();
	addButton(0,"Next",eatMyCookieDuuuuude3);
}

public function eatMyCookieDuuuuude3():void
{
	clearOutput();
	showFyn(true);
	author("Vixen_Vaccine");
	output("As you come down from your own blissful high, you open your eyes and notice that his have changed back to their normal glowing red. He grins at you and you smile back before he scoops some of his cum onto one of his fingers before feeding it to you.");
	output("\n\nHe thoroughly cleans the cum off of you with his hands, and you lick them spotless when he offers them to your lips. <i>“You’re such a dirty little elf, aren’t you?”</i> he teases, his hands finally resting on your stomach as he gazes at you lovingly.");
	output("\n\nYou agree, sighing happily when he crawls up to cuddle against you, wrapping his strong arms around your middle and pulling you closer before the both of you drift off into a peaceful nap.");
	pc.removeStatusEffect("Cum Soaked");
	processTime(20);
	pc.loadInMouth(chars["FYN"]);
	fynSexed(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//IF HERM:
//<i>“Suck my candy cane”</i> [Ask him to service your cock]
public function ifHermCandySuck():void
{
	clearOutput();
	showFyn(true);
	author("Vixen_Vaccine");
	output("<i>“Would you,”</i> you hesitate, gazing up at him. <i>“Suck my candy?”</i> He looks down at you, surprise quickly passing over his face before settling into a wide grin.");
	output("\n\n<i>“For you? Anything,”</i> he says, taking your hand in his and guiding you back towards his bedroom. <i>“I’m not typically prone to working with your... endowments. But for you I’ll make an exception,”</i> he laughs, smiling back at you. You follow him, giddy at the prospect of his delicate hands roving over your body.");
	output("\n\n<i>“Did you have any ideas for what you’d like me to turn into? I can change my appearance,”</i> he says, winking one red eye and turning it blue. You giggle and mention that you’d like to try roleplaying as a naughty elf, and that you’d like to see him as Santa.");
	output("\n\n<i>“Just wait here a minute,”</i> he grins at you, both of his eyes now flashing a bright blue. He turns toward his closet and starts rummaging around through piles of costumes and clothing, searching for something. At one point he finds a santa hat, which he puts on before continuing the search.");
	output("\n\nAfter a few moments, he turns back around and hands you an outfit, which you hold aloft for inspection. Red and white candy canes decorate the green bra and panties you’ve been given, and a little dark green hat with matching stockings complete the ensemble.");
	output("\n\nWhen you look up, you notice he’s already climbed into bed, and he cocks an eyebrow at you as you watch his hair begin to change color. He smiles at you, and you watch with fascination when his whole body begins to transform right in front of your eyes.");
	output("\n\nLaying sideways on the bed, he puts on a show for you, playfully tousling his long raven hair as it coils and lightens until he’s left with a mop of curly gray locks. You watch in barely concealed fascination when he runs his fingers over his dark, serious brows and they lighten to gray at his touch. He gets on his knees on the bed and turns away from you, playfully wiggling his hips behind him, and as though performing for a crowd, he slowly turns back toward you, and you gasp as you see that he’s grown a white, curly beard, complete with a thick mustache.");
	output("\n\nAs he stretches his body back across the bed, his arms become larger, the muscles more defined, and his broad chest and stomach become bigger as well until he’s everything you wished for Christmas; Santa himself, albeit far sexier than you could’ve imagined.");
	output("\n\nWith a wave of his finger, he motions for you to put on your costume as well. <i>“Go on. I’ll be waiting,”</i> he smirks at you as you blush. You look down at the tiny garments and smile. This is going to be the most fun you’ve had in a long time.");
	processTime(15);
	clearMenu();
	addButton(0,"Next",ifHermCandySuck2);
}

public function ifHermCandySuck2():void
{
	clearOutput();
	showFyn(true);
	author("Vixen_Vaccine");
	output("You don’t even hesitate when you come out of the bathroom wearing the clothes he gave you. Your bulge shows underneath the skimpy outfit, but he grins devilishly as you saunter up to the bed. You don’t resist him when he grabs you and pulls you into bed.");
	output("\n\nHe lifts himself up with his hands and leans over you, kissing you and licking all around your lips and leaving you mesmerized by the heady taste of him.");
	output("\n\nWarm hands close over your knees, guiding them as he spreads your legs. He pauses. <i>“Santa notices that you’ve been very good this year.”</i> He runs his fingers from where the insides of your thighs touch to your knees, lightly pinching your stockinged legs here and there and making you gasp. <i>“And you definitely deserve some kind of reward.”</i>");
	output("\n\nLowering his head, he begins licking and sucking on your hips, stopping to pause every few seconds and making your back arch in expectation and desire.");
	output("\n\nWith infinite patience, Fyn tugs the corner of your panties until your [pc.cock] springs free, erect and expectant. He grins mischievously at you, his sky blue eyes connecting with yours. His large Santa beard tickles your face as he tenderly kisses you before moving down to between your thighs, experimentally licking the tip of your pole. You can feel your pussy slicken as you become more aroused by the touch of his lips on your member.");
	output("\n\nYou groan in anticipation as you feel Fyn’s hot breath hover over the head of your [pc.cock]. His hands run over your [pc.skin], exploring how well the straps and belts of your elf outfit suit you. You let out a sultry moan as he opens his luscious mouth, running the tip of his tongue down your shaft to your slit, where he eagerly tastes your [pc.cunt].");
	output("\n\n<i>“I love the way you taste,”</i> he breathes, digging his delicate tongue deeper into your trembling honey-pot, one hand sliding along your navel while the other slowly pumps your dick. Fyn steadily intensifies his rhythmic motions, his narrow tongue unravelling the seams of your pink flower as his hand twists and jerks you off.");
	output("\n\nDigging hungrily along your labia, Fyn transitions into wide, passionate licks as he slides his tongue along your clit. You groan as your big muscular Santa works his Christmas magic over your sopping wet cunt.");
	output("\n\nAfter a few intense circuits, the Vildarii man stops his assault on your slit and licks his way back up your shaft. You moan when he takes it into his sloppy, wet mouth, his mustache faintly tickling your skin.");
	output("\n\nHe sucks your [pc.cock] with his lips and you can feel him run his tongue in circles over the head of your thick pole. You grab Fyn’s head with your hands, your legs quivering as you begin to fuck his face. Giving you full control over his head, his unoccupied hand moves down to stroke his own turgid erection.");
	output("\n\nYou moan in ecstasy as you fuck Fyn’s face, starting with slow and shallow pumps but gradually increasing in depth and intensity. You watch his face and listen to the slurping sounds he makes as he struggles to open his throat to take your [pc.cock] all the way down. His muscles strain as he pumps his dick in time with yours, desperately worshipping your pole while he gets himself off.");
	output("\n\nYou catch your breath when he begins fingering your slit while you brutally fuck his face, inserting two, then three digits. You can feel heat coiling in your core as you edge closer to the inevitable orgasm, the steady rhythm of Fyn’s ministrations pushing you over the edge into mind-blowing oblivion.");
	output("\n\n<i>“Santa, I’m gonna cum,”</i> you pant, fucking his throat with deep, desperate thrusts. He gargles in response, his fingers forcefully fucking your pussy while you use his throat like a fuck toy.");
	output("\n\nHe continues sucking on your engorged [pc.cock] while he fingers your slit, and you completely lose control, crying out his name as your [pc.cunt] clamps down on his fingers. Your cock twitches and throbs as it shoots its load down his throat in a rush of orgasmic bliss.");
	output("\n\nYou whimper and moan as shudders continue to wrack your body, and he hungrily swallows the flood of [pc.cum] that flows down his throat. He quickly gets up onto his knees and cums a moment later, the veins on his cock bulging as he follows you in orgasm. He groans, his hands continuing to stroke his large terran cock as it pumps arc after arc of cum onto your stomach and breasts.");
	processTime(30);
	pc.orgasm();
	pc.applyCumSoaked();
	clearMenu();
	addButton(0,"Next",ifHermCandySuck3);
}

public function ifHermCandySuck3():void
{
	clearOutput();
	showFyn(true);
	author("Vixen_Vaccine");
	output("As you come down from your own blissful high, you open your eyes and notice that his have changed back to their normal glowing red. He grins at you and you smile back before he scoops some of his cum onto one of his fingers before feeding it to you.");
	output("\n\nHe thoroughly cleans the cum off of you with his hands, and you lick them spotless when he offers them to your lips. <i>“You’re such a dirty little elf, aren’t you?”</i> he teases, his hands finally resting on your stomach as he gazes at you lovingly.");
	output("\n\nYou agree, sighing happily when he crawls up to cuddle against you, wrapping his strong arms around your middle and pulling you closer before the both of you drift off into a peaceful nap.");

	pc.removeStatusEffect("Cum Soaked");
	pc.loadInMouth(chars["FYN"]);
	processTime(20);
	fynSexed(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//<i>“Show Me The South Pole”</i> [Ask him to ream your backdoor]
public function showMeTheSouthPole():void
{
	clearOutput();
	showFyn();
	author("Vixen_Vaccine");
	output("<i>“I want you to transform into Santa and fuck me in the ass, Fyn. I’ve been a bad little elf,”</i> you murmur in his pointed ear, continuing to slowly run your hands up and down his arms. He groans as you tense your fingers and start to lightly scratch his arms in circles, the bumps on his vermillion skin raising in response to your touch. His eyes close, content to let you brush your nails against his bare skin for a few moments as he considers your request.");
	output("\n\n<i>“It’ll take a lot of energy, but... Let’s see what I can do,”</i> he finally says, taking your hand in his and guiding you towards his bedroom. <i>“We’ll need a few things first. Wait here,”</i> he adds as he lets go of your hand and walks over to the right of his bed, opening the door to a closet you hadn’t noticed before.");
	output("\n\nHe digs around in a drawer for a few moments before pulling out a few tiny pieces of cloth and handing them to you. <i>“Good thing I remembered to save these for a snowy day,”</i> he grins as you hold them up for inspection.");
	output("\n\nIt’s lingerie alright. Red and white candy canes decorate the green bra and panties you’ve been given. A little dark green hat with matching stockings complete the ensemble. When you look up, you notice he’s already found a santa hat, which he places on top of his head with a flourish. He smiles as you giggle at his theatrics, and you watch with fascination as his whole body begins to transform right in front of your eyes.");
	output("\n\nLaying sideways on the bed, he puts on a show for you, playfully tousling his long raven hair as it coils and lightens until he’s left with a mop of curly gray locks. You watch in barely concealed fascination when he runs his fingers over his dark, serious brows and they lighten to gray at his touch. He gets on his knees on the bed and turns away from you, playfully wiggling his hips behind him, and as though performing for a crowd, he slowly turns back toward you, and you gasp as you see that he’s grown a white, curly beard, complete with a thick mustache.");
	output("\n\nHe winks at you, and when his eye opens you see that it’s no longer the fiery red color you’re accustomed to, but dark blue, with round pupils like that of a terran man. He makes a show of wiping his other eye, and when he gazes back at you playfully you can see that his eyes now match, dark pools of mischief that match the rest of his face.");
	output("\n\nAs he stretches his body back across the bed, his arms become larger, the muscles more defined, and his broad chest and stomach become bigger as well until he’s everything you wished for Christmas; Santa himself, albeit far sexier than you could’ve imagined.");
	output("\n\nWith a wave of his finger, he motions for you to put on your costume as well. <i>“Go on. I’ll be waiting,”</i> he smirks at you as you blush. You look down at the tiny garments and smile. This is going to be the most fun you’ve had in a long time.");
	//[Lust: 15]
	processTime(15);
	pc.changeLust(15);
	clearMenu();
	addButton(0,"Next",showMeTheSouthPole2);
}

public function showMeTheSouthPole2():void
{
	clearOutput();
	showFyn(true);
	author("Vixen_Vaccine");
	output("A few minutes later, you come out of the bathroom wearing the ensemble he gave you. Stockings, clipped to your waist-high panties by candy cane garters, flatter your figure, and the matching bra pushes your [pc.breasts] up enticingly. You adjust the little elf hat on top of your head as you walk into the bedroom where Fyn is already waiting.");
	output("\n\nWith a small smile, you notice that he’s put on some Christmas music to help set the mood. Jingle bells ring lightly in the background as you gaze around the room. The window behind his bed, which normally displays the stars visible from the station, is now a scene straight from a terran winter of snow falling at night. A fire crackles on an adjacent tv, the sparks lighting the dim room in soft bursts of yellow light.");
	output("\n\nFyn’s blue eyes flare with desire as he drinks you in, the bulge in his pants enlarging considerably as he lays on the bed. You note that this package appears to be much bigger than usual, but you hope that his transformation didn’t make him too big for you.");
	output("\n\nTossing all doubts and misgivings aside, you swing your hips seductively as you make your way to him. He waits, watching you, as you crawl over the massive king-size bed to him. You gaze into his blue eyes, so warm and inviting that you can’t help but shiver in anticipation for the things he’s going to do to your backdoor.");
	output("\n\nThe snick of his zipper sliding down breaks the brief silence that settled between you. You draw in a long, deep breath to steady your nerves as he slowly removes his pants, revealing his large, semi-erect member. Precum glistens on the large, bulbous tip, and veins pulse gently along his turgid length. It looks as though it could easily fill your stocking and then some.");
	output("\n\n<i>“Your getup suits you,”</i> he comments, eyes narrowing as his gaze travels down across your face and down your body, admiring the costume. <i>“But I think it’d look better on the floor.”</i>");
	output("\n\nYou take that as an instruction and begin slipping one of your bra straps down. <i>“Wait,”</i> he says, quickly wrapping his large hand over your wrist. <i>“Let Santa do the work.”</i>");
	output("\n\nHe gets up from his position on the bed and moves around you until he’s behind you, his large, warm chest pressed against your skin and his breath tickling the back of your neck.");
	output("\n\n<i>“So you want to be Santa’s little helper?”</i> he teases as his hands travel across your shoulders and down your sides. You nod your head vigorously as his hands move over your [pc.hips], pausing near your nethers before moving back up over your [pc.stomach].");
	output("\n\nWith a quick, well-practiced motion, he unclips your bra and slides it down, releasing your [pc.breasts]. His breathing becomes more ragged when his hands take hold of the mounds of your chest, squeezing your nipples roughly with strong, sure movements.");
	output("\n\nYou sigh as you lean back into him, your hands reaching up to guide his over your body as you arch your hips and grind against his engorged cock. His breath lowers to a growl and he pulls your hands away from your body.");
	output("\n\n<i>“Bad elves don’t decide where Santa puts his hands. On your knees, facing towards the headboard,”</i> he instructs, moving back so that you can turn around to kneel on the bed, your backside raised invitingly towards him. <i>“Move closer to the headboard,”</i> he tells you, and you immediately oblige, wanting nothing more than to please him.");
	output("\n\nAs Fyn reaches over you, you realize with a start that he’s planning on putting those silk ropes you noticed earlier to good use. You close your eyes and shiver excitedly when he asks you to give him your hand, which you eagerly do.");
	processTime(20);
	pc.changeLust(30);
	clearMenu();
	addButton(0,"Next",showMeTheSouthPole3);
}
public function showMeTheSouthPole3():void
{
	clearOutput();
	showFyn(true);
	author("Vixen_Vaccine");
	output("With a few quick knots, he ties your hand securely to the headboard, and when he reaches around to tie up the other one, your hand is already in place. You hear a low rumble emanating from his chest as he chuckles at your enthusiasm, and once he ties off the last knot, you feel warmth spread over your lips as he kisses you deep and hard. You keep your eyes closed and you push your head forward, exploring the plumpness of his lips and reveling in the taste of his tongue in your mouth.");
	output("\n\nHe runs his hand across your back and you blissfully stretch out your body as his hands explore every inch of you, roaming over your [pc.breasts] and massaging your trembling flesh until you’re left flushed and sensitive. You groan in unconcealed lust as he slaps your ass, but he soothes your pain with a tender kiss a moment later.");
	output("\n\nYou feel goosebumps rise on your skin as his hands travel lightly down towards the wetness between your thighs, but you whine quietly when he stops himself. He moves down your body, planting kisses across your back and licking his way over your ass and down towards your quivering, stockinged thighs.");
	output("\n\nWith deliberate slowness, he hooks two fingers under your candy cane panties and pulls them down. They come off easily, and the soft rustling of the fabric sliding over your stockings is the only sound you can hear over the pounding of your heart as he leans back and gazes at you, tied up and vulnerable before him.");
	output("\n\nYou close your eyes even tighter as his fingers hover over your slit, then shudder as you feel his digits penetrate your dribbling cunt. Your cock twitches, fully erect as you beg him to quit teasing and just ravish your [pc.ass] like the naughty little elf you are, but it’s clear that he has other plans.");
	output("\n\n<i>“Who’s my little ho-ho-hoe?”</i> he asks playfully as he slowly begins thrusting his fingers methodically in and out of your wetness. Your heart races and your fingers dig into the silken ropes that bind you in response to his rhythmic fingerfucking. <i>“I am,”</i> you breathe, your mind lost in ecstasy.");
	output("\n\n<i>“What’s that? I can’t hear you,”</i> he says, pausing his assault on your pussy. You shudder and arch your back, grinding your slavering pussy against his hand. <i>“I’m your naughty little hoe! Oh god Fyn, please let me cum!”</i>");
	output("\n\nHe doubles up the pace, adding another finger, and then another, until he’s all but fisting your slavering pussy. You buck and flex your [pc.hips] in response to his thrusts, your eyes rolling to the back of your head from the delirium that quickly overtakes you. Warmth pools in your core as you feel yourself coming closer and closer to orgasm, your thighs twitching more and more the closer you come.");
	output("\n\n<i>“Stuff your big, hard coal into my little stocking! Oh, Santa, please”</i> you beg. Your taunts seem to spur him to action, and he gets on his knees and pulls your hips forward, finally intent on claiming your [pc.ass].");
	output("\n\nHe rubs his hands across his cock, his fingers dripping from the brutal fingerfucking he gave your [pc.pussy]. You wait, your thighs trembling expectantly as he lubricates his pole in preparation of entering you. After a few moments, he lines his massive cock up to your quivering backdoor and pushes into you, rapidly filling your fuckhole with his meaty pole and driving the breath from your lungs. When he transformed into Santa, every part of him got bigger - including his massive cock. It’s so big you feel like it could split your ass in two, and you can feel your inner walls slowly expand to accommodate for the reaming it’s about to get.");
	output("\n\n<i>“Oh yeah,”</i> he sighs, <i>“Take Santa’s package.”</i> You flex your hips toward his when he pushes into you, sinking into a mindless rhythm as he dominates your hole.");
	output("\n\nHe pounds faster and harder, his breath coming in ragged pants as he rams his dick deeper and deeper into your depths until he bottoms out in your ass.");
	pc.buttChange(chars["FYN"].cockVolume(0) * 1.5);
	output("\n\nYou’re on the brink yourself, tugging limply at your restraints. At some point your mind goes blank, the warmth in your loins spreading through you as you come deliriously close to orgasm. You wish your hands could be free to touch him, to jerk your [pc.cock], anything that would let you cum, but it’s clear that he wants you to edge towards bliss with him.");
	output("\n\nHe re-adjusts his grip on you, pulling your hips up and pushing your legs together. You gasp as you can feel his enormous manhood ream you at a deeper angle, his jingle balls bouncing against your [pc.pussy] and the ridges on his inflated dick rubbing deliciously against your slick inner walls.");
	output("\n\n<i>“Are you gonna”</i> you pant, <i>“Are you gonna cum in my chimney?”</i> You expect him to laugh, but he growls and his thrusting becomes erratic, his fingers digging into your supple [pc.ass] while he struggles not to cum.");
	output("\n\nHe releases a heavy breath, one hand coming around you to stroke your [pc.cock] while his dick continues ravishing your pliable star. With each schlick of his tool beating into your Christmas pudding, you feel your impending orgasm rising as his hand pumps your [pc.cock] in a twisting motion, fanning the coiling, twisting fire in your belly.");
	output("\n\nUnable to resist the sensation of both his immense cock ramming into your backdoor and his fingers deftly swirling over your dick, you cry out as your muscles clamps down on his hefty pole, your pussy and herm cock spurting cream all over the bed.");
	output("\n\n<i>“Santa’s coming to town!”</i> He yells as your twitching ass drives him over the edge. You can feel his thick shaft throb as he cums, filling you to capacity. You arch your back and moan, feeling his massive, inhuman cock pump his ivory eggnog into the deepest parts of your trembling backdoor.");
	output("\n\nFyn holds you close while you both cum, lost in the tingling pulses of your tandem orgasm. He cums so much that you can feel your belly distend from the sheer volume of his ejaculate, but trapped as you are underneath his large frame, it’s all you can do to ride out the waves of bliss as your [pc.ass] clenches weakly around him.");

	processTime(30);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",showMeTheSouthPole4);
}

//Post-Coitus
public function showMeTheSouthPole4():void
{
	clearOutput();
	showFyn(true);
	author("Vixen_Vaccine");
	output("When he gets up, his dick slowly pulls out of you with a wet plop, and thin rivulets of his seed flow out of your cum-packed ass to mix with your cream on the bed.");
	output("\n\n<i>“I’m definitely going to have to spend some time cleaning up,”</i> he says, raising an eyebrow at you. <i>“But in the end I suppose you are a good little elf after all.”</i>");
	output("\n\nYour legs shake when you stand up to walk back towards the bathroom and change back into your things.");
	output("\n\nHe gives you a firm but gentle kiss when you exit the bedroom, and slaps your abused ass on the way out.");
	processTime(5);
	fynSexed(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Leave]
public function leaveChristmasBehind():void
{
	clearOutput();
	showFyn();
	author("Vixen_Vaccine");
	output("You tell him that you’ve changed your mind.");
	output("\n\n<i>“Ah. Well, I’ll always be here if you need me. Especially if you need some lessons,”</i> he winks at you, relaxing back into the plush seat of his couch.");
	output("\n\nYou feel his eyes rove appreciatively over your backside.");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}