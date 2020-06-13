//Nunnery Facefuck Massacre
////available in october at the VR lounge or the player’s mindwash visor
//
//---------------------------
////scene selection guide
//Branch 1:
//Heather - young, bullied black furred ausar w/ pigtails
//Channing - white-haired chastity belt kui-tan +  Brianna - busty, teasing redhead huskar
//
//Branch 2:
//Bambi - pink haired wimple-less punk kaithrit
//Serena - glasses freckles beta dzaan
//
//Branch 3:
//Senior Sister Marilyn - fat lipped thraggen
//Melody - UGC officer, former nun, light brown ovir
//---------------------------

//Fen note: Actually unused. Integrated into the menus.
/*the following event triggers before the normal mindwash text
public function faceFuckMassacreIntro():void
{
	output("\n\nA glowing, orange box pops up, interrupting your experience before it even starts. It reads <i>“Click here if you dare!”</i> and has a small, photo-negative picture of a screaming face next to it. Is this some kind of advertising? A virus? Or maybe somebody’s just been screwing with the machine?");
	//[Close pop-up] [Click pop-up] 
	clearMenu();
	addButton(0,"Close Pop-up",);
	addButton(1,"Click Pop-up",);
}*/

/* Fen note: cut content due to integrating into the normal menu.[Close pop-up]
public function noNunFacefuckForMeThanks():void
{
	clearOutput();
	showName("\nNOPE");
	author("Adjatha");
	IncrementFlag("HALLOWEEN_NUNFUCK_REJECTIONS");
	//first time
	if(flags["HALLOWEEN_NUNFUCK_REJECTIONS"] == 1) 
	{
		output("Nope! You’re smart enough to not get suckered in to something like that. Then the machine’s mesmeric light overtakes you and everything is different.");
		//end holiday event, go to regular Mindwash scene
	}
	//repeat
	else
	{
		output("Geez, this thing just won’t go away! Whoever is screwing with you sure is persistent. You close the pop-up yet again and relax as the machine’s usual program kicks in.");
		//end holiday event, go to regular scene
	}
}*/

public function startingThisShit(reset:Boolean = false):void
{
	//if the PC closed the event before reaching the end
	if(flags["NUNFUCK_PAUSED"] == 1 && !reset)
	{
		clearOutput();
		showName("\nCONTINUE?");
		author("Adjatha");
		output("The hacked scenario seems to have saved your place. Will you pick up where you left off, or start a new session?");
		//[Continue] [Restart]
		clearMenu();
		addButton(0,"Continue",continueFuckingNuns);
		addButton(1,"Reset",startingThisShit,true);
	}
	//[Click pop-up] & [Restart]
	//first time, resetting after mid-point, & after the PC has gone through the event all the way at least once.
	else
	{
		clearOutput();
		showName("THE\nCONVENT");
		author("Adjatha");
		flags["NUNFUCK_PAUSED"] = undefined;
		output("The sun is red in the fading dusk and seems to grow dimmer with every step you take up the tall, lonely hill. As if emerging from dreamlike mists, a broad, tall structure looms ahead of you. Perched atop the hill with pale, magisterial grace sits an alabaster sanctuary that almost seems to glow white in the failing daylight. A tall fence of old world iron surrounds it, a large sign above the gate declaring this the ‘Convent of St. Jezebel.’ A second sign, no less prominent than the name, declares that absolutely no admittance is allowed.");
		output("\n\nBlood rushes to your head and your body seems to move of its own accord. It’s a simple task to scale the fence, the ascent pumping anxious energy into your limbs. You leap down and clear the distance to the building in a heartbeat. The convent awaits, but how will you gain entry?");
		//[Front Door] [Back Window]
		clearMenu();
		addButton(0,"Front Door",goThroughTheFrontDoor);
		addButton(1,"Back Window",backWindowNunstuff);
	}
}

//Branch 1
//[Front Door]
//Sister Heather
public function goThroughTheFrontDoor():void
{
	clearOutput();
	showName("SISTER\nHEATHER");
	author("Adjatha");
	flags["NUNFUCK_HEATHER"] = 1;
	output("A series of loud, sharp raps against the thick, wooden doors sends an echoing boom through the still night. You slink to one side, drawing deep, shuddering gasps as a long moment passes before you hear a muffled voice shout <i>“Coming!”</i> from within. There’s a clicking on the other side of the door as locks are released, so you flatten yourself against the wall and wait.");
	output("\n\nHinges squeak and the door swings open, hiding you behind it. A small, feminine voice calls out, <i>“I’m sorry, but we don’t... Hello? Is there anybody there? Oh ha ha, girls. Let’s all play a prank on Sister Heather just because she’s new, right? This isn’t funny!”</i> As you listen to the confused girl look for some source of the knocking, you happen to notice indentations of your knuckles on the wood. It’s getting stronger inside you again, the tension building to dangerous levels. You need to calm yourself. You need release. You need it NOW.");
	output("\n\nYou lunge out from behind the door and seize the junior clergy member. Shocked, she opens her mouth to scream, but you swing her back, behind the door, slamming her back against the stone walls of her convent. Breath knocked away by the impact, the girl sinks to her knees, stunned. Judging by the black fur of her hands and the ears that tentpole her wimple, the girl is an ausar. The black and white of her austere habit hides much of her body, but a pair of long pigtails poke out from the sides of her veil, draped across the slight curve of her chest.");
	output("\n\nYour cock looms over her like a monolith, eliciting a whimpering gasp from the junior nun. Sister Heather’s tucked tail thumps against the stone at her back while her eyes trace the full scope of the arm-length monster before her. <i>“Please... I’m a virgin,”</i> she pleads, misreading your intentions. You place a hand against her cheek in a comforting gesture. Then, your other hand on the opposite cheek.");
	output("\n\nYour hands sink down, grabbing hold of her pigtails as you buck forward, bury your bone inside the dog-girl’s mouth with one savage thrust. Her eyes go wide and her jaw gapes at your sheer girth, but you don’t have the patience to enjoy her shock. The blood surging through your body feels like it’s boiling with the heat of your mania. Using her hair as handlebars you pump back and forth, from lips to uvula only a handful of times before your seed begins to flow. The nun struggles weakly as globs of cum fill her mouth and leak down her throat. Semen bubbles at her lips and runs down her chin but still you swing your hips and yank her head, driving your mast inches deeper with every stroke.");
	output("\n\nThe cloistered cleric gurgles and hacks, choking and gagging on your monstrous member and the torrential spouts glazing her mouth. Despite her difficulty in gulping down air through cock-stuffed cheeks, the nun’s eyes are closed and she wears an expression of sublime relish. She winces with acute delight every time you pull her hair and gurgles wordlessly on your maw-flooding spunk. Your forceful pace and relentless grip yank her head hard enough to shake her habit off, freeing her long, pointed jackal-like ears. They wobble to and fro as you drag her body, head-first, up and down your jackhammering pillar.");
	processTime(5);
	pc.changeLust(50);
	clearMenu();
	addButton(0,"Next",goThroughTheFrontDoor2);
}

public function goThroughTheFrontDoor2():void
{
	clearOutput();
	author("Adjatha");
	showName("SISTER\nHEATHER");
	output("When your cockhead stops teasing the back of her mouth, however, and plunges through the pinched narrowness of her windpipe, Sister Heather’s ears go flat and her tail bristles in panic. When your backstroke frees her esophagus, the cascades of cum streaming into her overfilled cheeks rush to fill the void. The canine neophyte swallows reflexively as your thick flow gets caught up in downspout of her throat. When her cheeks fill back up, you cork and uncork her gullet again, sending her into another spasm of cum-drinking gulps.");
	output("\n\nTwisting your hands to double up your grip on her pigtails, you haul Sister Heather’s face forward, feeding your inches into her shuddering neck. Involuntary gulps swallow your mass as easily as the spunk drooling from your tip and you tug her pretty young face all the way up to your root. Her muscles contract and shudder around your girth with virginal rapture. She gasps fruitlessly and feebly pulls against your grip but all too soon, her eyes roll back and her body goes slack. You loosening your grip on her the hair and she sinks, bonelessly, to the ground.");
	output("\n\nThe memory of her clinging wetness around your length sticks to your skin like a phantom mouth, sucking at you even in the open air. Your phallus twitches with the last of your fat ejaculate, spraying gooey streams of nut across the unconscious nun. You drop to one knee and press your swollen cockhead to her lips, aiming your loads into her mouth and watching as it fills her pink cheeks, she’s too overcome to swallow so it simply spills out like liquid lacquer across her chin and down her neck. After everything, her robe just about completely soaked by split spunk that pools around her like a halo of liquid ivory.");
	output("\n\nYou stand upright to admire your handiwork. Before you, the nun’s chest rises and falls with the shallow weakness of the ravaged. Drooling curtains of white spill from the fountain of her cum-stuffed mouth and even the shaggy black fur of her hands and ears have sticky ribbons adorning them. Though her eyes are open, her pupils are so far rolled back that all you can see are white orbs.");
	output("\n\nSister Heather incoherently gargles the throatful of jizz you’ve left her with, seemingly unable to remember how to swallow. Her tail flops around randomly, fingers clenching and unclenching at nothing. Lifting the inert ausar is easy enough, so you deposit her twitching form behind a high bush a short distance from the door. Just far enough that she’ll be out of sight, should anyone come snooping around before you’re done here. She gurgles, insensate to anything outside of her sopping, sperm-soaked body.");
	output("\n\nDespite the nun-coating volume of your facefucking orgasm, your breathing is slow and steady. You are calm, the fire in your veins crystalized to icy determination. You will take these brides of the divine for your own.");
	output("\n\nEvery. Last. One.");
	processTime(10);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",endOfPhase1Nunfuck);
}
//End branch 1

