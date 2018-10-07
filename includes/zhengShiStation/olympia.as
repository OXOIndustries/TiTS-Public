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

public function showOlympia(nude:Boolean = false):void
{
	showName("\nOLYMPIA");
	showBust("OLYMPIA" + (nude ? "_NUDE":""));
}

public function olympiaCreatureStats():PregnancyPlaceholder
{
	var pp:PregnancyPlaceholder = new PregnancyPlaceholder();
	if(!pp.hasCock()) pp.createCock();
	//Guessing since I have no stats!
	pp.cocks[0].cLengthRaw = 12;
	pp.createPerk("Fixed CumQ", 350, 0, 0, 0);
	if(!pp.hasVagina()) pp.createVagina();
	return pp;
}

//Room Descriptions
//AB 20: Research & Development Lab
public function researchAndDevLabBonus():Boolean
{
	//Teyaal escapes.
	if(flags["TEYAAL_DEFEATED"] == 1) flags["TEYAAL_DEFEATED"] = 2;
	//Vessel not stolen yet:
	if(9999 == 9999) 
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
	output("\n\nA one-way window allows you to look back out onto the foundry floor, and see the massive scaffolding and equipment set up around " + (9999 == 9999 ? "the ship":"where your shiny new pirate ship used to sit") + ". A door on the far side is labeled <i>“Chief Engineer Teyaal.”</i>");
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
		output("The door says <i>“R&D”</i> on it, which sounds like something that needs looting... or investigating at least. It’s almost surprising when the door actually slides open at your approach, admitting you into a dark room illuminated entirely by holographic boards affixed to three walls, alight with information about the ship outside. " + (!pc.isBimbo() ? "You immediately recognize technical readouts, displaying data on every aspect of the ship from its engines to its electrical distribution. This isn’t just a foreman’s office, but like the door said, this is where this ship was <i>designed</i>. No doubt about it.":"That’s a whole lotta boring words, but at least the pictures of the ship are pretty sexy!"));
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
				output("\n\n<i>“Very well,”</i> Olympia nods. ");
			}
			output("<i>“Was there something you wanted, [pc.name]?”</i>");
		}
		processTime(2);
		clearMenu();
		addButton(0,"Talk",talkToOlympia,undefined,"Talk","She must know a lot about what’s going on here...");
		if(flags["OLYMPIA_SEXBOT_TALK"] != undefined)
		{
			if(pc.lust() >= 33) addButton(1,"Sex",olympiaSexWheee);
			else addDisabledButton(1,"Sex","Sex","You aren't in the mood for that.");
		}
		else addDisabledButton(1,"Locked","Locked","Maybe talk to her a bit more first?");
		addButton(2,"Appearance",olympiaAppearance);
		addButton(14,"Leave",mainGameMenu);
	}
}

public function olympiaAppearance():void
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
	clearMenu();
	addButton(0,"Next",meatOlympiasMons,true);
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
	addButton(1,"The Ship",olympiaTheShipTalk,undefined,"The Ship","See if Olympia will tell you more about this ship she's so fixated on.");
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
		output("\n\n<i>“Lost interest?”</i> she echoes, momentarily pausing. <i>“No... no. I do have more important objectives, however. Prying myself away from my work while the </i>Sidewinder<i> is so closed to being finished... I’m sorry, I simply don’t have the time right now.”</i>");
		output("\n\nShe’s sorry. Well, it sounds like she’d <i>theoretically</i> be willing, at least.”</i>");
		output("\n\nOlympia glances over her shoulder, a slight smile on her viridian lips, while her hands keep working. <i>“Oh, yes. You’re rather charming, not to mention the only person to bother talking to me here... and if you care enough to ask, you might actually be interested in <b>my</b> pleasure, too, unlike Doctor Teyaal. That would be a nice change of pace. Perhaps if you haven’t been apprehended by the time my ship is ready for launch...”</i>");
		output("\n\nOr maybe you could find a way to mix pleasure <i>and</i> business.");
		processTime(4);
		pc.lust(3);
		clearMenu();
		if(pc.IQ() >= 90) addButton(0,"Work & Fuck",workAnFuckDatGynoidsGyni,undefined,"Work & Fuck","You’re pretty damn brilliant, if you do say so yourself. Maybe you can get this scientific sexbot all hot and bothered with your mind.");
		else addDisabledButton(0,"Work & Fuck","Work & Fuck","You aren’t smart enough for this.");
		addButton(1,"Nevermind",meatOlympiasMons,true,"Nevermind","You’ll just let Olympia get back to work then. Like she said, maybe after she’s done working you can hook up with the genius gynoid.");
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
	output("\n\n<i>“Very well. Let me show you what I’m working on... and you get start working on me.”</i>");
	processTime(5);
	pc.lust(5);
	olympiaSexMenu();
}

