//Liliana, the deserter
//mission statement
//cute girl pc can talk to about the war from the soldiers perspective and have a little sex with. Also can cuddles because nightmares. Starts out incredibly fearful and scared of both her own governments reproach and the space faring races tech. Short option to encourage her and help her get over fears and help her get some kind of protection(though she probably still has to stay in the DMZ because desertion.)

//Sight blurb
//(in the bar from 12pm equivalent to 9 pm equivalent because not everyone can be eternally awake.)
public function lilianaBonusShits(slot:int = 7):void
{
	if(flags["MET_LILIANA"] == undefined)
	{
		output("\n\nA sandy blonde ant-girl sits at a table near the back of the bar, stealing glances at the door every time someone enters and looking visibly worried.");
		addButton(slot,"Ant-Girl",approachLiliana);
	}
	else
	{
		output("\n\nLiliana sits at a table near the back of the bar, still glancing at everyone who enters and looking fretful. She visibly relaxes when she sees you, and gives you a timid smile.");
		addButton(slot,"Liliana",approachLiliana);
	}
}

public function showLiliana(nude:Boolean = false):void
{
	author("Gardeford");
	showName("\nLILIANA");
	if(lilianaArms() == 3)
	{
		if(!nude) showBust("LILIANA");
		else showBust("LILIANA_NUDE");
	}
	else
	{
		if(flags["LILIANA_ARMS"] == 2) 
		{
			if(!nude) showBust("LILIANA_REGEN");
			else showBust("LILIANA_REGEN_NUDE");
		}
		else 
		{
			if(!nude) showBust("LILIANA_CYBORG");
			else showBust("LILIANA_CYBORG_NUDE");
		}
	}

}

public function lilianaEncouraged():Boolean
{
	if(flags["LILIANA_NO_ARMS_ARE_COOL"] != undefined) return true;
	if(flags["LILIANA_ARMS"] != undefined) return true;
	return false;
}
public function lilianaArms():Number
{
	if(flags["LILIANA_ARMS"] == undefined) return 3;
	if(flags["LILIANA_ARMS"] >= 1) return 4;
	return 3;
}

//[Approach]
public function approachLiliana():void
{
	clearOutput();
	showLiliana();
	if(flags["MET_LILIANA"] == undefined)
	{
		showBust("LILIANA_BLANKET");
		flags["MET_LILIANA"] = 1;
		output("You walk over to the light haired myrmedion, planning to ask her if she wants a drink. Her features are as fair as her hair, pale white skin with rosy cheeks and dark obsidian eyes. Her arms are hidden under a blanket that surrounds her body below the neck. The blanket prevents any detailed examination of her body, but judging by how tightly she’s hugging it to herself she could be quite curvaceous and you wouldn’t be able to tell. She retains her nervous look as you come closer, avoiding direct eye contact until you’re standing at her table.");
		output("\n\n<i>“Hey there, could I buy you a-”</i>");
		output("\n\n<i>“Please don’t report me! I’ll p-pay you,”</i> she blurts out, throwing her arms out of the blanket and holding her hands up protectively. The cloth falls away in the process, revealing a thin but fit frame covered by the uniform of the gold myr military. An insignia detailing a wispy green cloud with folded angelic wings is emblazoned on its upper left shoulder. Its lower left shoulder is torn away, revealing a nasty looking surgical scar where her fourth arm is missing. Her voice was quiet enough that only you heard her words, but some closer bar patrons looked up for a moment before returning to their drinks and jovial talk. You sit down next to the shuddering myrmedion, cocking an eyebrow and asking what you would report her for. She looks about ready to break down crying, but manages to hold it together as she explains.");
		output("\n\n<i>“I-I ran away from the army. Usually you hear of people doing that and getting away with it. Before now there’s been too much chaos to prioritize hunting down deserters. But ever since the space people came the officers hire bounty hunters to bring in deserters for who knows what kind of punishment. I don’t want to go through anything like that. Then again they might just think I’m dead. Some deserters are found dead before they even got back to the cities,”</i> she says, covering her face with her upper pair of hands. Her lower right one struggles to find its missing twin for a moment before balling into a fist and pressing into the table. After a few seconds of this she forces herself to relax, putting all of her hands palms down on the table and breathing deeply.");
		output("\n\n<i>“Sorry about that. I haven’t gotten a lot of sleep for the last couple days. I get scared from the smallest things and I don’t really have any place to go. I’ve been sleeping in the medical bay where people go for treatment from the space-faring races. I’m not sure whether to trust them, so I only ask for a bed. I’m afraid if I tell them too much they might turn me in to the military command,”</i> she says, returning to fidgeting about halfway through. The longer she talks the more fearful she seems to get, and you put a hand on her shoulder to comfort her. She jumps at your touch, but then relaxes a little and smiles.");
		output("\n\n<i>“I don’t have the same kind of money as you have in space, but I could pay you in s-sex if you don’t tell anyone about me. My name is Liliana by the way, Liliana Aleszra”</i> she says sheepishly, her rosy cheeks flushing scarlet. You reply with your name before contemplating your decision. You could have sex with her, or you could prod her to continue talking.");
		processTime(3);
		lilianaMenu();
		//[sex][talk][cuddles(at night(7pm or later) only)][later]
	}
	else
	{
		showBust("LILIANA_BLANKET");
		output("<i>“");
		//if (pre/post) encourage:
		if(!lilianaEncouraged()) output("O-o");
		else output("O");
		output("h hey, nice to see you again. Did you want to talk, or ");
		if(!lilianaEncouraged()) output("did you come for s-sex");
		else output("something else");
		output("”</i> she says, looking around before she whispering the last part and fiddling with her blanket. You smile and sit next to her, thinking of what you want to do.");
		processTime(1);
		//[sex][talk][cuddles(at night(7pm or later) only)][later]
		lilianaMenu();
	}
}

public function lilianaMenu():void
{
	clearMenu();
	//[sex][talk][cuddles(at night(7pm or later) only)][later]
	//[SEX]
	if(pc.lust() >= 33) 
	{
		if(pc.hasVagina()) addButton(0,"Sex",sexUpDatAntBitch);
		else if(pc.hasCock() && pc.cockThatFits(300) >= 0) addButton(0,"Sex",sexUpDatAntBitch);
		else addDisabledButton(0,"Sex","Sex","You need a dick that will fit in her vagina or a vagina of your own to engage in intercourse with Liliana");
	}
	else addDisabledButton(0,"Sex","Sex","You aren’t presently aroused enough for sex.");
	//[TALK]
	if(flags["LILIANA_TALKS"] == undefined) addButton(1,"Talk",talkToLilianaYouBafoooooon,undefined,"Talk","Talk to Liliana about her situation.");
	else if(flags["LILIANA_TALKS"] == 1) addButton(1,"Talk",talkToLilianaYouBafoooooon,undefined,"Talk","Talk to Liliana about her missing arm.");
	else if(flags["LILIANA_TALKS"] == 2 && lilianaEncouraged() && lilianaArms() >= 4) addButton(1,"Talk",talkToLilianaYouBafoooooon,undefined,"Talk","Talk to Liliana about her that doctor you two met.");
	else addDisabledButton(1,"Talk","Talk","You don’t have anything more to discuss with Liliana.");

	if(hours >= 19) addButton(2,"Cuddles",cuddleDatAntBiyooootchToSleepizzles,undefined,"Cuddles","Cuddle with Liliana to help her sleep.");
	else addDisabledButton(2,"Cuddles","Cuddles","It’s not late enough at night for cuddles.");

	addButton(5,"Appearance",lilianaAppearance);
	addButton(14,"Leave",talkToLilianaLater);
}