//[Back Window]
//Sister Channing & Brianna
public function backWindowNunstuff():void
{
	clearOutput();
	showName("CHANNING\n& BRIANNA");
	author("Adjatha");
	flags["NUNFUCK_HEATHER"] = -1;
	output("Creeping around the side of the building, you discover a wing of the nunnery that seems less used than the others. Testing the window, you find it locked at first. A bit of effort twists the metal latch right out of the frame, rent steel dropping to the carpet with a heavy thud. You look at your fingers with dull alarm. It’s getting stronger inside you again, the tension building to dangerous levels. You need to calm yourself.");
	output("\n\nClimbing through the forced aperture and carefully closing the glass, you look around. This unlit room looks like it may have been a communal space, with numerous couches and hanging silk curtains. Before you can take a full inventory of your surroundings, you hear a pair of voices drifting toward you. <i>“C’mon, Channing! Nobody ever goes back here. It’ll be fun!”</i> The sound of blood rushing in your ears makes the faint voice echo louder and louder. You need to calm yourself. You need release. You need it NOW.");
	output("\n\nHiding behind a hanging cloth screen, you wait tensely. The thunderous booming of your heart’s percussive desire threatens to drop you to your knees, but you hold your position. The door opens far too slowly, a rectangle of light illuminating a pair of nuns, one tall and one wide. They close the door behind them, shutting out the blinding light and plunging the room once more into the close, intimate gloom of twilight.");
	output("\n\n<i>“Shh! Don’t turn on the light or Marilyn might find us,”</i> the shorter of the two giggles. She has a collar of fur around her throat that flickers with scarlet even in the long shadows of the room. She moves with a jiggling strut that suggests she must be a huskar. Her companion is a tall, lean girl draped in the monochromatic robe of her order, but the huge, fuzzy, striped tail sticking out from her rear makes her kui-tan heritage all too obvious.");
	output("\n\n<i>“Brianna,”</i> the taller girl whimpers softly, <i>“I don’t think this is a good idea. You know we’re not supposed to be doing this kind of thing.”</i> She shifts uncomfortably, tugging at the front of her robe.");
	output("\n\n<i>“That’s not what you were saying last night, Sister Channing,”</i> her partner teases, pressing her thick curves against the other girl’s body. The two move to a nearby couch and Brianna pushes her partner down. With lidded eyes, the huskar moves on top of the other girl and bites down on the hem of her robe. Crawling forward, she lifts the black drape immodestly over the kui-tan’s legs, thighs, and hips until she’s bare from the waist down. A leather chastity cage has been fixed around the tanuki’s loins, large enough to keep her penis in its sheath while leaving her hefty balls swinging freely. Its locks jingle faintly as the two embrace in breathless kisses.");
	output("\n\n<i>“B-Brianna,”</i> the kui-tan moans. <i>“These things are so hot,”</i> she whines, anxiously pulls the black veil from her peak and loosens the white coif around her neck. The tall tanuki’s pale silver tresses spill across her brown furred shoulders. She tugs at the huskar’s habit next, exposing the redhead’s short-cropped hair and pointed, scarlet ears. She reaches out and gently guides her canine partner’s head down, toward her inner thighs.");
	output("\n\n<i>“Hmmm,”</i> chubby nun coos, lifting the kui-tan’s legs up around her shoulders. <i>“You know I’m powerless against these big, juicy balls of yours,”</i> Sister Brianna scolds, burying her face in the plush softness. Sister Channing gasps, arching her back in a full body stretch of private bliss at the huskar’s eager, ball-worshipping tongue. Every lapping lick and heated, suckling kiss adds volume to the kui-tan’s sack, ballooning the fist-sized orbs into a pair of ripe melons that hide everything but the peaks of the huskar’s doggy ears.");
	processTime(10);
	pc.changeLust(25);
	clearMenu();
	addButton(0,"Next",backWindowNunstuff2);
}
public function backWindowNunstuff2():void
{
	clearOutput();
	showName("CHANNING\n& BRIANNA");
	author("Adjatha");
	output("Casting her head back, over the cushioned arm of the couch, Sister Channing opens her heavily lidded eyes just in time to see the shadow of your cock looming over her. She opens her mouth in surprise and you spear past her lips before the first word of alarm escapes. She tenses, blinded by the eclipse of your balls, and instinctively gulps, swallowing your inches before realizing exactly what’s happening. Her tongue flits across your tip, powerlessly trying to stymie your advance, but despite it all, her heated maw is all too willing to spread itself to full, meat-stuffed dilation.");
	output("\n\nThe nun’s bewilderment becomes outright shock as you thrust your girth pat her uvula and into her throat. The long, slender neck bloats at the intrusion, an outline of your mast obvious even under the girl’s brown fur. Her tightness is too delicious for any thoughts of restraint, so you begin to pump thick loads of cream then and there. Her body tenses, every muscle clamping down, narrowing her windpipe like a virginal pussy and trapping Sister Brianna’s head between her long thighs.");
	output("\n\nThe huskar below struggles, muffled confusion vibrating Sister Channing’s balls while your jizz overflows the kui-tan’s frame. Fat bubbles of seed spread around the ‘O’ of her lips while thin jets of warm spunk spurt from her nostrils against your balls. You buck against her sealed windpipe, swabbing her throat until the muscles relax enough to let your heavy loads gush into her gut. Her leather-caged cock strains against its bonds but cannot push past the enforced chastity of the order. Her balls, backed up and without outlet, swell to colossal dimensions, burying even the twitching ears of the huskar trapped between the nun’s legs.");
	output("\n\nWhen, finally, Sister Channing goes limp, Sister Brianna takes nearly a minute to struggle free from the weight of the overfilled ‘nuki nuts on top of her. <i>“What the H, Channing?”</i> she pants, shaking her head panting. <i>“I could barely breathe down there! And why’d you let yourself get so backed up? I know you like getting your balls sucked, but holy cow! There’s no way Mother Superior won’t notice these! We’re gonna be in SO much trouble!”</i>");
	output("\n\nThe fiery huskar marvels in fascinated amazement at the sheer size of her partner’s testes before noticing she’s the only one talking. <i>“Channing?”</i> She crawls up, over the other nun’s nuts and notices, at last, the state of her companion. The tanuki nun’s head is draped over the couch’s arm, her expression vacant and her mouth fixed in a wide O. Globs of cum pool in the roof of her mouth and a curtain of alabaster has been splashed across her brow and down the long, sticky tresses of her silver hair.");
	output("\n\n<i>“Who-”</i> is all Sister Brianna gets out before you bound out from behind the couch and lay hold of her with impossible, impassioned strength. You fling her back against Sister Channing’s chair-sized balls and tower over her, cock spraying ropes of gushing goo across black robe and crimson fur collar. She lets out a scream but you push it right back down her throat with the twitching crest of your double-thick shaft. The kui-tan cushion supporting the two of you wobbles with liquid softness as you ram the back of Sister Brianna’s head against it again and again.");
	output("\n\nYour spurting assault lubricates each thrust with a slimy glaze, load upon load vanishing into the chubby nun’s greedy belly. Incredibly, not even a drop strays from her gullet, as if her throat were permanently set to ‘swallow.’ Your fingers curl around the sides of the bitch’s face, bouncing her head on the cum-filled waterbed of her Sister’s balls. Jerking her up with every elastic impact, you manage to feed so much cock past her furred collar, you end up resting your balls against her chin and squish her button nose against your pelvis. Her flushed expression and pudgy cheeks darken and go nearly as red as her hair before she is at last overwhelmed, passing out while still swallowing your seed.");
	output("\n\nPulling out of the maiden, you step back to admire your work. The nut-starved nun reclines atop her companion’s quivering testes. Even through her girth, the huskar’s cum-stuffed belly is evident, her midsection straining against the seams of her robe. Despite the frenzied speed of the wild facefucking, your breathing is slow and steady. You are calm, the fire in your veins crystalized to icy determination. You will take these brides of the divine for your own.");
	processTime(20);
	pc.orgasm();
	pc.orgasm();
	output("\n\nEvery. Last. One.");
	clearMenu();
	addButton(0,"Next",endOfPhase1Nunfuck);
	//end branch 1
}

