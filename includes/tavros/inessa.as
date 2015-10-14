/*Inessa and the Happy Tails
By JimThermic

Concept
 
This is a store located in Tavros Station, designed to provide PCs with a chance to pick upsex toys and items that potentially unlock sex scene options. E.g. Taur toys, collars and leads etc. 

The owner of the store, Inessa, is a Saeri -- a 'butterfly girl' and two-legged polymorph of the caterpillar-like Siel. Codex entry explains it. Tl;dr: caterpillar girls can sometimes turn into butterfly girls.*/

public function showInessa():void
{
	showName("\nINESSA");
	showBust("INESSA");
}

//First Visit Event
public function firstTimeHappyTail():void
{
	clearOutput();
	showInessa();
	author("JimThermic");
	output("Mere moments after you step through the door into the Happy Tails, there’s a loud 'wuh-PSHH' and you nearly jump out of your skin!");
	output("\n\nThere’s a little giggle from the distant counter as you calm yourself - it takes a few seconds for your mind to register it was the sound of a whip-crack door alarm.");
	output("\n\n<i>“Sorry, sorry!”</i> A light-hearted, silvery voice calls out, <i>“That noise can be a little shocking the first time, but it’ll grow on you.”</i>");
	output("\n\nFrom behind one of the racks, a smiling, blue-skinned butterfly-girl steps out. Her fae-like wings flitter behind her as she grins at you, star-like eyes glittering. The young woman’s soft breasts are brazenly on display; cuppable handfuls with delectable little nipples.  When your eyes travel downwards, however, they’re met with gilded silver and a big, obnoxious lock. She’s wearing a chastity belt! You notice the whole store is filled to the brim with sex gear of all persuasions.");
	output("\n\n<i>“So, what brings you to my store, stranger–?”</i> She melodically asks, multi-faceted wings fluttering behind her. <i>“... Or are you here for the view?”</i> She follows up by pressing her arms against the sides of her pert peaks and pushing them out. They’re small, but dangerous!");
	// New Page
	processTime(3);
	clearMenu();
	addButton(0,"Next",meetingHappyTailz);
}
public function meetingHappyTailz():void
{
	clearOutput();
	showInessa();
	author("JimThermic");
	//PC has never met a saeri:
	if(!CodexManager.entryUnlocked("Saeri"))
	{
		output("<i>“Browsing the Merchant’s Deck, thought I’d take a look in here,”</i> you answer at long last, looking up with great difficulty from her thrust out tits. <i>“");
		if(pc.isNice()) output("... Ahem! If you don’t mind me asking, what’s your species?");
		else if(pc.isMischievous()) output("I’ve never seen anything like you before, and I’m not just talking about your spectacular looks. Mind if I ask what you are?");
		else output("You... what exactly </i>are<i> you?");
		output("”</i>");

		//Nice:
		if(pc.isNice()) output("\n\n<i>“Oh, of course I don’t mind!”</i> The alien girl beams and stops pushing out her chest. <i>“I’m a saeri, though I was born a siel. We’re a polymorphic race, different forms, you know. You should have seen me back then–I was huuuge!”</i>");
		else if(pc.isMischievous()) output("\n\n<i>“You flatterer! I’m really not </i>that<i> special, you know-?”</i> The alien girl blushes and stops pushing out her chest. <i>“I’m a saeri, though I was born a siel. We’re a polymorphic race, different forms, you know. You should have seen me back then–I was huuuge!”</i>");
		else output("\n\n<i>“Mmm-? Besides a bored shop assistant?”</i> The alien girl blinks and stops pushing out her chest. <i>“... OH! I’m a saeri, though I was born a siel. We’re a polymorphic race, different forms, you know. You should have seen me back then–I was huuuge!”</i>");

		output("\n\n<i>“Anyway, my name’s Inessa, but you can call me ‘Nessa’ - everyone does! And if there’s anything you need, feel free to ask. I’d be happy to help!”</i>");
		output("\n\nYour codex informs you that it’s unlocked a new species entry on saeri. Perhaps you should give it a look–?");
		// Unlock Saeri codex entry.
		CodexManager.unlockEntry("Saeri");
	}
	// Not first time meeting Saeri:
	else
	{
		output("<i>“Browsing the Merchant’s Deck, thought I’d take a look in here,”</i> you answer at long last, looking up with great difficulty from her thrust out tits. <i>“");
		if(pc.isNice()) output("Mind if I ask your name?");
		else if(pc.isMischievous()) output("So, mind if I ask who those two belong to?");
		else output("... And you are?");
		output("”</i>");
		output("\n\n<i>“Oh, right! My name’s Inessa, but you can call me ‘Nessa’ - everyone does! And if there’s anything you need, feel free to ask. I’d be happy to help!”</i>");
	}
	flags["MET_INESSA"] = 1;
	inessaMenu();
}

public function inessaMenu():void
{
	clearMenu();
	addButton(0,"Appearance",inessaAppearance,undefined,"Appearance","Get a better look at the shopkeep.");
	addButton(1,"Buy",inessaBuyGo);
	addButton(2,"Talk",talkToInessaSlut);
	if(flags["INESSA_BEING_DOMMED"] == 1)
	{
		if(pc.lust() >= 33) addButton(3,"Order",inessaSexApproach);
		else addDisabledButton(3,"Order","Order","You aren't turned on enough to pursue some sex.");
	}
	else
	{
		if(pc.lust() >= 33) addButton(3,"Sex",inessaSexApproach);
		else addDisabledButton(3,"Sex","Sex","You aren't turned on enough to pursue some sex.");
	}
	addButton(14,"Leave",mainGameMenu);
}

//Happy Tails
public function happyTailsBonus():Boolean
{
	if(flags["MET_INESSA"] == undefined)
	{
		firstTimeHappyTail();
		return true;
	}
	output("You really couldn’t throw a stone in here without hitting a piece of BDSM gear or a sex toy. There’s an impressive array of whips and lashes lining the walls, no doubt where the store got its name.");
	output("\n\nIn the middle of the store is a dungeon’s worth of bondage furniture, from stocks to spanking horses. At the far end, there’s a bunch of risque clothing on racks–a lot of which are leather–and some changing rooms.");
	output("\n\nThe customer counter is very long, littered with small stands advertising the latest and greatest lubes.");

	//Random Message #1:
	if(rand(9) == 0) output("\n\nInessa is leaning back against said counter. She’s twirling her finger around a stray white lock, looking a little restless.");
	//Random Message #2:
	else if(rand(8) == 0) output("\n\nInessa is putting more stock on the shelves. Her eyes light up when she sees you enter the store, and she cheerily waves.");
	else if(rand(7) == 0) output("\n\nInessa is flipping through a generic fashion magazine with a flushed look on her face. <i>“I can’t believe people wear so... so </i>much<i> clothing... it’s so </i>depraved<i>...”</i>");
	//Random Message #4:
	else if(rand(6) == 0) output("\n\nInessa is leaning against the counter, crop in hand. She’s whacking it against her hand, testing the feel. Either that, or she likes the sound.");
	//Random Message #5:
	else if(rand(5) == 0) output("\n\nInessa is sitting at said counter, brushing her ass-long, silvery-white hair. Looks like it takes a lot of maintenance...");
	//Random Message #6:
	else if(rand(4) == 0) output("\n\nInessa is hanging some new lingerie on the racks and examining it. <i>“... Hum. Siel silk’s so comfortable and strong, but chameleon silk is getting popular...”</i>");
	//Random Message #7:
	else if(rand(3) == 0) output("\n\nInessa is dusting off some of the bondage furniture. She’s wandering around with a feather duster, busily working away.");
	//Random Message #8:
	else if(rand(2) == 0) output("\n\nInessa is just finishing off cleaning one of the leather spanking chairs with a cloth and wipe. In fact, all the leather items in the store look sleek and shiny.");

	//[Appearance] [Buy] [Talk] [Order] [Leave]
	//Bad JimT! Bad!
	// Order.tooltip: Issue commands to Inessa and order her around. She’s a sub, after all!
	addButton(0,"Inessa",approachIness);
	return false;
}

public function approachIness():void
{
	clearOutput();
	showInessa();
	output("You stride up to Inessa and get her attention.\n\n<i>\"if there’s anything you need, feel free to ask. I’d be happy to help!”</i>");

	inessaMenu();
}

//Appearance
public function inessaAppearance():void
{
	clearOutput();
	showInessa();
	author("JimThermic");
	output("You look at Inessa and she flushes in obvious delight. Her dusky blue cheeks turn a darker shade, and she nervously toys with a lock of her lustrous white hair. There’s a lot of it to play with, after all - it’s braided all the way down to her impeccably round rump.");
	output("\n\nHer excitement at being watched is obvious in the rapid rise and fall of her soft, slight breasts and the stiffness of her dimpled nipples. Her pert peaks, while not massive, still look like delicious little handfuls, easy to cup and tease.");
	output("\n\nBrilliant butterfly-like wings protrude from her shoulderblades, fae-like and multifaceted. As the light hits them, they shimmer and dance with scintillating colors. Almost as brilliant as her wings, Inessa’s bright blue-green eyes sparkle at you. Like all saeri eyes, they’re like colored stars exploding within a black-rimmed iris.");
	output("\n\nAlmost tragically, a silvery chastity belt guards her womanhood, fastened by a big lock. It’s the sort with tiny gaps, allowing for motion and breathing, and a T-shaped back that leaves her slender buttocks exposed.");
	output("\n\nOn her upper right arm, there is a beautiful tree-branch tattoo wrapped around it with cherry-blossoms blooming.");
	//Have viewed her talk topic about skin mods:
	if(flags["INESSA_SKIN_MOD_TALKED"] == 1) output(" There’s also another skin-modded tattoo between her shoulderblades, just four words written in fancy, looped letters: <i>“Love Me, Lash Me”</i>.");
	output("\n\nYou feel a little hornier for gazing at her. Given her burning cheeks, you’re not the only one.");
	pc.lust(4);
	// Raise lust by 5 for looking at nekkid girl.
	// Head back to Inessa’s main menu.
	inessaMenu();
	addDisabledButton(0,"Appearance","Appearance","You're looking at her right now.");
}

//Talk
// Upon the first time clicking talk, the following event plays:
public function talkToInessaSlut():void
{
	clearOutput();
	showInessa();
	author("JimThermic");
	//First Time Clicking Talk:
	if(flags["TALKED_TO_INESSA"] == undefined)
	{
		output("Just as you’re about to ask Inessa something, she tilts her head and peers at you. She seems <i>very</i> interested in your face all of a sudden...");
		output("\n\n<i>“... Hey, you’re... you look familiar. I’m sure we’ve never met, though,”</i> the snowy-haired saeri ponders aloud. She brings her fingers up to form a frame and places you in it. As soon as she does, her eyes light up in recognition.");
		output("\n\n<i>“Oh-my-Zyi! You’re [pc.fullName] - and you’re in my store!”</i> Inessa squeals, looking at you like you’re a celebrity. Well, you sort of <i>are</i>.");
		//SavedTarkus:
		if(flags["TARKUS_DESTROYED"] == undefined && flags["PLANET_3_UNLOCKED"] != undefined) output(" Especially after that Tarkus business.");
		else output(" At least, your father is.");
		output(" <i>“Aren’t, you, you know, supposed to be on some galactic race; not hanging out, buying whips in my store?”</i>");

		//Nice: 
		if(pc.isNice()) output("\n\nYou cough. That’s probably the first time someone’s brought up you dallying about on your bid for the family fortune. You feel slightly <i>chastised</i>. <i>“Hey, a " + pc.mf("guy","girl") + "’s got needs in deep space, you know?”</i>");
		else if(pc.isMischievous()) output("\n\n<i>“Who says the whip isn’t for extra motivation?”</i> You wittily retort, quirking a brow.");
		else output("\n\n<i>“Aren’t you supposed to be minding your own business?”</i> You bluntly reply, furrowing your brow.");

		output("\n\nRealizing her faux pas, Inessa blushes and nervously waves her six-fingered hands. <i>“Um, sorry! I wasn’t having a go. I, um, did I tell you I have a mouth, and sometimes I put my foot in it? It’s a bad habit of mine.”</i>");
		output("\n\nYou’re curious, so you ask her where Inessa saw you. Happy to switch the subject, the saeri girl hugs her waist.");

		output("\n\n<i>“Um... on the holonet news... about ");
		if(days < 2) output("a day");
		else if(days < 7) output("a few days");
		else if(days < 20) output("a week");
		else if(days < 50) output("a month or so");
		else if(days < 365) output("a few months");
		else if(days < 600) output("a year");
		else output("a few years");
		output(" ago?”</i> She thoughtfully answers.");
		output(" <i>“... Perhaps you want to buy something for when you defeat a rival? We’ve got a delightful selection of whips and floggers.”</i>");
		flags["TALKED_TO_INESSA"] = 1;
		processTime(3);
	}
	else output("What would you like to talk to her about?");
	clearMenu();
	//[Inessa] [Skin Mods] [Chastity.B] [Family]
	inessaTalkMenu(undefined);
}

public function inessaTalkMenu(arg:Function = undefined):void
{
	clearMenu();
	if(arg == inessaAboutInessa) addDisabledButton(0,"Inessa","Inessa","You just spoke about that.");
	else addButton(0,"Inessa",inessaAboutInessa,undefined,"Inessa","Ask her about herself.");
	if(arg == inessaSaeriTalk) addDisabledButton(1,"Saeri","Saeri","You just spoke about that.");
	else addButton(1,"Saeri",inessaSaeriTalk,undefined,"Saeri","Ask her about her race.");
	if(arg == skinModsInessa) addDisabledButton(2,"Skin Mods","Skin Mods","You just spoke about that.");
	else addButton(2,"Skin Mods",skinModsInessa,undefined,"Skin Mods","Ask her about her skin mods.");
	if(arg == chastityButt) addDisabledButton(3,"Chastity B.","Chastity Belt","You just spoke about that.");
	else addButton(3,"Chastity B.",chastityButt,undefined,"Chastity Belt","Ask her about her chastity belt... you just gotta!");
	//Family
	// Prereq: Must have viewed ‘Inessa’ talk topic.
	if(arg == inessaFamily) addDisabledButton(4,"Family","Family","You just finished discussing that.");
	else if(flags["INESSA_INESSAED"] == 1) addButton(4,"Family",inessaFamily,undefined,"Family","Ask her about her family.");
	else addDisabledButton(4,"Family","Family","You don't know her well enough to ask her about this. Maybe ask her about herself first.");
	addButton(14,"Back",inessaMenu);
}

