//                               By Franks

//PC gets accidentally invited to UGC Christmas party
//Gets to watch Riya and Grence get shitfaced and bang
//Ain’t no partie like a UGC partie cause’ a UGC partie don’t stop

//{PC receives email around Christmas, no level requirement}From: Commander Lorna Grence<Lorna_Grence@UGC.gov>
//To: [pc.name] Steele<[pc.email]@SteeleTech.corp>
//Subject: Christmas Party Invitation

public function riyaXmasPartyInviteText():String
{
	return "It’s that time of year again, folks! The annual Tavros UGC detachment Christmas party will be held on flight deck #4. Be there or be square!\n\n\tP.S. Officer Ivanovsky is hereby politely but firmly asked not to bring fireworks to this year’s festivities. Bags and pockets will be checked at the door.\n\tP.P.S. Could Sergeant Conar please bring an extra plate of those bone-shaped cookies from last year? They were to die for. :3\n\tP.P.P.S. Officer Traylio is limited to one REASONABLY SIZED alcoholic beverage.\n\tP.P.P.P.S. Lieutenant Batra will refrain from explaining why ‘celebrating human holidays objectively demonstrates human superiority’ or so help me God.\n\n(<b>Holiday Event unlocked! Access through the Tavros Station elevator floor selection menu.</b>)";
}

//Entering party(Should be accessible as a destination(( [Party] )) on the Tavros elevator):
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
	showBust("RIYA","GRENCE");
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
	output("\n\nOn your way out, you spot something lying in a trashbin, something that doesn’t look like it belongs there... is that a horse dildo?... It is. It even has a set of balls. You pluck it out, noting thankfully that it has avoided getting anything nasty on it.");
	output("\n\nWell, at least you had a good time at the party. And this free dildo looks pretty fuckin’ sweet too. You’ll have to check it out later...");

	//PC gains ‘Drunk’
	pc.imbibeAlcohol(100);
	processTime(60);
	output("\n\n");
	currentLocation = "TAVROS LIFT";
	quickLoot(new HorseCock());
	//PC gains x1 Horse-cock
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
		output("\n\n<i>“Ohmigosh!”</i> she yelps, nearly dropping the mixing bowl, instead spattering some up on her cheek. <i>“[Pc.name]! I didn’t know you’d come back yet!”</i> You feel her bare butt squish against you as she relaxes.");
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
	addButton(1,"Snowball",snowBallinWithEmbry);
	addButton(2,"CandyOral",candyCaneOral);
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
	output("\n\n<i>“Was I... oh... mmm, [Pc.name] ....”</i> she murmurs, her slight body shivering softly against yours.");
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
	output("You nod, and she clambers up the bed, perched on all fours above you, then leans down, pressing her cum-smeared lips to yours. You meet her halfway, your mouth open as her lips part. Together, you share a cum-filled kiss. One of you (you’re a little too addled to tell) starts moaning first, quickly followed by the other, as your tongues intertwine, the [cum.flavor] taste of your climax filling your mouths.");
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