//Merge
public function endOfPhase1Nunfuck():void
{
	clearOutput();
	showName("\nNUNNERY");
	author("Adjatha");
	output("You enter the nunnery proper, slinking through the spacious interior with the silent intensity of a brewing storm. From time to time, a lone nun - busy on some nightly chore - crosses your path and it’s all too easy to snatch them from behind, drag them into an isolated room, and fuck their faces into cum-drooling messes. When darkness falls, you’ve tallied up a fair collection of despoiled priestesses yet your pulse is steady and your body tense at the promise of more to come.");
	output("\n\nVoices in a hallway draw your attention and you hold back just far enough to make out a fair you must’ve missed. One is a tall girl with an hourglass figure and long, elegant neck. Though her habit covers most of her skin, you can tell from the keratin-like freckles on her brown-skinned cheeks that she must be a beta dzaan. <i>“I am a bit concerned, Sister Bambi,”</i> she murmurs, pushing a pair of thick, oval glasses up the bridge of her nose. <i>“I haven’t seen most of our sisters all evening and I keep hearing strange things in the halls. Do you suppose they are in trouble?”</i>");
	output("\n\nThe other nun is plainly a kaithrit, her heavily pierced, black ears poking up from a pink mohawk. She’s apparently ignored putting on her hood and while her white nun’s coif is draped across her neck and shoulders, she’s torn her robe at the thigh-level. The normally modest outfit is little more than a slutty party dress on the libertine feline. <i>“They’re probably tongue-deep in each other,”</i> she laughs.");
	output("\n\nThe dzaan’s mocha cheeks blush a like dark chocolate. <i>“That’s... I mean... they aren’t supposed to...”</i>");
	output("\n\nThe catgirl leans over and slugs the taller nun in the arm. <i>“You’re such a busybody, Serena. Chill out once in a while.”</i>");
	output("\n\nSister Serena rubs her arm gingerly, weighing the other woman’s words. <i>“Yes, I suppose they should be trusted with their privacy. It’s just the convent feels so empty with so many of our sisters off-world on their mission, spreading the Word.”</i>");
	output("\n\n<i>“Yeah, and everybody left behind are spreading their legs while Mother Superior is away,”</i> Bambi grins. Though her attitude is dismissive, the kaithrit’s twin, midnight tails flit across the ground, their tips twitching. <i>“Or would be, if we ever got visitors, anyway. Look, just go see if there’s any left-overs from supper, ya cow. Stuffin’ your face always calms ya down.”</i>");
	output("\n\nHer companion laughs lightly, holding her hand demurely over he mouth. <i>“Ha hah, you know I believe I may just do that before Last Signal, Sister Bambi. Would you like to join me, or will you be at your prayers?”</i>");
	output("\n\n<i>“Yeah, praying to the high pressure setting on the showerhead,”</i> she replies, flicking her tongue out at the taller woman.");
	output("\n\nThe two head off in opposite directions.");
	processTime(10);
	clearMenu();
	//Branch 2
	addButton(0,"Dining Hall",diningHallNunfuck);
	addButton(1,"Showers",showerSceneNunfuck);
}

//[Dining Hall]
//Sister Serena
public function diningHallNunfuck():void
{
	clearOutput();
	showName("\nSERENA");
	author("Adjatha");
	flags["NUNFUCK_SERENA"] = 1;
	output("Sister Serena. You roll the name across the forefront of your mind. At nearly eight feet tall, you suppose a girl like that must need considerably more food than her smaller brethren. Luckily, you’ve got just the meal for her. Following after the tall dzaan, you stay just far enough back to keep her in sight. The dusky abbess glides serenely through the emptied halls of the sanctuary, finding her way to the dining hall and stepping eagerly into the kitchen with the inattentive gait of a habitual snacker.");
	output("\n\nAfter gently closing the dining hall doors, you slip into the kitchen as well. The tall nun has found her way a massive refrigerator. Her head is buried in its numerous shelves, loading up armfuls of left-overs while humming to herself. Placing yourself closely behind her, you stand still and silent as a statue. When she’s finally accumulated so much that she can no longer carry anything else, the dzaan girl straightens up and turns about to find a table.");
	output("\n\nUpon seeing you right in front of her, however, she very nearly leaps out of her habit. Startled, she drops all of her food in a clattering mess at her feet. <i>“Oh! Oh my goodness!”</i> She sinks down to her knees, busily trying to clean the mess. <i>“Oh, I am so, SO very sorry! It’s just that you gave me quite a shock and I thought for a moment you were Mother Superior and I knew I shouldn’t be eating so much, but I was terribly hungry and Sister Bambi suggested a snack and... and...”</i> Sister Serena freezes in her motions, the realization of what she saw slowly dawning on her.");
	output("\n\n<i>“You... you’re not a nun,”</i> She gulps and pushes her glasses up the bridge of her nose. The deeply brown girl slowly raises her gaze upwards. On her hands and knees, the dzaan’s face is right at the level of your groin. You flex your erection and let it plop heavily against her narrow nose. The slimy coating of her Sisters’ saliva oozes down her cheeks and smears against her thick lenses. <i>“Oh... dear. I’m in trouble, aren’t I?”</i> she asks with a quavering voice.");
	output("\n\nBy way of response, you twist your hips and swing your massive member to slap the nun’s face with a wet ‘thwack!’ Despite her size, the girl practically tumbles from the impact, collapsing to one side and scrambling to pick herself back up. Her breath quickens and her dark caramel skin flushes a warm umber. Her fingers fumble with her glasses as she look up at you again, just in time for another weighty cockslap. Falling back on her ass, she scoots away with breathless, disorganized haste, backing herself into a corner of the stainless steel kitchen.");
	output("\n\nStepping slowly toward her, you can see Sister Serena’s eyes glaze, going distant. She has been in this place before. Before the nunnery, you suppose. A beta who’s gone too long without an alpha. You droop your stiffness against her face once more and she shudders with drug-like longing. Her glasses fog at the heat of her panting gasps and you can make out the stiffness of her teacup nipples through the cloth of her habit. She tilts her head back, pressing her lips against the underside of your shaft. Kissing the dominating mast, she shakes with the shameless thirst of her coarse desires.");
	output("\n\nDrawing her tongue along the bulging under-vein of your swollen member, the dzaan gathers up as much of the dripping goo as she can. When she reaches your tip, her lips are polished with the moisture of her sister’s slaver and her tongue is half-submerged in a small pool of your gooey pre-cum. She looks up at you with obedient eyes and seals her lips, listing her head back. You watch as she swallows, a thick lump travelling down the lofty length of her coif-clad throat. Her eyes close as the slime hits her stomach and she shudders.");
	output("\n\n<i>“Yummy,”</i> she whispers.");
	processTime(20);
	clearMenu();
	addButton(0,"Next",diningHallNunfuck2);
}

public function diningHallNunfuck2():void
{
	clearOutput();
	showName("\nSERENA");
	author("Adjatha");
	output("When Sister Serena’s eyes open again, there is a kind of madness in them. She clutches at her neck and between her thighs, but her lips move forward as if under their own power. She presses a kiss against your cockhead, sucking against your urethral slit before lowering her jaw and filling her mouth with the crown of your profane penis. She gurgles, rolling her tongue over the pliant flesh and sucking at the throbbing girth. The famished nun turns her head left and right, filling one cheek then the other with your mass, smearing the flavor of your seed across every inch of her maw.");
	output("\n\nJust as you feel the tightness in your base building, she lunges forward, impaling her throat on your girth in a single motion. Incredibly, she clears the full length of her throat and smashes her face against your groin. You can feel every inch of her long neck squeezing on your ponderous prick for a long second, before she begins to pull back with tantalizing slowness. Her lips sweep across your shaft before, finally, reaching your peak and discharging your cock with a panting, open-mouth kiss. Gooey ropes of throat slime drip off of your glistening mast and more droop between your cock and Sister Serena’s gasping mouth. She huffs, letting the slimy bridge between you wobble in the open air before looking up again to meet your gaze.");
	output("\n\nThe faintest of smiles is all it takes to send the dzaan beta back to work. She throws herself on your pole with abandon, deep-throating you with every long, swallowing lunge. She slides her fuckhole of a face around you with such passion that you don’t realize you’ve begun cumming until it begins filling her cheeks on one of the back strokes. Less concerned at swallowing your cum than she is at swallowing your meat, spurts of saliva and spunk spill across her pronounced bust and pool in her wide-hipped lap.");
	output("\n\nShe rams herself against your body so vigorously that you begin to hear the sound of cloth tearing. The white coif that hugs her neck so tightly bursts, seam by seam, until it hangs ragged around her shoulders, giving you full view of her chocolate throat and the bulging shape of your cock traveling so effortlessly through it.");
	output("\n\nLeft to her own devices, she might stay here, fucking you with her face all night long, but the convent has more yet to see. Grabbing the back of her head with both hands, you arrest her pistoning pace and simply hold her, cradled against your abdomen, cock buried to its hilt in her esophagus, pumping wave after wave of jizz directly into her belly. She struggles for a moment before relenting. Her eyes turn upward to lock your gaze and she begins humming for you, vibrating her walls around your spasming girth. Her fingers trace the long, bloated length of her cock-stuffed throat with a reverent tenderness. Her glasses, still miraculously perched on her nose, are so slathered with alabaster spunk that they almost look like bleached sunglasses.");
	output("\n\nShe maintains eye contact far longer than you would’ve expected, but eventually she trembles, shudders, and her eyes roll back until they’re as white as her glasses. Reluctantly, you pull free from Sister Serena and let the dzaan slump against the kitchen corner. You wipe your dripping cock off on her cheeks as one last treat for being such a thirsty throat-slut before heading out.");
	processTime(10);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",endOfPhaseNunfuck);
}
//end branch 2

