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
  AMBER_RECRUIT_FUCK 0/undefined = not recruited , 1 = you fucked her during recruitment scene, 2 = she fucked you
  AMBER_LASTCUM gametimestamp of last time she came
  AMBER_BRUSHED gametimestamp of last time she was brushed
  AMBER_SHIPSEX_TALK 0/undef no talk yet, 1 = had talk
  AMBER_SHIPSEX_GETFUCKED 0/undef not yet, 1 = had talk
  AMBER_TALK_STAGE stage of unlocked talk topics 0/undef = Past & Crew, 1 = Family, 2 = Life, 3 = Cure, 4 = Drugs
  AMBER_CREW_SEX 0/undef = no, 1 = yes
  AMBER_CURED undef/0 uncured, 1 = cured
  AMBER_DUMBFUCK Number of doses of dumbfuck given
  AMBER_DUMBFUCK_LASTGIVEN currently under the influence of dumfuck, 0/undef = n0, 1 = yes
  AMBER_EQUILICUM Been given equilicum 0/undef = no, 1 = yes
  DRYAD_FUCKED Times Sexed
  DRYAD_BLEWHER Times You Sucked Her Dick
  DRYAD_FACEFUCKED  Times She Sucked Your Dick 
  DRYAD_CUNHER Times You Licked Her Pussy
  DRYAD_CUNYOU Times She Licked Your Pussy
  DRYAD_HERCUNT  Times You Fucked Her Pussy 
  DRYAD_YOURCUNT  Times She Fucked Your Pussy 
  DRYAD_ANALED  Times You Fucked Her Ass 
  DRYAD_ANALEDYOU Times She Fucked Your Ass 

