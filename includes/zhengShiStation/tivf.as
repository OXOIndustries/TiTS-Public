public function showTivf(nude:Boolean = false):void
{
	showName("\nTIVF");
	showBust("TIVF" + (nude ? "_NUDE" : ""));
}

//Play first time entering Maike’s quarters.
public function tivfGreeting():void
{
	clearOutput();
	showTivf();
	output("You slide open the door to the Overseer’s quarters and slip inside when you’re sure nobody’s looking. Inside, you find a room that’s dark and sultry; the lights are dimmed to almost nothing and the air inside is thick with the smell of incense. It looks more like a room in a high-class bordello than a pirate’s quarters... especially when you take in all the black leather and latex hung up on the walls between silky drapes and hooks for restraints.");
	output("\n\nSomebody’s inside, a shadowed figure lounging on the huge silk-sheeted bed with a cigarette holder idly protruding from its lush black lips. Your hand drifts to your [pc.weapon] for a moment before you realize the armor this individual’s wearing is only chitin, black plates hugging golden skin in patches from his toes to his shoulders. A pair of wings rest behind him, and golden-brown, quill-like hair hangs down from his scalp in a lush, thick braid. The only clothing the young man - the zil, you recognize - is wearing are a pair of tight leather shorts that hug his broad hips tightly and neatly wrap around a hefty bulge.");
	output("\n\n<i>“You’re... not Mistress Maike,”</i> the zil boy croons, rolling onto his side and taking a long drag of the scented cig in his mouth. His insectile wings make a little flutter behind him, causing a cascade of jingles and clinks. You squint at the dark, realizing that his wings are covered in ring piercings and little gold and silver chains.");
	output("\n\n<i>“Who are... oh, it doesn’t matter,”</i> he sighs. <i>“The slave overseer is working overtime in the mines lately, you’ll find her there. My apologies.”</i>");
	output("\n\nGood to know, you suppose. Still, you ask, <i>“Who’re you?”</i>");
	output("\n\n<i>“Me?”</i> the zil echoes, surprised. <i>“I am Tivf, the overseer’s personal... servant. And you... you I don’t think are supposed to be here, are you?”</i>");
	output("\n\n<i>“You’re no pirate,”</i> he adds, looking you up and down. <i>“You should know that Mistress Maike will put you in a collar if she finds out you’ve snuck in... and trust me, she <b>loves</b> collars... and restraints... and more. Unless you’re sneaking in here hoping to get rid of her, anyway...”</i>");
	//append Tivf’s talk menu options here.
	processTime(3);
	flags["MET_TIVF"] = 1;
	tivfTalkMenu();
}

//Repeat Greetings
public function repeatTivfApproach(back:Boolean = false):void
{
	clearOutput();
	showTivf();
	if(back) output("What else would you like to talk to Tivf about?");
	else
	{
		output("<i>“Ah, you’re still wandering these halls?”</i> the zil boy murmurs, sitting up as you approach. <i>“Be careful, or else Mistress Maike will find out you’ve been in here. She won’t take kindly to it.”</i>");
		processTime(1);
	}
	tivfTalkMenu();
}

public function tivfTalkMenu():void
{
	clearMenu();
	addButton(0,"Maike",maikeMyDayTivf,undefined,"Maike","Get a little more info about this Mistress Maike.");
	addButton(1,"Slave Pen",slavePenTivfTalk,undefined,"Slave Pen","You saw the slave pen at the end of the hallway. What can he tell you about it?");
	addButton(2,"His Role",tivfRoleTalk,undefined,"His Role","So what does Tivf do around here?");
	if(9999 == 9999) addButton(3,"The Elevator",askTivfAboutTheElevator,undefined,"The Elevator","Hey, how are you supposed to get into the lower levels? The elevator’s broke.");
	else addDisabledButton(3,"The Elevator","The Elevator","You already fixed the elevator, silly.");
	addButton(14,"Leave",mainGameMenu);
}

