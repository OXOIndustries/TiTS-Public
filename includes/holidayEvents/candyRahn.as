
public function showCandyRahn():void
{
	showBust("CANDY");
	showName("\nCANDY");
	author("ThereWasanAttempt");
}
//Overview
//
//In the Freezer on Uveto (possibly other bars) meet Candy, a festive Rahn with skin striped like a candy cane. Encounter will involve her giving you presents of the sexual nature, and if you’ve been naughty, an unexpected visit from her good friend the Krampus.
//
//Possibly silly mode if regular doesn’t work.

//Intro
public function candyRahnBonus(arg:Number):void
{
	//showCandyRahn();
	if(flags["MET_CANDY"] == undefined)
	{
		output("\n\nYou scan the Freezer and catch a sudden splash of colour in the otherwise drab interior. You stare in shock at what could possibly be the strangest Rahn you’ve ever laid eyes on. Leaning against the wall, she’s a swirl of green, reds and whites in a candy cane spiral all up her body. Her hair arches from her scalp in jagged points. She’s utterly naked, giving you an excellent view of jiggly E-cup breasts and a pair of wide, fuckable hips. And growing from said hips is the unmistakable swell of her meaty ovipositor.");
		output("\n\nAs you watch her, you see her break off one of the jagged points of her hair and begin to suck the thing with soft, plump lips.");
		addButton(arg,"Candy Rahn",approachCandyRahn);
	}
	else
	{
		output("\n\nThe green-red-and-white rahn is still lounging about, lasciviously suckling at a candy cane and offering cheer to any who would take it. Are you up for another visit with Candy?");
		addButton(arg,"Candy",approachCandyRahn);
	}
}

public function approachCandyRahn():void
{
	clearOutput();
	showCandyRahn();
	if(flags["MET_CANDY"] == undefined)
	{
		output("As you near the Rahn, her eyes slide over to you and a smile quirks her lips. <i>“Hmm. Well,”</i> she says, stretching her arms over her head and thrusting out her chest, sending her ovipositor and breasts jiggling wantonly. <i>“Hello there spacer.”</i> She grabs her shaft, giving it a long stroke of her narrow fingers. <i>“Come to suck Candy’s cane?”</i>");
		output("\n\nAs if afraid she’s being too subtle, her other hand slowly draws out the candy cane from her mouth, her long tongue uncoiling from it with a twist that makes you suck in a breath.");
		output("\n\n<i>“But the real question is,”</i> she says, stepping forward, her sugary scent rolling over you as she taps her candy cane against your chest. <i>“Have you been naughty?”</i> she says, eyes gleaming. <i>“Or nice?”</i>");
		flags["MET_CANDY"] = 1;
	}
	else
	{
		output("As you near Candy, her eyes slide over to you and alight with recognition. <i>“Hmmm. Didn’t think I’d see you so soon,”</i> she says, stretching her arms over her head and thrusting out her chest, sending her ovipositor and breasts jiggling wantonly. <i>“You must really be full of... holiday spirit.”</i> She grabs her shaft, giving it a long stroke with her narrow fingers. <i>“Want to sample Candy’s cane?”</i>");
		output("\n\nThe lewd rahn slowly draws a candy cane from her mouth, long tongue coiling sensuously around it on the way out. The sheer eroticism on display draws a delighted gasp from you.");
		output("\n\n<i>“But the real question is,”</i> she says, stepping forward, her sugary scent rolling over you as she taps her candy cane against your chest. <i>“Have you been naughty?”</i> Her eyes gleam. <i>“Or nice?”</i> Leaning closer, she whispers, <i>“You could be so nice...”</i>");
	}
	clearMenu();
	addButton(0,"Nice",niceCandyVariant);
	addButton(1,"Naughty",naughtyStuffWithCandy,undefined,"Naughty","Being naughty could lead to some... unexpected consequences.");
	addButton(2,"Drink Nog",drinkSomeNog);
	addButton(3,"SuckCane",suckCandysCane);
	addButton(14,"Leave",leaveCandyRahn);
}