//Inessa
public function inessaAboutInessa():void
{
	clearOutput();
	showInessa();
	author("JimThermic");
	//if First Time Clicking:
	if(flags["INESSA_INESSAED"] == undefined)
	{
		flags["INESSA_INESSAED"] = 1;
		output("You ask Inessa about herself. She hops up on the counter and swings her legs, looking at you with big, wide eyes.");
		output("\n\n<i>“W-what, you want to know about me?”</i> The snowy-haired girl asks, looking a little shocked. You nod.");
		output("\n\nInessa nervously reaches around and grabs the end of her ass-length braid, playing with the tip. <i>“... W-well, where to start? My name’s Inessa O’Anyalicia. I’m in retail, if you hadn’t guessed.”</i>");
		output("\n\n<i>“I’m minding the store; it’s not really mine. There’s not really a whole lot else to me. OH! I like skin mods and bondage. And if you hadn’t guessed, I’m a sub.”</i>");
		output("\n\nYou ask her if she has a [pc.master]. The young woman quickly shakes her head.");
		output("\n\n<i>“No, no [pc.master] to speak of. I’ve actually never had one - my sister");
		//Gildenmere nuked
		if(9999 == 0) output(" was ");
		else output("’s ");
		output(" a pro Domme though, so I’ve had a little bit of instruction. Other than that, I’m mostly untrained.”</i>");

		output("\n\nInessa claps her hands together and looks at you with glittering eyes. <i>“So, how about you? Are you a dominant, a sub, a switch–or maybe a bit vanilla...?”</i>");
		processTime(2);
		clearMenu();
		addButton(0,"Dom",domOrSwitchInessa,true,"Dom","You always like to be on top and in command.");
		addButton(1,"Sub",tellInessaAboutSubVanillaBullshit,true,"Sub","When it comes to sex, you like to be the one ordered around, not the one in charge.");
		addButton(2,"Switch",domOrSwitchInessa,false,"Switch","You’re able to sub or dom, you’re flexible like that.");
		addButton(3,"Vanilla",tellInessaAboutSubVanillaBullshit,false,"Vanilla","You’re just not into the whole BDSM thing - you prefer to have sex on equal terms, without all that powerplay business.");
		//[Dom] [Sub] [Switch] [Vanilla]
		//Dom.tooltip: You always like to be on top and in command.
		//Sub.tooltip: When it comes to sex, you like to be the one ordered around, not the one in charge.
		//Switch.tooltip: You’re able to sub or dom{me}, you’re flexible like that.
		//Vanilla.tooltip: You’re just not into the whole BDSM thing - you prefer to have sex on equal terms, without all that powerplay business.
	}
	else // Repeat Clicks:
	{
		output("You ask Inessa if she can tell you a little more about herself, and she blushes.");
		output("\n\n<i>“Um, there’s not really that much more to say, you know? I’m actually not all that interesting...”</i> she murmurs, her butterfly wings fluttering nervously. <i>“Maybe we could talk about you some, though–?”</i>");
		processTime(1);
		// Return to talk menu.
		inessaTalkMenu(inessaAboutInessa);
	}

}

//if [Dom] or [Switch]:
public function domOrSwitchInessa(dom:Boolean):void
{
	clearOutput();
	showInessa();
	author("JimThermic");
	// Mark PC off as Dominant for when talking to Inessa for future reference.
	if(dom) flags["INESSA_BDSM_SETTING"] = "dom";
	else flags["INESSA_BDSM_SETTING"] = "switch";
	output("<i>“Reeeallly-?”</i> Inessa’s eyes light up. <i>“... Are you a, you know, a ");
	if(dom) output("dominant");
	else output("switch");
	output(" who’s into girls? Like, specifically blue-skinned saeri girls? Just, you know, asking. For reasons.”</i>");
	output("\n\nThe snowy-haired submissive flirtatiously leans forward, pushing out her chest. She’s practically thrusting her delectable blue breasts right at you.");
	processTime(1);
	//[Yes] [No]
	clearMenu();
	addButton(0,"Yes",yesIllDomYouSlut);
	addButton(1,"No",noIDontDomDumbshits);
}

//If [Yes]:
public function yesIllDomYouSlut():void
{
	clearOutput();
	showInessa();
	author("JimThermic");
	output("<i>“Oh, I love blue-skinned saeri girls,”</i> you huskily declare, leaning forward and lightly brushing one of those pert little buds with a crooked finger.");
	output("\n\nInessa trembles with delight at your crooning words and touch, pressing her soft mounds against your fingers. You reach out and give one of her pert breasts a pointed squeeze. She lets out a cute little moan, practically melting on the spot.");
	output("\n\nJust as she’s getting all worked up, you pull back with a devilish grin. The alien girl lets out a needy little whine, looking at you with a longing gaze. <i>“...W-wuh... why’d you stop?”</i>");
	output("\n\n<i>“... More when I say, no sooner.”</i> You assert your authority in a firm, no-nonsense voice. Inessa shivers at your dominant tone, looking more than a little spellbound.");
	output("\n\n<i>“Y-yes, of course. Whatever you say,”</i> she meekly answers, gazing up at you through her long, dark lashes. Your " + pc.mf("Dom","Domme") + " sense tingles - you’re pretty sure if you ordered her to do something, she’d do it.");

	output("\n\n<b>Sex Menu Unlocked!</b>");
	flags["INESSA_BEING_DOMMED"] = 1;
	// Unlocks Sex Menu
	//YOU DON'T SAY?!?!?
	// Return to the talk menu.
	processTime(3);
	flags["INESSA_SEX_UNLOCKED"] = 1;
	inessaTalkMenu(inessaAboutInessa);
}

//else [No]:
public function noIDontDomDumbshits():void
{
	clearOutput();
	showInessa();
	author("JimThermic");
	output("You shake your head and Inessa pouts. <i>“Drat. You’re so good looking, I was really hoping you were.”</i>");
	output("\n\nShe lets out a sigh and hops off the bench. <i>“Well, guess it’s back to work for me. Can’t sit around all day, right?”</i>");
	flags["INESSA_SEX_UNLOCKED"] = 1;
	flags["INESSA_SHOT_DOWN"] = 1;
	// Unlock Sex Menu
	// Mark off a flag for having rejected her for future reference.
	// Return to the talk menu.
	processTime(1);
	inessaTalkMenu(inessaAboutInessa);
}

//[Sub] or [Vanilla]:
public function tellInessaAboutSubVanillaBullshit(sub:Boolean):void
{
	clearOutput();
	showInessa();
	author("JimThermic");
	// Mark PC off as Not Dominant for when talking to Inessa.
	if(sub) flags["INESSA_BDSM_SETTING"] = "sub";
	else flags["INESSA_BDSM_SETTING"] = "vanilla";
	output("You shake your head and Inessa pouts. <i>“Drat. You’re so good looking, I was really hoping you were a dominant, or at least a switch.”</i>");
	output("\n\nShe lets out a sigh and hops off the bench. <i>“Well, guess it’s back to work for me. Can’t sit around all day, right?”</i>");
	// Return to the talk menu.
	processTime(1);
	inessaTalkMenu(inessaAboutInessa);
}

//Saeri
public function inessaSaeriTalk():void
{
	clearOutput();
	showInessa();
	author("JimThermic");
	//First Time Clicking:
	if(flags["INESSA_SAERIED"] == undefined)
	{
		//PC hasn’t read Saeri Codex Entry:
		if(CodexManager.entryViewed("Saeri"))
		{
			output("Inessa mentioned something about being much larger once. You joke that she didn’t used to be a gigantic caterpillar, right?");
			output("\n\n<i>“Sure was!”</i> Inessa jokes back. Until you realise she’s not joking–she’s actually serious.");
			output("\n\n<i>“You’ve got to be pulling my leg...”</i> you remark, quirking a brow.");
			output("\n\nSaeri pouts. <i>“I’m serious. I mean, I wasn’t </i>really<i> a gigantic caterpillar who turned into a butterfly girl–that’s just the easiest way to explain it to non-siel. It’s less of a headache than ‘I underwent polymorphic holometamorphosis’.”</i>");
		}
		//If Read Saeri codex entry:
		else
		{
			output("You’ve read the codex entry on the saeri, but you just have to ask–did Inessa seriously used to be a siel?");
			output("\n\n<i>“Sure was!”</i> Inessa exclaims, flitting her wings. <i>“Your dad’s terran, right? I’ve found the easiest way to explain it to terrans is to say we’re like caterpillars and butterflies. I used to look like a gigantic blue caterpillar back when I was a siel. Now I’m saeri, and I look like a beautiful butterfly.”</i>");
		}
		output("\n\nYou remark how odd it is that two species on different worlds have evolved so similarly. Inessa grins and wiggles a finger.");
		output("\n\n<i>“You say that, but we have an animal species </i>just<i> like humans on my home planet. They’re called yorri. Same pastel eyes, achromatic skin, even your genitals are the same. To our eyes, humans look just like yorri–but it’s a bit rude to compare a thinking species to an animal one, you know?”</i>");
		output("\n\nYou ask Inessa when she became a saeri–was it voluntary?");
		output("\n\n<i>“As soon as I hit puberty, I decided to undertake the change. I was a terrible silk-weaver, so I didn’t lose out much. Plus, most of the galaxy is made for smaller bipeds, you know? Being able to fly is fun too–though I don’t get much chance to on a space station, obviously.”</i>");
		flags["INESSA_SAERIED"] = 1;
	}
	else // Not first time:
	{
		output("<i>“Anything else you can tell me about your species?”</i> you ask, and Inessa shakes her head.");
		output("\n\n<i>“Not off the top of my head–there’s not really that much more to tell, you know? Tell me about </i>yours<i>. What’s it like being a [pc.race]–?”</i>");
		output("\n\nYou tell her a bit about about being a [pc.race], and she seems fascinated. Once you’re done talking, she looks at the time and gulps. <i>“Whoops... I was meant to be on the clock, but I got distracted by your story. I should really get back to work!”</i>");
	}
	processTime(4);
	inessaTalkMenu(inessaSaeriTalk);
}

//Skin Mods
public function skinModsInessa():void
{
	clearOutput();
	showInessa();
	//if First time clicking:
	if(flags["INESSA_SKIN_MOD_TALKED"] == undefined)
	{
		flags["INESSA_SKIN_MOD_TALKED"] = 1;
		output("You ask Inessa about the tattoo-like skin mods she’s got. A thrilled expression brightens up her face. She can’t show you her upper arm quickly enough.");
		output("\n\n<i>“Here, take a look!”</i>");
		output("\n\nYou inch closer. Wrapped around her shoulder and upper arm is a beautiful tree-branch tattoo adorned with white blooming cherry blossoms. Now that you’re closer, you swear you can smell something floral, maybe a perfume?");
		output("\n\n<i>“It’s not perfume,”</i> Inessa answers your unspoken question, grinning a little. <i>“The smell is part of the skin mod. Same with the feel. Go on, touch it! I don’t mind.”</i>");
		output("\n\nDefinitely an exhibitionist, you confirm. Reaching out, you brush your fingers along her shoulder. Her dusky blue skin is so <i>soft</i> and <i>smooth</i>, you almost lose yourself just touching it.");
		output("\n\n<i>“Very soft and lovely. I love the feel,”</i> you state. As if you’d made a joke, Inessa giggles and taps the blossoms of her genetic tattoo.");
		output("\n\n<i>“... Not my skin, silly. Touch the flowers!”</i> She exclaims. Her blue cheeks are flushed and you can feel her skin prickling beneath your fingertips. She must <i>really</i> enjoy being touched.");
		output("\n\nCorrecting your mistake, you brush your fingers against one of the white flower blossoms. You’re surprised to feel her skin texture change - it’s silky there, just like a rose petal!");
		output("\n\n<i>“Amazing! Must have been quite the skin modder,”</i> you genuinely exclaim. Getting such accurate detail in her genetics must have taken skill, time, and money.");
		output("\n\n<i>“She is, though half of it is genetic advantage. My species takes very well to gene mods,”</i> Inessa explains, turning her back to you and gesturing to her smooth upper back. <i>“... See, I got this one done yesterday, and you can hardly tell - no inflammation or anything!”</i>");
		output("\n\nShe lifts up her silvery-white hair braid so you can see it better. You spot a tattoo between her shoulder blades with just four words written in fancy, looped letters: ‘Love Me, Lash Me”</i>.");
		output("\n\n<i>“... Is that a request-?”</i> You ask, quirking a brow.");
		output("\n\nThe alien girl blushes, letting go of her braid. <i>“Whoops, I didn’t realise how that came across! I, um, I really was just showing you my skin mods.”</i> She then leans back and looks up at you, her soft blue-green eyes shining. <i>“...Unless, of course, you wanted it to be-?”</i>");
		output("\n\n<i>“You know... if you wanted to... love and lash me.”</i>");
		output("\n\nHer kissable lips are slightly parted, hovering very close to yours. You can feel her gentle breath warmly brushing over your own mouth, her breathing hurried and heated.");
		output("\n\nThe sweet smell of flowers fill the air. The electricity is palpable. Do you kiss her-?");
		processTime(5);
		pc.lust(15);

		//[Inch Closer] [Pull Back]
		clearMenu();
		addButton(0,"Inch Closer",inessaKissyFaceCloser);
		addButton(1,"Pull Back",pullBackFromKissyFace);
	}
	else //Repeat Clicks:
	{
		output("You ask to see her skin mods again. The saeri excitedly shows them to you, happy to give you another look.");
		output("\n\nWrapped around her shoulder and upper arm is a beautiful tree-branch tattoo adorned with white blooming cherry blossoms. It smells floral–you now know that’s a part of the skin mod.");
		output("\n\nReaching out, you brush your fingers against one of the white flower blossoms. The texture feels just as soft and silky as a rose petal.");
		output("\n\n<i>“Amazing! Must have been quite the skin modder,”</i> you genuinely exclaim. Getting such accurate detail in her genetics must have taken skill, time, and money.");
		output("\n\n<i>“She is, though half of it is genetic advantage. My species takes very well to gene mods,”</i> Inessa explains, turning her back to you and gesturing to her smooth upper back. You spot a tattoo between her shoulder blades with just four words written in fancy, looped letters: ‘Love Me, Lash Me”</i>.");
		// Return to talk menu.
		processTime(3);
		inessaTalkMenu(skinModsInessa);
	}

}

