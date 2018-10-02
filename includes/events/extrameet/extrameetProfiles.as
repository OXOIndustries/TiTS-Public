/**
 * ExtraMeet, aka Space Tinder https://docs.google.com/document/d/1bg6ghHmFqxh-WAqBvDslo1zXhFigxjOLvNNZpDqQU3o/edit
 * @author DrunkZombie
 * 
 * this class contains the individual profile stuff, extrameet.as has the core logic for the site itself
 */

//tavros

//saving_grace04
//[EXTRAMEET_SAVINGGRACE04]
public function extrameetSavingGrace04Profile():void
{
	output("The profile picture on your screen is of a young blonde woman with bright blue eyes. She appears completely human, and you can’t help but notice the sign of the church of the one god around her neck.");
	output("\n\nUsername: Saving_Grace04");
	output("\nSex: Female");
	output("\nAge: 20 Years");
	output("\nRace: Human");
	output("\nPlanet: Tavros");
	output("\n\nBio:");
	output("\nYoung woman looking for a prayer partner in this dark and twisted place. My faith is the most important part of my life and I’m not interested in being tempted by the devils here. BYOB means bring your own bible!");
}
public function extrameetSavingGrace04CheckMatch():Boolean
{
	//no requirements so just return true		
	return true;
}
public function extrameetSavingGrace04Date():void
{
	showName("SAVING\nGRACE 04");
	author("Fr0sty");
	moveTo("ANON'S BAR AND BOARD");
	output("You arrive at Anon’s Bar and Board and scan the room, spotting your date sitting in the far back. As you make your way towards her you try to size her up. She is pure human for sure, and while you wouldn’t say she is over dressed she is certainly the most covered up person in the whole bar. Her outfit consists of a long sleeved turtle neck and a skirt that comes all the way down to her ankles.");
	output("\n\nAs you come to a stop beside her she looks up at you, an unimpressed expression painted across her face. <i>“Lovely place”</i>. Her gaze moves past you, scanning the room. <i>“Did we have to meet here?”</i> She sighs and returns her gaze to you, smiling. Something about her smile seems off to you, but you can’t quite place why. You take a seat across from her and introduce yourself.");
	output("\n\n<i>“Pleased to meet you. I’m Grace.”</i> Her odd smile widens, which only makes it seem weirder. <i>“So. Your profile wasn’t very informative; what brings you...”</i> Her smile fades into a frown, and she nods her head towards the room. <i>“Here.”</i>");
	output("\n\nYou start to tell Grace about the recent developments in your life. You even talk about the probes, inheritance, and spend quite a bit of time speaking of your adventures. While you’re talking you take note of Grace’s expression, finding her very difficult to read. While she is listening, you get the sense she is simply being polite and really doesn’t care about what you’re talking about. You decide to cut things short and let her speak instead, asking what brings her to Tavros.");
	output("\n\n<i>“Mission work.”</i> By her tone you can tell she isn’t happy about it . <i>“It’s part of my studies back home. I have to go out into the galaxy and try to save some of it.”</i> She looks at the crowd over your shoulder. <i>“It’s not going very well.”</i>");
	output("\n\nYou chuckle at that, but cut it short when her gaze returns to you. It occurs to you then why her smile seems so weird. It’s her eyes. Her eyes are filled with nothing but disdain and hate. You sit in silence a moment, feeling awkward. She breaks the quiet between you. You ask her what sort of studies she is taking.");
	output("\n\n<i>“Religion. So. Are you ready to repent?”</i> Her blue eyes narrow in on you, and she gives you the closest thing to a genuine smile you’ve seen from her.");
	output("\n\nYou contemplate her question a moment. <i>“Um... Is that a proposition?”</i>");
	output("\n\nGrace rolls her eyes, dropping her hand down to her lap. She pulls up a very thick book you recognize to be a bible of the church of the one god. You stare at the text a moment then look back up at Grace, who’s still smiling. <i>“I’m going to save your soul.”</i>");
	output("\n\nYou start to speak, but are unsure exactly what to say. You settle on asking her why exactly she wants to save your soul in particular.");
	output("\n\nShe shrugs. <i>“Well, out of all the profiles I looked at, you were the one I could tell was the most debased and full of sin.”</i> She opens up her bible and flips through a few pages. <i>“Ready to start?”</i>");
	
	processTime(5);
	addButton(14,"Bail",extrameetBailScene);
}

//_Mr.Fox_
//[EXTRAMEET_MRFOX]
public function extrameetMrFoxProfile():void
{
	output("The profile picture on your screen is a professional headshot of a rather handsome red haired man with what appears to be a set of fox ears on the top of his head. From what you can tell, the man seems clean cut and professional.");
	output("\n\nUsername: _Mr.Fox_");
	output("\nSex: Male");
	output("\nAge: 36 Years");
	output("\nRace: Human+");
	output("\nPlanet: Tavros");
	output("\n\nBio:");
	output("\nRecent divorcee looking for an open minded companion. Hopeless romantic and classic gentleman. Younger woman preferred.");
}
public function extrameetMrFoxCheckMatch():Boolean
{
	//morphed nontaur women (female with a vagina and no cock)
	if (pc.isWoman() && !pc.isTaur() && !pc.isHuman()) return true;
	else return false;
	
}
public function extrameetMrFoxDate():void
{
	showName("\n_MR.FOX_");
	author("Fr0sty");
	moveTo("ANON'S BAR AND BOARD");
	output("You arrive at Anon’s Bar and Board and immediately spot the familiar fox ears of your date in the back over the din of the busy bar. He is wearing a dark grey suit, fitting snugly against his frame, and you note a bushy bright red fox tail sticking out behind him. As you move in closer, he notices you and stands up from his seat, a wide smile on his face.");
	output("\n\n<i>“[pc.name] Steele?”</i> He moves to the otherside of the table, pulling out your chair for you. <i>“Rodney Hill, at your service.”</i>");
	output("\n\nYou take your seat and let him push your chair in. He glides back around the table with grace and takes his seat again across from you. You introduce yourself properly to the so far chivalrous man.");
	output("\n\n<i>“I’m sorry for the... poor atmosphere.”</i> The morphed human gestures around. <i>“Tavros isn’t exactly known for its fine dining establishments after all. So tell me a bit about yourself.”</i>");
	output("\n\nYou tell your companion about the recent developments in your life, including the matters of the probes and the race for the inheritance. Rodney listens intently, his eyes never leaving your face. He nods along until you finish after many minutes. <i>“So, what about yourself?”</i> You ask.");
	output("\n\n<i>“Oh, well nothing so exciting as your tale, I assure you. Well, I’m recently single and trying to get back into the dating scene. If present company is any indication, that seems to be going well.”</i> The older gentleman gives a sensible chuckle.");
	output("\n\nYou recall his profile said he was married, and you decide to ask him about that.");
	output("\n\nThe fox morphs chuckle withers before your eyes. <i>“Ah. Well, I suppose I must address that. My wife... well, ex wife, was a firm follower of the Church of the One God. Her and I had some points of contention about how I should live my life.”</i>");
	output("\n\n<i>“You mean those?”</i> You point at the fox ears on top of your date’s head.");
	output("\n\n<i>“Precisely. Well, and a few other tweaks.”</i> He gives you a wry smile. <i>“She was adamantly against mods of any kind, and I was tired of living a lie. So, we reached an impasse. I believe we are both much happier now.”</i> He leans in across the table, his tone slowly becoming more passionate. <i>“I could tell you are the same when I saw your profile. Unsatisfied with being just as you are. Yearning to be... more. Am I wrong?”</i> He smiles at you.");
	output("\n\nYou can’t disagree with him, and give him a shrug and a nod.");
	output("\n\nRodney leans back and sighs. <i>“I’m so glad to hear that.”</i> He shifts in his chair and clears his throat. <i>“If I can be bold for a moment. Would you be at all interested in coming back to my place for a more... intimate setting?”</i> The fox morph gives you a suggestive smile.");
	
	processTime(5);
	addButton(0,"Go with him",extrameetMrFoxSex,undefined,"Go with him","Go back to his place");
	addButton(14,"Bail",extrameetBailScene);
}
public function extrameetMrFoxSex():void
{
	clearOutput();
	clearMenu();
	showName("\n_MR.FOX_");
	author("Fr0sty");
	//find the vag he fucks
	var vag:int = pc.cuntThatFits(chars["MRFOX"].cockVolume(0));
	if (vag < 0) vag = rand(pc.vaginaTotal());
	
	moveTo("LIFT: RESIDENTIAL DECK");
	output("You tell your companion you’d like that, causing his smile to widen. He escorts you out of the bar and you two make your way to the elevator, riding it up to the residential level. After that, you find it’s a short walk down the hall to his apartment. He fiddles with the door, opening it. <i>“Sorry about the mess. Bachelor life is still sort of new to me.”</i>");
	output("\n\nYou step into the apartment and look around. It’s a bit plain, and could use a bit of dusting, but fairly in order other than that. You turn around to face your date only to have him seize you in his arms, wrapping you up tightly before pressing his lips against yours with lustful vigor. The lip lock surprises you, as does his embrace, but you can’t help but kiss the forward vulpine man back. You feel his hands start to wander, running along the small of your back towards your [pc.ass].");
	output("\n\nHe pulls his lips off of yours, speaking in a husky tone. <i>“I’m sorry, I couldn’t help myself.”</i> He leans back in kissing you again, his lips soft and inviting. His hands leave your backside and move to his own shirt, attempting to pull it up and off. You give him a hand, and the two of you start pulling away each other’s clothing and gear, stripping down while fumbling against each other. With your faces still pressed together, you don’t get a look at his equipment yet, but from what your wandering fingers feel, you can’t help but get excited. Somehow, the two of you make it to his bedroom.");
	output("\n\nHe withdraws again and gently pushes you backward onto the bed, giving you a proper view of the man. His body is hard and firm, signs the man has taken care of himself over the years. Your eyes trail downward, seeing something else hard and firm about him. His cock is distinctly Terran, but you can tell it is enhanced by being longer and thicker than normal. An an eyeballs guess, you judge it to be around ten inches long, and well over two inches thick. You feel your face blush, wondering how it’s all going to fit.");
	
	
	output("\n\nThe older man surprises you by kneeling down in front of you, getting eye level with your [pc.vagina " + vag + "]. <i>“Allow me to warm you up first.”</i> Rodney leans in closer, sticking out his tongue. You gasp softly as he gives you a gentle flick, grazing it against your womanhood. Emboldened by your sound, he moves in closer, his tongue sliding along you with more pressure. With practiced precision he runs his long tongue up and down your labia");
	
	if (pc.hasClit()) output(", being sure to give your [pc.clit] more than a little bit of teasing. His tongue sends shivers through you, and you can’t help but arch your back each time he visits your sensitive pleasure button.");
	else output(".");
	
	output("\n\nA minute later he leans back, his tongue retreating from your now tingling, dripping wet snatch. <i>“Ready for the main attraction?”</i> Rodney stands up, his fully erect member coming into full view. He reaches down and grasps it, showing it off like a prize.");
	output("\n\nYou give him a nod, biting your lip in excitement, and the older man steps forward, pressing his Terran cockhead against you. He tenderly probes your slick folds, sliding his impressive crown into your wet and waiting cunt. You can’t help but cry out softy, his girth overwhelming you for a moment. Inch by inch he slides in further, taking his time and not putting too much strain on you as your pussy stretches to accommodate him. It doesn’t take him long to get over half his shaft deep inside you. The fox morph seems to grow tired of taking it slow, and starts to pump his hips slowly, thrusting gently at your well prepared cunt.");
	
	pc.cuntChange(vag, chars["MRFOX"].cockVolume(0), true, true, false);
	
	output("\n\nThe enormous cock inside you causes you to tremble with overwhelming sensation, and you groan hoarsely. Your back arches and your toes curl each time Rodney delivers a thrust, each time pushing in a bit further as your tight snatch loosens. Above you the fox man starts to grunt as he puts more effort and force into each of this thrusts, burying his thick meat deeper. You feel your cunt spasm as waves of pleasure ripple throughout your body. The sensations from your sex make your [pc.skinFurScales] start to prickle with a sort of electricity, causing you to gasp and moan in response.");
	output("\n\nRodney starts to accelerate his pace, his own lust apparently getting the better of him. He hammers away at you, burying his meat in as far as he can, each thrust causing the whole bed to shake. You cry out in a mix of pain and pleasure, your cunt being pushed to its limits. The older man is getting close, his breathing is shaky and his thrusts are growing erratic. You are on the brink yourself, with only a little bit more needed to push you over the edge.");
	output("\n\nYou grip his thighs tightly, the prick of your fingernails seeming to spur him on, faster and harder, and you wail with cresting pleasure. Beads of sweat form on his brow from his efforts, and the thick shaft of his cock plunges into you, over and over again, stoking the fires of both your climax and his, until finally his meat pulses in your cunt, gushing thick seed. For you, the wave of sensation reaches its height, and washes over you in delicious, sinful waves, and you moan blissfully. He sighs his pleasure, giving a few final thrusts.");
	
	processTime(30 + rand(15));
	pc.loadInCunt(chars["MRFOX"], vag);
	pc.orgasm();
	
	output("\n\nHe slowly drags his cock, dripping with cum, from your twitching cunt, unleashing a flood of his hot man juices from your gloriously stretched pussy. <i>“Ah shit. That was great.”</i> He leaves you there a moment, retrieving a damp cloth. With surprising consideration, he wipes you clean. <i>“Thank you for your company. Do you need me to escort you home?”</i>");
	output("\n\nYou refuse, but thank him for the offer anyway. You collect your things and tell your date you enjoyed yourself.");
	output("\n\n<i>“Well that’s what I had hoped for.”</i> He walks you to the door, stopping at the threshold. He goes to hug you, but stops himself and laughs. <i>“I’m not really sure what the etiquette is for something like this.”</i> Instead he offers you his hand awkwardly.");
	output("\n\nWith a chuckle, you take it and give it a shake, then bid farewell and head out on your way.");
	
	IncrementFlag("EXTRAMEET_SEX");
	IncrementFlag("EXTRAMEET_ORAL_RCVD");
	IncrementFlag("EXTRAMEET_CUNT_RCVD");
	
	addButton(0,"Next",mainGameMenu);
}
	
//LadyGlamor
//[EXTRAMEET_LADYGLAMOR]
public function extrameetLadyGlamorProfile():void
{
	output("The profile picture on your screen is a heavily filtered selfie of a young Ausar. The young woman is giving the camera a pouty expression, and is wearing very well applied makeup. The picture is in black and white and looks edited in some way.");
	output("\n\nUsername: LadyGlamor");
	output("\nSex: Female");
	output("\nAge: 18 Years");
	output("\nRace: Ausar");
	output("\nPlanet: Tavros");
	output("\n\nBio:");
	output("\nProfessional model. Career focused girl looking to build connections. Like minded individuals are welcomed. Willing to meet both for social and professional reasons.");
}
public function extrameetLadyGlamorCheckMatch():Boolean
{
	//has cock
	if (pc.hasCock()) return true;
	else return false;
	
}
public function extrameetLadyGlamorDate():void
{
	showName("LADY\nGLAMOR");
	author("Fr0sty");
	moveTo("ANON'S BAR AND BOARD");
	output("You arrive at Anon’s Bar and Board and see your date sitting off in the corner, staring down at a device in her hands. Without the black and white filters you can see her hair and fur are reddish brown, and she is wearing a bit less makeup than in her picture. She’s wearing a low cut black top and a checkered skirt, along with a very expensive pair of shoes. You make your way over.");
	output("\n\nWhen you get to the table, she glances up from her device for a moment. <i>“[pc.name] Steele, pleasure to meet you. Please sit.”</i> Her eyes shift back down to the small device, which you can now tell is a small handheld computer. She is tapping away at the screen, paying you no attention.");
	output("\n\nYou cautiously take your seat. <i>“How do you know my name?”</i>");
	output("\n\nThe ausar keeps her eyes on the small computer. <i>“Really? You’re the heir to one of the biggest fortunes ever and you’re surprised when people know who you are?”</i>");
	output("\n\nYou frown at her answer, but it does make sense. You brush it off and ask the young woman for her name.");
	output("\n\nHer eyes leave her device and meet yours. <i>“Professionally I am LadyGlamor.”</i> She gives you a small frown. <i>“However, I suppose you meant my real name. It’s Elva.”</i> She looks back down at her computer, fingers punching away at the screen.");
	output("\n\nThe two of you sit in silence for a long moment. You can’t help but feel frustrated at the divided attention you’re getting. Before you can call her out, the ausar puts the small device down and looks at you.");
	output("\n\n<i>“Alright. Business. This date has already increased my subscriber count by about 100,000 followers. I didn’t think it would be that good of a boost. Guess your name really is still relevant.”</i> You give Elva a blank stare, not quite understanding. You’d only been at the table five minutes. <i>“You’ve been very helpful. Now, I understand how this works. You want me to do you a favor, and I know the currency your family deals in. While I’m not willing to give you my body, would a blowjob be sufficient compensation for your time?”</i> She gives you a sweet smile.");
	output("\n\nWell that you understand.");
	
	if(!CodexManager.entryUnlocked("Ausar")) 
	{
		output("\n\nYour codex beeps to inform you it’s identified the Ausar race.");
		CodexManager.unlockEntry("Ausar");
	}
	
	processTime(5);
	addButton(0,"Um, sure?",extrameetLadyGlamorSex,undefined,"Um, sure?","Get a BJ from the 18 year old ausar.");
	addButton(14,"Bail",extrameetBailScene);
}

public function extrameetLadyGlamorSex():void
{
	clearOutput();
	clearMenu();
	showName("LADY\nGLAMOR");
	author("Fr0sty");
	
	var kok:int = rand(pc.cockTotal());

	output("The young Ausar sticks her device away and stands up, brushing her skirt off. <i>“Alright. Let’s get this over with.”</i> She starts to walk off, not towards the exit of the bar, but the restrooms instead. Not wanting to get left behind, you follow after the young woman. Boldly, she walks right into the men’s room, not even pausing to consider it. You enter a few seconds after her, catching a glimpse of the ausar entering a stall.");
	output("\n\nYou hear her call out a moment later. <i>“You coming?”</i> You pause a moment, but make your way over to the stall, the young woman leaning against the wall. Her eyes are heavy and she looks bored. She stares at you a moment, then rolls her eyes. <i>“Gonna sit down?”</i> With a sigh, you take a seat on the toilet, trying to get comfortable.");
	output("\n\nElva rolls her shoulders, pulling herself off the wall and starting to drop down to her knees. You watch her flex her cheek muscles, making a few funny expressions. She positions herself directly in front of you, then reaches out and starts to fiddle with your gear. It doesn’t take the ausar long to pull your [pc.cock " + kok + "] free, holding it tightly with a furry hand. She glances up at you, her expression still bored and lazy. <i>“Really? This is it?”</i> Her fingers grip you tighter, and you feel your semi erect cock start to slowly swell between her furry digits. She gives you a smirk. <i>“There we go. Much better.”</i> The wolfy woman leans in and plants a light kiss on your [pc.cockHead " + kok + "].");
	output("\n\nWithout warning, she lowers her soft lips further along your still growing veiny shaft, taking you in quicker that you expected. You can’t help but softly moan as you’re taken into her mouth, her tongue feeling warm against your cockflesh. Her furry hand shifts downward, gripping the base of your shaft, her wrist starting to flick up and down in a tight jerking rhythm. Her fur is soft against your sensitive meat, but her tight grip causes you to shudder in pleasure.");
	output("\n\nThe ausar holds you in her mouth, her long tongue seeming to wrap around your girth, constricting you meat and making you throb and twitch uncontrollably. Her lips start to slide up and down along your length, her long tongue firmly wrapped around you. Her eyes stay locked on yours, watching you gasp and moan at her mouth’s embrace. Her hand pumps away at the base of your [pc.cockColor " + kok + "] shaft, her furry fingers tickling you.");
	output("\n\nYour head falls back and you break eye contact. You feel yourself throb in the ausar’s mouth as her soft lips slide along your hard shaft. You close your eyes, starting to drown in pleasure as your cock burns in the young woman’s mouth. You start to buck your hips, instinctively trying to assist the woman and draw yourself closer to you own orgasm.");
	
	if (pc.balls > 0) output(" Your [pc.balls] start to feel tense, and you start to bury your hot pole further into Elva’s mouth.");
	
	output(" You feel her tongue and fingers grip more firmly, but her mouth seems to twist on your pole, as she repositions her head. You hear a loud and out of place beep, causing you to open your eyes and look down.");
	
	output("\n\nIn her free hand you see Elva is holding her small device, and seems to be recording herself. She is turned to face the camera, holding it out at arms length while she slides her lips up and down your shaft. Before you can question her or protest you feel a surge of warmth build up in your groin");
	
	if (pc.balls > 0) output(", as your [pc.balls] start to churn");
	
	output(". You head falls back again as the wave of pleasure runs through you and you feel your cock throb as a [pc.cumColor] hot load erupts from your [pc.cockHead " + kok + "]. You arch your back and moan, as you blow your sticky seed into the young woman’s mouth, forgetting completely about the camera. The ausar sucks away at you a few moments longer, milking you for the camera.");
	
	output("\n\nYou open your eyes and look down at the young woman, watching her pull her lips and tongue off your spent meat. She sticks her tongue out for the camera, showing off you load before swallowing it and licking her lips. She gives the camera a kiss, then turns off the recording. <i>“Well that wasn’t too bad.”</i> She wipes her lips and pulls herself to her feet. <i>“Definitely not the worse blowjob I’ve ever given.”</i>");
	output("\n\nYou frown, and ask the young ausar why she started to record you two.");
	output("\n\n<i>“Sex tape. Everybody who’s anybody needs one. Don’t worry, this isn’t going online for a few years. I need to make a proper name for myself first.”</i> She clears her throat and sticks her device away. <i>“Well, pleasure doing business with you. Make sure you like, follow, and subscribe. Okay?”</i> She shoots you a very well practiced smile then turns on her heel, leaving you alone in the stall.");
	output("\n\nAfter a moment, you collect yourself and rise to your feet. Exiting the washroom into the main bar, your ‘date’ nowhere to be seen. Well that was something...");
	
	processTime(15 + rand(15));
	pc.orgasm();
	
	IncrementFlag("EXTRAMEET_SEX");
	IncrementFlag("EXTRAMEET_ORAL_RCVD");
	addButton(0,"Next",mainGameMenu);
}

//ReDD
//[EXTRAMEET_REDD]
public function extrameetReddProfile():void
{
	output("The profile picture on your screen is of a bright red Rahn, giving the camera a suggestive smirk. She seems to be wearing some sort of black leather outfit, but her body is mostly out of frame in favor of her face.");
	output("\n\nUsername: ReDD");
	output("\nSex: Female");
	output("\nAge: 23 Years");
	output("\nRace: Rahn");
	output("\nPlanet: Tavros");
	output("\n\nBio:");
	output("\nLooking for fun in all the wrong places. Hoping to find somebody who doesn’t mind a bossy lady with a little extra. Anybody willing to play?");
}
public function extrameetReddCheckMatch():Boolean
{
	//no requirements so just return true		
	return true;
}
public function extrameetReddDate():void
{
	showName("\nREDD");
	author("Fr0sty");
	moveTo("ANON'S BAR AND BOARD");
	output("You arrive at Anon’s Bar and Board and take a look around, not seeing your date anywhere. You move to an empty table and take a seat, positioning yourself in a spot where you can watch the door. A few short minutes later you spot your date walk in, and you feel your jaw loose and almost fall open.");
	output("\n\nThe bright red Rahn is wearing what you can only describe as bondage gear, made up of tight fitting leather and thick straps. Her chest is exposed and bare, her massive red orbs out for the world to see, and you also notice her crotch is uncovered but don’t see any obvious genitals. She scans the room and spots you, making her way across the bar to your table. Heads turn as she moves towards you, the bar going noticeably quiet as she walks. Her heels click with each step, getting louder and louder as the red woman draws closer. She stops next to you, giving you a wide smile.");
	output("\n\n<i>“You showed up.”</i> Her voice is slightly higher pitched than you would have guessed, almost squeaky. <i>“Does that mean you’re interested in a little fun?”</i> She moves to an empty chair beside you and takes a seat, her eyes never leaving you.");
	output("\n\nYou stare at the red gooey woman, tightening up your jaw. You opt to just introduce yourself for now, trying to buy time to better collect your thoughts.");
	output("\n\nThe Rahn crosses her legs under the table, her boot brushing up against you slightly. <i>“[pc.name], huh? I like the way it feels on my tongue.”</i> She says your name out loud a few times, then cracks into a giggle.");
	output("\n\nYou eyeball the woman curiously. Her style of dress suggests one thing, but the curious way she talks and her voice suggests another. You notice she never introduced herself, so you take a moment to ask.");
	output("\n\nThe red Rahn gives you a wink and sticks out her tongue. <i>“Oh, I didn’t give my name on purpose.”</i> Under the table she uncrosses and then recrosses her legs. <i>“I’d much rather you call me something else anyways.”</i>");
	output("\n\nYou raise a brow at the leather clad woman. <i>“And what would that be?”</i>");
	output("\n\nShe giggles and leans in close, her red lips almost brushing against your ear. <i>“Mistress.”</i>");
	output("\n\nYou feel your face grow warm and you turn to face the red Rahn. She smiles back at you, her puffy red lips inches from your face. Under the table, she uncrosses her legs again, but does not recross them. Her eyes fall downward and without even thinking your gaze follows behind, leading to a small shock. The red woman’s exposed crotch is no longer bare, and a very thick red ovipositor stands at attention between her legs. The Rahn’s lips curve into a smile. <i>“Oops. Guess I got a little excited.”</i> Her high pitched voice is now thick with sultry lust. <i>“Care to come back to my place and...”</i> She giggles in your ear. <i>“Be a nice little pet and help out?”</i>");
	output("\n\nYou take a deep breath, considering the offer.");
	
	if(!CodexManager.entryUnlocked("Rahn")) 
	{
		output("\n\nYour codex beeps to inform you it’s identified the Rahn race.");
		CodexManager.unlockEntry("Rahn");
	}
	
	processTime(5);
	addButton(0,"Accept",extrameetReddSex,undefined,"Accept","Go back to her place.");
	addButton(14,"Bail",extrameetBailScene);
}
public function extrameetReddSex():void
{
	clearOutput();
	clearMenu();
	showName("\nREDD");
	author("Fr0sty");
	
	moveTo("LIFT: RESIDENTIAL DECK");
	output("You accept her offer, giving the red woman a small nod.");
	output("\n\n<i>“Speak up.”</i> Her tone is harder, more serious. <i>“Answer when you’re spoken to.”</i>");
	output("\n\n<i>“I accept...”</i> Your voice is shaky, nerves getting the better of you.");
	output("\n\n<i>“Excellent.”</i> The red Rahn stands, her ovi-cock large and on display. <i>“Follow me then. We’re going to have so much fun.”</i>");
	output("\n\nThe two of you make your way out of the bar, turning almost every head in the place. The Rahn’s outfit and fully erect ovipositor attract most of the attention, but a few envious glances are shot your way. Once you leave the bar she leads you to a nearby elevator, stepping inside and beckoning you in.");
	output("\n\n<i>“Nervous?”</i> She says it in a voice so sweet your teeth could rot.");
	output("\n\n<i>“No.”</i> You lie. Badly, it seems.");
	output("\n\nThe Rahn grabs your by the scruff of the neck and yanks your head back. <i>“Don’t lie to me.”</i> Her voice is still sweet, but now has a dangerous edge to it. <i>“I can smell it on you. Your anxiety. It’s intoxicating.”</i> The elevator pings and the door opens, the Rahn releasing you and stepping out. <i>“Keep up.”</i>");
	output("\n\nHer apartment is not far away, and she guides you in without delay. Her apartment seems normal enough at first glance. A couch, a TV, a sex swing, and a bookshelf. You double take back to the sex swing, seeing it hang from the ceiling right in the middle of the room. You feel yourself blush, having a feeling you might end up strapped in to it very shortly.");
	output("\n\nThe red woman gives you a small shock, coming up behind you and clasping a hand hard on your backside. <i>“Hm. Looks like you already know where you are going.”</i> She gives your [pc.ass] a tight squeeze. <i>“And I know exactly where I’m going as well. Don’t move.”</i>");
	output("\n\nYou stay perfectly still as she strips you down, removing your gear and weapons and setting them off to the side. Her fingers trail along your exposed [pc.skinFurScales], slowly exploring you. Her touch makes you quiver, the first movement you’ve made since she told you to stay still. You feel a sharp pain on your ass, as the red woman delivers a hard spank to your backside. <i>“I told you to stay still.”</i> Her voice is still light and bubbly, playful and seductive at the same time. <i>“Naughty naughty.”</i>");
	output("\n\n<i>“Sorry.”</i> The word escapes your throat hoarsely. Your body feels warm despite being exposed and naked. Two leather clad hands loop over your shoulders and you feel the impressive mounds of the red seductress press tight against your back.");
	output("\n\n<i>“Oh, don’t be sorry.”</i> The woman starts to push you forward towards the swing. <i>“You can’t help it. You’ve gone so long without a proper mistress you simply don’t know how to behave.”</i> The two of you come to a stop at the sex swing, and the red woman releases you. <i>“Climb in. Submit. And let me teach you a very, very important lesson.”</i>");
	output("\n\nYou don’t hesitate. Eagerly, you climb up onto the swing, ready to be strapped in. The red woman smiles, leaning in over you and fastening you in tight. <i>“You just jumped in. I’ve never had a first time pet be so eager. You’re quite the little slut aren’t you?”</i> She underlines her question by pulling the last strap closed a bit tighter than the rest. Before you can reply, the red woman moves her hand downward, pressing a leather clad finger against your pucker.");
	output("\n\nThe surprise poke makes your wince, and your twist around in the swing. <i>“Hush. It’s okay.”</i> Her voice is as smooth as silk. <i>“I’m just making sure you’re ready.”</i> Between your cheeks you feel her finger press harder, pushing its way into your eager ass. <i>“Oh my. You’re sucking me in.”</i> With a small audible pop she pulls her finger out, causing you to gasp in depraved pleasure. The red woman moves in closer and you feel something much larger press against you now. <i>“Beg for me, pet.”</i>");
	output("\n\n<i>“Please.”</i> You wiggle your [pc.hips] the best you can, trying to push yourself onto the thick ovi-cock pressing against you. <i>“Please fuck me.”</i>");
	output("\n\nThe red woman giggles. <i>“Please fuck me what?”</i> She grinds herself against you, teasing your pucker.");
	output("\n\n<i>“Please fuck me...”</i> You gasp, her movement against you making your body tingle. <i>“Mistress.”</i>");
	output("\n\nYou hear the Rahn giggle again, but the sound is quickly drowned out by your own cries as you feel her ovi-cock press into you. You writhe in a mix of pain and pleasure, unable to properly move due to the sex swing’s straps. Her cock, while certainly hard, feels squishy in your ass, sliding in like a hot knife through butter. You feel it creep in deeper and deeper, burying itself into you slowly as the Rahn pushes her hips forward. <i>“Mmm, that feels just right. Your hole is truly divine.”</i>");
	
	pc.buttChange(chars["REDD"].cockVolume(0), true, true, false);
	
	output("\n\n<i>“Th-Thank you Mistress.”</i> You sputter out the words between labored breaths. Her cock seems to throb inside of you, making your ass burn with pleasure. You feel her wiggle her hips, sending her ovi-cock into a small spin. You struggle involuntarily against your bonds, gasping out as she works away at your burning ass. Seemingly pleased with your looseness, the red woman starts to move her hips, starting to pump herself in and out of you with enthusiasm.");
	output("\n\n<i>“Oh yes, this is just right.”</i> She doesn’t waste any time and starts to speed up. <i>“I don’t think I’ll ever let you go.”</i> She reaches down, her hand going straight for your crotch.");
	
	if (pc.hasCock())
	{
		output(" She grabs ahold of your erect and eager cock, gripping it tightly. <i>“Don’t think I’m not generous. I’ll help you get off too.”</i>");
	}
	else if (pc.hasVagina())
	{
		output(" She slaps her hand down on your hot, wet cunt, pressing tightly against your clit. <i>“Don’t think I’m not generous. I’ll help you get off too.”</i>");
	}
	else
	{
		output(" She gives your bare crotch a pat. <i>“We’ll have to install something here, that way I can properly treat you.”</i>");
	}
	
	output("\n\nYou moan in pleasure, her hips slamming into your ass with each of her deep thrusts.");
	
	if (pc.hasCock() || pc.hasVagina()) output(" Her hand on your sex starts to flick away, teasing you closer and closer to orgasm.");
	
	output("\n\nDeep in your ass, her cock grows warmer and seems to grow larger, making you howl out in pleasure as it continues to pound in and out of you.");
	
	if (pc.hasCock() || pc.hasVagina()) output(" Your crotch burns as her leathered hand rubs at you, an orgasm spurred on by both her cock and her hand drawing close.");
	
	output(" A shiver runs down your spine and you feel your back arch, all the air in your lungs being forced out in a loud orgasmic groan. Your body tenses up and convulses, sending the chair into a swinging frenzy as you feel your ass burn while your sex pulses in sticky pleasure.");
	
	processTime(30 + rand(15));
	pc.orgasm();
	
	output("\n\nThe Rahn isn’t far behind you, and in your ass you feel her ovi-cock swell and pop as the red woman lets out a loud shivering moan of her own. Warm goo fills you as her spent cock pumps deep inside of you. With a deep sigh she pulls back her hips, sliding her now mostly soft ovipositor out of you. <i>“Hmm. Naughty naughty. You finished first. That’s a big no no. I’ll have to punish you...”</i> She takes a deep breath and wobbles slightly on her heels. <i>“Next time...”</i> She unstraps you and lets you down out of the swing. You stagger once your feet touch the floor, your knees feeling weak under your weight. Your Rahn lover yawns and stretches, her ovi-cock seemingly disappearing completely like before.");
	
	pc.loadInAss(chars["REDD"]);
	
	output("\n\n<i>“That was a lot of fun. If you’re looking for a full time Mistress, I’d be willing to take you on as a pet.”</i> She rubs her shoulder and starts to roll her neck around. <i>“I’m going to shower. Be a good pet and show yourself out, okay?”</i> She gives you a smirk and saunters off, leaving you alone in the living room with the scent of sex. You gather up your things and head to the door, your legs still wobbling and your ass feeling more than a little sore.");
	output("\n\nAs you show yourself out to take a moment to reflect. You’re definitely going to have to consider her offer.");
	
	IncrementFlag("EXTRAMEET_SEX");
	IncrementFlag("EXTRAMEET_ASS_RCVD");
	addButton(0,"Next",mainGameMenu);
}

//Hawtstuff
//[EXTRAMEET_HAWTSTUFF]
public function extrameetHawtstuffProfile():void
{
	output("The profile picture on your screen is a full body shot of a voluptuous Leithan woman. She seems to be posing for the camera, showing off her long tauric body and her well endowed chest.");
	output("\n\nUsername: Hawtstuff");
	output("\nSex: Female");
	output("\nAge: 28 Years");
	output("\nRace: Leithan");
	output("\nPlanet: Tavros");
	output("\n\nBio:");
	output("\nFull bodied woman looking for a stud who can handle me. If you can hold a conversation that’s a plus, but not a requirement. If things go well I might think about getting serious. No bipeds or fuckboys.");
}
public function extrameetHawtstuffCheckMatch():Boolean
{
	//taur with penis
	if (pc.isTaur() && pc.hasCock()) return true;
	else return false;
}
public function extrameetHawtstuffDate():void
{
	showName("\nHAWTSTUFF");
	author("Fr0sty");
	moveTo("ANON'S BAR AND BOARD");
	output("You arrive at Anon’s Bar and Board and take a look around the room. At first glance you don’t see your date, but on a second scan you notice the Leithan woman sitting down on the ground next to a table. Heading towards her you try to size her up, but have a hard time with your current angle. When you reach the table, she stands up and you notice for the first time that she is shorter than most Leithan women, which explains why she was hard to spot.");
	output("\n\n<i>“Hey.”</i> She extends her hand out. <i>“I’m Rella, pleased to meet you.”</i> Her eyes seem to wander around, taking note of your body.");
	output("\n\nYou take her hand and give it quick shake, introducing yourself as you do. When you release her hand you squat down at the table.");
	output("\n\n<i>“I hate places like this.”</i> The Leithan woman says with a sigh, squatting down next to you. <i>“You’d think everybody in the whole damn galaxy walked on two legs the way it’s built.”</i>");
	output("\n\nYou offer a shrug. <i>“Well most species are bipeds after all.”</i>");
	output("\n\nRella sighs again. <i>“I know. It’s just damn awkward.”</i> She clears her throat and smiles at you. <i>“So. I haven’t seen you around here before, you new on station?”</i>");
	output("\n\nYou can’t help but chuckle at that. <i>“Not really...”</i> You go into a brief explanation of your recent history, telling Rella about your exploits. Her expressions during your story tell you she is very invested, listening intently as you on go. Eventually you start going into more depth, just because she is such a good listener. When you finally run out of things to say you shrug. <i>“So, that’s about it I guess...”</i>");
	output("\n\n<i>“Wow...”</i> She stares at you a moment. <i>“You’ve lived such an interesting life. And you’re so young...”</i> Rella rubs the back of her neck, her eyes falling to the floor. <i>“It’s sort of intimidating....”</i>");
	output("\n\nYou notice her shift around, and you can’t help but think you’ve made her uncomfortable. Trying to fix the situation, you ask her about herself.");
	output("\n\n<i>“Oh, I’m just nobody really.”</i> Her gaze comes up to meet yours. <i>“I mean... Wow, that came out really depressing. I meant to say I’m just sort of normal you know.”</i> She scratches her cheek. <i>“I mean, I only swiped right on you because you’re like me physically. I’m umm, sort of old fashioned like that. But now that we’ve talked a bit... I mean wow, you’re way out of my league.”</i>");
	output("\n\nHer eyes fall off you again. Man the mood went south quick. You’re pretty sure you can salvage the night, but things might get a bit hot and heavy as a result. What to do...");
	
	if(!CodexManager.entryUnlocked("Leithans")) 
	{
		output("\n\nYour codex beeps to inform you it’s identified the Leithan race.");
		CodexManager.unlockEntry("Leithans");
	}
	
	processTime(15);
	addButton(0,"Salvage",extrameetHawtstuffSex,undefined,"Salvage","Salvage the night...");
	addButton(14,"Bail",extrameetBailScene);
}