//[Drink some Nog]
public function drinkSomeNog():void
{
	clearOutput();
	showCandyRahn();
	output("Your eyes are drawn once more to her breasts. And why not? Aside from her massive fuck-stick, it’s her most salient asset. She catches your eyes and grins, giving her striped teat a little squeeze, sending a creamy bead oozing from her nipple. There’s a distinct scent of liquor from her milk, and you find yourself licking your lips with anticipation.");
	output("\n\n<i>“‘Tis the season to be jolly,”</i> she giggles.");
	output("\n\nWell, hard to argue with that. You move forward and latch onto her breast. She gasps, clutching your head as your suckle her teat. A moan escapes you at the taste. Her skin actually tastes like a candy cane, and her milk like eggnog! The two flavours swirl in your mouth as you suck her cream and taste her plump nipples.");
	output("\n\n<i>“Oh yes,”</i> she murmurs");
	if(pc.hasHair()) output(", stroking your hair");
	output(", pulling you deeper into the soft, malleable girth of her tits. <i>“Drink it all up.”</i>");
	output("\n\nYou’ll hardly say no. In fact, you wonder if you can. Her cream warms your stomach and makes your head spin from the intoxicating flavour. You mash her breasts in your hands, and she gasps as you find her other nipple, rolling the firm bud between your fingers.");
	output("\n\n<i>“Mnnnn. Merry X-mas to me,”</i> she purrs. Soon enough she pulls your face from her breast, transferring you to the second where you eagerly resume suckling. The striped Rahn undulates, rubbing her ovipositor against your legs wantonly, moaning softly with desire.");
	output("\n\nFinally, gasping, you pull free. Your head spins with the beginning of intoxication and your stomach is warm from the festive nog.");
	output("\n\nCandy giggles at your flushed expression. <i>“Anything else you’re looking for this holiday season?”</i> she says.");
	processTime(10);
	pc.changeLust(40);
	pc.imbibeAlcohol(40);
	clearMenu();
	//[Return to Sex Options]
	addButton(0,"Nice",niceCandyVariant);
	addButton(1,"Naughty",naughtyStuffWithCandy,undefined,"Naughty","Being naughty could lead to some... unexpected consequences.");
	addDisabledButton(2,"Drink Nog","Drink Nog","You just did this.");
	addButton(3,"SuckCane",suckCandysCane);
	addButton(14,"Leave",leaveCandyRahn);
}

