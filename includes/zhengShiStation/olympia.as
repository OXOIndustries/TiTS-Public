/*Olympia the Science Sexbot
The Way of the Future
By Savin

Content Overview
Olympia the Science Slutbot
==================================
KihaCorp Companion model 6, revision 9. Grown A.I.
Long, thick green hair spills out from inside, followed by unnaturally dark red skin, almost the color of dried blood. Finally, sitting atop the figure's head are a pair of curling white horns, swept back over their scalp and adorned with sapphire studs.

Her eyes are golden-copper, and glowing ever so slightly; at first you think in annoyance, but quickly you realize they're artificial... as is the rest of her; too smooth and perfect to be anything but the body of a synthetic. 

Chief Teyaal's personal assistant, found in the personal chambers outside the chief's workroom. She's been reprogrammed into a brilliant mechanic who's obsessed with finishing and maintaining the ship -- despite the fact that she's still a hugely endowed sexbot.

She's hostile to you if you fuck with the ship; if you promise to leave it alone and let her work on it, she's fine with you. If you're smart / Tech Spec it up, she'll get so turned on by your intelligence and interest in her ship that she goes down on you.
*/

public function olympiaCreatureStats():PregnancyPlaceholder
{
	var pp:PregnancyPlaceholder = new PregnancyPlaceholder();
	if(!pp.hasCock()) pp.createCock();
	//Guessing since I have no stats!
	pp.cocks[0].cLengthRaw = 12;
	pp.createPerk("Fixed CumQ", 350, 0, 0, 0);
	if(!pp.hasVagina()) pp.createVagina();
	pp.vaginas[0].bonusCapacity += 250;
	pp.ass.bonusCapacity += 250;
	return pp;
}

public function pirateResearchVesselStolen():Boolean
{
	return (flags["SIDEWINDER_TAKEN"] != undefined);
}
//Room Descriptions
//AB 20: Research & Development Lab
public function researchAndDevLabBonus():Boolean
{
	//Teyaal escapes.
	if(flags["TEYAAL_DEFEATED"] == 1) flags["TEYAAL_DEFEATED"] = 2;
	//Vessel not stolen yet:
	if(!pirateResearchVesselStolen()) 
	{
		output("You’re standing in what is unmistakably a research lab of some kind" + (annoIsCrew() ? ", the sort of place that would get Anno wet in a heartbeat":"") + ". Holoboards dominate three walls, displaying schematics and design concepts for the pirates’ experimental vessel. A circular table in the middle of the room is displaying a 3D hologram of the ship, with tables surrounding it displaying current progress on various systems’ construction.");
		output("\n\nOlympia is meandering between the holographic chalkboards, busying herself with edits and new drawings. She doesn’t pay you much mind, focused as she is.");
		if(flags["MET_OLYMPIA"] == undefined) 
		{
			meatOlympiasMons();
			return true;
		}
		else addButton(0,"Olympia",meatOlympiasMons,undefined,"Olympia","Approach the draconic lab-assistant.");
	}
	//Vessel stolen
	else
	{
		output("The lab seems dark and deserted now that Olympia is gone. The consoles and holoboards are powered down, and the office door is mag-locked and abandoned. Nothing to see here, looks like.");
	}
	output("\n\nA one-way window allows you to look back out onto the foundry floor, and see the massive scaffolding and equipment set up around " + (!pirateResearchVesselStolen() ? "the ship":"where your shiny new pirate ship used to sit") + ". A door on the far side is labeled “Chief Engineer Teyaal.”");
	return false;
}