//[Maike]
//Get a little more info about this Mistress Maike.
//Can’t do this talk if Maike’s already beaten.
public function maikeMyDayTivf():void
{
	clearOutput();
	showTivf();
	flags["TIVF_MAIKE_TALK"] = 1;
	output("<i>“Tell me about your mistress,”</i> you prompt the zil boy.");
	output("\n\n<i>“What’s there to tell?”</i> he laughs airily. <i>“She’s a slaver. A starfarer like you. She’s large, has horns, but also wings and a stinger like a zil. Though her stinger ejects something <b>very</b> different than one of my sisters’ would...”</i>");
	output("\n\nTivf sniggers at some hidden meaning. <i>“Sorry. She’s... exactly what I was told to expect from starfarers: she is cruel and sadistic, loves to take advantage of every slave she can get her wicked hands on. Nothing is too sacred to violate, nor too taboo to indulge in. If she sees someone as attractive as you, I know she’d go for you in a heartbeat! If she does, don't struggle: she likes it most when she has to work for her play.”</i>");
	output("\n\nThat’s distressing... but also maybe something you could use to your advantage. <i>“And where is she right now?”</i>");
	output("\n\nThe zil shrugs. <i>“Somewhere in the mine, I guess? She’s been ‘working’ so much lately, sometimes for days at a time. She usually works in the deepest parts - at least, that’s what she says, while making me explore </i>hers<i>. If you want to find her, and I can’t imagine why you would, you’re on your own exploring the mines. I’ve never been down there, and from what Mistress Maike tells me, I don’t want to.”</i>");
	output("\n\nYeah, a delicate boy like him would probably get eaten alive down there... or worse, get some callouses.");
	processTime(5);
	clearMenu();
	addButton(0,"Next",repeatTivfApproach,true);
}

//[Slave Pen]
//You saw the slave pen at the end of the hallway. What can he tell you about it?
public function slavePenTivfTalk():void
{
	clearOutput();
	showTivf();
	output("<i>“The other slaves?”</i> Tivf echoes back at you after your question. <i>“Mistress Maike keeps me separate from them... calls them dirty and barbaric. I say, if that’s so, she should take better care of them... but she never listens to my advice.”</i>");
	output("\n\n<i>“Any way to get them out?”</i>");
	output("\n\nTivf shakes his head. <i>“No, no... Mistress Maike would punish you horribly if you did! And me too, just for knowing you! Besides, you can’t possibly open the pen without her. She carries the only key with her at all times, even when she bathes or uses my talents. All the slaves within the mine level are her responsibility, and I think her war-chief would punish </i>her<i> very badly if there were any problems with the mine. The slaves, I don’t think they care so much about, but whatever it is within this place that Mistress Maike is having the labor slaves dig up seems to be exceptionally valuable to her masters.”</i>");
	output("\n\nOut of... idle curiosity... you ask what would happen if the slaves all got loose.");
	output("\n\nThe zil boy stares up at you with big, black eyes. <i>“Oh, they could never! The Mistress keeps the door locked unless she has her metal men with her. And even if they did get out, the prisoners have no weapons to match the metal men, to say nothing of the pirates! If someone were to free them, it would be a great fight, like in the epics my mother used to sing! But I fear it would be a short, one-sided battle without starfarer weapons.”</i>");
	output("\n\nMaybe if you got Maike’s card key somehow... and just so happened to find a cache of weapons somewhere...");
	output("\n\nFood for thought, you guess.");
	processTime(8);
	clearMenu();
	addButton(0,"Next",repeatTivfApproach,true);
}

//[His Role]
//So what does Tivf do around here?
public function tivfRoleTalk():void
{
	clearOutput();
	showTivf();
	output("You ask the svelte zil what exactly he does for his mistress.");
	output("\n\nHe half-smirks and runs a black-plated hand up his long, slender legs, up to his broad hips hugged tight by black leather shorts. <i>“Take a guess, friend,”</i> he giggles. <i>“In my village, I was a healer, tasked with mending the wounds of our hunters and more importantly... soothing the aches and pains of all the village. That was my specialty, and Mistress Maike certainly found that my talents applied to a hard day’s work whipping slaves.”</i>");
	output("\n\nSo he’s, what, a masseuse?");
	output("\n\n<i>“I don’t know that word, but if you like, I could show you what I mean. Mistress Maike won’t be back for some time, so if you’d like to rest here...”</i>");
	processTime(3);
	clearMenu();
	addButton(0,"Next",repeatTivfApproach,true);
}

//[The Elevator]
//Hey, how are you supposed to get into the lower levels? The elevator’s broke.
//You already fixed the elevator, silly.
public function askTivfAboutTheElevator():void
{
	clearOutput();
	showTivf();
	output("<i>“I need to get down to the lower levels,”</i> you tell him. <i>“How?”</i>");
	output("\n\n<i>“Oh, Mistress Maike mentioned that the elevator was broken. Some of the mining metal-men have been damaging her tunnels,”</i> Tivf answers. <i>“One damaged a ‘power coupling,’ whatever that is.”</i>");
	output("\n\nGreat. <i>“How is anybody getting up or down?”</i>");
	output("\n\nTivf shrugs. <i>“I don’t know, I’m stuck in here. I should think there are smaller star-boats to take people around?”</i>");
	output("\n\nYou sigh in frustration. That doesn’t help you much, if the pirates are controlling the shuttles. You’ll still need to power the elevator back up... which according to Tivf, seems like it could best be accomplished somewhere in the mines.");
	output("\n\n<i>“Then again...”</i> Tivf says, rolling onto his belly and curling his legs up. <i>“You look like a " + pc.mf("strapping","beautiful") + " bit of alien flesh. Many of the slaves too comely for the mines are bundled up and sent down to the lower levels for the more important villains... their shamans and war-chiefs, I would think. Given beautiful uniforms to please her master’s eye. Maike took me for her own right away, so I don’t know for sure, but perhaps if you made yourself out to be a slave...”</i>");
	output("\n\n...then you could get a free ride down to the lower levels. ");
	if(pc.isMischievous()) output("Glad you thought of it!");
	else output("That could work, but there’d certainly be a risk of getting abused as a pleasure slave, at least once on your trip.");
	processTime(6);
	clearMenu();
	addButton(0,"Next",repeatTivfApproach,true);
}