//[Suck her Candy Cane]
public function suckCandysCane():void
{
	clearOutput();
	showCandyRahn();
	output("Your eyes travel back down to her thick ovipositor. She catches your gaze and grins lasciviously. <i>“Hmm. Not surprising,”</i> the striped Rahn says, stroking her shaft. <i>“Everyone wants their holiday treat.”</i> She takes your hand and draws you out of the room. She pulls you into the relative privacy of the bathroom and takes a seat on the rim of the sink, parting her legs, her spiraled pseudo-cock rising tantalizingly.");
	output("\n\n<i>“Go on,”</i> she says, smiling hungrily. <i>“Take a taste. Let’s see how many licks it takes to get to the center.”</i>");
	output("\n\nHard to resist an invitation like that. You kneel between her legs and take her shaft in your hands. Her cock is firm for a Rahn. Almost hard, but smooth. The spiral pattern of her skin makes her shapely legs look like she’s wearing stockings, and her turgid shaft like it’s sheathed in a skin tight condom.");
	output("\n\nYou start at the bottom, running your tongue up the entirety of her length. The taste is sweet, each stripe having its own holiday flavor, mingling together in the familiar taste of a candy cane. The flavour is starkly familiar, vividly recalling holidays spent in years past, though never enjoying the treat in quite this fashion.");
	output("\n\n<i>“Mmmm. That’s it,”</i> Candy moans. <i>“Lick my cane. One. Two. Three,”</i> she moans as you run your tongue up and down her shaft, relishing the taste of her sugary dick. The firm flesh engorges in your fingers, swelling yet further. You’re on your tenth course from bottom to top when Candy grabs your cheeks and pulls you from it.");
	output("\n\n<i>“Good job,”</i> she murmurs. <i>“But there’s more than one way to lick a candy cane.”</i>");
	output("\n\nYou don’t need her to tell you. You adjust your stance and open your mouth wide, taking the head of her ovipositor in your lips. She moans, tossing back her head, her spiky hair scraping against the mirror as you swallow her. The sweet taste coats your mouth and throat as you take her, never hurrying. After all, half the fun of a candy cane is polishing it, and you intend to thoroughly enjoy this holiday treat.");
	output("\n\nAnd you’re not the only one. Candy’s legs swing up, wrapping around your head and pulling you down on her shaft. She’s gripping the sink so hard you can hear the porcelain creak as you bob your head, sucking her off. Giving someone a blowjob has never tasted so sweet!");
	output("\n\n<i>“That’s it,”</i> she moans. <i>“Suck it good. Your...mmm... Special surprise is very close. ‘tis the season of... mmmn... giving, after all.”</i>");
	output("\n\nOh that does sound tasty! You hollow your cheeks for better suction, your tongue writhing up and down her shaft as you work her. She gasps, moaning. Her firm, multicolored thighs squeeze your head as you suck. She grabs your [pc.hair], holding on tight as she fucks your face. Your tongue is fairly numb with the sweet flavour of her cock.");
	output("\n\n<i>“Oh the Candy Rahn can,”</i> your lover moans as you feel her ovipositor pulse in your throat. <i>“The Candy... Rahn... Can!”</i>");
	output("\n\nShe bucks, burying her cock in your mouth, and cums. The sharp, dusky taste of chocolate shocks your palate. You moan, swishing her cum in your mouth even as you swallow; the warm, smooth taste of chocolate washing down the sweet taste of candy cane.");
	output("\n\nGasping, Candy finally releases your head. You pull back, panting, licking your lips for the lingering sweetness of her cock and cream. Candy gives you a beaming smile and strokes your cheek.");
	output("\n\n<i>“Mmm. Such a good [pc.boyGirl]. You deserve a special treat for being so good.”</i>");
	output("\n\nReaching up, she breaks off another piece of her hair and plunks it in your gaping mouth. Your lips automatically close on it, sucking the sweet flavour of her. Giving you a last smile, she leans down and presses a kiss to your cheek. <i>“Merry X-mas,”</i> she murmurs, then slips away, her wide hips swinging as she leaves the bathroom.");
	output("\n\nAfter a moment you stand up and follow her back into the bar, sucking the candycane thoughtfully until it’s gone.");
	output("\n\nWhat a wonderful season.");

	//[Effect: Lust 40]
	processTime(20);
	pc.changeLust(40);
	var pp:PregnancyPlaceholder = new PregnancyPlaceholder();
	if(!pp.hasCock()) pp.createCock();
	pp.createPerk("Fixed CumQ",30000,0,0,0);
	pc.loadInMouth(pp);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Naughty]
