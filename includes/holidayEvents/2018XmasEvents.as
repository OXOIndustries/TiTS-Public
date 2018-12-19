//                                 By Franks

//PC gets accidentally invited to UGC Christmas party
//Gets to watch Riya and Grence get shitfaced and bang
//Ain’t no partie like a UGC partie cause’ a UGC partie don’t stop

//{PC receives email around Christmas, no level requirement}From: Commander Lorna Grence<Lorna_Grence@UGC.gov>
//To: [pc.name] Steele<[pc.email]@SteeleTech.corp>
//Subject: Christmas Party Invitation

public function riyaXmasPartyInviteText():String
{
	return "It’s that time of year again, folks! The annual Tavros UGC detachment Christmas party will be held on flight deck #4. Be there or be square!\n\n\tP.S. Officer Ivanovsky is hereby politely but firmly asked not to bring fireworks to this year’s festivities. Bags and pockets will be checked at the door.\n\tP.P.S. Could Sergeant Conar please bring an extra plate of those bone-shaped cookies from last year? They were to die for. :3\n\tP.P.P.S. Officer Traylio is limited to one REASONABLY SIZED alcoholic beverage.\n\tP.P.P.P.S. Lieutenant Batra will refrain from explaining why ‘celebrating human holidays objectively demonstrates human superiority’ or so help me God.";
}

//Entering party(Should be accessible as a destination(( [Party] )) on the Tavros elevator):
public function party2018RiyaEntrance():void
{
	clearOutput();
	author("Franks");
	showName("\NPARTY!");
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
	output("Well as luck would have it, you </i>do<i> have an email. Retrieving your codex you show the man your invitation, at which point he nods once and steps out of your way, gesturing into the hangar. <i>“Thanks. Enjoy the party.”</i>");
	output("\n\n<i>“‘Will do!”</i>’ you reply as you enter the hangar.");
	processTime(2);
	clearMenu();
	addButton(0,"Next",);
}

