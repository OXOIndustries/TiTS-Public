// By Franks

//PC gets accidentally invited to UGC Christmas party
//Gets to watch Riya and Grence get shitfaced and bang
//Ain’t no partie like a UGC partie cause’ a UGC partie don’t stop

// {PC receives email around Christmas, no level requirement}From: Commander Lorna Grence<Lorna_Grence@UGC.gov>
//To: [pc.name] Steele<[pc.email]@SteeleTech.corp>
//Subject: Christmas Party Invitation

public function riyaXmasPartyInviteText():String
{
	return "It’s that time of year again, folks! The annual Tavros UGC detachment Christmas party will be held on flight deck #4. Be there or be square!\n\n\tP.S. Officer Ivanovsky is hereby politely but firmly asked not to bring fireworks to this year’s festivities. Bags and pockets will be checked at the door.\n\tP.P.S. Could Sergeant Conar please bring an extra plate of those bone-shaped cookies from last year? They were to die for. :3\n\tP.P.P.S. Officer Traylio is limited to one REASONABLY SIZED alcoholic beverage.\n\tP.P.P.P.S. Lieutenant Batra will refrain from explaining why ‘celebrating human holidays objectively demonstrates human superiority’ or so help me God.\n\n(<b>Holiday Event unlocked! Access through the Tavros Station elevator floor selection menu.</b>)";
}

//Entering party(Should be accessible as a destination(( [Party] )) on the Tavros elevator):
public function riyaPartyLiftGo():void
{
	liftMove("RIYAPARTY");
	
	clearMenu();
	addButton(0,"Next",party2018RiyaEntrance);
}
public function party2018RiyaEntrance():void
{
	clearOutput();
	author("Franks");
	showName("\nPARTY!");
	//Store that you've partied, and what year, in case we wanna tack shit on later.
	flags["RIYA_PARTIED_YEAR"] = new Date().fullYear;
	output("As the elevator doors open onto deck #4, you see a tall, muscular blonde ausar man in UGC uniform standing at the end of the hallway, rummaging through the pockets of a human male with midnight hair and blue eyes. The blonde continues searching his comrade for a moment before stopping, seemingly satisfied. <i>“Sorry, Ivan. Commander personally ordered me to search you. Said you almost caused a hull breach with that stunt last year,”</i> he says, stepping aside to allow his fellow officer entry. The shorter man huffs and enters without argument.");
	output("\n\nFiguring you might as well (you were invited, after all), you stride up to the hangar door and try to enter, only to have the doorman plant himself squarely in your path. <i>“You’re not one of us,”</i> he says simply, looking suspiciously at you. <i>“We do allow civilians into the party, but only by invitation. I’ll need to see one before I can let you in. Unless you have a chaperone coming?”</i> he says, planting his hands firmly on his hips.");
	processTime(5);
	clearMenu();
	addButton(0,"Email",giveBouncerEmailInvite,undefined,"Email","Show him the invitation you were emailed.");
	addButton(1,"Seduce",seduceTheBouncerAtRiyaParty,undefined,"Seduce","Ply your " + pc.mf("manly","womanly") + " charms against him. You could just show him your invite, but where’s the fun in that?");
}

//If PC selects ‘Email’
public function giveBouncerEmailInvite():void
{
	clearOutput();
	showName("USE\nEMAIL");
	author("Franks");
	output("Well as luck would have it, you <i>do</i> have an email. Retrieving your codex you show the man your invitation, at which point he nods once and steps out of your way, gesturing into the hangar. <i>“Thanks. Enjoy the party.”</i>");
	output("\n\n<i>“‘Will do!”</i>’ you reply as you enter the hangar.");
	processTime(2);
	clearMenu();
	addButton(0,"Next",enterTheParty2018RiyaShit);
}

//PC selects ‘Seduce’
public function seduceTheBouncerAtRiyaParty():void
{
	clearOutput();
	showName("\nSEDUCING...");
	author("Franks");
	output("Yeah, you could just show your invite. If you were a <i>loser</i>. But you’re not, and this way is way more fun.");
	output("\n\nYou lean seductively against the bulkhead, [pc.eyes] smouldering as they bore into the officer’s baby blues. <i>“I think there’s been a misunderstanding, officer,”</i> you purr, right hand sliding up your [pc.stomach]. <i>“I don’t need an invitation to the party - I </i>am<i> the party. And if you let me through, the two of us can have a </i>private<i> party,”</i> you continue, brushing your hand up his chest now, towards his chin. It’s almost there when his right hand snaps out in a flash to grab your wrist. Not expecting violence (or the speed with which his hand moves), you can only grimace as he twists it painfully, eyes boring into yours. Belatedly, you catch the gleam of a wedding band on his left ring finger.");
	output("\n\n<i>“Put your hands on me again and I’ll break them,”</i> he says flatly before releasing you, nostrils flaring. <i>“Show an invitation or get out.”</i>");
	output("\n\nWhat an amiable fellow. Still, this isn’t a battle you’re going to win. Even if you do manage to beat this guy, most of the UGC officers on Tavros (the ones who didn’t pull holiday duty, anyway) are at this party, and you somehow doubt they’d take kindly to violence against one of their own. Sighing, you present Officer Buzzkill with your invitation, at which point he waves you in, wishing you a good evening.");
	processTime(4);
	clearMenu();
	addButton(0,"Next",enterTheParty2018RiyaShit);
}

public function enterTheParty2018RiyaShit():void
{
	clearOutput();
	showName("THE\nPARTY");
	output("The massive blast doors leading to outer space have been closed and locked in place, and the inside of the hangar is looking lively already; beings of just about every race known to the galaxy are hanging out within in street clothes, clustered around tables and couches. Whoever set this up went the whole nine yards - there are gaming consoles set up on various tables surrounded by partygoers excitedly placing bets on each other’s digital victories in one area of the hangar. Another section has alcoholic punch set up next to a dartboard, a potentially hilarious (or dangerous) combination. Yet another corner has a Kaithrit woman clad in a bikini wrestling a similarly clad Dzaan... in a large kiddie pool filled with mud. Or actually, judging by the way the Kaithrit is licking it off her lips, liquid chocolate? There is a small table nearby where the large crowd watching them tussle is, of course, taking bets.");
	output("\n\nAnd in the center of the room is a positively massive Christmas tree, it’s tip almost brushing the hangar ceiling, ornaments of all shapes and colors covering its branches. You can only imagine how they got a tree that size in here as red, green and white lights flicker merrily on and off all across the tree, and... presents? A closer look reveals that yes, there are indeed gaily wrapped packages under the tree, a pile so large as to fit the gargantuan plant they’re under perfectly.");
	output("\n\nOnce again, you can’t help but think that whoever set this up went all out.");
	output("\n\nAs you admire the effort the party’s organizers evidently put into it, you see some movement at the left side of the room - ");
	//If PC has met Grence:
	if(flags["MET_GRENCE"] != undefined) output("Commander Grence, with a nametag that says ‘Santa Grence’");
	else output("a gold-maned ausar woman with a nametag that says ‘Santa Grence’");
	output(" is sitting atop a sleigh, wearing a Santa costume complete with giant, fluffy white beard (fake, you hope). A human woman and ausar man are dragging the sleigh via ropes slung over their shoulders, fake antlers and red light-up noses gracing their heads as they pull. How she roped them into that, you can’t imagine. Bipedal reindeer aside, the blonde stands up in the sleigh, stroking her glorious beard thoughtfully before speaking, blue eyes sparkling.");
	output("\n\n<i>“<b>HO, HO, HO!</b>”</i> the ausar woman booms, her cheery, artificially enhanced voice filling the hangar easily. <i>“Commander Grence is here to welcome you all to the ninth annual Tavros Detachment Christmas party!”</i> the commander says happily, tail whapping an unsuspecting bystander upside the head as it wags furiously back and forth. <i>“First things first - </i>presents<i>!”</i> she says, gesturing broadly to the pile of gifts behind her. <i>“Step forward and receive your secret santa gifts! Come one, come all!”</i> she calls, hopping off the sleigh and making a beeline for the eggnog. The partygoers crowd around and snatch up boxes, searching for their names and trading them around as necessary. You wonder idly if whoever decided to invite you got you anything... assuming the invitation was even intentional.");
	output("\n\nA minute passes, filled with exclamations of joy and general drunken hubbub, before you see " + (flags["MET_RIYA"] != undefined ? "Riya":"a tall, dark-skinned human woman") + " looking <i>quite</i> cross as she looks at the contents of the present she’s just opened. <i>“Ah, what the shit!”</i> she proclaims, looking around accusingly. <i>“Who gave me a fucking lump of coal!?”</i>");
	output("\n\nGrence says nothing, but a smug grin spreads itself across her features and her tail wags just a bit faster.");
	output("\n\nIt takes a surprisingly short amount of time for the enormous pile of gifts to be handed out, but soon enough all that remains is a sea of gaudy wrapping paper and a gaggle of increasingly drunk revelers. Perhaps more surprisingly though, you can see that ‘Santa Grence’ has already had more than her fill of eggnog. She’s weaving her way back to the crowd, munching on a bone-shaped cookie in between sips of eggnog. And there in the middle of the drunk guests... is Riya, busily and drunkenly explaining to her comrades that yes, celebrating Christmas really <i>does</i> mean they’re admitting on some level that human celebrations are superior.");
	output("\n\nNobody is really paying her any mind, and multiple conversations are drowning out her drunken rambling, but ‘Santa Grence’ is staring right at her, her sensitive ears pointed directly at the human and no doubt clearly hearing every word she says. Worse still, the Commander is now making a beeline straight for the Lieutenant...");
	output("\n\nWell, this is one trainwreck you’ll be damned if you miss. You grab a cookie and a glass of punch and meander over just as Grence reaches her target. You can’t hear everything the inebriated ausar is saying, but it sounds an awful lot like she’s going off on " + (flags["MET_RIYA"] != undefined ? "Riya":"the dusky human woman") + ", who is yelling right back. Several other officers are gathering around and there are growing murmurs about tossing them in the pool... but before anything can happen, Grence has Riya " + (flags["MET_RIYA"] == undefined ? "(at least that’s what the blonde ausar is calling her) ":"") + "firmly by the ear and is dragging her away, yelling something about going to her office while the crowd goes wild with laughter.");
	output("\n\nRiya, meanwhile, is doing some yelling of her own.");
	output("\n\n<i>“I DIDN’T ASK TO BE THIS BEAUTIFUL!”</i> the drunken cop proclaims to a mixed chorus of laughter and groaning. <i>“YOU THINK I CHOSE THIS MOCHA HUE OF PERFECTION!? AND THIS THING?”</i> she says, shamelessly grabbing her crotch. <i>“IT’S HARD TO BE HUMBLE WHEN YOU’RE THE ARCHETYPE OF GORGEOUS!”</i>");
	processTime(30);
	clearMenu();
	addButton(0,"Follow",followRiyaPartyStuff);
	addButton(1,"Stay",stayAtPartyWhileGrenceAndRiyaBone);
}

//If PC chooses ‘Follow’
public function followRiyaPartyStuff():void
{
	clearOutput();
	showBust("RIYA","GRENCE");
	showName("RIYA\n& GRENCE");
	author("Franks");
	output("’Santa Grence’ is taking Riya up to her office... but in her drunken state, they only make it to the hangar security office. You poke your head around a corner, noting suddenly that all the cameras are all blacked out... are they supposed to be partying in here? Well then. Broken regulations aside, you’d really like to find out what these two are getting up to... or maybe you just want to watch Grence ripping Riya a new asshole. Either way, it’s a good thing they’re both wasted - neither of them seems to notice you tailing them as the Commander plops down in one of the office’s spinning chairs, her fingers steepled and her ears flat against her skull.");
	output("\n\nRiya seems to be picking up on her boss’ mood; she’s taken on a more serious face, and her arms are at her sides, her gaze fixed on the Commander’s.");
	output("\n\n<i>“Are you illiterate, Riya?”</i> the Ausar starts, tilting her head to the side a bit drunkenly. Riya opens her mouth to respond, but but before she can say anything Grence cuts her off. <i>“I’m pretty drunk, but I know damn well I sent out a mass email. And I’m pretty sure that email specifically asked <i>you</i> to refrain from your usual bullshit for the party. But after you got your coal - that was me, by the way - what did I hear? I wasn’t expecting you to give a speech about how much you love diversity. But I also wasn’t expecting you to blatantly disregard my authority. But maybe there’s a reason for it...”</i> she says, leaning forward in her seat. <i>“Are you illiterate? Did you hear about the party by word of mouth?”</i>");
	output("\n\nRiya, looking <i>quite</i> nettled, shakes her head. <i>“No, ma’am. I read the email like everyone else.”</i>");
	output("\n\nGrence seems to become visibly more angry at that, her fluffy blonde ears swiveling up off her skull and forward to face Riya. <i>“Oh. So you read the part where I SPECIFICALLY ASKED YOU NOT TO BE AN ASSHOLE AT THE PARTY, AND YOU </i>FUCKING IGNORED ME!<i>”</i> she snarls, slapping her hands down on her thighs. Her voice is surprisingly, well... <i>loud</i>. Especially for such a physically unintimidating woman. And the look in her eyes... if you were a betting [pc.manWoman], you’d say Riya looks impressed. Then the look on Grence’s face softens, and she sighs heavily.");
	output("\n\n<i>“Why do you do this? I mean, you’re not a bad officer on paper. You don’t discriminate when you arrest people, you </i>surprisingly<i> actually arrest more humans than nonhumans, and...”</i> perhaps unwisely, Riya takes this opportunity to butt in.");
	output("\n\n<i>“Well, there’s also way more humans on station than all the other races combined,”</i> she says, shifting her neck to one side, cracking it loudly, then repeating the process with the other side.");
	output("\n\nGrence grunts in clear frustration. <i>“You know damn well what I mean. If you didn’t act like such a jackass, everyone would love you. We could...”</i> her cheeks flush soft pink as she trails off, and Riya’s jaw drops open.");
	output("\n\n<i>“Hooooooooohmygod. You </i>like<i> me. You wish I wasn’t such an asshole because you </i>like<i> me,”</i> the human woman says in shock, an infuriatingly smug grin spreading across her dusky features not long after. <i>“You’ve got the hots for me, and you’re too drunk to hide it right now,”</i> she says, hands sliding up to rest on her hips, and... are her pants bulging?");
	output("\n\nGrence seems to notice too, because her face goes studiously blank for a moment, followed by her ears twitching and her gaze averting to the ceiling. <i>“Stop that,”</i> she growls, cheeks turning from pink to beet red.");
	output("\n\nRiya pays no mind, of course. <i>“So... you like it </i>ruff<i>, I take it?”</i> She quips as she takes a step forward, not <i>quite</i> intruding on the ausar’s personal space but coming awfully close... and Grence reacts.");
	output("\n\nQuicker than you would’ve thought the fluffy gold dame could move she’s grabbed Riya by the collar and shoved her up against a bulkhead, ears pinning back against her skull as her teeth bare themselves in a snarl. <i>“Who the fuck do you think you are, Lieutenant?”</i> she hisses, bright blue eyes boring into Riya’s deep brown. <i>“You think I’m gonna bend over for you like some low-rent slut? Here’s the deal, </i>pal<i>; I’m your fucking boss. End of story. And yes, God only knows why, but I do </i>like<i> you." + (flags["RIYA_QUEST_RESULT"] == 1 ? ".. especially after you saved my ass with those pirates.":"") + " But if we’re doing something, we’re doing it </i>my<i> way. Got it?”</i> she says, releasing the human woman and stepping back, arms crossed over her chest.");
	processTime(10);
	clearMenu();
	addButton(0,"Next",riyaGrenceFuckaboo);
}

public function riyaGrenceFuckaboo():void
{
	clearOutput();
	showBust("RIYA_NUDE","GRENCE_NUDE");
	showName("RIYA\n& GRENCE");
	author("Franks");
	output("Riya looks... intrigued, and tempted. If you had to guess, you’d say it’s been a while since someone has stepped to her like this, at least in an intimate setting... she’s clearly considering it, but Lorna doesn’t seem to be in a patient mood just this moment. She steadies herself, undoes her belt, and looks at the other officer coolly as she speaks. <i>“On your knees and get over here.”</i>");
	output("\n\nShe’s shimmying out of the pants of her Santa costume now, grunting as she lifts her legs up and works her bottoms over her knees one at a time... and Riya, surprisingly, is playing ball. She drops onto her knees and makes her way over to the seated Ausar, the blonde snatching the santa cap off her fluffy head and dropping it on Riya’s as her tail starts to slowly wag behind her. Her thighs are firm-looking and pale as milk, an inviting, glistening pink slit nestled between them. Riya wastes no time pressing her face into it, the Commander letting out a sweet, lustful moan as the Lieutenant begins to eat her, her head obscuring your view. <i>“I didn’t... s-say you could </i>staaaarrrrrt!<i>!”</i> she squeals as her dusky lover hits a sweet spot, beginning to push the high-ranked pup back, towards the seat she vacated earlier. Riya’s hands are sliding up the other woman’s thighs towards her ass when Lorna seems to sense that she’s losing control.");
	output("\n\nShe grabs Riya by the hair with both hands, yanking the human woman back, away from her now-glistening snatch and throwing her onto her back. <i>“That was a close one!”</i> the ausar babe chirps, wasting no time straddling her subordinate’s head and seating herself on her face. <i>“Little bit more and you would’ve had me, huh? But,”</i> she says, wiggling her butt a little on Riya’s face, <i>“no dice. Now eat that ausar cunt.”</i>");
	output("\n\nJudging by the resurgence of squealing and moaning from Grence and the lack of resistance from Riya, it seems like she’s getting her wish. Of course, Riya isn’t just passively eating the bossy pup out - her left hand is moving around the blonde’s back again, scooping up a handful of juicy, lily-white butt and kneading it roughly. Her right hand, meanwhile, is busily undoing her belt, ripping it off and tossing it to the side. She starts on her pants after that, wiggling her hips from side to side until the stubborn garment finally slides off, underwear and all. Her prick springs forth, throbbing and already hard as a rock, her natural musk starting to waft through the room. Grence takes notice pretty quickly; her ears begin swiveling back and forth, as if searching for something, and her sensitive nose twitches as she takes in the scent.");
	output("\n\nIt only makes her ride Riya’s face harder for the nonce, though; the mocha shemale seems to be eating her boss out with gusto, her left hand slapping the ausar’s ass hard enough that it ripples while her right slowly pumps her turgid shaft. Lorna, apparently no longer able to resist, finally slows her roll, sitting still on Riya’s face for a moment, twitching ominously... and her ears and tail suddenly go stiff, her legs quaking as her mouth opens wide to let a sweet, clear howl issue forth as she creams the human’s face. She shifts back after that, giving Riya room to gasp and suck down air.");
	output("\n\n<i>“You good, el-tee?”</i> the gold-maned ausar says teasingly, running her fingers through her human partner’s hair. Riya simply throws both of her thumbs up in response, too busy licking her lips to talk. Grence laughs at that, drunkenly shifting back as her ears twitch in anticipation, positioning her thoroughly soaked cunt over Riya’s belly, setting herself down on her knees. <i>“Now... tell me how much you love ausar pussy and I </i>might<i> give you some,”</i> she says, smirking wickedly. Riya looks briefly irritated, but regains herself in short order.");
	output("\n\n<i>“Of coursh I love ausar pussy, Commander!”</i> the shemale slurs back with deceptive cheerfulness. She starts to pull her t-shirt over her head but becomes frustrated halfway through, likely due to her advanced state of inebriation. Instead, she pulls the shirt a few more times, fingers slipping as her bust jiggles within the confines of the black sports bra she’s wearing... and then she simply rips the garment asunder, her powerful muscles barely even flexing as she does so. Her bra is predictably the next to go as the terran does a crunch and reaches behind her back, and Grence is following suit, yanking the remaining top half of her santa costume open and shrugging herself out of it to reveal the lacy pink bra she’s wearing under it. Her hands fly behind her back as well, and moments later two pairs of round, firm, full tits are bouncing free.");
	output("\n\nLorna leans forward, her milk-pale bosom molding into Riya’s coffee-colored bust. She shifts her hips, positioning her wet, ready slit over Riya’s cock now. <i>“Mmmnnsay it again,”</i> the drunken pup mumbles, her tail wagging lazily behind her.");
	output("\n\nRiya smiles. Then she reaches up, grabs Grence’s hips, and pulls the suddenly-squealing ausar down on her cock, groping and kneading her asscheeks roughly as she starts to thrust up into her. <i>“I fucking <b>love</b> aushar,”</i> she slurs as Grence’s ass jiggles, lewd slapping sounds filling the small room. <i>“I love the big fluffy ears, I love the tails, and I love...”</i> she trails off briefly as she slides her hands up to the ausar’s hips, pushing her up into a sitting position and beginning to play with her tits as Grence reaches for something.");
	output("\n\n<i>“I love making you bark and beg for terran dick,”</i> she says. She stops thrusting abruptly after that, instead sinking her fingers into the squirming ausar’s breasts, pinching both of her pebbled pink nipples between her thumb and index fingers and rolling them. <i>“Bark. Tell me what a good doggy you are and I’ll keep going,”</i> Riya says, her face sliding into an easy, cocky grin. Grence has other plans, however. She’s clearly having a hard time resisting the human shemale’s charms, but resist she does, and you briefly see what she was reaching for - her own panties - before she wads them up and shoves them into Riya’s open mouth just as the dusky woman starts to say something else.");
	output("\n\nHer next move is to grab Riya’s wrists before she can remove the obstruction, guiding them back to her chest and holding them there while she begins to rock back and forth in her lap.");
	output("\n\nThe ausar laughs triumphantly, her tail now swishing back and forth as she starts to bounce on her subordinate’s dick. <i>“Sorry, el-tee, this one’s not going your way. Besides, doesn’t this feel better than having to do all that work? Just lay there and take it,”</i> she coos, leaning forward and cupping Riya’s cheeks, her thumbs sliding over the human’s lips to prevent her from spitting out her balled-up panties. <i>“This is better, right? You get some sweet, wet, </i>tight<i> ausar pussy, and I get to fuck you without having to listen to your verbal diarrhea. Everybody wins! And by everybody, I mean me. Now...”</i> she says, smirking and halting her movements, <i>“my turn to play games. Are you a good girl? Nod yes.”</i>");
	output("\n\nYou see her legs flex, and Riya’s back arches, drawing a giggle out of the drunk ausar as her tail picks up more speed. <i>“Come on, now. Up and down. Nod that you’re a good girl for Lorna.”</i>");
	output("\n\nRiya throws her head to the side, apparently not wanting to look at Grence, you see the ausar girl’s legs flex again... and then Riya’s head is bobbing up and down as she squirms under her ausar lover. Grence responds nearly instantly, jerking her hips as she starts to ride the human again. Riya’s hands start to move on the ausar’s chest, expertly kneading her tits for a good half minute as the pupperslut rides her into the ground, before switching to her nipples again. Seems like Riya has given up on talking smack and is focusing on trying to make Grence cum first; the Commander took her hands off the human’s mouth some time ago, but she still hasn’t bothered to spit out the panties Lorna shoved into her maw.");
	output("\n\nLorna’s hands are planted firmly on her subordinate’s shoulders as she drops her ass down to the hilt on the mocha dickgirl’s prick, grinding her hips in slow circles, whining and moaning loudly as she does so. In fact, Riya is doing a lot of grunting and heavy breathing herself, and the pair of them are glistening with sweat... they must be close, both of them.");
	output("\n\nRiya’s right hand suddenly snaps to her mouth, and Grence looks <i>quite</i> cross, likely assuming her lover is going to start talking trash again... but as her panties go flying, landing perilously close to your <s>hiding spot</s> observation post, she clamps her hand down on the back of Grence’s head and pulls her into a deep, passionate kiss. The effect this has on the fluffy golden ausar is immediate; she jerks visibly, as if electrocuted... and then her tail goes wild, swinging from side to side with such force that it batters into the nearby chair, sending it rolling loudly across the floor and into one of the security consoles, though thankfully it misses any buttons.");
	output("\n\nThe unlikely lovers are both moaning, grunting and whimpering into each other’s mouths now; you see a flash of tongue every few seconds, and Riya is hugging the ausar tight to her chest while Grence has her arms locked around the human’s neck. The human woman is <b>violently</b> jackhammering her hips up into the dog-eared dame’s cunt, giving a final, muffled moan of pleasure before she goes balls-deep and holds herself there, her nuts drawing up close to her shaft as she inseminates her boss. Coffee hands stroke up and down the cream-colored flesh of the ausar’s back, and a small trickle of off-white seed leaks out around the seal of Riya’s cock to dribble off her balls and onto the floor below. Their kiss finally breaks now, the pair of them dripping with sweat and sucking down air as Grence’s tail-wagging wearily slows to a slow wave.");
	output("\n\n<i>“That was...”</i> Grence starts, shivering as Riya’s left hand continues to rub her back, the other wiping the human’s brow, <i>“that was...”</i>");
	output("\n\n<i>“That was fucking incredible,”</i> Riya finishes for her.");

	output("\n\n<i>“Yeah,”</i> the ausar agrees, smiling dumbly. <i>“We can do this again, you know,”</i> she coos, sitting up on Riya’s lap, two pairs of sweat-slick breasts heaving for air even now, <i>“but only if you stay on Santa Grence’s nice list. Now...”</i> she slumps back down, nuzzling her face into the human’s neck, <i>“we </i>should<i> get dressed before someone sees us, but I’d rather cuddle for a minute.”</i>");

	output("\n\n<i>“Sounds good to me, ma’am,”</i> Riya says in response, grinning and scratching Grence’s head with her right hand. She didn’t even bother with trashtalking...");
	output("\n\nThis might be a good time to go before anyone sees you, though - and go you do. The party has followed it’s natural progression while you were gone; the Dzaan and Kaithrit pair that were wrestling in the kiddie pool when you left are now topless and completely covered with liquid chocolate, alternating taking turns sipping from a glass bottle and licking the delicious treat off each other.");
	output("\n\nThe officers parked around the gaming corner are all completely wasted, steering their characters into walls and giggling hysterically. The dartboard is littered with broken darts and spilled punch, and... oh, here come Grence and Riya.");
	output("\n\nThey’re leaning heavily on each other and their clothes and hair are thoroughly mussed - it’s pretty obvious what they were doing, even for the people who didn’t see it. People are already teasing them...");
	output("\n\nThe rest of the party is pretty uneventful, compared to what you just saw anyway. You head out a few hours later, slightly drunker and <i>much</i> hotter around the collar. Nobody gave you any presents, though... guess that invite was an accident after all.");
	pc.imbibeAlcohol(35);
	processTime(45);
	pc.lust(33);
	clearMenu();
	addButton(0,"Next",move,"TAVROS LIFT");
}