//[Inch Closer]:
public function inessaKissyFaceCloser():void
{
	clearOutput();
	showInessa();
	author("JimThermic");
	output("You move forward, as if pulled in by the irresistible gravity of her sweet lips. Her dark lashes flutter in hurried anticipation. Her breathing quickens. And just as you move to seal your lips against hers...");
	output("\n\n<i>Wuh-PSHHH!!</i>");
	output("\n\n... Both of you nearly jump out of your skin at the sound of the store’s door alarm going off. Turning your heads, there’s a leather-clad Ausar woman leading a human girl by a leash.");
	output("\n\n<i>“Hello there, dear! I presume you’re open...?”</i> The doggy domme asks, tilting her head. <i>“... Or, did I interrupt something between you and your [pc.Master]?”</i>");
	output("\n\n<i>“U-um, n-no... and [pc.heShe]’s not my [pc.Master],”</i> Inessa breathily responds, reluctantly pulling back from you. There’s a longing look in her eyes.  <i>“... I-I’ll be with you right away, ma’am.”</i>");
	output("\n\nWith one last wistful look at you, the silver-haired sub skips over to the impatient looking customer. It seems your moment was spoiled by an unlocked door!");
	processTime(4);
	// Return to talk menu.
	inessaTalkMenu(skinModsInessa);
}

//Pull Back:
public function pullBackFromKissyFace():void
{
	clearOutput();
	showInessa();
	author("JimThermic");
	output("Not wanting to get into that kind of relationship - or just feeling like teasing her - you pull back, leaving the silver-haired sub with a dopey look of confusion in her eyes.");
	output("\n\n<i>“... Eh? Guess not.”</i> She pouts a little and spins around. Leaning back against the counter, there’s now an awkward silence.");
	output("\n\nAfter a while, Inessa coughs and hugs her waist. <i>“Um, so is there anything else you wanted to talk about?”</i>");
	processTime(2);
	// Return to talk menu.
	inessaTalkMenu(skinModsInessa);
}

//Chastity Belt
public function chastityButt():void
{
	clearOutput();
	author("JimThermic");
	showInessa();
	//First time
	if(flags["INESSA_BELTED"] == undefined)
	{
		flags["INESSA_BELTED"] = 1;
		output("... You just <i>have</i> to ask.");
		//Nice: 
		if(pc.isNice()) output("<i>“Why are you wearing a chastity belt?”</i> You ask");
		else if(pc.isMischievous()) output("<i>“I noticed your nethers are locked up tighter than a stellar-class vault.”</i> You observe");
		else output("<i>“What’s with the chastity belt?”</i> You bluntly state,");
		output(" gesturing at the silvery metal protecting her luscious loins.");

		output("\n\nInessa blushes and interlaces her fingers. <i>“... Um, you really want to know about that?”</i>");
	}
	else // Not first time clicking:
	{
		output("You’ve forgotten, so you ask again. Why is Inessa wearing a chastity belt exactly?");
		output("\n\nShe blushes and interlaces her fingers. <i>“... Wha–you forgot? You really want me to explain it all over again again?”</i>");
	}
	output("\n\nYou nod.  Inessa takes a deep breath before spilling the beans. <i>“... I may have put it on. By accident. A customer asked me to try it on, so I did. They wanted to see it locked, and I thought, ‘that’s okay, I’ve got the key’.”</i>");
	output("\n\n<i>“Thing is, I didn’t. I still don’t. I’ve turned this store upside down looking for the key, and I can’t find it </i>anywhere<i>.”</i>");
	output("\n\nYou ask about getting it removed by other means, like a locksmith. Surely there’s other means?");
	output("\n\n<i>“You’d think, but this is the deluxe edition. It’s made of the same stuff that goes into spaceship hulls. The lock is just as bad; it looks low tech, but it’s actually top notch.”</i>");
	//Pc is smuggler:
	if(pc.characterClass == GLOBAL.CLASS_SMUGGLER) output("\n\nYou look at the chastity belt, thinking about your lockpicks... and you’re forced to agree. Damn. That’s a lock even <i>you’d</i> be hard pressed to crack.");
	output("\n\nInessa gives you a plaintive look, eyes glittering. <i>“... If you see a key anywhere, tell me, okay? I really want to get off... I mean, get it off!”</i>");
	output("\n\nGiven her freudian slip, you suspect Inessa has not been able to properly play with herself for quite some time.");

	processTime(4);
	//Return to Talk Menu.
	inessaTalkMenu(chastityButt);
}

//Family
// Prereq: Must have viewed ‘Inessa’ talk topic.
public function inessaFamily():void
{
	clearOutput();
	showInessa();
	author("JimThermic");
	//GildenmereGotNuked:
	if(9999 == 0)
	{
		output("You ask Inessa about her sister, since you vaguely remember her saying she was a pro Domme. The butterfly-winged girl’s expression clouds over and her eyes tear up. She sniffles loudly and wipes her eyes.");
		output("\n\n<i>“U-u-uh... yeah...s-she </i>was<i>... y-you h-hear about that rush planet that got nuked? Myrellion? M-my big sister was on it. S-she had a clothing store...”</i> At this point, the storekeeper gets all choked up, then pups her face in her tiny hands. Unable to hide her grief, her body is wracked by wing-shaking sobs. <i>“... I-I’m s-sorry, c-can we talk about something else–?”</i>");
		output("\n\nInessa weepily grabs a hand cloth and wipes her eyes. She appears to be trying to calm herself down, taking long, deep breaths in an effort to not hyperventilate. Perhaps it’s best <not to mention you were responsible for the death of her sister.");
	}
	//Else // You didn’t commit genocide, good for you!:
	else
	{
		//First Time clicking:
		if(flags["INESSA_FAMILYED"] == undefined)
		{
			flags["INESSA_FAMILYED"] = 1;
			output("You ask Inessa about her sister, since you vaguely remember her saying she was a pro Domme.");
			output("\n\nInessa smiles and leans back against the counter. <i>“Oh, yeah, I’ve got a </i>lot<i> of siblings. Twenty-four, in fact. My species generally have big families–well, at least compared to the uplifted ones.”</i>");
			output("\n\n<i>“I’m the twentieth daughter, one of the youngest. Most of them still live and work on Xhixia; that’s the siel and saeri home world. They’re pretty high-brow.”</i>");
			output("\n\n<i>“High brow? And they let their daughter run a sex store?”</i> You ask, a little puzzled.");
			output("\n\n<i>“Of course! Bondage is a noble profession among my species, even if it’s just selling the goods. My sister actually owns the store and makes the goods.”</i>");
			output("\n\nYou ask her if her sister lives on Tavros, since you haven’t seen her about. The saeri shopkeeper shakes her head.");
			output("\n\n<i>“No. Xanthe’s running a second store over on Myrellion - some boonie planet full of honey-filled ant girls - Zyi knows </i>why<i>.”</i> Inessa self-consciously touches her modest bust and pouts, <i>“... I hear they’ve all got melon-sized tits. Personally, I don’t see the appeal.");
			if(pc.biggestTitSize() >+ 5) output(" I-I mean, not that there’s anything wrong with </i>your breasts-!”<i> She hastily adds.");
			output("”</i>");

			//Met Xanthe Before:
			if(flags["MET_XANTHE"] != undefined)
			{
				output("\n\nYou’re more caught up on the name. <i>“... Xanthe? As in, Silken Serenity Xanthe?”</i> You’re more than a little gobsmacked. What are the chances of running into her sister, several star-systems away?");
				output("\n\n<i>“Oh, you’ve met my sister?”</i> It’s Inessa’s turn to look stunned. <i>“... Wow, what are the odds? That’s crazy-!”</i>");
				output("\n\n<i>“She didn’t, you know, tie you up and do anything </i>weird<i> to you, did she? She’s been tying me up at the drop of a hat since I was little. Once, I stole one of her holo-novels, and she hung me from the roof for </i>days<i>.”</i>");
				//You’re Xanthe’s Sub:
				if(xantheIsDommingPC())
				{
					output("\n\nYou blush and tell her you’re actually her sister’s sub. Upon hearing that, Inessa claps her hands, looking thrilled.");
					output("\n\n<i>“That’s fantastic! Wow, you must have really caught her eye - my sister is really picky about her submissives. Guess that makes you, like, almost family, huh?”</i>");
				}
				else // Not Xanthe’s Sub:
				{
					output("\n\nYou shake your head. Being hung up by Xanthe is not something you’ve experienced, though you have no doubt the thought has crossed her older sister’s mind.");
					output("\n\n<i>“You know about siel mating habits, right? If she offers, I’d make sure you’ve got the rest of the week free,”</i> Inessa winks. <i>“... You’ll need that long to get your ability to walk back. We saeri are </i>much<i> gentler.”</i>");
				}
			}
		}
		else // Repeat Scene:
		{
			output("You’ve forgotten, so you ask Inessa about her siblings again.");
			output("\n\n<i>“Again–? Well, I’ve got a ton of siblings. Twenty-four, in fact. My species generally have big families–well, at least compared to the uplifted ones.”</i>");
			output("\n\n<i>“I’m the twentieth daughter, one of the youngest. Most of them still live and work on Xhixia; that’s the siel and saeri home world. They’re pretty high-brow.”</i>");
			output("\n\n<i>“My sister, Xanthe, runs a second store on Myrellion–some boonie planet full of honey-filled ant girls. I have no idea why she opened one there, of all places; I hear the whole place is about to fall apart.”</i>");
		}
	}
	inessaTalkMenu(inessaFamily);
}

//Buy
public function inessaBuyGo():void
{
	clearOutput();
	showInessa();
	author("JimThermic");
	shopkeep = chars["INESSA"];
	shopkeep.keeperBuy = "You tell Inessa that you’d like to buy something. She beams and brings up a holographic stock guide.\n\n<i>“Sure! What would you like - clothes, sex gear, something else..?”</i>";
	//Have biowhip if gotten to Myrellion.
	if(flags["PLANET_3_UNLOCKED"] != undefined && !chars["INESSA"].hasItem(new BioWhip()))
	{
		chars["INESSA"].inventory.push(new BioWhip());
	}
	//Else no whip
	else chars["INESSA"].destroyItem(new BioWhip());
	//[Sex Gear] [Clothes] [Other]
	buyItem();
}
/*Sex Gear
public function inessaSexGearGo():void
{
	clearOutput();
	showInessa();
	author("JimThermic");
	shopkeep = chars["INESSA"];
	shopkeep.keeperBuy = "<i>“Sex gear!”</i> She swipes the air, bringing up a range of floating holographic items. <i>“... We’ve got quite a few in stock. Take your pick!”</i>";
	
	// change her inventory then call shop menu.
}*/

