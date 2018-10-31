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
 	if (flags["PRAI_WHO"] != undefined) showName("\nPRAI");
 	else showName("KUITAN\nGIRL");
 	showBust(praiBustDisplay(variation));
 }
 
 public function praiBustDisplay(variation:int = 0):String
 {
 	var sBust:String = "PRAI";
 	if (variation == 0) sBust += "_DRESS";
 	else if (variation == 1) sBust += "";
 	else sBust += "_NUDE";
 	
 	return sBust;
 }
 
 public function praiFirstEncounter():void
 {
 	clearOutput();
 	author("Frogapus");
 	showPrai();
 	clearMenu();
 	
 	if (flags["PRAI_FIRST"] == undefined) output("You stroll through a clearing, glad that for once the undergrowth and branches have left not only comfortable elbow room, but plenty of space overhead. You idly gaze upwards at the tall, gnarled trunks, barely taking note of a distant buzzing in the air. ");
 	else output("You stroll into a familiar clearing, filled with tall, gnarled trees. The wind blows, the rustling of countless leaves sounding like a distant ocean.");
 	output("\n\n<i>“Oh! Hey! Hey there! Can you lend a girl a hand? If it’s not too much trouble, if you please!”</i> calls a high pitched voice from above you.");
 	output("\n\nYou start, glancing upward, your eyes scanning the branches overhead. Relatively nearby, you find the source. A " + (flags["PRAI_FIRST"] != undefined ? "familiar " : "") + "person-sized bundle is tied to the underside of a branch, some 5 meters up. She’s buried under so many layers of rope and mismatched cords that it’s impossible to make out anything but rounded ears twitching out from one end, and a gray-striped, bushy tail from the other. ");
 	if (flags["PRAI_FIRST"] == undefined)
 	{
 		if(!CodexManager.entryUnlocked("Kui-Tan"))
		{
			CodexManager.unlockEntry("Kui-Tan");
			output("Your Codex beeps, indicating that the individual under the bundle is an example of the kui-tan species and unlocking a new entry.");
		}
		else output("Your codex beeps, indicating that the individual under the bundle is a kui-tan.");
 	}
 	else output("You’d bet a thousand credits that you know who it is, though.");
 	output("You could probably reach the branch easily, climbing up a few of the lower ones to get to her. " + (pc.isTaur() ? "A careful look at the branches confirms that they’re low and thick enough that you could easily pick your way up them. " : "") + "On the other hand, you have no idea who might be under all that rope--they might be tied there for a reason. Or, if you were feeling a bit wicked, you could untie her partially and have some fun with her.");
 	
 	processTime(3+rand(3));
 	flags["PRAI_MET"] = 1;
 	pc.createStatusEffect("Prai Cooldown", 0, 0, 0, 0, true, "", "", false, 24*60);
 	
 	addButton(0, "ToyWith", praiToyFirst, undefined, "Toy With Her", "Take advantage of the situation and tease the bound kui-tan.");
 	addButton(1, "Untie", praiUntieFirst, undefined, "Untie Her", "She looks like she’d appreciate it if you just got her down.");
 	addButton(2, "Leave", praiContinueFirst, undefined, "", "");
 }
 
 public function praiContinueFirst():void
 {
 	clearOutput();
 	author("Frogapus");
 	showPrai();
 	clearMenu();
 	
 	output("You decide that if someone chose to tie her up there so securely, there must have been a reason for it. You continue through the jungle.");
 	output("\n\n<i>“Hello?”</i> she calls out to the empty clearing as you leave it behind. <i>“Are... are you still there? Please don’t leave; I really, really need some help!”</i>");
 	
 	pc.addHard(3);
 	
 	processTime(3+rand(4));
 	addButton(0, "Next", mainGameMenu, undefined, "", "");
 }
 
 public function praiToyFirst():void
 {
 	clearOutput();
 	author("Frogapus");
 	showPrai();
 	clearMenu();
 	
 	output("You decide to have a little fun with the bound kui-tan before making any sort of decision. You clamber up to a branch within reach, and set about undoing the ropes around her chest. As the mismatched restraints come away, you reveal a flat, slim chest concealed under a cream-colored top.");
 	output("\n\n<i>“Oh larks and lighthouses! Thank you SO much!”</i> she says.");
 	output("\n\nWith her head and face bound, it’s impossible to see her expression. You imagine she must be surprised as, instead of untying the rest of her, you tug her neckline of her dress down, and unclip the front of her blue bra. Fine gray fur covers her petite chest, and her breasts are nonexistent, the only protrusion caused by the puffiness of her inverted, black nipples.");
 	output("\n\n<i>“Wait, what are you doing? Oh, sneezes and snakes, " + (flags["PRAI_FIRST"] == undefined ? "you’re just some kind of pervert, aren’t you?" : "[pc.name], is that you again?") + "”</i> she asks, struggling fruitlessly against the rest of the ropes.");
 	output("\n\nYou smile to yourself, deigning not to answer the trussed-up tanuki, instead caressing her breasts softly. As you run your hands through her plush fur, you let her nipples slide between your fingers. You feel goosebumps under her fur as her breath quickens.");
 	if (flags["PRAI_FIRST"] == undefined) output("\n\n<i>“Oh quadrupeds! I think I might have prefered the zil!”</i> she yelps as you continue your teasing.");
 	else if (flags["PRAI_MOOD"] == 1)
 	{
 		output("\n\n<i>“[pc.name], if that’s you, then... I guess it’s okay. But you’ll let me down eventually, right?”</i> Prai asks. <i>“It </i>is<i> you, right?”</i>");
 		output("\n\nYou grin and decide not to answer right away.");
 	}
 	else if (flags["PRAI_MOOD"] == 2)
 	{
 		output("\n\n<i>“Flying flapjacks, [pc.name]! If that’s you, I am going to slap you so hard once I get loose!”</i> Prai yells angrily, thrashing against her bindings.");
 		output("\n\nYou shrug and decide that it might be worth it and double-down on feeling her up.");
 	}
 	output("\n\n<i>“Why are you... ohhhh... that feels nice...”</i> Her voice is a husky purr as you squeeze her chest. You give her nipples a pinch and a squeal issues from the mass of ropes covering her head. Your fingers continue to work them as she squirms helplessly against the ropes.");
 	output("\n\nBetween pants and moans, she manages to gasp out, <i>“Please...”</i>");
 	output("\n\nYou grin and lean in towards her head, <i>“Please what?”</i>");
 	output("\n\nShe whimpers, and you immediately release her slim frame. ");
 	output("\n\n<i>“No! Oh crackers! Don’t just...”</i> she moans and bucks against the restraints.");
 	output("\n\n<i>“Don’t what?”</i> you ask playfully.");
 	output("\n\n<i>“Don’t... stop,”</i> she says after a breathy pause.");
 	output("\n\nHappily, you return to massaging her breasts, trailing your fingertips lightly over them as she squeals in delight. When you roll them between your thumb and index finger, she lets out a long, low moan, and her hips buck hard against the rope.");
 	output("\n\n<i>“I’m gonna... I’m gonna... ”</i> she gasps.");
 	output("\n\nIt’s clear that she’s on the verge of climaxing. Do you continue teasing her breasts and let her cum, stop and untie her, or stop and walk off?");
 	
 	processTime(5);
 	pc.lust(15);
 	
 	addButton(0, "Continue", praiToyBoobFirst, undefined, "Continue To Completion", "Rather than untying her, help her in a different way.");
 	addButton(1, "Untie", praiToyUntieFirst, undefined, "Stop And Untie", "She looks like she’d appreciate it if you just got her down now.");
 	addButton(2, "Leave", praiToyLeaveFirst, undefined, "", "");
 }
 
 public function praiToyLeaveFirst():void
 {
 	clearOutput();
 	author("Frogapus");
 	showPrai();
 	clearMenu();
 	
 	output("You pull your hands away from her body, and instead begin climbing down the tree. You even try humming a bit as you make your way, to make sure the bound kui-tan knows that you have no interest in finishing.");
 	output("\n\n<i>“Nuh... nooooooo...”</i> she moans softly, wriggling hard against her bindings. <i>“Almost... almost... there...”</i> she grunts through gritted teeth, writhing beneath the rope.");
 	output("\n\nYou smile to yourself, watching the kui-tan tire herself out. Helpless, she struggles, unable to finish, finally letting out a sound somewhat akin to a sob and a frustrated bark. <i>“Oh-oh FIDDLESTICKS!”</i>");
 	output("\n\nYou clamber back down the branches, leaving the frustrated kui-tan bound to the tree branch, and continue on your way, her words echoing in the clearing behind you.");
 	if (flags["PRAI_FIRST"] == undefined) output("\n\n<i>“H-hey! Whoever you are! That was a really j-jerk thing to do!”</i> she calls out to the empty clearing as you leave it behind. <i>“Are... are you still there? Crockpots and crabapples! You could have at least finished! Please don’t leave! I really, really need some help!”</i>");
 	else if (flags["PRAI_MOOD"] == 1) output("\n\n<i>“H-hey! Are you still there? What’s going on?”</i> she calls out. <i>“[pc.name], you’re not going to just leave me out here, are you?”</i>");
 	else if (flags["PRAI_MOOD"] == 2) output("\n\n<i>“Again? </i>Again?<i>”</i> she yells. <i>“You’re gonna leave me to get xenofucked again? Oh, [pc.name] you unmitigated jerk!”</i>");
 	
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
 	clearOutput();
 	author("Frogapus");
 	showPrai();
 	clearMenu();
 	
 	output("You continue massaging her chest, tweaking and teasing her nipples, watching, entertained, as she squirms against her rope bindings. ");
 	output("\n\n<i>“Harder!”</i> she gasps, trembling. <i>“Please" + (flags["PRAI_FIRST"] != undefined ? " [pc.name]" : "") + ", harder!”</i> ");
 	output("\n\nYou decide to acknowledge the kui-tan’s wishes, and pinch her nipples firmly, drawing out a high-pitched squeal from her. Her hips thrust against the ropes restraining them, as she grinds in bliss.");
 	output("\n\n<i>“Mmmmuh! Mmmmore!”</i> she moans. After a ragged inhale of air, she adds, <i>“Please?”</i>");
 	output("\n\nYou increase the pressure, tweaking her nipples hard, and tugging on them for good measure.");
 	output("\n\n<i>“Eep!”</i> she squeaks out, her whole body stiffening against her restraints. She bucks repeatedly as you continue your hold on her. You see a dribble of cum oozing out from between the ropes at her waist. She holds her restrained arch for all of a minute, before relaxing, hanging limply within her bindings.");
 	output("\n\n<i>“Ummah...”</i> she gurgles, following it with a string of other nonsense sounds.");
 	output("\n\nThe kui-tan seems a bit out of it at this point. You doubt that she’d even notice if you left. If you decide to untie her, though, given her limp state, you should probably be ready to catch her.");
 	
 	pc.addMischievous(3);
 	processTime(10+rand(5));
 	pc.lust(15);
 	
 	addButton(0, "Untie", praiToyBoobUntieFirst, undefined, "Untie Her", "She looks like she’d appreciate it if you just got her down.");
 	addButton(1, "Leave", praiToyBoobLeaveFirst, undefined, "", "");
 }
 
 public function praiToyBoobLeaveFirst():void
 {
 	clearOutput();
 	author("Frogapus");
 	showPrai();
 	clearMenu();
 	
 	output("You climb back down the branches, leaving the babbling tanuki still tied up, her breasts hanging free as she babbles deliriously. Well, whatever happens to her, you’re pretty sure you provided the day’s high point.");
 	if (flags["PRAI_FIRST"] != undefined)
 	{
 		output("\n\nPrai recognized your voice, though. It’s a safe bet that she’ll be upset with you next time.");
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
 	clearOutput();
 	author("Frogapus");
 	showPrai();
 	clearMenu();
 	
 	output("You undo the rest of the ropes securing the breathless kui-tan. One after the other, they come away, no knot particularly difficult, just effective in their numbers. You eventually uncover a slim, feminine frame wrapped in a cream-colored dress and black leggings. A blue harness runs from her shoulder to her hip, blinking a myriad of blue lights. You reveal a fur-masked female face with a dazed expression.");
 	output("\n\nShe babbles more nonsense syllables as you untie her, coming to as she starts to hang more precariously from the remaining ties.");
 	output("\n\n<i>“W-wait...”</i> she murmurs, blinking rapidly and focusing her eyes. <i>“Please be careful, please,”</i> she says, a bit more clearly this time.");
 	if (flags["PRAI_FIRST"] == undefined) output("\n\n <i>“Sorry, but I’ve been tied up here a while, and I really do appreciate your help, but if you don’t mind very much, do you think you could do me the additional favor of making sure I stand next to you instead of falling to the forest floor?”</i>");
 	output("\n\nIt takes some maneuvering, but you manage to loose her legs and waist enough for her to bend her free half into touching down on the thick branch next to you. " + (flags["PRAI_FIRST"] == undefined ? "The girl is surprisingly flexible, and along the way, you get a look at the large, wet stain across the front of her dress." : "As Prai clambers down, you take a nice, long look at the wet stain on the front of her black leggings."));
 	output("\n\nWhen you undo the last of the bindings, she wobbles back, leaning against you. You brace for her weight, catching yourself just in time to keep from toppling off your foothold. " + (pc.isTaur() ? "It’s a little tricky, and you have to brace one of your hind-most legs against the trunk of the tree to keep from falling off the wide branch." : ""));
 	output("\n\n<i>“Oof! Flying flapjacks, that was definitely a thing! Thank you so much, " + (flags["PRAI_FIRST"] == undefined ? "friend" : "[pc.name]") + ",”</i> she says, steadying herself against you, holding one hand against her head as she blinks and focuses on you. <i>“Oh! Um, thank you again, " + pc.mfn("handsome", "cutie", "cutie") + ".”</i>");
 	if (flags["PRAI_FIRST"] == undefined) output("\n\nShe wobbles a bit, holding on to you as you both stand on the branch. Her black-furred hands clutch at your chest and you can feel her slight chest rise and fall as she takes a few deep breaths.");
 	else if (flags["PRAI_MOOD"] == 1) output("\n\nShe pauses briefly, looking you over, her slight frame pressed against you, letting you feel the small, wet bulge just below her waist.");
 	else if (flags["PRAI_MOOD"] == 2) output("\n\nShe blinks and frowns at you. <i>“But don’t think I’ve forgotten about last time,”</i> she says, folding her arms.");
 	output("\n\nYou cough a bit and suggest that you make your way down to the ground.");
 	output("\n\n<i>“Oh my goodness grapejuice, you’re right! We could break our necks staying up here in this tree!”</i>");
 	output("\n\nShe nervously steps from one branch to the next, following you down the natural path to the jungle floor. Once there, she smiles ");
 	if (pc.tallness < 5*12+2) output("down ");
 	else if (pc.tallness > 5*12+2) output("up ");
 	output("at you, and toys with the hem of her blouse, giving you a little bob. <i>“Thank you very much for saving me, " + (flags["PRAI_FIRST"] == undefined ? "albeit in such an unorthodox way" : "again") + ",”</i> she glances to the side, blushing. <i>“Um, is there anything I can do for you?”</i>");
 
 	processTime(15+rand(5));
 	pc.lust(10);
 
 	praiTalkMenuFirst(1); 
 }
 
 public function praiTalkMenuFirst(variation:int):void
 {
 	addButton(0, "Appearance", praiAppearance, variation, "", "");
 	addButton(1, "Her", praiHerFirst, variation, "Her", "Ask her about herself.");
 	addButton(2, "Tree", praiTreeFirst, variation, "Tree", "Ask how she got stuck in the tree.");
 	//Gemu
 	if (flags["PRAI_WHO"] != undefined) addButton(3, "Gemu", praiGemuFirst, variation, "Gemu", "She mentioned a “Gemu,” see if she’ll tell you what it is.");
 	else addDisabledButton(3, "Locked");
 	//Help
 	if (flags["PRAI_WHAT"] != undefined) addButton(4, "Help", praiHelpFirst, variation, "Help", "Ask her if she needs help navigating the jungle.");
 	else addDisabledButton(4, "Locked");
 	//Sex
 	if (flags["PRAI_WHO"] == undefined) addDisabledButton(5, "Locked");
 	else if (flags["PRAI_CUMLIPS"] != undefined) addDisabledButton(5, "Sex", "Sex", "You already tried this, you shouldn’t push your luck."); 
 	else if (pc.lust() < 33) addDisabledButton(5, "Sex", "Sex", "You aren’t turned on enough for this.")
 	else addButton(5, "Sex", praiSexFirst, variation, "Sex", "You helped her, see if she’s willing to help you.");
 	
 	addButton(14, "Leave", praiLeaveFirst, variation, "", "");
 }
 
 public function praiAppearance(variation:int):void
 {
 	clearOutput();
 	author("Frogapus");
 	showPrai();
 	
 	output("You look the small kui-tan up and down. Her black hair is short and mussed, likely due to her recently head-to-toe immobilization. From it perk two gray, round ears. Her brown eyes are wide and set in a black mask of fur covering her face, making her look like a diminutive robber. Her shiny nose is black, and a pink smear of lipstick mostly covers her matching, glossy-black lips. ");
 	if (flags["PRAI_CUMLIPS"] == 1) output("Much of it is smeared across the white fur of her cheeks, along with a few streaks of drying cum.");
 	output("\n\nA cream colored sundress hangs on her slim frame, barely rising up over the bra on her flat chest. Her arms are exposed, gray and white furred leading down to black fur on her nimble little fingers. She fidgets with the metallic bandolier slung from shoulder to hip on her, fastening and unfastening small compartments as you look her over. At her hip, the bandolier is thicker, almost a satchel, and small blue lights blink across the entire piece.");
 	output("\n\n");
 	if (variation == 1) output("There’s a large stain on the lower part of her dress, just over the small bulge at her crotch, showing where it’s been soaked with her cum. ");
 	else if (variation == 2) output(" There’s a large stain on the lower part of her dress, just over the small bulge at her crotch, showing where it’s been soaked with her pre. ");
 	else if (flags["PRAI_CUMLIPS"] == 1) output("There’s a large stain on the lower part of her dress, just over the small bulge at her crotch. It looks like the little kui-tan got more than a little excited while servicing you. ");
 	if (variation == 3) output("Her cream-colored sundress hangs loosely on her, ending with a thigh-high hem. Her skinny legs continue down, wrapped in tight, black leggings, ending in calf-high black boots. ");
 	output("She shifts back and forth from leg to leg, occasionally leaning forward to balance on her toes before rocking back.");
 	
 	processTime(1);
 	pc.lust(5);
 	
 	praiTalkMenuFirst(variation);
 	addDisabledButton(0, "Appearance");
 }
 
 public function praiLeaveFirst(variation:int):void
 {
 	clearOutput();
 	author("Frogapus");
 	showPrai();
 	clearMenu();
 	
 	if (variation == 1)
 	{
 		output("You bid her farewell.");
 		if (flags["PRAI_FIRST"] == undefined)
 		{
 			output("\n\n<i>“Well, it was wonderful meeting you, and thank you again! I hope I bump into you sometime soon!”</i> she says cheerily. <i>“Thank you very much for taking the time to let me down there. You’re a regular space hero, aren’t you?”</i>");
 			output("\n\n<i>“I mean, assuming space heroes go around teasing bound-up stranger’s nipples,”</i> she says with a wink. <i>“No, really though, I appreciate the save." + (silly ? " 10/10 would get save-molested by you again,”</i> she giggles, then claps her hands to her cheeks, blushing, as if surprised to have said that." : "”</i>"));
 			output("\n\nYou pat her head and she lets out a musical churr, hugging you once more. <i>“I’m so sorry--I’m just repeating myself. Thank you again!”</i>");
 		} 		
 		else if (flags["PRAI_MOOD"] == 1)
 		{
 			output("\n\n<i>“Well, it was wonderful seeing you, and thank you again! I can’t wait to see you again!”</i> she says cheerily. <i>“Thank you very much for taking the time to let me down there. You’re a regular space hero, aren’t you?”</i>");
 			output("\n\n<i>“I mean, assuming space heroes go around teasing bound-up stranger’s nipples,”</i> she says with a wink. <i>“No, really though, I appreciate the save." + (silly ? " 10/10 would get save-molested by you again,”</i> she giggles, then claps her hands to her cheeks, blushing, as if surprised to have said that." : "”</i>"));
 			output("\n\nYou pat her head and she lets out a musical churr, hugging you once more. <i>“I’m so sorry--I’m just repeating myself. Thank you again!”</i>");
 		}
 		else if (flags["PRAI_MOOD"] == 2)
 		{
 			output("\n\nPrai gives you an appraising look and lets out a frustrated sigh. <i>“I was really upset, but if you were willing to save me this time, you can’t be all bad. Thank you for helping me out of that bind,”</i> she says finally.");
 			output("\n\n<i>“I don’t know why it occurred to you to jill me off when I was so angry with you,”</i> she says, frowning. <i>“Are orgasms how you solve all your problems?”</i>");
 			if (pc.isNice()) output("\n\nYou feel a little embarrassed and offer the kui-tan a quick apology.");
 			else if (pc.isMischievous()) output("\n\nYou roll your eyes but endure the kui-tan’s tirade.");
 			else output("\n\nYou can’t help but grin openly at her question, and smirk in confirmation.");
 			output("\n\nShe sighs in defeat, her tense pose dropping. <i>“I... I can’t argue with the results, though.Thank you very much for saving me. And if </i>having</i> to be fondled is the price I pay for it, well, I’ll just have to endure it,”</i> she adds with a quick smile and a wiggle of her hips.");
 			output("\n\nThe kui-tan leans forward and gives you a hug. <i>“Thank you for saving me and patching things up... in your own weird way, of course. You’ve got places to be, and it does mean a lot to me that you’d take some time out for me.”</i>");
 			output("\n\nYou smile and return the small woman’s hug.");
 		}
 		output("\n\nYou leave the quirky kui-tan behind in the clearing and continue on your way.");
 	}
 	else if (variation == 2)
 	{
 		output("You bid her farewell.");
 		output("\n\n<i>“But, but... I wanted to cum...”</i> she says, dazedly. She takes a few shuddering breaths and holds her hands against the small bulge in her leggings. <i>“I... uh... th-thank you for freeing, me, though,”</i> she says softly. ");
 		output("\n\nYou smile and leave the quirky woman behind in the clearing and continue on your way. ");
 	}
 	else if (variation == 3)
 	{
 		output("You decide that the little kui-tan is safe and bid her farewell.");
 		output("\n\n<i>“Oh! Yes! Well, thank you very much for your help, again! I actually need to get back to collecting more samples,”</i> she says. <i>“I’m still trying to figure out how to get honey from these Zil...”</i> she says, resting her chin on her hand and frowning.");
 		output("\n\nYou can’t help but grin as you wish her luck. Turning, you leave the quirky woman behind in the clearing and continue on your way. ");
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
 	clearOutput();
 	author("Frogapus");
 	showPrai();
 	
 	output("You introduce yourself, and then ask the woman about her identity.");
 	if (flags["PRAI_FIRST"] == undefined)
 	{
 		output("\n\n<i>“Oh! Stars and skittles, I’m sorry! Hello! Hi! Hey there! I’m Prai Ellit!”</i> she says, her eyes widening, and her knees dipping into a quick curtsy. <i>“I’m sorry--I guess we didn’t really have an opportunity for introductions up there...”</i> she glances up at the tree branch then down at her " + (variation != 3 ? "stained dress" : "cream-colored dress, covered in small chips of bark and stains from sap") + ".");
 		output("\n\n<i>“Oh fidgets!”</i> she exclaims, " + (variation != 3 ? "looking down at the very large wet spot. Her cheeks seem to pinken under her ash-colored fur, and s" : "trying to brush some of it off. S") + "he immediately flips open a segment of her sash, unfolding a large, satchel-like pouch, rummaging through it. <i>“Sorry! Just a moment!”</i>");
 		output("\n\nShe rummages for a bit, then freezes, a look of shock spreading across her face.");
 		output("\n\n<i>“Sneezes and snakes! Did you say ‘Steele?’ As in Steele Tech? That’s who made my Codex!”</i> she explains, excitedly tapping one of the panels on her sash, lighting up an oddly familiar, but wrong-looking display.");
 		output("\n\nShe catches your odd look, then taps it off, looking embarrassed. <i>“Well, not technically. I couldn’t afford one--real Codices are prohibitively expensive. This one’s actually a knock-off that the Camarilla makes. It’s called a Grim-R. They’re a lot cheaper, but maybe not as reliable. And you can’t really upgrade them; you have to just buy a whole new one when it gets too out of date.”</i>");
 		output("\n\n<i>“Sorry, but this is what I was looking for!”</i> She withdraws her other hand from her satchel and pulls out something pink and rubbery. Without further explanation, she slaps it against her stained " + (variation != 1 ? "blouse" : "dress") + ". The blob sticks, then slowly begins to move across the smudges of sap, leaving the cloth dry and clean in its wake.");
 		output("\n\n<i>“I’m a biologist,”</i> she says hurriedly, as you open your mouth to ask about the blob. <i>“I catalog and sometimes collect samples of life from across the universe. Currently, I’m on contract for Xenogen Biotech. I was supposed to be doing field research here on Mhenga before I got myself tied up.”</i>");
 		output("\n\n<i>“This little one is a Gemu,”</i> she says, plucking the pink blob from her now-pristine dress. She smoothes down her dress over her hips, a small bulge at her crotch briefly visible. <i>“Xenogen was going to mass produce them, but scrapped the project. I saved this little one from the incinerator.”</i>");
 		output("\n\nYou take a closer look and see that the three-inch creature has the lower body of a slug and the top half of an armed humanoid. It waves once before she tucks it away in her satchel.");
 		output("\n\nYour eyes flicker over the slight bulge in her skirt and she catches you. <i>“Oh, if you were wondering about it, yes--there’s a dick under there,”</i> she says with a wave of her hand. <i>“Nothing super special--");
 		if (variation == 2) output("just a miniature equine cock" + (silly ? ", I call him ‘Little Sebastian’" : "") + ".--");
 		output("though I’ve grabbed a mod or two from Xenogen’s scrapped project lines. Some fluid boosts and a minor mod to my existing structure. Though, I guess you weren’t really asking about that...”</i> she says, blinking. <i>“Oh my gosh, was I just rambling about my... oh crackers...”</i> she says blushing furiously.");
 	}
 	else
 	{
 		output("\n\nPrai gives you an odd look. <i>“You’ve met me already. You want to run through introductions now?");
 		output("\n\nYou nod in assent, and she shrugs. <i>“Well, you did save me again--it’s no fur off my tail if you want to hear about me again.”</i>");
 		output("\n\n<i>“I’m Prai Ellit--a xenobiologist. Currently, I’m on contract with Xenogen, studying the flora and fauna of Mhen’ga. It’s been... challenging so far,”</i> she says with a wry smile. ");
 		output("\n\n<i>“I’ve got a little bit of tech on me--my Grim-R, which is a kind of knockoff Codex, and I’ve got my companion--my gemu,”</i> she says, reaching into a pouch on her bandolier, pulling out a small, pink, pulsating blob.");
 		output("\n\n<i>“Not that you need my life story, but the short version is that I was born a guy, but I think of myself as a girl,”</i> she says with a smile <i>“And yes, I have guys parts. And yes, I’ve got a mod or two from some scrapped Xenogen projects. I don’t think that makes me any less of a girl, though, do you?”</i> she says" + (flags["PRAI_MOOD"] == 1 ? " with a smile and twirl. The skirt of her dress billows out around her, and she tucks it down before she reveals anything. She grins and sticks her tongue out at you." : "."));
 	}
 	output("\n\n<i>“Is there anything else that you wanted to know?”</i> she asks, raising an eyebrow.");
 	
 	processTime(8+rand(5));
 	flags["PRAI_WHO"] = 1;
 	
 	praiTalkMenuFirst(variation);
 	addDisabledButton(1, "Her");
 }
 
 public function praiTreeFirst(variation:int):void
 {
 	clearOutput();
 	author("Frogapus");
 	showPrai();
 	
 	output("You ask the kui-tan exactly how she ended up tied to the tree branch.");
 	output("\n\n<i>“Errrr...”</i> she says, blushing a bit. <i>“That’s a little embarrassing. " + (flags["PRAI_FIRST"] != undefined ? "As you know, " : "") + "Xenogen Biotech hired me to do some fieldwork here on Mhenga.”</i>");
 	if (flags["PRAI_FIRST"] == undefined) output("\n\n<i>“I ran into some Zil females and my Grim-R,”</i> she gestures to one of the glowing panels on her sash, <i>“told me that they communicate through dance.”</i> She pauses, her face turning an even brighter shade of pink. <i>“Well, long story short, they laughed--for WAY too long--and I said some things that I probably shouldn’t have.”</i> She frowns, staring at the ground, <i>“Though in my defense, they absolutely WERE trashy, waxy vermin.”</i>");
 	else output("\n\n<i>“My luck is awful. I ran into those same Zil females from before--or maybe they were looking for me,”</i> she says, making a face. <i>“Either way, they nabbed me before I could do anything, and tied me up to another branch,”</i> she says. <i>“At least I got to insult their mothers this time.”</i>");
 	output("\n\n<i>“Anyway, one wanted to drug me, and the other wanted to... erm, ahem, ‘mate’ with me,”</i> she says, looking away at the last line. <i>“In the end they decided to tie me to a tree and find a tiebreaker vote.”</i>");
 	output("\n\n<i>“I’m kind of relieved, actually,”</i> she says with a nervous smile. <i>“I’m not really into females, so I was more than happy to not have them, um, mate with me.”</i>");
 	
 	processTime(5+rand(3));
 	flags["PRAI_WHAT"] = 1;
 	
 	praiTalkMenuFirst(variation);
 	addDisabledButton(2, "Tree");
 }
 
 public function praiGemuFirst(variation:int):void
 {
 	clearOutput();
 	author("Frogapus");
 	showPrai();
 	
 	output("You ask her about the odd creature she tucked into her satchel.");
 	output("\n\n<i>“Oh, the Gemu?”</i> she asks, pulling it back out. She holds it up to your eye level to let you inspect the jelly-like creature.");
 	output("\n\nThe blobby being has a vaguely humanoid torso, complete with arms and three-fingered hands. Its face turns up at you, peering at you with overlarge eyes perched over a rounded snout. Two globular breasts protrude from its chest, just above a rounded belly that curves down to a slug-like bottom half. The creature is pink and slightly translucent, reminding you of the rahn you’ve encountered. A red fringe of pseudopods runs from the top of its head and down either side of it’s lower body.");
 	output("\n\n<i>“It’s a scrapped Xenogen Biotech project. These were supposed to be for custodial uses aboard ships,”</i> Prai explains. <i>“They’re semi-sentient, and they absorb inanimate organics and are pretty indestructible.”</i> She closes her fist around the tiny creature, making it bulge out from between her fingers. When she opens her hand again, the Gemu it back to its original form, making a happy chittering sound.");
 	output("\n\nIntrigued, you ask why the project was scrapped.");
 	output("\n\n<i>“According to official statements,”</i> Prai says with a roll of her eyes, <i>“Xenogen was working on them for a while, but about four years into the project, JoyCo. caught wind of it and filed for copyright infringement. Turns out JoyCo. had been working on something similar for their Goovolvers. Rather than fight the lawsuit, Xenogen pulled the plug on the project. The poor things are built off of rahn </i>and<i> galotian DNA, but they’re not particularly bright--there were already hundreds of them made.”</i>");
 	output("\n\nThe Gemu gives another chitter and places its mouth over Prai’s fingertip, its rubbery head stretching all the way over her first two digits.");
 	output("\n\n<i>“I couldn’t save them all,”</i> she says sadly. <i>“But I rescued this little one from ‘decommissioning,’”</i> she practically spits the last word, her eyes narrowed, but her other finger gently stroking the tiny creature’s head.");
 	output("\n\nShe carefully pries the jelly slug from her finger, then tucks it away in her satchel. ");
 	output("\n\n<i>“For the time being, she’s my travelling companion and part-time laundry aid.”</i>");
 	
 	processTime(7+rand(3));
 	
 	praiTalkMenuFirst(variation);
 	addDisabledButton(3, "Gemu");
 }
 
 public function praiHelpFirst(variation:int):void
 {
 	clearOutput();
 	author("Frogapus");
 	showPrai();
 	
 	output("Given her recent predicament, you decide to ask the kui-tan if she needs help");
 	output("\n\nHer ears flutter for a second, and she leans in with a smile. <i>“Oh my stars and shivers! Is the space hero here to rescue me from peril?”</i> She spins, leaning back against you, her face pulling into an expression of mock horror. <i>“Villains and vagabonds! Who knows what sort of deadly predations lie in wait for the helpless waif! What will I do without a big, strong protector?”</i>");
 	output("\n\nYou point out that you <i>did</i> just rescue her from being held prisoner on an alien planet.");
 	output("\n\nShe humphs and pirouettes back to her own feet, crossing her arms and cocking her hips to one side. <i>“I’m a grown woman AND a professional field xenobiologist. Mishaps aside, I know what I’m doing.”</i> Her expression softens and she gives you a smile. <i>“I AM grateful for your help today, though. Just don’t go assuming that every damsel is always in distress.”</i>");
 	
 	processTime(5+rand(3));
 	
 	praiTalkMenuFirst(variation);
 	addDisabledButton(4, "Help");
 }
 
 public function praiSexFirst(variation:int):void
 {
 	clearOutput();
 	author("Frogapus");
 	showPrai();
 	
 	output("You ask her if she’d like to help you relieve some tension.");
 	if (variation == 3) output("\n\n" + (flags["PRAI_SEX"] == undefined ? "<i>“Stars and snakes, is this how you start every conversation with a new acquaintance?”</i> she asks in surprise. " : "") + "<i>“I mean... I’m not going to lie, something about being bound up did pique my interest a bit, but...”</i> She frowns, considering your offer.");
 	
 	//She doesn’t wana fuck you 
 	if (!pc.hasCock() || (variation == 1 && !pc.isMasculine(true))) 
 	{
 		output("\n\n<i>“Well I mean, I really appreciate the offer, but you’re not really my type,”</i> she says, looking off to the side. She glances back to you, looking worried. <i>“I mean. I’m really sorry, but I’ve got preferences, and I’m very flattered, and more than a little grateful, but I’m just not feeling it. Sorry about that!”</i> ");
 		
 		flags["PRAI_CUMLIPS"] = 2;
 		
 		praiTalkMenuFirst(variation);
 		addDisabledButton(5, "Sex");
 		return;
 	}
 	
 	if (!pc.isMasculine(true))
 	{
 		if (variation == 2) output("\n\n<i>“You’re not really my type, but...”</i> she squirms, running her fingers up against the outline of a short, stubby cock straining against her leggings. <i>“I guess some physical gratitude might not hurt.”</i>");
 		else if (variation == 3) output("\n\n<i>“You’re not really my type, but...”</i> she squirms, glancing down at the front of her dress, <i>“I </i>am<i> pretty wound up, though.”</i>");
 	}
 	else output("\n\n<i>“Well, I suppose " + (variation == 3 ? "I could" : "it would be fair") + ",”</i> she says, putting a finger to her mouth and looking thoughtful.");
 	output("\n\nYou raise your eyebrow at her, pondering, then slowly begin " + (pc.isNude() ? "getting yourself primed and ready" : "undoing your [pc.gear]") + ".");
 	if (flags["PRAI_BJ"] == undefined)
 	{
 		output("\n\n<i>“Land sakes and garter snakes!”</i> she says, frowning down at your " + (pc.isNude() ? "boldness" : "descent into nudity") + ", <i>“I didn’t say I would, did I?”</i>");
 		output("\n\nYou are momentarily baffled by her response.");
 		output("\n\n<i>“That’s the problem with you sexed-up Rushers. You hit planet and assume everyone’s there to fuck you or suck you. I mean, yes, granted, you saved me from the branch, and I’m not opposed to the bit of a massage you gave me, but there’s a line,”</i> she scolds.");
 		output("\n\nYou’re taken aback, and momentarily consider " + (pc.isNude() ? "backing off" : "slinging your clothes back on") + ". Except... her eyes haven’t left your crotch since you mentioned it.");
 		output("\n\n<i>“But on the other hand, you </i>did<i> ask me, and I </i>do<i> very much want to,”</i> she says thoughtfully. She frowns and nods, seeming to come to a conclusion. <i>“I’m not doing this because I blow everyone who does me a favor, mind you. It just seems like a mutually beneficial option here.”</i>");
 	}
 	output("\n\nShe drops slowly to the forest floor, her knees resting on the bracken as light filters through the canopy, speckling across her gray-and-black fur.");
 	output("\n\nShe looks up at you from her knees, sunlight dappling her black fur robber’s mask. <i>“I’m up for it if you are,”</i> she says in a soft voice.");
 	output("\n\nYou voice your agreement, sit down on a large tree root, and slip your [pc.cocks] out.");
 	output("\n\n<i>“Oh, crackers...”</i> she breathes, her words trailing off at the sight of your member" + (pc.totalCocks() > 1 ? "s" : "") + ".");
 	output("\n\nShe leans forward, breathing out a warm sigh against your " + (pc.totalCocks() > 1 ? "topmost " : "") + "dick, then takes in a deep breath, her black nose twitching and her eyes fluttering closed.");
 	output("\n\n<i>“You s-smell goooooood...”</i> she purrs, nuzzling the tip of her nose against the head of your cock, following it with a flick of her hot tongue against your cockhead. Prai leans forward, kissing your dick from one side, her soft lips sucking around your throbbing member, her lipstick leaving pink smears on your shaft.");
 	output("\n\n<i>“Mm, tastes good too...”</i> she slurs her words and draws her head back, moving down a bit to leave another sucking, messy kiss along your cock.");
 	output("\n\nHer breathing comes faster and more heavy as she tilts her head to kiss the underside of your dick. Her lipstick smudges across her own face, leaving pink streaks across the white fur of her cheeks.");
 	output("\n\n<i>“So good...”</i> she mutters, continuing to worship your cock, her words growing less coherent as she tends to your stiff, lipstick-smeared dick.");
 	output("\n\nYou moan and run your fingers through her charcoal hair. Your touch seems to spur her on. You feel her soft paws grasping your shaft, squeezing it tenderly, her thumbs gently rubbing against the underside of your cock. She leans in, sticks her tongue out, and tilts her head up, meeting your eyes as you watch your cockhead come to rest on her pink tongue.");
 	output("\n\nShe keeps her gaze up, her chocolate-colored eyes locked on to your [pc.eyeColor] colored ones. She kisses the tip of your dick once, softly, before starting to lap at it. Her head turns slowly from side to side as she laps and sucks at the head of your dick, looking for all the world like someone savoring a lollipop.");
 	output("\n\n<i>“Oh, [pc.name], you taste amazing,”</i> she sighs, pressing her soft, pink lips against you, sliding her mouth down one side of your cock, then back up and over, her tongue flicking against your shaft as she sucks gently on it the whole way around.");
 	output("\n\nShe stops at the apex of your cock, your tip resting against the plumpness of her lower lip. <i>“Can I... can I taste more of you?”</i> she asks. She looks shyly up at you from under dark lashes, her cheeks pink under her white fur.");
 	output("\n\nYou grin and grab her firmly by the ears, then pull her hungry mouth down onto your meat. She groans as you fill her, her body trembling as you sink between her lips.");
 	output("\n\nHer ears twitch under your hands as she slurps her way down your dick, guided by your grip. Her right hand " + (pc.balls > 0 ? "cups your balls" : "caresses your pubis") + ", while her left massages the base of your shaft. Her saliva drips down the underside of your cock as she slides back up.");
 	output("\n\nYou pause, admiring the dazed expression on her face. Prai looks lost in delight, her eyes half-lidded and far away, her breath heavy. Further down, you can see that her nipples have risen out from the curves of her breasts, shiny and stiff.");
 	output("\n\n<i>“Nmm?”</i> she questions, her lips still firmly attached to your cock, her eyes unable to focus on you.");
 	output("\n\nYou answer her by pulling her down firmly onto your cock. She lets out a satisfied squeal as you tighten your grip on her ears, shoving her head up and down on your dick. You’re almost worried that you might be hurting her, but every time you squeeze, her tail puffs a bit, and she moans so sweetly.");
 	output("\n\nShe slurps and moans, her body shaking as you face-fuck her. She’s clearly enjoying it as much as you are. When the first few droplets of precum ooze from your dick down her hot, wet throat, she redoubles her efforts, pumping her mouth faster than before. You feel the softness of her lips paradoxically tight around you, and the flicker of her tongue along the underside of your cock.");
 	output("\n\nYou move your hands to her dark hair, your fingers tousling and scratching her as she moans in pleasure, doubling her pace. You pant with her, bucking your hips to her frantic pace, feeling pressure building in your dick. She feels it too as you tense against her.");
 	output("\n\nYou grab her hair and yank her down against your dick. She squeals in delight as you cum hard, " + (pc.cumQ() <= 100 ? "spurting a single jet against the back of her throat. She sucks noisily at your cock, her tongue swirling around your tip, gathering up as much as possible as you bury yourself against her." : "firing jet after jet against the back of her throat. She slurps greedily, noisily taking in every drop of your seed as you bury yourself in her mouth, spurting more and more cum down her hot throat."));
 	output("\n\nBreathless, you slow your bucking hips, your breath slowing until the only sound in the clearing is the faint rustle of leaves overhead and the wet sounds of Prai sucking your cock clean");
 	output("\n\nShe leans back, drawing her lips from your dick with a noisy POP, and then grinning up at you. She seems to be waiting for something, but you’re not exactly sure what.");
 	output("\n\nAt a loss, you simply pat her head. Prai immediately lets out a happy chirruping noise, rubbing her head against your hand. Apparently, that was just what she wanted.");
 	output("\n\nYou lean back, letting out a sated sigh as she stands up, wiping the back of her mouth with a black-furred paw. She grins wryly, <i>“Was it good for you, too?”</i>");
 	
 	processTime(30+rand(5));
 	pc.orgasm();
 	IncrementFlag("PRAI_SEX");
 	
 	flags["PRAI_CUMLIPS"] = 1;
 	IncrementFlag("PRAI_BJ");
 	praiTalkMenuFirst(variation);
 }
 
 public function praiToyUntieFirst():void
 {
 	clearOutput();
 	author("Frogapus");
 	showPrai();
 	clearMenu();
 	
 	output("You pull your hands away from her body, and instead begin untying her. Even humming a bit as you work, to make sure the bound tanuki knows that you have no interest in finishing.");
 	output("\n\n<i>“Nuh... nooooooo...”</i> she moans softly, wriggling so hard against her bindings that her breasts, free of the rope, bounce a little. <i>“Almost... almost... there...”</i> she grunts through gritted teeth, writhing beneath the rope.");
 	output("\n\nYou smile to yourself, watching the kui-tan tire herself out. Helpless, she struggles, unable to finish, finally letting out a sound somewhat akin to a sob and a frustrated bark. <i>“Oh-oh FIDDLESTICKS!”</i>");
 	output("\n\nOnce she’s calmed down, you untie the rest of the bindings, and gently guide her down to the branch next to you.");
 	output("\n\nYou undo the rest of the ropes securing the breathless tanuki. One after the other, they come away, no knot particularly difficult, just effective in their numbers. You eventually uncover a slim, feminine frame attached to the heaving chest, dressed in a cream-colored dress and black leggings. A metallic harness dangles from her shoulder to her hip, blinking a myriad of blue lights. You uncover a masked female face with a feral countenance and a dazed expression.");
 	output("\n\nShe frowns at you, as you undo more ties. <i>“Rabbids and raspberries, what was all that about?”</i> she asks as she starts to dangle more precariously. <i>“Why wouldn’t you... I mean... I was so... um...”</i> she trails off, apparently unsure as to how to end her sentence.");
 	output("\n\nYou offer her no explanation save for a meaningful glance, summoning a swell of pinkness to her cheeks. <i>“Um please be careful, please, though”</i> she says, a bit more clearly this time. ");
 	output("\n\n<i>“Sorry, but I’ve been tied up here a while, and I certainly appreciate your help " + (flags["PRAI_FIRST"] == undefined ? "friend" : "[pc.name]") + ", but if you don’t mind very much, do you think you could do me the additional favor of making sure I land next to you instead of falling to the forest floor?”</i>");
 	output("\n\nIt takes some maneuvering, but you manage to loose her legs and waist enough for her to bend her free half into touching down on the thick branch next to you. " + (flags["PRAI_FIRST"] == undefined ? "The girl is surprisingly flexible, and along the way, you get a look at the short, but very evident bulge tenting from the front of her dress." : "As Prai clambers down, you take a nice, long look at the wet stain on the front of her black leggings."));
 	output("\n\nWhen you undo the last of the bindings, she wobbles back, leaning against you. You brace for her weight, catching yourself just in time to keep from toppling off your foothold. " + (pc.isTaur() ? "It’s a little tricky, and you have to brace one of your hind-most legs against the trunk of the tree to keep from falling off the wide branch." : ""));
 	output("\n\n<i>“Oof! Flying flapjacks, that was definitely a thing! Thank you so much, " + (flags["PRAI_FIRST"] == undefined ? "friend" : "[pc.name]") + ",”</i> she says, steadying herself against you, holding one hand against her head as she blinks and focuses on you. ");
 	output("\n\nShe actually stays there for nearly a minute, looking you over, her slight frame pressed against you, letting you feel the perkiness of her small breasts and a slight wetness to the bulge just below her waist. ");
 	if (flags["PRAI_MOOD"] == 1) output("She actually pushes a little harder against you before she seems to realize what she’s doing, then leans away, blushing. She glances back at the edge of the branch and shifts back and forth uncertainly.");
 	else if (flags["PRAI_MOOD"] == 2) output("She immediately shoves back against you, wobbling at bit at the edge of the branch, just managing to maintain her balance.");
 	output("\n\nYou cough a bit and suggest that you make your way down to the ground.");
 	output("\n\n<i>“Oh my goodness grapejuice, you’re right! We could break our necks staying up here in this tree!”</i> ");
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
 	clearOutput();
 	author("Frogapus");
 	showPrai();
 	clearMenu();
 	
 	output("You decide that it’s best to just set the little kui-tan free. One at a time, you undo the bindings that lash her to the thick branch. You eventually unwrap a slim, feminine frame dressed in a cream-colored dress and black leggings. A metallic harness dangles from her shoulder to her hip, blinking a myriad of blue lights. As you unsling more ropes, you uncover a masked female face with a black nose and frustrated expression.");
 	output("\n\n<i>“Oh larks and lighthouses! Thank you so much! I don’t know what I would have--YEEK!”</i> she yelps. Her whole body dips suddenly as more of the ropes come loose. Dangling precariously, she babbles nervously, <i>“This might be trickier than just untying me. Um please be careful, please, though,”</i> she says, looking nervously at the broad branches below. ");
 	if (flags["PRAI_FIRST"] == undefined) output("<i>“Sorry, but I’ve been tied up here a while, and I certainly appreciate your help, friend, but if you don’t mind very much, do you think you could do me the additional favor of making sure I land next to you instead of falling to the forest floor?”</i>");
 	output("\n\nIt takes some maneuvering, but you manage to loose her legs and waist enough for her to bend her free half into touching down on the thick branch next to you. " + (flags["PRAI_FIRST"] == undefined ? "The girl is surprisingly flexible and perches lightly on the broad branch. " : "") + "She sways for a moment or two, her black and gray striped tail swishing behind her for balance.");
 	output("\n\n<i>“Oof! Flying flapjacks, that was definitely a thing! Thank you so much, " + (flags["PRAI_FIRST"] == undefined ? "friend" : "[pc.name]") + ",”</i> she says, steadying herself against you, holding one hand against her head as she blinks and focuses on you. ");
 	output("\n\nShe actually pauses for a moment, her eyes flicking down over your body. Her slight frame even leans forward briefly, brushing her body against yours. ");
 	if (flags["PRAI_MOOD"] == 1) output("She actually rubs a little against you, her perky nipples touching lightly upon your " + (pc.hasBreasts() ? "breasts" : "chest") + "before she seems to realize what she’s doing. She blushes, rocking back away from you, biting her lip. A small step brings her dangerously close to the edge of the branch. You grab her arm, and her blush deepens, her chocolate-colored eyes meeting yours with a smouldering warmth. The kui-tan glances back at the edge of the branch and shifts back and forth uncertainly.");
 	else if (flags["PRAI_MOOD"] == 2) output("She immediately shoves back against you, wobbling at bit at the edge of the branch, just managing to maintain her balance.");
 	output("\n\nYou cough a bit and suggest that you make your way down to the ground.");
 	output("\n\n<i>“Oh my goodness grapejuice, you’re right! We could break our necks staying up here in this tree!”</i>");
 	output("\n\nShe nervously steps from one branch to the next, following you down the natural path to the jungle floor. Once there, she smiles ");
 	if (pc.tallness < 5*12+2) output("down ");
 	else if (pc.tallness > 5*12+2) output("up ");
 	output("at you, and toys with the hem of her skirt, giving you a little bob. <i>“Thank you very much for saving me, albeit in such an unorthodox way,”</i> she glances to the side, blushing. <i>“Um, is there anything I can do for you?”</i>");
 	
 	processTime(15+rand(5));
 	pc.addNice(3);
 	
 	praiTalkMenuFirst(3);
 }
 
 public function praiSecondEncounter():void
 {
 	clearOutput();
 	author("Frogapus");
 	showPrai(1);
 	clearMenu();
 	
 	output("You push your way through the denser foliage of Mhen’ga, waxy green leaves the size of your head alternating with prickly blue vines. Underfoot, a juvenile cocksnake slithers through the underbrush, and overhead, an unknown avian lets out a cry like a violin breaking. You glance upwards, noting through the small gap in the canopy that the sky has been overcast for quite a while now.");
 	output("\n\nFinally, the brush gives way to a curious scene. Suspended inches off the ground is the grayscale kui-tan from before--Prai Ellit. She’s wearing her usual bandolier over a white blouse and a yellow skirt as she struggles weakly. Her wrists and ankles are secured tightly by multicolored vines that suspend her, spreadeagled in the air. The vines don’t seem to be moving, and a chlorophyllic woman behind her is slumped over the curve of a massive tree leaf. A pith helmet sits askew on Prai’s head, while a cream-colored scarf is draped loosely about her neck.");
 	output("\n\nThe kui-tan twists this way and that, trying to get a look at you.");
 	if (flags["PRAI_MOOD"] == 1) output("\n\n<i>“Oh crackers! Well, this is embarrassing,”</i> she says her cheeks pinkening.");
 	else if (flags["PRAI_MOOD"] == 2) output("\n\n<i>“Oh fidgets. Of course it’s you again. I’m still pretty miffed about last time, but, um,”</i> she blushes softly.");
 	output("\n\n<i>“I, uh, don’t suppose you could give me a hand again, could you? I got a little too close when I was studying the pitcher plants. I tranquilized her, but she tied me up before the drug could kick in. So, well, I’m a little tied up for the next hour or so until the tranq wears off. Do you think you could help me out before she tries to do stuff to me? She’s a little too... feminine for me to really have sex with her.”</i>");
 	output("\n\nYou could help her out, or you might take advantage of Prai’s helpless state and play with the kui-tan. Alternatively, you could just leave the helpless kui-tan to her probably-not-too-unpleasant fate at the hands of the pitcher plant.");
 	
 	processTime(3+rand(3));
 	pc.createStatusEffect("Prai Cooldown", 0, 0, 0, 0, true, "", "", false, 24*60);
 	
 	addButton(0, "PlayWith", praiPlaySecond, undefined, "Play With Her", "Take advantage of the kui-tan and have a little fun.");
 	addButton(1, "Help", praiHelpSecond, undefined, "Help Her Out", "She looks like she’s having a rough day, helping her out might be a good option.");
 	addButton(2, "Leave", praiContinueSecond, undefined, "", "");
 }
 
 public function praiContinueSecond():void
 {
 	clearOutput();
 	author("Frogapus");
 	showPrai(1);
 	clearMenu();
 	
 	output("You roll your eyes and leave the hapless kui-tan to the mercies of the plant woman.");
 	output("\n\n<i>“Sneezes and snakes! Please? Oh, please??? You can’t just leave me here!”</i> she pleads as you walk off. She twists her head to glance at the snoozing pitcher plant. <i>“I don’t even LIKE girls...”</i> she wails behind you.");
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
 	clearOutput();
 	author("Frogapus");
 	showPrai(1);
 	clearMenu();
 	
 	output("You decide to play with her a bit before letting her out of her recent predicament. You look over the kui-tan with arms and legs akimbo, and decide to start with her skirt. You flip it up and grin at the startled <i>“Yeek!”</i> from Prai.");
 	output("\n\nYou remind her about the sleeping pitcher plant and she bites her lip. Beneath her skirt, she wears a pair of polka-dotted panties, concealing a the small bulge of her cock and balls. You slide your other hand against it, rubbing it gently, you fingers tracing along its stubby length, tickling at the flared head of her miniature horsecock. Your efforts are rewarded with a small twitch from her bulge and a faint dampness at its tip.");
 	output("\n\n<i>“Anh!”</i> She moans, biting her lip. ");
 	if (flags["PRAI_MOOD"] == 2)
 	{
 		output("\n\nAfter a moment, she shakes her head, hissing at you, <i>“This again? You should be setting me free, not... not playing with my dick!”</i>");
 		output("\n\nYou both glance at the pitcher plant as it snorts in its sleep. You point at it with an expression of <i>“I told you so.”</i>");
 	}
 	else if (flags["PRAI_MOOD"] == 1) output("\n\nPrai shivers softly, her body swinging gently from the vines. <i>“That... that feels really, really good...”</i> she moans. She takes a shuddering breath and seems to regain some control over herself.");
 	output("\n\n<i>“I’m not... I’m not saying I don’t like it,”</i> she whispers. <i>“But, goodness grape juice! Being restrained and played with is a really nice kink, but do you really think that now is the time for it?”</i>");
 	output("\n\nYou grin and slide your hands to her plump cheeks, squeezing them through the polka-dot fabric of her panties. Her legs quiver against their springy restraints, and her tail curls up into a perfect question mark. Her lipsticked lips part slightly and she lets out a quavering moan.");
 	output("\n\nThe pitcher plant stirs and you scold Prai for being so loud.");
 	if (flags["PRAI_MOOD"] == 2) output("\n\n<i>“It’s your fault for touching me like that you... you... lunk!”</i> she snaps, trying to keep her volume low. <i>“Teacups and trifles! If you don’t want me waking her up, just let me down.”</i>");
 	else if (flags["PRAI_MOOD"] == 1) output("\n\n<i>“I’m sorry,”</i> she says meekly. You blink at her change in tone and posture--it looks like she’s responding well to being ordered around. <i>“I’ll try to be more quiet, [pc.name].”</i>");
 	output("\n\nYou have a better idea and pull the scarf from her neck, carefully tying a thick knot midway through it.");
 	if (flags["PRAI_MOOD"] == 2) output("\n\n<i>“How is that going to help me out exact--MMPH!”</i>");
 	else if (flags["PRAI_MOOD"] == 1) output("\n\n<i>“Oh my! Yes, pl--MMPh!”</i>");
 	output(" she goes wide-eyed as you pop the makeshift gag in her mouth, carefully tying it behind her ears. You boop her black nose, and " + (flags["PRAI_MOOD"] == 2 ? "Prai snorts, giving you a withering look, but clearly establishing that she has no trouble breathing. " : "You can see a shiver run down her whole body, fluffing up her fur along the way as she takes in a deep breath through her nose and exhales a happy, albeit muffled, sigh. Clearly, she’s having no trouble breathing. ") + "Her plump lips press in a tight pout around the knotted scarf, already smudging it with her pink lipstick. Despite her expression, she squirms softly as the front of her yellow skirt begins to tent up.");
 	output("\n\nAt this point, you decide you take your time, slowly running your hands up her sides, enjoying the muffled moan of pleasure from Prai. Your fingers run over the tight cords of pitcher plant holding her in place, and cup your hands against her bound, boyish chest. Prai groans, her nipples stiffening under your hands, pushing against the tight fabric of her blouse. One button at a time, you unfasten her top, then slowly slide your hands against the almost-nonexistent mounds of her breasts. She’s warm to the touch and getting warmer. She grows warmer still when you slip your fingers beneath the simple lace of her bra. Prai gasps as you roll her charcoal nipples between your fingertips, her back arching.");
 	output("\n\nYou spend some time there, rolling her fat nipples back and forth, Prai’s small squeaks of pleasure accompanying your teasing. When you finally let them go, she lets out a muffled whine from her gag. You glance down, noting that there’s already a large wet spot spreading out from the tented bulge in her skirt.");
 	output("\n\nShe trembles as your fingers roam over her chest, sliding down her sides and to her hips. From her angle, she can’t see what you’re doing behind her, and this seems to heighten her sensitivity. When you trace a fingertip atop the bulge in her skirt, she bucks against the vines, swinging sharply in her restraints.");
 	output("\n\n<i>“Mmmph!”</i> she moans in frustration. You touch a finger to her makeshift gag and find that it’s already soaked with drool. " + (flags["PRAI_MOOD"] == 2 ? "Prai thrashes against her restraints, and shoots an angry glare over her shoulder at you." : " Prai lets out an almost musical trill as she nestles against you, nuzzling her gag against your fingertip."));
 	output("\n\nYou decide to tease the kui-tan just a bit more. You grasp her cock through her skirt, and give it a long, slow squeeze. Prai lets out a muffled squeal, and you feel even more pre ooze out through the yellow fabric. You lean forward, brushing your lips against her neck, watching in amusement as her fur ruffles up. You press against her back, letting the kui-tan trap feel your " + (pc.hasBreasts() ? "breasts" : "chest") + " against her body. When you press your teeth lightly against her neck, gently biting her, you feel a shudder run through her whole body, her cock twitching in your hand.");
 	output("\n\nYou press your body against her bound form, feeling her back arch involuntarily, her bushy tail wrapping instinctively around your [pc.hips]. With her arms and legs are stretched out in an x-shape, the tips of her boots just barely touch the ground, unable to find the purchase to push back against you.");
 	output("\n\nAn old-fashioned pith helmet sits askew on her head, with one round, gray ear visible from her short, black hair. You peek around to see her face, set in an expression of acute frustration. " + (flags["PRAI_MOOD"] == 2 ? "Her shiny black nose is wrinkled up, and the black fur forming a <i>“mask”</i> around her brown eyes is set in an exasperated frown. The harsh expression is mitigated somewhat by the roundness of her white-furred cheeks, and the smudged pink lipstick on her black, glossy lips. A knotted, cream-colored scarf is serving as a makeshift gag in her mouth, and it’s clear that without it, she’d be lobbing some harsh words at you. " : "Small pants of air exhale through her shiny black nose. Her chocolate-colored eyes, set in her black fur “mask” are half-lidded, look back at you with a dreamy expression of bliss and lust. Her white-furred cheeks are smudged with pink lipstick only half on her black, glossy lips. A knotted, cream-colored scarf is serving as a makeshift gag in her mouth, and she drools happily around it."));
 	output("\n\nHer white blouse is partially undone, pulled apart by the stresses of the pose she’s in, and several missing buttons expose the pink bra across her flat chest. Her gray-furred arms are diagonal to her chest, held rigid and wrapped tightly in vines, with her black hands clenching and unclenching in frustration. Her silver bandolier hangs from shoulder to hip, small blue lights blink across the entire piece.");
 	output("\n\nPrai’s yellow skirt reaches her knees, and perks up in the front, clinging heavily to the flared head of her stubby, equine cock. Precum drips from it down her legs, to the tops of her calf-high black boots. Vines wrap tight around her ankles, pulling her legs apart and barely letting the tips of her feet alight on the ground. " + (flags["PRAI_MOOD"] == 2 ? "Every so often, she gives a sharp wiggle and groan, trying fruitlessly to free herself from her bindings." : "Every so often, she gives a sharp wiggle and groans, not trying to escape, it seems, but more out of enjoyment of her predicament."));
 	output("\n\nShe looks to be about a minute away from cumming. This seems like a good time to plan your next move. Do you want to finish jacking off the little kui-tan, or deny her the pleasure of cumming? ");
 	if (pc.hasCock() && !pc.isTaur()) output("Alternatively, she’s at an awfully convenient angle for a good fucking. ");
 	
 	processTime(10+rand(3));
 	pc.addMischievous(3);
 	pc.lust(20);
 	
 	addButton(0, "JackHer", praiPlayJackSecond, undefined, "Jack Her Off", "Given the day she’s having it’d only be nice to give her some relief.");
 	if (!pc.isTaur() && pc.hasCock()) addButton(1, "Suspension", praiPlaySusSecond, undefined, "Suspension Fuck", "Some acrobatic mid-air sex is just the thing you both need.");
 	else addDisabledButton(1, "Suspension", "Suspension Fuck", "You need a cock and to not be a taur for this.")
 	if (pc.hasCock()) addButton(2, "MakeHerBeg", praiPlayBegSecond, undefined, "Make Her Beg", "Given her compromised position she’ll probably do anything to get some relief.");
 	else addDisabledButton(2, "MakeHerBeg", "Maker Her Beg", "You need a cock for this.")
 	addButton(3, "Leave", praiPlayLeaveSecond, undefined, "", "");
 }
 
 public function praiPlayLeaveSecond():void
 {
 	clearOutput();
 	author("Frogapus");
 	showPrai(1);
 	clearMenu();
 	
 	output("You give Prai a shove forward, sending her swinging in her vine restraints and inform her that you’ll be leaving her here. She yelps loudly against her gag, " + (flags["PRAI_MOOD"] == 2 ? "thrashing in her vines" : "her round ears drooping") + ". You smirk and walk away from the bound and gagged kui-tan, leaving her and the snoring pitcher plant behind you.");
 	
 	processTime(3+rand(3));
 	pc.addHard(flags["PRAI_MOOD"] == 1 ? 6 : 3);
 	flags["PRAI_MOOD"] = 2;
 	flags["PRAI_EMAIL_NUMBER"] = 6;
 	flags["PRAI_EMAIL_STAMP"] = GetGameTimestamp();
 	
 	addButton(0, "Next", mainGameMenu, undefined, "", "");
 }
 
 public function praiPlayJackSecond():void
 {
 	clearOutput();
 	author("Frogapus");
 	showPrai(2);
 	clearMenu();
 	
 	output("You decide that a bound and gagged kui-tan is just the sort of thing to make your day.");
 	output("\n\nYou pull her tightly against you, one arm wrapped around her taut waist, the other grasping her three-inch cock. Prai must have had a mod or two, because instead of a kui-tan dick, hers is clearly equine. Only about an inch thick and barely three inches long, it’s the same glossy black as her nose and lips. It’s little, flared head is already flaring in your grasp, but it’s barely long enough to get more than a few fingers around it.");
 	output("\n\nHer slim body writhes against you, her round butt rubbing against your hips. " + (flags["PRAI_MOOD"] == 2 ? "Prai tenses, but her head tilts almost unconsciously to one side. " : "Prai tilts her head to one side, presenting more of her neck to you. ") + "You oblige and bite her neck harder, drawing a quivering moan from the gagged trap. Her cock pulses in your hand, oozing another load of hot, clear pre over your fingers.");
 	output("\n\nYou drum your fingers against her length. " + (flags["PRAI_MOOD"] == 2 ? "She pants, kicking her legs uselessly in her restraints. " : "She squeals, another happy shiver running through her body."));
 	output("\n\n<i>“Mmmph!”</i> she groans, trying to hump back against you. Suspended, she can go little more than wiggle in your embrace. You grin and press your lips to her neck, sucking softly, drawing out another full-body quiver from the kui-tan.");
 	output("\n\nYou decide to take your time, slowly pumping her dick. Prai trembles against you as you pull her tight against your body");
 	if (pc.hasBreasts()) output(", your [pc.breasts] pressing against her back");
 	else if (pc.hasCock()) output(", the bulge of your [pc.cocks] planted firmly against her plump ass");
 	output(". You slide your arm up, splaying your fingers across her chest and returning to her nipples. With a slow turn of your wrist, you strum your fingertips one at a time over her puffy, black buds.");
 	output("\n\nPrai gasps in your arms, her breathing growing ragged. It looks like the kui-tan has neared orgasm in very short order--it must have something to do with such a long period of teasing, which gives you a wonderful idea. You hold her tight against you, suspended and helpless in your arms. You nip the back of her neck and slow your pumping fist.");
 	output("\n\nShe wriggles in protest, humping her dick against your hand. As she does so, you open your hand, leaving her pumping her hips fruitlessly. She gives a frustrated grunt through her gag, but after a final thrash, stills her hips. You close your fist again around her pre-soaked cock, and pump her short cock slowly. She lets out a frustrated noise, but rocks her hips against you to the rhythm you set.");
 	output("\n\nGradually, you speed up, and her grunts turn to sweet, muffled moans. Just when she starts to frantically pant her pleasure, you stop, returning to a slow, steady pump. She squeals her protest, but slows herself again, following your rhythm. To reward her, you run your fingertips across her nipples, teasing them lightly.");
 	output("\n\n<i>“Nnnnnnnnnnnnn!”</i> she groans, straining her chest against you.");
 	output("\n\nYou and Prai go through this a dozen times, bringing her nearly to orgasm, then back down again. The kui-tan is trembling from her toes to her nose at this point, and you decide to finally let her cum. You pump her dick faster and faster, hearing her happy squeals even through the gag. Your fist is a blur against her hips, and she’s twisting and writhing against you, practically thrashing in her desperation to cum.");
 	output("\n\nWhen you pinch your fingers around her nipple, she lets out a strangled cry through her gag. She arches her back in your embrace, her meat throbbing in your hand. Her cock spasms in your hand, firing out a hot, thick load through the air, splashing against the roots criss-crossing the forest floor. You keep pumping her, milking her tiny dick, until she squeals and fires out a second load, a glob of her thick semen arching a white streak through the air.");
 	output("\n\nPrai sags in your arms, and you’re suddenly aware that the vines that were holding her up are no longer doing so. You glance up, seeing the pitcher plant’s tendrils slowly snaking back to life. You glance down at her. Regardless of how you might feel about tentacle plants, the little kui-tan seems extremely out of it after her mid-air handjob. It’d probably be best to get her clear of the plant.");
 	output("\n\nYou hustle backward as the pitcher plant lazily comes back to life, its female torso stretching decadently, breasts bobbing as it blinks sleepily. By the time it seems aware of its surroundings, you’re a solid distance away, sitting on a fallen log. Prai curls up on the ground next to you, her head resting in your lap. You remove the gag from her mouth, wringing it out the best you can.");
 	output("\n\nIt takes the kui-tan a few minutes to refocus on her surroundings. You pet her hair gently, fondling her ears a bit as she blinks slowly, shifting her weight. " + (flags["PRAI_MOOD"] == 2 ? "<i>“[pc.name], you... you jerk,”</i> " : "<i>“Oh, crackers! The plant was waking up, wasn’t it?”</i> ") + "she finally manages to mumble. ");
 	output("\n\nYou inform her of what happened, and she makes a face. ");
 	if (flags["PRAI_MOOD"] == 2) output("\n\n<i>“I knew it was a bad idea to get me off there,”</i> she says. There’s not really much heat to the words, though, and she finishes her statement by snuggling deeper against your lap. <i>“Totally all your fault,”</i> she mumbles.");
 	else 
 	{
 		output("\n\n<i>“I’m sorry. I guess I was really too out of it to keep track of the plant. Thank you for rescuing me--even if you were the reason it almost got me a second time.”</i>");
 		output("\n\nYou ruffle at that and open your mouth to give her a sharp response, only to find her looking up at you with her pink tongue sticking out.");
 	}
 	output("\n\n<i>“Kidding, [pc.name]--just kidding,”</i> she smiles. Prai takes in a very deep breath, and stretches a bit. She slowly clambers back to her feet, staggering a bit before brushing her dress off. <i>“I really do appreciate the save. We should do this again sometime.”</i>");
 	output("\n\nYou agree, but suggest that maybe she not get herself captured again.");
 	output("\n\n<i>“No promises!”</i> she laughs, then gives you a hug and heads off through the jungle.");
 	
 	processTime(40+rand(15));
 	pc.addNice(3);
 	flags["PRAI_MOOD"] = 1;
 	flags["PRAI_EMAIL_NUMBER"] = 3;
 	flags["PRAI_EMAIL_STAMP"] = GetGameTimestamp();
 	
 	addButton(0, "Next", mainGameMenu, undefined, "", "");
 }
 
 public function praiPlaySusSecond():void
 {
 	clearOutput();
 	author("Frogapus");
 	showPrai(2);
 	clearMenu();
 	
 	output("You lean forward and run your finger along the length of her tail. Her breath hisses out through the gag and her ringed tail fluffs out at your touch, curling up into a perfect question mark and lifting her skirt with it.");
 	output("\n\nAs the curtain of her skirt rises, her rump emerges, veiled in her panties, a bulge tucked between her thighs, already dripping with precum. You reach forward, lightly running your fingertips across her bottom, coaxing a soft gasp from between her lips. You feel her rump tremble beneath your fingers as she moans helplessly.");
 	output("\n\n");
 	if (flags["PRAI_MOOD"] == 2) output("<i>“[pc.name], this--this doesn’t f-feel like untying me,”</i> she protests weakly. ");
 	else output("<i>“Oh, yes, [pc.name], more, mmmmmorrrre...”</i> she moans. ");
 	output("You stroke her tail, running your hand up its length and listening to the minute gasps and mewls Prai makes. She sways her hips, begging for more than light touches.");
 	output("\n\nYou oblige, and grasp the base of her tail firmly, tugging down her panties with your other hand. Her three inch cock springs free, trailing a line of pre down to her panties, her small sack tucked tight against the base of it, already smeared with her fluids. She squeals happily, and you grind your [pc.cock] against her exposed booty, sliding it between the cheeks of her generous ass.");
 	output("\n\nPrai lets out a ragged moan, her skirt rising up as she wriggles helplessly in the air. <i>“" + (flags["PRAI_MOOD"] == 2 ? "Oh crackers! I don’t even care anymore. " : "") + "Please! Please put it in me! I need it!”</i> she groans.");
 	output("\n\nYou spend a few minutes just grinding against her, feeling the slippery slide of her cheeks against your cock, listening to her moan. You hold her tail, tugging gently, setting the a rhythm that she enthusiastically follows. Suspended as she is, she can do little to affect her own movements, and for now, she’s entirely in your control. ");
 	output("\n\nYou slowly stop sliding and are rewarded by a plaintive moan from Prai. You pull the gag from her mouth, letting her speak. <i>“Hahhhhh... Wh-why’d you stop, [pc.name]?”</i>");
 	output("\n\n<i>“Beg for it,”</i> you whisper. The kui-tan responds with a shiver that runs from her rounded ears all the way down to her bushy tail.");
 	output("\n\n<i>“Please!”</i> she croaks, her voice husky with desire. <i>“Please fuck me. Sneezes and snakes, I need it so bad. I need...”</i> she trails off as you slide your dick between her cheeks.");
 	output("\n\nWhen her words stop, you stop. She whines in protest, <i>“Please! I need your cock in my ass. I neeeeeeed to cum...”</i>");
 	output("\n\nYou squeeze her tail tighter, drawing a yelp and a shiver from her. <i>“I want your cock so bad,”</i> she moans. <i>“I need it. I’ll do anything for it. Pleaaaassssse!”</i>");
 	output("\n\nYou suppose you could give her what she wants. On the other hand, she’s got quite a mouth on her when she’s not babbling non sequiturs; it might be more beneficial to leave her in this state.");
 	
 	pc.lust(20);
 	processTime(10+rand(3));
 	
 	addButton(0, "Fuck", praiPlaySusFuckSecond, undefined, "", "");
 	addButton(1, "Leave", praiPlaySusLeaveSecond, undefined, "", "");
 }
 
 public function praiPlaySusLeaveSecond():void
 {
 	clearOutput();
 	author("Frogapus");
 	showPrai(2);
 	clearMenu();
 	
 	output("You decide to teach the uppity little kui-tan a lesson.");
 	output("\n\n<i>“No,”</i> you say simply. ");
 	output("\n\nPrai actually continues her begging and moaning for a minute before your word registers with her.");
 	output("\n\n<i>“I need your cock in my hot little... wait--what???”</i> She blinks her eyes and looks over her shoulder, her sexed-out haze appearing to clear a little.");
 	output("\n\n<i>“No,”</i> you say again, and inform her that you’ll be heading out.");
 	output("\n\n<i>“What the--sneezes and flashlights and luftballoons!”</i> she stammers.");
 	output("\n\nYou bid her farewell as she thrashes against the vines. <i>“Hey! HEY! You can’t just leave me here!”</i>");
 	output("\n\nWhistling, you leave Prai behind in the forest clearing.");
 	
 	processTime(3+rand(3));
 	pc.addHard(flags["PRAI_MOOD"] == 1 ? 6 : 3);
 	flags["PRAI_MOOD"] = 2;
 	flags["PRAI_EMAIL_NUMBER"] = 6;
 	flags["PRAI_EMAIL_STAMP"] = GetGameTimestamp();
 	
 	addButton(0, "Next", mainGameMenu, undefined, "", "");
 }
 
 public function praiPlaySusFuckSecond():void
 {
 	clearOutput();
 	author("Frogapus");
 	showPrai(2);
 	clearMenu();
 	
 	output("You are more than happy to oblige her request. You " + (!pc.isNude() ? "undo your [pc.clothes] and " : "") + "set aside your gear as she whimpers softly in anticipation.");
 	output("\n\n<i>“Please, [pc.name], I need it so bad. I’m dripping through my skirt!”</i> she moans piteously.");
 	output("\n\nYou spare a glance down and note that it looks like she’s soaked the entire front of her skirt with pre-cum, and the sodden material is so sopping wet, it actually is dripping her fluids down to the forest floor.");
 	output("\n\nYou step out of the rest of your garments and lean in close to her. Your hands grip her ass, your fingers sinking into her plush rump. She churrs happily, and her tail arches up even further over her back. With a squeeze, you spread her cheeks apart and expose the shiny black pucker of her asshole.");
 	output("\n\n<i>“This is for being a good girl,”</i> you " + (pc.isMasculine() ? "chuckle" : "giggle") + ".");
 	output("\n\nPrai gasps sharply at your words, her back arching and her tailhole giving a twitch. Even a little perk of her hips makes her bounce in her restraints. <i>“Oh please! Please, [pc.Name], I can’t take another minute of teasing. Stick it in me already. I need to be fuuuuuuucked!”</i> she whines.");
 	output("\n\nYou could give it to her, but who is she to tell you what to do?");
 	output("\n\nYou spread her cheeks wide, and she lets out a quaking sigh, anticipating your dick against her twitching asshole. ");
 	output("\n\nInstead, you slide your [pc.cocks] under her small package. The top of your shaft rubs firmly against the underside of her balls, then against the underside of her dick. She’s soaked herself and find yourself slathering your own dick with her pre as you massage hers.");
 	output("\n\n<i>“Nuh-nuuuu...”</i> she moans. <i>“Nah-not... not whata--what I... wanned...”</i> she babbles, barely coherent. You swear that you can feel her balls churning, resting hot and tight just atop the base of your shaft.");
 	output("\n\nYou stay there for a while, rocking back and forth, letting her bask in your rhythm. She’s moaning, shifting her hips back against you. She obviously wants you inside her, but she’s enjoying the frottage too much to mouth any sort of protest at this point.");
 	output("\n\nWhen you eventually slide out from under her, thin ropes of pre trailing from your dick to hers, she mewls softly. You give her a sharp shove forward, and she lurches toward the hanging tangle of vines in front of the sleeping pitcher. She grabs on to them and, unbalanced, swings softly back and forth, her weight resting partly on her toes.");
 	output("\n\n<i>“Pleeeeeze...”</i> she moans, swaying drunkenly against the vines.");
 	output("\n\nYou grin and grab her tail by the base, pulling her back and pressing the [pc.cockHead] of your cock against her twitching, black bud.");
 	output("\n\nShe lets out a low, shuddering moan, trying in vain to push back against you, put finding no purchase in the swaying vines. Settling your other hand on her hip, you slowly pull her in against you, sinking your ");
 	if (pc.cocks[0].cLength < 6) output("small");
 	else if (pc.cocks[0].cLength < 14) output("fat");
 	else output("massive");
 	output(" dick into her ass, watching it disappear inch by inch. She groans, a long and quavering sound as the ring of her asshole stretches to accommodate your girth.");
	
	pc.cockChange();
	
 	output("\n\nHalf-babbled gratitude spills from her lips as you fill her, and her cock gives a twitch, and you hear the patter of liquid against fabric. She pants, whimpering softly--it looks like she came from your insertion. Too bad you’re not finished yet.");
 	output("\n\nYou push further and further in, already slick with her pre. Prai gasps, rocking against the vines and mewling piteously as her little cock oozes out cum. You pull her tail tight up against you, feeling the gentle bucks of her hips against yours.");
 	output("\n\n<i>“Good girl,”</i> you chuckle, and you see a wiggle of pleasure from her rump, shifting your cock around against her tight hole.");
 	output("\n\nIf she’s this enthusiastic, you might as well respond in kind. You grip her tail and hip hard and push against them, rocking her forward against the vines. She squeaks, nearly losing her balance as she swings back, driving hard down your shaft.");
 	output("\n\n<i>“Unf!”</i> she grunts, her plump ass bouncing against your hips as you bury yourself to the hilt inside her.");
 	output("\n\nYou smile, enjoying the easy rhythm of shoving her forward and feeling her rock back against your dick. She churrs as you swing her out and moans in pleasure as you drive into her. You repeat the process over and over, letting momentum impale her over and over on your dick, enjoying her slippery tightness wrapping around you each time. Eventually, your own breathing grows ragged, as you feel your pleasure build.");
 	output("\n\nShe’s squeezing down tight around you, squeaking a symphony of pleasure. <i>“Cum! Please cum! Fill me up with your hot goo!”</i> she pants, barely able to form the words. <i>“Witch hazel and whiskers! Oh please!”</i>");
 	output("\n\nHer tightness, her begging--it’s all too much to bear. You groan hauling back on her tail as you cum. You slamming your hips against her plump ass, a ");
 	if (pc.cumQ() < 10) output("squirt");
 	else if (pc.cumQ() < 100) output("jet");
 	else if (pc.cumQ() < 1000) output("massive jet");
 	else output("flood of cum");
 	output(" firing out from your cock into her desperate ass.");
 	output("\n\nShe’s like an animal--humping back desperately against you, trying to get herself off. You groan, sinking your fingers in deep against the curve of her ass. <i>“Oh fidgets and freon! Oh! Oh crackers!”</i> she gasps, cumming back in kind. Her short cock spurts against the ground spattering thick cum with enough force that you feel it splash against your legs. She tenses, her muscles taut against her bindings, before finally going limp, hanging loosely against the vines.");
 	output("\n\nYou grind against her, feeling her asshole slowly unclenching around your ");
 	if (pc.cocks[0].cLength < 4) output("tiny");
 	else if (pc.cocks[0].cLength < 7) output("slim");
 	else if (pc.cocks[0].cLength < 10) output("thick");
 	else if (pc.cocks[0].cLength < 13) output("large");
 	else output("massive");
 	output(" cock. She’s panting heavily, almost in synch with you. " + (!pc.isGoo() ? "You feel an ache in your [pc.legs] as the odd position of fucking the trussed-up kui-tan begins to catch up with you." : ""));
 	output("\n\n<i>“Ummma...”</i> she groans, slumped against the vines holding her up, her knees trembling.");
 	output("\n\nIt looks like the little kui-tan is spent. Do you want to release Prai and make sure she’s alright, or leave her here for to fend for herself?");
 	
 	processTime(20+rand(8));
 	pc.orgasm();
 	IncrementFlag("PRAI_SEX");
 	pc.addMischievous(3);
 	
 	addButton(0, "Release", praiPlaySusFuckReleaseSecond, undefined, "", "");
 	addButton(1, "Leave", praiPlaySusFuckLeaveSecond, undefined, "", "");
 }
 
 public function praiPlaySusFuckLeaveSecond():void
 {
 	clearOutput();
 	author("Frogapus");
 	showPrai(2);
 	clearMenu();
 	
 	output("You decide that now is a good time to pack up and head out.");
 	output("\n\nIt’s a credit to your sexual prowess that Prai seems to not even register you as you " + (pc.isNude() ? "brush the leaves from your body" : "slip your [pc.clothes] on") + ". Her legs are trembling as she hangs, suspended in vines, a ");
 	if (pc.cumQ() < 10) output("dribble");
 	else if (pc.cumQ() < 100) output("trickle");
 	else if (pc.cumQ() < 1000) output("stream");
 	else output("flood");
 	output(" of cum running from her ");
 	if (pc.cocks[0].cLength < 6) output("twitching");
 	else if (pc.cocks[0].cLength < 14) output("stretched");
 	else output("gaping");
 	output(" asshole and down her thigh.");
 	output("\n\nIt looks like the kui-tan trap is only vaguely aware of you as her eyes drift in and out of focus. You note a small movement in her bandolier, as a tiny gummy creature emerges. Seemingly stirred by the presence of cum, the little " + (flags["PRAI_WHO"] == undefined ? "creature" : "Gemu") + " slowly makes its way up Prai’s dress, across her chest, and to her wrists. It looks like it’s slowly chewing its way through the vines.");
 	output("\n\nThe tiny creature might release her before the pitcher plant awakes, but either way, it’s not your problem. You shrug and continue along your way.");
 	
 	processTime(3+rand(3));
 	pc.addHard(6);
 	flags["PRAI_MOOD"] = 2;
 	flags["PRAI_EMAIL_NUMBER"] = 6;
 	flags["PRAI_EMAIL_STAMP"] = GetGameTimestamp();
 	
 	addButton(0, "Next", mainGameMenu, undefined, "", "");
 }
 
 public function praiPlaySusFuckReleaseSecond():void
 {
 	clearOutput();
 	author("Frogapus");
 	showPrai(2);
 	clearMenu();
 	
 	output("You decide that the little kui-tan has had more than enough and reach up to untangle her hands from the vines. Prai’s barely coherent, murmuring nonsense sounds to herself as she trembles, suspended in vines, a ");
 	if (pc.cumQ() < 10) output("dribble");
 	else if (pc.cumQ() < 100) output("trickle");
 	else if (pc.cumQ() < 1000) output("stream");
 	else output("flood");
 	output(" of cum running from her ");
 	if (pc.cocks[0].cLength < 6) output("twitching");
 	else if (pc.cocks[0].cLength < 14) output("stretched");
 	else output("gaping");
 	output(" asshole and down her thigh.");
 	output("\n\nWhen you finally undo the last of the vines, she slumps against you" + (pc.physique()/pc.physiqueMax() <= 0.33 ? ", nearly bowling you over" : "") + ". The kui-tan is in no condition to walk, but you’re fairly sure that waiting to recover next to the pitcher plant won’t do her much good. You lay her down gently on the forest floor and quickly " + (pc.isNude() ? "double check your gear" : "don your [pc.clothes]") + ". You " + (pc.physique()/pc.physiqueMax() < 0.5 ? "grab her by her arms and slide her across the forest floor " : "pick up the kui-tan trap in your arms, and carry her ") + "well away from the pitcher plant.");
 	output("\n\nPrai still looks incredibly dazed, blinking at you with unfocused eyes. <i>“[pc.name]?”</i> she manages to murmur before trembling softly. You " + (pc.physique()/pc.physiqueMax() < 0.5 ? "sit down next to her, and slide your arms under her shoulders, pulling her up into your lap" : "slowly sink to the ground, keeping her cradled in your lap") + ". She sighs softly, churring again, her round ears twitching as she curls up against you.");
 	output("\n\nYou hold the kui-tan girl against you, feeling her tremble. A stirring against your chest makes you glance down in surprise, noting a tiny creature emerging from Prai’s bandolier. " + (flags["PRAI_WHO"] == undefined ? "Her pet" : "The Gemu") + " slides out, humanoid save for a slug-like undercarriage. The mouse-sized creature slowly moves along Prai’s body, leaving her clean and cum-free.");
 	output("\n\nPrai sighs against you, and you lean down ");
 	if (pc.isNice()) output("nuzzling the top of her head");
 	else if (pc.isMischievous()) output(" giving her ear a soft nibble");
 	else output("bumping your chin softly against the top of her head");
 	output(". A smile spreads across her muzzle and her eyes blink open. She looks up at you, her eyes finally focusing on your [pc.face].");
 	output("\n\n<i>“Thank you for rescuing me,”</i> she whispers.");
 	output("\n\nYou smile back at her and hold her until the trembling in her body fades away. She nuzzles against your neck and gives you a soft, warm kiss. Prai slowly untangles herself from you, standing up with your help. She checks her gear, then smoothes down her dress before blushing shyly and ");
 	if (pc.tallness < 5*12+2) output("bending down");
 	else if (pc.tallness > 5*12+2) output("tiptoeing up");
 	else output("leaning forward");
 	output(" to kiss you once more.");
 	output("\n\n<i>“I should be on my way,”</i> she says with another smile. <i>“Thank you so much for staying with me while I was worn out.”</i>");
 	output("\n\nYou inform her that cuddling with an adorable kui-tan was no trouble at all.");
 	output("\n\n<i>“Well,”</i> she says with a grin, <i>“if this is the sort of treatment that I can look forward to, maybe getting tied up isn’t so bad after all!”</i>");
 	output("\n\nYou’re not entirely sure that that’s the right lesson for her to learn, but she seems happy enough as she skips off through the woods.");
 	
 	processTime(15+rand(6));
 	flags["PRAI_MOOD"] = 1;
 	flags["PRAI_EMAIL_NUMBER"] = 3;
 	flags["PRAI_EMAIL_STAMP"] = GetGameTimestamp();
 	
 	addButton(0, "Next", mainGameMenu, undefined, "", "");
 }
 
 public function praiPlayBegSecond():void
 {
 	clearOutput();
 	author("Frogapus");
 	showPrai(2);
 	clearMenu();
 	
 	output("You brush your lips against Prai’s black, fuzzy ear and whisper that if she wants to finish, she’ll have to satisfy <i>you</i> first.");
 	if (flags["PRAI_MOOD"] == 2)
 	{
 		output("\n\nShe stiffens against you, and you tug the gag from her mouth. <i>“Sneezes and snakes!”</i> she gasps. <i>“I... I...”</i> she huffs, building up a head of steam. ");
 		output("\n\n<i>“Of all the things to ask! Why in the world would I beg for it?”</i>");
 		output("\n\nYou raise your eyebrows at the straining cock tent in her skirt and she glances down. <i>“Well, maybe I can just take care of that later.”</i> She huffs.");
 		output("\n\nYou bend down to undo the vines at her ankles, leaving her legs swaying before undoing the vines at her wrists, letting the kui-tan drop down to the forest floor. She catches herself with a small stumble, straightening up and giving you a hard stare.");
 		if (pc.isAss())
 		{
 			output("\n\nYou decide that you’ve had quite enough of the kui-tan’s games. In your most commanding tones, you order her to get down on her knees and beg for your dick. ");
 			output("\n\nIt’s like flipping a switch. Prai bites her lip and flushes, her eyes looking at you with a hunger you haven’t seen there before. She lowers her head, sinking down to her knees. <i>“Y-yes, sir,”</i> she murmurs.");
 			output("\n\nIt looks like for all her bluster, Prai’s submissive streak is several miles wide. Direct orders push a very obedient button for her.");
 		}
 		else if (pc.isMischievous())
 		{
 			output("\n\nYou note that it’s a long walk back to Esbeth, and that with her track record, she’d probably get caught by something even worse--especially if she stops to masturbate.");
 			output("\n\nShe wrinkles her black, shiny nose at you. <i>“Will not!”</i>");
 			output("\n\nYou shrug, and as she takes her first step away from you, you point out that walking through the jungle with a hard-on is going to be incredibly uncomfortable, and probably a little painful versus the relative ease of taking a few orders from you.");
 			output("\n\nShe hesitates and lowers her foot back down, her brow furrowing as she evaluates her situation.");
 			output("\n\nYou smile and point at the ground. Her eyes flick to you and she sticks her tongue out, but nevertheless sinks down to her hands and knees.");
 		}
 		else
 		{
 			output("\n\nYou point out that turned-on as she is, Prai will undoubtedly run into trouble between here and Esbeth. Also, given her track record, it’s pretty likely that something will assault her, especially if she stops to masturbate.");
 			output("\n\nPrai grimaces. <i>“Oh crackers, you’re probably right,”</i> she admits. <i>“And this begging stuff is just pretend, right? I’m not your sex servant or anything,”</i> she adds, sternly.");
 			output("\n\nA breeze gusts through leaves, tugging at the hem of her skirt. Her fur bristles up and she bites her lip, shivering as her bulge twitches. <i>“Nnnnn, okay, okay...”</i> she groans. <i>“So how do you want it? On my knees?”</i> She asks, sinking down to the forest ground.");
 			output("\n\nYou nod, smiling.");
 		}
 	}
 	else
 	{
 		output("\n\nShe stiffens against you, and you tug the gag from her mouth. <i>“I... I want that, too”</i> she breathes. <i>“How would you want me?”</i>");
 		output("\n\nYou bend down to undo the vines at her ankles, leaving her legs swaying before undoing the vines at her wrists, letting the kui-tan drop down to the forest floor. ");
 		if (pc.isAss()) output("\n\nYou see her wobble, but let her stumble. She collapses to the forest floor, her hands splayed across the dirt. She looks up at you in shock, and you lock eyes with her, until she drops her head. She looks abashed, but you catch a glimpse of the small lip bite, and the smile flickering across her face.");
 		else if (pc.isMischievous())
 		{
 			output("\n\nPrai’s feet touch down, and she wobbles immediately. You reach out to grab her arm. She grasps at you, half-regaining her balance. As she teeters, you lock eyes with her, and grin wickedly. You let go of her hand, and she cries out, falling back on her plump butt.");
 			output("\n\n<i>“Ow! What was that for?”</i> she groans, pushing herself halfway up.");
 			output("\n\n<i>“You look good on your knees,”</i> you snark, throwing her a wink.");
 			output("\n\n<i>“I... oh!”</i> she says, understanding dawning on her face. <i>“There </i>are<i> easier ways of getting me on my knees,”</i> she notes.");
 			output("\n\n<i>“This was more fun,”</i> you reply. Prai says nothing, but rolls her eyes and smiles.");
 		}
 		else
 		{
 			output("\n\n You place a hand on her back, steadying her as she finds her balance. When she stops swaying, she looks into your eyes, a small blush spreading across her cheeks. You slide your hands up to her face, running them back and tousling her short, messy hair. A little bit of a push is all the guidance she needs as she slowly sinks down to her knees.");
 			output("\n\nShe looks up at you, her eyes wide and questioning. <i>“Like this?”</i> she asks softly.");
 			output("\n\nYou nod, smiling.");
 		}
 	}
 	output("\n\nOn her knees, she looks up at you, frustration and desperation written all over her face. With a broad smile you nod to her, encouraging her to speak.");
 	output("\n\n<i>“P-please, [pc.name] can you help me get off?”</i> she murmurs up to you. In response you " + (pc.isNude() ? "place your hands on your hips and grin" : "undo your [pc.clothes]") + ", revealing your [pc.cock], already rigid. Her eyes snap to your equipment and widen. Her plump lips part and she licks them, staring at your tool" + (pc.totalCocks() > 1 ? "s" : "") + ".");
 	output("\n\nYou twirl your finger in the air and she looks back up, biting her pink-lipsticked lip. With a small huffing noise, she drops to all fours, turning around and lifting her plump ass in the air. From behind, her yellow skirt clings to her curves, barely revealing the pink polka dots of her panties. Kneesocks hug her legs, just below the white and gray expanse of her furred thighs. Her tail emerges from a slot just below the waistband of her skirt, swaying softly.");
 	output("\n\n<i>“Like... like this?”</i> she asks breathlessly.");
 	output("\n\nYou lean forward and run your finger along the length of her tail. Her breath hisses out and her ringed tail fluffs out at your touch, curling up into a perfect question mark and lifting her skirt with it. As the curtain rises, her rump emerges, veiled yet in her panties, a bulge tucked between her thighs, already dripping with pre.");
 	output("\n\n<i>“Just like that,”</i> you assure her, and she shivers at your words.");
 	output("\n\nYou reach forward, lightly running your fingertips across her bottom.");
 	output("\n\n<i>“Oh crackers!”</i> she gasps softly. You feel her rump tremble beneath your fingers as she moans helplessly.");
 	output("\n\nYou stroke her tail, running your hand up its length and listening to the minute gasps and mewls Prai makes. She sways her hips, begging for more than light touches.");
 	output("\n\nYou decide to oblige, and grasp the base of her tail firmly, tugging down her panties with your other hand. Her three inch cock springs free, trailing a line of pre down to her panties, her small sack tucked tight against the base of it, already smeared with her fluids. She squeals softly, and you " + (pc.isTaur() ? "let go of her tail and surge forward, grinding" : "grind") + " your [pc.cock] against her exposed booty, sliding it between the cheeks of her generous ass.");
 	output("\n\nPrai lets out a ragged moan, her skirt rising up as she rocks backward against you. <i>“Stars and starlings, yesssss...”</i>");
 	output("\n\nYou spend a few minutes just grinding against her, feeling the slippery slide of her cheeks against your cock, listening to her moan. " + (pc.isTaur() ? "You run your fingers through her hair, then slowly close your fists, grabbing handfuls of her chocolate-colored hair. Prai answers with a happy gasp, and you rock forward against her," : "You hold her tail, tugging gently,") + " setting the a rhythm that she enthusiastically follows. Her tight hole feels already slicked and lubed against your dick. It seems that Prai’s copious precum leaked down during her suspension via vines. That, or she’s got a mod or two of her own.");
 	output("\n\nYou slowly stop sliding and are rewarded by a plaintive moan from Prai. <i>“Wh-why’d you stop, [pc.name]?”</i>");
 	output("\n\n<i>“Beg for it,”</i> you whisper. The kui-tan responds with a shiver that runs from her rounded ears all the way down to her bushy tail.");
 	output("\n\n<i>“Please!”</i> she croaks, her voice husky with desire. <i>“Please fuck me. Sneezes and snakes, I need it so bad. I need...”</i> she trails off, grinding her plump ass back against you.");
 	output("\n\nYou grip her " + (pc.isTaur() ? "hair" : "tail") + ", stalling her humping, and she whines in protest, <i>“Please! I need your cock in my ass. I neeeeeeed to cum...”</i>");
 	output("\n\nYou " + (pc.isTaur() ? "give her hair a sharp tug" : "squeeze her tail tighter") + ", drawing a yelp and a shiver from her. <i>“I want your cock so bad,”</i> she moans. <i>“I need it. I’ll do anything for it. Pleaaaassssse!”</i>");
 	output("\n\nYou suppose you could give her what she wants. On the other hand, she’s got quite a mouth on her when she’s not babbling non sequiturs; it might be more beneficial to leave her in this state.");
 	
 	pc.lust(20);
 	processTime(10+rand(3));
 	
 	addButton(0, "Fuck", praiPlayBegFuckSecond, undefined, "", "");
 	addButton(1, "Leave", praiPlayBegLeaveSecond, undefined, "", "");
 }
 
 public function praiPlayBegLeaveSecond():void
 {
 	clearOutput();
 	author("Frogapus");
 	showPrai(2);
 	clearMenu();
 	
 	output("You decide to teach the uppity little kui-tan a lesson.");
 	output("\n\n<i>“No,”</i> you say simply.");
 	output("\n\nPrai actually continues shaking her ass and moaning for a minute before your word registers with her.");
 	output("\n\n<i>“I need your cock in my hot little... wait--what???”</i> She blinks her eyes and looks over her shoulder, her sexed-out haze appearing to clear a little.");
 	output("\n\n<i>“No,”</i> you say again, and inform her that you’ll be heading out.");
 	output("\n\n<i>“What the--sneezes and flashlights and luftballoons!”</i> she stammers. Her legs wobble in confusion, and she lurches forward all the way to the ground, lying unceremoniously amidst the bracken.");
 	output("\n\nYou bid her farewell as she clambers to her feet. <i>“Fruits and fritters! What in the world was THAT all about?”</i> she demands.");
 	output("\n\nWhistling, you leave Prai behind in the forest clearing.");
 	
 	processTime(3+rand(3));
 	pc.addHard(flags["PRAI_MOOD"] == 1 ? 6 : 3);
 	flags["PRAI_MOOD"] = 2;
 	flags["PRAI_EMAIL_NUMBER"] = 7;
 	flags["PRAI_EMAIL_STAMP"] = GetGameTimestamp();
 	
 	addButton(0, "Next", mainGameMenu, undefined, "", "");
 }
 
 public function praiPlayBegFuckSecond():void
 {
 	clearOutput();
 	author("Frogapus");
 	showPrai(2);
 	clearMenu();
 	
 	output("You are more than happy to oblige her request. You undo your [pc.clothes] as she whimpers softly in anticipation.");
 	output("\n\n<i>“Please, [pc.name], I need it so bad. I’m dripping through my skirt!”</i> she moans piteously.");
 	output("\n\nYou spare a glance down and note that it looks like she’s soaked the entire front of her skirt with pre-cum, and the sodden material is so sopping wet, it actually is dripping her fluids down to the forest floor.");
 	output("\n\nYou step out of the rest of your garments and lean in close to her. Your hands grip her ass, your fingers sinking into her plush rump. She churrs happily, and her tail arches up even further over her back. With a squeeze, you spread her cheeks apart and expose the shiny black pucker of her asshole.");
 	output("\n\n<i>“This is for being a good girl,”</i> you " + (pc.isMasculine() ? "chuckle" : "giggle") + ".");
 	output("\n\nPrai gasps sharply at your words, her back arching and her tailhole giving a twitch. <i>“Oh please! Please, [pc.name], I can’t take another minute of teasing. Stick it in me already. I need to be fuuuuuuucked!”</i> she whines. You decide that Prai can wait a moment for you to get properly lubed up. " + (pc.isTaur() ? "You slide forward, standing over the shivering kui-tan and slide your dick beneath hers. A few quick pumps completely slathers your cock with her slippery pre, and sends another cascade of happy shivers through Prai’s slim frame. " : "You lean forward, reaching your arm around her front and up, under her skirt. You drench your fingers with the river of pre flowing out from Prai’s dick, drawing out a cascade of mewls and churrs from Prai’s lips. You pull your hand away and slather your own dick with the kui-tan’s pre, lubing yourself up before smearing another glob of it against her tight asshole. "));
 	output("\n\nYou grin and grab her " + (pc.isTaur() ? "hair" : "tail by the base") + ", pulling her back inexorably against the [pc.cockHead] of your cock. Her black bud twitches hotly against your meat as she lets out a low, shuddering moan.");
 	output("\n\n<i>“I can’t take it anymore! Fuck me like an animal, [pc.name]!”</i> she begs.");
 	output("\n\nYou decide to let her have her way. You pull on her with a growl, and haul her back against your dick. She lets out a small, strangled cry as you shove your ");
 	if (pc.cocks[0].cLength < 6) output("small");
 	else if (pc.cocks[0].cLength < 14) output("fat");
 	else output("massive");
 	output(" length into her ass. Thanks to the trap’s copious pre, you manage to slide all the way into her ridiculously tight hole. Prai doesn’t seem to be in pain, but the kui-tan’s gone completely rigid.");
	
	pc.cockChange();
	
 	output("\n\nPrai lets out the tiniest of strangled squeaks, her whole body tensed, barely moving as she gulps in a sharp breath. The suddenness of being impaled likely shocked her, but you’re not in the mood to let her recover. Just as she draws in another shuddering breath, you pull your hips back from her, sliding your cock out of her tight hole.");
 	output("\n\n<i>“Auuuh!”</i> she moans, desperately shoving her hips back against you, trying to keep you inside her. It looks like the little thing doesn’t want to stop being filled by you. It’s a good thing you’re happy to oblige.");
 	output("\n\nYou thrust back hard against her, shoving deep into her round ass. Caught off guard, Prai’s hands slip, and she falls face-first into the dirt. You’d be concerned for her if she didn’t immediately turn her head to the side and hiss a hungry, <i>“Oh, yesssss!”</i>");
 	output("\n\nEncouraged, you draw back again. Prai lets out barely a whimper at this, anticipating what’s to come. When you slam back into her, she groans, her cheek grinding against the forest floor. <i>“More, [pc.name]! More!”</i> she moans.");
 	output("\n\nYou lose track of time, pounding Prai’s ass into the ground" + (pc.balls > 0 ? ", your balls slapping against her tight package" : "") + ". What you can see of her face is plastered with leaves and dirt, and mud is streaked against her white blouse. Her knees must be scraped raw from her rough fucking, but she’s still begging for it, her pleas growing more insistent with each pump of your dick.");
 	output("\n\n" + (pc.physique()/pc.physiqueMax() <= 0.33 ? "You’re actually having trouble keeping up with the frantic thrusts of her hips. " : "Finally, someone that can keep up with your stamina! ") + "Your own breathing quickens, the hot embrace of Prai’s ass around your dick somehow still as tight as when you began. You’re close to cumming, and from the sounds of it, so is Prai.");
 	output("\n\n<i>“Need! Cum!”</i> are the only intelligible words out of her mouth at this point. Everything else is high-pitched grunts and growls. As you near your climax, you pick up the pace, rewarded by a satisfied squeal from Prai as she matches your thrusts with happy slams of her raised ass back against you.");
 	output("\n\nHer pleas, her degradation, her tight little ass, it all culminates as you slam your dick into her, cumming deep inside her hungry little fuckhole. You ");
 	if (pc.cumQ() < 10) output("squirt a hot dribble");
 	else if (pc.cumQ() < 100) output("fire a thick jet");
 	else if (pc.cumQ() < 1000) output("fire several thick jets");
 	else output("gush a veritable gallon");
 	output(" of cum inside the kui-tan trap. Her hot ass tightens around you as you pump your seed into her ass.");
 	output("\n\nShe screams in bliss as her knees collapse under her, you overbalance and follower her down; her slim frame falling into the dirt with you atop her. You feel a quivering from her hips beneath you, and some telltale bucking from Prai as she hiccups in pleasure. The rough fucking has pushed the little trap over the edge too, and she’s cum pinned beneath your body, against the ground.");
 	output("\n\n<i>“Oh flashlights... oh crackers...”</i> she mutters in a distant voice.");
 	output("\n\nHer climax sends a ripple of pleasure through your own body, your cock giving a throb inside her quivering booty. She groans beneath you, still quaking in the aftershocks of pleasure. " + (!pc.isTaur() && !pc.isNaga() && !pc.isGoo() ? "You feel a dull ache in your knees--it feels like the rough sex took its toll on you as well. " : "") + "You take a few minutes to catch your breath, lying atop the kui-tan to think up your next move.");
 	output("\n\nYou could stick around and help clean Prai up, or you could leave the little tart face-down in the dirt.");
 	
 	processTime(25+rand(10));
 	pc.orgasm();
 	IncrementFlag("PRAI_SEX");
 	
 	addButton(0, "Help", praiPlayBegFuckHelpSecond, undefined, "Help", "Help her with cuddles and cleaning.");
 	addButton(1, "Leave", praiPlayBegFuckLeaveSecond, undefined, "", "");
 }
 
 public function praiPlayBegFuckLeaveSecond():void
 {
 	clearOutput();
 	author("Frogapus");
 	showPrai(2);
 	clearMenu();
 	
 	output("You decide that now is a good time to pack up and head out. Prai can clean herself up.");
 	output("\n\nYou put your arms on either side of her and push up off her body. Your dick flops out of her ass with a wet slurping sound, dripping spent cum across her gray-furred cheeks.");
 	output("\n\n<i>“Umma...”</i> she moans, apparently not recovered enough to turn over to see you.");
 	output("\n\nYou stand up, brushing a minimal amount of leaves from your body. It looks like Prai took the brunt of the filth, serving as your makeshift mattress.");
 	output("\n\n<i>“W-wait...”</i> she mumbles trying weakly to get up before flopping back down amongst the bracken.");
 	output("\n\nYou " + (pc.isNude() ? "collect your gear" : "don your [pc.clothes]") + " as Prai lets out a helpless whimper, too worn out to move from her belly-flop. You glance down at the gray-and-black furred kui-tan, streaked with mud, plastered with leaves, and leaking cum. Now that you’re done with her, she’ll be easy pickings for the next horny creature to come through.");
 	output("\n\nYou hum to yourself and stride off through the woods, leaving the degraded kui-tan trap behind.");
 	
 	processTime(3+rand(3));
 	pc.addHard(6);
 	flags["PRAI_MOOD"] = 2;
 	flags["PRAI_EMAIL_NUMBER"] = 8;
 	flags["PRAI_EMAIL_STAMP"] = GetGameTimestamp();
 	
 	addButton(0, "Next", mainGameMenu, undefined, "", "");
 }
 
 public function praiPlayBegFuckHelpSecond():void
 {
 	clearOutput();
 	author("Frogapus");
 	showPrai(2);
 	clearMenu();
 	
 	output("You decide that the little kui-tan probably needs a little help after such a rough fucking. ");
 	output("\n\nYou brush the dirt and leaves as best you can from her cheek before pushing up off of her. Your dick flops out of her ass with a wet slurping sound, dripping spent cum across her gray-furred cheeks.");
 	output("\n\n<i>“Umma...”</i> she moans, apparently not recovered enough to turn over to see you.");
 	output("\n\nThe kui-tan is in no condition to walk, but you’re fairly sure that waiting to recover next to the pitcher plant won’t do her much good. You turn her over to make sure she’s a little more comfortable, and quickly " + (pc.isNude() ? "double check your gear" : "don your [pc.clothes]") + ". You " + (pc.physique()/pc.physiqueMax() < 0.5 ? "grab her by her arms and slide her across the forest floor" : "pick up the kui-tan trap in your arms, and carry her") + " well away from the pitcher plant.");
 	output("\n\nPrai still looks incredibly dazed, blinking at you with unfocused eyes. <i>“[pc.name]?”</i> she manages to murmur before trembling softly. You " + (pc.physique()/pc.physiqueMax() < 0.5 ? "sit down next to her, and slide your arms under her shoulders, pulling her up into your lap" : "slowly sink to the ground, keeping her cradled in your lap") + ". She sighs softly, churring again, her round ears twitching as she curls up against you.");
 	output("\n\nOver the next half hour, you brush the leaves and dirt from her hair and face. You’re at a loss as to what to do with the streaks of mud on her dress until her bandolier shifts against you. A small, pink form wriggles out of one of the pouches, blinking up at you. " + (flags["PRAI_WHO"] == undefined ? "Prai’s pet" : "The Gemu") + " begins to scoot across her dress, its sluglike undercarriage leaving a wake of clean fabric.");
 	output("\n\nYou softly stroke Prai’s hair as the mouse-sized, goo creature cleans her. Gradually, the degraded, dirty slut gives way to a clean and happy lady in your lap. The little kui-tan coos in your arms, snuggling against you as she slowly comes to.");
 	output("\n\n<i>“Thank you for such a wonderful time,”</i> she mewls softly.");
 	output("\n\nYou inform her that she should probably try not to get tied up so often.");
 	output("\n\n<i>“I dunno--it ended pretty well for me,”</i> she says with a soft giggle.");
 	output("\n\nYou lean down " + (pc.isNice() ? "nuzzling the top of her head" : "giving her ear a soft nip") + ". A smile spreads across her muzzle and she looks up at you with satisfied--albeit mischievous eyes.");
 	output("\n\nWhen she’s finally ready to stand, you help her up, untangling her limbs from you, and brushing down any stray leaves. She checks her gear, then smoothes down her dress before blushing shyly and ");
 	if (pc.tallness < 5*12+2) output("bending down");
 	else if (pc.tallness > 5*12+2) output("tiptoeing up");
 	else output("leaning forward");
 	output(" to give you a warm, happy kiss.");
 	output("\n\n<i>“I should be on my way,”</i> she says with another smile. <i>“Thank you for taking such good care of me.”</i>");
 	output("\n\nYou nod and give her pert butt a swat as she skips off happily through the jungle.");
 	
 	processTime(15+rand(6));
 	if (pc.isNice()) pc.addNice(3);
 	else pc.addMischievous(3);
 	flags["PRAI_MOOD"] = 1;
 	flags["PRAI_EMAIL_NUMBER"] = 3;
 	flags["PRAI_EMAIL_STAMP"] = GetGameTimestamp();
 	
 	addButton(0, "Next", mainGameMenu, undefined, "", "");
 }
 
 public function praiHelpSecond():void
 {
 	clearOutput();
 	author("Frogapus");
 	showPrai(1);
 	clearMenu();
 	
 	output("You stride forward and undo the bindings holding her in place.");
 	output("\n\n<i>“Smiles and sunbeams, you’re the best!”</i> she beams, her eyes bright. <i>“I really wasn’t sure what this floral lady would do to me if she woke up. I sure am glad you came by!”</i>");
 	output("\n\nYou undo one of her wrists, first, leaving her to work on the other while you untangle the criss-crossing tangle at her midsection. The wrist binding came away relatively easily--the venus pitcher’s grip came loose after just a little bit of tugging, but what’s around Prai’s waist is almost a knot. You tug carefully, loosening first one vine, then another, uncovering Prai’s waist.");
 	output("\n\nAs the vines fall away, you notice a bulge in her skirt just under them. A small patch of wetness tops the small tent in the yellow fabric. You glance up to see her looking down at you, biting her lip.");
 	output("\n\n<i>“Um... so... it looks like getting tied up kinda turns me on,”</i> she says, shyly, a pink flush just visible under the fur on her cheeks. <i>“I kinda realized it after we met earlier.”</i>");
 	output("\n\nYou raise an eyebrow up at her and she huffs a bit. <i>“Stars and snakes, no--I didn’t get captured on purpose. It’s just a happy accident.”</i>");
 	output("\n\nYou finish untangling the vines at her waist, a knowing smile on your lips as she sputters. <i>“Oh, like you’ve never enjoyed being bested by something out in the wilds!”</i> Your hands brush lightly over her erection and she stops, mid-tirade, with a gasp.");
 	output("\n\n<i>“Hahhhhhhhh... that’s... y-you did that on purpose, didn’t you?”</i>");
 	output("\n\nYou tell her that you did, indeed, and she blushes.");
 	output("\n\n<i>“Okay, I’ll admit it--you’re something of a dashing explorer, [pc.name],”</i> she says with a smile. The vines fall down around her feet and she gingerly steps out. <i>“I don’t suppose--”</i>");
 	output("\n\nHer sentence is cut off by a beeping blue light on her bandolier. <i>“Oh my gosh! The sample!”</i> She bops her palm against her forehead, nearly knocking her pith helmet off. <i>“The whole point of this was to get a sample!”</i>");
 	output("\n\nShe flips open another compartment on her bandolier and pulls out a small, clear container and a tiny scalpel with a glowing tip. <i>“Sorry! I don’t mean to be rude, but I need to get this done if I want to get paid this week.”</i> She walks gingerly past you, tip-toeing through the roots and vines on the ground, all the way up to the venus pitcher plant.");
 	output("\n\nShe leans in closely, holding the container up against the floral woman’s arm, and brings her scalpel to the plant’s arm.");
 	output("\n\nYou know you should let Prai finish. Given her sudden focus on her work, it’s unlikely that you’ll be able to fool around with her afterwards. On the other hand, it’s extremely tempting to see what would happen if the plant woke up.");
 	
 	pc.lust(10);
 	processTime(10+rand(3));
 	
 	addButton(0, "Gather", praiHelpGatherSecond, undefined, "Gather", "Let Prai gather her sample.");
 	addButton(1, "WakePlant", praiHelpWakeSecond, undefined, "Wake Plant", "Wake up the plant and watch what happens.");
 }
 
 public function praiHelpGatherSecond():void
 {
 	clearOutput();
 	author("Frogapus");
 	showPrai(1);
 	clearMenu();
 	
 	output("You wait patiently as Prai’s laser scalpel cuts a small leaf free from the Venus pitcher’s arm.");
 	output("\n\nThe plant woman barely stirs as the kui-tan caps the tiny container and tucks her tools into her bandolier. <i>“There we go!”</i> she chirps happily. <i>“That’s what I came here for.”</i>");
 	output("\n\nYou goggle at her, expressing more than just a little disbelief. <i>“That’s all?”</i>");
 	output("\n\nShe nods and smiles. <i>“Bio-statis gel in the cup keeps the leaf alive until I can take it back for study,”</i> she hops over a few roots to land next to you. <i>“Animate plants, like these venus pitchers reproduce in ways that are halfway between animal and vegetable, and still produce viable offspring. If we could adapt that for widespread use, then a lot of individuals with problems reproducing might have an easier time.”</i>");
 	output("\n\nYou blink, impressed. It looks like Prai really does know what she’s doing--bondage mishaps aside.");
 	output("\n\n<i>“I would really, really love to hang out and chat, [pc.name], but I really, really need to get this back to the lab,”</i> she says, patting her sling. <i>“Thank you again for helping me out! I really do appreciate it!”</i> She gives you a quick curtsy, flaring out her yellow skirt. <i>“See you soon, [pc.name]!”</i>");
 	output("\n\nYou reply with your goodbye and Prai darts off through the woods. You shake your head and wonder if she’ll make it all the way back to her lab before something else ties her up.");
 	
 	processTime(15+rand(6));
 	pc.addNice(3);
 	flags["PRAI_MOOD"] = 1;
 	flags["PRAI_EMAIL_NUMBER"] = 4;
 	flags["PRAI_EMAIL_STAMP"] = GetGameTimestamp();
 	
 	addButton(0, "Next", mainGameMenu, undefined, "", "");
 }
 
 public function praiHelpWakeSecond():void
 {
 	clearOutput();
 	author("Frogapus");
 	showPrai(2);
 	clearMenu();
 	
 	output("As Prai sneaks up on the snoozing pitcher plant, you decide that now would be a good time to act. You pick up a small stick next to your foot and toss it at the pitcher plant.");
 	output("\n\nThe floral woman grunts as the wood collides into the red blossom on top of her head. She blinks her eyes open sleepily and yawns, stretching her arms back up over her head. Behind her, Prai freezes, her eyes open wide in horror. The plant woman’s tentacles sweep around the clearing as she stretches, falling too short to reach you, but well within reach of Prai.");
 	output("\n\nWith a yelp, the little kui-tan is swept up in the tangled embrace of the venus pitcher plant. The green-skinned woman rubs her eyes and grumbles in a still-melodious voice. <i>“You... you little sneak!”</i> Her vines haul Prai up from her feet, dangling her in midair. ");
 	output("\n\n<i>“You... you poisoned me!”</i> snaps the plant woman.");
 	output("\n\n<i>“[pc.name], help!”</i> Prai shouts. <i>“I--oh no!”</i> her words are cut off as the pitcher plant flips her upside down. Her yellow skirt flips up, revealing her sheer panties. <i>“It was only a sedative!”</i> she cries. <i>“I just needed a sample from you!”</i>");
 	output("\n\n<i>“A sample of </i>what<i>, exactly?”</i> asks the green woman. Her vines tug upwards and hold Prai’s upside-down face level with hers.");
 	output("\n\n<i>“A leaf! That’s all! I wanted to study how you reproduce!”</i> explains Prai, desperately trying to flatten her upside-down skirt over her crotch.");
 	output("\n\n<i>“Well, I suppose that’s not so bad,”</i> replies the pitcher plant, after a moment of thought.");
 	output("\n\n<i>“Don’t forget the poison!”</i> you goad, from the edge of the clearing. The whole reason you woke up the flower woman was to see a little action, and you don’t want Prai talking her way out of it.");
 	output("\n\n<i>“That </i>is<i> true,”</i> says the pitcher plant, giving Prai a hard glare.");
 	output("\n\n<i>“Oh crackers...”</i> mumbles Prai in dread.");
 	output("\n\n<i>“I’m going to let you see how we reproduce, you little sneak, but I’m </i>not<i> going to bother making it fun for you,”</i> she says, frowning at Prai. Her vines lash around Prai, coiling and uncoiling through the air.");
 	output("\n\n<i>“What does that meeEEEEEEEEEE!”</i> squeals Prai.");
 	output("\n\nYou’ve got a front row seat to a little humiliation theater. You watch in glee as a particularly thick vine shoves Prai’s panties to the side, smearing her ass with something slick and oozy. Prai shivers, her ass cheeks gleaming with lubricant ooze.");
 	output("\n\nPrai, still upside-down, tries in vain to wrestle the vines away from her. The pitcher plant harrumphs in disdain and loops several of them, leaving the kui-tan helplessly tangled. When a thick vine pushes into Prai’s tight hole, the upside-down woman gives out a yelp, her eyes crossing. You see her cock throb in her panties, spurting out an impressive amount of pre.");
 	output("\n\n<i>“Guh!”</i> moans Prai, her body quaking at the sudden invasion. ");
 	output("\n\nThe venus pitcher wastes no time. You watch in fascination as bulges begin moving down the length of the thick vine, carrying large lumps all the way to Prai’s ass. The kui-tan’s angle means that she can also catch a glimpse of them as they slide towards her. <i>“Oh crackers! Oh spoons and sparklers! Oh noooooo!”</i> she groans.");
 	output("\n\n<i>“[pc.name], I hate you!”</i> she manages to gasp out before the first bulge reaches her. You watch in fascination as it stretches the little trap’s hole wide. Prai goes rigid as the first seed pod pushes into her. <i>“Guh!”</i> she grunts. You see her body go limp, her eyes unfocused as the first pod slides into her ass. She looks a bit like a puppet, dangling from the floral woman’s vines, helpless as another seed pushes into her.");
 	output("\n\nPrai can do little more than squeak this time, as the vengeful plant woman violates her. You watch eagerly as her belly starts to swell with the mass of the insertions, her trim frame now hosting a slowly-bulging belly. <i>“Nuuuuuuuh...”</i> she gasps.");
 	output("\n\nThe pitcher plant, for her part, is watching Prai, her emerald eyes fixated on the kui-tan’s responses. <i>“A few more,”</i> she murmurs, <i>“just so you learn your lesson.”</i> Her green fingers slide down one of the nearby tendrils and find its perverse opening as she begins playing with herself.");
 	if (!pc.isTaur())
 	{
 		output("\n\nYou decide that if everyone’s having a good time, you might as well, too, and adjust your [pc.clothes], giving you access to your own fun bits. ");
 		if (pc.hasCock()) output("You grasp your [pc.cockBiggest] cock and begin stroking, growing harder and harder as you watch Prai’s punishment. ");
 		if (pc.hasVagina()) output("You mirror the venus pitcher, slipping a finger inside your own steaming cunt, playing softly with your delicate folds, teasing out several shivers of pleasure. ");
 		output("As Prai’s helpless whimpers grow more and more desperate, the pitcher plant feeding pod after pod into her, you quicken your own pace.");
 	}
 	output("\n\nYou watch in awe as Prai’s belly swells larger and larger. She looks nine-months pregnant, filled with seeds from the pitcher plant. Prai’s unfocused eyes fall on you, her jaw hanging slack as she loses herself in the pleasure of being filled to the brim. She gives a sharp, little squeal, her hips bucking against the thick vine, her panty-clad cock lurching, spurting out a load of white cum through the fabric.");
 	output("\n\nThe floral woman looks phenomenally close as well, one hand buried in her tentacle-pussy, the other kneading the ruffle of leaves covering her breasts. As the final lump slides down her vine and pushes into Prai, she moans almost musically and doubles over, a sap-like goo spurting from between her fingers. ");
 	if (!pc.isTaur()) output("It’s too much for you and you pant heavily, your own rhythm bringing you to a sudden orgasm. You release against your hand, nearly falling over, climaxing to the sight of the two feminine climaxing beauties in front of you.");
 	output("\n\n<i>“I... I hope you... learned your lesson...”</i> breathes the venus pitcher plant, her cheeks tinted with a dark green flush. Her tentacles slowly lower Prai to the ground, righting her along the way.");
 	output("\n\nThe kui-tan is a mess. Though the plant woman puts her down on her feet, she looks barely able to stand. Her whole body is streaked with fluids from the pitcher plant, and her own liquid orgasm. Her eyes are unfocused and she sways back and forth. Several buttons on her blouse appear to have popped to make way for her new, massive belly. Hugely distended, it hangs over her cum-soaked skirt. Prai unconsciously brings her hands to her pregnant belly, cradling it as you stare.");
 	output("\n\n<i>“Is that... me?”</i> she asks, glancing down. Her eyes slowly focus, and a look of fury spreads across her face as she turns back up to you. <i>“Look what you did to me, [pc.name]! Why would you do that, you jerk?”</i> She stomps her foot, a gesture that’s a little ruined by her new, gravid center of balance. Prai nearly tips over.");
 	output("\n\nYou offer her a hand, and she refuses it, glaring at you. <i>“All... your fault,”</i> she says, looking incensed. She turns on her heel and stomps off through the jungle, her new belly bouncing with every step.");
 	output("\n\nYou feel a little guilty, and glance at the pitcher plant. A soft snore indicates that the floral woman is already recouping her energy from reproducing. You shrug and " + (!pc.isTaur() ? "readjust your [pc.clothes]. W" : "w") + "ith a quick check on your gear, you set off through the jungle in your own direction.");
 	
 	processTime(20+rand(8));
 	if (!pc.isTaur()) pc.orgasm();
 	else pc.lust(20);
 	pc.addHard(6);
 	flags["PRAI_MOOD"] = 2;
 	flags["PRAI_EMAIL_NUMBER"] = 9;
 	flags["PRAI_EMAIL_STAMP"] = GetGameTimestamp();
 	
 	addButton(0, "Next", mainGameMenu, undefined, "", "");
 }
 
 public function praiEmailText():String
 {
 	var eText:String = "";
 	switch(flags["PRAI_EMAIL_NUMBER"])
 	{
 		case 1: eText+="Hey there, [pc.name]! It’s Prai!";
 				eText+="\n\nI hope you don’t mind me picking up your email! My Grim-R has aetherdrop tech to scan for nearby contacts and it pinged yours when you were in the jungle with me.";
 				eText+="\n\nI wanted to thank you for helping me out of that jam. That’ll teach me to go mouthing off to giant bees! Anyway, I don’t want you to think I’m ungrateful. So I’ve sent a transfer of 500 credits with this email as a way of saying thanks!";
 				eText+="\n\nMy next project is to study the semi-sentient plant life of Mhen’ga. So we might still bump into each other!";
 				eText+="\n\nSee ya if I see ya!";
 				eText+="\n\n--Prai";
 				eText+="\nSent from my Grim-R";
 				pc.credits += 500;
 				break;
 		case 2: eText+="Hiya there, [pc.name]! It’s Prai!";
 				eText+="\n\nGoodness grapejuice, I hope this doesn’t become a habit! Thank you again for helping me out of a pickle once again. I’ll try to keep from getting tied up again, but I can’t promise anything. Something about those zil girls just rubs me the wrong way.";
 				eText+="\n\nBut seriously! Thank you for helping me out of a jam again. ";
 				eText+="\n\nAnyway, I don’t want you to think I’m ungrateful. So I’ve sent a transfer of 200 credits with this email as a way of saying thanks! I’m sorry--it’d be more, but Xenogen’s not paying as much for my zil research these days for some reason.";
 				eText+="\n\nSee you later!";
				eText+="\n\n--Prai";
 				eText+="\nSent from my Grim-R";
 				pc.credits += 200;
 				break;
 		case 3: eText+="Hiya there, [pc.name]! It’s Prai!";
 				eText+="\n\nThank you so, so much for getting me out of there! Rescues (and lovely touches) are always welcome from you! <3";
 				eText+="\n\nIt might be a little weird to send credits, but until I find something that would help you out, maybe they’ll have to do.";
 				eText+="\n\nSee you later!";
				eText+="\n\n--Prai";
 				eText+="\nSent from my Grim-R";
 				pc.credits += 200;
 				break;
 		case 4: eText+="[pc.name]! The sample I got added a HUGE amount to my research! I can’t talk about it now, since there are actually a few companies emailing me about it, but it turns out that there are more than a few applications of venus pitcher DNA.";
 				eText+="\n\nThank you again, SO much for helping me get it--and, you know, rescuing me! I couldn’t have done it without you! As a token of my thanks, here’s 200 credits. I might need to grab some more later to confirm these results, so if you’re out and about in the jungle again, keep an eye out for me!";
				eText+="\n\n--Prai";
 				eText+="\nSent from my Grim-R";
 				pc.credits += 200;
 				break;
 		case 5: eText+="[pc.name], you absolute jerk! Why would you just leave me there?";
 				eText+="\n\nDo you know what happened to me? Guess! That’s right! Those two zil jerk-wads came back with a boy in tow...! And they... did stuff to me. They had me so doped up on aphrodisiacs that I didn’t know up from down. And I went either up or down on them--both of the girls. Blech! I don’t even like pussy! ";
 				eText+="\n\nThen they untied just my ass so that the guy they brought with them could fuck me. That part... wasn’t so bad. I think the girls fed me some kind of honey and played with my nipples the whole time. It must have felt pretty amazing, since my leggings ended soaked with cum and honey by the time I woke up later.";
 				eText+="\n\nBut that’s beside the point!";
 				eText+="\n\nI’m going back aboard my ship for a medical diagnostic. Who </i>knows<i> what chemicals are swimming around in my system now? Don’t expect me to ask for any more of your help, because I don’t need it. Here’s a payment for services rendered and we’re square.";
				eText+="\n\n--Prai";
 				eText+="\nSent from my Grim-R";
 				pc.credits += 50;
 				break;
 		case 6: eText+="[pc.name], you unmitigated jerk! I can’t believe you would turn me on and just leave me there in the forest! The gosh-darned plant woke up, by the way! Now I’m full of some kind of plant juice and seed things! What the flying flapjacks!! Don’t expect me to ask for any more of your help, because I don’t need it. Here’s a payment for services rendered and we’re square.";
 				eText+="\n\n--Prai";
 				eText+="\nSent from my Grim-R";
 				pc.credits += 50;
 				break;
 		case 7: eText+="Why in the world would you just turn me on that much and just leave me in the dirt??? I can’t even... arrrgh!";
 				eText+="\n\n[pc.name], you total jerk! I tried to get away and take care of myself, by the way. Do you know what happened? I got violated by a naleen. Do you know what it’s like to have two dicks shoved in your ass at the same time? It’s extremely... well, it’s actually not terrible, but it’s not the sort of thing a xenobiologist should be doing!";
 				eText+="\n\nOne of these days, your actions are going to come back around on you, [pc.name]. But whatever--that’s your account to square with the universe. In the meantime, here’s 50 credits for “saving” me so that we’re square and I don’t owe you anything.";
				eText+="\n\n--Prai";
 				eText+="\nSent from my Grim-R";
 				pc.credits += 50;
 				break;
 		case 8: eText+="Why in the world would you just turn me on that much and just leave me in the dirt??? I can’t even... arrrgh!";
 				eText+="\n\n[pc.name], you total jerk! While I was trying to recover, I got assaulted by a kerokora! She made me lick her--everywhere! Did you know that kerokora slime is a hallucinogen? Do you know what it’s like to </i>hear<i> gravity?";
 				eText+="\n\nFrigates and flashlights, [pc.name]! One of these days, you’re going to get what’s coming to you! But whatever--that’s your account to square with the universe. In the meantime, here’s 50 credits for saving me so that we’re square and I don’t owe you anything.";
				eText+="\n\n--Prai";
 				eText+="\nSent from my Grim-R";
 				pc.credits += 50;
 				break;
 		case 9: eText+="Flying flapjacks, what is wrong with you? Why would you free me just to let the plant capture me again??? Do you know how LONG it took to get those seed pods out of me? What I went through? Everyone was staring when I got back to the station! I had to squat in my ship and wait for hours to lay all of them You’re such a jerk, [pc.name]!";
				eText+="\n\n--Prai";
 				eText+="\nSent from my Grim-R";
 				break;
 		default:output("\n\n<b>PRAI EMAIL SHIT IS FUCKED YO</b>");
 	}
 	return ParseText(eText);
 }
 
 public function praiSubjectText():String
 {
 	switch(flags["PRAI_EMAIL_NUMBER"])
 	{
 		case 1: return "Thanks so much!";
 		case 2: return "Thanks again!";
 		case 3: return "Thanks again!";
 		case 4: return "Yeeeeee!";
 		case 5: return "What is wrong with you?";
 		case 6: return "Seriously???";
 		case 7: return "WHY??";
 		case 8: return "WHY??";
 		case 9: return "WHAT THE HELL???";
 		default: return "<b>PRAI EMAIL SUBJECT IS FUCKED</b>";
 	}
 }