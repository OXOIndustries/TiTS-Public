/*Nayna Triverre - Nerdy Uvetan Climatologist
By Horsecockoxo

Body Notes:
====================
* 5’2” - unusually short for her race, and a little on the chubby side. No muscle tone to speak of. Suggested body reference: http://i.imgur.com/nRuI65J.jpg
* Perfectly white-furred. Born that way, and she sort of took it as a push to pursue her current career. Fur has grown plush and thick as a result of exposure to cold.
* Ears naturally droop onto her shoulders, but will sometimes perk up to hear something interesting (usually just one)
* Pink eyes
* White & black hair in a sensible ponytail.
* Clueless scientist stereotype to some extent. Incredibly smart, fairly clever in her fields, and has absolutely no idea if the PC starts flirting with her.
* Specializing in studying the climates and creatures of extremely cold planets.
* 9” horse-cock, extra thick (well below Laquine norms in length), apple sized balls - her genitals are squat and delightfully chubby - much like herself.
* Augmented her breasts (Laquines are generally only c-cups before preggoz)
* 95% spunk. A trier. A doer. Didn’t take dad’s advice and <i>“just give up”</i> or <i>“settle hard”</i>

Other Misc Notes
====================
* Everyone pushed her to be some kind of biologist or doctor - something that could help them solve their reproductive plague, including her parents, urging her to give up on her dreams of studying weather and climate to help her people.
* Studied twice as hard and got a scholarship on a kui-tan world at the Zinor Planetary Institute.
* One of two laquines on campus. Frequently called a dumb bunny when she would make an absent minded mistake.
* Dated a fox-girl cop, fresh from the academy (Penny’s friend from police academy) named Nikki, but it fell apart once Nayna got her doctorate and had to move off planet on her first research grant. Never got another girlfriend, because of how completely oblivious to flirting and attraction she is.
* Really, REALLY bad at reading people, despite her scientific brilliance
* Researching extreme cold weather climates with an emphasis on how their unique quirks could be useful for terraforming hot planets - and how warming terraforming could adapt to better handle their unique weather systems.
*/

public function showNayna(nude:Boolean = false):void
{
	if(nude) showBust("NAYNA_SUIT_NUDE");
	else if(naynaWarm()) showBust("NAYNA_SUIT");
	else showBust("NAYNA");
	if(flags["MET_NAYNA"] == undefined) showName("SPACE\nBUNNY-GIRL");
	else if(flags["NAYNA_LAST_NAME"] == undefined) showName("\nNAYNA");
	else showName("NAYNA\nTRIVERRE");
}

public function getNaynaPregContainer():PregnancyPlaceholder
{
	var pp:PregnancyPlaceholder = new PregnancyPlaceholder();
	if(!pp.hasCock()) pp.createCock();
	pp.shiftCock(0, GLOBAL.TYPE_EQUINE);
	pp.cocks[0].cLengthRaw = 9;
	pp.createPerk("Fixed CumQ",100000,0,0,0);
	
	return pp;
}

public function naynaShutterUpdate():void
{
	//Update? UPDATE!
	if(flags["UVETO_UPDATE"] == undefined || flags["UVETO_UPDATE"] != hours)
	{
		//0 = clear
		//1 = closed,
		//2 = cloud
		flags["SHUTTER_STATUS"] = 0;
		if(uvetoBlizzard()) flags["SHUTTER_STATUS"] = 1;
		else if(uvetoCloudy()) flags["SHUTTER_STATUS"] = 2;
		flags["UVETO_UPDATE"] = hours;
	}
}
public function naynaGloomy():Boolean
{
	naynaShutterUpdate();
	return (flags["SHUTTER_STATUS"] == 2 || flags["SHUTTER_STATUS"] == 1);
}
public function windowsOpen():Boolean
{
	naynaShutterUpdate();
	return (flags["SHUTTER_STATUS"] != 1);
}
public function naynaWarm():Boolean
{
	naynaShutterUpdate();
	return (flags["SHUTTER_STATUS"] == 0 && hours >= 6 && hours < 20);
}
public function naynaViewNice():Boolean
{
	return flags["SHUTTER_STATUS"] == 0;
}
//naynaClothes() - String, returns based on whether it’s warm in the tower: - maybe overwrite the usual clothing descript function in her creature file?
public function naynaClothes():String
{
	//Warm
	if(naynaWarm()) return RandomInCollection("sheer, latex bodysling with ZPI stamped on the bust","tight-fitting, rubbery bodysuit","rubbery unitard","inky undersuit","glistening, black bodysling","curve-hugging unitard","latex bodysuit","slick-looking undersuit","ZPI-stamped bodysling");
	//Cold
	else return RandomInCollection("fluffy, pink-furred winter wear","poofy winter coat","cold-weather outfit","fur-lined parka","pink-accented parka","fluffy, furry coat","squishy, warm-looking winter wear","poofy, white and pink parka");
}

public function naynaDroneBonus():Boolean
{
	if(flags["DRONED_UVIP F20"] == undefined && currentLocation == "UVIP F20"
		|| flags["DRONED_UVIP T6"] == undefined && currentLocation == "UVIP T6"
		|| flags["DRONED_UVIP V14"] == undefined && currentLocation == "UVIP V14"
		|| flags["DRONED_UVIP X34"] == undefined && currentLocation == "UVIP X34"
		|| flags["DRONED_UVIP L28"] == undefined && currentLocation == "UVIP L28")
	{
		output("\n\nA glint of shining metal peeks out of the snow.");
		addButton(0,"Metal Glint",lookAtWeatherDrone);
	}
	return TundraEncounterBonus();
}

public function lookAtWeatherDrone():void
{
	clearOutput();
	showName("WEATHER\nDRONE");
	output("A closer look reveals the metal to be a piece of a beat-up looking weather drone. ");
	if(flags["NAYNA_QUEST_STARTED"] == 1) output("This must be what Nayna was looking for. Maybe you should bring it back to her. ");
	else output("Maybe someone back in Irestead is looking for a missing drone. Or you could just sell it. Whichever. ");
	output("Do you take it?");
	if(flags["NAYNA_QUEST_STARTED"] == 1) output(" ")
	clearMenu();
	addButton(0,"Take It",takeANaynaDrone);
	addButton(14,"Back",mainGameMenu);
}

public function takeANaynaDrone():void
{
	clearOutput();
	switch(currentLocation)
	{
		case "UVIP F20": flags["DRONED_UVIP F20"] = 1; break;
		case "UVIP T6": flags["DRONED_UVIP T6"] = 1; break;
		case "UVIP V14": flags["DRONED_UVIP V14"] = 1; break;
		case "UVIP X34": flags["DRONED_UVIP X34"] = 1; break;
		case "UVIP L28": flags["DRONED_UVIP L28"] = 1; break;
	}
	output("You dig the poor drone out. ");
	output("\n\n");
	quickLoot(new WeatherDrone());
}

public function naynaSexMenu():void
{
	clearMenu();
	addButton(0,"Give BJ",maxLewdGogo,true,"Give BJ","Give her a blowjob.");
	if(pc.hasCock()) addButton(1,"Fuck Her",fuckNayna,undefined,"Fuck Her","Fuck Nayna using a penis.");
	else addDisabledButton(1,"Fuck Her","Fuck Her","You don’t have a penis to fuck her with.");
	addButton(2,"Anal Catch",naynaFucksYourButt,undefined,"Anal Catch","Get the shy bunny to put it in your butt.");
	if(pc.hasCock() && pc.biggestCockThickness() >= 5) addButton(3,"DickDock",naynaDockingForHyperPCs,undefined,"Dick Docking","Get Nayna to put her penis inside your far, far, far... FAR larger one. It’ll probably feel great.");
	else addDisabledButton(3,"DickDock","DickDock","You need an exceedingly large penis for this - something big enough for Nayna to put her dick inside of.");
	addButton(14,"Back",repeatNaynaApproach,true);
}
//Meeting Nayna
//Upstairs of the Geological Survey
//Semirandomly, determined every hour??
public function upstairsGeoSurveyBonus():Boolean
{
	naynaShutterUpdate();
	//CLOSED!
	if(flags["SHUTTER_STATUS"] == 1) output("The top of the geological survey is currently a dim, barren place. Shutters cover every inch of the glass observation windows, protecting you from the surging storms outside but blanketing the interior in shadow. A few glow panels struggle to illuminate the spacious deck, bolstered by blinking lights on dozens of consoles, but no matter how hard they try, they cannot dispel the creeping sense of twilight wrapping around your shoulders.");
	//SUNNY
	else if(flags["SHUTTER_STATUS"] == 0)
	{
		//Day - Sunny
		if(hours >= 6 && hours < 20) output("With all the protective shutters opened, the observation deck of the geological survey is surprisingly warm and cheery. Golden rays of sunlight bathe everything in amber warmth, reflecting and re-reflecting against the glass to raise the local temperature to something that could be considered balmy. Blinking, buzzing consoles have been set up in a small ring near the center, happily churning away at their tasks.");
		//Night Clear
		else output("The roof of the geological survey’s observation deck may hinder its view of the stars somewhat, but the reinforced glass panels that make up every wall more than make up for it. You can see hundreds upon hundreds of stars, a reddish-purple nebula, and even Uveto proper, this moon’s gas giant of a host. Whirring lazily, the computers set up in the center of the room seem almost determined to ignore the magnificent view as they march through the endless streams of data from the survey’s sensors. Their loss.");
	}
	//CLOUD
	else
	{
		//Day Cloud
		if(hours >= 6 && hours < 20) output("With all the protective shutters opened, the observation deck seems almost daringly, brazenly exposed to the slate gray skies of Uveto. Lightning sometimes dances between the clouds, lighting the room in bursts of garish yellow before fading back into ominous gray-blue. A few consoles resolutely blink as they stubbornly chew through scientific data, ignorant of the danger that exists an inch beyond the glass.");
		//Night Overcast
		else output("Despite the overhead light panels and the blinking status lights of dozens of computers, the observation deck of Uveto VII’s geological survey feels incontrovertibly gloomy. At least when you’re out in the black of space, you have stars and nebulas to take in, but with an overcast sky, there is nothing surrounding you but dim grays and black, an inky void of ice-cold death.");
	}
	//New functions:
	//First time bonusText!
	if(flags["MET_NAYNA"] == undefined)
	{
		output("\n\nA lone scientist seems to have claimed this place for her own, ");
		if(naynaViewNice()) output("amazing");
		else output("dismal");
		output(" view and all. She’s a short, chubby little thing with floppy bunny ears and an animalistic nose that quivers with every breath she takes. Presently, she’s pacing back and forth, looking over an incomprehensible projection from her Codex and as completely unaware of your presence as someone could possibly be.");
		output("\n\nYour Codex seems to indicate that she’s a laquine, though she’s much shorter than any you’ve ever seen.");
		CodexManager.unlockEntry("Laquines");
		addButton(0,"Laquine",approachDatLaquineSloot);
	}
	//Repeat Bonustext
	else
	{
		//PISSED OFF!
		if(flags["NAYNA_PISSED"] != undefined)
		{
			output("\n\nNayna is still here, though she studiously avoids your gaze. If you take a step toward her, she shifts backward. If you approach her, she moves to another part of the deck, as if she had something important to do elsewhere all the while. She wants nothing to do with you.");
			addDisabledButton(0,"Nayna","Nayna","You pissed Nayna off, and it seems there’s no salvaging the situation.");
		}
		//Didn’t take offer
		else if(flags["NAYNA_REJECTED"] != undefined) output("\n\nNayna is still here, tapping away at an unbroken Codex, doubtless absorbed in the minutia of her research. You could approach her again, but she’s probably still grouchy about your refusal to help her out.");
		//Took her Offer Bonustexts
		else
		{
			//Warm!
			if(naynaWarm()) output("\n\nNayna seems to enjoying the limited warmth provided by the sun, lounging around in her " + naynaClothes() + " while she pours over climate data from dozens of sources. What a busy little bunny.");
			//Beautiful night
			else if(naynaViewNice()) output("\n\nNayna is leaning back against one of the computer consoles, looking out at the stars, her Codex forgotten. Looks like even the busy bunny still takes breaks to appreciate the view.");
			//Cloudy/Shuttered
			else output("\n\nNayna does not seem to be bothered by the tower’s sullen atmosphere, wrapped up in her " + naynaClothes() + ". She reminds you of a chubby little bunny in a cozy little burrow, only this bunny is plowing through enough information to make your head spin.");
		}
		//Approach button if not disabled~
		if(flags["NAYNA_PISSED"] == undefined) addButton(0,"Nayna",repeatNaynaApproach);
	}
	return false;
}

//Approach Dat Sloot
public function approachDatLaquineSloot():void
{
	clearOutput();
	showNayna();
	output("You clear your throat and approach, but even that isn’t enough to attract the oblivious bunny-woman’s attentions. She’s just sitting there in her " + naynaClothes() + ", chewing on her lower lip and poking at her tablet.");
	output("\n\n<i>“");
	if(pc.isBimbo()) output("Omigosh! You’re so cuuute!");
	else if(pc.isNice()) output("Excuse me, miss?");
	else if(pc.isMischievous()) output("Are you deaf?");
	else output("Hey, slut!");
	output("”</i> You try again, your voice uncomfortably loud in the otherwise empty room.");

	output("\n\nThe bunny-woman bounces to her feet in alarm, screaming, <i>“Gya!”</i> Spinning and windmilling, she loses hold on her tablet, sending it flying straight at you. ");
	var bonked:Boolean = false;
	if(rand(20) + pc.reflexes()/2 < 35) 
	{
		output("It smacks off your forehead and careens into the corner, landing with a rather unpleasant cracking sound.");
		bonked = true;
	}
	else output("It nearly hits you. If it weren’t for your impressive reflexes, it would’ve clanged right into your head. Instead, it smacks into the floor with a nasty-sounding crack.");
	output("\n\n<i>“Sorry! Sorry...”</i> The floppy-eared girl stumbles back, covering her mouth. <i>“...sorry.”</i> Her eyes are wide, big pink saucers that look on the verge of bursting into tears. <i>“I didn’t know you were there. I didn’t mean to...”</i> Exhaling, the meek little bunny wilts. <i>“I’m such a klutz. It’s a good thing I didn’t have anything heavier in my hand.");
	if(bonked) output(" ...And I can probably pay any medical bills. I hope.");
	output(" But you can’t sneak up on a girl like that!”</i> Composure recovered, she plants her hands on particularly plush hips and adds, <i>“You could’ve knocked, you know!”</i>");
	output("\n\nYou point back at the open stairwell behind you.");
	output("\n\n<i>“Well... you coulda knocked on the wall or something.”</i>");
	output("\n\n");
	if(pc.isBimbo()) output("<i>“Oh, duh! My bad!”</i> you giggle.");
	else output("Again, you look at the metal steps - the <i>noisy</i> metal steps.");
	output("\n\nBounding over to collect her damaged Codex, the white-furred rabbit-woman lifts her pudgy heiny");
	if(naynaWarm()) output(", bunny-tail wiggling");
	output(", completely unaware of how revealing a posture she’s adopted. After two or three hypnotic seconds, she straightens, pouting. <i>“I broke another one. Rats!”</i>");
	processTime(6);
	//[Introduce] [Offer To Pay] [Leave]
	clearMenu();
	addButton(0,"Introduce",introduceYourselfToNayna,undefined,"Introduce","Introduce yourself.");
	addButton(1,"Offer to Pay",offerToPayForNaynaCodex,undefined,"Offer to Pay","Offer to pay for the broken codex.");
	addButton(14,"Leave",leaveNaynaFirstMeeting);
}
//Introduce
public function introduceYourselfToNayna():void
{
	clearOutput();
	showNayna();
	output("You introduce yourself before she can ramble any more.");
	output("\n\n<i>“Oh! I’m so sorry. I should’ve introduced myself!”</i> She bounces over, extending her hand in a polite greeting. <i>“I’m Nayna Triverre, climatologist. If you ever need a little help figuring out the cold, I’m your girl... err, bunny. Well, laquine to be precise. Hrmm, let me try again.”</i> Her foot bounces idly as she gathers her thoughts. <i>“If you ever need a little help with the weather, I’m the one for the job.”</i> She brushes her hands against one another as if clearing them of a disdainful topic, then brightens, ears lifting halfway up. <i>“Actually, there’s a way you could help me out, if you’re going to be going out into the white. Interested?”</i>");
	flags["MET_NAYNA"] = 1;
	processTime(3);
	//MET_NAYNA
	//Same menu with introduce grayed out
	clearMenu();
	addButton(0,"Help",volunteerToHelp,false,"Help","Volunteer to help her out.");
	addButton(1,"Don’t",dontVolunteerToHelpNayna,undefined,"Don’t","You don’t volunteer to help every random girl you run into.");
}

//Offer to Pay
public function offerToPayForNaynaCodex():void
{
	clearOutput();
	showNayna();
	output("You offer to pay for the damaged Codex.");
	output("\n\n<i>“Oh no, don’t bother. Please.”</i> ");
	if(flags["MET_NAYNA"] != undefined) output("Nayna");
	else output("The diminutive rabbit-girl");
	output(" runs her hand through her hair, smoothing back one of her ears. <i>“The grant should more than cover the expenses, besides, it was my fault. I’m the one that flipped out, so it follows that I should have to source the necessary expenditures. You just wanted to say hi");
	if(flags["MET_NAYNA"] == undefined) output(" and introduce yourself");
	output(", right?”</i>");
	processTime(1);
	//Same menu with pay grayed out. Leave grayed out if not yet introduced
	addDisabledButton(1,"Offer to Pay","Offer to Pay","You already tried to do this.");
}

//Leave
//Not yet introduced
public function leaveNaynaFirstMeeting():void
{
	clearOutput();
	showNayna();
	output("You try excuse yourself before this clumsy little hare puts you through any more hair-raising incidents.");
	output("\n\n<i>“Wait!”</i> she calls, grabbing you by the wrist. <i>“I didn’t even get your name! If I don’t include all the relevant data when I file the accident report, the department head will have my... well, head.”</i>");
	output("\n\nDo you give her your name?");
	processTime(2);
	clearMenu();
	addButton(0,"Refuse",refuseToGiveNaynaYourName);
	addButton(1,"Lie",lieAboutNameToNayna);
	addButton(2,"Give Name",reluctantlyGiveNaynaName);
}

