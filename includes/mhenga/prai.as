/*
 * Prai Ellit the Kui-tan Bondage Trap -
 * https://docs.google.com/document/d/1ecC9zLCgD94WBiWGrhjYC8Uj2ieQgnAdsfH-53W7c5Q/edit#heading=h.5bidgewyojmc
 * 
 * #Flags:
 * PRAI_MET
 * PRAI_FIRST			- 1 if untied Prai in first scene
 * PRAI_WHO				- 1 if asked Prai who she is
 * PRAI_WHAT			- 1 if asked Prai what she was doing in a tree
 * PRAI_CUMLIPS			- 1 if Prai has cummy lips, 2 if you tried to get a BJ and she rejected you
 * PRAI_BJ				- number of times she gave you them lips
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
 
 public function showPrai(variation:int = 0):void
 {
 	if (flags["PRAI_MET"] != undefined) showName("\nPRAI");
 	else showName("KUITAN\nGIRL");
 	showBust(praiBustDisplay(variation));
 }
 
 public function praiBustDisplay(variation:int = 0):String
 {
 	var sBust:String = "PRAI_";
 	if (variation == 0) sBust += "DRESS";
 	else if (variation == 1) sBust += "SKIRT";
 	else sBust += "NUDE";
 	
 	return sBust;
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
 	
 	processTime(3+rand(3));
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
 	pc.lust(15);
 	
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
 	if (flags["PRAI_FIRST"] != undefined)
 	{
 		flags["PRAI_MOOD"] = 2;
 		flags["PRAI_FIRST"] = 1;
 		flags["PRAI_EMAIL_NUMBER"] = 5;
 		flags["PRAI_EMAIL_STAMP"] = GetGameTimestamp();
 	}
 	
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
 		flags["PRAI_FIRST"] = 1;
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
 	if (flags["PRAI_FIRST"] == undefined) output("\n\nShe wobbles a bit, holding on to you as you both stand on the branch. Her black-furred hands clutch at your chest and you can feel her slight chest rise and fall as she takes a few deep breaths.");
 	else if (flags["PRAI_MOOD"] == 1) output("\n\nShe pauses briefly, looking you over, her slight frame pressed against you, letting you feel the small, wet bulge just below her waist.");
 	else if (flags["PRAI_MOOD"] == 2) output("\n\nShe blinks and frowns at you. <i>“But don't think I've forgotten about last time,”</i> she says, folding her arms.");
 	output("\n\nYou cough a bit and suggest that you make your way down to the ground.");
 	output("\n\n<i>“Oh my goodness grapejuice, you're right! We could break our necks staying up here in this tree!”</i>");
 	output("\n\nShe nervously steps from one branch to the next, following you down the natural path to the jungle floor. Once there, she smiles ");
 	if (pc.tallness < 5*12+2) output("down ");
 	else if (pc.tallness > 5*12+2) output("up ");
 	output("\n\nat you, and toys with the hem of her blouse, giving you a little bob. <i>“Thank you very much for saving me, " + (flags["PRAI_FIRST"] == undefined ? "albeit in such an unorthodox way" : "again") + ",”</i> she glances to the side, blushing. <i>“Um, is there anything I can do for you?”</i>");
 
 	processTime(15+rand(5));
 	pc.lust(10);
 
 	praiTalkMenuFirst(1); 
 }
 
 public function praiTalkMenuFirst(variation:int):void
 {
 	addButton(0, "Appearance", praiAppearance, variation, "", "");
 	addButton(1, "Her", praiHerFirst, variation, "Who are you?", "");
 	addButton(2, "Tree", praiTreeFirst, variation, "Why're you in a tree?", "");
 	//Gemu
 	if (flags["PRAI_WHO"] != undefined) addButton(3, "Gemu", praiGemuFirst, variation, "What's a Gemu?", "");
 	else addDisabledButton(3, "Locked");
 	//Help
 	if (flags["PRAI_WHAT"] != undefined) addButton(4, "Help", praiHelpFirst, variation, "Do you need help?", "");
 	else addDisabledButton(4, "Locked");
 	//Sex
 	if (flags["PRAI_WHO"] == undefined) addDisabledButton(5, "Locked");
 	else if (flags["PRAI_CUMLIPS"] != undefined) addDisabledButton(5, "Sex", "Sex", "You already tried this, you shouldn't push your luck."); 
 	else if (pc.lust() < 33) addDisabledButton(5, "Sex", "Sex", "You aren't turned on enough for this.")
 	else addButton(5, "Sex", praiSexFirst, variation, "Sex, maybe?", "");
 	
 	addButton(14, "Leave", praiLeaveFirst, variation, "", "");
 }
 
 public function praiAppearance(variation:int):void
 {
 	author("Frogapus");
 	showPrai();
 	clearOutput();
 	
 	output("You look the small kui-tan up and down. Her black hair is short and mussed, likely due to her recently head-to-toe immobilization. From it perk two gray, round ears. Her brown eyes are wide and set in a black mask of fur covering her face, making her look like a diminutive robber. Her shiny nose is black, and a pink smear of lipstick mostly covers her matching, glossy-black lips. ");
 	if (flags["PRAI_CUMLIPS"] == 1) output("Much of it is smeared across the white fur of her cheeks, along with a few streaks of drying cum.");
 	output("\n\nA cream colored sundress hangs on her slim frame, barely rising up over the bra on her flat chest. Her arms are exposed, gray and white furred leading down to black fur on her nimble little fingers. She fidgets with the metallic bandolier slung from shoulder to hip on her, fastening and unfastening small compartments as you look her over. At her hip, the bandolier is thicker, almost a satchel, and small blue lights blink across the entire piece.");
 	output("\n\n");
 	if (variation == 1) output("There's a large stain on the lower part of her dress, just over the small bulge at her crotch, showing where it's been soaked with her cum. ");
 	else if (variation == 2) output(" There's a large stain on the lower part of her dress, just over the small bulge at her crotch, showing where it's been soaked with her pre. ");
 	else if (flags["PRAI_CUMLIPS"] == 1) output("There's a large stain on the lower part of her dress, just over the small bulge at her crotch. It looks like the little kui-tan got more than a little excited while servicing you. ");
 	if (variation == 3) output("Her cream-colored sundress hangs loosely on her, ending with a thigh-high hem. Her skinny legs continue down, wrapped in tight, black leggings, ending in calf-high black boots. ");
 	output("She shifts back and forth from leg to leg, occasionally leaning forward to balance on her toes before rocking back.");
 	
 	processTime(1);
 	pc.lust(5);
 	
 	praiTalkMenuFirst(variation);
 	addDisabledButton(0, "Appearance");
 }
 
 public function praiLeaveFirst():void
 {
 	author("Frogapus");
 	showPrai();
 	clearOutput();
 	clearMenu();
 	
 	if (variation == 1)
 	{
 		output("You bid her farewell.");
 		if (flags["PRAI_FIRST"] == undefined)
 		{
 			output("\n\n<i>“Well, it was wonderful meeting you, and thank you again! I hope I bump into you sometime soon!”</i> she says cheerily. <i>“Thank you very much for taking the time to let me down there. You're a regular space hero, aren't you?”</i>");
 			output("\n\n<i>“I mean, assuming space heroes go around teasing bound-up stranger's nipples,”</i> she says with a wink. <i>“No, really though, I appreciate the save." + (silly ? " 10/10 would get save-molested by you again,”</i> she giggles, then claps her hands to her cheeks, blushing, as if surprised to have said that." : "”</i>") + "");
 			output("\n\nYou pat her head and she lets out a musical churr, hugging you once more. <i>“I'm so sorry--I'm just repeating myself. Thank you again!”</i>");
 		} 		
 		else if (flags["PRAI_MOOD"] == 1)
 		{
 			output("\n\n<i>“Well, it was wonderful seeing you, and thank you again! I can't wait to see you again!”</i> she says cheerily. <i>“Thank you very much for taking the time to let me down there. You're a regular space hero, aren't you?”</i>");
 			output("\n\n<i>“I mean, assuming space heroes go around teasing bound-up stranger's nipples,”</i> she says with a wink. <i>“No, really though, I appreciate the save." + (silly ? " 10/10 would get save-molested by you again,”</i> she giggles, then claps her hands to her cheeks, blushing, as if surprised to have said that." : "”</i>") + "");
 			output("\n\nYou pat her head and she lets out a musical churr, hugging you once more. <i>“I'm so sorry--I'm just repeating myself. Thank you again!”</i>");
 		}
 		else if (flags["PRAI_MOOD"] == 2)
 		{
 			output("\n\nPrai gives you an appraising look and lets out a frustrated sigh. <i>“I was really upset, but if you were willing to save me this time, you can't be all bad. Thank you for helping me out of that bind,”</i> she says finally.");
 			output("\n\n<i>“I don't know why it occurred to you to jill me off when I was so angry with you,”</i> she says, frowning. <i>“Are orgasms how you solve all your problems?”</i>");
 			if (pc.isNice()) output("\n\nYou feel a little embarrassed and offer the kui-tan a quick apology.");
 			else if (pc.isMischievous()) output("\n\nYou roll your eyes but endure the kui-tan's tirade.");
 			else output("\n\nYou can't help but grin openly at her question, and smirk in confirmation.");
 			output("\n\nShe sighs in defeat, her tense pose dropping. <i>“I … I can't argue with the results, though.Thank you very much for saving me. And if </i>having</i> to be fondled is the price I pay for it, well, I'll just have to endure it,”</i> she adds with a  quick smile and a wiggle of her hips.");
 			output("\n\nThe kui-tan leans forward and gives you a hug. <i>“Thank you for saving me and patching things up … in your own weird way, of course. You've got places to be, and it does mean a lot to me that you'd take some time out for me.”</i>");
 			output("\n\nYou smile and return the small woman's hug.");
 		}
 		output("\n\nYou leave the quirky kui-tan behind in the clearing and continue on your way.");
 	}
 	else if (variation == 2)
 	{
 		output("You bid her farewell.");
 		output("\n\n<i>“But, but … I wanted to cum …”</i> she says, dazedly. She takes a few shuddering breaths and holds her hands against the small bulge in her leggings. <i>“I … uh … th-thank you for freeing, me, though,”</i> she says softly. ");
 		output("\n\nYou smile and leave the quirky woman behind in the clearing and continue on your way. ");
 	}
 	else if (variation == 3)
 	{
 		output("You decide that the little kui-tan is safe and bid her farewell.");
 		output("\n\n<i>“Oh! Yes! Well, thank you very much for your help, again! I actually need to get back to collecting more samples,”</i> she says. <i>“I'm still trying to figure out how to get honey from these Zil …”</i> she says, resting her chin on her hand and frowning.");
 		output("\n\nYou can't help but grin as you wish her luck. Turning, you leave the quirky woman behind in the clearing and continue on your way. ");
 	}
 	
 	processTime(6+rand(3));
 	flags["PRAI_EMAIL_NUMBER"] = (flags["PRAI_FIRST"] == undefined ? 1 : 2);
 	flags["PRAI_EMAIL_STAMP"] = GetGameTimestamp();
 	flags["PRAI_FIRST"] = 1;
 	flags["PRAI_MOOD"] = 1;
 	flags["PRAI_CUMLIPS"] = undefined;
 	
 	addButton(0, "Next", mainGameMenu, undefined, "", "");
 }
 
 public function praiHerFirst(variation:int):void
 {
 	author("Frogapus");
 	showPrai();
 	clearOutput();
 	
 	output("You introduce yourself, and then ask the woman about her identity.");
 	if (flags["PRAI_FIRST"] == undefined)
 	{
 		output("\n\n<i>“Oh! Stars and skittles, I'm sorry! Hello! Hi! Hey there! I'm Prai Ellit!”</i> she says, her eyes widening, and her knees dipping into a quick curtsy. <i>“I'm sorry--I guess we didn't really have an opportunity for introductions up there …”</i> she glances up at the tree branch then down at her " + (variation != 3 ? "stained dress" : "cream-colored dress, covered in small chips of bark and stains from sap") + ".");
 		output("\n\n<i>“Oh fidgets!”</i> she exclaims, " + (variation != 3 ? "looking down at the very large wet spot. Her cheeks seem to pinken under her ash-colored fur, and s" : "trying to brush some of it off. S") + "he immediately flips open a segment of her sash, unfolding a large, satchel-like pouch, rummaging through it. <i>“Sorry! Just a moment!”</i>");
 		output("\n\nShe rummages for a bit, then freezes, a look of shock spreading across her face.");
 		output("\n\n<i>“Sneezes and snakes! Did you say 'Steele?' As in Steele Tech? That's who made my Codex!”</i> she explains, excitedly tapping one of the panels on her sash, lighting up an oddly familiar, but wrong-looking display.");
 		output("\n\nShe catches your odd look, then taps it off, looking embarrassed. <i>“Well, not technically. I couldn't afford one--real Codices are prohibitively expensive. This one's actually a knock-off that the Camarilla makes. It's called a Grim-R. They're a lot cheaper, but maybe not as reliable. And you can't really upgrade them; you have to just buy a whole new one when it gets too out of date.”</i>");
 		output("\n\n<i>“Sorry, but this is what I was looking for!”</i> She withdraws her other hand from her satchel and pulls out something pink and rubbery. Without further explanation, she slaps it against her stained " + (variation != 1 ? "blouse" : "dress") + ". The blob sticks, then slowly begins to move across the smudges of sap, leaving the cloth dry and clean in its wake.");
 		output("\n\n<i>“I'm a biologist,”</i> she says hurriedly, as you open your mouth to ask about the blob. <i>“I catalog and sometimes collect samples of life from across the universe. Currently, I'm on contract for Xenogen Biotech. I was supposed to be doing field research here on Mhenga before I got myself tied up.");
 		output("\n\n<i>“This little one is a Gemu,”</i> she says, plucking the pink blob from her now-pristine dress. She smoothes down her dress over her hips, a small bulge at her crotch briefly visible. <i>“Xenogen was going to mass produce them, but scrapped the project. I saved this little one from the incinerator.”</i>");
 		output("\n\nYou take a closer look and see that the three-inch creature has the lower body of a slug and the top half of an armed humanoid. It waves once before she tucks it away in her satchel.");
 		output("\n\nYour eyes flicker over the slight bulge in her skirt and she catches you. <i>“Oh, if you were wondering about it, yes--there's a dick under there,”</i> she says with a wave of her hand. <i>“Nothing super special--");
 		if (variation == 2) output("just a miniature equine cock" + (silly ? ", I call him 'Little Sebastian'" : "") + ".--");
 		output("though I've grabbed a mod or two from Xenogen's scrapped project lines. Some fluid boosts and a minor mod to my existing structure. Though, I guess you weren't really asking about that…”</i> she says, blinking. <i>“Oh my gosh, was I just rambling about my … oh crackers …”</i> she says blushing furiously.");
 	}
 	else
 	{
 		output("\n\nPrai gives you an odd look. <i>“You've met me already. You want to run through introductions now?");
 		output("\n\nYou nod in assent, and she shrugs. <i>“Well, you did save me again--it's no fur off my tail if you want to hear about me again.”</i>");
 		output("\n\n<i>“I'm Prai Ellit--a xenobiologist. Currently, I'm on contract with Xenogen, studying the flora and fauna of Mhen'ga. It's been … challenging so far,”</i> she says with a wry smile. ");
 		output("\n\n<i>“I've got a little bit of tech on me--my Grim-R, which is a kind of knockoff Codex, and I've got my companion--my gemu,”</i> she says, reaching into a pouch on her bandolier, pulling out a small, pink, pulsating blob.");
 		output("\n\n<i>“Not that you need my life story, but the short version is that I was born a guy, but I think of myself as a girl,”</i> she says with a smile <i>“And yes, I have guys parts. And yes, I've got a mod or two from some scrapped Xenogen projects. I don't think that makes me any less of a girl, though, do you?”</i> she says" + (flags["PRAI_MOOD"] == 1 ? " with a smile and twirl. The skirt of her dress billows out around her, and she tucks it down before she reveals anything. She grins and sticks her tongue out at you." : ".") + "");
 	}
 	output("\n\n<i>“Is there anything else that you wanted to know?”</i> she asks, raising an eyebrow.");
 	
 	processTime(8+rand(5));
 	flags["PRAI_WHO"] = 1;
 	
 	praiTalkMenuFirst(variation);
 	addDisabledButton(1, "Her");
 }
 
 public function praiTreeFirst(variation:int):void
 {
 	author("Frogapus");
 	showPrai();
 	clearOutput();
 	
 	output("You ask the kui-tan exactly how she ended up tied to the tree branch.");
 	output("\n\n<i>“Errrr …”</i> she says, blushing a bit. <i>“That's a little embarrassing. " + (flags["PRAI_FIRST"] != undefined ? "As you know, " : "") + "Xenogen Biotech hired me to do some fieldwork here on Mhenga.”</i>");
 	if (flags["PRAI_FIRST"] == undefined) output("\n\n<i>“I ran into some Zil females and my Grim-R,”</i> she gestures to one of the glowing panels on her sash, <i>“told me that they communicate through dance.”</i> She pauses, her face turning an even brighter shade of pink. <i>“Well, long story short, they laughed--for WAY too long--and I said some things that I probably shouldn't have.”</i> She frowns, staring at the ground, <i>“Though in my defense, they absolutely WERE trashy, waxy vermin.”</i>");
 	else output("\n\n<i>“My luck is awful. I ran into those same Zil females from before--or maybe they were looking for me,”</i> she says, making a face. <i>“Either way, they nabbed me before I could do anything, and tied me up to another branch,”</i> she says. <i>“At least I got to insult their mothers this time.”</i>");
 	output("\n\n<i>“Anyway, one wanted to drug me, and the other wanted to … erm, ahem, 'mate' with me,”</i> she says, looking away at the last line. <i>“In the end they decided to tie me to a tree and find a tiebreaker vote.”</i>");
 	output("\n\n<i>“I'm kind of relieved, actually,”</i> she says with a nervous smile. <i>“I'm not really into females, so I was more than happy to not have them, um, mate with me.”</i>");
 	
 	processTime(5+rand(3));
 	flags["PRAI_WHAT"] = 1;
 	
 	praiTalkMenuFirst(variation);
 	addDisabledButton(2, "Tree");
 }
 
 public function praiGemuFirst(variation:int):void
 {
 	author("Frogapus");
 	showPrai();
 	clearOutput();
 	
 	output("You ask her about the odd creature she tucked into her satchel.");
 	output("\n\n<i>“Oh, the Gemu?”</i> she asks, pulling it back out. She holds it up to your eye level to let you inspect the jelly-like creature.");
 	output("\n\nThe blobby being has a vaguely humanoid torso, complete with arms and three-fingered hands. Its face turns up at you, peering at you with overlarge eyes perched over a rounded snout. Two globular breasts protrude from its chest, just above a rounded belly that curves down to a slug-like bottom half. The creature is pink and slightly translucent, reminding you of the rahn you've encountered. A red fringe of pseudopods runs from the top of its head and down either side of it's lower body.");
 	output("\n\n<i>“It's a scrapped Xenogen Biotech project. These were supposed to be for custodial uses aboard ships,”</i> Prai explains. <i>“They're semi-sentient, and they absorb inanimate organics and are pretty indestructible.”</i> She closes her fist around the tiny creature, making it bulge out from between her fingers. When she opens her hand again, the Gemu it back to its original form, making a happy chittering sound.");
 	output("\n\nIntrigued, you ask why the project was scrapped.");
 	output("\n\n<i>“According to official statements,”</i> Prai says with a roll of her eyes, <i>“Xenogen was working on them for a while, but about four years into the project, JoyCo. caught wind of it and filed for copyright infringement. Turns out JoyCo. had been working on something similar for their Goovolvers. Rather than fight the lawsuit, Xenogen pulled the plug on the project. The poor things are built off of rahn </i>and<i> galotian DNA, but they're not particularly bright--there were already hundreds of them made.”</i>");
 	output("\n\nThe Gemu gives another chitter and places its mouth over Prai's fingertip, its rubbery head stretching all the way over her first two digits.");
 	output("\n\n<i>“I couldn't save them all,”</i> she says sadly. <i>“But I rescued this little one from 'decommissioning,'”</i> she practically spits the last word, her eyes narrowed, but her other finger gently stroking the tiny creature's head.");
 	output("\n\nShe carefully pries the jelly slug from her finger, then tucks it away in her satchel. ");
 	output("\n\n<i>“For the time being, she's my travelling companion and part-time laundry aid.”</i>");
 	
 	processTime(7+rand(3));
 	
 	praiTalkMenuFirst(variation);
 	addDisabledButton(3, "Gemu");
 }
 
 public function praiHelpFirst(variation:int):void
 {
 	author("Frogapus");
 	showPrai();
 	clearOutput();
 	
 	output("Given her recent predicament, you decide to ask the kui-tan if she needs help");
 	output("\n\nHer ears flutter for a second, and she leans in with a smile. <i>“Oh my stars and shivers! Is the space hero here to rescue me from peril?”</i> She spins, leaning back against you, her face pulling into an expression of mock horror. <i>“Villains and vagabonds! Who knows what sort of deadly predations lie in wait for the helpless waif! What will I do without a big, strong protector?”</i>");
 	output("\n\nYou point out that you <i>did</i> just rescue her from being held prisoner on an alien planet.");
 	output("\n\nShe humphs and pirouettes back to her own feet, crossing her arms and cocking her hips to one side. <i>“I'm a grown woman AND a professional field xenobiologist. Mishaps aside, I know what I'm doing.”</i> Her expression softens and she gives you a smile. <i>“I AM grateful for your help today, though. Just don't go assuming that every damsel is always in distress.”</i>");
 	
 	processTime(5+rand(3));
 	
 	praiTalkMenuFirst(variation);
 	addDisabledButton(4, "Help");
 }
 
 public function praiSexFirst(variation:int):void
 {
 	author("Frogapus");
 	showPrai();
 	clearOutput();
 	
 	output("You ask her if she'd like to help you relieve some tension.");
 	if (variation == 3) output("\n\n<i>“Stars and snakes, is this how you start every conversation with a new acquaintance?”</i> she asks in surprise. <i>“I mean … I'm not going to lie, something about being bound up did pique my interest a bit, but …”</i> She frowns, considering your offer.");
 	
 	//She doesn't wana fuck you 
 	if (!pc.hasCock() || (variation == 1 && !pc.isMasculine())) 
 	{
 		output("\n\n<i>“Well I mean, I really appreciate the offer, but you're not really my type,”</i> she says, looking off to the side. She glances back to you, looking worried. <i>“I mean. I'm really sorry, but I've got preferences, and I'm very flattered, and more than a little grateful, but I'm just not feeling it. Sorry about that!”</i> ");
 		
 		flags["PRAI_CUMLIPS"] = 2;
 		
 		praiTalkMenuFirst(variation);
 		addDisabledButton(5, "Sex");
 		return;
 	}
 	
 	if (!pc.isMasculine())
 	{
 		if (variation == 2) output("\n\n<i>“You're not really my type, but …”</i> she squirms, running her fingers up against the outline of a short, stubby cock straining against her leggings. <i>“I guess some physical gratitude might not hurt.”</i>");
 		else if (variation == 3) output("\n\n<i>“You're not really my type, but …”</i> she squirms, glancing down at the front of her dress, <i>“I </i>am<i> pretty wound up, though.”</i>");
 	}
 	else output("\n\n<i>“Well, I suppose " + (variation == 3 ? "I could" : "it would be fair") + ",”</i> she says, putting a finger to her mouth and looking thoughtful.");
 	output("\n\nYou raise your eyebrow at her, pondering, then slowly begin " + (pc.isNude() ? "getting yourself primed and ready" : "undoing your [pc.gear]") + ".");
 	if (flags["PRAI_BJ"] == undefined)
 	{
 		output("\n\n<i>“Land sakes and garter snakes!”</i> she says, frowning down at your " + (pc.isNude() ? "boldness" : "descent into nudity") + ", <i>“I didn't say I would, did I?”</i>");
 		output("\n\nYou are momentarily baffled by her response.");
 		output("\n\n<i>“That's the problem with you sexed-up Rushers. You hit planet and assume everyone's there to fuck you or suck you. I mean, yes, granted, you saved me from the branch, and I'm not opposed to the bit of a massage you gave me, but there's a line,”</i> she scolds.");
 		output("\n\nYou're taken aback, and momentarily consider " + (pc.isNude() ? "backing off" : "slinging your clothes back on") + ". Except … her eyes haven't left your crotch since you mentioned it.");
 		output("\n\n<i>“But on the other hand, you </i>did<i> ask me, and I </i>do<i> very much want to,”</i> she says thoughtfully. She frowns and nods, seeming to come to a conclusion. <i>“I'm not doing this because I blow everyone who does me a favor, mind you. It just seems like a mutually beneficial option here.”</i>");
 	}
 	output("\n\nShe drops slowly to the forest floor, her knees resting on the bracken as light filters through the canopy, speckling across her gray-and-black fur.");
 	output("\n\nShe looks up at you from her knees, sunlight dappling her black fur robber's mask. <i>“I'm up for it if you are,”</i> she says in a soft voice.");
 	output("\n\nYou voice your agreement, sit down on a large tree root, and slip your [pc.cocks] out.");
 	output("\n\n<i>“Oh, crackers … <i>“ she breathes, her words trailing off at the sight of your member" + (pc.totalCocks() > 1 ? "s" : "") + ".");
 	output("\n\nShe leans forward, breathing out a warm sigh against your " + (pc.totalCocks() > 1 ? "topmost " : "") + "dick, then takes in a deep breath, her black nose twitching and her eyes fluttering closed.");
 	output("\n\n<i>“You s-smell goooooood ...”</i> she purrs, nuzzling the tip of her nose against the head of your cock, following it with a flick of her hot tongue against your cockhead. Prai leans forward, kissing your dick from one side, her soft lips sucking around your throbbing member, her lipstick leaving pink smears on your shaft.");
 	output("\n\n<i>“Mm, tastes good too ...”</i> she slurs her words and draws her head back, moving down a bit to leave another sucking, messy kiss along your cock.");
 	output("\n\nHer breathing comes faster and more heavy as she tilts her head to kiss the underside of your dick. Her lipstick smudges across her own face, leaving pink streaks across the white fur of her cheeks.");
 	output("\n\n<i>“So good …”</i> she mutters, continuing to worship your cock, her words growing less coherent as she tends to your stiff, lipstick-smeared dick.");
 	output("\n\nYou moan and run your fingers through her charcoal hair. Your touch seems to spur her on. You feel her soft paws grasping your shaft, squeezing it tenderly, her thumbs gently rubbing against the underside of your cock. She leans in, sticks her tongue out, and tilts her head up, meeting your eyes as you watch your cockhead come to rest on her pink tongue.");
 	output("\n\nShe keeps her gaze up, her chocolate-colored eyes locked on to your [pc.eyeColor] colored ones. She kisses the tip of your dick once, softly, before starting to lap at it. Her head turns slowly from side to side as she laps and sucks at the head of your dick, looking for all the world like someone savoring a lollipop.");
 	output("\n\n<i>“Oh, [pc.name], you taste amazing,”</i> she sighs, pressing her soft, pink lips against you, sliding her mouth down one side of your cock, then back up and over, her tongue flicking against your shaft as she sucks gently on it the whole way around.");
 	output("\n\nShe stops at the apex of your cock, your tip resting against the plumpness of her lower lip. <i>“Can I … can I taste more of you?”</i> she asks. She looks shyly up at you from under dark lashes, her cheeks pink under her white fur.");
 	output("\n\nYou grin and grab her firmly by the ears, then pull her hungry mouth down onto your meat. She groans as you fill her, her body trembling as you sink between her lips.");
 	output("\n\nHer ears twitch under your hands as she slurps her way down your dick, guided by your grip. Her right hand " + (pc.balls > 0 ? "cups your balls" : "caresses your pubis") + "}, while her left massages the base of your shaft. Her saliva drips down the underside of your cock as she slides back up.");
 	output("\n\nYou pause, admiring the dazed expression on her face. Prai looks lost in delight, her eyes half-lidded and far away, her breath heavy. Further down, you can see that her nipples have risen out from the curves of her breasts, shiny and stiff.");
 	output("\n\n<i>“Nmm?”</i> she questions, her lips still firmly attached to your cock, her eyes unable to focus on you.");
 	output("\n\nYou answer her by pulling her down firmly onto your cock. She lets out a satisfied squeal as you tighten your grip on her ears, shoving her head up and down on your dick. You're almost worried that you might be hurting her, but every time you squeeze, her tail puffs a bit, and she moans so sweetly.");
 	output("\n\nShe slurps and moans, her body shaking as you face-fuck her. She's clearly enjoying it as much as you are. When the first few droplets of precum ooze from your dick down her hot, wet throat, she redoubles her efforts, pumping her mouth faster than before. You feel the softness of her lips paradoxically tight around you, and the flicker of her tongue along the underside of your cock.");
 	output("\n\nYou move your hands to her dark hair, your fingers tousling and scratching her as she moans in pleasure, doubling her pace. You pant with her, bucking your hips to her frantic pace, feeling pressure building in your dick. She feels it too as you tense against her.");
 	output("\n\nYou grab her hair and yank her down against your dick. She squeals in delight as you cum hard, " + (pc.cumQ() <= 100 ? "spurting a single jet against the back of her throat. She sucks noisily at your cock, her tongue swirling around your tip, gathering up as much as possible as you bury yourself against her." : "firing jet after jet against the back of her throat. She slurps greedily, noisily taking in every drop of your seed as you bury yourself in her mouth, spurting more and more cum down her hot throat.") + "");
 	output("\n\nBreathless, you slow your bucking hips, your breath slowing until the only sound in the clearing is the faint rustle of leaves overhead and the wet sounds of Prai sucking your cock clean");
 	output("\n\nShe leans back, drawing her lips from your dick with a noisy POP, and then grinning up at you. She seems to be waiting for something, but you're not exactly sure what.");
 	output("\n\nAt a loss, you simply pat her head. Prai immediately lets out a happy chirruping noise, rubbing her head against your hand.  Apparently, that was just what she wanted.");
 	output("\n\nYou lean back, letting out a sated sigh as she stands up, wiping the back of her mouth with a black-furred paw. She grins wryly, <i>“Was it good for you, too?”</i>");
 	
 	processTime(30+rand(5));
 	pc.orgasm();
 	
 	flags["PRAI_CUMLIPS"] = 1;
 	IncrementFlag("PRAI_BJ");
 	praiTalkMenuFirst(variation);
 }
 
 public function praiToyUntieFirst():void
 {
 	author("Frogapus");
 	showPrai();
 	clearOutput();
 	clearMenu();
 	
 	output("You pull your hands away from her body, and instead begin untying her. Even humming a bit as you work, to make sure the bound tanuki knows that you have no interest in finishing.");
 	output("\n\n<i>“Nuh …. nooooooo …”</i> she moans softly, wriggling so hard against her bindings that her breasts, free of the rope, bounce a little. <i>“Almost … almost …. there ….”</i> she grunts through gritted teeth, writhing beneath the rope.");
 	output("\n\nYou smile to yourself, watching the kui-tan tire herself out. Helpless, she struggles, unable to finish, finally letting out a sound somewhat akin to a sob and a frustrated bark. <i>“Oh-oh FIDDLESTICKS!”</i>");
 	output("\n\nOnce she's calmed down, you untie the rest of the bindings, and gently guide her down to the branch next to you.");
 	output("\n\nYou undo the rest of the ropes securing the breathless tanuki. One after the other, they come away, no knot particularly difficult, just effective in their numbers. You eventually uncover a slim, feminine frame attached to the heaving chest, dressed in a cream-colored dress and black leggings. A metallic harness dangles from her shoulder to her hip, blinking a myriad of blue lights. You uncover a masked female face with a feral countenance and a dazed expression.");
 	output("\n\nShe frowns at you, as you undo more ties. <i>“Rabbids and raspberries, what was all that about?”</i> she asks as she starts to dangle more precariously. <i>“Why wouldn't you … I mean … I was so … um …”</i> she trails off, apparently unsure as to how to end her sentence.");
 	output("\n\nYou offer her no explanation save for a meaningful glance, summoning a swell of pinkness to her cheeks. <i>“Um please be careful, please, though”</i> she says, a bit more clearly this time. ");
 	output("\n\n<i>“Sorry, but I've been tied up here a while, and I certainly appreciate your help " + (flags["PRAI_FIRST"] == undefined ? "friend" : "[pc.name]") + ", but if you don't mind very much, do you think you could do me the additional favor of making sure I land next to you instead of falling to the forest floor?”</i>");
 	output("\n\nIt takes some maneuvering, but you manage to loose her legs and waist enough for her to bend her free half into touching down on the thick branch next to you. " + (flags["PRAI_FIRST"] == undefined ? "The girl is surprisingly flexible, and along the way, you get a look at the short, but very evident bulge tenting from the front of her dress." : "As Prai clambers down, you take a nice, long look at the wet stain on the front of her black leggings.") + "");
 	output("\n\nWhen you undo the last of the bindings, she wobbles back, leaning against you. You brace for her weight, catching yourself just in time to keep from toppling off your foothold. " + (pc.isTaur() ? "It's a little tricky, and you have to brace one of your hind-most legs against the trunk of the tree to keep from falling off the wide branch." : "") + "");
 	output("\n\n<i>“Oof! Flying flapjacks, that was definitely a thing! Thank you so much, " + (flags["PRAI_FIRST"] == undefined ? "friend" : "[pc.name]") + ",”</i> she says, steadying herself against you, holding one hand against her head as she blinks and focuses on you. ");
 	output("\n\nShe actually stays there for nearly a minute, looking you over, her slight frame pressed against you, letting you feel the perkiness of her small breasts and a slight wetness to the bulge just below her waist. ");
 	if (flags["PRAI_MOOD"] == 1) output("She actually pushes a little harder against you before she seems to realize what she's doing, then leans away, blushing. She glances back at the edge of the branch and shifts back and forth uncertainly.");
 	else if (flags["PRAI_MOOD"] == 2) output("She immediately shoves back against you, wobbling at bit at the edge of the branch, just managing to maintain her balance.");
 	output("\n\nYou cough a bit and suggest that you make your way down to the ground.");
 	output("\n\n<i>“Oh my goodness grapejuice, you're right! We could break our necks staying up here in this tree!”</i> ");
 	output("\n\nShe nervously steps from one branch to the next, following you down the natural path to the jungle floor. Once there, she smiles ");
 	if (pc.tallness < 5*12+2) output("down ");
 	else if (pc.tallness > 5*12+2) output("up ");
 	output("at you, and toys with the hem of her skirt, giving you a little bob. <i>“Thank you very much for saving me, albeit in such an unorthodox way,”</i> she glances to the side, blushing. <i>“Um, is there anything I can do for you?”</i>");
 	
 	processTime(15+rand(5));
 	pc.addMischievous(3);
 	
 	praiTalkMenuFirst(2);
 }
 
 public function praiUntieFirst():void
 {
 	author("Frogapus");
 	showPrai();
 	clearOutput();
 	clearMenu();
 	
 	output("You decide that it's best to just set the little kui-tan free. One at a time, you undo the bindings that lash her to the thick branch. You eventually unwrap a slim, feminine frame dressed in a cream-colored dress and black leggings. A metallic harness dangles from her shoulder to her hip, blinking a myriad of blue lights. As you unsling more ropes, you uncover a masked female face with a black nose and frustrated expression.");
 	output("\n\n<i>“Oh larks and lighthouses! Thank you so much! I don't know what I would have--YEEK!”</i> she yelps. Her whole body dips suddenly as more of the ropes come loose. Dangling precariously, she babbles nervously, <i>“This might be trickier than just untying me. Um please be careful, please, though,”</i> she says, looking nervously at the broad branches below. ");
 	if (flags["PRAI_FIRST"] == undefined) output("<i>“Sorry, but I've been tied up here a while, and I certainly appreciate your help, friend, but if you don't mind very much, do you think you could do me the additional favor of making sure I land next to you instead of falling to the forest floor?”</i>");
 	output("\n\nIt takes some maneuvering, but you manage to loose her legs and waist enough for her to bend her free half into touching down on the thick branch next to you. " + (flags["PRAI_FIRST"] == undefined ? "The girl is surprisingly flexible and perches lightly on the broad branch. " : "") + "She sways for a moment or two, her black and gray striped tail swishing behind her for balance.");
 	output("\n\n<i>“Oof! Flying flapjacks, that was definitely a thing! Thank you so much, " + (flags["PRAI_FIRST"] == undefined ? "friend" : "[pc.name]") + ",”</i> she says, steadying herself against you, holding one hand against her head as she blinks and focuses on you. ");
 	output("\n\nShe actually pauses for a moment, her eyes flicking down over your body. Her slight frame even leans forward briefly, brushing her body against yours. ");
 	if (flags["PRAI_MOOD"] == 1) output("She actually rubs a little against you, her perky nipples touching lightly upon your " + (pc.hasBreasts() ? "breasts" : "chest") +  "before she seems to realize what she's doing. She blushes, rocking back away from you, biting her lip. A small step brings her dangerously close to the edge of the branch. You grab her arm, and her blush deepens, her chocolate-colored eyes meeting yours with a smouldering warmth. The kui-tan glances back at the edge of the branch and shifts back and forth uncertainly.");
 	else if (flags["PRAI_MOOD"] == 2) output("She immediately shoves back against you, wobbling at bit at the edge of the branch, just managing to maintain her balance.");
 	output("\n\nYou cough a bit and suggest that you make your way down to the ground.");
 	output("\n\n<i>“Oh my goodness grapejuice, you're right! We could break our necks staying up here in this tree!”</i>");
 	output("at you, and toys with the hem of her skirt, giving you a little bob. <i>“Thank you very much for saving me, albeit in such an unorthodox way,”</i> she glances to the side, blushing. <i>“Um, is there anything I can do for you?”</i>");
 	
 	processTime(15+rand(5));
 	pc.addNice(3);
 	
 	praiTalkMenuFirst(3);
 }
 
 public function praiSecondEncounter():void
 {
 	author("Frogapus");
 	showPrai(1);
 	clearOutput();
 	clearMenu();
 	
 	output("You push your way through the denser foliage of Mhen'ga, waxy green leaves the size of your head alternating with prickly blue vines. Underfoot, a juvenile cocksnake slithers through the underbrush, and overhead, an unknown avian lets out a cry like a violin breaking. You glance upwards, noting through the small gap in the canopy that the sky has been overcast for quite a while now.");
 	output("\n\nFinally, the brush gives way to a curious scene. Suspended inches off the ground is the grayscale kui-tan from before--Prai Ellit. She's wearing her usual bandolier over a white blouse and a yellow skirt as she struggles weakly. Her wrists and ankles are secured tightly by multicolored vines that suspend her, spreadeagled in the air. The vines don't seem to be moving, and a chlorophyllic woman behind her is slumped over the curve of a massive tree leaf. A pith helmet sits askew on Prai's head, while a cream-colored scarf is draped loosely about her neck.");
 	output("\n\nThe kui-tan twists this way and that, trying to get a look at you.");
 	if (flags["PRAI_MOOD"] == 1) output("\n\n<i>“Oh crackers! Well, this is embarrassing,”</i> she says her cheeks pinkening.");
 	else if (flags["PRAI_MOOD"] == 2) output("\n\n<i>“Oh fidgets. Of course it's you again. I'm still pretty miffed about last time, but, um,”</i> she blushes softly.");
 	output("\n\n<i>“I, uh, don't suppose you could give me a hand again, could you? I got a little too close when I was studying the pitcher plants. I tranquilized her, but she tied me up before the drug could kick in. So, well, I'm a little tied up for the next hour or so until the tranq wears off. Do you think you could help me out before she tries to do stuff to me? She's a little too … feminine for me to really have sex with her.”</i>");
 	output("\n\nYou could help her out, or you might take advantage of Prai's helpless state and play with the kui-tan. Alternatively, you could just leave the helpless kui-tan to her probably-not-too-unpleasant fate at the hands of the pitcher plant.");
 	
 	processTime(3+rand(3));
 	pc.createStatusEffect("Prai Cooldown", 0, 0, 0, 0, true, "", "", false, 24*60);
 	
 	addButton(0, "PlayWith", praiPlaySecond, undefined, "Play With Her", "");
 	addButton(1, "Help", praiHelpSecond, undefined, "Help Her Out", "");
 	addButton(2, "Leave", praiContinueSecond, undefined, "Cotinue On Your Way", "");
 }
 
 public function praiContinueSecond():void
 {
 	author("Frogapus");
 	showPrai(1);
 	clearOutput();
 	clearMenu();
 	
 	output("You roll your eyes and leave the hapless kui-tan to the mercies of the plant woman.");
 	output("\n\n<i>“Sneezes and snakes! Please? Oh, please??? You can't just leave me here!”</i> she pleads as you walk off. She twists her head to glance at the snoozing pitcher plant. <i>“I don't even LIKE girls …”</i> she wails behind you.");
 	output("\n\nYou ignore her protests and continue on your way.");
 	
 	processTime(3+rand(3));
 	pc.addHard(flags["PRAI_MOOD"] == 1 ? 6 : 3);
 	flags["PRAI_MOOD"] = 2;
 	flags["PRAI_EMAIL_NUMBER"] = 6;
 	flags["PRAI_EMAIL_STAMP"] = GetGameTimestamp();
 	
 	addButton(0, "Next", mainGameMenu, undefined, "", "");
 }
 
 public function praiPlaySecond():void
 {
 	author("Frogapus");
 	showPrai(1);
 	clearOutput();
 	clearMenu();
 	
 	output("You decide to play with her a bit before letting her out of her recent predicament. You look over the kui-tan with arms and legs akimbo, and decide to start with her skirt. You flip it up and grin at the startled <i>“Yeek!”</i> from Prai.");
 	output("\n\nYou remind her about the sleeping pitcher plant and she bites her lip. Beneath her skirt, she wears a pair of polka-dotted panties, concealing a the small bulge of her cock and balls. You slide your other hand against it, rubbing it gently, you fingers tracing along its stubby length, tickling at the flared head of her miniature horsecock. Your efforts are rewarded with a small twitch from her bulge and a faint dampness at its tip.");
 	output("\n\n<i>“Anh!”</i> She moans, biting her lip. ");
 	if (flags["PRAI_MOOD"] == 2)
 	{
 		output("\n\nAfter a moment, she shakes her head, hissing at you, <i>“This again? You should be setting me free, not … not playing with my dick!”</i>");
 		output("\n\nYou both glance at the pitcher plant as it snorts in its sleep. You point at it with an expression of <i>“I told you so.”</i>");
 	}
 	else if (flags["PRAI_MOOD"] == 1) output("\n\nPrai shivers softly, her body swinging gently from the vines. <i>“That … that feels really, really good … <i>“ she moans. She takes a shuddering breath and seems to regain some control over herself.");
 	output("\n\n<i>“I'm not … I'm not saying I don't like it,”</i> she whispers. <i>“But, goodness grape juice! Being restrained and played with is a really nice kink, but do you really think that now is the time for it?”</i>");
 	output("\n\nYou grin and slide your hands to her plump cheeks, squeezing them through the polka-dot fabric of her panties. Her legs quiver against their springy restraints, and her tail curls up into a perfect question mark. Her lipsticked lips part slightly and she lets out a quavering moan.");
 	output("\n\nThe pitcher plant stirs and you scold Prai for being so loud.");
 	if (flags["PRAI_MOOD"] == 2) output("\n\n<i>“It's your fault for touching me like that you … you … lunk!”</i> she snaps, trying to keep her volume low. <i>“Teacups and trifles! If you don't want me waking her up, just let me down.”</i>");
 	else if (flags["PRAI_MOOD"] == 1) output("\n\n<i>“I'm sorry,”</i> she says meekly. You blink at her change in tone and posture--it looks like she's responding well to being ordered around. <i>“I'll try to be more quiet, [pc.name].”</i>");
 	output("\n\nYou have a better idea and pull the scarf from her neck, carefully tying a thick knot midway through it.");
 	if (flags["PRAI_MOOD"] == 2) output("\n\n<i>“How is that going to help me out exact--MMPH!”</i>");
 	else if (flags["PRAI_MOOD"] == 1) output("\n\n<i>“Oh my! Yes, pl--MMPh!”</i>");
 	output(" she goes wide-eyed as you pop the makeshift gag in her mouth, carefully tying it behind her ears. You boop her black nose, and " + (flags["PRAI_MOOD"] == 2 ? "Prai snorts, giving you a withering look, but clearly establishing that she has no trouble breathing. " : "You can see a shiver run down her whole body, fluffing up her fur along the way as she takes in a deep breath through her nose and exhales a happy, albeit muffled, sigh. Clearly, she's having no trouble breathing. ") + "Her plump lips press in a tight pout around the knotted scarf, already smudging it with her pink lipstick. Despite her expression, she squirms softly as the front of her yellow skirt begins to tent up.");
 	output("\n\nAt this point, you decide you take your time, slowly running your hands up her sides, enjoying the muffled moan of pleasure from Prai.  Your fingers run over the tight cords of pitcher plant holding her in place, and cup your hands against her bound, boyish chest. Prai groans, her nipples stiffening under your hands, pushing against the tight fabric of her blouse. One button at a time, you unfasten her top, then slowly slide your hands against the almost-nonexistent mounds of her breasts. She's warm to the touch and getting warmer. She grows warmer still when you slip your fingers beneath the simple lace of her bra. Prai gasps as you roll her charcoal nipples between your fingertips, her back arching.");
 	output("\n\nYou spend some time there, rolling her fat nipples back and forth, Prai's small squeaks of pleasure accompanying your teasing. When you finally let them go, she lets out a muffled whine from her gag. You glance down, noting that there's already a large wet spot spreading out from the tented bulge in her skirt.");
 	output("\n\nShe trembles as your fingers roam over her chest, sliding down her sides and to her hips. From her angle, she can't see what you're doing behind her, and this seems to heighten her sensitivity. When you trace a fingertip atop the bulge in her skirt, she bucks against the vines, swinging sharply in her restraints.");
 	output("\n\n<i>“Mmmph!”</i> she moans in frustration. You touch a finger to her makeshift gag and find that it's already soaked with drool. " + (flags["PRAI_MOOD"] == 2 ? "Prai thrashes against her restraints, and shoots an angry glare over her shoulder at you." : " Prai lets out an almost musical trill as she nestles against you, nuzzling her gag against your fingertip.") + "");
 	output("\n\nYou decide to tease the kui-tan just a bit more. You grasp her cock through her skirt, and give it a long, slow squeeze. Prai lets out a muffled squeal, and you feel even more pre ooze out through the yellow fabric. You lean forward, brushing your lips against her neck, watching in amusement as her fur ruffles up. You press against her back, letting the kui-tan trap feel your " + (pc.hasBreasts() ? "breasts" : "chest") + " against her body. When you press your teeth lightly against her neck, gently biting her, you feel a shudder run through her whole body, her cock twitching in your hand.");
 	output("\n\nYou press your body against her bound form, feeling her back arch involuntarily, her bushy tail wrapping instinctively around your [pc.hips]. With her arms and legs are stretched out in an x-shape, the tips of her boots just barely touch the ground, unable to find the purchase to push back against you.");
 	output("\n\nAn old-fashioned pith helmet sits askew on her head, with one round, gray ear visible from her short, black hair. You peek around to see her face, set in an expression of acute frustration. " + (flags["PRAI_MOOD"] == 2 ? "Her shiny black nose is wrinkled up, and the black fur forming a <i>“mask”</i> around her brown eyes is set in an exasperated frown. The harsh expression is mitigated somewhat by the roundness of her white-furred cheeks, and the smudged pink lipstick on her black, glossy lips. A knotted, cream-colored scarf is serving as a makeshift gag in her mouth, and it's clear that without it, she'd be lobbing some harsh words at you. " : "Small pants of air exhale through her shiny black nose. Her chocolate-colored eyes, set in her black fur <i>“mask”</i> are half-lidded, look back at you with a dreamy expression of bliss and lust. Her white-furred cheeks are smudged with pink lipstick only half on her black, glossy lips. A knotted, cream-colored scarf is serving as a makeshift gag in her mouth, and she drools happily around it.") + "");
 	output("\n\nHer white blouse is partially undone, pulled apart by the stresses of the pose she's in, and several missing buttons expose the pink bra across her flat chest. Her gray-furred arms are diagonal to her chest, held rigid and wrapped tightly in vines, with her black hands clenching and unclenching in frustration. Her silver bandolier hangs from shoulder to hip, small blue lights blink across the entire piece.");
 	output("\n\nPrai's yellow skirt reaches her knees, and perks up in the front, clinging heavily to the flared head of her stubby, equine cock. Precum drips from it down her legs, to the tops of her calf-high black boots. Vines wrap tight around her ankles, pulling her legs apart and barely letting the tips of her feet alight on the ground. " + (flags["PRAI_MOOD"] == 2 ? "Every so often, she gives a sharp wiggle and groan, trying fruitlessly to free herself from her bindings." : "Every so often, she gives a sharp wiggle and groans, not trying to escape, it seems, but more out of enjoyment of her predicament.") + "");
 	output("\n\nShe looks to be about a minute away from cumming. This seems like a good time to plan your next move. Do you want to finish jacking off the little kui-tan, or deny her the pleasure of cumming? ");
 	if (pc.hasCock() && !pc.isTaur()) output("Alternatively, she's at an awfully convenient angle for a good fucking. ");
 	
 	pc.addMischievous(3);
 	pc.lust(20);
 	
 	addButton(0, "JackHer", , undefined, "Jack Her Off", "");
 	if (!pc.isTaur() && pc.hasCock()) addButton(1, "Suspension", , undefined, "Suspension Fuck", "");
 	else addDisabledButton(1, "Suspension", "Suspension Fuck", "You need a cock and to not be a taur for this.")
 	if (pc.hasCock()) addButton(2, "MakeHerBeg", , undefined, "Make Her Beg", "");
 	else addDisabledButton(2, "MakeHerBeg", "Maker Her Bed", "You need a cock for this.")
 	addButton(3, "Leave", , undefined, "", "");
 	
 }