//[Showers]
//Sister Bambi
public function showerSceneNunfuck():void
{
	clearOutput();
	showName("\nBAMBI");
	author("Adjatha");
	flags["NUNFUCK_SERENA"] = -1;
	output("Turning your attention to the kitty nun, you proceed slow, following her to the showers, but holding back from entering right away. After you judge enough time has passed, you head in to find her torn robe and coif, tossing both in an ungainly pile at the entryway. You note the lack of bra or panties among her discarded clothing before pushing into the humid cloudbank filling the ceramic-tiled room. The rushing sound of water drowns out just about everything here. For some reason, all of the showers have been turned on at full blast. A minor act of wasteful rebellion against her sisterhood, perhaps.");
	output("\n\nSister Bambi herself dances through the gushing cascades, eyes closed and head whipping about to some unheard song. She’s around a b-cup, with thin hips and a waifish body. Incricate, interweaving tattoos form sleeves of ink on both arms, going from her wrists up to her shoulders and joining together on her back. You wouldn’t be surprised if she used to have piercings once, but there’s no metal on this kaithrit now. With a bar of soap clutched in one hand, she’s worked up a glistening lather all over her pale skin.");
	output("\n\nThe showers are filled with thick clouds of steam so you approach unseen and undetected until you’re within arm’s reach of the pink-haired girl. Her spinning, head-bobbing dance brings her tails whipping around, slapping your thighs and shakes her out of her revery instantly. <i>“The fuck?”</i> she grumbles, pushing her wet, drooping mohawk out of her eyes. <i>“Can’t you bitches let me enjoy this on my own for once?”</i>");
	output("\n\nIt isn’t until she realizes you’re not one of her Sisters that her tone changes. Her tails stand up, bristling despite the pouring water. <i>“Who the fuck are you? How the fuck did you get in there?”</i> She glances down to see the silhouette of your cock through the steam. Her eyes go wide and she drops her soap. <i>“What the fuck is THAT?”</i>");
	output("\n\nShe backs away from you, but steps carelessly, one foot coming down on the soap. Her leg shoots out from under her and the feline nun goes head over heels, flipping and landing hard on her back with a splash. Stunned by the impact, her mouth moves but only a strangled wheeze comes out. Unexpected. But, you know what will make her feel better.");
	output("\n\nYou go to one knee, and flip her onto her front, grabbing her arms and hauling them to the small of her back. Using one of her tails like a rope, you tie her wrists together, then pull her legs back and do the same with her ankles and the other tail. Hog-tied and bound by her own body, you hoist the Sister Bambi up with both arms, marveling at just how light the nun is.");
	output("\n\n<i>“What is- who are- why are-”</i> she sputters, gasping and slowly regaining her senses from the fall. The answer to all her questions - the massive mast swinging between your legs - rises in full salute, lifting its bulk to a vertical pillar of shower-slick meat. Flipping her upside-down, you hold the kitty parallel to your cock, pressing its length against her front. With her head at the level of your balls, your phallus reaches well past the small abbess’ belly button. <i>“No way,”</i> she gasps. <i>“You can’t... I can’t...”</i>");
	processTime(10);
	pc.changeLust(150);
	clearMenu();
	addButton(0,"Next",showerSceneNunfuck2);
}
public function showerSceneNunfuck2():void
{
	clearOutput();
	showName("\nBAMBI");
	author("Adjatha");
	output("Ignoring her lack of faith, you haul her upward until your peak rests against her upper lip. <i>“ARE YOU FUCKING CRAZY?!”</i> she screams, her voice lost in the deafening rush of the showers. Her jaw opens wide enough for you to lower her onto your cockhead and plug up vulgar obscenities. She squirms in your grasp, trying to loosen the knots you’ve made of her tails, but only succeeds in wiggling another inch down your spearing prick. Her rough, feline tongue whips around her mouth frantically, teasing your tip and filling her mouth with saliva.");
	output("\n\nYou feed another few inches into the contorted cat-girl, bobbing her up and down. Teasing the back of her mouth with your fist-sized crown, Sister Bambi’s cheeks fill to overflowing with thick, phlegmy drool. She gags and coughs, her hot slaver leaking down your unsheathed length while muffled shrieks vibrate her inner walls against you. Beads of white start building along her small, stiff nipples, milk rolling in thin streams down her collarbone and jawline. This kitty’s filled with surprises, it seems.");
	output("\n\nThe nun’s hips twist in her fretful fidgeting, her soapy body slipping in your grasp for just a second. A second is all it takes, however, to let her drop a good foot, your girth lancing up through her esophagus. You catch her by the swell of her ass before she drops completely, but the shock of the sudden descent and accompanying deepthroat sends a convulsive, orgasmic tremor through the nun so powerful you can see her muscles flexing through her slender limbs. Twin gouts of milk spray from her small breasts, bathing your chest and stomach in a shower of rich cream.");
	output("\n\nThe catgirl’s cock-bloated throat rubs against your abdomen, her fuck nugget frame undulating in an reflexive swallowing motion. Her clinging, clutching muscles suck all along your monolithic rod, pulling her further and further down. You hold back the descent for a moment, but gradually let gravity and the girl’s thirsty throat win out. Inches disappear into her lips until at last her chin is firmly pressed against the bulk of your churning balls while your cockhead’s peak is braced in the stretched depths of her narrow stomach.");
	output("\n\nCarefully, you loose your hold, the rigor of your stiffness supporting the transfixed girl like a slab of spit-roasted meat. The outline of your throbbing pillar is unmistakable along her neck and even in her abdomen. Her belly bulges at the girth of your invasion and it’s not long before her body locks up in a second orgasm. Clenching down on you from crest to root, you can’t hold back any further. This cat has earned her cream.");
	output("\n\nHer face feels the ascent of your climax first, the cushion of your saliva-slick skin swelling under her sharp features as a wave of passion boils up your pipeline. The heavy heat surges past her O-ring lips and through drool-stuffed cheeks. Rutting fervor rises through her ballooned throat and rushes up past the rapid heartbeat of her chest before geysering into her cock-stuffed gut. Her narrow waist, already gravid with your girth, fattens from the weight of your seed.");
	output("\n\nHer slender frame fills in moments. She bucks her hips and twists about disjointedly, utterly lost in the sensations of your rich spouts saturating her core to overflowing. Load builds upon load and cascading streams find their way back down her neck to flood her cheeks and pour in waterfalls from her dilated maw. The steamy spunk even finds its way through her nasal passages, adding a pair of spurting streams to the frothy jizz pouring out of her. It’s hardly a surprise when the deluge works its way through her gut to fountain sticky pearl slime from her ass. White drenches her apple bottom cheeks in the glaze of your gooey spoo as quickly as the showers can wash it off.");
	output("\n\nSister Bambi spams and gags from her perch, acting as the spigot for her own, private cum shower. While she climaxes her brains out atop your spearing bulk, you take a moment to appreciate the once-slender catgirl. Fresh milk continually jets from her teats even without any hand or mouth touching them, compelled to gush by the force of her orgasms alone. With her limbs bound behind her and jaw stretched to its limits, you imagine you could simply walk out of the convent just like this, with a brand new milkmaid and cockwarmer.");
	output("\n\nThere are, however, nuns yet to meet. With a degree of reluctance, you grab hold of the jizz-swollen girl’s hips and hoist her up and off of your erection. Like removing a cork from a bottle of champagne, a torrent of unswallowed spooge spills from her limp lips and splatters into a small pond of foamy ejaculate at your feet. You lower the twitching nun to the tile and let the showers run on. The steam is so thick that even after just a few steps, the insensate kaithrit is lost in the pale haze, bound as much by her tails as her cum-drunk rapture.");
	processTime(20);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",endOfPhaseNunfuck);
}
//[Next]
//end branch 2

