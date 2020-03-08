/*The buttslutinator Mark 2, just as its name would imply, is a device designed solely for the purpose of enlarging the user’s posterior - and making them absolutely adore having it plundered.

It is roughly A-shaped, with a pair of joysticks for the user’s hands on one side and morphic cushions on the other to comfortably accommodate any size or shape of legs. A wide hole at the apex provides a comfortable berth for the victim’s genitals, carefully designed to provide the absolute minimum amount of contact.

When a user (victim) climbs into position, restraints snap around the arms, legs, thighs, and lower back, firmly securing them in place. A retractable screen will emerge in front of the user’s face, allowing them to select and crudely control the shape of the member they will be violated by. With the target distracted, autonomous injectors will rise up and deliver the doctor’s very, very special payload into each cheek.

Anal ravishing can then commence. No matter what commands are entered, orgasm by rectal stimulation is an inevitability. Only after stimulating the victim to climax numerous times is the victim released, though more often than not they climb right back in for a second (or third) dose.

Effects include but are not limited to: enlarged posterior, increased rectal nerve density, feelings of emptiness, stronger orgasms, regeneration via anal cum-absorption, sexual mania, headaches, spanking fetish, submissive tendencies, blood pressure spikes, and thinking of oneself as little more than property to be used and abused.*/

//Initial Encounter
public function buttslutinatorBonus(btnSlot:int = 0):Boolean
{
	if(currentLocation != "KQ N20") output("\n\n<b>This doesn’t belong, but it’s here anyway. Probably a fragment of future content, meant to appear somewhere not yet developed...</b> ");
	else if(currentLocation != "SHIP INTERIOR")
	{
		output("A pearly white, ‘A’-shaped device stands square in the middle of the room. Two control sticks flank the far side, clearly for the user’s hands, but how to use such a device? A strange gap is placed at the peak of the unusual ‘A,’ though the edges are both round and padded. The nearer side of the device is padded as well, made from some kind of spongy-looking material. When you take a step closer to it, the padding instantly adopts the shape of your [pc.legOrLegs], in perfect inverse.");
		output("\n\nYou suppose that you would have to bend over the top to use it. Strange.");
	}
	else output("\n\nThe “Buttslutinator” is installed and ready for use. It’s pearly white, ‘A’-shaped frame rests invitingly in a private corner of your vessel.");
	if(currentLocation == "SHIP INTERIOR") addButton(btnSlot,"Buttslutinator",useTheButtslutinator,undefined,"Buttslutinator","Put the “Buttslutinator” to work doing what it does best...");
	else addButton(btnSlot,"Use Device...",useTheButtslutinator,undefined,"Use Device...","Bend yourself over the bizarre device and see what it does. It’s obviously going to be sexual. Of that you can be sure.");
	if(currentLocation == "KQ N20") return kiroQuestHallwaysEncounters();
	return false;
}

public function slutPCButt():void
{
	var original:Number = pc.buttRatingRaw;
	var minChange:Number = 3;
	//Size increase first:
	if(original < 9) minChange += 5;
	else if(original < 13) minChange += 3;
	else if(original < 16) minChange += 1;
	pc.buttRatingRaw += minChange;

	pc.ass.bonusCapacity += 100;

	//Perk assignment
	if(!pc.hasPerk("Buttslut") && flags["BUTTSLUTINATOR"] == 1)
	{
		pc.createPerk("Buttslut",0,0,0,0,"Ensures your ass always remains bubbly and that fluids shot inside will heal your injuries.");
	}
}