//Clothing
public function inessaClothingGo():void
{
	clearOutput();
	showInessa();
	author("JimThermic");
	shopkeep = chars["INESSA"];
	shopkeep.keeperBuy = "<i>“Clothing? Sure thing!”</i> Inessa swipes the air. Suddenly, a life-sized holographic model appears. There’s drag and drop options for clothes. <i>“What were you thinking about...?";
	//[MaidO.] [L.Harness] [LtxBdy] [S.Pirate O.] [Chr.Ldr.] 
	//[Bunny.O] [S.Girl O.]
	/* All seven outfits below currently coded and ready to go in as of the Bess Update:
	Maid Outfit
	Leather Strap Harness 
	Latex Bodysuit
	Space Pirate Outfit
	Cheerleader Outfit
	Bunny Girl Outfit
	Schoolgirl Outfit
	*/
}
/*
//Other
public function iness

"Something else then? What did you have in mind?" 

[Whip] [Allure] [Chaste] [*Bio Whip] 

// * Unlocked when PC has reached Myrellion

Whip

this._latestVersion = 1;
this.quantity = 1;
this.stackSize = 1;
this.type = GLOBAL.MELEE_WEAPON;
this.shortName = "Whip";
this.longName = "bullwhip";
this.description = "a single-tailed bullwhip";
this.tooltip = "This simple, single-tailed bullwhip is made from black, braided leather. It's length, flexibility, and tapered design allows it to be thrown in such a way that part of the whip can exceed the speed of sound, letting out a small sonic boom in the form of a satisfying 'crack'. Very accurate, but deals very little real damage compared to modern weapons. Still favored among adventuring archeologists.";
this.attackVerb = "whip";
attackNoun = "whip";
this.basePrice = 250;
this.attack = 5;
baseDamage.kinetic.damageValue = 2;
this.defense = 0;
this.shieldDefense = 0
this.shields = 0;
this.sexiness = 1;
this.evasion = 0;
this.fortification = 0;




Allure

this.quantity = 1;
this.stackSize = 1;
this.type = GLOBAL.ACCESSORY;
this.shortName = "Allure";
this.longName = "Allure brand pheromonal body spray";
this.description = "a pheromonal body-spray";
this.tooltip = A shining can of 'Allure' brand body spray. It's a pheromonal agent, designed from the mating smells of some of the most alluring species in the galaxy. Branded for men, women, and anything inbetween, its slogan reads <i>The Power of Allure</i>. A warning label informs you the wearer is not immune from the intoxicating effects of the pheromones. That probably explains why it sells so well.
resistances.drug.resistanceValue = -20.0;
resistances.pheromone.resistanceValue = -20.0;
resistances.tease.resistanceValue = -20.0;
resistances.psionic.resistanceValue = -20.0;
this.attackVerb = "null";
this.basePrice = 750;
this.attack = 0;
this.defense = 0;
this.shieldDefense = 0;
this.shields = 0;
this.sexiness = 3;
this.critBonus = 0;
this.evasion = 0;
this.fortification = 0;
// + Increases PC's libido by 20 while equipped.


Chaste

this.quantity = 1;
this.stackSize = 1;
this.type = GLOBAL.ACCESSORY;
this.shortName = "Chaste";
this.longName = "Chase brand aversion spray";
this.description = "a lust inhibiting body-spray";
this.tooltip = A green can of 'Chaste' brand sexual repulsant. The can contains pheromones designed to inhibit any species sexual drive and avoid unwanted sexual advances. The contents are sprayed on the body like a deodorant. Strangely enough, it doesn't actually smell of anything, but just wearing it causes those nearby not to think of you in a sexual fashion. A warning label informs you the wearer is not immune from the lust inhibiting effects of the pheromones. No wonder it's called 'Chaste'.
resistances.drug.resistanceValue = 20.0;
resistances.pheromone.resistanceValue = 20.0;
resistances.tease.resistanceValue = 20.0;
resistances.psionic.resistanceValue = 20.0;
this.attackVerb = "null";
this.basePrice = 750;
this.attack = 0;
this.defense = 0;
this.shieldDefense = 0;
this.shields = 0;
this.sexiness = -10;
this.critBonus = 0;
this.evasion = 0;
this.fortification = 0;
// + Reduces PC's libido by 20 while equipped.

Bio Whip

*/


//Sex
// Sex Menu unlocks if PC views the 'Inessa' talk topic.
// The responses in the Inessa Talk topic determine her reactions, listed below.
public function inessaSexApproach():void
{
	clearOutput();
	showInessa();
	author("JimThermic");
	//if PC rejected her in the Talk Topic:
	if(flags["INESSA_SHOT_DOWN"] != undefined)
	{
		output("You bring up the topic of sex with Inessa, and her wings and eyelashes flutter with obvious confusion. <i>“I-I thought you said you weren’t interested? Did something change your mind–?”</i> she asks.");
		processTime(1);
		//[Yes] [No]
		clearMenu();
		addButton(0,"Yes",yesInessaIveChangedMyMind);
		addButton(1,"No",noYoureASlut);
	}
	//else if PC picked something Not Dominant in the talk topic:
	else if(flags["INESSA_BEING_DOMMED"] != 1)
	{
		output("You ask Inessa if she’d be up for some fooling around, and she squirms awkwardly on the spot, butterfly wings fluttering madly.");
		output("\n\n<i>“U-um, I don’t really want to offend you, but I’m only into dominant types. I like having my hair pulled, or told what to do instead of asked. D-doing it vanilla style would be really lewd, and I’m just not that kind of girl!”</i> the saerie girl exclaims, hiding her blushing face behind her tiny hands. <i>“... I-I mean, doing it without ropes or blindfolds is something I’d only do with my " + pc.mf("husband and Master","wife and Domme") + " when we’re married, y-you know?”</i>");
		output("\n\nDo you change your mind on being her Dominant?");
		processTime(2);
		//[Yes] [No]
		clearMenu();
		addButton(0,"Yes",yesIllDomYouInessa);
		addButton(1,"No",noThanksInessaIDontDommmmmmm);
	}
	else // PC is marked as dominant and rejection flag is unticked:
	{
		output("What do you order Inessa to do?");
		//[Blowjob] [Cunni] [TitFuck]
		// Blowjob.tooltip: Order Inessa to give you a blowjob -- right here, right now. 
		// Cunni.tooltip: Hop on the counter and get her to lick out your pussy. 
		// BreastTease: Tease her breasts and lick up the resulting juices!
		inessaSexMenu();
	}
}

//Yes:
public function yesInessaIveChangedMyMind():void
{
	clearOutput();
	showInessa();
	author("JimThermic");
	output("<i>“I’ve come to appreciate blue-skinned saeri girls, I was thinking about getting one for myself. One like you, perhaps,”</i> you huskily declare, leaning forward and lightly brushing one of those pert little buds with a crooked finger.");
	output("\n\nInessa trembles with delight at your crooning words and touch, pressing her soft mounds against your fingers. You reach out and give one of her pert breasts a pointed squeeze. She lets out a cute little moan, practically melting on the spot.");
	output("\n\nJust as she’s getting all worked up, you pull back with a devilish grin. The alien girl lets out a needy little whine, looking at you with a longing gaze. <i>“...W-wuh... why’d you stop?”</i>");
	output("\n\n<i>“... More when I say, no sooner.”</i> You assert your authority in a firm, no-nonsense voice. Inessa shivers at your dominant tone, looking more than a little spellbound.");
	output("\n\n<i>“Y-yes, of course. Whatever you say,”</i> she meekly answers, gazing up at you through her long, dark lashes. Your " + pc.mf("Dom","Domme") + " sense tingles - you’re pretty sure if you ordered her to do something, she’d do it.");
	// Untick rejection flag.
	flags["INESSA_SHOT_DOWN"] = undefined;
	flags["INESSA_BDSM_SETTING"] = "dom";
	flags["INESSA_BEING_DOMMED"] = 1;
	// Return to her follower menu.
	processTime(4);
	inessaMenu();
}

public function noYoureASlut():void
{
	clearOutput();
	showInessa();
	author("JimThermic");
	output("<i>“So mean, getting my hopes up like that!”</i> Inessa pouts.");
	processTime(1);
	inessaMenu();
}


//Yes:
public function yesIllDomYouInessa():void
{
	clearOutput();
	showInessa();
	author("JimThermic");
	output("<i>“I’ve changed my mind on being a Dominant. I’ve been taking the lead lately, and I have to say, I like it,”</i> you declare, giving her a steely, intense stare. Inessa trembles with delight under your gaze, stepping forward and pressing herself shyly against you.");
	output("\n\n<i>“...Ruh-really? I hear that can happen. People’s preferences aren’t always static, you know... fetishes, sexual orientation, even gender... it’s not always like two sides of a door.”</i> Inessa blushes, pressing her soft mounds against you. You reach up and give one of her pert breasts a pointed squeeze. She lets out a cute little moan, practically melting on the spot.");
	output("\n\nJust as she’s getting all worked up, you pull back with a devilish grin. The alien girl lets out a needy little whine, looking at you with a longing gaze. <i>“...W-wuh... why’d you stop?”</i>");
	output("\n\n<i>“... More when I say, no sooner.”</i> You assert your authority in a firm, no-nonsense voice. Inessa shivers at your dominant tone, looking more than a little spellbound.");
	output("\n\n<i>“Y-yes, of course. Whatever you say,”</i> she meekly answers, gazing up at you through her long, dark lashes. You’re pretty sure if you ordered her to do something, she’d do it.");
	// Unmark PC as Not Dominant, mark them instead as Dominant.
	flags["INESSA_BDSM_SETTING"] = "dom";
	flags["INESSA_BEING_DOMMED"] = 1;
	// Return to her follower menu.
	processTime(4);
	inessaMenu();
}

//No:
public function noThanksInessaIDontDommmmmmm():void
{
	clearOutput();
	showInessa();
	author("JimThermic");
	output("You decide to leave things as they are. She seems to really want a Dominant, and that's just not your thing.");

	// Return to her follower menu.
	inessaMenu();
}

//Sex Scenes (Inessa)
public function inessaSexMenu():void
{
	clearMenu();
	//Blowjob
	// PC must have a cock bigger than 4 inches.
	// PC must have a cock with a girth smaller than a coke can(?)
	// PC must not be empty of cum (You're too tapped out, d00d). 
	if(pc.hasCock() && pc.longestCockLength() >= 4 && pc.cumQ() >= 6) addButton(0,"Blowjob",blowjobFromInessa,undefined,"Blowjob","Get your dick sucked.");
	else if(pc.cumQ() < 6) addDisabledButton(0,"Blowjob","Blowjob","You're tapped out. Give yourself a time to recover - and refill.");
	else addDisabledButton(0,"Blowjob","Blowjob","You need a dick 4 inches or more to have her suck.");
	// PC has a pussy
	// PC has two legs to spread
	// PC has front genitals
	// PC is not a taur.
	if(pc.hasVagina() && pc.legCount > 1 && !pc.isTaur()) addButton(1,"GetLicked",cunnilingusInessa,undefined,"GetLicked","Have her put her mouth to better use.");
	else if(pc.isTaur()) addDisabledButton(1,"GetLicked","GetLicked","Centaur-like creatures cannot use this scene.");
	else if(pc.hasVagina()) addDisabledButton(1,"GetLicked","GetLicked","You need more than 1 leg to participate in this act.")
	else addDisabledButton(1,"GetLicked","GetLicked","You need a vagina in order to do this.");
	//Breast Tease
	// No Taurs. That’s it.
	if(!pc.isTaur()) addButton(2,"BreastTease",breastTeaseInessaShit,undefined,"BreastTease","Tease the subbie little fuckterfly's boobs.");
	addButton(14,"Back",noYoureASlut);
}



//Blowjob
// PC must have a cock bigger than 4 inches.
// PC must have a cock with a girth smaller than a coke can(?)
// PC must not be empty of cum (You're too tapped out, d00d). 
public function blowjobFromInessa():void
{
	clearOutput();
	showInessa();
	author("JimThermic");
	output("You ");
	if(pc.legCount > 1) output("stride up");
	else output("shift");
	output(" until you’re standing a few feet short of the snowy-haired sub. Once there, you level a stern gaze at her, and cough under your breath.");
	output("\n\nThe moment Inessa looks into your eyes, she freezes on the spot, a doe-like look in her glittering eyes. <i>“U-um, can I help you?”</i> She nervously stammers out, clutching her hands together between her petite sized breasts.");
	output("\n\n<i>“Down. On your knees,”</i> you order her, staring her down. It’s as if you command gravity with your eyes. Slowly, as if pushed down by this great force, Inessa drops down to the ground. Once there, she looks up at you, a lost look in her innocent eyes. <i>“...Now, suck my cock.”</i>");
	output("\n\nInessa’s eyes widen and her jaw drops. There’s a visible gulp as she chances a look at ");
	if(pc.isCrotchGarbed()) output("your notable bulge");
	else output("your lewdly hanging [pc.cocksNounSimple]");
	output(". She squirms on the spot, looking like she really wants to get out of this, but is for whatever reason unwilling to defy your command. Instead, she tries to reason with you, looking up with big, bright eyes. <i>“Y-you seriously want me to suck ");
	if(pc.cockTotal() == 1) output("it");
	else output("those");
	output("... but what if a customer comes in?”</i> Inessa asks. She glances at the door, her butterfly wings flitting.  She seems to think that if she looks up you with wavering eyes, you’ll let her off the hook!");

	output("\n\nWell, two can play at that game. You throw on your best dissapointed face and let out a long sigh. <i>“Oh, well, here you were flirting with me, thrusting out that tiny chest, saying you wanted a  " + pc.mf("Dom","Domme") + ". I guess that was all a lie. I mean, if you can’t do something as simple as suck my [pc.cocksNoun]...”</i>");
	output("\n\nInessa’s eyes shoot wide open, shocked at her plan to manipulate you backfires. <i>“–N-no! I’ll suck ");
	if(pc.cockTotal() == 1) output("it");
	else output("them");
	output("... please let me suck your cock");
	if(pc.cockTotal() > 1) output("s");
	output("!”</i> she breathily begs. You nod your assent");
	if(!pc.isCrotchGarbed())
	{
		output(", pulling ");
		if(pc.cockTotal() == 1) output("it");
		else output("them");
		output(" out");
	}
	output(". With blushing cheeks, the butterfly girl wraps her delicate fingers around the base of ");
	if(pc.cockTotal() == 1) output("your freshly exposed dick");
	else output("one of your exposed dicks");
	output(" and lightly grips");
	if(pc.hasKnot(x)) output("your knot");
	else output("it");
	output(". She lightly jerks you off, marvelling as your [pc.cockColor " + x + "] rod rises to attention in small spurtive jumps, your [pc.cockHeadNoun " + x + "] swelling with arousal. Her eyes dreamily flutter, and as if in a trance, she leans forward and gives it a sultry lick. The submissive girl’s eyes flicker up to you afterwards, her pink tongue still on your sensitive flesh; is she seeking your approval–?");
	output("\n\n<i>“You’re going to have to try harder than </i>that<i>,”</i> you " + pc.mf("gruffly","huskily") + " declare. Flushing with embarrassment, Inessa jerks ");
	if(pc.cockTotal() == 1) output("it more enthusiastically and wraps her soft silky lips around your [pc.cockHead " + x + "]");
	else if(pc.cockTotal() == 2) output("your twin");
	else output("two of your");
	if(pc.cockTotal() >= 2) output(" cocks off as she wraps her soft silky lips around one of your [pc.cockHeads]");
	output(". She wetly lashes underneath it with her tongue, pressing into every groove, coaxing it to give up your hot, [pc.cumFlavor] fluid. As she titillates your throbbing tool, you let out a groan of ecstasy, scintillating pleasure now coursing up from your loins. You find yourself instinctively thrusting your [pc.cock " + x + "] into her supplicating lips, urging her to take it <i>deeper</i>...");

	//Pc’s dick is larger than 8 inches:
	if(pc.cocks[x].cLength() > 8)
	{
		output("\n\nWith obvious hesitation due to your sheer size, the fae-like girl bravely slides her supple lips down your [pc.cock " + x + "]. As expected, she can only get a fraction of your stupendous dick inside her mouth before your [pc.cockHead " + x + "] is knocking insistently against her throat! Hot drool wells within her mouth and down her chin, yet she stubbornly continues to try to push past her gag reflex. She’s practically throwing herself at your cock!");
	}
	//Else 8 inches or below:
	else
	{
		output("\n\nWith a lusty look in her eyes, the fae-like girl slides her supple lips down your [pc.cock " + x + "]. She can only take it so far before your [pc.cockHead " + x + "] is knocking insistently against her throat. Hot drool wells within her mouth and down her chin, yet she stubbornly continues to try to push past her gag reflex. She’s practically throwing herself at your cock!");
	}
	output("\n\nEven with each failed attempt, you feel the delicious sensation of her wet narrow gullet battering your [pc.cockHead " + x + "], and the sight of seeing her shamelessly drool and bounce on your spit-drenched dick is amazing! You groan and flex within her mouth, bathing her tonsils in your [pc.cumVisc] pre-cum, adding to the sticky mess drooling down her lips and chin. With each attempt, you can feel her throat-hole relaxing and expanding around your knocking tip, until at last... it gives way! You shudder with delight as your prick slides down her all-too narrow throat, wringing and squeezing around your prick.");
	//FirstTimeSeeingScene:
	if(flags["INESSA_BJED"] == undefined)
	{
		output(" Your [pc.cockNounSimple " + x + "] is now in her virgin territory!");
		flags["INESSA_BJED"] = 1;
	}
	output("\n\nBlown away with the intensity of her wringing gullet around your [pc.cockHead " + x + "] and spit-slicked prick, you don’t last long at all. Your senses are seized by absolute, unspeakable ecstasy. Desperate for more, you thrust yourself down her throat, thoroughly delirious with pleasure. All it takes is one last wet squeeze from the butterfly girl around your cock-tip and you’re sent spasmically spurting and bathing her sweet tonsils in your [pc.cumVisc], hot [pc.cumNoun].");
	if(pc.cockTotal() > 1) {
		output(" At the same time, your other ");
		if(pc.cockTotal() == 2) output("dick fires");
		else output("dicks fire");
		output(" wildly into the air, splattering the shop floor in your seed.");
	}
	output("\n\nYour [pc.cockLight " + x + "] plops from her slickened lips and [pc.cumNoun] drools down her chin–there’s a deliciously spacey look in her starry eyes. Her breathing is hurried, and she’s flushing with arousal. As you pant for breath, you spot heavy moisture between her thighs, and dripping from the crotch of her chastity belt. It seems you weren’t the only one who enjoyed yourself! You order her to clean off your [pc.cocksNoun] and the butterfly-winged girl dreamily licks your [pc.cumNoun]-covered rod");
	if(pc.cockTotal() > 1) output("s");
	output(" clean, her tongue curling around your length");
	if(pc.cockTotal() > 1) output("s");
	output(" and lovingly scooping up every single drop.");
	output("\n\n<i>“Good girl,”</i> you " + pc.mf("huskily","breathily") + " praise her, reaching out and stroking the top of her head. Like a kitten, Inessa instinctively leans into the palm of your hand, her soft hair rubbing against your fingers. There’s a blissfully happy look in her bright eyes.");
	output("\n\n<i>“D-did you want anything else–?”</i> The butterfly-winged girl asks, your [pc.cum] dribbling down her chin and dripping on her small blue breasts. You shake your head");
	if(pc.isCrotchGarbed()) output(" and tuck your [pc.cocksNoun] away");
	output(", thoroughly satisfied.");
	// Return to shop menu.
	processTime(15);
	pc.orgasm();
	inessaMenu();
}

