/*Basic Concept
Outline
Room Description
After First Time
Talk: Her People
Talk: The War
Talk: Her History
	Talk: Trench Wives?
Talk: Your Mission
Sex: Under Desk
Sex: Storage Closet
	Talk: Refuse
Special: Wanna Feel?
Special: A Warrior’s Honor
Leave
Basic Concept:
Red Myr lady, slim-but-stronk, all domineering and stuff.
Sexy officer uniform, possibly SS-style?
Domineering and forceful, but more <i>“human”</i> than she first appears. (Possibly revealed when discussing the gold diplomat, where she mocks her for everything BUT the war injuries because giving it your all in combat is respectable, sort of a warrior-honor thing?)
Gives a quick-and-dirty explanation of <i>“why we fight,”</i> perhaps to be contrasted with the reasoning of the much more brutal feldmarschall in Kressia?
Lots of talk scenes, more dialogue than fucking. Exposition character? Fuck, probably shouldn’t write exposition characters with so little knowledge of setting. Be sure to pester Fenoxo and/or Savin about that.
Pretty eager for dick if PC has one; offers under-desk oral with femPCs.
Note to self: remember taur/naga support with sex scenes, God dammit
Also: http://i.imgur.com/87L06J5.png


Outline:
Enter room, see description
Diplomat’s kind of annoyed, but that seems to be normal for her. Once you introduce yourself and explain you’re on the planet looking for something, she sees the opportunity to make connections and talks with you after introducing herself (gotta come up with a good name, and see if ranks would roughly translate).
Conversation topics include:
The war, in which she gives a brief history on that shit from the perspective of the Reds and ruminates a little on her own career before being assigned as a diplomat during the ceasefire.
Her own past and history. Nehzara talks about her career as a junior officer on the front lines and her meteoric rise through the ranks only to be handed their equivalent of a full-bird and stuck in an office to mingle with visiting aliens. Will also unlock the <i>“trench wives”</i> topic during repeat interactions.
The PC’s mission and request to get into Kressia to search for probe, wherein she offers to either take PC into the utility closet for a quick bone because <i>“holy shit a dick I want it”</i> or lick her under the desk because she hardly gets any damn release. Can tell which gender PC is by pheromones, which are somewhat similar despite being alien. Herms would probably confuse her, but she may have encountered one among the UGC contingent. Something about genderless, too.
Oh shit some dude ausar or whatever who won’t give her the D should walk in during the under-desk cunnilingus and she gets twice as aroused or something. Maybe fucking forces PC’s face right into dat pussy after the guy leaves. Nnff. Making myself aroused here.
Can talk her out of sex, saying that PC has other shit to offer her or her people in exchange. Gating an area behind sex scenes would be douchey, even in a sex game.
Should probably have some sort of additional reward for humoring her. Maybe a nicer reception at Kressia due to a good word being put in? Maybe make it easier to get an audience with the occupation leader? Bring that up with someone.
PC can now access Kressia from the airstrip. Too bad probe ain’t there. You just licked/fucked an ant’s cunt for nothing, you dumb faggot. Unless you like that, I guess. If you don’t, you’re probably playing the wrong game anyways.
If interested, PC can talk to diplomat again and access more sex options in addition to the two already presented.
PCs can ask about the term <i>“trench wives”</i> and have a quick talk scene in which female PCs can choose to be aroused, which the diplomat will smell because (once again)lol pheromones and takes PC to the closet with her. They start getting a little dominant sapphic lovin’ on before diplomat playfully bites PC and leaves her to marinate in lust while the diplomat goes back to work.
Males and herms can now lick her under the desk, too. Uses the same scene, which will have some calls for PC’s dick being hard or whatever for that reason.
Preggo PCs can get a somewhat cute non-sex scene in which she inquires about what it’s like and possibly feels the belly for motion (I imagine it wouldn’t hard to separate live pregnancies from eggs?), before regaining her composure and resuming normal interaction. She’s a hard bitch, but she wishes she could have the prestige breeding brings... and maybe wants to be a mother, deep down. Maybe have that scene only be available after a few fucks, because it’s kind of personal and revealing.
Something something taurs and nagas
Kaizer finally finishes a TiTS submission and then proceeds to jerk it to things he probably shouldn’t tell others about.
???
Profit and buy penny stocks*/

public function showNehzara(nude:Boolean = false):void
{
	if(!nude) showBust("NEHZARA");
	else showBust("NEHZARA_NUDE");
	if(flags["MET_NEHZARA"] == undefined) showName("RED\nMYR");
	else showName("\nNEHZARA");
	author("Kaizer_Z aka Kaiju");
}

//Room Description
public function nehzaraBonus():Boolean
{
	author("Kaizer_Z");
	showBust("MYR_RED_GUARD","MYR_RED_GUARD");
	//(First Time)
	if(flags["MET_NEHZARA"] == undefined)
	{
		output("You ");
		if(!pc.isNaga() && !pc.isGoo()) output("step");
		else output("slide");
		output(" through a doorless entryway and into a large, cluttered building that reminds you of a warehouse, albeit a terribly organized one. Actually... looking around at all the boxes and parts lying around, that’s exactly what it seems to be. Several myrmedions of the <i>“Red”</i> variety are present, some standing guard with weapons at the ready while others mill about and busy themselves with what looks like cleaning. It doesn’t take a genius to deduce that this area was assigned to them rather recently and that they’re still moving in. You can see numerous individuals of other species moving to and fro: they’re mostly UGC personnel or other unaffiliated parties, since there are quite a few less Gold Myr here than elsewhere in the embassy. Half of the area is dominated by makeshift offices and rooms, and one doorway has two guards positioned on either side of it.");
		//[Guards] (Other option is to go back, which would result in seeing this scene again upon returning. Choosing the <i>“Guards”</i> option is what sets it to the repeat description after.)
		addButton(0,"Guards",nehzaraGuardsFirstTimeMeetingStuff);
		return false;
	}
	//(After First Time)
	else
	{
		//Special: A Warrior’s Honor
		//Procs randomly (maybe 20% chance) one time when entering the warehouse/office room of the map. Only procs if the PC has met Nehzara, Lyralla, and Juro at least once, and has sexed Nehzara.
		if(flags["MET_LYRALLA"] != undefined && flags["MET_JURO"] != undefined && flags["SEXED_NEHZARA"] != undefined && rand(5) == 0 && flags["NEHZ_WARRIORS_HONOR_SCENE_HAPPENED"] == undefined)
		{
			nehzarasWarriorHonor();
			return false;
		}
		
		output("You ");
		if(!pc.isNaga() && !pc.isGoo()) output("step");
		else output("slide");
		output(" into the cluttered warehouse which hosts much of the Scarlet Federation’s embassy staff, taking in the sight of all the ant-like workers hustling about while their soldier sisters look on with boredom.");
		output("\n\nHalf of the area is dominated by makeshift offices and rooms, and one doorway has two guards positioned on either side of it. You can see numerous individuals of other species moving to and fro: they’re mostly UGC personnel or other unaffiliated parties, since there are quite a few less Gold Myr here than elsewhere in the embassy.");
		output("\n\nOne such office has a pair of sentries standing guard by its entrance. You recognize one of them from your last time here. If you wanted to go speak to Colonel Nehzara again, you could always go up to the guard and tell her so.");
		addButton(0,"Nehzara",approachNehzara4Repeats);
	}
	return false;
}