public function useTheButtslutinator():void
{
	clearOutput();
	showName("\nTRAPPED!");
	//First Use
	if(flags["BUTTSLUTINATOR"] == undefined)
	{
		output("Leaning over the exotic machine, you feel your [pc.legOrLegs] press");
		if(pc.legCount == 1) output("es");
		output(" against the perfectly-molded padding");
		if(!pc.isAssExposed()) output(", but it pushes you away. Thinking that perhaps your choice in outerwear could be interfering with the device, you strip down and try again. It’s a perfect fit");
		output(". Your crotch sits above the hole");
		if(pc.hasCock() || (pc.balls > 0 && pc.ballDiameter() >= 1)) output(", and you’re instantly glad for it. You shudder to think of how uncomfortable it would be to crush your own bulge against the futuristic plastics that line this device");
		else output(", perfectly placed to take care of any boners, imaginary or not. Good thing you don’t have any such concerns");
		output(". Grabbing hold of the joysticks on the far side, you wiggle into place, " + pc.mf("chuckling","giggling") + " to yourself about how silly it is to bend over on such a goofy piece of tech.");
		output("\n\nYou don’t have a chance to change your mind. Metal restraints snap down across your wrists and ");
		if(pc.hasKnees())
		{
			output("ankle");
			if(pc.legCount > 1) output("s");
		}
		else output("[pc.legOrLegs]");
		output(", effectively immobilizing you, pinning you to the rigid ‘A’-frame. You strain and you struggle to little effect. No matter how you tug or wriggle, you can’t get free. The restraints are too secure. Whatever they’re made of is far too strong for you to wiggle out of, let alone to break through brute force. You’re locked down, imprisoned by the A-frame, held captive and subject to whatever devious machinations are in store for you.");
		output("\n\nBefore you can call for help or make more than a few half-hearted tugs against the metal bands, a holographic viewscreen surfaces from between the immobile joysticks, glowing with blue-tinted views of impressive derrieres - and even more impressive penises, plowing them wide-open. They jiggle and bounce. Those fine-ass booties ripple and quake, perfect examples of posterior flesh seemingly designed to be split wide-open by the superior shafts. Their lovely sphincters take it so well that you briefly wonder if they were genetically engineered to be plowed so violently. The sight is singularly arousing and intriguing. Warmth rises through you");
		if(pc.hasCock()) output(", surging to your [pc.cocks], flooding supple dickflesh with the molten warmth of arousal.");
		else if(pc.hasVagina()) output(", surging through your [pc.vaginas], filling your most sensitive flesh with the desire for touch, the honeyed promise of stimulation.");
		else output(", carrying the promises of pending pleasure whether you have the necessary organs or not.");

		output("\n\nA pinprick on your buttcheek is the first warning you get that something untoward is going on... besides the restraints, anyway. Any hope that this was a sophisticated bondage toy is quickly dispelled.");
		output("\n\nYou look back, concerned by the sight of robotic arms poised above your [pc.butt]. There are two of them, each tipped with a narrow needle, each lodged deep in the meat of your hindquarters. They shouldn’t be there. They definitely weren’t there when you climbed in, and you certainly didn’t sign up to get injections directly into your butt. Still, it doesn’t hurt <i>that</i> bad. The painful pricks have already faded into a dull, forgettable ache, almost mild enough for you to put the bodily invasion out of your mind while they withdraw from your ass.");
		output("\n\nYet you can’t quite ignore the needles poised behind you, connected to sinister, metallic umbilicals. Whatever nefarious payload they were once loaded with is seemingly long gone, harmlessly deposited directly into your veins, but you can’t help but feel that there is more to all this.");
		output("\n\nOne last time, you futilely struggle against the metallic restraints. Something isn’t right here. You might not be feeling anything just yet, but you’re pretty sure that you shouldn’t be restrained and injected by strange furniture, no matter how high-tech it seems (or how hot the porn on its viewscreen might be).");
		processTime(5);
		pc.changeLust(40);
		clearMenu();
		addButton(0,"Next",firstButtSlutPart2);
	}
	//Use A Second Time
	else if(flags["BUTTSLUTINATOR"] == 1)
	{
		showName("BUTTSLUT-\nINATOR");
		output("Your heart flutters at the mere suggestion of mounting this insane device a second time, but your pucker clenches. You didn’t come out any worse for the wear after the first time - sure, your butt’s a little bigger and a little more sensitive. Maybe you picked up a bit of a fetish or whatever, but it didn’t turn you into some simpering slut who’ll bend over at the hint of a hard dick. This is just a quick, fun break before you get back to ");
		if(9999 == 0) output("saving Kiro");
		else output("exploring the galaxy");
		output(".");
		output("\n\nClimbing back onto the strange, ass-obsessed machine’s ‘A’-shaped frame, you grin and place your hands on the joysticks. You know they don’t control anything of consequence, simply existing to give you something to hold and squeeze while the lewd frame does its magic work. Restraints snap around your limbs, and the monitor rises up once more. This time, you get a look at the start-up screen:");
		output("\n\n<i>Buttslutinator 2.0 engaged.");
		output("\nScanning subject...");
		output("\nSubject identified, designation slut#23...");
		output("\nAnal fetish: 66%");
		output("\nAss enhancement: " + Math.round(pc.buttRatingRaw/19*100) + "%");
		output("\nNerve optimization: 50%");
		output("\nProgramming: 25%");
		output("\nCommencing treatment...</i>");

		output("\n\nOh. <i>Oh fuck.</i> This might have been a bad idea after all, but it’s too late to change your mind. The bindings have closed over your arms and [pc.legOrLegs], and no force short of a plasma cutter is going to get you out of them. You don’t bother to struggle, instead listening to the sound of your heart hammering in your ears. It isn’t panic that makes it race so: it’s arousal. Much as you may want to deny it, you’re getting a perverse thrill from being this machine’s plaything once more, bound and helpless, subject to its ass-eroticizing programming once more.");
		output("\n\nThe sharp pinch of a needle poking into your [pc.butt] jolts you from your reverie. Flushing hotly, you become shamefully, achingly aware ");
		if(pc.isHerm()) 
		{
			output("of how hard and wet you’ve grown in such a short time. Your [pc.cocks] could split wood but instead dangle");
			if(pc.cockTotal() == 1) output("s");
			output(" uselessly, fitfully pulsing as ");
			if(pc.cockTotal() == 1) output("it");
			else output("they");
			output(" jut through an opening too large to give ");
			if(pc.cockTotal() == 1) output("it");
			else output("them");
			output(" any stimulation. Your [pc.vaginas] ");
			if(pc.totalVaginas() == 1) output("is");
			else output("are");
			output(" no better. Your netherlips are swampy with heat, and your [pc.clits] ");
			if(pc.totalClits() == 1) output("is");
			else output("are");
			output(" as rigid as ");
			if(pc.clitLength < 3)
			{
				if(pc.totalClits() == 1) output("a bullet");
				else output("bullets");
			}
			else 
			{
				output("your dick");
				if(pc.cockTotal() > 1) output("s");
			}
			output(".");
		}
		else if(pc.hasCock())
		{
			output("how hard you’ve grown in such a short time. Your [pc.cocks] could split wood but instead dangle");
			if(pc.cockTotal() == 1) output("s");
			output(" uselessly, fitfully pulsing as ");
			if(pc.cockTotal() == 1) output("it");
			else output("they");
			output(" jut through an opening too large to give ");
			if(pc.cockTotal() == 1) output("it");
			else output("them");
			output(" any stimulation.");
		}
		else if(pc.hasVagina())
		{
			output("of how ludicrously wet you’ve grown in such a short time. Your [pc.vaginas] ");
			if(pc.totalVaginas() == 1) output("is like a swamp");
			else output("are like swamps");
			output(", beyond damp and sordid with their own needy leakage.");
		}
		else output("of how ready you are for this, how sensitive and clenching your [pc.asshole] has become. It could thrust its dildo inside right now, and you’d just moan and whimper, no lube necessary. Then again, if your memory serves you correctly, that dildo is so slick it may as well be made of teflon.");
		output("\n\nThere’s a salty, mediciny taste in the back of your throat that you didn’t notice the first time you did this. Weird how injections can do that. Your [pc.butt] is practically glowing with foreign warmth. Either the ‘nerve enhancement’ you got is making you more aware of the chemicals it’s pumping into you, or it’s putting a lot more of them into your body this time. It’s like there’s spiderwebs of warmth spreading out just under the [pc.skin] of your ass, tingling and pulsing, making your heart flutter and your [pc.asshole] quiver. You can feel the inner walls rubbing against one another, shooting flashes of pleasant sensation up your spine until you’re trying to arch your back and gasp in delight.");
		output("\n\nThe screen clicks over to the pornographic feed, and you’re amazed by the resolution. The image appears almost holographic, like those bouncing asses and throbbing, butt-hungry phalli are projected directly into your retinas. There’s some kind of interference though, pulsing through the feed, making the image brighten and flicker to a rhythm you just can’t place. You can’t see your eyes dilating, but you can feel it. The room seems almost too bright, but the dusky cuties’ booties make it easy to tune out everything else. You feel your sphincter loosen in anticipation, relaxing until your asshole is hanging open in between clenches, delirious and ready to be taken.");
		output("\n\nEmerging from a secret compartment in the ‘Buttslutinator,’ a dildo rises up behind you. You can hear the servos whirring as it’s brought up. Drool puddles below your limp tongue which even now hangs from your open mouth in lewd anticipation. You push your [pc.butt] back as far as you can, maybe a centimeter at most, and hope the dildo will thrust inside, hope it will split you open once more and fill the hollowness within you.");
		output("\n\nYou can see now why the girls on the screen look so wanton, so submissive. Being empty and unfucked is absolute torture. Why would you look plain and unappealing when you could slut yourself to the nines? When your ass is wrapped up in tight lycra, you can rub it back against a bulging boy’s crotch and tease him into putting it inside. Your eyes start to roll back at the blissful thoughts but dart back to the screen before it can slide out of view. The images are simply too captivating to ignore, even as you imagine hands on your ass, digging into your plush cheeks while you’re fucked over a table.");
		output("\n\nThe dildo slides in perfectly, like your ass was tailor made to sheath the lovely, ever-turgid member. Even though it feels bigger than the one you took last time, accepting it is no problem. A note of pride wells up in you at the realization that you’re a better buttslut than you used to be, that your ass is more fuckable than ever before. You bet the hung stud you’ve imagined for the past few moments would have no problems squeezing on in. Once he bottoms out, he could slap your callipygean cheeks and make them clap together around his sheath.");
		pc.buttChange(100);
		output("\n\nYou moan, and the dildo slides in and out, strumming nerves that have been chemically primed for pleasure. You can still feel the needles lodged in your bum, pumping more of that mystery cocktail inside. That’s probably why you’ve gotten so sensitive back there, and why every stroke of the silicone shaft through your simmering sphincter feels like a miniature orgasm all it’s own. You swear the sensations get stronger moment by moment, making rational thought near impossible, making your [pc.hips] wiggle and your [pc.legOrLegs] kick.");
		output("\n\nThe girls on the screen are still going at it, mewling and moaning much like you yourself. You feel a certain kinship to them, a bond of ecstasy that transcends mere mortal bounds. They’re getting to be fucked by big, warm cocks while all you have is a measly machine. Your lusty bottom deserves... no, it needs more. It needs to feel a swollen, New Texan horse-cock plowing it wide open while a knotty ausar squeezes in alongside, stretching you wider than any of those screen-girls. You could have that, you realize, if you slutted it up enough. Maybe you could find some panties with a target on the back - and a gap in the center of it.");
		output("\n\nSquelching loudly, the dildo fucks you faster and faster, knocking the breath from your lungs and the sense from your head. Words flicker in the periphery of the screen in between flashes of ass and dicks:");
		output("\n\nFlash! <i>Needy buttslut.</i>");
		output("\n\nA triple-dicked laquine is onscreen, squirting into three different booties, all smaller than yours, while a kaithrit nuzzles lovingly into her spasming backdoor. Tongue slides in...");
		output("\n\nFlash! <i>Need fucked.</i>");
		output("\n\nTwo ausar bouncing on a pair of rahn ovipositors, their luscious heinies wobbling and shaking as the eggs flow in...");
		output("\n\nFlash! <i>An empty ass is a naughty ass. Obey.</i>");
		output("\n\nA kuitan does a handstand while a gryvain pours cum through a funnel into the furry bitch’s wide-stretched pucker.");
		output("\n\nPictures and words flash across your glassy eyes, inexorably drawing you toward orgasm, teaching you to love your ass almost as much as you love the things that can fill it. Cocks are the best choice, but in a pinch a bellyful of cum might do. And when all else fails, you can buy a transparent anal plug so that when you bend over, you can show the whole world just how ready to be fucked from behind you are.");
		//Dick
		if(pc.hasCock())
		{
			output("\n\n[pc.Cum] splatters the floor. [pc.EachCock] is a fountain, a pumping, squirting fountain that lets loose fresh jets every time the dildo bumps your oh-so-sensitive prostate. You can’t imagine what purpose it could serve besides being an orgasm-button for your ass. You bet that you could curl a finger up in there and bring yourself from zero to squirting in a second, judging by how good it feels, how swollen and ready to be milked it is. Somehow it feels right to cum like this, entirely from your ass. Dicks are for other people to fuck you with. Yours ");
			if(pc.cockTotal() == 1) output("is");
			else output("are");
			output(" little more ");
			if(pc.cockTotal() == 1) output("a vent");
			else output("vents");
			output(" for anal pleasure, something to let the people using you see just how much you love being fucked.");
		}
		//Else /Vagina
		else if(pc.hasVagina())
		{
			output("\n\n[pc.GirlCum] ");
			if(pc.isSquirter()) output("splatters");
			else output("dribbles");
			output(" to the floor, hanging from your quivering cuntlips in a curtain of licentious lubricant. You’re grateful for the built-in lube dispenser. The next partner in line could wet his dick in the feminine flow and be ready to bust in your back-door the moment your previous lover pulls free - but not before giving you a healthy glaze, of course. Less lucky buttsluts would be happy to have you around. You imagine yourself lined up next to a bunch of panting shemales, letting dozens of big bulls slick their tools in your drippings before violating the squirting, infinitely femmy former-boys.");
		}
		//Else
		else output("\n\nOther genitals would be a godsend. Not because they could possibly feel as good as your ass, but because the squirting and leaking would be so useful when you get used next. Not every dick is as perfectly slick and slippery as this dildo, and if cum were leaking out of a well-milked prostate, your next partner could lube up for his fun. A pussy would be just as good, all wet and slovenly with silly, girlish lust. It’d drip and dribble at the promise of a good buttfuck, and vaginal makes for good foreplay, right?");
		//Merge
		output("\n\nThe number of asses onscreen double, not because more of your sister-sluts are getting plowed but because you can’t keep your eyes from crossing. You can’t keep yourself from moaning or talking dirty either. Words spill out of your lips entirely on their own, begging the machine to fuck you harder, demanding it turn you into sluttiest cum-dump this side of the milky way. You won’t be happy until there’s enough spunk in your ass for it to be the true ‘milky way’ and the galaxy is seen as a pale imitation.");
		output("\n\nCummy, slippery thoughts won’t stop sliding through your climaxing brain, and you don’t want them to. You love it here, clenching and orgasming, feeling your ass slowly continuing to expand, transforming into an anal-fetishists wet dream. With each wave of pleasure, you feel less aware yet increasingly happy, delirious even. The dildo pops out, but you keep cumming, not from pleasant interior soreness but from the sense of your [pc.skin] stretching out over an increasingly swollen ass. It’s tight and yet still jiggly. Whenever the pleasure becomes too much, your muscles pulse and squeeze in tandem, twerking the cheeks one after another.");
		output("\n\nIt’s almost too much to endure, being this sexy, this fuckable. Even when you’re drooling and over-fucked, your body looks like it’s begging for more. The corners of your wide-open mouth quirk upward as your conscious mind is shut off, orgasm by orgasm, exposing your bare subconscious to the flashing images and words, allowing the wanton video to further etch itself in your mind. A larger dildo swings up, the perfect match to your larger backside, and you shut down completely, panting like an animal.");
		processTime(65);
		for(var x:int = 0; x < 15; x++)
		{
			pc.orgasm();
		}
		clearMenu();
		addButton(0,"Next",secondButtsluttening);
	}
	//Use The Third Time, You Fool!
	else
	{
		showName("BUTTSLUT-\nINATOR");
		output("Fuck the consequences. You don’t care if the screen or the drugs turn you into some anal obsessed slut. You’re pretty sure you already are, anyway. How much more whorish could you possibly get, anyway?");
		output("\n\nYou ");
		if(!pc.isNude()) output("disrobe and ");
		output("climb into position, smiling at the comforting presence of the hard, metallic restraints when they close around your wrists, binding you to joystick-like grips. The screen pops back out, and you’re already breathing hard in anticipation, your [pc.asshole] flexing wantonly. Images of dozens of different studs and herms flit through your mind, all with their dicks out in response to the sight of your upraised ass.");
		output("\n\nYou nearly miss the Buttslutinator’s startup screen.");
		output("\n\n<i>Buttslutinator 2.0 engaged.");
		output("\nScanning subject...");
		output("\nSubject identified, designation slut#23...");
		output("\nAnal fetish: 100%");
		output("\nAss enhancement: " + Math.round(pc.buttRatingRaw/19*100) + "%");
		output("\nNerve optimization: 90%");
		output("\nProgramming: 60%");
		output("\nCommencing final programming...</i>");
		output("\n\nFinal programming has a certainly ominous ring to it, but instead of blanching, you find yourself looking forward to it. You’ve enjoyed butt-expanding, ass-fucking step of this path so far. Surely taking it all the way to completion will be utter, absolute nirvana. You look back over your shoulder as far as you can, watching the familiar mechanical tentacles rise up into position, tipped with their glinting needles, and instead of panic or apprehension, all you can summon up is anticipation.");
		output("\n\nThey snap down, burying their special cocktail of booty-boosting chemicals into your more-than-supple derriere, jiggling the cheeks with the impact. You " + (pc.isBimbo() ? "giggle" : "laugh") + " madly and turn back to the screen, pleased as a fucked-out slut on a frat-room floor to see that the familiar porn has returned. It’s just as hot as you remembered and yet somehow the clips are all brand new. You’re pretty sure at least one of the segments is Steph Irson getting taken by a few dozen tentacles as well.");
		output("\n\nA quick, staticky cut replaces the star of Galactic Huntress with a more familiar backside - your own. It’s from the last time you strapped in, and stars above, you have a fantastic butt. It’s so big, and growing bigger by the minute, feeding off the bubbling hoses sticking into each cheek and twitching from the dildo’s orgasmic strokes.");
		output("\n\nDrool oozes down your chin before you shake yourself out of your trance. The reaction was immediate and powerful - you wanted to tongue out your own ass. You wanted to slip your tongue inside that butt and make it nice and slippery with lust. Just imagining the muscle clenching down, driven to spasms of pleasure by your attention has you feeling hazy and lightheaded.");
		output("\n\nOr is that the drugs? You realize that you can feel small pinpricks of pain and pressure. The hoses are pressing <i>hard</i> against your body. You can hear them bubbling with all the fluid passing through them, but where is it going? Certainly not into your asshole! You’d feel it if something big, hard, and cylindrical was filling you up back there. Feel it and probably cum as a matter of fact! Your [pc.asshole] flexes powerfully, demandingly. It’s hungry, you realize - hungry for that big, fat silicone fuck-stick that you know this device is hiding somewhere.");
		output("\n\nYou shake your head and swoon, concerned for the half-second it takes your blurring vision to catch up to your motions. Then it catches back up to the perfectly captured porn on the screen, and you giggle dizzily, awestruck by just how much ass has filled your vision. The current frame is layered over the half-dozen frames behind it, presenting you with the same ass through an array of different times and places, framed by bright pink words that fizz and pop against your cerebellum, making you moan and drool all over again.");
		output("\n\n<i>“Big butt slut,”</i> you mouth, then giggle, idly twerking, feeling your too-juicy hindquarters quiver and shake. You wish it was on the yummy screen, framed by the words that seem increasingly prevalent in the pornographic montage. Phrases like <i>“good sluts get fucked”</i> and <i>“eager pets get to play”</i> seem particularly important, but you can’t seem to shake the more boring words either. <i>“Obey.”</i> It’s so singular next to the others that it rattles around in your dizzy little head, bouncing with all the kinetic energy of your oh-so-fuckable ass.");
		output("\n\n<i>“Obey.”</i> It spills from your lips without conscious thought. Your asshole relaxes at the thought, and your eyes dilate. A dozen images of girls and boys alike, all cumming from getting fucked, flashes by in an instant, underscoring a none-too-subtle point: <i>Obedience is pleasure.</i> It makes sense. Why else would the word be so large and accompanied by such delightful imagery. Once the word fades, it still lingers there whenever you see someone climax. <i>She must be obeying.</i> The thought arrives unbidden.");
		processTime(15);
		pc.changeLust(1000);
		clearMenu();
		addButton(0,"Next",buttSlutBadEnd);
	}
}