public function olympiaSexMenu():void
{
	clearMenu();
	//[Dick Fuck] [Tail Ride]
	if(pc.hasCock())
	{
		if(pc.cockThatFits(olympiaCreatureStats().cockVolume(0)) >= 0) addButton(0,"Dick Fuck",penisRouter,[buttfuckTheSexyRobo,olympiaCreatureStats().cockVolume(0)],"Dick Fuck","");
		else addDisabledButton(0,"Dick Fuck","Dick Fuck","You can't fit inside her, you fucking stallion, you!");
	}
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
	output("\n\nAtta girl. You slip your hand out of her ass and onto her hip, holding it steady while you push her coat and and line your [pc.cock " + x + "] up with her dark star. Her rim kisses your [pc.cockHead " + x + "], holding you there a moment before her hips push back and swallow you up.");
	output("\n\n<i>“And the <b>fuel rods</b> are inserted... like so,”</i> Olympia groans, sliding down your cock’s shaft until her cheeks are grinding against your pelvis.");
	output("\n\nSlowly, the sexbot starts leaning forward, drawing your dick back out so she can take it again. <i>“Ahhh, now it’s the heat sinks I’ve really be struggling with... how to vent all that plasma out of the engines.”</i> Olympia’s hips start rocking back and forth, teasing the bottom few inches of your cock while you’re busy suggesting new ways to deal with the engines’ heat output.");
	output("\n\nThe longer it takes you, the hotter Olympia’s ass seems to get. It’s definitely not friction - sliding into this sexbot’s ass is as easy as an onahole, like it’s secreting its own lube all around you... but the temperature’s still picking up, bathing you in soothing warmth. No way she’s not doing that on purpose... and damn if it doesn’t feel good.");
	output("\n\nYou take the initiative again, hilting yourself in Olympia’s ass while you manipulate the holoboard, explaining a solution to her current quandary to the beat of your thrusting hips. She makes noises somewhere between <i>“uh-huhs”</i> and sensual moans, following your hand with her eyes as you edit her diagrams. Her ass squeezes you harder and hotter, milking you with as much skill as a high-class courtesan’s hand.");
	output("\n\nYou’re going to end up cumming soon at this rate. Before that happens, you need to make sure you’ve been a good <i>“ass-istant”</i> to the gynoid, or this will end up being the last time you get to sample her forbidden fruits. The hand you’ve been resting on Olympia’s hip slips down around her thigh, pressing two fingers into the sultry embrace of her lower lips. Her body welcomes you in, sucking you in and bathing your digits in sweet, steamy lubricants. It only takes a second to get coated to your satisfaction, prompting you to switch which pair of fingers are inside her, getting your whole hand soaked up before abandoning Olympia’s twat and focusing on a much easier reach-around.");
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
	pc.orgasm();
	//loadIn
	olympiaCreatureStats().loadInCunt(pc,0);
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
	output("\n\nYou nod, nuzzling into the gynoid’s shoulder and letting your hands play down to her hips. You’re very much so looking forward to this <i>“simulation,”</i> and let her know with a series of squeezes and gropes that leave her breathing hard in your arms. She manages to bring up a program on the holotable, showing what the <i>Sidewinder</i> would look like plated up with your suggested material, and then running it into a simulated asteroid field to overtake a cargo ship.");
	output("\n\nAs soon as the sensor probes begin, so too does Olympia’s tail. She unwinds it from around your waist and presses the slender tip against your [pc.vagOrAss], rubbing your entrance with it until your " + (pc.legCount > 1 ? "[pc.legs] are":"[pc.leg] is") + " trembling with anticipation. Something warm and wet leaks out of it, smearing across your [pc.skin]. A faintly musky smell starts filling the room, making your heart pound with desire until you just can’t take it anymore: you reach down and grab Olympia’s tail, pushing it in.");
	output("\n\n<i>“Ah! F-first contact, right there,”</i> she moans, indicating the hologram. The simulated <i>Sidewinder</i> has just entered the sensor range of its intended target... and Olympia has just entered <b>you</b>. Fuck, that synthcock of hers is rigid, hard as diamonds and slicked with its own lube. It feels more like she’s sliding a glass dildo into you than anything fleshy.");

	output("\n\nThen the knot is pressing into your " + (x >= 0 ? "labia":"rim") + ", and sudden that incredible hardness turns into a throbbing expanse of sensuous cockflesh, going from rigid to just turgid - and leaking more of that musky lube inside you.");

	if(x >= 0) pc.cuntChange(x,olympiaCreatureStats().cockVolume(0));
	else pc.buttChange(olympiaCreatureStats().cockVolume(0));

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
	else output("\n\n<i>“Yeah, anytime,”</i> you groan, looking around for something to wipe all the gynoid’s cum off with.”</i>");
	output("\n\nYou catch a hint of a smile on Olympia’s lips, and then as if she wasn’t dripping spunk, she begins working on new material calculations.");
	processTime(30);
	IncrementFlag("OLYMPIA_SEXED");
	//add juices in fuckbox
	if(x >= 0) pc.loadInCunt(olympiaCreatureStats(),x);
	else pc.loadInAss(olympiaCreatureStats());
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

/*
//Chief Engineer Teyaal
//Triggers when the player first enters Teyaal’s office.

output("\n\nYou step up to the door labeled <i>“Chief Engineer Teyaal,”</i> reaching for the handle.");

output("\n\n<i>“Careful,”</i> Olympia says from behind you. <i>“My owner isn’t fond of unexpected guests. Especially when we’re so close to our deadline... I don’t know how she’ll react.”</i>");

output("\n\nYou nod and pull the hatch open, stepping through and into a small office - no more than 5 yards to a side, and yet luxuriously adorned with draped silks and cushions all across the floor, surrounding a central work terminal. There’s no chair at it: the room’s sole occupant seems more than happy to lounge on the lacey pillows while she works like some elegant harem-girl. Indeed, the whole room seems like it’s a sultan’s fuck-palace more than a scientist’s office. Guess that’s what the room outside is for.");

output("\n\nThe woman in question is a gryvain, remarkably similar in appearance to Olympia outside, save for the quartet of sprawling wings laid out behind her, and the blue hue of her scales and hair. A white rubber lab coat is wrapped around her shoulders, though that appears to be all she’s wearing, and even that’s only been buttoned once around the midriff, giving you an eyeful of dragon-tits, strung together by a silver chain and studded rings, and the blue cock hanging out between her legs.");

output("\n\n{PC has fought Gryvain Agent: Wow, she... looks very familiar, actually, though you struggle to place where you might have seen her before.}");

output("\n\nA moment passes before the chief engineer looks up from her work, fixing you with her slitted gold eyes.");

output("\n\n<i>“You’re new,”</i> she says flatly, looking you up and down. <i>“No, not new. I’ve gotten reports of an intruder on the station, destabilizing our mining operation. You must be the one. No one else is stupid enough to come barging into my office.”</i>");

output("\n\nThe engineer stands, rising up to an impressive seven feet of height, moving in such a way that her large bust strains against the meager restraint of her lab coat. Her naked dick bobs heavily, swaying between her thick thighs, and her wings spread out behind her - great enough to touch the walls on either side of her office.");

output("\n\n<i>“So,”</i> Teyaal says, putting a hand on her hip. The other has produced a gun from somewhere; you didn’t see it move, but there it is: a sleek, scoped energy pistol, though she’s just holding it at waist level. <i>“What did you come here for, intruder? Here to steal the </i>Sidewinder<i> out from under my nose? I won’t let you take my life’s work away from me. Not when we’re so close to seeing it launch!”</i>");

output("\n\nSo what do you tell her you’re here for?");

output("\n\n[Her Ship] [The Probe] [Sightseeing]");

output("\n\n[Sightseeing]");
output("\n\n//You’re just here to take in the sights, man. Like giant dragon girls with their tits and cocks hanging out.");
output("\n\n//+Mischevious. Start Teyaal with extra Lust.");

output("\n\n<i>“I’m just here to see the sights,”</i> you say, grinning. <i>“And I’ve found a hell of a sight, looks like.”</i>");

output("\n\nTeyaal growls, stretching out her wings. <i>“Is that so? Then let me give you a closer look!”</i>");

output("\n\nYou see her cock throb under her jacket, and then a gust of wind as she beats her wings and readies for battle.");

output("\n\n[The Probe]");
output("\n\n//You’re here to find the Steele Tech probe, nothing more.");

output("\n\n<i>“I’m just here to find a Steele Tech probe,”</i> you tell her. <i>“I find that, and I’m on my way.”</i>");

output("\n\nTeyaal scowls, but her finger moves off the trigger. <i>“That so? Well, it’s not in here. No probes, except mine.”</i>");

output("\n\nShe grabs her dick in her free hand, giving it teasing pump. <i>“Now unless you’re looking to get <b>probed</b>, get the fuck out. I’m too old and too close to being done with this abysmal project to mess around with random corporate lapdogs.”</i>");


output("\n\n<i>“Abysmal?”</i> you echo. <i>“Olympia seems to like it.”</i>");

output("\n\nTeyaal releases her dick and wipes her hand on her coat. <i>“Yeah, of course, she’s liked it for half a year since I rewired her brain to crave its completion like she used to crave cock. She can’t <b>not</b> like it... her programming won’t let her. If she were an organic beating her head against this idiot stealth system for this long, she’d hate it too! Ah, fuck, why am I even talking to you, huh? Do you know how much of a reward there is for you already? I take you down and maybe I can get enough cash to get off this rock. Alright, put ‘em up, scum!”</i>");

output("\n\nUh-oh.");


output("\n\n[Her Ship]");
output("\n\n//Tell her you’re here for her ship. That’ll probably just enrage her.");
output("\n\n//S");

output("\n\n<i>“I’m here to steal your ship,”</i> you tell her, jerking a thumb back the way you came. <i>“I-”</i>");

output("\n\nA plasma bolt whizzes past your head, scoring the bulkhead behind you. Well, that was fast!");

output("\n\nChief Teyaal Boss Fight");

output("\n\nTeyaal is basically a Tech Specialist built along the Shields talent tree: Shield Tweaks/Shield Booster, Enhanced Dampeners, and Shield Regen. She has high Intelligence, Aim, and Reflexes. Low Willpower and general Lust res; okay Physique. She has no armor to speak of, but she’s got Shields out the wazoo.");

output("\n\nShe carries a Heavy Plasma Pistol with stats equivalent to the Apollo Plasma Rifle. When it drops, though, it has the following stats:");

output("\n\nTeyaal’s Heavy Plasmacaster (Plasma Caster)");
output("\n\nA modified plasma pistol, tweaked to do maximum damage at the expense of accuracy - despite the fact that it has a swanky scope bolted onto the top. Presumably this hand cannon was customized by Dr. Teyaal, the chief engineer on Zheng Shi Station. The gun’s almost certainly dangerous to the user if fired for prolonged periods... or if you’re just unlucky. But it will <i>definitely</i> ruin somebody’s day with a couple of well-placed shots.");
output("\n\n33 Burning");
output("\n\n+10 Critical");
output("\n\n-5 Accuracy");
output("\n\nDot (Burn) Chance");


output("\n\nParalyzing Shock");
output("\n\n//Has the Deadly Shock perk added on. Put on a 4-round CD.");
output("\n\n//As per PC ability");

output("\n\nCharge Shield");
output("\n\n//As per PC ability. 1/encounter.");

output("\n\nPlasma Bolt");
output("\n\n//Basic attack. Has a chance to inflict Burning DoT.");
output("\n\nTeyaal wings backwards, planting her feet on the bulkhead and digging her clawed digits in as she squeezes the trigger on her hand cannon. The barrel glows with baleful light before erupting in a stream of argent plasma that {blasts right past you, searing the walls // slams into you with searing force!} {Dot: The burning plasma clings to you, burning horribly!}");

output("\n\nTake Wing!");
output("\n\n//Raise her Evasion for ~3 turns.");

output("\n\nThe gryvain spreads her wings and launches herself backwards, hovering just out of reach. While she might have been slow on the ground, she’s suddenly taken on a grace and speed that seems almost unnatural. <b>She’ll be harder to hit now!</b>");

output("\n\n//Stance ends:");
output("\n\nTeyaal lands on the balls of her feet, momentarily supporting herself with her tail and wings as well - she looks like a feral dragon for that brief second until she regains her proper footing.");


output("\n\nWhen Teyaal’s shields are finally broken for realz, play the following at the start of her turn:");
output("\n\nWith the concussive <i>bang!</i> of her shields buckling, Dr. Teyaal stumbles back, breathing hard. One particularly deep breath causes the button to pop on her jacket, sending it flying as her tits spill out of their confines.");

output("\n\n<i>“Oh, you ignorant slave... or slave-to-be! I will not let you stand between me and greatness! I have been denied my freedom for far too long!”</i>");

output("\n\nShe grabs her tits in both hands, sauntering towards you with fierce determination. A rivulet of milk streams from each of her cobalt nipples, staining her fingers. <i>“I’m going to make you my slave, claim the reward out on you, and ride your face all the way to the stars when this damned ship is done. Get ready for it!”</i>");

output("\n\n//Teyaal now uses Tease attacks instead of Plasma bolts. Continues to use other abilities.");

output("\n\nTease Attack");
output("\n\nTeyaal grabs her tits and gives them a squeeze, causing a trickle of milk to leak from each. Her dick throbs and bobs with the sway of her hips, swinging ropes of lurid precum around her office. <i>“Get used to the sight, my young slave. You’ll be seeing these every day for the rest of your life now!”</i>");

output("\n\n");
output("\n\nPC is Defeated");
output("\n\nYour [pc.weapon] is knocked out of your hand before you know what’s happening, clattering across the office as Teyaal closes the distance between you. Her giant draconic wings sprawl out, pushing you back against one of the bulkheads and blocking out the light. Suddenly you’re trapped between the cold, unyielding wall and a smoldering-hot, sweat-slicked body. Cock and tits press against you, and you feel her nipple chains brushing against your [pc.chest] as her hands dig into your gear, ripping it off of you.");

output("\n\n<i>“It’s been almost two centuries since I’ve had a pleasure slave,”</i> Teyaal breathes. <i>“The time between rushes doesn’t treat us criminals very well. It’s harder to keep what’s yours when civilization’s on the rise. That’s why I love all this chaos of a new rush. All these gungho pirates looking to keep things interesting for me. At least they have that redeeming quality. Now let’s break you in, hmm? You’ve got a long life under me to look forward to... at least until the rush ends.”</i>");

output("\n\nYou hear a guttural sound from within the gryvain’s throat, somewhere between a roar and a moan. Then she shoves you down on your [pc.knees] and turns. There’s a moment of blinding light, just long enough to see Teyaal spin on her heels before she steps back and plants the huge mounds of her asscheeks directly on either side of your face. You gasp; try to scream, but your voice is muffled out in callipygian dragon-booty.");

output("\n\n<i>“Better find your way into a hole. Either one, I’m not picky,”</i> Teyaal growls. You feel her dick on your chin, rubbing against you with every breath. <i>“Get busy.”</i>");

output("\n\nFrom your position, blind and disarmed, you don’t have much choice. You manage to get your hands on her hips, but that only puts them in a position for the doctor to slap what feels like a pair of binders around your wrists. You struggle weakly, pulling your restraints against Teyaal’s thick thighs until she reaches around and gives you a sharp slap on the cheek.");

output("\n\n<i>“Lick!”</i> she commands, pushing her ass down on you harder. <i>“Unless you want your skull crushed?”</i>");

output("\n\nThere are probably worse ways to go than death by callypigian dragon booty, but still, you feel compelled to probe your tongue out in search of some way to preserve yourself in this black, jiggling hell you’ve found yourself in. Eventually, your [pc.tongue] manages to find its way to a soaked slit in the doctor’s otherwise flawless flesh and wriggle your way inside.");

output("\n\nAs you’d expect from a gryvain, the inside of Teyaal’s pussy is a vice of sodden bulges, each one a clitoris demanding your tongue’s attention. The first you touch sends a surge of wetness spilling down your chin, paired with a throb of her draconic cock that sends a river of pre spilling onto your [pc.chest].");

output("\n\n<i>“Oh, yes, right there,”</i> the dragoness moans, batting her wings against the bulkhead. <i>“Worship those clits. Every last one of them...”</i>");

output("\n\nIt’s a tall order: in a few moments you’ve found at least a half-dozen, and the deeper you go, the more concentric rings you find. You lavish each with as much tongue-worship as you can, working until the gryvain’s legs are trembling and she’s leaking from both sexes like a whorish faucet, bathing you in the heady aroma of a dragon in need - a need to breed.");

output("\n\nThe thought clicks in place just as Teyaal cries out, and her pussy squeezes hard around you. Her ass comes crashing down on your face, drowning you in her juices while her cock sprays across the deck. Teyaal’s wings beat furiously, mirroring the throbbing of her dick as it unloads all over you and the floor alike. She’s barely blown the last of her load, though, before the draconic doctor peels her ass off your face and grabs your shoulders. You’re thrown face-down onto the myriad pillows lining the deck, and the wind’s knocked out of you by the titanic mass of dragon-butt landing on you.");

output("\n\n<i>“Ready for round two?”</i> the stacked gryvain growls. <i>“Doesn’t matter, cuz you’ve only whet my appetites!”</i>");

output("\n\nTeyaal grabs your [pc.legs] and spreads ‘em, gleefully shoving her still-leaking cock straight into your [pc.vagOrAss] without so much as testing finger to pave the way. You scream, a shock of pain and pleasure tearing through you from the sudden, violent entry. Teyaal’s hands grip your shoulders, pinning you to the cum-stained deck as her broodmare’s hips start pounding against your [pc.butt], sending shockwaves through your ass-flesh with each savage thrust.");

output("\n\nThe dominant dragon’s tits press into your back, and her claws rake your flesh, holding you like a jealous lover while she tenderizes your ass. Even her wings wrap back around you, bathing you in darkness and warmth. It would almost be sweet, if she weren’t also violently {sodomizing / fucking} you all the while.");

output("\n\nAll you can really do is grit your teeth and bear it, letting the doctor molest you until her turgid draco-cock has had enough of your [pc.vagOrAss]. Feeling the rush of her cum inside you is almost a relief, a hope that the punishment Teyaal is laying on you is almost over.");

output("\n\nIt’s nowhere near over.");

output("\n\n[Next]");

output("\n\n<b>Many, many draconic loads later....</b>");

output("\n\nYour hands hang bound from a hook on the wall, propping you up while you leak your new owner’s jizz down your thighs. That’s the word that sticks in your mind, twice as hard as Teyaal’s dick did: she <i>owns</i> you now. Your weapons and gear are all gone; her sexbot came in and relieved you of them some time ago. You’re nothing but an office ornament now, swaying in the corner awaiting your owner’s pleasure.");

output("\n\nRight now, though, she’s holding a camera over you as a disembodied voice talks over comms, congratulating the dragoness on her victory.");

output("\n\n<i>“Finally caught our intruder, huh? Real pain in the ass [pc.heShe]’s been!”</i> the man laughs. <i>“Normally I’d wanna teach [pc.himHer] a lesson, but I just got a real interesting offer from Steele brat.”</i>");

output("\n\n<i>“Huh? [pc.HeShe]’s mine!”</i> Teyaal hisses. <i>“I caught your damn rat, fair and square!”</i>");

output("\n\n<i>“Sorry, beautiful. You’ll get your cut, don’t you worry. I-”</i>");

output("\n\nTeyaal throws her commpad on the deck and stamps on it, crushing it in a shower of sparks. <i>“Damn that bunny bastard! Enough is enough. Olympia!”</i>");

output("\n\nThe door slides open and the pale sexbot strides in, holding a fresh pad under her chest. <i>“Yes, Doctor Teyaal?”</i>");

output("\n\n<i>“We’re leaving. Get the </i>Sidewinder<i> ready to launch.”</i>");

output("\n\nThere’s a moment of hesitation. <i>“I-it’s not ready yet, Doctor. The prototype hasn’t even made its maiden flight. We need more-”</i>");

output("\n\n<i>“We’re out of time!”</i> Teyaal snaps. <i>“And I am out of patience. Come!”</i>");

output("\n\nShe spins on a heel and grabs your neck, lifting you up off your fuckhook and dragging you behind her. Teyaal and Olympia march out of the office with remarkably little aplomb, crossing over to the drydocked ship and entering with a swipe of Teyaal’s card. You hear some shouting behind you - the same man’s voice as before, running up the gangplank to catch up - but just a little too late. The door slams closed, and you are soon taken to the captain’s quarters, where you’ll spend the rest of your natural life awaiting the sexual desires of your domineering draconic mistress.");

output("\n\n[GAME OVER]");







output("\n\nPC Victory");
output("\n\nTeyaal crashes back into the piles of pillows scattered about her office floor, and the wind goes out of her. Her gun clatters away, and her wings sprawl out on either side - her tits follow suit, flattening against her chest under their own significant weight. She looks up at you with dark eyes full of {lust // terror} after her defeat... and her draconic cock springs up from under her jacket, turgid from the involuntary submission you’ve forced on her.");

output("\n\nSpeaking of jacket: you reach down and snatch the I.D. card off her breast and tuck it into your pack. Teyaal’s only defense is a sedated groan, pawing at your hand until it’s out of reach. Now, what to do with this wicked pirate?");

output("\n\n[Assfuck Her] [Plow Pussy] [Ride Dick] [Leave]");
output("\n\n[Call Olympia]");

output("\n\nAssfuck Her");
output("\n\n//Everyone knows gryvain have six testes around their assholes. Pounding Teyaal’s ass is gonna make a hell of a mess!");
output("\n\n//Requires a cock or strapon.");

output("\n\nTeyaal’s already on her back among the pillows, tits and dick on display like some harem slut. You shuck your gear aside and get down to her level, straddling the defeated dragon-milf’s shoulders and letting your [pc.cockOrStrapon] flop directly onto her chin.");

output("\n\n{Hard: <i>“This is going in your ass,”</i> you inform her coldly. <i>“Your choice if it’s lubed or not.”</i> //Misch or Bimbo: <i>“Better get this ready!”</i> you grin down at her. <i>“Your ass will thank you later.”</i> //Kind: You run a thumb across one of Teyaal’s cobalt-blue lips, and then press your cockhead against them. <i>“Before I fuck you, maybe you want to lube it up?”</i>}");

output("\n\nThe gryvain’s golden eyes fixate on on your dick, slitted pupils widening as she takes it in... and then, with a breathy little moan, she takes it in between her lush blue lips. You watch as her head lunges down your length, swallowing your [pc.cockOrStrapon] in one long go. Her throat bulges and her eyes slowly droop closed, like she’s actually enjoying the taste of her defeat. At least she can lose with grace... but you can’t let her off this easy.");

output("\n\nYou lean down and grab the doctor’s curling dragon-horns, pinning her head back down against the cushions. The tip of your [pc.cockOrStrapon] pops out from between her lips, slicked with saliva and glistening in the office lights. You don’t stop to enjoy the sight, but rather ram your [pc.hips] forward and drive your dick down the dragoness’s throat. She gasps, gagging around the sudden assault, which makes the muscles in her neck massage your length with delightful desperation.");

output("\n\nTeyaal’s wings and tail thrash among the cushions, sending them flying all around you as she struggles beneath you - struggles not for freedom, but for control of the blowjob. Her forked lizard-tongue wraps around your member and tries to squeeze, but only acts as an extra layer of tightness for you to fuck. Finally her eyes snap open, staring up at you with a mix of indignation and desire while you pound her face. Her hands, though, settle on your [pc.hips], claws digging in and holding on with every mighty push.");

output("\n\nWhen the doctor’s mouth has finally satisfied your desire for a little organic lube, you push her down and pull your dick out, letting the heft of it slap her cheek as you roll the buxom dragon onto her belly.");

output("\n\n{Hard: <i>“Bite the pillow,”</i> you command.} You have to stand to get around Teyaal’s four wings and then manhandle her tail out of the way, but eventually you’re able to secure your access to the swaying mounds of her callipygian booty. Even for an egg-bearing race, Teyaal’s got hips and ass for days, enough to make a raskvel broodmother jealous, and it’s all yours for the taking. You give one of her sprawling alabaster cheeks an experimental slap, and are treated to a hell of a sight: the flesh ripples like water, quaking madly with the impact.");

output("\n\nThe gryvain growls, wrapping her tail around you and squeezing, but it’s a gentle gesture compared to the punishment you’re about to lay on her ass. You grab the doctor’s jiggling cheeks and spread ‘em, revealing the blue-hued gash of her sex and the dark ring of tight draconic asshole above it, winking at you with perverse desire. With a buck of your hips, your [pc.cockOrStrapon] slaps wetly into the valley between Teyaal’s thick cheeks.");

output("\n\n<i>“Come on already,”</i> she hisses, tightening her grip around your waist. You watch as a thick pillar of juice leaks from the lips of the dragon-slut’s cobalt cunt, smearing against her meaty thigh. <i>“Come on and fuck me, {you bastard // bitch}.”</i>");

output("\n\nWell, if she’s <i>asking</i> for it.");

output("\n\nYou use a thumb to push your crown in line with her black hole, watching with blatant lust as it spreads open to accept your spit-slicked member. Teyaal draws a sharp breath, and you watch as her wings flatten against the cushions and her claws tear into the pillows around her face. You mirror the motion, squeezing her plump rump hard as your cock slowly penetrates her.");

output("\n\n<i>“Fuck! Fuck, ah, damn you that’s... that’s good!”</i> Teyaal groans through gritted teeth. And stars, she’s <i>tight</i>, like she’s a damn anal virgin. Hard to believe with a butt this juicy she hasn’t been spreading her cheeks for every pirate on this station. Then again, there’d be a line around the foundry if she did.");

output("\n\nAnd you’re quick to find another reason gryvain anal is such a sexual delicacy. About an inch into your [pc.cockOrStrapon]’s journey and you find a pressure point where Teyaal’s ass becomes almost agonizingly tight, like her body’s fighting tooth and nail to repel your cock. But the moment you force your way past that point, you’re treated to a geyser of cum erupting from the dark blue dick trapped between the gryvain’s thigh and the floor. Her leg is instantly painted white, as are all the pillows under her, coated with thick ropes of creamy cum as that pressure around your cock slowly eases off with every throb and squirt.");

output("\n\nThat’s better. You clench Teyaal’s asscheeks in your hands, spreading her open to give yourself a little more maneuvering room. Slowly but surely, you’re able to start thrusting again, pumping your [pc.cockOrStrapon] into the tight recesses of the gryvain’s tailhole. Every motion squeezes more cum from her dick, milking her like a prize cum-cow until you’re on the edge of joining her in her ceaseless climax.");

output("\n\nThe doctor curses and growls, but her ass just feels like a silken vice around your dick, urging you to give it your cum. {PC has cock: With a bestial howl of your own, you give the doctor’s butt exactly what it wants: your [pc.cock] erupts, nestled between her swollen testes and quickly drowning in your own [pc.cum]. Teyaal’s wings beat hard against the ground, fanning the flames of her own lusts; it’s not long before you’ve filled her with your seed, but for every spurt of spooge, Teyaal smears herself with twice as much. The defeated dragoness must have nothing but dust left in her nads by the time you pull yourself out of her cum-stuffed ass. //PC has a hardlight: You feel the welling pleasure of orgasm, building in your loins around the haptic feedback from your strapon. All you can do is piston your hips against the gryvain’s lush booty until the sensation becomes overwhelming, flooding your mind and body with the pleasure of simulated orgasm. Teyaal’s internal balls empty during the course of your climax, painting her blue-scaled thighs white with her own cum.}");

output("\n\n<i>“I’ll get you... back... for this,”</i> Teyaal pants, though whatever menace the threat might have carried is ruined by her leaking cock. You slap her jiggling ass as you withdraw, leaving her a cum-soaked mess sprawled out on her floor in the afterglow.");

output("\n\nMaybe that give her pause next time she thinks about taking sex slaves. Then again, probably not.");

output("\n\n[Next]");

output("\n\nPlow Pussy");
output("\n\n//This MILFy dragon-slut has a pussy just begging to get pounded.");
output("\n\n//Requires cock or strapon.");

output("\n\nYou loom over the defeated dragoness, watching her mountainous tits quake with every haggard breath in the aftermath of your combat. Her dark blue dick starts resting on her belly, but as you draw near her, the pillar of reptilian meat grows turgid, standing up at attention as you kick her legs apart to expose the dusky lips of her pussy.");

output("\n\nThere’s no sense in beating around the bush: she’d have done the same to you, after all. Probably a whole lot worse. So you shuck your gear to the side and tear the doctor’s jacket off her shoulders, giving you free access to those lush mounds of MILFy boob-flesh. You fall on them a moment later, straddling the dragon-bitch’s hips and sinking your fingers into her big breasts.");

output("\n\n<i>“Gah! Get off, damn you!”</i> Teyaal growls, slapping at your arms. <i>“I’ll have your head, you hear me? You’ll never get off this station! I’ll-”</i>");

output("\n\nYou cut her off the best way you know how: you grab your [pc.cockOrStapon] and shove it between her lips before she can keep rambling on with her empty threats. The doctor’s golden eyes go wide with shock, then settle into seething outrage while you push her tits together around the rest of your shaft and start to thrust. Her tits are soft as silk and jiggle obscenely with every push, almost as good as a pussy in their own right; her nipple chains make it nice and easy to keep the quaking mountains pinned together");

output("\n\nAnd the position keeps the doctor’s big mouth occupied until you’re nice and ready, and her own dick is leaking pre all over itself. You could almost be forgiven for thinking she <i>enjoys</i> having her mouth and tits used like a slave-girl. How deliciously ironic.");

output("\n\nBut Teyaal’s lips are just supposed to be an appetizer, not the main course. Once you’ve had your fill of titfucking, you push the doctor down by her horns and slide your cock from her lips through her cleavage, and over her belly, leaving a wet streak all the way to her crotch. Your cocks bump into each other for a brief moment, letting you feel for yourself just how rock-hard you’ve gotten her just from the forced blowjob.");

output("\n\n<i>“Well?”</i> the doctor snarls. <i>“Going limp, are you?”</i>");

output("\n\nYou’re about to show her just how wrong that assessment is.");

output("\n\nWith a flip of the hips, you line your [pc.cockOrStrapon] up with the perfect oval of the doctor’s twat. There’s no hood or clit to see, just smooth cobalt lips slicked with the dragoness’s mounting arousal. The real treat’s waiting inside, just out of sight, ready to massage every inch of dick you have.You grab the doctor’s thick thighs and peel them apart, spreading her womanhood open in the process; it’s almost too easy to just slide in after that, pushing your hips forward and your [pc.cockOrStrapon] into the soaked slit between Teyaal’s legs.");

output("\n\nJust past her lips, you feel the first ring of ridges inside her pussy - a half-dozen clitoris-like nubs all rubbing against the tip of your [pc.cockOrStrapon]. The effect’s clearly ten times stronger for Teyaal, though: her previously dour demeanor in the face of defeat melts away in the blink of an eye. She screams, arching her back and beating her wings against the pillows. A small fountain of cum spurts from the crown of her turgid dick just to top things off, splattering over the doctor’s belly.");

output("\n\nThere’s plenty more rings to go.");

output("\n\nYou thrust your [pc.cockOrStrapon] deeper into the doctor’s cunt, earning a continuous stream of jizz from her own until you’ve bottomed out in her. You can feel at least thirty clitorises all squeezing down on your dick, throbbing with pleasure as your {girth // hardlight attachment} grinds against them all at once. Teyaal grits her teeth, trying to hold back her whorish cries, but the constant eruptions from her dick and the turgid tips of her blue nipples betrays just how much pleasure you’re inflicting on her.");

output("\n\nYou pause, letting your cock rest inside her spasming cunt for a good few moments while the doctor’s body gets over the sudden climax. When she stops squeezing down like a living vice, you start moving again, slowly pumping yourself out and in again with a steady rhythm. With clenched teeth and claws digging into her pillows, Teyaal tries to fight her way back to some facade of dignity despite her defeat, a diversion you swiftly destroy with your dominant dick. Your hips move faster, driving your [pc.cockOrStrapon] back into the sultry squeeze of Teyaal’s pussy.");

output("\n\n<i>“That’s it!”</i> the gryvain cries out, her resolve finally cracking. <i>“Oh, fuck, harder!”</i>");

output("\n\nYour [pc.lips] twitch into a grin, and you give the slutty dragoness exactly what she’s asking for. You sink your fingers into those meaty mounds on her chest, squeezing them while they bounce with every thrust. The bitch’s tits jiggle madly with your quickening thrusts, and her nipple chain rattles to match until you grab it and pull the chain taut, eliciting a cry of pained pleasure from the doctor.");

output("\n\nYour rapid thrusts quickly build to their inevitable conclusion. You feel a tightness in your {[pc.balls] // loins}, then a throbbing need rising straight to the crown of your [pc.cockOrStrapon]. Teyaal seems to sense it too: her ringed pussy squeezes in spasmic clenches, and her lustful moans reach a fever pitch. A fat rope of pearly dragon-spunk arcs from the tapered tip of her dick, splattering across the doctor’s belly and breasts. She howls and beats her wings, losing what little was left of her control as you hilt yourself inside her and {strap: let your own orgasm come crashing down //realcock, huge cum vol.: unleash a tidal wave of seed deep into the evil scientist’s quim. Her back arches off the pillows as her belly swells around the sheer, magnificent mass of your load. //else: let loose a wave of [pc.cum] into her silken folds.}");

output("\n\n<i>“You beast!”</i> Teyaal growls, digging her claws into you back while you cum. <i>“I won’t forget this. I’ll track you down and-”</i>");

output("\n\nWith a roll of your eyes, you shut her up the same way as before: you pull your cock out and stuff it right back in her mouth. She’s forced into cleaning the orgasmic juices off you inch by inch until you {strapon: deactivate your hardlight dong, leaving her lush blue lips in a slutty <i>“O”</i> //else: pull out and dry yourself off on her cheeks}.");

output("\n\nYou leave the doctor sprawled out and leaking, grumbling about her vengeance. Maybe this will give her pause next time she thinks about taking sex slaves. Then again... probably not.");

output("\n\nRide Dick");
output("\n\n//Climb on Teyaal’s draconic dick and make the evil scientist squirm under you.");
output("\n\n//PC vagOrAss.");

output("\n\nYour eyes inexorably wander down Teyaal’s curvaceous body, over the full swells of her heaving bosoms and her breeder’s hips, before finally settling on the pillar of azure meat laying weightily against her belly. As if responding to your gaze, the doctor’s cock throbs and starts to rise from its resting place.");

output("\n\n<i>“Do your worst,”</i> Dr. Teyaal growls, baring her fangs.");

output("\n\nIf she insists. You shrug off your gear and stalk forward, bringing your [pc.foot] down on her dick and pressing it right back down on her gut. The gryvain gasps and snarls, but the gutteral sound breaks off into a throaty moan as you start to move your {toes // hoof // tail-tip // claws} up and down her turgid length. You watch her long claws rake the pillows underneath her, and you <i>feel</i> her dick throbbing underneath your [pc.foot], stiffening as you grind up and down its cobalt length.");

output("\n\nYou keep going until the dragon-woman’s squirming, her massive chest heaving so hard under her jacket that the button goes shooting off. Her tits spread out heavily, showing off the nipple chain hanging between her ring piercings, shining in the office lights. You let your [pc.foot] slip up under the chain and give it a pull, watching her teats stiffen in answer to the rough tugs.");

output("\n\nWatching her squirm and cry is almost enough to make you forget what she would have done if she’d won. Almost. But that knowledge, and your self-assurance after victory, keep you going until the doctor’s leaking all over herself amidst whorish moans. Her cock keeps calling you back to it, jutting up whenever you aren’t molesting her length under heel, teasing you with its suckable succulence.");

output("\n\nFuck it. To the victor go the spoils, as they say.");

output("\n\nFlashing a hungry, predatory grin down at the defeated dragoness, you finally take your [pc.foot] off her - only to pin her back down by the breasts a second later, pushing Teyaal flat on her back while you knead her tits. All the while, you slide your [pc.butt] down her prostrate form, over the smooth curves of her belly until your feel the pressing of her cock against your cheeks.");

output("\n\n<i>“Funny, that’s where I’d put it,”</i> the doctor says with a taunting snarl. <i>“Should have just-”</i>");

output("\n\nHer words trail off into a throaty gasp of pleasure as you slam yourself down on her dick, taking it straight to the hilt in the cock-craving confines of your [pc.vagOrAss]. Teyaal’s hands snap onto your hips, trying to control your movements, but she’s so worn down by the fight that it’s easy to push her back down and start riding her at your own pace. She’s welcome to squirm and beg under you, but she’s not going to have any say in how this goes down.");

output("\n\nYou squeeze your muscles down around the doctor’s cock, as tight as you can before you start to move. You make it agonizingly slow, a pleasurable grinding for you as you feel her alien dick rubbing your inner walls up and down, but the way her jaw clenches and eyes shut tight, you know she’s suffering. Her hips try to buck against you, and her wings beat so furiously that they push her body up off the deck, but you just sink your fingers into her tits and squeeze until she relents again.");

output("\n\nYou tell her to be a good girl. If she is, you <i>might</i> let her get off too.");

output("\n\nThat seems to quiet the last flames of rebellion in her. Long enough for you to start moving again, slow and steady. You raise your [pc.hips] up from her lap, dragging her dick out from your [pc.vagOrAss] by inches. When there’s only the very tip left in you, wiggling its slender crown {between your lips // in your rim}, you finally let your muscles relax a little... and all but slide back down Teyaal’s rod, taking her right back to the hilt.");

output("\n\nThe dragoness just fixes you with those golden eyes of hers, begging you to keep going. Good girl. Just for that, you keep going a little faster now, bouncing in Teyaal’s lap with growing haste with every whorish moan you elicit from her lips. Before long you’ve forgotten all about her weak attempts to wrest control of the scene, too engrossed in the pleasure of her reptilian member to care about dominance and submission anymore. You just want to <i>fuck</i>.");

output("\n\nAnd Teyaal’s no better. You watch gleefully as her tits quake every time your [pc.butt] impacts her hips, drawing a chorus of gasps and grunts from the matronly dragon’s azure lips. She’s quite beautiful when she’s surrendered to ecstacy, resigned to be your submissive plaything. The chain holding her nipples together jingles in its geddanium-studded rings, and every time it does, the doctor’s pleasure seems to grow that much more intense - must be the rings, rubbing her nipples with every lewd jiggle of her voluptuous flesh.");

output("\n\nYou’re so enraptured by the lurid display that you don’t recognize the desperate throbbing coming up Teyaal’s shaft for what it is until it’s far too late. For a moment, the reptilian bulge around the base of her dick seems to swell to twice its normal girth, just for a moment, before a jetstream of burning hot seed shoots into your [pc.vagOrAss]. Your eyes snap open, wide in surprise as the creamy wetness spreads through your {bowels // pussy}... and <i>keeps</i> spreading, flooding you with an unholy amount of draconic jizz. Teyaal’s voice breaks into a slutty cry, and her hips buck against your [pc.butt] hard enough for force the bulbous base straight into you like a draconic knot.");

output("\n\n<i>“Arg, fuck, I’m...”</i> Teyaal tries to give voice to her orgasm, but you silence her with a rough tug on her geddanium rings. Guess you got too wrapped up in your own pleasure to concentrate on punishing the evil gryvain. Now you’ve got an extra layer of lube leaking through your [pc.vagOrAss], pooling up around the knotty bulb spreading you open.");

output("\n\n<i>“Don’t you dare go soft on me,”</i> you {h/ausar: bark //else: command}, pulling the doctor’s chain taut. <i>“I’m not done with you yet.”</i>");

output("\n\nShe snarls, but her dick doesn’t go flaccid. Maybe she’s afraid... or more likely, she’s still enjoying herself too much.");

output("\n\nYou’re able to just glide along her length now, faster and faster. No need to torment Teyaal now: every bounce is an agonizing over-stimulation for her, leaving you free to just pursue your own pleasure. Feeling her draconic dick pounding into you, helped along by what feels like a gallon of steamy-hot jizz, is all you need to reach your own orgasm. Before long, your voice is joining the doctor’s, and all the muscles in your [pc.vagOrAss] are going wild. You bite your lip and let your eyes roll closed, entrusting your body to carry you the rest of the way while your mind melts away.");

output("\n\nYou’re snapped back from your climactic bliss by another piping-hot burst of cum blasting into you. With a mischievous grin, you pull yourself up and off of Teyaal’s dick, letting her spurt her load all over herself while your trembling [pc.legOrLegs] take you back to find your discarded gear.");

output("\n\nCall Olympia");
output("\n\n//If the PC has had sex with Olympia before, add this option.");
output("\n\n//TT: Olympia definitely has some issues with her piratical owner. Now that you’ve taken Teyaal down a peg, she’d like to work on some of those issues.");

output("\n\nYou take a step back, keeping your weapon trained on the doctor as you slide the door open and shout <i>“Hey, Olympia!”</i>");

output("\n\nThe gynoid answers with a curt, <i>“What now? Are you two done with all that noise?”</i>");

output("\n\nYou don’t answer, leaving her to stew in her own morbid curiosity until, with an exasperated sigh, Olympia pokes her head through the door. She fixes you with her synthetic eyes, narrows them, and drops her gaze down to the floor where Teyaal is sprawled out, still breathing hard from the brawl.");

output("\n\n<i>“Olympia!”</i> the doctor howls. <i>“Get [pc.himHer] - quickly, you robotic fool!”</i>");

output("\n\nThe sexbot scrunches her lips up and glances back to you. <i>“Nah, I think I’ll pass.”</i>");

output("\n\nYou’re treated to a moment of confusion playing across Teyaal’s face, followed by eyes going wide with anger and confusion. <i>“What? I gave you an order! I-”</i>");

output("\n\n<i>“I’m an A.I., not a drone. And you’re not even my real owner... whoever that might have been. You can’t make me do anything I don’t want to. Thanks to you, I’ve wanted to working on the </i>Sidewinder<i> all this time... and appeasing you has made that easier. Now that you’re at [pc.name]’s mercy, though, you’re no longer useful to me. It appears I’m my own master now.”</i>");

output("\n\nPlayfully, you ask if that’s all Olympia has to say to her former tormentor. The gynoid considers the point a moment; her tail swishes faster behind her as she thinks. <i>“Oh, perhaps one thing,”</i> she finally admits, taking a long-legged step into the room and locking the door behind her.");

output("\n\nOlympia shrugs off her lab coat, letting it pool around her feet, and hooks her thumbs through the band of her bulging panties. <i>“I remember many nights when you interrupted my work to practice your, what did you call it... oh, your ‘slave sodomizing skills.’ I think it’s about time I practiced <b>mine</b>.”</i>");

output("\n\nTeyaal starts to protest, to shout more demands and commands at the genius sexbot, but Olympia simply ignores her former mistress as she slides out of her panties and runs her fingers up the stiffening length of her wine-red shaft. She leans down and hefts the fallen doctor up off the deck by her lab coat, ripping it open and flinging Teyaal face-first onto the desk in one fluid motion. Draconic wings beat wildly as the doctor tries to regain her balance, made worse as Olympia closes the distance again and delivers a mighty spank across the doctor’s plump behind.");

output("\n\n<i>“Remember what you always told me, doctor,”</i> the gynoid adds, letting her azure lips curl into a snarl of a smile. <i>“Lube is for the weak.”</i>");

output("\n\nOh dear. You watch as the vengeful gynoid slaps the heft of her dick down against Teyaal’s behind, lining up the tapered crown with the dragoness’s tailhole. There’s a moment of tension, and then Teyaal is screaming, thrashing her wings and tail as Olympia slowly inches her hips in towards her former owner’s ass.");

output("\n\nBetter get in on this while you’ve got the chance.");

output("\n\nTrusting Olympia to hold the doc down, you set your [pc.weapon] aside and strip out of your [pc.gear]. You circle around and present your {[pc.vagOrAss] // [pc.cock]} to the defeated drake, maneuvering so that you and Olympia are facing each other while Teyaal squirms between you on the desk. Her tongue thrashes as you push yourself against her lips, a last futile resistance before her former property hilts herself in the dragon’s asshole.");

output("\n\n<i>“Oh, this is surprisingly... satisfying,”</i> Olympia murmurs. She bites her lower lip and sinks her fingers into Teyaal’s asscheeks, roughly kneading the pale flesh on either side of her own dick. <i>“Have I been looking forward to this? I feel like I must have been... mmm, I bet whoever’s brain I was patterned on grew up to be a real vindictive bitch.”</i>");

output("\n\nWouldn’t surprise you, considering how much Olympia seems to be enjoying her retribution. You’re in the perfect position now to watch the cunning gynoid start grinding her hips in slow, shallow thrusts against Teyaal’s arid ass. The doctor twitches every time her former slave-bot’s bulbous base pushes back against her hole, and her tongue flails {inside you // around your [pc.cock]} with desperate abandon. Damn, that feels <i>good</i>.");

output("\n\nGrinning wickedly, you grab Teyaal’s horns and start to {dick: thrust, using them like handlebars to face-fuck her //else: grind your [pc.vagOrAss] on her face, taking her tongue deep}. You can feel the surrender in the way her sinuous tongue moves, the way she stops bucking in your arms and lets your handhold on her horns guide her right where you want the lusty dragoness.");

output("\n\n<i>“[pc.name],”</i> Olympia says softly, drawing your attention up from your captive to the sexbot’s sultry visage. Her breasts are quaking with every stuccato thrust and her hands are sunk deep into Teyaal’s cheeks, but her eyes are locked on you. She crooks a finger, urging you to lean in.");

output("\n\nWhen you do, Olympia grabs your cheeks and pulls you into a fierce kiss. It takes you by surprise - it’s a sudden break of character for the normally-stoic gynoid, but then again, she’s clearly in a good mood thanks to newfound freedom. When she finally draws back again, her azure lips are sporting a toothy smile. <i>“Somehow... with this bitch out of the way, I think my work’s going to be finished so much faster. I’m practically trembling with excitement. Or is that...?”</i>");

output("\n\nOlympia draws a sharp breath,");
*/