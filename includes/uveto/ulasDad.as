//Approach
public function approachUlasDad(back:Boolean = false):void
{
	clearOutput();
	showBust(korgChiefBustString());
	showName("ULA’S\nFATHER");
	author("Fenoxo");
	if(back) output("<i>“Something else needing, [pc.name]?”</i>");
	else output("The wizened korg jerks upright at your approach, ears swiveling in alarm before the weight of his advanced age flops drags them back down. <i>“Oh. " + (korgiTranslate() ? "It’s just":"Just") + " Ula’s friend.”</i> He sighs so hard that his body appears to deflate, just a little bit. <i>“" + (korgiTranslate() ? "What can this old korg do for you?":"What can old korg doing for you?") + "”</i>");
	clearMenu();
	addButton(0,"Appearance",ulaDadAppearance);
	addButton(1,"Talk",talkToUlaDad);
	addButton(14,"Leave",mainGameMenu);
}

//[Appearance]
public function ulaDadAppearance():void
{
	clearOutput();
	showBust(korgChiefBustString());
	showName("ULA’S\nFATHER");
	author("Fenoxo");
	output("Ula’s father, the former Chieftain of Korg’ii Hold, is no stranger to the ravages of time. A lifetime of sedentary tasks and good eating has left him chubbier than the average korgonne and even less suited to physical activities than the tribe’s other elders, but his eyes radiate the keen intellect and confidence that can only come from of a lifetime of trying to solve an entire tribe’s problems single-handedly.");
	output("\n\nWearing more jewelry than the average male korg, he dresses in little but a single loincloth" + (silly ? " and strangely bright shirt":"") + " for modesty. His coat of shaggy white fur proudly tells his age in the same way that a tree trunk’s rings might chronicle its years, matched perfectly by a mop of alabaster hair. Idly stroking a flowing beard, the former tribal leader stares back at you in the same way that you look at him.");
	output("\n\nIt’s uncomfortable to be weighed with someone else’s eyes, but whatever he thinks of you, his thankfulness is writ plain on his face. This old korg is unlikely to forget the service you have done for him and his people.");
	clearMenu();
	addButton(0,"Next",approachUlasDad,true);
}

//[Talk]
public function talkToUlaDad():void
{
	clearOutput();
	showBust(korgChiefBustString());
	showName("ULA’S\nFATHER");
	author("Fenoxo");
	output("You ask Ula’s father if he has a minute to talk.");
	output("\n\nSilently, the grizzeled dog-man grants you a slow nod.");
	ulaDadTalkingMenu(talkToUlaDad);
}

public function ulaDadTalkingMenu(arg:Function):void
{
	clearMenu();
	if(arg == ulasDadsName) addDisabledButton(0,"His Name","His Name","You just had this discussion.");
	else addButton(0,"His Name",ulasDadsName,undefined,"His Name","Ask him for his name, since you’ve yet to discover it.");
	if(arg == ulasDadUlaTalk) addDisabledButton(1,"Ula","Ula","You just had this discussion.");
	else addButton(1,"Ula",ulasDadUlaTalk,undefined,"Ula","Ask him about his daughter, and what he thinks of how she’ll do as Chieftess.");
	if(arg == ulasDadTalksAboutHerMom) addDisabledButton(2,"Ula’s Mom","Ula’s Mom","You just had this discussion.");
	else addButton(2,"Ula’s Mom",ulasDadTalksAboutHerMom,undefined,"Ula’s Mom","Inquire into Ula’s mother - who is she is, and where is she?");
	if(arg == talkToUlasDadAbootAliens) addDisabledButton(3,"Aliens","Aliens","You just had this discussion.");
	else addButton(3,"Aliens",talkToUlasDadAbootAliens,undefined,"Aliens","What about aliens? What does he think of them now?");
	if(arg == ulaDadMiloTalk) addDisabledButton(4,"Milodans","Milodans","You just had this discussion.");
	else addButton(4,"Milodans",ulaDadMiloTalk,undefined,"Milodans","What are his thoughts on the milodans, and why did he seek peace with them?");
	if(arg == ulaDadPCOpinion) addDisabledButton(5,"You","You","You just had this discussion.");
	else addButton(5,"You",ulaDadPCOpinion,undefined,"You","Ask him what he thinks of you.");

	if(silly)
	{
		if(arg == ulaDadShirtTalk) addDisabledButton(6,"Shirt","Shirt","You just had this discussion.");
		else addButton(6,"Shirt",ulaDadShirtTalk,undefined,"Shirt","Ask him about the swag-ass shirt he’s sporting!");
	}

	addButton(14,"Back",approachUlasDad,true);
}