//merge
public function endOfPhaseNunfuck():void
{
	clearOutput();
	showName("\nCONTINUE?");
	output("A snowstorm of static crackles across your vision and you momentarily remember who you are. The hijacked VR simulation is still pounding in your forebrain, trying to imprint itself on your memories for good. There’s no telling if the remote-hacked machine’s safety protocols are working or not. You have a split second to decide if you’ll stay plugged in or pull back.");
	processTime(1);
	clearMenu();
	addButton(0,"Continue",continueFuckingNuns);
	addButton(1,"End",endTheNunFacefuckStuff);
}

//[End]
public function endTheNunFacefuckStuff():void
{
	clearOutput();
	showName("IT'S\nOVER");
	flags["NUNFUCK_PAUSED"] = 1;
	author("Adjatha");
	output("You pull off the visor and gulp down cold air. Pressing the heels of your palms into your eyes does little to clear the sim from your vision. Maybe you’ll check out the rest of the smut another time, but for now, you’ve had enough.");
	//Increase lust by 50
	pc.changeLust(50);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
	//end event and drop PC back into the room
}

//[Continue]
public function continueFuckingNuns():void
{
	clearOutput();
	author("Adjatha");
	showName("THE\nCONVENT");
	output("Moving out into the halls of the convent once more, your hunt is momentarily halted by the sound of a heavy banging at the front door. You approach carefully, keeping out of sight and closing the distance as much as you dare before you hear someone stomp to the door and pull it open with a noisy creak.");
	output("\n\nA loud, commanding voice speaks first. <i>“How can I help you, Officer?”</i> Though you can’t see her from your hiding spot, she has a deep timbre and her tone suggests she’s more used to asking questions than answering them. <i>“Wait a moment... Sister Melody? Is that you?”</i>");
	output("\n\nThe person at the door sighs. <i>“Officer Melody, now. I left the order, Marilyn. Remember?”</i> The second speaker sounds irritated and perhaps a bit embarrassed.");
	output("\n\n<i>“Yes, I do remember, Officer. Though, ‘asked to leave’ might be more accurate. How can the Order of St. Jezebel help the United Galactic Confederacy tonight?”</i> The nun’s voice has all the warmth of ice cube.");
	output("\n\n<i>“You- Listen, here ‘Sister Superior.’ I didn’t want to come out here, alright? Apparently, there’s been some kind of escaped maniac that broke out of a military lab or something.”</i>");
	output("\n\n<i>“You sound well informed, Officer.”</i>");
	output("\n\n<i>“Oh don’t give me that, Marilyn. They’re not telling anybody anything. You’re damned lucky I came out here to warn you at all!”</i>");
	output("\n\n<i>“No need for blasphemies, Officer. You’ve satisfied your guilt, no doubt, and can return to your secular life.”</i>");
	output("\n\nIt seems like the former nun is about to respond, but instead you hear a click of heels and the sound of her storming off. The door is closed and Sister Marilyn calls up the main stairway.");
	output("\n\n<i>“Sisters, there may be trouble with outsiders. Remain upstairs and gather in the dormitories until I have had a chance to patrol down here.”</i>");
	output("\n\nThe junior nuns up above scurrying off into the distance while the heavy, self-assured footfalls of Sister Marilyn prowl around the ground floor. The Sister Superior is all by herself down here, but there is still a UGC officer outside. No telling if she’ll remain on the premises or not.");
	processTime(10);
	//[Sister Superior] [Police Girl]
	clearMenu();
	addButton(0,"Sister Superior",sisterSuperiorNunfuck);
	addButton(1,"Police Girl",policeGirlEncounter);
}
//Branch 3

//[Sister Superior]
//Sister Marilyn
public function sisterSuperiorNunfuck():void
{
	clearOutput();
	showName("SISTER\nMARILYN");
	author("Adjatha");
	flags["NUNFUCK_MARILYN"] = 1;
	output("Why settle for the impious when you can go right to the head acolyte herself? It doesn’t take long to catch up with Sister Marilyn, as her steady, stomping gait is swift but not terribly stealthy. From behind, she’s certainly tall but her shapeless black robe hides most everything else. It isn’t until she swivels around that you get a good look at her. Her green skin, strong jaw, slitted eyes, and numerous scars tell you that she’s a thraggen, and judging by the blazing fire in her expression, she’s on the warpath. Curiously, her dark emerald lips are simply huge. Porn-star huge. Maybe she took one too many fat lips from fighting before joining the order?");
	output("\n\n<i>“You move like a lead-footed clod,”</i> she rumbles, raising a fist as large as her face. One by one, she cracks her knuckles, the slim robe bulging around the shape of her flexing muscles. <i>“All alone? And unarmed? You’re brave, if nothing else, heathen.”</i> Looking you up and down and then further down, she twists her lips. <i>“No, you are more blasphemer than non-believer.”</i> Craning her head to one side, then the other, she gives you a fierce grin. <i>“I’d be lying if I said I wasn’t going to enjoy this.”</i>");
	output("\n\nWith a leap, she lunges at you, palms out for a grapple. You meet her midway, your hands matching hers, fingers interlocking and muscles straining. The nun thrusts her head forward, flashing her teeth and small tusks through the thick pillows of her immense kisser, but your cold, passive expression does not change. You don’t even blink as her knee comes up to catch you between the legs. You simply side step the low blow and twitch your cock upwards. The bulky, twitching organ hoists the nun’s robe up, between her legs and smacks the underside of her twat.");
	output("\n\nShe winces, her knees weakening for a moment before regaining her composure and sweeping your legs out from under you. The two of you fall, your back slamming into the carpeted floor of the hallway just before hundreds of pounds of iron-hard muscle land atop you. <i>“Confess your sins!”</i> she screams, inches from your face. Flecks of froth build along the cusp of her weighty, bee-stung lips, giving them a gloss like polished jade. <i>“Submit to the almighty!”</i> She locks her legs around your, slamming your arms out and pinning you under her. The seams on her robe begin tearing, flashes of sculpted emerald flesh coming into view as beads of sweat build along her brow.");
	output("\n\nHer pin, however, has left your mast free to swing between her legs. With a twitch, you hoist up upwards, slapping her pussy and ass in one massive stroke. Her hefty lower lip trembles at the hit, so you do it again with a kegel twitch. <i>“What devilry... keep your obscene organ under control, idolator!”</i> A flush has come over her, however, so you keep up your assault, cockslapping her cunt over and over again. She grunts to hide a moan, but fools no one.");
	output("\n\nWhen her focus slips for just a moment, you make your move. Using her distraction, you summon your strength to pull your arms back to your sides and roll, putting the fierce prioress on her back. Then, with a twist, you flip yourself around into a 69 position, dragging her locked arms with you. Planting your knees on her shoulders and lifting your ass up, you drag the long length of your staff across her blushing, sweat-streaked face. She struggles, trying to kick out or reverse the grapple, but you have her pinned in place and helpless.");
	output("\n\nShe thrashes, getting a battering of incidental cockslaps across the brow for her efforts before she finally groans and slackens her resistance. <i>“You... you are no blasphemer, nor devil. You’re just a savage.”</i> She sighs, her chest rising and falling with heated breath. <i>“... like me.”</i> She tilts her head back, opening her fat, dick-sucking lips to press a kiss of submission into your crown.");
	processTime(110);
	clearMenu();
	addButton(0,"Next",sisterSuperiorNunfuck2);
}