//Refuse Name
public function refuseToGiveNaynaYourName():void
{
	clearOutput();
	showNayna();
	output("You pull your hand free and make to leave, but the hare is determined to get an answer out of you. <i>“If you don’t tell me, I’m going to follow you around Uveto until you give me that data point, whether you want to or not! ");
	if(!naynaWarm()) output("This coat isn’t just for show! I’ve not just some meek little bunny who won’t brave the cold!");
	else output("I’ve got a coat and everything. It wouldn’t be the first time I’ve gone out in the white!");
	output("”</i>");
	output("\n\nIt looks like she won’t give you a minute of peace until you give her your name.");
	processTime(1);
	//Name menu with refuse grayed out
	addDisabledButton(0,"Refuse","Refuse","You already tried that.");
}

//Lie About Name
public function lieAboutNameToNayna():void
{
	clearOutput();
	showNayna();
	output("Rather than give her the real deal (who wants a lawsuit?), you say the first thing that comes to mind, <i>“Fine, I’m " + pc.mf("Francis","Francine") + " Oppenhelmer if you must know!”</i>");
	output("\n\n<i>“Thank you,”</i> the scientist replies, <i>“but I’ll need something a little more legitimate to put in this report. You see, you haven’t been on any of the transit manifests... ever, and I do not forget a name - or a face. If you arrived on-moon before me, I’d remember you. So why don’t you tell me who you are, " + pc.mfn("big boy","big girl","hot-cakes") + ", and we can both get on with our lives - me, with a new Codex, and you, lying to whatever dumb hussy is stupid enough to fall for that farce of a name?”</i>");
	output("\n\nShit. What do you do?");
	processTime(2);
	//Gray out lie, proceed, yadda yadda
	addDisabledButton(1,"Lie","Lie","You already tried that.");
}

//Reluctantly Give Name
public function reluctantlyGiveNaynaName():void
{
	clearOutput();
	showNayna();
	output("<i>“[pc.name] Steele,”</i> you reluctantly admit.");
	output("\n\nNodding to herself, the long-eared lady smiles apologetically. <i>“Sorry to put you through all that, but I’d be in real hot water if I reported another broken Codex without any sort of corroboration.”</i>");
	output("\n\nYou sigh.");
	output("\n\n<i>“By the way, my name’s Nayna. If you ever need data on Uveto’s climate, or any cold weather planet, really. I’m your girl.”</i> She pauses thoughtfully, her ears slowly raising. <i>“Heyyy... do you think you could do me a favor?”</i>");
	//[MET_NAYNA = 2 - track that you got brow-beat into it.
	processTime(2);
	flags["MET_NAYNA"] = 2;
	processTime(2);
	clearMenu();
	addButton(0,"Help",volunteerToHelp,true,"Help","Volunteer to help her out.");
	addButton(1,"Don’t",dontVolunteerToHelpNayna,undefined,"Don’t","You don’t volunteer to help every random girl you run into.");
}

//Volunteer to Help
public function volunteerToHelp(late:Boolean = false):void
{
	clearOutput();
	showNayna();
	//From intro
	if(!late)
	{
		output("<i>“Sure, whatcha need");
		if(pc.isBimbo()) output(", cutie");
		output("?”</i>");
		output("\n\nNayna starts to rub at her neck and grouse, <i>“I shoulda figured you wouldn’t want to - wait... what?”</i>");
	}
	//From Repeat approach after declining
	else
	{
		output("<i>“All right, I’ll help. Fill me in");
		if(pc.isBimbo()) output(", cutie");
		output(".”</i>");
		output("\n\nNayna sighs heavily, starting to wave you away, when she freezes like a deer caught in the headlights. <i>“Wait, what? Really?”</i>");
	}
	//Merge
	output("\n\n");
	if(pc.isBimbo()) output("You sweep her into a big hug, gushing, <i>“I want to help you! You’re so adorable!”</i>");
	else if(pc.isNice()) output("You flash her a winning smile. <i>“I want to help.”</i>");
	else if(pc.isMischievous()) output("You grin. <i>“What kind of rusher would I be if I didn’t take the time to help out cute bunnies?”</i>");
	else output("You flash her a bored look. <i>“I offered to help. Now tell me what you need before I change my mind.”</i>");

	//Misch or bimbo
	/* CUT - Could ruffle feathers, and it isn’t worth the Zootopia reference.
	output("\n\n<i>“Just so you know, you shouldn’t use that word other laquines. It’s sort of </i>our<i> word. I mean, it’s okay for a laquine to call another laquine cute, but when other people use it, it can take on this sort of nasty connotation that’s best just avoided. Personally, I don’t really mind. I’d rather be a cute bunny than a dumb bunny.”</i> She claps her hands over her mouth and blushes hard enough for pink to peek through her fluffy, white fur.");*/
	output("\n\n<i>“Sorry. Okay... I’m collecting extremely high resolution data on temperature anomalies on cold weather planets. The idea is that if we can perfectly understand how heat spikes or cool spots affect the flora, fauna, and geological formations, we can better predict the results of terraforming other planets - cold ones in particular, but the data is useful across a broad spectrum.”</i> Nayna smiles brightly at that, bouncing up on the balls of her feet. <i>“And not </i>just<i> for terraforming either. Extreme weather modeling has all sorts of uses. The code monkeys back at campus are begging me for more data - particularly our actual code monkey. I’m no slouch with a compiler, but that simii’s brain is magic.”</i>");
	output("\n\nYou arch an eyebrow, wondering where you come in to all this.");
	output("\n\nOn a roll now, Nayna grabs you by the " + (pc.tallness <= 54 ? "shoulder" : "arm") + " and pulls you toward a small, inactive drone that’s lying on the floor. <i>“Satellites suck for getting fine detail thanks to all the storms this planet has, electromagnetic or otherwise, so I’m stuck using these drones. The problem is that half of them don’t make it back. I’m not sure if the locals are taking them out or if the weather is doing the job for them, but I need them back. These kinds of losses aren’t in the budget...”</i>");
	output("\n\n");
	if(!pc.isBimbo()) output("Ahhh, she wants you to go find her missing drones.");
	else output("You chew on your lip and wonder when she’s going to tell you about the reward. Will it be sex? You hope it’ll be sex.");
	output("\n\nNayna grabs hold of one of her ears in both hands and nervously kneads the tip. <i>“Do you think you can bring me back any you find out there? You’d be doing a service to science... and I’d appreciate it too.”</i>");
	processTime(3);
	flags["NAYNA_REJECTED"] = undefined;
	//[No Reward?]
	clearMenu();
	addButton(0,"Sure",sureNaynaIllHelp);
	addButton(1,"No Reward?",noRewardNaynaYouCheapo);

}

