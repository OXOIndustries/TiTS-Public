//Meeting Kaede on N.C. Station
/* FLAGS

flags["KAEDE_CANADA_MET"] = 1 		- has met her on station.
STATUS: "Kaede Canada Cooldown" 	- Kaede is on cooldown after meeting.
flags["KAEDE_CS_COUNTDOWN"]			- Set as game timestamp to track 14 time on station visit.
									- Set to -1 when Kaede's Canadia Station vacation is over.
flags["GLORYHOLED_KAEDE"]			- Counts time gloryholed Kaede... capped at 1 for now.
flags["KAEDE_EXHIBITIONISM"]		- tracks the exhibitionism score of kaede. Range 0-100

//Breastfeeding scene: https://docs.google.com/document/d/1SHsdx_JcjSTMukFT9pOzAD_Qyvkx3k2kwl4lYiCt8Ik/edit#heading=h.fksuca9tdauj
*/

public function kaedeCouldBeOnNewCanadaRepeats():Boolean
{
	if(flags["KAEDE_FUCKED"] != undefined && flags["KAEDE_FUCKED"] > 0 && flags["KAEDE_NT_ENCOUNTER"] != undefined && flags["KAEDE_CANADA_MET"] != undefined && !pc.hasStatusEffect("Kaede Canada Cooldown") && flags["KAEDE_CS_COUNTDOWN"] != -1) return true;
	return false;
}

//add to Kui Country bar description. Must have banged Kaede at least once and have met her on New Texas.
public function kaedeBlurb4KuiCountryBarAndGrilllll(button:int):Boolean
{
	if(flags["KAEDE_FUCKED"] != undefined && flags["KAEDE_FUCKED"] > 0 && flags["KAEDE_NT_ENCOUNTER"] != undefined)
	{
		if(flags["KAEDE_CANADA_MET"] == undefined)
		{
			output("\n\nA familiar ginger half-ausar is sitting at the bar, enjoying a scotch on the rocks and scoping out the guns displayed on the walls. It’s Kaede!");
			//[Kaede]
			addButton(button,"Kaede",approachKaedeInNewCanadia,undefined,"Kaede","Go say hi to Kaede.");
		}
		else if(!pc.hasStatusEffect("Kaede Canada Cooldown"))
		{
			//Kaede gone
			if(flags["KAEDE_CS_COUNTDOWN"] == -1) {}
			//Kaede last event proc.
			else if(GetGameTimestamp() >= flags["KAEDE_CS_COUNTDOWN"] + (14*24*60) && flags["KAEDE_CS_COUNTDOWN"] != -1 && flags["KAEDE_CS_COUNTDOWN"] != undefined)
			{
				timeRunsOutForKaede();
				return true;
			}
			//Kaede repeats!
			else
			{
				output("\n\nKaede’s hanging out at the bar again, sipping on a scotch and admiring the rustic knick-knacks on the walls. When she catches sight of you, Kaede leans back and flashes you a wink, orange tail wagging happily.");
				if(flags["KAEDE_CS_COUNTDOWN"] == undefined) flags["KAEDE_CS_COUNTDOWN"] = GetGameTimestamp();
				addButton(button,"Kaede",repeatApproachKaede,undefined,"Kaede","Go say hi to Kaede.");
			}
		}
	}
	return false;
}

//Go say hi to Kaede
public function approachKaedeInNewCanadia():void
{
	clearOutput();
	showKaede();
	author("Savin");
	author("Savin");
	output("You saunter up behind the preoccupied pup and give her a clap on the shoulder, just hard enough to break her out of her reverie with a start. Her flame-orange ears leap straight up in surprise, but the moment she sees who it is ");
	if(pc.isTaur()) output("clearing the space beside her to take a seat");
	else output("taking the bar stool beside her");
	output(", her scowl softens into a familiar smile and a ginger tail flicks across your [pc.leg].");
	output("\n\n<i>“Hey, you,”</i> Kaede grins, pulling you into a quick, tight hug. <i>“Didn’t expect to run into a sexy planet-rusher like you way back here in the core. What brings you out here, [pc.name]?”</i>");
	output("\n\nYou tell her as much, and pose the same question back at her: is she out here on another cargo run?");
	output("\n\nKaede shakes her head. <i>“Nah, personal business for once. Visiting a friend at the University of Vesperia. Just came back up to hang at the bar while he’s busy on... stuff. But hey! Now I’ve got some company - lemme buy you a drink.”</i>");
	output("\n\nShe signals to ");
	if(flags["MET_KALLY"] != undefined) output("Kally");
	else output("the kui-tan girl behind the bar");
	output(", and another drink quickly appears before you. The bartender gives you a flirty wink and sashays off to tend to a table full of customers, leaving the two of you more or less alone at the bar. Kaede’s hand rests on your thigh as you take a sip, watching you with those big blue eyes. You end up making eye contact through the distorted lens of the glass, her face stretched and warped for that brief moment before you set the glass down and turn your attentions to her.");
	flags["KAEDE_CANADA_MET"] = 1;
	processTime(3);
	clearMenu();
	//[How’s Things?]
	addButton(0,"How’s Things?",kaedeHowsThingsOnCanadia,undefined,"How’s Things?","Get a status update on the life and times of Kaede Entara.");
	//[Her Friend]
	addButton(1,"Her Friend",kaedesFriendoTalkOnCanadia,undefined,"Her Friend","Who’s this friend Kaede mentioned?");
	//[Vesperia]
	addButton(2,"Vesperia",kaedesVesperiaCanadia,undefined,"Vesperia","Ask Kaede about the system the two of you find yourselves in.");
	//[Kui Country]
	addButton(3,"Kui Country",kuiCountryKaedeTalkButts,undefined,"Kui Country","How does Kaede like the bar?");
	//[Finish]
	addButton(4,"Finish",finishUpKaedeCanadaDate,undefined,"Finish","Finish up with the <i>Talon</i>’s captain, and see what else is in store for you.");
}

//Get a status update on the life and times of Kaede Entara.
public function kaedeHowsThingsOnCanadia():void
{
	clearOutput();
	showKaede();
	author("Savin");
	output("<i>“So, how’s things?”</i> you ask, setting your glass aside and turning to face Kaede full-on.");
	output("\n\n<i>“Eh, it’s alright,”</i> she answers with a shrug, finishing off her own drink with a sigh of relish. <i>“Pretty stressful few days, though. It’s nice being in the core where I can, you know, actually relax for once. No pirates, no horrible space monsters... just cute ‘taur girls as far as the eye can see.”</i>");
	output("\n\nThat right. She been dealing with a lot of pirates and monsters in the cargo lanes lately?");
	output("\n\nKaede just laughs. <i>“Yeah, actually. But that’s a long story... for when I’m not nearly this sober. Let’s just say I’m glad I invested in </i>Talon<i>’s defenses. But that’s not news to you, huh. I bet you deal with ten times worse, like, every day.”</i>");
	output("\n\nOh, it’s not nearly as bad as all that. But you’re much more interested in what’s been going on with Kaede.");
	output("\n\n<i>“And </i>I<i> am much more interested in this scotch,”</i> Kaede smirks, motioning to the bartender. Her drink is replaced in the blink of an eye, and she starts drinking... and gives absolutely no sign of actually answering your queries.");
	output("\n\nFine, be that way. In that case, <i>“How’s Kayla doing?”</i>");
	output("\n\n<i>“Good. Real good,”</i> she answers. <i>“Cass says if I’m going to be hanging out here a while, she might start swinging her regular route over towards Vesperia so we can hang out. Man, I can’t imagine actually getting to live with those two for... even a few days. Exciting!");
	if(annoIsCrew()) 
	{
		output(" Oh, speaking of which: did you bring Anno along? Maybe the three of us could get away later...”</i>");
		output("\n\nNow that would be nice.");
	}
	else output("</i>");

	processTime(10);
	addDisabledButton(0,"How’s Things","How’s Things","You already asked this.");
}

//Her Friend
//Who’s this friend Kaede mentioned?
public function kaedesFriendoTalkOnCanadia():void
{
	clearOutput();
	showKaede();
	author("Savin");
	output("<i>“So who’s this friend of yours at the university?”</i> you ask. <i>“Another lover?”</i>");
	output("\n\nKaede huffs and crosses her arms. <i>“Hey now, I don’t </i>actually<i> bang </i>everyone<i> I meet you know. You just, uh, have a real talent for meeting the people I do, that’s all. Anyway, Ethan’s a teacher down at the university. Anno put me in touch with him a while ago, and he’s doing some work for me on the side.”</i>");
	output("\n\n<i>“Work? Like what?”</i>");
	output("\n\n<i>“He works in artificial intelligence, see, so I asked him to take a look at </i>Talon<i>’s onboard intelligence. We, uh, I’ve been having some... uh, problems... with it. So I’m waiting around while he pokes around in my ship’s brainmeats down on the surface.”</i>");
	if(pc.isBro()) output("\n\n<i>“Sounds boring,”</i> you yawn.");
	else if(pc.isBimbo()) output("\n\n<i>“Oh, wow, uh... good luck with that and stuff!”</i>");
	else if(pc.characterClass == GLOBAL.CLASS_ENGINEER) output("\n\nThat might not be your field of expertise, but that sounds pretty interesting. What’s been going on with her V.I.?");
	else output("\n\nSomething’s wrong with her ship? What’s up?");

	//Non Bimbo/brute:
	if(!pc.isBro() && !pc.isBimbo())
	{
		output("\n\n<i>“Oh, nothing to worry about. Just some... I guess, weird programming that’s come up. Routines that shouldn’t be there, that sorta thing. I don’t know if it’s corruption or just someone putting weird stuff in there when sh - it - was made. I just want Ethan to pick around in the code and see what’s up. At least tell me why things are like they are.”</i>");
		output("\n\nThe way Kaede’s stumbling over her words definitely gives you pause, but she certainly seems stressed out by whatever’s going on with her ship.");
	}
	processTime(10);
	addDisabledButton(1,"Her Friend","Her Friend","You already asked this.");
}

