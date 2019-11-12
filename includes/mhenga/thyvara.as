/* Thyvara Rosanvond by Fucky McFuck

Thyvara Rosanvond is a matisar hunter who was left behind after a hunt. She spends her nights (Between 18:00 and 3:00) at Burt’s Badass Meadhall where the player can interact with her.
There’s also a small chance she’ll be found at the abandoned camp around lunch time (11:30-14:00), where the player can also interact with her.
Character Profile
Tallness/Height:5’4”
Skin colours: Ebony
Vagina: Abdominally mounted, with internal muscular rings
Vaginal Cap: 35”
Breasts: B-cup
*/

/**
	 * ...
	 * @author DrunkZombie
	 */
/*

New Flags:
	THYVARA_MET  1 = met her
	THYVARA_STORY number of stories told
	THYVARA_DRINK_TALK 1 = had drink talk
	THYVARA_FAMILY_TALK 1 = had family talk
	THYVARA_WEAPONS_TALK 1 = had family talk
	THYVARA_SEEN_FINS 1 = has seen fins
	THYVARA_PROGRESS 1 = off hunting, 2 = returned, 3 had return scene, 4 accepted sleep over buddies, 5 accepted sleep over lovers
	THYVARA_PROGRESS_TIMER //used to record time she went hunting or when steele rejected sleeping with her
	THYVARA_SEX_FUCK 
	THYVARA_SEX_69 

*/

//show nude and/or preg bust
public function showThyvara(nude:Boolean = false,preg:Boolean = false):void
{
	var tits:Boolean = false;
	//passed in preg parameter is just to toggle the check to display or not
	if (preg)
	{
		//set false until preg content added
		preg = false;
	}
	
	if (flags["THYVARA_MET"] == 1) showName("\nTHYVARA");
	else showName("ARMORED\nWOMEN");
	showBust("THYVARA" + (preg ? "_PREG" : "") + (nude ? "_NUDE" : ""));
	author("Redknight910");
}
public function thyvaraInBurts():Boolean
{
	//she went hunting, has she returned?
	if (flags["THYVARA_PROGRESS"] == 1 && (hours < 3 || hours >= 18))
	{
		if (flags["THYVARA_PROGRESS_TIMER"] != undefined)
		{
			if (GetGameTimestamp() > (flags["THYVARA_PROGRESS_TIMER"] + (24 * 60)))
			{
				flags["THYVARA_PROGRESS"] = 2;
				flags["THYVARA_PROGRESS_TIMER"] = undefined;
				return true;
			}
			else return false;
		}
	}
	//check if she went home drunk and Steele didn't go with her
	if (flags["THYVARA_PROGRESS"] == 3 && (hours < 3 || hours >= 18))
	{
		if (flags["THYVARA_PROGRESS_TIMER"] != undefined)
		{
			if (GetGameTimestamp() > (flags["THYVARA_PROGRESS_TIMER"] + (10 * 60)))
			{
				flags["THYVARA_PROGRESS_TIMER"] = undefined;
				return true;
			}
			else return false;
		}
	}
	if (hours < 3 || hours >= 18) return true;
	
	return false;
}
public function thyvaraInCamp():Boolean
{
	//currently disabled, no content written for camp 
	return false;
	if (flags["THYVARA_PROGRESS"] == 1 || flags["THYVARA_PROGRESS"] == 2) return false;
	if (hours >= 11 && hours < 14 && rand(5) == 0) return true;
	
	return false;
}
//relationship level -1 unmet, 0 met, 1 buddies, 2 lovers
public function thyvaraRelationship():int
{
	if (flags["THYVARA_PROGRESS"] == 5) return 2;
	else if (flags["THYVARA_PROGRESS"] == 4) return 1;
	else if (flags["THYVARA_MET"] == 1) return 0;

	return -1;
}
//roughly 35"
public function thyvaraVaginalCapacity():int
{
	return 1000;
}
public function thyvaraBarBonus(btnSlot:int = 8):void
{
	var herName:String = "Armor Women";
	if (flags["THYVARA_MET"] == 1) herName = "Thyvara";
	if (flags["THYVARA_MET"] == 1) output("\n\nThyvara’s sitting at a booth, sharing a story with some other rushers. As she finishes up and spots you, she nods and raises her flask in your direction.");
	else output("\n\nYou spot a woman talking loudly among a small group of rushers. She’s covered in heavy looking armor with a rifle slung across her back.");

	addButton(btnSlot, herName, thyvaraGreet, undefined);	
}

public function thyvaraGreet():void
{	clearOutput();
	showThyvara(false, true);
	var firstTime:Boolean = true;
	if (flags["THYVARA_MET"] == 1) firstTime = false;
	
	flags["THYVARA_MET"] = 1;
	
	if (firstTime)
	{
		output("You approach the rushers as the woman’s getting to the end of her story. From what you catch it was about some hunting trip in the jungle.");
		output("\n\nThe dark green, spiky armor you can see covering most of her body is actually insectile chitin, and seems to frame her breasts and ass quite flatteringly, though both are covered by leather cups and straps that seem to make up her actual clothing. Her dark skin shows around the straps. She spots you approaching as the crowd disperses, her bright, blue eyes having an odd four-pointed star shaped pupil and dark brown sclera. Her cheeks are also covered in the same chitin as the rest of her body. She smiles at your approach, raising the metal flask in her hand as a greeting.");
		output("\n\n<i>“Just missed story time, I’m afraid. But I could still go for a bit of a chat. I guess introductions are needed, first.”</i> She reaches out with her empty hand, which you take in a firm handshake. Her chitin is surprisingly smooth.");
		output("\n\n<i>“Thyvara Rosanvond. Soon to be local hunting expert.”</i> You offer your name.");
		output("\n\n<i>“[pc.name], [pc.class]. Nice to meet you.”</i> She nods and takes a swig from her flask, the light catching her short, green hair and highlighting the odd streak of purple.");
		output("\n\n<i>“So, what brings you out on the rush Steele?”</i>");
		
		processTime(5);
		clearMenu();
		addButton(0, "Fortune", thyvaraReasonFortune, undefined, "Fortune", "Tell her about your father’s fortune, and the stipulations tied to it.");
		addButton(1, "Adventure", thyvaraReasonAdventure, undefined, "Adventure", "You're out to have some fun and live a little.");
		addButton(2, "Sex", thyvaraReasonSex, undefined, "Sex", "You’re after some exotic tails to chase before it all gets commonplace.");
	}
	else if (flags["THYVARA_PROGRESS"] == 2 || (flags["THYVARA_PROGRESS"] == 3 && rand(5) == 0))
	{
		if (flags["THYVARA_PROGRESS"] == 2) flags["THYVARA_PROGRESS"] = 3;
		output("As you approach Thyvara you can’t help but notice the large skull sitting next to her stool, almost large enough to be its own seat, if it weren’t jutting with a half-dozen horns. When you take a seat you notice she’s actually drinking from a glass.");
		output("\n\n<i>“[pc.name]! Look at what I got!”</i> She kicks the skull with a back toe <i>“Pretty scary, innit?”</i> You can’t help but notice the slight slur to her words.");
		if (pc.tolerance() > 40)
		{
			output("\n\n<i>“Hope you left some drinks for me.”</i> She beams, throwing an arm around you and laughing.");
			output("\n\n<i>“’Course I bloody saved one for you! Couldn’t celebrate without both of us having a drink!”</i> She downs the rest of her glass.");			
		}
		else
		{
			output("\n\n<i>“Uh... yeah. Are you... drunk?”</i> She grins wide and throws her empty arm around you.");
			output("\n\n<i>“You’re damn right I’m drunk!”</i> She lets go of you, finishing off her glass <i>“Figured I should celebrate after such a good kill. Got a nice credit stash for the hide too...”</i> she sways for a moment before righting herself.");
		}
		output("\n\n<i>“Ey, Burt! Another round for me and my friend here!”</i> Burt wanders over and pours two more drinks, and hands them to you.");
		output("\n\n<i>“That’s your last one, Thyv.”</i> The matisar nods dismissively, drinking down half the glass before slamming it into the table.");
		output("\n\n<i>“I... wanted to say something to you... what was it....”</i> She thinks for a moment before snapping her fingers. <i>“That was it! Wanted to thank you for asking about my party! Felt good to get all that off of my chest.”</i> She leans in and plants a kiss on your cheek <i>“Really meant a lot to me.</i>“ She leans heavily on you, leaning in close.");
		output("\n\n<i>“Strong hunter like me needs a " + pc.mf("boy","girl") + " who can handle her, right?”</i> You look at her to respond and find your lips trapped by hers. As you try to pull away she grabs the back of your head in a strong grip. She holds you like that for several seconds before letting go, loudly laughing at her forced kiss.");
		output("\n\n<i>“Don’t suppose you’d walk a girl home, Cap? It’s awful dangerous out there for someone in my state. I could get taken advantage of!”</i> She puts on the most convincing fearful face her inebriated mind can, before bursting into laughter again.");
		
		processTime(15);
		clearMenu();
		addButton(0, "Yes", thyvaraProgressWalkHomeYes, undefined, "Yes", "Walk her home.");
		addButton(1, "No", thyvaraProgressWalkHomeNo, undefined, "No", "Tell her you can't.");
	}
	else
	{
		output("<i>“Captain Steele!”</i> Thyvara calls at your approach, <i>“always good to see another </i>competent<i> adventurer out here.”</i> She motions to the spot beside her, and you take a seat.");
		output("\n\n<i>“So, to what do I owe the pleasure of your company? Come to tell me " + (flags["THYVARA_STORY"] != undefined ? "another" : "a") + " story?”</i>");
		
		processTime(2);		
		thyvaraMainMenu();
	}	
}

public function thyvaraReasonFortune():void
{	clearOutput();
	showThyvara(false, true);
	
	output("You go into the details of your search for your father’s probes, which hold the fortune that belongs to you. She smiles at the small tale, and chuckles when you mention your cousin.");
	output("\n\n<i>“Wow. I know a lot of people come out here to strike it rich, but I don’t think many have that kind of guarantee for it. Not surprised someone who caught wind of it’d be hunting it down too.”</i> She smiles at the suspicious look you give her.");
	output("\n\n<i>“Don’t worry, I’m not about to go chasin’ your treasure. Old hunting party would kill me for thinkin’ o’ ripping off a nice [pc.guyGirl] like you off anyway.”</i> She looks deep into her flask for a moment before perking up again.");
	
	processTime(5);
	clearMenu();
	addButton(0, "Next", thyvaraReasonAfter, undefined);
}

public function thyvaraReasonAdventure():void
{	clearOutput();
	showThyvara(false, true);
	
	output("Explaining why you’re out in the frontier, you tell her about your father’s fortune, but the real reason you’re out here is to live out an adventure among the stars. She nods along happily with your explanation, then gives you a bright smile.");
	output("\n\n<i>“That sounds a lot like me. Out here on the wild frontier, no big megacities, no spacers cramming every nook of a planet, and miles of fresh, untapped wilderness to run wild in. Some of the critters don’t even taste half bad.”</i> She puts a hand on a horned skull sitting next to her. <i>“Wouldn’t recommend one of these though, bastards have hide thicker than bark and they taste like old boots when you cook ‘em up.”</i> She looks pensive for a moment.");
	output("\n\n<i>“Maybe I should send some off to the matriarch and see if she likes it....”</i> She mutters quietly, then looks back at you.");
	
	processTime(5);
	clearMenu();
	addButton(0, "Next", thyvaraReasonAfter, undefined);
}

public function thyvaraReasonSex():void
{	clearOutput();
	showThyvara(false, true);
	
	if (pc.isBimbo() || pc.isBro())
	{
		output("You let her know that you’re after some exotic species, since you’ve already checked out all the known species through the extranet. She raises an eyebrow, before muttering quietly to herself.");
		output("\n\n<i>“Well, you gotta be careful out here. Sexy aliens aside, there are some nasty critters out there in the frontier too. " + (pc.tallness > 63 ? "You" : "A little thing like you") + " could get yourself in serious trouble out there, most beasties are after more than a good lay.”</i>");
		if (pc.isBimbo()) output("\n\n<i>“Surely nothing would want to hurt a cute little thing like me out there? What could resist this face?”</i> You make the best puppy dog expression possible.");
		else output("\n\n<i>“Anything tries to take a bite out of me, and it’s getting a faceful of </i>pain<i>.”</i>");
		output("\n\nThyvara just sighs and chuckles, giving you an easy smile.");
	}
	else
	{
		output("You explain that you’re after a few good lays from some of the <i>exotic</i> life out in the rush before they become too everyday. Nothing quite like ");
		if (pc.hasCock()) output("sticking your dick in");
		else if (pc.hasVagina()) output("getting eaten out by");
		else output("getting some pleasure from");
		output(" a new, unknown alien species. Thyvara gives you long, examining look, before shrugging.");
		output("\n\n<i>“Well, I can’t say I haven’t had a round in the jungle with one of the locals before. Word of caution? Look out for those tree girls - Vanae I think it was - they like to milk people dry,”</i> she gives a shy smile, and her plated cheeks seem to blush around the chitin, <i>“may or may not have had one show interest. And let me tell ya, when you’ve got an abdomen with nothing but a reproductive system in it, they like to get in </i>deep<i>.”</i> You look behind her, not noticing an abdomen until her back wiggles slightly.");
		output("\n\n<i>“What’s the matter, never seen a girl who could keep it up before?”</i> She slyly smiles before taking another swig of her flask, letting her gaze linger on the metallic container.");
		output("\n\n<i>“Some of my old hunting partners used to hunt the local sapiens as much as the local critters, truth be told, if you catch my drift.”</i> She looks back up at you, winks, and smiles.");
	}
	processTime(5);
	clearMenu();
	addButton(0, "Next", thyvaraReasonAfter, undefined);
}

