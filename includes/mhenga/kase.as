/*
 * 
 * Kase Bonkiil, Logistics Officer - 
 * 		https://docs.google.com/document/d/1NMYeSeIxw5EOe7SQOy5hnF1jkyekz4JTWwegHr7ZSfA/edit#heading=h.kpjg8hebew1f
 * 
 * #Flags:
 * KASE_INTRO		- 1 if player has met Kase at the bar and knows his name,
 * 							to tell if player has ever met Kase use flags["SATELLITE_QUEST"] != undefined
 * KASE_TIMER		- timestamp of when player first meets Kase at bar, after 1 week he gone 5evar
 * KASE_CREW		- 1 if Kase is a crewmember
 * KASE_STRESS		- 1 if PC gave Kase stress relief this encounter
 * KASE_JOB			- 1 if talked to Kase about jobs
 * KASE_OUTFIT		- 0 for Pyrite outfit, 1 for SteeleTech outfit
 * KASE_HEALED		- 1 if his arm is healed
 * KASE_STEELETECH	- 1 if Kase is a part of SteeleTech
 * 
 */

public function showKase(nude:Boolean = false):void
{
	if (flags["KASE_INTRO"] != undefined) showName("\nKASE");
	else showName("KAITHRIT\nBUSINESSGUY");
	showBust(kaseBustDisplay(nude));
}

public function kaseBustDisplay(nude:Boolean = false):String
{
	//Kase w/ broken arm in Pyrite suit 		= KASE
	//Kase w/o broken arm in Pyrite suit		= KASE_HEALED
	//Kase w/ broken arm in SteeleTech suit 	= KASE_ST
	//Kase w/o broken arm in SteeleTech suit	= KASE_ST_HEALED
	//Kase w/o broken arm nude					= KASE_NUDE
	
	var sBust:String = "KASE";
	
	if (nude) return sBust + "_NUDE";
	
	if (flags["KASE_OUTFIT"] == 1) sBust += "_ST";
	if (flags["KASE_HEALED"] != undefined) sBust += "_HEALED";
	
	return sBust;
}

public function kaseAtBurts():Boolean
{
	//Must have completed Satellite Quest, Kase must not have left yet, and Kase must not be crew
	return (flags["SATELLITE_QUEST"] == 2 && (flags["KASE_TIMER"] == undefined || flags["KASE_TIMER"]+(60*24*7) > GetGameTimestamp()) && flags["KASE_CREW"] == undefined);
}

public function kaseAtBurtsAddendum(btnSlot:int = 0):void
{
	if (flags["KASE_INTRO"] == undefined) output("\n\nLooking around, you manage to spot a familiar face; it’s that kaithrit who sent you out to find a Pyrite satellite. He’s sitting at a table all by his lonesome, and looking a little down, too.");
	else output("\n\nKase is sitting all by himself at a nearby table, writing on his holopad while he waits for Pyrite to redeploy him off this jungle world. Maybe he could use some company... or a new job.");
	addButton(btnSlot, (flags["KASE_INTRO"] == undefined ? "PyriteBoy" : "Kase"), approachKase, undefined, "", "");
}