//Vesperia
public function kaedesVesperiaCanadia():void
{
	clearOutput();
	showKaede();
	author("Savin");
	output("<i>“What do you think about Vesperia so far?”</i>");
	output("\n\nKaede shrugs lightly. <i>“I dunno, I’ve only been down to the planet’s surface a couple of times, and I’ve almost never done work out here. You know, this deep in the core it’s almost all big-dog cargo haulers and corporate ships doing the shipping. Real hard to get any contracts in well-settled, safe systems like this, you know?”</i>");
	output("\n\nYou can imagine. Still, you’ve heard nothing but good things about the system so far.");
	output("\n\n<i>“Yeah, that’s true. It was beautiful when I was down on the surface, and full of cute four-legged babes to boot. It’s just hard to find something interesting to say about an actually... nice place to live. Most of the rush-worlds I’ve been to have been scary and weird, but Vesperia’s been settled for thousands of years. Like, before humanity’s First Contact with the ausar. Kinda puts things in perspective, huh? I wonder how long this station’s been around... doesn’t feel that old, but who knows. Just feels cozy to me.”</i>");
	output("\n\nSounds like Kaede might actually like the place. And the locals, too.");
	output("\n\nShe blushes a little and glances at the hefty moose-bodied woman in the back corner. <i>“What can I say? Beast-bottom girls make the worlds go ‘round,”</i> Kaede murmurs dreamily.");
	if(pc.isTaur()) output(" She gives you a little smile and brushes her boot along your bestial lower half. As much as you’d like to maintain eye contact, a growing little bulge in the front of her jeans demands your attention. With nobody looking your way, you don’t mind reaching down and giving her business an affectionate pat in return. Kaede squirms, giggles, and something thick and meaty throbs in your hand.");
	else output(" <i>“S-sorry, I got a thing for big girls. Ehem. Anyway, what were we talking about?”</i>");
	processTime(8);
	addDisabledButton(2,"Vesperia","Vesperia","You already asked this.");
}

public function kuiCountryKaedeTalkButts():void
{
	clearOutput();
	showKaede();
	author("Savin");
	//How does Kaede like the bar?
	output("<i>“How are you liking this place?”</i> you ask, waving a hand around the rustic space-country lodge.");
	output("\n\nKaede follows your gaze, settling on the collection of old powder guns racked up on the walls. <i>“This place is great! I love the atmosphere - it’s nothing like Anon’s, or any of the places I grew up with on Tavros. And that gal behind the counter is so friendly! I’d love if she’d just pick all this up and come out to the frontier where I could get at them whenever. Ahh, wish I had more excuses to get back core-ward if the food and drink and people are all going to be this nice.”</i>");
	output("\n\nSounds like she likes the owner. Any story there?");
	output("\n\n<i>“Nah,”</i> Kaede laughs, waving you off. <i>“She’s just been super friendly. Big change from the last few kui-tan I met... uh, that sounded super racist, didn’t it? Sorry, I just had a bad experience once... that’s not helping. Uhhh... a-anyway, Kally’s just been sweet since I got here. And have you </i>seen<i> what she’s wearing?”</i>");
	output("\n\nKaede nods subtly towards the kui-tan beauty working behind the bar. Kally’s miniskirt’s riding high, shamelessly revealing a bare-naked dick swinging long and soft between her legs. Kaede looks between her swaying shaft and you, smirks, and takes a long sip of her drink. <i>“That’s gotta count for something, right?”</i>");
	//Has visited Beth’s before:
	if(flags["TALK_TO_LADY_1ST"] != undefined)
	{
		output("\n\nIf that’s what gets Kaede’s motor running, you’re surprised you haven’t seen her getting her drinks at Beth’s back home.");
		output("\n\nShe chuckles, managing to keep too much crimson from showing on her cheeks. <i>“Well, uh, as much as I like seeing asses and tits jiggling around while I get hammered, I think my dad would kill me if he heard I was going there... and I know half his crew are regulars at Beth’s.”</i>");
	}
	processTime(10);
	addDisabledButton(3,"Kui Country","Kui Country","You already asked this.");
}

//Finish
//Finish up with the <i>Talon</i>’s captain, and see what else is in store for you.
public function finishUpKaedeCanadaDate():void
{
	clearOutput();
	showKaede();
	author("Savin");
	output("<i>“So,”</i> you prompt, finishing your drink and leaning against the bar.");
	output("\n\nKaede follows your lead, topping off that scotch of hers and turning on her seat, resting her elbows back on the bar and looking the lodge over with a smile. <i>“So... this is the part where you say we should get out of here, right? Maybe ");
	if(annoIsCrew()) output("hook up with Anno and ");
	output("rent one of those rooms in back...?”</i>");

	output("\n\nNow that’s an idea. You glance at Kaede and...");
	output("\n\nThe holoband on her wrist bleeps at you, flashing with blue light.");
	output("\n\n<i>“Shit,”</i> Kaede groans, hopping up and tapping an earpiece under the tuft of white floof on the side of her head. <i>“Hey. Really? Oh man, bad timing Ethan, I was... uh, damn it. Okay, okay, I’m on my way.”</i>");
	output("\n\nThe halfbreed gives you an apologetic look and grimaces. <i>“Sorry, [pc.name]. My friend down planetside called - I gotta make a jump down to Vesperia Prime. Rain check?”</i>");
	output("\n\nDamn. <i>“Rain check.”</i>");
	output("\n\n<i>“Perfect. I’ll be hanging around here for a little bit - maybe I’ll see you around?”</i> Kaede leans down and gives you a quick kiss before bounding towards the door.");
	//Disable Kaede at the bar for 12 hours.
	processTime(10);
	clearMenu();
	pc.createStatusEffect("Kaede Canada Cooldown");
	pc.setStatusMinutes("Kaede Canada Cooldown",720);
	addButton(0,"Next",mainGameMenu);
}



public function repeatApproachKaede():void
{
	clearOutput();
	showKaede();
	author("Savin");
	output("<i>“Hey,”</i> you say, giving the ginger pup a hug from behind and finding a seat for beside her. She grins and plants her head on your shoulders, nuzzling up against you with that familiar affection of hers. Kaede signals over to ");
	if(flags["MET_KALLY"] != undefined) output("Kally");
	else output("the bartender");
	output(", and your drink of choice appears in front of you in a whisk of motion and a flirty wink.");
	output("\n\nAfter you enjoy a long draught, you set the glass aside and turn your attention fully on the ginger half-ausar snuggled up beside you.");

	processTime(2);
	repeatKaedeMenuNewCanadia();
}

public function repeatKaedeMenuNewCanadia():void
{
	clearMenu();
	//[Status Update]
	addButton(0,"Status Update",statusUpdateKaede,undefined,"Status Update","Check in on how Kaede’s doing.");
	//[Touch Fluffy Tail]
	addButton(1,"TouchFluffTail",touchKaedesFluffyTailWhosAGoodGirlSheIs,undefined,"Touch Fluffy Tail","Give Kaede’s fluffy ginger tail a little love.");
	//[Get a Room]
	if(pc.lust() >= 33) addButton(2,"Get a Room",getARoomWithKaede,undefined,"Get a Room","Take Kaede to one of the lodge’s rooms for some fun.");
	else addDisabledButton(2,"Get a Room","Get a Room","You aren’t aroused enough for that.");
	//[Leave]
	addButton(14,"Leave",mainGameMenu);
}

//Status Update
//Check in on how Kaede’s doing.
public function statusUpdateKaede():void
{
	clearOutput();
	showKaede();
	author("Savin");
	output("<i>“How’s it going?”</i> you ask, running a hand through Kaede’s hair.");
	output("\n\nShe yawns. <i>“Boring. Looks like I’m gonna be here for ");
	if((flags["KAEDE_CS_COUNTDOWN"] + (60 * 24 * 13)) <= GetGameTimestamp()) output("the rest of the day, then I’m outta here");
	else 
	{
		output("another " + num2Text(14 - Math.floor(((GetGameTimestamp() - flags["KAEDE_CS_COUNTDOWN"]) / 24 / 60))) + " days");
		//output("\n\nCcuntdown: " + flags["KAEDE_CS_COUNTDOWN"] + "\n\nTimestamp - Countdown: " + (GetGameTimestamp() - flags["KAEDE_CS_COUNTDOWN"]));
	}
	output(". But hey, it’s nice getting a chance to take a little vacation. Finally relaxing after... God, years now of working the trade routes non-stop. Getting to kick my feet up for once is nice, you know.”</i>");
	output("\n\nYou can imagine. Shame you can’t take the same luxuries.");
	output("\n\nKaede chuckles. <i>“Sorry. But hey, at least we can make the most of it while you’re here, huh? You and Cass");
	if(annoIsCrew()) output(" and Anno");
	output("... it’s a regular party waiting to happen. Or an orgy. Whichever.”</i>");

	output("\n\nShe snickers and takes a sip of her drink. <i>“But you asked how I’m doing... well, hopefully my ship will be up and ready to run before too long. Just watching my bank account wither with every day I’m docked here. Heh, probably put on a couple pounds already sitting here. Gonna end up with a girly beer-belly before long!”</i>");
	if(pc.lust() >= 75 || pc.libido() >= 75) output("\n\nSounds like she needs an excuse to work some of that off. You can think of a few ways...");
	processTime(8);
	repeatKaedeMenuNewCanadia();
	addDisabledButton(0,"Status Update","Status Update","You just did that.");
}

//Touch Fluffy Tail
//Give Kaede’s fluffy ginger tail a little love.
//Lust +33
public function touchKaedesFluffyTailWhosAGoodGirlSheIs():void
{
	clearOutput();
	showKaede();
	author("Savin");
	output("While Kaede’s distracted with her drink, you slide your hand down the back of her worn old leather jacket and across the slender joining of her tail to the back of her jeans. The fluffy appendage wiggles at your touch. Long flame-orange fur sweeps eagerly across the deck behind you, thumping rhythmically against the barstools. As your hand traces through the thick, satin-soft fluff trailing from Kaede’s jeans, you think to yourself that it seems much thicker than before - maybe her winter coat’s come in? Or with her in your hand, so soft and warm and near... maybe she just feels that much more in need of cuddles and affection.");
	output("\n\nKaede gives a little gasp when you pull her close, but nuzzles happily into your arm and murmurs into your [pc.ear], <i>“Oh, that’s nice. Don’t stop.”</i>");
	output("\n\nYou don’t intend to. Your fingers play through the silky strands of her ginger fluff, scratching at the slender slip of flesh at the heart of her tail, right near the base. That seems to be just the right spot: Kaede moans softly, one of her hands dropping down to squeeze your thigh. The sound draws a glance from ");
	if(flags["MET_KALLY"] != undefined) output("Kally");
	else output("the bartender");
	output(". Seeing the two of you all snuggled up, she flashes you both a coy little smile and reaches up onto one of the shelves behind the bar - an act that leaves her too-short skirt hiking up around her bronzed brown ass-cheeks, and showing off her swinging cock and balls. Both you and Kaede have to pry your eyes away before she turns back to you and refills both your glasses.");
	output("\n\n<i>“Having fun?”</i> ");
	if(flags["MET_KALLY"] != undefined) output("Kally");
	else output("the bartender");
	output(" says with a knowing smirk. <i>“On the house.”</i>");

	output("\n\n<i>“Cheers,”</i> Kaede grins, raising her glass. You do the same, drinking with one hand and stroking her tail with the other. You find that special spot near the base again, and the ginger pup’s tail starts swishing happily once again. Rather than cleaning the deck for the owner, though, Kaede flicks her canine rudder into your lap, wrapping your crotch in her warm embrace. Oh, that feels nice...");
	output("\n\n<i>“My fur’s about the only thing that’s soft right now,”</i> Kaede whispers into your [pc.ear], hand squeezing your thigh. <i>“Hope you’re satisfied...”</i>");
	processTime(13);
	pc.changeLust(33);
	clearMenu();
	//[Yes] [Keep Going]
	addButton(0,"Yes",yesThatsEnoughKaede,undefined,"Yes","That’s enough teasing for now.");
	addButton(1,"Keep Going",keepTailScritching,undefined,"Keep Going","Oh no. You’re not satisfied just yet...");
}