//[Guards]
public function nehzaraGuardsFirstTimeMeetingStuff():void
{
	//Special: Wanna Feel?
	//Procs upon selecting [Nehzara] if PC is female/herm and pregnant and is visiting Nehzara after engaging in at least one sex scene. Unsure if it should happen more than once. I’m thinking one time only, or at least only once per pregnancy.
	clearOutput();
	output("You approach the pair of Red Myr standing watch over the nearest entrance, noting to yourself that they’re not wearing gasmasks like the pair outside the warehouse. For that matter, none of the Reds in here are covering their faces. One guard steps forward to stop you before you get within ten feet of the door, and she asks your name and reason for being here. She’s rather terse and straight to the point, but that’s a military girl for you. Standing around with a loaded weapon all day doesn’t engender politeness toward meddling strangers wandering about.");
	// if not talked to Juro
	if(flags["MYRELLION_EMBASSY_VISITED"] == undefined)
	{
		showBust("MYR_RED_GUARD");
		author("Kaizer_Z");
		output("\n\nAfter you tell the sentry that you’re taking a look around since you just arrived on-world, she tersely nods and waves you along, telling you that most areas here are off-limits without clearance and most of the staff require appointments in order to meet with them. Doesn’t look like you’re going to be able to do much here at the moment, so it might be a good idea to get your bearings and find someone to talk to.");
		//(PC can do nothing else but go back to the Embassy for now)
		processTime(2);
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
	// if talked to Juro
	else
	{
		showNehzara();
		output("\n\nAfter you give the sentry your name and explain who you are and why you’re here, she nods and opens the door to allow you through. You find that it leads into an office which looks to have been thrown up within the past few days, sparsely decorated but for an impressively large desk in the center of the room. A uniformed Red sits at it, and you have a brief window of time to look her over upon entering. The alien warrior’s uniform is far more intricate and appealing than that of the guards, looking showy and expressive when contrasted with the functional garb of the others. You assume that makes her an officer in dress uniform.");
		output("\n\nYou have just enough time to also notice her inhumanly jet-black eyes glistening in the dim light, and then you find yourself staring right into them as the myr’s face turns up to acknowledge your presence. <i>“Yes? Can I help you?”</i> Her voice is a sharp alto, and the serious tone combined with her uniform and the pervading sense of militarism all around you evokes the image of her barking commands on a parade ground.\n\n<i>“Oh,”</i> she adds, straightening in her chair, <i>“I don’t believe we’ve met before. Colonel Nehzara, appointed diplomatic and political representative of the Scarlet Federation to the UGC Embassy. I’m serving in an ambassadorial capacity while the Federation sorts out which general will be here full-time. In any case, the corporal wouldn’t have directed you in unless you had business here, so what do you require of me?”</i> You get the impression she’s been sizing you up since she laid eyes on you.");
		output("\n\nYou introduce yourself and explain that you’re a star-traveler and heir to one of the larger corporations in the greater galaxy. Nehzara accepts this with a subtle nod and glances at a sheaf of paper on her desk. <i>“Ah, yes. Steele. I was apprised of your arrival on our little world. One of the UGC staff dropped off a quick notice just a moment ago. You’re... quite the important person, it seems.”</i> Her mouth quirks into a little smirk, and you could swear there’s a playful twinkle in those alien eyes of hers.");
		if(pc.hasCock()) output(" One of the antennae atop her head twitches, and you get the feeling that the room just got a little warmer. Though her expression doesn’t change in the slightest, you can’t help but suspect that she’s looking you over the same way you’d stare at a four-course meal after a week without food.");

		output("\n\n<i>“So. Steele.”</i> Nehzara leans forward, placing her elbows on the desk and steepling her fingers in a shockingly human fashion. <i>“Unless you’re just taking a stroll to see the sights in the lovely tourist attraction that is the DMZ, you have business with me. I don’t believe I’ll be receiving visitors any time soon, so why don’t I do my job and answer any questions you have?”</i>");
		//[Her People] [The War] [Your Mission] [Appearance]
		nehzeraMenu(nehzaraGuardsFirstTimeMeetingStuff);
		flags["MET_NEHZARA"] = 1;
	}
}

//[Nehzara]
public function approachNehzara4Repeats():void
{
	clearOutput();
	showNehzara();
	//showBust("NEHZARA", "MYR_RED_GUARD");
	
	if(pc.bellyRating() > 40 && pc.isPregnant() && flags["NEHZ_PREGGO_RUB_HAPPENED"] == undefined && flags["SEXED_NEHZARA"] != undefined && rand(3) == 0)
	{
		wannaFeelABellyYouAntSlutWhoreBitchNazi();
		return;
	}
		
	output("You enter the Red Myr diplomat’s office after the guard announces your presence, and Colonel Nehzara regards you with a level gaze and a subdued smile. That’s probably a downright friendly expression by her standards. <i>“Steele,”</i> she says coolly, <i>“I can’t say I expected you to be back here. Did you have more questions?”</i> She glances at the open door and lowers her voice to where you can barely hear her. <i>“Or maybe there’s something </i>else<i> you need, hm?”</i> Something tells you that at least one of the soldiers outside heard, but they’re both too tactful to give any indication of doing so. It’s so nice to be surrounded by professionals.");
	//(Same options as last time, plus new options)
	nehzeraMenu(approachNehzara4Repeats);
}

//[Appearance]
public function nehzarasAppearance():void
{
	clearOutput();
	showNehzara();
	output("Nehzara is a snappy, hard-eyed Red Myr woman who looks every inch the Scarlet Federation field officer she is. Others of her race are just barely taller than an average human female, though more sturdily built, but Nehzara is a little larger than average. You estimate she’d be 5’10” when standing. Her general frame is slim and lithe, but not frail by any stretch of the word.");
	if(flags["SEXED_NEHZARA"] == undefined) output(" There’s a tension to the way she’s carrying herself, a rigidity that goes beyond military discipline and looks forced and uncomfortable.");
	else output(" She is far more relaxed than she had been during your first meeting. While her posture is still impeccable, she no longer looks so rigid and uncomfortable.");

	output("\n\nHer parade-dress uniform is a deep black, with decorative gold-colored thread trimming the corners and creases. It’s tailored perfectly to Nehzara’s figure, hugging every curve and giving her an imposingly fashionable air. The colonel’s small collection of medals glimmers against the dark fabric, each one proudly polished to a perfect shine. A peaked, wide-brimmed uniform cap is lying on her desk rather than being worn upon her head.");

	output("\n\nThe bright crimson of her hair could invoke jealousy in most women of other species, though it’s cut into a short and utilitarian style that wouldn’t look out of place on a military officer from Earth or Ausaril. It still looks good on her, though. Her face is unadorned by any expression at the moment, and her jet-black eyes are fixed on you.");

	output("\n\nThe angular lines of her face transition smoothly to her slender, red-skinned neck, and from there to her ample and alluring bust. The tightness of her uniform serves to enhance the impression her perky, D-cup breasts have. Nehzara’s straight-backed pose and confident bearing only increase this effect, almost as if she’s proudly presenting them to you. ");
	if(flags["SEXED_NEHZARA"] != undefined) output("For all you know, she very well could be. ");
	output("You can’t really see any more of her while she’s sitting at her desk like this, ");
	if(flags["SEXED_NEHZARA"] == undefined) output("so you’re left to imagine what that uniform does for the rest of her figure");
	else output("but you’re well aware of what that uniform does for the rest of her figure, and you know you like it a lot");
	output(".");
	clearMenu();
	nehzeraMenu(nehzarasAppearance);
}

//Talk: Her People
//Tooltip: It might be interesting to find out a little more about the Reds from their point of view.
public function talkAboutNehzarasShittyPeople():void
{
	clearOutput();
	showNehzara();
	output("Running your fingers ");
	if(pc.hasHair()) output("through your [pc.hair]");
	else output("over your smooth scalp");
	output(", you take a second or two to ponder over how to phrase the question, and then ask Nehzara about her people and nation.");

	output("\n\n<i>“Ah. I’m sure that you’ve heard </i>something<i> already, haven’t you?”</i> the uniformed woman replies. At your nod, she scoffs bitterly and practically spits out her next words. <i>“Let me guess: the Scarlets are a bunch of warmongering monsters who thirst for the tears and suffering of everyone good and wholesome in this world. That close to the mark on what you’ve heard so far?”</i>");

	// (if PC has talked to GM ambassador)
	if(flags["MET_LYRALLA"] != undefined)
	{
		output("\n\nThough you’re a little taken back by the sudden heat from the previously composed and chilly officer, you respond in the affirmative. Perhaps it wasn’t quite so damning as all that, but you distinctly remember something about the Reds wanting nothing less than the extermination of every other species and total domination over the world.");
		output("\n\nNehzara shakes her head in a universal gesture of exasperation. <i>“Sounds about right for Lyralla. That brainwashed, spineless nectar-guzzler spends every waking moment trying to convince everyone that we’re nothing short of evil given form. Well, any moment her lips aren’t wrapped around a swollen honey-spout. I could swear the stuff kills their brain cells. So she’s cried on your shoulder and given her usual cockamamie spiel about how the heartless Reds eat babes and kill prisoners for sport?”</i>");
	}
	// (if PC hasn’t)
	else
	{
		output("\n\nThough you’re a little taken back by the sudden heat from the previously composed and chilly officer, you shake your head and tell her you haven’t heard that much. No one’s given you a comprehensive run-down on the situation on Myrellion. You just have a general idea of the situation here on the ground.");
		output("\n\n<i>“Oh, so the virtuous and victimized Ambassador Lyralla hasn’t had a chance to weep at you about how evil we all are, and how their use of immoral and inhumane chemical and biological weaponry was all in self-defense?”</i> The Red Myr diplomat gives you a little smile, and you think there might be something conspiratorial to the expression. <i>“Well then,”</i> she says slowly, <i>“that means I get the rare chance to explain things </i>my<i> way without worrying about preconceived notions from... other influences.”</i> Judging by her body language and the tone of her voice, she’s quite pleased by that.");
	}
	// Merge
	output("\n\nNehzara leans back in her chair and crosses her arms, looking right into your eyes. You find yourself both reassured and challenged by her utter confidence. <i>“Listen up,”</i> she continues, <i>“I’m not going to say we’re all saints or that every Gold queen is a tyrant. If you really believe there are through-and-through good guys and bad guys in war, then you’ve obviously never picked up a weapon for your people and your land. There are soldiers, and maybe some are heroes or villains, but most of them are somewhere between the two.”</i>");
	//(if merc:)
	if(pc.characterClass == GLOBAL.CLASS_MERCENARY) output(" You find yourself nodding in agreement. As a mercenary, you’ve definitely seen an equal measure of virtue and vice among your fellow hired guns.");

	output("\n\n<i>“Right. You want to know the truth? We may have a few questionable individuals in our nation, but the Golds? Their entire </i>system<i> is rotten. Maybe the Golds see us as brutal, but that is only because their Queens are all too happy to keep them all as unquestioning, mindless followers. Weak-willed and supine. They breed, and so they carry the future of their people with them, and what do they do?”</i> Nehzara is practically fuming now. You’d expected a little more self-control from someone with her rank and position. Does she get so worked up every time she has to discuss the war with an outsider? That can’t be wise.");

	output("\n\nShe seems to realize this and places her hands on the table, one atop the other, and looks you in the eye while taking a breath. <i>“They flaunt their status about and lord it over everyone else without a second thought... as if they’re undertaking some great labor by being worshiped and fertilized every hour of the day. Make no mistake: for all their talk of liberalism and forward thinking, they’re slaves, each and every one of them. They’re encouraged to live undisciplined lives free of any form of self-respect or pride beyond their assigned responsibilities to the Queens.”</i>");
	output("\n\n");
	if(pc.isNice()) output("You’re careful to phrase it delicately, but you have to ask");
	else if(pc.isMischievous()) output("You throw out the question with a light tone, but you have to ask");
	else output("You’re blunt and straight to the point");
	output(": are the Reds any better off when they’re living in a jingoist society where they’re every bit as bound by the system?");

	output("\n\n<i>“Mm. You’re far from the first alien to ask that,”</i> she says coolly, her frosty composure having returned while listening to your words. <i>“I suppose we seem somewhat odd to you, then. Discipline is liberating. Much as it seems to restrict you, once you’ve lived a life of self-discipline, you’ll quickly find that it gives you control over yourself and your life. It’s not about your fealty to some queen or overlord, or even an officer. Choosing to fight means submitting to the chain of command, but that is a system made manifest by the will of the people, not the select few who rule. The Gold Queens ensnare their people with the illusion of freedom by keeping them scurrying about pointless lives and never questioning whether they’re in control. We embrace our duty to ourselves by choosing to be ruled by our wills, not petty desires, and in doing so we become free.”</i>");

	output("\n\nWell. You suppose that’s one way to look at it.");
	processTime(6);
	nehzeraMenu(talkAboutNehzarasShittyPeople);
}

//Talk: The War
//Tooltip: A little history lesson never hurt anyone. A little information on the war might help you while on this planet. Knowledge is power, right?
public function talkToNehzaraAbootZeWar():void
{
	clearOutput();
	showNehzara();
	output("Everyone’s been talking about war this and war that. Soldiers are standing sentry everywhere you turn, and even the UGC members on-world seem tense and ready for something to snap at any moment. You’ve heard of a war, but maybe the colonel could provide a little more insight.");
	output("\n\nNehzara leans back in her chair. <i>“Not an uncommon question. I really should just write a pamphlet and spend all day getting </i>actual work<i> done instead of answering the same questions thrice a day.”</i> She flashes you a sharp smile just before you can respond. <i>“Oh, don’t get defensive. It’s not your fault they’d rather stick a field officer in some slapdash cubicle and have her play Scarlet Federation tour guide instead of letting her do her real job.”</i> ");
	if(pc.isNice()) output("You sigh and shake your head, deciding you can put up with her acerbic demeanor for a bit longer.");
	else if(pc.isMischievous()) output("You roll your eyes, inwardly hoping you don’t sound that bitingly sardonic to others.");
	else output("Well, someone sure is bitter. You frown and gesture for her to continue.");

	output("\n\n<i>“Well, you probably know the basics of recent events. What you probably haven’t heard is that little skirmishes and conflicts have been part of our mutual history since long before the current war. Relations have </i>never<i> been great between our nations. Of course, they claim we started it, which makes absolutely no sense at all. Only a braindead idiot would even assume the Scarlet Federation simply attacked for no reason. No, that blame lies with the damn Goldies.”</i>");

	output("\n\nWell. That’s new. You’ll bite: how did the Golds start the conflict?");

	output("\n\n<i>“How do you think? We’re a threat to their damn way of life. Too different from them. The close-minded cunts were a lot more powerful back then, compared to us. They thought they’d just wipe out what they saw as a few rogue hives without a ‘proper Queen’ and call it a day. We fought back. Wars have come and gone since then, but as long as they live, they’re a threat to us. When they grew weaker, we grew stronger, and now we have the means to ensure the security of our people.”</i> She looks at you levelly, her alien eyes cold and hard.\n\n<i>“It’s us or them, Steele. I doubt you visitors understand what it’s like growing up knowing there’s an enemy striving to erase your people and that your only option is to live a life of vigilance or wipe them out first. You all seem to get along well, and I’ve heard more than one of you discuss the possibility of bringing both Red and Gold into agreement and lasting peace. It’s a pipe dream, off-worlder, a nice little fantasy that may seem possible to people that cross stars and see our world from above but is blatantly impossible for us.”</i>");
	output("\n\nYou’re pretty sure the Golds would tell the story differently. History’s written by the victors, they say, and accounts probably conflict when there’s no victor yet decided. They do seem to agree on one thing, though: neither race is comfortable so long as the other survives.");
	output("\n\nNehzara takes a breath before continuing. She’s a little more dispassionate now; that cold fire in her eyes has been replaced by a calmer and more professional clarity. <i>“The current war began with a major offensive on our part, yes, but any Gold who points to that as proof of us being the aggressor inevitably fails to mention that this war could be looked at as the result of several skirmishes which took place over </i>our<i> airspace,”</i> she continues. <i>“They were testing out new models of military craft unacceptably close to our cities.”</i>");
	output("\n\n<i>“When we engaged and tried to see them off, our pilots came under attack. Of course, the bastards later claimed their pilots were not under orders to fire, but that’s nonsense and we all know it. We already knew they’d been developing a new delivery system for that gas of theirs. One grueling campaign later, Kressia is ours and Gildenmere is in our sights. And then you showed up.”</i> Her tone turns bitter at that last sentence, but she’s not looking directly at you: instead, her gaze is fixed firmly on a point just to your left.");
	output("\n\nYou shrug and cross your arms over your [pc.chest], remaining silent for a moment. Nehzara meets your gaze once again, and turns her hands over upon her desk to show her palms, silently asking <i>“anything else?”</i> with her facial expression.");
	flags["TALKED_TO_NEHZ_ABOUT_THE_WAR"] = 1;
	processTime(7);
	nehzeraMenu(talkToNehzaraAbootZeWar);
}

//Talk: Her History
//Tooltip: Wars and politics are interesting and all, but what about the woman in front of you? You could ask how she got here, and why.
public function talkToNehzaraAboutHistory():void
{
	clearOutput();
	showNehzara();
	output("So, if Nehzara is this big war hero and everything, why exactly has she been placed behind a desk in the corner of a warehouse in the demilitarized zone? You pose the question ");
	if(pc.isNice()) output("as delicately as you can");
	else if(pc.isMischievous()) output("with as light a tone as you can manage");
	else output("with some of your own bitterness mixed into your tone");
	output(".");

	output("\n\n<i>“Ah. A surprisingly astute observation,”</i> she responds levelly. Wait, surprisingly? Was that a dig at your intelligence? You decide to pay it no more mind and let her continue.");

	output("\n\n<i>“It was decided that I’d be an officer practically before I was ever born. My mother was captaining an assault company at the time, and she’d already been singled out by higher-ups to be groomed for further promotion. It’s not uncommon for fertile females to find themselves on a fast-track out of any front-line duties, even when we’re not in a state of total war.");

	output("\n\nBy the time she returned from birthing leave, she’d already been nominated as a leading candidate for a field major position. Naturally, as I grew older and accumulated my own achievements in the academy, so too did she continue to accrue authority. By the time I was captaining a company of my own, she’d established herself as one of the top brass at Command. It’s led to a few accusations of nepotism throughout my career.”</i> Nehzara folds her hands on her desk and looks down at them. <i>“I am the third-youngest individual in our entire history to hold the rank of colonel, Steele, and easily the youngest one at this time. No matter how often those accusations are denied, some shadow of a doubt will always linger.”</i>");

	output("\n\nYou wonder if she means those doubts will linger in the minds of her peers... or her own. Judging by the way she said it, Nehzara herself has doubts over whether or not her mother’s been pulling strings behind the scenes.");

	output("\n\n<i>“With me being infertile, it was pretty much a done deal that I’d be leading combat elements. I didn’t mind, though; something like that suited me just fine. Hell, I was </i>good<i> at it. I made major just as the current campaign kicked off, right when this most recent war between us and the Golds went hot. I took a few cities, led a few assaults, earned a few medals, and found myself being recognized as one of the foremost field commanders in the entire army.”</i> The smile that touches her lips when she says that contains no small amount of pride.");
	output("\n\nThe moment of self-congratulation is short-lived. <i>“However... the Golds were hardly my only enemy. Success breeds envy. By the time we were knocking at Gildenmere’s front door, I was not only a shoo-in for colonel, but it was looking pretty damn likely that I’d be commanding a very prestigious regiment and that it wouldn’t take long to pick up a star or two.”</i> Despite your codex telling you that the Scarlet Federation equivalent of a general officer wears a very different indicator of rank, you’re impressed by how well it translates Nehzara’s use of her people’s jargon into a Terran equivalent.");
	output("\n\nThe Red Myr officer pauses a moment before continuing. <i>“People think a military runs on bullets, or soldiers, or even food. Ultimately, it all comes down to paper. The army runs on paper. Logistics. What goes here, who goes there, what’s assigned to what regiment and which lieutenant gets a promotion to replace some dead captain. Paper. We have legions upon legions of pencil-pushers and paper-shufflers, and there’s a war being waged behind the front lines, too. Petty politicking and backroom skullduggery never much appealed to me, but my mother was adept at it. I know she tried to make me see how important the political games were, and how I needed to grasp the rules and players if I was going to climb that ladder I was scaling, but I always thought killing honey-suckers was more important.”</i> Her hands clench into fists on her desk, and a fierce anger begins to simmer beneath her precariously calm expression.");
	output("\n\n<i>“Oh, I didn’t listen. She called me stubborn, said that a headstrong attitude and a strong arm might win some battles but would mean certain death in others. You would think I’d listen to one of the greatest commanders in our nation, but something in me just refused to accept it.”</i> She shakes her head.\n\n<i>“So when the ceasefire was forced on us by the alien fleet that appeared above our world, Colonel Kalayna made it quite clear that someone as decorated as I would be the best choice to assist the Scarlet Federation ambassador. Of course, while being an ambassador is a prestigious position, being the assistant of one is practically a career death sentence for a war hero. So now, while the generals and their toadies are busy arguing over which of the brass gets assigned as the head honcho here, I’m stuck doing all of their work with practically no support structure in place. Kalayna is leading my old regiment now, sitting comfortably in Kressia and probably raiding some Gold stashes of that disgusting tit-sap of theirs. That swill sure would suit her perfectly. I couldn’t even bring my trench wives along. Was told the practice of keeping them wouldn’t appeal to your people, and that I’d be better off not flaunting it at you.”</i>");
	output("\n\nShe gives a little scoff and laces her next words with enough sarcasm that they’re practically dripping with it. <i>“Ha. Yeah, the UGC sure does seem enamored with the Federation. Showing off our war trophies would just ruin all of that.”</i>");
	output("\n\nThe colonel, suddenly weary, sighs and looks down for a few seconds. <i>“Well then. That’s how I ended up commanding a desk instead of a regiment, and why I don’t get a fancy ‘ambassador’ title like that dim-witted Goldy or that pampered alien. Suits me, I guess. As long as I’m called ‘colonel,’ maybe I can pretend it’s still what I actually am.”</i>");
	output("\n\nNehzara clears her throat suddenly and looks you in the eyes. <i>“Was there anything else you wanted, Steele?”</i>");

	processTime(8);
	//(Normal options, with the topic [Trench Wives?] unlocked)
	nehzeraMenu(talkToNehzaraAboutHistory);
}

//Talk: Trench Wives?
//Tooltip: Wait... trench wives? There’s an unusual term, and she said something about <i>“war trophies.”</i> You could ask her to elaborate on that.
public function trenchWives():void
{
	clearOutput();
	showNehzara();
	output("You ask Nehzara what exactly she meant by ‘trench wives.’");
	output("\n\n<i>“Ah,”</i> she says, tapping her chin with one finger. <i>“Perhaps I said too much. We’re not supposed to draw attention to the practice.”</i> Something about her tone and expression tells you that her dropping of the term wasn’t as accidental as she claims.");
	if(pc.mf("","g") == "g") output(" In fact, she almost seems pleased that you noticed it.");

	output("\n\nYou encourage her to continue; you want to hear about this whether or not you’re supposed to. It sounds interesting.");

	output("\n\n<i>“Every war creates prisoners. A position is overwhelmed, a line is broken, soldiers drop their arms and throw themselves upon the enemy’s mercy... it’s a natural state of affairs. Tell me, Steele... how are prisoners handled in your society?”</i>");

	output("\n\nYou shrug and ");
	if(pc.characterClass == GLOBAL.CLASS_SMUGGLER) output("say that you can’t particularly complain about it; different worlds have different detention policies, but they’re all pretty humane");
	else if(pc.characterClass == GLOBAL.CLASS_MERCENARY) output("explain that you’ve only seen the inside of a few holding cells and police stations, but you’re not acquainted with any actual prisons");
	else output("admit that you don’t really have any experience with being on that side of the law, and so you can’t personally attest to anything");
	output(".");

	output("\n\nNehzara nods, as if she’d received the answer she expected. <i>“A prisoner of war is different. Her only offense is fighting for her nation. How do you rehabilitate that, ethically speaking? That’s one thing that separates us from the Gold Queens. They’d gladly brainwash each and every peon into serving them and slap some high-minded propaganda on to claim it’s all for peace and prosperity. It’s fucking revolting, is what it is.”</i>");

	output("\n\n<i>“So a question arises: how do we handle those who aren’t killed in battle, but find themselves at our mercy? Logistics being the nightmare that they always are, we can’t exactly carry around a baggage train of bound Goldies and expect everything to be hunky-dory, and transporting them back to our territory presents problems of its own... namely cost and need to devote manpower to guarding those convoys. That’s something we absolutely could not spare.”</i>");

	output("\n\nYou’re starting to see where this is going. So the Red soldiers kept the Gold prisoners around, didn’t they? Kept them as... ‘trench wives.’");

	output("\n\n<i>“Correct,”</i> she answers nonchalantly. <i>“And before you say anything, it’s not so simple as slavery. You see, devoting our limited resources to feeding and supporting these prisoners would create resentment among the soldiery. That’s natural, and understandable. A practice of claiming prisoners as the spoils of war had existed in the earlier days of our history... and I’m quite sure the Golds can say the same, even if they’d love to deny it. This is not so cut-and-dried as that, however. Trench wives are not slaves, and any soldier who thinks otherwise will likely find herself on the wrong end of a disciplinary action. Allowing the soldiers, especially ranking officers and NCOs, to take prisoners as ‘their own’ fostered a sense of protectiveness and concern which helped to guarantee the safety of any prisoners claimed. The fact that a level of intimacy arose was a natural consequence of the practice.”</i>");

	output("\n\nSo the Reds would take prisoners as sex slaves in all but name, but doing so allowed them to be better protected and keep up the morale of the troops?");

	output("\n\n<i>“Essentially,”</i> Nehzara agrees. <i>“And it’s not as though it’s as inhumane as other alternatives. Would you rather the prisoners be rotting in a jail, waiting to be traded with their original government like chattel for some of ours? Ha. The Golds use gas and bombs; they hardly ever take any prisoners that way. Any of ours they take are going to be traded for officers and important personnel, not some infantrywoman who surrendered when her machine-gun nest was stormed. A good portion of the wives are reasonably happy, and I’ve heard of genuine bonds of affection forming between soldier and trench wife... though I’ll fully admit that it’s quite rare, even if it does truly exist.”</i>");

	output("\n\nThe colonel shrugs and sits back in her chair. <i>“What can I tell you, Steele? Soldiers have a tendency to take trophies. It’s a coping mechanism, well-documented by psychs at home. Would you rather they simply shoot prisoners who surrender, or lock them in a jail cell for years and years while they’re forgotten by their own people? If some soldiers see Gold women as nothing more than potential spoils of war to be taken and sexually conquered, then that’s an unfortunate price to pay for the general welfare of prisoners on the whole.”</i>");

	output("\n\nThe look on her face as she discusses the hypothetical conquistadoras does suggest she’s not fond of their outlook, but her tone is certain and absolute.");

	output("\n\n<i>“Now, Steele,”</i> she begins, watching your face closely. <i>“Did you have any other questions or concerns?”</i>");
	//(Back to normal options menu.)
	processTime(8);
	nehzeraMenu(trenchWives);
}

//Talk: Your Mission
//Tooltip: You came here for a reason, and there’s a chance that having access to Red Myr territory could help you find the probe and fulfill your mission. This diplomat is the one who can get you access.
public function talkToNehzaraAboutHerMission():void
{
	clearOutput();
	showNehzara();
	output("War, politics, and history aside, you have your own concerns. One of your father’s probes is on this planet and you need to find it... preferably before your cousin does. Nehzara’s the only one who can get you clearance for travel to Kressia and Scarlet Federation territory. You tell her that’s why you’re here.");
	output("\n\n<i>“I see,”</i> she muses, turning her chair to the side as one leg moves to cross the other in a decidedly feminine motion, <i>“I can’t say I’ve had many visitors request access to Kressia.”</i> Her eyes don’t look to be focusing on anything in particular, as if they’re staring into space instead of the wall at which they’re pointed. <i>“Normally it’s just conferences with UGC members, day-in and day-out. Deals on what we can export and import, resolution for little squabbles here in the embassy or other demilitarized zones, dealing with that braindead Lyralla... all of it so stressful. And you know damn well they won’t let me get any time to myself so that I can deal with it </i>properly<i>. Not even a minute; even when I’m not working, I’m being watched by someone and asked to do this or that.”</i>\n\nThe ant-like woman sighs, and her severe aura fades a little. For one fleeting instant, she looks tired and vulnerable. Then the moment passes, and you’re looking at the stern and forward Colonel Nehzara again.");
	output("\n\nAfter a short stretch of silence, you begin wondering if you should speak up. The woman in front of you seems to be considering something, as if contemplating how to answer you. There’s a distinct difference in the atmosphere of the room now, and you now have time to consider just how attractive Nehzara looks under that uniform. It’s artfully tailored to her in a rather flattering manner, now that you think about it, and it lends her a very regal and impressive air which complements her personality perfectly.");
	output("\n\nThe colonel interrupts your thoughts with a clearing of her throat. <i>“Ahem. Steele. I’ve been thinking over your request for clearance into Federation-occupied territory, and I believe we can reach an agreement that benefits both of us. If I were to give you the proper authorization, I believe you can do something for me.”</i> Nehzara uncrosses her legs now, managing to make a subtle show of it and draw your gaze to the lines of her thighs and calves, to where her uniform pants end and the chitin begins.");
	output("\n\n");
	if(pc.hasCock() && !pc.isTaur())
	{
		output("<i>“I don’t get many opportunities to step out of the office and enjoy myself with a male, or anything resembling one, but you’ll certainly do for a little stress-relief. Give me a few pleasurable minutes, and you can go anywhere you want.”</i>");
	}
	else if(pc.hasCock())
	{
		output("<i>“You do smell absolutely amazing, but... I can’t think of any place I’d even fit both of us without rutting right in public. Still, I could use someone giving me a little encouragement and relief as I work, and I think I have </i>just<i> enough space under here for you.”</i>");
	}
	else output("<i>“Since I’d rather not ask it of my subordinates, and I surely can’t keep any trench wives here with me, I could use someone giving me a little encouragement and relief as I work... someone who can be felt and not seen... like under my desk, perhaps?”</i>");
	processTime(7);
	pc.changeLust(3);
	//[Under Desk] [Storage Closet] [Refuse]
	//(Under Desk is used for cockless PCs and taurs only in this instance, though males/herms can access it later through the main interaction menu upon meeting Nehzara again. Taurs, due to their size, can’t fit in a tight closet and therefore only have access to Under Desk. I may write something for them later, or let Savin do it.)
	clearMenu();
	if(!pc.hasCock() || pc.isTaur()) addButton(0,"Under Desk",sexUnderDeskWithNehzara,true,"Under Desk","It’d be more than a little humiliating to be hidden under a desk and used like some stress-relief toy, but there’s a saying about scratching backs....");
	else addButton(0,"StorageCloset",sexWivNehzaraInStorageCloset,true,"Storage Closet","You’ve got what she wants, but you know she’ll want to call the shots. Still, going along with Nehzara and letting her use you for her own pleasure could be fun for both of you.");
	addButton(1,"Refuse",refuseToLickAntPussayOrClosetFuxx,undefined,"Refuse","Tell her that you’d rather not, and that you have other things to offer her.");
}

//Sex: Under Desk
//Tooltip: It’d be more than a little humiliating to be hidden under a desk and used like some stress-relief toy, but there’s a saying about scratching backs...
// From Mission Talk
public function sexUnderDeskWithNehzara(fromMissionTalk:Boolean = false):void
{
	clearOutput();
	showNehzara(true);
	if(fromMissionTalk)
	{
		output("Nehzara seems to have expected the proposal to take you aback, but she’s certainly not the first alien to proposition you. Still, you suppose it <i>is</i> a little odd coming from someone so... strict. Even now that she’s asked something so lewd of you, she’s straight-backed and composed, regarding you calmly and coolly and patiently awaiting a reply.");
		output("\n\n");
		if(pc.isNice()) output("<i>“Sure,”</i> you say with a shrug and a smile. It’s obvious that she could use a little release, and you wouldn’t mind getting a taste of some red-ant nectar.");
		else if(pc.isMischievous()) output("<i>“Why not?”</i> you reply with a wink. <i>“Just promise to be this polite when my head’s between your legs.”</i>");
		else output("Heh. Why not? <i>“All right,”</i> you reply in a sultry, lustful tone, <i>“but only because you could use that stick pulled out of your ass.”</i>");
	}
	// From Main Screen
	else
	{
		output("You ");
		if(pc.legCount > 1) output("take a step forward");
		else output("slide yourself forward");
		output(" to stand just before Nehzara’s desk. <i>“Someone looks stressed,”</i> you begin, looking her in the eye. <i>“");
		if(pc.isNice()) output("Perhaps there’s something I could do to help?”</i>");
		else if(pc.isMischievous()) output("I’ve got the cure for that; care to guess what it is?”</i>");
		else output("If I take care of it, think you could be a </i>little<i> warmer after?”</i>");
		output(" Not a moment after you ask, your gaze travels down her chest to settle on her desk. On the other side of that wooden surface lies exactly what you’re after.");
	}
	// Merge
	output("\n\n<i>“Excellent,”</i> she murmurs. You see her fidget a little and draw back from the desk in her rolling chair. Once you’ve come around the desk to stand beside her, you can see that she’s hiked down her uniform pants to expose a pair of glistening, inviting lips positioned between two sinfully smooth, slender-yet-strong thighs. Oh, you’re pretty sure you’re going to enjoy this.");
	output("\n\nYour eyes meet Nehzara’s, and her mouth quirks into a little smile that you can’t help but find devilishly attractive. Rough and commanding she may be, but there’s an oddly charming woman beneath all the abrasive bluntness.");

	// Taur/Naga/Drider/Caterpillar/Yawgmoth
	if(pc.isTaur() || pc.isDrider() || pc.legCount > 3)
	{
		output("\n\nThe Red Myr officer beckons for you to get down behind the desk, and you ");
		if(pc.isNice()) 
		{
			output("nod, ");
			if(pc.legCount == 1) output("sliding");
			else output("stepping");
			output(" forward and gingerly lowering yourself to ");
		}
		else if(pc.isMischievous()) output("flash her a smirk before gracefully lowering yourself to ");
		else output("give her a cold smile before hunkering down on the floor between the desk and her chair. You turn your torso so you’re facing ");
		output("the myrmedion’s spread legs and open lap.");
	}
	// Biped
	else
	{
		output("\n\nThe myr officer beckons toward the space under the desk, that faint smile widening subtly as she watches you get down on your knees and make your way under there. ");
		if(pc.tallness >= 84 || pc.legCount > 3) output("It quickly becomes clear that there’s no damn way you’re fitting under the desk, despite it being one of the larger ones you’ve seen. Nehzara sighs and pushes herself a little farther back away from the desk, letting you fit half of yourself under there instead. She glances at the door nervously, clearly hoping that anyone who passes by won’t notice that she’s sitting almost at arm’s length from her workspace");
		else if(pc.tallness < 60) output("It’s actually kind of roomy beneath the large desk, at least before she slides forward and places her knees on either side of your head");
		else output("There’s just enough space for you to fit beneath the large desk, and it gets rather crowded once she slides forward and places her knees on either side of your head");
		output(".");
	}
	// Merge
	output("\n\nNehzara looks down at you, her normally severe expression broken by a smile she’s making no attempt to hide. A little heartened by this, you give a deep, lingering kiss to the sweet-smelling snatch before you, and are immediately rewarded with a gasp escaping from the professional officer’s lips. This will be worth it just to hear her struggle to maintain composure, you think to yourself... which makes the ambrosial aroma of her alien-yet-familiar womanhood and the smooth, red thighs on either side of your head mere bonuses.");
	output("\n\n<i>“Ah,”</i> she starts, forced into holding back another involuntary gasp of pleasure by your [pc.tongue] flicking out and giving the moistening lips of her labia a good lick. Further emboldened by her suppressed reaction, you give another quick, probing lick. And another. And another. Nehzara looks down at you as if to ask what you’re doing, and you choose that exact moment to go forward and thrust your tongue into the tight snatch you’ve been teasing.");
	output("\n\nThe response is exactly what you’d hoped for. The myr woman gives a breathy little coo of encouragement before she reaches down to pat at your head approvingly. It’s always nice to be appreciated once in a while, you think, and you allow yourself to savor a rush of satisfaction when Nehzara ");
	if(pc.hasHair()) output("runs her fingers through your [pc.hair]");
	else output("kneads her fingers into your [pc.skinFurScales]");
	output(" and lightly scratches at your scalp while you’re busy mounting an oral expedition into the tight little crevice between her legs. Her affectionate attentions send a little shiver ");
	if(!pc.isGoo()) output("up your spine");
	else output("throughout your gooey body");
	output(" that’s entirely separate from the excitement you feel from eating her out. You absently wiggle your [pc.hips] just a little at the tactile praise");
	if(pc.tailCount > 0) output(", [pc.eachTail] adding its own motion to that of your [pc.ass]");
	output(".");

	output("\n\nYou couldn’t be happier. Down here between the Red Myr officer’s legs, [pc.face] buried in her warm cunt so firmly you’re practically making out with it. You’re overwhelmed by a tingly, electric excitement that you can’t fully describe. Though you started out trying to make the cool, dismissive woman lose her cool and descend into moaning ecstasy, you are quickly realizing that the tables have turned. You reach down ");
	if(!pc.isCrotchExposed() && !pc.isAssExposed()) output("into your [pc.lowerGarment] ");
	output("to ");
	if(!pc.hasCock()) output("push a couple fingers into your [pc.vagOrAss]");
	else output("grasp at your [pc.cockBiggest]");
	output(", absolutely desperate for your own stimulation. Nehzara, however, has now settled down and is thoroughly pretending you aren’t even there. For your part, the cold treatment has you even more aroused than before, and you ");
	if(!pc.hasCock()) output("jab your fingers deeper into yourself, spreading and bending them madly");
	else output("begin to furiously pump at your shaft");
	output(" to get yourself off.");

	output("\n\n<i>“Ah-ah,”</i> the diplomat says softly, shuffling a few papers on her desk. The tip of her chitinous boot presses firmly against your [pc.belly], and you momentarily freeze. <i>“I don’t want a mess on my floor. You can finish on your own time, </i>after<i> I get mine, and where no one will expect me to clean it up.”</i> The pressure of her boot slowly increases until you remove your hand from your naughty place. <i>“Good,”</i> she murmurs in approval, and she places her foot back on the floor next to you.");

	output("\n\nShe waited until you were getting good momentum, you think. You know she timed that on purpose, and now your ");
	if(!pc.hasCock()) output("[pc.vagOrAss]");
	else output("[pc.cockBiggest]");
	output(" aches for more stimulation. Damn it. You consider leaving her with a similar sense of unfulfilled desire, but the thought vanishes from your mind when you hear someone open the door and step into Nehzara’s office.");

	output("\n\n<i>“Ah. Lieutenant-Commander Yehade. I wasn’t expecting a visit from you at this hour.”</i> Nehzara’s voice comes out level and controlled above you. Unsure of whether you should continue while she’s not alone, you make to slow down your oral attentions... and promptly receive a forceful hand-press on the back of your head for the consideration. Chastised so, you get back to work, nuzzling your face against her sopping-wet snatch. So ungrateful.\n\nWell, at least her cunt can’t lie, and it’s growing hotter and sloppier by the second, so surely some part of her appreciates your efforts. Unless, hold on: you listen closely, and can clearly hear a male voice responding to Nehzara’s greeting. It must be some UGC officer who’s meeting with her now, not one of her people. Knowing the cock-starved nature of the myr women, her loins are probably screaming at her to mount him right now.");
	output("\n\nYour suspicions are confirmed when you hear the visitor leave and Nehzara pushes down on your head with both hands, almost smothering you in ant-pussy. She’s not even trying to act cool anymore, and bucks her hips up against you as your tongue lashes about within her and presses every one of her buttons. You’ve been down here for a good few minutes now, and you’re starting to become quite familiar with her honeypot. The lust-filled myr gives a low, quiet moan while you go at her with abandon, and it’s not hard to tell she’s close. You press the attack, capitalizing on your forward momentum by repeatedly thrusting your [pc.tongue] back and forth into her even as your [pc.lips] brush against her puffed-up labia. It won’t be long now.");

	output("\n\nIt isn’t long at all. Within seconds of your redoubled assault on her yearning pussy, Nehzara gives a suppressed squeak and lifts her ass out of her chair, crotch pressed firmly against you for her grand finish. Eager for your reward at last, you let out a delighted little moan at her blatant cue. The scarlet-skinned alien woman arches her back and climaxes, and to your delight, her orgasm is both sweet and bountiful. A small flood of myrmedion fem-spunk wettens your [pc.face], and you’re sure to ");
	if(!pc.isGoo()) output("lap up as much as possible with your [pc.tongue]");
	else output("slurp up as much as possible and add it to your goopy mass");
	output(", mindful of her earlier statement about making a mess.");
	output("\n\nNehzara slumps back into her chair once she’s done. Her breaths are just a little heavy, and after a mere moment of recovery, she rolls her chair back and slides her pants back up. <i>“Not bad, Steele,”</i> she says with a feminine purr, her voice sultry and satisfied. You like that tone; it’s an interesting contrast to her normal sharpness. <i>“I really needed that, and you’re a lot better than most of my partners. You have... spirit.”</i>\n\nThe myr officer gives you a knowing smile as she reaches down to pat your head, fingers");
	if(pc.hasHair()) output(" running through your [pc.hair] and");
	output(" playing softly with one [pc.ear]. The expression on her face has her looking for all the world as if she can see right through you at the moment. You can’t help but blush a little, and not just at the praise. Somehow, you don’t think she’ll be any nicer to you in the future, but you’re also not sure if you even want her to be. Now that you’ve seen what she’s like when her guard is down, you’re sure you can handle her even at her worst.");
	output("\n\nYou pick yourself up off the floor and adjust your gear. That was certainly an experience, at least. Nehzara looks as if nothing had even happened, and has already organized the papers on her desk and is now casting a questioning glance your way.");
	// Create Nehzara
	var ppNehzara:PregnancyPlaceholder = new PregnancyPlaceholder();
	if(!ppNehzara.hasVagina()) ppNehzara.createVagina();
	ppNehzara.vaginas[0].wetnessRaw = 4;
	ppNehzara.girlCumType = GLOBAL.FLUID_TYPE_HONEY;
	//(++Lust, PC can now take the shuttle to Kressia)
	pc.girlCumInMouth(ppNehzara);
	pc.exhibitionism(1);
	pc.changeLust(35);
	processTime(17);
	flags["SEXED_NEHZARA"] = 1;
	if(!pc.hasKeyItem("Kressia Pass")) pc.createKeyItem("Kressia Pass", 0, 0, 0, 0, "");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Sex: Storage Closet
//Tooltip: You’ve got what she wants, but you know she’ll want to call the shots. Still, going along with Nehzara and letting her use you for her own pleasure could be fun for both of you.
public function sexWivNehzaraInStorageCloset(fromMissionTalk:Boolean = false):void
{
	clearOutput();
	showNehzara(true);
	// From Mission Talk
	if(fromMissionTalk)
	{
		output("Nehzara seems to have expected the proposal to take you aback, but she’s certainly not the first alien to proposition you. Still, you suppose it <i>is</i> a little odd coming from someone so... strict. Even now that she’s asked something so lewd of you, she’s straight-backed and composed, regarding you calmly and coolly and patiently awaiting a reply.");
		output("\n\n");
		if(pc.isNice()) output("<i>“Sure,”</i> you say with a shrug and a smile. It’s obvious that she could use a little release, and you wouldn’t mind getting off, yourself.");
		else if(pc.isMischievous()) output("<i>“Why not?”</i> you reply with a wink. <i>“I’m running a sale on [pc.cumNoun] today, anyways.”</i>");
		else output("Heh. Why not? <i>“All right,”</i> you reply in a sultry, lustful tone, <i>“but only because you could use that stick pulled out of your ass.”</i>");
	}
	// From Main Screen
	else
	{
		output("You ");
		if(pc.legCount > 1) output("take a step");
		else output("slide yourself");
		output(" forward to stand just before Nehzara’s desk. <i>“Someone looks stressed,”</i> you begin, looking her in the eye. ");
		if(pc.isNice()) output("<i>“Perhaps there’s something I could do to help?”</i>");
		else if(pc.isMischievous()) output("<i>“I’ve got the cure for that; care to guess what it is?”</i>");
		else output("<i>“If I take care of it, think you could be a </i>little<i> warmer after?”</i>");
		output(" A smile crosses your [pc.face] when you finish speaking, and the myr colonel returns the expression with an understated smirk of her own.");
	}
	// Merge
	output("\n\nYou notice exactly where her eyes go and clear your throat to get her attention. <i>“I’m up here, you know.”</i> Her reaction is almost perfect: between the sudden turning of her head and the sullen pursing of her lips, it’s the closest you’ve seen to Nehzara being flustered.");
	output("\n\nShe draws back from the desk in her rolling chair and gets to her feet, eyes fixed on your face this time. <i>“I know just the place,”</i> she announces. The ant-like woman hooks a finger into your [pc.gear] to lead you toward the doorway. A little taken aback, you follow along, feeling almost like you’re on a leash.");
	output("\n\nThe guards salute when the two of you exit the office, and Nehzara nods approvingly to both of them before returning the formal gesture. <i>“Watch the office and tell any visitors I was pulled away on business,”</i> she states firmly. <i>“Steele and I have to... discuss future diplomatic relations between us.”</i> To their credit, the Scarlet Federation soldiers answer the order firmly and professionally in the affirmative, their faces giving no indication that they suspect their commanding officer was doing anything but what she said. You’re sure the guards are fully aware of what’s really going on, but you can’t tell by looking at them.");
	output("\n\nMerely hearing Nehzara use such a commanding tone has brought a faint blush to your face. You can’t help but imagine her fucking you in the same way: forceful, firm, and in control. You trail behind her, [pc.eachCock] slowly growing in arousal and anticipation.");
	if(pc.isNude()) 
	{
		output(" Your firm [pc.cocksLight] ");
		if(pc.cockTotal() == 1) output("is");
		else output("are");
		output(" standing at full attention for everyone to see, and you catch more than one concerned or incredulous glance from Red Myr soldiers as you and Nehzara pass by them. She looks quite unconcerned, though, which seems a little at odds with how much trouble she’s going through to find a private place for fucking.");
	}
	output("\n\n<i>“In here,”</i> she says, and directs you to a small door almost hidden behind several boxes. <i>“This is where they’ve stuck a few of the smaller supplies, stuff like cleaning tools and the like.”</i> She nods and pulls open the door to pull you inside.");
	output("\n\nShe’s on you immediately. No sooner had the door closed behind you than you find yourself pushed up against the wall, Nehzara’s lips pressed to yours. Her curvaceous body forces itself against you as if she had completely lost control. You’d had a feeling she was pent-up, but this still catches you off-guard");
	if(flags["NEHZARA_CLOSET_FUCKED"] != undefined) output(" even though you’d been expecting it");
	output(". Her surprisingly strong hands feel their way down your sides, her fingers running over your [pc.hips] to give your [pc.butt] a firm squeeze. The myr woman’s tongue forces its way past your lips, wrestling your own [pc.tongue] and pinning it down with a hold as forceful as the one pushing you up against the wall. Your entire mouth tingles oddly, and you begin to feel unbearably warm and lightheaded. You briefly recall something about Reds having a potent aphrodisiac venom in their saliva, but the thought is quickly buried under need as Nehzara’s tongue continues to violate your mouth. Several seconds of this pass before she pulls away, reluctantly letting you go so she can concentrate on making preparations for the main event.");
	if(!pc.isCrotchExposed()) output("\n\nYour [pc.gear] is stripped off you in record time");
	else output("\n\nYou both reach for your gear before it becomes obvious that there isn’t anything between the red myr and your rigid loins");
	output(", and you watch in fascination while Nehzara finally clicks on the light, unbuttons her uniform blouse, and unclasps something – you assume it’s a built-in brassiere – so that you finally get a look at her generous breasts. You’d already noticed she’s a good bit bustier than the other Reds you’ve seen; now that she’s displaying her tits openly, you guess they’re somewhere in the vicinity of a D-cup. They look to have been sculpted by some masterful hand: they’re just the right fullness and perkiness for their size, and the shape couldn’t have been more perfect if she’d paid top-dollar for mods. You only get a second to marvel at them, however, because Nehzara has ideas of her own.");
	output("\n\nThe colonel reaches forward to cup the back of your head with one hand");
	if(pc.hasHair() || pc.isGoo()) 
	{
		output(", her fingers ");
		if(pc.hasHair()) output("weaving their way into your [pc.hair] and affording her a better grip on you");
		else output("burying themselves in the gooey substance");
	}
	output(". You just manage to gasp before your [pc.face] is forced into her newly freed bust. You’re momentarily overcome with her aroma: the mix of pheromones and some sort of Myrellion perfume gives off such a fiercely feminine fragrance that you can’t help but push forward and bury yourself in her cleavage. The olfactory stimulation only adds to the effect her aphrodisiac saliva is working on your body, and you can’t stop yourself from moaning out of pure desire.");
	output("\n\nNehzara responds with a smug smirk and traces her fingers down your unguarded back gingerly");
	if(pc.isGoo()) output(", running them along the surface tension of your gelatinous form and gradually applying more force until the tips of her fingers are inside you");
	output(". The sensation of her slender nails, just barely sharp enough to be felt, ");
	if(!pc.hasFur()) output("running along your [pc.skinFurScales]");
	else if(!pc.isGoo()) output("brushing through your [pc.skinFurScales]");
	else output("working their way into your [pc.skinFurScales]");
	output(" sends an electric tingle through your entire body. What’s even better is that she seems to be enjoying this as much as you are: you can hear her heart racing and feel her body heat climbing in intensity as she holds you in place.");

	output("\n\nYour [pc.face] is finally removed from the amorous diplomat’s bosom when she pulls back to take in the entirety of your naked body. There’s a hungry gleam in her eyes as she looks you up and down. You can still smell her pheromones lingering in your nose, driving [pc.eachCock] crazy with anticipation. Your arousal spatters down to the floor in the form of dribs and drabs of slick, thin pre that dribble down from your [pc.cockHeads].");

	output("\n\n<i>“You want this, too, don’t you?”</i> Nehzara asks, flashing you a fierce smile that shows off her brilliant teeth. <i>“It’s been so long since I saw a cock standing erect for me, just like that...”</i> ");
	if(pc.biggestCockLength() <= 4) output("Her eyebrows rise a little. <i>“Though I wonder if your species substitutes size with passion.”</i>");
	else if(pc.biggestCockLength() <= 10) output("She nods approvingly. <i>“And I look forward to feeling that fullness inside me again.”</i>");
	else if(pc.biggestCockVolume() <= 800) output("She licks her lips as she appraises your package. <i>“Can’t say the drone was that big, though. I look forward to seeing if you know how to use all of it.”</i>");
	else 
	{
		output("She seems to think something over for a moment, and then shakes her head. <i>“There’s no way I can even take that much... women of your species must be very impressive, indeed.");
		if(pc.cockThatFits(800) >= 0) output(" It’s a good thing you’ve got another one better-suited for me, though.");
		else output("I think I know a way to make it work, though.");
		output("”</i>");
	}
	pc.changeLust(33);
	processTime(30);
	imbibeVenomEffects();
	clearMenu();
	addButton(0,"Next",nehzaraClosetPartII);
}

public function nehzaraClosetPartII():void
{
	clearOutput();
	showNehzara(true);
	var x:int = pc.cockThatFits(800);
	if(x < 0) x = pc.smallestCockIndex();
	//(Cock < 7"thick Version:)
	//NO! Cock fits version
	if(pc.cockThatFits(800) >= 0)
	{
		output("Nehzara’s hand grips your [pc.cock " + x + "], and squeezes it tightly before giving a low coo of appreciation when it jumps up at her touch. She gives your shaft a few experimental pumps to toy with you. Overwhelmed by both lust and her presence, you twitch and gasp at the sensations until she’s finally satisfied. She dextrously unbuckles her uniform pants and slinks her way out of them, stripping off everything else and leaving herself clad only in the undone blouse that hangs off her shoulders.");
		output("\n\nMore pleasure courses through you as Nehzara presses her hips to yours; the moist lips of her womanhood grind against the body of your [pc.cock " + x + "] as if kissing it from top to bottom.");
		if(pc.isGoo()) output(" Your gooey surface quickly sucks in her feminine fluids, leaving you thirsty for even more of her passion.");
		output(" She places her lips to your [pc.ear] to let out a small, hungry moan into it, the sensation of her warm breath against your ear only driving you deeper into the hazy heat of arousal. <i>“Good...”</i> she murmurs softly, <i>“now you’re as pent-up as I am. Let’s both get some release....”</i>");

		output("\n\nWith that, the lust-fueled myr takes your [pc.cock " + x + "] in hand and holds it still, pulling her hips back and then slowly, gradually pushing them forward. The warm lips of her vulva meet the tip of your [pc.cockNounSimple " + x + "] and eagerly welcome it inside. You respond with a low, throaty moan, and buck your [pc.hips] up against her abdomen to push more of your throbbing meat inside. The alien pussy ");
		if(pc.cocks[x].thickness() < 4) output("clamps down on");
		else output("stretches to accept");
		output(" your head and shaft, ");
		if(pc.cocks[x].cLength() < 12) output("taking it all the way to the [pc.knot " + x + "]");
		else output("taking an entire twelve inches of your length inside");
		output(". That is when the venom in the myr’s saliva works its magic. Those few seconds of passionate mouth-to-mouth delivered a dose sufficient to drive anyone mad with desire, and the very moment Nehzara’s womanhood wraps around your [pc.cockNounSimple " + x + "], you find yourself locked in the throes of agonizingly unfulfilled need.");

		pc.cockChange();

		output("\n\n<i>“Not bad, Steele,”</i> Nehzara compliments you in a husky voice. <i>“Fuck, it’s been too LONG...”</i> Her womanhood squeezes around your cock as her hands push against your shoulders and pin you against the wall you were leaning against. She’s shockingly strong for a being of her size");
		if(pc.physique() < 20) output("; her power is easily enough to overpower you even if you tried to struggle");
		output(". It seems she’s intent on setting the pace of this session, and you see no reason to deny her in your lust-addled state. She begins to rock her hips forward and back, starting slowly to savor the sensation of you inside her, but quickly picking up momentum once she’s no longer able to hold back.");
		output("\n\nIt isn’t long before both of you are groaning and gasping in the heat of Nehzara’s aggressive, forceful riding. Her soft breasts are forced up against your [pc.chest], and her lips are practically locked together with yours in a kiss which only drives you even deeper into the bottomless pit of lust. Both of you surrender any restraint and start to simply grope each other wherever your hands can reach. Her strong fingers knead at your [pc.ass], pulling your pelvis toward her to try taking as much of you as she possibly can. You’ve resigned yourself to simply letting Nehzara pleasure herself with you, content to take in the pleasure she’s giving as she takes your body for her own use.");

		output("\n\nThe ant-like woman’s sex is drooling at this point, her slick feminine fluids dribbling down onto your groin after completely coating your throbbing shaft. The wetness of her pussy makes a squelching noise every time she pumps her hips to yours, and the lewd noises softly reverberate in the cramped closet to blend together with her breathing and heartbeat into one carnal symphony of mindless passion in your drugged-out mind. Just when you think you’ve had as much as you can take, Nehzara reaches her climax, and her hot snatch squeezes even more tightly around your [pc.cockNounComplex " + x + "]. A rush of her sticky-sweet femcum smears across your crotch as every gyration of her hips grinds and mashes your bodies together.");

		output("\n\nThat’s it. You can’t hold on any longer. With a loud, desperate moan, your [pc.cock " + x + "] erupts and unleashes its payload of [pc.cum] into Nehzara’s own orgasming pussy. Little shivers of pleasure run through you once you’re finished, and you wait for the ant-like woman to pull away now that you’re both done.");

		output("\n\nExcept she doesn’t. Nehzara slows down her hip-thrusts to ride out your simultaneous climaxes, but she soon works back up to her previous pace. Even more than that, you haven’t lost a modicum of hardness, and your lust quickly climbs back up to its previous state. The venom, you manage to puzzle out amidst all the haze enveloping your brain. It hasn’t run its course yet, and as long as that massive dose she gave you is still kicking around your system, your refractory period isn’t going to be anything more than a couple seconds!");

		output("\n\n<i>“Come on, Steele,”</i> she murmurs. <i>“I know you’ve got more of that. Give it all to me.”</i> The myr colonel fiercely digs her nails into your back, ");
		if(pc.isGoo()) output("the surface of your goo giving way and sending ripples of disturbance all along your gelatinous body");
		else if(!pc.hasFur()) output("the bare [pc.skinFurScalesNoun] sending little signals that your brain might have once called pain but now interprets as pleasure");
		else output("pushing them through your [pc.skinFurScales] to the [pc.skin] beneath");
		output(".");

		output("\n\nThis goes on until she rides you into another climax. Your shared moans of passion and grunts of exertion carry on past the second and straight into the third mutual orgasm, until Nehzara is finally satisfied. You were beginning to think she was insatiable, but you can’t deny that it was a good time.");

		output("\n\nYour tired, used [pc.cock " + x + "] slips out of her [pc.cumNoun]-filled womanhood, and you find yourself leaning against the wall at your back for support even after she steps back and is no longer pinning you against it.");
		processTime(33);
	}
	// (Cock > 7"thick Version:)
	//Cock doesn't fit version
	else
	{
		output("Nehzara’s hand grips the head of your [pc.cockBiggest], and squeezes it tightly before giving a low coo of appreciation when the oversized member jumps up at her touch. Her fingers knead the [pc.cockHeadBiggest] slowly so she can toy with you. Overwhelmed by both lust and her presence, you twitch and gasp at the sensations until she’s finally satisfied. She dextrously unbuckles her uniform pants and slinks her way out of them, stripping off everything else and leaving herself clad only in the undone blouse that hangs off her shoulders.");
		output("\n\nMore pleasure courses through you as Nehzara presses her hips to yours; the moist lips of her womanhood grind against the body of your [pc.cockBiggest] as if kissing it from top to bottom.");
		if(pc.isGoo()) output(" Your gooey surface quickly sucks in her feminine fluids, leaving you thirsty for even more of her passion.");
		output(" She places her lips to your [pc.ear] to let out a small, hungry moan into it, the sensation of her warm breath against your ear only driving you deeper into the hazy heat of arousal. <i>“Good...”</i> she murmurs softly, <i>“Now you’re as pent-up as I am. Let’s both get some release....”</i>");
		output("\n\nWith that, the lust-fueled myr takes your [pc.cockNounSimple " + pc.biggestCockIndex() + "] in hand and holds it still, pulling her hips back and then slowly, gradually pushing them forward. The warm lips of her vulva meet the tip of your [pc.cockBiggest] and tighten around the [pc.cockHeadBiggest]. You respond with a low, throaty moan, and buck your [pc.hips] up against her abdomen to try pushing more of your throbbing meat inside.");
		output("\n\nThe alien pussy can’t possibly stretch enough to accept the insanely thick chode, but it does try its damnedest to take in as much as possible, which really just results in her lower lips teasingly squeezing the head. That is when the venom in the myr’s saliva works its magic. Those few seconds of passionate mouth-to-mouth delivered a dose sufficient to drive anyone mad with desire, and the very moment Nehzara’s womanhood wraps around the tip of your oversized organ, you find yourself locked in the throes of agonizingly unfulfilled need.");
		output("\n\n<i>“Damn, I can almost get it in,”</i> Nehzara groans in a husky voice. <i>“Fuck, it’s been too LONG...”</i> She leans forward to pin her chest against yours, and her womanhood squeezes around your [pc.cockHeadBiggest] as her hand squeezes your shaft tightly. It seems she’s intent on setting the pace of this session, and you see no reason to deny her in your lust-addled state. She begins to pump the length of your [pc.cockBiggest] even as her hips rock back and forth to grind her cum-hungry pussy against your thick member. The motions are slow at first so she can savor the sensation of your tip pressing against her too-tight entrance over and over, but they quickly pick up momentum once she’s no longer able to hold back.");
		output("\n\nIt isn’t long before both of you are groaning and gasping in the heat of Nehzara’s aggressive, forceful manipulation of your hefty cock. Her soft breasts are forced up against your [pc.chest], and her lips are practically locked together with yours in a kiss which only drives you even deeper into the bottomless pit of lust. Both of you surrender any restraint, and you start to simply grope at whichever parts of her lithe body that your hands can reach. Two of the myr woman’s slender, chitinous fingers find their way between her legs to gingerly stimulate her clitoris while her vulva is occupied by your [pc.cockHeadBiggest]. You’ve resigned yourself to simply letting Nehzara pleasure herself with you, content to take in the pleasure she’s giving as she takes your body for her own use.");
		output("\n\nThe ant-like woman’s sex is drooling at this point, her slick feminine fluids dribbling down the length of your [pc.cockBiggest] and onto your crotch. The wetness of her pussy makes a squelching noise every time she pushes her hips forward to grind against your overly thick spearhead, and the lewd noises softly reverberate around the cramped closet to blend together with her breathing and heartbeat into one carnal symphony of mindless passion in your drugged-out mind. Just when you think you’ve had as much as you can take, Nehzara reaches her climax, and a rush of her sticky-sweet femcum smears across your groin as every gyration of her hips brings more and more ant-nectar out of her.");
		output("\n\nThat’s it. You can’t hold on any longer. With a loud, desperate moan, your [pc.cockBiggest] erupts and unleashes its payload of [pc.cum] into Nehzara’s own orgasming pussy. Little shivers of pleasure run through you once you’re finished, and you wait for the ant-like woman to pull away now that you’re both done and she’s finally got a cunt full of spunk.");
		output("\n\nExcept she doesn’t. Nehzara slows down her hip-thrusts and clit-rubbing to ride out your simultaneous climaxes, but she soon works back up to her previous pace. Even more than that, you haven’t lost a modicum of hardness, and your lust quickly climbs back up to its previous state. The venom, you manage to puzzle out amidst all the haze enveloping your brain. It hasn’t run its course yet, and as long as that massive dose she gave you is still kicking around your system, your refractory period isn’t going to be anything more than a couple seconds!");
		output("\n\n<i>“Come on, Steele,”</i> she murmurs. <i>“I know you’ve got more of that. Give it all to me.”</i> The myr colonel fiercely grips your cock and redoubles her forceful stroking. Both of those strong hands are tightly holding the throbbing breadth of your [pc.cockBiggest], jerking at the swollen meat with a fervent need to milk you for everything you’ve got.");
		output("\n\nThis goes on until she pumps you into another climax. Your shared moans of passion and grunts of exertion carry on past the second and straight into the third mutual orgasm, until Nehzara is finally satisfied. You were beginning to think she was insatiable, but you can’t deny that it was a good time.");
		output("\n\nYour tired, used [pc.cockBiggest] slips out of her loosened grasp, and you find yourself leaning against the wall at your back for support even after she steps back and is no longer pinning you against it.");
		processTime(33);
	}
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",closetFuckFinaleWithNehzara);
}

// (Merge:)
public function closetFuckFinaleWithNehzara():void
{
	clearOutput();
	showNehzara(true);
	output("<i>“Hmmm,”</i> Nehzara murmurs to herself. She’s still basking in blissful post-sex afterglow, watching you through half-closed eyes while you struggle to work through the effects her venom-traced kisses had on you. The lust has worn off, but you’re still groggy and a little unsteady. You’re sure that was far more than the recommended dose. You make a mental note to remember this for the next time you face the possibility of making out with a Red Myr.");
	output("\n\nYou feel a firm hand grasp your shoulder. Nehzara’s body presses close to yours, and her mouth is by your [pc.ear] before you know it. <i>“That was good, Steele,”</i> she coos in a gentle and almost affectionate tone. Hearing her speak like that sends a warm glow through you that’s completely different from the overpowering lust-venom. <i>“Feel free to visit me any time you make an embassy visit. I’d love to do this again.”</i>");
	output("\n\nThe colonel pulls away, cleaning herself up and pulling on her uniform. She looks every bit as crisp and composed as when you first laid eyes on her, like she didn’t just ride you through three complete orgasms. She clears her throat and extends her hand to give you a pat on the head. <i>“I should return to the office before I’m missed.”</i> Nehzara’s voice has returned to its normal hard tone, but you know it’s only because she’s switched back to professional mode.");
	output("\n\nNehzara gives you a curt nod and leaves the storage closet, letting you take a moment to catch your breath and step back out into the warehouse.");
	//(--Lust, PC is returned to general area description, PC can now take the shuttle to Kressia)
	if (!pc.hasKeyItem("Kressia Pass")) pc.createKeyItem("Kressia Pass", 0, 0, 0, 0, "");
	
	flags["SEXED_NEHZARA"] = 1;
	IncrementFlag("NEHZARA_CLOSET_FUCKED");
	
	processTime(6);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Talk: Refuse
//Tooltip: Tell her that you’d rather not, and that you have other things to offer her.
public function refuseToLickAntPussayOrClosetFuxx():void
{
	clearOutput();
	showNehzara();
	output("You shake your head and ");
	if(pc.isNice()) output("give a polite refusal");
	else if(pc.isMischievous()) output("tell her you’ve got a migraine");
	else output("scoff, amused at such a request coming from a professional officer in her position");
	output(". You speak up just as she’s about to sigh and respond, telling her that you’re not just a passing traveler: you have quite a bit to offer her and her people if she could work with you this once.");
	output("\n\n<i>“Hm. Yes, your people here certainly recognized your name when you arrived. Since they’re not placing you under arrest, it should be safe to assume it’s not because you’re infamous.”</i> Nehzara places her elbows on the desk, folding her hands together and leaning forward to place her chin upon them. <i>“So, Steele... what did you have in mind?”</i>");
	output("\n\nWith a shrug, you explain that, as the heir of an industrial and technological development company, you’d be a great friend to have as their world is catapulted into the future. The UGC is here, and things aren’t going to return to what they were. A little cooperation now could pay dividends in the future.");
	output("\n\nNehzara stares at you for a moment and comes to a decision. You’re sure you notice her antennae twitch and her eyes briefly widen, as if she had suddenly realized something. <i>“Yes,”</i> she says after a little more consideration, <i>“I suppose your science and technology could greatly benefit our race. Perhaps....”</i> She goes quiet suddenly, her sentence drifting off and leaving the rest unsaid.\n\n<i>“Very well, Steele. You’ve got a deal. I do hope your first impression of the Scarlet Federation was a positive one. I’d have made at least </i>one<i> good impression on someone. But... my original offer still stands, for future consideration. I’m sure I can find some way we could help one another out. Now, do you have more questions for me, or may I get back to work?”</i>");
	//(+Lust, PC can now take the shuttle to Kressia)
	if(!pc.hasKeyItem("Kressia Pass")) pc.createKeyItem("Kressia Pass", 0, 0, 0, 0, "");
	processTime(2);
	nehzeraMenu(refuseToLickAntPussayOrClosetFuxx);
}

public function nehzeraMenu(arg:Function = null):void
{
	clearMenu();
	//[Her People] [The War] [Your Mission] [Appearance]
	if(arg == talkAboutNehzarasShittyPeople) addDisabledButton(0,"Her People","Her People","You just discussed this.");
	else addButton(0,"Her People",talkAboutNehzarasShittyPeople,undefined,"Her People","It might be interesting to find out a little more about the Reds from their point of view.");
	if(arg == talkToNehzaraAbootZeWar) addDisabledButton(1,"The War","The War","You just finished talking about that. Maybe a new topic?");
	else addButton(1,"The War",talkToNehzaraAbootZeWar,undefined,"The War","A little history lesson never hurt anyone. A little information on the war might help you while on this planet. Knowledge is power, right?");
	if(arg == talkToNehzaraAboutHerMission || arg == refuseToLickAntPussayOrClosetFuxx) addDisabledButton(2,"YourMission","YourMission","You just finished talking about that. Maybe a new topic?");
	else addButton(2,"YourMission",talkToNehzaraAboutHerMission,undefined,"YourMission","You came here for a reason, and there’s a chance that having access to Red Myr territory could help you find the probe and fulfill your mission. This diplomat is the one who can get you access.");
	
	if(arg == nehzarasAppearance) addDisabledButton(3,"Appearance","Appearance","You’re looking at her right now!");
	else addButton(3,"Appearance",nehzarasAppearance,undefined,"Appearance","Take a closer look at the red myr Ambassador.");
	
	//[Her History] [Under Desk] [Storage Closet] [Breeder Play]
	if (pc.hasKeyItem("Kressia Pass"))
	{
		if(arg == talkToNehzaraAboutHistory) addDisabledButton(4,"Her History","Her History","You just finished talking about that. Maybe a new topic?");
		else addButton(4,"Her History",talkToNehzaraAboutHistory,undefined,"Her History","Wars and politics are interesting and all, but what about the woman in front of you? You could ask how she got here, and why.");
		
		if(pc.lust() >= 33)
		{
			addButton(5,"Under Desk",sexUnderDeskWithNehzara,false,"Under Desk","It’d be more than a little humiliating to be hidden under a desk and used like some stress-relief toy, but there’s a saying about scratching backs....");
			if(pc.hasCock() && !pc.isTaur()) addButton(6,"StorageCloset",sexWivNehzaraInStorageCloset,false,"Storage Closet","You’ve got what she wants, but you know she’ll want to call the shots. Still, going along with Nehzara and letting her use you for her own pleasure could be fun for both of you.");
			else addDisabledButton(6,"StorageCloset","Storage Closet","You must not have any kind of tauric body and have a penis in order to access this scene.");
		}
		else 
		{
			addDisabledButton(5,"Under Desk","Under Desk","You’re not aroused enough for sexual hijinx at the moment.");
			addDisabledButton(6,"StorageCloset","StorageCloset","You are not presently aroused enough for sexual hijinx.");
		}
		if(arg == talkToNehzaraAboutHistory) addButton(9,"Trench Wives?",trenchWives,undefined,"Trench Wives?","Wait... trench wives? There’s an unusual term, and she said something about <i>“war trophies.”</i> You could ask her to elaborate on that.");
		if(arg == trenchWives) addDisabledButton(9,"Trench Wives","You just finished that discussion.");
	}

	if (flags["NEVRIE_QUEST"] == 1 && flags["NEHZARA_BLOOD_SAMPLE"] == undefined && !pc.hasKeyItem("Red Myr Blood")) addButton(10, "BloodSample", nehzaraBloodSample, undefined, "Blood Sample", "Ask Colonel Nehzara if she’d be interested in providing a sample of her blood for the purpose of myr gene-mod development.");

	addButton(14,"Leave",leaveNehzara);
}

//Special: Wanna Feel?
//Procs upon selecting [Nehzara] if PC is female/herm and pregnant and is visiting Nehzara after engaging in at least one sex scene. Unsure if it should happen more than once. I’m thinking one time only, or at least only once per pregnancy.
public function wannaFeelABellyYouAntSlutWhoreBitchNazi():void
{
	clearOutput();
	showNehzara();
	output("Once you’re in Nehzara’s office, the officer looks up to greet you. <i>“Steele,”</i> she says after a moment. You can tell she tried to make that sound like an offhand salutation, but there was something uncertain in her voice just then. That’s when you notice her stare lingering on your swollen belly. Ah. You recall that bearing children is a pretty big thing in both myr societies, and that most of them are completely infertile. You’d never asked Nehzara whether she was or not, but given her position....");
	output("\n\nNehzara clears her throat, which shakes you out of your pensive reverie. <i>“Is there anything I can help you with, Steele?”</i> she asks, prompting you to decide whether to ignore her momentary display of envy or to pursue the subject.");
	//(Usual list of options, plus [Wanna Feel?])
	clearMenu();
	addButton(0,"Wanna Feel?",heyAntHitlerWannaFeel,undefined,"Wanna Feel?","She may not be able to bear children, but that doesn’t mean she can’t have the chance to experience the wonder of new life taking shape. You could offer to let her feel it and see what it’s like.");
	addButton(1,"Ignore",ignoreBellyRubs,undefined,"Ignore","Continue on with business as usual.");
}

public function ignoreBellyRubs():void
{
	clearOutput();
	showNehzara();
	output("You decide to ignore your gravid state and broach another topic of discussion.");
	nehzeraMenu(ignoreBellyRubs);
}

//[Wanna Feel?]
//Tooltip: She may not be able to bear children, but that doesn’t mean she can’t have the chance to experience the wonder of new life taking shape. You could offer to let her feel it and see what it’s like.
public function heyAntHitlerWannaFeel():void
{
	clearOutput();
	showNehzara();
	output("With a ");
	if(pc.isNice()) output("warm smile on your face");
	else if(pc.isMischievous()) output("soft smirk and a wink");
	else output("half-hearted roll of your eyes");
	output(", you approach her desk and move your [pc.gear] out of the way of your [pc.belly]. <i>“Here,”</i> you say softly, and reach forward to put one hand on her shoulder. <i>“I don’t think you’ve had many chances to feel what it’s like.”</i>");
	output("\n\nThe normally composed diplomat is visibly shocked. <i>“I...”</i> she begins hesitantly, <i>“I haven’t. Those of us who can... can bear young don’t really leave the cities very often at all. An old soldier like me wouldn’t know anything about it.”</i> She looks up at you, those eyes of hers seeming sad for the first time that you can recall. There’s more she wants to say but never will. You doubt you could coerce her into spilling it if you tried.");
	output("\n\nThen, slowly, Nehzara reaches out with an uncertain hand and places it on the curve of your midsection. The ");
	//(if eggpreg:)
	if(pc.hasPregnancyOfChildType(GLOBAL.CHILD_TYPE_EGGS)) output("hard, unyielding tautness of your egg-filled womb nevertheless manages to give off some feeling of vitality, enough to captivate the barren myr woman and leave her speechless");
	else output("sudden kick that meets her touch surprises Nehzara enough to make her withdraw, though she quickly places her palm back where it was so she can feel another kick. You guess that since the myr have egg-based births, this must be doubly fascinating for her");
	output(". The bewildered expression on her face isn’t one you’d normally expect to see, and you savor this rare moment while the disciplined officer’s guard is down.");

	output("\n\nNehzara pulls her hand away after a few seconds and settles back into her seat. With a barely audible sigh, she recomposes herself and looks up at you as if nothing had happened. <i>“Thank you for that, Steele. Now... was there anything else you wanted of me?”</i>");
	flags["NEHZ_PREGGO_RUB_HAPPENED"] = 1;
	//(Normal list of options)
	nehzeraMenu(heyAntHitlerWannaFeel);
}


//Special: A Warrior’s Honor
//Procs randomly (maybe 20% chance) one time when entering the warehouse/office room of the map. Only procs if the PC has met Nehzara, Lyralla, and Juro at least once, and has sexed Nehzara.
public function nehzarasWarriorHonor():void
{
	clearOutput();
	author("Kaizer_Z");
	showName("\nCONFRONTATION!")
	showBust("NEHZARA","LYRALLA","JURO");
	output("You ");
	if(pc.legCount > 1) output("step");
	else output("slide");
	output(" into the cluttered warehouse which hosts much of the Scarlet Federation’s embassy staff, expecting to see the same busy scene that you’re normally greeted with. You get a bit of a shock when you find yourself witnessing a rather alarming argument in progress.");
	output("\n\n<i>“You deliberately drugged him with that brain-rotting ooze of yours, and you know it!”</i> Colonel Nehzara is in fine form: snapping, snarling, and looking as though she’s about to rip off the head of the woman standing in front of her... which would be Ambassador Lyralla.");
	output("\n\n<i>“Hogwash! You Reds wouldn’t know hospitable diplomacy if it rubbed its honey-spouts in your faces, and that’s why you lost out on the deal!”</i> The Gold ambassador looks equally confrontational, and you’re uncertain whether they’ll be able to restrain themselves for much longer. A fight could break out at any moment, and both of them are accompanied by numerous subordinates. No one’s armed, but you’re aware that myr are strong enough to cause plenty of damage without the aid of weaponry.");
	output("\n\nFortunately, Ambassador Juro is on the scene as well, and he’s not alone either. UGC servicemembers of various races stand ready beside and behind him as he does his best to cool down the heated exchange and ease the mood. You breathe a sigh of relief. That wouldn’t have been a catfight: it would have been a disaster.");
	output("\n\nOnce Juro’s done his job, the Golds move to the other side of the warehouse and the UGC personnel disperse. You learn from one as he passes by that Lyralla had recently signed an agreement with a major interstellar biotech corporation that strongly favored the Golds. It was the most drastic deal to date, and was only possible because the UGC had just loosened restrictions on outside parties dealing with Myrellion... and Nehzara had set her sights on attaining it. Lyralla went to meet with one of the Red legal consultants today, and Nehzara had confronted her as soon as she entered the Red area.");
	output("\n\nYou notice that Nehzara is standing by the door of her office and talking with a younger myr that your codex informs you is adorned with the trappings and insignia of a lieutenant. She looks to have calmed down somewhat, though the junior officer is still fuming. You could go talk to them, or you could decide to come back later.");
	processTime(3);
	//[Nehzara & Lt.] (Going back to the hangar and coming back would meet with the normal screen)
	addButton(0,"Nehzara & Lt.",nehzaraAndLTFollowupToHonor,undefined,"Nehzara & Lt.","Go see what’s up.");
}

//[Nehzara & Lt.]
public function nehzaraAndLTFollowupToHonor():void
{
	clearOutput();
	showNehzara();
	showBust("NEHZARA","MYR_RED_GUARD");
	flags["NEHZ_WARRIORS_HONOR_SCENE_HAPPENED"] = 1;
	output("You decide to go over and see how Nehzara’s handling the disappointment of watching her rival snatch a major accomplishment out from under her. You’ve never seen her so furious, and you’re sort of worried that she might do something drastic. She <i>was</i> a warrior long before she was a diplomat, after all.");
	output("\n\n<i>“The goddamn nerve of that honey-guzzling bitch...”</i> Nehzara’s grumbling to herself and has her arms crossed over her chest, just under her bust. You can’t help but notice that the pose she’s struck makes her bust look absolutely fantastic, though that’s probably the last thing on her mind.");
	output("\n\nHer face brightens when she sees you approaching. The change is subtle, but she definitely perks up a little once you’re there. <i>“Steele,”</i> she says by way of greeting. <i>“No doubt you saw what just happened. That sorry excuse for an ambassador gets away with blatantly drugging a corporate representative and no one does a damn thing.”</i>");
	output("\n\nYou decide not to mention that she’s the one with the lust-inducing venom on her side.");
	output("\n\n<i>“Can’t be helped,”</i> she continues with a sigh. <i>“The Golds have never fought fair, and there’s no reason for me to expect them to start. Sorry you had to see that, Steele, but it’s the reality of this embassy. Just because we’re not shooting each other, that doesn’t mean the Golds aren’t trying to fuck us over however they can manage. Only difference is that now we can’t even retaliate in the way we’re best-suited for. The UGC likes to act as if they’re a neutral party, but every day sees them sucking up more and more to the Goldies. First they shoehorn us into this warehouse, and now they’re letting that vapid cunt schmooze visitors any way she feels like. Probably offered the degenerate fuck a drink straight from the damn tap of one of their honey-whores.”</i> Her voice still drips with bile and contempt, but the tone is more one of exhaustion than active fury.");
	output("\n\nThe lieutenant beside her, however, has not calmed down. <i>“They’re leaving us high and dry, Colonel! We can’t just leave it at this! I say we give that tin-plated gimp a good-”</i>");
	output("\n\n<i>“Lieutenant.”</i> Nehzara’s voice is like a razor as she cuts off her subordinate. Where she’d been obviously irritated before, now she radiates an icy calm that’s actually kind of terrifying. The young officer’s eyes go wide at being interrupted, but Nehzara isn’t finished.");
	output("\n\n<i>“I will </i>not<i> tolerate speech like that again. A warrior’s scars are her </i>pride<i>, and I don’t have any inclination to listen to some upstart hatchling whose entire time in uniform has been spent licking the boots of her superiors like some nyrea’s bitch run her goddamn mouth about anyone who’s actually given her all in real combat. Do I make myself </i>clear<i>, Lieutenant?”</i>");
	output("\n\nOh snap.");
	output("\n\nThe chastised officer is clearly having difficulty figuring out how to respond. Her entire body is tensed, and for a moment you think she might actually be about to strike her commanding officer. Instead, she finally swallows her rage and mutters a half-hearted <i>“Yes, Colonel.”</i> Nehzara coolly dismisses her, and the lieutenant delivers a snappy about-face and storms off.");
	output("\n\nThe diplomat shakes her head and faces you again. <i>“Once again, I’m sorry you had to see that. Today has just been one unpleasant interaction after another.”</i> She leads you into her office and takes a seat in her normal chair. You can tell that she immediately feels more comfortable in the familiar setting of you standing before her desk like this. <i>“So, Steele...”</i> Her face softens when her lips form the familiar words. <i>“Is there anything I can help you with?”</i>");
	processTime(4);
	nehzeraMenu(nehzaraAndLTFollowupToHonor);
}

//Leave
//Tooltip: Tell Nehzara you’ve got places to be, and get out.
public function leaveNehzara():void
{
	clearOutput();
	showNehzara();
	output("With a shrug, you say you’re out of questions and should probably ");
	if(pc.isNice()) output("get out of her hair");
	else if(pc.isMischievous()) output("leave her to think up more ways to drive people off");
	else output("seek out more pleasant company");
	output(".\n\nThe colonel gives you a curt, formal farewell and returns to the paperwork on her desk, leaving you to turn around and make your way out.");
	//(Returns PC to the warehouse area description, and allows for movement back to the hangar)
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function nehzaraBloodSample():void
{
	clearOutput();
	showNehzara();

	output("After a moment of thinking over precisely how to breach the subject, you");
	if (pc.isNice()) output(" carefully");
	else if (pc.isMischievous()) output(" archly");
	else output(" curtly");
	output(" mention to Nehzara that you happen to be in need of a red myr blood sample and that you’d appreciate it if she were to generously provide you with a donation.");
	
	output("\n\nThe colonel just gives you a quizzical look before steepling her fingers in front of her and leaning forward. <i>“Ah, so one of your people wants to study our genetics. I’d heard that one of your research firms was performing preliminary work on some manner of transformative, but I hadn’t expected to hear anything about it for another few weeks.”</i>");
	
	output("\n\nYou have to admit that you’re a little surprised. You hadn’t expected her to immediately guess exactly what you had in mind.");
	
	output("\n\n<i>“Really, Steele?”</i> She sighs and locks eyes with you, her gaze level and unwavering. <i>“It’s my job to know what the UGC assets on-planet are up to. And I do my damn job, no matter how I may feel about it.”</i>");
	
	output("\n\nFair enough, you suppose. So, does that mean she’s willing to donate?");
	
	output("\n\nNehzara sits back and places one hand under her chin, regarding you with a subtle smile. <i>“After all");
	if (flags["SEXED_NEHZARA"] != undefined) output(" you’ve done for me, [pc.name]?”</i> Her eyes light up and you think you can see her face grow just a shade more crimson. <i>“I suppose I could find it in my heart to lend you a hand.");
	else output(" the UGC has done for me?”</i> Her question is sarcastic, but her expression isn’t as severe as the tone. <i>“Well, I suppose I could help them out anyways; a good diplomat has to be willing to open negotiations with an offer and merely hope her compliance is reciprocated. Fine.");
	output(" Do you have the container?”</i>");
	
	output("\n\nYou nod and produce the vial you were given earlier, placing it on Nehzara’s desk.");
	
	output("\n\n<i>“Let’s not waste any time,”</i> she says casually, and with a lightning-fast movement that catches you by surprise, she reaches down to her waist and draws out a gleaming knife you hadn’t noticed before, flicking it into the air and catching the handle dextrously to hold the weapon in front of her face. Where had she been hiding that?");
	if (flags["SEXED_NEHZARA"] != undefined) output(" You’ve watched her strip down entirely and never caught a glimpse of any blade on her!");
	output(" The silvery stiletto isn’t very large, but it’s sharp enough to easily cut flesh, and you can imagine it’s plenty deadly with the proper application of precision and force.");
	
	output("\n\nWithout hesitating for a moment, Nehzara holds her left hand above the vial and draws the blade along her palm. You almost mention that a finger-prick would have sufficed, but you decide to just let her show off this time around. With her large cut, it does not take long at all for Colonel Nehzara to provide you with enough blood.");
	
	output("\n\nThe Red diplomat sets about applying a bandage to her hand, something you can’t help but point out wouldn’t have been required if she’d just pricked her damn finger instead.");
	
	output("\n\n<i>“Oh, I’m aware,”</i> she says flippantly, brushing off your comment. <i>“But I don’t have all day to bleed for my people. Not anymore, anyways. Now,”</i> she huffs, <i>“did you get what you came for?”</i>");
	
	output("\n\nYou shrug and take the vial back, screwing on the lid and placing it where it’ll be safe. Leave it to Nehzara to end things on a sour note like that. Maybe she’s just feeling especially broody at the moment. You could cheer her up, take her mind off things, or just get out and take care of your own business.");

	output("\n\n");
	pc.createKeyItem("Red Myr Blood", 0, 0, 0, 0, "A vial of blood sampled from a red myr.");
	output("<b>(Key Item Acquired: Red Myr Blood)</b>");

	processTime(15+rand(5));

	flags["NEHZARA_BLOOD_SAMPLE"] = 1;

	nehzeraMenu()
}