public function approachKase():void
{
	if (flags["KASE_OUTFIT"] == undefined) flags["KASE_OUTFIT"] = 0;
	
	clearOutput();
	clearMenu();
	
	if (flags["KASE_INTRO"] == undefined)
	{
		output("You begin to make your way up to the sad-looking kaithrit, taking in his appearance for a moment: his neck-length deep green hair, the soft curves of his face, his slight frame, and his two feline tails. He barely notices your approach until you’re practically right next to him. ");
		output("\n\n<i>“Oh!”</i> he exclaims, looking up from his holopad and brushing some green locks from his eyes, voice sounding as poised and proper as the last time you met, <i>“Wait a moment, I remember you, " + pc.mf("sir", "ma’am") + ". You’re the one that retrieved the hard drive from the fallen satellite.”</i> He shifts a bit in his seat, picking up his posture to look more proper and professional. <i>“I’m afraid I have no more work for you at the present, though. In fact, I’m a bit at a loss for labor too, at the moment.”</i>");
		output("\n\nYou smile and take a seat across from the kitty, which seems to surprise him a bit, and tell him that you just thought he looked " + (pc.isMischievous() ? "lonely" : "a bit down") + " and that you thought he could use some company.");
		output("\n\n<i>“Oh, well,”</i> he stammers, letting his holopad fall flat onto the table, <i>“I guess I could engage in some friendly conversation. I haven’t had much of it since I arrived here on Mhen’ga, and it’d probably help in keeping my mind off things.”</i>");
		output("\n\nThere’s a short silence after that before he nearly jumps out of his seat. <i>“Ah! That’s right!”</i> he says, extending his one good arm forward and offering a handshake, <i>“My name is Kase, Kase Bokiil, a pleasure to meet you, " + pc.mf("mister", "miss") + "...?”</i>");
		output("\n\nNoting that his other arm is still injured or broken, you take his hand and shake it, introducing yourself as “[pc.name]” resulting in a warm smile from Kase.");
		output("\n\nOnce your introductions are done, you’re both left sitting across from each other and your new friend seems a bit happier than he was before you came over. Then, after another short period of silence, Kase speaks up, <i>“So, [pc.name], was there anything in particular you wanted to discuss?”</i>");
		flags["KASE_INTRO"] = 1;
		flags["KASE_TIMER"] = GetGameTimestamp();
	}
	else 
	{
		output("Kase notices your approach, looking up from his datapad to smile your way and give you a wave, <i>“Hello again, [pc.name].”</i>");
		output("\n\nTaking a seat across from the kaithrit, you notice that his face seems a lot brighter and happier at your presence. You quickly give him a hello and get comfortable in your seat, while Kase once again takes up a more proper, taller posture.");
		output("\n\n<i>“So,”</i> he says, <i>“What brought you over here today, friend?”</i>");
	}
	
	processTime(5 + rand(3));
	flags["KASE_STRESS"] = 0;
	
	author("HugsAlright");
	showKase();
	kaseMenu();
}

public function kaseMenu():void
{
	clearMenu();
	
	addButton(0, "Appearance", kaseAppearance, undefined, "Appearance", "Take a look at Kase.");
	addButton(1, "Talk", kaseTalk, undefined, "Talk", "Have a chat with the kaithrit.");
	if (flags["KASE_STRESS"] != 1) addButton(2, "StressRelief", kaseStressRelief, undefined, "Stress Relief", "Help the kitty feel a bit better, with your hands.");
	else addDisabledButton(2, "StressRelief", "Stress Relief", "You already eased his tension.");
	if (flags["KASE_JOB"] != undefined) addButton(3, "Join Crew", kaseJoinCrew, undefined, "Join Crew", "Kase is looking for a new job, seems like a good opportunity to get him on your crew.");
	addButton(14, "Leave", mainGameMenu, undefined, "", "");
}

public function kaseAppearance():void
{
	clearOutput();
	author("HugsAlright");
	showKase();
	clearMenu();
	
	output("You’d guess the pale-skinned Kase is about 5\' 5\", which is pretty normal for a kaithrit. What’s even more inherent of his race, though, is his figure. His frame is slight, but the curves of his hips, thighs, and midsection, along with his svelte shoulders, give him a very girlish, dainty shape, which seems common for his species’ males.");
	output("\n\nBeyond that, his face possesses soft, smooth curves adorned by freckles that further enhance his effeminate appearance. Short, messy hair hangs all around his head, coloured a deep pine and parted by his pointy, feline ears. It’s also apparent Kase has inherited heterochromia from one (or maybe both) of his parents, leaving one of his eyes a dark green like his hair, and his other a bright, eye-catching golden-yellow, both with slitted feline pupils.");
	output("\n\nEven though Kase can easily be classified as a femboy, he doesn’t seem to accentuate his femininity beyond its natural bounds.");
	output("\n\nThe last hallmark of his race visible to you is his two prehensile tails, covered in soft, pine-coloured fur and swishing and swaying subconsciously.");
	if (flags["KASE_OUTFIT"] == 0) output("\n\nRight now, Kase is wearing a Pyrite field-suit. It hugs his frame tightly, despite the lighty-armoured plating laden across gold and maroon latex, surely put in place to protect employees on rush planets like Mhen’ga.");
	else output("\n\nKase is now dressed in a standard-issue Steele Tech jumpsuit. The black latex hugs at his frame tightly, showing off all his curves (and his bulge) as light shines across the yellow and black of his outfit.");
	output("\n\nUnderneath his clothes, however, rests a thick and sizable nine-inch kitty cock, covered in sinfully soft barbs, perfect for scratching a guy’s or girl’s very specific itch, along with a plump pair of balls. Opposite that rests a tight tailhole right between his big, squeezable butt. ");
	output("\n\nA cute kitty if you’ve ever seen one.");
	
	processTime(3);
	if(kaseIsCrew()) kaseCrewMenu();
	else kaseMenu();
	addDisabledButton(0, "Appearance", "Appearance", "You’re looking at him right now.");
}

