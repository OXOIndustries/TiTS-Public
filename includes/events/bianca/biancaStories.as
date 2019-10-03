/**
 * The followings topics can't be accesed from random encounters,
 * but they're still coded as if they were for consistency (and maybe
 * easier future porting)
 *	-LF
 */

public function storiesOfFloofAndStoriesOfDocs(inRandomEncounter:Boolean = false):void
{
	clearMenu();
	clearOutput();
	showBianca((inRandomEncounter ? "WORK" : "CASUAL"));
	author("William");
	processTime(18+rand(10));

	// First time
	if (flags["BIANCA_STORIES_TOLD"] == undefined) output("Based on what Bianca’s hinted at in past conversations, she’s had more than a few dangerous encounters in her life. You look across the table, putting together as polite a query as you can: can she tell you such a story?\n\nA brief shuffle and contemplative stirring and Bianca’s gotten her mind and body in order. Her mouth opens but no words come. The doctor visibly ponders answering, but ultimately decides to regale you.");
	// Repeat 
	else output("Asking Bianca to tell you another one of her stories from serving in the military comes easier than the first time. Professionally prideless, she focuses on you intently, shuffling about to improve the connection of your eyes.");

	// Story #1 - The Sabotaged Starport
	if (flags["BIANCA_STORIES_TOLD"] == undefined || flags["BIANCA_STORIES_TOLD"] % 4 == 0)
	{
		output("\n\n<i>“Alright [pc.name], I will tell you about my first, most dangerous deployment.”</i> Bianca guzzles down her water until only half of it is left. <i>“There were many, but this... this was the first time I’d seen such evil.”</i> ");
		output("\n\nDr. Ketria rolls her neck, voice weaving out in a crystal-clear timbre. <i>“Per my training I was stationed on the T.S.C. Destroyer </i>Solace<i> to be instructed by Dr. Jim Malcolm. In accordance with our duties, we were to be deployed to disaster zones, serve in relief efforts, and occasionally reinforce medical staff on other ships performing high-risk missions. <b>It was not a cushy experience.</b> Every day was spent learning and practicing if it wasn’t spent treating the wounded.”</i>");
		output("\n\nHer grip closes tight around the condensating glass. Slitted fox-eyes twitch faster, recalling more than memory. <i>“I was deployed into hazardous combat zones as part of my training with Dr. Malcolm, always under the close protection of soldiers and specialist teams. If we were local to an emergent situation we were deployed of course... but if were were not in the area, we wouldn’t go out of our way unless the situation was sufficiently devastating -- for all of them, we led the way.”</i>");
		output("\n\nYou ask her what constituted ‘sufficiently devastating’. Bianca’s face is then marred by by a misty-eyed frown.");
		output("\n\n<i>“When whole blocks in a city were being torn apart by by armed rioters, to the point that it seemed like civilization as ingrained to us was crumbling to dust and broken glass. When children were considered expendable martyrs. When fringe political activists lashed out in their last, depraved gasps.”</i> Her voice loosens and her hand trembles on the last sentence, <i>“When a fully staffed starport was sent crashing into the planet for no given reason.”</i>");
		output("\n\nThe vulpine doctor exhales, head lowering. <i>“Sorry, that answer makes things seem worse than they are in the U.G.C. -- they aren’t. Over my two training years aboard the </i>Solace<i> I’ve only been involved in a handful of such circumstances. One was in the aftermath of a large pillage and plunder operation on several new colony worlds, two were violent riots, and of course... the starport incident. That is the story I will tell you,”</i> she leans a little closer, <i>“because it is the first time in my life that I felt death was certain.”</i>");
		if (pc.isNice()) output("\n\nYou reach for Bianca’s hand and place your hand atop it");
		else if (pc.isMisch()) output("\n\nYou put a friendly hand on Bianca’s shoulder");
		else output("\n\nYou lean back solemnly");
		output((flags["BIANCA_STORIES_TOLD"] == undefined ? ", telling" : ", reminding") + " her that if the memory is too much she doesn’t need to relive it. The " + (biancaLover() ? "three" : "two") + "-tailed physician simply shrugs, face adorned with a light-red smile.");

		addButton(0, "Next", biancaAndPiros, inRandomEncounter);
	}
	// Story #2 - Studying Period
	else if (flags["BIANCA_STORIES_TOLD"] % 4 == 1)
	{
		output("\n\n<i>“When I began working for the U.G.C., I was stationed aboard a heavy cruiser, the </i>Archer<i>, as the assistant to the chief medical officer Dr. Bradley Adams. In light of recent events, I was put on the fast track for more training and more responsibility. Dr. Adams was sort of an ‘old guard’. Anti-aging treatments enabled him to live well over 200 years and he’d spent a lot of his time as a renowned physician who performed on very wealthy clients in and out of the U.G.C. He was a living monument in the field and I could hardly fathom the depth of his knowledge. You can open any medical compendium and find his name in thousands of references.”</i> ");
		output("\n\nBianca speaks with a deep reverence you’ve not known her to display commonly. <i>“He would be retiring within the year but he wanted to meet with me.”</i>");
		output("\n\nThat’s rather impressive! You ask why he singled her out, aside from the starport incident.");
		output("\n\nBianca meets your stare happily. <i>“He told me he wanted to help me become a teacher for future physicians. He was a friend of Dr. Malcolm and he’d heard of his death. I’d been torn up about it for months. It was hard not to be, I had a personal issue arise in my family just after I joined U.G.C. Med complicating the matter.”</i>");
		if (biancaTalkedTopic(BIANCA_TOPIC_PARENTS)) output("\n\nHer mother passing away at the time couldn’t have made it any easier.");
		else output("\n\nOuch, that’s not a good spot to be in. Bianca shrugs her shoulders and lifts her chin again.");
		output("\n\n<i>“He encouraged me to train myself like a soldier so that I would be more useful in those hazardous situations, just like Jim. He told me it wouldn’t be the last time someone attacked a doctor, and thus he took me under his wing and promised to do right by me until he retired.”</i>");
		output("\n\nBianca stretches her arms out, stifling a yawn out of politeness. <i>“The </i>Archer<i> was home to a very diverse number of members, typically one representative from every U.G.C. member race. It was equipped with a state of the art medical suite and was essentially a ‘school’ ship. The crew learned to live with and cooperate with each other. They were encouraged to share in the cultures of one another, and it also provided the medical staff opportunities to learn their anatomies and methods of treatment. It’s work like that which led to advancements in biology and healthcare as a whole.”</i>");
		if (flags["BIANCA_STORIES_TOLD"] == 1) output("\n\nThis seems like a very cushy experience. You tell Bianca you’re worried now that she’s going to reveal some horrible twist. She just laughs at you, replying, <i>“It’s the tamest of my stories, [pc.name]!”</i>");
		output("\n\nPosing thoughtfully, she stares out at the room. <i>“I enjoyed my time under Dr. Adams. Every hour we spent together he schooled me and many others on the things we’d need to know to better serve the U.G.C., and I took to his encouragement as well. He put in a word with the drill sergeants to help me get into a soldier-worthy shape.”</i> She cracks her knuckles for effect. <i>“I was trained in self defense and firearms to a degree. You may notice that I don’t carry a firearm out here, but that’s because of my drone now. It serves as a powerful deterrent, capable of firing electrical stun bolts, deploying smoke, creating a distracting sound, all sorts of things I programmed into it. I also carry flash grenades in case of the worst.”</i>");
		output("\n\n<i>“But,”</i> she grins, <i>“nothing really compared to what I learned. For a human, and for someone his age, he had the flexibility and nimbleness of a kaithrit. He had the wisdom of a prophet, or an oracle. He never stumbled over his words, never classified anything incorrectly. Nobody could hide anything from him. At his side I learned the ins and outs of every race’s anatomy, treated every known race except the fanfir -- that came later. He was not a stodgy or grumpy man; he had this aura... this gravity of presence. I can’t quite put it into words. For him, there was minimal time to spend on idle chatter and recreation, and yet he took to his work like an android... without any of the apathy. His bedside manner was impeccable. His knowledge was limitless. I was always so giddy when he was impressed by me.”</i>");
		output("\n\nSo what happened after Dr. Adams retired? Did he get to see his retirement?");
		output("\n\n<i>“He did!”</i> Bianca exclaims. <i>“I can’t say enough good things about him. He saved me, in a way. He threw me a rope and helped me move on. After the big party, he asked me to succeed him as the <i>Archer’s</i> CMO and promised that he’d be speaking to the upper echelons about me. It was his recommendation and training that put me on the frontlines again, but somehow... unlike my time in the T.S.C., I felt like that was where I belonged. I had overcome the fear I used to feel and I was just <i>motivated</i>. I was fired up by self-belief!”</i>");
		output("\n\n<i>“Everything I do comes from his training, I think. Not to underscore the importance of Jim’s training, but I felt like Dr. Adams was like a hidden persona of mine. Everything he was, everything he represented... I wanted to embrace it.”</i>");
		output("\n\nThe doctor finally takes a breath. <i>“All of my capability now is thanks to him. Just thinking about it now makes me feel unstoppable!”</i> She clenches a fist. <i>“The opportunity to work under a legend like him, to learn so much in so little time, and to learn to care for myself and my schedules despite all of it... it’s ineffable! I gained an appreciation for routine, learned to respect myself, and, certainly, a new regard for the lives I saved. He brought me out of my pain and molded me slowly into the woman I am today, passing on a part of himself. That’s why he’s a legend. The books will never say that about him, but he’s more than a doctor or a man... and I just don’t have the words for that.”</i>");
		output("\n\nSounds like she’s already turning into a legend herself! Bianca puts a hand to her mouth and hides her bashful state. <i>“It will be a very long time until I am that accomplished, [pc.name]. For now, I’m just fine the way I am, using what has been given to make this galaxy a better place little by little.”</i>");
		output("\n\n<i>“And, thank you,”</i> she squeaks when you’re not looking.");

		finishBiancaStory(inRandomEncounter);
	}
	// Story #3 - The Harvest
	else if (flags["BIANCA_STORIES_TOLD"] % 4 == 2)
	{
		output("\n\n<i>“A few years into my career with U.G.C. Med, I was selected to take part in an exchange program with the J.A.F. I was transferred to the ausar battlecruiser </i>First Dusk<i> where I took charge of their medical facilities. Working on an ausar ship was...”</i> her head swivels, <i>“different. Different... I was the only human aboard, too, and I was worried that they wouldn’t accept me - which”</i>, she gesticulates wildly, <i>“upon retrospect was a very foolish thought - but it was definitely new territory for me.”</i> ");
		output("\n\nDr. Ketria’s face is overcome by a smirking mask. <i>“No, it turned out to be more... fun - that’s the word. Ausar are the best of friends. Plus I think my service there was another important stepping stone in my life, in being less uptight.”</i>");
		output("\n\nWell there’s one way to test that theory -- by asking a very important question: did she touch any of their tails?");
		if (silly) output(" Did she boop any snoots?");
		output("\n\n<i>“Wha... I... uh,”</i> Bianca is, for " + (flags["BIANCA_STORIES_TOLD"] == 2 ? "the first time" : "once") + ", at a loss for words. There’s a long pause (and one eyeroll) until she finally answers a deadpan <i>“I did...”</i>");
		output("\n\nYou give her a hearty congratulation.");
		output("\n\n<i>“Ok, that’s not very relevant, [pc.name],”</i> Bianca glowers at you. Convinced you’ve let off the issue, she begins. <i>“They were, of course, extremely welcoming. I’d heard all the stories and the, err... ‘memes’ about ausar, but being next to them none of these things painted an accurate picture, I found. When they were on duty, they were more diligent than I thought anybody capable of; they all introduced themselves to me on their off time one by one. Well-mannered, loyal to a fault, brilliant men and women one and all.”</i>");
		output("\n\nBianca makes a flat face for a second after seeing your incredulous expression. <i>“Yes, some asked me to pet them.”</i>");
		output("\n\nGood.");
		output("\n\nDr. Ketria sighs and lets the silence hang for a few seconds. <i>“Working on T.S.C. and U.G.C. ships, you’re expected to be in control of your emotions at all times. There’s no room for instability. Being with the Ausar, my entire world was flipped. It’s where I learned to enjoy treating people the way I do as a doctor. Ausar are fiercely responsible, but when their obligations are fulfilled they can’t really hide how they feel, especially in the company of friends.”</i>");
		if (pc.hasTail() && (pc.race() == "ausar" || pc.race() == "huskar" || pc.race() == "half-ausar")) output("\n\nRight now, your [pc.tail] is proving Bianca right the way it thumps against the seat. She lets out a giggle and pats you on the head, too.");
		output("\n\n<i>“My station wasn’t without danger, however.”</i> Bianca claps her hands together in a serious gesture. <i>“The <i>First Dusk</i> was a ship armed to the teeth; the crew was two-hundred strong. Captain Galen was a renowned individual, chosen by the Star King’s family for the captaincy. The purpose of the ship was to protect new colony worlds, per U.G.C. orders, and if not needed, to patrol seedy thoroughfares for pirate activity or respond to high-risk emergency situations requiring a deadlier touch.”</i>");
		output("\n\nYou ask if this was the ship she met her husband Dian on.");
		output("\n\n<i>“It was!”</i> Bianca replies exuberantly. <i>“It was indeed, [pc.name]. I met him near the end of my service two years later... but this story is about something else,”</i> she nods, <i>“my third deployment with one of the squads on an ausar colony. There were reports of abductions taking place. Three colonists had gone missing and overhead craft were heard at night where none should have been. Rather than risk alerting their operation, the captain wisely deployed two commando teams on the outskirts of the town, and we set up discrete listening posts in a twenty mile radius. Nothing was going to pass through without our knowing.”</i>");
		output("\n\nBianca’s face turns to a grave frown as she recalls what came next. <i>“I was attached to one of the teams. There were five of us, specialists each equipped with surveillance and scout gear. The ausar snipers said not a single word when on duty, and spoke only a little bit when they had to rest and eat. As for me, I was kept in the back to keep watch on the equipment, to be available in case anyone was hurt. A week had passed and our unwelcome raiders didn’t, but we wouldn’t leave until we had our target of course.”</i>");
		output("\n\nYou imagine that they were going to show sooner or later. Bianca nods deliberately.");
		output("\n\n<i>“They did. One night, our antennas detected a small vessel moving in from the upper stratosphere, gliding in several miles out without engines to avoid the colony’s radar. The teams waited for it to land and prepared the ambush. Captain Galen ordered them to wait and see, to tail the targets, discover their plans before making the arrest. When the two humans on board the small ship headed towards town, my team placed EMP charges on the vessel to prevent any sudden escape attempt. I accompanied them on board just after, and what we saw there was... utterly abominable.”</i>");
		output("\n\nBianca turns to you, more macabre than her recollection of the Piros Starport. <i>“They were organ harvesters, [pc.name]. The three missing victims had been found on board, what remained of them; two women and one man. We found the containers for their remains, too, frozen and ready for sale. They had every internal organ removed, and their eyes too. I will never know why anyone would do something like that, not when we are at a point where organs can be easily and safely replaced, or even regrown. I’d prefer not to think what it was used for, and I would hope they weren’t made to suffer.”</i>");
		if(flags["BIANCA_THIRD_STORY_THROWAWAY_SEEN_IT_BITCH"] == undefined)
		{
			IncrementFlag("BIANCA_THIRD_STORY_THROWAWAY_SEEN_IT_BITCH");
			output("\n\nGeez, that’s not something you expected her to tell you.");
		}
		else output("\n\nThe grisly tale doesn’t get any easier to listen to.");
		
		output("\n\n<i>“While we wrapped up inside, I heard over comms that the two away men had been taken down when they attempted another abduction. We prepared to move out and call in the </i>First Dusk<i> but the pilot of the ship broke into the room, screaming for all his lung’s worth. He must have been told to take off, that their crime had been exposed. Instead,”</i> she sighed heavily, <i>“he fell to a murderous desire... and I was his nearest target.”</i> A little color has drained from Bianca’s face, and she holds her trembling right hand still by the wrist.");
		output("\n\n<i>“I was a bit surprised by what I did as it all went down.”</i> She mutters, voice beginning to quiver. <i>“I heard the yell, saw the glinting edge of a vibro-knife... my movements were instinctual. Before my team could react, I had pulled my gun from my belt,”</i> she performs the act with lightning speed, <i>“and shot him twice in the chest. He fell to his knees and then to his back. As soon as I saw his movements pause, I shot the weapon from his hand. Afterward, he was taken away to be treated for trial. It was a standard operation all told, but the story means something to me because I noticed what I felt: that if I pulled the trigger a few more times nobody would have thought twice.”</i>");
		
		if (pc.isNice()) output("\n\nYou tell her what matters is that she held her ground just fine. She stayed true to herself.");
		else if (pc.isMisch()) output("\n\nWhile that may be true, it’s a good thing she didn’t give into animal instinct. The man may have deserved a fate worse than meeting her, but it wasn’t her call to make.");
		else output("\n\nHe deserved everything he got. You tell Bianca that she did exactly what was required of her, no more, no less. Society certainly judged them harshly for their murders.");
		output("\n\n<i>“I know, [pc.name]. It’s just... the things I felt, the things I noticed I was capable of, they tempered my world view from then on. That’s why it’s a story I thought was worth sharing.”</i>");

		finishBiancaStory(inRandomEncounter);
	}
	// Story #4 - The Fox and the Hound
	else if (flags["BIANCA_STORIES_TOLD"] % 4 == 3)
	{
		output("\n\nBianca can’t help but swoon over whatever she’s thinking, cupping her cheeks and squeezing softly. <i>“Ah, [pc.name]... this is the story that is nearest to my heart for a lot of reasons. It is the story of the day I met my husband: Dian Zurovec.”</i>");
		output("\n\nWhile she struggles to find a suitable starting point, you make yourself comfortable for what’s sure to be her favorite story to tell.");
		output("\n\n<i>“I had been serving on the </i>First Dusk<i> for a little over two years, so much so that it’d become home away from home... or my new home entirely. I couldn’t imagine leaving, the crew’s friendliness was that infectious!”</i> Bianca cracks a smile. <i>“There was a changing of the guard and the ship had been staffed with new officers, Dian was among them. He was the youngest member of the team, an industrious man who I heard waged a few actual fights to be on the ship. He was, umm...”</i>");
		output("\n\n<i>Go on,</i> you tell her.");
		output("\n\n<i>“He was awe inspiring to me. When I looked at him I saw something other than a sensitive soul with piercing eyes. Indeed, I learned he wasn’t exactly tender but he was very <b>sincere</b>. An earnest man who saved his bite for his enemies and his bark for his friends. He had just recently been afforded his commission, thus as a leader he lacked real experience. However,”</i> Bianca takes a sip, <i>“he demonstrated humility at all times, and made the right moves.”</i>");
		output("\n\nYou break Bianca’s reverie by asking her to tell you what she <i>really</i> thought in <b>no uncertain terms.</b>");
		output("\n\n<i>“Don’t tease me!”</i> Bianca almost shouts, folding her arms petulantly. <i>“But yes, he was a sexy hound.”</i>");
		output("\n\nSo how did the two of them get together? She implied her time would be up on the ship soon.");
		output("\n\n<i>“I was getting ahead of myself. We didn’t hit it off straight away. He was the last to see me after new introductions, and we thought of each other as mere coworkers. Yet,”</i> Bianca winks, <i>“he kept coming back. He was full of questions; asking me about my earlier life, what led me to be a doctor, and what brought me to an ausar ship. When I told him that I’d be leaving next month, that was the <b>only</b> time I ever heard him whimper. If you questioned him as to the veracity of that, he’d lie and deflect, and do it in the cutest way. I loved teasing him about that!”</i>");
		output("\n\nYou stay silent, watching Bianca struggle with her bashfulness is pretty funny and outrageously adorable. You conclude that he was smitten with her at first sight.");
		output("\n\n<i>“He asked me to stay on another month, that he’d ask for an extension from U.G.C. Med. That happened, and he visited every day before sleeping hours. He started telling me about his childhood, that he was kicked out of home before struggling to become a J.A.F. officer, rising up from their equivalent to a human marine corps. It was only after he ran out of life stories that he bluntly asked me if I was taken.”</i>");
		if (pc.isNice()) output("\n\n<i>“And what was your answer?”</i> you ask.");
		else if (pc.isMisch()) output("\n\n<i>“Bet I know your answer already,”</i> you grin.");
		else output("\n\n<i>“Hard not to guess what it was,”</i> you smirk.");
		output("\n\n<i>“I didn’t have one.”</i> Bianca says levelly");
		if (!pc.isNice()) output(", catching you off guard");
		output(". <i>“The methods with which I worked meant I rarely slowed down. I had no intention of starting a family. I liked my life living from ship to ship without having to worry about an apartment.”</i> The doctor strokes her ear-tip. <i>“I told him that I was not taken, and that was good enough for him.”</i>");
		output("\n\nThe fox can’t hide her smile again, and she starts laughing. <i>“Then he became a real flirt. Instead of life stories, he told me what he wanted to do, what kind of future he’d carve out. The only thing he told me in between his occasional gifts and <b>very</b> helpful presence was that - before you say anything, he fancied himself my assistant very often - he was going to make Captain one day, and that’s when his life would change. Before my last month was up, the </i>First Dusk<i> received an emergency call from a nearby colony. A dangerous and territorial species had been revealed and was wreaking havoc on their city. I was attached to Dian’s squad as we set down on the tropical planet.”</i>");
		output("\n\nBianca sips and reaches for her codex. <i>“The creatures looked like cassowaries crossbred with lizards. Er, a cassowary is an old Earth animal, once feared if I recall correctly. These things were as violent too, and their jaws could rend concrete and metal. Fast, huge - about eleven feet tall - but few in number,”</i> Bianca gives you a rough indication of width and diameter with her hands, <i>“all I could think was that the ausar sure picked a good colony for monster hunting.”</i>");
		output("\n\nYou would laugh, but something tells you that it wasn’t a picnic.");
		if (pc.level > 6) output(" Indeed, some of the things you’ve dealt with in the galaxy aren’t easily dissuaded by lasers or bombs.");
		output("\n\n<i>“We met with the colony’s defense force, not as well equipped as it could have been, and began a search for their nests. The </i>First Dusk<i> was taking no chances; all of its gunships were deployed, flying overhead. Scouts on hoverbikes passed over the jungles looking for clearings. You’d think it was a warzone but we were hunting animals. Before we entered the jungle, I helped to treat the injured in town.”</i>");

		addButton(0, "Next", biancaAndTheHound, inRandomEncounter);
	}
}

