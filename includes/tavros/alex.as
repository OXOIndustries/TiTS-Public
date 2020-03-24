//Redone by BubbleLord, coded by Kitteh6660
//Original can be found in alex_original.as
import classes.Characters.PregnancyPlaceholder;
/*FIRST TIME INTRO
[No]
[Yes]
[Flirt]
[Yes]
[No]
[What are you?]
[Yes]
[More]
[Bail]
REPEAT INTRO (you didn’t tap that)
[Androgyne]
[Flirt]
[What are you]
[Bail Again]
REPEAT INTRO (You tapped that (or bailed at the last minute))
[Alex]
[Sex]
[Talk]
SEX (FUCKING FINALLY)
Aside: BUT WHAT DO DICK SIZES MEAN TO ALEX?
[Pitch Vaginal]
[Catch Vaginal]
[Frottage]
[Catch Anal]
[Bail Once More]
FLAGS
FUCKED_ALEX
 How many times you sexed with Alex.
DRANK_WITH_ALEX
 How many times you drank with Alex
ALEX_CONFESSED
 Determines if he finally revealed his gender.
LEFT_ALEX_REASON
 1 = Bailed on him
 2 = Declined drink
*/

public function alexNameBustDiplay(nude:Boolean = false):void {
	showBust(alexBustDisplay(nude));
	if(flags["FUCKED_ALEX"] != undefined || flags["LAST_MINUTE_ALEX_BACK_OUT"] != undefined) showName("\nALEX");
	else showName("PRETTY\nBOY");
}
public function alexBustDisplay(nude:Boolean = false):String
{
	var sBust:String = "ALEX";
	if(nude) sBust += "_NUDE";
	return sBust;
}

public function getAlexPregContainer():PregnancyPlaceholder
{
	var pregContainer:PregnancyPlaceholder = new PregnancyPlaceholder();
	pregContainer.createStatusEffect("Infertile");
	return pregContainer;
}

//FIRST TIME INTRO
public function alexManHermIntro(slot:int = 1):void {
	if(flags["FUCKED_ALEX"] == undefined && flags["MET_ALEX"] == undefined) 
	{
		output("\n\nYour attention is drawn by a tall and very pretty... Man? Woman? A very pretty person leaning against the bar, clad in baggy pants tucked into boots and a strip of cloth wrapped tightly around their very flat chest. That combined with the close-cropped hair and slight but noticeable muscle tone makes you want to say it’s a man, but their lithe, narrow waist and flared hips imply otherwise. Before you can make a call, the person in question flashes you a brilliant smile your way and beckons you over.");
		addButton(slot,"Pretty Boy",approachAlex,undefined,"Pretty Boy","They certainly look interesting...");
	}
	else if(flags["FUCKED_ALEX"] == undefined && flags["LAST_MINUTE_ALEX_BACK_OUT"] == undefined) 
	{
		output("\n\nIt looks like that androgynous man from before is around again.");
		if (flags["DRANK_WITH_ALEX"] == undefined) {
			addButton(slot, "Pretty Boy", approachAlex, undefined, "Pretty Boy", "Greet the prettyboy.");
		}
		else {
			addButton(slot, "Alex", approachAlex, undefined, "Alex", "Your drinking buddy’s got a nice seat beside him, perfect for your keister.");
		}
	}
	else 
	{
		output("\n\nYour ");
		if(flags["FUCKED_ALEX"] != undefined) output("fuck-");
		output("buddy Alex is hanging out in his usual spot at the bar, drinking something fruity looking and casting occasional lascivious glances your way.");
		addButton(slot, "Alex", approachAlex, undefined, "Alex", "The androgyne always seems up for some fun.");
		//addButton(slot, "Alex", approachAlex, undefined, "Alex", "Your drinking buddy’s got a nice seat beside him, perfect for your keister.");
	}
}

public function approachAlex():void {
	if(flags["MET_ALEX"] == undefined) approachAlexTheFirstTime();
	else if(flags["FUCKED_ALEX"] == undefined && flags["LAST_MINUTE_ALEX_BACK_OUT"] == undefined && flags["ALEX_CONFESSED"] == undefined) repeatApproachAlex();
	else approachAlexAfterHavingSexOrAlmostHavingSex();
}

// -- PART 1: Intro --
// [Pretty Boy] Approach Alex. RW
public function approachAlexTheFirstTime():void {
	clearOutput();
	alexNameBustDiplay();
	author("RadicalBroseph");
	flags["MET_ALEX"] = 1;
	output("Why not? Looks like it could lead to a good time and even if not you might get to sate your curiosity at the very least. You make your way over and lean against the bar with your new companion.");
	output("\n\n<i>“Hey,”</i> he says, because that’s definitely a male voice, though even up close it’s still pretty hard to tell just by looking at him. <i>“Like what you see? Or are you just here for the conversation?”</i> The prettyboy winks, still grinning broadly and not at all subtly eyeing your assets in turn.");
	processTime(1);
	//[Flirt] [Bail]
	clearMenu();
	if(pc.lust() >= 33) addButton(0, "Flirt",flirtWithAlex, undefined, "Flirt", "A little flirting never hurt anyone, right?");
	else addDisabledButton(0, "Flirt", "Flirt", "You’re not aroused enough to consider flirting the pretty boy.");
	addButton(1, "Bail", bailOnAlex, undefined, "Bail", "Excuse yourself and leave the pretty boy.");
}

// [Flirt] RW
public function flirtWithAlex():void {
	clearOutput();
	alexNameBustDiplay();
	author("BubbleLord");
	// OLD - TO BE REMOVED
	/*output("You grin back and tell him that you’re certainly not going to complain about the view. He laughs.");
	output("\n\n<i>“Well, you’re not so bad yourself. Always had a healthy appreciation for ");
	if(pc.biggestTitSize() < 1) output("a nice, toned chest");
	else if(pc.biggestTitSize() <= 4) output("a healthy handful");
	else output("an overflowing cup");
	output(", if you know what I’m saying.”</i> The suggestive way he caresses his own chest makes it abundantly clear what, exactly, he’s saying. <i>“And of course a " + pc.mfn("strong jaw","pretty face","pretty face with a strong jaw") + " certainly doesn’t hurt.");
	//if masculine and breasts > C cup OR feminine and breasts = flat: 
	if(pc.mf("man","woman") == "man" && pc.biggestTitSize() >= 3 || pc.mf("","f") == "f" && pc.biggestTitSize() < 1) output(" Nice to see other people out there willing to mix and match too, so to speak.");
	output("”</i>");
	output("\n\nYour new friend leans in, a particularly wolfish smile on his face.");
	output("\n\n<i>“What do you say we cut to the chase and head up to my room for some fun?”</i>");
	processTime(2);
	//if taur with back mounted bits:
	if(pc.isTaur() || pc.isDrider()) 
	{
		output(" A thought seems to strike him after he says this, however, and he crouches momentarily to try to get a good look at your undercarriage. <i>“Though, uh. To be honest I’m not sure I’m exactly equipped to handle you. Sorry, but you might wanna look elsewhere.”</i> He has the graces to look apologetic about it, at least. You get the feeling you’re not getting much of anything out of this guy.");
		
		//(kick back to bar menu)
		clearMenu();
		addButton(0,"Next",mainGameMenu);
		return;
	}
	//[Yes] [No]
	clearMenu();
	if(pc.lust() < 33) {
		output("\n\nYou aren’t really turned on enough to hook up right now.");
		addDisabledButton(0,"Yes");
	}
	else addButton(0,"Yes",alexSexMenu);
	addButton(1,"No",noToAlyxSex);*/
	
	//New scene texts & choices
	output("You’re certainly not complaining; hell, you wouldn’t mind more of it. The prettyboy flutters his eyes and quickly slips one seat closer to you.");
	output("\n\n<i>“Well aren’t you a smoothtalker! Of course, I know a... few other things that are smooth.”</i> His breath and words catch in his throat, his right hand suggestively tracing its way across his tube top before worming a hand down toward your pants. <i>“Think you’d be... interested in spending a little time together, big [pc.boyGirl]?”</i>");
	output("\n\nBut his hand stops short long enough for you to see the other gently patting the bar and sweep down to the open chair beside him.");
	output("\n\n<i>“How about a few drinks? They’re on me.”</i>");
	clearMenu();
	addButton(0, "Sounds Good", goDrinkWithAlex, undefined, "Sounds Good", "You could go for some good drinks and company.");
	addButton(1, "Maybe Later", declineAlexsDrink, undefined, "Maybe Later", "Company may be nice but you’ve got things to do besides drink the time away.");
}

// [Sounds Good] Drink drink drink! RW
public function goDrinkWithAlex():void {
	clearOutput();
	alexNameBustDiplay();
	author("BubbleLord");
	output("Sure, why not? Plopping your [pc.ass] down into the chair, you have to ask; what’s on the menu for the night?");
	output("\n\n<i>“Well, I think I have some ideas. Sellesy can help us out, I think...”</i>");
	if (flags["DRANK_FROM_SELLESY"] != undefined) {
		output("\n\nCurling a finger and beckoning her closer, you think you know where this is going. You’ve had some of the tap before so it’ll be a lot of fun to share for a change.");
	}
	else {
		output("\n\nWaving over the three-breasted waitress, you’re just glad that you’re going to get to drink with someone. It’s a refreshing change from the prospect of adventure and shenanigans abroad in the stars.");
	}
	clearMenu();
	addButton(0, "Next", getDrunkWithAlex);
}