public function kaseTalk():void
{
	clearOutput();
	author("HugsAlright");
	showKase();
	clearMenu();
	
	output("What should you and Kase talk about?");
	
	kaseTalkMenu();
}

public function kaseTalkMenu():void
{
	addButton(0, "Him", kaseTalkHim, undefined, "Him", "Learn a bit about the enigmatic Kase Bokiil.");
	addButton(1, "Work", kaseTalkWork, undefined, "Work", "Figure out what’s got the kaithrit so bummed out. ");
	addButton(2, "Arm", kaseTalkArm, undefined, "Arm", "Ask him how his arm is doing.");
	addButton(14, "Back", kaseMenu, undefined, "", "");
}

public function kaseTalkHim(btnSlot:int = 0):void
{
	clearOutput();
	author("HugsAlright");
	showKase();
	clearMenu();
	
	output("<i>“Me? Well, as you already know I "+(kaseIsCrew()?"used to ":"")+"work for Pyrite, but beyond that I guess I could tell you a bit about myself. That is, of course, if you want to hear,”</i> Kase explains, keeping his straight posture and looking at you expectantly.");
	output("\n\nYou tell the pretty kitty " + (pc.isNice() ? "you’d love to learn some more about him, giving him an inviting smile as you do so" : "you wouldn’t have asked if you didn’t want to hear, rolling your eyes as you do so") + ".");
	output("\n\n<i>“Right then,”</i> Kase begins, ready to delve into his stories, <i>“I was born on a colony, and a diverse one at that. So I grew up alongside many core races, ausar and humans especially. My parents, of course, were both kaithrit.”</i> His posture seems to slump a bit through explaining that, which he quickly notices and corrects, sitting up straight again before he continues, <i>“Growing up, I found I always had a knack for math and organization, and I enjoyed them both quite a bit. So, when the time finally came, I ended up getting a job working in that field. You see, Pyrite Industries was very influential on our planet, and some of my family worked for them, so it was relatively easy for me to get work in their logistics division.”</i> Kase"+(kaseIsCrew()?"’s posture seems to stiffen with confidence, <i>“And that’s how I ended up on Mhen’ga, and how I ended up on your crew.”</i>":" once again seems to shrink in his seat, <i>“And that’s how I ended up here, and why I’m <i>still</i> here, with a broken arm.”</i>"));
	if(kaseIsCrew()) output("\n\nHe smiles warmly after saying that, seems like Kase is pretty happy with his new job.");
	else output("\n\n" + (pc.isAss() ? "Eh, you’ve been through worse. " : "Wow, sounds like a bad deal to you. ") + "Maybe you could ask him about his work later.");
	output("\n\n<i>“But, other than that, I don’t believe I’m all that interesting,”</i> he continues, " + (flags["KASE_HEALED"] == undefined ? "gesturing with his one good arm, " : "") + "<i>“I like to run calculations and organize in my spare time, normally with some music. Slow and melodic songs help me to think more clearly.”</i>");
	
	processTime(5 + rand(5));
	
	if(kaseIsCrew())
	{
		kaseCrewTalkMenu();
		addDisabledButton(btnSlot, "Him");
	}	
	else 
	{
		kaseTalkMenu();
		addDisabledButton(0, "Him");
	}
}