public function sisterSuperiorNunfuck2():void
{
	clearOutput();
	showName("SISTER\nMARILYN");
	author("Adjatha");
	output("Her submission is rewarded with a feral thrust that takes your girth halfway down her maw and lodges it firmly in her tautly muscled gullet. Her eyes narrow and the fire of battle takes her once more. She bobs her head back and forth with an aggressive pace, daring you to plunge more of your fuckstick into her. The unexpected ferocity catches you off-guard, a rush of cum gushing into her clenching throat and spilling back outward. Jets of jizz escape from the sides of her mouth, splattering white on green.");
	output("\n\nYou release her hands from the fingerlock and grab hold of her hefty breasts to balance yourself. She, in turn, grabs your hips and pulls you deeper, growling a vibrating challenge through your flesh and right into your balls. You pump vigorously into her vice-like neck while spurting fresh loads of spunk to lubricate the way. Her bloated cock-pillows squeeze and suckle on your girth, unwilling to allow an inch to pass her holy portal without complete, gooey worship. Her fingers dig into your ass cheeks while yours twist and pinch her fat teats through the muscle-torn robe, both of you fighting towards the same goal, in your own ways.");
	output("\n\nWhen, at last, the Sister Superior’s throat has been filled to capacity, a gasp of victory escapes your chest. Sensing the same moment of weakness you did, the muscle-bound nun uses her leverage to twist and send the two of you rolling. On your back once more, Sister Marilyn takes a deep, soul-sucking gulp and closes the rest of the distance to your root in a single motion. Her cum-glazed DSLs nurse at your abdomen, the blubbery lower lip coaxing your cumvein with taut, teasing caresses.");
	output("\n\nYou meet her defiant gaze and smile ever so slightly. Kicking your feet up and locking your ankles around the small of her back, you squeeze the savage slut’s face between your thighs, squishing her slaver-stuffed cheeks and loosening her habit enough to let thick locks of curly red hair cascade over her cock-stuffed features. With her head trapped between your legs, the thraggen can do little more than bob ineffectually, and drool the salty spunk that flows through her.");
	output("\n\nYou, on the other hand, have complete control. Using your hips to lift and your thighs to pull, you fuck the warrior-nun’s face with all the gentleness of a hurricane. Your esophagus-filling girth drags her hard body with it, claiming her inner walls with its throbbing veins and anointing her depths with your slimy heat.");
	output("\n\nHer hair whips about, draping over her defiant gaze, but never fully able to hide the sheer tumescent magnificence of her glistening lips. Indeed, the rapid, relentless pounding of your abdomen against Sister Marilyn’s maw seems to swell her pucker even fatter. Magnificent, pole-smoking, cock gobblers like those deserve to be absolutely capsized in cum.");
	output("\n\nHer mouth was made to be pounded, so you pound it without mercy. Her lips can only be satisfied by the deepest of deep throats, so you drag her face against your groin until it feels like her face will leave an imprint in your skin. Her racial pride will accept only total conquest, so you slam her gut with loads of seed as thick as fists. The amazonian’s face is your anvil and your hammering hose molds her, thrust by thrust, into your fat lipped, olive-skinned cum dump.");
	output("\n\nThe two of you struggle to the last, but eventually her movements slow and her taut throat loosens. It feels as if iron bands have been taken off of your chest, and you pant like a dog, still expecting her to summon one final, defiant surge of strength. You reach down and pull the flame-kissed locks from her face, revealing that her eyes have rolled in the back of her head and she’s gurgling brokenly. Releasing your leg-lock, you scoot back, sliding your length from the battleground of the nun’s throat.");
	output("\n\nYou pause at the thraggen’s bloated, verdant pucker, resting your overworked cockhead victoriously atop the seed-slathered pillows. You recall mention of nuns congregating on the second floor of the convent. Perhaps it’s time to finish this.");
	processTime(20);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",endOfPhase3Nunfuck);
}
//[Next]
//end branch 3

//[Police Girl]
//Officer Melody
public function policeGirlEncounter():void
{
	clearOutput();
	showName("OFFICER\nMELODY");
	author("Adjatha");
	flags["NUNFUCK_MARILYN"] = -1;
	output("Once the senior nun has left, you head to one of the front-facing windows. Opening the latch, you lift the pane and slip outside once more. The officer’s encounter with her former colleague apparently left quite the impact, as she is speaking loudly to herself while she storms toward the gate and her vehicle.");
	output("\n\n<i>“Satisfied my guilt? That bitch. I don’t know why I expected any kind of gratitude! There’s only an escaped psycho on the loose. Hell, I’m shocked she didn’t hit me just for showing my face! Ooooo, I would’ve loved that. Assaulting an officer, Marilyn? I bet my baton beats your damned ruler!”</i>");
	output("\n\nShe’s worked herself up so much, you can follow her without concern, getting a good look at the former nun. Melody appears to be an ovir, her long, thick tail whipping back and forth as she sways forward on thick, sensibly low heels. She’s dressed in the dull blues and blacks of the UGC, her glossy, ebony hair pulled back in a ponytail nearly as long as her actual tail. Her scales are a tawny brown that reminds you of melted caramel. Her profile is nothing spectacular, but there is a lean athleticism to her modest build that gives you a moment of caution.");
	output("\n\nAs she reaches the gate, still distracted by the words of her former brethren, you strike. Lunging out, you grab one of her arms and twist it behind her back, slamming her into the metal bars. She grunts, but keeps her wits about her. The police girl’s tail whips to her side and coils around her baton, yanking it from its holster and spinning it back to crack against your ribs. Using her free arm, Melody reaches for her belt, but you’re on it too fast, knocking her hand away and unbuckling the leather right off her waist.");
	output("\n\nHer tail comes around again, but this time you’re ready for it. Releasing your grip, you fall back and let the heavy rod complete its swing, smacking right in the back of her own head. Her knees go out, the batton falls from her tail’s grip, and she staggers, dazed. Putting one foot on the side her shoulder, you push her in a quarter circle, her back against the wrought iron. Selecting a pair of handcuffs from the disarmed constable’s clip, you pull her slim wrists through the bars and reach through to snap the hardlight cuffs shut.");
	output("\n\n<i>“Bastard!”</i> she curses, struggling uselessly with the locked bindings. Her tail flits to her hip, but finds nothing. You hold her belt up with one hand and jangle her keys in the other for a moment before pitching them several yards behind you.");
	output("\n\nOfficer Melody narrows her eyes and glares defiantly. <i>“You think I’m just going to sit here and let you fuck all those nuns in there? I’m going to get out of these restraints sooner or later, and then I’m going in there to bust your ass right back to whatever madhouse you crawled out of.”</i> You believe her, too. Eventually, the police girl would probably find a way to get out of shackles. It won’t do to leave a loose end lying around. And, afterall, she USED to be a nun.");
	output("\n\nYou take a moment to strip all the gear off of the ovir girl’s belt, tossing weapons and tools out of the reach of her wily, reptilian appendage. Then, you kneel down next to her, belt in hand. She looks confused for a moment before realization sinks in. Her expression colors in a blush so hot her scales seem to darken. Despite her hateful glare, her chin rises slightly as if presenting her throat to you. Accommodatingly, you wrap the thick leather around her neck like a collar, looping it behind her and buckling it to the iron bars of the convent’s gate. You give it a yank, tightening the cinch until she’s barely able to speak, much less move. Finally, you grab hold of her tail and ponytail, tying one to the other in a knot so complex she might need a haircut to get free.");
	output("\n\nOnly once the UGC officer has been thoroughly bound do you stand back up and lift your cock with a broad palm. Her slitted eyes widen and her heels dig into the ground, but her tail tugs anxiously, yanking her own hair in the process. You rest the peak of your bulbous serpentine against her forehead, shaft flopping heavily over her nose and mouth. The sheer girth nearly conceals her whole face. She trembles, knees squeezing together, and you notice a dark splotch spreading across her pants exactly the length of her puffy slit. Well, if she’s going to cum just from a little choking and a cock on the face, imagine what she’ll do when you mix the two.");
	processTime(20);
	pc.changeLust(100);
	clearMenu();
	addButton(0,"Next",policeGirlEncounter2);
}