public function biancaAndPiros(inRandomEncounter:Boolean = false):void
{
	clearMenu();
	clearOutput();
	showBianca((inRandomEncounter ? "WORK" : "CASUAL"));
	author("William");
	processTime(18+rand(10));

	output("<i>“We received an urgent instruction to intervene at a suspicious incident on a civilian starport that was established for research over a planet set to be terraformed and colonized. I was on the bridge at the time the orders came and we had very little information going in, but the station had gone silent after half a distress call was received.”</i> Not one to theorycraft or bandy words pointlessly, Bianca continues, <i>“We arrived at Piros Starport a few hours later. The docking berths were fit to bursting, but nobody was coming or going, and it was... ominously quiet for such an installation. No vessels were moving in the vicinity, there was no inbound or outbound communication...”</i>");
	output("\n\nAn ironic smirk crests the fox’s face, her next words spoken in a flippant, dull voice. <i>“I thought to myself at the time, ‘it’s like the first horror movie I ever saw’, where the down-on-their-luck scavenging team encounters a cosmic monstrosity aboard an abandoned station.”</i> Her ears flatten in fear, though you can’t tell if it’s feigned. When she straightens to look directly into your [pc.eye], you lean on it being sincere. <i>“It gives me chills still thinking about either of those today.”</i>");
	output("\n\nWhen her speaking pauses, you can see a mite tremble on her lower lip. Her brow furrows, and dimming with it are her eyes. In any other circumstance the time it takes for her to find a place to start would be embarrassing. So, wearing a plaintive, lopsided smile, she begins.");

	output("\n\nAfter taking another sizeable swig of water and a bite of her food, Bianca rests her chin on overlapped knuckles. <i>“The hangars were quiet and the connecting corridors equally so, and nothing <b>looked</b> out of the ordinary. We learned why that was quick enough: many of the staff and visitors were dead, but others were incapacitated. We found their bodies... everywhere. Lying on the ground, over furniture...”</i>");
	output("\n\nShe visibly shudders from the grisly memory. <i>“I performed a diagnostic on the station’s air quality, discovering that it was contaminated with Chalanoxide, a gas commonly used to disperse riots; however, it had been modified to be as fatal and long lasting as many illegal poisons, making it an insidious nerve agent on par with Soman. Subsequent research revealed that if no antidote was administered within fifteen minutes, death followed. Fortunately, we had the means to revive anyone still breathing...”</i>");
	output("\n\nHer words come down like a hammer on an anvil. <i>“...On our ship. But the others...”</i>");
	output("\n\nAn elongated sigh flows through her nostrils. <i>“Our teams rescued nine survivors and brought them back to our transport. There were five of us left to enter the bridge, with Zach making sure that everyone who had a chance was carried back. Ten minutes into insertion: me, Jim, Captain Zach, and two other soldiers were the only ones to reach the starport’s command and control.”</i>");
	output("\n\nBianca’s mien pales. <i>“The bridge had the most corpses I’d ever seen in one area, all suffocated to death. It was... ugh,”</i> she grimaces, <i>“it was hell. There is no other way for me to say it. It-it was hard for me to bear witness.”</i> Her jittery mouth prevents her from speaking until it calms down. <i>“Still, we assumed control of the station and the other teams were able to restore power. After that, we tapped into the last transmission sent from the communications console. It... it wasn’t very pleasant.”</i>");
	output("\n\nYou can’t imagine it was if someone was choking to death.");
	output("\n\n<i>“Yes, it was mostly that.”</i> Bianca’s voice has become sharper. <i>“Even the person sending the distress had nothing to say about what was happening, only that a strange gas was venting through the station. The Captain downloaded all of the station’s logs, security feeds, and codes to our ship, declaring to us that the array was sabotaged.”</i>");
	output("\n\nBianca leans back like a ghost. She hugs herself for warmth in much the same way a freezing man or woman would. <i>“We were about to head back to our ship... that’s when it got worse. An explosion scoured through the station; alarms were blaring as chain reactions followed.”</i> You notice she’s gripping her wrist.");
	output("\n\n<i>“There was that falling feeling...”</i> she whispers, a lump in her throat. <i>“Out the windows we could see the planet inching closer. The starport’s gravitational controls had been destroyed in the explosion. While the realizations struck us, our XO was screaming evacuation orders. In the estimated five minutes, it would enter the atmosphere, and there’d be no hope for anyone or anything. We ran as fast as we could.”</i>");

	addButton(0, "Next", biancaAndPirosTwo, inRandomEncounter);
}