public function buttSlutBadEnd():void
{
	clearOutput();
	showName("BUTTSLUT-\nINATOR");
	output("Though the Word has faded from your sight, no longer displayed all capitals on the screen, it remains seared in all capitals on the surface of your vulnerable brain. It makes so much sense. You marvel in awe at the genius of this wonderful new discovery. Of course obedience brings pleasure. Nobody wants to fuck a disagreeable Debbie. If you put your forehead on the floor or lick a dick-wielder’s sweaty balls, of course they’ll be more likely to fuck you.");
	output("\n\nThere’s hundreds of words blurring together on the screen, words that seem like detailed instructions, yet they drift right past your conscious mind. You’re too busy congratulating yourself on a well-thought out piece of philosophy to examine the thoughts taking root in your hazy little head. And if you’re obedient, you don’t have to think all that hard, really. You can focus on your [pc.butt] - and the best ways to present it. You can look and act sexy instead of worrying about sounding smart, though you bet a smart tongue might get the right boy or girl to fuck you twice as hard.");
	output("\n\nCock appears against your [pc.asshole], sliding smoothly inside your ultra-tender hole, making it strain deliciously with its girth. This is the biggest, best dildo yet. The head is fat and flared, stretching you wide to make room for the veiny length behind, and a series of three swollen knots line the shaft, delighting you with their texture and shape, allowing your sphincter to alternate between stretched wide and pleasantly slack.");
	pc.buttChange(500);
	output("\n\nThat’s just perfect. Really, any sized dick would feel like heaven, but there’s something special about feeling your cheeks being pushed wide by the member itself and discovering the exact shape of its tip in the distention it makes in your belly. It slides in and out with perfect precision, delighting your nerves and robbing your muscles of strength. It’s the perfect complement to the dazzling porn collection ahead, letting you feel just as fucked as each of those girls.");
	output("\n\nMore fucked, even. They aren’t learning about how buttfucking is a reward - how it’s the most powerful, pleasant thing in the world. Your body agrees, singing songs of beauty and perfection with every ass-stretching slide in. If this thing is supposed to be brainwashing you, it’s not really doing all that much.");
	output("\n\nIt’s really just helping you discover things about yourself, like the importance of your own asshole, and different ways to get it fucked. You space out for a few seconds, imagining a few dozen ausar, male and herm alike, jacking themselves off into your knot-gaped asshole, turning you into a sloppy, well-used cum-bowl. An orgasm rocks your frame, but it isn’t as debilitating as the ones you had the previous two times. You suppose you’re getting more used to your enhanced butt and the pleasures it provides.");
	processTime(60);
	clearMenu();
	addButton(0,"Next",buttSlutBadEnd2);
}