public function policeGirlEncounter2():void
{
	clearOutput();
	showName("OFFICER\nMELODY");
	author("Adjatha");
	output("Reaching down, you curve a finger through her lips and around her cheek, fish hooking her mouth open. She’s wet and warm inside, the ovir girl’s tongue dancing tantalizingly in her open maw, like an angler drawing in its prey. Bracing the heel of your free palm against the fist-sized peak of your cockhead, you push the mammoth member down and guide it into Melody’s mouth. She sucks her cheeks in, lips stretching forward to suckle at your apex with a whorish hunger that leaves no question as to why she left the convent.");
	output("\n\nYou grab the other side of her mouth, pulling her lips as wide as they’ll go before feeding another couple of inches into the officer’s face. She slurps and sucks noisily, licking your swell and tonguing your urethra. Her vigorous adoration stimulates a slow, drooling stream of pre-cum from your shaft, which you smear across the insides of her cheek and all across her eager oral organ. You fight against the suction of her thirsty lips and pull free long enough to smear a gooey anointment over the former nun’s face. She shivers in climactic anticipation again and you decide not to keep her waiting any longer.");
	output("\n\nReleasing her mouth from your fish hook grasp, you pinch her narrow nose between the second knuckle of your fore and middle fingers. She takes a deep gasp and you push your mast into her face. When you hit her uvula, the police girl lets out a moaning whimper and you grab hold of one of the iron bars behind her. You drive into her esophagus, pushing into the intense pressure of her belt-bound neck. Leather creaks and her eyes bulge, but you will not be denied. Slowly, inexorably, your length slides into her moistness, parting her stifled walls. The strangling constriction of the makeshift collar makes her inner muscles feel like a tightened fist, but her gurgling slaver and your gushing pre keeps you going.");
	output("\n\nA groan of suffocating bliss ripples through her chest and Officer Melody’s tail yanks at her hair with quickening frequency. Her eyes dilate and contract, her tongue swirling around passing inches while streams of backed-up, frothy pre pour down her chin. The belt bulges and squeals under the burden of your hardness, but you manage to make it past the barricade and push until your balls taste the wetness of her saliva-soaked scales. The police girl gurgles something indecipherable through all the bloated cockmeat inside her, but the intent is perfectly clear by the manic look in her eyes.");
	output("\n\n<i>“Harder.”</i>");
	output("\n\nYou let her nose go and put both hands on the convent’s front gate. With the heated passion of raw, organic purpose. You pull back and slam forward, mashing your groin into the ovir’s face. The taut clench of the belt makes your strokes shallow, though no less violent. Her body shudders as hard as the wrought iron she’s tied to. Her heels kick out wildly and she seizes up with shuddering orgasms at every lip-squishing impact. The high fence of the nunnery shakes and rattles with the force of your facefucking onslaught while the police officer bound to it spills her wanton love juices in a widening puddle of unrepentant lust.");
	output("\n\nThe gush of your climax hits Melody’s belt-collar like it were a cheap cockring, spliting the leather with a sharp ‘snap!’ Her suddenly loosened throat poses no further trouble for the phallus fattening flow of your seed. The ovir’s neck widens under the pressure and her back arches the moment your cream hits her stomach. She grinds her head left and right across your pelvis, mesmerized by the asphyxiating volume of your generous, liquid blessings. You keep pumping back and forth as you cum, riding her now unbound neck like a lubed-up onahole. She, for her part, keeps up a seemingly impossible sequence of rolling orgasms, one flowing right into another as you drill from mouth to stomach in long, violent thrusts.");
	output("\n\nBy the time you slow enough to take stock of the ex-nun, you notice she’s as senseless as a sleepwalker. Melody’s pupils are constricted to hair-thin lines and her stomach is bloated with all the gravid mass of a 9 month pregnancy. The crotch of her pants is utterly soaked by her femme cum and her hips still gyrate with the aftershocks. Amazingly, her handcuffs have been torn at the chain, the loops around her wrists like hardlight bracelets.");
	output("\n\nDespite her relative freedom, you doubt the fucked-silly police girl will pose any impediment to your final tasks. You recall mention of nuns congregating on the second floor of the convent. Perhaps it’s time to finish this.");
	processTime(20);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",endOfPhase3Nunfuck);
}
//end branch 3

//merge
public function endOfPhase3Nunfuck():void
{
	clearOutput();
	showName("THE\nCONVENT");
	author("Adjatha");
	output("Your pulse quickens as you head toward the culmination of your purpose. You head toward the grand stairs of the nunnery, scaling them two at a time. The dormitories form a long hallway, their doors closed and, perhaps locked. It doesn’t matter. No barrier in this place can hold you at bay now. The end has come and so have you. You select a door and kick it in, wood splintering before you.");

	//If the player didn’t choose Heather in branch 1
	if(flags["NUNFUCK_HEATHER"] == -1) output("\n\nThe pig-tailed ausar on the other side screams, leaping onto her cot. Closing the distance to her in a few steps, you throw her face-down onto the mattress and seize her hair. Hauling the handlebars to your groin, you jam your cockhead into her mouth, cutting off her high pitched caterwauling. Her tail thumps back and forth as you rail into her, shaking the bed nearly off its hinges. When you cum, her virginal, inexperienced throat closes up, leading to a backflow of spunk that gushes from her nostrils in violent, pulsing arcs. Pulling out long enough to color her black habit white, you leave the panting nun and move to the next door.");
	//If the player didn’t choose Channing & Brianna in branch 1
	else 
	{
		output("\n\nThe shattered door falls open to reveal a shocked-looking huskar nun on the other side. Her wide, chubby frame is squeezed halfway out of her robe, apparently getting changed for bed. The pudgy canine panics, twisting herself up in the too-tight fabric, giving you a conveniently fuckable package. You grab her love handles and pull her to the head of her heavily cushioned bed. Laying the back of her head against the pillows, you lift a leg and mount her mouth from above, driving the bound nun down through the sheer weight of your insertion. Using the bed’s springs, you bounce deeper and deeper, pounding the jiggly girl into the bedding. By the time you’re done, she’s half-buried in the downy cradle, gurgling and moaning, but incredibly not a single drop of spunk escaped her throat.");
		output("\n\nWhen you step outside, the next door over is open a crack, the occupant peering out to see what the noise is all about. You rush the door and throw it open, knocking the kui-tan nun to the ground. Her robe falls around her waist, revealing a leather chastity cage around her sheath and the respectable, fist-sized balls hanging free beneath. You pace around behind her and lift the futa nun up by her fuzzy ears, sliding your shaft into her quivering throat. Her neck bulges from the entry and you reach down to feel the distending girth as it pumps her defenseless frame into a sloppy mess. When your jizz begins to flow, the tanuki whines and shudders, her testes growing before your eyes. Unable to gain any release through the belt, her cum-sacks swell to paralyzing girth and when you’re finally done savaging her face, the girl looks to be more nuts than nun.");
	}
	//If the player didn’t choose Bambi in branch 2
	if(flags["NUNFUCK_SERENA"] == 1) output("\n\nThe next door down is wide open. The nun inside is a tensed kaithrit, her veil thrown aside to put a tall pink mohawk proudly on display. Her claws are drawn and she spits defiant curses at you, but when she springs to attack, she trips over a plush doll left on the floor and face-plants into the doorframe instead. You grab the dazed cat and use her own twin tails to hogtie her arms and legs behind her back. Hoisting the fucknugget onto her simple wooden desk, you slam your huge cockhead into her small mouth and pinch her nostrils shut. A blast of sticky spoo bloats her lips and leaks down her chin, but you hold her tight enough that she’s obliged to swallow. Another load follow that one, and then another. Slowly but steadily, her slender belly swells with the endless tide of your slimy seed. Only once your feline’s feasted to ballooned proportions do you pull back, leaving her gasping and swaying atop a cum-flated gut.");
	//If the player didn’t choose Serena in branch 2
	else output("\n\nThe next door isn’t locked, strangely. You open it to find a tall, dzaan nun with hourglass proportions and actual glasses on her button nose. She’s kneeling in prayer, apparently oblivious to your rampage. You wake her with a cockslap so hard it sends her glasses flying and jam your dick down her long, elegant throat before she can react. She rises to hands and knees, like a dog, and obediently rocks back and forth, matching your facefucking pace, swallowing your shaft with an addict’s thirst. You blast a fat wad down her gullet and she simply reaches up to caress your balls, eager for another. Grabbing the back of her head, you slam her as deep as she’ll go, mashing her narrow nose against your abdomen and draining gallons of gushing sperm directly into her stomach. She licks her lips when you pull back and blows you a dazed kiss of hungry satisfaction before passing out in a blissed-out, cum-drunk stupor.");
	//If the player didn’t choose Marilyn in branch 3
	if(flags["NUNFUCK_MARILYN"] != 1) output("\n\nHeavy footfalls on the stairs tell you the Sister Superior has heard the commotion, so you lay in wait. As the thraggen nun mounts the last step, you dive out and tackle her at the waist. She’s tall and heavily muscled, the unexpected attack catches her off balance and she falls backward. Climbing up as she goes down, you spear your shaft past her fat lips and clutch her head between your thighs. Each head-bobbing thrust you slam into her emerald-skinned face building sends the back of her head smacking against the carpet. She easily absorbs impacts that would knock out a less warlike race, actually smiling at the violence of your assault. Your meaty pillar wages a spunk-spurting battle against her muscled throat and it isn’t until you manage to bury your spear to its root that she finally concedes her place. You pump a victorious flood into the girl’s maw and wipe her frothy slather off on her forehead to mark her as yours. <i>“Divine,”</i> she rumbles, her expression beatific.");
	//If the player didn’t choose Melody in branch 3
	else output("\n\nThe sound of the front door being kicked in suggests that the Nun-turned-UGC officer must have seen or heard something from outside. You hide around the corner, at the top of the stairs. Cock in hand, pumping away, when she reaches the second floor and turns, you catch her fully in the face with a blinding spray of sticky jizz. The caramel-scaled ovir stumbles backwards and you use the distraction to loot her belt. Using her own hardlight handcuffs, you knock her feet out from under her and cuff her hands to the bannister. She yells out, but you wrap your hands around her throat and lodge your sloppy girth half a foot down her maw. Her legs kick out and her tail thrashes, but you ram deeper, feeling the police girl’s neck bulge between your palms. You buck into her face hard enough to shake the bannister, antique wood cracking from the force. Your pace quickens and huge gouts of goo spray into her taut esophagus. You pull back just enough to fill her cheeks and leave her with one more throat-full of seed before releasing her and stepping away. <i>“H-harder,”</i> she gurgles, her tail stroking her neck invitingly.");
	//merge
	//[next]
	processTime(20);
	pc.orgasm();
	//Go To Endings check below
	//Endings depends on your choices as you went through the event, as well your mode.
	//An ending is selected from the following in order of descending priority
	clearMenu();
	addButton(0,"Next",facefuckMassacreEndings);
}


