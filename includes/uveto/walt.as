// Added to The Freezer off business hours after having participated in the office gangbang
public function waltAvailableAtBar():Boolean
{
	return (!steeleBiomedBusinessHours() && flags["BIOMED_GANGBANGED"] != undefined && !pc.hasStatusEffect("Walt Cooldown"));
}
public function waltAtTheFreezer(btnSlot:int = 0):void
{
	output("\n\nYou see the wolfman, Walt, sitting at a table, nursing a drink. He sniffs the air as you enter, looking up in your direction.");
	// [Walt] Go to Walt Talk Menu
	addButton(btnSlot, "Walt", approachWalt);
}

public function approachWalt():void
{
	clearOutput();
	showBust("WALT");
	showName("\nWALT");
	author("Couch");
	
	output("<i>“Oh, [pc.name]. Here for a drink?”</i> Walt’s still wearing his officewear, though considerably less buttoned up. With his shirt unbuttoned you can see he’s got a silver necklace on underneath.");
	
	processTime(1);
	
	if(flags["MET_WALT"] == undefined) flags["MET_WALT"] = 1;
	
	waltBarMenu();
}

// Walt Talk Menu
public function waltBarMenu():void
{
	clearMenu();
	addButton(0, "Lessau", waltTalk, "lessau", "Lessau", "Ask Walt about his boss.");
	addButton(1, "Himself", waltTalk, "himself", "Himself", "Ask Walt about himself and his coworkers.");
	if(pc.hasGenitals() && flags["WALT_HIMSELF"] != undefined)
	{
		addButton(2, "Necklace", waltTalk, "necklace", "Necklace", "Ask Walt about the necklace he’s wearing.");
		if(pc.lust() < 33) addDisabledButton(3, "Sex", "Sex", "You are not aroused enough for this!");
		else addButton(3, "Sex", waltSex);
	}
	else if(pc.hasGenitals())
	{
		addDisabledButton(2, "Necklace", "Necklace", "You should get to know Walt better before asking something so personal.");
		addDisabledButton(3, "Sex", "Sex", "You should get to know Walt better before doing that.");
	}
	else
	{
		addDisabledButton(2, "Necklace", "Necklace", "You should get to know Walt better before asking something so personal.");
		addDisabledButton(3, "Sex", "Sex", "You need genitals to do this!");
	}
	addButton(14, "Back", mainGameMenu);
}
public function waltTalk(topic:String = "none"):void
{
	clearOutput();
	showBust("WALT");
	showName("\nWALT");
	author("Couch");
	
	waltBarMenu();
	
	switch(topic)
	{
		// Lessau
		case "lessau":
			output("You ask Walt if he wouldn’t mind telling you more about his boss and how they met.");
			output("\n\n<i>“I’m not sure how much there is to tell. Cynthia’s been with the doc a few more years than I have. He scouted me out from under JoyCo, said he liked my work on some of their therapeutic systems and wanted me for his. Giving up the stability of JoyCo was a hard sell, but... well, when he said he also wanted to follow up on my thesis work that sealed the deal.”</i>");
			output("\n\n<i>“What was your thesis?”</i> you ask, prompting Walt to gesture at himself.");
			output("\n\n<i>“Wolf transformatives. You can get it from the doc, if you ask him for Lupinol.”</i>");
			
			// [Next] Unlock Lupinol at Lessau’s shop
			if(flags["MET_WALT"] == undefined || flags["MET_WALT"] < 2) flags["MET_WALT"] = 2;
			
			processTime(2);
			
			addDisabledButton(0, "Lessau");
			break;
		// Himself
		case "himself":
			output("You ask Walt to tell you more about himself. Just asking the question prompts a look of discomfort.");
			output("\n\n<i>“It’s not a story I enjoy telling... but if you insist.”</i> Walt takes a deep breath to steady himself.");
			output("\n\n<i>“My original name’s Waltaan, I was born an ausar. I changed it after going to college. Don’t spread it around.”</i>");
			output("\n\n<i>“Why’d you change it?”</i> you ask");
			if(flags["MET_EMMY"] != undefined) output(", though it’s not the first time you’ve heard of this with modded ausar");
			output(".");
			output("\n\n<i>“It’s different " + (pc.originalRace = "human" ? "for you humans" : "growing up among humans") + ". There’s no real stigma against transformative use - humans mod themselves more often and more thoroughly than any other race. It’s different for ausar: if you’re a girl who wants to get a dick, or a guy who wants to try out being a girl, nobody minds, but as soon as you want to adjust your species you start getting looks. Even here with the huskar, those modifications are only really accepted because they needed them to survive, and because they’re minor. Most of us who want to do more than that have to go off-planet, change our names, and hope nobody we know recognizes us.”</i>");
			output("\n\nWalt looks like he could say more, but stops himself and lets out a growling sigh. <i>“Sorry to rant, it’s a sore spot.”</i>");
			
			processTime(2);
			
			flags["WALT_HIMSELF"] = 1;
			
			waltBarMenu();
			addDisabledButton(1, "Himself");
			break;
		// Necklace
		case "necklace":
			output("<i>“What’s with the necklace?”</i> you ask as you point out the chain under Walt’s shirt. The wolf sighs and pulls the chain all the way out to show you the cross dangling from the chain.");
			output("\n\n<i>“Didn’t take you for a follower of the Church of the One God. Aren’t they huge opponents of mods?”</i>");
			output("\n\n<i>“They are, and I’m not. Religions aren’t monolithic, [pc.name]. They all have sects, some more liberal in their views than others. In this particular case...”</i>");
			output("\n\nWalt lifts the cross to show you that despite its plain silver appearance, as he turns it back and forth a subtle pattern of colors plays over the surface.");
			output("\n\n<i>“One tapestry, many colors. The One gave us minds that could understand the world so that we might better ourselves, and in doing so better serve others. It’s our responsibility to find the shape that suits who we are within. That’s the belief of the Order of the Incarnate Soul. I trust you can see the appeal.”</i>");
			output("\n\nWalt puts his necklace away and takes a sip of his drink. <i>“Religion is like anything else, [pc.name], it has good and bad parts. There’s nothing wrong with believing in something, as long as it doesn’t become the only thing you believe. The Order was there for me when I needed support, so I choose to believe in them.”</i>");
			
			processTime(2);
			
			addDisabledButton(2, "Necklace");
			break;
	}
}

