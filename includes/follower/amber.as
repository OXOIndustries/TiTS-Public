import classes.Creature;
import classes.Characters.PlayerCharacter;
import classes.GameData.CombatManager;
import classes.GameData.CodexManager;
import classes.ItemSlotClass;
import classes.TiTS;
import classes.Util.InCollection;

/*
Dryad xpac written by Wsan.

* @author DrunkZombie
*/
/*
	flags
	AMBER_CREWMEMBER 0/undefined = not recruited and not on ship, 1 = recruited and on ship, 2 = recruited but not on ship
	AMBER_CREWMEMBER_INITIALSCENE undefined = not played, game timestamp = when initial scene happened
	AMBER_VISIT_HOLD 0/undef = unvisited, 1 = visited her in hold
	AMBER_RECRUIT_FUCK 0/undefined = not recruited, 1 = you fucked her during recruitment scene, 2 = she fucked you
	AMBER_LASTCUM gametimestamp of last time she came
	AMBER_BRUSHED gametimestamp of last time she was brushed
	AMBER_SHIPSEX_TALK 0/undef no talk yet, 1 = had talk
	AMBER_SHIPSEX_GETFUCKED 0/undef not yet, 1 = had talk
	AMBER_TALK_STAGE stage of unlocked talk topics 0/undef = Past & Crew, 1 = Family, 2 = Life, 3 = Cure, 4 = Drugs
	AMBER_CREW_SEX 0/undef = no, 1 = yes
	AMBER_CURED undef/0 uncured, 1 = cured
	AMBER_THROBB Number of doses of Throbb given
	AMBER_DUMBFUCK Number of doses of dumbfuck given
	AMBER_DUMBFUCK_LASTGIVEN currently under the influence of dumfuck, 0/undef = n0, 1 = yes
	AMBER_EQUILICUM Been given equilicum 0/undef = no, 1 = yes
	DRYAD_FUCKED Times Sexed
	DRYAD_BLEWHER Times You Sucked Her Dick
	DRYAD_FACEFUCKED Times She Sucked Your Dick 
	DRYAD_CUNHER Times You Licked Her Pussy
	DRYAD_CUNYOU Times She Licked Your Pussy
	DRYAD_HERCUNT Times You Fucked Her Pussy 
	DRYAD_MOUNTING Times You Fucked Her Pussy using the taur equip
	DRYAD_YOURCUNT Times She Fucked Your Pussy 
	DRYAD_ANALED Times You Fucked Her Ass 
	DRYAD_ANALEDYOU Times She Fucked Your Ass 
	AMBER_LASTCOCK used to track the cock used in the first sex scene
	AMBER_DRAINEDINPUSSY used to check if the PC ever let Amber drain herself into their pussy before on the ship.
*/
//show bust
public function amberHeader():void
{
	showName("\nAMBER");
	showBust(dryadBustDisplay());
	author("Wsan");
}
// amber has been recruited and is currently on the players ship.
public function amberIsCrew():Boolean
{
	if (flags["AMBER_CREWMEMBER"] == 1) return true;
	return false;
}
//amber has been recruited (current ship status non withstanding) (not currently possible to dismiss once recruited but function coded to account for the possibility)
public function amberRecruited():Boolean
{
	if (flags["AMBER_CREWMEMBER"] != undefined) return true;
	return false;
}
public function amberAvailable():Boolean
{
	return (!pc.hasStatusEffect("Amber Disabled") && !amberCurrentlyDumbfucked());
}

//show hint text about getting special gear to recruit the dryad, 
//been to zheng shi and fucked dryad 5+ time
public function amberEncounterAppend():void
{
	if (flags["MET_URBOLG"] != undefined && flags["DRYAD_FUCKED"] != undefined && flags["DRYAD_FUCKED"] >= 5 && !pc.hasKeyItem("Taur-centric Ship Equipment"))
	{
		output("\n\n<b>If you could get some ‘taur-centric equipment from a merchant, you might be able to convince her to board your ship. Maybe Urbolg would know where to get some.</b>");
	}
}
//returns number of doses of dumbfuck she has taken
public function amberDumbfuckDoses():int
{
	if (flags["AMBER_DUMBFUCK"] == undefined) return 0;
	
	return flags["AMBER_DUMBFUCK"];
}

//returns the number of doses of throbb given to amber
public function amberThrobbDoses():int 
{
	if (flags["AMBER_THROBB"] == undefined) {
		flags["AMBER_THROBB"] = 0;
	}
	
	return flags["AMBER_THROBB"];
}

//returns if amber is in heat or not
public function amberInHeat():Boolean
{
	//for when cure content is implemented
	if (flags["AMBER_CURED"] == 1) return false;
	//below is a temp solution until crew sex events are implemented
	if (flags["AMBER_CREW_SEX"] == 1)
	{
		if (celiseIsCrew()) return false;
		if (annoIsCrew()) return false;
		if (mitziIsCrew()) return false;
	}
	
	var timeframe:int = 4320; //3 days
	if (flags["AMBER_LASTCUM"] == undefined) return false;
	
	if (GetGameTimestamp() - timeframe > flags["AMBER_LASTCUM"]) return true;
	else return false;
}
//returns if currently under the effects of a dose of dumbfuck
public function amberCurrentlyDumbfucked():Boolean
{
	var timeframe:int = 1440; //1 days
	if (flags["AMBER_DUMBFUCK_LASTGIVEN"] == undefined) return false;
	if (GetGameTimestamp() - timeframe < flags["AMBER_DUMBFUCK_LASTGIVEN"]) return true;
	else return false;
}
//show taur equip button in Urlbolg talk
public function amberShowTaurEquipButton():Boolean
{
	if (!pc.hasKeyItem("Taur-centric Ship Equipment") && amberMetTaur()) return true;
	return false;
}
//taur equip talk
public function amberUrbolgTaurEquipTalk():void
{
	clearOutput();
	showUrbolg();
	author("Wsan");
	output("<i>“Hey Urbolg, might be a bit of a long shot but you’re pretty well-connected and well-supplied. Any chance you’ve got some tauric ‘equipment’ lying about?”</i> you ask him.");
	output("\n\n<i>“Hnh,”</i> Urbolg says, rubbing his furry chin. <i>“Funny ye ask. With all the morons comin’ through and leaving their junk here, I’ve got </i>quite<i> the collection. Actually, ye’d be helping me out by taking it. Got a whole bunch of harnesses, mounts, restraints, leg-lockers... ye name it, s’probably in there. Why, ye got your romantic eyes set on a ‘taur, kid?”</i> he teases.");
	output("\n\n<i>“Something like that,”</i> you admit. <i>“Besides, ya never know. Could come in handy by itself.”</i>");
	output("\n\n<i>“Aye, that was what I thought when I got it,”</i> Urbolg agrees, nodding. <i>“But I’m a bit of a hoarder, see. So I hope ye got a purpose in mind fer it, else ye’ll end up like me.”</i>");
	output("\n\nHe gestures at the miscellaneous piles of mechanical junk lying about. Point taken. He helps you pack all of the shiny equipment into your hold, the two of you working up a good sweat while you lug all of the bits and bobs inside. Afterwards, you’re standing in the hold leaning against a mounting platform while you talk.");
	output("\n\n<i>“Where did you even get all this stuff, Urbolg?”</i> you ask, curious. <i>“It looks mostly new.”</i>");
	output("\n\n<i>“Aye, well. I think it was a couple o’ leithans passing by,”</i> he says, recalling it. <i>“Thing about comin’ here is that it’s easy to get in. Not so easy to get back out. So, they didn’t come back and their ship was just sittin’ there. I took their things ‘fore someone else beat me to the punch.”</i>");
	output("\n\nHe shrugs matter-of-factly. It’s true - out here, it’s every man and woman for themselves. Might as well pick while the picking’s good. When you’ve both had a short rest after the heavy lifting, Urbolg gives you a wave and heads back into the hangar. He’s good folk, for a pirate.");
	
	pc.createKeyItem("Taur-centric Ship Equipment", 0, 0, 0, 0, "Equipment to accommodate a taur living on your ship.");
	
	processTime(30);
	sweatyDebuff(1);
	clearMenu();
	addButton(0,"Next",peacefulApproachUrbolg,true);
}
//check if a taur has ever been met
public function amberMetTaur():Boolean
{
	if (flags["DRYAD_MET"] != undefined) return true;
	if (flags["MET_AINA"] != undefined) return true;
	if (flags["MET_ELLIE"] != undefined) return true;
	if (flags["MET_SYLVIE"] != undefined) return true;
	if (flags["USHA_MET3"] != undefined) return true;
	if (flags["MET_HALEY"] != undefined) return true;
	if (flags["ENCOUNTERED_FREEDOM_BEEF"] != undefined) return true;
	if (CodexManager.entryUnlocked("Leithans")) return true;
	if (CodexManager.entryUnlocked("Siel")) return true;

	return false;
}
//ask the dryad to come with you on your ship
public function amberComeWith():void
{
	clearOutput();
	dryadHeader();
	
	var ppAmber:PregnancyPlaceholder = getDryadPregContainer();

	output("<i>“Actually, I’ve got a proposition for you,”</i> you say, looking her in the eye. She doesn’t look amazingly happy to still be talking instead of fucking with her cheeks all flushed and sweat beading across her forehead, but she does let you continue. <i>“How about a more permanent solution to your problem?”</i>");
	output("\n\n<i>“Permanent... solution?”</i> she echoes, suddenly curious. <i>“Like uh, like what? I’ve thought about it countless times, but-”</i> she says, grimacing. <i>“I dunno. Simpler to just live out here.”</i>");
	output("\n\n<i>“Come with me,”</i> you say earnestly. <i>“I think I’ve proven I can handle your quirks. If you’re on my ship, you’ll always have someone around to take care of you. Plus it’d be a little more... civilized,”</i> you add, gesturing at the jungle. <i>“I know you must be attached to this place, but at the very least I can promise you a warm bed and food.”</i>");
	output("\n\n<i>“I-... No, I’m not attached to this place,”</i> she says, smiling crookedly. <i>“I just thought- think, really, that I wouldn’t do too hot in regular civilization. What with the uh, problem and all...”</i> she trails off, scratching her cheek distractedly while she stares at a point past you. Flicking her gaze back to you, she curls her lip a little.<i>“Um, can we fuck? Sorry, but I’m- uh, really getting desperate here. Like, I’m about fiiive seconds from pushing you down and, and just fucking you.”</i>");
	output("\n\nShe’s not kidding. Between her legs, you can see her pink cock angrily flaring and dripping with cum, the head swollen to twice its regular size. Between that and the heavy, swinging balls full of churning seed between her hindlegs, she’s the picture of sexual desire and it’s clear her restraint is waning by the second.");
	output("\n\nIf you’re going to take her onboard, you’ll have to prove you can handle her desires yourself when the need arises.");

	processTime(3);
	clearMenu();
	if (pc.hasCock()) addButton(0, "Fuck Her", amberComeWithTalkFuckHer, undefined, "Fuck Her", "Fuck the girl’s pussy to get her off.");
	else addDisabledButton(0, "Fuck Her", "Fuck Her", "You don’t have a dick to fuck her with.");
	
	addButton(1, "Get Fucked", vaginaRouter,[amberComeWithTalkGetFucked,ppAmber.cockVolume(0),1,0], "Get Fucked", "Let the girl fuck one of your holes.");
	addButton(2, "No", amberComeWithTalkNo, undefined, "No", "You don’t wanna bang right now.");
}

//refuse to help her get off
public function amberComeWithTalkNo():void
{
	clearOutput();
	dryadHeader();
	
	output("<i>“Sorry, you’ll have to find someone else,”</i> you say, shaking your head.");
	output("\n\nShe doesn’t even bother to reply, turning and loping into the jungle in search of that someone else.");
	
	processTime(2);
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}
//ask the dryad to come with you on your ship
public function amberComeWithTalkFuckHer():void
{
	clearOutput();
	dryadHeader();
	
	output("<i>“Here,”</i> you say,");
	if (!pc.isCrotchExposed()) output(" shedding your [pc.lowerGarments] and");
	output(" taking your [pc.biggestCock] in hand. <i>“Turn around and I’ll make you cum all that out.”</i>");
	
	output("\n\n<i>“Oh, god, thank you,”</i> she gasps, panting hard. She was just barely holding it together for your sake this whole time, but now there’s no need to maintain appearances. The dryad backs");
	
	if (pc.isTaur()) output(" closer to you, lowering her hind half and flicking her tail upwards to expose her overly wet mare-pussy in the hopes of inciting the desire to mount within you.");
	else output(" into you, moaning and whining as she rubs herself up and down your thickening length.");
	output(" She’s muttering under her breath. <i>“Ohhh, fuck me, fuck me, plunge it inside my tight little cunt and make me cum, pleeeaase-”</i>");
	
	output("\n\nShe gives a loud, sharp cry of relief when you");
	if (pc.isTaur()) output(" roughly mount her and");
	output(" enter her steaming hot depths, sliding yourself between her thick, rubbery lips and sinking yourself to the hilt. She’s as wet as can be - there’s a veritable river of her juices flowing from her sopping cunt.");
	
	pc.cockChange();
	
	output("\n\n<i>“Ohhoohhh </i>fuck<i>! Harder! Fuck me harderrr!”</i> she screams, throwing her head back and squeezing her own ripe breasts.");
	output("\n\nYou’ve hardly started and she’s already squeezing down on you, ready to cum at the slightest provocation. Between that and your willingness to indulge her erotic desire to be fucked as hard as possible it doesn’t take long until she’s screaming herself hoarse in bliss, forelegs bowed and her cock noisily spewing cum across the ground of the Mhen’gan jungle. She’s always been an easy partner, cumming with the most minor of attentions, and now is anything but an exception.");
	output("\n\nYou hammer her hard enough to tip her front half over, her strong hindlegs keeping her slick, spasming pussy in the air for you to fuck while she claws at the dirt and shrieks in ecstasy. By the time you cum yourself, exploding into her depths while her undulating walls milk you for your seed, she’s almost run dry. A few last ropes shoot from the end of her shaking horsecock, joining the expansive pool of jizz pooling under her. When you withdraw from her well-satisfied cunt, your own spunk drips down her behind and spatters across her balls, a more manageable size by now.");
	
	processTime(10);
	//fuck her cunt, she came, skip change
	amberFuckAHole(5, true, false);
	flags["AMBER_RECRUIT_FUCK"] = 1;
	
	amberComeWithTalkFuckMerge();
}
//ask the dryad to come with you on your ship
public function amberComeWithTalkGetFucked(hole:int):void
{
	clearOutput();
	dryadHeader();
	
	var ppAmber:PregnancyPlaceholder = getDryadPregContainer();
	
	output("<i>“Okay, c’mere,”</i> you urge her,");
	if (pc.isTaur()) output(" turning around and slapping your side. <i>“Mount me.”</i>");
	else
	{
		output(" backing up against a tree");
		if (pc.hasLegs()) output(" and spreading your [pc.legs]");
		output(". <i>“Take me standing.”</i>");
	}
		
	output("\n\n<i>“Oh my god, yes,”</i> she pants, her hips already making small shuddering thrusts and sending droplets of jizz and sweat all over the forest floor. <i>“Oohhh, fuck...”</i>");
	output("\n\nShe’s about to cum just from the sight of you presenting yourself. Her gaze is fixated on your");
	if (hole < 0) output(" [pc.ass]");
	else output(" [pc.vagina " + hole + "]");
	output(", minor concerns like whether her tree trunk of a cock will fit or not swept away by the haze of desire shrouding her mind.");
	if (pc.isTaur()) output(" She rears up and mounts you with no finesse at all, needily thrusting until her massive cock finds its target and sinks several inches deep.");
	else output(" She slams her hooves against the tree and tries to thrust inside you, her dick threatening to blow its load between your asscheeks until you guide it with your hands. The <i>moment</i> she finds herself aligned with your hole, she thrusts it several inches deep.");
	output(" With a deep, guttural groan of bliss she rams it further inside, impaling you on her gigantic, cum-spurting dick.");
	
	if (hole < 0) pc.buttChange(ppAmber.cockVolume(0), true, true, false);
	else pc.cuntChange(hole, ppAmber.cockVolume(0), true, true, false);
	
	output("\n\nYou cry out underneath her in a mixture of surprise");
	if (hole < 0)
	{
		if(pc.ass.wetness() < 3) output(", pain,");
	}
	else
	{
		if(pc.vaginas[hole].wetness() < 3)output(", pain,");
	}
	output(" and pleasure.");
	if (pc.isTaur()) output(" Her ragged, desperate breathing is hot against your ear, bestial grunts of satisfaction issuing forth from her throat.");
	else
	{
		output(" She’s brutal, honestly.");
		if (pc.hasFeet()) output(" Your [pc.feet] are barely staying on the ground with every savage, wanton thrust.");
		if (pc.isTreated()) output(" Luckily, your Treated stamina will see you through the erotic ordeal.");
		else output(" It’s only sheer force of will that keeps you upright and holding her, weathering her deep, hole-expanding thrusts.");
	}
	
	output("\n\nIt doesn’t take her long to cum - really, all she needed was a slick, hot fuckhole for her to do it inside. With a long, loud groan of relief, she sinks herself balls-deep and rests her cock");
	if (hole < 0) output(" in your stretched-out asshole, letting out gout after gout of warm seed into your innards.");
	else
	{
		output("head against your womb,");
		if (pc.isPregnant(hole)) output(" letting out a seemingly endless flow of spunk that squirts down your [pc.thighs]");
		else output(" creaming your womb so thoroughly you can feel yourself warming up from the inside out.");
	}
	output(" She sounds almost delirious with the pleasure, her voice getting lower and weaker until, finally, she sags with the effort of cumming and");
	if (pc.isTaur()) output(" dismounts");
	else output(" backs off the tree");
	output(", slipping free from your well-used orifice.");
	if (pc.hasLegs()) output(" Her seed lewdly spurts forth from between your [pc.legs].");
		
	processTime(10);
	//fuck your ass/cunt, she came, skip change
	amberFuckAHole(hole,true,false);
	flags["AMBER_RECRUIT_FUCK"] = 2;
	
	amberComeWithTalkFuckMerge();
}
//ask the dryad to come with you on your ship
public function amberComeWithTalkFuckMerge():void
{
	output("\n\nAfterwards, you’re both on your feet and feeling refreshed - come to think of it, this will be the first time you’ve ever spoken to her when she’s <i>not</i> desperately horny and on the verge of exploding. You eye her curiously. Though she’s still panting and covered in sweat in the wake of your mind-shattering performance, the difference is palpable. There’s an actual person behind those blue eyes, not just a sex-crazed beast.");
	output("\n\n<i>“I... I-”</i> she starts, then stops. She’s struggling to get something out, that much you can see. What takes you by surprise is when tears begin to flow down her flushed, freckled cheeks. <i>“Thank you! I’m sorry!”</i> she hiccups, futilely wiping at her eyes. <i>“I-I’m suh-sorry I’m such a mess! I-”</i>");
	
	clearMenu();
	addButton(0, "Hug", amberComeWithTalkHug,undefined);
}
//ask the dryad to come with you on your ship
public function amberComeWithTalkHug():void
{
	clearOutput();
	amberHeader();
	
	output("You pull her into a hug,");
	if (pc.tallness >= 96) output(" pressing her head against your chest.");
	else output(" putting her head against your shoulder.");
	output(" Then she’s <i>really</i> crying, great sobs wracking her body as she wraps her arms around you and wails. You gently stroke her head, running your hand through her fiery red hair and soothing the despondent girl.");
	
	output("\n\nIt takes a long time for her to stop.");
	output("\n\nWhen she’s cried herself out, the dryad takes a long, shuddering breath and looks");
	if (pc.tallness > 70) output(" up");
	output(" at you.");
	
	output("\n\n<i>“This is... the nicest thing anyone has ever done for me,”</i> she says quietly. <i>“I don’t even care if you just want to fuck me, or whatever. I just- I just want to leave it all behind.”</i>");
	output("\n\nShe takes your proffered hand and sniffles. <i>“Let’s go.”</i>");
	output("\n\n<i>“Yeah, I’ll show you around the ship,”</i> you tell her, walking alongside her and chatting. <i>“It’s nothing like the fancy ships they have in Gildenmere, but it’s getting the job done.”</i>");
	output("\n\n<i>“What’s Gildenmere?”</i> she asks, looking at you.");
	output("\n\n<i>“Oh, it’s the capital city of Myrellion. I went there a little while ago to solve some issues they were having -");
	
	//if myrellion is nuked
	if (flags["KQ2_MYRELLION_STATE"] == 1)
	{
		if (pc.isMischievous()) output(" uhhh, didn’t go so hot to be honest, but it’s the thought that counts.”</i>");
		else output(" regrettable how it turned out, though.”</i>");
	}
	else output(" they were right on the verge of civil war when I got there.”</i>");
	
	output("\n\n<i>“Wow, you’re an actual space explorer!”</i> she marvels. Her eyes sparkle with wonder, eager to hear more about the universe you’ve travelled. <i>“That’s amazing, uh - I just realized, I don’t know your name! I guess our past um, meetings, haven’t exactly been the kinda environment to get to know each other. Properly, I mean.”</i>");
	output("\n\n<i>“It </i>is<i> a little crazy that we’ve known each other for so long without ever introducing ourselves,”</i> you agree, looking at her with a smile. <i>“I’m [pc.name]. [pc.name] Steele.”</i>");
	
	output("\n\n<i>“Steel, huh?”</i> she says, grinning.");
	if (flags["AMBER_RECRUIT_FUCK"] == 1) output(" <i>“Well, you can be as hard as steel in at least one place.”</i>");
	else output(" <i>“Your exterior doesn’t seem so impenetrable to me.”</i>");
		
	output("\n\n<i>“And my name is Amber,”</i> she continues, expression softening into a smile. <i>“Well, that’s just what I chose for myself, anyway. I thought it was nice.”</i>");
	output("\n\n<i>“Amber, huh?”</i> you say, nodding. <i>“It’s a nice name. You know, there’s a Terran myth that claims amber is produced by the sun. Poetic, right?”</i>");
	output("\n\n<i>“Yes!”</i>she says, pleased. <i>“It has a lot of ties to the sun, and, well, that was kinda who I wanted to be, y’know? The shining sun...”</i>");
	output("\n\nShe trails off, looking at the sky of Mhen’ga and for a moment you wonder if you should start talking about your space adventures again. When she looks back at you, though, she’s wearing an expression of contentment. <i>“Thank you. For everything. Maybe... maybe one day I can really be that person.”</i>");
	output("\n\n<i>“I think you’re doing great already,”</i> you tell her, leaning in to give her a kiss on the cheek. You can feel Amber’s eyes widen a little at the touch of your lips, but she doesn’t shy away. Instead, she smiles a little wider than before and squeezes your hand.");
	output("\n\nBy the time she boards your ship she’s in high spirits, listening intently while you regale her with the tall tales of your interplanetary travel and laughing whenever you point out some quaint peculiarity of the inhabitants. You’ve successfully distracted Amber from her reasons to cry, for now. It’d be a good idea to keep her company every so often just to make sure she’s doing okay.");
	//if have current crew members, true returns count while false is for description and button creation, in game.as
	if (crew(true) > 0) output(" Not to mention introduce her to the other crew members. Some friends would be good for her.");
	
	processTime(15);
	clearMenu();
	addButton(0, "Ship", amberComeWithTalkShip);
}
//ask the dryad to come with you on your ship
public function amberComeWithTalkShip():void
{
	clearOutput();
	amberHeader();
	
	moveTo("SHIP INTERIOR");
	
	if (annoIsCrew())
	{
		output("As it happens, you run into one of them while you’re showing Amber the ship - Anno, friend of everyone.");
		output("\n\n<i>“Oh!”</i> Anno says, wolfish ears perking up immediately. <i>“Hey there, cuties! Who’s your gorgeous friend, [pc.name]?”</i>");
		output("\n\n<i>“Hey, Anno,”</i> you say, smiling. <i>“Was just thinking about you, actually - this is Amber. Amber, meet Anno.”</i>");
		output("\n\nAmber gives Anno a little wave and a nervous smile along with a quiet <i>‘hey’</i>.");
		output("\n\n<i>“Everyone onboard the ship is a person I hand-picked, Amber,”</i> you tell her, smiling while you pat her tauric half and stroke her fur comfortingly. <i>“You can trust them. Especially Anno, she’ll eat out of your hand if you let her. I don’t think there’s a mean bone in her body.”</i>");
		output("\n\n<i>“That’s me!”</i> Anno says, winking at Amber. <i>“Nice to meet you, Amber. We should have a chat sometime!”</i>");
		output("\n\nAnno eyes you with a playful grin that speaks volumes. <i>“So, Steele... I really, really hope you weren’t planning on monopolizing this beautiful woman. ‘Cuz uh,”</i> she murmurs, her eyes flitting downwards momentarily, <i>“I can see she’s quite </i>gifted<i>.”</i>");
		output("\n\nAmber giggles at that, but looks to you for approval. You shrug.");
		output("\n\n<i>“Hey, I dunno yet. But now that you mention it, actually...”</i>");
		output("\n\nYou fill Anno in on Amber’s condition and she claps her hands over her mouth in shock.");
		output("\n\n<i>“That’s horrible! You poor girl!”</i>");
		output("\n\nAnno catches Amber in a tight, sincere hug, wrapping her arms around the dryad’s back. You smile. Seems like she has one good friend already.");
		output("\n\n<i>“So, it might be beneficial to have more than one person to help Amber out, but we’ll see,”</i> you say. <i>“I’m gonna finish up giving her the ship tour and let her take a shower.”</i>");
		output("\n\n<i>“Oh, a shower,”</i> Amber exclaims, clasping her hands together in glee. <i>“I haven’t had one in so long...”</i>");
		output("\n\n<i>“Alright, I’ll let you get to it!”</i> Anno chirps, smiling. <i>“You can come by my room any time if you wanna talk, Amber. It’s just down the corridor. See you!”</i>");
		output("\n\n<i>“Bye, Anno!”</i> Amber says, waving as the friendly ausar heads to her room. She turns to you after Anno’s left. <i>“She’s very nice.”</i>");
		output("\n\n<i>“Yeah, Anno’s great,”</i> you agree. <i>“C’mon, I’ll show you the hold.”</i>");
	}
	
	output("You show her around the rest of the ship, though admittedly it’s not a very long tour. She takes particular interest in all the mounting equipment set up in the hold, courtesy of Urbolg.");
	output("\n\n<i>“Oho, wow,”</i> Amber giggles, looking at you slyly. <i>“Looks like someone was ready for my arrival, huh?”</i>");
	output("\n\nShe gives you a kiss out of nowhere, right on the [pc.skinFurScales] of your cheek.");
	output("\n\n<i>“Thanks, [pc.name]. I can tell you’re actually putting a lot of thought into this,”</i> she says, smiling warmly. <i>“You’re doing your best to make me happy, and I appreciate it. Now uh,”</i> she adds, taking some of her hair in hand and inspecting it. <i>“If you don’t mind, could I grab that shower? I haven’t really thought about it much, but I guess I smell like jungle.”</i>");
	output("\n\n<i>“I wasn’t gonna say anything, but...”</i> you say, shrugging.");
	output("\n\n<i>“Yeeeaaah,”</i> Amber grimaces. <i>“Don’t worry about it. You’d think for someone with such a keen sense of smell I’d be more aware, but y’know. Haven’t been around people much.”</i>");
	output("\n\nYou lead her up to your room and show her the shower. She seems very impressed with it.");
	output("\n\n<i>“It can fit a leithan, so you should be fine,”</i> you say, opening the door and gesturing at the controls. <i>“Do you want some help toweling off your back half when you’re done?”</i>");
	output("\n\n<i>“That would be great, actually,”</i> she says, standing still and looking into the shower. <i>“I uh, I-”</i>");
	output("\n\nShe’s trying not to cry. Tears well up in her bright blue eyes and after a couple of seconds, begin to streak down her face.");
	output("\n\n<i>“Thank you. T-thank you so much,”</i> Amber chokes, talking while you caringly dab at her cheeks with the corner of the soft towel you were going to put on the bed. <i>“For, for everything. It’s just a little much for me... to go from h-hiding in the woods to being onboard a spaceship. None of this feels real.”</i> Her tears drying up, she looks at you forlornly. <i>“I don’t want to wake up and have you disappear.”</i>");
	output("\n\n<i>“I won’t,”</i> you promise. <i>“I get it, though. It must be overwhelming. But I’m not gonna disappear on you or anything like that, Amber. Okay?”</i>");
	output("\n\nShe nods slowly, her cheeks red but her eyes clear again. <i>“Okay... okay.”</i>");
	output("\n\n<i>“Good. Now uh,”</i> you say, noting her hand clinging to your forearm. <i>“Did you want me to come in the shower with you? Might help to get you clean.”</i>");
	output("\n\n<i>“Yes please,”</i> Amber says, taking a ginger step past the door. <i>“I don’t know if I um, really get the controls. I don’t want a faceful of icy water as my welcome back into civilization.”</i>");
	
	output("\n\nYou");
	if (!pc.isNude()) output(" shuck off your clothes into a pile outside and");
	output(" close the door behind you as you enter, turning the dial for warm water. Turning to Amber, you beckon her closer.");
	
	output("\n\n<i>“Here, the showerhead’s detachable. I’ll hose you down a bit, alright?”</i> you offer, taking the nozzle in hand.");
	output("\n\nYou let the water cascade over Amber’s pale chest, droplets forming across her shapely breasts after you direct it lower, down her stomach and then around her side. You have to rub her fur a lot to get the water to penetrate her coat, drenching her thoroughly enough that she’s probably going to weigh an extra ten pounds after you’re done. She stiffens a little when the water courses over her rear, tail twitching slightly, but you remain silent out of diplomacy until you’re hosing down her other side and it’s too much to ignore.");
	output("\n\n<i>“You look pretty pent up down here,”</i> you tell her, grinning as she turns back to you with flushed cheeks. <i>“I guess the heat is getting to you, huh? Wanna take care of it?”</i>");
	output("\n\n<i>“This isn’t- it’s uh, not my heat. Well, not yet,”</i> Amber says hesitantly, meeting your eyes under the flow of water. <i>“You’re attractive, naked, and dripping with water... I just want to have sex with you, [pc.name].”</i>");
	output("\n\n<i>“Of your own accord,”</i> you finish her thought, smiling. <i>“Sorry, little insensitive of me. Yeah, we can do that. You’re a beauty, Amber. I’m always up for some fun.”</i>");
	
	processTime(15);
	clearMenu();
	addButton(0, "Shower Sex", amberComeWithShowerSex);
}
//recruitment shower sex scene
public function amberComeWithShowerSex():void
{
	clearOutput();
	amberHeader();
	
	if (flags["AMBER_RECRUIT_FUCK"] == 1)
	{
		output("<i>“Oooohh, I can feel every little movement- nnngh,”</i> Amber groans, your [pc.cockBiggest] brushing her prostate with every slow thrust into her soft, warm asshole. <i>“God, I can </i>feel<i> my fucking balls getting heavier with every! Unh! Second!”</i>");
		
		pc.cockChange();
	
		output("\n\n<i>“Don’t worry, I’ll have them run dry in a few minutes,”</i> you tease her, revelling in the preciseness of fucking her. It’s usually a very messy, desperate affair - which has an appeal all of its own - but this is a nice change of pace. Plus, you’re enjoying making her quaking underslung cock leak streams of clear precum. Anticipation is to be savored.");
		output("\n\n<i>“Uh! Oh! I don’t think,”</i> she pants, <i>“I don’t think it’ll even take a few minutes. Oooohhh, god I’m getting close- nnngh!”</i>");
		
		output("\n\nYou can feel it. She’s tightening up around you, little shudders and shocks running up and down her spine as her hindlegs stiffen and relax.");
		if (pc.isTaur()) output(" You lean forward and take her chest in hand, cupping her breasts and massaging them while you buck your sturdy hips.");
		else output(" You let yourself withdraw almost to the point of slipping free, her donut ring of an asshole desperately gripping you to prevent your escape, then slide yourself all the way back in.");
		output(" That’s enough to set her over the edge.");
		
		output("\n\n<i>“Oh, it’s coming,”</i> she breathes, leaning back and tightening her hands into balled fists. <i>“Uhhh- cummiiiinnnnggg-”</i>");
		output("\n\nThe first rope of cum that spurts from her cock is so thick, voluminous, and heavy it sounds like a water balloon popped on the floor of the shower. You don’t even have time to marvel at how hard she’s cumming though because as she’s grunting and gritting her teeth and following it up with even more, she’s also tightening around your cock multiple times a second. It’s impossible to resist, and you weren’t going to bother in the first place.");
		output("\n\nYou let loose a huge load in her sensitive asshole, spurred on by the sounds of Amber cumming her mind out through her cock. There’s a special kind of appeal knowing you’re the one responsible for these huge, thick loads she’s uncontrollably shooting out, one you know only too well. You suppose you can take the dryad out of the jungle, but you can’t take the jungle out of the dryad - she’s always going to be at least a little bit of a beast.");
		output("\n\nYou pull out right as she’s done cumming, both of you panting hard after the exertion. Your [pc.cockHeadBiggest] slipping back out of her asshole immediately elicits a groan and one last long, loud blast of seed from her drooping cock, all over the shower floor.");
		
		processTime(30);
		//fuck her ass, she came, skip change
		amberFuckAHole(4,true,false);
	}
	else
	{
		output("<i>“Ooohhh, </i>god<i>,”</i> Amber moans, shivering as you gently lick her oversized cockhead. A generous dollop of tasty precum splashes across your [pc.tongue] to be swallowed down without stopping, lavishing her flared tip with oral love. <i>“Fuck, that feels </i>gooood<i>!”</i>");
		output("\n\nIt’s a little strange to have your hands and mouth on Amber’s massive cock without having her trying to shove it, almost like something is missing, but it’s a nice change of pace. Plus, hearing her pant and moan as you worship her is really fun. Raising her stiff, heavy cock a couple of inches higher, you give her equine nozzle a long, slow lick before drawing closer and kissing it passionately, moaning in pleasure.");
		output("\n\n<i>“OH! Oh, god!”</i> Amber pants, stiffening up above you. <i>“Oh, that feels- nn! Nnnh!”</i>");
		output("\n\nYou back off right as she starts shaking, feeling more than a little proud as you watch her legs shudder in carnal pleasure. You’re going to prove to her that you’re all she needs to handle her problem, one way or another.");
		output("\n\n<i>“One more trick like that and I’m gonna c- uh! Cum,”</i> Amber breathily warns you, wincing in pleasure as you start stroking her length slowly. <i>“Just in case you didn’t wanna get messy.”</i>");
		output("\n\n<i>“That’s fine,”</i> you murmur, eyeing her twitching cock. Any bystander would think it were <i>you</i> in heat, greedily licking your lips in anticipation of swallowing down Amber’s thick, creamy cum. Already you can see her massive swinging balls tightening up, drawing closer to her underbelly in preparation of expelling their load. You kiss her again, this time even rougher and more passionately, planting your [pc.lips] on her cockhead and letting your tongue do the talking.");
		output("\n\n<i>“Oh- Oh, [pc.name]-”</i> Amber haltingly begins, her voice rapidly rising in volume as she practically shrieks your name, but she never gets the rest of her sentence out. What she does let out is a loud, drawn-out groan of defeated ecstasy and a long, sticky rope of cum fresh from the source as the orgasm she was holding back overcomes her.");
		output("\n\n<i>“Ohhhh! Ooohhhh, </i>gooood<i>,”</i> Amber says, exhaling through grit teeth so roughly you’re worried she’ll strain herself. Pearlescent seed begins to spurt from her tip, splashing your face slowly at first, then picking up in pace until you’re frenetically gulping down cheek-swelling load after load when you place your lips around her flexing cockslit. You can take the dryad out of the jungle, but you definitely can’t take the jungle out of the dryad - she’s every bit as productive as she was when you first met her in the depth of heat, if not more so.");
		output("\n\n<i>“Uuuuggggh,”</i> she groans in effort, standing above you and thrusting her behemoth horsecock in short, juddering motions. <i>“Nnnggh! Nnnnn! Grrrnngh!”</i>");
		output("\n\nHaving swallowed what feels like a gallon of her thick, virile seed you withdraw from her flaring, cum-splurting tip and roughly jack her off to get the rest out of her, earning little gasps of joy from your wet-furred lover. By the time you’ve finished she’s leaned against the shower wall, gasping for air after having cum so hard.");

		processTime(30);
		pc.changeLust(30);
		//suck her dick, she came, skip change
		amberFuckAHole(3,true,false);
	}
	
	output("\n\n<i>“Ohoohhh, wow,”</i> she half-laughs, half-pants, looking at you with a dizzy smile. <i>“We’ve gotta do this more often...”</i>");
	output("\n\n<i>“You know it,”</i> you reply with a grin.");
	
	pc.shower();
	clearMenu();
	addButton(0, "Clean Up", amberComeWithShowerCleanUp);
}
//recruitment shower sex clean up
public function amberComeWithShowerCleanUp():void
{
	clearOutput();
	amberHeader();
	
	output("When you emerge from the shower, both of you have been under the water for so long that you’re probably as clean as you’re ever going to be. Amber turns to you with a smile.");
	output("\n\n<i>“Well, that’ll definitely stave my heat off for a little while,”</i> she quips. You laugh, nodding in agreement.");
	output("\n\n<i>“Yeah, hope so. I’ll try to be around the ship as much as possible to help you out, Amber,”</i> you tell her. <i>“Are you tired? Today’s been a bit of an adventure...”</i>");
	output("\n\n<i>“I could use some sleep,”</i> she admits.");
	output("\n\n<i>“Right. Anywhere you wanna set up? There might be a spare room around.”</i>");
	output("\n\n<i>“Actually, I was thinking I’d sleep down in the hold,”</i> Amber says, shrugging. <i>“It’s a little bigger than the rest of the ship, right? And it has the uh, equipment. Convenience and all that.”</i>");
	output("\n\n<i>“Sure,”</i> you say. <i>“I’ll bring you a mattress and some blankets so you’re not lying on the floor. Meet you down there, alright?”</i>");
	output("\n\nAfter you’ve given her the basic necessities for living, she falls fast asleep almost immediately with naught but a grateful murmured ‘thanks’. You’re not surprised, really. She’s been through a lot in the space of a few hours and you just gave her what might be the first - and hardest? - orgasm she’s ever had not under the influence of her heat. If nothing else, it’s a start.");
	output("\n\nYou wonder, though, if there’s a cure for her condition. Or if she even <i>wants</i> to be cured. Maybe she revels in the addiction, having grown to love the overwhelming sensation of heat. You’ve seen weirder things in your extensive travels. You’ll have to talk to her about this to get everything straight, not to mention find out what’s driven her to this point - if she wants to talk about it, anyway. But for now, looking at the sleeping centauress curled up on a mattress and covered in blankets, you think she deserves some uninterrupted rest.");
	output("\n\nDeciding you could do with a short rest yourself - it’s been a bit of a long day for <i>both</i> of you, after all - you hunker down nearby and begin dozing off.");
	
	processTime(15);
	clearMenu();
	addButton(0, "Sleep", amberComeWithSleep);
}
//recruitment shower sex sleep afterwards
public function amberComeWithSleep():void
{
	clearOutput();
	amberHeader();
	
	if (crew(true) > 0)
	{
		output("You awaken to find a couple of blankets atop you. One of your considerate crewmates must have found you taking a nap and covered you up.");
		genericSleep();
	}
	else
	{
		output("You’re somewhat uncomfortable when you awaken, stretching out your limbs to check nothing is out of order.");
		processTime(420);
		restHeal();
	}
	output(" You rise to your [pc.feet] and notice Amber waking up, yawning and blinking blearily as she looks around the hold. Then she spots you. You can see the confusion in her eyes until the events of yesterday come flooding back.");
	
	output("\n\n<i>“Good morning,”</i> you say, smiling. <i>“How’d you sleep?”</i>");
	output("\n\n<i>“Like a log, thank you,”</i> Amber mumbles, still a little drowsy. <i>“So it wasn’t a dream.”</i>");
	output("\n\n<i>“Nope, still here,”</i> you tell her. <i>“I wanted to be around when you woke up. Speaking of being here, though, it’s probably about time I get back to exploring. Will you be okay without me, Amber?”</i>");
	
	output("\n\n<i>“Thanks, [pc.name],”</i> she says, flashing you a grateful smile. <i>“I’ll be okay. You go adventuring, I’ll be down here if you need me.");
	if (crew(true) > 0) output(" Unless I get distracted by your crew, I guess?");
	output("”</i>");
	
	output("\n\n<i>“Great. I’ll try not to leave you alone for too long, for obvious reasons,”</i> you say, raising an eyebrow.");
	output("\n\n<i>“That would be best,”</i> she agrees.");
	output("\n\nNodding, you make to leave when she calls out.");
	output("\n\n<i>“Thank you again, [pc.name]. You know, for everything,”</i> Amber says. <i>“I have a home now.”</i>");
	output("\n\n<i>“Yeah, you do,”</i> you say, giving her a grin. <i>“Welcome aboard and welcome home, Amber.”</i>");
	output("\n\nShe gives you a radiant smile as you leave, heading upwards.");
	
	processTime(5);
	//set amber as recruited and on ship, also set initial scene time for later use
	flags["AMBER_CREWMEMBER"] = 1;
	flags["AMBER_CREWMEMBER_INITIALSCENE"] = GetGameTimestamp();
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

//crew activity blurb for ship 
public function amberShipBonusText(btnSlot:int = 0, showBlurb:Boolean = true):String
{
	var desc:String = "";
	
	if(pc.hasStatusEffect("Amber Disabled")) 
	{
		desc += "\n\nAmber is not available at the moment.";
		if(mitziIsCrew()) desc += " She’s probably getting into trouble with Mitzi somewhere...";
	}
	else
	{
		desc += "\n\nAmber is likely relaxing down in the hold";
		if (crew(true) > 0) desc += " or hanging out with a crew member";
		desc += ".";
	}
	
	if (amberCurrentlyDumbfucked()) addDisabledButton(btnSlot,"Amber","Amber","You’ve decided to leave Amber alone while the effects of the Dumbfuck she took wear off.");
	else if(pc.hasStatusEffect("Amber Disabled")) addDisabledButton(btnSlot,"Amber","Amber","Amber’s busy doing something else right now." + (mitziIsCrew() ? " Probably Mitzi.":""));
	else addButton(btnSlot, "Amber", amberInTheHold);
	
	return (showBlurb ? desc : "");
}

//interact with amber in the hold
public function amberInTheHold():void
{
	clearOutput();
	amberHeader();
	var timeframe:int = 1440;
	
	//first visit only
	if (flags["AMBER_VISIT_HOLD"] == undefined || flags["AMBER_VISIT_HOLD"] < 1)
	{
		flags["AMBER_VISIT_HOLD"] = 1;
		output("<i>“Oh, [pc.name]!”</i> Amber says, smiling as you enter the hold. <i>“Good to see you. Seriously, you’re a sight for sore eyes.”</i>");
		output("\n\n<i>“Could say the same for you, Amber,”</i> you say, grinning back at her. <i>“You doing okay?”</i>");
		
		if (GetGameTimestamp() - timeframe < flags["AMBER_CREWMEMBER_INITIALSCENE"]) output("\n\n<i>“Heck, I’ve been here for like five minutes,”</i> she says, mirth twinkling in her eyes.");
		else output("\n\n<i>“Uh huh! Gotten used to this place as home!”</i> she says, gesturing all around her. If this were anyone else, it’d be a little sad.");
		
		output(" <i>“But yeah, I’m doing good. Better than I ever have, honestly. Still coming to grips with it all.”</i>");
		output("\n\n<i>“Yeah, understandable,”</i> you nod. <i>“You okay with chatting? I like to spend time learning about my crew, you know? Get to know them as people.”</i>");
		output("\n\n<i>“Of course!”</i> Amber says, nodding vehemently. <i>“I wanna know more about you too, [pc.name]. You’re very mysterious!”</i>");
		output("\n\n<i>“Am I?”</i> you ask.");
		output("\n\n<i>“Yes,”</i> she replies matter-of-factly. <i>“Most people don’t run around space rescuing people left and right. Heck, you might be the only one who does. Besides... you saved me. Of course I wanna get to know you.”</i>");
		output("\n\n<i>“Fair enough,”</i> you say, smiling.");
	}
	// Celise Threesome hook
	else if (flags["AM_CEL_SKIP"] == undefined && flags["AMBER_CREW_SEX"] == 1 && celiseIsCrew() && rand(10) == 0)
	{
		clearMenu();
		showCelise();
		author("Wsan");

		output("You’re just on the way down to see Amber when a girly giggle sounds out from below, <i>inside</i> the ship. There’s really only one person that could be.");
		output("\n\n<i>“Celise? What’re you doing down there?”</i> you call out.");
		output("\n\nA few seconds later and she’s popping up through a grate, her body gradually reforming in front of you until there stands the voracious googirl in all her shiny splendor.");
		output("\n\n<i>“Hiii!”</i> Celise says, waving. <i>“I was just snacking, [pc.name].”</i>");
		output("\n\n<i>You</i> were just on your way to see Amber and as you eye Celise, you");
		if (flags["AMBER_CELISE_THREESOMES"] != undefined) output(" think about inviting her down there.");
		else output(" sense a golden opportunity for the two of them to get acquainted.");

		flags["AM_CEL_SKIP"] = 1;

		addButton(0, "Take With", amberCeliseThreesomeGo, undefined, "Take Celis With", "Take Celise down to see Amber. Something tells you they’ll get along really, <i>really</i> well.");
		addButton(1, "Nah", function ():void
		{
			clearMenu();
			clearOutput();
			showCelise();
			author("Wsan");
			output("<i>“Alright,”</i> you say, smiling. <i>“Don’t let me get in your way, then.”</i>");
			output("\n\n<i>“You’re never in the way, [pc.name]!”</i> she giggles, beginning to drip back down through the drain. <i>“Thanks to you, I never go hungry. See you!”</i>");
			output("\n\nYou wonder if she intended the double entendre there. Shaking your head, you continue down to the hold.");
			addButton(0, "Next", amberInTheHold);
		}, undefined, "Nah", "Let Celise get back to her “ship maintenance.”");

		return;
	}
	else
	{
		//greeting based off of dumbfuck doses given
		if (amberDumbfuckDoses() >= 4) output("<i>“[pc.name]!”</i> Amber cries excitedly, doing a little dance on her hooves. <i>“Are you gonna fuck me? Pleeeaaase come and fuck me...”</i>");
		else if (amberDumbfuckDoses() == 3)
		{
			output("<i>“Hi [pc.name]!”</i> Amber says excitedly, waving. <i>“I was </i>just<i> thinking about you!”</i>");
			output("\n\nThe way her stiffly erect, throbbing cock sways beneath her furred underbelly, you were already pretty sure.");
		}
		else if (amberDumbfuckDoses() == 2) output("<i>“Oh, my favorite person!”</i> Amber says, grinning. <i>“Hi, [pc.name]. Don’t s’pose you’re interested in some relaxing downtime on my bed...”</i>");
		else if (amberDumbfuckDoses() == 1)
		{
			output("<i>“Hi, [pc.name]!”</i> Amber says, smiling. <i>“You here for some chit-chat, or...”</i>");
			output("\n\nThe way she trails off while her gaze slowly travels downward from your face leaves little to the imagination.");
		}
		else output("<i>“Hey, [pc.name]!”</i> Amber says, her ears flitting above her head as she turns to regard you with a smile on her face. <i>“Whatcha doing?”</i>");
	}

	flags["AM_CEL_SKIP"] = undefined;
	amberMainMenu();
}

//main menu for interacting with amber on the ship
public function amberMainMenu():void
{
	clearMenu();
	addButton(0,"Appearance",amberOnshipAppearance,undefined,"Appearance","Get a closer look at Amber");
	addButton(1,"Talk",amberOnshipTalk,undefined,"Talk","Talk to Amber");
	if (amberDumbfuckDoses() <= 2) addButton(2, "Ear Rubs", amberOnshipEarRubs, undefined, "Ear Rubs", "Give Amber’s soft animal ears a nice fluffing and petting.");
	else addDisabledButton(2,"Ear Rubs","Ear Rubs","Somehow you get the feeling Amber’s not really interested in a gentle physical touch.");
	if (amberDumbfuckDoses() <= 2) addButton(3,"Brush Fur",amberOnshipBrushFur,undefined,"Brush Fur","Give Amber’s soft animal ears a nice fluffing and petting.");
	else addDisabledButton(3,"Brush Fur","Brush Fur","You already know the only type of touch Amber’s keen on right now is a much more sensual one.");
	addButton(4,"Sex",amberOnshipSex,undefined);
	
	addButton(13,"Leave Crew",dismissAmber,undefined,"Leave Crew","The ship is no place for a " + (amberDumbfuckDoses() <= 2 ? "cute, ambling deertaur.":"sex-crazed deergirl!") + " Leave her at the apartment you’ve got on Tavros.");
	
	addButton(14,"Leave",crew);
}
//look at amber
public function amberOnshipAppearance():void
{
	clearOutput();
	amberHeader();
	var timeframe:int = 14400; //10 days
	
	output("Amber is a deertaur, all smooth fur and dainty legs from the hips down. Her thick hair reaches down to her shoulders, dark red at the roots and brightening as it reaches the tips. Two animal ears protrude through it from the sides of her head, as articulate as they are distracting. Her eyes are a light blue and her little button nose sits above a mouth often pulled into a genial smile or a humorous smirk.");
	output("\n\n");
	showImage("AmberNakkers");
	output("Freckles spot her skin, dappling her cheeks and shoulders for a start. Some even spot her plump breasts, not quite as big as they might get on other ‘taurs but enough to draw your gaze. Both her nipples and areolae are a luscious pink that matches her lips. Being fairly athletic, Amber is quite lean though not outright skinny. Her hips have an attractive curve to them that seamlessly meets with her tauric half, extending back a few feet.");
	output("\n\nHer brown fur is");
	
	if (flags["AMBER_BRUSHED"] == undefined || GetGameTimestamp() - timeframe > flags["AMBER_BRUSHED"]) output(" a little messy, as you’d expect from having lived in a jungle.");
	else output(" sleek and shiny, your bond evident in its perfect sheen.");
	output(" White spots are scattered across her haunches and parts of her body are wholly white, like her soft underside.");
	
	if(amberThrobbDoses() == 0)
	{
		output("\n\nImpossible to ignore when you’ve known Amber as carnally as you have, her oversized pink equine cock");
		if (amberDumbfuckDoses() >= 3) output(" is completely stiff against her slim body, ever drooling precum thanks to her insane libido.");
		else output(" hangs underneath her slim body, not completely stiff but always on proud display.");
	}
	//Throbbed once:
	else if(amberThrobbDoses() == 1)
	{
		output("\n\nAmber’s thick pink horsecock is now even bigger than it ever was, permanently drooling sloppy precum from its head. You’d swear it throbs with desire whenever you glance at it - which you have to admit to yourself - is often. It’s a very eye-catching cock, and it seems like she enjoys having it as much as you do." + (amberDumbfuckDoses() >= 3 ? " Ever-stiff and wanting due to her insane libido, it bounces against her underside every few seconds.":" It hangs half-hard underneath her slim body, always proudly on display."));
	}
	//Throbbed twice:
	else
	{
		output("\n\nAmber’s massive, mouth-watering gargantuan of a cock puts all but the most endowed to outright shame. Pink, veiny and throbbing in mesmerizing fashion, you can tell at a glance it’s somewhere north of forty inches long and so thick you wouldn’t be able to totally wrap your hands around it. Her beautiful flared cockhead ebbs and swells with her heartbeat, disgorging a thick, sticky stream of spunk across the floor of your ship every couple of seconds as she watches, cheeks flushed and a smile on her face.");
		output("\n\nAt full erection it extends beyond her lower half, finally allowing the dainty ‘taur the vaunted privilege of being able to see her partner while she’s plowing the absolute fuck out of them with her tree trunk of a cock or spewing gallons of equine spunk into their stomach. Something she wildly appreciates, you’re sure." + (amberDumbfuckDoses() >= 3 ? " Thanks to her insane libido, she stands at her full, proud length whenever you happen to be around and likely even when you’re not, always ready for a good fuck.":" Half-hard, her proud length hangs from the underside of her slim body, just waiting for you to take an interest."));
	}
	output(" Backing it up are");
	
	if (amberEquilicumDoses() > 0) output(" four massive, hanging balls between her back legs. Each black orb is bigger than your head and filled with thick equine cum, endowing her with massive cumshots rivalling that of hyperpornstars.");
	else output(" two large, hanging balls between her back legs. Each black orb is as big as a clenched fist and full of equine spunk, just waiting to be unleashed.");
	
	output("\n\nAmber’s rear-mounted pussy is tight, wet, and always found to be glistening with moisture when you take a look at it. She’s more than happy to let you check out the goods,");
	if (amberDumbfuckDoses() >= 4) output(" though with how intently she watches you she notices right away when you look, and from there she’s all but begging for you to fuck her dripping cunt right on the spot.");
	else if (amberDumbfuckDoses() == 3) output(" though once she notices your stare she usually starts asking if you’d like to take her right there.");
	else if (amberDumbfuckDoses() == 2) output(" sometimes asking you if you’d like to partake.");
	else if (amberDumbfuckDoses() == 1) output(" occasionally spreading her legs a little just to enhance the view.");
	else output(" letting you stare at her endowments for as long as you wish.");
	output(" Above it lies her slightly puffy asshole, protruding enough to look inviting.");
	
	output("\n\nAll in all, Amber is both cute and incredibly lurid in the same compact package.");
	pc.changeLust(5);
}
//talk to amber
public function amberOnshipTalk():void
{
	clearOutput();
	amberHeader();
	
	output("What do you want to talk to Amber about?");
	
	clearMenu();
	addButton(0,"Past",amberOnshipTalkPast,undefined, "Past","Ask Amber about her past.");
	if (crew(true) > 0) addButton(1, "Crew", amberOnshipTalkCrew, undefined, "Crew", "Get Amber’s thoughts on the crew, and enable/disable crew content");
	if (flags["AMBER_TALK_STAGE"] >= 1) addButton(2,"Family",amberOnshipTalkFamily,undefined,"Family","Talk to Amber about her family.");
	if (flags["AMBER_TALK_STAGE"] >= 2) addButton(3,"Life",amberOnshipTalkLife,undefined,"Life","Discuss Amber’s current life.");
	if (flags["AMBER_TALK_STAGE"] >= 3)
	{
		if (amberDumbfuckDoses() == 0 && flags["AMBER_CURED"] == undefined) addButton(4, "Cure", amberOnshipTalkCure, undefined, "Cure", "Talk to Amber about curing her condition.");
		else if (amberDumbfuckDoses() == 0 && flags["AMBER_CURED"] == 1) addDisabledButton(4,"Cure","Cure","You have already cured Amber!");
		else addDisabledButton(4,"Cure","Cure","You can’t cure Amber after giving her Dumbfuck.");
	}
	if (flags["AMBER_TALK_STAGE"] >= 4) addButton(5,"Drugs",amberOnshipTalkDrugs,undefined,"Drugs","Ask Amber about giving her drugs and transformatives.");

	if (amberDumbfuckDoses() >= 2) addButton(6, "Changes", amberOnshipTalkChanges, undefined,"Changes","Talk to Amber about the effects Dumbfuck has had on her.");
	
	addButton(14,"Back",amberInTheHold);

}
//talk to amber about her past
public function amberOnshipTalkPast():void
{
	clearOutput();
	amberHeader();
	
	output("<i>“Do you wanna talk about your past, Amber?”</i> you ask. <i>“Don’t have to if you don’t want to, but I’d like to know more about you.”</i>");
	if (amberDumbfuckDoses() >= 4)
	{
		output("\n\n<i>“Nope!”</i> Amber announces cheerfully, fixing you with a widening smile. <i>“I wanna fuck you, [pc.name]. And I wanna fuck you </i>hard<i>.”</i>");
		output("\n\nYou do your best to wring information out of her, but her drug-induced libido is indomitable. All you really get from the conversation before she’s thrusting her cock up and down your [pc.stomach] is that she’s originally from a dead planet, and some mining corp ruined everything. Vagaries at best, but you hadn’t really expected much with as many Dumbfuck pills as she’s swallowed down. On the bright side, her sexual performance is off the fucking charts. She’s not only insatiable but implacable, her cock never going limp and her heavy hanging balls always ready to pump out another load.");
		output("\n\nBy the time you separate from your abrupt, hurried sex, you feel like you’ve learned a little more about her even without the conversation.");
		processTime(10 + rand(10));
		amberRandomSex();
		sweatyDebuff(1);
	}
	else if (amberDumbfuckDoses() == 3)
	{
		if (pc.hasCock()) output("\n\n<i>“Uuuhh, I’d rather talk about why you aren’t slamming the </i>fuck<i> out of my tight little cunt with that cock of yours, [pc.name],”</i> Amber says sweetly, eyeing your groin as she draws closer.");
		else output("\n\n<i>“I’d rather talk about why I’m not slamming the </i>fuck<i> out of that ass of yours, [pc.name],”</i> Amber purrs, drawing closer.");
		output(" <i>“I’ll just give you a quick, um, sum... sum-up of the whole thing.”</i>");
		
		output("\n\nAmber quickly recounts some of the major events of her life, though her focus keeps wandering to sex. You have to keep putting her back on track and you can tell that every time you do, she gets a little less willing to be rerouted. You come away from the conversation both with the knowledge that she came from a dead planet called Ilyon that was ruined by Pyrite Heavy Industries, and a very, very worked-up dryad advancing on you.");
		output("\n\n<i>“Let’s fuck,”</i> Amber growls lustily. Her face is flushed and sweaty, the effort of maintaining a conversation having been just a little too much for her. <i>“C’mon, [pc.name]...”</i>");
		output("\n\n--");
		output("\n\nYou end up fucking Amber as a pseudo-reward for having a conversation, the two of you separating covered in sweat and breathing hard. The Dumbfuck’s really done a number on her libido - seems like you’ll have to work to get words out of her...");
		processTime(10 + rand(10));
		amberRandomSex();
		sweatyDebuff(1);
	}
	else
	{
		output("\n\n<i>“Yeah, it’s fine,”</i> she nods, then smirks. <i>“Not the most glamorous origin story, though.”</i>");
		output("\n\n<i>“Originally, I came from a tiny mining planet called Ilyon V. Unfortunately, I was born </i>after<i> the planet had been stripped dry of its resources. There was nothing left by the time I was up and walking about. Just the poor and the downtrodden, those without the means to get off-planet after the exploitation was done.”</i>");
		output("\n\n<i>“So you were homeless?”</i>");
		output("\n\n<i>“We all were,”</i> she says, grinning despite herself. <i>“None of us had anything. Where I was - Urgon - was just a city of homeless. There was a lot of fighting, mostly without reason. Nobody had much to steal, after all. It was more tribal than the Zil in some ways.”</i>");
		output("\n\n<i>“That’s horrible,”</i> you say, leaning back and reflecting on what an entire city of homeless must be like. You’d read about ‘dead planets’ when you were younger, but");
		if(flags["BEEN_ON_TARKUS"] != undefined) output(" until you’d visited Tarkus, you hadn’t really understood.");
		else output(" it’s hard to wrap your head around one when you haven’t been."); 		
		output(" Then something occurs to you. <i>“Wait. Do you know what company it was that mined Ilyon?”</i>");
				
		output("\n\n<i>“Oh yeah, I’ll never forget that one,”</i> Amber says lazily, tracing the letters in the air. <i>“The logo was left all over scattered and broken equipment. Big block red letters. Pirate Industries or something. I couldn’t read at the time.”</i>");
		output("\n\n<i>“Pyrite Heavy Industries,”</i> you say, grimacing.");
		if (amberWargiiHold()) output(" <i>“Guess they’ve been doing shady shit for as long as I’ve been alive”.</i>");
		else output(" <i>“I’d heard rumors. Pretty easy to believe now.”</i>");
		
		output("\n\n<i>“Yup!”</i> Amber says. <i>“The way I heard the story told, our planetary government basically sold themselves to the mining company for kickbacks. Then up and left with them when they pulled out.”</i>");
		output("\n\n<i>“Just leaving an entire planet of people to run themselves?”</i> you say, incredulous.");
		output("\n\n<i>“So I was told,”</i> Amber nods. <i>“Of course, the actual story could be different. I was very distanced from the events, after all... but honestly, I doubt it.”</i>");
		output("\n\n<i>“Yeah, agreed. I’m sorry, Amber,”</i> you tell her. <i>“I don’t know if it means anything to you, but I promise we’ve never done that and never will. We always negotiate to ensure this kind of thing doesn’t happen.”</i>");
		output("\n\n<i>“Oh, are you in a mining company too?”</i> she asks, smiling. <i>“Wow, that’s ironic. Of all the people to be saved by.”</i>");
		output("\n\n<i>“Haha...”</i> you laugh weakly. <i>“It’s actually more like I </i>am<i> the mining company. I’m the " + pc.mf("heir", "heiress") + " of Steele Corporation.”</i>");
		output("\n\n<i>“Wow, you’ve got your own company!”</i> Amber gasps in wonder, eyes wide. <i>“That’s amazing!”</i>");
		output("\n\n<i>“Yeah, and I promise we’re not like Pyrite,”</i> you assure her. <i>“My dad kept everything above-board when it came to people, his or otherwise.”</i>");
		output("\n\n<i>“That’s good to hear,”</i> she says, smiling. <i>“How about your past? I hope you’ve got a happy story to follow up mine!”</i>");
		
		output("\n\nYou tell Amber all about your childhood, about how");
		switch(flags["PC_UPBRINGING"])
		{
		//Pampered
		case GLOBAL.UPBRINGING_PAMPERED:
			output(" your father provided everything for you, often at cost to himself. He always made sure you had everything you needed to be comfortable.");
			break;
		//Athletic
		case GLOBAL.UPBRINGING_ATHLETIC:
			output(" you spent a lot of it playing sports and taking part in physical competitions, your father cheering you on. He would blow off meetings just to come see you perform.");
			break;
		//Bookworm
		case GLOBAL.UPBRINGING_BOOKWORM:
			output(" you spent a lot of your childhood reading and being a curious kid. Your father was always happy to indulge your desire to learn, making time for you whenever he could.");
			break;
		//Austere
		case GLOBAL.UPBRINGING_AUSTERE:
			output(" your father made you earn everything you have, firmly encouraging you to reach out and take your destiny for yourself. He always made sure to let you know you were loved, though.");
			break;
		//Balanced
		case GLOBAL.UPBRINGING_BALANCED:
			output(" you dabbled in pretty much everything a kid can. Sports, reading, learning, all while your dad cheered you on from behind. He was ever-present in your life, encouraging you to do whatever you set your mind to.");
			break;
		}
		
		output("\n\n<i>“It sounds like your father was an amazing person, [pc.name],”</i> Amber says gently. <i>“I think he would be thrilled to see how you’ve turned out.”</i>");
		output("\n\n<i>“Yeah, I hope so,”</i> you grin. <i>“Dad really wanted me to make something of myself. It’s why I’m out here, actually.”</i>");
		output("\n\nYou continue on with your exposition, explaining how you came to be a");
		switch(pc.characterClass)
		{
		case GLOBAL.CLASS_SMUGGLER:
			output(" smuggler.");
			break;
		case GLOBAL.CLASS_MERCENARY:
			output(" mercenary.");
			break;
		case GLOBAL.CLASS_ENGINEER:
			output(" tech specialist.");
			break;
		}
		output(" Amber listens with rapt attentiveness as you detail the gritty details of space exploration, then finish up with what started your journey.");
		
		output("\n\n<i>“So you started from a planet called Tavros and made your way to Mhen’ga?”</i> she asks.");
		output("\n\n<i>“Yeah. It was pretty much my first stop!”</i> you say.");
		if(flags["MHENGA_PROBE_CASH_GOT"] != undefined || flags["DIDNT_ENGAGE_RIVAL_ON_MHENGA"] != undefined || flags["LOST_TO_DANE_ON_MHENGA"] != undefined) output(" <i>“One of his probes was there, after all. Had to wade through the jungle to get it.”</i>");
		else output(" <i>“One of his probes is there, after all.”</i>");
		
		output("\n\n<i>“And that’s where you met me... wow,”</i> Amber says, shaking her head and wiping her eyes a little. <i>“I’m getting a little misty-eyed here. Haha, not that our first meeting was very romantic!”</i>");
		output("\n\n<i>“Maybe not, but I’ve always been one for unorthodox relationships,”</i> you say, grinning. Your smile fades after a few seconds. <i>“Amber... I’m sorry I couldn’t get you immediately. If I’d known-”</i>");
		output("\n\n<i>“Don’t,”</i> she says, putting her finger to your [pc.lipsChaste]. <i>“You couldn’t have known. Don’t beat yourself up over me. It’s a miracle I’m here at all. You’re my miracle, [pc.name].”</i>");
		
		if (pc.isNice()) 
		{
			output("\n\n<i>“Aw, thanks Amber,”</i> you say, smiling. Now it’s your turn to get a little misty-eyed. <i>“I’m just glad you’re aboard now.”</i>");
			output("\n\nYou embrace her, her arms gently wrapping around your back in an intimate hug. It’s a nice feeling to have her holding you. When you part, she gives you a gentle smile.");
		}
		else if (pc.isMisc())
		{
			output("\n\n<i>“Aw, that’s the nicest thing anyone’s ever said to me,”</i> you say, grinning. <i>“Thanks, Amber. I’m happy you’re here.”</i>");
			output("\n\nYou embrace her, her arms gently wrapping around your back in an intimate hug. It’s a nice feeling to have her holding you. When you part, she gives you a gentle smile.");
			
		}
		else
		{
			output("\n\n<i>“Heh,”</i> you say, inwardly wondering if someone like you could deserve to be called a miracle. It’s more for her than you when you reply. <i>“Thanks, Amber.”</i>");
			output("\n\nShe steps closer and wraps her arms around your back, catching you in an intimate hug. You have to admit, it’s nice to have her aboard. You pat her on the back and rustle her hair a little. When she pulls back, she’s wearing a gentle smile.");
		}
		
		output("\n\n<i>“Did you want to talk some more, [pc.name]? I’ve always got time for you.”</i>");
		processTime(30);

	}
	
	addDisabledButton(0,"Past","Past","You just talked about this.");
	//unlock family
	if (flags["AMBER_TALK_STAGE"] == undefined || flags["AMBER_TALK_STAGE"] == 0)
	{
		flags["AMBER_TALK_STAGE"] = 1;
		addButton(2,"Family",amberOnshipTalkFamily,undefined,"Family","Talk to Amber about her family.");
	}
}

//talk to amber about the crew
public function amberOnshipTalkCrew():void
{
	clearOutput();
	amberHeader();
	if (amberIsCrewContentOn())
	{
		output("Do you want to disable crew content?");
		clearMenu();
		addButton(0,"Yes",amberOnshipCrewSexYes,false);
		addButton(1,"No",amberOnshipCrewSexNo,true);
	}
	else
	{
		output("<i>“So, how do you like the crew so far?”</i> you ask.");
		if (amberDumbfuckDoses() >= 3)
		{
			output("\n\n<i>“They’re cool,”</i> Amber says, smiling. <i>“But the only one of them fucking me is you, so.”</i>");
			output("\n\nShe shrugs.");
		}
		else
		{
			output("\n\n<i>“Everyone’s been nice to me so far, though I don’t know if I’ve met them all,”</i> Amber says, smiling at you. <i>“I suppose we’ll be picking up more as we travel, won’t we?”</i>");
			output("\n\n<i>“It’s a definite possibility,”</i> you nod, pleased she’s already using the term ‘we’. <i>“There’s a diverse bunch out there.”</i>");
			output("\n\n<i>“Hopefully they’re all as friendly as you!”</i> Amber giggles.");
			output("\n\nThere’s an opportunity here to let her experience the crew a little more thoroughly, should you deem it appropriate.");
		}
		output("\n\nDo you want to enable crew content?");
		output("\n\n<b>Amber will seek out other crew members to take care of her libido in addition to you.</b>");
		clearMenu();
		addButton(0,"Yes",amberOnshipCrewSexYes,true);
		addButton(1,"No",amberOnshipCrewSexNo,false);
	}
}
//toggle crew sex on or off
public function amberOnshipCrewSexYes(enable:Boolean):void
{
	clearOutput();
	amberHeader();
	if (enable)
	{
		if (amberDumbfuckDoses() >= 3)
		{
			var sel:Array = [];
			if (celiseIsCrew()) sel.push(1);
			if (annoIsCrew()) sel.push(2);
			if (mitziIsCrew()) sel.push(3);
			var i:int = sel.length;
			var rn:int;
			
			output("<i>“You can fuck the others too,”</i> you tell her, smirking as her eyes light up.");
			
			if (i > 0)
			{
				rn = rand(i);
				if (sel [rn] == 1)
				{
					output("\n\n<i>“Seriously?!”</i> Amber cries. <i>“Oh man! Next time I see Celise I am gonna fucking </i>pound<i> her! Or, or we can fuck her at the same time! I can’t wait!”</i>");
				}
				else if (sel [rn] == 2)
				{
					output("\n\n<i>“Yesss!”</i> Amber hisses victoriously, cock lurching beneath her. <i>“Oh man, I hope Anno’s up for it! Maybe she’d go for a threesome...”</i>");
				}
				else if (sel [rn] == 3)
				{
					output("\n\n<i>“Fuck yeah!”</i> Amber gloats, grinning. <i>“I’m gonna wear Mitzi like a fucking condom, the little cockslut!”</i>");
				}
			}

			output("\n\nThe sexual rampage across the ship should be fun to watch.");
			
		}
		else
		{
			output("<i>“Speaking of friendliness, actually, I had a plan to help you out,”</i> you say, spreading your hands. <i>“Interested?”</i>");
			output("\n\n<i>“I’m sure any plan you come up with is a good one,”</i> Amber replies, smiling gently. <i>“What is it?”</i>");
			output("\n\n<i>“There’ll be times I’m not around. Sometimes I have to explore a new planet or an installation, a base,");
			if (flags["ENTERED_KORGI_HOLD"] != undefined) output(" sometimes even what amounts to a castle built on a planet of ice and snow.");
			else output(" dungeons, you name it.");
			output(" When that happens, sometimes it takes days. Worst case, weeks.”</i> you tell her.");
			
			output("\n\n<i>“Oh...”</i> she says, looking crestfallen.");
			output("\n\n<i>“Hey, chin up, that’s what the plan is about,”</i> you say, laying your hand on her shoulder and smiling. <i>“See, people who join my crew tend to be pretty sexually free-roaming. That’s not to say </i>all<i> of them will have sex with you, but I’m sure at least someone will want to help out. So don’t worry, okay?”</i>");
			output("\n\n<i>“So...”</i> Amber starts, looking at you hesitantly. <i>“Do you not care if I have sex with other people, [pc.name]? Uh, because I... I thought you might...”</i>");
			output("\n\nShe trails off, looking a little sad. You shake your head.");
			output("\n\n<i>“You’ve got the wrong idea, Amber,”</i> you say. <i>“You </i>need<i> the help. Plus,”</i> you add with a smile, <i>“if you think I’m not gonna");
			if (flags["DRYAD_BLEWHER"] != undefined || flags["DRYAD_YOURCUNT"] != undefined || flags["DRYAD_ANALEDYOU"] != undefined) output(" swing by to get some of your fat horsecock for");
			else output(" drop by to fuck the heat out of you");
			output(" myself, you’re gonna be real surprised.”</i>");
			
			output("\n\n<i>“God, I never know what to say when you’re so direct,”</i> Amber mumbles, putting her fingertips to her burning cheeks. <i>“Do other girls have these problems?”</i>");
			output("\n\n<i>“Never had any complaints,”</i> you say, shrugging nonchalantly. <i>“So are you okay with the plan?”</i>");
			output("\n\n<i>“It </i>is<i> a good plan,”</i> Amber admits. <i>“But...”</i> she sighs. <i>“I’m just going to say it. [pc.name], you mean more to me than probably anyone I’ve ever met. I’ve never been in love, or even felt it. I don’t really know much about it, if anything. But I know that you’re special to me in some way, and you always will be.”</i>");
			output("\n\n<i>“Amber, it’s not like you’re gonna die if you have sex with another person,”</i> you sigh.");
			output("\n\n<i>“I know! But I’m telling you this </i>now<i> so you know in advance that it’s the heat controlling me and using my mouth to say dumb things,”</i> she says, looking at you meaningfully. <i>“I feel like telling you </i>after<i> I heatfuck one of your crew hard enough to make both of us scream would be a little pointless.”</i>");
			output("\n\n<i>“Okay. And thanks, Amber,”</i> you say, leaning back and smiling again. <i>“You’re special to me too, it’s why you’re here. I just want to make sure you’re taken care of.”</i>");
			output("\n\n<i>“I know,”</i> she says, smiling back. <i>“And thank you, </i>Captain<i>.”</i>");
			output("\n\nYou spend a few minutes chit-chatting about the crew and the ship in general before you make to leave, giving Amber a kiss on the lips before you go.");
			
		}
		output("\n\n<b>Crew content enabled. You can revisit this menu to disable it if desired.</b>");
		flags["AMBER_CREW_SEX"] = 1;
		
	}
	else
	{
		output("Crew content is now disabled.");
		output("\n\n<b>Amber will now look only to you to take care of her libido.</b>");
		flags["AMBER_CREW_SEX"] = 0;
	}
	processTime(5);
	clearMenu();
	addButton(0,"Next",amberOnshipTalk);
}
//leave crew sex as is
public function amberOnshipCrewSexNo(enable:Boolean):void
{
	clearOutput();
	amberHeader();
	if (enable)
	{
		output("<b>Crew content remains enabled. You can revisit this menu to disable it if desired.</b>");
	}
	else
	{
		output("No, you’re more than capable of handling Amber’s needs on your own.");
		output("\n\n<i>“I’m sure they will be, especially to a cutie like you, Amber,”</i> you say, winking.");
		output("\n\n<i>“You certainly have a silver tongue!”</i> she murmurs, blushing slightly and smiling.");
		output("\n\n<b>Crew content disabled. You can revisit this menu to enable it if desired.</b>");
	}
	processTime(5);
	clearMenu();
	addButton(0,"Next",amberOnshipTalk);
}
//talk to amber about her family
public function amberOnshipTalkFamily():void
{
	clearOutput();
	amberHeader();
	if (amberDumbfuckDoses() >= 3)
	{
		output("<i>“So do you have a family, Amber?”</i> you ask.");
		output("\n\n<i>“Nuh uh,”</i> Amber says, shaking her head from side to side. <i>“Just the village- er, city. Small place ‘n all that, y’know.”</i>");
		output("\n\n<i>“But you had friends,”</i> you prod her.");
		output("\n\n<i>“Yup! Lots of ‘em,”</i> she says, smiling and nodding. <i>“Hmm. They didn’t come with me to Mhen’ga, though.”</i>");
		output("\n\nHer smile begins to fade a little.");
		output("\n\n<i>“You’ve still got me,”</i> you remind her.");
		output("\n\n<i>“Yeah!”</i> Amber says, beaming again. <i>“You’re the greatest, [pc.name].”</i>");
		output("\n\nShe’s quick to recover, but you feel a little bad poking into her past when she’s so happy otherwise. You decide to change the subject.");
		processTime(3);
			
	}
	else
	{
		output("<i>“So if you don’t mind me asking,”</i> you say, looking to Amber as she nods, encouraging you to continue, <i>“what about your family? Were they ever in the picture?”</i>");
		output("\n\n<i>“Nope,”</i> Amber says, shaking her head. <i>“No parents, no siblings. Dunno if they went offworld or what, but they didn’t stick around for me.”</i>");
		output("\n\n<i>“I’m sorry, Amber.”</i>");
		output("\n\n<i>“Eh,”</i> she shrugs. <i>“I’ve heard a saying that it takes a village to raise a child. That was pretty much what I got. Besides - can’t miss what you never had, right?”</i>");
		output("\n\nYou don’t think for a second she’s telling the truth about that, but there’s no sense in talking about it. Even your worst run-ins with " + chars["RIVAL"].mf("Jack","Jill") + " don’t compare to not having a family at all.");
		output("\n\n<i>“So you banded together with your friends,”</i> you say.");
		output("\n\n<i>“Right,”</i> Amber says, smiling. <i>“Tight-knit little bunch, we were. Running around causing trouble. We didn’t have much, but kids are inventive.”</i>");
		output("\n\n<i>“So what happened?”</i> you ask. <i>“How did you end up on Mhen’ga all alone?”</i>");
		output("\n\n<i>“Ah,”</i> she replies, smirking. <i>“Thanks to bureaucracy.”</i>");
		output("\n\n<i>“I mean, I’ve seen enough of it to believe that,”</i> you sigh.");
		output("\n\n<i>“Ha!”</i> Amber says, snickering. <i>“Well, after a few years - maybe ten, or something - the UGC decided to respond to, in their words, an ongoing humanitarian crisis. They arrived in gigantic ships, taking everyone off planet. Everyone who wanted to go, anyway.”</i>");
		output("\n\n<i>“Surely everyone wanted to go?”</i> you ask.");
		output("\n\n<i>“The vast majority, yeah,”</i> Amber agrees, nodding. <i>“No-brainer, right? Eke out a miserable existence or take a shot at a new one. Though I ended up doing the former in the end anyway when I got here. ‘Til I met you, [pc.name],”</i> she says, winking at you.");
		output("\n\n<i>“None of your friends came with you?”</i>");
		output("\n\n<i>“They didn’t get a choice,”</i> Amber shrugs. <i>“The UGC just split people up and spread them out all over the galaxy, redistributing us to new planets. I got dumped here with a few hundred other people and we all kinda just went our separate ways. I uh,”</i> she says, grimacing, <i>“didn’t really handle the new life well.”</i>");
		output("\n\n<i>“Is that how you ended up with all the mods?”</i>");
		output("\n\n<i>“Uh huh,”</i> she sighs. <i>“I wanted something to take my mind off it all and turned to drugs.”</i> Amber shrugs, then laughs hollowly. <i>“Well, it worked!”</i>");
		output("\n\n<i>“Amber...”</i> you murmur. She’s still hurting even now, behind the smile.");
		output("\n\n<i>“Hey, it’s not all bad,”</i> Amber reassures you, smiling a little more genuinely now. <i>“We’ve had a lot of really, really good sex.”</i>");
		output("\n\n<i>“That </i>is<i> true,”</i> you admit. <i>“So hey, sorry to keep prodding at you like this, but I’ve always wondered: were you always a centaur?”</i>");
		output("\n\n<i>“Nope!”</i> she says, shaking her head. <i>“I’m actually human. I mean, I still look pretty much like I always did if you ignore everything below the waist!”</i>");
		output("\n\nYou step back and tilt your head, putting your hand to your chin while Amber smiles and strikes a little pose. The white freckled face, fiery red hair, plump breasts and flat stomach really are human, you suppose.");
		output("\n\n<i>“I’m not so sure about the cute little deer ears sticking out from the side of your head, though,”</i> you muse.");
		output("\n\n<i>“Oops!”</i> Amber laughs, flicking her ears up and down. <i>“They’ve been there for so long I completely forgot! I haven’t looked in a mirror for ages.”</i>");
		output("\n\n<i>“Well, take it from me - you’re extraordinarily pretty,”</i> you tell her. <i>“Like you just pranced off the cover of a magazine.”</i>");
		output("\n\n<i>“Aw! Thanks, [pc.name],”</i> Amber says, grinning while her face reddens. <i>“Jeez, it’s hard to get used to such direct compliments! Guess I won’t need a mirror, then. Anything else you wanna talk about?”</i>");
		processTime(10);
	}
	addDisabledButton(2,"Family","Family","You just talked about this.");
	//unlock life
	if (flags["AMBER_TALK_STAGE"] == 1)
	{
		flags["AMBER_TALK_STAGE"] = 2;
		addButton(3,"Life",amberOnshipTalkLife,undefined,"Life","Discuss Amber’s current life.");
	}
}

//talk to amber about her current life
public function amberOnshipTalkLife():void
{
	clearOutput();
	amberHeader();
	if (amberDumbfuckDoses() >= 3)
	{
		output("<i>“So how’s life, Amber?”</i> you ask with a smile.");
		output("\n\n<i>“It’s great!”</i> Amber says, spreading her arms wide. <i>“I love it. Everything’s so much more </i>fun<i> here! Especially when we fuck,”</i> she murmurs, putting a finger to her lips. <i>“I looove that part...”</i>");
		output("\n\n<i>“I’ll bet you do,”</i> you say, grinning at the docile deertaur. <i>“No complaints, then.”</i>");
		output("\n\n<i>“Nooope!”</i> she says, eyeing you. <i>“Well, if you wanna pay my cock some attention...”</i>");
		output("\n\n<i>“Sure,”</i> you say, putting a hand on her side and leaning down.");
		output("\n\n<i>“Yaaay! I- I- oh- oh, gnngh- nnnh!”</i> Amber starts, suddenly doubling over and unconsciously thrusting her hindquarters forward. <i>“Nnuuhhh! Uhhh!”</i>");
		output("\n\nWith one hand roughly squeezing her sensitive, flaring cockhead and the other vigorously jacking her off, you force an orgasm out of her in thirty seconds. Still shaking and panting, she stands there while you grin up at her.");
		output("\n\n<i>“Again?”</i> you ask.");
		output("\n\n<i>“Yes! Yes!”</i> comes the immediate reply.");
		output("\n\nBy the time your ‘conversation’ is over, Amber’s soaked both the floor and your hands in her equine jizz. Raising your hands, you let her lap at your fingers until only the smell of her remains. She eyes you hungrily even as you change the subject, only one thing really on her mind.");
		flags["AMBER_LASTCUM"] = GetGameTimestamp();
		processTime(10);
			
	}
	else
	{
		output("<i>“Well, I think we’ve covered pretty much the entire past between us,”</i> you say, smiling. <i>“So how’s life now?”</i>");
		output("\n\n<i>“It’s, well, great,”</i> Amber says, shrugging and smiling. <i>“Ever since you picked me up it’s been smooth sailing. I have you");
		if (amberIsCrewContentOn()) output(" and the crew");
		output(" to help me out with my heat, and then on top of that I get to have real, actual sex with you too,”</i> she says, smirking. <i>“It’s enough to make a lady content, that’s for sure.”</i>");
		
		output("\n\n<i>“Good to hear,”</i> you reply, grinning. <i>“Glad you’re not tired of me just yet.”</i>");
		output("\n\n<i>“Keep me fed and watered and I don’t think I ever will be!”</i> Amber giggles. <i>“Well, that and never stop having sex with me. You’re like the perfect partner, I don’t know how you do it.”</i>");
		output("\n\n<i>“Ah, just comes natural,”</i> you say, modestly brushing your nose as Amber laughs.");
		output("\n\n<i>“So humble, too! Such a play[pc.boyGirl],”</i> she snickers.");
		output("\n\n<i>“So no complaints, I take it,”</i> you say, still smiling.");
		output("\n\n<i>“Life is good,”</i> Amber agrees.");
		processTime(5);
	}
	addDisabledButton(3,"Life","Life","You just talked about this.");
	//unlock cure
	if (flags["AMBER_TALK_STAGE"] == 2)
	{
		flags["AMBER_TALK_STAGE"] = 3;
		addButton(4, "Cure", amberOnshipTalkCure, undefined, "Cure", "Talk to Amber about curing her condition.");
	}
}
//talk to amber about a cure
public function amberOnshipTalkCure():void
{
	clearOutput();
	amberHeader();

	output("<i>“So, about your condition,”</i> you begin, Amber giving you a nod. <i>“Sorry if this is insulting, but do you </i>want<i> it cured?”</i> you ask. <i>“I have to be sure.”</i>");
	output("\n\n<i>“No, it’s okay,”</i> Amber says, grinning a little. <i>“I can see why you’d wanna make sure given how ‘enthusiastic’ I can get... ahem!”</i> She coughs, her cheeks flushing a little. <i>“Anyway, that’s a little complicated.”</i>");
	output("\n\n<i>“Complicated?”</i> you echo. <i>“Why’s that?”</i>");
	output("\n\n<i>“Well, originally I would have done anything to be rid of it,”</i> Amber explains, pressing her fingertips together. <i>“I was more animal than person, constantly fading in and out of being in control of my own body. Just looking for someone to stick my cock in. And then you,”</i> she falters, her expression softening as she looks at you. <i>“You saved me. I don’t have to worry about that any more.”</i>");
	output("\n\n<i>“Sorry, I’m still- still getting used to that part,”</i> she adds, hanging her head a little. You take a step forward and put your hand against her warm, freckled cheek to comfort her. Leaning into your touch, she closes her eyes and smiles.");
	output("\n\n<i>“Well,”</i> she eventually continues, <i>“now that I’m with you, </i>everything’s<i> different. I mean, I have a place to live, sleep, and even eat! I have...”</i> she trails off, raising her head and opening her eyes full of shimmering, unspilled tears. <i>“I have a reason to live.”</i>");
	output("\n\nYou hug Amber against your chest, letting her silently dry her eyes while you run your hand through her hair and rub her back, comforting her with your presence.");
	output("\n\n<i>“Thanks,”</i> she mutters, pulling back after a little while. <i>“Sorry about that, [pc.name]. I’m still kind of a mess-”</i>");
	output("\n\n<i>“You’re </i>not<i> a mess,”</i> you tell her, stern but calm. <i>“You’re amazing, Amber. The fact we can even stand here and have this conversation is proof of that. So don’t call yourself a mess, okay? It’s not true and I don’t like hearing you be down on yourself.”</i>");
	output("\n\n<i>“Wow,”</i> Amber says, smiling again. <i>“You really do care about me, huh?”</i>");
	output("\n\n<i>“Of course.”</i>");
	output("\n\n<i>“How come the teasing only works when you do it?”</i> she mumbles to herself.");
	output("\n\nYou take a little while to get back on track.");
	output("\n\n<i>“So you don’t mind your current life?”</i> you ask.");
	output("\n\n<i>“I mean, if you go to all the effort of finding a cure after you’ve already saved my life, I’ll take it,”</i> Amber says. <i>“Even if we both enjoy it, I know it can be uh, a bit of a burden. It might seem fine now, but maybe after three months have gone by and I’m still showing up at your door breathing hard and needing a fuck you’ll be tired of it.”</i>");
	output("\n\nYou start to say something but she stops you, explaining herself. <i>“I don’t mean that you’re definitely gonna get tired of me because I suck, or anything! Just that, well, you haven’t lived with the problem.”</i>");
	output("\n\n<i>“Hmm,”</i> you muse. This is complicated. It looks like she doesn’t mind her current state, but also isn’t averse to being cured of it. You suppose that maybe, in a way, it’s become part of her identity. <i>“So it’s up to me then?”</i>");
	output("\n\n<i>“I’m sorry to dump that on you,”</i> Amber says, grimacing. <i>“I mean it. I don’t like that I’m weighing you down with personal stuff. But...”</i> she sighs. <i>“I can’t do it myself. I wouldn’t know where to start, or who to see. I’ve barely interacted with anyone in the past few years. I uh, I don’t know if I can really even handle a real society.”</i>");
	output("\n\n<i>“It’s okay,”</i> you murmur, rubbing one of her soft, furred ears. <i>“It’s okay to be nervous, Amber. And don’t worry, I can handle responsibility.”</i>");
	output("\n\n<i>“Mmmm,”</i> she hums, leaning into your caress.");
	output("\n\n<i>“So you don’t mind being cured or not?”</i> you ask, leaning in to rub her other ear too. <i>“What if it turns you back into a human?”</i>");
	output("\n\n<i>“Nnnnh... I wouldn’t be too bothered,”</i> she sighs, happily letting you stroke her ears. <i>“I might miss these ear rubs though...”</i>");
	output("\n\nSo in the end, the resolution lies with you. You could cure her, leave her as she is - she doesn’t seem to mind too much either way now that she’s with you - or maybe even change her a little yourself. You don’t think she’d mind, and might even be keen to try out some of them.");

	pc.changeLust(10);
	processTime(10);

	addDisabledButton(4,"Cure","Cure","You just talked about this.");
	//unlock drugs
	if (flags["AMBER_TALK_STAGE"] == 3)
	{
		flags["AMBER_TALK_STAGE"] = 4;
		addButton(5,"Drugs",amberOnshipTalkDrugs,undefined,"Drugs","Ask Amber about giving her drugs and transformatives.");
	}
}
//talk to amber about taking drugs
public function amberOnshipTalkDrugs():void
{
	clearOutput();
	amberHeader();
	
	//first time this talk, flag will be at 4, will be 5 thereafter
	if (flags["AMBER_TALK_STAGE"] == 4)
	{
		output("<i>“Hey, so if you’re okay with your current state,”</i> you ask, watching Amber for her reaction, <i>“how big of a change would a transformative have to be before you said no?”</i>");
		output("\n\n<i>“Hoho, I thought you might end up asking about this,”</i> Amber says, grinning. <i>“What kind? Honestly, there’s a small part of me that thinks being some kind of a... a sexual beast or something, is really hot. So if you wanted to spice me up a little, well...”</i> she murmurs, hooding her eyes and smiling devilishly at you. <i>“I wouldn’t say no.”</i>");
		output("\n\nYou can almost see the little horns on her head and smell the brimstone.");
		output("\n\n<i>“Alright,”</i> you reply, grinning back at her. <i>“We’ll come back to this when I’ve got specifics.”</i>");
		output("\n\n<i>“Sounds like fun,”</i> Amber says, wiggling her eyebrows suggestively.");
		output("\n\n<b>This is for giving Amber transformatives. These may lock you out of curing her.</b>");
		flags["AMBER_TALK_STAGE"] = 5;
		processTime(3);
		clearMenu();
		addButton(0,"Next",amberOnshipTalk);
	}
	else
	{
		if (amberDumbfuckDoses() >= 4) output("<i>“Wow! You’ve got even </i>more<i> pills for me, [pc.name]?”</i> Amber asks in awe.");
		else if (amberDumbfuckDoses() == 3) output("<i>“Mmm, gonna make me pop another sexy pill, [pc.name]?”</i> Amber purrs.");
		else if (amberDumbfuckDoses() == 2) output("<i>“Ooh, here to give me more Dumbfuck?”</i> Amber says interestedly.");
		else if (amberDumbfuckDoses() == 1) output("<i>“Got any more cute pills for me to take, [pc.name]?”</i> Amber asks, smiling innocently.");
		else output("<i>“Oh?”</i> Amber replies innocently, smiling at you. <i>“Do you have something for me, [pc.name]?”</i>");

		clearMenu();
		if (pc.hasItemByClass(Dumbfuck, 1)) addButton(0, "Dumbfuck", amberOnshipTalkDumbfuck,undefined,"Dumbfuck","Increase Amber’s libido at the cost of some intelligence. Four times only.");
		else addDisabledButton(0, "Dumbfuck", "Dumbfuck", "If you had some Dumbfuck, you could boost Amber’s libido.");
		if (amberEquilicumDoses() < 1)
		{
			if (pc.hasItemByClass(Equilicum, 1)) addButton(1,"Equilicum",amberOnshipTalkEquilicum,undefined,"Equilicum","Give her Equilibricum, boosting her cum production and capacity. One time only.");
			else addDisabledButton(1,"Equilicum","Equilicum","If you had some Equilibricum, you could boost Amber’s cum production and capacity.");
		}
		else addDisabledButton(1, "Equilicum", "Equilicum", "You have already given her a dose.");
		
		if (pc.hasItemByClass(Throbb, 1) && amberThrobbDoses() <= 1) {
			 addButton(2, "Throbb", amberOnShipTalkThrobb, undefined, "Throbb",amberThrobbDoses() == 0 ? "Introduce Amber to the concept of 'bigger is better'." : "Pump Amber up juuust a bit more…");
		}
		else {
			addDisabledButton(2, "Throbb", "Throbb", amberThrobbDoses() > 1 ? "She has already taken the maximum safe amount." : "You need some Throbb first.");	
		}
		addButton(14,"Back",amberOnshipTalk);
	}
}
//talk to amber about taking dumbfuck
public function amberOnshipTalkDumbfuck():void
{
	clearOutput();
	amberHeader();
	
	if (amberDumbfuckDoses() >= 3)
	{
		output("Standing in front of the horny, expectant taurgirl, you hold the pill in your hand. Should you give it to her?");
	}
	else if (amberDumbfuckDoses() == 2)
	{
		output("<i>“Got another piece of candy for you,”</i> you say, holding out a purple pill. <i>“What do you say?”</i>");
		output("\n\n<i>“Pleeeaaase gimme the candy, [pc.name],”</i> Amber begs, pouting and giving you puppy eyes. <i>“I wanna get dumbfucked again... I’m so fucking horny!”</i>");
	}
	else if (amberDumbfuckDoses() == 1)
	{
		output("<i>“So,”</i> you say, holding up a small purple pill between your fingertips in a narrow V. <i>“Wanna go another round?”</i>");
		output("\n\n<i>“You know it!”</i> Amber says cheerily, her hooves pitterpatting on the floor in excitement. <i>“Dumbfuck me up, cutie. Then take your stud for a ride!”</i>");
	}
	else
	{
		output("<i>“Yeah, actually, I got you these,”</i> you say, showing her a handful of small purple pills. She gives them an interested gaze, reading off the imprinted label.");
		output("\n\n<i>“D-U-M-B-F... Oh wow, that’s kinda blatant,”</i> Amber laughs, ruffling her bright red hair and letting it run down her shoulder. <i>“But I’ve gotta be honest,”</i> she murmurs, biting her lip, <i>“even just the thought of what the name implies makes me kinda horny.”</i>");
		output("\n\n<i>“‘Attagirl,”</i> you say, grinning before your expression softens somewhat. <i>“It’s just like you think, though. You’ll lose a bit of smarts if you take it and gain a lot - a </i>lot<i> - of libido. The more you take, the more pronounced it is.”</i>");
		output("\n\n<i>“I like how the first idea that occurs to you is to give me a drug that makes my heat </i>worse<i>,”</i> Amber teases, sticking her tongue out at you. <i>“The side effects, well. I don’t really care, [pc.name]. I know you’ll take care of me.”</i>");
		output("\n\n<i>“Alright. But you do know,”</i> you say, inclining your head, <i>“that you’re not gonna think the same way after you take some. It’s pretty likely that you’ll lose what lingering inhibitions you have. At that point, if I ask you to take more, you probably won’t even think about refusing. Your well-being will be entirely within my hands, Amber.”</i>");
		output("\n\n<i>“Isn’t it already?”</i> she says casually, arching an eyebrow.");
		output("\n\n<i>“I mean, yeah, in a manner of speaking...”</i> you start before Amber waves you off, smiling.");
		output("\n\n<i>“Sorry, just giving you a hard time,”</i> she says. <i>“I know. Look, [pc.name], I haven’t had... the greatest life so far. Meeting you has definitely been the high point of it all. If you think it’d be hot to turn me into a drooling bimbo fuckbeast that’s always happy and always down for a rutting, well... look, all I’m saying is that it could be an improvement,”</i> she finishes, shrugging. <i>“I wouldn’t mind being your hot and ready bimbo stud. Well, more than I already am.”</i>");
		output("\n\n<i>“I promise I’ll always take care of you, Amber,”</i> you say.");
		output("\n\n<i>“I know! That’s why I’m not worried,”</i> she says, nodding. <i>“Now were you gonna give me a pill or not?”</i>");
		output("\n\n<b>Note: This will lock you out of curing her.</b>");
		processTime(5);
	}
	clearMenu();
	if (amberDumbfuckDoses() < 4) addButton(0,"Pill",amberOnshipGiveDumbfuckPill, undefined, "Pill", "Give her the pill to increase her libido even more.");
	else addDisabledButton(0,"Pill","Pill","She has already taken the maximum safe amount.");
	addButton(1,"No",amberOnshipGiveDumbfuckNo, undefined, "No", "You’ll come back to it later.");

}
//give amber a dumbfuck pill
public function amberOnshipGiveDumbfuckPill():void
{
	clearOutput();
	amberHeader();
	
	pc.destroyItemByClass(Dumbfuck);
	
	if (amberDumbfuckDoses() >= 3)
	{
		var hole:int;
		if (pc.hasVagina()) hole = rand(pc.vaginaTotal())
		else hole = -1;
		
		output("You’ve hardly even brought your hand up before Amber has snatched the final Dumbfuck pill from your palm and slapped her own over her mouth. She swallows it down and immediately jumps forward to grab your [pc.hips], pulling you into her and kissing you intently. Amber cums almost the moment you lock lips with her, but unlike before that only seems to spur her on harder. She’s gripping at you, almost rearing up on her quivering hindlegs to get closer to you, pressing herself into your body. Her yearning for your touch is laid completely bare, unhidden by social etiquette or anything of the like.");
		output("\n\nShe kisses you with nothing less than than complete and utter honesty, ever seeking more of you while her body emphatically reinforces her point. You can hear thick equine cum splashing to the ground beneath her forelegs, her giant cock spurting unending ropes of desire. Even locked in the throes of desperate, quaking orgasm, she doesn’t want to let you go. Both her and your breath comes in short, sudden gasps from your noses, so enraptured by your kiss you don’t even notice the bump behind you until you’ve slipped over it.");
		output("\n\nToppling backwards, you land with Amber in your lap, surprised and flushed with lust. Seeing your outstretched arms supporting her forelegs to ensure she isn’t injured, she gives you a massive smile. <i>“I love you soooo much, [pc.name]. Lemme prove it!”</i>");
		
		if (flags["AMBER_RECRUIT_FUCK"] == 1)
		{
			output("\n\nThe moment she plunges her hot, tight pussy down onto your");
			if (pc.hasCock()) output(" [pc.cockBiggest]");
			else output(" hand and then forearm");
			output(", she screams in elation and lets her biggest load yet jet from the tip of her absurdly flared horsecock.");
			output(" Then she’s frantically pounding herself on you, working herself back and forth while sweat flies from her body in every direction. Throwing her head back, a primal scream of carnal satisfaction spills from her lips while she bounces on top.");
			
			//her cunt, she came, change if applicable
			if (pc.hasCock()) amberFuckAHole(5, true, true);
		}
		else
		{			
			output("\n\nIn an instant she has her hulking, veiny cock shoved so far up your");
			if (hole < 0) output(" [pc.ass]");
			else output(" [pc.vagina " + hole + "]");
			output(" you can feel her seed blooming inside you in warm, wet gouts with your core. So driven to show you just how much she loves you, the grunting dryad thrusts from above you, plowing you with all the insistence she can muster. Each thrust sends a massive splatter of her sperm into your");
			if (hole < 0) output(" intestines");
			else output(" [pc.womb " + hole + "]");
			output(", swelling you with the sheer amount of her virile spunk. Though she cums almost continually, crying out in elation, she never stops that rhythmic pounding even as you find yourself letting out a scream of bliss to join her.");
			//your ass/vag, she came, change if applicable
			amberFuckAHole(hole, true, true);
		}
		
		output("\n\n<i>“Uh! Uh! I can keep going for like, days, [pc.name]!”</i> Amber gasps joyously, tightening her grip on you with her hindlegs. <i>“Uh! Gnnnuh! Fuck! Fuck! Cumming!”</i>");
		output("\n\nTrue to her word, she spouts cum");
		if (flags["AMBER_RECRUIT_FUCK"] == 2)
		{
			output(" up into you");
		}
		output(" like a lewd fountain, groaning your name while her body shakes in orgasmic ecstasy. Even so, her cock stays completely stiff, as rigid as iron while she starts");
		if (flags["AMBER_RECRUIT_FUCK"] == 2)
		{
			output(" pounding your");
			if (hole < 0) output(" ass");
			else output(" cunt");
			output(" the moment her mind-blowing ejaculations start to slow.");
		}
		else
		{
			output(" bouncing on you once more.");
			
		}		
		output(" It takes another orgasm before you can get free and switch positions, taking the lead from her even if just for a moment.");
		
		if (flags["AMBER_RECRUIT_FUCK"] == 1)
		{
			if (pc.hasCock())
			{
				//her cunt, she came, change if applicable
				amberFuckAHole(5, true, true);
				amberFuckAHole(5, true, true);
			}			
		}
		else
		{
			//your ass/vag, she came, change if applicable
			amberFuckAHole(hole, true, true);
			amberFuckAHole(hole, true, true);
		}
		
		output("\n\nAmber’s proverbial reins firmly in hand, you roll her over and begin");
		if (pc.hasCock()) output(" pummeling her hot, puffy asshole with your cock so hard she almost immediately has a prostate orgasm, her overstimulated body forcing her to spurt out a neverending flow of slick, clear precum mixed with her own thicker, much more virile sexual fluids. By the time you cum inside her, leaving her dripping and winking,");
		else
		{
			output(" aggressively grinding your");
			if (flags["AMBER_RECRUIT_FUCK"] == 2) output(" spunk-spurting");
			output(" cunt along her long, thick length, rubbing yourself against her veins and shuddering in pleasure. You can feel her cumvein sporadically pumping against you, bloating with seed before it sprays from her tip with an overjoyed moan. By the time you grind yourself to a full-bodied orgasm,");
		}
		output(" she’s already raring to take control again.");
		if (pc.hasCock()) amberFuckAHole(4, true, true);
		else pc.orgasm();
		
		output("\n\nYou spend so long with her you lose track of time, but you’re convinced: not only does she really, truly love you, she’s incapable of lying about it. You’re not sure the possibility of doing so could ever occur to her in the first place now that she’s so far gone. She’s still capable of simple, vapid speech, but her cock comes first. Having spent so long in her hands, you withdraw from the hold and drag yourself up to the shower, dripping with sweat and cum.");
		output("\n\nWhat you have down in the hold is, surely, some kind of sex goddess, imbued with neverending stamina and an infinite libido. You’ll have to explore her capabilities some more soon - very soon, even. As tired as you are, you have to admit there’s a certain satisfaction that comes with being so thoroughly worked over.");
		
		flags["AMBER_DUMBFUCK_LASTGIVEN"] = GetGameTimestamp();
		//8 hours of fucking
		amberRandomSex();
		amberFuckForHours(8,60);
		pc.shower();
	}
	else if (amberDumbfuckDoses() == 2)
	{
		output("Amber picks the pill from your hand, gulps it down, then immediately kneels in front of you");
		if (!pc.isCrotchExposed()) output(" and pulls your [pc.lowerGarments] out of the way");
		output(".");
				
		output("\n\nYou hardly even have time to react before she’s lewdly sucking on your");
		if (pc.hasCock()) output(" [pc.cockBiggest], wrapping her lips around it and looking up at you with red-hot desire.");
		else if (pc.hasVagina()) 
		{
			output(" [pc.clit], planting passionate kisses on your");
			if (pc.vaginas[rand(pc.vaginaTotal())].looseness() < 3) output(" cute pleasure button.");
			else output(" sensitive jewel.");
		}
		
		output("\n\nYou know that Dumbfuck increases libido and lowers intelligence over a 24 hour period, but you could be fooled into thinking it took place the moment you consumed it if Amber were a reliable indicator. On her knees and moaning into your");
		if (pc.hasCock()) output(" saliva-slicked cock");
		else output(" dripping-wet muff");
		output(", you can tell just how effective the increased libido has been.");
		
		output("\n\nEyes rolling in her head, she");
		if (pc.hasCock()) output(" takes you into her throat and holds you there");
		else output(" shoves her long, warm tongue right into your cunt");
		output(" as her hips begin to buck, frenzied grunts and groans of orgasm escaping her. Even just the mere act of foreplay has Amber blowing a massive, sticky load all over the ground. She twists her hips this way and that, thrusting into nothing again and again while she lathers you with her tongue. The sight of her so desperately debasing yourself has you fighting just to keep yourself from cumming too, before the main event has even begun to transpire.");
		//pc doesn't actually cum in this blow job/vag cun scene but this will unlock it as possible in amberRandomSex();
		if (pc.hasCock()) amberFuckAHole(6, true, true);
		else amberFuckAHole(8, true, true);
		output("\n\n<i>“Okay, Amber,”</i> you moan, gripping her red hair and pulling her back. <i>“Good girl. Let’s take it further.”</i>");
		
		output("\n\n<i>“Fill you,”</i> she mumbles, roughly grasping your");
		if (pc.hasBreasts()) output(" [pc.breasts].");
		else output(" [pc.hips].");
		output(" <i>“I wanna fill you!”</i>");
		
		output("\n\n<i>“We can do that,”</i> you tell the overexcited deertaur, smiling down at her while she pants red-faced. <i>“We can do anything we want.”</i>");
		output("\n\nAmber bowls you over in her eagerness and");
		
		if (flags["AMBER_RECRUIT_FUCK"] == 1)
		{
			output(" has her massive, seed-spewing cock between your lips in a second. Then she’s bouncing her dainty hips and crying out in utter ecstasy, spilling what must surely be a gallon of fresh, thick sperm right down your throat and into your stomach. Still sensitive from her first orgasm, it doesn’t take long for her to cum a second time in a row, shoving herself to the hilt in your face and grunting savagely.");
			//blow her, she came, change if applicable
			amberFuckAHole(3, true, true);
		}
		else
		{
			output(" has her hot, slick pussy pressed against your face in an instant. You lap at her and feel her quake in ecstasy, her voice coming out in halting gasps while you seize her flanks and pull her down onto you, greedily sucking her oversized clit and thrusting your tongue inside her. Already on such a hair-trigger and still suffering the effects of a sympathetic orgasm from her cock, it’s all too easy to make her gush femcum all down your chin while she moans and shakes her ass.");
			//lick her vag, she came, change if applicable
			amberFuckAHole(7, true, true);
		}
		
		output("\n\nFrom there, you trade control of the situation with every orgasm. Amber keeps you guessing with what she’ll do next, truly led on by her own libidinous desires. By the time your frenetic fuck-session has finished, the entire hold is marked in some way. This puddle is from when");
		if (flags["AMBER_RECRUIT_FUCK"] == 1)
		{
			output(" you fucked her ass and made her cum all over");
			//her ass, she came, change if applicable
			amberFuckAHole(4, true, true);
		}
		else
		{
			output(" she mounted you hard and let everything spill");
			//your ass, she came, change if applicable
			amberFuckAHole(-1, true, true);
		}
		output(", the lines of sweat against the bulkhead is from when you were pressed up against it, the white spunk slowly pumping from the end of her cock and trickling towards a grate is from when you last set her off; there’s no end to it all. The hold looks more like an enclosure for a pair of wild, rutting beasts.");
		
		output("\n\nYou let Amber rest, the dryad wordlessly closing her eyes and panting on her bed, where you ended up for the finale. At this point, her libido is outpacing her physical capability. Additionally, her former chipper self seems to have given way to a breathless, overeager fuck-hungry slut, though you could probably still get a conversation out of her. It would just be abrupt and no doubt laden with greedy glances towards your lower half. In the hours you spent trading orgasms, most of her communication was done with her oversized cock and the rest were cries of bliss.");
		output("\n\nShe’s well down the rabbit hole now. If you give her the next dose, it’ll have to be the last.");
		
		flags["AMBER_DUMBFUCK_LASTGIVEN"] = GetGameTimestamp();
		//6 hours of fucking
		amberRandomSex();
		amberFuckForHours(6,60);
		sweatyDebuff(1);
		pc.applyCumSoaked();
		processTime(10 + rand(10));

	}
	else if (amberDumbfuckDoses() == 1)
	{
		output("<i>“Nom!”</i> Amber says, eating it out of your palm. <i>“This is kinda hot, y’know.”</i>");
		output("\n\n<i>“Eating out of my hand?”</i> you ask, grinning. <i>“Do you like being pampered, Amber?”</i>");
		output("\n\n<i>“Of course! Like, what girl doesn’t?”</i> she says, smiling at you. <i>“I could use a bit of ‘pampering’ right now, honestly.”</i>");
		output("\n\n<i>“I’ll bet you could,”</i> you note, looking down at the way her massive cock is slipping free of her sheath. She was obviously expecting this if the way she’s licking her lips is any indication. <i>“Let’s take it to the shower.”</i>");
		output("\n\nShe’s already horny by the time you get there and strip off, but she spends the next few hours surpassing every expectation. Every time she cums it’s a massive, teeth-gritting affair that has her breath catching in her throat while she lets out a low, animal growl, straining so hard that you’re almost worried she’ll hurt herself. Each thick, voluminous rope of gelatinous cum seems to drive her further up the wall, her orgasmic release actually making her <i>more</i> horny instead of less. Her voice comes out in halting pants and groans of bliss, hindlegs quivering and squeezing together while her flaring cock shakes and flexes, spewing out massive gouts of seed.");
		output("\n\nYou’re so caught up in pushing her limits that by the time you realize Amber’s not letting up at all, close to six hours have passed. She heaves a sigh of contentment and regards you with a sly smile.");
		output("\n\n<i>“So, [pc.name]? You like?”</i> she murmurs, squeezing her own ripe breasts while she breathes hard, pale skin shimmering with perspiration.");
		output("\n\n<i>“You’re definitely getting closer to being that stud you talked about,”</i> you quip, red-faced and close to panting yourself. <i>“How do you feel?”</i>");
		output("\n\n<i>“Like a fucking </i>slut<i>,”</i> Amber snickers, approaching and bringing her face closer to yours. <i>“And I fucking love every second of it,”</i> she breathes, looking deep into your eyes. <i>“Kiss me.”</i>");
		output("\n\nYou take her in hand and lock lips with her, feeling her tongue greedily slip out and wrap around your own. The heated, frantic breath from her nose grows more and more erratic until, finally, the inevitable happens - you crack an eyelid to see Amber’s eyes rolling up into her head, messy noises of orgasm emanating from below her quivering body. ");
		output("\n\n<i>“Mmmm! Mmmnngh!”</i> Amber moans into your mouth.");
		output("\n\nShe’s cumming just from kissing you, and cumming <i>hard</i>. She’s fighting a little to keep herself from full-on bucking into you, but not that hard - you still have to press back against her to keep her in place. Content to just suck on your tongue - and perhaps incapable of anything more right now - Amber rides out her exciting hands-free release until you gently pull back, letting her rest against you and moan.");
		output("\n\n<i>“Ooooohhh, god,”</i> Amber mutters, shaking her head lightly. She stays with her head down against your [pc.chest] for a while before lifting it to look at you, smiling dopily. <i>“Anyone ever tell you you’re a </i>great<i> kisser, [pc.name]?”</i>");
		output("\n\n<i>“Never quite so intensely,”</i> you tell her, smirking. <i>“You should take a rest, Amber.”</i>");
		output("\n\n<i>“Uh huh,”</i> she says, nodding against you. <i>“Can we stay like this for a while?”</i>");
		output("\n\n<i>“Sure,”</i> you murmur, brushing her hair out of her eyes and letting your hand rest on the back of her head. Eventually, she rouses herself from her post-orgasm stupor and lets you guide her back to her bed, where she turns in a few circles before settling down.");
		
		if (pc.hasCock()) output("\n\n<i>“Feel free to wake me up with your cock, [pc.name],”</i>");
		else output("\n\n<i>“Feel free to wake me up by bouncing on my cock, [pc.name],”</i>");
		output(" Amber mumbles as she closes her eyes. <i>“Or anything else. Really, I just can’t... get enough of you...”</i>");
		
		output("\n\nShe sneezes silently as she quietens. You first met her as a sex-crazed beast driven crazy by heat, but now her hyperactive libido seems to be her new normal. You don’t think she’s going to be thinking about sex <i>all</i> the time, but it looks like it’s going to be occupying a majority of her thoughts. If nothing else, once you get her on the topic, it seems like it’s going to be extremely difficult to get her off it - but luckily, not to get her off. She was like a hose during the several hours you spent making her cum, if hoses could scream your name in ecstasy while they pumped gallons of semen onto the ground.");
		output("\n\nShaking your head at the thought, you have to admit that this is changing you a little, too. You hadn’t known how incredibly sexy it could be to watch someone go through this. You’ll have to ask her about it when she wakes up. See how she’s feeling about everything.");
		
		
		flags["AMBER_DUMBFUCK_LASTGIVEN"] = GetGameTimestamp();
		amberRandomSex();
		amberFuckForHours(6,60);
		pc.shower();
		processTime(10 + rand(10));
	}
	else
	{
		output("<i>“Alright,”</i> you say, tossing one up in the air above her. <i>“Catch.”</i>");
		output("\n\nRearing up a little on her hindlegs, Amber gracefully catches it in her mouth - as graceful as you can be when trying to grab a pill out of the air with your teeth, anyway. Wrapping her tongue around it, she swallows it down with haste and looks at you expectantly.");
		output("\n\n<i>“Sooo...”</i> she says.");
		output("\n\n<i>“Yeah, so,”</i> you say, approaching her side as she turns to look, <i>“guess I forgot to mention this, but the way it works is that the pill lasts 24 hours. Each time you cum during those 24 hours makes you dumber, hornier, and overall just more of a breeder bitch.”</i>");
		output("\n\nYou can see her cock pouring from her sheath at your words, a little shiver of excitement running through her body.");
		output("\n\n<i>“So... wanna get started, then?”</i> Amber purrs.");
		output("\n\nYou spend the next three hours locked in carnal bliss with Amber in your shower, her thick, strong cock spurting massive gouts of seed while she shudders and groans, brought to the peak and unable to resist. You haven’t seen her so driven to cum since you first met her in the forest, her oversized balls pumping out what must be record levels of spunk for her. The only reason you stop is because she’s panting like a bellows, moaning in utter bliss, and you’re not sure how far down the ladder she is.");
		output("\n\n<i>“Wowee,”</i> she says finally, lying down in the shower as you turn the water on her. <i>“That was amazing, [pc.name]! I don’t even feel that different, though.”</i>");
		output("\n\nSuddenly, despite warm water coursing over her tired, furred form, she sneezes. <i>“Oof! Geez, that was- snnkkrt!”</i>");
		output("\n\nShe sneezes again, more violently this time, her head rocking forward with the force of it. Shaking her head, she looks at you confused. <i>“Gosh, [pc.name], you didn’t say nothing about sneezing! Is this me, or the drug?”</i>");
		output("\n\n<i>“Relax, Amber, I’m pretty sure it’s the drug,”</i> you tell her, rubbing her head with one hand and dousing her in water with the nozzle in your other.");
		output("\n\nShe sneezes twice more, rubbing at her nose, and seems to be done. You clean her up and get her back into your room, looking at her with interest.");
		output("\n\n<i>“So, feel any dumber?”</i> you joke.");
		output("\n\n<i>“Haha, jerk!”</i> Amber giggles, poking her tongue out. <i>“Uuuh, not really though. I mean, I was never that smart in the first place. I was homeless, remember?”</i>");
		output("\n\n<i>“Right, yeah. Any other effects?”</i> you ask.");
		output("\n\n<i>“So, I just got done cumming my brains out, thanks to you,”</i> she says, smirking, <i>“so I’m not </i>that<i> horny... but I could go again right now, if we wanted. In fact, I’m pretty sure we could fuck and never stop.”</i>");
		output("\n\n<i>“You’d pass out from exhaustion first, though,”</i> you point out.");
		output("\n\n<i>“Uh huh,”</i> she nods. <i>“What’s the saying? The mind is willing but the body don’t wanna? Well, whatever. I just mean that I don’t think I’ll ever be in the mood to turn down fucking again.”</i>");
		output("\n\n<i>“That sounds like a pretty good first step to me,”</i> you say, grinning.");
		output("\n\n<i>“Riiight?”</i> Amber says, laughing. <i>“That was heaps of fun, [pc.name]. Lemme know if you want to do it again. I’m gunna go lie down, I’m </i>tired<i>! See you, [pc.name]!”</i>");
		output("\n\nYou wave as she departs your room, her humming fading away as she trots down the corridor. Well, she’s in a good mood and her libido has apparently risen, so that’s good. You’ll avoid her until the drug’s worn off just in case of any little hitches, but she should be fine.");

		flags["AMBER_DUMBFUCK_LASTGIVEN"] = GetGameTimestamp();
		amberRandomSex();
		amberFuckForHours(3,60);
		pc.shower();
		processTime(10 + rand(10));
		
	}
	
	IncrementFlag("AMBER_DUMBFUCK");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
//dont give amber a dumbfuck pill
public function amberOnshipGiveDumbfuckNo():void
{
	clearOutput();
	amberHeader();
	if (amberDumbfuckDoses() >= 3)
	{
		output("No. At the least, not yet. You think of something else to say while she watches you with an intense hunger.");
	}
	else if (amberDumbfuckDoses() == 2)
	{
		output("<i>“Uh uh,”</i> you say, shaking your head. <i>“No candy for today, Amber.”</i>");
		output("\n\n<i>“Aaawww!”</i> Amber moans, hanging her head in evident disappointment.");
		if (flags["AMBER_RECRUIT_FUCK"] == 1) output(" <i>“I wanted you to fuckin’ pound my brains out... lame.”</i>");
		else output(" <i>“I wanted to fuckin’ pound your asshole some more... lame.”</i>");
		
		output("\n\n<i>“We can do that without drugs,”</i> you remind her, and she noticeably perks up.");
		
	}
	else if (amberDumbfuckDoses() == 1)
	{
		output("<i>“Actually, might hold off on this for a bit,”</i> you say, looking at the pill in your palm. <i>“Pays to think about it thoroughly and all.”</i>");
		output("\n\n<i>“Poop,”</i> Amber says, sticking her tongue out. <i>“I thought we were gonna have some fun. That’s okay though, just lemme know if you want me to take it. Or just jump on my back and shove it in my mouth!”</i> she says, giggling. <i>“That’d be fun too.”</i>");
	}
	else
	{
		output("<i>“Ah, maybe later,”</i> you say, closing your fist around the pills. <i>“No need to rush, right?”</i>");
		output("\n\n<i>“Sure,”</i> Amber says, shrugging. <i>“Just lemme know, [pc.name].”</i>");
	}
	clearMenu();
	addButton(0,"Next",amberOnshipTalk);
}

//talk to amber about taking Throbb
public function amberOnShipTalkThrobb(): void {
	clearOutput();
	amberHeader();
	
	switch(amberThrobbDoses()) {
		case 0:
			output("<i>“So,”</i> you say, raising the vial and smiling, <i>“this <b>is</b> going to increase your libido.”</i>");
			
			switch(amberDumbfuckDoses()) {
				case 0:
					output("\n\nOoohhh boy,”</i> Amber says, raising her eyebrows with a grin. <i>“I hope you’re ready to fuck me all day, every day, [pc.name]. Does it do anything else?”</i>");

					output("\n\n<i>“Yup. Do you want to hear it, or do you want a surprise?”</i> you ask her, teasing.");

					output("\n\n<i>“Oooh... surprise me, then,”</i> she replies, wiggling her hindquarters excitedly. <i>“I love surprise presents!”</i>");
					break;
				case 1:
				case 2:
					output("\n\n<i>“Oh, that’ll make a nice combination with the Dumbfuck you dosed me with, won’t it?”</i> she says, grinning. <i>“Come on then, [pc.name]. Surprise me with the other effects.”</i>");
					break;
				case 3:
					output("\n\n<i>“Oh, <b>baby</b>,”</i> she says, grinning devilishly. <i>“Stick it in, [pc.name]. Then let’s fuck all day.”</i>");
					break;
				case 4:
					output("\n\n<i>“Awww, yeah,”</i> Amber says, grinning wide. She jiggles her erect cock from side to side, swaying her hindquarters in need. <i>“Just fucking stick it in, [pc.name]. Don’t tease me!”</i>");
					break;
			}			
			break;
		case 1: 
			
			switch(amberDumbfuckDoses()) {
				case 0:
				case 1:
				case 2:
					output("Oh, I <b>like</b> this one,”</i> Amber says, grinning as she looks at the needle. <i>“Hard to forget my cock growing several inches and blasting cum all over the ship. Gimme.”</i>");
					break;
				case 3:
					output("Ooh, I remember that!”</i> Amber says excitedly, her enlarged cock hardening in anticipation. <i>“Gimme, gimme!”</i>");
					break;
				case 4:
					output("<i>“Bigger,”</i> Amber moans, staring at the needle as her cock thwaps against her underside. <i>“More...”</i>");
					break;
			}
			break;
	}

	processTime(2);
	clearMenu();
	addButton(0, "Inject Her", amberOnShipInjectThrobb, undefined, "Inject Her", "Amber's more than happy to take what you're giving her.");
	addButton(1, "Back", amberOnshipTalkDrugs);
}

public function amberOnShipInjectThrobb() : void
{
	clearOutput();
	amberHeader();

	pc.destroyItemByClass(Throbb);

	if(amberThrobbDoses() == 0) {
		output("You bend down and take her thick, heavy horsecock in hand, gently bouncing it up and down in your palm with light smacks.");

		output("\n\n<i>“Oh, I like where this is going,”</i> Amber murmurs.");

		output("\n\nThe fair-skinned deergirl is an absolute stud, of that there’s no doubt, but she could always be... more. She needs something bigger, something stronger, with which to strain and grunt and <i>fuck</i>. The thought of her throwing her head back and groaning like a whore as her newly enlarged penis throbs and spews streams of virile cum across the floor has you salivating already, and with that image in mind you place the needle to her meaty prick and inject her.");

		output("\n\n<i>“Ooohhhh,”</i> she moans, her soft underside shivering in delight as the liquid flows into her stiffening cock. <i>“Oohh, fuck, I’m hard! Oh! OH! <b>GOD!</b>”</i>");

		output("\n\nHer delicate hooves scrabble against the floor as she begins to pant, hindlegs splaying to the sides before she manages to get a grip and right herself, a sticky rope of precum hanging from the end of her equine dick. It thickens as you watch, the long, gooey string of flowing anew all the way to the ground as a breathy gasp escapes Amber’s mouth.");

		output("\n\n<i>“Uu-uuuhhhh!”</i> Amber groans, seemingly struggling to flex her fat, heaving cock as it drools spooge from the flaring tip. <i>“Ugh! Uh!”</i>");

		output("\n\nYou watch with breath held in excitement as her pulsing horsecock begins to <i>swell</i>, stretching and throbbing as hot, thick cum spurts from her oversized tip. Amber seethes through grit teeth, thrusting her growing endowment forward in a desperate attempt to seek out pleasure. She finds it when you tighten your grip on her, squeezing her bulging, thickening horsecock while her flare engorges.");

		output("\n\nAmber grunts and grows, taut skin rippling against your palm with every strained exhalation, your fingers intimately tracking her progress. Each throb of her equine penis adds what feels like an inch, her lengthening member growing from fourteen to fifteen, sixteen, and - with a particularly violent ejaculation - all the way to nineteen inches long. You can’t say you’re surprised she got so much out of it given her history of modifications, but it’s a hell of a sight.");

		output("\n\nShe suffers a colossal orgasm as the last of the Throbb does its work, filling the overexcited deergirl with a delirious pleasure. Almost twenty glorious inches of thick, throbbing horsecock spray cum several feet in front of Amber while she screams in outright bliss, your hands working frantically to jack her off all throughout, helping her get off as hard as she can. Her pulsing balls jump and jiggle, pressing taut against her soft underside and supplying her with a rich, hot bounty that splatters across the floor.");

		output("\n\nBy the time she stops bucking her hips and tiredly leans against the wall panting, it feels like half the hold is covered in Amber’s jizz. It trickles from her enlarged cockhead even now, her giant flexing cock hanging beneath her belly and protruding from between her forelegs. It seems like Amber responds to enlargement drugs like a kaithrit responds to milk.");

		switch(amberDumbfuckDoses()){
			case 0:
			case 1:
			case 2:
				output("\n\n<i>“Ohh, haha,”</i> Amber pants, grinning wide. <i>“I am <b>so</b> ready to fuck.”</i>");
				output("\n\n<i>“Sounds like a problem we can take care of,”</i> you murmur.");
				break
			case 3:
			case 4:
				output("\n\n<i>“Oh, god, I need it,”</i> Amber pants. <i>“Fuck me, fuck me, <b>fuck me!</b>”</i>");

				output("\n\n<i>“Sounds good,”</i> you murmur.");
		}

	}else if(amberThrobbDoses() == 1) {
		output("<i>“Ooohhhhh, yeeesssssss,”</i> Amber groans as you inject her with the Throbb, her impressive cock growing iron-hard in your hands. <i>“Oohhh that feels so good...”</i>");

		output("\n\nShe’s a lot more at ease and prepared for the sensation this time, but that doesn’t stop her from tilting her head back and moaning like a whore as the ecstasy of growth rushes through her. Her quivering cock swells and throbs in your hands, thickening and stretching until you realize your fingers are being forced apart. Oh, she’s getting <i>big</i>...");

		output("\n\n<i>“O-oh... oh my <b>god</b>,”</i> Amber huffs, looking at you wide-eyed before her gaze flicks downward. <i>“H-holy shit! I- I can see it! Uh!”</i>");

		output("\n\nShe stares unbelieving at her massive underslung cock, its dripping head just visible top-down. Flexing her hindquarters Amber thrusts forward and holds it there, slowly bending down and reaching out with shaking hands. The shiver that runs through her body is delightful to watch, but when you run your hand along her thrumming cumvein she groans and releases her grip.");

		output("\n\n<i>“Oh, you’re so much better at that than I am,”</i> she pants. <i>“Oh- god- don’t stop-”</i>");

		output("\n\nHer pretty lips become a hardset line as she violently bucks her hips forward as if she were rutting, a massive gout of seed splattering the wall of the hold. With cute, feral cries of lust and love, she pumps out what must be a gallon of sticky cum while you hold her tight, stroking and rubbing her enormous spasming cock. Her quaking balls draw taut against her underside and stay there, shifting in her sack with every pulsing spray of equine semen until she almost collapses against the wall, hands held out to support herself.");

		output("\n\n<i>“Fuuuck,”</i> Amber moans, messy hair hanging down past her drooping head and covering her face. <i>“Oohhh, god, [pc.name]...”</i>");

		output("\n\n<i>“Feeling good?”</i> you ask, smiling.");

		output("\n\n<i>“Please- <b>please</b> fuck me,”</i> she begs.");

		switch(amberDumbfuckDoses()){
			case 0:
				output("<i>“I need you so bad right now...”</i>");
				break;
			case 1:
			case 2:
				output("<i>“Please! I need to be fucked!”</i>");
				break;
			case 3:
				output("<i>“I need to be fucked so fucking bad!”</i>");
				break;
			case 4:
				output("<i>“[pc.name]! J-just FUCK ME!”</i>");
				break;
		}

		output("\n\nInjecting her with any more of it might cause a few... undesirable complications, but she’s more than happy with what she’s got going on already and looking over her now, so are you. Your cute deer girlfriend looks a lot more like the breeding she-stud her libido told her she could be, that’s for sure. In the meantime, though... you’re going to have to take even better care of her than usual.");
	}


	processTime(5);
	IncrementFlag("AMBER_THROBB");
	clearMenu();
	addButton(0, "Sex", amberOnshipSex);
	addButton(1,"Back", amberOnshipTalkDrugs);
}
//talk to amber about taking Equilicum
public function amberOnshipTalkEquilicum():void
{
	clearOutput();
	amberHeader();
	
	pc.destroyItemByClass(Equilicum);
	
	var ppAmber:PregnancyPlaceholder = getDryadPregContainer();
		
	if (amberDumbfuckDoses() >= 4)
	{
		output("<i>“Aww, pleeeaaase gimme the elubicum thing,”</i> Amber moans, watching the needle.");
	}
	else if (amberDumbfuckDoses() == 3)
	{
		output("<i>“Lube n’ cum?”</i> Amber asks, grinning eagerly. <i>“When can I take it?”</i>");
	}
	else if (amberDumbfuckDoses() == 2)
	{
		output("<i>“Cum? Ooh, izzit gonna make me cum more?”</i> Amber purrs seductively, fluttering her eyelashes at you.");
	}
	else if (amberDumbfuckDoses() == 1)
	{
		output("<i>“Heeey, it has cum in the name so it can’t be </i>that<i> bad, right?”</i> Amber jokes, her ears flicking with interest.");
	}
	else
	{
		output("<i>“Oh?”</i> Amber asks, eyeing the needle. <i>“Sounds like it might be fun.”</i>");
	}
	output("\n\n<i>“Explanations first,”</i> you say, holding up a hand before dropping it and looking at the needle. <i>“Well, it’s not complicated. It makes your balls grow and you cum more. Even the side effects are pretty minor...”</i>");
	output("\n\nAmber’s convinced. Ducking down to take one of her oversized testes in hand, you gently jab her with the anaesthetic-coated needle and give her a friendly rub. Her massive horsecock’s already halfway out of the sheath by the time you’ve even finished injecting her, no doubt inspired by the close, affectionate contact.");
	output("\n\n<i>“Nnnuuhhh,”</i> she moans, jerking her hips a little. <i>“O-oh, [pc.name]...”</i>");
	output("\n\n<i>“You okay, Amber?”</i> you ask, concerned, rising a little to look at her.");
	output("\n\n<i>“Okay, j-just,”</i> she gasps, starting to pant and fidget, her tail flitting from side to side. <i>“Cum! I need to cum! Oh, god! Lemme cum!”</i>");
	output("\n\nYou guess it makes sense that a drug designed to boost production would send Amber of all people into overdrive - now it’s just a matter of how to handle it. Ducking back down, you’ve scarcely even planted an exploratory hand on her fattening cock before she’s operating solely on instinct.");
	output("\n\n<i>“Oooohhhh! Oooohhhh goooood,”</i> Amber groans deeply, thrusting her swollen equine cock forward uncontrollably. <i>“Uh! Uh! Unnnh!”</i>");
	output("\n\nNow you can see what the fuss is about. Behind her original set of big, hanging balls, a second pair is growing and they’re every bit as fat as the first. She must be <i>raring</i> to go with all that jizz ready to be pumped out of her. You watch in awe as they fill out from the size of apples to grapefruits, then swell until they’re as big as melons. Thick, warm melons full of surging seed and larger than your head, ready to gush from her flaring cocktip at a moment’s notice.");
	output("\n\n<i>“[pc.name]! [pc.name]!”</i> Amber implores you, so far gone but still begging you to help her. As responsible as you are for this predicament, you’re going to have to at least do something to help the poor girl.");
	
	flags["AMBER_EQUILICUM"] = 1;
	
	clearMenu();
	if (pc.hasCock() || pc.hasHardLightEquipped()) addButton(0, "Fuck Her Ass", amberOnshipGiveEquilicumFuckAss, undefined, "Fuck Her Ass", "Fuck all that fresh spunk out of her.");
	else addDisabledButton(0,"Fuck Her Ass","Fuck Her Ass","You need a cock or a hardlight to fuck her ass.");
	addButton(1,"Get Filled",vaginaRouter, [amberOnshipGiveEquilicumGetFilled,ppAmber.cockVolume(0),1,0], "Get Filled", "Let her fuck you full of that excess of spunk.");
	
}
//Fuck all that fresh spunk out of her after taking Equilicum
public function amberOnshipGiveEquilicumFuckAss():void
{
	clearOutput();
	amberHeader();
	
	output("<i>“Alright, stay still,”</i> you tell Amber, approaching her curvy rear");
	if (!pc.isCrotchExposed()) output(" while removing your clothes");
	output(". She’s fidgety enough right now that");
	if (pc.isTaur()) output(" mounting her");
	else output(" getting yourself positioned");
	output(" is a little complicated, but you manage it. Her hooves click on the floor of your ship as she shifts restlessly");
	if (pc.isTaur()) output(" beneath");
	else output(" in front of");
	output(" you, just waiting for her hero to bail her out.");
	
	output("\n\nYou thrust into Amber’s tight, warm asshole without ceremony, earning yourself a pleased scream of pleasure from up front. She squeezes down on you in instinctive response, increasing the friction of her pleasurable hole to the point it feels like she’s coiling her body around you.");
	
	if (pc.biggestCockLength() > 20) output(" Despite your [pc.biggestCock] being so large the dryad takes it in stride, forcefully pushing");
	else output(" Clearly grateful for the assistance, the dryad pushes");
	output(" back into you to encourage your efforts. It’s bliss.");
	
	output("\n\nWith Amber feeling it so hard you’re free to pound her however you like. You work yourself up to a pace a stallion would be jealous of, your");
	if (pc.balls > 0) output(" [pc.balls] slapping against her sopping wet cunt");
	else output(" groin slapping into her curvaceous behind");
	output(" while she nuts all over the ground. Each thrust sends a massive rope of equine seed splattering across the steel floor accompanied by a deep, guttural groan of animal ecstasy from Amber. Her arms are crossed and held against her chest, fingers squeezing her shoulders while she tries not to buck her hips and upset your rhythm lest she be deprived of the monumental pleasure.");
	
	if (pc.hasCock()) pc.cockChange();
	
	output("\n\nHer forelegs are squarely planted against the ground to brace against your advances, not shaking even as a massive, asshole-clenching orgasm begins to ripple through her. She utters a moan of delight at the feeling and you can not only hear but <i>feel</i> her cumming, the way she clamps down on you with every fat, thick rope of cum that shoots from her swollen, pumping flare. Amber’s tight, constricting passage squeezes you to your own release, which only seems to drive her even further into the throes of pleasure.");
	output("\n\n<i>“Fuuuck, Amber,”</i> you grunt,");
	if (pc.hasCock()) output(" cock throbbing in her depths while [pc.cum] spurts from the end of it.");
	else output(" the hardlight’s feedback sending pleasure through you in forceful waves.");
	output(" <i>“Nnnnnn...”</i>");
	
	//her ass, she came, no change
	if (pc.hasCock()) amberFuckAHole(4,true,false);
	else
	{
		IncrementFlag("DRYAD_FUCKED");
		IncrementFlag("DRYAD_ANALED");
		flags["AMBER_LASTCUM"] = GetGameTimestamp();
		pc.orgasm();
	}
	
	output("\n\n<i>“Uhhhh, [pc.name],”</i> Amber groans, still lost in the wilderness of bliss with only your name to guide her back. The gigantic loads pouring from her flexing cock eventually diminish in vigor and length, until she’s all but empty but still like putty in your hands. <i>“Ooohhh, god...”</i>");
	output("\n\n<i>“Feeling better?”</i> you murmur to her.");
	
	output("\n\n<i>“Hhhhooo, yes,”</i> she breathes, thrusting herself back into you slowly. She’s stroking her own newly enlarged prostate across the end of your");
	if (pc.hasCock()) output(" [pc.cockBiggest]");
	else output(" hardlight");
	output(", stimulating herself into several smaller, weaker anal orgasms. <i>“Oooohhhh... yessss...”</i>");
	
	output("\n\n<i>“Whoa, girl,”</i> you say, grinning. <i>“Careful you don’t get addicted to me or we’ll be here forever.”</i>");
	output("\n\n<i>“Awwww,”</i> Amber pouts, shivering as she steps forward and frees herself from the confines of being locked in perpetual orgasm. Her still-stiff cock gives one last flex of effort, spraying the floor beneath her. <i>“Uhn!”</i>");
	output("\n\nYou can’t resist the urge to tease her a bit. You reach down and gently take ahold of the massive, heavy balls between Amber’s hindlegs, eliciting a moan from her. They’re hot to the touch and still, as far as you can tell, at least partially full of spunk. She moans again, higher in pitch, and you can feel them tighten in your hands. All four of them hitch upwards momentarily before her cock shoots out what must <i>really</i> be her last few ropes of seed if the size and thickness is any indication.");
	output("\n\nLetting go, you give the moaning dryad a pat on her flank and eye the way her balls slowly start to fatten and hang once more. She’s got a <i>lot</i> to give now, that’s for sure.");
	
	processTime(15);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Let her fuck you full of that excess of spunk after taking Equilicum
public function amberOnshipGiveEquilicumGetFilled(hole:int):void
{
	clearOutput();
	amberHeader();
	
	output("<i>“C’mon Amber,”</i> you urge the desperate dryad");
	if (!pc.isCrotchExposed()) output(", removing your [pc.lowerGarments]");
	output(" <i>“Come let it all out and pump me full!”</i>");
	
	output("\n\nAmber’s on top of you immediately, jabbing at you with the swollen flare of her equine cum-pump until it takes. You cry out as her cockhead");
	if (hole < 0)
	{
		if (pc.ass.looseness() >= 4) output(" snugly slides into");
		else output(" pushes into the tight confines of");
		output(" your [pc.ass]");
	}
	else
	{
		if (pc.vaginas[hole].looseness() >= 4) output(" snugly slides into");
		else output(" pushes into the tight confines of");
		output(" your [pc.vagina " + hole + "]");
	}
	
	output(" and then she’s grunting, scrabbling atop you while she forces the rest of her length to follow. She’s already cumming but it doesn’t stop, even when she’s got you hilted all the way to her leathery sheath and her massive cock throbbing inside your stretched-out");
	if (hole < 0) output(" asshole.");
	else output(" pussy.");
	amberFuckAHole(hole,true,true);
	
	output("\n\nPanting, she begins fucking you with a mere few inches of motion, unwilling to let anything but the base of her engorged shaft escape you. Even so you can feel it,");
	if (pc.isTaur())
	{
		output(" nestled deep inside you and pouring thick, hot cum into your");
		if (hole < 0) output(" core.");
		else output(" canal.");
	}
	else
	{
		output(" bulging upwards into");
		if (hole < 0) output(" the skin of your stomach and flowering, planting its seeds into your insides.");
		else output(" your sensitive canal.");
	}	
	output(" Her labored breathing above you lets you know that it’s working, that <i>she’s</i> working it off inside you, reapproaching normalcy.");
	
	output("\n\n<i>“Uh- Amber,”</i> you gasp, feeling her start to buck. <i>“Am- Amber!”</i>");
	output("\n\nShe’s not content to let things go at their own pace. Her furred hips begin to work, thrusting instinctively while she");
	if (pc.isTaur()) output(" drapes herself across your back");
	else output(" lays atop you");
	output(" and groans. Amber’s as much of a slave to her needs as you are right now, unable to hold herself back from fucking your tightening");
	if (hole < 0) output(" asshole.");
	else output(" pussy.");
	output(" She’s not going to last long, though, that much you can tell. The way she’s moaning and the depth of her overeager thrusts tell you everything.");
	
	output("\n\nShe cums before you do, but only just. The sudden difference between her fevered, sweaty fucking of your");
	if (hole < 0) output(" asshole");
	else output(" pussy");
	output(" and the slow, relaxed pumps of her inside you drive you over the edge");
	if (hole < 0)
	{		
		if (pc.hasCock()) output(", your [pc.cockBiggest] pulsing in time with Amber’s as you match each other’s ejaculations.");
		else output(".");
	}
	else
	{
		if (pc.hasCock()) output(", sending spurts of your own [pc.cum] up your stomach while your stuffed-full pussy squeezes her pulsing shaft.");
		else output(", your stuffed-full pussy dripping and squeezing in time with Amber’s pulsing ejaculations up into you.");
	}	
	output(" You moan in unison, her new quartet of fat, heavy balls tightly nestled against your [pc.ass]. You can <i>feel</i> them pumping, tightening against you in tune with her huge loads.");
	
	amberFuckAHole(hole,true,true);
	
	output("\n\n<i>“Nnnhhh... good girl, Amber,”</i> you murmur, reaching");
	if (pc.isTaur()) output(" back to nuzzle her.");
	else output(" up to rub your fingers through her fur.");
	output(" <i>“Better pull out now before we’re here all day.”</i>");
	
	output("\n\n<i>“Fiiine,”</i> Amber pouts, withdrawing her still-spurting head from your");
	if (hole < 0) output(" butt");
	else output(" pussy");
	output(" with a grunt.");
	
	output("\n\nShe seems a little dazed in the wake of it all - so are you, to be fair - but overall fine. Patting her flank, you head back up to your room to take a shower.");
	
	processTime(15);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//talk to amber about dumbfuck changes
public function amberOnshipTalkChanges():void
{
	clearOutput();
	amberHeader();

	if (amberDumbfuckDoses() >= 4)
	{
		output("<i>“How’re you feeling?”</i> you ask.");
		output("\n\n<i>“Like I wanna hold you down and fuck your face!”</i> Amber exclaims excitedly. <i>“Can I?”</i>");
		output("\n\n--");
		output("\n\nPredictably, any attempt at conversation grinds to a lewd halt almost immediately. You’re not sure if she’s incapable or just intractable but either way she’s not interested in talking so much as she is in fucking you. Amber doesn’t stop there, either. She’s ecstatic to be with you the whole time, which has turned out to be close to four hours. She’ll happily pump you full or take it from behind for hours on end, crooning in bliss while she ejaculates over and over. Even now, as she lies on her bed for a short rest, you can see her biting her lip while cum pumps from her flared cock.");
		output("\n\nYou head back upstairs with the realization she’s come through on her promise to be your stud. As she is now, Amber could probably fuck a whole stable of leithan women until pregnancy. Luckily for you, you’ve got");
		if (amberIsCrewContentOn()) output(" her for just you and the crew.");
		else output(" a monopoly on the sexy she-stud.");
		
		//4+ hours of fucking
		processTime(rand(10));
		amberRandomSex();
		amberFuckForHours(8,30);
		sweatyDebuff(1);
		pc.applyCumSoaked();
	}
	else if (amberDumbfuckDoses() == 3)
	{
		output("<i>“How you feeling after that third pill, cutie?”</i> you ask Amber.");
		output("\n\n<i>“Great!”</i> Amber thrills, smiling wide. <i>“Oh, but my cock’s a little itchy... I know the best way to cure it though.”</i>");
		output("\n\n<i>“Oh yeah? What’s that?”</i> you say.");
		output("\n\n<i>“Having it plunged to the hilt in a lover’s ass,”</i> Amber says, grinning lewdly. The usual red of her face deepens, her freckles losing out to the blush of her cheeks. <i>“Wanna help me out, [pc.name]?”</i>");
		output("\n\n<i>“Well, I kinda wanted to at least check up on if you’re feeling okay after the Dumbfuck first...”</i> you say.");
		output("\n\nAmber shrugs, her bared breasts shaking. You note her cute pink nipples are standing out like metal studs, no doubt every bit as hard. <i>“Like I said, I feel great. Heck, the more I take, the better I feel! Can we fuck yet? I wanna feel you, [pc.name]...”</i>");
		output("\n\n--");
		output("\n\nAmber’s grown even more outrageously horny than before, refusing to let you go until her concentration finally lapses. It seems like the only thing that really holds her attention any more is hot, sweaty sex, the closer to rutting the better. She really is getting close to being that hot and ready bimbo stud she once mentioned becoming. You separate yourselves almost two hours later, feeling both drained and filled.");
		
		//2+ hours of fucking
		processTime(rand(10));
		amberRandomSex();
		amberFuckForHours(4,30);
		sweatyDebuff(1);
		pc.applyCumSoaked();
	}
	else
	{
		output("<i>“So, feeling much different?”</i> you say, shrugging. <i>“Any changes?”</i>");
		output("\n\n<i>“Uh, yeah, the whole ‘cumming like a firehose’ thing is a little new,”</i> Amber giggles, twirling a finger through her vibrant red hair. <i>“You bully, making me say that out loud.”</i>");
		output("\n\n<i>“Yeah, well, I really meant more mental changes,”</i> you start, smirking as you spread your hands. <i>“But I guess that’s definitely the most obvious bit.”</i>");
		output("\n\n<i>“Oh, right. The ‘Dumb’ bit isn’t there for nothing, huh?”</i> Amber ponders before shaking her head. <i>“Sorry, [pc.name], I dunno. I feel pretty normal.”</i>");
		output("\n\n<i>“No intrusive thoughts, sexual dreams, anything like that?”</i> you continue.");
		output("\n\n<i>“Intrusive, like they suddenly pop into my head? Like ‘poof’?”</i> she says, tilting her head. <i>“Not that I can tell.”</i>");
		output("\n\n<i>“Oh well,”</i> you say. <i>“Maybe you’re just too smart for it to affect you.”</i>");
		output("\n\n<i>“Haha, yeah right!”</i> Amber says, rolling her eyes before her tongue traces her upper lip and the strand of precum hanging from her stiff cock snaps, falling to the ground. <i>“Hey, before you go... wanna fuck?”</i>");
		output("\n\n--");
		output("\n\nIn the end, you spend about half an hour rolling in the proverbial hay with your sweat-slicked and very eager dryad companion and come away breathing hard. You’re left with the sense you’re going to have to draw your own conclusions.");

		//30+ mins of fucking
		processTime(rand(10));
		amberRandomSex();
		processTime(30);
		amberRandomSex();
		sweatyDebuff(1);
	}
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
	
//Give Amber’s soft animal ears a nice fluffing and petting.
public function amberOnshipEarRubs():void
{
	clearOutput();
	amberHeader();
	
	output("<i>“C’mere,”</i> you say, sitting on a crate and beckoning the curious dryad over.");
	output("\n\n<i>“[pc.name]?”</i> Amber asks, pattering over to you. <i>“Should I sit?”</i>");
	output("\n\nYou nod and she sinks to her knees in front of you, facing to the side. Leaning over, you run your hands through her hair and hear her sigh in relaxation, her eyes closing. You take care to be gentle as you massage her, leading up to softly rubbing her deer ears between your forefinger and thumb.");
	output("\n\n<i>“Ooooh...”</i> Amber moans breathily, leaning into your touch. <i>“That’s nice...”</i>");
	output("\n\nBringing your other hand into play too, you soon find your pet dryad transformed into malleable putty. Sighing happily, she pushes herself against your fingers and nuzzles your hand while you affectionately stroke her. Slowly, you begin to taper off with your treatment until she’s resting in your lap, her breath almost silent. It takes a few seconds for her to notice you’ve stopped, and she raises her head almost sleepily to look at you.");
	output("\n\n<i>“Thanks, [pc.name]...”</i> she mumbles, a huge yawn interrupting her followup. <i>“Can you put me to bed..?”</i>");
	output("\n\nYou take Amber to her mattress and pull her blankets over her, tucking her in as she lays her head on the pillow. She’s asleep the moment her eyes close, wrapped in her duvet. You tug one of the corners over an errant hoof sticking out and quietly walk away, leaving Amber to her tranquil slumber.");

	processTime(10 + rand(10));
	pc.changeLust(15);
	clearMenu();
	addButton(0,"Next",crew);
}

//Give Amber’s soft animal ears a nice fluffing and petting.
public function amberOnshipBrushFur():void
{
	clearOutput();
	amberHeader();
	
	output("<i>“Amber, want some brushes?”</i> you ask while holding up a small brush.");
	if (flags["AMBER_BRUSHED"] == undefined) output(" It’s the type you might use to groom a horse, and you happened to find it among the stuff Urbolg packed on your ship. <i>“Uh... if you care about that kind of thing.”</i>");
	
	output("\n\n<i>“Oh, brushes!”</i> Amber says, clapping her hands together. <i>“Yay!”</i>");
	output("\n\nShe plops herself down in front of you and you kneel to attend to your task, gently brushing the top layer of her fur into place. Her soft skin reflexively quivers as you bring the bristles of the brush through her fine, silky coat, her satisfied humming");
	if (flags["AMBER_BRUSHED"] == undefined)
	{
		output(" gradually falling into a presumably contented silence. It’s only when she begins shaking that you look up at her, hands over her mouth and silently crying.");
		output("\n\n<i>“Amber?”</i> you ask in concern. <i>“You okay?”</i>");
		output("\n\n<i>“It- it’s just,”</i> Amber says, trying to calm herself, <i>“I can’t remember the last time s-someone did this for me...”</i>");
		output("\n\nYou silently reposition yourself to her front and let her put her arms around you, rubbing her back while she weeps.");
		output("\n\n<i>“It’s okay,”</i> you murmur to her. <i>“It’s okay.”</i>");
		output("\n\nYou let Amber cry herself out, years of deadened emotion brought on by a simple act of charity. It’s hard to remember sometimes what with how upbeat she manages to be just how awful her life has been till this point. Gently raising her head, you give her a kiss on the lips and pat her tauric half.");
		output("\n\n<i>“Your fur looks great,”</i> you tell her.");
		output("\n\n<i>“Does it?”</i> she says, sniffling. <i>“Let me take a look...”</i>");
		output("\n\nHer hand in yours, you help Amber to her hooves and smile as she turns to look back at herself with a gasp.");
		output("\n\n<i>“Oh, wow!”</i> she says, squeezing your fingers. <i>“It’s all shiny and sleek...”</i>");
		output("\n\n<i>“See? You’re a beauty,”</i> you say.");
		
		output("\n\n<i>“Thanks, [pc.name],”</i> Amber says with a smile, her eyes and cheeks still a little wet but drying fast.");
		if (amberDumbfuckDoses() == 2) output(" <i>“Next time we fuck, I’m gonna make you cum all over the place.”</i>");
		else if (amberDumbfuckDoses() == 1) output(" <i>“Next time we mess around, I’ll have to make it up to you.”</i>");
		else output(" <i>“Thanks for taking care of me.”</i>");
		
		output("\n\n<i>“Sure,”</i> you say, smiling. <i>“You okay now?”</i>");
		output("\n\n<i>“Yeah! I’m fine,”</i> Amber reassures you. <i>“Gonna go admire myself in a mirror, y’know? Girl’s gotta have some pride.”</i>");
		output("\n\nYou wave her off with a grin.");
	}
	else
	{
		output(" accompanying you while you work. Progress is slow but steady, your efforts eventually coming to fruition while she wiggles to and fro.");
		output("\n\n<i>“There,”</i> you announce, raising yourself to your [pc.feet] and offering your hand to Amber. She takes it and follows you up, stretching her legs out before she looks back. <i>“How’s that?”</i>");
		output("\n\n<i>“It’s great!”</i> Amber thrills, shuffling her hips in excitement. <i>“Hard to believe how much better it looks now!”</i>");
		output("\n\n<i>“You’re a regular diamond in the rough,”</i> you tell her with a wink.");
		output("\n\n<i>“A miner [pc.boyGirl] would say that,”</i> Amber says, poking her tongue out teasingly before retracting it and smiling shyly. <i>“Thanks, [pc.name]. I really appreciate you taking care of me like this. Giving me... things I’m missing.”</i>");
		
		if (amberDumbfuckDoses() >= 1)
		{
			output("\n\n<i>“And the sex,”</i> she adds as an afterthought, grinning. <i>“You can give me </i>that<i> all night long!”</i>");
			output("\n\nYou wave off her casual but starkly lewd advance with a smirk, though you admit the honesty turns you on.");
		}
		else output("\n\n<i>“No problem, cutie,”</i> you say. <i>“I’ll go back upstairs and get you that mirror you were talking about, huh?”</i>");
				
	}	
	
	processTime(45 + rand(15));
	pc.changeLust(30);
	flags["AMBER_BRUSHED"] = GetGameTimestamp();
	
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
//have sex with amber
public function amberOnshipSex():void
{
	clearOutput();
	amberHeader();
	
	var ppAmber:PregnancyPlaceholder = getDryadPregContainer();
	
	if (flags["AMBER_SHIPSEX_TALK"] == undefined)
	{
		output("<i>“Let’s skip the small talk,”</i> you say, grinning at Amber.");
		output("\n\n<i>“Oh, I love it when you talk dirty, [pc.name],”</i> she says coquettishly, fluttering her eyelashes while her massive equine cock hardens beneath her, throbbing and surging with blood. <i>“I hope you’ve got something fun in mind, ‘cuz now I need it fucking </i>bad<i>...”</i>");
		flags["AMBER_SHIPSEX_TALK"] = 1;
	}
	else
	{
		if (amberDumbfuckDoses() >= 4)
		{
			output("You don’t even need to ask her if she wants it. Amber, the way she is now, is more than happy to fuck you or get fucked by you any time of the day until you’re bored or unconscious, and even in the case of the latter she’s likely to keep going. Red-faced and breathing just a little hard, she eyes you hopefully.");
		}
		else if (amberDumbfuckDoses() == 3)
		{
			output("<i>“Wanna fuck?”</i> Amber blurts out before you can even say anything, popping the question while she eyes you ravenously. <i>“Like, now? I wanna shove my cock inside you, [pc.name]...”</i>");
		}
		else if (amberDumbfuckDoses() == 2)
		{
			output("<i>“Wanna fuck, Amber?”</i> you say, smiling. <i>“Why do I even ask?”</i>");
			output("\n\n<i>“I dunno, why do you?!”</i> she says, giggling and libidinously eyeing you up and down. The way her long, thick shaft hardens beneath her while her glittering eyes rove your body is more than a little charming. She’s really getting off on imagining sex with you. <i>“Whatcha wan’ do?”</i>");
		}
		else if (amberDumbfuckDoses() == 1)
		{
			output("<i>“Up for some fun, Amber?”</i> you ask, grinning.");
			output("\n\n<i>“Always,”</i> she replies, winking while her dripping shaft lengthens and hardens even further until her head is flaring with eagerness. <i>“Mmmm... let’s fuck, [pc.name].”</i>");
		}
		else
		{
			output("<i>“How about some more of that fun we talked about before?”</i> you ask Amber, smiling.");
			output("\n\n<i>“Oho, sounds good to me,”</i> Amber says, stretching a little and showing off her bare chest, nipples standing out like studs. She grins. <i>“Where do you wanna start?”</i>");
		}
	}	
	clearMenu();
	addButton(0, "Suck Cock", amberOnshipSexSuckCock, undefined, "Suck Cock", "Get on your knees and pay that fat equine cock of hers the respect it deserves.");
	if (pc.isTaur()) addButton(1, "Get Fucked", vaginaRouter, [amberOnshipSexGetFucked,ppAmber.cockVolume(0),1,0], "Get Fucked", "Give Amber your rear to mount and rut.");
	else addButton(1, "Get Fucked", vaginaRouter, [amberOnshipSexGetFucked,ppAmber.cockVolume(0),1,0], "Get Fucked", "Spread your legs to let Amber rut you.");
	if (pc.hasCock() || pc.hasHardLightEquipped()) addButton(2, "Fuck Pussy", penisRouter, [amberOnshipSexFuckPussy,amber.vaginalCapacity(),true,0], "Fuck Pussy", "Fuck Amber’s pussy good and hard.");
	else addDisabledButton(2, "Fuck Pussy", "Fuck Pussy", "You need a cock or a hardlight to fuck Amber’s pussy.");
	if (pc.hasCock() || pc.hasHardLightEquipped()) addButton(3, "Mounting", penisRouter, [amberOnshipSexMounting,amber.vaginalCapacity(),true,0], "Mounting", "Put some of the equipment you and Urbolg put in here to good use.");
	else addDisabledButton(3, "Mounting", "Mounting", "You need a penis or hardlight dildo to mount Amber.");
	// //For non-neuter, non-taur/non-naga PCs with Amber recruited. Uses the taur equipment to comfortably mount a biped PC. Can't be done with Amber at 3+ Dumbfucks.
	if (amberDumbfuckDoses() > 2) addDisabledButton(4, "Mount Me", "Mount Me", "Amber’s too worked up to consider using the machines to mount you!");
	else if (pc.isTaur() || pc.isNaga()) addDisabledButton(4, "Mount Me", "Mount Me", "Requires a regular biped body.");
	else if (!pc.hasGenitals()) addDisabledButton(4, "Mount Me", "Mount Me", "Requires genitals.");
	else addButton(4, "Mount Me", vaginaRouter, [amberDoesTheMountingThisTime, ppAmber.biggestCockVolume(), 1, 0], "Mount Me", "Ask Amber to mount the equipment so she can rut you in comfort.");
	if (amberCanThreesome()) addButton(5, "Threesome", amberThreesomesMenu, undefined, "Threesome", "Bring a friend.");
	
	addButton(6, "Drain Her", amberOnShipSexDrainHer, undefined, "Drain Her", "Those " + (amberEquilicumDoses() > 0 ? "enormous, jizz-filled cumtanks":"plump, seed-filled testes") + " swinging between her hindlegs could certainly use some relief...");

	addButton(14, "Back", amberInTheHold);

}

//have sex with amber suck her cock
public function amberOnshipSexSuckCock():void
{
	clearOutput();
	amberHeader();
	
	output("<i>“Here,”</i> you murmur,");
	if (!pc.isTaur()) output(" lowering yourself to");
	else output(" kneeling on");
	output(" the floor before her and looking up at her freckled face. She’s breathing hard, her cheeks flushed with lust. <i>“Use my mouth.”</i>");
	
	output("\n\n<i>“Oh, fuck yeah!”</i> Amber moans, hurrying forward and brushing your head with the soft fur of her tummy. She’s not shy about introducing you to the business end of her cock at all, shoving it against your face immediately. <i>“Suck it!”</i>");
	output("\n\nYou’ve scarcely even opened your mouth before she violently thrusts the flare of her equine cock between your [pc.lips], letting out a little moan of excitement. You can taste the sweat and even the precum, some of it spurting from the overeager girl’s swollen cockhead. It splashes across your [pc.tongue] and splatters against the back of your throat, then gets smeared downwards as the dryad shoves her veiny cock down your esophagus.");
	
	output("\n\n<i>“Ooohhh, god, I love fucking your face, [pc.name],”</i> Amber groans above you, working her hips up and down in an unsteady rhythm.");
	if (flags["AMBER_CURED"] == undefined) output(" The way she’s sloppily facefucking you, your saliva coating her thick pink horsecock, just proves that you can take the dryad out of the jungle but you can’t take the jungle out of the dryad.");
	output(" <i>“Uh! Nnh! Grr! Nnngh!”</i>");
	
	output("\n\nYour neck bulges with the intrusion of her massive prick,");
	if (pc.hasCock()) output(" your own [pc.cocks] standing at rigid attention while she mercilessly plunges inside you.");
	else if (pc.hasVagina()) output(" your [pc.pussy] tightening in slight sympathy as it drips.");
	else output(" your [pc.asshole] reflexively tightening with each penetration, almost as if you need her in your ass too.");
	output(" She’s hardly started and you’re already enraptured by her, wishing she would cum inside you not so that she stops but so that you can <i>feel</i> it. You ache with the need to have it jet into your stomach, to warm you from the inside out, to experience that bliss of Amber’s release.");
	
	output("\n\n<i>“Ggguuhhh fuck,”</i> Amber pants desperately, her hindlegs getting lower in her search for her colossal orgasm. <i>“L-look uhp-upwards!”</i>");
	output("\n\nYou tilt your head back as she takes a couple of halting steps forward, her dainty hooves clattering on the floor of your ship. Her swollen cock is suddenly being thrust almost straight down into your face, her heavy, churning balls slapping into your chin while she grunts in pleasure above you. You can feel her precum shooting out continually, landing straight in your stomach while she facefucks you relentlessly.");
	
	output("\n\nYou find your [pc.nose] being pressed up against her sweaty, shuddering underside with every savage penetration, squished into the soft white fur of her tauric belly while she plows your face like a girl possessed.");
	if (pc.hasCock())
	{
		if (pc.totalCocks() > 1) output(" Your own precum drizzles down the underside of your cocks, the dryad practically fucking it out of you.");
		else output(" Your own precum drizzles down the underside of your cock, the dryad practically fucking it out of you.");
	}
	output(" The closer she gets to orgasm, the rougher the ride is - you have to reach upwards and shakily sink your hands into her lush coat, trying to get a good grip to keep yourself in place.");
	
	output("\n\n<i>“Cl-closer,”</i> Amber grunts, hardly managing speech between hilting herself in the cocksheath of your mouth. <i>“Get- getting closer!”</i>");
	output("\n\nYou can feel it, too, her cock thickening inside your throat and the massive equine flare at the head of it swelling to what feels like three times the size it was when she started. It drags along the inside of your throat, easily filling the entire enclosed space and spitting precum everywhere, coating your insides with Amber’s juices. Her moans of pleasure get higher and louder until she’s almost screaming with every thrust, the ecstasy mounting until it’s just too much to resist.");
	output("\n\n<i>“Oh fuck! Fuck! [pc.name]!”</i> Amber screams out loud, throwing her head back and shoving herself so deep inside you that you suddenly have your lips spread in an ‘O’ around the thick base of her immense cock as it begins to throb inside your throat. <i>“Fuck! Fuck! Fuck!”</i>");
	output("\n\nShe lets out a long, groaning wail of blissful release as a stream of spunk travels down her shaft to jet into your stomach. Your neck bulges while you submissively suck load after hot load from the plump balls pressed against your chin, Amber beginning to thrust again while she cums. Each time she hilts herself she sings out in joy, another spurt of equine jism splattering into your tummy.");
	output("\n\n<i>“Nnnnnnhhhh! Nnnnnnngggh... Hhhhnnn-!”</i> Amber strains, her underside quivering with the effort of cumming. <i>“Guh! Ffffuck! Nnngh!”</i>");
	output("\n\nListening to her grunts and groans of animal pleasure, you can’t help yourself. You cum all over the floor, untouched and unprovoked save for the throbbing cock embedded in your throat. Eyes rolling back in your head from the lack of air and the submissive pleasure, you sit there limply with your vision swimming as Amber finishes draining her oversized balls into your stomach. Finally satisfied, she withdraws her length from your well-used fuckhole with a light moan, her flare popping free of your lips with a wet slap and a pop.");
	output("\n\n<i>“Oooohhh, I needed that so bad,”</i> Amber sighs deeply, nodding down at you appreciatively. <i>“Thanks, [pc.name].”</i>");
		
	processTime(10 + rand(10));
	pc.changeLust(100);
	amberFuckAHole(3,true,true);
	
	clearMenu();
	addButton(0, "Kiss Her", amberOnshipSexSuckCockKissHer);
	addButton(1, "Keep Sucking", amberOnshipSexSuckCockKeepSucking);
	
	addButton(14,"Leave",amberOnshipSexSuckCockLeave);

}
//have sex with amber suck her cock kiss her
public function amberOnshipSexSuckCockKissHer():void
{
	clearOutput();
	amberHeader();
	
	output("Standing up on somewhat unsteady legs, you take the surprised dryad’s arms and pull her into a passionate kiss. Her glittering green eyes slowly droop closed in your embrace, her tongue wrapping around your own as you share in the afterglow of her mind-blowing orgasm. Your breath is hot on each other’s lips, the both of you still panting with the exertion of enduring it. When you pull back and gaze at her, her lips stay slightly parted and her eyes hooded.");
	output("\n\n<i>“You are the sexiest person I have ever met,”</i> Amber murmurs, looking you up and down in a manner reminiscent of a predator eyeing their prey. <i>“Come see me again soon, [pc.name]. I’m up for more of </i>that<i> any time you think you can handle it.”</i>");
	output("\n\nPlanting a gentle kiss on your cheek, Amber gives you a wink.");
	output("\n\n<i>“You gonna do adventure things now?”</i> she asks.");
	output("\n\n<i>“Probably,”</i> you nod, licking your lips and smiling at her. <i>“Or maybe we could go another round.”</i>");
	output("\n\n<i>“Ooooh... don’t tempt a girl that goes into heat, [pc.name],”</i> Amber says, grinning deviously. <i>“Might find yourself between my legs again.”</i>");

	pc.changeLust(10);
	
	clearMenu();
	addButton(0,"Next",mainGameMenu);

}
//have sex with amber suck her cock some more
public function amberOnshipSexSuckCockKeepSucking():void
{
	clearOutput();
	amberHeader();
	
	output("You’re not done yet - her cock is covered in a messy layer of mixed saliva and her own cum, positively dripping with it. It’s your duty as her cocksheath to clean her off so that she doesn’t have to do it herself. You learn forward and, stretching your aching jaw wide, suck her swollen cockhead back into your mouth.");
	output("\n\n<i>“Nn-! Oh!”</i> Amber gasps in surprise, wincing slightly. <i>“Oh, [pc.name]! It’s s-sensitive... oooooh...”</i>");
	output("\n\nShe clearly doesn’t mind <i>that</i> much if the leftover cum splashing across your tongue is any indication. Fuck, just having this monstrous tool inside you brings you pleasure and fulfillment... you could suck on it for her all day if she really wanted, but you can’t imagine her being selfish enough. Letting the tip fall from your [pc.lips], you take her half-hard length in your hands and painstakingly lick it clean, stopping only when it’s almost shining with your saliva.");
	
	output("\n\n<i>“Mmm,”</i> Amber murmurs appreciatively,");
	if (pc.hasHair()) output(" running her hand through your hair and");
	output(" scratching behind your [pc.ears] a bit. <i>“Your taste is showing, [pc.name]. Maybe I should pin your face under me the next time I go into heat, huh?”</i>");
	
	output("\n\nShe gives you a wink and a friendly smile. <i>“Kidding. Well, maybe not. I do get uh, pretty wild when it’s bad.”</i>");
	output("\n\n<i>“I don’t think I’d mind </i>too<i> much...”</i> you mutter.");
	output("\n\n<i>“Hey, I’ll remember that,”</i> Amber growls into your ear affectionately. <i>“Cutie.”</i>");
	output("\n\nShe gives you a gentle kiss on the cheek and pulls back with a smile. <i>“Gonna go do adventure things, I take it?”</i>");
	output("\n\n<i>“Probably, or maybe...”</i> you trail off, gaze flicking downwards to between her legs.");
	output("\n\nAmber smirks, crossing her arms and spreading her forelegs just a little bit to give you a better look at her impressive hardware. <i>“Hey, I’ll be here if you need me to give you some more attention, [pc.name]. You just let me know, okay?”</i>");
	
	pc.changeLust(20);
	
	clearMenu();
	addButton(0,"Next",mainGameMenu);

}
//have sex with amber suck her cock
public function amberOnshipSexSuckCockLeave():void
{
	clearOutput();
	amberHeader();
	
	output("<i>“That was fun,”</i> you huff, standing up and dusting yourself off. <i>“I should get back to doing adventure stuff. Talk to you soon, Amber.”</i>");
	output("\n\n<i>“Cool,”</i> Amber replies with a smile. She ducks in and pecks your cheek, pulling back to give you a wink and a wave. <i>“I’ll be here if you want me!”</i>");
	
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
//have sex with amber take her dick
public function amberOnshipSexGetFucked(hole:int):void
{
	clearOutput();
	amberHeader();
	
	var ppAmber:PregnancyPlaceholder = getDryadPregContainer();
	
	output("<i>“Fuck me, then,”</i> you say, turning away");
	if (!pc.isCrotchExposed()) output(" and pulling down your [pc.lowerGarments]");
	output(".");
	output(" You’ve scarcely even");
	if (pc.isTaur()) output(" completed your turn");
	else output(" bent over a crate");
	output(" before she’s atop you, her massive horsecock slapping your [pc.ass]. Her hooves scrabbling slightly as she seeks purchase, you");
	if (pc.isTaur()) output(" brace your forelegs");
	else output(" grab ahold of her forelegs");
	output(" and groan when she finds it.");
	
	output("\n\n<i>“Ooooohhh,”</i> Amber moans, sinking herself into your");
	if (hole < 0) output(" [pc.ass].");
	else output(" [pc.vagina " + hole + "].");
	if (amberDumbfuckDoses() >= 1)
	{
		output(" Her hyperactive libido doesn’t allow for anything less than getting all of herself inside you, her back hooves clacking on the steel floor as she roughly bucks her hips upwards. Groaning in need, she impales you upon her full length within the first few seconds of penetration then starts hammering your ass, her");
		if (amberEquilicumDoses() > 0) output(" quartet of");		
		output(" fat, swinging balls slapping against your [pc.skinFurScales].");
	}
	else
	{
		output(" She starts almost calmly, slowly, but you can feel the way desire creeps into her with every inch of ground she gains inside you. Each thrust is just a little harder, a little deeper than the one that came before, and soon enough she’s given way entirely to the flood of lust driving her onwards. It took longer than it otherwise might have, but soon her");
		if (amberEquilicumDoses() > 0) output(" quartet of");	
		output(" fat, swinging balls are slapping against your [pc.skinFurScales] all the same.");
	}
	
	if (hole < 0) pc.buttChange(ppAmber.cockVolume(0), true, true, false);
	else pc.cuntChange(hole, ppAmber.cockVolume(0), true, true, false);
	
	output("\n\n<i>“O-oh, oh, oh! Amber!”</i> you cry out");
	if (pc.isTaur()) output(", her arms wrapping tightly around your humanoid waist from behind.");
	else output(" from beneath the lurching centauress.");
	output(" <i>“Amber, Amber!”</i>");
	
	output("\n\n<i>“Ohhooh god, I m-missed this,”</i> Amber pants, fucking you so hard");
	if (pc.isTaur()) output(" you take an involuntary step forward.");
	else output(" your [pc.feet] lift from the ground momentarily.");
	
	//first time only
	if (flags["AMBER_SHIPSEX_GETFUCKED"] == undefined) 
	{
		flags["AMBER_SHIPSEX_GETFUCKED"] == 1;
		output(" <i>“Suh- sometimes on days you weren’t, weren’t around- ngh! Nnngh! I thought of- uh! Uh!”</i>");
		output("\n\nShe stops for a brief second, panting hard. You can feel her breath");
		if (pc.isTaur()) output(" hot on your neck, her face pressed against you.");
		else output("ing above you, her underside working like a bellows.");
		output(" <i>“I thought of you to get off.”</i>");
		
		output("\n\nYou don’t even get the time to reply before she’s pounding you again, gritting your teeth just to withstand the force of her mating. You have to admit you’re touched, not to mention more than a little turned on by the sudden confession. So you’re the person she fantasizes about when she needs to cum, huh?");
		output("\n\n<i>“Gnnh! Are you getting t-tighter?”</i> Amber gasps, shuddering in pure pleasure. <i>“Ohhh, I’m gonna cum. Gonna cum, gonna cuuuu-”</i>");
	}
	else
	{
		output(" <i>“I can’t get enough of you, [pc.name]! In the juh-jungle or here!”</i>");
		output("\n\n<i>“Amber...”</i> you moan, feeling her pounding you so deep inside. <i>“Fuck me like we’re back in the jungle, Amber! Nnnngh! You horny stud!”</i>");
		output("\n\n<i>“Ooohh fuck! Fuck! Fuck!”</i> Amber chants, each thrust smacking wetly against your ass and sending sweat flying in every direction. <i>“Gonna cum! Gonna cum! [pc.name]!”</i>");
	}
	output("\n\nYou could feel her letting loose inside you before, ropes of precum spurting inside you, but those were <i>nothing</i> in comparison. What pours from the end of her flaring cock is nothing short of a surging river of thick equine spunk, gushing inside you and spurting back out of your stretched-taut, spasming hole. Hearing Amber groan in release");
	if (pc.isTaur()) output(" behind");
	else output(" above");
	output(" you is just the cherry on top.");
	
	if (hole < 0)
	{		
		if (pc.hasCock())
		{
			output("\n\nYour [pc.cockBiggest] spurts ropes of seed into the air and onto the floor over and over, in time with Amber’s weakening thrusts into your clenching asshole and her own massive ejaculations. She makes you empty yourself out with her cock, forcing you to blow loads");
			var cumQ:Number = pc.cumQ();
			if (cumQ >= 20000) output(" even larger and stronger than");
			else if (cumQ >= 10000) output(" just as big and strong as");
			else if (cumQ >= 5000) output(" almost as big and every bit as intense as");
			else output(" smaller but no less intense than");
			output(" her own.");
		}
	}
	else
	{
		if (pc.hasCock())
		{
			output("\n\nYour [pc.cockBiggest] spurts up and down, swinging in time with Amber’s weakening thrusts into your wet, cumming cunt. You all but milk");
			if (amberEquilicumDoses() > 0) output(" Amber’s massive balls, squirting loads out of her");	
			else output(" the slick seed from Amber’s throbbing horsecock");
			output(" into");
			if (pc.isPregnant(hole))
			{
				output(" your passage and sending it spurting back down your");
				if (pc.isTaur()) output(" hindlegs.");
				else output(" [pc.thighs].");
			}
			else
			{
				output(" your [pc.womb],");
				if (amberEquilicumDoses() > 0) output(" swelling it outwards with the sheer amount of her seed.");	
				else output(" filling it to the brim with her essence.");
			}
			
		}
		else
		{
			output("\n\nYou all but milk");
			if (amberEquilicumDoses() > 0) output(" Amber’s massive balls, squirting loads out of her");	
			else output(" the slick seed from Amber’s throbbing horsecock");
			output(" into");
			if (pc.isPregnant(hole))
			{
				output(" your passage and sending it spurting back down your");
				if (pc.isTaur()) output(" hindlegs.");
				else output(" [pc.thighs].");
			}
			else
			{
				output(" your [pc.womb],");
				if (amberEquilicumDoses() > 0) output(" swelling it outwards with the sheer amount of her seed.");	
				else output(" filling it to the brim with her essence.");
			}			
			output(" The way she keeps thrusting even in the wake of it ensures she gets <i>everything</i> inside you.");
		}
	}
	
	processTime(10 + rand(10));
	amberFuckAHole(hole, true, false);
	
	if (amberDumbfuckDoses() >= 3)
	{
		output("\n\nYou relax as Amber starts to pull out, trying to loosen yourself up as much as possible as her massive cockhead approaches your entrance. As a result, you’re taken completely offguard when she thrusts back into you with a growl of desire. You let out a moan, her cock brushing against the oversensitive walls of your freshly fucked orifice.");
		output("\n\n<i>“O-one more,”</i> Amber pants, shifting above you. <i>“Gotta... gotta cum more...”</i>");
		output("\n\nYou don’t have too much of a choice in the matter, and besides... she <i>does</i> feel really nice inside you. You quickly bend to her will, letting her line herself up and begin pounding you all over again. With both of you a little fatigued, Amber’s fine control suffers. Her thrusts are desperate, long and deep affairs that leave your head spinning and your insides coiling around her in need.");
		if (pc.hasCock()) output(" Even with your cock half-hard, you can feel yourself getting pushed towards another orgasm.");
		
		output("\n\n<i>“Oooooh fuck,”</i> Amber groans, getting a little bit of her groove back once she’s started working you over again. <i>“Cumming again...”</i>");
		output("\n\nThough her reaction is a lot more muted this time around, the sensation is no less impressive. You’re flooded with her seed once more, the excess spraying back out and coating her");
		if (amberEquilicumDoses() > 0) output(" four massive swinging balls, each one bigger than your head.");	
		else output(" two fat, swinging balls, each almost as big as your head.");		
		output(" You can feel her cumvein thrumming inside you, each load fountaining from the end of her tip to splatter your insides.");
		
		output("\n\nYou cum sometime through her long, drawn-out orgasm, shutting your eyes and shuddering in pleasure while she pumps you full. She’s so <i>intense</i> - sex with Amber in this state is a little tiring, but oh so worth it. You’re pretty sure she could make you cum one for one and never stop if she really wanted...");
		
		processTime(10 + rand(10));
		amberFuckAHole(hole, true, true);
		
		if (amberDumbfuckDoses() >= 4)
		{
			output("\n\n<i>“O-one more,”</i> Amber huffs, staggering forward. <i>“I still need to cum more inside you, [pc.name]!”</i>");
			if (pc.isTaur()) output("\n\nShe reaches forward and grabs you around the chest, pulling you back and lightly biting and sucking on your exposed neck while she begins to fuck you once more. You can’t help but groan in pleasure - Amber is nothing if not persuasive. You’re not sure you have the time to stand here all day and get fucked, but she’s making a very convincing argument for in favor. Besides, it’s just once more...");
			else output("\n\nShe leans down, pressing you into the crate you’re draped over and rubbing you with her furred underbelly. The way she’s massaging your insides, you can’t help but groan in pleasure - Amber is nothing if not persuasive. You don’t know that you have the time to lie under her all day and get fucked, but she’s making a very convincing argument for in favor. Besides, it’s just once more...");
		}
		else
		{			
			output("\n\nShe pulls out with a satisfied groan, her massive cock finally drooping a little. Looks like busting two mindblowing nuts inside you was enough to satisfy her, though with the way her prick is still flexing and straining, you don’t doubt she’d be up for another go.");
			output("\n\n<i>“Next time,”</i> you assure her with a smile, kissing her on the cheek. <i>“See you soon, okay Amber?”</i>");
			output("\n\n<i>“Bye [pc.name],”</i> Amber says, all red-faced smiles and love. <i>“See you soon!”</i>");
		}
	}
	else
	{
		output("\n\n<i>“Ooohhh shit,”</i> Amber sighs, at last running dry and beginning to pull herself free. You both groan when she pops out, her oversized head coming out of you with a deluge of warm spunk following. <i>“Fuck... that’s hot.”</i>");
		output("\n\n<i>“Nnnnh...”</i> you moan, looking back at her with a smile. <i>“You like seeing me like this, Amber? All full of your hot, thick seed freshly squeezed from your big cock?”</i>");
		output("\n\n<i>“Don’t tease meee,”</i> she groans, turning her head away but still watching the way her sticky jizz rolls down your shaky [pc.legs] with her eyes. She’s anything but subtle, this girl.");
		
		output("\n\n<i>“Well, don’t worry,”</i> you say,");
		if (!pc.isTaur()) output(" rising to your [pc.feet] and");
		output(" turning back to her. <i>“I’m pretty sure you’ll get another chance to fuck me, lover.”</i>");
		
		output("\n\nAmber steps forward and kisses you immediately, wrapping her tongue around your own and embracing you with all her might. She touches you all over, running her hands up your [pc.chest] and your back, caressing your face");
		if (pc.hasHair()) output(" and running her fingers through your [pc.hair]");
		output(".");
		
		output("\n\nShe blows a few strands of her own bedraggled red hair out of her face and looks at you, smoldering.");
		output("\n\n<i>“God, you’re amazing, [pc.name],”</i> she murmurs.");
		output("\n\n<i>“Why thank you,”</i> you reply, smiling back at her and brushing the rest of her hair back. <i>“You’re pretty good yourself.”</i>");
		output("\n\n<i>“Let’s do this again soon,”</i> Amber says, before amending herself. <i>“Real soon.”</i>");
		output("\n\n<i>“Like it that much, huh?”</i> you ask with a grin, unable to help yourself.");
		output("\n\n<i>“Fuck yes,”</i> she replies, dead serious. <i>“If I could spend the rest of my life with my cock inside you... mm.”</i> She shivers with lust before focusing on you again, lips curling upwards in a smile. <i>“Like I said. Let’s do this again soon.”</i>");
		output("\n\n<i>“It’s a date,”</i> you murmur to her, kissing her smiling lips before pulling back.");
		
	}

	clearMenu();
	if (amberDumbfuckDoses() >= 4) addButton(0,"Next",amberOnshipSexGetFuckedMore,hole);
	else addButton(0,"Next",mainGameMenu);

}

//have sex with amber take her dick continued
public function amberOnshipSexGetFuckedMore(hole:int):void
{
	clearOutput();
	amberHeader();
	
	var times:int = 5;
	times += rand(3);
	
	output("Amber cums inside you another " + times + " times, each following a tired insistence that she’ll just go for <i>one</i> more round, just one, and each time you’re too fucked full of thick spunk and drowning in pleasure to say no. You both collapse, panting and covered in sweat, your");
	if (hole < 0) output(" [pc.ass]");
	else output(" [pc.vagina " + hole + "]");
	output(" leaking Amber’s jizz and your stomach swollen with it. So this is what Dumbfuck does to a person’s libido, you think, rolling your eyes and resting your head on Amber’s stomach. What a ride...");
	
	var i:int = 0;
		
	for(i = 0; i < times; i++)
	{
		processTime(10 + rand(10));
		amberFuckAHole(hole, true, true);
	}
	
	output("\n\n--");
	output("\n\nYou’ve crowded both yourself and the needy centauress into the shower to wash off when you notice her eyeing you once more, her equine cock flopping beneath her a few times while you scrub her down until it’s fully hard again, standing proudly erect.");
	output("\n\n<i>“You’re an animal,”</i> you tell her, grinning despite yourself. She giggles in response, blushing and excited.");
	
	pc.shower();
	
	clearMenu();
	addButton(0,"Fuck Again",amberOnshipSexGetFuckedEvenMore, hole);
	addButton(1,"Leave",amberOnshipSexGetFuckedMoreLeave);
}
//have sex with amber take her dick continued again
public function amberOnshipSexGetFuckedEvenMore(hole:int):void
{
	clearOutput();
	amberHeader();
	var times:int = 6;
	times += rand(5);
	
	output("<i>“Alright, you fucking horny stud,”</i> you say huskily, reaching underneath her to roughly jack her off. <i>“Let’s see how many times you can cum for me, then.”</i>");
	output("\n\nYou stop right as she begins thrusting into your hands, a dismayed moan slipping from her lips before you stand back up with a grin. <i>“Let’s go to the bed, Amber. It’s more comfortable.”</i>");
	output("\n\nYou lead the needy, hormonal girl to your bed,");
	if (pc.isTaur()) output(" folding your forelegs on the sheets");
	else output(" getting on all fours");
	output(" and looking back.");
	
	output("\n\n<i>“Alright Amber, go nu- ungh!”</i>");
	output("\n\nShe’s on top of you before you can even say another word, thrusting inside like a wildwoman. Rather than berate her for it, though, you love it. There’s no other word to describe how you feel about the pure, animalistic instinct Amber puts on display so brazenly. She <i>rides</i> you like the she-stallion she is, the fuck-hungry beast she always has been. Only now there is no off switch, the respite she earns only passingly brief before she’s aching for more.");
	output("\n\nShe cums inside you so hard it feels like her throbbing cock is hosing you down, spraying your insides white and leaving you marked with her. Of course, it doesn’t end there. Somewhere in between the third and fourth orgasm you begin wondering if this was a good idea, but fuck it - it feels <i>so</i> good. You’re cumming every bit as strongly as she is, your hole weak but the overtiredness actually working in your favor. Your insides conform to her overwhelming cock, locked together in carnal bliss, massaging each other until you mutually orgasm.");
	output("\n\nYou lose count of how many times the two of you cum and forget how much time has passed. Neither matters in the face of the fact you can just keep getting rut, Amber’s insistent mating only coming to an end when she at last falls onto the bed beside you. Though it takes some tugging and encouragement, you get her completely up on the mattress alongside you and fall asleep next to her, wrapped in each other’s arms. You’ll clean it all up tomorrow...");
	
	var i:int = 0;
		
	for(i = 0; i < times; i++)
	{
		processTime(10 + rand(10));
		amberFuckAHole(hole, true, true);
	}
	
	sweatyDebuff(1);
	pc.applyCumSoaked();
	genericSleep();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
//have sex with amber take her dick continued time to go
public function amberOnshipSexGetFuckedMoreLeave():void
{
	clearOutput();
	amberHeader();
	
	output("<i>“We’ve gotta call it there for the day, Amber,”</i> you say, shaking your head and laughing a bit. <i>“I’m already sore as it is.”</i>");
	output("\n\n<i>“Aww... fine,”</i> Amber moans dejectedly. <i>“I still love you though.”</i>");
	output("\n\nYou reply by way of caressing her face and planting a long, lingering kiss on her pretty lips, eyes closed and your fingers running through her hair. She pulls away with a dopey smile and winks at you, giggling as she leaves your room and heads back down to the hold. You can still smell her lingering sex pheromones.");
	
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//have sex with amber take her pussy
public function amberOnshipSexFuckPussy(kok:int=0):void
{
	clearOutput();
	amberHeader();
	var kokLen:int = 0;
	
	output("<i>“Turn around,”</i> you say, twirling a downward-pointing finger.");
	if (amberDumbfuckDoses() >= 4) output("\n\nAmber not only turns around to present herself but takes a few steps back towards you and spreads her legs, lewdly displaying her winking, drooling sex. She looks back at you, desire writ large on her lust-reddened face. <i>“Fuck me...”</i>");
	else if (amberDumbfuckDoses() == 3)	output("\n\n<i>“So long as we’re fucking, I’m up for anything,”</i> Amber giggles, turning and presenting her ass with a flourish. She spreads her legs and you can see her sex glistening, already dripping with need. <i>“So? Whatcha waiting for?”</i>");
	else if (amberDumbfuckDoses() == 2)	output("\n\n<i>“Ooh, yeah, I’m already all wet,”</i> Amber says, turning to present herself. With her legs spread and her sex on display, you can see she’s telling the truth. <i>“Come on, [pc.name].”</i>");
	else if (amberDumbfuckDoses() == 1)	output("\n\n<i>“Gonna fuck one of my holes, [pc.name]?”</i> Amber asks, turning around and smirking back at you. <i>“Take your pick...”</i>");
	else output("\n\n<i>“Oh, wanna take a look at what’s on offer? Here,”</i> Amber purrs, turning. <i>“See anything you like, [pc.name]?”</i>");
	
	output("\n\nYou approach without saying anything, placing your hands on Amber’s curvy rump. She’s more than ready for you without foreplay.");
	if (!pc.isCrotchExposed()) output(" Hastily disrobing, you");
	else output(" You");
	if (pc.isTaur())
	{
		output(" rear up and mount the needy girl, letting her feel your weight upon her back before you start aligning your");
		if (kok >= 0) output(" [pc.cock " + kok + "]");
		else output(" hardlight");
	}
	else
	{
		output(" rub your");
		if (kok >= 0) output(" [pc.cock " + kok + "]");
		else output(" hardlight");
		output(" over her slick pussylips, noting her little quiver when the tip touches her oversized clit.");
	}
	
	output("\n\nAmber groans in pleasure when you enter her, shuddering as you push forward until");
	if (kok >= 0)
	{	
		kokLen = pc.cocks[kok].cLength();
		if (kokLen >= 25) output(" you’ve bottomed out inside her, your [pc.cockHead " + kok + "] pressed snugly against her womb.");
		else if (kokLen >= 18) output(" you’ve impaled her on your impressive length, your [pc.cockHead " + kok + "] pressed snugly against her womb.");
		else if (kokLen >= 9)
		{			
			output(" you’ve pushed your entire length");
			if (pc.balls > 0) output(" balls-deep");
			output(" into her tightening cunt.");
		}
		else
		{
			output(" you’ve buried yourself");
			if (pc.balls > 0) output(" balls-deep");
			output(" inside her squeezing pussy.");
		}
	}
	else output(" you’ve buried the sensitized dildo inside her squeezing pussy.");
	output(" The sensation is out of this world, like she’s desperately gripping and wrapping herself around you while she moans in bliss.");
	if (pc.isTaur()) output(" Laid on her back, you can see her squeezing her own nipples while she bites her lip.");
	else
	{
		output(" You can see her");
		if (amberEquilicumDoses() > 0) output(" massive");
		output(" seed-filled balls tightening between her dainty hindlegs already.");
	}
	
	if (kok >= 0) pc.cockChange();
	
	output("\n\nHer breath on your outstroke is nearly silent, but the elated cry when you slam yourself back in is anything but. You’ve known Amber long enough to appreciate that while she might look a little delicate from the hips up, she loves it rough best. You’re more than happy to oblige the wanton desire. She’s cumming before you even give her five strokes, your mastery of her body driving the somewhat confused centauress over the edge before she even knows what’s happening.");
	output("\n\n<i>“O-oh! Oh, fuck! Guh! Nnnnngh!”</i> Amber strains, tightening her body up in response. <i>“Fffffuhhh- nnnngh! Rrrrrgh!”</i>");
	output("\n\nHeavy ropes of seed begin to spurt from between her front legs, splattering the ground while her hips buck ineffectually, her oversized equine cock flexing beneath her. Her doepussy goes from tight and wet to clamping down on you so hard it’s difficult to make any headway,");
	if (amberDumbfuckDoses() >= 3 ) output(" gushing");
	else output(" dripping");
	output(" down her shaking hindlegs in rivulets.");
	if (pc.isTaur()) output(" Reaching forward and pulling her back to look up at you, you watch her eyelids flutter in orgasmic pleasure while you bear down on her hindquarters.");
	else output(" Grabbing fistfuls of her sleek fur you <i>thrust</i>, lurid moans spilling from her lips up front.");
	output(" You fuck Amber through her orgasm resisting your own all the while, listening to her sing your praises.");
	
	output("\n\nYou know better than anyone that once Amber’s started, she can’t stop. She starts to cum almost continually, each deep thrust into her quivering cunt sending");
	if (amberEquilicumDoses() > 0) output(" violent jets of equine spunk sloshing onto");
	else output(" thick squirts of equine spunk spattering against");
	output(" the ground in front of her. That’s something you love about the centaur girl: her body’s <i>always</i> honest about what it likes.");
		
	output("\n\n<i>“Ooohhh fuck, you’re so gooood,”</i> Amber pants, almost pleading in her tone. <i>“Fuuuck!”</i>");
	
	output("\n\n<i>“You like it rough, Amber?”</i> you grunt, pounding her squeezing cunt so hard with every thrust that she squirts down your");
	if (pc.isTaur()) output(" legs.");
	else output(" front.");
	output(" <i>“Want it even rougher?”</i>");
	
	output("\n\n<i>“Yes! Yes!”</i> Amber almost screams, leaning back into you. <i>“Fuck me harder!”</i>");
	output("\n\nYou’re so close to your own orgasm now that you couldn’t resist that even if you tried. You <i>slam</i> her cunt hard enough to make her scream in rapturous pleasure, her cock freely squirting jizz all over the ground. The sensation of her intimate folds clenching down on you finally becomes too much to bear and you groan loudly as euphoria begins to radiate from your nethers. Amber lowers her front and presses back into you, moaning in ecstasy while she holds you tight in her embrace.");
	
	if (kok >= 0)
	{
		var cumQ:Number = pc.cumQ();
		if (cumQ >= 25000)
		{
			output("\n\n<i>“Oh! Oh, fuck,”</i> Amber cries out, hindlegs shaking violently. <i>“Oh god, fill me up, you fucking stud. Oh, I’m gonna cum-”</i>");
			output("\n\nYou pump Amber’s womb full of [pc.cum] almost instantly, swelling it outwards with every subsequent blast of seed into her. Enthralled by the sensation of your amazing virility she cums on the spot,");
			if (kokLen > 17) output(" your cock pressed right up against the entrance to her womb.");
			else output(" your cock throbbing inside her.");
			output(" You’re forced to pull out before she takes on liquid weight to the point of immobility, but fuck if the despairing moan she gives you in response isn’t one of the sexiest things you’ve ever heard.");
			if (amberDumbfuckDoses() >= 3)
			{
				output("\n\n<i>“Gooood, there’s so much cum,”</i> Amber pants, looking back at herself in awe. <i>“It’s all in my womb, so fucking </i>good<i>! More! Please, [pc.name]! I wanna get pregnant!”</i>");
				output("\n\n<i>“Here,”</i> you murmur, walking up and presenting your cock. She starts sucking on it automatically and rolling her eyes in pleasure, tasting a mixture of her own arousal and your jizz and loving it. <i>“Suck on this while I decide, Amber.”</i>");
			}
			else
			{
				output("\n\n<i>“Holy </i>fuck<i> you’re so good,”</i> Amber pants, head down with her messy hair hanging to her hips. <i>“God... you’re an absolute stud.”</i>");
				output("\n\n<i>“I think I know you pretty well by now, Amber,”</i> you say, smiling as she lifts her head back up to look at you. <i>“And I know what you like.”</i>");
				output("\n\nYou brush her hair back out of the dryad’s sweaty, blushed face and plant a kiss on her soft lips, pulling away after a few seconds of intimacy. She lets out a huff of air.");
				output("\n\n<i>“I think I could go for round two,”</i> she offers hopefully, looking back down at herself. <i>“Even though I already look pregnant. Who knows? Maybe you can make it a reality.”</i>");
				output("\n\n<i>“Give me a couple minutes and you might get lucky, then,”</i> you reply, grinning.");
			}
		}
		else if (cumQ >= 10000)
		{
			output("\n\n<i>“Oh! Oh, fuck,”</i> Amber cries out, hindlegs shaking violently. <i>“Oh god, fill me up, you fucking stud. Oh, I’m gonna cum-”</i>");
			output("\n\nYou pump Amber’s womb full of [pc.cum] almost instantly, swelling it outwards with every subsequent blast of seed into her. Enthralled by the sensation of your amazing virility she cums on the spot,");
			if (kokLen > 17) output(" your cock pressed right up against the entrance to her womb.");
			else output(" your cock throbbing inside her.");
			output(" By the time you’re finished with her, she’s had multiple orgasms and has a very obvious pregnant sag to her tummy.");

			if (amberDumbfuckDoses() >= 3)
			{
				output("\n\n<i>“Gooood, there’s so much cum,”</i> Amber pants, looking back at herself in awe. <i>“It’s all in my womb, so fucking </i>good<i>! More! Please, [pc.name]! I wanna get pregnant!”</i>");
				output("\n\n<i>“Here,”</i> you murmur, walking up and presenting your cock. She starts sucking on it automatically and rolling her eyes in pleasure, tasting a mixture of her own arousal and your jizz and loving it. <i>“Suck on this while I decide, Amber.”</i>");
			}
			else
			{
				output("\n\n<i>“Holy </i>fuck<i> you’re so good,”</i> Amber pants, head down with her messy hair hanging to her hips. <i>“God... you’re an absolute stud.”</i>");
				output("\n\n<i>“I think I know you pretty well by now, Amber,”</i> you say, smiling as she lifts her head back up to look at you. <i>“And I know what you like.”</i>");
				output("\n\nYou brush her hair back out of the dryad’s sweaty, blushed face and plant a kiss on her soft lips, pulling away after a few seconds of intimacy. She lets out a huff of air.");
				output("\n\n<i>“I think I could go for round two,”</i> she offers hopefully, looking back down at herself. <i>“Even though I already look pregnant. Who knows? Maybe you can make it a reality.”</i>");
				output("\n\n<i>“Give me a couple minutes and you might get lucky, then,”</i> you reply, grinning.");
			}
			
		}
		else if (cumQ >= 6000)
		{
			output("\n\n<i>“Oh, oohhh, </i>oooohhhh<i>,”</i> Amber moans, her hindlegs shaking with the effort of keeping herself upright. <i>“Oh, there’s so much...”</i>");
			output("\n\nYou cum in Amber’s pussy so hard she almost slips, a back leg sliding out of place while you buck into her. It doesn’t seem like she cares, too busy moaning while");
			if (kokLen > 17) output(" your [pc.cum] pumps into her womb and fills it to swelling with [pc.cumColor] seed.");
			else output(" your [pc.cum] paints her passage [pc.cumColor].");
			
			if (amberDumbfuckDoses() >= 3)
			{
				output("\n\n<i>“Gooood, there’s so much cum,”</i> Amber pants, looking back at herself in awe. <i>“It’s all in my womb, so fucking </i>good<i>! More! Please, [pc.name]!”</i>");
				output("\n\n<i>“Here,”</i> you murmur, walking up and presenting your cock. She starts sucking on it automatically and rolling her eyes in pleasure, tasting a mixture of her own arousal and your jizz and loving it. <i>“Suck on this while I decide, Amber.”</i>");
			}
			else
			{
				output("\n\n<i>“Holy </i>fuck<i> you’re so good,”</i> Amber pants, head down with her messy hair hanging to her hips. <i>“God, I feel full...”</i>");
				output("\n\n<i>“I think I know you pretty well by now, Amber,”</i> you say, smiling as she lifts her head back up to look at you. <i>“And I know what you like.”</i>");
				output("\n\nYou brush her hair back out of the dryad’s sweaty, blushed face and plant a kiss on her soft lips, pulling away after a few seconds of intimacy. She lets out a huff of air.");
				output("\n\n<i>“I think I could go for round two,”</i> she offers hopefully, looking back down at herself. <i>“Though by the end of it I’m going to look like I’m pregnant.”</i>");
				output("\n\n<i>“Give me a couple minutes and you might get lucky, then,”</i> you reply, grinning.");
			}
			
		}
		else if (cumQ >= 3000)
		{
			output("\n\n<i>“Oooohhh I can feel it,”</i> Amber moans, her hindlegs shaking with the effort of keeping herself upright. <i>“All the way inside...”</i>");
			output("\n\nYou cum in Amber’s pussy so hard she almost slips, a back leg sliding out of place while you buck into her. It doesn’t seem like she cares, too busy moaning while your [pc.cum] paints her passage [pc.cumColor].");
			if (amberDumbfuckDoses() >= 3)
			{
				output("\n\n<i>“Nnnnh... fuck me more, [pc.name],”</i> Amber begs, looking back at you. <i>“Please!”</i>");
				output("\n\n<i>“Here,”</i> you murmur, walking up and presenting your cock. She starts sucking on it automatically and rolling her eyes in pleasure, tasting a mixture of her own arousal and your jizz and loving it. <i>“Suck on this while I decide, Amber.”</i>");
			}
			else
			{
				output("\n\n<i>“Holy </i>fuck<i> you’re so good,”</i> Amber pants, head down with her messy hair hanging to her hips. <i>“God...”</i>");
				output("\n\n<i>“I think I know you pretty well by now, Amber,”</i> you say, smiling as she lifts her head back up to look at you. <i>“And I know what you like.”</i>");
				output("\n\nYou brush her hair back out of the dryad’s sweaty, blushed face and plant a kiss on her soft lips, pulling away after a few seconds of intimacy. She lets out a huff of air.");
				output("\n\n<i>“I think I could go for round two,”</i> she offers hopefully.");
				output("\n\n<i>“Give me a couple minutes and you might get lucky, then,”</i> you reply, grinning.");
			}			
		}
		else
		{
			output("\n\nYou cum in Amber’s pussy so hard she almost slips, a back leg sliding out of place while you buck into her. It doesn’t seem like she cares, too busy moaning while your [pc.cum] paints her passage [pc.cumColor].");
			if (amberDumbfuckDoses() >= 3)
			{
				output("\n\n<i>“Nnnnh... fuck me more, [pc.name],”</i> Amber begs, looking back at you. <i>“Please!”</i>");
				output("\n\n<i>“Here,”</i> you murmur, walking up and presenting your cock. She starts sucking on it automatically and rolling her eyes in pleasure, tasting a mixture of her own arousal and your jizz and loving it. <i>“Suck on this while I decide, Amber.”</i>");
			}
			else
			{
				output("\n\n<i>“Holy </i>fuck<i> you’re so good,”</i> Amber pants, head down with her messy hair hanging to her hips. <i>“God...”</i>");
				output("\n\n<i>“I think I know you pretty well by now, Amber,”</i> you say, smiling as she lifts her head back up to look at you. <i>“And I know what you like.”</i>");
				output("\n\nYou brush her hair back out of the dryad’s sweaty, blushed face and plant a kiss on her soft lips, pulling away after a few seconds of intimacy. She lets out a huff of air.");
				output("\n\n<i>“I think I could go for round two,”</i> she offers hopefully.");
				output("\n\n<i>“Give me a couple minutes and you might get lucky, then,”</i> you reply, grinning.");
			}
		}
		processTime(10 + rand(10));
		amberFuckAHole(5, true, false);
	}
	else
	{
		output("\n\nYou let Amber luxuriate in the sensation before you withdraw the hardlight from her sopping wet pussy, a light moan escaping your lips as her depths grip it before letting go. It’s utterly soaked in her juices.");
		if (amberDumbfuckDoses() >= 3)
		{
			output("\n\n<i>“Nnnnh... fuck me more, [pc.name],”</i> Amber begs, looking back at you. <i>“Please!”</i>");
			output("\n\n<i>“Here,”</i> you murmur, walking up and sliding the dripping hardlight between her pink lips. She starts sucking on it automatically and rolling her eyes in pleasure, tasting her own arousal and loving it. <i>“Suck on this while I decide, Amber.”</i>");
		}
		else
		{
			output("\n\n<i>“Holy </i>fuck<i> you’re so good,”</i> Amber pants, head down with her messy hair hanging to her hips. <i>“God...”</i>");
			output("\n\n<i>“I think I know you pretty well by now, Amber,”</i> you say, smiling as she lifts her head back up to look at you. <i>“And I know what you like.”</i>");
			output("\n\nYou brush her hair back out of the dryad’s sweaty, blushed face and plant a kiss on her soft lips, pulling away after a few seconds of intimacy. She lets out a huff of air.");
			output("\n\n<i>“I think I could go for round two,”</i> she offers hopefully.");
			output("\n\n<i>“Give me a couple minutes and you might get lucky, then,”</i> you reply, grinning.");
		}
		processTime(10 + rand(10));
		IncrementFlag("DRYAD_FUCKED");
		IncrementFlag("DRYAD_HERCUNT");
		flags["AMBER_LASTCUM"] = GetGameTimestamp();
		pc.orgasm();
	}
	flags["AMBER_LASTCOCK"] = kok;
		
	clearMenu();
	addButton(0, "Leave", amberOnshipSexFuckPussyLeave,kok);
	if (amberDumbfuckDoses() >= 3) addButton(1, "Again", penisRouter,[amberOnshipSexFuckPussyAgain,amber.vaginalCapacity(),true,0]);
}
//have sex with amber take her pussy leave
public function amberOnshipSexFuckPussyLeave(kok:int=0):void
{
	clearOutput();
	amberHeader();
	
	output("<i>“Alright, I’ll be back soon,”</i> you promise the dryad");
	if (amberDumbfuckDoses() >= 3)
	{
		output(" withdrawing");
		if (kok >= 0) output(" your [pc.cock " + kok + "]");
		else output(" the hardlight");
		output(" from her mouth as she moans in disappointment");
	}
	output(".");
	
	if (amberDumbfuckDoses() >= 4)
	{		
		output("\n\n<i>“Noooo,”</i> she insists, reaching for");
		if (kok >= 0) output(" your saliva-slathered dick. <i>“Fuck my little cunt! Please!”</i>");
		else output(" the hardlight. <i>“Put it back on and fuck my cunt! Please!”</i>");
		
		output("\n\n<i>“I’ve got important things to do, Amber,”</i> you explain to her, her slightly wild eyes meeting yours. <i>“As much as I love you, I can’t always be down here, you know?”</i>");
		output("\n\n<i>“Awww... okay,”</i> Amber sighs. <i>“But next time I wanna fuck at least twice! No, three times!”</i>");
		output("\n\n<i>“Sure,”</i> you say, grinning as you rub her head. <i>“We’ll fuck some more next time we see each other, okay cutie?”</i>");
		output("\n\n<i>“Okay,”</i> she says, smiling. <i>“Bye, [pc.name]!”</i>");
		output("\n\n<i>“Good girl,”</i> you say, smiling as you head back out of the loading bay. She’s needy by necessity, but she’s still a cutie when she wants to be.");
	}
	else if (amberDumbfuckDoses() == 3)
	{
		output("\n\n<i>“Aaawww,”</i> Amber whines, still greedily eyeing");
		if (kok >= 0)
		{
			output(" your saliva-coated dick");
			if (!pc.isCrotchExposed()) output(" while you reclothe yourself");
			output(".");
		}
		else output(" the toy while you store it.");
		output(" <i>“But I want more </i>now<i>.”</i>");
		
		output("\n\n<i>“Soon,”</i> you tell her, stepping closer and running a hand through her messy red hair. Her expression softens as she gazes at your face, looking into your eyes. <i>“Okay?”</i>");
		output("\n\n<i>“Okay,”</i> she says quietly, nodding. <i>“Bye, [pc.name].”</i>");
		output("\n\n<i>“Good girl,”</i> you say, smiling as you head back out of the loading bay. She’s needy by necessity, but she’s still a cutie when she wants to be.");
		
	}
	else if (amberDumbfuckDoses() == 2)
	{
		output("\n\n<i>“How </i>much<i> later?”</i> Amber challenges you before grinning. <i>“Maybe I’ll sneak into your room at night, [pc.name]. Don’t mind the bouncing.”</i>");
		output("\n\nYou grin back at her, heading back out of the loading bay. She played that like a joke, but you’re pretty sure it wasn’t. Well, not like you’ll mind either way...");
	}
	else if (amberDumbfuckDoses() == 1)
	{
		output("\n\n<i>“We’d </i>better<i>,”</i> Amber says, grinning while she eyes your body greedily. <i>“I can never get enough of you, [pc.name].”</i>");
		output("\n\nYou flash her a smile as she waves you off, still looking after you with desire.");
	}
	else
	{
		output("\n\n<i>“You’ve got yourself a deal,”</i> Amber says, grinning. <i>“You sure drive a hard bargain, [pc.name]. Not to mention your, ah... </i>negotiation techniques<i> are to die for.”</i>");
		output("\n\n<i>“That’s what they tell me,”</i> you say, smirking. <i>“Alright. See you soon, Amber.”</i>");
		output("\n\n<i>“Bye [pc.name]!”</i> Amber calls after you. <i>“Be safe out there.”</i>");
	}
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);

}
//have sex with amber take her pussy again
public function amberOnshipSexFuckPussyAgain(kok:int=0):void
{
	clearOutput();
	amberHeader();
	
	var lastKok:int = 0;
	
	if (flags["AMBER_LASTCOCK"] != undefined) lastKok = flags["AMBER_LASTCOCK"];
	
	output("You let Amber finish polishing");
	if (lastKok >= 0) output(" your [pc.cock " + lastKok + "] with her mouth, sucking you completely clean before you pop it free of her lips proudly erect and ready to go again.");
	else output(" the hardlight with her mouth, sucking it completely clean before you pop it free of her lips ready to be used once more.");
	
	output("\n\n<i>“Alright,”</i> you nod, pointing the sex-hungry dryad towards her bed. <i>“Lie on your back, Amber. More comfortable for both of us that way.”</i>");
	
	if (amberDumbfuckDoses() >= 4)
	{	
		output("\n\n<i>“Yes!”</i> Amber cheers, turning and giddily heading towards her bed. <i>“Fuck me more, [pc.name]. I cum so fucking hard when you plow my pussy!”</i>");
	}
	else if (amberDumbfuckDoses() == 3)
	{	
		output("\n\n<i>“Mmm... I’d let you fuck my pussy no matter what, [pc.name],”</i> Amber says, turning and heading towards the mattress. <i>“You can even fuck me while I’m sleeping if you want.”</i>");
	}
	
	output("\n\nWith Amber laid on her back and looking expectantly at you, there’s no sense in wasting time. She’s already got her first taste of you, after all. Now you just need to satisfy the needy girl.");
	
	if (kok >= 0)
	{
		if (pc.isTaur()) output(" Standing over her, you lower your hind half and move your hips until your [pc.cockHead " + kok + "] touches the wet warmth of her freshly fucked pussy.");
		else output(" Kneeling before her, you lean forward and let your [pc.cockHead " + kok + "] touch the wet warmth of her freshly fucked pussy.");		
	}	
	else
	{
		if (pc.isTaur()) output(" Standing over her, you lower your hind half and move your hips until your hardlight touches the wet warmth of her freshly fucked pussy.");
		else output(" Kneeling before her, you lean forward and let your hardlight touch the wet warmth of her freshly fucked pussy.");	
	}
	
	output("\n\nYou shove yourself inside and enjoy the way Amber throws her head back, hair flying about her face while you");
	if (!pc.isTaur()) output(" hold her hindlegs and spread them to");
	output(" fuck her as hard as you can. Her");
	if (amberEquilicumDoses() > 0) output(" fat, heaving quartet of");
	else output(" heavy");
	output(" balls tighten against her underside in time with the contractions of her flexing cunny, her libido running so rampant that they’re already threatening to coat her in spunk.");
	
	output("\n\nIt doesn’t take long for that to come to fruition, Amber grunting through grit teeth as her equine shaft");
	if (amberEquilicumDoses() > 0) output(" squirts massive gouts of her spunk");
	else output(" spurts multiple ropes of her spunk");
	if (pc.isTaur()) output(" between your bodies and");
	output(" all up her torso. You can feel her primal need, the urge to let out everything she has, and you’re only too keen to indulge her.");
	
	output("\n\nYou spend the next two hours forcing her to cum with her squirting cunny and oversized cock, dominating her at every turn until she has no choice but to scream in utter bliss as she feels release over and over. You make her empty her");
	if (amberEquilicumDoses() > 0) output(" giant, pulsing");
	else output(" hefty");
	output(" nuts all over herself, staining her fur with seed and leaving her gasping for air.");
	
	var i:int = 0;
		
	for(i = 0; i < 4; i++)
	{
		processTime(30);
		if (kok >= 0) amberFuckAHole(5, true, true);
		else
		{
			IncrementFlag("DRYAD_FUCKED");
			IncrementFlag("DRYAD_HERCUNT");
			pc.orgasm();
		}
	}
	
	output("\n\nAmber’s a complete wreck. Her squeezing pussy");
	if (kok >= 0) output(" drips with your seed");
	else output(" twitches around the hardlight");
	output(", muscles shaking with fatigue. Her deer legs are splayed to the side, and her entire upper body is pasted with her own cum. Her slickened breasts heave up and down as breath enters and leaves her overworked lungs. Despite all that, though, her expression is one of pure ecstasy.");
	
	output("\n\nThough it took you some time, you’ve conquered and subdued her otherworldly libido. You lift yourself off her and step over her prostrate body, presenting");
	if (kok >= 0) output(" your still-stiff cock");
	else output(" the hardlight");
	output(" to her.");
		
	output("\n\n<i>“Suck it until I cum,”</i> you instruct her, and she’s more than willing to repay the favor.");
	
	output("\n\nIt feels so good to finally orgasm after nailing Amber through the fucking floor, so satisfying to feel her");
	if (kok >= 0) output(" gulping down your cum");
	else output(" sucking on your sensitive tip");
	output(" that your expression mirrors her own. She cums a little just feeling you do the same,");
	if (pc.isTaur()) output(" working so hard underneath your bulk that you can feel her devotion.");
	else output(" looking up at you with lidded eyes that suggest complete devotion.");
	output(" You let out a groan of contentment when she’s done, standing back up and stretching.");
	
	
	processTime(10 + rand(10));
	if (kok >= 0) amberFuckAHole(6, true, true);
	else
	{
		IncrementFlag("DRYAD_FUCKED");
		IncrementFlag("DRYAD_FACEFUCKED");
		flags["AMBER_LASTCUM"] = GetGameTimestamp();
		pc.orgasm();
	}
	
	output("\n\n<i>“So?”</i> you nod at her. <i>“Feel better?”</i>");
	output("\n\n<i>“I love you so much, [pc.name],”</i> Amber moans, laying back. <i>“Oh, fuck...”</i>");
	output("\n\n<i>“You’re pretty special yourself, Amber,”</i> you say, grinning. <i>“Go take a shower when you’re up to it. I’ll see you again soon, okay?”</i>");
	output("\n\n<i>“Uh huh,”</i> Amber nods sedately, rolling over and starting to get up. <i>“Come back soon, [pc.name].”</i>");
	output("\n\nWith a wave, you leave the dryad to get herself into a shower - you’ll come back down in half an hour or so to wake her up. In the meantime, you’re probably going to need one yourself.");
	
	sweatyDebuff(1);
	clearMenu();
	addButton(0, "Leave", mainGameMenu);
}
//is crew content on
public function amberIsCrewContentOn():Boolean
{
 if (flags["AMBER_CREW_SEX"] == 1) return true;
 else return false;
}
//increment correct flags and fill the right hole
public function amberFuckAHole(hole:int,amberCum:Boolean = true, pcChange:Boolean = true):void
{	
	var ppAmber:PregnancyPlaceholder = getDryadPregContainer();
	
	IncrementFlag("DRYAD_FUCKED");
	if (amberCum) flags["AMBER_LASTCUM"] = GetGameTimestamp();
	
	//-1 your ass, 0 to 2 your vag, 3 her dick your mouth, 4 her ass, 5 her vag, 6 your dick her mouth, 7 her vag your mouth, 8 your vag her mouth, 9 her pussy using mounting equipment
	if (hole == -1) //your ass
	{
		IncrementFlag("DRYAD_ANALEDYOU");
		if (pcChange) pc.buttChange(ppAmber.cockVolume(0), true, true, false);
		pc.loadInAss(ppAmber);
		pc.orgasm();
	}
	else if (hole >= 0 && hole <= 2) //your vag
	{	
		IncrementFlag("DRYAD_YOURCUNT");
		if (pcChange) pc.cuntChange(hole, ppAmber.cockVolume(0), true, true, false);
		pc.loadInCunt(ppAmber, hole);
		pc.orgasm();
	}
	else if (hole == 3) //her dick your mouth
	{
		IncrementFlag("DRYAD_BLEWHER");
		pc.loadInMouth(ppAmber);
		if (pc.lust() >= 75 || pc.isBimbo() || flags["USED_SNAKEBYTE"] != undefined) pc.orgasm();
	}
	else if (hole == 4) //her ass
	{		
		IncrementFlag("DRYAD_ANALED");
		if (pcChange) pc.cockChange();
		ppAmber.loadInAss(pc);
		pc.orgasm();
	}
	else if (hole == 5) //her vag
	{		
		IncrementFlag("DRYAD_HERCUNT");
		if (pcChange) pc.cockChange();
		ppAmber.loadInCunt(pc, 0);
		pc.orgasm();
	}
	else if (hole == 6) //her mouth
	{
		IncrementFlag("DRYAD_FACEFUCKED");
		ppAmber.loadInMouth(pc);
		pc.orgasm();
	}
	else if (hole == 7) //her vag your mouth
	{
		IncrementFlag("DRYAD_CUNHER");
		pc.girlCumInMouth(ppAmber);
		if (pc.lust() >= 75 || pc.isBimbo() || flags["USED_SNAKEBYTE"] != undefined) pc.orgasm();
	}
	else if (hole == 8) //her mouth your vag
	{
		IncrementFlag("DRYAD_CUNYOU");
		ppAmber.girlCumInMouth(pc);
		pc.orgasm();
	}
	else if (hole == 9) //her vag using mounting equipment (never done randomly)
	{		
		IncrementFlag("DRYAD_MOUNTING");
		if (pcChange) pc.cockChange();
		ppAmber.loadInCunt(pc, 0);
		pc.orgasm();
	}
	else
	{
		trace("amber.as -> amberFuckAHole: unindentified hole fucked! Hole: " + hole);
	}
}
//fuck random holes based on prior actions
public function amberRandomSex(restrict:int = 0, oral:Boolean = true):void
{	
	//restrict 0 = none, 1 = fuck her only, 2 = fuck pc only, 3 = don't weigh against oral
	var sel:Array = [];
	var i:int;
	var rn:int;
	
	//cut oral chance to a quarter to lean towards other actions more and account for more oral flags generally being set (used this method vs extra pushes since 'oral' parameter is a thing)
	if (oral && restrict != 3 && rand(4) > 0) oral = false;
	
	//load array with possible actions based on pcs prior sex acts with amber
	if (pc.hasCock() && restrict != 2)
	{
		if (flags["DRYAD_ANALED"] != undefined) sel.push(4);
		if (flags["DRYAD_HERCUNT"] != undefined) sel.push(5);
		if (flags["DRYAD_FACEFUCKED"] != undefined && oral) sel.push(6);
	}
	
	if (flags["DRYAD_ANALEDYOU"] != undefined && restrict != 1) sel.push(1);
	
	if (pc.hasVagina() && restrict != 1)
	{
		var vag:int = rand(pc.vaginaTotal());
		if (vag < 0) vag = 0;
		if (flags["DRYAD_YOURCUNT"] != undefined) sel.push(2);
		
	}	
	if (flags["DRYAD_BLEWHER"] != undefined && restrict != 1 && oral) sel.push(3);
	if (flags["DRYAD_CUNHER"] != undefined && restrict != 1 && oral) sel.push(7);
	if (pc.hasVagina() && flags["DRYAD_CUNYOU"] != undefined && restrict != 2 && oral) sel.push(8);
	
	i = sel.length;
	
	//randomly pick an action to take
	if (i > 0)
	{
		rn = rand(i);
		//1 your ass, 2 your vag, 3 your mouth, 4 her ass, 5 her cunt, 6 blow you, 7 cun her, 8 cun you
		if (sel [rn] == 1)
		{
			amberFuckAHole(-1, true, true);
		}
		else if (sel [rn] == 2)
		{
			amberFuckAHole(vag, true, true);
		}
		else if (sel [rn] == 3)
		{
			amberFuckAHole(3, true, true);
		}
		else if (sel [rn] == 4)
		{
			amberFuckAHole(4, true, true);
		}
		else if (sel [rn] == 5)
		{
			amberFuckAHole(5, true, true);
		}
		else if (sel [rn] == 6)
		{
			amberFuckAHole(6, true, true);
		}
		else if (sel [rn] == 7)
		{
			amberFuckAHole(7, true, true);
		}
		else if (sel [rn] == 8)
		{
			amberFuckAHole(8, true, true);
		}
	}
}
//used to simulate multiple random fucks over time
public function amberFuckForHours(orgasms:int, timeBetween:int=60):void
{
	if (orgasms < 1) orgasms = 1 + rand(10);
	var i:int = 0;
	for(i = 0; i < orgasms; i++)
	{
		processTime(timeBetween);
		amberRandomSex();
	}
}
//war'gii hold content done
public function amberWargiiHold():Boolean
{
 //placeholder logic until the content is in the game
 return false;
}
//returns number of doses of equilicum she has taken
public function amberEquilicumDoses():int
{
	if (flags["AMBER_EQUILICUM"] == undefined) return 0;
	
	return flags["AMBER_EQUILICUM"];
}
//have sex with amber using equipment to mount her
public function amberOnshipSexMounting(kok:int=0):void
{
	clearOutput();
	amberHeader();
	
	if (flags["DRYAD_MOUNTING"] == undefined || flags["DRYAD_MOUNTING"] < 1)
	{
		output("<i>“How about we finally put some of this equipment to good use?”</i> you say, gesturing at the equipment in the hold. There’s an array of paraphernalia ranging from swings and stirrups to bridles and even some lockable restraints but what interests you most right now is the mounting platform. A sturdy height-adjustable pole holds a long, solid cylinder with a foam top for the recipient to rest their tauric body on, and even offers a hanging line for the mare to rest her forelegs.");
		
		if (amberDumbfuckDoses() >= 4) output("\n\n<i>“Are you gonna fuck me on it?”</i> Amber asks hungrily.");
		else if (amberDumbfuckDoses() == 3)	output("\n\n<i>“Izzat for me?”</i> Amber says, grinning. <i>“Aw, you shouldn’t have!”</i>");
		else output("\n\n<i>“I see you looking at that thing,”</i> Amber says, grinning as she advances on the platform. <i>“How’s it work? Do I get on top of it?”</i>");
		
		output("\n\n<i>“Yup,”</i> you respond, slapping it with an open palm a couple of times. <i>“Up!”</i>");
		output("\n\nAmber springs upward onto the platform, deftly catching the support line with her front hooves. She can be very agile when she wants to be, you’ve noticed.");
		
		if (amberDumbfuckDoses() >= 4)
		{
			output("\n\n<i>“Gonna fuck your little deer?”</i> Amber moans, jiggling in eagerness. A slutty moan comes from deep in her throat, her mouth hanging open as she looks back at you. <i>“Please! [pc.name]!”</i>");
			output("\n\n<i>“Relax,”</i> you murmur, putting a hand on her fluffy flank.");
		}
		else if (amberDumbfuckDoses() == 3)
		{
			output("\n\n<i>“C’mon, c’mon!”</i> Amber says, all pretense of wittiness disappearing once she’s in position and her body realizes what’s going on. <i>“I... I need you!”</i>");
			output("\n\n<i>“I can see that,”</i> you murmur, putting a hand on her fluffy flank.");
		}
		else if (amberDumbfuckDoses() == 2)
		{
			output("\n\n<i>“Come on then, jockey [pc.boyGirl],”</i> Amber teases you with a smirk. <i>“Ride me till you’re done with me!”</i>");
			output("\n\n<i>“Think you need the ride more than I do at this point,”</i> you reply, grinning as you put a hand on her fluffy flank.");
		}
		else if (amberDumbfuckDoses() == 1)
		{
			output("\n\n<i>“Oh, we got a wannabe jockey here,”</i> Amber says, smirking back at you. <i>“Gonna ride me over the finish line, [pc.name]?”</i>");
			output("\n\n<i>“I think you’ll probably finish a few times before we’re done,”</i> you reply, putting a hand on her fluffy flank.");
		}
		else
		{
			output("\n\n<i>“Are you my jockey, [pc.name]?”</i> Amber says, looking back with a sly smirk. <i>“Bossing me about.”</i>");
			output("\n\n<i>“At the very least, I’m going to be riding you,”</i> you say, putting a hand on her fluffy flank.");			
		}	
		output(" Her tight little pussy is glistening already, wetness dripping from the barely visible pink slit between her dark black lips. The surrounding patch of fur is already damp with her arousal, the air around your head getting thicker with her sex pheromones with each passing second. They wrap around your brain ike a clenched fist, commanding you to fuck the daylights out of this nubile deertaur.");
		
		output("\n\n<i>“Ah..!”</i> Amber moans at the feeling of your fingers, her hips quivering. <i>“Huh... W-what are these for...”</i>");
		
		output("\n\nYou take a look up and see she’s gingerly touching what appears to be handlebars hanging from the ceiling. Miscellaneous attachments - you can hardly keep track of them all. Shrugging, you");
		if (pc.isTaur())
		{
			output(" join her on top of the platform, your forelegs landing on either side of her. Her shivering cunt is impossibly hot against your");
			if (kok < 0) output(" hardlight");
			else output(" [pc.cock " + kok + "]");
		}
		else
		{
			output(" take your");
			if (kok < 0) output(" hardlight");
			else output(" [pc.cock " + kok + "]");
			output(" in hand and align it with her hot, shivering cunt.");
		}
		
		output("\n\n<i>“Dunno. Guess you can find out when we’re done, Amber,”</i> you mutter.");
		
		output("\n\n<i>“Oh </i>god<i>, I’m so fucking ready,”</i> she moans, anxiously bouncing on her rear legs a little and rubbing herself up and down against");
		if (kok < 0) output(" the tip of your hardlight.");
		else output(" your [pc.cock " + kok + "].");		
		output(" <i>“Fuck me! Fuck me!”</i>");	
	}
	else
	{		
		output("<i>“Wanna use the mounting pl-”</i> you begin, turning as a furry brown blur bounces past you and lands squarely atop the platform.");
		
		if (amberDumbfuckDoses() >= 4)
		{
			output(" Amber immediately begins humping the platform, rubbing her drooling cock against the surface while wetness freely drools from her winking pussy and spatters the floor. It takes her a few seconds of desperate groaning before she turns back to you, eyes wild.");
			output("\n\n<i>“Pleeeaaase fuck my pussy, [pc.name],”</i> she moans, panting already. <i>“Please! As hard as you did last time! No, harder!”</i>");
		}
		else if (amberDumbfuckDoses() == 3)
		{
			output(" Amber very unsubtly rubs herself against the top of the platform, shifting back and forth and moaning while she turns to look at you, freckled cheeks already flushed red.");
			output("\n\n<i>“Come onnn, [pc.name],”</i> she pants, impatiently wiggling her ass in your face. <i>“Fuck my little pussy like you own it!”</i>");
		}
		else
		{
			output(" Amber turns her head and, with a sly grin, shakes her ass in your face. Droplets of arousal spatter the floor of the hold, thrown from her damp white fur.");
			if (amberDumbfuckDoses() == 2) output("\n\n<i>“Gonna fuck the hell out of my pussy again, [pc.name]?”</i> she asks you, proudly flaunting it in your face. <i>“Come on! Fuck, I can hardly wait!”</i>");
			else if (amberDumbfuckDoses() == 1)	output("\n\n<i>“You know you can’t resist fucking this pussy, [pc.name],”</i> she purrs. <i>“Oh god, I can hardly wait...”</i>");
			else output("\n\n<i>“Come on, [pc.name],”</i> she purrs. <i>“Aren’t you going to ride your mount?”</i>");
		}
	}
	
	output("\n\n<i>“Can’t say no to that,</i> you murmur,”</i>");
	if (pc.isTaur()) output(" rearing up and");
	output(" positioning yourself behind the needy taurgirl.");
	
	output("\n\nAmber screams in joyous lust the moment you thrust into her, sinking");
	if (kok < 0) output(" your entire length");
	else if (pc.cocks[kok].cLength() <= 10) output(" your entire length");
	else output(" several inches");
	output(" inside her hot, flexing passage and feeling her cum immediately.");	
	
	if (kok >= 0) pc.cockChange();
	
	output("\n\n<i>“Gggoooohhhhd!”</i> Amber howls, flexing her hindquarters so hard you have to stop for a moment. <i>“Uuuugh! Nnnnnhhh!”</i>");
	
	output("\n\nIt only takes a second for you to hear splatters of her thick, pent-up cum landing on the floor ahead of her, the volume of her loads increasing until it sounds like she’s shooting a hose from between her madly shaking hips.");
	if (amberEquilicumDoses() > 0) output(" Her overflowing virility keeps her cumming almost without end, her overfull balls pumping wads and wads of sloppy seed from her flared tip while she grunts like an animal.");
	
	output("\n\n<i>“You’re not even close to finished yet,”</i> you promise her, grabbing");
	if (pc.isTaur()) output(" a fistful of her hair and pulling her back.");
	else output(" ahold of her tail.");
	
	output("\n\n<i>“Uuhhh!”</i> she moans insensately, like putty in your grip.");
	
	if (kok >= 0)
	{
		if (pc.cocks[kok].cLength() >= 48) output(" Amber screams in pleasure louder and louder with every thrust as you work yourself inside her, your behemoth cock stretching her slippery marecunt open to allow for your massive length to follow. You can feel her resistance fading by the second as her lithe body gives up and swallows foot after foot of your gigantic dick, shifting her insides around as she stretches to the limit. Cum shoots from her cock hard enough to paste itself across the floor, almost as if you’re forcing it from her heavy, swaying balls with every rough thrust.");
		else if (pc.cocks[kok].cLength() >= 30) output(" You can feel her stretching around you with every thrust, her lithe body struggling to take all of you in, the soft walls of her heated pussy instinctively clenching down on you in an attempt to arrest your progress. It’s all for naught as you bottom out in her and she lets out a bestial, growling scream of satisfaction, your tip pressed firmly against her tiny opening. You can hear quiet splatters of her cum hitting the ground every time you shove forward, planting your [pc.feet] and slamming into her shaking, dripping hindquarters.");
		else if (pc.cocks[kok].cLength() >= 18) output(" You rock into Amber so hard the sound of your groin smacking against her ass echoes in the hold, ravaging her with your white-knuckled fingers sunk into her smooth brown fur to hold her in place. Bottoming out with your tip pressed right up against her womb, you can feel her tiny opening desperately clinging to your tip as if begging you to nut inside. She lets out a long, desperate groan of need when she feels you prodding at her, thrusting her dripping pussy back at you.");
		else if (pc.cocks[kok].cLength() >= 11)
		{
			output(" Each rough thrust of your [pc.hips] works more of your sizeable dick inside her squeezing-tight pussy, aftershocks running through her like bolts of lightning. Her back arches with every thrust, a deep, satisfied groan leaking from her lips when she feels you hilt yourself inside her. She’s so wet that every motion sends droplets scattering across your");
			if (pc.isTaur()) output(" hindlegs");
			else output(" [pc.thighs]");
			output(", sweat and arousal both. Her fat, heavy balls swing wildly between her legs, still taut in the wake of her massive orgasm but already pumping back up with her next load.");		
		}
		else output(" You can still feel her suffering from aftershocks as you ruthlessly plunge your dick into her, the soft pleated walls of her heated pussy rippling around you, threatening to make you cum on the spot. She lets out needy whines and breathy moans with every thrust, shivering atop the platform she’s marooned on. It’s extremely easy to tell where she feels it the most, her voice twisting into a breathless, bestial groan whenever you hit the right spot and an accompanying splurt of equine semen splashing to the floor of the hold.");
	}
	else output(" You can still feel her suffering from aftershocks as you ruthlessly plunge your hardlight into her, the soft pleated walls of her heated pussy rippling around you, threatening to make you cum on the spot. She lets out needy whines and breathy moans with every thrust, shivering atop the platform she’s marooned on. It’s extremely easy to tell where she feels it the most, her voice twisting into a breathless, bestial groan whenever you hit the right spot and an accompanying splurt of equine semen splashing to the floor of the hold.");
	
	output("\n\n<i>“Fuckfuckfuckfuck,”</i> Amber moans under her breath, her entire body tensing up as she reaches up to grab the handlebars. <i>“Ffff-uuuuu-”</i>");
	output("\n\nHer breath catches in her throat and stays there while you watch her sweaty hands wrap around the handles and her knuckles turn white, her firm, curvy asscheeks squeezing together as she shudders. You keep thrusting for a few seconds and eventually the dam breaks, the deergirl cumming so hard you have to grit your teeth to stop yourself from joining her.");
	output("\n\n<i>“Hhhuuuhh! Ooooohhhhgooodddd! Nnnnnhhgh!”</i> she cries out, throwing her head back and screaming to the ceiling. Jets of thick, white cream shoot several feet across the hold from her cock while her desperately clenching pussy squirts all over your shaft and down her hindlegs. <i>“Fuuuuuuck!”</i>");
	output("\n\nDriven on by her display of utter loss of control, you start pounding her all over again, paying no heed to the way she doubles over panting and gasping in sweaty ecstasy. She can’t even stop herself from cumming as long as you keep fucking her, and the harder the better. Rope after rope of equine seed spurts from her jumping cock, pumped out by her overactive balls. Her arms shake while she hangs from the handlebars, her small biceps showing under her fair skin while she strains with effort, face flushed red and voice disappearing for seconds at a time.");
	
	if (flags["DRYAD_MOUNTING"] == undefined || flags["DRYAD_MOUNTING"] < 1)
	{
		if (amberDumbfuckDoses() >= 4) output("\n\n<i>“How’s the little deer doing now?”</i> you ask, earning a pleased moan from Amber’s lips.");
		else if (amberDumbfuckDoses() == 3)	output("\n\n<i>“You were right,”</i> you tell her, a little out of breath yourself, <i>“you </i>do<i> need me.”</i>");
		else if (amberDumbfuckDoses() == 2)	output("\n\n<i>“Not done with you just yet, Amber,”</i> you pant, a tired but eager groan slipping from her mouth in reply.");
		else if (amberDumbfuckDoses() == 1)
		{
			output("\n\n<i>“How’s that finish line looking now, Amber?”</i> you pant, eliciting a tired groan from");
			if (pc.isTaur()) output(" below.");
			else output(" up front.");
		}
		else output("\n\n<i>“Enjoying being ‘bossed around’ now, Amber?”</i> you tease her, earning a low, tired moan from her mouth.");
	}
	else
	{
		if (amberDumbfuckDoses() >= 4) output("\n\n<i>“No way you want me to stop there, right?”</i> you ask, grinning as she groans in affirmative.");
		else if (amberDumbfuckDoses() == 3)	output("\n\n<i>“Happy with that?”</i> you ask, earning a pleased groan. <i>“Want me to keep going?”</i> Another groan, louder this time.");
		else if (amberDumbfuckDoses() == 2)
		{
			output("\n\n<i>“You asked me to fuck the hell out of you,”</i> you tell her,");
			if (pc.isTaur()) output(" running your hand through her bedraggled hair.");
			else output(" squeezing her butt.");			
			output(" <i>“Still up for it?”</i>");
		}
		else if (amberDumbfuckDoses() == 1)	output("\n\n<i>“Guess you were right, I couldn’t resist after all,”</i> you tell her, earning an appreciative groan from her lips.");
		else output("\n\n<i>“How does having me back in the saddle feel, Amber?”</i> you ask, earning a pleased groan from her lips.");		
	}
	
	output("\n\n<i>“Kuh... keep... keep going,”</i> she finally moans, head lolling forward as all of the tension drains from her body. Ordinarily this might be where she couldn’t stay standing any longer due to exhaustion, but");
	if (amberDumbfuckDoses() >= 3) output(" after all the Dumbfuck Amber’s taken, she’s anything but ordinary. She’d never turn down an opportunity to keep fucking like animals, especially not when she doesn’t even need to stay upright herself.");
	else if (amberDumbfuckDoses() >= 1)	output(" both the Dumbfuck and the platform ensure she’s more than ready for you to continue.");
	else output(" the platform ensures she’s staying right where she is.");
	
	output("\n\nIt’s a tall order, but she only asks because she knows you’re good for it.");
	if (kok < 0) output(" Besides, it’s not like you’re about to go limp on her - you can keep her here, gasping and cumming and calling your name until you want to take a break.");
	else if (pc.isTreated()) output(" Thanks to the Treatment, you can fuck her like she deserves until you want to stop.");
	else output(" If nothing else, you want to hear how she screams your name when you finally cum inside her sopping snatch.");
	output(" Her groan when you slide back into her is music to your ears, carnal bliss dripping from her wordless voice. She clings to the handlebars above her with the weakest of grips, too tired to muster anything more but unwilling to let go lest she miss out on even a second of having you inside her.");
	
	output("\n\nYou don’t bother starting slow, knowing Amber too well by now for that. Sure enough, tired though she may be, she’s thrusting her ass back into you and moaning like an absolute whore within a minute of resuming.");
	if (pc.isTaur()) output(" With your [pc.chest] pressed against her sweaty back you grip the dryad around her narrow waist and buck your hips into her with complete abandon, plowing her hard enough to make her modest breasts sway on her chest.");
	else output(" You give her a light smack on the ass and she only moans louder, clenching around you in need. With your fingers gripping her narrow hips tight, you plow her hard enough to make her front half slide a couple of inches along the platform.");
	
	output("\n\n<i>“[pc.name]! Oh, [pc.name]!”</i> Amber cries, her voice as ragged as her messy red hair.");
	if (kok < 0) output(" <i>“I’m gonna c-uh! Gonna cum again soonnnn!”</i> Twisting her head this way and that, she strains and grits her teeth.");
	else output(" <i>“Cum inside me! Cum with me,”</i> she pleads, twisting her head this way and that.");	
	output(" <i>“Nnnnhhh- I can feel it c-coming..!”</i>");
	
	output("\n\nYou can feel your own orgasm getting closer, spurred on all the more by your lover’s sexy moans and the intense tightening of her soft walls on your");
	if (kok < 0) output(" tactile dick.");
	else output(" sensitive shaft.");		
	output(" Amber is all but massaging you at this point, panting in effort as her hindquarters strain to keep up with you, clamping down on your cock and stroking it as best she can. She shivers and shakes, precum dripping from her thick, flaring cockhead until at last, she can stand it no more.");
	
	output("\n\n<i>“Oh! Oh,”</i> Amber moans in a high-pitched voice, thrusting her hips forward unconsciously. <i>“S-so good...”</i>");	
	
	output("\n\nGrunting, you");
	if (pc.isTaur()) output(" squeeze her shoulders");
	else output(" grip her fur tight");	
	output(" and join her,");
	if (kok < 0)
	{
		output(" the hardlight rocking your body with the intensity of a male orgasm. Your core tightens until it no longer seems possible, that your midriff will be tied into a knot, and then at last it all comes free. Gasping, you slump against Amber’s");
		if (pc.isTaur()) output(" back");
		else output(" butt");	
		output(" as blissful relief washes through your form, radiating outward from the head of your faux dick. The sense of satiation is immeasurable, so pleasurable that you come close to triggering a sympathetic female orgasm as well, just like the dryad.");
	}
	else
	{
		output(" [pc.cum] pouring into Amber’s sodden passage even as her own seed flies from her oversized horsecock. You slump against her");
		if (pc.isTaur()) output(" back");
		else output(" butt");	
		output(" and groan in relief, finally free of edging in her devilishly pleasurable cunt.");
		if (pc.balls > 0) output(" Your [pc.balls] tighten further with each release until they’re nestled tightly against your underside, pumping Amber full of cum.");
		else output(" You can feel the knot in your stomach begin to dissipate as you dump another load inside her.");
	}
		
	output("\n\nRelaxed, you let Amber ride out her own orgasm, blowing what sounds like a bucketload of equine spunk all over the floor while she shakes and groans wordlessly. Your orgasm only seems to spur her on, each");
	if (kok < 0) output(" sympathetic");
	else output(" gentle");		
	output(" throb of your length inside her sending another wad of her sticky jizz splattering to the floor.");
	if (pc.isTaur()) output(" Reaching up her front to cup her breasts in your palms, you lean down to kiss her on the neck as she nuzzles into you, breathing hard.");
	else output(" You stroke her flank while she works through the last of it, both of you breathing hard in the wake of the storm.");	
	
	if (amberDumbfuckDoses() >= 4) output("\n\n<i>“Uuuuhhh...”</i> Amber moans, half-turning to face you. She looks half fucked unconscious, eyelashes fluttering sedately. <i>“[pc.name]... my pussy feels so fucking good right now...”</i>");
	else if (amberDumbfuckDoses() == 3)	output("\n\n<i>“Fuck, you’re good,”</i> Amber pants, her hands falling from the bar to rest atop the platform and half-turning to face you. <i>“We need to do that again, really soon...”</i>");
	else if (amberDumbfuckDoses() == 2)	output("\n\n<i>“God,”</i> Amber pants, letting her sweaty hands fall from the handlebars and half-turning to face you. <i>“I’d be pretty happy to lie there all day and have you pound the fuck out of me all day and night...”</i>");
	else if (amberDumbfuckDoses() == 1)	output("\n\n<i>“Fuuuck,”</i> Amber moans, finally relaxing her tenuous grip on the handlebars and half-turning to face you. <i>“You are a fucking beast in the best possible way, [pc.name]...”</i>");
	else output("\n\n<i>“You, are the, fucking best,”</i> Amber pants, finally letting go of the handlebars and half-turning to face you. <i>“Oooohhhh, god...”</i>");
	
	output("\n\n<i>“Sounds like we should use the equipment more often,”</i> you reply, smiling at her.");
	
	if (amberDumbfuckDoses() >= 4) output("\n\n<i>“Uh huh,”</i> she sighs in happiness, looking into your eyes dazedly. <i>“Just put me on this thing and fuck my little cunt until I gape, [pc.name]. Any time you want.”</i>");
	else if (amberDumbfuckDoses() == 3)	output("\n\n<i>“Fuck, I’d beg you to plow my deercunny again right </i>now<i> if I wasn’t so sensitive,”</i> she groans, shivering. <i>“Getting wetter just thinking about it...”</i>");
	else if (amberDumbfuckDoses() == 2)	output("\n\n<i>“Oh, fuck yeah,”</i> she sighs happily, looking into your eyes. <i>“Any time you want, and I mean </i>any<i> time you want to fuck me on this thing, I’m game.”</i>");
	else if (amberDumbfuckDoses() == 1)	output("\n\n<i>“Fuck yes,”</i> she replies immediately, nodding her head vigorously. <i>“Just thinking about it,”</i> she trails off, shivering in bliss and rolling her eyes upwards. <i>“Nngh. It’s the fucking </i>best<i> feeling.”</i>");
	else output("\n\n<i>“Yes,”</i> she replies immediately and emphatically, nodding her head. <i>“God, yes... getting mounted is just,”</i> she shivers in bliss and rolls her eyes, <i>“the </i>best<i> feeling.”</i>");
	
	output("\n\nAs if to reinforce her point, you can feel her pussy weakly tighten up on you when she says it. She is a centaur, after all");
	if (pc.isTaur()) output(" -- and so are you, so you can understand the impulse. There’s something primally satisfying about mounting and taking a mare...");
	else output(" -- being mounted by her partner is second nature. There’s definitely a primal appeal to it...");	
	
	if (amberDumbfuckDoses() >= 3)
	{
		output("\n\n<i>“Fuck,”</i> Amber suddenly gasps in pleasure, grasping her own nipples and squeezing them roughly.");
		if (kok < 0) output(" <i>“Nnnn... The hardlight is flexing inside my little cunt...”</i>");
		else output(" <i>“Nnnn... Your big fat [pc.cockSimple " + kok + "] is flexing inside my little cunt...”</i>");
		
		output("\n\n<i>“Listening to you talk makes me horny sometimes,”</i> you admit, grinning. <i>“Especially about getting mounted.”</i>");
		output("\n\n<i>“Fuck, that’s </i>hot<i>,”</i> she moans, wiggling her hips a little. <i>“Um... fuck me again?”</i>");
		output("\n\n<i>“Grab a shower first,”</i> you suggest with a smile. <i>“Gives me time to clean up a little.”</i>");
		output("\n\n<i>“Okay!”</i> Amber says happily, nodding.");
	}
	else if (amberDumbfuckDoses() >= 1)
	{
		output("\n\n<i>“Nnnf, I can feel you </i>flexing<i> inside me,”</i> Amber murmurs, smirking. <i>“Whassamatter, [pc.name]? Getting all worked up over mounting me?”</i>");
		output("\n\n<i>“You make it a hell of an experience,”</i> you say, grinning.");
		output("\n\n<i>“Glad to hear it,”</i> she replies happily. <i>“I wouldn’t want my lover </i>not<i> thinking about going again! In fact, after I shower, I’m gonna come right back down here,”</i> she continues, grinning, <i>“and wait for you to ask to go again.”</i>");
	}
	else 
	{
		output("\n\nAmber giggles, smiling shyly. <i>“I can feel you flexing inside me... what’s the matter, [pc.name]? All the mounting talk getting to you?”</i>");
		output("\n\n<i>“Just a bit,”</i> you say, grinning.");
		output("\n\n<i>“Good to know I still have that effect on you, then,”</i> she says happily. <i>“Mm... pull out </i>gently<i>, please. I’m so sensitive right now I’m about ready to topple off this thing.”</i>");
	}
	
	output("\n\nYou extricate yourself with care, coming free with a wet, slippery slurp as Amber lets out a loud groan and arches her back. A river of her formerly trapped juices spatters to the floor, staining her fur and pooling between her shaking hindlegs.");
	
	if (amberDumbfuckDoses() >= 3) output("\n\n<i>“Fuuck, I came,”</i> she groans, starting to slowly shuffle backwards off the platform. <i>“Uuuhhhh...”</i>");
	else output("\n\n<i>“Uhhh...”</i> she sighs tiredly, beginning to very slowly shuffle backwards off the platform. <i>“I definitely just came a little right there...”</i>");
	
	output("\n\n<i>“You need some help there?”</i> you ask, lifting her forelegs out of their supports and aiding her dismount. ");
	
	if (amberDumbfuckDoses() >= 3)
	{
		output("\n\n<i>“Thanks, [pc.name]!”</i> Amber says happily, grabbing your hand and enclosing it in her own. She leans in to kiss you, closing her eyes and pressing her bare breasts against you. <i>“Mmmm...”</i>");
		output("\n\nShe parts her lips and greedily slips her tongue into your mouth, wrapping it around your own and fueling her own excitement until at last, you pull back and give the panting, flushed deertaur a reminder.");
		output("\n\n<i>“You were gonna shower. Remember?”</i> you say, grinning.");
		output("\n\n<i>“Oh, yeah!”</i> she realizes with a gasp, turning away before turning back. <i>“Promise me you’ll fuck my pussy when I get back, okay? I’ll just take a quick one! Okay bye, love you [pc.name]!”</i>");
	}
	else if (amberDumbfuckDoses() >= 1)
	{
		output("\n\n<i>“Whew... okay, gonna grab that shower,”</i> Amber says, leaning in to kiss you on the lips. <i>“Mmm...”</i>");
		output("\n\nShe pulls back several seconds later, letting out a harsh, hot breath. <i>“Fuck, you are so hot,”</i> she murmurs. <i>“I need to shower </i>now<i> before I just... mmf. Okay! Shower, bye [pc.name]!”</i>");
	}
	else
	{
		output("\n\n<i>“Oof... thanks, [pc.name],”</i> Amber says, touching your arm gratefully and smiling when she’s down. <i>“Do you mind if I use your shower?”</i>");
		output("\n\n<i>“Go for it,”</i> you nod, waving at the door. <i>“I’ll clean up a little bit here so you don’t go into heat the moment you come back down.”</i>");
		output("\n\n<i>“Aw, thanks!”</i> she giggles, leaning in to kiss you on your [pc.lipsChaste]. <i>“Mmm...”</i>");
		output("\n\nShe pulls back several seconds later, a big grin on her freckled face. <i>“Okay, I’m gonna go wash up before I start thinking any lewder. See you soon, [pc.name]!”</i>");
	}
	
	output("\n\n<i>“Yeah, see ya, Amber,”</i> you nod, smiling as she canters up to the ship proper.");
	output("\n\nYou turn to your task, still surrounded by her incredibly ‘loud’ pheromones screaming at you to fuck and breed. You’re definitely gonna need to clean this up...");

	//sex time
	processTime(20 + rand(15));
	
	if ( kok < 0) 
	{
		IncrementFlag("DRYAD_FUCKED");
		IncrementFlag("DRYAD_MOUNTING");
		flags["AMBER_LASTCUM"] = GetGameTimestamp();
		pc.orgasm();		
	}
	else
	{		
		amberFuckAHole(9, true, false);
	}	
	//gain lust from post fuck flirting and kissing
	if (amberDumbfuckDoses() >= 3) pc.changeLust(25);
	else if (amberDumbfuckDoses() >= 1)	pc.changeLust(20);
	else pc.changeLust(15);

	//cleanup time
	if (celiseIsCrew()) processTime(5 + rand(5));
	else processTime(30 + rand(30));
	
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function amberDoesTheMountingThisTime(vagIdx:int):void
{
	clearOutput();
	amberHeader();

	var ppAmber:PregnancyPlaceholder = getDryadPregContainer();

	output("<i>“So I know mounting can take a lot out of you,”</i> you say, smiling at Amber, <i>“and I figured we could use some of the stuff Urbolg and I set up. Like this!”</i>");
	output("\n\n<i>“Oh!”</i> Amber exclaims, looking at the little platform hanging from the ceiling. <i>“Is that what it’s for?”</i>");
	output("\n\n<i>“Uh huh. You just put your front legs over it so you can stand more comfortably,”</i> you say, nodding. <i>“So how about it? Wanna give it a try?”</i>");
	output("\n\n<i>“Oh </i>yeah<i>!”</i> she says enthusiastically. <i>“Like I’m gonna miss out on mounting you, [pc.name]!”</i>");
	output("\n\nYou grin at the eager response. Sex is never <i>that</i> far from the pretty deergirl’s mind, after all, and frankly watching her climb into the little harness is a little erotic in itself. All that enormous, sensitive horsecock just hanging there in midair, waiting for you to move into position.");
	output("\n\n<i>“Like what you see, [pc.name]?”</i> Amber says, smirking down from above. <i>“You look as keen as I feel... I can hardly wait!”</i>");
	output("\n\nShe’s not kidding -- thick white precum drips from her heavy pink cock, running down her swollen cockhead and veiny underside as she wiggles her powerful hips in anticipation. The motion of it makes");
	if (amberEquilicumDoses() > 0) output(" all four of");
	output(" her giant, seed-swollen nuts jiggle, an enticing and promising sight if you’ve ever seen one. Even her teeth are bared, biting her bottom lip while she watches you");
	if (!pc.isNude()) output(" undress");
	output(".");
	output("\n\n<i>“Oh, fuck, you are so hot,”</i> she mutters quietly, her cock throbbing and standing even stiffer. <i>“Wanna rut the shit out of </i>that<i>...”</i>");
	output("\n\n<i>“This?”</i> you say, smiling as you bend over in front of her, reaching back to spread");
	if (vagIdx < 0) output(" your cheeks for her, exposing your [pc.asshole]. <i>“You wanna force-fuck that gigantic horsecock of yours into my biped ass, Amber?”</i>");
	else output(" the lips of your [pc.pussy " + vagIdx + "] for her, exposing the wetness. <i>“You wanna force-fuck that gigantic horsecock of yours into my biped pussy, Amber?”</i>");
	output("\n\n<i>“Yeah! Yeah!”</i> Amber pants, her cheeks flushing with color while she bucks her hips forward, straining against the mounting harness. <i>“Nnnnh!”</i>");
	output("\n\nTurning Amber on to the point of insensibility is like a switch, so easy it’s almost like cheating, really. But looking up at her and seeing her literally drool in eagerness, her tongue stuck out of her mouth while she lets out heated pants, you can’t say you mind. She’s such a <i>giving</i> lover, after all... she deserves to be treated nicely.");
	output("\n\n<i>“Aaaaah!”</i> Amber cries out, shivering in your grip as you bend down to take a quick suck of her cock. <i>“Oh! Oh! [pc.name]...”</i>");
	output("\n\nYou’d just intended to lube her up and tease her a little bit before the main event but as you withdraw licking your [pc.lips] clean, it’s evident you needn’t have bothered. She’s <i>slick</i> with precum, the first few inches of her staggering equine dick coated in it. Little wonder she’s so good at getting it in.");
	output("\n\n<i>“You ready?”</i> you murmur to her, already knowing the answer.");
	output("\n\nAmber doesn’t even have time to get the words out before you’re both groaning deeply, her flared head pressing at your " + (vagIdx < 0 ? (pc.hasPlumpAsshole() ? "puffy donut" : "stretching asshole") : "wet, slippery folds") + ". She lets out a little scream of joy as she caves your");
	if (vagIdx < 0) output(" ring inwards, pushing her way into your slickened intestines");
	else output(" pussy inwards, pushing her way into your stretched-out slit");
	output(" while you grip the lower bar for support. <i>Whoever built this must be a genius,</i> you think, biting your lip and shivering in bliss while Amber’s dizzying pheromones swirl around your head and her fat cock sinks deeper between your");
	if (vagIdx < 0) output(" asscheeks, sticky precum dripping down your " + (pc.balls > 0 ? "[pc.balls]" : "underside"));
	else output(" sensitive walls, coating them in sticky precum");
	output(" as she goes. <i>There’s going to be just enough room for-</i>");
	output("\n\nThis time it’s your turn to scream in ecstasy when Amber’s fat, juicy nutsack swings up and slaps your [pc.ass]. A few droplets of");
	if (vagIdx < 0) output(" her cum squirt back down her cock, forced from your clenching asshole");
	else output(" [pc.girlCum] squirt down her cock, forced from your clenching vagina");
	output(", the enormous horsecock embedded in your body taking up all available space. It feels like if you were to tense your abdominals right now, all you’d accomplish is giving her a nice massage from the inside.");
	pc.holeChange(vagIdx, ppAmber.biggestCockVolume());
	output("\n\n<i>“St-stars,”</i> you moan, hanging your head she draws back for another thrust. <i>“Oh, </i>fuck<i>!”</i>");
	output("\n\nThis time Amber makes <i>sure</i> she’s bottomed out inside you, bringing her hips forward and roughly grinding herself up and down your");
	if (pc.buttRating() < 3) output(" tight butt");
	else if (pc.buttRating() < 5) output(" jiggling butt");
	else output(" enormous butt");
	output(", getting just the right angle to make you groan like a whore. Once she hears that, she can’t be stopped -- suddenly you’re being pounded like her life depends on it, the clap of flesh on flesh ringing out in the hold while the two of you sing a duet of shared carnal joy. A mixture of your juices begins to drip and squirt from between your [pc.thighs], your fuckhole stretching wide every time she pulls back and lets her flaring head approach the entrance.");
	output("\n\nThen she drives it back in with such force and precision you have to fight to keep from screaming in outright rapture on every thrust, biting your lip so hard it hurts, muffled grunts and groans slipping from your mouth unbidden regardless. There’s no time to even adjust your slickening grip on the mounting hold, your fingers slipping while Amber pounds you out until you’re coated in sweat both hers and your own. The way her");
	if (vagIdx < 0) output(" thrumming cumvein rubs against your prostate, though, does you in. Each rough stroke");
	else output(" heavy balls fiercely slap against your [pc.clit " + vagIdx + "], though, does you in. Each thudding impact");
	output(" makes your [pc.legs] quake with the pleasure of it, your knees turning inwards until you give up and let go.");
	output("\n\n<i>“Amber,”</i> you moan, squeezing your eyes shut as a violent orgasm threatens to unsteady your grip. <i>“Oh, <b>Amber!</b>”</i>");
	output("\n\nYou cry out her name as she makes you cum all over");
	if (pc.hasCock()) output(" the floor,");
	else output(" her thrusting cock,");
	if (vagIdx < 0) output(" your insides");
	else output(" your sensitive walls");
	output(" clamping down on her and succeeding only in forcing you to orgasm even harder, a bellowing groan of pleasure forcing its way past your lips. The complete loss of control doesn’t go unnoticed and Amber, sensing your inability to keep yourself afoot, begins thrusting upwards until you get your legs back under you. You don’t even comprehend what she’s done, just that she’s back to slamming her immense length all the way inside your quivering " + (vagIdx < 0 ? "hole" : "clam") + " and you can feel your brain oozing from your [pc.ears].");
	output("\n\nThe longer she goes the more and more eager you get to finally feel Amber pop, her breathing growing more ragged by the second while her deliciously large flare begins to flower inside you, spreading wide until it feels like she must be as large as a fucking dinner plate. Your mouth opens and closes and nothing comes out save for little breathless gasps and pants as well as your [pc.tongue], stuck out on particularly strong thrusts right into your most sensitive parts. The iron-hard length between your [pc.hips] beginning to swell to unimaginable proportions as you shake and tremble on the end of it, you bring your thighs together and squeeze her as hard as you can, hearing your lover groan in response.");
	output("\n\n<i>“Fuuuuck-!”</i> Amber strains, her lower half bucking wildly. <i>“Gonna cum! Cumming! Cumming! Nnnnnnghk-”</i>");
	output("\n\nShe lets out a plaintive cry and thrusts forward, letting the silence hang in the air for a second before a <i>massive</i> stream of spunk spurts from the end of her pulsing, flexing horsecock and into");
	if (vagIdx < 0) output(" your bowels");
	else if (pc.isPregnant(vagIdx)) output(" the squeezing confines of your pussy");
	else output(" your [pc.womb " + vagIdx + "]");
	output(". Your eyes roll up into your head at the feeling of it, the blissful warmth and heat of her pumping sperm flooding your body and spraying back out of your quivering fuckhole. She pours it into you with little thrusts, grinding herself against your ass while her bloated cockhead blooms over and over.");
	output("\n\nYou stand there and take it, breathing hard while your");
	if (vagIdx < 0)
	{
		output(" guts fill with Amber’s virile sperm, jetting into your stomach and swelling it outwards.");
		if (amberEquilicumDoses() > 0) output(" Boosted by the Equilibricum, Amber’s absurd output doesn’t stop or even slow until you’re groaning with exertion, your belly distended by a thick, heavy liquid load.");
		else output(" Her ballsack doesn’t stop throbbing against your rear until you look like you’ve swallowed a volleyball, though the way it shifts inside you gives away the heavy liquid nature of the load.");
	}
	else
	{
		if (pc.isPregnant(vagIdx)) output(" tightening canal is filled with fresh sperm over and over, spraying down your thighs as you reach capacity almost instantly. By the time she’s done, your legs are utterly coated in Amber’s spunk.");
		else
		{ 
			output(" womb fills to the brim with Amber’s virile sperm, swelling to the limit as a bump begins to appear through your stomach.");
			if (amberEquilicumDoses() > 0) output(" Boosted by the Equilibricum, her absurd output doesn’t stop flowing into you until you’re groaning with exertion, your belly distended by a thick, heavy liquid load.");
			else output(" Her ballsack doesn’t stop throbbing against your rear until you look like you’ve swallowed a volleyball, though the way it shifts inside you gives away the heavy liquid nature of the load.");
		}
	}
	output("\n\n<i>“Oooohhhh, wow,”</i> Amber moans, slowly -- very slowly -- stepping back, withdrawing her spent, pulsing cock from your cum-slick hole. She comes free with an audible <i>pop</i>, her impressive flare coming loose with a deluge of her formerly plugged spunk. It splashes to the ground between your [pc.feet] while you quiver and moan, each reflexive clench forcing yet more of her squelching seed to spurt and dribble from your");
	if (vagIdx < 0) output(" ring.");
	else
	{
		output(" slit.");
		if (!pc.isPregnant(vagIdx)) output(" Your womb still feels like it’s full to the brim with her and no doubt it will for some time, the warmth of her semen acting as a reminder of her love.");
	}
	output("\n\n<i>“Mmmm...”</i> she murmurs, walking around to your front. <i>“You were right... that </i>was<i> comfortable.”</i>");
	output("\n\nShe picks you up and kisses you, wrapping her arms around your back and entwining her tongue with yours as her alabaster cum drips and drools from your");
	if (vagIdx < 0) output(" gaping asshole.");
	else output(" gaping slit.");
	output(" After a second you hug her closer, closing your eyes and leaning into the kiss, pressing her soft breasts");
	if (pc.hasBreasts()) output(" into your own.");
	else output(" against your [pc.chest].");
	output(" You’re both sweaty and sticky but damn if the way she smells and feels against you doesn’t make you want to bury your head in her pretty red hair forever. You’ll settle for gently running your fingers through it.");
	output("\n\n<i>“Do you like my hair?”</i> Amber asks, nuzzling you and smiling.");
	output("\n\n<i>“I do,”</i> you say, nodding and rubbing your cheek against hers, then grinning. <i>“Maybe even more than I love your dick!”</i>");
	output("\n\n<i>“Ooooh, let’s not say things we can’t take back,”</i> she says, trying to scowl and only giggling. <i>“I’ll have to ride you even harder next time, [pc.name]. Can’t have you disrespecting my cock!”</i>");
	output("\n\n<i>“Especially when it gives you such an alluring gape,”</i> she adds, hooding her eyes as she reaches down and grabs two handfuls of your ass. <i>“You know what that looks like to a girl like me?”</i>");
	output("\n\n<i>“What?”</i> you whisper, looking into her narrowed blue eyes.");
	output("\n\n<i>“An invitation,”</i> she murmurs, leaning forward and biting your lip. <i>“So you’d better come back and see me again the next time you want some, [pc.name]. I’ll keep you nice and stretched out so you can fit all of me.”</i>");
	output("\n\nSitting back up in your room after a hot, steamy shower, you");
	if (pc.hasVagina()) output(" idly wonder if the wetness between your legs is because of Amber’s cock or her sensual promise.");
	else output(" look down at your [pc.cocks] and idly wonder if " + (pc.hasCocks() ? "they’re" : "it’s") + " erect because of the lingering feeling of Amber inside you or her sensual promise.");
	output(" It’s hard to tell.");

	IncrementFlag("DRYAD_FUCKED");
	processTime(20 + rand(15));
	if (vagIdx < 0) pc.loadInAss(ppAmber);
	else pc.loadInCunt(ppAmber, vagIdx);
	pc.orgasm();
	pc.shower();

	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function amberCanThreesome():Boolean
{
	if (annoIsCrew()) return true;
	return false;
}

public function amberThreesomesMenu():void
{
	clearOutput();
	amberHeader();

	switch (amberDumbfuckDoses())
	{
		case 0:
			output("<i>“How about I call down a friend?”</i> you say, grinning. <i>“I know at least one playmate onboard that would love to have a piece of you.”</i>");
			output("\n\n<i>“Oh, that sounds like fun!”</i> Amber says, smiling brightly. <i>“I hope they can handle me...”</i>");
			break;
		case 1:
			output("<i>“Let’s double the fun before we get down to it, then,”</i> you say, grinning. <i>“I’ll bring a friend.”</i>");
			output("\n\n<i>“Nice!”</i> Amber says, a smile blossoming on her flushed face. <i>“Maybe it’s the drugs but I <b>do</b> catch myself fantasizing about plowing the others sometimes...”</i>");
			break;
		case 2:
			output("<i>“How about I call down another friend to share you?”</i> you say, grinning. <i>“You like that idea?”</i>");
			output("\n\n<i>“Hell yeah I do,”</i> Amber says, her smile widening. <i>“More people to fuck is more good, far as I’m concerned! ‘Specially the hotties you’ve got onboard...”</i>");
			break;
		case 3:
			output("<i>“Let me call a friend down first,”</i> you say, grinning. <i>“Yeah, you like that idea, don’t you?”</i>");
			output("\n\n<i>“Oh, <b>fuck</b> yeah,”</i> Amber moans, practically salivating at the thought of having <i>two</i> people to milk her cock. <i>“Let me fuck them too!”</i>");
			break;
		case 4:
		default:
			output("<i>“Easy, girl,”</i> you say, grinning. <i>“Let me grab a friend so we can do this properly.”</i>");
			output("\n\nHer eyes visibly brighten and her tongue lolls out as she moans, her turgid cock waving from side to side and dripping all over the floor. Oh yeah, she’s keen for this, alright.");
			break;
	}

	clearMenu();
	var btnSlot:int = 0;
	if (annoIsCrew()) addButton(btnSlot++, "Anno", amberAndAnnoFun, undefined, "Anno", "Anno’s onboard and she’s <i>always</i> up for some fun... especially when it involves a pretty ‘taurgirl with a big cock.");
	// Add more sluts here
	addButton(Math.floor(btnSlot/14)+14, "Back", amberOnshipSex);
}

public function amberAnnoHeader():void
{
	showBust(dryadBustDisplay(), "ANNO_NUDE");
	showName("AMBER\n& ANNO");
	author("Wsan");
}

public function amberAndAnnoFun():void
{
	clearOutput();
	amberAnnoHeader();

	var ppAmber:PregnancyPlaceholder = getDryadPregContainer();

	output("You call Anno down to the hold for some crew duties and she’s there in a flash, fuzzy-eared and smiling brightly. She stops in the doorway when she sees Amber and her happy smile widens even further as her eyes travel down the dryad’s body, settling right on the girl’s thickly erect cock.");
	output("\n\n<i>“This is <b>exactly</b> what I signed up for when I took this job,”</i> Anno says with a laugh, stepping forward to stand with you in front of the more-than-ready taurgirl. <i>“You look so pent-up there, Amber... let us take care of you.”</i>");

	processTime(1);

	clearMenu();
	addButton(0, "Get Fucked", vaginaRouter, [amberAnnoSuckNGetFuck, getDryadPregContainer().cockVolume(0), 1, 0, false], "Get Fucked", "Give Anno a hand with getting Amber to blow her first load and get the second inside you.");
	if (pc.cockThatFits(ppAmber.vaginalCapacity()) >= 0 || pc.hasHardLightAvailable()) addButton(1, "Fuck Her", penisRouter, [amberAndAnnoGetFucked, ppAmber.vaginalCapacity(), true, 0], "Fuck Her", "Pound the fuck out of Amber while Anno takes care of her below.");
	else addDisabledButton(1, "Fuck Her", "Fuck Her", "Requires cock or hardlight.");
}

public function amberAnnoSuckNGetFuck(vagIdx:int):void
{
	clearOutput();
	amberAnnoHeader();

	var ppAmber:PregnancyPlaceholder = getDryadPregContainer();
	showImage("Moira_Anno_Amber");
	output("You take Amber by the chin and kiss her deeply, locking lips with the surprised deertaur as her eyes widen. Anno continues past you unnoticed, kneeling beneath Amber while you keep her distracted. She’s so fun to kiss, " + (amberDumbfuckDoses() > 0 ? "eager and libidinous until all-out sexual aggression almost forces you a step back." : "both eager and a little shy until her libido tips the scales in favor of all-out sexual aggression.") + " Right on cue, she suddenly moans in your mouth and you see her eyes momentarily roll upwards before flicking back as she tries to turn her head.");
	output("\n\n<i>“Uh-unh,”</i> you murmur, keeping her fixed in place while she moans again. <i>“You stay here and focus on me for now.”</i>");
	output("\n\n<i>“Nnnnh,”</i> Amber groans lustily.");
	output("\n\n<i>“Oh man, her balls are so big,”</i> Anno murmurs, rubbing two of the melon-sized endowments with her hands.");
	output("\n\n<i>“Isn’t it great?”</i> you say over Amber’s moans, grinning while you press yourself against her chest and rub her dainty back. <i>“She cums enough to fill up a few empty paintbuckets. Probably thicker than the original contents, too!”</i>");
	output("\n\n<i>“Even if I wasn’t already invested, you do a really good job of selling this, Steele,”</i> Anno replies before leaning in with her tongue stuck out.");
	output("\n\n<i>“Hear that, girl?”</i> you whisper to Amber, her freckled face flushing with color as her breath starts coming faster and harder. A familiar sight by now, but no less erotic than it’s been every time previous. <i>“We’re gonna make you repaint the entire hold with that big, fat, studly horse cock of yours.”</i>");
	if (amberDumbfuckDoses() < 3)
	{
		output("\n\n<i>“O-oh jeez,”</i> she pants, looking you in the eyes as she wobbles. <i>“You’re gonna make me sooo hard!”</i>");
		output("\n\n<i>“That’s more like it,”</i> you say to Amber, grinning at the blushing, fidgeting centauress. " + pc.mf("<i>“You’ve got both me </i>and<i> Anno here to worship that thick dick of yours, Amber. No need to be shy about it.”</i>", "<i>“You’ve got two of the prettiest women in the galaxy here ready to worship that thick dick of yours, Amber. No need to be shy about it.”</i>") + " Bringing one of your hands back, you gently squeeze one of her breasts before you tug her closer and kiss her again. <i>“You just stay <b>right</b> here and let us take care of you.”</i>");
		output("\n\n<i>“O-okay,”</i> she breathes, watching as you slip away to her rear and join Anno underneath the taur’s body.");
	}
	else output("\n\nShe responds with a loud, erotic moan and a shot of thick jizz right into the floor. The trembling ‘taur is <i>more</i> than a little worked up. The two of you have hardly started and she’s already raring to go, shaking and jerking her hips with impatient little thrusts.");
	output("\n\nAnno’s already helping herself to the huge, musky balls hanging behind Amber’s leathery sheath, grasping them while she runs her tongue between them.");
	if (amberEquilicumDoses() > 0) output(" The Equilicum really worked like a dream on her, you reflect. Now the stout, veiny organ in front of your eyes that you first familiarized yourself with back on Mhen’ga is backed up by four hulking gonads instead of the usual two, each of them big enough to put a stallion to shame. More than good enough to keep you and Anno entertained. You take the two on your side and mimic her, gently squeezing them together and running your tongue up and down the crease between them.");
	else output(" Stars, her nuts are fat -- the stout, veiny organ in front of your eyes that you first familiarized yourself with back on Mhen’ga is backed up by two hulking gonads big enough to put a stallion to shame. More than good enough to keep you and Anno entertained. You take the one on your side and mimic her, gently squeezing and running your tongue up and down the crease between them.");
	output("\n\nAmber moans like a slut, her forelegs shifting distractedly as you and your ausar pal pay her greedy worship, taking as much pleasure from the act as you’re giving. Her sex pheromones are thick and overpowering, swirling and eddying about your head and obscuring the thoughts in your mind until you find yourself wanting, needing to press your face into her gigantic nuts and suck on them. Hooves click insistently against the floor as you plant kisses on Amber’s warm, bulging balls, her breathing unsteady while thick, creamy precum begins to drip from her cockhead, droplets splattering onto the deck.");
	output("\n\nTaking one hand off her gently pulsing balls and placing it on her rock-hard cock, you see Anno has had the same idea. You touch her fingertips with your own, tenuously linking your hands over Amber’s proud, straining cock while you massage it and continue lapping at her oversized balls. It’s so long that you can’t reach the meaty head from where you’re sitting, instead relegated to stroking her pulsating shaft. Her medial ring is so fat your fingers brush against the downy fur of her underside as you pass over it, a nice reminder of all the times she’s had to desperately squeeze it inside you.");
	if (amberDumbfuckDoses() < 3) output("\n\n<i>“Oh, <b>god</b>, that’s so good,”</i> Amber groans from above you, shivering in pleasure. I- uh! I’m gonna cum really soon!”</i>");
	else if (amberDumbfuckDoses() == 3) output("\n\n<i>“Uh! <b>God!</b>”</i> Amber seethes, straining with the pleasure. <i>“Guh-gonna cum soon!”</i>");
	else output("\n\n<i>“Uh! Ooohhh! Nnnnngh-”</i> Amber strains above you, trying to take a step forward only to find her progress arrested by the ballsucking lovers at her hindlegs.\n\n<i>“She’s gonna cum,”</i> you note.");
	output("\n\n<i>“Dibs,”</i> Anno murmurs, moving forward with her eyes set on the prize: Amber’s thick, flaring cockhead as it begins to spew a neverending stream of wasted seed.");
	output("\n\n<i>“Sure you can handle her?”</i> you ask with a smirk.");
	output("\n\n<i>“Watch me,”</i> she responds.");
	output("\n\nShe lifts it to her mouth and there’s a sudden silence as the noise of heavy liquid splashing to the ground vanishes, only to be replaced by loud, deliberate swallows as Anno takes her fill of the centaur’s offerings. Amber’s trembling moans rise in volume as you start jacking her off, squeezing your fingers around her flexing length while you rub her up and down. Her massive rod jumps in your hands, threatening at any minute to burst free and paint Anno from head to toe in white.");
	output("\n\nThen, all at once, it happens. Amber utters a loud, shameless moan of release as she thrusts forward, penetrating Anno’s soft pink lips with her bestial tool. She sinks the swollen head of her cock into the ausar’s pliable throat and lets loose a stream of jizz so torrential you can see Anno’s eyes widen in surprise, her neck bulging momentarily as the immense load travels down to her stomach.");
	output("\n\nIn an instant, you’re sitting in front of Anno and kissing her - but not on her lips, stretched oh-so-wide around a fat cock. You put your mouth on her throat and gently suck, sharing in the warmth of Amber’s outpouring of thick spunk. It ebbs and flows, each mouth-watering load working its way down her throbbing shaft before being it gushes into Anno’s quivering throat, flare flexing at the entrance. You get more than enough time to gently kiss, lap, and suckle at the protrusions slowly sliding into her tummy as Anno reaches out for you, hands blindly patting at your shoulders before they gently embrace your head. She uses what little control she has over the situation to crane her head upwards, exposing even more of her tanned neck to you while she hugs you closer.");
	output("\n\nAmber finally pulls back a minute later with a contented groan and a wet, sloppy pop as the head of her stallion dick comes free of Anno’s oral confines. A slurry of saliva and spunk follows her exit, slopping down Anno’s appreciably swollen front before she leans forward as gracefully as she can and lets the rest run free, tail wagging furiously.");
	output("\n\n<i>“Oh! My god,”</i> Anno gasps, wiping her mouth with the back of her hand. <i>“I came a little just swallowing it all. Oh.”</i>");
	output("\n\n<i>“<b>You</b> are gonna be full for days,”</i> you tell her, turning from her to Amber’s hanging studcock, <i>“and <b>I’m</b> gonna give Amber the cleanup she deserves.”</i>");
	output("\n\n<i>“O-oh!”</i> Amber cries out as you secure your plump lips around her flare, earning a protein-rich squirt of cum into your cheeks. " + (amberDumbfuckDoses() < 4 ? "<i>“Sensitive! Nnnh!”</i>" : "<i>“Uh! Nnnnnh!”</i>"));
	output("\n\nShe moans, pants and whimpers as you prep her for another round, equine seed trickling from the corners of your mouth. As virile as she is, it doesn’t take long. She’s sporting an angry, throbbing erection within thirty seconds of roughly jacking her dick between your lips and suckling the head. You pull her back out and see her looking down, watching you between her shaking front legs. A wink and a smile and then you’re lying down in front of her, on your back and propped up by your elbows. You slowly spread your [pc.legs], all but inviting her in.");
	output("\n\n" + (pc.hasVagina() ? "<i>“Come on, Amber. You’re gonna need to blow at <b>least</b> one load in each of our pussies before we let you go,”</i>" : "<i>“Come on, Amber. You’re gonna need to blow at <b>least</b> one load in each of our assholes before we let you go,”</i>") + " you murmur, <i>“and since I’m the captain here, you blow in me first.”</i>");
	output("\n\n<i>“Just gives me more time to get acquainted with that sweet little marepuss of hers,”</i> Anno sing-songs, scooting around the wavering dryad’s hindlegs. <i>“C’mon, Amber. Give it to our good captain nice and hard!”</i>");
	output("\n\nAmber looks to you lying in front of her with");
	if (!pc.isCrotchExposed()) output(" your [pc.lowerGarments] pulled down and");
	output(" your " + (vagIdx < 0 ? "[pc.asshole] exposed" : "[pc.pussy " + vagIdx + "] exposed and glistening") + ", then to the tail-wagging ausar behind her wearing a wolfish grin, then back to you as you pat your " + (vagIdx < 0 ? "asscheek" : "pussylips") + " with a confident grin. The uncertainty vanishes from her face as she shuffles forward and leans down, lowering her forelegs until her prodigious flare pokes at your " + (vagIdx < 0 ? "ring while you let out a low groan" : "slit while you let out a cute moan") + ". Reaching down to grip her cock, you guide her downwards until the head catches on your entrance and she begins to push forward.");
	output("\n\n<i>“Nnngh!”</i> you grunt, biting your lip as you throw your head back. The stretching is exquisite, spreading your");
	if (vagIdx < 0)
	{
		if (pc.ass.looseness() < 3) output(" tight little hole");
		else if (pc.ass.looseness() < 5) output(" warm, welcoming ring");
		else output(" gaping fuckhole");
	}
	else
	{
		if (pc.looseness(vagIdx) < 3) output(" wet little slit");
		else if (pc.looseness(vagIdx)) output(" hot cunt");
		else output(" slick, gaping cunt");
	}
	output(" wide around the swollen tip of her prick as she slides herself inside you. A slightly selfish part of you has to admit that seeing and feeling her just a bit pent-up and frustrated is a massive turn-on, the sight of your available " + (vagIdx < 0 ? "asshole" : "pussy") + " too much for her libidinous mind to resist.");
	output("\n\nYou get to experience the full brunt of her desperation as she thrusts herself between your " + (vagIdx < 0 ? "cheeks" : "[pc.thighs]") + ", her face twisted in pleasure disappearing as she steps over you, leaving you beneath her weighty tauric body. Grasping her forelegs, you let out a deep moan as you feel her cervine behind roll in the air, driving her cock so deeply inside that you can’t help but " + (pc.hasToes() ? "curl your toes" : "cry out") + " in bliss. You lie back and just let her fuck you, her warm, slick rod pumping between your shaking legs while Anno busies herself with Amber’s behind.");
	if (vagIdx < 0) pc.buttChange(ppAmber.cockVolume(0));
	else pc.holeChange(ppAmber.cockVolume(0), 0);
	output("\n\n<i>“Oooh, it’s so wet,”</i> Anno purrs, tracing Amber’s thick, puffy pussylips with her fingers before gently pulling them apart. Strands of arousal hang between them, slowly snapping one by one the longer Anno holds her open. <i>“Ohh, yesss...”</i>");
	output("\n\nAmber suddenly lurches forward with a surprised cry, her massive nuts pressing against your curvy ass while you instinctively arch your back. She bucks against you with a strangled moan while Anno sinks her tongue into the centauress’ pliable pink cunt, licking greedily from bottom to top. Plump and juicy, it frantically squeezes down on the intruding muscle while Amber struggles to retain her rhythm, letting out halting gasps while she jerks back and forth inside you. The situation only degenerates further when Anno sinks three fingers into Amber’s stretchy, slippery marecunt, giggling before withdrawing and putting all five back in.");
	output("\n\n<i>“Gnnnuuhh!”</i> Amber cries out, tensing up above you. <i>“Fuck! Oh, fuck!”</i>");
	output("\n\n<i>“I think she </i>liiiikes<i> iiit,”</i> Anno chirps. <i>“How ‘bout you, captain?”</i>");
	output("\n\n<i>“Uh! Nnh! Uuhn!”</i> you groan, getting plowed so forcefully you almost drag across the ground. <i>“Amber! Amber!”</i>");
	output("\n\n<i>“That’s what I like to hear,”</i> Anno says, grinning.");
	if (vagIdx < 0) output(" <i>“Here you go, Amber. Screw [pc.name]’s asshole as hard as you can!”</i>");
	else output(" <i>“Here you go, Amber. Screw that dripping pussy as hard as you can!”</i>");
	output("\n\nAnno slowly slips a closed fist into the centaur’s hot, wet snatch, ensuring that every inch up to her elbow is accepted before she begins fist-fucking Amber properly, feeling up her fat, swinging balls all the while. Suddenly you’ve got a raging beast inside of you, all pretense of passionate mating gone. Now you’re just being fucked, getting filled by a frenzied she-stallion desperate to blow her load inside you, your heels pressing into her sides while loud, wet slaps of impact resound through the cargo hold.");
	output("\n\nIt’s exactly what you were hoping for. Screaming your pleasure to the two-woman audience, you push yourself off the ground so hard it hurts. The gesture proves futile as Amber tenses up above you, bringing her weight to bear while she ensures you stick to the floor.");
	if (amberDumbfuckDoses() < 4) output("\n\n<i>“Stay down,”</i> she pants over your hoarse, slutty yowling. <i>“I’m about to- t- uuhhh-”</i>");
	else output("\n\nShe says nothing but you can feel the message she’s communicating: <i>Stay down and let me fuck you.</i>");
	output("\n\nAmber shivers and throbs inside you, a feeling that’s impossible to ignore. Each beat of her heart resounds in your nethers, accompanying the massive swelling of her thick, flared cockhead. All the warning in the world does <i>nothing</i> to prepare you for the deluge of equine spunk that jets right into your " + (vagIdx < 0 ? "guts" : "[pc.womb " + vagIdx + "]") + ". You cum on the spot, grunting and rolling your eyes, sweat-slicked body jerking and twitching as your muscles tense and force you to clench your " + (vagIdx < 0 ? "jizz-slick asshole" : "slippery cunt") + " around the contours of Amber’s gigantic, cumming horsecock.");
	if (amberDumbfuckDoses() < 4) output("\n\n<i>“Oooooohhhhhh <b>GOOOD</b>,”</i> Amber groans loudly. <i>“I can’t fucking stop!”</i>");
	else output("\n\n<i>“Ooooohhhh! Nnnnn- nnuh! Uh!”</i> Amber groans loudly. <i>“Mmmmnnnnngh!”</i>");
	output("\n\n<i>“You’re welcome,”</i> Anno sings from behind her, curling and uncurling her fist.");
	output("\n\nYour tired consciousness starts to fade to a hazy, blissful white. Wasted spunk spurts out of your flexing " + (vagIdx < 0 ? "asshole" : "cunt") + ", streams of it running down between your quivering asscheeks. You look like little more than a common whore taking a john, body contorted in pleasure and fuckhole thoroughly seeded. Even your tummy begins to swell as your cum-bloated " + (vagIdx < 0 ? "intestines eventually pump her cum inside," : (pc.isPregnant(vagIdx) ? "canal exerts pressure on it, filled to the brim but" : "womb exerts pressure on it, filled to the brim but")) + " forced to drink down everything Amber has to offer. With her flare ensuring that only a minority of her thick jizz escapes your " + (vagIdx < 0 ? "quivering ring and her widening nozzle pressed right into your stomach" : "passage and her widening nozzle pressed right up against your narrow cervix") + ", the outcome is inevitable.");
	output("\n\nYou hang in a halfway state between passing out from fatigue and pure, orgasmic ecstasy that makes you buck your hips. Amber hardly even notices, too concerned with her own rough, bestial orgasm spurred on by the teasing ausar and your own desperate spasms. She keeps you held down and cumming for upwards of a minute, emptying her");
	if (amberEquilicumDoses() > 0) output(" quartet of");
	output(" heavy balls to the last drop inside you.");
	if (amberDumbfuckDoses() < 4) output("\n\n<i>“Ooohhh... fuck,”</i> Amber mutters, wobbling as she withdraws from your abused, gaping hole. Her flare slips free of you with a wet slurp and equine cum begins to pour in a continuous stream from your fucked-out " + (vagIdx < 0 ? "ring" : "pussy") + ", pooling on the floor. <i>“A-Anno...”</i>");
	else output("\n\n<i>“Oooohhhhh... hhhnnn...”</i> Amber mutters, wobbling as she withdraws from your abused, gaping hole. Her flare slips free of you with a wet slurp and equine cum begins to pour in a continuous stream from your fucked-out " + (vagIdx < 0 ? "ring" : "pussy") + ", pooling on the floor. <i>“Mmmmm...”</i>");
	output("\n\n<i>“You done? Good,”</i> Anno says, wearing a grin as she pulls her arm free and affectionately pats Amber’s flank, <i>“‘cuz my arm was getting tired.”</i>");
	if (amberDumbfuckDoses() < 1)
	{			
		output("\n\n<i>“It felt amazing anyway,”</i> Amber admits, a little bashful. <i>“I don’t think I’ve ever cum that hard...”</i>");
		output("\n\nA moment of silence hangs in the air.");
		output("\n\n<i>“Um, Steele?”</i> Amber says nervously, bending at the hips to look down at you. <i>“Are you okay?”</i>");
		output("\n\n<i>“She’s fine,”</i> Anno assures her, snickering at your stupid face. <i>“Just a little overwhelmed. You’re kind of a big girl, Amber.”</i>");
	}
	else if (amberDumbfuckDoses() < 3)
	{
		output("\n\n<i>“Oh, that was amazing,”</i> Amber sighs, looking at Anno desirously. <i>“The way you used your fist while I was cumming... stars, I’m getting hard again just thinking about it...”</i>");
		output("\n\n<i>“Oh, reeeaally?”</i> Anno purrs, drawing closer and pressing herself up against the dryad’s bare chest.");
	}
	else if (amberDumbfuckDoses() < 4)
	{
		output("\n\n<i>“Oh, stars, that was amazing!”</i> Amber pants, licking her lips as she gazes desirously at Anno. <i>“God, my fucking cock throbbed so hard when you had your fist all the way inside me... you can do that again any time you like, Anno. Fuck, I’ll just put my hands out against the wall and <b>let</b> you. I’m getting hard all over again!”</i>");
		output("\n\n<i>“Oh, reeeaally?”</i> Anno purrs, drawing closer and pressing herself up against the dryad’s bare chest.");
	}
	else output("\n\nAmber groans, gazing desirously at Anno, who begins murmuring sexy promises as she presses herself up against the dryad’s bare chest.");
	output("\n\nYou hear " + (amberDumbfuckDoses() < 4 ? "them" : "Anno") + " talking as though you were underwater, dim and murky, " + (amberDumbfuckDoses() < 4 ? "their" : "her") + " words meaningless vibrations in your ears. After some time, though, the dialogue fades and you hear Amber begin to whimper and moan all over again, and that’s what finally delivers you back to the waking world. You open your eyes to see a smiling Anno accompanied by a big, studly horsecock, her lips planted on the side of it.");
	output("\n\n<i>“Hey, boss,”</i> she says casually, kissing Amber’s giant rod. <i>“You’re not done yet, right? Amber’s still got more to give...”</i>");
	if (amberDumbfuckDoses() < 1)
	{			
		output("\n\n<i>“Y-you want more?”</i> Amber says, eyes wide.");
		if (amberEquilicumDoses() > 0) output("\n\n<i>“You know you need it after that Equilicum,”</i> Anno reminds her.");
		else output("\n\n<i>“You know you want it,”</i> Anno says, smiling.");
		output("\n\n<i>“Well... yeah,”</i> Amber mumbles, slightly embarrassed.");
		output("\n\n<i>“No need to be shy about it, Amber,”</i> you grunt, raising yourself up on your elbows. <i>“We’re gonna be servicing you real thoroughly.”</i>");
	}
	else if (amberDumbfuckDoses() < 4) output("\n\n<i>“Oh, I was <b>really</b> hoping you’d say you wanted more,”</i> Amber says, biting her lip and looking down at you. <i>“Mmmm... come get it, [pc.name].”</i>");
	else output("\n\nAmber thrusts her enormous cockhead at you, smearing your face with her seed. She wants more, and she wants it now.");
	output("\n\nSitting up on your knees and taking care to mind your slightly swollen tummy, you put your plump lips to her cockhead and suck...");

	processTime(45);
	if (vagIdx < 0) pc.loadInAss(ppAmber);
	else pc.loadInCunt(ppAmber, vagIdx);
	pc.loadInMouth(ppAmber);
	pc.applyCumSoaked();
	pc.orgasm();
	flags["AMBER_LASTCUM"] = GetGameTimestamp();

	clearMenu();
	addButton(0, "Next", amberAndAnnoGiveYouAmbersCock, ppAmber);
}

public function amberAndAnnoGiveYouAmbersCock(ppAmber:PregnancyPlaceholder):void 
{
	clearOutput();
	amberAnnoHeader();

	output("When you and Anno finally retire to your rooms, her plans have changed -- why would she need to go out, after all, when her stomach and pussy are already pumped full of thick equine cum? You’re inclined to agree... you feel like you’ve put on a pound or two, though the carnal effort of burning calories through so much mindblowing sex probably balanced it out. You’ll have to do that again sometime soon -- Amber herself seemed thrilled at the prospect.");

	pc.loadInMouth(ppAmber);

	processTime(90);
	pc.orgasm();

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function amberAndAnnoGetFucked(cockIdx:int):void
{
	clearOutput();
	amberAnnoHeader();

	output("<i>“I’ll get the back and you can have what’s hanging between her forelegs,”</i> you say, grinning at Anno as you circle around to Amber’s tight cervine butt.");
	output("\n\n<i>“Mmm, I don’t mind that arrangement at all,”</i> Anno purrs, sinking to her knees and shuffling under Amber.");
	if (amberDumbfuckDoses() < 1) output("\n\n<i>“O-oh, gosh,”</i> Amber pants, her head turning back and forth as she looks at the both of you, stuck in place and unable to decide what to do. <i>“Um!”</i>");
	else if (amberDumbfuckDoses() < 3) output("\n\n<i>“Oh, yes,”</i> Amber pants, looking down at Anno and then back at you. <i>“Stars, I can’t wait...”</i>");
	else if (amberDumbfuckDoses() < 4) output("\n\n<i>“Please, yes!”</i> Amber pants excitedly, her hooves clinking against the floor. <i>“Fuck me! Fuck me! Fuck me!”</i>");
	else output("\n\nPanting, Amber pushes her cock against Anno’s cheek only to withdraw and press her ass into you. The message is clear: she wants to fuck, and she wants it <i>now</i>.");
	output("\n\n<i>“Relax,”</i> you murmur, squeezing her furry flank " + (cockIdx < 0 ? "as you activate your hardlight and align it with her dripping lips." : "as you align your [pc.cock " + cockIdx + "] with her dripping lips.") + " <i>“I’ve got you.”</i>");
	output("\n\nShe lets out a horny groan as you sink yourself into her juicy cunt, her hot, tight walls spreading around you and clenching down, drawing you further inside. A hiss escapes your grit teeth -- not only is she perpetually wet and needy, but her appetite is unending. You have no doubt you could keep her stood in place while you pounded her out for a day. Anno’s voice distracts you from your momentary fantasy, drawing your attention downwards.");
	if (cockIdx >= 0) pc.cockChange();
	output("\n\n<i>“Oh, [pc.name]! She looooves yooouuu,”</i> Anno teases, grinning up at you. <i>“You should see how much precum is spurting out of her cock. It’s getting all over my hands! I’d better wash her off...”</i>");
	output("\n\nShe’s silent for a few seconds before you hear the sound of wet, vigorous sucking and Amber suddenly recoils into you with a loud gasp, accidentally hilting your dick all the way to the base and screaming in lust. Grabbing her hips, you don’t let her escape from the pleasure, grinding into her ass as Anno takes her from below. The dryad’s voice comes out in sharp, halting squeaks, her fists clenched ahead of her as her hindquarters begin to buck, fucking Anno’s face while you’re treated to the cock-massage of your life.");
	output("\n\nYou grunt as you feel her cum, her swaying balls drawing taut against her fluffy underside while she lets out a deep, feral groan of excitement, pounding her cock down into Anno. Each rough, imprecise movement serves only to further titillate her on the end of your pulsing " + (cockIdx < 0 ? "hardlight" : "dick") + ", thick cum spewing from her flared head and splattering across the floor as it spurts from Anno’s nose. She’s clamping down on you so hard, vaginal muscles fluttering from front to back, you can scarcely move to fuck her.");
	output("\n\nThis won’t do. Reaching down to dig your hands into her waist, you drag yourself out and <i>slam</i> your [pc.hips] into her ass, holding her in place and wrestling her as she instinctively tries to buck against you.");
	if (pc.physique() < 30)
	{
		output(" She’s wild and surprisingly strong, and in the end you can’t keep her from leveraging her animal strength against you, freeing herself from your grip and letting out a long, loud moan as she finishes emptying her balls down Anno’s gullet.");
		output("\n\nPanting and unrestrained, she begins to fuck the hell out of you by thrusting herself backwards, her wet pussy squirting all over your groin with every impact. You’re just along for the ride but fuck if it doesn’t feel amazing having a horny deertaur pound herself out on your dick, screaming your name while she cums. Her vaginal walls are clenching around you so fiercely that each muscular spasm feels like she’s seizing your dick in a fist, trying to jack you off into her cunt.");
	}
	else if (pc.physique() < 35)
	{
		output(" You’re just strong enough to overpower her animal strength, grunting while you plow the fuck out of her tight little pussy. Amber <i>screams</i> in joy as you dominate her, her hindlegs almost coming off the ground in her fervor to fuck back into you.");
		output("\n\nPanting and whining in your grip, you feel her submissively clench around your dick, trying to milk you for your cum like Anno is milking her. You can feel her vaginal walls shivering with every " + (pc.balls > 0 ? (pc.balls > 1 ? "balls" : "ball") : "hilt") + "-deep thrust, caught in the throes of orgasm and unable to stop as long as you’re pounding her squirting cunny. You wouldn’t have it any other way.");
	}
	else
	{
		output(" You overwhelm her with your strength immediately, grunting as you plow the fuck out of her tight little pussy. Amber <i>screams</i> in blissful joy as you utterly dominate her, hindlegs coming off the ground as you lift and pound her onto your cock.");
		output("\n\nEach thrust sends her head rocking back, her chest thrust outward as she revels in your overpowering of her animal instincts. She <i>needs</i> it, needs the control, to be anchored to you so she can lose her mind and cum as hard as she can. Streams of femcum spurt from her quivering cunt, spattering against your [pc.thighs] and spilling to the floor below, joining the growing pool of her cumming cock’s spunk.");
	}
	output("\n\nWhen you finally cum it’s with " + (pc.physique() < 30 ? "a strained groan" : "a fierce roar") + ", squeezing her hips and " + (cockIdx < 0 ? "hilting yourself and grinding up into her cunt as she screams in sympathetic joy." : "pouring [pc.cum] into her womb, sheathing yourself as deep as you can in her shivering slit.") + " You can hear long, enduring splatters all across the floor of the hold as Amber nuts again and again, encouraged by Anno’s sucking and jerking.");
	output("\n\nWhen you all part it’s with sighs, gasps, and groans, the exertion of the fucking taking more from " + (pc.physique() < 30 ? "you than from Amber." : "Amber than from you.") + " You settle back as Anno stands, smiling");
	if (pc.tallness < 72) output(" down at you.");
	else if (pc.tallness == 72) output(" at you.");
	else output(" up at you.");
	output(" Her face is <i>coated</i> in streaks thick equine spunk, dripping from her chin as she licks her lips.");
	output("\n\n<i>“Looks like you had fun too,”</i> you remark, smiling.");
	output("\n\n<i>“Uh huh,”</i> she nods casually, wiping a finger along her cheek and dipping it into her mouth. <i>“Faceful of jizz and two wonderful lovers in my house. Best gift ever.”</i>");
	output("\n\nYou check on Amber, who’s still half-dazed after it all,");
	if (cockIdx < 0) output(" her cock drooling spunk.");
	else output(" her pussy and her cock both drooling spunk.");
	output("\n\n<i>“So?”</i> you ask her, smiling. <i>“More threesomes with Anno, you think?”</i>");
	if (amberDumbfuckDoses() < 2) output("\n\n<i>“Oh, god, yes,”</i> she moans, her red hair bouncing up and down with every fervent nod. <i>“You’re an amazing team.”</i>");
	else if (amberDumbfuckDoses() < 4) output("\n\n<i>“Nnnnh, <b>fuck</b> yes,”</i> she moans, squeezing her tits eagerly. <i>“Having her blowing my cock and you fucking my cunt was amazing...”</i>");
	else output("\n\nShe nods fervently, roughly squeezing her own breasts and tweaking her nipples. Even after all that, she’s still looking for more. Looks like your team efforts really paid off.");
	output("\n\n<i>“It’s that Steele Tech link!”</i> Anno declares, grinning. <i>“Fostering communication, and all that jazz.”</i>");
	output("\n\n<i>“Maybe you’re right,”</i> you reply, " + pc.mf("chuckling.", "giggling.") + " <i>“I’m going to grab a shower. I’ll see you girls later.”</i>");
	output("\n\n<i>“Bye, [pc.name]!”</i> they call out, waving as you depart. You’re gonna have to call Anno in more often...");

	var ppAmber:PregnancyPlaceholder = getDryadPregContainer();
	ppAmber.loadInCunt(pc);
	anno.loadInMouth(ppAmber);
	flags["AMBER_LASTCUM"] = GetGameTimestamp();

	processTime(60);
	pc.orgasm();

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

//Requires Amber at Dumbfucked3-4, crew content enabled, Mitzi onboard. Random event on ship.
//Moan!
//By Wsan
public function amberAndMitziFun():void
{
	clearOutput();
	showName("AMBER\nMOANING...?");
	author("Wsan");
	output("You’re " + (pc.isNaga() ? "slithering through your ship, idly considering your options":"walking through your ship, footfalls resounding in the corridor") + ", when you hear a very loud, desirous moan from the hold. It sounds a <i>lot</i> like Amber in heat.");
	clearMenu();
	addButton(0,"Investigate",investigateMitziAndAmber,undefined,"Investigate","Check out the source of the noise. Whatever Amber’s up to, you can probably help.");
	addButton(1,"Don’t",dontHelpAmber,undefined,"Don’t","Leave Amber to her own devices.");
}

//[Investigate]
//tooltip:Check out the source of the noise. Whatever Amber’s up to, you can probably help.
public function investigateMitziAndAmber():void
{
	clearOutput();
	showName("AMBER\n& MITZI");
	showBust(dryadBustDisplay(),mitziBustString(true));
	author("Wsan");
	output("You arrive in the hold to find a hell of a scene playing out before you. Amber’s leaned against a wall, panting and moaning, drool running from her hanging-open mouth. She’s flushed and sweaty, almost steaming with red-hot lust, her sex pheromones billowing wildly into the hold. She hasn’t even noticed you’re here yet, too engrossed by the lewd activity occurring between her spread and shaking hindlegs.");
	output("\n\nBehind her stands Mitzi, your <i>other</i> Dumbfucked love-whore, completely naked and standing on her tip-toes with her hand jammed in Amber’s sodden, squeezing cunt up to her wrist. Beneath the deertaur’s damp-furred flanks lies a veritable puddle of lust.");
	output("\n\n<i>“Oh, hi [pc.Master]!”</i> Mitzi says cheerfully, drawing her hand out of Amber’s mareslit to wave her fingers at you.");
	output("\n\n<i>“Gggooooohhhhh!”</i> Amber cries out, lifting her head as a thick spurt of seed gushes from her equine cock, splattering the wall in front of her with gooey white spunk. A river of phermone-laden juices spills from her slick black pussy, spilling to the ground in the wake of Mitzi’s abrupt exit. <i>“Uuuhhh...”</i>");
	output("\n\n<i>“Mitzi gave the deergirl some Soak!”</i> Mitzi continues, patting Amber’s quivering flank as though nothing were amiss. <i>“She’s tooooootally into it. See?”</i>");
	output("\n\nShe slips one finger into Amber’s hot, wet passage and presses down on the centauress’ large pink clit, earning a desperate groan and a further spreading of her legs. Her fat, heavy " + (amberEquilicumDoses() > 0 ? "cumtanks":"balls") + " draw taut against her underside as another abundant fountain of rich seed erupts from her blunted flare.");
	output("\n\n<i>“She </i>is<i> into it,”</i> you muse, experiencing some enthusiasm of your own. The sight of Amber debasing herself so utterly has");
	if(pc.isHerm()) output(" your [pc.cocks] growing hard and your [pc.pussies] dripping.");
	else if(pc.hasCock()) output(" your [pc.cocks] growing hard" + (!pc.isCrotchExposed() ? " in your [pc.crotchCoverUnder]":"") + ".");
	else if(pc.hasVagina()) output(" your [pc.pussies] dripping" + (!pc.isCrotchExposed() ? " in your [pc.crotchCoverUnder]":"") + ".");
	else output(" arousal fluttering in your stomach, nowhere to go but present all the same.");

	output("\n\n<i>“Riiight?”</i> Mitzi giggles, her enormous breasts bouncing with her mirth. <i>“Mitzi just took hers before you got here!”</i>");
	output("\n\nYou raise your eyebrows as Mitzi begins to drool from both pairs of lips, moaning in happiness as saliva spatters across her giant green teats. Her eyes dilate, and her skin flushes. She sloppily giggles, then suckles a finger, mouthing, <i>“Sthoo weeeeet!”</i> Twin rivers of girlcum slide down the insides of her glistening thighs, cueing her to grind them together. So you have two drugged-up sluts looking for nothing more than to have their sexual thirst satiated? Sounds like a fun diversion.");

	processTime(15);
	pc.changeLust(33);
	clearMenu();
	if(pc.hasCock())
	{
		if(pc.cockThatFits(amber.vaginalCapacity(0)*1.5) >= 0) addButton(0,"Fuck Amber", penisRouter,[fuckSoakAmberMitziWithOneDick,(amber.vaginalCapacity()*1.5),false,0], "Fuck One", "Fuck Amber and eat out Mitzi... then pick one at random to cum in.");
		else addDisabledButton(0,"Fuck Amber","Fuck Amber","Not even Amber can take that behemoth.")
		if(pc.cockTotal() > 1)
		{
			if(pc.cockThatFits(amber.vaginalCapacity(0)*1.5) >= 0 && pc.cockThatFits2(amber.vaginalCapacity(0)*1.5) >= 0) addButton(1,"Fuck Both", fuckSoakAmberMitziWithTwoDicks, undefined, "Fuck Both", "Fuck Amber and Mitzi at the same time!");
			else addDisabledButton(1,"Fuck Both","Fuck Both","You need two dicks small enough to wedge inside.");
		}
		else addDisabledButton(1,"Fuck Both","Fuck Both","You need two dicks for this.");
	}
	else 
	{
		addDisabledButton(0,"Fuck Amber","Fuck Amber","You need a penis for this.");
		addDisabledButton(1,"Fuck Both","Fuck Both","You need a penis for this.");
	}
	addButton(2,"Double Fist",doubleFistThoseSluts,undefined,"Double Fist","Double fist the two horny, slippery sluts.");
}

public function fuckSoakAmberMitziWithOneDick(x:int):void
{
	clearOutput();
	showName("AMBER\n& MITZI");
	showBust(dryadBustDisplay(),mitziBustString(true));
	author("Wsan");
	output("<i>“Amber. Amber!”</i> you call, catching the attention of the barely-there dryad. <i>“Sit down and I’ll get to you.”</i>");
	output("\n\nGroaning, she slumps to the floor and waits, shaky arms out against the wall to support herself.");
	output("\n\n<i>“Mitzi, you can sit on her ass,”</i> you say, ushering her over with a light spank to her butt that sets it jiggling. <i>“Facing me.”</i>");
	output("\n\n<i>“Oh, Mitzi </i>likes<i> the sound of that,”</i> she giggles, hopping up onto Amber’s hindquarters and spinning to face you. <i>“Is [pc.Master] gonna treat Mitzi all nice?”</i>");

	output("\n\n<i>“You bet,”</i> you mutter, kneeling behind Amber and grabbing her tail. The first order is giving this needy, shivering fuckbeast the dicking of her life, but you’ve always been good at multitasking. <i>“Lie back.”</i>");
	output("\n\nYou slip between Amber’s thick black lips and into her juicy cunt with ease, her hungry hole" + (pc.cocks[x].thickness() < 4 && pc.cocks[x].cType != GLOBAL.TYPE_EQUINE ? "swallowing your first few inches aided by the excess lubricant.":"stretching around your cockhead to swallow the first few inches.") + " It feels like heaven. She’s so hot, wet and welcoming to your cock, her body recognizing you have the capacity to give her exactly what she needs. Her dripping cunny tightens up on you immediately, back half weakly thrusting back in an effort to get you to dig deeper into her, to assuage the infernal itch of unfulfilled lust. It feels like a soft, silken glove wrapping around your stiffened cock, urging you further inside.");
	pc.cockChange();
	output("\n\nSo possessed by the impulse to fuck, you don’t see the need to communicate. You push Mitzi down even as you thrust into the deergirl below her, laying her out atop Amber’s furry flanks and grabbing her thick thighs. Mitzi lets out a blissful moan as you dive headfirst into her sloppy cunt, running your [pc.tongue] between her thick-lipped labia and getting a mouthful of her sexual juices for your efforts. The taste of her infuses you with a rush of sexual vigor, your cock hardening deep inside Amber’s cunt while you plow her.");
	output("\n\nYou shift your focus upwards momentarily, alighting upon Mitzi’s oversized clit and seizing the opportunity with your tongue. She responds by immediately crying out in pleasure and wrapping her shaking thighs around your head, squirting femcum all over your chin and [pc.chest] as you tongue-tie her quivering clitty.");
	output("\n\n<i>“Ooohhh, that’s </i>suuuper<i> good, [pc.Master]!”</i> Mitzi cries, ineffectually pulling you in towards her with her calves. <i>“Don’t stop now!”</i>");
	output("\n\nYou don’t even hear her. Between the breeder pheromones these two bombshells are exuding your mind is nothing but a frenzied mess of pussy-lust and slick, saucy sex. You mindlessly pound Amber’s rear, ");
	if(pc.cocks[x].cLength() < 26)
	{
		if(pc.balls > 0) output("going ball" + (pc.balls > 1 ? "s":"") + "-deep");
		else output("hilting yourself");
		output(" on every thrust");
	}
	else output("rubbing up against her eager, receptive womb with every thrust");
	output(" while you flick your tongue up and down Mitzi’s entrance. Both of them are cumming impossibly hard, Mitzi’s legs juddering around your head while a rapidly growing pool of horse jizz spreads out from Amber’s underbelly, and you’re not far from it yourself.");
	output("\n\nYou surprise the gabilani girl by suddenly switching it up and digging your tongue as far into her femcum-soaked cunt you can get it, " + (pc.hasTongueFlag(GLOBAL.FLAG_LONG) ? "unfurling it all the way to her pliant cervix and giving it an affectionate lick. Her legs immediately spring upwards as she lets out a scream of outrageous surprise and ecstasy, kicking the air as you begin to tongue-massage the entrance to her womb.":"curling it upwards and lapping at her passage’s ceiling. She responds by way of letting out a blissfully happy moan and squirting all over your face again, only motivating you further."));
	output("\n\n<i>“Gonna cum,”</i> you gasp before getting another faceful of horny goblin muff. You can hardly pick which one to blow a load in. <i>“Mmmnngh!”</i>");

	//Randomly picks Mitzi or Amber.
	if(rand(2) == 0)
	{
		output("\n\n<i>“Inside! Please!”</i> Amber screams, the first words she’s said since you walked down here. <i>“Cum in my hot little cunt!”</i>");
		output("\n\nIt’s impossible to ignore a request like that. Planting your [pc.lipsChaste] on Mitzi’s fat, juicy clit and sucking on her as hard as you can, you shove yourself");
		if(pc.cocks[0].cLength() < 26)
		{
			if(pc.balls > 0) output(" ball" + (pc.balls > 1 ? "s":"") + "-deep");
			else output(" to the hilt");
		}
		else output(" right up against Amber’s womb");
		output(" and let loose, a desperate, muffled groan escaping your mouth as [pc.cum] jets from your rock-solid cock." + (pc.cocks[x].hasFlag(GLOBAL.FLAG_FLARED) ? "She’s loving the way you’re flaring inside her if the climbing pitch of her rapturous moans are any indication, just like a broodmare should.":"") + (pc.hasKnot(x) ? " To top it all off, you can feel your [pc.knot " + x + "] pumping up to its full size while your seed bathes her depths, sealing your loads inside her desirous womb.":""));
		output("\n\nMitzi’s too distracted by the multiple breathtaking clitgasms to even notice, her eyes rolling in her silly bimbo head as you almost knock her unconscious with your oral skills. She’s an insensate wreck in the wake of your performance, allowing you to finally dislodge her from your face and place her on the ground - right in Amber’s thick, sticky pool of spent spunk. You’re sure she’ll be fucking delighted.");
		output("\n\n<i>“Fuuuck,”</i> you and Amber moan in unison, the tension in your bodies dissipating just a little.");
		output("\n\nWith a cuntful of cream she’s not quite as desperate to get fucked, though the Soak is still running its course. You can see her drooling even now as she turns to face you, her cheeks scarlet and sweaty, breath coming in pants and gasps. Her freckled breasts bounce up and down with the rhythm, nipples hard as diamonds.");
		output("\n\n<i>“Okay,”</i> you groan, climbing back to your [pc.footOrFeet]. <i>“If you still need to fuck, use Mitzi. Trust me, she’s more than happy to help.”</i>");
		output("\n\nAmber’s already taking your advice, struggling to her hooves to circle around and advance on the half-conscious gabilani, keen lust in her eyes. You give the two of them a wave as she plunges her thick, flared studcock straight into Mitzi’s primed pussy, a unified scream of pleasure accompanying you on the way back up to your shower.");
	}
	else
	{
		output("\n\n<i>“C-c-cum insuh-inside Mitzi’s p-p-pussy, [pc.Master]!”</i> Mitzi stutters, struggling through the sentence as your oral skills distract her to the point of incoherence. <i>“Creampie her stupid slut-snatch!”</i>");
		output("\n\nImpossible to ignore a request like that, and Amber’s about unconscious with pleasure at this point anyway. Grabbing the shortstack gabilani around her waist, you pull out of Amber and slam Mitzi down on your cock, " + (pc.cocks[x].cLength() < 20 ? "hilting her on your iron-hard length":"pounding almost two feet of your iron-hard length into her") + " in a single violent motion. She cums on the spot, clenching down on you so hard that the first jet of your seed into her spasming cunt paints her entire womb [pc.cumColor].");
		output("\n\nBoth of you groan in bliss as she milks you, shuddering from head to nail-painted toe while her greedy cunt forcibly extracts every iota of sperm " + (pc.balls > 0 ? "from your [pc.balls]":"you have to give") + " with vigorous contractions.");
		var cumQ:Number = pc.cumQ();
		if(cumQ < 2000) output(" Barely a drip of your essence escapes her, the goblin fuck-toy taking everything on offer and keeping it for herself.");
		else if(cumQ < 8000) output(" She looks like she’s swallowed a watermelon by the time you’re done, both hands perched on her seed-swollen stomach as she admires her form.");
		else output(" The excess of your essence gushes from her overtaxed snatch but her womb drinks in enough of you in its eagerness to be bred that she looks like she’s swallowed a fucking beach ball. She rubs her cum-inflated stomach and you think you feel her cum just once more, her own juices mixing with yours as they roll from her sodden slit.");
		output("\n\nYou pull yourself out" + (pc.hasKnot(x) ? ", [pc.knot " + x + "] briefly straining her into obscenity,":"") + " and let her fall on her jiggly ass, right in a thick pool of Amber’s spent seed. No doubt she’ll be utterly delighted when she rouses herself to what passes for consciousness among sluts of this caliber. Amber’s already beginning to awaken from her fuck-stupor as you rise to your [pc.footOrFeet], finding the effects of the Soak haven’t quite worn off... and eyeing the half-conscious gabilani between her legs.");
		output("\n\nYou hear a unified scream of pleasure, two voices entwined in carnal union, as you exit the hold and head up to your shower. Sounds like they’ve <i>both</i> found a solution to the problem.");
	}
	processTime(20);
	pc.orgasm();
	pc.applyPussyDrenched();
	mitziAndAmberPostSoakFuckMenuAndStats();
}

public function fuckSoakAmberMitziWithTwoDicks():void
{
	clearOutput();
	showName("AMBER\n& MITZI");
	showBust(dryadBustDisplay(),mitziBustString(true));
	author("Wsan");
	var x:int = pc.cockThatFits(amber.vaginalCapacity(0)*1.5);
	var y:int = pc.cockThatFits2(amber.vaginalCapacity(0)*1.5);

	output("<i>“Alright, I’ve got a solution for both of you,”</i> you say, " + (!pc.isCrotchExposed() ? "shedding your [pc.lowerGarments] to reveal":"grinning at Mitzi as she eyefucks") + " your" + (pc.cockTotal() == 2 ? " two cocks.":" two biggest cocks."));
	output("\n\n<i>“[pc.Master] is like, so smart!”</i> Mitzi gasps, mouth wide in awe as she leans over to inspect them. <i>“How about...”</i>");
	output("\n\nYou’re not even surprised when she bends over far enough to suck your [pc.cockHead " + x + "] between her plump, purple lips, looking up at you with an expression of greed.");
	output("\n\n<i>“Little slut,”</i> you murmur, planting one hand on Mitzi’s head. She’s just <i>waiting</i> for you to force her deeper with that slutty look on her face - hovering at your tip, not indulging herself just yet. <i>“Here, then!”</i>");
	output("\n\nHer eyes upturn in rapturous bliss as you slam" + (pc.cocks[x].cLength() < 25 ? " your entire length":" two feet of your cock") + " down her bulging throat and into her stomach, impaling the gurgling whore on your studly length. If she hadn’t already had hearts in her eyes you suspect they’d appear now, her expression nothing but pure, unadulterated love for the way you’re treating her.");
	output("\n\n<i>“How’s that, Mitzi? You pint-sized </i>whore<i>,”</i> you say, grinning.");
	output("\n\nHer long, dextrous tongue snakes from her mouth to slowly wrap around your " + (pc.balls > 0 && pc.cocks[x].cLength() < 25 ? "[pc.balls]":"stiff shaft") + " by way of reply, her innermost thoughts on plain display.");
	output("\n\n<i>“And don’t think I’ve forgotten about you,”</i> you mutter, seizing Amber’s white-furred flank with a hand and stretching her skin to reveal the object of your desire, the tight pink opening between those soft, rubbery black lips of her leaking marecunt. <i>“You can get some too!”</i>");
	output("\n\nHolding Mitzi in place on your first cock with a rough grip, you shamelessly thrust yourself into Amber’s welcoming pussy. The hopelessly slutty deergirl cries out in unashamed pleasure, her warmth immediately enveloping your second dick as she orgasms on the spot, sexual juices bursting from her depths to bathe your rock hard member. Then you’re slamming yourself ");
	if(pc.cocks[y].cLength() < 26) output((pc.balls > 0 ? "balls-deep":"to the hilt") + " inside her sodden cunny");
	else output("all the way up to her womb’s opening");
	output(", grunting like an animal.");
	output("\n\nThere’s no need for words between the three of you. Like a machine, you pound Amber’s behind with a relentless rhythm, your hands sunken into her fur at her hips. You’ve got her right where you want her and there’s no other place in the world she’d rather be, her screams of pleasure echoing off the walls of the hold. Mitzi is blessedly silent save for wet gurgling as she sucks you off, looking up at you for approval while she throats your shaft. You think she deserves a gift.");
	output("\n\nPausing for the scantest of seconds, you grab Mitzi and pull the gabilani slut’s mouth right off your dick, your head popping free of her saliva-filled mouth with the slurp of a whore that doesn’t want to let dinner go. She doesn’t even have time to squeak before you’ve rammed it back inside her pussy-first, " + (pc.cocks[x].cLength() >= 20 ? "thrusting into her so deeply that her stomach bulges with the size of you.":"thrusting into her hard enough to make her clench around you.") + " You can feel the submissive bimbo cumming almost immediately, juices spilling from both the fucked-full slit between her puffy lower lips and saliva from the recently vacated fuckhole between the juicy lips on her face.");
	output("\n\n<i>“Haaah,”</i> Mitzi moans, a single syllable as she looks up at you, expression burning with lust.");
	output("\n\nNow that you’ve got them both of them under control, a kind of idle curiosity occupies your mind. How many times can you make these drooling fucksluts cum before you blow your own loads deep in their pussies? It’s that thought that drives you to push Mitzi up against Amber’s ass, leaning forward as you begin to rock your [pc.hips] into the both of them with the strength of ten men. They cry out in unrestrained ecstasy in response, Mitzi arching her back and grabbing two fistfuls of the deertaur’s fur to ensure she stays in place - all the better for you to pound your fat cock into her needy cunt.");
	output("\n\nThis is it. This is what you were looking for; two completely subservient whores ready to be taken to bed at a moment’s notice, their pussies gushing and squirting around you, helpless to resist the pleasure you’re inflicting upon them. Each of them gasps, groans, and sings your praise with every breath, cumming again and again, forcefully clamping down on your cocks as they slam inside, edging ever further towards a massive orgasm. You’ve long since lost count of how many times they’ve cum at your hands - it’s been nonstop since you started ravaging them, rutting them like they’re no more than your subjects.");
	output("\n\nAmber’s thick, ridged horsecock has been violently jetting cum for minutes now, a pool of her equine seed gathering underneath her forelegs. She’s completely incapable of doing anything right now but cumming her brains out, her hindquarters stuck between instinctively thrusting forward to seek out a mate as her male half orgasms and jerking back into you when she realizes how fucking good your cock feels crammed inside her slavering pussy. Nothing comes from her mouth but high-pitched screams of pleasure and shocked groans, as if she herself can scarcely believe just how good it feels to give up everything to her master.");
	output("\n\n<i>“Here it comes,”</i> you pant, sweat running down your brow. You’ve been fucking these wanton whores like a runaway freighter and the time has come to grant them the final gift of their submission - a massive load right in each of their wombs.");
	output("\n\nYou let out a wordless, feral roar of dominance as you thrust forward and cum, " + (pc.cumQ() >= 3000 ? "the first shot filling Mitzi so violently she suffers an explosive orgasm just from the sensation of feeling herself swell with [pc.cum].":"filling each of them within seconds.") + " Not satisfied with stopping there, you withdraw and ram yourself back home with every successive jet of seed from your cockheads, feeling like your entire being is draining from you.");
	output("\n\nBy the time it finishes, you pant like you’ve run a marathon at a sprint, and you look like it too. Sweat courses down your body, and steam rises from it, your [pc.chest] heaving with each draw of breath, the two sluts below you looking even worse for wear. Amber’s fur is soaked through with a mix of all three of your fluids, her own cum still weakly spewing from the end of her throbbing cock even as you withdraw your own with a grunt.");
	output("\n\nBoth of their empty cunts drip with your seed, symbolic of their purpose, winking and flexing in your absence. Mitzi is hardly even conscious after that, so utterly used that the successive orgasms must have left her on the verge of passing out from pleasure. Even now you can see her cumming, her walls clenching around a cock that isn’t there.");
	output("\n\nRising slowly, you give Amber a light spank on her quivering butt that rouses her from her post-fuck stupor and stokes the coals of her lust once more. The Soak hasn’t worn off just yet, leaving her with some small, unfulfilled need... but she can handle that on her own. After all, you see her note as you leave the hold in search of a towel and your shower, there’s a perfectly fuckable gabilani lying next to her with her cunt gaping open and ready to accept another cock.");
	output("\n\nYou can hear muffled screams of bliss followed by loud, rhythmic thudding that persists until you turn your shower on in your room.");
	processTime(20);
	pc.orgasm();
	pc.applyPussyDrenched();
	mitziAndAmberPostSoakFuckMenuAndStats();
}
public function doubleFistThoseSluts():void
{
	clearOutput();
	showName("AMBER\n& MITZI");
	showBust(dryadBustDisplay(),mitziBustString(true));
	author("Wsan");
	output("<i>“I’ve got just enough time to handle both of you sluts at once before I get back to it,”</i> you say, grinning as you kneel behind Amber and direct Mitzi to sit atop the dryad’s flanks. <i>“Let’s make it snappy.”</i>");
	output("\n\nMitzi’ll be appreciative of a little technique and finesse, but Amber... Amber doesn’t need any of that. You don’t even bother testing the waters before you slide all five of your fingers into her slavering fuckhole, drenching your hand in her juices when she squirts in eager reciprocity, screaming in joy. It’s only when you clench your fist that her giant horsecock joins in too, stiffening up and ejaculating what must be half a gallon of thick, bubbling equine spunk in a continuous flow as you slide yourself deeper.");
	output("\n\n<i>“I didn’t forget you,”</i> you murmur to Mitzi, taking two fingers and rubbing the thick, puffy lips between her thick thighs. <i>“Spread ‘em, slut.”</i>");
	output("\n\n<i>“Oooh, it sounds so sexy when you say it, [pc.Master],”</i> Mitzi moans, leaning back against Amber for support and spreading her legs wide. <i>“Here you goooo...”</i>");
	output("\n\nYou share a smile with her as you gently spread her folds apart and slide your index and middle fingers into her juicy pussy, enjoying the way she moans and tilts her head back. You don’t even need to push at her before she’s sitting down on your hand, fucking her own slit on your fingers while you noisily fistfuck Amber’s hot, slippery marecunt behind her.");
	output("\n\n<i>“More,”</i> Mitzi moans, shuddering on your fingers. <i>“More!”</i>");
	output("\n\n<i>“You want what she’s getting?”</i> you ask with a knowing grin, nodding at Amber.");
	output("\n\n<i>“Yes! Yes!”</i> Mitzi chants enthusiastically.");
	output("\n\nOf course she does. There’s no way a shortstack slut like Mitzi could be happy with just two of your fingers. Spreading her wide enough to make her groan in bliss, you slide your fingers inside the gabilani’s tight, stretchy honeypot and push upwards, earning a pleasured groan as you begin to fingerfuck her with all your might. Even this, though, isn’t what she really needs - and you know it.");
	output("\n\nShe cums once, desperate and trembling, before you lean in and whisper your offer to her. Her eyes light up immediately, a slut’s eager nod, her hand caressing the back of your neck as you get deeper inside her. It’s amazing that each inch of her is so sensual and sexual - every inch of her pussy squeezes at you, envelops you, grips at you as if to invite you into her deepest recesses.");
	output("\n\nIt there’s that you find the sensitive entrance to her womb, running your fingers along the sides of her walls to make her legs tremble, the gabilani fuckslut’s toes curling even as she stands on them. She lets out short, gasping breaths as you push her closer and closer to the edge, never quite addressing the issue until she’s totally ready and right on the brink.");
	output("\n\n<i>“Huuuuooooh!”</i> Mitzi screams in ecstasy, arching her back as you lightly press two fingers into her and stroke with maddening gentleness. <i>“Uuuuhhhh!”</i>");
	output("\n\nHer little body shakes so violently that her juices spray in every direction, squeezed from her clenching cunt and spurting down your forearm. You can keep her dancing there as long as you want, too, owing to the fact she’s clamping down on you so tightly she can’t move or do anything but cum and scream.");
	output("\n\nBehind her Amber is in an almost identical state, brought on by the combination of cumming with both her throbbing studcock and her thick-lipped marepussy. You’re in her almost up to the elbow, ramming your flexed forearm into her stretching fuckhole with reckless abandon, treating her just the way you know she likes it. Her cock jumps and strains with every move you make, seed spurting from the flared tip with the urgency of a breeding stallion, hips bucking back and forth between the sensation of orgasm and seeking more of the same.");
	output("\n\nYou force your two sluts to almost literally dance on your palms for a stretch of several minutes, cumming their brains out several times over until little comes from their mouths but deep, lewd groans of bliss and fulfillment. Even whispers of your name fade until there’s nothing left but the rapturous euphoria of multiple orgasms at your hands, femcum squirting down your arms again and again until you deign to release them from their bonds.");
	output("\n\nMitzi slumps to the ground with legs splayed the moment you slip free, her supporting beam and reason for consciousness now absent. Amber responds in kind by letting out a deep, bestial moan that sounds almost like a moo as she cums one last time, giving the wall a fresh coat of paint. You don’t think she’s done just yet, though... not by a long shot.");
	output("\n\nYou’re walking to the shower when you hear two screams of bliss followed by loud, rhythmic thudding that fades into the noise of water coursing down your body. After all that, you’re still incredibly pent up... after this, maybe you should go back down there and see if you can catch some of Amber’s lust for yourself.");
	processTime(20);
	pc.changeLust(20);
	pc.applyPussyDrenched();
	mitziAndAmberPostSoakFuckMenuAndStats();
}

public function mitziAndAmberPostSoakFuckMenuAndStats():void
{
	//Disable Mitzi and Amber for 50m
	if(!pc.hasStatusEffect("Amber Disabled")) pc.createStatusEffect("Amber Disabled");
	pc.setStatusMinutes("Amber Disabled",60);
	if(!pc.hasStatusEffect("Mitzi Disabled")) pc.createStatusEffect("Mitzi Disabled");
	pc.setStatusMinutes("Mitzi Disabled",60);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
	IncrementFlag("MITZI_AMBER_SOAK_HELPINGS");
	flags["MITZI_AMBER_SOAK_LAST"] = GetGameTimestamp();
}

//[Don’t]
//tooltip:Leave Amber to her own devices.
public function dontHelpAmber():void
{
	clearOutput();
	showName("\nNAH...");
	author("Wsan");
	output("Whatever her problem is - and you think you can probably guess - it sounds like she’s well on her way to solving it herself. No need to interrupt. You think you can hear rhythmic thudding emanating from the hold not long after, but you can’t be sure - hopefully she remembers to clean up or it’s going to be like a stable during breeding season down there the next time you set foot in the hold.");
	//Disable Mitzi and Amber for 120m
	if(!pc.hasStatusEffect("Amber Disabled")) pc.createStatusEffect("Amber Disabled");
	pc.setStatusMinutes("Amber Disabled",60);
	if(!pc.hasStatusEffect("Mitzi Disabled")) pc.createStatusEffect("Mitzi Disabled");
	pc.setStatusMinutes("Mitzi Disabled",60);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function amberCeliseHeader():void
{
	author("Wsan");
	showName("AMBER\n& CELISE");
	showBust(dryadBustDisplay(), celiseBustDisplay());
}

public function amberCeliseThreesomeGo():void
{
	clearMenu();
	clearOutput();
	amberCeliseHeader();
	processTime(2);

	if (flags["AMBER_CELISE_THREESOMES"] != undefined)
	{
		output("<i>“I was gonna go down and see Amber again, the deergirl you met in the hold last time. You liked her, right?”</i> you ask.");
		output("\n\n<i>“Oh, her!”</i> Celise says, brightening up. <i>“I’ve been visiting her every once in a while, she’s always so pent-up and yummy!”</i>");
		output("\n\n<i>“Time to drink another fill of her, then,”</i> you tell her, starting down the ramp as Celise eagerly follows behind.");
	}
	else
	{
		output("<i>“Well, I was just on my way down to the hold. Why don’t you come with? There’s someone I want you to meet,”</i> you tell her, nodding at the ramp down. <i>“I’m pretty sure she’ll be thrilled to see you.”</i>");
		output("\n\n<i>“Oh, okay!”</i> Celise cheers, joining you at your side. <i>“I love meeting new people. So who’s the girl? Is she new? Is she cute?”</i>");
		output("\n\n<i>“You’ll see in a moment...”</i> you say, stepping down the ramp as Celise follows behind, peppering you with curious questions.");
	}

	flags["AM_CEL_SKIP"] = undefined;

	addButton(0, "Next", whenTheGalotianHitsYourHorsecockLikeABigHungrySlutThatsAThreesome)
}

public function whenTheGalotianHitsYourHorsecockLikeABigHungrySlutThatsAThreesome():void
{
	clearMenu();
	clearOutput();
	amberCeliseHeader();
	processTime(3);

	var ppAmber:PregnancyPlaceholder = getDryadPregContainer();

	if (flags["AMBER_CELISE_THREESOMES"] == undefined)
	{
		switch (amberDumbfuckDoses())
		{
			case 0:
				output("<i>“Oh, hey [pc.name]!”</i> Amber calls, spotting your entrance. <i>“What are y- oh, hello!”</i>");
				output("\n\n<i>“Hi!”</i> chirps Celise, smiling happily. <i>“You look new! And cute! And-”</i>");
				output("\n\nCelise’s eyes drop to Amber’s enormous horsecock, hanging between her spindly furred forelegs. The galotian gal’s eyes widen, her mouth dropping open slightly before she turns to you.");
				output("\n\n<i>“I’m gonna go say hi,”</i> she says simply, and you nod.");
				output("\n\nCelise immediately crashes to the floor as Amber looks on in surprise, the googirl slithering forward and forming two arms to tightly grip the deertaur’s legs.");
				break;
			case 1:
				output("<i>“Hiya, [pc.name]!”</i> Amber calls, trotting over in her eagerness to see you. <i>“Oh! You’ve brought a friend, hi! Here to join the fun?”</i>");
				output("\n\n<i>“The fun?”</i> Celise considers. <i>“Well-”</i>");
				output("\n\nCelise’s eyes drop to Amber’s enormous swaying horsecock, hanging between her spindly furred forelegs. The galotian gal’s eyes widen, her mouth dropping open slightly before she gets down on her knees and grabs Amber’s spindly furred forelegs.");
				break;
			case 2: case 3:
				output("<i>“Hiya, [pc.name]!”</i> Amber calls, trotting over in her eagerness to see you. <i>“Oh! You’ve brought a friend, hi! Wanna fuck me too?”</i>");
				output("\n\nCelise wordlessly drops her eyes to Amber’s enormous swaying horsecock, hanging between her spindly furred forelegs and drooling cum. The galotian gal’s eyes widen, her mouth dropping open slightly before she gets down on her knees and grabs Amber’s spindly furred forelegs.");
				break;
			case 4: default:
				output("<i>“[pc.name]!”</i> Amber cries in happiness, springing over to you before she spots Celise and raises her eyebrows, her thick, veiny cock stiffening.");
				output("\n\nCelise doesn’t hesitate for a second. She drops to her knees and greets the deergirl the best way she knows how, with a wide open mouth and lusty eyes as she grabs Amber’s spindly furred forelegs for leverage.");
				break;
		}

		output("\n\n<i>“Enjoy,”</i> you say to Amber with a grin, arms crossed.");
		output("\n\n<i>“Wh-uuooohhhhgod,”</i> Amber groans, her knees quaking as Celise’s puffy, pouty lips wrap around the head of her cock with immaculate tightness. <i>“Ooohhh, goood!”</i>");
		output("\n\n<i>“Celise is a galotian,”</i> you say, walking around the head-bobbing slimegirl while she sucks on Amber with a voracious hunger. <i>“They’re pretty ubiquitous galaxy-wide, but I suppose you might not have met one before. They live on protein, so...”</i> You smile, leaning in as Amber turns her head towards you, flushed and panting already. <i>“She’s going to <b>love</b> you, Amber.”</i>");
	}
	else
	{
		output("<i>“Hey Amber,”</i> you call out, the ‘taur spinning around to greet you. <i>“I brought a friend.”</i>");
		output("\n\n<i>“Ooh! O-oh,”</i> Amber gasps as Celise immediately lurches forward, wrapping her puffy lips around the head of the dryad’s thick equine cock by way of greeting. <i>“Oh, fuck, yes!”</i>");
		output("\n\n<i>“Thought you’d see it that way,”</i> you note, leaning in.");
	}

	output("\n\n<i>“Nnn-hmmnn,”</i> Amber sighs as you kiss her, the surprise and tenseness melting away from her body until there’s only her lips and tongue while her hips roll with the ease of practice. <i>“Mm! Mm!”</i>");
	output("\n\n<i>“She’s very enthusiastic,”</i> you murmur to the deergirl as her eyes go wide, staring at you. <i>“Don’t be too surprised when she tries her hardest to earn that protein of yours...”</i>");
	output("\n\n<i>“Ggghh- uh! Cumming! Cumming!”</i> Amber suddenly grunts, her brow creased in effort. <i>“Uuugh!”</i>");
	output("\n\nYou glance down to see thick white sperm <i>jet</i> into Celise’s jiggling form, a misty cloud permeating her core and spreading further by the second as the throbbing horsecock between her lips pulses again and again. Amber groans loudly, a sound of desperate, animalistic need and release. She doesn’t even need to work her shuddering hips -- Celise is more than happy to suck every last sweet, delicious surge of cum straight from her jiggling");
	if (amberEquilicumDoses() > 0) output(" quartet of overproductive");
	output(" balls.");
	output("\n\nCelise only barely keeps abreast of Amber’s incredible, jizz-spurting climax, greedily drinking it all in and looking for more. As you know well yourself, when it comes to Amber, there’s <i>always</i> more if you want it. A low, deep moan slips from the deertaur’s throat, her head dipping as she at last gives in, spreading her legs and submitting to the galotian. She knows Celise isn’t going to stop until she gets everything she wants, and now she’s prepared to give it to her. You could help her along...");

	if (pc.cockThatFits(ppAmber.vaginalCapacity()) < 0 && !pc.hasHardLightAvailable()) addDisabledButton(0, "Fuck", "Fuck", "Requires fitting dick or hardlight.");
	else addButton(0, "Fuck", penisRouter, [amberGetsGooSuckedAndHardFucked, ppAmber.vaginalCapacity(), true, 0], "Fuck", "Fuck Amber’s dripping cunt while Celise drains her to the last drop.");
	addButton(1, "Fist", amberAndTheFistOfTheGooStar, undefined, "Fist", "Slide your fist into Amber’s tight little body as Celise drinks her fill.");
	addButton(2, "Watch", amberAndCelisePutOnAShow, undefined, "Watch", "Just watch the two of them rut like beasts.");
}

public function amberGetsGooSuckedAndHardFucked(cockIdx:int):void
{
	clearMenu();
	clearOutput();
	amberCeliseHeader();
	processTime(30);

	var ppAmber:PregnancyPlaceholder = getDryadPregContainer();

	output("You wordlessly walk around to Amber’s shivering, dripping rear. She’s so incredibly wet you’re not even going to need the foreplay -- she’s more than halfway to cumming again as it is. Her inflamed pussylips grip at your [pc.cockOrHardlight " + cockIdx + "] the moment you rub it against them, trying to greedily pull you in to sustain her lust, and you don’t see a reason to disagree.");
	if (cockIdx < 0) output(" You slip the sensitive, swollen head of the dildo in and moan in pleasure, the dryad’s walls immediately clamping down on you and intimately massaging the tip.");
	else output(" You slip your [pc.cockHead " + cockIdx + "] in and grunt in pleasure, the dryad’s walls immediately clamping down on you and intimately massaging your sensitive tip.");
	if (cockIdx >= 0) pc.cockChange();
	output("\n\nYou’ve only just started and Amber is <i>this</i> close to squirting all over you thanks to Celise’s ongoing efforts, juices trickling from her soft, squeezing pussy. Sliding yourself in slowly, you feel the deertaur tense up and clench around you, shuddering violently until she can’t hold it in a second longer. With a great, gasping moan, Amber orgasms so violently femcum spatters your");
	if (pc.isTaur()) output(" hindlegs");
	else output(" [pc.thighs]");
	output(" before dripping to the ground.");
	output("\n\n<i>“Ggguh- god, fuck, [pc.name]!”</i> Amber pants, her breath coming hard and fast as she’s assailed from behind and below, her legs struggling to maintain grip on the floor. <i>“Nnnh- hhgh!”</i>");
	output("\n\n<i>“Relax,”</i> you murmur, running your hands through the lush fur of her flanks before taking a tight grip.");
	if (amberDumbfuckDoses() < 4)
	{
		output("\n\n<i>“Y-you tr-try fucking relaxing like- uh! Like this!”</i> she half-whines, half-moans. Even now you can feel the motion of her body as she tenses up and lets out a gigantic load right into Celise’s waiting maw.");
		output("\n\n<i>“Fair point,”</i> you reply, grinning while you squeeze her ass.");
	}
	output("\n\nHolding her in place, you grind your [pc.hips] into Amber’s bouncing butt until you’re hilted and she’s crying out in bliss, trying to thrust back into you but finding herself arrested by Celise’s neediness. You bring it to her instead, roughly drawing back and slamming yourself home into her hot, wet canal as she grips you from every direction. She begins to cry out every time you sheath yourself inside her velvet caress, softly at first then louder and louder until she’s screaming your name in ecstasy.");
	output("\n\n<i>“Oh, god! Harder! <b>Harder!</b>”</i> Amber howls, shuddering from top to bottom. <i>“Uh! Nh! [pc.name]!”</i>");
	output("\n\nYou grunt as Amber’s rocked by yet another massive orgasm, wringing your pulsing cock with her warm, slippery folds like she’s trying to milk you. Rather than halt you instead step it up, slamming into her so hard the impacts of [pc.skinFurScales] against fur begin to dully resound in the hold. Glancing downwards, you’re pretty sure her enormous, quaking balls are swelling even <i>further</i> -- did Celise slip herself inside?");
	output("\n\nThe way Amber seems to be stuck in a neverending back-and-forth orgasm between you pounding her pussy and Celise milking her throbbing equine cock all but confirms it, her nuts swaying forcefully every time your groin smacks against her tight little ass. Her puffy asshole winks at you, sweat running down her backside, until you slip your thumb inside and she gasps, holding her breath for one -- two -- three -- seconds, then lets it all out as the size of her bulging nuts noticeably shrinks, semen surging from her cock only to be swallowed down by Celise before it can even escape her pulsating flare. Amber <i>screams</i> in delight as you work her over, filling her suckling galotian with jet after jet of thick centaur cum.");
	output("\n\nYou pound and pound her until her forelegs get away from her and she slips down onto her knees, panting and gasping wildly while you ravage her squirting cunt. Drawing ever closer to your orgasm, the sound of Amber desperately begging you to");
	if (cockIdx < 0) output(" let her feel you cum");
	else output(" cum inside her");
	output(" fills your ears until you can hear nothing else, and finally you can’t resist.");
	output("\n\n<i>“Amber!”</i> you grunt, sinking your fingers white-knuckled into the fur of her hindquarters.");
	output("\n\n<i>“Oh, god! [pc.name]!”</i> she squeals in pleasure, pushing herself backwards into you. <i>“Nnnnffh!”</i>");

	if (cockIdx < 0) output("\n\nYou cum impossibly hard, your shaft throbbing as you’re sympathetically squeezed dry by the orgasming dryad’s pussy walls. Amber cries out in delight like she can feel every single pulse, and the longer your orgasm goes the louder she gets. By the time you’re finished with her she’s explosively cum Celise all over the floor, splattering the googirl into disparate puddles that slowly reform while Amber pants deliriously, chest heaving and sweaty with the effort of it all. She rolls over onto her side and smiles back at you, dazed and red-faced.");
	else
	{
		output("\n\nYou cum inside her impossibly hard, your shaft throbbing as you’re sympathetically squeezed dry by the orgasming dryad’s pussy walls, [pc.cum] spurting into her womb and filling it with your essence. Amber cries out in delight like she can feel every drop of it, and the more you cum the louder she gets.");
		var cumQ:Number = pc.cumQ();
		if (cumQ < 5000) output("\n\nBy the time you’re finished with her she’s explosively cum Celise all over the floor, splattering the googirl into disparate puddles that slowly reform while Amber pants deliriously, chest heaving and sweaty with the effort of it all. She rolls over onto her side and smiles back at you, dazed and red-faced.");
		else if (cumQ < 10000) output("\n\nBy the time you’re finished with her Amber’s belly has swollen with the sheer weight of your seed, rounding her form out and ensuring she looks to be in the early stages of pregnancy. She explosively cums Celise from the end of her flexing flare, grunting in bliss as pools of googirl spurt across the floor and slowly begin to reform. She rolls onto her side panting deliriously, exhausted from the effort of it all, and gives you a dazed, red-faced smile.");
		else output("\n\nBy the time you’re finished with her Amber’s belly is absurdly swollen, gallons of your roiling spunk rounding her form out and giving her the appearance of a woman heavily pregnant. She explosively cums Celise from the end of her flexing flare, grunting in bliss as pools of googirl spurt across the floor and slowly begin to reform. She rolls onto her side panting deliriously, exhausted from the effort of it all, and gives you a dazed, red-faced smile.");

		ppAmber.loadInCunt(pc);
	}

	if (amberDumbfuckDoses() < 1)
	{
		output("\n\n<i>“That was <b>amazing</b>,”</i> Amber purrs, hooding her eyes dreamily. <i>“Nnnmm...”</i>");
		output("\n\n<i>“Guess I’ll bring her down more often, then,”</i> you say, grinning.");
		output("\n\n<i>“As long as you’re coming with,”</i> she replies, sighing happily and spreading her arms out. <i>“Aah, I’m about ready to fall asleep here...”</i>");
		output("\n\n<i>“I’ll leave you to it, then -- not like there’s any cleanup to be done,”</i> you say, nodding at Celise. <i>“She’s nice, right?”</i>");
		output("\n\n<i>“Uh huh,”</i> Amber mumbles. <i>“Bring her back... soon...”</i>");
	}
	else if (amberDumbfuckDoses() < 4)
	{
		output("\n\n<i>“<b>God</b>,”</i> she moans, her lips curling upwards. <i>“You fuck like an animal, [pc.name].”</i>");
		output("\n\n<i>“One of my better traits,”</i> you quip, nodding at Celise. <i>“You want me to bring her back so we can do this again sometime?”</i>");
		output("\n\n<i>“Oh, fuck yes,”</i> she replies, sighing and laying back. <i>“Between the two of you, you’ve about fucked me to bed over here...”</i>");
		output("\n\n<i>“I’ll let you get some beauty sleep in so you’re in top shape to get slammed the next time, then,”</i> you say, stretching out. <i>“See you soon, Amber.”</i>");
		output("\n\n<i>“Byeee,”</i> she calls, waving after you. <i>“Plow me soon, [pc.name]!”</i>");
	}
	else
	{
		output("\n\n<i>“Love you, [pc.name],”</i> she sighs, lying back and spreading her arms in fulfillment. <i>“Mmm...”</i>");
		output("\n\n<i>“Glad to hear it,”</i> you say, grinning. <i>“I’ll bring Celise back down here sometime so we can fuck like that again, okay?”</i>");
		output("\n\n<i>“Uh huh,”</i> Amber says dreamily, eyes fluttering. <i>“Bye, [pc.name]...”</i>");
	}

	output("\n\nYou guide a very satisfied, giggly Celise back up into the ship and let her loose, watching her slip into the network of pipes and drains. She’s definitely keeping the place cleaner than it would be otherwise, that’s for sure. Especially when it comes to certain very messy ‘taurs cooped up -- and <i>pent</i> up -- in your hold.");

	IncrementFlag("AMBER_CELISE_THREESOMES");
	pc.orgasm();
	celise.orgasm();
	celise.loadInMouth(ppAmber);
	flags["AMBER_LASTCUM"] = GetGameTimestamp();

	addButton(0, "Next", mainGameMenu);
}

public function amberAndTheFistOfTheGooStar():void
{
	clearMenu();
	clearOutput();
	amberCeliseHeader();
	processTime(30);

	var ppAmber:PregnancyPlaceholder = getDryadPregContainer();

	output("You step around to Amber’s rear and rub her haunches while she whimpers needily, her pussy winking and dripping with juices. Held in the galotian’s demanding grip it’s all she can do to stop herself from outright crying with lustful desire, her body taut and flexing thanks to Celise’s loving ministrations. She lets out a loving moan and glances back as your fingertips brush against her inflamed pussylips, shivering with pleasure and clearly hoping you’re going to do that a second time.");
	output("\n\nYou delight her by sliding your fingers into her wet, squeezing pussy one by one, stretching her clenching pussy wide around your hand as you slowly drive them deeper. She groans in utter bliss, arching her back and cumming into Celise so hard you can see the googirl’s shimmering skin momentarily discolored white. You flex your arm and sink yourself into Amber’s juicy cunt almost to the elbow, eliciting a long, drawn-out moan of whorish ecstasy. She’s loving this.");
	output("\n\nYou can’t help but wonder how she’s going to feel about being overloaded with the dual sensations of separate orgasms crashing into her mind at once in a few minutes, but that’s really her problem -- and besides, the way she’s desperately trying to push back into you is a sure indicator of the love she’s feeling right now. You’re only too happy to feed into it, clenching your fist and slowly driving into her shuddering slit until you’ve got it stretched so wide she could take a hyperporn star.");
	output("\n\n<i>“Fuh- fuh-hhck,”</i> Amber grunts, her entire body tightening up around you. <i>“Uh! Fff! Uck! [pc.name]!”</i>");
	output("\n\nYou just grin as she starts to cum all over again, noting less and less of Celise is visible. Classic galotian -- she’s starting to slip <i>inside</i> Amber’s pulsing cumvein, seeking out the source. As the horny dryad’s ejaculations are suddenly stoppered she begins to grunt and groan, straining to cum and getting none of the satisfaction of letting it all out. Soon her enormous balls are bulging with extra weight, swinging back and forth as you pump your fist into her and Celise sucks seed straight from the source.");
	output("\n\n<i>“Ohgodohgod,”</i> Amber pants, thrusting her hips wildly. <i>“Nghngghhn! Cumming! Cumming!”</i>");
	output("\n\nBut nothing happens, her gargantuan flare flexing wildly as her entire cock stiffens up and thrums in orgasm from base to tip, a desperate moan escaping the taurgirl’s lips. She thrusts and thrusts, her oversized nuts swinging wildly while you flex your arm inside her. Soon she’s gasping and twisting, trying as hard as she can to just let it all go and cum.");
	output("\n\nYou give her the edge she needs by slipping just a few inches deeper and rubbing your arm inside her. With a loud, desperate cry her forelegs slip out from under her and she falls to her knees. Her gigantic cock throbs once, twice, and suddenly galotian goo is splattering the floor of the hold as jets of it stream from Amber’s pulsating flare.");
	output("\n\nThe pleasure must be unimaginable, Amber’s hind half jerking and bucking while she cums, her voice coming out in a low, senseless growl of mindless orgasm. Pools of galotian goo spatter and spurt across the hold, slowly reforming into a singular being as Celise slides back up wearing a massive grin. Pulling your arm from Amber with a wet slurp and a gasp of pleasure from the dryad, you gently slide it into Celise’s body and let her suck you clean.");
	output("\n\n<i>“So, how was that?”</i> you say, turning back to Amber and winking.");
	if (amberDumbfuckDoses() < 1)
	{
		output("\n\n<i>“That- that was amazing,”</i> she moans, lying on her side. <i>“Oh, my god, I feel so </i>drained<i>...”</i>");
		output("\n\n<i>“Sucked you dry, huh? Lucky girl,”</i> you quip, looking at Celise jiggling as you take your hand out. <i>“I’ll bring her back down for you sometime, okay?”</i>");
		output("\n\n<i>“Uh hnh,”</i> Amber mumbles, already falling asleep post-fuck. <i>“Thanks, [pc.name]...”</i>");
		output("\n\n<i>“Byeee!”</i> Celise calls over her shoulder, waving to the sleepy ‘taur.");
	}
	else if (amberDumbfuckDoses() < 4)
	{
		output("\n\n<i>“Oh my god, bring her back soon,”</i> she moans, lying on her side. <i>“Between her and your fist I think I blacked out for a while there from cumming so hard...”</i>");
		output("\n\n<i>“I’ll be sure to bring her back down here sometime, then,”</i> you say, nodding at Celise as you take your hand out. <i>“Rest up, Amber. I’ll be back down for you soon.”</i>");
		output("\n\n<i>“Mm, you better be,”</i> she mumbles wearily. <i>“Nobody else... like... zznk...”</i>");
	}
	else
	{
		output("\n\n<i>“Nnn... more soon,”</i> Amber moans needily, stretching out on the ground. <i>“Sleep...”</i>");
		output("\n\n<i>“Take a rest, Amber,”</i> you say, slipping your hand free of Celise’s desirous grip. <i>“I’ll bring her back down sometime soon, okay?”</i>");
		output("\n\n<i>“‘Kay,”</i> she mumbles, eyes fluttering closed. <i>“Night [pc.name].”</i>");
	}

	output("\n\nYou guide a very satisfied, giggly Celise back up into the ship and let her loose, watching her slip into the network of pipes and drains. She’s definitely keeping the place cleaner than it would be otherwise, that’s for sure. Especially when it comes to certain very messy ‘taurs cooped up -- and <i>pent</i> up -- in your hold.");

	IncrementFlag("AMBER_CELISE_THREESOMES");
	pc.changeLust(pc.lustMax());
	celise.orgasm();
	celise.loadInMouth(ppAmber);
	flags["AMBER_LASTCUM"] = GetGameTimestamp();

	addButton(0, "Next", mainGameMenu);
}

public function amberAndCelisePutOnAShow():void
{
	clearMenu();
	clearOutput();
	amberCeliseHeader();
	processTime(30);

	var ppAmber:PregnancyPlaceholder = getDryadPregContainer();

	output("You want to make sure you don’t miss a second of the action. You take a seat on the floor and watch just what Celise is <i>doing</i> to the wailing, cumming deertaur, rope after rope of equine seed shooting from her flared, pulsating cockhead. The cunning googirl has Amber deep in her throat but that’s hardly where it ends.");
	output("\n\nTaking advantage of her unique biology, Celise’s made a pussy for Amber to fuck several inches inside, encouraging the dryad to desperately thrust into her in search of its grasping, clenching pleasures. Your galotian crewmate is milking Amber for everything she’s worth, stuck so deeply into her task you can feel the intensity with which she’s stroking that hulking horsecock. With her mouth now securely wrapped around the base of it and sucking hard, new inspiration strikes her as she forms new limbs to reach up and grasp Amber’s enormous, jiggling balls.");
	output("\n\nAmber whimpers in utter pleasure as the galotian takes ahold of her bulging testes, massaging and squeezing while the overproductive orbs pour an endless flow of semen into the gooey slut’s body. Her cries become louder and more strained as she pumps and pumps, grinding her hips up and down while Celise clings to her underside and blows her mind. The two of them make an amazingly sexy pair.");
	output("\n\nCelise begins gathering more and more of her bodymass around the impressively flared head of Amber’s cock, rubbing and undulating until the dryad is almost screaming in bliss and earning several more thick ropes of sperm, but it’s not enough. The wilful, desirous galotian starts slipping <i>inside</i> Amber’s cum-streaming cocknozzle, seeking out the source of her delicious sustenance. You watch transfixed as Amber’s cumvein begins to bulge with goo, more and more of Celise’s body smoothly sliding into her until the outward flow of semen has completely halted.");
	output("\n\n<i>“Oh! Oooohhhhh! Nnnngh!”</i> Amber strains, veins standing out on her thick, goo-swollen cock as she pants. <i>“C-cumming! Cumming! Cumming!”</i>");
	output("\n\nShe cries out in desperate, horny release as she cums so hard her cockhead flares to four times its usual size, her urethra spread wide, but not even a single drop escapes. Instead she screams in pleasure as she cums a second time, overlaid on the first, the cum being sucked straight from her taut balls. It’s hard to even imagine just how much pleasure Celise is forcing out of her, Amber’s eyes rolling upwards while her spunk is mindlessly harvested.");
	output("\n\nAmber’s heaving, cum-swollen balls inflate even further as the galotian finds her way to the source of her heavenly nutrition, and the dryad groans in utter bliss. You don’t know how long this mutual arrangement is going to last but for now, Amber looks like she’s off on cloud nine. Her voice becomes softer and softer until it sounds like she’s deep within the embrace of a long-known lover, crying out in intimate lust. It’s a stark contrast to the rougher milking and you can’t help but wonder if Celise is finally feeling a little more sated since they started.");
	output("\n\nNothing lasts forever, though. You watch as Amber slowly climbs higher and higher, beginning to buck her hips and moan loudly, her taxed hindquarters straining and flexing with the effort of it all. Biting down hard on her lower lip, she cums -- and cums, and cums, until at last goo begins to spurt from her throbbing cockhead until a dazed, giggling Celise is ejaculated all over the floor. Not even a single drop of spunk remains in her wake, Amber’s prick twitching weakly as the galotian immediately raises herself up and plants a wet, sloppy kiss right on her prickhole.");
	output("\n\n<i>“I think I love yooouuuu,”</i> Celise sings happily.");
	if (amberDumbfuckDoses() < 1)
	{
		output("\n\n<i>“H-holy shit,”</i> Amber moans exhaustedly, teetering on her thin cervine legs. <i>“I-I’m gonna lie down...”</i>");
		output("\n\n<i>“Good idea,”</i> you murmur");
		if (pc.hasGenitals()) output(", looking down at yourself. Maybe you should take care of this yourself, or have Celise do it once you’re out of the hold");
		output(". <i>“I’ll bring Celise around some other time.”</i>");
		output("\n\n<i>“Bye, C’lise...”</i> Amber mumbles, settling down in a heap on the floor.");
	}
	else if (amberDumbfuckDoses() < 3)
	{
		output("\n\n<i>“Holy fuuuck,”</i> Amber groans, practically collapsing at the waist before she catches herself. <i>“Does this wonderful creature have a name, [pc.name]?”</i>");
		output("\n\n<i>“I’m Celise,”</i> the galotian announces, like she’s inordinately proud of having a name. <i>“Nice to meet you!”</i>");
		output("\n\n<i>“No shit,”</i> Amber laughs wearily, eyeing the googirl with naked lust. <i>“You can come back down into the hold any time you like, Celise. I’d be <b>more</b> than happy to accommodate your needs.”</i>");
		output("\n\n<i>“I’ll bet,”</i> you say, grinning at Amber as she gives you a knowing wink.");
		output("\n\n<i>“You already know I’ve extended the same offer to you, [pc.name],”</i> she says, rolling her eyes before snickering.");
	}
	else if (amberDumbfuckDoses() < 4)
	{
		output("\n\n<i>“Oh, my god, <b>fuck</b>,”</i> Amber pants, catching herself before she slips over in exhaustion. <i>“What’s your name, you slutty little thing?”</i>");
		output("\n\n<i>“I’m Celise,”</i> the galotian announces, like she’s inordinately proud of having a name. <i>“Nice to meet you!”</i>");
		output("\n\n<i>“Celise, if I see you in the hold again, I am going to fuck you until we do that whole thing over,”</i> Amber says, grinning wide. <i>“So come back soon.”</i>");
		output("\n\n<i>“Celise is <b>always</b> on the lookout for more,”</i> you assure her, nodding at the needy googirl. <i>“Aren’t you?”</i>");
		output("\n\n<i>“Yup!”</i> Celise chirps.");
		output("\n\n<i>“Good,”</i> Amber says firmly.");
	}
	else
	{
		output("\n\n/dumbfuck4:<i>“Hhhooohhh, <b>fuck</b>,”</i> Amber spits, swaying and teetering. <i>“Nnnh...”</i>");
		output("\n\n<i>“Bet it feels good to be dry for a minute, doesn’t it?”</i> you ask her, grinning.");
		output("\n\nShe looks up and meets your gaze dreamily, her eyelids drooping. <i>“Love you, [pc.name]...”</i>");
		output("\n\n<i>“I’ll bring Celise back down for you again, okay girl?”</i> you assure her, rubbing the dryad’s furry ears as she moans. <i>“I think you’ll get along great on your own. See you soon.”</i>");
		output("\n\n<i>“Byeee,”</i> she calls out wearily, slumping to the floor in a tired heap.");
	}

	output("\n\nYou guide a very satisfied, giggly Celise back up into the ship and let her loose, watching her slip into the network of pipes and drains. She’s definitely keeping the place cleaner than it would be otherwise, that’s for sure. Especially when it comes to certain very messy ‘taurs cooped up -- and <i>pent</i> up -- in your hold.");

	IncrementFlag("AMBER_CELISE_THREESOMES");
	pc.changeLust(pc.lustMax());
	celise.orgasm();
	celise.loadInMouth(ppAmber);
	flags["AMBER_LASTCUM"] = GetGameTimestamp();

	addButton(0, "Next", mainGameMenu);
}

//[Dismiss]
//tooltip:The ship is no place for a{dumbfucked 0-2: cute, ambling deertaur./3-4: sex-crazed deergirl!} Leave her at the apartment you've got on Tavros.

public function dismissAmber():void
{
	clearOutput();
	amberHeader();
	author("Wsan");
	var haveKids:Number = ChildManager.numChildren();
	output("<i>“Hey Amber, with all the fighting and raiding going on I think you should probably stay home,”</i> you tell the deergirl. <i>“I’ve got an apartment on Tavros. It’s a lot safer there than it is here, and the facilities are top notch." + (pc.credits >= 100 ? " Here’s a chit - use this for the taxi.":"") + "”</i>");
	if(pc.credits >= 100)
	{
		output("\n\nAmber takes the chit");
		if(amberDumbfuckDoses() < 3) output(" and looks at it, crestfallen.")
		else if(amberDumbfuckDoses() == 3) output(" and moans.");
		else output(" and moans loudly.");
		pc.credits -= 100;
	}
	else 
	{
		if(amberDumbfuckDoses() < 3) output("\n\nAmber looks crestfallen.")
		else if(amberDumbfuckDoses() == 3) output("\n\nAmber moans.");
		else output("\n\nAmber moans loudly.");
	}
	if(amberDumbfuckDoses() == 0) 
	{
		output(" <i>“Aaawww... thanks, [pc.name]. But you can’t expect me to be happy that I have to leave...”</i>");
		output("\n\n<i>“If you got hurt because I decided to fight some pirates, Amber, I would never forgive myself,”</i> you say, rubbing her shoulder and smiling at her. <i>“Don’t worry, the staff there are friendly." + (haveKids > 0 ? " Then there’s the nursery, too. That should keep you occupied.":"") + "”</i>");
		if(haveKids > 0) 
		{
			output("\n\n<i>“The nursery- you have kids?”</i> she gasps, eyes gleaming. <i>“Oh my gosh! Oh, I want to play with little Steele babies! Okay, [pc.name]. You’ve convinced me.”</i>");
			output("\n\n<i>“Thought that might do the trick,”</i> you say, grinning. <i>“Okay, Amber. I’ll see you soon, okay? I’ll come and say hi or if we’re not doing anything dangerous, put you back on board.”</i>");

		}
		else
		{
			output("\n\n<i>“Well, alright, if you say so,”</i> she says, smiling uncertainly. <i>“I’ll just hope for the best.”</i>");
			output("\n\n<i>“You’ll be fine, Amber,”</i> you promise, stepping in and hugging her around the waist. <i>“It’ll be like a holiday, I promise. Okay?”</i>}");
			output("\n\n<i>“Okay,”</i> she says, smiling. She leans in and gives you a kiss, small and soft, before stepping back and giving you a wave. <i>“See you soon, [pc.name].”</i>");
			output("\n\nYou don’t think she’s quite as happy as she looks, but... it’s better than the alternative. The last thing you need is your lovable and decidedly non-combatant deer girlfriend aboard the ship during a fight.");
		}
	}
	else if(amberDumbfuckDoses() <= 2)
	{
		output(" <i>“Aaawww... now we can’t fuck whenever we want...”</i>");
		output("\n\n<i>“Better that than you getting actually hurt during a fight with some pirates,”</i> you say, smiling. <i>“Don’t worry, I’ll swing by for visits.”</i>");
		output("\n\n<i>“You’d better!”</i> Amber says, grinning as she draws closer. <i>“I’m going to be so <b>bored</b> and <b>pent-up</b> without you...”</i>");
		output("\n\n<i>“I’ll bet,”</i> you murmur, wrapping your arms around her little waist and catching her in a hug. <i>“Never let you down before though, have I?”</i>");
		output("\n\n<i>“You haven’t,”</i> she says, winking. <i>“Never once been disappointed, gotta say. But you can bet your ass I’m gonna hound you when you’re here.”</i>");
		output("\n\nYou kiss her, Amber’s lips parting to let her warm tongue wrap around your own before she pulls back with a smile.");
		output("\n\n<i>“Okay, [pc.name]. Make sure to visit often... I’m already missing your company and I haven’t even left yet!”</i> Amber says, waving. <i>“See you.”</i>");
		output("\n\n<i>“Bye, Amber. I’ll see you soon!”</i> you promise, waving her off.");
		output("\n\nYou don’t think she’s quite as happy as she looks, but... it’s better than the alternative. The last thing you need is your sexy and decidedly non-combatant deer girlfriend aboard the ship during a fight.");
	}
	else if(amberDumbfuckDoses() == 3)
	{
		output(" <i>“But now I can’t fuck you whenever I want...”</i>");
		output("\n\n<i>“We can fuck when I visit,”</i> you say, grinning. <i>“Don’t worry, I wouldn’t just leave you.”</i>");
		output("\n\n<i>“You’d better visit!”</i> Amber says, grinning as she draws closer. <i>“I’m going to be so <b>bored</b> and <b>pent-up</b> without you...”</i>");
		output("\n\n<i>“I’ll bet,”</i> you murmur, wrapping your arms around her little waist and catching her in a hug. <i>“Never let you down before though, have I?”</i>");
		output("\n\n<i>“Uh uh,”</i> she says, drawing closer with a hungry look in her eye. Hanging out of her sheath, her enormous horsecock is already drooling spunk before she wraps her arms around you and kisses you fiercely. <i>“Mmmm...”</i>");
		output("\n\nHer warm tongue winds around your own while precum spatters across the floor, her hindquarters slowly writhing as she sucks on your [pc.tongue] until she’s had her fill of foreplay. Pulling back, she takes the chit and walks past you, turning back with a sultry grin. Fully exposed and dripping, her pussy winks at you as she waves.");
		output("\n\n<i>“See you, [pc.name]. Don’t be long.”</i>");
		output("\n\nThere’s probably more on her mind that she’ll be missing than the sex, but... well, actually, maybe not. The apartment’s pretty comfortable. You’ll have to go and help her break it in properly when you’ve got the chance.");
		pc.changeLust(15);
	}
	else
	{
		output(" <i>“But the <b>sex</b>...”</i>");
		output("\n\n<i>“We can fuck when I visit,”</i> you say, grinning. <i>“Don’t worry, I wouldn’t just leave you.”</i>");
		output("\n\n<i>“Fine,”</i> Amber groans. Looking up, she begins to draw closer with a hungry look in her eyes. <i>“Kisses...”</i>");
		output("\n\nHanging out of her sheath, her enormous horsecock is already spurting spunk onto the floor as she wraps her arms around you and kisses you fiercely. <i>“Mmmm!”</i>");
		output("\n\nHer warm tongue winds around your own while her jizz splatters across the ship’s interior, her hindquarters bucking as she sucks on your [pc.tongue] until she’s had her fill. Pulling back, she walks past you, cock as hard as steel and bumping against her underbelly. Fully exposed and dripping, her pussy winks at you as she gazes back at you longingly.");
		output("\n\n<i>“Come fuck me soon,”</i> she begs, and then she’s gone.");
		output("\n\nThere’s probably more on her mind that she’ll be missing than the sex, but... well, actually, maybe not. The apartment’s pretty comfortable. You’ll have to go and help her break it in properly when you’ve got the chance.}");
		output("\n\n<b>Amber has left the crew. You can pick her back up at your apartment on Tavros.</b>");
		pc.changeLust(20);
	}
	processTime(10);
	flags["AMBER_CREWMEMBER"] = 2;
	//if(flags["CREWMEMBER_SLEEP_WITH"] == "AMBER") flags["CREWMEMBER_SLEEP_WITH"] = undefined;
	
	output("\n\n(<b>Amber is no longer on your crew. You can find her again in your suite on Tavros Station.</b>)");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Apartment shit
public function amberApartmentBonus(arg:Number):void
{
	output("\n\nThe room Amber’s taken up residence in is right over here.");
	addButton(arg,"Amber’s Room",approachRoomAmber,undefined,"Amber’s Room","Say hi to Amber.");
}

public function approachRoomAmber():void
{
	clearOutput();
	amberHeader();
	author("Wsan");
	output("You knock on the door to Amber’s room and hear the tiptap of hooves heading over, then silence before the entrance slides open and before you is ");
	if(amberDumbfuckDoses() <= 1) output("your surprised deertaur girlfriend.");
	else if(amberDumbfuckDoses() <= 3) output("your horny deertaur girlfriend, cheeks flushed and slightly sweaty.");
	else output("your Dumbfucked deertaur girlfriend, cock already hard between her legs.");

	output("\n\n<i>“[pc.name]!”</i> she cries, throwing her arms around you. <i>“Hi!”</i>");
	processTime(1);
	clearMenu();
	addButton(0,"Recruit",recruitAmberAgain,undefined,"Recruit","Take Amber onboard again.");
	addButton(1,"JustVisiting",justVisitingAmber,undefined,"Just Visiting","Just saying hi.");
}

//[Recruit]
//valid tt:Take Amber onboard again.
//invalid tt:You don’t have enough room to recruit Amber at the moment.
public function recruitAmberAgain():void
{
	clearOutput();
	amberHeader();
	author("Wsan");
	output("<i>“Hey, Amber,”</i> you say, rubbing her back. <i>“Wanna come back onboard?”</i>");
	output("\n\n<i>“Yes!”</i> she cheers, hugging you tighter. ");
	if(amberDumbfuckDoses() <= 2) 
	{
		output("<i>“Oh, yes. It’s fun enough here but I’d much rather be your side, [pc.name]. When do we leave?”</i>");
		output("\n\n<i>“Now, I guess,”</i> you say, shrugging as you pull back and smile. <i>“Welcome back, Amber.”</i>");
		output("\n\nYou walk to the ship with your arm around her waist, hooves clacking on the floor.");
	}
	else if(amberDumbfuckDoses() <= 3) 
	{
		output("<i>“When can I fuck you?”</i>");
		output("\n\n<i>“Soon as we get onboard,”</i> you say, grinning. <i>“C’mon, girl.”</i>");
		output("\n\nYou walk to the ship with Amber prancing excitedly alongside you, jiggling up and down.");
	}
	else
	{
		output("<i>“Sex! Sex!”</i>");
		output("\n\n<i>“As soon as we’re onboard,”</i> you promise, smirking. <i>“C’mon, you horny pet.”</i>");
		output("\n\nYou walk to the ship with Amber trotting beside you, casting hot glances your way as her erect cock throbs and drools spooge across the floor. The staff’ll get that...");
	}
	processTime(3);
	flags["AMBER_CREWMEMBER"] = 1;

	output("\n\n(<b>Amber has rejoined your crew!</b>)");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[JustVisiting]
//tooltip:Just saying hi.
public function justVisitingAmber():void
{
	clearOutput();
	amberHeader();
	author("Wsan");
	output("You take some time to catch up with Amber, asking her about how life’s been in the apartment.");
	if(amberDumbfuckDoses() <= 1) output(" She details all the little things that’ve kept her entertained - she seems to be doing okay. With a kiss and a hug, you explain you have to leave again and she waves you off, telling you she’ll be fine.");
	else if(amberDumbfuckDoses() <= 3) output(" Though she answers your questions, it’s clear she’s got something else on her mind - probably a hot, wet fuck at your hands. Unfortunately, you don’t have the time. With a parting kiss, you tell her you have to leave and she gives you a farewell wave before returning to her room.");
	else output(" She grinds against you with a lewd look in her eyes, your questions falling on deaf ears and horny body. Amber’s not interested in anything except a hot and hard fuck at your hands, and when you explain you have to leave again she’s devastated. Rubbing her ears and petting her head, you give her a kiss as you leave.");
	processTime(15);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Coded by: Legojohn
//have sex with amber drain her balls into your mouth
// Please note that the dose check is left open on the upper end on purpose, so that if in the future we get more doses, these checks don't get broken.
public function amberOnShipSexDrainHer():void
{
	clearOutput();
	amberHeader();
	output("<i>“How about you drain those fat balls of yours inside me,”</i> you suggest, ");
	if (!pc.isNude()) output("stripping off your [pc.clothes] and ");
	output("kneeling before her. <i>“Niiiice and thoroughly.”</i>");

	output("\n\n");
	if (amberDumbfuckDoses() >= 0 && amberDumbfuckDoses() <= 2){
		output("<i>“Oh, I’ll empty them in you alright,”</i> Amber purrs, the red-hot lust radiating off her like the heat of a star. <i>“Over, and over, and over, and over...”</i>");
	} else if (amberDumbfuckDoses() > 2){
		output("<i>“Mmmm,”</i> Amber murmurs, the red-hot lust radiating off her like the heat of a star. <i>“[pc.name]...”</i>");
	}

	output("\n\nAlready thickly erect and slick with precum, the flowering head of her equine cock presses against your [pc.lips] with a fierce insistence as if to demand you open your mouth and let Amber fuck it. She thrusts forward and you’re instantly pinned to the spot, ");
	if(pc.isMale()) output("your [pc.cocks] springing upright ");
	else if(pc.isFemale()) output("your [pc.pussies] dripping wet ");
	else if(pc.isHerm()) output("your [pc.pussies] dripping wet and your [pc.cocks] springing upright ");
	else if(pc.isSexless()) output("your [pc.nipples] hardening ");
	output("the moment she spears you on her throbbing cocktip. A pulse of pleasure runs along her swelling cumvein and rich, Amber-flavored cream fills your cheeks before you swallow it back with a shiver of delight.");

	output("\n\n");
	if (amberDumbfuckDoses() >= 0 && amberDumbfuckDoses() <= 2){
		output("<i>“Oohhh, there’s going to be <b>so</b> much more where that came from,”</i> she pants, taking a confident step forward. You let out an acquiescent gurgle as the sensitive underside of her stiff rod slides forward and her swollen head slips into your throat, robbing you of speech. <i>“Ungh! God, fuck!”</i>");
	} else if (amberDumbfuckDoses() > 2){
		output("<i>“Oohhhh yes, swallow my cum,”</i> she pants, taking a confident step forward. You let out an acquiescent gurgle as the sensitive underside of her stiff rod slides forward and her swollen head slips into your throat, robbing you of speech. <i>“Ungh! God, fuck!”</i>");
	}

	output("\n\nYou know what’s coming now, instinctively straightening out your back and neck as your [pc.tongue] squeezes between the veiny surface of her immense cock and your bottom lip to loll from your mouth. In the next second Amber coils like a spring and drives herself forward with an eager scream of joy, slamming herself balls-deep into the recesses of your dick-filled throat and unleashing a massive spurt of hot, sticky cum right into your stomach.");
	output("\n\nHer " + (amberEquilicumDoses() > 0 ? "gigantic, drug-enhanced quartet of gonads":"enormous balls") + " swing down and slap you in the chin, filling your nostrils with her outrageously irresistible musk and reminding you of just how much you love this sensation.");

	output("\n\n");
	if (flags["USED_SNAKEBYTE"] != undefined){
		output("Thanks to your SnakeByte-enhanced capability, you can’t possibly gag or choke while your throat is used as a long, warm and wet cocksheath. What you can do, though, is give Amber the oral sex of her fucking life. She <i>howls</i> in bliss as you display otherworldly control over your gullet, coiling around her and clenching down on her in concentric waves, wringing her enormous cock from base to tip over and over, holding her quaking cockhead deep in your throat and squeezing it with aplomb.");
		output("\n\n<i>“Oh my GOD, <b>STEELE!</b>”</i> Amber screams, hooves clacking furiously against the ground. <i>“FUCK! FUCK! FUCK! I’M CUMMING!”</i>");
		output("\n\nShe throws her head back and lets loose the thickest stream of cum you’ve ever drunk from her, thin hindlegs shaking in sheer pleasure while you work your throat with impossible precision to milk her warm, salty loads straight from her taut nuts. They pull up against her soft underside and strain, flexing and shifting in her sweaty sack as you watch in glee. Eruptions of fresh seed splatter down your throat and into your tummy, filling you with a flood of Amber’s essence. The orgasming deertaur strains and grunts, slowly working her hindquarters while clear arousal drools from her needy pussy to drip down her quaking balls and spatter on the floor.");
		output("\n\nYou gulp and swallow, enjoying the sympathetic pleasure of Amber’s incredible release. So sensitive is your throat that you can gauge just how large each of her flowing loads are and they are <i>massive</i>, even for her. Your red-headed lover is cumming her brains out, her thrumming cumvein swelling again and again while it delivers yet another heavy load of spooge down your slutty throat. So full of her already, you can’t help but want even more.");
		output("\n\n<i>“Guh! Haah, oh, god,”</i> Amber gasps, sagging above you as the tension drains from her body. <i>“Oh- oh, fuck,”</i> she pants, feeling your gentle, loving post-orgasm squeezing. <i>“I, I don’t even have to do anything... I could just- just stand here with my fucking cock in your throat and let you swallow it!”</i>");
	} else {
		output("You do your best not to gag and choke as Amber rears back and begins to wildly pound your face with such enthusiasm spit flies from your trembling lips, dredged back out of your throat with her forceful outstrokes. Drool runs down your chin before being splattered everywhere by the heavy impacts of her oversized nuts, battering your face and flattening your protruding tongue beneath them. Every time they swing down you bring your tongue up to run it up the sweaty gap between them, tasting her virile balls before she draws them back for another powerful thrust.");
		output("\n\n<i>“Guh! Nngh! Fuck!”</i> she gasps, legs shaking in pleasure. <i>“[pc.name]! [pc.name]!”</i>");
		output("\n\nShe’s getting closer and closer with every stallion-like thrust, uttering bestial grunts and moans of bliss while she mounts the peak of ecstasy atop you. With a scream and a savage, desperate thrust forward Amber cums at last, her gorgeous black balls slapping against your soft lips and pulling taut against her quivering underside. A stream of equine jizz so thick you don’t think you’d even be able to swallow it jets down the back of your clenching throat, splattering into your stomach and filling you with your deertaur lover’s essence.");
		output("\n\nSettling into the rhythm, you pull back gently in time with Amber and push forward when she re-hilts herself deep inside you to deposit yet another hot, heavy load of her sperm, enjoying the way she throbs and groans in outright bliss. You’re giving her the time of her life, and there’s going to be a <i>lot</i> more where that’s coming from before the two of you are done. Closing your eyes, you hollow your cheeks and suck on her big, pulsating cock as hard as you can.");
		output("\n\n<i>“Ho-o-ohhh, god,”</i> Amber groans, squeezing her hindquarters and letting out another heated blossom of seed into your insides. <i>“That- that was amazing...”</i>");
	}
	var ppAmber:PregnancyPlaceholder = getDryadPregContainer();
	pc.loadInMouth(ppAmber);

	output("\n\nYou grin around her enormous cock. Still stiff and needy, she’s obviously up to blow several more loads inside you. But where?");

	//Sex is not *actually* a time machine, so let's pass some time
	processTime(20 + rand(10));
	IncrementFlag("DRYAD_FUCKED"); //Let's agree that we have sexed Amber at this point.
	IncrementFlag("DRYAD_BLEWHER"); //Also gave her oral relieve
	pc.changeLust(100);
	clearMenu();
	addButton(0, "Throat", amberOnShipSexDrainHerInThroat, undefined, "Drain Her", "Keep her in your throat. After all, she’s already enjoying it so much.");
	addButton(1, "Ass", vaginaRouter, [amberOnShipSexDrainHerInAss, ppAmber.cockVolume(0), -1, 0], "Ass", "Let her empty her overburdened balls into your asshole.");
	addButton(2, "Pussy", vaginaRouter, [amberOnShipSexDrainHerInPussy, ppAmber.cockVolume(0), 0, 0], "Pussy", "Get the rest of her fresh, hot loads deep in your pussy"+(!pc.isPregnant() ? " and womb.":"."));
	if (!pc.hasVagina()) addDisabledButton(2, "Pussy", "Pussy", "Requires a pussy.");
}

//have sex with amber drain her balls into your mouth
public function amberOnShipSexDrainHerInThroat():void
{
	clearOutput();
	amberHeader();
	
	var ppAmber:PregnancyPlaceholder = getDryadPregContainer();
	
	output("Your hands come up to fondle her big, soft and smooth balls, cupping them with worshipful care and caressing the virile orbs with gentle circular motions, coaxing Amber into continuing.");
	output("\n\n<i>“Ohhh,”</i> Amber sighs in happiness, spreading her legs a little to allow you more room. The musk of her permeates the air, driving you wild with the desire to carry on servicing the beautiful deergirl. <i>“Keep doing that...”</i>");

	output("\n\n");
	if (flags["USED_SNAKEBYTE"] != undefined){
		output("Not one to focus on only a single thing at a time, you give Amber a comforting squeeze with your throat. When she lets out a pleasured moan you give her another, then another, and soon you’ve got your lips pressed against her soft-furred underside while your throat milks her in a long, loving undulating motion that sets her panting above you. It feels utterly wonderful to know just how good you can make her feel with your mouth, making full use of the little enhancement you gave yourself.");
		output("\n\nYou hold Amber’s enormous, throbbing studmeat in your throat and massage it, squeezing down on her sensitive cock and feeling the trickle of warm precum resume somewhere deep inside you as her overactive libido reacts to your touch. Her flare flutters and stretches in your throat, pumping back to its full size over the course of a minute of hardcore sucking and worshipping, letting out a long stream of seed into your already-swollen stomach as if to let you know she’s ready. <i>Now</i> you let her have it.");
		output("\n\nYou reach up from her nuts and grab her hind half in a hug, pulling her down into your esophagus and impaling yourself on her giant length. She gasps in surprise but catches on quickly, moaning loudly as she feels your oral attentions blessing her stupefying horsecock, all but wringing the coming orgasm out of her. Shuddering and biting back curses, she stands still and allows you to suck her from below until the impossibly pleasurable ministrations of your expert throat become too much for her to bear.");
		output("\n\n<i>“Uh! Uuuuhhhhh!”</i> Amber strains, gritting her teeth and pawing at the ground with a foreleg. <i>“Uhhh- nnnnh! NNNNNHHHHGH!”</i>");
		output("\n\nShe’s panting like a bellows as she blows a massive load into your belly, huffing and groaning at length as you milk the staggering loads from her balls. Each thick, gooey shot of Amber’s semen is accompanied by a deep moan of ecstasy, her hanging balls drawing tight once more while they softly kiss your lips. Again and again she lets out a fountain of hot spunk inside you, coating your insides with her love and crying out with the desperate, ravenous bliss only you can give her.");
		output("\n\nYou’re still hugging Amber tight when she lets out a loud moan as you <i>squeeze</i> her gargantuan cockhead, lightly teasing her oversensitive tip as it drips and dribbles sperm inside you. Between her insane need to fuck and your overwhelming desire to bring her to greater and greater peaks, you don’t see any reason to stop here. Relaxing your grip on her you sink back down to allow her to draw back and relax for a few seconds, breathing hard before you swallow her all the way to her swaying balls and she lets out a little scream of joy.");
		output("\n\n<i>“I-I l-lo-love y-you!”</i> Amber pants, her hindlegs scrabbling to find grip as you close your eyes and begin to passionately suck her off once more. <i>“[pc.name]! I love you, I love you, I love you, I love you!”</i>");
		processTime(60 * 6);
		output("\n\n<b>6 hours later</b>");
	} else {
		output("You dutifully obey, massaging your ardent lover while shivers of pleasure run through her soft-furred underside, caring for her in the way only you can. Pressing your eager mouth all the way to her leathery base you work your jaw to give her a kiss, tensing your passionate lips just enough to make her moan and shoot an early load down your throat. The <i>warmth</i> of her is intoxicating, so much so that you can’t help but speed up and paw at her a little more frantically, a touch of desperation creeping into your actions.");
		output("\n\nSoon Amber is grunting and straining above you while you swallow her from medial ring to base over and over, panting through your nose whenever you can, saliva running down your chin while your tongue lashes across her cumvein. Stars, she smells so good -- the pheromones swirling around your head are driving you onwards every bit as much as your own lust, and to give in to their urging feels even better than they promise. Your neck bulges outwards as you arch your back in pleasure, taking her to the very base and pressing your [pc.lipsChaste] up against her shaking belly.");
		output("\n\n<i>“O-oh, g-god,”</i> Amber says haltingly, repositioning her quivering legs. <i>“I’m g-gonna cum! Cumming! <b>CUMMING!</b>”</i>");
		output("\n\nShe’s panting like a bellows as she blows a massive load into your belly, huffing and groaning at length as you milk the staggering loads from her balls. Each thick, gooey shot of Amber’s semen is accompanied by a deep groan of ecstasy, her hanging balls drawing tight once more while they softly kiss your lips. Again and again she lets out a fountain of hot spunk inside you, coating your insides with her love and crying out with the desperate, ravenous bliss of an impassioned lover.");
		output("\n\nReaching up you grab her around the hips while she noisily empties herself inside you, surprising the libidinous deergirl by pulling her hindquarters downwards and keeping her as far inside you as she can get. Your wanton demonstration of just how much you need her is well-received, if the sudden renewal of gushing sperm is any indicator. Your throat bobs over and over as loads pass through it, squirting from her equine cockhead with the force of a river.");
		output("\n\nYou’re still hugging Amber tight when she lets out a loud moan of desire in response to you reaching up between her spindly hindlegs and rubbing her wet, swollen clit. Between her insane need to fuck and your overwhelming desire to bring her to greater and greater peaks, you don’t see any reason to stop here. Relaxing your grip on her you sink back down to allow her to draw back and relax for a few seconds, breathing hard before you swallow her all the way to her swaying balls and she lets out a little scream of joy.");
		output("\n\n<i>“I-I l-lo-love y-you!”</i> Amber pants, her hindlegs scrabbling to find grip as you close your eyes and begin to passionately suck her off once more. <i>“[pc.name]! I love you, I love you, I love you, I love you!”</i>");
		processTime(60 * 4);
		output("\n\n<b>4 hours later</b>");
	}

	output("\n\nYou slowly pull yourself off Amber’s spitshined cock, glistening with your spit but wholly clean of any spunk -- you’ve made sure of that. Glancing down at your stomach, you run your hand over the absurdly distended cum-bulge and wince at how taut your skin’s been pulled -- such is the price of gulping down gallons of Amber’s hot spunk, you guess.");
	output("\n\nAmber, on the other hand, is outright staring greedily at your throat, knowing she could stick her cock back in you at any time she wanted for the blowjob of her life. You smile knowingly up at her as if to promise exactly that, slowly getting to your feet before you find yourself surprised by the dryad and swept into her arms, pressed into the warmth of her body.");
	output("\n\n<i>“[pc.name],”</i> she whispers, gazing at you with heat in her eyes before they close, and suddenly you’re being inescapably kissed by the adoring deergirl. <i>“Mmmmmm-”</i>");
	output("\n\nShe sucks on your tongue with such fervor you half-wonder if she’s going to fuck you again right then and there but when she pulls back it’s to swallow your spit and pant, tongue lolling out and breath hot on your face.");
	output("\n\n<i>“God, I love you,”</i> Amber says, raising her hand to your cheek.");
	if (amberDumbfuckDoses() == 0){
		output(" <i>“Thanks, [pc.name]. I feel amazing.”</i> She smiles. <i>“And not <b>just</b> because of your blowjob skills.”</i>");
		output("\n\n<i>“I’m flattered,”</i> you reply, smiling back at her. <i>“Remember, any time you need me... I’m here for you.”</i>");
		output("\n\n<i>“I know,”</i> she murmurs, closing in for another kiss. <i>“I know.”</i>");
	} else if (amberDumbfuckDoses() > 0 && amberDumbfuckDoses() < 4){
		output(" <i>“Thanks a lot, [pc.name]. You’re the best fuck a girl could ask for.”</i>");
		output("\n\n<i>“Thank <b>you</b>,”</i> you say, smiling at her.");
		output("\n\n<i>“What’s that, [pc.name]?”</i> she murmurs, closing in for another kiss. <i>“You want more? C’mere...”</i>");
	} else if (amberDumbfuckDoses() > 3){
		output(" <i>“You’re <b>such</b> a good fuck! God, I just wanna pound your throat all day! Mmm...”</i>");
		output("\n\n<i>“We can arrange something,”</i> you reply, smiling at her.");
		output("\n\n<i>“Uh huh,”</i> she murmurs, closing in for another kiss. <i>“C’mere, hottie...”</i>");
	}
	processTime(2 + rand(3));

	flags["AMBER_LASTCUM"] = GetGameTimestamp();
	//IncrementFlag("DRYAD_BLEWHER"); I think we are going to count this as a single event.
	IncrementFlag("DRYAD_DRAINED");
	pc.orgasm();

	pc.loadInMouth(ppAmber);
	pc.maxOutCumflation("mouth", ppAmber);

	output("\n\nIt’s quite a while before you find yourself back in your room, rubbing your tummy.");

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

//have sex with amber drain her balls into your ass
public function amberOnShipSexDrainHerInAss(hole:int):void
{
	clearOutput();
	amberHeader();
	
	var ppAmber:PregnancyPlaceholder = getDryadPregContainer();
	
	output("Amber moans in pleasure and with slight disappointment as you slide off the end of her saliva-coated horsecock and let a mouthful of her sticky jizz splatter down your [pc.chest]. No doubt the air on her equine endowment is cold after being sheathed deep in the warmth of your throat, but you know exactly how to solve that.");
	if (pc.isTaur()){
		output("\n\nGetting out from under her and flashing her a brilliant smile you turn around and present yourself in all your glory, gazing back at her.");
		output("\n\n<i>“Come on, Amber,”</i> you murmur, licking your lips. <i>“D-”</i>");
		output("\n\nYou scream in pleasure and pain as she immediately mounts you, pounding her immense cock into your [pc.asshole] with such force she sinks herself to the hilt in one go. Reaching forward and grabbing your " + (pc.hasBreasts() ? "[pc.breasts]":"shoulders") + ", Amber pulls you back into a rough embrace and kisses you deep while her narrow hips begin to buck, slamming her swinging balls against your [pc.ass] with all the strength she can muster. You grunt and moan into her open mouth while she sucks on your [pc.tongue], feeling yourself stretch around her thickness.");
		
		pc.buttChange(ppAmber.cockVolume(0));
		
		output("\n\n");
		if(pc.isMale()) output("Your [pc.cockBiggest] bounces upwards as Amber works herself into your depths, brushing against your prostate hard enough to make you shiver under the rutting deergirl, sending bolts of pleasure up your spine with every thrust. Feeling the bloated head of her enormous dick rub it on the outstroke makes you feel like you’re cumming already, and you soon find yourself thrusting yourself back into her in a desperate attempt to feel that sensation again. She’s more than happy to indulge you, grinding her throbbing cock deep into your asshole and watching your eyes roll upwards with the bliss of it.");
		else if(pc.isFemale()) output("Your [pc.pussies] " + (pc.hasVaginas() ? "drip and squeeze" : "drips and squeezes") + " as Amber works herself into your depths, her heat penetrating to your core with every thrust. The bloated head of her enormous dick brushes along your sensitive insides, so large you can’t help shiver under the rutting deergirl, bolts of pleasure running up your spine with every thrust. Soon enough you find yourself thrusting back into her in need of more and she’s more than happy to indulge you, grinding her throbbing cock deep into your asshole and watching your eyes roll upwards with the bliss of it.");
		else if(pc.isHerm()) output("Your [pc.cockBiggest] bounces upwards as Amber works herself into your depths, brushing against your prostate hard enough to make you shiver under the rutting deergirl, sending bolts of pleasure up your spine with every thrust. Feeling the bloated head of her enormous dick rub it on the outstroke makes you feel like you’re cumming already, and you soon find yourself thrusting yourself back into her in a desperate attempt to feel that sensation again. She’s more than happy to indulge you, grinding her throbbing cock deep into your asshole and watching your eyes roll upwards with the bliss of it while your [pc.pussies] " + (pc.hasVaginas() ? "squeeze and drip" : "squeezes and drips"));
		else if(pc.isSexless()) output("You groan as Amber works herself into your depths, brushing against your sensitive insides enough to make you shiver under the rutting deergirl, sending bolts of pleasure up your spine with every thrust. Feeling the bloated head of her enormous dick rub you so roughly on the outstroke makes you feel like you’re climbing closer to cumming, and you soon find yourself thrusting yourself back into her in a desperate attempt to feel that sensation again. She’s more than happy to indulge you, grinding her throbbing cock deep into your asshole and watching your eyes roll upwards with the bliss of it.");

		output("\n\n<i>“Ngh! Nnh! F-fuck,”</i> Amber pants, pulling back for the barest of moments. <i>“So <b>deep!</b> Ungh!”</i>");
		if(pc.hasNipples()){
			output("\n\nThen she’s drowning out your moans with her tongue again, pressing her soft lips to yours while her hands");
			if (pc.hasBreasts()) {
				output(" squeeze and cup your shaking breasts, teasing your [pc.nipples]");
				if (pc.isLactating()) output(" until [pc.milk] begins to drip down your front");
				else output("until you cry out into her mouth");
			} else {
				output("rove over your chest, squeezing your front and rubbing your [pc.nipples]");
			}
			output(".");
		}
		output("It’s all you can do to remember to breathe through your nose while she assaults you front and rear, pounding you so hard her oversized balls clap against your jiggling ass, the she-stallion running wild with her lust.");
		output((pc.hasHooves() ? "\n\nBoth your and her hooves clack against the floor as you" : "\n\nAmber’s hooves clack on the floor as the two of you") + " jostle for position, trying your utmost best to keep her all the way inside you.");

		output("\n\nAmber doesn’t even announce that she’s going to cum. Instead the first hint you get is an explosion of satisfying warmth deep in your bowels while she strains and pushes into you, her cockhead suddenly doubling then tripling in size while a river of seed pours into your insides. Tucking her tongue back into her mouth she grits her teeth and presses forward, holding you in place and see-sawing her hindquarters to fuck you full of herself. Hot, thick seed jets into you without end, Amber’s leathery black balls drawn taut and quivering against " + (pc.hasVagina() ? "the wet heat of your empty cunt." : "your shivering backside."));

		output("\n\n<i>“Nnnnnnnhhhhhhh,”</i> Amber groans, her fingers digging into your [pc.skinFurScales]. <i>“Nngh! Grrrhh! Nnnnnhhhggh!”</i>");

		output("\n\nShe lets out so much creamy seed you can scarcely believe it, your mouth falling open as you feel your own pleasure reach a sudden, violent climax. Amber chokes as your asshole squeezes down on her ");
		if(pc.isMale()) output("and you squirt [pc.cum] all over the floor, splattering your forelegs with your own spunk. Each throb of <i>her</i> swollen dick inside you sets you off once more, her cumvein pulsing against your prostate and forcing you to ejaculate for as long as she is. Unable to stop yourself, you grunt and throw your head back over her shoulder as your back arches with the ecstasy of release.");
		else if(pc.isFemale()) output("and you cum as hard as she is, " + (pc.isSquirter() ? "hot translucent femcum squirting from your spasming cunt"+ (pc.hasVaginas() ? "s" : "") +" and coating her pulsing testes in bliss" : "hot translucent femcum dripping from your spasming cunt"+ (pc.hasVaginas() ? "s" : "") +" and running down your underside") + ". You soak your shaking hindlegs with arousal, trying to resist the sheer strength of your orgasm and failing. Unable to stop yourself, you grunt and throw your head back over her shoulder as your back arches with the ecstasy of release.");
		else if(pc.isHerm()) output("and you squirt [pc.cum] all over the floor, splattering your forelegs with your own spunk. Each throb of <i>her</i> swollen dick inside you sets you off once more, her cumvein pulsing against your prostate and forcing you to ejaculate for as long as she is. " + (pc.isSquirter() ? "Hot translucent femcum sprays from your spasming cunt"+ (pc.hasVaginas() ? "s" : "") + " and coats her pulsing testes in bliss" : "Hot translucent femcum drips from your spasming cunt"+ (pc.hasVaginas() ? "s" : "") +" and runs down your underside") + " while you soak your shaking hindlegs with arousal, trying to resist the sheer strength of your orgasm and failing. Unable to stop yourself, you grunt and throw your head back over her shoulder as your back arches with the ecstasy of release.");
		else if (pc.isSexless()) output("and you groan out loud, bliss bubbling frustratingly under the surface and never quite popping your top. Instead you thrust and clench against her, trying to get off, but nothing works. You experience Amber’s orgasm in full without ever reaching the electrifying release <i>just</i> out of your reach, feeling her beautiful cock throb and spew cum all over your insides. At least she feels amazing...");

		output("\n\n<i>“Oh,”</i> she gasps at last, pressing her sweaty breasts into your back. You can feel the hardness of her jutting nipples against you while she holds you, hugging you tight. <i>“Oh, fuck! [pc.name]!”</i>");
		output("\n\nYou feel so warm and full it’s hard not to sag back into her in a mixture of relief and exhaustion -- there’s so much more left for her to give you after your promise to completely drain her, and you can already feel her beginning to fuck you again. A stream of her seed gushes from your stretched-out asshole with Amber’s outstroke before she drives forward once more, ready to fill you up all over again.");
		output("\n\n<i>“I-I’ll go slower this time,”</i> the flushed, panting deergirl promises" + (pc.hasBreasts() ? "as she grabs your breasts." : "."));
		output("\n\nShe doesn’t.");
		processTime(60 * 4);
		output("\n\n<b>4 hours later</b>");
		output("\n\nAmber lets out a low, rumbling groan of complete and utter satisfaction as she sits atop you, arms wrapped around your waist and hugging you tight, her hindlegs pressing into your own. Your underside sags with the sheer amount of warm equine seed she’s pumped you with, looking for all the world like you’re carrying her children, and you find yourself unable to think of a better way to while away the time.");
		output("\n\n<i>“I love you, [pc.name],”</i> she murmurs, nipping your [pc.ear]. Heady pheromones swirl all around you, filling your mind with her scent. <i>“Mmn.”</i>");
		output("\n\n<i>“I-I love you too,”</i> you moan, head resting against her cheek. <i>“Oohhh...”</i>");
		output("\n\nYou both moan in chorus as she slowly pulls out, her massive cock coming free with a slurp and leaving your asshole a gaping, squirting mess. Amber’s cum spurts to the floor as you struggle to keep your hindlegs together, winking and clenching at the heated deertaur while you try to keep it all inside.");
	} else { //nontaur
		output("\n\nGetting out from under her and flashing her a brilliant smile you kneel down facing away, getting up on all fours and presenting yourself in all your glory while you gaze back at her.");
		output("\n\n<i>“Come on, Amber,”</i> you murmur, licking your lips. <i>“D-”</i>");
		output("\n\nYou scream in pleasure and pain as she immediately mounts you, pounding her immense cock into your [pc.asshole] with such force she sinks herself to the hilt in one go. Your " + (pc.hasBreasts() ? "[pc.breasts] shake":"mouth hangs open") + " as she begins to violently fuck you, her hips bucking back and forth while you grab onto her forelegs and hold on for dear life, her swinging balls clapping against your [pc.ass] with all the strength she can muster. A long, shaky groan works its way out of your mouth while Amber pounds you, her voice lilting with pleasure as you stretch around her thickness.");
		
		pc.buttChange(ppAmber.cockVolume(0));
		
		output("\n\n");
		if(pc.isMale()) output("Your [pc.cockBiggest] bounces upwards as Amber works herself into your depths, brushing against your prostate hard enough to make you shiver under the rutting deergirl, sending bolts of pleasure up your spine with every thrust. Feeling the bloated head of her enormous dick rub it on the outstroke makes you feel like you’re cumming already, and you soon find yourself thrusting yourself back into her in a desperate attempt to feel that sensation again. She’s more than happy to indulge you, grinding her throbbing cock deep into your asshole and watching your eyes roll upwards with the bliss of it.");
		else if(pc.isFemale()) output("Your [pc.pussies] " + (pc.hasVaginas() ? "drip and squeeze" : "drips and squeezes") + " as Amber works herself into your depths, her heat penetrating to your core with every thrust. The bloated head of her enormous dick brushes along your sensitive insides, so large you can’t help shiver under the rutting deergirl, bolts of pleasure running up your spine with every thrust. Soon enough you find yourself thrusting back into her in need of more and she’s more than happy to indulge you, grinding her throbbing cock deep into your asshole and watching your eyes roll upwards with the bliss of it.");
		else if(pc.isHerm()) output("Your [pc.cockBiggest] bounces upwards as Amber works herself into your depths, brushing against your prostate hard enough to make you shiver under the rutting deergirl, sending bolts of pleasure up your spine with every thrust. Feeling the bloated head of her enormous dick rub it on the outstroke makes you feel like you’re cumming already, and you soon find yourself thrusting yourself back into her in a desperate attempt to feel that sensation again. She’s more than happy to indulge you, grinding her throbbing cock deep into your asshole and watching your eyes roll upwards with the bliss of it while your [pc.pussies] " + (pc.hasVaginas() ? "squeeze and drip" : "squeezes and drips"));
		else if(pc.isSexless()) output("You groan as Amber works herself into your depths, brushing against your sensitive insides enough to make you shiver under the rutting deergirl, sending bolts of pleasure up your spine with every thrust. Feeling the bloated head of her enormous dick rub you so roughly on the outstroke makes you feel like you’re climbing closer to cumming, and you soon find yourself thrusting yourself back into her in a desperate attempt to feel that sensation again. She’s more than happy to indulge you, grinding her throbbing cock deep into your asshole and watching your eyes roll upwards with the bliss of it.");

		output("\n\n<i>“Ngh! Nnh! F-fuck,”</i> Amber pants, pulling back for the barest of moments. <i>“So <b>deep!</b> Ungh!”</i>");
		output("\n\nThen she’s drowning out your moans with the sound of sex once more, pressing down on you until she hits the right angle and your back begins to arch involuntarily. It’s all you can do to remember to breathe while she slams you full of her stiff cock, pounding you so hard you can hardly make a noise, the she-stallion running wild with her lust.");
		output((pc.hasHooves() ? "\n\nBoth your and her hooves clack against the floor as you" : "\n\nAmber’s hooves clack on the floor as the two of you") + " jostle for position, trying your utmost best to keep her all the way inside you.");

		output("\n\nAmber doesn’t even announce that she’s going to cum. Instead the first hint you get is an explosion of satisfying warmth deep in your bowels while she strains and pushes into you, her cockhead suddenly doubling then tripling in size while a river of seed pours into your insides. Tucking her tongue back into her mouth she grits her teeth and presses forward, holding you in place with her forelegs and see-sawing her hindquarters to fuck you full of herself. Hot, thick seed jets into you without end, Amber’s leathery black balls drawn taut and quivering against " + (pc.hasVagina() ? "the wet heat of your empty cunt." : "your shivering backside."));

		output("\n\n<i>“Nnnnnnnhhhhhhh,”</i> Amber groans, shaking above you like a leaf in a storm. <i>“Nngh! Grrrhh! Nnnnnhhhggh!”</i>");

		output("\n\nShe lets out so much creamy seed you can scarcely believe it, your mouth falling open as you feel your own pleasure reach a sudden, violent climax. Amber chokes as your asshole squeezes down on her ");
		if(pc.isMale()) output("and you squirt [pc.cum] all over the floor, splattering yourself with your own spunk. Each throb of <i>her</i> swollen dick inside you sets you off once more, her cumvein pulsing against your prostate and forcing you to ejaculate for as long as she is.");
		else if(pc.isFemale()) output("and you cum as hard as she is, " + (pc.isSquirter() ? "hot translucent femcum squirting from your spasming cunt"+ (pc.hasVaginas() ? "s" : "") +" and coating her pulsing testes in bliss" : "hot translucent femcum dripping from your spasming cunt"+ (pc.hasVaginas() ? "s" : "") +" and running down your underside") + ". You soak your [pc.thighs] with arousal, trying to resist the sheer strength of your orgasm and failing.");
		else if(pc.isHerm()) output("and you squirt [pc.cum] all over the floor, splattering yourself with your own spunk. Each throb of <i>her</i> swollen dick inside you sets you off once more, her cumvein pulsing against your prostate and forcing you to ejaculate for as long as she is. " + (pc.isSquirter() ? "Hot translucent femcum sprays from your spasming cunt"+ (pc.hasVaginas() ? "s" : "") + " and coats her pulsing testes in bliss" : "Hot translucent femcum drips from your spasming cunt"+ (pc.hasVaginas() ? "s" : "") +" and runs down your underside") + " while you soak your shaking [pc.legs] with arousal, trying to resist the sheer strength of your orgasm and failing."); //Replaced hindlegs, since this is the non-taur version.
		else if (pc.isSexless()) output("and you groan out loud, bliss bubbling frustratingly under the surface and never quite popping your top. Instead you thrust and clench against her, trying to get off, but nothing works. You experience Amber’s orgasm in full without ever reaching the electrifying release <i>just</i> out of your reach, feeling her beautiful cock throb and spew cum all over your insides. At least she feels amazing...");

		output("\n\n<i>“Oh,”</i> she gasps at last, relaxing slightly. You can feel the hardness of her inside you, not even close to giving up. <i>“Oh, fuck! [pc.name]!”</i>");
		output("\n\nYou feel so warm and full it’s hard not to sag back into her in a mixture of relief and exhaustion -- there’s so much more left for her to give you after your promise to completely drain her, and you can already feel her beginning to fuck you again. A stream of her seed gushes from your stretched-out asshole with Amber’s outstroke before she drives forward once more, ready to fill you up all over again.");
		output("\n\n<i>“I-I’ll go slower this time,”</i> the flushed, panting deergirl promises" + (pc.hasBreasts() ? "as your tits begin to jiggle with the force of her thrusts." : "."));
		output("\n\nShe doesn’t.");
		processTime(60 * 4);
		output("\n\n<b>4 hours later</b>");
		output("\n\nAmber lets out a low, rumbling groan of complete and utter satisfaction as she sits atop your prone form, your lower half pinned beneath her immense cock and balls. Your tummy sags with the sheer amount of warm equine seed she’s pumped you with, looking for all the world like you’re carrying her children, and you find yourself unable to think of a better way to while away the time.");
		output("\n\n<i>“I love you, [pc.name],”</i> she murmurs, reaching down to pat you. Heady pheromones swirl all around you, filling your mind with her scent. <i>“Mmn.”</i>");
		output("\n\n<i>“I-I love you too,”</i> you moan. <i>“Oohhh...”</i>");
		output("\n\nYou both moan in chorus as she slowly pulls out, her massive cock coming free with a slurp and leaving your asshole a gaping, squirting mess. Amber’s cum spurts to the floor as you struggle to keep your [pc.legs] together, winking and clenching at the heated deertaur while you try to keep it all inside.");
	}
	output("<i>“Fuck,”</i> she mutters, absentmindedly chewing her lip. <i>“That’s... hot.”</i>");
	processTime(2 + rand(3));

	flags["AMBER_LASTCUM"] = GetGameTimestamp();
	IncrementFlag("DRYAD_ANALEDYOU");
	IncrementFlag("DRYAD_DRAINED");
	pc.orgasm();

	pc.loadInAss(ppAmber);
	pc.maxOutCumflation("ass", ppAmber);
	if (pc.isFemale() || pc.isHerm()) pc.applyPussyDrenched();

	output("\n\nAt last you get yourself together, trailing Amber’s seed all down your legs while you lean against the wall and pant, your entire body covered in sweat thanks to both the vigorous rutting and the effort of having Amber on top while she made love to you. Turning back around, you’re surprised by a sudden kiss as she sweeps you into her arms, pushing herself against you until you’re flat against the wall and pressed chest-to-chest with the lusty taurgirl.");
	output("\n\n<i>“Am-Amber,”</i> you murmur, tongue entwined with hers. <i>“Mmm-”</i>");
	output("\n\n<i>“I love you,”</i> Amber whispers, one hand at your lower back and the other cupping your cheek. <i>“[pc.name]...”</i>");
	output("\n\nYou don’t get another word in for the next ten minutes, and by the time you find yourself back in your room, still dizzy and sweaty, you don’t even know where all the time went.");
	processTime(10 + rand(5));

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

//have sex with amber drain her balls into your pussy
public function amberOnShipSexDrainHerInPussy(hole:int):void
{
	clearOutput();
	amberHeader();

	var ppAmber:PregnancyPlaceholder = getDryadPregContainer();
	
	output("You pop off the end of Amber’s warm horsecock and let a mouthful of her thick seed spill from your mouth, splattering your [pc.chest] while you gaze at her dick. It’s coated in a mixture of your saliva and her cum by now, slippery and salty, and already Amber is moaning in need. You’ll just have to offer up a place to resheathe it.");

	output("\n\nCrawling out from under her, you ");
	if (pc.isTaur()){
		output("straighten yourself up and let Amber get a good look at your " + (pc.hasBreasts() ? "cum-covered tits" : "front covered in her cum") + " before you turn around and exercise some fine muscle control to wink at her. The arousal is dripping down your hindlegs already, potent pheromones swirling around Amber’s head and pulling her in. You don’t even need to ask her.");
		output("\n\n<i>“Oh!”</i> you moan, your back arching as honey-sweet pleasure shoots up your spine. <i>“Amber!”</i>");
		output("\n\n<i>“Oh, fuck,”</i> she mutters, her upper lips pressed to the softness of your lower ones. <i>“You taste like sex, [pc.name]. Mmmf!”</i>");
		output("\n\nShe runs her tongue up your soaking slit, your hindlegs shaking as she plants her hands on your [pc.ass] and sucks on your [pc.clit] hard enough to make you scream. She keeps alternating between burying her tongue deep inside you and massaging your plump button and, helpless to resist her advances, you soon find yourself cumming your brains out and shaking so hard you’d fall if not for her steady hands keeping you up. Stars, she’s an artist with her tongue!");

		output("\n\n");
		if (amberDumbfuckDoses() >= 0 && amberDumbfuckDoses() <= 2){
			output("<i>“You all ready to have me blow ten loads in your pussy, [pc.name]?”</i> Amber murmurs. She sticks three fingers into your squeezing, clenching slit and your reply is cut short by a loud, orgasmic moan. <i>“Yeah, you are.”</i>");
		} else if (amberDumbfuckDoses() == 3){
			output("<i>“I’m gonna blow ten fucking loads in your pussy, [pc.name],”</i> Amber murmurs. She sticks three fingers into your squeezing, clenched slit and your reply is cut short by a loud, orgasmic moan. <i>“Mmm, you want it.”</i>");
		} else if (amberDumbfuckDoses() > 3){
			output("<i>“I’m gonna fucking pump your pussy full of cum,”</i> Amber murmurs. She sticks three fingers into your squeezing, clenching slit and your reply is cut short by a loud, orgasmic moan. <i>“Ten times, at least...”</i>");
		}

		output("\n\nThen she’s up on her hooves and the lips of your [pc.pussy] are stretching around the thick, swollen flare of Amber’s horsecock as she mounts you, groaning in quiet elation while you take her throbbing length inside you. The panting deergirl works her way up your body until she’s laid atop you with her breasts pressing into your back and starts swinging her hips, bucking into you with an animal fervor that betrays her inflamed desire. " + (flags["AMBER_DRAINEDINPUSSY"] == undefined ? "You’re momentarily shocked" : "You cry out in pleasure") + " when she leans forward and bites the back of your neck as she fills you, precum streaming " + (pc.isPregnant() ? "from your quivering cunt" : "into your [pc.womb]") + " while she rides you, taken aback by just how <i>feral</i> she is.");
		
		pc.cuntChange(0, ppAmber.cockVolume(0));
		
		output("\n\n<i>“Oh, god, Amber,”</i> you moan, submitting when you feel her canines brush your [pc.skinFurScales]. <i>“Fuck me!”</i>");
		output("\n\nShe rams into you so hard her heavy balls slap against your underside, driving herself to the hilt with such force you can’t help but scream a little, the sound echoing through the hold. Amber doesn’t hold back in the slightest, subjecting you to her full bestial urges, and it’s all you can do to stay standing as her rock-hard rod plunges into your clenching pussy, juices spraying down your shaking hindlegs. She pummels you into submission, forcing you up against the wall " + (pc.hasCock() ? "while your " + (pc.hasCocks() ? "[pc.cocks] shake and strain, precum dripping from their tips." : "[pc.cock] shakes and strains, precum dripping from its tip.") : "while you do your best to stay sane throughout her bestial rutting."));
		output("\n\nIt’s hard not to marvel at just how stiff and swollen her cock is while she frantically plunges it into your depths, slamming herself home again and again in desperate, singleminded need, working herself up to a colossal orgasm. You can feel her beginning to flare inside you once more, the head of her massive horsedick swelling up to what feels like three times its regular size and pressing into your womb hard enough to make you gasp and shake, her rough panting right in your ear. With her chin planted on your shoulder "+ (pc.hasHair() ? "and her face in your [pc.hair]" : "") + ", you have a front row seat to the dryad’s erotic moaning as she begins to find her peak, your own orgasm right on her heels.");
		output("\n\nWhen she cums, the only warning you get is an animalistic grunt of need before a flood of warm seed shoots into your " + (pc.isPregnant() ? "pussy, spurting down your underside" : "womb, filling you in seconds") + ". You let out a submissive whine as you try to retain control of your limbs, but it’s no use. Your " + (pc.isSquirter() ? "squirting cunt spasms and spurts" : "dripping cunt spurts juices") + " all over Amber’s monstrous cock and your forelegs buckle, sending you to the ground while she continues fucking you full of spunk.");
		output("\n\nShe follows you down and doesn’t let up for even a second, slamming your cum-spattered pussy balls-deep with every needy thrust, pouring all of her sexual frustration into one massive " + (!pc.isPregnant() ? "womb-swelling " : "") + "release. Excess jizz pours from your abused cunt as you’re filled to the brim over and over, down on your knees with your [pc.chest] pressed up against the wall. Stars, she’s a <i>beast</i>...");

		output("\n\n<i>“Ooohhh, god,”</i> Amber pants, hindlegs still squeezing your flanks while she works every last rope of equine seed out of her throbbing horsecock.");
		if (amberDumbfuckDoses() >= 0 && amberDumbfuckDoses() <= 2){
			output(" <i>“Fuck, you’re such a sexy bitch -- I’m still hard inside you, [pc.name]...”</i>");
		} else if (amberDumbfuckDoses() == 3){
			output(" <i>“God damn you are so fucking sexy, [pc.name]. I’m still hard as a rock.”</i>");
		} else if (amberDumbfuckDoses() > 3){
			output(" <i>“I’m so fucking hard in your hot little cunt!”</i>");
		}

		output("\n\nShe shifts her hips and you can feel it -- she’s so hard it feels like a warm pole in your body, keeping your back straight. It’s hard to imagine she has any more to give but when she presses her overwhelming dick against your womb and licks your [pc.ear], you find you don’t really care. She distracts you with little kisses and nibbles all down the back of your neck until, slowly, she begins fucking your drippy pussy all over again.");
		output("\n\n<i>“God, you fucking <b>mare</b>,”</i> she breathes, scrabbling to keep her spindly legs holding you in place. <i>“Rrgh! " + (pc.race() == "leithan" || pc.race() == "half-leithan" ? "Your fucking pheromones have me going crazy!" : "Fuck, you turn me on!") + "”</i>"); //Applied to half-leithans as well, since they should have pheromones too
		output("\n\nShe reaches forward and slides a sweaty finger across your [pc.lips] before you open your mouth and suck it inside, and suddenly find she has another finger sliding across your [pc.tongue], gently pumping you from two directions.");
		output("\n\n<i>“[pc.name],”</i> Amber whispers.");
		output("\n\nShe tastes like bliss, like passion and need, and when she caves your needy pussy in with long, deep strokes you cum almost immediately. Having the dryad’s meaty dick so far inside you feels so fulfilling you don’t ever want her to stop, and it seems like you’re getting your wish. She goes slow and deliberately, fucking you to orgasm after orgasm, leaving you breathless and sweaty as she displays her sexual skill.");
		output("\n\nAmber grabs your face and turns your head towards herself, sealing your lips with a deep, passionate kiss right as she explodes inside you, thick spunk splattering into your fucked-full cunny with the force of a tsunami. Her orgasm is so violent in contrast to her actions you find yourself cumming again, your bodies communicating their desires so much more efficiently than words could. With each and every pump of her cock you lovingly clench down on her, milking each load from her quaking balls and feeling her warmth fill you up.");

		output("\n\n");
		if (amberDumbfuckDoses() == 0){
			output("<i>“Oh, god, I love you so much,”</i> she moans, wrapping her arms around your waist and hugging you. <i>“Mmmh... oh, fuck...”</i>");
		} else if (amberDumbfuckDoses() >= 1 && amberDumbfuckDoses() <= 2){
			output("<i>“God, I love your pussy,”</i> she moans, wrapping her arms around your waist and hugging you. <i>“Mmm, fuck...”</i>");
		} else if (amberDumbfuckDoses() == 3){
			output("<i>“Oh, god, you’re an amazing fuck!”</i> she moans, wrapping her arms around you and squeezing your " + (pc.hasBreasts() ? "[pc.breasts]" : "[pc.nipples]") + ". <i>“Just wanna stay here all day... mmm, fuck...”</i>");
		} else if (amberDumbfuckDoses() == 4){
			output("<i>“Fuck I love your pussy!”</i> she pants, wrapping her arms around you and " + (pc.hasBreasts() ? "mauling your [pc.breasts], digging her fingers into your pliable flesh" : "squeezing your [pc.nipples] so hard you gasp") + ". <i>“Nnnh! Oh! More!”</i>");
		}

		output("\n\nThe next time she cums is with her eyes squeezed shut and sucking hard on your tongue, moaning into your mouth while hot spunk surges into you, your underbelly beginning to sag with the sheer amount of it all. She’s just so <i>virile</i> and honestly, you love her for it. You can spend hours upon hours just drinking her in, easing her burden drop by drop...");
		output("\n\nWhen she finally finishes emptying herself into you what feels like a century later, she parts her lips from yours with a gasp and a thread of drool, chest heaving hard.");
		output("\n\n<i>“I want,”</i> she murmurs, <i>“to watch you cum.”</i>");
		output("\n\n<i>“B-better- uh! Keep- keep fucking my p-pussy, then,”</i> you pant, reaching back and running your hands through her pretty red hair. <i>“Please don’t stop now...”</i>");
		output("\n\nShe responds by beginning to rut you once more, drawing her cervine hips back so far there’s a moan of disappointment on your lips in anticipation of her slipping free of you, one that dies with a lusty groan when she forces herself all the way back in. Her heavy balls swing up and slap against your swollen clit, sending an electric shock all the way up your spine and setting your back arching like a whore’s.");
		output("\n\n<i>“Cum for me,”</i> she whispers, squeezing your diamond-stiff nipples. You do as you’re told, your entire body shaking while pure pleasure radiates through your entire body, tightening up your muscles before leaving you a shuddering, breathless wreck. Then she fucks you so hard you’re screaming her name, ending by dumping yet another enormous load into your dripping, squirting fuckhole.");
		output("\n\nThen she starts the entire process all over again, right from the beginning.");

		output("\n\n");
		if (amberDumbfuckDoses() >= 0 && amberDumbfuckDoses() <= 2){
			processTime(4 * 60);
			output("<b>4 hours later</b>");
		} else if (amberDumbfuckDoses() == 3){
			processTime(6 * 60);
			output("<b>6 hours later</b>");
		} else if (amberDumbfuckDoses() > 3){
			processTime(8 * 60);
			output("<b>8 hours later</b>");
		}

		output("\n\nThe two of you both groan as the dryad slowly withdraws her sodden, mercifully limp cock from your abused snatch, a river of packed-tight spunk following its exit. Shakily dismounting, she helps you to your [pc.feet] and catches you in a sweet embrace, pushing her full, perky breasts into your chest, your nipples pressing against hers.");

		output("\n\n");
		if (amberDumbfuckDoses() == 0){
			output("<i>“Mmmm, thank you so much,”</i>");
		} else if (amberDumbfuckDoses() >= 1 && amberDumbfuckDoses() <= 2){
			output("<i>“Thanks for the fuck, babe,”</i>");
		} else if (amberDumbfuckDoses() == 3){
			output("<i>“Thanks for being my hot little cumdump,”</i>");
		} else if (amberDumbfuckDoses() == 4){
			output("<i>“Thanks for letting me blow my load in your cunt,”</i>");
		}
		output(" she murmurs, right before planting a wet kiss on your lips, clasping your face and snaking her tongue inside. This kiss is shorter than the others, but no less heartfelt. She pulls away with a smile and flushed, sweaty cheeks.");

		if (amberDumbfuckDoses() == 0){
			output("\n\n<i>“Let’s do this again soon,”</i> Amber says, flipping her hair over her shoulder. <i>“But not before we grab a shower... even though I do really enjoy smelling my own pheromones all over you, [pc.name].”</i>");
			output("\n\n<i>“I think I’m going to smell like you for a <b>while</b>,”</i> you murmur.");
			output("\n\n<i>“Uh huh!”</i> she says triumphantly, leaning in and giving you a peck on the cheek. <i>“Poor [pc.name]. You’ll be pulling in horny mares wherever you go. Okay, captain.”</i> She squeezes your waist and grins. <i>“I’m going to catch a shower. I’ll see you soon.”</i>");
			output("\n\nYou wave her off with a smile as she clops away to wash herself, shivering slightly as you feel a stream of her thick equine seed roll down your [pc.thigh]. Maybe you should get one yourself...");
		} else if (amberDumbfuckDoses() >= 1 && amberDumbfuckDoses() <= 2){
			output("\n\n<i>“Oh, man, that was great,”</i> Amber sighs, taking a deep breath. <i>“I feel so much lighter... though I guess you prolly don’t, haha!”</i>");
			output("\n\nShe grins as she bends down and pats your soft underbelly, full of sloshing cum.");
			output("\n\n<i>“You make a great lover <b>and</b> and a good cumtank, [pc.name],”</i> she says, rising back up and giving you a soft peck on the cheek. <i>“And I know you do it for me. So thank you.”</i>");
			output("\n\n<i>“Sure,”</i> you say, smiling at her. <i>“Now go catch that shower before we wind up with you on top of me again.”</i>");
			output("\n\n<i>“Oh, yeah, like you wouldn’t be happy about it!”</i> she says, grinning wider. <i>“Alright, captain. I’ll see you soon.”</i>");
			output("\n\nYou wave her off with a smile as she clops away to wash herself, shivering slightly as you feel a stream of her thick equine seed roll down your [pc.thigh]. Maybe you should go shower yourself...");
		} else if (amberDumbfuckDoses() == 3){
			output("\n\n<i>“Aaah, that felt amazing,”</i> Amber sighs, eyeing you up and down with a smile. <i>“You’re easily the best fuck of my life, [pc.name]. And I love you for it.”</i>");
			output("\n\nShe leans in and gives you a soft kiss on the cheek, running a finger under your chin.");
			output("\n\n<i>“I’m gonna go shower,”</i> she says, turning away and grinning over her shoulder. <i>“If you’re still here by the time I come back, I’m gonna fuck you even harder.”</i>");
			output("\n\nYou wave her off with a smile as she clops away to wash herself, shivering slightly as you feel a stream of her thick equine seed roll down your [pc.thigh]. Maybe you should go shower yourself...");
		} else if (amberDumbfuckDoses() == 4){
			output("\n\n<i>“Mmmm...”</i> Amber sighs, sticking close to you. She gazes into your eyes, running her hands up your front. <i>“So... again?”</i>");
			output("\n\n<i>“I’m gonna get clean before I get dirty again,”</i> you say, smiling. <i>“You should probably do the same.”</i>");
			output("\n\n<i>“Suck me clean,”</i> she whispers, cheeks flushing. She’s serious.");
			output("\n\nYou hesitate for a second but kneel down in front of her, letting her plant her massive horsecock on your face and groan in ecstasy as your tongue runs along its length. You tongue-bathe her with love and respect, and when she starts to push her swollen flare into your throat you don’t resist. She only stops when she blows a massive load right into your stomach, groaning in exhausted delight before she pulls herself free.");
			output("\n\n<i>“Oops... it’s covered in juices again,”</i> she murmurs innocently. <i>“Can you clean it?”</i>");
			output("\n\nYou bend to your task...");
			output("\n\nIt’s a while before you end up back in your room.");
			processTime(20);
		}
		//end of Taur path
	} else {
		output("straighten yourself up and let Amber get a good look at your " + (pc.hasBreasts() ? "cum-covered tits" : "front covered in her cum") + " before you turn around and place your hands against a wall, spreading your [pc.legs] for her. The arousal is dripping down your [pc.thighs] already, potent pheromones swirling around Amber’s head and pulling her in. You don’t even need to ask her.");
		output("\n\n<i>“Oh!”</i> you moan, your back arching as honey-sweet pleasure shoots up your spine. <i>“Amber!”</i>");
		output("\n\n<i>“Oh, fuck,”</i> she mutters, her upper lips pressed to the softness of your lower ones. <i>“You taste like sex, [pc.name]. Mmmf!”</i>");
		output("\n\nShe runs her tongue up your soaking slit, your legs shaking as she plants her hands on your [pc.ass] and sucks on your [pc.clit] hard enough to make you scream. She keeps alternating between burying her tongue deep inside you and massaging your plump button and, helpless to resist her advances, you soon find yourself cumming your brains out and shaking so hard you’d fall if not for her steady hands keeping you up. Stars, she’s an artist with her tongue!");

		output("\n\n");
		if (amberDumbfuckDoses() >= 0 && amberDumbfuckDoses() <= 2){
			output("<i>“You all ready to have me blow ten loads in your pussy, [pc.name]?”</i> Amber murmurs. She sticks three fingers into your squeezing, clenching slit and your reply is cut short by a loud, orgasmic moan. <i>“Yeah, you are.”</i>");
		} else if (amberDumbfuckDoses() == 3){
			output("<i>“I’m gonna blow ten fucking loads in your pussy, [pc.name],”</i> Amber murmurs. She sticks three fingers into your squeezing, clenched slit and your reply is cut short by a loud, orgasmic moan. <i>“Mmm, you want it.”</i>");
		} else if (amberDumbfuckDoses() > 3){
			output("<i>“I’m gonna fucking pump your pussy full of cum,”</i> Amber murmurs. She sticks three fingers into your squeezing, clenching slit and your reply is cut short by a loud, orgasmic moan. <i>“Ten times, at least...”</i>");
		}

		output("\n\nThen she’s up on her hooves and the lips of your [pc.pussy] are stretching around the thick, swollen flare of Amber’s horsecock as she mounts you, groaning in quiet elation while you take her throbbing length inside you. The panting deergirl works her way up your body until her forelegs are pressed against the wall and starts swinging her hips, bucking into you with an animal fervor that betrays her inflamed desire. You’re forced to stand up straighter as she fills you, precum streaming " + (pc.isPregnant() ? "from your quivering cunt" : "into your [pc.womb]") + " while she rides you, taken aback by just how <i>feral</i> she is.");
		
		pc.cuntChange(0, ppAmber.cockVolume(0));
		
		output("\n\n<i>“Oh, god,”</i> you moan, the fur of her underside brushing against your back. <i>“Fuck me, Amber!”</i>");
		output("\n\nShe rams into you so hard her heavy balls slap against your groin, driving herself to the hilt with such force you can’t help but scream, the sound echoing through the hold. Amber doesn’t hold back in the slightest, subjecting you to her full bestial urges, and it’s all you can do to stay standing as her rock-hard rod plunges into your clenching pussy, juices spraying down your shaking thighs. She pummels you into submission, forcing you up against the wall " + (pc.hasCock() ? "while your " + (pc.hasCocks() ? "[pc.cocks] shake and strain, precum dripping from their tips." : "[pc.cock] shakes and strains, precum dripping from its tip.") : "while you do your best to stay sane throughout her bestial rutting."));
		output("\n\nIt’s hard not to marvel at just how stiff and swollen her cock is while she frantically plunges it into your depths, slamming herself home again and again in desperate, singleminded need, working herself up to a colossal orgasm. You can feel her beginning to flare inside you once more, the head of her massive horsedick swelling up to what feels like three times its regular size and pressing into your womb hard enough to make you gasp and shake, her rough panting right in your ear. With her chin planted on your shoulder "+ (pc.hasHair() ? "and her face in your [pc.hair]" : "") + ", you have a front row seat to the dryad’s erotic moaning as she begins to find her peak, your own orgasm right on her heels.");
		output("\n\nWhen she cums, the only warning you get is an animalistic grunt of need before a flood of warm seed shoots into your " + (pc.isPregnant() ? "pussy, spurting down your underside" : "womb, filling you in seconds") + ". You let out a submissive whine as you try to retain control of your limbs, but it’s no use. Your " + (pc.isSquirter() ? "squirting cunt spasms and spurts" : "dripping cunt spurts juices") + " all over Amber’s monstrous cock and your legs buckle, sending you to the ground as she follows you down and continues fucking you full of spunk.");
		output("\n\nShe doesn’t let up for even a second, slamming your cum-spattered pussy balls-deep with every needy thrust, pouring all of her sexual frustration into one massive " + (!pc.isPregnant() ? "womb-swelling " : "") + "release. Excess jizz pours from your abused cunt as you’re filled to the brim over and over, down on your knees with your [pc.chest] pressed up against the wall. Stars, she’s a <i>beast</i>...");

		output("\n\n<i>“Ooohhh, god,”</i> Amber pants, hindlegs still squeezing your [pc.ass] while she works every last rope of equine seed out of her throbbing horsecock.");
		if (amberDumbfuckDoses() >= 0 && amberDumbfuckDoses() <= 2){
			output(" <i>“Fuck, you’re such a sexy bitch -- I’m still hard inside you, [pc.name]...”</i>");
		} else if (amberDumbfuckDoses() == 3){
			output(" <i>“God damn you are so fucking sexy, [pc.name]. I’m still hard as a rock.”</i>");
		} else if (amberDumbfuckDoses() > 3){
			output(" <i>“I’m so fucking hard in your hot little cunt!”</i>");
		}

		output("\n\nShe shifts her hips and you can feel it -- she’s so hard it feels like a warm pole in your body, keeping your back straight. It’s hard to imagine she has any more to give but when she presses her overwhelming dick against your womb and brushes a foreleg your [pc.ear], you find you don’t really care. She distracts you with little movements and flexes of her dick until, slowly, she begins fucking your drippy pussy all over again.");
		output("\n\n<i>“God, you fucking <b>mare</b>,”</i> she breathes, scrabbling to keep her spindly legs holding you in place. <i>“Rrgh! Fuck, you turn me on!”</i>");
		output("\n\nShe reaches down and slides a sweaty finger across your [pc.lips] before you open your mouth and suck it inside, and suddenly find she has another finger sliding across your [pc.tongue], gently pumping you from two directions.");
		output("\n\n<i>“[pc.name],”</i> Amber whispers.");
		output("\n\nShe tastes like bliss, like passion and need, and when she caves your needy pussy in with long, deep strokes you cum almost immediately. Having the dryad’s meaty dick so far inside you feels so fulfilling you don’t ever want her to stop, and it seems like you’re getting your wish. She goes slow and deliberately, fucking you to orgasm after orgasm, leaving you breathless and sweaty as she displays her sexual skill.");
		output("\n\nAmber grabs your face and turns your head towards herself, sealing your lips with a deep, passionate kiss right as she explodes inside you, thick spunk splattering into your fucked-full cunny with the force of a tsunami. Her orgasm is so violent in contrast to her actions you find yourself cumming again, your bodies communicating their desires so much more efficiently than words could. With each and every pump of her cock you lovingly clench down on her, milking each load from her quaking balls and feeling her warmth fill you up.");

		output("\n\n");
		if (amberDumbfuckDoses() == 0){
			output("<i>“Oh, god, I love you so much,”</i> she moans, squeezing your cheeks. <i>“Mmmh... oh, fuck...”</i>");
		} else if (amberDumbfuckDoses() >= 1 && amberDumbfuckDoses() <= 2){
			output("<i>“God, I love your pussy,”</i> she moans, squeezing your cheeks. <i>“Mmm, fuck...”</i>");
		} else if (amberDumbfuckDoses() == 3){
			output("<i>“Oh, god, you’re an amazing fuck!”</i> she moans, squeezing your " + (pc.hasBreasts() ? "[pc.breasts]" : "[pc.nipples]") + ". <i>“Just wanna stay here all day... mmm, fuck...”</i>");
		} else if (amberDumbfuckDoses() == 4){
			output("<i>“Fuck I love your pussy!”</i> she pants, " + (pc.hasBreasts() ? "mauling your [pc.breasts], digging her fingers into your pliable flesh" : "squeezing your [pc.nipples] so hard you gasp") + ". <i>“Nnnh! Oh! More!”</i>");
		}

		output("\n\nThe next time she cums is with her eyes squeezed shut and sucking hard on your tongue, moaning into your mouth while hot spunk surges into you, your belly sagging with the sheer amount of it all. She’s just so <i>virile</i> and honestly, you love her for it. You can spend hours upon hours just drinking her in, easing her burden drop by drop...");
		output("\n\nWhen she finally finishes emptying herself into you what feels like a century later, she parts her lips from yours with a gasp and a thread of drool, chest heaving hard.");
		output("\n\n<i>“I want,”</i> she murmurs, <i>“to watch you cum.”</i>");
		output("\n\n<i>“B-better- uh! Keep- keep fucking my p-pussy, then,”</i> you pant. <i>“Please don’t stop now...”</i>");
		output("\n\nShe responds by beginning to rut you once more, drawing her cervine hips back so far there’s a moan of disappointment on your lips in anticipation of her slipping free of you, one that dies with a lusty groan when she forces herself all the way back in. Her heavy balls swing up and slap against your swollen clit, sending an electric shock all the way up your spine and setting your back arching like a whore’s.");
		output("\n\n<i>“Cum for me,”</i> she whispers, squeezing your diamond-stiff nipples. You do as you’re told, your entire body shaking while pure pleasure radiates through your entire body, tightening up your muscles before leaving you a shuddering, breathless wreck. Then she fucks you so hard you’re screaming her name, ending by dumping yet another enormous load into your dripping, squirting fuckhole.");
		output("\n\nThen she starts the entire process all over again, right from the beginning.");

		output("\n\n");
		if (amberDumbfuckDoses() >= 0 && amberDumbfuckDoses() <= 2){
			processTime(4 * 60);
			output("<b>4 hours later</b>");
		} else if (amberDumbfuckDoses() == 3){
			processTime(6 * 60);
			output("<b>6 hours later</b>");
			processTime(8 * 60);
		} else if (amberDumbfuckDoses() > 3){
			output("<b>8 hours later</b>");
		}

		output("\n\nThe two of you both groan as the dryad slowly withdraws her sodden, mercifully limp cock from your abused snatch, a river of packed-tight spunk following its exit. Shakily dismounting, she helps you to your [pc.feet] and catches you in a sweet embrace, pushing her full, perky breasts into your chest, your nipples pressing against hers.");

		output("\n\n");
		if (amberDumbfuckDoses() == 0){
			output("<i>“Mmmm, thank you so much,”</i>");
		} else if (amberDumbfuckDoses() >= 1 && amberDumbfuckDoses() <= 2){
			output("<i>“Thanks for the fuck, babe,”</i>");
		} else if (amberDumbfuckDoses() == 3){
			output("<i>“Thanks for being my hot little cumdump,”</i>");
		} else if (amberDumbfuckDoses() == 4){
			output("<i>“Thanks for letting me blow my load in your cunt,”</i>");
		}
		output(" she murmurs, right before planting a wet kiss on your lips, clasping your face and snaking her tongue inside. This kiss is shorter than the others, but no less heartfelt. She pulls away with a smile and flushed, sweaty cheeks.");

		if (amberDumbfuckDoses() == 0){
			output("\n\n<i>“Let’s do this again soon,”</i> Amber says, flipping her hair over her shoulder. <i>“But not before we grab a shower... even though I do really enjoy smelling my own pheromones all over you, [pc.name].”</i>");
			output("\n\n<i>“I think I’m going to smell like you for a <b>while</b>,”</i> you murmur.");
			output("\n\n<i>“Uh huh!”</i> she says triumphantly, leaning in and giving you a peck on the cheek. <i>“Poor [pc.name]. You’ll be pulling in horny mares wherever you go. Okay, captain.”</i> She squeezes your waist and grins. <i>“I’m going to catch a shower. I’ll see you soon.”</i>");
			output("\n\nYou wave her off with a smile as she clops away to wash herself, shivering slightly as you feel a stream of her thick equine seed roll down your [pc.thigh]. Maybe you should get one yourself...");
		} else if (amberDumbfuckDoses() >= 1 && amberDumbfuckDoses() <= 2){
			output("\n\n<i>“Oh, man, that was great,”</i> Amber sighs, taking a deep breath. <i>“I feel so much lighter... though I guess you prolly don’t, haha!”</i>");
			output("\n\nShe grins as she pats your soft tummy, womb full of sloshing cum.");
			output("\n\n<i>“You make a great lover <b>and</b> and a good cumtank, [pc.name],”</i> she says, rising back up and giving you a soft peck on the cheek. <i>“And I know you do it for me. So thank you.”</i>");
			output("\n\n<i>“Sure,”</i> you say, smiling at her. <i>“Now go catch that shower before we wind up with you on top of me again.”</i>");
			output("\n\n<i>“Oh, yeah, like you wouldn’t be happy about it!”</i> she says, grinning wider. <i>“Alright, captain. I’ll see you soon.”</i>");
			output("\n\nYou wave her off with a smile as she clops away to wash herself, shivering slightly as you feel a stream of her thick equine seed roll down your [pc.thigh]. Maybe you should go shower yourself...");
		} else if (amberDumbfuckDoses() == 3){
			output("\n\n<i>“Aaah, that felt amazing,”</i> Amber sighs, eyeing you up and down with a smile. <i>“You’re easily the best fuck of my life, [pc.name]. And I love you for it.”</i>");
			output("\n\nShe leans in and gives you a soft kiss on the cheek, running a finger under your chin.");
			output("\n\n<i>“I’m gonna go shower,”</i> she says, turning away and grinning over her shoulder. <i>“If you’re still here by the time I come back, I’m gonna fuck you even harder.”</i>");
			output("\n\nYou wave her off with a smile as she clops away to wash herself, shivering slightly as you feel a stream of her thick equine seed roll down your [pc.thigh]. Maybe you should go shower yourself...");
		} else if (amberDumbfuckDoses() == 4){
			output("\n\n<i>“Mmmm...”</i> Amber sighs, sticking close to you. She gazes into your eyes, running her hands up your front. <i>“So... again?”</i>");
			output("\n\n<i>“I’m gonna get clean before I get dirty again,”</i> you say, smiling. <i>“You should probably do the same.”</i>");
			output("\n\n<i>“Suck me clean,”</i> she whispers, cheeks flushing. She’s serious.");
			output("\n\nYou hesitate for a second but kneel down in front of her, letting her plant her massive horsecock on your face and groan in ecstasy as your tongue runs along its length. You tongue-bathe her with love and respect, and when she starts to push her swollen flare into your throat you don’t resist. She only stops when she blows a massive load right into your stomach, groaning in exhausted delight before she pulls herself free.");
			output("\n\n<i>“Oops... it’s covered in juices again,”</i> she murmurs innocently. <i>“Can you clean it?”</i>");
			output("\n\nYou bend to your task...");
			output("\n\nIt’s a while before you end up back in your room.");
			processTime(20);
		}
		//end of nonTaur path
	}
	//Congratulations traveler! Amber has seeded your cunt!

	flags["AMBER_LASTCUM"] = GetGameTimestamp();
	IncrementFlag("AMBER_DRAINEDINPUSSY");
	IncrementFlag("DRYAD_YOURCUNT");
	IncrementFlag("DRYAD_DRAINED");
	pc.orgasm();

	pc.loadInCunt(ppAmber, 0);
	pc.maxOutCumflation("vagina 0", ppAmber);
	pc.applyPussyDrenched();
	pc.applyCumSoaked();

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}