public function buttSlutBadEnd2():void
{
	clearOutput();
	showName("BUTTSLUT-\nINATOR");
	output("You bounce in your restraints each time the machine brings you to orgasm, flexing muscles that make your oversized ass-cheeks bounce and clap, your pleasure audible for anyone to hear. Your tongue lolls and your head swims, filled by sights and words that seem as obvious as a second-grader’s homework. Of course there’s no shame in kneeling and holding your ass open with both hands. How else should one offer oneself to their master?");
	output("\n\nThe fucking never seems to end. After what you assume is an hour, the dildo is replaced with bigger, meatier one, this one more human in shape. It feels every bit as great as the last. Sizzles of ecstasy electricity arc through your dopey, drugged-up brain, and the closest thing you can offer to resistance is a lurid moan. It’s too good not to.");
	pc.buttChange(1000);
	output("\n\nYour body is a plaything, a toy, a possession for the closest, most virile cock-packing person. They could be short and chubby, you wouldn’t care. They could be lanky and submissive, but you’d tease them into using your ass - that, you’re sure of. You’d teach them how to give commands, just so that you could get the thrill of obeying them. And if you found a confident, hung herm with a cock the size of a baseball bat? Fuck, you’re drooling again.");
	processTime(120);
	for(var x:int = 0; x < 15; x++)
	{
		pc.orgasm();
	}
	pc.changeLust(100);
	clearMenu();
	addButton(0,"Next",buttSlutBadEnd3);
}

