import classes.Items.Recovery.PexigaSaliva;

/* YAMMI'S FOLLOWER EXPANSION
=======================================
Mostly written by: Lady Jen
Revisions by: Savin
Sex scenes by: Savin
Coding by: Fenoxo
Credits by: Fenoxo
Crappy jokes by: Fenoxo
Extraneous comments by: Fenoxo
Good jokes go right by: Fenoxo*/
public function yammiFollowerDisplay(nude:Boolean = false):void
{
	showYammi(nude);
	author("Lady Jenn");
}

public function yammiRecruited():Boolean
{
	return (flags["YAMMI_RECRUITED"] == 1);
}
public function yammiIsCrew():Boolean
{
	return (flags["YAMMI_IS_CREW"] == 1);
}

public function yammiPlaceholderCapacity():Number
{
	return 500;
}
/* * BUST DISPLAY FUNCTION ACTUALLY IN yammi.as. ADDED FOR REFERENCE:
public function yammiShopDisplay(nude:Boolean = false):void
{
	showYammi(nude);
	author("Lady Jenn");
}*/

//Intro: Yammi's Bad Day
public function yammisBadDay():void
{
	clearOutput();
	yammiFollowerDisplay();
	output("You head over to Iced Teats, hoping for a quick snack to fill in a little time. As you approach, a small gang of unruly-looking young bulls storm out. Several look disgruntled, the rest are laughing. You wait until they’re gone, then head inside. Immediately you catch the sound of Yammi sniffling, trying not to cry. She’s standing behind her cash register and is covered in ice cream! They must have thrown half a dozen bowls at her.");
	output("\n\n<i>“I’m sorry. We’re closed for the moment, I have to... Oh! It’s you, hello.”</i> She chokes back a sob. <i>“Sorry, you kind of caught me at a bad time.”</i>");
	output("\n\nYou can see that. You ask what happened, flipping the sign on the door around to ‘Momentary Delay.’ You note you saw the gaggle of troublemakers.");
	output("\n\n<i>“Yeah, those guys are always a problem. They demand free stuff because they eat half their bowl and then decide they don’t like that flavor; they scream and yell at me all the time... they’re just really unpleasant people.”</i> She finally picks up a cloth and wipes her face off. <i>“Those are the kind of people that make me want to buy out my contract. Immediately. If it weren’t for that kind of jerk, I’d probably be happy working here!”</i>");
	output("\n\nYou ask if they’re really common");
	if(pc.isNice()) output(", as you pick up a cloth to help her wipe the counter");
	output(". She nods.");
	output("\n\n<i>“There’s quite a few. Mostly young hotshots who know I can’t do anything so they get away with acting like jerks, but there’s a lot of people who just think they should be accommodated no matter how stupid their gripe is or whose fault it is.”</i> She chuckles a little. <i>“This one Deditonian woman we get in here is always trying to get her ice cream free because it’s too cold. Really! Ice Cream, from the Iced Teats company, is too cold? I can’t imagine why it isn’t warmer, you know? And she’ll sit here and look down her nose at me for half an hour sometimes and inform me that it’s my job to please the customer and blah blah blah.”</i>");
	output("\n\nYou ask her what she does. She smiles and hugs herself.");
	output("\n\n<i>“I put up with it, of course. What else can I do? With her I usually just listen until her ice cream starts to melt, then point out it’s warmed up for her. She usually gets insulted and tells my boss, so I get hit with a small fine. Again.”</i>");
	output("\n\nYou offer to stick around and help clean up, but she shakes her head.");
	output("\n\n<i>“Thank you, I appreciate it, but I’ll get it. I could use a little time without customers to clear my head. I think I might just have a good cry and then open up again after I change.”</i>");
	output("\n\nYou give her a reassuring smile, then head out, leaving her to catch her breath. You imagined customer service work could suck, but you didn’t really think about how badly.");
	flags["YAMMI_BAD_DAY"] = 1;
	processTime(10);
	//move back north
	pc.createStatusEffect("Iced Teats Closed", 0, 0, 0, 0, true, "", "", false, 120);
	clearMenu();
	addButton(0,"Next",move,"507");
}

//First Chance to Hire Yammi
public function firstChanceToHireYammi():void
{
	clearOutput();
	yammiFollowerDisplay();
	output("You stroll into Iced Teats looking for something tasty. You notice something’s amiss when Yammi doesn’t immediately greet you in her usual happy manner. Instead she is leaned on the counter looking glum, chin rested on her fist. You stroll over and inquire as to the source of her woes?");
	output("\n\n<i>“My bosses have decided that since I get so many fines, they’re upping my shelter and food bills, effective tomorrow. It’s going to double the cost of me getting out of here.”</i> She sighs and stands up, then shakes her head. <i>“I’ve tried telling them it’s not my fault but they don’t care. This is the second time they’ve done this to me! I’m starting to wonder if I’ll ever get out of here.”</i>");
	output("\n\nYou tell her to keep her hopes up, then ask how much she owes.");
	output("\n\n<i>“Right now I owe 7,000 credits. As of opening tomorrow, it’ll basically be twice that. And I was so close! I could have been out of here in seven standard pay-cycles!”</i>");
	flags["YAMMI_BAD_DAY"] = 2;
	//(Choose ‘Sympathy’ or ‘Pay It’)
	processTime(2);
	clearMenu();
	addButton(0,"Sympathy",yammiSympathy);
	if(pc.credits >= 7000) addButton(1,"Pay It",payForYammisSlutitude);
	else addDisabledButton(1,"Pay It","Pay It","You can’t afford to pay it.");
}

//Sympathy
//Not much you can do for her but give a little moral support.
public function yammiSympathy():void
{
	clearOutput();
	yammiFollowerDisplay();

	output("You agree that seems really bad. ");
	//if Reaha follower:
	if(reahaIsCrew()) output("You know, though, that it could be a lot worse... ");
	output("With a faint grin you do mention that they clearly can’t afford to lose her!");
	output("\n\n<i>“Yeah... well yeah. I guess. Still, this is no good. I want to get out there and see something other than this shop. I mean, I owe them, that’s fair, but if they keep pulling this whenever I get close, I’m seriously going to flip out at some point!”</i>");
	output("\n\nYou agree it’s not fair. Still, you tell her that it will all work out. After all, she has her faithful customers. You assure her that the tips won’t stop from you at least.");
	output("\n\n<i>“That’s true! Alright, enough of me feeling sorry for myself.”</i> She puts on a smile. <i>“So! Welcome to Iced Teats! What can I get you today?”</i>");
	//(Proceed as per normal visit, add option to pay off contract to regular menu for 2x price starting the next day.)
	processTime(1);
	yammiRepeatMenu(false);
}

//Pay It
//(Used here or when you pay the bigger one later)
//You’ve got a big surprise for Yammi: enough Credits to buy out her contract. If she’ll accept a little generosity, she can be free of this place.
public function payForYammisSlutitude():void
{
	clearOutput();
	yammiFollowerDisplay();
	output("You tell her to grab her bag and lock up. Holding up a credit chit full of credits, you tell her that you’re willing to cover that contract of hers.");
	output("\n\n<i>“I appreciate the sentiment, but... wait, really?!”</i> She looks stunned when you nod. Speechless, she jumps the counter and hugs you tightly, then looks around at the shop. <i>“Okay um... just give me a moment! Help yourself to some ice cream, I have a couple things to shut down and a bag to grab and I’ll be right back!”</i>");
	output("\n\nYou idly sample some flavors while she’s gone, and you suspect the girls in the machines know she’s leaving. Most look happy, some look a bit sad, many give you thankful looks. Only a few are upset, but you chalk that up to jealousy. Finally, Yammi comes back to the front, locking the back door behind her.");
	output("\n\n<i>“My ex-owners are really angry. I don’t care though!”</i> She laughs, then hugs your arm. <i>“Okay! Where to, Boss? Your ship has a kitchen, right? Galley? Whatever it’s called? I can cook; I promise you won’t regret this!”</i>");
	output("\n\nYou inquire if she isn’t perhaps interested in her freedom instead of latching onto you so quickly. She kisses you on the cheek.");
	output("\n\n<i>“You have a ship. You’re going all over the place. Don’t tell me you couldn’t use a fresh-made hot meal! And don’t worry, I can take care of myself. If we get boarded, I’ll just duck into my water tank and turn it real cold, it slows my life signs down to undetectable levels. And I have basic self defense training, in case of robbery!”</i> She insists, picking up her bag of clothes and whatever personal effects she has. <i>“I won’t be in your way and I won’t charge you anything for the services. I promise! Besides, I can breathe underwater. I can be useful for finding things!”</i>");
	pc.credits -= 7000;
	processTime(2);
	//[Accept] [Decline]
	clearMenu();
	addButton(0,"Accept",acceptYammiBunsInShip,undefined,"Accept","All aboard, Yammi!");
	addButton(1,"Decline",declineYammiBunsInShip,undefined,"Decline","No thanks. Tell Yammi you don’t need her... though given her apparent wanderlust, you might not see her again if you do.");
}

//[Accept]
//All aboard, Yammi!
//Start counter: days served. Need for smuthings. --- FEN NOTE: Liar.
public function acceptYammiBunsInShip():void
{
	clearOutput();
	yammiFollowerDisplay();
	output("You shrug. If she wants to come with, you can’t imagine it will hurt. And it might be nice to have an actual meal prepared for you once in a while. You agree.");
	output("\n\n<i>“You won’t regret this! I promise! Let’s go, Boss, I have to make sure the kitchen’s all stocked up before we go anywhere!”</i> She locks the front door behind you and then slides the keycard back under the door.");
	output("\n\n(<b>Yammi has joined your crew!</b>)");
	flags["YAMMI_RECRUITED"] = 1;
	flags["YAMMI_IS_CREW"] = 1;
	processTime(8);
	moveTo("507");
	pc.createStatusEffect("Iced Teats Closed", 0, 0, 0, 0, true, "", "", false, 1440);
	clearMenu();
	addButton(0,"Next",move,"SHIP INTERIOR");
}