public function hasSkirt():Boolean
{
	return IsOneOf(pc.armor, MaidOutfit, SchoolgirlOutfit, LibrarianOutfit, NurseOutfit, FemaleDoctorOutfit, CheerleaderUniform, WaitressUniform, LittleBlackDress);
}

// PC has a pussy
// PC has two legs to spread
// PC has front genitals
// PC is not a taur.
public function cunnilingusInessa():void
{
	clearOutput();
	showInessa();
	author("JimThermic");
	// If PC is wearing something with a skirt:
	if (hasSkirt())
	{
		//Pc is wearing underwear:
		if(!(pc.lowerUndergarment is EmptySlot)) output("With a saucy grin, you wait until Inessa isn’t looking, and reach under the hem of your [pc.armor]. You slip your [pc.lowerUndergarment] down your [pc.thighs] and tuck them away, leaving your nethers bare beneath your skirt. You then hop onto the counter and call the butterfly-winged shopkeeper, making sure to keep your legs crossed and hem patted down. She bounds up to you none the wiser.");
	}
	//Else PC is nood down there:
	else if(!pc.isCrotchGarbed())
	{
		output("With a saucy grin, you hop onto the counter and cross your [pc.legs], feeling the brushing of skin against your bare nethers. With a low whistle, you call the butterfly-winged shopkeeper over, who bounds up immediately.");
	}
	//Else / Goin’ Commando:
	else
	{
		if(!(pc.lowerUndergarment is EmptySlot)) output("With a saucy grin, you hop onto the counter and cross your [pc.legs], feeling the brushing of skin against your bare nethers below your skirt. Going commando under your [pc.armor] is always exciting, especially when no-one else knows. With a low whistle, you call the butterfly-winged shopkeeper over, and she bounds up immediately.");
		//Else if PC is wearing a lowerGarment:
		else 
		{
			output("With a saucy grin, you slip behind one of the displays and sneakily strip off your [pc.lowergarments]");
			if(!(pc.upperUndergarment is EmptySlot)) output(", leaving yourself clad only in your [pc.upperUndergarment]");
			output(". You then stride out when Inessa isn’t looking and plant your bare buttocks on the counter, pointedly crossing your legs. With a low whistle, you call the butterfly-winged shopkeeper over, who bounds up immediately.");
		}
	}
	output("\n\n<i>“Hi, can I help you–?”</i> Inessa cheerily asks, hands clasped neatly in front of her. Your sense of sadistic excitement heightens. Like a cat and a mouse, you want to play with her, to see how she’ll react to what you have planned–and which direction she will skitter! Time to put on your best poker face...");

	output("\n\n<i>“Oh, yes, you </i>can<i> actually,”</i> you cheerfully remark, spreading your [pc.thighs] wide");
	if(hasSkirt()) output(", lifting the lower hem of your [pc.armor],");
	output(" and putting your [pc.vagina] pointedly on display. <i>“...I need someone to lick this for me, and you look like you’re just right for the job.”</i>");

	output("\n\nThe butterfly-winged girl’s reaction is <i>priceless</i>. Her starry eyes fly wide open and her mouth gapes. <i>“Whuh-what did you say–?”</i> She positively squeaks. In response, you sensuously reach down, pointedly parting your [pc.vaginaColor] lips. You’re a little <i>moist</i> inside–what from all the teasing–and the subby girl blushes at the very lewd sight.");
	output("\n\n<i>“I said </i>lick me<i>. You’re good for that much, aren’t you?”</i> You tease, rolling one of your fingertips over [pc.oneClit]. Inessa blushes and tries to look away, but her eyes keep flicking excitedly to your bare [pc.vaginaColor] mound. Still, the butterfly-winged beauty submits to your unreasonable demand, placing her delicate fingers on your parted thighs. After squatting down, she positions her burning cheeks below them and inches closer towards your [pc.vaginaLight], buffering it with excited warm breaths.");
	if(hasSkirt()) output(" Her head disappeared beneath the hem of of your skirt, though you can still see her smooth naked back and cute fae-like wings.");

	output("\n\nSeconds later, you can feel Inessa’s tongue brushing against your slick lower folds. You let out a shameless moan and grab the back of her head, pushing her eagerly into your [pc.vagina]. You’re pleasured with wet, long licks on your sensitive nethers and pointed suckling on your [pc.clits]. Coiling pleasure pools within your belly. Right now your licked loins feel like they’re pulsing and on fire, positively brimming with sensual pleasure that diffuses through every inch of your being. You grind your hips up and against her face, groaning as her tongue slavishly slides inside of your soppy slit. It’s like you’re being fucked with her tongue, and all you can do is grind against it, trying to get it to penetrate <i>deeper</i> and <i>harder</i>...");
	output("\n\n...When that coil unfolds, ripples of unadulterated ecstasy flood through your very being, and you are filled to the brim with that ultimate, all-consuming joy. You shudder HARD and cum uncontrollably against the butterfly girl’s soft cheeks, crying out in sublime climax. When you’re finally finished, you fall back against the counter, feeling your eyes roll back into your head and your sweaty body relax. There’s a sweet licking at your utterly drenched nethers–it feels like Inessa is diligently cleaning your no-doubt [pc.girlCumNoun] splattered pussy. By her sweet little moans, it seems she loves the taste.");

	output("\n\nOnce she’s done, Inessa slides her hands affectionately up your still twitching thighs, rubbing her naked blue breasts against your skin until she’s almost eye-level with you. <i>“...A-are you okay?”</i> Her lips are slick with your [pc.girlCumColor] juices. You nods and reach out to stroke her cheek. Like a kitten, the butterfly girl instinctively nuzzles against it, a glitteringly happy look in her bright eyes.");
	output("\n\n<i>“Good girl,”</i> you tell her, and she all but purrs. After giving her an intimate and sticky kiss–your tongues roaming and tussling with each other–you sort yourself out and hop off the counter. You’re amused to find there’s a large wet patch on there under where you were sitting, which Inessa blushingly wipes up with a cloth. She’s got to keep the store clean, after all!");
	processTime(22);
	pc.orgasm();
	// Return to shop menu.
	inessaMenu();
}

//Breast Tease
// No Taurs. That’s it.
public function breastTeaseInessaShit():void
{
	clearOutput();
	showInessa();
	author("JimThermic");
	output("You look at Inessa’s petite blue breasts and delectable little nipples. Small as they are, she’s shown you they still make delicious cleavage when pushed together–and an idea springs into your head. Perhaps it would be interesting to come up with a situation in which you can play with them...");
	output("\n\nFirst off, it’s best to prepare a proper stage. Walking around the store, you spot a four-poster bondage bed, complete with silk sheets. <i>Perfect</i>, you think. Sitting down in it, you call her over. The saeri girl quickly skips over; it’s truly admirable how quick she comes when called.");
	output("\n\n<i>“Hi! Is there something you need–?”</i> Inessa asks, her butterfly wings flitting about. She unconsciously presses her upper arms against the sides of her breasts, pressing her handfuls together and out. It’s admirable how she works with what she has, and truth be told, there’s something appealing about her little peaks.");
	output("\n\n<i>“Yes, there is,”</i> you remark, petting the bed. <i>“I want to try out this bed. I’m not exactly sure I want to buy it otherwise.”</i>");
	output("\n\nInessa’s eyes shoot open, an excited look in her eyes. <i>“Oh, this is a really good bondage bed, made of solid Selyan oak!”</i> She reaches out to stroke one of the ornate posts. <i>“There’s plenty of fasteners for ropes, but the great thing is that you can just use it as a normal bed if you want. It’s super comfy.”</i>");
	output("\n\n<i>“Prove it,”</i> you dare her, pushing yourself back on the bed and lying down. <i>“Lie in bed with me. I want to see what it feels like with another person in it. I don’t want to buy it and just find out it’s too small...”</i>");
	output("\n\n<i>“U-um, really? I-I guess that makes sense...”</i> Inessa practically squeaks, climbing up and onto the satin sheets. You pat the spot next to you, under your arm, and the butterfly-winged shopkeeper cuddles up into it. <i>“... T-this feels kind of intimate...”</i> She murmurs, fingers balling up against your side. She’s warm, slight, and definitely the right size for having under your arm.");

	//PC is NotNude:
	if(pc.isCrotchGarbed())
	{
		output("\n\n<i>“You should take off my clothes,”</i> you murmur in Inessa’s ear. She furiously blushes–peeking up to see if any customers are about first–before slowly stripping off your ");
		if(!(pc.armor is EmptySlot)) 
		{
			output("[pc.armor]. ");
			if(!(pc.lowerUndergarment is EmptySlot)) output("She tosses it off the bed and then looks down to your [pc.lowerUndergarment], sliding them off as well. ");
		}
		//Else: 
		else output("[pc.lowerUndergarment], tossing them off the bed. ");
		output("The butterfly-winged alien girl then straddles your waist, looking down at you with a lusty, longing gaze. Your fingertips graze her slender belly and stroke her underbust, sliding upwards until you’re cupping her tiny handfuls. You give them a firm squeeze and she lets out a sweet little cry, her small butt quivering in your lap and against your naked firmness.");
	}
	//else PC is nude:
	else output("\n\n<i>“You should hop on top of me,”</i> you murmur in Inessa’s ear. She furiously blushes–peeking up to see if any customers are about first– then straddles your waist, looking down at you with a lusty, longing gaze. Your fingertips graze her slender belly and stroke her underbust, sliding upwards until you’re cupping her tiny handfuls. You give them a firm squeeze and she lets out a sweet little cry, her small butt quivering in your lap and against your naked firmness.");

	output("\n\nYou pinch and tease her pert little nubs, caressing her into insensibility until she’s practically flailing about with pleasure. As small as they are, they’re incredibly sensitive! You grin and flick her nipples, watching as lets out a sharp whimpering cry, her hips spasming and shaking in your lap. <i>“H-hah–not so hard-!”</i> The butterfly-girl whimpers, yet her breathing is labored. <i>Yeah right</i>, you think, there’s an incredibly obvious slickness leaking out from between her thighs! A few more flicks and she’s quaking on the spot, unable to control her body. There’s a loud <i>squiiiirt</i> and a slick rope of thin, sticky liquid jumps out through the gaps in her chastity belt. It splatters on your belly, followed by a few more jumping spurts, her hands desperately clenching at the silky sheets.");

	output("\n\n<i>“AHH-Ahhhh–hah!”</i> She breathily cries, before looking down and realising in utter shock the mess she made. <i>“Oh, oh my Zyi–! ");
	if(flags["INESSA_TITTYSQUIRT"] == undefined)
	{
		output("I-I can't believe I just squirted on you... again!");
		flags["INESSA_TITTYSQUIRT"] = 1;
	}
	else output("U-um, I’m so sorry, that’s never happened before!");
	output("”</i> she panics, clearly mortified at covering you in her slick girl juice. Instead of complaining, however, you reach down and dab your finger in it, then bring it up to suckle upon. It’s so deliciously sweet! And you want more...");
	output("\n\n<i>“I want </i>more<i>,”</i> you hungrily tell her. There must be a predatory look in your eyes, because she freezes on the spot, her own bright eyes wide as can be. Flipping her onto her back, you hungrily lash at her silky inner thighs, lapping at the thin, sticky streams of feminine fluid that drooled down from her guarded snatch. The butterfly-winged girl moans and grips the bedsheets above her head as you aggressively tongue-lash so <i>close</i> to her virgin pussy, like an animal pouncing on [pc.hisHer] favorite meal. <i>“O-oh Zyi, I-It’s too much–!”</i>");
	output("\n\nYou’re caught off guard as <i>another</i> weaker splash of sticky girl-cum jumps out and splashes you directly in the cheek. You chuckle under your breath and lap up what’s left, taking it all for yourself. Once you’re done, you slide up her trembling body and give her a long, lusty kiss–sharing with her the taste of her sweet lady juice as your tongue dance with each other.");
	output("\n\n<i>“... I don’t think I’ll take the bed, but I’ll certainly take </i>you<i>,”</i> you seductively murmur in her ear, and she squirms with barely concealed delight. You give her a parting kiss before hopping off the bed, leaving the poor saeri girl to recuperate from her back-to-back orgasms. By the way she’s splayed out across the silky sheets, she definitely needs it!");
	processTime(27);
	// Return to store menu.
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}