//[Stay]
public function stayAtPartyWhileGrenceAndRiyaBone():void
{
	clearOutput();
	showName("\nPARTY");
	author("Franks");
	output("It’s a pretty fun party. You spend some time watching the girls wrestling in the chocolate pool lose their tops, give up on the wrestling contest and start trading swigs of a bottle of vodka and making out (much to the dismay of everyone except for one Thraggen man who bet they’d start making out midway through the fight and just may have set the whole thing up). Then you make your way over to the gaming corner, where you win a few hundred credits in a Call of Valor tournament, only to lose it playing darts... which is completely the fault of whatever was in that punch, of course.");
	output("\n\nIt’s a great time, and everyone is friendly... but you can’t shake the feeling you’re missing something. A feeling that’s confirmed when you see " + (flags["MET_RIYA"] != undefined ? "Riya":"the big human woman who was making an ass of herself earlier") + " and ‘Santa Grence’ stumbling out of one of the side hallways dripping with sweat, their clothes and hair disheveled and leaning heavily on each other. It’s pretty obvious what they were up to. And you missed it. Damn it all...");
	//PC gains x1 Horse-cock
	if(synthSheathAvailable())
	{
		output("\n\nOn your way out, you spot something lying in a trashbin, something that doesn’t look like it belongs there... is that a horse dildo?... It is. It even has a set of balls. You pluck it out, noting thankfully that it has avoided getting anything nasty on it.");
		output("\n\nWell, at least you had a good time at the party. And this free dildo looks pretty fuckin’ sweet too. You’ll have to check it out later...");
		IncrementFlag("SYNTHSHEATH_TWO_FOUND");
		quickLoot(new HorseCock());
	}
	else output("\n\nWell, at least you had a good time at the party.");

	//PC gains ‘Drunk’
	pc.imbibeAlcohol(100);
	processTime(60);
	output("\n\n");
	currentLocation = "TAVROS LIFT";
}


/*First Frost with Embry
Contains: Lots of adorkable cuteness, cookies, and cuddles
(Also snowballing and oral sex)
By Frogapus

Encounter begins with email.

Email only triggers with 3a or 3b level of affection with Embry, Player must have initiated a sex scene with her before.

Email Invite
From: SpacePrincess@bibliotech
*/

public function embryXmasInvite():String
{
	return ParseText("Hi, [pc.name]!\n\nIt’s [embry.name], back on Myrellion! I hope you’re having a blast on your space adventures-I can’t wait to hear all about them!\n\nIn fact, maybe don’t wait? If you’d like to stop by for a visit, I have a surprise for you! =3\n\nThe next time you’re on Myrellion, drop by the Golden Peak-I’m sure you remember the way to my apartment. You can stop by and we can catch up.\n\nHope to see you soon!\n\t[embry.name]");
}

//Bar Redirect
public function embryBarRedirect2018Xmas():void
{
	clearOutput();
	showName("\nWAITRESS");
	author("Frogapus");
	output("You walk into the bar, glancing around, but don’t see [embry.name].");
	output("\n\nAn ausar waitress bustles by, then glances at you. <i>“Oh hey, are you Steele?”</i> she stops short, balancing a tray of empty glasses on one arm. <i>“If you’re looking for [embry.name], she’s off today. You should probably head to her place.”</i>");
	flags["EMBRY_XMAS_2018_VISIT_PROC"] = -1;
	processTime(2);
	clearMenu();
	addButton(0,"Apartment",visitEmbrysApartment,undefined,"Head to [embry.Name]’s Apartment","You head out of the Golden Peak and toward [embry.name]’s apartment.");
	//Just here to drink
	addButton(1,"Just Drink",mainGameMenu,undefined,"Just Here to Drink","You shrug and make your way into the bar.");
}

//The Apartment
public function visitEmbrysApartment():void
{
	clearOutput();
	showEmbry();
	author("Frogapus");
	output("You make your way to [embry.name]’s apartment and shiver slightly. It’s definitely colder on Myrellion this time of year. When you get to [embry.name]’s apartment, you knock. After a few moments without an answer, you try the door, surprised as it opens, unlocked.");
	output("\n\nYou enter [embry.name]’s apartment and are greeting with a radically different sight than before. You blink in surprise, trying to sort the sights and sounds. Patterns of frost appear to be sprayed onto the walls, while a small vid display is propped up on a pile of books, displaying a crackling fireplace. The floor is strewn with blue and white confetti, and folksy music plays from a small, battered speaker. It also looks like someone’s propped up a... tumbleweed in the corner and decorated it with paper snowflakes. One side of the room appears to have been converted into a makeshift kitchen, crowded with several bowls, bottles, and utensils. On the floor near the door, a small metal box proclaims itself to be a <i>“Heat-o-matic.”</i>");
	output("\n\n[embry.name] has her back to you, stirring a very large mixing bowl and singing along to the violin-based music, naked, save for a white-and-red apron tied snugly around her.");
	output("\n\n<i>“Thoughts of your smiiiiiiiiiiiile,”</i> croons [embry.name] as she glances at a small display propped up on a table, <i>“that run in my miiiiiiiiiiind ...”</i> As she mixes her bowl, her hips sway in gentle counterpoint, swaying her bare butt from side to side. Her pink-furred tail curves up behind her, gently bobbing to her rhythm.");
	output("\n\n<i>“Are priceless treasure!”</i> she twirls, her toes nimbly pirouetting her across the cabin of the ship. Too late, you realize that the simii girl has her eyes closed, and she’s on a collision course with you.");

	//Player Reflexes < 15 and Physique <15
	if(pc.PQ() < 50 && pc.RQ() < 50) 
	{
		output("\n\n<i>“And a goldmine,”</i> she sings, spinning towards you.");
		output("\n\n<i>“[embry.name]!”</i> you shout in warning, too late. The monkey girl’s blue eyes open wide in shock, and she throws her hands up, her mixing bowl flying through the air as she smacks into you.");
		output("\n\nYou tumble into a heap, your [pc.butt] smacking painfully into the floor, with [embry.name] on top of you. You wheeze from the impact, taking a moment to catch your breath, covered in monkey girl and some kind of pale, thick sludge.");
		output("\n\nBefore you can get words out, [embry.name] has hopped up on her hands and knees, her hands a blur as she frantically wipes the sludge off of you, babbling rapid-fire apologies. She’s spattered with some of it, as well as a few streaks of flour on her cheeks and neck.");
		output("\n\n<i>“Oh my gosh, [pc.name], I’m so so sorry, I didn’t mean to do that, please don’t think that I did, I was just in the middle of baking, and I didn’t know when you were coming and I didn’t think you’d be right there, that’s just when the twirl comes in the song, and oh my gosh most of it’s on you, so at least it’s not that huge a mess, not that it’s not bad that I got it all over you, but I’m still really really sorry, and I-”</i>");
		output("\n\nYou cut her off with a quick assurance, and help the monkey girl to clean up as she explains herself.");
	}
	//Player Reflexes < 15 and Physique >15
	else if(pc.RQ() < 50)
	{
		output("\n\n<i>“And a goldmine,”</i> she sings, spinning towards you.");
		output("\n\n<i>“[embry.name]!”</i> you shout in warning, too late. The monkey girl’s blue eyes open wide in shock, and she throws her hands up, her mixing bowl flying through the air as she smacks into you.");
		output("\n\nYou stand firm as she collides, keeping both yourself and the simii upright as her bowl spatters up over her face.");
		output("\n\n<i>“Ack! Pfft!”</i> she sputters, her face covered in a thick, pasty sludge.");
		output("\n\nYou take the bowl from her as she lifts up the front of her apron, wiping her face clean.");
		output("\n\n<i>“Oh no! Oh my gosh, [pc.name]! Did I get any on you! Are you okay?”</i>");
		output("\n\nOnce you assure her that you’re alright, the monkey girl explains herself.");
	}
	//Player Reflexes > 15
	else
	{
		output("\n\nYou manage to deftly step out of the way, letting [embry.name] finish her twirl.");
		output("\n\n<i>“And a goldmine!”</i> she sings.");
		output("\n\nAs her spin slows, you slip behind her, wrapping your arms around her waist.");
		output("\n\n<i>“Ohmigosh!”</i> she yelps, nearly dropping the mixing bowl, instead spattering some up on her cheek. <i>“[pc.name]! I didn’t know you’d come back yet!”</i> You feel her bare butt squish against you as she relaxes.");
		output("\n\nYou let her go, and help her wipe the spatter of thick goo from her face as she explains.");
	}
	output("\n\n<i>“Back on Omorii, we had a winter tradition. When the first dusting of snow hit the plains, we’d all bake cookies. And, well, Myrellion doesn’t really get snow, but it has been getting colder, so I thought it might be nice to bake a few cookies,”</i> she says, squirming a bit as she explains.");
	output("\n\nJust cookies? Not that you mind the simii’s company, but that sounds like an odd thing to summon someone across the stars for. You mention this to [embry.name] and she blushes, looking down.");
	output("\n\n<i>“I mean, it’s First Frost-when we make cookies with, you know... loved ones,”</i> she mumbles. <i>“Plus songs and getting warm in front of the fire, and just... spending time together,”</i> she adds quickly. She looks up, her blue eyes wide as she continues, speeding up, <i>“of course, if you don’t want to, that’s totally okay-I don’t want to force you or anything. Oh my gosh, did I trick you into coming here? I absolutely didn’t mean to. I mean, I wore just the apron, because I thought it’d be cute, but it wasn’t meant as any sort of entrapment or anything skeezy like that. I’m so sorry! Please don’t think I was trying to-”</i>");
	output("\n\nIt’s clear that she’s going to keep going unless you cut her off. You should probably also let know if you’d like to stay for baking cookies.");
	processTime(14);
	clearMenu();
	addButton(0,"BakeCookies",bakeCookiesWithEmbizzle);
	addButton(4,"Leave",leaveHolidayEmbry);
}

//Leave
public function leaveHolidayEmbry():void
{
	clearOutput();
	showEmbry();
	author("Frogapus");
	flags["EMBRY_XMAS_2018_VISIT_PROC"] = -2;
	output("You’re not really interested in baking cookies with [embry.name] and tell her so.");
	output("\n\nThe simii’s shoulders drop and she looks at her feet. <i>“Oh, right. That makes sense,”</i> she says. <i>“I’m sorry. I understand. I know you have things to do,”</i> she mumbles.");
	output("\n\nYou nod and head out, leaving [embry.name] in her apartment.");
	clearMenu();
	addButton(0,"Next",move,"609");
}

//Bake Cookies
public function bakeCookiesWithEmbizzle():void
{
	clearOutput();
	showEmbry();
	author("Frogapus");
	output("You tell [embry.name] that you’d love to bake cookies with her.");
	output("\n\n<i>“Ohmigosh, yay!”</i> she squeaks, clapping her hands together. The pink girl hops up into the air, the front of her apron flapping up, and for a brief moment, " + (embry.hasCock() ? "you get a glimpse of her petite cock under the frilly apron.":"you get a flash of the smooth curve of her mound beneath."));
	output("\n\nShe catches your eye, blushes, immediately covering the front of her apron. <i>“Oops! Oh gosh, I’m sorry! I didn’t mean to flash you like that-I mean, it’s not like I don’t want you to-in that I, um, oh gosh...”</i> she trails off, her cheeks turning as pink as her cotton-candy fur.");
	output("\n\nIt’s true that you weren’t really expecting her in just an apron, and ask her about it.");
	output("\n\n<i>“W-w-well,”</i> she stammers, her fingers toying with the edges of her apron. <i>“I thought that m-maybe you might want to possible do some sorta otherstuffatthesametime...”</i> the last part of the sentence comes out in a jumble, but you catch the gist of it and raise your eyebrows.");
	output("\n\n<i>“I... might have just finished a novel that kinda had a sort of a scene where two people get up to domestic-type stuff and do </i>other<i> stuff in the middle of it and... if you wanted to... we could maybe?”</i> Her cheeks are bright red at this point, and her gaze firmly fixed on her toes.");
	output("\n\nYou smile at the mumbling simii in front of you and ask what she has in mind.");
	output("\n\nShe blinks at the floor, then looks up at you, her tail curling and uncurling in excitement. <i>“Oh! Well, um, you know it doesn’t </i>have<i> to be that sort of thing. If you want to just maybe have some cocoa and cuddle up, that would be fine. And I was getting some snowball cookies started, and I know there’s a sexy-type-sort-of-thing with the same name that could maybe be kinda fun-only if you’re interested, I mean. And, uh, well, I haven’t seen you for a while, so if you want to just do something kinda naughty, we could maybe try that out, m-maybe with my mouth-I read about something kind festive that could be fun...”</i>");
	output("\n\nThat’s quite a menu she’s laid out for you.");

	processTime(10);
	pc.lust(5);
	clearMenu();
	addButton(0,"Cocoa&Cuddle",cocoaAndEmbryCuddles);
	if(pc.hasCock()) addButton(1,"Snowball",snowBallinWithEmbry);
	else addDisabledButton(1,"Snowball","Snowball (and) Cookies","You need a penis for this!");
	if(pc.hasCock() || pc.hasVagina()) addButton(2,"CandyOral",candyCaneOral);
	else addDisabledButton(2,"CandyOral","Candy Cane Oral","You need a penis or vagina for this!");
	addButton(4,"Leave",leaveEmrbyHoliday2018);
}

//Cocoa and Cuddles
//Snowball (and) Cookies (only available if PC has a cock)
//Candy Cane Oral (PC must have cock or vagina)
//Leave

//Leave
public function leaveEmrbyHoliday2018():void
{
	clearOutput();
	showEmbry();
	author("Frogapus");
	flags["EMBRY_XMAS_2018_VISIT_PROC"] = -3;
	output("You tell her that you’re not really feeling anything of those things, and that you really should head out.");
	output("\n\n<i>“Oh, well... I understand,”</i> she says, her shoulders drooping.");
	output("\n\nYou exchange farewells and head out, leaving [embry.name] in her apartment.");
	processTime(3);
	clearMenu();
	addButton(0,"Next",move,"609");
}