//[later]
public function talkToLilianaLater():void
{
	clearOutput();
	showLiliana();
	showBust("LILIANA_BLANKET");
	output("You tell Liliana that you have something to do, but promise you won’t tell anyone about her. She looks a little sad, but nods and makes no attempt to stop you as you leave.");
	processTime(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Appearance]
public function lilianaAppearance():void
{
	clearOutput();
	showLiliana();
	output("Liliana is a short and thin gold myrmedion. When not covered by the blanket she uses to hide herself she has ");
	if(lilianaArms() == 3) output("three");
	else output("four");
	output(" visible arms");
	if(flags["LILIANA_ARMS"] == 1) output(", one of which is robotic");
	output(". You ");
	if(flags["LILIANA_SEEN_NAKKERS"] == undefined) output("estimate");
	else output("know");
	output(" her to be about 4\' 8\" when standing. Her body doesn’t look strong by any means");
	if(flags["LILIANA_SEEN_NAKKERS"] != undefined) output(", but you know that most of her thin frame is made up of lean muscle");
	output(".");
	output("\n\nHer sandy blonde hair barely reaches the dark pools of her eyes, always looking slightly disheveled even as she smoothes it over. Despite its shape and length her hair is thick and silky, looking");
	if(flags["LILIANA_SEEN_NAKKERS"] != undefined) output(", and feeling as you recall,");
	output(" soft enough to be the envy of any human stylist. She smiles innocently as she looks at you, constantly playing with her hands.");
	output("\n\nThe soft skin of her neck travels down to the collar of her uniform before disappearing beneath it. Unlike most gold myr you see around the planet her breasts ");
	if(flags["LILIANA_SEEN_NAKKERS"] == undefined) output("can’t be");
	else output("aren’t");
	output(" any larger than A-cup’s. Her also smaller-than-average abdomen pokes out from the chair behind her, wiggling reflexively when she shifts in her seat.");
	clearMenu();
	addButton(0,"Next",approachLiliana);
}

//Talks
public function talkToLilianaYouBafoooooon():void
{
	clearOutput();
	showLiliana();
	showBust("LILIANA_BLANKET");
	//[talk 1]
	if(flags["LILIANA_TALKS"] == undefined)
	{
		flags["LILIANA_TALKS"] = 1;
		output("You tell Liliana you’d like to hear about her time in the army and why she deserted. She looks earnest but hugs herself tightly. She seems happy to have someone to talk to, but apprehensive about the subject. You put one of your hands over hers, calming their erratic movements for the moment.");
		output("\n\n<i>“Okay. I got drafted just a short time ago. At first I was scared. Who wouldn’t be going into war with a pretty low survival rating? I didn’t want to get chopped up into little pieces because I couldn’t hold the swords and axes they use. I got through training because the other girls were drafted too, and they were nice. I didn’t know any of them going into training, but I got so close to some of them that I didn’t want to be separated when it came to assignment time,”</i> she says calmly. When the topic of her assignment comes up she pauses uncomfortably.");
		output("\n\n<i>“So... even after training I still couldn’t use axes effectively, and to make it worse I can’t shoot very well. The army is desperate nowadays though, so they found me a position. I got a field promotion to chemical division less than a week after I got to the battlefield. The girls I was deployed with told me not to worry, because it’s really easy and they usually go in when there isn’t any shooting going on,”</i> she continues, pointing to the emblem on her shoulder as if to elaborate before she pulls her blanket tighter around herself.");
		output("\n\n<i>“I met one of the scientists that head the division on my first day there. She really made me feel at home, and told me some things about my equipment and duties in my new position. The chemical division wear these bulky air-tight suits hooked up to large oxygen and gas tanks. When we weren’t on the field we pretty much got to have free time in whatever cities were nearest to our deployment area, but when we went out we would clear the path for the other soldiers. Without us they would have had a much tougher time fighting the entrenched red soldiers.”</i> she says. At the end of this portion of speech she clenches her fists so hard her knuckles turn white.");
		output("\n\n<i>“I got my first actual mission maybe two weeks after that. I had to go out in the middle of the night and gas a trench, that’s all. It was an area that had been deadlocked for months. The transport dropped me off at our trench, and I had to walk to the red side in my suit. It was very dark and the fog was thick, so I couldn’t see much of anything. The red trench wasn’t too far away. It felt like an eternity because of the darkness, but I suppose it helped when they couldn’t see me either. I got right up to the lookout’s post before they saw anything, and by then it was too late. They taught us in practice to start the gas going just before we reached the target, that way the enemy wouldn’t hear the mechanisms startup. The lookout took the gas first, and was out by the time she gasped to sound the alarm,”</i> she says shakily. You’re afraid for a moment that she’ll hurt herself with how tense she is, but she notices her tightness and relaxes a little.");
		output("\n\n<i>“They call this new stuff Angel’s Breath, because the people it affects just go to sleep. The lookout kind of sighed and fell at the entrance to the trench, and then all I had to do was walk along the edge and let the gas do its work. The reds that weren’t already sleeping managed a glance at me before the gas reached their lungs. They all just fell where they were sitting, peaceful looks on their faces...”</i> The poor ant-girl looks on the verge of a breakdown, and you ");
		if(pc.isNice() || pc.isMischievous()) output("gently squeeze her shoulder to calm her");
		else output("firmly grasp her shoulder to encourage her");
		output(". She takes a deep breath and continues her story.");

		output("\n\n<i>“By the time I got to the end, one of the red soldiers had managed to pull her weapon before the gas got to her. The suit I was in was too big and heavy for any kind of quick movement, or anything other than a slow walk. I couldn’t do anything to get out of the way before she shot. The bullet went right through the suit and lodged itself in my arm. Worse, some of the gas seeped through the hole and into my suit. I only had a few seconds to react before I breathed it in. It hurt so much I couldn’t think. I don’t know how many times I came back to consciousness only for that feeling to still be threading itself inside me,”</i> she continues. All the tension has been sucked out of her body, as if even the memory of the events is too much to fight.");

		output("\n\n<i>“I don’t know how long I was there before someone came to get me. I don’t think they even came to get me, they just came to finish off the reds in the trench and found me there. Either way, the next time I was conscious was in the field hospital. My arm had gotten badly infected by the time they got me back, so the medics had to cut it off while I was out. They sent me here to the alien doctors because your medicine is better at dealing with infections like this. I got the medicine and have been using the beds there ever since. I don’t want to go back knowing that that’s what the other side of the conflict is feeling. I usually come here during the day. I’m not much of a drinker, but the ‘tee vee’ screens sometimes show fun things that I like to watch,”</i> she says, her attitude getting a little brighter at the end.");

		output("\n\n<i>“The cuts have healed over now, and the infection is gone, but I still sometimes feel like my arm is still there. I’ll reach for things and wonder why I didn’t pick them up, or try to catch something that’s dropping. I’m glad for having two sets of arms so I can at least still hold things from both sides. Thanks for listening I guess,”</i> she says, twirling a finger through her sandy gold hair. ");

		output("\n\nYou tell her you were happy to listen.");
		processTime(13);
		//(back to options menu)
		clearMenu();
		addButton(0,"Next",approachLiliana);
	}
	//[Talk2]
	else if(flags["LILIANA_TALKS"] == 1)
	{
		flags["LILIANA_TALKS"] = 2;
		output("You ask Liliana why she didn’t ask the doctors in the DMZ to fix her arm, as you’re sure they could do something to help. If they didn’t offer full regeneration, you’re sure they would be willing to replace it with a mechanical one. She looks embarrassed, as if she’s heard this question before. She rubs the scarred area with what would be the missing arm’s opposite.");
		output("\n\n<i>“They told me they might be able to help when I first came, but I told them I wasn’t sure and they didn’t push it. People of all sorts come to this bar, some of them have arms like that. I’m not sure if I could go back to how I used to live if part of me was, well, alien. No offense,”</i> she says, giving you a slightly ashamed glance when she pauses. You assure her that none was taken before asking what she means about not being able to go back.");
		output("\n\n<i>“On our planet you hear about people exploring in the deep caves and coming back with weird fungus creatures attached to them. I’ve never actually seen one of them for myself but I hear they’re treated as oddities. The space doctors told us that they might be dangerous, a <i>“fungal infection”</i>. I don’t know about dangerous, but they’re certainly treated differently than normal. I’m afraid if I get an arm like that I might be treated like they are. Like maybe part of me isn’t </i>me<i> anymore,”</i> She says, her knuckles turning white as she grips the scarred portion of her side. You figure she could use some encouragement, since this doesn’t seem to be the healthiest thing to be dwelling on.");
		processTime(3);
		clearMenu();
		//[Encourage-arm][Encourage-stay]
		if(pc.credits >= 2000) addButton(0,"Get An Arm",lilianaIsTotallyRobocopAnt,undefined,"Get An Arm","Encourage Lilianna to get a new arm. You guess it would cost about 2000 credits for robot arm or 6000 for real arm.");
		else addDisabledButton(0,"Get An Arm","Get An Arm","You don’t have enough credits to help Liliana get a new arm.");
		//[Encourage-arm](requires at least 2k credits to start)
		//tooltip: Encourage Lilianna to get a new arm. You guess it would cost about 2000 credits for robot arm or 6000 for real arm.
		//Tooltip: encourage Liliana that she’ll be okay even without the arm.
		addButton(1,"Encourage",encourageWhatsHerButtNotToBeRobocop,undefined,"Encourage","Encourage Liliana that she’ll be okay even without the arm.");
		if(pc.hasHardLightEquipped()) addButton(2,"TechIsSexy",lilianaSexyholocawk,true,"TechIsSexy","Use your hardlight-equipped [pc.lowerGarments] to show Liliana how much fun integrated technology can be.");
		else addDisabledButton(2,"TechIsSexy","TechIsSexy","You need undergarments equipped with a hardlight dildo to do this.");
	}
	//[talk3]
	//(only available after arm stuff and if arm was fixed)
	else
	{
		flags["LILIANA_TALKS"] = 3;
		output("You ask Liliana about the doctor you met, and smile when she nearly chokes on her drink. You ask her if she’s talked to her since she got her new arm.");
		output("\n\n<i>“W-well, I kinda... I’m not... I don’t know if I should,”</i> she says nervously, shrugging her shoulders and shrinking into her blanket. She looks somewhat down and unsure of herself. You ask her why she shouldn’t. After all, the doc told her it was okay to contact her.");
		output("\n\n<i>“Yeah, but that was for emergencies. It’s not like she’s waiting for me to come see her,”</i> she continues. You tell her she doesn’t need to be. Even on an edge world relief mission she still has to have some time off, and that’s when she should ask.");
		output("\n\n<i>“I don’t know, do you think she’d like me? I don’t know if her race is into people of the same gender, let alone different races,”</i> she says, still sounding discouraged. You tell her you know for a fact that most leithan aren’t opposed to relationships with other species, and as for gender she’ll have to ask her in person. You mention that even if it’s tough getting up the nerve to ask her, it’ll be worth it even if she gets turned down.");
		output("\n\n<i>“Because it’s good practice? That sounds kinda dumb,”</i> she replies skeptically. You tell her that’s part of it, but she’ll have gotten over some of her shyness, making it easier for her to ask other people. All of which is only hypothetical if Anilla accepts her offer. You remind her that she doesn’t have to ask about a relationship right away, she could just ask her out to lunch or dinner first.");
		output("\n\n<i>“Hmm. If you say so. I guess it’s worth a try,”</i> she says, getting up with her blanket around her shoulders. She tells you she’s going to go ask if she’s on break or off time right now, so long as you don’t mind her leaving. You wish her the best of luck and send her on her way, smiling to yourself and hoping your matchmaking skills are as good as your flirting before returning to your previous endeavors.");
		processTime(13);
		//(back to options menu)
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
}

//[Encourage-stay]
//Tooltip: encourage Liliana that she’ll be okay even without the arm.
public function encourageWhatsHerButtNotToBeRobocop():void
{
	clearOutput();
	showLiliana();
	flags["LILIANA_NO_ARMS_ARE_COOL"] = 1;
	output("You put a hand over her strained fingers, and she jumps before relaxing. A hand-shaped mark is left over the smooth scar before it slowly fades back to a uniform waxy pink. You tell her if she really doesn’t want to fix the arm there’s no need to do so. She shouldn’t think about it so hard if it makes her this stressed. She still has three perfectly good arms, which is one more than <i>you’ve</i> got. Unless she’s decided on an offworld heavy lifting career while you were away, it’s fine. You also tell her that sometimes you wish you had even one extra arm to help with various tasks. She laughs at this and gives you a smile.");
	output("\n\n<i>“I guess you’re right. I’ve been so worried about what people would think if I did do it that I forgot leaving them like this was an option. I guess the phantom feelings made me feel like I needed to have it back. Thanks for helping me get a little of this stress out,”</i> she says thankfully. You ask her if her planet has physical therapy for people with missing limbs. That might help with the phantom pains and tenseness.");
	output("\n\n<i>“I don’t know if there’s anything like that specifically, but I know there are a couple therapy places in the city I live in. Maybe after all this is over I could ask if they know any ways to help. I’m sure they wouldn’t mind trying even if it wasn’t their specialty,”</i> she continues. Her mood seems to have markedly improved since you started talking with her.");
	processTime(3);
	clearMenu();
	addButton(0,"Next",approachLiliana);
}

//[Encourage-arm](requires at least 2k credits to start)
//tooltip: Encourage Lilianna to get a new arm. You guess it would cost about 2000 credits for robot arm or 6000 for real arm.
public function lilianaIsTotallyRobocopAnt():void
{
	clearOutput();
	showLiliana();
	output("You bolt upright, causing the tensed ant-girl to nearly jump out of her covering. She follows as you grasp her arm, pulling her out of the bar. You’re going to help her get over her fears and have a new arm for her if you have to carry her to the relief hospital yourself. She blushes intensely at the mention of you carrying her, and begins to follow your gently tugging lead.");
	output("\n\nYou bring her out of the bar, drawing her toward the part of the DMZ that serves as the infirmary. A nurse at the waiting area tells you who you would talk to about lost limb recovery, pointing you down a hallway to a door on the right. You walk into the room to find ");
	if(CodexManager.entryUnlocked("Leithans")) output("a studious looking leithan doctor");
	else output("a lizard-taur that your codex identifies as a leithan");
	output(". The chitin-armored lady looks up when you enter, smiling but cocking an eyebrow at the situation.");

	output("\n\n<i>“May I help you?”</i> she asks, stepping out from behind her desk. You gently prod Liliana until she’s in front of the doctor, and cough to encourage her to talk. She gawks for a moment, reminding you that this might be the first time she’s seen some of the races that aren’t from her planet. She attempts to shake the embarrassment off before answering the tauric doctor.");

	output("\n\n<i>“Uh... I... Arm. You see,”</i> she mumbles, pointing to the tattered hole in her uniform. The doctor walks over to her and examines the hole. She touches the scar and pokes at various parts of the ant-girl’s body.");

	output("\n\n<i>“That doesn’t look comfortable. You look a bit thin... have you been eating right?”</i> she asks as she continues, measuring the size of the scar beneath her left arm. Liliana, for her part, blushes a deeper red than the scar tissue that remains of her arm. She sheepishly replies that she has been eating her rations. The doctor examines her side for a few more seconds before motioning for you to join her in a corner.");

	output("\n\n<i>“It’s going to cost you some money if you came to get this girl’s arm back. Because of the relief efforts we’ve got replacements at a heavy discount, but there’s still a cost. A robotic replacement would cost around two thousand credits; a full regeneration would cost about six thousand. That’s a steal compared to what a similar treatment would cost on the core worlds, but JoyCo really stepped up to the plate with the support here. Either way I can do the surgery, but robotics might be a bit longer of a wait,”</i> she whispers, giving you a kind smile and a choice.");
	processTime(5);
	//[real][robo]
	clearMenu();
	addButton(0,"Robo Arm",roboArmsForAllTheLittleAntLadies,undefined,"Robo Arm","Get Liliana a robotic arm.\n\nCosts 2000 credits.");
	if(pc.credits >= 6000) addButton(1,"Real Arm",getARealArmBabeeeeeeeeeeee,undefined,"Real Arm","Pay to have the doctor regenerate Lilian’s arm.\n\nCosts 6000 credits.");
	else addDisabledButton(1,"Real Arm","Real Arm","You don’t have the credits to get her a real arm.\n\nCosts 6000 credits.");
}

//[Real]
//You tell her that you have the money for the regeneration, and aren’t going to shortchange Liliana. 
public function getARealArmBabeeeeeeeeeeee():void
{
	clearOutput();
	showLiliana();
	output("<i>“Very good, the bill will be sent to your credit account,”</i> she says before returning to the waiting ant-girl. Liliana stands uncomfortably, fidgeting with her three remaining hands as the doctor approaches her.");
	output("\n\n<i>“Cheer up. By the time you leave here you’ll have a whole new arm, just like the old one. I’m doctor Anilla,”</i> she tells the nervous girl with a disarming smile. She maneuvers to a cabinet at the back of the room, fishing through it until she pulls out a small, innocuous looking container. After some effort getting the lid open, she extracts a thick but short syringe from the container. Luckily the needle isn’t nearly as thick as the syringe itself. Liliana looks at the fluid inside with hope.");
	output("\n\n<i>“Sorry for being so disorganized. This stuff would normally be in a storage area, but we’re lacking space at the moment till the base additions arrive. I’ll need you to remove the top of your uniform before we continue: the tatters might get in the way of the new arm as it grows, and that can cause some painful side effects. We can have your friend sit outside if you’d be uncomfortable, but if you’d rather [pc.heShe] be here for emotional support, that’s perfectly fine,”</i> she says calmly. The ant-girl ex-soldier indicates that she’d rather you stay before she begins unbuttoning and removing her top.");
	output("\n\nApart from the nasty scar by her arm, her body is surprisingly unmarred. Her fit, if a little thin, frame has obvious muscle in the stomach and arms. A single band of cloth is enough to keep her pert A-cups in place, though you can see the slight impression of her nipples poking through. The leithan doctor steadies her and prepares her scar for the shot. She cleans it with antibacterial wipes and dries it before readying the needle.");
	output("\n\n<i>“Don’t worry, I had to get sh-ah-ots when I joined up with the army. Had to get all the routine antivirals and some more exotic ones,”</i> she says, her voice jumping despite herself as the needle pierces her skin. It takes a good few seconds to drain the contents of the syringe into her, during which the doctor holds it with practiced steadiness. After the injection is finished and the needle removed, Liliana shivers and brushes unseen flutters away from her skin.");
	output("\n\n<i>“It should only be a few moments before it starts working,”</i> Doctor Anilla explains as you wait for something to happen. Suddenly Liliana puts a hand to her head and begins to collapse. The doctor catches her without skipping a beat, cradling her to a desk chair near the door. The place where her scar used to be seems to shimmer before bursting open as a new arm extends from it. The new arm looks decidedly human, covered in a viscous goo. After a few seconds the gel rearranges itself and hardens into a chitinous guard for her forearm.");
	output("\n\n<i>“Sorry about that, I forgot to mention the dizziness... and how sudden the effects were,”</i> she says with an apologetic look. Liliana tries to focus on the bulkier woman, still not entirely recovered from the ordeal. After she gets her bearings the doctor helps her to stand. She brings the new arm up into her vision, flexing it and feeling the fingers with each of her other hands. The newly rearmed ant-girl looks at you, nearly tearing up before tackle-hugging you and gripping tightly with all the strength she can muster.");
	output("\n\n<i>“Thank you! So much! I don’t even know what to say! It feels just the same as it used to,”</i> she cries into your [pc.chest], her grip tighter than you would’ve guessed she could manage. After what seems like ages she detaches from her hug, kissing you before turning to the doctor. She looks for a moment through teary eyes before giving her much the same treatment. Anilla gives a yelp of surprise as she’s hugged, but returns it before gently prying the gracious girl away and returning her top.");
	output("\n\n<i>“Come back anytime you need more help. Come right over and ask for me if you get any itchiness or swelling in that arm,”</i> she says as the two of you prepare to leave. You both smile and thank her for her assistance before leaving. You part ways at the entrance to the medical facility, with Liliana mentioning she needed to grab something from her bed area in the relief center and that she hopes to see you again soon.");
	flags["LILIANA_ARMS"] = 2;
	processTime(15);
	pc.credits -= 6000;
	pc.addNice(10);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Robo]
public function roboArmsForAllTheLittleAntLadies():void
{
	clearOutput();
	showLiliana();
	output("You tell her you’ll opt for the robotic arm. The doctor gives a nod and writes something down on a sheet of paper.");
	output("\n\n<i>“The bill will be sent to your credit account,”</i> she says as she returns her attention to the waiting ant-girl. Liliana stands uncomfortably, fidgeting with her three remaining hands as the doctor approaches her.");
	output("\n\n<i>“Cheer up. By the time you leave here you’ll have a shiny new arm to cover up that scar. I’m doctor Anilla, head of surgeries here at our makeshift little hospital, so I’ll be with you the entire way. Your friend will have to wait outside during the actual operation, but [pc.heShe] can be there waiting as soon as you wake up from the anaesthetics. The room we use for surgeries is just down the hall.”</i>");
	output("\n\nThe two of you follow doctor Anilla down the hall to a set of double doors. You’re made to wait outside while Liliana is taken for surgery. What you see of the room is reassuring, totally clean looking and orderly. The doctor comes out to give you checkups every half hour or so, mentioning that it’s going well and her nerves are responding to the replacement.");
	output("\n\nYou begin to worry that something has gone wrong when doctor Anilla disappears for more than an hour. Hopefully Liliana is doing alright. Just when you plan to go ask someone, the Leithan surgeon appears from a door to tell you that the surgery was a success. She leads you to a room labeled ‘Patient Recovery’.");
	output("\n\nYou follow her through the next door, finding two rows of recovering patients lying in hospital beds. Liliana is about halfway down the left row, having woken up a short time before you arrived. She sits on the edge of the bed, rubbing her eyes with her upper hands. Her lower pair of arms, including a humanoid synthetic arm that has replaced her missing one, sits in her lap. She gives you a groggy smile when she sees you, and her new arm instinctively rises in a wave. She stares at it for a few seconds before her eyes go wide.");
	output("\n\nThe ecstatic ant-girl gawks for a few seconds before grasping the arms parts with her other hands, jumping when the nervous response hits her. She looks at you with the happiest expression you’ve seen on her since you met. She almost tears up before she stands and tackles you with a hug, squeezing harder than you would’ve thought her capable of.");
	output("\n\n<i>“Thank you so much! It feels just like the real thing,”</i> she cries into your chest. A moment later she releases you from her hold, giving you a kiss before turning to the doctor. She looks for a moment through teary eyes before giving the tauric woman much the same treatment she gave you. Anilla gives a yelp of surprise as she’s tackled, but returns the hug before gently prying the thankful ant-girl off of her.");
	output("\n\n<i>“Come back anytime you need more help. Come right over and ask for me if that arm stops working in any way,”</i> she says as the two of you prepare to leave. You both smile and thank her for her assistance before leaving. You part ways at the entrance to the medical facility, with Liliana mentioning she needed to grab something from her bed area in the relief center and that she hopes to see you again soon.");
	processTime(15);
	flags["LILIANA_ARMS"] = 1;
	pc.credits -= 2000;
	pc.addNice(5);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Cuddles
public function cuddleDatAntBiyooootchToSleepizzles():void
{
	clearOutput();
	showLiliana();
	flags["LILIANA_SEEN_NAKKERS"] = 1;
	output("You remember Liliana mentioning trouble sleeping, and ask if she’d like you to try and help her get some better sleep tonight. You assure her that ");
	if(pc.isNice() || pc.isMischievous()) output("you wont try anything funny if she doesn’t want it");
	else output("you will limit yourself to a few squeezes while holding her");
	output(".");
	output("\n\n<i>“");
	//if pre/post encourage:
	if(!lilianaEncouraged()) output("S-s");
	else output("S");
	output("ure, if you want to. We can go now if you want, I don’t have any big plans,”</i> she says, getting up from her seat and leading you out of the bar. ");
	
	if(pc.isNude() || pc.isChestExposed() || pc.isCrotchExposed() || pc.isAssExposed()) 
	{
		output("<i>“Um, here, wear this, ”</i> she softly requests, handing you a spare blanket. <i>“The receptionist won’t allow visitors who are, um... naked. I-it’s protocol. For sanitary reasons!”</i> Not wanting to spoil the mood, you " + (pc.isNice() ? "kindly" : "reluctantly") + " take the cloth and wrap around as much of your body as you can.");
		output("\n\n");
	}
	
	output("The two of you walk to the medical bay area, maneuvering its hallways until you reach the sleeping area. The room consists of a number of soft looking bedding areas with curtains for privacy and a shelf for the storage of personal belongings. Liliana takes you to one of the beds by the wall and throws her blanket onto a pile of them that already adorn its surface. She remove her top and pants, leaving her totally exposed barring the single strip of cloth that holds her A-cup breasts and her plain looking underwear. She places the removed clothing in one of the cubby-holes on her shelf and turns to you.");
	output("\n\n<i>“They wash your clothes overnight,");
	if(pc.isNude()) output(" not that it matters for you,");
	output("”</i> she says, ");
	if(pc.isNude()) output("blushing profusely");
	else output("motioning that you can put your outfit there as well");
	output(". You ");
	if(pc.hasArmor())
	{
		output("strip down to your ");
		if(!(pc.upperUndergarment is EmptySlot) || !(pc.lowerUndergarment is EmptySlot)) output("underthings");
		else output("birthday suit");
		output(", putting your [pc.armor] on the shelf next to hers.");
	}
	else output("laugh, placing your [pc.gear] onto the shelf near her things.");
	output(" She moves to the bed, fluffing the oversized pillow and moving the blankets to make space. When you think she’s finished you plop down on the queen sized cushion, opening your arms and motioning for her to join you.");

	output("\n\n<i>“Come on, I can’t help you sleep if I’m the only one in bed,”</i> you tease, pulling the blankets so that they leave your front visible. The exhausted ant girl doesn’t hesitate as she crawls into the bed next to you.");
	if(pc.tallness < 56) output(" Despite your shorter stature, s");
	else output(" S");
	output("he positions herself with her head directly on level with your collarbone, her sandy blonde hair just under your chin. She ");
	if(pc.biggestTitSize() < 5) output("presses herself into your [pc.chest], hugging you tightly as if to anchor herself there");
	else output("buries her face between your [pc.chest], and you feel her hot breath on your [pc.skinfurscales] as she anchors herself to you with a hug");
	output(". You pull the canvas of blankets over her, forming a warm shelter of safety for her.");

	output("\n\nBetween you and the cloudy softness of the bed it doesn’t take long before she’s breathing gently in your arms, her grip softened in the relaxation of sleep. For a few minutes you wonder if she’ll sleep soundly tonight just from your presence, and begin to drift off into your own slumber. You’re interrupted by her breathing becoming a little quicker, and you feel her heart beating in her chest faster than it has any right to during sleep. Her grip re-tightens and she whimpers at unseen distresses. You hold her tighter, brushing the back of her hair to help calm her down.");

	output("\n\n<i>“It’s alright, nothing in your head will get you while I’m here,”</i> you whisper to her helpless form as she fights against the demons of her nightmares. Her struggles slowly ebb with your attentions, calming until the rampant thundering of her heart returns to a timely beat. Her painful grip slackens until it leaves her lying against you. You roll over so that she lies atop you, making sure she doesn’t suffocate in the night. Her expression is completely peaceful and her breath comes deep and steady. You pull the covers up to her head and lean back into the softness of the pillow, joining her in tranquil sleep.");

	output("\n\nYou both have a sound night from then until morning, but after waking find that you’ve shifted into an awkward jumble of limbs. You untangle yourself from Liliana, who remains out cold during the endeavor. You get up and retrieve your " + (pc.hasArmor() ? "[pc.armor]" : "[pc.gear]") + " before sitting at the edge of the bed to wait for her to wake up. No use staying with her all night just to be gone when she wakes up. It doesn’t take as long as you might have thought it would. Only a few minutes after you get up she wakes, stretching her arms and yawning. She sits up, trying to brush the rats nest that her hair has become into something more manageable. Her head swivels slowly, looking around the bed before focusing on you with a groggy smile.");

	output("\n\n<i>“Hey. I think I slept better last night than I ever have. Even before the war I don’t think I slept that well. I might stay here and rest a while,");
	if(lilianaEncouraged()) output(" but I hope to see you again sometime,");
	output("”</i> she says before plopping onto her back. You laugh and stand, giving her a smile in return before leaving to return to your previous endeavors.");
	if(hours < 3) processTime(365);
	else processTime(460+rand(120));
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Sex
public function sexUpDatAntBitch():void
{
	clearOutput();
	showLiliana(true);
	//ifnaked:
	if(pc.isNude() || pc.isChestExposed() || pc.isCrotchExposed() || pc.isAssExposed()) 
	{
		output("You tell Liliana that you’ll take her up on that offer of sex. She blushes, nodding and standing from her chair. She tells you to follow her as she walks out of the bar and toward the medical facility. You tag along, staying close as you maneuver the DMZ. As you walk into the reception area a nurse stops you. She informs you that you’ll need to put some" + (!pc.isNude() ? " decent" : "") + " clothes on if you plan to stay in the hospital due to the risk of spreading infection. The nurse mentions that you can wait outside or leave.\n\nIronically, you’ll need some clothing to get busy with the ant-girl. The two of you walk away sheepishly.");
		processTime(8);
		//[choice to leave or stay])
		clearMenu();
		addButton(0,"Next",mainGameMenu);
		return;
	}
	else 
	{
		flags["LILIANA_SEEN_NAKKERS"] = 1;
		output("You tell Liliana that you’ll take her up on that offer of sex. She blushes, nodding and standing from her chair. She tells you to follow her as she walks out of the bar and toward the medical facility. You tag along, staying close as you maneuver the DMZ. When you arrive, Liliana brings you through the halls to the sleeping area. She leads you to her bed and turns to you with a smile.");
		output("\n\n<i>“So, the curtains here block out noise. It’s supposed to help people sleep if a patient comes in screaming before they can sedate them. I figure it could block out any noise we make, too,”</i> she says, looking nervously at the ground. You laugh and tell her to start it up. Her smile returns as she presses a button on the nearby storage shelf. A large curtain slides out from around the brackets to surround the comfy looking bed.");
		output("\n\nThe sandy-blonde ant-girl removes her top, revealing a thin but fit frame and a single wrap that covers her A-cup breasts. She removes this as well, showing off her still softened nipples. You growl seductively as she continues to undress, laughing as your noise provokes a flush in her cheeks that gradually creeps down her neck. She shimmies out of her cargo pants and plain white panties, standing awkwardly once she’s fully nude.");
		output("\n\n<i>“I know there’s a curtain, but I still feel a little weird doing it when someone could walk so close by us,”</i> she admits. You look her in the eyes and mention that when you’re finished she should be worrying about them hearing, not seeing, and are pleased to see her blush spread even further to coat her honey-soft chest. At first you only remove your [pc.upperGarment], gently lowering Liliana to the bed and giving her upper shoulders a firm squeeze.");
		output("\n\nYou lean down and give her a kiss. She returns it, hesitantly at first but swiftly matching your intensity. She hugs around your upper body with all ");
		if(lilianaArms() == 3) output("three");
		else output("four");
		output(" of her arms, the chitinous lengths of her forearms tickling your [pc.skinFurScales], pulling you deeper into her lips. You happily oblige, letting her hold you there as you reach down to encompass her small breasts. You squeeze each one in a hand before teasing her now hardening nipples, pressing and pinching until she can no longer hold the kiss and moans as it breaks.");
		output("\n\nWhen her hold on your tongue is broken you move slowly down her body. Starting with her neck, you kiss along the length of her body, smooching the center and each side of her chest until you reach smooth chitinous corset on her stomach. You stop momentarily to kiss ");
		if(lilianaArms() == 3) output("the scar where her arm would be, noting that its marred flesh is slightly hotter than its surroundings");
		else output("along her restored arm, hearing her gasp as you take two fingers of its hand into your mouth to suck on");
		output(" before returning to her belly. Once you arrive there you kiss her chitinous covering, not sure whether she can feel it, but more for the mood. You look up to her eyes as you reach the inner side of her leg, breathing hotly onto her thigh. After that you move down her leg onto her cute ant-butt, tapping gently on its rear as your mouth approaches from the front.");

		output("\n\nLiliana looks on with longing as your [pc.lips] close in on her cunt, her tiny abdomen shuddering as you drag your tongue along its surface. You blow gently on the pink flesh of her exposed sex, grinning when her body tenses at the sensation. You hold her netherlips open with two fingers as you lean in close enough to suck her clit, rubbing the sensitive nub with your tongue as the heated breath from your nose washes over her pelvis. She grasps your ");
		if(pc.hasHair()) output("[pc.hair]");
		else output("smooth head");
		output(" and pulls you tighter against her.");

		output("\n\nYou let your [pc.tongue] wander lower, teasing her pussy’s soaking entrance. You knead the thin muscle of her legs, stopping when you reach the place where skin transitions to chitin. The ant-girl’s legs clench tighter in response, trying to hold you tight but failing when they don’t find their mark. The rising volume of her moans are muted by her warm body, and you continue to lick until you feel her empty hole begin to twitch spasmodically.");

		output("\n\nYou slip around her fruitless leg-lock, swiftly moving to kiss her while the electric lust of orgasm still courses along her nerves. She tries to return it, but the pulses of feeling prevent her from putting forth too much effort. When she calms you pull away");
		if(!pc.isCrotchExposed()) 
		{
			if(pc.hasHardLightEquipped()) output(", tugging at the hem of your hologram-equipped underthings. Liliana stares in anticipation as you pull down, looking at your ");
			else output(", stripping out of your [pc.lowerGarment]. Liliana stares in anticipation as you undress, looking at your ");
		}

		if(pc.hasCock() && pc.hasVagina()) output("[pc.cocks] and [pc.vaginas]");
		else if(pc.hasCock()) output("[pc.cocks]");
		else if(pc.hasVagina()) output("[pc.vaginas]");
		output(".");

		clearMenu();
		if(pc.hasCock()) addButton(0,"Use Dick",maleFuxLiliana);
		else addDisabledButton(0,"Use Dick","Use Dick","You don’t have a dick to use on Liliana.");
		if(pc.hasVagina()) addButton(1,"Use Vagina",girlsGetZeAntGurlSexWithLilianaNotLyrallaNoTheyreTotallyDifferentPeople);
		else addDisabledButton(1,"Use Vagina","Use Vagina","You don’t have a vagina to use with Liliana.");
		if(pc.hasHardLightEquipped() && pc.hasHardLightUpgraded() && (flags["LILIANA_HOLODONGED"] != undefined || flags["LILIANA_TALKS"] == 3)) addButton(2,"HL Dildo",lilianaSexyholocawk,false,"HL Dildo","Use your hardlight-equipped [pc.lowerGarments] to have some fun with Liliana.");
		else if(!(flags["LILIANA_HOLODONGED"] != undefined || flags["LILIANA_TALKS"] == 3)) addDisabledButton(2,"HL Dildo","HL Dildo","You need to help Liliana out with her missing arm problem before you can do this.");
		else if(!pc.hasHardLightUpgraded() && pc.hasHardLightEquipped()) addDisabledButton(2,"HL Dildo","HL Dildo","You need an upgrade to your hardlight dildo in order to do this.");
		else addDisabledButton(2,"HL Dildo","HL Dildo","You need undergarments equipped with a hardlight dildo and to know Liliana decently well in order to do this.");
	}
}

//Male
public function maleFuxLiliana():void
{
	clearOutput();
	showLiliana(true);
	var x:int = pc.cockThatFits(300);
	if(x < 0) x = pc.smallestCockIndex();
	output("You line up your [pc.cock " + x + "] with her glistening hole, pressing the [pc.cockHead " + x + "] against it. You gently ease into her, reveling in the tightness of her passage. She clenches instinctively as you enter her, tight as a vice but not quite painful. Her hands clench the sheet of the bed as her legs splay out to the sides.");
	pc.cockChange();

	output("\n\nOnce your [pc.cock " + x + "] has entered as deep as it can into her you massage her muscles. ");
	if(lilianaEncouraged()) output("Her insides are incredibly tight");
	else output("She’s much more tense than you’re used to");
	output(", but soften");
	if(!lilianaEncouraged()) output("s");
	output(" in your hands. Once she relaxes enough you begin to move slowly, moaning as her smooth passage clamps tightly to your [pc.cock " + x + "].");

	output("\n\nLiliana moves her upper pair of hands from the sheets and uses them to grasp your ");
	if(!pc.isTaur()) output("shoulders");
	else output("forelegs");
	output(". She lays kisses onto ");
	if(!pc.isTaur()) output("your [pc.chest]");
	else output("the front of your tauric body");
	output(", eyes closed as she rides the waves of pleasure you’re sending through her. You brush one of your hands through her sandy blonde hair, pulling her deeper into her kisses until she resolves to breathing you in. Her hot exhalations warm you to the core, filling you with her need.");

	output("\n\nThe golden haired ant-girl tenses suddenly, her legs clenching around your waist. She lets out a short series of gasping moans as she cums around your [pc.cock " + x + "]. Her already tight passage threatens to push your [pc.cockNoun " + x + "] from its depths, but you continue to piston into her, holding her abdomen for support. Her lust-induced pelvic strength is no match for your desire.");

	output("\n\n<i>“I can’t! I can’t f-feel my butt!”</i> she says, sounding fully hazed with pleasure. Her legs twitch senselessly whenever you enter her, probably being flushed with all kinds of sensory input they’re unable to handle. You grasp one of her toned thighs to steady it, moaning when her insides tighten in response.");

	output("\n\nYou continue to thrust as more and more of the exhausted ant’s nerves are enveloped by the rapidly spreading warmth that’s overtaking her body. She tries to kiss you again, but ends up just drunkenly rubbing her face against your [pc.skinFurScales]. Even with their smaller size, you can still feel her breasts pressing into your body with each of your movements.");

	output("\n\nSoon you feel the inevitable overflow of your reserves inching over its limits. You pull out of Liliana’s spasming pussy and shout as your [pc.cum] splatters onto her exposed body.");
	output(" Your [pc.cum] ");
	if(pc.cumQ() < 20) output("lands on her pelvis, dripping over her netherlips as it falls");
	else if(pc.cumQ() < 50) output("lands on her stomach, with a strand or two reaching all the way to her pert A-cups");
	else if(pc.cumQ() < 500) output("spurts all the way to her upper body, coating her face and breasts with a [pc.cumColor] glaze");
	else output("showers the unexpecting ant-girl with [pc.cumColor], coating her entire body until it drips off onto her bed and then some. By the time you finish she’s lying in a pool of your cum, breathing through her mouth and keeping her eyes closed");
	output(".");
	if(pc.cumQ() >= 3000) output(" You try to ignore the small lake that has formed as a result.");

	output("\n\nOnce she catches her breath, Liliana tells you she’s going to stay and clean up a bit. You give her a kiss before gathering your things and preparing to head back to your other endeavors");
	if(pc.cumQ() >= 240) output(", apologizing for the mess on your way out");
	output(". You leave the special curtain, relieved to find that it’s sound dampening effect was a success. You head out of the hospital and return to the bar.");
	processTime(23+rand(3));
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Female
public function girlsGetZeAntGurlSexWithLilianaNotLyrallaNoTheyreTotallyDifferentPeople():void
{
	clearOutput();
	showLiliana(true);
	var x:int = rand(pc.totalVaginas());
	output("You lean in close, pressing your ");
	if(pc.biggestTitSize() >= 3) output("larger");
	else output("similarily sized");
	output(" chest against her pert A-cups. Her nipples brush enticingly against your [pc.skinFurScales], just begging to be bitten and teased. Your own [pc.nipples]");
	if(pc.hasInvertedNipples()) output(" pop out and harden");
	else if(pc.hasFlatNipples()) output(" swell");
	else if(pc.hasFuckableNipples()) output(" moisten");
	else output(" stiffen");
	output(" in anticipation as you lean down, taking one of her nubs gently between your teeth. She gasps as you bite down and begin to suck, brushing a hand ");
	if(pc.hasHair()) output("through your [pc.hair]");
	else output("across your bare head");
	output(".");

	output("\n\nYou pause, breaking the mood for a moment to ask why she doesn’t lactate honey like other gold myr. She looks a bit put down, telling you that it isn’t just her. She explains quickly that most myr who end up with a cup size smaller than C don’t lactate. Not wanting to be a total downer to her mood, you give her a smile before continuing to suck the puffy nips. If there’s no sweet honey to be had you’ll have to work them extra hard to make up for it.");

	output("\n\nAfter a moment you transition, licking up her chest and neck, over her chin and all the way into a kiss. You guide ");
	if(lilianaArms() >= 4) output("one of her lower hands");
	else output("her lower hand");
	output(" to your [pc.vagina " + x + "] and she begins dutifully rubbing it");
	if(pc.vaginas[x].clits > 0) output(", teasing your clit between her middle and pointer fingers");
	output(". Her movements are expert, hitting all the right places of your mons. You guess that it makes sense considering she comes from a planet whose population is near entirely female.");

	output("\n\n<i>“I’m kinda glad ");
	if(!pc.hasCock()) output("you’re a girl");
	else output("you have one of these as well");
	output(" to be honest, I don’t really have any experience with the other thing,”</i> she says shyly. You smile and shift upward,");
	if(pc.hasFlatNipples()) output(" bumping then covering");
	else if(pc.hasFuckableNipples()) output(" kissing then sealing");
	else output(" plugging");
	output(" her mouth with a [pc.nipple]. Liliana hums softly and begins to suck, her tongue warm and wet");
	if(pc.hasFlatNipples()) output(" across the surface of your nipples");
	else if(pc.hasFuckableNipples()) output(" in your fuckable nipples");
	else output(" on your stiffened nub");
	output(". She stops to take a breath every few seconds, her exhaled heat spreading over your chest.");

	output("\n\nYou kiss the top of her head as she suckles, brushing your face through her short and silky hair. Her upper pair of hands move to assist her, squeezing your [pc.breasts] and pinching the unattended nipple.");
	if(pc.isLactating()) output(" She lets out a pleased noise as your breasts begin to lactate, happily drinking your [pc.milk].");
	output(" You moan at her ministrations, and decide to reciprocate before your lust builds too high.");

	output("\n\nYou leave her fingers to play with you as they wish, moving yours to her own rapidly wettening cunt, dragging them slowly along her twitching abdomen. Her molten insides constrict around you as you penetrate them with two fingers, the chitinous ant-butt that contains them wiggling in your grip. Liliana moans around your [pc.nipple] and her fingers splay inside you momentarily before she regains her composure.");

	output("\n\n<i>“You like that? There’s plenty more coming,”</i> you whisper with emphasis on the last word, sending a shudder through the slender blonde’s body. Your fingers search her insides as they rub, prodding with touches until her legs suddenly tense. You assault the spot that caused her spasm, bringing many more with each cycle of fingering. She tries to keep up with you, but falls rapidly behind as your pleasure onslaught continues.");

	output("\n\nA number of her now haphazard thrusts strike several chords of ardor, but the exhausted ant-girl can’t collect herself for long enough to notice the specific places. Her fingers attempt to splay out inside you multiple times, but your [pc.vagina " + x + "] keeps them bundled together. You join her in a duet of moans as she is rendered unable to continue playing with your [pc.chest].");
	output("\n\nYou quickly stifle the noise with a kiss, your [pc.tongue] diving into her mouth and tickling its corners from cheek to cheek. The double ended assault is too much for Liliana to resist, and you see her eyes roll back as she moans into your lips. You thumb her clit as her tight pussy cums around your fingers.");
	output("\n\nHer twitching fingers are just enough to lift you to the same cloud she’s on, your mind fluttering away as bolts of bliss pierce your every nerve. You collapse atop your equally well fucked partner, basking in each others warmth until you recover enough to move. You give her one more kiss before you push yourself up on shaky arms.");
	output("\n\nThrough labored breaths, Liliana tells you she’s going to stay and sleep for a few minutes. You smile and gather your belongings, giving her one last pat on her twitching abdomen before leaving the thoroughly sexed ant-girl to her rest. You slip out of the curtain, relieved to find that its sound dampening was effective. You head back to the DMZ, eager to return to your endeavors.");
	processTime(23+rand(3));
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Liliana new scene
//button name (maybe): 'Tech is Sexy'
//requires hardlight undies and adjustable hardlight size pak
//first appears through Lil's talk menu 2nd stage, alongside 'Encourage-arm' and 'Encourage-stay' options, and can be selected in lieu of one of them
//re-appears in Lil's sex menu after PC has performed it once /OR/ if Lil has arm
//tooltip: Acquaint Liliana with the finer points of technology using your lewd, luminous prosthesis.
//disabled tooltip, no hardlight: You need hardlight-enabled underwear with a toy of adjustable size for this.

public function lilianaSexyholocawk(talked:Boolean = false):void
{
	clearOutput();
	showLiliana(true);
	//intro if entering from the second 'Talk' scene (i.e. the arm-selection scene)
	//replaces/retraces the usual Sex menu intro where Lil takes PC to her bed
	if(talked)
	{
		if(pc.isBimbo()) output("<i>“Why worry about stuff like that?”</i> you ask, earnestly. <i>“All that matters is the fun it brings you.”</i>");
		else if(pc.isBro() || pc.isAss())
		{
			output("<i>“You worry about a lot of shit that’ll never happen,”</i> you grunt.");
			if(pc.isBro()) output(" <i>“You’d be happier with it.”</i>");
			else output(" <i>“Most people don’t pay attention to anyone but themselves. Of course, I don’t mind if you suffer for </i>my<i> approval... but I’d jump at the chance to have some pleasure in my life instead of constant pain.”</i>");
		}
		else if(pc.isMischievous()) output("<i>“Oh, and your scar is so pleasing, right?”</i> you jibe. <i>“You’re missing out on a lot of fun... or at least, the chance to end that pain.”</i>");
		else output("<i>“Haven’t you done enough, though?”</i> you ask, earnestly. <i>“You have a chance to be happy. Do you really need to be in pain to please strangers?”</i>");
		output("\n\nLiliana rubs the gap in her side and considers. <i>“You think technology can accomplish something like that?”</i>");

		if(pc.isBimbo()) output("\n\n<i>“Totally. I’ve seen some amazing, sexy tech out there.”</i>");
		else if(pc.isBro()) output("\n\n<i>“Yup.”</i>");
		else if(pc.isAss()) output("\n\n<i>“Duh.”</i>");
		else if(pc.isMischievous()) output("\n\n<i>“Look at this face. Would I lie to you?”</i> you ask deviously.");
		else output("\n\n<i>“Well... sure it could.”</i>");
		output(" Your mind, reaching for impressive tech you can demonstrate for the girl, wanders to your upgraded underoos and you lean in conspiratorially. <i>“In fact, I have some on me right now that could give you </i>a lot<i> of pleasure.”</i>");

		output("\n\nYou point toward your crotch, and activate the prosthesis at its lowest setting. A cute little prick fizzles into life for a few seconds, then disappears when you cut the power. The myr, who had drawn close in to hear your whisper, blushes a golden orange. <i>“Oh my...”</i> she stammers.");

		if(pc.isBro()) output("\n\n<i>“So, wanna fuck?”</i>");
		else 
		{
			output("\n\n<i>“Would you like to go somewhere private and see more?”</i> you ask. <i>“The full demonstration ");
			if(pc.isBimbo()) output("will make your pussy break out in applause");
			else output("is much more impressive");
			output(".”</i>");
		}
		output("\n\nShe’s so embarrassed that her voice is barely more than a whisper. <i>“Okay,”</i> she says, looking from under her eyebrows.");
		if(pc.isCrotchExposed() || pc.isChestExposed() || pc.isAssExposed()) 
		{
			output(" <i>“But, um... I’m staying in a field hospital right now and they’re really strict about exposed skin, so... you should cover up with this.”</i> She shoves her blanket at you.");
			output("\n\nYou ");
			if(pc.isNice()) output("nod, and ");
			else output("roll your eyes, but ");
			output("take the threadbare cloth and drape it around yourself. <i>“How do I look? ");
			if(pc.isAss()) output("Like a bum?");
			else output("Mysterious?");
			output("”</i>");

			if(pc.isAss()) output("\n\n<i>“No, not at all,”</i>");
			else output("\n\n<i>“Yes, very,”</i>");
			output(" the myr-girl laughs.");
		}
		output(" She pulls you along by the hand, shrinking from the knowing stares of the patrons as she leads you from the bar and into the demilitarized zone. Her fingers drum nervously on your palm, ");
		if(pc.isNice()) output("and you squeeze her hand in reassurance. Liliana looks at you, then smiles, reassured.");
		else if(pc.isMischievous()) 
		{
			output("and you amuse yourself by ‘stumbling’ into her as often as you believably can, pressing your ");
			if(pc.biggestTitSize() >= 10) output("lewd ");
			output("body against her in ways that ensure the poor girl is bright pink with embarrassment by the time you reach your destination.");
		}
		else output("and you smile to yourself, gratified.");

		output("\n\nShe takes you to a medical facility where the busy staff check you in with nary a glance, and leads you through sterile sterling hallways to a barracks-like room. Several myrrish heads turn as Liliana leads you to her bed, attention you’re sure isn’t lost on her.");
		output("\n\n<i>“I’m going to close the privacy curtain,”</i> she says. <i>“It’s there so we can sleep whenever we need to. It blocks most noises, so....”</i>");
		output("\n\n<i>“...it should block </i>our<i> noise?”</i> you finish helpfully. Liliana smiles again");
		if(pc.isMischievous()) 
		{
			output(", and you continue: <i>“That sounds like a challenge.”</i>");
			output("\n\n<i>“Oh, no, not at all. Please...”</i> the nervous myr stammers. You motion her to relax, and she finally begins to disrobe, relieved");
		}
		output(".");

		output("\n\nLiliana pulls off her top, grabbing the hem and tugging it over her head to reveal her breasts, which are bound tightly in a wrap - though like a badly-disguised birthday present, you can already tell what’s inside and you want it even more. She separates from the shirt and pauses when she detects your gaze on her chest, coloring under every second of scrutiny. You meet her eyes and she smiles again in relief, then the wrap too is peeled away. Liliana covers herself with two hands as she removes it, gauging the interest in your face. Slowly, through parted fingers, small, pert breasts and cute golden nipples appear, trembling slightly with her excited breath.");
		output("\n\n<i>“So?”</i> she says.");

		if(pc.isNice()) output("\n\nYou lean in and kiss her. Liliana is surprised at first, then gratified; her lips part and meet yours, pulling greedily in a show of affection.");
		else
		{
			output("\n\nYou hold your chin and narrow your eyes in mock appraisal. Liliana curses you, laughing, and smacks you with a pillow");
			if(pc.isMischievous()) output(", whereupon you press close and capture her lips with a surprise kiss. She drinks you greedily, but you separate from the eager myr and fold your hands.");
			else output(" but you fend her off and recline placidly.");
		}
		output("\n\n<i>“What’s up?”</i> Liliana asks. <i>“Why’d you stop? Do I need to do something?”</i>");

		//do flags["LILIANA_SEEN_NAKKERS"] = 1
		flags["LILIANA_SEEN_NAKKERS"] = 1;
		//end of ‘2nd talk topic’ ver. intro
	}
	//first time intro if coming from sex menu
	else if(flags["LILIANA_HOLODONGED"] == undefined)
	{
		output("<i>“By the way, how are you liking that new arm?”</i>");
		output("\n\nLiliana smiles, keenly conscious of expected gratitude. <i>“It’s great. I didn’t imagine that it could feel as natural as my own, but alien technology really is wonderful.”</i> S");
		if(flags["LILIANA_ARMS"] == 1) output("ervomotors whirr quietly as s");
		output("he presses her new fingers together with the old.");

		if(!pc.isAss()) 
		{
			output("\n\nYou return her smile warmly, to put her back at ease. ");
			if(pc.isBimbo()) output("<i>“Mmm, you think that’s good, honey? I’ve got some tech that’ll </i>really<i> knock you out of your pants,”</i> you purr.");
			else output("<i>“Yeah? Want to see some even wilder tech?”</i> you ask.");
		}
		else output("\n\n<i>“You haven’t seen shit. I can show you tech that’ll make your knees weak,”</i> you grin.");
		output("\n\nLiliana looks momentarily startled by your suggestion, and her face colors. She considers carefully, then speaks: <i>“Yes... I suppose you </i>would<i> have even more surprises in store. I’d... like that.”</i>");
	}
	//when coming from sex menu
	else
	{
		//intro from sex menu here
		if(!pc.isAss() && !pc.isBro()) output("<i>“Hey so... wanna play with our toys again?”</i>");
		else 
		{
			output("<i>“I want to fuck you with my strap-on again.”</i>");
			if(!pc.isTaur() && !pc.hasAirtightSuit()) output(" You stick your thumb in your [pc.lowerUndergarment] and tug the waistband to remind her of your photonic pleasure-tool.");
		}
		output("\n\nLiliana blushes. <i>“Okay. Show me how they work again.”</i>");
	}
	//merge all intros here
	output("\n\nYou nod. <i>“Press that decal,”</i> you say, pointing at your underwear.");
	output("\n\nLiliana giggles nervously. <i>“Okay...”</i> she says, and touches the spot. Your tech-tool springs into life, beaming from your crotch. Liliana covers her mouth and laughs. <i>“That’s so cute.”</i>");
	output("\n\nCute, eh? You point to another spot. <i>“Slide your finger along here.”</i>");
	output("\n\nLiliana obliges, tracing a ticklish line along your waist. Her eyes widen as your little photonic prick goes from the lowest length setting to the highest, stretching out so quickly that ");
	if(pc.isTaur()) output("it bumps the ground");
	else output("the glans pokes her in the chest");
	output(".");
	if(flags["LILIANA_HOLODONGED"] == undefined) output(" <i>“Oh, wow...”</i>");
	else output(" <i>“I never get tired of that,”</i>");
	output(" the myr marvels.");

	if(pc.isTaur()) output("\n\nYou sit on your haunches, causing the long prick to bob into the air, then beckon Liliana closer. She scoots");
	else output("\n\nYou scoot");
	output(" up, intentionally nudging the cock-head through her shallow cleavage; the sensation of her pale, smooth skin transits the toy and tingles your nerves. <i>“Next, here,”</i> you instruct, pointing to another elongated decal.");
	output("\n\nShe touches it, more a caress than a swipe. The prick thickens to maximum girth, swelling so much that it touches both of the petite-chested girl’s nipples. Liliana shivers, and you feel a new tingle in your spine from watching her arousal.");
	//misch/mean and has cock or vag
	if((pc.isMischievous() || pc.isAss()) && (pc.hasCock() || pc.hasVagina()))
	{
		output("\n\n<i>“Now here,”</i> you say, indicating one last spot. Liliana touches it, then recoils when her finger comes away wet. She re-summons her courage and touches it again; nothing happens, and she begins to rub, trying to find the spot.");
		output("\n\n<i>“It’s not doing anything,”</i> the myr says.");
		output("\n\n<i>“Oh yes it is,”</i> you grunt, and shudder out another drop of ");
		if(pc.hasCock()) output("pre-cum");
		else output("lubrication");
		output(" as her misguided finger rubs ");
		if(pc.hasCock()) output("your real cock");
		else output("[pc.oneClit]");
		output(" through the fabric.");

		output("\n\nLiliana pulls away, laughing. <i>“You’re bad,”</i> she scolds.");
	}
	//no new paragraph (continue from either <i>“her arousal”</i> or <i>“she scolds”</i>)<i>“);
	output(" The myr sits on the bed and beckons you closer with a finger, spreading her legs. Her small abdomen hangs between them and her pussy glistens on the end, like a dewdrop. Unable to stare anywhere else, you fumble for the controls to your sex-aid, reducing it in size until it neatly matches and setting it there.");
	output("\n\nYou move ");
	if(pc.isTaur()) output("astride the woman, placing your fore[pc.feet] on either side,");
	else output("toward her,");
	output(" and she trembles. A drop of sweet-smelling myrrish nectar falls from her vulva to wet the bedspread - glib observations about wetness and lust form in your ready mind, but before you can speak, Liliana pulls you into a passionate ");
	if(pc.isTaur()) output("hug");
	else output("kiss");
	output(". Your faux-prick slips into her, guided by the myr’s ");
	if(talked) output("third hand");
	else output("lower hands");
	output("; her ");
	if(pc.isTaur()) output("arms");
	else output("lips");
	output(" jar slightly as your entry thrust pushes her higher on the bed. The warmth and tightness of her slight body transmits to you through the toy; you can feel every inch of her as though you were there.");
	if(pc.isTaur()) output(" You lean forward and she");
	else output(" She breaks the kiss and");
	output(" meets your gaze.");

	output("\n\n<i>“Well... you’re inside,”</i> Liliana whispers. Her shy eyes still peer at you from under long lashes, but in her voice you hear a note of... validation? Perhaps pride?");

	//yeah, missionary position!
	output("\n\nYou brace against the bed mattress and begin to pump the little myr, starting slowly, relying on her face for cues. Liliana obliges; her eyes glitter with excitement, encouraging you to go faster, push deeper. Her face twists into a grin of pleasure; her teeth appear in a tense smile and she bites her lip as a particularly well-aimed stroke hits her nerves. The encouragement in her eyes takes on a shade of pleading, begging you for another just-right stroke, and another, which you deliver and she greedily accepts.");

	if(pc.isTaur())
	{
		output("\n\nLiliana’s fingers creep along your side until they find the controls to your underwear. They quickly locate the unlock button and press it; you worry that her squeezing thighs might touch the size controls, but she seems aware of them - they spread wide and allow you to hilt yourself completely in her pussy, then fold around you. While you’re ");
		if(pc.PQ() >= 80) output("easily ");
		output("strong enough to pull away from the quivering girl, you decide to wait and see what she does.");
	}
	else output("\n\nYour fingers creep to your underwear, locating the unlock button. Liliana parts her legs at first, in concern that she might touch the size controls with her thighs - and then has another idea. She hooks her knees around your [pc.butt] and pulls you in closer. You could resist if you wanted, but instead allow her to draw you in until the toy is hilted in her pussy and her hand is at the controls, resting atop yours.");
	output("\n\nLiliana touches the length control first, tracing a line along your side that stretches the cock in her cunt. Her cute, lip-biting expression returns as you feel the toy’s tip bump the opening of her womb; her hand moves to the girth control and she blushes when you give her a knowing smile, but you feel another caress, regardless. The photonic prong swells, pressing against the walls of Liliana’s sex, and she continues her slow tickle until you see her eyes pinch shut in the pleasure of having all her sensitive places touched at once. She stops to savor it - ten seconds, twenty. You begin to move again, but her legs resist you and bring you to a stop. One last touch radiates from your side, and the toy swells again, just a hair’s breadth. Liliana sighs, and opens her eyes again... clear, shining, and beckoning. Her legs unlock; she’s ready.");
	output("\n\nSo are you. You begin to pump at the ant-girl quickly, stretching her pussy with brutish strokes of your filled-to-fit toy, heedless of the disengaged safety lock on the dildo and her squeezing thighs. ");
	if(pc.isTaur()) output("Liliana makes a token gesture to stop from brushing the controls by raising her legs to wrap around your back, and goes back to savoring the sex.");
	else output("You make a token gesture to keep her legs off the controls by grabbing them under the knee and pushing them up to her shoulders; Liliana doesn’t seem to mind the contortion, and even shivers in pleasure as you man-handle her slender body.");
	output(" Her petite breasts tremble with each push of your artificial cock, and her nipples are hard as golden jewelry, sticking up and begging to be touched. Liliana beats you to it; two of her hands grab her nipples and begin to pinch and squeeze, causing her to moan in soprano ecstasy. The girl conforms her body to yours, pressing flesh to [pc.skinFurScales] and rubbing so close that the delicately sweet aroma of myrrish sweat lingers.");
	output("\n\nAll these sights and scents spur your libido on, drawing out and hilting in the myr girl with deep, sawing motions that set Liliana moaning as your light-lance drags her nerves like a seine. Her back begins to arch under you, curling a quarter-moon on each thrust; her breaths come short now, heavy panting that exposes just how far she’s fallen into pleasure. Her eyes shut and flutter open intermittently, and whenever you manage to catch them with your own gaze, they radiate gratitude and adoration.");

	//if PC has cock and is not horse
	if(pc.hasCock() && !pc.isTaur())
	{
		output("\n\nLiliana’s fingers return to your [pc.lowerUndergarment] again, but not for the controls. She slips into the waistband and touches the tip of your [pc.cockNounSimple], extracting a squeeze of precum from your hair-trigger nerves. The myr giggles as the [pc.cumVisc] fluid coats her fingers, and then guides your cock upright, so it’s pressed between your stomach and her crotch. She pulls your shoulders close with her other hands, positioning you so that your stiff, sensitive prick rubs against her body with each thrust of the strap-on toy, doubling your pleasure.");
	}
	//if no cock but has vag and is not horse
	else if(pc.hasVagina() && !pc.isTaur())
	{
		output("\n\nLiliana’s abdomen curls and flexes with the rest of her as you abuse her pussy; a strange rhythm of touches continues to drum against your pelvis and the myr under you stretches and shifts her body, trying to accomplish you-know-not-what. Frustrated, Liliana grabs your shoulders and pushes you away from her chest, until you’re riding her upright. From here, the purpose of her abdomen’s strange drumbeat becomes clear; every time you thrust or withdraw, it rubs against your [pc.clit], sending a stir of sexual excitement through your own neglected pussy. Liliana smiles as your eyes brighten with understanding, but she doesn’t speak... except to issue the next low moan that accompanies each thrust.");
	}
	//merge
	output("\n\nThe myr compels you with her eyes, begging deeper, stronger thrusts into an ever-wetter sex. You oblige, and within minutes, her muscles tense.");
	output("\n\n<i>“Gonna... cum!”</i>");

	output("\n\nThe slight woman locks up, ");
	if(!pc.isTaur())
	{
		output("throwing her arms around your neck and ");
	}
	output("pressing herself into you. Her stiff nipples poke a sewing stitch into your [pc.skinFurScales] as she shakes and curls her back, moaning in low register. Tiny drops of sweat bead on her skin and her stomach ripples visibly as her lower body squeezes out orgasm in waves like a tube of toothpaste. The ant-girl’s pussy clings to your toy so wetly and her body is so close that her orgasm triggers you as well.");
	if(pc.hasCock())
	{
		output(" Your [pc.cockHead], pressed against her spasming stomach muscles, spurts a ");
		if(pc.cumQ() < 100) output("dribble");
		else output("line");
		output(" of cum");
		if(pc.cumQ() > 500) output(", then another. In moments, your underwear is soaked in [pc.cumVisc] [pc.cumNoun] by your overproductive [pc.balls], and every one of Liliana’s writhing contortions generates a slick, squishing sound from your nethers");
		output(".");
	}
	else if(pc.hasVagina())
	{
		output(" Tickled by the tip of her abdomen, your [pc.clit] transmits a tingling spasm through your [pc.vaginas], which ");
		if(pc.wettestVaginalWetness() < 3) 
		{
			output("dribble");
			if(pc.totalVaginas() == 1) output("s");
			output(" a trickle of [pc.girlCum] into your underwear");
		}
		else
		{
			output("gush");
			if(pc.totalVaginas() == 1) output("es");
			output(" with enough [pc.girlCum] to soak your underwear and slick Liliana’s chitin");
		}
		output(".");
	}
	else output(" Your sad, neglected asshole, at the mercy of the waves of related pleasure transmitting to you through the feedback, twitches and clenches, orgasming in solitude.");

	//endings
	//if came from talk scene (flags["LILIANA_TALKS"] = 2)
	if(talked)
	{
		flags["LILIANA_TALKS"] = 2;
		output("\n\nIt takes several minutes for Liliana to regain her wind.");
		output("\n\n<i>“That was good,”</i> she muses, squirming around the perfect-fit-prick and drawing aftershocks from you. <i>“I suppose you’re right. There’s something to be said for technology.”</i>");
		output("\n\nEqually exhausted, you pull out of her twitching pussy and tap the power control. The faux-cock disappears instantly, leaving a dick-shaped mold of myrrish pussy-nectar hanging in the air for a fraction of a second before it falls to splatter her abdomen. The sight provokes a laugh from the girl.");
		if(pc.isBimbo()) output("\n\n<i>“Din’ I tell you?”</i>");
		else if(pc.isBro() || pc.isNice()) output("\n\n<i>“Well?”</i>");
		else output("\n\n<i>“Told you it was wild,”</i>");
		output(" you finally grunt, having caught your breath.");

		output("\n\nLiliana rubs her scar thoughtfully, then looks up at the ceiling. <i>“Yeah...”</i> she agrees. <i>“About that... I never asked your opinion, did I? About the arm thing. I just dumped all my worries on you instead and you had to distract me from my obsession. What do you think?”</i>");
		//re-present the ‘buy an arm’ choices from Lil’s 2nd talk scene, minus the current scene
		IncrementFlag("LILIANA_HOLODONGED");
		processTime(25);
		if(pc.isTaur()) pc.changeLust(15);
		else
		{
			pc.orgasm();
		}
		clearMenu();
		if(pc.credits >= 2000) addButton(0,"Get An Arm",lilianaIsTotallyRobocopAnt,undefined,"Get An Arm","Encourage Lilianna to get a new arm. You guess it would cost about 2000 credits for robot arm or 6000 for real arm.");
		else addDisabledButton(0,"Get An Arm","Get An Arm","You don’t have enough credits to help Liliana get a new arm.");
		//[Encourage-arm](requires at least 2k credits to start)
		//tooltip: Encourage Lilianna to get a new arm. You guess it would cost about 2000 credits for robot arm or 6000 for real arm.
		//Tooltip: encourage Liliana that she’ll be okay even without the arm.
		addButton(1,"Encourage",encourageWhatsHerButtNotToBeRobocop,undefined,"Encourage","Encourage Liliana that she’ll be okay even without the arm.");
	}
	//else if did not come from talk scene
	else
	{
		output("\n\nLiliana takes several minutes to catch her breath, as do you after the energetic performance. She beams a wide, happy smile at you throughout");
		if(!pc.isAss()) output(", which you return easily");
		output(". When she has wind enough, she leans in for a hug and a final kiss.");
		output("\n\n<i>“Thanks,”</i> Liliana says, breaking away from the embrace. <i>“I hope I see you again sometime.”</i>");
		output("\n\nYou nod and pull free of her still-twitching pussy, then deactivate the dildo. It vanishes so quickly that a faint outline of myrrish girlcum hangs in the air for a split-second.");
		if(!pc.isCrotchExposedByArmor() && pc.hasArmor()) output(" You re-dress, stuffing your soggy, nectar-sodden underwear into your [pc.armor], and bid her good-bye.");
		else output(" You bid her good-bye, then exit the facility with your exposed, myr-cum-soaked underwear visible for all to see. You’re almost certain that, behind you, Liliana is blushing again.");
		//end
		//pass time; raise lust if unsexed or horse, else do PC orgasm
		//if not going to arm-surgeon, place PC wherever he goes after sex with Liliana
		IncrementFlag("LILIANA_HOLODONGED");
		processTime(25);
		if(pc.isTaur()) pc.changeLust(15);
		else
		{
			pc.orgasm();
		}
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
}