*/
//show bust
public function amberHeader():void
{
	showName("\nAMBER");
	showBust("DRYAD");
	author("Wsan");
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
	output("\n\n<i>“Hnh,”</i> Urbolg says, rubbing his furry chin. <i>“Funny ye ask. With all the morons comin’ through and leaving their junk here, I’ve got </i>quite<i> the collection. Actually, ye’d be helping me out by taking it. Got a whole bunch of harnesses, mounts, restraints, leg-lockers… ye name it, s’probably in there. Why, ye got your romantic eyes set on a ‘taur, kid?”</i> he teases.");
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
	output("\n\n<i>“Permanent… solution?”</i> she echoes, suddenly curious. <i>“Like uh, like what? I’ve thought about it countless times, but-”</i> she says, grimacing. <i>“I dunno. Simpler to just live out here.”</i>");
	output("\n\n<i>“Come with me,”</i> you say earnestly. <i>“I think I’ve proven I can handle your quirks. If you’re on my ship, you’ll always have someone around to take care of you. Plus it’d be a little more… civilized,”</i> you add, gesturing at the jungle. <i>“I know you must be attached to this place, but at the very least I can promise you a warm bed and food.”</i>");
	output("\n\n<i>“I-... No, I’m not attached to this place,”</i> she says, smiling crookedly. <i>“I just thought- think, really, that I wouldn’t do too hot in regular civilization. What with the uh, problem and all…”</i> she trails off, scratching her cheek distractedly while she stares at a point past you. Flicking her gaze back to you, she curls her lip a little.<i>“Um, can we fuck? Sorry, but I’m- uh, really getting desperate here. Like, I’m about fiiive seconds from pushing you down and, and just fucking you.”</i>");
	output("\n\nShe’s not kidding. Between her legs, you can see her pink cock angrily flaring and dripping with cum, the head swollen to twice its regular size. Between that and the heavy, swinging balls full of churning seed between her hindlegs, she’s the picture of sexual desire and it’s clear her restraint is waning by the second.");
	output("\n\nIf you’re going to take her onboard, you’ll have to prove you can handle her desires yourself when the need arises.");

	processTime(3);
	clearMenu();
	if (pc.hasCock()) addButton(0, "Fuck Her", amberComeWithTalkFuckHer, undefined, "Fuck Her", "Fuck the girl’s pussy to get her off.");
	else addDisabledButton(0, "Fuck Her", "Fuck Her", "You don’t have a dick to fuck her with.");
	
	addButton(1, "Get Fucked", vaginaRouter,[amberComeWithTalkGetFucked,ppAmber.cockVolume(0),1,0], "Get Fucked", "Let the girl fuck one of your holes.");
	addButton(2, "No", amberComeWithTalkNo, undefined, "No", "You don’t wanna bang right now.");
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
	output("\n\nYou’ve hardly started and she’s already squeezing down on you, ready to cum at the slightest provocation. Between that and your willingness to indulge her erotic desire to be fucked as hard as possible it doesn’t take long until she’s screaming herself hoarse in bliss, forelegs bowed and her cock noisily spewing cum across the ground of the M’hengan jungle. She’s always been an easy partner, cumming with the most minor of attentions, and now is anything but an exception.");
	output("\n\nYou hammer her hard enough to tip her front half over, her strong hindlegs keeping her slick, spasming pussy in air for you to fuck while she claws at the dirt and shrieks in ecstasy. By the time you cum yourself, exploding into her depths while her undulating walls milk you for your seed, she’s almost run dry. A few last ropes shoot from the end of her shaking horsecock, joining the expansive pool of jizz pooling under her. When you withdraw from her well-satisfied cunt, your own spunk drips down her behind and spatters across her balls, a more manageable size by now.");
	
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
		
	output("\n\n<i>“Oh my god, yes,”</i> she pants, her hips already making small shuddering thrusts and sending droplets of jizz and sweat all over the forest floor. <i>“Oohhh, fuck…”</i>");	
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
		if(pc.ass.wetness() < 3) output(" , pain,");
	}
	else
	{
		if(pc.vaginas[hole].wetness() < 3)output(" , pain,");
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
	output("\n\n<i>“I… I-”</i> she starts, then stops. She’s struggling to get something out, that much you can see. What takes you by surprise is when tears begin to flow down her flushed, freckled cheeks. <i>“Thank you! I’m sorry!”</i> she hiccups, futilely wiping at her eyes. <i>“I-I’m suh-sorry I’m such a mess! I-”</i>");
	
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
	
	output("\n\n<i>“This is… the nicest thing anyone has ever done for me,”</i> she says quietly. <i>“I don’t even care if you just want to fuck me, or whatever. I just- I just want to leave it all behind.”</i>");
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
	else output("  they were right on the verge of civil war when I got there.”</i>");
	
	output("\n\n<i>“Wow, you’re an actual space explorer!”</i> she marvels. Her eyes sparkle with wonder, eager to hear more about the universe you’ve travelled. <i>“That’s amazing, uh - I just realized, I don’t know your name! I guess our past um, meetings, haven’t exactly been the kinda environment to get to know each other. Properly, I mean.”</i>");
	output("\n\n<i>“It </i>is<i> a little crazy that we’ve known each other for so long without ever introducing ourselves,”</i> you agree, looking at her with a smile. <i>“I’m [pc.name]. [pc.name] Steele.”</i>");
	
	output("\n\n<i>“Steel, huh?”</i> she says, grinning.");	
	if (flags["AMBER_RECRUIT_FUCK"] == 1) output(" <i>“Well, you can be as hard as steel in at least one place.”</i>");
	else output(" <i>“Your exterior doesn’t seem so impenetrable to me.”</i>");
		
	output("\n\n<i>“And my name is Amber,”</i> she continues, expression softening into a smile. <i>“Well, that’s just what I chose for myself, anyway. I thought it was nice.”</i>");
	output("\n\n<i>“Amber, huh?”</i> you say, nodding. <i>“It’s a nice name. You know, there’s a Terran myth that claims amber is produced by the sun. Poetic, right?”</i>");
	output("\n\n<i>“Yes!”</i>she says, pleased. <i>“It has a lot of ties to the sun, and, well, that was kinda who I wanted to be, y’know? The shining sun…”</i>");
	output("\n\nShe trails off, looking at the sky of M’henga and for a moment you wonder if you should start talking about your space adventures again. When she looks back at you, though, she’s wearing an expression of contentment. <i>“Thank you. For everything. Maybe… maybe one day I can really be that person.”</i>");
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
		output("\n\nAnno eyes you with a playful grin that speaks volumes. <i>“So, Steele… I really, really hope you weren’t planning on monopolizing this beautiful woman. ‘Cuz uh,”</i> she murmurs, her eyes flitting downwards momentarily, <i>“I can see she’s quite </i>gifted<i>.”</i>");
		output("\n\nAmber giggles at that, but looks to you for approval. You shrug.");
		output("\n\n<i>“Hey, I dunno yet. But now that you mention it, actually…”</i>");
		output("\n\nYou fill Anno in on Amber’s condition and she claps her hands over her mouth in shock.");
		output("\n\n<i>“That’s horrible! You poor girl!”</i>");
		output("\n\nAnno catches Amber in a tight, sincere hug, wrapping her arms around the dryad’s back. You smile. Seems like she has one good friend already.");
		output("\n\n<i>“So, it might be beneficial to have more than one person to help Amber out, but we’ll see,”</i> you say. <i>“I’m gonna finish up giving her the ship tour and let her take a shower.”</i>");
		output("\n\n<i>“Oh, a shower,”</i> Amber exclaims, clasping her hands together in glee. <i>“I haven’t had one in so long…”</i>");
		output("\n\n<i>“Alright, I’ll let you get to it!”</i> Anno chirps, smiling. <i>“You can come by my room any time if you wanna talk, Amber. It’s just down the corridor. See you!”</i>");
		output("\n\n<i>“Bye, Anno!”</i> Amber says, waving as the friendly ausar heads to her room. She turns to you after Anno’s left. <i>“She’s very nice.”</i>");
		output("\n\n<i>“Yeah, Anno’s great,”</i> you agree. <i>“C’mon, I’ll show you the hold.”</i>");		
	}
	
	output("You show her around the rest of the ship, though admittedly it’s not a very long tour. She takes particular interest in all the mounting equipment set up in the hold, courtesy of Urbolg.");
	output("\n\n<i>“Oho, wow,”</i> Amber giggles, looking at you slyly. <i>“Looks like someone was ready for my arrival, huh?”</i>");
	output("\n\nShe gives you a kiss out of nowhere, right on the [pc.skinFurScales] of your cheek.");
	output("\n\n<i>“Thanks, [pc.name]. I can tell you’re actually putting a lot of thought into this,”</i> she says, smiling warmly. <i>“You’re doing your best to make me happy, and I appreciate it. Now uh,”</i> she adds, taking some of her hair in hand and inspecting it. <i>“If you don’t mind, could I grab that shower? I haven’t really thought about it much, but I guess I smell like jungle.”</i>");
	output("\n\n<i>“I wasn’t gonna say anything, but…”</i> you say, shrugging.");
	output("\n\n<i>“Yeeeaaah,”</i> Amber grimaces. <i>“Don’t worry about it. You’d think for someone with such a keen sense of smell I’d be more aware, but y’know. Haven’t been around people much.”</i>");
	output("\n\nYou lead her up to your room and show her the shower. She seems very impressed with it.");
	output("\n\n<i>“It can fit a leithan, so you should be fine,”</i> you say, opening the door and gesturing at the controls. <i>“Do you want some help toweling off your back half when you’re done?”</i>");
	output("\n\n<i>“That would be great, actually,”</i> she says, standing still and looking into the shower. <i>“I uh, I-”</i>");
	output("\n\nShe’s trying not to cry. Tears well up in her bright blue eyes and after a couple of seconds, begin to streak down her face.");
	output("\n\n<i>“Thank you. T-thank you so much,”</i> Amber chokes, talking while you caringly dab at her cheeks with the corner of the soft towel you were going to put on the bed. <i>“For, for everything. It’s just a little much for me… to go from h-hiding in the woods to being onboard a spaceship. None of this feels real.”</i> Her tears drying up, she looks at you forlornly. <i>“I don’t want to wake up and have you disappear.”</i>");
	output("\n\n<i>“I won’t,”</i> you promise. <i>“I get it, though. It must be overwhelming. But I’m not gonna disappear on you or anything like that, Amber. Okay?”</i>");
	output("\n\nShe nods slowly, her cheeks red but her eyes clear again. <i>“Okay… okay.”</i>");
	output("\n\n<i>“Good. Now uh,”</i> you say, noting her hand clinging to your forearm. <i>“Did you want me to come in the shower with you? Might help to get you clean.”</i>");
	output("\n\n<i>“Yes please,”</i> Amber says, taking a ginger step past the door. <i>“I don’t know if I um, really get the controls. I don’t want a faceful of icy water as my welcome back into civilization.”</i>");
	
	output("\n\nYou");	
	if (!pc.isNude()) output(" shuck off your clothes into a pile outside and");
	output(" close the door behind you as you enter, turning the dial for warm water. Turning to Amber, you beckon her closer.");	
	
	output("\n\n<i>“Here, the showerhead’s detachable. I’ll hose you down a bit, alright?”</i> you offer, taking the nozzle in hand.");
	output("\n\nYou let the water cascade over Amber’s pale chest, droplets forming across her shapely breasts after you direct it lower, down her stomach and then around her side. You have to rub her fur a lot to get the water to penetrate her coat, drenching her thoroughly enough that she’s probably going to weigh an extra ten pounds after you’re done. She stiffens a little when the water courses over her rear, tail twitching slightly, but you remain silent out of diplomacy until you’re hosing down her other side and it’s too much to ignore.");
	output("\n\n<i>“You look pretty pent up down here,”</i> you tell her, grinning as she turns back to you with flushed cheeks. <i>“I guess the heat is getting to you, huh? Wanna take care of it?”</i>");
	output("\n\n<i>“This isn’t- it’s uh, not my heat. Well, not yet,”</i> Amber says hesitantly, meeting your eyes under the flow of water. <i>“You’re attractive, naked, and dripping with water… I just want to have sex with you, [pc.name].”</i>");
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
		pc.lust(30);		
		//suck her dick, she came, skip change
		amberFuckAHole(3,true,false);	
	}
	
	output("\n\n<i>“Ohoohhh, wow,”</i> she half-laughs, half-pants, looking at you with a dizzy smile. <i>“We’ve gotta do this more often…”</i>");
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
	output("\n\n<i>“Yeah, hope so. I’ll try to be around the ship as much as possible to help you out, Amber,”</i> you tell her. <i>“Are you tired? Today’s been a bit of an adventure…”</i>");
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
	output(" You rise to your feet and notice Amber waking up, yawning and blinking blearily as she looks around the hold. Then she spots you. You can see the confusion in her eyes until the events of yesterday come flooding back.");
	
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
public function amberShipBonusText():String
{
	var desc:String;
	
	desc = "Amber is likely relaxing down in the hold";
	if (crew(true) > 0) desc += " or hanging out with a crew member";
	desc += ".";
	
	return desc;
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
		output("\n\n<i>“Yes,”</i> she replies matter-of-factly. <i>“Most people don’t run around space rescuing people left and right. Heck, you might be the only one who does. Besides… you saved me. Of course I wanna get to know you.”</i>");
		output("\n\n<i>“Fair enough,”</i> you say, smiling.");
	}
	else
	{
		//greeting based off of dumbfuck doses given
		if (amberDumbfuckDoses() >= 4) output("<i>“[pc.name]!”</i> Amber cries excitedly, doing a little dance on her hooves. <i>“Are you gonna fuck me? Pleeeaaase come and fuck me…”</i>");
		else if (amberDumbfuckDoses() == 3)
		{
			output("<i>“Hi [pc.name]!”</i> Amber says excitedly, waving. <i>“I was </i>just<i> thinking about you!”</i>");
			output("\n\nThe way her stiffly erect, throbbing cock sways beneath her furred underbelly, you were already pretty sure.");
		}
		else if (amberDumbfuckDoses() == 2) output("<i>“Oh, my favorite person!”</i> Amber says, grinning. <i>“Hi, [pc.name]. Don’t s’pose you’re interested in some relaxing downtime on my bed…”</i>");
		else if (amberDumbfuckDoses() == 1)
		{
			output("<i>“Hi, [pc.name]!”</i> Amber says, smiling. <i>“You here for some chit-chat, or…”</i>");
			output("\n\nThe way she trails off while her gaze slowly travels downward from your face leaves little to the imagination.");
		}
		else output("<i>“Hey, [pc.name]!”</i> Amber says, her ears flitting above her head as she turns to regard you with a smile on her face. <i>“Whatcha doing?”</i>");
	}
	amberMainMenu();
}
//returns number of doses of dumbfuck she has taken
public function amberDumbfuckDoses():int
{
	if (flags["AMBER_DUMBFUCK"] == undefined) return 0;
	
	return flags["AMBER_DUMBFUCK"];
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

	addButton(14,"Leave",crew);
}
//look at amber
public function amberOnshipAppearance():void
{
	clearOutput();
	amberHeader();
	var timeframe:int = 14400; //10 days
	
	output("Amber is a deertaur, all smooth fur and dainty legs from the hips down. Her thick hair reaches down to her shoulders, dark red at the roots and brightening as it reaches the tips. Two animal ears protrude through it from the sides of her head, as articulate as they are distracting. Her eyes are a light blue and her little button nose sits above a mouth often pulled into a genial smile or a humorous smirk.");
	output("\n\nFreckles spot her skin, dappling her cheeks and shoulders for a start. Some even spot her plump breasts, not quite as big as they might get on other ‘taurs but enough to draw your gaze. Both her nipples and areolae are a luscious pink that matches her lips. Being fairly athletic, Amber is quite lean though not outright skinny. Her hips have an attractive curve to them that seamlessly meets with her tauric half, extending back a few feet.");
	output("\n\nHer brown fur is");
	
	if (flags["AMBER_BRUSHED"] == undefined || GetGameTimestamp() - timeframe > flags["AMBER_BRUSHED"]) output(" a little messy, as you’d expect from having lived in a jungle.");
	else output(" sleek and shiny, your bond evident in its perfect sheen.");	
	output(" White spots are scattered across her haunches and parts of her body are wholly white, like her soft underside.");
	
	output("\n\nImpossible to ignore when you’ve known Amber as carnally as you have, her oversized pink equine cock");
	if (amberDumbfuckDoses() >= 3) output(" is completely stiff against her slim body, ever drooling precum thanks to her insane libido.");
	else output(" hangs underneath her slim body, not completely stiff but always on proud display.");
	output(" Backing it up are");
	
	if (flags["AMBER_EQUILICUM"] != undefined) output(" four massive, hanging balls between her back legs. Each black orb is bigger than your head and filled with thick equine cum, endowing her with massive cumshots rivalling that of hyperpornstars.");
	else output(" two large, hanging balls between her back legs. Each black orb is as big as a clenched fist and full of equine spunk, just waiting to be unleashed.");
	
	output("\n\nAmber’s rear-mounted pussy is tight, wet, and always found to be glistening with moisture when you take a look at it. She’s more than happy to let you check out the goods,");
	if (amberDumbfuckDoses() >= 4) output(" though with how intently she watches you she notices right away when you look, and from there she’s all but begging for you to fuck her dripping cunt right on the spot.");
	else if (amberDumbfuckDoses() == 3) output(" though once she notices your stare she usually starts asking if you’d like to take her right there.");
	else if (amberDumbfuckDoses() == 2) output(" sometimes asking you if you’d like to partake.");
	else if (amberDumbfuckDoses() == 1) output(" occasionally spreading her legs a little just to enhance the view.");
	else output(" letting you stare at her endowments for as long as you wish.");
	output(" Above it lies her slightly puffy asshole, protruding enough to look inviting.");	
	
	output("\n\nAll in all, Amber is both cute and incredibly lurid in the same compact package.");
	pc.lust(5);
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
		output(" <i>“I’ll just give you a quick, um, sum… sum-up of the whole thing.”</i>");
		
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
		output("\n\n“Pyrite Heavy Industries,” you say, grimacing.");
		if (amberWargiiHold()) output(" <i>“Guess they’ve been doing shady shit for as long as I’ve been alive”.</i>");
		else output(" <i>“I’d heard rumors. Pretty easy to believe now.”</i>");
		
		output("\n\n<i>“Yup!”</i> Amber says. <i>“The way I heard the story told, our planetary government basically sold themselves to the mining company for kickbacks. Then up and left with them when they pulled out.”</i>");
		output("\n\n<i>“Just leaving an entire planet of people to run themselves?”</i> you say, incredulous.");
		output("\n\n<i>“So I was told,”</i> Amber nods. <i>“Of course, the actual story could be different. I was very distanced from the events, after all… but honestly, I doubt it.”</i>");
		output("\n\n<i>“Yeah, agreed. I’m sorry, Amber,”</i> you tell her. <i>“I don’t know if it means anything to you, but I promise we’ve never done that and never will. We always negotiate to ensure this kind of thing doesn’t happen.”</i>");
		output("\n\n<i>“Oh, are you in a mining company too?”</i> she asks, smiling. <i>“Wow, that’s ironic. Of all the people to be saved by.”</i>");
		output("\n\n<i>“Haha…”</i> you laugh weakly. <i>“It’s actually more like I </i>am<i> the mining company. I’m the " + pc.mf("heir", "heiress") + " of Steele Corporation.”</i>");
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
		
		output("\n\n<i>“So you started from a planet called Tavros and made your way to M’henga?”</i> she asks.");
		output("\n\n<i>“Yeah. It was pretty much my first stop!”</i> you say.");
		if(flags["MHENGA_PROBE_CASH_GOT"] != undefined || flags["DIDNT_ENGAGE_RIVAL_ON_MHENGA"] != undefined || flags["LOST_TO_DANE_ON_MHENGA"] != undefined) output(" <i>“One of his probes was there, after all. Had to wade through the jungle to get it.”</i>");
		else output(" <i>“One of his probes is there, after all.”</i>");
		
		output("\n\n<i>“And that’s where you met me… wow,”</i> Amber says, shaking her head and wiping her eyes a little. <i>“I’m getting a little misty-eyed here. Haha, not that our first meeting was very romantic!”</i>");
		output("\n\n<i>“Maybe not, but I’ve always been one for unorthodox relationships,”</i> you say, grinning. Your smile fades after a few seconds. <i>“Amber… I’m sorry I couldn’t get you immediately. If I’d known-”</i>");
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
			
			output("\n\n<i>“Oh…”</i> she says, looking crestfallen.");
			output("\n\n<i>“Hey, chin up, that’s what the plan is about,”</i> you say, laying your hand on her shoulder and smiling. <i>“See, people who join my crew tend to be pretty sexually free-roaming. That’s not to say </i>all<i> of them will have sex with you, but I’m sure at least someone will want to help out. So don’t worry, okay?”</i>");
			output("\n\n<i>“So…”</i> Amber starts, looking at you hesitantly. <i>“Do you not care if I have sex with other people, [pc.name]? Uh, because I… I thought you might…”</i>");
			output("\n\nShe trails off, looking a little sad. You shake your head.");
			output("\n\n<i>“You’ve got the wrong idea, Amber,”</i> you say. <i>“You </i>need<i> the help. Plus,”</i> you add with a smile, <i>“if you think I’m not gonna");
			if (flags["DRYAD_BLEWHER"] != undefined || flags["DRYAD_YOURCUNT"] != undefined || flags["DRYAD_ANALEDYOU"] != undefined) output(" swing by to get some of your fat horsecock for");
			else output(" drop by to fuck the heat out of you");			
			output(" myself, you’re gonna be real surprised.”</i>");
			
			output("\n\n<i>“God, I never know what to say when you’re so direct,”</i> Amber mumbles, putting her fingertips to her burning cheeks. <i>“Do other girls have these problems?”</i>");
			output("\n\n<i>“Never had any complaints,”</i> you say, shrugging nonchalantly. <i>“So are you okay with the plan?”</i>");
			output("\n\n<i>“It </i>is<i> a good plan,”</i> Amber admits. <i>“But…”</i> she sighs. <i>“I’m just going to say it. [pc.name], you mean more to me than probably anyone I’ve ever met. I’ve never been in love, or even felt it. I don’t really know much about it, if anything. But I know that you’re special to me in some way, and you always will be.”</i>");
			output("\n\n<i>“Amber, it’s not like you’re gonna die if you have sex with another person,”</i> you sigh.");
			output("\n\n<i>“I know! But I’m telling you this </i>now<i> so you know in advance that it’s the heat controlling me and using my mouth to say dumb things,”</i> she says, looking at you meaningfully. <i>“I feel like telling you </i>after<i> I heatfuck one of your crew hard enough to make both of us scream would be a little pointless.”</i>");
			output("\n\n<i>“Okay. And thanks, Amber,”</i> you say, leaning back and smiling again. <i>“You’re special to me too, it’s why you’re here. I just want to make sure you’re taken care of.”</i>");
			output("\n\n<i>“I know,” she says, smiling back. “And thank you, </i>Captain<i>.”</i>");
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
		output("\n\n<i>“So what happened?”</i> you ask. <i>“How did you end up on M’henga all alone?”</i>");
		output("\n\n<i>“Ah,”</i> she replies, smirking. <i>“Thanks to bureaucracy.”</i>");
		output("\n\n<i>“I mean, I’ve seen enough of it to believe that,”</i> you sigh.");
		output("\n\n<i>“Ha!”</i> Amber says, snickering. <i>“Well, after a few years - maybe ten, or something - the UGC decided to respond to, in their words, an ongoing humanitarian crisis. They arrived in gigantic ships, taking everyone off planet. Everyone who wanted to go, anyway.”</i>");
		output("\n\n<i>“Surely everyone wanted to go?”</i> you ask.");
		output("\n\n<i>“The vast majority, yeah,”</i> Amber agrees, nodding. <i>“No-brainer, right? Eke out a miserable existence or take a shot at a new one. Though I ended up doing the former in the end anyway when I got here. ‘Til I met you, [pc.name],”</i> she says, winking at you.");
		output("\n\n<i>“None of your friends came with you?”</i>");
		output("\n\n<i>“They didn’t get a choice,”</i> Amber shrugs. <i>“The UGC just split people up and spread them out all over the galaxy, redistributing us to new planets. I got dumped here with a few hundred other people and we all kinda just went our separate ways. I uh,”</i> she says, grimacing, <i>“didn’t really handle the new life well.”</i>");
		output("\n\n<i>“Is that how you ended up with all the mods?”</i>");
		output("\n\n<i>“Uh huh,”</i> she sighs. <i>“I wanted something to take my mind off it all and turned to drugs.”</i> Amber shrugs, then laughs hollowly. <i>“Well, it worked!”</i>");
		output("\n\n<i>“Amber…”</i> you murmur. She’s still hurting even now, behind the smile.");
		output("\n\n<i>“Hey, it’s not all bad,”</i> Amber reassures you, smiling a little more genuinely now. <i>“We’ve had a lot of really, really good sex.”</i>");
		output("\n\n<i>“That </i>is<i> true,” you admit. <i>“So hey, sorry to keep prodding at you like this, but I’ve always wondered: were you always a centaur?”</i>");
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
		output("\n\n<i>“It’s great!”</i> Amber says, spreading her arms wide. <i>“I love it. Everything’s so much more </i>fun<i> here! Especially when we fuck,”</i> she murmurs, putting a finger to her lips. <i>“I looove that part…”</i>");
		output("\n\n<i>“I’ll bet you do,”</i> you say, grinning at the docile deertaur. <i>“No complaints, then.”</i>");
		output("\n\n<i>“Nooope!”</i> she says, eyeing you. <i>“Well, if you wanna pay my cock some attention…”</i>");
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
	output("\n\n<i>“No, it’s okay,”</i> Amber says, grinning a little. <i>“I can see why you’d wanna make sure given how ‘enthusiastic’ I can get… ahem!”</i> She coughs, her cheeks flushing a little. <i>“Anyway, that’s a little complicated.”</i>");
	output("\n\n<i>“Complicated?”</i> you echo. <i>“Why’s that?”</i>");
	output("\n\n<i>“Well, originally I would have done anything to be rid of it,”</i> Amber explains, pressing her fingertips together. <i>“I was more animal than person, constantly fading in and out of being in control of my own body. Just looking for someone to stick my cock in. And then you,”</i> she falters, her expression softening as she looks at you. <i>“You saved me. I don’t have to worry about that any more.”</i>");
	output("\n\n<i>“Sorry, I’m still- still getting used to that part,”</i> she adds, hanging her head a little. You take a step forward and put your hand against her warm, freckled cheek to comfort her. Leaning into your touch, she closes her eyes and smiles.");
	output("\n\n<i>“Well,”</i> she eventually continues, <i>“now that I’m with you, </i>everything’s<i> different. I mean, I have a place to live, sleep, and even eat! I have…”</i> she trails off, raising her head and opening her eyes full of shimmering, unspilled tears. <i>“I have a reason to live.”</i>");
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
	output("\n\n<i>“I’m sorry to dump that on you,”</i> Amber says, grimacing. <i>“I mean it. I don’t like that I’m weighing you down with personal stuff. But…”</i> she sighs. <i>“I can’t do it myself. I wouldn’t know where to start, or who to see. I’ve barely interacted with anyone in the past few years. I uh, I don’t know if I can really even handle a real society.”</i>");
	output("\n\n<i>“It’s okay,”</i> you murmur, rubbing one of her soft, furred ears. <i>“It’s okay to be nervous, Amber. And don’t worry, I can handle responsibility.”</i>");
	output("\n\n<i>“Mmmm,”</i> she hums, leaning into your caress.");
	output("\n\n<i>“So you don’t mind being cured or not?”</i> you ask, leaning in to rub her other ear too. <i>“What if it turns you back into a human?”</i>");
	output("\n\n<i>“Nnnnh… I wouldn’t be too bothered,”</i> she sighs, happily letting you stroke her ears. <i>“I might miss these ear rubs though…”</i>");
	output("\n\nSo in the end, the resolution lies with you. You could cure her, leave her as she is - she doesn’t seem to mind too much either way now that she’s with you - or maybe even change her a little yourself. You don’t think she’d mind, and might even be keen to try out some of them.");

	pc.lust(10);
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
		output("\n\n<i>“Hoho, I thought you might end up asking about this,”</i> Amber says, grinning. <i>“What kind? Honestly, there’s a small part of me that thinks being some kind of a… a sexual beast or something, is really hot. So if you wanted to spice me up a little, well…”</i> she murmurs, hooding her eyes and smiling devilishly at you. <i>“I wouldn’t say no.”</i>");
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
		if (pc.hasItemByClass(Dumbfuck, 1)) addButton(0, "Dumbfuck", amberOnshipTalkDumbfuck,undefined,"Dumbfuck","Increase Amber's libido at the cost of some intelligence. Four times only.");
		else addDisabledButton(0, "Dumbfuck", "Dumbfuck", "If you had some Dumbfuck, you could boost Amber’s libido.");
		if (flags["AMBER_EQUILICUM"] == undefined)
		{
			if (pc.hasItemByClass(Equilicum, 1)) addButton(1,"Equilicum",amberOnshipTalkEquilicum,undefined,"Equilicum","Give her Equilibricum, boosting her cum production and capacity. One time only.");
			else addDisabledButton(1,"Equilicum","Equilicum","If you had some Equilibricum, you could boost Amber’s cum production and capacity.");				
		}
		else addDisabledButton(1,"Equilicum","Equilicum","You have already given her a dose.");	
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
		output("\n\n<i>“Pleeeaaase gimme the candy, [pc.name],”</i> Amber begs, pouting and giving you puppy eyes. <i>“I wanna get dumbfucked again… I’m so fucking horny!”</i>");
	}
	else if (amberDumbfuckDoses() == 1)
	{
		output("<i>“So,”</i> you say, holding up a small purple pill between your fingertips in a narrow V. <i>“Wanna go another round?”</i>");
		output("\n\n<i>“You know it!”</i> Amber says cheerily, her hooves pitterpatting on the floor in excitement. <i>“Dumbfuck me up, cutie. Then take your stud for a ride!”</i>");
	}
	else
	{
		output("<i>“Yeah, actually, I got you these,”</i> you say, showing her a handful of small purple pills. She gives them an interested gaze, reading off the imprinted label.");
		output("\n\n<i>“D-U-M-B-F… Oh wow, that’s kinda blatant,”</i> Amber laughs, ruffling her bright red hair and letting it run down her shoulder. <i>“But I’ve gotta be honest,”</i> she murmurs, biting her lip, <i>“even just the thought of what the name implies makes me kinda horny.”</i>");
		output("\n\n<i>“‘Attagirl,”</i> you say, grinning before your expression softens somewhat. <i>“It’s just like you think, though. You’ll lose a bit of smarts if you take it and gain a lot - a </i>lot<i> - of libido. The more you take, the more pronounced it is.”</i>");
		output("\n\n<i>“I like how the first idea that occurs to you is to give me a drug that makes my heat </i>worse<i>,”</i> Amber teases, sticking her tongue out at you. <i>“The side effects, well. I don’t really care, [pc.name]. I know you’ll take care of me.”</i>");
		output("\n\n<i>“Alright. But you do know,”</i> you say, inclining your head, <i>“that you’re not gonna think the same way after you take some. It’s pretty likely that you’ll lose what lingering inhibitions you have. At that point, if I ask you to take more, you probably won’t even think about refusing. Your well-being will be entirely within my hands, Amber.”</i>");
		output("\n\n<i>“Isn’t it already?”</i> she says casually, arching an eyebrow.");
		output("\n\n<i>“I mean, yeah, in a manner of speaking…”</i> you start before Amber waves you off, smiling.");
		output("\n\n<i>“Sorry, just giving you a hard time,”</i> she says. <i>“I know. Look, [pc.name], I haven’t had… the greatest life so far. Meeting you has definitely been the high point of it all. If you think it’d be hot to turn me into a drooling bimbo fuckbeast that’s always happy and always down for a rutting, well… look, all I’m saying is that it could be an improvement,”</i> she finishes, shrugging. <i>“I wouldn’t mind being your hot and ready bimbo stud. Well, more than I already am.”</i>");
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
		output("  <i>“I wanna fill you!”</i>");
		
		output("\n\n<i>“We can do that,”</i> you tell the overexcited deertaur, smiling down at her while she pants red-faced. <i>“We can do anything we want.”</i>");
		output("\n\nAmber bowls you over in her eagerness and");
		
		if (flags["AMBER_RECRUIT_FUCK"] == 1)
		{
			output("  has her massive, seed-spewing cock between your lips in a second. Then she’s bouncing her dainty hips and crying out in utter ecstasy, spilling what must surely be a gallon of fresh, thick sperm right down your throat and into your stomach. Still sensitive from her first orgasm, it doesn’t take long for her to cum a second time in a row, shoving herself to the hilt in your face and grunting savagely.");
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
		output(" Amber mumbles as she closes her eyes. <i>“Or anything else. Really, I just can’t… get enough of you…”</i>");
		
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
		output("\n\n<i>“Sooo…”</i> she says.");
		output("\n\n<i>“Yeah, so,”</i> you say, approaching her side as she turns to look, <i>“guess I forgot to mention this, but the way it works is that the pill lasts 24 hours. Each time you cum during those 24 hours makes you dumber, hornier, and overall just more of a breeder bitch.”</i>");
		output("\n\nYou can see her cock pouring from her sheath at your words, a little shiver of excitement running through her body.");
		output("\n\n<i>“So… wanna get started, then?”</i> Amber purrs.");
		output("\n\nYou spend the next three hours locked in carnal bliss with Amber in your shower, her thick, strong cock spurting massive gouts of seed while she shudders and groans, brought to the peak and unable to resist. You haven’t seen her so driven to cum since you first met her in the forest, her oversized balls pumping out what must be record levels of spunk for her. The only reason you stop is because she’s panting like a bellows, moaning in utter bliss, and you’re not sure how far down the ladder she is.");
		output("\n\n<i>“Wowee,”</i> she says finally, lying down in the shower as you turn the water on her. <i>“That was amazing, [pc.name]! I don’t even feel that different, though.”</i>");
		output("\n\nSuddenly, despite warm water coursing over her tired, furred form, she sneezes. <i>“Oof! Geez, that was- snnkkrt!”</i>");
		output("\n\nShe sneezes again, more violently this time, her head rocking forward with the force of it. Shaking her head, she looks at you confused. <i>“Gosh, [pc.name], you didn’t say nothing about sneezing! Is this me, or the drug?”</i>");
		output("\n\n<i>“Relax, Amber, I’m pretty sure it’s the drug,”</i> you tell her, rubbing her head with one hand and dousing her in water with the nozzle in your other.");
		output("\n\nShe sneezes twice more, rubbing at her nose, and seems to be done. You clean her up and get her back into your room, looking at her with interest.");
		output("\n\n<i>“So, feel any dumber?”</i> you joke.");
		output("\n\n<i>“Haha, jerk!”</i> Amber giggles, poking her tongue out. <i>“Uuuh, not really though. I mean, I was never that smart in the first place. I was homeless, remember?”</i>");
		output("\n\n<i>“Right, yeah. Any other effects?”</i> you ask.");
		output("\n\n<i>“So, I just got done cumming my brains out, thanks to you,”</i> she says, smirking, <i>“so I’m not </i>that<i> horny… but I could go again right now, if we wanted. In fact, I’m pretty sure we could fuck and never stop.”</i>");
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
		if (flags["AMBER_RECRUIT_FUCK"] == 1) output(" <i>“I wanted you to fuckin’ pound my brains out… lame.”</i>");
		else output(" <i>“I wanted to fuckin’ pound your asshole some more… lame.”</i>");
		
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
	output("\n\n<i>“Explanations first,”</i> you say, holding up a hand before dropping it and looking at the needle.<i> “Well, it’s not complicated. It makes your balls grow and you cum more. Even the side effects are pretty minor…”</i>");
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
	output(" <i>“Nnnnnn…”</i>");
	
	//her ass, she came, no change
	if (pc.hasCock()) amberFuckAHole(4,true,false);
	else
	{
		IncrementFlag("DRYAD_FUCKED");
		IncrementFlag("DRYAD_ANALED");
		flags["AMBER_LASTCUM"] = GetGameTimestamp();
		pc.orgasm();
	}
	
	output("\n\n<i>“Uhhhh, [pc.name],”</i> Amber groans, still lost in the wilderness of bliss with only your name to guide her back. The gigantic loads pouring from her flexing cock eventually diminish in vigor and length, until she’s all but empty but still like putty in your hands. <i>“Ooohhh, god…”</i>");
	output("\n\n<i>“Feeling better?”</i> you murmur to her.");
	
	output("\n\n<i>“Hhhhooo, yes,”</i> she breathes, thrusting herself back into you slowly. She’s stroking her own newly enlarged prostate across the end of your");
	if (pc.hasCock()) output(" [pc.cockBiggest]");
	else output(" hardlight");	
	output(", stimulating herself into several smaller, weaker anal orgasms. <i>“Oooohhhh… yessss…”</i>");
	
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
		output("  your [pc.vagina " + hole + "]");
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
	
	output("\n\n<i>“Nnnhhh… good girl, Amber,”</i> you murmur, reaching");
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
		output("\n\n<i>“Great!”</i> Amber thrills, smiling wide. <i>“Oh, but my cock’s a little itchy… I know the best way to cure it though.”</i>");
		output("\n\n<i>“Oh yeah? What’s that?”</i> you say.");
		output("\n\n<i>“Having it plunged to the hilt in a lover’s ass,”</i> Amber says, grinning lewdly. The usual red of her face deepens, her freckles losing out to the blush of her cheeks. <i>“Wanna help me out, [pc.name]?”</i>");
		output("\n\n<i>“Well, I kinda wanted to at least check up on if you’re feeling okay after the Dumbfuck first…”</i> you say.");
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
		output("\n\n<i>“Haha, yeah right!”</i> Amber says, rolling her eyes before her tongue traces her upper lip and the strand of precum hanging from her stiff cock snaps, falling to the ground. <i>“Hey, before you go… wanna fuck?”</i>");
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
	output("\n\n<i>“Ooooh…”</i> Amber moans breathily, leaning into your touch. <i>“That’s nice...”</i>");
	output("\n\nBringing your other hand into play too, you soon find your pet dryad transformed into malleable putty. Sighing happily, she pushes herself against your fingers and nuzzles your hand while you affectionately stroke her. Slowly, you begin to taper off with your treatment until she’s resting in your lap, her breath almost silent. It takes a few seconds for her to notice you’ve stopped, and she raises her head almost sleepily to look at you.");
	output("\n\n<i>“Thanks, [pc.name]...”</i> she mumbles, a huge yawn interrupting her followup. <i>“Can you put me to bed..?”</i>");
	output("\n\nYou take Amber to her mattress and pull her blankets over her, tucking her in as she lays her head on the pillow. She’s asleep the moment her eyes close, wrapped in her duvet. You tug one of the corners over an errant hoof sticking out and quietly walk away, leaving Amber to her tranquil slumber.");

	processTime(10 + rand(10));
	pc.lust(15);
	clearMenu();
	addButton(0,"Next",crew);
}

//Give Amber’s soft animal ears a nice fluffing and petting.
public function amberOnshipBrushFur():void
{
	clearOutput();
	amberHeader();
	
	output("<i>“Amber, want some brushes?”</i> you ask while holding up a small brush.");
	if (flags["AMBER_BRUSHED"] == undefined) output(" It’s the type you might use to groom a horse, and you happened to find it among the stuff Urbolg packed on your ship. <i>“Uh… if you care about that kind of thing.”</i>");
	
	output("\n\n<i>“Oh, brushes!”</i> Amber says, clapping her hands together. <i>“Yay!”</i>");
	output("\n\nShe plops herself down in front of you and you kneel to attend to your task, gently brushing the top layer of her fur into place. Her soft skin reflexively quivers as you bring the bristles of the brush through her fine, silky coat, her satisfied humming");
	if (flags["AMBER_BRUSHED"] == undefined)
	{
		output(" gradually falling into a presumably contented silence. It’s only when she begins shaking that you look up at her, hands over her mouth and silently crying.");
		output("\n\n<i>“Amber?”</i> you ask in concern. <i>“You okay?”</i>");
		output("\n\n<i>“It- it’s just,”</i> Amber says, trying to calm herself, <i>“I can’t remember the last time s-someone did this for me…”</i>");
		output("\n\nYou silently reposition yourself to her front and let her put her arms around you, rubbing her back while she weeps.");
		output("\n\n<i>“It’s okay,”</i> you murmur to her. <i>“It’s okay.”</i>");
		output("\n\nYou let Amber cry herself out, years of deadened emotion brought on by a simple act of charity. It’s hard to remember sometimes what with how upbeat she manages to be just how awful her life has been till this point. Gently raising her head, you give her a kiss on the lips and pat her tauric half.");
		output("\n\n<i>“Your fur looks great,”</i> you tell her.");
		output("\n\n<i>“Does it?”</i> she says, sniffling. <i>“Let me take a look…”</i>");
		output("\n\nHer hand in yours, you help Amber to her feet and smile as she turns to look back at herself with a gasp.");
		output("\n\n<i>“Oh, wow!”</i> she says, squeezing your fingers. <i>“It’s all shiny and sleek…”</i>");
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
		output("\n\n<i>“There,”</i> you announce, raising yourself to your feet and offering your hand to Amber. She takes it and follows you up, stretching her legs out before she looks back. <i>“How’s that?”</i>");		
		output("\n\n<i>“It’s great!”</i> Amber thrills, shuffling her hips in excitement. <i>“Hard to believe how much better it looks now!”</i>");		
		output("\n\n<i>“You’re a regular diamond in the rough,”</i> you tell her with a wink.");		
		output("\n\n<i>“A miner [pc.boyGirl] would say that,”</i> Amber says, poking her tongue out teasingly before retracting it and smiling shyly. <i>“Thanks, [pc.name]. I really appreciate you taking care of me like this. Giving me… things I’m missing.”</i>");		
		
		if (amberDumbfuckDoses() >= 1)
		{
			output("\n\n<i>“And the sex,”</i> she adds as an afterthought, grinning. <i>“You can give me </i>that<i> all night long!”</i>");
			output("\n\nYou wave off her casual but starkly lewd advance with a smirk, though you admit the honesty turns you on.");
		}
		else output("\n\n<i>“No problem, cutie,”</i> you say. <i>“I’ll go back upstairs and get you that mirror you were talking about, huh?”</i>");			
				
	}	
	
	processTime(45 + rand(15));
	pc.lust(30);
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
		output("\n\n<i>“Oh, I love it when you talk dirty, [pc.name],”</i> she says coquettishly, fluttering her eyelashes while her massive equine cock hardens beneath her, throbbing and surging with blood. <i>“I hope you’ve got something fun in mind, ‘cuz now I need it fucking </i>bad<i>…”</i>");
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
			output("\n\n<i>“Always,”</i> she replies, winking while her dripping shaft lengthens and hardens even further until her head is flaring with eagerness. <i>“Mmmm… let’s fuck, [pc.name].”</i>");
		}
		else
		{
			output("<i>“How about some more of that fun we talked about before?”</i> you ask Amber, smiling.");
			output("\n\n<i>“Oho, sounds good to me,”</i> Amber says, stretching a little and showing off her bare chest, nipples standing out like studs. She grins. <i>“Where do you wanna start?”</i>");
		}
	}	
	
	clearMenu();
	addButton(0, "Suck Cock", amberOnshipSexSuckCock, undefined, "Suck Cock", "Get on your knees and pay that fat equine cock of hers the respect it deserves.");
	if (pc.isTaur()) addButton(1, "Get Fucked", vaginaRouter,[amberOnshipSexGetFucked,ppAmber.cockVolume(0),1,0], "Get Fucked", "Give Amber your rear to mount and rut.");
	else addButton(1, "Get Fucked", vaginaRouter,[amberOnshipSexGetFucked,ppAmber.cockVolume(0),1,0], "Get Fucked", "Spread your legs to let Amber rut you.");
	if (pc.hasCock() || pc.hasHardLightEquipped()) addButton(2, "Fuck Pussy", amberOnshipSexFuckPussy, undefined, "Fuck Pussy", "Fuck Amber’s pussy good and hard.");
	else addDisabledButton(2, "Fuck Pussy", "Fuck Pussy", "You need a cock or a hardlight to fuck Amber's pussy.");
	
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
	output("\n\n<i>“Oh fuck! Fuck! [pc.name]!”</i> Amber screams out loud, throwing her head back and shoving herself so deep inside you that you suddenly have your lips spread in an O around the thick base of her immense cock as it begins to throb inside your throat. <i>“Fuck! Fuck! Fuck!”</i>");
	output("\n\nShe lets out a long, groaning wail of blissful release as a stream of spunk travels down her shaft to jet into your stomach. Your neck bulges while you submissively suck load after hot load from the plump balls pressed against your chin, Amber beginning to thrust again while she cums. Each time she hilts herself she sings out in joy, another spurt of equine jism splattering into your tummy.");
	output("\n\n<i>“Nnnnnnhhhh! Nnnnnnngggh… Hhhhnnn-!”</i> Amber strains, her underside quivering with the effort of cumming. <i>“Guh! Ffffuck! Nnngh!”</i>");
	output("\n\nListening to her grunts and groans of animal pleasure, you can’t help yourself. You cum all over the floor, untouched and unprovoked save for the throbbing cock embedded in your throat. Eyes rolling back in your head from the lack of air and the submissive pleasure, you sit there limply with your vision swimming as Amber finishes draining her oversized balls into your stomach. Finally satisfied, she withdraws her length from your well-used fuckhole with a light moan, her flare popping free of your lips with a wet slap and a pop.");
	output("\n\n<i>“Oooohhh, I needed that so bad,”</i> Amber sighs deeply, nodding down at you appreciatively. <i>“Thanks, [pc.name].”</i>");
		
	processTime(10 + rand(10));
	pc.lust(100);
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
	output("\n\n<i>“Ooooh… don’t tempt a girl that goes into heat, [pc.name],”</i> Amber says, grinning deviously. <i>“Might find yourself between my legs again.”</i>");

	pc.lust(10);
	
	clearMenu();	
	addButton(0,"Next",mainGameMenu);

}
//have sex with amber suck her cock some more
public function amberOnshipSexSuckCockKeepSucking():void
{
	clearOutput();
	amberHeader();
	
	output("You’re not done yet - her cock is covered in a messy layer of mixed saliva and her own cum, positively dripping with it. It’s your duty as her cocksheath to clean her off so that she doesn’t have to do it herself. You learn forward and, stretching your aching jaw wide, suck her swollen cockhead back into your mouth.");
	output("\n\n<i>“Nn-! Oh!”</i> Amber gasps in surprise, wincing slightly. <i>“Oh, [pc.name]! It’s s-sensitive… oooooh…”</i>");
	output("\n\nShe clearly doesn’t mind <i>that</i> much if the leftover cum splashing across your tongue is any indication. Fuck, just having this monstrous tool inside you brings you pleasure and fulfillment… you could suck on it for her all day if she really wanted, but you can’t imagine her being selfish enough. Letting the tip fall from your [pc.lips], you take her half-hard length in your hands and painstakingly lick it clean, stopping only when it’s almost shining with your saliva.");
	
	output("\n\n<i>“Mmm,”</i> Amber murmurs appreciatively,");
	if (pc.hasHair()) output("  running her hand through your hair and");
	output(" scratching behind your [pc.ears] a bit. <i>“Your taste is showing, [pc.name]. Maybe I should pin your face under me the next time I go into heat, huh?”</i>");
	
	output("\n\nShe gives you a wink and a friendly smile. <i>“Kidding. Well, maybe not. I do get uh, pretty wild when it’s bad.”</i>");
	output("\n\n<i>“I don’t think I’d mind </i>too<i> much…”</i> you mutter.");
	output("\n\n<i>“Hey, I’ll remember that,”</i> Amber growls into your ear affectionately. <i>“Cutie.”</i>");
	output("\n\nShe gives you a gentle kiss on the cheek and pulls back with a smile. <i>“Gonna go do adventure things, I take it?”</i>");
	output("\n\n<i>“Probably, or maybe…”</i> you trail off, gaze flicking downwards to between her legs.");
	output("\n\nAmber smirks, crossing her arms and spreading her forelegs just a little bit to give you a better look at her impressive hardware. <i>“Hey, I’ll be here if you need me to give you some more attention, [pc.name]. You just let me know, okay?”</i>");
	
	pc.lust(20);
	
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
		if (flags["AMBER_EQUILICUM"] != undefined) output(" quartet of");		
		output(" fat, swinging balls slapping against your [pc.skinFurScales].");
	}
	else
	{
		output(" She starts almost calmly, slowly, but you can feel the way desire creeps into her with every inch of ground she gains inside you. Each thrust is just a little harder, a little deeper than the one that came before, and soon enough she’s given way entirely to the flood of lust driving her onwards. It took longer than it otherwise might have, but soon her");
		if (flags["AMBER_EQUILICUM"] != undefined) output(" quartet of");	
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
	else output("  your [pc.feet] lift from the ground momentarily.");	
	
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
		output("\n\n<i>“Amber…”</i> you moan, feeling her pounding you so deep inside. <i>“Fuck me like we’re back in the jungle, Amber! Nnnngh! You horny stud!”</i>");
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
			if (pc.cumQ() >= 20000) output(" even larger and stronger than");
			else if (pc.cumQ() >= 10000) output(" just as big and strong as");
			else if (pc.cumQ() >= 5000) output(" almost as big and every bit as intense as");
			else output(" smaller but no less intense than");			
			output(" her own.");	
		}
	}
	else
	{
		if (pc.hasCock())
		{
			output("\n\nYour [pc.cockBiggest] spurts up and down, swinging in time with Amber’s weakening thrusts into your wet, cumming cunt. You all but milk");
			if (flags["AMBER_EQUILICUM"] != undefined) output(" Amber’s massive, squirting loads out of her");	
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
				if (flags["AMBER_EQUILICUM"] != undefined) output(" swelling it outwards with the sheer amount of her seed.");	
				else output(" filling it to the brim with her essence.");
			}
			
		}
		else
		{
			output("\n\nYou all but milk");
			if (flags["AMBER_EQUILICUM"] != undefined) output(" Amber’s massive, squirting loads out of her");	
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
				if (flags["AMBER_EQUILICUM"] != undefined) output(" swelling it outwards with the sheer amount of her seed.");	
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
		output("\n\n<i>“O-one more,”</i> Amber pants, shifting above you. <i>“Gotta… gotta cum more…”</i>");
		output("\n\nYou don’t have too much of a choice in the matter, and besides… she <i>does</i> feel really nice inside you. You quickly bend to her will, letting her line herself up and begin pounding you all over again. With both of you a little fatigued, Amber’s fine control suffers. Her thrusts are desperate, long and deep affairs that leave your head spinning and your insides coiling around her in need.");
		if (pc.hasCock()) output(" Even with your cock half-hard, you can feel yourself getting pushed towards another orgasm.");
		
		output("\n\n<i>“Oooooh fuck,”</i> Amber groans, getting a little bit of her groove back once she’s started working you over again. <i>“Cumming again…”</i>");
		output("\n\nThough her reaction is a lot more muted this time around, the sensation is no less impressive. You’re flooded with her seed once more, the excess spraying back out and coating her");
		if (flags["AMBER_EQUILICUM"] != undefined) output(" four massive swinging balls, each one bigger than your head.");	
		else output(" two fat, swinging balls, each almost as big as your head.");		
		output(" You can feel her cumvein thrumming inside you, each load fountaining from the end of her tip to splatter your insides.");
		
		output("\n\nYou cum sometime through her long, drawn-out orgasm, shutting your eyes and shuddering in pleasure while she pumps you full. She’s so <i>intense</i> - sex with Amber in this state is a little tiring, but oh so worth it. You’re pretty sure she could make you cum one for one and never stop if she really wanted…");
		
		processTime(10 + rand(10));
		amberFuckAHole(hole, true, true);
		
		if (amberDumbfuckDoses() >= 4)
		{
			output("\n\n<i>“O-one more,”</i> Amber huffs, staggering forward. <i>“I still need to cum more inside you, [pc.name]!”</i>");
			if (pc.isTaur()) output("\n\nShe reaches forward and grabs you around the chest, pulling you back and lightly biting and sucking on your exposed neck while she begins to fuck you once more. You can’t help but groan in pleasure - Amber is nothing if not persuasive. You’re not sure you have the time to stand here all day and get fucked, but she’s making a very convincing argument for in favor. Besides, it’s just once more...");
			else output("\n\nShe leans down, pressing you into the crate you’re draped over and rubbing you with her furred underbelly. The way she’s massaging your insides, you can’t help but groan in pleasure - Amber is nothing if not persuasive. You don’t know that you have the time to lie under her all day and get fucked, but she’s making a very convincing argument for in favor. Besides, it’s just once more…");
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
		output("\n\n<i>“Ooohhh shit,”</i> Amber sighs, at last running dry and beginning to pull herself free. You both groan when she pops out, her oversized head coming out of you with a deluge of warm spunk following. <i>“Fuck… that’s hot.”</i>");
		output("\n\n<i>“Nnnnh…”</i> you moan, looking back at her with a smile. <i>“You like seeing me like this, Amber? All full of your hot, thick seed freshly squeezed from your big cock?”</i>");
		output("\n\n<i>“Don’t tease meee,”</i> she groans, turning her head away but still watching the way her sticky jizz rolls down your shaky [pc.legs] with her eyes. She’s anything but subtle, this girl.");
		
		output("\n\n<i>“Well, don’t worry,”</i> you say,");
		if (!pc.isTaur()) output(" rising to your feet and");		
		output(" turning back to her. <i>“I’m pretty sure you’ll get another chance to fuck me, lover.”</i>");
		
		output("\n\nAmber steps forward and kisses you immediately, wrapping her tongue around your own and embracing you with all her might. She touches you all over, running her hands up your [pc.chest] and your back, caressing your face");
		if (pc.hasHair()) output(" and running her fingers through your [pc.hair]");		
		output(".");
		
		output("\n\nShe blows a few strands of her own bedraggled red hair out of her face and looks at you, smoldering.");
		output("\n\n<i>“God, you’re amazing, [pc.name],”</i> she murmurs.");
		output("\n\n<i>“Why thank you,”</i> you reply, smiling back at her and brushing the rest of her hair back. <i>“You’re pretty good yourself.”</i>");
		output("\n\n<i>“Let’s do this again soon,”</i> Amber says, before amending herself. <i>“Real soon.”</i>");
		output("\n\n<i>“Like it that much, huh?”</i> you ask with a grin, unable to help yourself.");
		output("\n\n<i>“Fuck yes,”</i> she replies, dead serious. <i>“If I could spend the rest of my life with my cock inside you… mm.”</i> She shivers with lust before focusing on you again, lips curling upwards in a smile. <i>“Like I said. Let’s do this again soon.”</i>");
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
	output(" leaking Amber’s jizz and your stomach swollen with it. So this is what Dumbfuck does to a person’s libido, you think, rolling your eyes and resting your head on Amber’s stomach. What a ride…");
	
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
	output("\n\nYou lose count of how many times the two of you cum and forget how much time has passed. Neither matters in the face of the fact you can just keep getting rut, Amber’s insistent mating only coming to an end when she at last falls onto the bed beside you. Though it takes some tugging and encouragement, you get her completely up on the mattress alongside you and fall asleep next to her, wrapped in each other’s arms. You’ll clean it all up tomorrow…");
	
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
	output("\n\n<i>“Aww… fine,”</i> Amber moans dejectedly. <i>“I still love you though.”</i>");
	output("\n\nYou reply by way of caressing her face and planting a long, lingering kiss on her pretty lips, eyes closed and your fingers running through her hair. She pulls away with a dopey smile and winks at you, giggling as she leaves your room and heads back down to the hold. You can still smell her lingering sex pheromones.");
	
	clearMenu();	
	addButton(0,"Next",mainGameMenu);
}

//have sex with amber take her pussy
public function amberOnshipSexFuckPussy():void
{
	clearOutput();
	amberHeader();
	
	output("<i>“Turn around,”</i> you say, twirling a downward-pointing finger.");
	if (amberDumbfuckDoses() >= 4) output("\n\nAmber not only turns around to present herself but takes a few steps back towards you and spreads her legs, lewdly displaying her winking, drooling sex. She looks back at you, desire writ large on her lust-reddened face. <i>“Fuck me…”</i>");
	else if (amberDumbfuckDoses() == 3)	output("\n\n<i>“So long as we’re fucking, I’m up for anything,”</i> Amber giggles, turning and presenting her ass with a flourish. She spreads her legs and you can see her sex glistening, already dripping with need. <i>“So? Whatcha waiting for?”</i>");
	else if (amberDumbfuckDoses() == 2)	output("\n\n<i>“Ooh, yeah, I’m already all wet,”</i> Amber says, turning to present herself. With her legs spread and her sex on display, you can see she’s telling the truth. <i>“Come on, [pc.name].”</i>");
	else if (amberDumbfuckDoses() == 1)	output("\n\n<i>“Gonna fuck one of my holes, [pc.name]?”</i> Amber asks, turning around and smirking back at you. <i>“Take your pick…”</i>");
	else output("\n\n<i>“Oh, wanna take a look at what’s on offer? Here,”</i> Amber purrs, turning. <i>“See anything you like, [pc.name]?”</i>");
	
	output("\n\nYou approach without saying anything, placing your hands on Amber’s curvy rump. She’s more than ready for you without foreplay.");	
	if (!pc.isCrotchExposed()) output(" Hastily disrobing, you");	
	else output(" You");
	if (pc.isTaur())
	{
		output(" rear up and mount the needy girl, letting her feel your weight upon her back before you start aligning your");
		if (pc.hasCock()) output(" [pc.biggestCock].");
		else output(" hardlight.");
	}
	else
	{
		output(" rub your");
		if (pc.hasCock()) output(" [pc.biggestCock]");
		else output(" hardlight");	
		output(" over her slick pussylips, noting her little quiver when the tip touches her oversized clit.");
	}
	
	output("\n\nAmber groans in pleasure when you enter her, shuddering as you push forward until");
	if (pc.hasCock())
	{		
		if (pc.biggestCockLength() >= 25) output(" you’ve bottomed out inside her, your [pc.cockHeadBiggest] pressed snugly against her womb.");
		else if (pc.biggestCockLength() >= 18) output(" you’ve impaled her on your impressive length, your [pc.cockHeadBiggest] pressed snugly against her womb.");
		else if (pc.biggestCockLength() >= 9)
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
		if (flags["AMBER_EQUILICUM"] != undefined) output(" massive");
		output(" seed-filled balls tightening between her dainty hindlegs already.");
	}
	
	if (pc.hasCock()) pc.cockChange();
	
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
	if (flags["AMBER_EQUILICUM"] != undefined) output(" violent jets of equine spunk sloshing onto");
	else output(" thick squirts of equine spunk spattering against");	
	output(" the ground in front of her. That’s something you love about the centaur girl: her body’s <i>always</i> honest about what it likes.");
		
	output("\n\n<i>“Ooohhh fuck, you’re so gooood,”</i> Amber pants, almost pleading in her tone. <i>“Fuuuck!”</i>");
	
	output("\n\n<i>“You like it rough, Amber?”</i> you grunt, pounding her squeezing cunt so hard with every thrust that she squirts down your");
	if (pc.isTaur()) output(" legs.");
	else output(" front.");	
	output(" <i>“Want it even rougher?”</i>");
	
	output("\n\n<i>“Yes! Yes!”</i> Amber almost screams, leaning back into you. <i>“Fuck me harder!”</i>");
	output("\n\nYou’re so close to your own orgasm now that you couldn’t resist that even if you tried. You <i>slam</i> her cunt hard enough to make her scream in rapturous pleasure, her cock freely squirting jizz all over the ground. The sensation of her intimate folds clenching down on you finally becomes too much to bear and you groan loudly as euphoria begins to radiate from your nethers. Amber lowers her front and presses back into you, moaning in ecstasy while she holds you tight in her embrace.");
	
	if (pc.hasCock())
	{
		if (pc.cumQ() >= 25000)
		{
			output("\n\n<i>“Oh! Oh, fuck,”</i> Amber cries out, hindlegs shaking violently. <i>“Oh god, fill me up, you fucking stud. Oh, I’m gonna cum-”</i>");
			output("\n\nYou pump Amber’s womb full of [pc.cum] almost instantly, swelling it outwards with every subsequent blast of seed into her. Enthralled by the sensation of your amazing virility she cums on the spot,");
			if (pc.biggestCockLength() > 17) output(" your cock pressed right up against the entrance to her womb.");
			else output(" your cock throbbing inside her.");			
			output(" You’re forced to pull out before she takes on liquid weight to the point of immobility, but fuck if the despairing moan she gives you in response isn’t one of the sexiest things you’ve ever heard.");
			if (amberDumbfuckDoses() >= 3)
			{
				output("\n\n<i>“Gooood, there’s so much cum,”</i> Amber pants, looking back at herself in awe. <i>“It’s all in my womb, so fucking </i>good<i>! More! Please, [pc.name]! I wanna get pregnant!”</i>");
				output("\n\n<i>“Here,”</i> you murmur, walking up and presenting your cock. She starts sucking on it automatically and rolling her eyes in pleasure, tasting a mixture of her own arousal and your jizz and loving it. <i>“Suck on this while I decide, Amber.”</i>");
			}
			else
			{
				output("\n\n<i>“Holy </i>fuck<i> you’re so good,”</i> Amber pants, head down with her messy hair hanging to her hips. <i>“God… you’re an absolute stud.”</i>");
				output("\n\n<i>“I think I know you pretty well by now, Amber,”</i> you say, smiling as she lifts her head back up to look at you. <i>“And I know what you like.”</i>");
				output("\n\nYou brush her hair back out of the dryad’s sweaty, blushed face and plant a kiss on her soft lips, pulling away after a few seconds of intimacy. She lets out a huff of air.");
				output("\n\n<i>“I think I could go for round two,”</i> she offers hopefully, looking back down at herself. <i>“Even though I already look pregnant. Who knows? Maybe you can make it a reality.”</i>");
				output("\n\n<i>“Give me a couple minutes and you might get lucky, then,”</i> you reply, grinning.");
			}
		}
		else if (pc.cumQ() >= 10000)
		{
			output("\n\n<i>“Oh! Oh, fuck,”</i> Amber cries out, hindlegs shaking violently. <i>“Oh god, fill me up, you fucking stud. Oh, I’m gonna cum-”</i>");
			output("\n\nYou pump Amber’s womb full of [pc.cum] almost instantly, swelling it outwards with every subsequent blast of seed into her. Enthralled by the sensation of your amazing virility she cums on the spot,");
			if (pc.biggestCockLength() > 17) output(" your cock pressed right up against the entrance to her womb.");
			else output(" your cock throbbing inside her.");			
			output(" By the time you’re finished with her, she’s had multiple orgasms and has a very obvious pregnant sag to her tummy.");

			if (amberDumbfuckDoses() >= 3)
			{
				output("\n\n<i>“Gooood, there’s so much cum,”</i> Amber pants, looking back at herself in awe. <i>“It’s all in my womb, so fucking </i>good<i>! More! Please, [pc.name]! I wanna get pregnant!”</i>");
				output("\n\n<i>“Here,”</i> you murmur, walking up and presenting your cock. She starts sucking on it automatically and rolling her eyes in pleasure, tasting a mixture of her own arousal and your jizz and loving it. <i>“Suck on this while I decide, Amber.”</i>");
			}
			else
			{
				output("\n\n<i>“Holy </i>fuck<i> you’re so good,”</i> Amber pants, head down with her messy hair hanging to her hips. <i>“God… you’re an absolute stud.”</i>");
				output("\n\n<i>“I think I know you pretty well by now, Amber,”</i> you say, smiling as she lifts her head back up to look at you. <i>“And I know what you like.”</i>");
				output("\n\nYou brush her hair back out of the dryad’s sweaty, blushed face and plant a kiss on her soft lips, pulling away after a few seconds of intimacy. She lets out a huff of air.");
				output("\n\n<i>“I think I could go for round two,”</i> she offers hopefully, looking back down at herself. <i>“Even though I already look pregnant. Who knows? Maybe you can make it a reality.”</i>");
				output("\n\n<i>“Give me a couple minutes and you might get lucky, then,”</i> you reply, grinning.");
			}
			
		}
		else if (pc.cumQ() >= 6000)
		{
			output("\n\n<i>“Oh, oohhh, </i>oooohhhh<i>,”</i> Amber moans, her hindlegs shaking with the effort of keeping herself upright. <i>“Oh, there’s so much…”</i>");
			output("\n\nYou cum in Amber’s pussy so hard she almost slips, a back leg sliding out of place while you buck into her. It doesn’t seem like she cares, too busy moaning while");
			if (pc.biggestCockLength() > 17) output(" your [pc.cum] pumps into her womb and fills it to swelling with [pc.cumColor] seed.");
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
		else if (pc.cumQ() >= 3000)
		{
			output("\n\n<i>“Oooohhh I can feel it,”</i> Amber moans, her hindlegs shaking with the effort of keeping herself upright. <i>“All the way inside…”</i>");
			output("\n\nYou cum in Amber’s pussy so hard she almost slips, a back leg sliding out of place while you buck into her. It doesn’t seem like she cares, too busy moaning while your [pc.cum] paints her passage [pc.cumColor].");
			if (amberDumbfuckDoses() >= 3)
			{
				output("\n\n<i>“Nnnnh… fuck me more, [pc.name],”</i> Amber begs, looking back at you. <i>“Please!”</i>");
				output("\n\n<i>“Here,”</i> you murmur, walking up and presenting your cock. She starts sucking on it automatically and rolling her eyes in pleasure, tasting a mixture of her own arousal and your jizz and loving it. <i>“Suck on this while I decide, Amber.”</i>");
			}
			else
			{
				output("\n\n<i>“Holy </i>fuck<i> you’re so good,”</i> Amber pants, head down with her messy hair hanging to her hips. <i>“God…”</i>");
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
				output("\n\n<i>“Nnnnh… fuck me more, [pc.name],”</i> Amber begs, looking back at you. <i>“Please!”</i>");
				output("\n\n<i>“Here,”</i> you murmur, walking up and presenting your cock. She starts sucking on it automatically and rolling her eyes in pleasure, tasting a mixture of her own arousal and your jizz and loving it. <i>“Suck on this while I decide, Amber.”</i>");
			}
			else
			{
				output("\n\n<i>“Holy </i>fuck<i> you’re so good,”</i> Amber pants, head down with her messy hair hanging to her hips. <i>“God…”</i>");
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
			output("\n\n<i>“Nnnnh… fuck me more, [pc.name],”</i> Amber begs, looking back at you. <i>“Please!”</i>");
			output("\n\n<i>“Here,”</i> you murmur, walking up and sliding the dripping hardlight between her pink lips. She starts sucking on it automatically and rolling her eyes in pleasure, tasting her own arousal and loving it. <i>“Suck on this while I decide, Amber.”</i>");
		}
		else
		{
			output("\n\n<i>“Holy </i>fuck<i> you’re so good,”</i> Amber pants, head down with her messy hair hanging to her hips. <i>“God…”</i>");
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
		
	clearMenu();
	addButton(0, "Leave", amberOnshipSexFuckPussyLeave);
	if (amberDumbfuckDoses() >= 3) addButton(1, "Again", amberOnshipSexFuckPussyAgain);

}
//have sex with amber take her pussy leave
public function amberOnshipSexFuckPussyLeave():void
{
	clearOutput();
	amberHeader();
	
	output("<i>“Alright, I’ll be back soon,”</i> you promise the dryad");
	if (amberDumbfuckDoses() >= 3)
	{
		output(" withdrawing");
		if (pc.hasCock()) output(" your [pc.biggestCock]");
		else output(" the hardlight");
		output(" from her mouth as she moans in disappointment");
	}
	output(".");
	
	if (amberDumbfuckDoses() >= 4)
	{		
		output("\n\n<i>“Noooo,”</i> she insists, reaching for");
		if (pc.hasCock()) output(" your saliva-slathered dick. <i>“Fuck my little cunt! Please!”</i>");
		else output(" the hardlight. <i>“Put it back on and fuck my cunt! Please!”</i>");
		
		output("\n\n<i>“I’ve got important things to do, Amber,”</i> you explain to her, her slightly wild eyes meeting yours. <i>“As much as I love you, I can’t always be down here, you know?”</i>");
		output("\n\n<i>“Awww… okay,”</i> Amber sighs. <i>“But next time I wanna fuck at least twice! No, three times!”</i>");
		output("\n\n<i>“Sure,”</i> you say, grinning as you rub her head. <i>“We’ll fuck some more next time we see each other, okay cutie?”</i>");
		output("\n\n<i>“Okay,”</i> she says, smiling. <i>“Bye, [pc.name]!”</i>");
		output("\n\n<i>“Good girl,”</i> you say, smiling as you head back out of the loading bay. She’s needy by necessity, but she’s still a cutie when she wants to be.");		
	}
	else if (amberDumbfuckDoses() == 3)
	{
		output("\n\n<i>“Aaawww,”</i> Amber whines, still greedily eyeing");
		if (pc.hasCock())
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
		output("\n\n<i>“You’ve got yourself a deal,”</i> Amber says, grinning. <i>“You sure drive a hard bargain, [pc.name]. Not to mention your, ah… </i>negotiation techniques<i> are to die for.”</i>");
		output("\n\n<i>“That’s what they tell me,”</i> you say, smirking. <i>“Alright. See you soon, Amber.”</i>");
		output("\n\n<i>“Bye [pc.name]!”</i> Amber calls after you. <i>“Be safe out there.”</i>");		
	}
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);

}
//have sex with amber take her pussy again
public function amberOnshipSexFuckPussyAgain():void
{
	clearOutput();
	amberHeader();
	
	output("You let Amber finish polishing");
	if (pc.hasCock()) output(" your [pc.cockBiggest] with her mouth, sucking you completely clean before you pop it free of her lips proudly erect and ready to go again.");
	else output(" the hardlight with her mouth, sucking it completely clean before you pop it free of her lips ready to be used once more.");
	
	output("\n\n<i>“Alright,”</i> you nod, pointing the sex-hungry dryad towards her bed. <i>“Lie on your back, Amber. More comfortable for both of us that way.”</i>");
	
	if (amberDumbfuckDoses() >= 4)
	{	
		output("\n\n<i>“Yes!”</i> Amber cheers, turning and giddily heading towards her bed. <i>“Fuck me more, [pc.name]. I cum so fucking hard when you plow my pussy!”</i>");
	}
	else if (amberDumbfuckDoses() == 3)
	{	
		output("\n\n<i>“Mmm… I’d let you fuck my pussy no matter what, [pc.name],”</i> Amber says, turning and heading towards the mattress. <i>“You can even fuck me while I’m sleeping if you want.”</i>");
	}
	
	output("\n\nWith Amber laid on her back and looking expectantly at you, there’s no sense in wasting time. She’s already got her first taste of you, after all. Now you just need to satisfy the needy girl.");
	if (pc.isTaur()) output(" Standing over her, you lower your hind half and move your hips until your [pc.cockHeadBiggest] touches the wet warmth of her freshly fucked pussy.");
	else output(" Kneeling before her, you lean forward and let your [pc.cockHeadBiggest] touch the wet warmth of her freshly fucked pussy.");	
	
	output("\n\nYou shove yourself inside and enjoy the way Amber throws her head back, hair flying about her face while you");
	if (!pc.isTaur()) output(" hold her hindlegs and spread them to");
	output(" fuck her as hard as you can. Her");
	if (flags["AMBER_EQUILICUM"] != undefined) output(" fat, heaving quartet of");
	else output(" heavy");	
	output(" balls tighten against her underside in time with the contractions of her flexing cunny, her libido running so rampant that they’re already threatening to coat her in spunk.");
	
	output("\n\nIt doesn’t take long for that to come to fruition, Amber grunting through grit teeth as her equine shaft");
	if (flags["AMBER_EQUILICUM"] != undefined) output(" squirts massive gouts of her spunk");
	else output(" spurts multiple ropes of her spunk");	
	if (pc.isTaur()) output(" between your bodies and");	
	output(" all up her torso. You can feel her primal need, the urge to let out everything she has, and you’re only too keen to indulge her.");
	
	output("\n\nYou spend the next two hours forcing her to cum with her squirting cunny and oversized cock, dominating her at every turn until she has no choice but to scream in utter bliss as she feels release over and over. You make her empty her");
	if (flags["AMBER_EQUILICUM"] != undefined) output(" giant, pulsing");
	else output(" hefty");		
	output(" nuts all over herself, staining her fur with seed and leaving her gasping for air.");
	
	var i:int = 0;
		
	for(i = 0; i < 4; i++)
	{
		processTime(30);
		if (pc.hasCock()) amberFuckAHole(5, true, true);
		else
		{
			IncrementFlag("DRYAD_FUCKED");
			IncrementFlag("DRYAD_HERCUNT");
			pc.orgasm();
		}
	}
	
	output("\n\nAmber’s a complete wreck. Her squeezing pussy");
	if (pc.hasCock()) output(" drips with your seed");
	else output(" twitches around the hardlight");	
	output(", muscles shaking with fatigue. Her deer legs are splayed to the side, and her entire upper body is pasted with her own cum. Her slickened breasts heave up and down as breath enters and leaves her overworked lungs. Despite all that, though, her expression is one of pure ecstasy.");
	
	output("\n\nThough it took you some time, you’ve conquered and subdued her otherworldly libido. You lift yourself off her and step over her prostrate body, presenting");
	if (pc.hasCock()) output(" your still-stiff cock");
	else output(" the hardlight");		
	output(" to her.");
		
	output("\n\n<i>“Suck it until I cum,”</i> you instruct her, and she’s more than willing to repay the favor.");
	
	output("\n\nIt feels so good to finally orgasm after nailing Amber through the fucking floor, so satisfying to feel her");
	if (pc.hasCock()) output(" gulping down your cum");
	else output(" sucking on your sensitive tip");		
	output(" that your expression mirrors her own. She cums a little just feeling you do the same,");
	if (pc.isTaur()) output(" working so hard underneath your bulk that you can feel her devotion.");
	else output(" looking up at you with lidded eyes that suggest complete devotion.");
	output(" You let out a groan of contentment when she’s done, standing back up and stretching.");
	
	
	processTime(10 + rand(10));
	if (pc.hasCock()) amberFuckAHole(6, true, true);
	else
	{
		IncrementFlag("DRYAD_FUCKED");
		IncrementFlag("DRYAD_FACEFUCKED");
		flags["AMBER_LASTCUM"] = GetGameTimestamp();
		pc.orgasm();
	}
	
	output("\n\n<i>“So?”</i> you nod at her. <i>“Feel better?”</i>");
	output("\n\n<i>“I love you so much, [pc.name],”</i> Amber moans, laying back. <i>“Oh, fuck…”</i>");
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
	
	//-1 your ass, 0 to 2 your vag, 3 her dick your mouth, 4 her ass, 5 her vag, 6 your dick her mouth, 7 her vag your mouth, 8 your vag her mouth
	if (hole == -1)  //your ass
	{
		IncrementFlag("DRYAD_ANALEDYOU");
		if (pcChange) pc.buttChange(ppAmber.cockVolume(0), true, true, false);
		pc.loadInAss(ppAmber);
		pc.orgasm();
	}
	else if (hole >= 0 && hole <= 2)  //your vag
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
		if (pc.lust() >= 75 || pc.isBimbo()) pc.orgasm();
	}
	else if (hole == 4)  //her ass
	{		
		IncrementFlag("DRYAD_ANALED");
		if (pcChange) pc.cockChange();
		ppAmber.loadInAss(pc);
		pc.orgasm();
	}
	else if (hole == 5)  //her vag
	{		
		IncrementFlag("DRYAD_HERCUNT");
		if (pcChange) pc.cockChange();
		ppAmber.loadInCunt(pc, 0);
		pc.orgasm();
	}
	else if (hole == 6)  //her mouth
	{
		IncrementFlag("DRYAD_FACEFUCKED");
		ppAmber.loadInMouth(pc);
		pc.orgasm();	
	}
	else if (hole == 7)  //her vag your mouth
	{
		IncrementFlag("DRYAD_CUNHER");
		pc.girlCumInMouth(ppAmber);	
		if (pc.lust() >= 75 || pc.isBimbo()) pc.orgasm();
	}
	else if (hole == 8)  //her mouth your vag
	{
		IncrementFlag("DRYAD_CUNYOU");
		ppAmber.girlCumInMouth(pc);	
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
	
	if (flags["DRYAD_ANALEDYOU"] != undefined  && restrict != 1) sel.push(1);
	
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