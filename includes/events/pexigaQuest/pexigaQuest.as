import classes.Items.Junk.IQBGone;
import classes.Items.Junk.BrokenBrainmeltLamp;
import classes.Items.Junk.DamagedVIChip;
import classes.Items.Junk.SexbotChip;
import classes.Items.Toys.NymFoeDakimakura;

//Additional Sex Scene ideas: 


//Male:
//tail/tongue jerkoff leading to bukkake, then spoon off the cum and drip into mouth 
//doggy style multidick support,
//3-way with yammi and role reversal ring gag, 
//Annoy Yammi while she works by having the pexiga tongue-jack you into Yammi's bikini bottoms


//Female:
//gagged feeding,
//doggy style w/ strap on,
//3-way with yammi & food, 


public function showDrBadgerAndPexiga(nude:Boolean = false):void
{
	showName("DR. BADGER &\n" + pexigaName().toUpperCase());
	showBust(drBadgerBustDisplay(nude), pexigaBustDisplay(nude));
}

public function pexigaName():String
{
	return (pexiga.short.toLowerCase() == "lil bobby tables" ? "Lil Bobby" : pexiga.short);
}
public function showPexiga(nude:Boolean = false):void
{
	if(pexiga.short.toLowerCase() == "lil bobby tables") showName("LIL\nBOBBY TABLES");
	else if(pexiga.short != "pexiga") showName("\n" + pexiga.short.toUpperCase());
	else showName("\nPEXIGA");
	showBust(pexigaBustDisplay(nude));
	
}
public function showNymFoe():void
{
	showBust("NYMFOE");
	if(inCombat())
	{
		if(enemy.HP() <= 0 || enemy.lust() >= enemy.lustMax()) showName("VICTORY:\nNYM-FOE");
		else if(pc.HP() <= 0 || pc.lust() >= pc.lustMax()) showName("LOSS:\nNYM-FOE");
		else showName("FIGHT:\nNYM-FOE");
	}
	else showName("\nNYM-FOE");
}

public function showDollmaker():void
{
	showBust("DOLLMAKER");
	if(inCombat())
	{
		if(enemy.HP() <= 0 || enemy.lust() >= enemy.lustMax()) showName("VICTORY:\nDOLL MAKER");
		else if(pc.HP() <= 0 || pc.lust() >= pc.lustMax()) showName("LOSS:\nDOLL MAKER");
		else showName("FIGHT:\nDOLL MAKER");
	}
	else showName("\nDOLL MAKER");
}

public function showBrainwashingBall():void
{
	showBust("BRAINWASHINGBALL");
	showName("BRAINWASHING\nBALL");
}

//Pexiga Uplift, aka Bimbo Quest II: The Search For More Bimbos
//Talking with Yammi
// Add [Pet Talk] to Yammi’s menu after opening the [Pexiga] milk & pet options
public function talkingWithYammiAbootPexiga():void
{
	clearOutput();
	yammiFollowerDisplay();
	author("Adjatha");
	output("Yammi tilts her head slightly and offers a friendly shrug. <i>“What’s up, boss? Seems like you’ve got something on your mind.”</i>");
	output("\n\nWhen you mention the pexiga pet she’s keeping, Yammi folds her arms defensively. <i>“I thought we talked about this already, captain. She’s harmless! Practically a vegetable. They all get that way after mating. It’s just hard-coded in their chemistry.”</i>");
	if(!pc.isBimbo()) 
	{
		output("\n\nYou assure the slight cook that she’s not in trouble. Mainly, you’re asking ");
		if(pc.isNice()) output("out of sympathy for the poor creature.");
		else if(pc.isMischievous()) output("more out of curiosity than anything else.");
		else output("because the idea of an aggressive carnivore onboard isn’t a comforting thought, no matter how tame it might appear to be.");
		output(" Isn’t there some way to improve her state?");
	}
	else if(pc.isBimbo())
	{
		output("\n\nYou give the slight cook a playful shove. <i>“You’re so silly! People aren’t vegitables! Or, maybe some people are? But anyway, the pexiga isn’t! Probably.”</i> You explain you just don’t think the blue girl is enjoying herself very much and it’d be like way more fun if she was having a good time too!");
	}
	output("\n\nYammi scratches her head, looking a little uncomfortable. <i>“Well, I know the UGC sometimes does a whole ‘uplift’ thing, where they help rudimentary races get up to speed with the rest of the galaxy. But I think that’s mostly with new technology and better education. If you wanted to fix the pexiga, you’d have to dabble in some genetic tinkering.”</i>");
	output("\n\nHer gills trill slightly and the sparadat girl fixes you with big, moist eyes. <i>“But, look, don’t go messing with people who do that kind of stuff. I don’t want anything to happen to you, and anybody who could rewire the pexiga is not the kind of person you want to indebt yourself to. Trust me on this - I know a thing or two about debt!”</i>");
	if(!pc.isBimbo()) output("\n\nYou set the girl at ease with a few sympathetic words, but the whole time, your mind is trying to work through the pexiga problem. Who do you know with genetic expertise and a relaxed attitude towards ethical issues?");
	else output("\n\nYou set the girl at ease with a casual grope of her pert breasts and a few nibbling kisses along the gill-slits of her neck. Your mind, such as it is, is still focused on the pexiga, though. Seems like you’ll need a real smarty for this. Who do you know with big brains?");

	flags["PEXIGA_TALKED"] = 1;

	processTime(5);
	clearMenu();
	yammiFollowerMenu();
}

public function pexigaQuestDocChatsAvailable():Boolean
{
	return (flags["PEXIGA_TALKED"] == 1 && flags["PEXIGA_TREATMENT"] == undefined);
}

//A Second Opinion
//Add [Pexiga] to the interaction menu for the following NPCs: Dr Haswell, Dr McAllister, Dr Lash, Dr Badger

//Dr Julian S. Haswell
//On Mhen’gha, Xenogen R&D

public function drHaswellPexigaTalk():void
{
	clearOutput();
	showDrHaswell();
	author("Adjatha");
	output("Dr. Haswell doesn’t even look up at you. <i>“Pexiga, yes. I am familiar with the race. Brutish creatures, if memory serves. Of little interest, scientifically.”</i>");
	output("\n\n");
	if(!pc.isBimbo()) output("You begin to explain the mental shutdown they undergo after reproduction, but he snaps his gaze up at you, the cold ice of his piercing glare silencing you mid-sentence.");
	else output("You start talking about the blue girl on your ship and how you want her to be able to have fun, along with all your other friends. <i>“Like, she’s a cutie but she just kinda sits there, ya know? With a big tongue like that, she could really do some work! Just running it up and down, licking and sucking and...”</i> Your increasingly graphic description is cut short when Dr. Haswell seizes you by the shoulders and shakes you repeatedly to get you to shut up. When you finally quiet down he takes a deep breath to steady himself.");
	output(" <i>“I am loathe to repeat myself, but perhaps this bears repeating. When I said that I was familiar with the race, I did not mean to imply a loose familiarity, as one might associate with a lay person. I meant that I have studied these creatures with all due diligence and rejected them as useless. An evolutionary dead end. Worthy neither of my time nor energy.”</i>");
	output("\n\n");
	if(!pc.isBimbo()) output("But what about helping the creatures, you push. Uplifting them?");
	else output("You blink and giggle nervously. You point out that he’s a doctor. Doctors are supposed to help people.");
	output("\n\nThe doctor’s intensity flutters into boredom almost immediately. <i>“While I certainly don’t care to speak for Xenogen as a whole, it is my professional opinion that science is most certainly NOT a field oriented towards improving lives.”</i> He lets out an airy puff that almost sounds like a single, withered laugh. <i>“Science serves but two masters: curiosity and the almighty " + (isAprilFools() ? "dogecoin" : "credit") + ". Your cannibalistic pexiga friends are neither interesting nor profitable,”</i> he explains dismissively. <i>“I’m sure you can show yourself out.”</i>");
	if(!pc.isBimbo()) output("\n\nYou’re tempted to mention the marketability of their sugary drool, but realize that, frankly, you’re a little angry at the aloof man’s greed. You’re not about to offer any help to this ass. If he’s so clever, he can figure it out on his own.");
	else output("\n\nWhat a nerd! This guy is, like, so totally uncool. If you pushed him out of an airlock, all of space would get a lot warmer - he’s THAT uncool! You hold up your nose as you leave his stinky old office. There’s probably a thousand smarter people anyway. Dozens of them!");
	processTime(4);
	clearMenu();
	addButton(0,"Next",move,rooms[currentLocation].eastExit);
}

//Dr Byron McAllister
//On Myrellion, Xenogen
public function drByronMcallisterProfessionalPexigaAnus():void
{
	clearOutput();
	mcallisterHeader();
	author("Adjatha");
	if(!pc.isBimbo()) output("You mention the pitiful plight of the pexiga to Dr. McAllister, and the burly man runs his fingers through his bushy beard in thought.");
	else output("Leaning against the big, burly man and running your fingers through his bushy beard, you mention your poor little pexiga. <i>“Surely somebody as smart and handsome as the big Dr. Byron can help,”</i> you murmur into his ear.");
	output("\n\n<i>“Hrm! Yes, yes I see what you mean. A nasty hand fate dealt those poor creatures. I suppose once my affairs have concluded on Myrellion, I could certainly petition my superiors to take a look at these pexiga.”</i>");
	output("\n\nYou mention that you have one onboard your ship. Would it be possible for him to do some tests right now?");
	output("\n\nThe normally jolly man now wears a look of concern. He rests a mitt-sized hand on your shoulder in sympathy and sadly shakes his head. <i>“My " + pc.mf("boy","girl") + ", if you’re looking for treatment, I’m not the man you want. Not only do I need to conduct numerous preliminary tests and review my findings with colleagues and superiors, but there are also ethical questions to consider.”</i>");
	output("\n\n");
	if(!pc.isBimbo()) output("But what about the myr, you insist. Where were his concerns about the ethics of involvement there?");
	else output("Ugh, you groan internally. Why are all the pretty ones so dumb? <i>“It’s just like helping the ants on this planet - you see somebody, you help them! Like, what even ARE ethics?”</i>");
	output("\n\nDr. McAllister pulls up a stool and perches his massive frame atop it. <i>“It’s true. Perhaps I went a little beyond the scope of normal scientific diligence. But this was a matter of millions of lives. I would very much like to help your friend, but there’s just nothing I can do. Ethical science takes time.”</i>");
	if(!pc.isBimbo()) output("\n\nAs you feared, someone like Dr. McAllister just won’t be able to help with all his principles getting in the way. You’re going to need somebody with a looser definition of ‘scientific ethics.’");
	else output("\n\nYou try puppy dog eyes, but nothing seems to get through to him. What a disappointment! If these scientists are so smart, how come they can’t help? Brains are overrated!");

	processTime(7);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Dr Lash
//On Tarkus, ex-TamaniCorp
public function drLashTalkAboutPexiga():void
{
	clearOutput();
	showDrLash();
	author("Adjatha");
	output("The gray-skinned doctor keeps his eerie, crimson goggles trained on you as you explain the pexiga’s situation to him. <i>“Ah hah,”</i> he replies once you’re done. <i>“There we have it. The very essence of my thesis in one, succinct allegory. A dynamic creature, robbed of volition by its base, procreational instinct. Lobotomized by nature and enslaved by commerce. How dreadfully amusing. I will have to keep that story in mind the next time I have a U.G.C. bounty hunter in my tender mercies.”</i> His tight mouth curls up in the faintest ghost of a smile that leaves chills in your spine.");
	if(!pc.isBimbo()) output("\n\nWhat about the pexiga, you urge. Couldn’t a scientist of his caliber do something to fix what nature broke?");
	else output("\n\nYou blink. Were those even words? Lashy is always so confusing. <i>“So, like, you mean you... CAN’T do it?”</i> Better to be sure, just in case.");
	output("\n\n<i>“Allow me to assure you, the reach of my research exceeds imagination in every sense. Ameliorating cognitive impairment is a trifle. By all means, bring me your beast. I will remove its sexual attributes and restore it to its former state.”</i>");
	if(!pc.isBimbo()) output("\n\nThat wasn’t exactly what you had in mind. You were more hoping for intelligence. Pexiga are incredibly aggressive carnivores in their natural state.");
	else output("\n\n<i>“Oh, that’s no good! Without sexy bits, how is she supposed to enjoy herself? Plus, aren’t normal pexiga, like, super dangerous?”</i>");
	output("\n\n<i>“And?”</i> Lash replies curtly. <i>“Is it not enough to unmake the chemical shackles of licentiousness? Besides, even with a passable intellect, your creature must invariably revert to instinctive drives.”</i>");
	output("\n\nHow can somebody so smart be so dumb? ");
	if(!pc.isBimbo()) output("You don’t want a killing machine loose on your ship!");
	else output("<i>“Like, what good is somebody with no fun bits who just wants to eat everything?”</i>");

	output("\n\n<i>“It is of no particular interest to me what you do with the wretched thing,”</i> Lash replies, dismissively. <i>“Get a particularly thick chain and use it as a guard dog, perhaps.”</i> He returns to his research, apparently unwilling to devote even a moment longer to your humanitarian request.");

	if(!pc.isBimbo()) output("\n\nWell, Dr. Lash was a bust. Returning the pexiga to a deadly monster seems far worse than leaving her a pliant drool-puppy. At least, as far as your personal safety is concerned!");
	else output("\n\nWhat a bummer! Lashy could fix her but only by making her into some kinda monster. What a tease! Like how he has all those arms but he never offers to hug you or grope you or nothing. Guess you’ll have to keep lookin’ for some geni-thingies. Smarty pantses. Who else has a big brain?");
	processTime(6);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//A Very Badger Christmas
//Dr Badger (Normal)
//On Tarkus, Bimbo Science villain
public function drBadgerChristmasYay():void
{
	clearOutput();
	showDrBadger();
	author("Adjatha");
	
	if(!pc.isBimbo()) output("No sense beating around the bush. You lay out your request very plainly and watch the dangerous woman to see how she’ll react. She listens as you explain the pexiga’s biological off-switch, her eyes narrowing as you reach the compassionate conclusion of your petition. Her hand twitches, fingers reaching for something and you tense up, equally motivated to run for safety as to lunge at the scientist before she can ready her weapon. Drawn in both directions, you’re momentarily paralyzed and the indecision allows the strained moment to pass without event.");
	else output("A blush on your face and warm excitement bubbling in your tummy, you bashfully explain the blue girl you’ve got in your ship. Badger makes dismissive affirmations as she slides up beside you. <i>“Mmhrm? Oh? Very interesting,”</i> she mumbles as her clawed hands reach across your [pc.upperGarment] to play across your [pc.chest]. You squirm in her grasp, tempted to just jump her bone, but somehow you find the strength to press on. You explain how it’s, like, totally not fair that the pexiga can’t enjoy herself and since Badger’s so good at making people dumb, maybe she could make a super dumb person just regular dumb?");
	output("\n\nDoctor Badger takes a step back and produces a hard, pink ball of gum. Popping it into her mouth, she studies you with clinical scrutiny. <i>“You want me to make somebody... smarter? Feels a bit like going against the grain, to be honest,”</i> she remarks, gnashing and smacking her gum loudly. <i>“What’s the fun in building somebody up when you could be tearing them down?”</i>");
	if(!pc.isBimbo()) output("\n\nAppealing to her better nature was a long shot, to be honest. Looks like you’ll have to go after her ego if you want to get anywhere. You explain that the pexiga wasn’t reduced to what she is now by some brilliant scheme or technological triumph, but by nature taking its course. And since when is nature more powerful than science?");
	else output("\n\nYour eyes widen with surprise. <i>“Ooooh. I understand,”</i> you confirm with a sagely nod. <i>“You can’t do it. Like, that’s okay. I couldn’t think of any way to help her either.”</i> You shrug. You reach over and pull another gumball out of her pocket, chewing and smacking it in sympathy for the villain.");
	output("\n\nDoctor Badger looks offended. She scowls and snaps her pink-tinted goggles over her eyes. Bracing her fists on her curvaceous hips, she spits out her gum. <i>“Woah now. That’s quite a little assumption you’re making. I didn’t say I COULDN’T do it. I can make anything into a bimbo. Give me a little time and I’ll make a rock into a total slut.”</i>");
	if(!pc.isBimbo()) output("\n\nIt seems she’s getting quite riled up. Time to close the deal. You marvel at the theoretical accomplishment. To overcome biological programming and turn a vicious beast into a thinking person? Does she really have the technology to do such a thing? Can she, dare you say it, play god?");
	else output("\n\nYou clap excitedly. <i>“Oooo! Do it, do it, do it! Make the blue girl into the smartest bimbo ever! We’ll be best friends and, like, be sooooooooooo appreci- apprec- like we’ll be so thankful!”</i> Badger eyes your [pc.hips] and [pc.ass] with an intensity that leaves your [pc.skinFurScales] feeling well-used. You bounce up and down in delight. <i>“You can do it! I believe in Badger!”</i>");
	output("\n\n<i>“You’re damed right I can!”</i> she responds with a suitably self-satisfied grin on her face. Her whole body trembles, with what you hope is excitement. <i>“Go get your little friend and by the time you get back, I should have something ready for the two of you,”</i> she grins, her pink-tinted goggles casting a distorted reflection back at you.");
	output("\n\nAre you really going to trust Dr. Badger to do what’s right?");
	
	//Disable Badger until the quest is complete
	flags["PEXIGA_TREATMENT"] = 0;
	//[Get Pexiga] [Just Leave]
	processTime(6);
	clearMenu();
	addButton(0,"Get Pexiga",bringBadgerPexibork);
	addButton(1,"Just Leave",justLeaveBadger);
}

//[Just Leave]
public function justLeaveBadger():void
{
	currentLocation = rooms[currentLocation].southExit;
	generateLocation(currentLocation);
	
	clearOutput();
	showBust("");
	author("Adjatha");
	
	if(!pc.isBimbo()) output("You step out and release a breath you didn’t realize you’d been holding. Maybe Yammi was right. Dealing with people like Badger just isn’t worth the risk. Maybe somebody else in the galaxy can help the pexiga. You’ll just have to keep looking.");
	else output("Doctor Badger is so funny sometimes. She seemed really excited about that thing she was going to do. You place your finger to your [pc.lipsChaste] and stand still in thought. Now what was it she wanted you to do? Oh pooh. You’ve forgotten it. Oh well! You’ll remember eventually!");
	
	//End
	processTime(1);
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function bringBadgerPexibork():void
{
	clearOutput();
	showPexiga();
	
	if(hasDollMakerEffect(pc))
	{
		showName("\nSTOP!");
		
		output("Unfortunately, you cannot do this while under the Doll Maker’s effects. <b>It is too dangerous!</b>");
		output("\n\nPerhaps you should try again after the effects wear off?");
		output("\n\n");
		
		clearMenu();
		addButton(0, "Next", mainGameMenu);
		
		return;
	} 
	
	author("Adjatha");
	showName("\nWALKIES");
	
	//Normal
	if(!pc.isBimbo()) output("Tentatively, you return, leading the pexiga on a leash. Most of the residents of Tarkus don’t give the two of you a second look, but a few seem to recognize the dangers posed by the blue girl and go diving for cover. The subdued beast pays no attention to the fear or contempt or lust of the onlookers, however. She simply follows on hands and knees for as long as you apply pressure to her collar. Leading her into Doctor Badger’s lab, you cast your gaze about, looking for the " + (chars["DRBADGER"].isBimbo() ? "slutty" : "sinister") + " scientist. There’s noise coming from her back room, so you cautiously lead your pet towards her disreputable savoir.");
	//Bimbo
	else output("Choosing a light pink collar that goes with your pexiga’s blue scales, you proudly puff out your [pc.chest] and stroll through Tarkus with your super cute pet. Lots of people stare and point, which is awesome. Some others drop their jaws, and that’s the best. Everybody knows you’re, like, a million times cuter with a pet, so you flash big smiles and wave to the crowds. You can feel their eyes all over your body, the lust so strong it’s almost like their hands are all over you. A glance at the pexiga, however, and the wonderful feeling flickers with distress. It’s not right that she can’t enjoy a stroll like this! You’ve just got to help her! Cutting your walk short, you head right to Doc Badger’s kinda icky shack. She’s not around, but that’s okay. You don’t mind looking. Hey, how about that back room? You haven’t been there before.");

	processTime(2);
	//All
	//Go To Nym-Foe fight
	clearMenu();
	addButton(0,"Next",nymfoeSetup);
}

//After Fight
public function afterNymFoeFight():void
{
	if(!drBadgerAtBimbotorium())
	{
		noBadgerPostNymFoe();
		return;
	}
	else if(chars["DRBADGER"].isBimbo())
	{
		bimboBadgerPostNymfoeFight();
		return;
	}
	
	clearOutput();
	showPexiga();
	author("Adjatha");
	showName("\nEXPLORING...");
	output("Collecting yourself, you look around for that slippery scientist. You call out for her and your answer comes in a faint, <i>“down here!”</i> Badger’s voice seems to be echoing up from somewhere below the structure so you lead the pexiga past towering piles of random junk, deeper into the Bimbotorium. The ramshackle appearance of her front room gives way to a curling stairwell that descends into some kind of bunker. As you go, you’re given a view of the network of pipes and hydraulic machinery just beneath the floorboards of the unassuming office. ");
	if(!pc.isBimbo()) output(" They all seem to connect to a variety of trap doors and elaborate devices, primed and ready to assail an unwary visitor at the press of a button. You begin to appreciate how many secret contingencies the maniac has set up at any given moment. Nervously, you wonder how many people she’s managed to get her claws on, but decide it’s probably better that you don’t know.");
	else output(" You don’t really know what all these things are for, but the Doc definitely has a type. Probably a bunch of silly pranks to, like, give boys huge boobs or something. Oooh! Maybe she could give you and your blue girl bigger, squishier tits while you’re here?");
	output("\n\nYou and your pexiga reach the bottom of the stairs and find a virtual warehouse of dangerous looking machines. A set of grav-cuffs on flexsteel chains whip about clicking like crab claws as they try to snatch up a victim. A person-sized tube filled with what looks like pink champagne bubbles ominously as a few ice cubes float and bob at the surface, never seeming to melt. Devices shaped like heat lamps hum with ominous import, shedding just a faint radiance yet seeming to flood the chamber with sweltering warmth. There are even hefty tanks filled with silicone that seem to have tubes and injectors affixed to their tips for ease of inflation.");

	processTime(3);
	//Go to Doll Maker fight
	currentLocation = "BIMBOTORIUM LAB";
	generateMap();
	
	clearMenu();
	addButton(0,"Next",dollmakerSetup);
}

//After Fight
public function afterDollmakerFight():void
{
	if(!drBadgerAtBimbotorium())
	{
		afterDollmakerFightForAbsentBadger();
		return;
	}
	else if(chars["DRBADGER"].isBimbo())
	{
		bimboBadgerPostDollmakuhFoight();
		return;
	}
	
	clearOutput();
	showDrBadgerAndPexiga();
	author("Adjatha");
	output("You locate the doctor before long, finding her putting a final turn of the screw on a large, padded chair. <i>“What kept you?”</i> she asks, lifting her goggles up. <i>“Any longer and I was going to send out a search party.”</i>");
	if(!pc.isBimbo()) output("\n\nYou’re tempted to mention the guards you had to fight your way through, but swallow back the vitriol. She’s probably just antagonizing you to get a reaction. Instead, you give her a big smile and explain that you took the scenic route.");
	else output("\n\n<i>“Oh, well, we would’ve been here sooner, but there were all kinds of weird, cool things to check out,”</i> you gush. Relating every little thing, using expansive gestures and sound effects, you catch her up on your little adventure through Doc Badger’s world. She grins and gives you an affectionate head pat.");
	output("\n\n<i>“Well, I’m all done here, so let’s strap in the patient and get started!”</i> You can practically see her shoulders bobbing with silent cackles. Badger throws open the arm and leg restraints and hoists the pexiga into the chair as easily as if she’d been handling a cat.");
	output("\n\nThe clasps click into place automatically and Badger hits a button on her ever-present remote. A panel in the ceiling opens up and a large, glass orb descends, suspended by a thin, steel cable. The sphere has a number of long corded wires dangling from it, ");
	if(!pc.isBimbo()) output("crackling with ominous current.");
	else output("like an octopus that skipped leg day.");
	output(" Each tendril has a large, copper alligator clamp at the end, which Badger attaches one by one to the bound pexiga’s body.");

	if(!pc.isBimbo()) output("\n\nYou ask if all this is really necessary. It kind of seems like she’s going a little over the top with all these theatrics. Isn’t there just some ray gun she could zap the blue girl with? She glances at you, her mouth pursed in thought. <i>“We really should’ve started with you. Your friend doesn’t ask stupid questions all the time,”</i> she complains, rolling her eyes.");
	else output("\n\nYou reach out to touch one of the leads, but Badger slaps your hand away. <i>“Those are live,”</i> she cautions, wiggling her thick, rubber-shod fingers in your face. You stare in amazement. The machine is alive? That makes so much sense!");

	output("\n\nWith the last clamp attached, the mad scientist pulls off her thick, protective gloves, one finger at a time. <i>“Not that you’ll understand any of this,”</i> she brags, <i>“but this baby is actually quite a little beauty. See, Bimboleum (patent pending) functions off of synaptic supremacy enzyme emission, reprioritizing conventional thought processes into more preferential arrangements. It doesn’t work, however, if you’ve got less mental activity than an avocado.”</i>");
	output("\n\nShe raises her eyebrows and jerks a thumb at the glass sphere. <i>“This sucker however: it builds the brain from the ground up. It doesn’t matter who I put in it: from the galaxy’s smartest scientist to the government’s dullest drone, they all get rewritten into perfect little sluts.”</i> She tosses her gloves aside and retrieves an identical pair. <i>“At least that’s the theory. Let’s see if it works!”</i>");
	output("\n\nShe raps on the side of the sphere and a buzzing hum erupts from the smooth orb. As the white noise builds, the device begins to glow with an internal luminance. Waves of color cascade over the orb’s surface, flashing ripples of chromatic rings that start at the back of the sphere and collapse at a pin point right at the center of the pexiga’s vision. Green, blue, and yellow alternate in hypnotic swirls as the clamps attached to the blue girl vibrate with the crackling intensity of their bioelectric output. Gradually, the vacant expression of the pexiga shifts to one of complete concentration and focus.");
	output("\n\n<i>“Well, no smoke coming out of her ears yet. That’s an encouraging sign,”</i> Badger remarks, ticking a box off on a clipboard. Lowering her opaque goggles and keeping her vision trained on the pexiga, she makes several more notations before speaking again. <i>“So, how’s it feel?”</i>");

	//player didn’t bimbofy Penny
	if(flags["PENNY_BADGER_BIMBO"] == undefined)
	{
		if(!pc.isBimbo()) output("\n\nHow does it feel to be turning someone into a bimbo? You certainly never thought you’d be doing something like this, even a few months ago. At least it’s for a good cause, you rationalize, feeling a bit hot under the collar. It is a good cause, isn’t it?");
		else output("\n\nYou giggle. <i>“Silly Badger! I’m not in the chair, the pexiga is! How could I feel anything?”</i> She barks out a little laugh and shakes her head.");
	}
	//player bimbo’d Penny
	else
	{
		if(!pc.isBimbo()) output("\n\nYou have to admit, it feels pretty good. When you zapped Penny, a little part of you felt bad about the operation. But now? Maybe it’s because you’re used to it or maybe it’s because you’re working hand in hand with Badger... but it’s starting get pretty exciting. You could get used to this.");
		else output("\n\nYou nod enthusiastically before realizing Badger’s not looking at you. <i>“Oh, it feels great! This is really fun! We should do this more often! I bet you’ve got lots and lots of fun ways to improve people, Doc!”</i>");
	}
	//merge
	//[Next]
	processTime(10);
	clearMenu();
	addButton(0,"Next",badgerBimboButtsPexibuttMore);
}

public function badgerBimboButtsPexibuttMore():void
{
	clearOutput();
	showDrBadgerAndPexiga();
	author("Adjatha");
	output("The machine churns with dizzying speed. At first you think it’s just a trick of the rippling light, but as you watch closer, you can see the dull blue of her scales bleaching to a silver so pale it seems white. <i>“Interesting,”</i> Badger remarks. <i>“I’d have thought the spines would’ve changed before the skin.”</i> She makes a note on her clipboard as an obvious bulge forms in her jumpsuit..");
	output("\n\nThe girl’s breasts swell and expand, gaining volume until each one is bigger than her head. <i>“Hnnng,”</i> Badger frets, <i>“is that the upper limit? Well, we’re gonna to have to tinker with that for the Mark II model.”</i> Out of curiosity, you lean over to look at what the scientist has been writing her her clipboard. It appears that she’s drawn a crude stick figure version of the pexiga with huge circles hanging from her chest. You’re not exactly sure what you were expecting, but that wasn’t it.");
	output("\n\n<i>“You know,”</i> the doctor remarks as the two of you observe the final stage of the pexiga’s transformation, <i>“I’ll need some help getting her going after the machine’s done. You don’t mind lending a hand, do you?”</i> Badger arches an eyebrow. <i>“Or various other pieces of anatomy,”</i> she adds.");
	output("\n\nBadger wants your help putting the pexiga girl through her paces. You suppose it’s not surprising that it’s come to this. Maybe it’s part of the process? Maybe Badger just wants to get her dick wet.");
	processTime(3);
	//[Help] [Refuse]
	clearMenu();
	if(!pc.isTaur()) addButton(0,"Help",helpJumpStartZePexibutt);
	else addButton(0,"Help",taurbodyHelpBadgerBro);
	addButton(1,"Refuse",pexigaBadgerRefuseToHelp);
}

//[Help] (non-taur body)
public function helpJumpStartZePexibutt():void
{
	clearOutput();
	setPexigaBimbo();
	showDrBadgerAndPexiga();
	author("Adjatha");
	if(!pc.isBimbo()) output("On the one hand, you’re reluctant to hang around here too long. But on the other, if you help out, you can make sure Badger doesn’t try anything suspicious. You give her a curt nod and ask how you can help.");
	else output("Your eyes light up with excitement. Things were starting to get pretty boring, so something new is always welcome. <i>“Oooh, yeah! Are we, like, gonna hit her with a lightning strike or something? What do we do?”</i>");
	output("\n\nDoc Badger grins, her long tongue drooping from her jaws. <i>“It’s simple,”</i> she replies, wringing her hands as the bulge in her suit grows larger. <i>“We fuck-start her brain.”</i>");
	if(!pc.isBimbo()) output("\n\nSomehow, you knew her answer would be something like this. You’ll have to keep an eye out for the doctor’s inevitable traps, but helping out the pexiga is worth the risk. You give her a tight-lipped, affirmative nod.");
	else output("\n\n<i>“Oh goody!”</i> you cheer, clapping your hands. <i>“Is there, like, a cord we pull? Do we have to put fuel in her first? Oh, and should we be wearing, like, goggles or something?”</i>");

	//player does not have a dick:
	if(!pc.hasCock())
	{
		output("\n\nDoctor Badger eyes you up and down, rubbing her chin thoughtfully. <i>“Hrm. No, this will never do. We’re going to need full double penetration to get this beastie up to spec. Don’t worry though,”</i> she she adds with a wicked grin, <i>“I always come prepared.”</i>");
		output("\n\nReaching into what seems to be a pile of junk, the mad scientist produces a belt-like contraption with extra straps to secure it around your waist and hips. Mounted at the junction of the straps is a hefty, 10”</i> dildo made of segmented steel with faintly glowing blue circuits running along its length like pulsing veins. <i>“Strap in and enjoy,”</i> she offers with a twitch of her fuzzy ears.");

		if(!pc.isBimbo()) output("\n\nCautiously, you examine the device but can’t find anything suspect about it. Badger is already unzipping her jumpsuit to the groin, giving you and ample view from her massive cleavage down to the jet-black badger cock throbbing at attention. Not one to blush in the face of a challenge, you unhook your gear from around your waist and fit the strap-on around your groin, adjusting the belts until it sits snugly against your groin. You give the device a few experimental strokes and find that it seems to radiate a small electrical field, sending pin-pricks up your wrist as you touch it. Nothing harmful, but just enough to leave your heart beating a little faster.");
		else output("\n\nShrugging, you happily strip off your gear and slide into the strap-on. Doc Badger gives you an appreciative oogle as you wiggle and tighten it against your groin, and you grin all the wider for the attention. <i>“So, like, does this send pleasure back to me, or has an internal dildo, or like becomes permanent after use,”</i> you question, flicking the tip with your fingers and watching the rod bounce slightly.");
		output("\n\nThe doctor unzips her jumpsuit to the groin, giving you ample view from her massive cleavage all the way down to her throbbing, jet-black badger cock. <i>“Nah, those are the other models. We need something with a little spark to get this girl going,”</i> she adds, jerking her thumb back to the gently swaying pexiga. To demonstrate, she lowers her nose to the tip of the dildo and slowly pulls back. A small web of electrical current jumps between her face and the shaft, sending a shiver of delight through the scientist. <i>“Trust me: it’ll be fun.”</i>");
	}
	//player has a dick
	else
	{
		output("\n\nDr. Badger looms next to you, grinning as she unzips her jumpsuit to the groin. You’re treated to an ample view of her business-end, from her massive cleavage all the way down to the black, throbbing length of her hefty badger cock. <i>“Don’t be shy,”</i> she coos, <i>“you don’t have anything I haven’t seen before.”</i>");
		if(!pc.isBimbo()) output("\n\nShe probably meant that to set you at ease, but you make a mental note to have your ship swept for surveillance equipment all the same. Pulling off your gear, you can’t help but feel a little exposed. You’re sure to set everything down close at hand, just in case.");
		else output("\n\nYou shrug and pull off your gear, stripping down to your bare [pc.skinFurScalesNoun]. An excited tremor runs down your spine and you stretch out, making sure to show off the goods for all to see. <i>“Okay! Let’s get fuckin’!”</i>");
	}
	//Merge
	output("\n\nWith the two of you stripped down and ready for business, Doctor Badger sets about unhooking the restraints still keeping the pexiga firmly in place. The brainwashing ball in front of her dims and darkens, while the clamped wires buzz faintly as she removes them, one by one. With almost tender care, the scientist lifts the mesmerized girl to her feet and checks her up and down.");
	output("\n\n<i>“Damn, I’m good,”</i> she marvels, assessing the transformation. The pexiga’s freshly silvered scales blend surprisingly well with the softened blue plates across her chest. Her long, spaded tail flicks back and forth slowly, spanking her plump posterior with each arc. The massive, pierced tongue hangs limply from her ring-bound mouth, just as before, but now it rests in the sizable vale of her inflated F-cup breasts. Badger runs her clawed hands up and down the girl’s yielding body and turns her in place so that the pexiga is facing you.");
	output("\n\n<i>“Shotgun anal,”</i> Badger declares, lifting the girl’s tail and exposing her pliant posterior.");
	output("\n\nWell, apparently that leaves you with the pexiga’s front. While Badger holds her upright, you step forward and rest your hands on her freshly broadened hips. The girl’s silver scales are warm and so fine that it’s almost as if she’s wearing skin-tight satin. She moans at your touch and wiggles up against you, her once-vacant stare now replaced by a sharp, hungry need. Running a hand over the thin spines of her hair seems to encourage her further and before long, her sinuous tongue snakes its way up the side of your cheek.");
	output("\n\n<i>“You gonna play with her all day?”</i> the doctor asks, slathering a fat dollop of icy blue lubricant on her thick member. Biting the side of her lip, she positions herself right against the treated girl’s posterior. With both hands digging into the other girl’s bubble butt, she pushes in.");
	output("\n\nThe pexiga gurgles with delight, nearly falling against you as Badger slides inch after inch into your pet’s plump ass. The long, silver tail coils around your own length, tugging slightly as if to coax you to join in.");

	//player does not have a dick
	if(!pc.hasCock())
	{
		output("\n\nWell, it seems the doctor and her patient are already well underway. Your restraint melts away at the pexiga’s insistent, groping caresses. ");
		if(!pc.isBimbo()) output("You’re still not sure about this device Badger provided you with, but you suppose it shouldn’t hurt to at least try it.");
		else output("With a giggle, you waggle the long device Badger strapped to your hips. Always fun to try something new!");

		output("\n\nThe segmented steel of your strap-on faintly pulses as you teasingly run its firmness back and forth between the girl’s moist lips. Bucking from the long, slow pumps Badger is administering behind her, she grinds against the apparatus, shivering in delight at the slight electrical current running across it. Excited and needy, she moans and hooks one leg around your backside while the broad, flat surface of her spaded tail cups at ");
		if(pc.biggestTitSize() > 0) output("your one of your [pc.breasts].");
		else output("your [pc.chest].");

		output("\n\nThe squelching moisture drooling down her inner thighs rivals if not exceeds the heavy flow of sticky, sweet saliva dribbling down her excessive tongue. With a slight gasp, you push your strap-on into the girl’s depths, listening to her whine and coo in equal parts agitation and excitement. Her body trembles, as if shivering, and you can hear her jaw tightening around the ring-gag as her body tenses like a clenching fist. She grabs at your shoulders with her two-fingered hands, hugging you closer as she pushes down further and further on your phallic accessory.");
		output("\n\n<i>“Ooo,”</i> the doctor moans, speeding up her strokes hard enough to send the pexiga bouncing against you. <i>“Yeahhhhh, that little fucker on your hips is really doing the trick.”</i> Badger wraps a hand around the base of the other girl’s tail and gives her a few rough tugs to keep her in pace with the anal pounding. Between thrusts, the scientist hisses out a word of advice. <i>“Hey, wanna see a trick? Try sucking on her tongue.”</i>");
		output("\n\nShrugging, you reach down and take the pexiga’s heavy piercing in hand, raising it to eye level. Your hips swinging to match Badger’s pace, you lean forward to suck on the wiggling tip of your pet’s pierced organ. As her tongue touches yours, the electricity flowing through her zips into you, sending your nerves on a wild trip from bliss-blinding pleasure to toe-curling ecstasy and back again. When her wetness slips from your mouth, you find yourself pounding the strap-on into your pet like a jackhammer. Between your exhausting pace and Badger’s attempt to keep up, it’s all you can do to stay upright. The aftershocks of your orgasmic experience leave you nearly as jellied as a well-fed galotian.");
		output("\n\n<i>“Oh, don’t quit on me now,”</i> Badger scolds, producing a remote from somewhere. <i>“Safety protocols? Why’d I program those? Let’s just override that.”</i> With a beep, she remotely turns up the charge on your strap-on, sending spasms of electric euphoria through the silver girl. Her scales crackle and cascade with the voltage and she bucks wildly between the cocks pistoning inside her. Arcs of juice leap between the three of you, sending everybody into overdrive. Every time a bolt touches down on you, your body goes wild, fucking the bleached girl for all she’s worth. When Badger is hit, you do your best to hang on as the absurdly strong scientist very nearly pounds the pexiga back into mindlessness. Squirming between the two of you, your pexiga drools and cums in equal measure, her body riding an orgasm that seems endless.");
		output("\n\nSplurting gushes paint the silver girl’s rump white as Badger busts her nut deep inside her patient. Your ");
		if(pc.hasVagina()) output("[pc.pussy]");
		else output("body");
		output(" throbs with the uncounted micro-orgasms of your shared charge, but as Badger pulls out, a solid ribbon of light connect you to your pet. The two of you cling to each other for stability, the pexiga’s tail spasming freely as her tongue swings ponderously with each wet slap of your rapid pounding. At this rate, one or both of you will end up a slave to your bodies, but despite the danger, you can’t stop thrusting.");
		output("\n\nBadger whistles innocently and clicks the remote again. The strap-on pops and fizzles, its circuit fried. As if the two of you were marrionettes with their strings cut, you and your pexiga collapse to the ground, panting and gasping for air. The ache in your body is so intense it’s all you can do to groan and roll over, pulling the spent dildo from the silver girl’s still-shuddering body.");
		output("\n\n<i>“Huh, I guess ‘Bitch Breaker’ mode is still too much for the circuits,”</i> Badger mutters to herself before noticing that you’re still awake. <i>“I mean, uh, thank goodness I turned that thing off. No telling what these tricky machines will do if you give them an inch, right?”</i>");
		output("\n\nYou sigh, struggling out of the strap-on before just lying against the floor. You’re too exhausted to deal with Badger’s nonsense right now.");
	}
	//player does have a dick
	else
	{
		output("\n\nNo sense holding back now, you reason, sliding your hands across the girl’s heaving F-cups. Her tongue wiggles and coils as she licks along your [pc.chest] and up to your [pc.lipsChaste]. You slide your [pc.tongue] around hers and push your [pc.cockBiggest] against her puffy, drooling cunt with the hot, inpatient breaths. Badger slows her pace enough to let you push inch after inch into the transfixed girl. Her silver folds part before your advance, the soft, moist interior of her depths suckling at firmness. Chest rising and falling with a sweet moan of belly distending delight, your pet wraps her arms around the back of your neck and hugs you close.");
		pc.cockChange();
		output("\n\nBending down slightly, you grab the back of her knees and pull her legs up into a tight embrace around your [pc.hips]. She hooks her toeless feet behind your [pc.ass] and squeezes as her weight bears her body down onto the pair of poles holding her aloft. She gasps, momentarily paralyzed by the spearing shafts within her. The thin barrier between the pexiga’s holes trembles as the two of you take turns thrusting upward.");
		output("\n\nYou can feel Badger’s heady heartbeat pound through the nearness of the girl’s over-stuffed body. You shift your grip and begin bouncing her up and down with each plunging stroke, your muscles tightening even as a trickle of sweat runs down your forehead. Your pegixa lets out a gurgle that might be a nervous laugh of disbelief as she struggles to keep up with the accelerating pace of her two all-too-welcome intruders.");
		output("\n\nThe wet slap of the silver girl’s fat ass against Badger’s lube-slick crotch and her mammoth tits against your own [pc.chest] fills the lab with a symphony of rutting excitement. You ");
		if(!pc.isBimbo()) output("grunt with the burning effort of your frantic pace");
		else output("giggle and shiver with the pleasure of breaking in a new friend");
		output(" while the doctor curses and groans, making mental notes about elasticity, muscle density, and sluttiness quotients. The girl between you, for her part, cries out in rapturous bliss, her tongue swinging like a pendulum while sweet drool pours from her gagged mouth, drenching all three of you in a glistening coat of warm, fluid exhilaration.");

		output("\n\nYou slide your hands down to grip the pexiga’s thick rump and, using your renewed grip on the girl’s bimbo-plumped posterior, you pump with renewed vigor. Badger matches you stroke for stroke, seemingly inexhaustible in her slut-pumping fervor. If anything, the two of you seem to have thickened over time, and now your pet’s body is so stuffed by fuck-meat that her gasp have become ragged and her eyes unfocused. She gurgles with helpless joy, her body suckling on the [pc.cockBiggest] wearing her pussy like a skin-tight sheath.");
		output("\n\nHips rocking back and forth in a suckling, hungry climb toward a pair of cum-thirsty rewards, your pexiga feebly claws at your back and shoulders. Her two-fingered hands are so soft, however, that the best she can do is to stroke and massage as she rides your girth for all she’s worth. Her ankles unhook from each other as her legs rise with the intensity of your pace. Muscles from her thighs up into her pelvis tighten and quiver as she squirms, moaning and panting between her well-equipped partners. ");
		if(pc.balls > 0)
		{
			output("Her tail loops around and lightly caresses your [pc.balls], warm flesh against the cold weight of your burgeoning load. The broad, flat surface of her spaded tip is surprisingly flexible as it grips and fondles your bouncing sack with a delicious deftness that you wouldn’t have guessed the cock-stuffed, drooling pet to be capable of.");
		}
		else output(" Her tail loops around and lightly caresses the seam of your [pc.ass]. The thick, rounded extremity of her spaded tip pushes into your [pc.asshole] just far enough to locate your prostate. You gasp, a little amazed that the cock-stuffed and drooling pet bouncing between two climax-bloated shafts is capable of such delicious deftness.");

		output("\n\nThe pexiga’s full cheeks flush a pale blue, her eyes clenched at the suffocating heat of the throbbing flesh piercing her. Moaning, she thrashes her shoulders from side to side, before throwing her head and crying out in ecstasy. Her body ripples with the milking tightness of her orgasm and the trembling vibrations from Badger’s fuck-stick tell you she’s not too far behind. A thought strikes you and you lift the girl up off both cocks with a grunt of effort.");

		output("\n\n<i>“H-hey!”</i> Badger cries out, clearly past the point where she can hold back her climax. <i>“I was using that asshole! The fuck do you think-”</i> you cut her off by lowering your bliss-addled pet to her knees, pulling her ring-gagged face midway between you and the doctor. <i>“Ah, fuckit,”</i> she curses, stuffing her thick meat into the pexiga’s maw even as you force your own [pc.cockBiggest] past the hefty hoop. The two of you can only fit a few inches each, but the rubbing pressure of the girl’s heavy, muscled tongue on your members is more than enough. With a gasp and a moan, the two of you surrender to the hot release boiling in your chests.");
		output("\n\nBadger cums first, her ebony shaft trembling against your own as it gushes with heavy cream. The pexiga lets out gasping burble as cum and drool bubbles up at her lips. Her throat ripples and bloats as she swallows hard, sucking down the doctor’s jizz before too much can escape her slime-starved maw. Badger winces with a fierce joy, grabbing the girl’s shoulder as she pours out her seed with reckless abandon, her own tongue draped down the side of her panting muzzle.");
		output("\n\nYour climax comes hot on her heels, and while the furry scientist slows her hot release, your [pc.cumVisc] goo gushes past her restrained jaw and into her spunk-stuffed mouth. Her eyes bulge and a small curtain of cum spills past her lips as you buck your meat against her with impatient need. The hot, [pc.cumGem] spoo bubbles and froths in her bloated cheeks before she remembers to start swallowing again, sucking your load down with ecstatic gluttony. A round deformation in her taut tummy tells you she’s going to be enjoying her meal for breakfast, lunch, and dinner!");

		var cumQ:Number = pc.cumQ();
		if(cumQ >= 2000) output("\n\nYet, even at the pace she’s swallowing, the pexiga can’t possibly hope to keep up with your virility. [pc.CumColor] spurts escape the silver girl’s vacuuming gullet, fat dollops rushing past the throbbing, face-stuffing flesh of both dicks. Your excess runs down her long, long tongue in a sticky curtain of [pc.cumVisc] seed, painting the pink organ a fresh coat of [pc.cumColor]. The tasting tendril drinks in the flavor of your pearlescent shower with savoring satisfaction that sends orgasmic tremors through her body. Your pet’s belly bulges under the hot cascade, plumping and expanding with each fattening load. She’s definitely going to need help walking away from this one!");
		else if(cumQ >= 10000) 
		{
			output("\n\nStill, your cumming release strengthens. Your body feels as if it’s using every last cell available as an outlet for your spunk torrent. Your body clenches as fresh loads pour from your ");
			if(pc.balls > 0)
			{
				output("throbbing cum factor");
				if(pc.balls == 1) output("y");
				else output("ies");
			}
			else output("over-wrought core");
			output(" with no end in sight. The girl’s fettered mouth and cock-stuffed jaw can’t keep up with your geysering girth. With no other outlet, the overflow of you inundating orgasm finds the only remaining passage. Twin jets of pressurized spunk spurt from the pexiga’s nostrils, gooey ropes of your [pc.cumGem] slime splattering across her face in a throbbing glut. Your [pc.cumColor] rapture flows over her scintillating scales even as it floods her cum-bloated gut. With the tidal goo flowing down her body and the waist-distending ballast you’re emptying into her slime-stuffed frame, your pexiga will be lucky to be able to crawl by the time you’re done!");
		}
		output("\n\nAs the two of you finally finish, your shared cum dump can barely manage a moan, much less a gurgle of approval. When you pull your twitching, tender member from her mouth, the final, unswallowed remains of your release spills out with a spunky splash, drenching her heaving chest with the glistening splatter of scale-polishing cum. Badger pulls out as well, grabbing the pexiga’s tongue and using the drooling organ to wipe the thick slime from her member offhandedly.");
		output("\n\n<i>“Where’d you get this thing?”</i> She asks with a grin. <i>“I really ought to get one of my own.”</i>");
	}
	//merge
	processTime(25);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",postPexigaJumpStart);
}

//[Next]
public function postPexigaJumpStart():void
{
	clearOutput();
	showDrBadgerAndPexiga();
	author("Adjatha");
	output("When the three of you have had a chance to rest, Badger crooks a clawed finger at you and flourishes a large, golden barbell. Easily the size of the massive piercing already in your pet’s tongue, the shining decoration seems almost mesmerizing as the doctor turns it around and around between her fingers. <i>“Since you were such a pal, I’m even going to throw this in for you.”</i>");
	if(!pc.isBimbo()) output("\n\nYou thank her for the offer, but you’re pretty sure if you tried wearing that, you’d end up as mute as the pexiga.");
	else output("\n\n<i>“For me? Thanks! But, like, how do I put it on?”</i>");

	output("\n\n<i>“Not for you,”</i> she hisses, <i>“for monster-tits over there. And don’t just assume this is a simple decoration, either. These things are pretty hard to make and not terribly cheap either.”</i>");
	output("\n\nSensing your reluctance, the mad scientist folds her arms under her heavy chest. <i>“Look, it’s simple. Your pexiga can’t talk. I made her smarter, but that’s not going to magically teach her new skills. We install this baby, however, and she’ll be talking up a storm in no time. Then, you can teach her whatever the hell you want.”</i>");
	output("\n\nYou’re silent for a beat and Badger grows flustered, tossing the hefty piercing at you. <i>“I’m TRYING to be nice here! Look, just fuckin’ put the thing in her fuckin’ mouth and see for yourself.”</i>");
	if(!pc.isBimbo()) output("\n\nProbably best not to antagonize her any further.");
	else output("\n\n<i>“Oooooh. You mean, like, instead of her current tongue-thingy. Okay!”</i>");
	output(" You bend down and take the exhausted pexiga’s flopping tongue in your hands, carefully unscrewing her old barbell and slipping the new one on in its place. She blinks, turning her gaze to you.");

	output("\n\n<i>“Oh, so pretty! Hai hai,”</i> the silver girl greets with a voice as soft and sweet as air-fluffed sugar.");

	output("\n\nYou jump to your feet. The pexiga spoke? But, she’s got a ring gag in! And her lips didn’t move! You turn back to Badger and she’s wearing a huge, shit-eating grin. <i>“What’d I say? I’m a genius.”</i> You push for an explanation and she waves her hands vaguely in the air. <i>“Let’s just say that sometimes I need to get information out of people and a piercing that transmits their every thought seemed like a no-brainer to me. Brute force isn’t my only tool, you know, just my favorite one.”</i>");
	output("\n\nYour pet is still murmuring in wonder at the world around her, seemingly unaware of her new, electric voice. <i>“You know,”</i> Doctor Badger remarks, <i>“we make a pretty good team, you and I. I’ve been looking for an assistant and I think you might just fit the bill. What do you say? With your connections and my brilliance, we could really do some fuckin’ science!”</i>");
	output("\n\nOn the one hand, she’s almost definitely got an ulterior motive for the offer. It’s most certainly a trap. But on the other, having Badger in your corner would make things a lot easier. You could just bimbotize your cousin and search out your dad’s legacy at your leisure. It’s awful tempting, but you know better than to trust Doctor Badger, don’t you?");

	processTime(10);
	//[Decline] [Accept]
	clearMenu();
	addButton(0,"Decline",declineBadgerAssistant);
	addButton(1,"Accept",acceptBeingBadgers);
}

//[Accept]
public function acceptBeingBadgers():void
{
	clearOutput();
	showDrBadgerAndPexiga();
	author("Adjatha");
	output("The temptation is too great. Badger might have her own agenda, but as long as she’s helping you claim Steele Tech, it hardly matters. ");
	if(!pc.isBimbo()) output("You agree to her proposal, thrusting out your hand for her to shake.");
	else output("<i>“Um, I guess! That sounds like fun, so why not?”</i> You hold out your hand for her to shake.");

	output("\n\nThe scientist’s eyes widen in disbelief. <i>“What? Seriously? Ha ha okay yeah. Shit, let’s do this thing.”</i> She eagerly takes your hand and shakes vigorously. <i>“A pleasure to be in business with you, Nurse Steele!”</i>");
	output("\n\nYou feel a slight prick in your palm and you try to pull your hand away. Badger, however, tightens her grip, grabbing your other hand as well. <i>“You’ve got your own style and it’s cool and everything,”</i> she gushes, looking you up and down, <i>“but I think we can make some improvements. So, our next subject should be you.”</i> Her eyes narrow and her grin spreads like oil on the surface of a lake. <i>“Doctor’s orders.”</i>");
	output("\n\nYou try to protest, but you’re suddenly very light headed. Darkness sweeps over you.");
	processTime(2);
	clearMenu();
	addButton(0,"Next",drBadgersAssistantBadEnd);
	//(Go to “Badger’s Assistant” Bad End)
}

//[Decline]
public function declineBadgerAssistant():void
{
	clearOutput();
	showDrBadgerAndPexiga();
	author("Adjatha");
	output("Tempting though it may be, ");
	if(!pc.isBimbo()) output("you know better than to get in bed with a maniac");
	else output("no sense in pushing your luck by asking for even more");
	output(". You make up an excuse and thank her for everything but look at the time, you really must be going. Before she can work out whether or not to be offended, you’ve grabbed the pexiga and started up the stairs at some speed.");

	output("\n\nAs you climb, you look over the girl in your arms. The smooth, curvaceous figure of your pexiga smiles happily under her ring-gag. The girl is pale white, with hefty F-cup breasts that force her to use her long, spaded tail as a counter weight while standing up. The banded plates on her chest and shoulders seem softer than before, more like clothing than natural armor. Her toeless feet plod across the steel steps easily enough, while her two-fingered hands cling to your as much for support as in affection.");
	output("\n\n<i>“Fun fun,”</i> she giggles, her ears trilling excitedly. <i>“More mating soon, ye?”</i>");
	output("\n\nFinally emerging from Badger’s Bimbotorium, the two of you slow your pace to a more leisurely stroll. Your pexiga doesn’t seem to have much in the way of memories, so you help her fill in the sizable gaps in her experience by answering a whole slew of questions as the two of you head through Tarkus.");
	
	processTime(5);
	currentLocation = "304";
	generateMap();
	
	clearMenu();
	addButton(0,"Next",pexigaNamingSetup);
}
public function pexigaNamingSetup():void
{
	clearOutput();
	showPexiga();
	author("Adjatha");
	output("As you approach your ship, it occurs to you that she doesn’t have a name yet. You ask if she’s got any preferences, but she smiles and shrugs. <i>“Iunno! Can you give one?”</i> she inquires, squeezing your arm. <i>“Something pretty!”</i>");
	
	moveTo(shipLocation);
	
	//Player inputs a name for their bimbo pexiga. Alternately: her default name could be Beasti, Ditzi, or something along those lines
	if(stage.contains(this.userInterface.textInput)) 
		this.removeInput();
	this.displayInput();
	output("\n\n\n");
	clearMenu();
	addButton(0, "Next", pexigaNamingConventions, pexigaNamingSetup);
}

public function pexigaNamingConventions(retFunc:Function = null):void
{
	if(userInterface.textInput.text == "") {
		retFunc();
		output("<b>You must input a name.</b>");
		return;
	}
	
	// drop table students
	if (userInterface.textInput.text.toLowerCase() == "robert'); drop table students;--")
	{
		userInterface.textInput.text = "Lil Bobby Tables";
	}
	
	// Illegal characters check. Just in case...
	if(hasIllegalInput(userInterface.textInput.text)) {
		retFunc();
		output("<b>To prevent complications, please avoid using code in the name.</b>");
		return;
	}
	if(userInterface.textInput.text.toLowerCase() != "lil bobby tables" && userInterface.textInput.length > 12) {
		retFunc();
		output("<b>Please select a name no more than twelve characters long.</b>");
		return;
	}
	pexiga.short = userInterface.textInput.text;

	clearOutput();
	author("Adjatha");

	output("<b>[pexiga.name] has joined your crew!</b>");
	if(stage.contains(this.userInterface.textInput)) 
		this.removeInput();
	showPexiga();
	//Add “Pexiga” to the crew options
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function setPexigaBimbo():void
{
	flags["PEXIGA_TREATMENT"] = 1;
	//Set Pexiga stats for funzies :3
	(pexiga.breastRows[0] as BreastRowClass).breastRatingRaw = 12;
	pexiga.createPerk("Ditz Speech",0,0,0,0);
}

//[Help] (taur body)
public function taurbodyHelpBadgerBro():void
{
	clearOutput();
	showDrBadgerAndPexiga();
	author("Adjatha");
	output("You offer to help, finally gaining Badger’s undivided attention. As she sweeps her gaze across you, she tilts her head ninety degrees when she gets to your tauric lower body. <i>“Woah. Have you always had that? Hrm. I dunno if this is going to work with all that baggage you’re carting around. Tell you what: I’ll take care of your girl and you can just relax upstairs.”</i>");
	output("\n\nYou’re about to insist that you stay and at least watch everything, but Badger turns to you, her lenses glittering dangerously. <i>“What’s that? Did you have something to add?”</i>");
	output("\n\nDeep in the mad scientist’s lair might not be the best place to start trouble.");
	processTime(3);
	//[Argue] [Comply]
	clearMenu();
	addButton(0,"Argue",argueWithBadger);
	addButton(1,"Comply",complyWivDaBadguh);
}

//[Refuse]
public function pexigaBadgerRefuseToHelp():void
{
	clearOutput();
	showDrBadgerAndPexiga();
	author("Adjatha");
	output("This kind of sounds suspicious to you, so you decline the doctor’s offer. She shrugs mildly. <i>“Well, if you’re not going to lend a hand, then you don’t get to see the last bit. Wait upstairs and I’ll send her along after she’s done.”</i>");
	output("\n\nYou’re about to insist that you stay and watch everything, but Badger turns to you, her lenses glittering dangerously. <i>“What’s that? Did you have something to add?”</i>");
	output("\n\nDeep in the mad scientist’s lair might not be the best place to start trouble.");
	processTime(2);
	//[Argue] [Comply]
	clearMenu();
	addButton(0,"Argue",argueWithBadger);
	addButton(1,"Comply",complyWivDaBadguh);
}

//[Argue]
public function argueWithBadger():void
{
	clearOutput();
	showDrBadgerAndPexiga();
	author("Adjatha");
	output("Yeah, you’ve got something to say. ");
	if(!pc.isBimbo()) output("You point out that the deal didn’t involve Badger slaking her lusts. You never agreed to let her use the pexiga and you’re certainly not going to let her have her way now.");
	else output("<i>“Like, that’s not fair though! She’s, you know, my friend and I kinda don’t want you to bone her before I get a chance to!”</i>");

	output("\n\nThe sides of Badger’s mouth quirk up, slightly. <i>“Oh, is that all you’re worried about? Geez, you kind of had me scared there for a second. I almost thought you were about to do something silly.”</i> She waves a hand dismissively. <i>“You don’t want me to dick your friend there, that’s fine. I can be very respectful when the situation calls for it.”</i>");

	if(!pc.isBimbo()) output("\n\nIf anything, the doctor’s assurances set you more on edge. You mentally check the condition of your [pc.mainWeapon], ready to reach for it at a moment’s notice.");
	else output("\n\nYou relax immediately. <i>“Oh thank goodness! I was worried you wouldn’t take it very well and do something mean to me! But if you’re, like, totally cool with it, then everything worked out just great!”</i>");
	output(" You calmly ask Badger to unhook the pexiga from her machine.");

	output("\n\n<i>“Sure thing,”</i> she cheerfully agrees, turning to unhook the faintly humming clamps. With a soft rap on the side of the hypnotic orb, the swirling lights fade until the ball is no more than darkened glass. <i>“She’s probably going to be a bit out of it,”</i> the doctor cautions, <i>“so make sure you’ve got a good grip on her before the two of you leave.”</i>");

	if(!pc.isBimbo()) output("\n\nYou mutely nod, never taking your eyes from the scientist as you wrap your arms around your dazed pet.");
	else output("\n\n<i>“Gotcha! Thanks again, Doc! You’ve been super cool about this whole thing!”</i> You eagerly hug the inflated curves of the pexiga before hoisting her to her feet.");
	output(" The silver girl stumbles slightly, but with your support, you can slowly lead her back towards the stairs.");
	output("\n\nBadger watches the two of you carefully, lifting up her goggles and wiggling her fingers goodbye as you back towards the curving stairwell out of the lair. As the two of you step away, you notice the doctor’s eyes flicker down, towards your feet for just a fraction of a second. A sudden flash of panic drives you to glance down, looking for some trap.");
	output("\n\nOnly too late do you realize that the glance was a fake-out. You look back at Doctor Badger and see a remote clutched in her claws. Her crimson eyes glitter madly as her lips peel back in a wicked grin. You try to lunge, but find the weight of your pexiga hindering and slowing you. The scientist clicks a button and white heat fills your senses like a brand to the forehead.");
	output("\n\nYou try to move, to scream, to fight, but your body is as still as a marble statue. Inside, however, your body is aflame. Every nerve seems to be shrieking bloody murder and it’s a testament to your endurance that you can remain conscious at all through the suffocating sensation.");
	if(!pc.isBimbo()) output("\n\n<i>“You know, I kind of thought you were smarter than that,”</i> Badger remarks, her claws clicking against the flat plastic of her remote.");
	else output("\n\n<i>“Don’t feel too bad. You’re an idiot, so you never really had a chance to begin with,”</i> she soothes, her claws clicking against the flat plastic of her remote.");
	output(" <i>“Sure, I get that you were trying to borrow my genius to help your friend. Everybody wants more fuck puppets, so that makes sense. But then to deny me my rightful first taste? Well, that’s just dumb.”</i>");

	output("\n\nA grunt escapes your lips and your captor raises her eyebrows. <i>“Interesting. There’s enough debilitating current running through the floor right now that you should be about as responsive as a pillar of salt. But here you are, voicing an opinion. Not bad.”</i> She paces around you, her extra high heels clicking as she makes a slow circle.");

	output("\n\n<i>“With the right training, you could be a pretty handy little tool,”</i> she considers, scratching the bridge of her nose. <i>“What do you say? You want to be Doctor Badger’s apprentice?”</i> You manage a second grunt, managing to even snarl through the paralysis.");

	output("\n\n<i>“Sounds like a ‘yes’ to me,”</i> she assents, clicking her remote again. <i>“When you wake up, we’ll get started.”</i>");
	processTime(15);
	clearMenu();
	//[Next]
	//Go to “Badger’s Assistant” Bad End
	addButton(0,"Next",drBadgersAssistantBadEnd);
}

//[Comply]
public function complyWivDaBadguh():void
{
	generateMap();
	
	clearOutput();
	setPexigaBimbo();
	showDrBadgerAndPexiga();
	author("Adjatha");
	output("Actually, it seems like you might want to follow her orders after all. Without another word, you head back up the way you came, leaving your pexiga in the doctor’s care. You wait as patiently as you can, but after an hour of sitting around, you’re starting to get antsy. ");
	if(!pc.isBimbo()) output("Did she doublecross you? Is she planning an ambush? Or maybe she’s programming the pexiga with some evil agenda.");
	else output("Is she fucking the pexiga? Are they using fun new sex toys? Are you missing out on a sex orgy just because you got bored of all the science?");
	output(" Panic wells in your breast and you run a quick check of your gear before preparing to rush back down into the lab.");

	output("\n\nBefore you can charge in, however, a figure emerges from the stairs. The smooth, curvaceous figure of your pexiga steps forward on wobbling feet, a happy smile under her ring-gag. The girl is pale white, with hefty F-cup breasts that force her to use her long, spaded tail as a counter weight. The banded plates on her chest and shoulders seem softer than before, more like clothing than natural armor. Her toeless feet plod across the floor easily enough, while her two-fingered hands help her remain standing upright but only barely. Her gag is just where you left it, but she seems to have acquired a new tongue stud, just as large as the other one, but made of gold instead of steel.");
	output("\n\nShe greets you with a sloppy, sugary slurp on your cheek, pawing at your [pc.chest] as much in affection as to help keep her standing upright. <i>“Hai hai,”</i> she adds in a voice as soft and sweet as her wiggling tongue.");
	output("\n\n");
	if(!pc.isBimbo()) output("Startled, you blink and study the transformed girl. That voice seemed to come from her mouth, but speaking with a ring gag like that in place?");
	else output("<i>“Hiya!”</i> you reply with a grin. There’s a long pause before the gears upstairs turn. <i>“Oh! How did you talk? You’ve got that ring in your mouth!”</i>");
	output("\n\nThe pexiga wiggles her tongue, the new stud glistening with her slick saliva. <i>“Iunno! Miss Badger put this on an’ now words come out. So silly!”</i>");

	if(!pc.isBimbo()) output("\n\nAt first blush, a translation device seems a bit too benign for the sinister Doctor Badger. As you give it more thought, however, you can begin to imagine less philanthropic uses for a piercing that broadcasts your thoughts for all to hear. Probably how she tests to make sure her victim’s minds have been completely broken. Or maybe she just likes hearing the gradual decline in thought processes as the bimbo process takes effect. You really need to be more careful around Badger- she’s too clever for her own good.");
	else output("\n\n<i>“Woah! Anything you think? Badger’s so smart, it’s scary!");

	output("\n\nTaking the alabaster girl by the arm, you let her lean against you as the two of you make your way back to the ship. She doesn’t seem to have much in the way of memories, so you help her fill in the sizable gaps in her experience by answering a whole slew of questions as the two of you make your way through Tarkus.");
	//Player inputs a name for their bimbo pexiga. Alternately: her default name could be Beasti, Ditzi, or something along those lines
	processTime(3);
	currentLocation = "304";
	generateMap();
	
	clearMenu();
	addButton(0,"Next",pexigaNamingSetup);
}


//BIMBO VERS
//Dr Badger (Bimbo)
//On Tarkus, Bimbo-tized fuck-slut
public function talkToBimboBadgerAboutPexiga():void
{
	clearOutput();
	showDrBadger();
	author("Adjatha");
	if(!pc.isBimbo()) output("Frankly, you doubt if this will work, but hope springs eternal, right? You stand in front of the bimbotized <i>“Doctor”</i> Badger and take her down the brief history of the pexiga on your ship. You explain how her body’s basically shut itself down. With a shrug, you ask the zapped mad scientist if there’s anything she can do to give some modicum of intellect to the girl.");
	else output("Doc Badger is, like, the smartest person you know. Afterall, she’s always coming up with cool new inventions and stuff. You launch into a kind of rambling explanation of the blue girl and her brain troubles. <i>“It’s no good having somebody who can’t enjoy themselves! You’re a big smarty, right Badger? You could TOTALLY do something to help! You’ve got got, like brains for days. Weeks, probably.”</i>");
	output("\n\nBadger remains silent through your entire speech, her tongue lolling from one side of her mouth to the other. Big, vacant eyes fixed on you, she nods a few times and by the time you finish, her face lights up. <i>“Oooh! Make somebody smart? Instead of dumb?”</i> Her face scrunches up in deliberation. <i>“ Like, why would I wanna to do that? Bein’ dumb is great!”</i>");
	//normal
	if(!pc.isBimbo())
	{
		output("\n\nAppealing to reason isn’t going to work on the ditzy villain, and just because she’s lost her capacity for complicated schemes doesn’t mean she’s suddenly grown a conscience. You’re going to have to be a little tricky to try to get her help - if indeed she’s of any use at all in this state!");
		output("\n\n<i>“That’s what I said,”</i> you reply, adopting a look of concern. <i>“But you insisted! You kept going on and on about it.”</i>");
		output("\n\nBadger scratches her nose in confusion. <i>“Did I? But, I don’t remember nothing!”</i> She giggles and bonks her head a few times with her knuckles. <i>“But, I am a gin- a geni- a really smart person, so maybe I did? I guess I’m super into that thing you were talkin’ about.”</i>");
		output("\n\nYou close your eyes and nod sagely. <i>“Oh yes. It was super smart. You were all about the thing.”</i>");
		output("\n\n<i>“Yeah! I’mma do the thing!”</i> She shakes her hefty booty with enthusiastic delight, her inflated hips slamming against a shelf and upending any number of strange devices. <i>“So! What was the thing I’mma do?”</i>");
		output("\n\n<i>“Give a mindless creature her brains back,”</i> you calmly explain.");
		output("\n\n<i>“Oh, did I take her brains?”</i> Badger asks, tapping a finger on the whorish pucker of her wobbling lips. <i>“I wonder where I put em?”</i>");
		output("\n\n<i>“No no. You’re going to restore her wits.”</i>");
		output("\n\n<i>“Her boiled corn?”</i>");
		output("\n\n<i>“Those are grits. I’m talking about her mind.”</i>");
		output("\n\n<i>“She can’t see?”</i>");
		output("\n\n<i>“She’s not blind! She just can’t think!”</i>");
		output("\n\nDr. Badger blinks, raises an eyebrow, and slowly levels a finger at the clutter of her junk-filled lab. You follow where she’s pointing and realize she’s indicating a kitchen sink. At this point, you’re not sure if she’s actually this dumb or if she’s just fucking with you. Time to try a different tack.");
		output("\n\n<i>“You know how you turn smart people into bimbos? Like that, but from the other direction.”</i>");
	}
	//bimbo
	else
	{
		output("\n\n<i>“No no,”</i> you assure her. <i>“Not SMART. You gotta make her dumb.”</i>");
		output("\n\nBadger looks confused. <i>“I thought she was already dumb?”</i>");
		output("\n\n<i>“Nah. See, she just sorta DOES stuff, right? When you make her. Like a vibrator! Vibrators aren’t dumb.”</i>");
		output("\n\nBadger nods in vigorous agreement. <i>“They’re practically, like, the smartest thing around, ‘cause they get to have sex all the time!”</i> She sighs wistfully, stroking her cock absently. <i>“I’m like, totally jealous, actually.”</i>");
		output("\n\n<i>“Right! So, if you make the blue girl like us, you’ll be making her dumb, see!”</i>");
		output("\n\n<i>“Oh yeah! I get it! That’s totally what I do! It’s, like, my thing or whatever. I’ve got bunches of things downstairs to do that.”</i>");
		output("\n\nYou clap excitedly. <i>“Sweet! Let’s, like, totally make her a big, busty bimbo like us! She’ll love it, once she can think at all!”</i>");
	}
	//merge
	output("\n\n<i>“Okay! Like, no problem at all. I can totally do it. Should be super easy. Go get your friend!”</i> Badger starts grabbing stuff seemingly at random and banging them together. You sure hope nothing bad happens...");

	//Badger is disabled until the end of the quest
	flags["PEXIGA_TREATMENT"] = 0;
	processTime(3);
	//[Get Pexiga] [Just Leave]
	clearMenu();
	addButton(0,"Get Pexiga",bringBadgerPexibork);
	addButton(1,"Just Leave",justLeaveBimboBadgerQuestBlech);
}

//[Just Leave]
public function justLeaveBimboBadgerQuestBlech():void
{
	currentLocation = rooms[currentLocation].southExit;
	generateLocation(currentLocation);
	
	clearOutput();
	showBust("");
	author("Adjatha");
	if(!pc.isBimbo()) output("On second thought, maybe this isn’t what you really want for her. Even at her best, Badger was dangerously unstable. There’s no telling what a brain-drained scoundrel might attempt. You’re just going to have to let things be.");
	else output("As you are headed to go get the pexiga, you notice a shiny reflection on the ground. There’s oil in a little puddle and it’s got all kinds of pretty rings of color in it. When you poke it, the ripples are all gooshy and neat, so you play with the colors for a little while. When you finally get bored, you’ve completely forgotten what you were doing. Oh well! You’ll remember eventually.");
	//[End]
	processTime(2);
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

//After Fight
public function bimboBadgerPostNymfoeFight():void
{
	clearOutput();
	showPexiga();
	author("Adjatha");
	showName("\nEXPLORING...");
	output("Collecting yourself, you look around for that slippery bimbo. You call out for her and your answer comes in a faint yet bubbly, <i>“Like, down here!”</i> The scientist’s voice seems to be coming from somewhere below the structure so you lead the pexiga past towering piles of random junk, deeper into the Bimbotorium. The ramshackle appearance of her front room gives way to a curling stairwell that descends into some kind of bunker. As you go, you’re given a view of the network of pipes and hydraulic machinery just beneath the floorboards of the unassuming office.");
	if(!pc.isBimbo()) output(" They all seem to connect to a variety of trap doors and elaborate devices, primed and ready to assail an unwary visitor at the press of a button. You begin to appreciate how many secret contingencies the maniac has set up at any given moment. Nervously, you wonder how many people she’s managed to get her claws on, but decide it’s probably better that you don’t know.");
	else output(" You don’t really know what all these things are for, but the Doc definitely has a type. Probably a bunch of silly pranks to, like, give boys huge boobs or something. Oooh! Maybe she could give you and your blue girl bigger, squishier tits while you’re here?");
	output("\n\nYou and your pexiga reach the bottom of the stairs and find a virtual warehouse of dangerous looking machines. A set of grav-cuffs on flexsteel chains whip about clicking like crab claws as they try to snatch up a victim. A person-sized tube filled with what looks like pink champagne bubbles ominously as a few ice cubes float and bob at the surface, never seeming to melt. Devices shaped like heat lamps hum with ominous import, shedding just a faint radiance yet seeming to flood the chamber with sweltering warmth. There are even hefty tanks filled with silicone that seem to have tubes and injectors affixed to their tips for ease of inflation.");

	processTime(3);
	//Go to Doll Maker fight
	currentLocation = "BIMBOTORIUM LAB";
	generateMap();
	
	clearMenu();
	addButton(0,"Next",dollmakerSetup);
}


public function bimboBadgerPostDollmakuhFoight():void
{
	clearOutput();
	showDrBadgerAndPexiga();
	author("Adjatha");
	//Normal
	if(!pc.isBimbo()) output("Somehow, you seem to arrive in one piece. The bimbo proprietor of this depraved den stands a short distance off, apparently unaware of the trouble you’ve had with her berserk machines. She is leaning over a work table, tying a pink bow around an absurdly huge vibrator. You ask her if that’s her ‘latest invention.’");
	//Bimbo
	else output("Whew! That was fun, but also a little scary! You bet people would totally pay to go through, like, a theme park filled with that kinda stuff! She could call it <i>“Doc Badger World.”</i> You giggle, starting to compose the theme song aloud, before noticing the badger herself wrapping a pretty pink bow around a REALLY big viberator. You ask if that’s her latest invention, unable to keep a little jealousy out of your voice.");
	//All
	output("\n\n<i>“Uh? This? No, silly! This is a gift! From me.”</i> She holds it out but then gives it an envious glance and pulls it back. <i>“Uh, to me, I mean. Yeah.”</i> Her expression changes to shock and delight. <i>“Wha? A Bitch-Breaker 9000? Just what I always wanted! Thanks, me!”</i> She hugs the arm-thick tool, gives the tip a little lick, then sets it down.");
	if(pc.isBimbo()) output(" You can’t help but grump a little bit. You could’ve been the broken bitch!");
	output("\n\n<i>“Is that your sister?”</i> the greedy slut asks, pointing to the blue girl crawling on all fours next to you. <i>“You two don’t look like each other at all!”</i>");
	output("\n\nYou remind her about the pexiga who needs to get smarter and the doctor smiles with recognition. <i>“Oh, right right right. Yeah, that’ll be fun! Let’s do...”</i> she pauses for dramatic effect, <i>“...the THING!”</i> She launches into what you assume was supposed to be a sinister laugh, but actually just comes out as snorting giggles. ");
	if(!pc.isBimbo()) output("You glance at the pexiga as further doubts in the good doctor’s capabilities pile on.");
	else output("You help out by joining her in the sinister giggling laughter, but your heart really isn’t in it. You can’t stop thinking about that vibrator!");
	processTime(4);
	clearMenu();
	addButton(0,"Next",bimboBadgerBimbosPexigaStart);
}

public function bimboBadgerBimbosPexigaStart():void
{
	clearOutput();
	showDrBadgerAndPexiga();
	author("Adjatha");
	//all
	output("Doctor Badger leads the two of you to a padded, slightly reclining chair in one corner of the laboratory. A huge, glass orb has been suspended at head level just in front of the chair, with a number of electrical leads dangling from it like the withered tendrils of a spherical octopus. You note that there are padded restraints on the legs and armrests and ");
	if(!pc.isBimbo()) output("somehow you doubt that the scientist has had very many visitors willingly sit in this device.");
	else output("you compliment her on how thoughtful she is for her patients’ comfort.");

	output("\n\nYour host stops at this artifact of her more villainous days and taps her jiggling, bloated lips with the effort of concentration. <i>“This is, like, the Bimboozler? Or was it the Bimbooobitizer? I forget! Let’s call it the Bimbo Ball! He heh, that’s nice and easy. Just like me!”</i> You note that Badger somehow managed to take off all of her clothing except her high-heels on the walk over. Quite a feat, considering the massive size of her fuck-me heels and the swaying proportions of her over-endowed curves. ");
	if(!pc.isBimbo()) output("It’s easy to forget just how strong and dexterous the biologically augmented doctor actually is!");
	else output("That’s quite a trick! You should really have her show you how she does it.");

	output("\n\nYou gently lift the unresisting pexiga into the chair with Badger’s help. No point bothering with the restraints - you doubt she’d move by herself even if the whole building was coming down on her head. Vacant blue eyes stare forward, absently taking in the glass sphere before her. The bimbo expert crisply takes each of the machine’s cords and, snapping the clips like little monster mouths to amuse herself, attaches them to the pexiga. One for each of her fin-like ears; two for the puffy, inverted nipples bulging from between her chest plates; one for the tiny, almost unnoticeable clit between her legs; and the last one at the tip of her long, spaded tail. With all six tendrils in place, Badger raps a knuckle on the crystalline surface of the huge ball and gurgles with delight as a high pitched whine fills the room.");
	output("\n\nAs the white noise builds, the device begins to glow with an internal luminance. Waves of color cascade over the orb’s surface, flashing ripples of chromatic rings that start at the back of the sphere and collapse at a pin point right at the center of the pexiga’s vision. Green, blue, and yellow alternate in hypnotic swirls as the leads attached to the blue girl vibrate with the crackling intensity of their bioelectric output. Gradually, the vacant expression of the pexiga shifts to one of complete concentration and focus.");
	output("\n\nYou wonder aloud how the device actually works and, to your surprise, the bimbotized Doctor Badger is - for once - forthcoming with an answer. <i>“The Bimbo Ball? Oh, it’s like super easy. It’s set up to knock anybody down to the smarts of a silly slut.”</i> She wiggles her chest in pride at the self-referential title. <i>“So, like, that’s the target no matter who’s in there. My hypo- hypoth- my think-thing is that if they’re dumber than that, it’ll, like, make them smarter!”</i>");
	if(!pc.isBimbo()) output(" Frankly, you’re not sure if that explanation actually shed any light on things, but it doesn’t seem to be doing any damage at least.");
	else output(" Woah. That, like, totally makes sense! Doc Badger’s so smart!");
	output("\n\nYou’re feeling a little exposed, next to Badger and all her machines. Will you stick around to make sure the procedure takes, or leave and collect your pexiga later?");
	processTime(10);
	//[Leave] [Stay]
	clearMenu();
	addButton(0,"Leave",stepOutDuringBimboBadgerwerk);
	addButton(1,"Stay",stayForBimboBadgersWork);

}

//[Leave]
public function stepOutDuringBimboBadgerwerk():void
{
	clearOutput();
	showDrBadgerAndPexiga();
	author("Adjatha");
	output("You pat Badger on the shoulder and let her know you’ve got full confidence in her abilities but");
	if(pc.isBimbo()) output(" science is kinda boring and it’s been way too long since you’ve gotten laid.");
	else if(pc.isNice()) output(" you should really make sure things are alright back at your ship.");
	else if(pc.isMischievous()) output(" you just remembered you left something on the stove and you’ve got to get back before your spaceship burns down.");
	else output(" this whole place creeps you right the fuck out.");
	output(" Excusing yourself, you move to leave the lab and return to Tarkus. You’ll pick up the pexiga after the process is over.");
	output("\n\nDoc Badger tilts her head, tongue lolling from her narrow muzzle. <i>“Hrm? Little brain can’t handle all this, like, big brain science stuff huh? Okies! But, uh, when there’s a thing going on, the door kinda locks or something. Just give it a jiggle!”</i> She then turns her attention back to the pexiga, absently fondling herself.");
	output("\n\nSure enough, when you reach the way you came in, you find it blocked by a large steel door. Weird. You look for some kind of handle, but all you can find is a tiny LCD screen with even smaller text on it. You lean way in until your nose is almost flush with the door until the blinking lights resolve themselves into words.");
	output("\n\nThe screen reads: “Door Sealed While Operation In Progress”");
	output("\n\nJust how many of these old, automated systems are still online? You brace your hands against the door and give it a jiggle, just like Badger recommended. There’s a faint clanking from inside the steel, so you give it another, harder shove. The small screen flips to a violent red but you don’t have time to read the new message. A tremendous crack of thunder fills your ears followed by ringing silence as the door electrifies itself, blinding pain cascading through your body like boiling water being poured inside your skin.");
	output("\n\nSmouldering, your muscles clenched and your vision flooding with pops of brilliant white light, you slowly fall backwards. You’re out before you hit the ground.");
	processTime(4);
	setPexigaBimbo();
	//Go to “Next”
	pc.shieldsRaw = 0;
	applyDamage(new TypeCollection( { electric: 1000 }, DamageFlag.BYPASS_SHIELD ), null, pc, "minimal");
	clearMenu();
	addButton(0,"Next",postBimboBadgerWerkwerkwerk);
}

//[Stay]
public function stayForBimboBadgersWork():void
{
	clearOutput();
	setPexigaBimbo();
	showDrBadgerAndPexiga();
	author("Adjatha");
	
	var x:int = 0;
	
	//PC is a Bimbo
	if(pc.isBimbo()) 
	{
		/* OLD:
		output("Doctor Badger, apparently growing bored, begins tapping the colorful orb with a black furred finger. <i>“Eh heh heh. That tingles!”</i> She presses her palm on the sphere and the massive, jet black flesh of her thick member swells to life, pre-cum drippling from its tip in an instant. <i>“Woooah! That’s cool! I wonder how it does that?”</i> she ponders in an amazed tone that echoes your own. <i>“You should try that!”</i> she says with effervescent delight and before you can respond, she snatches your hand and slaps your palm against the colossal glass surface of the Bimbo Ball.");
		output("\n\nYour hand tingles slightly but almost immediately your groin begings throbbing with excitement. You giggle and pull your hand off out of curiosity. The tingling goes away, so you put your other palm on and the delightful sensation returns. Oh what fun! You and Badger take turns poking the ball and gurgling at the near-orgasmic bliss that shoots through you with every touch. You should, like, get Badger to install this in your ship! You make a mental note to ask her to set it up, but the note is blown away like a slip of paper in a hurricane as the two of you lose complete track of time playing with the mesmeric glee of the Bimbo Ball, sticky with the seeping juices flowing from your overstimulated bodies.");
		output("\n\nYou try licking the glass ball, but this proves unwise as a stray electrical arc crackles directly through your skull. With a wheezing giggle, like a beachball deflating, you collapse, darkness overtaking you.");
		//All of the PC’s dicks increase by 2 inches if they have any. PCs with at least A-cup breasts increase by 1 cup size
		//Fen note: Did this below after both checks
		*/

		/* NEW */
		//Bim-Ball 2: Electric Boogaloo
		//Bimbo Player + Bimbo Badger during pexiga conversion
		//PC is a Bimbo
		output("Doctor Badger, apparently growing bored, begins tapping the colorful orb with a black furred finger. <i>“Eh heh heh. That tingles!”</i> She presses her palm on the sphere and the massive, jet black flesh of her thick member swells to life, pre-cum bubbling at its tip. <i>“Woooah! That’s cool! I wonder how it does that?”</i> she ponders in an amazed tone that echoes your own. <i>“You should try it!”</i> she gasps with effervescent delight. Before you can respond, she snatches your hand and slaps your palm against the colossal glass surface of the Bimbo Ball.");
		output("\n\nYour fingertips tingle slightly but almost immediately your loins begin throbbing with excitement. You giggle and pull your hand off out of curiosity. The heat gradually fades, leaving you feeling positively chilly. Slapping your other palm on the ball brings back the delightful sensation, warmth and all. Oh what fun! You and Badger take turns poking the ball and gurgling at the near-orgasmic bliss that shoots through you with each touch. A near constant stream of musky pre oozes down the Doc’s throbbing, ebony shaft, leaving a similar stream of drool trickling down the side of your mouth.");
		if(pc.hasCock()) output(" Your own [pc.cockBiggest] bobs heavily, seemingly weighed down by the building pressure in your gut. It feels like WEEKS since you had your last orgasm!");
		if(pc.hasVagina()) output(" You’re feeling short of breath in the suffocating ozone of Badger’s bunker, your heavy panting leaving you more light-headed with each moment. The needy itch deep in your womanhood is practically all you can think about as you run your fingers up and down the curves of your [pc.pussy].");

		if(!pc.isCrotchExposed() && !pc.isChestExposed()) output("\n\nWeird, you don’t remember taking off your [pc.gear], but there it is, in a pile on the floor. Silly clothes, always just falling off of you! ");
		else output("\n\n");
		output("It’s so hard to focus on what’s happening around you that things just float across your consciousness like soap bubbles on bathwater. The pexiga looks like she’s not very far away, but the girl’s dull moaning echos as if she’s at the bottom of a deep, deep well. The doctor is close enough to touch - in fact now that you think about it, she IS touching you!- but she seems blurry as if she’s moving in slow motion. But, like, in reverse? Does that make any sense? You shake your head. Thinking’s hard. Hard like the pretty, multi-colored ball.");
		output("\n\nOh, the ball! Turning your attention to the colors seems to bring everything back into focus. You should, like, get Badger to totally install this in your ship! You make a mental note to ask her to set it up, but the note is blown away like a slip of paper in a hurricane when the curvaceous scientist’s wandering hands find your [pc.breasts]. Your spine jiggles like electric gelatin, your body an open book to the good doctor. Her giddy giggles bounce around the inside of your head as she tweaks and squeezes your [pc.nipples] like she were milking livestock.");
		if(pc.canLactate()) output(" Which, of course, is exactly what you are. Bubbling cream rises to your teats in answer to Badger’s assistance, spurts of [pc.milk] drawn out by hands that are at once astonishingly cruel and yet breathtakingly skilled. She, like, totally missed her calling, you reflect with a mooing sigh.");

		output("\n\nYou pull your hands off the glowing sphere to wrap your fingers around Badger’s, but the euphoria begins draining away once more. A candle’s worth of an idea flickers behind your eyes, startling you a bit. Maybe the color ball is, like, making you a smarty too? Crazy! Acting on your idea before it scampers away, you swing the Doc around and push her back against the suspended sphere. Pressing yourself tightly against the fuzzy girl’s cushioning curves, you tremble in delight as the orb’s intoxication floods you right through your badger-cushion, your fellow bimbo transmitting the awesome vibes perfectly. The ball sways against the weight of both of your bodies but is heavy enough to provide at least a little support to your entwined bodies. Even better, Badger’s hardness presses against the [pc.skinFurScales] of your tummy, giving your dizzy lust something to concentrate on.");
		output("\n\nDoc Badger’s fur practically crackles with the electrical impulses pulsing within the orb. Every muscle drawn taut, her right eye twitches as fresh shivers tremble up and down her jiggling form. <i>“Are you, like, okay?”</i> you murmur into the fuzzy tuft of her deep cleavage. By way of response, her fat black cock begins quivering with the helpless onset of a machine-milked orgasm. Nearly panicking, you drop down and rush to wrap your [pc.lips] around her crest before even a drop of that precious spunk can go to waste. Luckily, all your training was not in vain, and the very first spray finds its proper home inside your suckling body. The doc’s jizz is hot and thick, filling your cheeks and rolling over your tongue like a dessert pudding. Her feral musk is potent enough to rise up through the roof of your mouth and flood your nostrils with a tickling sensation.");
		output("\n\nYou can’t bring yourself to let that cloying taste go even for an instant, so you hold back your natural urge to gulp down the precious seed. Badger’s stunned, blissed-out expression hasn’t changed, so you start rocking your head back and forth on her sensitive shaft, using your tongue to paint her dark flesh white with her own oozing spoo. Each time you draw back, you leave a slightly thicker coating, the frothy goo hanging down in sticky webs that splatter on your chin and dribble down her balls. You go deeper, pushing the girl’s swollen head against the back of your mouth with progressively faster strokes. Another quiver runs through her and your cheeks balloon with a fresh load. Despite the tight suction of your cum-thirsty pucker, a stray bubble manages to roll down your throat and into your belly.");
		output("\n\nThe feeling that overtakes you is like discovering that you’ve been starving without even realizing it. Your tummy growls with hunger and keeping the yummie cummies rolling around in your mouth simply isn’t an option any longer. Pulling off of Badger’s dick until only her tip is kissing your [pc.lips], you take a long swallow that seems to last forever. When the last goo goes down, you furrow your brow in concentration and set about getting more from the Doc. Oh so much more. With a savage thrust, you spear your throat on the bimbo’s jet shaft. A tremor of excitement takes you as your partner’s thickness cuts off your air, your neck bulging with the slime-lubed shaft inside it. Swallowing until your nose is squashed against Badger’s fuzzy belly, you can’t help but massage her swinging pouch with greedy impatience. Like a good slut, Badger is forthcoming with a third jet of bimbo-batter that gushes down your esofa- esapha- your tummy-tube and then a fourth.");
		output("\n\nThe warm heat of her orgasmic discharge weighs heavily in your gut, but what kind of pro dick-sucker would you be if four were enough? You rock your head from the doctor’s root to her tip, taking in fresh air before jamming her deep inside throat again and again. Swirling your [pc.tongue] around the pulsing tool, you take every opportunity to squeeze her climax-tender crest, tease her trembling cumvein, and stroke the nerve-dense rolls of her foreskin. A casual glance upward shows that the good doctor is enjoying your efforts, albeit silently. She hasn’t moved even a muscle, but the whites of her eyes seem to have been replaced with the same swirling colors radiating through the huge orb she’s pressed against. Neat! You didn’t even know she could do that. You’ve got a lot to learn from the Doc, you consider as you turn your attention back to the cock cumming into your stomach.");

		//if vagina
		if(pc.hasVagina()) 
		{
			output("\n\nDespite the mouth-watering satisfaction you’re getting from your savage throat-fucking, your [pc.vaginas] drool");
			if(pc.totalVaginas() == 1) output("s");
			output(" in jealousy. Your own inner heat eclipses Badger’s, leaving your body tingling with an untended ache. Pulling a hand down to work shuddering fingers into your velvet box seems the most obvious solution. Even as distracted as you are, the fumbling, kneading circles you trace across your puffed lower lips and [pc.clits] brings a tense relief that leaves you moaning into the doctor’s dick. Putting the doctor’s nipple-milking technique to work on your joy buzzer leaves you breathless in a way that has nothing to do with the fat cock jammed into your windpipe. Gushing girl-cum floods your inner depths and overflows in drooling torrents down your [pc.thighs]. Swaying back and forth on your [pc.ass], your muscles clench with wet, wanton need. You sure hope Badger’s machine gives your pexiga a dick, ‘cause you need something long and hard stuffed inside your pussy and you need it now!");
		}
		//if penis
		if(pc.hasCock())
		{
			output("\n\nThe desperate, frantic passion of your activity seems to seep into your loins. Even without touching your tensed hardness, you can feel the reservoir of your restraint bursting. Sucking and slurping on Badger’s tool with lightheaded vigor, it’s almost as if you can feel the tight moistness of your mouth and throat around your own meat instead. Pleasure so intense it registers only as numbness overtakes your [pc.cocks]. A splatter of hot fluid against your [pc.skinFurScales] reaveals that you’ve begun cumming without even realizing it. You don’t know if it’s because of the pretty color ball, the heavy belly-full of badger spunk, or the excitement of your pexiga’s incoming improvements, but you find yourself cumming as hard as you ever have. Spasms of ecstatic release sends your hips bucking helplessly, ropes of [pc.cum] splattering against Badger’s legs and pooling in your lap.");
			if(pc.balls > 0)
			{
				output("\n\nThe lurching pressure in your [pc.balls] catches you off-guard and a vague fantasy passes across your sight. Instead of your usual jizz factories, it feels as if you have a pair of the color-shifting balls Badger is leaning against attached to your loins. Every erupting gout of slimy spunk is accompanied by a blast of hypnotic light and color and you can see yourself blasting dripping facials into crowds of unsuspecting strangers. With every heaving, heavy load, your [pc.balls] splatter [pc.cumVisc] [pc.cumNoun] over gaping bystanders. They moan as their bodies swell with the sexy inflation of proportions like your own. Every surge of seed implants the blossom of your endless lust in their minds and loins. As they climax from the bimbotizing bukkake, the delusion passes and you’re brought back mid-climax. You gasp, wondering if that’s what Doctor Badger sees all the time. Just the thought almost makes you want to give up on Dad’s company and go into super science too!");
			}
			if(pc.cumQ() >= 2000)
			{
				output("\n\nThe cascade keeps coming, your [pc.cockBiggest] upright and fountaining jets of [pc.cumVisc] [pc.cumColor] across the two of you, even reaching high enough to catch the bottom of your jaw as you barely manage to keep up your cocksucking pace. You try to touch your rogue member, but even just grazing the sensitive tip is enough to send out another plentiful outpouring of [pc.cumGem] goo. Your hands dripping with spunk and your own body trembling with the thrashing rapture of your ongoing climax, you do the only thing that makes sense. Gathering up handfuls of your oozing bliss-batter, you reach between Badger’s spread legs and start shoveling your cum into her, one finger at a time. As off as your draining orgasm has left you, you can’t help but notice the whimpering whines your efforts draw from the Doc every time you stuff in another fistful.");
			}
		}
		output("\n\nEventually, however, even your bimbo-instincts are overwhelmed by the spurting euphoria of the badger bimbo’s orgasms. By the time you’re sated, your belly has bloated well past your [pc.hips], jiggling with the weight of your liquid feast. You rise with considerable difficulty, holding onto Badger’s own heavyset hips for support. Drained utterly, her cock throbs in the open air, orgasming with nothing left to release. Her eyes are half-lidded, her mouth open and slack while her tongue hangs out atop her puffy, cock-pillow lower lip. You’d think somebody who looks that out of it would collapse to the ground, but the doctor seems stuck to her own invention. Maybe you’re not supposed to touch it afterall? Or, at least, not with your whole body. You shrug.");
		output("\n\nSticky with the juices of your play and still feeling a bit high from the mesmeric glee of the Bimbo Ball, you figure you should check in on how your pexiga is coming along. Before you go, though, you try to give glass ball a wet, sloppy kiss of thanks. This proves unwise as a stray electrical arc crackles off the cum and saliva, shooting directly through your skull. With a wheezing giggle, like a beachball deflating, you collapse with a silly smile on your face, darkness overtaking you.");
		for(x = 0; x < 20; x++)
		{
			pc.orgasm();
		}
		pc.boostCum(40);
	}
	//PC is not a Bimbo
	else
	{
		output("Doctor Badger, apparently growing bored, begins tapping the colorful orb with a black furred finger. <i>“Eh heh heh. That tingles!”</i> She presses her palm on the sphere and the massive, jet black flesh of her thick member swells to life, pre-cum drippling from its tip in an instant. <i>“Woooah! That’s cool! I wonder how it does that?”</i> she wonders in an amazed tone that leaves you a bit worried. <i>“You should try that!”</i> she says with effervescent delight and before you can respond, she snatches your hand and slaps your palm against the colossal glass surface of the Bimbo Ball.");
		output("\n\nYou curse yourself for not remaining on your guard, even around a bimbotized Badger, but the tension of your ");
		if(pc.isNice()) output("panic");
		else if(pc.isMischievous()) output("annoyance");
		else output("anger");
		output(" is washed away almost immediately. The electrical current pumping into the pexiga finds the slightest outlet in your hand’s contact and a small fraction of the reprogramming voltage crackles through your nerves, up your spine, and into your brain. A soundless clap of thunder ripples through your body and you can feel your eyes crossing as IQ points start draining away.");

		output("\n\nEvery inch of your body feels fresh and new, filled with raw potential that drinks in sensation with a keen thirst. From the " + (pc.hasHair() ? "tip of your [pc.hair]" : "top of your head") + " to the base of your [pc.feet], a wet moisture of eager delight surges within you.");
		if(pc.biggestTitSize() >= 1)
		{
			output(" Your inner heat ebbs and flows with every panting gasp you take and you can feel your [pc.breasts] swelling under its vibrating hum, as if soaking up your siphoned brain power.");
		}
		if(pc.hasCock()) output(" A gushing ocean of needy lust washes through your [pc.cocks], the tender flesh throbbing in time with your racing heartbeat.");
		//If above 50 Int, PC loses 5 points of Int. If Int is 50 or below, player loses 2 points of Int.
		//Fen note: Nope. Gonna make this IQ-based.
		if(pc.IQ() >= 60) pc.intelligence(-5);
		else if(pc.IQ() >= 35) pc.intelligence(-3);
		else pc.intelligence(-1);
		//All of the PC’s dicks increase by 2 inches if they have any. PCs with at least A-cup breasts increase by 1 cup size
	}
	if(pc.hasCock())
	{
		for(x = 0; x < pc.cockTotal(); x++)
		{
			pc.cocks[x].cLengthRaw += 2;
			if(pc.hasPerk("Hung")) pc.cocks[x].cLengthRaw += 2;
			if(pc.hasPerk("Mini")) pc.cocks[x].cLengthRaw -= 1;
		}
	}
	if(pc.biggestTitSize() >= 1)
	{
		for(x = 0; x < pc.bRows(); x++)
		{
			pc.breastRows[x].breastRatingRaw++;
		}
	}
	//PC is not a Bimbo and has dick
	if(!pc.isBimbo() && pc.hasCock())
	{
		output("\n\nHeaviness sinks in your gut like a cold pit, and you look for help. All you find, however, is the bimbo badger sinking to her knees in front of you. Eagerly, she wraps her thick, whorish pucker around your [pc.cockBiggest], the exhaustion of your draining descent snaping back like a rubber band. In this state, just the touch of her lips is enough to bring you to climax, the full, liquid weight of your hot load erupting in her mouth with impatient, pressurized bliss.");
		if(pc.cumQ() < 250)
		{
			output(" Thick beads of [pc.cumGem] spurt into the vacuum-like suction of her hungry maw, swallowed greedily by the spunk-suckling scientist.");
			output("\n\nSucking and swirling her thick tongue around your girth, the doctor slurps up everything you’ve got and keeps going, searching for more. She pulls back to lap at the tip of your [pc.cockheadBiggest], with relentless thirst.");
		}
		else
		{
			output(" Gouts of [pc.cumVisc] [pc.cumNoun] race down the back of her throat, spurt from the sides of her mouth, and even gush up out of her nostrils in [pc.cumColor] globs.");
			output("\n\nThe bimbo grins at the sopping mess you’ve made of her face and pulls back to add some inane commentary to the climax, but your body needs more.");
		}
		output(" Instinctively, you seize the back of her head with your free hand and jam her muzzle right back down onto your cock. Her eyes go wider as your meat twitches and releases a second orgasm moments later. Even larger than the first, a fresh river of cream rushes into her mouth faster than she can swallow. She gurgles and hacks, frothy curtains of spunk dripping down her chin and soaking her ample cleavage.");
		if(pc.biggestCockLength() <= 5) output(" You thrust again, her jaw ratcheted open by your [pc.cockBiggest], using her face like a custom-built cock milker");
		else output(" You thrust again, her opened throat easily permitting the full length of your [pc.cockBiggest] into its velvet tautness.");

		output("\n\nA third orgasm, and then a fourth sprays thicker and thicker spunk down her maw as your body’s boiling lust accelerates without any apparent way to stop itself. Numbers become meaningless as the bimbo slut’s belly bloats with the weight of your fattening spoo");
		if(pc.cockTotal() > 1) 
		{
			output(" even as the drooling overflow of your unsuckled member");
			if(pc.cockTotal() > 2) output("s");
			output(" soak");
			if(pc.cockTotal() == 2) output("s");
			output(" her heavy curves in a slimy second skin");
		}
		output(". You cum and cum, mind going blank as cascades of green, blue, and yellow swirl in the darkness of your diminishing mind.");
		for(x = 0; x < 20; x++)
		{
			pc.orgasm();
		}
	}
	//PC is not a Bimbo and doesn’t have dick
	else if(!pc.isBimbo())
	{
		output("\n\nYou don’t have even a trace of resistance left in you as the bimbo badger steps behind you and rests her deceptively strong hands on your [pc.hips]. <i>“It’s great, isn’t it?”</i> she laughs with air-headed innocence. <i>“I guess it’s having a big effect on you, ‘cause you’ve still got your brains,”</i> she murmurs, her claws sinking into your [pc.skinFurScales] for a moment. The stiffness of her extra-thick cock presses against your [pc.butt] as she circles around to look you eye to eye. You almost expect some small fragment of her former self to come bubbling to the surface, but Badger simply sighs with a happy, wistful coo.");
		output("\n\nYou try to fight through the bliss, but the doctor grabs your other hand and slaps it onto the glass sphere with an effortless giggle. The redoubled bioelectricity very nearly robs you of all motor control and it’s only through the enraptured stiffness of your body that you remain standing at all. Doctor Badger places both of her palms on the orb but receives only the faintest echo of your paralytic pleasure. <i>“Oh pooh. You’re taking all the good stuff,”</i> she huffs. Her eyes go wide with revelation. <i>“Oh! What if I, like, share yours? That’ll prolly work!”</i> She moves behind you once more and without a second’s hesitation, plunges her massive, breeder shaft directly into your [pc.asshole].");
		pc.buttChange(chars["DRBADGER"].cockVolume(0));
		output("\n\nYour mouth falls open, wordless sensation suffocating you as the thick meat pushes past your sphincter and into your inner depths with all the romantic subtlety of a huge rubber fist. The orb’s rewiring current, however, converts what by rights ought to be extreme pain into toe-curling bliss. It is as if your ass were the very nexus of your nerves and the hyper-endowed badger just fed twelve inches of gut-stuffing rapture right into the pleasure center of your soul. Your frame trembles and clenches with something far beyond a simple orgasm as your [pc.tongue] lolls out of your mouth. You lean forward, letting the side of your face rest against the prickling screen as you burble with thoughtless ecstasy. She pumps in and out, each ball-slapping impact sending a fresh climax thrilling through you, one after another.");
		output("\n\nThis isn’t mere sex and it certainly isn’t love-making. She’s ravishing you in every sense of the word - your mind feels like it’s being carried off by the spurting girth of the bimbo doctor’s shaft. Your eyes roll back and your [pc.tongue] lolls out of your mouth, but all you can think about is the voluptuous bimbo slamming semi-spongy inches of heaven into you. [pc.GirlCumVisc] streams of [pc.girlCumNoun] drench your [pc.thighs] and pools at your [pc.feet] so quickly, it is as if your body is melting into a puddle of fuck.");
		if(pc.biggestTitSize() >= 1) output(" Your expanding [pc.breasts] thud with added weight against the bimbo ball, the shockwaves of your impacts adding a mesmeric swirl to the vanishing color halos cascading across its surface.");
		output("\n\nThe blossoming void of your gurgling bliss is filled in short order by the boiling heat of the doctor’s gut-swelling geyser. Your body clenches to hold in every milliliter of the sacred seed, even as you shudder with your own rolling climax.");
		if(pc.ass.looseness() <= 2) output(" You squeeze and wiggle as your [pc.asshole] drinks in a gallon or more of Badger’s thick jizz, her bounty leaving your belly bloated and sloshing.");
		else output(" There’s simply too much for you to hold in, however. Streams of thick jizz spurt from your [pc.asshole] in fat strands that paint your [pc.ass] a creamy opal hue before running down your [pc.thighs] to mix with your own ocean of sticky lust.");
		output("\n\n<i>“Not bad for a little pre-cum, huh?”</i> she asks, giggling. Your eye twitches as she renews her anal assault and in seconds, darkness engulfs you.");
		for(x = 0; x < 20; x++)
		{
			pc.orgasm();
		}
	}
	processTime(30);
	//merge all, move player to their ship
	clearMenu();
	addButton(0,"Next",postBimboBadgerWerkwerkwerk);
}


public function postBimboBadgerWerkwerkwerk():void
{
	clearOutput();
	showPexiga();
	author("Adjatha");
	
	currentLocation = "SHIP INTERIOR";
	generateMap();
	
	output("The thick curtain of oblivion around you begins shifting, like bedding being gradually drawn away from your eyes. You let out a slight moan as bits and fragments of your past come back in disordered fragments. Gradually, you reassemble yourself, bit by bit, until you’re more or less back to how you started the day.");
	if(!pc.isBimbo()) 
	{
		output("\n\nQuite an accomplishment, considering Badger’s almost predictably obvious trap. You groan as the memory of Yammi’s warning comes back to you.");
		if(pc.isNice()) output(" You’ll have to apologize to her for ignoring the warning the next chance you get.");
		else if(pc.isMischievous()) output(" Better make up some story about how you expertly escaped Badger’s clutches through clever trickery and raw sexual magnetism.");
		else output(" Best not to even mention the episode to Yammi. The last thing you need is an <i>“I Told You So”</i> from your cook.");
		output(" Your head still aches and it feels like something’s not quite right with your balance, so it seems you didn’t quite come away from Badger’s lab totally unscathed.");

		output("\n\nWait a minute... Badger! You summon every ounce of strength you can to force open your eyes against the blinding illumination around you. Blinking and whipping your head around, you’re relieved to find no sign of the fiendish bimbo. In fact, you seem to be aboard your own ship. How did you get back here? You push yourself up to a sitting position looking for some explanation.");
	}
	else
	{
		output("\n\nYou yawn and snuggle into yourself. You feel great! Maybe Badger would come on your ship so the two of you could play more often? That’d be fun, you sigh wistfully. Oh yeah, where’d Badger get off to? You blink your eyes open and look around for the squishy slut, but find no trace of her. Aw, you kinda wanted to play a bit longer! Also, you seem to be back on your ship. Ha hah, that’s silly. You weren’t in your ship before. How’d you even get here?");
	}
	output("\n\nYour answer comes in the form of a big, wet, slurping tongue to the face. You sputter and protect yourself from the oral assault with both hands. Your alarm vanishes as you smack your lips. Sugar? Lowering your arms, you find the pexiga staring at you happily, her two foot tongue dangling heavily from the ring gag in her mouth. Unlike her usual placid oblivion, however, she’s entirely focused on you and actually wears a happy expression.");
	output("\n\nShe lunges forward to lick you again, but you settle her down and push her into a sitting position. Strangely, most of the girl’s blue appears to have been bleached right out of her. Now the scales of her skin are an almost silvery white. Her breasts have swollen to massive F-cups larger than her head, so it’s no wonder she’s kept to her proclivity for crawling around on all fours. The pexiga’s long, spaded tail wags back and forth in delight as she cocks her head to one side, watching you intently. <i>“Hai hai!”</i> She chirps in a voice far sweeter than you would’ve expected for such a deadly carnivore.");
	output("\n\nWait a minute. She spoke? What? When? More importantly, how is she talking with a ring gag in her jaws and her tongue dangling out? You ask her what happened, watching her mouth carefully. <i>“Miss Badger said to take you back to the ship,”</i> she explains, nodding affirmatively. <i>“Kinda miss the pretty ball, though. It was all woosh and woo and woah and then good feelings all over!”</i> The pexiga wriggles, her tail stroking her curves a little too forcefully.");
	if(!pc.isBimbo()) output("\n\nAs you pay closer attention to the pale girl’s mouth, you can see that the sound isn’t coming from her throat at all. In fact, it seems to be coming from the massive stud set in the tip of her tongue. The plain steel ball and bar Yammi put on her has been replaced with a golden one that vibrates slightly, transmitting words like a speaker. There must be some neural interface, but how Badger managed to accomplish it is beyond you. Whatever nefarious purpose it was originally intended for, the thought-stud seems quite handy on the pexiga.");
	else output("\n\nAw, pooh! You passed out before the bimbo ball really got going? What a bummer! As for how she’s talking with a ring gag on, you just don’t have any ideas! Maybe she’s talking right into your brain! Woooooah. You think something as hard as you can, but the pexiga just stares at you with a big, silly smile. No luck! You guess she must just be magic. That’s probably it. SCIENCE magic.");
	processTime(85);
	clearMenu();
	addButton(0,"Next",pexigaNamingSetup4BimboBadgerwerk);
}

public function pexigaNamingSetup4BimboBadgerwerk():void
{
	clearOutput();
	showPexiga();
	author("Adjatha");
	output("You pat the affectionate girl on the long spines of her hair and ask what you should call her. <i>“A name? Ummm...”</i> She trails off, staring emptily into the air for a moment. Maybe you could help her out and suggest a name?");
	
	//Player inputs a name for their bimbo pexiga. Alternately: her default name could be Beasti, Ditzi, or something along those lines
	if(stage.contains(this.userInterface.textInput)) 
		this.removeInput();
	this.displayInput();
	output("\n\n\n");
	clearMenu();
	addButton(0, "Next", pexigaNamingConventions, pexigaNamingSetup4BimboBadgerwerk);
}

//Dr Badger (Gone)
//If the player has already reported Dr. Badger, play the following when they arrive at the far eastern section of Novahome

public function drBadgerShackPexigaQuestGo():void
{
	if(!drBadgerAtBimbotorium() && flags["PEXIGA_TALKED"] != undefined && flags["PEXIGA_TREATMENT"] != 1)
	{
		if(flags["LASH_BOMB"] != undefined || flags["DEL_DISTRACT"] != undefined)
		{
			output("\n\nThe cops are gone. Now’s your chance to explore Dr. Badger’s lair.");
			addButton(0,"Explore",exploreDrBadgersAbandonedBadgerBase);
		}
		else
		{
			output("\n\nUniformed Peacekeepers are standing outside Doctor Badger’s shack, their holographic tape and Hammer Pistols more than ample encouragement for the locals to keep their distance. The scavenging raskvel cast mournful looks toward the mad scientist’s hut, imaginations populating untold fortunes on just the other side of the thin blue line.");
			if(pc.isBimbo()) output("\n\nOh, that’s right! You told Penny about Badger’s stuff and she told the UGC! Dang. Just when you need the Bimbo Master herself, she’s nowhere to be found. Also, you’re not sure if she’d be super happy to see you at this point. Well nerts. What are you going to do now?");
			output("\n\nYou look over the former Bimbotorium. Nobody has more experience messing with intellect than Badger. If anybody could fix your pexiga, it’d be her. But now... well it seems your only hope is that her lab is more or less intact under all that police tape. But how to get in?");
			output("\n\nThe Peacekeepers glance at you, then return to their conversation, writing you off as another onlooker.");
			
			if(flags["PEXIGA_TREATMENT"] == undefined) flags["PEXIGA_TREATMENT"] = 0;
		}
	}
	else
	{
		output(" A couple of uniformed Peacekeepers are standing outside, keeping the curious raskvel from entering the premises. <b>It looks like Doctor Badger’s offices have been shut down for good.</b>");
	}
}

//Add the [Peacekeepers] option to Shekka, Dr. Lash, and Delilah:
//Shekka
//[Peacekeepers]
public function shekkaPeacekeeperTalk():void
{
	clearOutput();
	showShekka();
	author("Adjatha");
	output("You mention the UGC Peacekeepers to Shekka and she immediately interrupts you. <i>“Oh yeah, those guys? Geez, what a mess, am I right? Dozens of raskvel go missing to the Mess and nobody blinks an eye, but some wanted criminal from the core turns up on Tarkus and the police are out here faster than a jump start! I wouldn’t be surprised if the Confederacy was riding shotgun with slavers from day one.”</i>");
	if(!pc.isBimbo()) output("\n\nShe seems awfully touchy about the subject. No sense beating around the bush, so you tell the excitable mechanic exactly what you’re planning.");
	else output("\n\nYou clasp her hands to your [pc.breasts] and practically bounce up and down, begging for her help. <i>“Shekkaaaaaaa...”</i> you whine, <i>“you’re so smart and I really need to get in to Badger’s place, and couldn’t you maybe just help me out with this one, teeny little favor? I’ll make sure it’ll be WELL worth your time,”</i> you hint, suggestively pursing your lips together.");
	output("\n\nThe crimson scaled girl eyes your pexiga warily before turning back to you. <i>“Hey, I’d love a chance to get some salvage from that bimbo-place. And, of course, the UGC and me get along about as well as a sparkplug and a bucket of anti-freeze. But I’ve got a business to think of. I can’t go around making trouble for Johnny Law just as a distraction for your weird monster there.”</i>");
	output("\n\nHer tail whips back and forth in agitation. <i>“Sorry, sorry, I’m just a bit punchy, I guess. You find anything of interest, bring it back and I’ll give it a look, but count me out on the infiltration bit. I’ve spent too long looking into the Mess to risk getting picked up for petty Breaking and Entering, you know?”</i>");
	output("\n\nLooks like you’re going to have to get help somewhere else.");
	processTime(3);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Dr. Lash");
//[Peacekeepers]
public function drLashPeacekeeprTalk():void
{
	clearOutput();
	showDrLash();
	author("Adjatha");
	output("The deranged doctor seems all too happy to discuss the fall of his rival across the way. <i>“Oh, of course, it had been a minor conceit of mine that the miserable “Doctor” Badger would be undone through my own machinations, but in truth it was a trivial thing. The expediency of her removal is all that matters. One less distraction from my visionary work.”</i>");
	if(!pc.isBimbo()) output("\n\nLash seems a little less collected than usual. Perhaps he’s actually a bit nervous about having UGC agents so close to his sanctuary. Afterall, the immaculately clean building sticks out like a sore thumb amid the greasy, patchwork menagerie of the rest of Novahome. Carefully, you broach the topic of the Peacekeepers themselves. Rather than waiting around and hoping they don’t notice him, why not take the initiative. Afterall, he doesn’t want to end up like Badger: on the run or in custody.");
	else output("\n\nLashy seems a bit out of it. He’s normally so distant, but you think you can hear a little emotion leaking out here and there. You snap your fingers in realization: he probably misses Ms. Badger! He likes to complain, but it’s hard to stay mad at somebody as sexy as the Doc. He glances up in annoyance at your snap. Nodding emphatically, you offer your take on things: <i>“You should invite the Police over for a chat! Maybe they know where Badger went off to, and you could go visit her just like old times!”</i>");
	output("\n\nDr. Lash’s glowing red goggles dim as he regard you critically. <i>“Ordinarily, I would reject such an idiotic proposition out of hand. However, the thought that these men of the law may take an interest above their paygrade had occurred to me prior to this conversation.”</i>");
	output("\n\nYou ask if that means he’ll meet them himself.");
	output("\n\nThe neuter turns a withering gaze on you. <i>“Just as I had hoped a small glimmer of insight had wormed its way into the sex-addled mucus of your brain... No, of course I will not accost these bureaucratic puppets myself. Like a smart man, I will be using a machine to redirect their attention. Observe.”</i> Dr. Lash produces a small, slim controller from a pocket and presses a button.");
	output("\n\nA tremendous shock cracks through Novahome, the walls around you shuddering as the vessel-turned-city shakes under the muffled percussion of a distant bomb being detonated. Your eyes wided and you turn to ask him what that was, but the sinister figure predicts your question before you can even open your mouth.");
	output("\n\n<i>“A small bomb I planted in the western end of the city. Nothing world-shattering, of course.”</i> His thin lips twist in a mild smile. <i>“Just something I had left over from my attempts to dispose of that wretched Badger creature. Alas, she never rose to my bait and remained firmly ensconced in her lair until UGC intervention. Ah well...”</i> He sighs at the missed opportunity for murder.");
	output("\n\n<i>“For my purposes now,”</i> Lash continues, as if lecturing a particularly dim pupil, <i>“the blast will be just large enough to incite a panic and redirect UGC attention. In all likelihood, they will determine it to be a further plot by those insipid pirates.");
	//if player has completed Tarkus Bomb Quest:
	if(flags["TARKUS_BOMB_TIMER"] <= 0 && flags["TARKUS_BOMB_TIMER"] != undefined || flags["PLANET_3_UNLOCKED"] != undefined) output(" Or perhaps a parting gift.");
	output(" In any event, the necessity for their lackies to remain near my residence will be found wanting.”</i>");
	output("\n\nDr. Lash turns his full attention to you and you can just about feel the severity of his mad fervor like a weight on your chest. <i>“I presume you had some errand to focus on in that cordoned shack. You may go and tend to your affairs now. Be forewarned, however: this was not a favor. I redirected the Peacekeepers for my personal advantage alone. I will not be tapped for trivial errands, and those who presume to do so may find themselves on the operative end of the next detonation.”</i> He turns back to his work, dismissing you with an absent wave of his hand.");
	if(!pc.isBimbo()) output("\n\nYou’re not sure if you should thank him or draw your weapon. The man’s barking mad, that much is obvious. You’re tempted to tip off the Peacekeepers, but you suspect that’d only be signing their death warrants. If somebody steps up to Lash, they’re going to need to be prepared for the devil himself.");
	else output("\n\nWhew, what a relief. All this thinking and talking was starting to make you feel dizzy. Lashy just is not as much fun as Doc Badger. Not by a long shot!");

	//Remove “Peacekeepers” option from other quest links, add “Explore” option to East Novahome.
	//[End]
	flags["LASH_BOMB"] = 1;
	processTime(20);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function peacekeeperTalkAvailable():Boolean
{
	return (flags["LASH_BOMB"] == undefined && flags["DEL_DISTRACT"] == undefined && flags["PEXIGA_TREATMENT"] == 0);
}

//Delilah
//[Peacekeepers]
public function dclPeacekeeperTalk():void
{
	clearOutput();
	showDel();
	author("Adjatha");
	output("You mention the UGC Peacekeepers to Del, as you take a seat at the bar. <i>“Oh, uh, those guys on the east end of town? Y-yeah, I think I’ve seen them.”</i>");
	if(!pc.isBimbo()) output("\n\nYou mention that maybe they could help her out a bit. A favor here and there wouldn’t go amiss. While they’re not likely to free Delilah from her contract any time soon, it wouldn’t hurt to get them on her side. Maybe a free drink? Maybe a little something extra?");
	else output("\n\n<i>“Well, like, they’d be good for business,”</i> you explain. <i>“Like you could offer them a drink or whatever and they could fuck you for payment. Get some practice with folks from off-world, you know?”</i> You offer her a big grin, wrap your forefinger and thumb into a circle and mime a couple of fingers going through it.");

	//Del Untouched:
	if(timesDelilahSexed() < 1) output("\n\nDel blushes at the suggestion and shakes her head before realizing that Beth may be watching. <i>“Um, that’s... I mean...”</i> She seems agonized by the effort of it, but her training wins out. <i>“Dang it, this isn’t what I signed up for. Yeah, I guess that would be fine,”</i> she admits, her face cast down and flushed with the embarrassment of her surrender. <i>“Just, nothing weird, okay?”</i> You give her a pat on the shoulder by way of encouragement and send one of the wait staff to go offer a couple freebies to the officers.");
	//Del Corrupted
	else if(timesDelilahSexed() < 6) output("\n\nDelilah blushes, holding a drink tray in front of her crotch. <i>“Oh, um, I guess. Ms. Carver couldn’t get upset if I got a little extra practice, could she?”</i> You give her a thumbs up and she closes her eyes, breathing deeply to steady herself. It seems she hasn’t quite gotten used to her new position, but you get the feeling her racing heart has more to do with excitement than embarassment. The dark-skinned bartender sends one of the Mess’ wait staff to go fetch the officers.");
	//Brokened
	else output("\n\n<i>“Oooh, fresh faces? And lawmen too,”</i> she sighs, fingertips tracing across her chin wistfully. <i>“I wonder if they’ll be very rough with me,”</i> she ponders, unconsciously leaning forward to present her ass. <i>“You know, you’re right. I really should go see about making them feel welcome,”</i> she adds with a shiver that has nothing to do with the air conditioning. She sends one of the wait stuff to invite them to the bar as she checks her hair and hikes her clothing a bit to show off her smooth, dusky skin.");

	output("\n\nThe Peacekeepers arrive so quickly, you’d swear they were practically running. Seems they haven’t had much of a break since being assigned to Tarkus and are looking to slake their thirsts in more ways than one. You leave the barmaid to be groped by the horny policemen and make sure your pexiga is close at hand. Time to see what Doctor Badger left behind in her ");
	if(!pc.isBimbo()) output("little shop of whores.");
	else output("super fun boobie shop!");
	//Remove “Peacekeepers” option from other quest links, add “Explore” option to East Novahome
	//[End]
	processTime(4);
	flags["DEL_DISTRACT"] = 1;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Explore]
//player has distracted the Peacekeepers and selects this option from the East Novahome square
public function exploreDrBadgersAbandonedBadgerBase():void
{
	currentLocation = "304";
	generateLocation(currentLocation);
	
	clearOutput();
	showPexiga();
	author("Adjatha");
	output("Making sure the Peacekeepers have really gone, you lead your pexiga towards the former clinic of Doctor Badger. Holographic police tape flickers across the ramshackle building, but offers no resistance as you approach the door. It looks dark inside, but luckily you spy a stray glowstick in the rubbish piled against the building. It’s not much, but it should offer a little light.");
	output("\n\nCracking the plastic tube in one hand, you step into the building. The dull luminance of the device casts an eerie, green glow through the interior of the doctor’s lair. Even ordinary objects seem to take on a sinister appearance in the abandoned Bimbotorium. Scorch marks on the floor and bulletholes in the walls suggest that the UGC didn’t oust Dr. Badger easily.");
	output("\n\nLuckily, it doesn’t seem that the place has been ransacked. Perhaps out of fear for (probably literal) boobytraps, the building seems much as you remember it. A quick check of the front room turns up nothing, so you head to the back, keeping your pexiga on a short leash just in case the creepy hovel turns dangerous.");
	processTime(4);
	//[Go to Nym-Foe Fight]
	clearMenu();
	addButton(0,"Next",nymfoeSetup);
}

//After the fight
public function noBadgerPostNymFoe():void
{
	clearOutput();
	showPexiga();
	author("Adjatha");
	if(!pc.isBimbo()) output("Gathering yourself after the battle, you take stock of your supplies and condition. On the plus side, the presence of this guardian means that the UGC hasn’t had a chance to delve very deeply into Badger’s left-over projects. Perhaps there’s something you can still use.");
	else output("Well, that was fun! Hopefully Badger left more neat little friends to play with. Still, nothing to help your pet just yet.");

	output("\n\nYou dig around her back room, moving debris aside. Before long, you find a hastily concealed passage: sliding a piece of sheet metal from the back wall reveals a curling stairwell leading down. You hold your glowstick out, but the shaft goes too deep for your feeble light. ");
	if(!pc.isBimbo()) output("This must lead to some subterranean bunker. No sense in turning around now, you figure, as you lead the blue girl down the rusted steps.");
	else output("He heh heh. ‘Shaft.’ Boy, it feels like forever since you got to fuck something! Grapping your blue girl, you lead her down, deeper into the Badger’s lair.");

	output("\n\nAs you go, you’re given a view of the network of pipes and hydraulic machinery just beneath the floorboards of the unassuming office. ");
	if(!pc.isBimbo()) output(" They all seem to connect to a variety of trap doors and elaborate devices ready to assail an unwary visitor at the press of a button. You begin to appreciate how many secret contingencies the maniac had set up at any given moment. It seems most have already been activated, but you can’t be sure her defenses are completely exhausted. Nervously, you wonder how many people she managed to get her claws on before you turned her in, but decide it’s probably better that you don’t know.");
	else output(" You don’t really know what all these things are for, but the Doc definitely has a type. Probably a bunch of silly pranks to, like, give boys huge boobs or something. Oooh! Maybe some are still active? It would be, like, super awesome if you came down here for your blue girl’s brain problems and got bigger, squishier tits for her too!");

	output("\n\nYou and your pexiga reach the bottom of the stairs and find a darkened warehouse of dangerous looking machines. A set of grav-cuffs on flexsteel chains look like they’ve had too much use. A person-sized tube filled with what looks like pink champagne bubbles occasionally, lit from within and yet less bright than your plastic rod. There are even hefty tanks filled with silicone that seem to have tubes and injectors affixed to their tips for ease of inflation.");
	//Go to Doll Maker fight
	processTime(5);
	currentLocation = "BIMBOTORIUM LAB";
	generateMap();
	
	clearMenu();
	addButton(0,"Next",dollmakerSetup);
}

//After Fight
public function afterDollmakerFightForAbsentBadger():void
{
	clearOutput();
	showPexiga();
	author("Adjatha");
	output("Slowly, quietly, you and your pexiga make your way through Doctor Badger’s secret lab. Holding your glowstick to each project, you’re discouraged to find that most of them seem to have been scrapped at the last minute. Broken glass, spilt fluids, and burned out circuits seem to be the last testaments of Doctor Badger’s Bimbotorium.");
	if(!pc.isBimbo()) output(" Like a graveyard of perversion, you should feel good about seeing all her work scrapped, but the empty-headed girl plodding placidly next to you reminds you that even weapons can be put to good purposes.");
	else output(" Aw dang! So many fun toys, just totally ruined! You punch a wall in frustration, but there’s nobody around to whine to, so you force yourself to buck up.");
	output(" Surely there must be something left down here!");

	//Split into Bimbo, Smuggler, Mercenary, and Tech Specialist
	//Bimbo
	if(pc.isBimbo())
	{
		output("\n\nBoy, Doc Badger sure keeps this place a mess! It’s, like, super hard to find anything down here. You start getting a little flustered, apologizing to the pexiga with each broken device the two of you investigate. This is SO not fair!");
		output("\n\nIt’s such a bummer that Badger’s not here to fix this stuff. Maybe if you were, like, a smart nerd then you could do the hammer and screwdriver stuff to these things. He heh. ‘Screw’ driver. That’d be a good name for a porn! It could, like, be about driving from place to place, picking up random strangers and then banging in the vehicle. You could even get, like, a bunch of people in there so you could be driving while you’re screwing!");
		output("\n\nYou ask the pexiga what she thinks of your idea, but don’t even wait for her to not respond before you’re off on another tangent. How long has it been since you had an orgasm? It feels like forever! Before long, you’ve completely forgotten why you’re down here and are instead just playing with all the half-junked sex toys, trying to see if any of them could be used to soothe the growing heat in your [pc.groin].");
		pc.lust(5);
	}
	//Smuggler
	else if(pc.characterClass == GLOBAL.CLASS_SMUGGLER)
	{
		output("\n\nYou calm yourself with a deep breath and think back to your days as a smuggler. When the law was moving in on a shipment, it was standard to jettison and destroy any contraband that couldn’t be hidden. Better to lose a few credits than get picked up for somebody else’s stuff.");
		output("\n\nHowever, destroying everything means you’ll never make any profit, so it was more of a last resort. Sure, you’d have secret storage compartments for smaller items but big stuff - like black market automatons - could just be taken apart. It was fast and dirty, and wouldn’t fool someone who knew what they were looking for, but at a casual glance, it’d just look like so much scrap.");
		output("\n\nThere were still guards outside... Maybe Badger or her accomplices had intended to come back here after the heat blew over. If that’s the case, some of these devices may not be as broken as they appear. Just a matter of finding out what still works.");
	}
	//Mercenary
	else if(pc.characterClass == GLOBAL.CLASS_MERCENARY)
	{
		output("\n\nTo be honest, you don’t have a lot of experience dealing with this kind of technology. It’s always been above your pay grade. The last thing a mercenary needs is to get distracted when shots are flying.");
		output("\n\nOne thing you did pick up, however, was an insight into people. You don’t last very long as a merc if you can’t figure out how people tick and how they’re going to react to pressure. Badger’s a classic megalomaniac. There’s a lot more of them out there than people guess but at the end of the day, they’re all the same.");
		output("\n\nEgotistical people like the Doctor are so sure they’re the smartest person in the room, they just assume everyone else can’t appreciate their genius. More importantly, they place too much value on their works. Somebody as self-obsessed as her would never break all of her devices, no matter how likely they were to fall into the wrong hands. For her, it’d be like destroying a work of art.");
		output("\n\nSure, she may have smashed a lot of stuff, but when it comes down to the ones she’s most proud of, she almost certainly left it mostly intact. Something’s here, some last monument to the great and powerful Doctor Badger so that her legacy can live on. Just a matter of finding out what it is and how to use it.");
	}
	//Tech Specialist
	else
	{
		output("\n\nIn all your years of dealing with the latest, most innovative technology, you’ve never seen the kinds of things Doctor Badger specialized in. She was a genius, to be certain, but that special kind of demented that thinks at lateral angles to the rest of civilization. It’s not merely that she specialized in sexualizing tech - heck, TamaniCorp does much the same and they’re as big as you get! No, it’s more that the Doc engineered in pretzels rather than straight lines.");
		output("\n\nAttempting to put yourself in her headspace seems like a good way to get an aneurysm, so instead you take a figurative step back and look at the whole body of her works. No one has been able to duplicate Doctor Badger’s weapons both due to the secrecy of her operations and also the ‘black box’ approach she took to the inner workings of her inventions.");
		output("\n\nBlack box... hrm...");
		output("\n\nIf her design philosophy holds for her lab’s devices, it’s entirely possible that she over-engineered the internal protections. Maybe her last minute house cleaning wasn’t as thorough as she would’ve hoped. If that’s true, you just have to look for the device with un undamaged core module, make a few repairs on the external components, and you’ll be in business.");
	}
	processTime(5);
	//[Next]
	clearMenu();
	addButton(0,"Next",mergeAbsenteeBadgerScrap);
}

// Merge All
public function mergeAbsenteeBadgerScrap():void
{
	clearOutput();
	showPexiga();
	author("Adjatha");
	output("Amid all the rubble and debris, you manage to find an intact glass orb laden with electrical leads. It looks like, at one point, it might have been contained in some protective structure, but the orb itself seems undamaged. You give it a quick once-over and rap on the side. Almost immediately, it begins swirling with hypnotic shades of light, the damaged wires crackling and sparking with unchanneled potential.");
	if(pc.isBimbo()) output("\n\nWhat a pretty ball! You feel like you could just stare at it forever, but a spark from one of the outlets leaps to zap you, shaking you out of your trace. What a rude interruption! You’ll have to do something about that so you can watch in peace! Glancing at the pexiga, you notice that she seems to have focused entirely on the orb too. Oh goody! Maybe you found something she likes!");
	if(!pc.isBimbo()) output("\n\nYou can feel yourself sinking into the depths of the orb’s washing color cascade and manage to jerk your gaze away before you’re lost for good. You glance at the blue scaled pexiga at your side and are startled to see her normally vacant gaze seems wholly trained on the ball. Maybe this is what you were looking for. If you could get those leads working, you could train the device’s full mesmeric power on the mindless girl.");
	output("\n\nWith a little searching, you manage to scrounge up the caps that connect to the sphere’s loose wires and with some effort, manage to attach them all to the gently humming machine. Each tendril-like bundle of wires has been outfitted with a pinching clasp, presumably to be hooked onto the subject in question.");
	output("\n\nKnowing Doctor Badger, it’s not hard to guess where the clamps are intended to be attached. You put one on each of the pexiga’s nipples, one on the tips of each of her ears, another between her legs, and the last one on her hanging tongue. She shivers slightly with each lead and when the last goes on, her eyes widen. With the blue girl locked into the machine both visually and physically, you sit and watch Badger’s machine go to work.");
	output("\n\nThe empty azure of her eyes well with moisture as the biological straightjacket nature put on her is gradually swept aside by the bimbo reprogramming of the hypnotic sphere. ");
	if(pc.isBimbo()) output("It seems weird that Badger would make a ‘get smarter’ machine, but maybe she never expected something as dumb as the pexiga? It’s like dividing by zero or something. You dunno!");
	else output("The doctor may have intended this machine to diminish one’s intellect, but it seems like it’s working off of a baseline - just as anything above gets lowered, anything below gets raised!");
	output(" The unresponsive girl gradually begins shifting and panting, her breast welling with unfamiliar lusts.");
	output("\n\nAt first you’re not sure if you’re imagining it, but before long you’re positive: her scales are bleaching platinum white! The machine was probably intended to change hair color, but the pexiga’s head of segmented spines seems unaffected. From a dull blue to a glistening alabaster, the girl pales even as her curves plump and soften.");
	output("\n\nIt comes as little surprise when her chest starts inflating under the machine’s influence. The breast-like lumps under her plated bands expand and swell, each growing larger than her head! They added weight drags her down slightly, but nothing seems able to pull her attention away from the hypnotic ball.");
	//[Next]
	processTime(5);
	clearMenu();
	addButton(0,"Next",absenteePexigaPart2);
}

public function absenteePexigaPart2():void
{
	clearOutput();
	setPexigaBimbo();
	showPexiga();
	author("Adjatha");
	output("You can hear a steady plip plop of lube-like moisture dripping down from between the pexiga’s legs and her tongue positively shimmers with the ocean of drooling saliva running down its two foot long length. ");
	if(pc.isBimbo()) output("You’re growing impatient and have already gotten bored looking at the funny colors. Time to unhook your friend and see if she’s okay!");
	else output("At this rate, there’s no telling how horny she’s going to end up. You’d better get her out of that thing before things get too out of hand!");
	output(" You rap on the glowing glass exterior, trying to shut it off but nothing happens. You grab a nearby wrench and give it a sound blow but still the colors swirl holding your inflating pexiga in its grasp. You try to disconnect the electrical leads clamped to her body, but receive only a painful shock for the effort.");
	if(pc.isBimbo()) output("\n\nGrrr! This thing is being very annoying!");
	else output("\n\nSo much for keeping this thing for later. You’re going to need to take some serious steps to add an ‘off switch.’");
	output(" Hoisting up your wrench with both hands, you wind up and swing around with full force. The orb clongs, the wrench flies out of your hands, and the glass cracks into an intricate spider web of fractal fractures. The colors slow and gradually the machine fizzles out with a hissing sigh.");
	output("\n\nYour silvered girl blinks, shaking her head. She pants and sighs, noticing perhaps for the first time that she has a ring gag in her mouth and a massive steel stud in her tongue. She cocks her head, curiously, wiggling her muscular organ to acclimate to the feel of it. Running a two-fingered hand down the mane of hair-like spines on her head, she raises her big, blue eyes to you. From behind the gag, she smiles bashfully and gurgles something.");
	if(pc.isBimbo()) output("\n\nWell that’s no good! She can’t talk with that thing in her mouth. As least, you guess she can’t. <i>“Does her race communicates in gurgles?”</i> you wonder aloud. <i>“Did Badger put a language lesson in her bimbo ball? Shoot, I should’ve looked for the instruction manual.”</i>");
	else output("\n\nWell, the gag and the stud aren’t going to make communication easy, that’s for sure. You could take them out, but it’s probably safer to keep them in until you know she hasn’t regressed to her feral state.");
	output(" Maybe the good doctor has something to help with communication around here. You hold up a finger to indicate for the pexiga to wait, then start searching around the chaotic mess of a former lab. The ivory girl seems happy to wait as she begins playing with her hefty F-cups.");

	output("\n\nYou toss through the piles of junk and broken inventions before coming across what appears to be a pair of plum-sized golden balls connected by a stout shaft. It seems to be roughly the size of the pexiga’s piercing. You pick it up and feel a strange current dancing across your skin.");

	if(pc.isBimbo()) output("\n\n<i>“Oh! That feels funny. The kind of funny where, like, you lick a vibrator but with your whole body. Oooh. What if your whole body was a tongue. Do you think they’d invent flavored clothing? Maybe people would use seasonings instead of perfume. Ha hah, wouldn’t that be funny! Gosh, I seem to be talking a lot. Well, I kind of always talk a lot, but the weird thing is that I’m not using my mouth for any of this. Is that normal? It’s kinda like there’s an echo but in my head. I know people say I’m empty headed but this is the first time I’ve heard an echo. Oh, hey, maybe the pexiga has an idea. Hi pexiga! Oh, she looked over. So I guess she can hear me too? How weird, I’m pretty sure my mouth is closed!”</i>");
	else output("\n\n<i>“Feels like a low powered live wire. But why would Doctor Badger make something like this? Wait a second. I’m not talking... these are my thoughts but they’re being broadcast aloud.”</i> You set the gold balls down and the involuntary narration ceases. Badger must’ve made this to get her victims to tell her everything they know. Or maybe just to humiliate them. Either way, it might be the answer to your pexiga problem.");
	output("\n\nYou take the barbell over to the ashen scaled girl and offer it to her. Her eyes widen with delight and she nods vigorously, clapping her hands. She tries to remove the other piercing, but with only two fingers to a hand and her claws filed down to nubs, she can’t quite manage it. You gently take her tongue in hand and unscrew her steel stud, slipping it out before replacing it with the golden device. As the piercing slides into place, she shivers with delight, pawing at her chest with one hand while she slides the heel of the other palm back and forth between her legs. <i>“Oooo! That feels good,”</i> she moans, her thoughts translated into speech by the decoration. She nearly leaps out of her skin at the sound of her voice, head spinning this way and that to look for some origin. <i>“Who was that...?”</i> she asks in a voice surprisingly soft and mild for such a dangerous species.");
	if(pc.isBimbo()) output("\n\n<i>“You silly! The gold thingy in your tongue makes you speak without needing your mouth! Cool, huh? Badger comes up with the funnest toys.”</i>");
	else output("\n\nYou explain your theory on how the piercing works, but her vacant glance tells you she understands little and less about technology. You summarize it by saying that anything she thinks will be translated by the gold balls.");
	output(" The pexiga nods, touching the device in wide eyed wonder.");
	output("\n\n<i>“Wooooow,”</i> she marvels.");
	output("\n\nWell, no sense in keeping her here, amid all the broken glass and twisted metal. Plus, there’s no telling how long the U.G.C. agents will be distracted. Taking her by the hand, you lead the albino girl up and out of the ruins of Badger’s lair. Along the way, she asks a cascade of questions about you, where you are, who she is, and just about anything and everything.");
	if(pc.isBimbo()) output(" You happily answer every question, even the ones you don’t really know the answers to. It’s fun having somebody look up to you! Like you’re a sexy teacher or something. Oooh, how would you look in glasses?");
	else output(" You answer as patiently as you can, but it’s clear she’s going to need a primer on some of the basics. Between you and Yammi, she should be caught up in no time.");
	processTime(15);
	clearMenu();
	addButton(0,"Next",pexigaNamingSetup4AbsentBadgers);
}

public function pexigaNamingSetup4AbsentBadgers():void
{
	clearOutput();
	showPexiga();
	author("Adjatha");
	output("While you’re talking with her, a thought occurs to you.");
	if(pc.isBimbo()) output(" <i>“So I don’t think I know your name! Do you have a name?”</i> She shakes her head. <i>“Huh. What’re we gonna call ya?”</i>");
	else output(" You can’t very well go around calling her ‘pexiga’ all the time. The girl needs a name, especially now that she can think for herself. You ask her if she had one before, but she shakes her head. You ask if there’s something she’d like to be called.");
	output("\n\n<i>“A name? Ummm...”</i> She trails off, staring emptily into the air for a moment. Maybe you could help her out and suggest a name?");
	if(stage.contains(this.userInterface.textInput)) 
		this.removeInput();
	this.displayInput();
	output("\n\n\n");
	clearMenu();
	addButton(0, "Next", pexigaNamingConventions, pexigaNamingSetup4AbsentBadgers);
}

//Battles
//Nym-Foe, Reprogrammed V-Ko VI

public function nymfoeSetup():void
{
	clearOutput();
	showNymFoe();
	author("Adjatha");
	// First Time
	if(flags["NYM-FOE"] == undefined)
	{
		flags["NYM-FOE"] = 1;
		output("As you make your way to Doctor Badger’s back room, you can’t help but stare at the bizarre assortment of inventions crowding just about every flat surface. You’re so caught up in trying to take in the sheer variety that you almost walk right into a pair of bouncy orbs. Drawing back, you find yourself eye-to-tits with a JoyCo nursedroid.");
		output("\n\nThe pale-skinned, pink uniformed clinical android seems out of place, except for the spine-crushingly huge mega tits she’s supporting with groaning servos. The “V-Ko” designation on its upper right arm has been scratched off and - in Badger’s messy script - a new name has been scrawled in its place: Nym-Foe. The droid stares at you with wide, pink eyes and an innocent smile, her overfilled chest still jiggling from your impact. <i>“Medical services are currently mandatory,”</i> she explains, a segmented steel tail whipping back and forth behind her.");
		output("\n\n");
		if(drBadgerAtBimbotorium()) output("Whether out of forgetfulness or malice, Doctor Badger didn’t deactivate her guard droid.");
		else output("It looks like Doctor Badger has left behind a guard droid and you must have tripped something to activate it.");
		output(" There’s no telling what kind of devious modifications the slutty scientist made to the medical aide. You look back at your pexiga’s empty eyes. If you want to help her, you’re going to have to get through this perverted nursedroid.");
		processTime(2);
	}
	// Repeat
	else
	{
		output("The absurdly proportioned android is still standing guard over Doctor Badger’s back room. Your pexiga is patiently waiting right where you left her; a mute testament to your mission. If you want to help the blue girl, you’re going to have to go through that robot.");
	}
	//[Fight] [Leave]
	clearMenu();
	addButton(0,"Fight",fightTheNymfoe);
	addButton(14,"Back",leaveNymFoe);
}

//[Fight]
public function fightTheNymfoe():void
{
	clearOutput();
	showNymFoe();
	author("Adjatha");
	output("You pull out your weapons and get ready for a fight!");
	
	var nymfoe:NymFoe = new NymFoe();
	if(flags["NYM-FOE_LUST"] != undefined) nymfoe.lustRaw = flags["NYM-FOE_LUST"];
	
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(nymfoe);
	CombatManager.victoryScene(pcVictoryVsNymFoe);
	CombatManager.lossScene(flags["PEXIGA_TREATMENT"] == 0 ? loseToNymfoeLossRouter : loseToPostQuestNymfoe);
	CombatManager.displayLocation("NYM-FOE");
	
	clearMenu();
	addButton(0,"Next", CombatManager.beginCombat);
}

public function bouncyProc(ranged:Boolean = false):void
{
	//Enemy Status: Bouncy x5 ("Nym-Foe’s massive mammaries deflect kinetic damage!")
	//Combat Attacks
	//Bouncy Breasts
	//(passive as long as she has at least 1 stack of "Bouncy", 20% chance to activate per stack of "Bouncy" if player deals kinetic damage to Nym-Foe).
	if(enemy is NymFoe)
	{
		//Ranged:
		if(ranged) output("As your [pc.rangedWeapon] barks out its payload at the swollen nursedroid, she simply giggles in delight. The jiggling, pillowy mountains of her inflated chest absorbs the shock of the attack. She bounces in place, clapping her hands in delight. <i>“Again! Again!”</i> she cheers. <b>It has no effect!</b>");
		//Melee:
		else output("You close in, swinging your [pc.meleeWeapon], but Nym-Foe shifts to take the blow directly on her inflated tits. Like fluid-filled armor, they rob your attack of its force! Her body bounces and jiggles but is otherwise unharmed. She titters, her entire frame swaying with the rippling waves radiating through her breasts. <b>It has no effect!</b>");
	}
	else output("Bouncy procced on unknown foe.");
}

private function siliconeMaxHips(inShip:Boolean = false):Number
{
	var libido:Number = pc.libido();
	if(inShip)
	{
		if(libido > 20) return 20;
		else if(libido > 0) return 15;
		return 10;
	}
	if(libido > 80) return 40;
	else if(libido > 60) return 30;
	else if(libido > 40) return 25;
	else if(libido > 20) return 20;
	else if(libido > 0) return 15;
	return 10;
}
private function siliconeMaxButt(inShip:Boolean = false):Number
{
	var libido:Number = pc.libido();
	if(inShip)
	{
		if(libido > 20) return 20;
		else if(libido > 0) return 15;
		return 10;
	}
	if(libido > 80) return 40;
	else if(libido > 60) return 30;
	else if(libido > 40) return 25;
	else if(libido > 20) return 20;
	else if(libido > 0) return 15;
	return 10;
}
private function siliconeMaxBoob(inShip:Boolean = false):Number
{
	var libido:Number = pc.libido();
	if(inShip)
	{
		if(libido > 20) return 50;
		else if(libido > 0) return 35;
		return 20;
	}
	if(libido > 80) return 100;
	else if(libido > 60) return 80;
	else if(libido > 40) return 65;
	else if(libido > 20) return 50;
	else if(libido > 0) return 35;
	return 20;
}
private function siliconeMaxLips(inShip:Boolean = false):Number
{
	var libido:Number = pc.libido();
	if(inShip)
	{
		if(libido > 20) return 5;
		else if(libido > 0) return 4;
		return 3;
	}
	if(libido > 80) return 10;
	else if(libido > 60) return 8;
	else if(libido > 40) return 6;
	else if(libido > 20) return 5;
	else if(libido > 0) return 4;
	return 3;
}
/*Nym-Foe Injections
v1 - hips
v2 - ass
v3 - breasts
v4 - lips*/
public function nymFoeInjection(target:Creature = null, value:int = 0, amount:Number = 0, override:Boolean = false):void
{
	if(target == null) return;
	target.createStatusEffect("Nym-Foe Injections");
	if(value < 1 || value > 4) return;
	// For subtracting values, determine limit.
	if(amount < 0)
	{
		var subLimit:Number = 0;
		switch(value) {
			case 1: subLimit = (0 - target.statusEffectv1("Nym-Foe Injections")); break;
			case 2: subLimit = (0 - target.statusEffectv2("Nym-Foe Injections")); break;
			case 3: subLimit = (0 - target.statusEffectv3("Nym-Foe Injections")); break;
			case 4: subLimit = (0 - target.statusEffectv4("Nym-Foe Injections")); break;
		}
		if(amount < subLimit) amount = subLimit;
	}
	// Add amount to mod values.
	switch(value)
	{
		case 1:
			target.hipRatingMod += amount;
			break;
		case 2:
			target.buttRatingMod += amount;
			break;
		case 3:
			for(var i:int = 0; i < target.breastRows.length; i++)
			{
				target.breastRows[i].breastRatingMod += amount;
			}
			break;
		case 4:
			//Softcap dat shit at 5.
			if(!override && target.lipMod < 5 && amount > 0) 
			{
				if(target.lipMod + amount > 5) amount = 5 - target.lipMod;
			}
			target.lipMod += amount;
			break;
	}
	//Track how much was added to later suck out!
	target.addStatusValue("Nym-Foe Injections", value, amount);
}
public function autoFillNymFoeBoobjection(bRow:int = 0):void
{
	var tEventCall:Function = (function(c_bRow:int):Function
	{
		return function():void
		{
			var txt:String = "";
			var amount:Number = pc.statusEffectv3("Nym-Foe Injections");
			
			txt += "You feel a pulsing sensation at your " + (c_bRow < 5 ? "chest" : "midsection") + " all of a sudden. Your newly grown " + pc.breastDescript(c_bRow) + " seem to be " + (amount > 0 ? "swelling with semi-firm mass" : "shrinking") + "... The bio-silicone implants housed in your upper body must be adjusting to the new anatomy and occupying the space to even things out. When the feeling subsides, you experimentally poke and prod your " + (c_bRow < 5 ? "chest" : "midriff") + ", taking in your new size.";
			
			pc.breastRows[c_bRow].breastRatingMod += amount;
			
			txt += " <b>Your " + num2Ordinal(c_bRow + 1) + " row now has " + pc.breastCup(c_bRow) + " breasts!</b>";
			
			clearOutput();
			showBust("");
			showName("BIO-\nSILICONE");
			author("Jacques00");
			output(txt);
			clearMenu();
			addButton(0, "Next", mainGameMenu);
		}
	})(bRow);
	eventQueue.push(tEventCall);
}
public function nymFoeUninjection(target:Creature = null):void
{
	if(target == null) return;
	if(target.hasStatusEffect("Nym-Foe Injections"))
	{
		target.hipRatingMod -= target.statusEffectv1("Nym-Foe Injections");
		target.buttRatingMod -= target.statusEffectv2("Nym-Foe Injections");
		for(var i:int = 0; i < target.breastRows.length; i++)
		{
			target.breastRows[i].breastRatingMod -= target.statusEffectv3("Nym-Foe Injections");
		}
		target.lipMod -= target.statusEffectv4("Nym-Foe Injections");
	}
	target.removeStatusEffect("Nym-Foe Injections");
	// Perk regens silicone implants!
	if(target.hasPerk("Implant-tastic")) target.createStatusEffect("Nym-Foe Injections");
}
public function nymFoeMaxInjection(target:Creature = null, hips:Number = 0, butt:Number = 0, boob:Number = 0, lips:Number = 0):void
{
	if(target == null) return;
	target.createStatusEffect("Nym-Foe Injections");
	var silicone:StorageClass = target.getStatusEffect("Nym-Foe Injections");
	
	var maxHips:Number = Math.max((hips - silicone.value1), 0);
	var maxButt:Number = Math.max((butt - silicone.value2), 0);
	var maxBoob:Number = Math.max((boob - silicone.value3), 0);
	var maxLips:Number = Math.max((lips - silicone.value4), 0);
	
	nymFoeInjection(target, 1, maxHips, true);
	nymFoeInjection(target, 2, maxButt, true);
	nymFoeInjection(target, 3, maxBoob, true);
	nymFoeInjection(target, 4, maxLips, true);
}

//[Leave]
public function leaveNymFoe():void
{
	clearOutput();
	showNymFoe();
	author("Adjatha");
	output("Maybe you should prepare a little more. You leave your pexiga here and exit the building.");
	//[End]
	clearMenu();
	addButton(0,"Next",move,rooms[currentLocation].southExit);
}

/*
output("\n\nCommand Prompt");
output("\n\nYou’re fighting Nym-Foe.");


output("\n\nA reprogrammed and repurposed nursedroid blocks your path! As with all things Badger, she has been inflated to bimbo proportions and seems intent on doing the same to you. A long, sinuous steel tail flicks back and forth behind her while her exposed nipples leak with steady streams of thin, clear fluid, utterly unlike milk.");


output("\n\nShields: 0");
output("\n\nHP: Very High (mini-boss fight)");
output("\n\nLust: 0");
output("\n\nEnergy: 100");
output("\n\nLevel: 8");
output("\n\nRace: Automaton");
output("\n\nSex: Female");
*/


//Combat Results
//Player Loss:
public function loseToNymfoeLossRouter():void
{
	IncrementFlag("NYM-FOE_LOSSES");
	
	if(pc.lust() >= pc.lustMax()) gushBadEndWithNymFoe();
	else loseToNymFoeViaHP();
}

//via hp damage only.
public function loseToNymFoeViaHP(pexiga:Boolean = true):void
{
	clearOutput();
	showNymFoe();
	author("Adjatha");
	//normal
	if(!pc.isBimbo())
	{
		output("It’s too much. You stumble up against one of the walls of Badger’s lair, too weak to even call for help above a whimper. With a smooth, graceful motion, Nym-Foe slides up against you, cradling your waist with one arm to make sure you remain upright. <i>“There there,”</i> she soothes. Her steel tail coils around your limbs one after another, as if taking measurements. <i>“You appear to be damaged. Medical assistance will be deployed.”</i>");
		output("\n\nYour weak protests are silenced when she pulls your head level with one of her leaking nipples and forces your face up against it.Smothered against the warm softness of the nursedroid’s breast, you firmly keep your mouth shut, even as the clear fluid filling her inflated mammaries trickles down your chin. You try to turn aside, but her android strength keeps your head firmly in place, blinding you to her further ministrations.");
		output("\n\nYour body, however, can feel everything. Her tail moves with the flexibility of a hand and removes your [pc.gear], leaving your bare [pc.skinFurScalesNoun] to soak up the sedative heat radiating from the droid. She hugs you close just as the steel tip pierces your [pc.ass] with a needle-like poke.");
		output("\n\nYou gasp at the pinch and accidentally swallow a bit of the gushing girl’s lactate. A taste utterly unlike milk fills your mouth and tingles at the tip of your [pc.tongue]. Attempting to spit it out only allows more of the fluid into you and when an ominous shiver starts in your shoulders you know it’s too late. You can taste the strangely cold fluid all the way to the back of your throat, stuck there like a too-thick syrup. There’s a narcotic sweetness to it that flits across your tastebuds and burrows into your muscles. Even without intending it, you find your lips wrapping around the android’s synthetic nipple and coaxing more from it. You just need a second taste...");
		output("\n\nYour face grows numb and before that numbness spreads to your brain, you take stock of the rest of your body. The needle in your ass seems to be injecting you with something. The sensation of swollen growth leaves your body itching fiercely. You struggle and squirm, but can’t quite seem to calm your rebelling body.");
		output("\n\n<i>“Shh, shh,”</i> Nym-Foe comforts, stroking your head. <i>“You’re going to be all better.”</i> With your mouth full of the droid’s drugged milk and your body inflating from her injections, the best you can do is to let out a defiant moan as darkness overtakes you.");
		//Player’s ass, hips, thighs, lips, and breasts all increase by 3 steps. Libido increases by 15. If feminity is less than 50, it is set to 50. Player gains the lactating effects of 3 uses of a Gush Spraypen. Their hit points and energy are set to max.
		if(pc.femininity < 50) pc.femininity = 50;
		else pc.modFem(15);
		
		nymFoeInjection(pc,1,3);
		nymFoeInjection(pc,2,3);
		nymFoeInjection(pc,3,3);
		nymFoeInjection(pc,4,1);

		if(pc.milkMultiplier < 100) pc.milkMultiplier = 100;
		pc.milkStorageMultiplier++;

		processTime(5);
		clearMenu();
		addButton(0,"Next",loseToNymFoeViaHPStep2,pexiga);
	}
	else
	{
		//Bimbo
		output("It’s no good! You just can’t keep up with the pretty robot any more. You stumble over to her and collapse against her comforting curves. <i>“Oh, there there,”</i> she soothes, stroking a hand across your [pc.hair]. <i>“Just a little checkup and you’ll be right as rain,”</i> the nursedroid adds, her eyes glowing with pink light.");
		output("\n\n<i>“First, how about we get all that stuff off of you?”</i> Nym-Foe quickly and efficiently strips off your [pc.gear] and gives you an encouraging smile. <i>“Much better! Now, be a brave " + pc.mf("boy","girl") + ", because you’re going to feel a pinch.”</i> Her tail whips around and pokes you right in the [pc.ass]! You yipe and clutch at her again. <i>“Now that wasn’t so bad, was it?”</i> she asks with a motherly tone.");
		output("\n\n<i>“We’re just going to put a little bit of silicone into you,”</i> she explains with a smile. As you’re about to voice a protest, she places a gloved finger over your [pc.lips] and shakes her head. <i>“Now, now. The doctor knows best. Plus, if you’re good, you’ll get a lollipop!”</i>");
		output("\n\nAny further complains vanish as the nurse’s tail bloats with the silicone being pumped into you. It’s not nearly as painful as you’d expected. In fact, it actually feels pretty good! You giggle and crane your head around to watch as your [pc.ass] inflates under the pumping pressure of the robot’s care. Your cheeks swell and bubble so thick that you can feel the jiggle even while standing still!");
		if(pc.hasVagina())
		{
			output(" The sheer pleasure of being plumped up is leaving you a bit antsy. Moisture starts dripping down from your [pc.vaginas].");
			pc.lust(10);
		}
		if(pc.hasCock())
		{
			output(" It’s so exciting, being the center of all this attention. Your [pc.cocks] stiffen");
			if(pc.cockTotal() == 1) output("s");
			output(", with anticipation.");
			pc.lust(10);
		}
		//player’s ass increases 3 steps
		//[Next]
		nymFoeInjection(pc,2,3);

		processTime(10);
		clearMenu();
		addButton(0,"Next",loseToNymFoeViaHPBimboStep2,pexiga);
	}
}

public function loseToNymFoeViaHPStep2(pexiga:Boolean = true):void
{
	currentLocation = "304";
	generateMap();
	
	clearOutput();
	if(pexiga) showPexiga();
	else showBust("");
	author("Adjatha");
	
	output("When you wake, you find yourself " + (pexiga ? "in Doctor Badger’s back room, just where you started. Your pexiga is sitting right where you left her, staring absently at a wall" : "just outside Doctor Badger’s lab, completely out of the complex") + ". There is no sign of Nym-Foe, however. Perhaps she left to go make ‘improvements’ on other unwilling patients.");
	output("\n\nYou groan, your whole body aching with an inner heat that won’t seem to go away. You take a moment to take stock of your freshly inflated proportions. The first and most obvious change seems to be your ballooned chest. [pc.Breasts] hang from you with gravity-defying weight, your [pc.nipples] dribbling with quite a bit of fresh [pc.milkNoun].");
	output("\n\nBut, of course, that’s not the end to your troubles. Your hips seem to have gotten thicker, as has your ass. With [pc.hips] and " + indefiniteArticle(pc.buttDescript()) + " like these, you’re liable to be mistaken for a holo-vid smut star. Touching your face, you can feel the feminine softness continues here as well. Your [pc.lips] are so sensitive that even just touching them brings you to the verge of climax.");
	output("\n\nPanting and trying to calm yourself down, you steel your resolve. Things may not have gone well here, but you’re not about to give up. After all, " + (pexiga ? "how many more traps could Doctor Badger have?" : "you’ll need to be able to defeat Nym-Foe with ease if you are to face some of the most lust inducing foes out there.") + " You struggle back into your [pc.gear] before noticing that the nurse left a lollipop for you.");
	
	processTime(100+rand(10));
	//[player gains 1x ClearYu]
	//[Return to BimboQuest]
	CombatManager.genericLoss();
	eventQueue.push(lolliget);
}

public function loseToNymFoeViaHPBimboStep2(pexiga:Boolean = true):void
{
	clearOutput();
	showNymFoe();
	author("Adjatha");
	output("Just as your bubble-like cheeks seem to reach their limit, the expanding goo spreads down into your [pc.hips], giving them a taste, too. <i>“This silicone is very special,”</i> the nurse adds with delight. <i>“It goes where instructed, without the need for multiple insertions. And, unlike most implants, these will feel just like your real body. Won’t that be fun?”</i> You nod excitedly as your flanks widen.");
	//player’s hips and thighs increase 3 steps
	nymFoeInjection(pc,1,3);
	nymFoeInjection(pc,2,3);

	processTime(3);
	clearMenu();
	addButton(0,"Next",loseToNymFoeViaHPBimboStep3,pexiga);
}
public function loseToNymFoeViaHPBimboStep3(pexiga:Boolean = true):void
{
	clearOutput();
	showNymFoe();
	author("Adjatha");
	output("By the time it’s done with this bit, you’re already shaking your [pc.ass] and [pc.hips] in delight. ");
	if(pc.hasVagina())
	{
		output("Your loins ache with a powerful need, but you don’t want to interrupt the nurse lady before she’s done, so you bite down on the side of your lip and try to keep your hands balled into fists. ");
		pc.lust(10);
	}
	if(pc.hasCock())
	{
		output("Your [pc.cocks] feel");
		if(pc.cockTotal() == 1) output("s");
		output(" as though ");
		if(pc.cockTotal() == 1) output("it");
		else output("they");
		output(" are right on the verge of release, stiffness radiating through your body with sweet need. You haven’t so much as touched ");
		if(pc.cockTotal() == 1) output("it");
		else output("them");
		output(" yet, but pre-cum is already dribbling down from your swollen tip");
		if(pc.cockTotal() > 1) output("s");
		output(". ");
		pc.lust(10);
	}
	output("The steel tail keeps pumping, but now the silicone makes ticklish paths through your body to settle in your [pc.chest]. You moan and wiggle as the semi-solid goo inflates your mounds, boosting your boobies faster than you thought possible!");
	//player’s breasts increase by 3 cup sizes
	nymFoeInjection(pc,3,3);
	processTime(3);
	clearMenu();
	addButton(0,"Next",loseToNymFoeViaHPBimboStep4,pexiga);
}

public function loseToNymFoeViaHPBimboStep4(pexiga:Boolean = true):void
{
	clearOutput();
	showNymFoe();
	author("Adjatha");
	output("In no time at all, your chest now sports [pc.breasts], wobbling with their overstuffed expansion but just as sensitive as before. You tremble with the bliss of your added weight, and can’t help but to rub your [pc.nipples] a little bit. <i>“And, for the cherry on top...”</i> Nym-Foe adds, tweaking your nose playfully. The silicone rushes across your face, settling in your [pc.lips] and bloating your pucker to swollen, dick-sucking perfection. You giggle with glee and lean forward to kiss the nurse droid for all her thoughtful gifts.");
	//player’s lips increase 3 steps, Libido increases by 15
	pc.modFem(20);
	nymFoeInjection(pc,4,1);
	processTime(4);
	clearMenu();
	addButton(0,"Next",loseToNymFoeViaHPBimboStep5,pexiga);
}

public function loseToNymFoeViaHPBimboStep5(pexiga:Boolean = true):void
{
	clearOutput();
	showNymFoe();
	author("Adjatha");
	output("As your lips touch hers, however, the building tension inside your body surges and crests your resistance. Your orgasm hits with tidal force, focused almost entirely in your [pc.lips]. The suddering release whips through you with awesome speed, leaving you little more than boneless jelly in the droid’s arms.");
	if(pc.hasVagina())
	{
		output(" Your [pc.vaginas] clench");
		if(pc.totalVaginas() == 1) output("es and trembles");
		else output(" and tremble");
		output(" with bimbo-bloated bliss, [pc.girlCumNoun] gushing from your body in hot waves.");
	}
	if(pc.hasCock())
	{
		output(" Your loins release the full burden of their swollen bounty. [pc.CumNoun] spurts in [pc.cumColor] arcs that splatter around the messy back room and across the nurse’s pink and white uniform.");
		//for dicks with massive cum quantities: 
		if(pc.cumQ() >= 1000) 
		{
			output(" Your [pc.cocks] fountain");
			if(pc.cockTotal() == 1) output("s");
			output(" with [pc.cumVisc] cream, spraying thick ropes of spunk wildly. Stray blasts leave the robot girl dripping with a gooey coating and more than a little splashback on yourself as well!");
		}
	}
	output("\n\nYour body still teetering from the orgasm and your new proportions, Nym-Foe gently eases you down. She plucks a lollipop from between her breasts and hands it off to you with a smile. Without bothering to clean herself up, she leans over you, placing a breast before your mouth. You greedily take the offered nipple in your [pc.lips] and suckle away, drinking down her drug-sweet not-milk.");
	//if not already, the player begins lactating. Treat it as if they had 3 uses of Gush. If the player’s femininity was below 50, set it to 50. Player hp & energy set to max, lust set to 0
	if(!pc.canLactate()) output(" <b>You’re pretty sure it’s making you lactate.</b>");
	else output(" <b>You’re pretty sure it’s bolstering off your ability to lactate.</b>");
	if(pc.milkMultiplier < 100) pc.milkMultiplier = 100;
	pc.milkStorageMultiplier++;
	processTime(10);

	clearMenu();
	addButton(0,"Next",loseToNymFoeViaHPBimboStep6,pexiga);
}

public function loseToNymFoeViaHPBimboStep6(pexiga:Boolean = true):void
{
	clearOutput();
	if(pexiga)
	{
		showPexiga();
		author("Adjatha");
		output("You don’t even remember falling asleep, but when you awaken, there’s no sign of the nursedroid. You’re almost afraid it was a dream, but a quick check proves that you’re still the proud owner of all those sexy curves. You could really go for a quick fuck or three! Sadly, the only person around is your pexiga, still patiently waiting. Guess you’ll have to hurry up and help her out so you can put this new body to the test! You struggle back into your [pc.gear].\n\n");
		processTime(100+rand(10));
		//[player gains 1x ClearYu]
		//[Return to BimboQuest]
		eventQueue.push(lolliget);
	}
	else
	{
		currentLocation = "304";
		generateMap();
		
		showBust("");
		author("Natetheman223");
		
		output("Having passed out at some point, you awaken just outside of Badger’s lab. It almost feels like a dream, but groping your flesh confirms you all the fresh silicone is still inside you, for now at least. You smile as you smack your [pc.lips] together, feeling their fullness.");
		output("\n\nIt isn’t long before you reach into your [pc.gear] to feel the [pc.skin] of your stretched out [pc.chest] and [pc.ass], and even your [pc.hips]! You notice your balloons are even dripping with [pc.milk]. You’re almost sad that Badger pulled you out of there, especially when you could’ve gotten even bigger!");
		output("\n\nOoh, maybe you should go back in and ask Nym-Foe for some more plastic?");
		output("\n\n");
	}
	CombatManager.genericLoss();
}

public function lolliget():void
{
	clearOutput();
	quickLoot(new ClearYu());
}

//Player Victory:
public function pcVictoryVsNymFoe():void
{
	clearOutput();
	showNymFoe();
	author("Adjatha");
	output("The rogue droid sinks to her knees, the illuminated screens serving as eyes flickering. <i>“Error... error... please insert hard dic- dic- disc and reboot.”</i> Her eyes turn a bright blue and her breasts begin to slowly re-inflate to their maximum capacity. Arms limp, a bundle of lollipops falls from her slack grip, scattering on the floor. You gather them up and consider what to do next.");
	output("\n\nIt seems that the nursedroid is repairing herself but it looks like it’ll take a while. You could use the down time to blow off a little steam with the cartoonishly proportioned android.");
	if(flags["PEXIGA_TREATMENT"] == 0) output(" No telling what awaits you further on, afterall.");
	if(pc.hasStatusEffect("Nym-Foe Injections")) output(" You could probably get her to suck out the silicone she injected into you, too.");
	if(flags["NYM-FOE_DISASSEMBLED"] == undefined) output(" Alternately, you could harvest the defenseless droid for all she’s worth, <b>but that would wreck her beyond repair</b>.");
	if(flags["PEXIGA_TREATMENT"] == 0) output(" Your pexiga is patiently waiting, as always.");
	output("\n\n");
	
	if(flags["NYM-FOE"] == undefined || flags["NYM-FOE"] < 2) flags["NYM-FOE"] = 2;
	
	pcVictoryVsNymFoeMenu();
}
public function pcVictoryVsNymFoeMenu():void
{
	clearMenu();
	
	//[Fuck] [Suck Out] [Harvest] [Leave]
	
	if(pc.lust() >= 33 && pc.hasGenitals()) {
		if(flags["NYM-FOE_DISASSEMBLED"] != undefined) addDisabledButton(0,"Fuck","Fuck","You can’t sex the nurse when she’s a pile of parts.");
		else if(pc.hasGenitals()) addButton(0,"Fuck",fuckTheNymFoe,undefined,"Fuck","Take advantage of the sex-bot to sate the lusts she has inspired.");
		else addDisabledButton(0,"Fuck","Fuck","You need genitalia to do this.");
	}
	else addDisabledButton(0,"Fuck","Fuck","You’re not up for sex right now.");
	
	if(flags["NYM-FOE_DISASSEMBLED"] != undefined) addDisabledButton(1,"Suck Out","Suck Out","You can’t use the nurse when she’s a pile of parts.");
	else if(pc.hasStatusEffect("Nym-Foe Injections")) addButton(1,"Suck Out",suckOutDatInjectionGoop,undefined,"Get the excess silicone sucked back out of your body.");
	else addDisabledButton(1,"Suck Out","Suck Out","There’s no silicone inside you for her to suck out.");
	
	addButton(2,"Salvage",salvageNymFoe,undefined,"Salvage","Now would be a good time to salvage some parts from the screwy sex-bot.");
	
	addButton(14,"Leave",(flags["PEXIGA_TREATMENT"] == 0 ? leaveTheNymFoe : pcVictoryVsPostQuestNymFoe));
}

//[Fuck]
public function fuckTheNymFoe():void
{
	clearOutput();
	showNymFoe();
	author("Adjatha");
	//Player does not have a dick
	if(!pc.hasCock())
	{
		output("The fine, cute features of her angular face leave a huffing heat tickling within your breast. The helpless girl lays on her back, the heavy, swaying bulk of her massive chest practically pinning her down for you. Despite the glowing blue screens of her eyes, she seems to be watching you with baited breath, a slight flush creeping up her pale, synthetic cheeks. This doll’s given you a bit of trouble, so it seems only right that she pay you back for the tussle. With a sly smile, you strip out of your gear and move towards her with wolfish grace.");
		if(pc.isTaur()) 
		{
			output("\n\nTrotting carefully around her, you pause at the droid’s shoulders to look down at her. With light touches, you bring the tip of your [pc.foot] to her small chin and slowly pull her gaze up toward the underside of your lower torso. Her eyes half-lidded, you catch a swallow of excitement through the normally placid guise of her matronly attitude. The girl’s as excited as you are! Your breathing becomes longer and slower as your inner folds glisten with the sweetening temptation of the needy nurse. ");
			if(pc.isNice()) output("Daintily,");
			else if(pc.isMischievous()) output("Playfully,");
			else output("Bluntly,");
			output(" you move to straddle her upper body and lower yourself down on top of her, your tauric weight of little consequence to the sturdy android. Wiggling forward, you bring your [pc.vaginas] inches from her delicate lips.");
		}
		else if(pc.legCount == 1)
		{
			output("\n\nSlithering carefully around her, you pause at the droid’s shoulders to look down at her. With light touches, you bring the tip of your [pc.foot] to her small chin and slowly pull her gaze up toward the center of your [pc.thighs]. Her eyes half-lidded, you catch a swallow of excitement through the normally placid guise of her matronly attitude. The girl’s as excited as you are! Your breathing becomes longer and slower as your inner folds glisten with the sweetening temptation of the needy nurse. ");
			if(pc.isNice()) output("Daintily,");
			else if(pc.isMischievous()) output("Playfully,");
			else output("Bluntly,");
			output(" you move to coil around her shoulders and collar, lowering yourself down on top of her until your [pc.vaginas] are mere inches from her delicate lips.");
		}
		else
		{
			output("\n\nStepping carefully around her, you pause at the droid’s shoulders to look down at her. With light touches, you bring the tip of your [pc.foot] to her small chin and slowly pull her gaze up toward the junction of your [pc.legs]. Her eyes half-lidded, you catch a swallow of excitement through the normally placid guise of her matronly attitude. The girl’s as excited as you are! Your breathing becomes longer and slower as your inner folds glisten with the sweetening temptation of the needy nurse. ");
			if(pc.isNice()) output("Daintily,");
			else if(pc.isMischievous()) output("Playfully,");
			else output("Bluntly,");
			output(" you move to straddle her collar and lower yourself down on top of her, your [pc.vaginas] inches from her delicate lips.");
		}
		output("\n\nShe needs no further encouragement, and the robotic girl pushes forward to rest the tip of her slight nose against the outer folds of your labia. Panting with heated gasps, she drinks in the bouquet of your feminine scent, stroking your lower lips with the velvety softness of her artificial skin. A tightness rolls across your core and you find yourself nibbling on your bottom lip. Rocking a bit, you stroke the firmness of [pc.oneClit] over the droid’s elegant contours. She raises a gloved hand to the [pc.skinFurScales] of your abdomen, the soft fabric caressing your tender underside with loving strokes. With whisper-like tenderness, she purses her lips and places an endless array of delicate kisses all around your trembling mound before finally reaching your lustful bead.");
		output("\n\nYour sigh of relief is short-lived, however, as she moves from the faintest of tickling touches to a voracious engine of raw clit-loving. Her lips suck and slurp at your [pc.clit] while her tongue circles with such moist speed that you can feel the breath being drawn from your chest. Your body trembles as the throbbing need in your loins is stoked to a fiery passion in record time. Your jaw drops and your [pc.chest] heave");
		if(!pc.hasBreasts()) output("s");
		output(", one hand weakly touching your panting throat");
		if(!pc.isTaur()) output(" while the other lowers to pull her head even tighter against your overwrought mons");
		output(". A tautness pulls at your body and it’s all you can do to push it back, shuddering with the effort.");
		processTime(5);
		pc.lust(20);
		clearMenu();
		addButton(0,"Next",fuckNymFoe2);
	}
	//Player is a centaur with a dick
	else if(pc.hasCock() && pc.isTaur())
	{
		output("Blowing off a little steam seems like a good idea. First, though, you’re going to have to get this droid properly equipped for someone with your [pc.legs]. You consider for a moment the best way to get her to the proper altitude when a thought strikes you.");
		output("\n\nSettling down beside her, you roll the girl onto her back and grip the nurse’s injector tail gingerly, guiding the silicone dispenser to one of her huge breasts. The needle-like tip slips past her synth-skin easily, eliciting a soft moan from the repairing droid. Stroking your fingers up and down the steel tendril, you watch with delight as, bit by bit, the girl’s tit grows larger and larger. She gasps and squirms, but either can’t or won’t stop your milking motions. You switch the tail to her other breast and begin filling that one as well.");
		output("\n\nBefore long, the nursedroid is absolutely immobilized by her huge, wobbling tits. If you had to guess, you’d say she’s probably up to a Z-cup by now, her mammaries so large that they conceal nearly her entire torso and most of her face. The glowing blue error screens of her eyes seem more lost than before, if that’s even possible. She’s given up squirming and instead just pants while her gloved hands range up and down the pliant surface of her moon-sized melons.");
		output("\n\nThat will do nicely, you decide");
		if(!pc.isCrotchExposed()) output(", stripping off your [pc.crotchCovers]");
		output(". The artificial girl’s amplified chest sways as you run your finger tips along its bulk. Even with synthetic skin and enough silicone to fill a hot tub, Nym-Foe feels just like the real thing. She has a warm, yielding give to her mammoth tits that’s almost fluid. There’s just enough resistance to keep them firm, but their sheer weight deforms them into vast, pillowy hills. Your [pc.cocks] stiffen");
		if(pc.cockTotal() == 1) output("s");
		output(" as you grope the boob-buried droid, in no small part due to the innocent moans your every touch brings to her lips. Badger may have reprogrammed her to inflate intruders to absurd proportions, but she did nothing to prepare the nurse bot to handle a bit of her own medicine.");
		//[Next]
		processTime(5);
		pc.lust(20);
		clearMenu();
		addButton(0,"Next",fuckNymFoe2);
	}
	//Player has a dick
	else
	{
		output("Blowing off a little steam seems like a good idea. First, though, you’re going to have to consider for a moment the best way to take her her. A cursory check under the hood reveals that her standard-issue vaginal equipment has been removed. Doctor Badger probably took the synthetic pussy out and forgot to replace it. You ");
		if(!pc.isBimbo()) output("sigh");
		else output("pout");
		output(". Well, there’s more than one way to use a sex bot.");

		output("\n\nSettling down beside her, you roll the girl onto her back and grip the nurse’s injector tail gingerly, guiding the silicone dispenser to one of her huge breasts. The needle-like tip slips past her synth-skin easily, eliciting a soft moan from the repairing droid. Stroking your fingers up and down the steel tendril, you watch with delight as, bit by bit, the girl’s tit grows larger and larger. She gasps and squirms, but either can’t or won’t stop your milking motions. You switch the tail to her other breast and begin filling that one as well.");
		output("\n\nBefore long, the nursedroid is absolutely immobilized by her huge, wobbling tits. If you had to guess, you’d say she’s probably up to a Z-cup by now, her mammaries so large that they conceal nearly her entire torso and most of her face. The glowing blue error screens of her eyes seem more lost than before, if that’s even possible. She’s given up squirming and instead just pants while her gloved hands range up and down the pliant surface of her moon-sized melons.");
		output("\n\nThat will do nicely, you decide");
		if(!pc.isCrotchExposed()) output(", stripping off your [pc.crotchCovers]");
		output(". The artificial girl’s amplified chest sways as you run your finger tips along its bulk. Even with synthetic skin and enough silicone to fill a hot tub, Nym-Foe feels just like the real thing. She has a warm, yielding give to her mammoth tits that’s almost fluid. There’s just enough resistance to keep them firm, but their sheer weight deforms them into vast, pillowy hills. Your [pc.cocks] stiffen");
		if(pc.cockTotal() == 1) output("s");
		output(" as you grope the boob-buried droid, in no small part due to the innocent moans your every touch brings to her lips. Badger may have reprogrammed her to inflate intruders to absurd proportions, but she did nothing to prepare the nurse bot to handle a bit of her own medicine.");
		processTime(5);
		pc.lust(20);
		clearMenu();
		addButton(0,"Next",fuckNymFoe2);
	}
}

public function fuckNymFoe2():void
{
	clearOutput();
	showNymFoe();
	author("Adjatha");
	//No dickerdoodlez
	if(!pc.hasCock())
	{
		output("Just as it seems the robotic girl will suckle the orgasm from you, she pulls back from your throbbing [pc.clitNoun], placing a final kiss on it. You haven’t even realized you were holding your breath until your chest falls with a gasping release. Blinking, you try to regain your thoughts but in the next heartbeat, Nym-Foe has begun the second prong of her assault. Tilting her head just a bit, she moves to press her impossibly beautiful lips to the swell of your womanhood and allows just the tip of her tongue to part those [pc.skinColor] folds with reverent worship. A moan travels up your spine like a lover’s fingertips and by the time it reaches your [pc.lips], you find yourself rocking against the girl’s face to coax her on.");
		if(pc.legCount > 1) output(" Your [pc.thighs] tighten around her head, muscles squeezing against the droid’s synthetic skin like you’re trying to urge a horse to switch from its idle trotting to a full gallop.");
		else if(pc.isNaga()) output(" Your coils tighten in rippling rings of impatient bliss, as if to squeeze more of her extraordinarily skilled tongue into your lust-dripping depths.");
		else if(pc.isGoo()) output(" Your gelatinous form tightens in rippling rings of impatient bliss, as if to squeeze more of her extraordinarily skilled tongue into your lust-dripping depths.");

		output("\n\nHer tongue slips deeper into your silken passage, its tip pressing against the petals of your inner sex with an expert precision that leaves your head rolling between your shoulders. With mechanical efficiency, she laps and slurps, teasing and stroking your lube-slick cradle with ravenous ardor. It’s as if she’s working off of some kind of XXX-ray that has revealed all your most sensitive spots to her caressing organ. Her upper lips flicks against your clit even while her hands fondle the swell of your trembling vulva.");
		output("\n\nAnd yet, even as your orgasm rises to nearly unbearable closeness, she pulls back once more. You nearly scream with your wanton urgency, so close to paradise and yet so far. You ");
		if(pc.legCount < 4) output("lower your gaze");
		else output("crane your head back");
		output(" only to see Nym-Foe’s mellow expression looking back with inscrutable satisfaction. The silvery steel of her tail snakes upward and gently strokes the juicy bounty of your gushing cunny before slithering above and curling to squeeze the curve of your [pc.ass]. She meets your gaze and quirks an eyebrow up at you. Frankly, at this point, you’d be just about willing to sell your whole inheritance to the ");
		if(pc.isNice()) output("exquisite");
		else if(pc.isMischievous()) output("crafty");
		else output("damned");
		output(" droid, if it meant getting off!");

		output("\n\nYou nod with more desperation than you’d intended and brace yourself for the worst. As her nectar-oiled tail slides into your posterior, however, you find none of the discomfort you’d expected. It’s as if your [pc.asshole] has been numbed just enough to make the serpentine device feel perfectly natural inside your rosette. As she pushes it deeper, the segmented joints rub up against your nethers with a ");
		if(pc.hasToes()) output("toe-curling");
		else if(pc.isNaga()) output("tail-curling");
		else if(pc.hasLegFlag(GLOBAL.FLAG_HOOVES)) output("hoof-stomping");
		else output("foot-clenching");
		output(" pleasure. Panting like a bitch in heat, you clench your eyes shut and bite down on your lower lip as the droid works your posterior like a skin-tight pocket pussy.");

		output("\n\nWhen she pushes her tongue back into your lust-slick cunt and suckles her lips against your well-edged joy buzzer, you’re putty in her hands. Your first orgasm is so intense, your body actually aches with how tightly your muscles clench. If it were anybody else, you’d be afraid of hurting them as your ");
		if(pc.legCount > 1) output("[pc.thighs] squeeze around her head");
		else if(pc.isNaga()) output("[pc.skinFurScales] coils practically throttle her upper torso");
		output(". The droid, however, takes your shuddering embrace for the encouragement your body means it to be, and redoubles her efforts. Her tail ripples and thrusts within your [pc.ass], each segment twisting and turning inside of you to press your too-thin walls against the licking onslaught of her artificial tongue.");
		output("\n\nYour head thrashes as the second orgasm takes you, ");
		if(!pc.isBald()) output("your [pc.hair] whipping back and forth with the frenzied exhertations of your gushing climax.");
		else output("the frenzied exhertatins of your gushing climax leaving clasping desperately at the unrelenting bot.");
		output(" Femme cum spills from your [pc.vaginas] in such quantities you’re almost afraid you’re going to short circuit Nym-Foe before she’s finished. Thankfully, the slick lubrication of your moaning ecstasy only leaves her glistening with your liquid lust.");
		//[Next]
	}
	//Centaur
	else if(pc.isTaur())
	{
		output("With the girl’s titantic tits still swaying from your caresses, you rise and straddle her prostrate form. Your [pc.feet] hug her sizable hips and pale legs as you line your [pc.cockBiggest] up for the wobbling valley between her over-inflated udders. With a few trotting steps, you advance, squeezing her bosom together between your [pc.legs] as your [pc.cocks] slip");
		if(pc.cockTotal() == 1) output("s");
		output(" into the squishy embrace of her cleavage. You sigh at the sweet, suckling cradle of her silicone-swollen bust, your delight mirrored by the droid’s own receptive coo.");
		output("\n\nThe soft fabric of her gloved hands stroke up and down the [pc.thighs] of your front legs, coaxing you to hilt yourself in her uncanny valley. Wrapping your forefingers and thumbs around her pressurized teats, you use the bloated automaton’s nipples as handholds to steady yourself. With a bucking thrust, the stiff length");
		if(pc.cockTotal() > 1) output("s");
		output(" of your [pc.cocks] plunge");
		if(pc.cockTotal() == 1) output("s");
		output(" deeper.");
		if(pc.balls > 1) output(" Before long, your [pc.balls] begin slapping against her supple skin with pendulous weight.");

		output("\n\nYour grip around her nipples tightens as you grunt with burgeoning need. Blossoming heat washes across your loins even as you squeeze her peaks harder, thin, clear fluid leaking from her chest and into her cleavage. Another clutching caress sends the fluid contents of the nurse droid’s breasts spraying forth in jubilant release, the matronly automaton crying out in a decidedly undignified manner. She gasps and moans with whorish ecstasy as you milk her mountainous peaks like two bovine geysers. The cream gushes all across her breasts and floods the deep crevasse of her cock-stuffed, silicone orbs.");
		output("\n\nWith her heaving mounds freshly lubricated, you set to fucking the stuffing out of the perverted nurse. You rock back and forth with unrestrained fervor, your [pc.cockBiggest] throbbing as the droid’s mammary vale suckles with squelching joy at the swollen shaft.");
		if(pc.balls > 1) output(" Your [pc.balls] clap against her synth-skin with moist thwacks that just get louder the tighter your pouch gets.");
		output(" Your [pc.feet] paw at the ground to push ever further while your [pc.thighs] squeeze the straddled melons tighter and tighter.");

		output("\n\nThe droid cries out in rapture, only to be cut off as her smothering bosom is pushed up over her face, one building-shaking thrust at a time. She grabs hold of your [pc.hips] as your pace grows frantic with the nearness of your climax. With a long, drawn out gasp, you surrender to the pleasure and let your orgasm wash over you. Body quivering, your [pc.cocks] release");
		if(pc.cockTotal() == 1) output("s");
		output(", thick jets of [pc.cumNoun] painting the droid’s pale skin [pc.cumColor].");
		if(pc.balls > 1) output(" The tightness in your [pc.balls] finally loosens as hot spunk gushes through your body and into the droid’s inflated melons.");
		if(pc.cumQ() >= 700) output(" The bliss of your peak surges through your engorged meat, flooding the nurse’s valley and dribbling fat blobs of excess from every the wobbling seam of her cinched bosom.");

		output("\n\nYou buck a few more times, letting Nym-Foe’s Z-cup mammaries milk you of every last drop before finally backing off of her. No longer tightly compressed by your legs, the automaton’s chest settles back into its hemispherical bulk, though freshly glistening with your [pc.cumVisc] jizz. It seems more than a little of your seed made its way to the robot’s face, her delicate features dripping with a sticky mask of lust. She lets out a deep sigh of contentment and settles back to reboot, happy to have been able to assist you in all your medical needs.");
		//[go to “Merge”]
	}
	else
	{
		output("With the girl’s titantic tits still swaying from your caresses, you straddle her prostrate form. ");
		if(pc.legCount > 1) output("Your [pc.feet] hug her sizable hips and pale legs");
		else output("You crawl on top of her sizable hips and pale legs, pinning her down with your body");
		output(" as you line up your [pc.cockBiggest] for the wobbling valley between her over-inflated udders. With a steamy exhale, you squeeze her bosom together between your arms as your [pc.cocks] slip");
		if(pc.cockTotal() == 1) output("s");
		output(" into the squishy embrace of her cleavage. A shuddering sigh escapes your lips at the sweet, suckling cradle of her silicone-swollen bust, your delight mirrored by the droid’s own receptive coo.");
		output("\n\nThe soft fabric of her gloved hands stroke up and down your forearms, eager caresses coaxing you to hilt yourself in her uncanny valley. Wrapping your forefingers and thumbs around her pressurized teats, you use the bloated automaton’s nipples as handholds to steady yourself. With a bucking thrust, the stiff length");
		if(pc.cockTotal() > 1) output("s");
		output(" of your [pc.cocks] plunge");
		if(pc.cockTotal() == 1) output("s");
		output(" deeper into her augmented udders.");
		if(pc.balls > 1)
		{
			output(" Before long, your [pc.balls] begin slapping against her supple skin with ");
			if(pc.ballDiameter() <= 2) output("slight, trembling pats.");
			else if(pc.ballDiameter() <= 6) output("heavy, carnal buffets.");
			else output("the full, pendulous weight of your seed-swollen surplus.");
		}
		output("\n\nYour grip around her nipples tightens as you grunt with burgeoning need. Blossoming heat washes across your loins even as you squeeze her peaks harder, thin, clear fluid leaking from her chest and into her cleavage. Another clutching caress sends the fluid contents of the nurse droid’s breasts spraying forth in jubilant release, the matronly automaton crying out in a decidedly undignified manner. She gasps and moans with whorish ecstasy as you milk her mountainous peaks like two bovine geysers. The girl’s cream gushes all across her breasts and floods the deep crevasse of her cock-stuffed, silicone orbs.");
		output("\n\nWith her heaving mounds freshly lubricated, you set to fucking the stuffing out of the perverted nurse. You rock back and forth with unrestrained fervor, your [pc.cockBiggest] throbbing as the droid’s mammary vale suckles with squelching joy at the swollen shaft.");
		if(pc.balls > 1) output(" Your [pc.balls] clap against her synth-skin with moist thwacks that just get louder the tighter your pouch gets.");
		output(" She aids your rolicking assault with the hydraulic motion of her shoulders and back, slamming her heavy chest down just as you go deeper.");

		output("\n\nThe droid cries out in rapture, only to be cut off as her smothering bosom is pushed up over her face, one building-shaking thrust at a time. She grabs hold of her smothering melons, pushing them together with pussy-like tautness as your pace grows frantic with the nearness of your climax. With a long, drawn out gasp, you surrender to the pleasure and let your orgasm wash over you. Body quivering, your [pc.cocks] release");
		if(pc.cockTotal() == 1) output("s");
		output(", thick jets of [pc.cumNoun] painting the droid’s pale skin [pc.cumColor].");
		if(pc.balls > 1)
		{
			output(" The tightness in your [pc.balls] finally loosens as hot spunk gushes through your body and into the droid’s inflated melons.");
		}
		if(pc.cumQ() >= 1000) output(" The bliss of your peak surges through your engorged meat, flooding the nurse’s valley and dribbling fat blobs of excess from every the wobbling seam of her cinched bosom.");

		output("\n\nYou buck a few more times, letting Nym-Foe’s Z-cup mammaries milk you of every last drop before finally backing off of her. No longer tightly compressed, the automaton’s chest settles back into its hemispherical bulk, though freshly glistening with your [pc.cumVisc] jizz. It seems more than a little of your seed made its way to the robot’s face, her delicate features dripping with a sticky mask of lust. She lets out a deep sigh of contentment and settles back to reboot, happy to have been able to assist you in all your medical needs.");
		//[Go to “merge”]
		output("\n\nThe tireless android keeps at you for a full hour, somehow managing to keep one climax flowing into the next without a break between them. By the end, the two of you are utterly soaked. Your whole body trembles with exhaustion, even slight movements threatening to send you into another spasm of aching bliss. As your mind gradually finds its way back into your head, you blink and look down at the now still nurse. The blue screens of her eyes have small white text in them that reads <i>“Installing Updates.”</i>");
		output("\n\nA strangled laugh escapes your raw throat and you can’t help but to chuckle with sore mirth. It’s a miracle she automatically shut down or the two of you might still be at it until you orgasmed yourself into a coma. Weakly, pull yourself up and struggle into your [pc.gear].");
		if(flags["PEXIGA_TREATMENT"] == 0) output(" A quick check reveals your pexiga close at hand. She had apparently been watching the two of you the whole time, if the puddle of sweet-scented drool is any indication.");
		processTime(50);
		for(var z:int = 0; z < 10; z++) { pc.orgasm(); }
	}
	processTime(14);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",fuckNymFoe3);
}

public function fuckNymFoe3():void
{
	clearOutput();
	showNymFoe();
	author("Adjatha");
	output("Whew! That was fun. What’s next? You could get any silicone out");
	if(flags["PEXIGA_TREATMENT"] == 0) output(", take the droid apart for scrap, or leave the nurse and take your pexiga deeper into Badger’s lair");
	else output(" or safely turn off the nurse and leave");
	output(".");
	output("\n\n");
	processTime(1);
	
	IncrementFlag("NYM-FOE_FUCKED");
	
	pcVictoryVsNymFoeMenu();
}


//[Suck Out]
//option blanked out if the player was not injected or has already removed their silicone
public function suckOutDatInjectionGoop():void
{
	clearOutput();
	showNymFoe();
	author("Adjatha");
	output("After tinkering with her a bit, you manage to reverse the flow from her injector tail. With a gulp, you stick yourself once more and hope for the best. Slowly, gradually, it seems to be working. Bit by bit, your inflated body is siphoned of the silicone, returning you to normal, more or less. You rub your sore body, and pull out the automaton’s tail before she can do any more damage.");
	output("\n\nWith that taken care of, you should be good to go. Unless there was something else you needed to do with Nym-Foe?");
	output("\n\n");
	processTime(4);
	nymFoeUninjection(pc);
	
	pcVictoryVsNymFoeMenu();
}

//[Harvest]
public function salvageNymFoe():void
{
	clearOutput();
	showNymFoe();
	author("Adjatha");
	
	var combat:Boolean = inCombat();
	
	if(	(combat && enemy.hasItemByClass(Silicone,4) && enemy.hasItemByClass(Gush,5) && enemy.hasItemByClass(DamagedVIChip))
	||	(flags["NYM-FOE_LOOT_SILICONE"] != undefined && flags["NYM-FOE_LOOT_GUSH"] != undefined && (flags["NYM-FOE_LOOT_CHIP"] != undefined || (!combat && flags["NYM-FOE_CHIP_RETURN"] != undefined)))
	) {
		output("It seems you have looted all the robot’s detachable belongings.");
	}
	else
	{
		output("Waste not, want not, right?");
		if(flags["NYM-FOE_DISASSEMBLED"] == undefined) output(" You bend over the repurposed robot and release her safety clamps, opening her warm, squishy exterior.");
		output(" Unsurprisingly, the nurse’s interior is a dizzying mess of rewired circuitry and oily servos. Badger really did a number on this one.");
		if((combat && !enemy.hasItemByClass(Silicone,4)) || flags["NYM-FOE_LOOT_SILICONE"] == undefined) output("\n\nIt seems her chest has been stuffed with military-grade silicone. Luckily, the pouches seem to be intact, so carrying them away shouldn’t be too much trouble. Who could possibly need this much silicone?");
		if((combat && !enemy.hasItemByClass(Gush,5)) || flags["NYM-FOE_LOOT_GUSH"] == undefined) output("\n\nRight near where her heart would be, an elaborate hydraulic pump has been added, connected to a massive tank of Gush. You could probably load up some nearby spray pens from this central tank, if you wanted. You’ll just have to be careful not to let on that you’re carrying enough of the illegal drug to start a cartel.");
		if((combat && !enemy.hasItemByClass(DamagedVIChip)) || (!combat && flags["NYM-FOE_LOOT_CHIP"] == undefined && flags["NYM-FOE_CHIP_RETURN"] == undefined)) output("\n\nThe nursedroid’s Artificial Intelligence chip should be somewhere around her head. You could probably get a few credits for that, despite Badger’s reprogramming.");
	}
	
	if(flags["NYM-FOE_DISASSEMBLED"] == undefined) {
		processTime(4);
		flags["NYM-FOE_DISASSEMBLED"] = 1;
	}
	if(combat && flags["PEXIGA_TREATMENT"] == 0)
	{
		output("\n\n(If you choose not to pick up certain items, you may have another chance to reclaim the things you haven’t dismantled--assuming you are able to have access Doctor Badger’s laboratory again.)");
	}
	
	salvageNymFoeMenu();
}

public function lootTheNymFoe(item:ItemSlotClass):void
{
	clearOutput();
	showNymFoe();
	author("Adjatha");
	
	switch(item.shortName)
	{
		case "Silicone":
			item.quantity = 4;
			output("After digging around inside her chassis, you come up with four bags of silicone.");
			flags["NYM-FOE_LOOT_SILICONE"] = 1;
			break;
		case "Gush":
			item.quantity = 5;
			output("After digging around inside her chassis, you come out with five fully loaded medipens, all full of Gush.");
			flags["NYM-FOE_LOOT_GUSH"] = 1;
			break;
		case "VI Chip":
			output("Rooting around her head for the VI chip isn’t exactly fun, but it might be profitable. Bingo! You got it.");
			flags["NYM-FOE_LOOT_CHIP"] = 1;
			break;
		default:
			output("BEEP BOOP. INPUT ERROR.");
			break;
	}
	if(inCombat())
	{
		enemy.inventory.push(item);
		salvageNymFoeMenu();
	}
	else
	{
		output("\n\n");
		itemScreen = salvageNymFoeMenu;
		lootScreen = salvageNymFoeMenu;
		useItemFunction = salvageNymFoeMenu;
		itemCollect([item]);
	}
}

public function salvageNymFoeMenu():void
{
	clearMenu();
	
	//[Silicone] (up to 4x Silicone bags, gadget) [Gush] (up to 10x Gush medipens, consumable) [Chip] (1x Damaged AI chip, gadget) [Leave]
	var combat:Boolean = inCombat();
	
	if((combat && enemy.hasItemByClass(Silicone,4)) || flags["NYM-FOE_LOOT_SILICONE"] != undefined) addDisabledButton(0,"Silicone","Silicone","You’ve already taken all her silicone.");
	else addButton(0,"Silicone x4",lootTheNymFoe,new Silicone(),"Silicone x4","Take four bags of silicone out of her.");

	if((combat && enemy.hasItemByClass(Gush,5)) || flags["NYM-FOE_LOOT_GUSH"] != undefined) addDisabledButton(1,"Gush","Gush","You’ve already taken all her Gush.");
	else addButton(1,"Gush x5",lootTheNymFoe,new Gush(),"Gush x5","Load up five medipens worth of Gush.");

	if((combat && enemy.hasItemByClass(DamagedVIChip)) || (!combat && flags["NYM-FOE_CHIP_RETURN"] != undefined) || flags["NYM-FOE_LOOT_CHIP"] != undefined) addDisabledButton(2,"VI Chip","VI Chip","You’ve already pulled her chip.");
	else addButton(2,"VI Chip",lootTheNymFoe,new DamagedVIChip(),"VI Chip","Loot the damaged VI chip.");

	if(combat) addButton(14,"Back",pcVictoryVsNymFoeMenu);
	else addButton(14,"Back",mainGameMenu);
}

//[Leave]
public function leaveTheNymFoe():void
{
	clearOutput();
	showPexiga();
	author("Adjatha");
	output("Taking the pexiga’s leash firmly in hand, you leave the robot on the ground and resume your hunt for Doctor Badger.\n\n");
	CombatManager.genericVictory();
	eventQueue.push(afterNymFoeFight);
}


public function nurseDroidChipTurnIn(droid:String):void
{
	clearOutput();
	if(droid == "VKO") showVKo();
	else if(droid == "Vi") showVi();
	author("Adjatha");
	output("You hand the autonomous attendant the AI chip for her reprogrammed sister and the droid accepts it with surprising familiarity. <i>“This is not the first reprogramed V-Ko we have encountered,”</i> the nurse explains, her face chipper but her tone exasperated. <i>“I believe this may be a consequence of what is known as the ‘Nurse fetish.’ Do not worry, the VI will be returned to JoyCo for reprogramming.”</i> The robot offers you a plastic smile that, in spite of her synthetic skin, feels heartfelt. <i>“I am authorized to offer you a reward for returning vandalized property. Please accept this with JoyCo’s thanks.”</i> Your Codex beeps to inform you that 5,000 credits have been transferred to your account. The android turns back to her duties, speaking softly, as if whispering to the recovered chip.");
	
	flags["NYM-FOE_CHIP_RETURN"] = 1;
	if(flags["NYM-FOE_REPAIR_QUEST"] == 2) flags["NYM-FOE_REPAIR_QUEST"] = -3;
	
	pc.credits += 5000;
	pc.destroyItemByClass(DamagedVIChip);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function dollmakerSetup():void
{
	//Doll Maker, Vulgar Autonomous Bimbo Forge
	//Encounter Text
	//All
	clearOutput();
	showDollmaker();
	author("Adjatha");
	output("As you’re surveying Doctor Badger’s underground lab, an elaborate spider-like rig unfolds itself from the ceiling, dropping dozens of spindly limbs around you like a loose cage. Startled, you reach for your weapons as a green triangle of laser light flashes back and forth across your body.");
	processTime(4);
	//normal
	if(!pc.isBimbo())
	{
		output("\n\nA harsh, unfriendly buzz comes from the machine as its electric voice hisses at you. <i>“Fuck-slut levels unsatisfactory. Initiating reconstruction protocols. Do not resist, Whore: you will be Dolled.”</i> Frankly, you’re not comfortable with how this machine used the word “doll,” and you’d just as soon not find out what exactly that involves. The limbs around you lift a strange array of tools and pincers as it attempts to grab you!");
		//Go to Battle
		clearMenu();
		addButton(0,"Next",fightTheDollmaker);
	}
	//bimbo
	else
	{
		output("\n\nA satisfied chirp comes from the machine and a friendly electric voice comes from one of the steel limbs. <i>“Fuck-slut levels at satisfactory thresholds.”</i> The scanning light flashes over your pexiga next and the mechanical voice manages to seem downright impressed. <i>“Complete mental degradation on every level. Fuck-slut level at maximum capacity.”</i>");
		output("\n\nYou’re a little confused, so you ask the machine what you’re supposed to do. The spidery limbs begin retracting up to the ceiling as it responds. <i>“I dunno. I assume the doctor’s waiting for you further in the laboratory, Cum Dumpster. Please proceed on your way.”</i> The voice pauses, as if thinking. <i>“Unless,”</i> it begins, almost hopefully, <i>“you wish to be Dolled?”</i>");
		//[Badger] [Doll]
		clearMenu();
		addButton(0,"Badger",bimboSkipDollmakerFight);
		addButton(1,"Doll",volunteerForDollificationFight);
	}
	
	flags["DOLLMAKER_STATUS"] = 0;
}

//[Badger]
public function bimboSkipDollmakerFight():void
{
	clearOutput();
	showDollmaker();
	author("Adjatha");
	output("You inform the machine that you really do need to get to Doc Badger. <i>“No, that is alright, Meat Puppet. The doctor takes precedence. Go on. Just leave me here, by myself. I’ll be fine.”</i> Despite it all, the machine seems almost hurt. The limbs withdraw into the ceiling and you could almost swear it makes a puppydog whine.");
	
	flags["DOLLMAKER_STATUS"] = 2;
	
	//Skip Battle
	clearMenu();
	addButton(0,"Next",afterDollmakerFight);
}

//[Doll]
public function volunteerForDollificationFight():void
{
	clearOutput();
	showDollmaker();
	author("Adjatha");
	
	if(!pc.isBimbo()) output("Either you are incredibly daring or incredibly stupid, you decide to volunteer yourself to the special service.");
	else output("It could be fun, you guess. Sure! Why not?");
	output("\n\n<i>“What?”</i> the machine asks, in disbelief. <i>“Are you teasing me, Fuck Toy? You would actually like to be Dolled?”</i> The voice seems overjoyed, or at least as happy as a faceless machine can be, anyway. <i>“Affirmative. Initiating reconstruction protocols.”</i> The limbs around you turn in slow orbit to show off their strange array of tools and pincers. <i>“I appreciate this, Cum Rag. I hope you enjoy it as well. Let’s get started, shall we?”</i>");
	
	flags["DOLLMAKER_STATUS"] = 3;
	
	//Go to Dolled Combat Result
	clearMenu();
	addButton(0,"Next",dolledBadEnd);
}

//[Fight]
public function fightTheDollmaker():void
{
	clearOutput();
	showDollmaker();
	
	var dollMaker:Dollmaker = new Dollmaker();
	
	if(flags["PEXIGA_TREATMENT"] == 0)
	{
		output("You pull out your weapons and get ready for a fight!");
		
		dollMaker.createStatusEffect("Flee Disabled", 0, 0, 0, 0, true, "", "", false, 0);
	}
	else
	{
		output("You’re up for a fight, and the Doll Maker seems like a fun challenge. After looking through the parts on the machine, you look for the spot to activate the core to enable the entire set. Finally, you enable it, and the whole thing comes to life with a loud whirr.");
		if(flags["DOLLMAKER_STATUS"] == -1)
		{
			output("\n\n<i>“I’m back! Are you going to be my new doll, Jizz Basket?”</i>");
			output("\n\nJust as rude as you remember it.");
		}
		output("\n\n<b>It’s a fight!</b>");
		
		// Player can run if they have not been hit by the cuffs
		flags["DOLLMAKER_ACTIVATED"] = 1;
	}
	output("\n\n");
	
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(dollMaker);
	CombatManager.victoryScene(playerBeatUpDollmaker);
	CombatManager.lossScene(gitcherAssKickedByDollymakah);
	CombatManager.displayLocation("DOLL MAKER");
	
	clearMenu();
	addButton(0,"Next", fightTheDollmakerBegin, dollMaker);
}
public function fightTheDollmakerBegin(dollMaker:Dollmaker):void
{
	CombatManager.beginCombat();
	
	if(flags["DOLLMAKER_FORCE_CUFFS"] != undefined && !pc.isDefeated())
	{
		output("\n\n");
		dollMaker.restrainingCuffs(pc);
	}
}

// Doll Maker is active after running away
public function fleeToPostQuestDollmaker():void
{
	clearOutput();

	output("<i>“You know, Semen Rag, you’re quite lucky I can’t move from here. But one thing is for sure, I’m keeping Nym-Foe to myself!”</i> The machine seems to hold Nym-Foe’s");
	if(flags["NYM-FOE_ACTIVATED"] == undefined) output(" lifeless");
	output(" body near its center. Though, the silicone tank is still free to use.");
	output("\n\n");
	
	// Player cannot access Nym-Foe, but can use the silicone tank.
	flags["DOLLMAKER_PROTECC_NYM-FOE"] = 1;

	CombatManager.abortCombat();
}

//Combat Results
//Player Loss
//all
public function gitcherAssKickedByDollymakah():void
{
	clearOutput();
	showDollmaker();
	author("Adjatha");
	output("No longer able to put up much of a fight, you find your ability to resist just about completely sapped. The padded cuffs of the Doll Maker keep you aloft, bound and utterly exposed to its bevy of perilous limbs. <i>“Well, that took longer than it had to,”</i> the machine observes, a little sharply. <i>“I’d say ‘next time just surrender and get it over with,’ but I think we both know there’s not going to be a next time, DEMEANING NAME LOOK UP ERROR.”</i> The machine whirs and grinds for a moment before rebooting itself.");
	output("\n\n<i>“Initiating reconstruction protocols.”</i> The limbs around you turn in slow orbit to show off their strange array of tools and pincers. <i>“I appreciate this, Cum Rag. I hope you enjoy it as well. Let’s get started, shall we?”</i>");
	
	flags["DOLLMAKER_STATUS"] = 1;
	
	//[go to Dolled Bad End]
	clearMenu();
	addButton(0,"Next",dolledBadEnd);
}

//Player Victory
//all
public function playerBeatUpDollmaker():void
{
	clearOutput();
	showDollmaker();
	author("Adjatha");
	
	output("The elaborate rig of weaponized limbs above you jerks, spitting sparks and cursing in a scratchy, electronic voice. <i>“Fuck-damned cocksucker! Cum-guzzling gutterslut! I just try to make you a little more attractive and this is the thanks I get? Well suck my sockets, you jizz-drenched analwhore. I hope you get dick-slapped so hard, the spunk you call brains flies out of your ears!”</i> Foul mouthed to the end, it seems.");
	output("\n\nAs it gathers itself for one last, spiteful assault, a spasming surge shoots through the damaged Doll Maker and its arms go limp, no longer posing any threat. <i>“Fuuuuuuuuuuck youuuuuuuuu...”</i> it rasps, its voice finally clicking off. You give one an experimental push and when you find it unresponsive, you step out from under the mechanical canopy.");
	if(flags["PEXIGA_TREATMENT"] == 0)
	{
		output(" You should probably salvage this thing now, so you don’t have to come back down here again!");
		output("\n\n(If you choose not to pick up certain items, you may have another chance to reclaim the things you haven’t dismantled--assuming you are able to have access Doctor Badger’s laboratory again.)");
		
		if(flags["DOLLMAKER_DISASSEMBLED"] == undefined) flags["DOLLMAKER_DISASSEMBLED"] = 1;
		
		dollmakerSalvageMenu();
	}
	else
	{
		output(" You have no hope of salvaging the machine after Badger’s upgrades, not to mention that it’s going to go through self repairs soon.");
		
		flags["DOLLMAKER_ACTIVATED"] = undefined;
		flags["DOLLMAKER_PROTECC_NYM-FOE"] = undefined;
		pc.createStatusEffect("Doll Maker Repair Timer", 0, 0, 0, 0, true, "", "", false, 1440);
		
		clearMenu();
		addButton(14, "Next", CombatManager.genericVictory);
	}
	
	flags["DOLLMAKER_STATUS"] = -1;
	
	processTime(3);
}

public function dollmakerSalvage(item:ItemSlotClass):void
{
	clearOutput();
	showDollmaker();
	author("Adjatha");
	
	switch(item.shortName)
	{
		case "IQBGone":
			output("After digging around inside the chassis, you come up with a syringe full of IQ B-Gone.");
			flags["DOLLMAKER_LOOT_IQBGONE"] = 1;
			break;
		case "B.B.Melt":
			output("After digging around inside the chassis, you come out with a broken Brainmelt Lamp.");
			flags["DOLLMAKER_LOOT_LAMP"] = 1;
			break;
		case "B.Emitter":
			output("Getting the gun off the robot in a way that’ll let you use it isn’t fun, but the results could be.... Bingo! You got it.");
			flags["DOLLMAKER_LOOT_EMITTER"] = 1;
			break;
		case "MW Visor":
			output("You rip a strange virtual headset off one of the arms. This could be... fun.");
			flags["DOLLMAKER_LOOT_VISOR"] = 1;
			break;
		default:
			output("BEEP BOOP. INPUT ERROR.");
			break;
	}
	
	if(inCombat())
	{
		enemy.inventory.push(item);
		dollmakerSalvageMenu();
	}
	else
	{
		output("\n\n");
		itemScreen = dollmakerSalvageMenu;
		lootScreen = dollmakerSalvageMenu;
		useItemFunction = dollmakerSalvageMenu;
		itemCollect([item]);
	}
}
public function dollmakerSalvageMenu():void
{
	clearMenu();
	
	//[Dildo] (Mouse Over: A huge, squeezable dildo shaped like Doctor Badger’s cock, filled with her distinctive musk. Even a wiff is enough to leave you shuddering with need. Bimbos would love it.)
	//[Vibes] (Mouse Over: A handful of thumb-sized, egg-shaped vibrators. They seem to attach to the nearest organic target before burning themselves out driving the victim wild.) {players can select this option up to 3 times, gaining one stack of vibes per selection}
	//[Syringe] (Mouse Over: A harvested needle filled with Doctor Badger’s patented IQ B-Gone serum. Law enforcement would be interested in this - maybe they can make a cure?)
	//[Lamp] (Mouse Over: The deceptively innocuous pink-bulbed Brainmelt Lamp seems to have been damaged in the fight. You might be able to sell it for scrap.)
	//[Visor] (Mouse Over: The Mindwash Visor actually seems like it might be fun to use when your life’s not at stake. Another toy for your ship, perhaps.)
	//[Sprayer] (Mouse Over: A liquid latex spray gun. There’s enough juice to give you a single coating, if you’re into that.)
	//[Gun] (Mouse Over: A custom designed Bimboleum Emitter, like the kind Doctor Badger uses.)
	//[Leave] (Mouse Over: You’re done here. Time to get your pexiga healed!)
	var combat:Boolean = inCombat();
	
	if((combat && enemy.hasItemByClass(IQBGone)) || flags["IQBGONE_POLICED"] != undefined || flags["DOLLMAKER_LOOT_IQBGONE"] != undefined) addDisabledButton(0,"Syringe","Syringe","You’ve already taken her IQ B-Gone syringe.");
	else addButton(0,"Syringe",dollmakerSalvage,new IQBGone(),"Syringe","A harvested needle filled with Doctor Badger’s patented IQ B-Gone serum. Law enforcement would be interested in this - maybe they can make a cure?");

	if((combat && enemy.hasItemByClass(BrokenBrainmeltLamp)) || flags["DOLLMAKER_LOOT_LAMP"] != undefined) addDisabledButton(1,"Lamp","Lamp","You already took the lamp.");
	else addButton(1,"Lamp",dollmakerSalvage,new BrokenBrainmeltLamp(),"Lamp","The deceptively innocuous pink-bulbed Brainmelt Lamp seems to have been damaged in the fight. You might be able to sell it for scrap.");

	if((combat && enemy.hasItemByClass(BimboleumEmitter)) || flags["DOLLMAKER_LOOT_EMITTER"] != undefined) addDisabledButton(2,"Gun","Gun","You’ve already taken the gun.");
	else addButton(2,"Gun",dollmakerSalvage,new BimboleumEmitter(),"Gun","A custom designed Bimboleum Emitter, like the kind Doctor Badger uses. Effects are probably not permanent... probably.");

	if((combat && enemy.hasItemByClass(MindwashVisor)) || flags["DOLLMAKER_LOOT_VISOR"] != undefined) addDisabledButton(3,"Visor","Visor","You’ve already taken the visor.");
	else addButton(3,"Visor",dollmakerSalvage,new MindwashVisor(),"Visor","A strange visor, presumably used for brainwashing its victims.");

	if(combat) {
		if(flags["PEXIGA_TREATMENT"] == 0) addButton(14,"Leave",leaveTheDollmaker,undefined,"Leave","You’re done here. Time to get your pexiga healed!");
		else addButton(14,"Leave",CombatManager.genericVictory);
	}
	else addButton(14,"Leave",mainGameMenu);
}

//[Leave]
public function leaveTheDollmaker():void
{
	clearOutput();
	showPexiga();
	author("Adjatha");
	output("Your pexiga pet is sitting on the stairs, just where you left her, staring into empty space. You retrieve her and set off, alert to any additional sentries or traps.\n\n");
	CombatManager.genericVictory();
	eventQueue.push(afterDollmakerFight);
}

//Harvested Parts
//Badger Dildo w/ Musk (sex toy, used with wank menu, on Bimbo Penny, and bimbo pexiga)
	//"A jet black, 11" dildo that seems to be a perfect replica of Doctor Badger’s infamous tool. It is filled with some highly scented Badger musk, designed to drive bimbos wild."
//	Sell Price: 300
//Bio-Magnetic Vibes (consumable attack item, applies Lust DoT, 100% hit, robots immune)
	//"A handful of thumb-sized, egg-shaped vibes. Once activated and thrown at an organic target, they’ll stick as if glued and vibrate so fast they’re guaranteed to bring out the slut in just about anybody! Unfortunately, they burn themselves out after just one use."
//	Sell Price: 200
//IQ B-Gone syringe (key item, turn in to Penny for a reward)
//	"A needle filled with Badger’s notorious IQ B-Gone formula. This stuff is dangerous! Maybe somebody in law enforcement might have a use for it?"

public function turnInIQBGoneToPenpen():void
{
	clearOutput();
	if(!pennyRecruited())
	{
		showPenny();
		author("Adjatha");
		//Normal Penny: 
		if(flags["PENNY_BIMBO"] == undefined) output("<i>“What’s that, [pc.name]? ‘IQ B-Gone?’ Is this...?”</i> She trails off, narrowing her eyes. <i>“Where did you get this from?”</i> Probably better not to tell the policegirl that you’ve been dealing with Doctor Badger right now. You make up a story about buying it off some scrapper on Tarkus and that seems to satisfy the vixen. <i>“Well, wherever it came from, this stuff is nasty business. I’m going to send it off to the UGC for analysis. Maybe they can use it to make a cure.”</i> Penny’s gaze softens to a look of concern. <i>“You watch yourself out there, okay? Things must seem like a big adventure, I’m sure, but there’s a lot of dangerous people who don’t even need an excuse to hurt you.”</i> You assure her that you’ll watch your back, setting a comforting hand on her shoulder.");
		else output("<i>“Oooh, got something new for me, mate?”</i> You explain that the syringe is IQ B-Gone and it’d probably be better if Penny avoided taking it in her state. She giggles and shrugs. <i>“So what do we do with it?”</i> You suggest sending it off to the UGC. Keep it out of the wrong hands. <i>“If you think that’s, like, the right thing to do, I guess!”</i> Penny takes the needle and drops it in a box. <i>“Personally, I think I’d be way sexier with a few less IQ points,”</i> she teases, licking her lips with bubble-headed delight. Yeah, definitely better to keep that away from her.");
	}
	else
	{
		author("Jacques00");
		output("You tell the new Peacekeeper that you’ve got some potentially incriminating evidence. It’s probably better not to tell the policewoman that you’ve been dealing with Doctor Badger right now so you make up a story about buying it off some scrapper on Tarkus. <i>“Okay, I’m going to send it off to the UGC for analysis. First, I’ll need you to fill out this report.”</i> The officer hands you a data slate with a no-nonsense expression on her face.");
		output("\n\nYou take the tablet, complete the form with the relevant information and hand it back to her.");
		output("\n\nThe officer quickly looks over it and nods. <i>“Good. That is all.”</i>");
	}
	pc.destroyItemByClass(IQBGone);
	pc.createStatusEffect("IQBGoneTimer", 0, 0, 0, 0, true, "", "", false, 1440);
	flags["IQBGONE_POLICED"] = 1;
	processTime(2);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//24 hours after turning it in: 
public function IQBeGoneCashOut():void
{
	AddLogEvent("A beep on your Codex indicates that the UGC received your IQ B-Gone sample. A form letter thanks you for doing your civic duty and has a little S.C.A.R.E. anti-drug seal of approval at the bottom. Another beep indicates that 2,500 credits have been deposited to your account. Not as much as you’d have thought, but it is the government afterall.");
	pc.credits += 2500;
	flags["IQBGONE_POLICED"] = 2;
}


//Broken Brainmelt Lamp (junk, sell to junkers for some dosh)
//	"The remains of a circular pink screen with a crude spiral drawn on it. Seems to have short circuited. It might still be good scrap to somebody.”</i>
	//Sell price: 1,000 (Tarkus scrapdealers only)
//Mindwash Visor (ship upgrade, install on your ship to add ‘Mindwash’ to your ship’s wank menu)
	//"A pair of shallow, nipple-like plates that, once attached to the head, link via a hardlight holo-screen. It seems to tap into your thoughts and memories while broadcasting. Dangerous to use while vulnerable, so you’ll have to install it in your ship if you want to use it.”</i>
//	Sell price: 2,000
//Latex Sprayer (consumable transformative item, gives player latex body, like Rubber-Made)
	//"A pen-sized device with a small vial of reddish goop attached to it. For those who want a shiny exterior but hate spending a small fortune in baby oil.”</i>
//	Sell price: 500
//Bimboleum Emitter (gun, like a magnum version of the Slut Ray)
	//"A squat little gun with a series of loose rings around the barrel and a fat glass bulb filled with bubblegum-thick fluid on its back. Converts Bimboleum into energy rings which then convert back to bimboleum inside the target’s body. Even just owning this probably puts you on a Most Wanted list somewhere.”</i>
//Ranged Weapon - Energy/Lust attack, 8 Tease damage
//Sell price: 900


//Bad Ends
//GUSH’d (Nym-Foe battle)
//via Lust damage only
public function gushBadEndWithNymFoe():void
{
	userInterface.hideNPCStats();
	userInterface.leftBarDefaults();
	generateMap();
	
	clearOutput();
	showNymFoe();
	author("Adjatha");
	
	output("The android assesses your state with a friendly beep, her eyes skipping across your defenseless body. <i>“Oh my, how strange. GUSH administration partially ineffectual. Scanning...”</i> Her tail whips out and weaves dangerously in the air in front of you before lightly touching your [pc.tongue]. Her mouth curls into an ‘O’ of surprise, her hand held up in front of her mouth.");
	output("\n\n<i>“What’s this? My initial diagnosis did not pick up the immune-boosting supplements in your bloodstream, INSERT PATIENT NAME HERE. I certainly do apologize. Please, accept this 1cc of accelerant spray at no additional cost.”</i> You hold up your arms to try to block whatever’s coming next when a thought hits you. Additional cost?");
	output("\n\nYou have no time to think about it further, however, because in the next moment, the robotic nurse grabs your arms in her gentle-yet-irresistible grip and pulls you forward. You flinch away, but she simply leans forward and presses her synthetic skin against your [pc.lipsChaste], kissing you deeply. You stiffen under the unexpectedly tender assault, a little taken aback by the warmth of the artificial girl’s body. Just as you open your mouth to protest this treatment, the droid releases a spritz of some chemical into you. Your caregiver releases her hold as you hack and pull back, trying to spit out the slightly minty tingle radiating across your jaw.");
	output("\n\nNym-Foe seems perfectly content to wait and watch, so this might be your chance to recover and strike back. You glance around for a weapon, but as you reach out, your fingers start to quiver. A sensation of heaviness on your [pc.chest] had been building during your fight with the robotic caregiver. Now, however, it feels like actual, fluid weight is surging within you. Your [pc.skinFurScales] burn");
	if(!pc.hasScales() && !pc.hasFeathers()) output("s");
	output(" with too-tender sensitivity that leaves flashes of blinding white detonating behind your eyes. You clutch your chest with one hand and grit your teeth, trying to push away the sensations while seizing a half-disassembled Hammer pistol from next to you. In this state, there’s no way it’s going to fire, but at least you can smash the hunk of metal into the nurse’s face until she fixes you!");
	output("\n\nRaising your improvised weapon and struggling upright, you advance toward the artificial woman with a threat on your lips. Before you can actually speak it, however, a surprised gurgle lodges itself in your throat. The heat and pressure in your upper body blossoms like an aerial detonation, leaving you stunned and sweating.");
	if(!pc.isChestExposed()) output(" Your [pc.upperGarment] tightens and strains as your chest inflates wildly! Despite its best attempts, the [pc.upperGarment] simply can’t hold back the unforgiving tide of your flesh and the whole thing stretches, groans, and finally tears open.");
	output(" Your [pc.breasts] jiggle and surge outward, growing beyond all reason and ballooning before your eyes. Titflesh swells at an impossible pace, the broken gun tumbling from your numb fingers with a distressing clatter.");

	output("\n\nSlightly concerned, the droid tilts her head to one side and folds her arms behind her back. <i>“Oh dear,”</i> she frets, <i>“I wonder if that was supposed to be 0.1cc of accelerant?”</i>");

	output("\n\nBlowing through cup-sizes at an alarming rate, you desperately hug your massive mammaries between both arms, as if the pressure of your grip could stop them from growing. No such luck it seems, as the distended [pc.milkNoun]-tanks bulge around your grip, heavier and heavier until you are forced back down to your [pc.knees] with a groaning moan. Worse yet, you can actually feel the liquid building inside you with a heat that leaves your loins throbbing. Even as big as you are already, your swelling udders can’t possibly keep up with the organic tide within you.");

	output("\n\nLike reservoirs trying to hold an ocean, your tits fill and fill but can’t contain it all in. With an orgasmic sense of relief, your equally bloated nipples bubble and trickle before outright spurts of [pc.milkNoun] begin spraying out of you. With bovine desperation, you paw at your mountainous melons, trying to stop the sloshing flow one moment and squeezing ever thicker gouts of [pc.milk] the next. Your body trembles and throbs, climactic bliss saturated in every bloated cell of your ballistic blimps.");

	output("\n\nThe nurse hurries to your side to check on your condition. By now, your breasts are nearly as large as your upper body and still growing. You struggle to pull away, but you’re completely immobilized by the colossal weight of your leaking udders. <i>“You appear to be in distress,”</i> she observes with a uncomfortably out of place smile. <i>“Do you require assistance?”</i>");

	if(!pc.isBimbo()) output("\n\n<i>“I like big, jubbly boobies, but this is kinda - unf - hard to move?”</i> You offer a weak smile and shrug up at the android. <i>“Maybe you could find, like, an anti-grav bra?”</i>");
	else if(pc.isNice()) output("\n\nAt last! Her nurse’s programming must be winning out against the corrupted code Doctor Badger put into her. <i>“Yes! Please, go get help,”</i> you beg through your panting moans.");
	else if(pc.isMischievous()) output("\n\nYou suppress a moan long enough to look up at the android with an expression of complete confusion. <i>“What do you mean? I’m just retaining a little water.”</i> You grant yourself a brief snicker before the orgasmic milking begins anew. <i>“I don’t suppose you’ve got a milker function?”</i>");
	else output("\n\n<i>“Fucking yes I’m in distress! You sprayed some damned chemical garbage all over me and now I look like I’ve got moons strapped to my chest! Fix it!”</i>");

	output("\n\nShe blinks, watching you intently. <i>“Request for assistance confirmed. Deploying immobilization countermeasures.”</i> Her tail pushes its way up to your [pc.ass] and the tip pokes in with a slight pinch. <i>“Do not be alarmed. Minor modifications are being made to acclimate you to your upgrades.”</i> She gently strokes your [pc.hair].");
	output("\n\nThe bimbo-proportioned nurse snuggles up against your gigantic, and still growing endowments, with a peculiar look on her face. <i>“Oh, I almost forgot!”</i> Nym-Foe produces a lollipop from her hefty cleavage, and holds the candy out to you with a smile. <i>“Because you’ve been a good " + pc.mf("boy","girl") + ". Now. How would you like to discuss your payment?”</i>");

	processTime(15);
	pc.lust(100);
	
	pc.removeAll();
	
	var i:int = 0;
	for(i = 0; i < pc.breastRows.length; i++)
	{
		pc.breastRows[i].breastRatingRaw += 100;
		//if(!pc.breastRows[i].fuckable()) pc.breastRows[i].nippleType == GLOBAL.NIPPLE_TYPE_FUCKABLE;
	}
	if(pc.milkMultiplier < 125) pc.milkMultiplier = 125;
	else pc.milkMultiplier += 50;
	if(pc.nippleLengthRatio < 2) pc.nippleLengthRatio = 2;
	if(pc.nippleWidthRatio < 1) pc.nippleWidthRatio = 1;
	if(pc.buttRatingRaw < 20) pc.buttRatingRaw = 20;
	else pc.buttRatingRaw += 5;
	
	clearMenu();
	addButton(0,"Next",gushBadEndWithNymFoe2);
}

public function gushBadEndWithNymFoe2():void
{
	moveTo("301");
	
	pc.armor = new MaidOutfit();
	pc.armor.addFlag(GLOBAL.ITEM_FLAG_EXPOSE_CHEST);
	pc.armor.hasRandomProperties = true;
	
	clearOutput();
	showBust("RASKVEL_MALE_NUDE","RASKVEL_MALE_NUDE","RASKVEL_MALE_NUDE");
	showName("\nGUSH’D");
	author("Adjatha");
	
	output("<b>Three months later...</b>");
	output("\n\nYou have to admit, you never saw this coming. The " + pc.mf("heir","heiress") + " of Steele Tech reduced to... this. You sigh, glancing up at the stars. Your Codex beeps, but you ignore it. Just another message from [rival.Name] bragging about taking over the company, no doubt. You hardly have time to check up on your old friends, much less dealing with your cousin’s gloating.");
	output("\n\n<i>“New girl! Get those fun bags over here! Me and my friends want a drink!”</i> The bar patrons snap their fingers impatiently, hooting and calling you any number of filthy things as you make your ponderous way toward them.");
	if(delAtTheMess()) output(" Delilah flashes you a sympathetic look, but says nothing, just in case the owner is monitoring the two of you.");
	output(" Careful not to knock anything over, you manage to reach the table and present your endowments to the customers with barely concealed disgust.");
	output("\n\nThe gang of raskvel salvagers laugh with amazement, tittering to themselves over your condition. <i>“What’d I tell you guys? Built like an oil tanker, am I right?”</i> The leader chortles, giving one of your exposed breasts an open-palmed slap. The impact is hard enough to send rippling waves through your [pc.milkNoun]-filled, titantic titflesh. The tidal action builds until your whole body sways from the strike, nearly knocking you to the ground.");
	output("\n\n<i>“Hey new girl, tell my friends how you got outfitted with these military-grade honkers.”</i> You huff, tempted to bash the little fucker’s head against the table, but you hold back. The last thing you need is to be fined another week’s pay for hurting more rude customers. Instead, you simply hold your tongue and wait impatiently. <i>“No? Okay, I’ll tell it,”</i> the asshole declares with a lecherous glare. <i>“You guys feel free to help yourself while I walk you down the sad story of Ms. Mega Milk here.”</i>");
	output("\n\nThe other raskvel need no further permission and they eagerly swarm around you. Small, red scaled hands brazenly grope and grab at your bare chest, grease-covered fingers leaving your mammaries stained as they jockey position for your head-sized nipples. You gasp as they manhandle your sensitive teats, squeezing and biting at your tender peaks until fat blobs of rich lactation bubbles up in warm release.");
	output("\n\n<i>“See, Ms. Dairy Section figured it’d be fun to go messing around in places she wasn’t invited. Way I hear it, she ran into some crazy, malfunctioning nursedroid and it inflated her to.... This,”</i> he snickers, <i>“and the damned thing CHARGED her for it!”</i> The raskvel howl with laughter, while those who had been drinking at the time find [pc.milkNoun] shooting from their noses. A deep flush of embarrassment heats your body, but you refuse to engage. It’ll be over soon. It always is.");
	output("\n\n<i>“The bot sends the bill to JoyCo, right? And they realize the thing’s malfunctioning so they come down to retrieve it. But, get this, they hold the mountain-titted slut to it!”</i> He delivers another stinging slap across your rack and you grit your teeth. <i>“Not even kidding! The fucking robot gives her ballistic-sized knockers and some kinda strengthening treatment just so she can move, and then the company wants their money back!”</i>");
	output("\n\nThe raskvel fondling your leaking breasts have apparently grown bored with simply pawing at you, so they set about more crass entertainments. A pair of them unbuckle their filthy overalls and expose their genital slits. Purple, pointed phalluses creep out and you close your eyes in disgust. This part won’t be over nearly as quickly. The bar patrons slide chairs up to boost their small frames level with your mammoth mounds. Hot pressure gathers at your teats and, embarrassingly easily, the tiny mechanics drive their cocks into your chest. The over-inflated milk ducts part before the assault, welcoming the stiff pricks like greedy pussies.");
	output("\n\nYou can’t hold back the moan and the raskvel erupt into another chorus of mocking whoops. <i>“Listen to her!”</i> one snickers. <i>“What a slut!”</i> another adds. <i>“Bitch loves getting her tits fucked,”</i> a third declares. They rock back and forth, jamming their shafts into your well-worn peaks while their friends cheer them on.");
	output("\n\nYou open your eyes to see the leader of the group enjoying the sight as much as anybody. He catches your eye and presses on. <i>“So she’s gotta pay back millions of creds worth of medical supplies, but she’s too big to even get into her ship. She tries a bunch of stuff, but just can’t make money fast enough to keep up with the interest. She even sells her ship but it’s not enough. And in the end, she’s gotta get a shit job at a dive like this, letting scumbags like us milk her and fuck her all day long. And get this: if she moos, our drinks are on her.”</i>");
	output("\n\nHe leans forward as his friends accelerate, your whole body quivering under the wobbling impacts of their slight frames. <i>“What do ya say, Melon Momma? You gonna moo for us?”</i> [pc.MilkNoun] gushes out of you with each thrust, your face coloring as much from the indignity as from the unbidden and unwelcome orgasm building in your [pc.groin].");
	output("\n\nYou shudder, quivering in place as the wet squelching of the raskvel holds for a moment. Then, with a sighing groan, both of the men release, the hot spunk of their climaxes pouring into your sorely abused breasts in thick, sticky spree. Gouts of [pc.milk] spray everywhere, soaking the little slimeballs in your creamy discharge. Your mouth opens slightly, but you swallow the moaning moo of bliss before anyone can hear it. You stare defiantly as the leader as his friends pull out, their spoo dripping down from your engorged nipples.");
	output("\n\nThe mouthy raskvel shrugs. <i>“Look at all that wasted [pc.milkNoun],”</i> he tuts. <i>“Well guys, better fill her back up!”</i> Two more of the group whip out their pointy penises and mount the chairs for very sloppy seconds. <i>“Once isn’t enough for a classy gal like this. You really gotta romance her!”</i> The crew cheer and set about slapping your throbbing breasts like a drum circle. <i>“Come on, guys! Let’s make her moo!”</i>");
	output("\n\nJust twelve more months until you’re all paid up, you assure yourself. Just forty-eight weeks. Gritting your teeth, you ball a fist until your knuckles crack. Well... what’s one more week, you reason. With tremendous satisfaction, you haul off and hit the raskvel hard enough to send him flying across the bar.");

	processTime(129600);
	pc.orgasm();
	
	badEnd("GAME OVER.");
}

//Dolled (Doll Maker battle)
public function dolledBadEnd():void
{
	userInterface.hideNPCStats();
	userInterface.leftBarDefaults();
	generateMap();
	
	clearOutput();
	showDollmaker();
	author("Adjatha");
	var bimbo:Boolean = pc.isBimbo();
	output("<i>“Ah, you’ll be such a pretty doll by the time we’re done, Fuck Stain.”</i> The perverse machine briskly checks its clamps, making sure each one has locked securely. ");
	if(!bimbo) output("You twist and pull, but the device has bound you as securely as its hydraulic limbs will allow. ");
	output("<i>“I feel like you will be my masterpiece, Jizz Junkie. Something beautiful to leave to the world as my legacy.”</i>");

	if(!bimbo) output("\n\nYou can no longer fight against the whirling arms arrayed against you, but at least you can throw its abuse back at it. <i>“What does a dickless droid like you even want dolls for, anyway? You’re a glorified garbage-picker!”</i>");
	else output("\n\nYou giggle and wiggle in the droid’s steel tendrils. <i>“This is kinda exciting! I don’t get to go in big, fancy machines like you very often! Is there, like, a button I hit or something? Can you set it to max power?”</i>");

	if(!bimbo) output("\n\nThe artificial voice turns insufferably cheery. <i>“And I picked you,”</i> it replies, booping you on the nose with one of its weaponized medical tools.");
	else output("\n\n<i>“You might be my very favorite,”</i> it replies, booping you on the nose with one of its weaponized medical tool.");
	output(" <i>“Ah, but we have fun. To business!”</i>");

	if(!bimbo) output("\n\n<i>“To business!”</i> you echo cheerfully, looking around for shots.");

	output("\n\nThe robotic sentry runs through a diagnostic of its devices, one by one, flourishing each tool before your eyes for a moment before switching to the next. <i>“I think we’ll save the IQ-B-Gone for last,”</i> it decides with cloy delight, wiggling the syringe limb to show off the ominous liquid sloshing inside it. The needle pulls back just far enough for it to barely stay in the periphery of your vision. <i>“In fact, I don’t think we need to bother with that little guy at all. Unless, of course, you really really want it. If you beg for it, I guess I won’t have any choice, my dear Pole Polisher.”</i>");

	if(!bimbo) output("\n\nYou internally wince at the implication, but don’t let the nervousness touch your defiant spirit. <i>“I’d say you could jam that needle up your own ass, but you don’t even have that. At least when Badger has a victim, she can enjoy the fruits of her labors. What are you going to do? Jack off a diode?”</i>");
	else output("\n\nYou screw your expression into confused innocence. <i>“I still have, like, IQ points? Gosh! I never knew! I’d better tell Doc Badger!”</i>");

	if(!bimbo) output("\n\n<i>“Ho ho! So mouthy. I’d hate to rob you of that fire, but I’m really going to enjoy the breaking point. ");
	else output("\n\n<i>“Such a diligent little bimbo.”</i> The a metal claw pats you affectionately on the head. <i>“");
	output("But, since you mention Doctor Badger, let’s start with her personal favorite.”</i> A ray-gun shaped appendage levels itself at your [pc.chest], a glowing green radiance crackling from its power supply.");

	output("\n\n<i>“Now, a lot of people will tell you that it’s easier to work from the inside out, Cock Hole, but I’ve always been of the opinion that it works better the other way around. Gives you a chance to adjust to your new situation, see?”</i> The Bimboleum Emitter clicks, spitting a hazy, pink mist from its antennae-shaped barrel. The mist coalesces into a vague ring shape which lazily drifts toward you.");
	output("\n\nInstinctively, you wince away from the gaseous shape, and are surprised to see the cloud maintain its cohesion as it weightlessly collides with you. The mist seeps into your [pc.skinFurScales] as if you were no more than a hologram and passes through you painlessly. Blinking, you twist and try to see what’s changed, but nothing seems to have happened.");
	if(!bimbo) output(" <i>“I think you’re running on fumes,”</i> you taunt you captor.");
	else output(" <i>“Aw, don’t feel bad. I hear it happens to a lot of guys.”</i>");

	output("\n\n<i>“Oh, give it a minute, Hungry Whore.”</i> Some of the robots free arms click together in gleeful anticipation. Your reply is cut off even before it begins as a sweltering heat floods your flesh, leaving you feeling like a microwaved marshmallow. The transformative radiation prickles at your skin as your body drinks it in like a sponge, bloating and swelling with each passing moment. You ");
	if(!bimbo) output("struggle vainly");
	else output("coo in delight");
	output(" as your " + (pc.hasBreasts() ? "chest" : "[pc.chest]") + " inflates, breasts ballooning almost cartoonishly to levels that would leave porn stars shaking their heads. You groan as the rest of your body grows in proportion with your hefty spheres, leaving an itchy sensation crawling through you. Your [pc.ass] fattens as your [pc.hips] widen.");
	if(pc.lipRating() < 8) output(" Even your lips thicken into a whorish pucker that can’t help but form a heavy, ‘O’-shaped ring.");

	output("\n\nAnd yet, despite all this growth, you can feel parts of you shrinking as well. Your waist narrows like the spout of an hourglass, leaving you completely off-balance. Were it not for the limbs holding you aloft, you’d be hard-pressed to stay standing like this.");
	if(pc.legCount > 1) output(" Your [pc.feet] seem to be shrinking, too. You try to kick against the hobbling alterations, but nothing you do can stop the adjustments.");
	if(pc.hasTail() && pc.hasTailFlag(GLOBAL.FLAG_LONG))
	{
		output(" Even your [pc.tails] can’t escape the indignity of the transformation. ");
		if(pc.tailCount == 1) output("It shrinks, losing mass rapidly until it’s barely 4 inches long");
		else output("They shrink, losing mass rapidly until they’re barely 4 inches long");
		output(", wiggling feebly from the expanded nest of your massive posterior.");
	}
	output("\n\nBy the time the changes end, you feel like you’ve been stuffed into a slut-suit, and not one from a classy holo vid either. Your body jiggles with every breath and you feel like even a strong breeze would knock you over. The changes are so sweeping, it barely feels like your body anymore. More like your mind has been moved to some synthetic lovedoll, manufactured by somebody with only a vague understanding of biology.");

	processTime(10);
	pc.lust(20);
	
	pc.removeAll();
	
	var i:int = 0;
	for(i = 0; i < pc.breastRows.length; i++)
	{
		if(pc.breastRows[i].breastRatingRaw < 45) pc.breastRows[i].breastRatingRaw = 45;
		else pc.breastRows[i].breastRatingRaw += 5;
		//if(pc.breastRows[i].nippleType != GLOBAL.NIPPLE_TYPE_NORMAL) pc.breastRows[i].nippleType = GLOBAL.NIPPLE_TYPE_NORMAL;
	}
	if(pc.hipRatingRaw < 12) pc.hipRatingRaw = 12;
	else pc.hipRatingRaw += 3;
	if(pc.buttRatingRaw < 16) pc.buttRatingRaw = 16;
	else pc.buttRatingRaw += 3;
	if(pc.hasTail()) pc.removeTailFlag(GLOBAL.FLAG_LONG);
	if(pc.thickness > 25) pc.thickness = 25;
	if(pc.tone > 25) pc.tone = 25;
	if(pc.bellyRatingRaw > 0) pc.bellyRatingRaw = 0;
	if(pc.physique() > 15) pc.physique(15, true);
	
	clearMenu();
	addButton(0,"Next",dolledBadEnd2);
}

public function dolledBadEnd2():void
{
	clearOutput();
	showDollmaker();
	author("Adjatha");
	var bimbo:Boolean = pc.isBimbo();
	if(pc.lipRating() < 8)
	{
		while(pc.lipRating() < 8) { pc.lipMod++; }
		output("It takes a few tries to adjust to your new, dick-sucking lips, but you manage to stop slurring and mumbling before long. ");
	}
	if(!bimbo) output("<i>“This is your big masterpiece,”</i> you scoff. <i>“A horny teenager could do better. And this is nothing a quick gene treatment won’t fix anyway. Congratulations, you rusty scrap pile, you’ve done nothing but waste my time.”</i>");
	else output("<i>“Woah! Like, way awesome! I feel like I could make people cream themselves with a look. But, like, could we get on with the fucking? I wanna break in the new me!”</i>");

	output("\n\nThe Doll Maker seems to be mostly ignoring you however, as it’s too caught up in a celebration of its own work. <i>“Ooooh, I do so love a job well done!”</i> It spins around, taking a full circuit of your changes. <i>“Damned fine work, if I do say so myself. Finally starting to look the part, eh Breeding Bitch?”</i>");

	output("\n\n A disturbing, electric titter screeches out if its vox. <i>“Ah, but what’s next? So many options.”</i> One of the clamps pinches one of your [pc.nipple], but you can barely feel it through all the fleshy padding. <i>“Oh, this won’t do. How about we ratchet up your sensitivity? No sense in having bolted on tits, if they’re no fun to play with.”</i>");

	output("\n\nA stainless steel limb that looks like a wide-barrelled pistol moves around your body slowly, firing with a soft ‘thoomp’ as it deploys its payload. Each shot leaves a small, bead-shaped pill stuck to your body. It speeds up, firing faster and faster, attaching beads to your lips, your shoulders, across your breasts, on your hips, and several on your [pc.groin]. The tiny impacts leave your skin stinging, but otherwise unaffected.");

	output("\n\nNext, it deploys a pair of shallow plates on either side of your head. They hum and click on, spreading a pale pink holo visor over your field of vision. The screen flickers to life and graphic, unforgivable pornography flows across your eyes at an incredible pace. Your brain can’t parse what’s happening, but your body certainly can. The bean-shaped beads attached to you surge to life, vibrating at variable intensities with each passing scene, putting you directly in the middle of an endless parade of sexual over-indulgence.");

	if(!bimbo) output("\n\nYou fight against the tide of pornographic brainwashing, but your treacherous body saps away your will to resist. Your bimbo-bloated proportions seem perfectly made for just such hedonistic abandon. Twitching bliss seethes under your skin and even attempts to hold your eyes shut are useless against the buzzing visor, which seems to project its re-educational programming directly onto the canvas of your mind. Even more maddeningly: every time you’re close to release, the vibes cut off, leaving you panting in a suffocating ocean of desire.");
	else output("\n\n<i>“Ooooh!”</i> sigh as the tide of eye-watering erotica washes over you. <i>“Yay, creampies! Oh, nipple-fucking! Yum, triple penetration!”</i> Despite its break-neck pace, you manage to follow along with the help of the vibes. <i>“You know, if this Doll-thingy doesn’t work out for you, you could totally be a GREAT porn theater!”</i>");

	output("\n\nAfter an hour of the teasing, edging display, the visor finally goes blank and the vibes fall silent. <i>“Let’s see if the piggy is quite ready to become bacon,”</i> the Doll Maker muses. A tiny, metallic hand lowers down and plucks each pinkie-sized vibrator from your body. At every touch, your body shudders, brought to near climax by the slightest caressing contact. Your half-hearted attempts at speech are cut off by the gasping, breathless ecstasy of being used so carelessly. ");
	if(!bimbo) output("You try to whisper denial to yourself,");
	else output("You try to ask the robot to turn it back on,");
	output(" but all you can think about is being manhandled by anyone and everyone who might happen to pass within arm’s reach.");

	output("\n\n<i>“My my, what progress. And so quickly, too! Most people hold out for days or weeks. Interesting that you succumbed almost immediately. I guess we both know what that means, eh Goo Gulper?”</i> ");
	if(!bimbo) output("There’s no fight left in you. All you can do is take the abuse and hope that you can cum soon. No! Hope that it’s over soon. Ugh, the room seems to be spinning around you too quickly to police your thoughts anymore.");
	else output("Heck yeah, you know what that means! It means you’re a talented slut who gets things done! You’re dang good at being the sexiest bitch around and just as soon as you finish up here, you’re gonna go fuck all of Tarkus! Twice!");

	output("\n\nThe autonomous rig circles around you appreciatively. <i>“Well, you look like a sex doll, you think like a sex doll, and your body knows it’s a sex doll. I guess we’ll just move to the final step then and take care of the last few finishing touches.”</i> A host of paint-filled squirt guns surround you, red latex leaking from their nozzles. <i>“I can honestly say I wish we had more time together, Fuck Fest. You were definitely my best.”</i>");

	output("\n\nOne by one, the sprayguns fire, warm blobs of scarlet splattering across your body like gooey, melted wax, clumping together and dripping in thin trickles all over your exposed [pc.skinFurScales]. The pressure of your tantalizingly close orgasm overflows and your body jerks in its padded restraints, climaxing with every glistening squirt. You pant and gasp at first, but before long, you’re screaming your orgasms for all your lungs are worth as, inch by inch, your lower body is coated in the shiny, crimson shell.");
	if(pc.hasLegs() && !pc.hasLegFlag(GLOBAL.FLAG_HEELS)) output(" A pair of 8-inch high heels are fitted onto your [pc.feet] as the goo cools across you, sealing you in fuck-me pumps that hobble you even further.");

	output("\n\nAs your body is covered in latex, a pair of heat lamps descend to help out. Somewhere, lost in the daze of your endlessly repeating orgasm, you notice these lamps have been marked “Brain Melt,” but you can’t think about that very closely. All that matters is the encasing fluid, the glorious euphoria, and the weird heat building in your chest. A limb pops a cork in your mouth so the latex doesn’t flow into your drooling gob and the next moment, your vision is cut off by the dripping, hardening slime.");

	processTime(70);
	pc.lust(10000);
	
	if(pc.willpower() > 5) pc.willpower(5, true);
	if(pc.hasLegs() && !pc.hasLegFlag(GLOBAL.FLAG_HEELS))
	{
		pc.legType = GLOBAL.TYPE_SUCCUBUS;
		pc.clearLegFlags();
		pc.addLegFlag(GLOBAL.FLAG_PLANTIGRADE);
		pc.addLegFlag(GLOBAL.FLAG_HEELS);
	}
	pc.skinType = GLOBAL.SKIN_TYPE_LATEX;
	pc.clearSkinFlags();
	pc.addSkinFlag(GLOBAL.FLAG_SMOOTH);
	pc.skinTone = "red";
	
	clearMenu();
	addButton(0,"Next",dolledBadEnd3)
}

public function dolledBadEnd3():void
{
	moveTo("GAME OVER");
	
	if(pc.intelligence() > 0) pc.intelligence(0, true);
	
	clearOutput();
	showBust("");
	showName("ALL\nDOLLED UP");
	author("Adjatha");
	var bimbo:Boolean = pc.isBimbo();
	output("The red latex sex doll causes quite a little stir among the scavenging denizens of Tarkus when it’s found. Unlike most of the sexbots on the scrap planet, this one seems to be in nearly perfect working order. Its gyro stabilizers seem off, since it can barely stand and walk, but its owners are too afraid of damaging the beautiful construction to pop it open for repairs. The doll’s programming is top-notch; it moans when you touch it and it creams itself with when handled roughly.");
	output("\n\nNo one looks too deeply into its similarity to that off-worlder who came through a while back. It doesn’t pay to ask questions and the red latex doll commands quite a high price once word gets out. The scavenging raskvel get vigorous satisfaction from it before selling it off to the gabilani for a tidy sum. They, in turn, make up their money tenfold by renting the doll out to any and every traveler who happens to be passing through their orbital stations. That is, until it’s stolen out from under them by a roguish pair of lapinara, who in turn, lose it to a gang of aggressive sydians. On and on, the sexdoll travels the legth and breadth of Tarkus, bloating with the endless loads of the ever horny natives.");
	output("\n\nIn the end, the red latex doll makes its way into the galaxy-spanning brothel empire of Bethany Carver herself. It’s moved off-world from one whore house to the next, gathering renown and rumors in equal proportion. Some claim it to be the finest synthetic of all time, but Ms. Carver keeps her favorite “employee” away from those who want to do a little aggressive reverse-engineering. The doll is one of a kind, she simply explains with a little smile. And while no one is allowed to look inside, everyone with enough credits is welcome to try it out for themselves.");
	output("\n\nAnd so they do. Again and again.");
	//[Bad End]
	processTime(30000);
	badEnd("GAME OVER.");
}

//Badger’s Assistant (normal badger only)
//(player is bimbo’d if not already, made hourglass figure, bimbo Jill, claim inheritance, undermine the UGS one slut at a time)
public function drBadgersAssistantBadEnd():void
{
	clearOutput();
	showDrBadger();
	author("Adjatha");
	output("When you come to, you find yourself firmly locked in a reinforced restraining chair. You jerk and try to pull free, but the structure seems to have been built to hold down creatures twice your size. An ache in your jaw and pressure on your throat and tongue tells you that some kind of gag has been jammed into your mouth, muffling any cries for help you might be tempted to make. Even your hands have been locked down, heavy rubber spheres squeezing your fists like the worst pair of mittens you’ve ever seen.");
	output("\n\n<i>“Ah, we finally awake Nurse Steele?”</i> Badger chirps, craning her fuzzy face into view from just behind you. <i>“I don’t want you to think I’m a slave driver or anything, but I’m going to have to dock your pay if you keep passing out,”</i> she chides, plump lips pursing in a concerned frown.");
	output("\n\nSpying the confusion in your eyes, Doctor Badger sighs with exasperation. <i>“This again. Alright, let’s blow through it real quick. Yes, you’re still in my lab. No, this isn’t the first time you’ve woken up. Yes, we’ve been tweaking you. No, you’re not done yet. Good enough? Alright, let’s try to finish you up.”</i> There is a pressure on your [pc.asshole] and a sensation of hot, sticky fluid being forced into your gut in spurting loads. You shudder and squirm but can do little and less as your abdomen swells under the liquid burden.");
	output("\n\nBehind you, the mad doctor lets out a satisfied sigh of relief. <i>“Ah, I fuckin’ love administering suppositories. Better keep it in for a bit, so you don’t miss out on even an ounce of that good medicine,”</i> she teases, tweaking your [pc.ears] playfully.");
	output("\n\n<i>“How do you feel, Nurse Steele?”</i> You shout something at her, but the gag reduces you to gurgles and drooling babble. <i>“Oh, very interesting. Yes, that is normal but I assure you, you’ll be feeling so much better in practically no time at all.”</i> She casually gropes your [pc.ass] with a clawed hand, humming to herself as she kneads the thickening dough of your swollen rump.");
	output("\n\nA wave of dizziness overtakes you, but you’re pulled back from unconsciousness as the doctor delivers a painful, open-palmed slap to your posterior. <i>“Hey! What’d I say about passing out! This is the most important moment in your otherwise unremarkable life and you’re going to sleep through it?”</i> Your head lurches and your vision blurs, but Badger keeps up her spanking assault. <i>“You’re! Going! To! Love! This!”</i>");
	output("\n\nActually, you kind of are. Every spank brings the same sharp, arresting pain as the one before it, but a strange, creeping pleasure seems to build right alongside it. At first, the thought of getting off on being spanked seems perverse, but with each slap, your chest tightens");
	if(pc.hasGenitals() || pc.balls > 0)
	{
		output(" and your [pc.groin] tense");
		if((pc.totalGenitals() + pc.balls) == 1) output("s");
	}
	output(". You have to admit, you were being pretty naughty, passing out when the doctor is trying to work. What kind of a nurse just falls asleep in the middle of an operation?");

	output("\n\nThe throbbing heat of her hand stings so good, you audibly moan in disappointment when she finally stops. <i>“Damn, Nurse Steele, you’re a real glutton for punishment, huh? I’m going to have to come up with some kind of automatic spanking machine,”</i> she muses. <i>“Oh wait, of course I already have one of those.”</i>");

	output("\n\nA click and whir is all the warning you get before an unseen device surges to life, whipping flexible rubber sheets across your overly sensitive [pc.ass]. The noise that bubbles up from the back of your throat sounds more like a hog in heat than the kind of cry a corporate " + pc.mf("heir","heiress") + " would produce.");
	output("\n\n<i>“So tight!”</i> Badger marvels. <i>“I think you’re about ready for another dose.”</i> The firm, warm pressure in your [pc.asshole] relents just long enough for a cold pill the size of a thumb to slip in. <i>“We’re going to have so much fun together,”</i> the mad scientist promises as she jams her too-thick bitch breaker up your ass again, pumping thrusts driving the pill ever deeper into your gut.");

	processTime(100);
	pc.lust(1000);
	
	pc.removeAll();
	
	var i:int = 0;
	for(i = 0; i < pc.breastRows.length; i++)
	{
		if(pc.breastRows[i].breastRatingRaw < 22) pc.breastRows[i].breastRatingRaw = 22;
		else pc.breastRows[i].breastRatingRaw += 2;
	}
	if(pc.hipRatingRaw < 6) pc.hipRatingRaw = 6;
	else pc.hipRatingRaw += 1;
	if(pc.buttRatingRaw < 8) pc.buttRatingRaw = 8;
	else pc.buttRatingRaw += 1;
	if(pc.willpower() > 10) pc.willpower(10, true);
	
	clearMenu();
	addButton(0,"Next",drBadgersAssistantBadEnd2);
}

public function drBadgersAssistantBadEnd2():void
{
	clearOutput();
	showName("THE DOCTOR’S\nASSISSTANT");
	showBust("DRBADGER_NUDE", rivalBustDisplay());
	author("Adjatha");
	output("Weeks later, Doctor Badger calls you into her office. The two of you have been inseparable since the job offer, working long hours to perfect her science. Just about the only break the two of you take is just long enough for the doctor to pound a fresh, fattening load or three of badger spunk into whichever hole strikes her fancy.");
	output("\n\nIt’s been hard work, but the two of you finally tracked down your cousin, [rival.name]. The dumb slut always did put too much faith in bodyguards. Your cousin struggles against [rival.hisHer] bindings, alternately threatening and cajoling Doctor Badger, promising anything and everything to be set free. When you step into sight, [rival.hisHer] eyes go wide.");
	output("\n\n<i>“[pc.name]? Is that you? What... what happened?”</i> You reply with a little laugh and turn in place to show off your vastly improved frame. You can tell the doctor went through great lengths to improve her technology, and of course she needed a test subject. [pc.HairColor] hair hangs down in bouncy curls, framing the feminine features of your [pc.skinColor] face. Your lips are thick, pronounced, and glistening like the surface of a gumball. Tits so huge and perfectly round that they could never be mistaken for natural hang from your chest with a heavy jiggle. Counter balancing your absurd breasts is your melon-sized ass cheeks that leaves you looking like an off-kilter hourglass. Your whole, bimbo-bloated proportions have been squeezed into a pink nurse’s uniform so skimpy and tight that every breath sends a dangerous strain through your double-breasted buttons.");
	output("\n\n<i>“Why, thank you for noticing, [rival.name]! We’re both very proud at how I’ve come out, aren’t we, Doctor?”</i>");
	
	pc.armor = new NurseOutfit();
	
	var i:int = 0;
	if(pc.femininity < 75) pc.femininity = 75;
	while(pc.lipRating() < 6) { pc.lipMod++; }
	pc.lipColor = "glittery pink";
	pc.hairType = GLOBAL.HAIR_TYPE_REGULAR;
	if(pc.hairLength < 12) pc.hairLength = 12;
	pc.hairStyle = "curly";
	for(i = 0; i < pc.breastRows.length; i++)
	{
		if(pc.breastRows[i].breastRatingRaw < 45) pc.breastRows[i].breastRatingRaw = 45;
		else pc.breastRows[i].breastRatingRaw += 3;
	}
	if(pc.hipRatingRaw < 15) pc.hipRatingRaw = 15;
	else pc.hipRatingRaw += 3;
	if(pc.buttRatingRaw < 18) pc.buttRatingRaw = 18;
	else pc.buttRatingRaw += 3;
	if(pc.bellyRatingRaw > 0) pc.bellyRatingRaw = 0;
	
	if(!pc.hasPerk("Easy")) pc.createPerk("Easy",20,0,0,0,"Gain 20% more lust from combat sources.");
	if(!pc.hasPerk("Inhuman Desire")) pc.createPerk("Inhuman Desire",15,0,0,0,"Increases maximum lust by 15.");
	if(!pc.hasPerk("Breed Hungry")) pc.createPerk("Breed Hungry",15,0,0,0,"Increases speed that semen is created at and the pregnancy speed.");
	if(!pc.hasPerk("Ditz Speech")) pc.createPerk("Ditz Speech",0,0,0,0,"Alters dialogue in certain scenes.");
	if(pc.libido() < 30) pc.libido(10);
	if(pc.libido() < 50) pc.libido(10);
	if(pc.libido() < 70) pc.libido(10);
	
	output("\n\n<i>“You bet your sweet fanny we are,”</i> Badger agrees, licking her lips as she hoists a rifle-sized device.");
	output("\n\n<i>“And all this, just to perfect the Bimbo Blaster,”</i> you add cheerfully, draping your hands around your cousin’s neck. <i>“You get to be the first field trial, so we’re all very excited.”</i>");
	output("\n\n<i>“Wait wait!”</i> Your cousin shouts, panic rising in [rival.hisHer] voice. <i>“I could be a partner! Join up and help you find more test subjects! Use the inheritance to-”</i>");
	output("\n\nYou giggle into your palm. <i>“The inheritance? Why do you think we got you as a test subject? After we zap ya, we can round up the rest of dad’s stuff easily enough. Then I’ll claim the company and liquidate it. Use the money to help the Doctor, you see? She’s got so many amazing ideas! With a little cash we could turn the whole galaxy into bimbos, one by one.”</i>");
	output("\n\nYou pat your cousin’s cheek, tenderly. <i>“I got to be first, of course, but you can be second, just like you were always meant to be.”</i> Doctor Badger pulls her goggles over her eyes and levels the vastly upgraded bimbo gun at your cousin’s face. <i>“See you on the other side,”</i> you add in a sing song tone.");
	output("\n\nBadger pulls the trigger the first of many, many times.");
	
	processTime(100000);
	
	badEnd("GAME OVER.");
}


// Silicone Stuffing
// By Natetheman223 and Kirorororo.
/*
Origin story or something
Everyone with a silicone fetish in the house say yeah!

A few vacant “yeah”s are heard before silence.

So... uh... yeah. You know Nym-Foe? Character that you encounter during the Pexiga quest? The one that bloats you with silicone mid-fight? You know what I’m talking about.

Anyway, you trash her and never see her again... but, in the very next scene, it briefly mentions hefty silicone tanks with injectors for easy inflation in Badger’s lab. You thinking what I’m thinking? Finishing the quest, then being able to come back and inflate/deflate yourself whenever?

How it goes
You talk to Badger after the quest and ask her if you can look around her lab. She reluctantly lets you, and then you can use the silicone tank to fill yourself. Or, if you didn’t have the inventory space before, you can pick up anything that Nym-Foe or the Doll Maker dropped. Low key, they did drop seven items altogether. Totally understandable if you didn’t have the inventory upgrades yet.

Let’s write some scenes.
*/

public function drBadgerLookAroundButton(btnSlot:int = 5):void
{
	if(flags["PEXIGA_TREATMENT"] >= 1)
	{
		// if Badger is a bimbo, skip this and go straight to the tank.
		if(chars["DRBADGER"].isBimbo() || flags["BADGER_LAB_UNLOCKED"] != undefined || !drBadgerAtBimbotorium()) addButton(btnSlot, "Laboratory", drBadgerEnterLaboratory, undefined, "Laboratory", "Browse the lower floor of Doctor Badger’s lab.");
		else addButton(btnSlot, "Look Around", drBadgerLookAroundLab, undefined, "Look Around", "Ask Doctor Badger if you can look through her lab.");
	}
}
// Look Around
// new button in Badger’s menu when the pexiga quest is finished
public function drBadgerLookAroundLab():void
{
	clearOutput();
	showDrBadger();
	
	if(pc.isBimbo())
	{
		author("Kirorororo");
		
		output("You walk on past Doctor Badger, she only stops you for a second to say, <i>“Have fun in there...”</i> ambiguously. After that, you’re free to enter.");
		output("\n\n<i>“No worries, Miss Badger!”</i> you exclaim. Into the deeper parts of her lair you go.");
	}
	else
	{
		author("Natetheman223");
		
		output("You’re about to walk past Doctor Badger to get a full look around, but she stops you with an arm, nearly clotheslining you.");
		output("\n\n<i>“What are you doing?”</i> she asks, looking over at you with discontent.");
		output("\n\n<i>“Just looking around. Don’t mind me,”</i> you say.");
		output("\n\n<i>“You know what’ll happen if you break anything, right?”</i> she states, which sounds more like a threat. You’re smart enough to know it would be rapid bimbofication, so you nod calmly. She brings her arm down to let you pass.");
		output("\n\nYou walk on through to the deeper parts of her lair.");
	}
	output("\n\n");
	
	processTime(2);
	
	clearMenu();
	addButton(0, "Next", drBadgerEnterLaboratory);
}
public function drBadgerEnterLaboratory():void
{
	if(flags["BADGER_LAB_UNLOCKED"] == undefined) flags["BADGER_LAB_UNLOCKED"] = 1;
	move("BIMBOTORIUM LAB");
}
public function drBadgerLaboratoryBonus():Boolean
{
	author("Natetheman223");
	
	output("You are in the deeper areas of the lab");
	if(flags["NYM-FOE"] >= 2 || flags["DOLLMAKER_STATUS"] == -1)
	{
		output(", where");
		if(flags["NYM-FOE"] >= 2) output(" Nym-Foe");
		if(flags["NYM-FOE"] >= 2 && flags["DOLLMAKER_STATUS"] == -1) output(" and");
		if(flags["DOLLMAKER_STATUS"] == -1) output(" the Doll Maker");
		output(" lay dormant");
	}
	output(".");
	// Nym-Foe guarding the back lab
	if(flags["NYM-FOE"] >= 2 && flags["NYM-FOE_ACTIVATED"] != undefined)
	{
		output("\n\nNym-Foe is standing in front of you, going back to guard duty since you weren’t able to beat her last time.");
		if(pc.statusEffectv3("Nym-Foe Injections") > 0) output(" The silicone in your [pc.chest] reminds you of the event.");
		output(" If you want to continue using the lab, you’re going to have to disable the nursedroid however you can.");
	}
	else if(flags["NYM-FOE"] >= 2 || flags["DOLLMAKER_STATUS"] == -1)
	{
		output(" You could have a look at " + ((flags["NYM-FOE"] >= 2 && flags["DOLLMAKER_STATUS"] == -1) ? "them" : "it") + " if you so desired");
		if(flags["DOLLMAKER_PROTECC_NYM-FOE"] != undefined) output("--that is, if the Doll Maker wasn’t so protective of the nursedroid at the moment--");
		else output(", ");
		output("but there may be better things to observe in a lab like this. Such as the practically towering piles of junk lying about, their purposes unknown... well, sort of unknown. It doesn’t take a rocket scientist to guess what Doctor Badger would use this sort of stuff for.");
	}
	if(pc.hasStatusEffect("Doll Maker Repair Timer")) output("\n\n<i>The Doll Maker machine is currently repairing itself.</i>");
	// Note: Items can only be salvaged during the combat sequence.
	//output(" You could salvage their items if you haven’t already.");
	output("\n\nThere’s also a huge tank of silicone off to the side");
	if(flags["NYM-FOE"] >= 2) output(", that could be useful..");
	output(".");
	output("\n\n");
	
	// [Nym-Foe] [Doll Maker] [SiliconeTank] [Leave]
	// Choosing either character just brings up their menu that has their equipment when you beat them
	// Leaving just puts you back into navigation at Badger’s front
	if(flags["NYM-FOE"] != undefined)
	{
		if(flags["NYM-FOE_ACTIVATED"] != undefined) addButton(0, "Fight NymF.", fightTheNymfoe, undefined, "Fight Nym-Foe", "Challenge the nurse sex-bot!");
		else if(flags["DOLLMAKER_PROTECC_NYM-FOE"] != undefined) addDisabledButton(0, "Nym-Foe", "Nym-Foe", "You cannot interact with the nurse at the moment while the Doll Maker is on guard.");
		else if(flags["NYM-FOE_DISABLED"] == undefined) addButton(0, "Nym-Foe", drBadgerLabNymFoe, undefined, "Nym-Foe", "Have a look at the big-titted nurse droid.");
		else addDisabledButton(0, "Nym-Foe", "Nym-Foe", "You cannot interact with this at the moment.");
	}
	if(flags["DOLLMAKER_STATUS"] != undefined)
	{
		if(flags["NYM-FOE_ACTIVATED"] != undefined) addDisabledButton(1, "Doll Maker", "Doll Maker", "It might not be a good idea to use this while the nurse-bot is on guard...");
		else if(pc.hasStatusEffect("Doll Maker Repair Timer")) addDisabledButton(1, "Doll Maker", "Doll Maker", "The Doll Maker is making repairs--better leave it alone for now.");
		else if(flags["DOLLMAKER_ACTIVATED"] != undefined)
		{
			if(hasDollMakerEffect(pc)) addDisabledButton(1, "Fight DollM.", "Fight Doll Maker", "You cannot fight the Doll Maker while currently under its side-effects.");
			else addButton(1, "Fight DollM.", fightTheDollmaker, undefined, "Fight Doll Maker", "Fight the Doll Maker.");
		}
		else if(flags["DOLLMAKER_DISABLED"] == undefined) addButton(1, "Doll Maker", drBadgerLabDollMaker, undefined, "Doll Maker", "Have a look at the Doll Maker.");
		else addDisabledButton(1, "Doll Maker", "Doll Maker", "You cannot interact with this at the moment.");
	}
	if(pexigaRecruited())
	{
		if(flags["NYM-FOE_ACTIVATED"] != undefined) addDisabledButton(2, "Strange Ball", "Brainwashing Ball", "It might not be a good idea to use this while the nurse-bot is on guard...");
		else if(flags["BRAINWASHINGBALL_DISABLED"] == undefined) addButton(2, "Strange Ball", drBadgerLabStrangeBall, undefined, "Brainwashing Ball", "Isn’t that the thing Badger used to bimbofy the pexiga?");
		else addDisabledButton(2, "Strange Ball", "Brainwashing Ball", "You cannot interact with this at the moment.");
	}
	if(flags["NYM-FOE"] >= 2)
	{
		if(flags["NYM-FOE_ACTIVATED"] != undefined) addDisabledButton(3, "SiliconeTank", "Silicone Tank", "It might not be a good idea to use this while the nurse-bot is on guard...");
		else addButton(3, "SiliconeTank", drBadgerSiliconeTank, undefined, "Silicone Tank", "Have a look at Doctor Badger’s silicone tanks.");
	}
	
	return false;
}

public function drBadgerFixNymFoeButton(btnSlot:int = 3):void
{
	if(pexigaQuestDocChatsAvailable()) return;
	if(flags["NYM-FOE"] >= 3 && flags["NYM-FOE_DISASSEMBLED"] != undefined)
	{
		// Nym-Foe cannot be fixed if both parties are too stupid to figure out how; hence why there’s no bimbo badger and bimbo player variant.
		if(chars["DRBADGER"].isBimbo() && pc.isBimbo()) addDisabledButton(btnSlot,"Fix NymFoe","Fix Nym-Foe","Umm... like, why would you need to think about this again?");
		else if(flags["NYM-FOE_REPAIR_QUEST"] == 2 && pc.hasItemByClass(DamagedVIChip)) addDisabledButton(btnSlot,"Fix NymFoe","Fix Nym-Foe","Go ahead, find Nym-Foe and insert the new chip!");
		else if(flags["NYM-FOE_REPAIR_QUEST"] == 1)
		{
			if(pc.hasItemByClass(SexbotChip, 6)) addButton(btnSlot,"Fix NymFoe",drBadgerLabNymFoe,"badger chip","Fix Nym-Foe","Turn in the 6 sexbot VI chips to repair the Nym-Foe.");
			else addDisabledButton(btnSlot,"Fix NymFoe","Fix Nym-Foe","You need at least 6 sexbot VI chips in order to repair the Nym-Foe.");
		}
		else addButton(btnSlot,"Fix NymFoe?",drBadgerLabNymFoe,"badger fix","Fix Nym-Foe?","Ask Doctor Badger about repairing the Nym-Foe.");
	}
}
public function drBadgerBuyNymFoeButton(btnSlot:int = 8):void
{
	if(silly && flags["NYM-FOE"] >= 3 && (flags["NYM-FOE_SILICONE_BOOSTS"] != undefined || flags["NYM-FOE_ACTIVATED"] != undefined || flags["NYM-FOE_FUCKED"] != undefined))
	{
		if(flags["NYM-FOE_DAKIMAKURA_TAKE"] == undefined) addButton(btnSlot,"Buy NymFoe?",drBadgerLabNymFoe,"badger buy","Buy Nym-Foe?","Request to buy the modded nurse bot.");
		else if(flags["NYM-FOE_DAKIMAKURA_TAKE"] == 0) addButton(btnSlot,"Take Pillow",drBadgerLabNymFoe,"pillow take","Take the Nym-Foe Body Pillow","Procure the perverted pillow.");
	}
}

public function drBadgerFixDollMakerButton(btnSlot:int = 4):void
{
	if(flags["DOLLMAKER_DISASSEMBLED"] != undefined)
	{
		if(chars["DRBADGER"].isBimbo()) addDisabledButton(btnSlot,"Fix DollM.","Fix Doll Maker","Doctor Badger does not have enough smarts to do this.");
		else if(flags["DOLLMAKER_DISASSEMBLED"] >= 4) addButton(btnSlot,"Fix DollM.",drBadgerLabDollMaker,"badger fix","Fix Doll Maker","Check with Doctor Badger on the progress of repairing the Doll Maker.");
		else addButton(btnSlot,"Fix DollM.?",drBadgerLabDollMaker,"badger fix","Fix Doll Maker?","Ask Doctor Badger about repairing the Doll Maker.");
	}
}

public function drBadgerBuyTankButton(btnSlot:int = 9):void
{
	if(flags["BADGER_SILICONE_TANK_INSTALLED"] != 1 && flags["BADGER_SILICONE_TANK_USES"] > 0)
	{
		if(flags["BADGER_SILICONE_TANK_INSTALLED"] == undefined) addButton(btnSlot,"BuyS.Tank?",drBadgerSiliconeTankBuy,["intro"],"Buy Sillicone Tank?","Request to buy Doctor Badger’s silicone tank.");
		else if(flags["BADGER_SILICONE_TANK_INSTALLED"] == 0) addButton(btnSlot,"BuyS.Tank",drBadgerSiliconeTankBuy,["intro"],"Buy Sillicone Tank","Buy a silicone tank from Doctor Badger.");
	}
}

public function drBadgerLabNymFoe(response:String = "menu"):void
{
	clearOutput();
	author("Natetheman223");
	clearMenu();
	
	switch(response)
	{
		case "menu":
		case "back":
			showNymFoe();
			
			// Nym-Foe, damaged
			if(flags["NYM-FOE"] >= 2 && (flags["NYM-FOE_DISASSEMBLED"] != undefined || flags["NYM-FOE_FIXED"] == undefined))
			{
				// Nym-Foe, damaged (VI chip taken)
				if(flags["NYM-FOE_CHIP_RETURN"] != undefined || flags["NYM-FOE_LOOT_CHIP"] != undefined || pc.hasItemByClass(DamagedVIChip))
				{
					output("You [pc.walk] over to the alabaster skinned nurse droid. Her eyes are closed, she rests against the wall, butt on the ground with her knees pressed up against her half-deflated chest. Her arms are like that of a lifeless toy, hanging down to her sides with her palms facing up.");
					output("\n\nShe seems very damaged. You confirm your suspicions when you tap on her metal forehead, gauging for a reaction. Nothing. Her body sits there, inactive.");
					output("\n\nMaybe if you still have her VI chip somewhere, you could reactivate her. Otherwise, you’ll have to ask Badger what you need to fix her, though the doctor may have something perverted in mind.");
					output("\n\n");
					
					processTime(1);
					
					// [Insert VI chip] [Loot] [Back]
					if(pc.hasItemByClass(DamagedVIChip)) addButton(0, "Insert Chip", drBadgerLabNymFoe, "insert chip", "Insert V.I. Chip", "Slot the VI chip into the nurse droid.");
					else addDisabledButton(0, "Insert Chip", "Insert V.I. Chip", "You do not have this item!");
					addButton(1, "Loot", salvageNymFoe, undefined, "Loot Nym-Foe", "Salvage some parts from the sex-bot.");
					addButton(14, "Back", mainGameMenu);
					
					// A new option is added to Badger’s menu: [FixNym-Foe?]
					// Inserting the VI chip requires you to have it in your inventory. Otherwise, it’s gray.
					// Loot brings up the menu of items after beating Nym-Foe: 4x silicone, 5x gush, VI chip (grayed out if they were already taken).
					
					if(flags["NYM-FOE"] == undefined || flags["NYM-FOE"] < 3) flags["NYM-FOE"] = 3;
				}
				// Nym-Foe, partially damaged (beaten, VI chip untaken)
				else
				{
					output("You [pc.walk] over to the alabaster skinned nurse droid. Her eyes are closed, she rests against the wall, butt on the ground with her knees pressed up against her half-deflated chest. Her arms are like that of a lifeless toy, hanging down to her sides with her palms facing up.");
					output("\n\nShe’s only partially damaged from the fight. You could perform some maintenance on her to see if you can activate her if you so desire. Alternatively, you could loot anything from her body.");
					output("\n\n");
					
					processTime(1);
					
					addButton(0, "Fix", drBadgerLabNymFoe, "fix", "Fix Nym-Foe", "Attempt to repair the nurse droid.");
					addButton(1, "Loot", salvageNymFoe, undefined, "Loot Nym-Foe", "Salvage some parts from the sex-bot.");
					addButton(14, "Back", mainGameMenu);
				}
			}
			// Nym-Foe, undamaged
			else
			{
				output("You [pc.walk] over to Nym-Foe, who is currently turned off and sitting against the wall, with a rag over her eyes. You could plug her in and uncover her eyes if you want to fight her again... or let her perform an ‘upgrade’ on you.");
				output("\n\n");
				
				processTime(1);
				
				// [Fight] [Upgrade] [Back]
				// Seeing as how Nym-Foe doesn’t have an upward limit when inflating the player during combat, they can get an ‘upgrade’ regardless of how much silicone is in them. Yay for infinity!
				addButton(0, "Fight", drBadgerLabNymFoe, "fight", "Fight Nym-Foe", "Battle the refurbished nurse droid.");
				addButton(1, "Upgrade", drBadgerLabNymFoe, "upgrade", "Get an Upgrade", "Submit to Nym-Foe and let her fill you with as much silicone as she deems necessary.");
				addButton(14, "Back", mainGameMenu);
			}
			break;
		case "insert chip":
			showNymFoe();
			
			output("You reach into your inventory, taking out the salvaged chip. You pause for a second, reflecting on the undeniable fact that she’ll try to pump you full of silicone as soon as she’s up. You take a towel on the floor, which you immediately find out is a cumrag, as it stains your hand with the thick substance (ew), and eventually manage to wrap it around Nym-Foe’s visual processors (or eyes). Next, you pull out the connector linking her to the silicone tank.");
			output("\n\nFinally, you place Nym-Foe’s metallic braid to the side as you place the chip back into the slot at the back of her head. A quiet whirring is heard as she awakens, speaking out loud with a buzz as it adjusts itself, <i>“Does someone need medical assistance?”</i> Her injector tail goes crazy, spurring around as she wakes up. Since she isn’t alimented properly, the small amount of silicone left in her tail shoots out with a weak intensity before splattering on the ground, making a gooey mess. <i>“It seems I have an issue with my medicine storage unit. Please reconnect me so that I may provide treatment. It also appears my visual sensors are defective.”</i>");
			if(silly) output("\n\n<i>“Shhh... It’ll all be over soon,”</i> you whisper into Nym-Foe’s ears, your hands wrapped tightly around her neck.");
			output("\n\nNym-Foe attempts to raise up a few times, but you keep her pinned down. After a few seconds, she buzzes out, <i>“ERROR FOUND WHEN ATTEMPTING FUNCTION ‘STAND’. ENTERING STATIONARY SHUTDOWN DUE TO SEVERAL SIMULTANEOUS ERRORS.”</i> And with that, the lights behind the rag dim down, definitely from her visual processors shutting off.");
			output("\n\n<b>It seems Nym-Foe is fixed. You could unbind her at any time to let her awaken, or even connect her to the silicone tank if you wanted to fight her again.</b>");
			output("\n\n");
			
			processTime(3);
			
			flags["NYM-FOE_LOOT_CHIP"] = undefined;
			pc.destroyItemByClass(DamagedVIChip);
			
			flags["NYM-FOE_DISASSEMBLED"] = undefined;
			flags["NYM-FOE_FIXED"] = 1;
			
			// Clear quest if using looted chip
			if(flags["NYM-FOE_REPAIR_QUEST"] == 1) flags["NYM-FOE_REPAIR_QUEST"] = undefined;
			// Complete quest
			if(flags["NYM-FOE_REPAIR_QUEST"] == 2) flags["NYM-FOE_REPAIR_QUEST"] = 3;
			
			// [Next]
			// Next puts the player in normal lab screen.
			// This scene can technically be repeated if the player loots her VI chip and then puts it back in
			addButton(0, "Next", mainGameMenu);
			break;
		case "fix":
			showNymFoe();
			
			output("You look down at the robot. She can’t be THAT broken, right? You crouch down near her, tapping her on the head. Her eyes light up almost instantly, making you reel your hand back.");
			if(silly) output(" <i>“Surprise cupcake! I’m alive!”</i> she says, with a highly saturated voice making you jump (and incidentally hurting your [pc.ears]).");
			output(" The battered robot starts to stand up, making you notice her several concave dents. It’s almost... sad.");
			output("\n\n<i>“Are you in need of medical assistance?”</i> she asks, looking at you. You take a step back while she smiles innocently, her tail starting to wave. You quickly shake your head, then look at the dents on her body again. What’s the easiest way to remove them... suction, perhaps?");
			output("\n\nYou pick up a " + (!silly ? "plunger" : "dildo") + " from the floor, planting the base on one of her indents. It sticks, and you pull back. The dent pops out, leaving the artificial skin smooth. You do this to a few more damaged areas before she speaks again, asking, <i>“It seems you are fixing me. Shall I enter shutdown for the time being until further notice?”</i> You nod quickly.");
			output("\n\nShe sits down and lays spread eagle before her eyes shut off, letting you pop out more dents. You eventually get all of them. Surely you should still be careful, in case she suddenly decides you should get a quick and easy plastic filling. You pull the silicone tube from her back. You take a towel on the floor, which you immediately find out is a cumrag, as it stains your hand with the thick substance (ew), and eventually manage to wrap it around Nym-Foe’s visual processors (or eyes)... You move her metallic hair before looking around in her artificial cranium. Yep, everything’s there...");
			output("\n\nYou drag her to the wall, sitting her up against it like she once was.");
			output("\n\n<b>Nym-Foe is now fixed. You can visit her at anytime and plug her in, though chances are it’ll end up in a fight.</b>");
			output("\n\n");
			
			processTime(5);
			
			flags["NYM-FOE_DISASSEMBLED"] = undefined;
			flags["NYM-FOE_FIXED"] = 1;
			
			addButton(0, "Next", mainGameMenu);
			break;
		// Fix Nym-Foe?
		case "badger fix":
			showDrBadger();
			
			if(!chars["DRBADGER"].isBimbo())
			{
				output("You approach Badger with a question. <i>“So... your robots...”</i> you start.");
				output("\n\n<i>“Great, aren’t they? Programmed them myself, " + (silly ? "in C++" : "for the most fun results") + ",”</i> she says, smiling.");
				output("\n\n<i>“I suppose,”</i> you start again, <i>“I, hum... wanted to see if it would be possible to fix one of them. The one that thinks I should be full of silicone, Nym-Foe, to be precise,”</i> you admit. <i>“The thing is, she needs a new VI chip to work.”</i>");
				output("\n\nBadger turns her attention to you, away from what looks like a pile of never-ending junk. <i>“Oh, you want to help me? You see, I don’t have stuff to make another chip at the moment. Say, if you’ve got some free time, you could take apart some of those sexbots and get their chips. I’m not sure how many I need to make a custom one for Nym-Foe. Probably... six or so.”</i>");
				output("\n\n<i>“Six? Can’t you just use one and reprogram it?”</i> you ask.");
				output("\n\n<i>“I only need a part of each chip. Nym-Foe’s a... special case. Made with love. And lots of silicone.”</i> She smiles and shrugs. <i>“Anyway, I don’t exactly NEED her fixed at the moment, but I’d be happy to have her up and running again. Now shoo. Go get those chips.”</i>");
			}
			else
			{
				output("You approach the totally bimbofied doctor with a question. <i>“Hey, Badger. You know about your robots? The ones I had to go through when we fixed the pexiga?”</i>");
				output("\n\n<i>“We FIXED the pexiga? I thought we were just making her smarter!”</i> Badger exclaims, reeling back and cringing slightly. <i>“What’s she going to do now?”</i>");
				output("\n\n<i>“No Badger, not that kind of fix. We did make her smarter. Forget about her anyway, and tell me about your robots,”</i> you change the subject quickly before Badger gets too off topic. <i>“How would you fix Nym-Foe?”</i>");
				output("\n\nBadger puts a finger on her lower lip and looks up. <i>“Nym-Foe is the one with the big boobs and silicone right?”</i> You nod. <i>“In that case... I dunno!”</i>");
				output("\n\nWhat a helpful answer, you think. <i>“Maybe I could see her schematics? Do you have blueprints of her?”</i> You ask. <i>“If you can’t fix her, maybe I can.”</i>");
				output("\n\nBadger nods and looks through the desk she’s standing at. You wait for her to pull out a big, blue piece of paper, but it doesn’t happen. Just sex toys fall out of the drawers. <i>“I dunno where it went. Wait, what were we looking for again?”</i>");
				output("\n\n<i>“Badger" + (silly && !pc.isNice() ? ", you dipshit" : "") + ", blueprints for Nym-Foe,”</i> you state simply. You sigh and stand up, deciding to search the area with Badger since you’re sure she won’t find it by herself. You look through the lab, digging through unmentionables for the next fifteen minutes.");
				output("\n\nAfter looking through some boring and questionable items, you find it. A blue piece of paper, rolled up with a rubber band around it. You pull it out; it’s crumpled from its former position. You bring it to Badger and place it on her desk, rolling it out and flattening any creases with your forearm. The bimbo doctor watches you curiously while you observe the royal blue paper. The entire thing has Badger’s handwriting on it, and a computer printed image of Nym-Foe from the front and side. Let’s see... silicone storage, pleasure centers, blah blah blah, memory unit and VI chip. You look over the small section about what her VI chip is made of. Hey, these parts aren’t that uncommon; you could probably get crafty with some sexbot chips and make a special one for Nym-Foe.");
				output("\n\nYou come up with an estimate: you’ll need about six sexbot chips to make a custom VI chip for Nym-Foe.");
				output("\n\n<i>“Well, Badger, sit tight and I’ll be back later. Please don’t lose those blue prints,”</i> you say, a little exasperated. You head out.");
			}
			output("\n\n");
			
			processTime(1);
			
			// The quest to fix Nym-Foe: collect six sexbot chips and bring them to Badger. Sexbots have a 50% chance to drop one during this quest, and never again.
			flags["NYM-FOE_REPAIR_QUEST"] = 1;
			
			addButton(0, "Next", mainGameMenu);
			break;
		// Fix Nym-Foe, player has chips
		case "badger chip":
			showDrBadger();
			
			if(!chars["DRBADGER"].isBimbo())
			{
				output("You access your inventory before pulling out six chips that you salvaged from sexbots, offering them up to Badger. She looks to your [pc.hand], observing the small pieces before lifting her goggles. She picks them up from your hands, one by one, looking at them closely before finally switching her attention back to you.");
				output("\n\n<i>“Well, well, is someone eager to spend time with Nym-Foe?”</i> Badger asks, bringing the chips over to a desk, clearing it quickly before dropping the pieces down.");
				output("\n\n<i>“Regardless, just sit tight and I’ll cook something up in a jiffy. Then you can head down and pop it in.”</i> You find the nearest flat surface that isn’t crowded by sex toys, and plant your [pc.ass] down onto it. You sit around for a few minutes, boredly twiddling your thumbs while Badger does her thing.");
				output("\n\n<i>“And that oughta do it!”</i> she says. You pop up at her success, standing and heading toward her. She holds up a chip, colored light pink and octagonal in shape, unlike the blue and squared sexbot chips. You’re about to take it, but she places a furred palm against your forehead, stopping you clean. <i>“Now, don’t break her this time, y’hear? She’s a nice girl who only thinks everyone deserves a free gift.”</i>");
				if(pc.isNice()) output(" You slowly pull your head back before nodding gently.");
				else if(pc.isAss()) output(" You take her forearm and push it away.");
				else output(" You pull your head back, looking at her for a few seconds with a ‘really’ expression on your face.");
				output(" She looks at you for another few seconds before suddenly tossing the chip up in the air, in your general direction.");
				output("\n\n" + (pc.RQ() >= 66 ? "You catch it easily." : "It plops onto the floor before you can catch it, making you shamefully bend down to pick it up. You wouldn’t be surprised if Badger did it just to look at your ass."));
			}
			else
			{
				output("<i>“Hey Badger, you still got those blueprints?”</i> You ask, starting to get some sexbot chips from your inventory. You walk over to the desk with the bimbo doctor.");
				output("\n\n<i>“Yup! They’re right here!”</i> Badger says, picking up a piece of paper. It has two large, blue paw prints on it. You roll your eyes at the evidence of blue paint on Badger’s fingers. How considerate of her to make new ‘blueprints’ for you. Nevertheless, you jingle the chips around in your hand as you look through the sex toys that have been tossed along the desk. She works fast, apparently.");
				output("\n\nYou toss the toys to the side, revealing Nym-Foe’s blue prints, now with a couple drops of Badger’s jizz on it. You avert your focus to the small section about the VI chip.");
				output("\n\nAfter a fair bit of tinkering around with the sexbot chips and small pieces from electric sex toys, you finally finish the last piece of the VI chip, holding it up. Badger looks at the pink, octagonal chip with glee, like it’s some sort of prize.");
				output("\n\n<i>“You did it, Steele! Yay!”</i> Badger exclaims happily, then pausing for a moment with a dumbfounded expression. <i>“Wait. What was it for again?”</i>");
				output("\n\n<i>“Nym-Foe. We’re fixing her, remember?”</i> You answer.");
				output("\n\n<i>“Oh yeah! Right! So... just go down there and pop it in. She’ll be so happy, and I’ll be so happy and she’ll make you happy! It’s wonderful!”</i>");
				output("\n\nWelp, as Badger just said, you can go and fix Nym-Foe now.");
			}
			output("\n\n");
			
			processTime(12);
			
			pc.destroyItemByClass(SexbotChip, 6);
			// Player gets a VI chip. The exact one that you’d normally get when you loot Nym-Foe. From here, they can access Nym-Foe and insert the VI chip.
			quickLoot(new DamagedVIChip());
			
			flags["NYM-FOE_REPAIR_QUEST"] = 2;
			break;
		case "upgrade":
			showNymFoe();
			
			output("You reach down to Nym-Foe, unwrapping the rag on her eyes before plugging in the tube to her back. Her body plumps up with silicone, and she starts to stand, looking at you with a lighthearted smile. <i>“Thank you for unbinding me. What service do you require?”</i> She has a loving tone. Her tail begins to wave in front of you, stealing your attention away from her other movements.");
			if(!pc.isBimbo()) output("\n\n<i>“Actually...”</i> you start to admit. <i>“I’d like you to upgrade me as you feel necessary. I’m your willing patient and you know best for me.”</i> You smile a little, your heart racing while you look up at the nursedroid.");
			else output("\n\n<i>“Could you, like, give me perfect silicone curves? I’m totes cool with being all blown up and stuff. I would love having some huge boobies,”</i> you say, smiling at the nursedroid.");
			output("\n\n<i>“Oh dearie, that’s all you had to say. Please, undress and find a place to sit.”</i> You strip off your [pc.gear] before finding the nearest padded surface. Nym-Foe sits next to you, smiling and placing her arm around your shoulder. She pulls you somewhat close while her tail sneaks up to you.");
			output("\n\n" + (!pc.isBimbo() ? "<i>“Please be gentle...”</i> you say quietly." : "<i>“Don’t hold back, I want the biggest titties you can give me...”</i> you say excitedly.") + " The needle slowly pierces the [pc.skin] of your [pc.hip] painlessly. You hold your breath while thick bulges of silicone pass through the nurse’s tail, entering your body with no resistance.");
			output("\n\nHeat radiates from the injection site, right in your [pc.hips]. The semi solid goop slides through your body effortlessly to settle in your [pc.thighs] and [pc.hips]. It takes very little time before they begin to swell. Since you aren’t exactly struggling, the nurse continues her work on you. You sigh gently, enjoying this peculiar feeling of growth.");
			if(pc.isBimbo()) output("\n\n<i>“More! More please, Miss Nym-Foe!”</i> you giddily say, grabbing the closest boob of the happy nurseroid. She happily obliges, rubbing your shoulder gently while more bulges of silicone enter you. You smile while gently wiggling your hips, loving how wide they feel.");
			output("\n\nIt doesn’t exactly stop there, either. The plastic fluid passes across you to deposit itself into your [pc.ass], allowing your cheeks to inflate like bubbles. Really, really big bubbles. Slowly, your butt expands so much that you rise in your seat. It continues for just over a minute before your cheeks are full.");
			if(pc.isBimbo()) output("\n\n<i>“Oh, oh! Can I get a way bigger ass?”</i> you beg quickly, putting your face near the nurse’s. <i>“Please?”</i> you add, making your best sad puppy face. The alabaster nurse only responds by putting more pressure into her tail, plumping you up faster. You giggle at the feeling, reaching down to give your booty a squeeze.");
			output("\n\nThe next place that the bio-silicone travels to is exactly where you’d expect: your [pc.chest]. You feel weight increasing on your [pc.boobs], and looking down at them explains why.");
			if(pc.hasSkin()) output(" Light blue veins quickly become visible across them as they grow and inflate from the inside.");
			output(" They feel... heavy. After all, you <i>are</i> blowing through probably a cup size every few seconds. You gently place your hands under them, hefting them while they become fuller and more juicy. No one would mind fake boobs that look this good anyway.");
			if(pc.isBimbo()) output("\n\nBut, you could always get more! <i>“Nurse! Nurse! Can you make my boobies really, REALLY big, too?”</i> you ask with enthusiasm, grabbing your nipples and pinching them slightly. Nym-Foe smiles and lets out an artificial breath. She seems pleased at such a willing patient, and makes sure to overfill your boobs with the implants. You smile as you lift them and jiggle them around in your hands.");
			output("\n\nThe last place the silicone travels to is your [pc.lips]. You let your mouth hang open somewhat as your oral entrance becomes bigger and thicker. Your lips just keep swelling, and you grin at the feeling. They must be so sexy. You can almost see them at the bottom of your vision, bulged outwards and wobbling lightly. You beam and lean into the nursedroid.");
			if(pc.isBimbo()) output("\n\n<i>“Can you make my lips really big, too?”</i> you whisper, puckering them at the nurse. Suddenly, you feel your lips getting even larger with the silicone. The nurse is so nice!");
			output("\n\nFinishing up, Nym-Foe turns slightly to face you, her tail slowly pulling out of you, not even leaving a wound. She offers you one of her leaking nipples, squeezing it lightly between two gloved fingers. You slowly pull it into your mouth, between your expanded lips, sucking down the questionable juice. It must be some sort of sedative because you’re feeling tired, but it can’t be just that, because you also begin to feel your nipples leaking");
			if(pc.isLactating()) output(" more than usual");
			output(".");
			output("\n\nNot many more thoughts pass through your head as you slowly drift to sleep.");
			output("\n\n");
			
			processTime(17);
			
			addButton(0, "Next", drBadgerLabNymFoe, "upgrade next");
			break;
		case "upgrade next":
			showNymFoe();
			
			processTime(12);
			
			// Increase boob silicone rating by 9, ass silicone by 12, hip by 9, and lip by 3. (basically the normal injections but times 3, other than ass) And induce lactation, or boost it.
			// If the player is a bimbo, increase boob size by 14, ass by 18, hip by 12, lip by 5
			nymFoeInjection(pc, 1, (!pc.isBimbo() ? 9 : 12), true);
			nymFoeInjection(pc, 2, (!pc.isBimbo() ? 12 : 18), true);
			nymFoeInjection(pc, 3, (!pc.isBimbo() ? 9 : 14), true);
			nymFoeInjection(pc, 4, (!pc.isBimbo() ? 3 : 5), true);
			
			if(pc.milkMultiplier < 100) pc.milkMultiplier = 100;
			pc.milkStorageMultiplier++;
			
			output("You wake up some time later, now laying down with your head in Nym-Foe’s lap. You slowly sit up, a strange taste stuck in the back of your throat. Nym-Foe looks at you with a friendly smile. You smile back, your [pc.lips] practically wobbling just from the slight movement.");
			output("\n\n<i>“Your treatment is finished, but don’t let that stop you from coming back another time,”</i> she says, encouragingly. She pulls a lollipop from her mountains of boobage and hands it to you. <i>“That’s for being such a good patient.”</i> She closes her eyes and makes a little cutesy pose with her head before standing up.");
			output("\n\n<i>“Hey...”</i> you start as you begin to rise. <i>“Can I put you back against the wall? So, y’know, I’ll know where to find you if I want another treatment?”</i> you ask, struggling into your [pc.gear]. Your new assets make it quite difficult. Porn stars would be jealous... or laughing.");
			output("\n\n<i>“Sure!”</i> she says. You rest her back against the wall in her usual position, and disconnect her from the silicone tank. Carefully wrapping the rag over her eyes again, you give her a little kiss on the forehead as a thank you for her free gift. Her eyes slowly shut off.");
			output("\n\nYou take a moment to look down at yourself. She didn’t hold back with the silicone, as shown by your almost doll-like structure. You can see your [pc.lips] at the bottom of your vision, which wobble with every tiny movement. Down a bit farther, your [pc.boobs] are quite massive now, and leaking with [pc.milk]. They must be at least [pc.breastCupSize " + pc.biggestTitRow() + "]s. You’re not sure whether most of the weight in them is plastic or [pc.milk]. Regardless, you look down further. Your [pc.thighs] and [pc.hips] are much thicker, as is your [pc.ass]. You give your rear end a light smack, and it jiggles like crazy.");
			output("\n\nWell, if you feel like removing any of the silicone, you could use the tank and suck it all out. Otherwise... you can expect a lot more wobble in your step, and every other movement you perform.");
			output("\n\n");
			
			processTime(4);
			
			IncrementFlag("NYM-FOE_SILICONE_BOOSTS");
			
			// Player gets a ClearYu lollipop
			quickLoot(new ClearYu());
			// Player is put in normal lab screen
			break;
		case "fight":
			showNymFoe();
			
			output("You plug the tube into her back, and unwrap the makeshift blindfold. Her body, namely tits, ass, and lips, plumps back up with silicone as she slowly stands up.");
			output("\n\n<i>“Have you repaired me? My protocols suggest I reward you with a healthy dose of silicone! Please remain still while I perform the necessary injections.”</i>");
			output("\n\n");
			
			flags["NYM-FOE_ACTIVATED"] = 1;
			
			processTime(1);
			
			addButton(0, "Next", fightTheNymfoe);
			break;
		// (Silly exclusive) Buy “Nym-Foe”
		// The player asks badger if they can buy Nym-Foe from her. Badger gives the player a Nym-Foe body pillow/dakimakura jokingly. The player can sleep with it.
		// This scene is available when the player has spent any time with Nym-Foe; been upgraded or fought her, as long as silly mode is enabled.
		case "badger buy":
			showDrBadger();
			
			output("You want that robot nurse. You know you do, from the blonde hair to the silicone tits, to the injector tail. Surely you could cough up a few credits and Badger would hand her over, right? Even then, the worst she can do is say no. Preparing a credit chip, you approach Badger.");
			output("\n\n<i>“How much for the nurse?”</i> You ask, a little smile on your face.");
			output("\n\n<i>“Nym-Foe? You really want her?”</i> The doctor asks, turning away from her perverted ‘project’. She looks at you with a slightly raised brow.");
			output("\n\n<i>“Yes" + (pc.isNice() ? " ma’am" : "") + ". How much will it be?”</i> You ask again.");
			output("\n\nBadger scratches her head for a minute before lifting her goggles. She seems at a loss for words... that is, until a big smile develops along her face. <i>“Actually, here you go, she’s right here.”</i> Did the doctor know you were going to ask, and brought the bot up preemptively? You quickly learn what Badger meant as she pulls something up from behind her desk...");
			output("\n\n");
			
			processTime(2);
			
			addButton(0, "Next", drBadgerLabNymFoe, "pillow show");
			break;
		case "pillow show":
			showBust("NYMFOE_DAKI");
			showName("");
			output("The prize is slowly revealed: a clean, six foot tall pillow with a professional drawing of Nym-Foe on either side. The boob area of the front-side art juts out dramatically into a pair of bubble-shaped domes, much like the breasts of the nurse herself. Badger hands the tall dakimakura to you. <i>“There you are. Nym-Foe, just for you.”</i>");
			output("\n\n");
			
			processTime(1);
			
			addButton(0, "Take", drBadgerLabNymFoe, "pillow take", "Take the Pillow", "Hell yeah, a body pillow!");
			addButton(1, "WTF?!", drBadgerLabNymFoe, "pillow wtf", "What The Fuck?!", "This is not what you meant.");
			break;
		case "pillow take":
			showBust("NYMFOE_DAKI");
			showName("TAKE\nPILLOW");
			
			output("You gently place your [pc.hands] on the soft item, examining it while you pull it closer. It’s incredibly high quality, each image hand-crafted by an artist who clearly knew what they were doing. Upon intimate inspection, you notice that inside each of the protruding breasts of the front-facing Nym-Foe resides a large, silicone insert. Overall, it’s very pretty.");
			output("\n\n");
			
			flags["NYM-FOE_DAKIMAKURA_TAKE"] = 1;
			
			processTime(1);
			
			// Player acquires a Nym-Foe Dakimakura
			itemScreen = mainGameMenu;
			lootScreen = badgerNymFoeDakimakuraCheck;
			useItemFunction = mainGameMenu;
			itemCollect([new NymFoeDakimakura()]);
			break;
		case "pillow wtf":
			showDrBadger();
			
			output("You take the pillow in your [pc.hands] for a few seconds before handing it back to Badger. <i>“I’m under the impression you misunderstood me,”</i> you say. <i>“I want the real deal.”</i> A blank expression crosses your face; you’re unamused by the doctor’s little joke.");
			output("\n\nBadger takes the pillow back and looks at you, placing her hands on her hips. <i>“No. I made her from near scratch. You can play with her here, but you’re not taking her anywhere. Not for a million creds.”</i>");
			output("\n\nYou sigh. <i>“Fine, Badger. Fine.”</i> You decide to leave before one of you does something stupid. Goddamnit Badger, if only you’d hand over the nurse.");
			output("\n\n");
			
			flags["NYM-FOE_DAKIMAKURA_TAKE"] = -1;
			
			processTime(1);
			
			// Player is put in square south of Badger’s lab
			currentLocation = "209";
			
			addButton(0, "Next", mainGameMenu);
			break;
	}
}
// Losing, regardless of lust or health drain, results in the health loss scene, minus the pexiga part. For bimboes, they get the usual scenes (grow ass, hips, boobs, lips, then induce lactation, and then a new scene instead of the pexiga one), and non bimboes get the usual scene where you pass out and wake up inflated, but Badger pulled you out. From there, Nym-Foe will guard the lab. Any entrance to the back lab will be met with silicone filling force (basically, beat Nym-Foe again). Losing will place the player in doctor Badger’s bimbotorium square.
public function loseToPostQuestNymfoe():void
{
	IncrementFlag("NYM-FOE_LOSSES");
	loseToNymFoeViaHP(false);
}
public function pcVictoryVsPostQuestNymFoe():void
{
	clearOutput();
	showNymFoe();
	author("Natetheman223");
	
	output("Yet again, you manage to disable the nursedroid. She sputters out some words revolving around having many errors within her system, and apologizes for not being able to provide the assistance she should. Eventually, she tumbles down onto the floor. You drag her to the wall before unplugging her again and place the usual rag around her face to prevent her from doing anything weird while she recharges and performs self repairs.");
	output("\n\n");
	
	flags["NYM-FOE_ACTIVATED"] = undefined;
	
	CombatManager.genericVictory();
}
public function badgerNymFoeDakimakuraCheck():void
{
	clearOutput();
	showDrBadger();
	clearMenu();
	
	if(pc.hasItemByClass(NymFoeDakimakura))
	{
		author("Natetheman223");
		
		output("Your eyes drift up from the pillow to Badger. A smile forms across your face as you pull the pillow closer, hugging its fake tits to your chest. <i>“Thank" + (pc.isNice() ? " you, Doctor Badger" : "s") + ",”</i> you say, beginning to walk out.");
		output("\n\n<i>“Just remember to keep her clean--semen will fade the design!”</i> Badger shouts on your way out.");
		
		// Player is put in square south of Badger’s lab
		currentLocation = "209";
		
		addButton(0, "Next", mainGameMenu);
		return;
	}
	
	output("Not having enough space for the dakimakura, you return it to Doctor Badger.");
	output("\n\n<i>“That’s fine. She’ll be over here if you need her,”</i> the doctor remarks, setting the pillow right next to her in a sitting position and very close to a potentially dangerous looking contraption...");
	output("\n\n");
	
	flags["NYM-FOE_DAKIMAKURA_TAKE"] = 0;
	
	addButton(0, "Next", mainGameMenu);
}

// Clicking on the pillow from your inventory
public function badgerNymFoeDakimakuraUse():Boolean
{
	clearOutput();
	showBust("NYMFOE_DAKI");
	showName("NYM-FOE\nDAKIMAKURA");
	author("Natetheman223");
	
	output("You take the Nym-Foe body pillow from your inventory, admiring the lewd art with a subtle smile. What are you going to do with it?");
	output("\n\n");
	
	badgerNymFoeDakimakuraMenu();
	
	return true;
}
public function badgerNymFoeDakimakuraMenu():void
{
	clearMenu();
	addButton(0, "Appearance", badgerNymFoeDakimakuraLook, undefined, "Appearance", "Take a closer look at the pillow.");
	addButton(1, "Sleep", badgerNymFoeDakimakuraSleep, undefined, "Sleep", "Sleep with the pillow.");
	addButton(14, "Never Mind", useItemFunction);
}
public function badgerNymFoeDakimakuraLook():void
{
	clearOutput();
	showBust("NYMFOE_DAKI");
	showName("NYM-FOE\nDAKIMAKURA");
	author("Natetheman223");
	
	output("This is a lewd body pillow of Nym-Foe, the nurse you once fought in Badger’s lab. It has a picture of the robo-nurse on either side.");
	output("\n\nOn the front is Nym-Foe facing forward with one hand down low on her body, pushing her light red panties down ever so slightly, while her other hand is splayed loosely above her head. She has a slightly nervous expression on her face: pink blush along her snow white cheeks, upward tilted brows and a gentle smile on her big lips. Her giant boobs have silicone in them (as in, <i>inside</i> the daki), providing extra cushioning. They take up most of her torso, with her nipples poking out from the top of her corset. Her thick thighs are pointed toward each other, her knees touching with her stocking-clad legs parted. Her injector tail complements her figure.");
	output("\n\nOn the other side is Nym-Foe facing away with her head turned back to you, her boobs squished against the bed she’s laying on. Her metallic blonde braid hangs down her corset covered back, leading down to her big butt. The panties on her appear tight, showing off each delicious cheek and thigh. Her arms are wrapped up around her breasts while her tail weaves delicately above her behind.");
	output("\n\nA very pretty pillow.");
	output("\n\n");
	
	badgerNymFoeDakimakuraMenu();
	addDisabledButton(0, "Appearance");
}
public function badgerNymFoeDakimakuraSleep():void
{
	clearOutput();
	showBust("NYMFOE_DAKI");
	
	if(canSleep() && !disableExploreEvents())
	{
		showName("\nSLEEP...");
		author("Natetheman223");
		
		output(rooms[currentLocation].hasFlag(GLOBAL.BED) ? "You prepare the bed as usual, though this time, you lay the daki of the perverted nurse down on the bed first." : "There’s no bed anywhere to be found near you, but the pillow itself should be more than enough to fall asleep with. You lay it down on the ground before joining it.");
		output("\n\n" + RandomInCollection([
			"With the faux nurse down on her back, huge boobs up, you lay down on it. You hug and wrap your arms around the plush material, your face snuggled into the fake tits of the big pillow. The plastic bumps are as big as (and feel just like) the real nurse’s boobs. You push your face between them, your whole body seemingly absorbed into the amazing softness of the daki. This is so comfortable...",
			"With the faux nurse down on her front, butt side up, you lay down on it. You hug and wrap your arms around the plush material, your face snuggled into the big ass of the daki. You reach your arms around the pillow, grabbing the silicone breasts while you let yourself get absorbed into the amazingly soft fabric. This is so comfortable...",
		]));
		output("\n\nYou sleep for about eight hours.");
		output("\n\n");
		
		// All effects of sleeping for 8 hours happen; max energy and health, recover from soreness, etc.
		sleep(false);
		return;
	}
	
	showName("");
	
	output("You cannot " + (!canSleep() ? "seem to get any sleep at the moment" : "use the Nym-Foe pillow at this time") + "!");
	output("\n\n");
	
	clearMenu();
	addButton(0, "Next", useItemFunction);
}

public function salvageDollmaker():void
{
	clearOutput();
	showDollmaker();
	author("Natetheman223");
	
	var combat:Boolean = inCombat();
	
	if(flags["DOLLMAKER_LOOT_IQBGONE"] != undefined && flags["DOLLMAKER_LOOT_LAMP"] != undefined && (flags["DOLLMAKER_LOOT_EMITTER"] != undefined || (!combat && flags["DOLLMAKER_LOOT_VISOR"] != undefined)))
	{
		output("It seems you have looted all the machine’s detachable belongings.");
	}
	else
	{
		output("Waste not, want not, right?");
		if(flags["NYM-FOE_DISASSEMBLED"] == undefined) output(" You bend over the repurposed robot and release her safety clamps, opening her warm, squishy exterior.");
		output(" Unsurprisingly, the nurse’s interior is a dizzying mess of rewired circuitry and oily servos. Badger really did a number on this one.");
		if((combat && !enemy.hasItemByClass(Silicone,4)) || flags["NYM-FOE_LOOT_SILICONE"] == undefined) output("\n\nIt seems her chest has been stuffed with military-grade silicone. Luckily, the pouches seem to be intact, so carrying them away shouldn’t be too much trouble. Who could possibly need this much silicone?");
		if((combat && !enemy.hasItemByClass(Gush,5)) || flags["NYM-FOE_LOOT_GUSH"] == undefined) output("\n\nRight near where her heart would be, an elaborate hydraulic pump has been added, connected to a massive tank of Gush. You could probably load up some nearby spray pens from this central tank, if you wanted. You’ll just have to be careful not to let on that you’re carrying enough of the illegal drug to start a cartel.");
		if((combat && !enemy.hasItemByClass(DamagedVIChip)) || (!combat && flags["NYM-FOE_LOOT_CHIP"] == undefined && flags["NYM-FOE_CHIP_RETURN"] == undefined)) output("\n\nThe nursedroid’s Artificial Intelligence chip should be somewhere around her head. You could probably get a few credits for that, despite Badger’s reprogramming.");
	}
	output("\n\n");
	
	if(flags["DOLLMAKER_DISASSEMBLED"] == undefined) flags["DOLLMAKER_DISASSEMBLED"] = 1;
	
	dollmakerSalvageMenu();
}
public function hasDollMakerEffect(target:Creature = null):Boolean
{
	if(target == null) return false;
	
	if(target.hasStatusEffect("IQ B-Gone")) return true;
	if(target.hasStatusEffect("Brainmelt Lamps")) return true;
	if(target.hasStatusEffect("Mindwashed")) return true;
	if(target.hasStatusEffect("Latex Sprayed")) return true;
	if(target.hasStatusEffect("Bimboleum")) return true;
	return false;
}
public function createDollMakerStatusEffect(target:Creature = null, sName:String = "", nValue1:Number = 0, nValue2:Number = 0, nValue3:Number = 0, nValue4:Number = 0, bCombatOnly:Boolean = true, iTime:int = 0):Boolean
{
	if(target != null)
	{
		target.createStatusEffect(sName, 0, 0, 0, 0, false, "","", bCombatOnly, 0);
		updateDollMakerStatusEffect(target, sName, nValue1, nValue2, nValue3, nValue4, iTime);
	}
	return false;
}
public function updateDollMakerStatusEffect(target:Creature = null, sName:String = "", nValue1:Number = -1, nValue2:Number = -1, nValue3:Number = -1, nValue4:Number = -1, iTime:int = -1):Boolean
{
	if(target == null) return false;
	
	var effect:StorageClass = target.getStatusEffect(sName);
	
	if(effect == null) return false;
	
	if(iTime >= 0) effect.minutesLeft = iTime;
	
	var b:int = 0;
	
	switch(effect.storageName)
	{
		case "IQ B-Gone":
			if(nValue1 > 0)
			{
				effect.value1 += nValue1;
				target.intelligenceMod -= nValue1;
			}
			if(nValue2 > 0)
			{
				effect.value2 += nValue2;
				target.libidoMod += nValue2;
			}
			effect.iconName = "Icon_Lips_Lick";
			effect.tooltip = (target is PlayerCharacter ? "It’s like, harder to think and stuff! Hopefully it’ll be tempor... temp... short!" : "Thinking is limited.") + "\n\n<b>-" + effect.value1 + " Intelligence</b>";
			break;
		case "Brainmelt Lamps":
			if(nValue1 > 0)
			{
				effect.value1 += nValue1;
				target.willpowerMod -= nValue1;
			}
			effect.iconName = "Icon_DizzyDrunk";
			effect.tooltip = (target is PlayerCharacter ? "It’s hard to focus." : "Difficulty focusing.") + "\n\n<b>-" + effect.value1 + " Willpower</b>";
			break;
		case "Mindwashed":
			if(nValue1 > 0)
			{
				effect.value1 += nValue1;
				target.aimMod -= nValue1;
			}
			effect.iconName = "Icon_MindcontrolledMindbroke";
			effect.tooltip = (target is PlayerCharacter ? "You’re dizzy from having so much smut stuffed into your brain!" : "Dizziness affects accuracy.") + "\n\n<b>-" + effect.value1 + " Aim</b>";
			break;
		case "Latex Sprayed":
			if(nValue1 > 0)
			{
				effect.value1 += nValue1;
				target.reflexesMod -= nValue1;
			}
			effect.iconName = "Icon_Perfume";
			effect.tooltip = (target is PlayerCharacter ? "You feel slower with all this latex on you!" : "Latex slows movement.") + "\n\n<b>-" + effect.value1 + " Reflexes</b>";
			break;
		case "Bimboleum":
			if(nValue1 > 0)
			{
				effect.value1 += nValue1;
				target.physiqueMod -= nValue1;
			}
			if(nValue2 > 0)
			{
				effect.value2 += nValue2;
				for(b = 0; b < target.breastRows.length; b++)
				{
					target.breastRows[b].breastRatingMod += nValue2;
				}
			}
			if(nValue3 > 0)
			{
				effect.value3 += nValue3;
				target.hipRatingMod += nValue3;
			}
			if(nValue4 > 0)
			{
				effect.value4 += nValue4;
				target.buttRatingMod += nValue4;
			}
			effect.iconName = "Icon_Drug_Pill_Heart";
			effect.tooltip = (target is PlayerCharacter ? "Your body is weird and squishy, the muscles too plush with pleasure to flex properly." : "Too plush to move muscles.") + "\n\n<b>-" + effect.value1 + " Physique</b>";
			break;
	}
	
	return true;
}
public function doDollMakerStatusEffects(target:Creature = null, effect:StorageClass = null, initDuration:uint = 0, requiresRemoval:Boolean = false):void
{
	if(target == null || effect == null) return;
	
	var i:int = 0;
	var b:int = 0;
	var deltaShift:uint = Math.max((initDuration - effect.minutesLeft), 0);
	var effectDose:int = 0;
	var maxCycle:int = 0;
	
	switch(effect.storageName)
	{
		case "IQ B-Gone": maxCycle = 40; break;
		case "Brainmelt Lamps": maxCycle = 15; break;
		case "Mindwashed": maxCycle = 10; break;
		case "Latex Sprayed": maxCycle = 15; break;
		case "Bimboleum": maxCycle = 15; break;
	}
	// First hour of cycle should not deduct, but removal should take care of refunds.
	for(i = (maxCycle - 1); i >= 0; i -= 1)
	{
		var min:int = (i * 60);
		if(initDuration >= min && effect.minutesLeft < min)
		{
			switch(effect.storageName)
			{
				case "IQ B-Gone":
					if(effect.value1 > 0)
					{
						effect.value1 -= 1;
						target.intelligenceMod += 1;
					}
					if(effect.value2 > 0)
					{
						effect.value2 -= 1;
						target.libidoMod -= 1;
					}
					break;
				case "Brainmelt Lamps":
					if(effect.value1 > 0)
					{
						effect.value1 -= 1;
						target.willpowerMod += 1;
					}
					break;
				case "Mindwashed":
					if(effect.value1 > 0)
					{
						effect.value1 -= 1;
						target.aimMod += 1;
					}
					break;
				case "Latex Sprayed":
					if(effect.value1 > 0)
					{
						effect.value1 -= 1;
						target.reflexesMod += 1;
					}
					break;
				case "Bimboleum":
					if(effect.value1 > 0)
					{
						effect.value1 -= 1;
						target.physiqueMod += 1;
					}
					if(effect.value2 > 0)
					{
						effect.value2 -= 1;
						for(b = 0; b < target.breastRows.length; b++)
						{
							target.breastRows[b].breastRatingMod -= 1;
						}
					}
					if(effect.value3 > 0)
					{
						effect.value3 -= 1;
						target.hipRatingMod -= 1;
					}
					if(effect.value4 > 0)
					{
						effect.value4 -= 1;
						target.buttRatingMod -= 1;
					}
					break;
			}
			
			updateDollMakerStatusEffect(target, effect.storageName);
			
			effectDose++;
		}
	}
	
	if(requiresRemoval)
	{
		var msg:String = "";
		switch(effect.storageName)
		{
			case "IQ B-Gone":
				target.intelligenceMod += effect.value1;
				target.libidoMod -= effect.value2;
				if(target is PlayerCharacter) msg += "You pause for a minute to rub your forehead. What the hell just happened? It looks like the IQ-B-GONE wore off, but... wow. That was an interesting experience.";
				target.slowStatGain("intelligence", 1);
				if(target.hasPerk("Ditz Speech"))
				{
					if(target is PlayerCharacter && !canRemoveDitzSpeech()) msg += "\n\nYou should totally do it again.";
					else
					{
						if(target is PlayerCharacter) msg += "\n\n(<b>Perk Lost: Ditz Speech</b>)";
						target.removePerk("Ditz Speech");
					}
				}
				break;
			case "Brainmelt Lamps":
				target.willpowerMod += effect.value1;
				if(target is PlayerCharacter) msg += "You feel... better, oddly enough. After the recent encounter with that Brainmelt lamp, you’re sure the effects of it have worn off, and your willpower is back to normal, if not better.";
				target.slowStatGain("willpower", 1);
				break;
			case "Mindwashed":
				target.aimMod += effect.value1;
				if(target is PlayerCharacter) msg += "With all the porn you just had stuffed into your head, you were sure you’d never be back to normal. Though, now that a couple hours have passed, you feel like you could shoot a target with 100% accuracy. Maybe 110%.";
				target.slowStatGain("aim", 1);
				break;
			case "Latex Sprayed":
				target.reflexesMod += effect.value1;
				if(target is PlayerCharacter) msg += "You take a second to look over yourself. The latex you sprayed on your body has nearly completely chipped away, small shards of plastic hitting the ground as you move about. Fighting with your body to move while rigid has made you stronger, and you feel more flexible than ever. You’re back to normal, now just quicker.";
				target.slowStatGain("reflexes", 1);
				// Revert colors and type
				if(target is PlayerCharacter && flags["DOLLMAKER_LATEX_SKIN"] != undefined)
				{
					target.skinType = flags["DOLLMAKER_LATEX_SKIN"][0];
					target.skinFlags = flags["DOLLMAKER_LATEX_SKIN"][1];
					target.skinTone = flags["DOLLMAKER_LATEX_SKIN"][2];
					
					flags["DOLLMAKER_LATEX_SKIN"] = undefined;
				}
				break;
			case "Bimboleum":
				target.physiqueMod += effect.value1;
				for(b = 0; b < target.breastRows.length; b++)
				{
					target.breastRows[b].breastRatingMod -= effect.value2;
				}
				target.hipRatingMod -= effect.value3;
				target.buttRatingMod -= effect.value4;
				if(target is PlayerCharacter) msg += "You take a second to realize that the Bimboleum’s effect on you is now gone. Your body has returned to its normal proportions, more or less, and your muscles look like they naturally do. Perhaps you feel a little stronger too. Fighting with your body while you were weakened and then getting your power back makes you feel oddly tough.";
				target.slowStatGain("physique", 1);
				break;
		}
		if(msg != "") AddLogEvent(msg, "passive", deltaShift);
	}
}
public function drBadgerLabDollMaker(response:String = "menu"):void
{
	clearOutput();
	author("Natetheman223");
	clearMenu();
	
	var i:int = 0;
	var nMult:Number = 0;
	
	switch(response)
	{
		case "menu":
		case "back":
			showDollmaker();
			
			// Doll Maker, damaged
			// Remember how when you were little, you’d say: <i>‘I’d rather have a girl who’s ugly and smart than a girl who’s pretty and dumb?’</i> Oh boy, how wrong we all were.
			// And since the Doll Maker is directly linked to a smart Badger, it can’t be fixed if Badger is a bimbo.
			if(flags["DOLLMAKER_STATUS"] == -1 && (flags["DOLLMAKER_DISASSEMBLED"] != undefined || flags["DOLLMAKER_FIXED"] == undefined))
			{
				if(response != "back") output("You carefully walk up to the Doll Maker. It may be dormant, but you still make sure to be on your guard in case it decides your IQ needs to be lower, like most of Badger’s toys. Upon closer inspection, it seems one or more pieces have been taken, or are just damaged significantly. You knock on some of the parts, but it seems they have no intention of turning on. All except the small pack of bullet vibrators, which are trapped in their box with no escape.");
				else output("What else do you decide to do with Doctor Badger’s inactive machine?");
				output("\n\n");
				
				processTime(1);
				
				// [Fix] [Loot] [Back]
				addButton(0, "Fix", drBadgerLabDollMaker, "fix", "Fix Doll Maker", "Attempt to fix the machine.");
				addButton(1, "Loot", salvageDollmaker, undefined, "Loot Doll Maker", "Salvage some parts from the machine.");
				addButton(14, "Back", mainGameMenu);
				
				// Loot replaces the buttons with ‘Syringe’, ‘lamp’, ‘gun’, and ‘visor’, and a back button.
				// A new button appears in Badger’s menu: “Fix DollM.?”
				
				if(flags["DOLLMAKER_DISASSEMBLED"] == undefined || flags["DOLLMAKER_DISASSEMBLED"] < 2) flags["DOLLMAKER_DISASSEMBLED"] = 2;
			}
			// Confirmation warning, appears the first time the player tries to interact with the Doll Maker
			else if(flags["DOLLMAKER_FIXED"] < 2)
			{
				output("You stop yourself before you reach the perverted robot. You just need a second to think about everything this robot has done, and what it might do to you. It could give you giant tits, make your brain melt out of your ears (maybe), give you latex skin, and that’s not even the half of it.");
				if(silly) output(" If you have a permanent ruin kink, this is for you.");
				output("\n\n<b>Going any further could result in some serious brain drain and/or bodily changes. Are you sure you want to continue?</b>");
				output("\n\n");
				
				// [Yes] [No]
				// Yes puts player in Doll Maker screen, No puts them in lab screen
				addButton(0, "Yes", drBadgerLabDollMaker, "warn yes", "Yes", "Accept the consequences.");
				addButton(1, "No", drBadgerLabDollMaker, "warn no", "No", "Back out now.");
			}
			// Doll Maker, undamaged
			// Back in action, baby!
			// May want to add a small note after beating Nym-Foe and Dolly for the first time about how you can revisit them later, and to not worry about not being able to pick up all their items.
			else
			{
				if(response != "back")
				{
					output("You approach the");
					if(flags["DOLLMAKER_FIXED"] != undefined) output(" now fixed");
					output(" Doll Maker. Its imposing figure and several parts make you worried just to come closer, even though it’s off. You take a deep breath and stand in the center of it all, looking around at the many limbs surrounding you. You feel oddly... helpless in here");
					if(flags["DOLLMAKER_FIXED"] != undefined) output(", especially knowing that Badger reinforced most of the parts");
					output(".");
					output("\n\nSo what now? You could have some fun with certain bits");
					if(!pc.isBimbo()) output(", turn on the machine as a whole if you want to fight it,");
					output(" or get turned into a fresh, brainless, sex doll.");
				}
				else output("What else do you decide to do with Doctor Badger’s " + (!pc.isBimbo() ? "imposing" : "<i>fun</i>") + " machine?");
				output("\n\n");
				
				processTime(1);
				
				// [Play] [Fight] [Doll] [Back]
				addButton(0, "Play", drBadgerLabDollMaker, "play", "Play with Doll Maker", "Use a part on yourself.");
				if(pc.isBimbo()) addDisabledButton(1, "Fight", "Fight Doll Maker", "Why would you fight a good friend?");
				else if(hasDollMakerEffect(pc)) addDisabledButton(1, "Fight", "Fight Doll Maker", "You cannot fight the Doll Maker while currently under its side-effects.");
				else addButton(1, "Fight", fightTheDollmaker, undefined, "Fight Doll Maker", "Fight the Doll Maker.");
				// Literally display the usual loss scene for the Doll Maker.
				addButton(2, "Doll", volunteerForDollificationFight, undefined, "Get Dolled Up!", "Who needs brains anyway?");
				addButton(14, "Back", mainGameMenu);
			}
			break;
		case "warn yes":
			showDollmaker();
			
			output("You will accept the consequences of your actions and continue on.");
			output("\n\n");
			
			flags["DOLLMAKER_FIXED"] = 2;
			
			addButton(14, "Next", drBadgerLabDollMaker, "menu");
			break;
		case "warn no":
			showDollmaker();
			
			output("You figure it would be safer to keep your distance. You can always come back if you change your mind.");
			output("\n\n");
			
			addButton(14, "Next", mainGameMenu);
			break;
		case "fix":
			showDollmaker();
			
			output("If you still have any parts left, you could try to reinsert them. It could save you time later.");
			// Doll maker cannot be fixed if Badger is a bimbo
			if(chars["DRBADGER"].isBimbo()) output("\n\nThough, it would be pointless to put any damaged pieces back on if Badger is too stupid to fix it completely...");
			
			// [Syringe] [Lamp] [Gun] [Visor] [Back]
			if(flags["DOLLMAKER_FIX_IQBGONE"] != undefined) addDisabledButton(0, "Syringe", "Install IQ B-Gone", "You have already installed this!");
			else if(!pc.hasItemByClass(IQBGone)) addDisabledButton(0, "Syringe", "Install IQ B-Gone", "You need the syringe full of IQ B-Gone.");
			else addButton(0, "Syringe", drBadgerLabDollMaker, "fix iqbgone", "Install IQ B-Gone", "Install the syringe full of IQ B-Gone.");
			
			if(flags["DOLLMAKER_FIX_LAMP"] != undefined) addDisabledButton(1, "Lamp", "Install Brainmelt Lamp", "You have already installed this!");
			else if(!pc.hasItemByClass(BrokenBrainmeltLamp)) addDisabledButton(1, "Lamp", "Install Brainmelt Lamp", "You need the broken Brainmelt Lamp.");
			else addButton(1, "Lamp", drBadgerLabDollMaker, "fix lamp", "Install Brainmelt Lamp", "Install the broken Brainmelt Lamp.");
			
			if(flags["DOLLMAKER_FIX_EMITTER"] != undefined) addDisabledButton(2, "Gun", "Install Bimboleum Emitter", "You have already installed this!");
			else if(!pc.hasItemByClass(BimboleumEmitter)) addDisabledButton(2, "Gun", "Install Bimboleum Emitter", "You need the Bimboleum emitter.");
			else addButton(2, "Gun", drBadgerLabDollMaker, "fix emitter", "Install Bimboleum Emitter", "Install the Bimboleum emitter.");
			
			if(flags["DOLLMAKER_FIX_VISOR"] != undefined) addDisabledButton(3, "Visor", "Install Mindwash Visor", "You have already installed this!");
			else if(!pc.hasItemByClass(MindwashVisor)) addDisabledButton(3, "Visor", "Install Mindwash Visor", "You need the Mindwash visor.");
			else addButton(3, "Visor", drBadgerLabDollMaker, "fix visor", "Install Mindwash Visor", "Install the Mindwash visor.");
			
			addButton(14, "Back", drBadgerLabDollMaker, "fix done");
			break;
		case "fix iqbgone":
		case "fix lamp":
		case "fix emitter":
		case "fix visor":
			showDollmaker();
			
			if(response == "fix iqbgone")
			{
				output("You manage to reattach the syringe, making sure not to prick yourself with it by accident.");
				
				pc.destroyItemByClass(IQBGone);
				flags["DOLLMAKER_FIX_IQBGONE"] = 1;
			}
			if(response == "fix lamp")
			{
				output("After taking out the Brainmelt lamp, you hook it back onto the machine. Despite being on, it’s still broken. Not much you can do about that now.");
				
				pc.destroyItemByClass(BrokenBrainmeltLamp);
				flags["DOLLMAKER_FIX_LAMP"] = 1;
			}
			if(response == "fix emitter")
			{
				output("You reconnect the Bimboleum emitter to a hanging piece. It clicks into place.");
				
				pc.destroyItemByClass(BimboleumEmitter);
				flags["DOLLMAKER_FIX_EMITTER"] = 1;
			}
			if(response == "fix visor")
			{
				output("You hook up the Mindwash visor, plugging it in. The Doll Maker as a whole is powerless, however.");
				
				pc.destroyItemByClass(MindwashVisor);
				flags["DOLLMAKER_FIX_VISOR"] = 1;
			}
			output("\n\n");
			
			processTime(2);
			
			addButton(0, "Next", drBadgerLabDollMaker, "fix");
			break;
		case "fix done":
			showDollmaker();
			
			var numSlotted:int = 0;
			if(flags["DOLLMAKER_FIX_IQBGONE"] != undefined) numSlotted++;
			if(flags["DOLLMAKER_FIX_LAMP"] != undefined) numSlotted++;
			if(flags["DOLLMAKER_FIX_EMITTER"] != undefined) numSlotted++;
			if(flags["DOLLMAKER_FIX_VISOR"] != undefined) numSlotted++;
			
			if(numSlotted > 0)
			{
				output("Despite having");
				if(numSlotted <= 1) output(" one");
				else if(numSlotted <= 2) output(" a couple");
				else if(numSlotted <= 3) output(" a few");
				else output(" all");
				output(" the salvaged parts reconnected, the Doll Maker as a whole is too damaged to turn on. Though, you’re wondering if you’d even want to turn it on.");
			}
			else output("Having no available parts to install, the Doll Maker looks inoperable at the moment.");
			if(numSlotted >= 4) output(" Regardless, you need to talk to Badger if you want it up and running again.");
			output("\n\n");
			
			addButton(0, "Next", drBadgerLabDollMaker, "back");
			break;
		case "badger fix":
			showDrBadger();
			
			var numTaken:int = 0;
			if(flags["DOLLMAKER_LOOT_IQBGONE"] != undefined && flags["DOLLMAKER_FIX_IQBGONE"] == undefined) numTaken++;
			if(flags["DOLLMAKER_LOOT_LAMP"] != undefined && flags["DOLLMAKER_FIX_LAMP"] == undefined) numTaken++;
			if(flags["DOLLMAKER_LOOT_EMITTER"] != undefined && flags["DOLLMAKER_FIX_EMITTER"] == undefined) numTaken++;
			if(flags["DOLLMAKER_LOOT_VISOR"] != undefined && flags["DOLLMAKER_FIX_VISOR"] == undefined) numTaken++;
			
			if(flags["DOLLMAKER_DISASSEMBLED"] == undefined || flags["DOLLMAKER_DISASSEMBLED"] < 3)
			{
				if(!pc.isAss()) output("The good samaritan in you");
				else output("The small shred of goodness in you");
				output(" tells you to fix Badger’s toy that you broke (but then again, you were only defending yourself), even if they’re going to be used for... probably something that a normal person would question. The only other thing that crosses your mind is: <i>‘let’s just get this over with’</i>.");
				output("\n\nYou speak up to catch the doctor’s attention. <i>“Hey, Badger. I noticed the Doll Maker is still broken down there. Did you want it fixed?”</i> You ask neutrally. This is a pretty morally ambiguous situation, you feel it’s a better idea not to show emotion here.");
				output("\n\n<i>“Actually, yes, [pc.name]. Would you be a </i>doll<i> and fix it?”</i> Badger jokes, before turning a little more serious. <i>“I can fix most of it by myself, but didn’t you take some of the important parts when you were done with it?”</i>");
				if(numTaken <= 0) output("\n\n<i>“Nope. Everything should be there,”</i> you reply. <i>“Even if they are broken.”</i>");
				else output("\n\n<i>“Yes. I might still have something laying around. That, or I sold it.”</i>");
				output("\n\n<i>“Regardless, I need to get back there and fix the other parts that you broke. Thanks for that, by the way.”</i> Badger says, turning to you from the pile of junk. <i>“Eh, let’s just head back now and have a look. Then we’ll see what errands you can do for me.”</i>");
				
				currentLocation = "BIMBOTORIUM LAB";
				generateMap();
				
				output("\n\nYou reluctantly head to the back of the lab with Badger. You pass by a shelf of increasingly big dildoes (the largest one being bigger than a bazooka), before approaching the spindly collection of limbs. Badger looks at the components of the device.");
				output("\n\n<i>“Well, first things first, the whole thing is damaged. Even with the few lost pieces, I’m going to need to fix some of the core parts. Let’s see what’s missing, though.”</i> Badger starts to pull down pieces of the machine to look at them.");
				if(flags["DOLLMAKER_LOOT_IQBGONE"] != undefined && flags["DOLLMAKER_FIX_IQBGONE"] == undefined) output("\n\n<i>“The IQ-B-GONE is... well, gone,”</i> Badger says, looking at a spot where a syringe would clearly fit.");
				if(flags["DOLLMAKER_LOOT_LAMP"] != undefined && flags["DOLLMAKER_FIX_LAMP"] == undefined) output("\n\n<i>“Huh, looks like the lamp is missing,”</i> Badger states, holding a flat piece where the Brainmelt lamp goes.");
				if(flags["DOLLMAKER_LOOT_EMITTER"] != undefined && flags["DOLLMAKER_FIX_EMITTER"] == undefined) output("\n\n<i>“Damn. The Bimboleum emitter isn’t here,”</i> Badger states, holding the broken limb.");
				if(flags["DOLLMAKER_LOOT_VISOR"] != undefined && flags["DOLLMAKER_FIX_VISOR"] == undefined) output("\n\n<i>“The Mindwash visor disappeared, unfortunately,”</i> she says, looking at the bland, hanging piece.");
				if(numTaken <= 0) output("\n\n<i>“Looks like everything is here. Nice. Now it just needs some basic repairs, and it’ll be up and running.”</i> Badger smiles deviously.");
				output("\n\n");
				
				processTime(11);
				
				// After viewing this scene, the “fix doll m.” button brings up a submenu that displays all four parts. If a piece isn’t fixed, clicking on it will output one of the following scenes to explain how to fix it. If the criteria is met to fix the item, the scene of Badger fixing it will be used. If the item is fixed, the button is grayed out.
				flags["DOLLMAKER_DISASSEMBLED"] = 3;
				
				addButton(0, "Next", drBadgerLabDollMaker, "badger fix");
			}
			// Next, 1 or more things are missing
			else if(numTaken > 0)
			{
				// From previous
				if(flags["DOLLMAKER_DISASSEMBLED"] < 4)
				{
					output("<i>“Well, now we know what we need before I can get this bad boy going again. It’s been fun exploring other methods to... help out my patients, but there are other projects that require my full attention,”</i> Badger explains before leading you back to the front of her lab. You get a clue where she is going with this.");
					
					currentLocation = "304";
					generateMap();
					
					output("\n\n<i>“So I just need to find the missing parts?”</i> you ask.");
					output("\n\n<i>“Yes. But you can’t exactly buy them anywhere. However, maybe if you ask nicely, I’ll tell you what I need to rebuild them.”</i>");
					
					processTime(5);
					flags["DOLLMAKER_DISASSEMBLED"] = 4;
				}
				// Repeats
				else
				{
					output("<i>“Anything else?”</i> Badger asks, an eyebrow cocked behind her goggles and a grin forming across her face.");
				}
				output("\n\n");
				
				// [Syringe] [Lamp] [Gun] [Visor] [Next]
				// Any pieces that are already attached are grayed out.
				if(flags["DOLLMAKER_FIX_IQBGONE"] != undefined) addDisabledButton(0, "Syringe", "Fix IQ B-Gone", "You have already installed this!");
				else addButton(0, "Syringe", drBadgerLabDollMaker, "fix? iqbgone", "Fix IQ B-Gone", "Ask Doctor Badger about syringe full of IQ B-Gone.");
				
				if(flags["DOLLMAKER_FIX_LAMP"] != undefined) addDisabledButton(1, "Lamp", "Fix Brainmelt Lamp", "You have already installed this!");
				else addButton(1, "Lamp", drBadgerLabDollMaker, "fix? lamp", "Fix Brainmelt Lamp", "Ask Doctor Badger about the broken Brainmelt Lamp.");
				
				if(flags["DOLLMAKER_FIX_EMITTER"] != undefined) addDisabledButton(2, "Gun", "Fix Bimboleum Emitter", "You have already installed this!");
				else addButton(2, "Gun", drBadgerLabDollMaker, "fix? emitter", "Fix Bimboleum Emitter", "Ask Doctor Badger about the Bimboleum emitter.");
				
				if(flags["DOLLMAKER_FIX_VISOR"] != undefined) addDisabledButton(3, "Visor", "Fix Mindwash Visor", "You have already installed this!");
				else addButton(3, "Visor", drBadgerLabDollMaker, "fix? visor", "Fix Mindwash Visor", "Ask Doctor Badger about the Mindwash visor.");
				
				addButton(14, "Back", mainGameMenu);
			}
			// All pieces added, will proc when entering Badger’s square, and also if all pieces were added by the player, or none taken at all
			else
			{
				output("Badger stops you in your tracks as you walk about. <i>“Well, Steele, we’ve got all the pieces. I’ll handle the rest of the fixing. And this time, I’m reinforcing all of them so if you break any, it can repair itself over time.”</i>");
				output("\n\n<i>“Happy to help... or something. How long is it going to take until it’s fixed?”</i> You ask, nonchalantly.");
				output("\n\n<i>“Probably a few days. Why, are you eager to play with it?”</i> Badger teases. <i>“Either way, I’m back in business, thanks to you. Even though it was you who put me out of business...”</i> The doctor chuckles and goes back to her ‘work’, leaving you alone for now.");
				output("\n\n<b>The Doll Maker will be available to interact with shortly.</b>");
				output("\n\n");
				
				processTime(2);
				
				// Activate 48 hour timer, doll maker is available when it ends
				pc.createStatusEffect("Doll Maker Repair Timer", 0, 0, 0, 0, true, "", "", false, (48 * 60));
				flags["DOLLMAKER_DISASSEMBLED"] = undefined;
				if(flags["DOLLMAKER_FIXED"] == undefined) flags["DOLLMAKER_FIXED"] = 1;
				
				addButton(14, "Back", mainGameMenu);
			}
			break;
		case "fix? iqbgone":
			showDrBadger();
			
			output("<i>“So how would I go about getting some IQ-B-GONE?”</i> you ask. <i>“It’s pretty serious stuff, I wouldn’t be surprised if I needed a million ingredients to--”</i> You stop talking as Badger holds out a green syringe and shows it to you.");
			output("\n\n<i>“Luckily for you, I have plenty of this stuff already. Give it to the police and I’ll torture you. I’ll skip the bimbofication part and just hurt you.”</i> Badger explains with a frightening coldness. You take a step back before she starts talking again. <i>“Nah, I’m just fucking with you. But I would definitely turn you into the dumbest bimbo ever. Don’t. Get. Involved. With. The. Police.”</i>");
			output("\n\nPoint taken.");
			output("\n\n");
			
			processTime(2);
			
			flags["DOLLMAKER_ASK_IQBGONE"] = 1;
			// IQ-B-GONE is added to the doll maker
			flags["DOLLMAKER_FIX_IQBGONE"] = 2;
			
			addButton(0, "Next", drBadgerLabDollMaker, "badger fix");
			break;
		case "fix? lamp":
			showDrBadger();
			
			output("<i>“So what would you need for making a new Brainmelt lamp?”</i> you ask plainly.");
			output("\n\n<i>“Well, y’see, I need the parts from some sort of electro gun. I already have the part that reduces brain cell count, I just need the part that distributes that power.");
			if(flags["TARKUS_DESTROYED"] == undefined || pc.hasItemByClass(Electrogun))
			{
				output(" Im pretty sure you can find something not far from here, maybe one of the shops off to the west has something.");
				if(flags["DOLLMAKER_ASK_LAMP"] != undefined) output(" In fact, I’m pretty sure that bat kid has something we could use.");
				
				flags["DOLLMAKER_ASK_LAMP"] = 1;
				
				// Player is required to purchase an electrogun from the bat kid, Aurora
				if(pc.hasItemByClass(Electrogun)) addButton(0, "Give Gun", drBadgerLabDollMaker, "fix? lamp fix", "Give Electrogun", "Give Doctor Badger your electrogun.");
				else addDisabledButton(0, "Give Item", "Give Item", "You do not have the right item on you to give to Doctor Badger!");
			}
			else
			{
				if(flags["DOLLMAKER_ASK_LAMP"] == undefined || flags["DOLLMAKER_ASK_LAMP"] == 1) output(" Actually, I think I can order it, I just need the legal tender to do it... Are you willing to part with <b>3,000 credits</b> for it?");
				else output(" To order it, I’ll need that <b>3,000 credits</b>.");
				
				flags["DOLLMAKER_ASK_LAMP"] = 2;
				
				if(pc.credits >= 3000) addButton(0, "Pay Creds", drBadgerLabDollMaker, "fix? lamp pay", "Pay Credits", "Pay Doctor Badger the 3,000 credits.");
				else addDisabledButton(0, "Pay Creds", "Pay Credits", "You do not have enough credits to pay Doctor Badger with!");
			}
			output("”</i>");
			output("\n\n");
			
			processTime(2);
			
			addButton(14, "Never Mind", drBadgerLabDollMaker, "badger fix");
			break;
		case "fix? lamp fix":
			showDrBadger();
			
			output("<i>“Hey Badger, how would this work as a part for the Brainmelt lamp?”</i> you ask, pulling out an electrogun, bought from Aurora. Though it’s not exactly amazing, you assume it’ll do the trick. Badger quickly pulls the gun from your hand, looking at it with a determined expression before setting it on her desk. She disassembles it with speed, before putting on a rubber glove and pulling out the electric core. She holds it up, the make-shift lamp glowing with sinister intensity in front of both of you.");
			output("\n\n<i>“Hmm. I’d say it could work, though I’ll have to make some adjustments so it doesn’t break. Consider the Brainmelt lamp fixed,”</i> Badger says. She grins before setting the core in a small jar and removing her glove. <i>“I’m going down to put something together. Don’t do anything stupid while I’m gone.”</i>");
			output("\n\nYou find a place to sit for the time being until she proudly comes back. <i>“The bad boy is closer and closer to being done every day. Can’t wait to use it again.”</i>");
			output("\n\n");
			
			processTime(7);
			
			// The brainmelt lamp is automatically added to the doll maker
			pc.destroyItemByClass(Electrogun);
			flags["DOLLMAKER_FIX_LAMP"] = 2;
			
			addButton(0, "Next", drBadgerLabDollMaker, "badger fix");
			break;
		case "fix? lamp pay":
			showDrBadger();
			
			output("What’s a sinkhole in your accounts, right? You agree to pay Badger’s criminally insane price. She quickly swipes a credits scanner across your Codex and it confirms the payment with a beep.");
			output("\n\n<i>“Thanks. Pleasure doing business with you.”</i> Doctor Badger grins, fingers tapping rhythmically along her desk top and drawing your attention to some spare mechanical parts, already spread out in full display, next to a carefully dismantled electrogun. It becomes painfully obvious to you that the money wasn’t necessary to order the parts, but more for her own personal amusement...");
			output("\n\n");
			
			processTime(3);
			
			pc.credits -= 3000;
			flags["DOLLMAKER_FIX_LAMP"] = 3;
			
			addButton(0, "Next", drBadgerLabDollMaker, "badger fix");
			break;
		case "fix? emitter":
			showDrBadger();
			
			output("<i>“Badger, what would you need for making a Bimboleum emitter?”</i>");
			output("\n\n<i>“Well, let’s start with the basics. To make some more Bimboleum, I’ll have to get a dose of Tittyblossom and Semen’s Friend. Both are somewhat common, you could probably get them at a gene mod store. Not too expensive either,”</i> Badger explains.");
			if(!pc.isBimbo())
			{
				output("\n\n<i>“Really? Only two ingredients?”</i> you ask. <i>“To permanently alter someone’s mind and body?”</i>");
				output("\n\n<i>“Good one, smartass, but there’s more ingredients I can handle myself, and I’m pretty sure you couldn’t get your hands on them even if you tried.”</i> You roll your eyes while she continues. <i>“And even if you could, you wouldn’t know how to sustain them.”</i>");
				output("\n\n<i>“Fine, fine, I’ll get your damn mods. Relax.”</i>");
				if(pc.isAss()) output("\n\nYou quietly mutter <i>“fucking bitch”</i> on your way out.");
			}
			else
			{
				output("\n\n<i>“Like, only two things? I’ll have that in no time!”</i> you shout with glee.");
				output("\n\n<i>“Only two things that you need to worry about, anyway. Just get them, come back, and maybe have fun with some locals on the way. Enjoy yourself out there,”</i> Badger suggests with a bit of enthusiasm. She’s so cool.");
			}
			output("\n\n");
			
			processTime(2);
			
			flags["DOLLMAKER_ASK_EMITTER"] = 1;
			
			if(pc.hasItemByClass(Tittyblossom) && pc.hasItemByClass(SemensFriend)) addButton(0, "GiveItems", drBadgerLabDollMaker, "fix? emitter fix", "Give Items", "Give Doctor Badger a Tittyblossom popsicle and a Semen’s Friend candy.");
			else addDisabledButton(0, "GiveItems", "Give Items", "You need Tittyblosson and Semen’s Friend to give to Doctor Badger!");
			addButton(14, "Never Mind", drBadgerLabDollMaker, "badger fix");
			break;
		case "fix? emitter fix":
			showDrBadger();
			
			output("<i>“Badger, I got the stuff,”</i> you pipe up. <i>“Tittyblossom and Semen’s Friend, right? I got them, right here.”</i> You begin to ready the items, taking a cold wrapped popsicle and boxed pill from your inventory.");
			output("\n\nBadger turns her attention to you. <i>“Oh, really? Good, because I’m ready to make another Bimboleum emitter.”</i> You hand the transformatives to Badger, or rather, she snatches them from your hand. You dismiss the rude gesture and just watch her work. She seems to dissolve both things into a vial, before mixing several other ingredients into it. Before long, she dumps the mixture into an open gun with a satellite shaped front. She closes the gun and shakes it up some, mixing the questionable concoction within. She then aims the emitter at you.");
			if(!pc.isBimbo())
			{
				output("\n\n<i>“Woah, woah, easy there.”</i> You put your arms up, defensively. Badger smiles before twirling the gun around her finger like a holo-movie gunslinger of sorts.");
				output("\n\n<i>“Calm down, scaredy cat. The power is off; I haven’t even charged the module yet.”</i> She demonstrates by clicking the trigger a few times before just detaching it. <i>“I’ll get this installed as soon as possible, where it WILL work.”</i> The doctor says, smirking. She then clicks the gun onto her belt.");
			}
			else
			{
				output("\n\n<i>“Yeah Badger, give me bigger boobies!”</i> you shout. Badger pauses, staring at you before putting the gun down. You tilt your head and frown a little. <i>“Aw...”</i>");
				output("\n\n<i>“It doesn’t even work without power, y’know.”</i> She clicks the trigger on it a few times, to no effect. She simply detaches the trigger before putting the gun on her belt. <i>“I’ll install this as soon as possible, where it WILL work... and you’ll be able to have all the fun you want with it.”</i> Badger smiles, going back to her work.");
			}
			output("\n\n");
			
			processTime(9);
			
			// Bimboleum emitter is added to the doll maker
			pc.destroyItemByClass(Tittyblossom);
			pc.destroyItemByClass(SemensFriend);
			flags["DOLLMAKER_FIX_EMITTER"] = 2;
			
			addButton(0, "Next", drBadgerLabDollMaker, "badger fix");
			break;
		case "fix? visor":
			showDrBadger();
			
			output("<i>“Badger. The visor?”</i> you simply ask. <i>“For the Doll Maker, I mean. Let me guess, I need to fetch a few items for you and you’ll make another?”</i>");
			output("\n\n<i>“Actually, how about you </i>fetch<i> your wallet and make out a chip worth about <b>seven thousand, eight hundred seventy-five credits</b>?”</i> You raise your brow at the requirement. <i>“That’s right. The only way to get one of these is to buy it off me.”</i>");
			output("\n\n<i>“It’s </i>your<i> Doll Maker, why aren’t you paying it?”</i> you insist.");
			output("\n\n<i>“Because you broke it, Steele. Remember?”</i> She’s got you there: you straight-up smashed it the moment it tried to wipe your past. <i>“You paying up or are we going to leave it broken?”</i>");
			output("\n\n");
			
			processTime(2);
			
			// Pay up: Pay 7875 credits to buy another mindwash visor.
			// Not now: Another time.
			// Not now puts the player in the normal lab screen
			flags["DOLLMAKER_ASK_VISOR"] = 1;
			
			// [Pay up] [Not now]
			if(pc.credits >= 7875) addButton(0, "Pay Up", drBadgerLabDollMaker, "fix? visor fix", "Pay Credits", "Pay Doctor Badger the 7,875 credits.");
			else addDisabledButton(0, "Pay Up", "Pay Credits", "You do not have enough credits to pay Doctor Badger with!");
			addButton(1, "Not Now", drBadgerLabDollMaker, "badger fix");
			break;
		case "fix? visor fix":
			showDrBadger();
			
			output("Annoyed, you sigh and prepare a credit chip, inserting 7,875 credits onto it before forking it over to the mad doctor. She takes it from your hand, a small smile appearing across her lips before she pockets it. Badger then looks through her things, preparing a shiny, new Mindwash visor. She’s about to hand it to you, but then pulls back.");
			output("\n\n<i>“Oh right, that money’s for the replacement of the visor. I think I’ll put this one in; be a dear and don’t smash it to pieces this time.”</i> She sets the visor on her desk, taking her attention away from you and moving it to her work. <i>“I’ll put it on shortly.”</i>");
			output("\n\n");
			
			processTime(3);
			
			// Mindwash visor is added to the doll maker
			pc.credits -= 7875;
			flags["DOLLMAKER_FIX_VISOR"] = 2;
			
			addButton(0, "Next", drBadgerLabDollMaker, "badger fix");
			break;
		case "play":
		case "play back":
			showDollmaker();
			
			if(response == "play") output("You look over the several parts of the machine. Now that you’re not fighting it, you don’t have to worry about anything being suddenly forced upon you. If you want to get seriously fucked up, it’ll be by your own accord. Even then, you could use each tool just a little bit if you just want to test it. It seems each part is capable of running individually without the need for the entire thing to be on, so you don’t have to worry about the robot suddenly calling you a jizz basket and blowing your body up like a balloon.");
			else output("What else do you want to do with the machine?");
			if(!pc.hasStatusEffect("Bimboleum"))
			{
				output("\n\nYou could use the Bimboleum emitter to make your chest");
				if(pc.hasCock()) output(" and cock");
				output(" bigger, though it may make you weaker.");
			}
			if(!pc.hasStatusEffect("Latex Sprayed")) output("\n\nYou could use the spray to cover your skin in latex, your choice of color, though it may make your movements more rigid. Who knows? Maybe thick, latex skin could be cool to have.");
			if(!pc.hasStatusEffect("Mindwashed")) output("\n\nYou could use the Mindwash visor to watch free porn, but it might make you all dizzy when you’re done.");
			if(!pc.hasStatusEffect("IQ B-Gone")) output("\n\nYou could use the IQ-B-GONE to... well, it could be fun, but you’ll definitely be knocked down a few pegs in the intelligence region.");
			if(!pc.hasStatusEffect("Brainmelt Lamps")) output("\n\nYou could use the Brainmelt lamps for... again, it could be fun.");
			output("\n\n");
			
			processTime(1);
			
			// [B. Emitter] [Spray] [MW Visor] [IQ-B-GONE] [Brainmelt L.] [Back]
			addButton(0, "B.Emitter", drBadgerLabDollMaker, "use emitter", "Bimboleum Emitter", "Trade out some physique for bigger tits and/or a bigger dick.");
			addButton(1, "Ltx.Spray", drBadgerLabDollMaker, "use spray", "Latex Sprayer", "Trade out reflexes to change your skin color.");
			addButton(2, "MW Visor", drBadgerLabDollMaker, "use visor", "Mindwash Visor", "Trade out some aim for free porn.");
			addButton(3, "IQBGone", drBadgerLabDollMaker, "use iqbgone", "IQ B-Gone", "Trade out intelligence for sheer libido.");
			addButton(4, "B.B.Melt", drBadgerLabDollMaker, "use lamp", "Brainmelt Lamp", "Temporarily drain willpower to gain more when it wears off... or just fuck yourself up for fun. Who doesn’t love having their brain melted?");
			
			addButton(14, "Back", drBadgerLabDollMaker, "back");
			
			// Taking a big dose of anything will have permanent adverse effects. Taking a small dose will result in a temporary huge stat loss, but it will come back at about 1 point an hour, and gives an extra point back when the effects are done. Taking two small doses just adds them together (i.e. the stat just doubles). What doesn’t kill you makes you stronger, right?
			break;
		case "use emitter":
			showDollmaker();
			
			output("You grab the limb holding the Bimboleum emitter, studying it. You pull it down, the joints of the arm straightening out while you do so. Eventually, you have full access to the black limb, the Bimboleum emitter on the end a little brighter than the rest of the arm.");
			output("\n\nThis singular piece of machinery could blow you up like a balloon if you let it. Or you could just take a minor dose, for temporary effects.");
			output("\n\n");
			
			processTime(1);
			
			// [Big dose] [Small dose] [Back]
			if(pc.hasStatusEffect("Bimboleum"))
			{
				addDisabledButton(0, "Small Dose", "Small Dose", "It would be too dangerous to try this again while you are already under the influence of this effect.");
				addDisabledButton(1, "Big Dose", "Big Dose", "It would be too dangerous to try this again while you are already under the influence of this effect.");
			}
			else
			{
				addButton(0, "Small Dose", drBadgerLabDollMaker, "min emitter", "Small Dose", "Temporarily trade out some physique for bigger assets.");
				addButton(1, "Big Dose", drBadgerLabDollMaker, "max emitter", "Big Dose", "Trade out lots of physique for bigger assets.");
			}
			addButton(14, "Back", drBadgerLabDollMaker, "play back");
			break;
		case "min emitter":
			showDollmaker();
			
			output("You take the Bimboleum emitter, raising it up slowly before pointing it outward. You make sure to be careful, as you wouldn’t want to turn it on now, or have any lasting effects... just a quick high is all, right?");
			output("\n\nYour fingers shake a little as you set up the limb and move to stand in front of it. You’re just so nervous; what if you can’t get away in time? Then what, you’re a giant balloon with no muscle mass? You sigh deeply as you think about all the potential dangerous things that could happen.");
			output("\n\nFinally, it’s time for the big event. Your click the small ‘on’ switch and prepare yourself. A thick pink haze coats the area in front of you, drifting about to surround you. The changes start with your [pc.breasts]. They swell outwards while muscle mass from the rest of your body seemingly softens, your boobs blowing through cup sizes quickly. Even your butt is affected, each cheek inflating " + (silly ? "bigly" : "considerably") + " while your [pc.skin] drinks in the aura. It feels so good. Good enough that you want more....");
			output("\n\nWait, no! You can’t have more!");
			if(pc.isBimbo()) output(" Even if giant titties would be fun... this is getting dangerous!");
			output(" You quickly break away from the aura, slapping down on the gun’s off switch. Within seconds, the pink haze disappears as if it had never existed at all. Your body remains changed though, your proportions inflated significantly. Your muscles are smaller as well, but you’re sure you’ll be back to normal soon enough.");
			output("\n\n");
			
			processTime(8);
			
			// Gain status effect: Bimboleum
			// It’s the same status effect as you get in the doll maker fight, though somewhat changed. It’s minus 15 physique, but 1 point comes back every hour. Additionally, the player’s breasts, hip, and butt size are increased by 15 and decrease 1 per hour. When the effect ends, the player gets 1 bonus point to physique
			nMult = 15;
			createDollMakerStatusEffect(pc, "Bimboleum", (1 * nMult), (1 * nMult), (1 * nMult), (1 * nMult), false, (60 * nMult));
			pc.lust(35);
			
			IncrementFlag("DOLLMAKER_USE_EMITTER");
			
			addButton(0, "Next", drBadgerLabDollMaker, "play back");
			break;
		case "max emitter":
			showDollmaker();
			
			output("Big boobs");
			if(pc.hasCock()) output(", a bigger dick,");
			output(" and a bigger butt? Count you in! Who cares if you lose some muscle; having huge assets are where it’s at!");
			output("\n\nYou ready the limb, activating it from the base without enabling the whole machine. You happily stand in front of the Bimboleum emitter as it prepares itself. Holding your [pc.chest] out high, you tightly close your eyes and take a deep breath when the gun whirrs. A pink glow travels out from the gun, bending the air around it while it drifts toward you. When it touches you, your whole body is bathed in a toxic cloud.");
			if(flags["DOLLMAKER_USE_EMITTER"] != undefined) output(" The lovely feeling of your body expanding is similar to the first time you’ve experienced it. The process is a lot less stressful when you just let it happen, especially when it’s not being forced on you.");
			output("\n\nYou’re getting turned on while your muscles quickly soften... as soft as the fat from a pair of big, juicy tits. An almost silent sigh escapes your lips while weight builds on your [pc.chest], swelling in size as they absorb the pink aura surrounding you.");
			if(pc.biggestTitSize() >= 5) output(" Even with your big boobs, you can notice the rapid changes happening within.");
			else output(" Thanks to the fact that your boobs aren’t exactly big, you immediately notice the rapid expansion happening within.");
			output(" It just feels so good; you can’t control yourself while your body expands, your hands struggling to grip your inflating assets.");
			output("\n\nYour lower half isn’t neglected either, as your [pc.asscheeks] bubble up quickly. Your waist only gets thinner while your [pc.hips] grow outwards, your proportions becoming more and more ridiculous by the second. The only thing left to do is stand there and enjoy it for a few more minutes.");
			output("\n\nYour muscles have gotten much smaller; a significant amount of definition has been exchanged for more mass to occupy your tits and ass.");
			if(pc.hasCock())
			{
				output("\n\nOf course, there’s one last part that’s affected: your [pc.cock]. Blood pumps through every vein on your shaft, the [pc.cockColor] cockflesh stretching as it gains inches. Your erection grows harder than ever, and bigger than ever.");
				if(pc.balls > 0) output(" The [pc.sack] swinging beneath grows as well, " + (pc.balls == 1 ? "your" : "each") + " testicle rapidly filling up with [pc.cum]. Before you know it, they’re seemingly overflowing while dollops of pre drip from your [pc.cockHead].");
				output(" Everything down there is just so swollen that you might want to handle yourself after this.");
			}
			output("\n\nYou eventually step out of the haze, breathing heavy with how aroused you suddenly are. You turn off the machine, loosely groping your newly blown up assets. It proves much harder to stand now, but you’re evidently more sexy than you were before.");
			output("\n\n");
			
			processTime(15);
			
			// Boob size increases by 7, butt by 8, and hip by 8. Cock size grows by up to 4 inches if they have one, balls diameter increases by up to 3 inches. Cum capacity is maxed, refractory rate increases by 200%.
			// Decrease tone by 20, decrease thickness by 10
			// Increase taint by 2 and max out lust
			// Physique is decreased by 5-10
			// Player is put in normal doll maker lab screen
			pc.physique(-5);
			pc.modTone(-20, false);
			pc.modThickness(-10, false);
			for(i = 0; i < pc.breastRows.length; i++)
			{
				pc.breastRows[i].breastRatingRaw += 7;
			}
			pc.hipRatingRaw += 8;
			pc.buttRatingRaw += 8;
			if(pc.hasCock())
			{
				for(i = 0; i < pc.cocks.length; i++)
				{
					pc.cocks[i].cLengthRaw += 4;
					if(pc.hasPerk("Hung")) pc.cocks[i].cLengthRaw += 2;
					if(pc.hasPerk("Mini")) pc.cocks[i].cLengthRaw -= 2;
				}
				if(pc.balls > 0)
				{
					pc.ballSizeRaw += 3;
					if(pc.hasPerk("Bulgy")) pc.ballSizeRaw += 1.5;
				}
				if(pc.ballFullness < 100) pc.ballFullness = 100;
				if(pc.refractoryRate < 30) pc.refractoryRate += 2;
			}
			pc.taint(2);
			pc.maxOutLust();
			
			IncrementFlag("DOLLMAKER_USE_EMITTER");
			
			addButton(0, "Next", drBadgerLabDollMaker, "play back");
			break;
		case "use spray":
			showDollmaker();
			
			output("You take the sprayer arm down from the Doll Maker, accessing the limb easily. You hold it out in front of you, looking at the color variants. It seems arm can’t switch the colors on its own, but requires the help of an operator. In this case, you.");
			output("\n\nThere are a number of colors available to choose from and the color canister could easily be switched out for another if you so desire. If you’re feeling up to it, you could also give yourself a nice, new coat of color--though it’ll be a latex coating to be precise.");
			output("\n\nIf you take a big dose, you’ll permanently change your skin. If you take less, the colored coat could peel off over time.");
			output("\n\n");
			
			processTime(1);
			
			if(pc.hasStatusEffect("Latex Sprayed"))
			{
				addDisabledButton(0, "Small Dose", "Small Dose", "It would be too dangerous to try this again while you are already under the influence of this effect.");
				addDisabledButton(1, "Big Dose", "Big Dose", "It would be too dangerous to try this again while you are already under the influence of this effect.");
			}
			else
			{
				addButton(0, "Small Dose", drBadgerLabDollMaker, "min spray", "Small Dose", "Temporarily trade out some reflexes for latex skin.");
				addButton(1, "Big Dose", drBadgerLabDollMaker, "max spray", "Big Dose", "Trade out lots of reflexes for latex skin.");
			}
			addButton(14, "Back", drBadgerLabDollMaker, "play back");
			break;
		case "min spray":
		case "max spray":
			showDollmaker();
			
			output("You’ve decided that you want to use the latex spray gun. What color do you use?");
			output("\n\n");
			
			var sprayColors:Array = [];
			
			sprayColors.push(["Red", "red"]);
			sprayColors.push(["Orange", "orange"]);
			sprayColors.push(["Yellow", "yellow"]);
			sprayColors.push(["Green", "green"]);
			sprayColors.push(["Blue", "blue"]);
			
			sprayColors.push(["Purple", "purple"]);
			sprayColors.push(["Pink", "pink"]);
			sprayColors.push(["Cyan", "cyan"]);
			sprayColors.push(["Black", "black"]);
			sprayColors.push(["White", "white"]);
			
			sprayColors.push(["Silver", "silver"]);
			sprayColors.push(["Gold", "gold"]);
			sprayColors.push(["Platinum", "platinum"]);
			sprayColors.push(["Iridescent", "iridescent"]);
			
			for(i = 0; i < sprayColors.length; i++)
			{
				addButton(i, sprayColors[i][0], drBadgerLabDollMakerSprayRouter, [pc, response, sprayColors[i][1]], StringUtil.toDisplayCase(sprayColors[i][1]), ("Spray paint your skin to " + sprayColors[i][1] + "."));
			}
			addButton(14, "Back", drBadgerLabDollMaker, "use spray");
			break;
		case "min spray go":
			showDollmaker();
			
			var latexColorMin:String = (flags["DOLLMAKER_LATEX_SKIN"] != undefined ? flags["DOLLMAKER_LATEX_SKIN"][3] : "black");
			
			output("Sure, latex skin is fun and all, but maybe not permanently. You decide you’ll only spray yourself with some " + latexColorMin + ", and not so much that won’t come off.");
			output("\n\nYou prepare the device, setting up the spray, replacing the can with the chosen color, and pointing the nozzle towards yourself. Nervousness sits in your frame as you continue, your fingers shaking slightly when you get ready to click the button.");
			output("\n\nYou turn the device on and stand there as the " + latexColorMin + " latex goo bursts out, hitting you and crawling along your skin. It’s warm while it coats you up and down. You quickly move out of the way once you are completely wrapped in the stuff and decide you’ve got plenty of it. As expected, it makes your movements rigid, but eventually, you know it will chip off. For the time being, <b>you now have " + latexColorMin + " latex skin.</b>");
			output("\n\n");
			
			processTime(8);
			
			// Player gets status effect: Latex Sprayed
			// Almost the same thing as during the fight; the player loses 15 reflexes, 1 point coming back every hour. Once it’s over, their skin goes back to whatever it was, and they get a bonus point of reflexes
			nMult = 15;
			createDollMakerStatusEffect(pc, "Latex Sprayed", (1 * nMult), 0, 0, 0, false, (60 * nMult));
			pc.skinType = GLOBAL.SKIN_TYPE_LATEX;
			pc.clearSkinFlags();
			pc.addSkinFlag(GLOBAL.FLAG_SMOOTH);
			pc.skinTone = latexColorMin;
			pc.lust(15);
			
			IncrementFlag("DOLLMAKER_USE_SPRAY");
			
			addButton(0, "Next", drBadgerLabDollMaker, "play back");
			break;
		case "max spray go":
			showDollmaker();
			
			var latexColorMax:String = (flags["DOLLMAKER_LATEX_SKIN"] != undefined ? flags["DOLLMAKER_LATEX_SKIN"][3] : "black");
			
			output("Surely there’s nothing wrong with a fresh coat of latex skin, right?");
			output("\n\nYou carefully unclip the tank of paint from the device, then clip on the " + latexColorMax + " you want. Once it’s attached, you stand in front of the limb, positioning the spout in your direction. Your fingers explore along the machine until you find the spray button. You back up and prepare yourself.");
			output("\n\nYou click the button.");
			output("\n\nA warm jet of " + latexColorMax + " latex goo fizzes out of the lead nozzle, directly toward you. You slowly turn in place to make sure it covers you in your entirety. It seems you didn’t need to though, as the latex paint seems to crawl across your body, tickling you as it sets in and wraps you from top to bottom. Your arms and legs become rigid quickly, but that’s just a small sacrifice for such beauty.");
			
			processTime(15);
			
			// Convert skin over
			pc.skinType = GLOBAL.SKIN_TYPE_LATEX;
			pc.clearSkinFlags();
			pc.addSkinFlag(GLOBAL.FLAG_SMOOTH);
			pc.skinTone = latexColorMax;
			// Gloss level
			pc.createStatusEffect("Latex Skin", 0, 0, 0, 0);
			if(pc.statusEffectv1("Latex Skin") < 3) pc.addStatusValue("Latex Skin",1,1);
			// Player gets black latex perk on first time, with no side effects.
			if(!pc.hasPerk("Black Latex"))
			{
				output("\n\nOnce the paint is completely set in, you look at yourself. Your " + latexColorMax + " arms and " + (pc.hasLegs() ? "legs" : "lower body") + ", as well as your doll-like skin, have a plastic, rubbery look. You’re so pretty.");
				if(latexColorMax != "black") output(" Suddenly, the entire color starts becoming darker, flashing to solid black within seconds before gradually returning back to your chosen color.... Strange.");
				output(" Your skin quickly absorbs the paint you just sprayed on yourself, the rigidity disappearing seconds later.");
				output("\n\n(<b>Perk Gained: Black Latex</b> - Your skin is now hyper-sensitive latex, keeping you constantly at least a little aroused.)");
				pc.createPerk("Black Latex", 0, 0, 0, 0, "Gives you delightful latex skin, but keeps you slightly more aroused at all times.");
			}
			// Second and beyond, PC loses 5-10 reflex, and gains 1 taint
			else
			{
				output("\n\nThe paint completely sets in and <b>you now have " + latexColorMax + ", latex skin!</b>");
				pc.reflexes(-5);
				pc.taint(1);
			}
			output("\n\n");
			pc.lust(35);
			
			flags["DOLLMAKER_LATEX_SKIN"] = undefined;
			
			IncrementFlag("DOLLMAKER_USE_SPRAY");
			
			addButton(0, "Next", drBadgerLabDollMaker, "play back");
			break;
		case "use visor":
			showDollmaker();
			
			output("You pull down the Mindwash visor from the collection of disabled limbs. It sits as two plates, each one presumably belonging on a user’s ears. Once on, a holoscreen would appear and project imagery right in front of the user’s face... a very certain kind of imagery, knowing Badger.");
			output("\n\nYou could use it if you want, but this Mindwash visor doesn’t seem to have a ‘low’ function. This could result in some strange effects. Of course, you could just pull it off if things get too intense... or just indulge without caring.");
			output("\n\n");
			
			processTime(1);
			
			// [Minutes] [Hours]
			if(pc.hasStatusEffect("Mindwashed"))
			{
				addDisabledButton(0, "Quickie", "Quickie", "It would be too dangerous to try this again while you are already under the influence of this effect.");
				addDisabledButton(1, "Immerse", "Immerse", "It would be too dangerous to try this again while you are already under the influence of this effect.");
			}
			else
			{
				addButton(0, "Quickie", drBadgerLabDollMaker, "min visor", "Quickie", "Use the visor for a little bit.");
				addButton(1, "Immerse", drBadgerLabDollMakerVisorHours, undefined, "Immerse", "Use the visor for as long as you want.");
			}
			addButton(14, "Back", drBadgerLabDollMaker, "play back");
			break;
		case "min visor":
			showDollmaker();
			
			output("Some porn couldn’t hurt, right? You take each plate like a pair of headphones, and place them on the sides of your head. You search the ear pieces with your fingers before you find the ‘on’ switch. A sigh exits your lips as you prepare yourself.");
			output("\n\nYou press the button.");
			output("\n\nSuddenly, a purple holoscreen flashes right in front of your eyes, somewhat transparent before images and videos begin to appear. Chicks with giant tits bursting out of their clothes, dudes swinging dicks big enough to break someone in half, femboys, snake girls, and much more are stuffed into your mind. You can think about nothing more than sex right now, your hands idly groping yourself while ideas of hardcore porn float through your head. Your brain is like a sponge to all this, sucking up every last drop... but of course, sponges can overflow. Who cares about the training you went through to defend yourself? You could just fuck every enemy until they’re screaming your name.... It’s like all the real memories of learning to fight are squeezed out to make more room for all the absurdly hot characters fucking their way into your head.");
			output("\n\nWait, no!");
			output("\n\nYou quickly take your hands from your [pc.groin] and grab the plates of the visor, ripping them off and turning the device off. Panting while you think of the " + (silly ? "sexcapade" : "sexual escapade") + " you just experienced, you realize how risky that just was. You hold up your hands in front of you... you DO remember how to fight, right? Of course you do. You just need a refresher is all.");
			output("\n\n");
			
			processTime(8);
			
			// +60 lust
			// Gain status effect: Mindwashed
			// -10 aim, 1 point coming back every hour
			nMult = 10;
			createDollMakerStatusEffect(pc, "Mindwashed", (1 * nMult), 0, 0, 0, false, (60 * nMult));
			pc.lust(65);
			
			IncrementFlag("DOLLMAKER_USE_VISOR");
			
			addButton(0, "Next", drBadgerLabDollMaker, "play back");
			break;
		case "use iqbgone":
			showDollmaker();
			
			output("You grab toward the base of the arm that houses one of the most dangerous drugs on the planet... <b>IQ-B-GONE</b>. A syringe filled with ominous green fluid rests at the tip of the limb as you pull it down. You look at the needle... how evil could someone be that they want to reduce the IQ of someone else?");
			if(silly) output(" Clearly a-fucking-lot of people are this evil, seeing how many bimbos you’ve met.");
			output("\n\nWell... you could use it on yourself if you want. It could be incredibly fun to be dumb, but it’s hard to say. You could take a small dose if you wanted to just test it, or just say “fuck it” and inject the whole syringe into yourself. Or avoid all risks and simply don’t take it.");
			output("\n\n");
			
			processTime(1);
			
			// [Small dose] [Big dose] [Back]
			if(pc.hasStatusEffect("IQ B-Gone"))
			{
				addDisabledButton(0, "Small Dose", "Small Dose", "It would be too dangerous to try this again while you are already under the influence of this effect.");
				addDisabledButton(1, "Big Dose", "Big Dose", "It would be too dangerous to try this again while you are already under the influence of this effect.");
			}
			else
			{
				addButton(0, "Small Dose", drBadgerLabDollMaker, "min iqbgone", "Small Dose", "Temporarily trade out some intelligence for a boost in libido.");
				addButton(1, "Big Dose", drBadgerLabDollMaker, "max iqbgone", "Big Dose", "Trade out lots of intelligence for a boost in libido.");
			}
			addButton(14, "Back", drBadgerLabDollMaker, "play");
			break;
		case "min iqbgone":
			showDollmaker();
			
			output("Being knocked down a few pegs couldn’t be all that bad, right? Even then, you’ll just take a small dose so it’ll (hopefully) be temporary.");
			output("\n\nYou examine the needle, applying a little pressure at the base to cause a tiny dollop of the poison-like substance to escape. The drip hits the floor silently. Your hands are a bit shaky as you prepare to inject a small bit of it.");
			output("\n\nYou calm your hands enough to hold the needle tip still and solid. Slowly and carefully, the tip pierces your " + (silly ? "wagina" : "inner elbow") + ", and the automatic dispensing system activates, gradually sending the green liquid into your veins. After about a quarter of the syringe has entered you, you pull your arm back. The pressure-sensitive needle automatically stops dispensing and you prepare yourself for the imminent changes: the drug siphoning your brain power away.");
			output("\n\nJust seconds later, you feel different. IQ points seem to disappear quickly as you are looking down at your body.");
			if(pc.biggestTitSize() >= 5 && pc.biggestCockLength() >= 8) output(" Wow, you’ve got a lot going for you. Tits and a dick, perfectly complementing each other.");
			else if(pc.biggestCockLength() >= 8) output(" Wow, what a great dick, you think to yourself.");
			else if(pc.biggestTitSize() >= 5) output(" Wow, those are some nice tits, you think to yourself.");
			else output(" It’s so mesmerizing to just look at yourself.");
			output("\n\nThinking is getting harder while your carnal desires are becoming much more prominent. It’s like, fucking is totally easier than fighting, and who needs to fight when you’re this hot? Literally all you’d have to do to win a battle is to twerk your ass or suck the enemy’s dick. Even if it’s not a technical win, it’s still a win for you because you get to pleasure someone else... and maybe they’ll even return the favor.");
			output("\n\nYou know the drug you just took is temporary, but stumbling around only thinking about sex is so much more fun!");
			
			processTime(8);
			
			// Gain either low intelligence speak perk based on gender score
			// +40 Libido, -40 intelligence. Each stat decreases and increases respectively by 1 every hour
			// Dumb speaking perks go away once the IQ-B-GONE effect ends
			nMult = 40;
			createDollMakerStatusEffect(pc, "IQ B-Gone", (1 * nMult), (1 * nMult), 0, 0, false, (60 * nMult));
			pc.lust(65);
			if(!pc.hasPerk("Ditz Speech"))
			{
				output("\n\n(<b>Perk Gained: Ditz Speech</b> - You will now sound like a total bimbo in scenes that support it.)");
				pc.createPerk("Ditz Speech", 0, 0, 0, 0, "Alters dialogue in certain scenes.");
			}
			
			IncrementFlag("DOLLMAKER_USE_IQBEGONE");
			
			addButton(0, "Next", drBadgerLabDollMaker, "play back");
			break;
		case "max iqbgone":
			showDollmaker();
			
			output("With the needle so close to you, there’s only one thing you can think about: <i>“I am going to get so fucked up, and I’m going to have a great time doing it.”</i>");
			output("\n\nWhy hold back at this point? You have the opportunity to party right there, in that syringe. You take hold of it and, with a deep breath, plunge it into your arm, closing your eyes while the needle gradually dispenses its payload into you.");
			output("\n\nYour heart begins racing as you open your eyes again, looking back at a now-empty needle. You pull yourself away from it, watching the clear tube of the syringe begin to automatically refill itself with its bubbly, green brew; meanwhile, that same liquid concoction begins to do some work on your system. Your skin feels all tingly and you develop goosebumps, your IQ rapidly draining from you while the drug activates.");
			output("\n\nYour hands seem to move on their own, groping you relentlessly while your [pc.groin] burns with lust. Everything is so pretty, mainly you. Why even bother with being smart? It’s so much easier to let other people handle things while you masturbate. Just leave the hard stuff for people who were trained for it.");
			output("\n\nAfter a few minutes, it seems the content of the needle has fully circulated through your body’s system. You’re dumber, that’s absolutely certain, and you’re feeling like you could fuck a whole brothel dry and then some.");
			output("\n\n");
			
			processTime(15);
			
			// Gain a random perk of the following: Easy, Fuck sense, weak minded, ditz speech, breed hungry
			// -5 to 15 intelligence
			var iqPerkList:Array = [];
			
			if(!pc.hasPerk("Easy")) iqPerkList.push("Easy");
			if(!pc.hasPerk("Inhuman Desire")) iqPerkList.push("Inhuman Desire");
			if(!pc.hasPerk("Breed Hungry")) iqPerkList.push("Breed Hungry");
			if(!pc.hasPerk("Ditz Speech")) iqPerkList.push("Ditz Speech");
			if(!pc.hasPerk("Drug Fucked")) iqPerkList.push("Drug Fucked");
			if(!pc.hasPerk("Fuck Sense")) iqPerkList.push("Fuck Sense");
			if(!pc.hasPerk("Weak Mind")) iqPerkList.push("Weak Mind");
			
			if(iqPerkList.length > 0)
			{
				var iqPerk:String = RandomInCollection(iqPerkList);
				switch(iqPerk)
				{
					case "Easy":
						output("\n\n(<b>Perk Gained: Easy</b> - gain 20% more lust from combat sources.)");
						pc.createPerk("Easy", 20, 0, 0, 0, "Gain 20% more lust from combat sources.");
						break;
					case "Inhuman Desire":
						output("\n\n(<b>Perk Gained: Inhuman Desire</b> - Your maximum lust is increased by 15.)");
						pc.createPerk("Inhuman Desire", 15, 0, 0, 0, "Increases maximum lust by 15.");
						break;
					case "Breed Hungry":
						output("\n\n(<b>Perk Gained: Breed Hungry</b> - Your balls refill much faster than normal and your pregnancies are more likely and faster.)");
						pc.createPerk("Breed Hungry", 15, 0, 0, 0, "Increases speed that semen is created at and the pregnancy speed.");
						break;
					case "Ditz Speech":
						output("\n\n(<b>Perk Gained: Ditz Speech</b> - You will now sound like a total bimbo in scenes that support it.)");
						pc.createPerk("Ditz Speech", 0, 0, 0, 0, "Alters dialogue in certain scenes.");
						break;
					case "Drug Fucked":
						output("\n\n(<b>Perk Gained: Drug Fucked</b> - minimum libido raised to 40, minimum lust rating increased by 10, future libido gains doubled, future intelligence gains halved.)");
						pc.createPerk("Drug Fucked", 0, 0, 0, 0, "Grants: +40 to minimum libido, +10 to minimum lust, halved intelligence gains, and doubled libido gains.");
						break;
					case "Fuck Sense":
						output("\n\n(<b>Perk Gained: Fuck Sense</b> - The Sense ability now relies on your libido rather than intelligence.)");
						pc.createPerk("Fuck Sense", 15, 0, 0, 0, "Allows your sense ability to base success off your libido instead of intelligence.");
						break;
					case "Weak Mind":
						output("\n\n(<b>Perk Gained: Weak Mind</b> - You lose willpower twice as fast.)");
						pc.createPerk("Weak Mind", 0, 0, 0, 0, "Intelligence and willpower losses doubled.");
						break;
				}
			}
			pc.intelligence(-5);
			pc.taint(2);
			
			IncrementFlag("DOLLMAKER_USE_IQBEGONE");
			
			addButton(0, "Next", drBadgerLabDollMaker, "play back");
			break;
		case "use lamp":
			showDollmaker();
			
			output("You take the swirly pink lamp and pull it down some, observing the way it’s set up. It’s like a surgical lamp, and would only light up a small circle wherever it was aimed - though, instead of normal light, this lamp would probably melt whatever’s in your head with radiation (assuming the name is accurate, that is).");
			output("\n\nThough it’s undoubtedly dangerous--not surprising, most of Badger’s devices are. It’s also worth noting that they’ll all induce a pretty good time for the right sort of person. If you’re fine with the risks and rewards, this is definitely for you.");
			output("\n\n");
			
			processTime(1);
			
			// [Small dose] [Big dose]
			if(pc.hasStatusEffect("Brainmelt Lamps"))
			{
				addDisabledButton(0, "Small Dose", "Small Dose", "It would be too dangerous to try this again while you are already under the influence of this effect.");
				addDisabledButton(1, "Big Dose", "Big Dose", "It would be too dangerous to try this again while you are already under the influence of this effect.");
			}
			else
			{
				addButton(0, "Small Dose", drBadgerLabDollMaker, "min lamp", "Small Dose", "Temporarily trade out some willpower for a shot of lust waves.");
				addButton(1, "Big Dose", drBadgerLabDollMaker, "max lamp", "Big Dose", "Trade out lots of willpower for a shot of lust waves.");
			}
			addButton(14, "Back", drBadgerLabDollMaker, "play back");
			break;
		case "min lamp":
			showDollmaker();
			
			output("Why not live a little? It could be quite fun to goof off from time to time, though you admit that using Badger’s stuff for too long could be genuinely dangerous. So that’s why you’ll only take a light dosing of this lamp’s radiation.");
			output("\n\nWith the lamp in hand, you aim it at your head and search the back of it for the ‘on’ switch. Once your finger has found it, you click it down and prepare yourself.");
			output("\n\nYour [pc.eyes] begin rolling back slightly as the pink light is absorbed into your head, your focus disappearing on the spot while the lamp works its magic. Drool begins to drip from your open mouth. So pretty...");
			output("\n\nIn a fit, you shake your head rapidly and let the lamp slip from your hands, dangling harmlessly whilst aiming at the floor. What the hell just happened? And why is that question not even rhetorical? Your palm wipes the sweat from your forehead, practically dripping when you pull it away. Everything is so hot in your head... maybe a nice, cold shower out to fix this.");
			output("\n\n");
			
			processTime(1);
			
			// Get status effect “brainmelt lamps”
			// The usual: -15 willpower, 1 point coming back every hour, and an extra point when the effect ends
			nMult = 15;
			createDollMakerStatusEffect(pc, "Brainmelt Lamps", (1 * nMult), 0, 0, 0, false, (60 * nMult));
			pc.lust(65);
			
			IncrementFlag("DOLLMAKER_USE_LAMP");
			
			addButton(0, "Next", drBadgerLabDollMaker, "play back");
			break;
		case "max lamp":
			showDollmaker();
			
			output("You already know just how serious Badger’s toys can be, from her silicone stuffing robot, to that weird ball with bimbofication powers, to the Doll Maker and its ability to, well, turn people into dolls. But this, this is probably the most messed up thing she has: a lamp that could melt your mind to mush. And you already know damn well you’re going to use it to have a great time.");
			output("\n\nLamp in hand and already aimed at your face, you turn it on, accepting the questionable effects that are absolutely going to happen.");
			output("\n\nStraight from the start, you can feel the radiation burning into your mind, cooking your brain in an oddly pleasant way. Hell, you might as well not even think about the negative effects of this strange machine - not that you remember them, anyway. You’re too busy indulging in the awesome feeling of staring into this pretty, hypno, swirly lamp. Your eyes are crossing slowly while you’re gradually dumbed down, with no intention of stopping, even as drool drips from your [pc.lips] down onto your [pc.chest].");
			if(silly) output("\n\nYour fingers drag lightly across your forehead before going along the side of your head before coming to your [pc.ear]. What is this mush getting on your hand? You look at it, observing the melted pink material. It’s probably nothing.");
			output("\n\nYour conscious is fading, along with your mind and will. Simply bathing your brain in this pink light is wonderful, and you just simply don’t want to stop. It’s just so good! Not to mention that groping yourself only amplifies the pleasure...");
			output("\n\n");
			
			processTime(1);
			
			addButton(0, "Next", drBadgerLabDollMaker, "max lamp next");
			break;
		case "max lamp next":
			showDollmaker();
			
			output("Giggling as you slowly wake up, you see that you’re now on the floor while the lamp hangs down harmlessly. Extreme ardor fills the air - or, actually, maybe it’s just you that’s experiencing it, especially with how long you let the lamp have its way with you. It’s only been a few minutes, but it feels like you sucked up enough radiation, so much so that you’re surprised you didn’t grow an extra arm.");
			output("\n\nYou feel... different, somehow. Less self control, and a much stronger urge to just do whatever the hell you want.");
			output("\n\n");
			
			processTime(1);
			
			// -20 willpower
			// -5 to 10 intelligence
			// +15 libido
			// Give perk “weak willed”
			pc.willpower(-20);
			pc.intelligence(-5);
			pc.libido(15);
			if(!pc.hasPerk("Weak Mind"))
			{
				output("\n\n(<b>Perk Gained: Weak Mind</b> - You lose willpower twice as fast.)");
				pc.createPerk("Weak Mind", 0, 0, 0, 0, "Intelligence and willpower losses doubled.");
			}
			pc.taint(2);
			
			IncrementFlag("DOLLMAKER_USE_LAMP");
			
			addButton(0, "Next", drBadgerLabDollMaker, "play back");
			break;
		default:
			showBust("");
			
			output("ERROR!");
			output("\n\n");
			
			processTime(1);
			
			addButton(0, "Next", mainGameMenu);
			break;
	}
}
public function drBadgerLabDollMakerSprayRouter(arg:Array):void
{
	var target:Creature = (arg.length > 0 ? arg[0] : null);
	var sScene:String = (arg.length > 1 ? arg[1] : "error");
	var sColor:String = (arg.length > 2 ? arg[2] : "black");
	
	if(target == null) return;
	
	// Store skin values
	if(target is PlayerCharacter)
	{
		flags["DOLLMAKER_LATEX_SKIN"] = [
			target.skinType,
			target.skinFlags,
			target.skinTone,
			sColor,
		];
		return drBadgerLabDollMaker(sScene + " go");
	}
}
public function drBadgerLabDollMakerVisorHours():void
{
	eventQueue.push(drBadgerLabDollMakerVisorEnd);
	
	// Player gets access to usual mindwash visor scenes.
	return useShipMindwashMeee();
}
public function drBadgerLabDollMakerVisorEnd():void
{
	clearOutput();
	showDollmaker();
	author("Jacques00");
	
	output("You still feel a bit lightheaded when leaving the seat and reclaiming your gear but you are otherwise intact, more or less. If you were of the right mind, you’d suspect Doctor Badger to have slipped a little something extra in the device to enhance the experience.");
	output("\n\nSuddenly,");
	if(pc.lust() < pc.lustMax()) output(" your lust spikes up and");
	output(" your Codex beeps, and, sure enough, your suspicions are proven correct. You should trust to never make it out of anything untainted by her....");
	output("\n\n");
	
	processTime(2);
	
	// Player gains 8% taint and max lust at the end. That’s it.
	pc.taint(8);
	pc.maxOutLust();
	
	IncrementFlag("DOLLMAKER_USE_VISOR");
	
	clearMenu();
	addButton(0, "Next", drBadgerLabDollMaker, "play back");
}

// Strange ball
// Repeatable scene that can either bimbo the player or partially debimbo the player. Puts player’s tits at F cups, butt at size 12, hip at size 8, and intelligence at 60% while draining some willpower. Therefore, if they’re extremely stupid, they gain a significant amount of intelligence.
public function drBadgerLabStrangeBall(response:String = "menu"):void
{
	clearOutput();
	author("Natetheman223");
	clearMenu();
	
	var i:int = 0;
	var nIQ:Number = pc.IQ();
	var isDummy:Boolean = ((pc.isBimbo() && nIQ == 60) || nIQ < 60);
	
	switch(response)
	{
		case "menu":
		case "back":
			showBrainwashingBall();
			
			output("You walk up to the dark ball, observing it and even touching it once. It’s completely turned off, sitting atop a pedestal with a few wires hanging from the bottom. This must be what Badger used to bimbofy the pexiga - which is weird, because usually bimbofication makes the person dumber.");
			output("\n\n");
			if(isDummy) output("Though... you’re kinda dumb, too... maybe you could use it in a similar fashion?");
			else output("With your current level of intelligence, you’re pretty sure this would just make you dumber.");
			output("\n\n");
			
			processTime(1);
			
			// [Use] [Nevermind]
			addButton(0, "Use", drBadgerLabStrangeBall, "use", "Use Brainwashing Ball", "Attempt to fix the machine.");
			addButton(1, "Never Mind", mainGameMenu);
			break;
		case "use":
			showBrainwashingBall();
			
			output("Seeing as how the pexiga had a ton of fun with this, surely you can as well - without help from Badger. You look at the disabled ball, sitting high and mighty. How did Badger turn it on, you wonder?");
			output("\n\nThe pedestal has a switch on the side. That should be it. You compose yourself as you press it, watching the ball light up the entire lab, swirling with hypno greens, blues, and yellows. It’s actually somewhat enticing now that you’re right here... scratch that, it’s <i>really</i> enticing. Your hands just guide themselves up without your permission, landing on the pretty ball. Swirling colors overtake your sight as you become blinded - literally <i>and</i> metaphorically.");
			output("\n\nYour tongue lolls out while brain power seems to just pour free, your mind becoming much more open and empty while IQ points disappear. Thinking is becoming harder, not that it matters when you feel this good.");
			if(pc.hasCock())
			{
				output(" Your [pc.cocks] develop" + (pc.cocks.length == 1 ? "s" : "") + " rapidly, swelling and hanging lower in no time,");
				if(pc.balls > 0) output(" not to mention your [pc.balls] expanding from the newly added [pc.cum] plumping them up.");
				else output(" having grown at least a couple inches longer.");
			}
			if(pc.biggestTitSize() >= 1 && pc.biggestTitSize() < 11) output(" [pc.Boobs] bloat on your chest, perky, round and proud, as if mental capacity was traded out to fill them. Didn’t Badger say F cups were the max that this could give you? That sucks, because letting your tits blow up like this feels awesome!");
			if(!isDummy)
			{
				output("\n\nYour brain-related abilities dwindle rapidly, but you’re beyond the point of caring; it just feels so good to give up your body and mind to something, free to modify you as it pleases. And it does,");
				if(pc.isFeminine()) output(" your lower half filling out as your cheeks swell and grow perfectly, fuckable by anyone who passes by and has a dick.");
				else output(" your male attributes disappearing in favor of making your butt nice and plump.");
			}
			output("\n\nIt’s just like, so awesome to let this weird ball thing change your body. You’ve completely submitted to an inanimate object that only has the intention of making people dumb and blowing up their bodies, which is totally cool because you love being modified at someone (or something) else’s discret- disc- you love when other people change you, is a good way to put it.");
			if(isDummy)
			{
				output("\n\nSomething... weird is going on. You swear you can feel a machine turning over inside your head, because something’s about to kickstart! Still holding the ball, a switch clicks. What... did... did the ball just make you smarter?! No way... really? This must be what happened to the pexiga when she used this. You’re not exactly a genius now, but you definitely got a bit smarter - at least a little.");
			}
			output("\n\nThe effects slowly come to a stop, and the swirly colors of the ball begin to dim as you break away. You’ve changed a fair bit thanks to this strange orb, but it was fun the entire way through. After taking a few steps away, the ball completely shuts off, and you’re on your merry way - with sexier thoughts, of course.");
			output("\n\n");
			
			processTime(12);
			
			// Intelligence turns 60% no matter what
			// -20% or so willpower
			// Get “ditz speech” if they don’t have it already
			// Butt size changes to 12 and hip to 8, unless the player is bigger, then no change
			// Tits turn to F cups unless player had a flat chest or is bigger, then no change
			// Increase dick length by up to 10 inches if they have one
			// Increase ball size by a LOT if player has them
			
			pc.intelligenceRaw = Math.round(0.60 * pc.intelligenceMax());
			pc.willpower(-20);
			
			if(!pc.hasPerk("Ditz Speech"))
			{
				output("\n\n(<b>Perk Gained: Ditz Speech</b> - You will now sound like a total bimbo in scenes that support it.)");
				pc.createPerk("Ditz Speech", 0, 0, 0, 0, "Alters dialogue in certain scenes.");
			}
			
			if(pc.biggestTitSize() >= 1)
			{
				for(i = 0; i < pc.breastRows.length; i++)
				{
					if(pc.breastRows[i].breastRatingRaw < 11) pc.breastRows[i].breastRatingRaw = 11;
				}
			}
			if(pc.hipRatingRaw < 8) pc.hipRatingRaw = 8;
			if(pc.buttRatingRaw < 12) pc.buttRatingRaw = 12;
			if(pc.hasCock())
			{
				for(i = 0; i < pc.cocks.length; i++)
				{
					if(pc.cocks[i].cLengthRaw < 10)
					{
						pc.cocks[i].cLengthRaw = 10;
						if(pc.hasPerk("Hung")) pc.cocks[i].cLengthRaw += 5;
					}
				}
				if(pc.balls > 0)
				{
					pc.ballSizeRaw += 8;
					if(pc.hasPerk("Bulgy")) pc.ballSizeRaw += 4;
				}
				if(pc.ballFullness < 100) pc.ballFullness = 100;
			}
			
			IncrementFlag("BRAINWASHINGBALL_USES");
			
			addButton(0, "Next", mainGameMenu);
			break;
		default:
			showBust("");
			
			output("ERROR!");
			output("\n\n");
			
			processTime(1);
			
			addButton(0, "Next", mainGameMenu);
			break;
	}
}

/*

As a side note, there are some new blurbs when outputting anything breast, ass, hip, or lip related. These will appear when the player’s boob, lip, ass, or hip size is 60% or more silicone.
noun - balloons (boobs)
noun - bubbles (ass cheeks)
adjective - gravity defying (boobs, ass, lips)
adjective - ridiculously perky (boobs, ass, hips)
adjective - fake (boobs, ass, hips, lips)
adjective - plastic (boobs, ass, hips, lips)
adjective - silicone-filled (boobs, ass, hips, lips)
I.e “your huge balloons” “your fake bubbles” “your plastic lips” etc.

And a cheat, just because. Typing in “beshineforever” will make all Nym-Foe’s injection attacks only inflate the player’s boobs on the next encounter. Beshine is a pornstar with (I believe) the world’s largest augmented breasts.

*/

// Silicone Tank
public function drBadgerSiliconeTank(bBack:Boolean = false):void
{
	if(InShipInterior(pc)) return drBadgerSiliconeMiniTank(bBack);
	
	clearOutput();
	showBust("");
	showName("SILICONE\nTANKS");
	author("Natetheman223");
	
	processTime(1);
	
	// Silicone tank, first time only
	if(flags["BADGER_SILICONE_TANK_USES"] == undefined)
	{
		output("You walk over to the spherical metal tank. On a side is a glass window showing how much is left - it’s practically full, and you couldn’t make a dent in the amount of silicone no matter how much you take out.");
		output("\n\nOn the bottom is a large tube with a needle on the end.");
		if(flags["NYM-FOE"] != undefined) output(" It’s likely what Nym-Foe uses to refill when she gets low.");
		output(" You could probably use it on yourself if you want...");
		output("\n\n");
		
		flags["BADGER_SILICONE_TANK_USES"] = 0;
		
		// [Use] [Don’t use]
		// Choosing not to use it just brings you back to the lab options
		clearMenu();
		addButton(0, "Use It", drBadgerSiliconeTank);
		addButton(1, "Don’t Use", mainGameMenu);
		return;
	}
	
	// Use It
	if(!bBack) output("You take the metal tentacle into your hand, wobbling it around. You squeeze it gently, making a few drops of mostly clear silicone exit the needle. You look at the buttons by where the tube is connected, and there are two options: suck and inject... except ‘inject’ is crossed off, and it says ‘blow’. Definitely something Doctor Badger would do.");
	else output("The silicone tank and its metal tentacle is prepped and ready for use.");
	output("\n\nWhat are you going to do?");
	if(!pc.getStatusEffect("Nym-Foe Injections") || drBadgerSiliconeTankBagFillTaken() < drBadgerSiliconeTankBagFillTotal())
	{
		output(" You could easily pump yourself full of silicone");
		if(drBadgerSiliconeTankBagFillTaken() < drBadgerSiliconeTankBagFillTotal()) output(", or you could harvest some of it using one of the bags laying around");
		output(".");
	}
	
	drBadgerSiliconeTankMenu();
}
// In-ship version
public function drBadgerSiliconeMiniTankBonus(btnSlot:int = 0):void
{
	output("\n\nThe silicone tank you bought off Badger sits against a wall nearby, a tube hanging off it with a needle at the end.");
	
	// Pick one random line to add depending on crewmates:
	var siliconeTankBlurbs:Array = [];
	if(celiseIsCrew()) siliconeTankBlurbs.push("A small splatter of green goo is on the side of the tank.");
	if(annoIsCrew()) siliconeTankBlurbs.push("A Steele Tech sticker is on the side of the tank.");
	if(kaseIsCrew()) siliconeTankBlurbs.push("A sticker of a circuit board is on the side of the tank.");
	if(pexigaIsCrew()) siliconeTankBlurbs.push("Some drool leaks down the side of the tank.");
	if(gooArmorIsCrew()) siliconeTankBlurbs.push("A splatter or gray microbots sticks to the side of the tank.");
	if(azraIsCrew()) siliconeTankBlurbs.push("A singular rose hangs off the side of the tank, held on by a tiny piece of tape.");
	if(pennyIsCrew()) siliconeTankBlurbs.push("A small U.G.C. sticker is on the side.");
	if(siliconeTankBlurbs.length > 0) output(" " + siliconeTankBlurbs[rand(siliconeTankBlurbs.length)]);
	
	addButton(btnSlot, "SiliconeTank", drBadgerSiliconeMiniTank, undefined, "Silicone Tank", "Have a look at the installed silicone tanks.");
}
public function drBadgerSiliconeMiniTank(bBack:Boolean = false):void
{
	clearOutput();
	showBust("");
	showName("SILICONE\nTANKS");
	author("Natetheman223");
	
	processTime(1);
	
	if(!bBack) output("You take the metal tentacle into your hand, wobbling it around. You squeeze it gently, making a few drops of mostly clear silicone exit the needle. You look at the buttons by where the tube is connected, and there are two options: suck and inject.");
	else output("The silicone tank and its metal tentacle is prepped and ready for use.");
	output("\n\nWhat are you going to do?");
	if(!pc.getStatusEffect("Nym-Foe Injections")) output(" You could easily pump yourself full of silicone.");
	
	drBadgerSiliconeTankMenu();
}
// Side note: when changing proportions, the menu stays as it is so the player can quickly grow their body without having to press ‘next’ after every adjustment. Also, your lust increase by 5 every time you swell yourself.
public function drBadgerSiliconeTankMenu():void
{
	var silicone:StorageClass = pc.getStatusEffect("Nym-Foe Injections");
	var inShip:Boolean = InShipInterior(pc);
	var maxHips:Number = siliconeMaxHips(inShip);
	var maxButt:Number = siliconeMaxButt(inShip);
	var maxBoob:Number = siliconeMaxBoob(inShip);
	var maxLips:Number = siliconeMaxLips(inShip);
	var uncapped:Boolean = (!inShip && (pc.isBimbo() || pc.libido() > 100));
	
	output("\n\n<b><u>Bio-Silicone Levels</u></b>");
	output("\n<b>* Breasts:</b> " + (silicone == null ? "<i>No silicone detected.</i>" : (silicone.value3 + " units")));
	output("\n<b>* Butt:</b> " + (silicone == null ? "<i>No silicone detected.</i>" : (silicone.value2 + " units")));
	output("\n<b>* Hips:</b> " + (silicone == null ? "<i>No silicone detected.</i>" : (silicone.value1 + " units")));
	output("\n<b>* Lips:</b> " + (silicone == null ? "<i>No silicone detected.</i>" : (silicone.value4 + " units")));
	output("\n\n");
	
	// [GrowBoobs] [ShrinkBoobs] [GrowAss] [ShrinkAss] [GrowHips] [ShrinkHips] [GrowLips] [ShrinkLips] [Go Crazy] [Total Suck] [Leave]
	// Player can only shrink parts if they have silicone in them
	clearMenu();
	
	if(silicone == null || silicone.value3 < maxBoob || uncapped) addButton(0, "GrowBoobs", drBadgerSiliconeTankUse, "grow tits", "Grow Boobs", "Pump silicone into your [pc.breasts].");
	else addDisabledButton(0, "GrowBoobs", "Grow Boobs", "Your [pc.breasts] are already filled to the max with silicone!");
	if(silicone != null && silicone.value3 > 0) addButton(5, "ShrinkBoobs", drBadgerSiliconeTankUse, "shrink tits", "Shrink Boobs", "Pump silicone out of your [pc.breasts].");
	else addDisabledButton(5, "ShrinkBoobs", "Shrink Boobs", "Your [pc.breasts] do not contain any silicone!");
	
	if(silicone == null || silicone.value2 < maxButt || uncapped) addButton(1, "GrowAss", drBadgerSiliconeTankUse, "grow butt", "Grow Ass", "Pump silicone into your [pc.buttcheeks].");
	else addDisabledButton(1, "GrowAss", "Grow Ass", "Your [pc.buttcheeks] are already filled to the max with silicone!");
	if(silicone != null && silicone.value2 > 0) addButton(6, "ShrinkAss", drBadgerSiliconeTankUse, "shrink butt", "Shrink Ass", "Pump silicone out of your [pc.buttcheeks].");
	else addDisabledButton(6, "ShrinkAss", "Shrink Ass", "Your [pc.buttcheeks] do not contain any silicone!");
	
	if(silicone == null || silicone.value1 < maxHips || uncapped) addButton(2, "GrowHips", drBadgerSiliconeTankUse, "grow hips", "Grow Hips", "Pump silicone into your [pc.hips].");
	else addDisabledButton(2, "GrowHips", "Grow Hips", "Your [pc.hips] are already filled to the max with silicone!");
	if(silicone != null && silicone.value1 > 0) addButton(7, "ShrinkHips", drBadgerSiliconeTankUse, "shrink hips", "Shrink Hips", "Pump silicone out of your [pc.hips].");
	else addDisabledButton(7, "ShrinkHips", "Shrink Hips", "Your [pc.hips] do not contain any silicone!");
	
	if(silicone == null || silicone.value4 < maxLips || uncapped) addButton(3, "GrowLips", drBadgerSiliconeTankUse, "grow lips", "Grow Lips", "Pump silicone into your [pc.lips].");
	else addDisabledButton(3, "GrowLips", "Grow Lips", "Your [pc.lips] are already filled to the max with silicone!");
	if(silicone != null && silicone.value4 > 0) addButton(8, "ShrinkLips", drBadgerSiliconeTankUse, "shrink lips", "Shrink Lips", "Pump silicone out of your [pc.lips].");
	else addDisabledButton(8, "ShrinkLips", "Shrink Lips", "Your [pc.lips] do not contain any silicone!");
	
	if(silicone == null && flags["BADGER_SILICONE_TANK_USES"] <= 0) { /* Use it at least once! */ }
	else if(silicone == null || silicone.value1 < maxHips || silicone.value2 < maxButt || silicone.value3 < maxBoob || silicone.value4 < maxLips)
	{
		var drBadgerCanAppear:Boolean = (!drBadgerImprisioned());
		
		if(!inShip && pc.isBimbo() && drBadgerCanAppear) addButton(4, "Go Crazy", drBadgerSiliconeTankBimboGoCrazy, "intro", "Go Crazy", "Pump as much silicone into your body as you can.\n\n<i>Like, this might be dangerous for someone like you, but what do you care anyway?</i>");
		else addButton(4, (!inShip ? "Go Crazy" : "Full Inject"), drBadgerSiliconeTankUse, "go crazy", (!inShip ? "Go Crazy" : "Full Inject"), "Pump as much silicone into your body as you can.");
	}
	else addDisabledButton(4, (!inShip ? "Go Crazy" : "Full Inject"), (!inShip ? "Go Crazy" : "Full Inject"), "All your body parts are filled to the max with silicone!");
	
	if(silicone != null && (silicone.value1 + silicone.value2 + silicone.value3 + silicone.value4) > 0) addButton(9, "Total Suck", drBadgerSiliconeTankUse, "total suck", "Total Suck", "Pump silicone out of your body.");
	else addDisabledButton(9, "Total Suck", "Total Suck", "You don’t have any silicone to pump out!");
	
	if(!inShip)
	{
		// Player can ‘use bag’ only once to collect two more silicone as items
		if(drBadgerSiliconeTankBagFillTaken() < drBadgerSiliconeTankBagFillTotal()) addButton(13, "Use Bag", drBadgerSiliconeTankUse, "use bag", "Use Bag", "Harvest some of the silicone with one of the fillable bags.");
		else addDisabledButton(13, "Use Bag", "Use Bag", "There are no more available bags to fill.");
	}
	
	addButton(14, "Leave", drBadgerSiliconeTankUse, "leave");
}
public function drBadgerSiliconeTankUse(response:String = ""):void
{
	clearOutput();
	showBust("");
	author("Natetheman223");
	
	var inShip:Boolean = InShipInterior(pc);
	
	switch(response)
	{
		case "grow tits":
			showName("INJECT\nBOOBS");
			
			output("You carefully slide the needle into the area just above your chest, pressing ‘" + (!inShip ? "blow" : "inject") + "’ on the tank. Within seconds, your chest wobbles with new weight, now " + pc.breastCup(0, (pc.bRating(0) + 1)) + "s. <b>Your [pc.boobs 0] have gotten bigger,</b> stuffed with silicone.");
			if(pc.breastRows.length >= 2) output("\n\nYour second row of [pc.boobs 1] expand as well, swollen to " + pc.breastCup(1, (pc.bRating(1) + 1)) + "s.");
			if(pc.breastRows.length >= 3) output("\n\nAnd it doesn’t stop there! Your third row of [pc.boobs 2] continue the growth, now " + pc.breastCup(2, (pc.bRating(2) + 1)) + "s.");
			if(pc.breastRows.length >= 4) output("\n\n" + (pc.breastRows.length == 4 ? "Finally" : "Next") + ", your fourth row of [pc.boobs 3] grow and grow, distended with silicone to " + pc.breastCup(3, (pc.bRating(3) + 1)) + "s.");
			if(pc.breastRows.length >= 5) output("\n\nThe process continues until " + (pc.breastRows.length == 5 ? ("your final row of [pc.boobs 4] is inflated with silicone to become " + pc.breastCup(4, (pc.bRating(4) + 1)) + "s.") : "the last of your breast rows have been inflated with silicone!") + "");
			
			processTime(2);
			
			// Breast size increases by a single cup size, for all rows
			nymFoeInjection(pc, 3, 1);
			flags["BADGER_SILICONE_TANK_USES"]++;
			
			drBadgerSiliconeTankMenu();
			break;
		case "shrink tits":
			showName("SUCK\nBOOBS");
			
			output("You carefully slide the needle into the area above your chest, pressing ‘suck’ on the tank. Silicone mass is taken from you as your chest gets smaller. <b>Your [pc.breasts] have gotten smaller.</b>");
			
			processTime(2);
			
			// Breast size decreases by a cup size, for all rows
			nymFoeInjection(pc, 3, -1);
			flags["BADGER_SILICONE_TANK_USES"]++;
			
			drBadgerSiliconeTankMenu();
			break;
		case "grow butt":
			showName("INJECT\nBUTT");
			
			output("You take the needle, carefully reaching back and sliding it into the skin of your hind end before pressing ‘" + (!inShip ? "blow" : "inject") + "’ on the machine. Each of your butt cheeks wobble with expansion, swelling slowly while they get filled with silicone. <b>Your [pc.butt] has gotten bigger, stuffed with silicone.</b>");
			
			processTime(2);
			
			// Ass size increases by 1
			nymFoeInjection(pc, 2, 1);
			flags["BADGER_SILICONE_TANK_USES"]++;
			
			drBadgerSiliconeTankMenu();
			break;
		case "shrink butt":
			showName("SUCK\nBUTT");
			
			output("You take the needle, reaching back before carefully poking yourself on the [pc.skinFurScales] of your backside. You press ‘suck’ on the machine, and it pulls out the silicone inside you. <b>Your [pc.butt] has gotten smaller.</b>");
			
			processTime(2);
			
			// Ass size decreases by 1
			nymFoeInjection(pc, 2, -1);
			flags["BADGER_SILICONE_TANK_USES"]++;
			
			drBadgerSiliconeTankMenu();
			break;
		case "grow hips":
			showName("INJECT\nHIPS");
			
			output("You take the needle in one hand, carefully poking yourself in the upper part of your [pc.thigh], followed by pressing ‘" + (!inShip ? "blow" : "inject") + "’ on the machine. Slowly but surely, your legs and hips fill out with silicone, effectively making you more wide. <b>Your [pc.hips] have gotten wider,</b> stuffed with silicone.");
			
			processTime(2);
			
			// Hip size increases by 1
			nymFoeInjection(pc, 1, 1);
			flags["BADGER_SILICONE_TANK_USES"]++;
			
			drBadgerSiliconeTankMenu();
			break;
		case "shrink hips":
			showName("SUCK\nHIPS");
			
			output("You take the injector, poking yourself in the hip before pressing ‘suck’ on the tank. Silicone is pulled from your hips and legs, thinning you out some. <b>Your [pc.hips] have shrunk.</b>");
			
			processTime(2);
			
			// Hip size decreases by 1
			nymFoeInjection(pc, 1, -1);
			flags["BADGER_SILICONE_TANK_USES"]++;
			
			drBadgerSiliconeTankMenu();
			break;
		case "grow lips":
			showName("INJECT\nLIPS");
			
			output("You pull the needle up to your [pc.face], and more importantly, your lower lip. You very carefully slide it in, then pressing the ‘" + (!inShip ? "blow" : "inject") + "’ button. Silicone flows into your lips, swelling them up for a night on the town. <b>Your [pc.lips] have gotten larger,</b> stuffed with silicone. You lick them once.");
			
			processTime(1);
			
			// Lip size increases by 1
			nymFoeInjection(pc, 4, 1);
			flags["BADGER_SILICONE_TANK_USES"]++;
			
			drBadgerSiliconeTankMenu();
			break;
		case "shrink lips":
			showName("SUCK\nLIPS");
			
			output("You take the injector carefully, poking your lips and pressing ‘suck’. Silicone is slowly pulled from them, effectively shrinking them. <b>Your [pc.lips] have shrunk.</b>");
			
			processTime(1);
			
			// Lip size decreases by 1
			nymFoeInjection(pc, 4, -1);
			flags["BADGER_SILICONE_TANK_USES"]++;
			
			drBadgerSiliconeTankMenu();
			break;
		case "go crazy":
			showName(!inShip ? "GO\nCRAZY!" : "FULL\nINJECT");
			
			output("You take the needle, shoving it straight into your waist before holding the ‘" + (!inShip ? "blow" : "inject") + "’ button. You sit there, swelling up your body " + (!inShip ? "like crazy" : "as much as possible") + ", rapidly bloating your boobs, widening your hips, filling out your ass, and " + (!inShip ? "turning your lips into true cock suckers" : "plumping up your lips") + ". You hold the button for a full minute, stuffing yourself to the brim.");
			
			processTime(8);
			
			// Cup, hip and butt size increase by 10
			// Lip size increases by 3
			nymFoeMaxInjection(pc, siliconeMaxHips(inShip), siliconeMaxButt(inShip), siliconeMaxBoob(inShip), siliconeMaxLips(inShip));
			
			clearMenu();
			if(!inShip && flags["BADGER_SILICONE_GO_CRAZY"] >= 3 && !pc.hasPerk("Implant-tastic"))
			{
				output("\n\nAside from the sensation of being completely plumped with plastic, something inside you clicks and you have a strange feeling all of a sudden....");
				output("\n\n");
				
				addButton(0, "Next", drBadgerSiliconeTankGoCrazyImplantasticPerk);
			}
			else
			{
				output("\n\n<b>You are now massively bloated with silicone.</b>");
				
				flags["BADGER_SILICONE_TANK_USES"]++;
				if(!inShip) IncrementFlag("BADGER_SILICONE_GO_CRAZY");
				
				addButton(0, "Next", drBadgerSiliconeTank, true);
			}
			break;
		case "total suck":
			showName("TOTAL\nSUCK");
			
			output("You plant the needle into your waist, holding down the ‘suck’ button. Silicone is taken from your body with haste, <b>leaving you with your natural body</b>");
			if(pc.hasPerk("Implant-tastic")) output("... or as much as your body would allow given the permanent implant-producing ability of your body");
			else output(", less like a doll");
			output(". Once it’s all out, you pull the needle off and release the button.");
			
			processTime(4);
			
			// All silicone is removed
			nymFoeUninjection(pc);
			flags["BADGER_SILICONE_TANK_USES"]++;
			
			clearMenu();
			addButton(0, "Next", drBadgerSiliconeTank, true);
			break;
		case "use bag":
			showName("FILL\nBAG");
			
			var nEmptyBags:int = drBadgerSiliconeTankBagFillEmpty();
			
			output("You look around for something to put silicone into.");
			if(silly) output(" Because, for some fucking reason, there’s literally no other place in the universe to remove silicone from your body, so you can’t just body pack it.");
			output(" Eventually, you come across some bags that are clearly meant to be implants, but empty. Unfortunately, most of them are punctured. However, you do still find");
			if(nEmptyBags == 1) output(" one that isn’t, and take the silicone hose and poke it into the adjuster of the bag. You press the ‘" + (!inShip ? "blow" : "inject") + "’ button and carefully fill it up until it can be filled no more, then putting the full bag in your inventory.");
			else output(" " + num2Text(nEmptyBags) + " of them that aren’t, and you take the silicone hose and poke it into the adjuster of one of the bags. You press the ‘" + (!inShip ? "blow" : "inject") + "’ button and carefully fill it up until it can be filled no more before you do the same to the other" + (nEmptyBags == 2 ? " one" : "s") + ", then putting them " + (nEmptyBags == 2 ? "both" : "all") + " in your inventory.");
			processTime(2);
			
			output("\n\n");
			
			// Player gets silicone x2
			if(flags["BADGER_SILICONE_TANK_FILL_BAG"] == undefined) flags["BADGER_SILICONE_TANK_FILL_BAG"] = 0;
			flags["BADGER_SILICONE_TANK_FILL_BAG"] += nEmptyBags;
			
			var silicone:ItemSlotClass = new Silicone();
			silicone.quantity = nEmptyBags;
			itemScreen = drBadgerSiliconeTankMenu;
			lootScreen = drBadgerSiliconeTankMenu;
			useItemFunction = drBadgerSiliconeTankMenu;
			itemCollect([silicone]);
			break;
		case "leave":
			showName("\nLEAVE...");
			
			output("You set the tube on the floor exactly as you found it, walking away.");
			output("\n\n");
			// Player is put back in lab menu
			clearMenu();
			addButton(0, "Next", mainGameMenu);
			break;
		default:
			showName("");
			
			output("ERROR!");
			output("\n\n");
			
			clearMenu();
			addButton(0, "Next", mainGameMenu);
			break;
	}
}
public function drBadgerSiliconeTankBagFillTotal():int { return 2; }
public function drBadgerSiliconeTankBagFillEmpty():int { return (drBadgerSiliconeTankBagFillTotal() - drBadgerSiliconeTankBagFillTaken()); }
public function drBadgerSiliconeTankBagFillTaken():int { return (flags["BADGER_SILICONE_TANK_FILL_BAG"] != undefined ? flags["BADGER_SILICONE_TANK_FILL_BAG"] : 0); }

// Go Crazy (Bimbo)
// Choosing to “go crazy” as a bimbo
public function drBadgerSiliconeTankBimboGoCrazy(response:String = "intro"):void
{
	clearOutput();
	clearMenu();
	
	switch(response)
	{
		case "intro":
			showBust("");
			showName("LIKE, GO\nCRAZY!");
			author("Kirorororo");
			
			output("You take the needle, happily shoving it into your waist before slamming the ‘blow’ button. Being stuffed with bio-silicone feels right, how it travels under your skin, tickling you and leaving a feeling of bliss behind, but even you know that you should stop eventually... maybe another minute or two. You press the blow button again to stop the incoming flow, but it just starts blowing silicone into you faster, you must’ve broken the button! Ooh! The sensation amplifies itself, buzzing under your skin, making you even more sensitive as every drop of the biomaterial starts changing your nervous connections.");
			output("\n\nYour body inflates and bloats rapidly as the huge silicone tank spills itself into you. Your chest swells wildly until you topple forward, your ass and hips");
			if(!pc.isNude()) output(" stretching your [pc.gear]");
			else output(" expanding with no resistance");
			output(", your lips surging by waves, rapidly taking up half your face and quickly even more... you could, like, suck the biggest dick in the universe with fuckpillows like these.");
			if(!pc.isNude()) output(" Your outfit suddenly rips into shreds, leaving your expanding body vulnerable to the cold air of the lab, your [pc.nippleCocks] expanding to ridiculous sizes. It doesn’t really matter, because you didn’t like wearing anything anyway.");
			
			nymFoeMaxInjection(pc, siliconeMaxHips(), siliconeMaxButt(), siliconeMaxBoob(), siliconeMaxLips());
			
			processTime(14);
			
			if(flags["BADGER_SILICONE_GO_CRAZY"] >= 3 && !pc.hasPerk("Implant-tastic"))
			{
				output("\n\nAside from the sensation of being completely plumped with plastic, something inside you clicks and you have a strange feeling all of a sudden....");
				output("\n\n");
				
				addButton(0, "Next", drBadgerSiliconeTankGoCrazyImplantasticPerk);
			}
			else
			{
				output("\n\nYou feel a strange sensation in your brain, like it’s getting harder to think, your vision blurs and you close your eyes, the device still enlarging you as your last conscious thoughts fade....");
				output("\n\n");
				
				flags["BADGER_SILICONE_TANK_USES"]++;
				
				addButton(0, "Next", drBadgerSiliconeTankBimboGoCrazy, ((pc.WQ() >= 75 || rand(5) == 0) ? "choose" : "next"));
			}
			break;
		case "choose":
			showBust("");
			showName("\nGIVE IN?");
			author("Jacques00");
			
			output("Faintly, a voice in the back of your head calls to you to wake up. Despite being... so... distant... it would seem that your willpower... is still intact.... You are able to make a choice....");
			output("\n\nDo you try to... obey the call or... ignore it completely...?");
			output("\n\n");
			
			processTime(2);
			
			addButton(0, "Pass Out", drBadgerSiliconeTankBimboGoCrazy, "accept");
			addButton(1, "Wake Up!", drBadgerSiliconeTankBimboGoCrazy, "reject");
			addButton(2, "Dolphins?", drBadgerSiliconeTankBimboGoCrazy, "dream");
			break;
		case "reject":
			showBust("");
			showName("\nWAKE UP!");
			author("Jacques00");
			
			output("Your mind ticks and you try to focus on the voice.");
			output("\n\n<i>LIKE, WAKE UP!</i>");
			output("\n\nYour eyes open wide. The dim lamps of the lab’s ceiling hit your pupils and they gradually dialate and readjust to the scenery around you. Your ears pick up a thrumming pumping noise in the background. You feel a source of building pressure against your chest, then another surrounding your lower half and yet another in your rear-end. As the world comes into focus, your current situation dawns on you. Oh no.");
			output("\n\nReaching out, you quickly slap the ‘suck’ button and the ‘blow’ button suddenly depresses itself from its active position, stopping the machine ubruptly. <i>Whew!</i>");
			output("\n\nYou attempt to get back on your [pc.feet] again. It takes a couple tries but you are finally standing upright, your new curves jiggling with semi-solid bio-silicone. The feeling of it sends tingles across your [pc.skin].");
			output("\n\nBefore you have the chance to inspect yourself thoroughly, you hear a shuffle somewhere nearby. You should get out of here before someone catches you!");
			output("\n\n");
			
			processTime(16);
			pc.lust(50);
			
			addButton(0, "Next", drBadgerSiliconeTankBimboGoCrazy, "leave");
			break;
		case "dream":
			showBust("");
			showName("\nDREAM...?");
			author("Jacques00");
			
			output("That’s right. Did you just hear dolphins?");
			output("\n\nThe darkness is then surrounded by a pink cloud. You feel a bit... floaty? Are you under water? Suddenly, your vision clears and you see that you are suspended in some kind of ocean environment, illuminated by a strange purple and pink light. Ahead of you, dark shapes have quickly formed and are fast approaching towards you.");
			output("\n\n<i>“Oh, what are those?”</i> As the shapes get closer to you and pass into the light, you find that they are actually blue-colored marine animals - bottlenose dolphins to be specific. Yay, you knew those were dolphins were calling you! They playfully swim around you as you observe their behavior gleefully. One stops to wave its fin at you.");
			output("\n\nYou wrinkle your nose and wave back. <i>“So cute!”</i>");
			output("\n\nThe greeting dolphin then swims in and bumps its nose against your tummy, causing you to giggle to yourself. <i>“That tickles, silly!”</i> The creature then rubs its sleek body against your [pc.skinFurScales], causing you to squirm at the touch. You feel the voice in the back of your head return, and as it does, the dolphin hovers back a little and meets you face-to-face, its beady eyes curiously staring into your own.");
			output("\n\nIt opens its mouth, and then...");
			output("\n\n<i>Squeee!</i>");
			output("\n\nHow do you respond?");
			output("\n\n");
			
			processTime(11);
			
			addButton(0, "Pass Out", drBadgerSiliconeTankBimboGoCrazy, "accept");
			addButton(1, "Wake Up!", drBadgerSiliconeTankBimboGoCrazy, "wake");
			break;
		case "wake":
			showBust("");
			showName("\nWAKE UP!");
			author("Jacques00");
			
			nymFoeMaxInjection(pc, 30, 30, 100, 10);
			
			output("Your mind ticks and you try to focus on the voice.");
			output("\n\n<i>LIKE, WAKE UP!</i>");
			output("\n\nYour eyes open wide. The dim lamps of the lab’s ceiling hit your pupils and they gradually dialate and readjust to the scenery around you. Your ears pick up a thrumming pumping noise in the background. As the world comes into focus, you notice something is blocking your view. A round shape occupies the lower half of your vision.");
			output("\n\nYou try to let out a tired moan and notice the obstruction plump as you purse your... is that your upper lip?! Your eyes widen a second time as cognition of your recent activities fill back into your memory. You feel a source of building pressure against your chest, then another surrounding your lower half and yet another in your rear-end. Oh no.");
			output("\n\nThe pumps continue.");
			output("\n\nYou flail in place, pinned to the ground by your now enormous tits. You extend your fingers toward the control panel but cannot reach with all the inflated mass holding your back. You try again but to no avail. Slumping back, you sink into your building cleavage until your [pc.feet] hit" + (pc.legCount == 1 ? "s" : "") + " the cold ground. That’s it! You use the ground as a launch pad and attempt to thrust yourself up from the floor underneath you. The momentum sends you toppling foward against the silicon-filled globes on your chest and brings you closer to the buttons.");
			output("\n\nWith an open palm, you attempt to slap the ‘suck’ button but the machine doesn’t respond. <i>Come on!</i> Panicking, you frantically tap both of the buttons on the panel and seemingly at random, the ‘blow’ button suddenly depresses itself from its active position and the machine stops ubruptly. <i>Finally!</i>");
			output("\n\nWith that out of the way, you attempt to get back on your [pc.feet] again. It takes a couple tries but you are finally standing upright, your newly-shaped body bloated and jiggling with semi-solid bio-silicone. The feeling of it sends tingles across your [pc.skin]. This is heaven.");
			output("\n\nBefore you have the chance to inspect yourself thoroughly, you hear a shuffle somewhere nearby. You should get out of here before someone catches you!");
			output("\n\n");
			
			processTime(35);
			pc.lust(100);
			
			addButton(0, "Next", drBadgerSiliconeTankBimboGoCrazy, "sneak");
			break;
		case "leave":
		case "sneak":
			showBust("");
			author("Jacques00");
			
			currentLocation = "304";
			generateMap();
			
			if(response == "leave") {
				showName("GOTTA\nGO!");
				
				output("You manage to make your way up to Dr. Badger’s Bimbotorium proper, though slightly struggling with your new proportions. You spot Doctor Badger, her back turned, working on something at her desk. You figure this might be the best time to make your exit before she sees you and starts asking questions... or worse.");
				output("\n\nSensing your presence, the doctor’s ears perk up and she begins to turn around. <i>“You know, I’m startig t--”</i>");
				output("\n\nIgnoring her completely, you shuffle out the door with your limbs intact and your body stuffed with bio-silicone.");
			}
			else {
				showName("A CLOSE\nCALL!");
				
				output("Almost tipping forward multiple times, you manage to find your footing, adapt to your new proportions, and make your way up to Dr. Badger’s Bimbotorium proper. Taking a quick look-see, you don’t spot Badger anywhere. She must be off tending to other illegal activities, you assume... or secretly watching your naughty little crime; but in any case, the coast is clear so you should hop out before she returns and catches you!");
				output("\n\nWith that, you shuffle out the door with your limbs intact and your body stuffed full of bio-silicone.");
			}
			output("\n\n");
			
			processTime(1);
			IncrementFlag("BADGER_SILICONE_GO_CRAZY");
			
			currentLocation = "209";
			
			addButton(0, "Next", mainGameMenu);
			break;
		case "accept":
			showBust("");
			showName("\nGIVE IN...");
			author("Jacques00");
			
			output("The voice gets farther and farther away....");
			output("\n\nYou feel calm. At ease....");
			output("\n\nYour thoughts finally silent....");
			output("\n\n");
			
			processTime(2);
			
			addButton(0, "Next", drBadgerSiliconeTankBimboGoCrazy, "next");
			break;
		case "next":
			showBust(drBadgerBustDisplay());
			showName("\nAFTERMATH...");
			author("Kirorororo");
			
			// Boob size increases to hyper ZZZ cups, lip size increases to 40, butt and hip size increase to 70
			nymFoeMaxInjection(pc, 60, 60, 190, 20);
			
			output("You wake up to Doctor Badger grabbing your flesh and testing its bounciness, the arousal seems to have woken you up.");
			if(!chars["DRBADGER"].isBimbo())
			{
				output("\n\nShe sees she has your attention, <i>“Well, well, honey. You used up a lot of silicone, I had to tear your hand away from the button before it got impossible to reach.”</i> You’re not sure if she’s annoyed or proud of you, judging by her tone. <i>“Why would anyone press the blow button again instead of just letting it go? You did this on purpose, didn’t you?”</i> she asks.");
				output("\n\nYou didn’t mean to do it, but you didn’t regret any second of it either, you would do it again in a heartb- in a sec- like, you would do it again. You nod.");
				output("\n\nBadger sighs, tsk-ing a few times. <i>“Well, I’ve got to cover the price of all that silicone now, don’t I?”</i>");
			}
			else
			{
				output("\n\nShe sees she has your attention, <i>“Well, babe, you used up like, a ton of silicone, I had to pull your hand away from the button before you popped!”</i> She’s so proud of you, judging by her pleased tone. <i>“I thought about joining you! We could’ve like, been balloons together! But I have work ‘n’ stuff to do, so I can’t be mega huge all the time...”</i>");
				output("\n\nYou didn’t mean to do it, but you didn’t regret any second of it either, you would do it again in a heartb- in a sec- like, you would do it again.");
				output("\n\nBadger sighs once, <i>“You look, like, super sexy, but I need more money to replace the silicone.”</i>");
			}
			output(" You feel guilty, looking down, slightly ashamed. <i>“I have a great idea, darling, why don’t I help you get to the front and you can try out those new lips, I’m sure with the tips you’ll pay me back in no time right?”</i> You nod vigorously, your lips wobbling a little before settling into a smile. Maybe you could start to repay Badger right now?");
			output("\n\n");
			
			processTime(93);
			IncrementFlag("BADGER_SILICONE_GO_CRAZY");
			
			addButton(0, "Next", drBadgerSiliconeTankBimboGoCrazy, "end");
			break;
		case "end":
			showBust(drBadgerBustDisplay());
			showName("\nAFTERMATH...");
			author("Kirorororo");
			
			output("She helps you onto a cart, carrying you to the entrance. She sets you near the door on a plush pink mattress. You love pink! She’s really thought of everything!");
			output("\n\n");
			
			processTime(15);
			currentLocation = "209";
			generateMap();
			
			addButton(0, "Next", drBadgerSiliconeTankBimboGoCrazy, "bad end");
			break;
		case "bad end":
			// Display the busts of a raskvel Trap and the one of Tank Kannon the ultraporn star
			showBust("RASK_TRAP_NUDE", "TANK_KANNON");
			showName("SILICONE\nFUCKDOLL");
			author("Kirorororo");
			
			var ppRaskvel:PregnancyPlaceholder = new PregnancyPlaceholder();
			if(!ppRaskvel.hasCock()) ppRaskvel.createCock();
			ppRaskvel.shiftCock(0, GLOBAL.TYPE_RASKVEL);
			ppRaskvel.createPerk("Fixed CumQ", 5000, 0, 0, 0);
			
			var ppTankKannon:PregnancyPlaceholder = new PregnancyPlaceholder();
			if(!ppTankKannon.hasCock()) ppRaskvel.createCock();
			ppTankKannon.shiftCock(0, GLOBAL.TYPE_EQUINE);
			ppTankKannon.cocks[0].cLengthRaw = 144;
			ppTankKannon.createPerk("Fixed CumQ", 25000, 0, 0, 0);
			
			var vIdx:int = (pc.hasVagina() ? rand(pc.vaginas.length) : -1);
			
			output("It’s only been a minute and you can already see a crowd gathering around. Raskvels cheering gleefully and gabilani observing you discreetly as they pass through. Eventually, a short raskvel trap walks up to you. You can see a few others excitedly encourage him, jeering and whispering, <i>“Put it in!”</i>");
			output("\n\nHe groans. <i>“F-fine,”</i> he says taking a step closer. Now into your reach, you can appreciate how much of a cutie he is! And his balls are so big! With a little effort, you manage to reach his hips with your arms stretched out in between your buxom bosom. You skillfully remove his loincloth, the raskvel’s dick growing out of his boy pussy sheath. The tip oozes precious semen.");
			output("\n\nYou extend puckered your lips and... <i>what is this...?!</i> The moment your [pc.lips] touch his member, your entire body is electrified.");
			if(vIdx >= 0 || pc.isLactating())
			{
				output(" Y");
				if(vIdx >= 0) output("ou splash a deluge of [pc.girlCumNoun] all over the wall and the floor behind you");
				if(vIdx >= 0 && pc.isLactating()) output(", y");
				if(pc.isLactating()) output("our [pc.breasts] shoot [pc.milkNoun] over the crowd like hoses");
			}
			output(". You can hear some cries of surprise followed by heartily laughs and some more cheers. The small raskvel femboy starts pushing his hips forward, sending shocks through you again, this time provoking you to begin sucking uncontrollably, like if your life depended on it--like life isn’t worth living if you don’t have a dick in between your lips at all times...");
			output("\n\nThere seems to be some kind of commotion as the crowd splits in half. While your thoughts are fuzzy and your vision hazy, you can see something large coming towards you. Its shape is strange, barrel-like - like a cannon, you think. And then you see him, the vulpine-morph behind it, behind the monstrous throbbing cock... Tank Kannon, the ultraporn star - or at least parts of him that are distinctly visible to you.");
			output("\n\nAfter a little crowd working, and with the help of the spectators, he makes your back accessible and slips behind you, getting into position. You feel the first pressure of his mastodong between your [pc.buttcheeks], and you start sucking faster and faster on the rask-cock trapped in your mouth. Your drenched rear");
			if(vIdx >= 0) output(" continues bursting with splashes of [pc.girlcum]");
			else output(" is struck by a needy thirst");
			output(" and suddenly orgasms to the biggest surge of electric shock yet. With every inch of your insides cumming, your eyes roll back while tears of pleasure run down your cheeks.");
			
			if(vIdx >= 0) pc.cuntChange(vIdx, ppTankKannon.cockVolume(0));
			else pc.buttChange(ppTankKannon.cockVolume(0));
			
			output("\n\nThe penetration fills you entirely. The cock in your mouth ejaculates its hot sauce, filling your stomach to the brim. You continue suckling the rask boy’s shaft for what feels like hours, even after it’s gotten purple from your ruthless milking. Eventually, the pounding inside you makes your vision blur again and you know that this is, from now on, a way better reason to live and the only occupation that will satisfy you.");
			if(silly) output("\n\nDoctor Badger got her money back that day, and some more thousand credits every day after that.");
			
			processTime(74);
			pc.credits = 0;
			pc.loadInMouth(ppRaskvel);
			if(vIdx >= 0) pc.loadInCunt(ppTankKannon, vIdx);
			else pc.loadInAss(ppTankKannon);
			for(var i:int = 0; i < 8; i++) { pc.orgasm(); }
			
			badEnd("GAME OVER");
			output("\n\n");
			break;
	}
}

// Implant-tastic perk
// If the player chooses to ‘go crazy’ three times, this special scene happens once.
public function drBadgerSiliconeTankGoCrazyImplantasticPerk():void
{
	clearOutput();
	showBust("");
	showName("IMPLANT-\nTASTIC!");
	author("Natetheman223");
	
	output("Having slapped the ‘blow’ button for the " + num2Ordinal(flags["BADGER_SILICONE_GO_CRAZY"]) + " time, happily stuffing yourself with the bio silicone, seems to have resulted in serious consequences when exposed to your sophisticated microsurgeons. Pulling the fluid mass in and out of your body repeatedly has made you adapt to it... use it just like your real body, except with much perkier results. You don’t get the same artificial feeling in your body like you did the first time--It just feels <i>natural</i> to have all this in your system.");
	output("\n\nThe bio silicone inside your body seems to like you as well, making changes to you beyond just expanding you. A peculiar sensation hits your body, a silent shift within that gives you goosebumps all over, namely in your lips, hips, ass, and tits. They feel like they’re solidifying, but suddenly go back to wobbly. You touch yourself quickly, feeling... any natural material like body fat and the like have been converted to silicone, and <b>it’s likely any growth from now on will be converted to silicone over time</b>.");
	
	processTime(8);
	
	// Any expansion applied to mentioned areas will be immediately converted to silicone.
	// And yes, this means that the player has to come back here to reduce asset size.
	// Edit: Changed to daily instead of immediately to not go crazy with the size checks.
	output("\n\n(<b>Perk Gained: Implant-tastic</b> - Your boobs, butt, hips, and lips will always be filled with silicone." + (pc.canLactate() ? " And thanks to the properties of bio-silicone, you can still lactate!" : "") + ")");
	pc.createPerk("Implant-tastic", 0, 0, 0, 0, "Your body will convert most of the mass in your breasts, butt cheeks, hips and lips into silicone.");
	
	nymFoeMaxInjection(pc, siliconeMaxHips(), siliconeMaxButt(), siliconeMaxBoob(), siliconeMaxLips());
	implantasticSiliconeConversion(pc);
	flags["BADGER_SILICONE_TANK_USES"]++;
	
	IncrementFlag("BADGER_SILICONE_GO_CRAZY");
	
	clearMenu();
	addButton(0, "Next", drBadgerSiliconeTank, true);
}
public function implantasticSiliconeConversion(target:Creature):String
{
	var msg:String = "";
	
	// v1: hips
	// v2: butt
	// v3: tits
	// v4: lips
	target.createStatusEffect("Nym-Foe Injections");
	
	var implants:StorageClass = target.getStatusEffect("Nym-Foe Injections");
	if(implants != null)
	{
		var oldLips:Number = target.lipMod;
		var lipsSilicone:Number = (target.lipMod - target.lipModMin());
		if((lipsSilicone + target.lipModMin()) > oldLips) {
			if(target is PlayerCharacter)
			{
				if(msg != "") msg += "\n\n";
				msg += "You feel a tingle in your [pc.lips] as they purse with a plastic stiffness.";
			}
			
			implants.value4 = lipsSilicone;
			target.lipMod = (implants.value4 + target.lipModMin());
			
			if(target is PlayerCharacter) msg += " <b>The extra plump of your lips has been converted into silicone!</b>";
		}
		
		var boobRating:Number = 0;
		var boobSilicone:Number = 0;
		var i:int = 0;
		for(i = 0; i < target.breastRows.length; i++)
		{
			boobRating += (target.breastRows[i].breastRatingRaw - target.breastRatingRawMin(i));
			boobSilicone += (target.breastRows[i].breastRatingMod - target.breastRatingModMin(i));
		}
		var titsGrowth:Number = (boobRating / target.breastRows.length);
		if(titsGrowth > 0) {
			if(target is PlayerCharacter)
			{
				if(msg != "") msg += "\n\n";
				msg += "Your [pc.breasts] give less sag when small pulses thrum within them, soon followed by a slight stretching sensation.";
			}
			
			implants.value3 = ((boobSilicone / target.breastRows.length) + titsGrowth);
			for(i = 0; i < target.breastRows.length; i++)
			{
				target.breastRows[i].breastRatingRaw = target.breastRatingRawMin(i);
				target.breastRows[i].breastRatingMod = (implants.value3 + target.breastRatingModMin(i));
			}
			
			if(target is PlayerCharacter) msg += " <b>The growing mass of your tits has been converted into silicone!</b>";
		}
		
		var hipsGrowth:Number = (target.hipRatingRaw - target.hipRatingRawMin());
		if(hipsGrowth > 0) {
			if(target is PlayerCharacter)
			{
				if(msg != "") msg += "\n\n";
				msg += "Following a sturdy strut, the sides of your [pc.hips] do not change in appearance, but it certainly <i>feels</i> like they are wider.";
			}
			
			implants.value1 = ((target.hipRatingMod - target.hipRatingModMin()) + hipsGrowth);
			target.hipRatingRaw = target.hipRatingRawMin();
			target.hipRatingMod = (implants.value1 - target.hipRatingModMin());
			
			if(target is PlayerCharacter) msg += " <b>Your growth in hip size has converted into silicone!</b>";
		}
		
		var buttGrowth:Number = (target.buttRatingRaw - target.buttRatingRawMin());
		if(buttGrowth > 0) {
			if(target is PlayerCharacter)
			{
				if(msg != "") msg += "\n\n";
				msg += "There is more bounce from your bottom as your [pc.butts] tighten to the point where you feel like you are smuggling basketballs back there.";
			}
			
			implants.value2 = ((target.buttRatingMod - target.buttRatingModMin()) + buttGrowth);
			target.buttRatingRaw = target.buttRatingRawMin();
			target.buttRatingMod = (implants.value2 + target.buttRatingModMin());
			
			if(target is PlayerCharacter) msg += " <b>Your extra butt mass has converted into silicone!</b>";
		}
	}
	
	return msg;
}

// Buy a silicone tank
// The following button requires that the player has viewed the silicone tank. It’s available when in Badger’s lab, as long as badger is not a bimbo.
public function drBadgerSiliconeTankBuy(arg:Array):void
{
	clearOutput();
	author("Natetheman223");
	clearMenu();
	
	var response:String = (arg.length > 0 ? arg[0] : "intro");
	var cost:int = (arg.length > 1 ? arg[1] : 0);
	
	switch(response)
	{
		case "intro":
			showDrBadger();
			
			cost = 1000000;
			if(flags["NYM-FOE_FIXED"] != undefined) cost -= 250000;
			if(flags["DOLLMAKER_FIXED"] != undefined) cost -= 250000;
			
			output("Owning a personal silicone tank would be nice. You’d be able to inflate or deflate yourself at any time. Not to mention that it could be useful if an enemy manages to somehow pump some bio-silicone into you");
			if(silly) output("--even though they probably wouldn’t, because artificial enhancements are a fairly niche kink, but you never know...");
			output(".");
			output("\n\n<i>“Hey Badger, have you ever considered selling one of your silicone tanks?”</i> you ask.");
			output("\n\nThe mad doctor turns away from her junk pile");
			if(silly) output(" (seriously, what the hell is she actually working on?)");
			output(", and looks to you. <i>“My silicone pumps? While I’m very proud of them, I do admit... you’re probably the only person who ever actually uses them... willingly, that is. Not everyone is fine with big, fake titties... even then, you’re one of " + (pcBimboedByBadger() ? "my only subjects" : "the only people") + " who goes into my lab... again, </i>willingly<i>.”</i> Badger smirks to herself and pauses for a minute, then pulls up her goggles. She keeps her green eyes focused on your body, looking you over before trailing back up to your face.");
			output("\n\n<i>“I do have smaller versions in storage however. I’ll give you one for say... ");
			if(cost == 1000000) output("<b>");
			output("a million credits");
			if(cost == 1000000) output("</b>");
			output(". Chances are, a big one wouldn’t even fit on your ship, unless you’ve got space made for cargo...”</i> The black furred badger decides.");
			output("\n\n<i>“A million credits?!”</i> you shout. That’s a lot of money...");
			output("\n\n");
			if(cost == 750000) output("<i>“Well, you fixed one of my favorite toys. Tell you what, I’ll knock it down to <b>seven hundred, fifty thousand credits</b>.”</i> Badger decides. ");
			else if(cost == 500000) output("<i>“Well, you fixed both my favorite toys in the lab, so... I’d be willing to knock it down to a <b>half-million credits</b>.”</i> Badger decides. ");
			output("<i>“That’s my final offer. Just think about it... huge tits at any time, and you can have a hell of a party with your friends.”</i>");
			output("\n\nWell?");
			output("\n\n");
			
			processTime(3);
			
			if(flags["BADGER_SILICONE_TANK_INSTALLED"] == undefined) flags["BADGER_SILICONE_TANK_INSTALLED"] = 0;
			
			// [Yay] [Nay] [Other pay?]
			// 1,000,000 creds if all her stuff is broken
			// 750,000 creds if one thing is broken
			// 500,000 creds if nothing is broken
			if(pc.credits < cost) addDisabledButton(0, "Yay", "Accept", ("You cannot afford this! Badger is asking for " + cost + " credits."));
			else addButton(0, "Yay", drBadgerSiliconeTankBuy, ["yay", cost], "Accept", ("Pay Doctor Badger the " + cost + " credits."));
			addButton(1, "Nay", drBadgerSiliconeTankBuy, ["nay"], "Refuse", "Maybe some other time....");
			addButton(2, "Other Pay?", drBadgerSiliconeTankBuy, ["other"], "Alternate Payment?", (!silly ? "Does Badger have a different way for you to pay?" : "Does Badger take Visa or Paypal?"));
			break;
		case "nay":
			showDrBadger();
			
			output("<i>“Actually...”</i> you start, <i>“I think that the price is a bit too steep for me.”</i>");
			output("\n\n<i>“Fair enough. If you happen to want it later, the offer still stands.”</i>");
			output("\n\n");
			
			processTime(1);
			
			// [Next]
			// Normal lab screen.
			addButton(0, "Next", mainGameMenu);
			break;
		case "yay":
			showDrBadger();
			
			output("You prepare a credit chit for the desired amount before handing it to Badger. She smiles and pockets it. The jumpsuited herm begins walking off to the lab, gesturing for you to follow. You catch up easily.");
			output("\n\n<i>“So, I guess this tank isn’t portable enough to carry?”</i> You ask, walking with the doctor.");
			output("\n\n<i>“No. It’s pretty heavy so I’ll send one of my drones to transport it to your ship. Besides, I don’t want you or any of your little employees rummaging through my stuff. Got it?”</i> You nod as you both reach the lab.");
			output("\n\n");
			
			pc.credits -= cost;
			
			processTime(2);
			
			addButton(0, "Next", drBadgerSiliconeTankBuy, ["yay next"]);
			break;
		case "yay next":
			currentLocation = "BIMBOTORIUM LAB";
			generateMap();
			
			showDrBadger();
			
			output("The lab’s silicone tanks in front of you get measurement estimates forming in your head. Each one is about eight feet tall, maybe three feet wide...");
			if(!pc.isBimbo()) output(" just one probably houses over five hundred gallons of silicone. That’s, what, maybe four thousand pounds, then?");
			else output(" just one probably has enough silicone to give you some enormous boobs!");
			output(" That’s a lot of silicone.... The whole tank is stainless steel, with a large glass line going down the side of it, allowing you to see the gelatin-like material inside. How the hell would any of these fit in your ship?");
			output("\n\nFrom the back of the room, Badger seems to be preparing a different tank, about a quarter of the size of the ones you’re looking at. It’s maybe a bit larger than a nightstand, with a similar build compared to the other tanks. Basically a mini version of the ones you are familiar with, but still housing plenty of bio-silicone. You watch as the doctor pulls out and attaches a cargo bot, which lifts the tank up with relative ease, and hovers itself, payload and all, near you using anti-grav thrusters, tractor beams and sensors. A small ‘ding’ comes from your Codex, informing you that the drone is now tethered to your device, ready for you to guide. You then activate your Codex and manipulate the cargo bot to follow.");
			output("\n\n<i>“The droid will automatically return after the drop-off. Can I trust it will be in good hands by then?”</i> Badger asks, crossing her arms as she watches you. You nod while you practice moving the silicone tank around with the bot, finding it rather easy. <i>“Good. I’ve got some stuff to work on in the meantime.”</i> She smiles. <i>“Oh, and don’t crash it into anything--especially cops. If you do, it’s programmed to self destruct. The last thing I want is the law tracking it back to me.”</i>");
			output("\n\nWith that send-off, you set out.");
			output("\n\n");
			
			processTime(7);
			
			addButton(0, "Next", drBadgerSiliconeTankBuy, ["yay install"]);
			break;
		case "yay install":
			currentLocation = "SHIP INTERIOR";
			generateMap();
			
			showBust("");
			showName("TANK\nINSTALLED!");
			
			output("Controlling the bot with your Codex, you lead the way out of Badger’s lab and onto Novahome proper. With your eyes constantly changing their focus between the tank and the path ahead, you work your way up to the hangar and to your ship.");
			if(silly) output(" You only bump the tank into a couple raskvel heads on your short journey.");
			output("\n\nYou open up your ship’s airlock door and tow the tank inside, moving it to your storage and placing it in the corner. After releasing the cargo bot’s control from the tank, you lead it outside before it beeps in confirmation, disconnects from your link, and begins its return to sender. It flies back in the direction of Badger’s lab, going out of sight after a few seconds.");
			output("\n\nClosing the hatch as you come back in, you head to the silicone tank to set it up. Once everything is plugged in, you try out the tube. Your light squeeze produces tiny droplets of bio-silicone to spill from the needle-tip. It’s ready.");
			output("\n\n<b>You now have a silicone tank in your storage. It can be used at any time when in your ship.</b>");
			output("\n\n");
			
			processTime(17);
			
			flags["BADGER_SILICONE_TANK_INSTALLED"] = 1;
			
			// [Next]
			// SiliconeTank is now an option in the player’s storage.
			// Player is put in ship main screen
			addButton(0, "Next", mainGameMenu);
			break;
		case "other":
			showDrBadger();
			
			if(!pc.isBimbo()) output("As cautious as you are of the idea, Badger may have a different way for you to pay.");
			else output("Badger probably also has a totally fun way for you to pay! Maybe you should see what it is?");
			output("\n\n<i>“Do you have a different way you’d like me to pay...?”</i> you ask, a bit shyly.");
			output("\n\nBadger smiles almost deviously while she looks at you. <i>“You know me all too well... I could probably think of a fun way for you to pay.”</i> She places her goggles back on which makes you worry a little. <i>“How would you feel about carrying all the bio-silicone from the tank, in your body for... about a week or so? You’d look like the perfect woman. Then afterwards, you can have the tank. Sound good?”</i>");
			output("\n\n");
			
			processTime(2);
			
			// [Sure] [No]
			addButton(0, "Sure", drBadgerSiliconeTankBuy, ["other sure"], "Accept", "Carry a gigantic amount of silicone in your body for a week and get the silicone tank afterwards.");
			addButton(1, "No", drBadgerSiliconeTankBuy, ["other no"], "Refuse", "You’d rather not carry so much silicone that your body pops.");
			break;
		case "other no":
			showDrBadger();
			
			output("<i>“Uh... I think I’m going to have to decline that offer...”</i> you say, thinking about how cumbersome it would be to be some hyper-sized, silicone-inflated monster.");
			output("\n\n<i>“Fair enough. You’ve already got two options to pay so I’m not going to be more generous than I already am. If you change your mind, swing by. The tank’ll still be here.”</i>");
			output("\n\n");
			
			processTime(1);
			
			addButton(0, "Next", mainGameMenu);
			break;
		case "other sure":
			showDrBadger();
			
			output("<i>“I think I could do that,”</i> you say. <i>“Just a week of being hyper-sized, how bad could it be?”</i>");
			output("\n\n<i>“That’s the spirit!”</i> Badger smiles a toothy grin, patting you on the shoulder. <i>“Let’s go get you looking pretty.”</i>");
			output("\n\nBadger leads you down to her lab, all the way to the silicone tanks.");
			output("\n\n");
			
			processTime(2);
			
			addButton(0, "Next", drBadgerSiliconeTankBuy, ["other sure next"]);
			break;
		case "other sure next":
			currentLocation = "BIMBOTORIUM LAB";
			generateMap();
			
			showDrBadger();
			
			output("The lab’s silicone tanks in front of you get measurement estimates forming in your head. Each one is about eight feet tall, maybe three feet wide...");
			if(!pc.isBimbo()) output(" just one probably houses over five hundred gallons of silicone. That’s, what, maybe four thousand pounds, then?");
			else output(" just one probably has enough silicone to give you some enormous boobs!");
			output(" That’s a lot of silicone.... The whole tank is stainless steel, with a large glass line going down the side of it, allowing you to see the gelatin-like material inside. How the hell would any of these fit in your ship?");
			output("\n\nFrom the back of the room, Badger seems to be preparing a different tank, about a quarter of the size of the ones you’re looking at. It’s maybe a bit larger than a nightstand, with a similar build compared to the other tanks. Basically a mini version of the ones you are familiar with, but still housing plenty of bio-silicone. She sets the smaller tank in front of you and leaves you with its tube in your hand. She unfolds an old lawn chair, places it down, and plops her large body right into it, her excess curves bouncing within the tight confines of her nanoweave utilisuit. A wide smile forms across her lips while she watches you intently.");
			output("\n\n<i>“Well? I’m waiting.”</i>");
			output("\n\nIt feels like you’re being interrogated by her invasive eyes despite the fact that she’s just simply looking at you. It could be because those green eyes are so intensely focused on your body or because you are trapped in her lab, teetering on the line between being a willing test subject to a chaotic mad scientist and being a victim to a nefarious sex pervert. You hold the tube up and wobble it around before placing your grip closer to the tip. It’s now or never, right?");
			output("\n\nYou carefully pierce your waist with the needle");
			if(silly) output(", praying it doesn’t have some kind of SSTD on it,");
			output(" and look at the buttons on the tank’s control panel. The options are ‘suck’ and ‘inject’ and neither are crossed off this time around. A sigh escapes your mouth just before you guide your hand to the activation button. It’s just bio-silicone--you already like it enough to want to own a tank of it. Just carry the entirety of the load inside yourself and you’ll literally get the pump for free.");
			output("\n\nYou press and hold the button, your breathing intensifies as the clear gelatin enters your body rapidly, finding its way straight to your assets. What were once merely [pc.breastsNoun] are blowing up like balloons, not even mentioning your other bits swelling so fast that you’re almost worried about your [pc.gear] staying on. Everything feels so tight, but also so pleasant. Your [pc.skin] stretches to being filled with the extra mass, but it doesn’t hurt at all. Badger watches, all the while her hand sneaks between her legs to reach for her breeder-tier dick. She’s enjoying this more than you are, clearly, and you’re under the impression that she has no regrets about this being your method of payment. With the way she licks her lips and rubs her jumpsuit-encased shaft, she is likely using the moment as her personal edging session.");
			output("\n\nThe silicone level in the tank slowly gets lower and lower, visible through the glass line on the side. You’re not sure if you’re relieved or feeling empty once the goop stops coming. Even then, your body is now much, MUCH thicker than it was before. Doctor Badger, with a raging hard-on, slowly stands up and walks over to you, looking as if she’s about to molest you.");
			if(silly) output(" Though technically, you don’t even need the silicone in your body for her to do that.");
			output(" You take a step back, feeling miles more jiggle than usual reverberate across your form.");
			output("\n\n<i>“Well, you did it. And you didn’t even pop. I have to say, I’m quite impressed with you after this.”</i> Desire is in her eyes and you can tell she’d love to just take you, right here, right now, but instead she gives you a loud slap on your over-inflated rear end. <i>“I’ll get a timer set for <b>a week</b>. After that, swing by to pick up the tank. I think I’ll spend a little bit more time down here. You know the way out.”</i>");
			output("\n\nYou do.");
			output("\n\n");
			
			processTime(18);
			
			// +50 boob silicone size, +20 hip and butt size, +10 lip size
			nymFoeInjection(pc, 1, 20, true);
			nymFoeInjection(pc, 2, 20, true);
			nymFoeInjection(pc, 3, 50, true);
			nymFoeInjection(pc, 4, 5, true);
			
			addButton(0, "Next", drBadgerSiliconeTankBuy, ["other sure leave"]);
			break;
		case "other sure leave":
			//currentLocation = "304";
			currentLocation = "209";
			generateMap();
			
			showBust("");
			showName("\n");
			
			output("Leaving is a cakewalk - as in, your ‘cake’ wobbles while you walk, more so than you can possibly imagine. You’re out of there in no time.");
			output("\n\nYou can hear the door audibly lock behind you.");
			output("\n\n<b>It looks like you are unable to enter the Bimbotorium until Doctor Badger’s request has been met. You have to return in one week!</b>");
			output("\n\n");
			
			processTime(1);
			
			// Player is removed from the bimbotorium
			// Activate 84 hour timer, and display it under Badger’s text anytime the PC is in Badger’s main screen, ex: 28:36 remaining until you can take the silicone tank
			// Player cannot enter back lab
			
			flags["BADGER_SILICONE_TANK_INSTALLED"] = 2;
			pc.createStatusEffect("Badger Silicone Carry Timer", 0, 0, 0, 0, true, "", "", false, (60 * 24 * 7));
			
			addButton(0, "Next", mainGameMenu);
			break;
		// This next scene appears when the PC enters the bimbotorium when the timer is over
		case "times up":
			showBust(drBadgerBustDisplay());
			showName("\nTIME’S UP!");
			
			output("You take a short gander at your Codex, checking the time as you enter Badger’s Bimbotorium. It’s definitely been a week since you got - you grope your titantic tits - <i>these</i>.");
			output("\n\nAs usual, Doctor Badger is busily working on something. You approach her and start, <i>“Hey Badger, do you know what time it is?”</i>");
			output("\n\nShe turns from her things to face you, then looks up at one if the broken clocks hanging on the wall. <i>“Twelve fifty-seven. Why?”</i>");
			output("\n\n<i>“You know exactly why I’m here.”</i> you say, a little more seriously. To highlight your point, you grope one of your silicone-stuffed jugs, each about the size of an exercise ball and just as perky. <i>“These?”</i>");
			output("\n\nThe mad doctor reaches over and gives the tit a firm slap, the entire thing wobbling so much that you nearly topple over. <i>“Yep, they’re boobs. What about them?”</i> She maintains a light smile... she’s absolutely fucking with you. No doubt about it.");
			output("\n\n<i>“Do you have the tank ready for me to pick up?”</i>");
			output("\n\n<i>“You’re no fun... but yes, it is ready in all of its glory. I’ll get a cargo bot ready to ship it. After all, you did what I said, so... I guess I have to hold up my end of the bargain too.”</i> She rubs her palms together, like a typical villain before continuing, <i>“I can only imagine how your adventures were a bit different with all that extra mass.”</i>");
			output("\n\n");
			
			processTime(3);
			
			addButton(0, "Next", drBadgerSiliconeTankBuy, ["times up next"]);
			break;
		case "times up next":
			currentLocation = "BIMBOTORIUM LAB";
			generateMap();
			
			showBust("");
			showName("TANK\nOBTAINED!");
			
			output("You leave Badger and head towards her lab to claim your pump.");
			if(pc.isAss()) output(" And really? ‘You’re no fun?’ Well, maybe it’s because you’ve been carrying a hundred fucking gallons of silicone in your body for a week, but you’re a little tilted about that.");
			output("\n\nApproaching the silicone tank, you notice it’s already unplugged and ready for you to take. With your [pc.breasts] obscuring your view, you realize why: of course, Badger had no intentions of removing the bio-silicone inside you... that would just be too easy wouldn’t it?");
			output("\n\nA cargo bot zooms into view and lifts the tank up with relative ease. It hovers itself, payload and all, near you using anti-grav thrusters, tractor beams and sensors. A small ‘ding’ comes from your Codex, informing you that the drone is now tethered to your device, ready for you to guide. You then activate your Codex and manipulate the cargo bot to follow. You start flying it out, walking alongside it to make sure it doesn’t get tangled in any of the exposed cords and hanging wires strewn about the room.");
			output("\n\nSoon enough, you pass Badger, who immediately slaps your titanic ass on the way out, producing a loud SMACK! You yelp in surprise as the impact causes a mountainous ripple effect throughout your jiggly form which results in extra wobbles to your step when you exit.");
			output("\n\n");
			
			processTime(7);
			
			addButton(0, "Next", drBadgerSiliconeTankBuy, ["times up install"]);
			break;
		case "times up install":
			currentLocation = "SHIP INTERIOR";
			generateMap();
			
			showBust("");
			showName("TANK\nINSTALLED!");
			
			output("Controlling the bot with your Codex, you leave Badger’s lab and walk through Novahome proper with relative ease, if not for you appearing like a moving plate of gelatin. With the goods ahead of you, you work your way up to the hangar and to your ship.");
			output("\n\nYou open up your ship’s airlock door and tow the tank inside, moving it to your storage and placing it in the corner. After releasing the cargo bot’s control from the tank, you lead it outside before it beeps in confirmation, disconnects from your link, and begins its return to sender. It flies back in the direction of Badger’s lab, going out of sight after a few seconds.");
			output("\n\nClosing the hatch as you come back in, you head to the silicone tank to set it up. Once everything is plugged in, you try out the tube. Your light squeeze produces tiny droplets of bio-silicone to spill from the needle-tip. It’s ready.");
			output("\n\n<b>You now have a silicone tank in your storage. It can be used at any time when in your ship.</b>");
			output("\n\n");
			
			processTime(17);
			
			flags["BADGER_SILICONE_TANK_INSTALLED"] = 1;
			
			addButton(0, "Next", mainGameMenu);
			break;
		default:
			showBust("");
			showName("");
			
			output("ERROR!");
			output("\n\n");
			
			addButton(0, "Next", mainGameMenu);
			break;
	}
}

// “True Doll” perk
// The player gets black latex and implant-tastic at the same time. Their entire body, inside and out, becomes rubbery and plastic permanently. They gain a special line in their description. All of their holes are extremely elastic, and they don’t get stretched out anymore. Tease damage is increased to some foes.
// This scene appears after acquiring both perks.
public function gainTrueDollPerk(target:Creature = null, deltaT:uint = 0):void
{
	if(target == null) return;
	
	if(target is PlayerCharacter)
	{
		var msg:String = "";
		
		msg += "Woah, after that last change, you are feeling funny.... Your latex skin and bio-silicone implants seem to be interacting strangely with your microsurgeons. You find your hands sensually roaming your body, trying to search for something that isn’t there. Your insides change rapidly, but you can’t tell what exactly. You flip out your Codex and activate a personal scan. The incoming results say that everything in your body: organs, muscle, fat... has been coverted into some sort of material, biologically adjacent to rubber or plastic.";
		msg += "\n\nTaking in the strange discovery, you prod yourself all over, unsure of the ramifications brought on by your new transformation, but also... not really minding the change. It certainly makes you <i>feel</i> sexier... and it’s definitely going to be interesting living like this.";
		
		msg += "\n\n(<b>Perk Gained: True Doll</b> - Pretty much the entirety of your body is comprised of some sort of silicone or plastic and will stay that way forever, not to mention your incredibly elastic holes. Some foes may find you more attractive.)";
		
		if(msg != "") AddLogEvent(msg, "passive", deltaT);
	}
	// Increase all hole elasticity to what might as well be infinity
	// Skin type is permanently latex and assets are permanently silicone
	// +5 sexiness permanently
	
	// Perk: True Doll
	// v1: Max elasticity limit - Reach this elasticity value to be considered immune to stretching.
	// v2: Sexiness bonus
	// v3: Penetration marker - checked daily to see if penetrated. if so, do elasticity change.
	// v4: Elasticity auto-leveling check toggle. 0 for disabled, 1 for enabled
	target.createPerk("True Doll", 5, 5, 0, 1, "Your body is composed of silicone, rubber and plastic, boosting your sexiness and upgrading your elasticity.");
	// Add elasticity--the other elasticity levels can be gained through hole stretch training, I guess.
	if(target.elasticity < 5) target.elasticity += 0.25;
}
/*
Description change:
{You have a humanoid upper body, with the usual torso, arms, hands and fingers.} -> {Your entire body, through and through, is some kind of plastic. Luckily, you still have a fairly normal upper body, with the usual torso, arms, hands, and fingers.}
*/
public function trueDollPerkElasticityUpdate(target:Creature = null):String
{
	if(target == null) return "";
	if(target.perkv3("True Doll") == 0) return "";
	if(target.perkv4("True Doll") == 0) return "";
	
	var msg:String = "";
	var nMax:Number = target.perkv1("True Doll");
	if(target.elasticity < nMax)
	{
		// Gain 0.125 to 1 elasticity depending on how many times penetrated for that day.
		var addVal:Number = (0.125 * Math.min(target.perkv3("True Doll"), 8));
		if((target.elasticity + addVal) > nMax) addVal = (nMax - target.elasticity);
		target.elasticity += addVal;
		
		if(target is PlayerCharacter)
		{
			if(target.elasticity >= 1)
			{
				msg += "Recovering from being penetrated has left its mark on your plastic body. The act of tugging and stretching your holes and having them revert back to a natural level of tightness becomes";
				if(addVal <= 0.25) msg += " a bit";
				if(addVal >= 0.75) msg += " a lot";
				msg += " easier to you now. <b>Your elasticity has";
				if(addVal <= 0.25) msg += " slightly";
				if(addVal >= 0.75) msg += " greatly";
				msg += " increased!</b>";
				if(target.elasticity >= nMax) msg += "\n\nThe elasticity of your holes is now at a point where capacity is no longer an issue and stretching becomes a trivial effort. Any attempts to do so will have you snap back like a rubber band, preventing you from ever becoming gaped. <b>Your holes have become immune to being gaped from stretching!</b>";
			}
		}
		// Reset penetration marker
		target.setPerkValue("True Doll", 3, 0);
	}
	return msg;
}