public function naughtyStuffWithCandy():void
{
	clearOutput();
	showCandyRahn();
	addTopBust("CHUPACABRO");
	showName("\nKRAMPUS!");
	
	output("Oh you’ve been very naughty, you inform her. She smiles those lovely, plump, dick sucking lips of hers and slides the candy cane back into her mouth. <i>“Well,”</i> she says");
	if(pc.hasHair()) output(", twirling her finger in your hair");
	output(", <i>“I’m afraid I’m only for good boys and girls. Naughty children get the... Krampus.”</i>");
	output("\n\nKrampus?");
	output("\n\n<i>“Krampus!”</i>");
	output("\n\nYou swing around in shock as a horned figure looms out of the crowd. Fur covers his arms and legs, feet ending in cloven hooves. Horns curve back from a leering gaze, a long forked tongue flicking at the air. His cock, a meaty flat tipped thing like a horse, swings near his knees and in one hand he wields a heavy looking paddle.");
	output("\n\nThe Krampus laughs and scoops you up. Before you know what’s happening he’s laid you out over his knees");
	if(!pc.isAssExposed()) output(", tugged down your [pc.assCovers],");
	output(" and raised the paddle.");

	output("\n\nWHACK!");

	output("\n\nYou yelp as pain blossoms over your [pc.ass]. Again the paddle falls, your ass rapidly reddening under the raining blows. But soon pain turns to something else, and in moments you’re moaning as your bum is abused by the monster’s paddling. You buck forward on his hairy knees with each impact, your ass aching with a blooming need.");
	if(flags["BUTTSLUTINATOR"] == undefined && pc.ass.looseness() < 3 && pc.libido() < 70 && !pc.isBimbo()) output(" You never thought of yourself as an ass slut, but the sensation is driving you wild!");
	else if(pc.isBimbo()) output(" The sensation is driving you wild, like every other kind of sensation, really. You feel like a big, sensitive toy, every inch of your body just waiting to light up with sexual pleasure. Right now, it's your masochistic heiny, somehow wired up to the part of your brain that screams 'YES'!");
	else output(" The sensation is driving you wild, exactly what an ass slut like you needs! God, you love having your heiny toyed with!");
	if(pc.hasVagina()) output(" Juices dribble from your cunt, staining the Krampus’s hair.");
	if(pc.hasCock()) output(" Pre beads your cock, rubbing into the Krampus’s leg.");

	output("\n\n<i>“Naughty [pc.boyGirl]!”</i> the Krampus cackles. <i>“You must be disciplined!”</i>");
	output("\n\nAs quickly as you were tossed over his knees the Krampus lifts you up and bends you over the table. You yelp, then moan as his cock presses against your back door, rubbing against your dark star, his pre lubing you up for the inevitable reaming.");

	output("\n\nWhen he thrusts in, pleasure explodes through you. Your abused ass throbs around his shaft as he feeds himself deep inside of you. Fuck! You can be such a greedy masochist. You moan, twisting against his cock, but the Krampus easily holds you down against the table, pressing your cheek into the varnished wood.");
	pc.buttChange(300);

	output("\n\n<i>“You’ve been very naughty,”</i> the Krampus growls as he begins to fuck you, his jingle bells slapping your bum with every thrust. One rough, clawed hand squeezes your hip while the other pushes you roughly down. <i>“Very naughty indeed!”</i>");

	output("\n\nYou moan and begin to push back against his brutalizing cock. Oh yes. You’ve been naughty all year. You’ve been a ");
	if(!pc.vaginalVirgin || !pc.analVirgin || !pc.cockVirgin) output("naughty, dirty slut fucking your way across the galaxy");
	else output("bad [pc.boyGirl]");
	output(" and you need to be punished. Harder!");

	output("\n\n<i>“Krampus knows,”</i> the Krampus growls, suddenly widening his stance, thrusting at a new angle. Stars explode behind your eyes as his cock reach places you never knew existed. Your fingers claw at the beer stained wood. Fuck! This guy knows how to take someone’s ass!");

	output("\n\nSoon enough, you’re pushed past the brink. Between your throbbing ass and the half dozen inches of dick impaling you, you scream and cum, splattering the bar floor with your ");
	if(pc.isHerm()) output("cream and juices");
	else if(pc.hasCock()) output("cream");
	else if(pc.hasVagina()) output("juices");
	output(".");

	output("\n\n<i>“Naughty!”</i> the Krampus cries, spanking you with his hand, making you yelp and buck once more. <i>“Someone will have to clean that up! You should be more considerate! Like me, who’s going to cum in your slutty ass!”</i>");

	output("\n\nYou groan in agreement. He’s so considerate. Then you stop thinking, finding it far too hard as the Krampus suddenly increases his pace, brutally fucking you with even greater vigour. Soon enough you scream again, soaking the floor with your ");
	if(pc.hasCock()) output("[pc.cum]");
	else if(pc.hasVagina()) output("[pc.girlCum]");
	output(" a second time. As your ass clenches round the Krampus’s throbbing shaft, you drive the horned man over the edge. With a bleating cry he cums, hosing your bowels with his seed. You moan, twitching as his hot spooge stuffs your slutty rump.");

	output("\n\nThen, it’s over. With a grunt the Krampus pulls out of your quivering rear, admiring your spent form with satisfaction. <i>“Naughty naughty,”</i> the Krampus says, delivering a final swat to your cherry red ass before stalking away, vanishing among the watching crowd.");

	output("\n\nAfter a few minutes of simply recovering from your brutal reaming, you ");
	if(pc.isAssExposed()) output("hobble away, wincing at the pain in your tender behind.");
	else output("manage to pull up your [pc.assCovers], wincing as your clothes press against your tender behind.");
	output("\n\nWell, merry X-mas indeed!");
	processTime(15);
	pc.orgasm();
	var pp:PregnancyPlaceholder = new PregnancyPlaceholder();
	if(!pp.hasCock()) pp.createCock();
	pp.createPerk("Fixed CumQ",30000,0,0,0);
	pc.loadInAss(pp);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Nice]