//No Reward?
public function noRewardNaynaYouCheapo():void
{
	clearOutput();
	showNayna();
	output("<i>“Can’t I get some kind of reward?”</i>");
	output("\n\nNayna blanches. <i>“Uhm, not really. If I can’t afford a few data-gathering ‘bots, how am I supposed to afford a talented, planet-hopping mercenary?”</i> She sighs. <i>“Look, you don’t have to go looking for them, you would be saving my fluffy little tail if you would bring me any you find.”</i>");
	output("\n\nYou nod, not sure that you’ll bother, but it’s not worth crushing her dreams at the moment.");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Sure
public function sureNaynaIllHelp():void
{
	clearOutput();
	showNayna();
	output("<i>“Sure.”</i>");
	output("\n\nNayna grabs hold of your hands and bounces up and down in excitement, hopping happily in the way that only a laquine can. <i>“Thankyouthankyou! You won’t regret this. The others involved in the project will be glad to hear that someone’s finally looking out for us academics!”</i>");
	output("\n\nYou assure her that it’s no problem.");
	output("\n\n<i>“Okay, well... I better not keep you. Come see me if you find any, okay?”</i>");
	flags["NAYNA_QUEST_STARTED"] = 1;
	processTime(3);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Don’t Volunteer to Help
public function dontVolunteerToHelpNayna():void
{
	clearOutput();
	showNayna();
	output("<i>“I’ll pass");
	if(pc.isBimbo()) output(", cutie");
	output(".”</i>");
	output("\n\nNayna sighs and rubs the back of her neck. <i>“I shoulda figured. Who’d wanna help the clumsy bunny figure out nonstandard temperature flux in the wildest parts of Uveto? Why would anyone stick their neck out for someone that throws Codices like ninja stars.”</i> She tosses her busted tablet in the trash, wanders over to a storage compartment, presumably where a replacement might be, muttering, <i>“Stupid, stupid, stupid...”</i>");
	flags["NAYNA_REJECTED"] = 1;
	processTime(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function repeatNaynaApproach(backsies:Boolean = false):void
{
	clearOutput();
	showNayna();
	//Didn’t Take Quest
	if(flags["NAYNA_REJECTED"] != undefined)
	{
		output("Nayna’s ear lifts higher and higher as you close the distance with her, swiveling to face you long before her head does the same. <i>“You’re not going to trick me into breaking another Codex, if that’s what you’re here for.”</i>");
		output("\n\n<i>“I-”</i> You start to talk, but she cuts you off before you can get more than a single syllable out.");
		output("\n\n<i>“I don’t mean to be rude. I don’t, but I’ve got my ass to the wall. I’m over budget and overworked. I’ve got secure twice the results from half the data, and even if I do, the project’s funding may be cut before I can survey the other six planets on my list. If I could find someone to recover my missing drones, I’d have a lot more time to talk.”</i> Nayna’s ears flop down like limp spaghetti noodles.");
		processTime(1);
		//[Help Her Out] [Leave]
		//Help her out routes to the earlier help her out offer.
		clearMenu();
		addButton(0,"Help Her Out",volunteerToHelp,true);
		addButton(14,"Back",mainGameMenu);
		return;
	}
	//Took Quest
	else
	{
		if(!backsies)
		{
			output("Nayna’s ear lifts higher and higher, pivoting to follow your progress through the room. When you’re a few steps away, the other joins it, swiveling to regard you a half-second before the rest of the laquine. <i>“[pc.name]! How goes your adventures? Have you come across any of my drones yet?”</i>");
			//No drones
			if(!pc.hasItemByClass(WeatherDrone,1))
			{
				output("\n\nYou shake your head apologetically.");
				output("\n\n<i>“Hey, don’t worry about it,”</i> Nayna chirps. <i>“I’m sure you’ll find some before too long. After all, you’re the brave rusher, out looking for adventure!”</i>");
			}
		}
		else
		{
			output("Nayna brushes back an ear. <i>“Anything else?”</i>");
		}
		//Main Nayna menu:
		naynaMainMenu();
	}
}

public function naynaMainMenu():void
{
	clearMenu();
	//[Appearance] [Talk] [Give Drone] [Flirt]
	addButton(0,"Appearance",appearanceOfNayna);
	addButton(1,"Talk",talkToNayna);
	if(pc.hasItemByClass(WeatherDrone,1)) addButton(2,"Give Drone",giveHerADrone,undefined,"Give Her A Drone","Give Nayna one of the drones she’s missing. Turns out these are the drones she’s looking for.");
	addButton(3,"Flirt",flirtWithNayna,undefined,"Flirt","Flirt with the cuddly bunny.");
	addButton(14,"Leave",mainGameMenu);
}

//Appearance
public function appearanceOfNayna():void
{
	clearOutput();
	showNayna();
	output("Nayna");
	if(flags["NAYNA_LAST_NAME"] != undefined) output(" Triverre");
	output(" is.... Well, she’s a rabbit-woman, like most laquine. She’s got big bunny ears that seem content to droop down the back of head and fur that covers every visible part of her body. Her black and white hair is tied back in a sensible ponytail, which when combined with her ears, could easily be mistaken for a trio of ponytails. A triangular black nose tips her short, rabbit-like muzzle, matched by inky little lips that seem ready to smile at a moment’s notice.");
	//Warm!
	if(naynaWarm())
	{
		output("\n\nEven when she’s standing up straight, Nayna is barely 5’2”, well below average for her race, and on top of that, she’s chubby to boot. Her entire body is like a big, squishy stuffed animal, covered in a thick layer of insulating fur that only adds to her short, stacked shape. Her hips and ass are especially plush and inviting, shrink-wrapped in her latex-like unitard. She’s got the kind of ass that you could snuggle up next to and fall asleep - or fuck for hours, bouncing off those quivering cheeks like a trampoline, but her chest is no slouch either. Nayna has the kind of big yet perky breasts that frequently result for artificial enhancement. They still sway and wobble, but they never seem to sag, not even with her complete lack of a bra.");
		output("\n\nAn unsubtle bulge marrs the space between her legs, or rather, three unsubtle bulges. She’s definitely a hermaphrodite, judging by the two apple-sized distentions of her balls and slight sheath bulge. Right now she doesn’t seem to be very turned on, either that or she’s obtained a magnificent control over her libido.");
		if(pc.isBimbo()) output(" Your mouth waters just thinking of suckling at it until her cock slides out onto your tongue.");
	}
	//Cold
	else
	{
		output("\n\nEven when she’s standing up straight, Nayna is barely 5’2”, well below average for her race, and on top of that, she’s chubby to boot. Her entire body is like a big, squishy stuffed animal, covered in a thick layer of insulating fur that only adds to her short, stacked shape. Her hips and ass are especially plush and inviting. You wish they weren’t wrapped up in so many layers of insulation. She stretches her insulating pants out far enough to indicate that she’s hiding some serious booty in there, and she’s no slouch up top either. Her pink-lined parka is definitely hiding two decent-sized mounds underneath. You wouldn’t notice them otherwise, swaddled as they are in thick fabric.");
		output("\n\nYou can’t really make much out between her legs, ");
		if(knowNayneIsAHerm()) output("but you know damned well she’s a hermaphrodite, even if her cock shares the same short and thick proportions as the rest of her.");
		else output("but it’s a safe bet that she’s either a female or hermaphrodite, knowing laquines.");
	}
	//Merge
	output("\n\nFlexing powerfully, the lapine woman’s legs are every bit as powerful as the terran creature’s she resembles. She’s strong enough to hop around the room in the throes of gleeful mania when a new idea strikes her - or punt you down the stairs with contemptuous ease, should you raise her ire.");
	if(!naynaWarm()) output(" Those plus-sized snow-boots look like they’d smart.");
	naynaMainMenu();
	addDisabledButton(0,"Appearance","Appearance");
}

//Talk
public function talkToNayna(back:Boolean = false):void
{
	clearOutput();
	showNayna();
	//Back
	if(back) 
	{
		output("Nayna’s ears perk up a little higher. <i>“Oh, do you want to talk some more?”</i> Suddenly, she seems terribly, almost violently lonely - and grateful for the companionship.");
	}
	else
	{
		//First time
		if(flags["NAYNA_TALKED"] == undefined)
		{
			output("<i>“Actually, I’d like to talk.”</i>");
			output("\n\nNayna cocks her head to the side, staring at you blankly. <i>“Why... why would you want to talk with me? I’m not permitted to share the finer details of my project until we’ve published, and well, I’m just a dumpy little laquine. Surely you can make better use of your time entertaining beautiful rahn dancers and adorable ausar.”</i>");
			//Bimbo
			if(pc.isBimbo()) output("\n\n<i>“Don’t say that! You’re so fucking cute! I mean... look at that bunny bootie! The boys would eat it right up in a heartbeat.”</i> You walk around behind her and bend low, making exaggerated chomping motions with your mouth.");
			//Nice
			else if(pc.isNice()) output("\n\n<i>“Oh come on, I’m sure there are plenty of people that would absolutely love an adorable bunny like you to snuggle up against.”</i> You walk in a circle around her, mock examining her. <i>“Yeah, you’ve just got to be more confident about yourself.”</i>");
			//Mischievous
			else if(pc.isMischievous()) output("\n\n<i>“Well, let me check.”</i> You circle around her, scratching your chin and nodding to yourself, occasionally muttering, ‘mmhmm’. After a minute of this, you stop in front of her and proclaim, <i>“Definitely worth my time. Sorry, Nayna. You can’t get away from me that easily.”</i>");
			//Hard
			else output("\n\n<i>“I’ll be the judge of what’s worth my time, Nayna.”</i> You nod curtly, <i>“but if you insist on being evaluated by your mere physical attributes, I find you to be acceptable company. Now let’s talk.”</i>");
			//Merge
			output("\n\n<i>“Oh.”</i> Covering her mouth in embarrassment, the white-haired hare quietly asks, <i>“So... um... what did you want to talk about?”</i>");
		}
		//REPEATS!
		else
		{
			output("\n\nNayna’s ears perk halfway up. <i>“Really? You want to talk again?”</i> She seems genuinely surprised by your request. <i>“But what are we going to talk about? I’m so boring.”</i> Flopping back, she drops her Codex and looks up at you, expecting you to save her with a topic.");
		}
	}
	//[Her] [Education] [Uveto]
	processTime(2);
	clearMenu();
	addButton(0,"Her",talkToNaynaAboutNayna);
	addButton(1,"Education",naynaEducationTalk);
	addButton(2,"Uveto",uvetoTalkWithNayna);
	addButton(14,"Back",repeatNaynaApproach,true)

}

public function knowNayneIsAHerm():Boolean
{
	if(flags["NAYNA_LAST_NAME"] != undefined) return true;
	return false;
}

//Talk: Her
public function talkToNaynaAboutNayna():void
{
	clearOutput();
	showNayna();
	output("<i>“What about you? I don’t even know your full name.”</i>");
	output("\n\nNayna grabs onto your conversational lifeline with both hands. <i>“Oh, of course! Sorry about that. My full name is Nayna Triverre. I’ve gotten so used to interfacing the crude mining folk here that I guess civilized courtesy has escaped me.”</i> She blinks innocently at you, then gasps once she realizes you expect more, floundering around as she searches for more to say. <i>“Oh, and I’m a laquine, I guess, but you know that, right? I mean, I have these big dumb ears and this stupid little twitchy nose. It’d be hard to miss.”</i>");
	output("\n\nYou nod");
	if(!pc.isAss()) output(", but mention that there’s nothing dumb or stupid about the way she looks.");
	else output(", hoping she’ll tell you something a little less obvious.");
	output("\n\nNayna blunders right on. Now that she’s gotten started, it seems like her mouth is ready to go on autopilot. <i>“And since I’m a laquine hermaphrodite, everybody pushed me into science. What kind of weird culture expects that sort of thing, anyway? Just because you get born with a vagina and an under-sized penis doesn’t mean you’re going to be better at science.”</i> She looks away and gasps, realizing what she just said. <i>“You aren’t offended, are you? I know some coreward folks get uncomfortable about stuff like this.”</i>");
	output("\n\nOpenly grinning, you let her know that you’ve seen far worse in your journeys.");
	output("\n\n<i>“Oh... okay then.”</i> Nayna sits a little straighter and explains. <i>“A lot of the other kids thought I won the genetic lottery, getting to be a hermaphrodite. The best of both worlds right? Well, I think I lost it, twice. I’d be just as good of a scientist if I was a normal girl or boy. And maybe I wouldn’t have wound up so stunted and fat.”</i> Blushing, she adds, <i>“I didn’t even get a normal sized dick! It should be twice as long. Who would even want to use a nine incher? Not me, that’s for damned sure, but who needs sex, anyway?”</i>");
	output("\n\nYou raise an eyebrow but let her keep ranting.");
	output("\n\n<i>“It’s fine. Thanks to the stupid genetic plague, I’m basically infertile anyhow. So what’s the point in wasting time on sex? I’m going to make the galaxy a better place with my time. That’s what I’m going to do. Honestly, people would be a lot better off if they’d stop thinking with their junk and pumping up their libidos. Have you seen the people on New Texas? They’re basically turning themselves into fuck-robots.”</i> Nayna shakes her head, sending her ears flapping. <i>“But yeah, that’s me, just a little bunny with too much in her pants and no intention of using any of it.”</i>");
	processTime(6);
	flags["NAYNA_LAST_NAME"] = 1;
	clearMenu();
	addButton(0,"Talk More",talkToNayna,true);
	addButton(14,"Back",repeatNaynaApproach,true);
}

//Education
public function naynaEducationTalk():void
{
	clearOutput();
	showNayna();
	output("<i>“How’d you train for a gig like this?”</i>");
	//First
	if(flags["NAYNA_EDUCATION"] == undefined)
	{
		output("\n\nBouncing up onto a sturdy-looking console, Nayna gives you a curious look. <i>“You really don’t know?”</i>");
		output("\n\nYou let her know that don’t.");
	}
	//Repeat
	else
	{
		output("\n\nBouncing up onto a sturdy-looking console, Nayna sighs, <i>“Again?”</i>");
		output("\n\nYou nod.");
	}
	//Merge
	output("\n\n<i>“Wow, okay. It isn’t easy, really. You can’t just go to a technical school or learn by doing. You’ve got to go to an academy - one of the big, planetary institutions if you can help it. The more impressive the school, the better. Then you have to select a field of study and master it. Me? I pursued climatology, though I also studied a bit of biology on the side. Mom and Dad would’ve crucified me if I didn’t.”</i> Nayna shakes her head, then stares ");
	if(flags["SHUTTER_STATUS"] != 1) output("out the window");
	else output("at the closed shutters");
	output(". <i>“I think, deep down, they still think this is just a phase - that I’ll come to my senses and finally pursue a real career.”</i> Laughing, the long-eared lapine wipes a tear from her eyes.");
	output("\n\n");
	if(flags["NAYNA_EDUCATION"] == undefined) output("You push her, asking why her parents would do such a thing.");
	else output("You ask her if she could recount why they would do that.");
	output("\n\n<i>“The genetic plague!”</i> Nayna honestly seems surprised that you didn’t figure it out on your own. <i>“About thirty years back, laquine fertility starting nose diving, and it’s only gotten worse with time. I’m basically sterile, for example. Most of our top minds are tackling the issue. Every laquine with more than a few brain cells to rub together thinks she’s going to be the one to cure, the one to save our people. Well, every laquine aside from me.”</i>");
	output("\n\n<i>“Why not you?”</i>");
	output("\n\nNayna shrugs. <i>“It just didn’t appeal to me. Why would I want to pick apart cells when I could learn about the fabulous little crystals that make up snow? Who wants to dissect a dead animal when you could load up a simulated blizzard on your holo and see how the clouds spin around each other? It may not make much scientific sense, but I was born with white fur. It’s like I was made to play in the snow. For a short, dumpy bunny, I wrecked at snowball fights, and I wreck at reading weather data just as hard.”</i>");
	output("\n\nYou press the issue. <i>“But didn’t you feel some kind of obligation to help your people?”</i>");
	output("\n\n<i>“What help would I be? There are thousands of laquine scientists putting their all into solving that problem. At best, I might make a useful lab assistant. At worst, I’d just be in everyone’s way. No, it’s better that they can focus without my distractions, and I can pursue my passion. Besides, laquines aren’t the only sapients in the galaxy. Even with the rush, habitable planets fill up fast. If I can make it possible to terraform a few dozen more, billions of lives could be saved - or improved. Imagine how many conflicts could have been avoided if everyone just had a little more room?”</i>");
	output("\n\nNodding, you can’t help but agree.");
	if(pc.isBimbo()) output(" She sounds way too smart to disagree with!");
	else output(" More than one war has broken out over colonization disputes.");
	output("\n\nNayna smiles warmly at you. <i>“I’m glad you agree. Back on topic, I went to ZPI: Zinor Planetary Institute. They have one of the best weather studies programs in the sector, and I got in. There was only one other laquine that made the cut; Zinor is a terran world that doesn’t take a lot of off-world admission. We may have started out as the resident ‘dumb bunnies’ and ‘furry trash,’ but we also clawed our way to the top of the academic scoreboard.”</i> Smiling wider, she reveals the whole of her lapine buckteeth. <i>“Don’t get me wrong, I was a clumsy mess back then. The first nickname never really went away, but I got my revenge by being better where it mattered - in class.”</i>");
	processTime(5);
	//[Next]
	clearMenu();
	addButton(0,"Next",naynaEducationTalk2);
}

public function naynaEducationTalk2():void
{
	clearOutput();
	showNayna();
	output("Nayna pauses her story to look you in the eye, her striking pink pupils dilating slightly. <i>“It feels nice to talk about this with someone. I haven’t opened up like this to someone since I met Nikki.”</i>");
	output("\n\n<i>“Who’s Nikki?”</i>");
	output("\n\nNayna sighs, pleased smile fading in an instant. <i>“My ex. Cute little fox-girl cop that moved on campus not long before I graduated. It turns out she was a terran originally, but we faced a fair number of identical issues. Just because someone shares a few traits with some small terran creature does not mean that they can be treated like one. She liked to listen to me bitch about the weather reports too. I miss her.”</i>");
	output("\n\nYou gently try to probe for more information, asking what happened to her former lover.");
	output("\n\n<i>“Lover? I don’t know if... I mean...”</i> Nayna blushes crimson, shading her fur pink from below. <i>“We never really got past kissing. She was probably just tolerating me for companionship, waiting for a cuter laquine to show up, but it was nice all the same.”</i> She straightens, realizing how far off base she’s gotten. <i>“Uhm... back on topic, there wasn’t much more to it. Go to a great school, get good grades, and push the science as far as it will go.”</i> She nods a little too vigorously, ears flapping.");
	processTime(4);
	flags["NAYNA_EDUCATION"] = 1;
	//[Next]
	clearMenu();
	addButton(0,"Talk More",talkToNayna,true);
	addButton(14,"Back",repeatNaynaApproach,true);
}

//Uveto
public function uvetoTalkWithNayna():void
{
	clearOutput();
	showNayna();
	output("<i>“What brought you to Uveto?”</i>");
	output("\n\nNayna wrinkles her nose at you. <i>“My study, silly. I can’t go into the specifics until after I get it published, but suffice to say that it is going to revolutionize cold weather modeling as well as terraforming. I’m connecting data points that everyone else ignores as inconsequential, stitching them together into a gestalt that most climatologists have waved off as random variation.”</i>");
	//Not saved enough drones
	if(flags["NAYNA_DRONES_TURNED_IN"] == undefined) flags["NAYNA_DRONES_TURNED_IN"] = 0;
	if(flags["NAYNA_DRONES_TURNED_IN"] < 3)
	{
		output("\n\nPausing, she looks at her toes, sighing heavily. <i>“That’s assuming I don’t get my funding cut and have to wallow in obscurity. Why couldn’t these drones be as cold tolerant as me?”</i> She kicks a loose panel, and looks over at you. <i>“I hope you can find ");
		if(flags["NAYNA_DRONES_TURNED_IN"] == 0) output("them");
		else if(flags["NAYNA_DRONES_TURNED_IN"] == 1) output("a few more of them");
		else output("another one");
		output(".”</i>");
	}
	//Saved a few drones
	else
	{
		output("\n\nPausing, she looks ");
		if(naynaViewNice()) output("at the beautiful scenery outside");
		else if(flags["SHUTTER_STATUS"] != 1) output("menacing view outside");
		else output("tightly sealed shutters");
		output(". <i>“Well, that and the scenery, I guess. A lot of people write snow planets off as being cold, cruel places, but when you’ve got thick fur and a heat-belt, they can be quite pleasant. Nothing feels quite like cool crisp air. No night sky ever seems as clear as one after a fresh snowfall. There’s beauty in the starkness of it all. ...And, lucky me, I’ll be visiting a half-dozen more before this study is done.”</i>");
	}
	processTime(3);
	clearMenu();
	addButton(0,"Talk More",talkToNayna,true);
	addButton(14,"Back",repeatNaynaApproach,true);
}

//Flirt
public function flirtWithNayna():void
{
	clearOutput();
	showNayna();
	if(flags["NAYNA_BLOWN"] != undefined)
	{
		//Post-Sex Flirt
		output("<i>“Why don’t you take a break and blow off some steam?”</i> You look her up and down, then add, <i>“");
		if(!naynaWarm()) output("There’s more than one way to stay warm on a planet like this.");
		else output("That bodysuit must be so stifling!");
		output("”</i>");
		output("\n\nNayna blinks at you, then looks back at her Codex, then back at you. She chews a lip, then slowly, ever so slowly begins to blush pink through her ivory fur. <i>“Are you... are you flirting with me?”</i> She gingerly puts down her Codex, her paw shaking");
		if(!naynaWarm()) output(", then slowly pulls down the zipper to her parka");
		output(". <i>“That would be... acceptable.”</i>");
		output("\n\n<i>“I am,”</i> you admit, stepping closer.");
		output("\n\nNayna’s violet eyes widen. <i>“Really?”</i>");
		if(!naynaWarm()) output(" She wiggles out of her cold-weather gear, stripping down to her rubbery undersuit.");
		output(" Nibbling on her lower lip, the nervous bunny asks, <i>“What did you want to do... uhm... cutie?”</i>");
		naynaSexMenu();
	}
	else
	{
		output("<i>“Why don’t you take a break and blow off some steam?”</i> You look her up and down, then add, <i>“");
		if(!naynaWarm()) output("There’s more than one way to stay warm on a planet like this.");
		else output("That bodysuit must be so stifling!");
		output("”</i>");
		output("\n\nNayna blinks at you, then looks back at her Codex. <i>“This is how I blow off steam, [pc.name]. Nothing is quite as relaxing as sitting up here and sorting through data streams. Besides, I’m pretty comfortable as is.");
		if(naynaWarm()) output(" Why do you think I stripped down so far?");
		else output(" Why do you think I bought this amazing coat?");
		output("”</i> She grins back up at you. <i>“Thanks for the offer though, it was nice of you.”</i>");
		processTime(3);
		clearMenu();
		//[Flirt More] [Back]
		addButton(14,"Back",repeatNaynaApproach,true);
		addButton(0,"Flirt More",flirtMoreWithNayna);
	}
}
//Flirt More
public function flirtMoreWithNayna():void
{
	clearOutput();
	showNayna();
	output("You walk up behind her and start giving her a shoulder rub, ");
	if(pc.tallness <= 70) output("letting your [pc.chest] press to the back of her head.");
	else output("letting your [pc.crotch] press against the back of her head while you work.");
	output(" <i>“Are you sure you wouldn’t like to do something else for a minute?”</i>");

	output("\n\nSlumping into you, Nayna sags into your skillful fingertips. <i>“No, but if you could keep that up for another minute or two while I work, it would be a huge help. You wouldn’t believe the knots a girl can work up being hunched over one of these all day.”</i> Her sentence is punctuated by a cute little sigh, satisfied but completely asexual.");
	output("\n\nYou massage her for a little longer, mulling it over. For some reason, you’re not getting through to her. Maybe you’ll have to catch her while she’s not nose-deep in a mountain of work.");
	processTime(7);
	clearMenu();
	addButton(0,"Next",repeatNaynaApproach,true);
}

//Drone Turn In
public function giveHerADrone():void
{
	clearOutput();
	showNayna();
	//FIRST ONE
	if(flags["NAYNA_DRONES_TURNED_IN"] == undefined)
	{
		output("You hand over the damaged drone. <i>“");
		if(pc.isNice()) output("Nayna, look what I found!");
		else if(pc.isMischievous()) output("I gotcha a present.");
		else output("Don’t freak out or anything, but I found this for you.");
		output("”</i>");
		output("\n\nNayna clutches it to her chest, rocking it back and forth like a long lost baby. When she looks back at you, there are tears welling up at the corners of her eyes. <i>“I didn’t think you’d do this for me... not even when you agreed to help. Do you remember what happened when we met? I nearly killed you!”</i> She sniffles, nose wrinkling cutely. <i>“I wish there was some way I could repay you, some way to let you know just how much this means to me.”</i> She gingerly puts down the drone. <i>“How about a hug?”</i>");
		
	}
	//REPEAT
	else
	{
		if(flags["NAYNA_BLOWN"] == undefined)
		{
			output("You hand over the damaged drone. <i>“");
			if(pc.isNice()) output("Nayna, I found another!");
			else if(pc.isMischievous()) output("I gotcha a present. Just call me " + pc.mf("Santa Claus","Mrs. Claus") + ".");
			else output("Don’t freak out or anything, but I got you more trash.");
			output("”</i>");
			output("\n\nNayna marvels at the recovered bit of machinery. When she looks back at you, her eyes are more than a little misty. <i>“Again!? After the last one, I figured you’d zip along on your way and forget all about little ol’ me. You’re a lifesaver, [pc.name].”</i> She sniffles, nose wrinkling cutely as she puts down the drone. <i>“I don’t have any credits to give you, but how about ");
			if(flags["NAYNA_HUGS"] != undefined) output("another ");
			output("hug?");
			if(flags["NAYNA_HUG_LEWDNESS"] != undefined) output(" I’ll even do it the way your people do!");
			output("”</i>");
		}
		//Repeat after max lewd:
		else
		{
			output("You hand over the damaged drone. <i>“Delivery for the cutest moon-bunny I know.”</i>");
			output("\n\nNayna marvels at the recovered bit of machinery. When she looks back at you, her eyes are more than a little misty. <i>“You really are the gift that keeps giving.”</i> A sly look spreads across her face. <i>“But what could I give you for a reward? How about one of your trademark hugs?”</i> Her nose wrinkles cutely.");
		}
	}
	IncrementFlag("NAYNA_DRONES_TURNED_IN");
	pc.destroyItemByClass(WeatherDrone,1);
	processTime(2);
	//[Accept Hug] [Nah]
	clearMenu();
	addButton(0,"Accept Hug",hugNaynaGogogo);
	addButton(1,"Nah",noNaynaHug);
}

//Nah - No Hug
public function noNaynaHug():void
{
	clearOutput();
	showNayna();
	output("You let her know that no hug is necessary. You’re just happy to help.");
	if(flags["NAYNA_BLOWN"] != undefined) output(" She looks a little disappointed.");
	//+Nice!
	pc.addNice(1);
	clearMenu();
	addButton(0,"Next",repeatNaynaApproach,true);
}

//Hug
public function hugNaynaGogogo():void
{
	clearOutput();
	showNayna();
	//Hug after max lewd:
	if(flags["NAYNA_BLOWN"] != undefined)
	{
		output("You open your arms wide and let the giggling climatologist pull you into a tight, ass-grabbing hug. <i>“With the data on that drone, I’m going to have to do a lot less number crunching. So, if you wanted to do something like you did before... I might be able to pull myself away.”</i> She lets go of one of your cheeks to grab you by the neck and stuff your face into her ");
		if(naynaWarm()) output("half-covered");
		else output("latex-encased");
		output(" boobs, nearly suffocating you in tit. ");
		if(naynaWarm()) output("Her parka might do a decent job of hiding it, but with the tight embrace, you can feel something stiffening down below at the memory of a previous encounter.");
		else output("Her sheer black undersuit doesn’t do much to hide the too-thick length of her pony prick. The glossy surface actually seems to accentuate it. It would seem the formerly chaste scientist can’t help but get aroused by your presence ever since that special hug.");
		output("\n\nIt sounds like she’s up for anything.");
		//Sex menu display here!
		naynaSexMenu();
		//Overwrite normal flirt intro with hug intro:
		addButton(0,"Give BJ",maxLewdGogo,false,"Give BJ","Give her a blowjob.");
		return;
	}
	//Normal hug - not groped
	else if(flags["NAYNA_HUG_LEWDNESS"] == undefined)
	{
		output("You open your arms wide and let the ecstatic climatologist pull you into a tight hug. ");
		if(pc.tallness >= 85) output("She may be so short that she barely reaches your waist, but it’s adorable all the same.");
		else if(pc.tallness >= 70) output("She may be short, but she’s a powerful hugger.");
		else
		{
			output("She reacts with ");
			if(flags["NAYNA_HUGS"] != undefined) output("familiar pleasure at");
			else output("wonder to");
			output(" being able to hug someone near her own height. Apparently she ");
			if(flags["NAYNA_HUGS"] != undefined) output("hasn’t gotten to look someone in the eye mid-hug in a long, long time.");
			else output("doesn’t get to look her partners in the eye very often.");
		}
		if(pc.isNude()) 
		{
			output(" Your nudity doesn’t seem to bother her");
			if(pc.wettestVaginalWetness() >= 3 || (pc.hasCock() && pc.lust() >= 70 && pc.cumQ() >= 400)) output(", nor your constant sexual leakage");
			output(". She’s careful not to directly touch your genitals, but she doesn’t shy away from sharing a bit of body heat.");
		}
		output(" The embrace is unexpectedly tight, crushing almost, like she’s desperate to communicate just how thankful she is while simultaneously relishing the touch of another.");
		output("\n\nYou could probably take advantage of this....");
	}
	//Grope Hug
	else if(flags["NAYNA_HUG_LEWDNESS"] == 1)
	{
		output("You open your arms wide, but Nayna barrels in well before you’re ready for her, wrapping her arms around your back and planting her hands firmly on your [pc.butt]. Once there, she starts vigorously squeezing and kneading, just like you did to her, oblivious to how hot under the collar it’s making you. Giggling, she asks, <i>“I’m getting pretty good at this, huh?”</i>");
		output("\n\nYou nod. What else can you do, besides grope-hug her right back. You sink your fingers deep into her rump, massaging her pillowy donk with rapacious delight, reveling in the cuddle-bunny’s oh-so squeezable ass.");
		if(!naynaWarm()) output(" There may be layers of fur and insulation between your palms and the happy hare, but the her shapeliness is impressive all the same.");
	}
	//Lewder Hug
	else if(flags["NAYNA_HUG_LEWDNESS"] == 2)
	{
		output("You open your arms wide just in time for Nayna to barrel into you, grabbing hold of your ass in both hands and squeezing. Using the leverage she has on your hindquarters, she thrusts her face ");
		if(pc.biggestTitSize() >= 1) 
		{
			output("into your [pc.fullChest], wiggling her face around like crazy, kissing every inch of your ");
			if(!pc.isChestExposed()) output("covered bosom");
			else output("exposed bust");
			output(".");
		}
		else 
		{
			output("against your chest, rubbing her cute nose against your pectorals and kissing every inch of your ");
			if(!pc.isChestExposed()) output("well-dressed bod");
			else output("exposed muscles");
			output(".");
		}
		output(" The kisses feel anything but chaste - more like hungry, oral love, but when Nayna pops back up, her panting seems more caused by lack of oxygen than any sort of arousal.");
		output("\n\nNot one to be outdone, you return the favor, burying your face into the laquine’s hefty heifers. She squeeks, surprised by the force of your friendly motorboating, perhaps even enjoying it a little. You don’t even bother to keep both your hands on her ass this time, cradling her curvy flesh in your left and squeezing whenever your nibble at the ");
		if(!naynaWarm()) output("latex-ensconced");
		else output("insulated");
		output(" flesh. You’re pretty sure she giggles when your gropes get more forceful, but when you come up for air, Nayna is beaming.");
		output("\n\nMaybe she’d respond better if you got more direct.");
		//MAX LEWD OPTION!
	}
	IncrementFlag("NAYNA_HUGS");
	clearMenu();
	addButton(0,"Finish Hug",breakNaynaHug);
	if(flags["NAYNA_HUG_LEWDNESS"] == undefined) addButton(1,"Grope Her",gropeNaynaHug);
	else if(flags["NAYNA_HUG_LEWDNESS"] == 1) addButton(1,"Lewd It Up",lewderHugForNayna);
	else if(flags["NAYNA_HUG_LEWDNESS"] == 2) addButton(1,"MAX LEWD",maxLewdGogo);
}

//[Break]
public function breakNaynaHug():void
{
	clearOutput();
	showNayna();
	output("You break away after a few comforting seconds. Sometimes a hug is nice!");
	output("\n\nNayna is still thrilled at the recovery of her drones, but she’s she looks even happier than before the hug. <i>“If you find any more, don’t hesitate to bring them my way! My budget may be limited, by my hugs aren’t!”</i>");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Grope Her]
public function gropeNaynaHug():void
{
	clearOutput();
	showNayna();
	output("Letting your hands drift down, you grab two handfuls of bunny ass, regretting that your palms aren’t bigger. She’s got so much booty that your fingers seem downright diminutive by comparison, dwarfed by her ");
	if(naynaWarm()) output("half-exposed");
	else output("heavily insulated");
	output(" derriere.");
	output("\n\nNayna stiffens at your touch, then smiles and leans harder against your shoulder. <i>“They do hugs differently on your planet, huh?”</i> She playfully pushes her butt into your hands. <i>“It’s different, but not bad. Here, let me.”</i> Fuzzy fingertips dig into your [pc.butt], kneading your cheeks every bit as forcefully.");
	output("\n\nThe bizarre bunny breaks away while you’re still dumbstruck by her ignorance. <i>“If you find any more, don’t hesitate to bring them my way! My budget may be limited, by my hugs aren’t!”</i>");
	output("\n\nYou might have to be more direct next time...");
	//+lust
	pc.changeLust(10);
	flags["NAYNA_HUG_LEWDNESS"] = 1;
	processTime(4);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Lewder Hug
public function lewderHugForNayna():void
{
	clearOutput();
	showNayna();
	output("Instead of breaking away, you pull yourself right down into her ");
	if(naynaWarm()) output("latex-encased");
	else output("parka-padded");
	output(" tits, smashing your [pc.face] right into her pillowy cleavage and shaking your head around, jostling the bunny-boobs wildly. It’s amazing how warm, almost steamy it is in between them. You wonder if smooching one would go too far, then do it anyway. Maybe the licentious press of lips to tits will finally spur her libido into action.");
	output("\n\n<i>“[pc.name]!”</i> Nayna thrusts you away, glaring at you angrily.");
	output("\n\nYou would have preferred a look of intrigue, maybe even arousal, but at least her irritated gaze reveals that she’s not entirely oblivious.");
	output("\n\n<i>“You should have told me that there was more to hugging in your culture!”</i>");
	output("\n\n...Maybe not.");
	output("\n\n<i>“Is it rude if I don’t rub my nose into your chest after you finish?”</i> She claps both hands over her mouth, gasping, <i>“I didn’t offend you, did I?”</i>");
	output("\n\nSighing, you rub the back of your neck and let her know that she didn’t offend you.");
	output("\n\n<i>“Good,”</i> Nayna replies, smiling once more. <i>“Next time I’ll be sure to do it right.”</i>");
	flags["NAYNA_HUG_LEWDNESS"] = 2;
	processTime(4);
	pc.changeLust(10);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Max Lewd/Suck Her Dick
public function maxLewdGogo(flirtIntro:Boolean = false):void
{
	clearOutput();
	showNayna();
	//FROM FLIRT INTRO
	if(flirtIntro)
	{
		output("You suggest a repeat of you first got together. You’ve been feeling a bit peckish after all.");
		output("\n\nNayna’s eyes widen. <i>“Th-that again? Are you sure?”</i> Her eyes are wide with disbelief. <i>“It looked like it hurt.”</i>");
		output("\n\nGrinning, you tell her that you can handle it and advance on her with a knowing smirk.");
		output("\n\n<i>“Okay. If you’re sure.”</i> Nayna nervously shifts position, crossing her legs and rubbing one paw atop the other. No matter how she squirms, she can’t hide her rapidly engorging horse-prick. It’s may be just a little pony, but it still manages to bulge her ZPI-branded bodysling like some kind of poorly-concealed firearm. The closer you get, the bigger it swells. By the time you’re kneeling in front of her, it’s gotten as thick around as a soda can and at least twice as long.");
		output("\n\nNayna whimpers, but holds herself still, letting you take the lead.");
	}
	//FROM HUG INTRO
	else
	{
		output("<i>“Nayna.”</i> You grin, saying, <i>“");
		if(flags["NAYNA_BLOWN"] != undefined) output("We both know this hug isn’t going to satisfy you. You need a little more.");
		else output("This hug is great, but I think I’m going to need a little more than a hug.");
		output("”</i> ");
		if(!naynaWarm()) output("Grabbing hold of her parka’s zipper, you slide it down, freeing the cuddly laquine’s tits to wobble forward, slightly less restricted. You push it down her unresisting arms and add,");
		else output("Running your hands down her latex-wrapped chest, you slide your hands around her hips, adding,");
		output(" <i>“");
		if(flags["NAYNA_BLOWN"] != undefined) output("One of these days, I ought to fuck those... but for now, let’s take care of you.");
		else output("I don’t mean credits.");
		output("”</i>");
		output("\n\n<i>“");
		if(flags["NAYNA_BLOWN"] != undefined) output("My t-tits? You like them?");
		else output("What do you want then,");
		output("”</i> the bunny-girl squeeks, whiskers quivering. Her ears hang flat, and her eyes are open wide, darting back and forth, searching your face for clues.");
		if(flags["NAYNA_BLOWN"] != undefined) output(" <i>“You really like them? I got implants last year... but nobody seemed to notice.”</i>");
		output("\n\nRubbing her squishy flanks, you let your hands slide over her one-piece, latex-like undersuit, feathering across her belly. Her stomach has the barest amount of pooch, just enough to make it feel like you’re groping a big, warm pillow. Nayna gasps, but she doesn’t resist your caresses, not even when you probe downward to her crotch.");
		//Done this before:
		if(flags["NAYNA_BLOWN"] != undefined) output(" A hard cock, nine inches long and as thick around as a soda can tents her skin-tight garment, backed up by apple-sized testes that you know have to be enhanced somehow. Big as they are, you’re still not sure how they can produce such... voluminous semen.");
		//No new PG:
		//know she’s a herm: 
		else if(knowNayneIsAHerm()) output(" An equine sheath is there, just as you would expect from a laquine hermaphrodite, backed up by two apple-sized balls that feel almost disproportionately large next to their half-hidden spout, doubtless swollen with a lifetime of unspent seed.");
		//Go to “react well” automatically.
		//No new PG: Not aware of herm: 
		else 
		{
			output(" She doesn’t feel quite like you expected. There’s an oblong lump and two apple-distentions that can only be balls.\n\nHow do you react?");
			processTime(3);
			clearMenu();
			addButton(0,"Like It",reactWellToFutaLaquine);
			addButton(1,"Badly",naynaBeejDiscoveryReactBadly);
			return;
		}
	}
	processTime(2);
	clearMenu();
	addButton(0,"Next",reactWellToFutaLaquine);
}

//React Badly
public function naynaBeejDiscoveryReactBadly():void
{
	clearOutput();
	showNayna();
	output("<i>“Whoah!”</i> You jerk away, backpedalling into the glass. <i>“I didn’t know you were packing heat!”</i>");
	output("\n\nBlushing, Nayna toes at the ground. <i>“It wasn’t really a secret. I’m pretty open about it, actually.”</i> She stops, eying you warily. <i>“You... you wanted to have sex! You wanted to... f-fuck my brains out... and you didn’t even bother to learn what sex I am!?”</i>");
	output("\n\n");
	if(pc.isBro()) output("<i>“Yeah.”</i>");
	else if(pc.isBimbo()) 
	{
		output("<i>“Uh-huh! Kinda stupid of me, huh?”</i> You ");
		if(pc.hairLength >= 5) output("twirl your hair");
		else output("giggle brainlessly");
		output(".");
	}
	else if(!pc.isAss()) output("<i>“Umm... yep”</i>");
	else output("<i>“Yeah.”</i>");
	output("\n\n<i>“You-! You.... You clod!”</i> Nayna spins around, and stamps her foot. <i>“Get away from me, you jerk! You sex-obsessed... bigot-jerk!”</i> She points back at the stairwell, then pulls out her Codex and flops down, ignoring you.");
	output("\n\nYou appear to have struck a nerve and blown your chances with her.");
	processTime(2);
	//fucked up.
	flags["NAYNA_PISSED"] = 1;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//React Well
//Merges back into the scene!
public function reactWellToFutaLaquine():void
{
	clearOutput();
	showNayna(true);
	output("Smiling at the blushing bunny, you curl a fingertip around the swell of her sack and push the rubber of her college-branded one-piece into her mons, fingering her through her own undergarments. She twists and squirms but does not pull away");
	if(flags["NAYNA_BLOWN"] != undefined) output(", blushing as if she can’t quite believe how much you like playing with her");
	output(". ");
	if(flags["NAYNA_BLOWN"] == undefined) output("Quite the opposite in fact; ");
	output("Nayna leans harder against you by the second, pressing her nipples in your [pc.chest], letting out high-pitched whines with every wiggle of your fingertips.");
	output("\n\n<i>“");
	if(flags["NAYNA_BLOWN"] != undefined) output("Y-you’re such a tease,");
	else output("Th-this isn’t a hug,");
	output(" [pc.name]!”</i> Nayna protests, flopping her face against your shoulder. <i>“D-do you... ");
	if(flags["NAYNA_BLOWN"] != undefined) output("really want to do that again?");
	else output("do you want to fuck me?");
	output("”</i> Her hips jerk, thrusting against your palm. <i>“");
	if(flags["NAYNA_BLOWN"] == undefined) output("Stars! D-do you really? Please!");
	else output("You looked so sexy with a belly-load of my... uhm... cum.");
	output("”</i>");
	//Bimbo
	if(pc.isBimbo())
	{
		output("\n\n<i>“Of course I do, silly! Why else do you think I keep grabbing on ya and stuff?”</i> you idly answer, letting your fingers stroke her lady-bits on pure autopilot, trusting your sixth sense about all things sexual to guide you.");
	}
	//Brute
	else if(pc.isBro()) output("\n\n<i>“Yeah,”</i> you rumble, crudely fingering the bunny, bluntly pressing on every sensitive place you can reach. <i>“Duh.”</i> Pussies are so easy to please; it’s a wonder that there are people out there who can fuck it up.");
	//Nice
	else if(pc.isNice()) 
	{
		output("\n\n<i>“I’d like nothing better, if you’re willing, but I ");
		if(flags["NAYNA_BLOWN"] != undefined) output("won’t force you if you don’t want me to.");
		else output("don’t want to rush you into anything.");
		output("”</i> You work your fingers in slow circles, grinding her lips and clit through her latex-like undersuit, feeling them puff up under your touch, forming the inky fabric into a luscious-looking camel toe. <i>“");
		if(flags["NAYNA_BLOWN"] != undefined) output("But we both know you want to do it again, to fill me up with cum and make me empty those poor, pent-up balls.");
		else output("I’ll just get you off this once, then if you still want to, we can talk about fucking.");
		output("”</i>");
	}
	//Misch
	else if(pc.isMischievous())
	{
		output("\n\n<i>“Don’t be so crass, Nayna.”</i> You pump your fingers in quick circles, grinding on her lips and clit through the shining fabric. <i>“");
		if(flags["NAYNA_BLOWN"] != undefined) output("All it takes is a few squeezes, and all that clinical talk turns into slut-talk.”</i> You rub her clit should be with your thumb. <i>“Good thing I you’re cute when you’re slutty.");
		else output("We don’t know each other well enough for sex yet, so I’m just going to finger you, maybe go down on you if you play your cards right.");
		output("”</i>");
	}
	//Hard
	else
	{
		output("\n\n<i>“Don’t play stupid, bunny. I know you’re smart enough to know what I want to do to you.”</i> You slap her ass for emphasis, then thrust your fingers as far inside her as her shrink-wrapped cunt will allow.");
	}
	output("\n\nWrapping her arms tight around your waist, Nayna coos, <i>“");
	if(flags["NAYNA_BLOWN"] != undefined) output("Mmm... okay.");
	else output("Yes... don’t stop.");
	output("”</i> You think you ");
	if(flags["NAYNA_BLOWN"] != undefined) output("can hear her starting to pant against your shoulders");
	else output("feel the warm dampness of her tears on your shoulder");
	output(" but wisely say nothing, continuing to strum the horny bun’s netherlips like a well-tuned guitar. The cute little thrusts she makes against your wrist and [pc.belly] are almost adorable, tiny humps that seem more plaintive begging than demand for stimulation.");
	output("\n\nSmashing her slight sheath against you, the pent-up laquine scientist starts moaning, no longer constrained to feminine squeaks and whimpers. ");
	if(flags["NAYNA_BLOWN"] == undefined) output("That self-shame bulge is getting bigger too. You can feel her heart beating through it, inflating something within its depths, pumping the rubber-obscured folds of skin further and further apart to make room for what lurks below.");
	else output("Her cock is so hard already. It feels like she’s smuggling a pipe in her pants, only this pipe throbs with every beat of Nayna’s heart, making the rubbery encasement visibly stretch and strain.");
	output(" Nayna bounces on the balls of her feet, dry-humping you faster, grinding with the kind of frenetic energy that only a bunny could muster.");
	output("\n\nDamn, the nerd’s packing heat! ");
	if(flags["NAYNA_BLOWN"] == undefined) 
	{
		output("The blunted tip of her half-hard cock makes itself known against your ");
		if(!pc.isCrotchExposed()) output("[pc.lowerGarmentOuter]");
		else output("[pc.skinFurScales]");
		output(", more prominant with every micro-thrust, and it is <i>thick</i>. You had heard that laquine girls were hung like horses, but you never expected such girth from a woman this small. It feels like it’s at least three inches wide. No wonder it takes a lot of prep to get her hard.");
	}
	else {
		output("The blunted tip of her half-hard cock swells, revealing the beginnings of a flare as it rubs against your ");
		if(!pc.isCrotchExposed()) output("[pc.lowerGarmentOuter]");
		else output("[pc.skinFurScales]");
		output(", and it is <i>thick</i>. It never ceases to amaze you how hung laquines can be, even ones this stunted in both body and bulge. She more than makes up for her short stature with the girth of her orifice-gaping horse-pecker - more than three-inches of it.");
		output(" Walking around with a monster like ");
		if(pc.longestCockLength() >= 20) output("is");
		else output("would be");
		output(" impossible");
		if(pc.longestCockLength() >= 20) output(" as you know all too well");
		output("!");
	}
	//[Next]
	output("\n\nYou ");
	if(pc.hasKnees()) output("drop to your [pc.knees]");
	else output("slowly lower yourself to the ground");
	output(" for a better look. ");
	if(flags["NAYNA_BLOWN"] == undefined) output("Nayna’s cock is only a few inches long right now, so you give it a little kiss through the oily bodywrap, encouraging it to reveal its full size with a lewd little lick.");
	else output("Nayna’s cock tries to jut proudly forward, but the oily bodywrap keeps it pinned to her belly, a nerve-lined cylinder just waiting to be caressed.");
	output("\n\nThe chubby cock jumps the second you touch it");
	if(flags["NAYNA_BLOWN"] == undefined) output(", slithering another inch free of the sheath");
	else output(", pushing forward to bop you on the forehead before the latex-like fabric tugs it back once more");
	output(". When your tongue lacquers Nayna’s suit, ");
	if(flags["NAYNA_BLOWN"] == undefined) output("it surges again, forcing itself out of her sheath quickly enough for you to hear the squeak it makes from rubbing against the now-straining latex");
	else output("it bulges again, the veins standing out in stark relief, perfectly molded into the encasing rubber");
	output(". You press your cheek against it, feeling its warmth through the intervening layer of artificial rubber, amazed at how ");
	if(flags["NAYNA_BLOWN"] != undefined) output("hard Nayna got so fast");
	else output("fast it’s growing");
	output(". ");
	if(flags["NAYNA_BLOWN"] == undefined) output("Veins bulge fatter and more prominent. The obscene-looking, blunted head swells slightly, transforming into a flattened crown. It isn’t growing lengthwise so much any more, content to grow harder and firmer, a lurid little horsecock that’s entirely too fat for its nine inch length.");
	else output("It looks almost regal with its flared crown, standing so proud against the otherwise soft bunny. Can it get any harder, you wonder?");
	output(" You stroke it a few times to be sure, but all that earns you is a moan from Nayna and a few satisfying throbs against your palm.");
	//bimbo
	if(pc.isBimbo()) output("\n\nDumbly, you become aware that you’ve started drooling, but that just makes it hotter. You swirl your tongue over your [pc.lips], spreading your saliva over them, polishing your mouth into a shining orifice, ready for penetration.");
	//brutality
	else if(pc.isBro() || pc.isAss()) output("\n\nSmirking, you pat the bunny’s hefty balls and finger her cock-receptacle one last time, feeling the wetness sluice down her thighs. She’s as ripe for fucking as a girl can be. You could get her to do any filthy depraved act you could imagine. All you’d have to do is ask.");
	//Merge
	output("\n\nThe short, stacked alien can barely control herself. Her leg is thumping the floor like wild, and it looks like it’s everything she can do to keep from grabbing you by the ");
	if(pc.horns > 1 && pc.hornLength >= 2) output("horns");
	else output("head");
	output(" and humping your face, never mind latex layer between.");
	output("\n\nYou do the only sane thing you can in such a situation - you pull the suit to the side and fish out Nayna’s cock, bunching the shining onyx suit up alongside her leg to let her balls and vagina breathe too.");
	output("\n\nNothing could prepare you for how absolutely, torrentially wet the hermaphrodite’s crotch is. The thick tube of her cock glistens with sweat and a smidge of pre. Her thighs and balls are slicked down with her cunt’s lubricious leakage. To say she smells like sex would be an understatement. Nayna’s crotch is a one-woman orgy of aromas, from the tangy scent of her pussy to the rich musk her cock exudes, hanging around her sheath in a thick cloud.");
	output("\n\nLetting go of the pink, fleshy horsecock, you grab hold of her thighs and pull her close, allowing the turgid member to slap down across your nose when you nuzzle in close. Her balls are swollen, so torrid with unspent seed that they may as well be overloaded spunk-reactors. ");
	if(flags["NAYNA_BLOWN"] == undefined) output("Just how long has this poor scientist gone without relief? It’s fortunate she found a " + pc.mf("friend","slut") + " like you to help her out before she had a meltdown.");
	else output("Just what kinds of mod did this poor scientist experiment with to make her nuts so needful? It’s fortunate she found a " + pc.mf("friend","slut") + " like you to help her out, someone who is all too happy to choke down the fruits of her fruit-sized testes.");
	output(" You lick them, savoring their salty taste and rich aroma, like sweat and fresh cut lumber, delighted to discover places where the tangy flavor of her girlcum has completely impregnated the slicked down fur of her sack.");
	output("\n\n<i>“Don’t stop licking, [pc.name],”</i> Nayna bids, gently stroking your ");
	if(pc.hasHair()) output("head");
	else output("[pc.hair]");
	output(". <i>“Don’t you dare fucking stop.”</i> Her cock throbs atop you, and her voice is suddenly clear and determined. Now that she’s got someone between her legs, licking and lapping, all her insecurities seem to have melted away, replaced by wanton desire. <i>“Oh fuck, you’re good.”</i> Pre-cum blazes a trail down the side of your face. More of it bubbles out of her cock moment by moment, a constant flow of long-denied libidinous excess. <i>“Are you going ");
	if(flags["NAYNA_BLOWN"] == undefined) output("to suck my cock");
	else output("continue to tease me");
	output(", [pc.name]?”</i> Nayna’s pussy clamps down on your finger the moment you slide it inside her, dribbling down your hand. <i>“");
	if(flags["NAYNA_BLOWN"] == undefined) output("Nobody’s ever sucked my cock before. You can be the first.");
	else output("I don’t think it’s possible for someone to suck cock better than you.");
	output("”</i>");
	processTime(13);
	pc.changeLust(45);
	clearMenu();
	addButton(0,"Next",blowNayna2);
}

public function blowNayna2():void
{
	clearOutput();
	showNayna(true);
	output("If Nayna wants you to suck her cock, you’re happy to oblige, though you doubt she’ll hold out for long. ");
	if(flags["NAYNA_BLOWN"] == undefined) output("It wouldn’t surprise you if that swollen pony detonated the moment it felt your lips for real.");
	else output("That tubby pony has zero endurance when it comes to your lips.");
	output(" With her dick firmly in the driver’s seat, the bunny-girl is happy to discard all sense of propriety. She grabs hold of her meaty cock and slaps it into your face, flecking your ");
	if(!pc.hasHair()) output("head");
	else output("[pc.hairNoun]");
	output(" with pre-jizz, not to mention the long strands that splatter you from chin to brow.");
	output("\n\n<i>“Holy fuck, you look like such a fucking slut, [pc.name].”</i> You feel the surge of blood throb up through the laquine’s sheath and into her cock, making it twitch. <i>“Like something out of porn.”</i>");
	output("\n\nYou cradle her balls, giving her a cheshire grin when a blob of pre big enough to fill a shot glass rolls down the back of your neck. <i>“");
	if(pc.isBimbo() || pc.exhibitionism() >= 66 || pc.libido() >= 90) output("I know, right?");
	else output("You should see yourself.");
	output("”</i>");
	output("\n\nNayna groans, and pulls back, lining her slick dick up with your mouth and stroking herself while you continue to pleasure her spasming nutsack and tight cunt. <i>“J-just shut up and open wide. I want to feel your mouth.”</i> Her nipples are jutting out like tentpoles, hard enough that you doubt even the universe’s most padded bra could conceal them. She adds, <i>“");
	if(flags["NAYNA_BLOWN"] == undefined) output("I want to see what it’s like to cum in someone’s mouth.");
	else output("I want to fill you up again, cover you in cum...");
	output("”</i>");

	//Bimbo
	if(pc.isBimbo()) output("\n\nYou know better than to open wide right away. That’s for after she nuts in your mouth, to show her just how much cum she gave you! No, the right move is to purse your lips, make them look big and round with just enough of a gap between for her cock to slide into, spreading your mouth into a wide-open fuck hole over time. If the look on Nayna’s face is anything to go by, she appreciates just how much thought you put into cock-sucking. It’s nice to be appreciated.");
	else 
	{
		output("\n\nYou don’t hesitate to give the repressed scientist exactly what she asks for, opening nice and wide, letting your [pc.tongue]");
		if(!pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output(" hang out like a welcoming mat for dick");
		else output(" wiggle out like a welcoming mat, only this welcoming mat can reach all the way into her sheath and twist around the naughtiest parts of her dick");
		output(". A full-body shiver wracks Nayna’s body, and she gushes yet more clear juice onto your tongue.");
	}
	//Merge new PG
	output("\n\n<i>“Y-yeah, take it!”</i> Nayna hesitantly growls, feeling her way through dirty talking for what must be the very first time. She feeds her cock into your mouth, forcing your lips wide-open from her crown’s impressive girth. Taking her length doesn’t get any easier after that. The shaft is nearly as wide as the tip, but at least it’s smoother, sliding easily on your [pc.tongue], paving its own path in slick pre-cum.");
	if(pc.hasMuzzle()) output(" The length is no problem for your elongated maw. You take her all the way to her sheath, pressing your nose into the musky folds of skin.");
	else if(pc.isBimbo()) output(" The length is no problem for a cock-sucker like you. It slides right past your long-suppressed gag-reflex and into your throat, stretching your neck out in an impression of the herm’s tool.");
	else output(" The length is almost too much for you. No matter how much you try, you can’t quite reach her sheath without starting to gag, but you make up for it with enthusiasm, reaching up from her balls to fondle the exposed patch of laquine love-stick.");
	output("\n\nLooking up at Nayna, you can’t help but want to smile. If only her dick didn’t stretch your [pc.lips] into a tightly-sealed ‘O’. She looks like the definition of bliss with her mouth hanging open in a dazed grin, her tongue dangling. Her eyelids droop low enough to hide all but the whites of her eyes.");
	output("\n\nNayna mumbles, <i>“So good,”</i> and, <i>“Suck it, slut,”</i> repeatedly, sometimes mixing in other expressions of amazement at how wonderful your mouth feels on her cock.");
	output("\n\nSwallowing down a mouth-load of bunny-cream, you start sucking her properly, bobbing back and forth gently on her cock while your tongue dances the tango below. You’re still fingering her too, pumping two digits in and out of her soaked twat, relentlessly rubbing her silky folds. Her virgin");
	if(flags["NAYNA_FUCKED"] == undefined) output("al");
	else output("-like");
	output(" pussy rhythmically clenches around them, and you realize too late that those clenches perfectly match the orgasmic throbs coursing through the plump rod in your maw.");
	output("\n\n<i>“I-I...”</i> Nayna gasps, <i>“");
	if(flags["NAYNA_BLOWN"] == undefined) output("I think I might be c-cumming!");
	else output("I’m cumming again! You’re making me cuuuuummm!");
	output("”</i>");
	output("\n\nHer flare expands in your ");
	if(pc.hasMuzzle() || pc.isBimbo()) output("throat");
	else output("mouth");
	output(", blossoming into a turgid plug, leaving you with all of a few nanoseconds to figure out how to swallow the coming flood.");
	processTime(11);
	pc.changeLust(55);
	clearMenu();
	addButton(0,"Next",blowNayna3);
}

public function blowNayna3():void
{
	clearOutput();
	showNayna(true);
	output("Nayna’s legs give out in the moment of her orgasm, and with her dick presently attached to your mouth, you have no choice but to tip forward with her, collapsing atop her quivering crotch just in time to feel the first bulge of cum pumping through her urethra. It explodes into the confines of your mouth like a plasma grenade in a bunker. Every square millimeter of your mouth is filled with the laquine’s heady goo. Your cheeks bulge, trying to hold it all in.");
	if(pc.isBimbo()) output(" What kind of stupid skank would waste jizz this good?");
	output(" There’s no alternative to swallowing - her flare ensures that.");
	output("\n\nYou gulp down the heavy load just in time for the next mouth-filling deposit to flood in, drowning your tongue her salty sperm, utterly inundating your taste-buds in the perverse flavor. Your nostrils flare, sucking in a quick breath, and you swallow once more, gurgling noisily around the laquine scientist’s tremendously turgid cock.");
	output("\n\n<i>“Ooooh, yes!”</i> Nayna cheers, lurching her hips upward, lifting you off the ground and squirting straight into your mouth again. You don’t try to fight it. Your attention is squarely fixed on swallowing every ounce before it can flood back out through your nose. Gulping rapidly, you drink it all down. Her balls seem inexhaustible, the testicular equivalent of the miniaturized suns that power the largest ships in the U.G.C. fleet. When you’re well past the point of feeling full, she’s still cumming, still spurting her alien DNA into your belly. The few breaths you sneak through your nose all smell like laquine musk and cum, and all your eyes can see are balls, quaking thighs, and her silky belly-fluff.");
	output("\n\nYou’re dizzy on bunny spunk, barely able to breathe and yet stuffed beyond capacity with the sloshing sperm, chugging down more like a " + pc.mf("frat boy","sorority girl") + " attempting a keg stand.");
	if(pc.isBimbo()) output(" You’re not sure if you’ve ever been happier. There’s so much cum, and it’s all yours, filling you, flooding you, a liquid declaration of your value. Just the thrill of getting to taste it all has you shiver and shuddering, on the edge of a breathless climax of your own.");
	output(" Climbing up onto your hands and knees, you try to ease the pressure on your inflating belly as it balloons, but it seems a doomed effort. Every swallow adds a little more bulge and wobble to your bloated middle. You feel like you’re going to burst if you swallow any more, but what choice do you have?");
	output("\n\n<i>“H-holy shit!”</i> Nayna pants, putting her hands on your forehead and pushing, dragging her still-spurting cock-head out of your mouth an inch at a time. It catches on your teeth, making the lop-eared laquine pause, but after regarding your gravid state another second, she pushes hard, popping her dick out of your mouth with a moan and a squirt, painting the bridge of your nose white. <i>“");
	if(flags["NAYNA_BLOWN"] == undefined) output("F-fuck, why can’t I stop cumming?");
	else output("F-fuck, how can something so base be so wonderful?");
	output("”</i> Her nose twitches fearfully, but her hands grab hold of her cock, disregarding any pain her sudden exit may have caused. <i>“");
	if(flags["NAYNA_BLOWN"] == undefined) output("Why is it so </i>good<i>!?");
	else output("Why do I even bother doing anything else?");
	output(" Oh god... you look so sexy like that, like a fucking cum-balloon...”</i>");
	output("\n\nYou roll on your side, trying to catch your breath, but Nayna isn’t done yet. She bounces up onto her knees, holding her too-thick cock in both hands, pumping it furiously, hosing you down with lines of alabaster alien goo. It slaps down over you, warm and wet, seeping into every crevice of your [pc.skin]. The obscene paint job seems to go on forever. It’s ");
	if(!pc.hasHair()) output("on your head");
	else output("in your hair");
	output(", all over your back, in the crack of your ass, and even covering the bottoms of your [pc.feetOrFoot].");
	output("\n\n<i>“Fuck yes! Fuck yes! Fuck yesssss!”</i> Nayna chants as she does, completely lost to the pleasure, jacking her cock like a woman possessed until its seemingly endless virility goes dry, and even then, she slumps down beside you, fitfully grinding it into your sperm-slicked shape. <i>“It’s so good, [pc.name].”</i> She moans nestling her cheek into your side while her still-hard length twitches against your [pc.hip]. <i>“So good... mmm...”</i>");
	// Create Nayna
	var pp:PregnancyPlaceholder = getNaynaPregContainer();
	pc.loadInMouth(pp);
	processTime(11);
	pc.changeLust(100);
	pc.applyCumSoaked();
	//[Next]
	clearMenu();
	addButton(0,"Next",blowNayna4);
}

public function blowNayna4():void
{
	clearOutput();
	showNayna(true);
	output("You don’t rouse her when she finally calms and begins to snore - you’re more than a little tired yourself, and rather than risk waking her, you close your eyes and enjoy the warmth of her body and her spunk, proud of just how lewd you’ve made the once reserved bunny.");
	processTime(5);
	//[Next]
	clearMenu();
	addButton(0,"Next",blowNayna5);
}

public function blowNayna5():void
{
	clearOutput();
	showNayna();
	output("You wake from your nap, pleased to discover that Nayna is already hard - or hard again. Her cock is threaded between your buttcheeks, but she stops pumping it back and forth once she realizes you’ve stirred.");
	//Repeat
	if(flags["NAYNA_BLOWN"] != undefined) 
	{
		output("\n\n<i>“Oops! S-sorry, I didn’t mean to wake you.”</i> Nayna gently extricates herself for your body, her sloppy cock jutting in your direction. <i>“Y-you probably have somewhere to be. We should... get dressed.”</i> She nods vigorously. <i>“Yes, getting dressed is definitely the rational choice.”</i> She glares down at her still rock-hard cock. <i>“I don’t know if I’ll ever get used to how you make feel. Doing this seems like such a waste of our time, and yet...”</i> She tugs up her slinky undersuit, idly rubbing her bulge. <i>“And yet I don’t want you to stop doing it.”</i> Smiling, Nayna bids, <i>“Don’t let me wait too long.”</i>");
	}
	//First time
	else
	{
		output("\n\n<i>“Oh! S-sorry. I didn’t mean to wake you.”</i> Nayna yanks herself backward, her sloppy cock jutting in your direction. <i>“I... we... should probably get dressed.”</i> She nods to herself, twiddling her pointer fingers while trying not to look at your cum-coated form. <i>“And we definitely shouldn’t do anything like that again... unless you really wanted to.”</i> She turns away, but her hips wiggle happily. <i>“I’m a scientist after all. I have to be objective and uhm...”</i> She trails off while trying to pull her underthings up over her still-hard dick. It bulges lewdly through the sable surface. <i>“...I can’t just go around having fun. Even if it’s really, really fun.”</i>");
		output("\n\nYou stand up, and shake off most her cum. <i>“Really?”</i> You raise an eyebrow questioningly.");
		output("\n\n<i>“Well, you did save me a lot of time,”</i> Nayna temporizes. <i>“Finding those drones saved me days of work. It’d only be fair to let you...”</i> She inhales, stifling a moan, <i>“...make use of that time. You know, if you wanted to.”</i>");
	}
	IncrementFlag("NAYNA_BLOWN");
	processTime(140+rand(20));
	restHeal();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Fuck Her
public function fuckNayna():void
{
	clearOutput();
	showNayna(true);
	//Dong-wielders activate!
	var x:int = pc.cockThatFits(300);
	if(x < 0) x = pc.smallestCockIndex();
	
	//Bimbo/Bro
	if(pc.isBro() || pc.isBimbo())
	{
		output("Instead of telling her what you’re going to do, you put your hand on her ass and lead her to one of the shorter consoles. Then you bend her over, sliding your fingers across her wobbly backside to find her latex-encased cunt. It’s already a little flush, and the adorable little bunny-slut whimpers from the lewd contact. Her tits squish out obscenely, compressed between her chubby torso and the hard metal below, visible as lush half-moons. She would make for a really great bimbo, you decide, if she didn’t dwell on science so damned much.");
		output("\n\nShe’s already got the boobs for it and the quiet, sexual acceptance. You push in harder, just to make her squeek once more. Looking back at you, Nayna seems equally confused and aroused. What a good girl, you give her a few more rubs, playing her pussy like a fiddle, then get ready for the main event.");
	}
	else
	{
		output("<i>“I’d like to fuck you,”</i> you announce. No sense screwing around about it.");
		output("\n\nNayna’s knees cross nervously, but the twin points of her nipples reveal themselves from under the slick confines of her undersuit, proud and erect - much like her dick. <i>“Oh... sure! ");
		if(flags["NAYNA_FUCKED"] == undefined) output("Uh... how do we-?");
		else output("Um... how do you want to do it this time?");
		output("”</i>");
		output("\n\n<i>“Like this.”</i> You wrap an arm around her, placing your hand square on her ass and squeezing. Your fingers nearly disappear into the fur covering her squishy booty, and the undersized laquine shivers, pressing her butt back into your hand.");
		output("\n\n<i>“O-okay.”</i>");
		output("\n\nYou nod and, leading her to ");
		if(flags["NAYNA_FUCKED"] == undefined) output("a familiar server rack");
		else output("a perfectly-sized server rack");
		output(", explain, <i>“Bend over.”</i>");
		output("\n\nThe fuzzy scientist leans over, looking over her shoulder nervously at you. <i>“Like this?”</i>");
		output("\n\nStill holding onto her ass, you slide a finger over to prod at her still-covered puss. As expected, Nayna jumps, lifting her well-rounded butt higher into the air, perfectly poised to present. <i>“Just like that,”</i> you coo, giving her a smile and a pat.");
	}
	var cum:Number = pc.cumQ();
	//Merge
	output("\n\n");
	if(!pc.isCrotchExposed())
	{
		output("Hooking a hand in your [pc.lowerGarments], you fish out [pc.oneCock]");
		if(pc.lust() < 70) output(", already half-hard");
		else output(", already rock-hard");
		if(cum > 1000)
		{
			if(cum < 5000) output(" and dripping pre-cum");
			else output(" and leaking a constant flow of pre-cum");
		}
		output(". The feeling of relief is palpable");
		if(pc.lust() < 70) output(", and you surge to a full, tumescent erection in seconds.");
		else output(", and you can’t help but give yourself an affectionate little stroke, celebrating your freedom.");
	}
	else
	{
		output("Grabbing hold of [pc.oneCock], you give it a few strokes, ");
		if(pc.lust() >= 70) output("reveling in its hardness.");
		else output("watching it swell from half hard to full tumescence in the span of a few seconds.");
		if(cum > 1000)
		{
			if(cum >= 5000) output(" Pre-cum drools from the tip in a steady stream, ready to turn Nayna’s box into a sloppy-wet nest for your prick.");
			else output(" Pre-cum drips from the tip regularly, proof of your inhuman virility.");
		}
	}
	output(" You eyeball the cute little bunny’s butt, watching it quiver in excitement, enjoying the way her tail twitches.");
	//First time
	if(flags["NAYNA_FUCKED"] == undefined) 
	{
		output("\n\n<i>“You aren’t... you can’t...”</i> Nayna stares back at you over her shoulder, blushing and stuttering. <i>“You can’t fuck me through this suit!”</i> She meekly looks down, almost apologetic. <i>“It wouldn’t stretch enough. I just... I didn’t want you to hurt yourself.”</i>");
	}
	//repeat
	else output("\n\n<i>“You... uh...”</i> Nayna stares back at you over her shoulder, blushing and stuttering. <i>“D-don’t forget to move the suit out of the way.”</i> She looks like she’s about to have a nervous breakdown, then she blurts out, <i>“I don’t want to feel anything between me and your cock!”</i>");
	//Merge
	output("\n\nSlipping a finger between the latex-like fabric and the bunny’s simmering quim, you yank it to the side, revealing her glistening, almost purplish folds. A hint of bright pink peeks out from between them, glistening with feminine lubricant, and the rosy cherry of her clit is already exposed, almost begging you to touch and rub it. Her balls hang down and out of the way, ensuring that nothing will ruin your view of Nayna’s oft-hidden treasure.");
	//Treated/Ausar faced
	if(pc.isTreated() || pc.hasMuzzle())
	{
		output("\n\nYour nose wrinkles, and you find yourself sniffing at the air, savoring the traces of laquine’s musky yet feminine odor, a mild pheromonal soup that seems to reach up into your brain and flick the switch labeled ‘fuck this bitch’. Her scent seems stronger by the second, and your cock");
		if(pc.cockTotal() != 1) output("s");
		output(" grow");
		if(pc.cockTotal() == 1) output("s");
		output(" still harder, more like iron rebar than phallic flesh. Either she’s in heat or her cunt is lying to your nose. Either way, you feel a low growl in the back of your throat and a magnetic force tugging your [pc.hips] toward her soaked gash.");
	}
	//Merge
	output("\n\nNayna gasps when you touch your [pc.cockHead " + x + "] to her blushing femininity, ");
	if(!pc.isTreated() && !pc.hasMuzzle()) output("gently spreading");
	else output("savagely forcing");
	output(" her open. Her ears lift in surprise, then droop in charmed contentment, matched by an unconcerned smile and heavily lidded eyes. The more you push into her, the more receptive her body becomes. She’s so wet that the act of penetrating her creates a half-dozen squishes and squelches, each seemingly lewder than the one before. Fitfully squeezing, her pussy seems every bit as nervous and pleased as its owner, like it doesn’t really know how to please a penis but is too excited not to try.");
	if(pc.cocks[x].thickness() >= 3) output(" Even with her lips straining to take you, inside she’s still soft and almost roomy, at least when she relaxes.");
	pc.cockChange();
	output("\n\n<i>“Ah-ah-ahhhh,”</i> Nayna coos, her fingers clenching and relaxing against the bare metal. Her eyes seem a little glassy, like she had a few glasses of wine before deciding to get down and dirty, but you know better. The meek scientist is so out of touch with her own sex that she has no idea how to cope with the rampant sensations you’ve forced on her. Her pussy is bombarding her with all sorts of feelings and demands: shocks of pleasure, muscular contractions, and the desire for more - more penetration, more pleasure - anything to enhance the moment.");
	output("\n\nYet she’s incapable of doing anything but moaning and squeezing from her current position. She can’t really thrust back against you when the only contact she has with the ground is the tips of her toes, and even if she could, she doesn’t seem to have much fine control over her limbs. Her thighs twitch, and her shoulders shudder. Her hands slap and scratch at the metal, and her mouth opens and closes, sometimes silently, sometimes in sultry approval. All she can do is lie there and let you fuck her: let you saw in and out of her while her pussy drools, let you slap her ass and watch it jiggle, and let you fuck her to an orgasm whether she wants one or not.");
	output("\n\nShe very much does.");
	output("\n\nYou don’t rush yourself, not when you have such a fantastic piece of ass putting on a show down below. Fucking her rhythmically, you watch her callipygean ass wobble with every impact. You watch her breasts slide up and down the glossy metal of the machine below, only able to imagine how her nipples must feel, dragging against it. Nayna’s ears flop everywhere, limp as noodles, sometimes slapping the console a half-second after you slap your crotch into her cunt.");
	output("\n\nFragrant bunny-cum sticks to your loins, coating you in the proof of her enjoyment, making each successive hump that much louder and lewder than the one before. You plow Nayna until she’s gibbering and moaning, squeezing your [pc.cock " + x + "] like a vice. Slapping her ass, you lean low and ");
	if(pc.isBimbo()) output("let her know that she can totally cum, like whenever. That’s the perk of getting fucked! You get to cum like, all the time.");
	else output("ask her if she’s enjoying herself.");
	output("\n\nA wail of pleasure climbs out of Nayna’s throat. It sounds like it was meant to be ‘yes’ but the last half of the word is far too drawn out and garbled to make sense of it. Regardless, her whole body hitches, and her hips lurch up and down, dragging your [pc.cock " + x + "] around the inside of her slit with orgasmic gyrations. Her pussy doesn’t even try to hold its grip on you, the slick channel gushing and spastically undulating, unable to control itself in the moment of penultimate passion.");
	output("\n\nAnd that’s when you see her pearly cum running down the sides of the console.");
	output("\n\nUnwilling to foot the bill for the potentially expensive equipment, you step back, yanking Nayna with you, keeping her impaled on your dick, holding her aloft so that you can continue fucking her. She groans, but she does not stop cumming. You can see the inky rubber inflating around her torso while you piston in and out of her cunt. Excess spunk slops out of the suit just beneath her armpits, creating two pearlescent pools for her to wallow in and creating a dozen white-on-white streams that ooze past her wrists to drip from her fingers. Once perfectly encased, her breasts lose all definition through the intervening layer of black gloss, inflating into a squishing, cum-augmented uniboob.");
	output("\n\nThen the seal around her neck gives out.");
	output("\n\nFew words could appropriately describe the tide of spooge that washes over Nayna’s head, but ‘epic’ comes closest. In an instant, she goes from blissful drooling to absolutely spunk-blasted. Every single strand of hair and every single bit of fur, they’re all drenched in semen. Jizz clings to her hair and glues her eyes closed, hanging in webs from her eyelashes. Her ears aren’t safe either. They get basted from base to tip, outside and inside, and hang into the inch-deep puddle like fuzzy teabags.");
	output("\n\n");
	if(pc.isTreated() || pc.hasMuzzle()) output("Snarling, ");
	else output("Panting, from the effort, ");
	output("you feel your orgasm mounting, triggered by the sight of the sheltered laquine whitewashing her face. Your [pc.cock " + x + "] stiffens inside her, and [pc.cum] ");
	if(cum < 10) output("dribbles out, small in quantity but no less big on pleasure.");
	else if(cum < 150) output("fires wildly, nowhere near as voluminous as your lapine lover’s but every bit as pleasurable.");
	else if(cum < 750) 
	{
		output("squirts out in thick streams, basting your lapine lover’s eager channel in your liquid pleasure. In no time at all, her netherlips look nicely creampied.");
	}
	else if(cum < 5000)
	{
		output("hoses out in lurid ejaculations, flooding her tunnel and womb");
		if(cum >= 1500) output(", even paunching her belly");
		output(". You’ve no doubt that your lapine lover may be outproducing you, but your considerable virility ensures as a thorough a seeding as any cumslut could hope for.");
	}
	else
	{
		output("hoses out in geyser-like ejaculations, instantly filling her channel with the first blast, then flooding her womb with each successive pump. Her netherlips are quickly glossed in your liquid pleasure, thoroughly claimed, and her already chubby belly rounds with liquid distention, forcing her nine-inch prick to jut ever more lewdly forward as it wastes its own load in Nayna’s suit.");
		if(cum >= 7500) output(" Before long, your lapine lover is gratuitously pregnant, a fertile-looking dome that dominates her short frame.");
	}
	output(" Seeing stars, you keep fucking the slutty scientist’s spunked-up quim, prolonging your orgasm as long as you are able.");

	output("\n\nLike all good things, even your orgasm has to end, and with the waning of the pleasure, you find yourself suddenly tired from supporting Nayna’s curvaceous-but-weighty frame. You slump backwards, bringing her with you");
	if(pc.hasKnot(x)) output(", still firmly connected by your [pc.knot " + x + "]");
	else output(", still connected by your [pc.cock " + x + "]");
	output(", too contented to care that she’s still pumping out more creamy white goo - or that it starts getting all over you now that she’s on top.");

	output("\n\nShe cranes her neck to kiss you, tasting heavily of her own cum, and you kiss her right back, trying not to grin when you reach up to discover that she’s <i>still</i> cumming. There are worse things than making someone orgasm so hard that they ejaculate for two minutes straight, you suppose. Closing your eyes, you snuggle in your exceedingly productive fuck-bunny, happy to doze against her once she finally stops squirting.");
	processTime(22);
	pc.orgasm();
	pc.applyCumSoaked();
	clearMenu();
	addButton(0,"Next",naynaFuckEppiloggie,cum);
}

public function naynaFuckEppiloggie(cum:Number):void
{
	clearOutput();
	showNayna();
	output("When you come to, Nayna is stretching next to you and smiling, watching a small robot zip over her body, harmlessly vaporizing the last patches of cum out of her hair.");
	output("\n\nIt’s then that you realize all signs of your tryst are gone. No puddle remains. The console you fucked over is spotless, and you’re almost as clean as if you took a shower.");
	if(flags["NAYNA_FUCKED"] != undefined) output(" That little bot is almost as good as a galotian.");
	else 
	{
		output(" Casting a curious look Nayna’s way, you ask her how she got you so clean.");
		output("\n\nGrinning knowingly, she answers, <i>“Science! Well... more specifically, kui-tan and laquine science. I got it to clean up my... uhm...”</i> Nayna blushes, then squirms, making a wet-sound between her thighs. <i>“You know how sometimes, if you don’t cum very often, you’ll go off at night?”</i>");
		output("\n\nYou nod.");
		output("\n\n<i>“Spending two hours cleaning up my room twice a week isn’t very fun, so I got this little guy. It doesn’t do as good a job as a galotian might, but it’s not nearly as high maintenance.”</i>");
	}
	output("\n\nGiggling naughtily, Nayna stands and gives you a kiss, whispering, <i>“I k-kept as much inside myself as I could, once I calmed down.”</i> She seems to search your face for approval, and then nods. <i>“I... better catch up on my research... but don’t hesitate i-if you ever w-want more.”</i>");
	if(cum >= 2500)
	{
		output("\n\nYou could get used to making more laquines smuggle ");
		if(cum >= 10000) output("beach ");
		else output("basket");
		output("ball-sized cum-bulges under their clothing.");
	}
	IncrementFlag("NAYNA_FUCKED");
	pc.shower();
	processTime(75+rand(10));
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}


//Nayna fucks your butt.
public function naynaFucksYourButt():void
{
	clearOutput();
	showNayna(true);
	author("Frogapus");
	output("You tell Nayna that you would like her to take you.");
	output("\n\n<i>“Like out to dinner?”</i> she asks. She tilts her head in mild confusion, her ears flopping to one side. <i>“That sounds nice, but I really should be in here continuing my research.”</i>");
	output("\n\nYou ");
	if(pc.isBimbo()) output("giggle in amusement");
	else if(pc.isNice()) output("roll your eyes");
	else if(pc.isMischievous()) output("sigh in exasperation");
	else output("grunt, completely unamused");
	output(" and clarify that you’d like her to fuck your ass.");

	output("\n\n<i>“Oh! ...Ohhhhhhh!”</i> she says, wide-eyed, her lips a perfect “o” of surprise. She frowns, her chin resting on one hand, considering it.");
	output("\n\nYou let the laquine think it through, glancing down at the pert bulge just above her thighs. It gives a small twitch, resulting in a faint squeaking noise as she looks back up to you. It looks like the chubby scientist’s body has come to a decision, even if her mind is too shell-shocked to reply.");

	output("\n\nShe smiles shyly and ");
	if(!naynaWarm()) output("slowly begins to undo her " + naynaClothes() + " then ");
	output("nervously glances down at her dick and back up at you... then down again. Then, grinning slightly, she asks, <i>“");
	if(flags["NAYNA_FUCKED_PC_BUTT"] == undefined) output("Really? I... well... okay. I’ll try!");
	else output("Again? So I was pretty good then, huh?”</i> She runs a hand through her hair, adjusting an ear. <i>“I bet I can do better this time.")
	output("”</i>");

	output("\n\nShe takes a small breath, and you lean in against her, pressing your palm against her bulge, running your fingers up lightly, from balls to tip of her lovely, fat cock. She stops, her mouth open halfway, whatever word she was preparing dropping from her lips as she gives a full body shiver.");

	output(" When her mouth starts moving again, she murmurs, soft and low, <i>“I didn’t - ah! ...didn’t even think about your butt that first time you did that, uhm... hug.”</i> She whimpers, her hips twitching against your palm. Her cock thickens nicely, big enough for her heartbeats to spread your fingertips wider.");
	output(" <i>“Now I can’t stop.”</i> She blushes as if she’d said something horrendously embarrassing, a pink flush just visible under the white fur of her cheeks.");
	output("\n\nYou " + pc.mf("chuckle","giggle") + " at the snow bunny’s admission, answering that you’d been enjoying a few extra things in her hugs as well. You punctuate the statement with a firm squeeze against the shaft of her dick, feeling the thick ring of her sheath.");
	output("\n\nNayna slides her soft, white-furred paw over your hand, guiding it, rubbing softly over the form-fitting suit. The laquine girl gives a throaty moan, her hand tightening on yours, stroking herself faster and faster with your hand. With a chorus of small squeaks, the broad, equine head of her dick pushes up over the lip of the latex, spilling out against your hand.");
	output("\n\n<i>“Oh fuck yesssss ...”</i> she moans, grinding her hips hard against you. She lets go of your hands leaning in against you, wrapping her arms around your back. ");
	if(!pc.isCrotchExposed())
	{
		output("Hurriedly, she undoes your [pc.lowerGarments] with your help, tossing them aside. ");
	}
	output("With you naked against her, her hands slide down, massaging your ass. Her fingers dig into your [pc.butt], groping you with a hungry desperation. Her massive, pillowy breasts threaten to engulf you as she pulls you tight against her body. Opposite them, her cock grinds hard against your ");
	if(pc.hasCock()) output("[pc.cocks]");
	else if(pc.hasVagina()) output("[pc.vaginas]");
	else output("[pc.hips]");
	output(". Nayna’s breath comes hot and fast against your ear, as she uses you to get herself off.");
	output("\n\nHer mouth turns to your neck, hot and hungry as she bites it lightly. You let out a soft moan and she stops suddenly, pulling away from you, blinking, her face visibly flushed under her fur. <i>“Oh! Sorry! I don’t know what came over me! I-I must have gotten carried away!”</i>");
	output("\n\nYou assure Nayna that a rough, passionate buttfuck is exactly what you had in mind.");
	output("\n\nShe smiles, her rabbit-like front teeth ");
	if(naynaWarm() && !naynaGloomy()) output("gleaming in the sunlight");
	else if(hours >= 6 && hours < 20 && flags["SHUTTER_STATUS"] == 2) output("just visible in the overcast murk of the room");
	else if(hours >= 6 && hours < 20 && flags["SHUTTER_STATUS"] == 0) output("shining bright in the starlight");
	else output("barely visible in the darkness of the room");
	output(".");
	output("\n\n<i>“I was kinda hoping you’d say that,”</i> she says. Her sentence starts in her usual peppy voice, but swiftly drops into a hungry growl. She dives back in against your neck, her teeth nibbling at your neck as her hands return to your ass. Between your own gasps of pleasure, your fingers slide across Nayna’s bodysuit, hurriedly peeling it from her.");
	output("\n\nShe breaks her hungry bites and pulls back as you yank it down her shoulders and over the massive curve of her breasts. Her chest heaves as your fingers curl across it, and the tightness of the rubbery material drags your fingertips across her areolae. You feel the push of her nipples as they tighten under your fingertips. You lower yourself, tugging her bodysuit down further. When her breasts pop free, they bounce against your face, burying you in white, fluffy cleavage.");
	output("\n\nWith her suit down to her waist and her arms trapped at her side, she looks down at you, her pink eyes aglow with a primal hunger. You peel down to her crotch, gazing at the thick, nine-inch organ throbbing beneath the tight material. You lean forward, running your tongue up her girthy length, feeling her pulse through the fabric. It’s a little salty with sweat and excitement, pulsing hotly on your tongue.");
	output("\n\nNayna gives a squeaky growl of frustration, wiggling her arms out of the latex and grabbing ");
	if(pc.hasHair()) output("your [pc.hair]");
	else output("you by the back of your head");
	output(" and pulling you tight, grinding your face against her meat. You tilt your head to the side, trying to avoid suffocation by cock-smothering, and feel her dick pressed lengthwise against your mouth. One of her hands releases its hold, her thumb hooking under her half-off jumpsuit, peeling it further and further down. It presses against your cheek and lips as it passes, and you feel the texture against your mouth change from hot, slippery latex to throbbing, sticky cock.");
	output("\n\n<i>“Ah ahhh,”</i> she coos from overhead. You glance up at her, seeing the laquine going cross-eyed in pleasure. Her grip on your head is still pretty strong, so the most you can do is suck softly at her dick. You can feel it growing, not just longer, but wider, until you feel it stretching your jaw with its width. Still, you keep attending to it until you feel something hot and wet against your cheek. It oozes down around your lips and you taste the warm saltiness of Nayna’s pre.");
	output("\n\nYou feel her hands tug you up, righting you and guiding your mouth up the pink length of her cock. You lick and suck, groaning happily, slurping up the ");
	if(pc.isBimbo()) output("yummy ");
	output("slick of her pre-cum. When you reach the flat, equine head of her cock, you suck messily at it, slathering it with your saliva. When she tugs your head back, your face is a mess, smeared with her pre and your spit, matching her shaft.");
	output("\n\n<i>“Good " + pc.mf("boy","girl") + ",”</i> she coos. <i>“A little moisture is a powerful thing,”</i> she adds, giving her dick a bounce. Free from your mouth, it spatters hot fluid against your [pc.chest]. You shiver at the sensation, inhaling sharply as she grins.");
	output("\n\n<i>“It can wear down rocks... or lubricate cocks,”</i> she giggles. Her words are lighthearted, but that hunger is still there in her tone. She wants your ass, no matter how cheery she’s being about it.");
	output("\n\nNayna slips behind you, kneeling down to the floor with you, her soft-furred hands gripping your haunches. Her mouth returns to your neck, licking softly at first, then sucking and nibbling, interspersed with little growls and gasps from the plush snow bunny.");
	output("\n\nYou yelp when you feel the spit-slick tip off her broad dick press against the cheeks of your [pc.butt].");
	if(pc.analCapacity() < 50) output(" Your heart pounds. How are you going to take a monster like that inside you? It could split you in half!");
	else if(pc.ass.looseness() < 3) output(" You moan, softly. You hope you can handle something that thick. At any rate, you’re more than willing to try.");
	else output(" You pant excitedly. Finally! Something big enough to satisfy your cavernous ass.");
	output("\n\nWhen her fingers dig in and she begins to push against your asshole, you lean forward instinctively, raising your butt up to meet her. She lets out a hum of pleasure, her nose twitching against your cheek.");
	output("\n\n<i>“Oh fuck, [pc.name]! It’s so good! ");
	if(flags["NAYNA_FUCKED_PC_BUTT"] == undefined) output("I can’t believe I finally get to do this! ");
	output("I never want to stop,”</i> she moans. She pushes harder, and you pant, feeling your hole stretch to accommodate the three-inch diameter of her dick.");
	pc.buttChange(80);
	output("\n\n<i>“I-ah-can’t stop!”</i> she squeaks.");
	if(pc.isTaur()) output(" You feel her face pull back from your shoulder as");
	output(" Nayna adjusts herself, her fingers grabbing your [pc.hips] tight. Before you can say anything, she shoves her dick into you.");
	output("\n\nYour eyes widen and your breath catches in your throat as you feel her length jam all the way up into your ass. The flared ridge of her horse cock drives first, running wide and thick up into you, followed by her throbbing shaft, pulsing hard against your insides. You can’t move for a moment, riding out the wave of sudden fullness and an immediate soreness from her rough intrusion.");
	output("\n\nShe slides all the way in, letting you feel the thick veins and rings of her cock as they push all the way into you. When her furry, apple-sized balls finally rest against your ass, she lets out a happy moan. <i>“Oh, oh yeah... that’s the stuff,”</i> she groans. You feel a warm drop somewhere on your back. It’s not too hard to imagine that Nayna is drooling with pleasure as she buries herself inside you. She rests there for a moment, rocking softly against you, letting you feel the soft tug and push of her cock nine inches deep in your ass.");
	output("\n\nWhen you finally do breathe again, you feel her shifting her position. Her hands grasp your hips with surprising strength, raising your ass. You glance over your shoulder, seeing her sitting on her haunches, resting on the balls of her feet. Her dick is still inside you, and you see her give a few experimental bounces. Her dick shifts an inch out of you and then back in. You moan, your hole twitching around her thick shaft");
	if(pc.hasCock())
	{
		output(", your ");
		if(pc.cockTotal() == 1) output("cock");
		else output("cocks");
		output(" leaking out their own spatter of pre on the floor");
	}
	output(".");
	if(pc.hasVagina())
	{
		output(" Your ");
		if(pc.totalVaginas() == 1) output("pussy trembles");
		else output("pussies tremble");
		output(", and you feel wetness starting to ");
		if(pc.wettestVaginalWetness() < 2) output("leak");
		else if(pc.wettestVaginalWetness() < 3) output("trickle");
		else output("gush");
		output(" from your slit");
		if(pc.totalVaginas() > 1) output("s");
		output(".");
	}
	output("\n\n<i>“It’s a - ung - a good thing you like it,”</i> says Nayna. <i>“I don’t think I can stop! I don’t think I’ll ever stop!”</i>");
	output("\n\nNayna pushes down against you. You feel the soft squish of her balls as they nestle against your ass, her dick pushing as deep as possible inside you. You glance over her shoulder again, just in time to see her massive thighs flex, pushing her up.");
	output("\n\nYou gasp as her cock pistons out of you. Her horse-head drags along your inner passage, feeling like she’s scraping you out. Your hips rise to meet her, but her hands slam down against the small of your back, resting half her weight on you-keeping you pinned down. Up and up and up her cock goes until her tip bumps against your pliant ring, leaving you with a sense of absolute emptiness.");
	output("\n\nIt’s only for a moment, though, as she pauses at her apex, then drives back down. You moan, more out of pleasure than pain as she drives her cock back down into you, filling you up so quickly that the breath whooshes out of you.");
	output("\n\n<i>“Up we go!”</i> she says cheerfully. She bounces back up, dragging her dick out of you. Once more, her weight pauses at the top of her bounce, before she plunges back into your ass. Over and over, she bounces, until you lose count, completely lost in the feeling of Nayna pumping in and out of your ass.");
	output("\n\nFinally, she pauses on a downstroke. She wiggles her hips a bit, adjusting her weight on you. <i>“S-stars, I love this. Am... am I doing it right?”</i> she asks, waiting until you weakly affirm. <i>“Then brace yourself,”</i> she chirps.");
	if(flags["NAYNA_FUCKED_PC_BUTT"] == undefined)
	{
		output("\n\nWait, what? ");
	}
	else output("\n\n");
	output("You grit your teeth as the bunny shifts gears. Her paws grab you by your waist, and her hips bouncing faster and faster. Her tremendously thick cock hauls upwards and then grinds down into you in the amount of time it takes you to gasp in pleasure. You gulp a breath and she’s back up again, her cock sliding out, and then shoving back down.");
	output("\n\nOver and over, she thrusts in and out of you, pinning you down as she humps you mercilessly, her muscles apparently not growing tired. You feel her pre oozing into you, though, starting to squelch with each rapid downstroke. Its heat, combined with her furious piledriving, is making you start to feel faint, your whole body shuddering with Nayna’s impacts, radiating pleasure with each bounce of the bunny’s cock inside you.");
	pc.changeLust(100);
	output("\n\nNayna’s panting heavily, her bouncing hips smacking into your upturned ass with each downward pump, her balls slapping against you as her momentum builds. Her pussy smears a fresh load of her juices on each bob, adding more lubrication to her swiftly-pounding dick. She’s going faster and faster. You can feel her cock throbbing inside you, and it feels so amazing that you can barely catch your breath. She’s oozing so much pre deep inside you that it almost feels like she’s aready cumming. You’re not sure how much more of this you can take before you pass out.");
	if(pc.isBimbo()) output(" It just feels so amazing to finally get a proper ass pounding!");
	output(" Every thrust of her thick dick brings a new wave of pleasure crashing through you, and she’s shoving it in and out so fast, that a new surge of pleasure floods your body before the first is even gone.");

	output("\n\nThe heavy laquine woman cries out desperately. <i>“I’m gonna - I’m gonna-!”</i> She fucks you harder and harder, and shoves deeper in you than she’d ever gone before. You feel the flared head of her cock swell deep inside you, feeling for all the world like someone’s buried a cantelope in your colon. <i>“Cummmmmmmmmmmm!”</i> she yells. You feel the first surge of cum pumping deep inside you, flooding you with heat and warmth. It radiates outward, and you realize it’s not just the heat. Nayna’s filling you with what feels like a gallon of bunny spunk.");
	output("\n\nYou groan, reaching down to your stomach, gasping in shock as you first feel the flared head of Nayna’s cock rising up like a melon-sized lump against your tummy. You moan, halfway in pleasure and shock as you actually feel the moving bulge of her cock shooting out cum inside you. Your whole belly surges as she pumps her massive load inside you as a near-continuous stream.");
	output("\n\n<i>“Oh fuck! Oh [pc.name]! Oh fuck yes!”</i> She’s moaning, repeating your name over and over again, her paws digging into your hips.");
	if(pc.hasCock()) 
	{
		output(" You can’t help it, the enormous pressure on your prostate, the half-hour of bouncing-it’s too much and you cum, ");
		if(pc.cumQ() < 10) output("oozing");
		else if(pc.cumQ() < 40) output("spurting");
		else if(pc.cumQ() < 500) output("jetting");
		else if(pc.cumQ() < 4000) output("hosing");
		else output("flooding");
		output(" your load out on the floor!");
	}
	if(pc.hasVagina() && pc.blockedVaginas() == 0) 
	{
		output(" Your body is far too overwhelmed with sensations to not finish with your [pc.vaginas]. You shove one hand to your mound");
		if(pc.totalVaginas() > 1) output("s");
		output(" just in time to have a shuddering orgasm, ");
		if(!pc.isSquirter()) output("drizzling");
		else
		{
			if(pc.girlCumQ() < 1000) output("raining");
			else output("dumping");
		}
		output(" your pussy juices down your thighs.");
	}
	// Create Nayna
	var pp:PregnancyPlaceholder = getNaynaPregContainer();
	pc.loadInAss(pp);

	output("\n\n<i>“Can’t stop!”</i> she groans, humping your ass. Her hips grind hard against yours as more and more of the laquine’s cum fills you. The pressure should be too much, but her massively-flared cockhead keeps her dick from budging, leaving her cum with only one way to go. Your belly swells, and you lose yourself in the debased delight of being her fucktank. By the time her humping turns into a steady grind against your hips, you feel your [pc.belly] brushing against the floor. You feel full to bursting, but Nayna’s stream seems to have finally stopped.");
	output("\n\nShe lets out a soft sigh, relaxing her grip on you.");
	if(flags["NAYNA_FUCKED_PC_BUTT"] == undefined) output(" <i>“Wow ... ”</i> she pants, <i>“That was-”</i>");
	else output(" <i>“Well, at least this time, I didn’t-”</i>");
	output(" Midway through her sentence, you hear a sharp squeak, the sound of Nayna’s foot slipping on a small puddle of your juices. She yelps, and you cry out in alarm as she slips, pitching forward and collapsing her considerable weight on top of you. You’re still recovering from the half-hour of pounding. Your [pc.legOrLegs] can barely hold your own weight-much less hers. Your knees give out, too!");
	output("\n\n<i>“OOF!”</i>");
	output("\n\nYou both collapse to the floor in a heap, and you feel a MASSIVE surge of pressure in your swollen gut. All her cum! And you were fit to burst!");
	output("\n\nThe sudden impact against your stomach pops Nayna’s cock free, your ass disgorging her massive dick along with a near-literal river of cum. You squeal in discomfort as her pleasure-swollen head swings out of you, slapping wetly against your leg. She grunts as her chin collides with the back of your head. Her breasts moosh against your back, her limbs splayed awkwardly atop yours. You moan in a heap under Nayna, the snow bunny groaning in pain atop you, her panting breath in your ear. You can’t seem to focus on any one thing-you’re still riding on waves of endorphins, and dealing with the sudden aches and pains of your sudden collapse.");
	output("\n\n<i>“Owwww,”</i> she moans. You open your mouth to say something, but Nayna shifts her weight atop you, sending another gush of cum from your ass. You gasp, frozen in the sensation of being splayed out as hot, laquine spunk flows out of you. She flops off your back, sitting next to you as a small lake of her cum gradually grows around you.");
	output("\n\nYou turn your head toward her, the rest of your body not particularly cooperating. She’s sitting on her butt, her spooge-drenched cock flopped out against her thighs, one hand massaging her chin, and the other cradling her breasts. She looks at you, aghast, a look of unbridled embarassment on her face.");

	if(pc.isNice()) output("\n\nYou take one look at her horrified expression and start " + pc.mf("laughing","giggling") + ".");
	else if(pc.isMischievous()) output("\n\n<i>“Next time, I’m on top,”</i> you groan.");
	else output("\n\nYou fix her with a hard look. The sternness in your eyes is somewhat spoiled by the precum still smearing your face, and the slow flow of bunnycum from your butt.");
	output("\n\nShe goggles at you, then bites her lip and giggles");
	if(pc.isNice()) output(", too");
	output(". Lying there, soaked with laquine seed, you");
	if(pc.isAss()) output(" can’t help it and eventually");
	output(" break into gales of laughter with the chubby bunny girl massaging her sensitive breasts.");
	output("\n\nAt some point amidst the giggling, Nayna reaches to grab her tablet, tapping the screen a few times. There’s a faint hum as a small, puck-shaped robot zips out from a slot in the wall, making its way to the two of you. It moves back and forth across the gigantic cum puddle, making only a whisper of sound as it vaporizes the massive amount of spilled seed.");
	output("\n\nNayna’s fingers brush softly against your belly. You realize with a start that there’s still a bit of a bulge there. It looks like you’re still carrying a partial load of the laquine’s cum inside you. Gently, she helps you up, and the two of you get dressed. Nayna can’t stop blushing, and you’re hard pressed not to do so yourself.");
	output("\n\n<i>“We should do that again,”</i> she babbles, tongue lolling. Her fingers slowly drag her bodysuit back into place, operating entirely on autopilot. <i>“If you wanted. It was good, right?”</i> Rubbing at her half-hard prick through her suit, the drained laquine moans, ");
	output("<i>“Sooo good...”</i>");
	output("\n\nYou can’t see any reason not to nod enthusiastically.");
	
	IncrementFlag("NAYNA_FUCKED_PC_BUTT");
	processTime(45);
	pc.orgasm();
	
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Nayna Docking For Hyperest of PCs
public function naynaDockingForHyperPCs():void
{
	clearOutput();
	showNayna(true);
	output("<i>“I want you to put that cute little bunny-cock inside of mine.”</i> ");
	var x:int = pc.biggestCockIndex();
	if(!pc.isCrotchExposed()) 
	{
		output("You open your [pc.lowerGarments], letting your excessively large endowment flop out");
		if(pc.cocks[x].cLength() >= pc.tallness/2) output(" to the floor");
		output(".");
	}
	else output("You grab your excessively large endowment in both hands and lift to aim the tip in her direction.");
	output(" <i>“");
	if(pc.isNice()) output("And just do what comes naturally.");
	else if(pc.isMischievous()) output("And discover the advantages of having such a </i>gifted<i> lover.");
	else output("And fuck me.");
	output("”</i>");
	//First time
	if(flags["NAYNA_HYPERDOCKED"] == undefined)
	{
		output("\n\nNayna scrapes her jaw up off the floor. <i>“Uh, [pc.name]... that’s an ‘out’ hole. You know that right?”</i> She fidgets while gesturing at the tip of your [pc.biggestCock] as if she just can’t bring herself to stare at the increasingly visible urethra atop it. A bead of pre-cum nearly as fat as her entire dick slides out, leaving a glossy trail across your [pc.cockHead " + x + "]. Nayna’s eyes lock onto it, and she chews her bottom lip. <i>“I guess there’s plenty of lubricant, huh?”</i>");
		output("\n\nYou nod, getting harder from watching the curvy laquine inspect your package. She may have started out protesting, but the longer she spends staring at your cock, the more obvious it is that she’s talking herself into it.");
		output("\n\n<i>“With the size difference, it would definitely fit.”</i> One of Nayna’s paws is idly rubbing against a nine-inch distention in her undersuit. <i>“And it would stimulate both our erogenous zones spectacularly,”</i> she surmises, extending a the other to stroke the rim of your dick.");
		output("\n\n<i>“Cocks,”</i> you correct her. <i>“It would stimulate our cocks.”</i>");
		output("\n\nNayna squeaks, her ears falling flat in shame before slowly lifting once more. <i>“Yes... it would be quite pleasurable for our... cocks.”</i> Smiling shyly, she shifts her latex-like suit to the side, exposing a very, very stiff bunny boner. <i>“I’ll try it... just a little bit.”</i> Pre-cum drips out of her dick like water from a leaky faucet.");
		output("\n\n<i>“A little bit?”</i> Even turned on as you are, it’s difficult to contain your mirth. The poor thing is getting so worked up!");
		output("\n\nSeeing your lecherous grin, the laquine shudders, trying to compose herself before giving up entirely and grabbing your dickhead in both hands. <i>“Just because my body gets like this around you doesn’t mean I’m into all the weird... stuff you get into out there in the rim.”</i> She licks her lips and stares, transfixed by the way your eager urethra seems to pulsate and wink with every crystal clear load of pre. <i>“I’ll just fuck you a little.”</i> She’s shimmying closer, caressing the sides of your [pc.cock " + x + "] like a lover’s hips. <i>“Just a little cock on cock pleasure. A little... uh... docking.”</i>");
	}
	//Repeat
	else
	{
		output("\n\nNayna’s ears droop, and you swear you can hear her knees knock together. <i>“A-again?");
		if(flags["NAYNA_HYPERDOCKED"] == 1) output(" Even after what happened last time?");
		else output(" You really like it when I do that to you, huh?");
		output("”</i> There’s no concealing the way her dick is growing inside the shining veneer of her jumpsuit, or the fact that she’s stepping closer, her thick thighs swaying wider as the space between you diminishes. <i>“But it’s such a filthy... dirty...”</i> Her fluffy paws");
		if(!pc.isCrotchExposed()) output(" fumble with your [pc.lowerGarment], freeing your pent-up length to pop out");
		else output(" gently reach for your pent-up length");
		output(". It surges out into her waiting palms, letting her guide its engorgement at the perfect waist height for her. <i>“...naughty... fuckable....”</i>");
		output("\n\nNayna stops talking and simply stares, shifting the weight of your enormous boner into the crook of her arm so that she can stretch her clingy undergarment out of the way. Her dick springs out, rock hard and ready to go, the tip fully engorged and leaking.");
		output("\n\n<i>“Somebody’s being naughty and fuckable,”</i> you point out, grabbing your outsized dong in both hands to take the pressure off the fluffy little sex-pot, aiming your [pc.cockHead " + x + "] square at her animalistic endowment.");
		output("\n\nJumping like she’s been shot, Nayna shakes her head, clapping her hands over her chubby, laquine prick. <i>“No I’m... oh, fuck it!”</i> Curling her padded palms around to the sides, she starts jacking herself off, moaning at her own lewd display. <i>“Maybe I am!”</i> Her hips shake like a jackhammer, plowing her pre-greased palms with reckless abandon. <i>“Maybe I’m just as filthy inside as some rushward whore! Maybe I just want to fuck you till you’re a cummy wreck!”</i> Nayna stumbles forward, her slobbering prick a hairsbreadth away from your pulsing, eager urethra. She growls, <i>“But right now all I can think about is stuffing that ridiculous dick of yours with enough spunk to drown a galotian.”</i>");
	}
	IncrementFlag("NAYNA_HYPERDOCKED");
	//Merge
	output("\n\nNayna’s self-control falls apart like a house of cards held up to an X1 racer’s engine wash. Leaning over your mammoth member, she gingerly shifts, brushing her swollen glans against your dick-slit and shivering in delight. She closes her eyes, and with her lips curling in a shy smile, she edges forward, spreading your cock around her own enormous girth. It’s a feeling unlike any other in the universe, hard and throbbing, wet and hot with your pre-cum mixing around in your urethra.");
	output("\n\nYou try to hold yourself still. Thrusting forward would only knock Nayna on her ass, and every other instinctive movement seems magnified out at the end of your enormous tentpole.");
	output("\n\nNayna, on the other hand, has no compunctions about manhandling your member, but she does ease her way in with care. Maybe she’s afraid that she might hurt you, or that something could tear without enough lubrication. Maybe she’s just enjoying the delightful feeling of sliding inch after inch into a passage tighter than she’s likely to find anywhere else in the quadrant. She works it nice and slow, gyrating her hips in small circles to gradually widen the opening at your tip. Pre dribbles down your length and across her balls, a mixed slew of sensuous eagerness.");
	output("\n\nYou groan delightedly, and Nayna moans right along with you, head lolling backwards. Her ears join her in going limp, sagging back in her full-throated ecstasy until they hang limply against the back of her head. Not even her grip on your [pc.cockHead " + x + "] escapes her pleasured slackening. She’s clearly drunk on pleasure, loving the silken caress of your oversized dong’s pulsating interior.");
	output("\n\nYou can feel it too. Each beat of your heart makes your [pc.cock " + x + "] tremble, pushing back against the intruder within, bearing down on her with your own biological imperative to engorge. Nayna is harder somehow, perhaps due to her smaller size. Whatever the case, her dick is barely affected by your member’s incessant squeezing. It plunges in and out without a single care for anything beyond its own pleasure, drooling so much liquid anticipation that it feels like she’s literally pumping up your prick, inflating you with her ludicrously copious fluids.");
	processTime(6);
	pc.changeLust(100);
	clearMenu();
	addButton(0,"Next",naynaDockingPart2);
}

public function naynaDockingPart2():void
{
	clearOutput();
	showNayna(true);
	output("Nayna gasps, and the pumping of her hips redoubles. Her flare expands, stretching just slightly wider than the rest of her pudgy boner, dragging against your sensitive walls, making it even harder for you not to buck your [pc.hips] and fling her into the next county.");
	output("\n\n<i>“Ung! C-can I...”</i> Nayna shudders at the unspoken thought, stroking her hands up and down your throbbing length. She gasps and looks back up at you, a little cross-eyed. <i>“C-can I cum inside?”</i> Her prominent buck teeth bite into her lush lower lip, yet her thrusts do not slow in the slightest. Quivering on the very edge, she tries to hold her composure together until you give her a reply.");
	output("\n\nShould she cum inside?");
	processTime(4);
	pc.changeLust(100);
	clearMenu();
	addButton(0,"Yes",cumInsideWhileDockingNayna,undefined,"Yes","Let her cum inside, consequences be damned!");
	addButton(1,"No",makeNaynaCumOutsideAfterHyperFun,undefined,"No","Don’t let her cum inside, but she can cum all over your dick if she wants.");
}


//[Yes] - Let Her Cum Inside
public function cumInsideWhileDockingNayna():void
{
	clearOutput();
	showNayna(true);
	var x:int = pc.biggestCockIndex();
	output("<i>“Do it,”</i> you urge, wondering just how good it’ll feel to let the bunny-girl release her gallons inside you.");
	output("\n\nPermission is apparently all it takes to set the curvy laquine off. She grabs hold of your [pc.cock " + x + "] in both hands and leans over, wrapping her entire upper body around it. Her plush, fuzzy tits squish down against it, the soft texture of her fur contrasting wonderfully with the slippery smoothness of her rubbery-looking undergarment.");
	output("\n\nThen you feel it, the torrential outflow of bunny-spunk pouring into your dick, filling an already stuffed urethra to capacity with steaming hot jism. And that’s just the first squirt. Nayna quivers like a fully drawn bowstring and unloads once more. This time, that torrid fluid burrows further back into you, pushing her spunk into your deepest recesses. It’s as bizarre as it is hot, a strong ecstasy approximating ejaculation in reverse. Bolts of delight radiate up from your core as it is filled, then stretched, then stretched some more.");
	//Balls
	if(pc.balls > 1)
	{
		output("\n\nNayna is an endless fountain of cum. It rushes through you backwards, pumping up through your prostate and seminal vesicles, swirling and swelling, and then suddenly venting into your [pc.balls]. Heat blossoms through the testicular flesh, accompanied by an obvious swelling. Your [pc.sack] is gaining in girth by the second, transforming your poor nuts into rapidly ballooning bunny-cum tanks.");
		output("\n\n<i>“Your balls!”</i> The laquine stares in gape-mouthed marvel, idly caressing your dick as she inflates your balls. <i>“Doesn’t that h-hurt?”</i> She’s almost whimpering, though in shame or delight, you can’t tell.");
		output("\n\nThey don’t hurt in the slightest. It feels fantastic, and you tell her so. It’s like that moment right before orgasm where everything gets super-tight and engorged, only it’s constantly getting tighter and tighter.");
		output("\n\nNayna babbles, <i>“Good... good... That’s good.”</i> She spurts hard enough to bulge the underside of your cock. A second later an equal amount of fluid rushes into your straining gonads, displaced from your internal plumbing by the fresh wave. <i>“It’s so good!”</i> Whimpering, Nayna humps away at your dick, sending squirts of her seed flying in every direction with her backstrokes, but she shoots more than an equal measure back in.");
		output("\n\nThe skin of your [pc.sack] is taut and shiny. The slightest details in your juggling, cum-swollen nads are reflected through the straining veneer.");
		if(pc.legCount > 1) output(" They’re so big that they force your [pc.legs] apart.");
		output(" You can feel the cold floor pressing up from beneath. Greater amounts of skin make contact as the seconds tick by, distorting the rounded, jiggly shapes. In no time at all, you’re resting on your balls more than your [pc.feet], and Nayna is still cumming, still forcing more inside.");
		output("\n\nThe once-meek climatologist is watching with feverish intensity, soft paws holding your twitching, dripping member in both hands as she fucks it like her own personal pocket-pussy, only instead of flooding a condom, it’s your balls that drown in her jism. She trembles one last time, firing dick-bulging gouts of seed into your nuts, then sags down atop it. Her eyes widen when she realizes the edge of your sack is within an inch or two of her fuzzy toes. She could reach out and caress her cummy prize with the tiniest effort.");
		output("\n\nYou’ve never felt fuller... or hornier. Maybe it’s the sensation of her sperm swimming around inside you with your own. Maybe it’s the decadent lewdness of the act itself. Maybe its the feeling of your every movement making your [pc.sack] increasingly jiggly and wobbly, one nut sliding against another in exquisite delight. Or you could forget all about it the moment Nayna presses her footpaw to the gently-curving swell of an enormous testicle. Her skin is just as warm as the cum swirling inside, and as she gropes you, you lose all control.");
		output("\n\nYou don’t even manage to warn the poor bun. Climax hits you like a bolt of lightning, faster than the speed of the nonsense words spilling from your maw. A lurid gurgle fills the air while your internal muscles clench, and Nayna abruptly grunts.");
		output("\n\n<i>“Ohh...”</i> she giggles, still clutching onto your dick, <i>“...Is this what you f-felt? It’s warm...”</i>");
		output("\n\nYou nod, reveling in the relief of shooting what feels like gallons of bunny-spunk right back into its source. This time, you get to watch her balls bloat. She’s lucky she already yanked her underthings to the side, giving her fuzzy sack the room it needs to expand. Two squirts have her packing grapefruits. Soon, Nayna’s bloated testes are the size of basketballs. The stuffed laquine sinks to her knees, letting them rest on her thighs, but your dick bends right down with her, continuing to flood her over-gorged, melon-sized gonads.");
		output("\n\nNayna whimpers, <i>“So full,”</i> when her balls spill out over the tops of her legs, pinning her to the ground. They expand upward as well, reaching up around either side of your dick, pinning you between the hermaphrodite’s luscious lower orbs. When you ejaculate, you feel them wobble against you, enhancing your pleasure. Your every shot results in what feels like a self-propelled titty fuck, squeezing Nayna’s tremendous nuts tighter around your incredible girth.");
		output("\n\nIt’s heaven. Giggling madly, you hump, and you pump, and you cum and cum and cum. Nayna doesn’t protest; she just groans deliriously, rubbing her nuts with languid, confused strokes. You cum until your balls are almost back to their normal size, and then you cum some more. The harlot of a hare is nearly obscured by her masculine endowments, the tips of her ears barely reaching above. You clench and flex, trying to pump her up enough to hide her entirely, but your body chooses that moment to finally run dry.");
		output("\n\nYour dick twitches powerfully, yanking itself off Nayna’s cock, dripping residual whiteness");
		if(pc.fluidColorSimple(pc.cumType) != "white") output(" and [pc.cumColor] mixed together");
		output(". You can’t see it from here, but it feels like your urethra is absolutely gaped.");
		output("\n\nNayna didn’t fare much better. Her cock is spurting weakly, her much, much, much smaller piss-slit streaming a thin streamer of white. It isn’t coming out in the rhythmic pumps you’d expect from orgasm, just a long, smooth stream, like there’s simply too much sperm for her body to contain. She can’t even reach her dick over the swollen masses of her balls. Meekly, she begs, <i>“Help! It’s so good, but it won’t come out!”</i>");
		output("\n\nDo you help?");
		processTime(15);
		pc.orgasm();
		clearMenu();
		addButton(0,"Help",helpNaynaWithBallflation,undefined,"Help","Help Nayna vent all that backed-up spooge.");
		addButton(1,"Don’t",dontHelpNaynaWithBallflation,undefined,"Don’t","Don’t help. It looks like she’s enjoying it, and the cum will clearly squirt out on its own... in time.");
	}
	//No balls
	else
	{
		output("\n\nNayna is an endless fountain of cum, but your body is a very finite container. No matter how good the friction and the internal stretching may feel, you’re starting to feel very, very full. Without any way to vent, the pressure builds. Nayna seems oblivious to it, clutching onto your rod while the pressure rises, the seal of her flaring dicktip not giving in the slightest. She moans and squeals, rolling her eyes back with every fervid ejaculation.");
		output("\n\nIt hurts, now. Pain mixes with the pleasure. You need to cum, the urge swells through you with each enormous line of bunny-spunk that batters back your own. It’s compressing and twisting around inside of you, squeezing, and your muscles are clenching, and then you’re cumming. Oh stars, you’re cumming! You’re cumming so hard, but nothing is coming out!");
		output("\n\nYou violently rock your hips, thrusting hard enough to make Nayna stumble. The poor bunny tumbles to the ground, and when her fattened phallus pops free, a tide of white");
		if(pc.fluidColorSimple(pc.cumType) != "white") output(" and [pc.cumColor]");
		output(" erupts out of your distended dick-slit. The mixed ejaculate smacks into Nayna with near-bruising force, pushing her several inches across the floor. She’s white-washed in an instant. If it wasn’t for her dick still spraying into the air like a broken sprinkler, she’d look like a ghost.");
		output("\n\nYou jack your member, milking out the excess spooge. It flows out like a waterfall, every single drop feeling like a gallon of relief to your poor, ballooned prostate. Nayna’s pleasure gives out long before your own, but even when her dick goes limp, she lays below you, rubbing fresh cum into her fur with every spurt. Her soft-padded toes cradle the underside of your spasming dick until you finish. Then she gives a few playful squeezes, just to be sure.");
		output("\n\n<i>“You know,”</i> the lusty laquine offers, wiping strings of jism out of her eye, <i>“I guess those rim-ward sluts know what they’re doing.”</i> She stumbles up to her feet, summoning her cleaning robot to take care of the excessive sex-juice. <i>“Maybe with ");
		if(pc.balls == 1) output("more than one nut");
		else output("some testes");
		output(", there’d be somewhere to store all the fluid. That could help with the pressure fluctuations.”</i>");
		output("\n\nIt looks like she’s back to being a scientist once more, but maybe she’s right.");
		processTime(17);
		pc.orgasm();
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
}

//Dont
public function dontHelpNaynaWithBallflation():void
{
	clearOutput();
	showNayna(true);
	output("You shake your head and grin, heading for the stairs. <i>“Consider it a break from your work. We both know you’ll love feeling that cum sliding out of you for hours.”</i>");
	output("\n\nNayna whimpers, but doesn’t disagree. You do see the tips of her fingers cradling those massive nuts, gently rubbing them. <i>“Y-you’re not wrong!”</i>");
	processTime(1);
	clearMenu();
	addButton(0,"Next",move,rooms[currentLocation].outExit);
}

//Help
public function helpNaynaWithBallflation():void
{
	clearOutput();
	showNayna(true);
	output("Grinning, you kneel down and take her dick in both hands, stroking it. When you pump down, the flow doubles. When you stroke up, its owner moans, balls quivering, and the next downstroke is nearly four times as thick as the first. Nayna’s balls gradually diminish while you milk her, but her cum gets absolutely everywhere: ");
	pc.applyCumSoaked();
	if(pc.hasHair()) output("in your [pc.hairNoun]");
	else output("on your head");
	output(", in your mouth, on your [pc.chest], and all over your arms from the elbows down.");
	output("\n\nIt’s a messy task - one that takes the better part of an hour, but somebody has to do it.");
	if(pc.isBimbo()) output(" Somebody that absolutely loves sneaking tastes of the product every chance [pc.heShe] gets.");
	output(" By the time you finish, you’re halfway to hard again, but Nayna looks absolutely, completely relieved - if a bit exhausted. She lays there, letting her little cleaning robot zap the spunk out of her fur and panting for her breath.");
	output("\n\n<i>“You... you were right. That was fun.”</i> Shuddering, the bunny tries to tuck herself back into her clothes, wincing when the tightness squeezes another jet of white from balls that look a little bigger than she should be. <i>“F-f-fuuuuck.”</i> Nayna’s ears go flat when she realizes what she’s said, but with a slight shudder, she looks back your way. <i>“This doesn’t mean I’m a slut.”</i> She pauses. <i>“Not a total one anyway. Those dick-girls on the rim know what they’re doing.”</i>");
	processTime(20);
	pc.changeLust(15);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[No] - Dont Let Nayna Cum In Dick
public function makeNaynaCumOutsideAfterHyperFun():void
{
	clearOutput();
	showNayna(true);
	var x:int = pc.biggestCockIndex();
	output("Shaking your head, you answer, <i>“Rub it out on me instead!”</i>");
	output("\n\nNayna moans in orgasmic bliss, pulling out not a moment too soon, already spilling a river of salty cream against your [pc.cockHead " + x + "]. She grabs hold with both hands in an attempt to wrangle her rebelliously erupting phallus, yet only succeeds in pleasuring herself further. Thrusting through her palms hard enough to bend her spine almost double, Nayna whimpers, fling long ropes across your [pc.cock " + x + "].");
	output("\n\nThey land in cross-crossing, patternless stripes, splattering flecks of the bunny’s cream from your [pc.sheathOrKnot " + x + "] to your apex and everywhere in between. In a matter of seconds, you’re glazed in her salty release. The feverish, oozing warmth feels good, but mostly it reminds you of just how much you need to get off yourself.");
	output("\n\nYou grab on, two-handed, and start jacking it, watching the laquine erupt. She’s squirting and squirting, stumbling up so that she can rub against the top side of your prick. Her cum is the perfect lube, just warm and slick enough to make every touch, every caress feel like the silkiest sextoy. Stroking with both hands is... quite frankly, it’s too much. Thick flows of Nayna’s pre-cum pour out of you as your [pc.cock " + x + "] flexes in climax, making way for the thick spunk behind.");
	output("\n\n<i>“Cum on me!”</i> Nayna cries, still squirting. <i>“Paint me like a filthy fucking slut!”</i>");
	output("\n\nYou thrust forward, unable to repress it, grinding your dick against her, squirting your [pc.cum] over her latex-like underthings and fur alike.");
	if(pc.cumQ() >= 90000) output(" The spermy deluge washes over in her volume enough to stand up to Nayna’s own. You each paint the other, silently competing to see who can make the bigger mess, neither giving an inch until you’re both absolutely drenched and standing in an ankle-deep lake of the stuff.");
	else if(pc.cumQ() >= 1000) output(" The spermy spray washes over her thick enough to paint her [pc.cumColor], though the flows are nowhere near as voluminous as Nayna’s own. You do your damnedest to give her exactly what she wishes for, and by the time you finish, she looks every bit the cum-addicted spunk-slut.");
	else output(" The spermy ropes splatter wetly against her, layering her in your cummy prize. She moans with every drop that hits her, and by the time you finish, she collapses on the ground under the weight of her own bliss, firing bunny-cum up into the air to rain over face.");
	output("\n\nYou slump back against one of the consoles and wipe a little excess laquine seed from your [pc.belly]. Nayna is still writhing, still drooling jism for a few moments, but her cleaning robot has already made an appearance, vaporizing the leftover sex-juices wherever it can find them, even on your body.");
	output("\n\nA couple minutes later, she’s freshening up, still a little dizzy and giddy. <i>“M-maybe those rim sluts know what they’re doing after all. You sure fuckin’ do.”</i> Nayna wraps you up in a warm, fluffy hug. <i>“M-maybe next time I could ejaculate inside.”</i> There’s a pregnant pause. <i>“Surely a member of such... enormous size could handle one little orgasm...”</i>");
	processTime(20);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}