/*
 * Prai Ellit the Kui-tan Bondage Trap -
 * https://docs.google.com/document/d/1ecC9zLCgD94WBiWGrhjYC8Uj2ieQgnAdsfH-53W7c5Q/edit#heading=h.5bidgewyojmc
 * 
 * #Flags:
 * PRAI_MET
 * PRAI_FIRST			- 1 if untied Prai in first scene
 * PRAI_SECOND		
 * PRAI_MOOD			- 1 if Prai is Happy, 2 if Pray is Angry
 * PRAI_EMAIL_STAMP		- timestamp to trigger emails
 * PRAI_EMAIL_NUMBER	- email number to be triggered 1-4 are happy, 5-9 are angry
 * 
 * 
 * 
 * 
 * 
 */
 
 public function showPrai(nude:Boolean = false):void
 {
 	if (flags["PRAI_MET"] != undefined) showName("\nPRAI");
 	else showName("KUITAN\nGIRL?");
 	showBust(praiBustDisplay(nude));
 }
 
 public function praiBustDisplay(nude:Boolean = false):String
 {
 	return (nude ? "PRAI_NUDE" : "PRAI");
 }
 
 
 public function praiFirstEncounter():void
 {
 	author("Frogapus");
 	showPrai();
 	clearOutput();
 	clearMenu();
 	
 	output("\n\n");
 	if (flags["PRAI_FIRST"] == undefined) output("You stroll through a clearing, glad that for once the undergrowth and branches have left not only comfortable elbow room, but plenty of space overhead. You idly gaze upwards at the tall, gnarled trunks, barely taking note of a distant buzzing in the air. ");
 	else output("You stroll into a familiar clearing, filled with tall, gnarled trees. The wind blows, the rustling of countless leaves sounding like a distant ocean.");
 	output("\n\n<i>“Oh! Hey! Hey there! Can you lend a girl a hand? If it's not too much trouble, if you please!”</i> calls a high pitched voice from above you.");
 	output("\n\nYou start, glancing upward, your eyes scanning the branches overhead. Relatively nearby, you find the source. A " + (flags["PRAI_FIRST"] != undefined ? "familiar " : "") + "person-sized bundle is tied to the underside of a branch, some 5 meters up. She's buried under so many layers of rope and mismatched cords that it's impossible to make out anything but rounded ears twitching out from one end, and a gray-striped, bushy tail from the other. ");
 	if (flags["PRAI_FIRST"] == undefined)
 	{
 		if(!CodexManager.entryUnlocked("Kui-Tan"))
		{
			CodexManager.unlockEntry("Kui-Tan");
			output("Your Codex beeps, indicating that the individual under the bundle is an example of the kui-tan species and unlocking a new entry.");
		}
		else output("Your codex beeps, indicating that the individual under the bundle is a kui-tan.");
 	}
 	else output("You'd bet a thousand credits that you know who it is, though.");
 	output("You could probably reach the branch easily, climbing up a few of the lower ones to get to her. " + (pc.isTaur() ? "A careful look at the branches confirms that they're low and thick enough that you could easily pick your way up them. " : "") + "On the other hand, you have no idea who might be under all that rope--they might be tied there for a reason. Or, if you were feeling a bit wicked, you could untie her partially and have some fun with her.");
 	
 	flags["PRAI_MET"] = 1;
 	pc.createStatusEffect("Prai Cooldown", 0, 0, 0, 0, true, "", "", false, 24*60);
 	
 	addButton(0, "ToyWith", praiToyFirst, undefined, "Toy With Her", "");
 	addButton(1, "Untie", praiUntieFirst, undefined, "Untie Her", "");
 	addButton(2, "Leave", praiContinueFirst, undefined, "Cotinue On Your Way", "");
 }
 
 public function praiContinueFirst():void
 {
 	author("Frogapus");
 	showPrai();
 	clearOutput();
 	clearMenu();
 	
 	output("You decide that if someone chose to tie her up there so securely, there must have been a reason for it. You continue through the jungle.");
 	output("\n\n<i>“Hello?”</i> she calls out to the empty clearing as you leave it behind. <i>“Are … are you still there? Please don't leave; I really, really need some help!”</i>");
 	
 	pc.addHard(3);
 	
 	processTime(3+rand(4));
 	addButton(0, "Next", mainGameMenu, undefined, "", "");
 }
 
 public function praiToyFirst():void
 {
 	author("Frogapus");
 	showPrai();
 	clearOutput();
 	clearMenu();
 	
 	output("You decide to have a little fun with the bound kui-tan before making any sort of decision. You clamber up to a branch within reach, and set about undoing the ropes around her chest. As the mismatched restraints come away, you reveal a flat, slim chest concealed under a cream-colored top.");
 	output("\n\n<i>“Oh larks and lighthouses! Thank you SO much!”</i> she says.");
 	output("\n\nWith her head and face bound, it's impossible to see her expression. You imagine she must be surprised as, instead of untying the rest of her, you tug her neckline of her dress down, and unclip the front of her blue bra. Fine gray fur covers her petite chest, and her breasts are nonexistent, the only protrusion caused by the puffiness of her inverted, black nipples.");
 	output("\n\n<i>“Wait, what are you doing? Oh, sneezes and snakes, " + (flags["PRAI_FIRST"] == undefined ? "you're just some kind of pervert, aren't you?" : "[pc.name], is that you again?") + "”</i> she asks, struggling fruitlessly against the rest of the ropes.");
 	output("\n\nYou smile to yourself, deigning not to answer the trussed-up tanuki, instead caressing her breasts softly. As you run your hands through her plush fur, you let her nipples slide between your fingers. You feel goosebumps under her fur as her breath quickens.");
 	if (flags["PRAI_FIRST"] == undefined) output("\n\n<i>“Oh quadrupeds! I think I might have prefered the zil!”</i> she yelps as you continue your teasing.");
 	else if (flags["PRAI_MOOD"] == 1)
 	{
 		output("\n\n<i>“[pc.name], if that's you, then … I guess it's okay. But you'll let me down eventually, right?”</i> Prai asks. <i>“It </i>is<i> you, right?”</i>");
 		output("\n\nYou grin and decide not to answer right away.");
 	}
 	else if (flags["PRAI_MOOD"] == 2)
 	{
 		output("\n\n<i>“Flying flapjacks, [pc.name]! If that's you, I am going to slap you so hard once I get loose!”</i> Prai yells angrily, thrashing against her bindings.");
 		output("\n\nYou shrug and decide that it might be worth it and double-down on feeling her up.");
 	}
 	output("\n\n<i>“Why are you … ohhhh …. that feels nice …”</i> Her voice is a husky purr as you squeeze her chest. You give her nipples a pinch and a squeal issues from the mass of ropes covering her head. Your fingers continue to work them as she squirms helplessly against the ropes.");
 	output("\n\nBetween pants and moans, she manages to gasp out, <i>“Please …”</i>");
 	output("\n\nYou grin and lean in towards her head, <i>“Please what?”</i>");
 	output("\n\nShe whimpers, and you immediately release her slim frame. ");
 	output("\n\n<i>“No! Oh crackers! Don't just...”</i> she moans and bucks against the restraints.");
 	output("\n\n<i>“Don't what?”</i> you ask playfully.");
 	output("\n\n<i>“Don't … stop,”</i> she says after a breathy pause.");
 	output("\n\nHappily, you return to massaging her breasts, trailing your fingertips lightly over them as she squeals in delight. When you roll them between your thumb and index finger, she lets out a long, low moan, and her hips buck hard against the rope.");
 	output("\n\n<i>“I'm gonna … I'm gonna … <i>“ she gasps.");
 	output("\n\nIt's clear that she's on the verge of climaxing. Do you continue teasing her breasts and let her cum, stop and untie her, or stop and walk off?");
 	
 	processTime(5);
 	pc.lust(10);
 	
 	addButton(0, "Continue", praiToyBoobFirst, undefined, "Continue To Completion", "");
 	addButton(1, "Untie", praiToyUntieFirst, undefined, "Stop And Untie", "");
 	addButton(2, "Leave", praiToyLeaveFirst, undefined, "Stop And Leave", "");
 }
 
 public function praiToyLeaveFirst():void
 {
 	author("Frogapus");
 	showPrai();
 	clearOutput();
 	clearMenu();
 	
 	output("You pull your hands away from her body, and instead begin climbing down the tree. You even try humming a bit as you make your way, to make sure the bound kui-tan knows that you have no interest in finishing.");
 	output("\n\n<i>“Nuh … nooooooo …”</i> she moans softly, wriggling hard against her bindings. <i>“Almost … almost …. there ….”</i> she grunts through gritted teeth, writhing beneath the rope.");
 	output("\n\nYou smile to yourself, watching the kui-tan tire herself out. Helpless, she struggles, unable to finish, finally letting out a sound somewhat akin to a sob and a frustrated bark. <i>“Oh-oh FIDDLESTICKS!”</i>");
 	output("\n\nYou clamber back down the branches, leaving the frustrated kui-tan bound to the tree branch, and continue on your way, her words echoing in the clearing behind you.");
 	if (flags["PRAI_FIRST"] == undefined) output("\n\n<i>“H-hey! Whoever you are! That was a really j-jerk thing to do!”</i> she calls out to the empty clearing as you leave it behind. <i>“Are … are you still there? Crockpots and crabapples! You could have at least finished! Please don't leave! I really, really need some help!”</i>");
 	else if (flags["PRAI_MOOD"] == 1) output("\n\n<i>“H-hey! Are you still there? What's going on?”</i> she calls out. <i>“[pc.name], you're not going to just leave me out here, are you?”</i>");
 	else if (flags["PRAI_MOOD"] == 2) output("\n\n<i>“Again? </i>Again?<i>”</i> she yells. <i>“You're gonna leave me to get xenofucked again? Oh, [pc.name] you unmitigated jerk!”</i>");
 	
 	processTime(3);
 	pc.addHard((flags["PRAI_MOOD"] == 1 ? 6 : 3));
 	
 	addButton(0, "Next", mainGameMenu, undefined, "", "");
 }
 
 public function praiToyBoobFirst():void
 {
 	author("Frogapus");
 	showPrai();
 	clearOutput();
 	clearMenu();
 	
 	output("You continue massaging her chest, tweaking and teasing her nipples, watching, entertained, as she squirms against her rope bindings. ");
 	output("\n\n<i>“Harder!”</i> she gasps, trembling. <i>“Please" + (flags["PRAI_FIRST"] != undefined ? " [pc.name]" : "") + ", harder!”</i> ");
 	output("\n\nYou decide to acknowledge the kui-tan's wishes, and pinch her nipples firmly, drawing out a high-pitched squeal from her. Her hips thrust against the ropes restraining them, as she grinds in bliss.");
 	output("\n\n<i>“Mmmmuh! Mmmmore!”</i> she moans. After a ragged inhale of air, she adds, <i>“Please?”</i>");
 	output("\n\nYou increase the pressure, tweaking her nipples hard, and tugging on them for good measure.");
 	output("\n\n<i>“Eep!”</i> she squeaks out, her whole body stiffening against her restraints. She bucks repeatedly as you continue your hold on her. You see a dribble of cum oozing out from between the ropes at her waist. She holds her restrained arch for all of a minute, before relaxing, hanging limply within her bindings.");
 	output("\n\n<i>“Ummah …”</i> she gurgles, following it with a string of other nonsense sounds.");
 	output("\n\nThe kui-tan seems a bit out of it at this point. You doubt that she'd even notice if you left. If you decide to untie her, though, given her limp state, you should probably be ready to catch her.");
 	
 	pc.addMischievous(3);
 	pc.processTime(10+rand(5));
 	pc.lust(15);
 	
 	addButton(0, "Untie", praiToyBoobUntieFirst, undefined, "Untie Her", "");
 	addButton(1, "Leave", praiToyBoobLeaveFirst, undefined, "Continue On Your Way", "");
 }
 
 public function praiToyBoobLeaveFirst():void
 {
 	author("Frogapus");
 	showPrai();
 	clearOutput();
 	clearMenu();
 	
 	output("You climb back down the branches, leaving the babbling tanuki still tied up, her breasts hanging free as she babbles deliriously. Well, whatever happens to her, you're pretty sure you provided the day's high point.");
 	if (flags["PRAI_FIRST"] != undefined)
 	{
 		output("\n\nPrai recognized your voice, though. It's a safe bet that she'll be upset with you next time.");
 		flags["PRAI_MOOD"] = 2;
 		flags["PRAI_EMAIL_NUMBER"] = 5;
 		flags["PRAI_EMAIL_STAMP"] = GetGameTimestamp();
 	}
 	
 	pc.addHard((flags["PRAI_MOOD"] == 1 ? 6 : 3));
 	processTime(2);
 	
 	addButton(0, "Next", mainGameMenu, undefined, "", "");
 }
 
 public function praiToyBoobUntieFirst():void
 {
 	author("Frogapus");
 	showPrai();
 	clearOutput();
 	clearMenu();
 	
 	output("You undo the rest of the ropes securing the breathless kui-tan.  One after the other, they come away, no knot particularly difficult, just effective in their numbers. You eventually uncover a slim, feminine frame wrapped in a cream-colored dress and black leggings. A blue harness runs from her shoulder to her hip, blinking a myriad of blue lights. You reveal a fur-masked female face with a dazed expression.");
 	output("\n\nShe babbles more nonsense syllables as you untie her, coming to as she starts to hang more precariously from the remaining ties.");
 	output("\n\n<i>“W-wait …”</i> she murmurs, blinking rapidly and focusing her eyes. <i>“Please be careful, please,”</i> she says, a bit more clearly this time.");
 	if (flags["PRAI_FIRST"] == undefined) output("\n\n <i>“Sorry, but I've been tied up here a while, and I really do appreciate your help, but if you don't mind very much, do you think you could do me the additional favor of making sure I stand next to you instead of falling to the forest floor?”</i>");
 	output("\n\nIt takes some maneuvering, but you manage to loose her legs and waist enough for her to bend her free half into touching down on the thick branch next to you. " + (flags["PRAI_FIRST"] == undefined ? "The girl is surprisingly flexible, and along the way, you get a look at the large, wet stain across the front of her dress." : "As Prai clambers down, you take a nice, long look at the wet stain on the front of her black leggings.") + "");
 	output("\n\nWhen you undo the last of the bindings, she wobbles back, leaning against you. You brace for her weight, catching yourself just in time to keep from toppling off your foothold. " + (pc.isTaur() ? "It's a little tricky, and you have to brace one of your hind-most legs against the trunk of the tree to keep from falling off the wide branch." : "") + "");
 	output("\n\n<i>“Oof! Flying flapjacks, that was definitely a thing! Thank you so much, " + (flags["PRAI_FIRST"] == undefined ? "friend" : "[pc.name]") + ",”</i> she says, steadying herself against you, holding one hand against her head as she blinks and focuses on you. <i>“Oh! Um, thank you again, " + pc.mfn("handsome", "cutie", "cutie") + ".");
 	output("\n\n");
 	
 	
 	
 }