public function buttSlutBadEnd3():void
{
	clearOutput();
	showName("BAD\nEND");
	output("By the time the machine lets you go, you’re well and truly fucked, mentally and physically. You know that if you kneel down put your ass in the air, someone will come by to fuck it - someone who will claim you and ensure that you’ve always something inside it. You can think of nothing better. Sure, you’ll never get your inheritance, but your cousin can have it. " + rival.mf("He","She") + "’ll never know the happiness you’ve found at the end of a leash.");
	badEnd();
}

//[Next]
public function secondButtsluttening():void
{
	clearOutput();
	showName("BUTTSLUT-\nINATOR");
	output("You come to on the floor next to the machine, propped on an ass almost too thick and juicy to be believed. Glowing with approval, you stagger up and collect your things. You don’t even rightly remember taking them off, truly.");
	output("\n\nCould you complete your journey bottomless? Surely such an enticing booty would be irresistible to this galaxy’s biggest, strongest dicks. Why, you wouldn’t even need to walk anymore! You could just find yourself a hulking brute to fuck your ass for the rest of your journey, carrying you around on his pole like an ornament.");
	output("\n\nYou glance back at the machine, feeling suddenly hollow, deeply so. If you climbed back in, you wouldn’t have to find someone to fuck. Is a little mental reprogramming too steep a price to pay for endless anal pleasure?");
	output("\n\nWhatever the case, <b>you’re definitely a buttslut now.</b> Your doubt you’ll ever be able to have a small ass again, let alone go unfucked for more than a few days.");
	if(!pc.hasPerk("Buttslut")) output("\n\n(<b>Perk Gained: Buttslut</b> - Ensures your ass stays large and in charge, and allows you to heal from anal cumshots.)");
	slutPCButt();
	IncrementFlag("BUTTSLUTINATOR");
	processTime(75);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function firstButtSlutPart2():void
{
	clearOutput();
	showName("\nTRAPPED!");
	output("Escape seems impossible. Who knows what would happen if you had been struggling when those needles went to inject you? Faced with an impossible situation, you do the only thing you can - try to relax and enjoy it. Surely this thing will release you in time, and whoever designed it must have done so with some sort of plan in mind. At the worst, you figure you’re going to get out of this with a mind full of porn and an ass bruised by some sadist’s idea of a good time. If you’re lucky, whatever was in that injection will just make the porn look really, really good - not that it doesn’t already.");
	if(pc.isBimbo()) output(" Those girls are like, totes yummy!");
	output("\n\nThe burgeoning warmth flowing through your veins supports this idea, loosening your limbs and damping down on your concern. It’s easier to look back at the viewscreen than to keep fighting, easier to watch the giggling girls with the jiggling posteriors spread themselves wide for every breeder that comes their way. Plush derrieres give way to rigid dicks before your eyes. Tight booties beckon to be plowed by burly boners. A slideshow of anal annihilation passes before your eyes, hotter than it has any right to be. Your skin flushes, and you become very aware of just how upraised, how utterly exposed your own [pc.butt] is.");
	output("\n\nAnyone could walk up and thrust inside you. Anyone could fuck your ass without so much as a <i>“how do you do?”</i> Your cheeks flush a deeper scarlet than you ever thought possible, and your [pc.asshole] clenches. No matter how repugnant the idea, there’s a certain appeal to it, a certain sort of sense to being anally taken. An upraised ass is meant to fucked, isn’t it? Why else would it be displayed so brazenly? Sure, in your case, you’re being forced into such a compromising position, but anyone who voluntarily adopted such a pose would surely be doing it to incite sexual gratification.");
	output("\n\nThe worst part is that you aren’t even that horny. You could probably come to enjoy this if you were properly riled up, but instead, you’re only moderately turned on. There’s something missing, something itching at the back of your mind that would make this situation one hundred percent more tolerable, and it isn’t sex. No, it isn’t the back-and-forth stroking of a turgid pecker, though that isn’t far from what you crave.");
	output("\n\nYou feel empty. There’s a hollowness in you, an emptiness that you’re only now coming to understand, a secret desire to seek out something, anything to make you feel whole once more. Opening your eyes wide, still watching the anal erotica, you realize exactly what you want: you want to be filled. You want something inside you like the girls on the screen. It could be a nice, fat toy, or it could be a pulsating phallus, thrusting so deeply into your depths that there can be no room left for doubt.");
	output("\n\nHow didn’t you notice it before? How didn’t you notice how empty, how awfully your anus aches? If your arms were free, you would be stuffing your fingers - no, your fist up inside yourself. You could find something, anything to tame the void within. It isn’t a sexual desire. It’s simple physics. Your asshole is empty, and like any other void in nature, the force of its yawning vacuum will attract something to fill it in time.");
	output("\n\nThe porn you’re watching seems so much clearer now. Those expressions of rapture aren’t sexual in nature. They’re... religious, an affirmation of the proper way of the universe. Your [pc.thighs] flex against the restraints, not in an effort to escape but in an effort to open wider, to pull your cheeks apart and better reveal your [pc.asshole]. Only now do you see the sublime beauty of your bondage, how it perfectly aligns your body to be plundered by the first passerby.");
	processTime(13);
	pc.changeLust(50);
	clearMenu();
	addButton(0,"Next",firstButtSlutPart3);
}

public function firstButtSlutPart3():void
{
	clearOutput();
	showName("\nTRAPPED!");
	output("You’re so lost in the onscreen reaming that you don’t even notice the machinery whirring behind you. There could be a small army of needles about to inject you with another dose of worthless drug, and you wouldn’t be any the wiser. Luckily, this device’s designer has no such trickery in mind - at least not yet.");
	output("\n\nThe object climbing into position behind your vulnerable pucker is exactly what you need. Contact between the shaped, silicone head and your ");
	var loose:Number = pc.ass.looseness();
	if(loose >= 4) output("yawning asshole");
	else output("hungry star");
	output(" is all you could ask for and more. Overheated nerves sizzle and melt. The friction feels like buttered grease, a smooth massage of your most intimate, hidden places. It doesn’t stop there, of course. The dildo presses on with the inexorable force of a machine, stretching you wide open, forcing your [pc.asshole] to yield every bit as easily as the girls on the screen. They look so happy, smiling and gasping, mouths open and tongues lolling.");
	pc.buttChange(40);
	//buttchange
	output("\n\nA perfect, sensuous squelch fills the air as the artificial erection buries itself deeply into your slutty rectum, and you realize that you must look just like them. You’re bent over with your ass in the air, stuffed full of cock and thrilled to be that way. Belatedly, you wonder if this should be harder - if anal sex should be this easy, this effortless.");
	if(loose >= 4 || pc.analCapacity() >= 500) output(" Even though you’re well practiced back there, usually there’s at least some lubing to be done in one way or another.");
	output(" But here, in this place, ");
	if(loose < 4 && pc.analCapacity() < 500) output("it seems the natural way of things.");
	else output("none of that seems necessary.");
	output(" The cock can slide right in, nestle itself ");
	if(pc.hasCock()) output("up against your prostate");
	else output("deeply into your gut");
	output(", and give you the filling that you crave.");
	output("\n\nOnly filling isn’t enough. It’s a start, a step toward a righteous nirvana that seems so close and yet so far. You flex your cheeks, feeling yourself clenching down, adding a smidgen of extra sensation to an almost divine fulfillment. Your cheeks are burning hot with arousal now, not from the drugs or the barrage of porn (though they help) but from your own butt. Every inch of your derriere seems alight with sensation, inside and out. The whisper of a breeze against your asscheek is like a lover’s tongue, and the dildo inside you is absolutely dominating your senses, demanding your full attention.");
	output("\n\nThen it moves.");
	output("\n\nYou shriek with pleasure and buck against the restraints, hapless to do anything but attempt to further intensify the already overwhelming pleasure. The porn is still blaring, still jumping between pleased, feminine faces and lush asses, split wide open by big cocks and bigger dildos, but you don’t truly see it, at least not consciously. Some part of you does, maybe");
	if(pc.hasCock()) 
	{
		output(" the part of you that’s making your [pc.cocks] spasm");
		if(pc.balls > 0) output(" and your [pc.balls] boil over.");
	}
	else if(pc.hasVagina()) output(" the part of you that’s dripping down the inside of your thighs, nearly gushing from the contact sensation of this perfect buttfuck.");
	else output(" the part of you that never wants this to end, squeezing and bucking.");

	output("\n\nYour asshole almost seems distinct from the rest of you, an object whose purpose is only to provide pleasure, an instrument to be strummed, radiating endless sensual delights. There’s no ignoring it. It sits at the forefront of your thoughts, aquiver with erotic energy. You can hear the sound of it getting fucked, but the raw, beautiful feeling of the buttfuck completely drowns it out. Your asshole is all that matters, squeezing and sliding and clenching and supernovas of ecstasy, one after another, blasting through your brain in white-hot lances.");
	output("\n\n");
	if(pc.hasCock()) output("[pc.Cum] squirts and dribbles. It splatters on the floor beneath the machine, hot and musky, a steaming puddle that only grows larger by the minute. You can’t control it, ");
	else if(pc.hasVagina()) 
	{
		output("[pc.GirlCum] ");
		if(pc.isSquirter()) output("splatters the ground");
		else output("drips down the sides of the machine");
		output(" from your endlessly twitching, inferior hole");
		if(pc.totalVaginas() > 1) output("s");
		output(". Pussy just can’t compare now that you’ve had this. Really, what use is a pussy, if not to lube up a dick before it slides into your terribly wanton asshole? You can’t control the flow of girlish cream, ");
	}
	else output("You can’t control yourself, ");
	output("not with your ass being so savagely used. More needles jab into you, but there isn’t room in your brain to register the pain. There is only pleasure, all-consuming and molten hot, burning away old inhibitions to forge new linkages in your brain - linkages to new grown nerves and the swelling, expanding volume of your ass.");
	output("\n\nThe screen switches off the porn, showing you a view of your own backside from some hidden camera, allowing you to watch the bubbly cheeks bloat with new weight, jiggling and rippling around the fast-fucking dildo. It’s a big, impractical booty, the kind of ass that can barely be squeezed into a decent pair of pants and even then advertises how luscious and fuckable it is. And then it gets bigger. Your ass is a swollen mountain of fuckability, a jiggly billboard with the words ‘Fuck Me’ plastered across both sides. It wobbles one last time, hypnotically, rippling in orgasmic fervor, and mercifully, you black out, slumping limply against the machine’s frame.");
	processTime(45);
	slutPCButt();
	for(var x:int = 0; x < 10; x++)
	{
		pc.orgasm();
	}
	clearMenu();
	addButton(0,"Next",firstButtSlutPart4);
}

public function firstButtSlutPart4():void
{
	clearOutput();
	showName("FREE\nAT LAST!");
	output("When you come to, you’re still sprawled on the machine, exhausted. The restraints have disappeared. The viewscreen has retracted back into the frame, but the memories are still there. Your [pc.asshole] is sore, well-used, yet it’s a pleasant kind of soreness. You barely stop yourself from slipping a finger inside to see how it would feel with a shake of the head, clearing the foreign thoughts away.");
	output("\n\nThis thing tried to program you into some kind of... some kind of butt slut! Climbing up, you look back at your rear, denying the thrill that rushes up your spine at the sight of your supremely fuckable, bubbly butt. <b>Your ass has been significantly enlarged, and seems much more elastic.</b> What would happen, you wonder, if you climbed back in? Would it turn on again? Would it make your butt even bigger and squishier? Would you get to cum to the sight of your own asshole being plugged by progressively bigger dildos?");
	output("\n\nYou shudder and step away... for now.");
	processTime(50);
	clearMenu();
	IncrementFlag("BUTTSLUTINATOR");
	addButton(0,"Next",mainGameMenu);
}