//PC selects ‘Seduce’
public function seduceTheBouncerAtRiyaParty():void
{
	clearOutput();
	showName("\nSEDUCING...");
	author("Franks");
	output("Yeah, you could just show your invite. If you were a </i>loser<i>. But you’re not, and this way is way more fun.");
	output("\n\nYou lean seductively against the bulkhead, [pc.eyes] smouldering as they bore into the officer’s baby blues. <i>“I think there’s been a misunderstanding, officer,”</i> you purr, right hand sliding up your [pc.stomach]. <i>“I don’t need an invitation to the party - I </i>am<i> the party. And if you let me through, the two of us can have a </i>private<i> party,”</i> you continue, brushing your hand up his chest now, towards his chin. It’s almost there when his right hand snaps out in a flash to grab your wrist. Not expecting violence (or the speed with which his hand moves), you can only grimace as he twists it painfully, eyes boring into yours. Belatedly, you catch the gleam of a wedding band on his left ring finger.");
	output("\n\n<i>“Put your hands on me again and I’ll break them,”</i> he says flatly before releasing you, nostrils flaring. <i>“Show an invitation or get out.”</i>");
	output("\n\nWhat an amiable fellow. Still, this isn’t a battle you’re going to win. Even if you do manage to beat this guy, most of the UGC officers on Tavros (the ones who didn’t pull holiday duty, anyway) are at this party, and you somehow doubt they’d take kindly to violence against one of their own. Sighing, you present Officer Buzzkill with your invitation, at which point he waves you in, wishing you a good evening.");
	processTime(4);
	clearMenu();
	addButton(0,"Next",);
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
	output("\n\nA minute passes, filled with exclamations of joy and general drunken hubbub, before you see " + (flags["MET_RIYA"] != undefined ? "Riya":"a tall, dark-skinned human woman") + " looking </i>quite<i> cross as she looks at the contents of the present she’s just opened. <i>“Ah, what the shit!”</i> she proclaims, looking around accusingly. <i>“Who gave me a fucking lump of coal!?”</i>");
	output("\n\nGrence says nothing, but a smug grin spreads itself across her features and her tail wags just a bit faster.");
	output("\n\nIt takes a surprisingly short amount of time for the enormous pile of gifts to be handed out, but soon enough all that remains is a sea of gaudy wrapping paper and a gaggle of increasingly drunk revelers. Perhaps more surprisingly though, you can see that ‘Santa Grence’ has already had more than her fill of eggnog. She’s weaving her way back to the crowd, munching on a bone-shaped cookie in between sips of eggnog. And there in the middle of the drunk guests... is Riya, busily and drunkenly explaining to her comrades that yes, celebrating Christmas really </i>does<i> mean they’re admitting on some level that human celebrations are superior.");
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
	output("\n\n<i>“Are you illiterate, Riya?”</i> the Ausar starts, tilting her head to the side a bit drunkenly. Riya opens her mouth to respond, but but before she can say anything Grence cuts her off. <i>“I’m pretty drunk, but I know damn well I sent out a mass email. And I’m pretty sure that email specifically asked </i>you<i> to refrain from your usual bullshit for the party. But after you got your coal - that was me, by the way - what did I hear? I wasn’t expecting you to give a speech about how much you love diversity. But I also wasn’t expecting you to blatantly disregard my authority. But maybe there’s a reason for it...”</i> she says, leaning forward in her seat. <i>“Are you illiterate? Did you hear about the party by word of mouth?”</i>");
	output("\n\nRiya, looking </i>quite<i> nettled, shakes her head. <i>“No, ma’am. I read the email like everyone else.”</i>");
	output("\n\nGrence seems to become visibly more angry at that, her fluffy blonde ears swiveling up off her skull and forward to face Riya. <i>“Oh. So you read the part where I SPECIFICALLY ASKED YOU NOT TO BE AN ASSHOLE AT THE PARTY, AND YOU </i>FUCKING IGNORED ME!<i>”</i> she snarls, slapping her hands down on her thighs. Her voice is surprisingly, well... </i>loud<i>. Especially for such a physically unintimidating woman. And the look in her eyes... if you were a betting [pc.manWoman], you’d say Riya looks impressed. Then the look on Grence’s face softens, and she sighs heavily.");
	output("\n\n<i>“Why do you do this? I mean, you’re not a bad officer on paper. You don’t discriminate when you arrest people, you </i>surprisingly<i> actually arrest more humans than nonhumans, and...”</i> perhaps unwisely, Riya takes this opportunity to butt in.");
	output("\n\n<i>“Well, there’s also way more humans on station than all the other races combined,”</i> she says, shifting her neck to one side, cracking it loudly, then repeating the process with the other side.");
	output("\n\nGrence grunts in clear frustration. <i>“You know damn well what I mean. If you didn’t act like such a jackass, everyone would love you. We could...”</i> her cheeks flush soft pink as she trails off, and Riya’s jaw drops open.");
	output("\n\n<i>“Hooooooooohmygod. You </i>like<i> me. You wish I wasn’t such an asshole because you </i>like<i> me,”</i> the human woman says in shock, an infuriatingly smug grin spreading across her dusky features not long after. <i>“You’ve got the hots for me, and you’re too drunk to hide it right now,”</i> she says, hands sliding up to rest on her hips, and... are her pants bulging?");
	output("\n\nGrence seems to notice too, because her face goes studiously blank for a moment, followed by her ears twitching and her gaze averting to the ceiling. <i>“Stop that,”</i> she growls, cheeks turning from pink to beet red.");
	output("\n\nRiya pays no mind, of course. <i>“So... you like it </i>ruff<i>, I take it?”</i> She quips as she takes a step forward, not </i>quite<i> intruding on the ausar’s personal space but coming awfully close... and Grence reacts.");
	output("\n\nQuicker than you would’ve thought the fluffy gold dame could move she’s grabbed Riya by the collar and shoved her up against a bulkhead, ears pinning back against her skull as her teeth bare themselves in a snarl. <i>“Who the fuck do you think you are, Lieutenant?”</i> she hisses, bright blue eyes boring into Riya’s deep brown. <i>“You think I’m gonna bend over for you like some low-rent slut? Here’s the deal, </i>pal<i>; I’m your fucking boss. End of story. And yes, God only knows why, but I do </i>like<i> you." + (flags["RIYA_QUEST_RESULT"] == 1 ? ".. especially after you saved my ass with those pirates.":"") + " But if we’re doing something, we’re doing it </i>my<i> way. Got it?”</i> she says, releasing the human woman and stepping back, arms crossed over her chest.");
	output("\n\nRiya looks... intrigued, and tempted. If you had to guess, you’d say it’s been a while since someone has stepped to her like this, at least in an intimate setting... she’s clearly considering it, but Lorna doesn’t seem to be in a patient mood just this moment. She steadies herself, undoes her belt, and looks at the other officer coolly as she speaks. <i>“On your knees and get over here.”</i>");
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
	output("\n\nRiya’s right hand suddenly snaps to her mouth, and Grence looks </i>quite<i> cross, likely assuming her lover is going to start talking trash again... but as her panties go flying, landing perilously close to your <s>hiding spot</s> observation post, she clamps her hand down on the back of Grence’s head and pulls her into a deep, passionate kiss. The effect this has on the fluffy golden ausar is immediate; she jerks visibly, as if electrocuted... and then her tail goes wild, swinging from side to side with such force that it batters into the nearby chair, sending it rolling loudly across the floor and into one of the security consoles, though thankfully it misses any buttons.");
	output("\n\nThe unlikely lovers are both moaning, grunting and whimpering into each other’s mouths now; you see a flash of tongue every few seconds, and Riya is hugging the ausar tight to her chest while Grence has her arms locked around the human’s neck. The human woman is <b>violently</b> jackhammering her hips up into the dog-eared dame’s cunt, giving a final, muffled moan of pleasure before she goes balls-deep and holds herself there, her nuts drawing up close to her shaft as she inseminates her boss. Coffee hands stroke up and down the cream-colored flesh of the ausar’s back, and a small trickle of off-white seed leaks out around the seal of Riya’s cock to dribble off her balls and onto the floor below. Their kiss finally breaks now, the pair of them dripping with sweat and sucking down air as Grence’s tail-wagging wearily slows to a slow wave.");
	output("\n\n<i>“That was...”</i> Grence starts, shivering as Riya’s left hand continues to rub her back, the other wiping the human’s brow, <i>“that was...”</i>");
	output("\n\n<i>“That was fucking incredible,”</i> Riya finishes for her.");

	output("\n\n<i>“Yeah,”</i> the ausar agrees, smiling dumbly. <i>“We can do this again, you know,”</i> she coos, sitting up on Riya’s lap, two pairs of sweat-slick breasts heaving for air even now, <i>“but only if you stay on Santa Grence’s nice list. Now...”</i> she slumps back down, nuzzling her face into the human’s neck, <i>“we </i>should<i> get dressed before someone sees us, but I’d rather cuddle for a minute.”</i>");

	output("\n\n<i>“Sounds good to me, ma’am,”</i> Riya says in response, grinning and scratching Grence’s head with her right hand. She didn’t even bother with trashtalking...");
	output("\n\nThis might be a good time to go before anyone sees you, though - and go you do. The party has followed it’s natural progression while you were gone; the Dzaan and Kaithrit pair that were wrestling in the kiddie pool when you left are now topless and completely covered with liquid chocolate, alternating taking turns sipping from a glass bottle and licking the delicious treat off each other.");
	output("\n\nThe officers parked around the gaming corner are all completely wasted, steering their characters into walls and giggling hysterically. The dartboard is littered with broken darts and spilled punch, and... oh, here come Grence and Riya.");
	output("\n\nThey’re leaning heavily on each other and their clothes and hair are thoroughly mussed - it’s pretty obvious what they were doing, even for the people who didn’t see it. People are already teasing them...");
	output("\n\nThe rest of the party is pretty uneventful, compared to what you just saw anyway. You head out a few hours later, slightly drunker and </i>much<i> hotter around the collar. Nobody gave you any presents, though... guess that invite was an accident after all.");
	pc.imbibeAlcohol(35);
	processTime(45);
	pc.lust(33);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Stay]