//Resting in Maike’s Quarters
public function maikeRestOverride():void
{
	clearOutput();
	output("Since the overseer isn’t around, her quarters seem like a perfectly safe place to catch your breath. You saunter over to her huge bed and help yourself to its many pillows and silken sheets.");
	//if slaves freed:
	if(flags["MAIKE_SLAVES_RELEASED"] != undefined || flags["MET_TIVF"] == undefined)
	{
		output("\n\nYou quickly fall asleep");
		if(flags["MAIKE_SLAVES_RELEASED"] == 1) output(", confident that nobody’s going to bother you after all the chaos you’ve unleashed to keep the pirates busy");
		output("...");
		
		clearMenu();
		addButton(0,"Next",tivfSleepTime,7*60);
	}
	//Slaves not free:
	else
	{
		output("\n\nTivf watches you crawl into the bed, flitting his wings pensively. <i>“Ah, you wish to rest here? For both our sakes, I hope Mistress Maike doesn’t return. Until then... would you like me to help you relax? That is my purpose, after all.”</i>");
		showTivf();
		//[No Thanks] [Sure, Tivf]
		clearMenu();
		addButton(0,"No Thanks",noThanksTivf);
		addButton(1,"Sure, Tivf",sureTivfRelaxMe,undefined,"Sure, Tivf","Take advantage of the waspy boy’s stress relief services.");
	}
}

//[No Thanks]
public function noThanksTivf():void
{
	clearOutput();
	showTivf();
	output("You shake you head and tell Tivf you’d like to relax alone. He just shrugs and rolls over, facing away from you.");
	output("\n\nYou quickly fall asleep, content to let the wasp-boy go unused.");
	processTime(3);
	
	clearMenu();
	addButton(0,"Next",tivfSleepTime,7*60);
}

//[Sure, Tivf]
//Take advantage of the waspy boy’s stress relief services.
public function sureTivfRelaxMe():void
{
	clearOutput();
	showTivf();
	output("You crook a finger at the zil, telling him to come over and show you what it is his mistress saw in him. A little smile plays across his lush black lips as he lifts himself up and crawls across the bed towards you, wings fluttering behind him. <i>“As you wish, [pc.master]. Please, lie on your stomach and leave the rest to me.”</i>");
	output("\n\nYou do so, sprawling out on the bed and resting your head on the pile of pillows. Tivf wastes no time in crawling up over you, sensually slipping his hands onto your gear and starting to strip it off. As he bares your back, you feel something warm and wet spilling onto your shoulders. Latex-smooth fingers brush up your back again, rubbing substance into your skin and spreading it around. Whatever it is, its fragrant and sweet and buttery-smooth, spreading easily with Tivf’s airy motions. In a matter of moments he’s worked it into every inch from the shoulders to just above your buttocks, and starts to knead your [pc.skin] with long, hard movements. For such a svelte boy, he’s surprisingly strong, pushing and pulling on you in all the right ways to make your weary muscles stretch. It hurts, but it hurts <i>good</i>.");
	output("\n\n<i>“Just relax,”</i> Tivf purrs in your [pc.ear]. <i>“You’ll feel much better afterwards...”</i>");
	output("\n\nThat’s your hope, anyway. The zil boy murmurs wordlessly under his breath, continuing to work. As he does, though, you hear a faint creaking of straining leather, and an ever sweeter scent starting to fill the air...");
	processTime(4);
	//[Stay Chaste] [Lewd it Up]
	addButton(0,"Stay Chaste",stayChasteWithTivf,undefined,"Stay Chaste","Just get the massage.");
	addButton(1,"Lewd Him Up",lewdItUpWithTivf,undefined,"Lewd It Up","See if Tivf has something <i>you</i> can massage for him.");
}