//[His Name]
public function ulasDadsName():void
{
	clearOutput();
	showBust(korgChiefBustString());
	showName("ULA’S\nFATHER");
	author("Fenoxo");
	output("You introduce yourself and ask the former Chief what his name is, since you haven’t gotten it yet.");
	output("\n\nThe old korg chuckles softly, shaking his head. <i>“" + (korgiTranslate() ? "I haven’t used my name in many years. ‘Chief’ was enough for all the korg of my tribe. ‘Old Chief’ is pretty good too.":"Not usinged name in many years. ‘Chief’ enough for all korg of tribe. ‘Old Chief’ good too.") + "”</i> He smiles. <i>“" + (korgiTranslate() ? "It’s more true now than ever, and more true with every day that passes!":"More truing now than ever. More truing every day passed!") + "”</i> He waves dismissively. <i>“" + (korgiTranslate() ? "Doesn’t matter now. Call me what you want. My name is mine until I go as cold as the snow.":"Not mattering now. Call what want. Naming mine to keep until pass into forever-colds.") + "”</i>");
	processTime(2);
	ulaDadTalkingMenu(ulasDadsName);
}

//[Ula]
public function ulasDadUlaTalk():void
{
	clearOutput();
	showBust(korgChiefBustString());
	showName("ULA’S\nFATHER");
	author("Fenoxo");
	output("You ask him about Ula, his daughter, and what he thinks of how she’s doing as Chieftess.");
	output("\n\n<i>“" + (korgiTranslate() ? "Ula’s dumb,":"Ula dumb,") + "”</i> he announces without pause. <i>“" + (korgiTranslate() ? "She’s too young to know how stupid she is. Thinks every idea is the best just because she’s the one to have it - sort of like an elder, if I’m being honest. The young and the old aren’t so different, but fat chance getting either side to admit it.":"Too young for knowing how stupid is. Think every idea is best idea just because she having it. Sort of like Elder korgs if being honest. Old and young not so different, but most not see it.") + "”</i> He snorts in amusement. <i>“" + (korgiTranslate() ? "It took me longer than it should have to realize it. The time for torch-passing was long ago.":"Me not see it for too long. Timing for torch-passing such long ago.") + "”</i>");
	output("\n\nYour surprise at his critical opinion shows plain as day.");
	output("\n\n<i>“" + (korgiTranslate() ? "Don’t get the wrong idea!":"Not get wronging idea!") + "”</i> He leans forward onto one knee and jabs his finger at you as he speaks. <i>“" + (!korgiTranslate() ? "Ula prove self. All new Chiefs dumb. All old Chiefs get dumb. Only way learn by mistaking. Will know if she good Chieftess by how fast learning from Ula-make problems.":"Ula proved herself. All new Chiefs are dumb, and all old Chiefs get dumb. She’ll learn from her mistakes. The mark of a good Chieftain or Chieftess is how fast they can learn from the problems they create.") + "”</i> He leans back a bit, and scratches at his beard. <i>“" + (!korgiTranslate() ? "Think Ula good learner. Knew more core-stuff than any elder, even before making alien-friend. If not over-pride, she maybe be best chief in time. Maybe just silly father-thinking, though.":"I think Ula will learn well. She knew more core-magics than any elder even before making friends with you. If she can manage her pride, she may be the best Chief we’ve ever had. Maybe that’s just my fatherly pride speaking, though.") + "”</i>");
	output("\n\nThe old korg shrugs, apparently finished.");
	processTime(4);
	ulaDadTalkingMenu(ulasDadUlaTalk);
}