public function thyvaraReasonAfter():void
{	clearOutput();
	showThyvara(false, true);
	
	output("<i>“So,”</i> you start <i>“how long have you been around here?”</i> Thyvara sighs and leans back on her stool.");
	output("\n\n<i>“Too long for a young Matisar like me. But I don’t have the funds to get offworld, was hoping to trade for a way off, but with the way most rushers barter I’d be lucky to get thrown on a ship as cargo.”</i> She takes another swig of her flask, only to find the container empty. She shrugs, grabbing an identical container from a bag sitting by her stool.");
	if(!CodexManager.entryUnlocked("Matisar")) 
	{
		output("\n\nYour codex beeps telling you an entry on the Matisar has been compiled for your inspection. You tuck your codex away and focus back on the woman sitting next to you.");
		CodexManager.unlockEntry("Matisar");
	}
	output("\n\n<i>“Hey, Cap. Steele, mind if a little bug-brain like me asks another question?”</i> You shrug and nod, not seeing the harm in it.");
	output("\n\n<i>“I... may have been kicked out of my old hunting party, and Matisar aren’t great at dealing with this whole ‘loneliness’ thing.”</i> She makes dramatic air quotes, <i>“So, if you’ll come see me every now and again, maybe swap a story or two, I’d really appreciate it.”</i>");
	output("\n\nSomeone calls from another part of the bar.");
	output("\n\n“<i>What, aren’t we good enough company?”</i> Thyvara chuckles and turns.");
	output("\n\n<i>“You’re great company, but you can’t hunt for shit! Only other decent hunter I’ve seen around here is Tanis.”</i> She turns back to you, smile back on her face. <i>“So, Steele, got anything good to share?”</i>");
	
	processTime(5);
	thyvaraMainMenu();
}
public function thyvaraMainMenu(quip:Boolean=false):void
{
	if (quip)
	{
		clearOutput();
		showThyvara(false, true);
		output("<i>“That’s all for now.”</i> Thyvara shrugs, giving you a quick smile.");
		output("\n\n<i>“So, anything else you wanted?”</i>");		
	}
	clearMenu();
	addButton(0, "Appearance", thyvaraAppearance, undefined, "Appearance", "Check out the well armoured woman.");
	addButton(1, "Talk", thyvaraTalk, undefined, "Talk", "Chat for a while with the young matisar.");
	addButton(2, "ShareStories", thyvaraShareStories, undefined, "Share Stories", "Swap stories with Thyvara.");
	if (flags["THYVARA_DRINK_TALK"] == 1) addButton(3, "Drink", thyvaraTalkDrinkYes, true, "Drink", "Have a sip of her cummy drink.");
	else addDisabledButton(3, "Drink", "Drink", "Maybe ask her about what’s in it before having a go yourself.");
	if (flags["THYVARA_PROGRESS"] >= 4) addButton(4, "Sex", thyvaraSex, undefined, "Sex", "Get intimate with Thyvara’s feminine parts.");
	else addDisabledButton(4, "Sex", "Sex", "You don't know her well enough.");
	addButton(14, "Leave", mainGameMenu);
}
public function thyvaraAppearance():void
{
	clearOutput();
	showThyvara(false, true);
	
	output("Tyvara is roughly 165 cm, or 5’4” in old imperial, tall, with a solid, stocky build. Her apparent durability is enhanced by the smooth, dark green chitin plates covering most of her body, only parting around her groin, chest and face. Her skin is an ebony colour, and what little there is seems to be quite muscular. Her face holds a pair of eyes with dark brown sclera, bright blue iris’ and four-pointed star shaped pupils. Her hair is cut into a short mullet that doesn’t quite reach her shoulders.");
	output("\n\nThe chitin covering her forearms and lower legs is covered in small spikes. The back of her hands is covered in chitin, the palm and fingers are free of it, showing dark skin, while her fingers end in a set of sharp looking claws. Her feet have one backwards facing and three forward facing toes, which she usually walks on using the padded tips.");
	output("\n\nHer abdomen reaches twelve inches long, resting between a pair of ridges on her back." + (flags["THYVARA_SEEN_FINS"] == 1 ? " These fold out into large fan-like structures made of a white membrane. The left one has small tears in it." : "") + (flags["THYVARA_SEX"] != undefined ? " The entrance to her vagina is located at the end of her abdomen. The interior houses three wombs, two of which are located along the bottom of her channel." : ""));
	output("\n\nShe’s wearing a mix of leather straps and patches, which serve to cover most of her skin, but leave her chitin as open as possible. She has an old-looking bolt-action rifle leaning against the wall, and a small axe slotted into a strap around her waist.");
	output("\n\nAs you finish your assessment of her body you notice her gaze is equally focused on you. With a quick smile she asks <i>“See something you like, captain?”</i>");
	
	processTime(2);
}
public function thyvaraTalk():void
{
	clearOutput();
	showThyvara(false, true);
	
	output("<i>“I just want to chat,”</i> You tell her. She takes a sip from her flask, nodding.");
	output("\n\n<i>“<i>Well got anything particular you want to chat about?”</i>");
	
	processTime(1);
	thyvaraTalkMenu();

}
public function thyvaraTalkMenu():void
{
	clearMenu();
	addButton(0, "Her", thyvaraTalkHer, undefined, "Her", "Get to know a bit about the young hunter.");
	addButton(1, "Weapons", thyvaraTalkWeapons, undefined, "Weapons", "Ask about her antique-looking weapons.");
	if (flags["THYVARA_PROGRESS"] == undefined) addButton(2, "Family", thyvaraTalkFamily, undefined, "Family", "Ask her about her family.");
	else addDisabledButton(2, "Family","Family","You have learned everything about her family.");
	addButton(3, "Drink", thyvaraTalkDrink, undefined, "Drink", "What’s in the flask that she keeps drinking down?");
	addButton(14, "Back", thyvaraMainMenu, true, "Back", "That’s all for now.");
}
public function thyvaraTalkHer():void
{
	clearOutput();
	showThyvara(false, true);
	
	output("<i>“I want to know a bit more about you.”</i> She raises an eyebrow, before putting her flask onto the bar.");
	output("\n\n<i>“That’s a little vague, [pc.name]. Got anything more particular?”</i> She leans back slightly as you think.");
	output("\n\n<i>“How old are you?”</i> She smiles and shrugs, taking a swig from her drink.");
	output("\n\n<i>“Almost sixteen standard terran. Matisar are mature by twelve. Still find it funny that everyone operates on terran time.”</i> She looks you up and down, <i>“You don’t exactly look too world weary yourself, [pc.name].”</i> You thank her for the compliment, giving her your own age.");
	output("\n\n<i>“So... what are you into?”</i> You ask, earning a wide grin.");
	output("\n\n<i>“Oh, you’re going to regret that.”</i> She chuckles, clearing her throat and taking a deep breath.");
	output("\n\n<i>“So, first and foremost, I like hunting. As a matisar, it’s kinda in my blood. I’m a traditionalist. Not as much as Tanis, but enough that I don’t care for all the flash of lasers and the cheap pop of an assault. Hunting is an art, and I’ll be damned if I don’t do my best work out there.”</i> She takes a sip of her drink before continuing.");
	output("\n\n<i>“When I get out there, just me, my gear and my speeder, I just zone out, or in? Bah, whatever. I just hit my stride, out there in the jungle, and it feels like I can do anything.”</i>");
	output("\n\n<i>“On top of that, I like to cook, whenever I get something new, my first impulse is a little taste test.”</i> she chuckles nervously to herself <i>“Gotten myself in more than one spot of trouble doing that too. Word of advice? Don’t eat any yellow, horned beetles you find. Bastards send you on one hell of a trip.”</i> That sounds... helpful. And more than a little reckless. Bringing the subject up you ask.");
	output("\n\n<i>“Isn’t that a bit dangerous?”</i> She smiles and nods.");
	output("\n\n<i>“Incredibly, which is why I’ve started getting local opinions about things before I try them. I’ve gotten in with a couple zil and a naleen or two who let me know when whatever I’ve caught’s gonna leave me in a bad way.”</i>");
	output("\n\n<i>“Sounds helpful.”</i>");
	output("\n\n<i>“It is, like my matriarch always said, ‘nothing better than a local to tell you what’s safe.’”</i> She looks into her flask for a moment, before sighing.");
	output("\n\n<i>“Other than that, I just like stories. Telling them, hearing them, anything. I prefer the ones that involve fighting, especially when there’s a twist in the works. Nothing quite like waiting for the finish and then BAM!”</i> she punches one hand into the other <i>“Everything I was waiting for gets thrown out the window.”</i> She sighs happily, taking a long draught of her flask wiping some of the creamy drink from her lips. She looks back at you with a smile.");
	output("\n\n<i>“<i>So, got any good tales for me?</i>”</i>");
	
	processTime(4 + rand(2));
}
public function thyvaraTalkWeapons():void
{
	clearOutput();
	showThyvara(false, true);
	
	output("Thinking of how to bring it up, you decide to just ask her <i>“Why such old gear?”</i> Thyvara looks at you, before smiling and putting a hand on the axe at her waist.");
	output("\n\n<i>“It’s not old. It’s classical.”</i> She says <i>“And it’s... something I can get a bit lost on. If you don’t mind me talking your ear off?”</i> You shake your head.");
	output("\n\n<i>“I’ve got time.”</i> She smiles and takes a drink from her flask, before grabbing another from her pack.");
	output("\n\n<i>“Well, guess I’ll start with where I got them from. Matisar tradition was kind of important in my party, so we only got weapons from other Matisar colonies. I got the axe for my fifth birthday, rifle for my eighth. Honestly, I could’ve gotten a fancy laser or a semi-auto, but I’m a sucker for the classics. Guess the usual term’s ‘old fashioned’?”</i> She caresses the barrel of her rifle fondly.");
	output("\n\n<i>“Then, when I started actually using these babies out in the field? There’s nothing like the kick of a solid matisar rifle in your hands. That crack as it sends a hardened round through some giant spider monster’s chitin? Mmm...”</i> she shudders at a fond memory <i>“it’s probably a bad thing to get excited about, but that’s just me. These weapons have served me for as long as I can remember, they’re a part of me, and I’d never dump them for anything.”</i> She pulls her gun up and starts tapping each part, listing them off as she goes.");
	output("\n\n<i>“Ironoak stock, lacquered with Meronian wax for waterproofing and extra durability. Refined meteoric steel chamber and barrel for that little celestial touch. And advanced alloy internals which don’t wear for decades, centuries if cared for right. I know where every part sits, high tension points that need more maintenance, and even the optimal temperature for firing.”</i> She puts the rifle down and pulls the axe from her belt.");
	output("\n\n<i>“I know every dent, chip and fault in my axe’s head, and can find the balance point blindfolded. I know exactly where to hold it to get the pressure where I need it and I can get the edge under any armor I’ve found.”</i> She looks at you with a wide smile on her face at her own knowledge.");
	output("\n\n<i>“That’s... impressive.”</i> Is all you can come with. She blushes a little before putting the axe away.");
	output("\n\n<i>“Sorry. Like I said, I tend to get a little lost talking about them. It’s just... I know every part of my weapons, how it fits, what it does, even how to make a replacement. You just, you can’t get that with modern weapons. You can learn what parts do what, how to change them, even how to get aftermarket stuff on, but how many can actually make a circuit board for a high-powered laser rifle? Or put together a railgun’s charging coils?”</i> She gets a distant look with a fond smile.");
	output("\n\n<i>“It might be old-fashioned, but I don’t just want to know why what I’m using works, I want to know how each part talks to every other part. I want to know, if something goes wrong, why it happened, how I can stop it happening again, and what parts are responsible. " + (flags["THYVARA_WEAPONS_TALK"] == undefined ? "You know?" : ""));
	
	processTime(4 + rand(2));
	clearMenu();
	addButton(0, "Yeah", thyvaraTalkWeaponsYeah, undefined, "Yeah", "You can get behind the idea of knowing what the things you use actually are made of.");
	addButton(1, "Nah", thyvaraTalkWeaponsNah, undefined, "Nah", "If it works, why need to know every inch of it?");
}
public function thyvaraTalkWeaponsYeah():void
{
	clearOutput();
	showThyvara(false, true);
	
	output("<i>“Yeah, I get you.”</i> You tell her with a smile. Her grin widens until you swear it’ll reach her cheek plates.");
	output("\n\n<i>“Thanks for understanding, most people are just happy to use something so long as it works, and take it to a mechanic when it doesn’t. I was taught to be responsible for my own equipment, so that’s what I’m doing.”</i>");
	output("\n\n<i>“So, anything else you want to know?”</i>");
	
	processTime(1);
	thyvaraTalkMenu();
}
public function thyvaraTalkWeaponsNah():void
{
	clearOutput();
	showThyvara(false, true);
	
	output("<i>“Not really. If it works, it works right? Can always get it fixed or get a new one.”</i> Her smile dwindles and she sighs.");
	output("\n\n<i>“Well, like I said, it’s an old-fashioned view. But, these are a part of me, and I’d rather be a lost wanderer than get them replaced.”</i>");
	output("\n\n<i>“So, anything else you want to know?”</i>");
	
	processTime(1);
	thyvaraTalkMenu();
}
public function thyvaraTalkFamily():void
{
	clearOutput();
	showThyvara(false, true);
	
	if (flags["THYVARA_FAMILY_TALK"] != undefined && flags["THYVARA_STORY"] != undefined)
	{
		output("She sighs heavily as you try to broach the subject again.");
		output("\n\n<i>“Alright, alright. So... maybe I didn’t give you the whole story.”</i> She takes a long drink before putting the cap on her canister and gently placing it in her bag.");
		output("\n\n<i>“So, this is going to be a bit of a story. And these,”</i> she gestures to her fans, <i>“still have a part in the situation.”</i>");
		output("\n\n<i>“Alright, let’s start with the beginning. We were out in the wilderness of a primal world. You know the type, lots of really mean nasties, no known sentients. We were hoping to get a good story and some solid trophies. Truth was we weren’t ready to find </i>them<i>.”</i>");
		output("\n\n<i>“We touched down and managed some good kills in the first few days. But then we got lax, thought we were good enough to handle whatever the planet threw at us. That was when we found them, or, I guess they found us....”</i> She goes silent for a few minutes, and you could swear you see tears growing in her eyes.");
		output("\n\n<i>“I’m still not sure what they were. Some kind of ambush predator. They weren’t that tough, but there was a dozen of them, and they moved like lightning.”</i> She pulls out her tablet and brings up a picture.");
		output("\n\nThe image shows a creature the size of a large dog, with black chitin, ten spindly legs and a pair of long, sharp fangs like a spider. All this is topped off by a set of eight eyes, all placed across the body. It looks like a nightmare come to life.”</i>");
		output("\n\n<i>“Those things are smart. If they had arms I wouldn’t be surprised if they developed weapons and got inducted into galactic civilisation. As it is, they’re just smart ambush predators. We killed a few of them during the day and they scattered. We thought they scattered out of fear, but the bloody things were waiting for us to lower our guard.”</i>");
		output("\n\n<i>“We got back to our ship and started carving up our kills. They snuck in through the flush vents, broke out into one of the common rooms. They killed Nasia before we even knew what was happening. I’ll save you the gory details on what those things did to us.”</i> Her fans flutter, and you find your eyes drawn to the somewhat tattered one.");
		output("\n\n<i>“We landed with twelve good, strong matisar. We left with eight. It might not sound that bad, only losing four people in an ambush. But they were our party, our <b>kin</b>, and one of them was preparing to split off and start their own party. Their own family, as most would say.”</i> Her eyes go distant for a few moments.");
		output("\n\n<i>“Everyone was sad, and angry, and looking for a reason why it happened. Guess who got to be the lucky outlet?”</i> she sighs heavily before lifting her head to stare at the roof <i>“Worst part of it was, I believed it. I thought it was my fault, that somehow I hadn’t been observant enough, even when everyone else didn’t notice, either.”</i>");
		output("\n\n<i>“It was a few weeks before we landed on Mhen’ga, and everyone had apologised to me at least once. Hell, Taror even </i>hugged<i> me. But I still thought I needed to become a better hunter. So, I jumped ship when we were heading offworld. I lied, by the way, about not being in contact with them? They’re hunting off on a spinaran colony world. I can’t go back to them, not now. I need to prove to </i>myself<i> that I can support myself just fine.”</i> She takes a few minutes, before sighing and standing up.");
		output("\n\n<i>“Guess I’d better get back to that whole thing. See ya soon, [pc.name]. Probably.”</i> With that she grabs her bag and rifle and steps out the door.");

		flags["THYVARA_PROGRESS"] = 1;
		flags["THYVARA_PROGRESS_TIMER"] = GetGameTimestamp();
		processTime(8 + rand(5));
		clearMenu();
		addButton(0, "Next", mainGameMenu);
	}
	else
	{
		output("You broach the topic of her family, and she immediately loses some of her energy.");
		output("\n\n<i>“You... you want to know about my party?”</i> She mutters.");
		output("\n\n<i>“I want to know about your family. What were they like?”</i> She sighs and looks up at you.");
		output("\n\n<i>“Sorry, a matisar’s family is called a party. Mine, specifically, was the Daehintors Hunting Party. We’re pretty traditionalist, not as closed minded as some, but we liked to keep to the old ways of things.”</i>");
		output("\n\n<i>“It wasn’t bad, growing up. I had four sisters and two brothers, and we never really had any trouble providing for ourselves, and I had fun playing with my siblings.”</i> She takes a slow drink of her canister, popping the cap back on and grabbing another from her pack.");
		output("\n\n<i>“So, where are they now?”</i> She shrugs, sighing heavily.");
		output("\n\n<i>“Don’t know. Haven’t spoken to them in... three, four months now?”</i> She just looks at her latest metal flask <i>“Most matisar... tend to keep away from the likes of me.”</i> You raise an eyebrow.");
		output("\n\n<i>“Why?”</i> She looks at you, then smiles. She shifts herself a little, before two ridges on her back start to expand, lifting from around her shoulders and bending into a slight curve. As they extend they reveal two bleach white membranes, you notice the left one’s slightly tattered.");
		output("\n\n<i>“We see our fans as a window into the Wanderer, kind of the matisar equivalent to a soul, and as you can see, mine are blank.”</i>");
		output("\n\n<i>“And that’s... bad?”</i> Her lip curls up slightly, baring teeth in a very unfriendly expression.");
		output("\n\n<i>“Bad? BAD?!”</i> Her entire body shudders <i>“It means I’m nothing. No one! I spent my life trying to be something to my family. To prove I’m not just a waste of time but...”</i> she starts taking deep shuddering breaths, her shaking calming slightly.");
		output("\n\n<i>“I told you my family were traditionalists, and they can be open minded, but as far as they were concerned I’m a blank. There’s no Wanderer in me.”</i> Not sure what to do you pat her on the shoulder, and the act seems to pay off, as she wraps a hand around you in return.");
		output("\n\n<i>“Thanks. It... thanks.”</i> You sit like that for a while, before she recomposes herself.");
		output("\n\n<i>“I’m going to prove them wrong. I </i>have<i> to prove I have what it takes. I’ll hunt the biggest damned monsters out there until everyone realises I’m </i>not<i> a waste. That I </i>can<i> hunt as well as the rest of them.”</i> She goes silent for a few moments, eyeing her drink with a sombre look.");
		output("\n\n<i>“Think we could drop this for now? Remembering hurts a little.”</i> Seems like she’s not telling you something, but asking about it doesn’t get any more answers.");
		
		flags["THYVARA_SEEN_FINS"] = 1;
		flags["THYVARA_FAMILY_TALK"] = 1;	
		processTime(8 + rand(5));
	}	
}
public function thyvaraTalkDrink():void
{
	clearOutput();
	showThyvara(false, true);
	
	output("<i>“What’s in those flasks? And how much of that stuff do you have?”</i> She gives you a quick look, before handing you her canister.");
	output("\n\n<i>“Want to try some?”</i>");
	output("\n\n<i>“I’d rather know what it is, first.”</i> She shrugs, takes a swig and puts the lid on it.");
	output("\n\n<i>“It’s a kind of staple for matisar. Has a lot of fatty oils in it that we need, and it’s chock full of other nutrients we can use. I’ve got enough of this stuff to last me a year or two. Get it whenever other matisar come through.”</i> She kick’s the bag at her feet.");
	output("\n\n<i>“So, what’s in it?”</i> She looks at you uncomfortably for a moment before answering.");
	output("\n\n<i>“Well, the primary ingredient is, uh... matisar semen.”</i> When she catches your look she quickly explains, <i>“matisar males store most of their fat reserves in their abdomen, where they also keep the... uh, testicles. So, it kind of just gets mixed in and, well...”</i> she holds up her flask <i>“makes it a good base for staple foods. A well fed male matisar can produce a </i>lot<i> of semen, so we just make use of it when people start jacking off.”</i>");
	if (pc.isBimbo()) output("\n\n<i>“That sounds really yummy. Ever used it to get pregnant?”</i>");
	else output("\n\n<i>“Has anyone ever gotten pregnant from it?”</i>");
	output(" Thyvara blushes and looks away for a moment.");
	output("\n\n<i>“Um, well it’s treated before it gets used in consumables, usually. It gets sterilised and put through a few refining processes to make sure it’s completely safe. Of course not everyone makes it to the same standard, and there are plenty of us who just bottle it raw. The stuff in these bottles though, it’s been treated and we even add some anti-coagulants to make it go down easier.”</i> She gives you an awkward smile <i>“If you want some, just ask. There’s more than enough.”</i>");
	
	flags["THYVARA_DRINK_TALK"] = 1;	
	processTime(4 + rand(2));
	clearMenu();
	addButton(0, "Drink", thyvaraTalkDrinkYes, undefined, "Drink", "It’s probably not <i>that</i> bad, right? WARNING: Will activate kui-tan biology.");
	addButton(1, "Don't", thyvaraTalkDrinkNo, undefined, "Don't", "You’re not about to drink cum out of a bottle.");
}
public function thyvaraTalkDrinkYes(fromMain:Boolean=false):void
{
	clearOutput();
	showThyvara(false, true);
	
	if (pc.isBimbo())
	{
		output("You eagerly take the bottle, guzzling down several mouthfuls before pulling it from your lips. It’s oddly thin for semen, like it was drawn from the last reserves of a well milked cock, and the taste is oddly fruity, leaving a lingering sweetness with an oily texture in your mouth.");
		output("\n\nYou thoroughly enjoy the drink, feeling the wetness spreading between your thighs.");
		if(pc.canCumCascade()) output("\n\nThat’s not the only thing spreading, as you feel the glorious sensation of your [pc.balls] growing larger. Thyvara looks on in shock as your less than feminine equipment begins to bulge outward, the [pc.cocks] attached to them rise with the sensation.");
		output("\n\n<i>“Can I, like, have some more of that?”</i> You ask, the feeling leaving you giddy.");
		output("\n\n<i>“I guess. But not too much, okay? Wouldn’t want to overload you.”</i>");
	}
	else
	{
		output("You take the offered bottle, taking a quick swig. The taste’s not like you’d expect, while it does leave an oily feeling in your mouth, it has a faint taste of fruit, and leaves a sweet aftertaste. Expressing your surprise at the drink Thyvara smiles.");
		if (pc.canCumCascade())
		{
			output("\n\nThat’s when your [pc.balls] begin to react and churn out large amounts of your own semen in response. When Thyvara notices her smile is replaced by a look of shock.");
			output("\n\n<i>“Oh, crap! " + (pc.race() == "kui-tan" ||  pc.race() == "half kui-tan" ? "I forgot about how your kind reacts to semen." : "You’re a kui-tan?!") + " I’m so sorry.”</i> You brush it off. You knew what you were getting into when you accepted the drink. Giving her a smile calms her down. Your balls eventually stop swelling.");
			output("\n\n<i>“Pretty potent, huh?”</i> You ask with a smile.");
		}
		output("\n\n<i>“Yeah, my party has a recipe that makes it a lot sweeter while not adding too much sugar to it. We even had a garden for the additives on our ship.”</i> She downs a swig herself.");
		output("\n\n<i>“If you ever want some more, just ask, ‘kay?”</i>");
	}
	thyvaraHaveADrink(200);
	processTime(4 + rand(2));
	if (fromMain) thyvaraMainMenu();
	else thyvaraTalkMenu();
}
public function thyvaraTalkDrinkNo():void
{
	clearOutput();
	showThyvara(false, true);
	
	output("<i>“I think I’ll pass.”</i> She shrugs and takes a long swig of the drink.");
	output("\n\n<i>“Fair enough, not everyone’s taste, I suppose. If you ever change your mind, there’s plenty here.”</i>");
	
	processTime(1);
	thyvaraTalkMenu();
}
public function thyvaraProgressWalkHomeYes():void
{
	clearOutput();
	showThyvara(false, true);
	
	moveTo("MHENGA_APARTMENT");
	
	output("<i>“Alright. Where do you live?”</i> She brightens at your acceptance.");
	output("\n\n<i>“Not far. You’ll be surprised to know I’ve got a house in town.”</i> She seems very proud of this, polishing her knuckles against her chest. As she stands she stumbles into you, forcing you to catch her or be bowled over.");
	output("\n\nAs she straightens out she gives a quick <i>“thanks”</i> before hanging an arm across your shoulder and leading the two of you out into the street. The blissfully short walk is full of Thyvara’s drunken chatter.");
	output("\n\n<i>“You know, I never had many friends growing up.”</i> she mumbles, leaning that little bit more on you <i>“I mean, my family was nice enough but they were family. Spent half the time fighting with them,”</i> her shoulders twitch and you feel one of her fans brush you, <i>“but, here I am, getting a " + pc.mf("handsome","cute") + " [pc.manWoman] to help me home. Heh, I feel like they’d be happy, knowing I’m still giving my all to make them proud.”</i> She looks up at the sky with a smile.");
	output("\n\n<i>“Most matisar are nomadic did ya you know that? Hell, way I hear it the moment our kind could get a ship to take them we were offworld and fighting in the very same rush we got found in.”</i> She laughs, before pointing towards one of the many prefab buildings.");
	output("\n\n<i>“This here’s my place. Care to come in?”</i> You open the door and help the woman into her house. The main room’s very well furnished. While the only actual furniture is a couch and a table, there’s an assortment of horns and tusks across the table and hanging from a wall, framed by colourful pelts hung up alongside them. There’s a small pile of books, a data-slate and a framed photo of what appears to be Thyvara’s family, standing in front of a large beast.");
	output("\n\n<i>“Home...”</i> she mutters, looking across the trophies she’s gathered. She pulls away from you and wanders to the couch, flopping into it with a satisfied sigh. She pats the cushion next to her for you to sit down.");
	output("\n\n<i>“So, this is my home. Every bone, every pelt, every wall. Mine... just mine....”</i> She seems to deflate a little, before completely slumping down with an exhausted huff.");
	output("\n\n<i>“I told you matisar didn’t do well alone, yeah?”</i> she looks at you and you nod <i>“Well, we’re kinda </i>never<i> meant to be alone. We’re born into our party, and we leave when we find a partner to start our own.”</i> She leans back and stares at the roof <i>“I know I’m just another rusher with nowhere to be, running around without a thought for tomorrow, but... would you mind staying the night?”</i> She turns to you, her expression begging you to say yes.");
		
	processTime(15 + rand(10));
	clearMenu();
	addButton(0, "Yes", thyvaraProgressStayYes, undefined, "Yes", "Of course you’ll stay the night with the lonely hunter.");
	addButton(1, "No", thyvaraProgressStayNo, undefined, "No", "You can’t stay the night.");
}
public function thyvaraProgressWalkHomeNo():void
{
	clearOutput();
	showThyvara(false, true);
	
	if (pc.isNice())
	{
		output("With a soft smile you rest a hand on her shoulder. <i>“I’d love to stay and keep you company, but I have to be somewhere. Maybe next time?”</i> She tries to return your smile, and nods slowly.");
		output("\n\n<i>“Alright. Yeah, sure, next time...”</i> She leans over and gives you a peck on the cheek.");
	}
	else if (pc.isMischievous())
	{
		output("<i>“Sorry, Thyv, but I can’t babysit you tonight. Gotta go make those stories you love so much, right?”</i> You give her a smile, and she tries to give you one back.");
		output("\n\n<i>“Right. Right, yeah.”</i>");
	}
	else
	{
		output("<i>“I don’t have time to look after you. I’ve got more important work to do.”</i> You say, getting up. The young woman stares for a moment, before dropping her head.");
		output("\n\n<i>“Right. Sorry, I just... yeah, sorry.”</i> She gets up and makes her way out.");
	}
	
	flags["THYVARA_PROGRESS_TIMER"] = GetGameTimestamp();
	processTime(2);
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}
public function thyvaraProgressStayYes():void
{
	clearOutput();
	showThyvara(true, true);
	
	output("You nod, and she breaks out into one of those wide grins. <i>“Thank you!”</i> She squeals, throwing herself at you. Between her weight and inebriated sense of strength she manages to pin you against the couch, snuggling into you. When you get her attention it’s as she’s crushing the breath from your lungs with her hug.");
	output("\n\n<i>“Oh, sorry. Come on, I’ll show you to my room.”</i> She pulls the both of you off of the couch and towards a door on the far wall. The bedroom is quite sparse compared to the main, furnished only with a bed, which is covered in several fur blankets.");
	output("\n\nLetting go she flops onto her front on the furs. She wriggles slightly before sighing and undoing a strap on her back. As the buckle comes undone a foot-long abdomen falls to rest between her legs, the end covered by a separate leather cover.");
	output("\n\n<i>“Ahhh, that feels good....”</i> She sighs, rolling over to look at you, happy smile on her face.");
	output("\n\n<i>“So, [pc.name], you coming or what? " + (pc.hasArmor() ? "Take that [pc.armor] off and get in here." : "Hop in already.") + "”</i> She’s surprisingly energetic right now, wriggling herself further and further into the fur blankets. " + (!pc.hasArmor() ? "You climb onto the bed" : "You strip your [pc.armor] and climb onto the bed,") + " quickly finding yourself with a surprisingly smooth, chitin-covered back pressing into your [pc.chest].");
	output("\n\nAs you try and get comfortable with Thyvara quickly calming down to lie still, your [pc.legs] brush her abdomen, which is surprisingly squishy compared to most of her. She shudders as you do so, turning over to look at you.");
	output("\n\n<i>“Oh, did you...”</i> she blushes as a thought comes to mind <i>“did you... want some of </i>that<i> too?”</i> Her expression is curious, and you can feel her abdomen moving slowly between the two of you.");

	processTime(10 + rand(5));
	clearMenu();
	addButton(0, "Accident", thyvaraProgressAccident, undefined, "Accident", "Explain that it was just an accident.");
	addButton(1, "Sex", thyvaraProgressSex, undefined, "Sex", "You’re already half naked in her bed, why not go the extra distance?");
}
public function thyvaraProgressStayNo():void
{
	clearOutput();
	showThyvara(false, true);
	
	if (pc.isNice())
	{
		output("With a soft smile you rest a hand on her shoulder. <i>“<i>I’d love to stay and keep you company, but I have to be somewhere. Maybe next time?</i>”</i> She tries to return your smile, and nods slowly.");
		output("\n\n<i>“Alright. Yeah, sure, next time...”</i> She leans over and gives you a peck on the cheek <i>“I think I’ll just sleep here for tonight. This thing’s surprisingly comfy.”</i> She curls up on the couch, leaving you to show yourself out.");
		output("\n\n<i>“Could you get the light for me?”</i> With a soft chuckle you agree, turning off the lights before pecking her on the forehead.");
		output("\n\n<i>“Sweet dreams,”</i> you mutter as you depart, being careful to close the door gently.");
	}
	else if (pc.isMischievous())
	{
		output("<i>“Sorry, Thyv, but I can’t babysit you tonight. Gotta go make those stories you love so much, right?”</i> You give her a smile, and she tries to give you one back.");
		output("\n\n<i>“Right. Right, yeah.”</i> She stretches out, laying down along the couch as you get up. <i>“I might just sleep here tonight. I swear this’ never been this comfy....”</i> She drifts off to sleep before your eyes. With a chuckle you show yourself out.");
	}
	else
	{
		output("<i>“I don’t have time to look after you. I’ve got more important work to do.”</i> You say, getting up. The young woman stares for a moment, before dropping her head.");
		output("\n\n<i>“Right. Sorry, I just... yeah, sorry.”</i> She gets up and makes her way to what you presume is the bedroom door. <i>“You can see yourself out, yeah? I’m just gonna go to bed.”</i> She mutters, opening and closing the door as quietly as possible.");
		output("\n\nYou see yourself to the door, closing it behind you.");
	}
	flags["THYVARA_PROGRESS_TIMER"] = GetGameTimestamp();
	//move steele
	processTime(15 + rand(10));
	clearMenu();
	addButton(0, "Next", move,"NORTH ESBETH 2");
}
public function thyvaraProgressAccident():void
{
	clearOutput();
	showThyvara(true, true);
	
	output("<i>“Sorry, it was just an accident.”</i> She looks at you for several moments, before nodding.");
	output("\n\n<i>“Okay. G’night [pc.name].”</i> With that she snuggles into you, then grows still, her breathing steadying until she’s asleep. Following along, you wrap your arms around her and soon drift off into your own sleep.");
	
	processTime(1);
	clearMenu();
	addButton(0, "Next", thyvaraProgressWakeup, false);
}
public function thyvaraProgressSex():void
{
	clearOutput();
	showThyvara(true, true);
	
	output("Instead of responding you move your hand down to her abdomen, stroking it slowly, getting several shivers in response.");
	output("\n\n<i>“Okay, um... just hold on.”</i> You stop stroking as she begins shuffling around. Soon there’s the snap of a clasp coming undone, and you see her rise from the bed. As she does she shirks the leather harness that covers her breasts and crotch, throwing it off to the side.");
	output("\n\nNext she reaches back, fumbling about at the base of her abdomen. You spot the clasp she’s going for and reach out to grab it, easily undoing it for her. She goes stiff at your touch, but relaxes once you get the buckle open. She turns her head to smile at you.");
	output("\n\n<i>“Thanks”</i> she whispers, before sliding another harness off of her back end. This reveals the opening set at the tip of her abdomen, a soft looking slit, the interior of which is a shade darker than her dark skin. You touch it experimentally, finding it exceptionally soft, much to Thyvara’s apparent pleasure. Before you can get too into it, she pulls her abdomen away, looking at you with lust filled eyes.");
	output("\n\n<i>“So... how do you want to do this?”</i> She asks nervously.");

	processTime(4 + rand(2));
	clearMenu();
	if (pc.cockThatFits(thyvaraVaginalCapacity()) >= 0) addButton(0, "Penetrate", penisRouter, [thyvaraSexPenetrate, thyvaraVaginalCapacity(), false, 0], "Penetrate", "Give the girl a good stiff pounding.");
	else addDisabledButton(0, "Penetrate","Penetrate","You need a cock that fits.");
	addButton(1, "Sixty Nine", thyvaraSex69, undefined, "Sixty Nine", "Have her give you a good solid tonguing while you return the favour.");
}
public function thyvaraProgressWakeup(hadSex:Boolean=false):void
{
	clearOutput();
	showThyvara(true, true);
	var sleepTime:int;
	
	output("You wake with your arms still wrapped around Thyvara. She mumbles every so often, and makes an odd twitch. At one point one of her fans tries to unfold, only to be blocked by your body. The resistance forces her to stir, her whole body slowly shifting. She rolls over in your arms, a groggy face looking into your own recently awakened visage.");
	output("\n\nShe looks at you confusedly for a few moments, before her eyes widen. Her mouth opens and closes a few times, before she finally manages to get sound to come join the motions.");
	output("\n\n<i>“Oh, we, I...”</i> she blushes furiously <i>“I am </i>never<i> drinking again.”</i> You chuckle at the admission, and she quickly begins untangling herself from you. She checks the bed, looking for any traces of stains." + (pc.isMischievous() ? " You strike a pose for her, getting a blush in response." : ""));
	output("\n\n<i>“I’m so sorry for anything I may have done.”</i> You raise an eyebrow, sitting up and gathering your gear.");
	output("\n\n<i>“What do you remember doing?”</i>");
	output("\n\n<i>“Well, I remember you showing up at the bar. I remember saying something... something important....”</i> She scratches her head as she tries to think. Her eyes snap open as she recalls.");
	output("\n\n<i>“Right, about my party! I was thanking you for asking me about them, then... there’s a gap. I can’t remember anything until we....”</i> She blushes furiously and looks away. <i>“I’m sorry you saw me like that. I swear, it’ll never happen again.”</i>");
	output("\n\nYou cock an eyebrow and ask, <i>“Does that mean no more sharing a bed?”</i> Her blush intensifies, and if it gets much worse she might just pass out from the blood rush.");
	output("\n\n<i>“I mean, I did enjoy having someone to share a bed with.”</i> She gives you a shy smile, <i>“And, I’d like to do it again. But... next time I’ll be sober. Promise.”</i>");
	output("\n\nShe ushers you out of the room while she gets dressed. When she emerges she’s wearing a bodysuit made from a greenish-brown leather, which also covers more of her body than what you usually see her in.");
	output("\n\n<i>“Want some breakfast?”</i> She asks, walking to a small kitchen area.");
	output("\n\n<i>“Sure.”</i> You sit at the small, two person table, watching as she pulls several strips of smoked meat from the fridge and throws them into a pan.");
	output("\n\n<i>“So...”</i> She turns to look at you <i>“This might be awkward to ask, but... does this mean anything to you?”</i> You raise an eyebrow quizzically, earning an exhausted sigh from the girl.");
	output("\n\n<i>“I mean... well, I know you’re probably going to meet all kinds of exotic, sexy things out there in the frontier, I just wanted to know if... if we’re more than just sleeping buddies. Not that there’s anything wrong with that!”</i>");
	
	//always wakeup at 10
	if (hours >= 10) sleepTime = 9 + (24 - hours);
	else sleepTime = 9 - hours;
	sleepTime = (sleepTime * 60) + (60 - minutes);
	processTime(sleepTime);
	dailyAutoSleep(sleepTime);
	processTime(15 + rand(10));
	clearMenu();
	addButton(0, "Buddies", thyvaraProgressBuddies, hadSex, "Buddies", "Tell her you just want to be friends with benefits.");
	addButton(1, "Lovers", thyvaraProgressLovers, hadSex, "Lovers", "Let her know you want this to be more than just a friendly fling.");
}
public function thyvaraProgressBuddies(hadSex:Boolean=false):void
{
	clearOutput();
	showThyvara(false, true);
	
	output("<i>“Let’s just stick to being bed buddies.”</i> You tell her. She smiles happily enough.");
	output("\n\n<i>“I think I can live with that." + (hadSex ? " Last night seemed fun enough for a sober run." : "") + "”</i> She returns to cooking, grabbing some eggs and throwing them into a second pan.");
	output("\n\n<i>“So, as a friend, you’re going to come see me every now and again, right?</i> She gives you a look of hope, matched by a fond smile.");
	output("\n\n<i>“Well, I couldn’t leave a friend out here on her own.”</i> She practically squeals at your response, before regaining her, fragile, composure.");
	output("\n\n<i>“Right!”</i> Is all she says before focusing on cooking.");
	
	flags["THYVARA_PROGRESS"] = 4;
	
	thyvaraBreakfast();
	
	processTime(15 + rand(10));
	clearMenu();
	addButton(0, "Next", move,"NORTH ESBETH 2");
}
public function thyvaraProgressLovers(hadSex:Boolean=false):void
{
	clearOutput();
	showThyvara(false, true);
	
	output("<i>“I think I could be willing to give this a chance.”</i> Her eyes widen and she quickly turns back to the cooking.");
	output("\n\n<i>“R-really? C-cause, if you think so then... then you’d be my partner, right?”</i> She looks over her shoulder at you.");
	output("\n\n<i>“Of course.”</i> The smile that breaks out on her face is priceless.");
	output("\n\n<i>“Right. Even if you find someone else to love, I can live with that. As long as you come by to see me every now and again, I’ll be happy.”</i> She cracks some eggs and gets a second pan going.");

	flags["THYVARA_PROGRESS"] = 5;
	
	thyvaraBreakfast();
	
	processTime(15 + rand(10));
	clearMenu();
	addButton(0, "Next", move,"NORTH ESBETH 2");
}
public function thyvaraBreakfast():void
{

	output("\n\nShe finishes up the cooking with just a little bit of small talk, before serving up two plates of bacon and eggs, along with a glass of reddish-blue juice which tastes both sweet and slightly sour.");
	output("\n\n<i>“So, partner,”</i> she looks happily into your [pc.eyes], soft smile on her face <i>“maybe now that we’re a little closer, you could come hunting with me some time?”</i> You look at her for a moment between bites.");
	output("\n\n<i>“You want me to come with you?”</i>");
	output("\n\nShe nods, taking a large bite from her bacon. <i>“Course! I mean, if half of the stuff you’ve told me is true, then you should take to the hunt pretty easily. I mean, it’s a bit of everything. If you can’t get a critter by being quiet, you can usually get the job done by being loud. At least, that’s what Taror always told me.”</i> She chuckles quietly.");
	output("\n\n<i>“I’ll think about it.”</i>");
	output("\n\nShe smiles and nods.");
	output("\n\nThe two of you make small talk as you finish your food, before you decide it’s time to go.");
	output("\n\n<i>“Well, I guess we’ll see each other later, right?”</i> You nod, and she gives you a firm embrace, planting a kiss on your lips. <i>“Don’t do anything too naughty out there, okay?”</i> With a chuckle you make no promises, before the both of you leave the house into the town of Esbeth.");
	processTime(15 + rand(10));
	eatHomeCooking(30);

}
public function thyvaraSex():void
{
	clearOutput();
	showThyvara(true, true);
	
	moveTo("MHENGA_APARTMENT");
	
	output("You ask Thyv if she wouldn’t mind taking you back to her place for some fun. She blushes slightly, but smiles.");
	output("\n\n<i>“Alright, let’s go then.”</i> She gets out of her chair and grabs your hand, leading the two of you out of the bar. You step out into the warm Mhen’gan night, Thyvara taking a deep breath of the fresh air.");
	output("\n\n<i>“I love that jungle smell, reminds me of home every time.”</i> She wraps her arm around yours, pulling you into her side <i>“And there’s no one I’d rather have by my side here.”</i> She pecks you on the cheek, and her hand begins to slide down your side, towards your waist. You run your own hand up her back, caressing her disguised abdomen and earning several soft sights from her.");
	output("\n\nThe two of you reach her house already fired up, and as you pass through the door Thyvara kisses you intensely, her lips battering yours before her tongue follows them. She kicks the door closed and continues to direct your makeout session towards her bedroom, groping your [pc.ass] and duelling your [pc.tongue] the whole way.");
	output("\n\nOnce you’re finally in her room she breaks away, seductively undoing her harness." + (pc.isNude() ? " You enjoy the show, watching her strip and take in your already divested form." : " You follow suit, pulling off your [pc.gear] and letting her watch you as she stands in her underwear."));
	output("\n\nShe sits down on the bed and beckons you forward, unlatching her lower covering and throwing it into the pile.");
	output("\n\n<i>“So, what now?”</i> she asks with a pleasant smile.");
	
	processTime(5 + rand(4));
	clearMenu();
	if (pc.cockThatFits(thyvaraVaginalCapacity()) >= 0) addButton(0, "Penetrate", penisRouter, [thyvaraSexPenetrate, thyvaraVaginalCapacity(), false, 0], "Penetrate", "Give the girl a good stiff pounding.");
	else addDisabledButton(0, "Penetrate","Penetrate","You need a cock that fits.");
	addButton(1, "Sixty Nine", thyvaraSex69, undefined, "Sixty Nine", "Have her give you a good solid tonguing while you return the favour.");
}
public function thyvaraSexPenetrate(kok:int=0):void
{
	clearOutput();
	showThyvara(true, true);
	
	var kok2:int = -1;
	if (pc.cockTotal() > 1)
	{
		kok2 = rand(pc.cockTotal());
		if (kok == kok2)
		{
			if (kok2 == 0) kok2 = 1;
			else kok2 = 0;
		}
	}
	var vag:int = -1;
	if (pc.hasVagina()) vag = rand(pc.vaginaTotal());
	var firstTime:Boolean = false;
	//if both undefined we need to return to the first night scene at the end
	if (flags["THYVARA_SEX_FUCK"] == undefined && flags["THYVARA_SEX_69"] == undefined) firstTime = true;
	
	output("You pull away slightly to position your [pc.cocksLight] to rub against her abdomen. Thyvara gasps as she feels your [pc.cocksLight] rub against her.");
	if (pc.cocks[kok].cLength() >= 10) output(" Your [pc.cockHead " + kok + "] rests against the end of her abdomen, earning a soft wiggle as it presses into the soft flesh. <i>“That feels like it’s gonna go deep...”</i> you hear her murmur.");
	else output(" Your [pc.cock " + kok + "] squishes into the soft flesh of her abdomen, getting a sigh from your partner. <i>“That feels nice.”</i>");
	output(" She reaches back and grabs your [pc.cock " + kok + "] in her hand, the flesh of her palm surprisingly soft.");
	if (kok2 >= 0) output(" She takes your [pc.cock " + kok2 + "] in her other hand, giving it a gentle squeeze.");
	
	output("\n\nYou return the favor, circling her moistening hole with a finger. She coos in pleasure as you rub each-others respective equipment.");
	if (pc.hasVagina()) output(" She pulls her other hand down to rub your more feminine parts. Her chitin is surprisingly smooth, and rubs your [pc.vagina " + vag + "] quite nicely.");
	
	output("\n\n<i>“Hold on....”</i> She rolls over to face you, throwing away the fur blanket and giving you an excellent view of her modest breasts. She parts her legs and slips her abdomen between them.");
	output("\n\n<i>“It’s a little more awkward for me, but I want to watch you put it in.”</i> She tentatively touches a hand to your face. A few moments later she leans in for a kiss. You accept it and as your lips meet, she begins to add tongue to the mix.");
	if (pc.hasLongTongue()) output(" You quickly dominate the kiss, showing her your masterful control of your tongue. She pulls away, needing to breathe and escape your domination of her mouth.");
	else output(" The two of you allow your tongues to duel until the need for breath forces you to break apart.");
	
	output("\n\n<i>“Hah... I think... I think I’m ready for it.”</i> She whispers, leaning back in and kissing your neck. You line up your [pc.cock " + kok + "] and slowly let yourself slip into her hole.");
	if (pc.cocks[kok].cLength() >= 12) output("\n\nYou thrust in, her soft abdomen slides around your [pc.cock " + kok + "], letting you slide in with ease. After sinking eleven inches into her you hit the back of her abdomen, earning a shuddering gasp. <i>“Oh spears, that’s deep. So deep....”</i> She looks at the space still between you, admiring the size of your cock before you draw back.");
	else if (pc.cocks[kok].cLength() >= 8) output("\n\nYou penetrate Thyvara’s abdomen with surprising ease, the soft flesh allowing you to penetrate her full depth in a single thrust. You feel the end of her abdomen as you hilt yourself, the sensation eliciting a gasp from your partner. <i>“That’s good... that’s really good, Cap.”</i> You smile as you begin to withdraw, bringing a hiss of pleasure from her.");
	else output("\n\nYou hilt yourself in the first thrust, earning a contented sigh from Thyvara. Your thrust also compresses her abdomen, resulting in a soft cushion that bounces you back a few inches as it reforms. <i>“That feels nice. The way it all squishes when you thrust in....”</i> She coos, trying to urge you back into her.");

	pc.cockChange();
	
	output("\n\nYou start a slow, soft rhythm, and she sighs with pleasure, putting a hand in your [pc.hair] and drawing you in for a kiss. As your lips meet she wraps her arms around you and rolls the two of you over. You’re now positioned overtop of her with her smiling face looking up at you.");
	output("\n\n<i>“Sorry, it’s more comfortable like this for me.”</i> You feel the muscles in her abdomen relax, letting it slowly fall between her legs, and carrying you down with it. You’re now sitting between her knees, fully impaled in the abdomen resting there. You start to thrust again, earning some soft coo’s from her.");
	output("\n\n<i>“As nice and romantic as this is, could we maybe get a little more... intense?”</i> she asks, giving you a shy smile. You stroke a hand between her leg and abdomen, squishing the soft appendage slightly. She shivers as you start to ramp it up, thrusting harder and faster into her.");
	output("\n\nAs the intensity increases Thyvara starts to squeeze her abdomen, and in turn your deeply buried cock, with her legs. Using her legs, she begins to create her own rhythm, matching yours and creating a very unique sensation in her slit.");
	output("\n\n<i>“Is that good?”</i> she asks, whimpering as your combined actions strike a sensitive spot. You groan out an affirmation, running a [pc.arm] up her thigh. With the way things are escalating it won’t be long before you pop.");
	output("\n\nYou lean down and wrap one of her nipples in your [pc.lipsChaste], gently suckling and nibbling it. She groans in pleasure, pushing your head deeper into her breast. Her stroking rhythm starts to grow more erratic, and you can feel her breathing growing unsteady as she approaches her edge.");
	output("\n\nWithout warning her legs fall by the wayside, and her arms hold you tightly. She’s surprisingly silent as she crashes over the edge of orgasm. Powerful rings of muscle pulse around your [pc.cock " + kok + "], pushing you to your limit.");
	if (pc.hasKnot(kok)) output("\n\nYou force your growing knot into her pulsing bug tunnel, the rings around her entrance lock down as your [pc.knot " + kok + "] bloats to full size, sealing the tunnel from both sides. She looks down at you eyes wide and mouth open. Between ragged, gasping breaths she manages to groan <i>“Kn...knotted... oh, yesssss!”</i> before her convulsions redouble, all the motions in her ebon pussy escalating save for the two or three rings holding your knot tightly.");
	else output("\n\nHer muscular pussy holds you tightly as your thrusts start to grow shorter. As your [pc.cock " + kok + "] throbs inside of her, the rings at her entrance constrict, holding onto you tightly. There’s still enough give in her to allow you to thrust, however, and you continue to jackhammer into her. <i>“F-fuck! Yes, do it!”</i> she all but begs, bringing her legs back up to hold you tightly.");

	if (pc.cumQ() >= 1000)
	{
		if (pc.balls > 1) output("\n\nWhen you tip over the edge, your [pc.balls] make sure they let Tyvara know.");
		else if (pc.balls > 0) output("\n\nWhen you tip over the edge, your [pc.balls] makes sure it lets Tyvara know.");
		else output("\n\nWhen you tip over the edge, your body makes sure it lets Tyvara know.");
		
		output(" Your first wave of [pc.cum] is enough to fill her channel, the next floods her womb." + (pc.hasKnot(kok) ? " Between your knot and her grip, the next few shots pressurize her abdomen, the once forgiving flesh tightening over you both. Even the firm seal around your [pc.base " + kok + "] isn’t enough to hold the flood back, and the results are explosive, [pc.cum] and Thyvara’s own juices squirting out around you." : " The firm grip of Thyvara’s muscular pussy tries to hold your juices in, but your output won’t be held back. A few more squirts and the both of you are being covered in [pc.cum], but Thyvara’s abdomen continues to swell as what’s forced out is replaced twice as fast."));
		
		output("\n\nBy the time you’re squirting watery aftershocks Thyvara’s abdomen is swollen to twice its original size, with [pc.cum] leaking out around your union. She sighs heavily as the two of you come down from your high’s.");
		output("\n\n<i>“Holy shit,”</i> she sighs. <i>“" + (pc.race() == "kui-tan" ||  pc.race() == "half kui-tan" ? "I never realised how messy a kui could actually be. That was insane." : "I didn’t think anything short of another matisar or a kui-tan could flood my wombs like that. You really are something else, [pc.name].") + "”</i> She leans down and kisses the top of your head.");
	}
	else if (pc.cumQ() >= 500)
	{
		if (pc.balls > 1) output("\n\nYour productive [pc.balls] prepare to unload themselves");
		else if (pc.balls > 0) output("\n\nYour productive [pc.balls] prepares to unload itself");
		else output("\n\nYour productive reproductive system prepares to unload itself");
		output(" into Thyvara’s green hole.");
		if (pc.hasKnot(kok)) output(" Your knot and her abdomen’s grip work together to keep your load inside her.");
		else output(" Her grip on your [pc.cock " + kok + "] prevents most of your [pc.cum] from leaking out.");
		output(" Her abdomen stretches taut, swelling slightly as the internal space is filled with fluid. When you’re finished, she sighs happily, running her hands over her, now tight, abdomen.");
	}
	else 
	{
		output("\n\nYou shoot your load into Thyvara’s abdomen, the large organ devouring you with little trouble. Thyvara wiggles slightly, letting the load squish around inside her. A little quiver runs through her tunnel as she enjoys the feeling.");
		output("\n\n<i>“Ah, that was nice, [pc.name]. Makes me feel warm,”</i> she leans down to look at you, still buried between her breasts, cheeky smile on her face <i>“and a little sticky.”</i> She pecks you on the forehead.");
	}

	processTime(10 + rand(10));
	pc.orgasm();
	IncrementFlag("THYVARA_SEX_FUCK");
	
	output("\n\n<i>“Now </i>that<i> is what I call a good lay.”</i> " + (pc.hasHair() ? "She runs a hand through your hair and leans down to kiss you." : "She leans down to kiss you."));
	output("\n\n<i>“I think I need a shower after that.”</i> She slowly extricates herself from you, letting your sexes separate with a wet slurping sound as she tries to hold her gash closed. She stumbles her way into the shower, which luckily has an entrance from the bedroom. You follow as she turns the water on.");
	
	clearMenu();
	addButton(0, "Next", thyvaraSexShower, firstTime);
}
public function thyvaraSex69():void
{
	clearOutput();
	showThyvara(true, true);
	
	var kok:int = -1;
	var kok2:int = -1;
	var kok3:int = -1;
	if (pc.hasCock()) kok = rand(pc.cockTotal());
	if (pc.cockTotal() > 1)
	{
		kok2 = rand(pc.cockTotal());
		if (kok == kok2)
		{
			if (kok == 0) kok2 = 1;
			else kok2 = 0;
		}
	}
	if (pc.cockTotal() > 2)
	{
		kok3 = rand(pc.cockTotal());
		if (kok == kok3 || kok2 == kok3)
		{
			if (kok != 0 && kok2 != 0) kok3 = 0;
			else if (kok != 1 && kok2 != 1) kok3 = 1;
			else kok3 = 2;
		}
	}
	var vag:int = -1;
	var vag2:int = -1;
	if (pc.hasVagina()) vag = rand(pc.vaginaTotal());
	if (pc.vaginaTotal() > 1)
	{
		vag2 = rand(pc.vaginaTotal());
		if (vag == vag2)
		{
			if (vag == 0) vag2 = 1;
			else vag2 = 0;
		}
	}
	var firstTime:Boolean = false;
	//if both undefined we need to return to the first night scene at the end
	if (flags["THYVARA_SEX_FUCK"] == undefined && flags["THYVARA_SEX_69"] == undefined) firstTime = true;
	
	output("You give her a good look at your [pc.crotch].");
	if (pc.hasCock() && pc.hasVagina())
	{
		output(" Tyvara blushes as she takes in the variety of your equipment.");
		output("\n\n<i>“Well, I guess variety </i>is<i> the spice of life and all that.”</i>");
	}
	else if (pc.hasCock())
	{
		output(" Thyvara smiles at your hardening [pc.cocks], licking her lips.");
		output("\n\n<i>“" + (pc.cockTotal() > 1 ? "Those look" : "That looks") + " good to play with.”</i>");
	}
	else if (pc.hasVagina())
	{
		output(" Thyvara giggles at your moistening [pc.vaginaNounSimple].");
		output("\n\n<i>“You look juicy, mind if I have a taste?”</i>");
	}
	else 
	{
		output(" Thyvara raises an eyebrow at your lack of naughty bits.");
		output("\n\n<i>“So... what are we doing?”</i>");
	}

	output("\n\nYou explain that you want to get a taste of her, and give her a taste of you. She nods, looking at your [pc.crotch] " + (pc.hasGenitals() ? "with interest." : "with confusion."));
	output("\n\n<i>“In that case, just let me get a bit more... comfortable.”</i> With that she shifts herself around, spinning to line up her head with your [pc.crotch] and in doing so giving you a good shot at her own squishy abdomen.");
	output("\n\nYou grab her abdomen and squeeze, making her squeak and setting a small dribble of feminine excitement running from her entrance. You lick the end of the trail, letting your tongue run up to her entrance, before pulling away. You circle the slit a few times before licking through her wet lips, earning no shortage of pleasured sounds from Thyvara when you push into her.");
	
	output("\n\nUsing your [pc.legOrLegs], you remind her about your own needs.");
	
	if (pc.hasVagina())
	{
		output("\n\nShortly your [pc.clit " + vag + "] is pressed on, sending a shock of pleasure up your spine and earning a giggle from Thyvara.");
		output("\n\n<i>“These things are so funny. One little tap has most species soaking themselves.”</i> She taps a finger against [pc.clit " + vag + "] a few more times, before latching on to it with her mouth.");
		output("\n\nShe starts sucking and poking it with her tongue, sending jolts of ecstasy through you. As she continues to toy with [pc.clit " + vag + "], her finger finds a new task, running up and down [pc.vagina " + vag + "].");
	
		if (pc.hasCock()) output("\n\nAfter lubing up her finger on [pc.vagina " + vag + "], she takes her hand upwards, gripping your [pc.cock " + kok + "] and stroking it, using your [pc.girlCum] as lube to start up a fast paced handjob.");
		else output("\n\nAfter stroking [pc.vagina " + vag + "], she puts more pressure on, and her fingers sink into [pc.vagina " + vag + "]. She soon adds a second finger," + (vag2 >= 0 ? " then uses her other two to penetrate your [pc.vagina " + vag2 + "]," : "") + " starting up a brisk fingering.");
	}
	else if (pc.hasCock())
	{
		output("\n\nYour [pc.cockHead " + kok + "] is enveloped in a soft warmth. This is soon after joined by a gentle grip around the base of your [pc.cock " + kok + "].");
		if (kok3 >= 0) output(" Her other hand falls on your [pc.cock " + kok2 + "], stroking it before moving to your [pc.cock " + kok3 + "].");
		else if (kok2 >= 0) output(" Her other hand joins in by stroking your [pc.cock " + kok2 + "].");
		
		output("\n\nShe starts up a quick rhythm, dragging her lips down your cock. At the same time her hand moves up, stroking you off halfway until her hand meets her lips.");
	}
	else
	{
		output("\n\nYour [pc.asshole] receives a wet present, Thyvara licking across it while rubbing her hand across your [pc.crotch], seemingly searching for something there.");
		output("\n\n<i>“You’re a strange one, [pc.name]. I don’t think I’ve met anyone who’s had nothing down here before.”</i> She pokes at your [pc.crotch], before returning to lubing up your [pc.asshole]. Once she’s happy with it, she pushes her fingers against your [pc.asshole], and soon has one, then two slipping inside.");
	}
	
	output("\n\nThe feeling brings a sigh of pleasure from you, and a wiggle of her abdomen reminds you of your own oral duties. Returning to her abdomen with a lick, you probe your [pc.tongue] into her depths, earning a squeak from the Matisar on top of you.");
	
	output("\n\nYou probe deeper into her slit, brushing passed an odd opening. As your [pc.tongue] comes into contact with it, you realise it’s a cervix, and given Thyvara’s moans, probably quite sensitive.");
	if (pc.hasLongTongue()) output(" As you keep rolling your [pc.tongue] out, you find a second cervix, and an experimental prod tears a muffled scream of ecstasy out of Thyvara. You figure it’s just as sensitive, if not moreso, than the first. Once she’s recovered from the surprise of your [pc.tongue], she returns to your own crotch with a renewed fervour for getting you off.");
	else output(" You poke and prod the inner opening with your [pc.tongue], earning a series of muffled moans and cries from Thyvara. Pressing the tip of your [pc.tongue] into the centre of the opening proves an excellent strategy, as Thyvara’s moans ratchet up a level, as does her own treatment of your crotch.");
	
	output("\n\nThe two of you are getting quite riled up now, and an escalation in attentions from the both of you, you probing Thyvara’s oddly placed cervix and Thyvara attending to your " + (pc.hasGenitals() ? "[pc.crotch]." : "[pc.asshole].") + " It can only end in one way, and you’re both approaching it fast.");
	
	output("\n\nDeciding to try and finish her off first, you put all the strength you can into your [pc.tongue] and force it against her cervix. The punch is enough to penetrate the entrance slightly, and Thyvara’s entire body locks up. Her mouth is locked around your");
	if (pc.hasCock()) output(" [pc.cock " + kok + "], her tongue going slack against its underside.");
	else if (pc.hasVagina()) output(" [pc.vagina " + vag + "], her oral attentions freezing within your tunnel.");
	else output(" [pc.asshole], fingers gripping your [pc.butt] tightly.");
	output(" Her legs lock around your head, holding you into her now spasming channel, and pushing you into it further, compressing the soft abdomen and adding more force to her climax.");
	
	output("\n\nYou’re quickly soaked from your head to your [pc.breasts], and if Thyvara’s face wasn’t buried into your " + (pc.hasGenitals() ? "[pc.crotch]" : "[pc.asshole]") + ", the sounds she’s making would probably wake half the town.");
	output("\n\nOnce her orgasm subsides, she’s panting and shaking, almost her entire body limp. The only active muscle is her tongue, which weakly attends your " + (pc.hasGenitals() ? "[pc.crotch]" : "[pc.asshole]") + ". Figuring she doesn’t have the energy left to finish you herself, you take matters into your own hands.");

	output("\n\nRolling the two of you over, you spin around and straddle her chest, looking down at her. She’s panting, occasionally shaking, but her mouth holds itself open for you, the tweak of a smile at the corner of her lips.");
	if (pc.hasCock())
	{
		output(" You slap your spit lubed [pc.cock " + kok + "] between her B-cup breasts, splattering Thyvara’s saliva across the budding mounds. " + (pc.cocks[kok].cLength() >= 6 ? "As you thrust into her breasts, you batter the [pc.cockHead " + kok + "] of your [pc.cock " + kok + "] against the back of her throat." : "You thrust between her breasts, your [pc.cockHead " + kok + "] nestling into her mouth with each stroke."));
	
		if (pc.cumQ() >= 750)
		{
			output("\n\nIt’s not long before you pop, but when you do, the mess is epic. Even with your [pc.cockHead " + kok + "] embedded in Thyvara’s mouth, the first shot is enough to overfill her mouth. Your [pc.cum] backwashes over her lips and down her neck and chest, coating her in [pc.cum]. When she tries to pull back, she’s sprayed with another shot from your [pc.balls], covering her from the tits up in [pc.cum].");
			if (pc.hasVagina()) output("\n\nYour [pc.vagina " + vag + "] gives its own deposit, leaving its own fluids leaking beneath Thyvara’s breasts.");
			output("\n\nWhen your virile flood ceases, the girl beneath you is left coughing and wiping cum from her eyes. Once she can see again, she just stares at you for several minutes before breaking out into a [pc.cumNoun]-covered smile. <i>“That... was awesome.”</i>");
		}
		else if (pc.cumQ() >= 100)
		{
			output("\n\nYou thrust into her mouth and let go of your restraint. Each shot from your [pc.balls] fills her mouth. She almost manages to keep up with your flow of [pc.cum], but after the first few shots it begins to ooze around the seal of her lips.");
			if (pc.hasVagina()) output(" A wetness spredding from your [pc.vagina " + vag + "] informs you that your more feminine parts got their share of pleasure too.");
			output("\n\nShe pulls her head back and takes the last few shots to the face, leaving her with a [pc.cumColor] mask. You notice the mask is quickly split by a grin, her tongue licking up what it can reach.");
		}
		else
		{
			output("\n\nYou pop your load before too long, feeding Thyvara a few small shots of [pc.cum].");
			if (pc.hasVagina()) output(" Your [pc.vagina " + vag + "] decides to add a wash of [pc.girlcum] to the mix, leaking its own orgasm across your partner’s chest.");
			output(" She swallows your [pc.cum], before lying her head back, popping your rod from her lips. She then gives you a tired smile.");
		}
	}
	else if (pc.hasVagina())
	{
		output("\n\nYou edge yourself forward, bringing your [pc.vagina " + vag + "] back to her face. As she restarts her weak attentions to your feminine parts, you add your own stimulation, fingering your [pc.clit " + vag + "] and pinching your [pc.nipple]. Between your already swollen lust and the added attentions, your finish is coming quickly.");
		
		output("\n\nAfter a minute of intense stimulation, you tip over the edge.");
		if (pc.isSquirter()) output(" Your orgasm hits with force, spraying [pc.girlCum] into Thyvara’s mouth. She tries to swallow, but is soon overwhelmed, turning away with her face drenched in your [pc.girlCum].");
		else output(" You gush [pc.girlCum] into Thyvara’s mouth, forcing her to swallow your female ejaculate.");
		
		output("\n\nOnce she’s cleared her mouth of your [pc.girlCum], she gives you a tired smile. <i>“Sorry for making you do all the work at the end there.”</i>");		
	}
	else
	{
		output("\n\nShe probes your [pc.asshole] with her tongue, trying to find a way to bring you off without any actual sexual parts. After a bit of tonguing, she raises an arm and starts prodding your [pc.asshole] with something a little firmer. After a few seconds of resistance, she manages to penetrate your [pc.asshole]. You shudder as first one, then two fingers are buried into you, feeling something inside you rising to a head.");
		output("\n\nA few moments later and your whole body convulses, <i>something</i> making the built-up lust bleed out of you. You look down to Thyvara, who just smiles and winks as her hand falls to the side.");
	}

	output("\n\n<i>“That... was something else.”</i> She slowly rolls over and groans at the state she’s in. <i>“I think... I need a shower... Care to help a girl out... one more time?”</i>");
	output("\n\nYou smile and nod, grabbing her hand and helping her to the bathroom.");
	
	processTime(10 + rand(10));
	pc.orgasm();
	IncrementFlag("THYVARA_SEX_69");
	clearMenu();
	addButton(0, "Next", thyvaraSexShower, firstTime);
}
public function thyvaraSexShower(firstTime:Boolean=false):void
{
	clearOutput();
	showThyvara(true, true);
	
	//check if steele already did first wakeup scene (could be set erroneously to true if no sex the first time)
	if (flags["THYVARA_PROGRESS"] >= 4) firstTime = false;
	output("Thyvara still has little coordination, and you find yourself washing her for the most part, wiping the sweat and lusty juices away. She’s slowly dozing while you try and scrub her clean, the warm water bringing her weariness back, with interest.");
	output("\n\n<i>“You’re such a good friend, [pc.name]. You walked me home, you stayed the night, and now your helping me clean up after giving some of the best sex in my life. What I wouldn’t give....”</i> she dozes again before jolting awake.");
	output("\n\nOnce clean you carry her back to the bedroom. She eyes the bed with a groggy look and sighs. <i>“We can’t leave it like that. C’mon, help me change it out.”</i> You help her strip the bed, throwing the soiled bedding into a pile, before putting a new spread of fur over the mattress.");
	output("\n\nShe flops down onto the clean fur and snuggles into it. Turning her head to you she ruffles her fans and gives you a tired smile. <i>“Come on. You said you’d stay with me, right?”</i> You nod and crawl into bed beside her, cuddling up against her. She’s out in moments, breathing softly and occasionally mumbling. You drift away shortly after.");

	processTime(15 + rand(10));
	clearMenu();
	if (firstTime) addButton(0, "Next", thyvaraProgressWakeup, true);
	else addButton(0, "Next", thyvaraSexWakeup, undefined);
}
public function thyvaraSexWakeup():void
{
	clearOutput();
	showThyvara(true, true);
	var sleepTime:int;
	
	output("You wake up snuggled into Thyvara’s back, arms wrapped around her while her arms are over yours. She starts to stir, rubbing into you as she comes to. She looks back to see you with a smile. <i>“Hey there, " + (thyvaraRelationship() == 2 ? "partner" : "bud") + ". Did you sleep well?”</i> She squeezes your hands before pulling them away. <i>“I know I did.”</i> She leans up to you and gives you a quick kiss.");
	output("\n\n<i>“I did.”</i> You return the kiss before starting to disentangle yourself. She sighs and lets your hands go, getting up with a yawn and stretch.");
	output("\n\n<i>“Well, I suppose we both have things that need doing, huh? Gotta pay for this place somehow.”</i> She gets up and starts putting her strappy armour on, bending over to give you a good view of her abdomen’s opening as she places the leather cap back over it.");
	output("\n\nAfter committing her finer points to memory, you decide to get yourself presentable as well. " + (pc.isNude() ? "You go into the bathroom and tidy yourself up, stepping out and following her into her kitchen." : "You put your [pc.gear] back on and follow her out to the kitchen."));
	output("\n\nYou enjoy some small talk as she makes you both breakfast, eating the warm meal of some form of cured meat and eggs with comfortable chatter. As you finish up, she takes the plates and dumps them into a washer, walking you out to the door.");
	output("\n\n<i>“I had lots of fun last night. Hope we can do this again soon.”</i> She gives you a tight hug,");
	if (pc.hasPerk("Mane")) output(" rubbing her face into your mane.");
	else output(" putting her face into your neck.");
	output(" She slowly pulls away, giving you a quick peck on the cheek, before going back inside to finish her preparations. You turn away from the door to greet the new day of hunting for your inheritance.");

	//always wakeup at 8
	if (hours >= 8) sleepTime = 7 + (24 - hours);
	else sleepTime = 7 - hours;
	sleepTime = (sleepTime * 60) + (60 - minutes);
	processTime(sleepTime);
	dailyAutoSleep(sleepTime);
	processTime(15 + rand(10));
	clearMenu();
	addButton(0, "Next", move,"NORTH ESBETH 2");
}
public function thyvaraHaveADrink(cumQ:int=50):void
{
	if (pc.hasPerk("Cum Highs")) cumHighUpdate(pc, cumQ);
	if (pc.hasPerk("Lusty Afterglow")) lustyAfterglowUpdate(pc, cumQ);
	if (pc.hasPerk("Dumb4Cum")) dumb4CumReset();
	if (pc.canCumCascade()) pc.cumCascade(cumQ);
}