//[Stay Chaste]
//Just get the massage
public function stayChasteWithTivf():void
{
	clearOutput();
	showTivf();
	output("You stay silent, ignoring Tivf’s mounting arousal. Whether he’s used to that treatment or not, he continues his work without complaint. After perhaps fifteen more minutes of vigorous massaging, Tivf rests his palms on your shoulders and says, <i>“There, that should do it. Now rest, and let healing flow through you...”</i>");
	output("\n\nYou were already half asleep from the constant caresses, and when he finally gets off of you, it’s only a few moments more before you succumb to the sweet embrace of slumber.");
	processTime(3);
	
	clearMenu();
	addButton(0,"Next",tivfSleepTime,7*60);
}

//[Lewd it Up]
//See if Tivf has something <i>you</i> can massage for him.
public function lewdItUpWithTivf():void
{
	clearOutput();
	showTivf(true);
	output("You shift on your elbows and [pc.knees], pressing your [pc.butt] against the front of Tivf’s tight leather shorts. As expected, there’s a sizable bulge in the front that perfectly nestles between your cheeks, letting you rub it up and down.");
	output("\n\n<i>“[pc.Master]?”</i> Tivf gasps, momentarily stopping his work. <i>“Should I...”</i>");
	output("\n\n<i>“Keep working,”</i> you tell him, wiggling your [pc.hips] up and down his bulge. <i>“And don’t miss a spot.”</i>");
	output("\n\nHe takes your command in stride, working his fingers into your shoulders while you stroke his little cock until its black tip is peeking out the top of his shorts and beading with golden pre. Between techniques, Tivf’s hands slink down and pull off the tight leather garment, letting the full five-inch mast of zil-cock flop into the crevasse between your [pc.butt]’s cheeks. A little more of his fragrant massage oil finds its way into your butt, letting his dick slide through you that much more easily.");
	output("\n\nIt only takes a few moments before Tivf’s breath starts coming hot and heavy in your ear. You can feel his little shaft throbbing to the beat of his heart, faster and faster the more you grind against him. You feel wet warmth smearing across your cheeks, thick globs of waspy pre milked out by your incessant movements. Tivf shudders, trying hard to keep his massaging motions going, but you can feel him faltering already. Poor boy must be awfully pent up without his mistress around!");
	output("\n\nYou shoot him a grin over your shoulder and tell him that you could use a little something for you skin on your back. Wouldn’t he be a dear and give it to you?");
	output("\n\n<i>“Y-yes, [pc.master],”</i> Tivf gasps. His fingers tremble around your shoulders, trying to find your tense muscles, but you’re offering too much of a sensual distraction for him. It isn’t long before his little hips start pumping, fucking your asscheeks until your whole body is being pushed forward by the impacts. Tivf’s wings buzz behind him, helping to push him harder against your [pc.butt].");
	output("\n\nYou moan, shivering with pleasure as the zil boy’s cock rubs against your [pc.asshole]. Tivf’s grip tightens on you, chitinous digits grabbing your [pc.hips] a moment before a spray of warm, sweet-smelling goo spurts across your back");
	if(pc.hasWings()) output(" and [pc.wings]");
	else if(pc.hasHair()) output(" and [pc.hairNoun]");
	output(". The smell of honey, once faint and subdued, becomes almost overwhelming as Tivf’s orgasm spreads across your [pc.skinFurScales] and drools onto the bed in thick, viscous strands.");
	output("\n\nWithout skipping a beat, Tivf’s hands start to work again, still trembling from the pleasure of his climax. He spreads his honey cum around, working it into your [pc.skin] even as his little dick is leaking aftershots into the crack of your ass, rubbing wet heat into the rim of your [pc.asshole]. That’s the stuff! You sigh contentedly, releasing your cheeks’ grip on Tivf and letting the poor boy work while you relax.");
	output("\n\nEventually, Tivf’s dick softens, and the sticky warmth he’s been spreading on you seems to coat every inch of flesh. You should feel sticky, you think to yourself, but Tivf’s fingers glide across you with the same airy ease as ever; perhaps the oil he rubbed into you before alleviates the effects of his cum? Best not to think too deeply about it, and instead enjoy the final moments of the zil boy’s massage.");
	output("\n\nHe sighs wistfully when he’s done, planting a dainty kiss on each of your shoulder blades before sitting back on his knees. <i>“Rest easy, let my honey invigorate you while you sleep,”</i> he urges. <i>“Rest well.”</i>");
	pc.applyCumSoaked();
	pc.changeLust(25);
	processTime(20);
	output("\n\nYou’re almost asleep already...");
	
	clearMenu();
	addButton(0,"Next",tivfSleepTime,7*60);
}

public function tivfSleepTime(minPass:Number = 5):void
{
	clearOutput();
	showBust("");
	
	output("... You sleep for about " + num2Text(Math.round(minPass/60)) + " hours...");
	
	genericSleep(minPass);
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}