//[Ula’s Mom] (Juko. Fierce warrior with even fiercer breeding instincts - died fighting a frostwyrm)
public function ulasDadTalksAboutHerMom():void
{
	clearOutput();
	showBust(korgChiefBustString());
	showName("ULA’S\nFATHER");
	author("Fenoxo");
	output("Since Ula’s mother doesn’t seem to be around, you ask the old korg about who she was and what happened to her.");
	output("\n\nThe former Chief nods slowly, his face solemn. <i>“" + (!korgiTranslate() ? "She colded long ago, when Ula still young pup.":"She went cold long ago, when Ula was still a young pup.") + "”</i> He turns away from you to look out the window, gaze lost in the snows beyond. <i>“" + (!korgiTranslate() ? "Strong woman. Best warrior in tribe, even. Hunt kor’diiaks all by self. Once ambush by double milodans and still win. Only lose tip of ear - no big loss. Make her stand out even more. Already prettier than other females. Still not quite sure why she pickinged me, but happinying she did.":"She was a strong woman, Ula’s mother - the best warrior in the tribe, even. She hunted kor’diiaks all by herself. Once, she was ambushed by two milodans and still won. The only wound she took was the tip of one ear - no big loss. It made her stand out even more. If she was pretty before, well... then she was the prettiest girl in the entire hold. I’m still not sure why she picked me, but I’m happy she did.") + "”</i>");
	output("\n\nYou tilt your head and ask if she courted him.");
	output("\n\nThe white-furred dog-man nods, turning to you curiously. <i>“" + (!korgiTranslate() ? "Is korg way. Females keepers of breeding urges. Share with males when wanting pups. Aliens not like this?":"It is the korg way. Females are the keepers of our breeding urges. When they want pups, they share with the males. Are aliens not like this?") + "”</i>");
	output("\n\n<i>“A few, perhaps, but not most.”</i>");
	output("\n\n<i>“" + (!korgiTranslate() ? "Aliens weird as always.":"Aliens are weird as always.") + "”</i> He waves you off and continues, <i>“" + (!korgiTranslate() ? "Her name Juko. I give for keeping memory warm, even if body cold. She take me, share much warmth. Most warms in tribe, me thinking.":"Her name was Juko. I share her name to keep her memory warm, even if her body is cold. She took me, and she shared much warmth. It seemed like we had more than anyone else in the tribe.") + "”</i>");
	output("\n\nIs he... blushing?");
	output("\n\n<i>“" + (!korgiTranslate() ? "And from all warms came daughter! Look perfect. Healthy. Maybe little small, but what pup not? Name Ula and raise with love. She want be hunter like mother at first.":"And from all that sharing of warmth came a daughter! She looked perfect. Healthy. Maybe she was a little small, but what pup isn’t? We named her Ula and raised with love. She wanted to be a hunter like her mother at first.") + "”</i> He shakes his head. <i>“" + (!korgiTranslate() ? "Not last. Not after Juko colding. Known might happen. Is hunter risk. Get see all snows, go where want, but can colding any day, any time.":"It wasn’t meant to last, not after Juko went cold. We all knew it might happen. It’s the risk all hunters take. They get to see the snows and go where they want, but they can go cold at any time.") + "”</i>");
	output("\n\nLeaning closer, you ask, <i>“What happened?”</i>");
	output("\n\n<i>“Frostwyrm.”</i> The former chief practically spits the word. <i>“" + (!korgiTranslate() ? "More scale-dragons back then, before Wyrm-Murder tribe find smart ways to kill. Bad hunting season lead Juko faring than normal. Great beast attacking, and she fight back.":"There were more scale-dragons back then, before the Wyrm-Murder tribe got better and smarter about killing them. A bad hunting season drove Juko farther out than normal. When that great beast attacked, she fought back.") + "”</i> He thumps his chest. <i>“" + (!korgiTranslate() ? "Juko strong. Not eaten. She take eye with spear but wyrm taking arm for trophy. She make it halfway back on own, before other hunters finding.":"Juko was strong. She didn’t get eaten. She gouged its eye out with her spear, but the wyrm stole her arm for a trophy. Both retreated after, but Juko only made it halfway back on her own, before other hunters could find her.") + "”</i> A tear rolls down his cheek. <i>“" + (!korgiTranslate() ? "Went cold before making home, but not before telling story to hunter-friends, and they telling to tribe. We not forgetting.":"She was cold before making it home, but not before telling her story to her hunting friends. They told me, and the rest of the tribe, her story. We won’t forget it.") + "”</i>");
	//Nice
	if(pc.isNice()) output("\n\nYou express your condolences.");
	//Mischievous
	else if(pc.isMischievous()) output("\n\nYou suggest that a wound to the eye could be every bit as fatal as a dismembered arm.");
	//Hard
	else output("\n\n<i>“She knew the risks.”</i>");
	//Merge
	output("\n\nWith a slow stroke of his beard, Ula’s father gives you the slightest nod. <i>“" + (!korgiTranslate() ? "After, Ula not want be hunter, but not want stay in burrow either. She wanting explore. Want find better ways than old ways - ways where hunters not have be scared of long colds.":"After, Ula didn’t want to be a hunter anymore, but she didn’t want to stay in the burrow either. She wanted to explore and find better ways than the old ways - ways where our hunters wouldn’t have to be scared of the long cold.") + "”</i> He shakes his head. <i>“" + (!korgiTranslate() ? "Silly girl sometimes.":"She’s a silly girl, sometimes.") + "”</i>");
	output("\n\nWith no further words forthcoming, you suppose this conversation to be over.");
	processTime(8);
	ulaDadTalkingMenu(ulasDadTalksAboutHerMom);
}