public function extrameetHawtstuffSex():void
{
	clearOutput();
	clearMenu();
	showName("\nHAWTSTUFF");
	author("Fr0sty");
	//find the cock to use 
	var kok:int = pc.biggestCockIndex();
	
	moveTo("LIFT: RESIDENTIAL DECK");
	output("You try to fix things with a bit of the old Steele charm. <i>“What are you talking about, you’re amazing. I mean look at you!”</i> You lean in close, keeping eye contact and giving her a wry smirk.");
	output("\n\nShe blushes, but doesn’t seem fully convinced. <i>“You’re just being nice.”</i>");
	output("\n\nNot letting up, you press the charm. <i>“No. Seriously. You’re gorgeous. Any guy would be lucky even to get five minutes of your attention.”</i>");
	output("\n\nRella stares at you a moment, chewing her lip. <i>“Hey... Do you... Want to get out of here.”</i> She shifts around, uncomfortable and clearly nervous. <i>“I mean... It’s just noisey here.”</i>");
	output("\n\nJackpot. You tell her you’d like that and the two of you start to make your way out of the bar. As you are walking, you notice your date still seems apprehensive, but overall less down on herself. You head towards the elevator and both step in, riding it up to the residential deck. As you ride up, she turns to you, speaking quickly and in a rush. <i>“You know you’re really cool for a bazillionaire.”</i> She clears her throat, trying to calm herself. <i>“Sorry, I’m nervous.”</i>");
	output("\n\nYou ask her about what just as the elevator stops and the doors open. She gives you a shaky smile and steps out of the elevator. <i>“Nothing... I’m just being silly.”</i> She starts heading down one of the halls and you hurry after her, not wanting to get left behind. Her door isn’t very far away, and when she reaches it she fumbles for a moment while attempting to open it up. Her face turns beet red and she stops, takes a deep breath and tries again, opening the door and walking in. Trying not to chuckle at her expense you follow her inside and close the door behind you.");
	output("\n\nBefore you can even process your surroundings Rella moves in on you, pulling you in close and giving you a deep and passionate kiss. It only lasts a second before she pulls herself off of you, blushing uncontrollably. <i>“I’m sorry! I don’t know why I did that. Fuck, did I make things weird?”</i> She buries her face in her hands. <i>“Oh fuck. I made shit weird. I was just looking for a hookup, but you were just so awesome and shit. Fuck!”</i>");
	output("\n\nYou stare at her a moment, still a bit dumbfounded by her forward kiss. Collecting yourself, you reach out and gently take her wrists, lowering her hands. Instead of speaking, you lean in and give the forward woman a kiss of your own, much to her shock and delight. It only takes her a moment to return your lip lock, and her hands wrap around your shoulders pulling you in tight. The two of you turn into a tangle of arms and legs, moving from the entryway in a staggering heap towards the bedroom. You keep your passionate make out going the whole time, the two of you blindly pulling at each other’s clothing and gear, dropping it down like a trail of breadcrumbs as you head to the bedroom.");
	output("\n\nRella breaks off of you, pushing you away slowly and making a little distance. Backing away from you, she bites her lip and chuckles to herself. <i>“Ready for a ride?”</i> When she reaches her bed she turns around, half hopping up and resting her front half while her backend remains bared before you. <i>“If you’re stud enough that is.”</i>");
	output("\n\nYour [pc.cockShape " + kok + "] member starts to stiffen, more than up to the task. You move in close to the Leithan woman, her twat now in full view. Acting on something akin to animal instinct, you lift yourself up and mount her, your [pc.cockShape " + kok + "] cock in position and ready. You wiggle your hips, your [pc.cockHead " + kok + "] grinding against Rella’s wet and ready cunt. She gasps softly underneath you, practically begging for you to stick it in. You decide not to keep her waiting. With a small grunt of effort, you move your hips forward, plunging yourself deep inside of her.");
	
	pc.cockChange();
	
	output("\n\nThe warmth of her cunt takes you by surprise, her sex burning so hot you feel your cock flesh tingle. You wouldn’t describe her as tight, and on the contrary her spacious pussy seems to accommodate your manhood perfectly. A shiver runs up your spine as you push all the way in, and below you Rella seems to quiver in pleasure. Not missing a beat, you start to move your hips the best you can, pounding away at your lover’s twat. She moans loudly, nearly screaming as you thrust in and out of her. You feel her tighten up around your cock, the woman’s cunt squeezing you mercilessly.");
	output("\n\nDespite the increased resistance, you still manage pound her well enough, although you feel your breathing start to grow labored. You know you won’t be able to keep it up forever, but if the sounds coming from your lover are any indication neither can she. She turns her head over her shoulder, breathing far more raggedly than you. <i>“Harder! Fuck me harder.”</i> Well you can certainly do that. Digging a bit deeper, you put more power into each of your thrusts, the whole bed seeming to shift slightly with each of them. Rella starts getting vocal again, screaming so loud you suspect the neighbors can hear. The thought of that excites you, and makes each thrust a bit harder. Your breathing starts to really become heavy, and at this rate you know you’ll be out of gas out soon. But you also know you’re close.");
	output("\n\nYou decide to go for broke and give it your all, thinking it’s better to finish in a bang than slowly fizzle out. Since you’re not holding back, you smash the hell out of Rella’s backside, each of your thrusts causing the whole bed to move. You also increase your speed, but still focus on giving your lover the hard fucking she wants. Your cock burns in her cunt, the woman feeling impossibly hot. Your [pc.skinFurScales] goes slick with sweat, and each breath you take feels like less and less enough to continue.");

	if (pc.balls > 0) output(" Thankfully, you feel your [pc.balls] start to churn, and know you’re already done. The question is: is Rella?");
	else output(" You know you’re already done. The question is: is Rella?");
	
	output("\n\nBefore you can consider that, you feel yourself pop, [pc.cumVisc] [pc.cumColor] seed erupting from your [pc.cockHead " + kok + "] and filling up your date’s hot twat. You seize up, going still as your muscles all tense while your cock throbs and continues to shoot stream after stream of spunk, sending chills of pleasure through your body. Rella gasps for air, unable to scream any longer, but her trembling beneath you tells you all you need to know about her own pleasure. After a few long heartbeats you feel yourself loosen up and pull yourself off of your date.");

	processTime(30 + rand(15));
	pc.orgasm();

	output("\n\n<i>“Oh fuck.”</i> Rella calls out as you extract yourself from her, [pc.cumColor] jizz oozing out of her cunt. <i>“That was amazing. I was right about you....”</i>");
	output("\n\nYou end up gathering up your gear and getting dressed while Rella heads off to the bathroom to clean up. By the time she is done you are ready at the door ready to leave. <i>“That was great, [pc.name]. We should do this again... if you want to that is.”</i>");
	output("\n\nYou tell her you’d very much like to and give her a quick goodbye kiss for good measure before heading out. You make your way down the hall with a spring in your step, feeling very good about how the night came together.");
	
	IncrementFlag("EXTRAMEET_SEX");
	IncrementFlag("EXTRAMEET_CUNT_GIVE");
	addButton(0,"Next",mainGameMenu);
}

//tavros flavor (will never match)

//Throbbin34
//[EXTRAMEET_THROBBIN34]
public function extrameetThrobbin34Profile():void
{
	output("The profile picture on your screen is of a rather chubby looking ausar. You get the impression he doesn’t bathe much, as he has an overall greasy appearance.");
	output("\n\nUsername: Throbbin34");
	output("\nSex: Male");
	output("\nAge: 26 Years");
	output("\nRace: Ausar");
	output("\nPlanet: Tavros");
	output("\n\nBio:");
	output("\nHello M’lady. Glad you stopped by. Care to swipe right and get to know one another?");
}

//mynameisjon
//[EXTRAMEET_MYNAMEISJON]
public function extrameetMynameisjonProfile():void
{
	output("The profile picture on your screen is of an older looking human man. By the looks of his picture, he’s about ready to drop dead any minute.");
	output("\n\nUsername: mynameisjon");
	output("\nSex: Male");
	output("\nAge: 97 Years");
	output("\nRace: Human");
	output("\nPlanet: Tavros");
	output("\n\nBio:");
	output("\nSingle. Ready to mingle. Looking for a nice young lady I can take out on the town. Must be a virgin.");
}

//(.)(.)
//[EXTRAMEET_CATBOOBS]
public function extrameetCatBoobsProfile():void
{
	output("The profile picture on your screen is a high angle shot of a massive pair of tits with a face poking out over top. All you can tell is her tits are huge and she’s a Kaithrit. Nothing else.");
	output("\n\nUsername: ( . )( . )");
	output("\nSex: Female");
	output("\nAge: 31 Years");
	output("\nRace: Kaithrit");
	output("\nPlanet: Tavros");
	output("\n\nBio:");
	output("\nOh hello down there :3");
}

//DarkAngel01
//[EXTRAMEET_DARKANGEL01]
public function extrameetDarkAngel01Profile():void
{
	output("The profile picture on your screen is of an older looking woman with what appears to be spliced black bird wings. She seems very serious and downright unapproachable.");
	output("\n\nUsername: DarkAngel01");
	output("\nSex: Female");
	output("\nAge: 48 Years");
	output("\nRace: Human+");
	output("\nPlanet: Tavros");
	output("\n\nBio:");
	output("\nMature woman looking for mature man. Creative individuals only, and I have a strong preference for those who like religious symbology.");
}

//BrazenBitch
//[EXTRAMEET_BRAZENBITCH]
public function extrameetBrazenBitchProfile():void
{
	output("The profile picture on your screen is of a very punky looking Ausar. Her hair is dyed a few different colors, and she’s got more metal in her face than anybody you’ve ever seen.");
	output("\n\nUsername: BrazenBitch");
	output("\nSex: Female");
	output("\nAge: 35 Years");
	output("\nRace: Ausar");
	output("\nPlanet: Tavros");
	output("\n\nBio:");
	output("\nOn station for a week. Looking to score, in more than one way. Straight edge fuckers can go to hell.");
}
	
//CasualD
//[EXTRAMEET_CASUALD]
public function extrameetCasualDProfile():void
{
	output("The profile picture on your screen is of a soft penis. Not sure why it’s soft...");
	output("\n\nUsername: CasualD");
	output("\nSex: Male");
	output("\nAge: 37 Years");
	output("\nRace: Human");
	output("\nPlanet: Tavros");
	output("\n\nBio:");
	output("\nIf you take me at my worst, you’ll love me at my best.");
}

//LethalLady
//[EXTRAMEET_LETHALLADY]
public function extrameetLethalLadyProfile():void
{
	output("The profile picture on your screen is a headshot of a very beautiful Gryvain. While she doesnt look old by any means, you can tell she is far from young just by the way she carries herself.");
	output("\n\nUsername: LethalLady");
	output("\nSex: Other");
	output("\nAge: 150 Years");
	output("\nRace: Gryvain");
	output("\nPlanet: Tavros");
	output("\n\nBio:");
	output("\nYour ass. My cock. I don’t date.");
}

//rockhardforyou
//[EXTRAMEET_ROCKHARDFORYOU]
public function extrameetRockhardforyouProfile():void
{
	output("The profile picture on your screen is of a nubby Kaithrit cock. It seems to be a decent sized member, but the picture doesn’t offer much of a sense of scale.");
	output("\n\nUsername: rockhardforyou");
	output("\nSex: Male");
	output("\nAge: 21 Years");
	output("\nRace: Kaithrit");
	output("\nPlanet: Tavros");
	output("\n\nBio:");
	output("\nSwipe right and this can be all yours. ;)");
}

//MoonlessNights
//[EXTRAMEET_MOONLESSNIGHTS]
public function extrameetMoonlessNightsProfile():void
{
	output("The profile picture on your screen is of a modestly dressed Ovir. At first glance you’d have though her a female, but knowing better you peg her as being male.");
	output("\n\nUsername: MoonlessNights");
	output("\nSex: Male");
	output("\nAge: 30 Years");
	output("\nRace: Ovir");
	output("\nPlanet: Tavros");
	output("\n\nBio:");
	output("\nNew on station and looking to meet some friends. High preference towards Ovir, but I’ll make an exception if you seem cool. Not here for hookups.");
}

//Alpha_Wolf
//[EXTRAMEET_ALPHAWOLF]
public function extrameetAlphaWolfProfile():void
{
	output("The profile picture on your screen is of what appears to a fairly attractive male Ausar. Closer inspection of his features lead you to believe he isn’t a natural born ausar, and is really originally human.");
	output("\n\nUsername: Alpha_Wolf");
	output("\nSex: Male");
	output("\nAge: 28 Years");
	output("\nRace: Human+");
	output("\nPlanet: Tavros");
	output("\n\nBio:");
	output("\nLone wolf looking for a bitch to breed. Only interested in Ausars, and only interested in ones willing to submit.");
}

//new texas

//Frank&Molly
//[EXTRAMEET_FRANKMOLLY]
public function extrameetFrankMollyProfile():void
{
	output("The profile picture on your screen is of a pair of New Texans, a man and a woman. Both of them seem to be of standard New Texan stock, with horns, muscles, and curves.");
	output("\n\nUsername: Frank&Molly");
	output("\nSex: Other");
	output("\nAge: 38 Years");
	output("\nRace: Human+");
	output("\nPlanet: New Texas");
	output("\n\nBio:");
	output("\nCouple looking for an interesting third to spice things up.");
}
public function extrameetFrankMollyCheckMatch():Boolean
{
	//no requirements so just return true		
	return true;
}
public function extrameetFrankMollyDate():void
{
	showName("FRANK\n& MOLLY");
	author("Fr0sty");
	moveTo("BUCKING BRONCO");
	output("You enter The Bucking Bronco and scan the room, not seeing the couple you are suppose to be meeting. You find an empty table and take a seat, finding an open one that gives you a decent view of the room.");
	output("\n\nA few minutes pass and you start to wonder where they are. You check the time, noting that they are not that late. You shrug it off, assuming they will be along in short order. You keep a close eye on the door, checking everybody as they come in.");
	output("\n\nTwenty more minutes pass. Now you’re starting to feel like you’ve been stood up. You sigh and pull yourself to your feet, making you way to the exit. A few paces before you reach it, a couple you recognize walks in. You stand a few steps away from them while they exchange glances and close the distance.");
	output("\n\n<i>“Hey!”</i> The woman, who you assume is Molly, speaks to you. <i>“Did y’all wait around for us?”</i>");
	output("\n\nYou tell the couple you’ve been waiting almost half an hour, and ask them where they were.");
	output("\n\nFrank answers. <i>“Aw, well shucks. Our previous rendezvous went late. Set the whole schedule off a bit I reckon.”</i> He gives you a smile, then turns to Molly. <i>“So, reckon we can still make all our stops?”</i>");
	output("\n\nMolly thinks about it a moment. <i>“I think we might need to skip this one. Our next appointment will be here soon, and they seemed far more interesting than this one. Oh.... No offense hun, I just know what I like is all.”</i>");
	output("\n\nYou stare at them a moment, unsure what they are talking about. <i>“How many threesomes do you two have lined up today?”</i>");
	output("\n\nFrank answers. <i>“13. Heck, we’ve got 14 tomorrow.”</i> He scratches the back of his neck. <i>“Finding people willing to join in with us is almost too easy.”</i>");
	output("\n\nMolly gives you a smile and a shrug. <i>“Try again later maybe? I think we’re free.... Hm, Wednesday? Only have five that day so far- OH! Look! He’s already here!”</i> Molly points to a very tall patron in the back of the bar, with wings that seem to have cocks sprouting out of them. Molly runs over, giggling and waving.");
	output("\n\nFrank offers you a shrug. <i>“Another time maybe.”</i> He then heads after Molly.");
	output("\n\nYou sigh and turn to exit the bar. Yeah, another time.");
	
	if(!CodexManager.entryUnlocked("The Treatment")) 
	{
		output("\n\nYour codex beeps to inform you it’s identified the Treatment.");
		CodexManager.unlockEntry("The Treatment");
	}
	
	IncrementFlag("EXTRAMEET_DOH");
	processTime(30);
	addButton(0,"Next",mainGameMenu);
}

//Pony_Luver
//[EXTRAMEET_PONYLUVER]
public function extrameetPonyLuverProfile():void
{
	output("The profile picture on your screen is a full body picture of a rather tall looking New Texan. Aside from his horns and height, the only notable thing about him is a rather impressive bulge in his pants.");
	output("\n\nUsername: Pony_Luver");
	output("\nSex: Male");
	output("\nAge: 24 Years");
	output("\nRace: Human+");
	output("\nPlanet: New Texas");
	output("\n\nBio:");
	output("\nCowboy wanting to go for a ride. Bipeds need not apply. Any fillies interested should hurry on up and swipe right. 8========D");
}
public function extrameetPonyLuverCheckMatch():Boolean
{
	//taur with vagina
	if (pc.isTaur() && pc.hasVagina()) return true;
	else return false;
}
public function extrameetPonyLuverDate():void
{
	showName("PONY\nLOVER");
	author("Fr0sty");
	moveTo("BUCKING BRONCO");
	output("You enter The Bucking Bronco and start to look around the bar for your date. As you move around the crowded Saloon your gaze returns to the doorway just as the tall man enters. He is indeed tall, standing over 7’ feet tall before his horns, which you guess bring him closer to 8’ when added in. He is wearing a simple red button up shirt and a very tight pair of jeans, showing off a bulge almost the size of his head. He scans the room and spots you almost instantly, smiling very widely.");
	output("\n\nThe two of you make your way over to one another, and the large New Texan gives you a low bow. <i>“I do say you are quite the radiant beauty. Your picture did not do you service. Pony, at your service ma lady.”</i> He speaks with an odd drawl you can’t quite place, then stands up straight, smiling ear to ear still.");
	output("\n\nYou feel your brow raise slightly. <i>“Your name is Pony?”</i>");
	output("\n\nThe New Texan laughs. <i>“Oh, my dear no. My given name is Ponciano, but everybody calls me Pony.”</i> He gives you a look, both up and down and along the length of your tauric body. <i>“My dear, shall we take a seat? If you would do me the pleasure of giftin’ me your companionship.”</i>");
	output("\n\nYou nod and follow him over to a table. He takes a seat in a chair while you squat down next to the table. <i>“Oh, my. Is that uncomfortable for you?”</i> Pony’s tone is filled with concern. <i>“I didnt even think that sittin’ would be an issue for a lady of your divine...form.”</i>");
	output("\n\nYou give a shrug, saying it goes with the territory and you’re used to it.");
	output("\n\nThe tall man frowns. <i>“Well, I shan’t think this right at all. Not one bit.”</i> He pauses and thinks to himself. <i>“It’s nice outside. Would you be at all opposed to taking a walk with me?”</i> The horned man gives you a smirk. <i>“I know a place where we could become right and properly familiar.”</i>");
	
	processTime(5);
	addButton(0,"Take a walk",extrameetPonyLuverSex,undefined,"Take a walk","Take a walk and get familiar with him");
	addButton(14,"Bail",extrameetBailScene);
}

public function extrameetPonyLuverSex():void
{
	clearOutput();
	clearMenu();
	showName("PONY\nLOVER");
	author("Fr0sty");
	//find the vag he fucks
	var vag:int = pc.cuntThatFits(chars["PONYLUVER"].cockVolume(0));
	if (vag < 0) vag = rand(pc.vaginaTotal());
	
	output("You agree to the walk, which you notice causes Pony’s smirk to widen. <i>“Then follow me, ma dear.”</i>");
	output("\n\nYou follow his lead, walking behind him slightly as the two of you step out under the New Texan sky. He turns to regard you. <i>“Well now don’t be walking behind me. How am I supposed to look at yea?”</i> You hurry your pace, now walking side by side, finding yourself having some trouble keeping up with the man’s gait. He seems to notice and slows his pace, as a result falling back beside you more. He looks over, his eyes exploring your form.");
	output("\n\n<i>“Oh, doggie. You’re a heck of a lot of woman, you know that?”</i> You notice his jeans seem to get tighter. After a few minutes of walking in silence, Pony injects an offer. <i>“What do you say we retire to my lodgings? It’s just down this way here.”</i> The two of you turn a corner and you see a wide alleyway with several doors. You head into the alley and Pony moves toward a very large door and opens it, stepping inside and vanishing from view as you following right behind.");
	output("\n\nYou take a quick look around, the apartment having a very rustic feel. You turn to look at Pony, only to notice his jeans are now wide open and a mammoth horse cock is dangling out in front of you. You feel your face grow hot, and stutter over your words. He is only semi erect, but was already well over a foot long and still growing.");
	output("\n\n<i>“Sorry to bring out the python so abruptly. If I waited any longer I’d have ruined my pants.”</i> He reaches down and runs his fingers along his growing meat. <i>“I hope you don’t object.”</i> You watch his massive cock twitch in his hand, stiffening up and pointing directly at you. <i>“Now, I know we’re both busy people, and like have many things to do. So what do ya say you turn around and let ol’ Pony treat you right?”</i>");
	output("\n\nThe New Texan moves towards you, running his free hand along your flank. <i>“Let’s just shed off all our unwanted attire right quick.”</i> Pony properly disrobes, and helps you with your gear as well. Gently he guides you over to an ottoman. <i>“I suggest you rest yourself on this here footrest, lest your legs give out.”</i> You do as he bids, rest the midsection of your tauric body on the sturdy piece of furniture. Pony stalks behind you, and you hear him give a chuckle.");
	output("\n\n<i>“Oh sweet heavens you are divine.”</i> You feel the New Texan reach out and gently caress your [pc.vagina " + vag + "]. <i>“This is gonna be a real treat.”</i> His fingers massage you, the thick digits firmly rubbing at your sensitive sex. You sigh at his touch, the strength of his fingers taking you by surprise. After a moment, you feel him slip a finger in, causing you to gasp. <i>“Now don’t be thinking this little finger here is my prick.”</i> You feel his finger leave you, causing you to twitch.");
	output("\n\nA new pressure meets your back end as a mass of cock flesh presses against your womanhood. You take a deep breath and steady yourself, preparing for Pony’s push. With a small grunt of effort Pony gives his cock a shove, his flared crown penetrating you. You take a sharp breath. It’s thick, but nothing your body can’t handle. Slowly, more cockflesh pushes in, causing you to take quick shallow breaths, trying to count the inches as they slide inside you. A quick slap to your rear makes you lose count and nearly buck the frisky New Texan.");

	pc.cuntChange(vag, chars["PONYLUVER"].cockVolume(0), true, true, false);
	
	output("\n\n<i>“Wooo, boy. Now this is a ride!”</i> Pony thrusts in, more of his endlessly long shaft hammering into you. You nearly howl in pain and pleasure, the New Texan wiggling his hips, fighting against your tight snatch. He grabs ahold of your hindquarters, gripping you with both hands. Not even a second later he starts pounding away, holding on tightly as his now rock hard shaft drills in and out of you with all the power the massive man can muster. You nearly scream in pleasure, the heat of his meaty cock setting your cunt ablaze. You feel your knees buckle beneath you, all your weight now on the very well-made foot rest.");
	output("\n\nYou feel the New Texan give your ass a mighty slap, hooting and hollering as his hips continue to bash against you over and over. <i>“Hell yeah!”</i> You start to pant, your breathing becoming difficult as your cunt becomes alive with pleasure. Your eyes start to flutter and your ass goes numb from the New Texans hard thrusts. He delivers another slap to your rear, causing you to moan in pleasure. Pony is a rough lover, but at this moment you can’t say you don’t love it.");
	output("\n\nYou feel the thick horsecock throb inside you, and Pony starts to favor faster thrusts over harder ones. <i>“Oh lord, Imma cumming!”</i> You hear him call from behind you. Within seconds you feel a rush of heat inside you as a loud moan fills the room. Pony’s load is massive, each pulse of his orgasming cock pumping thick seed into you in such volume you feel it gushing out of you already. The new heat in your cunt makes you shake and moan, the warm load tingling in your womanhood. Pony buries his still cumming cock deep inside you, displacing most of his cum and forcing it out of you. Your moan becomes a scream and your shakes convulsions as an orgasm of your own peaks.");
	
	processTime(30 + rand(15));
	pc.loadInCunt(chars["PONYLUVER"], vag);
	pc.orgasm();
	
	output("\n\nAfter catching his breath Pony pulls himself out, and you turn over your shoulder to see the man’s impressive meat has already shrunk down considerably. <i>“Hmmm, that was just what the doctor ordered. I hope I wasn’t too rough with ya dear. I’m a passionate man.”</i> He helps you clean off and collect your things, trying to be something of a gentleman again. <i>“If ever you’re around do give me a call. I’m always down for another ride.”</i> You tell Pony you’ll keep that in mind and say your goodbyes, leaving his apartment and heading back to the bar.");
	
	IncrementFlag("EXTRAMEET_SEX");
	IncrementFlag("EXTRAMEET_CUNT_RCVD");
	addButton(0,"Next",mainGameMenu);
}

//0MissyMay0
//[EXTRAMEET_MISSYMAY]
public function extrameetMissyMayProfile():void
{
	output("The profile picture on your screen is filled with the lower half of a woman’s face and a very large pair of breasts. The subject of the picture is chewing her bottom lip seductively, while her chest is covered only by a very hardworking red bra.");
	output("\n\nUsername: 0MissyMay0");
	output("\nSex: Female");
	output("\nAge: 29 Years");
	output("\nRace: Human");
	output("\nPlanet: New Texas");
	output("\n\nBio:");
	output("\nTired of dealing with locals and looking for somebody fresh and new to go out for a drink with. You wanna taste?");
}
public function extrameetMissyMayCheckMatch():Boolean
{
	//no requirements so just return true		
	return true;
}
public function extrameetMissyMayDate():void
{
	showName("\nMISSY MAY");
	//showName("0MissyMay0");
	author("Fr0sty");
	moveTo("BUCKING BRONCO");
	output("You enter The Bucking Bronco and don’t immediately see your date. On reflection, you’re not really sure who you’re even looking for, and trying to identified somebody just by their large bust doesn’t seem like a good idea. Especially on New Texas. You decide to take a seat and wait, hoping your date approaches you. You don’t wait long before a busty woman walks up to your table");
	output("\n\n<i>“Hey. [pc.name] Steele? I’m May.”</i> She smiles at you while you size her up. Based on her chest and lips, she must be the woman in the picture. While her figure is a bit less voluptuous than most women on the planet, her bust is still remarkable, sticking out a foot off her chest. Her hair is mud brown, but you notice she isn’t sporting typical New Texan horns. Or any horns for that matter. You introduce yourself and she takes a seat across from you, smiling politely. <i>“So, been on the planet long?”</i>");
	output("\n\nYou tell her you’re just passing through, searching for any typical New Texan markers while you speak. As far as you can tell she’s pure human, with a little added on the chest.");
	output("\n\nShe notices your stare and rolls her eyes. <i>“Don’t tell me you were hoping for a Treated bimbo cow.”</i> When you don’t answer right away she giggles. <i>“Yeah, I figured that would be the case. I’m on planet for a work contract, and let me tell you the locals are exhausting. In more ways than one.”</i>");
	output("\n\nYou can’t help but chuckle and nod in agreement at that. Making small talk you ask May what exactly she does.");
	output("\n\n<i>“I’m a wet nurse.”</i> You chuckle at first, but based on her expression you see she’s serious. She gives a small laugh of her own and continues. <i>“Private sector. Currently just responsible for one kid. Now I know what you’re thinking: ‘Why the heck does somebody need a wet nurse on a planet full of lactating ladies?’, or something like that.”</i> She leans back in her chair and crosses her legs under the table.");
	output("\n\nYou give her a shrug, not really able to think of a reason. You give her chest a closer look, her large mounds looking like they could feed at least a half a dozen kids.");
	output("\n\n<i>“Well, for one I’m on a strict diet and take a laundry list of nutrients every day. Not to mention a very regular exercise schedule and zero drugs or alcohol. Worth it though. My milk is in the top 1% planetwide, and let me tell you: These cow folk are serious about their milk quality. ”</i> She gives you a wide smile. Clearly, she’s very proud of herself. She uncrosses her legs and leans in, her smile turning into a naughty smirk. <i>“I can prove just how good it is too. If you’re interested.”</i>");
	
	processTime(5);
	addButton(0,"Have a taste",extrameetMissyMaySex,undefined,"Have a taste","Try some 1% milk");
	addButton(14,"Bail",extrameetBailScene);
}

public function extrameetMissyMaySex():void
{
	clearOutput();
	clearMenu();
	showName("\nMISSY MAY");
	//showName("0MissyMay0");
	author("Fr0sty");
	
	output("You tell the buxom woman you’re interested, and she gives you a wide sultry smile. Slowly, she reaches for a vacant chair next to her and pulls it closer to her. She gives the seat a pat, inviting you to move closer.");
	output("\n\nYou stare at her a moment. <i>“You mean right here?”</i>");
	output("\n\nMay laughs. <i>“It’s New Texas, hun. Sucking a tit in public is pretty much as normal as it gets around here.”</i> She pats the seat again. <i>“So don’t be shy and get your tushy over here.”</i>");
	output("\n\nYou move over to the seat next to May, sitting very close to the busty woman now. Without wasting any time, May starts to unbutton her shirt, revealing her massive chest barely held in place by a thoroughly overworked black bra. Without even taking it off, she reaches into one of her cups and pulls out a large fleshy orb, capped with a pink puffy nipple already dripping milk. She offers it to you with a smile. <i>“Alright, you’re in for a treat.”</i>");
	output("\n\nYou roll your eyes and lean in, moving your face towards her leaky teat. How good can milk be? You part your lips and clamp down on her, the first drops of her milk touching your tongue. A blast of warmth surges through your tongue and down your throat, and every muscle in your body goes limp. The only thing that stops you from falling right out of your chair is May catching you, the buxom woman wrapping you up in her arms. <i>“Yeah, that’s the normal reaction.”</i> She chuckles softly, patting your head.");
	output("\n\nA few more drops touch your tongue, each an explosion of warm flavor that makes your knees weak. While it is unmistakably milk, it has an unusual taste that you can only define as happiness. Without even realizing it at first you begin to suck, drawing out more of May’s milk. As more of the warm liquid fills your mouth you feel your body tingle, your face growing hot and flushed. All the way down your throat the milk feels warm, coming to rest in your belly where the warmth seems to build. Your eyes flutter, the milk tasting so powerfully strong you start to feel yourself fade out of consciousness.");
	output("\n\nMay pats your head, whispering softly into your ear. <i>“Alright, I think that’s enough.”</i> She moves to pull you off of her, but a sudden wave of strength courses through you, clamping down hard on her nipples. She lets out a cry of surprise, then moans as you start to suck on her with newfound stamina. Her sweet milk burns in your throat, sending your body into a shivering fit.");
	output("\n\nYour arousal builds as the tantalizing juice fills your body. Holding her tightly, without a thought to the bar patrons around you, you reach a hand under her skirt. Realizing what you’re doing, she attempts to dissuade your groping fingers, but they rove under the fabric of her panties and she shudders under your touch, thwarted. Unimpeded, your fingers find her hot, pink pleasure button and start to work at it in circles, stroking roughly.");
	output("\n\nThe combining sensations of your suckling and rubbing seem to drive all thoughts of propriety out of her mind and she grinds her hips to the movement of your hand, heedless of curious eyes. Moaning, May gropes blindly at your crotch, seemingly intent on returning some similar attention. Her efforts are feeble as the pleasure she experiences distracts her. She mostly clings to you as you take long draws off her milk-swollen breast. Thumb rubbing her clit, two of your fingers slide into her now dripping cunt, and begin to thrust into her vigorously.");
	output("\n\nHer moans become high, fast keens of pleasure, and before too long, her body shudders with a powerful orgasm. At this point your excitement, having been building, crashes over you as well, gushing your own fluids. Pulling away from each other, sticky and panting, you bask in the post-climax afterglow. After a long moment, she stuffs her exposed tit back into her bra. <i>“Well, that was unexpected.”</i> The two of you compose yourselves and exchange a few pleasant goodbyes. May stands up and shoots you a wink. <i>“Call me sometime.”</i> And with that she turns and walks out of the bar, leaving you alone.");
	
	processTime(15 + rand(15));
	pc.orgasm();
	pc.exhibitionism(2);
	if (pc.hasCock()) pc.applyCumSoaked();
	if (pc.hasVagina()) pc.applyPussyDrenched();
	
	IncrementFlag("EXTRAMEET_SEX");
	IncrementFlag("EXTRAMEET_BOOBS_GIVE");
	IncrementFlag("EXTRAMEET_FAP_GIVE");
	addButton(0,"Next",mainGameMenu);
}

