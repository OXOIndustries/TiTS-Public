//By Franks
//
//Actually a girl(Pump-Queen doesn’t have the same ring to it, shut up)
//Appears on Mhen’ga, attempts to take over settlement(Lol because that would totes end well)
//Level 8 or higher PC receives email from Penny near Halloween(Assuming they’ve met Penny) asking for help
//
//Dungeon layout: https://docs.google.com/spreadsheets/d/1-Kx0qV21mIdLDqFUlQQdlbREiyjqI9YZmuCbQfVok4Y/edit?usp=sharing

//Regular Penny email(Only procs if Penny is on planet)
//From: Penny Inoue <Penny_Inoue@UGC.gov>
//To: [pc.name] Steele <[pc.email]@SteeleTech.corp>
//Subject: ‘Pump-King’ rampaging on Mhen’ga

//Cumslut Penny email
//From: Penny Inoue <Penny_Inoue@UGC.gov>
//To: [pc.name] Steele <[pc.email]@SteeleTech.corp>
//output("\n\nSubject: ‘Pump-King’ causing trouble on Mhen’ga");

//Bimbo Penny email:
//From: Penny Inoue <Penny_Inoue@UGC.gov>
//To: [pc.name] Steele <[pc.email]@SteeleTech.corp>
//Subject: Annoying pumpkin guy

public function pennyPumpkingEmailSubject():String
{
	if(penny.isBimbo()) return "Annoying pumpkin guy";
	else if(pennyIsCumSlut()) return "‘Pump-King’ causing trouble on Mhen’ga";
	else return "‘Pump-King’ Rampaging on Mhen’ga";
}

public function pennyPumpkingEmailText():String
{
	var emailTxt:String = "";
	//bimbo penpen
	if(penny.isBimbo()) emailTxt = "So like, I was getting fucked by those zil dudes and they tried to get me to join their club for their weird ‘Pump-King’ dude but I was like <i>“Uh, I </i>have<i> a </i>[pc.boyGirl]friend!<i>”</i> and they were like trying to drag me into the jungle! But I fucked them again and uh... I think I woke up in my office? Anyway I don’t like this Pump-king weirdo. You should come beat him up for me! He’s making me actually do my job, and that SUCKS! And not the good way.\n\n<i>A nude selfie is enclosed as well, Penny’s tongue hanging sloppily out of her mouth while her free hand pinches a pebbled nipple. She’s clearly in the middle of orgasm, judging by the fact that her eyes are rolled halfway up into her skull and her face is covered almost completely with jizz. How is she holding the camera while she’s cumming her brains out?</i>";
	//cumslut penpen
	else if(pennyIsCumSlut()) emailTxt = "[pc.name],\n\nHey, sexy. Remember me? Well, there’s trouble in paradise - some wacko calling themselves the ‘Pump-king’ is running loose in the jungle around Esbeth, vandalizing shit with a pumpkin on their head and gathering displaced zil as followers. They’re not even that good in bed!\n\nCould you come lend a hand? I have... other things I could be doing. Like you.\n\n<i>A nude selfie is enclosed as well. Penny is taking a picture of herself with her left hand and masturbating furiously with her right, the entirety of her lewd body on display, the fennec’s eyes practically glowing with sexual hunger.</i>";
	else emailTxt = "[pc.name],\n\nHey, uh, I’m really sorry to beg for help, but we’ve got a bit of a situation here on Mhen’ga, and I was wondering if you could lend a hand " + (flags["ZIL_PROBLEM_DEALT_WITH"] != undefined ? "like you did with those Zil?":"to a settlement in need? I’m sure it would help the Steele brand.") + " There’s this weirdo running around with a Pumpkin on his head calling himself the ‘Pump-king’ and proclaiming himself King of Mhen’ga. At least, I <i>think</i> it’s a dude, given that he’s specifically calling himself a king. Whatever. I sent for backup, but they gave me some bullshit about low threat level and said the nearest non-priority team would be out from Tavros in two weeks. TWO FUCKING WEEKS. I mean whoever this is isn’t hurting anyone so far, just vandalizing shit and banging zil girls, but Crazy Carl says his latest weapon shipment got stolen.\n\nWhich leads me to the other thing, actually; some of the zil have started to recognize him as their leader. They’re even protecting him, or I probably would’ve caught him myself. I mean I’m not <i>that</i> worried, they’re only the size of a small tribe, but I’d still really like to not wait two weeks to have this bullshit resolved and take the chance of this weirdo becoming a real threat. Can you come beat some sense into this dude so I can lock him up?\n\n\t<i>Officer Penny Inoue, U.G.C. liaison for Mhen’ga colony</i>";
	return ParseText(emailTxt);
}

//Meeting Officer Trent(Should proc when PC enters Penny’s office): 
public function pumpkinStartingQuest():void
{
	clearOutput();
	author("Franks");
	showName("OFFICER\nTRENT");
	showBust("OFFICER_TRENT");
	output("As you enter Penny’s office you see... another UGC officer, a lean, flat-chested human woman who looks to be in her late twenties with gentle brown eyes, wavy blonde hair down to her neck, and milk-pale skin. Penny is nowhere to be found.");
	output("\n\nStepping up to the haggard-looking officer as she looks up from whatever she was doing, you ask her the obvious thing; where the hell is Penny?");
	output("\n\n<i>“Officer Inoue? She’s been kidnapped, I’m s-sorry to say. I’m Officer L-lana Trent. This ‘Pump-king’ character... we underestimated them. The security cams show them c-coming out of the jungle one night - they must’ve hacked the defense turrets - led by someone I can only assume is the terrorist. They went straight f-for the UGC office, armed with the contents of a w-weapon shipment that was supposed to reach Carl Jakovich’s shop. Dragged p-poor Officer Inoue out into the jungle in her pajamas. G-god only knows what the savages are doing to her out t-there.”</i> she says, pausing to glance nervously at the treeline through the open door behind you. <i>“" + (pennyIsCumSlut() || flags["PENNY_BADGER_BIMBO"] != undefined ? "N-not that she’s likely to mind, if the rumors are true. ":"") + "Anyway... I don’t know what I can d-do about this, honestly. Most nights I have a hard time s-sleeping, wondering if I’m n-next... just gotta hold out for two more weeks until S.W.A.T. arrives. I can d-do this,”</i> the poor woman says, obviously trying to convince herself more than anyone else.");
	processTime(2);
	clearMenu();
	addButton(0,"Help",helpDrTrentMD,undefined,"Help","Give the poor girl a hand.");
	addButton(1,"No Way",notYetDocTrent,undefined,"Not Yet","You’re not going to deal with a problem like this!");
}