public function thyvaraShareStories():void
{
	clearOutput();
	showThyvara(false, true);
	
	output("You let her know you’re interested in swapping stories. She grins and sits her flask down on the table.");
	output("\n\n<i>“Well then, I’m always up for a good story.”</i> She gives you an elaborate wave. <i>“Take us off then.”</i>");
	
	processTime(15 + rand(10));
	clearMenu();
	if (thyvaraAreMhengaStoriesOK()) addButton(0, "Mhen’ga", thyvaraShareStoriesMhenga, undefined, "Mhen’ga", "Why not share some surprises you’ve found on Thyvara’s home turf?");
	else addDisabledButton(0, "Mhen’ga","Mhen’ga","You have no stories of Mhen'ga to share.");
	if (thyvaraAreMyrellionStoriesOK()) addButton(1, "Myrellion", thyvaraShareStoriesMyrellion, undefined, "Myrellion", "What adventures could you share about the caverns of Myrellion?");
	else addDisabledButton(1, "Myrellion","Myrellion","You have no stories of Myrellion to share.");
	if (thyvaraAreTarkusStoriesOK()) addButton(2, "Tarkus", thyvaraShareStoriesTarkus, undefined, "Tarkus", "Share a tale of the split junk world.");
	else addDisabledButton(2, "Tarkus","Tarkus","You have no stories of Tarkus to share.");
	if (thyvaraAreUvetoStoriesOK()) addButton(3, "Uveto", thyvaraShareStoriesUveto, undefined, "Uveto", "While not a rush world, there’s still plenty of wild places you’ve been to on the frozen moon world.");
	else addDisabledButton(3, "Uveto", "Uveto", "You have no stories of Uveto to share.");
	addButton(14, "Back", thyvaraMainMenu, true, "Back", "That’s all for now.");
}
public function thyvaraShareStoriesMhenga():void
{
	clearOutput();
	showThyvara(false, true);
	
	output("You recall your time on Mhen’ga, and the journey’s you’ve had in the jungles. After recounting a particular adventure you ask if she has anything to share? She smiles looking up and thinking.");
	output("\n\n<i>“Yeah, yeah I got one. Story from right around here.”</i> She takes another swig of her drink and leans back with a sigh.");
	output("\n\n<i>“Alright, so, this was before my party left we were out hunting around a stream that’d carved itself a canyon. We were down there, fishing, exploring, all the usual stuff you’d do on a frontier world.”</i>");
	output("\n\n<i>“We found one of those sacae, those tentacled girls who live in the water? We found one of them, strung up in the rocks, getting taunted by a few zil. Never found out how they caught her, but we definitely made sure they weren’t gonna keep her.”</i> She gets a proud smile as she recalls the rescue.");
	output("\n\n<i>“We got into some positions around them. Mirase yelled at them ‘Let the girl go!’ and they </i>freaked<i>. They started spinning around trying to work out where the shout had come from.”</i>");
	output("\n\n<i>“Then Caris shouted that they angered the Canyon Kings, and it took everything I had not to burst out laughing.”</i> she giggles at the memory <i>“They just kept up the act, pretending to be some kind of immortal guardians, and eventually our matriarch, Gisara, got tired of it and fired off a warning shot. Watching those poor bee boys climb over each other trying to get the hell out of there was one of the funniest things I’ve seen on this world.”</i>");
	output("\n\n<i>“After they were long gone we popped out of our hiding place and got the poor girl down from the cliff. She slid herself back into the water and we had a little chat. I mean, when you meet a fellow hunter out there, you have to have some respect for each other.”</i>");
	output("\n\n<i>“She showed us a few nice fishing spots in the river, and let me tell you, some of these fish are absolutely delicious.”</i>");
	if (flags["NALEEN_SNUGGLED"] != undefined) output(" You nod, fondly remembering the taste of the ginderfish the naleen prepared for you.");
	else output(" You’ll have to take her word for it, not having tried the local selection yourself.");
	output("\n\n<i>“So, got anything else you want to share?”</i>");
	
	IncrementFlag("THYVARA_STORY");
	processTime(20 + rand(15));
}
public function thyvaraShareStoriesMyrellion():void
{
	clearOutput();
	showThyvara(false, true);
	
	output("You bring up your time on the war-torn world of Myrellion, and your adventures among the many races living there. After recounting one of the more exciting events you were a part of there, you ask the matisar huntress if she has any comparable experiences.");
	output("\n\nAfter a few moments thought she nods.");
	output("\n\n<i>“Alright. This one’s got some more adult themes to it, but the story’s still a good one.”</i> She chuckles as she starts going through her datapad, eventually coming to a picture of her family standing amongst what looks like a group of bird-like aliens.");
	output("\n\n<i>“These are the Tiras tribe from a rush world. Can’t remember the name, but they’re damned good hunters for their tech level, and we had some fun hunting with them for a month or two.</i>”</i> She points to one of the smaller matisar. <i>“This is Jaroth. He got especially friendly with one of the tribe, and ended up giving her an egg. We were all supposed to be on regular sterilex treatments, but apparently he forgot his at one point.”</i>");
	output("\n\n<i>“Now, the tribe was happy to have a half-matisar kid running around, as long as Jaroth agreed to help take care of it. Now, these guys have a fairly quick cycle, two weeks to egg, three months to hatching. That’s all they wanted, for him to stay until the egg hatched.”</i>");
	output("\n\n<i>“Now, we all agreed to it, since the planet was actually pretty hospitable for us, and there was a nice diversity of wildlife there. So we hunt, sometimes with the tribe, but usually on our own, until the tribe tells us that someone’s kidnapped our brother.”</i> She gives you a tired smile.");
	output("\n\n<i>“Turns out a rival tribe had heard about Jaroth’s little breeding event, and decided they wanted some of that star-seed for themselves. We found the rival village easy enough, and boy had they been busy. There was already a full nursery set up and ready, and a lot of folk walking around with fat bellies. We waited for night before moving in on them. We’d spotted where they were keeping him, just had to look for the building they went in thin and came out bloated. I don’t think they quite knew what they were getting themselves into volume-wise.”</i>");
	output("\n\n<i>“We snuck in and knocked out a guard or two. When we got inside the hut, damn was it a mess. He was actually knotted when we got there. I’d say the girl was surprised to see us, but I think she was just insensate. Jaroth looked at us for a few seconds before he realised who had just broken into his little love tent.”</i>");
	output("\n\n<i>“Then the jackass smiles at us and asks if we could give him a few more minutes!”</i> She sighs and shakes her head, giving you a look of disdain <i>“Turns out, he’d not only let himself get kidnapped, he’d even fucking agreed to it! The idiot goes on about how he’d gone out hunting and found the village, before going all out and making a deal with them.”</i>");
	output("\n\n<i>“We waited for his dick to go down, I think Taror just wanted to cut it off at this point, and dragged him back to the girl he was supposed to be looking after. Gisara decided that as punishment for not only breaking his word, but also for ditching a girl he’d gotten pregnant, he could hang out with the tribe for the next year or two.”</i> She gets an evil smile on her face as she takes a drink.");
	output("\n\n<i>“To say he wasn’t happy would be an understatement, but he deserved it, and more for being a jackass in the first place. Wonder if they’ve picked him up yet?”</i> She looks towards the roof for a few minutes, pondering, before turning back to you.");
	output("\n\n<i>“So, that’s me, anything else you want to share?</i>");
	
	IncrementFlag("THYVARA_STORY");
	processTime(20 + rand(15));
}
public function thyvaraShareStoriesTarkus():void
{
	clearOutput();
	showThyvara(false, true);
	
	output("You recall the rusty junk world of Tarkus, and the exciting things you’ve seen and done there. You give Thyvara a tale of the rust world, explaining what the planet’s like. Once you’re done, you ask her for a story.");
	output("\n\nThyvara thinks for a bit, then nods. <i>“Yeah, yeah I think I have something.”</i> She shifts around in her seat and looks at you with a smile.");
	output("\n\n<i>“Okay, so we were on this dry world, mostly iron rich desert and metallic rock on the surface, but had a thriving underground biosphere. Spinarran’s jumped on the world faster than you can say ‘tunnel’. But the surface wasn’t exactly abandoned by life, and there were reports of these things, big, heavy shelled bastards with six legs and jaws that could shatter armor in a single bite.”</i>");
	output("\n\nShe pulls out her pad and brings up an image of her party standing around a creature with a dull grey shell and six legs ending in sharp talons. It’s head bears a pair of thick mandibles, covered in lines of small spines.");
	output("\n\n<i>“Yeah, looks real friendly, doesn’t it?”</i> She laughs at your reaction to the creature. <i>“We brought in maybe three or four of these things, over a couple months of hunting. But there was one in particular that was a real pain.”</i> She flicks over a few pictures to show another of the things. This one is a good deal larger than the last, it’s carcass large enough for the matisar hunters to sit on. It’s also missing half of one mandible and a leg from either side.");
	output("\n\n<i>“This big prick we should have killed about five times. The first time we put three bullets through its head, that just made it angry and got it charging us down. We had enough time to put another round into it, so we put another three into its mouth. They </i>bounced<i> off of those mandibles. So then it’s on us, thrashing and trying to generally just stab us with its feet.”</i>");
	output("\n\n<i>“Thirty seconds of dodging and half-assed hits later, and Caris manages to jump on it’s back and put his spear into it. We just stood in silence as this thing, with an ironoak spear haft sticking out of its shell starts bucking and trying to throw him off. Would’ve been funny if it wasn’t so life threatening. So, after a few moments, it throws our brother off of its back and tries to trample him.”</i>");
	output("\n\n<i>“By the time we got our jaws off the ground Taror had charged in with her sword, big two handed thing that might as well have been a battle axe the way she used it. She slammed it down on the thing’s leg as it was about to come down on Caris, got fucking wedged three quarters the way through. An eight foot tall matisar, with a sword almost as big as me, and she couldn’t get through a limb the size of my bicep. She got caught in its jaws, and lets just say we were glad that her shield held up. She starts punching this thing, right in the popped eye socket, and Gisara comes running in with her axes. Now, my mother is a scary matisar normally, but when one of us was in trouble, she became pure nightmare.”</i>");
	output("\n\n<i>“She comes in swinging, and just smashes that mandible apart. When Taror drops and gets the hell out of there, she shoves a damned grenade into the thing’s mouth. Grenade goes off, we’re all standing there, happy the bloody thing’s finally dead, when it starts twitching.”</i> She sees the look on your face and just nods <i>“That’s about the same look we had. We all rush in, trying to get this thing dead before it can get back up. Mirase starts hacking at its other leg, and Caris starts just jiggling his spear around.”</i>");
	output("\n\n<i>“It gets up, throws us off, and falls back the fuck over. When we got the thing back to the port, we had the shell tested. It was quality steel. Once the other compounds were pulled out and just the metal was left, the shell was made of the kind of steel you’d find in armor plating. Turns out a ship had crashed there a week ago, and the thing had been eating the metal.”</i> She swipes through a few more images, before stopping on a picture of her with a pauldron over one shoulder. <i>“This was what I got out of the shell. Was the non-broken mandible”</i> She finishes with a smile, looking at you expectantly, clearly waiting for another story.");
	
	IncrementFlag("THYVARA_STORY");
	processTime(20 + rand(15));
}
public function thyvaraShareStoriesUveto():void
{
	clearOutput();
	showThyvara(false, true);
	
	output("You take a few minutes to think on your time on the frigid world of Uveto, recalling journey’s through the snow and ice. After picking one tale and recounting it to Thyvara, you ask her for a cold climate story in return.");
	output("\n\nAfter a few moments thought she nods, coming up with a tale for you.");
	output("\n\n<i>“<i>Okay, I don’t know if I’ve said this before, but we matisar like two things in our environment, heat and moisture. We try to avoid the colder, drier worlds, but every now and again we find ourselves camped out on some frigid snowball.”</i>");
	output("\n\n<i>“So, we were more coreward on this one, one of those special hunting reserves. The planet itself was pretty cold, not iceball cold, but chilly enough that the ice caps covered a third of the planet.”</i>");
	output("\n\n<i>“Now, right up on the northern cap, there were some things we called snowcrackers. They were the size of my fist and moved in swarms. We weren’t after them, but we sure as hell found some.”</i> She shudders at the memory.");
	output("\n\n<i>“<i>Now, here’s why they were called snowcrackers, they lived on the ice sheets, which usually were covered in snow. When they felt something crawling across the snow, they’d start making holes. Once they’d made enough holes, boom, ice sheet cracked, and whatever was there, dropped into the freezing water and made a nice meal.”</i> You can see where this story’s going, and it doesn’t look fun.");
	output("\n\n<i>“<i>So, there we were, stalking a pack of critters with nice, fluffy hides, when we start hearing the ice crack under us. We all sprinted for our jet bikes, but... well, one of us tripped.”</i> The wince she gives at the memory makes it clear just which one of the family tripped.");
	output("\n\n<i>“Taror came in after me. She was the biggest of us, so she had the best chance of getting out of there.”</i> Her voice and look grow distant, staring at her flask <i>“I’ve never been more scared in my life. Only three seconds and I was starting to go numb. I’ve still got scars from those things trying to bore into me.”</i> She holds up her arm, tracing a number of divets in her chitin <i>“Taror saved me, without question, that day. And I’ve never been able to make it up to her.”</i> A question comes to mind about Thyvara’s big sister.");
	output("\n\n<i>“Is she still around?”</i> Thyvara nods, a shadow of her smile coming back.");
	output("\n\n<i>“I doubt there’s a creature out there that could bring her down. Not even... not even </i>those<i> could get her....”</i> Her voice trails off, leaving the two of you sitting silently at the bar. You put a comforting hand on her shoulder, and she sighs, leaning into it.");
	output("\n\n<i>“The both of us were in the infirmary for a week, between the hypothermia and the surgeries to remove the snowcrackers, we both had a rough week.”</i> She huffs a laugh <i>“I don’t think I stopped swearing my life to her the whole time. Or apologising for screwing up so hard.”</i> She takes a sip from her flask, before rolling her shoulders and straightening her back.");
	output("\n\n<i>“Tell me another story to take my mind off of it, could you?”</i>");
	
	IncrementFlag("THYVARA_STORY");
	processTime(20 + rand(15));
}