//[Yes]
//That’s enough teasing for now.
//Pass 10 minutes. Display Kaede’s menu.
public function yesThatsEnoughKaede():void
{
	clearOutput();
	showKaede();
	author("Savin");
	processTime(10);
	output("You stop teasing her. What now?");
	repeatKaedeMenuNewCanadia();
	addDisabledButton(1,"TouchFluffTail","Touch Fluffy Tail","You just did that.");
}

public function keepTailScritching():void
{
	clearOutput();
	kaedeIncreaseExhibitionism(10);
	showKaede();
	author("Savin");
	//Oh no. You’re not satisfied just yet...
	output("You can’t be satisfied while you’ve got a rock-hard ladycock next to you, separated only by the thin veneer of Kaede’s old jeans. Flashing her a mischievous smile, you pick up her tail and flip it into <i>her</i> lap, using the flame-colored fur to cover your own hand, shielding it from wandering eyes. Kaede gives you a look, and her eyes go a little wide when your fingers reach down and cup her meaty little package, feeling up the stiff puppy-bone trapped inside. The familiar heft of Kaede’s prick jumps at your touch, straining against her zipper. Smirking, you give it an affectionate squeeze - just hard enough to make its owner blush and moan.");
	output("\n\n<i>“H-hey, what-”</i>");

	if(pc.exhibitionism() < 50) output("\n\nYou shush her, whispering how awkward");
	else output("\n\nYou grin at her, idly saying how hot");
	output(" it would be if all the other patrons suddenly looked her way and saw what was going on. She whines and squirms, fidgeting her legs around your groping grasp on her crotch. All she can do is suck in a sharp breath to try and calm herself, digging her fingers into the polished wood of the bar.");

	output("\n\nYou pet and squeeze and rub that precious little puppy-package, stroking it from stem to stern until she’s whimpering and shivering, trying so hard not to get noticed... and starting to fail. The kui-tan owner glances your way with a cocked eyebrow, but poor Kaede manages to compose herself just enough to wave her off.");
	output("\n\n<i>“Okay, okay,”</i> she breathes, pawing at your [pc.arm]. <i>“Knock it off, [pc.name]. Let’s go get a room if you’re </i>that<i> desperate...”</i>");
	output("\n\nShe’s trying to play it cool, but if you know Kaede, she’s at her absolute limit. ");
	var options:Boolean = true;
	//has made Kaede cream herself before: 
	if(flags["KAEDE_PUBLIC_SHAME"] != undefined) 
	{
		output("Before you get any funny ideas again, Kaede grabs your wrist and gives you a playful but meaningful swat on the cheek with the tip of her tail. <i>“Oh no you don’t! Not again!”</i> she huffs. <i>“That was the most embarrassing thing ever. You wanna tease me over the edge, let’s go to my room!”</i>");
		if(pc.isAss() || pc.isBro()) output("\n\nLike that’ll stop you.");
		else options = false;
	}
	
	processTime(5);
	pc.changeLust(15);

	clearMenu();
	if(pc.lust() >= 33) addButton(0,"Get a Room",getARoomWithKaede,undefined,"Get a Room","Take Kaede to one of the lodge’s rooms for some fun.");
	else addDisabledButton(0,"Get a Room","Get a Room","You aren’t aroused enough for that.");
	addButton(1,"Leave Off",yesThatsEnoughKaede);
	if(options) addButton(2,"MAX TEASE",maximumTeaseTheSloot,undefined,"MAX TEASE","Let’s see just how much Kaede can really take.");
	else addDisabledButton(2,"MAX TEASE","MAX TEASE","Looks like you can’t get away with pulling that one off twice...");
	//[Get a Room] [Leave Off] [MAXIMUM TEASE]
}

//[MAXIMUM TEASE]
//Let’s see just how much Kaede can really take.
//Heavy move towards Mischievous.
//This seems more like an asshole move. - FEN
public function maximumTeaseTheSloot():void
{
	kaedeIncreaseExhibitionism(10);
	clearOutput();
	showKaede();
	author("Savin");
	output("You bite your lip, trying not to smile too much as your fingers close in around her pent-up prick, rubbing her shaft as fast as you can against the resistance of her bulging jeans. You can feel a throbbing, pulsing heat just below the surface, desperate for release... and you intend to give her cock what it so obviously wants.");
	output("\n\n<i>“W-w-wait!”</i> Kaede squeals, eyes wide and wild with realization. <i>“Nonononono!”</i>");
	output("\n\nYes, yes, <b><i>yes</i></b>! You grab Kaede’s cheek with your free hand, pulling her into a fierce surprise kiss and working that dick of hers with everything you’ve got. She tries to pull back, but a sudden eruption of steamy warmth in her pants convinces her of the futility of it; she shudders and goes limp in your arms, letting your [pc.tongue] play across hers while your hand works out all that pent-up shemale cream.");
	output("\n\nWhen you break the kiss, Kaede is staring at you with big blue doe-eyes, trembling in your grasp. <i>“Oh my God. Y-you <b>jerk!</b>”</i> she whines, looking between you and the wet stain smeared across her crotch. <i>“I... you... I can’t believe you did that!”</i>");
	output("\n\nYou grin and tell her not to lie: she enjoyed herself.");
	output("\n\n<i>“That’s not the point!”</i> she growls. Oh wow, she is beet red now! <i>“You can’t do that in public! I... people are staring!”</i>");
	output("\n\nOnly because she’s not using her indoors voice. Nobody was looking until she started fussing, you tell her. She somehow flushes a little redder and rucks her big ol’ ausar ears against her head. <i>“Now I gotta go change. And take a cold shower.”</i>");
	
	IncrementFlag("KAEDE_PUBLIC_SHAME");
	processTime(4);
	pc.changeLust(10);
	pc.addHard(1);
	clearMenu();
	if (flags["KAEDE_EXHIBITIONISM"] != undefined && flags["KAEDE_EXHIBITIONISM"] >= 30) {
		addButton(0, "ULTRAMAX TEASE", ultraMaximumDeluxeTeaseTheSloot,undefined, "ULTRAMAX TEASE","Make Kaede clean herself up for the enjoyment of the other patrons.");
		addButton(1, "Let Her Go", justMaximumTeaseTheSloot);
	} else {
		output("\n\nShe gives you a look, stands up, and wraps her tail around her sullied crotch before hurrying out towards her ship. You just laugh to yourself and enjoy the rest of your drink.");
		IncrementFlag("KAEDE_FUCKED");
		addButton(0, "Next", mainGameMenu);
	}
}