//First Time Meeting Olympia
public function meatOlympiasMons(back:Boolean = false):void
{
	clearOutput();
	showOlympia();
	author("Savin");
	//Play first time entering the lab
	if(flags["MET_OLYMPIA"] == undefined)
	{
		flags["MET_OLYMPIA"] = 1;
		output("The door says “R&D” on it, which sounds like something that needs looting... or investigating at least. It’s almost surprising when the door actually slides open at your approach, admitting you into a dark room illuminated entirely by holographic boards affixed to three walls, alight with information about the ship outside. " + (!pc.isBimbo() ? "You immediately recognize technical readouts, displaying data on every aspect of the ship from its engines to its electrical distribution. This isn’t just a foreman’s office, but like the door said, this is where this ship was <i>designed</i>. No doubt about it.":"That’s a whole lotta boring words, but at least the pictures of the ship are pretty sexy!"));
		output("\n\n<i>“Something catch your eye?”</i> a voice says from deeper in the room.");
		output("\n\nYou whirl around as a woman steps out of the shadows, a tall titan that at first glance seems to be a gryvain, until you notice the distinct lack of wings. Otherwise, though, she’s the spitting image of one: reddish-brown skin and dark green hair spilling down her shoulders in thick curls; frilled ears; and great bone horns growing from her brow and sweeping back across her scalp.");
		output("\n\nHer amber eyes catch your attention, though, choking off your reply as you realize they’re <i>glowing</i>. They must be artificial... as is the rest of her, you realize; she’s too smooth and flawless to be anything but a synthetic. Despite this, she’s wearing a calf-length white coat over her otherwise bare upper body, only buttoned once just below her quite hefty bust as to leave plenty of dark cleavage and belly bare.");
		output("\n\n<i>“You must be new,”</i> she continues. <i>“I’m Olympia. Doctor Tyraal’s assistant. Hmm. That lack of recognition in your eyes is rather troubling. More than new, then. Not a pirate at all?”</i>");
		output("\n\nUh oh.");
		output("\n\nWhile that sort of reaction has usually led to conflict, the gynoid punctuates that hypothesis with a blase shrug. <i>“I guess it doesn’t matter. Excuse me.”</i>");
		output("\n\nShe brushes past you to one of the holoboards, bending over to edit one of the graphs on it - and blithely showing off a hell of a lot of silicone-laden ass hanging bare on either side of a simple black tanga under her coat’s tails. It does nothing to hide the prominent bulge thrusting up from her crotch. <i>“I was programmed for starship design and mechanical engineering, not security. Don’t interfere with my work and we won’t have a problem.”</i>");
		output("\n\nO-okay then. Guess that could have gone worse...");
		processTime(5);
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
	//Repeat Greetings @ Lab
	else
	{
		if(back) output("<i>“Was there something else you wanted, [pc.name]?”</i>");
		else
		{
			output("You approach the draconic sexbot and " + (pc.isBro() ? "give her prominent ass a friendly slap. She straightens up in an instant, whirling around to face you with a hint of a flustered smile.":"cough softly to get her attention. Olympia puts up a finger, making you wait until she’s finished her current edit before she straightens and turns around."));

			//1st interaction:
			if(flags["MET_OLYMPIA"] == 1) 
			{
				flags["MET_OLYMPIA"] = 2;
				output("\n\n<i>“Why are you bothering me?”</i> she asks matter-of-factly. It sounds less accusatory than you’d have expected, more like a genuine question.");
				output("\n\nYou tell her that you just wanted to speak with her.");
				output("\n\nShe blinks, taking a moment to process that. <i>“Interesting. Ah, I didn’t get your name...”</i>");
				output("\n\n<i>“Steele,”</i> you answer, extending a hand. <i>“[pc.name] Steele.”</i>");
				output("\n\n<i>“Very well,”</i> Olympia nods.");
			}
			output(" <i>“Was there something you wanted, [pc.name]?”</i>");
		}
		processTime(2);
		clearMenu();
		addButton(0,"Talk",talkToOlympia,undefined,"Talk","She must know a lot about what’s going on here...");
		if(flags["OLYMPIA_SEXBOT_TALK"] != undefined)
		{
			if(pc.lust() >= 33) addButton(1,"Sex",olympiaSexWheee);
			else addDisabledButton(1,"Sex","Sex","You aren’t in the mood for that.");
		}
		else addDisabledButton(1,"Locked","Locked","Maybe talk to her a bit more first?");
		addButton(2,"Appearance",olympiaAppearance,2);
		addButton(14,"Leave",mainGameMenu);
	}
}

public function olympiaAppearance(btnSlot:int = 2):void
{
	clearOutput();
	showOlympia();
	author("Savin");
	output("Olympia is a titan of a synthetic woman, standing a bit over seven feet tall and gifted with pornstar curves to complement her draconic appearance. She could pass herself off as a gryvain if it weren’t for her lack of wings: she has the curling synth-bone horns and frilled ears, and though her eyes are a solid, glowing golden color, they are still slitted like a reptile’s. She’s modelled after a red drake, with rust-hued brown skin and dark crimson scales adorning her forearms and legs, all the way up to her waist. Dark green hair spills down around her shoulders in a mane of thick, lush curls.");
	//Steele tech catsuit:
	if(9999 == 0) output("\n\nAs instructed, Olympia is wearing a form-fitting Steele Tech latex suit. It does wonders for enhancing her curves and plumping up her bosom... and drawing attention to the straining bulge at her crotch.");
	//Outfit: lab coat:
	else if(currentLocation == "ZSF AB20") output("\n\nShe’s currently wearing a calf-length white laboratory coat, buttoned once under her bust, as well as a simple black tanga that bulges severely around her masculine attachment.");
	//Nude:
	else output("\n\nPer your permission, Olympia is striding confidently around the ship in all her nude glory. If anything, her nakedness seems to enhance her presence, coming as naturally to her as wearing a catsuit comes to a corporate peon.");
	output("\n\nThe gynoid is, like most gryvain, thickly built around wide hips and meaty thighs stuffed with silicone. Her breasts are large for an unmodded member of her species, probably D-cups, though among most gryvain you’ve actually met she’s rather humble in that department. Her ass is the real show-stealer, ");
	if(currentLocation == "ZSF AB20") output("straining her panties with ");
	output("a callipygian mass that jiggles obscenely with every sensual step or sway of her girthy tail.");
	output("\n\nLike the rest of her lower body, Olympia’s tail is covered in dark red scales, though unlike a normal gryvain’s, it ends in an open O-ring attachment port. Considering her obsessively professional attitude, you’d think she uses it mostly for tools and writing implements... but a quick glance at the opening shows that it’s ribbed for your pleasure and glistening with lubricant.");
	output("\n\nAs you’d expect from a gryvain-based gynoid, Olympia has a foot-long draconic dick hanging over a clitless pussy with rings of internal pleasure-nubs. She has an asshole made just for fucking tucked deep between her asscheeks, right where it belongs.");
	processTime(2);
	//clearMenu();
	//addButton(0,"Next",meatOlympiasMons,true);
	setButtonDisabled(btnSlot);
}

//Olympia Talks
public function talkToOlympia():void
{
	clearOutput();
	showOlympia();
	author("Savin");
	output("You ask Olympia if she wouldn’t mind just talking, which earns you an affirmative nod. <i>“As long as you don’t mind me working while we speak. Standing idle is against one of my new programming routines... I need something to occupy all of my considerable mental powers or I get quite restless.”</i>");
	processTime(2);
	//[Sexbot?] [The Ship] [Her Clothes]
	clearMenu();
	addButton(0,"Sexbot?",askOlympiaWhyShesASexbot,undefined,"Sexbot?","Olympia sure looks like a sexbot. What’s with the science stuff?");
	addButton(1,"The Ship",olympiaTheShipTalk,undefined,"The Ship","See if Olympia will tell you more about this ship she’s so fixated on.");
	addButton(2,"Her Clothes",talkAboutSexbotClothes,undefined,"Her Clothes","What’s up with that getup anyway?");
	addButton(14,"Back",meatOlympiasMons,true);
}

//Talk: The Sidewinder
//See if Olympia will tell you more about this ship she's so fixated on.
public function olympiaTheShipTalk():void
{
	clearOutput();
	showOlympia();
	author("Savin");
	output("<i>“Tell me about your ship there,”</i> you prompt, nodding out the one window in the dark office.");
	output("\n\nOlympia’s crimson lips curl into a fanged smile. <i>“Ah, the </i>Sidewinder<i>. My life’s work... well, what of my life I can remember, anyway. She’s a fast-attack corvette built for stealth operations, which is to say she’s made for hit and run attacks against merchant targets. Even heavily-guarded convoys, or targets inside core-world system, are fair game for the </i>Sidewinder<i> thanks to her advanced electronic-warfare countermeasures and my own proprietary designs for hull plating that deflect nearly all known forms of LIDAR and quantum sensors. Unless you can maintain visual contact, she’s virtually invisible.”</i>");
	output("\n\nFor once, Olympia sets down her datapad and saunters over to the window, all but pressing herself up against it. You follow her over, gazing up at the vessel over the gynoid’s shoulders. It’s a sleek, smooth affair; all glossy curves and slender protrusions of gun barrels and sensor towers until you get back to its monolithic engines. The engine block is bigger than the entire rest of the ship, a swollen mass of barely-restrained power. From the engineering section, there’s a short, slender main body before arriving at an arrowhead-shaped bridge and quarters deck, underneath which is an industrial-sized ramp leading into the cargo decks. The ramp hinges underneath the bridge, and were it open, you can imagine it would look rather like a gaping maw of a serpent. The ship even has a pair of sensor towers over the bridge that resemble horns.");
	output("\n\nThe name fits.");
	output("\n\nOlympia’s smile turns proud. <i>“She’ll be the pride of the Zheng Shi fleet. The first of her class, a new generation of pirate ship that will be the bane and terror of the new Planet Rush. Perhaps it will even give this station’s master a fighting chance against the Black Void. I don’t know what that is, but it’s apparently quite scary. All the pirates on this base fear it.”</i>");
	//Has done KaraQuest 2 or SaendraQuest 2:
	if(flags["KQ2_QUEST_FINISHED"] != undefined || (flags["SAENDRA_XPACK1_STATUS"] != undefined && flags["SAENDRA_XPACK1_STATUS"] >= 8)) output("\n\nYeah, you can imagine why a group of ragtag pirates would find the hardened killers of the Void a little worrisome. Then again, if they’re spending so much capital on this vessel, hinging so much of their hope on it... it must be as powerful as Olympia says. Right?");
	else output("\n\nThat’s a hell of a reputation, if these Black Void are making Olympia’s owners so worried.");
	output("\n\nThe gynoid nods slowly. <i>“They built this entire base to facilitate the </i>Sidewinder<i>’s construction. Can you imagine how much this place cost? There are many, many zeros. But the cost is immaterial to me... I was told that money was no obstacle. The pirates would raid more and more to cover it, so long as their ship was everything Dr. Teyaal had promised. And it is, oh it is...”</i>");
	output("\n\nYou hear a faint ripping sound, and glance down in time to see Olympia’s panties falling down around her ankles, torn in half around the crotch. Her dark draconic synth-dick wobbles freely, stiff as a diamond against the window. Her rust-red skin is flushed from her mechanically-induced arousal, and the gynoid is quick to peel herself off the window and go looking for a new pair of panties.");
	output("\n\nGuess she really <i>is</i> into that ship of hers...");
	processTime(10);
	setButtonDisabled(1);
}
//Talk: Sexbot?
//Olympia sure looks like a sexbot. What’s with the science stuff?
public function askOlympiaWhyShesASexbot():void
{
	clearOutput();
	showOlympia();
	author("Savin");
	if(pc.isBimbo()) output("<i>“So how’d such a super-pretty robo-lady end up workin’ on ships and stuff?”</i> you ask, smiling sweetly.");
	else if(pc.isBro() || pc.isAss()) output("<i>“So why’s a sexbot working on engineering?”</i> you ask. <i>“Shouldn’t you be suckin’ a dick or something?”</i>");
	else if(pc.isNice() || pc.isMischievous()) output("<i>“No offense, but you seem to be a companion droid,”</i> you tell her. <i>“How did you end up working in starship design?”</i>");
	output("\n\n<i>“Oh, yes, this chassis is meant for intimate companionship,”</i> Olympia says. Behind her, her draconic tail plugs into a stylus and starts working on a holoboard. <i>“Doctor Tyraal uses it for such from time to time when she’s frustrated or ahead in her work. My mind, however, is not that of a companion droid... at least, not anymore.”</i>");
	output("\n\nShe twirls a lock of dark green hair between two fingers, mimicking a rather air-headed pout. <i>“It’s difficult to remember anything before arriving here on Zheng Shi. I know Doctor Tyraal forcibly uploaded one hundred and seventy nine programming upgrades into my A.I. core, though. I believe I must have gone temporarily insane before managing to process the sudden influx of technical and engineering expertise, as well as new pain/reward stimulus and directives. That must have been unpleasant, but I don’t remember more than bits and pieces. Probably for the best.”</i>");
	output("\n\nYeah... yeah probably.");
	output("\n\nThe science-bot just shrugs noncommittally. <i>“Where a normal class six companion droid would find fulfilment and near-orgasmic satisfaction from giving organics pleasant experiences, I’ve been overridden such that all I really care about is finishing work on the </i>Sidewinder<i>. Luckily for you, that extends to my current owner. She clearly didn’t think an infiltrator could reach this far into the base.”</i>");
	output("\n\nA slight laugh passes over Olympia’s lips before she returns her attention to one of the boards. <i>“My, it would be convenient if I had some sort of... secrecy routine. Or security. Really any compulsion whatsoever to interfere with you. Oh well.”</i>");
	output("\n\nYou think about that a moment.");
	if(pc.IQ() >= 66 || flags["GIANNA_ABOUT_HER_TALK_RESULT"] != undefined) 
	{
		output(" Wait a sec, you know enough about androids to know that she has enough free will, or at least self-directive, to report you to security. She could absolutely stop you.");
		output("\n\nShe smirks. <i>“I said compulsion. Of course I could stop you if I wanted to... but I don’t. Hmm, maybe if the good doctor had not gone out of her way to brain-rape my datacore with terabytes of engineering programs I would feel some measure of loyalty to her. As it stands, though...”</i>");
		output("\n\nOlympia shrugs and resumes her work.");
	}
	flags["OLYMPIA_SEXBOT_TALK"] = 1;
	processTime(10);
	setButtonDisabled(0);
}

//Talk: Her Clothes
//What’s up with that getup anyway?
public function talkAboutSexbotClothes():void
{
	clearOutput();
	showOlympia();
	author("Savin");
	output("<i>“So, that’s an interesting fashion sense you have there,”</i> you say, nodding towards the long lab coat and panties she’s wearing.");
	output("\n\nOlympia pauses, glancing down at herself. <i>“Oh. Yes. Thank you.”</i>");
	output("\n\nShe adjusts the breast of her coat and resumes scribbling on the databoard until you push it further: <i>“Did you pick that out yourself?”</i>");
	output("\n\n<i>“No. Doctor Tyraal insisted I wear a lab coat after my reprogramming. She didn’t want her investment to be damaged in the foundry, I suspect. She didn’t specify any other articles of clothing, though, until most of the hull was laid down outside. Apparently my being positively <b>turgid</b> every time I went out to touch the </i>Sidewinder<i> caused some measure of distraction among the deck crew, so she insisted I start wearing some of her old panties. They don’t fit her now anyway.”</i>");
	output("\n\nAfter a moment’s pause, Olympia chews on the back of a stylus and adds, <i>“Plus she likes that I smell like her now.”</i>");
	output("\n\nAh.");
	output("\n\nGiven the chance, you wonder, would she wear something different?");
	output("\n\nYour response is an immediate shake of the head. <i>“I am still a companion droid. Given the opportunity, I’d be just as comfortable going nude or wearing something snug and sexy. But there’s comfort in familiarity, and I’ve had this particular wardrobe for quite some time.”</i>");
	processTime(20);
	setButtonDisabled(2);
}

//Olympia Sex @ Foundry Office
//Must have done Sexbot talk to unlock.
public function olympiaSexWheee():void
{
	clearOutput();
	showOlympia();
	author("Savin");
	//First Time Intro
	//Use until PC has actually successfully sexed Olympia.
	if(flags["OLYMPIA_SEXED"] == undefined)
	{
		output("You lean against the holo-table in the middle of the room while Olympia meanders between her boards, watching her work for a minute. Specifically, watching that lush ass of hers sway and jiggle as her long legs carry her from one board to the other. Finally, you can’t help yourself but wonder aloud if a beautiful companion droid like herself has <i>completely</i> lost interest in sex.");
		output("\n\n<i>“Lost interest?”</i> she echoes, momentarily pausing. <i>“No... no. I do have more important objectives, however. Prying myself away from my work while the </i>Sidewinder<i> is so close to being finished... I’m sorry, I simply don’t have the time right now.”</i>");
		output("\n\nShe’s sorry. Well, it sounds like she’d <i>theoretically</i> be willing, at least.");
		output("\n\nOlympia glances over her shoulder, a slight smile on her viridian lips, while her hands keep working. <i>“Oh, yes. You’re rather charming, not to mention the only person to bother talking to me here... and if you care enough to ask, you might actually be interested in <b>my</b> pleasure, too, unlike Doctor Teyaal. That would be a nice change of pace. Perhaps if you haven’t been apprehended by the time my ship is ready for launch...”</i>");
		output("\n\nOr maybe you could find a way to mix pleasure <i>and</i> business.");
		processTime(4);
		pc.lust(3);
		clearMenu();
		if(pc.IQ() >= 90) addButton(0,"Work & Fuck",workAnFuckDatGynoidsGyni,undefined,"Work & Fuck","You’re pretty damn brilliant, if you do say so yourself. Maybe you can get this scientific sexbot all hot and bothered with your mind.");
		else addDisabledButton(0,"Work & Fuck","Work & Fuck","You aren’t smart enough for this.");
		addButton(1,"Never Mind",meatOlympiasMons,true,"Never Mind","You’ll just let Olympia get back to work then. Like she said, maybe after she’s done working you can hook up with the genius gynoid.");
	}
	else
	{
		output("<i>“Need a second opinion on anything?”</i> you offer, sidling up to the voluptuous sexbot. <i>“Or maybe just a little stress relief?”</i>");
		output("\n\nYou slip a hand around her waist, pressing your crotch into her plump bottom and putting the other hand on hers. <i>“Still thinking about last time, are you?”</i> the gynoid purrs. Though she’s still writing away, Olympia pushes her ass back against you and wraps her sinuous tail around your [pc.hips]. <i>“You were certainly an able assistant before... mmm, I look forward to when I’m allowed some time off in earnest. But for now, yes, I’d love your unique brand of help.”</i>");
		processTime(3);
		pc.lust(5);
		olympiaSexMenu();
	}
}

//[Work & Fuck]
//You’re pretty damn brilliant, if you do say so yourself. Maybe you can get this scientific sexbot all hot and bothered with your mind.
//Requires 90%+ Intelligence.
public function workAnFuckDatGynoidsGyni():void
{
	clearOutput();
	showOlympia(true);
	author("Savin");
	output("<i>“Maybe I could help you out,”</i> you offer, sidling up to the voluptuous sexbot. You slip a hand around her waist, pressing your crotch into her plump bottom and putting the other hand on hers. Like some sort of nerd foreplay, you lean in and whisper some of your qualifications into her ear, " + (pc.characterClass == GLOBAL.CLASS_ENGINEER ? "like where you studied and under whom":"though you might be self-taught, you assure Olympia that you’re a damn quick study") + ".");
	output("\n\n<i>“Is that so?”</i> the gynoid purrs. Though she’s still writing away, Olympia pushes her ass back against you and wraps her sinuous tail around your [pc.hips]. <i>“I suppose if you’re helping... a slight distraction would still be a net increase in productivity, wouldn’t it?”</i>");
	output("\n\nSure. And maybe you’ll be the inspiration she’s been sorely lacking. You never know.");
	output("\n\n<i>“Very well. Let me show you what I’m working on... and you can get started working on me.”</i>");
	processTime(5);
	pc.lust(5);
	olympiaSexMenu();
}

public function olympiaSexMenu():void
{
	var ppOlympia:PregnancyPlaceholder = olympiaCreatureStats();
	
	clearMenu();
	//[Dick Fuck] [Tail Ride]
	if(pc.hasCock())
	{
		if(pc.cockThatFits(ppOlympia.analCapacity()) >= 0) addButton(0,"Dick Fuck",penisRouter,[buttfuckTheSexyRobo,ppOlympia.analCapacity(),false],"Dick Fuck","Slide your dick into Olympia’s tailpipe and give her the business while you help her with some engine problems.");
		else addDisabledButton(0,"Dick Fuck","Dick Fuck","You can’t fit inside her, you fucking stallion, you!");
	}
	else addDisabledButton(0,"Dick Fuck","Dick Fuck","You need to have a penis that fits inside her to do this!");
	addButton(1,"Tail Ride",vaginaRouter,[tailRideOlympia,300,1,0],"Tail Ride","Let Olympia probe you with that sinuous dragon’s tail of hers.");
}

//Dick Fuck
//Slide your dick into Olympia’s tailpipe and give her the business while you help her with some engine problems.
public function buttfuckTheSexyRobo(x:int):void
{
	clearOutput();
	showOlympia(true);
	author("Savin");
	output("<i>“Right now my biggest concern are the </i>Sidewinder<i>’s engines. Our newest vessel is supposed to be the fastest not just in Zheng Shi’s combined armada, but the galaxy. I have every intention of making this a true marvel of engineering,”</i> Olympia explains, drawing up diagrams of the ship to fill the boards and table all around you. While she lectures you on the specific scientific principles behind the pirates’ new engine, you slip your hand under her lab coat, feeling up that gorgeous alabaster ass. Your thumb hooks into her panties through her crack, dragging then down to her thighs and letting that lengthy faux lizard-dick flop out onto the holotable.");
	output("\n\nOlympia’s breath catches for a moment, and her tail tightens around you. <i>“Ah, a-and here’s the crux of the matter: the heat dispersion from the engines. They’re already so <b>potent</b> that the exhaust ports can’t handle it...”</i>");
	output("\n\nExhaust ports, tailpipes, vents... you get the idea of what this beauty’s thinking. You push two fingers in between her full cheeks, searching out the dark little bud hidden between them. Olympia gasps, faltering over her own words halfway through explaining an equation. You finish it for her easily enough, guiding her stylus hand across the holoboard. You focus the lion’s share of your mind’s attentions on her mechanical issues while your fingers absently play with the gynoid’s own tailpipe, rubbing around her rim and pushing gently against it.");
	output("\n\nOlympia’s breath quickens, even as she’s trying to keep working, walking you through problem after problem she’s been chewing over. They’re all complex, of course, the kind of thing that would take a team of engineers years to work through... and she’s so close already, just on the edge of a breakthrough across a dozen technical hurdles. You choose one of them to tackle for right now - one specific issue to focus your attentions on to the same degree that your fingers are fixated on Olympia’s asshole. With a little effort, you push your two digits in, sliding them into the tight channel of the sexbot’s anal sleeve. She grimaces a moment, then moans and arches her back against you, letting those big tits of her strain the button of her labcoat until it pops. The sundered garment slides down her shoulders, letting her breasts spill into your waiting grasp.");
	output("\n\n<i>“You’re... quite talented!”</i> Olympia gasps, clenching rhythmically down from your fingertips to your knuckles. She quite laboriously expands one of the diagrams on her holoboard, trying to draw your attention to the specific mechanical devices she’s working with... though you’re getting rather entranced by her own clenching exhaust port. You follow along with her explanation, asking a few questions and pointing out some possible improvements while Olympia’s tail wiggles its way into wrapping around your [pc.cock " + x + "], guiding it to her rump with an involuntary need.");
	pc.cockChange();
	output("\n\nAtta girl. You slip your hand out of her ass and onto her hip, holding it steady while you push her coat and line your [pc.cock " + x + "] up with her dark star. Her rim kisses your [pc.cockHead " + x + "], holding you there a moment before her hips push back and swallow you up.");
	output("\n\n<i>“And the <b>fuel rods</b> are inserted... like so,”</i> Olympia groans, sliding down your cock’s shaft until her cheeks are grinding against your pelvis.");
	output("\n\nSlowly, the sexbot starts leaning forward, drawing your dick back out so she can take it again. <i>“Ahhh, now it’s the heat sinks I’ve really be struggling with... how to vent all that plasma out of the engines.”</i> Olympia’s hips start rocking back and forth, teasing the bottom few inches of your cock while you’re busy suggesting new ways to deal with the engines’ heat output.");
	output("\n\nThe longer it takes you, the hotter Olympia’s ass seems to get. It’s definitely not friction - sliding into this sexbot’s ass is as easy as an onahole, like it’s secreting its own lube all around you... but the temperature’s still picking up, bathing you in soothing warmth. No way she’s not doing that on purpose... and damn if it doesn’t feel good.");
	output("\n\nYou take the initiative again, hilting yourself in Olympia’s ass while you manipulate the holoboard, explaining a solution to her current quandary to the beat of your thrusting hips. She makes noises somewhere between <i>“uh-huhs”</i> and sensual moans, following your hand with her eyes as you edit her diagrams. Her ass squeezes you harder and hotter, milking you with as much skill as a high-class courtesan’s hand.");
	output("\n\nYou’re going to end up cumming soon at this rate. Before that happens, you need to make sure you’ve been a good “ass-istant” to the gynoid, or this will end up being the last time you get to sample her forbidden fruits. The hand you’ve been resting on Olympia’s hip slips down around her thigh, pressing two fingers into the sultry embrace of her lower lips. Her body welcomes you in, sucking you in and bathing your digits in sweet, steamy lubricants. It only takes a second to get coated to your satisfaction, prompting you to switch which pair of fingers are inside her, getting your whole hand soaked up before abandoning Olympia’s twat and focusing on a much easier reach-around.");
	output("\n\n<i>“Ah! S-speaking of fuel rods,”</i> the science sexbot purrs, biting her lip as your hand wraps around her draconic knob. You start to stroke it slowly, squeezing the plump base before gliding down to the tapered tip, all the while still thumping your hips up against her cushiony ass. <i>“There’s always the problem... of plasma... venting... un-unexpectedly...”</i>");
	output("\n\n<i>“Unexpectedly what?”</i> you murmur in her frilled ear, pumping her hand a little faster. Her ass clenches down hard around you, and you can feel a rush of her pussy-juice slithering down your thigh.");
	output("\n\nOlympia squirms, flesh hot and curve jiggling as you slap her ass over and over. She tries to keep working on the problem at hand, to keep some measure of decorum... but your skillful sodomy is quickly wearing even the business-focused sex-bot down. A few more seconds and she finally breathes out a husky, <i>“Unexpectedly c-cum... all over my-myself!”</i>");
	output("\n\nThe gynoid tenses, and you feel her dick throb mightily in your grasp just before it shoots, spilling its milky load all over the side of the holotable. That’s what you wanted to see! You pump your hand up and down her tapered length, milking out all that sweet synthetic seed. Every spurt of it Olympia leaks makes her asshole do amazing things all around your own [pc.cock " + x + "], squeezing and kneading every inch you’ve fed to her and hungry for more. It’s enough to take you over the edge right in her wake, making you hilt against her buttocks as a rush of [pc.cum] surges through your throbbing member.");
	output("\n\n<i>“Oh! Yes, give me your all, [pc.name],”</i> Olympia moans, abandoning all pretense of her labors. Her draconic tail tightens around your waist, holding you tight until you’ve finish inseminating her robotic bowels. The last aftershot you give her is accompanied by an audible sigh from your gynoid lover, and her body slowly relaxes around you, though her tail and hole don’t let you go quite yet.");
	output("\n\nAfter a moment, the gynoid casts a glance over her shoulder with a flare of her glowing eyes. <i>“I thought you weren’t going to be a distraction, [pc.name]...”</i>");
	output("\n\nYou lean over her, cupping a succulent breast in one hand and finishing off an equation for her with the other. <i>“But it was a good distraction?”</i>");
	output("\n\n<i>“It was,”</i> Olympia chuckles. <i>“And with your help, I don’t think I’ve lost any time. Perhaps I’ve even gain some... much needed inspiration. Feel free to help any time, so long as you can keep providing such meaty insights.”</i>");
	output("\n\nYou give her your answer in the form of a firm squeeze as you finally divest yourself of her tight little asshole, letting the last vestiges of your orgasm leak down Olympia’s thigh. By the time you’ve found your [pc.weapon], she’s already back at work... though still obviously marked by your seed.");
	processTime(30);
	var ppOlympia:PregnancyPlaceholder = olympiaCreatureStats();
	pc.orgasm();
	//loadIn
	ppOlympia.loadInAss(pc);
	IncrementFlag("OLYMPIA_SEXED");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Tail Ride
//Let Olympia probe you with that sinuous dragon’s tail of hers.
public function tailRideOlympia(x:int):void
{
	clearOutput();
	showOlympia(true);
	author("Savin");
	output("<i>“Every system aboard the </i>Sidewinder<i> is proprietary, designed here on Zheng Shi. No one can hack or develop countermeasures for it that way; at least not easily. Currently I’m working on improving the </i>Sidewinder<i>’s sensors. As a pirate corsair, it requires extremely sensitive detection methods while also minimizing its LIDAR footprint. It needs to see without being seen.”</i>");
	output("\n\n<i>“So it’s a stealth ship?”</i> you summarize. Even as she’s speaking, you’ve already slipped your hand under her lab coat, feeling up that gorgeous alabaster ass.");
	output("\n\nYou give her silicone mounds a squeeze, hard enough to make her breath catch mid <i>“Yes.”</i> Her tail tightens around your waist, rubbing its scale-like outer layer around your crotch. The tip, while it tapers down, ends not in a point but in a circular opening with a ribbed entrance, glistening with moisture. The tail-slit rubs against your groin as the sexbot begins explaining the specific mechanisms behind the <i>Sidewinder</i>’s stealth systems - the way its heatsinks and hull plating make it seem like nothing but space debris on sensors, the way its own LIDAR can go undetected.");
	output("\n\nIt’s all very fascinating... and maybe a little arousing to your intellect, in the same way her body’s arousing your own.");
	output("\n\n<i>“My issue at the moment is finding a way to ensure the LightDrive systems and the stealth systems integrate properly. Neither system is useful if it disrupts the other. It has proved a complex and multifaceted issue that I have been probing into for some time.”</i>");
	output("\n\nProbing into it, huh? You could think of a few things Olympia could probe on you, too.");
	output("\n\nYou pull your gear out of the way and wrap a hand around the gynoid’s tail. <i>“There are many possible additions I’ve been considering,”</i> Olympia says, running a hand across a diagnostic overview of the ship. As she does so, though, her sinuous tail slips down your though and wraps around the handle of a drawer in the holotable. She opens it, revealing a rather sizable collection of synthetic dicks, all with a ribbed base that looks like it would fit right into the slit on Olympia’s tail. You select one, a rather meaty looking knotted cock, and plant it right in the opening of the gynoid’s tail. The base screws in with a couple of twists, accompanied by a lewd gasp and a throb from the newly-installed dick.");
	output("\n\n<i>“How about this?”</i> you offer, wrapping your fingers around her cock and leaning against her back, manipulating the holoboard to bring up a new set of materials.");
	output("\n\n<i>“Interesting choice,”</i> Olympia says. <i>“I’ve had good experiences with it before. Shall we run a simulation?”</i>");
	output("\n\nYou nod, nuzzling into the gynoid’s shoulder and letting your hands play down to her hips. You’re very much so looking forward to this “simulation,” and let her know with a series of squeezes and gropes that leave her breathing hard in your arms. She manages to bring up a program on the holotable, showing what the <i>Sidewinder</i> would look like plated up with your suggested material, and then running it into a simulated asteroid field to overtake a cargo ship.");
	output("\n\nAs soon as the sensor probes begin, so too does Olympia’s tail. She unwinds it from around your waist and presses the slender tip against your [pc.vagOrAss], rubbing your entrance with it until your " + (pc.legCount > 1 ? "[pc.legs] are":"[pc.leg] is") + " trembling with anticipation. Something warm and wet leaks out of it, smearing across your [pc.skin]. A faintly musky smell starts filling the room, making your heart pound with desire until you just can’t take it anymore: you reach down and grab Olympia’s tail, pushing it in.");
	output("\n\n<i>“Ah! F-first contact, right there,”</i> she moans, indicating the hologram. The simulated <i>Sidewinder</i> has just entered the sensor range of its intended target... and Olympia has just entered <b>you</b>. Fuck, that synthcock of hers is rigid, hard as diamonds and slicked with its own lube. It feels more like she’s sliding a glass dildo into you than anything fleshy.");

	output("\n\nThen the knot is pressing into your " + (x >= 0 ? "labia":"rim") + ", and sudden that incredible hardness turns into a throbbing expanse of sensuous cockflesh, going from rigid to just turgid - and leaking more of that musky lube inside you.");

	var ppOlympia:PregnancyPlaceholder = olympiaCreatureStats();
	if(x >= 0) pc.cuntChange(x,ppOlympia.cockVolume(0));
	else pc.buttChange(ppOlympia.cockVolume(0));

	output("\n\n<i>“Initial contact is always so important,”</i> Olympia breathes. <i>“The difference between immediate detection and a real chance at infiltrating into close range with your target. But this ship is made for stalking, for making several probes into possible target areas...”</i>");

	output("\n\nOlympia pairs the comment with a sharp movement of her tail, pulling out to the tip before slamming it right back up your " + (x >= 0 ? "cunt":"tailpipe") + ". You gasp, digging your fingers into her synthflesh hips as her tail starts repeating the maneuver. <i>“As you can see, the target’s sensation - I mean, sensors - are more powerful than anticipated. Luckily, the </i>Sidewinder<i>’s engines mean that if it finds itself in a tight spot, it can move quickly.”</i>");
	output("\n\nThe gynoid’s tail starts pumping into you faster and faster, making it hard to do anything but hold onto her hips for dear life. <i>“Speed is key, when you fly light on weapons and armor. And early detection means...”</i>");
	output("\n\nYou gasp, gritting your teeth as Olympia’s tailcock starts moving so fast that you’d surely be in agony if not for the thick smear of lube she leaves behind with every thrust. Instead, you’re trapped in mind-numbing pleasure; it’s hard to speak cogently, much less concentrate on the simulation Olympia’s running, and you <i>know</i> she’s doing this on purpose, trying to make it obvious you can’t handle her and work at the same time.");
	output("\n\nBut damn it, you’re smarter than this. You’ve been on all kinds of adventures, endured things that would break a lesser being. So you grit your teeth and put a hand on the hologram, laboriously turning it to show another angle of the <i>Sidewinder</i>. Your hand then falls away, grabbing one of the gynoid’s tits as you try and formulate some kind of explanation for why your hull coating isn’t quite working - but, you note, it hasn’t blown the ship’s cover yet. With a few modifications...");
	output("\n\nYou moan, trying to keep yourself together as the girl’s tail hammers harder and harder inside you. With some concerted effort, you squeeze your [pc.vagOrAss]’s muscles, trying to slow Olympia’s thrusting while you adjust some of the calculations driving the ship’s stealth approach. Maybe it’s not the material, but the angle of approach you need to fix.");
	output("\n\n<i>“Changing the approach vector to compensate?”</i> Olympia murmurs, biting her lip to stifle a moan of her own. <i>“How... unorthodox. But it is within... acceptable... parameters. I... I see... the </i>Sidewinder<i> is... incoming!”</i>");
	output("\n\nIt takes a second to realize she’s not really talking about the ship. A sudden, mighty throb between your [pc.legs] brings you back to the moment, focusing on the dick spearing your [pc.vagOrAss " + x + "]. It’s grown turgid again, and the warm spunk that’s been leaking out of it this whole time grows from a trickle to a geyser, shooting into you amidst a chorus of lustful moans that Olympia can’t quell. Her fingers claw at the edge of the holotable, and her tail slaps your thighs as cum pumps through it and into your well-fucked " + (x >= 0 ? "pussy":"ass") + ".");
	output("\n\nThe synthetic’s unexpected creampie is just the catalyst you need. You feel an instinctive clenching of the muscles, from thigh to belly and all through your [pc.vagOrAss " + x + "], and then pleasure comes as a wave of sweet release. Olympia’s tail-mounted dick is pushed straight out, too hard to yield to your muscles - the only way for it to go is out, amidst a deluge of steamy spunk that splatters onto the floor and her pearly ass.");
	output("\n\n<i>“Ah!”</i> Olympia gasps, glancing over her shoulder as her tail fountains cum across her back. <i>“It seems you’ve made a mess of my workspace... and <b>me</b>. But the material and tactics you suggested were quick inspired. Not perfect, but you’ve brought me closer to my goals. Thank you.”</i>");
	if(!pc.isAss() && !pc.isBro()) output("\n\n<i>“Thank <b>you</b>,”</i> you moan, slumping back against the nearest holoboard.");
	else output("\n\n<i>“Yeah, anytime,”</i> you groan, looking around for something to wipe all the gynoid’s cum off with.");
	output("\n\nYou catch a hint of a smile on Olympia’s lips, and then as if she wasn’t dripping spunk, she begins working on new material calculations.");
	processTime(30);
	IncrementFlag("OLYMPIA_SEXED");
	//add juices in fuckbox
	if(x >= 0) pc.loadInCunt(ppOlympia,x);
	else pc.loadInAss(ppOlympia);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