//V-KO#1221341
//[EXTRAMEET_VKO]
public function extrameetVKOProfile():void
{
	output("The profile picture on your screen is a headshot of a standard issue JoyCo V-KO Nursedroid. What does not seem standard issue is the suggestive smirk she is giving in the photo.");
	output("\n\nUsername: V-KO#1221341");
	output("\nSex: Other");
	output("\nAge: 5 Years");
	output("\nRace: Automaton");
	output("\nPlanet: New Texas");
	output("\n\nBio:");
	output("\n01010111 01100001 01101110 01101110 01100001 00100000 01101000 01100001 01110110 01100101 00100000 01110011 01101111 01101101 01100101 00100000 01100110 01110101 01101110 00111111");
}
public function extrameetVKOCheckMatch():Boolean
{
	//non-taur with cock
	if (!pc.isTaur() && pc.hasCock()) return true;
	else return false;
}
public function extrameetVKODate():void
{
	showName("\nV-KO#1221341");
	author("Fr0sty");
	moveTo("BUCKING BRONCO");
	
	output("You enter The Bucking Bronco and spot your date sticking out like a sore thumb. She’s seated near the back of the bar, sitting very still and with perfect posture. You make your way over, noting she doesn’t even turn to regard you as you make your approach. When you finally reach the nursedroid she just stares off into space. After a moment, you clear your throat and speak to her. <i>“Hello?”</i>");
	output("\n\nIn a quick jerking motion her head turns to you, taking you by surprise and making you jump. <i>“Hello! I am V-KO#1221341. You may call me V-KO. Please take a seat.”</i> She lifts an arm and motions towards a chair across from her");
	output("\n\nSlowly you take your seat, keeping a close eye on the nursedroid. You can tell she is properly looking at you now, and seems to be sizing you up. In an attempt to break up the awkward silence, you introduce yourself.");
	output("\n\n<i>“Oh. I already logged your identity. I have access to the names of all visitors to New Texas.”</i> She tilts her head, her synthetic lips forming a smile. <i>“I thought it best to cross reference your ExtraMeet profile with transit records to get a better understanding of you.”</i>");
	output("\n\n<i>“Um. What?”</i> You try to hide your full reaction, being more than a little weirded out by the nursedroid. Before you bail out completely, you decide to run with this a bit longer to see where it goes. <i>“So... Why do you have access to those records?”</i>");
	output("\n\nV-KO tilts her head the other way. <i>“I am responsible for containing and treating several infectious sexually transmitted diseases that threaten the way of life here.”</i> She straightens out her head. <i>“New Texan promiscuity is so rampant, infections spread at a rate over a thousand percent higher than galactic average.”</i>");
	output("\n\n<i>“Huh.”</i> You think about that a moment. <i>“I imagine that keeps you rather busy.”</i>");
	output("\n\nThe nursedroid doesn’t seem to react at first, leading you to think she’s thinking about the question. <i>“The work is relatively minimal. Outbreaks are rare, and often easy enough to contain.”</i> She shifts in her seat, leaning in forward more. <i>“I have been specially programmed to understand New Texan mating customs, to better predict possible spreading patterns.”</i>");
	output("\n\nThat gives you a moment’s pause. <i>“What do you mean by that?”</i>");
	output("\n\nV-KO smiles and tilts her head. <i>“Ah, a chance to segue. If you are curious as to the extent of my knowledge, I would be more than willing to show you the full extent of my sexual database.”</i> She straightens out her head and stays silent a moment, staring at you. The nursedroid breaks the silence many long heartbeats later. <i>“I mean sex. I wish to have sex.”</i>");
	output("\n\n<i>“Ah, right.”</i> You give the nurse a look up and down. She seems to be build standard, so you doubt there would be any surprises. Now you just need to decide what to do...");
	
	if(!CodexManager.entryUnlocked("V-Ko")) 
	{
		output("\n\nYour codex beeps to inform you it’s identified V-Ko robots.");
		CodexManager.unlockEntry("V-Ko");
	}
	
	processTime(5);
	addButton(0,"Accept",extrameetVKOSex,undefined,"Accept","Let her show you what is in here sexual database");
	addButton(14,"Bail",extrameetBailScene);
}
public function extrameetVKOSex():void
{
	clearOutput();
	clearMenu();
	showName("\nV-KO#1221341");
	author("Fr0sty");
	
	var kok:int = rand(pc.cockTotal());
	
	output("<i>“Um, sure. Why not.”</i>");
	output("\n\nThe nursedroid smiles at you. <i>“Excellent.”</i> Her eyes seem to go out of focus for a moment and she starts to stare off into the distance. After an awkward moment of silence, she focuses in once more and turns to you. <i>“According to my data, the nearest suitable location for us to engage in sexual activity is in a broom closet approximately 10 meters from our current location. Unless....”</i> Her eyes seem to roll into the back of her head for a moment, then pop back into place. <i>“If you would like me to engage my exhibionist protocols, we can instead engage at the bar 4 meters away from us. Analysis indicates it is the only table sturdy enough to support both of our weight under a working load.”</i>");
	output("\n\n<i>“Um...”</i> You turn and take a look at the bar. While it does indeed look study enough, you’re not sure the patrons sitting at it are going to afford you the room to work. You turn back to your date and shrug. <i>“Broom closet I guess...”</i>");
	output("\n\n<i>“Excellent.”</i> The nursedroid stands up and brushes down her skirt. <i>“I shall go first. Follow me after 5 minutes, as to not raise suspicion, as is standard custom.”</i> She scoots away from her chair and walks to the other end of the bar, disappearing into the crowd.");
	output("\n\nYou sit alone for a moment, feeling more than a little awkward at the whole situation. Your date’s approach to sex is curious, like she’s researched it thoroughly but only understands it in an academic manner. Well whatever, at least it’s different. After a few minutes, you rise from your chair and head in the direction she walked off in. Sure enough, you spot the broom closet. Trying to be casual, you open up the closet and slip inside, trying not to arouse suspicion. Fuck it’s dark in here.");
	output("\n\n<i>“Hello.”</i> You nearly jump out of your [pc.skinFurScales] at the sound of the nursedroid’s voice. She’s standing very close to you, but you can’t see her at all. <i>“I regret to inform you I miscalculated both the lighting and the spaciousness of the closet. Regardless, it is still suitable for our purposes.”</i> You feel her shuffle around next to you, moving closer you suspect.");
	output("\n\nHer hands patting around your crotch let you know exactly where she is, and her touch makes you jump once more, this time knocking over a bucket. She doesn’t seem bothered by your movement and her fingers work away, freeing your flaccid member from under your gear. Her fingers are cold against your cock flesh, and you feel it twitch in her grasp.");
	output("\n\n<i>“Not aroused? Interesting. While I am aware my body may not be particularly stimulating to most organics, I had calculated that the promise of sexual conta- Oh, never mind.”</i> Despite her droning on, you feel yourself start to fatten in her hand. The droid starts to gently stroke you, helping your rising cock along. It doesn’t take long before it’s hard and at attention and your date runs her fingers over it, seemingly measuring it. <i>“Logged the dimensions. Adjusting vaginal cavity for maximum pleasure output.”</i>");
	output("\n\n<i>“You can do that?”</i> You can’t hide the surprise in your voice.");
	output("\n\n<i>“Of course.”</i> You feel the droid release you and feel her move around again, rising up to her feet if you had to guess. She bumps into you for a moment, positioning herself in some unseen way. <i>“Alright. I am ready to be taken.”</i>");
	output("\n\n<i>“Um... Okay.”</i> She really needs to work on her dirty talk. You reach out and feel her in front of you, bent over with her ass raised up. Stepping forward, you take ahold of yourself and move your cock in forward towards her unseen twat. Despite not being able to see it, you feel an odd warmth radiating from her, marking your target. Aiming for the heat, you push forward.");
	output("\n\nYour first impression of her cunt is that it’s not like anything you’ve dealt with before. It’s warm and tight, but it seems molded and formed, sculpted so it’s snug against every inch of your [pc.cockShape " + kok + "] cock. It seems to pull you in, and before you notice your whole length is sucked up into her. Caught off guard, you take a few sharp breaths while you try to collect yourself, her warm tunnel making your cock flesh tingle. <i>“Would you like to thrust or shall I back up on it?”</i> You hear your date ask from the darkness.");
	
	pc.cockChange();
	
	output("\n\nWithout waiting for an answer, you feel the nursedroid start to move her rear end, bucking her hips along your engorged length. Her twat seems to tighten around you, squeezing down on your manhood and making you gasp and throb in pleasure. You take hold of the droid’s hips, starting to thrust on your own, attempting to match the ebb and flow of the nurse’s pace. The warmth of the synthetic cunt makes your cock burn, the sensitive flesh feeling alive with pleasure as the temperature slowly seems to rise. Spurred on, you pick up your pace, plowing the droid so hard you hear her front end slam against the wall. With her face pressed against the wall you hear her mutter. <i>“Initiating vaginal nodes.”</i>");
	output("\n\n<i>“Vaginal wha- OH FUCK.”</i> You howl at the top of your lungs as dozens of hidden nubs in the droid’s cunt press against your shaft. The nubs begin to vibrate, stimulating your buried member in a way you’ve never felt before. The sensation is intoxicating, and you plunge yourself deep into the droid, trying to get as many of the nubs as possible vibrating against you. With your hips pressed against hers, you feel the nurse start to wiggle her hips back and forth, each shift pressing different nubs against your throbbing meat.");
	output("\n\nYou feel yourself start to draw closer to climax, her wiggle and the nubs making your cock burn.");
	
	if (pc.balls > 0) 	output(" You throw your head back and groan as your [pc.balls] start to churn.");
	
	output(" Sensing your orgasm, you feel your date’s cunt clamp down tight on you, squeezing your dick so hard she almost crushes it. You try to cry out, but only groan louder as your cock pulses in the iron tight snatch, your thick load exploding from your [pc.cockHead " + kok + "]. Deep inside the synthetic cunt you feel an odd sucking, seemingly pulling the cum right out of you. The sucking only makes your orgasm more intense, and you feel your body shake uncontrollably. A minute later you feel the pressure on your dick release, and you stagger backwards, pulling yourself free.");
	output("\n\n<i>“That was most impressive.”</i> You hear the droid shift in the darkness. <i>“You vitality is 10% higher than I anticipated. However, I detect lower than normal protein in your ejaculate. Might I suggest a supplement?”</i>");
	output("\n\nYou stuff your oddly dry and clean dick away, still unable to see the droid. <i>“Um. No, I think I’m fine.”</i> Did she analyse your spunk?");
	output("\n\n<i>“Very well. You should leave first as to not arouse suspicion. I will remain here for a few moments. It was a splendid date, and above average sex. Thank you, and please cum again!”</i> You hear the nurse give out an odd electronic chuckle, and it takes you a moment to get what she’s laughing about.");
	output("\n\n<i>“Right...”</i> You turn around and fumble around for the door knob. Light assaults your eyes as you open the door and step out into the bar. You glance back at your date, who smiles at you and waves. <i>“Bye...”</i> You exit the closet and close the door, leaving the weird droid in the closet.");
	
	processTime(15 + rand(15));
	pc.orgasm();
	
	IncrementFlag("EXTRAMEET_SEX");
	IncrementFlag("EXTRAMEET_CUNT_GIVE");
	addButton(0,"Next",mainGameMenu);
}

//SexyyDaddyy
//[EXTRAMEET_SEXYYDADDYY]
public function extrameetSexyyDaddyyProfile():void
{
	output("The profile picture on your screen is a photo of a rather burly looking tusked man. His skin is dark green and his head is shaved bald. You think he’s trying to give a sexy smile, but it just looks awkward.");
	output("\n\nUsername: SexyyDaddyy");
	output("\nSex: Male");
	output("\nAge: 35 Years");
	output("\nRace: Thraggen");
	output("\nPlanet: New Texas");
	output("\n\nBio:");
	output("\nHey sexy ladies. You want some dick? Cause I’ve got some some extra.");
}
public function extrameetSexyyDaddyyCheckMatch():Boolean
{
	//non-taur and feminine
	if (!pc.isTaur() && pc.isFeminine(true)) return true;
	else return false;
}
public function extrameetSexyyDaddyyDate():void
{
	//showName("SexyyDaddyy");
	showName("SEXY DADDY");
	author("Fr0sty");
	moveTo("BUCKING BRONCO");
	output("You enter The Bucking Bronco and take a look around, seeing your very large date sitting in the back. He is much larger than his picture suggested, and you even wonder how he fit through the door. He spots you as you move towards his table, his red eyes fixated. When you reach the table he rises up and smiles at you.");
	output("\n\n<i>“Hi.”</i> He stands in front of you, wider and taller than anybody else in the room. He’s wearing very loose fitting clothing that could be used as a tent by a smaller person. You can tell under his clothing he is a mass of muscle, and you get the feeling the reason his clothes are loose is so he doesn’t rip them when he moves. <i>“I’m Orren. Would you like to sit?”</i>");
	output("\n\nYou take a seat across from the large man and introduce yourself. His tusked smile widens and he sits down, his chair groaning under his weight. Trying to make some small talk, you ask Orren if he was waiting long.");
	output("\n\nThe Thraggen shakes his head. <i>“No. Not long.”</i> He runs a massive hand over his shaved head. <i>“To be honest I wasn’t sure you were going to show up at all. I don’t think I would have waited long.”</i>");
	output("\n\nYou can’t help but frown. <i>“Why would you think I’d stand you up?”</i>");
	output("\n\nOrren’s sighs, rolling his massive shoulders. <i>“Well, I’m a Thraggen for one. That’s usually a deal breaker. My kind doesn’t exactly get along with the rest of the civilized galaxy.”</i> He gives a hearty chuckle, more amused than dejected at the self deprecating jab.");
	output("\n\nYou don’t exactly blame him either. Thraggen typically do have a bad rep, and are often isolated from the rest of the galaxy. Which does make you wonder... You ask him what exactly a Thraggen is doing on New Texas.");
	output("\n\nThe large man takes a deep breath. <i>“Well, it’s a long story.”</i> He scratches his chin, his red eyes closing for a moment in contemplation. <i>“Short version, I’m on holiday. I don’t think much more really needs to be said.”</i> He opens his eyes and gives you a grin. <i>“New Texas seemed like a fun place. The ladies around here really know how to treat a man right.”</i>");
	output("\n\nYou roll your eyes and chuckle. <i>“Just here for the sex then?”</i>");
	output("\n\nIt’s Orren’s turn to chuckle now. <i>“You can say that.”</i> He leans in closer, his red eyes focused in on you. <i>“But the locals are starting to become a tad tedious. I was hoping I’d be able to find something a little more... Interesting.”</i> The table seems to wobble and rise up, something unseen underneath pushing up against it.");
	output("\n\nIt doesn’t take a clairvoyant to tell where this is going.");
	
	if(!CodexManager.entryUnlocked("Thraggen")) 
	{
		output("\n\nYour codex beeps to inform you it’s identified the Thraggen race.");
		CodexManager.unlockEntry("Thraggen");
	}
	
	processTime(5);
	addButton(0,"Go with it",extrameetSexyyDaddyySex,undefined,"Go with it","Go with what is going on under the table");
	addButton(14,"Bail",extrameetBailScene);
}

public function extrameetSexyyDaddyySex():void
{
	clearOutput();
	clearMenu();
	//showName("SexyyDaddyy");
	showName("SEXY DADDY");
	author("Fr0sty");
	
	output("You decide to go with it and see where this takes you. You start by leaning down and taking a quick peek under the table. Sure enough, a massive erection has both tented his pants and is causing the table to tilt. At a glance, you can tell the Thraggen is packing some serious meat down there, and you’re more than a little curious to see more.");
	output("\n\nDeciding to give your date something ‘interesting’, you duck under the table and crawl forward, hearing only a slight query from above. He quickly shuts up once you’re fully under the table, and it becomes very clear what you’re up to. Up close you can tell just how massive his monster cock is, noticing it’s still rising and getting harder by the second. The table almost topples right over as it reaches the size of your forearm, his pants straining to hold it in. You inch forward and pop open your date’s fly, letting his massive green member free.");
	output("\n\n‘Monster’ is the only word you can think of to describe it. Not only is it long, but it’s also wickedly thick. It seems to settle to full size, sitting close to two feet in length and around four inches thick. It’s so large you don’t even know what to do with it, doubting you’d even be able to take something so big. Despite that, you feel your mouth starts to water at the sight of the big green behemoth. It’s monster size only makes it seem more alluring, and before you know it you’re leaning in and giving it a deep whiff. It smells of sex and cum, but oddly that only makes it more enticing.");
	output("\n\nWithout even thinking about it you lean in and give his engorged cockhead a kiss, causing your date to quiver. Big and sensitive. Interesting. You give it another deeper kiss, this time under his flared crown. He doesn’t seem to react as strongly, but you suspect he’s just playing tough now. You send a trail of kisses up and down his impossibly long shaft, getting familiar with the every curve and vein in his meaty member. Above you Orren sighs contently, but otherwise doesn’t seem to react. You can’t help but take that as a challenge.");
	output("\n\nYour attention returns to his head, a mass the size of a small fist. This isn’t going to be easy, but you can’t help but feel yourself desiring to try anyways. You open wide, as wide as you can muster and lean in. Orren almost jumps out of his seat the instant you take his flared crown into your mouth, whether out of surprise or pleasure you’re not sure. When he jumps, your teeth end up sinking into his cockflesh slightly, not enough to draw blood, but more than enough to surely cause the large man some pain. Instead of a cry of discomfort you hear a very lewd and lusty groan. A random fact you had nearly forgotten pops into the back of your mind: Thraggen get off on pain.");
	output("\n\nFor a moment you contemplate just biting down on the massive cock stuffed in your mouth, but decide against it. Instead to rest your over stressed jaw slightly, you try giving a bit more teeth than anybody receiving a blowjob would ever care for. Well, at least any non Thraggen would care for. Orren seems to like it, as you can hear his breathing sharpen as you press against his meat. Pushing yourself slightly, you try to take a bit more of the green monster into your mouth, careful not to choke. Your teeth slide along his thick shaft, lubed up by your cock-hungry drool. The Thraggen moans and shakes, much more than you would have expected and far more than anybody should this early into head.");
	output("\n\nIt doesn’t take long to hit your limit, and you almost gag on the monster. From what you can tell, you’ve maybe got a quarter of the whole thing in your mouth. If that. The idea of trying to take in and service such a huge dick excites you more than a little, and you feel something akin to butterflies in your stomach. You have to try. It’s a matter of principle. You take ahold of the massive member with both hands, and get to work pumping.");
	output("\n\nEven both hands stroking you feel like is barely enough to work at Orren. His cock is simply too big and thick to properly handle. The fact you’re able to make any progress is a small miracle, but based on the moans from above the table you seem to be doing great. You try to move your mouth, but find it difficult. Did he get bigger? You try to move again. Holy shit he got bigger. It’s stuck in your mouth, causing you a moment of panic. In that brief instant, you bite down slightly, once more sinking your teeth into his meaty cock flesh. Orren moans so loudly the rest of the bar goes quiet, and his already over inflated cock seems to throb in your mouth.");
	output("\n\nYou can’t help but struggle, the monster clearly too much for you. In your mind you can’t help but feel like you bit off more than you can chew, but that seems far too ironic a thought. You breathe through your nose while the massive dong in your mouth throbs, each pulse pressing it harder against your teeth, and with each press Orren moans louder. Your hands keep working the shaft, stroking up and down the whole of his length more on their own than anything. You’re operating on autopilot now, barely aware of your actions. A few moments later something changes. Something is coming. Your eyes open wide in fear. He’s cumming.");
	output("\n\nYou feel it with your hands first, a surge of something right under the surface. A massive load firing out of the chamber. When it hits the top you feel it. You gag and choke as an impossible about of cum blasts into your mouth, the cockhead far too large to spit out. Hot spunk fills your throat, exploding out of Orren with such force you feel it come out of your nose. You squeeze his cock hard, more on reflex than anything, the fight part of a fight or flight response. That only makes Orren moan louder, the pain making his orgasm all the better. Pulling with both your hands, you yank the monster out of your mouth with all your strength, teeth marks scratching into Orren as you pull. The Thraggen groans so lewdly you think he might cum again after that.");
	
	pc.lust(10);
	pc.exhibitionism(2);
	processTime(10 + rand(15));
	pc.loadInMouth(chars["SEXYYDADDYY"]);
	
	output("\n\nYou stay under the table a minute coughing and hacking up cum. Most of it is in your stomach, and you feel it burning a hole in your belly it’s so warm. After you catch your breath you pull yourself out from under the table. Orren is leaning back in his chair, his tongue hanging out of his mouth and his eyes staring off into space. <i>“Wow... I’ve never had a blowjob before... It it always that good?”</i>");
	output("\n\nYou’re not sure how to answer that question, but you suspect you know why nobody ever stepped up to the plate. Orren’s orgasm left him dazed and out of it. You suspect he’ll be in la-la land for awhile, and feel like your date is concluded. You bid him farewell, but he barely seems to notice, staring at the ceiling and daydreaming.");
	output("\n\nYou stand and head to the exit, leaving the Thraggen alone with his dick still out under the table. Guess you passed the challenge. Barely.");
	
	IncrementFlag("EXTRAMEET_SEX");
	IncrementFlag("EXTRAMEET_ORAL_GIVE");
	addButton(0,"Next",mainGameMenu);
}


//New Texas flavor (will never match)
//Funnyboi1
//[EXTRAMEET_FUNNYBOI1]
public function extrameetFunnyboi1Profile():void
{
	output("The profile picture on your screen is of an equine penis... wearing a hat?");
	output("\n\nUsername: Funnyboi1");
	output("\nSex: Male");
	output("\nAge: 19 Years");
	output("\nRace: Human+");
	output("\nPlanet: New Texas");
	output("\n\nBio:");
	output("\nIf the ladies don’t find you handsome, they should at least find you funny.");
}

//Mylittlefunbox
//[EXTRAMEET_MYLITTLEFUNBOX]
public function extrameetMylittlefunboxProfile():void
{
	output("The profile picture on your screen is of a nude man holding a box over his crotch. Somehow, you get the feeling the box isn’t empty...");
	output("\n\nUsername: Mylittlefunbox");
	output("\nSex: Male");
	output("\nAge: 35 Years");
	output("\nRace: Human+");
	output("\nPlanet: New Texas");
	output("\n\nBio:");
	output("\nYou won the prize! Swipe right to get a peek inside the box. ;)");
}

//Your-Mommy
//[EXTRAMEET_YOURMOMMY]
public function extrameetYourMommyProfile():void
{
	output("The profile picture on your screen is of a very busty cowgirl with her tits out. She’s giving the camera a very suggestive wink, and giving her ample chest a good grope.");
	output("\n\nUsername: Your-Mommy");
	output("\nSex: Female");
	output("\nAge: 40 Years");
	output("\nRace: Human+");
	output("\nPlanet: New Texas");
	output("\n\nBio:");
	output("\nLooking for a momma’s boy. I’ll treat you right and take very good care of you. ;D");
}

//BrattyKitten
//[EXTRAMEET_BRATTYKITTEN]
public function extrameetBrattyKittenProfile():void
{
	output("The profile picture on your screen is a group photo of about 5 women. You assume the subject of the profile is the sole Kaithrit in the picture, but you can’t tell much about her other than her race.");
	output("\n\nUsername: BrattyKitten");
	output("\nSex: Female");
	output("\nAge: 22 Years");
	output("\nRace: Kaitrit");
	output("\nPlanet: New Texas");
	output("\n\nBio:");
	output("\nOn planet for vacation. Looking to sample some of the local “delicacies”.");
}

//everythingdies
//[EXTRAMEET_EVERYTHINGDIES]
public function extrameetEverythingdiesProfile():void
{
	output("The profile picture on your screen is of what looks like a clown wearing black... Closer inspection reveals it’s just somebody wearing far too much makeup and hair gel.");
	output("\n\nUsername: everythingdies");
	output("\nSex: Male");
	output("\nAge: 26 Years");
	output("\nRace: Human");
	output("\nPlanet: New Texas");
	output("\n\nBio:");
	output("\nIf life is fair, why do roses have thorns? No fat chicks.");
}

//ThickLoadz
//[EXTRAMEET_THICKLOADZ]
public function extrameetThickLoadzProfile():void
{
	output("The profile picture on your screen is of a huge dick and the largest set of balls you’ve ever seen. Although you don’t have a great sense of scale, they are easily as large as beach balls.");
	output("\n\nUsername: ThickLoadz");
	output("\nSex: Male");
	output("\nAge: 32 Years");
	output("\nRace: Human+");
	output("\nPlanet: New Texas");
	output("\n\nBio:");
	output("\nPhoto is from after I came. Swipe right and I’ll show you the before.");
}

//Stroke4Me
//[EXTRAMEET_STROKE4ME]
public function extrameetStroke4MeProfile():void
{
	output("The profile picture on your screen shows a pair of doggy ears and a blonde mess of hair. The subject is an Ausar--at least, as far you can tell...");
	output("\n\nUsername: Stroke4Me");
	output("\nSex: Female");
	output("\nAge: 24 Years");
	output("\nRace: Ausar");
	output("\nPlanet: New Texas");
	output("\n\nBio:");
	output("\nI like to watch.");
}

//LaughingDragon
//[EXTRAMEET_LAUGHINGDRAGON]
public function extrameetLaughingDragonProfile():void
{
	output("The profile picture on your screen is of a very drunk Gryvain. You can tell she’s plastered out of her mind not only by her expression, but by the pile of empty bottles next to her in the picture.");
	output("\n\nUsername: LaughingDragon");
	output("\nSex: Other");
	output("\nAge: 67 Years");
	output("\nRace: Gryvain");
	output("\nPlanet: New Texas");
	output("\n\nBio:");
	output("\nLooking for some fun. On planet for one night only. Eager to drink “from the tap” if you know what I mean.");
}

//TheBiggestHorse
//[EXTRAMEET_THEBIGGESTHORSE]
public function extrameetTheBiggestHorseProfile():void
{
	output("The profile picture on your screen is of a very tall tauric man standing next to a road sign. From what you can tell he was human at some point, and based on how he towers over the sign he’s massive.");
	output("\n\nUsername: TheBiggestHorse");
	output("\nSex: Male");
	output("\nAge: 29 Years");
	output("\nRace: Human+");
	output("\nPlanet: New Texas");
	output("\n\nBio:");
	output("\nHello! Recently single and ready to get back on the dating “horse”. Clearly I’m not that funny, but I make up for it in other areas.");
}

//Cumsnuggle
//[EXTRAMEET_CUMSNUGGLE]
public function extrameetCumsnuggleProfile():void
{
	output("The profile picture on your screen is blank.");
	output("\n\nUsername: Cumsnuggle");
	output("\nSex: Female");
	output("\nAge: 24 Years");
	output("\nRace: Human+");
	output("\nPlanet: New Texas");
	output("\n\nBio:");
	output("\nHow do I delete this?");
}

//mhen'ga

//HuggATree
//[EXTRAMEET_HUGGATREE]
public function extrameetHuggATreeProfile():void
{
	output("The profile picture on your screen is of a very dirty looking Kaithrit woman. While she is certainly good looking, she seems to be covered in leaves and mud. At least you think it’s mud...");
	output("\n\nUsername: HuggATree");
	output("\nSex: Female");
	output("\nAge: 21 Years");
	output("\nRace: Kaithrit");
	output("\nPlanet: Mhen’ga");
	output("\n\nBio:");
	output("\nSAVE THE TREES! Just a gal trying to make a difference. Looking for other like minded individuals to join the cause! Also I’m Vegan.");
}
public function extrameetHuggATreeCheckMatch():Boolean
{
	//no requirements so just return true		
	return true;
}
public function extrameetHuggATreeDate():void
{
	showName("\nHUG A TREE");
	//showName("HuggATree");
	author("Fr0sty");
	moveTo("BURT'S MAIN HALL");
	output("You enter Burt’s Meadhall and see your date sitting alone. You make your way over, catching her gaze as you walk across the room. She stands up as you approach, positioning her hands in front of her and giving you a slight bow. Well that’s nice.");
	output("\n\nLike most Kaithrit women she is tall, standing well over six feet. She is dressed it what looks like a robe, but as you get closer you can see it’s sewn together burlap sacks. You also notice she has significantly less mud and leaves on her, so that’s nice. You reach her and return the small bow, then introduce yourself.");
	output("\n\n<i>“Hello [pc.name], I am Moon Sprite. You may call me Moon for short.”</i> Her voice is deep with a slight rasp. You can’t help but feel like she was just smoking something a few minutes ago. She takes her seat and motions for you to sit as well, which you do. <i>“Welcome to paradise, friend.”</i>");
	output("\n\nYou take a seat across from the odd hippy woman. <i>“Paradise?”</i>");
	output("\n\nMoon’s eyes seem to flutter a moment. <i>“Oh yes. Truly this planet is touched by the goddess. Nature here is so pure and primal. The trees sing ancient songs.”</i> She closes her eyes and sways slightly in her seat. <i>“If you listen you can hear it even here, that’s how strong the jungle is.”</i> Her eyes snap open. <i>“But the man wants to ruin that.”</i>");
	output("\n\nYou stare at your strange companion a moment. <i>“What man?”</i>");
	output("\n\n<i>“THE man. Like, the system, man. The patriarchal social construct that has persisted for centuries. That man. The man who would burn the jungles and fell the trees.”</i> Moon’s face starts to turn red, and the Kaithrit woman seems to grow anxious and agitated. <i>“That’s why I’m here, to fight against the man and save as much of this beautiful world as I can.”</i>");
	output("\n\nSeeing the passion from the tall woman makes your feel slightly uncomfortable. You try to shift the topic to something else, hoping maybe you can take your date in a more intimate direction. Moon doesn’t seem to notice your subtle attempts to shift the direction of the conversation. Instead, you opt for the direct approach. <i>“So, you wanna fuck?”</i>");
	output("\n\nMoon seems taken aback for a moment, staring at you with her mouth slightly agape. After a long pause she answers. <i>“What? No.”</i> She gives you an incredulous look. <i>“No offense, but I’m not here for a booty call. I was hoping to meet a fellow ally of nature who would be willing to stand on the frontlines with me.”</i>");
	output("\n\nOh. You clear your throat, feeling very awkward now. You ask the Kaithrit woman what exactly she means by frontlines?");
	output("\n\n<i>“Well, I’m planning on chaining myself to a tree for a month, starting tomorrow. I was hoping to find somebody to chain themselves to the tree next to me. So I don’t get lonely.”</i> She gives you a serious look. <i>“So. Interested? We can fuck after.”</i>");
	output("\n\nChained to a tree for a month? Um....");
	
	if(!CodexManager.entryUnlocked("Kaithrit")) 
	{
		output("\n\nYour codex beeps to inform you it’s identified the Kaithrit race.");
		CodexManager.unlockEntry("Kaithrit");
	}
	
	processTime(10);
	addButton(14,"Bail",extrameetBailScene);
}

//The_Honeypott
//[EXTRAMEET_HONEYPOTT]
public function extrameetHoneypottProfile():void
{
	output("The profile picture on your screen is a selfie of an above average looking dark haired Zil woman. The picture is only of her face, so you cannot tell anything further about her other than her species.");
	output("\n\nUsername: The_Honeypott");
	output("\nSex: Female");
	output("\nAge: 26 Years");
	output("\nRace: Zil");
	output("\nPlanet: Mhen’ga");
	output("\n\nBio:");
	output("\nCurious Zil seeking curious offworlder for sexual relations. Not very picky, but a willingness to submit is preferred. Must like the taste of Zil. Spicy meals prior to a potential meeting is discouraged.");
}
public function extrameetHoneypottCheckMatch():Boolean
{
	//no requirements so just return true		
	return true;
}

public function extrameetHoneypottDate():void
{
	//showName("The_Honeypott");
	showName("THE\nHONEYPOT");
	author("Fr0sty");
	moveTo("BURT'S MAIN HALL");
	output("You enter Burt’s Meadhall and immediately spot your Zil date. She is seated alone in the back, closely examining a drink in front of her, almost as if suspicious of it. Like most Zil, she is not wearing proper clothing, instead only concealed by her natural chitin. You approach her and introduce yourself. She regards you for a moment silently, then motions for you to sit. You take your seat and ask for her name.");
	output("\n\n<i>“You may call me ‘Honey’.”</i> The Zil woman speaks in a curt matter of factly tone. <i>“It was a name given to me by a most boastful and informative offworlder.”</i>");
	output("\n\n<i>“Um... Okay.”</i> You try to make some small talk and ask the Zil woman about herself.");
	output("\n\nHoney thinks a moment. <i>“The closest word I can use to describe myself is ‘anthropologist’. I have dedicated myself to the study of offworlders and their customs. My interest has caused me to become... hmm... another offworlder referred to me as being ‘off the reservation’ in regards to my tribe. His meaning was inarticulate, but not incorrect.”</i>");
	output("\n\nYou nod a bit, following along. <i>“So you’re in exile?”</i>");
	output("\n\nHoney contemplates your words a moment. <i>“In a sense. My thirst for knowledge is a hunt, and one must leave home for a hunt. I may return when I wish, but I would not be allowed to leave again without proper reason. Now please, tell me about yourself offworlder. I wish to engage in a proper exchange of information.”</i>");
	output("\n\nYou start telling your date about yourself, including your quest for the probes. Honey listens and nods along, asking for clarification on some points as you tell your story. A few minutes later the Zil woman raises her hand, silencing you.");
	output("\n\n<i>“You have been most informative. However, I believe a sufficient degree of courting customs have been met and we may now move along to sexual relations.”</i> The Zil rubs her hands together. <i>“I trust you are prepared?”</i>");
	output("\n\nYou stare at Honey a moment. <i>“What?”</i>");
	output("\n\nThe Zil raises a brow and frowns. <i>“Are you not interested in sexual relations with me?”</i> Honey looks down at herself. <i>“Am I not sexually stimulating for you? If that is the case this is a first.”</i> She leans in close. <i>“If that is the case please tell me what, as you offworlders say, ‘turns your crank’ so I may better understand my shortcomings.”</i>");
	
	if(!CodexManager.entryUnlocked("Zil")) 
	{
		output("\n\nYour codex beeps to inform you it’s identified the Zil race.");
		CodexManager.unlockEntry("Zil");
	}
	
	processTime(15);
	addButton(0,"Nothing wrong with her",extrameetHoneypottSex,undefined,"Nothing wrong with her","Let her know there is nothing wrong with her and you do want to have sex");
	addButton(14,"Bail",extrameetBailScene);
}
public function extrameetHoneypottSex():void
{
	clearOutput();
	clearMenu();
	//showName("The_Honeypott");
	showName("THE\nHONEYPOT");
	author("Fr0sty");
	
	moveTo("JUNGLE EDGE");
	output("You tell the Zil woman there is nothing wrong with her.");
	output("\n\nShe stares at you a moment then rises to her feet. <i>“Most excellent. Follow me, we shall proceed with cunnilingus at once.”</i> Before you can get a word in she turns and marches off, forcing you to follow her.");
	output("\n\nThe two of you exit the bar and walk a fair distance, more than one head turning to regard Honey with curious or concerned looks. For the most part she doesn’t even seem to notice, humming some foreign tune while the two of you walk. After a few minutes you realize you are heading straight towards the jungle.");
	output("\n\n<i>“Um, we’re doing it in there?”</i> You can’t help but show the concern in your voice.");
	output("\n\nHoney turns and shrugs. <i>“I’ve already experienced all the traditional mating grounds of offworlders, with the sole exception of a ‘backseat of a camaro’. So unless you possess that, I’d prefer something more to my comfort.”</i> You reach the tree line and the Zil stops and turns to you. <i>“Alright. On your back.”</i>");
	output("\n\nYou do as she tells you, slightly confused but not unwilling to go along with it. Didn’t she want you to eat her out? Once you are flat on the ground you understand immediately. The Zil woman positions herself over you, her twat directly above your face. Before you can say anything she drops herself down, her cunt now smothering you. The Zil wiggles her hips, grinding herself against your face. After a long moment she stops the wiggle, seemingly comfortable with her position. <i>“Proceed.”</i>");
	output("\n\nYou struggle to breathe, trying to adjust your nose to catch some air. The woman’s cunt has a potent smell to it, assaulting your senses. You feel your face grow hot. Something about her odor is making your blood start to boil. Without even thinking about it you part your lips and kiss the Zil cunt pressed against you, catching a faint taste of it. She tastes sweet, her juices more akin to nectar than typical secretions. You open your lips wider trying to taste more.");
	output("\n\nIt doesn’t take long before you are properly lapping away at the Zil woman. You barely even notice her weight on top of you as you crush your face against her, trying to bury your tongue in deeper. Her sweetness drenches your lips and tongue, the aroma making your whole body tingle. You feel your crotch ache, your sex starting to throb with the need to be touched. You struggle but find yourself barely able to move your limbs. That dangerous cunt of hers was driving you wild, while also paralyzing you.");
	output("\n\nResigned to being immobile, you keep up your licking, Honey cooing above you at your efforts. You feel your body grow more numb by the minute, the paralysis taking near full effect. Despite that, you feel your body burn with lust induced heat, growing hotter by the second as you keep eating away at the Zil’s cunt. Trying your best to shift, you position your tongue so you can work at her clit, trying to force more juices out by working her pleasure button");
	output("\n\nYou hear Honey moan above you, and from the gushing fluids below you can tell your tongue is having an effect. Her chitinous thighs squeeze against your head, threatening to crush your skull as you crane your neck, trying to push your tongue to its limit. You feel it start to cramp and stiffen, unsure if the exhaustion is from your efforts or her secretions.");
	
	if (pc.hasCock()) output(" You feel your [pc.cockNounSimple " + rand(pc.cockTotal()) + "] throb and burn, almost on the brink of orgasm from her torturous nectar.");
	else if (pc.hasVagina()) output(" You feel your sex quiver and burn, almost on the brink of orgasm from her torturous nectar.");
	
	output("\n\nThe Zil beats you to it, screaming out in pleasure and squeezing her thighs so tight against your head you hear a pop in your ear. She convulses on top of you, sending her cunt into a wild fit, sweet juices flooding your nose and mouth. You feel your eyes start to roll back as her chemical attack causes you to shiver, an orgasm of your own starting to rock you.");
	
	if (pc.hasCock())
	{
		if (pc.cockTotal() > 1) output(" Your cocks throb, and you feel them unload thick streams of cum.");
		else output(" Your cock throbs, and you feel it unload thick streams of cum.");
	}
	if (pc.hasVagina())
	{
		output(" Your [pc.vagina " + rand(pc.vaginaTotal()) + "] burns as ripples of pleasure radiate from your trembling sex.");
	}
	
	output("\n\nA few long heartbeats later Honey lifts herself off of you, her legs shaking beneath her. <i>“Most impressive. You did not pass out. I was afraid that may happen.”</i> She stretches and smiles down at you. <i>“Normally, I would give you the ‘cab fare’, as is the custom of your people, but sadly I am without sufficient funds. Thank you again offworlder, this was most enjoyable.”</i> Without another word, the Zil womans turns and walks further into the thick bush of the jungle.");
	output("\n\nYou twitch on the ground, still barely able to move. Did she just leave you alone and paralyzed on the ground in the jungle? You strain your muscles, trying to rouse them. She did. You hear the sounds of wildlife around you and you start to struggle more, trying to get to your feet.");
	output("\n\nWell, at least you came.");
	
	processTime(20 + rand(15));
	pc.orgasm();
	pc.girlCumInMouth(chars["ZILFEMALE"]);
	if (pc.hasCock()) pc.applyCumSoaked();
	pc.applyPussyDrenched();
	
	IncrementFlag("EXTRAMEET_SEX");
	IncrementFlag("EXTRAMEET_ORAL_GIVE");
	addButton(0,"Next",mainGameMenu);
}
//Bountiful_Botany
//[EXTRAMEET_BOUNTIFULBOTANY]
public function extrameetBountifulBotanyProfile():void
{
	output("The profile picture on your screen is a headshot of a young woman with thick rimmed glasses. Curiously, her skin is olive green and her red hair has what looks like leaves scattered through it.");
	output("\n\nUsername: Bountiful_Botany");
	output("\nSex: Female");
	output("\nAge: 24 Years");
	output("\nRace: Human+");
	output("\nPlanet: Mhen’ga");
	output("\n\nBio:");
	output("\nGraduate student studying local plant life. On planet for the foreseeable future. Looking for adventurous companion who isn’t shy of a green thumb, or a little extra either.");
}
public function extrameetBountifulBotanyCheckMatch():Boolean
{
	//not taur has vagina
	if (!pc.isTaur() && pc.hasVagina()) return true;
	else return false;
}

public function extrameetBountifulBotanyDate():void
{
	//showName("Bountiful_Botany");
	showName("BOUNTIFUL\nBOTANY");
	author("Fr0sty");
	moveTo("BURT'S MAIN HALL");
	output("You enter Burt’s Meadhall and spot a familiar mess of red hair. You move in closer, getting a better impression of the woman. The first thing you notice is that she’s wearing a long baggy coat which hides her figure, making it difficult to size her up. With closer inspection of her green skin you notice it has an odd translucent sheen to it. You reach the table and introduce yourself, taking a seat across from the plant woman.");
	output("\n\nShe gives you a smile and looks you over, adjusting her glasses. <i>“[pc.name], huh? Nice to meet you. Call me Bee.”</i> She offers out her hand. You take her hand and give it a firm shake, her grip much stronger than you expected. You notice her sleeve wiggle slightly before she takes away her hand. She asks you about yourself, adjusting her glasses once more.");
	output("\n\nYou tell her about things currently going on, including your quest for the probes. As you talk you see her eyes light up, enthralled by the tales of your adventures. You can’t help but notice odd shifts underneath her jacket, like something is moving around on the other side of the fabric. Once you’ve finished, you ask the green woman about herself in turn.");
	output("\n\n<i>“Well, I’m here working towards my PH.D. I’m a botanist, if you couldn’t tell.”</i> She gives her red hair a flick, showing off some of the leaves which seem to be growing from her head. <i>“More precisely, I’m researching new ways to splice plant DNA. Since I’m not a doctor, I splice myself. You’d be surprised how many people don’t like the idea of an unlicensed semi-professional trying out experimental mods.”</i> She chuckles and adjusts her glasses, and you notice more wiggling under her jacket.");
	output("\n\nYour curiosity at its limit, you decide to ask her what’s going on under her coat.");
	output("\n\n<i>“Oh, those are just my vines.”</i> Her face lights up, seeming thrilled you asked. <i>“I spent some time on Myrellion, and maybe left the planet with something I shouldn’t have.”</i> Bee presses her finger to her lips and gives you a wink. <i>“I’ve also further enhanced them, and myself, with some Mhen’ga specimens. I’m sure you’ve heard of Venus Pitchers. I plan on exploring the jungle more and researching more applications for my findings.”</i> She gives you a smile, and her jacket wiggles again.");
	output("\n\nBased on what she tells you, you have a pretty good idea what she’s got under that coat. If the way she is talking about it is any indication, you’re sure she would be very willing to show you.");
	
	processTime(10);
	addButton(0,"Ask about her vines",extrameetBountifulBotanySex,undefined,"Ask about her vines","Get a closer look at her vines");
	addButton(14,"Bail",extrameetBailScene);
}