// [Maybe Later] No thanks. RW
public function declineAlexsDrink():void {
	clearOutput();
	alexNameBustDiplay();
	author("BubbleLord");
	output("You wish you had the time but you’ll have to take a raincheck. He wants those drinks to be well-spent, right?");
	output("\n\n<i>“Oh, I see!”</i> Brushing his locks carefully out of his face and winking, he gives a dismissive tilt of his head toward the open floor. <i>“Well, don’t forget you and me have a date... or at least a chance to get a little booze our systems, mmm?”</i>");
	flags["LEFT_ALEX_REASON"] = 2; // 2 indicated declined drink.
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

//[Bail]
public function bailOnAlex():void {
	clearOutput();
	alexNameBustDiplay();
	author("BubbleLord");
	//(Add “Pretty Boy” button when standing around the bar and go to repeat intro)
	output("You’re not sure if it’s him or you but you’re not feeling anything physically or otherwise. Thinking on your feet is easy enough; you’re rather busy and have to get going for your... adventures... and inheritance claiming? And you <b>really</b> need to get going, so...");
	output("\n\n<i>“Oh... okay then? I won’t stop you, big " + pc.mf("guy", "girl") + ". Good luck with those adventures and inheritance claiming... or whatever.”</i>");
	output("\n\nRolling his eyes and turning back to his drink rather unphased, you’re free to go back to your own business.");
	flags["LEFT_ALEX_REASON"] = 1; // 1 indicated bailed.
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//REPEAT INTRO (you didn’t tap that)
public function repeatApproachAlex():void {
	clearOutput();
	alexNameBustDiplay();
	author("BubbleLord");
	clearMenu();
	if (flags["ALEX_DRUNK_DATED"] != undefined && flags["ALEX_CONFESSED"] == undefined) {
		approachAlexAfterFirstDrinkDate();
		return;
	}
	//Repeat offer to drink.
	if (flags["DRANK_WITH_ALEX"] != undefined) {
		output("Not quite sitting down, you sneak your way over right behind Alex... then pat his back just hard enough to get a jump out of him.");
		output("\n\nAnd boy does he jump; the dark-skinned dude’s eyes shoot wide and he half-leaps out of his chair before looking back at you with a mix of alarm and something... sensual?");
		output("\n\n<i>“O-Oh,”</i> Alex sighs in relief and immediately sits down. <i>“You scared the hell out of me! Urgh. We sure drank a lot last time... but I didn’t mind it much.”</i>");
		output("\n\nHis lips curl into a small grin; and then his hand carefully beckons you right back to your seat from last time.");
		output("\n\n<i>“Come on... what are you so scared of?”</i>");
		addButton(0, "Sounds Good", goDrinkWithAlex, undefined, "Sounds Good", "You could go for some good drinks and company.");
		addButton(1, "Maybe Later", declineAlexsDrink, undefined, "Maybe Later", "Company may be nice but you’ve got things to do besides drink the time away.");
	}
	//If bailed.
	else if (flags["LEFT_ALEX_REASON"] == 1) {
		output("Making your way over to the bar-bound man once more, his attention turns from his drink to you.");
		output("\n\n<i>“Oh, uh, hey,”</i> he blurts while hastily putting on his best smile. <i>“What’s going on?”</i>");
		addButton(0, "Apologize", apologizeToAlex, undefined, "Apologize", "It probably wouldn’t hurt to apologize for bailing on him last time.");
		addButton(1, "Nevermind", bailOnAlexAgain, undefined, "Nevermind", "On second thought...");
	}
	//Otherwise, if declined drinks.
	else {
		output("It doesn’t take more than a few seconds of approaching before the dark-skinned prettyboy spots you. It takes only an instant for him to start circling his fingertip across the cushion beside him with a hopeful grin trying to melt into you.");
		output("\n\n<i>“So you’re back; think we can finally have that drink?”</i>");
		addButton(0, "Sounds Good", goDrinkWithAlex, undefined, "Sounds Good", "You could go for some good drinks and company.");
		addButton(1, "Maybe Later", declineAlexsDrink, undefined, "Maybe Later", "Company may be nice but you’ve got things to do besides drink the time away.");
	}
}

public function apologizeToAlex():void {
	clearOutput();
	alexNameBustDiplay();
	author("BubbleLord");
	output("You actually wanted to apologize for bailing on him. It wasn’t even a great excuse considering the thousands of better lines you could have dropped. You just figured it wasn’t a good time to talk.");
	output("\n\n<i>“No worries, I totally get it,”</i> his lips pinch into a rather understanding smile. <i>“Sometimes I come off a little too strong and sometimes I get mistaken for being a bit more... <b>girly</b> than I am, you know? Really, it’s no big deal.”</i>");
	output("\n\nWaving his hand dismissively, the brunette slips over and settles into a chair near you... but leaves the closest one open.");
	output("\n\n<i>“Think I can get you to sit and stay a while?”</i> The dusky androgyne tosses you a wink and pats the cushioned seat beside him. <i>“Drinks are on me.”</i>");
	clearMenu();
	addButton(0, "Sounds Good", goDrinkWithAlex, undefined, "Sounds Good", "You could go for some good drinks and company.");
	addButton(1, "Maybe Later", declineAlexsDrink, undefined, "Maybe Later", "Company may be nice but you’ve got things to do besides drink the time away.");
}

//[Bail Again]
public function bailOnAlexAgain():void {
	clearOutput();
	alexNameBustDiplay();
	author("BubbleLord");
	
	/*output("You’re still not really into this kind of genderfuck stuff, and ");
	if(pc.isNice()) output("try to let him down gently");
	else output("tell him so");
	output(". He looks pretty disappointed, but shrugs it off easily enough.");
	output("\n\n<i>“Suit yourself,”</i> he says, shrugging. <i>“I’ll be around if you ever change your mind, though.”</i>");*/
	output("Unfortunately, not much. You’re actually rather busy and thought he was someone else.");
	output("<i>“Oh... uh... right. No problem... I guess.”</i>");
	flags["LEFT_ALEX_REASON"] = 1;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//DRINK DRINK DRINK! RW
public function getDrunkWithAlex():void {
	clearOutput();
	alexNameBustDiplay();
	author("BubbleLord");
	if (flags["MET_SELLESY"] != undefined) {
		output("She doesn’t disappoint. You both get to start the night simple; Sellesy sitting down on the bar and leaning forward to give you both ample access to her full teats. You get your pick and your drinking buddy gets the other, both of you getting a nice hugging grip around the waitress to keep her nice and still.");
		output("\n\n<i>“That’s it,”</i> she coos while stroking and caressing the pair of you. <i>“Drink up. The tap has more than enough for Alex and his friends... I had a hunch the two of you would get along.”</i>");
	}
	else {
		output("The waitress sets herself down in front of you both rather shamelessly with her top off. You’re not quite sure what to make of it.");
		output("\n\nFrom up close her breasts appear, if anything, larger than before. They seem swollen, even; wait, didn’t you see this woman - Sellesy - duck behind the bar a moment ago?");
		output("\n\n<i>“A first-time customer... Alex always brings the best,”</i> Her right hand slips down and grabs her top, tugging it upward and exposing her trio of tits. <i>“Well now, don’t be shy. Alex can show you how to do it, can’t he?”</i>");
		output("\n\nAs if taking the hint, the brunette leans forward and latches onto one of the flanking teats before tossing you a small wink. Whether it’s peer pressure or maybe you’re curious, you follow suite and take the middle one to make sure you’re nice and close.");
		output("\n\n<i>“Oh, you’re going to enjoy that special brew,”</i> she coos as the candy-sweet milk gushes into your mouth and her hand holds you firmly to her chest. <i>“I hear only the best compliments from my customers, you know...”</i>");
		flags["MET_SELLESY"] = 1;
	}
	output("\n\nAnd boy does the night fly; it’s intoxicatingly arousing, suckling Sellesy’s teats and bringing her to orgasm. Between the milk, her cries and her gentle caress there’s little you don’t enjoy either. After the first few minutes alone the trio of you probably have a nice crowd starting to form with how Sellesy is practically exploding with orgasms. But none of that matters until in your blissful drinking you feel your drinking buddy’s hand stealing brushes along one of your inner thighs.");
	output("\n\nFighting your eyelids just to stay conscious, you finally see what Alex is up to. The prettyboy’s pants are sporting a pretty comfortable bulge... and his hand inside them brushing back and forth. It looks like he might be stroking himself but if so it can’t be that comfortable. Maybe he’s playing with his sack? Either way, it’s a good bit of exhibitionism; Alex must really be feeling good.");
	output("\n\nAnd with the milk Sellesy is pumping down your throat, you don’t blame him. Time keeps on flying by for an hour... two... and even out to three hours.");
	output("\n\nBut eventually Sellesy gently pushes the pair of you off, your bellies nice and full and her leaky teats forcing the waitress to carefully slip her palms over your hungry lips with an almost exhausted, gasp-preceded sigh.");
	output("\n\n<i>“You two really know how to make a girl feel special! I’ll be back in a second, okay?”</i>");
	output("\n\nEven if you could nod, you wouldn’t with how drunk you’ve got. Even the strongest drinkers would be blitzed after that. Alex isn’t in a much better state either considering he’s stumbling to his feet.");
	output("\n\n<i>“H-Hey - <b>hic!</b>”</i> Alex’s hiccup sends him stumbling right into you, both of his hands thumping down on your abdomen. <i>“You uh - <b>hic!</b> - feel like going up to - <b>hic!</b> - my room? We can - <b>hic!</b> - sleep this buzz off, maybe - <b>hic!</b> - have some fun too! Come on! It’ll be <b>loads</b> of - <b>hic!</b> -... fun! I said that already - <b>hic!</b> - right?”</i>");
	flags["DRANK_WITH_ALEX"] == undefined ? flags["DRANK_WITH_ALEX"] = 1 : flags["DRANK_WITH_ALEX"]++;
	flags["LEFT_ALEX_REASON"] = 0;
	pc.imbibeAlcohol(30);
	pc.changeLust(30);
	clearMenu();
	addButton(0, "His Place", stayAtAlexsPlace, undefined, "His Place", "Well, if he’s offering a place to stay...");
	addButton(1, "Stay w/ Sel", stayWithSellesyFromDrunkenAlexStupor, undefined, "Stay with Sellesy", "You’ve got everything you need for now; Sellesy can take care of you.");
	addButton(2, "Head Home", headBackHomeFromDrunkenAlexStupor, undefined, "Head Home", "You’ve had a bit more to drink than you’d like to admit; you’re going to turn back in and call it a night on your ship.");
}

public function stayAtAlexsPlace():void {
	clearOutput();
	alexNameBustDiplay();
	author("BubbleLord");
	output("Standing - though it’s honestly more like leaping since you briefly lift up off the ground - up and carefully grabbing hold of one of those nice shoulders, you wait for Sellesy to come back. The androgynous lad quickly pays after a few swipes of his card between her rack.");
	output("\n\nThe trip up the stairs is a long, painful blur but eventually the pair of you pass through the doors. Normally his room wouldn’t be too grand - which isn’t hard to believe with how shabby the board hall is - but in your drunken stupor it might as well be the biggest fucking mansion in the land. The bed is big enough for a king as far as you’re concerned, pulling free of Alex and collapsing into it.");
	output("\n\nAnd passing out...");
	clearMenu();
	addButton(0, "Next", stayAtAlexsPlaceP2);
}
public function stayAtAlexsPlaceP2():void {
	clearOutput();
	alexNameBustDiplay();
	author("BubbleLord");
	output("The humming buzz of an alarm eventually wakes you, propping yourself up quickly and looking around for Alex. All you find is a note alongside some of your equipment.");
	output("\n\n<i>“Hey there. I went through some of your things so I could learn your name... my bad on that. I guess we drank a little too much, huh? Don’t worry, we didn’t do anything and I didn’t do anything to you. I’m heading down to the bar to catch a meal or a drink, maybe watch some funny videos. \n\nAnyway, catch you later. - A.”</i>");
	output("\n\nWell, that explains that. After sharing a drink with the guy it’s not like you’re random strangers at least. Making your way out his room - the door humming locked behind you - and down the stairs, you can see he’s definitely at his normal spot at the bar. He actually seems to be checking a small tablet-like device; maybe some version of your codex?");
	flags["ALEX_DRUNK_DATED"] = 1; //Advancement made!
	processTime(60 * 2);
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function stayWithSellesyFromDrunkenAlexStupor():void {
	clearOutput();
	alexNameBustDiplay();
	author("BubbleLord");
	output("That sounds <b>really</b> nice but you think you know a special gal who can take really good care of you. Sellesy eventually makes her way over and Alex quickly pays for the drinks before closing in and giving you a perhaps too obvious wink.");
	output("\n\n<i>“Good luck - <b>hic!</b> - killer; make sure you - <b>hic!</b> - treat her right!”</i>");
	output("\n\nOh, you’re gonna! You and her are going to have the <b>bestest</b> night!");
	output("\n\nWhile Alex stumbles away, you sink into Sellesy with a pleased and needy nuzzling. The three-breasted waitress bites her lower lip and gently embraces you. She’s so warm and confident, radiating in the chance to hold you nice and close.");
	output("\n\n<i>“I’m glad you stuck around... maybe we can get you some more ‘drinks’ back up at my place... free of charge for such a good [pc.boyGirl], mm?”</i>");
	//This will lead to Sellesy stay-with scene and then sex.
	clearMenu();
	addButton(0, "Next", stayWithSellesy);
}

public function headBackHomeFromDrunkenAlexStupor():void {
	clearOutput();
	alexNameBustDiplay();
	author("BubbleLord");
	output("“Oh - <b>hic!</b> - alright! Swing by later, you... you uh... <b>hic!</b>.. uh... <i>you</i>.”");
	output("\n\nPft. Alex is drunk. But you’re both drinking buddies and probably not in too much better a state. Waiting for him to handle the payment and waving goodbye to your busty waitress, you stumble to your feet and set off. Hopefully you can make it back to your ship before you pass out!");
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

// -- PART 2: Confession --
//Happens after meeting Alex after having a drunken date.
public function approachAlexAfterFirstDrinkDate():void {
	clearOutput();
	alexNameBustDiplay();
	author("BubbleLord");
	output("Quickly joining Alex at the bar and taking your seat, you pick the best option to get his attention; you pat the bar and then get ready to wave to him. The only problem is that he practically jumps out of his skin and slams his tablet against the countertop instead of just look your way like someone normally might.");
	output("\n\n<i>“O-Oh! Hey [pc.name]! I uh... what’s up,”</i> his hand hesitantly reaches out as if to shake with you. <i>“I uh... er...”</i>");
	output("\n\nHe doesn’t give you any time to grab his hand despite offering it; he tucks it back down into his pockets and flushes red for a moment.");
	output("\n\n<i>“Sorry. I just don’t really know how to talk with you. I left you that note and... it didn’t really occur to me until later exactly <b>who</b> you are. Can’t believe I spent the night with someone so famous and we didn’t even do anything.”</i>");	
	clearMenu();
	// [No Big Deal] [Play It Up] - Choices, choices... hmmmmm
	addButton(0,"No Big Deal", itsNoBigDealReallyAlex, undefined, "No Big Deal", "You’re nothing special compared to the mega-corp spawning dynamo your dad was.\n\nOh come on, you can’t turn away the chance to mess with him. " + (silly ? "After all, you ARE the hype!" : ""));
	addButton(1,"Play It Up", letsPlayItUpAlex, undefined, "Play It Up", (silly ? "YOU ARE THE HYPE!" : "Might as well have a bit of fun if he thinks you’re so important.") + "\n\nNo reason to tease him; better to be kind and just tell him the truth.");
}

public function itsNoBigDealReallyAlex():void {
	clearOutput();
	alexNameBustDiplay();
	author("BubbleLord");
	output("While you appreciate the thought, you’re far from some massive famous star; you’re just a regular everyday " + pc.mf("Joe", "Jane") + " as far as the Steele name goes. That might change later on in your life but as far as the two of you are concerned you’d prefer Alex treat you the same as he would anyone else. And it catches him a bit off-guard; he actually scratches at his head for a few seconds before finally flashing a smile at you and leaning in almost too closely to you.");
	output("\n\n<i>“Oh yeah? Well then, I’ll hold you to that. But we have something bigger to talk about first.”</i>");
	clearMenu();
	addButton(0, "Next", confessionOfAlexTheMherm, 1);
}

public function letsPlayItUpAlex():void {
	clearOutput();
	alexNameBustDiplay();
	author("BubbleLord");
	output("Oh, so he’s heard of you? The next true star to grace this part of the stars? How you’re going to tear apart the legacy of your old man and use it to feed the fires of your ambition? Alex does you a disservice not bowing his head and being thankful for every minute you’re together; you could be spending it doing something else more important.");
	output("\n\n<i>“Er,”</i> his brow cocks a bit uncomfortably for a few silent moments, watching your smile as if trying to find the words.");
	output("\n\n<i>“Right... well if that’s how you feel I guess... you can always choose <b>not</b> to swing around if you’d prefer being uncool. Here I thought you were famous... maybe you’re just famous for being an asshole.”</i>");
	clearMenu();
	addButton(0, "Next", confessionOfAlexTheMherm, 2);
}

//Alex's Confessions.
public function confessionOfAlexTheMherm(choice:int):void { //Choices: 1 - No Big Deal, 2 - Play It Up
	clearOutput();
	alexNameBustDiplay();
	author("BubbleLord");
	output("Furrowing his brows and brushing his hair out of the way so you can see both of his eyes, Alex sits up straight and offers you the tablet he had been looking at.");
	output("\n\n<i>“" + (choice == 1 ? "Please take a look... it’s definitely not porn" : "Here </i>your majesty<i>; look") + ".”</i>");
	output("\n\nTaking the offered tablet" + (pc.isAss() ? " with a grumble" : "") + " and turning it over, you play along for now; it won’t hurt to at least take a glance, right? The tablet itself is rather basic and plain... but not the information it displays; an account balance of nearly a couple hundred thousand credits.");
	output("\n\nBut before you can " + (pc.isAss() ? "try to find a way to steal it" : "even blink") + ", it gets snatched right back. Alex quickly tucks it between his thighs as one of the waitresses passes by and throwing an innocent smile her way to ensure she was out of earshot. As soon as he’s positive you’re both away from prying ears, your androgynous company crooks his arm and rests his head in his palm to simply stare at you.");
	output("\n\n<i>“I can relate... to a lot of what you got going on being someone important. I don’t stay in this place because it’s nice, I assure you.”</i>");
	output("\n\nAlex runs his free hand down his hips and carefully turns in his chair, letting you see his shapely rear. But it’s not until he grabs the band of his pants and pulls it away from his back that you see a tattoo. The gold logo of Aegis Shipyards.");
	output("\n\n<i>“I’m part of... corporate? Maybe you could call me management but,”</i> he spins back around before twirling his hand over and then outward in a polite bow-like swing. <i>“You’re looking at the future head of operations for Aegis Shipyards in this part of the stars.”</i>");
	output("\n\nWait really? What’s he doing in a place like Anon’s if he’s so important? Alex thinks on it for a few moments but eventually finds words; only he doesn’t give them right away. Instead he lifts his head from his hand, leans back and throws his arms over the backside of his char.");
	output("\n\n<i>“Because... we don’t have a proper shipyard to start producing and working out of. So I’m trying to pass the time; only corporate isn’t interested in rushing anything. You’re looking at one of the few people in all of this grand new section of premium space who actually has a job but can’t work!”</i>");
	output("\n\nAlex watches you as if to wonder what you might say but he doesn’t wait for a reply. Instead, he reaches over and pats your thigh.");
	output("\n\n<i>“Which brings us to you; I think I owe you some answers... so... I found out about you and then told you about me. We still have one last surprise for you. I know I’m just the coolest guy around but I’m not like most guys.”</i>");
	output("\n\nThis time Alex’s hand moves to his own thigh, carefully patting and brushing it up toward the small bulge of his trousers.");
	output("\n\n<i>“I’ve got both parts down here; a dick and a cunt, to put it bluntly. I’m definitely a guy - if the fact I’m not rocking giant tits like most herms might - but why should I limit myself to just doing the plowing when I can let some hot girl or guy plow me in a pussy built for taking them? The company is at least holding me up so if I’m going to be stuck on this station, I need to at least have fun. So... that’s where you come in.”</i>");
	output("\n\nApart from being told Alex has a cunt, you’re still trying to process everything. Why do you come in for his fun, exactly? It sounds like he’s not even trying to give you a choice in all of this.");
	output("\n\n<i>“Of course I’m giving you a choice!”</i> Alex pouts and rolls his eyes, sitting up and carefully leaning over the counter with a sigh. <i>“If you’re not going to be weird about me having more parts than your average guy, then it’s fine if we only hang around with each other. Drinking with you is fun! If you want to be more - maybe fuckbuddies - then I’m also game. Things are just so boring, yeah?”</i>");
	output("\n\nAlex leans in just a bit closer to you and parts his thighs just enough so you can see a wet spot between his thighs.");
	output("\n\n<i>“Besides, I showed you... you owe me the chance. Or at least the chance to throw my credits away, don’t you think?”</i>");
	flags["ALEX_CONFESSED"] = 1;
	clearMenu();
	alexsInteractMenu();
}

//REPEAT INTRO (You tapped that (or bailed at the last minute)) - TO BE REVISITED 9999
public function approachAlexAfterHavingSexOrAlmostHavingSex():void {
	clearOutput();
	alexNameBustDiplay();
	author("BubbleLord");
	output("Taking your spot next to Alex and tapping the counter to get his attention is enough to get a small jump out of the maleherm but not enough to get him spooked like the very first time. Alex looks at you with a scowl for a moment though as if he’s trying to choose between getting angry or being happy you dropped by to give him something to do for the day.");
	output("\n\n<i>“Alright Steele, alright,”</i> his hand thumps the tablet down and over before leaning in and smirking at you. <i>“What’s going on with my " + (flags["FUCKED_ALEX"] != undefined ? "favorite fuck" : "drinking ") + "buddy? Looking to have some fun, I bet!”</i>");
	alexsInteractMenu();
}

// -- PART 3: (Fuck)Buddy Stage --
public function alexsInteractMenu():void {
	clearMenu();
	addButton(0, "Appearance", alexsAppearance, undefined, "Appearance", "Give Alex a good once-over.");
	addButton(1, "Talk", alexTalkMenu, true, "Talk", "You’d actually like to chat a little bit if he doesn’t mind.");
	if (pc.lust() < 33) addDisabledButton(2, "Sex", "Sex", "You are not aroused enough to consider having some steamy times with the maleherm.");
	else if (pc.isTaur() || pc.isDrider()) addDisabledButton(2, "Sex", "Sex", "You should come back and ask him when you’ve got two legs instead.");
	else addButton(2, "Sex", alexSexMenu, undefined, "Sex", "You’d like to take him up on that fuckbuddy status he mentioned...");
	addButton(3, "Drink", goDrinkWithAlexPostConfession, undefined, "Drink", "You know he’ll buy so it’s time to get shitfaced!");
	addButton(14, "Leave", mainGameMenu);
}

//[Appearance] - Alex's Appearance 2.0, quite the handsome maleherm!
public function alexsAppearance():void {
	clearOutput();
	alexNameBustDiplay();
	author("BubbleLord");
	output("Five feet and eleven inches of androgyny, Alex is an ideal definition of a pretty boy. Smooth, creamy chocolate-colored skin and just enough muscle tone catches every bit of light just right to help accent the masculine touches of his body.");
	output("\n\nHis attire isn’t anything too fancy though; a simple cropped top hugs his flat muscled chest and baggy pants hug his flared hips and narrow waist with just enough bagginess to let you see the top of his black pubic hair. His close-cropped hair hides a bit of his face but does little to diminish his near-flawless and trained smile whenever you look his way. He even has a pair of black slip-on sandals, ensuring he can transition to barefoot or vice versa in a moment’s notice.");
	output("\n\nBut even with the masculine touches to soften the effeminate curve of his jaw and the lack of additional body hair you know he’s not like every other guy. ");
	output(flags["FUCKED_ALEX"] != undefined ? "He’s packing seven inches of manhood and a tight pussy that can squeeze you just right." : "Alex has both a dick and a cunt, making him a hermaphrodite but distinctly a maleherm!");
	alexsInteractMenu();
	addDisabledButton(0, "Appearance", "Appearance", "You’re already examining Alex’s appearance.");
}

//[Talk] - Alex's Talkies 2.0
public function alexTalkMenu(newScreen:Boolean):void {
	if (newScreen) {
		clearOutput();
		alexNameBustDiplay();
		author("BubbleLord");
		output("<i>“Alright then,”</i> he pauses and seems to contemplate ordering one of the waitresses over for a drink but instead waves his hand dismissively in front of his face. <i>“Just don’t ask anything too boring, alright?”</i>");
	}
	clearMenu();
	addButton(0, "Him", askAlexAboutHim, undefined, "Him", "You want to know more about Alex.");
	addButton(1, "Aegis", askAlexAboutAegis, undefined, "Aegis", "What can Alex tell you about Aegis, sales pitch or otherwise?");
	addButton(14, "Back", alexsInteractMenu);
}

//[Him] RW
public function askAlexAboutHim():void {
	clearOutput();
	alexNameBustDiplay();
	author("BubbleLord");
	output("<i>“About me, huh?”</i>");
	output("\n\nAlex’s eyes show his contemplation better than his body language does, his fingers curling in close before he settles his fist against the bottom of his chin and tucks the other arm beneath it to hold himself up.");
	output("\n\n<i>“Well... I’m a salesman first and foremost. They don’t just make smiles like mine without tons of practice, you know?”</i> He flashes the very same smile your way to emphasize his point. <i>“But more specifically, I was the best. Aegis picked me to take on the task of managing sales out here... until about my second day on the station anyway.”</i>");
	output("\n\nAlex lets his hand lower and instead turns his attention toward the counter and one of the waitresses.");
	output("\n\n<i>“The original manager decided they liked their desk job more and they picked the next best person. I can’t imagine how many of those egg heads were angry about hiring someone from the work floor but they’ll have to live with it. I always wanted to get out and explore though. That’s why I’ve been saving my money by living in a place like this.”</i>");
	output("\n\nSo he’s frugal and actually enjoys his job?");
	output("\n\n<i>“I never said that,”</i> he snaps - almost bordering on anger - but hastily buries it with an instinctual flash of his stunning smile. <i>“I just... well, who wouldn’t want to spend their best years travelling to hardly-explored space and meeting all sorts of interesting characters like you, [pc.name]?”</i>");
	output("\n\nAlex reaches over and gently pats your shoulder.");
	output("\n\n<i>“If I can meet a Steele then there really is no telling what sort of fun and sex I can have out here, yeah?”</i>");
	flags["ALEX_TALKED_ABOUT_HIMSELF"] = 1;
	alexTalkMenu(false);
	addDisabledButton(0, "Him", "Him", "You just recently asked about this.");
}

//[Aegis] RW
public function askAlexAboutAegis():void {
	clearOutput();
	alexNameBustDiplay();
	author("BubbleLord");
	output("<i>“Definitely not the sales pitch but... Aegis sells pretty much everything when you really get down to it. I actually really like that about it.”</i>");
	output("\n\nAlex slips his hand back and gives himself a soft spank and winks at you.");
	output("\n\n<i>“Enough to give myself this tattoo, at least.”</i>");
	output("\n\nAegis sells a lot huh? You’ve heard they had a big catalog but that’s not very different from most companies and corporations. What makes Aegis so special to make them stand out and grow so much? Your questions need answers!");
	output("\n\n<i>“For starters, it’s mainly quality,”</i> Alex raises a finger and then immediately a second. <i>“Secondly, it’s service. Aegis might not make the toughest ships but we have a reputation for having some of the best service around and a high quality mark. Yachts and exploration ships are really popular... though the latter is more often sold to rich upstarts.”</i>");
	output("\n\nGrabbing his tablet and hefting it up, his smile fades in an act of unusually somberness from your drinking buddy.");
	output("\n\n<i>“Of course, the things we package on our yachts are also just as popular; protection equipment for example. People love to joke that we use the armor meant for our ships on all of that stuff instead... but the truth is that it’s just easier to make things like our lightning dusters than a warship. And when you’re looking for a luxury ship, you’re <b>definitely</b> not looking for protection. Let one of the other lugs worry about all that. "); 
	output("Aegis Shipyards can just give you some solid guns and armor to keep you safe when those nasty pirates board you to try and get the goods aboard your ship instead. Blowing you up isn’t really an option if they don’t get their loot, right?”</i>");
	flags["ALEX_TALKED_ABOUT_AEGIS"] = 1;
	alexTalkMenu(false);
	addDisabledButton(1, "Aegis", "Aegis", "You just recently asked about this.");
}

//[Drink] RW
public function goDrinkWithAlexPostConfession():void {
	clearOutput();
	alexNameBustDiplay();
	author("BubbleLord");
	output("<i>“Oh you wanna party, huh? Alright!”</i> Alex pokes the back of your closest hand, leaning in close. <i>“We’re going to get fucking wasted!”</i>");
	output("\n\nThat’s what you’re hoping for! How else will you really milk his good will and let loose from your adventures around the stars? Alex crooks a finger and beckons Sellesy on over.");
	output("\n\nShe doesn’t disappoint, just like that first time the two of you indulged in your drinking fun. You both get to start the night simple; Sellesy settles down on the bar, crosses her legs and leans forward to give you both ample access to her full, dripping teats. You grab first dibs on one teat and give Alex the pick of his own, the two of you leaning in and squeezing your arms snugly around the busty tap-girl.");
	output("\n\n<i>“That’s it,”</i> Sellesy coos while stroking your heads and brushing her fingertips along your cheeks. <i>“Just like last time, huh? The two of you just drink as much as you want.”</i>");
	output("\n\nThe hours start slipping away, losing yourself to lust and the filling, fuzzy warmth of tit-brew. Sellesy leans into the pair of you every once in a while and exchanges your lips between one and two teats the whole while. Your barista’s experience isn’t muddled in her own, lip-biting arousal either; Alex’s bulge is particularly throbbing from well-aimed sways of her thighs and legs around your groins. If it wasn’t for the bubbly mixed drinks lulling you both toward sleep, she’d likely be able to get you both naked in a flash.");
	output("\n\nAlex’s hands squeeze on the waitress’s meaty hips and his face further vanishes into her motherly breasts. Sellesy’s eyes widen and the pair of them tumble onto the bar, Alex pinning her down and suckling like a needy child and leaving you without your stream of delicious milk.");
	output("\n\n<i>“Mmf... seems one of my favorite customers is r-really enjoying himself!”</i> The alien girl’s face reddens, wrapping an arm around Alex’s head and looking over sideways at you just as your senses come back. And without skipping a beat, her lips twist into a grin and Sellesy’s free hand grabs one of the hefty orbs and gives you a teasing jiggle.");
	output("\n\n<i>“Better get your fill before he tries to run me empty, [pc.name].”</i> Her fingertips squeeze just enough to draw a bead of alcoholic delight. <i>“Run this tap as dry as you can, big [pc.boyGirl].”</i>");
	output("\n\nYou’re not quite sure but you’ve got a nagging feeling that maybe you should get out of here if you’re not looking to get so drunk you do something you might regret...");
	flags["DRANK_WITH_ALEX"] == undefined ? flags["DRANK_WITH_ALEX"] = 1 : flags["DRANK_WITH_ALEX"]++;
	pc.imbibeAlcohol(40);
	pc.changeLust(30);
	clearMenu();
	addButton(0, "Bail", bailOnAlexDrinks, undefined, "Bail", "Nope. You’re done. You’ve drank too much.");
	addButton(1, "Keep Drinking", getTotallySmashedWithAlex, undefined, "Keep Drinking", "Fuck it; you’re here to get hammered and you’re going to get totally wasted.");
}

public function bailOnAlexDrinks():void {
	clearOutput();
	alexNameBustDiplay();
	author("BubbleLord");
	output("<i>“Suit yourself!”</i> Sellesy giggles, pulling Alex tighter to her chest. You stumble away with a bunch of free drink... and then fall face first into the floor, blacking out.");
	output("\n\nThankfully not for long though; when you wake, you’re back in Alex’s room. It reeks of sex in here but you’re clean; maybe you missed out on something really fun. Stepping outside and back to the floor, you spot the pair of them going about their business... and surprisingly sobered up. Just how long were you out?");
	processTime(60 + rand(60));
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function getTotallySmashedWithAlex():void {
	clearOutput();
	alexNameBustDiplay();
	author("BubbleLord");
	output("Grabbing Alex drunkenly by his collar, you heft him and your three-legged hostess from the bar and take the lead. All of you are going to need more privacy than this bar grants if you’re going to get blackout drunk.");
	output("\n\nThe trio of you don’t make it very far on your guidance however; Sellesy ends up taking the lead and pulling the dusky hunk and you by the wrists to his familiar hideout. " + (flags["ALEX_DRUNK_SEX"] == undefined ? "To your surprise, she uses a key of her own to open the door; just how often does Alex indulge himself in drinking from Sellesy? " : " ")); 
	output("When the door opens, her red arms tug you to her teats once more. That warm, fuzzy feeling really sinks in more and more until all three of you are stumbling toward the bed. But before either you or Sellesy can get on, Alex pulls free and turns to face the pair of you with a smirk.");
	output("\n\n<i>“H-Hic! I-If we’re using my room then you two can help a guy out, huh?”</i> The maleherm fumbles with his belt, eyeing you up in particular. <i>“" + (flags["FUCKED_ALEX"] != undefined ? "Y-You look like you got... a p-purty mouth... c-come on! H-Hic!" : "Don’t worry, I got somethin’ jus- hic! - for you!") + "”</i>");
	output("\n\nAlex’s cock flops out in-sync with him flopping back onto the bed, running his right hand up his abs and crooking a finger at the two of you. Sellesy rolls her eyes but gently pulls you free of her alcoholic mammary and helps you down to the ground. Your head is too fuzzy to make sense of anything; Alex’s cock flops down between your eyes, smearing a strand of pre-cum across your right brow. ");
	output("Sitting on the bed with the modest pecker obscuring your vision and his manliness cloudying up your sense of smell, Alex doesn’t feel much like a maleherm. At least, until Sellesy’s hand on your head gently pushes your face into Alex’s soft nutsack. The weight of his cock resting over your face, the sensation of his balls on your nose and the slick girlnectar of his pussy all hit you like a train and instinct kicks in.");
	output("\n\nYour tongue lulls out, pushing flat into his salty sack while the tip dances lazily across his clit. Alex’s laugh cuts out with more glee than it should -- including a girly giggle -- before he falls back on the bed, caressing the top of your head in one hand before wrapping his legs around you to keep you there.");
	output("\n\n<i>“Fuck yeeeeeah, that’s it [pc.name]! Eat me out and I’ll dump a fat load all over that face!”</i>");
	output("\n\nThe buzzing in your head makes it hard to hear Alex but Sellesy’s hands running down your back and grabbing your ass firmly forces you to drunkenly shift in your cock-pressed vice to look over your shoulder at her. " + (pc.isCrotchGarbed() ? "Sellesy is stripping you as best she can" : "Sellesy ceremoniously is licking her way down your back") + ", slowly making her way down to the floor and laying down to get a nice look at your pucker. "); 
	output(pc.hasCock() ? "Her right hand grabs a firm hold on your pecker, squeezing down and pulling it closer to give you a good rimjob for your oral treatment." : "She squeezes your hips in her hands and leans into you, eating your ass out with a smirk.");
	output("\n\n<i>“You two look so cute; might as well make you cum since you’re being such a good friend for Alex.”</i> Her voice muffles up from your butt but Sellesy doesn’t keep spouting and instead doubles down into your backside.");
	output("\n\nOne in front and one in the back, all the alcohol in you is making it hard to think. Alex’s grip doesn’t let you back off or really catch a fresh breath of air but all that booze is telling you it’s fine if you live on his nutsack. Your tongue droops free only a few seconds later however - Alex guides your mouth along the shaft of his prick until your parted lips lazily wrap over the tip. And in one fell swoop, Alex... unceremoniously pops a load down your gullet. The warm seed tastes good after all that drinking but it’s only helping lull you into being compliant. ");
	output("\n\nYour body tenses from all of the assplay and wracks itself in a fierce orgasm only seconds later. Sellesy pulls free" + (pc.hasCock() ? " and strokes you of every drop of seed you have" : "") + "," + (pc.hasVagina() ? " watching your pussy squirt" : "") + " and digs one of her fingers into your backside to really work every drop of climaxing out of you. The red-skinned girl coos in amusement but you miss what she’s saying; face-pressed into Alex’s crotch, you pass out.");	
	pc.imbibeAlcohol(20);
	pc.loadInMouth();
	pc.orgasm();
	processTime(20 + rand(20));
	if (flags["ALEX_DRUNK_SEX"] == undefined) flags["ALEX_DRUNK_SEX"] = 0;
	flags["ALEX_DRUNK_SEX"]++;
	clearMenu();
	addButton(0, "Next", getTotallySmashedWithAlexEndResults);
}
public function getTotallySmashedWithAlexEndResults():void {
	clearOutput();
	alexNameBustDiplay();
	author("BubbleLord");
	output("Opening your eyes, you quickly gasp for air; no cock hinders you but your body feels more than heavy from your drinking. Alex and Sellesy aren’t here but your things are. It takes no time at all to get yourself presentable and stumble your way to your feet, still tasting Alex’s quick-shot load on your tongue and lips as if it was still buried to the base in your gullet.");
	output("\n\nOutside of the apartment you spot both of them down at the bar as usual. Maybe next time you should be careful of how much you drink.");
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

//[Sex] FUCKING FINALLY! Go directly to Sex. Do not pass go, do not collect 200 credits. RW
//Currently only for bipedals.
public function alexSexMenu(display:Boolean = true):void {
	if(display) 
	{
		clearOutput();
		alexNameBustDiplay();
		author("BubbleLord");
		output("<i>“Oh is that so,”</i> Alex’s grin lights up and his hand fishes into his pocket, quickly offering you the keycard for his room. <i>“Then who am I to refuse a Steele? Head on up while I get my tab closed out for now. Don’t wait up too long either, yeah?”</i>");
		output("\n\nOh, you won’t; getting up and taking the key, you head up the stairs to the board hall and move to Alex’s room. Not like you can forget it after that first night of drinking! A gentle swipe later and the door slips open and you enter. Nothing new to look at though; the only thing you’re going to need is the bed anyway. You " + (pc.isCrotchGarbed() ? "strip" : "do some stretching") + " before making your way over to the bed just in time to hear the door swish open. Alex wastes no time entering and letting it slide shut, whistling appreciatively as he looks you up and down.");
		output("\n\n<i>“Now <b>that</b>,”</i> Alex’s hand sweps out and traces the shape of your body from afar, <i>“That is what I was talking about!”</i>");
		output("\n\nSlipping over and looking down at your crotch, "); 
		if (pc.hasCock()) output("reaching out and coming just short of touching " + (pc.cockTotal() > 1 ? "one of your shafts" : "your shaft")); 
		else output("Alex quickly peeks around the side of you at your nice rump");
		output(" before giving you an admiring wink.");
		output("\n\n<i>“Not bad at all! I have to say I’m excited... and I do mean excited.”</i>");
		output("\n\nAlex’s hands reach up and grab his top, peeling it over and off before tossing it aside. He steps just that extra bit closer so the two of your are chest-to-[pc.chest], pushing your lips together. The maleherm melts into you and you oblige him by wrapping your arms around him while his hand slip over your shoulders, carrying the two of you over onto the bed and making it squeak rather awkwardly. But Alex doesn’t break the kiss until you’re both red-faced and your tongues are sharing a nice strand of saliva. The bulge of his pants reminds you he isn’t undressed yet.");
		output("\n\nYou’re going to fix that.");
		output("\n\nSliding your hand down his strong back and pulling his pants down, you smack his lovely ass just beneath his tattoo to let him know they’re coming off. Alex whimpers in need and rests his head over your shoulder so you can tug them down and off. All seven inches of his dick sit rock-hard hard between your thighs, your hand tracing between his legs and feeling all the sticky wetness of his cunt before brushing along his golfball-sized testes. But eventually they’re off and tossed away from the pair of you.");
		output("\n\n<i>“Heh... sorry,”</i> he whispers in your ear before pushing up and sitting so that the two of your dicks are brushing together. <i>“I get so wet when I want to cum my brains out that I forget clothes get in the way. So how do you want to do this... or rather do <b>me</b>?”</i>");
	}
	//[Pitch Vaginal] [Catch] [Frottage] [Bail Once More]
	//Pitch Vaginal is available to all dickhavers as long as their dicks are between their front set of legs.
	//Catch is available to everyone. Cunthavers get a menu for selecting which hole.
	
	clearMenu();
	//[Pitch Vaginal]
	//(Available to all dickhavers)
	if(pc.lust() >= 33)
	{
		if(pc.hasCock())
		{
			if (pc.isBiped() && pc.cockThatFits(200) >= 0) addButton(0, "Pitch Vaginal", pitchIntoAlexsBoyPussy, undefined, "Pitch Vaginal", "Pound Alex’s " + (silly ? "ACTUAL BOYPUSSY" : "pussy") + " with everything you got.");
			else if (pc.cockThatFits(200) < 0) addDisabledButton(0, "Pitch Vaginal", "Pitch Vaginal", "None of your dicks can fit into the maleherm’s pussy!");
			else addDisabledButton(0, "Pitch Vaginal", "Pitch Vaginal", "You should come back and ask him when you’ve got two legs instead.");
			//Frottage remains available even to goos and nagas, legacy support.
			addButton(2, "Frottage", frottageWithAlex, undefined, "Frottage", "Rub your dicks together." + (silly ? " Come on, it’s only gay if the balls touch." : ""));
		}
		else {
			addDisabledButton(0, "Pitch Vaginal", "Pitch Vaginal", "Gotta have a dick to give the maleherm a good pounding.");
			addDisabledButton(2, "Frottage", "Frottage", "Obviously, you will need to have a penis for a good frotting session.");
		}
		if (pc.isBiped()) addButton(1, "Catch", catchAlexsCockSelect, undefined, "Catch", "How about Alex fucks you instead?");
		else addDisabledButton(1, "Catch", "Catch", "You should come back and ask him when you’ve got two legs instead.");
	}
	addButton(14, "Leave", bailOutOnAlex);
	//Aside: BUT WHAT DO DICK SIZES MEAN TO ALEX?
	//That’s a good fucking question. This kind of game makes all sense of scale kind of fly out the window for me a bit so I’m not really sure. Call small dicks anything five inches or shorter unless they’re super thick, medium anything from six inches to a foot long, and big anything bigger than that. HUGE is probably something equivalent to being triple- or quadruple-fisted or something? I’d give you numbers but I don’t remember the cockarea equations offhand ever since we stopped assuming dicks were box-shaped, and also don’t want to have to do extensive dick math.

	//I don’t know when he stops being able to fit your dicks inside of him. I tried figuring out how big the pelvis is but then I remembered that no you can totally fit stuff bigger than an infant inside you back in CoC without worrying about your pubic symphysis even if you’ve got no hips so who knows. I leave it up to someone better at hyper than me.
}

public function catchAlexsCockSelect():void {
	clearOutput();
	author("BubbleLord");
	alexNameBustDiplay(true);
	output("Smiling and shoving Alex to his back comes first though; you really want to make sure the salesman gets to pick only the best you can offer. Of course that means you want him to pound you like he pounds away his drinks; hard and messy. Alex doesn’t need any orders to get your intent either, slapping your [pc.ass] before groping it approvingly. His other hand - equally soft to the touch but firm on the grip - moves to playfully molest your [pc.chest].");
	output("\n\n<i>“" + (pc.hasVagina() ? "Back or front" : "In your ass it is") + ",”</i> Alex hisses through his smirking, toothy grin while running his thumb along the curve of your derierre. <i>“You’re getting fucked.”</i>");
	output("\n\nThat was definitely the plan you had in mind.");
	// [Catch Vaginal] [Catch Anal]
	//Catch Vaginal is available to all vagina havers as long as their pussies are between their front set of legs. No taurs allowed!
	//Catch Anal is fun for everyone.
	clearMenu();
	if (pc.hasVagina()) {
		addButton(0, "Catch Anal", catchAnalFromAlex, undefined, "Catch Anal", "Ask Alex to plow your ass.");
		addButton(1, "Catch Vaginal", catchVaginalFromAlex, undefined, "Catch Vaginal", "Let Alex fuck you" + (silly ? " RIGHT IN THE PUSSY!" : "r cunt") + " with that pecker of his.");
	}
	else {
		addButton(0, "Next", catchAnalFromAlex);
	}
}

//[Pitch Vaginal] RW
//(Available to all dickhavers)
//TODO: Integrate dick virginity loss.
public function pitchIntoAlexsBoyPussy():void {
	clearOutput();
	author("BubbleLord");
	alexNameBustDiplay(true);
	output("Gently pushing Alex away, your slide your hand between his thighs and carefully hook two of your fingers right against his slick, eager folds. All you want is to paint his womb in your [pc.cum] and to do that Alex needs to be on his hands and knees. Your order and touch alone elicits a fine reaction from the dusky brunette before Alex is grabbing " + (pc.cockTotal() > 1 ? "one of your cocks" : "your dick") + ", tenderly stroking from tip to base of its length.");
	output("\n\n" + (flags["FUCKED_ALEX_VAGINALLY"] == undefined ? "<i>“Don’t even think you’re going to knock me up,”</i> he whispers to you with a slow slip of his thumb over your urethra slit. <i>“I’m down to fuck but not down to be someone’s mother. At least not when we’re keeping it casual.”</i>" : "<i>“Oh does my important fuckbuddy want to put it in my pussy,”</i> Alex chuckles between caressing the end of your shaft. <i>“I suppose I should oblige you, mm? Not like you’re going to be knocking me up.”</i>"));
	output("\n\nCarefully untangling from you, Alex slips over onto the bed beside you and settles onto his knees. The hand on your shaft keeps a firm hold on you the entire time, too; eventually you’re freed however, Alex fluffing up a pillow and shifting into it to get nice and comfy.");
	output("\n\n<i>“Alright now listen,”</i> Alex bites his bottom lip and coaxes you up and behind him like someone pulling a leash. <i>“");
	if (pc.smallestCockLength() < 6) { //Small dick
		output("You’re not that big but I’m counting on you to prove them all wrong about little peckers! ");
	}
	else if (pc.smallestCockLength() < 12) { //Medium dick
		output("A nice dick like this needs to really fuck me silly or I might not squeeze it tight enough, understand? ");
	}
	else if (pc.smallestCockLength() < 20) { //Large dick
		output("As big as you are, all I need you to do is pound my pussy like it’s an onahole. ");
	}
	else { //HUGE dick
		output("It’s going to be a miracle if I fit you, you know that? But man... it’s going to feel like heaven! ");
	}
	output("So soldier up and fuck my brains out, Steele!”</i>");
	output("\n\nThe bossy bottom releases you, tucks his arms under the pillow and starts plump butt at you. So demanding! Giving him an appreciative spank - and sending his ass rippling - you set to work leaning over him and pinning him down. If he wants to fuck like animals then he’d at least better be ready to walk funny for a bit. Aligning " + (pc.cockTotal() == 1 ? "your " + pc.cockDescript() : "one of your cocks") + " with his dripping wet lips and putting your " + pc.breastDescript(0) + " to make sure you’ve got him held down, you push inside his womanly hole without much restraint.");
	output("\n\n<i>“Fuck yes!”</i> Alex’s pussy clenches tight around you, " + (pc.smallestCockLength() >= 16 ? "ignoring the bulging of his stomach and screaming out a lengthier moan into his pillow" : "groaning out while your balls thump into his womanhood’s folds with an almost deafening pop of your bodies") + ".");
	output("\n\nThat’s what you like to hear! No reason to keep waiting, you set a rough-thwacking pace so you can pummel him from tip to base as hard as Alex can handle it. Like an absolute champ he takes it alright; his folds vice tighter but his wetness betrays any attempt to slow you, building more friction along your cockmeat. The dark-skinned brunette’s face might be half-hidden his cushion but not enough to conceal his wanton lust."); 
	output("\n\nThe red shade glazing over his features and the almost too hard bite of the corner of his lower lip might have been alarming if you didn’t feel his pre-cum splattering both of your thighs everytime you slammed into him and made his seven-incher flop around.");
	output("\n\nBut you want to really make him cum; you don’t want it to just be a nice bit of rough sex that he can forget, do you? Releasing his hips and reaching around, you slip your hands over his muscled chest and lift him up from his pillowy safeguard almost too fast; he’s still holding it to his face in confusion while you stir his pussy up trying to re-align and continue fucking him like a cocksleeve."); 
	output("\n\nChanging the angle tightens him even further and forces a scream of joy from Alex and a hissing groan of pleasurable pain from you, your raven-haired boy and his pussy’s tightness reaches what must surely be his peak. Alex drops his pillow as his voice and mind catch up to the please, quickly taking your hands even while his mouth rolls open and his tongue droops out in an early ahegao.");
	output("\n\n<i>“Come on, Steele! Keep going! Almost there! Fuck yeah, man! This is what I wanted!”</i> His voice breaks as a particularly hard clap of your hips into his jiggly ass strikes his insides just right. <i>“<b>Holy FUCK</b>! Cum all you want, you fucking <b>beast</b>!”</i>");
	output("\n\nHe doesn’t need to beg; you gently tuck your head ");
	if (pc.tallness < 71) output("against his back");
	else if (pc.tallness == 71) output("over his shoulder");
	else output("and look down at him");
	output(" and blow your load only seconds before Alex reaches his peak. Your [pc.cum] starts filling his quivering pussy just as fast as his pecker blows a respectable mess over the wall, headboard, and up the length of his bed. Differentiating between seed and his gushing pussy isn’t easy, especially as you thrust your way through your climax and force plenty of the messy mix right back out as soon as you stir it up inside him. "); 
	//Variant for the knotted dick and multi-cocked dude.
	output((pc.hasKnot() ? "With one final knot-inflated push, you lock your bodies together and stop the flow of bodily fluids entirely, Alex’s voice breaking in an unexpected whimper of confused delight." : "Pushing in nice and deep, you finally come to a halt to ride out the rest of your own orgasm.")); 
	if (pc.cockTotal() > 1) output(" Of course you also help ruin his sheets too; having more than one dick sometimes <b>isn’t</b> an advantage.");
	output("\n\nWhile you’re coming down - the pair of you still clinging together - the cum-stuffed pretty boy leans back into you a little too suddenly, forcing you both into a tumble off the bed. Not that either of you really notice the fall or its following thud; you’re both too drained to care, sitting there writhing as one giant tangled ball of pleasure-locked flesh. "); 
	if (silly) output("You actually think your balls might be touching; that’s... not gay, right?");
	output("\n\nBut all things come to an end and eventually you both separate" + (pc.hasKnot() ? "once your knot deflates" : "") + "; Alex lets you shower first so he can clean the room up, at least. By the time you’re finished dressing, the semi-presentable maleherm is heading to the shower with his cum-dripping hole leaving a nice trail all the way to the door. It almost seems like you’re going to get to leave before Alex turns and looks back at you, giving you a thumbs-up.");
	output("\n\n<i>“You’re pretty good, [pc.name]. Next time, let’s go even harder... or longer. Or whatever. Point is, fuck me just as well as you did this time, got it?”</i>");
	output("\n\nNo problem, Alex. Returning his thumbs-up with your own, you wait for that steamy shower to start and close up on your wait out. It grants you a chance to leave feeling that extra bit lighter... and all to excited for another run at that dudesnatch.");
	output("\n\n");
	output("\n\n");
 	if (flags["FUCKED_ALEX"] == undefined) flags["FUCKED_ALEX"] = 0;
	flags["FUCKED_ALEX"]++;
	if (flags["FUCKED_ALEX_VAGINALLY"] == undefined) flags["FUCKED_ALEX_VAGINALLY"] = 0;
	flags["FUCKED_ALEX_VAGINALLY"]++;
 	processTime(30+rand(15));
 	pc.orgasm();
	pc.shower();
 	clearMenu();
 	addButton(0,"Next",mainGameMenu);
 }

//[Catch Vaginal] RW
//(Shoutout to all the cunthavers)
public function catchVaginalFromAlex():void {
	clearOutput();
	author("BubbleLord");
	alexNameBustDiplay(true);
	var x:int = pc.cuntThatFits(20);
	if(x < 0) x = rand(pc.vaginas.length);

	output("<i>“Then let’s fuck you silly... safely.”</i>");
	output("\n\nThe dusky fuckboy slips free from your ass and reaches over to his nightstand to thumb a button on the drawer; the almost painfully squeaky drawer sliding open and revealing a plethora of lube and condoms. With how wet you are you certainly don’t need the prior. Alex’s hand finds its way right back to its squeeze-worthy target and leaves you to retrieve the rubber sleeve yourself.");
	output("\n\nSlipping ever so gently up his frame - "); 
	if (pc.vaginas[0].wetness() < 2) output("occasionally dripping")
	else if (pc.vaginas[0].wetness() < 4) output("lightly sprinkling");
	else output("practically drooling");
	output(" your [pc.girlcum] along his stomach in the process - you turn and look over your shoulder at all seven inches of your androgynous herm’s erect manhood. Peeling the wrapper off your birth control lets you truly appreciate every cute throb of the girthy phallus in its own show of anticipation. "); 
	output("The puddle of girly juices coating his thighs and pooling on the sheets only accents just how eager Alex is, his hands squeezing at one of your [pc.nipples] and teasingly pinching your butt in-sync when the condom lightly snaps itself in a form-fitting and perfect fit.");
	output("\n\n<i>“" + (silly ? "Like they say in those archaic games... I’M GONNA WRECK IT! Your pussy, I mean." : "I’m going to fuck you so hard you’ll be jealous everyone else out there can’t work your pussy like me, [pc.name].") + "”</i>");
	output("\n\nSlipping your [pc.pussy] back and then away from him isn’t easy with how grabby he is but Alex isn’t stopping you. Hell, the dark-skinned boytoy deserves a bit of teasing; you settle your cunt right over him so that your [pc.pussy]’s lips are settled right against the contained pecker’s tip.");
	output("\n\nWhen you don’t drop down and give him what he wants, Alex’s eyes slip down to your hips and groin... and then look back up at you" + (pc.hasCock() && pc.biggestCockLength() >= 24 ? " - cutely leaning to look around your massive manmeat in the process." : "."));
	output("\n\n<i>“Come on now, Steele!”</i> He bites his bottom lip apologetically and grinds the tip up and down your womanly slit. <i>“Let’s get to fucking!”</i>");
	//Virgin or not? Let's see!
	var isVirgin:Boolean = false;
	if(pc.vaginalVirgin) isVirgin = true;
	if (isVirgin) {
		output("\n\nFor your first time to be with someone so eager, you can’t help but give him exactly what you promised. Allowing your [pc.legOrLegsNoun] to give out and gravity to take over, you sheath his manly pecker in one quick and wet slap of your bodies. The deep thump is barely recognizable compared to the loss of your maidenhead; all you can see is stars, both of your hands moving to Alex’s chiseled chest to support yourself.");
		pc.cuntChange(x, 20, true, true, false);
		output("\n\n<i>“F-Fuck! L-Looks... like someone isn’t so innocent n-now!”</i> Alex groans between tightening his grip and meeting your gaze from below. His face isn’t even trying to be transparent anymore; he’s red faced and panting with restraint just from staying still. <i>“Congrats [pc.name]; now let’s work your hole out to reward you, s-shall we?”</i>");
	}
	else {
		output("\n\nYou’ve dropped your pussy on cocksure dicks before and Alex’s won’t be the last. Your hands settle over his chest - stroking and gently pressing as you adjust your weight - only for a few seconds before gravity and your [pc.legOrLegs] coordinate a simple cuntbombing. The clap of your [pc.ass] against his groin is swiftly followed by your harmonious moans, the deep-reaching human prick buried from tip to base.");
		pc.cuntChange(x, 20, true, true, false);
		output("\n\n<i>“Fuck yeah, [pc.name]!”</i> Alex cheers half-breathed between restraining himself from pounding you wildly. <i>“Let’s get right to it and fuck our brains out!”</i>");
	}
	output("\n\nYou couldn’t agree more, laughing aloud as pleasure spikes up your insides along every bit of the buried length’s touch. Bracing your arms and [pc.legOrLegsNoun], your [pc.hips] rise and fall with the warm-up; the clapping of flesh filling the room only just above your stifled moans and Alex’s heavy panting. Your position lets you work the angle nicely between your warm box from grinding it side-to-side or arching your back just right so that it flexes his shaft within you.");
	output("\n\nBut above it is when each time you descend, Alex’s voice pitches up and slightly louder in his ecstasy. Considering his fondness of having both tools, maybe he’s oversensitive... or maybe he’s a quickshot. What you do know is that the condom-strapped phallus is shaking and bulging inside of you like it’s getting angry that it can’t feel the real deal. Alex’s manicured fingers at least mean that his tightening grip isn’t going to leave you any cuts, his ass-grabbing turning more into ass-milking with how he’s playing with your backside.");
	output("\n\n<i>“That’s it Steele... k-keep going... f-fuck, I don’t get to pound enough cunts like yours!”</i>");
	output("\n\nClamping your pleasuring vice just a tad bit tighter every inch you slide up, Alex’s voice finally breaks when the cap of his cock is between your dripping-wet cunt’s lips. Every bit of his masculinity just about vanishes when he squirts across his bedsheets and even onto the floor from the orgasm’s initial onset... but the ballooning rubber inside you is far from subtle in reminding you that your screaming and creaming partner here is the one doing the fucking. ");
	output("Even with the wrapper between you and his baby-making seed, you can feel every bit of the growing ponch’s warmth deep inside. It’s almost just as perverted as getting knocked up or getting a womb-washing in its own way.");
	output("\n\nBut Alex’s stiffness falters within you, forcing your scowl to settle on his bliss-wreathed face. It looks like he’s done but you’ve just neared the finish line! Both of you need to cross it... or you could show him mercy.");

	if(flags["FUCKED_ALEX"] == undefined) flags["FUCKED_ALEX"] = 0;
	flags["FUCKED_ALEX"]++;
	processTime(30+rand(15));
	clearMenu();
	addButton(0, "Keep Going", catchVaginalWithAlexKeepGoing, undefined, "Keep Going", "You’re just too horny or don’t care; you need to cum!");
	addButton(1, "Finish", catchVaginalWithAlexFinish, undefined, "Finish", "Alex is done; you’ll just have to get off elsewhere.");
}
public function catchVaginalWithAlexKeepGoing():void {
	clearOutput();
	author("BubbleLord");
	alexNameBustDiplay(true);
	output("<i>“H-huh... why... why aren’t you getting up?”</i> Alex’s hands slip down to your hips in confusion but not before you gently grab his wrists and pin them to the bed at his sides. <i>“W-Wait, I... I came... if we keep going then-OH FUCK!”</i>");
	output("\n\nYour rutting clap of flesh resumes but you don’t even miss a beat at setting it much higher pace-wise. The bulging thwack deep inside you whenever that cum ballooned tip smacks nice and deep inside you is only a reminder that you were built for bigger dicks than this. If Alex wants to have a cock this average, then he at least needs more stamina! The forced continuation shows he even has it in him; every bit of softening now replaced with throbbing, it actually feels like Alex is growing! Rolling your eyes back and parting your lips helps show just how much you appreciate the spirit of the maleherm’s pecker.");

	output("\n\nSeconds later, your fingers trace small scratches along his masculine chest as your own cunt splatters [pc.girlcum] on his groin. "); 
	if (pc.isSquirter()) output("The mess it adds to his bedsheets and thighs is likely making it look like he bathed in femjuices thanks to a micro-orgasm wracking his body yet again and causing his pussy to clench and spray yet again. ");
	output("Alex’s dick is definitely softening too... and leaving that small balloon now almost as thick as a fist.");	
	output("\n\nBut the best part may be how Alex looks; the future manager’s face is locked in bliss with his tongue out and eyes watery, gasping for air. The increased sensitivity was no joke; just hefting yourself up and popping free of his condom - with some ample maneuvering to make sure the weighty end thudded safely without spilling - makes Alex cry out in desire.");	
	output("\n\nBut you got what you wanted and sadly he’s not getting anymore of your ol’ gal. You clean up and gather your things before waving to the still-writhing boytoy. Anon’s might not be the best place around but maybe with some training Alex will turn into a stud and not be such a quickshot next time!");	
	pc.orgasm();
	//if (pc.hasVagina()) pc.loadInCunt(getAlexPregContainer(), x); //Because Alex is using a condom, doesn't give vag-stuffed status effect. No preggo!
	pc.shower();
	clearMenu();
 	addButton(0,"Next",mainGameMenu);
}
public function catchVaginalWithAlexFinish():void {
	clearOutput();
	author("BubbleLord");
	alexNameBustDiplay(true);
	output("While you’d like to get off using his pristine pecker, you’d hate to impose and force him to keep going. The pair of you work in tandem to securely slip you free of the condom without pulling it free. Eventually the bulging womb-filling bulge slips free for your admiration... and for Alex to slip the sleeve free of his slacking shaft with a content smile.");
	output("\n\n<i>“Nothing like blowing a load, right [pc.name]?”</i>");
	output("\n\nYeah sure... not that you’d know. Sighing and gathering your things unceremoniously, you leave Alex to “admire” his handiwork and clean up. Maybe there’s a bigger reason to why he got the cunt... especially if he’s such a quickshot.");
 	clearMenu();
 	addButton(0,"Next",mainGameMenu);
}

//[Frottage] OG
//(Dickhavers again (Fun variant for herms if I get to it))
public function frottageWithAlex():void {
	clearOutput();
	alexNameBustDiplay(true);
	author("RadicalBroseph");
	var x:int = pc.biggestCockIndex();
	output("Smiling ");
	if(pc.isAss()) output("wolfishly");
	else output("sweetly");
	output(", you ");
	if(!pc.isTaur()) output("sit down on the bed and gesture for Alex to sit in your lap.");
	else output("gesture for Alex to kneel on the bed so his crotch is level with yours.");
	output(" He’s quick to comply, getting into position ");
	if(!pc.isTaur()) output("straddling you");
	else output("on the bed");
	output(" and bracing himself against you, leaning in to press his firm, toned chest against your");
	if(pc.biggestTitSize() < 1) output("s");
	else output(" [pc.fullChest]");
	output(", your ");
	//If multicock:
	if(pc.cockTotal() == 2) 
	{
		output("dual dicks coming to rest on either side of Alex’s, forming a tight V-shape that he seems to be having some trouble resisting the urge to fuck.");
		output("\n\n<i>“Oh man,”</i> he moans, rocking his hips against yours, his pre-slicked cock sliding back and forth across the sensitive bundle of nerves at the meeting of your [pc.cocks]. <i>“You’re really making me reconsider saving up for some more exotic splices " + pc.mf("man","babe") + ". This is too much.”</i>");
		output("\n\nHe fidgets a little while longer before managing to calm down, taking your hands and moving them to his hips as if to ask you to help him keep steady.");
	}
	//3+ dicks:
	else if(pc.cockTotal() > 2)
	{
		output("[pc.cocks] nestling around his like a phallic bouquet, surrounding his hard, throbbing cock in a cluster of rigid man-meat. Alex moans loudly, bucking his hips against yours as he’s seemingly overwhelmed by the sensation of being surrounded by your multitude of dicks.");
		output("\n\n<i>“Oh man,”</i> he moans, rocking his hips against yours, his pre-slicked cock lost in your forest of manhood, being rubbed against on all sides");
		if(pc.cumQ() >= 150) output(" and coated in your pre");
		output(". <i>“You’re really making me reconsider saving up for some more exotic splices " + pc.mf("man","babe") + ". This is too much.”</i>");
		output("\n\nHe fidgets a little while longer, getting his cock properly acquainted with your [pc.cocks] while you place your hands on his hips to steady him.");
	}
	//If one cock:
	//If small:
	else if(pc.cocks[x].cLength() <= 5.5) {
		output("cocks pressed together between your [pc.belly] and his flat stomach. His member, while pretty respectable by pre-enhancement standards, is definitely on the smaller end of the scale, but even so it ");
		if(pc.cocks[x].cLength() <= 4) output("dwarfs");
		else output("is noticeably bigger than");
		output(" yours, looming over it and pressing it back against your [pc.skin].");
		output("\n\n<i>“It’s so cute,”</i> Alex coos, arms still draped around your shoulders. <i>“I almost wanna put a little hat on it or something.”</i>");
		output("\n\nYou ");
		if(pc.isNice()) output("smile");
		else if(pc.isMischievous()) output("laugh");
		else output("give him a stern look");
		output(" and get back to business, placing your hands on his waist to steady him.");
	}
	//If medium:
	else if(pc.cocks[x].cLength() <= 10)
	{
		output("cocks pressed together between your [pc.belly] and his flat stomach, your [pc.cockHead " + x + "] rubbing against his smooth skin");
		if(pc.cumQ() >= 100) output(" and drooling pre-cum all over him");
		output(". Alex, seemingly a fan of moderation, has a smaller dick than yours");
		if(pc.cocks[x].cLength() <= 6.5) output(", though not by much,");
		output(" and leans back briefly to give your [pc.cock " + x + "] one last appreciative once-over before draping his arms over your shoulders while you place your hands on his waist to steady him.");
	}
	//If big:
	else
	{
		output("[pc.cock " + x + "] dwarfing his and forcing him to lean back with its monstrous girth. You almost can’t feel Alex’s cock against yours at all, but his smooth chest");
		if(pc.biggestTitSize() >= 3) output(" on the underside of your member combined with the warm embrace of your own [pc.chest] around the rest");
		else output(" rubbing against the underside of your member");
		output(" is definitely enough to compensate. Murmuring happily, he leans in and kisses the ");
		if(pc.cocks[x].cLength() >= 30) output("shaft");
		else output("head");
		output(" of your cock");
		if(pc.cumQ() >= 100) output(", smearing your pre-cum over his full lips");
		output(" as you reach around to place your hands on his waist.");
	}
	
	//if hard: 
	if(pc.isAss()) {
		output("\n\n<i>“Get ready,” you tell him, tightening your grip.");
	}
	//if not:
	else
	{
		output("\n\n<i>“Ready?”</i> you ask, ");
		if(pc.isNice()) output("kissing him on the nose.");
		else if(pc.isMischievous()) output("flashing him a winning smile.");
	}
	output(" Alex nods, almost bouncing in anticipation. Assured that he’s worked up enough for your liking, you begin to move your hips. You start off slow, at first, letting ");
	if(pc.cumQ() >= 50) 
	{
		output("your ");
		if(pc.cumQ() >= 150) output("copious ");
		output("pre-cum ");
	}
	else output("Alex’s pre-cum ");
	if(pc.isLactating()) output("and the [pc.milk] steadily leaking down your chest from your [pc.nipples]");
	output(" coat the two of you thoroughly for smoother and smoother strokes. Seemingly overwhelmed by the sensation of ");
	if(pc.cockTotal() > 1) output("being surrounded by your hard, ready cocks");
	else if(pc.cocks[x].cLength() <= 5.5) output("your [pc.cockHead " + x + "] gliding across his cock");
	else if(pc.cocks[x].cLength() <= 10) output("your [pc.cock " + x + "] rubbing against his");
	else output("his little boy-clit rubbing against your titanic tool");
	output(", your androgynous lover moans and presses himself against you, ");
	if(pc.biggestCockLength() >= 25) output("leaning around your [pc.cockBiggest] to hide his face against your shoulder, effectively jerking you off with the crook of his elbow in the process");
	else 
	{
		output("hiding his face against your [pc.chest]");
		if(pc.biggestTitSize() >= 2) output(" and murmuring his approval into your cleavage");
	}
	output(".");

	output("\n\n<i>“M-more,”</i> he gasps, breath hot against your [pc.skin]. <i>“Harder, please.”</i>");

	output("\n\nYou’re only happy to oblige. Sliding your hands down his back to grasp his full, round ass - one part for leverage and two parts for your own pleasure - you begin to pick up the pace. The wet sound of skin against cum-slick skin fills the air as you thrust against him, ");
	
	if(pc.cockTotal() > 1) output("his cock almost lost among your [pc.cocks]")

	else if(pc.hasCockFlag(GLOBAL.FLAG_PREHENSILE)) {
		output("your wet cock twining around his");
	}
	//small/med/big dick:
	else if(pc.cocks[x].cLength() <= 18) output("the wonderful friction of your cocks driving you to greater speeds");
	//Huge donger
	else {
		output("essentially using ");
		if(pc.biggestTitSize() >= 3) output("your [pc.chest] and his chest and arms");
		else output("both of your torsos and arms");
		output(" as a person-sized onahole for your mighty manhood");
	}
	//balls and taur/’pillar: 
	if(pc.balls > 0 && pc.isTaur()) 
	{
		output(" as your [pc.sack] swings heavily below you");
		if(pc.ballSize() > 6) output(", slapping against the side of the bed");
		output(" with each trust");
	}
	//Hermy balls taur
	else if(pc.balls > 0 && pc.hasVagina())
	{
		output(" as your [pc.sack] swings heavily below you and your neglected cunt");
		if(pc.totalVaginas() > 1) output("s contract");
		else output(" contracts");
		output(" rhythmically");
	}
	//Just a herm
	else if(pc.hasCock() && pc.hasVagina()) {
		output(" as your neglected cunt");
		if(pc.totalVaginas() > 1) output("s contract");
		else output(" contracts");
		output(" rhythmically");
		if(pc.isTaur() && pc.wetness(0) >= 3) output(", drooling down your thighs");
		else if(pc.wetness(0) >= 3) output(", soaking the sheets");
	}
	output(". You’re just nearing the edge yourself when Alex starts to shudder and scrabble at your back.");

	output("\n\n<i>“Shit, [pc.name], I’m coming.”</i> One final buck of his hips sends him over, painting");
	if(pc.cocks[x].cLength() > 18) output(" his chest and the underside of your [pc.cock " + x + "]");
	else output(" both of your chests with sticky white strands");
	output(". His cunt clenches in sympathetic orgasm, wetting ");
	if(pc.isTaur()) output("his girlish thighs and the sheets below him");
	else output("your thighs");
	output(" with femcum as he writhes and pants, trying to catch his breath.");

	if(pc.isAss()) output("\n\nYou point out that you haven’t cum yet, before he has a chance to get too relaxed.");

	output("\n\n<i>“Sorry,”</i> he says, sounding more than a bit winded. <i>“Couldn’t hold off any longer. Here, let me make it up to you.”</i> ");
	//taur/’pillar: 
	if(pc.isTaur()) output("Sliding off the bed, he kneels in front of you");
	else output("Sliding back off your lap, he leans forward");
	output(" and takes your still-hard [pc.cockBiggest] in ");
	if(pc.cocks[x].cLength() >= 12) output("both of his hands ");
	else output("his hands ");
	output("and starts to jerk you off. It’s obvious that he’s pretty tired, but he gets to the task with enthusiasm, ");

	//If small cock:
	if(pc.cocks[x].cLength() <= 5.5) {
		output("taking your whole member into his mouth in one smooth movement");
		if(pc.cockTotal() > 1) {
			output(" as he tends to ");
			if(pc.cockTotal() == 2) output("the other");
			else output("the rest");
			output(" with his hands");
			if(pc.cockTotal() > 2) output(", dividing his attentions between your spares as equally as he can manage");
		}
		output(". He hums around it contentedly, tongue skillfully tickling the underside");
		if(pc.balls > 0 && pc.hasVagina())
		{
			output(" while he");
			//3+cocks:
			if(pc.cockTotal() > 2) output(" takes a break from handjobs to cup");
			else output(" cups");
			output(" your [pc.balls] with one hand and toys with the folds of your [pc.vaginas] with the other");
		}
		else if(pc.hasVagina())
		{
			output(" while he");
			//3+cocks:
			if(pc.cockTotal() > 2) output(" takes a break from handjobs to slide");
			else output(" slides");
			output(" a hand up the inside of your thigh and rubs his fingers across the folds of your femsex");
		}
		else if(pc.balls > 0)
		{
			output(" while he ");
			if(pc.cockTotal() > 2) output(" takes a break from handjobs to cup");
			else output(" cups");
			output(" and toy");
			if(pc.cockTotal() <= 2) output("s");
			output(" with your [pc.balls]");
		}
		output(".");
	}
	//If medium cock:
	else if(pc.cocks[x].cLength() <= 10)
	{
		output("taking a deep breath before taking your whole member into his mouth in one smooth movement, flinching a little as your [pc.cockHead " + x + "] bumps against the back of his throat but managing it nonetheless. After a pause to get himself situated he starts to bob his head, swallowing and swirling his tongue to stimulate your whole length");
		//if multicock herm: 
		if(pc.cockTotal() > 1 && pc.hasVagina())
		{
			output(" as he divides his attention between your spare cock");
			if(pc.cockTotal() > 2) output("s");
			output(" and your needy [pc.vaginas], deft hands playing over them like a skilled musician plays his instrument");
		}
		//if multicock:
		else if(pc.cockTotal() > 1)
		{
			output(" as he tends to ");
			if(pc.cockTotal() == 2) output("your other cock");
			else output("the rest of your cocks");
			output(" with his hands");
			if(pc.cockTotal() > 2) output(", dividing his attentions between them as equally as he can manage");
		}
		//if herm:
		else if(pc.hasVagina())
		{
			output(" as he slides a hand up the inside of your thigh and rubs his fingers over the lips of your [pc.vaginas]");
			if(pc.hasClit()) output(", teasing your [pc.clits]");
		}
		output(".");
	}
	//If big cock:
	else if(pc.cocks[x].cLength() <= 18)
	{
		output("wrapping both of his hands around your shaft and taking your [pc.cockHead " + x + "] into his mouth. It takes him a second to work out how to best pleasure your [pc.cockBiggest]");
		if(pc.hasVagina() || pc.cockTotal() > 1)
		{
			//herm or multicock:
			output(" along with the rest of you");
		}
		output(" with the limited tools available to him, but he manages, ");
		//pure male, 1 cock:
		if(!pc.hasVagina() && pc.cockTotal() == 1) output("fingers tracing over veins and ridges, touching delicate and feather-light one moment and squeezing rhythmically the next while his skillful tongue swirls over your head.");
		else if(!pc.hasVagina()) output("hands darting between your members as he kisses and sucks at the length of each in turn, multitasking skillfully and letting no cock go neglected for too long.");
		else
		{
			output("sparing a hand to toy with your");
			if(pc.hasClit()) output(" [pc.clits]");
			else output(" labia");
			if(pc.cockTotal() > 1) output(" while the other tends to your spare rod");
			if(pc.cockTotal() > 2) output("s");
			output(". His fingers dance over your slick folds");
			if(pc.cockTotal() == 2) output(" and hard cock");
			else if(pc.cockTotal() > 2) output(" and hard cocks");
			output(", teasing and toying while he swirls his tongue and hums around you.");
		}
	}
	//If huge cock:
	else
	{
		output("wrapping both of his hands around your shaft and trailing slow, sucking kisses along the underside of your [pc.cockBiggest] and trailing his tongue in torturously slow circles over your [pc.cockHead " + x + "]. One man pleasuring your impressive length and girth with just his mouth and hands is something of a feat");
		if(pc.cockTotal() > 1 || pc.hasVagina()) output(" by itself");
		output(", but he manages");
		if(pc.cockTotal() > 1 || pc.hasVagina())
		{
			output(", even sparing a moment for your ");
			if(pc.cockTotal() > 2 && pc.hasVagina()) output("spares and your poor, neglected [pc.vaginas]");
			else if(pc.cockTotal() > 2) output("spares");
			else output("poor, neglected [pc.vaginas]");
			output(". His lips and hands are wonderfully soft as he works you over, ");
			if(pc.cockTotal() == 1 && !pc.hasVagina()) output("delivering immense pleasure despite not even being enough to fully wrap around your titanic tool");
			else if(!pc.hasVagina()) output("darting from cock to cock, tracing over veins and pressing insistently at sensitive spots to try to distribute the pleasure evenly");
			else if(pc.cockTotal() == 1)
			{
				output("fingers rubbing insistently");
				if(pc.hasClit()) output(" at your [pc.clits] and");
				output(" over your netherlips as he continues to lavish your cock with affection");
			}
			else
			{
				output("darting from cock to cock");
				if(pc.hasClit()) output(" and rubbing insistently at your [pc.clits]");
				output(", making sure no part of you goes neglected for too long");
			}
		}
		output(".");
	}
	output("\n\nA few long moments of intensive care under Alex’s near-worshipful mouth and hands are enough to send you over. Finally, you cum, ");
	if(pc.cumQ() <= 25) output("spattering his face with streaks of [pc.cumColor]");
	else if(pc.cumQ() <= 100) output("painting his face a lovely shade of [pc.cumColor] and drenching him thoroughly");
	else output("blasting him with such a torrent of [pc.cum] that he reels backwards");
	if(pc.hasVagina())
	{
		output(" while your [pc.eachVagina] bears down on his fingers");
		if(pc.isSquirter()) output(" and gush femcum");
	}
	output(".");

	output("\n\n<i>“Oh wow,”</i> Alex groans, ");
	if(pc.cumQ() > 25) output("wiping [pc.cum] out of his eyes and ");
	output("collapsing back onto the bed now that his duty is done. <i>“You’re one hell of a fuck, [pc.name]. Shit. Give me a bit to recover - I’m gonna need it. Feel free to use the shower.”</i>");
	output("\n\nYou get yourself cleaned up, retrieve your clothes, and head back to the bar.");
	if(flags["FUCKED_ALEX"] == undefined) flags["FUCKED_ALEX"] = 0;
	flags["FUCKED_ALEX"]++;
	pc.shower();
	processTime(30+rand(15));
 	pc.orgasm();
 	clearMenu();
 	addButton(0,"Next",mainGameMenu);
}

//[Catch Anal] RW
//(Fun for everyone)
public function catchAnalFromAlex():void {
	clearOutput();
	alexNameBustDiplay(true);
	author("BubbleLord");
		
	var isVirgin:Boolean = false;
	if(pc.analVirgin) isVirgin = true;
	
	output((pc.hasVagina() ? "Today it’s going to be the front" : "Your only option is to use the back") + "; you’re in the market for some Alex-provided ass-pounding. Alex isn’t one to waste time helping either, rolling the pair of you and exchanging your positions as best he can. "); 
	output((pc.hasTail() ? "Brushing your [pc.tails] across the inside of his slick thighs" : "Trailing a finger up his lightly-muscled pecs and hooking your [pc.legOrLegsNoun]") + " around his back, you can’t help but approve of his taste. If the maleherm is looking to fuck your butt missionary-style, it’s almost like he’s trying to mating-press your ass like it’s a fertile cunt.");
	output("\n\n<i>“Pft,”</i> Alex flicks his hair from his face with a sway of his head and topples closer, pecking you with a kiss while he shifts onto his knees and over you as best her can. <i>“I might not be able to put a kid in it but if you keep that up I might stuff it full enough you’d think your butt <b>is</b> pregnant!”</i>");
	output("\n\nHis left hand slips behind your head but the right slides down between you both and past " + (pc.hasCock() ? "both" : "his") + " dick and between his thighs. You can’t see it but you can hear his fingers slipping up and down Alex’s pussy, gathering a sheen-worthy amount of his personal moisture. Both of you lock lips again - albeit this time getting a substantial amount of tongue to dance with yours in slippery harmony - before the maleherm pulls free and sits up."); 
	output("\n\n" + (pc.tallness <= 70 ? "Looming over you from his knees" : "Trying his best to appear befitting your larger stature") + ", Alex wastes no time squeezing his dry hand’s grip onto your hip to keep you still; your focus instead turns to his girl-slicken cock getting rubbed up and made perfect for pounding your [pc.anus] to his shape.");
	output("\n\nAnd once he’s ready, Alex doesn’t waste anymore time slipping back over you and forcing your [pc.legOrLegsNoun] to hike up and your thighs to hug his waistline. Grabbing his ass in one hand and the sheets in the other catches the prettyboy off-guard. Just long enough to make him pause with the tip of his human prick’s nestling at your [pc.anus]. Smugly squeezing and lifting, Alex wraps both of his arms around behind you and pulls the two of you together into a nice, cutesy kiss."); 
	//Deflowerity deflower.
	output("\n\nBut the romance vanishes in an instant when he takes your breath" + (isVirgin ? " - and virginity -" : "") + " away in one filling push.");
	pc.buttChange(20);
	output("\n\nAs much as you want to moan he won’t let you, humping you with his arms clinging tight enough that your moans echo within his mouth and your throat. It’s an almost-suffocating feeling but one that Alex doesn’t relent on in his buttfucking; the way his dick pushes into you ensures you feel his member bottom out and his nutsack gently thwacking up your spine. And to his credit, Alex’s anal pounding betrays the androgynous maleherm and makes him seem like a true stud."); 
	output("\n\nEven if he wasn’t the biggest cock in space, the way it brushes up your inner walls" + (pc.hasCock() ? " and prostate" : "") + " sparks pleasure all the way up to your toes!"); 
	if (pc.hasCock()) output(" Trapped between your bodies, you’re making a mess of your stomachs with all the pre-cum you’re leaking.");
	output("\n\nBut for all the buttfucking rocking his bed and your hole into his shape, Alex isn’t in much better shape as far as handling his mating press goes. You can feel strings of pre-cum turning into a sticky, wet mess on-par with the dripping of his girl-gash across your thighs. Pushing your tongue against his and forcing yourselves apart, your hands slip up to the back of his head and force him to rest over your shoulder."); 
	output("\n\nThankfully for both of you it doesn’t slow him in the slightest; in fact, Alex’s whimpering borders on the most innocent thing you’ve seen for someone having an anal field-day.");
	output("\n\n<i>“F-Fuck! Your hole is so warm I want to live in it! Steele, I-I... y-you better swing by and let me fill this ass of yours up more often!”</i>");
	output("\n\nYou’ll think about it; hooking your [pc.legOrLegsNoun] behind him, you raise your hips just that extra bit to encourage him to ram harder. The slapping of flesh must be audible outside by now with how deafening it is inside the room. As far as you’re concerned, all you care about is making him blow his load and cumming your brains out. Tightening up forces Alex to squeal in ecstasy and half-collapse into you, your right hand slipping down and carefully behind him to his pussy before he can react."); 
	output("Thankfully for you the two of you aren’t face-to-face; brushing your fingertips up and down his sloppy folds makes him both thrust harder and openly scream into the sheets for release.");
	output("\n\nAnd boy does he cum, smacking together and grinding into you to get the best seal possible. The grinding smothers the tip of his cock against your " + (pc.hasCock() ? "prostate" : "wall") + ", amplifying the pressure of his seed erupting free of his prick. It hits hard enough to make your lip-biting draw traces of blood, stifling your own moans and squirming beneath him for any room to escape."); 
	output("\n\nBut all Alex allows is you to adjust for more of his weight to collapse into you, the sticky warm seed stringing and practically glazing your insides alabaster without stopping. His cunt releases a nice spray against your fingers but the lack of slowing down means you keep rubbing mid-crash into your own orgasm.");
	output("\n\nIn seconds, the two of you catch into a loop where his feminine parts let him keep riding his orgasm and his cum-hammering filling continues to push you toward the brink. ");
	if (pc.hasCock()) {
		output("Your own cock even fires its load, " + (pc.cumQ() < 100 ? "coating your chests" : "spraying out over the two of you") + " in [pc.cum] and ensuring that every bit of movement makes you stick together a bit better. "); 
	}
	if (pc.hasVagina()) {
		output("Even though he’s not pounding it, your pussy can’t help but mirror his own orgasmic bliss; you clench tight" + (pc.isSquirter() ? " and squirt" : "") + ", glazing your folds " + (pc.isSquirter() ? "and Alex’s groin and pistoning shaft" : "") + " with [pc.girlcum]. ");
	}
	if (pc.isHerm()) {
		output("The sheer pleasure of all your parts orgasming finally rolls your eyes back and forces your moan free to harmonize with Alex’s own muffled cries.");
	}
	else {
		output("Your anal orgasm wracks your body and tries milking him further, squeezing the intruding prick in quick succession as if to drain every bit of the maleherm’s sack of its seed.");
	}
	output("\n\nBut eventually the cycle ends when Alex’s weight fully falls against you, his breathing slow and his sweaty masculine chest pressing into you hard enough you can feel his heartbeat. It’s almost too much work rolling him off you but you can’t sit around forever; Alex’s dick is flaccid enough that the roll pulls him out and lets all his buttpacking lewdly gush out of you in a nice, thick batch. That was definitely a nut-drainer. It’s difficult to sit up but you force yourself up... just in time for Alex to stop you with a soft caress along your thigh from his sex-dazed half-sleep.");
	output("\n\n<i>“Fucking... best ass... ever. You’re one <b>hell</b> of a fuck, [pc.name]. Y-You... go ahead and clean up. I’ll uh... nnngh... nnnn...”</i>");
	output("\n\nAnd Alex is asleep. Rolling your eyes and patting the herm goodbye, you stagger to your feet and gather your things. You’re not going to take up too much of his time with a full shower but you take enough time to clean your sloppy backside of any prominent cum before you ready yourself to leave. Not that it helps; it’s still oozing free of your pucker when you’re heading out the door!");
	
	if(flags["FUCKED_ALEX"] == undefined) flags["FUCKED_ALEX"] = 0;
	flags["FUCKED_ALEX"]++;
	processTime(30+rand(15));
 	pc.orgasm();
	pc.loadInAss(getAlexPregContainer());
 	clearMenu();
 	addButton(0,"Next",mainGameMenu);
}

//[Bail Once More] RW
public function bailOutOnAlex():void {
	clearOutput();
	alexNameBustDiplay();
	userInterface.showName("\nALEX");
	author("BubbleLord");
	output("Now that you’re actually here, you’re not so sure you’re up to tumbling in the sheets with Alex today. When you tell him as much, his trademark smile fades into a disappointed frown; he gets up off you and lets you sit up without a fight though..");
	output("\n\n<i>“Shit, really?”</i> he asks, looking a little insulted. <i>“Well, I’m not going to force you or anything but man, what a letdown. I’ll see you later, I guess.”</i>");
	output("\n\nYou hastily apologize while dressing, promising him you’ll try to make it up to him next time you drop by.");

	if(flags["FUCKED_ALEX"] == undefined) flags["LAST_MINUTE_ALEX_BACK_OUT"] = 1;
	processTime(2);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

/*
		/* OLD - To be removed
		clearOutput();
		alexNameBustDiplay();
		author("RadicalBroseph");
		output("You tell him you think you’re up to it if he is.");
		output("\n\n<i>“Great,”</i> he says, grin widening as he shoves a hand in his pocket and fishes around for a bit before pulling out a key. <i>“Head on up to my room and get yourself ready while I try to flag down the bartender so I can pay off my drink.”</i>");
		if(silly) output(" Wow, what a trusting guy. You think about stealing his room key for a little while before deciding against it. Theft would be way too annoying to implement just for a scene like this.");
		output("\n\nFeeling your ");
		if(pc.hasVagina() && pc.hasCock()) output("[pc.vaginas] slicken and [pc.cocks] harden");
		else if(pc.hasVagina()) output("[pc.vaginas] slicken");
		else if(pc.hasCock()) output("[pc.cocks] harden");
		else output("body grow hot");
		output(" with anticipation, you head up the stairs, find your new friend’s room, and head inside. It’s not really all that impressive, but given the state of this place in general that’s not a big surprise, and all that matters right now is that the bed looks comfortable enough. You’re just about out of your [pc.gear] when you hear a knock on the door and turn around to see ");
		if(flags["FUCKED_ALEX"] != undefined || flags["LAST_MINUTE_ALEX_BACK_OUT"] != undefined) output("Alex");
		else output("your partner");
		output(" peeking in. He whistles appreciatively.");
		// If first time boning Alex (or if first time since changing genital configuration if that’s not too much of a bitch to code):
		if(flags["FUCKED_ALEX"] == undefined) {
			var he:String = pc.mfn("he","she","meh");
			//If herm:
			if(pc.hasCock() && pc.hasVagina())
			{
				output("\n\n<i>“I see someone else is big on batting for both teams,”</i> he laughs, shutting the door behind him. <i>“Oh yeah, we’re going to have some fun.”</i>");
			}
			//If dick & masculine:
			else if(pc.hasCock() && he == "he")
			{
				output("\n\n<i>“Wow,”</i> he says, shutting the door behind him as he admires your [pc.cocks].");
				if(pc.longestCockLength() <= 5.5) output(" <i>“You know, I’ve gotta say that living in a galaxy full of people splicing up to try and get the biggest, thickest dick has really made me appreciate the little things in life.”</i> You roll your eyes as he takes a moment to laugh at his own joke. At least he seems to be into it.");
				else if(pc.longestCockLength() <= 10) output(" <i>“Call me old fashioned, but there’s almost nothing I love more than a good dick. And you, sir, have got a good dick.”</i>");
				else if(pc.longestCockLength() <= 18) output(" <i>“You’re quite the catch. I really hope you’re planning on fucking me with that, damn. Been a while since I had anything that big.”</i>");
				else output(" <i>“Holy fuck. Okay, I’m pretty flexible, but that’s going to take some work. Wow. How long did you have to work at getting it that big?”</i> You say you’ll tell him later, when there aren’t more pressing issues at hand.");
				output("\n\n<i>“Yeah, right, I figure you didn’t exactly come up here to tell me your life story,”</i> he says, shaking off his surprise.");
			}
			//If dick & feminine:
			else if(pc.hasCock() && (he == "meh" || he == "she"))
			{
				output("\n\n<i>“Never would’ve guessed that,”</i> he says, shutting the door behind him as he admires your [pc.cocks]. <i>“Not that I’m complaining, of course. Who isn’t into ");
				if(pc.biggestTitSize() >= 1) output("chicks with dicks");
				else output("beautiful men");
				output(", am I right?”</i>");
			}
			//If pussy & feminine:
			else if(pc.hasVagina() && pc.mf("","she") == "she")
			{
				output("\n\n<i>“Wow,”</i> he says, shutting the door behind him as he admires you from top to bottom");
				if(silly) output(" but mostly focusing on your [pc.chest]");
				output(". <i>“Call me old fashioned, but I’ve never been able to say no to a classic beauty like you.”</i>");
			}
			//If pussy & masculine:
			else if(pc.hasVagina()) {
				output("\n\n<i>“Wow,”</i> he says, shutting the door behind him as he admires you from top to bottom. <i>“You know, you don’t see a lot of people rocking that combo around. Chicks with dicks are a dime a dozen, but man do I love guys with cunts.");
				if(pc.biggestTitSize() > 2) output(" Not about to complain about your tits, either.");
				output(" Damn.”</i>");
			}
			//If genderless:
			else {
				output("\n\n<i>“Huh,”</i> he says, shutting the door behind him and looking pretty damn puzzled. <i>“Well.”</i> There’s a long, awkward moment where he just stares at you with a look on his face like he’s trying to work out some complex math problem. You sigh and ask if there’s something wrong.");
				output("\n\n<i>“No, no, I’ve got this,”</i> he replies, not seeming wholly convinced himself but determined to rise to the challenge nonetheless. After another pause for consideration his cocky smile is firmly affixed on his face once again. <i>“Yeah, I’ve got this. Sorry, It’s just not every day I see something new, you know?”</i> You concede that your attributes, or lack thereof, are pretty out of the ordinary.");
			}
		}
		output("\n\n<i>“So,”</i> he says, wasting no time in stripping out of his own clothes to reveal an already-hard, seven-inch human cock and two full, golfball-sized testicles. <i>“What are you waiting for?”</i>");
		output("\n\nYou ");
		if(pc.legCount > 1) output("stride");
		else output("slither");
		output(" forward confidently, wrapping your arms around his ");
		if(pc.tallness > 72) output("girly waist");
		else output("shoulders");
		output(". He seems to melt against you, more than pleased to let you take the lead as you maneuver him around so his back is to the bed and push him down. Moaning lustily into your mouth, he arches his back to press his flat, muscular chest against your [pc.chest]");
		if(flags["FUCKED_ALEX"] == undefined) 
		{
			output(" before stopping abruptly.");
				output("\n\n<i>“Shit</i>,” he says, pulling out of your lip-lock. <i>“Where’s my manners? My name’s Alex.”</i> He offers you a hand, which you take despite your mild confusion. Surprisingly, given everything else about him, his handshakes are very firm and manly. You introduce yourself in kind. <i>“Well it’s nice to meet you, [pc.name]. Not that I expect this to be much more than a wham, bam, thank you ma’am, but it’s just nice to know who you’re fucking, right?”</i> Before you can respond, he’s pulled you back into a passionate kiss.");
		}
		output("\n\nYou explore Alex’s mouth with your tongue, tasting the last remnants of whatever fruity thing he’d been drinking before sneaking off with you and enjoying the low rumble of his moans against your [pc.lips] as he wriggles under you, gently pressing a knee up ");
		if(pc.hasStatusEffect("Genital Slit")) output("against your genital slit");
		else if(pc.isTaur() || pc.isGoo()) 
		{
			output("against where your torso meets your ");
			if(pc.isGoo()) output("soft, gel-like");
			else output("animalistic");
			output(" lower half");
		}
		else if(pc.hasVagina()) output("against your soaked netherlips");
		else if(pc.hasCock()) output("against your nearly unbearable hardness");
		else output("between your thighs");
		output(".");
		output("\n\n<i>“So,”</i> he murmurs, <i>“How do you want to do this?”</i>");
		userInterface.showName("\nALEX");
//[No] OLD - TO BE REMOVED
public function noToAlyxSex():void {
	clearOutput();
	alexNameBustDiplay();
	author("RadicalBroseph");
	output("This guy seems nice, if a little cocky, but you’re not really feeling it. You decline ");
	if(pc.isNice()) output("as politely as you can manage");
	else output("bluntly");
	output(" and he shrugs.");
	output("\n\n<i>“Suit yourself,”</i> he says, seeming to take your rejection in stride. <i>“I’ll be around if you change your mind, though.”</i>");
	//(Add “Androgyne” button when standing around the bar and go to repeat intro)
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
//OLD - Pitch Vaginal
public function pitchIntoAlexsBoyPussy():void {
	clearOutput();
	author("RadicalBroseph");
	alexNameBustDiplay(true);
	//If none of your cocks fit:
	if(pc.cockThatFits(200) < 0)
	{
		output("Alex glances back and forth between your [pc.cocks] and his comparitively small frame a few times, looking concerned.");
		output("\n\n<i>“I don’t think this is gonna work,”</i> he says, hesitantly. <i>“Like, if I thought it was at all possible I’d be thrilled to give it a shot, but I’m not exactly a rahn, you know?”</i> With an expression of intense disappointed longing on his face, he reaches out and pats your [pc.cockBiggest] as if to check if something that huge could really be real.");
		output("\n\n<i>“Don’t you get dizzy every time you pop a boner or something? Wow. Anyway, is there anything else you wanna try? I’m up for just about anything.”</i>");
		//(sex menu with all applicable options except Pitch Vaginal)
		alexSexMenu(false);
		return;
	}
	var x:int = pc.cockThatFits(200);
	//If one fits:
	output("You tell Alex to get on all fours and present himself to you; a command with which he happily complies, rolling over onto his stomach and quickly getting his knees under him so his full, heart-shaped butt is up in the air. His pussy, previously hidden from view by his cock and balls, is soaking wet and drooling down his thighs");
	if(pc.wetness() > 3) output(", though it’s nothing compared to yours");
	output(". Running two fingers teasingly up and down the length of his slit and giving special attention to the small, hard nub of his clit, you ask him if he’s ready for you.");
	output("\n\n<i>“Yes,”</i> he gasps, voice hitching up to an almost feminine key. <i>“Yes, stop teasing, I need this.”</i>");
	output("\n\nGrinning, you withdraw your hand and give his ass an appreciative slap, pleased to see how well it jiggles. Alex just whimpers and wiggles his hips back and forth, trying to tempt you into taking action instead of taunting him any further. It certainly proves an effective tactic, and you find yourself with your hands gripping his wide, womanly hips as you align your [pc.cock " + x + "] with his slick folds.");
	//If small dick:
	if(pc.cocks[x].cLength() <= 5.5) {
		output("\n\nYou slide easily into his experienced cunt");
		if(pc.balls > 0) output(", [pc.balls] slapping wetly against his throbbing clit");
		output(". He’s loose around you but he moans nonetheless, apparently very turned on by the feeling of your [pc.cockHead " + x + "] rubbing against his well-used walls, and after a moment to adjust he’s able to clench down on your [pc.cock " + x + "] surprisingly well.");
	}
	//if medium dick:
	if(pc.cocks[x].cLength() <= 10) {
		output("\n\nSlowly, wanting to draw this out as much as possible, you press your [pc.cock " + x + "] inch by inch into his cunt, enjoying every ripple and spasm as he moans and tries to buck back against you for more. You’ve got your own ideas, though, and hold his hips steady until you’re fully sheathed inside of him, [pc.cockHead " + x + "] pressed against his cervix");
		if(pc.balls > 0) output(" and [pc.balls] slapping wetly against his throbbing clit");
		output(".");
	}
	//if big or HUGE dick:
	else if(pc.cocks[x].cLength() <= 18) 
	{
		output("\n\nIt takes a few tries, sliding the [pc.cockHead " + x + "] of your [pc.cock " + x + "] up and down his netherlips until the combination of your ");
		if(pc.cumQ() >= 100) output("copious ");
		output("pre-cum and his lady juices gets you wet enough to finally press in. Alex gasps as your massive head passes the comparatively tight entrance of his cunt, fingers tangling into the sheets as he’s stretched to capacity.");
	}
	//if HUGE dick:
	else 
	{
		output("\n\nActually feeling a little concerned, you ask if he’s going to be okay.");
		output("\n\n<i>“Fffffuck yeah,”</i> he hisses through gritted teeth. <i>“Never better. Holy shit.”</i> Good enough for you, you think, before getting back to your business.");
		output("\n\nHe’s tight, wonderfully tight to the point that you can actually feel his pulse pounding through the wet, hot walls of his pussy, and that’s just with the tip inside. You moan and ease in, stretching his already loose cunt even further, bit by bit until your cockhead is pressed flush against his cervix.");
	}
	//(DICK VIRGINITY CHECK)
	pc.cockChange();
	output("\n\nYou let him rock back against you for a little while, leaning forward ");
	//if breasts > B cup:
	if(pc.biggestTitSize() > 2) {
		output("and squishing your [pc.fullChest] against his back");
		if(pc.isLactating()) output(", smearing your [pc.milk] across his shoulders ");
		else output(", pressing your [pc.chest] against his back ");
	}
	output("while you tweak his small, perky nipples and nip at his ear. He moans, low and needy and starts to complain about you teasing him again before you pull almost all the way out and slam into him again suddenly");
	if(pc.cocks[x].cLength() <= 10) output(" with a wet slap of skin against skin as your [pc.hips] meet his, jiggling his rounded ass enticingly.");
	else output(", causing him to yelp as the head of your [pc.cock " + x + "] slams into his cervix.");
	if(pc.hasCuntTail()) output(" Feeling a little left out, your [pc.tailgina] stirs, swishing back and forth behind you before slipping around your waist to get a piece of the action. With a practiced, almost graceful movement, it slides its moist folds over Alex’s hip before rearing back and engulfing his cock in one smooth motion. Alex gasps, knees almost giving out from under him at the dual sensation of fucking and being fucked, but you manage to hold him up by his waist.");
	output("\n\nAfter this, you settle into a quick but steady rhythm, pulling him out and leaving him empty before filling him up again");
	if(pc.cockTotal() > 1 && pc.hasVagina())
	{
		output(", your extra dick");
		if(pc.cockTotal() > 2) output("s");
		output(" rubbing against his pussy-slicked balls and thighs while your own neglected cunt throbs with sympathetic need ");
		if(pc.wetness() >= 3) output(", soaking your thighs as well");
		output(".");
	}
	else if(pc.cockTotal() > 1) 
	{
		output(", your extra dick");
		if(pc.cockTotal() > 2) output("s");
		output(" rubbing against his pussy-slicked balls and thighs.");
	}
	else if(pc.hasVagina())
	{
		output(", your own neglected ");
		if(pc.vaginaTotal() == 1) output("pussy");
		else output("pussies");
		output(" throbbing with sympathetic need");
		if(pc.wetness() >= 3) output(" and soaking your thighs");
		output(".");
	}
 	output("\n\nHe’s probably not the best fuck in the galaxy but he has to be up there with the way he slams back into you in time to your thrusts and clenches around you");
 	if(pc.cocks[x].cLength() <= 5.5) output(" despite your size");
 	output(", almost like he’s milking your cock. You just about think you’re going to cum first until you hear him cry out, shuddering as his dick");
 	//no tailcunt:
 	if(!pc.hasTailCunt()) output(" spurts thick ropes of cum onto the sheets");
 	else output(" feeds thick ropes of cum into your hungry pussy tail");
 	output(" and his walls spasm wildly around you, wetting your thighs ");
 	if(pc.hasVagina() && pc.wetness() >= 3) output("even further ");
 	output("as he collapses forward onto the mattress. Looks like he’s a squirter too, on top of everything else. You follow shortly after him, ");
 	if(pc.cumQ() <= 40) {
 		if(!pc.hasKnot(x)) output("planting ");
 		else output("knot bulging as you plant ");
 		output("your seed deep in his pussy");
 	}
 	else if(pc.cumQ() <= 500) 
 	{
 		if(!pc.hasKnot(x)) output("unleashing ");
 		else output("knot swelling to full size as you unleash ");
 		output("gob after gob of thick [pc.cumNoun] inside of him");
 		if(!pc.hasKnot(x)) output(" until it starts to drip out around you");
 	}
 	else
 	{
 		output("unleashing such a massive, powerful torrent of [pc.cum] that his belly begins to round out, man-womb packed so full of your seed that he looks a few months pregnant");
 		if(!pc.hasKnot(x)) output(" even though most of it came rushing out around your cock");
 		else output(" thanks to your knot plugging his pussy so well that only a few thin streams can escape");
 	}
 	output(".");
 	output("\n\n<i>“Oh wow,”</i> he groans, rolling onto his back and panting, cum ");
 	if(pc.cumQ() <= 25) output("dripping");
 	else if(pc.cumQ() <= 500) output("streaming");
 	else output("gushing");
 	output(" from his snatch");
 	if(pc.hasKnot(x) && pc.cumQ() > 500) output(" as your knot slips out of him. Tentatively, almost gingerly, he runs a hand over the taut mound of his stomach");
 	else if(pc.hasKnot(x)) output(" as your knot slips out of him");
 	else if(pc.cumQ() > 500) output(" as he runs a hand over the taut mound of his stomach");
 	output(". <i>“You’re one hell of a fuck, [pc.name]. Shit. Give me a bit to recover - I’m gonna need it. Feel free to use the shower.”</i>");
 	output("\n\nYou get yourself cleaned up, retrieve your clothes, and head back to the bar.");
 	if(flags["FUCKED_ALEX"] == undefined) flags["FUCKED_ALEX"] = 0;
	flags["FUCKED_ALEX"]++;
 	processTime(30+rand(15));
 	pc.orgasm();
	pc.shower();
 	clearMenu();
 	addButton(0,"Next",mainGameMenu);
 }
 
 //OLD - Catch Vaginal
 public function catchVaginalFromAlex():void {
	clearOutput();
	author("RadicalBroseph");
	alexNameBustDiplay(true);
	var x:int = pc.cuntThatFits(20);
	if(x < 0) x = rand(pc.vaginas.length);
	output("You smile down at Alex and ");
	//if naga:
	if(pc.isNaga()) output("slither onto the bed to ");
	//if goo:
	else if(pc.isGoo()) output("slither onto the bed and envelop his thighs to ");
	//if biped:
	else output("climb on top of him, straddling his hips to ");
	output("position your womanly parts over his cock");
	if(pc.cockTotal() > 0) output(" while [pc.eachCock] stands proudly at attention");
	output(". He seems to catch on quickly enough, placing his manicured hands at the crests of your hips, though more to keep you steady than to take a leading role himself, it seems. With an agonizing slowness, you lower yourself down onto him, the lips of your [pc.vagina " + x + "] rubbing teasingly over his cock");
	if(pc.wetness(x) >= 3) output(" while your fluids sheath him in slick wetness before you’ve even taken him");
	output(". You can actually see him straining not to buck his hips or try to force you down onto him and you revel in it, savoring each moment as much as you can before it becomes too much for you and you drop down onto him with a wet slapping sound.");
	//(VAGINAL VIRGINITY/HYMEN CHECK)
	//Store virgin status first - it might come up later
	var isVirgin:Boolean = false;
	if(pc.vaginalVirgin) isVirgin = true;
	pc.cuntChange(x,20,true,true,false);
	//If tight:
	if(pc.vaginalCapacity(x) <= 25) 
	{
		output("\n\nAlex isn’t exactly big, or at least he isn’t one of the many behemoths you know are waiting out there, but he’s big enough to stretch you out. You can feel each and every vein and ridge on his cock and even the way it twitches slightly with his pulse as it fills you out deliciously");
		if(pc.hasCock()) output(", your [pc.cocks] twitching and leaking pre-cum over his stomach in sympathetic lust");
		if(pc.totalVaginas() > 1) 
		{
			output(" and even causing the walls of your unused ");
			if(pc.totalVaginas() == 2) output("snatch");
			else output("snatches");
			output(" to rub against each other wonderfully");
			output(".");
		}
	}
	//if medium:
	else if(pc.vaginalCapacity(x) <= 50) 
	{
		if(!isVirgin && pc.vaginalCapacity(x) >= 25) output("\n\nAlex’s isn’t exactly the biggest dick you’ve taken in your adventures, but he’s big enough to make you feel wonderfully filled, pressing against your walls in all the right ways");
		else output("\n\nAlex’s isn’t the biggest dick you’ve seen thanks to the extranet, but he’s big enough to make you feel wonderfully filled, pressing against your walls in all the right ways");
		//if herm:
		if(pc.hasCock())
		{
			output(" as your ");
			if(pc.cockTotal() == 1) output("cock twitches and leaks");
			else output("cocks twitch and leak pre");
			output(" over his stomach in sympathetic lust");
		}
		if(pc.totalVaginas() > 1)
		{
			output(" and even causing your unused ");
			if(pc.totalVaginas() == 2) output("snatch to feel full, its");
			else output("snatches to feel full, their");
			output(" walls rubbing against each other");
		}
		output(".");
	}
	//if gaped:
	else 
	{
		if(!isVirgin && pc.vaginalCapacity(x) >= 25) output("\n\nYou’ve seen some big cocks in your adventures, and in all honesty, Alex’s run of the mill, unenhanced human penis doesn’t really measure up. That doesn’t stop you from trying.");
		else output("\n\nYou’re built for bigger cocks than his, and in all honesty, Alex’s run of the mill, unenhanced human penis doesn’t really measure up. That doesn’t stop you from trying.")
		output(" Rolling your hips, you try to find a position where at least the head of his cock rubs against you and Alex, sensing your frustration and probably working through a bit of his own, tries to match you. Eventually the two of you settle on having you lie almost on top of him, supporting yourself on your elbows");
		if(pc.biggestTitSize() > 2) 
		{
			if(pc.hasCock())
			{
				output(", your breasts and [pc.cocks] sandwiched between the two of you, coating his chest in");
				if(pc.isLactating()) output(" your fluids");
				else output(" your pre-cum");
			}
			output(", your [pc.fullChest] sandwiched between your chests");
			if(pc.isLactating()) output(" and leaking your [pc.milk] all over him");
		}
		//if herm:
		else if(pc.cockTotal() > 1) output(", your [pc.cocks] sandwiched between you and getting pre everywhere");
		else if(pc.totalVaginas() > 1)
		{
			if(pc.totalVaginas() == 2) output(", though your unused snatch still feels");
			else output(", though your unused snatches still feel");
			output(" disappointingly empty");
		}
		output(".");
	}
	//if tailcock:
	if(pc.hasTailCock()) {
		output(" Your [pc.tailCock], seemingly feeling a bit left out, makes itself known, lashing about behind you before diving");
		//if naga:
		if(pc.isNaga()) output(" around your snakelike form");
		else if(pc.isGoo()) output(" around your amorphous lower half");
		else if(pc.isTaur()) output(" under your belly");
		else output(" under your [pc.butt]");
		output(" to plunge into Alex’s waiting cunt, causing him to buck in surprise and drive his cock deeper into you in turn.");
	}
	output("\n\nMoaning, you brace yourself and begin to bounce up and down on your lover’s cock, ");
	if(pc.wetness(x) < 3) output("feeling it in exquisite detail as it passes through your walls and netherlips");
	else output("enjoying the wet squish-squish-squish each movement brings");
	output(".");
	if(pc.biggestTitSize() >= 1)
	{
		//if breasts: 
		output(" Your tits ");
		if(pc.biggestTitSize() <= 2) output("jiggle with a slight, but satisfying weight");
		else if(pc.biggestTitSize() <= 5) output("bounce wildly and slap against your chest with a satisfying heft");
		else output("threaten to smack you in the face");
		if(pc.hasCock()) output(", and your");
	}
	else if(pc.hasCock()) output(" Your");
	if(pc.hasCock())
	{
		output(" [pc.cocks] slap");
		if(pc.cockTotal() == 1) output("s");
		output(" against his stomach wetly");
	}
	output(" as you move faster and faster, moaning ecstatically as Alex thrusts up each time to meet you on the way down.");
	output("\n\nYou’re close, you’re very close ");
	//if tight:
	if(pc.vaginalCapacity(x) <= 25) output(", and you’re sure you’re going to come first. Doubly so when Alex reaches down and");
	//if medium or gaped:
	else 
	{
		output(", but you’re a little disappointed to note that it seems like Alex is going to come first, at least until he reaches down and");
	}
	if(pc.hasCock()) output(" starts to jack off [pc.oneCock]");
	else if(pc.hasClit()) output(" starts to play with [pc.oneClit]");
	else output(" starts to play with your folds");
	output(". Slamming your hips down onto his one last time, you come, hard");
	if(pc.hasCock() && pc.hasTailCock()) output(", your [pc.cocks] and tail-cock");
	else if(pc.hasCock()) output(", your [pc.cocks]");
	else if(pc.hasTailCock()) output(", your tail-cock");
	if(pc.hasCock() || pc.hasTailCock()) 
	{
		output(" following shortly after");
		if(pc.hasCock())
		{
			//low cum quantity:
			if(pc.cumQ() < 25) output(", spattering his chest with [pc.cum]");
			//medium cum quantity:
			else if(pc.cumQ() <= 150) output(", painting his chest with your [pc.cum]");
			else output(", thoroughly coating him in your copious [pc.cum]");
		}
	}
	output(". The orgasmic rippling of your [pc.vaginas]");
	if(pc.hasTailCock()) output(" combined with the sensation of hot cum filling his cunt");
	output(" is enough to send him over the edge, moaning and arching his back as his seed spurts up inside of you, painting your insides white.");
	output("\n\n<i>“Oh wow,”</i> he groans, panting as you roll off of him. <i>“You’re one hell of a fuck, [pc.name]. Shit. Give me a bit to recover - I’m gonna need it. Feel free to use the shower.”</i>");
	output("\n\nYou get yourself cleaned up, retrieve your clothes, and head back to the bar.");
	if(flags["FUCKED_ALEX"] == undefined) flags["FUCKED_ALEX"] = 0;
	flags["FUCKED_ALEX"]++;
	processTime(30+rand(15));
 	pc.orgasm();
	if(pc.hasVagina()) pc.loadInCunt(getAlexPregContainer(), x);
 	clearMenu();
	pc.shower();
 	addButton(0,"Next",mainGameMenu);
}
//OLD - Catch Anal
public function catchAnalFromAlex():void {
	clearOutput();
	alexNameBustDiplay(true);
	author("RadicalBroseph");
	//if taur or some kind of caterpillar thing:
	if(pc.isTaur()) output("You straighten up, leaving Alex lying on the bed, then pull a graceful about-face, turning so your [pc.butt] faces him, and glance over your shoulder as you sway your [pc.hips] seductively.");
	//if biped, naga, goo, tripod: 
	else output("You roll over, off of Alex and onto your stomach again, wriggling your hips seductively as you reach back to pull the cheeks of your [pc.butt] apart and put your [pc.asshole] on full display.");
	//If PC has vagina:
	if(pc.hasVagina()) 
	{
		output("\n\nAlex seems a little confused by the gesture, but he stands up and grabs your waist, getting himself into position");
		output("\n\n<i>“Are you sure?”</i> he asks. <i>“I’ve always thought assplay was, I don’t know, less fun. There’s a reason I saved up for years to get myself a pussy of my own");
		if(pc.ass.looseness() >= 4) output(". Looks like you’d know better than me from the looks of things, though");
		output(".”</i> You reassure him that you can absolutely have as much fun with your ass as you can with your cunt, if not more.");
	}
	//If PC male or unsexed:
	else
	{
		output("\n\nAlex grins, standing up and grabbing waist to get himself into position.");
		output("\n\n<i>“Well, alright then,”</i> he says, reaching down between his legs to gather up a handful of the slick moisture already drenching his thighs at your lewd display. With a practiced hand, he spreads his self-made lubrication over his cock, giving it a few quick strokes before");
		if(pc.buttRating() <= 5) output(" placing his hands on your hips again");
		else output(" spreading your cheeks apart");
		output(" and lining himself up with your entrance.");
	}
	//if tight asshole:
	if(pc.ass.looseness() < 2) 
	{
		output("\n\nYou brace yourself, willing yourself to relax and accept the penetration. Alex’s copious juices ease the process a bit, but thanks to how tight you are it’s still slow and just on the right side of painful. After what feels like an eternity of being stretched around him he finally hilts himself, his balls coming to rest gently against your ");
		if(pc.hasVagina()) output("[pc.vaginas]");
		else if(pc.hasCock()) output("taint");
		else output("featureless crotch");
		output(".");
	}
	//if medium asshole:
	else if(pc.ass.looseness() < 4) 
	{
		output("\n\nYou relax, readying yourself for the coming fuck, and thanks to Alex’s copious juices he’s able to slide in with one swift motion, hilting himself inside of you with his balls slapping against your ");
		if(pc.hasVagina()) output("[pc.vaginas]");
		else if(pc.hasCock()) output("taint");
		else output("featureless crotch");
		output(".");
	}
	//if gaped asshole:
	else
	{
		output("\n\nYou’re more than ready to be filled and let Alex know, slamming your [pc.butt] back against his hips as soon as he gets his head in, your ");
		if(pc.hasVagina()) output("[pc.vaginas]");
		else if(pc.hasCock()) output("taint");
		else output("featureless crotch");
		output(" slapping against his balls. He yelps, doubling over slightly for a moment before recovering.");
	}
	//(ANAL VIRGINITY CHECK)
	pc.buttChange(20,true,true,false);
	output("\n\n<i>“Shit,”</i> he hisses through gritted teeth, clinging to your [pc.hips] as if for dear life. <i>“You’re so ");
	if(pc.ass.looseness() < 2) output("hot and tight");
	else output("hot");
	output(".”</i> You look back over your shoulder at him and ask if he’s just going to stand there or if he’s going to fuck you. Grunting, he buckles down and gets to moving his hips, slowly at first, but gradually picking up speed at your encouragement. Leaning back into his every thrust, you moan encouragements to him, urging him faster and faster until his hips meet yours again and again at a feverish pace.");
	//If biped/naga/goo/tripod and breasts > B cup:
	if(!pc.isTaur() && pc.biggestTitSize() >= 2) {
		output("\n\nYour breasts ");
		//B-C cup:
		if(pc.biggestTitSize() <= 3) output("bounce freely");
		else if(pc.biggestTitSize() <= 10) output("sway pendulously");
		else if(pc.biggestTitSize() <= 25) output("swing back and forth heavily");
		else output("rest on the mattress");
		output(" beneath you, ");
		if(pc.isLactating()) output("making the sheets wet and sticky with your [pc.milk]");
		else output("adding greatly to the wild ride");
		if(pc.biggestTitSize() > 25) output(" as your [pc.nipples] rub against the bedspread");
		output(".");
	}
	//if tailcock: 
	if(pc.hasCockTail()) output("\n\nAs if roused from its slumber by all this vigorous activity, your [pc.tail] rises to attention, swishing back and forth briefly before snaking around Alex’s hip and plunging deep into his neglected cunt, which only serves to spur him on to greater speeds as he shudders and moans.");
	//if herm: 
	if(pc.hasCock() && pc.hasVagina()) {
		output("\n\nYour mixed sexual juices drip onto the sheets with every thrust as you’re overwhelmed by the dual sensations of Alex’s balls slapping against your [pc.vaginas] and his cock rubbing against your prostate over and over again.");
	}
	//if female:
	else if(pc.hasVagina()) {
		output("\n\nYour juices coat his balls and your thighs ");
		if(pc.wetness() >= 3) output(", dripping onto the sheets with every thrust and you gasp, hardly able to stand it all.");
	}
	//if male:
	else if(pc.hasCock())
	{
		output("\n\nYour cock ");
		if(pc.cumQ() <= 500) output("drips");
		else output("streams");
		output(" pre onto the sheets with every thrust, the pressure on your prostate almost too much to bear.");
	}
	//if unsexed:
	else {
		output("\n\nYour [pc.asshole] clenches and unclenches with every thrust, the sensations coming from your sensitive ring being ");
		if(pc.ass.looseness() <= 2) output("stretched so much");
		else output("fucked so well");
		output(" almost too much to bear.");
	}
	output(" Alex seems to feel the same, his moans growing breathier and his thrusts more uneven as his manicured fingernails dig into your [pc.skin] slightly. Before you know it he’s cumming, thrusting into you with one final, loud slap of skin against skin and emptying his balls into your waiting ass");
	if(pc.hasTailCock()) output(", his cunt drooling and clenching around your [pc.tailCock]");
	else output(", his neglected cunt drenching his thighs");
	output(". The sensation of all that thick, hot hermspunk painting your insides white is enough to send you over, ");
	
	if(pc.hasCock() && pc.hasVagina())
	{
		output("your own [pc.vaginas] spasming wildly");
		if(pc.wetness() >= 3) output(" and adding to the growing pool of pussy juices accumulating around Alex’s knees on the bed");
		output(" while your [pc.cocks] gush [pc.cum] all over the sheets");
		if(pc.cumQ() >= 400) output(" and puddling around your [pc.feet]");
		output(".");
	}
	if(pc.hasVagina()) {
		output("your own [pc.vaginas] spasming wildly");
		if(pc.wetness() >= 3) output(" and adding to the growing pool of pussy juices accumulating around Alex’s knees on the bed");
		output(".");
	}
	//if male:
	else if(pc.hasCock())
	{
		output("your own [pc.cocks] gushing your [pc.cum] all over the sheets");
		if(pc.cumQ() >= 400) output(" and puddling around your [pc.feet]");
		output(".");
	}
	//if unsexed:
	else output("your ass squeezing Alex’s cock like a vice, trying to milk him for every last drop of cum he can give before finally relaxing.");
	output("\n\n<i>“Oh wow,”</i> he groans, panting as he collapses onto the bed beside you");
	if(pc.hasTailCock()) output(", your [pc.tailCock] finally slipping out of him");
	output(". <i>“You’re one hell of a fuck, [pc.name]. Shit. Give me a bit to recover - I’m gonna need it. Feel free to use the shower.”</i>");
	pc.shower();
	output("\n\nYou get yourself cleaned up, retrieve your clothes, and head back to the bar.");
	if(flags["FUCKED_ALEX"] == undefined) flags["FUCKED_ALEX"] = 0;
	flags["FUCKED_ALEX"]++;
	processTime(30+rand(15));
 	pc.orgasm();
	pc.loadInAss(getAlexPregContainer());
 	clearMenu();
 	addButton(0,"Next",mainGameMenu);
}
*/