//[Aliens] (And uplifting by proxy)
public function talkToUlasDadAbootAliens():void
{
	clearOutput();
	showBust(korgChiefBustString());
	showName("ULA’S\nFATHER");
	author("Fenoxo");
	output("You ask the former Chief what he thinks about aliens.");
	output("\n\n<i>“" + (!korgiTranslate() ? "Not obvious":"It’s not obvious") + "?”</i> He snorts out a laugh. <i>“" + (!korgiTranslate() ? "Aliens mostly garbage. Lazy. Greedy. Thinking self is better than all others. No respect for those without core-magic. Come to Uveto and drive small clans out of holds just for digging out rocks.":"Aliens are mostly garbage. Lazy. Greedy. They think they’re better than everyone else and have no respect for anybody without core-magic. They come to Uveto and drive small clans out of holds just to dig up some rocks.") + "”</i> He spits. <i>“" + (!korgiTranslate() ? "Every alien have small bit of gem-heart inside, always wanting for more sparkle no mattering how much hurt caused.":"Every alien has a little bit of a gem-heart inside them, always wanting more money no matter how much hurt they cause.") + "”</i>");
	output("\n\nYou fumble for a response.");
	output("\n\n<i>“" + (!korgiTranslate() ? "Not worry":"Don’t worry") + ".”</i> The old korg waves disarmingly. <i>“" + (!korgiTranslate() ? "Gem-hearts can still be good, still put urges for good of clan. Some alien same way. It just hard for knowing which. Most not that way.":"Gem-hearts can still be good, can put their urges to work for the good of the clan. Some aliens are the same way. It’s just hard to know which, especially when most are so villainous.") + "”</i> He scratches his beard in thought. <i>“" + (!korgiTranslate() ? "Two tribes, old allies, gone now. Holds chewed up like machinefood. One find safety in other clan. Many snouts one burrow, but safe. Other disappear. Thinking milodan or alien take. Make slaving.":"Two tribes, our old allies, are gone now. Their holds got chewed up like food for alien machines. One found safety with another clan. A lot of snouts had to squeeze into one burrow, but at least they’re safe. The other vanished. Milodans or aliens must have taken them and made them slaves.") + "”</i>");
	output("\n\nAfter a pause to gather yourself, you ask if any tribes have good relations with the aliens.");
	output("\n\n<i>“Maybe one or two.”</i> The grizzled elder admits. <i>“" + (korgiTranslate() ? "Some trade shinies with the alien town - Irestead is its name, I think. Ula’s leading the Korg’ii the same way, now. Maybe it’s for the best. Maybe we need to let the old ways go cold, but the though leaves my heart heavy anyway.":"Some trade shinies with alien hold. Iresteading is name, thinking. Ula taking Korg’ii same way, now. May be best. Maybe old ways need let go cold, but heavy heart anyway.") + "”</i> He sighs. <i>“" + (!korgiTranslate() ? "Alien ways feel strange. Talk different.":"Your ways feel too strange. Perhaps we can talk about something different.") + "”</i>");
	processTime(6);
	ulaDadTalkingMenu(talkToUlasDadAbootAliens);
}