//would be nicer as a lambda expression, if AS3 supports such wichcraft
public function justMaximumTeaseTheSloot():void
{
	clearOutput();
	showKaede();
	author("Savin");
	output("She gives you a look, stands up, and wraps her tail around her sullied crotch before hurrying out towards her ship. You just laugh to yourself and enjoy the rest of your drink.");
	IncrementFlag("KAEDE_FUCKED");
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

//[ULTRAMAX TEASE]
public function ultraMaximumDeluxeTeaseTheSloot():void 
{
	clearOutput();
	showKaede();
	author("Savin");
	output("“Oh, no,” you say, taking Kaede by the wrist when she tries to scurry off. “I've got a better idea.”");
	output("\n\nYou give her a tug, just enough to plant Kaede back in her seat. With your other hand, you reach down and yank down her fly, giving you access to the cum-soiled panties hiding underneath. Kaede yips and squirms, feeling your fingers crawling all over her cock; despite her murmured protestations, she manages to start stiffening before you've got your hands fully around her soiled underpants.");
	output("\n\nWith one rough yank, you rip her panties right off, pulling them out through her fly in a bunched-up ball of cum-soaked linens. Kaede yelps in surprise, only just managing to cover her mouth. You flash her a mischievous grin and roll her panties around in your hand, squeezing just hard enough to make them <i>squick</i> lewdly, bubbling up a little of her still-warm jizz between your fingers.");
	output("\n\n“Wow, you really made a mess!” you tease, tracing your other hand up Kaede's arm until you're running your fingers through the back of her ginger hair. No escape, now. “You'd better clean it up!”");
	output("\n\nKaede looks at you wide-eyed, blushing like a rose. “You... you... I can't...”");
	output("\n\n“You can,” you urge, putting her panties right in front of her face, so close that she can't breathe without getting a deep whiff of her own cum. You urge her with a gentle push from behind, mixed with encouraging words about what a dirty girl she is, and how hot it would be to see her eating her own cum in public. Considering how much of Kaede's inhibitions you've already worn down since you met, it doesn't take long before she gives you a little whimper and leans in, flicking her tongue out and into the mess of cloth between your fingers.");
	output("\n\n“That's it. Good girl,” you murmur into her ear, scratching through her hair as you shift her panties around, exposing more and more lurid cumrag for her to clean. While she works, you gently turn her around on the barstool, facing her out into the bar. After all her whimpering and moaning, there's more than a few pairs of eyes on the both of you now... and at least a few of them figure out what's going on, between the massive bulge threatening to poke out of Kaede's pants and the smears of white all over your fingers.");
	output("\n\nHopefully Kally won't notice what you're getting up to. But then, that's half the fun, isn't it -- the thrill of all these eyes on you and your blushing lover, getting hot under the collar at the sheer <i>taboo</i> of it... ");
	if (pc.hasCock()) {
		output("Now <i>you</i>'re starting to get hard!");
	} else {
		output("Pretty soon, Kaede's not the only one who's getting hot-and-bothered by the display you're putting on. You're real tempted to just grab the shameless little shemale and take her back to your ship... but that's a reward for after she debases herself.");
	}
	output("\n\nEventually, the ginger pupper's panties are pristine -- giant rip in them aside -- though now they're soaked with warm spittle rather than sperm. You can smell the musk of sex on Kaede's breath, moreso when you pull her into your lap and into a long, deep kiss. She's practically trembling, and her breath comes in ragged gasps around your [pc.lips]... and then catches in her throat when your hand traces down her chest to her crotch, delving into her still-undone fly and wrapping around the throbbing doggy-dick sheathed within. Now nobody in the bar could mistake what's going on, but you don't care anymore: let 'em look! It only makes you ");
	if(pc.hasCock()) {
		output("harder and ");
	}
	if (pc.hasVagina()) {
		output("wetter.");
	} else {
		output("more turned on.");
	}
	output("\n\n“[pc.name]!” Kaede whines, tensing in your arms. “I c- I can't!”");
	output("\n\n“Of course you can,” you reassure her, moving your wrist a little faster. “There's so many people watching now. You wouldn't want to let 'em down?”");
	output("\n\nShe makes a little noise that's somewhere between a whimper and a growl, and her fluffy red tail starts moving a little at your incessant, sweet urgings. All eyes are on that bulging package now, watching as your hand runs up and down Kaede's veiny length, from knot to tapered tip, faster and faster until her feet are scrabbling against your [pc.legs] and her ears are tucked against her scalp. Every breath is a husky moan, barely stifled into her hands, until Kaede gasps, and you feel a heat building up in her rock-hard cock.");
	output("\n\nCareful not to fully expose her rod, you shift your hand from her shaft to her crown, cupping it just in time for the first shot of hot lady-jizz to splash into your palm. The rest soon follows, ejaculating into your waiting hand amidst a chorus of whimpers and groans. Though a little of her orgasm manages to slip past, squirting out of her open fly or drooling down her thigh, you manage to catch most of the precious liquid load before you withdraw your hand.");
	output("\n\n“Eat up, pup,” you say, lifting your hand out of her crotch and up to her lips, feeling the steamy cream sloshing in your grasp. Kaede doesn't even feign resistance to your commands by this point: she opens wide and flicks her tongue out, slurping up the fresh load of cum like the hungry she-wolf she is. You nuzzle into the slutty puppy's neck while she cleans you off, kissing at her bare skin and whispering soothing words of love and lust into those big, drooped ears of hers. By the time she's got you nice and clean, with only the faintest stickiness in your digits to remind you of what was once overflowing in your hand, Kaede's breath has calmed to a slower tempo, and though you can feel her heart still hammering in her chest, it feels like she's finally accustomed to her role as an exhibitionistic ouroboros of her own jizz.");
	output("\n\n“You're the worst,” she murmurs when you pull your hand back, letting her slump heavily against you. “I swear, hanging out with you and Anno's gonna turn me into some kinda turbo-slut.”");
	output("\n\nAs if she's not already. You give Kaede a swat on the ass, pushing her up and out of your lap. “Better go get cleaned up,” you tell her. “And Kaede?”");
	output("\n\n“Yeah,” she says, already halfway out the door.");
	output("\n\n“Your fly's undone.”");
	
	IncrementFlag("KAEDE_FUCKED");
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

//Get a Room
//Take Kaede to one of the lodge’s rooms for some fun.
public function getARoomWithKaede():void
{
	clearOutput();
	showKaede(true);
	author("Savin");
	output("<i>“How about we get outta here?”</i> you suggest, reaching down and giving Kaede’s booty an affectionate squeeze.");
	output("\n\nKaede’s tail swishes as your hand gropes its way across her backside. <i>“I was hoping you’d say that. I’ve got a room here while I’m staying... how about we head on back?”</i>");
	output("\n\nSounds good. Kaede drops a credit chit to cover her tab and grabs your hand, leading you towards the lodge’s guest wing. It’s a short walk to Kaede’s door, each step punctuated by a rising chorus of little gasps and moans, drawn out by wandering hands and bending bodies. She swipes an access card over the lock and ushers you inside, hurriedly working her belt off and locking the door at the same time. The room’s simply furnished but cozy, with a queen-sized bed and a desk covered in Vesperian-themed knick-knacks taking up most of the space. A canvas bag full of clothes is the only evidence of Kaede’s residence.");
	output("\n\nYou grab the cute half-ausar by the hips and give her a rough push, throwing her face-up onto the bed. She yelps in surprise, turning into a giggle as you stalk up after her, straddling her hips and pulling her out of her leather jacket.");
	processTime(5);
	pc.changeLust(5);
	//[Fuck Her Ass] [Rocket Ride] [Invite a Friend]
	clearMenu();
	if((pc.hasCock() && pc.cockThatFits(370) >= 0) || pc.hasHardLightEquipped()) addButton(0,"Fuck Her Ass",fuckHerAssYouSlootAndByHerIMeanKaede,undefined,"Fuck Her Ass","Time to take this pretty puppy to pound-town.");
	else addDisabledButton(0,"Fuck Her Ass","Fuck Her Ass","You need a penis that fits in her butt to do this - or panties with a hardlight phallus.");
	addButton(1,"(A)Ride Rocket",rocketRideKaedesWangerDoodle,-1,"Anal: Ride Rocket","Catch a ride on Kaede’s throbbing red rocket, anally.");
	if(pc.hasVagina()) addButton(2,"(V)Ride Rocket",rocketRideKaedesWangerDoodle,0,"Vaginal: Ride Rocket","Catch a ride on Kaede’s throbbing red rocket, vaginally.");
	else addDisabledButton(2,"(V)Ride Rocket","Vaginal: Ride Rocket","You need a vagina to do this.");

	//Invite a Friend
	//See if there’s someone you and Kaede could invite over for some group fun...
	addButton(3,"InviteAFriend",inviteAFriendForKaedePlays,undefined,"Invite A Friend","See if there’s someone you and Kaede could invite over for some group fun...");

	if (pc.isLactating() && pc.biggestTitSize() >= 3) addButton(4, "Breastf. Kaede", breastfeedKaede, undefined, "Breastfeed Kaede", "Feed Kaede with your milky breasts.");
	else addDisabledButton(4, "Breastf. Kaede", "Breastfeed Kaede", "You need to have at least C-cup breasts and be lactating for this.");
}

//Fuck Her Ass
//Time to take this pretty puppy to pound-town.
//Cock or Hardlight
public function fuckHerAssYouSlootAndByHerIMeanKaede():void
{
	clearOutput();
	showKaede(true);
	author("Savin");
	var x:int = -2;
	if(pc.hasCock()) 
	{
		x = pc.cockThatFits(370);
		if(x == -1) x = -2;
	}
	if(x < 0 && pc.hasHardLightEquipped()) x = -1;
	if(x == -2) { output("ERROR. INVALID WANGER. DEFAULTING TO HARDLIGHT VARIANT. PLZ NOTIFY FEN.\n\n"); x = -1; }

	output("You lean down over the ginger pup, running your hands up her shirt until your palms are on her breasts, feeling her nipples pressing through the thin layer of cloth between your flesh and hers. Her breath catches as your thumbs brush across her stiff little peaks, spending a moment to rub and pinch them before reaching up and cupping her cheeks. She smiles up at you, inviting a kiss onto those rosy lips; her legs curl up around your [pc.hips], locking over your ass and pulling you in.");
	output("\n\nSometime during your lengthy entwinement, Kaede’s arms slip down and pull her shirt up, breaking your kiss when she peels it over her head. She’s gone braless, leaving her perky C-cups bouncing until you seize hold of them again, squeezing the sinfully soft mounds until she’s squirming and arching her back, pressing that little package of hers against your thigh.");
	output("\n\n<i>“What’s this?”</i> you grin, reaching down and wrapping your hand around her crotch. Something thick and knotty throbs just below her jeans, enticing you to undo her belt and shimmey her pants on down to show off that lush red rocket. The shaft bobbles in the air, swaying weightily until you push it down onto Kaede’s belly, trapping it between your bodies.");
	if(pc.isBimbo()) output(" As yummy as that dick looks, you’re thirsty for a piece of that ass instead!");
	else output(" You can’t wait to see her dick bouncing and leaking when you start digging into that sweet shemale ass.");

	output("\n\nBefore you can go much further, Kaede twists around underneath you and reaches for the nightstand’s drawer. She tosses you a little travel-sized bottle of lube and, while your hands are caught up with it, she ");
	//clothed: 
	if(x >= 0 && !pc.isCrotchExposed()) output("pulls your [pc.lowerGarments] out of the way and ");
	else if(!pc.isCrotchExposedByArmor()) output("pulls your [pc.armor] out of the way and ");
	//cock:
	if(x >= 0) output("wraps a hand around your [pc.cock " + x + "], stroking your hardening length.");
	//hardlight:
	else output("finds her way to the activation button hidden in your [pc.lowerUndergarment]. Your hardlight cock springs to life in a rush of sensation, forming a solid, glowing shaft of luminescent artificial cockflesh right into her hand.");
	output(" Kaede glances between the bottle and her hand around your [pc.cockOrStrapon " + x + "], smiling lasiviously up at you.");

	output("\n\n<i>“Just work it in for me,”</i> you tell her, tweaking one of her pink nipples. The bottle pops open with a flick of your thumb, and you start pouring a line of lube from your base to your crown, covering Kaede’s fingers as you go. As commanded, she starts stroking as soon as you’ve given her something to work with, using her hand to smear the cool liquid around in a nice, even glaze. All you need to do is sit back and enjoy the handjob, pouring on extra lube or groping Kaede’s cock and tits as you please.");
	output("\n\nBefore long she’s a mess, her belly slathered in run-off lube and her dick leaking a salty white from all the teasing, hard as a rock despite the lack of dedicated attention. <i>“Nice and ready,”</i> Kaede says, leaning up to plant a kiss on your ");
	if(x >= 0) output("[pc.cockHead " + x + "]");
	else output("hardlight crown");
	output(".");
	if(x >= 0)
	{
		output(" Her tongue runs across your slit");
		if(pc.cocks[x].cLength() >= 12) output(", probing into your gargantuan vein and");
		output(" lapping up the first sweet beads of pre she’s worked out of you already.");
	}

	output("\n\nAs nice as that is, you’ve got something other than Kaede’s mouth in mind. You grab her just under her breasts and heave your lover over, rolling her face-down on the bed with her tight little ass flush against the underside of your prick. She gives a little gasp of surprise, but her bright orange tail immediately curls up her back and out of the way, silently inviting you to do as you please with her defenseless backside.");
	output("\n\nYou give Kaede’s ass an appreciative spank, grinning as the flesh quivers at your touch. She grabs the pillow and hugs it to her chest, glancing back at you with wide, hungry eyes. <i>“Come on already! God, I want it!”</i>");
	output("\n\nThat’s what you like to hear. You plant your hands on her ass and use your thumbs to spread her cheeks apart, revealing the little star of her asshole tucked just behind her taut sack. The entrance seems to wink at you, clenching and unclenching with Kaede’s rising anticipation. The red shaft of her prick lies flat against the bed, thrust out between her legs. The soft swell of her knot pulses with her quickening heartbeat, and her veiny shaft drools whiteness as your [pc.cockOrHardlight " + x + "] closes on her tight tailhole.");
	output("\n\nThe tip of your glistening prick brushes across her opening, and Kaede’s tail flicks across her back in a nervous twitch. Your crown presses against her asshole, lubed and ready; all you need is to rock your [pc.hips] forward, pressuring her clenching star until it submits and opens for you, admitting the slow, steady ingress of your [pc.cockOrHardlight " + x + "]. You hear her breath catch; see her fingers digging into the sheets; feel her ass stretching and squeezing as you slide deeper and deeper inside her.");
	output("\n\nKaede’s legs curl up behind you, groping blindly at your ");
	if(pc.tailCount > 0) output("[pc.tail]");
	else if(pc.isTaur() || pc.isNaga()) output("bestial lower body");
	else output("backside");
	output(". Her whole body feels like it’s going wild, muscles spasming in a vain attempt to adjust to your thick " + (x >= 0 ? "manhood" : "sextoy") + " stretching out her ass. Your [pc.hips] roll forward, pushing more and more " + (x >= 0 ? "dickmeat" : "hardlight") + " into her until you’re sitting flush against her tight little rump, squeezing her hips between your [pc.legs] and letting your " + (x >= 0 ? "throbbing" : "projected") + " erection settle in her bowels. Your hands play across her butt, kneading the halfbreed’s supple, pale flesh between your fingers. Slowly, she starts to relax, finally getting used to your unyielding hardness stretching out her tailhole.");
	
	if(x >= 0) pc.cockChange();
	
	output("\n\n<i>“Okay. Okay...”</i> Kaede breathes between soft little moans. <i>“Startin’ to feel good back there. I think... I think it’s okay to move now.”</i>");
	output("\n\nYou didn’t know you were waiting on her permission, but now that you have it... Giving Kaede’s cheek an affectionate squeeze, you start to rock your hips back - a little more quickly than with your entrance - and Kaede starts moaning for you, oh-so-sweetly. No sense giving her time to recover now: you keep your [pc.hips] moving, sawing your shaft back out and in again, picking up speed with every thrust.");
	output("\n\nThe heavy, wet sounds of flesh slapping against flesh echo through the room, accompanied by Kaede’s whimpering grunts of pleasure and the creaking of the bedframe under you. Your hands plant themselves on Kaede’s shoulderblades, pushing the cock-hungry halfbreed into the sheets, letting your hammering crotch do the same to her ass. Kaede sinks into the bed, tail flicking against your [pc.face], her body completely at your mercy.");
	output("\n\nAnd she’s loving every second of it.");
	output("\n\nKaede’s tailhole squeezes hard around your thrusting dick, and you can feel something thick and meaty throbbing against your thigh, leaking to the beat of Kaede’s racing heart. A few moments later, she gives voice to it: <i>“O-oh fuck! Too much, too much, too-”</i>");
	output("\n\nKaede’s voice breaks into a cry of unrepentant anal pleasure. Her once-rhythmic squeezes around your [pc.cockOrHardlight " + x + "] become a wild barrage of sensation, gripping and grinding on your lube-slicked shaft. One particularly tight clench heralds a sudden rush of steamy, creamy heat across your [pc.leg]. You look down with a grin at the streak of white puppy-jizz splattered across your thigh and the now-sullied bedsheets.");
	if(pc.isNice() || pc.isBimbo()) output("\n\n<i>“Good girl,”</i> you whisper into one of Kaede’s big, ginger ears, nibbling at the edge. <i>“Let it all out for me.”</i>");
	else output("\n\n<i>“Bad girl!”</i> you chide, leaning into the orgasming pup’s back and nibbling on her ginger ear. <i>“You made a mess!”</i>");

	output("\n\nKaede whimpers, a lurid little whine of pleasure and embarrassment, even as her cock’s still squirting the little aftershots of her orgasm. With your [pc.chest] pressed against her back, you keep her pinned right where you want her while your [pc.hips] pound away, milking that sweet boy-clitty inside until she’s cum every last drop all over you, herself, and her bed.");
	output("\n\n<i>“K-keep going,”</i> she moans, twisting around to kiss you. <i>“I want your load inside me! I wanna feel it deep!”</i>");
	if(x < 0) output("\n\nWell, she’ll get as close to a load as your hardlight prick can give her....");
	else output("\n\nThen she better work for it, huh?");

	output("\n\nGrinning, you grab Kaede just under those perky tits of hers and flip her over. There’s a moment of intense tightness around your [pc.cockOrHardlight " + x + "], accompanied by a poof of ginger fur in your face and a yelp of surprise from the cum-drained puppy-slut. Her legs curl around your [pc.butt] and her cock flops half-hard on her flat belly, trembling with the rapid rise-and-fall of her breath.");

	output("\n\nThat’s more like it! You grab her tits for leverage and hammer your dick home as hard and fast as you can, letting the tight embrace of her tailhole wring out your inevitable climax.");
	if(x >= 0) output(" Between your final thrusts, your mind races to make a choice.");

	processTime(25);
	pc.changeLust(200);
	clearMenu();
	if(x >= 0)
	{
		addButton(0,"Cum Inside",cumInsideKaedesBootyButt,x,"Cum Inside","Cum in her butt.");
		addButton(1,"Facialize Her",facializeKaedeAfterBootyButting,x,"Facializer","Cum on her face.");
	}
	//else: Go right to Cum Inside
	else addButton(0,"Next",cumInsideKaedesBootyButt,x);
}

//[Cum Inside]
//Give Kaede what she wants: a nice, healthy filling of [pc.cum].
public function cumInsideKaedesBootyButt(x:int):void
{
	clearOutput();
	showKaede(true);
	author("Savin");
	if(x >= 0) output("Kaede’s body is begging for a filling, and you’re all too happy to give it to her. ");
	output("With a feral grunt of climax, you hilt yourself in Kaede’s ass and let loose the ");
	if(x >= 0) output("wave of [pc.cumNoun]");
	else output("orgasm");
	output(" that’s been building up deep in");
	if(pc.balls > 0) output(" your [pc.balls]");
	else output("side");
	output(". Kaede’s breath catches and her cock jumps to attention, standing straight up with all new arousal");
	if(x >= 0) output(" as [pc.cumNoun] floods into her hungry hole");
	output(".");
	if(x >= 0 && pc.cumQ() >= 5000) output(" You watch with giddy glee as her stomach bulges from the sheer inhuman size of your load, swelling with seed until the coochless pup looks positively pregnant.");
	else if(x >= 0) output(" You lean in and kiss her fiercely, moaning into her mouth as your [pc.cock] fills her bowels with [pc.cum].");
	else output(" Your hardlight prick feeds back a mind-melting cascade of pleasure, simulating a real cock’s orgasm - to you, it feels like you’re blowing a massive, pent-up wad deep in the half-ausar’s ass.");

	output("\n\nKaede sighs and rolls her head back into the pillows, finally getting a chance to catch her breath after that hard anal pounding. Nice and slow, you roll off her, dragging your [pc.cockOrHardlight " + x + "] out of that sodden fuckhole of hers.");
	if(x < 0) output(" You disengage the hardlight projector in your underwear, shivering as the trembling aftershocks of pleasure vanish.");
	else output(" Your [pc.cock " + x + "] slowly softens, smearing a last bit of [pc.cumNoun] across Kaede’s leg as it comes to rest between you.");

	output("\n\n<i>“They say the best sex is the messiest,”</i> Kaede grins, flicking a glob of spunk off her thigh. <i>“Okay, I’m gonna go get cleaned up. And then deal with these sheets...”</i>");
	output("\n\nYou laugh and give her booty an affectionate swat as she squirms out from under you. She winks over her shoulder at you and slips off into the bathroom, leaving you alone for a few minutes - time you use to catch your breath, gather you gear, and head back out.");

	processTime(15);
	pc.orgasm();
	IncrementFlag("KAEDE_FUCKED");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Facialize Her]
//Kaede would look better with a glaze of spunk all over her, don’t you think?
public function facializeKaedeAfterBootyButting(x:int):void
{
	clearOutput();
	showKaede(true);
	author("Savin");
	output("She might be begging for it inside, but you wanna see your lover covered with your seed. You keep your hips moving, thrusting into her hungry fuckhole until that familiar, swelling pressure of impending climax is all-consuming in your mind, threatening to overwhelm you. Only then do you push Kaede down into the bed and buck your hips back, drawing your [pc.cock " + x + "] out from her ass and angling it across the flat plane of her belly and towards those big blue eyes, wide with surprise.");
	output("\n\n<i>“Wha...?”</i> Kaede starts, just in time for the first pent-up shot of [pc.cum] to shoot across her face. Steamy spooge splatters all over her chin and lips, followed by a second shot that gives her a glistening necklace of pearly white. The rest of your orgasm washes across her tits and belly, smearing over the pale flesh into a glistening [pc.cumGem] glaze. She whines and flicks a finger through the thick slop of jizz spreading over her chest, spreading it out like hot webbing.");
	output("\n\n<i>“You’re the worst,”</i> she smirks, licking her fingers clean. Kaede giggles, flicking her tail at the underside of your [pc.cock " + x + "] until the tickles milk out the last drops of your orgasm to drool across her legs and crotch. <i>“But I guess getting covered is just as good as getting filled... even if I’m gonna need a shower, now. Lemme go get cleaned up.”</i>");
	output("\n\nKaede leans up, plants a quick kiss on your cheek, and squirms out from under you. She saunters off towards the bathroom, leaving you with a few free minutes to catch your breath and gather your gear before heading on out.");

	processTime(15);
	pc.orgasm();
	IncrementFlag("KAEDE_FUCKED");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Rocket Ride
//Catch a ride on Kaede’s throbbing red rocket.
//VagOrAss scene
public function rocketRideKaedesWangerDoodle(x:int):void
{
	clearOutput();
	showKaede(true);
	author("Savin");
	
	var ppKaede:PregnancyPlaceholder = getKaedePregContainer();
	if(x == 0) x = rand(pc.totalVaginas());
	
	output("A hungry grin spreads across your lips when you feel something thick and hot pressing against your [pc.butt], tenting Kaede’s blue jeans and rubbing against your thigh. Slowly, you lean down over Kaede, stretching out so that your [pc.belly] presses against her taut stomach, and your chin comes to rest just past her perky little tits.");
	output("\n\n<i>“You’re so " + pc.mf("handsome","beautiful") + ",”</i> she murmurs, sitting up on her elbows and staring at you with those big, blue eyes of hers. You can’t help but " + pc.mf("chuckle","giggle") + ", leaning in and planting a kiss on those rosy lips of hers. Your tongue slithers out, slipping through the bridge of your kiss to entwine with her own; all a distraction while one of your hands traces down her tummy and straight down her pants.");
	output("\n\nThat sure gets her attention! Kaede gasps, squirming as your fingers tickle the tip of her pecker before wrapping around it, helping the throbbing shaft find its way out of her pants. Something hot and slimy drools onto a finger, just before you free Kaede’s trouser snake from its confines. It bobbles and wobbles, coming to a standstill sticking straight up at your [pc.butt] with your hand wrapped around the girthy bulge at its base.");
	output("\n\n<i>“Puppy’s got such a nice bone,”</i> you smirk, giving her cock a loving little stroke. <i>“Mind if I play with it?”</i>");
	output("\n\nKaede nods breathlessly, eyeing you lustfully as your [pc.butt] wavers over her tapered crown. Though you definitely have her attention now, you decide to give the eager puppy a show. You shimmy out of your gear, groping at and caressing yourself at every opportune moment, keeping your pet pooch in rapt attention. Her eyes follow your movements, eventually settling on your [pc.chest] as the last of your equipment clatters to the deck.");

	if(pc.biggestTitSize() >= 1) 
	{
		output("\n\nKaede reaches up and cups your [pc.chest], running her thumbs across your [pc.nipples]. Ooh, that feels nice. You grin down at her and return the favor, slipping her cock between ");
		if(pc.hasVagina()) output("the lips of your [pc.cunt]");
		else output("the cheeks of your [pc.butt]");
		output(" and rocking your hips for her. That just elicits a moan from your lover, and her hands zip down to grip at your [pc.hips].");
	}
	else 
	{
		output("\n\nKaede reaches up and grabs your [pc.butt], sinking her fingers in and trying to guide you to onto her needy cock. You playfully refuse, making the poor girl work for it: she moans and bites her lip, trying to wrestle you down. After a few teasing moments, you allow it - but you redirect her tapered crown, burying it between ");
		if(pc.hasVagina()) output("the lips of [pc.oneVagina]");
		else output("the cheeks of your [pc.butt]");
		output(" and rocking your hips for her. That just elicits a moan from your lover, and her hands zip down to grip at your [pc.hips].");
	}
	
	output(" ");
	if(x >= 0) pc.cuntChange(x, ppKaede.cockVolume(0));
	else pc.buttChange(ppKaede.cockVolume(0));
	
	output("\n\n<i>“You tease!”</i> Kaede whimpers, squirming under you. <i>“J-just take it already, would ya?”</i>");
	//Misch/Bimbo:
	if(pc.isMischievous() || pc.isBimbo()) output("\n\n<i>“Say please,”</i>");
	else output("\n\n<i>“Only if you ask nice,”</i>");
	output(" you grin.");
	output("\n\n<i>“P-please?”</i> your lover whines, dick urgently throbbing against your entrance. <i>“I want it so bad.”</i>");
	output("\n\nYou smile knowingly and shift overtop her, aligning the pointed pinnacle of her prick with your [pc.vagOrAss " + x + "]. She gasps, biting her lip and trying to hold back a moan as you slowly ease yourself down. You stop again, just as the first inch of steamy cockmeat presses into your entrance. Pausing a moment to enjoy that sensation of being spread open, slowly but surely, inch by inch... you shudder and let your eyes flutter closed, letting gravity do the hard work of dragging you down Kaede’s cock and into her lap.");
	output("\n\nA few seconds later, you’re nestled onto Kaede’s crotch and basking in the wonderfully hot fullness of ausar cock. Underneath you, your lover’s breath comes in ragged little gasps, and her hands squeeze down on your hips. Your wiggle your [pc.butt] over the slowly-stiffening knot, giving her a thrill until you’ve adjusted to her straining girth.");
	output("\n\n<i>“Better?”</i> you ask, giving one of Kaede’s nipples a playful tweak.");
	output("\n\nShe gasps, tail thumping against your [pc.leg]. <i>“Oh yeah... much. Nothing better than being in one of my best friends.”</i>");
	output("\n\nKaede manages to control herself enough to smile and rock her hips, bouncing you in her lap. You let her take the lead for a moment, bracing yourself on her chest and spreading your cheeks for the thrusting spear of crimson cockflesh. Pretty soon, the little room is echoing with the heavy sounds of flesh slapping flesh, and your [pc.butt] is jiggling with Kaede’s constant thrusts. For such a shy thing, once she gets going, Kaede can be an absolute beast - she’s grunting and gritting her teeth, throwing everything she can into pleasuring your ");
	if(x >= 0) output("pussy");
	else output("behind");
	output(".");
	output("\n\nSo much so that one particularly deep thrust into your [pc.vagOrAss " + x + "] hammers your hole with the now-turgid ball of knotty bitchbreaker at the base of Kaede’s cock. Rather than back off, Kaede’s grip on your [pc.hips] yanks you down hard on her knot, and you shriek with pleasure and shock as you’re tied down.");
	output("\n\n<i>“Oh <b>fuck</b>!”</i> you yelp, gasping for the breath that she just knocked out of you.");

	output("\n\nKaede giggles, but that gets cut off in the blink of an eye when you squeeze your ");
	if(x >= 0) output("pussy’s");
	else output("anal");
	output(" muscles for her, turning into a long moan. Her back arches off the bedsheets, and you feel that familiar wetness of pre bubbling up inside you, almost ready to burst. You smirk and cup Kaede’s tits, whispering sweet nothings about how she’s such a good, pretty girl... and that she should let it all out and cum for you. All the while, you start to move your hips, rocking back and forth on her throbbing, cum-swollen knot, working to milk that sweet puppy-spunk out.");
	output("\n\nYour urging is all she needs. Kaede gasps, going rigid in your hands, and her dick thrusts as deep into you as her little hips can push it. Her knot makes one mighty pulse, balls churning with all that pent-up cream, before steamy, sticky cum splatters all inside your ");
	if(x >= 0) output("pussy");
	else output("bowels");
	output(". Now it’s your turn to moan, putting a hand on your [pc.belly] as you’re pumped full of the puppy’s seed.");

	output("\n\nAll you need to do is keep moving, tugging on Kaede’s knot with your [pc.vagOrAss " + x + "] to milk her dry. Feeling her cock spurt and wobble around in your ");
	if(x >= 0) output("slit");
	else output("ass");
	output(" just adds to your own pleasure: she’s tied herself at just the right depth to ");
	if(x >= 0) output("put pressure on the underside of your clit, rubbing you through your hood with every little motion");
	else if(pc.hasCock()) output("grind against your prostate, making your [pc.cocks] jump to attention and start drooling all over Kaede’s belly");
	output(".");

	output("\n\nA minute of bouncing on her knot later, and you’re cumming your brains out for her, ");
	//dick:
	if(pc.hasCock()) output("painting her tits and neck with a streak of [pc.cum]");
	if(pc.isHerm()) output(" and ");
	if(pc.hasVagina()) output("drooling femcum down her crimson shaft");
	if(!pc.hasGenitals()) output("squeezing your ass for her as your sexless body climaxes");
	output(". When you finish moaning through your orgasm, it all at once feels as though all the breath has gone out of you - along with all the tension and stress of your long journey, all the worry of the day...");
	output("\n\nYou slump down overtop Kaede, resting your cheek against one of her sinfully soft little breasts. There’s a thin, glistening sheen of sweat built up from her vigorous fucking, but her cleavage is still nice and cool for you. Kaede giggles when you nuzzle up, wrapping her big ginger tail around your [pc.butt] and pulling the sheets up over you both.");
	output("\n\n<i>“Hope you’re comfortable,”</i> she murmurs, yawning and reaching up for the lights. <i>“Gonna be stuck there awhile.”</i>");
	output("\n\nYou smile up at her and slip your arms around her. <i>“Nowhere I’d rather be...”</i>");
	processTime(35);
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	if(x >= 0) pc.loadInCunt(ppKaede, x);
	else pc.loadInAss(ppKaede);
	IncrementFlag("KAEDE_FUCKED");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Invite a Friend
//See if there’s someone you and Kaede could invite over for some group fun...
public function inviteAFriendForKaedePlays():void
{
	clearOutput();
	showKaede();
	author("Savin");
	output("See if there’s someone you and Kaede could invite over for some group fun...");
	clearMenu();
	if(annoIsCrew()) addButton(0,"Anno",annoAndKaedeAndPCAndSufferingRIPLeira,undefined,"Anno","Kaede’s BFF is right on your ship. Wouldn’t take her but a moment to come on over for some fun.");
	else addDisabledButton(0,"Anno","Anno","You need Anno on your crew for this.");
	addButton(14,"Back",getARoomWithKaede);
}

//[Anno]
//Someday I’ll do a Cass and a Kally and a Saendra threesome. //FEN NOTE: FUCK YES.
public function annoAndKaedeAndPCAndSufferingRIPLeira():void
{
	clearOutput();
	showName("ANNO &\nKAEDE");
	showBust(annoBustDisplay(true), "KAEDE_NUDE");
	author("Savin");
	output("<i>“Let’s see if Anno’s up for some fun,”</i> you suggest, whipping out your Codex and switching to its camera view. You take a quick snapshot of Kaede sprawled out on her bed and send it Anno’s way, invitation clear.");
	output("\n\nWhat seems like only a few seconds later, you hear a knock at the door. Kaede hops up to answers it, and is immediately pulled through the threshold into a hug with her face smooshed into Anno’s cleavage. Her tail shoots straight out behind her, and you hear a muffled yelp of surprise from somewhere between Anno’s tits.");
	output("\n\n<i>“Hey, babe,”</i> Anno giggles, ruffling Kaede’s hair. <i>“Hi, boss. How’s it hangin’?”</i>");
	output("\n\nBetter, now that she’s here. Anno grins and runs her hands down Kaede’s back, squeezing the halfbreed’s ass.");
	output("\n\nThe snowy-haired ausar commands the lights to dim <i>“to something sexy.”</i> The room’s V.I. turns the illumination way down to a sultry, dusky hue, just enough to see the red of Kaede’s hair and tail as Anno slips her arms around her girlfriend’s waist, pulling her into a kiss, passionate and, more intimate than the playful gropes: their chests press together, lips parting to allow their tongues to explore each others’ mouths.");
	pc.changeLust(20);
	processTime(4);
	clearMenu();
	//[Fuck Them] [Service Kaede] [Watch Them]
	if (pc.hasCock() && (pc.cockThatFits(370) >= 0) && (pc.cockThatFits(anno.vaginalCapacity()) >= 0)) addButton(0, "Fuck Them", fuckTheseLoveyDovey);
	else if(pc.hasCock()) addDisabledButton(0, "Fuck Them", "Fuck Them", "Your penis is too big for that!");
	else addDisabledButton(0, "Fuck Them", "Fuck Them", "Requires a penis.");
	addButton(1, "Service Kaede", kaedeAndAnnoServiceKaedeFromCanadia);
	addButton(2, "Watch", watchAnnoAndKaedeYaSloot);
}

//Fuck Them
//Fuck these two lovey-dovey puppysluts.
//PC needs a cock
public function fuckTheseLoveyDovey():void
{
	clearOutput();
	showName("ANNO &\nKAEDE");
	showBust(annoBustDisplay(true), "KAEDE_NUDE");
	author("Savin");
	var x:int;
	if (pc.hasCock())
	{
		var tarVolume:int = 370;
		if (anno.vaginalCapacity() < tarVolume) tarVolume = anno.vaginalCapacity();
		
		x = pc.cockThatFits(tarVolume);
		if(x < 0)
		{
			output("<b>ERROR: " + pc.smallestCockIndex() + " " + pc.smallestCockVolume() + " " + pc.hasCock() + " THIS SHOULDN’T HAPPEN. ERROR CODE: PEANUTBUTTER. PLEASE COPY PASTE THIS IN A BUG REPORT SO THAT IT CAN BE FIXED.</b>");
			x = pc.smallestCockIndex();
		}
	}
	output("After a few moments, though, the two ausars turn their attentions to you: hand in hand, they slink over to you with big, lusty smiles, eyes entirely focused on your [pc.cock " + x + "]. You quickly toss your gear aside and sit back on the edge of the bed, leaving yourself bare to the randy girls’ ministrations. Kaede’s normal nervousness is nowhere to be seen now: she even licks her lips at the sight of your manhood, and is the first of the pair of drop to her knees in front of you. Anno stands behind her for a moment, giving you a proud wink as her girlfriend wraps her fingers around your [pc.cock " + x + "] and gives it a tentative stroke.");
	output("\n\n<i>“Red here’d never admit it,”</i> Anno says over her lover’s head, leaning in conspiratorially, <i>“but she was a the best little cocksucker back in college. You should see her handle three dicks at-”</i>");
	output("\n\nKaede goes beet red. <i>“Hey! Shut up and get down here, slut.”</i>");
	output("\n\n<i>“Yes, ma’am,”</i> Anno giggles, ");
	if (anno.armor is AnnosCatsuit) output("pulling down her zipper");
	else output("pulling off her shirt");
	output(" and slipping down to her knees beside Kaede. With both ausars in position, there’s a moment of squabbling for position before Kaede finally lunges forward and wraps her lips around your prick. Your breath catches as the eager halfbreed’s lips and tongue caress your [pc.cockHead " + x + "], bathing the first inches of your [pc.cock " + x + "] in pleasure.");

	//Append their normal threesome from here on out
	annoxKaedeFuckThemFromKaedeBeej(x);
}

//Service Kaede
public function kaedeAndAnnoServiceKaedeFromCanadia():void
{
	clearOutput();
	showName("ANNO &\nKAEDE");
	showBust(annoBustDisplay(true), "KAEDE_NUDE");
	author("Savin");
	output("You take the opportunity to slip off your [pc.gear], tossing your equipment aside. While you do, Anno busies herself on her lover, letting Kaede take the initiative on disrobing her while Anno kisses and caresses the halfbreed. It takes a while for Anno to be fully bared to you, but the show they put on in the meantime is well worth the wait, and you’re already ");
	if(pc.hasCock()) output("rock hard");
	if(pc.isHerm()) output(" and ");
	if(pc.hasVagina()) output("dripping wet");
	if(!pc.hasGenitals()) output("flushed with arousal");
	output(" by the time the last of Anno’s outfit hits the floor. With a wiggle of her tail, Anno beckons you over and together you slink down to the deck, putting you both on-level with the mounting bulge of doggycock straining against Kaede’s jeans.");

	//Append their normal threesome from here on out
	continueServicingKaedeWithAnno();
}

//Watch Them
public function watchAnnoAndKaedeYaSloot():void
{
	kaedeIncreaseExhibitionism(3);
	
	clearOutput();
	showName("ANNO &\nKAEDE");
	showBust(annoBustDisplay(true), "KAEDE_NUDE");
	author("Savin");

	output("You ");
	if(pc.legCount == 2) output("find a chair and ");
	output("have a seat, leaning back to enjoy the show. And what a show it is. Kaede is nervous and shy at first, but Anno soon breaks her out of it, sensually stripping off her lover’s jacket and shirt before moving on to her bra, each motion slow and exaggerated, making sure to tease and tantalize you both with the sight of Kaede’s tits. Finally, she lets her lover’s boobs bounce free. Kaede gasps, raising an arm to cover herself before Anno stops her and redirects that arm to her own hip. With this done, she slips behind her lover, looking at you over Kaede’s shoulder.");

	//Append their normal threesome from here on out
	watchThemKaedeAndAnnoContinuationSplice();
}

//Add to Kaede's Canadia sex scene roster. PC must be milky and have C+ cups.
public function breastfeedKaede():void
{
	clearOutput();
	showKaede(true);
	author("Savin");

	output("Rather than getting right to molesting the panting pup's perky tits or her throbbing prick, you slowly slip out of the last of your gear, running your hands over your [pc.breasts] and locking your fingers around your [pc.nipples]. A little bead of [pc.milk] leaks out of your stiffening teats, accompanied by a little moan from the back of your throat. Kaede's eyes are locked on your chest now, and she bites her lower lip hungrily. Between your [pc.legs], you can feel her turgid red rocket struggling to punch through her pants to get at your [pc.vagOrAss].");
	output("\n\n<i>“Easy, girl,”</i> you coo at her, resting a [pc.milkType]-stained hand on her chest, right between her own little rack. <i>“My [pc.boobs] are so full... think you could help me out with that?”</i>");
	output("\n\nKaede's nodding eagerly before you're halfway through speaking. You favor her with a little smile and slip your hands under the pits of her arms, pulling Kaede up into a position where you can cradle her with her face nestled into your rack. Her cheek brushes one of your [pc.nipples], drawing a little shudder of pleasure from you as Kaede's slender lips latch around it.");
	output("\n\n<i>“Good girl.”</i> You praise her and stroke her cheek, feeling the first little spike of pressure around your teat. The weight of your lactation builds up just under the surface, only slowly releasing amid the first gentle suckles of your half-ausar lover. Kaede's hand plays across your breast, caressing the [pc.skinFurScales] before moving onto the other boob and squeezing until a bit of [pc.milk] beads out.");
	output("\n\nYou echo your previous praise; soft, meaningless words murmured into the submissive girl's wolf-ear while she drinks deep of your bounty. You watch with amusement as her jeans' crotch tents with the steady throbbing of her erection. It's almost sad to keep such a cute thing pent up in there, so while you whisper in Kaede's ear, you slip your hand down her belly, tickling the bare flesh until your fingers find her zipper. You barely have to tug before her dick does the rest of the work, springing free with a gasp that sends quivering shockwaves through your boobflesh.");
	output("\n\nYour fingers wrap around the veiny red shaft of Kaede's dick, starting to stroke up and down her modest length. The knot of crimson flesh at her base quivers, starting to swell with her flaring lusts. She moans, hips squirming under your pistoning hand, but her lips refuse to detach from your [pc.nipple] until your boob is about as drained as it can be. Trickles of loose [pc.milk] run down Kaede's cheek and chin, drooling into her mess of ginger hair. Stars, she's insatiable!");
	output("\n\nGrinning down at the lusty puppy, you shift her from one breast to ");
	if (pc.totalBreasts() > 2) output("an"); 
	else output("the ");
	output("other, giving her a fresh source of [pc.milk] to suckle from. Speaking of milk, though, you can't help but notice the thin veneer of pre-cum starting to trickle down from the tapered tip of her throbbing tool. Kaede doesn't seem to even acknowledge your work down there, completely content to let you do whatever you want with her while she's busy nursing.");
	output("\n\nYou whisper something about not holding back into Kaede's ear, and as if on command, you feel her cock stiffen in your hand. A couple more strokes and her hips lift up off the bed, and a mighty throb heralds a rush of steamy white cream geysering from her crown. A yip of pleasure escapes Kaede's lips around her mouthful of tit, but you're much more interested in what's escaping her dick, splattering all over your fingers and her thighs and belly.");
	output("\n\n<i>“What a good girl,”</i> you coo. <i>“Give me all that ");
	if (silly) output("goo");
	else output("cum")
	output(".”</i>");
	output("\n\nLike she could hold back even if she wanted to. Kaede's balls empty their load in a heartbeat, leaving her softening everywhere but the turgid bitch-breaker you've wrapped your fist around. You let all her sweet spunk drool down around your fingers, coating them in pearly seed before you start moving again, just like before. Her cum's the perfect lube to keep jerking her off, gliding your hand up and down her wilting shaft until Kaede's squirming and moaning, and her dick starts standing back to attention.");
	output("\n\n<i>“[pc.name]!”</i> Kaede whimpers, bucking her hips against your hand. <i>“I... I can't... aaahh!”</i>");
	output("\n\nAnother, smaller stream of puppy cream pumps out of her dick and onto her belly, barely two minutes after the first shot. Kaede finally breaks off from your tits with a whine of unbridled pleasure, gripping you tightly as you milk out her second load hot on the heels of the first.");
	output("\n\nThe last little dribble of milk rolls down your [pc.boobs], dripping onto Kaede's cheek. She's totally lost focus on her milky meal, though, fixating on your incessant tugging on her dick. Two orgasms in and you're still not content to let up, not yet anyway. This poor puppy's gotten herself so backed up, you're sure you can wring at least one more cumshot out of her. She's made so much lube for you, after all... it'd be such a shame to waste it.");
	output("\n\nKaede buries her face in your [pc.milk]-stained cleavage, trying not to whimper with overstimulated pleasure as your hand works its magic up and down her dick, over and over again. Her rock-hard knot greets your fist at every downward pump, trembling with primal passion -- and heralding a constant dribble of cum from her turgid tip. She's leaking like a faucet now, every little twitch making more and more puppy pre spill down her girthy dog-tool.");
	output("\n\n<i>“Ah! You're... ah, you're worse than Anno!”</i> Kaede whimpers, clutching at your shoulders. <i>“Always doing this to me!”</i>");
	output("\n\n<i>“Your dick's not complaining,”</i> you chide, moving your wrist a little faster. <i>“Or do you really want me to stop?”</i>");
	output("\n\nKaede gasps, curling her legs in as you start properly jacking her. <i>“N-no! I didn't say that! I don't... don't stop.”</i>");
	output("\n\nYou move your free hand up from Kaede's back to her cheek, pulling her out of your tits long enough to say, <i>“That's my girl,”</i> before pulling her into a long kiss. She absolutely melts in your embrace, going limp everywhere but her prick and the lips playing back across your own. That precious puppy pecker in your hand quivers in time with your kiss, heralding the biggest eruption of Kaede's cum yet. A thick spurt of white sails into the air, coming down in a wet mess all over Kaede's thighs. Her tail goes stock-straight under her, and Kaede's lips lock around yours in a silent ring of gasping, wordless pleasure.");
	output("\n\nWhen you finally break the kiss, you've left Kaede breathless, panting for pleasure as she slowly comes down off her orgasmic high. She's absolutely drenched in cum and [pc.milk]. but the way she looks at you, eyes wide and starry... you know she loved every minute of it. So you just hold the tuckered-out dickgirl close, and let the time pass you by...");

	pc.milked();
	processTime(30+rand(10));
	
	IncrementFlag("KAEDE_FUCKED");
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

//Time Runs Out
//Play the first time the PC visits Kaede after the timer runs out on her stay on New Canada.
public function timeRunsOutForKaede():void
{
	clearOutput();
	showKaede();
	author("Savin");
	output("Seeing Kaede still at her usual spot by the bar hunched over a drink, you start making your may way over. You make to throw your arms around her for a surprise hug, but stop yourself short when an unfamiliar, disembodied woman’s voice pipes up from the holoband on Kaede’s wrist:");
	output("\n\n<i>“Captain, everything’s ready down here. I’m sorry we couldn’t learn more, but the results have been somewhat informative, at least.”</i>");
	output("\n\nKaede sighs and runs a hand through her hair, between her towering red ears. <i>“Yeah, don’t worry about it. I’ll be down in a few to pick you up. Thanks for sticking with this, Athena.”</i>");
	output("\n\n<i>“Of course, captain,”</i> the voice says, then cuts off. Kaede hammers back the rest of her drink and then spins around on her barstool and tries to stand - and mashes her face right into your [pc.chest].");
	output("\n\n<i>“Oof!”</i> she grunts, recoiling off you and right back into her seat. <i>“O-oh! Hi, [pc.name]. Sorry, I didn’t see you there. Uh, wanna... wanna sit?”</i>");
	output("\n\nYou grin and tell her it’s alright, but it sounds like she was just leaving...");
	output("\n\nKaede chuckles nervously and leans back on the bar, gesturing for you to sit with her. <i>“Yeah, I’m finally heading out,”</i> she says, putting a hand on your [pc.leg]. <i>“Gosh, it feels like I’ve been here forever now... and it’s been great seeing you so much! But I’m running on empty in the bank account, and the research I needed done down on the planet’s finished, so it’s time to pack up and get back on the space lanes. You know how it is.”</i>");
	output("\n\nYeah, you do. Before she goes, though, you do have a question: who was that calling her captain over the commlink? Her ship’s V.I.?");
	output("\n\nShe nods. <i>“Yeah. Athena’s her name. She’s down on Vesperia, waiting for me to pick her up. I had a friend down there at the university trying to help answer a few questions about her. Didn’t really work out, but I’ve got some new insights into my, uh, problems with her.”</i>");
	output("\n\n<i>“Problems?”</i> you ask. First you’ve heard about this.");
	output("\n\n<i>“Um, maybe that’s too strong a word for it. I got Athena right at the start of the Rush; I got her when I made it out of a triple-cross between some pirates that I kinda got stuck in the middle of. Long story. But I’ve noticed a lot of... weirdness... in her programming over the last few months, and she can’t explain any of it, so I had Anno hook me up with an expert. Guess it didn’t help much, so I’ll have to keep looking.”</i>");

	//Beat KaraQuest 2:
	if(flags["KQ2_QUEST_FINISHED"] != undefined && flags["KQ2_QUEST_FINISHED"] > 0)
	{
		output("\n\nHer explanation triggers a memory, and you spend a moment staring at her, brow furrowed, trying to think of exactly what. Then it comes to you: that A.I. you encountered in the base on Myrellion!");
		output("\n\n<i>“I don’t suppose this has anything to do with the Black Void?”</i> you whisper, careful to keep anyone nearby from hearing.");
		output("\n\nKaede’s eyes go wide, and her tail stiffens behind her. <i>“H-how did you know? Never mind, yeah, you’re right: they were one of the pirate groups. I think they might have made Athena, or somebody stole her from them anyway. That’s one of the reasons I’ve been keeping my head down on the frontier lately, trying to be real hard to find. I’m just surprised they haven’t come after me yet. Maybe I got away in the clear, who knows.”</i>");
		output("\n\nShe chuckles nervously again, wiping her brow with the sleeve of her leather jacket. <i>“A-anyway, I should, uh, I should go. See you around, [pc.name].”</i>");
		output("\n\nShe hops up and plants a kiss on your cheek, slipping around you and out the door before you can say another word.");
		output("\n\nGuess she doesn’t wanna talk about it...");
	}
	//Didn’t Beat KQ2:
	else
	{
		output("\n\nSounds rough. You wish Kaede good luck, which earns you a kiss on the cheek as she hops to her feet.");
		output("\n\n<i>“Thanks, [pc.name]. It’s been great getting to spend some time with you - maybe when you’ve got your whole C.E.O. thing down and I’ve struck it rich, you me and Anno can get away somewhere for a while?”</i>");
		output("\n\nNow that’d be nice.... You give Kaede a parting smack on the ass, making that fluffy ginger tail of hers swish. She giggles and gives you a wink over her shoulder. <i>“It’s a date then! See you on the space lanes, captain!”</i>");
	}
	flags["KAEDE_CS_COUNTDOWN"] = -1;
	processTime(10);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Bonus 4 Fen: Kaede Finds the Gloryhole
//Possible option when the player opts to man the gloryhole.
public function kaedePopsIntoZeGloryHole():void
{
	kaedeIncreaseExhibitionism(5);
	
	clearOutput();
	showKaede(true);
	author("Savin");
	//One time only
	output("A few moments after you’ve sealed yourself into the stall, you hear the restroom door open and a pair of light footsteps head your way. A whispered, feminine voice mutters something you can’t quite make out, and the stall next to yours opens and closes around the new occupant. You see a pair of black leather boots and blue jeans under the divider, shuffling towards you. The voice mumbles, <i>“Wow, they weren’t kidding. I thought these things only existed in pornos.”</i>");
	output("\n\nDutifully, you scoot up to the closest of the holes and ready your mouth to service the curious <i>“customer”</i> when she inevitably decides to stick something through.");
	output("\n\nIt doesn’t take much consideration before you hear a zipper working, a giggle, and then a juicy little red rocket pokes through the hole. It bobs to the beat of its owner’s heart, bouncing off the silky-smooth curves of the hole. It’s nice and tapered at the tip, curving down from a plump knotty base to a pointy crown that wafts its salty, earthy scent just over your [pc.lips]. Your cock-sucking instincts take over, and you find yourself leaning in and planting a kiss right on that cunt-splitter’s tip.");
	output("\n\nWhoever’s on the other side gasps, and the veiny red shaft yanks back from you, almost completely out of the hole.");
	output("\n\n<i>“H-holy shit!”</i> the voice on the other side yips. <i>“S-sorry! I didn’t expect anyone to actually... uh... I mean...”</i>");
	output("\n\nAww, how cute. She’s so shy! You gently wrap your fingers around the half a dick still in your stall and urge it back in. With some reluctance, its owner allows you to guide her back to where that pretty pecker belongs: in your mouth. You needn’t open wide for a slender crown like hers, but rather plant another series of kisses along the tip, letting her hips and your guiding hand slowly part your [pc.lips] and feed you the first inches of dogmeat.");
	output("\n\nThe taste is exquisite, the perfect combination of sweaty, musky masculinity tempered a sweetly feminine scent like lilac perfume. Your [pc.tongue] flicks across the bottom of her prick, lathering it up from peak to knot, sucking gently until she’s fully lodged inside your mouth, and your lips are wrapped snuggly around her muscular tie. The dickgirl on the other side of the divider moans, clawing her hands against the thin metal separating you, unconsciously trying to draw you deeper down her throbbing shaft.");
	output("\n\n<i>“O-ooh, you’re real good at this!”</i> the girl murmurs, throbbing in your mouth. <i>“Keep going...”</i>");
	output("\n\nYou do, of course - slathering her dick with your tongue, working the base with your hands, worshipping her growing bitch-breaker - but you can’t shake a feeling of familiarity. Her voice, that outfit, this cute lil’ dick...");
	output("\n\n<i>“Gayd?”</i> you mumble around your mouthful of dick.");
	output("\n\n<i>“Huh?”</i> the girl says. Eh, no need to ruin a good beej by surprising Kaede. You just keep sucking her pretty pole, bobbing your head up and down until your outburst is forgotten, and she’s back to moaning banging her hips against the wall. The way she’s going, you barely need to do anything - not that that stops you from sating your cocklust as vigorously as you can, enjoying the taste of dickmeat and, pretty soon, a salty cream that she starts drooling onto your [pc.tongue].");
	output("\n\nOooh, now <i>that</i>’s the stuff. You wrap your fingers around the now-turgid bulb of Kaede’s knot, squeezing it as you slurp on her shaft, milking up all that yummy cum until, with a whining yelp and a thrust that makes the entire stall shudder, Kaede busts a thick, creamy nut right down your throat. Your slip your [pc.lipsChaste] down straight to the knot, swallowing down every drop of the shemale’s salty seed. Only when she’s spent her balls’ load in its entirety do you pull back, wiping your lips and breaking the lingering bridges of saliva still connecting you to Kaede’s softening puppy-cock.");
	output("\n\n<i>“Whew! That was... that was a surprise. Thanks!”</i> Kaede murmurs, tearing off some tissue and cleaning herself off. <i>“So, uh, d-do I pay you or something...?”</i>");
	output("\n\nYou chuckle. <i>“Nah, that one’s on me, Kaede.”</i>");
	output("\n\n<i>“[pc.name]?”</i> Kaede yelps, crouching down and sticking her eye into the gloryhole. <i>“W-what are you... really!?”</i>");
	output("\n\nYou wave, then step out of the stall, meeting Kaede on the outside. She’s blushing like a half-human tomato, tail curled around a leg and ears tucked down against her scalp. You laugh and ruffle her messy ginger hair, telling her she was a lovely blowjob-ee.");
	output("\n\n<i>“Thanks? I should, uh, um, I’m gonna go get another drink...”</i>");
	output("\n\nYou send her on her way with a spank, and a longing glance back at the stall...");
	processTime(30);
	//Syri seems like a good placeholder...
	pc.loadInMouth(syri);
	IncrementFlag("GLORYHOLE_SERVER");
	flags["GLORYHOLED_KAEDE"] = 1;
	pc.changeLust(10);
	
	IncrementFlag("KAEDE_FUCKED");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//add to kaede's exhibitionism score. 
//There is no smart way to put it, but here is the main payoff for high kaede exhibitionism
//percentage from 0 to 100
public function kaedeIncreaseExhibitionism(arg:int):void 
{
	if (flags["KAEDE_EXHIBITIONISM"] == undefined) flags["KAEDE_EXHIBITIONISM"] = 0;
	flags["KAEDE_EXHIBITIONISM"] = Math.max(Math.min(flags["KAEDE_EXHIBITIONISM"] + arg, 100), 0);
}