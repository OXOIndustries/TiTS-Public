import classes.Items.Toys.GravCuffs;
import classes.Items.HalloweenItems.WitchsOutfit;
import classes.Items.Toys.*;

/*Inessa and the Happy Tails
By JimThermic

Concept
 
This is a store located in Tavros Station, designed to provide PCs with a chance to pick upsex toys and items that potentially unlock sex scene options. E.g. Taur toys, collars and leads etc. 

The owner of the store, Inessa, is a Saeri -- a 'butterfly girl' and two-legged polymorph of the caterpillar-like Siel. Codex entry explains it. Tl;dr: caterpillar girls can sometimes turn into butterfly girls.

Expansion by Sen Kanashimi at bottom of file*/

public function showInessa():void
{
	showName("\nINESSA");
	showBust("INESSA_NUDE");
}

//First Visit Event
public function firstTimeHappyTail():void
{
	clearOutput();
	showInessa();
	author("JimThermic");
	output("Mere moments after you step through the door into the Happy Tails, there’s a loud ‘wuh-PSHH’ and you nearly jump out of your skin!");
	output("\n\nThere’s a little giggle from the distant counter as you calm yourself - it takes a few seconds for your mind to register it was the sound of a whip-crack door alarm.");
	output("\n\n<i>“Sorry, sorry!”</i> A light-hearted, silvery voice calls out, <i>“That noise can be a little shocking the first time, but it’ll grow on you.”</i>");
	output("\n\nFrom behind one of the racks, a smiling, blue-skinned butterfly-girl steps out. Her fae-like wings flitter behind her as she grins at you, star-like eyes glittering. The young woman’s soft breasts are brazenly on display; cuppable handfuls with delectable little nipples. When your eyes travel downwards, however, they’re met with gilded silver and a big, obnoxious lock. She’s wearing a chastity belt! You notice the whole store is filled to the brim with sex gear of all persuasions.");
	output("\n\n<i>“So, what brings you to my store, stranger?”</i> She melodically asks, multi-faceted wings fluttering behind her. <i>“...Or are you here for the view?”</i> She follows up by pressing her arms against the sides of her pert peaks and pushing them out. They’re small, but dangerous!");
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
		else if(pc.isMischievous()) output("\n\n<i>“You flatterer! I’m really not </i>that<i> special, you know?”</i> The alien girl blushes and stops pushing out her chest. <i>“I’m a saeri, though I was born a siel. We’re a polymorphic race, different forms, you know. You should have seen me back then–I was huuuge!”</i>");
		else output("\n\n<i>“Mmm? Besides a bored shop assistant?”</i> The alien girl blinks and stops pushing out her chest. <i>“...OH! I’m a saeri, though I was born a siel. We’re a polymorphic race, different forms, you know. You should have seen me back then–I was huuuge!”</i>");

		output("\n\n<i>“Anyway, my name’s Inessa, but you can call me ‘Nessa’ - everyone does! And if there’s anything you need, feel free to ask. I’d be happy to help!”</i>");
		output("\n\nYour codex informs you that it’s unlocked a new species entry on saeri. Perhaps you should give it a look?");
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
	addButton(2,"BuyDildo",buyDildosFromInessa);
	addButton(3,"Talk",talkToInessaSlut);
	if(flags["INESSA_BEING_DOMMED"] == 1)
	{
		if(pc.lust() >= 33) addButton(4,"Order",inessaSexApproach);
		else addDisabledButton(4,"Order","Order","You aren’t turned on enough to pursue some sex.");
	}
	else if(flags["INESSA_INESSAED"] != undefined)
	{
		if(pc.lust() >= 33) addButton(4,"Sex",inessaSexApproach);
		else addDisabledButton(4,"Sex","Sex","You aren’t turned on enough to pursue some sex.");
	}
	else addDisabledButton(4,"Sex","Sex","You don’t know her well enough for that.");
	//INESSA EXPANSION - Must have silk and Xanthe must be alive
	if((flags["INESSA_EXP"] != 1 && flags["INESSA_EXP"] >= 2) || flags["KQ2_MYRELLION_STATE"] > 0) { /* Nada */ }
	else if(flags["INESSA_EXP"] == 1) addButton(5,"Silk",giveInessaSilk,undefined,"Silk","Give Inessa the sheet of silk from Xanthe.");
	else addDisabledButton(5,"Silk","Silk",("You must have got the silk sheet from " + (flags["MET_XANTHE"] != undefined ? "Xanthe on Myrellion" : "someone...") + "."));
	if(erraLover() && !erraCollared() && !pc.hasKeyItem("Ausar Collar - A custom collar for Erra.")) addButton(6,"Collars",errasCollarPurchaseScene,undefined,"Collars","Inspect the display of collars lining the wall.");
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
	else if(rand(4) == 0) output("\n\nInessa is hanging some new lingerie on the racks and examining it. <i>“...Hum. Siel silk’s so comfortable and strong, but chameleon silk is getting popular...”</i>");
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
	
	if (flags["INESSA_EXP"] == 2)
	{
		output("You stride up to Inessa and click your tongue to grab her attention");
		output("\n\n<i>“Oh! " + pc.mf("Master", "Mistress") + ", welcome back!”</i> Your snowy haired sub exclaims excitedly, bowing to you with her hands behind her back obediently. <i>“Please let me know if you need anything!”</i>");
	}
	else output("You stride up to Inessa and get her attention.\n\n<i>“If there’s anything you need, feel free to ask. I’d be happy to help!”</i>");

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
	if(flags["INESSA_BELTED"] != 2) output("\n\nAlmost tragically, a silvery chastity belt guards her womanhood, fastened by a big lock. It’s the sort with tiny gaps, allowing for motion and breathing, and a T-shaped back that leaves her slender buttocks exposed.");
	else output("\n\nHer womanhood is on full display finally free from the dreaded chastity belt, her lips beading with their ever present moisture, only growing slicker as you allow your eyes to linger.");
	output("\n\nOn her upper right arm, there is a beautiful tree-branch tattoo wrapped around it with cherry-blossoms blooming.");
	//Have viewed her talk topic about skin mods:
	if(flags["INESSA_SKIN_MOD_TALKED"] == 1) output(" There’s also another skin-modded tattoo between her shoulderblades, just four words written in fancy, looped letters: <i>“Love Me, Lash Me”</i>.");
	if(flags["INESSA_BELTED"] == 2) output("\n\nAround her neck is the collar you presented her with, made of the same silvery metal as her old chastity belt and engraved with an elaborate floral design similar to her tattoo. Upon the front of the collar sits a reasonably-sized amethyst, carved into the shape of a heart with a padlock symbol set into it.");
	output("\n\nYou feel a little hornier " + (flags["INESSA_BELTED"] != 2 ? "for gazing at her. Given her burning cheeks, you’re not the only one" : "gazing at your wonderful sub, and seeing her so happy fills you with pride. Given her burning cheeks, you’re not the only one feeling worked up") + ".");
	
	// Raise lust by 5 for looking at nekkid girl.
	pc.lust(4);
	// Head back to Inessa’s main menu.
	inessaMenu();
	addDisabledButton(0,"Appearance","Appearance","You’re looking at her right now.");
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
		output("\n\n<i>“...Hey, you’re... you look familiar. I’m sure we’ve never met, though,”</i> the snowy-haired saeri ponders aloud. She brings her fingers up to form a frame and places you in it. As soon as she does, her eyes light up in recognition.");
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
		output(" <i>“...Perhaps you want to buy something for when you defeat a rival? We’ve got a delightful selection of whips and floggers.”</i>");
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
	else if (flags["INESSA_BELTED"] == 2) addDisabledButton(3,"Chastity B.","Chastity Belt","She isn’t wearing this anymore.");
	else addButton(3,"Chastity B.",chastityButt,undefined,"Chastity Belt","Ask her about her chastity belt... you just gotta!");
	//Family
	// Prereq: Must have viewed ‘Inessa’ talk topic.
	if(arg == inessaFamily) addDisabledButton(4,"Family","Family","You just finished discussing that.");
	else if(flags["INESSA_INESSAED"] == 1) addButton(4,"Family",inessaFamily,undefined,"Family","Ask her about her family.");
	else addDisabledButton(4,"Family","Family","You don’t know her well enough to ask her about this. Maybe ask her about herself first.");
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
		output("\n\nInessa nervously reaches around and grabs the end of her ass-length braid, playing with the tip. <i>“...W-well, where to start? My name’s Inessa O’Anyalicia. I’m in retail, if you hadn’t guessed.”</i>");
		output("\n\n<i>“I’m minding the store; it’s not really mine. There’s not really a whole lot else to me. OH! I like skin mods and bondage. And if you hadn’t guessed, I’m a sub.”</i>");
		output("\n\nYou ask her if she has a [pc.master]. The young woman quickly shakes her head.");
		output("\n\n<i>“No, no [pc.master] to speak of. I’ve actually never had one - my sister");
		//Gildenmere nuked
		if(flags["KQ2_MYRELLION_STATE"] > 0) output(" was ");
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
	output("<i>“Reeeallly?”</i> Inessa’s eyes light up. <i>“...Are you a, you know, a ");
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
	output("\n\n<i>“...More when I say, no sooner.”</i> You assert your authority in a firm, no-nonsense voice. Inessa shivers at your dominant tone, looking more than a little spellbound.");
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
			output("\n\n<i>“Sure was!”</i> Inessa jokes back. Until you realize she’s not joking–she’s actually serious.");
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
		output("\n\n<i>“Not off the top of my head–there’s not really that much more to tell, you know? Tell me about </i>yours<i>. What’s it like being [pc.aRaceShort]–?”</i>");
		output("\n\nYou tell her a bit about about being [pc.aRace], and she seems fascinated. Once you’re done talking, she looks at the time and gulps. <i>“Whoops... I was meant to be on the clock, but I got distracted by your story. I should really get back to work!”</i>");
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
		output("\n\n<i>“...Not my skin, silly. Touch the flowers!”</i> She exclaims. Her blue cheeks are flushed and you can feel her skin prickling beneath your fingertips. She must <i>really</i> enjoy being touched.");
		output("\n\nCorrecting your mistake, you brush your fingers against one of the white flower blossoms. You’re surprised to feel her skin texture change - it’s silky there, just like a rose petal!");
		output("\n\n<i>“Amazing! Must have been quite the skin modder,”</i> you genuinely exclaim. Getting such accurate detail in her genetics must have taken skill, time, and money.");
		output("\n\n<i>“She is, though half of it is genetic advantage. My species takes very well to gene mods,”</i> Inessa explains, turning her back to you and gesturing to her smooth upper back. <i>“...See, I got this one done yesterday, and you can hardly tell - no inflammation or anything!”</i>");
		output("\n\nShe lifts up her silvery-white hair braid so you can see it better. You spot a tattoo between her shoulder blades with just four words written in fancy, looped letters: ‘Love Me, Lash Me”</i>.");
		output("\n\n<i>“...Is that a request?”</i> You ask, quirking a brow.");
		output("\n\nThe alien girl blushes, letting go of her braid. <i>“Whoops, I didn’t realise how that came across! I, um, I really was just showing you my skin mods.”</i> She then leans back and looks up at you, her soft blue-green eyes shining. <i>“...Unless, of course, you wanted it to be?”</i>");
		output("\n\n<i>“You know... if you wanted to... love and lash me.”</i>");
		output("\n\nHer kissable lips are slightly parted, hovering very close to yours. You can feel her gentle breath warmly brushing over your own mouth, her breathing hurried and heated.");
		output("\n\nThe sweet smell of flowers fill the air. The electricity is palpable. Do you kiss her?");
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
	output("\n\n<i>“Hello there, dear! I presume you’re open...?”</i> The doggy domme asks, tilting her head. <i>“...Or, did I interrupt something between you and your [pc.Master]?”</i>");
	output("\n\n<i>“U-um, n-no... and [pc.heShe]’s not my [pc.Master],”</i> Inessa breathily responds, reluctantly pulling back from you. There’s a longing look in her eyes. <i>“...I-I’ll be with you right away, ma’am.”</i>");
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
	output("\n\n<i>“...Eh? Guess not.”</i> She pouts a little and spins around. Leaning back against the counter, there’s now an awkward silence.");
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

		output("\n\nInessa blushes and interlaces her fingers. <i>“...Um, you really want to know about that?”</i>");
	}
	else // Not first time clicking:
	{
		output("You’ve forgotten, so you ask again. Why is Inessa wearing a chastity belt exactly?");
		output("\n\nShe blushes and interlaces her fingers. <i>“...Wha–you forgot? You really want me to explain it all over again again?”</i>");
	}
	output("\n\nYou nod. Inessa takes a deep breath before spilling the beans. <i>“...I may have put it on. By accident. A customer asked me to try it on, so I did. They wanted to see it locked, and I thought, ‘that’s okay, I’ve got the key’.”</i>");
	output("\n\n<i>“Thing is, I didn’t. I still don’t. I’ve turned this store upside down looking for the key, and I can’t find it </i>anywhere<i>.”</i>");
	output("\n\nYou ask about getting it removed by other means, like a locksmith. Surely there’s other means?");
	output("\n\n<i>“You’d think, but this is the deluxe edition. It’s made of the same stuff that goes into spaceship hulls. The lock is just as bad; it looks low tech, but it’s actually top notch.”</i>");
	//Pc is smuggler:
	if(pc.characterClass == GLOBAL.CLASS_SMUGGLER) output("\n\nYou look at the chastity belt, thinking about your lockpicks... and you’re forced to agree. Damn. That’s a lock even <i>you’d</i> be hard pressed to crack.");
	output("\n\nInessa gives you a plaintive look, eyes glittering. <i>“...If you see a key anywhere, tell me, okay? I really want to get off... I mean, get it off!”</i>");
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
	if(flags["KQ2_MYRELLION_STATE"] > 0)
	{
		output("You ask Inessa about her sister, since you vaguely remember her saying she was a pro Domme. The butterfly-winged girl’s expression clouds over and her eyes tear up. She sniffles loudly and wipes her eyes.");
		output("\n\n<i>“U-u-uh... yeah... s-she </i>was<i>... y-you h-hear about that rush planet that got nuked? Myrellion? M-my big sister was on it. S-she had a clothing store...”</i> At this point, the storekeeper gets all choked up, then pups her face in her tiny hands. Unable to hide her grief, her body is wracked by wing-shaking sobs. <i>“...I-I’m s-sorry, c-can we talk about something else–?”</i>");
		output("\n\nInessa weepily grabs a hand cloth and wipes her eyes. She appears to be trying to calm herself down, taking long, deep breaths in an effort to not hyperventilate. Perhaps it’s best not to mention you were responsible for the death of her sister.");
	}
	//Else // You didn’t commit genocide, good for you!:
	else
	{
		//First Time clicking:
		if(flags["INESSA_FAMILYED"] == undefined)
		{
			flags["INESSA_FAMILYED"] = 1;
			output("You ask Inessa about her sister, since you vaguely remember her saying she was a pro Domme.");
			output("\n\nInessa smiles and leans back against the counter. <i>“Oh, yeah, I’ve got a </i>lot<i> of siblings. Twenty-four, in fact. My species generally have big families – well, at least compared to the uplifted ones.”</i>");
			output("\n\n<i>“I’m the twentieth daughter, one of the youngest. Most of them still live and work on Xhixia; that’s the siel and saeri home world. They’re pretty high-brow.”</i>");
			output("\n\n<i>“High brow? And they let their daughter run a sex store?”</i> You ask, a little puzzled.");
			output("\n\n<i>“Of course! Bondage is a noble profession among my species, even if it’s just selling the goods. My sister actually owns the store and makes the goods.”</i>");
			output("\n\nYou ask her if her sister lives on Tavros, since you haven’t seen her about. The saeri shopkeeper shakes her head.");
			output("\n\n<i>“No. Xanthe’s running a second store over on Myrellion - some boonie planet full of honey-filled ant girls - Zyi knows </i>why<i>.”</i> Inessa self-consciously touches her modest bust and pouts, <i>“...I hear they’ve all got melon-sized tits. Personally, I don’t see the appeal.");
			if(pc.biggestTitSize() >+ 5) output(" I-I mean, not that there’s anything wrong with </i>your breasts!”<i> She hastily adds.");
			output("”</i>");

			//Met Xanthe Before:
			if(flags["MET_XANTHE"] != undefined)
			{
				output("\n\nYou’re more caught up on the name. <i>“...Xanthe? As in, Silken Serenity Xanthe?”</i> You’re more than a little gobsmacked. What are the chances of running into her sister, several star-systems away?");
				output("\n\n<i>“Oh, you’ve met my sister?”</i> It’s Inessa’s turn to look stunned. <i>“...Wow, what are the odds? That’s crazy!”</i>");
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
					output("\n\n<i>“You know about siel mating habits, right? If she offers, I’d make sure you’ve got the rest of the week free,”</i> Inessa winks. <i>“...You’ll need that long to get your ability to walk back. We saeri are </i>much<i> gentler.”</i>");
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

public function inessaInventory():void
{
	chars["INESSA"].inventory = [];
	chars["INESSA"].inventory.push(new SukMastr());
	chars["INESSA"].inventory.push(new HoverHole());
	chars["INESSA"].inventory.push(new GravCuffs());
	//chars["INESSA"].inventory.push(new NivasBionaHole());
	//chars["INESSA"].inventory.push(new TamaniBionaHole());
	//chars["INESSA"].inventory.push(new EggTrainer());

	chars["INESSA"].inventory.push(new Whip());
	//Have biowhip if gotten to Myrellion.
	if(flags["PLANET_3_UNLOCKED"] != undefined)
	{
		if(!chars["INESSA"].hasItemByClass(BioWhip)) chars["INESSA"].inventory.push(new BioWhip());
	}
	//Else no whip
	else chars["INESSA"].destroyItemByClass(BioWhip, -1);

	chars["INESSA"].inventory.push(new Allure());

	chars["INESSA"].inventory.push(new MaidOutfit());
	chars["INESSA"].inventory.push(new LeatherStrapHarness());
	chars["INESSA"].inventory.push(new LatexBodysuit());
	chars["INESSA"].inventory.push(new SpacePirateOutfit());
	chars["INESSA"].inventory.push(new CheerleaderUniform());
	chars["INESSA"].inventory.push(new BunnyOutfit());
	chars["INESSA"].inventory.push(new SchoolgirlOutfit());
	if(flags["MET_SERA"] != undefined)
	{
		if(!chars["INESSA"].hasItemByClass(LeatherLeash)) chars["INESSA"].inventory.push(new LeatherLeash());
	}
	else chars["INESSA"].destroyItemByClass(LeatherLeash, -1);
	
	if(isHalloweenish())
	{
		if(!chars["INESSA"].hasItemByClass(WitchsOutfit)) chars["INESSA"].inventory.push(new WitchsOutfit());
	}
	else chars["INESSA"].destroyItemByClass(WitchsOutfit, -1);
}
//Buy
public function inessaBuyGo():void
{
	clearOutput();
	showInessa();
	author("JimThermic");
	shopkeep = chars["INESSA"];
	inessaInventory();
	shopkeep.keeperBuy = "You tell Inessa that you’d like to buy something. She beams and brings up a holographic stock guide.\n\n<i>“Sure! What would you like - clothes, sex gear, something else..?”</i>\n";
	
	CodexManager.unlockEntry("BionaHoles");
	CodexManager.unlockEntry("Grav Cuffs");
	//[Sex Gear] [Clothes] [Other]
	buyItem();
}

public function buyDildosFromInessa():void
{
	clearOutput();
	showInessa();
	author("Fenoxo&JimT");
	shopkeep = chars["INESSA"];
	chars["INESSA"].inventory = [new DildoCanine(), new DildoEquine(), new DildoFeline(), new DildoTerran()];

	shopkeep.keeperBuy = "You tell Inessa that you’d like to buy something. She beams and brings up a holographic stock guide.\n\n<i>“Sure! Which one would you..?”</i>\n";
	buyItem();
}

/*Sex Gear
public function inessaSexGearGo():void
{
	clearOutput();
	showInessa();
	author("JimThermic");
	shopkeep = chars["INESSA"];
	shopkeep.keeperBuy = "<i>“Sex gear!”</i> She swipes the air, bringing up a range of floating holographic items. <i>“...We’ve got quite a few in stock. Take your pick!”</i>";
	
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
		output("\n\n<i>“U-um, I don’t really want to offend you, but I’m only into dominant types. I like having my hair pulled, or being told what to do instead of asked. D-doing it vanilla style would be really lewd, and I’m just not that kind of girl!”</i> the saerie girl exclaims, hiding her blushing face behind her tiny hands. <i>“...I-I mean, doing it without ropes or blindfolds is something I’d only do with my " + pc.mf("husband and Master","wife and Domme") + " when we’re married, y-you know?”</i>");
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
	output("\n\n<i>“...More when I say, no sooner.”</i> You assert your authority in a firm, no-nonsense voice. Inessa shivers at your dominant tone, looking more than a little spellbound.");
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
	output("\n\n<i>“...More when I say, no sooner.”</i> You assert your authority in a firm, no-nonsense voice. Inessa shivers at your dominant tone, looking more than a little spellbound.");
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
	output("You decide to leave things as they are. She seems to really want a Dominant, and that’s just not your thing.");

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
	else if(pc.cumQ() < 6) addDisabledButton(0,"Blowjob","Blowjob","You’re tapped out. Give yourself a time to recover - and refill.");
	else addDisabledButton(0,"Blowjob","Blowjob","You need a dick 4 inches or more to have her suck it.");
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
	if(!pc.isTaur()) addButton(2,"BreastTease",breastTeaseInessaShit,undefined,"BreastTease","Tease the subbie little fuckterfly’s boobs.");

	//Face Strap-On
	// If pussy, vag. Else ass.
	addButton(3,"FaceStrap-On",faceStrapOnShitForInessa,undefined,"Face Strap-On","Inessa has a mask with a slot for a dildo over the mouth hanging from the wall. You could make her use it on you...");
	//Hand Job
	// PC must have cock.
	if(pc.hasCock()) addButton(4,"Handjob",getAHandjobFromInessy,undefined,"Handjob","Get a handjob from the slutty, sex-shop supplying sub.");

	//Requires: Inessa has submitted to PC
	if(pc.hasTailCock()) addButton(5,"Cuff&Tail",inessaWalksOnTheWildSide,undefined,"Cuff&Tail","Have some fun with a pair of grav cuffs and your cock-tail.");
	else addDisabledButton(5,"Cuff&Tail","Cuff&Tail","You don’t have the requisite tail-genitalia needed for this.");

	//INESSA EXPANSION - Vaginal
	//PC must have removed her belt
	if(flags["INESSA_BELTED"] == 2) addButton(6,"Vaginal",fuckInessaPussy,undefined,"Vagina","Fuck your saeri sub’s pussy.")
	
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
	
	var x:int = pc.longestCockIndex();
	
	output("You ");
	if(pc.legCount > 1) output("stride up");
	else output("shift");
	output(" until you’re standing a few feet short of the snowy-haired sub. Once there, you level a stern gaze at her, and cough under your breath.");
	output("\n\nThe moment Inessa looks into your eyes, she freezes on the spot, a doe-like look in her glittering eyes. <i>“U-um, can I help you?”</i> She nervously stammers out, clutching her hands together between her petite sized breasts.");
	output("\n\n<i>“Down. On your knees,”</i> you order her, staring her down. It’s as if you command gravity with your eyes. Slowly, as if pushed down by this great force, Inessa drops down to the ground. Once there, she looks up at you, a lost look in her innocent eyes. <i>“...Now, suck my cock.”</i>");
	output("\n\nInessa’s eyes widen and her jaw drops. There’s a visible gulp as she chances a look at ");
	if(!pc.isCrotchExposed()) output("your notable bulge");
	else output("your lewdly hanging [pc.cocksNounSimple]");
	output(". She squirms on the spot, looking like she really wants to get out of this, but is for whatever reason unwilling to defy your command. Instead, she tries to reason with you, looking up with big, bright eyes. <i>“Y-you seriously want me to suck ");
	if(pc.cockTotal() == 1) output("it");
	else output("those");
	output("... but what if a customer comes in?”</i> Inessa asks. She glances at the door, her butterfly wings flitting. She seems to think that if she looks up you with wavering eyes, you’ll let her off the hook!");

	output("\n\nWell, two can play at that game. You throw on your best dissapointed face and let out a long sigh. <i>“Oh, well, here you were flirting with me, thrusting out that tiny chest, saying you wanted a " + pc.mf("Dom","Domme") + ". I guess that was all a lie. I mean, if you can’t do something as simple as sucking my [pc.cocksNounSimple]...”</i>");
	output("\n\nInessa’s eyes shoot wide open, shocked as her plan to manipulate you backfires. <i>“–N-no! I’ll suck ");
	if(pc.cockTotal() == 1) output("it");
	else output("them");
	output("... please let me suck your cock");
	if(pc.cockTotal() > 1) output("s");
	output("!”</i> she breathily begs. You nod your assent");
	if(!pc.isCrotchExposed())
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
	if(pc.hasKnot(x)) output(" your knot");
	else output(" it");
	output(". She lightly jerks you off, marveling as your [pc.cockColor " + x + "] rod rises to attention in small spurtive jumps, your [pc.cockHead " + x + "] swelling with arousal. Her eyes dreamily flutter, and as if in a trance, she leans forward and gives it a sultry lick. The submissive girl’s eyes flicker up to you afterwards, her pink tongue still on your sensitive flesh; is she seeking your approval--?");
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
	output("\n\nYour [pc.cockNounSimple " + x + "] plops from her slickened lips and [pc.cumNoun] drools down her chin–there’s a deliciously spacey look in her starry eyes. Her breathing is hurried, and she’s flushing with arousal. As you pant for breath, you spot heavy " + (flags["INESSA_BELTED"] != 2 ? "moisture between her thighs, and dripping from the crotch of her chastity belt" : "streams of [inessa.girlCum] trail down between her thighs, dripping from her [inessa.vagina]") + ". It seems you weren’t the only one who enjoyed yourself! You order her to clean off your [pc.cocksLight] and the butterfly-winged girl dreamily licks your [pc.cumNoun]-covered rod");
	if(pc.cockTotal() > 1) output("s");
	output(" clean, her tongue curling around your length");
	if(pc.cockTotal() > 1) output("s");
	output(" and lovingly scooping up every single drop.");
	output("\n\n<i>“Good girl,”</i> you " + pc.mf("huskily","breathily") + " praise her, reaching out and stroking the top of her head. Like a kitten, Inessa instinctively leans into the palm of your hand, her soft hair rubbing against your fingers. There’s a blissfully happy look in her bright eyes.");
	output("\n\n<i>“D-did you want anything else?”</i> The butterfly-winged girl asks, your [pc.cum] dribbling down her chin and dripping on her small blue breasts. You shake your head");
	if(!pc.isCrotchExposed()) output(" and tuck your [pc.cocksLight] away");
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
	else if(!pc.isCrotchExposed())
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
			output("With a saucy grin, you slip behind one of the displays and sneakily strip off your [pc.lowerUndergarment]");
			if(!(pc.upperUndergarment is EmptySlot)) output(", leaving yourself clad only in your [pc.upperUndergarment]");
			output(". You then stride out when Inessa isn’t looking and plant your bare buttocks on the counter, pointedly crossing your legs. With a low whistle, you call the butterfly-winged shopkeeper over, who bounds up immediately.");
		}
	}
	output("\n\n<i>“Hi, can I help you?”</i> Inessa cheerily asks, hands clasped neatly in front of her. Your sense of sadistic excitement heightens. Like a cat and a mouse, you want to play with her, to see how she’ll react to what you have planned–and which direction she will skitter! Time to put on your best poker face...");

	output("\n\n<i>“Oh, yes, you </i>can<i> actually,”</i> you cheerfully remark, spreading your [pc.thighs] wide");
	if(hasSkirt()) output(", lifting the lower hem of your [pc.armor],");
	output(" and putting your [pc.vaginas] pointedly on display. <i>“...I need someone to lick this for me, and you look like you’re just right for the job.”</i>");

	output("\n\nThe butterfly-winged girl’s reaction is <i>priceless</i>. Her starry eyes fly wide open and her mouth gapes. <i>“Whuh-what did you say?”</i> She positively squeaks. In response, you sensuously reach down, pointedly parting your [pc.vaginaColor] lips. You’re a little <i>moist</i> inside–what from all the teasing–and the subby girl blushes at the very lewd sight.");
	output("\n\n<i>“I said </i>lick me<i>. You’re good for that much, aren’t you?”</i> You tease, rolling one of your fingertips over [pc.oneClit]. Inessa blushes and tries to look away, but her eyes keep flicking excitedly to your bare [pc.vaginaColor] mound. Still, the butterfly-winged beauty submits to your unreasonable demand, placing her delicate fingers on your parted thighs. After squatting down, she positions her burning cheeks below them and inches closer towards your [pc.vaginaNoun], buffering it with excited warm breaths.");
	if(hasSkirt()) output(" Her head disappears beneath the hem of your skirt, though you can still see her smooth naked back and cute fae-like wings.");

	output("\n\nSeconds later, you can feel Inessa’s tongue brushing against your slick lower folds. You let out a shameless moan and grab the back of her head, pushing her eagerly into your [pc.vaginas]. You’re pleasured with wet, long licks on your sensitive nethers and pointed suckling on your [pc.clits]. Coiling pleasure pools within your belly. Right now your licked loins feel like they’re pulsing and on fire, positively brimming with sensual pleasure that diffuses through every inch of your being. You grind your hips up and against her face, groaning as her tongue slavishly slides inside of your soppy slit. It’s like you’re being fucked with her tongue, and all you can do is grind against it, trying to get it to penetrate <i>deeper</i> and <i>harder</i>...");
	output("\n\n... When that coil unfolds, ripples of unadulterated ecstasy flood through your very being, and you are filled to the brim with that ultimate, all-consuming joy. You shudder HARD and cum uncontrollably against the butterfly girl’s soft cheeks, crying out in sublime climax. When you’re finally finished, you fall back against the counter, feeling your eyes roll back into your head and your sweaty body relax. There’s a sweet licking at your utterly drenched nethers–it feels like Inessa is diligently cleaning your no-doubt [pc.girlCumNoun] splattered pussy. By her sweet little moans, it seems she loves the taste.");

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
	output("\n\n<i>“Hi! Is there something you need?”</i> Inessa asks, her butterfly wings flitting about. She unconsciously presses her upper arms against the sides of her breasts, pressing her handfuls together and out. It’s admirable how she works with what she has, and truth be told, there’s something appealing about her little peaks.");
	output("\n\n<i>“Yes, there is,”</i> you remark, petting the bed. <i>“I want to try out this bed. I’m not exactly sure I want to buy it otherwise.”</i>");
	output("\n\nInessa’s eyes shoot open, an excited look in her eyes. <i>“Oh, this is a really good bondage bed, made of solid Selyan oak!”</i> She reaches out to stroke one of the ornate posts. <i>“There’s plenty of fasteners for ropes, but the great thing is that you can just use it as a normal bed if you want. It’s super comfy.”</i>");
	output("\n\n<i>“Prove it,”</i> you dare her, pushing yourself back on the bed and lying down. <i>“Lie in bed with me. I want to see what it feels like with another person in it. I don’t want to buy it and just find out it’s too small...”</i>");
	output("\n\n<i>“U-um, really? I-I guess that makes sense...”</i> Inessa practically squeaks, climbing up and onto the satin sheets. You pat the spot next to you, under your arm, and the butterfly-winged shopkeeper cuddles up into it. <i>“...T-this feels kind of intimate...”</i> She murmurs, fingers balling up against your side. She’s warm, slight, and definitely the right size for having under your arm.");

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

	output("\n\nYou pinch and tease her pert little nubs, caressing her into insensibility until she’s practically flailing about with pleasure. As small as they are, they’re incredibly sensitive! You grin and flick her nipples, watching as she lets out a sharp whimpering cry, her hips spasming and shaking in your lap. <i>“H-hah–not so hard-!”</i> The butterfly-girl whimpers, yet her breathing is labored. <i>Yeah right</i>, you think, there’s an incredibly obvious slickness leaking out from between her thighs! A few more flicks and she’s quaking on the spot, unable to control her body. " + (flags["INESSA_BELTED"] != 2 ? "There’s a loud <i>squiiiirt</i> and a slick rope of thin, sticky liquid jumps out through the gaps in her chastity belt" : "Several squirts of [inessa.girlCum] emit from her over-excited [inessa.vaginaNoun]") + ". It splatters on your belly, followed by a few more jumping spurts, her hands desperately clenching at the silky sheets.");

	output("\n\n<i>“AHH-Ahhhh–hah!”</i> She breathily cries, before looking down and realizing in utter shock the mess she made. <i>“Oh, oh my Zyi–! ");
	if(flags["INESSA_TITTYSQUIRT"] == undefined)
	{
		output("U-um, I’m so sorry, that’s never happened before!");
		flags["INESSA_TITTYSQUIRT"] = 1;
	}
	else output("I-I can’t believe I just squirted on you... again!");
	output("”</i> she panics, clearly mortified at covering you in her slick girl juice. Instead of complaining, however, you reach down and dab your finger in it, then bring it up to suckle upon. It’s so deliciously sweet! And you want more...");
	output("\n\n<i>“I want </i>more<i>,”</i> you hungrily tell her. There must be a predatory look in your eyes, because she freezes on the spot, her own bright eyes wide as can be. Flipping her onto her back, you hungrily lash at her silky inner thighs, lapping at the thin, sticky streams of feminine fluid that drooled down from her " + (flags["INESSA_BELTED"] == 2 ? "naked" : "guarded") + " snatch. The butterfly-winged girl moans and grips the bedsheets above her head as you aggressively tongue-lash so <i>close</i> to her " + (flags["INESSA_VIRGINITY"] == undefined ? "virgin" : "hungry") + " pussy, like an animal pouncing on [pc.hisHer] favorite meal. <i>“O-oh Zyi, I-It’s too much–!”</i>");
	output("\n\nYou’re caught off guard as <i>another</i> weaker splash of sticky girl-cum jumps out and splashes you directly in the cheek. You chuckle under your breath and lap up what’s left, taking it all for yourself. Once you’re done, you slide up her trembling body and give her a long, lusty kiss–sharing with her the taste of her sweet lady juice as your tongue dance with each other.");
	output("\n\n<i>“...I don’t think I’ll take the bed, but I’ll certainly take </i>you<i>,”</i> you seductively murmur in her ear, and she squirms with barely concealed delight. You give her a parting kiss before hopping off the bed, leaving the poor saeri girl to recuperate from her back-to-back orgasms. By the way she’s splayed out across the silky sheets, she definitely needs it!");
	processTime(27);
	if(!chars["INESSA"].hasVagina()) chars["INESSA"].createVagina();
	pc.girlCumInMouth(chars["INESSA"]);
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
	if(flags["HOVERHOLE_USES"] == undefined) output("There aren’t any buttons to be seen, but it <i>did</i> come with a manual with verbal commands–apparently it’s the complete ‘hands free’ experience.");
	output("\n\n<i>“Customized user: [pc.fullName],”</i> you announce. The tube-like device shoots out a cyan light that sweeps over your whole body, before fixating pointedly on your prick.");

	//if pc has canine cock:
	if(pc.cocks[x].cType == GLOBAL.TYPE_CANINE)
	{
		output("\n\n<i>“[pc.fullname] registered. Now accommodating for customized size and shape.”</i> It suddenly begins to shift in your hands, transforming into a furry canine-like pussy, perfectly shaped like that of a puppy slut. Eager fluids leak from the now knottable mound and make your head spin–it smells exactly like she’s... no... <i>it’s</i> in heat! Still, your [pc.cock " + x + "] twitches and swells in anticipation of a mating, utterly unable to tell the difference.");
	}
	//else if pc has equine cock:
	else if(pc.cocks[x].cType == GLOBAL.TYPE_EQUINE)
	{
		output("\n\n<i>“[pc.fullname] registered. Now accommodating for customized size and shape.”</i> It suddenly begins to shift in your hands, transforming into a lightly furred horse pussy, replete with pitch-black lips.The equine pussy flares and invitingly flashes its pink drooling insides, making your head spin–it smells <i>exactly</i> like a mare in heat! Your [pc.cock " + x + "] twitches and pre-cum drools from your [pc.cockHead " + x + "], completely unable to tell the difference.");
	}
	//else if pc.has feline cock
	else if(pc.cocks[x].cType == GLOBAL.TYPE_FELINE)
	{
		output("\n\n<i>“[pc.fullname] registered. Now accommodating for customized size and shape.”</i> It suddenly begins to shift in your hands, transforming into a feline-like snatch, perfectly shaped like that of a kathrit female. Eager fluids leak from its furry kitty-lips and your head spins–it smells exactly like she’s... no... <i>it’s</i> in heat! Still, your [pc.cock " + x + "] twitches and swells in anticipation of a mating, utterly unable to tell the difference.");
	}
	//else if pc has kui-tan cock
	else if(pc.cocks[x].cType == GLOBAL.TYPE_KUITAN) output("\n\n<i>“[pc.fullname] registered. Now accommodating for customized size and shape.”</i> It suddenly begins to shift in your hands, transforming into a furry racoon pussy, perfectly shaped like that of a kui-tan lady-herm. Eager fluids leak from its onyx lips and your head spins–it smells exactly like she’s... no... <i>it’s</i> in heat! Still, your [pc.cock " + x + "] twitches and swells in anticipation of a mating, utterly unable to tell the difference.");
	//else if pc has leithan cock:
	else if(pc.cocks[x].cType == GLOBAL.TYPE_LEITHAN) output("\n\n<i>“[pc.fullname] registered. Now accommodating for customized size and shape.”</i> It suddenly begins to shift in your hands, transforming into a leithan cunt to match your twitching tool. The musty snatch flares and invitingly flashes its drooling insides, making your head spin–it smells <i>exactly</i> like a mare in heat! Your [pc.cock " + x + "] twitches and pre-cum drools from your [pc.cockHead " + x + "], completely unable to tell the difference.");
	else if(pc.cocks[x].cType == GLOBAL.TYPE_HUMAN) output("\n\n<i>“[pc.fullname] registered. Now accommodating for customized size and shape.”</i> It suddenly begins to shift in your hands, transforming into a human-like pussy perfectly sized to accommodate your " + Math.floor(10*pc.cocks[x].cLength())/10 + "-inch terran dick. Just seeing it gets you hot and bothered–a perfect pussy literally tailored to your " + pc.mf("manhood","lady-dick") + "!");
	else // Anything else!:
	{
		output("\n\n<i>“[pc.fullname] registered. Now accommodating for customized size and shape.”</i> It suddenly begins to shift in your hands, transforming into a pussy perfectly sized to accommodate your " + Math.floor(10*pc.cocks[0].cLength())/10 + "-inch dick. Just seeing it gets you hot and bothered–a perfect pussy literally tailored for the shape of your " + pc.mf("manhood","lady-dick") + "!");
	}

	//if Public:
	if(rooms[currentLocation].hasFlag(GLOBAL.PUBLIC))
	{
		output("\n\nHolding your talking pocket-pussy has certainly drawn the eyes of onlookers, who are watching now with obvious curiosity and bafflement. They don’t have to wait long to find out what you have planned, however, as you ");
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
		if(rooms[currentLocation].planet == "TAVROS STATION") output("\n\nNow that they realize what’s going on, the station denizens gasp and try to turn their eyes from your sordid display, trying to ignore the naked [pc.race] now fiercely bucking [pc.hisHer] hips against a floating sex toy, moaning with carnal pleasure. For just as many who wear looks of absolute disgust, many others look more than a little stirred up by the public scene, their fingers subconsciously drifting to their nethers....");
		else if(rooms[currentLocation].planet == "PLANET: MHEN’GA") output("\n\nNow that they realize what’s going on, the nearby Esbethians murmur amongst themselves. Some of them subconsciously begin touching themselves; turned on by the sight of the floating fuck-toy milking your [pc.cockNoun " + x + "] and your wild bucking right back!");
		else if(rooms[currentLocation].planet == "PLANET: TARKUS") output("\n\nAs you moan out loud and hump back at the sex toy, the horny raskvel start touching themselves to your sordid display. You can see the bunny-like natives stroking their long purple cocks or pussy lips, in some cases touching each other’s. This is threatening to turn into a full on orgy!");
		else if(rooms[currentLocation].planet == "PLANET: NEW TEXAS") output("\n\nAs you moan out loud and hump back at the sex toy, the crowd watches with lusty eyes and begin stroking themselves off, in some cases touching each other’s privates and giving a helping hand. This is threatening to turn into a full on orgy!");
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
	IncrementFlag("HOVERHOLE_USES");
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
// Cuff&Fuck.tooltip: Use your grav-cuffs to pin down [enemy.name] and have your way with [enemy.hisHer] [pc.vagOrAssNoun]! Requires Grav-cuffs and a penis.

public function cuffNFuckButton(btnSlot:int = 0, sexedFoe:Creature = null):void
{
	if(sexedFoe == null) return;
	if(pc.hasItemByClass(GravCuffs) && pc.lust() >= 33)
	{
		var fitsInside:Boolean = false;
		if(sexedFoe.hasVagina()) fitsInside = (pc.cockThatFits(sexedFoe.vaginalCapacity(0)) >= 0);
		else fitsInside = (pc.cockThatFits(sexedFoe.analCapacity()) >= 0);
		
		// I don't get what this was attempting to even do in the first place, but I'l working around it (due to Foes being gone)
		//if(sexedFoe != foes[0]) foes[0] = sexedFoe;
		
		setEnemy(sexedFoe); // This should already be set by the combat system, so really we're only setting it in cases where we got here outside of combat.
		
		if(pc.hasCock() && fitsInside) addButton(btnSlot, "Cuff&Fuck", cuffNFuck, undefined, "Cuff & Fuck", "Use your grav-cuffs to pin down [enemy.name] and have your way with [enemy.hisHer] [enemy.vagOrAss]! Requires Grav-cuffs and a penis.");
		else if(pc.hasCock()) addDisabledButton(btnSlot, "Cuff&Fuck", "Cuff & Fuck", "You can cuff [enemy.himHer] down, but you wouldn’t be able to fit inside.");
		else addDisabledButton(btnSlot, "Cuff&Fuck", "Cuff & Fuck", "You need a penis to make use of your grav-cuffs this way.");
	}
}

public function cuffNFuck():void
{
	clearOutput();
	author("JimThermic");
	
	output("Now that you’ve defeated [enemy.name], you know exactly what to do with [enemy.himHer]. As [enemy.heShe] reels from the effects your battle, you pull out your grav-cuffs. With a commanding whistle, you toss them up and out in front of you. They immediately hone in and clamp on your felled opponent’s wrists and ");
	if(enemy.legCount == 1) output("[enemy.legNoun]");
	else output("[enemy.legsNoun]");
	output(". Within seconds, [enemy.name] is forced to the ground, [enemy.hisHer] [enemy.ass] shamefully pressed in the air.");
	// One in three chance of pumping out one of the dialogue chunks below, just to keep the scene fresh.
	//Random text output (⅓ chance):
	if(rand(3) == 0)
	{
		output("\n\n<i>“W-what’s going on--?”</i> [enemy.name] stammers. [enemy.HeShe] tries to pull [enemy.hisHer] [enemy.skinColor] hands off the ground, but [enemy.heShe] can’t budge an inch.");
		output("\n\nStriding up to your prostrate opponent, you stroke [enemy.hisHer] butt and give it a ");
		if(pc.isNice()) output("playful pat");
		else if(pc.isMischievous()) output("cheeky slap");
		else output("sharp slap");
		output(".");
		output("\n\n<i>“Winners get to set the rules. You’re following mine now, hon.”</i>");
	}
	//Random text output (⅓ chance):
	else if(rand(2) == 0)
	{
		output("\n\n<i>“Wha-what did you do to me?!”</i> [enemy.name] splutters. [enemy.HisHer] [enemy.ass] wiggles about enticingly as [enemy.heShe] tries to tug free of the cuffs to no avail.");
		output("\n\nStriding up to your prostrate opponent, you stroke [enemy.hisHer] butt and give it a ");
		if(pc.isNice()) output("playful pat");
		else if(pc.isMischievous()) output("cheeky slap");
		else output("sharp slap");
		output(".");
		output("\n\n<i>“You, dear, aren’t going anywhere. From now until I decide otherwise, this ass belongs to me.”</i>");
	}
	//Random text output (⅓ chance):
	else
	{
		output("\n\n<i>“My wrists, my ");
		if(enemy.legCount == 1) output("[enemy.legNoun]");
		else output("[enemy.legsNoun]");
		output(" - I can’t move?!”</i> [enemy.name] cries out, trying in vain to tug [enemy.hisHer] wrists and [enemy.feet] free of the ground.");
		output("\n\nStriding up to your prostrate opponent, you stroke [enemy.hisHer] butt and give it a ");
		if(pc.isNice()) output("playful pat");
		else if(pc.isMischievous()) output("cheeky slap");
		else output("sharp slap");
		output(".");
		output("\n\n<i>“Got a complaint? You should have thought of that before turning your [enemy.weapon] on me.”</i>");
	}
	output("\n\n");
	if(!pc.isCrotchExposed()) output("You strip off your gear, then");
	else output("Once you’re ready, you");
	output(" grab [enemy.hisHer] wiggling hips from behind, unceremoniously flopping [pc.oneCock] onto [enemy.hisHer] ass. Teasing [enemy.himHer] for a bit, you grind it back and forth between [enemy.hisHer] buttocks, getting yourself nice and hard before sliding it in [enemy.hisHer] [enemy.vagOrAss].");
	
	pc.cockChange();
	
	output("\n\n" + enemy.capitalA + enemy.short + " gasps and arches [enemy.hisHer] back, trembling at your sudden entry. [enemy.HisHer] insides clench tightly around the foreign intruder suddenly ");
	
	var capacity:Number = 0;
	if(enemy.hasVagina()) capacity = enemy.vaginalCapacity();
	else capacity = enemy.analCapacity();
	var x:int = pc.cockThatFits(capacity);
	
	//1/2 or lower capacity:
	if(pc.cockVolume(x) < capacity/2) output("wiggling around inside of [enemy.himHer]");
	else output("stretching [enemy.himHer] open");
	output(". Soon your [pc.cockHead " + x + "] has bottomed out inside of [enemy.hisHer] ");
	if(enemy.hasVagina()) output("[enemy.vaginaColor] box");
	else output("[enemy.skinColor] butt");
	output(".");

	//VirginPussy:
	if(enemy.hasVagina() && enemy.vaginalVirgin)
	{
		output("\n\nA thin line of red runs down [enemy.hisHer] [enemy.thigh]. You pause as [enemy.heShe] hangs [enemy.hisHer] head, quivering around your length buried in her unsullied depths. [enemy.HeShe] was a virgin!");
		output("\n\nOnce [enemy.heShe]’s adjusted to the strange new thing buried in [enemy.hisHer] [enemy.pussy],");
	}
	else output("\n\nSlowly,");
	output(" you begin to slap your hips against [enemy.name]’s rear end. [enemy.HisHer] ");
	if(enemy.hasVagina()) output("slickening snatch");
	else output("naughty backdoor");
	output(" sweetly wrings your [pc.cock " + x + "]. As you groan and grind against [enemy.himHer], a " + enemy.mf("throaty","sweet") + " moan escapes [enemy.hisHer] [enemy.lips].");

	//Randomized Output:
	output("\n\n<i>“");
	if(rand(5) == 0) output("Oh, so you’re enjoying it?");
	else if(rand(4) == 0) output("Was that a moan I heard?");
	else if(rand(3) == 0) output("Oh, that good, huh?");
	else if(rand(2) == 0) output("Like my [pc.cockNoun " + x + "], do you?");
	else output("Oh, so you like your [enemy.vagOrAss] being fucked?");
	output("”</i>");

	output("\n\n<i>“N-no!”</i> " + enemy.capitalA + enemy.short + " blurts out. Despite [enemy.hisHer] words, [enemy.hisHer] [enemy.ass] is instinctively slapping back against your [pc.hips], [enemy.hisHer] own lifting to allow you deeper access.");
	output("\n\nGrinning in amusement, you ");
	//enemy.hasTail: 
	if(enemy.tailCount > 0) output("grab [enemy.hisHer] [enemy.tails]");
	else output("grab [enemy.hisHer] waist");
	output(" and pick up the pace. " + enemy.capitalA + enemy.short + " grinds back against you, wringing your [pc.cock " + x + "] and moaning in ecstasy. Suddenly [enemy.heShe]’s crying out and cumming hard around you, [enemy.vagOrAss] trembling");
	if(enemy.hasCock() || enemy.hasVagina()) output(", ");
	if(enemy.hasCock()) output("[enemy.cocks] spurting [enemy.cum] all over [enemy.hisHer] [enemy.belly]");
	if(enemy.hasCock() && enemy.hasVagina()) output(" and ");
	if(enemy.hasVagina()) output("[enemy.girlCum] wetly gushing around your pistoning prick");
	output(".");

	output("\n\n<i>“");
	if(rand(5) == 0) output("Did you just cum?");
	else if(rand(4) == 0) output("Funny, I swear you just came just then.");
	else if(rand(3) == 0) output("Weren’t you just saying you weren’t enjoying yourself? Such a liar!");
	else if(rand(2) == 0) output("You just came around my [pc.cockNoun " + x + "] - how did it feel?");
	else output("Cumming around my [pc.cockNoun " + x + "] - what a naughty " + enemy.mf("boy","girl") + "!");
	output("”</i>");

	output("\n\n" + enemy.capitalA + enemy.short + " flushes at your words, lowering [enemy.hisHer] head, [enemy.hisHer] ");
	if(enemy.hasVagina()) output("pussy");
	else output("rectum");
	output(" still quivering around your [pc.cock " + x + "]. With a grin, you begin fucking it with slamming thrusts, stirring up [enemy.hisHer] sensitive insides. [enemy.HeShe] melts and frantically slaps [enemy.hisHer] butt back against you, desperate for more. It’s not long before [enemy.heShe] is cumming again, babbling and shaking in [enemy.hisHer] cuffs.");
	
	var cumQ:Number = pc.cumQ();
	
	output("\n\nThe third time [enemy.name] cums you finally reach your own peak, groaning and ");
	if(cumQ < 5) output("dribbling");
	else output("spilling");
	output(" your hot, [pc.cumVisc] load inside of [enemy.hisHer] well-fucked hole. ");
	if(cumQ < 7) output("The barest dribbles of [pc.cumNoun] escape your flaring cockhole, splattering anti-climactically into [enemy.hisHer] [enemy.vagOrAss]. Still, it feels <i>amazing</i>!");
	else if(cumQ < 100) 
	{
		output("You spurt your [pc.cumNoun] ");
		if(enemy.hasVagina()) output("against [enemy.hisHer] cervix ");
		output(" and spill your baby-batter into [enemy.hisHer] ");
		if(enemy.hasVagina()) output("receptive womb until it is");
		else output("bowels until they are");
		output(" filled with your seed.");
	}
	else if(cumQ < 4000)
	{
		output("A font of [pc.cumNoun] surges from your cock-tip and quickly fills up [enemy.hisHer] ");
		if(enemy.hasVagina()) output("[enemy.pussy] and womb");
		else output("bowels");
		output(", filling it up to near breaking point.");
	}
	else
	{
		output("G");
		if(pc.cumType != GLOBAL.FLUID_TYPE_SPECIAL_GOO) output("ooey g");
		output("allons of [pc.cumNoun] gush from your [pc.cockHead " + x + "] and overfill [enemy.hisHer] ");
		if(enemy.hasVagina()) output("[enemy.pussy] and womb");
		else output("bowels");
		output(", leaving [enemy.himHer] with a swollen belly that makes [enemy.himHer] look ");
		if(enemy.isPregnant()) output("even more ");
		output("pregnant.");
	}
	
	if(enemy.hasVagina()) enemy.loadInCunt(pc, 0);
	else enemy.loadInAss(pc);
	
	output("\n\nAfterwards, you pull your [pc.cockNoun " + x + "] from [enemy.hisHer] [enemy.vagOrAss] and snap your fingers. The cuffs undo around [enemy.name]’s wrists and [enemy.legs]. " + enemy.capitalA + enemy.short + " immediately falls to [enemy.hisHer] side, a dreamy look on [enemy.hisHer] [enemy.face]");
	if(cumQ >= 7) 
	{
		output(", and a stream of [enemy.cum] dribbling ");
		if(enemy.legCount >= 2) output("down [enemy.hisHer] [enemy.thighs]");
		else output("out of [enemy.hisHer] [enemy.vagOrAss]");
	}
	output(".");
	
	// NPC Pregnancy handling
	if(enemy.hasVagina())
	{
		//if(enemy is ZilFemale) {}
		//if(enemy is ZilMale) {}
		//if(enemy is Naleen) {}
		if(enemy is MaidenVanae) StatTracking.track("characters/maiden vanae/cherrys popped");
		//if(enemy is HuntressVanae) {}
		if(enemy is RaskvelFemale) knockUpRaskChance();
		//if(enemy is MyrGoldFemaleDeserter) {}
		if(enemy is MyrRedFemaleDeserter) knockUpRedBitchChance();
		//if(enemy is NyreaAlpha) {}
		//if(enemy is NyreaBeta) {}
	}
	
	processTime(33);
	pc.orgasm();
	enemy.orgasm();
	IncrementFlag("GRAVCUFFS_USES");
	output("\n\n");
	
	if(inCombat())
	{
		CombatManager.genericVictory();
	}
	else
	{
		setEnemy(null);
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
}

//New Texan Gang-Bang
// PC must have grav-cuffs in their inventory and be on New Texas.
// It’s up to you if you tie this scene to a static room, or have it as a masturbation option on-planet when the PC has grav-cuffs in their inventory.
public function newTexanGanguBangu():void
{
	clearOutput();
	author("JimThermic");
	showName("PUBLIC\nUSE");
	output("Looking around the New Texan landscape, your cheeks burn bright red as you watch the exquisite display of the perfectly masculine and feminine walking about. No other planet is so <i>extreme</i> in their separation of gender.");
	if(pc.hasCock() && !pc.hasVagina()) output(" So what if you were to tie yourself up in an unmanly fashion and let them have their way with you?");
	else if(pc.hasVagina() && !pc.hasCock()) {
		output(" You have no doubt what will happen to you " + pc.mf("",", a woman,") + " if you strip and tie yourself up here, just like another breeding cow!");
	}
	else {
		output(" If you were to strip and tie yourself up here, what with your ");
		if(pc.hasCock() && pc.hasVagina()) output("different sets");
		else output("lack");
		output(" of genitals, you wonder what they would make of you?");
	}

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

	output("\n\n<i>“Hi there, " + pc.mf("boy","honey") + ".");
	if(flags["NEW_TEXAS_GANGBANGED"] == undefined) output(" Fancy a ride with some real alphas?");
	else output(" Couldn’t stay away from us, eh?");
	output("”</i> One of the bulls seizes your hips in his large, powerful hands. Moments later, ");
	if(pc.hasCock() && !pc.isTaur()) output("[pc.oneCock] is grinding against the girthy underside of his cock! Your own [pc.cockHead] excitedly leaks pre out and down between your rubbing shafts, slickening your sensuous dick-friction.");
	else if(pc.hasVagina() && !pc.isTaur()) output("[pc.oneVagina] is grinded against the girthy underside of his cock! Your sloppy folds eagerly part against his equine cock and liberally slicken it with your excitement.");
	else output("your bare loins are grinded against the girthy underside of his cock!");

	if(flags["NEW_TEXAS_GANGBANGED"] == undefined) 
	{
		output("\n\nYou’re utterly shocked when one of the bulls suddenly kisses you, your [pc.lips] locked in a passionate, tongue-filled kiss. Yielding to his insistent tongue and rubbing loins, you find yourself pressing your hips right back, needily rubbing ");
		if(pc.hasCock() && !pc.isTaur()) 
		{
			output("your dick against his. You blush as you realize ");
			if(pc.biggestCockLength() < 14) output("yours is tiny in comparison!");
			else if(pc.biggestCockLength() < 15) output("you’re exactly the same size!");
			else if(pc.biggestCockLength() <= 17) output("yours is a bit larger!");
			else output("yours is freakishly big in comparison!");
		}
		//else ifpc.hasFrontPussy:
		else if(pc.hasVagina() && !pc.isTaur()) output("your [pc.vagina] against his turgid twat-tamer.");
		else output("your smooth groin against his turgid twat-tamer.");
	}

	output("\n\nAs you’re distracted by the delectable friction, another burly bull circles around you. Suddenly, your hips are grabbed from behind and a girthy horse cock is being needily rubbed between your buttocks! You moan and throw back your head, relishing in the two bulls grinding against your privates. H-how can you endure such an assault from two directions?");

	var x:int = 0;
	var frontCock:Boolean = false;
	var frontPussy:Boolean = false;
	if(pc.hasCock() && pc.genitalLocation() <= 1) frontCock = true;
	if(pc.hasVagina() && pc.genitalLocation() <= 1)
	{
		frontPussy = true;
		x = rand(pc.totalVaginas());
	}
	//if Pc.hasFrontCock:
	if(frontCock) 
	{
		output("\n\n<i>“Look at this - [pc.heShe]’s already about to blow!”</i> The first bull reaches down and caresses your [pc.cockHead]. You whimper with delight as he rubs your cock hole with his thick, calloused thumb.");
		output("\n\n<i>“Your cock");
		if(pc.cockTotal() != 1) output("s");
		output(" and ass belong to us now, slut.”</i>");
	}
	//else if Pc.hasFrontPussy:
	if(!frontCock && frontPussy)
	{
		output("\n\n<i>“Look at this - [pc.heShe]’s getting all wet!”</i> The first bull strokes your soppy slit with his thick, calloused fingers. He slips one inside of you and wiggles it about, causing you to whimper with pleasure - he’s <i>inside</i> of you!");
		output("\n\n<i>“Your puss");
		if(pc.totalVaginas() == 1) output("y");
		else output("ies");
		output(" and ass belong to us now, slut.”</i>");
	}
	//else // No front genitals:
	if(!frontPussy && !frontCock)
	{
		output("\n\n<i>“Look at this - [pc.heShe]’s about to cream [pc.himHer]self!”</i> The first bull grabs one of your [pc.nipples] and roughly squeezes it, causing you to whimper in delight.");
		output("\n\n<i>“Your ass belongs to us now, slut.”</i>");
	}
	output("\n\nA thrilling shiver courses through your body from their demeaning words. This is your true nature; not [pc.fullName], galactic adventurer, but a naughty, bull-cum loving slut! Every inch of you <i>aches</i> for their throbbing horse-cocks, yearning for them rubbing ");
	if(frontCock) output("against and ");
	output(" deep inside of you");
	if(!frontCock && frontPussy) output("r sloppy snatch");
	output("!");

	//PCisACow:
	if(pc.race().toLowerCase().indexOf("cow") != -1 || (pc.isTreated() && pc.isBimbo())) output("\n\n<i>“Please enjoy your slutty fuck cow,”</i> you huskily moan, mooing and rubbing yourself desperately against their delectable dicks. You’re a cow, and cows are meant to get fucked and mated by bulls!");
	else
	{
		output("\n\n<i>“I-I’m your slutty little [pc.raceCuteShort] whore - please use me as you wish!”</i> you huskily moan, rubbing yourself against their delectable dicks. It feels so <i>right</i>, like this is your purpose, to be the bull’s ");
		if(pc.biggestTitSize() < 1) output("flat-chested");
		else if(pc.biggestTitSize() <= 2) output("small-breasted");
		else if(pc.biggestTitSize() <= 4) output("bare-breasted");
		else if(pc.biggestTitSize() <= 9) output("big-breasted");
		else output("huge-breasted");
		output(" fuck-toy!");
	}

	output("\n\n<i>“Oh, we will. Prepare to have your ass fucked, slut!”</i> You cry out as a flat equine head forces its way into your [pc.asshole]. Oh god, your [pc.ass] is totally impaled on his fleshy rod!");
	var virgin:Boolean = pc.analVirgin;
	var assLooseness:Number = pc.ass.looseness();
	pc.buttChange(500);

	output("\n\n<i>“How does it feel to have a bull dick inside of that ass of yours?”</i> The bull behind you asks, flexing his massive manhood. You feel his equine head flaring inside of you - you swear he’s buried right up in your belly. <i>“");
	if(virgin || assLooseness <= 1) output(" You’re so tight - just like a virgin!");
	else if(flags["NEW_TEXAS_GANGBANGED"] != undefined) output("I can tell your asshole misses me!");
	else output("I can tell your asshole has been put to good use!");
	output("”</i>");

	if(virgin) output("\n\nYou blush - you <i>are</i> a virgin, or at least - this is the first time you’ve had anything, let alone a girthy cock like his, up your ass! Just the thought of having your anal cherry plucked by him makes your heart flutter.");

	//Not Virgin:
	else
	{
		output("\n\nAll you can do is whimper in delight - ");
		if(flags["NEW_TEXAS_GANGBANGED"] == undefined) output("words are not possible with his mammoth phallus buried deep in your ass! Instead, you show your approval by grinding back against his turgid tool");
		else output("your [pc.ass] indeed missed his mammoth phallus inside of it! You show him just how much you missed his turgid tool by grinding back against it.");
		output(" You excitedly wring and clench it with your ");
		if(virgin) output("formerly virgin");
		else output("well-stretched");
		output(" pucker. The muscular male flexes and flares inside of you in happy response - he clearly loves what you’re doing!");
	}

	output("\n\nYou grind against each other, his powerful hips slapping against your well-packed posterior, his prodigious prick sliding back and forth, in and out of your quaking [pc.skinFurScalesColor] buttocks. Hanging from your wrist cuffs, all you can do is tremble and moan as your [pc.ass] is deliciously abused by the burly bull!");

	//if PchasFrontPussy:
	if(pc.hasVagina() && !pc.isTaur())
	{
		output("\n\n<i>“Time for me to get some of that action.”</i> His broad-chested brother grins, also grabbing your [pc.hips], this time from the front. Rubbing his own flaring tip against your dribbling nethers, he thrusts upwards, keen to claim your [pc.vaginaColor] pussy! It takes very little effort; your slick twat excitedly parts around his flaring tip, yielding happily to the thick, fleshy intruder!");
		pc.cuntChange(x,500,true,true,false);

		output("\n\nYou cry out in exquisite pleasure as both bulls practically rub their manhoods together deep inside of you, one stroking all the way to your womb and the other your rectum. Both of their hot, hard bodies rub against your [pc.chest] and back as you’re wonderfully sandwiched.");
		//FirstTime: 
		if(flags["NEW_TEXAS_GANGBANGED"] == undefined) output(" Your poor pussy and pucker are never going to be the same after this - you can already feel your insides molding to the shape of their unforgettable girth, wringing and clenching");
		else output(" Your pussy and pucker have not forgotten their shapes - already they’re wringing and clenching their familiar girths");
		output(", eager to squeeze their bullish seed out deep inside of your needy holes and fill you up with their hot, fertile seed.");
	}
	else
	{
		output("\n\nAs you’re pistoned from behind, the broad-chested bull before you grabs your [pc.hips] and keeps rubbing his glorious hardness against you");
		if(pc.hasCock() && !pc.isTaur()) output("rs");
		else output("r bare loins");
		output(". You cry out in exquisite pleasure as you’re fantastically sandwiched between both bulls, one stroking against ");
		if(frontCock) output("[pc.oneCock]");
		else output("you");
		output(" as the other fills up your [pc.ass]. ");
		if(flags["NEW_TEXAS_GANGBANGED"] == undefined) output("Your poor pucker is never going to be the same after this - you can already feel your insides molding to the shape of the back bull’s unforgettable girth, wringing and clenching");
		else output("All the while your rectum wrings and clenches the familiar girth, eager to squeeze out its bullish seed inside of your needy hole and fill you up to the brink with frothing cum.");
	}
	output("\n\n<i>“I-I’m going to cum!”</i> You squeal out, trembling and shaking against them. You can’t hold out much longer - already, you’re reaching that all consuming peak!");
	output("\n\n<i>“Cum for us, slut!”</i> The bull in your butt bellows");
	if(frontPussy) output(" as they bounce you up and down on their throbbing equine dicks.");
	else output(" all the while bouncing your " + pc.mf("butt", "tush") + " on his throbbing equine shaft.");

	output("\n\nUnable to hold out even if you tried, you throw back your head and cry out ecstatically, utterly creaming yourself between them.");
	if(frontPussy)
	{
		output(" You gloriously gush [pc.girlCum] around the pulsing prick buried in your [pc.vagina " + x + "]");
		if(pc.totalVaginas() > 2) output(", while your others emptily dribble, sharing in the excitement");
		if(pc.totalVaginas() == 2) output(", while your other emptily dribbles, sharing in the excitement");
		output(".");
	}
	//pc.hasCock:
	if(frontCock)
	{
		output(" Your [pc.cockHead] flexes and ");
		if(pc.cumQ() < 5) output("a single thick, [pc.cumVisc] rope of [pc.cumNoun] spurts");
		else if(pc.cumQ() < 300) output("thick, [pc.cumVisc] ropes of [pc.cumNoun] spurt");
		else if(pc.cumQ() < 2000) output("a hose-blast of thick, [pc.cumVisc] [pc.cumNoun] spurts");
		else output("a geyser of thick, [pc.cumVisc] [pc.cumNoun] spurt");
		output(" up on the front bulls’ strapping chest, coating it ");
		//largeOrMoreCum:
		if(pc.cumQ() >= 300) output(" and his face");
		output(" in your sloppy [pc.cumColor] seed");
		if(pc.cockTotal() > 1)
		{
			output(" - your other cock");
			if(pc.cockTotal() > 2) output("s");
			output(" soon following suit!");
		}
		else output(".");
	}
	output(" All the while, you excitedly spasm and clench around ");
	if(frontPussy) output("their flat-tipped pillars, wringing them for all they’re worth.");
	else output("the flat-tipped pillar buried in your butt, wringing it for all it’s worth.");

	output("\n\nIn your orgasmic throes, you set the two burly bulls off, and suddenly you can feel them flexing inside of you, grabbing and pressing deep against your [pc.hips] and ass. Suddenly there’s a glorious, gooey spurting ");
	if(!frontPussy) output("on your [pc.chest] and ");
	output("deep inside of you, flooding up inside your ");
	if(frontPussy) output("[pc.vagina " + x + "] and ");
	output("rectum. Hot, fertile bull-seed quickly fills up your ");
	//GotFrontPussy:
	if(frontPussy)
	{
		if(!pc.isPregnant(x)) output("eager womb to the brink, bathing your unprotected eggs in hyper-virility.");
		else output("channel to the brink, bathing your rippling walls in wasted virility.");
	}
	else
	{
		output("bowels, bloating out your [pc.belly]");
		if(!pc.isPregnant()) output(" as if you were pregnant.");
		else output(" and making you look even <i>more</i> pregnant.");
	}

	output("\n\nWhen the back bull pulls out, hot, sloppy cum drools out of your well-stretched ");
	if(frontPussy) output("pussy and ");
	output("pucker and down the ");
	if(frontPussy) output("front and ");
	output("back of your [pc.thighs]. Your [pc.belly] and [pc.ass] feel so warm, like you’re filled to the brim with liquid love!");

	if(!frontPussy) 
	{
		output("\n\nYou spacily stare over at the third bull - he’s been stroking his flat-tipped prick this entire time! Just a few more strokes and a groan later, and a thick, gooey rope spurts through the air and wetly splatters your [pc.skinColor] cheeks. His salty goo drools down to your [pc.lips], and you sluttily lick it up, relishing in his heady musk and thick, gooey taste.");
		output("\n\n<i>“Marked [pc.himHer]!”</i> He grins, stroking out a few more lazy ropes that splatter against your ");
		if(frontCock) output("already well-splattered ");
		output("[pc.chest].");
	}
	output("\n\nNow that you’ve all came, you expect to be let go. But the breeding bulls are nowhere near finished with you yet! Switching places, it’s not long before your ");
	if(frontPussy) output("vagina and ");
	output("ass ");
	if(frontPussy) output("are");
	else output("is");
	output(" being filled once again, this time by a different one!");

	output("\n\nAll you can do is hang there, cuffed and helpless, as you’re fucked mercilessly by the burly bovines over the next two hours. When they’re done with you, your belly is ");
	if(!pc.isPregnant()) output("gravid");
	else output("even bigger than before");
	output(" and hanging heavily with bull semen, your entire body slick with their seed. From head to toe, you look and smell like a cum-dumpster - which is exactly what you were used as!");
	output("\n\n<i>“Thanks for the good time, darlin’.”</i> One of the bulls slaps you on your well-used ass, now thoroughly gaping in the shape of their girthy cocks. Slick, wet spunk liberally drools out of your rectum, and you feel so empty! Whining out loud, you beg them to fuck you again - ");
	if(flags["NEW_TEXAS_GANGBANGED"] == undefined) output("even though it’s only been two hours,");
	else output("you can’t imagine living without their dicks inside of you!");

	output("\n\nHearing your plaintive cry, one of the bulls lifts your chin and gives you a sloppy, cum-covered kiss, making you melt in your cuffs. When he pulls back, you’re swooning in delight!");
	output("\n\n<i>“Don’t worry, slut. You can ‘hang’ here anytime - we’ll never turn down a chance to tap that fine ass of yours,”</i> the bull grins. Your heart leaps in your chest. <i>“...But right now we’ve got to get back to work.”</i>");
	output("\n\nOnce they’ve left, the cuffs automatically unlock, as if sensing their absence. They fall and clatter on the ground. Picking them up, you stare at your wrists and ankles - the only parts of you uncovered by bull cum! You flush and pack them away, feeling more than a little wobbly on your feet!");

	IncrementFlag("NEW_TEXAS_GANGBANGED");
	IncrementFlag("GRAVCUFFS_USES");
	processTime(130+rand(10));
	// Lots of vaginal (if applicable) and anal stretch.
	// Lots of exhibition points.
	// Filled with bull cum, anally and vaginally. Inflation.
	var pp:PregnancyPlaceholder = new PregnancyPlaceholder();
	pp.createPerk("Fixed CumQ",10000,0,0,0);

	pc.exhibitionism(1);
	if(pc.hasVagina()) 
	{
		pc.loadInCunt(pp, x);
		pc.loadInCunt(pp, x);
	}
	else
	{
		pc.loadInAss(pp);
		pc.loadInAss(pp);
	}
	pc.loadInAss(pp);
	if(frontCock)
	{
		pc.orgasm();
		pc.orgasm();
		pc.orgasm();
	}
	if(frontPussy)
	{
		pc.orgasm();
		pc.orgasm();
		pc.orgasm();
	}
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.exhibitionism(2);
	pc.exhibitionism(2);
	pc.exhibitionism(2);
	
	pc.applyCumSoaked();
	pc.applyCumSoaked();
	
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Grav Cuff New Texan Gangu Bangu #2: The Bovining
// High exhibition level.
// Got Grav-cuffs
// New Texas public area
// Must have dick
public function gravCuffsCowgirlBangu():void
{
	clearOutput();
	author("JimThermic");
	showName("PUBLIC\nUSE");

	output("You’re unbelievably horny right now. Thankfully, you’re on the <i>perfect</i> planet to relieve your frustrations. If there’s one thing New Texas is good for, it’s getting a [pc.guyGirl] off.");
	if(!pc.isNude()) output(" You take a moment to strip off your things, ditching everything you own bar a set of solid grav-cuffs.");
	else output(" You’re already naked and carrying a set of solid grav-cuffs. Really, what else does a " + pc.mf("man","womanl") + " need?");

	output("\n\nAfter taking a moment to click the cuffs onto ‘auto’, you toss them up in the air. The metal shackles soar around in a circle then swoop back towards you, making a bee-line for your wrists and [pc.footOrFeet]. There are loud snaps as they fasten around your limbs, followed by a hum, before you’re pulled ");
	if(pc.isTaur()) output("up, ");
	output("rearward and straight to the ground! Lying on your back, you try to tug free from your fetters, to no avail.");
	//PC.strength >= 50%
	if(pc.PQ() >= 50) output(" Even with your considerable strength, you’re unable to budge an inch.");

	output("\n\nStraining for a sidewards glance, the digital display on the smart shackles reads two hours; it seems you’re stuck here until the timer runs out. Two hours of public use, you think, during which time <i>anyone</i> could use you as they please. Lying back, all you can do is wonder who will come across you first, naked [pc.cocksLight]");
	if(pc.hasVagina()) output(" and [pc.vaginas]");
	output(" tingling in aroused anticipation.");

	output("\n\nYou don’t need to wait long. Out of the corner of your eye, you see a gaggle of giggling cowgirls walking in your general direction. With a rosy flush on their cheeks, they’re rubbing their heavy, pink-tipped breasts.");
	output("\n\n<i>“It’s time for a milking. I’m so full, I feel like my nipples are going to start squirting any minute!”</i>");
	output("\n\n<i>“I wonder if we’ll get fucked when we’re in the milker? I sure hope so. It’s been SO long since I’ve gotten knocked up.”</i>");

	output("\n\n<i>“Oh hey, who’s that?”</i> one of the beauties excitedly exclaims, pointing directly at you. <i>“");
	if(flags["TEXAS_GRAVCUFFS_COWORGY"] == undefined) output("Is it a new [pc.guyGirl]? I’ve never seen [pc.himHer] before!");
	else output("It’s that [pc.guyGirl] from last time - [pc.heShe]’s all cuffed down again!");
	output("”</i>");

	output("\n\nThe daintily horned girls skip up to you, bountiful breasts bouncing with every footstep. Thin streaks of milk are leaking from their puffy nipples. Crouching down around your lower half, they ogle your loins with wide, fluttering eyes.");

	output("\n\n<i>“...Look at [pc.hisHer] cock");
	if(pc.cockTotal() > 1) output("s");
	output("! ");
	if(flags["TEXAS_GRAVCUFFS_COWORGY"] == undefined) 
	{
		output("I wonder what ");
		if(pc.cockTotal() == 1) output("it");
		else output("they");
		output(" look");
		if(pc.cockTotal() == 1) output("s");
		else output(" like when ");
		if(pc.cockTotal() == 1) output("it’s");
		else output("they’re");
		output(" bigger?");
	}
	else
	{
		output("Maybe we should make ");
		if(pc.cockTotal() == 1) output("it");
		else output("them");
		output(" bigger?");
	}
	output("”</i> one of the naked heifers asks. She then reaches forward and lightly grasps ");
	if(pc.cockTotal() > 1) output("one of ");
	output("your defenseless prick");
	if(pc.cockTotal() > 1) output("s");
	output(". All it takes is a few eager strokes. Electric pleasure courses through your loins and you groan with delight, [pc.biggestCockHead] ");
	if(pc.hasCockFlag(GLOBAL.FLAG_FLARED,pc.biggestCockIndex())) output("flaring");
	else output("swelling");
	output(" in her dainty grasp.");

	output("\n\n<i>“Oh, here, give me a try!”</i> <i>“No, me!”</i> The gaggle of girls all rush at once to touch and tease your [pc.cocksLight]. Your bared loins are stroked and fondled without restraint.");
	if(pc.balls == 1) output(" As your [pc.balls] is cupped and squeezed");
	else if(pc.balls > 1) output(" As your [pc.balls] are cupped and squeezed");
	else if(pc.hasVagina()) output(" As your pussy-lips are also stroked");
	else output(" As the ridge between your base and butt is stroked as well");
	output(", you can’t stop quivering with pleasure. Your entire body is being wracked with the most delectable kind of twitching fit!");

	output("\n\nJust as you feel like you’re going to go mad with pleasure, you’re given release with a final jerk of ");
	if(pc.cockTotal() > 1) output("one of ");
	output("your joystick");
	if(pc.cockTotal() > 1) output("s");
	output(". With an ecstatic cry, you shiver and shoot ");
	if(pc.cumQ() < 5) output("a tiny little splatter of");
	else if(pc.cumQ() < 10) output("a thin stream of");
	else if(pc.cumQ() < 500) output("a thick stream of");
	else if(pc.cumQ() < 5000) output("a bucket’s worth of");
	else output("a seemingly endless tide of");
	output(" [pc.cumVisc] [pc.cumColor] right on your [pc.belly]. The cowgirls giggle as you moan and continue to twitch in your cuffs, [pc.cumNoun] dribbling out of your flexing cockhole");
	if(pc.cockTotal() > 1) output("s");
	output(".\n\n<i>“Wow, that ");
	if(pc.cumQ() < 10) output("wasn’t much");
	else if(pc.cumQ() < 500) output("was a bit");
	else if(pc.cumQ() < 5000) output("was a lot");
	else output("was a ton");
	output(", wasn’t it?”</i> <i>“I wonder if that’s all [pc.heShe], like, has.”</i> <i>“It’s kinda fun to do the milking for once!”</i> They excitedly exclaim, running their feminine fingers all through the moist seed");
	if(pc.hasFur()) output(" matting");
	else output(" coating");
	output(" your [pc.skinFurScalesNoun]. A brunette bovine-girl thoughtlessly licks it off her fingers. You watch as her soft pink tongue is coated in your [pc.cumColor] [pc.cumNoun]. <i>“...Mmm! Tastes [pc.cumFlavor].");
	if(pc.cumType == GLOBAL.FLUID_TYPE_CUM) output(" Just");
	else output(" Nothing");
	output(" like the bulls around here!”</i> she reviews. Eager to share in your taste, her friends start licking off your [pc.belly]. You groan as their soft and sizable breasts brush up against your sides, their puffy nipples rubbing back and forth against your [pc.skinFurScales] as they lick you off. It’s almost enough to make you cum all over again!");

	output("\n\n<i>“It’s so delicious! But I’d rather have it inside, you know?”</i> One of the curvy cow-girls giggles, lifting her butt over your still twitching prick");
	if(pc.cockTotal() > 1) output("s");
	output(". ");
	if(pc.cockTotal() > 1 && pc.biggestCockIndex() != pc.smallestCockIndex()) output("After picking out the largest one, she");
	else output("She then");
	output(" lowers herself onto ");
	if(pc.cockTotal() > 1) output("one of them");
	else output("it");
	output(", pressing her soft pussy-lips down on your [pc.biggestCockHead]. It slowly slips inside her warm moistness, your sensitive tip alight with pleasure. She doesn’t stop until her plushy posterior is resting happily on top of your [pc.legOrLegs], her erect clit pressed neatly against your ");
	if(pc.hasKnot(x)) output("knotted ");
	output("base. As she wiggles her womanly hips, you can <i>feel</i> your hypersensitive head caressing her womb-mouth--you’re primed for point blank mating!");
	pc.cockChange();

	output("\n\n<i>“You’re going to give me cute little calves, right?”</i> She coos, reaching up to stroke your cheek, cow-tail swishing back and forth. Pinned like this with your [pc.cockNoun] inside of her, it’s not like you have a choice! As the bovine beauty begins to rock back and forth, a look of dreamy ecstasy on her face, all you can do is ‘endure’ the sensation of her incredibly wet lips clinging to your [pc.cockNoun]. The more excited she gets, the more her wet walls clench and squeeze your [pc.cockColor] rod–even though she’s been fucked by countless bulls, she’s still so <i>hot</i> and <i>tight</i>. Burgeoning pleasure swells out from your loins and utterly sizzles out your senses. Already, your [pc.cumNoun]-slicked prick is dribbling more of your sloppy seed inside of her New Texan honeypot, resisting any attempts to keep it in.");

	output("\n\n<i>“You’re about to blow, right? Let it allll out in my pussy,”</i> the full-figured cowgirl coaxes you, lifting and teasing her tremendously huge tits right before your eyes. Adding to your encouragement, the other girls reach up and begin to rub their own massive mammaries against your sides, accidentally squirting warm milk all over your [pc.chest] in the process. You groan as you’re literally caressed with their silky soft skin from every direction, while being given a breast-milk bath, and having your [pc.cocksLight] ridden");
	if(pc.cockTotal() > 1) output(" and jerked");
	output(". You’re in heaven!");

	output("\n\nUnable to last under such pleasurable duress, you quickly reach your peak. With a loud, shivering cry, you shoot your");
	if(pc.virility() > 0) output(" virile");
	output(" load inside the busty bovine’s pussy. With each groaning flex of your shaft, you feel your hot spunk shooting up and out of your prick, basting the inside of her fertile womb in [pc.cumColor] and seeding it with your sperm. As you tremble in the throes of your second orgasm in mere minutes, the cow girl lifts her hefty butt off you and parts her lower lips, giving you a nice, long look at her now [pc.cumVisc] pussy. Talk about a creampie!");

	output("\n\n<i>“...[pc.HeShe] came again? Okay, my turn!”</i> another busty beauty chimes in. Not even waiting for your most recent orgasm to subside, she switches with the first, reaching for ");
	if(pc.cockTotal() == 1) output("your well-used dick");
	else if(pc.cockTotal() == 2) output("your second, unused cock");
	else output("one of your unused cocks");
	output(". Without delay, she excitedly slips it inside of her sopping wet quim, already pre-warmed by the display. You groan as she falls in your lap with a flat-butted ‘whumph’, burying your [pc.cockNoun] in her right up to the hilt. Unable to wait her turn, a second chubby-thighed cowgirl mounts your head, pushing her dripping wet slit right against your [pc.face]! Her sweet feminine scent makes your already overstimulated senses reel, your sheathed prick twitching reflexively inside the first!");

	output("\n\nThe two busty beauties ride you both up top and down below, taking advantage of your cuff-bound state. After two back-to-back orgasms, your [pc.cocksNounSimple] ");
	if(pc.cockTotal() == 1) output("is");
	else output("are");
	output(" <i>extremely</i> sensitive. The intensity shooting up from your [pc.cockHeads] is so intense, you feel like you’re going to lose your mind! All you can do is make muffled noises against the slippery sex being pressed up against your lips. Every time you open it, musky girl-juice drools down onto your tongue, lighting up your tastebuds. There’s a shivering against your [pc.face] and a high-pitched squeal, and your face is suddenly splattered with a sticky warmth. She just came on your face! It’s followed by another, trembling cry further down, as your straining length is yet again basted with sweet nectar.");

	processTime(45);
	IncrementFlag("TEXAS_GRAVCUFFS_COWORGY");
	IncrementFlag("GRAVCUFFS_USES");
	
	var pp:PregnancyPlaceholder = new PregnancyPlaceholder();
	pc.girlCumInMouth(pp);
	pc.girlCumInMouth(pp);
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.exhibitionism(2);
	pc.exhibitionism(2);
	pc.exhibitionism(2);
	pc.exhibitionism(2);
	
	pc.applyPussyDrenched();
	pc.applyPussyDrenched();
	
	clearMenu();
	addButton(0,"Next",cowGirlGanguBanguEpilogue);
}

public function cowGirlGanguBanguEpilogue():void
{
	clearOutput();
	showName("PUBLIC\nUSE");
	author("JimThermic");
	output("<b>... Some Time Later...</b>");
	output("\n\n<i>Buzz-buzz-buzz!</i> Dimly and distantly, you realize there’s a noise going off not too far from your [pc.ear]. Every inch of you is filled with diffused, fizzling ecstasy, like you’ve been hollowed out and filled with pure high. There’s a clicking from your wrist and [pc.legOrLegs], and a sudden sense of fresh air around your [pc.skinFurScalesNoun] there.");
	output("\n\nYou realize it’s the timer, and look down at your splayed, sticky, and thoroughly <i>spent</i> form. The cow-girls are gone, having utterly used and abused you over the last two hours, until your [pc.cocksLight] didn’t have anything else left to give. You smile; your face is completely coated in their girl cum, and your chest is splattered in their sopping wet milk. You’re definitely going to need a shower after this... but part of you doesn’t want to yet clean away the spoils of such a special, near-transcendent experience.");

	output("\n\nWhen your muscles are able and you’re getting cold, you stand up and collect the cuffs. That’s the great thing about New Texas; nobody’s ever going to tell you to move along!");
	processTime(95);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Hand Job
// PC must have cock.
public function getAHandjobFromInessy():void
{
	clearOutput();
	showInessa();
	author("JimThermic");
	
	var x:int = rand(pc.cocks.length);
	
	output("Feeling a little horny, you decide to do something about it–or rather, get someone <i>else</i> to. ");
	if(!pc.isCrotchExposed() && !pc.isTaur()) output("You strip off your [pc.lowerGarments] and");
	else output("You");
	output(" whistle loudly like you’re calling a bitch.");
	if(flags["INESSA_HJ"] == undefined) output(" Funnily enough,");
	else output(" Just like last time,");
	output(" it <i>works</i>... Inessa comes bounding over to see what the fuss is about.");

	output("\n\n<i>“...Is there something I can help you with?”</i> The butterfly-winged girl asks, an eager look in her innocent eyes. You gesture down to your untended-to [pc.cocksNounSimple] and clear your throat.");

	output("\n\n<i>“Jerk ");
	if(pc.cockTotal() == 1) output("it");
	else output("them");
	output(" off, slut,”</i> you sternly order Inessa, and she blushes <i>hard</i>, her slender thighs visibly wiggling as you verbally debase her. Instead of biting back, she swoons instead. Dropping to her knees before your flaccid member");
	if(pc.cockTotal() > 1) output("s");
	output(". Her dainty hands wrap around ");
	if(pc.cockTotal() > 1) output("one of them");
	else output("your tender flesh");
	output(", lightly squeezing, constricting the blood flow to your [pc.cockHead " + x + "]. It slowly grows in fitful little jerks. Low, thrumming pleasure warms your loins, a mere prelude to the pleasure to come.");

	output("\n\nThe snowy-haired siel girl blows lightly on your sensitive tip, teasing it with tiny pointed breaths. At the same time, she slowly but firmly jerks your base, another hand reaching down to ");
	if(pc.balls > 0) output("cup and fondle your [pc.sack]");
	else output("stroke between it and your [pc.asshole]");
	output(". You let out an appreciative groan as the subby storekeeper works over your [pc.cock " + x + "].");

	output("\n\nA tiny bead of pre dribbles out of your cock hole and down your flexing shaft, rolling down until it brushes her girlish fingers. Leaning forward, she gives your drip-slickened underside a long upwards lick, looking up at you with a lusty, subservient look at the same time. Just the look in her eyes is enough for you to eagerly spill out more of your spunk, which she eagerly licks and suckles up. Her dusky blue lips are slowly painted [pc.cumColor], glistening with your [pc.cumVisc], [pc.cumFlavor] fluid.");

	//Pc’s dick is 4 inches or smaller: 
	if(pc.cocks[x].cLength() <= 4) output("\n\nWith your compact-sized dick, she’s easily able to jerk most of your length off with a single hand, wrapping her warm palm around your entire length.");
	else if(pc.cocks[x].cLength() <= 10) output("\n\nWrapping both her warm hands around your [pc.cockNoun " + x + "], she’s able to completely encompass and jerk off your entire length.");
	else output("\n\nYour incredibly long dick is so super-sized that even with both hands, she’s hard pressed to jerk even half of it off. Still, just having her grip <i>part</i> of it is pleasurable enough!");
	output(" Her focused, yet soft finger force blows away the tightness of most terran pussies, winding you up until you’re actively thrusting against her hand");
	if(pc.cocks[x].cLength() > 4) output("s");
	output(". Your thoughts begin to swim in a muddled mess, and you <i>know</i> that you’re reaching your peak. With a throaty groan, you give one final thrust... and shoot a ");
	if(pc.cumQ() < 8) output("pleasurable little splatter");
	else if(pc.cumQ() < 100) output("thin stream");
	else if(pc.cumQ() < 1000) output("thick stream");
	else
	{
		if (pc.cumType != GLOBAL.FLUID_TYPE_SPECIAL_GOO) output("gooey ");
		output("gush");
	}
	output(" of your hot [pc.cumNoun] all over her face! Rather than flinch, the fae-like girl shivers with delight as you use her pretty face as a canvas, marking it pointedly with your precious seed.");

	output("\n\nOnce she’s finished milking out every single drop your [pc.cocks] have to give, Inessa’s ");
	if(pc.cumQ() >= 100) output("eyes are the only thing not covered in your [pc.cumColor] spunk, and even then, it’s clinging to her long lashes!");
	else output("cheeks and chin are visibly dripping with your [pc.cumColor] spunk.");

	output("\n\n<i>“I hope you enjoyed yourself?”</i> The siel girl nervously asks. When you nod, she lets out a relieved sigh, pressing a hand to her petite breasts. <i>“That’s good! You know, I pride myself on my customer service.”</i>");

	output("\n\nYou grin. If this is how she treats all her customers, she’s probably up for employee of the year. Not that there’s any competitors in the tiny store, of course.");
	processTime(22);
	pc.orgasm();
	IncrementFlag("INESSA_HJ");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Face Strap-On
// If pussy, vag. Else ass.
public function faceStrapOnShitForInessa():void
{
	clearOutput();
	showInessa();
	if(flags["INESSA_FACE_STRAPPED"] == undefined) output("You notice a leather face-mask on the shelves that covers the mouth and cheeks, but leaves the eyes and nose wide open. There’s a slot for a strapon to attach to the mouth. You pick up the mask and a");
	else output("Remembering how much fun the face-mask was on Inessa last time, you seek it one out with a wicked grin. When you find it, you pick it up and a");
	//pc.isTaur:
	if(pc.isTaur()) output(" mottled stallion schlong, connecting it in place.");
	else output(" girthy, black schlong, connecting it into place.");
	//pc is clothed + PC.isTaur != true:
	if(!pc.isNude() && !pc.isTaur()) output(" After stripping off your things, you");
	else output(" You");
	if(flags["INESSA_FACE_STRAPPED"] == undefined) output(" decide to find someone to wear it...");
	else output(" call for your all-too-willing supplicant.");

	output("\n\n<i>“Inessa!”</i> you bark, and the snowy haired sub practically bounds over. As soon as she’s close enough, you hand her the phallic face-mask. <i>“Put this on. Now!”</i>");

	output("\n\nWithout so much as a second’s hesitation, the slender saerie-girl grabs the mask and begins strapping it to her face. Her cheeks burn bright red as she connects it behind her neck. She looks positively absurd with a ");
	if(pc.isTaur()) output("twelve-inch horsecock");
	else output("six inch strap-on");
	output(" sticking out from her covered mouth, but in a way, just watching her squirm with embarrassment gets you hot and heavy.");
	if(pc.isTaur()) 
	{
		output(" Must be <i>hell</i> on her neck, though. Perhaps you should hold up the other end... perhaps with your ");
		if(pc.hasVagina()) output("snatch");
		else output("ass");
		output("?");
	}

	output("\n\nAfter ordering her to get on her knees, which she promptly does, you turn around and back your body against her cutely flushing face. Inessa lets out a muffled noise as you press the ");
	if(pc.isTaur()) output("flat-headed horse-tip");
	else output("stiff, rounded tip");
	output(" against your [pc.vagOrAss]. Slowly, you press your [pc.hips] back against the submissive girl’s leatherbound face, forcing it closer and closer to your ");
	if(pc.hasVagina()) 
	{
		output("slippery snatch. She’s soon literally muffled against your muff, her high cheeks pressed ");
		if(pc.legCount == 1) output("against your crotch");
		else output("between your [pc.thighs]");
	}
	else output("butt");
	output(". She’s soon got her face almost literally kissing your ass, her face-dildo buried hilt-deep in your gaping hole.");

	output("\n\n<i>“Gooood girl. Now move,”</i> you command her. Slowly and with concerted effort, Inessa pulls back her head and mouth, then thrusts forward, pistoning you with her ");
	if(pc.isTaur()) output("equine");
	else output("midnight");
	output(" face-dildo. Each time, her nose wedges itself ");
	if(pc.hasVagina()) output("between your snatch and asshole");
	else output("between your buttocks");
	output(". So obedient! You grind shamelessly back against her money-maker, forcing her to fuck you deeper and lewder with her lip-schlong. <i>“Come ooon, fuck me. You can do it harder than that!”</i>");

	var volume:Number = 150;
	if(pc.isTaur()) volume = 500;
	if(pc.hasVagina()) pc.cuntChange(0,volume,true,true,false);
	else pc.buttChange(volume);

	output("\n\nCoaxed by your words, Inessa grabs at your [pc.legOrLegs], face-fucking your [pc.vagOrAss] with even more enthusiasm. You groan and arch your back, ");
	if(pc.isTaur()) output("feeling the long stallion cock stimulate your deep hole in the way that nature intended, the flared dick rubbing against your deep, needy depths");
	else output("slapping your [pc.skinFurScalesColor] cheeks back against her ");
	if(pc.hasVagina()) output("forehead");
	else output("own");
	output(". She lets out a little muffled whimper, and when you look back, you see her legs shaking. Down her thighs, twin streams of slick fluid are running down as she quivers and quakes; did she just cream herself?!");

	output("\n\n<i>“Naughty girl. You should have waited for permission! For that, I’m going allll out,”</i> you warn her, and she nods, pressing her engorged tip against your ");
	if(pc.hasVagina()) output("sweet g-spot");
	else output("prostate");
	output(" in the process. With merciless abandon, you slap ");
	if(pc.isTaur()) output("your gigantic tauric hips");
	else output("backward");
	output(" against her poor face, forcing her to endure your lust-driven humping. She clings desperate to your [pc.legOrLegs] to steady herself, her own silky thighs still twitching in the throes of her sloppy orgasm.");

	output("\n\nUnable to hold out any longer, you give a sweet cry, pushing yourself back on the ");
	if(pc.isTaur()) output("equine");
	else output("slick");
	output(" face-dildo, right up to the hilt! Quivering against her cute prostrate face, you cum <i>hard</i>, ");
	if(pc.hasVagina())
	{
		//pc.isSquirter:
		if(pc.isSquirter()) output("spraying a long, shaming spray of your [pc.girlCum] right there on her face! She’s absolutely bathed in it, and you can hear her whimpering and cumming <i>again</i>, totally getting off on her debasement.");
		else output("drooling your [pc.girlCum] all over her cheeks. With an inward grin, you quiver and deliberately <i>rub</i> yourself back against her face, smearing as much of your lady juice as you can all over her face. As she’s absolutely bathed in it, you can hear her whimpering and cumming <i>again</i>, totally getting off on her debasement.");
	}
	else if(pc.hasCock()) output("shooting your [pc.cum] all over your [pc.belly].");
	else output("letting out a long, drawn out groan.");

	output("\n\nWhen you pull yourself up and off her strapped-on face-dick, Inessa nearly falls to the floor, totally wiped out by her orgasm");
	if(pc.hasVagina()) output("s");
	output(" and your merciless fucking of her face. You reach out and stroke her head, telling her she did a good job, and she lets out a satisfied, if spacy little purr, nuzzling into your hand. There is a rather obvious " + (flags["INESSA_BELTED"] != 2 ? "puddle" : "stream of [inessa.girlCum]") + " between her twitching thighs, marking her delight");
	if(flags["INESSA_BELTED"] != 2) output(" despite her gleaming chastity belt");
	output(". You then pull off the mask and toss it aside.");
	output("\n\n<i>“D-did you want anything else?”</i> Inessa asks, and you shake your head. As if she could do anything else right now! After a little while, she gets to her feet, and stumbles to grab a mop.");
	IncrementFlag("INESSA_FACE_STRAPPED");
	// Return to shop menu.
	processTime(29);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Requires: Inessa has submitted to PC
public function inessaWalksOnTheWildSide():void
{
	clearOutput();
	showInessa();
	author("Nonesuch");
	output("Grinning rakishly, you allow your [pc.cockTail] to swing around your [pc.hip] with graceless, deliberate menace, its tip flicking into Inessa’s path of vision.");

	//First
	if(flags["INESSA_TAILED"] == undefined)
	{
		output("\n\n<i>“I - I noticed that when you first came in [pc.name] - I mean, [pc.master],”</i> your butterfly sub twitters, apprehension quickening her tone. There’s a flush to her dark blue cheeks as she takes in the utterly obscene appendage. <i>“What - ? Is it a mod? Or were you born - ?”</i>");
		output("\n\n<i>“It’s a tail dick, dear,”</i> you assure her calmly. You flagrantly eye the bare-chested saeri, hot arousal veining down your " + (pc.hasParasiteTailCock() ? "parasitic " : "tail-" ) + "cock as your gaze slides over her petite tits and pretty lips; your rightful property, to do with as you wish. <i>“Every so often I have a need to shove it into a deserving slut’s cock-hole. Nice and deep.”</i>");
		output("\n\nInessa doesn’t know what to say to this; mouth slightly ajar, she seems paralysed by the gentle wave and wag of your [pc.tail], drawing ever closer to her, its head moist now with musky pre. You land it on her skin just south of her breasts, relishing the supple coolness of her skin as you lead it upwards, rearing it so its head dabs at her tiny, pointy nipples. It" + (pc.hasParasiteTailCock() ? " takes all of your willpower to keep the impulses of the parasite under control - it desperately wants to arrow in on the soft, warm hole it can sense above it - but it" : "" ) + "’s so much fun to fondle the sensitive little sub like this, drink in her tenderly open lips, little stutters and squeaks escaping them as you brush over her tender, navy nubs, inundating the swollen cock-head in pleasure all the while.");
		output("\n\n");
		if(flags["INESSA_BELTED"] != 2) output("With her genitals securely under lock and key, the saeri’s tits are the only major erogenous zone available to her, and it shows.");
		else output("Even with her genitals exposed, the saeri’s tits act as if they are her only major erogenous zone available to her, and it shows.");
		output(" As her trepidation visibly melts into puppy-like eagerness, she tries to raise her hands to her small mounds, either trying to present them to your [pc.cockTail] or to catch hold of it. You swing the appendage to bat her twelve fingers down with a stern frown.");
		//PC does not have grav-cuffs: 
		if(!pc.hasItemByClass(GravCuffs))
		{
			output("\n\n<i>“You sell grav cuffs here, don’t you?”</i> you say levelly.");
			output("\n\n<i>“I - yes, [pc.master], of course.”</i> She fetches a packet off and then fumbles it open, her own nervousness and eagerness to please making her clumsy, her blush climbing higher as she struggles with the packaging; it’s very cute. At last she hands you the pair of metal rings.");
		}
		//PC does have grav-cuffs: 
		else
		{
			output("\n\nNot breaking your gaze away from her solemn, puppy-dog eyes, you pull out your pair of grav cuffs.");
			output("\n\n<i>“O-oh...”</i> flutters Inessa, an apprehensive thrill gusting through her voice. <i>“I think I recognise those.”</i>");
		}
		//merge
		output("\n\n<i>“Kneel here,”</i> you order, pointing at a spot right next to the counter. Inessa dutifully does as she’s told, a delighted shudder visibly running through her as she kneels in front of you. <i>“Hands behind your back.”</i> You bend down and snap her wrists together. You rise in front of her, stroking your [pc.cockTail], allowing her to see for a moment how pleased it makes you to see her knelt and helpless like this in front of you... before slowly move away, behind the counter. Your tentacle dick remains, curling and slathering with hot anticipation at her chest and neck.");
		output("\n\n<i>“Um...”</i> the saeri quavers, starry eyes fixed on the snake-like appendage. <i>“I don’t mean to speak out of turn [pc.master], but... I do kinda have a store to run.”</i>");
		output("\n\n<i>“That’s the whole point, bitch. Didn’t you know?”</i> you reply with mocking surprise. You rear your " + (pc.tailType == GLOBAL.TYPE_COCKVINE ? "cockvine" : "phallic tail") + " up and press it against her cute, soft lips. <i>“Your [pc.master] will look after your shop whilst you concentrate on what you’re good at - polishing ");
		var cocks:int = pc.cockTotal() + pc.tailCount;
		if(cocks > 1) output("one of my cocks");
		else output("my cock");
		output(". Put some effort into it - you’re your own store’s advertisement now.”</i> You finally let go of all restraint and thrust inwards past her lips and teeth, inundating your [pc.tail]’s end in hot, silky goodness.");
	}
	//Repeat
	else
	{
		output("\n\n<i>“O-oh.”</i> Color blooms in Inessa’s cheeks. <i>“Are you saying that - ?”</i>");
		output("\n\nHer words end in a breathy, shaky sigh as you land it on her skin just south of her breasts, relishing the supple coolness of her skin as you lead it upwards, rearing it so its head dabs at her tiny, pointy nipples. It" + (pc.hasParasiteTailCock() ? " takes all of your willpower to keep the impulses of the parasite under control - it desperately wants to arrow in on the soft, warm hole it can sense above it - but it" : "" ) + "’s so much fun to fondle the sensitive little sub like this, drink in her tenderly open lips, little stutters and squeaks escaping them as you brush over her tender, navy nubs, inundating the swollen cock-head in pleasure all the while. Arousal is soon throbbing through you, unstoppably powering your feral impulses on.");
		output("\n\n");
		if(flags["INESSA_BELTED"] != 2) output("With her genitals securely under lock and key, the saeri’s tits are the only major erogenous zone available to her, and it shows.");
		else output("Even with her genitals exposed, the saeri’s tits act as if they are her only major erogenous zone available to her, and it shows.");
		output(" As her trepidation visibly melts into puppy-like eagerness, she tries to raise her hands to her small mounds, either trying to present them to your [pc.cockTail] or to catch hold of it. You swing the appendage to bat her twelve fingers down with a stern frown.");
		output("\n\n<i>“I shouldn’t have to tell you what to do.”</i>");
		//PC has grav cuffs: 
		if(pc.hasItemByClass(GravCuffs))
		{
			output("Inessa abandons the counter and swiftly assumes the position; knelt down, hands behind her back, petite breasts out, timorous but earnest. You give her a fond grin as you pull out the grav-cuffs, reach behind her and securely cuff her wrists together. You step back, rear your " + (pc.tailType == GLOBAL.TYPE_COCKVINE ? "cockvine" : "phallic tail") + " up and press its musky, dripping tip against her cute, soft lips.");
			output("\n\n<i>“Remember, slut - effort and enthusiasm,”</i> you order. <i>“That’s the key to any good advertisement broad.”</i> You finally let go of all restraint and thrust inwards past her lips and teeth, inundating your [pc.cockTail]’s end in hot, silky goodness.");
		}
		else
		{
			output("\n\nAlmost in a trance, Inessa reaches beneath the counter and retrieves a pair of large metal rings. What a good girl, keeping them close at hand! You give her a knowing grin and jerk your head, and she immediately jumps to, kneeling down in full view, hands behind her back, petite breasts out, timorous but earnest. You take the grav-cuffs, reach behind her, and securely cuff her wrists together. Stepping back, you allow your " + (pc.tailType == GLOBAL.TYPE_COCKVINE ? "cockvine" : "phallic tail") + " to rear up and press its musky, dripping tip against her cute, soft lips.");
			output("\n\n<i>“Remember, slut - effort and enthusiasm,”</i> you order. <i>“That’s the key to any good advertisement broad.”</i> You finally let go of all restraint and thrust inwards past her lips and teeth, inundating your [pc.cockTail]’s end in hot, silky goodness.");
		}
	}
	//merge
	output("\n\nSloppy, muffled sounds fill the shop as your lithe tail dick energetically explores Inessa’s mouth. The sensation is not great at first - her teeth keep rubbing over the bulging meat of your shaft, and without hands to help her she struggles to properly get hold of the over-excited tentacle. You clamp down on the impulse to impatiently throat-fuck her, though - she’s young and inexperienced. Leaning on the counter and concentrating on the door, you husk instructions and sigh your approval when she gets it right, until she is hollowing her cheeks fulsomely around your [pc.cockTail], providing a wonderful, wet suck for you to thrust your throbbing tail into with succulent strokes. You reward her quick learning by pulling out and smearing the pre-oozing tip over her cute lips and nose; she pants for breath and coos with submissive delight, licking at the slit of her new best friend. Heavy and full with fervent arousal now, you rear it back and shove it into her fuck-hole, delighted that she immediately tightens her walls back around your shaft...");
	output("\n\nWa-<b>TSSSHHHH!</b> It takes all of your self-discipline not to freeze as the shop door opens, and to smoothly continue undulating your [pc.cockTail] into Inessa’s face. Her eyes go wide though, and she spasms slightly in her bonds.");
	output("\n\n<i>“I’m sorry,”</i> says the business-suited platinum blonde human male, stood stock-still in the doorway, <i>“is this a bad time?”</i>");
	output("\n\n<i>“Not at all,”</i> you reply blandly. The body of your vestigial cock writhes like a cut power-line, pleasure coursing up from its bulging head. Showing as little visible effort as you possibly can, you damp down on its excited energy, forcing the way it pushes into Inessa’s hot mouth to be gentle and slow. <i>“Welcome to Happy Tails. What can I interest you in?”</i>");
	output("\n\n <i>“Well, I - ”</i> replies the tall, well-built man, finally tearing his eyes away from her to you. <i>“ - I’m in need of a few things I suppose, but - advice, mostly. For a couple who are looking to spice things up a little in the bedroom. What would you recommend?”</i>");
	output("\n\n<i>“You can do much worse than starting off with a pair of premium edition grav-cuffs,”</i> you reply breezily. <i>“We have a demonstration model set up here.”</i> Your control of the situation seems to be having the effect you’re looking for - Inessa’s jaw and tongue are working again, kneading wetly away at your ancillary alien penis. Her face has turned an adorable shade of purple, and her eyes flick up to both you and the customer when you " + pc.moveAction(false,true) + " over to her knelt, cuffed form - but she continues to hollow her cheeks around the shaft of your [pc.cockTail] determinedly. What a good girl.");
	output("\n\n<i>“These cuffs automatically adjust for comfort, but are unbreakable by anything short of military spec cutting tools,”</i> you say. Intense pleasure throbs through your appendage and you up the pace with which you thrust its saliva-coated end into the saeri, but keep your voice level. <i>“Their most impressive feature, though, is that you can adjust both their weight and the weight of the individual cuffed. Cuffs - zero.”</i>");
	output("\n\nThe grav-cuffs hum, and Inessa emits a muffled squeak. Calmly you reach down and pick her up by the shoulder, twisting her around so that the customer can see her face, then let go. She floats in mid-air, mouth stretched around the insistent girth of your tentacle dick.");
	output("\n\n<i>“Woah,”</i> breathes the customer, watching your navy-skinned bitch slowly revolve in the air via the excited force of the cock-" + (pc.tailType == GLOBAL.TYPE_COCKVINE ? "vine" : "tail"));
	if(flags["INESSA_BELTED"] != 2) output(", displaying her chastity belt");
	output(". Firmly and carefully you take hold of her again, place her back on the floor, and re-establish her weight.");
	output("\n\n<i>“The links are, of course, voice-activated,”</i> you go on. <i>“Cuffs - release.”</i> With a tinkling clink, the two metal rings fall to the floor, and you pull your [pc.cockTail] out of Inessa’s delightful suck. She looks up at you in slight, fuzzy confusion, hands vaguely touching her slim hips.");
	output("\n\n<i>“What do you say?”</i> you ask sternly. It’s taking almost all of your willpower to hold the bulging urge of your tentacle penis back, poised near her face.");
	output("\n\n<i>“Please [pc.master]...”</i> says Inessa, after a pause. <i>“Could- could I have some more?”</i> Without a word you reach down, [pc.chest] pushing against her petite tits as you re-attach the cuffs, and unceremoniously plug her open and waiting mouth with eager, writhing " + (pc.tailType == GLOBAL.TYPE_COCKVINE ? "vine" : "tail") + " dick again.");
	output("\n\n<i>“Buy some of these, learn to use them,”</i> you say, leading the man back to the counter, your tail tapering out behind you, <i>“and your sub will very quickly want to get into more advanced gear.”</i>");
	output("\n\n<i>“I- well, I’m not the - but yes,”</i> says the customer, gazing down at your “demonstration”, which you are now in the process of noisily and gloriously throating, <i>“I think I would very much like to purchase a set of those.”</i>");
	output("\n\nYou complete the transaction and smile him out of the store. Some unholy blend of what just happened - the public display of your obedient and willing sub, the grossness of your use of her, the gain of hard money - has got you extremely aroused, ");
	if(pc.hasCock()) 
	{
		output("[pc.eachCock] ");
		if(!pc.isCrotchExposed()) output("pressing hard against your [pc.lowerUndergarment]");
		else output("rock hard");
	}
	if(pc.isHerm()) output(" and ");
	if(pc.hasVagina()) output("[pc.eachVagina] flush and wet with arousal");
	if(!pc.hasGenitals()) output(" rigid and pulsing");
	output(", and you channel all of that into robustly deep-throating Inessa with your frenzied cock-" + (pc.tailType == GLOBAL.TYPE_COCKVINE ? "vine" : "tail") + ". The time you spent getting her used to the force and extent of your [pc.cockTail] was well spent, and she takes it like a champ: mouth open, eyes closed and tethered fists clenched, a series of wet ‘glork’s and ‘ack’s reverberating around the shop as you push into that wonderful tightness beyond her mouth again, and again, and again.");
	output("\n\nYou groan and clutch the counter as you cum, shooting a huge streamer of " + ((pc.tailType == GLOBAL.TYPE_COCKVINE && rand(2) == 0) ? "plant seed" : "[pc.cum]") + " directly into Inessa’s tummy, bypassing her taste-buds entirely. That is a situation you rectify by drawing your [pc.cockTail] back and filling her mouth with your next two glorious pulses, off-white paste spurting around her opened lips. Whilst she’s busy attempting to swallow that down, you pull out of her mouth entirely, grip the shaft of your tail-cock and spurt the last of its load across her face and small breasts like an out-of-control hose. You sigh when it finally wilts, a glow of magnificent contentment glowing through both you and " + (pc.hasParasiteTailCock() ? "the parasite" : "your tail" ) + ".");
	output("\n\nYou un-cuff Inessa and draw her up in your arms, letting her know by your expression and squeeze how pleased her dom is by her obedient participation in her own humiliation (not too close though. You really did splatter her good.) Inessa responds with a tremulous, out-of-focus grin; an expression somewhere between shock and profound, submissive pleasure.");
	output("\n\n<i>“Did I do alright, [pc.master]?”</i> she manages at last, wiping a trailer of cum off one of her star-burst eyes.");
	output("\n\n<i>“Very,”</i> you reply. You let your gaze drift beyond her to the shelves and hoardings, a possessive hand running down Inessa’s warm, slim flank. <i>“There’s plenty of other gear to advertise in here, isn’t there? More... advanced goods, that customers need real inducement to buy. Have a long think about that before I next visit.”</i>");
	output("\n\nYou step away and let an extremely flushed saeri hurry off to find a wash basin in the back.");
	if(flags["INESSA_BELTED"] != 2) output(" You think you hear her twitter curses about her chastity belt all the way.");
	//Small Exhibitionism score bump
	pc.exhibitionism(2);
	processTime(35);
	pc.orgasm();
	IncrementFlag("INESSA_TAILED");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//INESSA EXPANSION
//Give her the silk
public function giveInessaSilk():void
{
	clearOutput();
	author("Sen Kanashimi");
	showInessa();
	
	output("You hand Inessa the silk panel that Xanthe gave you back on Myrellion, wondering what it actually means. Inessa runs her hands over it and her [inessa.eyes] seem to light up.");
	output("\n\n<i>“Xanthe gave this to you didn’t she?”</i> You nod and she squees quite loudly. <i>“Ohmyzyi ohmyzyi!”</i> She exclaims, bouncing up and down on the spot, setting her [inessa.breasts] into a jiggle. She places the silk down and begins fluttering around the store, her [inessa.wings] carrying her at a near breakneck speed. She closes up the curtains and shutters, turns off the alarm, dims the lights and turns over the sign on the shop front that says “Bound up tight” as a euphemism for closed. You chuckle at her enthusiasm and watch her do this for a couple of minutes more before giving a sharp whistle to call her over. Inessa stops in her tracks and turns towards you. <i>“Yes, what is it?”</i> She stammers out. Void she’s so cute sometimes, and you say as much before asking what the silk actually means and why she’s buzzing around closing the shop.");
	output("\n\nInessa goes a deep hue of blue at the comment before she replies. <i>“S-Sorry, I’m just so excited. Xanthe wants me to go to Myrellion with you, it’s been so long since I’ve seen her.”</i> She stammers out, then holds up the piece of silk. <i>“And this is how I know, it’s a way that Siel and some Saeri can talk with family members kind of in secret.”</i> She explains. <i>“Each family has a slightly different way of making them, so no other family quite knows how to understand them.”</i> Clutching the silk to her chest, she wiggles on the spot before continuing on. <i>“It’s mostly used by Siel since they can actually produce the silk, but some Saeri learn to stitch them together from plain silk sheets so they can still communicate the same way.”</i>");
	output("\n\nYou nod and smile at her, thanking her for the explanation and letting her finish closing up the shop. <i>“Alright, everything’s all closed up here, let’s get going!”</i> You chuckle softly and tell her to slow down, it will be a long ride. She covers her mouth slightly and blushes. <i>“O-Of course, I’m sorry, whenever you’re ready.”</i>");
	output("\n\nWith that you instruct the snowy haired sub to follow you out of the store and onto your ship.");

	processTime(5);
	flags["INESSA_EXP"] = 2;
	clearMenu();
	addButton(0,"Next",inessaProvingScene);
}

//Fly to Myrellion
public function inessaProvingScene():void
{
	moveTo("744"); // Silken Serenity
	showLocationName();
	
	clearOutput();
	author("Sen Kanashimi");
	showInessa();

	output("<b>... Some time later....</b>");
	output("\n\nYou step into Xanthe’s shop with Inessa and look around for the Siel woman and call out for her.");
	output("\n\n<i>“Down here!”</i> She calls from down the hall somewhere, you take Inessa’s hand and guide her down the hallway to a large door, securely bolted shut. You gently rap your knuckles against the door and the bolts retract from the doorframe as Xanthe opens it from the other side. She stands completely naked in the doorway, giving you a sly grin before turning to Inessa. <i>“Oh my little sister, how I have missed you,”</i> she states, sweeping the comparatively small Saeri girl into a tight hug.");
	output("\n\nInessa squeaks softly as she’s engulfed by boobflesh and hugs, wriggling her way free once Xanthe lets go. <i>“So, my dear sister,”</i> Xanthe says, her smile turning up into a slight grin once more. <i>“Has [pc.short] explained to you what is going to happen?”</i> Inessa blinks and shakes her head, looking at you with more than a little confusion. Xanthe looks at you and smirks before turning back into the dark room. <i>“Be a dear and explain it to her won’t you? I’ve got to finish getting things set up.”</i>");
	output("\n\n<i>“W-What is she talking about [pc.short]? What’s going to happen?”</i> The confused and slightly scared Saeri girl asks, her nerves getting the better of her. You explain to her that you talked with Xanthe about her, and came to find out that Xanthe held the key to her chastity belt. <i>“Wait, she what?”</i> Inessa blinks confused once more.");
	output("\n\nYou chide her for interrupting, to which she blushes and lowers her head. <i>“I-I’m sorry, continue.”</i> You continue on to explain how you asked Xanthe how you could convince her to give you the key, and she replied that in order to be worthy of taking the key, you would have to prove yourself a capable Dominant and protector.");
	output("\n\n<i>“Xanthe only did this to protect you.”</i> You comfort her, placing a hand on her shoulder and smiling warmly.");
	output("\n\nInessa takes a deep breath, taking in the details as she calms herself down, her [inessa.wings] fluttering softly. <i>“So... I-If you prove yourself... you plan to become my "+ pc.mf("Master","Mistress") +"?”</i> She asks nervously, to which you reply with only a nod.");
	output("\n\n<i>“Many Dominants come in to Happy Tails, and I swoon for them all, but... you... you’re different, you actually mean it.”</i> Inessa closes her eyes and readies herself, her legs shaking as the prospect of what is about to happen sets in. <i>“O-Okay... I think I’m ready...”</i> Inessa takes another breath before placing her hand in yours, letting you guide her down into the dungeon of Silken Serenity.");
	
	pc.removeKeyItem("Xanthe's Silk");
	processTime(600 + rand(30));
	clearMenu();
	addButton(0,"Next",inessaProvingSceneii);
}

public function inessaProvingSceneii():void
{
	clearOutput();
	showName("XANTHE’S\nSEX DUNGEON");
	author("Sen Kanashimi");
	showInessa();

	output("You descend into the dungeon below Silken Serenity, looking around at the massive trove of bondage and kink gear, everything from steel shackles to wooden horses covers the floor and walls, you feel Inessa shiver as she too looks over the various strapped and shackled contraptions.");
	output("\n\n<i>“You two certainly took your time, hmm?”</i> Xanthe quips, standing nearby a large polished metal table fitted with all manner and length of shiny black leather straps and ropes that appear to be woven from her own Siel silk. <i>“This is your test, [pc.name], dominate my sister and act like I’m not here at all - but nothing too rough, then it would be over too quickly.”</i> Xanthe chuckles and steps over to the side of the room, letting you have free reign over the selection of toys and the table. You ponder over this for a moment before pulling Inessa over to the table.");
	output("\n\n<i>“Hop up onto the table sl-”</i> You stop yourself and rethink your words. <i>“My dear.”</i>");
	output("\n\n<i>“Yes, " + pc.mf("Sir","Ma’am") + ",”</i> Inessa replies quickly before jumping up onto the cold metal table, a light shiver passing through her as her [inessa.butt] contacts the cool polished surface. You lay her down carefully, ensuring her wings are not going to be damaged, then make your first selection on the silk ropes, deftly tying them around Inessa’s wrists and ankles, slipping two fingers between her skin and the rope to ensure her circulation won’t be cut off. You allow your [pc.eyes] to wander over the bound Saeri sub, her [inessa.skin] flushing under your gaze, feeling a heat in your loins as she lightly squirms on the cool metal table, but this time you won’t focus on your pleasure. Turning around to the selection of toys and teasing devices, you pick out a few to make use of.");
	output("\n\nTurning back to Inessa, you set your selection down on the small table beside the bondage table, first reaching forwards to glide your fingers over her supple flesh, tracing little shapes onto her navel, scraping your nails along her skin to leave behind a soft tingle which causes the snowy haired sub to squirm more, her breathing quickening oh-so-slightly. Moving your fingers further up, you trail your nails up through the valley of her pert handfuls, turning back around to glide across the topside of her breasts before working down once more through the valley. <i>“How does that feel, dear?”</i> you ask softly. She answers with a soft whimper, a shudder of pleasure rumbling through her small frame.");
	output("\n\nWith that you gaze over your selection once more before picking out a feather, twirling it in your fingers experimentally before bringing it down to just above the snowy haired sub’s [inessa.nipple], looking her in the eyes before brushing it across, eliciting a surprised squeak from her lips that causes a slight grin to grow on your face and brush the feather across once more, trailing it slowly down across her areolae and titflesh.");
	output("\n\n<i>“"+ pc.mf("Sir","Ma’am") +" that feels strange but... G-Good as well.”</i> Inessa says after a particularly loud pleasured squeak, tugging lightly against her silken restraints. Encouraged by her response you trace circles around her other nipple with the tip of the feather before setting it aside, snickering as her breathing speeds up again, though not quite hot and heavy yet. Deciding to take it a bit further and test her trust, you take a woven silk sleep mask from the toy rack, feeling the soft texture in your hands before hovering it in front of Inessa’s face, her dusky cheeks darkening as she understands, lifting her head from the table to allow you to slip the blindfold over her [inessa.eyes], casting her into darkness.");
	output("\n\n<i>“Don’t worry, I promise I’ll be gentle.”</i> You whisper softly into her ear, causing her breath to catch in her throat, she nods softly, trusting you completely at this point. You cast a quick glance towards Xanthe and notice her smiling, not in a smug or amused way, just a genuine pleased smile. The acknowledgement that you are doing well spurs you on, picking up a pair of nipple clamps from your selection and testing their strength, dialing the adjustment screw down before attaching them to Inessa’s [inessa.nipples], causing her to suck in a sharp breath that devolves into a pleasured sigh accompanied by a shudder. Once the clamps are sitting snugly on her nipples you twist the adjustment screws, slowly increasing the pressure upon the perky nubs, her back arching in response, to which you grin and give the clamps a light flick, the slight twisting of her nipples sending a light shock of pleasure, causing her to gasp rather loudly.");
	output("\n\nThe cues of her body give way to how she feels, her [inessa.breasts] rising and falling rapidly, her breath hot and heady, full body shivers of pleasure showing just how much she gets off on being toyed with, the thrill of being at the whim of another... You find yourself flushed as well, quite enjoying having complete control over her, it sets your heart pounding as you realize the connection. Deciding that she is wound up enough, you run your hand down across her navel until your fingers touch the edge of the chastity belt, giving it a light tap, the Saeri sub tugs on her restraints as you tease her with what she cannot get, you can only imagine what it’s like under the unrelenting metal.");
	output("\n\n<i>“My dear, is there something you would like to ask?”</i> You say, tapping the edge of her belt again. <i>“Don’t be afraid.”</i>");
	output("\n\nInessa lets out a frustrated moan. <i>“I-I think I’m about to cum "+ pc.mf("Sir","Ma’am") +", please may I, I want it so badly!”</i> She stutters out, flushing even deeper. You decide to see just how much in tune you both are, and give her one simple command. <i>“Cum, my dear.”</i>");
	output("\n\nWith that Inessa’s back arches up and a sound of pure pleasure rips itself from her throat, her body tensing and relaxing spastically as orgasmic bliss fills her, neurons firing blanks as utter toe-curling pleasure courses through her nerves, leaving you stunned that actually worked. Some of her [inessa.girlCum] actually manages to leak from the edges of the belt, pooling in the crack of her ass on the table, slickening the surface of the polished metal.");
	output("\n\nAs she comes down from her orgasmic high you quickly untie her bindings and slowly remove the blindfold as not to startle her, gently pulling her closer as you rest an arm over her, your other hand gently caressing her dusky blue cheek. She breathes heavily and looks around in a confused daze, but she feels your loving touch and calms, taking slow breaths as she relaxes, scooting a bit closer to your touch.");
	output("\n\n<i>“T-Thank... Thank you... "+ pc.mf("Sir","Ma’am") +"...”</i> She says wearily, closing her eyes and drifting off to a peaceful rest. You gently lift her from the table and carry her over to the nearby bed, setting her down on the plush cushions that cover the surface.");
	output("\n\n<i>“You did well.”</i> Xanthe says, the same pleased smile on her lips. <i>“I admit I didn’t think you would go through with this, but I’m glad to be wrong, for once.”</i> She chuckles softly, nodding to herself. <i>“You’ve earned this, [pc.short]. I don’t say that often.”</i> Xanthe tosses you the little gold key to Inessa’s belt and you smile, nodding to her.");
	output("\n\n<i>“I’ll treat her well, don’t worry”</i> You quip, pocketing the key for later. For now, Inessa is still recovering and you need to care for her.");
	output("\n\n<i>“I must get back to business though, silk clothing doesn’t sew itself.”</i> Xanthe says as she walks to the door. <i>“Do take care, won’t you?”</i> You nod and return your attention to Inessa, who is slowly stirring from her short rest.");
	output("\n\n<i>“Mnhh... Wow...”</i> She mutters, stretching herself out on the bed. <i>“I-I’ve never felt like that before, with anyone...”</i> You smile at her declaration and lean down to plant a kiss on her forehead which causes her to flush and giggle. Void, she’s cute sometimes. You leave for a moment to grab a cup of water, setting it on the table beside her until she can sit up.");
	output("\n\n<i>“I...”</i> Inessa starts, taking a breath before continuing. <i>“I’m happy we did this... "+ pc.mf("Master","Mistress") +", thank you.”</i> Hearing her decide to call you that fills your heart with a deep sense of happiness and fulfillment, and you just smile, caressing the snowy haired subs cheek, she leans into your touch and sits up, taking a sip from the cup of water you got her.");
	output("\n\n<i>“Let’s head back to the ship,”</i> you say. Inessa nods and slowly stands, walking out of the dungeon.");
	output("\n\nAs you pass Xanthe in the store she speaks up. <i>“[pc.Short], a moment before you leave.”</i>\n\nYou nod and tell Inessa to wait outside.");
	output("\n\n<i>“This was all on fairly short notice so I doubt you’ve had the chance to pick out a collar, correct?”</i> Xanthe asks, you nod and ask if she had something in mind. Xanthe smiles and wanders over behind the counter, pulling out a small box and handing it to you. <i>“I had it specially made to go together with the belt should anyone actually prove themselves. It will use the same key and is just as indestructible,”</i> she states.");
	output("\n\nYou thank Xanthe with a smile and add the box to your pack, bidding her goodbye.");
	output("\n\n<i>“Don’t be a stranger now,”</i> she quips.");
	output("\n\nYou chuckle and walk out of the store, rejoining with your blue-skinned sub.");
	output("\n\n<i>“All ready to go " + pc.mf("Master","Mistress") + "?”</i> Inessa asks. You nod and take her hand, guiding her back to your ship with a spring in your step.");
	processTime(30);
	clearMenu();
	addButton(0,"Next",inessaBeltRemoval);
}

//Back To Tavros
public function inessaBeltRemoval():void
{
	moveTo("SHIP INTERIOR");
	showLocationName();
	
	clearOutput();
	author("Sen Kanashimi");
	showInessa();

	output("Returning to your ship with Inessa in tow, you instruct her to follow you to your quarters, heart fluttering at what is to come next. Inessa follows suit, her dusky cheeks a darkened shade, her fingers lightly fidgeting with the edge of her belt.");
	output("\n\n<i>“Lie on the bed, my dear.”</i> You instruct, Inessa does so without hesitation, laying herself out on your bed and marveling in its comfort as she sinks into its soft embrace. <i>“M-"+ pc.mf("Master","Mistress") +"... Thank you...”</i> The submissive Saeri girl whispers. <i>“Thank you for going through all this, just for me.”</i> She fidgets with the blankets on your bed as her nerves get the better of her, dusky cheeks darkening. <i>“I promise I’ll be the best sub ever.”</i>");
	output("\n\nYou hop up onto the bed with your sub and lightly toussle her [inessa.hair], saying you are sure she will do perfectly fine. You hold the golden key in your hand, the dim light of your quarters glittering off of its reflective surface. <i>“Are you ready?”</i> You ask Inessa, she doesn’t hesitate to nod softly, eyes fixed to the key.");
	output("\n\nYou lower the key down to her belt and insert it into the high security lock, turning it with a bit of light pressure and a soft ‘click’, the lock relents and the side straps of the torturous device fall from the front plate. You gently pry the belt upwards, the sheer amount of sexual fluids coating the padded interior of the belt is almost mind boggling, she really hasn’t had any release for a long time, and no doubt the test Xanthe had you perform made things all the more sticky. Inessa gasps softly as the padded front plate is finally removed from her achingly wanting pussy, releasing her from her crotchular bondage. Allowing a cool breeze to billow across the fluid-slicked surface of her outer lips causes her to shudder from tip to toe. Her lips slightly agape and her eyes softly closed, she is finally free of the belt. You lift her [inessa.butt] up from the surface of the bed and remove the rest of the belt, setting it to the side.");
	output("\n\n<i>“Aaah.”</i> Inessa gasps. <i>“It feels so strange after so long, but it feels good to be free of it.”</i> Her lips curl up into a contented smile, her eyes remaining softly closed in the same manner. You go to the cockpit for a moment and plug in the coordinates for Tavros station, setting a course for the nearest gate before slipping into bed with your new Saeri sub, wrapping your arms around her in a warm embrace which she sinks into happily.");
	output("\n\n<i>“Tomorrow, my dear, I will take your virginity and truly claim you as mine.”</i> Your breath tickles her ear and you feel the Saeri girl shudder in your arms. <i>“For tonight, rest and regain your strength.”</i>");
	output("\n\n<i>“Yes, "+ pc.mf("Master","Mistress") +".”</i> Inessa chimes happily, curling up in the protection of your comforting cuddles, slowly lulling into a well deserved rest from the long day.");
	output("\n\nYour ship on a course for Tavros station, you slip into a into a deep sleep alongside your new Saeri Sub.");
	output("\n\n<b>...Later...</b>");
	output("\n\nYou stir from your peaceful slumber and begin to wake, eyes opening to the sight of Inessa snuggled in your arms, still fast asleep, you decide to wait for her to wake before moving, enjoying the feeling of her soft skin on yours as she rests there, finally free of that blasted device.");
	output("\n\n<i>“Mhnn...”</i> Inessa mumbles groggily as she too wakes from the sleep, feeling your arms around her she smiles, wiggling against you before sitting up, allowing you to do the same. You both stretch and properly wake yourselves up after such a peaceful sleep, unlike any you’ve had before, cuddling your cute snowy haired sub all night. <i>“Morning, "+ pc.mf("Master","Mistress") +".”</i> Inessa mumbles, letting out a short yawn, then suddenly she remembers why she’s here, eyeing the chastity belt that once trapped her as a soft blush spreads itself across her cheeks.");
	output("\n\nYou head to the cockpit and proceed with the docking procedure at Tavros station, setting down in your hangar while Inessa wakes herself up in your quarters. With the landing procedure completed you shut off your ship’s engines and return to your room.");

	processTime(600 + rand(30));
	flags["INESSA_BELTED"] = 2;
	clearMenu();
	addButton(0,"Next",inessaFirstTime);
}

public function inessaFirstTime():void
{
	clearOutput();
	author("Sen Kanashimi");
	showInessa();

	output("<i>“Are you sure you’re ready for this, dear?”</i> you ask, placing a hand on her shoulder.");
	output("\n\nShe places her hand on yours and smiles, nodding softly. <i>“I-I’m sure, there isn’t anyone else I could think of doing this with now.”</i>");
	
	var x:int = -1;
	
	if(pc.hasCock())
	{
		x = pc.cockThatFits(chars["INESSA"].vaginalCapacity(0));
		if(x < 0) x = pc.smallestCockIndex();
		
		output("\n\nWith that you stand up and order her to bend over on the edge of the bed, she does so without hesitation, resting her top half on the plush covers with her [inessa.butt] hiked up, exposing her [inessa.vagina], the lips parted oh-so-invitingly causing your [pc.cocks] to spring to half-mast near instantly. Inessa looks back nervously, biting her lip as she prepares herself, spreading her legs a bit more as you hop up onto the bed with her, getting closer to her submissive form to lightly trail your [pc.tongue] across her [inessa.vagina] lips, tasting her sweet juices after her being pent up and desperate for oh-so long. She tastes amazing and you find yourself gently lapping at her folds, cleaning her snatch of her liquid arousal.");
		output("\n\nInessa begins to let out cute little gasps and subtle moans as you work your mouth magic on her cunt, twitching every now and again as the tip of your tongue passes over her sensitive little pleasure buzzer, sending a jolt right up her spine. Deciding she’s well enough prepared, you kneel up behind her and line your [pc.cockHead " + x + "] up with her virginal snatch, causing her to shiver as your glans brushes her [inessa.clit].");
		output("\n\nYou grip Inessa’s [inessa.hips] for leverage, slowly pulling her back onto your [pc.cock " + x + "], spreading her [inessa.vaginaColor] lips apart. Void, she’s so damn tight it’s difficult to make any progress beyond poking her outer lips, but you push just a bit harder, letting out a grunt when you slide in further than you expected, half of your [pc.cockNounSimple " + x + "] forced into her virginal passage so suddenly. Inessa cries out in mixed pain and pleasure as her virginity is taken by your [pc.cockNounComplex " + x + "]. <i>“M-"+ pc.mf("Master","Mistress") +"!”</i> the little fuckterfly cries out, her back arching as her [inessa.vagina] is stuffed for the first time.");
		output("\n\nYou sit there still for a moment, letting her adjust to your size before picking up a slow but steady rhythm, your [pc.cockNounComplex " + x + "] molding her inner walls to your exact shape as they squeeze you so tightly, almost painfully, but you persevere. Being cramped up for so long her pussy practically begs for more, her [inessa.girlCum] leaking and dripping all over your bed covers as well as splattered over your thighs, coating them in a sheen of fluids. Inessa’s [inessa.wings] flutter erratically every now and then as her nerves are assaulted with these new feelings of pleasure so deep inside of her. Precum begins to leak from your [pc.cockHead " + x + "] and mix with her juices, leaking out from around your shaft as it slides in and out, lewd noises clearly audible from the vice grip her walls have on you.");
		
		pc.cockChange();
		
		output("\n\nYou shift your position slightly, lifting her [inessa.butt] higher for some better leverage before you pick up the pace, [pc.cockNounSimple " + x + "] plunging in and out of her [inessa.vagina] with an increased vigor, setting your Saeri sub moaning aloud, burying her face into the covers in a vain attempt to stifle them. <i>“M-"+ pc.mf("Master","Mistress") +" it feels amazing! Please don’t stop!”</i> She cries out as you rail her no-longer-virginal depths. In time it becomes too much to bear");
		if(pc.balls >= 1) output(" as your [pc.balls] churn with their liquid payload"); 
		else output(" as your peak fast approaches");
		output(", and judging by how your Saeri sub moans and writhes beneath you she is right there with you.");
		output("\n\n<i>“"+ pc.mf("Master","Mistress") +"! I-I’m cumming!”</i> Inessa cries out, her vice-like grip on your shaft clenching even harder, wringing you for all the cum you have, and you give it freely, unleashing a torrential wave of [pc.cumVisc] [pc.cumColor] seed deep inside of her spasming quim that coats her walls [pc.cumColor] and spurts out around your [pc.cockNounSimple " + x + "].");
		output("\n\nAs both your orgasms begin to die down you pull your cock from Inessa’s thoroughly claimed pussy, letting a gout of semen seep from her gaping hole.");
	}
	
	//Presumably Inessa brought a strapon if PC doesn't own one?
	else
	{
		if(pc.hasVagina()) x = rand(pc.vaginas.length);
		
		output("\n\nWith that you stand up from the bed and order her to bend over on the edge of the bed, she does so without hesitation, resting her top half on the plush covers with her [inessa.butt] hiked up, exposing her [inessa.vagina], the lips parted oh-so-invitingly causing a heat to rise"); 
		if(x >= 0) output("in your [pc.vaginas].");
		else output("within you.");
		output("\n\nInessa looks back nervously, biting her lip as she prepares herself, spreading her legs a bit more as you hop up onto the bed with her, leaning down behind her submissive form to lightly trail your [pc.tongue] across her [inessa.vagina] lips, tasting her sweet juices after her being pent up and desperate for so long. She tastes amazing and you find yourself gently lapping at her folds, cleaning her snatch of her liquid arousal.");
		output("\n\nInessa begins to let out cute little gasps and subtle moans as you work your mouth magic on her cunt, twitching every now and again as the tip of your tongue passes over her sensitive little pleasure buzzer, sending a jolt right up her spine. Deciding she’s well enough prepared, you reach over to your toy box and retrieve a moderately large strapon with a double-sided dildo secured into the straps, bringing the head up to brush between her sopping wet lips, causing Inessa to reflexively shift her hips back, trying to feel more.");
		output("\n\nYou smirk at her reaction and sit up behind her, wasting no time in ");
		if(x >= 0) output("lining one tip of the dildo up with your [pc.vagina " + x + "] and shoving it inside rather unceremoniously, causing you to let out a squeal of pleasure, your walls gripping the toy firmly. You secure the straps around your waist to make sure the dildo doesn’t shift around too much, giving the shaft a little tug and letting out a gasp when the end of the faux-cock inside of you shifts just a bit.");
		else output("fastening the straps around your waist to make sure the dildo doesn’t shift around too much, giving the shaft a little tug");
		output("\n\nYou line the tip of the strapon up with your little fuckterfly’s [inessa.vagina], spreading her [inessa.vaginaColor] lips apart. Void, she’s so damn tight it’s difficult to make any progress beyond poking her outer lips, but you push just a bit harder, letting out a grunt when you slide in further than you expected, half of the dildo forced into her virginal passage so suddenly.");
		output("\n\nInessa cries out in mixed pain and pleasure as her virginity is taken by the girthy strapon. You moan aloud in sync as the other end of the dildo batters up against your deepest recesses, setting nerve endings alight. <i>“M-"+ pc.mf("Master","Mistress") +"!”</i> the little fuckterfly cries out, her back arching as her [inessa.vagina] is stuffed for the first time.");
		output("\n\nYou sit there still for a moment, shuddering in pleasure as the dildo shifts inside of your own snatch. You allow Inessa to adjust to the size before picking up a slow but steady rhythm, the unrelenting pseudo-phallus molding her inner walls to its exact shape as they squeeze so tightly. Being cramped up for so long her pussy practically begs for more, her [inessa.girlCum] leaking and dripping all over your bed covers as well as splattered over your thighs, coating them in a sheen of fluids. Inessa’s [inessa.wings] flutter erratically every now and then as her nerves are assaulted with these new feelings of pleasure so deep inside of her.");
		if(x >= 0) output("The steady rhythm has your own [pc.girlCum] running rivulettes from your sodden box, soaking the leather strapon before seeping out and down your thighs, mixing in with the snowy haired subs liquid lust as it soaks into the covers.");
		output("\n\nYou shift your position slightly, lifting her [inessa.butt] higher for some better leverage before you pick up the pace, soaked dildo plunging in and out of her [inessa.vagina] with an increased vigor, setting your Saeri sub moaning aloud, burying her face into the covers in a vain attempt to stifle them. <i>“M-"+ pc.mf("Master","Mistress") +" it feels amazing! Please don’t stop!”</i> She cries out as you rail her no-longer-virginal depths. In time it becomes too much to bear as the dildo batters your insides, setting your nerves alight with pleasure, and judging by how your Saeri sub moans and writhes beneath you she is right there with you.");
		output("\n\n<i>“"+ pc.mf("Master","Mistress") +"! I-I’m cumming!”</i> Inessa cries out, her vice-like grip on the shaft clenching even harder, wringing the imitation cock in vain trying to suck baby batter from its tip."); 
		if(x >= 0) output("Your own [pc.vagina " + x + "] spasms around the other end, doing much the same as your [pc.girlCum] leaks freely from your sopping quim.");
		else output("You gasp in pleasure.");
		output("\n\nAs both your orgasms begin to die down you pull the dildo from Inessa’s thoroughly claimed pussy, letting a little squirt of her juices slip from her gaping hole.");
	}
	output("\n\n<i>“T-Thank you... "+ pc.mf("Master","Mistress") +"...”</i> The well-fucked sub stutters, slumping down on the bed for a well deserved nap. You lie down beside her and gently caress her cheek, slipping into your own contented slumber.");
	
	processTime(240);
	flags["INESSA_VIRGINITY"] = 1;
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",inessaFirstTimeAfter);
}

public function inessaFirstTimeAfter():void
{
	clearOutput();
	author("Sen Kanashimi");
	showInessa();

	output("You awake some time later, your snowy haired sub curled up in your arms, you place a sweet kiss to her cheek before disentangling yourself from her, sitting up and stretching. Inessa stirs as you sit up, yawning cutely before sitting up herself.");
	output("\n\n<i>“Y-You know... I still can’t believe I got so lucky.”</i> Inessa remarks, leaning against your shoulder. <i>“I’m just a little submissive Saeri girl, yet you chose me, of all the subs in the galaxy... And I couldn’t have hoped for anyone better.”</i> You wrap an arm around her and pull her close, your warm embrace bringing a dusky hue to her cheeks.");
	output("\n\n<i>“There is one last thing, my dear,”</i> you say, turning to pick up the box from your bedside table. Turning back around and opening it up, Inessa’s breath catches in her throat as she lays eyes on the item, a beautiful collar made of the same material as her chastity belt, engraved with a similar floral pattern as the tattoo on her back. On the reverse is a high-security lock fitted to the same key as the chastity belt, and on the front is a moderately sized amethyst, carved into the shape of a heart with a padlock symbol engraved on the front.");
	output("\n\n<i>“M-"+ pc.mf("Master","Mistress") +", it’s beautiful!”</i> Your snowy haired sub squeals, you chuckle at her reaction and tell her to turn around, she does so without question allowing you to loop the padded metal band around her neck and lock it shut in the back with an audible ‘click’ that sends a shiver down her spine. <i>“Thank you so much!”</i> Inessa exclaims, turning back around and giving you a big hug before sitting back, letting you admire how it looks on her. You comment that it looks amazing and her already flushed cheeks darken even further.");
	output("\n\n<i>“I suppose I should get back to the shop, it isn’t going to run itself, but... Could I use the shower first?”</i> She asks. You nod and lie back down, content to relax for just a bit longer while Inessa uses your ships shower.");
	output("\n\nA few minutes later Inessa emerges from the shower and towels herself off before heading back to the quarters. You wrap her in a tight hug and smile. <i>“Be good my dear, I expect you to be ready whenever I come back,”</i> you say, giving her a little wink as well.");
	output("\n\n<i>“O-Of course "+ pc.mf("Master","Mistress") +", I’ll always be ready to serve you,”</i> Inessa chimes, her wings fluttering softly before she turns and leaves, returning to Happy Tails and leaving you alone in your ships quarters.");
	
	processTime(5);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function fuckInessaPussy():void
{
	clearOutput();
	author("Sen Kanashimi");
	showInessa();
	
	output("You walk over to the front of the store and flip the sign from ‘Open’ to ‘Bound up Tight!’ striding back up to Inessa with a smirk. You give her a ‘come with me’ gesture and she does so without question, following you as you walk past her to a secluded bondage bed in the back of the store.");
	output("\n\n<i>“Up onto the bed my dear, on your back, arms and legs spread.”</i> You order, walking around the bed to prepare the ropes, making sure they’re secured to the bed properly, wouldn’t want your little fuckterfly to get loose of her bindings now. Inessa lays herself down on the bed, careful of her wings as she splays herself out by your order, cutely nibbling on her lower lip as thoughts run through her head.");
	output("\n\nYou take her arms first, securing them to the bed with the silken ropes one after the other, testing for circulation before moving to her legs, tying them open as well leaving her helpless and exposed, feminine lust already beading on her [inessa.vagina]. Looking at the shop’s selection you pick out a nice, large ball gag and silk blindfold from the wall, returning to the bed with the items in hand. Inessa sees the gag and without a word opens her mouth to accept it, the obedience gives you a warm feeling in your heart as you slip the sphere between her lips, securing it in place behind her head.");
	
	var x:int = -1;
	
	if(pc.hasCock())
	{
		x = pc.cockThatFits(chars["INESSA"].vaginalCapacity(0));
		if(x < 0) x = pc.smallestCockIndex();
		
		output("\n\n<i>“Ready, pet?”</i> You ask your Saeri sub, she nods and lifts her head a bit more to let you slip the blindfold over, making sure it won’t get loose. Your sub sufficiently prepared, you slip off your [pc.gear] and set it on the bedside table, your [pc.cockNounComplex " + x + "] springing to half-attention as it comes free of your undergarments, bobbing under it’s own weight.");
		output("\n\nCrawling up onto the bed, you waste no time in lining up your [pc.cockHead " + x + "] with her [inessa.vagina], causing a whimper to slip from behind her gag, keeping a light pressure against her outer lips before thrusting your [pc.hips] forwards, sinking an inch of your [pc.cock " + x + "] into her velvet vice. You grunt as your progress is suddenly halted by how amazingly tight her passage squeezes you, almost painfully so, but you press on, slipping another few inches inside her slickened tunnel, eliciting a delectable moan from behind her gag as your [pc.cockNounComplex " + x + "] bottoms out.");
		output("\n\nInessa tugs futily on her bindings, her cheeks flushed as your cock throbs within her. You groan as her [inessa.vagina] grabs a hold of you in all the right ways, rhythmic squeezes running over your length, drawing you deeper into her searing depths. Deciding to step it up a notch you lift her hips slightly from the bed and hop up onto your knees between her bound legs to gain some leverage before going to town.");
		output("\n\nInessa cries out from behind her gag, a wail of pleasure as your [pc.cock " + x + "] ravages her insides, the angle of penetration setting off all the right places in her silken tunnel, your [pc.cockHead " + x + "] bumping against her g-spot with each powerful thrust, your cock nearly falling free from her once-virginal flower before plummeting in once more. Inessa’s [inessa.wings] flutter erratically every now and then underneath her as her nerves are assaulted with pleasure, your deep thrusts coupled with her sopping wet insides echo such lewd sounds around the shop, her muffled moans, wet squelches, your own near-animalistic grunts as you thoroughly claim her [inessa.vagina].");
		
		pc.cockChange();
		
		output("\n\nSuddenly Inessa lets out three sharp moans behind her gag and her silken walls clench around your [pc.cock " + x + "] even harder, causing your thrusts to slow considerably- She’s about to cum, but she’s holding herself back, waiting for something. A grin crosses your face as you realize she’s waiting for your permission... She’s been a good girl, so you decide to allow it, putting more force behind your thrusts as you say to her. <i>“Cum, my dear.”</i>");
		output("\n\nAll the encouragement she needs given, her back arches deeply as she strains against her bindings, mouth opening wide enough that the gag slips free from her lips, letting her deep moans of pure bliss fill the room, her [inessa.girlCum] squirting around the edges of your [pc.cock " + x + "], coating your thighs and crotch in her liquid lust. Her walls writhe around you, clenching and unclenching, drawing your shaft even deeper into her sodden depths practically begging for your release.");
		output("\n\nHer orgasmic writhing and moaning draws your peak closer. A few quick, forceful thrusts later you pull her hips tightly against your own, bottoming out inside of her sopping box and letting your flow of [pc.cumVisc] [pc.cumColor] coat her insides thoroughly before squirting out around your cock when no more can be packed inside, joining her [inessa.girlCum] on your thighs, crotch and on the bed below you both.");
	}
	
	else
	{
		if(pc.hasVagina()) x = rand(pc.vaginas.length);
		
		output("\n\n<i>“Ready, pet?”</i> You ask your Saeri sub, she nods and lifts her head a bit more to let you slip the blindfold over, making sure it won’t get loose. Your sub sufficiently prepared, you slip off your [pc.gear] and set it on the bedside table");
		if(x >= 0) output(", your [pc.vaginas] leaking juices down your [pc.legOrLegs] already.");
		else output(".");
		output("\n\nYou lay down between her splayed legs and take stock of her position, little pleasure buzzer slightly throbbing, her lips already slickened and aching for attention, you simply dive in and get to work. You trail your [pc.tongue] across her [inessa.vagina] lips, tasting her sweet juices. She tastes amazing and you find yourself gently lapping at her folds, cleaning her snatch of her liquid arousal.");
		output("\n\nInessa lets out muffled moans from behind her gag as you work your mouth magic on her cunt, twitching every now and again as the tip of your tongue passes over her sensitive little pleasure buzzer, sending a jolt right up her spine. Deciding she’s well enough prepared, you stand and retrieve a moderately large strapon with a double-sided dildo secured into the straps, bringing it back to the bed and laying down once more, you slip the head up to brush between her sopping wet lips, causing Inessa to reflexively shift her hips back, trying to feel more.");
		output("\n\nYou smirk at her reaction and sit up, wasting no time in");
		if(x >= 0) output(" lining one tip of the dildo up with your [pc.vagina " + x + "] and shoving it inside rather unceremoniously, causing you to let out a squeal of pleasure, your walls gripping the toy firmly. You secure the straps around your waist to make sure the dildo doesn’t shift around too much, giving the shaft a little tug and letting out a gasp when the end of the faux-cock inside of you shifts just a bit.");
		else output(" fastening the straps around your waist to make sure the dildo doesn’t shift around too much, giving the shaft a little tug");
		output("You line the tip of the strapon up with your little fuckterfly’s [inessa.vagina], spreading her [inessa.vaginaColor] lips apart. It’s difficult to make any progress beyond poking her outer lips, but you push just a bit harder, letting out a grunt when you slide in further than you expected, half of the dildo forced into her " + (flags["INESSA_VIRGINITY"] == undefined ? "virginal" : "moist") + " passage so suddenly.");
		output("\n\nInessa cries out in pleasure as you ram the dildo so deeply in with one stroke, you moan aloud in sync as the other end of the dildo batters up against your deepest recesses, setting nerve endings alight. The little fuckterfly moans delectably, her back arching as her [inessa.vagina] is stuffed so full.");
		output("\n\nYou sit there still for a moment, shuddering in pleasure as the dildo shifts inside of your own snatch. You allow Inessa to adjust to the size before picking up a slow but steady rhythm, the unrelenting pseudo-phallus molding her inner walls to its exact shape as they squeeze so tightly. Her [inessa.girlCum] leaks all over the bed covers as well as splattered over your thighs, coating them in a sheen of fluids. Inessa’s [inessa.wings] flutter erratically every now and then underneath her as her nerves are assaulted with pleasure."); 
		if(x >= 0) output("The steady rhythm has your own [pc.girlCum] running rivulettes from your sodden box, soaking the leather strapon before seeping out and down your thighs, mixing in with the snowy haired subs liquid lust as it soaks into the covers.");
		output("\n\nYou shift your position slightly, lifting her [inessa.butt] higher for some better leverage before you pick up the pace, soaked dildo plunging in and out of her [inessa.vagina] with an increased vigor, setting your Saeri sub moaning aloud, burying her face into the covers in a vain attempt to stifle them. You rail her once-virginal depths and In time it becomes too much to bear as the dildo batters your insides, setting your nerves alight with pleasure, and judging by how your Saeri sub moans and writhes beneath you she is right there with you.");
		output("\n\n<i>“Cum, my dear.”</i> You manage to squeal out between moans, her vice-like grip on the shaft clenching even harder, wringing the imitation cock in vain trying to suck baby batter from its tip.");
		if(x >= 0) output("Your own [pc.vagina " + x + "] spasms around the other end, doing much the same as your [pc.girlCum] leaks freely from your sopping quim.");
	}
	
	output("\n\nYou flop onto the bed beside her, twitching slightly from your own orgasm. Inessa has already passed out so you quickly get to work untying her, setting the");
	if(!pc.hasCock()) output(" strapon,");
	output(" ball gag and blindfold aside. You stay there with her, gently petting her hair and making sure she’s calm before going to get a cup of water for her, as you come back she’s starting to wake up and you sit beside her, smiling when her [inessa.eyes] open and look at you, causing your little well-fuckedterfly to smile as well, nuzzling against your petting hand.");
	output("\n\nYou make sure she’s alright and get her to drink some water before you stand. <i>“I’m sorry my dear but I must go, a fortune won’t find itself.”</i> You chuckle softly to yourself and lean down, placing a kiss upon Inessa’s forehead, causing her to blush and giggle.");
	output("\n\n<i>“I know, "+ pc.mf("Master","Mistress") +". Please don’t be too long though? I’ll miss you too much...”</i>");
	output("\n\nYou tousle the adorable saeri girls hair and nod, saying you’ll be back as soon as you can before turning to leave, letting Inessa decide when she wants to open the shop again.");
	
	processTime(30);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