public function biancaAndPirosTwo(inRandomEncounter:Boolean = false):void
{
	clearMenu();
	clearOutput();
	showBianca((inRandomEncounter ? "WORK" : "CASUAL"));
	author("William");
	processTime(18+rand(10));

	output("One of Bianca’s tails dips into her lap and she starts brushing it quietly, cradling the fluff like a stress relief pillow. <i>“I can still hear everything Officer Franks had said,”</i> her voice mimes something masculine, <i>“Captain, a directed explosion has torn through the station’s support channels! It’s falling, fast. Run! Get back to the transport on the double!”</i> She hugs her tail tighter, muscles relaxing. <i>“I’m sorry to digress.”</i>");
	output("\n\n<i>“...the station, tilting and plummeting faster, could have been my grave. I could have burned up in the atmosphere, no trace left. I was... I was terrified.”</i> Bianca continues in a steady tone, though there’s still a trickle of sweat on her cheek. For how horrible it was, you wouldn’t be surprised if she had PTSD, but by her coalescing mannerisms you can tell she’s made peace with her past. <i>“My superiors kept me together. I’ve come to terms with it all, but it was so gut wrenching to see that many bodies flung about like discarded trash.”</i> ");
	output("\n\nShe brushes a lock of hair, meeting your gaze again. <i>“Two minutes before the station would hit the atmosphere, the corridor in front of me collapsed, separating me from the team. A steel beam nearly landed on me, too.”</i> For a second, the thought of Bianca being crushed and bloodied forms an image in your mind you never want to recall. <i>“I would be lying if I said I wasn’t panicking, but the Captain barked an instant order telling me to go through the adjacent room.”</i>");
	output("\n\nCuriously, Bianca’s comforted words tell you she was <i>glad</i> that this happened.");
	output("\n\n<i>“Stepping into that room, I found a little kaithrit girl keeled over one of the beds suffocating on the smoke and air. She’d shoved her face into the sheets trying to block it all out. I didn’t think twice about ripping my mask off and getting it on her. I couldn’t waste time talking, so I pulled her on my back and hurried out of the room.”</i>");
	output("\n\nBianca looks down at her hand pensively before reaching into her inner pocket. <i>“Jim waited for me; I was beginning to succumb to the Chalanoxide. He took the girl in his arms so I could keep my balance. When we reached the door to the hangar, so close to...”</i> Bianca hiccups, goosebumps rising across her porcelain features, <i>“...a laser shot went over my shoulder and struck Jim in the neck. Both of them fell to the catwalk and I could barely make out the attacker in the dark, but he or she was wearing an all white suit of armor. I panicked; near to death from two sources, I used up a lifetime’s worth of adrenaline at that moment, looking to the attacker for a split second, the door and my escape, my mentor and the survivor, weighing all my options.”</i>");
	output("\n\nBianca produces a small, golden tag cased by a black rim with a colorful string ribbon wrapped around it. You can’t make out any other details because of how tight and close she holds the item. <i>“I pulled out my pistol and fired every round at our assailant while Jim urged me to go. He suppressed the figure and must have disarmed them. With his final breath he told me to take the girl and run. Over the din I could hear our captain bellowing for us, saying that they had to go then and there. I couldn’t have saved Jim.”</i> There’s a teardrop flowing down her cheek. <i>“Blood was pouring from his neck and chest; his last moments were focused on protecting us, so...”</i>");
	output("\n\nYou can see Bianca’s body subtly curl as she mentally reenacts the scenario.");
	output("\n\n<i>“...I grabbed the girl,”</i> her fingers close around the tag in a deathly grip, <i>“and leapt from the catwalk as he fended off our attacker. I cradled the girl against me and hit the deck hard, breaking my shoulder. I made it into the pod just as its engines fired up. Before I passed out, we saw the station explode in atmosphere, its self-destruct triggered to prevent it from damaging the planet.”</i>");
	output("\n\nBianca finally opens her reddened palm, showing you the tag in her hand: a small holo-device reading off the name and other vital stats about its former owner, Dr. Jim Malcolm. <i>“The girl had pulled it off him when they fell, and I’ve held onto it since.”</i>");
	output("\n\nDr. Ketria lets slip a quiet gasp. <i>“Her name was Caecilia; she gave the tag and ribbon to me when I woke up in the medbay. Of the survivors we pulled out, her parents were saved too.”</i> She grins. <i>“The ribbon’s the same orange as her hair.”</i>");
	output("\n\n<i>“When I had time to meet with Jim’s wife, she’d already received the news, and I told her what happened in detail. Rather than take his tag for the funeral ceremony she told me to keep it, reminding me that I was his last student and that I’d be carrying on his role.”</i>");
	output("\n\nThere’s an odd look on her face, something that suggests she’s about to cry... or <i>wants</i> to cry. You surmise that the passage of time has dried her sorrow.");
	output("\n\n<i>“As for the incident,”</i> Bianca raps, clearing her throat again, <i>“Captain Zach came to me and told me that after reviewing the logs and interviewing the survivors, they couldn’t find out anything coherent. That’s what hurt me the most. Was it corporate espionage? The banality of evil? A terror strike? Someone sending a message? A weapons test?”</i> the golden-haired fox shrugs and groans. <i>“All I know is that I won’t let Jim’s memory down.”</i>");
	output("\n\nShe clenches her hand around his ID and pockets it again. <i>“That, [pc.name], is the first time my life had changed. Afterwards, I became the ship’s CMO until I graduated and was formally inducted into U.G.C. Med.”</i>");
	if (pc.isAss()) output("\n\nEven for you, thinking about all that could not have been had she died is <i>moving.</i> You thank her for her story, and nod heavily.");
	else output("\n\nThanking her for her story isn’t enough: you clutch her hand, and tell her that you’re glad she’s alright first.");
	output("\n\n<i>“It was a horrible day, [pc.name], but in the end, I know that somewhere Caecilia has grown up because of me, that she has a life to lead just like the others who made it out. Jim and I saved who we could.”</i> Her signature smile returns. <i>“That’s what matters most.”</i>");

	finishBiancaStory(inRandomEncounter);
}