public function kaseTalkWork():void
{
	clearOutput();
	author("HugsAlright");
	showKase();
	clearMenu();
	
	output("<i>“Working for Pyrite wasn’t terrible, at first anyway,”</i> Kase states, <i>“I enjoyed running numbers, keeping track of supplies arriving on and shipping off the planet, but then, after some promotions they started shipping <i>me</i> off-world.”</i> The kitty boy slumps and shakes his head, <i>“They sent me to rush worlds to recover lost shipments, take over logistic branches when their original managers got injured by some forsaken rush-monster. Then, like you saw first hand here, they send me into the wilderness to find lost satellites... to get injured by forsaken rush-monsters. Now they have me waiting here in this... shanty town for redeployment to the next issue I am privileged to fix. <b>I believe I’ll only be here for another ");
	if (GetGameTimestamp()-(1*24*60) < flags["KASE_TIMER"]) output("week");
	else if (GetGameTimestamp()-(2*24*60) < flags["KASE_TIMER"]) output("6 days"); 
	else if (GetGameTimestamp()-(3*24*60) < flags["KASE_TIMER"]) output("5 days"); 
	else if (GetGameTimestamp()-(4*24*60) < flags["KASE_TIMER"]) output("few days"); 
	else if (GetGameTimestamp()-(6*24*60) < flags["KASE_TIMER"]) output("couple of days"); 
	else if (GetGameTimestamp()-(7*24*60) < flags["KASE_TIMER"]) output("day"); 
	else output("!KASE SHOULDN’T BE HERE MAN!");
	output(" before that happens, though.</b>”</i>");
	output("\n\nHe lets out a long sigh and rubs his broken arm for a moment, leading you to ask him if he’s thought of getting work anywhere else.");
	output("\n\n<i>“Oh, believe me I have,”</i> the Kaithrit continues, straightening his posture, <i>“But I’m under contract, and until I find someone who is willing to buy that contract, or this contract ends, I am stuck with Pyrite and their... wonderful medical policies.”</i>");
	output("\n\nYou ask him what he means by that.");
	output("\n\n<i>“It means each time I enter a rush-system, I have to sign a waiver that renders Pyrite’s health incapable of covering any injuries I receive while out in the field, leaving me nursing this poor arm on my payroll,”</i> he explains, emphasizing his injured limb. ");
	output("\n\nSounds like a pretty shit deal.");
	
	processTime(5 + rand(5));
	flags["KASE_JOB"] = 1;
	
	kaseTalkMenu();
	addDisabledButton(1, "Work");
}

public function kaseTalkArm(btnSlot:int = 0):void
{
	clearOutput();
	author("HugsAlright");
	showKase();
	clearMenu();
	
	if (GetGameTimestamp()-(3*24*60) < flags["KASE_TIMER"]) output("<i>“Oh,”</i> he says, gently rubbing his injured appendage, <i>“It has healing to do. I should be able to move it freely again in about a week, by my estimate. If I hadn’t had to buy cheap medical supplies, I’d probably be better already.”</i>");
	else if (GetGameTimestamp()-(5*24*60) < flags["KASE_TIMER"]) output("<i>“It’s starting to feel better,”</i> Kase says with a smile, rolling his shoulder a tiny bit, <i>“It’s easier to move it now, but I’m going to give it a few more days before I take the sling off.”</i>");
	else if (GetGameTimestamp()-(7*24*60) < flags["KASE_TIMER"]) output("<i>“The pain has dissipated quite a bit,”</i> Kase says happily, <i>“It’s still a bit stiff from the sling, but I should be completely healed in a day or two.”</i>");
	else 
	{
		output("You look down to see his arm is free of its sling, and a very happy kaithrit above that, but regardless, you ask him how he’s feeling.");
		output("\n\n<i>“All better!”</i> Kase exclaims, " + (kaseIsCrew() ? "<i>“And now I can do my job to the fullest of my abilities, Captain.”</i>" : "<i>“Why, I feel like I could have gone after that satellite myself!”</i>") + "");
		output("\n\nYou smile and tell him you’re glad his arm’s okay.");
		flags["KASE_HEALED"] = 1;
	}
	
	processTime(2 + rand(2));
	
	if(kaseIsCrew())
	{
		kaseCrewTalkMenu();
		addDisabledButton(btnSlot, "Arm");
	}	
	else 
	{
		kaseTalkMenu();
		addDisabledButton(2, "Arm");
	}
}