public function thyvaraAreMhengaStoriesOK():Boolean
{
	if (flags["AZRA_MHENGAED"] != undefined) return true;
	if (flags["ROBOT_QUEST_COMPLETE"] >= 2) return true;
	if (flags["PENNY_CREW_ASKED"] != undefined) return true;
	if (flags["ZIL_PROBLEM_DEALT_WITH"] != undefined) return true;
	if (plantationQuestComplete()) return true;
	if (flags["QUINNFEST_COMPLETE"] != undefined) return true;
	if (flags["PUMPKING_COMPLETION"] != undefined) return true;
	if (flags["SATELLITE_QUEST"] != undefined) return true;
	if (flags["FIRST_CAPTURED_ZIL_REPORTED_ON"] != undefined && flags["SECOND_CAPTURED_ZIL_REPORTED_ON"] != undefined) return true;
	
	return false;
}
public function thyvaraAreMyrellionStoriesOK():Boolean
{
	if (flags["BOTHRIOC_QUEST_COMPLETE"] != undefined) return true;
	if (flags["EMMY_QUEST"] >= 6) return true;
	if (flags["FAZIAN_QUEST_STATE"] == FAZIAN_QUEST_COMPLETE) return true;
	if (flags["FEDERATION_QUEST"] >= 3) return true;
	if (flags["IRELLIA_QUEST_STATUS"] >= 5) return true;
	if (flags["DISTRACTED_SHADE"] != undefined || flags["TRIPPED_ON_SHADE"] != undefined || flags["BETRAYED_KARA"] >= 1) return true;
	if (flags["KQ2_QUEST_FINISHED"] != undefined) return true;
	if (flags["NEVRIE_QUEST"] >= 2) return true;
	if (flags["SIERVA_LATEGOODBYE_RESPONSE"] == LIEVE_LATEGOODBYE_COMPLETE) return true;
	
	return false;
}
public function thyvaraAreTarkusStoriesOK():Boolean
{
	if (flags["AZRA_TARKUSED"] != undefined) return true;
	if (flags["BADGER_QUEST"] >= 3 || flags["BADGER_QUEST"] <= -3) return true;
	if (flags["PEXIGA_TREATMENT"] >= 1) return true;
	if (flags["DECK13_COMPLETE"] != undefined) return true;
	if (flags["SEXBOTS_SCANNED_FOR_COLENSO"] >= 4) return true;
	if (flags["KIMBER_QUEST"] >= 3) return true;
	if (flags["LANE_DISABLED"] != undefined) return true;
	if (flags["SHEKKA_ISSUES"] >= 7) return true;
	
	return false;
}
public function thyvaraAreUvetoStoriesOK():Boolean
{	
	if (flags["DRONED_UVIP F20"] != undefined && flags["DRONED_UVIP T6"] != undefined && flags["DRONED_UVIP V14"] != undefined && flags["DRONED_UVIP X34"] != undefined && flags["DRONED_UVIP L28"] != undefined) return true;
	if (flags["BEA_QUEST"] >= 4) return true;
	if (flags["TUUVA_SAVED"] >= 2) return true;
	if (flags["SYRIQUEST_STATE"] >= 21) return true;
	if (flags["WARGII_PROGRESS"] >= 3) return true;
	
	return false;
}