public function niceCandyVariant():void
{
	clearOutput();
	showCandyRahn();
	output("Well, you don’t like to toot your own horn, but you’ve been very nice this year. Saving worlds and people. All that jazz. The Rahn’s eyes light up and she draws the candy cane teasingly from her lips. <i>“Well,”</i> she says, sliding her hands onto your shoulders, stroking your neck as she presses her jiggling body against yours, <i>“in that case, I think you deserve a present.”</i>");
	output("\n\nWell you do like presents. Candy gives you a sultry wink, pressing her ovipositor against your stomach. She loops her arms around your neck, leans up, and kisses you deeply.");
	output("\n\nHer lips taste like candy, and the inside of her mouth like chocolate. You pull her tight against you, kissing her hungrily. Your tongue plunders her mouth and she moans, wrestling yours. Her lashes flutter, her firm, malleable body molding against you. Her soft breasts press to your chest");
	if(pc.biggestTitSize() >= 1) output(", crushing your own soft mounds and making you tingle with desire");
	output(".");

	output("\n\nShe breaks the kiss, gasping, her lashes low. <i>“Mmm, not bad,”</i> she says, her tricoloured tongue flicking over her lips. You grin back, your mouth still thick with the candy taste of her. You give her another squeeze as she leans up. Her hands wander low and brush your ");
	if(pc.hasCock()) output("rigid shaft");
	if(pc.isHerm()) output(" and ");
	if(pc.hasVagina()) output("sopping cunt");
	output(". <i>“Looks like someone’s ready for their treat,”</i> she purrs, stroking you with tasty fingers.");

	processTime(4);
	pc.changeLust(5);
	clearMenu();
	if(pc.hasVagina()) addButton(0,"Vaginal Catch",takeCandysCandyCane,undefined,"Take Her Candy Cane","Let her bring the season’s greetings to your most intimate locale.");
	if(pc.hasCock()) addButton(1,"Titfuck",fuckCandysMarshmallows,undefined,"Fuck Her Marshmallows","Fuck her big, pillowy, marshmallowy boobs.");
	addButton(14,"Leave",leaveCandyRahn);
}