//Snowball Cookies
public function snowBallinWithEmbry():void
{
	clearOutput();
	showEmbry();
	author("Frogapus");
	flags["EMBRY_XMAS_2018_VISIT_PROC"] = 1;
	output("You tell her that you’re interested in snowball cookies.");
	output("\n\n<i>“Oh yay!”</i> she chirps, and immediately twirls around to the small folding table. <i>“I, um, think there’s still enough batter for them, and I r-rented a small heat-o-matic for baking them. I just, um, need some help shaping them and putting them on the pan, if that’s okay.”</i>");
	output("\n\nYou decide that you’re probably a little too clothed for sexy baking, catching sight of a spare apron draped over a pile of books. You begin stripping off your equipment as [embry.name] busies herself at her makeshift cooking table.");
	output("\n\nShe plants her hands awkwardly on the desk, and turns her head back to you, her naked, [embry.butt] perked out towards you. <i>“Would you like to help me... shape my cookies?”</i>");
	output("\n\nYou tilt your head in confusion, then snort reflexively. It was clear that she was trying to be seductive, but between the awkwardness of the line, and [embry.name]’s inexperience in seduction, it definitely came off more than a little goofy.");
	output("\n\nShe looks crestfallen at your reaction, but before the simii girl can respond, you slide up behind her, wrapping your arms around her slim waist and nuzzling against her neck.");
	output("\n\n<i>“Was I... oh... mmm, [pc.name] ....”</i> she murmurs, her slight body shivering softly against yours.");
	output("\n\nYou nibble softly against her earlobe, and a sweet sigh slips from her lips. You spend a few minutes nibbling and teasing her, your hands running up the front of her apron, cupping her [embry.breasts]. You stiffen under your apron, pressing through it against [embry.name]’s perky butt and are rewarded with another breathy sigh from the simii." + (embry.hasCock() ? " You look down over her shoulder and catch sight of her own apron tenting up with her cute little erection.":""));
	output("\n\n[embry.name] seems to have been reduced to a taut, shivering mess, so you decide to pull back a bit. The simii girl <i>says</i> she wanted to make cookies, after all, and she’d currently in no state to do so.");
	output("\n\nIt takes her a minute or two to form words again, and when she does, they’re still a little jumbled. <i>“Hhhahhh... oh, [pc.name], th-that was just... so... wow ...”</i>");
	output("\n\nOnce she can re-order her words properly, she starts walking you through shaping the cookies and placing them on the pan. The task is simple enough, and you remain behind [embry.name], reaching around her to roll the lumpy dough, and occasionally giving her a quick nibble.");
	output("\n\nIt takes slightly longer than it probably should to make the cookies, but neither you nor [embry.name] is complaining. Cheerful, folksy music plays in the background, and the faux-frost on the walls twinkles in the firelight from the vid display.");
	output("\n\nAmidst giggles, moans, and breathy sighs, [embry.name] pops the cookies in the oven, while you sit on the edge of her small bed, your legs spread wide.");
	output("\n\n<i>“It’ll be a few minutes,”</i> [embry.name] says, biting her lip.");
	output("\n\nWith a smile, you wonder aloud how you’ll pass the time.");
	output("\n\n<i>“Well, since I’m, um, already pre-heated, you can... um ...”</i> she stops, wrinkling her nose.");
	output("\n\nYou try to hold in a " + pc.mf("chuckle","giggle") + ", but it’s clear that she reads it on your face. <i>“Oh my gosh, shush!”</i> she squeaks. <i>“This is a l-lot harder than it looks,”</i> she pouts, stomping her foot indignantly.");
	output("\n\nYou grin and reassure her, pulling her in close to you, your fingers running from her temples down behind her ears, tracing their way through her pink hair. She moans softly, catching one of your hands with both of hers, and cupping it against her cheek. Eyes half-closed, she nuzzles against it, her breath warm against your wrist.");
	output("\n\nThe background music is a slow violin piece, and you both unconsciously follow it with long, measures of touch against each other’s skin. Her fingers running down your sides, your palms caressing up the small of her back. A brush of her " + (embry.hasCock() ? "stiffening cock against your thigh,":"moist mound against your thigh,") + " and an answering strum of your fingers across her lips.");
	output("\n\nShe peppers a warm trail of kisses down your front and across your thigh as you run your fingers through her hair, tracing each forefinger along the edges of her ears.");
	output("\n\n<i>“Oh, [pc.name],”</i> she breathes, <i>“what are you doing to me?”</i>");
	output("\n\nAnd the music plays.");
	output("\n\nWhen her warm lips press a kiss against your cock, you groan, leaning back. The kiss is followed by a nuzzle at the base of your shaft, then a few licks from a tentative tongue. You look down, and [embry.name]’s looking up at you, your dick draped across her sweet face. <i>“Is-is it okay so far?”</i> she asks hesitantly.");
	output("\n\nYou nod, taken a bit speechless by the sight of so much sweet lewdness at once.");
	output("\n\n<i>“Yay,”</i> she murmurs. [embry.name] tilts her head back, pressing her lips to the base of your shaft, and slowly kisses her way up the underside. You breathe heavier with each soft, sucking kiss. By the time she gets to your tip, you’ve already got a sizable dollop of precum balanced atop it. [embry.name] draws back her head, biting her lip, then looks questioningly up at you, her hips wiggling beneath her.");
	output("\n\nYou nod in breathless anticipation, and she ever so slowly dips her tongue against your pre. Her lips follow, pressing an enveloping kiss around your cockhead. She sucks it down partway, then pulls back up, sliding her mouth up and down your tip a handful of times, her hands wrapped around the base, as if she were slurping up a melting popsicle. You groan as she pulls her mouth off your dick, dropping beneath it to return to a happy, hungry kisses.");
	output("\n\nIt goes this way for a while in the small apartment, the cluttered space filled with holiday decorations, the smell of baking cookies filling the air, and [embry.name] giving your dick a slow, lazy tonguebath. She’s a little clumsy, and every so often, she looks up at you for approval, but that just adds to the slow, measured pace. With each slurp of your cockhead, you get closer to cumming, but she pulls back each time, leaving your dick throbbing beneath the monkey girl’s kisses.");
	output("\n\nYou’re breathing heavier and heavier and your dick twitches with each kiss from [embry.name]. You can feel your climax cumming, and you moan this to her.");
	output("\n\nShe yelps and plants her lips firmly over the tip of your dick, her dexterous hands stroking its base.");

	//Low-to-Normal cum
	if(pc.cumQ() < 100)
	{
		output("\n\nYou groan, letting loose a jet of cum into [embry.name]’s mouth. She squeaks, bobbing her head up and down, her cheeks puffing out with your load.");
	}
	//Large amounts of cum
	else
	{
		output("\n\nYou groan, letting loose jet after jet of cum into [embry.name]’s mouth. She sputters, her cheeks instantly puffing out, and the rest of it spurting out around her mouth and across her face.");
	}
	output("\n\nShe looks questioningly up at you, her mouth full of your cum, and you remember what she said about snowballs.");
	output("\n\n<b>Do you want [embry.name] to snowball you?</b>");
	processTime(15);
	embry.loadInMouth(pc);
	pc.orgasm();
	clearMenu();
	addButton(0,"Yes",yesSnowballEmbry);
	addButton(1,"No",noSnowballEmbry);
}

//Yes.
public function yesSnowballEmbry():void
{
	clearOutput();
	showEmbry(true);
	author("Frogapus");
	output("You nod, and she clambers up the bed, perched on all fours above you, then leans down, pressing her cum-smeared lips to yours. You meet her halfway, your mouth open as her lips part. Together, you share a cum-filled kiss. One of you (you’re a little too addled to tell) starts moaning first, quickly followed by the other, as your tongues intertwine, the [pc.cumFlavor] taste of your climax filling your mouths.");
	output("\n\nYou pull back, breaking the kiss, and she gulps, licking her lips. You follow suit, gazing up at the surprisingly naughty little monkey on top of you. She blushes immediately under your gaze, dropping her eyes and biting her lip.");
	output("\n\n<i>“W-was that okay?”</i> she asks.");
	output("\n\nYou tilt her head back up and give her another kiss in assurance.");
	processTime(5);
	pc.loadInMouth(pc);
	snowballEmbryOutro();
}

//No.
public function noSnowballEmbry():void
{
	clearOutput();
	showEmbry(true);
	author("Frogapus");
	output("You shake your head, and she gulps down your load, blushing under your gaze.");
	output("\n\n<i>“W-was that okay?”</i> she asks.");
	output("\n\nYou grin and pat her head in reassurance.");
	snowballEmbryOutro()
}

public function snowballEmbryOutro():void
{
	output("\n\nA brief chime from the small oven interrupts your reverie.");
	output("\n\n<i>“The cookies!”</i> yelps [embry.name], springing up and grabbing a pair of pink, shark-shaped oven mitts.");
	output("\n\nShe pulls a pan of lightly-browned cookies out of the oven and begins fanning them. As the cookies cool, [embry.name] walks you through the finishing touches, filling a bowl with powdered sugar and spices. When you’re done, you take turns rolling the warm cookies around in the dusting, turning them into small, white balls before stacking them on a plate.");
	output("\n\n<i>“Snowballs!”</i> she chirps proudly, holding the plate up in triumph.");
	output("\n\nYou burst out laughing. The pink-hair monkey-girl’s apron is akew, and is still wearing her shark oven mitts. Powdered sugar streaks most of her naked body, and there’s still a smear of cum on her cheek.");
	output("\n\nHer mouth drops open in shock, but this time, she catches a glimpse of herself in her room mirror, and starts giggling herself. She sets the cookies down as you both explode into peals of laughter.");
	output("\n\nWhen the laughter passes, you spend the next hour together, feeding each other cookies and chatting.");
	output("\n\nAs the conversation winds down and one after the other, the cookies disappear, [embry.name] leans in close and nuzzles against your neck.");
	output("\n\n<i>“I’m so happy you came by, [pc.name]. Thank you,”</i> she says. <i>“I miss you when you’re not around.”</i>");
	output("\n\nYou lean down and kiss her gently, bringing that familiar blush to her cheeks.");
	output("\n\n<i>“Happy First Frost, [embry.name],”</i> you say.");
	output("\n\n<i>“Happy First Frost, [pc.name],”</i> she answers, practically glowing.");
	output("\n\nAfter a bit more time dozing in happy cuddles, you bid [embry.name] a fond farewell and head off to your ship.");
	processTime(25);
	clearMenu();
	addButton(0,"Next",move,"SHIP INTERIOR");
}

//Candy Cane Oral
public function candyCaneOral():void
{
	clearOutput();
	showEmbry(true);
	author("Frogapus");
	flags["EMBRY_XMAS_2018_VISIT_PROC"] = 2;
	output("You tell [embry.name] that you’re not much for baking, but you’d enjoy doing something festive and naughty with her.");
	output("\n\nEmbry blushes and smiles, her eyes unable to meet yours. <i>“Yay! Let me just get these cookies in the oven, and you can get comfortable over there.”</i> Her tone is casual, but her tail is curling and uncurling excitedly.");
	output("\n\nYou undress, lying down on Embry’s bed, your eyes scanning the cluttered room as she busies herself in her makeshift kitchen.");
	output("\n\nYou eyes land on a small, battered book lying propped open next to the bed. You pick it up and give it a look over. The cover features a swarthy bull man embracing a scantily-dressed kui-tan in what looks like an antique kitchen. The title reads, <i>A Recipe for Love</i>. [embry.name] hums to herself, setting dough on a pan as you flip through the book. Each chapter of the steamy romance begins with a different recipe. It’s one part cookbook, and three parts smut, and you’re pretty sure where [embry.name] got the idea for this encounter.");
	output("\n\n<i>“Eep!”</i> squeaks [embry.name]. You glance up to see her looking at you with her hands clapped to her cheeks. <i>“I’m sorry. That’s the book wh-where I got the idea from. Um, please put it down so you don’t spoil the surprise, please?”</i>");
	output("\n\nFor [embry.name], that was a surprisingly forceful request. You close the book and set it aside. [embry.name] looks at you, her hands folded behind her back as she gently wiggles from side to side.");
	output("\n\n<i>“Now, um, if you w-wouldn’t mind, would you please close your eyes? And-and keep them closed?”</i> she asks.");
	output("\n\nYou acquiesce, closing your eyes. You hear the soft, folksy music filling the room, the rattle of bottles and [embry.name] prepares her surprise, and the barest hint of cookies beginning to bake. [embry.name]’s comforter is thick beneath you, and you feel the softness of her pillows behind you.");
	output("\n\nThere’s a sudden clinking, and a strong smell of peppermint fills the room. You turn your head this way and that, taking it in.");
	output("\n\n<i>“No peeking!”</i> [embry.name] reminds you, and you settle back against the bed.");

	//If PC has cock
	if(pc.hasCock())
	{
		output("\n\nYou feel the weight of her settling down at the foot of the bed, and a soft kiss on your dick.");
		output("\n\nYou moan in surprise, then yelp at the sudden rush of cold in the same spot, as if someone had just brushed an ice cube against your dick. You open your eyes and glance down at [embry.name], crouched between your legs. She smiles up at you, her lips glimmering with red-and-white striped-lipstick.");
		output("\n\n<i>“It’s called, um, Peppermint Kiss,”</i> she explains, looking nervous. <i>“The book said how to make it, and, um, I wanted to try it out because it looked really easy, and I know I should have asked, but I kind of wanted it to be a surprise. I hope that’s okay,”</i> she chatters.");
		output("\n\nYou nod and pat her head in approval. She purrs, nuzzling her head against your hand, her tail curling up in a tight, happy spiral.");
		output("\n\nShe leans down to kiss your shaft again, and you lean back, enjoying the warmth of her lips, then yelping softly at the pleasant chill that follows. <i>“D-does it feel good?”</i> asks [embry.name]. You answer with a grin.");
		output("\n\nShe smiles back, her painted lips gleaming in the orange glow of her apartment lights. She bobs her head down, planting another burst of warm, then cold against your length. You groan and lean back-you could get used to this.");
		output("\n\nShe paints your dick with her fluttering kisses, and peck after peck, you stiffen, until your dick stands at attention in front of her face. She looks up at you from behind it, bites her lip, then nervously draw her tongue up the full length of your dick. Her lower lip trails behind it, painting a line of warmth then cold up your cock.");
		output("\n\nYou gasp-you’re not sure how much more of this you can handle. You can already feel your dick twitching from the stimulation. [embry.name] looks up at you, a look of concern plastered over her face, but as your breathing slows to moans of pleasure, she smiles and wiggles her rump happily.");
		output("\n\nShe licks her way up your cock a few more times, her tongue and lips tracing stripes of tingling pleasure up and down your shaft. You can feel pre starting to push its way up your dick, beading at your tip.");
		output("\n\nAt long last, [embry.name] presses her painted lips to the tip of your dick. You groan loudly, feeling the hot warmth of her mouth and a rush of cold at the same time.");
		output("\n\nYou’re sure that you can’t last long under the avalanche of sensation, and the quick, furtive bobs of the monkey girl’s head ensures it. Her gentle mouth sucks softly at your cockhead as her lips slide up and down around it, massaging with minty cold and hungry warmth. The lipstick is smudging a bit too, or maybe it’s drool, running in cool rivulets down to the base of your dick.");
		output("\n\nAfter only a few minutes of this, you feel your climax building, and your hands slide to the back of Embry’s head, nudging her further and further down until you finally explode. You pump your load into [embry.name]’s mouth, as she squeaks, swallowing as much of it as she can.");
		//Low-to-normal cum
		if(pc.cumQ() < 100) output("\n\nWhen you finally finish, she gasps and pulls her head up, a beautiful mess. Her pink hair is mussed, her cheeks flushed, and her face a mess of red-and-white lipstick smears, drool, and your cum.");
		//Ridiculous Cum
		else output("\n\nThere’s no way for her to take all of your cum as you fire load after load into her mouth. She pulls back, and the remainder of your load jets across her face. She coughs, looking down at the cum dripping down her front and pouts. She’s a picture of adorable lewdness, her pink hair mussed, her cheeks flushed, her smeared red-and-white lipstick barely visible under a dripping layer of fresh spooge.");
	}
	//If PC has no cock, but has vagina
	else if(pc.hasVagina())
	{
		output("\n\nYou feel the weight of her settling down at the foot of the bed, and a soft kiss just above your pussy.");
		output("\n\nYou moan in surprise, then yelp at the sudden rush of cold in the same spot, as if someone had just brushed an ice cube against you. You open your eyes and glance down at [embry.name], crouched between your legs. She smiles up at you, her lips glimmering with red-and-white striped-lipstick.");
		output("\n\n<i>“It’s called, um, Peppermint Kiss,”</i> she explains, looking nervous. <i>“The book said how to make it, and, um, I wanted to try it out because it looked really easy, and I know I should have asked, but I kind of wanted it to be a surprise. I hope that’s okay,”</i> she chatters.");
		output("\n\nYou nod and pat her head in approval. She purrs, nuzzling her head against your hand, her tail curling up in a tight, happy spiral.");
		output("\n\nShe leans down to kiss you again, lower this time, her lips pressed against the top of your slit, and you lean back, enjoying the warmth of her lips, then yelping softly at the pleasant chill that follows. <i>“D-does it feel good?”</i> asks [embry.name]. You answer with a grin.");
		output("\n\nShe smiles back, her painted lips gleaming in the orange glow of her apartment lights. She bobs her head down, planting another burst of warm, then cold down the curve of your vagina. You groan and lean back-you could get used to this.");
		output("\n\nHer nimble fingers spread you slightly, and she paints kisses along your lips, and peck after peck, you goan, your pussy moistening against her striped lip. She lifts her head and looks up at you, biting her lip nervously, then spreads you a little wider before lapping her tongue up one side of your inner fold then the other. Her lower lip trails behind her exploring tongue, a chilling wave behind it.");
		output("\n\nYou struggle to keep your breathing regular-but you’re not sure how much more of this you can handle. When she plants a kiss on your swelling clit, you yelp, overwhelmed by the intensity of warm-then-cold. [embry.name] looks up at you, a look of concern plastered over her face, but as your breathing slows to moans of pleasure, she smiles and wiggles her rump happily.");
		output("\n\nShe slowly begins eating you out. She’s a little clumsy, but the lipstick is doing more than its share of the work. Between her kisses, the warm lapping of her tongue, and the period rush of the lipstick, you’re not sure how much longer your can hold out. Despite the cold of the lipstick, your body is heating up, and you can already feel a happy glow building.");
		output("\n\nYou’re sure that you can’t last long under the avalanche of sensation, and the slim finger of the monkey sliding up into you confirms it. Her gentle mouth sucks softly at your clit, her lips pressed against your labia, coupling minty cold and hungry warmth. The lipstick is smudging a bit too, or maybe it’s drool, running in cool rivulets down your mound.");
		output("\n\nAfter only a few minutes of this, you feel your climax building, and your hands slide to the back of Embry’s head, nudging her closer and closer against you until you finally explode. You wrap your [pc.thighs] around the monkey girl’s head, and spurt against [embry.name]’s mouth, as she squeaks, getting a face full of your ladyjuices. You ride out your climax as long as possible, and [embry.name] ever accommodating, keeps licking and sucking until you finally fall back.");
		output("\n\nEmbry gasps, thin lines of your juices running from her smudged lips down to your pussy. Her lipstick is smeared across both flushed cheeks, her pink hair is mussed, and she looks a little dazed, the picture of wanton cuteness.");
	}
	output("\n\nA brief chime from the small oven interrupts your reverie.");
	output("\n\n<i>“The cookies!”</i> yelps Embry, springing up and grabbing a pair of pink, shark-shaped oven mitts.");
	output("\n\nShe pulls a pan of lightly-browned cookies out of the oven and begins fanning them, the pink-furred tail picking up a small tin and dumping white powder into another bowl. As you catch your breath on the bed, she bustles in her makeshift kitchen.");
	output("\n\n<i>“Snowballs!”</i> she chirps, walking a tray piled high with little white balls.");
	output("\n\nYou burst out laughing. The pink-hair monkey-girl’s apron is akew, she’s wearing pink, shark-themed oven mitts. Powdered sugar streaks most of her naked body, and despite some attempt to clean herself up, there’s still a smear of cum on her cheek.");
	output("\n\nShe pouts briefly, but you reassure her and pull her onto the bed with you. You spend the next hour or so together, curled up on her bed, feeding each other cookies and chatting.");
	output("\n\nAs the conversation winds down and one after the other, the cookies disappear, [embry.name] leans in close and nuzzles against your neck.");
	output("\n\n<i>“I’m so happy you came by, [pc.name]. Thank you,”</i> she says. <i>“I miss you when you’re not around.”</i>");
	output("\n\nYou lean down and kiss her gently, bringing that familiar blush to her cheeks.");
	output("\n\n<i>“Happy First Frost, [embry.name],”</i> you say.");
	output("\n\n<i>“Happy First Frost, [pc.name],”</i> she says, smiling and hugging you softly.");
	output("\n\nAfter a bit more time dozing in happy afterglow, you bid [embry.name] a fond farewell and head off to your ship.");
	processTime(90);
	if(pc.hasCock()) embry.loadInMouth(pc);
	else embry.girlCumInMouth(pc);
	clearMenu();
	addButton(0,"Next",move,"SHIP INTERIOR");
}

//Cocoa and cuddles
public function cocoaAndEmbryCuddles():void
{
	clearOutput();
	showEmbry(true);
	author("Frogapus");
	flags["EMBRY_XMAS_2018_VISIT_PROC"] = 3;
	output("You mention that you’re not really in the mood for anything naughty, but you’d love to curl up with some cocoa and her.");
	output("\n\nShe bounces excitedly, <i>“That sounds perfect, [pc.name]!”</i> She immediately twirls around to the small folding table. <i>“I, um, think there’s still enough batter for the cookies, and I r-rented a small heat-o-matic for baking them. I’ll um, work on them if you can get the cocoa started.”</i>");
	output("\n\nYou spend the next half hour with [embry.name], heating up milk and adding chunks of chocolate to it. As you work, cheerful, folksy music plays in the background, and the faux-frost on the walls twinkles in the firelight from a vid display.");
	output("\n\nOnce she pops the cookies in the oven, [embry.name] cozies up against you in front of the heat-o-matic, adding ingredient after ingredient to the saucepan of thick, bubbling chocolate and whisking them together. You’re a little unsure about the dash of red pepper, she adds, but [embry.name] is surprisingly insistent about it.");
	output("\n\n<i>“Um, it’s how we make it on Omorii,”</i> she explains. <i>“It makes sure the heat gets all the way down into your bones.”</i>");
	output("\n\nMyrellion legitimately seems to be chilly this time of year, and even through the apartment walls, you swear you can feel it creeping in. You decide to trust [embry.name]’s expertise on it.");
	output("\n\nShe pours the chocolate out of the saucepan into two mismatched mugs, handing you the one that proclaims that you <i>“Went Ape on Primus X!”</i> while she curls her fingers around one that establishes that it’s owner was the <i>“Galaxy’s Best Simian.”</i> Her tail curls around her to drop a cinnamon stick in each of your mugs before you walk towards her bed together.");
	output("\n\nThe next few hours are spent sipping cocoa under a heavy blanket, chatting about small things and large. You fill her in on the adventures you’ve had since you last saw her, as she listens with wide-eyes and breathless excitement. You listen in awe as she talks a bit about growing up on her home planet, leaving out her homelife, but talking about the endless, open prairies of Omorii, and riding across them.");
	output("\n\nYou break briefly as the heat-o-matic chimes, and you both emerge from the blanket to retrieve them from the oven as give them a dusting of powdered sugar. You laugh at the silliness that is [embry.name]’s pink, shark-shaped oven mitts, while she insists that they’re very cool.");
	output("\n\nYou return to the blanket and spend another hour or so there, munching cookies and chatting the time away. The mugs of cocoa spent, you end up with [embry.name] curled against your chest, your fingers running through her hair as she nuzzles against your neck, making happily little sighs.");
	output("\n\n<i>“I’m so happy you came, [pc.name]. Thank you,”</i> she says, squeezing against you. <i>“I miss you when you’re not around.”</i>");
	output("\n\nYou lean down and kiss her gently, bringing that familiar blush to her cheeks.");
	output("\n\n<i>“Happy First Frost, [embry.name],”</i> you say.");
	output("\n\n<i>“Happy First Frost, [pc.name],”</i> she replies, her smile practically glowing.");
	output("\n\nAfter a bit more time cuddling, you bid [embry.name] a fond farewell and head off to your ship.");
	processTime(135);
	restHeal();
	pc.lust(15);
	clearMenu();
	addButton(0,"Next",move,"SHIP INTERIOR");
}