public function biancaAndTheHound(inRandomEncounter:Boolean = false):void
{
	clearMenu();
	clearOutput();
	showBianca((inRandomEncounter ? "WORK" : "CASUAL"));
	author("William");
	processTime(18+rand(10));

	output("Bianca pulls up her black and silver codex. A few quick taps later, she shows you the profile for a predatory creature called a Kanaxxus. Four legs, half as big as a spaceship, huge scaled bodies. The page is a handwritten journal, a lot of the doctor’s old handwriting describing them in detail. When she scrolls down you see a picture of her with a towering, uniformed ausar with dark red fur standing over the body of one fallen predator.");
	output("\n\n<i>“Dian?”</i> you ask.");
	output("\n\n<i>“Yes. Maybe I can show you a better one later, [pc.name],”</i> she giggles. <i>“This thing was unspeakably mean. Our operation had agitated them even more too; there were at least five spread all through the jungle destroying the colony’s outlying farms and equipment. We were warned that one was heading our way, so Dian gave his orders. Mines were placed on its projected path and we got ready. It stomped right through the explosions without a care. An overhead sniper was covering us, but it was stampeding in my direction.”</i>");
	output("\n\n<i>“Suffice to say,”</i> Bianca’s ears fold, <i>“Dian tackled me out of the way. Lasers weren’t effective against its armor, so the squad switched to ballistics. Dian took me behind a tree and got back to the fight. Two of his men begun wrestling with it; they’d grabbed on to its neck and were desperately trying to keep their grip, attempting to bring it down with knives. In the cacophony of screams and orders, I’d seen one of our own get thrashed into a tree as the frenzied beast flailed around us. There wasn’t time to run a deep scan on his bones, but I knew his lungs were damaged, and he was hemorrhaging blood. After getting a tube in his neck I looked back to the fight to see Dian helping two others dodge another charge.”</i>");
	output("\n\nBianca smiles proudly; her eyes twinkle brighter than their usual shimmer. <i>“My to-be husband drew it his way and stood his ground, giving me time to pull the wounded in our squad back. I’d stabilized them - not an easy thing to do just under a minute - and saw Dian luring it away from us further to the other side of the clearing”</i>");
	output("\n\nThe way Bianca has spoken thus far has been with fondness and an uncharacteristic frivolity. <i>“Seeing one of the rifles near me was equipped with a grenade launcher, I took it and ran towards Dian.”</i>");
	output("\n\nShe motions aggressively like she’s holding a weapon. Her foxen ears fold to mimic fight-or-flight, and she kicks her feet against the floor in a marching pattern. <i>“I yelled at him to take cover and fired the launcher, hitting the beast where its legs met its body. It fell to the ground and Dian plunged a dagger through its head. We heard the other teams had met with success and several injuries, but we quelled the immediate threat to the colony.”</i> ");
	output("\n\nBianca slowly paws at the picture on her codex with a mix of awe and forlorn motion. <i>“The picture was taken by the sniper that covered us. Too bad the timing was off, she missed the hug Dian gave me!”</i>");
	output("\n\nYou guess that was where the magic must have happened.");
	output("\n\n<i>“Yep,”</i> Bianca gives you a motherly look, <i>“Dian told me right there straight in my ear the other thing he saw in his future was a family with children of his own to raise. He told me that when he reached Captain he would request to be discharged. He would then seek more lucrative private sector work so that he could be home more. His ultimate dream was to build a company of his own, or at least rise to the upper levels of one.”</i>");
	output("\n\nThat explains what she meant about Dian working for Steele Tech.");
	output("\n\n<i>“To be honest, [pc.name], those were my most interesting days. After hearing his plans, having him bare his soul to me, and after our success together... I was his. I told Dian I would marry him. We kept in constant contact while he climbed his ladder and I worked my tails off in other Core systems!”</i>");
	output("\n\nBianca starts laughing as her face darkens to an even redder shade. <i>“Once I transferred back to U.G.C. Med I was thrown about the galaxy like a ping pong ball just to do my work. Occasionally I’d be back on a ship but my services were in higher demand those days. It’s where I earned the most of my savings. A lot of affluent individuals tried to woo me with endless finances and lucrative job offers.”</i> She sighs, totally exasperated. <i>“Too bad for them, though! Dian secured his promotion and we got married, the happiest day of my life of course!”</i> She hugs herself tightly. <i>“When I was given maternity leave, he stopped his private sector work for a job at Steele Tech, and I gave birth to two sons and a daughter. That, as they say, is that.”</i>");
	output("\n\nYou thank her for the stories as always.");
	if (!biancaTalkedTopic(BIANCA_TOPIC_FAMILY)) output(" You wish her family well, but she hastily turns from you with nary a comment. She must miss them...");
	output("\n\n<i>“If I manage to compose more of my past than what I’ve told you up til now, I’ll be sure to share it with you, [pc.name].”</i>");

	finishBiancaStory(inRandomEncounter);
}

public function finishBiancaStory(inRandomEncounter:Boolean = false):void
{
	IncrementFlag("BIANCA_STORIES_TOLD");
	biancaTalkedTopic(BIANCA_TOPIC_STORIES, true);
	if (flags["BIANCA_STORIES_HEARD"] == undefined && biancaStoryMenu(true)) addButton(0, "Next", biancaAsksForAStory, true);
	else biancaTalkEndMenu(inRandomEncounter);
}