//[Shirt] (Silly only)
public function ulaDadShirtTalk():void
{
	clearOutput();
	showBust(korgChiefBustString());
	showName("ULA’S\nFATHER");
	author("Fenoxo");
	output("You ask him about the shirt he’s wearing.");
	output("\n\n<i>“What shirt?”</i> the old korgonne growls. <i>“" + (!korgiTranslate() ? "I no see any shirt. What is shirt?":"I don’t see any shirt. What’s a shirt?" ) + "”</i> He waves an arm around in annoyance. <i>“" + (!korgiTranslate() ? "Alien drink too much crazy-water. Maybe if not make <b>silly</b> thoughts, not see silly shirts.":"You drink too much crazy-water. Maybe if your head wasn’t so full of <b>silly</b> thoughts, you wouldn’t see silly shirts.") + "”</i>");
	processTime(1);
	ulaDadTalkingMenu(ulaDadShirtTalk);
}

//[Milodans] (history & why peace pursued) - massive war between all tribes when he was young. Father brokered peace that lasted decades.
public function ulaDadMiloTalk():void
{
	clearOutput();
	showBust(korgChiefBustString());
	showName("ULA’S\nFATHER");
	author("Fenoxo");
	output("You inquire as to why he pursued peace with the Milodans, knowing the risks.");
	output("\n\n<i>“Not knowing all risks.”</i> The shaggy old korg slumps. <i>“" + (!korgiTranslate() ? "Thought might be made cold or slavinged. Did not thinking druggings and forcing to show hold entrance. If knowinged... if knowinged at all, would have killed self when ambushed.":"I thought I might be killed or enslaved. I didn’t think I’d be drugged and forced to show the them the entrance to the hold. If I knew... if I had any idea, I would have killed myself when I was ambushed.") + "”</i> He openly weeps. <i>“" + (!korgiTranslate() ? "So much hurt and pain, all because I try for peace, thinking only risking self. Worst mistake ever make as chief.":"So much hurt and pain, all because I foolishly tried for peace, thinking I was only risking myself. It was the worst mistake I ever made as Chief.") + "”</i>");
	output("\n\nPatting him on the shoulder, you listen in silence as he’s wracked by sobs.");
	output("\n\n<i>“" + (!korgiTranslate() ? "But still, must try somehow. Maybe another way smarter, but I not think of it.":"But still, I had to try somehow. Maybe another way would have been smarter, but I didn’t think of it.") + "”</i> He straightens a little. <i>“" + (!korgiTranslate() ? "When was just small pup, all korgonne and milodan at war. Always killing and fighting and slaving. So many hunters covered in claw scars or come home cold. Just as bad for milodans too, though they not admit. Korgonne small but fierce. Have better weapons than cats and better armors sometimes too. If dig down a little in right place, can still find where ice stained purple with blood. Whole tribes of korgonne and milodan lost, even pups and kittens.":"When I was but a small pup, all korgonne and milodan were at war. We were always fighting and killing and slaving. So many hunters came home covered in scars or worse. It was just as bad for the milodans too, though they might not admit it. Korgonne are small but fierce. We had better weapons than the milodans and sometimes better armors too. You can still find ice stained purple with blood if you know where to dig. Whole tribes were lost on both sides, even pups and kittens.") + "”</i>");
	output("\n\nYou knew the two groups weren’t friendly, but you didn’t know they were that unfriendly.");
	output("\n\n<i>“" + (!korgiTranslate() ? "Father knew must end or all grow too weak for survive. Wise korg. He gather leaders of almost all korgonne tribes and biggest milodan tribe-alphas for talks.":"Father knew the war had to end or everyone would be too weak to survive - such a wise korg. He gathered the leaders of almost every korgonne tribe along with the milodan tribal alphas for talks.") + "”</i> His expression turns somber once more. <i>“" + (!korgiTranslate() ? "Milodans not like talking with korg anymore than korgonne like talking with fang-cats, not after each kill so many of other, but father talk anyway.":"The milodans didn’t like talking with us anymore than we liked talking with them, not after killing so much of each other, but my father talked anyway.") + "”</i>");
	output("\n\nYou ask, <i>“And they made peace?”</i>");
	output("\n\nThe ex-Chieftain shakes his head slowly. <i>“" + (!korgiTranslate() ? "No. Not from words. Pains too deep for word-healing. Father try everything until finally come up with option fang-kitties like: his life for ending war.":"No. Not from words. Anger and pain alike were too deep for words to heal those wounds. Father tried everything he could until he finally came up with an option the fang-kitties liked: trading his life for ending the war.") + "”</i>");
	output("\n\nThere’s no hiding your gasp.");
	output("\n\n<i>“" + (!korgiTranslate() ? "Ula’s grandfather, wisest Chief ever, gave self over to milodans for safety-having of all korgonne. Tribe not know what happen to him and probably never know. Maybe colded. Maybe tortured. Maybe he live as slave for long times, but war end. Milodan and korgonne hunters stop trying kill each other. Maybe tussle in snow, make punishment licks or warms, but none cold.":"Ula’s grandfather, the wisest Chief in our history, gave himself over to the milodans in exchange for the future safety of all korgonne. We don’t know what happened to him after and probably never will. Maybe they gave him over to the forever cold right away, but they might have tortured or enslaved him. Either way, the war ended. Milodan and korgonne hunters stopped trying to kill each other on sight. Maybe they’ll tussle in the snow, make the loser give punishment licks or share warmth, but nobody is driven into the cold.") + "”</i> He pauses to gather his breath, exhausted from the speech. <i>“" + (!korgiTranslate() ? "Last so long that most still fight that way for keeping peace, until one tribe go back for killing. Just wanted for make suffering stop. Try to live up to father-memory.":"His plan worked so well that most still fight that way to this day, trying to keep the peace. Until one tribe went back to killing... I just wanted to end the suffering - to live up to my father’s memory.") + "”</i>");
	output("\n\nHis actions make a lot more sense in light of that. <i>“The ones still holding to the peace - what do you think of them?”</i>");
	output("\n\nThe old dog shrugs. <i>“" + (!korgiTranslate() ? "Not muching. Sort of like aliens. Always wanting and always ready for fight to have. Maybe is nature. Maybe is from now having burrows of own. Too big for diggings easy. They live in snows and cold. Maybe if korg live like that, they angry and fighty too. Not know. Too busy trying for keep hold safe from bad fang-cats to friend-make, but maybe Ula can. She have nice alien-friend, after all.":"Not much. They’re sort of like you aliens: always wanting and always ready to fight to have whatever they’ve got their sights on. Maybe it’s their nature. Maybe it’s because they don’t have burrows of their own. They’re too big for easing digging and have to live among the cold snows. Maybe if we korgonne lived like that, we’d be angry and fighty too. I don’t know. I was too busy trying to keep the hold safe from the worst of them to make friends, but maybe Ula can. She made friends with an alien, after all.") + "”</i>");
	output("\n\nWith no further speech forthcoming, you consider if you’d like to ask him anything else.");
	processTime(10);
	ulaDadTalkingMenu(ulaDadMiloTalk);
}