// {PC selects ‘Help’}
public function helpDrTrentMD():void
{
	clearOutput();
	author("Franks");
	showName("OFFICER\nTRENT");
	showBust("OFFICER_TRENT");
	output("Laying a reassuring hand on Officer Trent’s shoulder, you flash a smile as you start to speak - you’ve been in a few scraps yourself, and you’ll be damned if you let some psycho in a pumpkin hat pick on" +(flags["SEXED_PENNY"] != undefined ? " one of your favorite officers.":" an innocent officer of the law.") + " It. Is. On.");
	output("\n\nLooking visibly relieved, Officer Trent nods and steeples her fingers. <i>“I’m certainly r-ready to take any help I can get. And I understand Officer Inoue went out of her way to contact you, so you m-must be reliable. Still... this guy i-is for real. His zil have modern weapons now c-courtesy of Mr. Jackovich, and from what I’ve seen on the security cams they’re pretty well trained to boot. Are you s-sure you can take them alone? We have reason to b-believe they’re holed up in a cave system somewhere in the eastern half of the deep jungle. I won’t be helping. I’ve got to... m-make sure they don’t g-get up to any mischief here in Esbeth. Maintain order and p-prevent panic. Yeah... oh fuck me, I’m not fooling anyone. They’d eat me alive and I k-know it. I-I’m just a desk sergeant man, I just wanna see my kids again... w-whose bright fucking idea was it to p-put </i>me<i> in this mess!? Did I piss someone off!?”</i>");
	output("\n\n<b>Officer Trent’s impending panic attack notwithstanding, you now have the whole story. If you want to chicken out, it might be best to skip off planet until the whole mess blows over. You’re getting the sense that despite their goofy description, this ‘Pump-king’ is dynamite. U.G.C. S.W.A.T. could handle this one - eventually. Certainly nobody will judge you for being " + (silly ? "a little bitch":"careful") + ". Or... <b>you could go looking for this pumpkin-headed freak in the jungle.</b>");
	processTime(5);
	flags["PUMPKING_COMPLETION"] = 1;
	clearMenu();
	addButton(0,"Next",move,rooms[currentLocation].southExit);
}

public function notYetDocTrent():void
{
	clearOutput();
	author("Franks");
	showName("OFFICER\nTRENT");
	showBust("OFFICER_TRENT");
	output("No, you’re not interested in this fight, at least not before you’ve had time to prepare. You give Lana the bad news, the crestfallen officer nodding slowly, resignation in her doe eyes. <i>“Yeah. Can’t expect you to take on our p-problems. Guess I’m s-sleeping at Burt’s again. N-not safe here anymore, you know? Not after what h-happened. Well. I’m... busy, Steele. Gotta help the t-town militia organize. C-command says it’s not likely they’ll hit us head on, says they fit the bill of g-guerilla fighters, but that’s just all the more reason to be p-prepared.”</i> she stutters. You turn to go, catching out of the corner of your eye the sight of Officer Trent staring longingly at a three-dimensional holoprojection of herself seated, with two beaming red-haired boys perched on her lap and an older but equally happy-looking one sitting next to her and hugging her left arm.");
	output("\n\nYou continue on out of the office silently.");
	processTime(5);
	flags["PUMPKING_COMPLETION"] = -1;
	clearMenu();
	addButton(0,"Next",move,rooms[currentLocation].southExit);
	//Penny's office is empty.
}