public function extrameetBountifulBotanySex():void
{
	clearOutput();
	clearMenu();
	//showName("Bountiful_Botany");
	showName("BOUNTIFUL\nBOTANY");
	author("Fr0sty");
	//find the vag he fucks
	var vnoun:String = ""; //used to track cunt or cunts noun
	var i:int = 0; //used in for loop
	var vag:int = rand(pc.vaginaTotal());
	
	if (pc.vaginaTotal() > 1) vnoun = "cunts";
	else vnoun = "cunt";
	
	output("Tempting fate, you ask your date if you would be able to take a look at the vines.");
	output("\n\nShe pauses and gives you a serious look thinking it over. <i>“Do you know what you’re asking?”</i> Her expression cracks, turning into a suggestive smile. <i>“Things might get a little... Freaky.”</i>");
	output("\n\nYou tell your date you are willing to take that risk, offering a smile in return.");
	output("\n\n<i>“Suit yourself.”</i> Bee stands up, and you see a fair amount of noticeable wiggling under her jacket. <i>“Follow me. If you’re brave.”</i> She starts to head for the exit, looking over her shoulder at you as she walks away. You naturally follow.");
	output("\n\nThe two of you exit the bar together and travel a short way down the road to an apartment building. Bee leads the way into the building and up a single flight of stairs. <i>“Pardon the mess. I haven’t had much time to clean.”</i> The two of you reach her door and she keys it open, standing to the side and motioning for you to enter. <i>“Seriously, sorry about the mess.”</i>");
	output("\n\nStepping into the apartment you understand her concern. The place looks like a bomb went off, with empty food containers littered everywhere, and clothing thrown over everything. You hear the door close behind you and feel the plant woman standing very close. Her hands move in, gently touching your [pc.hips], her fingers feeling the shape of you. She leans in, her warm breath on the nape of your neck, sending a tingle down your spine. Bee whispers to you, her voice thick with lusty interest. <i>“Show me yours and I’ll show you mine.”</i>");
	output("\n\nYou step out of Bee’s grasp and turn to the woman, noticing her jacket is wiggling more than before. Giving her a smile, you strip away your [pc.gear], baring yourself fully naked and exposed before your green date. She bites her lip at the sight of you, the hidden vines under her coat almost ready to burst out. Your smile widens. <i>“Your turn.”</i>");
	output("\n\nBee reaches to the front of her jacket, her fingers shaking slightly. She unbuttons her coat, turning away from you as she works down the row of them. With her back to you, she opens her coat wide, pulling it off her shoulders and letting it fall to the ground. You let out a loud cry as a dozen green flashes shoot towards you.");
	output("\n\nHer vines lunge at you, attacking your limbs and wrapping around your arms and legs. Two vines wrap around your torso, pinning your arms to your sides while two others head straight to your [pc.thighs], squeezing them just as tight. The vines are smooth against you, feeling silky against your [pc.skinFurScales], but their roughness as they bind your body takes you by complete surprise. The other ten or so vines also wrap around you, targeting your ankles, wrists and stomach. Together, they lift you right off the ground, the strength of the green appendages pulling you up and suspending you in the air.");
	output("\n\nBee is still facing away from you, her back bare and exposed. All of the vines seem to be stemming directly from her spine, and you can’t be sure just how much control over them she has. Slowly, she turns to face you, her face flushed. <i>“Oh please.”</i> She takes a step forward. <i>“Forgive me.”</i> Before you can ask what for, a vine moves directly into your line of sight, offering a direct look at it. You feel yourself blush, staring directly at the shape of a cockhead on the green tentacle. Just as fast as the others, the vine snaps out, burying itself into your agape mouth.");
	output("\n\nThe shock of it sends your body into a fit, but the strong bindings against you hold you in place in the air. The tentacle in your mouth slides in deep, throat fucking you so you almost choke. The vines holding you aloft seem to tighten against you, gripping your body so tight it hurts. You notice Bee gasp out in pleasure as her vinecock chokes you, the woman almost looking like she’s about to fall over. You hear her mutter under her breath. <i>“More.”</i>");
	output("\n\nThe vines around your thighs pull your legs apart roughly, exposing your womanhood to the green woman. You attempt to squirm again, trying to fight against the strong green tentacles, but find it futile. You don’t even see the vine that takes you, but you feel a powerful attack hit your [pc.vagina " + vag + "] as a tentacle pushes into you. You try to cry out, but the tentacle buried in your throat makes that impossible. All you can do is struggle as the thick green appendage plunges deep into your wet cunt.");
	
	//added text if 2+ cunts
	if (pc.vaginaTotal() > 1) output(" A moment later a vine buries itself into your other cunt");
	if (pc.vaginaTotal() > 2) output("s");
	if (pc.vaginaTotal() > 1) output(" as well.");
	
	for(i = 0; i < pc.vaginaTotal(); i++)
	{
		pc.cuntChange(i, chars["BOUNTIFULBOTANY"].cockVolume(0), true, true, false);
	}
	
	output("\n\nYou feel yourself quiver, and if you could moan you would. Despite the roughness of it and your helplessness, you’re loving every second of this. You feel your toes curl as Bee’s tentacles wiggle inside of you, filling you up and making your " + vnoun + " burn with pleasure. The vines that bind you flex against you, their strength a constant reminder of how helpless you are while Bee has her way with you.");
	output("\n\n<i>“More.”</i> You hear her say as you feel another unseen tentacle prod at your [pc.ass]. Your eyes open wide as the strong vine presses against you, threatening to push in and penetrate your backdoor. <i>“More.”</i> You hear Bee say through heavy labored breaths. You feel the tentacle push in and penetrate you, wiggling its way into your ass. You jerk and writhe as it buries into you, struggling as much as you can against the strong bindings. Despite your fighting, the sensation of the vine sliding deep into your tight backdoor makes your knees shake with pleasure, and you feel almost like cumming right then and there.");
	
	pc.buttChange(chars["BOUNTIFULBOTANY"].cockVolume(0), true, true, false);
	
	output("\n\nThe attacking vines move around inside you, invading your body for their own pleasure. The tightness of the others against your body as they squeeze becomes too much, and you stop struggling from exhaustion at the futile effort. You feel wetness ooze down your thigh and drip to the ground, your " + vnoun + " alive and burning with pleasure. You feel your eyes roll back as you give yourself up completely to the pleasure of the tentacles. Bee shudders and moans, and you feel the tentacles inside you and binding your body pulse and twitch. Warmth fills you, as the vines inside you climax first, shooting some sort of cum like substance deep into all of your holes. The vines holding you aloft cum shortly after, each of their cockhead tips exploding white hot cum all over your body.");
	output("\n\nBee staggers and you feel yourself start to fall. The tentacles guide you downward, slowing the descent, but you still hit the ground with a bit of force. You feel all the penetrating vines slide out of you, allowing you to properly breathe for the first time in many minutes. You lay there, gasping for air and covered in a massive volume of white hot jizz as the tentacles release you. After a few minutes you pull yourself up to your elbows, casting a look over at Bee. The green woman is slumped against the wall, staring over at you. Her vines are moving around her body, seemingly wrapping themselves around herself as they did with you. You notice two vines between her legs, teasing against her own hole. <i>“You might want to get out of here.”</i> She speaks in a husky tone.");
	output("\n\nYou pull yourself to your feet and gather up your gear, watching as Bee’s tentacles tighten around her. You move towards the door and shoot your green date a concerned look.");
	output("\n\n<i>“Don’t worry about me.”</i> She offers you a smile. <i>“It was fun, but the boys always want more.”</i> She reaches out and strokes one of her vines. <i>“I’d hurry up, before they want round two to be you.”</i>");
	output("\n\nAs the vines tighten around Bee, you leave the apartment, closing the door behind you. Through the wall you hear the green woman gasp and moan in pleasure as the unseen vines take her.");
	
	processTime(30 + rand(15));
	pc.loadInAss(chars["BOUNTIFULBOTANY"]);
	pc.loadInMouth(chars["BOUNTIFULBOTANY"]);
	for(i = 0; i < pc.vaginaTotal(); i++)
	{
		pc.loadInCunt(chars["BOUNTIFULBOTANY"], i);
	}
	pc.applyCumSoaked();
	pc.orgasm();
	
	IncrementFlag("EXTRAMEET_SEX");
	IncrementFlag("EXTRAMEET_ORAL_GIVE");
	IncrementFlag("EXTRAMEET_CUNT_RCVD");
	IncrementFlag("EXTRAMEET_ASS_RCVD");
	addButton(0,"Next",mainGameMenu);
}

//SneakySnek
//[EXTRAMEET_SNEAKYSNEK]
public function extrameetSneakySnekProfile():void
{
	output("The profile picture on your screen is a full body picture of what looks like a male Naleen. Based on his profile, you deduce he may just partake in more than his fair share of splices.");
	output("\n\nUsername: SneakySnek");
	output("\nSex: Male");
	output("\nAge: 28 Years");
	output("\nRace: Human+");
	output("\nPlanet: Mhen’ga");
	output("\n\nBio:");
	output("\nAdventurous morph looking for a good time. Hoping to find an open minded woman who isn’t afraid of a little double trouble. Must like cats and snakes.");
}
public function extrameetSneakySnekCheckMatch():Boolean
{
	//has vagina
	if (pc.hasVagina()) return true;
	else return false;
}

public function extrameetSneakySnekDate():void
{
	//showName("SneakySnek");
	showName("\nSNEAKY SNAKE");
	author("Fr0sty");
	moveTo("BURT'S MAIN HALL");
	output("You enter Burt’s Meadhall and scan the room, not spotting your date right away. In the quiet back of the bar you spot a curious figure wearing a hood and a long jacket, seemingly standing next to a table. If you had to guess, that’s your man there. You make your way towards the back, the hooded figure seeming to notice you as you approach, when you reach the table the figure reaches up and lowers their hood, revealing a Naleen face.");
	output("\n\n<i>“Hey, impressive you could pick me out.”</i> He gives you a smile. <i>“Had to travel incognito, locals get a bit jumpy around Naleen. Please sit.”</i> He motions to a chair next to him.");
	output("\n\nYou take a seat and while doing so notice your date isn’t exactly standing, but rather has his long tail coiled underneath him. Trying not to stare, you shift gears and introduce yourself.");
	output("\n\n<i>“Pleased to meet you, [pc.name]. I’m Alan.”</i> The morphed man looks around the room, then pulls his hood back on. <i>“Sorry, gonna keep this on. I’d rather not draw any undue attention.”</i>");
	output("\n\n<i>“Alan, huh? So you really are human.”</i>");
	output("\n\nYour date chuckles. <i>“‘Was’ might be a better term for it. My DNA might tell a different story, but I gave up on being human awhile ago.”</i>");
	output("\n\nBased on what you’ve seen you know he is being honest. Making small talk, you ask him what made him decide to morph.");
	output("\n\nAlan leans in against the table, planting down his elbow and holding his chin. <i>“Tough question.”</i> He thinks to himself a moment, tapping a finger against his mostly concealed face. <i>“When I first saw a Naleen I guess I sort of fell in love. Not with that particular Naleen mind you, just with the idea of them. It spoke to me. Honestly I’ve never been happier. Only problem is natural Naleen put a little scare into the locals and make this awkward.”</i>");
	output("\n\nHis explanation makes sense, and you feel satisfied with his answer. The two of you end up chatting back and forth, with no real subject or direction. The conversation is refreshing and good natured, with both of you laughing and enjoying yourselves. After awhile Alan pulls back his hood again, revealing his cat like face.");
	output("\n\n<i>“Hood itches my fur after awhile.”</i> He rubs his forehead with his index finger. <i>“Hey, this might be a bit forward, but would you be interested in coming back to my place?”</i> He drops his hand and smiles. <i>“I mean, I did mention in my profile I was looking for an open minded woman. I’d hoped the implication extended to... other things.”</i>");
	output("\n\n<i>“Ah.”</i> You consider the offer for a moment in silence, giving Alan another look up and down. Being a full Naleen morph, you suspect he’s packing the full Naleen experience, and is likely going to want to use it to its fullest.");
	
	processTime(15);
	addButton(0,"Accept",extrameetSneakySnekSex,undefined,"Accept","Head back to his place");
	addButton(14,"Bail",extrameetBailScene);
}
public function extrameetSneakySnekSex():void
{
	clearOutput();
	clearMenu();
	//showName("SneakySnek");
	showName("\nSNEAKY SNAKE");
	author("Fr0sty");
	//find the vag he fucks
	var vag:int = pc.cuntThatFits(chars["SNEAKYSNEK"].cockVolume(0));
	if (vag < 0) vag = rand(pc.vaginaTotal());
	
	output("You tell your morphed friend you are open to new things, and would be interested in exploring a few with him.");
	output("\n\nHis face lights up, smiling wide and revealing a row of sharp teeth. <i>“Awesome. Want to come back to my place? It’s pretty close.”</i> He reaches up and pulls his hood back up, hiding his face once more.");
	output("\n\nYou follow the Naleen morph out of the bar, walking relatively far behind him due to his long tail slithering back and forth. More than a few concerned stares are thrown his way, likely people thinking a Naleen had snuck in from the jungle. You pick up the pace and walk beside him, standing close so onlookers know you two are together.");
	output("\n\nTrue to his word, his apartment is close and more or less just around the corner. You notice it’s ground level, and have a curious thought as to whether or not your date can even do stairs with his naga body. You push the thought out of your mind as he opens his door and invites you in.");
	output("\n\nHis apartment is not what you expected... Or in some ways maybe what you should have expected. The walls are littered with scenic nature pictures, all of thick jungles and rich foliage. Potted plants are spread everywhere, with dozens of them hanging from the ceiling. You also notice that it’s warm, maybe even warmer than outside... All in all, the whole apartment feels like it’s in the middle of the jungle.");
	output("\n\n<i>“Sorry about the decor.”</i> Alan slithers up next to you, pulling off his jacket. <i>“It’s... Well it’s part of the lifestyle.”</i>");
	output("\n\nYou turn to face him and see that without his jacket he is buck naked. He appears to be in fairly good shape, although you’re not sure you’re the best judge of what’s considered fit for a Naleen. He moves closer to you, his long tail swishing around on the floor, surrounding you. <i>“I’m really happy you wanted to come.”</i> He leans in, drawing his furry face closer to you before closing the distance and kissing you.");
	output("\n\nHis kiss is passionate, and he presses his furry chest tight against you as his arms wrap around your waist. Feeling a bit hot under the collar, you return the kiss, pressing yourself tight against the naga man. His furry body tickles against your [pc.skinFurScales], but a rising warmth in your core makes you ignore it. Your hands start to wander, trailing down from his furry upper body towards his scaly lower half. Your hands drawing closer causes an involuntary effect on your date, as you feel something start to shift and poke against you. Two somethings.");
	output("\n\nYou grab ahold of your date’s twin dicks, one in each hand. While neither are overly large, each appears to be well sized as they continue to grow in your hands. You can’t help but blush, thinking about what your morphed friend plans on doing with them both. You don’t have to wait long it seems, as he starts to guide you backwards into his bedroom, the two of your awkwardly making your way over in a passionate mass of hands and lips.");
	output("\n\nA short stumble later you bump into the bed with the back of your knees. Alan releases you, pulling his face off your lip. <i>“Here let me help you...”</i> The morphed man starts to pull off your gear, dropping it to the ground near your feet. As his hands move around your body you feel your [pc.skinFurScales] tingle with excitement. Once you’re fully naked and exposed Alan moves away from you, taking you in. <i>“Wow... You’re breathtaking.”</i> You notice his twin cocks twitch, seemingly agreeing with him.");
	output("\n\nYou feel your womanhood grow warmer, the thought of Naleen cock starting to get to you. You take a seat on the bed and lean back, presenting yourself to your dual dick date. Alan licks his lips at the sight of your [pc.vagina " + vag + "], the Naleen morph moving in close once more. You draw him in with a finger motion, leaning back more until you’re flat on your back. Alan moves in between your legs, the tip of one of his reptilian cocks poking against your eager womanhood. He prods against you a moment, teasing you with his hard cockhead. <i>“Are you ready?”</i>");
	output("\n\nYou give your date a nod, and brace yourself.");
	output("\n\nAlan slides himself in slowly, pushing his way into your wet twat. You gasp softly as you take him in, appreciating him going slow as he enters you. He feels oddly cold inside you, the chill feeling making you quiver in pleasure. After a moment he stops moving, hilting himself completely inside of you. <i>“Oh god you feel so warm...”</i> His voice is shaky, and you feel his whole body quiver. You feel him pull back, sliding his length back out of your eager hole.");
	
	pc.cuntChange(vag, chars["SNEAKYSNEK"].cockVolume(0), true, true, false);
	
	output("\n\n<i>“I’m going to put the other one in.”</i> You feel his second cock poke at you, but aimed lower than it’s twin. It presses against your asshole firmly, sending chills up your spine. Unlike your cunt which took in its cock eagerly, your backdoor takes some prodding before it starts to loosen up. Alan is patient, massaging your pucker with his cockhead, slowly moving it inward as your muscles relax. A minute later you feel it pop in, causing you to gasp as a few inches of snake cock suddenly invade your ass. At the same time, Alan’s forward motion causes his cock still partially buried in your cunt to slide forward again once more, and the sensation of both his dicks fucking you at once hits.");
	
	pc.buttChange(chars["SNEAKYSNEK"].cockVolume(0), true, true, false);
	
	output("\n\nYou cry out in a mix of pain and pleasure, the twin cocks of your Naleen lover buried deep inside you. He doesn’t wait long before he starts to move his hips, pumping them back and forth and putting his dicks to work. Your cunt tingles with pleasure as it takes its pounding, and your ass takes to it almost as well. Every time he thrusts in you feel stuffed by the twin cocks, feeling them throb inside your tight holes. Alan holds on tight to your [pc.hips] as he jackhammers away, and you hear his huffing and puffing a great deal over your shoulder. As your pleasure rises you clench down with all your muscles, squeezing tight the reptilian cocks inside you. You lover howls in pleasure, and spurred on by your increased tightness, thrusts with renewed vigor and fucks you all the harder.");
	output("\n\nThe increased pace of your lover pulls a deep moan out of you. Both cocks throb inside you, sending sinful waves of pleasure rippling through your body. Panting like a dog in heat, you feel yourself on the verge of exploding from your double dicking. Alan’s breathing starts to quicken, telling you your date might be about to have an explosion of his own. Sure enough you feel deep inside both your holes his cocks start to pulse, just as your lover groans and pushes himself into you as far as he can. That final drive inside you causes you to nearly scream, your pleasure peaking and crashing down over you and making you quiver. Both cocks pop at the same time, and the double rush of jizz filling both of your holes making you moan. You feel him pump you full of his seed, both loads seeming to be quiet sizable. He must have been very backed up.");
	output("\n\nHe pulls both his cocks out of you rather quickly, slithering off and leaving you face down on the bed. You feel his hot sticky cum ooze from both of your exhausted holes, and drip down onto the floor. Alan returns a moment later and wipes you down with a warm cloth. He is awfully considerate, but then again he did just stretch you out something fierce. <i>“God, hope that I wasn’t too rough.”</i>");
	output("\n\nYou pull yourself to your feet and tell him it was perfect and you can’t help but swoon, still a little high off your stuffing. With your head still in the clouds you collect your gear and get dressed, feeling only a little worse for wear. Alan walks you to the door and gives you a sheepish smile before leaning in and giving you a quick kiss on the cheek. <i>“Thanks for a great evening [pc.name]. It meant a lot.”</i>");
	output("\n\nYou give him a quick peck back and tell him the pleasure was all yours before heading out, walking slightly bow legged as you make your way back to the bar.");
	
	processTime(30 + rand(15));
	pc.loadInAss(chars["SNEAKYSNEK"]);
	pc.loadInCunt(chars["SNEAKYSNEK"], vag);
	
	pc.orgasm();
	
	IncrementFlag("EXTRAMEET_SEX");
	IncrementFlag("EXTRAMEET_CUNT_RCVD");
	IncrementFlag("EXTRAMEET_ASS_RCVD");
	addButton(0,"Next",mainGameMenu);
}
//EnchantingFae
//[EXTRAMEET_ENCHANTINGFAE]
public function extrameetEnchantingFaeProfile():void
{
	output("The profile picture on your screen is a selfie of an incredibly cute Saeri. She is posing for the picture, biting her lip seductively and giving the camera a longing gaze. Wait a minute... Thats a guy?!");
	output("\n\nUsername: EnchantingFae");
	output("\nSex: Male");
	output("\nAge: 18 Years");
	output("\nRace: Saeri");
	output("\nPlanet: Mhen’ga");
	output("\n\nBio:");
	output("\nHello! New on planet and looking to meet some new friends! Hit me up if you wanna meet up for a chat! Or maybe something more ;)");
}
public function extrameetEnchantingFaeCheckMatch():Boolean
{
	//has cock
	if (pc.hasCock()) return true;
	else return false;
}

public function extrameetEnchantingFaeDate():void
{
	//showName("EnchantingFae");
	showName("ENCHANTING\nFAE");
	author("Fr0sty");
	moveTo("BURT'S MAIN HALL");
	output("You enter Burt’s Meadhall and take a good look around. You spot your date sitting off to the side of the room, but he isn’t alone with a male patron standing next to the table talking to him. Awkwardly you make your way over, you do have a date with him after all. As you cross the room the Saeri spots you and waves you over, his wings fluttering slightly. The other patron looks over at you and scowls, clearly not happy with your presence. Before you reach the table, the male patron walks away in a huff, muttering something under his breath. Smiling at you, your date pops up to his feet standing maybe only a shade above five feet.");
	output("\n\n<i>“Hiya!”</i> He moves forward and grasps your hand, his grip delicate and soft against you. He holds your hand but doesn’t shake it, though you notice his wings give a few excited fluttering flaps. <i>“I’m so happy you could make it. Sit!”</i> He releases you and takes his seat once more, crossing his legs and getting comfortable.");
	output("\n\nYou slowly take your seat and give your date a look over. Everything about your date screams female. His face and body are definitely feminine and even his clothing, which is just a simple sundress, further supports it. However things are rarely as they seem in the galaxy, so all you can do is roll with it. A giggle knocks you back to attention. You didn’t realize it, but you were silent and staring for a long time. You shift in your seat, feeling more than a little awkward.");
	output("\n\n<i>“Trying to figure out if I’m really a boy right?”</i> Your date gives you a mischievous smirk. <i>“Well, I am. Although I don’t think most can tell.”</i> He nods his head towards the male patron who he was talking to just before you arrived. <i>“He tried to pick me up. Thought I was a member of the fairer sex. Not that I corrected him mind you. You came in before I had the chance to tell him he was eye-fucking a boy.”</i> You glance over at the patron, noticing him glaring over at you still. After a moment you return your gaze to your date, noticing him staring at you intently with his alien Saeri eyes expectantly. It takes a second, but you realize you haven’t introduced yourself yet. Feeling foolish, you give your date your name and ask for his.");
	output("\n\n<i>“Oh, well.”</i> The Saeri leans back and frowns. <i>“My name is something manly as hell and awkward to pronounce. Just call me Fae. Rolls off the tongue much better.”</i> He leans back in, his frown turning into another mischievous smirk. <i>“You know, I’m starting to think we might want to take this someplace else. Based on the hole being burned into the back of your skull.”</i>");
	output("\n\nYou don’t even need to look back to know what Fae is talking about. You ask the Saeri what he has in mind.");
	output("\n\n<i>“Well. We can always go back to my place.”</i> He gives his wings another small flutter. <i>“If you’re interested in a little fun that is.”</i> Fae bite his lip and gives his brow a suggestive wiggle. Before you can think about it, Fae’s expression shifts. <i>“I... Should mention something though...”</i> He clears his throat and leans in, speaking in a hushed tone. <i>“I might have lied a bit on my profile...”</i>");
	output("\n\n<i>“What?”</i> You give your date another look over. <i>“About what?”</i>");
	output("\n\nFae takes a deep breath. <i>“I don’t normally bring it up on a first date... But um... Well, I just think you’re nice and all, and I’d rather be upfront if things get serious.... It’s my age.”</i> An alarm goes off in your head. You recall his profile saying he was eighteen, and if that was a lie you might be dealing with a minor here. You scoot back your chair and prepare to bolt, ready for the the bad news. <i>“I’m not really eighteen... I’m a hundred and eighteen.”</i>");
	output("\n\nYou blink. <i>“What?”</i>");
	output("\n\n<i>“Oh god.”</i> Fae rubs the bridge of his nose with both hands, his voice filled with alarm. <i>“I’m SO sorry. I don’t like lying about it, but.... It’s really hard to meet people when everybody just thinks you’re just a creepy old man dressed up like a little girl.”</i> He drops his hands and leans in. <i>“My race just ages differently, I swear. I’m totally not some creepy old dude. Please just give me a chance.”</i> His bright eyes go wide and his lips press tightly together, begging.");

	if(!CodexManager.entryUnlocked("Saeri")) 
	{
		output("\n\nYour codex beeps to inform you it’s identified the Saeri race.");
		CodexManager.unlockEntry("Saeri");
	}
	
	processTime(5);
	addButton(0,"Give chance",extrameetEnchantingFaeSex,undefined,"Give chance","Give him a chance and go someplace else");
	addButton(14,"Bail",extrameetBailScene);
}
public function extrameetEnchantingFaeSex():void
{
	clearOutput();
	clearMenu();
	//showName("EnchantingFae");
	showName("ENCHANTING\nFAE");
	author("Fr0sty");
	//find the cock to use 
	var kok:int = pc.smallestCockIndex();
	
	moveTo("NORTH ESBETH 2");
	output("You tell your oddly well aged date that you’re not too bothered by it, and you’ll give him a whirl.");
	output("\n\nFae’s face lights up and he squeals in excitement. <i>“Oh thank you, thank you! You’re amazing!”</i> He bounces in his seat, overflowing with joy. <i>“Let’s go for a walk! Fresh air and such ya know?”</i> He gives you a mischievous grin that tells you he’s out for a bit more than just a simple walk.");
	output("\n\nRegardless you agree, eliciting another squeal from Fae and a small flutter from his wings. He pops up to his feet and smiles widely. Moving around the table to you and grabbing you by the arm. He practically drags you up out of your chair before pulling you across the room. You can’t help but notice a few nasty glances cast your way by several jealous patrons. If they only knew. But then again maybe they wouldn’t mind.");
	output("\n\nThe two of you leave the Mead Hall and start on a slow walk. The reason for the slow pace is the small trappy man hanging off you, staggering your ability to walk properly. Not that you mind. There is something rather pleasing about having such a cute little thing hanging off of you. You could get used to this. You walk with him aimlessly for a few minutes, or at least aimlessly from your perspective. After a while you get the feeling you’re being led somewhere, just in a slow roundabout way. You decide to ask him about it.");
	output("\n\n<i>“Don’t worry.”</i> He rubs himself up again you a bit more closely. <i>“I just want a little privacy.”</i>");
	output("\n\nYou feel something poke against you slightly. Taking a quick look down, you note Fae’s sundress is slightly tented at the front. Fae notices you looking and gives you a wry smile. You hear the Saeri giggle and pull away from you, skipping off down an alley off to your right and disappearing around a corner. You get the distinct feeling you are supposed to follow, and with a small shrug you stalk after your cute little date. Something about the chase excites you, and you can’t help but feel a small amount of stiffness of your own.");
	output("\n\nTurning the corner you get quite the eyeful, rounding the bend just in time to see Fae stick his ass up in the air while bending over, reaching under his dress. He slips off a pair of very cute looking panties, pulling them down slowly then stepping out of them and balling them up. Fae turns around to face you, a mischievous smile on his impossibly cute face. <i>“Hope you don’t mind...”</i> He lifts up his dress, showing off his stiff blue cock. In an unsurprising turn of events, even his dick looks cute. <i>“I just wanted to be comfortable.”</i>");
	output("\n\nAfter a brief moment, Fae turns back around, showing off his round backside. He takes a few exaggerated steps forward, his well formed ass moving seductively with him. Fae walks right up to a dead end and bends over, pressing his hands against the wall and presenting himself. His cheeks seem to spread on their own, giving you a view of his tight hole. You feel yourself harden and mast, your [pc.cockShape " + kok + "] cock eager to claim the trappy boy’s ass. Your feet start to move on their own, stalking towards Fae, while your hands pull your rock hard member out and take aim.");
	output("\n\nOne you reach the small Saeri you press the tip of your [pc.cockHead " + kok + "] against his pucker, causing him to squirm. You feel his warm hole seem to pulse against your cockhead, and it almost feels like it’s attempting to suck you in. Fae wiggles his ass and makes a small whimpering sound, begging you to push in and take him. He sticks out his butt a bit more, pushing the very tip of your cock slightly into his very welcoming ass. You decide just to go for it and not draw this out, placing your hands on his hips and shoving yourself in properly.");
	
	pc.cockChange();
	
	output("\n\nFae gasps out loud as you drive your shaft into him, the Saeri’s cry filled with lustful hunger. While you would certainly describe his ass as tight, you find no resistance hilting yourself as you drive into the eager buttslut. Despite his size, he takes you in without any difficulty, and you feel the him clamp down on your shaft in a way that squeezes you without constricting your movement. From what you can tell, this is a very experienced and well practiced ass, perfected honed after many years and presumably many cocks. Wanting to take him for a proper spin, you get to work and start to give the trap a proper fucking.");
	output("\n\nAfter a few hard thrusts you’re not sure what’s getting to you more, Fae’s tightness or the incredible warmth of his ass. You can’t believe how perfectly balanced between tightness and looseness the Saeri’s ass is, as you have almost no issue pounding it but still feel a strong embrace every time you bury yourself in. Something tells you Fae is doing something in particular, clenching himself in perfect rhythm with your thrusts to make himself tight when it counts, but loose when needed. You never imagined somebody could manage something like this so expertly, but that must be the pay off from taking dick for over a century. Fae also makes interesting and exquisite noises as you fuck him, gasping and moaning like a slut, but still managing to sound cute while he does it. The Saeri is truly a master of his craft.");
	output("\n\nYour cock throbs in pleasure as you work in and out of the trap’s tight hole, and you feel sweat start to build on your [pc.skinFurScales]. Then you feel a burning warmth spread throughout your body, your muscles gearing into overdrive as your lust takes over and forces you to fuck the Saeri harder and faster. Instead of loosening up, Fae only seems to grow tighter, but his lusty moans grow louder as you pound him with everything you’ve got. You feel your cock burn, the heat spreading up your body along with waves of depraved pleasure. The air in your lungs doesn’t seem to be enough, and your breathing becomes harsh and loud as you try to keep up your now primal pace on the blue boy’s ass.");
	output("\n\nYou’re close. Close to cumming and close to passing out from exhaustion. Which will come first you can’t say with certainty. Without warning, Fae’s ass clamps down on your thick shaft tightly and the small trap lets out a deep shuddering moan. The smell of cum fills the air as the small man blows his load, his butt clenched so tight your cock feels like it might pop. The smell of sex in the air and the increased tightness are all it takes to coax out an orgasm of your own, and you feel a shiver run up your spine as your muscles tighten. Your red hot cock throbs and pulses inside of Fae, and you feel yourself fill his ass with a burning load of [pc.cumColor] seed. Your muscles seize up then go limp, causing you to lose your balance and fall backward. Your cock pops out of Fae’s behind, releasing all of your deep shot spunk in an oozing display.");
	output("\n\nFae straightens up and cracks his back, releasing a content sigh. <i>“Wow! That was great.”</i> He turns around to face you, fixing his still partially tented dress. A very noticeable cum stain is visible at the front. Fae seems to notice and groans. <i>“Fuck. My granddaughter is going to kill me.”</i> He licks his thumb and rubs at the stain. <i>“She’s gonna flip when she sees I jizzed on her dress.”</i>");
	output("\n\nYou feel your jaw drop slightly. Did he just say granddaughter? You pull yourself back up to your feet, remembering for the first time in many minutes just how old your trappy date really is. Fae groans and stops rubbing at the dress, then gives you a wide and cute smile. <i>“It was fun [pc.name] but I should scoot. Don’t be a stranger okay?”</i> The small butterfly man moves in and gives to a quick peck on the cheek before skipping past you and turning out of the alley.");
	output("\n\nYou stand there a moment, contemplating your actions. You just fucked somebody’s grandpa. Huh.");
	
	processTime(30 + rand(15));
	pc.orgasm();
	
	IncrementFlag("EXTRAMEET_SEX");
	IncrementFlag("EXTRAMEET_ASS_GIVE");
	addButton(0,"Next",mainGameMenu);
}
//mhen'ga flavor

//BigDawg
//[EXTRAMEET_BIGDAWG]
public function extrameetBigDawgProfile():void
{
	output("The profile picture on your screen is of a handsome looking ausar. His hair is jet black, and you can’t help but feel like he must have dyed it. He is giving the camera a serious expression, almost stern.");
	output("\n\nUsername: BigDawg");
	output("\nSex: Male");
	output("\nAge: 38 Years");
	output("\nRace: Ausar");
	output("\nPlanet: Mhen’ga");
	output("\n\nBio:");
	output("\nRecently divorced. Looking for a lady who knows how to treat a man right. Willing to settle for girly boys.");
}

//Nympho69
//[EXTRAMEET_NYMPHO69]
public function extrameetNympho69Profile():void
{
	output("The profile picture on your screen is of a semi erect cock being held and shown off. Even half hard it seems fairly large.");
	output("\n\nUsername: Nympho69");
	output("\nSex: Other");
	output("\nAge: 65 Years");
	output("\nRace: Dzaan");
	output("\nPlanet: Mhen’ga");
	output("\n\nBio:");
	output("\nAlpha looking to claim some betas. Looking to rent not to keep. Must like karaoke and know how to make a goddamn seabreeze.");
}

//ShowYours2Me
//[EXTRAMEET_SHOWYOURS2ME]
public function extrameetShowYours2MeProfile():void
{
	output("The profile picture on your screen is blank.");
	output("\n\nUsername: ShowYours2Me");
	output("\nSex: Male");
	output("\nAge: 45 Years");
	output("\nRace: Human");
	output("\nPlanet: Mhen’ga");
	output("\n\nBio:");
	output("\nShow me yur vagine plz.");
}

//AwkwardSoul
//[EXTRAMEET_AWKWARDSOUL]
public function extrameetAwkwardSoulProfile():void
{
	output("The profile picture on your screen is a black and white photo of a female Simii. The picture is heavily edited, and looks like it was done as part of a photography class or something.");
	output("\n\nUsername: AwkwardSoul");
	output("\nSex: Female");
	output("\nAge: 22 Years");
	output("\nRace: Simii");
	output("\nPlanet: Mhen’ga");
	output("\n\nBio:");
	output("\nWe live. We Survive. We die. Looking for somebody to help with the last two. I’ll read you my poems and bare my soul. Will you love me? Or cast me aside?");
}

//GlitterCunt
//[EXTRAMEET_GLITTERCUNT]
public function extrameetGlitterCuntProfile():void
{
	output("The profile picture on your screen is of an up close shot of an obnoxiously sparkling vagina. Is that real glitter?");
	output("\n\nUsername: GlitterCunt");
	output("\nSex: Female");
	output("\nAge: 18 Years");
	output("\nRace: Human");
	output("\nPlanet: Mhen’ga");
	output("\n\nBio:");
	output("\nDon’t worry boys. It’s edible. ;O");
}

//Hogwash
//[EXTRAMEET_HOGWASH]
public function extrameetHogwashProfile():void
{
	output("The profile picture on your screen is of a man morphed to look like a pig. He seems to be well dressed, and aside from looking like a pig, fairly clean cut.");
	output("\n\nUsername: Hogwash");
	output("\nSex: Male");
	output("\nAge: 32 Years");
	output("\nRace: Human+");
	output("\nPlanet: Mhen’ga");
	output("\n\nBio:");
	output("\nNovelist. Traveler. Lover of fine wine and great dining. Looking to meet locals and learn more about this grand planet and its secrets. And yes I bathe.");
}

//DirtyGurl14
//[EXTRAMEET_DIRTYGUR114]
public function extrameetDirtyGurl14Profile():void
{
	output("The profile picture on your screen is a selfie of a dull green naked Ovir. She looks fairly plain, despite her best efforts to show off.");
	output("\n\nUsername: DirtyGurl14");
	output("\nSex: Female");
	output("\nAge: 25 Years");
	output("\nRace: Ovir");
	output("\nPlanet: Mhen’ga");
	output("\n\nBio:");
	output("\nReal woman here. If you like what you see swipe right. If I like what I see, so will I. ;)");
}

//Looking4a3rd
//[EXTRAMEET_LOOKING4A3RD]
public function extrameetLooking4a3rdProfile():void
{
	output("The profile picture on your screen is of an ausar couple. They are holding each other close, while staring at the camera. He looks serious, while she looks playful.");
	output("\n\nUsername: Looking4a3rd");
	output("\nSex: Other");
	output("\nAge: 27 Years");
	output("\nRace: Ausar");
	output("\nPlanet: Mhen’ga");
	output("\n\nBio:");
	output("\nWe are a clean and safe couple looking to have a good time with an open minded lady. No pressure for sex on the first date.");
}

//DigBick
//[EXTRAMEET_DIGBICK]
public function extrameetDigBickProfile():void
{
	output("The profile picture on your screen is a giant penis. If you had to guess, it’s around two feet long, but that’s just a guess.");
	output("\n\nUsername: DigBick");
	output("\nSex: Male");
	output("\nAge: 20 Years");
	output("\nRace: Human");
	output("\nPlanet: Mhen’ga");
	output("\n\nBio:");
	output("\nWanna go for a ride?");
}

//Birdy
//[EXTRAMEET_BIRDY]
public function extrameetBirdyProfile():void
{
	output("The profile picture on your screen is a very professional shot of a small pink female Tove. She’s posing for the picture in lingerie, and if you didn’t know any better you’d say it was ripped right out of a porno mag.");
	output("\n\nUsername: Birdy");
	output("\nSex: Female");
	output("\nAge: 29 Years");
	output("\nRace: Tove");
	output("\nPlanet: Mhen’ga");
	output("\n\nBio:");
	output("\nSemi professional model. Looking for a break. Swipe right if you want to collaborate.");
}

//Tarkos