public function stayAtPartyWhileGrenceAndRiyaBone():void
{
	clearOutput();
	showName("\nPARTY");
	author("Franks");
	output("It’s a pretty fun party. You spend some time watching the girls wrestling in the chocolate pool lose their tops, give up on the wrestling contest and start trading swigs of a bottle of vodka and making out (much to the dismay of everyone except for one Thraggen man who bet they’d start making out midway through the fight and just may have set the whole thing up). Then you make your way over to the gaming corner, where you win a few hundred credits in a Call of Valor tournament, only to lose it playing darts... which is completely the fault of whatever was in that punch, of course.");
	output("\n\nIt’s a great time, and everyone is friendly... but you can’t shake the feeling you’re missing something. A feeling that’s confirmed when you see " + (flags["MET_RIYA"] != undefined ? "Riya":"the big human woman who was making an ass of herself earlier") + " and ‘Santa Grence’ stumbling out of one of the side hallways dripping with sweat, their clothes and hair disheveled and leaning heavily on each other. It’s pretty obvious what they were up to. And you missed it. Damn it all...");
	output("\n\nOn your way out, you spot something lying in a trashbin, something that doesn’t look like it belongs there... is that a horse dildo? ... It is. It even has a set of balls. You pluck it out, noting thankfully that it has avoided getting anything nasty on it.");
	output("\n\nWell, at least you had a good time at the party. And this free dildo looks pretty fuckin’ sweet too. You’ll have to check it out later...");

	//PC gains ‘Drunk’
	pc.imbibeAlcohol(100);
	processTime(60);
	output("\n\n");
	quickLoot(new HorseCock());
	//PC gains x1 Horse-cock
}