//[Decline]
//No thanks. Tell Yammi you don’t need her... though given her apparent wanderlust, you might not see her again if you do.
public function declineYammiBunsInShip():void
{
	clearOutput();
	yammiFollowerDisplay();
	output("<i>“Sorry,”</i> you say, trying to let her down gently. You don’t really need a cook, and your adventures are probably going to be too dangerous.");
	output("\n\n<i>“Oh,”</i> she says, more than a little dejectedly. <i>“I just thought... since you paid off my debts. Well! I guess I’ll have to make my own path, then!”</i> she says, flashing you a green-lipped smile.");
	output("\n\nYou wish her all the best and point her to the spaceport just down the way. She gives you a parting peck on the cheek before spinning on a heel and marching off, to new adventures.");
	flags["YAMMI_RECRUITED"] = -1;
	processTime(2);
	moveTo("507");
	pc.createStatusEffect("Iced Teats Closed", 0, 0, 0, 0, true, "", "", false, 1440);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//The Shop, Yammi-less
public function saliresIcedTeats():void
{
	clearOutput();
	yammiShopDisplay();
	output("You head into the Iced Teats shop, looking to enjoy something cool and delicious. When you enter, a blue skinned woman with black hair smiles at you, her light blue vest barely holding her bulging D-cup breasts in place. She greets you with the familiar <i>“Welcome to Iced Teats! My name is Salire, what can I get for you today?”</i> She has the eager happiness of someone new to their job and looking to make a good impression.");
	if(yammiRecruited() && !yammiIsCrew())
	{
		output("\n\nYammi is hanging around, eating some iced cream and talking shop with Salire. When she sees you, her eyes light up hopefully.");
		addButton(1,"Yammi",yammiReRecruitApproach);
	}
	addButton(0,"Salire", salireApproach, undefined, "Salire", "Order a frozen treat from Salire.");
}

public function salireApproach():void
{
	clearOutput();
	yammiShopDisplay();
	output("<i>“Cone, Bowl, or Feast?”</i> She inquires pleasantly.");
	yammiRepeatMenu(false);
}

//Yammi Crew Blurbs
public function yammiShipBonusText():String 
{
	var buffer:String = "";
	//Until first interacted, her descript on ship is: 
	if (flags["YAMMI_KITCHENED"] == undefined) buffer = "Yammi is hanging around in the galley, getting set up. Maybe you should check in with her?";
	else
	{
		//Choose one at random:
		//When chosen, keep as blurb for 1-2 hours. - 9999
		if(rand(4) == 0) buffer = "Yammi is bouncing around the kitchen, tending to a half-dozen different bubbling pots and aromatic dishes at once. Despite what must be a hectic job of keeping all that food going smoothly, she’s humming happily to herself and maintaining an almost dance-like rhythm between them. She seems perfectly at home.";
		else if(rand(3) == 0) buffer = "Your sparadat chef is reclining in her submersed hammock, naked except for a string bikini and her long gloves. She’s still got some food cooking, as always, but she seems to have spaced things out enough to let herself doze off for an hour or two.";
		
		else if(rand(2) == 0)
		{
			buffer = "For once, Yammi isn’t in the kitchen. Instead, she’s parked herself in your common room and is sprawled out in front of the holoscreen, watching what you surmise to be a ";
			if(rand(4) == 0) buffer += "very old sparadat romance flick";
			else if(rand(3) == 0) buffer += "hot and heavy ausar chick flick. Either that or a fairly tame porno, judging by the amount of bouncy cleavage and red rocket on display.";
			else if(rand(2) == 0) buffer += "thraggen mystery movie. Considering they’re a race of giant green brutes, the fact that there’s a slow-paced, thoughtful crime drama from their homeworld is a little shocking. At least, until the detective pulls out a plasma caster and melts a human gangster’s face off.";
			else buffer += "melodrama set during the brief but tense Human-Ausar cold war of ‘68. You can’t remember much of the history around it, but the way that the ausar Star-Queen and the human Supreme Commander are eyeing each other in the negotiation chambers, you think this might just be a space-age <i>Romeo and Juliet</i> knockoff. Especially when they start speaking in iambic pentameter for some reason.";
		}
		else buffer = "Yammi is hanging out in the kitchen as usual, only minding a handful of dishes now. Snacks and desserts, mostly. No ice-cream that you can see, though. Maybe there’s some bad memories there? Either way, she seems more than happy to indulge your sweet tooth while she’s aboard.";
	}
	
	return buffer;
}

public function yammiInTheKitchen():void
{
	clearOutput();
	yammiFollowerDisplay();
	//Yammi in the Kitchen (First Time)
	if(flags["YAMMI_KITCHENED"] == undefined)
	{
		output("You stroll into the galley to see what Yammi’s up to. She’s busy setting the place up as she needs it, organizing spices and ingredients and figuring out the layout for everything. To your surprise, she’s planning it all out so that everything can be locked down in a few moments, obviously having thought ahead some and not wanting to pick up a mess every time you get into a dogfight or have a rough landing. Yammi’s ‘bed’ is near the entrance, a giant tank of water with a hammock in it. She herself is moving around dressed in little more than a high-legged bikini bottom, an apron, some modest high heels, and a pair of gloves. She doesn’t notice you at first, so you get to watch her merrily skip around her new domain. Finally she turns enough to see you, and blushes furiously.");
		output("\n\n<i>“Oh! Hi, Boss! I didn’t see you there!”</i> She admits. <i>“I was just making sure everything’s ready to go. We’re all set up, and I’ve been coming up with a menu for you. Anything you need?”</i>");
		output("\n\nYou assure her you’re just here to see to her getting settled in. She smiles.");
		output("\n\n<i>“Yep, no problems here! We’ve got plenty of food, lots to drink, and I even made sure to squirrel away some snacks. Your utensils are okay for now, I’ll pick more up as I need them.”</i>");
		output("\n\nYou tell her to be sure that she mentions anything she needs. She manages an amateur salute, which makes you chuckle.");
		output("\n\n<i>“Sure thing, Boss! You just let me know if there’s anything I can get for you!”</i>");
		//(The player can now access Yammi’s menu of options)
		flags["YAMMI_KITCHENED"] = 1;
	}
	//Yammi in the Kitchen Main
	else
	{
		//Shizuya's cunt snake recipe
		if (flags["SHIZZY_MET"] != undefined && flags["SHIZZY_CUNT_SNAKE_RECIPE"] == undefined) return shizzyCuntRecipeGet();
		//Interacting with Yammi:
		output("The kitchen’s a busy place, with steam rising from boiling soups and hot food hissing as it is fried. A stove in back seems to be baking something. In the center of this storm of culinary chaos is Yammi, humming to herself and stirring, flipping, and chopping various foodstuffs, wearing nothing but an apron, gloves, and a bikini bottom. She smiles when she sees you.");
		output("\n\n<i>“Heya, Boss! What’s up?”</i> She inquires, setting down her spatula and turning the heat down so nothing burns. <i>“Can I get you anything?”</i>");
	}
	processTime(1);
	//[Talk] [Help] [Food] [Sex]
	yammiFollowerMenu();
}

public function yammiFollowerMenu():void
{
	clearMenu();
	yammiFollowerDisplay();
	addButton(0,"Talk",yammiTalkRouter,undefined,"Talk","Sit down and talk with your chef for a bit.");
	//Help Yammi
	addButton(1,"Help Out",offerToHelpYammi,undefined,"Help Out","Offer to help Yammi out around in the kitchen.");
	//Pexiga
	if(pexigaRecruited())
	{
		if(pexigaIsCrew()) addButton(1, pexigaName(), approachPexigaCrew);
	}
	else if(flags["YAMMI_HELPED"] >= 2) addButton(1,"Pexiga",pexigaVisit,undefined,"Pexiga","Visit Yammi’s pet pexiga.");
	//[Food] (ie, Yammi’s Menu)
	addButton(2,"Food",yammisMenu,undefined,"Food","Get something to eat.");
	//FLIRTZ
	if(flags["YAMMI_TALK"] < 3 || flags["YAMMI_TALK"] == undefined) addDisabledButton(3,"Flirt","Flirt","You should probably talk to her a bit more first.");
	else addButton(3,"Flirt",flirtWithYummiYammiYummiButts,undefined,"Flirt","Flirt a little with Yammi. Who knows what might happen?");
	//Once you’ve done all of Yammi’s talks, Flirt, and Help scenes, add [Flirt Again].
	if(flags["YAMMI_FLIRTED"] != undefined && flags["YAMMI_TALK"] == 3 && flags["YAMMI_HELPED"] == 2) addButton(3,"Flirt Again",getYammiSmut,undefined,"Flirt Again","Now that you’ve gotten to know Yammi, and seeing that she certainly didn’t shy away from your previous flirtations, maybe you could take things a little further with the cute cook...");
	//[Flirt]
	//Repeat entrance to sex scenes. Replaces previous <i>“Flirt”</i> scenes.
	if(flags["SEXED_YAMMI"] != undefined) addButton(3,"Flirt",flirtWithYammiBruh,undefined,"Flirt","See if your favorite chef is up for a little fun...");
	addButton(13,"Evict",askYammiToLeave,undefined,"Evict","Potentially kick Yammi off your ship for the time being.");
	addButton(14, "Back", crew);
}

public function askYammiToLeave():void
{
	clearOutput();
	showYammi();
	output("<i>“Hey Yammi, do you have somewhere to stay if I need to free up your bunk on the ship for a while?”</i>");
	output("\n\nYammi cocks her head to the side, looking at you sidelong. <i>“What’s the matter Boss? You don’t like my cooking?”</i>");
	output("\n\n<i>“It’s not that,”</i> you explain, <i>“I’m just thinking of doing some reorganizing on the ship.”</i>");
	output("\n\n<i>“Oh.”</i> Yammi taps her chin. <i>“I think I could hang around on New Texas, if you want. Between Iced Teats and the grill in Big T’s place, there’s bound to be some place that’ll let me pick up some extra scratch doing food prep. Those big bulls have huge appetites, especially after they spend all afternoon plowing some ditzy cow.”</i> She looks around. <i>“You need me to make tracks now, Boss?”</i>");
	output("\n\nAre you sure you want to get rid of Yammi?");
	processTime(1);
	clearMenu();
	addButton(0,"Yes",yesRemoveYammiFromShip);
	addButton(1,"No",noDontRemoveYammiYaCunt);
}

public function yesRemoveYammiFromShip():void
{
	clearOutput();
	showYammi();
	output("You nod.");
	output("\n\nYammi gathers her things in short order");
	if(pexigaIsCrew()) output(", along with [pexiga.name]");
	output(". <i>“Don’t get any funny ideas just because I’m not around. You need to eat if you want to win this thing.”</i> She gives you a kiss on the cheek on her way out.");
	
	output("\n\n(<b>Yammi ");
	if(pexigaIsCrew()) output("and [pexiga.name] are no longer on your crew. You can find them again on New Texas.");
	else output("is no longer on your crew. You can find her again on New Texas.");
	output("</b>)");
	processTime(5);
	flags["YAMMI_IS_CREW"] = 0;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function noDontRemoveYammiYaCunt():void
{
	clearOutput();
	showYammi();
	output("<i>“Nah, but I might need to later.”</i>");
	output("\n\n<i>“You’re the boss, Boss.”</i>");
	yammiFollowerMenu();
}
public function yammiReRecruitApproach():void
{
	clearOutput();
	showYammi();
	output("<i>“Hey, Boss. Ready to stop eating slop and get a real meal?”</i> Yammi smiles, excited to get back out amongst the stars.");
	output("\n\nDo you want to add Yammi back to your crew?");
	clearMenu();
	addButton(0,"Yes",yesGetYammiBack);
	addButton(1,"No",noGettingYammiBackToday);
}

public function yesGetYammiBack():void
{
	clearOutput();
	showYammi();
	output("You tell Yammi to grab her things and get back on the ship. She’s out the door before you finish.");
	output("\n\n(<b>Yammi ");
	if(pexigaRecruited()) output(" and [pexiga.name] have");
	else output(" has");
	output(" rejoined your crew!");
	output("</b>)");
	flags["YAMMI_IS_CREW"] = 1;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
public function noGettingYammiBackToday():void
{
	clearOutput();
	showYammi();
	output("Yammi tries not to let her disappointment show when you inform her that you won’t be taking her back onboard yet.");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function yammiTalkRouter():void
{
	if(flags["YAMMI_HELPED"] >= 2 && flags["PEXIGA_TALKED"] == undefined)
	{
		clearOutput();
		showYammi();
		output("Did you want to have a normal chat, or talk about the Pexiga?");
		clearMenu();
		addButton(0,"Normal Talk",yammiTalkScene);
		addButton(1,"Pet Talk",talkingWithYammiAbootPexiga,undefined,"Pet Talk","Talk with Yammi about the Pexiga. Is there anything you can do to improve its lot in life?");
	}
	else yammiTalkScene();
}

//Yammi Talk Scenes
//Sit down and talk with your chef for a bit.
public function yammiTalkScene():void
{
	clearOutput();
	yammiFollowerDisplay();
	//Yammi Talk 1
	if(flags["YAMMI_TALK"] == undefined || (flags["YAMMI_TALK"] == 3 && rand(3) == 0))
	{
		output("You grab a seat and tell her you’d like to have a few words with her about herself. She nods and continues working.");
		output("\n\n<i>“Of course, Boss! Ask me anything!”</i> she agrees.");
		output("\n\nNaturally you start with her. Specifically, you ask what she can tell you about her kind.");
		output("\n\n<i>“Oh, right! I never filled you in about us. Keep in mind I was raised apart from my kin, but I did a lot of research. I’m a sparadat. We’re from a hot world with all sorts of shallow-water stretches and rocky terrain. I think I mentioned we’re amphibians?”</i> She glances over to you, and you nod for her to continue. <i>“Those of my race have live births like most humanoids. We also have a highly developed sense of smell and taste; I think that’s why I became such a fussy cook!”</i> she laughs.");
		output("\n\nMakes sense. She pauses to get a few things moved around in their pans, then starts cutting up some vegetables.");
		output("\n\n<i>“So, we live for a long while, but nobody’s sure how long. Our world doesn’t have enough on it to really catch most people’s interest, no major wealth, just us. So we’ve kind of slipped through the cracks of the galaxy, and I think most sparadat are pretty good with that. Still, someone had use for a couple of us, or I wouldn’t be out here. I just hope my ancestors were adventurous, not captured specimens!”</i>");
		output("\n\nYou decide to switch topics before she thinks too hard on that, and ask about how her people fare on their world.");
		output("\n\n<i>“Oh, they’re top of the food chain. Most of the water is only as deep as about twice my height. The few places it gets really deep have big fish, but since my kind are poisonous to most native critters, they don’t bother us. I think that’s why we have such bright colors, to alert other creatures we’re dangerous to eat.”</i> She scoops the cut veggies into a pot and stirs it for a second. Then a flash of realization crosses her face and she hurries to add: <i>“By the way, just for your peace of mind and all, we’re not poisonous to humanoids! You know, so you’re not worried I might kill you while cooking or anything!”</i>");
		output("\n\nYou breathe out a sigh of relief. The thought had crossed your mind. You both have a quick nervous laugh, then she hands you a small plate with several fresh buns on it.");
		output("\n\n<i>“Not to tell you your job, but hadn’t you better make sure everything’s good at the helm from time to time? Besides, I’m really going to be cranking up the heat in here in a minute.”</i>");
		output("\n\nYou thank her for the warning and take your snack to go.");
		if(flags["YAMMI_TALK"] != 3) flags["YAMMI_TALK"] = 1;
		//+25 Energy!
		pc.energy(100);
		processTime(7);
	}
	//Yammi Talk 2
	else if(flags["YAMMI_TALK"] == 1 || (flags["YAMMI_TALK"] == 3 && rand(2) == 0))
	{
		output("You lean on the edge of the counter and ask Yammi if she’s got a minute. She nods and runs something through a blender. When the noise cuts out, you inquire about how she was raised.");
		output("\n\n<i>“Hm? Well, I guess not much different from most people. I mean, there was a lot more focus on company loyalty and all that, but we got a decent education about how things work. I learned the bare bones of galactic navigation and stuff in case I got used as a server on a ship, picked up a bunch of basic chatter in several languages, there was a ton of phys-ed....”</i> She sighs as she mixes something with the blended substance. <i>“It was a nice time. Then they got into training us and we started getting all rebellious and adolescent, and boy! I earned myself more than a few wallops across the arse.”</i>");
		output("\n\nYou express some disbelief that she could be a troublemaker, considering the things you’ve seen her put up with. She just laughs.");
		output("\n\n<i>“Oh, you wouldn’t believe the things I did! Cooking and chemistry are related, you know, and I used to find all sorts of ways to blow things up or stain things. I only got caught once in a while though. Lucky me! They weren’t above locking us in little boxes to force us to think about how terrible we were, if they felt we needed a time out.”</i>");
		output("\n\nYou assure her that she’s safe from that kind of treatment around here. She smiles to you and finishes mixing whatever she’s been making.");
		output("\n\n<i>“Thanks, Boss! Here, taste this, see what you think?”</i>");
		output("\n\nShe feeds you a spoonful of what appears to be red scrambled eggs. The taste isn’t bad... for a second. Then, your stomach heaves and you grab the trash can. Alarmed, she holds your head up and waits for you to finish clearing out your lunch. When you can, you ask her what that was.");
		output("\n\n<i>“That was the last time I listen to an article saying something very, very healthy is ‘a little bit unappealing to some,’ Boss. I’m so sorry!”</i> She hugs you gently, then helps you upright. <i>“Tell you what, you go sit down a minute, and I’ll get you something to settle your stomach!”</i>");
		output("\n\nYou catch your breath, then with a chuckle you note <i>“If you don’t want me asking about your school days, just say so!”</i>");
		output("\n\n<i>“Har-Dee-Har-Har, Boss.”</i> She shakes her head and points, sending you from her kitchen.");
		output("\n\nAt least the milkshake she sends you later settles your stomach nicely!");
		if(flags["YAMMI_TALK"] != 3) flags["YAMMI_TALK"] = 2;
		//+15 Energy
		pc.energy(50);
		processTime(7);
	}
	//Yammi Talk 3
	else
	{
		output("You stroll into the kitchen to find your cook finishing the latest batch of dishes. She glances over to you and smiles. You give her a hand putting some things away, noting that she loves to cook way more than you really thought possible.");
		output("\n\n<i>“I guess. Never really thought about it. I just like to cook! It’s something I’m good at, and with all the flavors I got to try around the ice cream shop it just made sense to look for more. What can I say, I’m glad my metabolism is insanely fast compared to most species’, or I’d be a blimp!”</i>");
		output("\n\nYou note you’re not complaining, since you’re getting most of the benefit. It does dawn on you to inquire about how she got to learn so much about culinary arts as a cashier.");
		output("\n\n<i>“Oh, that. Yeah, they didn’t have a lot to throw at me at first, so I saved up tips and bought access to some awesome info-casts about cooking. Just ran them through the store receiver and listened to them when there were no customers. Then they got the idea to maybe open a company restaurant, so I volunteered to work there and studied like a madwoman.”</i> She sighs heavily and shrugs. <i>“The idea went blooey, but I got my hands on more recipes and the like. The other girls I occasionally worked with were happy to try my experiments, and when there was nobody else I’d feed it to the spare ice cream girls.”</i>");
		output("\n\nYou chuckle at the mental image of the girls trapped in the ice cream machines, being spoon-fed her latest experiment. Rather mad-scientist like! Yammi’s face goes a deeper orange as she huffs out a peevish breath.");
		output("\n\n<i>“I’ll have you know those girls appreciated something with a little flavor as often as they could get it!”</i> She snaps in irritation. <i>“Evidently a little more than a certain wise-cracking captain does!”</i>");
		output("\n\nWorried that you might lose snacking privileges, you throw her into a quick headlock and tousle her hair, reminding her you’re very happy to have her and letting her know you’re just kidding around. She rolls her eyes and has to brush back her hair again.");
		output("\n\n<i>“Yeah yeah. If you really appreciate the effort, maybe you could get me a new set of knives, or some new dishes. Ooooh, how about a Kazimsta roast-pit? They use collected solar radiation to flash-cook things; it’d be really quick. They’re not too expensive!”</i>");
		output("\n\nYou swallow a lump in your throat and note that you’ve seen those things before, and that the phrase ‘not too expensive’ needs to drop the first word. Last time you saw one it was priced at something like half your ship.");
		output("\n\n<i>“Fine!”</i> She sticks her tongue out like a little kid. <i>“You could at least show up before I finish the dishes next time!”</i>");
		output("\n\nYou make no promises as something alerts you that you should be on the bridge. Hopefully just some stellar debris, but it’s a good way to duck out of dishpan hands!");
		//Add [Flirt] option to Yammi’s menu.
		if(flags["YAMMI_TALK"] != 3) flags["YAMMI_TALK"] = 3;
		processTime(10);
	}
	clearMenu();
	addButton(0,"Next",yammiFollowerMenu);
}

//Flirt
//Flirt a little with Yammi. Who knows what might happen?
public function flirtWithYummiYammiYummiButts():void
{
	clearOutput();
	yammiFollowerDisplay();
	output("Putting on your best Steele smile, you lean against the counter and tell your lovely cook that she’s just as sweet as ");
	if(flags["YAMMI_HELPED"] >= 2) output("her pexiga’s saliva");
	else output("any of the treats she makes");
	output(". Yammi giggles and rolls her eyes. <i>“Uh, thanks? I bet you tell that to all the sparadat chefs.”</i>");

	output("\n\nYou assure her that, even if you’d ever met one, she’d still be the cutest.");
	output("\n\nShe gives you a look but her cheeks flush a darker shade of orange. <i>“Oh, ya goof,”</i> she laughs. <i>“Thanks, though, Boss. I appreciate it. You’re a sweetie.”</i>");
	output("\n\nYammi leans in and gives you a kiss on the cheek. <i>“Most of the people I used to serve wouldn’t give me the time of day, much less give me compliments. Makes me glad I joined up with you instead of just going to work somewhere!”</i>");
	output("\n\nStill smiling, Yammi turns back to her work.");
	if(pc.isTreated()) output(" Somehow telling her she’s cute didn’t make her spread her legs right away. Weird.");
	flags["YAMMI_FLIRTED"] = 1;
	processTime(1);
	clearMenu();
	yammiFollowerMenu();
	if((flags["YAMMI_TALK"] == undefined || flags["YAMMI_TALK"] < 3) && (flags["YAMMI_HELPED"] == undefined || flags["YAMMI_HELPED"] < 2)) addDisabledButton(3,"Flirt");
}

//Help Yammi
//Offer to help Yammi out around in the kitchen.
public function offerToHelpYammi():void
{
	clearOutput();
	yammiFollowerDisplay();
	//Help 1
	if(flags["YAMMI_HELPED"] == undefined)
	{
		output("<i>“You want to help out? Oh, you’re such a sweetie!”</i> She kisses you on the cheek. <i>“Okay, you any good with a knife?”</i>");
		output("\n\nYou proudly note you’re a galaxy-wandering space explorer, and that nothing’s beyond your capacity. She laughs and sets out a row of vegetables you don’t recognize, then hands you a big knife to chop them with. As you set to work, you idly chat about various things... not least of all those topics being ‘Why are you cooking all the time?!’");
		output("\n\n<i>“Oh, uhm... well, ");
		if(crew(true) > 0) output("we have to feed the crew well");
		else output("I’ve got to keep you fed");
		output(", and I like to cook, so I like to make sure there’s a lot of options ready and waiting.”</i> She quickly turns to wash something in a basin.");
		output("\n\nYou caught the shifty eyes. You also know for a fact she cooks entirely too much. ");
		if(crew(true) <= 2) output("Even if your ship was stuffed to capacity you wouldn’t have enough people to eat everything she cooks in a day");
		else output("Even with such a large crew, there always seems to be so much left over");
		output(". So you just wait patiently until she gets tired of the building awkwardness: her natural chatty nature gets the better of her, as you expected.");
		output("\n\n<i>“Okay, look, I have a few ‘live’ specimens aboard to feed. Like the Tulpa on the menu, they’re absolutely terrible if you store them!”</i> She admits. <i>“I also cook a lot and preserve it for ingredients later, like herbs and things. Some of it I stash to trade every time we land somewhere interesting so I can get new spices and ingredients and recipes without costing you cash.”</i>");
		output("\n\nYou roll your eyes and ask about these ‘live specimens’. As captain and owner of this ship, you feel you should know about anything like that aboard. You pick up the latest thing to chop up while you remind her that she has certain obligations to keep you on the up and up.");
		output("\n\n<i>“Alright, true, I just... Um, Boss?”</i> She raises a finger just as you raise your knife.");
		output("\n\nFoolishly you tell her to continue, since you won’t be distracted. Unfortunately, the object you picked up happens to be a gups... a slippery, tough veggie that your knife slides sideways on and puts a slim but nasty gash in your palm. Worse, the veggie juices on your hand include some major irritant, and you can’t help but stand there with what must be a comical look of pain on your face, hand held high and all of your willpower going into not clenching it into a fist!");
		output("\n\n<i>“Ummm... look, I’ll explain after you get that all cleaned up.”</i> She winces at your hiss of pain. <i>“Here, let me see?”</i>");
		output("\n\nShe cleans your cut and puts some salve on it which causes it to stop hurting almost immediately. A quick dab of sealant and you’re pretty well good as new. You decide to leave the question for now, since you feel pretty foolish. Where’s a pirate attack or oncoming asteroid when you need a quick exit!?");
		output("\n\n<i>“Look, don’t worry about it. I’ll show you next time, nothing dangerous. Meanwhile, you go relax and I’ll whip you up a nice snack! You grab a can of suds or a bottle of good stuff,”</i> Yammi offers.");
		output("\n\nYou decide that sounds fair enough. Yammi’s not stupid, you know she wouldn’t bring anything deliberately dangerous aboard. Still, you remind yourself to check back in about that as you head to get a seat and see what she whips up.");
		processTime(10);
		flags["YAMMI_HELPED"] = 1;
	}
	//Help 2
	else if(flags["YAMMI_HELPED"] == 1)
	{
		output("<i>“Oh, you want to lend me a hand again? No knives this time, I promise!”</i> She chuckles. <i>“Actually, here! You wanted to know what live specimens I have aboard? You can help with one!”</i>");
		output("\n\nYou shrug and follow her into a back room, where a faint blue light holds back the cold. Inside you are somewhat surprised to see a woman! She has light blue scales that turn into lighter, armor-looking bands across the chest. She has a mostly-serpentine face, and dark blue eyes that have no pupil. She’s sitting on her knees on the floor and thrusting her meaty rump into the air, leaving her long spaded tail to flick back and forth. Her arms are supporting her front, locked around what looks like a doggy dish. Her fingers display the stumps of filed-down claws. A ring-gag holds her mouth open, and a very heavy-looking metal piercing onto the tip of her very, very long tongue forces her to leave it hanging out. She has frilled ears, strands of wispy spines where hair should be, and has some small breast-like lumps in the chest plating tipped with big, dark blue nipples.");
		output("\n\n<i>“This is a pexiga. Most are eaten by their own kind on their native planet... seriously, something like 90-something percent of them. They’re born in <b>huge</b> clusters of eggs. This one has lived over three hundred times as long as your average pexiga female by becoming a harvest girl.”</i> Yammi explains, indicating the tongue. <i>“Pexiga generate a really super-sweet gel in their mouths that serves sort of as saliva. It’s way sweeter than honey. You can’t find a really good kitchen or restaurant around that doesn’t have one of these.”</i>");
		output("\n\nYou turn to Yammi with a concerned expression. How did she get a... pexiga... aboard your ship without " + (rand(2) == 0 ? "you knowing" : "your knowledge") + "? Is this creature dangerous? And why is Yammi, someone who was in indentured servitude herself, keeping a gagged woman in your pantry?");
		output("\n\nYammi looks at you with a huff. <i>“You know how they catch a pexiga? They find one that’s lived more than eight years and then wait. Pexigas are deadly predators, but they have a sort of biological clock inside them. After eight years they’ve spawned all their young, so they’re infertile, and their brains just sort of... stop working. A pexiga that’s used up all her eggs just stops doing things. She stands there like an idiot, not hurting anybody, just waiting there to get eaten. They barely even feed themselves. You can walk right up and pose them like dummies and they’ll just stand there. By eight years, no exceptions. And their years are just over half a standard one.”</i> Yammi tells you, fetching a bowl.");
		output("\n\n<i>“Trust me, I’m not above indentured service... what was good enough for me is fine for others for a little while! But this one’s different, it’s literally lived its entire life and would otherwise be waiting to die. But as long as I feed her, and keep her muzzled so she doesn’t eat anybody, she’s fine!”</i>");
		output("\n\nEat anybody?");
		output("\n\n<i>“Like I said, they’re cannibals. But now that she’s passed her young, she’s totally lethargic. Won’t even try to take the gag out, and even that’s just a safety precaution. She probably wouldn’t hurt anybody even if she could. Really, she’s a sweetie!”</i>");
		output("\n\nYammi smiles and pats the pexiga on the hair, careful to move her hand along the way its spines grow. The lizard-creature makes a soft, almost feline purring sound and swishes its tail, but otherwise doesn’t react much.");
		output("\n\nYammi giggles and hands you the bowl. <i>“I promise, she’s totally harmless! So you here to help or no?”</i>");
		output("\n\nYou shrug and then nod, inquiring what you have to do. Yammi kneels on her opposite side. The captive reptilian flits her gaze back and forth between you two with barely any interest.");
		output("\n\n<i>“Okay, hold her tongue from low down. Then firmly rub your thumbs up either side of the top. This will fool her body into thinking food’s coming, and she’ll start to, well, drool more or less.”</i> She instructs you. <i>“I think it’s because they eat each other and they must taste awful, so they make something they like to taste naturally.”</i>");
		output("\n\nYou press on her tongue and massage your way up. It’s very warm despite the low temperature in the room, and soft as silk. The pexiga’s eyes roll upwards and she lets out faint gulping sounds as her reflexes tell her to swallow. Soon, a thick, clear gel starts to trickle down her tongue.");
		output("\n\n<i>“Perfect!”</i> Yammi exclaims happily. <i>“Now, to keep from disappointing her you give her one of these.”</i> She hands you a white soft tube about two inches long. <i>“It’s a dietary supplement for them. Just slide it into her mouth and poke it back until her throat gets a hold. When she stops secreting gel, you massage her tongue again and give her another one. Repeat until the bowl is mostly full. It takes about twenty minutes. Simple, right?”</i>");
		output("\n\nYou agree, and she leaves you with a little packet of food and the bowl. You do as instructed, rubbing her extremely soft, warm tongue for a minute or two until she can’t resist drooling, then rewarding her for her efforts. The Pexiga greedily gulps down her food, and seems quite content to let you use her as a sweets factory. Yammi seems to be right about them being pretty simple creatures in their, well, dotage. You find yourself grumbling about how nice it must be to have someone looking after all your needs!");
		output("\n\nThe pexiga murmurs wordlessly at you, and you notice its tail-tip is rubbing absently at her sex. Curious, you look around the reptile-girl’s body, and see that her dark blue lips are quite puffy and wet. Does she get off to this? The pexiga’s vacant eyes don’t reveal much, though she occasionally glances up at you and blinks slowly.");
		output("\n\nThen you remember you have work to do. You head out with the bowl full.");
		output("\n\n<i>“All done? Good stuff! Now I can make you an awesome dessert!”</i> Yammi takes the bowl and sets it into a cooling tray. <i>“Thanks a bunch, Boss! I’ve been trying to get around to her all day!”</i>");
		output("\n\nYou wave it off as no big deal, since you benefit from the food she makes all the time. She laughs and assures you that <i>“You ain’t seen nothing yet, Boss!”</i>");
		processTime(10);
		flags["YAMMI_HELPED"] = 2;
		//Replace [Help] with [Pexiga].
	}
	clearMenu();
	addButton(0,"Next",yammiFollowerMenu);
}

//Pexiga
//Visit Yammi’s pet pexiga.
public function pexigaVisit():void
{
	clearOutput();
	showName("\nA PEXIGA");
	showBust(pexigaBustDisplay());
	author("Lady Jenn");

	output("You tell Yammi to keep on cooking; you’re just going to wander around the kitchen. She flashes you a bright smile and goes back to the dish she’s working on at the moment, and once she’s nice and distracted, you make your way into the pantry she keeps the pexiga in.");
	output("\n\nThe reptilian alien is still sitting on her knees in the pantry, leaning over her doggy dish with her mouth around a ring gag. Her spaded tail swishes gently behind her raised, meaty rump; spiny hair falls down around her shoulders in messy lockes. The creature glances up at you with disinterest, slowly returning her attention to the deck.");
	
	//if fucked before:
	if(9999 == 0) output(" Still, you notice her big ol’ tail raise up a little over her back, leaving her blue-green sex completely exposed.");
	processTime(2);
	//[Pet] [Milk Saliva]
	clearMenu();
	if(pc.hasItemByClass(PexigaSaliva) || pc.hasItemInStorageByClass(PexigaSaliva)) addDisabledButton(1,"Milk Saliva","Milk Saliva","You already have some of that. No need to be greedy!");
	else addButton(1,"Milk Saliva",milkSalivaFromPexiga,undefined,"Milk Saliva","Get yourself some of that sweet, sweet pexiga saliva.");
	addButton(0,"Pet",petPexiga,undefined,"Pet","Poor thing. The least you could do is spend a few minutes giving her some love.");
	addButton(14,"Back",yammiInTheKitchen);
}

//[Milk Saliva]
//Get yourself some of that sweet, sweet pexiga saliva.
public function milkSalivaFromPexiga():void
{
	clearOutput();
	showName("\nA PEXIGA");
	showBust(pexigaBustDisplay());
	author("Lady Jenn");
	
	IncrementFlag("PEX_MILKED");
	
	output("Remembering Yammi’s lesson, you decide to get some of the pexiga’s sweet saliva for yourself. You slip down to the reptile-girl’s level, brushing some of her spine-hair out of her eyes. She blinks at you and murmurs, wiggling her pierced tongue slightly. Like she knows what’s coming.");
	output("\n\nYou press on her tongue and massage your way up. It’s very warm despite the low temperature in the room, and soft as silk. The pexiga’s eyes roll upwards and she lets out faint gulping sounds as her reflexes tell her to swallow. Soon, a thick, clear gel starts to trickle down her tongue.");
	output("\n\nHer bag of dietary supplements is nearby, hooked on the wall just out of her reach. After rubbing her extremely soft, warm tongue for a minute or two until she can’t resist drooling, you put one through her ring gag, rewarding her for letting you milk her.");
	output("\n\nThe pexiga greedily gulps down her food, and seems quite content to let you use her as a sweets factory in return. Yammi was right about them being pretty simple creatures in their old age. You find yourself grumbling about how nice it must be to have someone looking after all your needs!");
	output("\n\nThe pexiga murmurs wordlessly at you, and you notice its tail-tip is rubbing absently at her sex. Curious, you look around the reptile-girl’s body, and see that her dark blue lips are quite puffy and wet. Does she get off to this? The pexiga’s vacant eyes don’t reveal much, though she occasionally glances up at you and blinks slowly.");
	output("\n\nThen you remember you have work to do. You bottle up the saliva you gathered and stick it in your pack, leaving the pexiga with a light pat on the head. She gurgles at you, tongue lolling listlessly from her mouth.\n\n");
	//PC gains <i>“Pexiga Saliva”</i> item.
	processTime(13);
	pc.lust(3);
	quickLoot(new PexigaSaliva());
	//Trick the game into immediately jumping back into Yammi's menu after item loots.
	eventQueue.push(yammiInTheKitchen);
}

//[Pet]
//Poor thing. The least you could do is spend a few minutes giving her some love.
public function petPexiga():void
{
	clearOutput();
	showName("\nA PEXIGA");
	showBust(pexigaBustDisplay());
	author("Lady Jenn");
	
	output("Feeling sorry for the lethargic reptilian beauty, you draw close and run your fingers through her spiny hair. The pexiga murmurs around her ring-gag, swishing her tail across the deck as you massage her scaly scalp. The big piercing on her tongue swishes ever so slightly, and her somewhat vacant expression shifts to something like a smile, and her eyes follow you as you move. With no food on offer, and without your hand working to milk her for her sweet saliva, she seems somewhat more attentive than usual. If only just.");
	output("\n\nYou smile and pat her head, telling her that she’s a very good");
	if(pc.isMischievous()) output("... milk-lizard-girl");
	else output(" girl");
	output(". The pexiga murmurs something wordlessly and caresses your thigh with her thick tail.");
	output("\n\nIf she wasn’t a flesh-eater, she’d be absolutely cute!");
	output("\n\nWith a parting scratch behind a frilled ear, you slip out of the pantry and back to your business.");
	processTime(4);
	clearMenu();
	addButton(0,"Next",yammiInTheKitchen);
}

public function eatHomeCooking(energyGain:Number = 0):void
{
	pc.energy(energyGain);
	if(pc.hasStatusEffect("Home Cooking"))
	{
		if(pc.statusEffectv1("Home Cooking") < 50) pc.setStatusValue("Home Cooking", 1, 50);
		pc.setStatusMinutes("Home Cooking", 3000);
	}
	else pc.createStatusEffect("Home Cooking", 50, 0, 0, 0, false, "Icon_Cooking", "While you are well fed, you recover more while resting.", false, 3000);
}

//[Food] (ie, Yammi’s Menu)
public function yammisMenu():void
{
	clearOutput();
	yammiFollowerDisplay();
	output("<i>“Hungry, eh, Boss? Here ya go, this is what’s on the skillet, so to speak!”</i> She hands you a menu and waits expectantly.");
	output("\n\nYammi’s menu presents the following dishes:");
	output("\n<b>Pepper Pie</b>\nA special blend of hot and sweet peppers in a ground meat pie with fresh baked crust and rolls. Spicy!");
	output("\n<b>Marbled Steak</b>\nA side-cut steak from a Fruldian Meat-Animal.");
	if(reahaIsCrew()) output(" A hastily hand-written note assures your bovine companion that it’s <i>not</i> a cow-girl steak, please stop making that joke.");
	output("\n<b>Sweet Soup</b>\nA fruit and nut soup made in the milk of a coconut, chilled, and served as a drink.");
	output("\n<b>Nobblur</b>\nPastry filled with mixed veggies and cheese, ground meat, spices, and gravy. Served in a bowl with grains to soak up the mess.");
	output("\n<b>A Snack Tray</b>\nA big tray with finger foods of all sorts to munch on.");
	output("\n<b>Fried Tulpe</b>\nA fried fish, imported from Yammi’s home world and cooked in citrus fruit pulp. Served with a side of tubers.");
	if(flags["NALEEN_SNUGGLED"] != undefined) output("\n<b>Ginder Fish</b>\nA flame-cooked fish from the jungle world of Mhen’ga, imported at the captain’s request. Soft and rich; topped with lemons and a native honey-sauce.");
	output("\n<b>Yammi’s Sandwich</b>\nA four foot long bread roll stuffed with a blend of spiced meat, seafood and cheese until it’s about to explode, then baked.");
	if(reahaIsCrew()) output("\n<b>New Texas Milkshake</b>\nNew Texan Milkshake, made with all-natural New Texan cow-girl milk and refined into a delicious treat. Absolutely does not infringe on any Iced Teats copyrights.");
	if (flags["SHIZZY_CUNT_SNAKE_RECIPE"] == 1) output("\n<b>Fried And Stuffed Cunt Snake</b>\nA meal made from the invasive Cunt Snakes of Mhen'ga. The head and 'tail' are removed, and the middle stuffed with a mixture of fruits and vegetables, all imported from Mhen'ga for an authentic taste. The meat is then coated in a special mixture, and fried in fruit oil.");
	clearMenu();
	//Pepper Pie
	addButton(0,"Pepper Pie",pepperPieYammi,undefined,"Pepper Pie","A special blend of hot and sweet peppers in a ground meat pie with fresh baked crust and rolls. Spicy!");
	//Marbled Steak
	//A side-cut steak from a Fruldian Meat-Animal.
	addButton(1,"Marbled Steak",marbledSteakYammi,undefined,"Marbled Steak","A side-cut steak from a Fruldian Meat-Animal." + (reahaIsCrew() ? " A hastily hand-written note assures your bovine companion that it’s <i>not</i> a cow-girl steak, please stop making that joke." : ""));
	//Sweet Soup
	addButton(2,"Sweet Soup",sweetSoupYammi,undefined,"Sweet Soup","A fruit and nut soup made in the milk of a coconut, chilled, and served as a drink.");
	//Nobblur
	addButton(3,"Nobblur",noblurYammi,undefined,"Nobblur","Pastry filled with mixed veggies and cheese, ground meat, spices, and gravy. Served in a bowl with grains to soak up the mess.");
	//Snack Tray
	addButton(4,"Snack Tray",yammiSnackTray,undefined,"Snack Tray","A big tray with finger foods of all sorts to munch on.");
	//Fried Tulpe
	addButton(5,"Fried Tulpe",yammiFriedTulpe,undefined,"Fried Tulpe","A fried fish, imported from Yammi’s home world and cooked in citrus fruit pulp. Served with a side of tubers.");
	//Ginder Fish
	//Locked until PC has night-time cuddles with Naleen Huntress. By Savin.
	if(flags["NALEEN_SNUGGLED"] != undefined) addButton(6,"Ginder Fish",ginderFishStuff,undefined,"Ginder Fish","A flame-cooked fish from the jungle world of Mhen’ga, imported at the captain’s request. Soft and rich; topped with lemons and a native honey-sauce.");
	else addDisabledButton(6,"????","????","You have not yet discovered this recipe.");
	//Yammi’s Sammich
	addButton(7,"Y’s Sammich",yammiSammich,undefined,"Yammi’s Sandwich","A four foot long bread roll stuffed with a blend of spiced meat, seafood and cheese until it’s about to explode, then baked.");
	//N.T. Milkshake
	//Requires Crew Reaha
	if (reahaIsCrew()) addButton(8, "N.T.Milkshake", newTexasMilkshake, undefined, "N.T.Milkshake", "New Texan Milkshake, made with all-natural New Texan cow-girl milk and refined into a delicious treat. Absolutely does not infringe on any Iced Teats copyrights.");
	//Cunt Snake
	//Get from shizuya
	if (flags["SHIZZY_CUNT_SNAKE_RECIPE"] == 1) addButton(9, "F.S.CuntSnake", shizzyCuntSnakeEat, undefined, "Fried and Stuffed Cunt Snake", "A meal made from the invasive Cunt Snakes of Mhen'ga. The head and 'tail' are removed, and the middle stuffed with a mixture of fruits and vegetables, all imported from Mhen'ga for an authentic taste. The meat is then coated in a special mixture, and fried in fruit oil.");
	
	addButton(14,"Back",yammiInTheKitchen);
}

//Pepper Pie
//A special blend of hot and sweet peppers in a ground meat pie with fresh baked crust and rolls. Spicy!
public function pepperPieYammi():void
{
	clearOutput();
	yammiFollowerDisplay();
	output("The pie is about as big around as the plate it’s served on, three inches tall, and smells plenty spicy. There are four rolls to go with it. Yammi watches you from nearby as you dig in, taking an experimental bite. It’s exploding with strong flavors, mostly bold hot ones with an undertone of sweetness. You finish the first quarter before the slow-building heat catches up to you. You wolf down one of the buns and gesture to Yammi, who quickly hands you a mixed drink of something creamy. It quenches the burn down to a light throb.");
	output("\n\n<i>“You okay, Boss?”</i> Yammi inquires, worried. <i>“I didn’t make it too hot, did I?”</i>");
	output("\n\nYou answer her with a grin and immediately begin to chow down again. It’s absolutely fantastic, you just have to indulge in a drink from time to time to control the burn! It takes you about ten minutes to wolf down the whole thing, then you decide you’d better get back to work. Yammi seems pleased you liked it.");
	output("\n\nOddly, you feel like the meal digests away quickly. It seems Yammi’s got your weight on her mind.");
	processTime(15);
	eatHomeCooking(80);
	clearMenu();
	addButton(0,"Next",yammiFollowerMenu);
}

//Marbled Steak
//A side-cut steak from a Fruldian Meat-Animal. {Reaha Crew: A hastily hand-written note assures your bovine companion that it’s <i>not</i> a cow-girl steak, please stop making that joke.}
public function marbledSteakYammi():void
{
	clearOutput();
	yammiFollowerDisplay();
	output("Who doesn’t love a good steak? You take your seat and wait. A few minutes later Yammi rolls out the biggest hunk of meat you’ve ever laid eyes on. It’s more than two feet across and over an inch thick, marbled with enough fat to make sure the meat is tender and juicy. She has to bring it out on a cart, still sizzling.");
	output("\n\n<i>“Here ya go, Boss! Take what you like and I’ll use the rest for steaks and sandwiches later!”</i> She giggles, and you slice yourself a big hunk off to enjoy.");
	output("\n\nIt tastes an awful lot like beef. Well, what can you say? It’s about the best steak you’ve had in a long time! You can tell it was grilled on an open flame, and it’s been given just a hint of spice. You consider yourself one lucky explorer to be getting fresh barbecued steaks in the middle of space!");
	processTime(15);
	clearMenu();
	eatHomeCooking(100);
	clearMenu();
	addButton(0,"Next",yammiFollowerMenu);
}

//Sweet Soup
//A fruit and nut soup made in the milk of a coconut, chilled, and served as a drink.
public function sweetSoupYammi():void
{
	clearOutput();
	yammiFollowerDisplay();
	output("You decide on something sweet. Yammi pours you a frothy white liquid from a pitcher and tops it with a couple flakes of shaved nuts, then presents it to you with a big straw. The drink is served in a glass that sits on the floor and stands over three feet tall, but is very narrow.");
	output("\n\n<i>“Traditional serving glass.”</i> Yammi explains as you sip at it. <i>“The race that made the recipe are really tall but very skinny so they don’t eat much. I had to modify the mix a lot since their foods tend to be deadly to most life, but I think I got the essence of it!”</i>");
	output("\n\nWell, it’s certainly sweet! A nutty-creamy blend of taste that would be perfect for any dessert. You’re not complaining, until you realize you’ve downed it so fast that you’re getting a headache. Yammi giggles and hugs you, chiding you for being such an overeager little kid with the sugary stuff. On the upside, she informs you that all the sugars are natural and so they won’t make you fat as long as you exercise.");
	processTime(15);
	eatHomeCooking(70);
	clearMenu();
	addButton(0,"Next",yammiFollowerMenu);
}

//Nobblur
//Pastry filled with mixed veggies and cheese, ground meat, spices, and gravy. Served in a bowl with grains to soak up the mess.
public function noblurYammi():void
{
	clearOutput();
	yammiFollowerDisplay();
	output("Yammi puts a big bowl in front of you, and there it is, a pastry dome full of greatness. You pick it up, take a bite, and immediately spill warm gravy back into the bowl where dark grains are waiting to soak it up. It’s a wave of different flavors with every bite, and you enjoy each one. It’s also a very heavy meal, and you have to pause halfway through. Yammi chuckles to herself as she watches you power through it, then she grabs a spoon.");
	output("\n\n<i>“Don’t worry, Boss, I’ll snack on the grains.”</i> She offers, helping you to your feet. <i>“You go have a sit down and let that settle!”</i>");
	output("\n\nYou agree that after a nobblur, it’s probably best to take things slow. You go to ");
	if(!pc.isNaga()) output("put your [pc.feet]");
	else output("coil your naga tail");
	output(" up in your favorite chair.");
	processTime(15);
	eatHomeCooking(70);
	clearMenu();
	addButton(0,"Next",yammiFollowerMenu);
}

//Snack Tray
//A big tray with finger foods of all sorts to munch on.
public function yammiSnackTray():void
{
	clearOutput();
	yammiFollowerDisplay();
	output("Yammi takes about ten minutes to put together a sampler from all the things she’s got on the go. You are amazed at the tray’s layout, snacks spiraling out from the dip trays in the middle. Cut fruit, fresh veggies, nuts, pastries, pasta, finger sized meat cuts, small fish samples, chips, and more. It’s less a meal than a munch-fest, and you and Yammi both contribute to the demise of the mighty snack tray. Fifteen minutes later you excuse yourself with a smaller tray of leftovers to go do your rounds. There’s just so many things to eat!");
	processTime(15);
	eatHomeCooking(80);
	clearMenu();
	addButton(0,"Next",yammiFollowerMenu);
}
//Fried Tulpe
//A fried fish, imported from Yammi’s home world and cooked in citrus fruit pulp. Served with a side of tubers.
public function yammiFriedTulpe():void
{
	clearOutput();
	yammiFollowerDisplay();
	output("Yammi presents to you a specialty of her species. It’s a golden-brown fried fish fillet. It’s also almost a foot long. The spud-like tubers served with it are an appetizing baked red. You dig in, and find that it’s a little bland but very filling. The tubers are nice and soft. It’s very much a proper home-cooked meal, in space, far from home. You feel pretty good about your mission, as a little twinge of homesickness you were unaware of goes away for a while.");
	output("\n\n<i>“Hope you enjoyed it, Boss. It’s one of my favorite, for obvious reasons.”</i> She smiles. <i>“I stock quite a few tulpe. I know, plain, but they’re quite healthy, I assure you!”</i>");
	processTime(15);
	eatHomeCooking(90);
	clearMenu();
	addButton(0,"Next",yammiFollowerMenu);
}

//Ginder Fish
//Locked until PC has night-time cuddles with Naleen Huntress. By Savin.
//A flame-cooked fish from the jungle world of Mhen’ga, imported at the captain’s request. Soft and rich; topped with lemons and a native honey-sauce.
public function ginderFishStuff():void
{
	clearOutput();
	yammiFollowerDisplay();
	output("<i>“Per your request, captain,”</i> Yammi says with a hint of a giggle as she delivers a plate of smoking, grilled mhen’gan ginder fish to you. You take one sniff, and are instantly transported back to the lush jungle world, and the embrace of your kitty-snake lover there... your heart beats a little faster as you take a bite, letting the fish practically melt on your [pc.tongue]. Yammi looks on expectantly, until you flash her a sated smile and tell her it’s positively delicious.");
	output("\n\n<i>“Thanks, Boss,”</i> she smiles. <i>“I don’t have quite as much experience with rush-world dishes, but if you find any more like this, don’t hesitate to let me know. I think it turned out pretty sweet!”</i>");
	processTime(15);
	eatHomeCooking(100);
	clearMenu();
	addButton(0,"Next",yammiFollowerMenu);
}

//Yammi’s Sammich
//A four foot long bread roll stuffed with a blend of spiced meat, seafood and cheese until it’s about to explode, then baked.
public function yammiSammich():void
{
	clearOutput();
	yammiFollowerDisplay();
	output("Yammi rolls out a trolley with a four foot long monster of a sandwich on it. It smells of cooked meat and fish, and practically oozes with cheese. You’re stunned at the sight of this monster.");
	output("\n\n<i>“My favorite!”</i> She giggles. <i>“Of course I usually eat one over the entire day, but it’s not like I can’t just hack a piece off and eat on the run, which is what makes it so nice.”</i>");
	output("\n\nYou measure out a good chunk to slice off and dig in. The meat and seafood don’t blend as smoothly as you might have thought, but they complement each other well at least, and the cheese she used is different from others you’ve tried. You greedily devour the whole thing in a couple minutes, to Yammi’s delight.");
	output("\n\n<i>“Now, don’t eat too many of these! They’re a bit heavy for your kind, Boss!”</i> She cautions you, rolling the rest back to its storage space.");
	processTime(15);
	eatHomeCooking(90);
	clearMenu();
	addButton(0,"Next",yammiFollowerMenu);
}

//N.T. Milkshake
//Requires Crew Reaha
//New Texan Milkshake, made with all-natural New Texan cow-girl milk and refined into a delicious treat. Absolutely does not infringe on any Iced Teats copyrights.
public function newTexasMilkshake():void
{
	clearOutput();
	yammiFollowerDisplay();
	author("Savin");
	output("<i>“Still like your ice cream fresh from the tap, eh, Boss?”</i> Yammi teases, pulling a bag of ice-cold Reaha milk from the fridge and dumping it into a machine. <i>“Thanks to your cute little cow friend, I guess I can still put those Iced Teats years to good use. Not, uh, not that I’m using their methods. Because that’d probably be illegal.”</i>");
	output("\n\nShe looks shifty-eyed around and dumps in the flavoring you ask for. A few moments later, she slides a tall glass filled to the brim with sweet iced treat to you. ");
	//if ReahaSlave: 
	if(!reahaFree()) output("<i>“You can put the cost of that towards Reaha’s debt contract,”</i> Yammi adds, giving you a somewhat more serious look. <i>“Poor thing.”</i>");
	else output("<i>“You tell Reaha to stop by here more. The rate I go through her milk, I’m going to need her hooked up here twenty-four/seven.”</i>");
	output("\n\nSomething tells you Reaha’d probably enjoy it!");
	processTime(15);
	pc.milkInMouth(chars["REAHA"]);
	eatHomeCooking(70);
	clearMenu();
	addButton(0,"Next",yammiFollowerMenu);
}

//Getting Yammi Smut
//Dis all Savin’s shit.
//Once you’ve done all of Yammi’s talks, Flirt, and Help scenes, add [Flirt Again].
//[Flirt Again]
//Now that you’ve gotten to know Yammi, and seeing that she certainly didn’t shy away from your previous flirtations, maybe you could take things a little further with the cute cook...
public function getYammiSmut():void
{
	clearOutput();
	yammiFollowerDisplay();
	author("Savin");
	output("When Yammi turns her attention momentarily from you to a pot that needs stirring, you lean against the refrigerator beside her and gently clear your throat.");
	output("\n\n<i>“So I’ve been thinking...”</i> you say, watching the gentle rise and fall of the sparadat’s perky chest beneath her tight-fitting apron with keen interest. When you pause, Yammi stops and glances ");
	if(pc.tallness >= 72) output("up ");
	else if(pc.tallness < 66) output("down ");
	output("at you. She smiles and swings her spoon over to you, cutting the second half of your sentence off and planting the edge of the spoon on your lip.");
	output("\n\n<i>“What do you think?”</i> she asks, urging you to take a sip. You do so - what else do you do in that situation? - and find yourself moaning and closing your eyes as a sultry, heady, thick broth rolls across your [pc.tongue]. It tastes like home and heaven at once. <i>“Needs more salt, right? I knew it.”</i> Yammi sighs, dumping the other half of the spoonful back into the pot.");
	output("\n\nYou stop her, putting a hand on her wrist. <i>“It’s perfect,”</i> you smile. <i>“Just like you.”</i>");
	output("\n\nYammi freezes, then cracks a smile and rolls her eyes. <i>“Don’t tease, boss!”</i> she huffs, starting to tap a little more salt into the pot.");
	if(pc.isNice()) output("\n\n<i>“I’m being serious,”</i> you stress, gently turning her away from the pot.");
	else if(pc.isMischievous()) output("\n\n<i>“Who’s teasing?”</i> you smirk, slipping a hand in around her slender waist.");
	else output("\n\n<i>“Hey. I’m not teasing,”</i> you insist, keeping a firm grasp on her wrist.");
	output("\n\nShe gives you a sideways glance and eyes you slowly. Thinking. <i>“You really mean that, don’t you?”</i> Yammi asks, an honest question you think.");
	output("\n\nYou nod.");
	output("\n\nYammi sets her spoon aside and turns to you. <i>“Back on New Texas, I thought you were just some big-tipping rich [pc.boyGirl]");
	if(pc.isNice()) output("... though one with a golden heart");
	output(". Someone who wanted to be my friend, maybe.”</i>");

	output("\n\nShe blushes a little and gives you a hint of a smile. <i>“All that time, and you had a crush on me since the start! Or maybe you just think I’m an alien hottie, huh?”</i> she teases. Her smile turns playful, and she slips a little closer. <i>“Either way... what a way to get into a girl’s pants! Buy her out of slavery, take her out to see the galaxy... how’s a girl to say no to that?”</i>");
	output("\n\nNow she’s so close that her breasts are pressing against you through her apron. When you reach around and grab her plush butt, she sucks in a sharp breath and leans in, brushing her green lips across your cheek and close to your [pc.ear]. <i>“She doesn’t; that’s how.”</i>");
	output("\n\nThe next thing you know, Yammi’s back is against the bulkhead. Her legs wrap around your hips, and your lips find hers, pinning her back in a flurry of quick nips and long kisses. She moans throatily, rustling her alien gills, and clutches her arms around your back.");
	if(pc.isTreated()) output("\n\nDamn, about time! You grab her ass and hike her dress, getting your hands all over those legs.");
	else output("\n\nYammi gasps as your hands run across her body, slowly spreading her legs and hiking her dress up around her long, orange legs.");
	output(" A hand delves between them, quickly brushing aside a silky layer of fabric and finding a damp slit to slide into.");
	output("\n\nShe’s open and waiting for you...");
	//Sex Options
	//[Vaginal] [Anal] [Get Oral]
	processTime(10);
	pc.lust(10);
	yammiFollowerSexMenu();
}

//[Flirt]
//Repeat entrance to sex scenes. Replaces previous <i>“Flirt”</i> scenes.
//See if your favorite chef is up for a little fun...
public function flirtWithYammiBruh():void
{
	clearOutput();
	yammiFollowerDisplay();
	author("Savin");
	output("You slip a little closer to Yammi, running a hand down the back of her dress until your hand settles on her plump behind, giving it a little squeeze. She gasps, but smiles and rubs back against your wandering hand.");
	output("\n\n<i>“Something on your mind, boss?”</i> she smiles.");
	output("\n\nSomeone, anyway.");
	output("\n\n<i>“That right?”</i> Yammi purrs, slipping into your arms. Hers wrap around your waist, holding you close.");
	output("\n\nNow she’s so close that her breasts are pressing against you through her apron. Your fingers sink into her ass, and she sucks in a sharp breath. Yammi leans in, brushing her green lips across your cheek and close to your [pc.ear]. <i>“I guess I can take a quick break. Just for you.”</i>");
	output("\n\nThe next thing you know, Yammi’s back is against the bulkhead. Her legs wrap around your hips, and your lips find hers, pinning her back in a flurry of quick nips and long kisses. She moans throatily, rustling her alien gills, and clutches her arms around your back.");
	if(pc.isTreated()) output("\n\nFuck yeah! You grab her ass and hike her dress, getting your hands all over those legs.");
	else output("\n\nYammi gasps as your hands run across her body, slowly spreading her legs and hiking her dress up around her long, orange legs.");
	output(" A hand delves between them, quickly brushing aside a silky layer of fabric and finding a damp slit to slide into.");
	output("\n\nShe’s open and waiting for you...");
	processTime(6);
	pc.lust(10);
	yammiFollowerSexMenu();
}

public function yammiFollowerSexMenu():void
{
	clearMenu();
	if(pc.lust() >= 33)
	{
		if(pc.hasCock() || pc.hasHardLightEquipped())
		{
			//[Anal]
			addButton(0,"Fuck Her Ass",analWithYammiChoiceWrapper,undefined,"Fuck Her Ass","Bend Yammi over the counter and see about giving this sweet chef some backdoor loving.");
			//[Vaginal]
			addButton(1,"Fuck Her Vag",vaginalWithYammiChoiceWrapper,undefined,"Fuck Her Vagina","Get Yammi on her back and fuck her pussy.");
		}
		else
		{
			addDisabledButton(0,"Fuck Her Ass","Fuck Her Ass","You require a penis or hardlight-equipped underwear to do this.");
			addDisabledButton(1,"Fuck Her Vag","Fuck Her Vag","You require a penis or hardlight-equipped underwear to do this.");
		}
		//[Get Oral]
		//PC needs a twat
		if(pc.hasVagina())
		{
			addButton(2,"Get Licked",getLickedByYamyams,undefined,"Get Licked","Hop up on the counter and give Yammi a taste of your" + (pc.girlCumType == GLOBAL.FLUID_TYPE_HONEY ? " literal" : "") + " honeypot!");
		}
		else addDisabledButton(2, "Get Licked", "Get Licked", "You must have a vagina for this.");
		
		if (pippaYammiThreesomeCount(0) > 0)
		{
			if (!pippaOnShip()) addDisabledButton(3, "Pippa", "Pippa", "Pippa must be on your ship to have a threesome with her and Yammi.");
			else if ((pc.hasCock() || pc.hasHardLightEquipped()) && !pc.isTaur()) addButton(3, "Pippa", pippaYammiThreesome, undefined, "Pippa", "Have a threesome with Pippa and Yammi.");
			else addDisabledButton(3, "Pippa", "Pippa", "You must have a cock or hardlight-equipped underwear and not be a taur to have a threesome with Pippa and Yammi.");
		}
	}
	else
	{
		addDisabledButton(0,"Fuck Her Ass","Fuck Her Ass","You’re not aroused enough to be interested in this.");
		addDisabledButton(1,"Fuck Her Vag","Fuck Her Vag","You’re not aroused enough to be interested in this.");
		addDisabledButton(2, "Get Licked", "Get Licked", "You’re not aroused enough to be interested in this.");
		if (pippaYammiThreesomeCount(0) > 0) addDisabledButton(3, "Pippa", "Pippa", "You’re not aroused enough to be interested in this.");
	}
	addButton(14,"Back",yammiInTheKitchen);
}

public function analWithYammiChoiceWrapper():void
{
	var cock:Boolean = pc.hasCock();
	var strapon:Boolean = pc.hasHardLightEquipped();
	var x:int = -1;
	if(cock)
	{
		x = pc.cockThatFits(yammiPlaceholderCapacity());
		if(x < 0) x = pc.smallestCockIndex();
	}
	if(cock && strapon)
	{
		clearOutput();
		yammiFollowerDisplay();
		output("What will you penetrate her with?");
		clearMenu();
		addButton(0,"Penis",analWithYammibalLector,x);
		addButton(1,"HL Strap-On",analWithYammibalLector,-1);
	}
	else if(cock) analWithYammibalLector(x);
	else analWithYammibalLector(-1);
}

//[Anal]
//Bend Yammi over the counter and see about giving this sweet chef some backdoor loving.
public function analWithYammibalLector(x:int = 0):void
{
	clearOutput();
	yammiFollowerDisplay(true);
	author("Savin");
	
	output("You pull Yammi’s dress up over her head, revealing the pert mounds of her breasts, the smooth curves of her amphibian skin, and the lacy black panties clinging to her ample hips. She sucks in a sharp breath as you unclothe her, but her hands are already working on you as well, pulling your ");
	if(pc.isCrotchGarbed()) output("clothes");
	else output("gear");
	output(" aside and ");
	if(x >= 0) output("grabbing your [pc.cock " + x + "]");
	else output("blindly groping at your underthings until she finds the activation switch for your hardlight cock. It springs into existence in a rush of sensation, and flops right into her waiting hand");
	output(". Her hand brushes along your shaft, gently massaging you to full hardness while you secure your hands on her ass, hefting her off the wall’s support and sprawling her out on the countertop.");
	output("\n\nWhen she lands, her legs spread wide, inviting. You sink your fingers into Yammi’s hips, getting a good grip on her apricot flesh before rolling her over and yanking her back into your hips. She yelps, but her butt jiggles enticingly enough that you can’t keep your hands off, peeling her bouncy cheeks apart to give yourself a prime view of sex.");
	output("\n\nShe’s still got her panties on, clinging defensively to her dark pussylips and the black hole above them. Both entrances are clearly visible even through the patterned black lace, soaked as it is with her arousal. Unsteadily, your lover rises onto her elbows and gives you a look over her shoulders, a mix of contentment and concern when she sees you leaning down into her behind.");
	output("\n\nYou give her a playful wink and slink down, grabbing the hem of her panties by your teeth and slipping them down to her knees. One long, lavish lick back up leads you from the bottoms of Yammi’s thick lower lips right over the dark star of her rump, which you spend a little time stirring up while your tongue’s covered in creamy lubricant. Yammi moans, biting down on a green lip when you try and probe your tongue inside. Her body rebukes you, clenching so tight you can barely spread her dark star open.");
	if(flags["ANALED_YAMMI"] == undefined) output("\n\n<i>“W-whatcha doin’ back there, Boss?”</i> the chef groans, balling her fists as you keep trying. <i>“That’s, um... that’s the wrong...”</i>");
	else output("\n\n<i>“Wha- oh, you’re obsessed with that! Alright... just be gentle!”</i>");

	output("\n\nYou shush her, telling her you know exactly what you’re doing. She whimpers, but is clearly too turned on to do anything but go along with your desires. Giving her an appreciative pat on the ass that makes her glistening cheeks jiggle, you step back and glance around the kitchen. Your gaze settles on a bottle of olive oil your chef’s left beside the stove. You grab it and pop the top, holding it under your nose to enjoy the earthy smell. Nice and fresh, of course. Returning to your rightful place behind Yammi, you heft up your [pc.cockOrStrapon " + x + "] and drop it right between her buns. She gasps when you top it off by up-ending the oil bottle onto her behind and the shaft of your schlong, slathering the expanse of her crack and your ");
	if(x < 0) output("false ");
	output("flesh with slick oil.");

	output("\n\nYammi takes a deep breathing, still squeezing her backside tight. <i>“O-okay, Boss. I trust you,”</i> she murmurs, locking her hands around the edge of the counter. You rub Yammi’s fulsome buttocks, spreading the cheeks out and pressing your sensitive tip against her tight backdoor. Thanks to all the extra lube you’ve doused yourself in, even Yammi’s incredible tightness can’t repulse you. With a groan of absolute ecstasy, you push into the slippery silken vice of her asshole.");
	output("\n\nShe’s cool inside, moreso than you’d ever have expected, almost making you shiver as you slide the first few inches inside. For her part, Yammi tenses up like a spring, arching her back and letting out a whimpering moan as you violate her ");
	if(flags["ANALED_YAMMI"] == undefined) output("virginal");
	else output("tender");
	output(" hole. It’s easy to tell she’s gritting her teeth, trying not to cry out as you slowly sink yourself deeper and deeper inside her. You give her plenty of time to get used to your steady invasion, feeding her your dick nice and slow until you’ve ");
	if(x < 0) output("bottomed out in Yammi, pressing your hips to her ass.");
	else if(pc.cockVolume(x) <= yammiPlaceholderCapacity()) 
	{
		output("bottomed out in Yammi, pressing your hips to her ass");
		if(pc.balls > 1) output(" and your balls are slapping wetly against her soaked twat");
		output(".");
	}
	else output("filled her to the brim with dickmeat. You’ve got plenty more to spare, but there’s no way the bulging sparadat can take any more!");
	if(x >= 0) pc.cockChange();

	output("\n\nYou stay still for a moment after that, letting her adjust to the girth inside her, slowly relaxing her clenching sphincter. While she does, you gently massage the oil into Yammi’s cheeks, squeezing and kneading her plump rump to help ease her into things. Beneath the action, you can feel Yammi’s twat rubbing wetly against your thighs, letting you feel just how excited she’s gotten. For someone so timid, she seems to be enjoying herself...");

	output("\n\nSlowly but surely, you ease your hips back. Yammi’s knuckles turn red around the edge of the counter and her back arches sharply. She groans, a husky sound from the stomach that keeps going until your crown is the only thing holding her dark hole open. Another spurt of olive oil and you’re able to glide right back in. It’s much easier the second time, and even moreso the third and fourth. Before long you’re pounding away at her ass, letting the mess hall resound with the wet squelches of your impromptu lube getting worked hard into her hole.");
	output("\n\nBetween deep thrusts into Yammi’s ass, you ");
	if(pc.hasCockTail()) output("feel your cock-tipped tail swinging around, nuzzling up to the sparadat’s girl-spunk-splattered thighs. She shudders at the extra sensation, but that’s nothing compared to the cry of pleasure she lets loose when you thrust your tail-prick into Yammi’s sodden sex.");
	//elseif 2+ cocks:
	else if(pc.cockTotal() > 1 && x >= 0) output("grab your second prick and align it with the squirming sparadat’s other hole, using the same slick oil-lube mixed with Yammi’s own dripping excitement to fuck your way inside.");
	else output("work your hand down between her dampened thighs, brushing the tips along her dark lips. You push them in gently, spreading her lips open and letting a steady trickle of feminine slime and your added lube guide your way into her.");
	output(" Now taking it in both holes, Yammi’s voice reaches a crescendo of pleasured cries and feral grunts, trying and failing to contain the pleasure in her voice.");
	//if other crew:
	if(crew(true) > 0) output(" The whole ship can probably hear you two going at it now!");

	output("\n\nYour [pc.hips] buck against Yammi’s butt, hammering your cock");
	if(pc.hasCockTail() || (x>=0 && pc.cockTotal() > 1)) output("s");
	output(" deep inside her clenching body. Now that you’re giving her pussy some attention, your chef’s moans become even more bliss-filled. Every thrust bucks her forwards, making her breasts and ass bounce alluringly, and the counter shudders under your hammering hip-thrusts. Tension starts building in your loins, brought to the forefront by Yammi’s tightness and the way she moans, so alluring that you can’t hold yourself back any longer.");

	output("\n\nFaster and faster, you thrust into Yammi’s hole");
	if(pc.hasCockTail() || (x>=0 && pc.cockTotal() > 1)) output("s");
	output(", driving yourself over the edge - and her with you, by the way she screams and squirts around your ");
	if(pc.hasCockTail() || (x>=0 && pc.cockTotal() > 1)) output("cock");
	else output("hand");
	output(". You hilt yourself in her, driving every last inch of your [pc.cockOrStrapon " + x + "] into her, filling Yammi to the brim with ");
	if(x < 0) output("holographic cock");
	else output("cockmeat and, a moment later, a rush of [pc.cum]");
	output(". The counter is polished to such a sheen that you can see her eyes bulging, tongue lolling out of her mouth. You can only imagine your own face as you’re milked to orgasm by her ");
	if(flags["ANALED_YAMMI"] == undefined) output("virginal");
	else output("almost virgin-tight");
	output(" ass.");
	if(x < 0) output(" Your hardlight feeds back overwhelming sensation, giving you a taste of what a real cock feels like - if only for one fleeting, glorious moment.");

	output("\n\nWhen your climax subsides, you find yourself staggering back, popping out of Yammi’s abused hole");
	if(pc.hasCockTail() || (x>=0 && pc.cockTotal() > 1)) output("s");
	output(" and flopping heavily against the bulkhead.");
	if(pc.hasCockTail() || (x>=0 && pc.cockTotal() > 1)) 
	{
		output(" A steady trickle of [pc.cum] puddles out of Yammi’s ");
		if(x >= 0) output("pussy and ");
		output("ass, pooling on the floor between her legs.");
	}
	output(" She shudders and sighs when you pull out of her. After a while of silence, Yammi struggles up onto her elbows and gives you a look over her shoulder.");
	output("\n\n<i>“That wasn’t exactly gentle!”</i> she huffs, though the dampness on her thighs tells a different story.");
	output("\n\nYou ask her if it was <i>bad</i> though, between a firm grope of a buttcheek. Yammi blushes and rolls her eyes. <i>“Well, I guess I came too...”</i>");
	output("\n\nThat’s more like it. You toss Yammi a towel to clean herself up with and go to find your gear. Maybe you’ll come back for a second course when she can walk straight again...");
	processTime(32);
	IncrementFlag("SEXED_YAMMI");
	IncrementFlag("ANALED_YAMMI");
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Get Oral]
//PC needs a twat
//Hop up on the counter and give Yammi a taste of your {literal} honeypot!
public function getLickedByYamyams():void
{
	clearOutput();
	yammiFollowerDisplay(true);
	author("Savin");
	output("For a moment, you break your passionate embrace. You hold Yammi’s hands and lead the panting sparadat a few paces back, slowly pulling your [pc.gear] off before hopping up onto the counter and ");
	if(pc.legCount > 1) output("spreading your [pc.legs]");
	else output("twisting around to present your naked sex");
	output(". One inviting pat of your thighs is all the instruction your lover needs to slip between your [pc.legs] and nestle her cheeks between them. With an almost worshipful reverence, Yammi puts her hands on your thighs and uses her thumbs to brush across the lips of [pc.oneVagina].");
	output("\n\nYou suck in a long, husky breath when Yammi starts to spread you open, gently pulling your lips apart. She stares into the channel of your sex for a moment before gingerly flicking her tongue out, exploring the flesh around [pc.oneClitPerVagina]. An involuntary shiver runs through you as her long tongue teases around your bud, never quite touching it but getting so close that you can feel hot breath billowing over it. Your fingers run through Yammi’s green hair, joining with your encouraging moans and coos of delight to spur her further and further into your sex.");
	output("\n\nIt isn’t long before her probing muscle slips between your lips and slithers into your slit, licking languidly around your slick walls, deeper and deeper until she’s almost kissing your [pc.cunt]. <i>“Right there,”</i> you murmur. Her tip brushes what can only be your g-spot, sending shivers shooting through your body. You gasp, clutching at your [pc.chest] and squeezing Yammi’s head between your thighs, desperately trying to coax her deeper.");
	output("\n\nYour lover complies as best as she can, thrusting her tongue deep into your drooling snatch. She grabs your [pc.butt], pulling you right to the edge of the counter so that she can lick every last inch of your twat. Between deep licks, Yammi grins up at you, fluttering her eyelashes.");
	output("\n\nService with a smile, as they say.");
	output("\n\nYou let your head roll back, moaning and pinching your nipples. The talented tongue spearing your [pc.cunt] is more pleasurable than it has any right to be, driving you steadily towards climax. Every passing moment is spent wallowing in unadulterated bliss, urging your lover on with sultry moans and gentle caresses. Eventually you find yourself relaxing on your back, sprawling languidly out over the counter with eyes rolling closed. This is too good not to enjoy every moment to the fullest...");
	output("\n\nBefore you can drift into climax, however, Yammi’s tongue suddenly stops. You lean up, blinking at her questioningly. She answers with a silent smile, bringing her painted lips up from your bottom pair and tracing kisses up to your [pc.lips]. By the time she’s done, Yammi’s overtop you, straddling your [pc.hips]. Her pert breasts brush against your [pc.chest], teasing your [pc.nipples] with her own stiff little points.");
	output("\n\n<i>“How about you help me out, hmm?”</i> Yammi purrs, drawing your attention to the hand she’s slipped between her own legs. Probably been going at this whole time, waiting for her opportunity to ask.");
	output("\n\nLaughing, you tell Yammi to spin that ass around and present.");
	output("\n\n<i>“Aye aye, captain,”</i> she giggles, swinging a leg over you. When she’s done moving, her glistening sex is swaying just over your [pc.face], begging for attention. You reach up, planting your hands firmly on Yammi’s pert behind, and reach your tongue up to flick through the svelte gap between her pussy-lips. Yammi shudders, her sex twitching as you start to explore her feminine folds.");
	output("\n\nOf course, your first probes prompt Yammi to return to servicing you in return. She licks deep and slow, swirling her tongue around inside you. A shudder rocks your body, making you moan into the wet slit pressed to your mouth. Oh, that’s good... so good. It’s hard to concentrate on what you’re doing with Yammi teasing your twat like this, deftly wracking your body with shivering pleasure. The lovely little sparadat’s tongue is more talented than it has any right to be, effortlessly finding your most tender spots and lavishing them with love.");
	output("\n\nYou try and match Yammi’s enthusiasm, swirling your tongue through her dark sex. Her legs tense visibly the deeper you lick into her, making her ass quiver above you. Sweet feminine juices run down your [pc.tongue], giving you plenty of warning before Yammi’s cute little moans start reaching their crescendo. Then again, you’re even closer than she is... ");
	output("\n\nSuddenly, Yammi’s oral caresses find some sensitive spot, and your resolve breaks in a cascade of pleasure. Your back arches, pressing your [pc.belly] against your lover’s, clenching your [pc.cunt] around her tongue and thrusting against it like a tiny, writhing dick. She thrusts in as hard as she can, doing everything she can to make sure your orgasm is long and explosive. Hers follows in short order, riding on your urgent oral ministrations and groping hands. Your face is soon splashed in musky fem-cum");
	if(pc.cockTotal() > 0) output(" - a small thing compared to your [pc.cocks] shooting off all over Yammi’s chest");
	output("!");
	output("\n\n<i>“Oh, <b>Captain</b>!”</i> she moans, rolling off you and licking at a bit of your ");
	if(!pc.hasCock()) output("fem-");
	output("cum on her chin. <i>“I always figured you for a big eater.”</i>");
	if(pc.isMischievous()) output("\n\nHar har. You ");
	else output("\n\nYou snigger at the uncharacteristic pun and ");
	output("reach over to run a hand over your lover’s exposed behind, just enjoying the simple fullness of it between your fingers. Yammi smiles and stretches, and nuzzles her cheek against your thigh.");
	output("\n\n<i>“That was nice. We gotta ");
	if(flags["SEXED_YAMMI"] == undefined) output("try not to do it");
	else output("stop doing it");
	output(" in the kitchen, though. What a mess!”</i>");
	output("\n\nYou’re sure Yammi won’t mind a bit of extra cleanup after a treat like that. She giggles, not denying it.");
	output("\n\nYou slowly sit up and hop down from the counter, stretching languidly as you gather your gear.");
	processTime(19);
	IncrementFlag("SEXED_YAMMI");
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function vaginalWithYammiChoiceWrapper():void
{
	var cock:Boolean = pc.hasCock();
	var strapon:Boolean = pc.hasHardLightEquipped();
	var x:int = -1;
	if(cock)
	{
		x = pc.cockThatFits(yammiPlaceholderCapacity());
		if(x < 0) x = pc.smallestCockIndex();
	}
	if(cock && strapon)
	{
		clearOutput();
		yammiFollowerDisplay();
		output("What will you penetrate her with?");
		clearMenu();
		addButton(0,"Penis",vaginalWithYammi,x);
		addButton(1,"HL Strap-On",vaginalWithYammi,-1);
	}
	else if(cock) vaginalWithYammi(x);
	else vaginalWithYammi(-1);
}

//[Vaginal]
//Get Yammi on her back and fuck her pussy.
//Missionary position for the sole purpose of recreation. Hardlight or cock.
public function vaginalWithYammi(x:int = 0):void
{
	clearOutput();
	yammiFollowerDisplay(true);
	author("Savin");
	output("Between your stray kisses and wandering gropes, you ");
	if(x >= 0) output("can feel your [pc.cock " + x + "] hardening against Yammi’s thigh");
	else output("manage to get your hand down to the controls for your hardlight, letting it spring to life against Yammi’s hips in a surge of sensation");
	output(". Your love gasps, feeling your erection pressing against her. She smiles, grasping it and stroking gently. Each soft caress guides your member, drawing it towards her eager sex. Her arms clench around your shoulders, her legs at your hips, letting you carry her weight between you and the bulkhead.");
	output("\n\nYou slip a hand between Yammi’s legs, deftly pulling aside her panties and sliding two fingers into the waiting hole they hide. Her back arches, a moan escaping her lips as you explore her welcoming depths. The grip of her knees around your [pc.hips] tightens, squeezing to the rhythm of your deep-thrusting digits. Slowly, you spread her pussylips open, letting your hips push forward and guide your [pc.cockOrStrapon " + x + "] into the waiting kiss of Yammi’s pussy.");
	output("\n\nYour lover’s breath catches in your throat, a physical clutch of pleasure in reaction to your entrance. Her quim clenches fiercely around your [pc.cockOrStrapon " + x + "], desperately drawing in inch after inch of your throbbing pride. With a grunt of effort, you heft Yammi up and spin the pair of you around, splaying her out across the countertop with her ass in the air and legs wrapping around your shoulders.");
	if(x >= 0) pc.cockChange();
	output("\n\n<i>“Come and get it, [pc.name],”</i> Yammi murmurs, stretching out with languid sexuality, slipping her dress off around her head. You sieze the opportunity, grabbing her breasts in both hands under her bra and squeezing them as hard as you can. Their owner arches her back and moans, biting her lip as your fingers find her nipples and start to play. Her underwear comes off soon enough, giving you free reign to grope and tease before you really start to fuck, just enjoying the little quivers and clenches around your [pc.cockOrStrapon " + x + "].");
	output("\n\nEventually, your hands make their way back down to Yammi’s hips. You lean forward, pressing yourself tight to your lover’s supple form and finding her lips with yours, kissing her fiercely. Your [pc.hips] move in turn, sawing your prick in and out of her greedy hole. Yammi takes as much as you can give, groaning breathily with every thrust. Her womanhood squeezes you with wanton lust, trying to at once draw you in and milk you. She’s so wet and ready, though, that you can’t help but thrust faster, working up to a fevered pace.");
	output("\n\nYammi’s head rolls back, moaning your name. Her ass jiggles and quakes every time your hips slap against it and her pussy drools excitement around your [pc.cockOrStrapon " + x + "]. The two of you fill the galley with a constant bevy of wet, lurid noises. Yammi’s fingers dig into your [pc.butt], pulling you ever deeper into her sensual embrace.");
	output("\n\nYou find yourself breaking off your kisses, bending back to explore her body with your mouth. Your lips quickly find their way to her breasts, catching a dark nipple between your teeth and pinching it just hard enough to make your lover’s quim squeeze you just that much more passionately. You can feel every pang of pleasure reciprocated through Yammi’s muscles, rewarding every grope and bite with a little squeeze around your shaft. And she’s only getting wetter, spreading her cool lubrication across your thighs");
	if(pc.balls > 0) output(" and [pc.balls]");
	output(".");
	output("\n\n<i>“Harder,”</i> she breathes into your [pc.ear]. <i>“Harder, [pc.name]!”</i>");
	output("\n\nCan’t argue with that!");
	output("\n\nTaking Yammi’s hips in both hands, you flip her over, letting her legs dangle over the edge. You pull her rump in the air, sinking both hands into the plump cheeks of her ass. Yammi struggles up onto her elbows, propping herself up to watch you over her shoulder. From her new position, every thrust against the bouncing butt makes her boobs jiggle obscenely. You can’t resist the temptation to reach forward and grab them, filling your hands with the weighty orbs and squeezing until Yammi screams, and you can feel her twat cumming around your thrusting pride, showering your groin with fem-cum.");
	output("\n\nYou keep thrusting right through your partner’s orgasm, keeping the same fast, but steady pace to let her ride it out to the fullest. Using her breasts as leverage, you pull her up, back against your [pc.chest], and into another long, loving kiss. As you do, you hilt yourself in Yammi’s clenching hole and let her spasming muscles do the rest. Her orgasm’s wet grip soon drives you to follow in her wake. Your [pc.cockOrStrapon " + x + "] throbs, ");
	if(x < 0) output("feeding back an overwhelming wave of pleasure through your body, making your [pc.skinFurScales] tingle uncontrollably");
	else output("surging with [pc.cum] before erupting into Yammi’s waiting womb");
	output(". You shudder, breath catching in your throat as climax sweeps over you. Instinctively, your grip on Yammi’s body tightens, holding her hard against yourself until your orgasm passes, leaving you both breathless");
	if(pc.cumQ() >= 200) output(", and Yammi’s cunt dripping your excess seed");
	output(".");

	output("\n\n<i>“Oh, [pc.name],”</i> Yammi murmurs, bracing her hands on the countertop. You take the opportunity to pull out, slowly ");
	if(x >= 0) output("withdrawing your [pc.cock " + x + "]");
	else output("deactivating your strapon");
	output(" and leaning your bare back against the refrigerator. Patting her butt, you pick up your");
	if(!pc.isCrotchExposed()) output(" [pc.gear]");
	else output(" gear");
	output(" and slowly but surely get yourself back together. While you do, Yammi takes a long moment to catch her breath before grabbing her bra and starting to redress.");
	output("\n\n<i>“That was... that was good,”</i> she says with a grin, leaning ");
	if(pc.tallness >= 72) output("up");
	else if(pc.tallness < 60) output("down");
	else output("in");
	output(" to plant a kiss on your cheek. <i>“Let me clean up and I’ll make us something to get all those calories back.”</i>");
	processTime(23);
	pc.orgasm();
	IncrementFlag("SEXED_YAMMI");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}