//WantSumJunk?
//[EXTRAMEET_WANTSUMJUNK]
public function extrameetWantSumJunkProfile():void
{
	output("The profile picture on your screen is of a very out of focus image of a young dark red Raskvel. You can’t tell much from the picture, but he seems to trying to show off an unremarkable piece of junk in the photo.");
	output("\n\nUsername: WantSumJunk?");
	output("\nSex: Male");
	output("\nAge: 20 Years");
	output("\nRace: Raskvel");
	output("\nPlanet: Tarkus");
	output("\n\nBio:");
	output("\nYou want junk? Well I’ve got junk! Come and see all the junk in my trunk!");
}
public function extrameetWantSumJunkCheckMatch():Boolean
{
	//no requirements so just return true		
	return true;
}

public function extrameetWantSumJunkDate():void
{
	showName("WANT\nSUM JUNK?");
	//showName("WantSumJunk?");
	author("Fr0sty");
	moveTo("302");
	output("You arrive at The Mess and spot your date stilling off to the side, fiddling with something in between his fingers. Walking towards him, you notice he is adorned with all sorts of knick-knacks stitched onto or otherwise fastened to his attire. Even his tail has a few weird looking items strapped to it. From what you can tell, it’s all garbage.");
	output("\n\nWhen you reach the table he looks up and you and smiles <i>“Ah! Sit sit. I’m almost done here.”</i> His eyes fall back down to his hands and the small object he is working on. You take a seat across from him and take a good look at the subject of his attention. From what you can tell, it’s just more junk. A minute later he sets it aside and smiles at you. <i>“Sorry about that. I’m Yondi.”</i>");
	output("\n\nYou introduce yourself to the young Raskvel and ask him what he was doing with that.");
	output("\n\n<i>“Oh, cleaning it up. I need to make it look pretty. Makes a better bauble if it’s pretty.”</i> He holds up the small item, which from what you can tell is part of some sort of ancient engine. <i>“See? It’s shines.”</i>");
	output("\n\nYou can’t deny that much at least. <i>“What are you planning on doing with it?”</i>");
	output("\n\nYondi shrugs. <i>“Dunno yet. I’ll figure it out. Anyways.”</i> He gives you a curiously hungry expression. <i>“I’ve got something you might be interested in.”</i> The small man leans back in his chair. <i>“If you’re feeling a little adventurous.”</i>");
	output("\n\nYou can’t help but smirk, wondering what your companion has in mind. He reaches under his chair and grabs something heavy, lifting it up with a grunt of effort and dropping down a metal lockbox. You stare at the box for a heartbeat, now very curious as to where this is going. Yondi opens the box and reveals the contents to you. Your curiosity turns to confusion.");
	output("\n\n<i>“The big ones are gonna cost you a thousand, but I can part with the small ones for five.”</i> The young Raskvel’s speech is quick and proud, fully in salesman mode. <i>“I’m sure a wise adventurer knows quality then they see it.”</i>");
	output("\n\nYou look up from the trunk. <i>“It’s full of bobbleheads...”</i> Indeed the junk in said trunk is packed full of bobbleheads, of many different shapes and sizes. Most of them are in relatively good condition, but a few of them look very old and dinged up.");
	output("\n\nYondi laughs. <i>“Yes! The ultimate treasure. Don’t tell me you can’t think of a million uses for one of these bad boys?”</i>");
	output("\n\nHonestly, you struggle to think of one. You can tell based on Yondi’s demeanor that this transaction is going to be the extent of your interactions.");
	output("\n\nThe young man stares at you expectantly. <i>“Take your time, please. But I should be getting back to the heap soon. So much more treasure to unearth and so little time, right?”</i>");
	
	if(!CodexManager.entryUnlocked("Raskvel")) 
	{
		output("\n\nYour codex beeps to inform you it’s identified the Raskvel race.");
		CodexManager.unlockEntry("Raskvel");
	}
	
	processTime(5);
	addButton(14,"Bail",extrameetBailScene);
}

//XxThrasherCatxX
//[EXTRAMEET_XXTHRASHERCATXX]
public function extrameetXxThrasherCatxXProfile():void
{
	output("The profile picture on your screen is a group photo of what looks like a heavy metal band. Centered in the picture, and the only one in focus, is a small purple haired Kaithrit woman covered in tattoos and piercings.");
	output("\n\nUsername: XxThrasherCatxX");
	output("\nSex: Female");
	output("\nAge: 20 Years");
	output("\nRace: Kaithrit");
	output("\nPlanet: Tarkus");
	output("\n\nBio:");
	output("\nOn planet for a few days. Looking to party. Hard.\nDrugs <i>\{heart emoji\}\n</i>Booze <i>\{2 heart emojies\}\n</i>Dick <i>\{3 heart emojies\}</i>");
	//output("\nOn planet for a few days. Looking to party. Hard. Drugs <3 Booze <33 Dick <333");
}
public function extrameetXxThrasherCatxXCheckMatch():Boolean
{
	//non taur with cock
	if (!pc.isTaur() && pc.hasCock()) return true;
	else return false;
}

public function extrameetXxThrasherCatxXDate():void
{
	//showName("XxThrasherCatxX");
	showName("THRASHER\nCAT");
	author("Fr0sty");
	moveTo("302");
	output("You arrive at The Mess and look around, not seeing your date. You decide to take a seat and wait. About 20 minutes later you notice the Kaithrit woman saunter into the bar. She is dressed in a tattered t-shirt, torn jeans, and knee high leather boots. She spots you and makes her way over to the table.");
	output("\n\n<i>“Hey yo. Sorry I’m late. Had to haggle a bit on some shit.”</i> The scruffy woman sits down across from you. Up close you note many different piercings in her ears, a stud through her eyebrow, and a set of snakebites in her lip. <i>“Cheap ass tried to short us. I’m Thrash by the way.”</i>");
	output("\n\nYou introduce yourself and stare at the pierced woman. <i>“Thrash?”</i>");
	output("\n\n<i>“Stage name. Real names are embarrassing as all fuck.”</i> She leans back in her chair, throwing a foot up on the table. <i>“I’m the lead singer for Skulldust. Heard of us?”</i> You shake your head no and Thrash clicks her tongue. <i>“Yeah, thought not. We’re still getting started. Have to come out here to assfuck nowhere to even get a show.”</i>");
	output("\n\nYou start to ask her about her band but she cuts you off.");
	output("\n\n<i>“Hold that thought.”</i> She pulls her foot off the table and hops out of her seat, heading over to the bar. She returns a few minutes later with two very large drinks, and sets one down in front of you. <i>“Alright. Continue my dude. Shit was too dry for me.”</i>");
	output("\n\nYou ask her once again about her band, while watching her take a large gulp of her drink.");
	output("\n\n<i>“Ah. Well we’re pretty shit right now, but we’re getting better.”</i> Thrash digs around in her pockets. <i>“Hey, so are we gonna party or what?”</i> The Kaithrit woman pulls out two vials and sets them on the table between you. <i>“Ever try red myr venom? Shit is starting to get huge.”</i>");
	output("\n\nYou lean in and examine the vials.");
	
	if (pc.hasPerk("Venom Slut")) output(" Your stomach turns at the sight of the beautiful red contents. A low burn in your crotch reminds you of how long it’s been since your last dose.");
	
	output(" You ask Thrash what she exactly has planned.");
	
	output("\n\n<i>“Simple, pour this shit into your drink, we shack up, then just ride the waves.”</i> She reaches for one of the vials and pops it open. <i>“So, are we gonna party, or do I have to find somebody else?”</i>");
	
	if(!CodexManager.entryUnlocked("Kaithrit")) 
	{
		output("\n\nYour codex beeps to inform you it’s identified the Kaithrit race.");
		CodexManager.unlockEntry("Kaithrit");
	}
	
	processTime(30);
	addButton(0,"Party time!",extrameetXxThrasherCatxXSex,undefined,"Party time!","Mix the red venom into your drink, pour it down your throat, and have some fun with her");
	addButton(14,"Bail",extrameetBailScene);
}
public function extrameetXxThrasherCatxXSex():void
{
	clearOutput();
	clearMenu();
	//showName("XxThrasherCatxX");
	showName("THRASHER\nCAT");
	author("Fr0sty");
	//find the cock to use 
	var kok:int = pc.smallestCockIndex();
	
	moveTo("SHIP INTERIOR");
	output("You take the other vial and open it up. <i>“We’re gonna party.”</i> You tip the vial over and pour its contents into your drink.");
	output("\n\nThrash gives you a wide smile and does the same. <i>“Bottoms up then.”</i> You both down your drinks, and a rush of warmth fills your throat and belly.");
	
	if (pc.hasPerk("Venom Slut")) output(" The heat in your pants turns into a raging fire as the red liquid runs down your throat. Something about this mix if different. More... Potent...");
	
	output(" <i>“Shit’s gonna kick in fast. Got a place nearby we can hole up?”</i>");
	
	imbibeVenomEffects(false, false);
	pc.imbibeAlcohol(16);
	
	output("\n\nYou nod, telling her about your ship. The two of you stand up and make your way there, your head already starting to spin as you begin to wobble. Thrash takes ahold of your shoulder and steadies you. A few minutes later you both are walking fast towards the hangar, the warmth in your stomach starting to turn into a fire. You feel it spreading throughout your body, reaching your face. Everything goes black.");
	output("\n\nYou come to on your back, staring up at the familiar sight of your ship’s ceiling, with no clue how you made it back. The fire inside you is burning still, sweat building up on your brow and your [pc.cockShape " + kok + "] cock blazing. No, not blazing you realize. You tilt your head up and look down, taking in the sight of Thrash going down on your thick meat with vigor. Her eyes are glazed over and her face flushed. A fire of her own is burning just as hot.");
	output("\n\nYou tremble, the drugs in your system making the kaithrit’s mouth on your cockflesh feel more potent that you could ever have believed.");
	
	if (pc.hasPerk("Venom Slut")) output(" This batch is different. Nothing like you’ve taken before. It has to be laced with something else.");
	
	output(" You throb in the small woman’s mouth, as her tongue rolls along your impressive burning shaft. Thrash pulls herself off of you, an audible pop filling the air as your cock exits her mouth. The lithe woman crawls up, and for the first time you notice she is naked. She is covered in tattoos, but you are unable to focus on them as she moves upward, positioning her cunt directly over your burning cock.");
	output("\n\nThe kaithrit lowers downward, impaling herself on your engorged pole. You groan, the heat of her soaking cunt burning against your already blazing cock. The small woman moans loudly as well, quivering on top of you, bracing her hands against your chest. You feel her sharp nails press against you, scratching at your [pc.skinFurScales]. She gasps for air, sweat falling off her face and dripping down onto your chest, feeling almost cool against your impossibly warm body. She doesn’t waste any more time, and starts to move her hips, sliding herself up and down along your sensitive manhood, her pussy gripping it tightly.");
	
	pc.cockChange();
	
	output("\n\n<i>“Oh fuck. Oh fuck.”</i> Thrash gasps for air, her voice nearing a shriek. Your cock pulses in her tight cunt, the heat of her making your cock feel like it’s on the verge of melting. You grab your lover’s hips, helping the small woman move up and down along you, selfishly trying to get her to move faster. She takes a deep gasping breath, falling over as her sweat covered forehead falls down against your shoulder. She stops moving on her own, but you compensate by bucking your hips upward, thrusting yourself deep into her quivering pussy.");
	output("\n\nShe screams, her breath hot against your neck. <i>“Fuck me. Fuck me. Yes. Yes. YES!”</i> You feel your manhood start to tense, your orgasm drawing near. <i>“Don’t stop. Please. Fuck me. Fuck my pussy. Harder. Harder!”</i> The woman’s cunt seems to clench around you, the pressure almost impossible to bear. You still olibge her, gathering your strength and thrusting with everything you can muster, your hips slam so hard against her you have to hold her down. <i>“YES! FUCK ME! YES!”</i> You feel yourself explode.");
	output("\n\nYour [pc.cockNounComplex " + kok + "] ignites, and your [pc.cockHead " + kok + "] becomes the only thing you feel as your orgasm rocks you. You groan in pleasure as your [pc.cumVisc] load erupts, filling Thrash’s cunt to the brim. You hear the small woman howl as your burning hot jizz fills her, and you feel it ooze out of her tight cunt and down along your length. She whimpers on top of you, nuzzling her face against your neck. Darkness fills your vision, and you black out.");
	output("\n\nYou come to with a start, bolting upright. Your head is throbbing, and the venom and booze seem to have worn off. Looking around, you see no sign of Thrash. Just you and a massive amount of [pc.cumColor] spunk all over your body. You stand up, soaking in your own seed and more than a fair amount of sweat, the fluids almost completely dry against you. You notice then a small written note on the bed. You pick it up and read it.");
	output("\n\n<i>That was wild. Not everyday a girl takes three loads in one night. Call me. \{heart emoji\}</i>");
	output("\n\nYou put down the letter, thinking about it in silence. Three times? What the fuck happened last night?");
	
	if (pc.hasPerk("Venom Slut")) output(" You feel yourself coming down off your high, the desire for another hit already nagging you. You might have to look into exactly where your date got her that batch of Venom.");
	
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	pc.applyCumSoaked();
	sweatyDebuff(1);
	processTime(360 + rand(120));
	
	IncrementFlag("EXTRAMEET_SEX");
	IncrementFlag("EXTRAMEET_CUNT_GIVE");
	IncrementFlag("EXTRAMEET_CUNT_GIVE");
	IncrementFlag("EXTRAMEET_CUNT_GIVE");
	addButton(0,"Next",mainGameMenu);
}

//Sweet_N’_Low
//[EXTRAMEET_SWEETNLOW]
public function extrameetSweetNLowProfile():void
{
	output("The profile picture on your screen is of a young Gabilani woman with thick black hair framing her face. She is posing for the picture, puckering her lips in a mock kiss and giving the camera a suggestive wink.");
	output("\n\nUsername: Sweet_N’_Low");
	output("\nSex: Female");
	output("\nAge: 19 Years");
	output("\nRace: Gabilani");
	output("\nPlanet: Tarkus");
	output("\n\nBio:");
	output("\nStuck on the surface for three weeks. Looking for my mister tall, dark and handsome to come and sweep me off my feet. Desired traits in that order. ;p");
}
public function extrameetSweetNLowCheckMatch():Boolean
{
	//over 6'4" and has cock in front
	if (pc.hasCock() && pc.tallness > 76) return true;
	else return false;
}

public function extrameetSweetNLowDate():void
{
	//showName("Sweet_N’_Low");
	showName("SWEET\nN’ LOW");
	author("Fr0sty");
	moveTo("302");
	output("You arrive at The Mess and see your Gabilani date perched on a very high chair. Based on her height you’re unsure how she climbed up, and you peg her as being short by Gabilani standards, around 3 feet flat. As you move closer you also note while she is less curvy by Galilani standards, she still boasts ample hips and a large bust. She notices you as you move in closer, her eyes running you up and down. Her green lips crack into a wide smile as you come to a stop next to her and introduce yourself.");
	output("\n\n<i>“Oh my... You’re taller than I thought.”</i> She speaks in a tone of amazement, marveling at you. <i>“Oh, please sit. I’m Etta, by the way.”</i> You take a seat across from the small woman, finding yourself having to look down at her even when sitting. <i>“So what brings such an impressive figure as yourself to a dump like this?”</i>");
	output("\n\nYou start telling Etta about why you came to Tarkus and end up talking more about yourself. As you talk, you notice the small woman’s attention start to waver as she stares at you, chin in hand. She smiles to herself, more about her own thoughts than anything you say. You decide to cut it short and ask her about herself.");
	output("\n\n<i>“Oh. I’m nothing special.”</i> She shifts in her seat, her black eyes never leaving you. <i>“I’m just on planet for my mandatory three weeks a year and trying to make the best of it.”</i> She smirks, her dark eyes gleaming. <i>“So, you’re like really strong, right? I mean, you’re just so... big.”</i>");
	output("\n\nYou get the sense she’s more interested in your height than anything else. You can’t help but wonder what would happen if you indulge the small green woman.");
	
	if(!CodexManager.entryUnlocked("Gabilani")) 
	{
		output("\n\nYour codex beeps to inform you it’s identified the Gabilani race.");
		CodexManager.unlockEntry("Gabilani");
	}
	
	processTime(10);
	addButton(0,"Strong",extrameetSweetNLowSex,undefined,"Tell her you’re very strong","Tell her you’re very strong and than you will get to show her how strong you are");
	addButton(14,"Bail",extrameetBailScene);
}
public function extrameetSweetNLowSex():void
{
	clearOutput();
	clearMenu();
	//showName("Sweet_N’_Low");
	showName("SWEET\nN’ LOW");
	author("Fr0sty");
	//find the cock to use 
	var kok:int = pc.smallestCockIndex();
	
	moveTo("SHIP INTERIOR");
	output("You decide to roll with it, telling the short woman that you are indeed very strong. Her eyes go wide, and her smile stretches from ear to ear. Going a step further, you flex your muscles, showing off a little more directly to her. You can’t help but notice her face turns a richer shade of green, and you can only assume she is blushing. Having done that, you invite Etta back to your ship, something the small woman accepts very eagerly.");
	output("\n\nYou lead her out of the bar, walking towards the hangar and to your ship. As the two of you walk, you notice the small woman is having a hard time keeping up with your long gait. She shuffles quickly, trying to match your pace the best she can. You slow down, taking mercy on her and allowing the gabilani woman to catch up. At your new pace, it takes longer to get to your ship than you would like, but the lascivious looks Etta gives you the whole way make the longer trip worth it. Once you do reach your ship, you escort Etta on board and show her to your room, eager from the walk to sample the small woman.");
	output("\n\nAs your door is closing, the small woman leaps at you, lunging towards you with a hunger in her eyes. She grabs ahold of your waist, hanging off of you while she starts to rip off your gear. The weight of the tiny woman against your lower half causes you to almost lose your balance, and you stagger to catch yourself. You grab Etta and lift her up, finding the weight of the tiny woman to be very managable. Lifting her to eye level, you feel her tiny feet kicking in futility. She whimpers, but is blushing a deep green once more. You can’t help but smirk; she likes being held up.");
	output("\n\nYou toss Etta onto the bed, the small woman giving out a small cry and bouncing when she hits it. With your hands free, you start to shed your gear, fully exposing yourself and your now rock hard [pc.cockShape " + kok + "] member. Etta scrambles to her feet, the small woman now standing on your bed. She scowls at you, her eyes honing in on your exposed cock. She grabs at her own clothes and starts to disrobe, quickly removing all of her attire. The now naked green woman leaps at you again, growling like an animal, using your bed to jump high at you. You catch the woman, and her weight is practically nothing in your strong arms.");
	output("\n\nEtta squirms in your grasp, her ample chest jiggling and her legs kicking. You can tell she isn’t trying too hard to escape, she’s just playing hard to get. Smiling, you lower the small woman downward, pressing her green gabilani cunt against your [pc.cockHead " + kok + "]. Her eyes widen in surprise, and she starts to wiggle her curvy hips against your flared head. She’s already wet and ready, and you feel her juices warming your cockhead. You press against Etta more forcefully, starting to push into the gabilani’s ready and waiting pussy. <i>“Oh, fuck yes!”</i> She cries out, her tongue falling from her mouth lewdly. She feels looser than you would have expected, but there is still a lot more cunt to explore.");
	
	pc.cockChange();
	
	output("\n\nYou lower the woman, dropping her downward, causing your cock to slide deeper into her wet cunt. The tiny woman lets out a loud lusty moan, her whole body shaking in your arms. You continue to drop her, all the way down until you feel yourself buried all the way to the end of her cunt, your cockhead pressing against her deep hidden womb. She gasps, clenching your arms tightly, her nails digging into you. On your cock you feel an odd tightness, her vagina starting to twist. You moan out at the unexpected development, feeling the gabilani cunt tighten on your [pc.cockShape " + kok + "] member, its unique properties causing it to twist and compress. The intense sensation on your sensitive cock flesh almost makes you drop the small woman, and suddenly she feels very heavy in your trembling arms.");
	output("\n\nMuscling through it you grip Etta tighter, making sure you have a strong hold on her. You start to lift and drop the tiny woman, using her like a cocksleeve while you jerk yourself off with her body. Her tight and twisted cunt squeezes your throbbing cock, and as you force her up and down you feel it pulse and burn with rising pleasure. Your breathing becomes ragged and harsh, both from the physical effort of using the woman, and your intense arousal. The tiny green woman howls in animalistic pleasure, her tight cunt quivering around your meaty pole. You increase the speed you’re pumping her at, hoping to try and finish off quickly before you exhaust yourself, your arms already starting to go numb. A few short moments later the small woman moans and convulses in your arms, drool on her lips as an orgasm rocks her.");
	
	output("\n\nNot long after, the burning in your crotch comes to a peak");
	
	if (pc.balls > 0) output(" and your feel your [pc.balls] start to churn");
	
	output(". With a loud groan your feel yourself explode inside the twisted cunt, hot sticky seed filling up the gabilani’s sex. You almost fall over but try your best not to drop the still shaking woman in your arms. Instead you take a few steps forward first and fall onto your bed, taking the green woman down with you in a near tumble. As you land you release Etta and at the same time her cunt untwists around you, releasing the pressure on your spent cock and causing much of your [pc.cumColor] cum to ooze from her twitching pussy. <i>“Wow.”</i> She says, breathing hard on the bed next to you. <i>“You really are strong.”</i>");
	
	output("\n\nThe small woman doesn’t linger long, gathering her things and getting dressed. She barely pays you any mind, and just hums a tune you don’t recognize to herself while she gets ready to leave. Once she’s dressed, you walk her to the ship’s exit and the tiny woman gives you a devilish smile. <i>“I’ll see you around [pc.name]. Make sure you don’t skip arm day any time soon, yeah?”</i> She shoots you a knowing wink and turns to leave, exiting the ship and leaving you alone.");
	
	processTime(30 + rand(15));
	pc.orgasm();
	
	IncrementFlag("EXTRAMEET_SEX");
	IncrementFlag("EXTRAMEET_CUNT_GIVE");
	addButton(0, "Next", mainGameMenu);
}

//MidnightXRose
//[EXTRAMEET_MIDNIGHTXROSE]
public function extrameetMidnightXRoseProfile():void
{
	output("The profile picture on your screen is of a young black haired human woman. She seems by all accounts to be perfectly normal. So normal in fact you wonder why she would even be on world.");
	output("\n\nUsername: MidnightXRose");
	output("\nSex: Female");
	output("\nAge: 22 Years");
	output("\nRace: Human");
	output("\nPlanet: Tarkus");
	output("\n\nBio:");
	output("\nGay as fuck. I’m here to do two things and two things only: Flirt and chew bubblegum. And I’m all out of bubblegum.");
}
public function extrameetMidnightXRoseCheckMatch():Boolean
{
	//non taur with vagina and positive femininity
	if (!pc.isTaur() && pc.hasVagina() && pc.isFeminine(true)) return true;
	else return false;
}

public function extrameetMidnightXRoseDate():void
{
	//showName("MidnightXRose");
	showName("MIDNIGHT\nX ROSE");
	author("Fr0sty");
	moveTo("301");
	output("You arrive at The Mess and take a look around, not spotting your date. You decide to take a seat and wait, opting for a table with a good view of the doorway. Once seated, you scan around the room again, just making sure you didn’t miss your date seated somewhere. While you’re looking around a waitress comes up beside you. <i>“Hey there.”</i>");
	output("\n\nYou turn to face the waitress and a wave of confusion hits you: It’s your date. She is wearing the Beth Carver uniform in full: black vest, thong, and fishnets. As far as you can tell, she is just a waitress here. She gives you a smirk and sits down beside you.");
	output("\n\n<i>“Like what you see?”</i> She chuckles and scoots her chair closer. <i>“Well it is a very flattering uniform, if not a bit sexed up.”</i>");
	output("\n\nYou can’t disagree with that. You give her a look up and down, noting she indeed looks very good in the uniform. <i>“So, you work here?”</i>");
	output("\n\nShe rolls her eyes. <i>“Nothing gets past you huh?”</i> She laughs and gives you a shrug. <i>“Guilty as charged. I’m Dana by the way.”</i>");
	output("\n\nYou introduce yourself to your date in turn, trying not to let your eyes wander back down to her uniform again. She is quite pretty, and as far as you can tell pure human through and through. You decide, perhaps against your better judgement, to ask her why she works in a place like this.");
	output("\n\nDana scoffs. <i>“That a knock against my profession?”</i> Before you can answer she chuckles and give you a pat on the shoulder. <i>“Eh, I get it. Who chooses to be a slutty waitress right? Well it isn’t exactly a choice for me.”</i>");
	output("\n\nBased on her employer, you think you get her meaning. <i>“Oh...”</i> You lean in and speak in a near whisper. <i>“You’re a slave?”</i>");
	output("\n\nDana snorts and waves her hand. <i>“What? No, silly. Well, not yet at least. I’ve got a contract and some debt sure, but as long as I don’t miss a payment I’m still more or less free.”</i> She looks around the room, motioning to some of the other girls. <i>“Most of us are in the same boat. As long as you don’t default you’re fine. But if you do... Well let’s say you start paying back what you owe on your back and not your feet.”</i>");
	output("\n\nShe phrases it in a very matter of factly way, you can tell she’s had this conversation before. <i>“So... Are you on duty right now?”</i> You give her another look up and down.");
	output("\n\n<i>“Just got off.”</i> She rubs the back of her neck and stretches. <i>“Worked out great with our date time, yeah? Anyways, we should get out of here. If the boss sees me she’ll think I’m trying to squeak in overtime.”</i>");
	output("\n\nYou look around the room, noticing a few sideways glances from other waitresses as they move around the room. You ask your date where she would want to take this. <i>“Well, my place first and foremost. I’m dressed like a whore, so changing is at the top of my to do list.”</i> She gives you a look and clicks her tongue. <i>“Maybe we could just stay in and enjoy each other’s company.”</i>");
	output("\n\nWell that sounds like a proposition if you’ve ever heard one.");
	
	processTime(10);
	addButton(0,"Go with her",extrameetMidnightXRoseSex,undefined,"Go with her","Go back to her place");
	addButton(14,"Bail",extrameetBailScene);
}
public function extrameetMidnightXRoseSex():void
{
	clearOutput();
	clearMenu();
	//showName("MidnightXRose");
	showName("MIDNIGHT\nX ROSE");
	author("Fr0sty");
	
	moveTo("212");
	output("You tell Dana you’d like that, and you’re ready to head out whenever she is.");
	output("\n\n<i>“Welp. I’m ready now.”</i> She pops up to her feet and stretches her back. <i>“Housing isn’t far from here. Carver likes to keep her girls close.”</i> She motions for you to follow and starts to saunter out of the bar, a few of her still on duty coworkers glancing over as she moves to exit. Not wanting to get left behind you stand up and hurry after her, catching up rather quickly.");
	output("\n\nShe really wasn’t kidding when she said her place was close. The walk was so close it might have well been part of the same property. She leads you in through a relatively unimpressive entry way and down a long corridor, doors littered on either side of the hall. It gives off an oddly residential vibe, and you get the feeling not many of the inhabitants like staying here. Dana comes to a halt near the end of the hall and keys open her door before walking in and leaving it open behind herself. You follow her in and take a look around.");
	output("\n\nTwo single beds. Two dressers. Two desks. That’s it. <i>“Huh.”</i> The plainness of the room surprises you, it doesn’t even feel like anybody is occupying the room it’s so bare. <i>“It’s very... Spartan.”</i>");
	output("\n\nDana scoffs and moves toward the right side of the room. <i>“That’s a poetic way to put it. I prefer ‘ghetto’ myself.”</i> She takes a seat on the edge of her bed and yanks off one of her shoes. <i>“I tell ya [pc.name] I may not be a slave but I sure as shit feel like it some days.”</i> She tosses the shoe next to her dresser and starts to pull off the other one.");
	output("\n\nYou take another look around the room, focusing in on the second bed. <i>“You have a roommate?”</i>");
	output("\n\nDana tosses her second shoe aside and starts to unfasten her vest. <i>“Yeah, but we work opposite shifts. Only time I see her is when she’s sleeping.”</i> She shrugs off her vest, revealing a plain black bra. <i>“We’ve got about eight hours before she’ll turn up.”</i>");
	output("\n\nYou look Dana up and down, watching as she starts to roll off her fishnets. She catches your gaze and slows down, taking them off a bit slower for your benefit and giving you a lewd smirk. <i>“I just hope eight hours is enough time.”</i> She pulls off her stockings and balls them up before tossing them to the side. <i>“Alright Steele. I can’t be the only naked one, that’s just awkward.”</i>");
	output("\n\nYou look around and spot her desk and move towards it. You start to strip off your gear and set it down to get it out of the way. You take your eyes off Dana for a few moments, but you do hear her pulling off the last two articles of her own clothing: her bra and thong. When you turn back to her you’re buck naked, and so is she, unsurprisingly. Her breasts are small but very perky and well formed, each capped with a small dark nipple.");
	output("\n\n<i>“Staring at my tits, Steele?”</i> She smirks at you and wiggles her eyebrows. <i>“Not my best feature if you ask me.”</i> She rolls over on the bed, sticking her rear end into the air. <i>“See?”</i>");
	output("\n\nWhat her chest lacks in size, her butt seems to make up for in some measure. Very round and very well formed, her ass is certainly an impressive sight. Moving on your own, you walk forward to get a closer look. In the back of your mind you wonder if it’s firm or squishy, the urge to touch it to find out building to a boil inside the back of your head. Dana seems to read your mind and gives her rear a wiggle. If that isn’t an invitation you don’t know what is. So, taking her up on her offer, you reach out and give it a touch.");
	output("\n\nFirm. But also with notable give. You give her ass a thorough grope, making sure to judge it properly. She softly coos as you give her a good squeeze, testing her tushy out. Before you know it each of your hands is holding a cheek and your testing turns into massaging. Dana’s coos turn into light moans, the waitress clearly enjoying your touch. After a few short minutes she turns her head around to glance at you, a naughty look in her eye. <i>“My turn.”</i>");
	output("\n\nBefore you can react she flips over, pulling her butt from your grasp, and grabs your outstretched arms, pulling you down on top of her. Despite the surprise you manage to land on your elbows, avoiding headbutting Dana as you tumble onto the bed. Dana’s hands clasp on tight to your butt, slapping your [pc.ass] so hard when she makes contact you let out a cry of surprise. <i>“Hmm nice.”</i> You feel your ass get a nice firm grope, causing a shiver to run up your spine.");
	output("\n\nDana continues squeezing your [pc.ass] mercilessly, giggling in the back of her throat as you wiggle in a mix of discomfort and pleasure. Your body is pressed against hers, and you feel yourself start to grow warmer by the second, grazing against her skin. After a moment you realize the source of the warmth is in fact Dana herself. Playing with your ass seems to be more arousing for her than you expected, even the look on her face is getting lewder by the moment. She catches you staring at her and stops her groping.");
	output("\n\n<i>“What?”</i>");
	output("\n\nYou chuckle and lean in closer, your lips sinfully close to her. <i>“You’re enjoying this.”</i>");
	output("\n\nDana frowns for a second, but it quickly cracks into a lascivious grin. <i>“Oh, honey. This is just the start.”</i> She lifts her head up, pressing her soft lips tightly against your own.");
	output("\n\nHer hands tighten once more on your backside as your lips lock with hers. In the back of your throat you moan, the passion of the moment sweeping you up. You find yourself kissing her back, pressing your body tight against her while she grabs your [pc.ass]. Between your thighs you feel your [pc.vagina] start to tingle, your arousal starting to rise to considerable heights. In the back of your mind you know you can’t be the only one aching, so you reach down with one hand and give your date a check.");
	output("\n\nYou fingers feel the warmth of her twat before you even touch her, and once they do make contact Dana quivers underneath you. Probing a bit further, your slide your fingers inward, discovering a sticky wetness between your date’s folds. Dana’s hands squeeze your cheeks in approval, and she pulls her lips away from yours to gasp for air. With your lips free you crack a devious smile, giving Dana’s wet cunt a bit of a rub. You feel her squirm underneath you, her modest chest heaving into your [pc.chest]. Her hands clench you tighter and tighter, the pain spurring you on into returning the punishment. Your teasing rub becomes aggressive, working at her twat and focusing on her clitty.");
	output("\n\nYour date doesn’t leave you hanging for long. Keeping her left hand on your ass, she moves her right around and towards your front, slipping it in between the two of you.");
	
	if (pc.hasClit()) output(" A moment later you feel a rush of sharp pleasure as her fingers playfully touch [pc.oneClit].");
	
	output(" You stagger for a moment, Dana’s touch sending a shiver up your spine, but you quickly recover, giving her another kiss while your fingers tease her with new vigor. Dana leans into the kiss, roughly pushing herself against you and parting her lips for a more invasive lip lock.");
	output("\n\nOn your ass you feel Dana’s hand gliding around and to the side, and for a moment you think she might be aiming for your tight pucker. Instead she moves right past it, her fingertips reaching your now soaking wet cunt the long way round. She runs her fingers over your folds only a moment, before plunging two fingers into your eager pussy. You throw your head back, breaking the kiss once more as you shudder and gasp. Until her fingers slid into your cunt you had no idea how much you were aching for it. You take a few sharp breaths as she moves her fingers inside of you, still working at your pleasure button with her other hand.");
	output("\n\nNot wanting Dana to be left out you adjust your hand, slipping two fingers into your lover while keeping your thumb against her clit. You feel her writhe beneath you, pleased with your new attack. Together in tandem you finger fuck each other, the heat between your two bodies rising as sweat coats you both. Your cunt is a burning pyre of pleasure, radiating sinfully blissful heat through your whole body. Minutes pass, the pleasure rising and beginning to boil, on the brink of exploding. Dana shudders under you, boiling over first, and she releases a near screaming cry as her cunt and thighs clamp down on your hand. A few seconds later you feel yourself tense, a blast of powerful sensation shooting up your spine from your twat as an orgasm of your own takes you. All three hands go still and you collapse on your lover in a pile of sweat and stickiness.");
	output("\n\nA few minutes later you are on your feet and pulling your gear back on, Dana laying on the bed looking at you yawning. <i>“That was great. I really needed that.”</i> She bites her lip and gives you wink. <i>“We should do it again sometime, if you’re in the neighborhood.”</i>");
	output("\n\nYou finish collecting your things and tell her you’d like that, feeling a bit of residual tingling in your crotch. You say your goodbyes and watch Dana roll over, exhausted from your encounter. You show yourself out and exit the building, knees wobbling slightly from your very fun date.");
	
	processTime(30 + rand(15));
	pc.orgasm();
	
	IncrementFlag("EXTRAMEET_SEX");
	IncrementFlag("EXTRAMEET_FAP_GIVE");
	IncrementFlag("EXTRAMEET_FAP_RCVD");
	addButton(0,"Next",mainGameMenu);
}

//True_Power69
//[EXTRAMEET_TRUEPOWER69]
//[TRUEPOWER69_VIRGINITY_TAKEN] used to increment viginities taken count in codex
public function extrameetTruePower69Profile():void
{
	output("The profile picture on your screen is of a very large cock. Although you can’t get a good sense of scale, you can tell it’s at least a foot long. The only other information you can tell is whomever it is connected to seems quite muscular and large.");
	output("\n\nUsername: True_Power69");
	output("\nSex: Other");
	output("\nAge: 40 Years");
	output("\nRace: Dzaan");
	output("\nPlanet: Tarkus");
	output("\n\nBio:");
	output("\nTired of limp dicks and Betas. Only swipe right if you can beat this.");
}
public function extrameetTruePower69CheckMatch():Boolean
{
	//cock over 14 inches
	if (pc.hasCock() && pc.biggestCockLength() > 14) return true;
	else return false;
}