//(Procs from midnight to 1am, when PC is outdoors)
public function encounterPumpkingEvent():void
{
	showName("\nPUMPKING");
	showBust("PUMPKING");
	author("Franks");
	output("\n\nIt’s... quiet all of a sudden. <i>Too</i> quiet. You look around in suspicion and spot nothing, only a small rodent that looks every bit as worried as you perched on a tree. The creature flees after a moment, leaving you in complete, eerie silence... until the sound of hooves beating the ground fills the void. You look around quickly, finally spotting a... okay then. It’s a tall figure atop a horse black as night, a large carved pumpkin replacing their head. You can see no face in the pumpkin’s mouth, only glowing orange light. Is this... the Pump-king? It would seem so. Aside from the horse and pumpkin head, the figure is wearing a full suit of androgynous, gothic-styled plate armor. The metal is so black it almost seems to absorb light, with two gold inlaid carved pumpkins on either breast, glittering ruby eyes and mouths full of silver teeth flashing in the pale moonlight of Mhen’ga.");
	output("\n\nThe mouth and eyes of the pump-king’s head glow brighter suddenly, it’s face turning to gaze at you as it’s warhorse rears up, kicking at empty air with its front hooves and loosing a shrill whinny.");
	output("\n\n<i>“<b>The witching hour is here! Esbeth’s doom draws near!</b>”</i> it intones, unnaturally loud voice reverberating into the trees around you as the horse clops over to you.");
	output("\n\n<i>“<b>The settlers live in fear,</b>”</i> the figure continues, circling you from a safe distance - it appears they don’t want a fight just yet. <i>“<b>They know their true ruler is here.</b>”</i>");
	output("\n\n<i>“I think it’s more of a general annoyance than fear, buddy. Do you have any meds you’re supposed to be on, or have you not sought professional help yet?”</i> you snap back, hefting your [pc.weapon].");
	output("\n\nThe light in the pumpkin’s eye sockets glows a deeper, angrier shade of orange as the figure begins to speak again. <i>“<b>You have a sharp wit. You may regret it.</b>”</i> the rider says, leaning down and snatching a gold-banded horn out of the horse’s saddlebag. The horn is blown not even a moment later, before you can react, and a sharp, almost musical call resonates through the jungle. Hearing movement behind you you turn, only to be greeted by the sight of no less than ten zil armed with rifles and clad in basic body armor stepping out of the treeline. That must be Crazy Carl’s weapon shipment. The zil form a frighteningly orderly rank and raise their weapons in perfect unison, aiming directly at you. A lean, muscular human male stands behind them barking orders. Well then.");
	output("\n\nThe pumpkin-headed rider turns their horse about and trots behind the zil.");
	output("\n\n<i>“You dare threaten our queen, interloper!?”</i> one of the bee-men shouts, earning a cuff upside the head from the human behind him.");
	output("\n\n<i>“Pump... queen?”</i> you say, bemused. The rider’s eyes flash bright for a moment and you can sense the embarrassment rolling off her before she recovers herself.");
	output("\n\n<i>“Pump-king sounds better! Nobody asked for your opinion, buddy!”</i> she snaps, abandoning her rhyming. Her horse stomps and whinnies, as if in agreement. She turns her mount about and disappears into the treeline after that, muttering angrily to herself. The zil follow close behind.");
	output("\n\n<b>They must have a hideout somewhere in these woods. If you can find it, you can put an end to this madness once and for all!</b>");
	processTime(7);
	flags["PUMPKING_COMPLETION"] = 2;
	variableRoomUpdateCheck();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Johr/Zil trainee fight
//(Johr is an unmodified human man who works for the Pump-king training zil soldiers. He should be a tough fight due to the fact that you’re fighting him at the same time as his trainees, but not impossible. I’m thinking he’d be a melee fighter primarily.)
public function defeatJohr():void
{
	showName("\nJOHR");
	showBust("JOHR");
	author("Franks");
	flags["PUMPKINGS_JOHR_DEFEATED"] = 1;
	if(enemy.lust() >= enemy.lustMax())
	{
		output("As Johr crumples to the ground with his zil, breathing heavy and clutching his crotch, you take a moment to recover from the fight. What to do with your defeated foe...?");
		output("\n\nWhile you’re deciding, the lust-addled human is clumsily fishing in his breast pocket for something, swallowing hard as he tries to fight through the haze of sexual desire clouding his judgement. He does have a nice ass...");
		output("\n\nYou see something small and black flying through the air, and your vision explodes into triples with no warning, your ears ringing horribly. You do manage to hear (and see) Johr crawling away from you, eventually struggling to his feet and stumbling away, mumbling something about finding the zil girl...");
		output("\n\nOnce he’s gone and you’re fully recovered, you spot a key on the ground - a skeleton key, with... you guess it... wait, no, that’s actually just a skull for the handle. Huh.");
		
	}
	else
	{
		output("As Johr crumples to the ground along with his zil you take a moment to gather yourself, recovering from the tough fight. What to do with this fellow, though? He slowly sits up as you think, rubbing his head and groaning. <i>“Fuck me, I’ve never lost a fight before. Congratulations, whoever you are. Here,”</i> he says, reaching into a breast pocket, <i>“have this for winning.”</i>");
		output("\n\nYou see a black cylinder fly out of his hand, see it hit the ground and your vision explodes into triples. You collapse to your knees with your ears ringing as Johr takes his hands off his ears, opens his eyes and breaks into a dead sprint, leaving you to recover from the flashbang he dropped. By the time you’re back on your feet he’s turning a corner. Well, fuck. At least he dropped the key to the throne room as he fled. Probably didn’t fancy the thought of you chasing him.");
	}
	output("\n\n<b>Now you can unlock the throne room!</b>");
	output("\n\n");
	CombatManager.genericVictory();
}

public function loseToJohr():void
{
	showName("\nJOHR");
	showBust("JOHR");
	author("Franks");
	if(enemy.lust() < 50)
	{
		output("As you crumple to the ground, beaten, Johr stalks over to you with weapon raised cautiously, smirking. <i>“Goodbye, whoever you are. It was fun.”</i> he drawls, right before he skewers you. As your vision fades you see him casually cleaning his weapon, humming to himself.");
		badEnd();
	}
	else
	{
		output("As you crumple to the ground, the sergeant stalks over to you, jade eyes smoldering. <i>“Well, you’re not a very good fighter. Hopefully you’ll be a better fuck. Anyway...”</i> he trails off, then kicks you onto your stomach and straddles your back. He pulls a pair of stun cuffs off his belt and swiftly fastens them around your wrists before rolling you back onto your back and inspecting you coldly. " + (pc.hasVagina() && pc.femininity > 70 ? "<i>“Good start. Still, there’s always improvement to be made...”</i> he says, right before you feel the pinch of a needle piercing the skin of your neck.":"<i>“Hmph. We’re going to have to make some changes. Still, it’s easily doable.”</i> he says, right before you feel the pinch of a needle entering your neck.") + " your vision fades...");
		clearMenu();
		addButton(0,"Next",johrSlutBadEnd);
	}
}

public function johrSlutBadEnd():void
{
	clearOutput();
	showName("\nJOHR");
	showBust("JOHR_NUDE");
	author("Franks");
	output("When you wake up you find your wrists are now unbound, but you’re nowhere close to being free. You’re in a large cage now, very near to Johr’s room - at least, you can only assume so based on how often he stops by. At least twice a day he’s in your ‘room’, normally for an hour or two at a time drilling obedience and submission into you. You learn all about your new station in life, about the Queen you now live under (because somehow, she actually managed to take and hold Esbeth against all odds, and furthermore stopped calling herself the ‘Pump-King’. Now she’s the ‘Plump-Queen’, which you have to admit is more fitting.) and most importantly, getting used to your new body. Johr is a man of very specific tastes, and he sees to it that you suit them by the end of your first month as his slave, sparing no expense on mods. Your [pc.breasts] " + (pc.biggestTitSize() < 2 ? "grow":"shrink") + " to perky, perfectly teardrop-shaped B-cups. Your hair is now like beaten gold falling past your shoulders. Your body is svelte and soft, not a hint of muscle to be found anywhere, and your ass is soft and heart shaped, perfect for pounding." + (!pc.hasVagina() ? "And to top it all off, your junk has been replaced by a perfectly formed pussy, complete with hymen - not that that particular feature lasts long.":""));
	output("\n\nAnd does it ever get pounded. Every single day the blonde human is in you, pumping his ten inch cock into your womb, your mouth or your bowels as the mood strikes him. You try to escape at first of course, but the collar you were fitted with when you were captured is impossible to remove without the proper tools, and has a gps signal besides. Eventually, you come to accept, even enjoy your fate. Johr isn’t <i>cruel</i> to you, just demanding and oh, so wonderfully rough. You reach a point where you’re making up excuses for why you can’t try to escape today - you’re too sore, you just don’t think it will work, you have to wait for the right moment... but one day, the reality of your situation sets in.");
	pc.buttChange(100);
	if(pc.hasVagina()) pc.cuntChange(0,100);
	else if(pc.vaginalVirgin) output(" <b>You’re no longer a vaginal virgin!</b>");
	output("\n\nYou don’t <i>want</i> to escape anymore. You’re happy where you are, now. Every time Johr pulls the leash around your neck you get a small thrill. Every time he grabs you by the hair and shoves you to your knees or pins you against the nearest flat surface regardless of where the two of you are, you feel a familiar heat in your loins, the heat of undeniable lust. You can no longer even pretend to deny the truth at this point. You’re <i>happy</i> with the lack of control you now have over your life. Johr didn’t steal you away from your destiny as owner of Steele tech - he showed you that it wasn’t your destiny at all. He showed you that your <i>true</i> place is wherever he says it is. And it’s not so bad. Once he sees that you’re truly obedient to him, Johr lets you sleep in his bed - at the foot of the bed, of course, unless he wants you.");
	output("\n\nWhen your stomach starts to swell, you’re happier than you ever thought possible - not only are you serving your new master, now you get to have a baby with him? You would tell him how happy you are that he captured you, but your collar only lets you bark unless he changes the settings. Well, you’re sure you’ll get your chance eventually. You’ve got more important things to focus on anyway. Like raising your quickly growing family - Johr <i>loves</i> kids, as it turns out.");
	output("\n\nYour cousin can have the company, as far as you’re concerned. You’re right where you belong.");
	badEnd();
}

public function pumpkingApproach():void
{
	clearOutput();
	showName("\nPUMP-KING");
	showBust("PUMPKING");
	author("Franks");
	output("<i>“It’s good to see you, interloper.”</i> the pumpkin-helmed woman intones, <i>“I see your skills are real, but fear I’ll never feel.”</i> she adds, standing and beginning to slowly circle you. <i>“It seems Johr is no more. You come now to my door, to banish me forevermore. Still... defeating you will be a </i>bore<i>,”</i> she finishes, theatrically drawing the black sword at her hip and advancing on you. The zil guard on duty begin advancing as well, only to stop in their tracks as the jack o’ lantern wearing warrior raises her hand, palm out.");
	output("\n\n<i>“Do you take me for a craven, or heart black as a raven? If [pc.heShe] and I must fight, I’d sooner do it right,”</i> she says, advancing on you with frightening speed.");

	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(new PumpKing());
	CombatManager.victoryScene(defeatThePumpKing);
	CombatManager.lossScene(loseToPumpking);
	CombatManager.displayLocation("PUMP-KING");
	
	clearMenu();
	addButton(0,"Next",CombatManager.beginCombat);
}


public function loseToPumpking():void
{
	showName("\nPUMP-KING");
	showBust("PUMPKING_NUDE");
	author("Franks");
	output("As you collapse under the weight of the pumpkin-headed woman’s assault she struts up to you, laughing haughtily. <i>“You thought you could beat me. Now you’ll have to eat me,”</i> she says, sheathing her weapon before turning to her zil.");
	output("\n\n<i>“<b>Guards</b>!”</i> she shouts imperiously, handing her shield off to the first guard to reach her. <i>“My armor, if you would.”</i>");
	output("\n\nThe zil quickly begin to work the straps on her plate free, removing each piece of her armor and carrying it off to parts unknown until finally, the only thing left is that ridiculous pumpkin head she’s wearing. She removes that herself, lifting it slowly over her head before handing it off to one of her guards, a long braid of orange hair falling behind her head as she flashes you a cocky, supremely confident smile. She’s pretty damn good looking under that ridiculous pumpkin helmet, actually. Before you stands a human woman with big, bright blue eyes framed by artfully messy bangs, pearly, perfect teeth, healthy-looking porcelain skin, just the right amount of freckles on her cheeks... and the carpet matches the drapes, as you can clearly see when she hooks her thumbs into the simple black sweatpants pants she was wearing under her armor, yanking them and her panties down to her ankles in one smooth motion.");
	output("\n\nHer twat is completely unshaven, a healthy bush of carrot-colored hair covering it - one that you’re about to become all too familiar with, it seems. She reaches out and grips one of your [pc.ears] between a thumb and forefinger, yanking your head forward and guiding your face into her crotch. Soon enough your entire field of vision is orange, your [pc.tongue] questing obediently forth into the wet, warm depths of your new <i>“king”</i>.");
	output("\n\n<i>“Look at you. The perfect pet? Maybe not quite, but we’ll tame you yet,”</i> she coos as your mouth is filled with the heady, sweet taste of her juices. Is she going to rhyme the entire time... oh god, now you’re doing it too. Still, without the helmet her voice is... lilting, smooth... why was she covering it up, you wonder? Well, that doesn’t matter. You guide your tongue up and down her slit a few times, earning a sweet moan before you wrap your lips around her clit and give the little nub a good suckle, and - oh, she likes that. Her hands move to either side of your head and she pulls your face in further, smothering you in soft orange bush and wet cunt. Encouraged, you begin to place your hands on her freckled thighs, only to have her slap them down, her voice shaky as she scolds you. <i>“No. Bad [pc.boyGirl]. Hands behind your back, <b>now</b>,”</i> she commands. You comply, of course, earning a pat on the head as she continues to let you eat her out.");
	output("\n\nShe guides you along the way to her orgasm sternly, cuffing you upside the head whenever you do something she doesn’t like, patting you affectionately whenever you get something right. Eventually you can feel her thighs shaking slightly around your head, happy moans and whimpers coming freely from the domineering woman above you. Another push, another lick... you guide your weary tongue over her clit again, slurping away at her folds until she cums on your face, juices filling your mouth suddenly as the red-haired monarch tenses bodily and <i>howls</i>. Looking up, you can see her breasts shuddering under her tank-top as her body is wracked with orgasm. Pulling your slick face away from her now glistening bush, she sighs contentedly.");
	output("\n\n<i>“That was excellent. Guards, take this one to my chambers,”</i> she says simply, motioning to the approaching zil, who hoist you up by the arms and drag you through a door directly behind the throne - her chambers, you can only assume. Inside is a roughly carved king-sized bed with a very comfortable looking mattress, which the bee-men swiftly throw you onto, one of them bringing up a collar and chain and securing the collar around your neck. Your arms are then similarly bound behind your back, ensuring that you can do nothing but wait until the Pump-king decides to go to bed.");
	output("\n\nAnd wait...");
	output("\n\nAnd wait...");
	pc.changeLust(50);
	clearMenu();
	addButton(0,"Next",pumpkingBadEnd2);
}
public function pumpkingBadEnd2():void
{
	clearOutput();
	showName("\nPUMP-KING");
	showBust("PUMPKING_NUDE");
	author("Franks");
	output("And wait... it seems like eternity, but it’s really closer to five or so hours before your new mistress returns to you, cocky grin on her face, hardlight strapon on her hips. The nature of your relationship is now abundantly clear (as if it wasn’t already). Your first night with the Pump-king leaves you with sore legs, a gaped ass and a new appreciation for her title. Within the first two months of your new life you find yourself wearing a buttplug for easy access, which your carrot-topped mistress takes full advantage of." + (pc.biggestCockLength() >= 8 ? " You could swear she loves the fact that you have a big dick for the simple fact that she can watch it flopping around uselessly every time she fucks you.":""));
	output("\n\nPerhaps most surprisingly, your new mistress uses no aphrodisiacs or obedience drugs on you - she just seems to know the right buttons to push, the right things to say, the right punishments to mete out to steadily mould you into a loyal, obedient fuckhole for her to stuff every time she feels the urge. Some days, she even gives you permission to cum.");
	output("\n\nIt’s a good life.");
	badEnd();
}

public function defeatThePumpKing():void
{
	showName("\nPUMP-KING");
	showBust("PUMPKING");
	author("Franks");
	if(enemy.lust() >= enemy.lustMax()) 
	{
		output("The pump-king collapses, hands scrabbling at her armor as if she’s choking - but no, after a moment you can see that she’s trying to tear it off. She finally has a brainwave and chucks her gauntlets off, the steel handguards clattering to the floor a few yards away. Then her fingers are frantically working at the straps to her armor, undoing it in what must be record time to reveal the white tank-top she’s wearing underneath, and then the black sweatpants under her greaves.");
		output("\n\nThe nearby zil, watching the spectacle, mutter among themselves for a moment - clearly shocked at the sight of their leader behaving like this - and then begin to file out of the throne room with haste, rifles primed in case you try anything.");
		output("\n\nShe looks confused as she sees you hesitating, clearly put out.");
		output("\n\n<i>“I swear to god if you don’t fuck me, I’m gonna... uh... I’ll be really sad!”</i>");
		output("\n\nTruly a fearsome threat.");
	}
	else
	{
		output("As you batter the Pump-king back, she stumbles over her own feet and collapses to one knee, just barely blocking another hammer strike from your [pc.meleeWeapon]. Still, judging by how hard you can hear her breathing, the way she’s clutching her side and barely holding onto her sword, she’s not going to be fighting anymore anytime soon. You walk over to the would-be monarch and raise your [pc.meleeWeapon] threateningly, the pumpkin-helmed lady dropping her sword and raising her hands over her head in response.");
		output("\n\n<i>“W-wait! For truly, you are, uh.. I.. can’t even think of any rhymes.. you win. You win, okay? Just stop hitting me, my head feels like a train hit it.”</i> she moans, dropping her shield. Her elite zil step up, weapons raised, but she stops them with a raised palm. <i>“If [pc.heShe] can beat me, you lot won’t do any better. Save yourselves the hurt. I’m done for. Release the UGC officer, then take your weapons and training back to your tribes,”</i> she says, her weariness audible even through the voice-altering effects of her helmet. Hesitantly, the zil step down and begin to file out of one of the side doors of the throne room, keeping their weapons primed in case you try anything. The pump-king slowly raises her arms to her head, gripping the pumpkin helm and tugging it off, setting it off to the side.");
		output("\n\nThe girl under the armor is human with big, bright blue eyes framed by artfully messy orange bangs, pearly, perfect teeth, healthy-looking porcelain skin, and just the right amount of freckles on her cheeks. She looks weary and nervous now though, looking up at you as she waits for you to decide her fate.");
		//[Fuck her] {If PC is herm, each scene has a %50 chance of proccing}
		//[Lock her up]
	}
	clearMenu();
	if(pc.lust() >= 33)
	{
		if(pc.hasGenitals()) addButton(0,"Fuck Her",fuckThePumpKing,undefined,"Fuck Her","Get some sexual satisfaction out of this lunatic.");
		else addDisabledButton(0,"Fuck Her","Fuck Her","You’ll need some genitals to do this.");
	}
	else addDisabledButton(0,"Fuck Her","Fuck Her","You aren’t turned on enough for this.");
	addButton(1,"Lock Her Up",lockUpThatNastyWoman);
}

//Requires genitals :3
public function fuckThePumpKing():void
{
	clearOutput();
	showName("\nPUMP-KING");
	showBust("PUMPKING_NUDE");
	author("Franks");
	output("You toss your weapons to the side and approach the defeated terrorist with lust in your eyes, watching her own sapphire orbs fill with comprehension, then lust of her own.");

	if(enemy.lust() >= enemy.lustMax()) output("\n\n<i>“The conquering hero comes to slake [pc.hisHer] lust? Very well - do what you must,”</i> she purrs, earning a murderous glare from you. She giggles as her hands begin to work at her remaining clothing, her tank-top and sweats coming off to reveal her toned, shapely form. <i>“Alright, I’ll stop. Or maybe I won’t? Maybe I want you good and pissed off so you can properly punish me for being such a naughty girl, mmn?”</i>");
	else output("\n\n<i>“The conquering hero comes to slake [pc.hisHer] lust? Very well - do what you must,”</i> she purrs, earning a murderous glare from you. She giggles as her hands begin to work at the straps to her armor, the heavy plate coming off piece by piece to reveal her toned, shapely form. <i>“Alright, I’ll stop. Or maybe I won’t? Maybe I want you good and pissed off so you can properly punish me for being such a naughty girl, mmn?”</i>");

	if(pc.hasCock() && (!pc.hasVagina() || rand(2) == 0))
	{
		output("\n\nYou growl as you come down on her, shoving her onto her back" + (!pc.isCrotchExposed() ? " and beginning to divest yourself of your own [pc.crotchCovers]":"") + " - the way you’re about to fuck this little tart, she won’t be able to speak coherently, let alone make irritating rhymes every time she opens her mouth. You tell her as much and she sticks her tongue out at you playfully, grinning ear to ear. <i>“So boldly do you speak! My knees are going weak! But I wonder, have you peaked, or will I marvel at your technique? I t-gh!”</i> she says, stopping suddenly as you clamp one hand around her throat and <i>squeeze</i>, using your other hand to toss the last of your gear to the side. She’s in her birthday suit too now, firm D-cups bare along with the healthy thatch of orange hair covering her pussy. She’s making no move to resist the hand you’ve got around her neck. On the contrary, it only seems to turn her on more, the pumpkin-loving vixen’s cheeks flushing bright red, her chest rising and falling rapidly.");
		output("\n\nWithout further ado you position the head of your [pc.cock] at the entrance of her cunt, parting the soft, curly hairs and pushing inside with contemptuous ease - she’s <i>very</i> wet. Her insides are like a glove around your member, the redheaded woman (who is a good deal smaller without her armor) rolling her hips up to meet you eagerly, her toned, freckled arms pulling your wrist away from her throat with frightening strength considering the beating she just took. <i>“I’ve got to breathe a bit, hero. You can choke me again in a minute, mmkay?”</i> she purrs, patting your head as your prick reaches the halfway point in her twat. So even now, she’s going to try to be in control...? Well, okay then.");
		output("\n\nYou ram your hips forward suddenly, earning a gasp from the little hellraiser under you. She writhes and places a hand on your [pc.chest], grabbing a nipple and tweaking it roughly before sliding her hand up to grab " + (pc.hairLength >= 4 ? "a fistful of your hair":"the back of your head") + " and pull you down for a fierce, tongue-filled makeout session that lasts almost half a minute. You’re still pounding her cunt in the meantime, the wet sound of bodies slapping against each other filling the throne room as she reaches the hand not holding your " + (pc.hasHair() ? "hair":"head") + " down to rake her nails down your back. The feeling of her nails scoring your flesh and the stripes on your [pc.skin] are only fuel for the inferno of lust burning through you now, one your partner is clearly feeling too, if the way she’s writhing and grinding into you is any indicator. Still, the battle for dominance rages on alongside it, the would-be queen finally breaking her lips from yours and patting the top of your head gently.");
		pc.cockChange();
		output("\n\n<i>“You’re okay at this, hero. But I never did catch your name...”</i> she says, another sweet moan escaping her mouth as you slam your [pc.cock] in to the hilt again.");
		output("\n\n <i>“Steele.”</i> you husk. <i>“[pc.name] Steele. Say it.”</i> you order her, growling into her ear.");
		output("\n\n<i>“Make me, if you’re [pc.manWoman] enough,”</i> she whispers back, catching your [pc.ear] in her teeth and tugging it down before releasing it. Oh, it’s on now. You redouble your pounding, luxuriating in the sensation of your vanquished foe’s warm pink insides squeezing your [pc.cock] from all sides like a wet, tight glove. The orange-haired woman beneath you is letting out a string of shameless moans, whimpers and cries for you to go harder, faster, and you’re beginning to think her whole cheeky, defiant act was a ploy to get you to fuck her brains out - so you stop, right when you sense that she’s on the cusp of orgasm. It takes a great deal of restraint not to keep railing her when her sapphire eyes fix indignantly on yours, but you manage, somehow.");
		output("\n\n<i>“Beg. Say my name, and beg for me to keep fucking you,”</i> you say, smirking. She looks ready to slap you for a moment, and then an evil grin crosses her face and her cunt tightens around your girth of it’s own accord, drawing an involuntary, surprised groan from your [pc.lipsChaste].");
		output("\n\n<i>“Two can play at this game, buddy. </i>You<i> beg,”</i> she says, leaning in to bite your neck. Still, despite her chutzpah you can tell how badly she wants this simply by how hard she’s trying to provoke you into rutting her like a mindless animal. Despite the continuing game of sexual chicken the two of you are playing, you only need to look at her flushed face and the <i>need</i> mixed with the defiance in her eyes to know you’re not losing this battle. She sinks her teeth deeper into your neck and you reach up to tweak one of her pebbly pink nipples in response, groping her freckled breast as a follow-up.");
		output("\n\nHer back arches into your [pc.chest] in reply, and you catch a strangled <i>“Fucking <b>Steele</b>-”</i> before she goes suspiciously quiet, her labored breathing the only noise now between the two of you.");
		output("\n\n<i>“<b>Beg,</b>”</i> you hiss into her ear again, and she whines pitifully in response before speaking.");
		output("\n\n<i>“I... please... fuck me. [pc.name] Steele, please insert your penis into my vagina and commence reproductive rituals until both parties achieve a favorable series of physical sensations as a result,”</i> she says obstinately, prompting you to grab the long red braid hanging off the back of her head and <i>yank</i> it so hard her pretty head bounces off the wooden floor. <i>“<b>BEG,</b>”</i> you order a last time, and she does, for real this time.");
		output("\n\n<i>“Fuck you, Steele! Fuck me, please fuck me, you win you stupid " + pc.mf("bastard","bitch") + " now please <b>FUCK ME PLEASE FUCK ME I NEED IT!</b>”</i> she howls, nails clawing across your back as she presses her ample bust into your [pc.chest], her melons squishing delightfully against your flesh. It doesn’t take long after that, just a few moments of blissful, frenzied pounding before you feel yourself reach the point of no return, your [pc.cum] surging up your [pc.cock] and into the dark, warm, clenching depths of the woman under you. You feel her tighten around you, feel her insides contracting wildly around you, feel her body stiffen as her legs wrap around your [pc.hips]. She looks up at you with a dazed, confused expression on her face, eyes slightly unfocused as you slowly disentangle yourself from her and get up.");
		output("\n\n<i>“Fuck, man.”</i> she mumbles as she closes her legs and rolls over to her side. <i>“If I’d known we were gonna bang like that, I’d have skipped the fighting.”</i>");
	}
	else
	{
		output("\n\nYou growl as you come down on her, shoving her onto her back" + (!pc.isCrotchExposed() ? " and beginning to divest yourself of your own [pc.gear]":"") + " - the way you’re about to fuck this little tart, she won’t be able to speak coherently, let alone make irritating rhymes every time she opens her mouth. You tell her as much and she sticks her tongue out at you playfully, grinning ear to ear. <i>“So boldly do you speak! My knees are going weak! But I wonder, have you peaked, or will I marvel at your technique? I t-gh!”</i> she says, stopping suddenly as you clamp one hand around her throat and <i>squeeze</i>, using your other hand to toss the last of your gear to the side. She’s in her birthday suit too now, firm D-cups bare along with the healthy thatch of orange hair covering her pussy. She’s making no move to resist the hand you’ve got around her neck. On the contrary, it only seems to turn her on more, the pumpkin-loving vixen’s cheeks flushing bright red, her freckle-dappled chest rising and falling rapidly.");
		output("\n\nYou climb atop her then and position yourself in a 69, your cunt hovering over her face without quite touching it while your face hovers over her bush, again without quite touching it. <i>“Eat up, carrot-top.”</i> you say teasingly, lowering your face to kiss her navel, laying a slow lick down under it and smirking as she shudders bodily in response. <i>“If I like it enough, you just might get something back.”</i> you add. She opens her mouth, some sharp-tongued reply undoubtedly ready to spring from her lips - only it never does, because you fill her mouth with your [pc.cunt] before she can form the words. You hear - and feel her angrily protesting her new position, but the fact that her face is being shoved into your ladyparts means the vibrations her speech make are one more source of pleasure for you.");
		output("\n\nShe picks up on this quickly enough, sullenly trying to pull her face away from your cooch (and failing miserably) until you bring your forefinger and middle finger up to her own fuckhole, teasing her clitoris expertly with your digits, giving the rebellious ginger a taste of what she could be getting - if she does what you want. You continue just long enough for her to get into it, making sure your twat isn’t covering her nose, and then you stop. She finally wriggles her face out from under your [pc.cunt], gasping for air briefly before firing off a question.");
		output("\n\n<i>“Why the hell’d you stop?”</i> she asks accusingly, shivering as your warm breath caresses her loins.");
		output("\n\n<i>“Because you’re not listening. I told you to eat cunt. This isn’t a free ride, you know.”</i> you reply dryly, earning an annoyed <i>harrumph</i> from the girl under you. <i>“Fine.”</i> she huffs. <i>“But if I make you cum first, you have to join my army.”</i> she adds, right before burying her face in your crotch again. You open your mouth to point out that you never agreed to this deal - not to mention the fact that she’s in no position to bargain - but a low, happy moan comes out instead as your foe’s tongue glides over your [pc.clit], the human girl eating your [pc.cunt] with gusto all of a sudden. Well, you’re certainly not going to complain. Instead, you direct your attention to her box, gliding your fingers over her clit again, bringing another round of sweet moans vibrating through your nethers.");
		output("\n\nShe answers that by sliding her hands up to your [pc.ass], each palm gripping a cheek and kneading them roughly before she slides her right hand between your cheeks, her index finger pressing insistently against your asshole. You can’t stifle a whimper as it slips in, the sensation adding to the already amazing feeling of her mouth working your clit. Meanwhile, your own fingers are busy at her cunt, pushing inside in a quest for her g-spot, twisting and diving this way and that even as your tongue savages her clit - you know you’ve found it when you feel her body tense up suddenly, the redhead letting out a loud, adorable squeal as you throw her ever closer to orgasm. But that won’t do - you still have to cum! You sit up on the ginger’s face, bringing your lips away from her cunt and rocking your hips back and forth on her face, filling her vision with your [pc.ass]. You even help her along by sending your hand down to play with your button while her tongue probes into your [pc.cunt], and sure enough..");
		output("\n\nA few moments later, you feel your orgasm building, but out of sheer pride and competitive spirit you restrain yourself for now, instead pushing your still-slick fingers back into her cunt, gently probing for her g-spot again. Seeming to sense your intention, the blue-eyed hellraiser redoubles her assault on your loins, her hungry slurping echoing off the walls of her own throne room. For a brief moment, you’re afraid she might win your little contest after all, though she’s even nuttier than you thought if she thinks she’s getting you to join her...");
		output("\n\nIt never comes to that, though. Just as you feel yourself reaching the point of no return, your fingers find her elusive sweet spot once again - you attack the sensitive area ruthlessly, sending her crashing over the brink with you as the edges of your vision seem to go white. The two of you have an impromptu wrestling match as you cum your collective brains out, scratching, groping, biting and kissing every part of each other you can reach until you’re a sweaty mess of sexually exhausted flesh on the floor. Well, that was something else entirely...");
		output("\n\nYou’re the first to disentangle yourself, of course; you’ve been through too much trouble capturing this woman to give her a chance to escape now - but damn it all, <i>what</i> a woman! She rolls onto her side as you loom over her prone form, trying desperately to catch her breath.");
	}
	processTime(30);
	pc.orgasm();
	IncrementFlag("PUMPKING_FUCKED");
	clearMenu();
	addButton(0,"Next",lockUpThatNastyWoman);
}

public function lockUpThatNastyWoman():void
{
	clearOutput();
	showName("\nPUMP-KING");
	showBust("PUMPKING");
	author("Franks");
	output("You’ve defeated this troublemaking woman and everything she could throw at you. Now you radio into Esbeth, only to be put on hold for a few irritating minutes until Officer Trent’s shaky stutter greets you on the other side.");
	output("\n\n<i>“[pc.name]? S-steele?”</i> she says, voice crackling thanks to the interference of the jungle. You confirm your identity and inform her that she needs to come pick up the ‘Pump-king’ and search the jungle for Officer Inoue. She doesn’t respond for a moment, during which you hear her talking to someone in the background who happens to sound very familiar...");
	output("\n\n<i>“Actually, uh. Officer Inoue c-came back! Well. Some zil dropped her off at the border to town. She’s not even hurt a l-little bit! Just smells like honey for some reason. She’s taking a shower now, s-so I’ll head out myself. Everything is s-safe now, right? I-I’ll be out soon.”</i>");
	output("\n\nTrue to her word, the nerve-wracked officer is with you in just over an hour, clad in full riot gear and clutching a rifle with shaking hands. Poor woman, it must’ve taken every bit of courage in her body to come out here alone like this. You drag the bound miscreant you were sent here to apprehend out of the castle and haul her onto the hoverbird Lana arrived in, assuring her that you’ll be with her the entire ride back. That puts a smile on the blonde’s face, clearly visible under the safety visor of her helmet.");
	output("\n\n<i>“T-thanks. You’re a hero. S-steele. If it hadn’t been for you, well...”</i> she gulps and says nothing as the bird takes off, ferrying you both back to the safety of Esbeth.");
	currentLocation = "SOUTH ESBETH 3";
	processTime(20);
	output("\n\nThe ‘Pump-king’(or ‘Amelia’, as you find out her <i>real</i> name is once she’s ID’d) is swiftly arraigned and consigned to the most secure cell in Esbeth to await transportation off planet for trial. Penny, none the worse for wear despite the fact that she’s probably going to be leaking zil jizz for at least a week, swiftly resumes her " + (pennyIsCumSlut() || flags["PENNY_BADGER_BIMBO"] != undefined ? "‘duties’":"duties") + " and Lana Trent returns to her beloved desk duty, far away from any real danger and extremely happy about it. You have to admit this was one of the stranger adventures you’ve had... but at least you got some sweet armor out of it.");
	output("\n\n");
	flags["PUMPKING_COMPLETION"] = 3;
	variableRoomUpdateCheck();
	CombatManager.genericVictory();
}