// Either makes buttons or checks for availability
public function biancaStoryMenu(isAvailable:Boolean = false, inRandomEncounter:Boolean = false):Boolean
{
	// PC must complete the Plantation quest by arresting RK Lah and getting the Zil Tribe to be friendly with Esbeth.
	if (flags["PQ_RESOLUTION"] >= 1 && flags["PQ_SECURED_LAH"] >= 2)
	{
		if (isAvailable) return true;
		else addButton(0, "Plantation", tellBiancaAboutHowAwesomeYouAre, 0, "Snugglé Plantation", "Helping a megacorp isn’t necessarily a good thing, but stopping an anarchist and giving the natives a chance at diplomacy are.");
	}
	else if (!isAvailable) addDisabledButton(0, "???", "???", "To answer with this, you must resolve a situation on Mhen’ga between a tribe and a megacorp as peacefully and diplomatically as possible.");

	// PC must complete Anno's 'Ghost Deck' quest.
	if (flags["DECK13_COMPLETE"] != undefined)
	{
		if (isAvailable) return true;
		else addButton(1, "Nova Crew", tellBiancaAboutHowAwesomeYouAre, 1, "Novahome Crew", "You discovered the mystery of Novahome’s ‘Ghost Deck’, and made a fateful choice.");
	}
	else if (!isAvailable) addDisabledButton(1, "???", "???", "You’ll need to resolve the mystery of Novahome to tell this tale.");

	// PC must turn in Dr. Badger to Penny.
	if (flags["DR_BADGER_TURNED_IN"] != undefined)
	{
		if (isAvailable) return true;
		else addButton(2, "Dr. Badger", tellBiancaAboutHowAwesomeYouAre, 2, "Doctor Badger", "You found one of the most dangerous criminals on the frontier and had her arrested.");
	}
	else if (!isAvailable) addDisabledButton(2, "???", "???", "You’ll need to have ratted out a dangerous scientist for this.");

	// PC must rescue Saendra, know her, etc. Also checks for Deck 92 quest. If Saendra goes MIA at any point, lock this out with appropriate tooltip.
	if (flags["SAEN MET AT THE BAR"] != undefined)
	{
		if (flags["SAENDRA_DISABLED"] != undefined && !isAvailable) addDisabledButton(3, "Saendra", "Saendra en Illya", "Saendra is gone. Unless you wanted to give yourself a reason to feel bad, then there’s no reason to talk about her.");
		else if (isAvailable) return true;
		else addButton(3, "Saendra", tellBiancaAboutHowAwesomeYouAre, 3, "Saendra en Illya", "You saved Saendra’s life from the Black Void" + (InCollection(flags["SAENDRA_XPACK1_STATUS"], 9, 11) ? ", and helped her rescue a friend from her hunters." : "."));
	}
	else if (!isAvailable) addDisabledButton(3, "???", "???", "You’ll need to have saved a kitty-dog space captain from certain death to bring this up.");

	// PC must rescue Fazian on Myrellion, planet must not be nuked.
	if (flags["FAZIAN_QUEST_STATE"] == FAZIAN_QUEST_COMPLETE)
	{
		if (flags["KQ2_MYRELLION_STATE"] != undefined && !isAvailable) addDisabledButton(4, "Fazian", "Fazian", "With Myrellion turned to glass and the Myr lost to history, talking about Fazian would only bring up bad memories.");
		else if (isAvailable) return true;
		else addButton(4, "Fazian", tellBiancaAboutHowAwesomeYouAre, 4, "Fazian", "On Myrellion, you put a stop to a Red Myr slavery ring, and rescued the anatae Fazian from a disenchanted warden.");
	}
	else if (!isAvailable) addDisabledButton(4, "???", "???", "On Myrellion, you’ll have to get to the bottom of a missing persons case to broach this.");

	// PC must cripple the pirate base on Myrellion, regardless if Kara lives or dies. Myrellion must not be nuked.
	if (flags["KQ2_QUEST_FINISHED"] != undefined)
	{
		if (flags["KQ2_MYRELLION_STATE"] != undefined && !isAvailable) addDisabledButton(5, "Myr. Pirates", "Myrellion Pirates", "Myrellion was destroyed, and with it, so too was this story.");
		else if (isAvailable) return true;
		else addButton(5, "Myr. Pirates", tellBiancaAboutHowAwesomeYouAre, 5, "Myrellion Pirates", "After helping Kara, you crippled a Black Void pirate base on Myrellion and escaped.");
	}
	else if (!isAvailable) addDisabledButton(5, "???", "???", "You’ll need to help a kaithrit smuggler accomplish her mission on Myrellion.");

	// PC must resolve the Red Myr quest on Myrellion; If the PC gets the Gold Queen off the planet, then it will still be available to talk about because she sets up on Mhen'ga.
	if (flags["FEDERATION_QUEST"] > 2)
	{
		if (flags["KQ2_MYRELLION_STATE"] != undefined && !isAvailable) addDisabledButton(6, "Fed. Quest", "Federation Quest", "Myrellion was destroyed, and with it, so too was this story.");
		else if (isAvailable) return true;
		else addButton(6, "Fed. Quest", tellBiancaAboutHowAwesomeYouAre, 6, "Federation Quest", "You helped the Red My Federation stop a rogue gold queen" + (flags["FEDERATION_QUEST"] > 6 ? "by moving her off the planet." : "."));
	}
	else if (!isAvailable) addDisabledButton(6, "???", "???", "You’ll need to aid the Red Myr with a certain matter.");

	// PC must resolve Ara Kei's quest and planet must not be nuked.
	if (flags["BOTHRIOC_QUEST"] == BOTHRIOC_QUEST_SUCCESS)
	{
		if (flags["KQ2_MYRELLION_STATE"] != undefined && !isAvailable) addDisabledButton(7, "Bothrioc", "Bothrioc", "After the myr detonated WMDs, the U.G.C. has pulled out of Myrellion space for good, rendering this story moot.");
		else if (isAvailable) return true;
		else addButton(7, "Bothrioc", tellBiancaAboutHowAwesomeYouAre, 7, "Bothrioc", "The Bothrioc Ambassador Ara Kei Enya asked you to unite her race and ready them to join the U.G.C.");
	}
	else if (!isAvailable) addDisabledButton(7, "???", "???", "On Myrellion, you’ll need to see a certain ambassador’s request to its end if you want to bring this up.");

	// PC must save the Kashima and use the cure.
	if (InCollection(flags["KASHIMA_STATE"], 2, 3))
	{
		if (isAvailable) return true;
		else addButton(8, "Kashima", tellBiancaAboutHowAwesomeYouAre, 8, "The Kashima Incident", "You saved the Steele Tech Mining Vessel <i>Kashima</i> and dispensed a cure that gave its crew a fighting chance.");
	}
	else if (!isAvailable) addDisabledButton(8, "???", "???", "You’ll need to save a certain vessel and its crew from parasitic infestation.");

	// PC must save the Kashima and use the cure.
	if (flags["WARGII_PROGRESS"] >= 3)
	{
		if (isAvailable) return true;
		else addButton(9, "Korg’ii Hold", tellBiancaAboutHowAwesomeYouAre, 9, "Korg’ii Hold", "On Uveto, you saved Ula’s tribe from certain death at the hand of a Pyrite-sponsored tribal war.");
	}
	else if (!isAvailable) addDisabledButton(9, "???", "???", "Only by helping a certain tribe on a cold, Core-space moon will you be able to boast about this.");

	// PC must defeat the Frostwyrm. Don't need to kill it or bed it.
	if (flags["FROSTWYRM_VICTORY_COUNT"] != undefined)
	{
		if (isAvailable) return true;
		else addButton(10, "Frostwyrm", tellBiancaAboutHowAwesomeYouAre, 10, "Frostwyrm", "On Uveto, you defeated one of the legendary Frostwyrms. Really, what’s more brag-worthy than this?");
	}
	else if (!isAvailable) addDisabledButton(10, "???", "???", "On a frozen moon in core space, you’ll have to defeat the most dangerous predator.");

	if (!isAvailable) addButton(14, "Nah", letsTellBiancaAboutNothing, inRandomEncounter, "Nah", "You’d rather not talk about your exploits right now.");

	return false;
}

public function biancaAsksForAStory(fromStories:Boolean = false):void
{
	clearMenu();
	clearOutput();
	showBianca("CASUAL");
	author("William");
	processTime(1);

	// First
	if (flags["BIANCA_STORIES_HEARD"] == undefined) output("The buxom doctor gives you friendly tap on the shoulder. <i>“Hehe, I’d rather not end our conversation on a melancholic note, so I’m curious. Your father has you running out on the planet rush like he did, but have you done anything you can say you’re proud of yet?”</i>");
	// PC Chose [Bianca] > [Your Stories]
	else output("Tapping you on the shoulder, Bianca quizzes you, <i>“Anything interesting happen in the travels of [pc.name] Steele? I’m sure there’s something you’re proud of accomplishing!”</i>");

	biancaStoryMenu();
}