public function extrameetTruePower69Date():void
{
	//showName("True_Power69");
	showName("TRUE\nPOWER 69");
	author("Fr0sty");
	moveTo("302");
	output("You arrive at The Mess and spot a lone Dzaan sitting off in the back, and you can only assume she is your date. As you make your way over you size her up, having only seen a picture of her below the belt at this point. She is large and muscular, with a bright pink mohawk contrasted against dark orange skin. She seems to spot you as you make your way over and remains seated when you reach the table.");
	output("\n\nUp close you can tell she is quite seasoned, covered in old and long healed scars, although underneath you can tell she is quite beautiful. She gives you a stern look, her eyes unblinking and fixated on you. <i>“I’m Chell. Sit.”</i> Her tone is harsh and rough, and you can tell she isn’t asking.");
	output("\n\nYou take your seat and introduce yourself, as curtly as she did. She gives you a stoney expression, her eyes piercing into you. If you had to guess she’s trying to intimidate you, although why you can’t say. You return the strong gaze, not letting the large woman get the better of you.");
	output("\n\nAfter many moments she smirks. <i>“Alright. Let’s see it.”</i>");
	output("\n\nYour stony expression twists into a confused look. <i>“See what?”</i>");
	output("\n\nChell gives you a sharp snort. <i>“Your cock, idiot. Whip it out.”</i>");
	output("\n\nThe two of you sit in silence a moment, and you make no action to whip out and show off anything. The Dzaan’s expression becomes stern again, her eyes narrowing in on you. You break the silence, asking the large woman why exactly she wants to see it.");
	output("\n\nChell snorts and leans back in her chair, unzipping her pants as she does so. She reaches in and pulls out her flaccid member, which still looks impressive in her hand. Even soft, it’s very long and thick, and more than a few patrons look over and blush at the sight of it. <i>“I want to know if you can beat this.”</i> She gives her meat a few strong strokes, her mast slowly rising. <i>“I want to make sure you’re worth my time.”</i>");
	output("\n\nYou watch her cock start to grow in her hand, becoming rock hard in mere seconds. At its full length, you guess it to be just a bit over a foot long. You can’t help but smirk. You know you can beat that, but the real question is if you should. You’re not sure of Chell’s intentions, but if she’s so interested in your dick you know it’s at least getting stuck into something.");
	
	if(!CodexManager.entryUnlocked("Dzaan")) 
	{
		output("\n\nYour codex beeps to inform you it’s identified the Dzaan race.");
		CodexManager.unlockEntry("Dzaan");
	}
	
	processTime(5);
	addButton(0,"Whip it out",extrameetTruePower69Sex,undefined,"Whip it out","Whip out your cock and see where things go from there");
	addButton(14,"Bail",extrameetBailScene);
}
public function extrameetTruePower69Sex():void
{
	clearOutput();
	clearMenu();
	//showName("True_Power69");
	showName("TRUE\nPOWER 69");
	author("Fr0sty");
	//find the cock to use 
	var kok:int = pc.biggestCockIndex();
	
	currentLocation = shipLocation;
	output("You decide to play along and rise to your feet. You fiddle around with your crotch for a moment and produce your still flaccid [pc.cockShape " + kok + "] member. Chell’s eyes fall to your crotch, and she watches intently for a long moment while it starts to stiffen. It doesn’t take long to reach full mast, and you can’t help but smirk feeling like you matched the Dzaan’s speed at getting hard.");
	
	if (pc.cocks[kok].cLength() > 18) output("\n\nChell stares at your cock for a long moment, and you can’t help but notice she cracks a small smile. <i>“Very impressive. Come with me.”</i>");
	else output("\n\nChell nods her head slowly, then lifts her eyes back up to meet yours. <i>“This will do. Come with me.”</i>");
	
	output(" She doesn’t seem to be asking, and she starts heading for the door, her massive cock still out and bouncing up and down with each step. With your cock still in your hand you follow her, still not exactly clear on what she wants you to do with it.");
	output("\n\nShe leads you out of the bar and towards the hangar, walking at a brisk pace you find awkward to match. More than a few glances are tossed your way, obviously drawn to the site of the two of you walking with massive erections on full display.");
	
	if (pc.exhibitionism() > 80) output("You feel yourself start to breathing heavy, the lusty gazes of the crowd making your cock burn. What sort of sick things do they want to do with you? You want to find out.");
	else if (pc.exhibitionism() > 40) output(" You fight the urge to stop and show yourself off properly to the curious crowd, the thought of them ogling you driving you wild.");
	else if (pc.exhibitionism() > 20) output(" You feel the gazes on you and your meat and can’t hide a small depraved smile as your cock grows slightly harder.");
	else output(" Despite yourself, the looks excite you, and you feel your cock give a slight throb.");
	
	pc.exhibitionism(1);
	
	output(" The sound of Chell speaking draws your attention away from the onlookers. <i>“My ship is over here. Mind the step.”</i>");
	output("\n\nHer ship looks to be a cargo freighter of some sort, large and fat with little to no decoration. As you walk towards the ramp you see it is crooked on the ground, and you take care to step up onto it to avoid tripping. Once inside the ship you take a look around. It’s plain and bland, and has an odd smell. Taking a deeper wiff, you think it’s an odd mix of sweat and semen, but very old and not properly cleaned up. Chell moves towards the back of the ship, and you follow along behind her hoping the rest of the vessel is a bit more impressive.");
	output("\n\nShe takes you into her bedroom, and find more of the same. The cum smell is much stronger and fresher here, and you see a few articles of clothing littered around the floor you know could never possibly fit on your Dzaan date. Most of the pieces of clothing are panties, giving you a general idea the sort of company Chell has over. The large woman turns to you, stroking still a very erect cock. <i>“Are you ready?”</i> You stare down Chell for a moment, still unclear what she has planned. Before you can inquire as to her intentions, she tells you very clearly. <i>“Hope you’re man enough to handle my pussy.”</i>");
	output("\n\nOh. You didn’t expect that. Chell moves towards her bed and lies down on her back, spreading her legs wide. Under her massive balls you see the hint of her hidden womanhood, and from what you can see she seems already slick and wet. <i>“Well?”</i> You realize you were staring, caught off guard by her. <i>“Are you doing this or not? Or has your dick gone limp?”</i> She gives you a smile, a mix between cruel and seductive. <i>“Don’t tell me you’ve got all that meat and no idea how to use it.”</i>");
	output("\n\nSomething tells you Chell is a talkative lover. You sigh and move in closer, your cock still at attention and ready to go. You step in between Chell’s legs and prod the Dzaan’s cunt, feeling her wet cunt with your [pc.cockHead " + kok + "]. She sighs contently, one hand still clenching her cock. <i>“That’s it. Now be good and fuck me, you hear me?”</i> Her tone is condescending, but flirty as hell. Trying to not let her get to you, you push in slowly, entering the talkative woman.");
	
	pc.cockChange();

	output("\n\nTo describe Chell as tight would be the understatement of the year. What you thought was going to be a simple slide in quickly turns into having to somewhat ram yourself inside of her. You grunt with effort as you force yourself in, the Dzaan’s cunt seemingly fighting you ever inch of the way. Chell lets out a stifled moan as you enter her womanhood, and is clearly trying to contain a much more depraved outburst. For your own part you end up moaning yourself, the tightness of the woman on your cock feeling like heaven, in addition to its warmth. Without even moving your hips you already feel like you could cum, but you quickly collect yourself and steel your resolve. The sound of Chell’s voice only helps hold yourself in. <i>“Hurry up and fuck me!”</i>");
	output("\n\nYou roll your eyes and start pumping your hips slowly, doing it not because you’re told to, but because you want to. Thankfully, Chell’s cunt loosens up as you slowly work in and out of her, allowing you to pick up more speed and set into a rhythm. She is still wicked tight, but now that you’re able to move, you find her much more enjoyable to be buried in. You can’t help but let out a deep content sigh as your cock throbs with pleasure, approving in its own way. Chell gasps as well below you, but seems to be fighting it back. Clearly, she is trying to show poise and control, but is not holding it together as well as she’d like. Her hand slides up and down her impressive rod freely, jerking herself off as you fuck her. The depraved sight gives you some motivation, and you decide to turn it up a notch on the well hung woman.");
	output("\n\n<i>“OH FUCK!”</i> Chell yells it so loud you think she might have burst one of your ear drums. All you did was start pounding her with a bit more vigor, pushing your massive rod in as deep as it can go. You manage to bury it fairly deep into the Dzaan, but her cunt is still vice tight at its deepest point. <i>“FUCK!”</i> She yells it again, however this time you’re ready for it and are able to tune it out. She keeps repeating the cry aloud as you plow her, the Dzaan seemingly saying it in sync with your powerful thrusts. Her hand on her cock starts to pump up and down wildly now, stroking herself so fast you expect her to cum any second. You try to hold yourself together until that happens, not wanting to let yourself finish first.");
	output("\n\nThankfully, you don’t have to wait long and Chell’s streams of cursing turns into a heavy moan of pleasure. Both of her sexes seem to climax at the same time, as you feel her womanhood tremble and clench around you while her cock fires off a massive load of white spunk up into the air in front of you. It falls down all over the prone woman, coating her stomach and chest. The smell and the sight of the cum drenched woman is all it takes for you to lose control and explode. You throw back your head as a strong wave of pleasure strikes throughout your body, the epicenter being your cock buried deep into the Dzaan’s twat.");
	
	if (pc.balls > 0) output(" You feel your [pc.balls] churn as you fire off your load, filling up what little space is left in her tight cunt with the excess already oozing out around your thick throbbing meat.");
	else output(" You fire off your load, filling up what little space is left in her tight cunt with the excess already oozing out around your thick throbbing meat.");
	
	output("\n\nWith a small grunt you pull yourself free from the tight Dzaan, your cock still hard but fading. Beneath you on the bed Chell props herself up, shaking with her chest covered in her own spunk and her crotch covered in yours. She takes a deep breath and stills herself. <i>“That wasn’t half bad.”</i> She pulls herself up into a sitting position, cum running down her body.");
	
	if (flags["TRUEPOWER69_VIRGINITY_TAKEN"] != 1)
	{
		output(" <i>“I see what all the rage is about. Should have used my cunt sooner.”</i>");
		output("\n\nSomething clicks in your head and you put two and two together. <i>“What? You mean...”</i>");
		output("\n\nChell glares at you. <i>“I’m an alpha. I fuck betas and sluts, I don’t get fucked.”</i> She pulls herself to her feet, stretching out her back and yawning. <i>“But if you want to be technical, yes. Vaginally I was a virgin.”</i> She cracks her neck so loudly you think she might have broken something.");
		flags["TRUEPOWER69_VIRGINITY_TAKEN"] = 1;
	}
	else output("\n\n");
	
	output("<i>“Ah, that’s the good shit. Show yourself out. I need to shower then find something to stick my cock into.”</i> She pauses and gives you a curious look. <i>“If you’re still here in 10 minutes I’ll assume you’ve volunteered.”</i>");
	output("\n\nAs the Dzaan pads off, you stuff your still messy cock away and make your way to the exit, leaving the Dzaan’s offer on the table. If she was that bossy while getting fucked, you can only imagine what she was like on the other end.");
	
	processTime(30 + rand(15));
	pc.orgasm();

	IncrementFlag("EXTRAMEET_SEX");
	IncrementFlag("EXTRAMEET_CUNT_GIVE");
	addButton(0,"Next",mainGameMenu);
}
//tarkus flavor	

//R4-X0121
//[EXTRAMEET_R4X0121]
public function extrameetR4X0121Profile():void
{
	output("The profile picture on your screen is of a very dingy looking droid. Nothing like modern models, it almost looks like something ripped straight out of science fiction.");
	output("\n\nUsername: R4-X0121");
	output("\nSex: Other");
	output("\nAge: 345 Years");
	output("\nRace: Automaton");
	output("\nPlanet: Tarkus");
	output("\n\nBio:");
	output("\nExperienced service unit looking for new home. My functions include cleaning, cooking, and back rubs");
}

//Be-Bop-Boss
//[EXTRAMEET_BEBOPBOSS]
public function extrameetBeBopBossProfile():void
{
	output("The profile picture on your screen is a headshot of an older looking Gabilani. His hair is grey, and one of his eyes is replaced with a prosthetic. Looking down at his age, you are surprised he isn’t far older.");
	output("\n\nUsername: Be-Bop-Boss");
	output("\nSex: Male");
	output("\nAge: 49 Years");
	output("\nRace: Gabilani");
	output("\nPlanet: Tarkus");
	output("\n\nBio:");
	output("\nLooking for young gabilani ladies willing to spend time with a real man. Not looking for off worlders or dudes wearing dresses.");
}

//Sexplosive
//[EXTRAMEET_SEXPLOSIVE]
public function extrameetSexplosiveProfile():void
{
	output("The profile picture on your screen is a very poorly taken photo of a young raskvel woman. The picture is very out of focus, looking like it was taken on a broken camera. You can’t make out any other details.");
	output("\n\nUsername: Sexplosive");
	output("\nSex: Female");
	output("\nAge: 24 Years");
	output("\nRace: Raskvel");
	output("\nPlanet: Tarkus");
	output("\n\nBio:");
	output("\nI don’t know what to put here, just come fuck me.");
}

//Biggyz
//[EXTRAMEET_BIGGYZ]
public function extrameetBiggyzProfile():void
{
	output("The profile picture on your screen is of a cloud of smoke with a face. If you had to guess, the subject of the picture blew it out his mouth while taking the picture for some unknown reason. Trying to look cool maybe?");
	output("\n\nUsername: Biggyz");
	output("\nSex: Male");
	output("\nAge: 27 Years");
	output("\nRace: Human");
	output("\nPlanet: Tarkus");
	output("\n\nBio:");
	output("\nLooking for a lady to ride or die with me. Must be respectful.");
}

//PowerLovers2
//[EXTRAMEET_POWERLOVERS2]
public function extrameetPowerLovers2Profile():void
{
	output("The profile picture on your screen is of two gabilani, one male and one female. By the looks of them, they are an item, the male having his arm draped over the female.");
	output("\n\nUsername: PowerLovers2");
	output("\nSex: Other");
	output("\nAge: 32 Years");
	output("\nRace: Gabilani");
	output("\nPlanet: Tarkus");
	output("\n\nBio:");
	output("\nLooking for a third to spice things up. Not picky on gender. Hoping to find somebody exotic. No raskvel.");
}

//DirtyHabitz
//[EXTRAMEET_DIRTYHABITZ]
public function extrameetDirtyHabitzProfile():void
{
	output("The profile picture on your screen is blank.");
	output("\n\nUsername: DirtyHabitz");
	output("\nSex:Female");
	output("\nAge: 21 Years");
	output("\nRace: Human+");
	output("\nPlanet: Tarkus");
	output("\n\nBio:");
	output("\nNot on planet anymore. Will not respond.");
}

//Avarice56
//[EXTRAMEET_AVRICE56]
public function extrameetAvarice56Profile():void
{
	output("The profile picture on your screen is of a naked Gryvain woman with a massive cock in her mouth. She is fairly attractive, and it staring right at the camera while deepthroating the huge dong.");
	output("\n\nUsername: Avarice56");
	output("\nSex: Other");
	output("\nAge: 80 Years");
	output("\nRace: Gryvain");
	output("\nPlanet: Tarkus");
	output("\n\nBio:");
	output("\nOn planet for a few days, looking for somebody to show me a good time. Not necessarily single, so I hope that doesn’t bother you.");
}

//_Twisted_
//[EXTRAMEET_TWISTED]
public function extrameetTwistedProfile():void
{
	output("The profile picture on your screen is of a large blue eye. The picture was taken very close to the subjects face. At least it’s a pretty eye...");
	output("\n\nUsername: _Twisted_");
	output("\nSex: Female");
	output("\nAge: 30 Years");
	output("\nRace: Ausar");
	output("\nPlanet: Tarkus");
	output("\n\nBio:");
	output("\nLooking to meet intellectuals willing to expand their horizons. Not interested in hooking up. No I will not send you nudes.");
}

//SlaveBoi
//[EXTRAMEET_SLAVEBOI]
public function extrameetSlaveBoiProfile():void
{
	output("The profile picture on your screen is shot of a very thin and hairless body wearing just underwear. The subject’s head is completely cut out of the shot.");
	output("\n\nUsername: SlaveBoi");
	output("\nSex: Male");
	output("\nAge: 21 Years");
	output("\nRace: Human");
	output("\nPlanet: Tarkus");
	output("\n\nBio:");
	output("\nWilling to serve.");
}

//HawtShot
//[EXTRAMEET_HAWTSHOT]
public function extrameetHawtShotProfile():void
{
	output("The profile picture on your screen is of a massive dick. Seriously. It’s just a huge dick.");
	output("\n\nUsername: HawtShot");
	output("\nSex: Other");
	output("\nAge: 54 Years");
	output("\nRace: Gryvain");
	output("\nPlanet: Tarkus");
	output("\n\nBio:");
	output("\nI’m here to fuck and drink. And I’m not thirsty.");
}

//myrellion

//_Dogge_
//[EXTRAMEET_DOGGE]
public function extrameetDoggeProfile():void
{
	output("The profile picture on your screen is a selfie of an older looking ausar man. His black hair has small traces of grey, and his face is unshaven and scruffy. He is giving the camera a wry smile, and a longing gaze.");
	output("\n\nUsername: _Dogge_");
	output("\nSex: Male");
	output("\nAge: 40 Years");
	output("\nRace: Ausar");
	output("\nPlanet: Myrellion");
	output("\n\nBio:");
	output("\nLonely and looking for a good time. Bit of a boozehound. If you can hold your liquor and aren’t afraid of a little fun swipe right.");
}
public function extrameetDoggeCheckMatch():Boolean
{
	//no requirements
	return true;
}

public function extrameetDoggeDate():void
{
	//showName("_Dogge_");
	showName("\nDOGGE");
	author("Fr0sty");
	moveTo("606");
	output("You enter The Golden Peak and take a long look around. You... think you see your date? An ausar of the right age and build is certainly present, but he’s face down on a table in the corner. You approach slowly, not sure if your date is deep in thought, taking a nap, or drunk off his tits.");
	output("\n\nWhen you do reach the table, you note the ausar man is breathing. Well at least he isn’t dead. You also note a scary amount of empty alcohol containers. Drunk off his tits it is then. You give the man a nudge, making sure he’s alright.");
	output("\n\nHe jerks upright in his seat, almost smacking you with flailing arms. <i>“Who’s there?”</i> He looks around, his eyes bloodshot and face beet red. <i>“Oh it’s you... I’ve just gotten started.”</i> He winks one eye then the other, and you’re pretty sure he was just trying to blink. <i>“Take a seat, I’ll get you one-”</i> The ausar wobbles in his seat and falls face down on the table again. He doesn’t seem hurt, but also doesn’t appear conscious.");
	output("\n\nYou sigh and rub the back of your neck. This is pretty much a wash already. Only question is whether or not you should help or not. You decide, at the very least, to tell somebody about this. You make your way over to the bar and tell the bartender about the drunken and passed out ausar.");
	output("\n\nThe bartender frowns at you. <i>“Yeah, that’s Deek. Something of an irregular regular. Don’t worry I’ll make sure he gets home okay.”</i>");
	output("\n\nYou turn back to regard Deek, noticing his tail wagging in his sleep. Well, at least he seems like he’s having a good dream, maybe he won’t mind being stood up. You turn and leave, exiting from the bar.");

	if(!CodexManager.entryUnlocked("Ausar")) 
	{
		output("\n\nYour codex beeps to inform you it’s identified the Ausar race.");
		CodexManager.unlockEntry("Ausar");
	}
	
	processTime(5);
	addButton(0,"Next",mainGameMenu);
}

//DaRegulator
//[EXTRAMEET_DAREGULATOR]
public function extrameetDaRegulatorProfile():void
{
	output("The profile picture on your screen is of a dark skinned man wearing a U.G.C. Peacekeeper uniform. He looks quite handsome, and from what you can see he seems to be pure Human.");
	output("\n\nUsername: DaRegulator");
	output("\nSex: Male");
	output("\nAge: 25 Years");
	output("\nRace: Human");
	output("\nPlanet: Myrellion");
	output("\n\nBio:");
	output("\nCurrently stationed on Myrellion and looking to meet interesting people. Hoping to find a cool guy to shoot the shit with and have a beer. If you’re looking for a game, I’m always down to play catch. Bonus points if you can make me laugh. Don’t bring up politics, or I’m out.");
}
public function extrameetDaRegulatorCheckMatch():Boolean
{
	//non-taur with cock, man
	if (!pc.isTaur() && pc.isMan()) return true;
	else return false;
}

public function extrameetDaRegulatorDate():void
{
	//showName("DaRegulator");
	showName("DA\nREGULATOR");
	author("Fr0sty");
	moveTo("609");
	output("You enter The Golden Peak and immediately see your date. He is in uniform and sitting on his own, drinking what looks like a glass of water. He is shorter than you expected, maybe no taller than 5’8, but seems to be in fairly good shape. He spots you and flags you over to the table. You make your way over and have a seat, introducing yourself.");
	output("\n\n<i>“Officer Hugh Colton. Call me Colt.”</i> He reaches out and offers you a hand. You take it and give it a shake, noting his grasp is firm and strong. <i>“Steele, huh? Any connection to Steele Tech?”</i>");
	output("\n\nYou confirm the officer is correct, and tell him you’re Victor Steele’s son.");
	output("\n\n<i>“Ah, damn.”</i> Colt chuckles to himself. <i>“That’s wild. You must get to travel all over and see some real crazy shit.”</i> The officer shakes his head and takes a sip from his water.");
	output("\n\nYou shrug, telling him about a few of the places you’ve been to.");
	output("\n\n<i>“Ah, damn. That makes me a little jealous. I enlisted to get out and see the galaxy. Instead I get stuck on a dust bowl filled with huge tittied bug women.”</i> Colt lifts his fingers to his head and mimes shooting a gun at his head.");
	output("\n\nRolling your eyes, you toss back a reply. <i>“Doesn’t sound all that bad. Big tits are always nice.”</i>");
	output("\n\n<i>“Eh, not for me.”</i> Colt scratches his cheek. <i>“I’m not exactly down with that sort of thing. If you get my meaning.”</i> He gives you a knowing look.");
	output("\n\n<i>“Ah.”</i> You give him a shrug. <i>“So, what exactly is your thing?”</i>");
	output("\n\nThe officer smirks and rolls his eyes. <i>“Hey, man. I swiped right. That should tell you something.”</i> He leans in close, speaking just above a whisper. <i>“You swiped right too. So I’m guessing we’re both batting for the same team, yeah? So if you’re willing to pitch some I’m willing to catch some and play some ball, you feel me?”</i>");
	
	processTime(5);
	addButton(0,"Play ball",extrameetDaRegulatorSex,undefined,"Play ball","Get pitching");
	addButton(14,"Bail",extrameetBailScene);
}
public function extrameetDaRegulatorSex():void
{
	clearOutput();
	clearMenu();
	//showName("DaRegulator");
	showName("DA\nREGULATOR");
	author("Fr0sty");
	//find the cock to use 
	var kok:int = rand(pc.cockTotal());
	
	moveTo("SHIP INTERIOR");
	output("You tell Colt you feel him, giving him a classic Steele wink.");
	output("\n\n<i>“Great. You got a place we can throw down? Cause I sleep in a barracks with like 13 other dudes, so that ain’t exactly the best place to have privacy.”</i>");
	output("\n\nYou tell him about your ship and the two of you set off in short order. Along the way Colt makes small talk. <i>“You know, I don’t have anything against bugs. Really. But being on a whole planet of them is just too much sometimes man. They got some real creepy ass ones living under the surface. Gives me the willies.”</i>");
	output("\n\nYou arrive at your ship and escort the officer into your room. Without much hesitation, Colt starts to remove his uniform. When he takes his shirt off you can’t help but stare at his abs. He has more of a twelve pack than a six pack. Although you could tell he was muscular even with his clothes on, you never imagined he would be so cut. Realizing you’re staring, you clear your throat and remove your own gear, setting it aside.");
	output("\n\nYou turn back to Colt and see he’s now completely naked. His cock seems fair ordinary both in size and shape, but you notice it’s already hard. <i>“So tell me, Steele.”</i> The dark skinned man says, rolling his shoulders. <i>“Ready to get up to the pitch?”</i> Colt turns around, showing off his very large bubble butt. It looks like near solid muscle, and you can’t help but feel like if he squeezed it he could crack a walnut with it. <i>“Hope you don’t mind a little muscle on your men. Not a lot to do here other than work out.”</i>");
	output("\n\nYou move in close and give the sculpted man’s backside a firm pat, telling him you don’t mind at all. Colt give you a smirk over his shoulder. <i>“Lube up then, hotshot. Got some lube in my pocket if you wanna fish it out.”</i>");
	output("\n\nYou turn to Colt’s discarded pants and check the pockets, finding the lube in short order. You pop open the bottle and rub some on your [pc.cockShape " + kok + "] cock. You turn back to Colt and see him already on the bed, ass up in the air. <i>“Don’t leave me waiting too long now.”</i> He chuckles, wiggling his bum as he does.");
	output("\n\nYou move in close, your [pc.cockHead " + kok + "] pressing up against the man’s rear end. <i>“Hope you’re ready.”</i> You give him fair warning, moving your hips forward and putting more pressure on his hole. Just based on your current pushing, you can tell he’s going to be tight. With a small grunt of effort you press harder, the tip of your [pc.cock " + kok + "] working its way into his pucker. You strain, trying to push it in further, fighting against the strength of his hole. Colt grunts as your slick cock forces its way into him, causing him to clench his strong ass reflexively.");
	
	pc.cockChange();
	
	output("\n\nThe power of his muscles clamping down on you make you wince, the force of it almost crushing your cock. He quickly stops clenching, loosening up the way for you. Even when not flexing you find it hard to dig deep, despite even being lubed up. After a few minutes of working away, you find the tight hole to start to loosen more, allowing you to move your hips and begin properly fucking him. Colt moans softly as you get into a rhythm, your efforts appearing to wear him down. You grab a tight hold of the man’s hips, and give his ass all you can muster.");
	output("\n\nColt starts gasping for breath beneath you, and you feel his muscles tense up around your member. The extra tightness squeezes your throbbing shaft, the sensation making you groan in pleasure. You fight against his flexing, trying your best you bury yourself deeper and deeper into the man. The further in you manage to reach, the harder against you his strong ass muscles clench. You can’t help but see it as a challenge. How deep can you go? Sweat starts to build on your brow, and the air in your lungs seems to burn. The workout is starting to get the better of you, and you don’t think you can last much longer. A loud moan from Colt tells you he doesn’t need much more either.");
	output("\n\nYou take a deep breath and go for broke, throwing all of your energy at the man. You pound your meat into his tight ass as hard as you can, breathing fast and heavy with each fast thrust. Below you Colt groans, and you feel him tense up causing you to moan in pleasure. If you didn’t know any better, you’d think he was trying to rip your cock off he’s clenching so tight. You feel your dick burn hot and pulsate, your load ready to burst. Colt beats you to it, and you feel him shudder beneath you and you catch the very familiar scent of hot spunk as he presumably unloads onto your bed. The smell of it seems to be all you need, and you feel yourself start to cum. You bury yourself into Colt, shooting your hot jizz deep into the man’s ass. You nearly double over onto him as your burning cock pulsates out its thick load, and exhaustion starts to set in.");
	output("\n\nPulling yourself out of Colt, you start to clean yourself off while he gets dressed. <i>“Damn, that was some good stuff.”</i> The dark man finishes putting his uniform back on and stretches out his back. <i>“Well. That was the best date I’ve had since getting here. If you’re ever in the neighborhood, and looking for some fun, I’m down to play.”</i> He gives you a thumbs up and a rather silly wink and smile. You tell him you’ll keep that in mind and say farewell for now, watching the man disembark from your ship.");
	
	processTime(30 + rand(15));
	pc.orgasm();
	
	IncrementFlag("EXTRAMEET_SEX");
	IncrementFlag("EXTRAMEET_ASS_GIVE");
	addButton(0,"Next",mainGameMenu);
}
//#1Huntress
//[EXTRAMEET_HUNTRESS]
public function extrameetHuntressProfile():void
{
	output("The profile picture on your screen is a close up of a black eyed woman’s face. From what you can gather she is a Nyrea. She looks quite beautiful, but you can tell she is a little bit past her prime.");
	output("\n\nUsername: #1Huntress");
	output("\nSex: Female");
	output("\nAge: 53 Years");
	output("\nRace: Nyrea");
	output("\nPlanet: Myrellion");
	output("\n\nBio:");
	output("\nExperienced huntress looking for prey. So long as I deem you worthy, all will be considered. Your submission will be swift and sweet.");
}
public function extrameetHuntressCheckMatch():Boolean
{
	//no requirements
	return true;
}

public function extrameetHuntressDate():void
{
	//showName("#1Huntress");
	showName("\n#1 HUNTRESS");
	author("Fr0sty");
	moveTo("609");
	output("You enter The Golden Peak and start to take a look around, not seeing your date. How a Nyrea on the surface doesn’t stick out like a sore thumb is beyond you. You spot, in a dark corner of the bar, a tall hooded figure shying away from the light. You think you’ve found your woman. As you make your way over, the hooded figure turns slightly to regard you as you approach. She looks up enough for you to see part of her face, and know you have the right woman. You take a seat and introduce yourself.");
	output("\n\n<i>“Steele, hm? Strong name.”</i> Her voice is like velvet, seductive and smooth. <i>“I like my prey strong.”</i> She lifts her head slightly, showing off a wicked smile. You shift in your seat, the woman’s smile a little unnerving. Realizing you don’t even know her name yet you ask her for it.");
	output("\n\n<i>“My name is inconsequential. If you must call me something refer to me as Huntress.”</i> She pulls the hood over her face again, shielding herself from the light of the bar. <i>“This place is uncomfortable for me. We should hurry this along. This custom of meeting beforehand is vexing.”</i>");
	output("\n\nSomething she said raises a question in your mind. You ask the hooded woman why she is on the surface in the first place.");
	output("\n\nShe doesn’t reply for a long moment, and you suspect she is frowning despite her face being hidden by the hood. <i>“When Taivra rose to power, I was unwilling to submit and too old to challenge her. Leaving was the only option I felt comfortable with.”</i> She leans forward, her voice dropping lower. <i>“Now, shall we take this somewhere else, Steele? I wish to take you like the little beta bitch you are. Your ass will be a fine prize.”</i>");
	output("\n\nWell, she’s certainly forward.");
	
	if(!CodexManager.entryUnlocked("Nyrea")) 
	{
		output("\n\nYour codex beeps to inform you it’s identified the Nyrea race.");
		CodexManager.unlockEntry("Nyrea");
	}
	
	processTime(5);
	addButton(0,"Go with her",extrameetHuntressSex,undefined,"Go with her","Go with her and be her beta");
	addButton(14,"Bail",extrameetBailScene);
}
public function extrameetHuntressSex():void
{
	clearOutput();
	clearMenu();
	//showName("#1Huntress");
	showName("\n#1 HUNTRESS");
	author("Fr0sty");
	
	moveTo("606");
	output("You nod your head, agreeing to go with the Nyrean woman. She gives you a wide smile, showing off her sharp teeth. <i>“Excellent.”</i> The older woman rises to her feet, standing tall over you. <i>“Follow.”</i> She turns and struts out of the bar, moving with grace and poise.");
	output("\n\nDeciding it best not to keep her waiting, you pull yourself up and follow after her. She doesn’t take you far, guiding you down the street a short distance to what appears to a repurposed barracks. From what you can gather, it seems to serve as a hostel of sorts for spacers. The tall woman heads inside, with you on her heels. She leads you down a hallway and a small flight of stairs, stopping at a door. The huntress fumbles around for a set of keys a moment, then unlocks the door and motions for you to enter. <i>“Welcome to my parlor.”</i> Under her hood you she her sharp smile once more.");
	output("\n\nYou step into the Nyrean’s room, finding it to be rather spartan with only a small cot and a single table and chair for furniture. You hear the door close behind you, and the noticeable sound of the lock clicking. Turning around, you see the huntress pull off her cloak, revealing herself to you properly. She is definitely a mature woman, her spine-like hair grey from time and signs of age on her face. Her body is well maintained, with her impressive chest showing only a faint amount of sagging. You note she is covered in scars, both on her worn black chitin plates and her pale flesh. You eyes trail downward to her groin and you stare at her thick ovi-cock, hanging between her legs freely.");
	output("\n\n<i>“Like what you see, prey?”</i> She moves closer to you, saunting over seductively. <i>“I’ve bred hundreds of beta bitches and feeble males over the years.”</i> She reaches out, running a long finger along your jaw. Her touch makes you quiver, which causes the woman to smirk. <i>“Ready to be another notch on my spear?”</i> Her fingers shift and she cups your chin, drawing her face close to yours. You can’t help but nod.");
	output("\n\nWith little warning, the huntress grabs you, spinning you around and pressing your face down onto her table. You feel the wind almost get knocked out of you as she bends you over, showing a surprising amount of strength for a woman her age. She presses her hand against the back of your neck, keeping you down and unable to move. You struggle against her a moment, but you feel her bear down harder. <i>“Stay still, prey. Struggling, while charming, will not help.”</i> You feel her free hand move towards your [pc.ass], pulling away at your gear. You tremble beneath the strength of the seasoned woman as she clears her path, exposing your [pc.ass].");
	output("\n\nSomething strong and pointy jabs into your backside, causing you to jump in surprise. The huntress laughs, and you feel her poke you again with her now firm ovi-cock. <i>“Try not to scream too loudly. The neighbors tend to talk.”</i> You feel her press her thick meat against you again, the spiked nubs on her tip threatening your hole. You can’t help but panic: she isn’t going in dry is she? You worry melts away as you feel something wet and warm ooze onto your hole. A small mercy, as not even a moment later you feel the huntress press against you again, this time penetrating you.");
	
	pc.buttChange(chars["NYREA ALPHA"].cockVolume(0), true, true, false);
	
	output("\n\nYou cry out in pain, the roughness of the older woman catching you off guard as her nubbed cockhead invades your tight hole. Her hand presses down against you, holding you down while she slides more of her thick meat into you, inch by agonizing inch. Despite her forcefulness, you feel a depraved sense of pleasure stemming from your stuffed ass, causing you to moan as you’re filled. The woman’s attack on you is powerful, and she thrusts in deep, threatening to split you in two. You groan in lustful pleasure as she buries herself in you up to her knot. The huntress takes a deep breath, grips your [pc.hips], and starts to pound your [pc.ass].");
	output("\n\nShe starts off with a steady rhythm, bouncing against your rear end with wet slapping sounds. Your moans drown out the sounds of sex, and waves of pain laced pleasure ripple through your body. The Nyrean woman still holds you down, leaving you unable to move as her hips continue to drive her meat deep into your quivering hole. You already feel yourself near your limit, the nubbed ovi-cock working lascivious magic on you. Your rough lover starts to pick up the pace, although you assume it’s because she herself is edging closer, and it has nothing to do with you.");
	output("\n\n<i>“Prepare yourself, prey.”</i> You hear the older woman say through uneven breaths. Before you can register her words the Nyrea plunges in all the way, completely hilting herself inside you knot and all. The sudden increased fullness in your rear causes you to scream, in both pain and pleasure as it pushes you over the edge, ecstasy taking over as your sex throbs. The huntress groans loudly, and you feel her ovi-cock pulse in your ass as her girlcum fills it. You tremble under her, feeling her hand on your neck press down harder as she cums. A few moments later she lifts her hand off your nape, and you hear the woman clear her throat.");
	output("\n\n<i>“Hmm. I needed that.”</i> Her voice is smooth and dripping with lust. She wiggles her hips, her knotted ovi-cock seemingly stuck in your rear. <i>“Give it a few minutes, at my age I’m lucky to stay hard more than ten minutes.”</i>");
	output("\n\nTrue to her word, the knot deflates shortly after, and the older woman slides out of you with little trouble. You pull yourself up, feeling a small pain in your back from being bent over so long. A much more prominent pain in your ass distracts you from it well enough however. You compose yourself and notice the Nyrean woman has moved over to her cot, laying down and rolling onto her side. She murmurs something about showing yourself out, then rolls over again away from you. You stare at her a moment, then unlock the door and leave. Guess she tired herself out.");
	
	processTime(30 + rand(15));
	pc.orgasm();
	
	pc.loadInAss(chars["NYREA ALPHA"]);

	IncrementFlag("EXTRAMEET_SEX");
	IncrementFlag("EXTRAMEET_ASS_RCVD");
	addButton(0,"Next",mainGameMenu);
}

//Mistress_Venom
//[EXTRAMEET_MISTRESSVENOM]
public function extrameetMistressVenomProfile():void
{
	output("The profile picture on your screen is a professional looking photo of a uniformed red Myr. She is quite beautiful, but has a stern expression giving off an almost cruel air about her. The fact she is wearing a military uniform only seems to make it worse.");
	output("\n\nUsername: Mistress_Venom");
	output("\nSex: Female");
	output("\nAge: 29 Years");
	output("\nRace: Myr");
	output("\nPlanet: Myrellion");
	output("\n\nBio:");
	output("\nLooking for some fresh meat to entertain myself with. High preference towards males, but any sorry shit with a prick with do. Not looking to keep, just to rent.");
}
public function extrameetMistressVenomCheckMatch():Boolean
{
	//non-taur with cock
	if (!pc.isTaur() && pc.hasCock()) return true;
	else return false;
}