public function kaseStressRelief():void
{
	clearOutput();
	author("HugsAlright");
	showKase();
	clearMenu();
	
	output("You smirk and slide your way over to Kase’s side of the table, getting rather close to him, enough to make his face turn red.");
	output("\n\n<i>“Oh, uhm,”</i> he stammers for a moment, <i>“did you need something, " + pc.mf("sir", "ma’am") + "?”</i>");
	output("\n\nYou tell him that you don’t need anything from him, but you thought you could give him a little something to make his arm feel a bit better, and quickly reach a hand down to grab at the visible bulge in his armor’s groin.");
	output("\n\nHe gasps with surprise as your hand makes contact with his still clothed cock, shoulders jumping before he settles down, slumping a bit in his seat.");
	output("\n\n<i>“Y-yes,”</i> he stutters, breathing heavy, <i>“I-I think the release of endorphins from some intimate contact should dilute the pain...”</i>");
	output("\n\nYou smile, wondering if Kase’s sudden loss of composure is due to lust or surprise, but all the same, you put an arm over his shoulder and reach up to the zipper of his armoured suit with another.");
	output("\n\nThe kaithrit’s breath goes ragged as you start to pull downward, parting his clothing and revealing the pale skin of his smooth chest all the way down to his svelte tummy until the zipper reaches his groin. Then it’s just a little trip south before you finally free Kase’s cat-cock, letting his slowly stiffening tool pop free of its confines with a relieved sigh, already radiating warmth onto your palm and pulsing with each beat of the kitty’s heart. ");
	output("\n\nIt’s hard to tell his length now, but you’re sure Kase has a thick shaft, one you quickly wrap your fingers around, drawing quivering and stuttering noises from the kaithrit. You lean into him, and once you’ve got a good grip on his manhood, you start to stroke, gently fondling his cock to hardness. Grinning, you look at his face, getting a good look at his beet-red and lust-ridden visage, but he keeps his gaze downwards, focusing on the hand jerking him off.");
	output("\n\nYou take a moment to enjoy the feeling of his soft kaithrit bristles against your palm, so different than a human’s dick. Regardless, you speed up the movement of your hand, up and down, up and down at a steady pace, watching Kase bite at his lip and make the cutest faces as he tries to quiet himself. His efforts are for naught, though; his voice breaks into quiet little moans at increasingly short intervals. Luckily for Kase, though, you’re in a dark enough, and empty enough corner of the bar that no one seems to notice.");
	output("\n\nHis back arches sporadically, his fists clenching in an attempt to quell the pleasure of your steady handjob. Then, you’re not sure what it is, but you feel compelled to kiss the cute femboy on his cheek, and you do so, pressing your lips to the soft flesh of his face and letting them linger there. ");
	output("\n\nIt seems that was all Kase needed to put him over his edge. He grunts and thrust his hips upwards against your palm, cock spasming in your grip. You smile as the kaithrit reaches his climax, and quickly move your hand upward to cup it around his engorging tip, letting him splatter your hand and fingers with his thick kitty-spooge and preventing most of the mess.");
	output("\n\nKase comes down from his orgasm with his chest heaving, slowly-softening dick leaking a couple drops of cum onto the thigh of his suit. He takes a few deep breaths in an attempt to compose himself.");
	if (pc.isNice() || pc.isCumSlut()) output("\n\nBefore he can, though, you use your free hand to cup Kase’s cheek and turn him towards you. He looks at you with what seems to be embarrassment, even a bit of shame, but you smile at him all the same and lift your spunk-covered hand to your lips and lick. Kase blushes hard and his eyes go wide as you lick up his load, letting his flavor roll around your tongue until you’ve gotten your fingers good and clean.");
	else output("\n\nBefore he can, though, you lift up your spunk-covered hand and present it to Kase. He looks at you and blushes hard, his mien riddled with embarrassment, and even a bit of shame, but all it takes is a nod from you for the kitty to start licking at your palm. He hesitatingly lets his tongue loll from his mouth and flicks it against your palm, and you’re almost surprised at what you feel: bristles! His tongue is nubby like his cock, tickling your skin as he slowly licks away at his own cum until your hand is good and clean.");
	output("\n\nOnce that’s all said and done, Kase goes to zip his suit back up before turning to you can giving you a very shaky <i>“Thank you, " + pc.mf("sir", "ma’am") + ".”</i>");
	output("\n\nYou smile and tell him he’s welcome, then slip out from his side of the table and back to yours, leaving the kitty boy with a red face, heaving chest, and hopefully a better-feeling arm.");
	
	flags["KASE_STRESS"] = 1;
	IncrementFlag("KASE_SEXED");
	pc.changeLust(33);
	processTime(15+rand(5));
	
	kaseMenu();
}

public function kaseJoinCrew():void
{
	clearOutput();
	author("HugsAlright");
	showKase();
	clearMenu();
	
	output("Looking at Kase’s situation, you wonder if you could buy his contract, leading you to tell him about the ship you own, and ask him if he’d be interested in joining your crew as a logistics officer. ");
	output("\n\nHis eyes widen at the suggestion. <i>“R-really?”</i> he exclaims in shock, right before his surprise turns to disappointment, <i>“I would love to get out of Pyrite and off this planet more than anything else, but that unfortunately doesn’t change the fact that I’m still under contract...”</i>");
	
	if (pc.credits >= 5000) addButton(0, "BuyContract", kaseBuyContract, undefined, "Buy Contract", "Offer to buy his contract. It’ll probably cost you about 5000 credits.");
	else addDisabledButton(0, "BuyContract", "Buy Contract", "You don’t have the 5000 credits needed for the buy out.");
	if (annoIsCrew()) addButton(1, "SteeleTech", kaseHireSteeleTech, undefined, "Steele Tech", "Ask him if he’s up for joining Steele Tech. Anno can probably help with all the paperwork and bureaucratic aspects.");
	else addDisabledButton(1, "SteeleTech", "Steele Tech", "You probably don’t have the authority to hire for your dad’s company on your own.");
	addButton(2, "Never Mind", kaseNevermind, undefined, "", "");
}