public function ulaDadPCOpinion():void
{
	clearOutput();
	showBust(korgChiefBustString());
	showName("ULA’S\nFATHER");
	author("Fenoxo");
	output("You ask him what he thinks of you.");
	//[PC Opinion] - Ula kids more than 10
	if(StatTracking.getStat("pregnancy/ula sired") >= 10)
	{
		output("<i>“" + (!korgiTranslate() ? "What am thinking of [pc.name]?":"What do I think of you?") + "”</i> the old korg muses aloud. <i>“" + (!korgiTranslate() ? "Having many thoughts. Gratefulness for hold saving, yes. More thanking for Ula-saving too. Dumb she-pup might be forever-cold if not for alien.":"I have many thoughts: gratefulness for saving the hold, yes. I also owe you for saving Ula as well. The dumb she-pup might have died if not for you.") + "”</i> He reaches out to grab your hand, his grip surprisingly tight. <i>“" + (!korgiTranslate() ? "Also angry. [pc.name] ruin Ula for korgonne males. I knowing you sire puppies. Many puppies.":"I’m also angry. You ruined Ula for korgonne males. I know it’s you siring her puppies. Many puppies.") + "”</i> He snorts. <i>“" + (!korgiTranslate() ? "I welcome into hold, and you breed daughter like rutting fang-cat.":"I welcomed you into the hold, and you bred my daughter like a rutting milodan.") + "”</i> His lips peel back, revealing a surprisingly sharp set of canines. <i>“" + (!korgiTranslate() ? "Not think me happying about this. It Ula smiles and tribe-saving that keep you welcoming.":"Don’t think I’m happy about this. It’s Ula’s smiles and what you did for the tribe that keep you welcome.") + "”</i> He lets you go. <i>“" + (!korgiTranslate() ? "Not sure if alien smartest alien of all time or dumbest. Hopefully for pups, will be smarts.":"I’m not sure if you’re the smartest alien of all time or the dumbest. Hopefully for your pups, it’s the former.") + "”</i>");
		output("\n\nYou awkwardly scratch the back of your neck, fishing for a reply.");
		output("\n\n<i>“Bah!”</i> the former Chief interjects. <i>“" + (!korgiTranslate() ? "Probably not all [pc.name] fault. Knowing Ula has strongest breed-scent in tribe. Is why not let see males before escape. My faultings too that she find alien for mate instead of strong hunter.":"I can’t blame it all on you. I knew Ula had the strongest breed-scent in the tribe. It’s why I didn’t let her see any males before she ran away. If only I had been more lenient, perhaps she would’ve found a strong hunter instead of an alien.") + "”</i> He slouches back a bit, tired. <i>“" + (!korgiTranslate() ? "You do what any male... or female... do when Ula spread legs. Only little mad. At least she having children. Maybe have other talk?":"YOu did what any male... or female... would do when Ula spreads her legs. I’m only a little mad. At least she’s having children. Maybe we can talk about something else?") + "”</i>");
	}
	//[PC Opinion] - Bimbo
	else if(pc.isBimbo())
	{
		output("<i>“" + (!korgiTranslate() ? "What am thinking of [pc.name]?":"What do I think of you?") + "”</i> the old korg muses aloud. <i>“" + (!korgiTranslate() ? "Thinking mostly thankful, but also not sure how so good at battle. Thinking of breeding all times but somehow save hold from milodan invasion! Not understanding, but still thankful. Expect [pc.name] warm-shares for whole tribe when not saving, but not hear complaints for anykorg.":"I think I’m mostly thankful, but I don’t quite understand how you’re so good in battle. You think of nothing but breeding, yet somehow you saved the hold from a milodan invasion! I can’t understand it, but I’m still thankful. I expect you go around sharing warmth with the whole tribe when you’re not saving us, but I’ve yet to hear complaints from anykorg.") + "”</i> He shrugs. <i>“" + (!korgiTranslate() ? "Supposing alien is very strange but good ally.":"I suppose you’re very strange but a good ally.") + "”</i>");
	}
	//[PC Opinion] - Bro
	else if(pc.isBro())
	{
		output("<i>“" + (!korgiTranslate() ? "What am thinking of [pc.name]?":"What do I think of you?") + "”</i> the old korg muses aloud. <i>“" + (!korgiTranslate() ? "Thinking alien not that different from korg males. Not waste words when not have to. Only difference seems be urges for heat-sharing, but that normal for aliens. All aliens breed crazy, but [pc.name] save whole hold anyway. Probably warm-sharing with whole tribe, but not hearing complaints from anykorg.":"I think you alien but not that different from korg males. You don’t waste words when you don’t have to. The biggest difference seems to be your urges for heat-sharing, but that’s normal for aliens. You’re all breed crazy, but you saved the whole hold anyway. You probably share your warmth with everyone in the tribe, but I’ve yet to get a complaint from anykorg.") + "”</i> He shrugs. <i>“" + (korgiTranslate() ? "I suppose that makes you a good ally.":"Supposing alien is good ally.") + "”</i>");
	}
	//[PC Opinion] - Ula kids less than 5
	else
	{
		output("<i>“" + (!korgiTranslate() ? "What am thinking of [pc.name]?":"What do I think of you?") + "”</i> the old korg muses aloud. <i>“" + (!korgiTranslate() ? "Thinking alien strange, like all alien, but still treat Korg’ii Tribe like own. Save Ula. Save whole Tribe. Much talking and learning both ways. If more aliens like [pc.name], maybe Uveto be better place for both living. Maybe alien important ally in time-coming.":"I think you’re strange, like all aliens, but you still treat the Korg’ii Tribe like your own. You saved Ula. You saved the whole tribe. You’ve gone around the hold talking and learning and sharing with everyone. If more aliens were like you, [pc.name], Uveto might be a better place for all of us to live. You might be an important ally in the times to come.") + "”</i>");
	}
	processTime(2);
	ulaDadTalkingMenu(ulaDadPCOpinion);
}