//[if Pussy: Take her Candy Cane]
public function takeCandysCandyCane():void
{
	clearOutput();
	showCandyRahn();
	output("She pulls you away from the bar and into the bathroom. Not what you normally associate with the X-mas venue, but then, for your present it’s a bit more appropriate.");
	output("\n\nShe pushes you against the wall, kissing you again");
	if(!pc.isCrotchExposed()) output(" while her fingers toy with your [pc.crotchCovers], soon enough undoing the front and baring your [pc.vaginas]");
	output(".");

	output("\n\nShe stops kissing you for a moment, her eyes hot and her puffy lips wide with lust. <i>“Ready to get your stocking stuffed?”</i> she asks, rubbing her thick ovipositor against your gash.");

	output("\n\nShe better believe it!");

	output("\n\nShe smiles again, and you feel the pressure of her rounded tip press against your folds. You moan, gasping as she pushes inside of you, filling your eager cunt with inch after inch of candy striped pseudo-dick. Her sizeable hips aren’t just for show. You’re practically lifted up the wall as she stuffs you further.");
	
	var x:int = pc.cuntThatFits(200);
	if(x < 0) x = rand(pc.totalVaginas());
	pc.cuntChange(x,200);

	output("\n\n<i>“Mmmm,”</i> she moans, and then she starts to move.");
	output("\n\nYou moan, grabbing her shoulders, bracing yourself as you bounce atop her thick fuckstick. There’s nothing for it but to enjoy the ride.");

	output("\n\nHer breasts heave and bounce as she pumps into you. The bathroom wall scrapes your back, and you catch sight of a mirror opposite you. You’re entranced by the vision of the candy-striped Rahn’s flexing ass, waist and hips as she bounces you on her cock. Almost as enraptured as the sight of you getting fucked by this holiday slut. You claw her back, your fingers sliding uselessly along her smooth skin.");
	output("\n\nYour orgasm isn’t long in coming. With every thrust her cock conforms to your depths, stuffing you like a good cock sleeve. Panting, gasping, you cry out, banging your head against the wall as you cum, juices squeezing round her ovipositor to splatter on the floor.");
	output("\n\nThe Rahn giggles, licking your [pc.nipple] hungrily");
	if(pc.isLactating()) output(", slurping up your [pc.milk] as it beads your skin");
	output(". As she does, you catch her humming something. Even as you finish cumming she continues to fuck you, driving you irresistibly onward to your next orgasm. To try and resist the desperate pleasure of your stuffed cunny, you try and focus on what she’s singing, difficult over your own ragged gasps.");
	output("\n\nYou cum again before managing to make out what she’s doing, but as she fucks you towards your third, you hear her breath hitching, her ovipositor throbbing in you with her own impending orgasm. <i>“Jingle bells,”</i> she gasps. <i>“Jingle bells. Jingle all... the... way!”</i>");
	output("\n\nThe last word comes as a scream. She arches, stuffing you as deep as she can, and cums.");
	output("\n\nYou groan as her seed fills you. Pumps deep into your eager depths. You gasp, your stomach swelling at the sheer amount of cum she’s unloading into your greedy cunt. You fall against her, whimpering as your third orgasm of the night rips through you.");
	output("\n\nGasping, Candy pulls out of your much abused cunny. Without her support you sag to the floor. Chocolate cum oozes from your gash, dripping onto the once clean floor. Her breasts heaving, Candy leans forward and scoops up a finger of her chocolaty spooge. She pushes her finger into your mouth, and you eagerly suck. Once you clean the dark taste of chocolate, you get to the candy taste of her fingers.");
	output("\n\nShe giggles, pulling her finger from your mouth with a pop. <i>“Merry X-mas,”</i> she says, and taps your taut, bloated belly, making it jiggle like a tub full of jelly. <i>“Hope you enjoy your present.”</i> Then she turns, and with a roll of her wide striped hips, leaves the bathroom.");
	output("\n\nYou sigh, spent where you sit on the floor, your stomach swollen");
	if(!pc.isPregnant()) output(" like you’re pregnant");
	output(". You grin goofily, stroking your taut belly.");
	output("\n\nAfter a time recovering you ");
	if(!pc.isCrotchExposed()) output("re-dress and ");
	output("waddle out of the bathroom and back into the bar.");

	processTime(20);
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	var pp:PregnancyPlaceholder = new PregnancyPlaceholder();
	if(!pp.hasCock()) pp.createCock();
	pp.createPerk("Fixed CumQ",30000,0,0,0);
	pc.loadInCunt(pp,x);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//If Cock: Fuck her Marshmallows
public function fuckCandysMarshmallows():void
{
	clearOutput();
	showCandyRahn();
	output("She wraps her hand around your bulge and pulls you out of the bar and into a nearby bathroom. You follow willingly, not sure what to expect, but more than happy to get your present. The bathroom is empty, and once inside the Rahn turns about and drapes herself against you. She kisses you hungrily, a sentiment you return with interest. You relish the candy taste of her lips and chocolate tang of her mouth. You moan, sucking on her tongue, wrestling with it as your hands wander across her plump frame.");
	output("\n\nYou give a little moan of protest as she breaks the kiss, her eyes shining like stars as she slides down your front. You catch your breath as she ");
	if(!pc.isCrotchExposed()) output("opens your [pc.crotchCovers] and frees your [pc.cockBiggest].");
	else output("fondles your [pc.cockBiggest] playfully.");

	if(pc.biggestCockLength() < 4) output("\n\nShe giggles at the sight of your tiny prick. <i>“Oh,”</i> she says, glancing up at your burning face. <i>“Don’t worry,”</i> she says, mashing your cock between her heavy tits. <i>“Maybe Santa will be good enough to bring you a bigger cock this year.”</i>");
	else output("\n\nCandy smiles as your [pc.cockBiggest] springs free. <i>“Oooh, there we go,”</i> she says, mashing your pecker between her massive breasts. <i>“Looks like someone has a present for me too.”</i>");
	output("\n\nHer long tongue flicks the head of your cock, making you jump. <i>“Let’s unwrap it, shall we?”</i>");
	output("\n\nYou wonder what she means by that, then wonder no more as she grasps her breasts and starts to move them, rubbing your cock in her soft tit flesh. You groan, grabbing a fortuitous sink behind you, thrusting into her heaving tits as she wanks you.");
	output("\n\n<i>“That’s it,”</i> she moans, submerging your shaft in her massive tits. <i>“Show Candy what you’ve got for her. Give her... mmm... a white Christmas.”</i>");
	output("\n\nThat won’t take long.");
	if(pc.balls > 1) output(" Particularly once her hand finds your balls and starts rolling them in her dexterous fingers.");

	output("\n\nYour breathing grows ragged as you come closer to orgasm. Candy’s eyes glow with lust as she feels your shaft throb with need. <i>“That’s it,”</i> she breathes. <i>“Deck my halls, stud.”</i>");

	output("\n\nEver accommodating, you cum with a roar, your [pc.cum] fountaining from your cock, painting the Rahn’s face, hair and breasts in your seed. Candy moans, mouth open to catch some of your cum. As you come down from your high, she releases your shrinking shaft from between her breasts and gives you a lusty grin.");
	output("\n\n<i>“Mmm. Usually I’m the one giving the presents,”</i> she says, swiping a lump of cum and licking it from her fingers. <i>“But ‘tis the season of giving.”</i>");
	output("\n\nShe rises, leans forward, and plants a kiss on your cheek. Before you can react she slips back and gives you a playful wave before sauntering away. The last you see of her is her candy-striped ass knocking the door shut behind her.");
	output("\n\nYou touch where she kissed, a dopy smile spreading across your face. You’re still smiling when you");
	if(!pc.isCrotchExposed()) output(" re-dress and");
	output(" leave the bathroom and return to the bar.");
	processTime(20);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Leave]
public function leaveCandyRahn():void
{
	clearOutput();
	showCandyRahn();
	output("You inform her you’ve actually got business elsewhere.");
	output("\n\n<i>“Sure,”</i> she says, tongue sliding along her candycane. <i>“I’ll be here all season.”</i>");
	output("\n\nHer wink makes your cheeks burn as you hurry away.");
	processTime(2);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}