public function carolJChristmasElfDreamyWeamy():void
{
	clearOutput();
	showName("\nCHRISTMAS!");
	author("Carol J.");
	output("It’s Christmas Day, and you’re spending it just about the same way that you always do now that you’re older: shitposting online and being an ass in the various Extranet forums you still deign to grace with your presence. The most Christmas is to you now is a day off from work, and that suits you just fine. “Good will towards men” and “giving to receive” can suck a fat nut, but if it means you get to sleep in, that’s reason to celebrate.");
	output("\n\nStill. As you pause typing your latest diatribe on why the game industry has gone to shit for the tenth time in as many years, you can’t help but turn your gaze skyward.");
	output("\n\nIs this really what Christmas is about? Is it really just another day? Maybe this is your chance to reflect. A chance to appreciate the stillness of Winter and the peace it brings. After all, do you really enjoy spending your time like this? Half-heartedly playing porn games and trolling imageboards for people dumb enough to take the rhetorical bait?");
	output("\n\nYou resume typing. Yeah, fuck that. You don’t know what you were thinking, but the mere fact that you were thinking about taking a walk in the snow means you should probably check to make sure your brain’s OK. Maybe making some teenybopper loser on FutureGram cry will help you feel more like yourself.");
	output("\n\nYou’re about to hit “post” and blow all the losers in the thread away with your scathing logic when you hear something rustle behind you. Well, “rustle” is a bit misleading. It’s more like a “bump” and then a “whisper,” but there’s no specific word for that precise combination.");
	output("\n\nAs you glance over your shoulder, you catch a glimpse of something...festive. Yeah, this is going to require your full attention. You turn away from your computer and focus your gaze on what <i>appears</i> to be a giant gift box, wrapped all professionally with bright red and green wrapping paper. It’s even topped with a bow.");
	output("\n\nNormally you’d be pretty psyched to get a Christmas present out of nowhere. Normally it wouldn’t be scuttling around on two pairs of green feet.");
	output("\n\nEvery now and then, the box will rise up off the ground. Two pairs of legs extend from holes cut out on the bottom, and its apparent occupants will take a moment to orient themselves before promptly walking straight into a wall or something. Two reedy voices chatter inside the box, and even if it’s pretty clear they’re doing their best to be stealthy about it, you can hear just about everything they’re saying.");
	output("\n\n<i>“Ack,”</i> comes one frustrated whisper. <i>“I thought you said you cut eye holes in this thing!”</i>");
	output("\n\n<i>“I </i>did,<i>”</i> hisses the other. <i>“But </i>someone<i> decided that the bow had to be absolutely </i>perfect,<i> so they both got covered up!”</i>");
	output("\n\n<i>“Presentation is important!”</i> The first one chimes in again as you rise from your seat and walk over to it. <i>“We gotta make a good first impression, or else- Oop!”</i>");
	output("\n\n<i>“I think he’s coming over. Inconspicuous Box mode!”</i>");
	output("\n\nBoth the present’s occupants immediately drop down, and the present rests on the ground. You stop right in front of it, standing there for a moment.");
	output("\n\nFor a few seconds, there’s silence. Then they speak up again.");
	output("\n\n<i>“Is he gone?”</i>");
	output("\n\n<i>“I dunno, I think he might-”</i>");
	output("\n\nYou reach down and pick up the present. The bottom opens up, and soon the box itself is lifted up and away, revealing its contents.");
	output("\n\nTwo goblins stare up at you, wide-eyed and dumbstruck. You stare back.");
	output("\n\nWhen they stand, it’s in unison, and their jubilant cry is delivered with similar enthusiasm. <i>“Merry Christmas!”</i> The two of them chirp, arms thrust into the air merrily.");
	output("\n\nIf they’re here to help you celebrate the holiday, they’re certainly dressed for the occasion. They’re wearing the kind of outfits you’d expect to see on elves at the North Pole, though the coloration has their skin’s natural hue in mind. Their skirts are candy cane red, complementing their vividly green skin <i>quite</i> nicely. Along with the white trim around their wrists and on their collars, their uniforms are decidedly festive...if a little too form-fitting to be altogether <i>appropriate</i> for a family-friendly Christmas gathering. Hardly a surprise, given what kind of bodies you’ve seen on their kind before, but what would be rather tame on a slender elf is downright scandalous on these two voluptuous goblins. Hard to complain, given that the stretched-tight fabric clearly showcases that they’re <i>definitely</i> not wearing bras.");
	output("\n\nYou manage to tear your eyes away from their shapely bodies and spare a glance at their faces. Glittering green eyes, dimpled cheeks, and cute li’l button noses. They look similar enough to be sisters. In fact, the only major exception is that one of them’s got her black hair in a pixie cut and the other has hers in a bob.");
	output("\n\nYou realize you’ve been staring at them in complete for around a minute. To be perfectly fair, they’ve been doing the same, but the point stands. One of them turns her head slightly towards the other, her eyes still trained on yours.");
	output("\n\n<i>“Do you think he heard us?”</i>");
	output("\n\nYou coolly reassure them that yes, you did hear them shout <i>“Merry Christmas.”</i> Right after you found them trespassing in your home. You cross your arms and narrow your eyes at your two <i>“guests,”</i> and their enthusiasm seems to wane. But only for a moment!");
	output("\n\n<i>“See, Holly? <b>Terrible</b> host.”</i> The one with the pixie cut crosses her arms under her bust, nose in the air. If she was chipper before, now she’s cold as ice. <i>“Two gorgeous gals right under his nose, and he’s going straight to ‘who are you’ and ‘how did you get into my house.’”</i>");
	output("\n\n<i>“C’mon, Molly!”</i> Holly - the one with the bob, apparently - keeps a stiff upper lip and a smile on her face. She clasps her hands together and rocks on her heels. <i>“Cut the guy a break! We kinda knew what to expect, didn’t we?”</i>");
	output("\n\nHold on. <i>“Knew what to expect?”</i> What’s going on here? Your frown deepens, and while you aren’t <i>quite</i> ready to call the peacekeepers on them, you’re definitely getting closer.");
	output("\n\nHolly and Molly seem pretty amused by the question, and for a moment or two, they’re reduced to knowing giggles. Molly’s the first to compose herself, and her scowl returns with a vengeance once she’s gotten over her amusement. <i>“What, you think we’re here for our health? Not </i>hardly,<i> buster. We’re here on </i>very<i> specific orders to take care of a </i>very<i> specific problem. See...”</i> Her vitriol mellows, and with a sway to her hips, she takes a step forward. Molly reaches out with one diminutive hand, and as you blink down at her, she hefts your cock up through your pants.");
	output("\n\n<i>“You’ve been <b>naughty.</b>”</i>");
	output("\n\nYou blink down at her. Then you smile, quirking an eyebrow. Oh, is that </i>so?<i>");
	clearMenu();
	addButton(0,"Next",carolJChristmasElfDreamyWeamy2);
}
public function carolJChristmasElfDreamyWeamy2():void
{
	clearOutput();
	showName("CHRISTMAS\nGOBLINS!");
	author("Carol J.");
	output("Holly bumps Molly aside with her hip, still all smiles. <i>“Yeah! I believe the technical classification for your level of naughtiness back at the North Pole is ‘total douchebag,’ but for the purposes of this introduction, you’ve definitely been put on the ‘naughty’ list. In fact, you’ve been on it for...”</i> She pulls a datapad out from behind her back, consults it, and tucks it away once more. <i>“...around fifteen years!”</i>");
	output("\n\nMolly shoves Holly away with a grunt, and it’s with her hands pawing at your groin that she continues. <i>“Suffice to say, you’ve been a real </i>bad boy,<i> and since the prior attempts didn’t change anything-”</i>");
	output("\n\nNormally you’d be content to sit back and let them keep talking - you typically are when gorgeous shortstacks are set to jerk you off - but this is all a bit much to stomach. You don’t shoo her away as she strokes your cock through your pants, but you <i>do</i> speak up. Prior attempts. What prior attempts?");
	output("\n\n<i>“Ah-”</i> Molly glances over to Holly, and Holly looks right back. <i>“He doesn’t know?”</i>");
	output("\n\n<i>“Must have an ad blocker installed. See!”</i> Holly doesn’t interrupt Molly’s work this time, so you’re left to enjoy Molly’s hands on your stiffening prick as she speaks.");
	output("\n\n<i>“So, back in the day, people on the naughty list would get a lump of coal for Christmas, the size and quality of said coal being determined by the severity and frequency of their naughtiness. That wasn’t really a viable means of punitive action once fossil fuel reserves were depleted, so Claus LLC and its subsidiaries switched to an alternate form of punishment around the turn of the twenty-third century. Now instead of coal, people on the naughty list get lots of spam pop-ups and unskippable pre-roll ads.”</i>");
	output("\n\n<i>“I hear some of them are, like, fifteen minutes long,”</i> Molly says with a shiver.");
	output("\n\n<i>“Yeah, they’re no joke. But that doesn’t really work either! You’re still pretty clearly an insufferable jackass judging by your posts online, so you’ve been selected to take part in a new program to </i>prevent<i> naughtiness instead of merely </i>punishing<i> it.”</i>");
	output("\n\n...You honestly don’t know what to say. After you open your mouth to speak before closing it wordlessly a few times, Holly continues.");
	output("\n\n<i>“So, obviously the elves on the North Poles on Claus LLC-affiliated planets are more or less occupied making toys for the people on the ‘nice’ list, but there are plenty of goblins available, especially during the holiday season.”</i>");
	output("\n\n<i>“Long story short,”</i> Molly cuts in finally, unzipping your pants and tugging them down far enough for her to fish out your half-hard prick. <i>“We’re here to make sure you don’t do anything <b>naughty</b> this year.”</i>");
	output("\n\n<i>“And potentially see if you can end up on the ‘nice’ list instead!”</i> Holly adds. You’re a little distracted by the steady pump of Molly’s hands around your shaft, but you’re willing to listen, at least. <i>“See, the basic premise of this program is that-”</i>");
	output("\n\n<i>“We can go over the specifics later, stud.”</i> Molly nudges Holly away with a bump of her hip. She winks up at you before opening her mouth wide...and letting her tongue loll out. She coats your prick in warm, slick saliva, licking up and down as if she’s savoring the world’s tastiest candy cane. With the shaft thoroughly wetted, she starts to suckle the tip of your cock, hands returning to its stiff length, pumping up and down.");
	output("\n\nIt’s as if she’s trying to wring you dry as sweetly as possible, and even if her every pump is more forceful than the last, her silky-smooth grip is still as gentle as can be.");
	output("\n\n<i>“So.”</i> Molly pulls away from your cockhead with a pop, and you blink down at her. Her lips turn up in a smile, and you watch them as she speaks, mesmerized. <i>“First things first. This isn’t a <b>reward</b> for being naughty. What we’re doing here is making sure you *stop* being naughty. You ever heard of ‘positive reinforcement,’ stud?”</i>");
	output("\n\nYou nod. Normally you’d try to come up with some smooth response, all suave and cool, but right now you’re being treated to the hottest handjob you’ve ever gotten. Wit isn’t exactly a priority.");
	output("\n\n<i>“That’s what we’re gonna be doing here. You know how you spend all your time posting those nasty little messages online? The ones that make people so mad? The ones that make people <b>cry?</b>”</i>");
	output("\n\nYou wince, nodding.");
	output("\n\n<i>“That’s real <b>naughty.</b> And so’s downloading all that music and all those holos illegally. <b>And</b> you watch <b>way</b> too much porn. We’ve gotta help you tone it down, or else you’re never gonna be nice! You’re gonna <b>stop</b> that, and to make sure you do, we’re gonna take away your computer while we’re here. No Extranet whatsoever.”</i>");
	output("\n\nYou open your mouth to protest, but as soon as you do, Molly picks up her speed. Her slow, sweet handjob turns to a steady pump-pump-pump, and your dissent fades to nothing.");
	output("\n\n<i>“In exchange, we’re gonna give you something <b>better</b> than those silly little forums and all those bits and bytes. While we’re staying with you, just say the word, and we’ll jerk you off nice and easy! Whenever. You. <b>Want.</b>”</i>");
	output("\n\nShe punctuates her words with particularly forceful strokes of your shaft, and by the end of her pitch, you find yourself wondering if it’d really be so bad to spend some time offline.");
	output("\n\n<i>“And! And, and, and!”</i> Holly’s pulled over a side table and climbed on top of it such that you’re finally face to face instead of groin to face. She claps her hands on your cheeks and turns your head to face her, and you lose yourself in her sparkling eyes as Molly continues to pump your cock. <i>“We’re prepared to offer more than just reimbursement for the preventative measures we’re going to put in place!”</i> She moves one hand from your face and pulls a sprig of mistletoe from...somewhere. <i>“Your file says that you either forget to or choose not to say neither ‘please’ nor ‘thank’ you when someone helps you, so I thought it’d be helpful to offer some positive reinforcement when you <b>do!</b>”</i>");
	output("\n\nShe holds the mistletoe above your head, and you glance up at it for a moment before looking back down to Holly. Lips pursed and eyes closed, she’s ready for a kiss. When you lean in to reciprocate, though, she ducks away. <i>“Ah-ah-ah!”</i> She shakes her head. <i>“What’s the magic word?”</i>");
	output("\n\nThe situation is surreal, but Molly’s hands jerking your spit-shined cock make it exceedingly hard to care. When Molly ducks in to suckle on your cockhead again, you give a particularly high-pitched moan. As you search for the right word, your eyelids flutter.");
	output("\n\nPlease?");
	output("\n\nHolly squeals with delight, and her arms drape over your shoulders as she practically forces herself on you. Her lips meet yours and part barely a second later. Her tongue pushes into your mouth, and you’re wholly overwhelmed by her enthusiasm. She tastes like peppermint, and <i>wow,</i> she’s a really good kisser. By the time she pulls back, your head’s spinning.");
	output("\n\nShe left you breathless, but the only indication Holly has on her face that she just finished one of the most passionate kisses you’ve ever had is a tinge of color on her cheeks. Well, that and a bashful grin. She bites her lower lip, and...seems to nod you along?");
	output("\n\nThank...you?");
	output("\n\nShe all but moans at that, one hand tangling in your hair, the other pawing at your back. You’re treated to another lusty kiss, and by the time she pulls back from the second one, you’re grinning like an idiot. Holly smiles softly and gives you a peck on the cheek and a pat on the shoulder. <i>“See? Super easy! And little things like this form the foundation of very <b>nice</b> habits! We’ll get you on the right list in no time!”</i>");
	output("\n\nYou smile right along with her...until Molly grips the base of your cock tighter than tight. You wince and look down, only to find her smirking up at you. <i>“Just one problem with that.”</i> She lets go of your cock and crosses her arms, hip cocked to the side. <i>“You ever hear that it’s better to give than to receive? From what we’ve heard, you haven’t exactly </i>given<i> a whole lot lately.”</i>");
	output("\n\n<i>“Or received!”</i> Holly chimes in, hopping down from her perch. <i>“Molly raises a good point. ‘Naughty or nice’ isn’t just about subjective interpretations of morality. It’s about Christmas! So...”</i> She looks to Molly. <i>“Gosh. His gee-arr ratio is really kind of anemic, isn’t it? We’re going to have to bump up </i>both<i> of those numbers if we’re going to get him on the ‘nice’ list. Only...”</i> She crosses her arms and bumps her hip against Molly’s, lost in thought. <i>“I have </i>no<i> idea how we’d be able to keep his giving and receiving balanced while we increase the numbers.”</i>");
	output("\n\n<i>“Oh, don’t worry about </i>that.<i>”</i> Molly grins wide, and you gulp in anticipation. <i>“I have an idea. An awful, </i>wonderful<i> idea.”</i>");
	pc.lust(100);
	clearMenu();
	addButton(0,"Next",carolJChristmasElfDreamyWeamy3);
}
public function carolJChristmasElfDreamyWeamy3():void
{
	clearOutput();
	showName("CHRISTMAS\nGOBLINS!");
	author("Carol J.");
	output("You have to admit, you didn’t expect your Christmas to end up like this, but you’re definitely not complaining. After all, who’d complain about being naked in bed with a pair of gorgeous goblin girls? Molly’s making sure that your cock doesn’t droop so much as an inch, and Holly’s been peppering your face with kisses with every <i>“please”</i> and <i>“thank you”</i> you mindlessly murmur.");
	output("\n\n<i>“Molly, it’s really working!”</i> Holly giggles between kisses. <i>“I think this is actually going to succeed!”</i>");
	output("\n\n<i>“Don’t speak too soon, sugarplum,”</i> Molly says as she hikes one leg over your hip. She mounts you, cowgirl-style, and you gasp sharply at the sensation of her hot, wet pussy pinning your cock against your belly. <i>“A spot on the nice list isn’t something you get just by holding doors open and parroting the stuff you learn in Space Kindergarten.”</i>");
	output("\n\nShe raises her hips up, grabs ahold of your cock, positions herself carefully...and <i>drops</i> those child-bearing hips down onto your lap. Your eyes go wide as her sex envelops your cock, hot, wet, suckling. She’s tight as hell, and the pleasure only gets that much better as she begins to bounce on your lap. The wet “squelch” of her lap smacking against yours is an almost mellow counterpoint to the irresistible pleasure of her cunt wringing your prick.");
	output("\n\n<i>“You have to learn how to <b>receive!</b> Sometimes that means receiving <b>pleasure.</b>”</i> You’re staring at the ceiling, wide-eyed and gasping, but you can hear the smile on Molly’s lips.");
	output("\n\nSoon enough, you can <i>see</i> the one on Holly’s. She cups your cheek, presses her lips to your cheek, and smooths your hair. <i>“And!”</i> You can’t do much more than watch as she rises to her feet on the bed and stands over your face. You can see her slit glistening. And getting closer. <i>“You have to learn how to <b>give</b> pleasure, too!”</i>");
	output("\n\nAs Molly rides your cock, Holly sits on your face. You begin licking almost instantly, operating more on instinct than any conscious thought. Holly coos with delight at your enthusiasm, grinding down against your eager mouth and squirming. <i>“</i>G-Gosh!<i> Molly, h-he’s- He’s real eager!”</i>");
	output("\n\n<i>“Oh?”</i> Molly gives her hips a twist, and you feel your balls clench down, churning with a hot load of cum. <i>“Maybe this is gonna take less work than I thought.”</i>");
	output("\n\n<i>“Well, whoa, don’t be huh-<b>hasty!</b>”</i> Holly protests, rocking faster and faster against your face. You answer her tempo with long, broad licks up her cunt-lips, and she responds by clenching her thighs tight around your head. <i>“He’s got - mmf - potential! But he’s gotta put in a <b>lot</b> of work to do if he wants to prove he’s-”</i> She whimpers as you swirl the tip of your tongue around the bud of her clit, and it’s not long before she’s twitching on top of you. <i>“Tuh-To prove he’s actually changed for the better!”</i>");
	output("\n\nYou’re not doing much better, admittedly. Molly seems to be the only part of this equation who’s keeping her cool, and she’s doing so with infuriating ease. As you begin to instinctively buck your hips up, Molly slams hers down even harder, as if to keep you in your place. <i>“Well, you heard her! C’mon, stuff my stocking, big boy! It’s cold outside, and I wanna feel nice and <b>hot!</b>”</i> You feel her plant her hands on your belly, and Molly begins to jackhammer her hips down onto your lap. The pace is unbearable, and your eyelids flutter helplessly in response. There’s only one thing you can do with her cunt clenching around your cock, sliding up and down, milking you relentlessly-");
	output("\n\n-and it’s lick even faster, more desperately! Holly whines and keens, rutting against your face and grabbing handfuls of your hair. As you creep closer and closer to an explosive cumshot, she starts getting downright <i>desperate.</i> You can’t really see anything, but as her whimpering turns to gasping and as her gasping turns to loud, high-pitched moaning, you can tell she’s just seconds away from-");
	output("\n\n<i>“C-Cumming! Fuck!”</i> She twitches on top of you, and as her thighs tighten to a vice around your head, her sex gushes with her arousal.");
	output("\n\nNormally you might try to lap it up, but the heat and scent and sensation of the whole menage a trois has you cumming just as hard. As soon as your cock throbs with the first splurt of your orgasm, Molly slams her hips down and makes sure you’re hilted in her cunt. You empty every drop of cum you have into her pussy, and judging by the surprised coo she gives a few seconds into your orgasm, that’s a pretty admirable amount.");
	output("\n\nYour prick twitches as you pump your spunk into Molly, but as your climax begins to taper off, so does Holly’s. Soon the chipper little goblin slumps to the side, dazed and delighted at your apparent oral abilities. Molly lingers a little bit longer, but soon she rises off your dick, cum dripping from her slit.");
	output("\n\nHolly’s past words now, dreamily nuzzling up against your side and sleepily pressing kisses to your face, your neck, anywhere she can reach. You wrap an arm around her and pull her close...and do the same with Molly. She’s a bit surprised by the sudden affection, but you’re too drunk off feel-good chemicals to discriminate.");
	output("\n\nAs the saying goes, ‘tis better to give than to receive. You’re not really sure about the specifics just yet, but with these two staying over for the foreseeable future, you’re sure you’ll get the hang of it soon enough.");
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Rat's Raiders Christmas Cheer
//It's the season of giving, and it's always better to give than to receive!
//by William


/*Summary
Player must be known as the CEO by Rat's Raiders, must have read the Rodenian Codex, and must have used [Be Nice] at least five times.
Player must be docked on Zheng Shi and must trigger this event (a fairly average chance) by entering their ship during the seasonal period.
EVENT CANNOT PROC WITHOUT A PENIS OR VAGINA. Also uh, taurs can't do this. RIP.*/

//Add to Zheng Shi 'Hangar Bay'
// When PC tries to enter the ship, have a 1/6 chance to trigger the event during the seasonal period.
// Load armored group busts
public function ratsRaidingXXXmas2018ByWill():void
{
	clearOutput();
	showBust("RATS_RAIDER_GROUP_ONE","RATS_RAIDER_GROUP_TWO");
	showName("\nRATS!");
	author("William");
	output("Day in and day out... entering your ship is the same as always. A few taps on the key panel, a sterile mechanical chirp, and you’re back on board. Except for today. You’re only able to take one step through the welcoming seam of your vessel’s hull. Before the sound of [pc.footOrFeet] against metal terminates another catches you off guard. <i>“Heeeey waaaaaiiit!”</i> a girlish voice surges up the ramp.");
	output("\n\nYou turn around, reaching instinctively for your [pc.weapon] when you see not one and not three, but six of the mouse-eared pirates standing at the bottom of your ship, heaving, panting, and nervously glancing. The pink-furred Rodenian stands at the front, hefting a large red sack over her shoulder. <i>“H-hold on, wait!”</i> she calls again when your [pc.arm] hovers near the door control. <i>“");
	//ratRepLowMedHigh:
	if(!ratsPCIsGood()) output("We’re not here to mess with you or anything! Hear us out, okay?");
	else output("Umm, we’re not here to fight, [pc.mister] CEO! Please hear us out.");
	output("”</i>");
	output("\n\nA relieved huff follows when you fold your arms expectantly.");

	// Rat Rep Low-Med-High
	if(!ratsPCIsGood())
	{
		output("\n\n<i>“Look, we’re trying to do something for this ‘seasonal’ thing we saw on a video and the boss won’t let us use the hideout.”</i> She rolls her shoulders, grunting under the weight of her material burdens. <i>“Nobody else on this station is... umm, nobody else around here’s as cool as you,”</i> she whispers, expressions mixed between determined and bashful. <i>“You were um, a bit nice... and there’s nowhere else we can do this. Can we please set up on your ship? We brought you something too!”</i>");
		output("\n\nShe begs you with her green eyes. The halfbreed rats with fuzzy arms and legs lean forward, wiggling their hips - the girl her chest. Like them, the two caramel-eyed mouse boys are also staring up at you puppyishly. Almost looks like they’re about to squeak! You notice that they don’t have their batons on their waists, making the realization that Urbolg could show up at any second and they’d be helpless. You could shut the door in their faces or let them in and see where it goes.");
	}
	// Rats Respect PC (goodCEO)
	else
	{
		output("\n\n<i>“We were watching an old ‘seasonal’ video we found in the hideout and we wanted to do something we saw in it. But Mikky won’t let us use the hideout!”</i> The rodenian chews her lip. <i>“You’ve been really nice to us, and we have nowhere else to set up. Will you let us use your ship for it? W-we’re not here to take anything. In fact we- ach,”</i> she grunts, hefting the heavy bag again, <i>“we brought some stuff for you! Please, [pc.mister] CEO?”</i>");
		output("\n\nHer five friends hop in place, leaning forward cutely, wiggling their hips and tails whilst squeaking quietly. They’re definitely hopeful, but not nearly as much as the green-eyed rodenian. The mouse-pirates hold their little balled hands close to their chests, needy looks shining on their faces. You note that they don’t have their batons on them, and then also note that Urbolg isn’t around at the moment. Were he to show up, they’d be in a bit of a pickle... You could shut the door in their faces or let them in and see where it goes.");
	}
	// Merge
	processTime(10);
	clearMenu();
	addButton(0,"Close Door",closeTheDoorOnRatmas,undefined,"Close Door",(!ratsPCIsGood() ? "No way. They may not be armed, but there’s still six of them. Forget this!":"While they’re not armed, you’re not letting them on your ship."));
	addButton(1,"Let Them In",letRatmasIntoYourHeart,undefined,"Let Them In","Whatever’s going on, you can at least trust they won’t pick a fight. Let them rats on board!");
}

//[Close Door]
// Tooltip: {ratRepLowMedHigh: No way. They may not be armed, but there’s still six of them. Forget this! /goodCEO: While they’re not armed, you’re not letting them on your ship.}
public function closeTheDoorOnRatmas():void
{
	clearOutput();
	showBust("RATS_RAIDER_GROUP_ONE","RATS_RAIDER_GROUP_TWO");
	showName("\nRATS!");
	author("William");
	// Rat Rep Low, Med, High
	if(!ratsPCIsGood())
	{
		output("Not happening. You punch the button and slam the airlock in their face. You barely hear the muffled contempt for the frustrated stomping. There’s a bang against your door, probably something thrown, and then there’s a gunshot and a scramble. Looks like Urbolg isn’t happy to see them either.");
	}
	// Rats Respect PC (goodCEO)
	else
	{
		output("\n\nYou’ve spent a while in their company but you’re not keen on letting them have access to your ship. " + ("9999pcHasn’tBefriendedMikhail" == "9999pcHasn’tBefriendedMikhail" ? "You’ve yet to meet their boss, too. Until then, you’ve got to turn them down.":"It pains you to turn them down, being on good terms with their boss, but you’re not feeling up to whatever they may have planned.") + " You shake your head, telling them to go. Regret builds when their cries and groans hit your ears. The little thieves shuffle off in genuine defeat, looking sincerely crestfallen. The wound starts to close when you hit the door button.");
	}
	flags["RATMAS_2018"] = -1;
	processTime(4);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Let Them In]
// Tooltip: Whatever’s going on, you can at least trust they won’t pick a fight. Let them rats on board!
// Keep Armored Busts
public function letRatmasIntoYourHeart():void
{
	clearOutput();
	showBust("RATS_RAIDER_GROUP_ONE","RATS_RAIDER_GROUP_TWO");
	showName("\nRATS!");
	author("William");
	if(!ratsPCIsGood()) output("Alright. What’s the worst that could happen?");
	else output("You’re not sure if their uncontained eagerness helped sway your decision making, but it’s cute.");
	output(" Tilting your head, they freeze up when you open your mouth. Funny. They squeal when you jab your thumb into the ship. <i>“Ohh! Thank you! Alright, c’mon,”</i> the blonde and purple-haired rat girl scampers up, tailed by her partners. Good thing you decided fast: Urbolg’s back at work down there.");
	output("\n\nThe mischief enters your cargo bay and you punch the door button while they find an empty corner to set down at. The pink rat girl falls over, totally exhausted by the weight of whatever it was she was carrying around. From the heavy sound of it, you may have been too! <i>“Finally... Okay, okay, first things first!”</i> she presses herself back up with a <i>’hmph’</i>, fidgeting with her armor. The heaviest pieces come clattering off of her body, and everyone else’s, leaving them in fraying undersuits that barely contain their small and bulgy(!) extremities. <i>“Oomph, better!”</i> the white-furred rat shakes, but the boys are all shivering.");
	output("\n\n<i>“Little cold in here...”</i>");
	output("\n\n<i>“Relax, Jean!”</i> the pink rat pinches the tan-skinned mouse’s ear. <i>“You’ll warm right up when we find the kitchen! Uh,”</i> she gives you a pouty lip, <i>“you do have a kitchen right?”</i>");
	output("\n\nYou fold your arms again, one eyebrow arched at the two half-rats mingling too quietly. <i>“");
	if(pc.isBimbo()) output("I think you cuties owe me an explanation!");
	else if(pc.isBro()) output("Time for an explanation.");
	else if(pc.isNice()) output("First, you tell me why you’re here.");
	else if(pc.isMischievous()) output("Explain yourselves, unless you want me to kick you right back out.");
	else output("What are you up to?");
	output("”</i>");
	output("\n\n<i>“Yeah Ffion. You wouldn’t even tell me what you were carrying around; you were all ‘ohh we gotta do this now!’”</i> the white rat slaps the pink rat - Ffion - with her tail.");
	output("\n\n<i>“Chiara... You’re always hanging around Cless, of course you’re not around when we’re making plans!”</i>");
	output("\n\n<i>“Making schemes,”</i> you blurt.");
	output("\n\nFfion glowers at you, one finger furiously waggling. <i>“I’m not tellin’! It’s supposed to be a surprise, like birthday parties!”</i> she says, entirely too flustered.");
	output("\n\n<i>“Ummm, that’s not what we saw in the video,”</i> the other freckled mouse boy smirks. <i>“[pc.Mister] CEO, she’s been hyper all day. Should have seen her face when " + (!ratsPCIsGood() ? "the boss":"Mikhail") + " said no... she’s been planning for a few days.”</i>");
	output("\n\n<i>“Ohh don’t worry about it, [pc.mister] CEO!”</i> the half-rat girl says, her sultry eyes on you and her arms around her ample breasts. <i>“Don’t spoil it Rian,”</i> she pokes his cheek playfully. <i>“Ffion’s been up and down about this for days, let her have her fun! ‘Sides, we wouldn’t be here if she was wrong about you, [pc.mister] CEO!”</i>");
	output("\n\n" + (!ratsPCIsGood() ? "Ffion’s brow furrows and her snout molds into the most annoyed frown you’ve seen on any of the mice. She looks at you briefly then turns away almost embarrassedly.":"Ffion looks positively bashful when you look at her again, but she’s quick to shake the effect.") + " <i>“Alright, seriously, do you have a kitchen? We need uh, to make some stuff! There’s a lot of prep work and we can’t waste time, okay!?”</i>");
	output("\n\nYou roll your eyes, asking what’s in the bag.");
	output("\n\n<i>“Stuff!”</i> she slings back, hopping in place. <i>“You’ve got an eating room right?”</i> You inhale, but the half-rat boy laughs, causing a chain reaction of amusement.");
	output("\n\n<i>“Come on, it’ll be worth it! Promise!”</i> You sigh and nod, the bunch jumping in place and squeaking affirmatively. You give them directions, but you’ll be keeping an eye on them. <i>“Thanks, [pc.mister] CEO! You won’t regret this!”</i> they clamor, diving down and digging through their bag for aforementioned ‘stuff’. The way they position themselves keeps you from seeing what exactly it is they’re getting, but some familiar items pop out, particularly a smaller bag filled with... something doughy?");
	output("\n\n<i>“Alright!”</i> Ffion boasts, <i>“let’s go Rian, Jean! We can make the snacks and you guys can set the room up!”</i> You ask the others if she can be trusted to cook, and they all laugh at her. <i>“Of course I can! S-Screw you guys, just get to work before we get called back or something!”</i>");
	output("\n\nA resounding ‘fiiine’ bounces off the walls. Chiara and the halfbreed rats take several small boxes and parts - including electronics - one way and the mouse boys follow after Ffion to the kitchen the other way. Well, you let them on board, now you have to find out what’s going on the old fashioned way: supervision.");

	processTime(15);
	clearMenu();
	addButton(0,"Ship Hub",shipHubRatmas,undefined,"Ship Hub","What are they setting up?");
	addButton(1,"Galley",galleyRatmas2018,undefined,"Galley","What are they making?");
}
//[Ship Hub] [Galley]
//Shipboard Mischief
// Coming from [Let Them In]; different events depending on which was chosen first and second.
// PC must see both events [Ship Hub] and [Kitchen]. After seeing both events, player is checked for lactation, then offered two sex routes for having a dick and/or vagina.
// Proper ending will be [Shipboard Snuggles]


//[Ship Hub]
// Tooltip: What are they setting up?
// Load nude busts: rats_raider_rod_2 | rats_raider_boy | rats_raider_girl
public function shipHubRatmas():void
{
	clearOutput();
	showBust("RATS_RAIDER_ROD_2_NUDE","RATS_RAIDER_BOY_NUDE","RATS_RAIDER_GIRL_NUDE");
	showName("SHIP\nHUB");
	author("William");

	// First Choice
	if(flags["RATMAS_2018"] == undefined)
	{
		output("You follow the white-furred rat and the half-rodenian duo to your ship’s lounge. They drop their things and pull off the tattery scraps of cloth they wear to your immediate twinge of arousal. <i>“What?”</i> Chiara raises an eyebrow. <i>“This stuff just gets in the way. Don’t worry, we’ll clean it up later!”</i>");
		output("\n\n<i>“Yeah! It makes my fur itch too! The armor’s <b>so heavy</b> and I jus’ wanna be naked when I’m cozyin’ up somewhere!”</i> the white and green-haired girl hops, tail swishing amid the others. <i>“C’monnn, let’s get started, I’m feeling great!”</i> she says, her perky tits flopping between excited movements.");
		output("\n\nChiara knocks her on the back of the head, realigning her goals. <i>“Claes. You and Cless get on the lights, I’ll take care of Ffion’s little tree.”</i> She pries open a box with her nail, staring at the table in the center of the room. <i>“Perfect place. Don’t worry, [pc.mister] CEO, we’ve got this.”</i>");
		output("\n\nThe halfbreeds drop down, tearing open their boxes and pulling out a mishmash of cabling topped with tiny bulbs. At the ends of the wires are some rather primitive interfaces that you hope, for their sake anyway, are compatible with your ship’s grid. The black-furred boy casually darts across the room, laying down the mesh of lights along the wall in arch-like patterns. Looks like they’ve adjusted to the temperature by now." + (pc.isBimbo() ? " Gosh, his balls look really full. How can he be so focused!?":""));
		output("\n\nClaes, on the other hand, is having a devil of a time getting lights across the top of the room and above the doorways. <i>“Nng! Nn...!”</i> She hops and hops, but she’s just too small to make the distance. The nude rat’s taken aback when you slip behind her, [pc.hands] falling to her curvy waist and lifting her up. " + (pc.PQ() < 50 ? "It’s a bit of a strain, but she weighs almost nothing.":"It’s no problem for someone of your strength. She’s as light as a feather!") + " Your nose is struck by the pent-up pheromones between her creamy thighs, and when those furry limbs spread the crystalline glint of moisture is all too visible. <i>“Oohh! Thanks, [pc.mister] CEO!”</i> she chirps, laying the next breadth on an outset fixture before you let her go.");
		output("\n\nMuch like her surprisingly well-focused cohorts, the rodenian at the center meticulously tends a fake leafed tree that looks like it’s been dug out of some condemned attic. You can smell some sort of cleaning product, but the fine layer of dust along its base doesn’t escape your notice. She unruffles the branches and wraps a cord of lights around it, hanging a few finishing ornaments - gems like picardine and satyrite.");
		output("\n\n<i>“Awesome!”</i> the half-rats high-five, helping throw up some more ornaments around the room. It all looks suspiciously snug in here now, and they’ve yet to try the lights. A silly red and white cloth is draped over the otherwise plain table, and the little tree is placed at the center. You’re particularly impressed by their efficiency.");
		output("\n\n<i>“[pc.Mister] C-E-Ooo,”</i> Chiara hums. <i>“It’ll jus’ be a bit longer! You gotta let us get things really ready! No peeking, ok? Sorry " + (pc.tallness > 5*12+8 ? "big ":"") + "[pc.guyGirl], Ffion wanted it this way!”</i>");
		output("\n\nYou shrug your shoulders, trying ");
		if(pc.hasCock()) output("not to add to your erection" + (pc.hasCocks() ? "s":""));
		else output("cream yourself");
		output(" at the sight of her casually wobbling breasts. You hardly make good on that effort on your way to the kitchen.");
	}
	// Second Choice
	else
	{
		output("<i>Jingle jingle!</i> You quirk an eyebrow when you step into the lounge, eyes assaulted by garish decorations along the walls and a multitude of small, colorful lights. Is that a dog knitting? They’ve thoroughly transformed your lounge into something decidedly comfy. It’s homely, it’s nice.");
		output("\n\n<i>“Cless, fix that light, it’s dangling too much! And Claes, come here, I need...”</i> <b>Thwack</b> goes a wibbly cable on her nose. <i>“Ouch!”</i> The black and white furred rats jump where they’re needed, giggling and mingling affectionately.");
		output("\n\nChiara and Claes look inquisitively over a potted plant at the center of the table - a small, fake tree wearing lights and ornaments of picardine and satyrite. Seems they can’t get it to turn on.");
		output("\n\n<i>“Ow!”</i> Cless cries - the dark-skinned boy tripped, dragging some lights down with a loud <i>thud.</i>");
		output("\n\n<i>“Watch your tail next time, silly!”</i> Claes laughs, not even bothering to turn. You finally understand what the sound was: <i>they’ve all attached bells to their tail tips.</i>");
		output("\n\n<i>“It wasn’t my fault, it was the bell’s!”</i> he whines, fixing the damage.");
		output("\n\n<i>“Shush!”</i> Chiara snaps, tugging on a knotted cord. <i>“Dammit, I can’t... get...”</i> Her muscles strain. <i>“Claes get...”</i> <b>Snap!</b> <i>“Yeowch!!”</i> the two girls shake their hands out, but the job is done. <i>“There we go, now turn it on... Yes!”</i>");
		output("\n\nThe tree lights up, and it’s by far the most attractive piece in the room. The light glistening through the rough-cut stones is gorgeous in its own way. Quite frankly, you’ve felt nothing but comfort being here, watching them have their fun, growing excited the closer you get to whatever it is they must have planned.");
		output("\n\nYou can also smell it. A rich texture flows past your nose: cookies. Prepared with every topping or insert you could imagine.");
		output("\n\n<i>“We’re back!”</i> Ffion squeals, hurriedly setting a plate <i>stacked</i> with over two dozen cookies on the table. All of the pi-rats huddle around, looking for stools or anything to sit on, cooing ‘oohs’ and ‘ahhs’ delightfully.");
		output("\n\n<i>“[pc.Mister] CEOooohh, there’s your spot!”</i> the pink rat points to the last seat. What they’re sitting on is either too big or too small, so most of your guests end up standing or kneeling in their seats. Nothing left to do but take yours.");
	}
	processTime(20);
	pc.lust(10);
	ratmasRouting(1);
}

//[Next]
//[Galley]
// Tooltip: What are they making?
// Load nude busts: rats_raider_rod_1 | rats_raider_mouse_1 | rats_raider_mouse_2
public function galleyRatmas2018():void
{
	clearOutput();
	showBust("RATS_RAIDER_ROD_1_NUDE","RATS_RAIDER_MOUSE_1_NUDE","RATS_RAIDER_MOUSE2_NUDE");
	showName("\nGALLEY");
	author("William");
	// First Choice
	if(flags["RATMAS_2018"] == undefined)
	{
		output("You follow Ffion and her doting boys to the kitchen, watching curiously as they discard the thin undergarments covering their bodies in the corridor. <i>“Don’t worry, [pc.mister] CEO! We’ll get that cleaned up later, but it’s time to start getting cozy!”</i> the pink rat declares despite her shameless nudity. You find yourself much too distracted by the boys’ exposed manhoods and her pert, swaying chest on your way to the kitchen.");
		output("\n\n<i>“You’ve got an oven, right?”</i> the rat girl floats around, looking through the facilities in your modest galley. The mice dive through shelves and cupboards, knocking aside pots and pans, kicking up a few clouds of dust in a loud clamor. <i>“We gotta make these cookies so we can do this right!”</i>");
		output("\n\nSo that’s what she’s been carrying around. You point her in the right direction - your equipment’s not state of the art, but it’ll do. <i>“Great!”</i> she squeaks, breasts flopping wildly the more she hops up and down. The quiet, focused mouse boys to her left and right break into their own packs, and begin working the dough from hers onto the large and prepared platter. They must have practiced this in advance!");
		output("\n\nIt doesn’t keep you from asking what exactly she’s up to. <i>“No, no!”</i> Ffion’s tail does a full three-sixty swirl. <i>“It can’t be spoiled, [pc.mister] CEO! It’s gonna be awesome, but we’ve gotta work fast!”</i> The dough is handled not professionally, but lovingly. The three mice are humming together, filling that sizeable tray with ready-to-bake treats and mixing chocolate and other flavors into them at an efficient pace. Honestly it’s kind of heartwarming, though you’re not sure if that’s just the heat of the oven sliding over their food and you by proxy.");
		output("\n\n<i>“A little turn here...”</i> Ffion fiddles with the dial after slamming the oven door shut. <i>“There! Only a few more minutes- haayes!”</i> she gleams. <i>“Now, no spoiling the treat.”</i> Really, you’re spoiled by her bare tits. <i>“You go and make sure those dummies have the room ready, then we’ll have the cookies and then we’ll have fun!”</i>");
		output("\n\nHer excitement is palpable");
		if(pc.hasCock()) output(", much like the swelling of your [pc.cocksLight]");
		else output("the growing arousal in your [pc.pussies]");
		output(". You sigh, catching the poised, placid smiles of her chocolate-covered friends before heading to the lounge. The squeaks in the background are kinda cute, though.");
	}
	// Second Choice
	else
	{
		output("First you hear the squeaks, then you see the discarded clothes... and then you smell what’s cookin’. Entering the kitchen you nearly forget that you’ve given a bunch of mice access to your ship, finding yourself subdued by an awfully rich, thick smell and, of course, the sight of three exposed rats.");
		output("\n\n<i>“Rian, stop it, that’s not-”</i> Ffion stammers, finally noticing you enter. <i>“Oh, [pc.mister] CEO! Don’t try to eat any yet, you can’t be spoiled!”</i> she shakes her butt, tail swishing cutely near the others. The mouse-boys busily plate their beautifully made treats, stacking over two dozen cookies onto the biggest plate they could find.");
		output("\n\nConsidering how things have gone so far, you’re not keen on spoiling yourself to her great relief. You’re still not convinced letting them on was the best idea, but you can’t deny you want to see where this goes. They bid you to follow them from the messy galley room, and back to the lounge you go.");
	}
	// Merge
	output("\n\n<i>“Thanks for this, [pc.mister] CEO! And now, we get to have some fun!”</i> Ffion says, her tail caressing your ankle while you head down the corridor with the other two boys. Fun sounds good" + (pc.isBimbo() ? ", particularly with those two cum-swollen balls jiggling and jostling on the balanced movements":"") + "!");
	output("\n\n<i>Jingle jingle!</i> Before you even enter the lounge you can hear the tolling of bells. You see them attached to the tails of the other rats who’ve prepared the room. Multicolored lights and garish seasonal decorations garnish your walls, yet it all feels... very nice. They’ve thoroughly transformed your lounge into a comfy, homely place and set a table with whatever they could find to pass as a seat or chair.");
	output("\n\nAll that’s left is for them to set the cookies down. Cute ‘oohs’ and ‘ahhs’ at the sight and smell of those well-baked snacks fill your ears. They all take their seats, the pink rat pointing to yours. <i>“There you go, [pc.mister] CEO!”</i> Nothing left to do but take it.");

	processTime(20);
	pc.lust(10);
	ratmasRouting(2);
}

//1 = first option done, 2 = second option, 3 = cumplete :3
public function ratmasRouting(arg:int = 1):void
{
	if(flags["RATMAS_2018"] == undefined) flags["RATMAS_2018"] = arg;
	else flags["RATMAS_2018"] = 3;
	if(flags["RATMAS_2018"] == 1) setButtonDisabled(0);
	else if(flags["RATMAS_2018"] == 2) setButtonDisabled(1);
	else
	{
		clearMenu();
		addButton(0,"Next",ratmas2018TheBeginningOfTheLoooood);
	}
}

//Shipboard Ratsmas
// PC can offer to breastfeed rats if lactating
// PC must have genitals to begin an orgy.
// Load nude busts rat_group1_nude and rat_group2_nude
public function ratmas2018TheBeginningOfTheLoooood():void
{
	clearOutput();
	showBust("RATS_RAIDER_GROUP_ONE_NUDE","RATS_RAIDER_GROUP_TWO_NUDE");
	showName("ALL\nTOGETHER");
	author("William");
	output("<i>“It’s just like the video, hehe!”</i> Ffion laughs, eyes darting all over - to the cookies, to her friends, and of course to linger on you. <i>“" + (!ratsPCIsGood()? "The boss":"Mikky") + " has all these old videos he lets us watch and we found this one really far back, and I really loved it! Terrans call it ‘Christmas’! Humans like to give away stuff on holidays. You guys remember Ronasca right?”</i>");
	output("\n\nThe other rats make affirmative noises, Chiara in particular. <i>“Oh, that’s what got you so fired up? Thinking about our last share?”</i>");
	output("\n\n<i>“Yeah! And we haven’t been able to do <b>anything</b> for months bein’ stuck on this stupid station!”</i> she whines. <i>“" + (!ratsPCIsGood() ? "That is, until you came by, [pc.mister] CEO!":"But then we met you, [pc.mister] CEO, and you’re the best thing that’s happened to us!") + " And I... I uh, you’re like the only person we could have asked to do this. We took all this stuff from the hideout. We collect stuff, ‘ya know!”</i>");
	output("\n\nYou nod, wearing a dopey smile as she leans over the table. <i>“Christmas is all about givin’ gifts and having fun, ‘n there’s nothing we like more! So before we do the gifts, let’s eat!”</i>");
	output("\n\n<i>“About time!”</i> Claes chirps, the first one to snatch a cookie, followed by Cless, Rian, and Jean. Chiara and Ffion both wait until you take one - a classic chocolate chip cookie.");
	output("\n\nYou can see the sugar glistening on its crumbly form. The dark chips have melted splendidly, and while you hold it at an angle that pyroclastic flow of deliciousness is already sagging to one side. It comes apart easily in your hand, strands of cocoa-colored goodness tapering and peeling apart in the confectionery gap. Biting into it is heavenly. Your face flushes while your brain tries to cope with its divine heat and flavor. The pink rodenian sitting across from you takes great delight in your reaction, her buckteeth sinking into her lower lip, holding back a happy squeak.");
	output("\n\nAll her care and gratitude went into making this treat for you and her friends. This... this is what a get together is all about. Unquestionably, <i>it’s fucking amazing.</i> Jean and Rian, the freckled boys to your right, are letting their bashful poise collapse in enjoyment.");
	output("\n\nHappiness ignites all around. The effect is the same for every one of them, and they’re not shying away from saying as much. <i>“Ohhh, it’s been so long since we made anything different!”</i>");
	output("\n\n<i>“Geez, you went all in... where did you get this stuff, Ffion?”</i> Chiara asks, wiping her lip.");
	output("\n\nThe pink girl blushes right through her fur, offering no answer. The eating continues, every flake of crust melting away the second it lands on grateful tongues. You try another, one with caramel drizzled atop it. It somehow tastes even better. No matter how many you eat, there seems to be no end.");
	if(!pc.isLactating()) output(" If only you had some <b>milk to wash it all down with...</b>");
	else if(!InCollection(pc.milkType,[GLOBAL.FLUID_TYPE_MILK,GLOBAL.FLUID_TYPE_CHOCOLATE_MILK,GLOBAL.FLUID_TYPE_STRAWBERRY_MILK,GLOBAL.FLUID_TYPE_LEITHAN_MILK])) output( "<b>If only you had regular milk</b>... you could have <b>washed it down with some milk!</b>");
	// PC not lactating
	if(!pc.isLactating() || pc.hasFuckableNipples() || pc.milkQ() < 300)
	{
		output("\n\nThe room volume softens to a chorus of mingling, your dish-eared guests talking about old jobs and the memories they had while doing them. Some part of you admires their conversation about helping others, though. Past the pirate exterior <i>(and all the other behavior you’ve endured...)</i> they are certainly true to their word.");
		output("\n\n<i>“Remember when we were on Midas? We found that hidden Pyrite warehouse and made off with our biggest haul that year!”</i> Cless pipes up after another munch.");
		output("\n\n<i>“Yeah! Chiara made that a lot easier. She really knows how to charm people when she wants,”</i> Jean quips, though Rian looks a little perturbed.");
		output("\n\n<i>“I-it was a little too dangerous...”</i> he murmurs, looking down. <i>“Chiara could have had her... you know... her gland used against her.”</i>");
		output("\n\n<i>“Awww, why you gotta go spoilin’ the moment?”</i> the white rat frowns. <i>“I was wearin’ my gear! They weren’t gonna earfuck me into their puppet; everyone else was right behind me!”</i> She huffs and smiles, looking rather coy. <i>“I see you need your gift early.”</i>");
		output("\n\nShe dives under the table in the blink of an eye. The fair-skinned boy yelps and finds that lusty rodenian in his lap, licking at his flaccid dong. <i>“Heyyy, you can’t leave me out!”</i> Cless pouts, following after her to do who knows what. Everything falls apart - you can’t see Claes either.");
		output("\n\nOh.");
		output("\n\nThe blue-eyed rat’s crawling between your legs. An impish simper rumbles up her throat as she presses her nose into your crotch" + (!pc.isCrotchExposed() ? " and fidgets with your [pc.crotchCovers]":"") + ". Guess they want to have a little fun before bed.");
		processTime(25);
		pc.lust(25);
	}
	// PC lactating (MUST HAVE Normal or Inverted Nipples NOTHING ELSE! Also, Gooey/Cum/Girlcum cannot be the PC’s lactation)
	else
	{
		output("\n\nWait... <b>You can’t have cookies without milk!</b> And your [pc.breasts] are <i>sloshing!</i> The effect hadn’t been so pronounced before... but oh man you can’t resist smiling. You feel so <i>hot</i> and content, full of love to give! These mice aren’t your enemies here. Malice doesn’t exist in this room, only tacit appreciation. Your guests stop what they’re doing when you " + (!pc.isChestExposed() ? "uncover your chest and ":"") + "bare your milk-filled boobs to them.");
		if(pc.isBimbo()) output(" <i>“Mmm, I bet you’re all kind of thirsty after that!”</i> you purr.");
		else if(pc.isBro()) output(" <i>“We’re missing something,”</i> you murmur.");
		else if(pc.isNice()) output(" <i>“I have a gift of my own,”</i> you smile.");
		else if(pc.isMischievous()) output(" <i>“You guys forgot something. I didn’t,”</i> you grin.");
		else output(" <i>“Luckily I came prepared, too,”</i> you smirk.”</i>");

		output("\n\nYou curl two fingers around one [pc.nipple], [pc.milkColor] beads bubbling out. There’s a relieving of pressure that makes you coo, but the mice are totally mesmerized. You urge them to hurry before you spill any more.");
		output("\n\n<i>“No way! You can’t waste that, [pc.mister] CEO!”</i> Jean, the tan-skinned boy scrambles over, nearly tripping over himself to be the first. Of course you welcome him into your embrace, draping your right arm around him and your left around the half-rat girl. Faces red as tomatoes, they inhale through their noses and clamp down on your teats right away, " + (pc.hasInvertedNipples() ? "front teeth pressing into the tops":"tongues swishing around the peaks to dig out the milk dripping buds") + ". <i>“Umhh, it’s so warm!”</i>");
		output("\n\nHis comments only make the others fidget harder!");
		output("\n\nThey’re both so forceful that wincing is natural. But you let it go, content to run your [pc.hands] through their hair and flick at their big round ears. Unbroken streams of [pc.milk] flow into their mouths, and the gulps and suckles are as eager as the squeaks muffled beneath the [pc.milkVisc] streams. <i>“Ohh please hurry, I wanna drink too!”</i> Cless whines, waiting impatiently behind his opposite. Rian and Chiara have also lined up, though, curiously, Ffion is waiting across the table. You wink at her, motioning with your head that she should get over here.");
		output("\n\nYou can feel the tiny crumbles and remnants of chocolate in Jean’s mouth dotting the sides of his gleeful tongue. Oral muscles press out greater loads of [pc.raceShort]-cream, almost too much - it dribbles down the edges of their upquirked smiles. After four more swallows, you reluctantly usher them aside to let the next two in line have a taste. Cless and Rian, wearing honeyed smiles, take their place under your arms, tenderly cupping the undersides of your milk-tanks and coaxing out their share of [pc.milkNoun].");
		output("\n\n‘Squish’, ‘Lick’, ‘Tsk’, the rats give you the milking you need one [pc.milkFlavor]-flavored suckle at a time, but Ffion is still so very shy. You can’t fathom why, but her white-furred friend pushes her into it. The boys’ hollowed cheeks have drained a lot, but there’s still just a little too much weighing you down, and those last reserves belong in rodenian bellies.");
		output("\n\n<i>“Ummm, if it’s okay...”</i> the pink rat squirms, prompting others to laugh at her with slightly distended bellies and mouthfuls of fattening food. Bubbly burps and loud munches indicate no lack of fulfillment, but there’s a familiar smell in the air that triggers your libido. Chiara squeaks when you give her a good rub between the ears, but Ffion shivers and moans when you align her parched lips with your [pc.milkyNipple]. <i>“I uh, it’s better to give for us, though...”</i>");
		output("\n\n<i>“Receiving is fine, too,”</i> you remind her, pushing your breast past her mousey teeth in an act of assertive . She writhes with something more like lustful need when a gout of [pc.milkNoun] puffs out her snout. The drag of her buck tooth against your jutting teat is also unfathomably pleasurable. You try not to make it obvious, but you’re giving her the hardest scritching out of all of the bunch.");
		output("\n\n<i>Slurrrp.</i> The red and green eyed rodenians mewl softly against your [pc.skinFurScales], sending ripples through pliant titflesh. Your moans are encouraged, and your eyes begin to roll back from a lactic-induced mini-orgasm. " + (!pc.isCrotchExposed() ? "Even through your clothes, y":"Y") + "ou can’t hide how horny you are anymore. " + (!pc.isCrotchExposed() ? "Fluid sloughs inside your [pc.crotchCoverUnder] as t":"T") + "he last stubborn drops are pulled from your glands." + (pc.milkType == GLOBAL.FLUID_TYPE_CHOCOLATE_MILK ? " Geez, now you’re missing something else to go with all this hot cocoa: marshmallows!!":""));
		output("\n\nThe two rodenians disentangle, though Ffion stays close. Unblinking moist eyes stay focused on yours. You glance sideways, feeling fuzzy, like you’re in some half-fugue state, and spot Claes on all fours pressing her wrinkling nose close to your crotch. The three boys can’t hide the smell of their musk either: pre drips from their fully erect cocks. Looks like they want to have a little fun before bed.");
		processTime(25);
		pc.lust(25);
		pc.milked();
	}
	clearMenu();
	//[Fuck Claes] [Lap Ride] [No Sex]
	if(pc.cockThatFits(150) >= 0) addButton(0,"Fuck Claes",cockSelect,[fuckClaesWivDickeriDoo,150,false,0],"Fuck Claes","The rat slut wants your dick. Why deny her?");
	else addDisabledButton(0,"Fuck Claes","Fuck Claes","You need a penis that would fit inside the rat slut for that.");
	if(pc.hasVagina()) addButton(1,"Lap Ride",lapRide2018VagStuff,undefined,"Lap Ride","She can lick you, but Jean can join in too.");
	else addDisabledButton(1,"Lap Ride","Lap Ride","You need a vagina for this.");
}

//[Fuck Claes]
// Tooltip: The rat slut wants your dick. Why deny her?
// NEED DICK
public function fuckClaesWivDickeriDoo(x:int):void
{
	clearOutput();
	showName("\nCLAES");
	showBust("RATS_RAIDER_GIRL_NUDE");
	author("William");
	output("No sense in holding back then. Sniffles only " + (pc.isCrotchExposed() ? "add to the throb of your [pc.cocksLight]":"tighten the bulge you’re working to release") + ". Claes drapes your [pc.cock " + x + "] over her face, stroking your swelling urethra with her lips and nose until a fattening wad of precum sags and drips from the tip. It falls right into her throat, and wordlessly, she inhales your [pc.cockHead " + x + "] and jams it against her hollowing cheek. Her buckteeth drag smoothly across the top while her tail weaves around and squeezes the [pc.base " + x + "]" + (pc.hasKnot(x) ? ", tyrannizing your knot to greater swelling":"") + ". <i>“Mmhhhh soooo goood,”</i> she giggles, smiling around the tip.");
	output("\n\nYou grip her by the ear and grunt, thrusting just a bit deeper until you’re batting against her tonsil. Cuntjuice puddles between her legs while her fuzzy hands ");
	if(pc.balls > 0) output("help brew a greater load of [pc.cumNoun] in your [pc.sack]");
	else if(pc.hasVagina()) output("slither for your [pc.vaginaNoun], smearing femjuice along your [pc.cockType " + x + "] shaft");
	else output("jack the inches of [pc.cockType " + x + "] flesh her mouth isn’t busy with");
	output(". The she-rat is caught off guard when you grip her head on either side and thrust in, taking out your built-up lust on her plush lips and unresistant throat.");
	output("\n\nHappy moans rumble through your girth" + (pc.cockTotal() > 2 ? ", your extra [pc.cocksLight] flopping across her ears and brow":"") + ". Preseed squirts into her throat, moistening that well-trained neck for a few more vicious thrusts. You’re not aiming to face fuck her into stupidity, only getting ready to flop the mischievous thief on the table and rail her cunt right in front of her friends. <i>Whap-whap;</i> your hips slam against her face, your [pc.cockNoun " + x + "] slotting " + (pc.balls > 0 ? "balls-":"") + "deep" + (pc.balls > 0 && pc.ballDiameter() >= 2 ? ", slapping those cum-taut orbs off her chin too":"") + ".");
	output("\n\nClaes sputters when you pull out, thrusting spastically against her cheek. <i>“That’s a start,”</i> you grunt, grabbing her under the arms and throwing her on the table. Chiara has her boys well in hand, sucking and jerking the three of them like a pornstar. Shit, that almost makes you blow over the half-rat’s crotch! <i>“C’monnn [pc.mister] CEO! Look at how hot and big my pussy is! Big ‘ol clit for you to fuck right into m-Hie-KK!”</i>");
	output("\n\nShe squeaks when you ram into that sopping wet crease, spraying her squirting juices in a dewy corona. You lean down far enough for her to wrap her arms around your neck and her ribboned tail around your waist, bucking your hips so hard that the table rattles and cookies crumble. <i>“Yes! [pc.Mister] CEO! I love iiitt, make sure to hit my clitty!”</i> she screams, finally wrapping her legs around you when the little tree falls over too.");
	pc.cockChange();
	output("\n\nIt occurs to you that there may have been something in those cookies for this occasion, but then you also remind yourself these rats don’t get laid enough. Good thing you’re here to take care of this one! She draws you into a kiss, encouraging you to play with her sweat-dripping teats.");
	output("\n\nThe hot and steamy vice of her puffy pink pussy squeezes around your rock-hard [pc.cockNoun " + x + "], all the nerves you’re pounding returning the effect in kind. Slavering cunny walls suck you deeper, shortening your intervals and the amount of dick that’s outside of her needy canal at any given time. The boys nearby squeal in orgasm, firing off ropes of cum that land near you when their cocksucker can’t catch it.");
	output("\n\nBut your [pc.eyes] are on Claes, only her right now. Ffion crawls behind you, gripping your [pc.ass] and teasing whatever she can in your rapid thrusts. Following a clench in your [pc.balls] the orgasmically squirming rat-bitch gets what she wants: the first ");
	if(pc.cumQ() > 100)
	{
		if(pc.cumQ() < 1000) output("powerful ");
		else output("titanic ");
	}
	output("rope of [pc.cum]. You hilt her in a painfully awkward position" + (pc.balls > 1 ? ", Ffion’s paws kneading out your successive cumshots, dutifully handling your contracting nuts":"") + ". [pc.CumColor] spooge drips from her gushy crease" + (pc.cockTotal() > 2 ? " and shoots from your extra [pc.cocksLight] onto her chest and face":"") + ".");
	output("\n\n<i>“M-me too, [pc.mister] CEO...”</i> Ffion whispers. You’ve " + (pc.cumQ() < 100 ? "barely filled":"packed") + " Claes’ womb" + (pc.cumQ() >= 25000 ? " to the breaking point":"") + " and those words excite your cum-smattered rod for the prospect of round two. You whip around, obscuring the small rat beneath your dick. <i>“Ohh...”</i> she hums, kissing the [pc.cockHead " + x + "] and turning to the side, tilting her head to the right and presenting you with her eargina.");
	output("\n\nPre and cunt-slime fall in ropes, singing the flesh of her ear just before you aim down and thrust. <i>“Ahhh!”</i> she screams, tongue falling from her mouth immediately as you descend into her alien depths. An all-consuming lust burrows into your head while your [pc.cockNoun " + x + "] seeks the depraved limit of her unique biology. Cranial pussy hugs tighter than any normal twat, making the friction of your rhythmic pumps oh-so pleasurable.");
	output("\n\nFfion cranes upwards, grinding your dick against her skull with the change of position" + (pc.balls > 0 ? ", eager to lap at your [pc.sack]":"") + ". She gives you total control of her body, of her mind, but all you can do is grunt and groan, satisfying your desires with the joys of rodenian earcunt. Her sleek tunnels hollow greedily, squelching with all the slickness you’ve dumped into her.");
	output("\n\nLusty squeaks and firm little thigh hugs, for some reason, gradually darken your vision. Some mental force asserts itself on your mind, and you find yourself in some place out of a TV show or book. A positive winter wonderland surrounds you and your pink-furred earslut, snowflakes falling around lavishly wrapped gifts and colorfully decorated trees. When you look down and thrust again, a twinge in your mind bids you to cum.");
	output("\n\nAnd this time, when you burst, you are robbed of your senses. You are given a modicum of time to feel your [pc.cum] flowing to her boob-wombs, splattering back against you on slowing gyrations. Cacophonous orgasm rages around you - not just your voice. One powerful throb more, and you’re gone like the shooting star in that bright night sky.");
	processTime(30);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",shippyBoardSnugglies);
}

//[Lap Ride]
// Tooltip: She can lick you, but Jean can join in too.
// NEED PUSS
public function lapRide2018VagStuff():void
{
	clearOutput();
	showBust("RATS_RAIDER_GIRL_NUDE");
	showName("LAP\nRIDE");
	author("William");
	output("The tan and freckled mouse-boy looks left out. Sure, Chiara could tend to him, but you and Claes can help make his night something special. You tap the half-rat girl’s head and stand, sauntering over to the needy mouse-boi. <i>“[pc.Mister] CEO...”</i> He shuffles, looking away nervously with bright red cheeks. All it takes is one caress of your [pc.hand] and he eases up, spreading his legs and giving you room to sit!");
	output("\n\nYou turn around and press against his lap, putting weight on his fat balls and squeezing his cock into your butt-cleavage. You take your seat" + (pc.legCount > 1 ? ", squishing his alluring cock between your [pc.thighs]":", nestling his cock deep between the cheeks of your [pc.ass]") + ". <i>“O-oh... T-that feels really good, [pc.mister] CEO!”</i> he stammers cutely, ears twitching. You guide his hands to your " + (pc.biggestTitSize() >= 1 ? "[pc.breasts]":"[pc.pussies]") + ", giggling when he takes the cue" + (pc.isLactating() && pc.biggestTitSize() >= 1 ? ", squirting [pc.milkNoun] onto Claes’ hair with insistent rubs":"") + ".");
	output("\n\nClaes sets herself down in front of you again, eager to ");
	if(pc.hasCock()) output("wrap her lips around your [pc.cockNounBiggest]");
	else output("tongue over [pc.eachPussy]");
	output(". That fleshy spear rings " + (pc.hasCock() ? "[pc.cockHeadBiggest]":"[pc.oneClit]") + " lovingly, gliding up and down your ");
	if(!pc.hasCock())
	{
		if(pc.vaginalPuffiness(0) > 0) output("puffy ");
		output("vulva");
	}
	else output("rigid rod" + (pc.hasCocks() ? "s":""));
	if(pc.balls > 0) output(", wriggling into your nutsack and inhaling your ballmusk");
	output(".");
	output("\n\nJean’s hot tip balloons into greater arousal " + (pc.legCount > 1 ? "between your smothering [pc.legsNoun]":"in the depths of your [pc.ass]") + ". He can’t hump or move; that’s your job. The mouse toy’s job is to sit there and let you buck into his pelvis and play with his delightfully warm dick. Mouse-pre bubbles and splatters on every up and down gyration, sprays on each swivel - his musky heat spreads across your lower body. On his lap you rock yourself in a slow, sensual clockwise motion, steadying your [pc.arm] around his neck");
	if(pc.legCount > 1) output(" while your [pc.pussyNoun] " + (!pc.isSquirter() ? "gently coats his shaft with [pc.girlCumNoun]":"sprays [pc.girlCumNoun] against his broad shaft"));
	output(". Stars does he feel so hard! His boner could ram through steel. His twitching tool is a perfect example of why big dicks aren’t always better!");
	output("\n\n" + (pc.legCount > 1 ? "When Claes isn’t sucking your clitty and spreading your pussy for her tongue, she’s nuzzling what little cock emerges between your [pc.thighs] and peppering those sensitive nerves with plenty of spit-flecked kisses, being rewarded with stomach-filling batches of boyjizz for her troubles. It only betters her treatment of you!":"When you buck into Jean’s lap and smush his cock to his belly, you thrust back against Claes’ invading tongue, bringing her nearer to your womb and untouched nerves of pussyflesh. Pre smears your ass while girljuice smears a rat slut’s face."));
	output("\n\nTo your left, Chiara swaps cocks like a star, sucking Cless and Rian off in equal measure and pumping whichever tender, slick shaft isn’t between her plush lips. Her work earns her a creamy reward right from the two of them. Where’s yours...?");
	output("\n\n<i>“I-I’m...”</i> Jean whimpers, and you can feel his balls contracting under your sensual weight. One rope, two ropes of mouse-jizz fly through the air, landing on you " + (pc.legCount > 1 ? "and Claes ":"") + "together. You push back into his lap just a bit harder, making sure those rhythmically clenching nuts are churning out as much as possible. His cute squeaks and moans have you cumming too, creaming your cunt-kisser’s face" + (pc.legCount > 1 ? " and his mast":"") + ".");
	if(pc.hasCock()) output(" Your [pc.cocksLight] dribble" + (pc.cockTotal() == 1 ? "s":"") + " out a few loads that only shine your prick" + (pc.hasCocks() ? "s":"") + " with [pc.cumColor] spooge.");
	output("\n\nOne orgasm isn’t going to cut it, but before you can react, Ffion suddenly seats herself on your lap. The stool you’re sitting on falls away and you both collapse on his sprawled form, sandwiching his cum-sensitive cock between your crotches. <i>“[pc.Mister] CEO, me too, okay..?”</i> she murmurs, <i>“please use me too...!”</i> The pink rat pushes you down until your heads are close to the freckled boy’s. Jean’s hands squirm for your [pc.chest] while the pink rat locks her lips to yours.");
	output("\n\nFfion’s hands clasp around your wrists, guiding them to her ears and shoving them through the smooth, frictionless interior until your fingers are swallowed up by her cranial pussies. Almost immediately some mental force numbs your body and you lose sight of her. Not that it mattered with that short, hungry snout grinding against your [pc.face]. She groans into your mouth and writhes with some deep-set need to ravish you and be ravished back.");
	output("\n\nAnd so you do. You flex your fingers in those depraved canals, doing whatever you think is most pleasurable to tease her pussies into convulsions of wanton pleasure. The effluence on your hand makes your passage through her wet tunnels easier, and soon you’ve lost your wrists into the heavenly vice of rodenian earcunt.");
	output("\n\nYou can feel Jean humping for dear life under your combined weight. Your rat isn’t even kissing back, you’re just sucking on her tongue. She has no control that matters aside from voicing her pleasure through your skull. Who even knows what Claes is doing, but if you understand her well enough, she’s got her nose impaled in either of your holes.");
	output("\n\nSome sort of whiplash assails your mind, and all of a sudden you find yourself in some sort of place right out of a TV show or book. You’re lying in the snow of a winter wonderland, surrounding by falling snowflakes, lavishly wrapped gifts, and colorfully decorated trees topped with gorgeous stars - and Ffion right on top of you, making out with you. It’s almost too hard to keep up with her once-hidden hunger for more...");
	output("\n\nYou’re cumming, and it’s more powerful than you feel it should be, given this position. You squirt");
	if(pc.hasCock()) output(", and your [pc.cocks] spurt" + (pc.cockTotal() == 1 ? "s":""));
	output(". You’re suddenly robbed of sense in this cacophonous orgasm. Voices not your own ring out in a chorus of debauchery - you’re all cumming and screaming, and it’s all any of you need to do. One powerful clench of your vaginal muscles more, and you’re gone like the shooting star in that bright night sky.");
	processTime(30);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",shippyBoardSnugglies);
}

//Shipboard Snuggles
// PC is given gifts at the end, random amounts of credits and gems.
// PC is given Claes’ Panties (Key Item!) if they are friends with the rats (goodCEO)
public function shippyBoardSnugglies():void
{
	clearOutput();
	showBust("RATS_RAIDER_GROUP_ONE_NUDE","RATS_RAIDER_GROUP_TWO_NUDE");
	showName("\nSNUGGLES");
	author("William");
	output("You’re floating in an endless sky. It should be cold, but there’s no such discomfort. You’re sailing through puffy white clouds, the sun at your back, and you fly over a blanketed land. It’s peaceful. More peaceful than most places you’ve been. If you could conjure up this kind of fantasy at any time, you’d probably get better sleep. It’s easy to dive in and out of the atmosphere above a snow-blanketed land of tranquility.");
	output("\n\nBut when you turn to face the sun, your eyes open in the real world.");

	output("\n\nYou gasp and breathe, coming to on your bed. When you blink twice, you find all six rats curled up with extra blankets on your mattress, snuggled up on you, each other, or on each other. You swallow, exhale, and look to your left. Ffion hugs your left [pc.arm] tight, head cradled against your neck. Quiet snoozes overlay the background hum of Zheng Shi. You wish this didn’t have to end.");
	output("\n\n<b>Schwing, Schwing! Schwing, Schwing!</b>");
	output("\n\n<i>“Baaaahhh!”</i> Chiara shoots up. <i>“Aww... already?”</i> she groggily complains, diving for a pile of stuff in your bedroom corner and silencing that frustrating mechanical chime. <i>“Everyone up! Boss needs us! Crap, and I wanted to take a shower first. Quickly now, quick!”</i>");
	output("\n\nEveryone jumps from your bed and blankets fly everywhere. You don’t mind though, because your rodenian lover isn’t ready to go just yet either. You turn to face her; a small smile on her lips is barely hidden by her teeth. There’s a simper followed by a jingle - her tail swerves around. When she angles that prehensile tendril above your heads she flicks her eyes meaningfully towards it. As do you.");
	output("\n\nA few fake leaves, small red berries, and two tiny bells make up a strange evergreen accoutrement on her tail. " + (pc.IQ() < 20 ? "You don’t know what that is, and struggle to understand her meaning.":"It’s... <b>Mistletoe</b>. And you’re under it."));
	output("\n\nWhen you look back down, her snout is extended, her lips are puckered and her eyes are closed" + (pc.IQ() < 20 ? " like she’s waiting for a kiss":", and she’s waiting for that kiss") + ".");
	processTime(60);
	restHeal();
	clearMenu();
	addButton(0,"Do It",doItKissDat2018RatMouf);
	addButton(1,"Don’t",dontSmooch2018Rats);
}

//[Do It]
public function doItKissDat2018RatMouf():void
{
	clearOutput();
	showName("\nSMOOCH");
	showBust("RATS_RAIDER_ROD_1_NUDE");
	author("William");
	output("You happily press your face into hers, giving her that kiss she so badly wants. For a few precious seconds your tongues intertwine, curling tastefully as your wet lips slide and smack against each other. Praises from the others only add to this somehow. It’s not a long kiss, but it’s long enough. She kisses your nose then your cheek, a gleaming smile reflecting in your [pc.eyes].");
	output("\n\nWhen she stands, they all gather at your door. <i>“Sorry, [pc.mister] CEO, we gotta go! We cleaned up for you last night, and your gifts are under your pillow! See ‘ya!”</i>");
	processTime(5);
	flags["RATMAS_2018"] = 2;
	pc.lust(3);
	clearMenu();
	addButton(0,"Next",epilogueRats2018cribmass);
}

public function dontSmooch2018Rats():void
{
	clearOutput();
	showName("SMOOCH\nFREE ZONE");
	showBust("RATS_RAIDER_ROD_1_NUDE");
	author("William");
	output("You shake your head, and Ffion looks more than a little disappointed. With a long huff, she disentangles and gathers herself with the other five at your door. <i>“Sorry, [pc.mister] CEO, we gotta run. We cleaned up last night, and your gifts are under your pillow! See ‘ya!”</i>");
	// Merge
	flags["RATMAS_2018"] = 1;
	processTime(5);
	pc.lust(3);
	clearMenu();
	addButton(0,"Next",epilogueRats2018cribmass);
}

public function epilogueRats2018cribmass():void
{
	clearOutput();
	showName("MERRY\nCHRISTMAS!");
	author("William");
	output("After the troupe frantically sprint back home (hopefully they don’t get klepto), you sit up and look under your pillow as instructed. " + (!ratsPCIsGood() ? "Only one box is there, small, but it feels heavy.":"There’s two boxes, small, one heavy and one light") + ". You open " + (!ratsPCIsGood() ? "it":"the first") + ", finding an assortment of credits and shiny baubles. Aww.");
	if(ratsPCIsGood()) 
	{
		output("\n\nAs for the second... It’s not even closed correctly. When you tilt it, a feathery pair of silky white panties with green, ribbony side ties falls out along with a hastily scrawled note. <b>Love, Claes!</b> You gulp, then take a whiff of that colorful lingerie. They’re clean, but that faint pheromone signature is definitely hers. Nice.");
		pc.createKeyItem("Panties - Claes's - Silky white panties with green ribbon ties.");
		output("\n\n(<b>Gained Key Item: Panties - Claes’s</b>.)");
	}
	output("\n\nCurious that a bunch of pirates would want to celebrate a holiday, but damn if it wasn’t worth it. The cookies, the sex... wonder what’s in store for next year?");
	output("\n\n<b>You gain 8008 Credits!</b>");
	pc.credits += 8008;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Crimbus at Gwenimears
//50/50 to get either this or christmas shopping with gwen from last year when doing [hangout] on christmas
public function gardefordsGwenmas2018():void
{
	clearOutput();
	author("Gardeford");
	showCarbonado();

	output("You stop at the entrance to Carbonado, but see no one waiting to meet you. For a moment you think you may have missed them, but your codex beeps out a mail notification. You check it and find a message from Eimear.");
	output("\n\n<i>“Hey [pc.name], Sorry we couldn’t be there to meet you, but Gwen had something to finish up and I wanted to get started on cooking. Come right on down though, I’ll let you in and we can wait for her to get back ;)”</i>");
	output("\n\nYou grin and head toward the personnel section of the great lift, happy to be included in whatever plans the two have for the holiday. You step out into the chill air of Uveto proper and move as quickly as you can toward Gwen and Eimear’s house. ");
	//heat-belt:
	if(pc.hasItemByClass(HeatBelt)) output("The heat belt keeps you pretty comfortable in the lower temperatures, but you still want to get there as quick as you can without slipping.");
	else output("The city might be under the ice and mostly free from the wind, but that doesn’t make it any more comfortable.");
	output(" It’s pretty easy to find the couple’s apartment, as close as it is to the lift, and the door opens mere moments after you press the ringer.");

	output("\n\n<i>“Welcome! Just sit anywhere on the couch, I’ll be over once I finish this quiche,”</i> Eimear waves from the kitchen area. You head over and plop down on the couple’s deluxe hydrophobic couch. You can’t help but notice the stack of presents just in front of the tv, or at least the one gigantic present in particular. There are a handful of boxes, but this one by itself is " + (pc.tallness < 4*12 ? "taller than you are!":"noticeably larger.") + " Could it be some kind of hoverbike? The smell of fluffy quiche fills the air as Eimear cooks, occasionally glancing in your direction.");
	output("\n\n<i>“Gwen should be coming any second now. She was </i>very<i> excited to have you over for christmas,”</i> she pipes up after a few minutes of waiting. There’s something a little too coy about the smile she gives you as she talks. You glance back at the present, doing some mental math as you reach for the small card tied to one corner. It reads:\n\t<b>To: [pc.name] From: Gwen, Happy Christmas, can’t wait for you to open your gift!!!</b>\n\nIt couldn’t be...");
	output("\n\n<i>“So... uh, what’s in the box?”</i> you ask, " + (pc.isMischievous() ? "unable to stop yourself from breaking out into a chuckle.":"cocking an eyebrow at the diligent cook."));
	output("\n\n<i>“Real funny, you know damn well </i>who’s<i> in the box,”</i> Eimear laughs, leaving her cookery on the counter as she strides over to help you with opening the giant present. When she wrenches the top off, each of the four sides fall to the floor. You’d had your guesses, but the actual contents of the package manage to surprise you still. Gwen is inside, of course, but it’s not just a simple ‘jump out of the box’ gimmick.");
	output("\n\nAn expensive looking bondage harness rests just inside what used to be the boxes frame, and the chunky puazi is suspended at its center. The harness forces her into a prostrate position, with her knees tied up under her stomach and her arms wrapped up behind her back. Her hefty breasts hang in the open air, nipples already stiff and begging. Her body is drenched with sweat, with each breath coming heavy through her nose. A large ball gag blocks her mouth, and saliva drips all the way down her chin. She looks up at you in the dim light, and you flush with heat yourself. There’s a touch of recognition in those eyes, but they aren’t the eyes of the competent saleswoman you know. All the heated desire in her body, all the rampant need, is channeled through that gaze, and it wants you.");
	output("\n\n<i>“I might have made liberal use of her before you got here, but I promised her I’d let you have her mouth first. Go on, open it up!”</i> she says, plopping down behind the bound up slut and casually beginning to open some of the other presents lying around the viewscreen. You find yourself eager to comply, swiftly searching till you find the easy unlock clasp on one side of the gag. You tug it out gently, making sure not to hurt her jaw or teeth. She moans appreciatively once it’s out, and her eyes flit to your " + (pc.isTaur() ? "rump":"crotch") + ".");
	output("\n\n<i>“She probably can’t talk, but it would be rude not to put your gift to good use, don’t you think?”</i> Eimear smirks, looking not at all surprised as she tugs a grooved vibrator from one of the newly opened boxes. She doesn’t have to tell you twice.");

	var x:int = -1;
	if(pc.hasCock()) x = pc.cockThatFits(400); //Couldnt find a value in their OG content, so wanging it.
	//pc is dicked taur
	if(pc.isTaur() && x >= 0)
	{
		output("\n\nYou step up to the harness, wondering how exactly you’re supposed to position yourself to get to her mouth in the first place. As you near the device, it’s mechanical parts click and whirr as it rearranges itself, placing the suspended slut directly at thigh level. You’re easily able to trot up until she rests comfortably under your lower body. At such an angle, it’s easy for you to angle your hips so your now hardening [pc.cockNoun " + x + "] rubs directly against her face. A strained grunt echoes from beneath you, and you see Gwen tense in the restraints.");
		output("\n\n<i>“She’s already cumming! Keep doing whatever it is you’re doing up there, and I’ll get started up here,”</i> Eimear grins, motioning toward your rump and then patting the jiggly butt before her. This position gives you the perfect view of her as she readies the pristine new dildo, applying a liberal coating of lube and giving her girlfriend’s ample ass a squeeze. Gwen’s tiny tail flits back and forth at the attention, brushing over the front of your bestial half in quick jerks.");
		output("\n\nThere’s hardly a need for you to ‘keep doing’ anything. Without prompting or further movement on your part, the wound up puazi’s tongue darts out, teasing at your [pc.cockHead " + x + "]. You step a little closer as she licks, giving her better access to your length. She");
		if(pc.hasCocks())
		{
			output(" rubs her face " + (pc.cockTotal() == 2 ? "between your pair of cocks":"through your forest of cocks") + ", unsure of which one to focus on, and");
		}
		//tiny dik:
		if(pc.cocks[x].cLength() < 6)
		{
			output(" easily covers the entirety of your [pc.cock " + x + "]. Her grooved tongue explores every inch, even twisting up to taste ");
			if(pc.balls > 0) output("your [pc.balls]");
			else if(pc.hasVagina()) output("your [pc.vagina]");
			else output("your [pc.asshole]");
		}
		else output(" wraps her tongue around your length, rubbing her face against the hot cock-flesh. You hear her gasping in breaths of thick musk, filling her fuck-drunk mind with your scent.");
		output(" You shift in place, preparing to continue.");
		
		output("\n\nWith aid from her dexterous tongue, you plunge the tip of your [pc.cock " + x + "] into Gwen’s open mouth. It takes a measure of will to remember that the sheath of warm, constricting muscle around you isn’t a cunt, and another still not to buck your hips and hilt into her throat on the spot. The cock-hungry slut, on the other hand, doesn’t seem to care. She gleefully envelops you in the plush slickness of her maw, trying to pull as much of it inside as possible from her immobile position. Not being able to see her makes the echoing slurps and moans beneath you sound that much more obscene.");

		output("\n\nEimear finishes lubing up and immediately puts her virgin dildo to use, grinding the bulbous length against Gwen’s slit. The sandwiched woman’s breathing speeds up as her girlfriend joins the fun, rubbing the fingers of her free hand around her partners asshole. The bondage device provides a pair of rails at the perfect height for you to hold, giving you leverage to begin thrusting. You begin with an earnest desire to start slow, gently thrusting your hips and feeling your length enveloped in her tight throat.");
		output("\n\n<i>“Harder! Sheesh, it’s like you’re new to fucking puazi. You have to give it to them <b>Hard</b>,”</i> The dusky amazon commands, accentuating her statement by shoving the thick dildo into Gwen’s sopping sex in one swift motion. A sound of utter bliss, clear and distinct despite the stopper of [pc.cockNoun " + x + "], worms its way into the air, and you feel every muscle in the blue haired beauties body tighten. You don’t get a second to react before Eimear begins in earnest, thrusting polished alabaster into cerulean cunt with practiced ease.");
		output("\n\nYou don’t stay off balance for long, heeding her advice and beginning to thrust with a little more feeling. Who are you to say no to going hard? Sure enough, the double fucked fashion designer’s choking moans double in volume and frequency. Her conscious sucking gives way to a salacious squelching that matches her voracious slit in intensity. Without conscious effort to guide her, she’s no more than a living fucktoy, beholden to the rigors of her alien biology. She takes your cock to the hilt without a problem, not even choking anymore as you massage her throat from the inside.");
		output("\n\n<i>“You look like you’re about ready to burst. Go on, fill her up. I want to see it,”</i> Eimear says, looking up at you as she continues dildo-fucking. You’d been ignoring it to focus on the sticky warmth of Gwen’s mouth, but you </i>feel<i> ready to burst as well. Your hips buck with the sudden realization, and you feel the seed churn " + (pc.balls > 0 ? "in your [pc.balls]":"inside you") + ", ready to be unleashed. Just trying to savor the delicious feeling of pre-release pushes you over the edge, and you grip the holds of the bondage device as you cum.");
		output("\n\nHot fire burns in your veins as you find your release, and it’s all you can do not to collapse atop the helpless woman beneath you. ");
		//pc.cumvolume low/normal/high/kirosbeenholdinback: 
		if(pc.cumQ() < 10) output("You manage a good few shots directly into her throat, painting her bright blue insides with a dash of [pc.cumColor]");
		else if(pc.cumQ() < 500) output("You shoot your load directly into her throat, painting her bright blue insides with a new shade of [pc.cumColor]");
		else if(pc.cumQ() < 5000) output("You fill her throat and stomach with [pc.cum], painting her insides with a [pc.cumColor] coating");
		else output("You flood her with [pc.cum], feeling it overflow in a waterfall of [pc.cumColor] cream");
		output(". You pull back on shaky legs, leaning against the couch to regain your bearings.");
	}
	//non-taur male
	else if(x >= 0)
	{
		output("\n\nYou step up to the harness, running a hand through Gwen’s damp hair and trying to position yourself as best you can. As if reading your mind, the machine buzzes and whirs, shifting the suspended slut till her face lines up perfectly with your crotch. Well, that takes care of that. The confined cocktease tenses up as you get close enough, her tongue stretching out to try and touch your approaching cock. Her eyes are glued to your crotch, staring with an aphrodisiac intensity that sets your blood to boiling. When you finally reach her, you see her whole body tense as [pc.eachCock] rubs against her face.");
		output("\n\n<i>“You’ve barely done anything, and she’s already cumming! Having a human around is the best! Don’t tell her I said that though, this is supposed to be a gift for her, not me, so get to it,”</i> Eimear winks, kneading the jiggly assflesh in front of her as she lubes up the bulbous dildo. You chuckle, but don’t actually have much left to ‘get to’ for now. Gwen is in the process of voraciously attempting to devour your ");
		if(pc.cockTotal() >= 3) output("garden of maleness");
		else if(pc.cockTotal() == 2) output("duo of dicks");
		else output("manhood");
		output(".");
		if(pc.cocks[x].cLength() < 6) output(" Her tongue alone completely covers your [pc.cock " + x + "], its fluted surface rubbing all the right places along your length.");
		else if(pc.cocks[x].cLength() < 12) output(" Her tongue wraps around your length, rubbing all the right places as she plants sloppy kisses along your shaft.");
		else output(" Her tongue trails wet kisses along your length, feeling exquisitely cool as she marks her face with your musk.");
		output(" She moans happily with each taste, stacking extra fuel onto the fire of your lust with each honeyed exhalation.");
		output("\n\nWith a little competition from her tongue, you manage to grasp enough of your [pc.cock " + x + "] to guide it into Gwen’s mouth. Once its inside her eyes all but roll back as she sucks it further in. You have to hold tight to her horns to stop your hips from being pulled in right up to your hilt. Even seeing it first hand, it’s hard to believe the tight warmth threatening to engulf your length isn’t a cunt. The rough heart shapes on her forehead don’t make the best handles, but they’ll do till you get your bearings.");
		output("\n\nEimear doesn’t wait for anything. She finishes her lubing and immediately presses the tapered tip of the bulging dildo into Gwen’s sodden box. The suction on your [pc.cock " + x + "] ceases as she strains against her holds, fingers and toes splaying out as her fuckdrunk mind tries to make sense of the sudden ceaseless thrusting. She grunts in rapturous bliss as the force of her lover’s pounding rocks her in the sturdy bonds.");
		output("\n\n<i>“Come on, start moving! Don’t let her recover. If we both get going she’ll be a mess in no time. This is puazi fucking one-O-one,”</i> The dusky amazon admonishes you, rubbing the amorous alien’s tail in one hand as she continues to thrust as hard as she can. You shake your head as you begin to move, getting a better grip on the blue haired beauty’s head as you start to thrust into her mouth.");
		output("\n\nNear immediately, the double-fucked fashion designer cums again, and doesn’t seem to stop as the two of you bounce her back and forth in the restraints. Gobs of precum drip down her chin and onto the floor, joining the already slick puddles of sweat and femcum. You give her just enough time to pull in a mouthful of musk-filled air with each hard thrust, otherwise moving with reckless abandon and absolute disregard for holding yourself in. Knowing that this slut can get off from just being around you is enough to drive you wild.");
		output("\n\n<i>“Yes! That’s it! Shoot it all right into her stomach. Now your getting into it.”</i> Encouragement notwithstanding, you might be getting out of it pretty quick. Your breath comes in heavy gasps as you try to hold on to every second of the delicious pleasure of your pre-orgasm high. Your mindless bucking slows, instinctually trying to reach the deepest point with every thrust. The breed-hungry animal in you doesn’t care that this is a throat, it just needs release. With one final hilt against her lips, that’s exactly what it gets.");
		output("\n\nHot fire burns in your veins as you find your release, and it’s all you can do not to collapse atop the helpless woman beneath you. ");
		if(pc.cumQ() < 25) output("You manage a good few shots directly into her throat, painting her bright blue insides with a dash of [pc.cumColor]");
		else if(pc.cumQ() < 500) output("You shoot your load directly into her throat, painting her bright blue insides with a new shade of [pc.cumColor]");
		else if(pc.cumQ() < 5000) output("You fill her throat and stomach with [pc.cum], painting her insides with a [pc.cumColor] coating");
		else output("You flood her with [pc.cum], feeling it overflow in a waterfall of [pc.cumColor] cream");
		output(". You ");
		if(pc.hasKnot(x)) output("try to pull back, but find yourself held fast by your still bulging knot. Gwen gurgles and swallows as jets of cum still pulse from your tip, bubbles of [pc.cum] popping as she huffs out breaths through her nose. It looks like you’re going to be here for a while...");
		else output("pull back on shaky legs, leaning against the couch to regain your bearings.");
	}
	//hyperdick
	else if(pc.hasCock())
	{
		x = pc.biggestCockIndex();
		output("\n\nYou’re excitement dies a little when you realize just how big you actually are. There’s no way your gonna fit inside her mouth, or even comfortably between her boobs with how she’s arranged. Eimear seems to notice your predicament and stops toying with her new dildo. She sets the toy aside and crawls around to your side.");
		output("\n\n<i>“Hmm. That does put a bit of a downer on things... Wait! I have something for this!”</i> She suddenly exclaims, standing and dashing into the pairs shared bedroom. You hear her shouting as she rifles through what must be a drawer or closet.");
		output("\n\n<i>“I got one of these a couple years back for Gwen’s birthday, in case she ran into just this kinda problem,”</i> She comes back toting a long tapered dildo with a long tub attached, the opposite end of the long tub consists of numerous feelers that shift and wave gently through the air at the press of a button.");
		output("\n\n<i>“I don’t think she used it much cause she can’t really think too hard when her urges take over, but i’m glad to have it now. This might feel a little weird at first, but I don’t think you be able to hold back too long, if at all. I just have to line it up riiiiiiiight here,”</i> she says, letting the free end of the device rest just in front of your [pc.cockHead " + x + "]. You flinch involuntarily as the feelers brush over your sensitive cockflesh, gasping as the thicker tip dips into your cumslit. She’s right, it does feel wierd, but... Now you can feel the warm air of the room on your cock, slick and wet and... rubbing into a giant slit? You look up to see Eimear rubbing the dildo end of the device up and down along Gwen’s sopping box. You’re feeling </i>that<i> cock, but its proportional. The cunt feels like the perfect fit for your bitch-breaking titan, not some tiny dildo. The feelers seem to finish positioning themselves, settling into place at the most sensitive points along your length.");
		output("\n\n<i>“Seems like it’s finished calibrating. Time to test it out,”</i> Eimear pips happily. Your stomach has a brief moment to leap into your chest before she slams the tapered dildo home into her lovers cunt. You almost come on the spot. It’s like you’re the one fucking. Fucking. <b>FUCKING</b> She’s not stopping. The dusky masseuse is using the device like a dildo, using you like a toy, and taking your conscious mind for an irresistible pleasure trip. Each of her lightning fast thrusts takes thoughts from your mind before they can fully form, replacing each with a burning need for the next hilting plunge.");
		output("\n\nYour hips dont have time to buck, even involuntarily, and your pained pleasure only seems to give her more energy to continue. Determined to prove her wrong, you resist the flood of pleasure as best you can. You try not to think about the slick cunt you’re pumping in and out of, faster than your hips could ever carry you. Damn it. You definitely try not to think about the moaning slut on the receiving end of your attached toy’s lovemaking. Definitely don’t look at her, oh god. You sneak a glance at the suspended slut, and don’t have enough resistance left to regret it.");
		output("\n\nGwen is completely lost in the throes of ecstasy, quivering and cumming as she hangs in her restraints. Her long tongue hangs in the open air, dripping saliva onto the carpet. She doesn’t look back at you, too lost in her own pleasure to care if the world sees her, let alone you. If she knew <b>you</b> were looking it would probably make her cum all the harder. You could be that free, if you just let go.");
		output("\n\nSeething bliss pulses through your veins as you let loose, hips quivering as release vents its way out of your body. ");
		if(pc.cumQ() < 50) 
		{
			output("You spurt out a jet of cum alongside the orgasmic pulses, And see some of it shoot through the connecting tube and assumedly out of the tapered dildo. Eimear turns to you with a raised eyebrow, tugging the synthetic sword from its sheath.");
			output("\n\n<i>“Really? You’ve got a cock like a monster but this could barely fill a shotglass! What am I gonna fill her with now? Quiche?”</i> she tosses her hands in the air. Gwen twitches unconsciously at the mention of food, but still seems too out of it to be eating anything any time soon. Maybe you can look into boosting your output at some point, but for now you’re perfectly content to lie against the couch and recover.");
		}
		else if(pc.cumQ() < 500) output("Cum jets out of your slit, traveling visibly through the connecting tube and filling the prurient puazi’s pussy with [pc.cumColor] cream. Eimear tugs the now cum-coated synthetic cock from its erstwhile sheath and dives into her girlfriend’s ass. The poor girl gets no chance to recover as her lover licks all the way up to her waggling tail. You lean against the couch, enjoying the show as you relax.");
		else if(pc.cumQ() < 5000) output("Cum pumps out of your slit, filling the tube, and gwen’s cunt, with [pc.cum]. With your output you’re able to fill her till your seed leaks out, dripping down her legs and joining the growing pool of sexual fluids beneath her. Eimear continues to grind the cum-covered synthcock in and out, kissing her lover right on her waggling tail. You lean back against the couch, enjoying the show as you recover.");
		else output("You see the tube bulge as [pc.cumColor] cream erupts from your [pc.cock " + x + "]. Eimear grips Gwen around the waist, steadying herself to prevent the synthetic stopper from bursting back out of her cunt. She manages to hold it, but your [pc.cum] still flows in gratuitous surges back out around it. The wasted seed quickly overtakes her juices in puddle size, covering a sizeable circle of carpet. Oops. Eimear doesn’t seem to mind, using her new grip to squeeze the prurient puazi’s ass as she leans in to kiss her waggling tail. You lean back and watch, catching your breath as the poor girl is denied her rest.");
	}
	//taur with puss(also futa)
	else if(pc.isTaur())
	{
		output("\n\nYou shift around in place, trying to figure out the best angle to get yourself situated. As if on cue, the sophisticated bondage machine plops it’s cargo down almost all the way to the ground. This new position lets you sit comfortably on the carpet, with your arms on the couch for support, and leaving [pc.eachVagina] just in front of the hovering harlot’s face. Even in her delirious stupor she picks up on this new development, opening her mouth and issuing short begging moans as she stretches out her tongue. Obligingly, you shift back and gasp as your tauric rear " + (silly ? "baps":"bumps") + " right into her face.");
		output("\n\nGwen instantly relaxes once she’s nestled into your [pc.butt], licking lovingly at your [pc.firstClit] as she inhales your cuntscent. You find yourself breathing heavily after the first minute of her attentions. Even lost to her alien biology, she still unconsciously seeks your weak spots like a hunting hound. The grooves on her tongue serve to further stimulate your clit, and " + (pc.balls > 0 ? "its length allows her to taste your [pc.balls] as well":"its length makes each lick all the longer") + ". Every breath she takes leaves her body in a series of moans that reverberate as she shudders in her restraints.");
		output("\n\n<i>“Mmm, That looks like a good idea.”</i> You glance over your shoulder in time to see Eimear casually discard the bulbous dildo shed been lubing up, spreading the fuck-drunk puazi’s cheeks with her bare hands and diving in. The oral assault on your [pc.vagina] doesn’t stop, but you feel the ministrations pick up to mimic the intensity of her ebon-skinned lover. Gwen’s stubby tail flits wildly, slapping the taller woman on the nose repeatedly until she grasps hold of it. It doesn’t stop struggling, but a single one of her hands is enough to hold the full thing, rubbing along its underside as she holds it in place.");
		output("\n\nNow you get a short reprieve, free from the attentions of her tongue as orgasmic shudders run through her body. She strains against her bonds, pulling in gulps of [pc.girlCumNoun] scented air that escape in husky moans. Eimear comes up for air, her face dripping with steamy femcum, and gives you a wink as she picks up her new dildo again. With one quick thrust she hilts the synthetic fuck-stick in the shorter woman, bumping her right back into the action. This time it starts with a couple quick kisses on the folds of [pc.eachVagina] as she rubs every bit of her face with your mark.");
		output("\n\nGwen looses a handful of strained moans before you feel her long tongue push its way deep inside you. With a gleeful cheer, she sloppily rubs her lips through your folds and over your [pc.clit] as her tongue seeks out your g-spot. You dig your hands into the couch as she finds it, holding your breath as you try to hold in the cascading avalanche of pleasure that comes when she finds it. If only this peak could last forever.");
		output("\n\n<i>“That’s good. Cum, you’ve earned it.”</i> Part of you knows Eimear’s command is meant for her girlfriend, but that doesn’t stop you from complying. You comply like a good slut. The brain numbing pleasure of sweet release floods through your body, Echoing in your [pc.vagina] and bouncing back out the front in a blissful moan of your very own. Gwen, sandwiched between your [pc.ass] and the powerful thrusts of her lovers dildo, shudders silently with her own delights.");
		output("\n\n");
		var wetties:Number = pc.wettestVaginalWetness();
		if(wetties < 2) output("Your insides clamp down on the dextrous tongue intruding within you, locking it in place while you ride out the throes of orgasm.");
		else if(wetties < 4) output("Your insides clamp down on the prurient puazi’s dextrous tongue, and hot femcum coats the oral organ, dripping slowly down till it reaches her chin.");
		else if(pc.girlCumQ() < 2000) output("The prurient puazi gets a facefull of hot [pc.girlCum] as your insides lock tightly around her tongue. You can hear your cum splash onto her face, dripping down onto the floor to join the already sizeable pools of love juices.");
		else output("The prurient puazi sputters as your hot [pc.girlCum] gushes over her face. Steaming splashes of love juice wash over her and spatter onto the soaked carpet.");
		//pc wetness is 0-1/2-3/4-5/6-10:
		output(" A sigh escapes your lips, and you pull in fresh air to replace the breath you’d been holding through your orgasm. You want to spin and face Gwen, but your hindquarters don’t seem to be responding, so you content yourself to lean against the couch for a while longer.");
	}
	//Non-taur pusspuss(this one is for pussy only)
	else
	{
		output("\n\nYou step up to the suspended form of your puazi friend, trying to find the best way to line up to her face. As if reading your mind, the device shifts and clicks until Gwen’s head rests just in front of your crotch. The needful look in her eyes gains an unthinking focus, settling a little crossedly on your [pc.vagina]. Her hands clench into fists and relax repeatedly as she stares, struggling to try and get even a little closer to you. You thread your fingers through her damp hair, reminding her who’s in charge here as you take a half-step closer. At this distance your mons presses into her face, and you feel her go rigid for a handful of seconds.");
		output("\n\n<i>“Oh wow, you really got her going. What did you- ahh, giving her what she’s used to,”</i> Eimear looks up briefly as she rubs her freshly lubed dildo teasingly around her lover’s plump butt. You grin back before returning your focus to the insensate fucktoy beneath you. Pulling her head up, you let your thumb slip idly into her mouth, holding it open as you appraise her tongue. Stars, her mouth is like a furnace. Pleased with your findings, you direct her back down toward [pc.eachVagina], inhaling a sharp breath as her tongue snakes out to taste your lips. The wet heat is a welcome relief, stoking your lust even higher than the sight of her utterly willing expression.");
		output("\n\nIt doesn’t take her long to begin in earnest, licking and kissing at your body with a wild hunger. Gradually, her focus narrows down to " + (pc.hasVaginas() ? "the first of your multiple sexes":"your [pc.vagina]") + ", and continues till she’s sucking on [pc.oneClit]. All at once her moaning ceases, replaced by a voracious and silent fervor as her tongue whorls like the dance of a gluttonous dervish. You stutter out a moan that half chokes in your throat, fingers tightening around her skull as you pull her tighter against your crotch.");
		output("\n\n<i>“Mmm, now </i>that<i> looks like a good time.”</i> You look up long enough to see Eimear casually discard her dildo, spreading her girlfriend’s cheeks with her bare hands and diving straight in. The effect on Gwen is immediate. The alacrity of her ministrations dies down as a drawn out moan forces its way out, ringing through her whole body in blissful shudders. Oh, she struggles to keep up through it all, but it’s a lost cause. Each breath of cuntscent from your aroused sex sets off a new wave of orgasmic bliss in the restrained alien. Biology makes her its bitch.");
		output("\n\nEven with her pace slowed, it’s a monumental effort not to buck your hips and cum all over her tongue from second to second. Micro-orgasms slip through your defenses, sending pleasurable shivers through your body and interrupting your train of thought. You’re already half lost by the time she moves on from your clit, her dextrous tongue weaving expertly onward and up into your depths. It’s still deliciously hot, searching out your weak spots with expert precision. One after the other, every mental barricade you’ve erected to hold back the thought that cumming for her blessed lips is the best idea ever.");
		output("\n\nThe only saving grace you have is Eimear’s increasing efforts. She ramps up her game to match the puazi’s near mindless fucklust. When she tires of tonguefucking alone, she retrieves the dropped dildo, putting it to good use and switching her oral attention to the small of her lovers tail, licking between its base and her asshole as she pounds the synthetic fuckstick in and out. Gwen grows sloppier as she turns into a quivering mess, but it’s too late for you to hold on any longer.");
		output("\n\n<i>“That’s good. Cum, you’ve earned it.”</i> Part of you knows Eimear’s command is meant for her girlfriend, but that doesn’t stop you from complying. You comply like a good slut. The brain numbing pleasure of sweet release floods through your body, Echoing in your [pc.vagina] and bouncing back out the front in a blissful moan of your very own. Gwen, sandwiched between your [pc.thighs] and the powerful thrusts of her lovers dildo, shudders silently with her own delights.");
		output("\n\n");
		var wetties2:Number = pc.wettestVaginalWetness();
		if(wetties2 < 2) output("Your insides clamp down on the dextrous tongue intruding within you, locking it in place while you ride out the throes of orgasm.");
		else if(wetties2 < 4) output("Your insides clamp down on the prurient puazi’s dextrous tongue, and hot femcum coats the oral organ, dripping slowly down till it reaches her chin.");
		else if(pc.girlCumQ() < 2000) output("The prurient puazi gets a facefull of hot [pc.girlCum] as your insides lock tightly around her tongue. You can hear your cum splash onto her face, dripping down onto the floor to join the already sizeable pools of love juices.");
		else output("The prurient puazi sputters as your hot [pc.girlCum] gushes over her face. Steaming splashes of love juice wash over her and spatter onto the soaked carpet.");
		output(" A sigh escapes your lips, and you pull in fresh air to replace the breath you’d been holding through your orgasm. You want to spin and face Gwen, but your legs don’t seem to be responding, and you seem to be on the floor. For now you content yourself to lie back and relax against the couch.");
	}
	//merge all
	processTime(60);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",eimeerXmasGwenGarde2018Part2);
}

public function eimeerXmasGwenGarde2018Part2():void
{
	clearOutput();
	author("Gardeford");
	showCarbonado();

	output("When you come to your senses Eimear is still going. The poor puazi looks totally lost to the world, You take her cheeks in your hands, giving her a kiss that she barely registers, moving her lips slowly to match yours. Her tongue hangs in the open air, dripping the remainder of your sexual fluids onto the floor. Her ebon-skinned lover is slowly pumping a dildo inside her, watching an action packed show on her tablet.");
	output("\n\n<i>“Ah, you’re up. You can crash in the spare bedroom if you want. I’m gonna keep the present up a while longer,”</i> she says, glancing at you with a smile before returning to her show. You grin back and stumble back to the second bedroom, collapsing into the mattress and passing out nigh immediately. You sleep smoothly and deeply, waking in the morning feeling fully refreshed, if a little weak in the knees.");
	output("\n\nYou stretch and return to the living room, gathering your gear and fully waking yourself up. Gwen and Eimear are asleep on the couch, with the exhausted puazi curled up in a cozy looking waterproof blanket and nestled snugly against her much taller lover. Only her head sticks out, smushed against the dusky amazon’s breasts and wearing an expression of utter comfort. Both are out cold, so you make an effort not to wake them as you slip by and back out into the harsh uveto cold.");
	output("\n\nYour codex beeps to alert you of an unread message and you see a note from Eimear among the most recent.");
	output("\n\n<i>’Hey [pc.name], I’m sure Gwen would’ve wanted to get up and/or actually wish you Merry Christmas, so I just want you to know that you definitely made her Christmas, and I’m really happy you were able to make it. Hope to see you again soon,");
	processTime(60*7);
	pc.orgasm();
	restHeal();

	output("\n\n\tEimear’</i>");
	output("\n\nYou smile to yourself as you head back to resume your adventure.");
	flags["GWEIMEER_XMAS_2018"] = 1;
	clearMenu();
	addButton(0,"Next",move,"UVI F34");
	//(deposit just in front of the lift)(pass to morning of next day)(heal pc)
}