//Sex Scenes (Store Items)
//Hoverhole
// I’ve written a masturbation scene for use with the Hoverhole. It has variant text for if you’re using it publically or privately.
//Use Hoverhole
// PC must have a dick to use.
// PC must have purchased a Hoverhole.
// Accessible anytime from the masturbation menu.
public function hoverholeFapFapFap():void
{
	clearOutput();
	showName("\nHOVERHOLE");
	author("JimThermic");
	var x:int = rand(pc.cockTotal());
	output("You pull out the HoverHole you bought from the sex store, holding the pocket-pussy in your hands. ");
	//FirstTime:
	if(flags["HOVERHOLE_USES"] == undefined) output("There’s no buttons to be seen, but it <i>did</i> come with a manual with verbal commands–apparently it’s the complete ‘hands free’ experience.");
	output("\n\n<i>“Customized user: [pc.fullName],”</i> you announce. The tube-like device shoots out a cyan light that sweeps over your whole body, before fixating pointedly on your prick.");

	//if pc has canine cock:
	if(pc.cocks[x].cType == GLOBAL.TYPE_CANINE)
	{
		output("\n\n<i>“[pc.fullname] registered. Now accommodating for customized size and shape.”</i> It suddenly begins to shift in your hands, transforming into a furry canine-like pussy, perfectly shaped like that of a puppy slut. Eager fluids leak from the now knottable mound and make your head spin–it smells exactly like she’s...no... <i>it’s</i> in heat! Still, your [pc.cock " + x + "] twitches and swells in anticipation of a mating, utterly unable to tell the difference.");
	}
	//else if pc has equine cock:
	else if(pc.cocks[x].cType == GLOBAL.TYPE_EQUINE)
	{
		output("\n\n<i>“[pc.fullname] registered. Now accommodating for customized size and shape.”</i> It suddenly begins to shift in your hands, transforming into a lightly furred horse pussy, replete with pitch-black lips.The equine pussy flares and invitingly flashes its pink drooling insides, making your head spin–it smells <i>exactly</i> like a mare in heat! Your [pc.cock " + x + "] twitches and pre-cum drools from your [pc.cockHead " + x + "], completely unable to tell the difference.");
	}
	//else if pc.has feline cock
	else if(pc.cocks[x].cType == GLOBAL.TYPE_FELINE)
	{
		output("\n\n<i>“[pc.fullname] registered. Now accommodating for customized size and shape.”</i> It suddenly begins to shift in your hands, transforming into a feline-like snatch, perfectly shaped like that of a kathrit female. Eager fluids leak from its furry kitty-lips and your head spins–it smells exactly like she’s...no... <i>it’s</i> in heat! Still, your [pc.cock " + x + "] twitches and swells in anticipation of a mating, utterly unable to tell the difference.");
	}
	//else if pc has kui-tan cock
	else if(pc.cocks[x].cType == GLOBAL.TYPE_KUITAN) output("\n\n<i>“[pc.fullname] registered. Now accommodating for customized size and shape.”</i> It suddenly begins to shift in your hands, transforming into a furry racoon pussy, perfectly shaped like that of a kui-tan lady-herm. Eager fluids leak from its onyx lips and your head spins–it smells exactly like she’s...no... <i>it’s</i> in heat! Still, your [pc.cock " + x + "] twitches and swells in anticipation of a mating, utterly unable to tell the difference.");
	//else if pc has leithan cock:
	else if(pc.cocks[x].cType == GLOBAL.TYPE_LEITHAN) output("\n\n<i>“[pc.fullname] registered. Now accommodating for customized size and shape.”</i> It suddenly begins to shift in your hands, transforming into a leithan cunt to match your twitching tool. The musty snatch flares and invitingly flashes its drooling insides, making your head spin–it smells <i>exactly</i> like a mare in heat! Your [pc.cock " + x + "] twitches and pre-cum drools from your [pc.cockHead " + x + "], completely unable to tell the difference.");
	else if(pc.cocks[x].cType == GLOBAL.TYPE_HUMAN) output("\n\n<i>“[pc.fullname] registered. Now accommodating for customized size and shape.”</i> It suddenly begins to shift in your hands, transforming into a human-like pussy perfectly sized to accommodate your " + Math.floor(10*target.cocks[x].cLength())/10 + "-inch terran dick. Just seeing it gets you hot and bothered–a perfect pussy literally tailored to your " + pc.mf("manhood","lady-dick") + "!");
	else // Anything else!:
	{
		output("\n\n<i>“[pc.fullname] registered. Now accommodating for customized size and shape”</i> It suddenly begins to shift in your hands, transforming into a pussy perfectly sized to accommodate your " + Math.floor(10*target.cocks[0].cLength())/10 + " inch dick. Just seeing it gets you hot and bothered–a perfect pussy literally tailored for the shape of your " + pc.mf("manhood","lady-dick") + "!");
	}

	//if Public:
	if(rooms[currentLocation].hasFlag(GLOBAL.PUBLIC))
	{
		output("\n\nHolding your talking pocket-pussy has certainly drawn the eyes of onlookers, who are watching now with obvious curiosity and and bafflement. They don’t have to wait long to find out what you have planned, however, as you ");
		if(!pc.isNude()) output("shamelessly strip off your things and ");
		output("issue an order to the pocket-pussy. <i>“Activate intuitive pleasure mode!”</i>\n\n");
	}
	else
	{
		//Clothed:
		if(!pc.isNude()) output("\n\nAfter stripping off your things, you");
		else output("\n\nYou");
		output(" order the pocket-pussy to go into intuitive pleasure mode. ");
	}
	output("The moment those words leave your mouth, it flies from your hands and hones in on [pc.cock " + x + "]! Already lubed up, it immediately wraps itself around your [pc.cockHead " + x + "] and slides your trembling prick right down to the base. It’s even more warm and realistic than you thought, and if you closed your eyes, you’d be hard pressed to tell the difference between it and a real woman fully sheathing herself on your now slickened shaft. With long, slow, deliberate movements, it begins bucking against your [pc.base " + x + "], milking and screwing your twitching dick with surprising enthusiasm.");

	//Public:
	if(rooms[currentLocation].hasFlag(GLOBAL.PUBLIC))
	{
		if(rooms[currentLocation].planet == "TAVROS STATION") output("\n\nNow that they realise what’s going on, the station denizens gasp and try to turn their eyes from your sordid display, trying to ignore the naked [pc.race] now fiercely bucking [pc.hisHer] hips against a floating sex toy, moaning with carnal pleasure. For just as many who wear looks of absolute disgust, many others look more than a little stirred up by the public scene, their fingers subconsciously drifting to their nethers....");
		else if(rooms[currentLocation].planet == "PLANET: MHEN’GA") output("\n\nNow that they realise what’s going on, the nearby Esbethians murmur amongst themselves. Some of them subconsciously begin touching themselves; turned on by the sight of the floating fuck-toy milking your [pc.cockNoun " + x + "] and your wild bucking right back!");
		else if(rooms[currentLocation].planet == "PLANET: TARKUS") output("\n\nAs you moan out loud and hump back at the sex toy, the horny raskvel start touching themselves to your sordid display. You can see the bunny-like natives stroking their long purple cocks or pussy lips, in some cases touching each other’s. This is threatening to turn into a full on orgy!");
		else if(rooms[currentLocation].planet == "PLANET: NEW TEXAS") output("\n\nAs you moan out loud and hump back at the sex toy, the crowd watch with lusty eyes and begin stroking themselves off, in some case touching each other’s privates and giving a helping hand.  This is threatening to turn into a full on orgy!");
		else if(rooms[currentLocation].planet == "PLANET: MYRELLION") output("\n\nAs you moan out loud and hump back at the sex toy, the myr seem fascinated and titilated by both your dick and the alien device. You can tell by their expressions that they’ve never seen anything like it!");
		else output("\n\nAs you moan out loud and hump back at the sex toy, the onlookers continue to watch your sordid display. For just as many who wear looks of absolute disgust, many others look more than a little stirred up by the public scene, their fingers subconsciously drifting to their nethers.");
	}
	output("\n\nUpping the ante, the perfectly tailored pussy begins wetly wringing your entire length, fiercely seizing and stroking your shaft between its synthetic lips. Carried on waves of unspeakable pleasure, your eyes roll back and you slap your [pc.hips] against your invisible lover, your excitement intensified by the sloppy smacking sounds now filling the air. As you feel as though you’re about to go mad with pleasure, you let out a loud cry and shoot your [pc.cumVisc] [pc.cumNoun] into the floating sex-toy, letting it <i>alll</i> out in its pulsing and wringing confines.");

	//if Public:
	if(rooms[currentLocation].hasFlag(GLOBAL.PUBLIC))
	{
		//If New Texas/Tarkus:
		if(rooms[currentLocation].planet == "PLANET: NEW TEXAS" || rooms[currentLocation].planet == "PLANET: TARKUS")
		{
			output("\n\nYou’re not the only one to reach your peak. Watching you cum, the ");
			if(rooms[currentLocation].planet != "PLANET: TARKUS") output("bulls");
			else output("raskvel males");
			output(" groan and wank their ");
			if(rooms[currentLocation].planet != "PLANET: TARKUS") output("thick fleshy-cocks");
			else output("purple, reptilian cocks");
			output(" even harder. Soon you’re being splattered with thick, gooey ropes. Your [pc.face] and [pc.chest] are splattered in their warm white juice, dribbling down your chin and [pc.belly]. Meanwhile some of the gathered ");
			if(rooms[currentLocation].planet != "PLANET: TARKUS") output("cows");
			else output("floppy-eared girls");
			output(" sweetly cry and cream themselves, gushing sweet girl-juice down their wildly quaking thighs.");
		}
		//else if myrellion:
		else if(rooms[currentLocation].planet == "PLANET: MYRELLION") output("\n\nThe women excitedly clamor and take photos of your sweaty, spent body as your [pc.cock " + x + "] sloppily slips out of the sex-toy. You’re sure the unique snaps of your spunk-splattered loins will be a treasured keepsake.");
		//Else anywhere else:
		else output("\n\nAs you lie there, sweaty and spent, you see some of the onlookers whipping out cameras and taking photos. You’re sure the unique snaps of your spunk-splattered loins will be spread all over the HoloNet, or at least kept as personal keepsakes..");
		pc.exhibitionism(2);
	}
	else
	{
		output("\n\nNow that you’ve finished masturbating, your [pc.cock " + x + "] sloppily slips out of the sex-toy, and you feel utterly spent. A euphoric high washes over your senses and you relish it, lying back as the pocket-pussy enters self-cleaning mode.");
	}
	processTime(22+rand(8));
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Grav-Cuffs
// I’ve written two scenes for Grav-cuffs so far.
// The first is a a ‘Cuff & Fuck’ general sex scene that can be tacked onto most enemies, ala the ‘Lusty maiden armor tit-job scene’ from CoCs.
// The second is a unique scene for New Texas where the PC dons the cuffs and gets gang-banged by bulls.
//Cuff & Fuck
// In this scene, the PC uses grav-cuffs to pin down an enemy and have their way with them, assuming they have bought the cuffs and have a penis.
// Since the scene relies a lot on enemy parsers and is ambiguously written at points, it can easily be used with the Vanae, Zil, Naleen, Myr Deserters (Individual), etc as you see fit.

//[Cuff&Fuck]
// Cuff&Fuck.tooltip: Use your grav-cuffs to pin down [monster.name] and have your way with [monster.hisHer] [pc.vagOrAssNoun]! Requires Grav-cuffs and a penis.

public function cuffNFuck():void
{
	clearOutput();
	author("JimThermic");
	output("Now that you’ve defeated the [monster.name], you know exactly what to do with [pc.himHer]. As [pc.heShe] reels from the effects your battle, you pull out your grav-cuffs. With a commanding whistle, you toss them up and out in front of you. They immediately hone in and clamp on your felled opponent’s wrists and [pc.legsNoun]. Within seconds, [monster.Name] is forced to the ground, [monster.hisHer] [monster.ass] shamefully pressed in the air.");
	// One in three chance of pumping out one of the dialogue chunks below, just to keep the scene fresh.
	//Random text output (⅓ chance):
	if(rand(3) == 0)
	{
		output("\n\n <i>“W-what’s going on-?”</i> the [monster.name] stammers. [monster.HeShe] tries to pull [monster.hisHer] [pc.skinColor] hands off the ground, but [monster.heShe] can’t budge an inch.");
		output("\n\nStriding up to your prostrate opponent, you stroke [monster.hisHer] [monster.ass] and give it a ");
		if(pc.isNice()) output("playful pat");
		else if(pc.isMischievous()) output("cheeky slap");
		else output("sharp slap");
		output(".");
		output("\n\n<i>“Winners get to set the rules. You’re following mine now, hon.”</i>");
	}
	//Random text output (⅓ chance):
	else if(rand(2) == 0)
	{
		output("\n\n<i>“Wha-what did you do to me-?!”</i> the [monster.name] splutters. [monster.HisHer] [monster.ass] wiggles about enticingly as [monster.heShe] tries to tug free of the cuffs to no avail.");
		output("\n\nStriding up to your prostrate opponent, you stroke [monster.hisHer] [monster.ass] and give it a ");
		if(pc.isNice()) output("playful pat");
		else if(pc.isMischievous()) output("cheeky slap");
		else output("sharp slap");
		output(".");
		output("\n\n<i>“You, dear, aren’t going anywhere. From now until I decide otherwise, this ass belongs to me.”</i>");
	}
	//Random text output (⅓ chance):
	else
	{
		output("\n\n<i>“My wrists, my [monster.legsNoun] - I can’t move?!”</i> the [monster.name] cries out, trying in vain to tug [monster.hisHer] wrists and [monster.feet] free of the ground.");
		output("\n\nStriding up to your prostrate opponent, you stroke [monster.hisHer] [monster.ass] and give it a ");
		if(pc.isNice()) output("playful pat");
		else if(pc.isMischievous()) output("cheeky slap");
		else output("sharp slap");
		output(".");
		output("\n\n<i>“Got a complaint? You should have thought of that before turning your [monster.weapon] on me.”</i>");
	}
	output("\n\n");
	if(!pc.isNude()) output("You strip off your gear, then");
	else output("Once you’re ready, you");
	output(" grab [monster.hisHer] wiggling hips from behind, unceremoniously flopping [pc.oneCock] onto [monster.hisHer] [monster.ass]. Teasing [monster.himHer] for a bit, you grind it back and forth between [monster.hisHer] buttocks, getting yourself nice and hard before sliding it in [monster.hisHer] [monster.vagOrAssNoun].");

	pc.cockChange();
	output("\n\n[monster.Name] gasps and arches [monster.hisHer] back, trembling at your sudden entry. [monster.HisHer] insides clench tightly around the foreign intruder suddenly ");
	
	var capacity:Number = 0;
	if(foes[0].hasVagina()) capacity = foes[0].vaginalCapacity();
	else capacity = foes[0].analCapacity();
	var x:int = pc.cockThatFits(capacity);


	//1/2 or lower capacity:
	if(pc.cockVolume(x) < capacity/2) output("wiggling around inside of [monster.himHer]");
	else output("stretching [monster.himHer] open");
	output(". Soon your [pc.cockHead " + x + "] has bottomed out inside of [monster.hisHer] ");
	if(foes[0].hasVagina()) output("[monster.vaginaColor] box");
	else output("[monster.skinColor] butt");
	output(".");

	//VirginPussy:
	if(foes[0].hasVagina() && foes[0].vaginalVirgin)
	{
		output("\n\nA thin line of red runs down [monster.hisHer] [monster.thigh]. You pause as [monster.heShe] hangs [monster.hisHer] head, quivering around your length buried in her unsullied depths. [monster.HeShe] was a virgin!");
		output("\n\nOnce [monster.heShe]’s adjusted to the strange new thing buried in [monster.hisHer] [monster.pussy],");
	}
	else output("\n\nSlowly,");
	output(" you begin to slap your hips against [monster.name]’s [monster.ass]. [monster.HisHer] ");
	if(foes[0].hasVagina()) output("slickening snatch");
	else output("naughty backdoor");
	output(" sweetly wrings your [pc.cock " + x + "]. As you groan and grind against [monster.himHer], a " + foes[0].mf("throaty","sweet") + " moan escapes [monster.hisHer] [monster.lips].");

	//Randomized Output:
	output("\n\n<i>\"");
	if(rand(5) == 0) output("Oh, so you’re enjoying it?");
	else if(rand(4) == 0) output("Was that a moan I heard?");
	else if(rand(3) == 0) output("Oh, that good, huh?");
	else if(rand(2) == 0) output("Like my [pc.cockNoun " + x + "], do you?");
	else output("Oh, so you like your [monster.vagOrAss] being fucked?");
	output("”</i>");

	output("\n\n<i>“N-no!”</i> [monster.Name] blurts out. Despite [monster.hisHer] words, [monster.hisHer] [monster.ass] is instinctively slapping back against your [pc.hips], [monster.hisHer] own lifting to allow you deeper access.");
	output("\n\nGrinning in amusement, you ");
	//enemy.hasTail: 
	if(foes[0].tailCount > 0) output("grab [monster.tails]");
	else output("grab [monster.hisHer] waist");
	output(" and pick up the pace. [monster.name] grinds back against you, wringing your [pc.cock " + x + "] and moaning in ecstasy. Suddenly [monster.heShe]’s crying out and cumming hard around you, [monster.vagOrAss] trembling");
	if(foes[0].hasCock() || foes[0].hasVagina()) output(", ");
	if(foes[0].hasCock()) output("[monster.cocks] spurting [monster.cum] all over [monster.hisHer] [monster.belly]");
	if(foes[0].hasCock() && foes[0].hasVagina()) output(" and ");
	if(foes[0].hasVagina()) output("[monster.girlCum] wetly gushing around your pistoning prick");
	output(".");

	output("\n\n<i>“");
	if(rand(5) == 0) output("Did you just cum?”</i>");
	else if(rand(4) == 0) output("Funny, I swear you just came just then.");
	else if(rand(3) == 0) output("Weren’t you just saying you weren’t enjoying yourself? Such a liar!");
	else if(rand(2) == 0) output("You just came around my [pc.cockNoun " + x + "] - how did it feel?");
	else output("Cumming around my [pc.cockNoun " + x + "] - what a naughty " + foes[0].mf("boy","girl") + "!");
	output("”</i>");

	output("\n\n[monster.Name] flushes at your words, lowering [monster.hisHer] head, [monster.hisHer] ");
	if(foes[0].hasVagina()) output("pussy");
	else output("rectum");
	output(" still quivering around your [pc.cock " + x + "]. With a grin, you begin fucking it with slamming thrusts, stirring up [monster.hisHer] sensitive insides. [monster.HeShe] melts and frantically slaps [monster.hisHer] butt back against you, desperate for more. It’s not long before [monster.heShe] is cumming again, babbling and shaking in [monster.hisHer] cuffs.");

	output("\n\nThe third time [monster.name] cums you finally reach your own peak, groaning and ");
	if(pc.cumQ() < 5) output("dribbling");
	else output("spilling");
	output(" your hot, [pc.cumVisc] load inside of [monster.hisHer] well-fucked hole. ");
	if(pc.cumQ() < 7) output("The barest dribbles of [pc.cumNoun] escape your flaring cockhole, splattering anti-climactically into [monster.hisHer] [monster.vagOrAss]. Still, it feels <i>amazing</i>!");
	else if(pc.cumQ() < 100) 
	{
		output("You spurt your [pc.cumNoun] ");
		if(foes[0].hasVagina()) output("against [monster.hisHer] cervix ");
		output(" and spill your baby-batter into [monster.hisHer] ");
		if(foes[0].hasVagina()) output("receptive womb until it is");
		else output("bowels until they are");
		output(" filled with your seed.");
	}
	else if(pc.cumQ() < 4000) {
		output("A font of [pc.cumNoun] surges from your cock-tip and quickly fills up [monster.hisHer] ");
		if(foes[0].hasVagina()) output("[monster.pussy] and womb");
		else output("bowels");
		output(", filling it up to near breaking point.");
	}
	else
	{
		output("Gooey gallons of [pc.cumNoun] gush from your [monster.cockHead] and overfill ");
		if(foes[0].hasVagina()) output("[monster.hisHer] [monster.pussy] and womb");
		else output("bowels");
		output(", leaving [monster.himHer] with a swollen belly that makes [monster.himHer] look ");
		if(foes[0].isPregnant()) output("even more ");
		output("pregnant.");
	}
	output("\n\nAfterwards, you pull your [pc.cockNoun " + x + "] from [monster.hisHer] [monster.vagOrAss] and snap your fingers. The cuffs undo around [monster.name]’s wrists and [monster.legs]. [monster.Name] immediately falls to [monster.hisHer] side, a dreamy look on [monster.hisHer] [monster.face]");
	if(pc.cumQ() >= 7) 
	{
		output(", and a stream of [monster.cum] dribbling ");
		if(foes[0].legCount >= 2) output("down [monster.hisHer] [monster.thighs]");
		else output("out of [monster.hisHer] [monster.vagOrAss]");
	}
	output(".");
	processTime(33);
	pc.orgasm();
	foes[0].orgasm();
	output("\n\n");
	genericVictory();
}
/*
//New Texan Gang-Bang
// PC must have grav-cuffs in their inventory and be on New Texas.
// It’s up to you if you tie this scene to a static room, or have it as a masturbation option on-planet when the PC has grav-cuffs in their inventory.
public function newTexanGanguBangu():void
{
	clearOutput();
	author("JimThermic");
	output("Looking around the New Texan landscape, your cheeks burn bright red as you watch the exquisite display of the perfectly masculine and feminine walking about. No other planet is so <i>extreme</i> in their separation of gender.");
	if(pc.hasCock() && !pc.hasVagina()) output(" So what if you were to tie yourself up in an unmanly fashion and let them have their way with you?");
	else if(pc.hasVagina() && !pc.hasCock()) {
		output(" You have no doubt what will happen to you " + pc.mf("",", a woman,") + " if you strip and tie yourself up here, just like another breeding cow!");
	}
	else {
		output(" If you were to strip and tie yourself up here, what with your ");
		if(pc.hasCock() && pc.hasVagina()) output("different sets");
		else output("lack");
	}
	output(" of genitals, you wonder what they would make of you?");

	if(!pc.isNude()) output("\n\nYou excitedly strip off your things, then pull out and toss");
	else output("\n\nNaked as the day you were born, you pull out and toss");
	output(" your grav-cuffs. They float in the air several feet away from you. You command the cuffs to lock you in an open standing position, like a damsel dangling over an open pit. It’s a pretty good display position - and you <i>definitely</i> want them looking at your naked body and bared loins.");

	output("\n\nThe grav-cuffs swoop and swiftly secure themselves to your wrists, [pc.thighs]");
	if(pc.tailCount > 0) output(", [pc.tails],");
	output(" and [pc.feet]. They vibrate and hum, making your body incredibly light. Moments later, they pull your hands high above your head and snap together with a loud ‘clink’. Your [pc.legOrLegs] ");
	if(pc.legCount > 1) output("are forcibly spread far apart");
	else output("is rooted to the spot");
	if(pc.tailCount > 0) 
	{
		output(", while your [pc.tails] ");
		if(pc.tailCount == 1) output("is");
		else output("are");
		output(" lifted high in the air, freely exposing your [pc.ass]");
	}
	output(". You tentatively try to wiggle free, but you’re stuck in place, as if you were dangling and splayed by invisible ropes - the wonders of technology!");
	
	output("\n\nYou can’t really do anything but hang and wait. With burning cheeks, you wait there, naked and exposed for someone to make use of you. The suspense is titillating. Who will it be? How many? You just don’t know. Your fate, as well as your [pc.skinFurScalesColor] body, literally hangs in the balance.");

	output("\n\nNot long after you truss yourself up, naked and dangling, three strapping bull-men stride up to you with a lustful glimmer in their eyes. Just like you, they’re completely naked, their low-hanging equine pricks dangling near their knees!");

	output("\n\n<i>“Well, well, what do we have here?”</i> One of the bull men asks. His flared head immediately jumps at the sight of your bare body and well spread loins. Inch by inch, pink flesh emerges from their dark equine sheathes.");

	output("\n\nYou goggle at the size of their magnificent pieces of man meat, literally raring their flat tipped heads. Their impressive cock-holes dilate and flare, thick beads of pre already dribbling down their fleshy shafts. Flushing with delight, your heart begins to madly race - ");
	if(flags["NEW_TEXAS_GANGBANGED"] == undefined) output("what are they going to do with you?");
	else output("they’re the bulls from last time!");

	output("\n\n<i>“Hi there, " + pc.mf("boy","honey”</i>) + <i>“.”</i> <i>“{FirstTime:Fancy a ride with some real alphas?/Else: Couldn’t stay away from us, eh?}”</i> One of the bulls seizes your hips in his large, powerful hands. Moments later, {if.pcHasFrontCock: [pc.oneCock] is grinded against the girthy underside of his cock! Your own [pc.cockHead] excitedly leaks pre out and down between your rubbing shafts, slickening your sensuous dick-friction./else if pc.hasFrontPussy: [pc.onePussy] is grinded against the girthy underside of his cock! Your sloppy folds eagerly part against his equine cock and liberally slicken it with your excitement./else: your bare loins are grinded against the girthy underside of his cock!}");

output("\n\n{FirstTime: You’re utterly shocked when one of the bulls suddenly kisses you, your [pc.lips] locked in a passionate, tongue-filled kiss. Yielding to his insistent tongue and rubbing loins, you find yourself pressing your hips right back, needily rubbing {hasFrontCock: your dick against his. You blush as you realise {SmallerThan14: yours is tiny in comparison!/Equal: you’re exactly the same size!/15-17: yours is a bit larger!/Else: yours is freakishly big in comparison!}/Else ifpc.hasFrontPussy: your [pc.vagina] against his turgid twat-tamer./else: your smooth groin against his turgid twat-tamer.}");

output("\n\nAs you’re distracted by the delectable friction, another burly bull circles around you. Suddenly, your hips are grabbed from behind and a girthy horse cock is being needily rubbed between your buttocks! You moan and throw back your head, relishing in the two bulls grinding against your privates. H-how can you endure such an assault from two directions?");

output("\n\n{if Pc.hasFrontCock:");

output("\n\n<i>“Look at this - [pc.heShe]’s already about to blow!”</i> The first bull reaches down and caresses your [pc.cockHead]. You whimper with delight as he rubs your cock hole with his thick, calloused thumb.");

output("\n\n<i>“Your [pc.cocksLight] and [pc.ass] belong to us now, slut.”</i>");
output("\n\n}");

output("\n\n{else if PchasFrontPussy:");

output("\n\n<i>“Look at this - [pc.heShe]’s getting all wet!”</i> The first bull strokes your soppy slit with his thick, calloused fingers. He slips one inside of you and wiggles it about, causing you to whimper with pleasure - he’s <i>inside</i> of you!");

output("\n\n<i>“Your [pc.pussiesLight] and [pc.ass] belong to us now, slut.”</i>");
output("\n\n}");

output("\n\n{else // No front genitals:");

output("\n\n<i>“Look at this - [pc.heShe]’s about to cream himself!”</i> The first bull grabs {one of} your [pc.nipples] and roughly squeezes it, causing you to whimper in delight.");

output("\n\n<i>“Your [pc.ass] belongs to us now, slut.”</i>");
output("\n\n}");

output("\n\nA thrilling shiver courses through your body from their demeaning words. This is your true nature; not [pc.fullName], galactic adventurer, but a naughty, bull-cum loving slut! Every inch of you <i>aches</i> for their throbbing horse-cocks, yearning for them rubbing {PCGotFrontCock: against and} deep inside of you{NoCockButFemaleSex: r sloppy snatch}!");

output("\n\n{PCisACow:");

output("\n\n<i>“Please enjoy your slutty fuck cow,”</i> you huskily moan, mooing and rubbing yourself desperately against their delectable dicks. You’re a cow, and cows are meant to get fucked and mated by bulls!");

output("\n\n}");
output("\n\n{Else:");

output("\n\n<i>“I-I’m your slutty little [pc.race] whore - please use me as you wish!”</i> you huskily moan, rubbing yourself against their delectable dicks. It feels so <i>right</i>, like this is your purpose, to be the bull’s {NoBoobs:flat-chested/A-BCup: small-breasted/CtoD: bare-breasted/DDtoF:big-breasted/BiggerThanF: huge-breasted} fuck-toy!");

output("\n\n}");

output("\n\n<i>“Oh, we will. Prepare to have your ass fucked, slut!”</i> You cry out as a flat equine head forces its way into your [pc.asshole]. Oh god, your [pc.ass] is totally impaled on his fleshy rod{NotAnalVirgin: !/Else: - <b>you’ve lost your anal virginity!</b>}");

output("\n\n<i>“How does it feel to have a bull dick inside of that [pc.ass] of yours?”</i> The bull behind you asks, flexing his massive manhood. You feel his equine head flaring inside of you - you swear he’s buried right up in your belly. <i>“{If Virgin: You’re so tight - just like a virgin!/If notVirgin and repeat of scene: I can tell your [pc.assHole] missed me!}");

output("\n\n{Virgin:");

output("\n\nYou blush - you <i>are</i> a virgin, or at least - this is the first time you’ve had anything, let alone a girthy cock like his, up your [pc.ass]! Just the thought of having your anal cherry plucked by him makes your heart flutter.");

output("\n\n}");

output("\n\n{Not Virgin:");
output("\n\nAll you can do is whimper in delight - {FirstTimeSeeingScene: words are not possible with his mammoth tool buried deep in your [pc.ass]! Instead, you show your approval by grinding back against his turgid tool/Else: your [pc.ass] indeed missed his mammoth tool inside of it! You show him just how much you missed his turgid tool by grinding back against it.} You excitedly wring and clench it with your {formerly virgin/well-stretched} pucker. The muscular male flexes and flares inside of you in happy response - he clearly loves what you’re doing!");

output("\n\n}");

output("\n\nYou grind against each other, his powerful hips slapping against your well-packed posterior, his prodigious prick sliding back and forth, in and out of your quaking [pc.skinColor] buttocks. Hanging from your wrist cuffs, all you can do is tremble and moan as your [pc.ass] is deliciously abused by the burly bull!");

output("\n\n{if PchasFrontPussy:");

output("\n\n<i>“Time for me to get some of that action.”</i> His broad-chested brother grins, also grabbing your [pc.hips], this time from the front. Rubbing his own flaring tip against your dribbling nethers, he thrusts upwards, keen to claim your [pc.vaginaColor] pussy! It takes very little effort; your slick twat excitedly parts around his flaring tip, yielding happily to the thick, fleshy intruder! {Virgin: A thin trail of red runs down his pink, equine shaft - <b>he has just taken your precious virginity!</b>");

output("\n\nYou cry out in exquisite pleasure as both bulls practically rub their manhoods together deep inside of you, one stroking all the way to your womb and the other your rectum. Both of their hot, hard bodies rub against your [pc.chest] and back as you’re wonderfully sandwiched. {FirstTime: Your poor pussy and pucker are never going to be the same after this - you can already feel your insides molding to the shape of their unforgettable girth, wringing and clenching/Repeat: Your pussy and pucker have not forgotten their shapes - already they’re wringing and clenching their familiar girths}, eager to squeeze their bullish seed out deep inside of your needy holes and fill you up with their hot, fertile seed.");

output("\n\n}");

output("\n\n{else:");
output("\n\nAs you’re pistoned from behind, the broad-chested bull before you grabs your [pc.hips] and keeps rubbing his glorious hardness against you{male: rs/else: r bare loins} . You cry out in exquisite pleasure as you’re fantastically sandwiched between both bulls, one stroking against {[pc.oneCock]/you} as the other fills up your [pc.ass]. {FirstTime: Your poor pucker is never going to be the same after this -- you can already feel your insides molding to the shape of the back bull’s unforgettable girth, wringing and clenching/Repeat: All the while your rectum wrings and clenches the familiar girth, eager to squeeze out it’s bullish seed inside of your needy hole and fill you up to the brink with frothing cum.");
output("\n\n}");

output("\n\n<i>“I-I’m going to cum!”</i> You squeal out, trembling and shaking against them. You can’t hold out much longer - already, you’re reaching that all consuming peak!");

output("\n\n<i>“Cum for us, slut!”</i> The bull in your butt bellows{ gotFrontPussy: as they bounce you up and down on their throbbing equine dicks/else: all the while bouncing your [pc.ass] on his throbbing equine shaft.}");

output("\n\nUnable to hold out even if you tried, you throw back your head and cry out ecstatically, utterly creaming yourself between them. {Pc.hasPussy: You gloriously gush [pc.girlCum] around the pulsing prick buried in your [pc.vagina]{MoreThanOnePussy:, while your others emptily dribble, sharing in the excitement.}{pc.hasCock: Your [pc.cockHead] flexes and {smallCums: a single thick, [pc.cumVisc] rope of/Mid: thick, [pc.cumVisc] ropes of/Large: a hose-blast of thick, [pc.cumVisc]/Huge: a geyser of thick, [pc.cumVisc]} [pc.cumNoun] spurt{s} up on the front bulls’ strapping chest, coating it {largeOrMoreCum: and his face} in your sloppy [pc.cumColor] seed{MultiCocks - your other soon cock{s} following suit!} All the while, you excitedly spasm and clench around {GotFrontPussy: their flat-tipped pillars, wringing them for all they’re worth/else: the flat-tipped pillar buried in your butt, wringing it for all it’s worth}.");

output("\n\nIn your orgasmic throes, you set the two burly bulls off, and suddenly you can feel them flexing inside of you, grabbing and pressing deep against your [pc.hips] and ass. Suddenly there’s a glorious, gooey spurting {NoFrontPussy: on your [pc.chest] and} deep inside of you, flooding up inside your {[pc.vagina] and} rectum}. Hot, fertile bull-seed quickly fills up your {GotFrontPussy: eager womb to the brink, bathing your unprotected eggs in hyper-virility/bowels, bloating out your [pc.belly] {notPregnant: as if you were pregnant/else: and making you look even <i>more</i> pregnant}.");

output("\n\nWhen {the back bull pulls out, hot, sloppy cum drools out of your well-stretched {pussy and} pucker and down the {front and} back of your [pc.thighs]. Your [pc.belly] and [pc.ass] feel so warm, like you’re filled to the brim with liquid love!");

output("\n\nYou spacily stare over at the third bull - he’s been stroking his flat-tipped prick this entire time! Just a few more strokes and a groan later, and a thick, gooey rope spurts through the air and wetly splatters your [pc.skinColor] cheeks. His salty goo drools down to your [pc.lips], and you sluttily lick it up, relishing in his heady musk and thick, gooey taste.");

output("\n\n<i>“Marked [pc.himHer]!”</i> He grins, stroking out a few more lazy ropes that splatter against your {pcDoesNotHaveFrontPussy: already well-splattered} [pc.chest}.");

output("\n\nNow that you’ve all came, you expect to be let go. But the breeding bulls are nowhere near finished with you yet! Switching places, it’s not long before your {[pc.vagina] and} [pc.ass] {is/are} being filled once again, this time by a different one!");

output("\n\nAll you can do is hang there, cuffed and helpless, as you’re fucked mercilessly by the burly bovines over the next two hours. When they’re done with you, your belly is {Norm: gravid/AlreadyGravid: even bigger than before} and hanging heavily with bull semen, your entire body slick with their seed. From head to toe, you look and smell like a cum-dumpster - which is exactly what you were used as!");

output("\n\n<i>“Thanks for the good time, darlin’.”</i> One of the bulls slaps you on your well-used ass, now thoroughly gaping in the shape of their girthy cocks. Slick, wet spunk liberally drools out of your rectum, and you feel so empty! Whining out loud, you beg them to fuck you again - {FirstTime: even though it’s only been two hours, }you can’t imagine living without their dicks inside of you!}");

output("\n\nHearing your plaintive cry, one of the bulls lifts your chin and gives you a sloppy, cum-covered kiss, making you melt in your cuffs. When he pulls back, you’re swooning in delight!");

output("\n\n<i>“Don’t worry, slut. You can ‘hang’ here anytime - we’ll never turn down a chance to tap that fine ass of yours,”</i> the bull grins. Your heart leaps in your chest. <i>“... But right now we’ve got to get back to work.”</i>");

output("\n\nOnce they’ve left, the cuffs automatically unlock, as if sensing their absence. They fall and clatter on the ground. Picking them up, you stare at your wrists and ankles - the only parts of you uncovered by bull cum! You flush and pack them away, feeling more than a little wobbly on your feet!");

// Lots of vaginal (if applicable) and anal stretch.
// Lots of exhibition points.
// Filled with bull cum, anally and vaginally. Inflation.



Additional Content

// Please put these two items in Doctor Badger's inventory. Wrote them while doing Inessa, but they probably fit better in her store.
// BTW, also rewrote the Doctor Badger X-pack to be a third the size and far less dumb.

Slut Ray

this.quantity = 1;
this.stackSize = 1;
this.type = GLOBAL.RANGED_WEAPON;
this.shortName = "Slut Ray";
this.longName = "slut ray";
this.description = "a compact 'slut ray' gun";
this.tooltip = "This tiny, unassuming handgun-like device is designed to be hidden. When fired at a subject, it causes their mind to be flooded with graphic sexual fantasies, though they still retain free will. The fantasies can be custom selected by the user or set to random. Nobody knows how it works; the gun's contents are hidden behind a tamper-proof black casing."
this.attackVerb = "beam";
attackNoun = "sexual fantasy";
TooltipManager.addTooltip(this.shortName, this.tooltip);
this.basePrice = 1500;
baseDamage.psionic.damageValue = 10;
this.defense = 0;
this.shieldDefense = 0;
this.shields = 0;
this.sexiness = 0;
this.critBonus = 0;
this.evasion = 0;
this.fortification = 0;

Slut Ray, Advanced

// Unlocked for sale once PC reaches Myrellion

this.quantity = 1;
this.stackSize = 1;
this.type = GLOBAL.RANGED_WEAPON;
this.shortName = "A.Slut Ray";
this.longName = "advanced slut ray";
this.description = "a silvery 'slut ray' gun";
this.tooltip = "An advanced slut ray model, designed to project sexual fantasies into the mind of a target. Incredibly similar to the original model, except this one boasts higher intensity settings and a wider database of fantasies to draw upon."
this.attackVerb = "beam";
attackNoun = "sexual fantasy";
TooltipManager.addTooltip(this.shortName, this.tooltip);
this.basePrice = 4500;
this.attack = 5;
baseDamage.psionic.damageValue =15;
this.defense = 0;
this.shieldDefense = 0;
this.shields = 0;
this.sexiness = 0;
this.critBonus = 0;
this.evasion = 0;
this.fortification = 0;

*/