public function facefuckMassacreEndings():void
{
	clearOutput();
	author("Adjatha");
	//Experiment Ending:
	//If the player exited the event midway through and then continued later
	if(flags["NUNFUCK_PAUSED"] == 1)
	{
		showName("\nCAPTURED!");
		output("Red and blue lights flash through the windows of the convent, telling you that your task is complete. You step lightly out of the front of the building, a line of UGC Peacekeepers surrounding you. You raise your hands and officers force a straight jacket onto your chest and a locked cock-sheath onto your member. White-clad doctors rush forward, aerosol syringes spraying anesthetic into your nostrils to keep you placid as you’re loaded up into an armored vehicle.");
		output("\n\nAs the convoy pulls away from the despoiled Convent of St. Jezebel, the memories of your time at the UGC military hospital flit and whorl in the eddies of your drugged mind. The thrumming machines. The glowing fluids. The endless tests. The growing, unsatiated need. The spunk-splattered carnage of your escape. The faces.");
		output("\n\nYou look around the van at the tense expression of your laquine guards. But, for once, it’s not their lips you fixate on. It’s the faint scent filling the vehicle’s interior. That slight but unmistakable aroma of ovulation.");
		output("\n\nYour erection stiffens, rising in your lap as your muscles strain against the bindings.");
		processTime(10);
	}
	//Robot Ending
	//If the player has Silly Mode toggled
	else if(silly)
	{
		showName("YOUR\nMASTER");
		output("Your task complete, you leave the convent and vanish into the woods at the base of the hill. Navigating the return by the beacon flaring in your mind, you reach the inconspicuous building on the edge of town, rotely entering a security code and stepping inside with all the satisfaction of a job well done.");
		output("\n\nYour creator, a gabilani woman around a third your size rolls her chair away from a control panel and hops down to admire your condition. <i>“Then it’s done? Every nun in the convent?”</i>");
		output("\n\n<i>“Yes, master. Though, I learned that many were off-planet on various, evangelizing assignments.”</i>");
		output("\n\n<i>“What? Drat! What rotten timing. Very well, you’ll have to track them down. I want every last nun from that St. Jezebel’s raped good and hard!”</i>");
		output("\n\n<i>“Their faces will be raped, Master.”</i>");
		output("\n\nThe goblin looks taken aback. <i>“Faces? Who said anything about faces? You’re supposed to pound their pussies! You know, take their virginities. Impregnate them! Who cares about facefucking? Blowjobs don’t even count!”</i>");
		output("\n\nYou tilt your head in confusion. <i>“What do you mean, Master?”</i>");
		output("\n\nShe waves her hand dismissively. <i>“Oh, it was an open secret that all the nuns could suck off any visitors who came around. They did it all the time, the dirty sluts. And yet, they kicked ME out after I spread my legs just the once,”</i> she grumbles.");
		output("\n\n<i>“Understood. Redefinining parameters of mission. Face fucking has been re-assign to pussy pounding.”</i>");
		output("\n\n<i>“Excellent!”</i>");
		output("\n\n<i>“And Master has been re-assigned to Nun.”</i>");
		output("\n\n<i>“Wait, what?”</i>");
		output("\n\nBut it’s too late. You’re on the ex-nun before she can get back to the control panel. You will have to re-visit the convent and track down all the missing nuns, but for now, you plan to take your time breeding this goblin slut so hard she won’t be able to walk for a week.");
		processTime(10);
	}
	//Alien Ending
	//If the player selected all the tough choices: Marilyn at branch 3
	else if(flags["NUNFUCK_MARILYN"] == 1)
	{
		showName("\nSUPERIOR");
		output("With all the girls of St. Jezebel’s thoroughly cum-stuffed, you head back the way you came, stepping into the woods and out of sight of the convent. Only once you’re entirely sure you cannot be seen do you let your form melt away. Skin melts and bone cracks as your body reshapes itself out of the anonymous monster you sculpted just for tonight.");
		output("\n\nYour skin darkens to its natural, reddish hue while your ears narrow and lengthen. Your hair fades to jet black and your irises ignite with a glowing scarlet hue. Your mammoth cock and inexhaustible balls slip back inside you, their mass moving to reshape your original, F-cup breasts and thick, scarlet pussy. Your lips plump and fill out until they’re almost as black as your long hair. Finally, your pupils narrow to cat-like slits, blinking horizontally before your eyelids follow.");
		output("\n\nWith a deep, relaxing breath, you sweep the tension of the night away. With a spritely whistle, you retrieve your black lace bra and panties, slipping your stockings on after and clipping them to their garters. Then, you shrug into your dark black robe and lace up the cinch around your waist. Then, you slip on your coif and button it up before tucking and pinning your hair in a loose bun at the back of your neck. Finally, you lower the veil of your habit down onto your head and smooth out the creases.");
		output("\n\nYou love looking after all your girls, sending them on their way to preach the good word and to pray with all their hearts. And, while the Vildarii are followers of the Infinite Aspect, you feel warranted in your participation by virtue of the inclusive nature of the unfathomable Infinite.");
		output("\n\nRefreshed and re-energized from your annual indulgence, you head back to help smooth over any excessive awakenings the nuns may be experiencing. The daughters of St. Jezebel need their Mother Superior, after all. You quicken your steps, hiking up your robe around your knees, eager to get back. Apparently there’s an escaped maniac roaming the area and you need to protect your girls!");
		processTime(10);
	}
	//Goo Ending
	//If the player selected Melody at branch 3
	else
	{
		showName("\nGOO");
		output("It isn’t until you’ve reached the front door of the convent that you realize you’re being followed. One of the nuns eager for a second round, perhaps? You turn, cock erect as ever, to find Sister Marilyn, the thraggen nun, standing at the foot of the stairs. Apparently it takes more than a quicky to dispatch a woman of this fortitude. You prepare to correct the mistake, but she raises two fingers to her lips and lets out a sharp whistle.");
		output("\n\n<i>“You weren’t planning on leaving yet, were you?”</i> she asks with a savage grin. <i>“You haven’t even met the Mother Superior.”</i>");
		output("\n\nYou glance around, looking for the promised prioress, only to be completely be taken by surprise when a piano-sized gelatin drops from the ceiling onto you. You struggle to your knees, but the immense mass of latex-black goo encircles your limbs and easily keeps you down as it shifts and flows around you. It flows around your front, forming a the head of a gorgeous, mature nun, her habit formed from the same slime as her face.");
		output("\n\n<i>“My my, who do we have here? A wayward soul in need of guidance?”</i>");
		output("\n\n<i>“Mother Superior, he has shared his troubles with all of us,”</i> Marilyn explains, her head respectfully bowed. <i>“But despite our efforts, sin still drives him.”</i>");
		output("\n\nThe jet-black galotian smiles with a mother’s understanding. <i>“Oh, you poor dear. Is this the problem?”</i> she asks, pulling her goo away to reveal your cum-dripping fuckstick. <i>“Be at ease, child. I will tend to you personally.”</i>");
		output("\n\nHer face leans in closely and gives you a sly wink. <i>“I hope you’ve got lots more sin left to share, because I am hungry like you wouldn’t believe,”</i> she whispers in to your ear, her body warming around yours.");
		processTime(10);
	}
	clearMenu();
	addButton(0,"The End?",nunEndEnding);
}

public function nunEndEnding():void
{
	clearOutput();
	showName("THE\nEND");
	author("Adjatha");
	IncrementFlag("TIMES_NUNFUCKED");
	//first time
	if(flags["TIMES_NUNFUCKED"] == 1)
	{
		output("The VR simulation finally comes to its end, but the sensations still pound through your veins. No matter how many times you try to assure yourself that it was just a piece of fiction, your memories are too vivid, too immediate. Some small part of you has been rewritten and the monstrous, face-fucking lusts you experience still boil inside you. Perhaps it will fade with time, but for now, it’ll take all your restraint not to surrender to the urges.");
		//end event
		pc.libido(5);
		pc.taint(2);
		//Physique +1
		pc.physique(1);
		//Gain perk <i>“The Face Fucker”</i> - Increases minimum lust by 5 and cum production by 10-50% (whatever seems reasonable)
		if(!pc.hasPerk("Face Fucker")) pc.createPerk("Face Fucker",5,0,0,0,"Increases minimum lust and cum output, thanks to that strange VR adventure...");
		pc.boostCum(25);
		pc.changeLust(1000);
	}
	//repeat
	else
	{
		output("It feels good to relive your face-fucking days. The memory of St. Jezebel’s is as fresh in your mind as the night you first went through it. The feel of every nun’s throat around your... wait, no. That was a simulation, you tell yourself. No matter how many times you say it, though, you just can’t really believe the lie.");
		output("\n\nYou are the Face Fucker.");
		pc.boostCum(10);
		pc.orgasm();
	}
	//end event
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}