public function tellBiancaAboutHowAwesomeYouAre(story:int):void
{
	clearMenu();
	clearOutput();
	showBianca("CASUAL");
	author("William");
	processTime(5+rand(3));

	switch (story)
	{
		case 0:
			output("There is, actually. You tell Bianca that you helped with a certain matter on Mhen’ga. A representative of Snugglé sought your help when a self-styled freedom fighter named Lah attempted to assert control over a Zil tribe to destroy the agri-company’s plantation where he was serving probation. The corporation’s representative, you explain, asked you to deal with the tribe and return Lah to custody.");
			output("\n\n<i>“Lah was serving on the plantation as part of his sentence for terrorism, he had begun a violent campaign against Xenogen and fire bombed their property. He filled the Zil queen’s head with a lot of nonsense, drawing her and her race into a war against his captors. He said that they were fascist land-stealers who’d take everything from them. I persuaded the queen to see reason and fought Lah as per their traditions, and returned him to his sentence. What’s more, I convinced the Zil tribe to cooperate with Esbeth and trade their honey, as well as come to the table with open hands rather than spears and bows.”</i>");
			output("\n\n<i>“That’s...”</i> Bianca murmurs, <i>“That’s very impressive, [pc.name]! I’m not going to get on a moral soapbox about what mega-corporations do with these planets, but violent uprising and senseless attacks only mount bodies, not ideas. I hope that your negotiations will improve life on the planet, even if those companies will always try to take more and more. And... they will try, that’s for sure.”</i>");
			output("\n\nYou’ve no reason to be pessimistic about it right now, at any rate. Say what you will about the culture of this far-flung future, but there’s always a silver lining somewhere, always some good that a person can do. You were in the right place for it, and you gave those zil a chance at something more.");
			output("\n\n<i>“The more I think about it, that was a very precarious position for a lot of people,”</i> Bianca says, scratching at her chin. <i>“The uplifting of these planets is dubious enough without someone using the natives as weapons.”</i>");
			output("\n\nNo joke.");
			break;

		case 1:
			output("When you met your future employee Anno Dorna on Tarkus, she told you about a hidden deck on Novahome that wasn’t on any floor plan. She asked you to join her in exploring it, finding out what was drawing power. What you discovered took you both by surprise: the secret of the gray goos that had spread out among Tarkus. It’s with a quiet tone you relay the information to Bianca.");
			output("\n\n<i>“The original crew sent out by Bell-Isle/Grunmann on board Novahome had been given an experimental injection on launch. When they woke up so many years later, they had turned into the goo as you might have seen it. They all became... digitized, in a manner of speaking. All the silver girls out on the wastes were experiments gone wrong in trying to create bodies for them to use, and even after all this time they had not been able to reach out or complete their task. We found their Captain, Victoria Morrow, and she attacked us... but we got through to her in the end.”</i>");
			output("\n\n<i>“That’s horrible!”</i> Bianca gasps. <i>“What happened next?”</i>");
			// Helped Goos (Real Bodies)
			if (flags["DECK13_GRAY_PRIME_DECISION"] == 1)
			{
				output("\n\n<i>“Anno and I put Steele Tech’s resources to use. In exchange for all the Gray Goo data for R&D, we promised to get cybernetic bodies they could upload to. Hopefully it won’t be too long before the crew of ten odd thousand regain their sentience and sanity.”</i>");
				output("\n\nBianca was nodding the whole time you spoke, listening raptly. <i>“I can’t believe something like that happened at all. To wake up after who knows how long in cryosleep... to not even be yourself. It’s something out of a nightmare... but you did something good, [pc.name]. I’m glad they have a chance to get help. Hopefully what you learned will be a benefit to the U.G.C. as a whole.”</i>");
				output("\n\nYou’re just glad to have gotten out alive!");
			}
			// Helped Goos (Goo Bods)
			else if (flags["DECK13_GRAY_PRIME_DECISION"] == 2)
			{
				output("\n\n<i>“Anno and I convinced them to upload into gray goo bodies, and for their captain to do the right thing: to save her crew, and to stop putting more dangerous predators onto the planet in light of her desperate experimentations. We did secure the gray goo data, and I think most of the crew are finding their own way now.”</i>");
				output("\n\nBianca looks down at the table, sighing. <i>“It’s an utterly terrifying thought to me. To wake up after so long, only to not be yourself. A nightmare that you can’t escape. But, now that they’re free, they can start trying to regain themselves. Would that there could be more done, but,”</i> she smiles, <i>“in light of your findings, there’s always hope.”</i>");
			}
			// Stopped Nova
			else
			{
				if (pc.isNice()) output("\n\n<i>“...The captain was too far gone,”</i> you say simply.");
				else if (pc.isMisch()) output("\n\n<i>“She couldn’t be reasoned with,”</i> you sigh.");
				else output("\n\n<i>“We had to put her down,”</i> you answer.");
				output(" <i>“We weren’t able to come to terms, and the captain paid the price for it; it was either her, or Anno and myself. In the end, we recovered the gray goo data, but the fate of her crew died with her. They had all coalesced into that single body, and lost too much of themselves.”</i>");
				output("\n\nBianca grips her elbows and sighs. <i>“I see... I see, [pc.name]. I’m glad you’re alright, but it pains me to think about what happened. To be launched into the unknown so long ago, only to wake up not yourself, to have been turned into something terrible, to lose yourself... and to have no chance of regaining it. I hope that it never happens again. On that, I’d like not to dwell on this subject...”</i>");
				output("\n\nNeither would you.");
			}
			break;

		case 2:
			output("In a rather unique twist, you managed to put one of the most wanted criminals in the U.G.C. behind maximum security bars where she most certainly belongs. The infamous Dr. Badger asked you to erase Penny’s mind with a bimbofying gun to get the law off her trail. Instead, you turned in the weapon and its sinister maker, ending her heinous designs for the galaxy.");
			output("\n\n<i>“Do you know the name Dr. Badger?”</i> you ask Bianca. If she was wanting to set a record for cringing, she just won the gold medal.");
			output("\n\n<i>“I do.”</i>");
			output("\n\n<i>“I found her on Tarkus,”</i> you begin. You can’t stop your brow from furrowing, realizing just how close to a lunatic’s plaything you nearly became in the ordeal. <i>“And I had her arrested. She won’t be troubling anyone anymore, thanks to my friend Penny.”</i>");
			output("\n\nBianca’s shoulders shrug and she releases a long, long breath. <i>“Do you have any idea how good that news is, [pc.name]? The most wanted are on a shoot-on-sight list for a reason. That woman had twisted science and medicine into producing unfathomable results. If she was allowed to continue uncaught, then whatever her ghastly plans... they may have succeeded. We’ve seen enough with Furpies,”</i> she spits. <i>“With her in custody, the U.G.C. and the entire medical community can start healing that cretin’s damage.”</i>");
			output("\n\nDr. Ketria’s hand tightens around her glass. <i>“Thank you, from all of us, [pc.name].”</i> She stares at you and repeats it, saying it multiple times. <i>“Thank goodness you’re alright, and thank goodness she won’t be causing anymore harm. They’ll see to that...”</i>");
			break;

		case 3:
			output("During your voyage you answered a distress call sent from a ship identified as the <i>Phoenix.</i> The captain, Saendra, was being attacked by the Black Void, her ship had been boarded and it was almost lights out for her. That’s where you came in.");
			output("\n\n<i>“I met an adventurer much like myself,”</i> you start, clutching to a set of fingers, <i>“and... she was marked by the Black Void.”</i>");
			output("\n\n<i>“The worst of the worst,”</i> Bianca muses, waiting to hear more.");
			output("\n\n<i>“I boarded her ship via space-walk and saved her life. You don’t want to know what I had to do bring her ship’s shields back online,”</i> you giggle, <i>“but she’s okay. Better than okay after getting patched up. She’s on Tavros right now, waiting for her ship to get repaired. She and I are, of course, on good terms. If I wasn’t in the area, she’d have been a goner..”</i>");
			output("\n\n<i>“You should be glad you made it away from those criminals alive,”</i> Bianca sternly reminds, shaking her head. <i>“Really. Engaging the Black Void on your own. You’re not a Peacekeeper, [pc.name].”</i>");
			output("\n\n...How do you respond to that?");
			output("\n\nBianca exhales, smiling again. <i>“Sorry. I’m just being stubborn. You’re too young to be putting yourself in danger like that, especially against people who will not think twice about selling you off as little more than furniture. Still, I’m glad to hear you made it out of there, but I hope you won’t make yourself a target of that organization.”</i>");
			// Deck 92 Complete
			if (InCollection(flags["SAENDRA_XPACK1_STATUS"], 9, 11))
			{
				output("\n\n<i>“Well,”</i> you scratch your [pc.ear], <i>“she called for help and I answered again. Turns out they tracked her to Tavros, but we eluded them. Even rescued her friend. What happened at that point I’m not at liberty to say. For her safety.”</i>");
				output("\n\nBianca doubles over on the table. <i>“[pc.name]!”</i> she cries like a doting mother. <i>“I am glad you made it out, but I don’t want to have to worry about you being chased by horrible people on a daily basis! Watch yourself out there, okay?”</i>");
				output("\n\nYou will.");
			}
			// Deck 92 Incomplete
			else output("\n\nYou too.");
			break;

		case 4:
			output("You cast your gaze downward, pondering all the drama on Myrellion. You aren’t sure how that situation is going to turn out, but you know you eked out some good from its conflict. You tell Bianca about the performance you attended, how you met Fazian, an anatae, and helped search for him when he went missing. A red myr officer had abducted him, and she was selling gold myr to slavers.");
			output("\n\nNo doubt that Fazian would have ended up the same way, if not kept in purgatory.");
			output("\n\n<i>“I truly detest that fate, [pc.name]. Slavery...”</i> Bianca hisses, <i>“sometimes when I think about how prevalent it can be, I wonder if individuality is a lost concept to the galaxy. Trading the lives of the destitute to others, treating sentient people like property... that is the ultimate tyranny.”</i>");
			output("\n\n<i>“They were forcing Fazian to perform for prisoners, to keep them pacified,”</i> you begin. <i>“The major in charge explained to me that she sold the gold myr prisoners for supplies and resources to care for other PoWs, and that she would not give him his freedom back. There’s a lot of propaganda between the red and gold myr, and there’s a truly complicated situation that I’m not sure will be resolved peacefully. The tarratch tried to bribe me off, but I shot them down and anyone who attacked me. I don’t know how many prisoners made it out, but they all had the only chance I could give them. Fazian is safe and sound back with his friends.”</i>");
			output("\n\n<i>“...I feel like I have no business commenting on this, and yet...”</i>");
			output("\n\nGroaning in abject frustration, she lets it all out. <i>“I prefer not to speak on politics; I am a doctor and I am bound to impartial care for all,”</i> she continues, <i>“but the myr are still capable of destroying themselves and their planet. At this point I wonder if the U.G.C. would be better off disarming them and forcing peace, otherwise... otherwise they’re going to be a danger to the rest of us too. If you hadn’t saved Fazian, [pc.name], things would have gotten worse. Of that, I am deadly certain.”</i>");
			output("\n\nLeaning back in mild comfort, she looks to the side dismissively. <i>“Sometimes it feels like nothing can be done. That’s not true,”</i> she palms her face, <i>“but there are days I think peace and kindness will be tapped out. These planet rushes discover painful things, and our society is certainly tinted by hedonism... never mind me.”</i>");
			output("\n\nFor the time being, all you can do is share your sympathies and sit in silence. <i>“You did the right thing,”</i> she says suddenly. <i>“Don’t ever forget that, [pc.name]. The myr had no right to do what they did.”</i>");
			break;

		case 5:
			output("Perhaps your most dangerous undertaking, you helped Kara perform a little espionage for her handler. You glance at Bianca, who is idly checking her nails, and interrupt her with the story of how you helped the kaithrit smuggler get in and grab some data, knowing she’d not make it alone.");
			output("\n\nBianca wears a look of shock and worry as you continue. ");
			output("\n\n<i>“We gained access to the main building and took what we needed, taking down any of the pirates that came our way. Unfortunately, on our way out, the absent fleet was coming home. If we didn’t get out then and there, we would have been either dead or captured.”</i>");
			if (flags["KQ2_SHADE_ENCOUNTERED"] != undefined) output(" On the roof a bounty hunter named Shade confronted us again, " + (flags["KQ2_SHADE_UNCONSCIOUS"] == undefined && flags["KQ2_SHADE_DEAD"] == undefined ? "but she let us go. She and I are on... unique terms" : "we had to fight off the woman again before we could get away") + ".”</i>");
			output("\n\n<i>“A desperate and complicated situation, [pc.name]...”</i> the doctor says grimly, still not sure why you got yourself involved in the first place.");
			// Kara Alive
			if (flags["KQ2_KARA_SACRIFICE"] == undefined)
			{
				output("\n\n<i>“The last obstacle was a woman named Amara Faell, one of the pirate Dread Lords. Kara and I fought one hell of a battle and proved victorious, getting off the planet in a hail of fire.”</i>");
				output("\n\nYou make a light-hearted quip about not getting Amara’s number, she was pretty hot even though she was trying to kill you. Bianca lets out a sharp, exasperated breath in response. <i>“Your dad is manifesting... but, good work [pc.name]. You stood against one of the most dangerous people on the frontier and you’re still among the living... look,”</i> she hits the table, <i>“please be careful in the future, okay? Don’t pick a fight with an entire criminal syndicate when you have a life and legacy to secure. You’re too young to make enemies like that!”</i>");
				output("\n\nFeeling disciplined, you tell her you’ll try to keep out of trouble, but you might not if someone sexy asks for help.");
			}
			// Kara Dead
			else
			{
				output("\n\n<i>“We... we fought against a woman named Amara Faell on the roof, one of the Void’s Dread Lords. Kara didn’t make it.”</i> You put a hand to your chest, trying to steady your heart. It’s a pointless gesture, as it does nothing to stymie the emotional erosion eating through you. <i>“She died, and to save me no less...”</i>");
				output("\n\nBianca leans closer and grabs you by the [pc.hand], eyes narrowing. <i>“[pc.name],”</i> she starts, both sets of fingers clenching down around yours, <i>“I want you to understand something, and I need you to listen to me. I’m not going to judge you for trying to help a friend, nor berate you for getting involved with that syndicate. However,”</i> she exhales and inhales, <i>“you cannot let her sacrifice be in vain. The choice you made to help her was noble. She trusted you enough to get you out of there. You still have your life to live, a life that she saved. You have people who care about you just like she did. Don’t ever be afraid to reach out if you need a shoulder to lean on.”</i>");
				output("\n\nBianca leans back, still touching your fingertips. <i>“Don’t forget her memory. Speaking from experience...”</i> she squeezes therapeutically, <i>“it will take some time to heal. This won’t be the only time in your life you suffer such loss. But under no circumstances should you ever regret what you did and the choices you made. You can learn from them, but never doubt them.”</i>");
				output("\n\nShe pats your hand and pulls back. <i>“If you ever wish to speak, my ears and my eyes are always open.”</i>");
			}
			break;

		case 6:
			output("The Red and the Gold Myr are mortal enemies, and even after a ceasefire was declared upon the U.G.C.’s arrival, the war still raged. You begin by explaining to Bianca you offered your service in a confidential matter: to go after a rogue gold queen named Estallia. Although the war was off, she continued fighting against the Federation, continued to be a symbol for chaos and insurgency, defiant of her fellow queens. The so-called ‘war queen’ and her daughters were resigned to die in their fight against the reds, whom they were certain would never broker peace.");
			output("\n\n<i>“I joined a commando squad bound for a deserted city that Estallia and her rebels were using as a base. Very high risk, but they were still using gear inferior to our shield belts and the like. I was an ace in the hole, so to speak.”</i>");
			output("\n\nBianca turns her head annoyedly, and one ear raises. <i>“Is there a reason you took to fighting in another planet’s war? That situation is too complex; the situation goes beyond simple violent solutions. There is no black or white, only layers of complication. The drop of a needle could change a lot...”</i>");
			output("\n\nSince you’re still sitting here, she can tell your operation was a success, but how it went down... that’s what she’s waiting on now.");
			// Estallia Captured
			if (flags["FEDERATION_QUEST"] == 3)
			{
				output("\n\n<i>“We captured her, as we were ordered,”</i> you say. <i>“It was the only outcome, especially after we had nearly lost everything getting there. If she were left to her own devices, she’d continue to rally her forces and her own children against the reds.”</i>");
				output("\n\n<i>“In such a tense state, I can see that reasoning. However, regardless of what it makes me sound like, I do not trust their motivations. They will certainly use her to further their own ends, perhaps even as a bargaining chip. The rain of bullets may not be pouring anymore, but the backbiting, the backstabbing, the moves they both make for the U.G.C... those are going to be shifting much more wildly now. I cannot understand how two races can be so vehemently opposed... but that is their reality. Still...”</i>");
				output("\n\nBianca nods, leaning forward. <i>“...Bloodshed begets bloodshed. Now that you’ve put a stop to it, there’ll be time to heal, and time for diplomacy to take another step. Hopefully with your actions, the fighting is well and truly at its end.”</i>");
				output("\n\nHopefully...");
			}
			// Estallia Let Go
			else if (flags["FEDERATION_QUEST"] == 4)
			{
				output("\n\n<i>“I found her, and let her go. I told her to escape while she had the chance. The reds would keep sending more and more until they got what they wanted. Staying alive and escaping at least gives her a chance to return to her people.”</i>");
				output("\n\n<i>“And gives her a chance to keep fighting and undermining the chances both sides have at peace and advancement,”</i> Bianca interjects. The look she gives you suggests that she’s not particularly impressed by your action, but before it lingers she follows up with, <i>“I can’t imagine the Federation was pleased with that result.”</i>");
				output("\n\nNo, they were not. You’d gotten that far and you nearly lost your life and the lives of your friends for that war queen. Showing up empty handed and getting verbally reamed by an irate commander was the least of your worries.");
				output("\n\n<i>“But you’re here, you made it out. That’s all I care about in the end, [pc.name],”</i> Bianca says, touching your [pc.hand]. <i>“I hope you learned something at the end of that, regardless of your motivations.”</i>");
			}
			// Estallia Exfiltrated
			else
			{
				output("\n\n<i>“I convinced her to leave the planet. She and her children evacuated Myrellion and are safe,”</i> you proudly declare. <i>“Safe on Mhen’ga as a new wave of colonists.");
				if (flags["MHENGA_MYR_EMBASSY_SEEN"] != undefined) output(" They’ve even constructed an embassy in Esbeth.");
				output("”</i>");
				output("\n\nBianca smirks.");
				if (flags["KQ2_MYRELLION_STATE"] == undefined)
				{
					output(" <i>“I’m certain that this Estallia is still taking up space in the heads of every federation officer despite not being on their planet anymore.”</i>");
					output("\n\nSipping her water, Bianca leans back into the chair. <i>“If it were up to me, [pc.name], I would not have gone on that mission in the first place. But you found a third way: Estallia and her children can find their own path through the stars, starting on Mhen’ga... starting with peace.”</i> Her face brightens. <i>“Well done, [pc.name]. I know your father would be proud.”</i>");
				}
				else
				{
					output(" <i>“You made the right call... the myr ended up using their WMDs, wiping out most surface life. It seems she’s the only one of her kind to find peace now...”</i>");
					output("\n\nBianca leans back into her chair, idly gazing out at the room. <i>“But I know your father would be proud. You found a third way: you gave Estallia and her children a chance at peace and advancement even when everything around them fell to ruin. Hopefully they won’t repeat the mistakes their forebears did.”</i>");
				}
			}
			break;

		case 7:
			output("Plainly, you ask Bianca if she knows of the bothrioc on Myrellion. Her ears fold and she grimaces right away -- not unsurprising.");
			output("\n\n<i>“They are the reason I avoid the deepest parts of Myrellion. They share some things in common with the Dzaan. Chiefly, their ability to dominate the wills of those who resist them through chemical means. From a bulletin I’ve heard of an ambassador seeking to gain recognition as a member race of the U.G.C... but... I don’t know if I support that. They have every right to join if they can prove themselves worthy of it, but their nature perturbs me.”</i>");
			output("\n\nNot hard to see why, but you did meet that ambassador. <i>“Ara Kei Enya asked for my help. [ara.He] wanted to unite the bothrioc. One hell of an obstacle, as the wisest and most powerful among them cannot, on a biological level, stand to be around each other due to some kind of pheromone they produce. I was also asked to procure a counteragent for this so they could meet in peace.”</i>");
			output("\n\nDr. Ketria looks calmly at you, with a face that suggests nothing. Her concern is palpable. <i>“How did it go?”</i>");
			// Gave Ara Kei Counteragent
			if (flags["BOTHRIOC_QUEST_COUNTERAGENT"] > 0)
			{
				output("\n\nYou explain that you produced the counteragent, and gave them a chance at unity. It worked, and from what you heard, they’ve begun to unify as a species. Ara Kei’s vision of seeing them granted citizenship is well on its way. The more you talk though, the more you and Bianca wonder if it was worth it, but who’s to say?");
				output("\n\n<i>“Should they integrate into galactic culture then changes can be made,”</i> Bianca says evenly, her hesitation giving way to open-mindedness. <i>“...Perhaps I’m being unfair, too biased. The Dzaan can suppress their biology. If the bothrioc assimilate, then concessions can be made there, too. And,”</i> she says with a hopeful smile, <i>“they don’t deserve to be held back or endangered by the myr and their war.”</i>");
			}
			// Gave Ara Kei Fake Counteragent
			if (flags["BOTHRIOC_QUEST_COUNTERAGENT"] < 0)
			{
				output("\n\nYou explain that you handed Ara Kei the fake counteragent, deciding that it would have been too dangerous to let the bothrioc expand beyond Myrellion. Perhaps ending her dream of unity for her race wasn’t a choice you should have ever made, but it was one you ended up <i>having</i> to make.");
				output("\n\n<i>“I see,”</i> Bianca says, sipping her water. <i>“What you did was...”</i>");
				output("\n\nShe pauses for much too long, rubbing fingers all around her face. Her eyes open and close several times, trying to put together an answer. When she eventually finds one, Dr. Ketria leans forward, holding to her forearms. <i>“I don’t think it’s fair that their lives may be held back or even endangered by the myr and their war. If they had managed to unify, then I know we could integrate them successfully. The dzaan have suppressants for their biology, even. But... I do not know the bothrioc, I only have stories to go on, and being impartial is impossible, especially for me in their instance. What I can tell you, [pc.name]...”</i>");
				output("\n\nHer eyelashes flutter. <i>“You made a choice that may have saved many... and it may have been a choice that doomed others. Nobody has any right to judge you for what you were required to do. You saw a task through, and listened to your gut. One of the hardest things I’ve ever had to learn myself.”</i>");
			}
			break;

		case 8:
			output("Ho boy, there’s one story you’re not sure how you feel about. You recall the distress of the <i>Kashima</i> and look to Bianca perturbed by the livid memories racing through your mind. You tell her that your company informed you of one of their mining ships, the <i>Kashima</i>, going dark near one of Myrellion’s moons. You joined a detachment of Nova Security mercenaries to investigate and came face to face with a nightmare straight out of some old Earth fever dreams.");
			output("\n\n<i>“The ship was set to jam all communications and we had no contact with the crew. There was a mass of slime and organic growth all throughout the vessel, and the crew...”</i> You pause, disturbed by how clearly you remember them, <i>“They’d been infected with some sort of parasite. They became sex-mad creatures and their bodies were being subverted by its growth. The recently infected had only a few tentacles growing out of them and they had lost their grip on reality. The command staff were worse off, their entire bodies being overridden by the growth until they were nothing but writhing horrors walking.”</i>");
			output("\n\n<i>“My...”</i> Bianca’s lips quiver; her breath comes out like air from a smashed bellows. <i>“...You never know what you’ll find out in the galaxy, and they were the ones to stumble on something like that...”</i>");
			output("\n\nWhat you continue on with relieves the fox-doctor substantially. Things worked out as well as they could have. With Neykkar, the Nova Securities captain-on-duty, and the CMO Elenora, you were able to discover the original sample of the parasite and synthesize a cure that was deployed to great effect through the fire suppression system. Once everything quieted down, Steele Tech was able to reclaim the ship and get the crew some help. While you don’t know their fate from there, they at least have a chance to pull through.");
			output("\n\n<i>“That’s the most important thing, [pc.name],”</i> Bianca says, reaching over to pull you into a firm (yet awkward) hug. She holds it for a little longer, staring into every unique feature on your [pc.face] and burning it into memory. <i>“You know me... I’m just glad you’re okay. But well done all the same...”</i>");
			output("\n\nYou thank her and return the gesture.");
			break;

		case 9:
			output("While you were on Uveto, you had a chance meeting with a korgonne named Ula. You saved her life and she gave you the secret needed to gain entrance to her tribe’s hold. You met with her father, the chieftain, and earned yourself the privilege of coming and going as you pleased. ");
			output("\n\nIt’s a privilege you exercise frequently.");
			output("\n\nThen came the day Ula asked you to go with her dad to a meeting with a tribe of milodan, another native species to the moon. She didn’t trust them not to try something, especially not with lingering enmities.");
			output("\n\nBianca knows exactly where this is going.");
			output("\n\n<i>“They ambushed him, and there was nothing I could do to save him -- at the time. He’s alright, but I had to get back to the hold. Their hold was built on a massive reserve of savicite, and Pyrite wanted it. They armed a rival milodan tribe to capture the hold so they could get access to it all.”</i>");
			if (pc.hasItemByClass(PyriteIssuedStim)) output(" You show Bianca one of the single-use stimulants you picked up off one of the leopard-printed invaders.");
			output("\n\n<i>“Pyrite again,”</i> Bianca murmurs, <i>“they’re always looking to get a leg-up, no matter who they stomp on to do it. Arming natives against each other just so they can strip a planet and its people of their valuable resources? Not the first time they or anyone else has done it. Unfortunately, it doesn’t sound like they’ll be getting any punishment for it.”</i>");
			output("\n\nMaybe not, but they definitely won’t be trying it again. Ula’s dad was saved, and he passed the tribe onto her. They’re already looking at getting uplifted and engaging with the U.G.C. at large. To that, Bianca smiles her usual, winning smile.");
			output("\n\n<i>“Not many things in this life work out so well. I’m glad you’re meeting with success, [pc.name]. I’d tell you to keep it up... but then I’d just be encouraging your danger-seeking behavior.”</i>");
			output("\n\nProbably!");
			break;

		case 10:
			output("Ha. You’ve got one crazy story, and you’re not sure if Bianca will believe it. You ask if she’s ever been to or heard of Uveto.");
			output("\n\n<i>“I have not, [pc.name]. But, try me!”</i> she exclaims.");
			output("\n\n<i>“I fought a dragon, and won.”</i> You say it so matter-of-factly that it’d be heard as truth to people who don’t even know you. It is true, yes, but your foxen partner isn’t totally convinced yet. Bianca raises one eyebrow and doesn’t know which expression to settle her pretty face on. <i>“A... <b>dragon?</b>”</i> she asks. ");
			output("\n\n<i>“A dragon.”</i>");
			output("\n\nYou whip out your codex and pull up the page on Frostwyrms, passing it to Bianca who regards it with disdain and some fear. She then looks at you, her hands trembling a bit, and back to the codex. <i>“You fought this monster!? How... this can’t be right, but...”</i>");
			output("\n\nYou give her a very smug grin, accepting your codex back. <i>“It’s a psionically capable creature, able to project a shield with its mind somehow. It being the size of a ship is another thing, but I brought it down. I defeated this thing, all by myself!”</i>");
			output("\n\n<i>“You defeated a dragon!?”</i>");
			output("\n\nThe she-fox’s face contorts into a nervous grin then into an amazed smile... and then a goofy, unbelieving expression. Her countenance is totally overwhelmed by the news, but that is certainly to be expected when you tell her " + (silly ? "of your accomplishments in a video game." : "of something so crazy."));
			output("\n\n<i>“I don’t think I will ever fully comprehend you, [pc.name] Steele... but, I believe you. And you know what?”</i> Bianca muses with a dopey grin, <i>“...I bet your dad didn’t slay a dragon.”</i>");
			output("\n\nYeah, he probably laid it. ");
			output("\n\nYou both laugh uproariously. ");
			if (flags["FROSTWYRM_KIP_COUNT"] != undefined) output("\n\nAs soon as the laughter dies down, your thoughts turn back to the affair you have with " + (flags["FROSTWYRM_NOT_HOSTILE"] >= 2 ? "[frostwyrm.name]" : "the frostwyrm") + " and hope your qim isn’t intruding on your shameless boasting right now...");
			break;
	}

	flags["BIANCA_STORIES_HEARD"] |= 1 << story;
	
	biancaTalkEndMenu(false);
}