public function extrameetMistressVenomDate():void
{
	//showName("Mistress_Venom");
	showName("MISTRESS\nVENOM");
	author("Fr0sty");
	moveTo("609");
	output("You enter The Golden Peak and take a look around. You spot your date seated off to the side of the bar dressed in her uniform. She spots your before you can make your way over and motions at you with her fingers, signaling to you. You make your approach slowly, trying to measure her before you reach the table. She doesn’t look quite as scary as her profile picture, although she does look rather uptight and stern, giving off a very professional vibe.");
	output("\n\nAs you reach her your date stands up, revealing herself to be slightly on the tall and lanky side. At a guess you’d put her at around 6 foot, but would you’d be shocked if she was anywhere over 140 pounds, even factoring in her chitin. She looks at you expectantly, so you go ahead and introduce yourself first.");
	output("\n\n<i>“Staff Sergeant Elzara Tassius.”</i> She speaks her name with purpose and power. <i>“Sit.”</i> She motions to a free chair at the table, staring at you with stern eyes. The Red Myr stays standing, waiting for you to take your seat.");
	output("\n\nOnce you do sit she follows suit, sitting with perfect posture and seemingly forgoing any comfort. <i>“So Elzara-”</i>");
	output("\n\nShe cuts you off, her tone sharp and concise. <i>“Sergeant Tassius.”</i> Her expression doesn’t change, and remains stern and focused.");
	output("\n\nYou shift in your seat, feeling more like you’re in a military interview than on a date. <i>“Right... Sergeant Tassius, what brings you to the DMZ?”</i>");
	output("\n\n<i>“I’m currently stationed at the embassy.”</i> She states very robotically, then goes silent.");
	output("\n\nA long few seconds pass. It’s clear she has no intention of adding anything else. Trying to make more small talk, you ask her how she enjoys her time in the military.");
	output("\n\n<i>“It’s fine.”</i> She answers your question so bluntly you almost feel like she slapped you in the face. Before you can ask something else, she interjects. <i>“Are you finished?”</i>");
	output("\n\nYou feel like she slapped you again with her question. Stammering a bit, you ask her what she means.");
	output("\n\nThe Red Myr rolls her eyes, the first time she breaks her professional air. <i>“With this petty attempt at courtship.”</i> She leans in closer, her expression still firm. <i>“It is your manhood I seek, not your companionship. So, are you done? If I knew it would be such a task to bed you I’d have never swiped right.”</i>");
	
	if(!CodexManager.entryUnlocked("Red Myr")) 
	{
		output("\n\nYour codex beeps to inform you it’s identified the Red Myr race.");
		CodexManager.unlockEntry("Red Myr");
	}
	
	processTime(5);
	addButton(0,"You’re Done",extrameetMistressVenomSex,undefined,"You’re Done","Stop talking and give her your cock.");
	addButton(14,"Bail",extrameetBailScene);
}
public function extrameetMistressVenomSex():void
{
	clearOutput();
	clearMenu();
	//showName("Mistress_Venom");
	showName("MISTRESS\nVENOM");
	author("Fr0sty");
	//find the cock to use 
	var kok:int = rand(pc.cockTotal());
	
	moveTo("613");
	output("<i>“I... Guess I’m done.”</i> You can’t help but shift in your seat, feeling very on the spot and awkward.");
	output("\n\n<i>“Excellent.”</i> The red Myr stands up and adjusts her uniform. <i>“Double time. I don’t have all day.”</i> The Sergeant marches off, heading straight for the door without so much as looking back.");
	output("\n\nYou stare at her ass for a moment as she walks away, noticing her seems to have a bit more wiggle back there than you would have expected. Shaking it off, you scramble up and follow after her, not wanting to get left behind.");
	output("\n\nIt only takes a minute to catch up to her, but keeping up proves to be a challenge. She seems to be power walking to wherever it is she is taking you, almost as if she is in some sort of a hurry. You contemplate asking her to slow down for a moment, but you have a gut feeling that asking wouldn’t go over very well.");
	output("\n\nAfter a few minutes of walking, you figure out exactly where she’s leading you: The Scarlet Federation embassy. You walk into the embassy and head north into the Red Myr offices. The Sergeant marches past several offices towards a door in the back, pulling it open and walking through and up a small flight of stairs. You follow behind her, the stairs taking you up the flight to what appears to be a crawlspace of sorts. Looking around, you see the dimly lit room is nearly empty save for some crates and a few filing cabinets.");
	output("\n\n<i>“What is this place?”</i> Look sniff the air. The place was full of dust.");
	output("\n\n<i>“It’s nothing.”</i> Tassius moves towards a crate and brushes off the top of it, then slowly lowers herself down and takes a seat. <i>“I can’t speak to its intended purpose, but we use it as a dumping ground for paperwork.”</i> She adjusts her collar, loosening it off her neck. <i>“Alright. Strip.”</i>");
	output("\n\nYou stare at your date, hesitating for a moment while you contemplate her request. Well, demand rather. Deciding to not keep her waiting, you start to pull off your gear, setting it down on a nearby crate that doesn’t seem too dust covered. Once you’re naked, you turn and face the Red Myr, who looks you up and down.");
	output("\n\nShe gives your [pc.cock " + kok + "] an especially good look. <i>“Not bad. That’ll do nicely.”</i> She nods in approval. <i>“Alright, on your back.”</i>");
	output("\n\nYou look around at the dust floor. <i>“Is there a mattress or something?”</i> You contemplate pulling a sheet off one of the crates, but suspect they are not any less dusty than the floor would be.");
	output("\n\nTassius gives you a stern look. <i>“On. Your. Back.”</i> Her voice makes it clear she isn’t asking. The woman has a way with authority, and knows how to exercise that power.");
	output("\n\nDoing as you’re told, you gently lower yourself down, the floor feeling cold against your back. You take a moment to silently lament the dust that now coats your [pc.skinFurScales].");
	output("\n\nThe Red Woman pulls herself to her feet once more, bushing off her backside with a few firm pats. She stalks over to you, her chitinous boots clicking on the ground as she walks. She stands over top of you, blocking out what little light there is and and appearing like a shadow overhead. <i>“You are not at attention.”</i> She nods her head towards your still soft [pc.cock " + kok + "]. <i>“This won’t do.”</i>");
	output("\n\nShe takes another step forward, her feet on either side of your head now and offering you a very informative look up her skirt. The Sergeant isn’t wearing any panties, which doesn’t strictly surprise you, but does seem slightly odd for how you perceived her. Despite the poor lighting, you can vaguely make out her twat, the sight of it causing your crotch to stir.");
	output("\n\nTassius scoffs. <i>“Men. You’re almost too easy.”</i> She takes another few steps forward, carefully stepping over your shoulders and widening her stance. The red woman comes to a stop over your [pc.hips], her womanhood looming over your rising member. Slowly, she reaches down and hikes up her skirt, offering you a very nice view of her perfectly formed ass. You feel your cock twitch, stiffening up to full mast, and in no small part due to the very red and round scenery. Tassius drops her hand between her thighs, caressing her cunt with her fingers slowly.");
	output("\n\nThe Sergeant warms herself up for a few short moments, her touching becoming more intense. You hear her softly gasp a few times, but nothing too loud or lewd seems to escape her lips. Your current angle gives you a view of the action, and watching her red pussy come alive and slick with sticky juices makes your cock throb with excitement. After another minute, Tassius stops teasing her now ready pussy and starts to lower herself down, right over your hard and eager pole.");
	output("\n\nShe doesn’t waste any time, dropping herself right on top of it and burying your cock deep inside her hot, wet cunt. You can’t help but release a lusty moan as your meat is taken in, the red woman feeling tighter around you than you would have expected. She lowers herself down until her very soft and round ass comes to rest on your abdomen, the sergerent seeming to take all of you in. You’d almost be impressed, if she didn’t release a very lusty moan of her own. You feel her shudder and shake, the woman almost doubling over completely.");
	
	pc.cockChange();

	output("\n\nAfter a few deep breaths she seems to collect herself, lifting back up to full before she starts to shake her hips back and forth grinding up on you. The red woman rides you expertly, moving her body rhythmically and at a slowly increasing pace. Her movements are selfish, and she is clearly prioritizing her own pleasure over yours. Even so, your cock being along for the ride is still enjoyable and you feel it throb in approval. Your head falls back and you let out a contented sigh, just happy to lay there and let the Sergeant have her way with you.");
	output("\n\nA few minutes in the Red Myr adds a slight bounce to her efforts, sliding along your rigid member with each motion. While it’s not much, this added movement is a vast improvement for you, and your cock seems to twitch in appreciation. In terms of a view, your date’s ass jiggles and bounces up and down in a sinfully seductive show. Between these two things, you start feeling yourself edge closer to finishing. Your cock burns and throbs inside of the Myr’s cunt as you edge closer to exploding.");
	output("\n\n<i>“Don’t cum!”</i> The red woman turns and looks at you over her shoulder. <i>“Don’t you dare cum before me!”</i> You date goes into overdrive, bouncing and grinding so fast the friction starts to burn your ready-to-pop manhood. You strain, trying to hold yourself back. Something tells you if you came first the Sergeant would not be happy at all. Thankfully, you don’t have to wait long as the red woman throws her head back and moans loudly, her movement on your cock seeming to stagger to a near stop as her body shudders.");
	output("\n\nHer orgasm is all the go ahead you need. You relax and let yourself go, a wave of pleasure rippling through you as you blow your load deep into the still shivering Myr. Your whole body tenses as your cock pulses in the Myr’s tight cunt, a loud throaty groan at your lips. Before your orgasm has even passed you feel the Sergeant lift herself off of you, thick [pc.cumColor] seed oozing out of her and dripping down on you. She steps over you and stalks a few paces away, leaving you in a puddle of your own warm spunk.");
	output("\n\n<i>“Impressive.”</i> She pulls her skirt down and flattens it, adjusting the rest of her uniform as well. <i>“Your stamina is commendable. I would like to use you again in the future.”</i> She turns back and faces you, a dry smile on her lips. <i>“Until next time. Farewell.”</i> The Sergeant turns on her heel and walks towards the stairs, leaving you alone.");
	output("\n\n<i>“Huh...”</i> You pull yourself to your feet and wipe your crotch off with the nearest sheet. Collecting you gear, you suit back up and head down the stairs, exiting the small attic.");
	
	processTime(30 + rand(15));
	pc.orgasm();

	IncrementFlag("EXTRAMEET_SEX");
	IncrementFlag("EXTRAMEET_CUNT_GIVE");
	addButton(0,"Next",mainGameMenu);
}

//Rebel23
//[EXTRAMEET_REBEL23]
public function extrameetRebel23Profile():void
{
	output("The profile picture on your screen is a selfie of a very feminine Dzaan. Her face is painted with makeup, expertly applied and accentuating her features. Although it’s difficult to get a sense of scale, you can tell she is shorter and slimmer than most of her race.");
	output("\n\nUsername: Rebel23");
	output("\nSex: Female");
	output("\nAge: 45 Years");
	output("\nRace: Dzaan");
	output("\nPlanet: Myrellion");
	output("\n\nBio:");
	output("\nLonely girl looking for some female companionship. Interested in trying new things and meeting different kinds of people. Would be willing to partake in some after hours fun if it promises to be adventurous. And yes, I have an idea what that means ;P");
}
public function extrameetRebel23CheckMatch():Boolean
{
	//has vafgina and femiminine
	if (pc.hasVagina() && pc.isFeminine(true)) return true;
	else return false;
}

public function extrameetRebel23Date():void
{
	//showName("Rebel23");
	showName("\nREBEL 23");
	author("Fr0sty");
	moveTo("609");
	output("You enter The Golden Peak and immediately spot your date. Seated in the middle of the room, the bombshell of a woman is the center of attention and then some. She’s dressed in an overtly extravagant outfit, a low cut dress of shining silver against her dark purple skin. More than a few heads are turned her way but she only seems to see you, a smile arching on her painted lips.");
	output("\n\nYour feet move on their own, guiding you forward towards her. You come to a stop at the table, now close enough to be able to see dark black stripes twisting along her purple flesh. While still admiring her, you introduce yourself, trying not to make things awkward.");
	output("\n\nThe Dzaan chuckles, her voice light and airy. <i>“Pleased to meet you, [pc.name]. I’m Shoana. Please, sit down.”</i> She motions towards a chair next to her, very close to her own.");
	output("\n\nYou take a seat, noticing that a few patrons seem to be watching you. Looking around a few heads seem to turn away, seemingly avoiding your gaze. Next to you, your date follows your gaze around the room.");
	output("\n\n<i>“Seems we’ve got an audience.”</i> Shoana cups her chin in her hand. <i>“Let’s try to ignore them, shall we? So tell me about yourself, darling.”</i>");
	output("\n\nTrying to take your date’s advice, you shift gears and start to tell your date about yourself and your quest for the probes and your inheritance. Shoana listens quite intently, asking a few questions as you speak, but without interrupting you. After awhile, you forget you’re in a public bar at all you’re so involved in speaking. Something about the Dzaan makes you feel like you can really open up, although your unsure why. Eventually, you run out of things to say, so you ask her about herself.");
	output("\n\n<i>“Oh, well.”</i> The Dzaan leans back. <i>“Oh well, let’s see... My life has been pretty lackluster all things considered.”</i> She gives you a shrug and a frown. <i>“Not much to say really.”</i>");
	output("\n\nSomething tells you your date isn’t being completely honest. You can’t quite put your finger on why you feel it, but you know she’s got some sort of story to tell. Your suspicion must be painted on your face, as you notice the Dzaan seemingly grow slightly anxious.");
	output("\n\n<i>“Tell you what. Come back to my ship and we can talk all about me.”</i> She scoots herself closer, droping her voice to just a hair over a whisper. <i>“Although, once we get there, talking might not be what you want to do.”</i> Her puffy lips crack into a lewd smirk, then she puckers them and offers a playful faux kiss to the air.");
	
	if(!CodexManager.entryUnlocked("Dzaan")) 
	{
		output("\n\nYour codex beeps to inform you it’s identified the Dzaan race.");
		CodexManager.unlockEntry("Dzaan");
	}
	
	processTime(15);
	addButton(0,"Go with her",extrameetRebel23Sex,undefined,"Go with her","Go to her ship");
	addButton(14,"Bail",extrameetBailScene);
}
public function extrameetRebel23Sex():void
{
	clearOutput();
	clearMenu();
	//showName("Rebel23");
	showName("\nREBEL 23");
	author("Fr0sty");
	//find the vag she fucks (use kaska since we just need to simulate a dzaan cock size)
	var vag:int = pc.cuntThatFits(chars["KASKA"].cockVolume(0));
	if (vag < 0) vag = rand(pc.vaginaTotal());

	moveTo("601");
	output("You tell your date you’d be interested in going back with her, causing the Dzaan’s smirk to widen slightly. <i>“Excellent.”</i> She rises up to her feet, striking something of a subtly elegant pose. <i>“Walk with me, [pc.name].”</i> She hold out her arm, offering it to you.");
	output("\n\nPulling yourself up, you loop your arm around hers and walk with the sultry woman towards the exit. Several heads turn and watch the two of you, looks of envy and longing on their faces. Being the center of attention brings a small smile to your face, and from what you can tell Shoana seems to enjoy the attention just as much, albeit she seems far more accustomed to it. As you exit the bar she turns to you and sighs. <i>“It’s like that everywhere I go. Got old for a while, but then I started to enjoy it again.”</i>");
	output("\n\nThe two of you walk for a few minutes in silence. You’re not really sure what to talk about with the extravagant woman, your mind slowly sinking into the gutter at the promise of fun times when you reach her ship. Shoana seems to sense the mood and breaks the silence. <i>“I was a slave you know.”</i> You turn to her, your face an odd mix of shock and curiosity. Now you understand why she wasn’t too keen on sharing before. <i>“Well, something of a slave. Sold into a marriage of sorts to an alpha.”</i> Her tone is rather bland, speaking very matter of factly. <i>“One of many wives in her harem. I learned during that time. How to be... Well fabulous.”</i> She gives you a wry smirk.");
	output("\n\nCurious, you ask her why she isn’t a slave now.");
	output("\n\n<i>“She died, so the contract ended. She was old as sin even when I married her. And rich as well. I was left a small piece of a very large sum, enough to afford... that.”</i> She points off in front of her. You didn’t even notice you had made it to the hangar, lost in the awkward silence and then her reveal. Following her finger, you spot a very sleek and expensive ship, more akin to a yacht than anything else. Large and gold, it sticks out like a sore thumb from everything else in the hangar. Shoana pulls away from you and moves towards it, looking back over her shoulder at you as she walks. <i>“Coming?”</i>");
	output("\n\nYou don’t need to be told twice. Following after, she lead leads you up the ramp and into her ship, leading you into a central hold. The room is decorated with various sorts of fine furniture and other odd and ends. You focus in on an odd tapestry hanging on one of the walls, recognizing it to be an antique and likely worth more than the ship. Gazing around at some of the other items makes you think more of the same. Just how much of a fortune did she inherit? You decide to take a closer look at some of the items, barely registering Shoana slipping out of the main hold. While she is gone you inspect a rather interesting couch, made of a woven material you can’t quite place.");
	output("\n\n<i>“Like it?”</i> Shoana speaks behind you, causing you to jump and turn around. She’s changed her clothing, now just wearing a bathrobe and her hair is pulled back. <i>“Try it out, have a seat.”</i> She moves towards you, her bare feet silent against the floor as she walks. The Dzaan comes to a halt right in front of you, then places her hands on your shoulders and guides you down onto the couch. Admittedly, the seat is extremely comfy and surely must have been worth whatever Shoana paid for it. You look up at Shoana to tell her as much, noticing the Dzaan has loosened her robe, baring her chest to you.");
	output("\n\nYou swallow hard, so hard you make an audible gulp. The Dzaan’s chest is large and well formed, decorated with similar markings as the rest of her. <i>“Comfy?”</i> She bends down low, bringing her face in line with yours. You’re not sure what to look at, her tits or her face. She giggles softly, seemingly sensing your dilemma. <i>“Lay back. You’ll enjoy it more. Hm. This won’t do though...”</i> She gives your gear a frown. <i>“Let me help you...”</i> Delicately, but with sure-moving hands, she helps you undress, pulling off your gear and setting it aside. It doesn’t take long until you’re completely exposed, with all your equipment piled neatly to the side. She places her hand on your shoulder, gently guiding you backwards until you’re flat on the couch.");
	output("\n\nNow you feel very comfortable. Whatever the material is, it feels great against your [pc.skinFurScales]. You close your eyes and rub yourself against it, enjoying it to the fullest. The sound of falling fabric causes you to reopen your eyes, and what you see causes you to nearly jump up in surprise. Shoana is standing next to you, her robe on the floor, and a large purple cock strapped to her waist. How she hid that under her robe you can’t say, but by the looks of it it’s shaped like a real Dzaan’s cock. And is about as large. <i>“Like it? I thought you would.”</i> She crawls onto the far end of the couch, right over top of your legs. <i>“Hope you don’t think me presumptuous. I spent years on my back as a slave, so now I like to indulge the other way.”</i> You can’t help but blush, liking the sound of that.");
	output("\n\nShoana eases herself between your legs, running her hands up and down your [pc.skinFurScales]. Her touch is firm but gentle, her fingers tracing along your muscles and sending tingles up your body. The Dzaan leans in close, moving her face towards you midsection and planting a tender kiss on your belly. She makes a small trail of kisses leading downward, each new press of her lips inching closer and closer to your womanhood. The teasing kisses cause a stirring in your loins, excited by the imminent arrival of the Dzaan’s soft mouth. Each kiss becomes torture, your eager twat growing inpatient and wanting to be touched. When Shoana finally does plant a small kiss on the folds of your cunt, you feel a rush of bliss. The surge of pleasure rolls through your body, the anticipation of waiting making it burn hotter and brighter than a simple kiss ever could.");
	output("\n\nThe Dzaan doesn’t stop there, giving your womanhood several more lascivious kisses. Tonguing you slightly, the very well practiced woman goes to work on you, teasing and pleasing your eager pussy with a precise and effective touch. You feel your back arch as you gasp for air, sinfully hot pleasure starting to run up your spine and making you flushed. Between your legs you feel your cunt start to drool juices, growing wetter by the second as Shoana teases you. The Dzaan pulls herself up and scoots forward, moving your legs slightly as she situates herself and her faux cock directly into position. She gives you a playful smirk, pushing the head of her toy against you. <i>“You taste heavenly. But now it’s time for the main course. Ready?”</i> You give her a quick nod, and the Dzaan’s smirk becomes a full toothy smile as she moves her hips forward slowly, plunging the strapon inside you.");
	
	pc.cuntChange(vag, chars["KASKA"].cockVolume(0), true, true, false);

	output("\n\nYour eager cunt writhes around her toy, the fake cock forcing its way deeper into your tight womanhood. You gasp out as she starts to wiggle her hips back and forth slowly, jumping right into a slow and rhythmic pace. Above you you hear Shoana take a deep breath and sigh, leading you to suspect there might be more to the toy than you noticed at first glance. As she starts to pick up the pace your suspicion is confirmed, as you hear the Dzaan softly moan, but the sounds are quickly drowned out by the sounds of your own gasping breaths. The toy cock in your cunt feels oddly cold, but after a moment you realize it only feels that way because of how hot your cunt is burning. Alive with sensation, you feel wave after wave of intense tingling pulse though you each time the Dzaan thrusts into you.");
	output("\n\nYou release a shuddered gasp, feeling Shoana start to pick up her pace. For her own part, you hear her breathing heavily once more, no longer drowned out by your sounds. Indeed, you find it hard to even cry out at all, the intensity of the Dzaan pushing you to a new level. Her thrusts are hard now, each buck of her womanly hips burying her toy deep inside of your slick cunt. Despite being smaller than most Dzaan, Shoana is still able to pack a serious punch, and as she turns it up even further you feel the whole couch rock and slide. You try to scream, but only a gasping moan escapes your throat, your whole body on fire. Your [pc.skinFurScales] tingles, sweat from both yourself and your Dzaan lover coating you. Something deeper inside you starts to rise, your whole body beginning to tense up as Shoana edges you closer.");
	output("\n\nFinally, something crests, and your whole body seizes up as your nerve endings ignite. All you can do is moan like a slut as powerful surges of depraved sensation rip through your body as your orgasm rocks you. Your muscles start to quiver, turning you into a trembling mess unable to do anything but cry out in pleasure. Shoana releases a moan as well, but unlike yours which sounds depraved, hers almost sounds cultured and poised. Likely yet another thing she is well practiced at. She keeps bucking her hips, but her pace is ruined, trying to ride the high but unable to conquer it. Eventually she stops altogether, collapsing on top of you, her body wet with hot sweat. <i>“Hm... That was great. I might have to get a harem of my own.”</i>");
	output("\n\nShoana pulls herself off you a few moments later, then unstraps her toy from her waist. Not surprisingly, you note the toy was double ended as she pulls it out of her, revealing while she was fucking away at you she was also getting her own share. She tosses the toy to the side and flops down on the couch next to your feet. <i>“I need to freshen up, I have guests coming over tonight.”</i> She sniffs the air, then chuckles. <i>“I think I might need to spray the couch down as well.”</i>");
	output("\n\nYou lift yourself up off the couch and retrieve your gear from the neat pile she made and putting it back on. Shoana watches you from the couch, a coy smile on her face. Once you’re dressed she stands up and moves in on you, giving you a quick peck on the cheek. <i>“Don’t be a stranger. If you see me around, come say hi.”</i> The Dzaan saunters away, scooping up her discarded strapon and leaving you alone in the main hold. With a contented sigh, you show yourself out of the ship and return to the hangar alone.");
	
	processTime(30 + rand(15));
	pc.orgasm();
	
	IncrementFlag("EXTRAMEET_SEX");
	IncrementFlag("EXTRAMEET_CUNT_RCVD");
	addButton(0,"Next",mainGameMenu);
}
//myrellion flavor

//Sweetheart
//[EXTRAMEET_SWEETHEART]
public function extrameetSweetheartProfile():void
{
	output("The profile picture on your screen is of a very attractive, and busty, gold myr. Her tits take up most of the photo, barely held in place by an ornate and exotic looking bra.");
	output("\n\nUsername: Sweetheart");
	output("\nSex: Female");
	output("\nAge: 35 Years");
	output("\nRace: Myr");
	output("\nPlanet: Myrellion");
	output("\n\nBio:");
	output("\nLooking to meet interesting and attractive singles. Make me laugh and I might take you home with me.");
}

//Rdy4ply
//[EXTRAMEET_RDY4PLY]
public function extrameetRdy4plyProfile():void
{
	output("The profile picture on your screen is of a rather shabby looking Kui-tan. Based on his attire, you think he’s a mechanic of some kind. Why he didn’t take a photo not covered in oil is beyond you.");
	output("\n\nUsername: Rdy4ply");
	output("\nSex: Male");
	output("\nAge: 42 Years");
	output("\nRace: Kui-tan");
	output("\nPlanet: Myrellion");
	output("\n\nBio:");
	output("\nRecently single and looking to find something new and exciting. I work long hours, and find it hard to meet people, so I’m out here giving it a whirl. Very liberal, and willing to try anything once.");
}

//Al
//[EXTRAMEET_AL]
public function extrameetAlProfile():void
{
	output("The profile picture on your screen is of a very pissed off looking woman. She has a shaved head, and several scars on her face. She almost looks like she’s in a gang or some other criminal group.");
	output("\n\nUsername: Al");
	output("\nSex: Female");
	output("\nAge: 42 Years");
	output("\nRace: Human");
	output("\nPlanet: Myrellion");
	output("\n\nBio:");
	output("\nNames Al. Short for Allison. Not interested in men or women with dicks. Not on planet long, so don’t get attached.");
}

//DeviantSheepdog
//[EXTRAMEET_DEVIANTSHEEPDOG]
public function extrameetDeviantSheepdogProfile():void
{
	output("The profile picture on your screen is of what you first think is an ausar on first glance. He’s furry, very furry. So furry in fact you can’t tell anything about him.");
	output("\n\nUsername: DeviantSheepdog");
	output("\nSex: Male");
	output("\nAge: 23 Years");
	output("\nRace: Ausar+");
	output("\nPlanet: Myrellion");
	output("\n\nBio:");
	output("\nDirty boy who needs a good bath. Wanna help?");
}

//Naughty232
//[EXTRAMEET_NAUGHTY232]
public function extrameetNaughty232Profile():void
{
	output("The profile picture on your screen is a close up selfie of a red myr. You can’t tell much from her picture, other than her race and that’s she reasonably attractive.");
	output("\n\nUsername: Naughty232");
	output("\nSex: Female");
	output("\nAge: 22 Years");
	output("\nRace: Myr");
	output("\nPlanet: Myrellion");
	output("\n\nBio:");
	output("\nYou! Yes you! Wanna piece of this? Cause I wanna piece of that! Swipe right and we can mingle. Not looking for anything serious.");
}

//Siren_Song
//[EXTRAMEET_SIRENSONG]
public function extrameetSirenSongProfile():void
{
	output("The profile picture on your screen is blank.");
	output("\n\nUsername: Siren_Song");
	output("\nSex: Other");
	output("\nAge: 102 Years");
	output("\nRace: Dzaan");
	output("\nPlanet: Myrellion");
	output("\n\nBio:");
	output("\nDoes anybody know how to upload pictures?");
}

//KinkDaddy
//[EXTRAMEET_KINKDADDY]
public function extrameetKinkDaddyProfile():void
{
	output("The profile picture on your screen is of a slightly overweight man wearing a trench coat and brandishing a pair of knives. The weapons are very ornate, but not very functional.");
	output("\n\nUsername: KinkDaddy");
	output("\nSex: Male");
	output("\nAge: 22 Years");
	output("\nRace: Huma");
	output("\nPlanet: Myrellion");
	output("\n\nBio:");
	output("\nLooking for my queen. I travel a lot for work so I don’t get to stay in one place for very long. I’d cross the whole galaxy for the one I love.");
}

//AllYours_12
//[EXTRAMEET_ALLYOURS12]
public function extrameetAllYours12Profile():void
{
	output("The profile picture on your screen is of a modestly sized human dick stuck in some sort of a chastity toy.");
	output("\n\nUsername: AllYours_12");
	output("\nSex: Male");
	output("\nAge: 50 Years");
	output("\nRace: Human");
	output("\nPlanet: Myrellion");
	output("\n\nBio:");
	output("\nLooking for somebody to take me home and make me theirs. Not into being butt fucked.");
}

//PurpleBowtie
//[EXTRAMEET_PURPLEBOWTIE]
public function extrameetPurpleBowtieProfile():void
{
	output("The profile picture on your screen is of a fairly attractive Kui-tan with a bright purple bowtie in her hair. The picture is very modest, and you don’t really get a sense of her shape or size.");
	output("\n\nUsername: PurpleBowtie");
	output("\nSex:Other");
	output("\nAge: 32 Years");
	output("\nRace: Kui-tan");
	output("\nPlanet: Myrellion");
	output("\n\nBio:");
	output("\nNot sure what to put here. I’m interested in meeting new people, local or foreign. Not interested in sex, just conversation and fun times.");
}

//LemmeSmash
//[EXTRAMEET_LEMMESMASH]
public function extrameetLemmeSmashProfile():void
{
	output("The profile picture on your screen is a full body nude of an Ovir with his cock out. It’s certainly an impressive dick, and his figure is quite stunning as well.");
	output("\n\nUsername: LemmeSmash");
	output("\nSex: Male");
	output("\nAge: 29 Years");
	output("\nRace: Ovir");
	output("\nPlanet: Myrellion");
	output("\n\nBio:");
	output("\nTraveling the galaxy to find myself. Fucking a lucky lady on each planet I visit. Will that be you?");
}

//uveto

//TheProfessor
//[EXTRAMEET_THEPROFESSOR]
public function extrameetTheProfessorProfile():void
{
	output("The profile picture on your screen is of a rather dashing looking Kui-tan. He seems to be well dressed, and the fur on his face curiously styled. He’s also wearing a funny hat you think you’ve seen somewhere before...");
	output("\n\nUsername: TheProfessor");
	output("\nSex: Male");
	output("\nAge: 30 Years");
	output("\nRace: Kui-tan");
	output("\nPlanet: Uveto");
	output("\n\nBio:");
	output("\nLonely intellectual. Looking for somebody who can hold up a conversation. My interests include ancient cultures, dead languages, and dry whiskey.");
}
public function extrameetTheProfessorCheckMatch():Boolean
{
	//no requirements
	return true;
}

public function extrameetTheProfessorDate():void
{
	//showName("TheProfessor");
	showName("THE\nPROFESSOR");
	author("Fr0sty");
	moveTo("UVI P32");
	output("You enter The Freezer and see your Kui-tan date sitting off to the side, sipping away at a drink. He doesn’t seem to notice you as you make your way over just continuing to swirl his drink in his hand. Moving towards him you can see the fur on his face is styled into a goatee of sorts, along with something of a twirled moustache. If you had to guess, he must use some sort of strong wax to hold it together. On his head you also note that curious hat once more.");
	output("\n\nWhen you reach the table he looks up at you, smiling through his finely waxed fur. <i>“Oh hello!”</i> He sets his drink down and hops to his feet. <i>“Right on time, very punctual. I like it.”</i> He extends his hand out. <i>“Dr. Negi Korrin. At your service.”</i>");
	output("\n\nYou take the Kui-tan’s hand, introducing yourself to the doctor. The two of you sit down and you begin to engage with the furry man. <i>“So what brings you to this neck of the woods, doctor?”</i>");
	output("\n\n<i>“Oh please, call me Negi.”</i> The Kui-tan twists at his facial hair. <i>“I’m an anthropologist, here to study the native customs.”</i> He tips his hat. <i>“What brings you here?”</i>");
	output("\n\nYou explain about your quest for the probes and your inheritance, talking about some of the places your quest has dragged you. Negi listens intently, sipping away at his drink and nodding along. He seems to be a very good listener. After a while of talking about yourself you decide to give the floor over to him, asking him about his work here.");
	output("\n\n<i>“Well that’s a complicated question.”</i> He leans back in his chair. <i>“Uveto has many native species, each with their own histories and traditions. I’m here to learn about and document those traditions.”</i> Negi scratches his chin. <i>“I must say it’s been keeping me quite busy. I’ve hardly the time to get out and be social.”</i> He adjusts his hat, resting it further back on his head.");
	output("\n\nDying to know, you ask the Kui-tan about his odd choice in headwear.");
	output("\n\n<i>“Oh this old thing?”</i> He glances up. <i>“Nobody knows the true origins, but for hundreds of years human archaeologists have been know to don this hat in honor of some great adventurer.”</i> He shakes his head and laughs. <i>“Humans are so interesting. I did my PH.D on them and ever so often I still learn something that surprises me about them. I can go on if you’re interested.”</i>");
	output("\n\nThe two of you end up talking about ancient cultures for many hours, laughing and drinking over many of the odd traditions many species have. After a particularly amusing topic about Ausar courting customs Negi sighs and stands up.");
	output("\n\n<i>“Wow, that was a great conversation.”</i> He removes his hat and runs his fingers through his hair. <i>“I hate to cut this short, but I’ve got a busy day tomorrow. We should do this again sometime.”</i>");
	output("\n\nYou tell him you’d like that, saying it was nice to just sit and talk for once.");
	output("\n\n<i>“Maybe next time...”</i> He leans in giving you a smirk. <i>“We can try some more hands on study.”</i>");
	output("\n\nYou return the smirk, saying that might not be a bad idea. With a wave, Negi turns and walks away, leaving you alone in the bar.");
	
	if(!CodexManager.entryUnlocked("Kui-Tan")) 
	{
		output("\n\nYour codex beeps to inform you it’s identified the Kui-Tan race.");
		CodexManager.unlockEntry("Kui-Tan");
	}
	
	processTime(180 + rand(60));
	addButton(0,"Next",mainGameMenu);
}

//Fuka
//[EXTRAMEET_FUKA]
public function extrameetFukaProfile():void
{
	output("The profile picture on your screen is of a giant green eye with a rectangular pupil surrounded by pale white fur. By the looks of it, whomever took the picture didn’t know where the camera was.");
	output("\n\nUsername: Fuka");
	output("\nSex: ???");
	output("\nAge: ???");
	output("\nRace: ???");
	output("\nPlanet: Uveto");
	output("\n\nBio:");
	output("\nKokeku votu. Daagu Fuka. Masa veshi go nikki toto. Masa yootu ExtraMeet profile fana go tushi. Yorrada rada, Why not try and make a connection?");
}
public function extrameetFukaCheckMatch():Boolean
{
	//no requirements
	return true;
}

public function extrameetFukaDate():void
{
	//showName("Fuka");
	showName("\nFUKA");
	author("Fr0sty");
	moveTo("UVI P32");
	output("You enter The Freezer and look around, seeing no sign of your date. You take a second to ponder who exactly you’re even supposed to be meeting. Based on what you can guess you’re looking for a korgonne but meeting up with one here seems almost unbelievable. You decide to take a seat and wait, seeing if anybody shows.");
	output("\n\nYou don’t have to wait long, as the sounds of the bar almost go completely quiet as a very short korgonne steps into the bar. The small bundle of fur, clearly female from what you can see, is wrapped up tight in a heavy coat, dozens of odd pieces of scrapped tech hanging off of her. She looks around the room and spots you, then makes her way directly over.");
	output("\n\nWhen she reaches you, she points at you with a gloved finger. <i>“Date?”</i> She stares at you expectantly.");
	output("\n\nYou take a moment considering the small furball’s question. <i>“Um. Yeah. I’m your date.”</i>");
	output("\n\nThe korgonne’s face lights up. <i>“Date!”</i> She hops up, with some difficulty, onto a chair at your table. She points at herself. <i>“Fuka.”</i>");
	output("\n\nYou try to ask the female korgonne about herself, but she just stares at you in confusion. You ask her how she even ended up on ExtraMeet, which causes the furry woman’s face to light up.");
	output("\n\n<i>“ExtraMeet!”</i> Fuka digs around in her pockets and pulled out a nearly destroyed personal computer, clearly pulled from a scrap heap. She turns it to you, showing you the login screen for ExtraMeet. Well that’s one mystery solved. <i>“Why not try to make a connection?”</i> She says the ExtraMeet motto with a thick accent.");
	output("\n\nAfter talking a few minutes, you manage to deduce very little else about your mysterious friend. From what you can tell, she is on her own and doesn’t seem to be a part of a tribe. Why that is you can only imagine.");
	output("\n\n<i>“Fussana.”</i> The korgonne gives you a big smile and points at you. <i>“Fussana.”</i> She then turns her finger on herself. You don’t understand the small woman and give her a blank stare. The korgonne twists her face in thought. She reaches around to her backpack and digs around, pulling out a long green stone affixed to thick leather straps. You stare at it a moment, taking it the sight of it: It’s a savicite strap-on.");
	output("\n\nShe points down at the stone phallus, then to you, then back to her. <i>“Fussana. Fussana, Fuka.”</i> She slides the toy along the table towards you, licking her lips. Well that you understand.");
	
	if(!CodexManager.entryUnlocked("Korgonne")) 
	{
		output("\n\nYour codex beeps to inform you it’s identified the Korgonne race.");
		CodexManager.unlockEntry("Korgonne");
	}
	
	processTime(10);
	addButton(0,"Take the toy",extrameetFukaSex,undefined,"Take the toy","Use the toy with Fuka");
	addButton(14,"Bail",extrameetBailScene);
}
public function extrameetFukaSex():void
{
	clearOutput();
	clearMenu();
	//showName("Fuka");
	showName("\nFUKA");
	author("Fr0sty");

	moveTo("UVI N32");
	output("You take ahold of the stone toy, getting a closer look at it. It wasn’t just phallic, it was carved to look almost exactly like a korgonne cock. You feel your fingers grow warm holding, the properties of the savicite already affecting you.");
	output("\n\n<i>“Follow. Follow.”</i> You look up and see Fuka has hopped off her chair and is bidding you to follow her. Toy in hand, you stand and trail behind the tiny woman.");
	output("\n\nYou head outside, unsure where the korgonne is leading you. She takes you down a narrow street and slips inside an abandoned looking building. You follow her inside and take a look around. From what you can tell the korgonne is squatting here, a large pile of furs places near an artificial fireplace. Fuka starts pulling off her backpack and coat, then turns to you and motions for you to do the same.");
	output("\n\nYou shrug and remove all your gear, standing naked in front of the short furry woman. She finishes taking her own clothing off and turns to you with her hands on her hips. She was thinner than you expected, based on her living situation you suspect she might be skipping meals. Despite being the thinnest korgonne you’d ever seen, she is still plenty thick where it matters with an impressive bosom and meaty thighs. Fuka lays down on the pile of furs by the fire, licking her lips.");
	output("\n\nYou then remember the savcite toy. You pick it back up, running your fingers along it. Your face feels warm, the properties of the rock once again making your blood warm. You decide to slip the toy on and see how it suits you. Once it’s strapped to your [pc.hips] you feel your breath start to quicken and your [pc.skinFurScales] tingle. Such a large stone pressing against your groin is effecting you more than you thought. You turn back to Fuka, the small woman smiling at you from her fur bed with her furry thighs spread wide. Her fingers reach down, spreading her blue cunt wide for you. You feel a shiver run up your spine, unsure it its from the savicite or her.");
	output("\n\nWith animal instinct, you move in on the small woman, moving quickly and dropping down between her thighs. As you descend on her the small woman lets out a small gasp of surprise, jumping as the tip of the green toy touches her sex. Without even thinking, you push your hips forward, pressing the thick green toy into her. Fuka gasps, wrapping her furry arms around your neck as you move in on her. You can’t feel it, but based on how well the toy slides she must already be wet. The savicite seems to heat up, in turn making you feel hotter as well.");
	output("\n\nYou feel sweat starting to build on your brow and your body shivers. The stone is burning against your crotch now, and it radiates heat throughout your whole body. Without even thinking, you start to buck your hips, your body running on autopilot as your thoughts become a haze of lust. Below you the furry korgonne gasps for breath, her chest heaving up and down. The stone is affecting her worse than you, and before long she’s crying out in pleasure. Your body fills with new energy, spurred on by her lusty moans. You thrust faster and faster into the woman’s cunt, the stone warming up from it more with each passing moment.");
	output("\n\nFuka shudders beneath you, her grip around your neck tightening. She starts to call out something in her language you can’t understand. Her cries only make you feel more burning pleasure, your body shaking uncontrollably from the cunt warmed stone. Your vision starts to blur, the world shifting out of focus. Unable to stop, you keep thrusting, spurred on by sexual energy alone. Fuka calls out something you do understand. <i>“More! More!”</i> Her furry legs lift up and wrap around your waist, her thick thighs clenching you. <i>“More!”</i>");
	output("\n\nYou don’t stop. You can’t stop. Exhaustion starts to set in, but you don’t seem to run out of energy. Each breath you take is labored, the air feeling thick and heavy in your lungs. The small woman shudders beneath you again, her thighs squeezing you so tight you feel like she may break you. Finally, your hips go still and you collapse onto the small furry woman, the room around you going dark.");
	output("\n\nWhen you open your eyes you are on your back. You feel yourself covered in sweat, and something a bit more sticky down between your thighs. Fuka is nestled up against you, snoring lightly. Her head is resting on your shoulder, with her leg up over you and her chest pressing against you. Looking down you see she removed the savicite toy from your waist, but see no trace of it. The small woman stirs and lifts her head, her eyes fluttering open. <i>“Date? Gaha no tissi?”</i>");
	output("\n\nYou chuckle, not understanding the furry woman. <i>“I have no idea what that means.”</i>");
	output("\n\nFuka give you a curious look, then lifts herself off of you. She leans in and gives you a quick kiss on your lips. <i>“Date good. Fuka happy.”</i> She kisses you again, longer this time and with a bit more passion. Pulling her lips off you, the small woman springs up off the pile and pads over to her clothes, starting to dress herself. You pull yourself to your feet and gather up your own equipment.");
	output("\n\nShe gives you a hug, the short woman wrapping her arms around your waist. <i>“We do more. Date fussana Fuka more. Fuka fussana Date too.”</i> She gives you a curious smile, and licks her lips. You bid your farewells to Fuka and head out into the freezing air, tempted to take the furry woman up on her offer. Next time.");

	pc.orgasm();
	sweatyDebuff(1);
	if (pc.hasCock()) pc.applyCumSoaked();
	if (pc.hasVagina()) pc.applyPussyDrenched();
	processTime(240 + rand(120));
	
	IncrementFlag("EXTRAMEET_SEX");
	IncrementFlag("EXTRAMEET_CUNT_GIVE");
	addButton(0,"Next",mainGameMenu);
}