public function kaseBuyContract():void
{
	clearOutput();
	author("HugsAlright");
	showKase();
	clearMenu();
	
	output("You smile and pull out your Codex and get ready to fill out some paperwork and transfer some credits, telling him you’d be happy to buy his contract.");
	output("\n\n<i>“You’re... You’re being serious aren’t you?”</i> he asks, slitted pupils wide and fluffy green ears perking up.");
	output("\n\nGiving him a nod, you gesture towards his datapad, which has Kase scrambling for the small holographic.");
	output("\n\n<i>“Here,”</i> he says, turning the holopad on and looking down at it, <i>“I’ll forward you some forms you’ll need to fill out, and then we can get to the nitty-gritty with the credits.”</i>");
	output("\n\n<b>Some amount of paperwork later...</b>");
	output("\n\n<i>“And that’s everything,”</i> Kase says, finally putting down his datapad, <i>“That’s it then, isn’t it? I’m finally done with Pyrite... it’s honestly hard to believe after all these years.”</i> He closes his eyes and takes a deep breath, remaining silent for a moment before opening his eyes again and looking at you, <i>“Alright, I I’ll pack my things and head off to your ship straight away.”</i>");
	output("\n\nWith that, he stands from his seat and goes to make his way out of the bar. Before he does, though, he turns back to you, and raises his good arm to you in a salute, <i>“Captain...”</i> Then, he’s off again, back to your ship...");
	
	output("\n\n(<b>Kase has joined your crew!</b>)");
	
	pc.credits -= 5000;
	flags["KASE_CREW"] = 1;
	processTime(60+rand(45));
	
	addButton(0, "Next", mainGameMenu, undefined, "", "");
}

public function kaseHireSteeleTech():void
{
	clearOutput();
	author("HugsAlright");
	showKase();
	clearMenu();
	
	output("You lean forward and ask him if he’d like to work for Steele Tech on your ship. ");
	output("\n\n<i>“Steele Tech?”</i> he says, slitted pupils wide, looking almost bewildered, <i>“You could get me a job with Steele Tech? I mean their health policy alone makes them a better employer than Pyrite...”</i>");
	output("\n\nGrinning, you tell him you have quite the in with Steele Tech, and one of their employees on your ship.");
	output("\n\n<i>“You’re... You’re being serious aren’t you?”</i> he asks, fluffy green ears perking up.");
	output("\n\nYou tell him that if he’s interested he should head to your ship at the docks and talk to the white-haired ausar aboard your craft, Anno Dorna.");
	output("\n\nThe kaithrit hurriedly stands out of his seat, <i>“Yes, I’ll gather my things and head there right now! I thank you from the depths of my heart for this opportunity, " + pc.mf("sir", "ma’am") + ".”</i>");
	output("\n\nWith that, he goes to make his way out of the bar. Before he does, though, he turns back to you, and raises his good arm to you in a salute, <i>“Captain...”</i> Then, he’s off again, back to your ship...");
	
	output("\n\n(<b>Kase has joined your crew!</b>)");
	
	flags["KASE_CREW"] = 1;
	flags["KASE_STEELETECH"] = 1;
	processTime(10+rand(3));
	
	addButton(0, "Next", mainGameMenu, undefined, "", "");
}

public function kaseNevermind():void
{
	clearOutput();
	author("HugsAlright");
	showKase();
	clearMenu();
	
	output("You figure you probably shouldn’t go around buying employee contracts like this and " + (pc.isAss() ? "tell Kase you can’t hire him" : "apologize for getting his hopes up") + ".");
	output("\n\n<i>“That’s quite alright, " + pc.mf("sir", "ma’am") + ",”</i> he says with a warm smile.");
	
	processTime(2)
	
	addButton(0, "Next", kaseMenu, undefined, "", "");
}