// Create Walt
public function getWaltPregContainer():PregnancyPlaceholder
{
	var ppWalt:PregnancyPlaceholder = new PregnancyPlaceholder();
	if(!ppWalt.hasCock()) ppWalt.createCock();
	ppWalt.shiftCock(0, GLOBAL.TYPE_CANINE);
	ppWalt.cocks[0].cockColor = "black";
	ppWalt.cocks[0].cLengthRaw = 6;
	ppWalt.cocks[0].cThicknessRatioRaw = 1;
	ppWalt.balls = 2;
	ppWalt.ballSizeRaw = 4;
	ppWalt.createPerk("Fixed CumQ", 800, 0, 0, 0);
	return ppWalt;
}
// Wolfie wiener size
public function walkCockVolume():Number
{
	var ppWalt:PregnancyPlaceholder = getWaltPregContainer();
	return Math.max(ppWalt.cockVolume(0) , 300);
}

public function waltSex(arg:Array = null):void
{
	clearOutput();
	showBust("WALT");
	showName("\nWALT");
	author("Couch");
	clearMenu();
	
	if(arg == null) arg = [];
	var response:String = (arg.length >= 1 ? arg[0] : "intro");
	var vIdx:int = (arg.length >= 2 ? arg[1] : -1);
	var ppWalt:PregnancyPlaceholder = null;
	
	switch(response)
	{
		// Sex Intro
		case "intro":
			output("A naughty thought occurs to you and you indulge it, reaching out to scratch Walt behind the ears. The wolf reacts with a surprised whine, shuddering as you tease him with your fingertips.");
			output("\n\n<i>“Oh, even more sensitive than most ausar, are you?”</i> you ask with a playful grin, scratching a bit harder. Walt can only give a groaning growl, helpless to stop you from letting your other hand roam over his well-toned chest. Soon enough that hand dips lower, and your grin broadens as your fingers brush over a growing tent in his pants.");
			output("\n\n<i>“Ooh, you naughty boy.”</i> You glance around, seeing if anyone’s paying attention to the two of you. So far Walt’s growls haven’t been audible over the ambiance of the bar; you can definitely get away with more than this. Now, how to take advantage?");
			
			processTime(1);
			
			addButton(0, "Anal Ride", waltSex, ["anal ride"], "Anal Ride", "Plant your ass in Walt’s lap and have him bury his bone.");
			if(!pc.hasCock()) addDisabledButton(1, "Table Suck", "Under Table Suck", "You need a penis for this.");
			else addButton(1, "Table Suck", waltSex, ["table suck"], "Under Table Suck", "Make Walt get under the table and service your dick orally.");
			if(!pc.hasVagina()) addDisabledButton(2, "Table Lick", "Under Table Lick", "You need a vagina for this.");
			else addButton(2, "Table Lick", waltSex, ["table lick"], "Under Table Lick", "Make Walt get under the table and service your cunt orally.");
			break;
		// Anal Ride
		case "anal ride":
			output("You keep your hand scratching Walt’s ears to distract him while you");
			if(!pc.isCrotchExposed()) output(" open up your [pc.lowerGarment]. You");
			output(" slide into his lap, pressing yourself down against the bulge in his pants. This gets his attention through the haze of scratching-induced pleasure, the wolf grunting at the sudden weight in his lap. It’s just as well, since you need to stop scratching to get his pants open. His canine cock is already at half mast as it slips out, and your fingers brushing over his tip take care of the rest in short order. A distinctive scent hits your nose as soon as his cock emerges, a sort of honey-glazed meat scent that blends sweetness with masculine potency.");
			if(pc.hasVagina()) output(" Your pussy is simmering with excitement at the thought of being stuffed out in public, but it’s going to have to wait its turn; you have a different hole in mind.");
			output("\n\nYou turn around to face away from Walt and grasp his cock with a hand, guiding it to your waiting backdoor. You’re delighted to find he’s pre-lubed with some sort of light glazing, perhaps the source of his exceptional scent, and a soft coo slips from your lips as the pointed tip of his shaft slips readily into your [pc.asshole]. You let your weight do the work of carrying you down, your ass hungrily swallowing inch after inch of crimson cock. Finally you settle comfortably into Walt’s lap, his knot just the right size to press snugly against your tailhole but not quite push inside.");
			
			pc.buttChange(walkCockVolume());
			
			output("\n\n<i>“Goooood boy.”</i> you purr. <i>“Order us a round, would you?”</i>");
			output("\n\nWalt obeys, letting you soak in the thrill of sitting in public with a cock firmly wedged up your ass. The heady grin plastered on your face makes the waiter give you a curious look, but if he suspects what you’re doing he doesn’t say anything. You sip at your drink slowly, enjoying rhythmically clenching your ass around that big fat dog dick. You guide one of Walt’s hands down under the table");
			if(pc.isMale() || (pc.isHerm() && rand(2) == 0)) output(" so he can wrap his hand around [pc.oneCock], stroking your dick while you ride his.");
			else output(" to have him slip his fingers into [pc.oneCunt], quickly soaking them in your [pc.girlCum].");
			if(pc.hasBreasts())
			{
				output(" His other hand goes");
				if(!pc.isChestExposed()) output(" under your [pc.upperGarment]");
				output(" to your [pc.chest], clawtips teasing and caressing your tits with a little more assertiveness as he gets more into what you’re doing.");
			}
			output("\n\nNow you start working your hips, finding a motion that’s subtle enough to avoid excessive attention... well, probably. It gets harder to care about being noticed as you bask in the glory of riding a cock out in public,");
			if(pc.hasCock()) output(" your dick slapping against the underside of the table while leaking thick spurts of precum");
			if(pc.isHerm()) output(" and");
			if(pc.hasVagina()) output(" your pussy gushing with envy");
			output(". Your ass is awash in pleasure, and combined with the heady thrill of exhibitionism you don’t need much stimulation at all to feel like you’ll cum at any moment.");
			output("\n\n");
			if(pc.hasVagina()) output("[pc.OneCunt] clenches tight and soaks Walt’s sheath beneath you in [pc.girlCum]. ");
			if(pc.hasCock()) output("You douse the underside of the table in [pc.cumNoun] as it gushes from [pc.oneCock]. ");
			if(pc.hasBreasts() && pc.canMilkSquirt()) output("Even your tits leak squirts of [pc.milkNoun] between Walt’s fingers as your pleasure peaks. ");
			output("You let out a loud, shuddering moan, no longer caring in the slightest if everyone watches you cum. Behind you you hear Walt let out a suppressed growl as he shoots his load, filling your ass with long, thick spurts of lupine spunk that serve as the perfect capstone to your own orgasm.");
			output("\n\n<i>“Yesssss,”</i> you purr, <i>“give it to me. </i>Good<i> wolfie.”</i>");
			output("\n\nWalt’s too focused on cumming and growling to respond. His knot swells between your buns, pressed firmly up against your [pc.asshole] without quite stretching it open.");
			if(pc.analCapacity() >= (walkCockVolume() + 200)) output(" You’re almost tempted to see if you can push down hard enough with your hips to shove it in, though getting it back out would be enough of a hassle to dissuade you.");
			output("\n\nYou look around to see most of the patrons around you looking surprised, amused, aroused, or some combination of the three. Thankfully none seem interested in notifying the owners, and you don’t see anyone coming to throw you out. You give your audience an appreciative grin as you pull off Walt’s lap and slip your gear back on.");
			output("\n\n<i>“Make sure you hide that.”</i> you tease as you glance indicatively at Walt’s still-erect dick, before taking your leave with a thrilled sway in your step and your ass clenched to hold onto the cum inside you.");
			if(pc.exhibitionism() >= 33)
			{
				if(pc.exhibitionism() < 66) output(" Who knew public sex could be such a rush?");
				else output(" Stars, there’s nothing like fucking in public to get your blood pumping.");
			}
			
			processTime(28);
			
			ppWalt = getWaltPregContainer();
			pc.loadInAss(ppWalt);
			pc.orgasm();
			pc.exhibitionism(1);
			
			addButton(0, "Next", waltSexFinish);
			break;
		// Under Table Suck
		case "table suck":
			output("You keep one hand scratching Walt’s ears as the other");
			if(!pc.isCrotchExposed()) output(" sets to opening up your [pc.lowerGarment]. This done, it");
			output(" rubs at your loins, helping [pc.oneCock] grow to full stiffness");
			if(pc.hasVagina()) output(" and [pc.oneCunt] turn slick with fresh [pc.girlCumNoun]");
			output(". Walt doesn’t notice until you gently push down with your hand on his head, guiding the wolf down under the table.");
			output("\n\n<i>“Lick,”</i> you tell him as you release your hand. Walt obeys, slipping his long canine tongue out to run over your cock. You give a soft coo at the strong, wet muscle running over the underside of your dick from [pc.base] to [pc.cockHead]. <i>“That’s right, good boy.”</i>");
			output("\n\nWalt takes a few more licks,");
			if(pc.hasVagina()) output(" both of [pc.oneCock] and the feminine slit tucked underneath until the former is stiff and ready");
			else output(" running his tongue over your [pc.cockHead] to help get you ready");
			output(". Walt’s lips part, and you let out a groan as [pc.oneCock] is enveloped in the ausar’s warm, wet mouth. His long muzzle lets him easily take you to the hilt, swallowing inch after inch of dick until his nose brushes against your stomach.");
			output("\n\n<i>“Mmmm, thaaaat’s it,”</i> you purr, <i>“that’s a </i>good<i> wolfie. Suck my cock just like that.”</i> You brush off thoughts of being overheard; being sucked off in public like this is just too much fun not to relish with a little dirty talk.");
			output("\n\nWalt’s tongue slides back and forth along the underside of your dick, making you shudder with pleasure at just how long and strong it is. You start scratching his ears again as your other hand");
			if(pc.hasBreasts()) output(" slips up to your [pc.chest] for a little rubbing. You keep it slow, doing your best");
			else output(" rests on the table and does its best");
			output(" not to betray your pleasure to those around you. It’s not working especially well, and more than a few of your fellow patrons are now watching you get blown under the table. Thankfully none seem interested in spoiling the show, and you even catch a few hands slipping under the other tables. You’re not interested in that right now, of course, focused instead on the glorious lupine blowjob going on in your lap.");
			output("\n\nFinally you let out a shuddering moan as your [pc.balls] " + (pc.balls < 2 ? "tighten" : "tightens") + ", unable to hold back the tide of [pc.cumColor] seed ready to spill forth from your [pc.cockHead]. Somewhere in the throes of your orgasm you hear Walt give a muffled whine as he starts gulping down your [pc.cumNoun].");
			output("\n\n<i>“Oh yeaaah...”</i> you groan exultantly, no longer caring who hears. <i>“Drink it </i>all<i> down. </i>Good<i> wolfie.”</i>");
			output("\n\nWalt obeys, even making sure to lick and suck you clean before he lets go, visibly panting. You give him a playful but appreciative smirk, getting up to let him out from under the table while you get ready to leave.");
			output("\n\n<i>“Very good boy.”</i> you tease as you look over your shoulder. <i>“Maybe next time I’ll let you bury your bone.”</i>");
			
			processTime(18);
			pc.orgasm();
			pc.exhibitionism(1);
			
			addButton(0, "Next", waltSexFinish);
			break;
		// Under Table Lick
		case "table lick":
			output("You keep one hand scratching Walt’s ears as the other");
			if(!pc.isCrotchExposed()) output(" sets to opening up your [pc.lowerGarment]. This done, it");
			output(" rubs at your loins, helping");
			if(pc.hasCock()) output(" [pc.oneCock] grow to full stiffness and");
			output(" [pc.oneCunt] turn slick with fresh [pc.girlCumNoun].");
			
			vIdx = rand(pc.vaginas.length);
			
			output("\n\nWalt doesn’t notice until you gently push down with your hand on his head, guiding the wolf down under the table.");
			output("\n\n<i>“Lick,”</i> you tell him as you release your hand. Walt obeys, slipping his long canine tongue out to run over your cunt. You croon at the strong, wet muscle running up the length of your slit, cresting over your " + (pc.vaginas[vIdx].clits == 1 ? "clit" : "clits") + " at the apex of its motion. <i>“Yessss, just like that.”</i>");
			output("\n\nWalt starts lapping gently at the surface of your snatch, letting the repeated pressure do the work of slowly coaxing your petals apart to bare the glistening [pc.vaginaColor] within. His licking is so steady and gentle that you can’t help but purr, relishing a comparable feeling to when you tease yourself with your fingers so nice and slow that you’ll never cum, allowing you to baste in pleasure for hours on end. <i>“Oh yes, that’s a </i>good<i> wolfie. Lick my cunny just like that.”</i>");
			output("\n\nHe obeys, at least until you start really getting wet. The [pc.girlCumFlavor] taste of your leaking [pc.girlCumNoun] seems to spur the ausar to more eager action, prompting him to speed up until that canine tongue is drilling deep into your cunt. You stifle a gasp, trying not to be overheard yet when you’ve only just started. You’re sure the patrons around you are noticing by now.");
			output("\n\nThe sudden reversal makes it a difficult challenge, as Walt begins showing you the advantages of being a fully-fledged werewolf. His jaws open to allow more of his tongue into your depths, his upper teeth brushing over");
			if(!pc.hasCock()) output(" your delta");
			else output(" the underside of your male endowments");
			output(" while his lower lips slide down, across your taint and all the way down until his fangs slide along the underside of your [pc.ass]. The tickling sensation adds giggles to the noises you’re trying to suppress, and the extra few inches of tongue are just enough to let it brush over spots you’d normally need a cock or a good dildo for.");
			output("\n\n<i>“G-Good...”</i> you say with a shiver, your hand scratching his ears on reflex now, <i>“good, </i>good<i> wolfie!”</i>");
			output("\n\nThe praise spurs Walt on, and you let out a moan you’re sure more than a few patrons hear even over the noise of the tavern. Fuck it, getting your cunt licked in public like this just feels way too good to care about little things like that.");
			if(pc.biggestTitSize() >= 4 && pc.isLactating()) output(" You lift one of your tits to your lips, muffling yourself by sucking on your nipple. Close enough, and it comes with [pc.milkNoun] to focus on gulping down to help keep you steady as Walt’s eating you out.");
			output("\n\nYou do your best to hold out against the building pressure in your loins, but eventually the tongueplay is just too much to resist. You let go of Walt’s head");
			if(pc.biggestTitSize() >= 4 && pc.isLactating()) output(" and your breast");
			output(" and let out a loud groan as you cum, juicing your tunnel with [pc.girlCumNoun] that swiftly disappears into Walt’s eager mouth.");
			if(pc.hasCock()) output(" A thick gout of [pc.cumNoun] spurts from your dick over his head, narrowly missing his ears to instead paint the underside of the table.");
			
			processTime(12);
			pc.orgasm();
			pc.exhibitionism(1);
			if(pc.biggestTitSize() >= 4) pc.milkInMouth(chars["PC"]);
			
			if(pc.exhibitionism() >= 66) addButton(0, "More", waltSex, ["lick more", vIdx], "More", "You’re not going to be satisfied until you walk out of here with a belly full of wolf cum!");
			else addDisabledButton(0, "More", "More", "You’d have to be some kind of exhibitionist to want to keep going with all this attention.");
			addButton(1, "Enough", waltSex, ["lick enough", vIdx], "Enough", "Thank Walt for the licking.");
			break;
		// More
		case "lick more":
			output("The orgasm is satisfying, but your cunny’s craving more, spurred on by the exhibitionistic thrill of doing this in a crowded tavern. Fuck it, go big or go home. As soon as Walt’s finished licking you clean, you turn around in your chair, getting on your knees with your [pc.chest] leaning over against the back of the seat.");
			output("\n\n<i>“You’ve been a </i>very<i> good wolfie,”</i> you purr as you look over your shoulder, giving Walt an inviting smirk. <i>“Time to bury that bone of yours.”</i>");
			output("\n\n");
			if(flags["WALT_LICK_EXHIBITIONISM"] == undefined) output("Walt’s surprised at your boldness");
			else output("Walt gives a defeated sigh at your exhibitionism");
			output(", looking around to make sure the coast is clear. You flash a grin at the couple in front of you, knowing you’re about to give them dinner and a show.");
			output("\n\nWalt’s furry hands grasp you just above your hips as he mounts you, one hand briefly letting go again to help guide his canine tip into your waiting nether lips. You let out an exultant groan as inch after inch of fat crimson cock slides into your greedy cunt, slowly enough for you to be able to relish the decadence of what you’re doing. He has the good sense to put a hand over your mouth as you finish taking him to the hilt, preventing you from letting out a louder moan at the sensation of his balls slapping against your delta and his furry sheath pressing against your pussy lips.");
			
			pc.cuntChange(vIdx, walkCockVolume());
			
			output("\n\nWalt gives a soft growl as he starts fucking you, starting off just as slowly as the initial penetration so that you don’t start raising your voice too much. It’s still completely obvious to everyone around you what you’re doing, and that makes your [pc.girlCum] come in torrents, every eye on you getting you wetter and wetter still.");
			output("\n\n<i>“Good boy,”</i> you half-whisper, a heady grin on as you look behind you at the werewolf pounding your pussy. <i>“Fuck me just like that, let everyone see what a good, naughty wolfie you are.”</i>");
			output("\n\nWalt responds with another growl, a bit louder this time as he picks up the pace little by little. Both of his hands have fallen back to your hips now, allowing you to moan and croon as much as you like. You don’t go overboard, but it wouldn’t take much to hear you over the crowd now, especially with so many of those nearby now focused on you, watching you get fucked, watching you get railed by a hot, dirty wolf dick in full view. Void, public sex is just the <i>best</i>!");
			output("\n\nYou don’t want it to end, even as you feel Walt’s balls churning with fresh seed every time they slap against your body, those furry nuts full to bursting and ready to blow. You opt to do the next best thing and egg him on, moving your own hips a bit to help strengthen those last few thrusts.");
			output("\n\n<i>“Come on, wolfie, nut in this horny [pc.race], you know you want to. Give me the knot!”</i>");
			output("\n\nWalt manages not to obey, and even succeeds in choking back what’s still clearly a howl as he cums, his knot pulling away just in the nick of time to avoid tying you. It’s a disappointment to be sure, but the sensation of steaming hot werewolf spunk flooding your twat is a perfect consolation prize. It comes out around the sides of his dick in a frothy mixture with your [pc.girlCumNoun], the wolf having plenty enough volume to both satisfy your womb and leave your pussy good and messy.");
			output("\n\n<i>“Ooooh...”</i> you groan as Walt pulls out, promptly sliding back towards his own chair. You take the opportunity to wag your hips a bit, showing off your cum-bubbling cunt. <i>“You naughty boy.”</i>");
			output("\n\nWalt just gives a groaning growl in response, already working on getting his dick back in his pants before the staff can come by and notice. You opt to take your time a little, flashing Walt a cheeky grin and ensuring those who’ve been watching the show get a good look at the results before you settle down.");
			output("\n\nSoon enough you slip your gear back on and get ready to leave, but not before giving Walt one last ear-scratching firm enough to leave him a little dazed as you walk away, hips swaying and pussy steaming with the cum that’s left slowly trickling down your thighs. There’s nothing like a good public fuck to get you itching for your next adventure.");
			
			processTime(16);
			
			ppWalt = getWaltPregContainer();
			pc.loadInCunt(ppWalt, vIdx);
			pc.orgasm();
			pc.exhibitionism(1);
			
			IncrementFlag("WALT_LICK_EXHIBITIONISM");
			
			addButton(0, "Next", waltSexFinish);
			break;
		// Enough
		case "lick enough":
			output("You put your hand back on Walt’s head to give him just a little more ear-scratching as he finishes licking you clean.");
			output("\n\n<i>“</i>Very<i> good wolfie,”</i> you purr as you come down off your orgasmic high, <i>“such a good cunt-licker you are.”</i>");
			output("\n\nYou let Walt slide out from under the table, a faint blush visible through his fur. You look around to see if you were spotted: most of the patrons around you are giving you congratulatory looks, but nobody seems to have alerted the staff, or perhaps they don’t care. You sneak Walt a kiss as he comes up high enough, savoring the taste of your [pc.girlCumNoun] on his lips.");
			output("\n\nYou get up to leave once Walt’s back in his seat, hips idly swaying as you depart.");
			if(pc.exhibitionism() >= 33)
			{
				if(pc.exhibitionism() < 66) output(" Stars, that was a rush! You’ll definitely have to try doing this again sometime.");
				else output(" Stars, there’s nothing like getting eaten out in public. Except getting railed in public... maybe you’ll risk it next time, you think to yourself. Your pussy throbs in excitement at the thought, putting a little extra swing in your step.");
			}
			
			processTime(6);
			
			addButton(0, "Next", waltSexFinish);
			break;
	}
}
public function waltSexFinish():void
{
	IncrementFlag("WALT_SEXED");
	pc.createStatusEffect("Walt Cooldown", 0, 0, 0, 0, true, "", "", false, 60);
	mainGameMenu();
}