//ScienceRulez41
//[EXTRAMEET_SCIENCERULEZ41]
public function extrameetScienceRulez41Profile():void
{
	output("The profile picture on your screen is a full body picture of a rather nerdy looking human. His brown hair is quite unkept, and he is wearing thick round glasses. You note his arms seem to be covered in pinkish scales, and his eyes appear like reptilian slits. He is also wearing a T-shirt that reads “What’s the matter? EVERYTHING!”");
	output("\n\nUsername: ScienceRulez41");
	output("\nSex: Male");
	output("\nAge: 35 Years");
	output("\nRace: Human+");
	output("\nPlanet: Uveto");
	output("\n\nBio:");
	output("\nSingle man looking for an intellectual companion. Prefer things that are new and exciting that make my science boner tremble. (Real boner available as well :D)");
}
public function extrameetScienceRulez41CheckMatch():Boolean
{
	//has cunt tail
	if (pc.hasTailCunt()) return true;
	else return false;
}

public function extrameetScienceRulez41Date():void
{
	//showName("ScienceRulez41");
	showName("SCIENCE\nRULES 41");
	author("Fr0sty");
	moveTo("UVI P32");
	output("You enter The Freezer and spot the familiar nerdy man sitting on his own, nervously looking around the bar. He spots you and throws up his arm to wave, signaling you over. As you make your way across the bar to him you size the man up, noticing he has combed his hair and is dressed in expensive and fancy clothing. You also see he is sporting what looks like a monkey’s tail, and his fingers appear to be webbed. You can’t help but wonder what else is different about this man.");
	output("\n\nWhen you reach the table he jumps up and introduces himself. <i>“Hello! Wow! You look great. Please take a seat. Oh! I’m Hal. Dr. Hal Tucker.”</i> He sits back down and runs his webbed fingers over his hair, trying to keep it neat. <i>“I hope I’m not overdressed...”</i>");
	output("\n\nYou take a seat across from the man and tell him he’s fine then introduce yourself.");
	output("\n\n<i>“Ah yes! I guessed that from your profile. But you weren’t exactly trying to hide it.”</i> He shifts in his seat, appearing to be nervous over something. <i>“So tell me, what brings you to this neck of the woods? Little cold for tourism.”</i>");
	output("\n\nYou tell your date a bit about the probes and your quest for your inheritance. You end up trailing onto more general things about yourself, and Hal seems to listen quite intently. You notice him chew his lip at a few points, and suspect it to be something of a nervous tick. After a few minutes of talking you ask him what he does.");
	output("\n\n<i>“Oh. Well. I’m a Biologist. I’m here to study... Well biology.”</i> He clears his throat, and you notice a bit of sweat on his brow. <i>“Specifically, my field of research is focused on how organisms from separate ecosystems can be made to... Ehm... It’s complicated.”</i> He turns his head and scratches his neck, accidentally showing off a set of gills you didn’t notice before.");
	output("\n\nYou decide to ask the nervous man about the odd additions to his body, hoping that topic might be something he’s comfortable with.");
	output("\n\nHe seems startled by your question, but answers all the same. <i>“Oh, well I um... I add things to myself I find useful to my research, or provide some sort of function. Many I remove after a short while, but others I keep.”</i> He clears his throat. <i>“One that topic... If I may ask... I’ve been admiring your tail...”</i>");
	output("\n\n<i>“My tail?”</i> You turn your head and regard your extra appendage, giving it a small wag. <i>“What about it?”</i>");
	output("\n\nHal scratches his neck again, his face going slightly pink. <i>“I saw it, and um... Well I was wondering if you would allow me to... study it... closely.”</i> He starts chewing his lip again, his reptilian eyes fixated on your tail cunt. Clearly his interest is more than scientific.");
	
	processTime(15);
	addButton(0,"Allow him",extrameetScienceRulez41Sex,undefined,"Allow him to inspect it","Have some fun with your cunt tail");
	addButton(14,"Bail",extrameetBailScene);
}
public function extrameetScienceRulez41Sex():void
{
	clearOutput();
	clearMenu();
	//showName("ScienceRulez41");
	showName("SCIENCE\nRULES 41");
	author("Fr0sty");

	output("You tell him you’re fine with him taking a look, causing the scientist to nearly bounce in his seat from joy. He gets up and drags his chair closer to you, sitting directly beside you now. The man holds out his scaly hands, smiling at you. You move your tail towards him, letting your extra appendage come to rest in his waiting palms.");
	output("\n\n<i>“Oh my.”</i> He runs his fingers along the lips of your tailcunt, his smooth scales caressing you gently. <i>“Interesting responsiveness. Tell me: do you feel this?”</i>");
	output("\n\nYou tell the curious scientist you do, and indeed you feel his soft touch. His fingers move with more certainty, gently pulling apart your lips. The sensation makes you twitch, but you are still a long way away from feeling anything close to pleasure.");
	output("\n\n<i>“Fascinating.”</i> You feel his thumb start to move inward, exploring your sensitive folds. This new touch makes you quiver, the smooth scales teasing the sensitive cuntflesh on your tail. Hal continues to massage your tail’s folds, seemingly both examining it and attempting to tease you. Your tail reacts to his touch, wiggling in his grasp and drooling wetness. Waves of light pleasure ripple up the appendage to you, making you squirm in your seat. You close your eyes and savor the touch, letting the man have his way with you.");
	output("\n\nHis thumb presses in deeper, your wet tailcunt almost sucking it in. You gasp softly, feeling your twat clamp down on his thick digit on its own. He shifts it around inside your tight tailcunt, teasing and testing your senses. Tingles travel up your spine, and you feel your face flush. You barely register the sound of a zipper, and only faintly notice Hal lowering his hands. Your tail, spurred on by the mind of its own, notices and takes action, spitting out Hal’s thumb at lunging for a more filling target.");
	output("\n\nYou almost fall out of your chair, taken completely by surprise by the thickness filling your eager cunt. You open your eyes and see Hal’s pants undone, and the base of a very long and thick shaft being taken in by your tail. Mottled spots line the base of the scientists modded cock, telling you at a glance that it’s equine in nature. Hal’s hands are still on your tail, and he is enthusiastically moving it up and down along his solid length. You feel your extra appendage burn with waves of strong pleasure, sending the sensation all the way back to you. You gasp, a shiver running up your spine as your face grows warm. The mass of cock meat in your tail twat throbs and Hal continues to fuck away, groaning in pleasure.");
	output("\n\nThe modded man’s groans become a shaking moan, as you feel his thick horse cock pulse in your tail. The hungry appendage twitches and quivers as Hal’s warm seed pumps into it, the warmth of his jizz taking you by surprise. Your body convulses, and a deep gasping moan escapes your lips. Shuddering, your orgasm ignites in your tail, trailing up its length and making your whole body burn with lascivious pleasure. Hal keeps stroking himself with your tail, milking out his cock for all it’s worth and subjecting you to more of the addicting sensation. After a long moment he stops and releases your tail, his now semi soft member popping out. His cum oozes out of your tailcunt, staining his lap.");
	output("\n\nHal stuffs himself back into his pants, seemingly not bothered by the mess in the least. <i>“Well. I must say that is a very interesting tail.”</i> He clears his throat and smiles at you.");
	output("\n\nYou take a few deeps breaths, still shaky from the scientist’s examination. You pull your tail back, the well fed appendage seemingly quite pleased and docile.");
	output("\n\nThe two of you sit and talk a bit more, mostly about mods and such. After a while, Hal says he needs to go and bids you farewell. <i>“If you’re in the neighborhood look me up. I’d be very curious to see what other unique additions you may stumble onto.”</i> He gives you a lewd smile and stands, walking out of the bar with a wave leaving you on your own.");
	
	//since cock volume doesn't matter and we just need cum amount, just use MrFox
	pc.loadInCuntTail(chars["MRFOX"]);
	pc.orgasm();
	pc.exhibitionism(2);
	processTime(30 + rand(15));
	
	IncrementFlag("EXTRAMEET_SEX");
	IncrementFlag("EXTRAMEET_CUNT_RCVD");
	addButton(0,"Next",mainGameMenu);
}

//Ripped4YourPleasure
//[EXTRAMEET_RIPPED4YOURPLEASURE]
public function extrameetRipped4YourPleasureProfile():void
{
	output("The profile picture on your screen is of a shirtless black haired Huskar. His skin is pale, and his muscles quite well defined. It looks like he’s flexing, clearly trying to show off.");
	output("\n\nUsername: Ripped4YourPleasure");
	output("\nSex: Male");
	output("\nAge: 25 Years");
	output("\nRace: Huskar");
	output("\nPlanet: Uveto");
	output("\n\nBio:");
	output("\nLike what you see ladies? Swipe right and I’ll show you more.");
}
public function extrameetRipped4YourPleasureCheckMatch():Boolean
{
	//non taur with vagina
	if (!pc.isTaur() && pc.hasVagina()) return true;
	else return false;
}

public function extrameetRipped4YourPleasureDate():void
{
	//showName("Ripped4YourPleasure");
	showName("RIPPED FOR\nYOUR PLEASURE");
	author("Fr0sty");
	moveTo("UVI P32");
	output("You enter The Freezer and take a quick look around for your date. He’s pretty hard to miss. The Huskar is certainly muscular, and he accentuates it by wearing a t-shirt you estimate to be at least two sizes to small. He seems to spot you, so you hurry on up and make your way over. As you reach the table he pops up to his feet, revealing himself to be of average height.");
	output("\n\n<i>“Hey cutie. I’m Rorg.”</i> His muscles seem to twitch, and you’re unsure if it was a voluntary flex or not. <i>“Glad you could make it, why don’t you take a seat?”</i> He pulls out a chair for you in a decently polite gesture.");
	output("\n\nYou sit down, scooting in your own chair while the muscular doggy boy also plops back down. Following his example you go ahead and introduce yourself.");
	output("\n\n<i>“Hm. Nice name. Has a ring to it.”</i> Rorg leans in, the fabric on his shirt straining against his inflated body. <i>“So what’s a cutie like you doing on a frozen mess like this?”</i>");
	output("\n\nBased on his body language, you can tell he’s more interested in flirting than hearing about why you’re here. You decide to give him a simple answer, just to keep things moving along. <i>“Just passing through, seeing what’s out here.”</i>");
	output("\n\n<i>“That so?”</i> Rorg shifts in his seat, his muscles twitching again. You’re pretty sure he’s showing off. <i>“See anything you like?”</i>");
	output("\n\nAgain, you opt for a simple answer. <i>“A few things.”</i>");
	output("\n\n<i>“Only a few huh? Well, I could show you a couple of very interesting things.”</i> His flexing continues, now he doesn’t even seem like he’s trying to hide it.");
	output("\n\nYou see how this is going. He really isn’t interested in idle conversation.");
	
	processTime(5);
	addButton(0,"Touch muscles",extrameetRipped4YourPleasureSex,undefined,"Touch his muscles","Touch his muscles and move on to other things");
	addButton(14,"Bail",extrameetBailScene);
}
public function extrameetRipped4YourPleasureSex():void
{
	clearOutput();
	clearMenu();
	//showName("Ripped4YourPleasure");
	showName("RIPPED FOR\nYOUR PLEASURE");
	author("Fr0sty");
	//find the vag he fucks
	var vag:int = pc.cuntThatFits(chars["RIPPED4YOURPLEASURE"].cockVolume(0));
	if (vag < 0) vag = rand(pc.vaginaTotal());
	
	
	output("Deciding to just come down to his level, you ask if you can feel his muscles.");
	output("\n\nThe Huskar’s eyes light up instantly, and he smiles so wide you think you can see his back molars. He drops his arm down on the table between you and flexes, his bicep nearly ripping his shirt. Trying not to roll your eyes, you reach out and give it a feel.");
	output("\n\n<i>“Oh.”</i> While you knew what you should have expected, somehow touching it is far more tantalizing that you expected. It’s big and firm sure, but also very well formed and sculpted. Without even realizing it, you start to blush.");
	output("\n\n<i>“Nice huh?”</i> Rorg’s voice knocks you out of a trance. <i>“If you want to go somewhere a bit more private, I’ve got some other things you can touch.”</i>");
	output("\n\nSomething tells you he isn’t shy about letting people touch any part of him in public, and his request for privacy is likely for much more lewd endeavours. Still, you can’t help but smile and agree to go with him.");
	output("\n\nThe Huskar pulls his arm away and stands, looking around the bar. <i>“Follow me then.”</i> He turns and walks away, heading towards the far end of the room. You can’t help but watch him for a moment. His ass is large, and it looks so powerful you suspect he could crush a walnut between his cheeks. You shake off your daydream and pull yourself to your feet, following him.");
	output("\n\nRorg slips into the men’s room and out of sight. You hesitate for a brief moment, but follow anyways. When he said private, he must not have meant very private. You walk in and don’t see him anywhere, but think you hear him in one of the stalls. Moving over to the stall door, you push it open and get a very big eyeful of a buck naked Rorg. You feel your face immediately burn from blushing so hard, and between your legs you feel a bit of warmth as well.");
	output("\n\nRorg is very well muscled and toned, which you already guessed, but to cap it all off he is packing a very impressive, and very hard, doggy cock. <i>“Hey.”</i> The Huskar puts his hands on his hips. <i>“So. Like what you see?”</i> Your face still flushed, you decide to answer the nude man by stripping off your gear and letting it fall to the floor, then closing the stall door behind you.");
	output("\n\nMoving in close, placing your hands on his very firm chest, your heart skipping a beat as you feel his pecs. In return, the Huskar’s hands move to your [pc.hips], giving them a very gentle touch with his furry fingers. Your own hands trail downwards, running along his tight six pack towards something else hard and firm. Your fingers take hold of his impressive ausar prick, and it might just be the hardest and best formed thing about him. You can’t help but chuckle, thinking about what sort of exercise he must do to work out his cock.");
	output("\n\nYou thoughts are cut off by your feet lifting off the floor, while you let out a small cry of surprise. Rorg, has seized your hips and now lifts you up, pressing your back against the side of the stall. <i>“Hope you don’t mind me showing off.”</i> He gives your thighs a firm squeeze with his strong arms. <i>“I can show you how I got this ripped.”</i> You feel him prod you with his doggy dong, his flared crown pressing against your cunt. He licks his lips, unable to hide his excitement as he pushes his rock hard member against you. You feel your cunt quiver, growing wet and eager at the promise of Rorg’s thick bone. You don’t have to wait long, as Rorg moves his hips closer and slips his cockhead in.");
	
	pc.cuntChange(vag, chars["RIPPED4YOURPLEASURE"].cockVolume(0), true, true, false);
	
	output("\n\nThe feeling of thick cock meat penetrating you makes you cry out in pleasure. Rorg holds you aloft, barely even fazed by your weight, as he slides himself deeper into your hungry cunt. He pushes himself in up to his knot, the mass of cock flesh threatening to pop in. Instead, your strong ausar lover starts to move his arms, literally curling you by your thighs. As you rise up and down, Rorg’s cock slides in and out of you, the muscle headed ausar thinking up a fun way to fuck you and show off. You barely notice, throwing your arms over your date’s shoulders, holding on for the lascivious ride. He starts off slow, lifting you up with measured curls, but after a few minutes he starts to speed up and at alarming rate, the ausar starting to huff with each breath.");
	output("\n\nYour own breathing starts to quicken as well, as warm waves of sinful pleasure radiate from your cunt. Sweat from both you and Rorg mix together as you lean against him, your arms wrapped tightly around his strong shoulders. You feel him start to strain, his breathing starting to become labored. He isn’t going to last much longer. He seems to dig deep and starts to move you up and down faster, going for broke. You hold on tight, moaning as your pussy takes a pounding from the meaty doggy cock. A shiver runs up your spine and you feel yourself start to shudder, the heat inside you on the brink of exploding. Before that happens, Rorg gives you one last surprise, dropping you low and impaling you all the way down onto him, burying his knot deep inside you.");
	output("\n\nThe surprise mass of cock flesh makes you scream out, first in pain but then in pleasure as the forceful knotting throws you over the edge. Your head falls forward against your lover as you shake uncontrollably, lost in a sea of bliss as your body shakes from the intense pleasure. Rorg lets out a loud shuddering moan, and you feel his buried bone start to throb inside you as he lets loose and blows inside of your cunt. You can’t help but bite your lip and moan as the ausar fills you with his seed, the thick and sticky cum feeling warm inside of you. Rorg leans both of you against the stall wall, breathing heavy and covered in sweat. <i>“Might be a few minutes for the knot...”</i>");
	output("\n\nRorg holds you up while his canine cock deflates, the ausar straining to hold you by the end. Even he, as impressive has he is, has limits after all. Once he’s able, he pulls himself out and sets you down on your feet before almost collapsing down on the toilet. <i>“So. You impressed?”</i> He lifts up his arm and flexes his bicep, shooting you a wink.");
	output("\n\nYou roll your eyes and gather up your gear, pulling it back on and over your sweat coated body. Once you’re dressed you turn back to Rorg, who’s still seated on the toilet and looking rather tired. <i>“You go on ahead.”</i> He sighs and wipes off his brow. <i>“Need to cool off for a while. It was fun. Maybe next time can be leg day.”</i> He gives you a lewd smile, and you can’t help but picture a way or two he would be able to manage that.");
	output("\n\nYou open up the stall door and bid him goodbye, leaving him there like he asked. Taking a moment to adjust your gear, you then make your way out of the washroom and back to the main bar feeling a bit of a wobble in your step.");

	processTime(10 + rand(15));
	pc.loadInCunt(chars["RIPPED4YOURPLEASURE"], vag);
	
	pc.orgasm();
	
	IncrementFlag("EXTRAMEET_SEX");
	IncrementFlag("EXTRAMEET_CUNT_RCVD");
	addButton(0,"Next",mainGameMenu);
}

//Storm_Dragon
//[EXTRAMEET_STORMDRAGON]
public function extrameetStormDragonProfile():void
{
	output("The profile picture on your screen is a headshot of a rather striking Gryvain woman. The give away as to her species is the pair of dark horns sprouting out from her head. Her hair is bright blue, and along her hairline you notice curious runic tattoos.");
	output("\n\nUsername: Storm_Dragon");
	output("\nSex: Other");
	output("\nAge: 102 Years");
	output("\nRace: Gryvain");
	output("\nPlanet: Uveto");
	output("\n\nBio:");
	output("\nWarrior looking for a challenge. Come and test your sword against mine, if you think you’re man enough.");
}
public function extrameetStormDragonCheckMatch():Boolean
{
	//has cock
	if (pc.hasCock()) return true;
	else return false;
}

public function extrameetStormDragonDate():void
{
	//showName("Storm_Dragon");
	showName("STORM\nDRAGON");
	author("Fr0sty");
	moveTo("UVI P32");
	output("You enter The Freezer and take a long look around. While you don’t see your date, you figure you’re early and take a seat. After waiting only a few minutes, your Gryvain date walks through the door. She’s tall, which you expected her to be, and quite curvy, with her gear hugging against her tightly and leaving little to the imagination. After a quick scan of the room she spots you and starts to make her way over with a flick of her long blue tail.");
	output("\n\n<i>“[pc.name] Steele?”</i> She gives you a look up and down, sizing you up.");
	output("\n\n<i>“That’s me. Call me [pc.name].”</i> You return the favor, taking a closer look of the woman. First impression: she’s a fighter, her gear and the way she carries herself tells you that. Curiously, you notice she isn’t carrying a weapon. Or at least one you can see.");
	output("\n\nShe takes a seat across from you, her wings tucking in on her back as she leans against her chair. <i>“You’re strong. You looked tough in your picture, but I wasn’t sure. In person I can tell.”</i>");
	output("\n\nYou can’t help hide your intrigue and question the Gryvain what she means by that, although you already have an idea what she is talking about.");
	output("\n\n<i>“I’ve lived a long time. I know a warrior when I see one, even if they don’t know what they are themselves.”</i> She flexes her right hand, her knuckles making loud audible cracking sounds. <i>“I’ve had my fill of weakness, I prefer the company of the strong.”</i>");
	output("\n\nYou don’t get the feeling she is trying to flatter you, but is just speaking frankly. You also realize that she hasn’t properly introduced herself yet, so you take a moment to ask her for her name.");
	output("\n\n<i>“Pardon my rudeness. I forget my formalities on occasion.”</i> She closes her eyes and bows her head. <i>“I am Sherra of the Stormguard.”</i> She lifts her head back up, her bright eyes gleaming with pride.");
	output("\n\nThe Stormguard part doesn’t surprise you, what with the runic tattoos sort of giving it away. In an attempt to make conversation, you ask her if Stormguard often use dating sites.");
	output("\n\nSherra gives you a deadpan look. <i>“No.”</i>");
	output("\n\n<i>“Ah.”</i> Well that could have gone better. You sit in silence a moment, feeling a bit of awkward tension in the air now. You try again, with a slightly different question. <i>“So, why did you try it out?”</i>");
	output("\n\nThe Gryvain stares at you a moment then shrugs. <i>“Boredom. But isn’t that the reason everybody uses it.”</i>");
	output("\n\nIt’s your turn to shrug. <i>“Some people use it to find love.”</i>");
	output("\n\nSherra lets out a loud laugh, taking you by surprise. <i>“Love? Please. Nobody uses ExtraMeet to find love, they find it to get off.”</i>");
	output("\n\nYou crack a small smile. <i>“Oh really? That how you plan to cure your boredom?”</i>");
	output("\n\nSherra gives you an icy stare, but her lips curl into a curious smile. <i>“It’s part of the plan yes. If somebody proves virile enough.”</i> She leans in, giving you a lusty stare. <i>“Hard part is find somebody up to the challenge.”</i>");
	
	if(!CodexManager.entryUnlocked("Gryvain")) 
	{
		output("\n\nYour codex beeps to inform you it’s identified the Gryvain race.");
		CodexManager.unlockEntry("Gryvain");
	}
	if(!CodexManager.entryUnlocked("Stormguard")) 
	{
		output("\n\nYour codex beeps to inform you it’s identified the Stormguard religion.");
		CodexManager.unlockEntry("Stormguard");
	}
	
	processTime(5);
	addButton(0,"Take challenge",extrameetStormDragonSex,undefined,"Take the challenge","Cross swords with the Gryvain");
	addButton(14,"Bail",extrameetBailScene);
}
public function extrameetStormDragonSex():void
{
	clearOutput();
	clearMenu();
	//showName("Storm_Dragon");
	showName("STORM\nDRAGON");
	author("Fr0sty");
	
	var kok:int = rand(pc.cockTotal());
	
	moveTo("UVIP D38");
	output("You give Sherra a smirk and lean in as well, telling her you accept her challenge.");
	output("\n\nThe Gryvain gives a soft chuckle. <i>“I haven’t even said what the challenge was. Do you always run head first into things?”</i>");
	output("\n\nYou pause for a moment, contemplating her point. You really have no idea what you just agreed to, and considering Gryvain physiology, there are quite a few things it could be. Another soft chuckle breaks your line of thought, and your attention returns to the laughing Sherra. <i>“I like a fighter who charges in head first. Reminds me of myself.”</i> She stands up, spreading her wings out and giving them a stretching flap. <i>“Fret not. I won’t test you in a way you’d find too taxing.”</i>");
	output("\n\nHer choice of words makes you frown, but before you can ask her to elaborate on what she means, she turns on her heel and starts to leave, tail waving behind her. You guess she wants you to follow, so you rise up and chase after her, catching up with a few long strides. Ask she walks you notice her humming under her breath, something alien and ancient. Walking beside her, you ask her where exactly she is leading you. She gives you a funny look and keeps on humming, ignoring your question. You sigh and shake your head, guessing you’ll have to accept that as an answer. The two of you walk for a few minutes, and after a left turn you realize she is taking you outside of town. <i>“Sherra?”</i> You try not to sound concerned, but a little bit of it slips in.");
	output("\n\nThe Gryvain gives you a small smirk. <i>“Relax. It’s part of the test.”</i> She gives you a wink, trying to disarm your concern. As you move past the guard post you feel the chill of the air start to bite; it’s not safe out here. Sherra doesn’t even seem to notice, not shivering in the least. She stops and turns to you, looking around. <i>“This spot will do.”</i> Her hands drop to her crotch and she starts to fiddle with her belt. While you watch her, near dumbfounded, she pulls out her already hard cock, seemingly with no regard for the cold. How she managed to keep her near footlong cock in that tight suit you can’t even begin to fathom. She gives you an expecting look. <i>“Well? Unsheath your sword.”</i>");
	output("\n\n<i>“You’re joking right?”</i> Somehow the idea of whipping out your cock in the freezing winds doesn’t seem like a great idea. Much to your annoyance, Sherra’s expression tells you she isn’t joking. With a small concerned sigh, you fiddle around at your crotch and pull yourself free, your manhood soft in your hands. Getting, let alone keeping, an erection in this wind seems almost impossible, and your cock seems to shrink and shy away in your hand from the winds. You give Sherra a frown. <i>“Now what?”</i>");
	output("\n\nThe curvy woman starts to stroke herself, giving you a shit eating grin. <i>“What’s wrong, Steele? Can’t get it up?”</i> She takes a few steps towards you, standing so close the tip of her cock is almost touching you. <i>“Not used to the cold hm? Care for a bit of assistance?”</i> Sherra gives you something close to bedroom eyes, but something in her tone is unnerving. In your hand you feel your dick twitch, signs that the cold hasn’t completely defeated you. A spark of determination stokes the forge of lust inside you, and with renewed purpose you start to stroke your [pc.cockShape " + kok + "] phallus. The Gryvain woman gives you a nod, seemingly happy you’re up to the challenge.");
	output("\n\nThe cold winds bite hard, but you keep pounding your meat to the best of your ability. Signs of life from your manhood turn into something more tangible fairly quickly. You feel yourself grow in your hand, hardening up slowly but surely. Friction from your hand warms up your sensitive cockflesh, fighting against the cold air in some measure. Sherra watches you closely, still stroking away at her own member, but never taking her eyes off your growing cock. After a few hard fought minutes you reach full mast, and your proudly show yourself off to the attentive Gryvain. Unfortunately, you have to keep stroking away, mostly to keep yourself warm rather than hard. A gust of wind hits you, sending a strong shiver through your body, and almost causing your boner to fail. You grit your teeth and fight through it, holding firm and hard.");
	output("\n\n<i>“Impressive.”</i> Sherra lets go of herself, leaving her cock hanging out on its own. <i>“Here, let me help you stay warm.”</i> She reaches out and places her hands on your shoulders, running her fingertips along you slowly. Her touch is deliberate, her hands moving along your collarbone with purpose and focus. Before you get a chance to enjoy it, Sherra gives you a strong push, sending you falling backwards into the snow. You let out a small cry as you fall backwards, and then a louder one when you hit the cold snow. The shock makes your whole body tense and twist in pain, and you feel your cock seem to deflate almost instantly. Out of the corner of your eye you see a flash of blue, which you quickly surmise is Sherra pouncing on top of you when the Gryvain’s tapered cock pops up an inch from your face. Without missing a beat you feel a powerful warmth on your chilled member, as Sherra leans in and pops your cock in her mouth.");
	output("\n\nThe surprise blowjob makes all the cold in your body seem to fade away. Sherra bobs her head up and down, eagerly sucking your [pc.cock " + kok + "] like a hungry animal. Warmth spreads up from your loins, spreading throughout your body along with waves of pleasure. Moaning softly, you stare up at the cock above you. Sherra gives her hips a small wiggle, a not so subtle hint that she would like you to return the favor. With one last deep breath, you tilt your head up and open wide, letting Sherra’s reptilian cock slide into your mouth.");
	output("\n\nFor a brief moment you almost gag, the Gryvain’s thick meat catching you off guard. You adapt to it quickly, composing yourself and starting to move your neck back and forth along her length. Her cock is warm in your mouth, and with Sherra sucking you off below you don’t even notice the fact your laying down in a snowdrift. After a moment, she lowers down her rear, giving you and easier time working her pole, but also pushing herself nearly into your throat for a moment. While it only staggers your efforts for a moment, Sherra quivers on top of you when you take slightly more of her shaft in, clearly liking when she hits your throat. For your own part, you find her addictively delicious and sinfully juicy. What started off as returning the favor quickly shifts as you start eagerly sucking away at Sherra’s powerful manhood.");
	output("\n\nThe warrior woman seems appreciative of your enthusiasm and doubles down on your [pc.cockShape " + kok + "] member");
	
	if (pc.balls > 0) output(", blowing you with such vigor you’d think she was trying to suck the cum right out of your [pc.balls]");
	
	output(".");
	output("\n\nNot willing to be outdone, you open your throat wide and try to take in as much of the massive prick in your mouth as possible, letting it slide into your throat. Sherra shivers on top of you, and you know damn well it’s not from the freezing wind. In retaliation, or appreciation perhaps, she pushes her face downward, deepthroating you in turn. Now it’s your turn to shiver in pleasure, the warmth of the back of the Gryvain’s throat distracting you enough that you nearly gag on the juicy meat in your mouth. Neither of you back down, trying to suck as much of the other’s cock in as possible in a destructive, and depraved, test of one upmanship.");
	
	if (pc.balls > 0) output(" A burning tightness in your [pc.balls] tells you it isn’t going to last.");
	
	output("\n\nNot willing to cum first, you go for broke and take all of her length, hilting the near footlong cock deep into your throat. That was all it took. You hear a muffled moan while she shudders on top of you, and you feel her thick meat throb in your throat. The next thing you feel is warmth, and a lot of it, as she unloads herself straight down your neck. Her hot spunk fills your belly, burning away any last remains of chill you feel. Before she even finishes pumping you full, you feel yourself succumb to your pleasure and climax. Your own orgasm produces a heat that rivals the warmth in your stomach as your cock explodes in Sherra’s throat. The lusty woman swallows your seed eagerly, muffled moans coming from the back of her throat. She’s not the only one, as you find yourself moaning in depraved bliss while near choking on Sherra’s juicy schlong.");
	output("\n\nA few long moments later the Gryvain woman pops your cock out of her mouth and slowly starts to rise, her semi hard cock sliding out of your throat like a sword being unsheathed. You can’t help but cough as she removes herself, breathing properly for the first time in many minutes. Sherra rises to her feet and moves away from you, leaving you on your back in the cold snow. Once again you’re reminded of the painful bite of the cold, but the warmth of Sherra’s deposit into your belly seems to help fight off the chill. Off to the side you hear the tall woman speak. <i>“I came first. I guess you won. I’m impressed.”</i> You lift yourself up into a sitting position, watching the Gryvain stuff herself back into her suit. <i>“Next time we cross swords it’ll be different. For now, congratulations and farewell.”</i>");
	output("\n\nSherra turns and walks away leaving you alone, and a little bewildered. You pull yourself to your feet, brushing off snow that has built up on your body. A cold wind blows sending your body into a shivering fit. You really need to get back to town.");

	processTime(30 + rand(15));
	pc.loadInMouth(chars["STORMDRAGON"]);
	pc.orgasm();
	
	IncrementFlag("EXTRAMEET_SEX");
	IncrementFlag("EXTRAMEET_ORAL_RCVD");
	IncrementFlag("EXTRAMEET_ORAL_GIVE");
	addButton(0,"Next",mainGameMenu);
}
//uveto flavor

//LoveBelow0
//[EXTRAMEET_LOVEBELOW0]
public function extrameetLoveBelow0Profile():void
{
	output("The profile picture on your screen is of a rock hard canine cock. While maybe a bit larger than average, it’s nothing overly impressive.");
	output("\n\nUsername: LoveBelow0");
	output("\nSex: Male");
	output("\nAge: 24 Years");
	output("\nRace: Huskar");
	output("\nPlanet: Uveto");
	output("\n\nBio:");
	output("\nHello ladies.");
}

//Assblaster
//[EXTRAMEET_ASSBLASTER]
public function extrameetAssblasterProfile():void
{
	output("The profile picture on your screen is an overhead selfie of a very large man of an indeterminate race. Spliced to the teeth, one thing you do take note of is a massive bulge in his pants.");
	output("\n\nUsername: Assblaster");
	output("\nSex: Male");
	output("\nAge: 45");
	output("\nRace: Ausar+");
	output("\nPlanet: Uveto");
	output("\n\nBio:");
	output("\nLooking to meet local men for intimate relations. Recently single, so I might be a little awkward at first, but I warm up very well.");
}

//Granite75
//[EXTRAMEET_GRANITE75]
public function extrameetGranite75Profile():void
{
	output("The profile picture on your screen is of a potted plant. Closure inspection on the fern makes you suspect it might be a drug of some kind.");
	output("\n\nUsername: Granite75");
	output("\nSex: Male");
	output("\nAge: 18 Years");
	output("\nRace: Huskar");
	output("\nPlanet: Uveto");
	output("\n\nBio:");
	output("\nLooking to start selling some fine green. Swipe right to set up a meet.");
}

//supaXstar
//[EXTRAMEET_SUPAXSTAR]
public function extrameetSupaXstarProfile():void
{
	output("The profile picture on your screen is a body shot of a slightly chubby woman. She appears human, and despite being slightly overweight has a fairly decent body.");
	output("\n\nUsername: supaXstar");
	output("\nSex: Female");
	output("\nAge: 20 Years");
	output("\nRace: Human");
	output("\nPlanet: Uveto");
	output("\n\nBio:");
	output("\nLooking for a REAL man. Must be loyal and honest. Not here for hookups, so don’t swipe right if all you want is sex.");
}

//Hall9001
//[EXTRAMEET_HALL9001]
public function extrameetHall9001Profile():void
{
	output("The profile picture on your screen is of... a computer monitor?");
	output("\n\nUsername: Hall9001");
	output("\nSex: Other");
	output("\nAge: 147 Years");
	output("\nRace: Automaton");
	output("\nPlanet: Uveto");
	output("\n\nBio:");
	output("\nGreeting organics. I am searching for compatible persons for romantic engagements. Metrics of compatibility are measured on a 200 point scale. I do not have sexual equipment.");
}

//HelloImPaul
//[EXTRAMEET_HELLOIMPAUL]
public function extrameetHelloImPaulProfile():void
{
	output("The profile picture on your screen is of a reasonably attractive older man on a beach, likely a vacation photo given the planet’s lack of beaches. He’s not really that old, just older. Partially in frame is a woman, mostly cut off, but seems to be holding onto his arm.");
	output("\n\nUsername: HelloImPaul");
	output("\nSex: Male");
	output("\nAge: 42 Years");
	output("\nRace: Human");
	output("\nPlanet: Uveto");
	output("\n\nBio:");
	output("\nExperienced man looking for local woman. Eager to meet new people and try new things. Younger women prefered.");
}

//Lonely1
//[EXTRAMEET_LONELY1]
public function extrameetLonely1Profile():void
{
	output("The profile picture on your screen is a rather MILF-y looking woman on a beach, likely a vacation photo given the planets lack of beaches. You can tell she’s older, but still very good looking. Although you can’t see who it is, she is holding onto an arm in the picture.");
	output("\n\nUsername: Lonely1");
	output("\nSex: Female");
	output("\nAge: 40 Years");
	output("\nRace: Human");
	output("\nPlanet: Uveto");
	output("\n\nBio:");
	output("\nLonely housewife looking for somebody willing to take me out and make me feel special. Discretion is a must.");
}

//Hansi
//[EXTRAMEET_HANSI]
public function extrameetHansiProfile():void
{
	output("The profile picture on your screen is blank.");
	output("\n\nUsername: Hansi");
	output("\nSex: Male");
	output("\nAge: 34 Years");
	output("\nRace: Kaithrit");
	output("\nPlanet: Uveto");
	output("\n\nBio:");
	output("\nJust lookin’");
}

//Domme_90
//[EXTRAMEET_DOMME90]
public function extrameetDomme90Profile():void
{
	output("The profile picture on your screen is of a very angry looking Dzaan. She’s beautiful, but her expression reads more as hostile rather than sexy. Like, really hostile.");
	output("\n\nUsername: Domme_90");
	output("\nSex: Other");
	output("\nAge: 82 Years");
	output("\nRace: Dzaan");
	output("\nPlanet: Uveto");
	output("\n\nBio:");
	output("\nWho the hell wants to live on a frozen shit stain like this? On world for a week, looking for somebody to keep my bed warm.");
}

//BigDickRick
//[EXTRAMEET_BIGDICKRICK]
public function extrameetBigDickRickProfile():void
{
	output("The profile picture on your screen is of a man holding his cock next to a ruler. Apparently, he’s 10 inches long. Good for him!");
	output("\n\nUsername: BigDickRick");
	output("\nSex: Male");
	output("\nAge: 34 Years");
	output("\nRace: Human");
	output("\nPlanet: Uveto");
	output("\n\nBio:");
	output("\nThis can be all yours if you swipe right. No dudes, no exceptions. I don’t care how cute you are.");
}