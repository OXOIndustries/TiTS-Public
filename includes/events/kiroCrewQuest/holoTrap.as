//Holodeck & Surgery Suite
//Wsan + revisions by Fenfen!

/* FLAG LIST:

flags["KQ_VR_COMPLETE"]
	1 = complete.
flags["KQ_VR_CHEST"]
	1 = opened box, can proceed.
flags["KQ_GOBLIN_DED"]
	1 = ded.
	-1 = fukt. (5 libido on the spot)
flags["KQ_VR_LLAERWYN"]
	1 = "Let Her Cum". Long tongue. +libido, +taint. Make squirty.
	2 = "Fuck Her". Grow 16" dick+balls, plenty o cum, +libido+taint.
	-1 = "Leave"
flags["KQ_VR_LUVIA"]
	2 = very much liked her. Grow boobs + Lactate + Fem + taint/lib ofc
	1 = "yes", (No bad effects if hascock or got from llaerwyn), (elseif puss: squirter+analcap), (else: grow vag, +squirt, +analcap)
	0 = "no", snakebyte injectimals.
	-1 = Leave
flags["KQ_VR_LUVIA_PUSS"]
	1 = exclusively using for tracking dat pussgrowth.
flags["KQ_VR_HYLIE"] 
	1 = fighty end
	2 = smutty end. //NO TF OR SCOREBOARD STUFF FOR HER?

flags["KQ_VR_DEMONNAME"]
	1 = know name
flags["KQ_VR_DEMONPAST"]
	1 = know past (unlock "Almost")
flags["KQ_VR_DEMONALMOST"]
	1 = unlocks Fight! and Predecessors talks.
flags["KQ_VR_DEMONSERVING"]
	1 = unlocks Sex options.
flags["KQ_VR_DEMONPREDEC"]
	1 = unlocks Characters? talk
flags["KQ_VR_DEMONCHARACT"]
	1 = unlocks "Time" talk.
flags["KQ_VR_DEMONTIME"]
	1 = unlocks Escape and StayForever
flags["KQ_VR_DEMONFIGHT"]
	-1 = left by request,
	+1 = tried to fight and got spankt.
flags["KQ_VR_DEMONFUKK"]
	Counter for sex actions done.

*/
public function holoTrapIntro():void
{
	clearOutput();
	author("Wsan + some Fen");
	if(flags["KQ_VR_COMPLETE"] != 1)
	{
		output("This is the most high-tech setup you’ve seen outside of the facilities at SteeleTech, if not even more advanced. In the centre of the room a levitating bench hovers silently, lit from all sides. The sheen of silver is everywhere, reflecting the glowing lights from the consoles lining the walls.");
		output("\n\nNone of them appear to have any input capability but as you approach the bench in the middle of the room, it seems to detect you and automatically adjust to your height, slowly turning towards you as if to request your presence aboard it. Words appear in the very air before you, hanging there before dissipating.");
		output("\n\n<i>“A VR adventure for everyone. Try a second life out today and bring some of it back with you!”</i>");
		output("\n\nWhoever created this must be a genuine prodigy.");
		// As you glance to the sides, you notice two other items; one is a much less advanced article, a sort of stockade labelled ‘Buttslutinator Mark II’. The other is some kind of tank full of writhing tentacles with no immediately apparent use.
		//output("\n\n[VR adventure] [Buttslutinator] [Tentacle Tank]");
		output("\n\n<b>The door to the north is sealed closed.</b> A nearby holopanel displays, <i>“User has not experienced Aulandia. Please complete your introduction to VR indoctrination via this device before proceeding to Dr. Po’s quarters. Participation is mandatory.”</i>");
		setNavDisabled(NAV_NORTH_DISABLE);
		addButton(0,"VR Adventure",startTheVRAdventure,undefined,"VR Adventure","See what this VR adventure is really about.");
	}
	else
	{
		author("Fenoxo");
		output("Having finished the strange adventure, the advanced surgery and virtual reality systems embedded in the walls and floor hold no further interest to you. A doorway to the north offers passage into Doctor Po’s quarters while the way west leads back to her waiting room.");
		output("\n\nThe holopanel next to the northern doorway has turned green, and now displays a message in luminous white, <i>“Aulandian Adventure completed! User is now granted access to proceed and complete [pc.hisHer] programming.”</i>");
		flags["NAV_DISABLED"] = undefined;
	}
	
}

//[VR adventure]
//tooltip:See what this VR adventure is really about.
public function startTheVRAdventure():void
{
	clearOutput();
	author("Wsan");
	showName("\nVR");

	output("Stepping closer, you note the bench");
	if(pc.tallness > 7*12) output(" stretches and expands as it gets a better idea of your form");
	else if(pc.tallness > 5*12) output(" makes minor adjustments to better suit your body");
	else output(" shrinks and condenses itself inwards to better suit your form");
	output(", like your favorite chair that molds itself to you over time if that process was done with in two seconds. More text appears in the air at your approach, flickering before your eyes.");
	output("\n\n<i>“Lie down to begin!”</i>");
	processTime(2);
	clearMenu();
	addButton(0,"Lie Back",startTheVRAdventureFORREAL,undefined,"Lie Back","Lie atop the bench - it looks pretty inviting.");
	addButton(4,"Back",mainGameMenu);
}

//[Lie down]
//tooltip:Lie atop the bench - it looks pretty inviting.
public function startTheVRAdventureFORREAL():void
{
	clearOutput();
	author("Wsan");
	showName("\nVR");

	output("You figure you might as well take off your [pc.gear] for this; it’s not like there’s anyone likely to find you. Tossing it to the side, you lie down on the bench and - to your utter amazement - the next second, you find yourself sitting up in a completely different world.");
	output("\n\n<i>“What,”</i> you breathe, clapping your hands to your body and feeling the impact. <i>“This is... real?”</i>");
	output("\n\nYou’re sitting in the middle of a grassy mound surrounded by a little moat of water. Beyond the moat lies the lush greenery of a forest, idyllic and peaceful as far as the eye can see. Standing, you inspect yourself. You’re still <i>you</i>, so that’s good. You’re also still naked, and that’s bad. Glancing around, you suddenly stop and stare at that same text forming in the air in front of you.");
	output("\n\n<i>“Welcome to the world of Aulandia, a hand-crafted experience for you, the player. Challenges and rewards lie ahead, if you so dare - you may exit via Safe Zones, areas like the mound you’re standing on right now. Note the glowing green aura surrounding you.”</i>");
	output("\n\nNow that you’re looking, the text is right. Turning your hand over experimentally, a faint green line of magic encompasses it with a gentle warmth. It feels like home.");
	output("\n\n<i>“Ahead you will find a chest of basic goods,”</i> the text continues. <i>“Utilize them as best you can to continue your adventure.”</i>");
	output("\n\nThe text stops there. That seems to be your prompt to move forward.");
	//Puts you on a new navigation map. South-most tile is where PC is standing. There are 4 tiles north then an intersection, from which 5 tiles lead east/north/west. See <i>“diagram”</i>.
	processTime(5);
	currentLocation = "KQVR S5";
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Rudimentary design lol
//Green = PC start
//Orange = sector miniboss
//Red = sector boss
//West branch = mountains/caves
//East branch = desert
//North branch = ruined city
//South branch = forest
//Consider the middle tile to be M0 and each path radiating out from it to be numbered X1-5 where X is the first letter of their cardinal direction. So the PC’s starting tile is S5 and the southern tile closest to M0 is S1.

public function KQVR_S5Bonus():Boolean
{
	addButton(0, "Exit", outOfThatVRNightmare);
	return false;
}

//Note the PC does not actually get <i>“officially”</i> TFed until after the game ends.

public function kqVR_S4Bonus():Boolean
{
	output("The edge of the forest starts here, the dense coverage of the tree’s branches blotting out a lot of the sun overhead. Now that you’re standing closer, it doesn’t look all that idyllic. There are rays of light beaming down through the leaves, though, so you wouldn’t be travelling through darkness.");
	if(flags["KQ_VR_CHEST"] == undefined) 
	{
		output("\n\nThere’s an unopened chest here the ‘tutorial’ text told you to open. The game won’t let you progress until you open it. Lame.");
		addButton(0,"Chest",openZeChest,undefined,"Chest","Open the chest.");
		setNavDisabled(NAV_NORTH_DISABLE);
	}
	else 
	{
		output("\n\nThere’s an opened chest that contained your belongings.");
		flags["NAV_DISABLED"] = undefined;
	}
	output("\n\nTo the south lies the Safe Zone, where you can exit.");
	return false;
}

//[Chest]
//tooltip:Open the chest.
public function openZeChest():void
{
	clearOutput();
	showName("\nOPEN");
	author("Wsan");
	output("You open the chest the text told you about. No traps trigger, no transformations happen - you let out the breath you didn’t even realize you were holding and peer inside, your eyes lighting up at what you find. Located within the heavy wooden container is a set of admittedly simple clothing, a sword, and a shield. These should all come in handy.");

	output("\n\nYou equip the items and look down at yourself, sword and shield in hand. No longer naked, you");
	//have breasts:
	if(pc.biggestTitSize() >= 1) output(" have a simple cloth bra cupping your [pc.breasts] to hide them from the unfamiliar world.");
	else output(" have a simple leather strap across your [pc.chest].");
	output(" Below that you have");
	if(pc.isHerm()) output(" a furred loincloth to conceal your [pc.cocks] and [pc.pussies] from plain view. It’s not much in the way of protection, but at least it’s warm and comfortable.");
	else if(pc.hasVagina()) output("have pussy: a pair of simple linen panties covering your [pc.pussies], and you have to admit that though they’re not all the protection you’d like they’re at least extremely comfortable against your [pc.skinFurScales].");
	else if(pc.hasCock()) output(" a furred loincloth covering your [pc.cocks] up. Not quite the protection you were hoping for, but at least it’s warm and comfortable.");
	else output(" an embarrassingly thin G-string. Luckily you have nothing up front to cover anyway, but the strap across your [pc.asshole] does a poor job of concealing you.");
	output("\n\nYou also find some simple boots, just adequate enough to protect your feet. You get the distinct feeling this game isn’t very generous with its loot. Well, better than nothing.");
	flags["KQ_VR_CHEST"] = 1;
	//don’t let the PC into S3 until they’ve opened the chest.
	processTime(8);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function kqVR_S2Bonus():Boolean
{
	output("A small clearing lies ahead of you, not too dissimilar from the one you first found yourself in when you arrive.");
	//Goblin not fought:
	if(flags["KQ_GOBLIN_DED"] == undefined) 
	{
		setNavDisabled(NAV_NORTH_DISABLE);
		output(" There’s an ugly little goblin there! He doesn’t seem to have noticed you at all, facing away and scratching its butt. It’s wearing a shabby loincloth and wielding a splintered spear.");
		addButton(0,"Goblin",goblinButtonInKQVR,undefined,"Goblin","A goblin!");
	}
	else 
	{
		output(" The goblin you encountered is apparently no longer a part of this corporeal realm.");
		flags["NAV_DISABLED"] = undefined;
	}
	return false;
}

public function goblinButtonInKQVR():void
{
	clearOutput();
	showName("A\nGOBLIN!");
	showBust("KQ_VR_GOBLIN");
	author("Wsan");
	output("The goblin turns towards you as you approach, weapon and shield held high. It gazes at you unblinking, then slowly raises its spear and cries out an ugly little scream.");
	processTime(1);
	//[Charge!] [Get fucked]
	clearMenu();
	addButton(0,"Charge!",kqVRGoblinCharging,undefined,"Charge!","Fight!");
	addButton(1,"Get Fucked",letTheGoblinFuckYouKQVR,undefined,"Get Fucked","Now that you’re looking at him...");
}

//[Charge!]
//tooltip:Fight!
public function kqVRGoblinCharging():void
{
	clearOutput();
	showName("\nCHARGE!");
	showBust("KQ_VR_GOBLIN");
	author("Wsan");
	output("It’s over in an instant. You charge and slash downwards with the sword, cleaving both his shitty spear and his skull in twain with a single stroke. You scoff as he falls dead, then jump back as his body begins to smolder. It turns to ash before your very eyes, hissing and smoking until nothing of him remains but dust that scatters to the wind.");
	output("\n\n<i>“Well done,”</i> the floating text says. <i>“You’ve leveled up and stat points have been auto-allocated. Continue onwards for greater adventures, and welcome to Aulandia!”</i>");
	output("\n\nThat was disappointingly easy. Even for a tutorial that was pretty mediocre... maybe these ‘greater adventures’ have something more to offer. Suitably emboldened, you continue onwards.");
	processTime(5);
	flags["KQ_GOBLIN_DED"] = 1;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}	

//[Get fucked]
//tooltip:Now that you’re looking at him...
public function letTheGoblinFuckYouKQVR():void
{
	clearOutput();
	showName("GETTING\nFUCKED");
	author("Wsan");
	showBust("KQ_VR_GOBLIN_TRUE");
	output("You’re distracted for a moment - just a moment - and suddenly you’re sweating with lust, your sword falling from your hand as you");
	if(pc.biggestTitSize() >= 1) output(" hastily unfasten your bra and let your [pc.breasts] free of their artificial constraints, [pc.nipples] already hard.");
	else output(" throw off the leather strap across your torso.");
	output(" Your heart <i>pounds</i> with desire, your mind swirls, and endorphins pump through your body as you fall to your knees knowing only one thing: you want this thing to <b>defile</b> you.");
	output("\n\nFeverish and panting, you ");
	if(pc.isHerm()) output("tug your loincloth off to expose your glistening cunt");
	else if(pc.hasVagina()) output("don’t even bother to remove your panties - just pull them to the side to expose your glistening cunt");
	else if(pc.hasCock()) output("pull your loincloth up to expose your [pc.asshole], tugging your cock" + (pc.hasCocks() ? "s":"") + " out of the way");
	
	else output("don’t even take your underwear off - you don’t need to. It’s made for easy access to your ass, and all the better. You moan in lust");
	output(" as he approaches with an arrogant sneer, his weapon lowered.");

	output("\n\nYour eyes bulge in abject shock as he pulls his rugged loincloth to the side - where the fuck was he hiding <i>that</i> thing?! The dishevelled creature itself is probably four feet tall and ugly as sin, yet between his legs is the thickest, veiniest, most beautiful cock you’ve ever seen in your life. Your mouth begins watering the moment you lay eyes on it.");
	output("\n\nYou don’t even have time to regret offering him your " + (pc.hasVagina() ? "vagina":"ass") + " instead of your lips. Grabbing your [pc.thighs] he forces them backwards, aligning his monstrous cock and shoving himself as deep as he can get with a forceful grunt. You scream out loud at the violent penetration, just a whore on [pc.hisHer] back in the middle of clearing being raped by a goblin and loving every second of it. Impossibly strong pleasure radiates outwards from every inch of your insides he touches with his throbbing prick, driving you to clench down on him and pull him deeper in the hopes he might impale you on the entire thing.");
	output("\n\nIt doesn’t seem like he cares about your hopes at all but luckily, he’s of a similar mind. Grunting and cackling to himself, he angles his hips and slams himself downwards into your stretched-out hole, " + (pc.hasVagina() ? "his purple crown giving your cervix a wet, sloppy kiss of greeting.":"his purple crown reaching deep inside your guts to stimulate you from the inside.") + " Your mouth stretches open in an 'O' of pleasure as your unconsciously rip grass from the ground with your hands; you had no idea sex could feel this good.");
	output("\n\nLying there unresistant, you let the goblin pound you into the fucking dirt like you’re nothing more than his worthless slut. Each and every penetration makes your " + (pc.hasVagina() ? "whore cunt":"whorish ring") + " clench around him so hard you worry he might pause, but he never does. He only continues fucking you, grunting and laughing, " + (pc.biggestTitSize() >= 2 ? "savagely slapping your tits with one hand. You cry out in blissful assent at each impact, the sting of his palm only enhancing your ecstasy.":"making a mockery of your supposed superiority."));
	output("\n\nYou lose count of how many times you cum, ");
	if(pc.isHerm()) output("flexing and squeezing around the goblin’s thick bitchbreaker like you’re trying to milk him even as your cock" + (pc.hasCocks() ? "s":"") + " slowly pump" + (!pc.hasCocks() ? "s":"") + " yet another load out onto your [pc.stomach].");
	else if(pc.hasVagina()) output("flexing and squeezing around the goblin’s thick bitchbreaker like you’re trying to milk him to no avail.");
	else if(pc.hasCock())
	{
		if(pc.balls > 0) output("your [pc.balls] aching as " + (pc.balls == 1 ? "it pumps":"they pump") + " yet another load out onto your [pc.stomach].");
		else output("your cock" + (pc.hasCocks() ? "s":"") + " aching as " + (!pc.hasCocks() ? "it":"they") + " slowly pump" + (!pc.hasCocks() ? "s":"") + " yet another load out onto your [pc.stomach].");
	}
	else output("flexing and squeezing around the goblin’s thick bitchbreaker like you’re trying to milk him to no avail.");
	output(" This sexual torment will only end when he chooses to end it, and not a moment before - you’re powerless to resist him either way, your body sapped of strength as orgasm after orgasm rocks and weakens your core and your mind.");

	output("\n\nIt feels like several hours have gone by when you hear him groan, slapping your stomach and pressing down on it hard enough to make you moan.");
	if(pc.hasVagina()) output(" He can feel himself through your skin, you realize. He’s touching his own cock pressed right up against your womb through your tummy.");
	else output(" The seeming declaration of dominance is accompanied by a rough, brutal thrust right up into your guts, bulging your stomach out, and you finally realize he’s grabbing his own cockhead through your tummy.");

	output("\n\nThe realization makes you cum so hard you scream yourself hoarse, thick goblin cum flooding your " + (pc.hasVagina() ? "[pc.womb]":"bowels") + " and defiling you from the inside out. You fall unconscious with him still plowing your distended " + (pc.hasVagina() ? "cunt":"asshole") + ", his cackling ringing in your ears as warm spooge spurts from your ruined hole.");
	output("\n\nWhen you groggily awaken, your " + (pc.hasVagina() ? "vagina":"ass") + " aches not with soreness but with <i>need</i>. You need to fuck, to get fucked. Lying on the ground moaning and wondering whether you should give in to the impulse to violently masturbate as goblin cum trickles from " + (pc.hasVagina() ? "between your [pc.thighs]":"your behind") + ", the floating text appears in front of your face once more.");
	output("\n\n<i>“Well done,”</i> the floating text says. <i>“You’ve leveled up and stat points have been auto-allocated. Continue onwards for greater adventures, and welcome to Aulandia!”</i>");
	output("\n\n<i>“What the fuck,”</i> you groan, closing your eyes. You guess in this world, fucking might count as a fight. And evidently you ‘won’ your last encounter - sure enough, looking around, you don’t see the goblin. Just a small, smoldering pit in the grass a few feet away.");
	output("\n\nOnce you’re back on your feet and re-dressed - not that you were ever really that undressed, owing to the convenience of these clothes - you inspect the pit. Smoky ashes swirl away into the wind and you’re left as clueless as you were before, with the text offering no help. Still, your tormentor seems to be gone.");
	output("\n\nYou find yourself a little annoyed - now that he’s gone, you’re going to have to find someone <i>else</i> with a cock that fat to plow you, and those don’t come easily. You feel hornier" + (pc.hasVagina() ? " and wetter":"") + " than before, as though your libido has risen. It’s hard to care too much about the specifics right now, though.");
	//Gives player large boost to libido and widens their vagina/asshole depending on which is applicable. Maybe increases wetness? Anything else that makes them slutty is good. Give tramp stamp that says ‘whore’.
	processTime(60);
	pc.libido(5);
	pc.orgasm();
	//flag ‘em for fucked goblin.
	flags["KQ_GOBLIN_DED"] = -1;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function kqVR_S1Bonus():void
{
	output("The edge of the forest lies here, roots and grass turning to dry dirt and weeds as a singular shabby dirt path curls towards " + (flags["KQ_VR_CROSSROADS"] != undefined ? "a crossroads.":"an unknown destination."));
	output("\n\nThere is no Safe Zone nearby.");

	if(flags["KQ_VR_LLAERWYN"] != undefined) 
	{
		output("There’s no more green light, either.");
		flags["NAV_DISABLED"] = undefined;
	}
	else
	{
		setNavDisabled(NAV_NORTH_DISABLE);
		output("There’s a green light floating to the side of the road, though.");
		addButton(0,"Light",kqVRLightApproachin,undefined,"Light","Approach the light.");
	}
}

public function kqVRLightApproachin():void
{
	clearOutput();
	showName("THE\nLIGHT...");
	showBust("KQ_VR_LLAERWYN");
	author("Wsan");
	output("You slowly walk towards the light, holding your hand out and watching as it swirls around your fingers. The wind raises, blowing at your clothes hard enough for them to almost come off, and you urgently grab at the struggling articles of clothing before they can escape for good.");
	output("\n\n<i>“Oh,”</i> a gentle, feminine voice says from above. <i>“A traveller.”</i>");
	output("\n\nGlancing upwards, you see the green light from before - only now less focused, spread over a larger area, shimmering dimly. If you squint your eyes and concentrate you can see the faint, glowing outline of a naked girl suspended in the air as though she were hovering there.");
	output("\n\n<i>“Hello?”</i> you ask, more curious than anything. <i>“I’m [pc.name].”</i>");
	output("\n\n<i>“[pc.name]”</i>, she intones, copying your inflection. You think you see the ghost of a smile before she slowly drops downwards, her toes gently landing against the dirt road and blowing dust in all directions. <i>“I am Llaerwyn, a sprite. May I offer you aid?”</i>");
	output("\n\nYou can’t fully discern her figure but what you can see of it reveals a very attractive girl, likely a young adult or the equivalent. She smiles at your attention.");
	processTime(5);
	clearMenu();
	addButton(0,"Blessing",kqVRBlessingRequest,undefined,"Blessing","Ask for a blessing.");
	addButton(4,"Leave",youCantHandleThePeril_ItIsTooPerilous,undefined,"Leave","Nothing to see here.");
}


//[Blessing]
//tooltip:Ask for a blessing.
public function kqVRBlessingRequest():void
{
	clearOutput();
	showName("A\nBLESSING");
	showBust("KQ_VR_LLAERWYN");
	author("Wsan");
	output("<i>“Could you bless me, to aid me in my travels?”</i> you ask.");
	output("\n\n<i>“Of course,”</i> she says, her eyes lighting up. She seems grateful to have the chance to help someone. <i>“Please, kneel.”</i>");
	output("\n\nTaking a knee in front of her, you close your eyes and hear her approach, standing directly in front of you. Rather than the soft chanting of words you expected, though, you hear her stifle a moan as you hear the noise of skin sliding across wetness. Opening your eyes, you chance a glance upwards.");
	output("\n\nThe sprite is masturbating, standing on her shaking tiptoes above you and biting her lip with a tortured expression, desperately rubbing her tiny clit with a fingertip. She doesn’t seem to notice that you’ve seen what she’s doing or if she has, she doesn’t care - or doesn’t know that it’s abnormal. Perhaps this is just how sprites bless people in Aulandia, for all you know. A strand of wetness slips from her pussy, dripping to the ground as she quietly moans.");
	output("\n\n<i>“Nnnhh... hhhh... nnnnn-”</i> she groans.");
	output("\n\n<i>“Do you need help?”</i> you chance.");
	output("\n\n<i>“I, I have to cum to bless you,”</i> she pants, rubbing herself harder. <i>“P-please don’t distract me!”</i>");
	processTime(3);
	pc.lust(10);
	//[LetHerCum] [FuckHer]
	addButton(0,"LetHerCum",letTheSpriteCummies,undefined,"Let Her Cum","Stay silent and let the girl cum, giving you a blessing.");
	addButton(1,"Fuck Her",fuckLlaerwyn,undefined,"Fuck Her","Fuck the girl to orgasm to earn your blessing.");
}

//[LetHerCum]
//tooltip:Stay silent and let the girl cum, giving you a blessing.
public function letTheSpriteCummies():void
{
	clearOutput();
	showName("A\nBLESSING");
	showBust("KQ_VR_LLAERWYN_NUDE");
	author("Wsan");
	output("You watch the girl masturbate herself with increasing vigor, her cheeks glowing a faint red you can see even with just her outline. Your attention, despite her obvious embarrassment, seems to serve only to further turn her on, and soon enough she’s dripping all over the ground in her arousal. Moaning, she stretches her narrow hips out towards you.");
	output("\n\n<i>“It’s coming- nnh! Drink! Drink it!”</i> she urges, almost stumbling as she begins to shake in pleasure.");
	output("\n\nYou extend your [pc.tongue] and she plants her pussy right on it, groaning in ecstasy as femcum begins to dribble and squirt into your mouth. It tastes like syrup, sweet and sticky, and you soon find yourself gently planting your hands on her backside and pulling her into you for more. She raises her head and moans in outright bliss, calling your name as you lap at the femcum trickling from her folds.");
	output("\n\nYou do, indeed, feel blessed - and the more you drink, the stronger the feeling grows. So strong, in fact, that you need more. Sliding your face between her quivering thighs, you begin tonguefucking her tight and narrow slit, earning more of her juices for yourself while she groans and squeezes your shoulders with her hands. She seems even more eager than you are about it, happily giving herself over to your oral relief in the midst of her squirting orgasm.");
	output("\n\nDrinking deeply of her, you hardly even notice how odd it is that as long as you keep licking, she keeps cumming. She seems young and inexperienced but as the minutes of you licking her labia and sucking at her clit go by, both you and she grow more insistent, desperate, <i>needing</i> more of the other until you’re on top of her on the ground, her thighs wrapped tightly around your head.");
	output("\n\n<i>“Oo-oo-hhhh, goddess, keep going,”</i> she implores you, grinding her sopping cunt against your face. <i>“Drink! Drink! Serve me! Yyyeeesssss!”</i>");
	output("\n\n");
	if(pc.isHerm()) output("Your [pc.cocks] swell" + (!pc.hasCocks() ? "s":"") + " under your loincloth, hard as a rock at the sound of her voice, and as you take another gulp you realize you’re about to cum. You do so with your tongue buried deep in her cunt, your seed splattering against the inside of your clothes as your [pc.pussies] squirt" + (!pc.hasVaginas() ? "s":"") + " and drip" + (!pc.hasVaginas() ? "s":"") + " all through your panties while Llaerwyn cries out in orgasmic delight.");
	else if(pc.hasCock()) output("Your [pc.cocks] swell" + (!pc.hasCocks() ? "s":"") + " under your loincloth, hard as a rock at the sound of her voice, and as you take another gulp you realize you’re about to cum. You do so with your tongue buried deep in her cunt, your seed splattering against the inside of your clothes as Llaerwyn cries out in orgasmic delight.");
	else if(pc.hasVagina()) output("Your [pc.pussies] clench" + (!pc.hasVaginas() ? "es":"") + " in your panties, every bit as wet as your lover is, and as you take another gulp you realize you’re about to cum. You do so with your tongue buried deep in her cunt, feeling it clamp down around you while you squirt and drip all through your panties, soaking them in your juices while Llaerwyn cries out in orgasmic delight.");
	else output("Though you have nothing to physically show for it, you suddenly realize you’re about to cum as you take another gulp. You do so with your tongue buried deep in her cunt, Llaerwyn crying out in orgasmic delight while your lower half shakes and rolls in bodily confusion.");
	output("\n\n<i>“Nnnnnngh! Ohohohooo, yes,”</i> she hisses, one hand on the back of your head. <i>“Drink, [pc.boyGirl]. Drink until you pass out from the pleasure!”</i> Throwing her head back, she screams her pleasure to the skies. <i>“Aaaaaahhh, yeeessss!”</i>");
	output("\n\nYou can’t even remember what happens next - only blurry images of Llaerwyn riding your face, terrible and beautiful and far more of a force of nature than you had first assumed. When you eventually come to, your face is soaked in a liquid with the consistency of tree sap. It even tastes just like her.");
	output("\n\nShaking yourself off, you stand back up and look around. There’s nothing here but you and this dirt road. Not even the wind.");
	//change tongue to long and prehensile to better eat puss. Increase libido and taint. Maybe even a blessing perk of some sort to do with oral if inclined. Make PC a squirter.
	//flag PC for eating out Llaerwyn.
	flags["KQ_VR_LLAERWYN"] = 1;
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[FuckHer]
//Fuck the girl to orgasm to earn your blessing.
//Does not require cock.
public function fuckLlaerwyn():void
{
	clearOutput();
	showName("FUCK\nBLESSINGS");
	showBust("KQ_VR_LLAERWYN_NUDE");
	author("Wsan");
	output("<i>“I’ll fuck you to make you cum, then,”</i> you offer, and she stops, looking at you red-faced.");
	output("\n\n<i>“Y-you will?”</i> she stutters shyly. <i>“Then, traveller, if you would...”</i>");
	output("\n\nShe spreads her tight little pussy as far as she can for you as you rise to your [pc.feet] ");
	if(pc.hasCock()) output("holding your [pc.cockBiggest] in hand.");
	else 
	{
		output("when she spots the problem.");
		output("\n\n<i>“Ah! Let me fix that,”</i> she says with a gentle smile, pressing her hand to your groin. She pushes her palm against your crotch hard and you groan, feeling warmth erupt from her outstretched fingers. When she pulls away, you find that you have a ghostly green cock, the same ‘material’ as she - and holy shit, it’s fucking massive!");
		output("\n\n<i>“There you go,”</i> she murmurs, bending down to rub the tip, slowly stroking you to full, swollen erection. <i>“Just the size I prefer.”</i>");
		output("\n\nClearly Llaerwyn is just a little more experienced than you’d expected given that your prodigious tower of a penis now stands at something like sixteen inches long, thicker than her arm - and probably giving her thighs a run for her money, too. Still, though, you can’t complain. All you really want to do right now is fuck this sprite until she’s creaming herself.");
	}
	output("\n\n<i>“Here,”</i> she offers, grabbing the head of your cock and aligning it with her narrow cunt. The first thing you notice how warm she is and the next is how <i>wet</i>; gods, she’s dripping all down your shaft already. <i>“Nnnnnh-”</i>");
	output("\n\n" + (pc.hasCock() ? "Your [pc.cockHeadBiggest]":"Your swollen cockhead") + " slips between her thighs with a wet noise, the feminine sprite suddenly shivering violently and standing up on her tiptoes again. Her eyes flutter rapidly, her breathing erratic until she visibly tries to calm herself down several seconds later, dazed and slow.");
	output("\n\n<i>“Did you cum?”</i> you ask. <i>“Is that the blessing done?”</i>");
	output("\n\n<i>“N-no,”</i> Llaerwyn protests, cheeks rosy. She takes a halting step forward, pressing herself against you. <i>“Nnnh... oh, [pc.name]...”</i>");
	output("\n\n<i>“So I should continue until you do cum, then?”</i> you say, smiling.");
	output("\n\nThe sprite nods wordlessly, biting her lower lip. Gods, she is tight around you; you’re surprised she can take it, let alone all of it. As short as she is, you’re not even sure where it’s all going - just that it feels fucking amazing to have it inside her. Placing your hands on her curvy little butt, you lift her off the ground with no more trouble than if you were picking up a drink. She giggles enchantingly in your ear, leaning against your shoulder.");
	output("\n\n<i>“You can be rough if you want,”</i> she whispers softly.");

	output("\n\nThat’s all the invitation you need. Lifting her higher, you listen to her beautiful high-pitched singsong when you slide her back down your rock-hard cock, all the way to the base and then back up again. She’s so light the entire thing is effortless, allowing you to concentrate wholly on the fact she’s clearly cumming her brains out by the third thrust. One of her legs is completely taut, toes pointing towards the ground as she struggles to muffle her moans while femcum squirts all over your groin.");
	output("\n\n<i>“Still haven’t cum yet?”</i> you prod her, grinning.");
	output("\n\n<i>“Nuh! Nnnuuuhhh! N-no,”</i> she manages, her face twitching. Her toes curl upwards, shaky legs coming up to gingerly wrap around your [pc.hips]. <i>“So y-you, you’ll have to... keep going...”</i>");
	output("\n\nGrabbing her by the hips, you start fucking her properly, lifting her up and slamming her down as you pound your cock upwards into her tight little box, earning streams and spatters of femcum as she orgasms explosively all over your thickening dick. Her voice comes out in moans and squeals, hands grabbing at your chest and shoulders");
	if(pc.biggestTitSize() >= 2) output(" until she grabs your [pc.nipples] and begins squeezing them");
	output(".");
	output("\n\n<i>“OooOoOh! [pc.name]!”</i> she moans, wiggling her hips. <i>“I-I think I’m, I’m getting closer!”</i>");

	output("\n\n");
	if(!pc.hasCock() || pc.biggestCockLength() < 16) output("The longer you fuck her, the more you feel like you’re getting even harder and deeper inside her until on one particularly long outstroke that has her screaming in rapture when you slam her back down, you notice it. You <i>are</i> deeper inside her - your dick is growing! Fuck it, though; you can’t bring yourself to pull out and inspect yourself now, not when the entire experience feels this good.\n\n");
	output("Groaning, you plow her harder and harder until she’s squeezing around your length so hard it almost hurts, clenching and flexing while she moans out loud, cumming hard enough that she can barely stand it. Your own orgasm is right on your heels, a knot tightening in your stomach as you grunt, the urge to seed her growing and growing until it’s too strong to ignore.");
	output("\n\n<i>“C-cumming,”</i> you manage, hilting yourself so deeply inside her you bump right up against her soft, padded cervix.");
	output("\n\nThat sets her off immediately, a squirt of femcum spraying your " + (pc.balls > 0 ? "[pc.balls]":"crotch") + " while you blow your load right into her fertile womb, cumming so hard it feels like the entirety of your seed pours out of you within a few seconds. Even then you don’t stop, grunting as you cum even harder with another stroke, slowly lowering her to the ground and spreading her legs as you lie on top of her. She’s all kisses and happy moans, pulling you towards her, welcoming you, insisting you go deeper and nut as hard as you can right into her womb.");
	output("\n\n<i>“Ooohhoohh, goddess,”</i> Llaerwyn moans, clutching you tight and refusing to let go. <i>“Cum harder, [pc.boyGirl], <b>harder!</b> All the way inside! Nnnnhhhh!”</i>");
	output("\n\nPounding her arrhythmically, you grunt and groan like a beast while she claws your back up, encouraging you ever further, telling you to let it all out like the good [pc.boyGirl] you are, <i>demanding</i> your seed. You start feeling dizzy, your vision blurring and shifting before you catch a glimpse of Llaerwyn’s true form, terrible and beautiful and far more of a force of nature than you had first assumed. The thud of impact as you roll off her onto the ground doesn’t even reach your ears.");
	output("\n\nWhen you come to, you sit up and wince, your hips aching a little. That was intense and, gingerly reaching behind yourself to touch the scratchmarks on your back, definitely real. As if there was any doubt, your ");
	if(pc.hasCock() && pc.biggestCockLength() < 16) output("newly enlarged cock hangs between your legs, thick and veiny.");
	else if(pc.hasCock()) output("cock is still covered in Llaerwyn’s juices, and they smell reminiscent of tree sap. It’s not unpleasant, at least.");
	else output("newly grown cock hangs between your legs, thick and veiny. It smells like Llaerwyn.");
	output("\n\nYou slowly stand and get ready to move onward, the ‘sprite’ clearly gone for now.");
	//If PC was cockless, give them a 16”</i> human cock + balls that cum a lot. If they had one but it was smaller than 16”</i>, enlarge it to 16”</i>. If they had a cock at all, enlarge their balls and make their cumvolume a lot higher. Increase libido, increase taint.
	flags["KQ_VR_LLAERWYN"] = 2;
	processTime(60);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Leave]
//tooltip:Nothing to see here.
public function youCantHandleThePeril_ItIsTooPerilous():void
{
	clearOutput();
	showName("\nFAREWELLS");
	showBust("KQ_VR_LLAERWYN");
	author("Wsan");
	output("<i>“Farewell then, traveller,”</i> she says sadly, the wind blowing once more. The light is gone when you look again.");
	if(silly) output("\n\n<i>“I can’t even summon her back? This game sucks, dude,”</i> you grouse to nobody in particular.");
	processTime(1);
	flags["KQ_VR_LLAERWYN"] = -1;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function hasLlaerwynCock():Boolean { return (flags["KQ_VR_LLAERWYN"] == 2 && !pc.hasCock()); }


public function kqVR_M0Bonus():void
{
	if(flags["KQ_VR_CROSSROADS"] == undefined) output("You’ve returned to the crossroads,");
	else output("Upon your arrival, you deem this crossroads to be");
	output(" literally the middle of nowhere. There’s nothing in sight but four winding dirt paths, leading in the cardinal directions, and a creaking signpost.");
	output("\n\nThere’s a sign here. It reads as follows:");
	output("\n\tEAST - desert");
	output("\n\tNORTH - ruined city");
	output("\n\tWEST - mountains");
	output("\n\tSOUTH - forest");
	output("\n\nThe only open paths are south and west. The other directions are fuzzy and vague, like the developer never bothered to finish them.");
	if(flags["KQ_VR_CROSSROADS"] == undefined) flags["KQ_VR_CROSSROADS"] = 1;
}

public function kqVR_W2Bonus():void
{
	output("The road here is damaged and broken, forcing you to climb some rocks to find your way back on the path. It slopes upwards, a shallow gradient sending you uphill.");
	//woman not spoken to:
	if(flags["KQ_VR_LUVIA"] == undefined)
	{
		output(" Upon clambering over a particular rock, you spot someone - a beautiful woman in a white dress, looking forlorn as she sits on the side of the path. She sighs heavily, tapping her fingers on her knee.");
		output("\n\nAfter looking around a bit, you can’t see any way around. You’ll have to walk right up to her if you want to proceed.");
		setNavDisabled(NAV_WEST_DISABLE);
		addButton(0,"Woman",surpriseWomanAttack,undefined,"Woman","Approach the peculiarly well-dressed woman.");
	}
	else
	{
		flags["NAV_DISABLED"] = undefined;
		output(" There are climbable rocks here, enabling you to traverse the weathered path in non-linear fashion. No sign remains of the woman you encountered.");

	}
}

//[Woman]
//tooltip:Approach the peculiarly well-dressed woman.
//Also kicks the PC to this scene if they try to cross into W3 from W2, or just prevents access to W2 until they interact with her.
public function surpriseWomanAttack():void
{
	clearOutput();
	showName("\nWOMAN");
	showBust("KQ_VR_LUVIA");
	author("Wsan");
	output("She brightens up the moment she sees you, jumping to her feet and crossing over to you with confident strides in her heels. Beaming so brightly, you’d never think she’d looked so depressed just a moment ago - she looks like she sprang off the cover of a wedding apparel e-zine. Her skin is pale and fair, matching the blonde hair that sweeps down her back.");
	output("\n\n<i>“I’ve been waiting for you!”</i> she announces, stepping closer until she’s less than a foot away from you, smiling in your face. <i>“You’re an adventurer, aren’t you? I have a problem that needs solving and your type is usually good with that!”</i>");
	processTime(1);
	clearMenu();
	addButton(0,"Help",helpDisSurpriseWoman,undefined,"Help","Lend your aid to this out-of-place woman.");
	addButton(1,"No",alternateNoMenu,undefined,"No","You don’t have the time for this! Adventure awaits elsewhere!");
}

//[No]
//tooltip:You don’t have the time for this! Adventure awaits elsewhere!
//leads to the ‘No’ scene directly above anyway. Lol, thinking you have agency in Bad End: The Videogame.
//FEN NOTE: I changed this to give a good route.
public function alternateNoMenu():void
{
	clearOutput();
	showName("\nWOMAN");
	showBust("KQ_VR_LUVIA");
	output("You back off with such speed that the woman looks momentarily crestfallen. She bursts into a pile of ash a second later, and a message appears: <i>“Encounter avoided! +69 XP!”</i>");
	flags["KQ_VR_LUVIA"] = -1;
	processTime(2);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}


//Lend your aid to this out-of-place woman.
public function helpDisSurpriseWoman():void
{
	clearOutput();
	showName("\nWOMAN");
	showBust("LUVIA");
	showBust("KQ_VR_LUVIA");
	author("Wsan");
	output("You nod in assent. <i>“I can help you. What do you need?”</i>");
	output("\n\n<i>“Oh, fantastic!”</i> she says, laughing in relief. <i>“You see, I was a princess of the neighboring land not even a few months ago but I was cursed by a succubus - well, it’ll be easier if I just show you...”</i>");
	output("\n\nShe begins stripping off, removing layers of her fancy dress bit by bit, and you make no move to stop her. Stopping right at the good part, she turns away and looks at you, just a tad shyly.");
	output("\n\n<i>“Can you undo my bra strap? I have trouble reaching it...”</i> she confesses.");
	output("\n\n<i>“Sure,”</i> you murmur, gently touching her back and unfastening the strap. It falls loose and you hear the swishing of fabric as she discards the bra entirely, throwing it onto the heap of clothes on the dusty, windswept ground. All she’s wearing now is a pair of flowery white panties along with her garterbelt and stockings, looking every bit like a bride ready to consummate her marriage.");
	output("\n\n<i>“Oh, thank you!”</i> she exclaims, turning back to you with her breasts in plain view. Large and curvy, they <i>heavily</i> accentuate the hourglass figure of this extraordinarily beautiful woman - you find yourself thinking of her as an oasis in the desert of Aulandia, a cursed land if there ever was one. <i>“Hee hee... do you like my breasts, adventurer? Your gaze is making my cheeks hot.”</i>");
	processTime(5);
	pc.lust(4);
	clearMenu();
	addButton(0,"Very Much",veryMuchVRLady,undefined,"Very Much","You love them, in fact. Would she mind if you touched them?");
	addButton(1,"Yes",yesLadyTheyNiceBoobies,undefined,"Yes","They’re nice breasts.");
	addButton(2,"No",noPrincessPlz,undefined,"No","Not really. You’ve seen better.");
}

//[VeryMuch]
//tooltip:You love them, in fact. Would she mind if you touched them?
public function veryMuchVRLady():void
{
	clearOutput();
	showName("\nPRINCESS");
	showBust("KQ_VR_LUVIA_NUDE");
	author("Wsan");
	output("<i>“You want to touch them?”</i> she says, smiling as a slight flush colors her cheeks. She leans forward slightly, offering you her bountiful chest. <i>“Go right ahead, adventurer...”</i>");
	output("\n\n<i>“Aah...”</i> she moans as you take ahold of them, cupping and squeezing her weighty tits. <i>“Mmm...”</i>");
	output("\n\nA perverse notion takes ahold of you then and there and suddenly you’re leaning in to place your lips around her left nipple, pink and stiffening in your mouth. She lets out a surprised gasp that transforms into an elongated moan as you begin to suck, and to your dull surprise, a trickle of milk begins to leak out. Taking full advantage, you swirl your tongue around her areola and collect everything she has to offer before taking her slightly deeper, sucking harder on her fertile teat.");
	output("\n\n<i>“Oohhnnh! Oh, it’s been so long,”</i> she pants, taking a shuddering breath and pressing herself against you, rubbing your arms. <i>“Mmmm... drink all you like, adventurer... there’s more where that came from.”</i>");
	output("\n\nWhether by magic or some other happenstance, by the time you’ve drunk from her right breast as well, her left has replenished itself enough to have milk running freely down her pale skin, encouraging you to sup on her once more. Then her right is dripping again, and before you know it you’re lying with your head on the groaning princess’ lap suckling from her as if you were being breastfed, her hand roaming to your nethers to find your ");
	if(pc.isHerm()) output("[pc.cockBiggest], swollen and half-erect.");
	else if(pc.hasCock()) output("[pc.cockBiggest], swollen and half-erect.");
	else if(pc.hasVagina()) 
	{
		if(hasLlaerwynCock()) output("giant cock, swollen and half-erect.");
		else output("[pc.pussy], wet and dripping.");
	}
	else 
	{
		if(hasLlaerwynCock()) output("your giant cock, swollen and half-erect.");
		else output("[pc.asshole].");
	}
	output(" You start at the contact but she hushes you, bidding you to keep drinking.");

	output("\n\n<i>“Mmm... don’t concern yourself with this,”</i> she murmurs, ");
	if(pc.isHerm()) output("taking you firmly in hand.");
	else if(pc.hasCock()) output("taking you firmly in hand.");
	else if(pc.hasVagina()) 
	{
		if(hasLlaerwynCock()) output("taking you firmly in hand.");
		else output("sliding two fingers into your cunt.");
	}
	else {
		if(hasLlaerwynCock()) output("taking you firmly in hand.");
		else output("sliding two fingers into your ass.");
	}
	output(" <i>“Just focus on my milk...”</i>");

	output("\n\nIt tastes and feels amazing, just the right amount of creaminess that you never want to go without it again. That said, even with your hands and mouth occupied with the princess’ big, beautiful tits, you can hardly ignore the feral lust with which she’s ");
	if(pc.isHerm()) output("jacking you off");
	else if(pc.hasCock()) output("jacking you off");
	else if(pc.hasVagina())
	{
		if(hasLlaerwynCock()) output("jacking you off");
		else output("slipping her fingers into your gushing box");
	}
	else 
	{
		if(hasLlaerwynCock()) output("jacking you off");
		else output("slipping her fingers into your winking asshole");
	}
	output(" - her breath is coming in short, hot groans and pants, her ardor apparently being stirred up by your own hastening approach towards orgasm.");
	output("\n\nYou " + pc.mf("groan","moan") + " into her tits as you ");
	if(pc.isHerm()) output("cum everywhere, spurting [pc.cum] all over her rapidly working hand as you both shudder in pleasure.");
	else if(pc.hasCock()) output("cum everywhere, spurting [pc.cum] all over her rapidly working hand as you both shudder in pleasure.");
	else if(pc.hasVagina())
	{
		if(hasLlaerwynCock()) output("cum everywhere, spurting thick seed all over her rapidly working hand as you both shudder in pleasure.");
		else output("cum in her hand, shuddering against the princess.");
	}
	else
	{
		if(hasLlaerwynCock()) output("cum everywhere, spurting thick seed all over her rapidly working hand as you both shudder in pleasure.");
		else output("cum around her fingers, flexing and rippling your muscles while she shudders against you.");
	}
	output("\n\nAfter that, everything is a blur. You know only that she brought you to many, many more orgasms as you drank from her overflowing tits, heaving with lust and heat. You awaken what feels like several hours later, dried milk around your lips - ");
	if(pc.biggestTitSize() >= 1) 
	{
		output("and as if to mimic her state, your own breasts now look to be a few cupsizes larger.");
		if(pc.canLactate()) output(" An experimental tweak confirms that, yes, they leak milk just like hers, too.");
	}
	else output("and to your shock, with large, round breasts of your own. While you’re still getting over the surprise, milk begins to spurt from your nipples! You’re lactating just like she was.");
	output("\n\nThere’s no sign of the queen but there’s another ashen burn mark across the ground like the one you saw after your experience with the goblin. Smoky dust rises from the mark and whirls away in a sudden wind, leaving you alone once more with only warm milk in your tummy to keep you company.");
	//gives PC big, milky breasts if they didn’t have any, enlarges and makes them lactate if they did. Makes appearance more feminine.
	flags["KQ_VR_LUVIA"] = 2;
	processTime(60);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
public function hasLuviaTits():Boolean
{
	return (flags["KQ_VR_LUVIA"] == 2);
}
//[Yes]
//tooltip:They’re nice breasts.
public function yesLadyTheyNiceBoobies():void
{
	clearOutput();
	showName("\nPRINCESS");
	showBust("KQ_VR_LUVIA_NUDE");
	author("Wsan");
	output("<i>“I quite like them myself, if I must confess,”</i> she says, giggling softly. <i>“But perhaps you prefer something different...”</i>");
	output("\n\nShe leans over and slowly wiggles her hips, drawing her panties down her legs until she’s standing before you completely naked, a tuft of wispy blonde pubic hair above her exposed pussy. Smiling up at you, she raises herself back up and turns around, showing off her shapely butt.");

	output("\n\n");
	if(pc.isHerm()) output("<i>“Would you like to sire a royal heir with that cock of yours?”</i> she suggests, eyes twinkling.");
	else if(pc.hasCock()) output("<i>“Would you like to sire a royal heir with that cock of yours?”</i> she suggests, eyes twinkling.");
	else if(pc.hasVagina())
	{
		if(hasLlaerwynCock()) output("<i>“Would you like to sire a royal heir with that cock of yours?”</i> she suggests, eyes twinkling. <i>“Those panties of yours don’t do much to hide that massive bulge, do they?”</i>");
		else output("<i>“Do you like my body, adventurer? Though there’s one more part of me you haven’t seen juuust yet...”</i>");
	}
	else 
	{
		if(hasLlaerwynCock()) output("<i>“Would you like to sire a royal heir with that cock of yours?”</i> she suggests, eyes twinkling. <i>“Your underwear doesn’t hide much about your mouthwatering size, does it?”</i>");
		else output("<i>“Do you like my body, adventurer? Though there’s one more part of me you haven’t seen juuust yet...”</i>");
	}
	//deliberately very few parsers in this as the PC’s state doesn’t actually match their Aulandia body at this point.
	if(pc.hasCock() || hasLlaerwynCock()) 
	{
		output("\n\nYou don’t need to be asked twice. Grabbing the proffered hands she’s stretching back towards you, you slide your stiffening cock between her lithe thighs and feel the heat of her soft pussy against your iron-hard dick as you pull the giggling princess towards you.");
		output("\n\n<i>“Aaah... not the lips I first expected to use to kiss you,”</i> she whispers back to you, smiling. <i>“I am Luvia. And you?”</i>");
		output("\n\n<i>“[pc.name],”</i> you murmur, leaning in to kiss her deeply, rubbing her netherlips with your swollen cock as if to assuage both your needs. She gets wetter and wetter the longer you kiss her, slowly growing more insistent until she parts with a soft gasp, gazing at you intensely.");
		output("\n\n<i>“I need to feel you inside me, [pc.name],”</i> she says, shivering. <i>“The temptation of having you right there is just- nnnnh...”</i>");
		output("\n\nAligning your ");
		if(pc.hasCock())
		{
			if(pc.cocks[0].hasFlag(GLOBAL.FLAG_BLUNT)) output("blunted ");
			else if(pc.cocks[0].hasFlag(GLOBAL.FLAG_TAPERED)) output("tapered ");
		}
		output("cockhead with the narrow opening of her vagina, you slowly lift your hips and enter her tight, dripping confines, grunting as you feel her reflexively squeeze down on you.");
		output("\n\n<i>“Ooohhh, go slow,”</i> Luvia moans, your hands finding her hips while hers reach up and over to hold your shoulders. <i>“Ah! Aah... oh, mmm...”</i>");
		output("\n\nShe’s blessedly tight around you, her little squeezes when you hit a particularly sensitive spot endearing you to her as she slowly moans your name, drawing it out as you slide deeper inside her. Her hands are all over your arms and hips, affectionally touching and stroking you while you take her, like she just can’t appreciate your form enough. Every so often she looks back at you wearing an expression of utter desire and worship, inspiring you to get even deeper inside her.");
		output("\n\n<i>“Oh- <b>oh</b>,”</i> she groans, gritting her teeth and tilting her head upwards. <i>“Nnnn! Oh, I haven’t felt like this in </i>years<i>...”</i>");
		output("\n\nYou kiss her on the back of the neck and she half-laughs, half-moans in delight, leaning back into you as you start to fuck her a little harder, enough to make her bountiful chest jiggle with the force. Her breathing gradually shifts from long, whispered sighs to ragged, panting moans over the minutes, wetness dripping down your shaft and pooling between her feet. You’re both right on the edge and you can feel it - the way she’s involuntarily clenching around you, shivering and shaking, unable to properly draw breath.");
		output("\n\n<i>“Cum inside,”</i> she begs you, pushing against you so hard you hardly have a choice in the matter. <i>“Oh! Please!”</i>");
		output("\n\nGripping her waspish hips tight you groan as she cries out her pleasure, your cum surging upwards into her canal and spattering her womb, pumping into her until it drips down her shaking thighs. Luvia cums even harder than you do, milking your pulsing cock for seed as if her life depended on it, her tightening walls squeezing and twisting around you, wringing you out until you have literally nothing left to give.");
		output("\n\n<i>“Aaaaahhh...”</i> she moans softly, placing a hand over her lower stomach. <i>“Oh, I can feel it taking root...”</i>");
		output("\n\nSuddenly far more dizzy than you have any right to be, you pull out and take a seat on the ground, your head swimming. Your vision begins to blur, doubling and then quadrupling as Luvia bends over in front of you. The last things you see before everything goes black are her shapely breasts as she leans in to kiss you on the forehead, whispering good night.");
		output("\n\nYou awaken what feels like a long time later, staggering back to your feet. There’s no sign of Luvia at all, not even her clothes, but there’s another ashen burn mark across the ground just like the one you saw after the goblin disappeared. Smoky dust rises from the mark and whirls away in a sudden wind, leaving you alone once more with only the knowledge that you had a good time with Luvia.");
		//stores your cum for archival in mad scientist’s freighter. Probably the only encounter in the entire thing that doesn’t have a boatload of negatives.
		processTime(250);
		pc.orgasm();
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
	else if(pc.hasVagina())
	{
		output("\n\nWaving her hand in vague fashion, she plants her palm right on her groin and moans, her smile spreading across her face as a truly massive cock sprouts from her groin, bulging with vigor and twitching in the air. She lets out a self-satisfied sigh and winks at you.");
		output("\n\n<i>“I was hoping you’d help with making an heir, but, well,”</i> she says, approaching you, <i>“I have a particular thing for beautiful [pc.boyGirl]s, adventurer... and how I have sex with them. Would you be so kind as to turn around for me?”</i>");
		output("\n\nStunned into silence by the appearance of what looks to be two feet of cock between this otherwise wholly feminine princess, you turn around for her. She lets out a low, long whistle as she walks up behind you.");
		if(pc.buttRating() < 6) output("\n\n<i>“Look at <b>this</b>,”</i> she murmurs, grabbing a handful of your [pc.ass]. <i>“So tight and petite. I can’t wait to get inside it.”</i>");
		else if(pc.buttRating() < 13) output("\n\n<i>“Ooooh, look at <b>this</b>,”</i> she murmurs fiercely, slapping your [pc.ass] and grabbing a handful of it. <i>“Nice and thick, aren’t you?”</i>");
		else output("\n\n<i>“Nnnnf, baby,”</i> she growls, slapping your [pc.ass] as hard as she can and sinking her hand into it to grab as big of a handful as she can manage. <i>“This is the most thick, fuckable ass I’ve ever seen.”</i>");
		output("\n\nCircling around to your front, she smiles good-naturedly at you and apologizes. <i>“Sorry, I like to size my bitches up before I fuck them silly. You don’t have any problem with that, do you, bitch?”</i> she says, ");
		if(pc.biggestTitSize() >= 1) 
		{
			output("leaning into you to undo your bra and inspecting your [pc.breasts] by hand.");
			if(pc.biggestTitSize() < 3) output(" <i>“Oh, so young and petite. What a body you have!”</i>");
			else if(pc.biggestTitSize() < 7) output("<i>“Oh, so womanly and fertile yet so young! You make me jealous.”</i>");
			else output("<i>“Oh, my. Aren’t you just the perfect breeder? Look at these things! So lush and fertile.”</i>");
			output(" She gives your [pc.nipples] a rough tweak, enough to make you moan while she steps back and watches them stiffen.");
		}
		else output("tweaking your [pc.nipples] hard enough to make you moan and watching them stiffen.");
		output(" <i>“Good [pc.boyGirl], get nice and hard for me.”</i>");

		output("\n\nSomething is keeping you rooted to the spot, unable to properly move or speak, until she herself desires it. You don’t know what it is, only that your body is filling with some interminable heat as she evidently finishes her impromptu inspection of the finer points of your body, standing behind you once more. She draws closer and closer" + (pc.legCount > 1 ? " until you automatically spread your [pc.legs] apart for her":"") + ", allowing the domineering woman to slide her enormous cock right between your [pc.thighs]. She giggles in your ear" + (pc.legCount > 1 ? " as you bring your [pc.feet]":" as you bring them") + " closer together again, enclosing her fat, pre-dribbling prick with the soft, warm [pc.skinFurScales] of your inner thighs.");
		output("\n\n<i>“What is your name, adventurer?”</i> she murmurs, laying her head on your shoulder and kissing the side of your face. <i>“I am Luvia, and I would know who I’m about to lay with.”</i>");
		output("\n\n<i>“[pc.name],”</i> you mumble, starting in her grip. <i>“Wh-what are y-you doing to me...”</i>");
		output("\n\n<i>“Nothing at all, [pc.name],”</i> she purrs, rubbing against you. <i>“You just recognize my authority as queen, that’s all. Everyone should know that Queen Luvia’s orders are <b>absolute</b>.”</i>");
		output("\n\n<i>“Th-thought you were a p-princess,”</i> you stutter haltingly, jolting whenever she languidly thrusts her hips forward, her firm cock rubbing against your [pc.clits].");
		output("\n\n<i>“Hoho, that’s enough out of you,”</i> she titters, her hands snaking around your front to touch your chest and slowly shifting down to your [pc.hips]. <i>“A queen only tolerates so much insubordination, [pc.name].”</i>");
		output("\n\nPushing you forward and drawing her hips back, she aligns her bulging cockhead not with your wet, slippery vagina but with your [pc.asshole], spreading your ");
		if(pc.ass.looseness() <= 2) output("little ring wide");
		else if(pc.ass.looseness() <= 4) output("well-practiced hole");
		else output("stretchy fuckhole");
		output(" around the first inch of it. Hot precum drools from the tip while she waits before pushing further in, slowly and methodically breaking your body’s resistance down until you feel the head of her swollen cock begin to protrude from your belly. She doesn’t stop there, though, pushing and pushing until you let out an exhausted groan and she suddenly gains seven inches of ground inside you, grunting triumphantly as the outline of her bloated cock appears under the [pc.skinFurScales] of your tummy.");
		output("\n\n<i>“Aaaahhhh... I have to confess there’s something irrepressively attractive to me about fucking " + pc.mf("a cuntboy","another woman") + "’s asshole,”</i> Luvia says, chuckling in your ear. <i>“Knowing your pussy is getting all wet and frustrated because I’m in the wrong hole, then still cumming anyway because you just can’t get enough of it. It turns me on like nothing else... you have <b>no</b> idea how many queens I turned into anal sluts, [pc.name]. At first they moaned, cried, resisted; but night after night they came back until they were screaming for more, bouncing their royal asses up and down on my cock while I relaxed on their bed.”</i>");
		output("\n\nYou vow to <i>not</i> end up like her previous victims but as much as you hate to admit it, there’s a part of you that oh-so-desperately wants to let go of it all and enjoy yourself like those queens did, and it only grows with every breathy, erotic moan in your ear and each painstaking inch of royal cock crammed in your behind. At the very, <i>very</i> least, you’re going to make her work for this. You let out a groan of pleasure as you finally feel her nutsack press itself up into your buttcrack, secure in the knowledge the queen is completely sheathed inside you.");
		output("\n\n<i>“Ooohhh, what an asshole, [pc.name],”</i> Luvia murmurs, reaching up and around to stroke your distended stomach. It feels even better than you expected to have her embrace you like that - maybe you won’t make her work <i>that</i> hard after all. <i>“I think I might be falling in love with you.”</i>");
		output("\n\nWithout giving you a chance to respond she draws back, your stressed body tightening back up in her wake before she grunts and shoves herself forward once more, thrusting herself to the hilt hard enough to force a weak little scream from your mouth, fading into a delirious moan. She spanks you <i>hard</i> and you cry out again, a strand of wetness drooling from your pussy until her balls swing forward and slap your clit hard enough to silence you, leaving you gaping open-mouthed. Luvia giggles in your ear, pulling out and doing it again, the impact of skin on skin ringing off the surrounding outcroppings of rock.");
		output("\n\n<i>“Oh! Ohhnh! Nnnnh! Hhhh-”</i> you grunt through grit teeth, almost as if you’re protesting your treatment with every heavy impact of seed-engorged balls against your stiff, stinging clitoris. <i>“Guhhh! Ooohhhh!”</i>");
		output("\n\n<i>“You like this, don’t you? Ngh!”</i> Luvia hisses in your ear, drawing back and thrusting herself deep into your body. <i>“You’re actually just a slut that loves being spanked and abused by the queen, aren’t you? Don’t- nnnmf! Feel bad about it. There’s nothing wrong with being a masochist slut for your queen. Go ahead. Cum.”</i>");
		output("\n\nShe bites down softly on your [pc.ear] and you let out a wordless scream, your legs shaking as femcum begins to spray and squirt from your spasming cunt. You only cum all the harder when she fucks you again, getting her balls all covered in your juices and spurring you onward with another hard smack against your swollen-up lips. Voice coming out in a long, pathetic shrill of emotion, you cum as hard as you ever have in the arms of your queen, listening to her murmur loving promises while she plows and ravages your body as if it were a worthless whore’s.");
		output("\n\nReaching back for her you grab at her waspish waist to hold yourself steady while she rocks you with hard and fast thrusts, cumming all the while, your asshole squeezing and clenching around her as if to desperately milk her for cum. But try as hard as you might, you can’t make her cum - she decides that for herself, and you’re just along for the ride. Soon enough she has you bent over at the waist, holding you up by your sweaty hands, pummeling your behind so hard it claps with every impact of her hips against you.");
		output("\n\nIt feels like you don’t even have control over your own body at all, senselessly cumming your brains out over and over while Luvia pillages your asshole for her own pleasure, eventually bringing you to your knees and continuing with you on all fours like an animal. After several minutes you can’t even keep it up and your arms give way, your face landing in the dirt while she continues pounding one orgasm after another out of you without a second thought.");
		output("\n\nIt’s only when she lets out an uncharacteristic groan that you even see some light at the end of the tunnel, her cockhead swelling deep inside you right before an explosion of warmth flowers in your guts. Moaning insensately, you find yourself pushed down into a prone position as Luvia climbs on top of you, digging her knees into your waist and pumping your swollen ring full of cum. A tidal wave of jizz bloats your stomach almost immediately, your guts swelling full of her essence.");
		output("\n\n<i>“Hee hee! Up, bitch!”</i> she giggles, fiercely pulling her knees together against the sides of your tummy. Just like a toy, you open your mouth" + (pc.hasHair() ? " as she pulls your [pc.hair] back":"") + " and spit up a stream of thick, warm cum a foot in front of you. <i>“Good [pc.boyGirl]! Come on!”</i>");
		output("\n\nShe keeps you pressed into the dirt like that, drinking in her cum with your asshole and vomiting it up every time she laughs and forces it out of you. Eventually, you slump down with seed trickling from the corners of your mouth and pass out, too tired to continue.");
		output("\n\nYou awaken what feels like a long time later, your asshole still gaping and spurting seed onto the ground. There’s no sign of the queen but there’s another ashen burn mark across the ground like the one you saw after your experience with the goblin. Smoky dust rises from the mark and whirls away in a sudden wind, leaving you alone once more with only the warmth of Luvia’s seed lining your insides to keep you company. You’re not sure if you’ll miss her or not.");
		//makes PC squirter, enhances anal capacity
		processTime(250);
		pc.orgasm();
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
	else
	{
		output("\n\nWaving her hand in vague fashion, she plants her palm right on her groin and moans, her smile spreading across her face as a truly massive cock sprouts from her groin, bulging with vigor and twitching in the air. She lets out a self-satisfied sigh and winks at you.");
		output("\n\n<i>“I was hoping you’d help with making an heir, but, well,”</i> she says, approaching you, <i>“I have a particular thing for beautiful [pc.boyGirl]s, adventurer... and how I have sex with them. Would you be so kind as to turn around for me?”</i>");
		output("\n\nStunned into silence by the appearance of what looks to be two feet of cock between this otherwise wholly feminine princess, you turn around for her. She lets out a low, long whistle as she walks up behind you.");

		if(pc.buttRating() < 6) output("\n\n<i>“Look at <b>this</b>,”</i> she murmurs, grabbing a handful of your [pc.ass]. <i>“So tight and petite. I can’t wait to get inside it.”</i>");
		else if(pc.buttRating() < 13) output("\n\n<i>“Ooooh, look at <b>this</b>,”</i> she murmurs fiercely, slapping your [pc.ass] and grabbing a handful of it. <i>“Nice and thick, aren’t you?”</i>");
		else output("\n\n<i>“Nnnnf, baby,”</i> she growls, slapping your [pc.ass] as hard as she can and sinking her hand into it to grab as big of a handful as she can manage. <i>“This is the most thick, fuckable ass I’ve ever seen.”</i>");

		output("\n\nCircling around to your front, she smiles good-naturedly at you and apologizes. <i>“Sorry, I like to size my bitches up before I fuck them silly. You don’t have any problem with that, do you, bitch?”</i> she says, ");
		//hasbreasts:
		if(pc.biggestTitSize() >= 1)
		{
			output("leaning into you to undo your bra and inspecting your [pc.breasts] by hand.");
			//<=B cups:
			if(pc.biggestTitSize() < 3) output(" <i>“Oh, so young and petite. What a body you have!”</i>");
			else if(pc.biggestTitSize() < 7) output(" <i>“Oh, so womanly and fertile yet so young! You make me jealous.”</i>");
			else output(" <i>“Oh, my. Aren’t you just the perfect breeder? Look at these things! So lush and fertile.”</i>");
			output(" She gives your [pc.nipples] a rough tweak, enough to make you moan while she steps back and watches them stiffen.");
		}
		else output("tweaking your [pc.nipples] hard enough to make you moan and watching them stiffen.");
		output(" <i>“Good [pc.boyGirl], get nice and hard for me.”</i>");

		output("\n\nSomething is keeping you rooted to the spot, unable to properly move or speak, until she herself desires it. You don’t know what it is, only that your body is filling with some interminable heat as she evidently finishes her impromptu inspection of the finer points of your body, standing behind you once more. She draws closer and closer" + (pc.legCount > 1 ? " until you automatically spread your [pc.legs] apart for her":"") + ", allowing the domineering woman to slide her enormous cock right between your [pc.thighs]. She giggles in your ear" + (pc.legCount > 1 ? " as you bring your [pc.feet]":" as you bring them") + " closer together again, enclosing her fat, pre-dribbling prick with the soft, warm [pc.skinFurScales] of your inner thighs.");

		output("\n\n<i>“What is your name, adventurer?”</i> she murmurs, laying her head on your shoulder and kissing the side of your face. <i>“I am Luvia, and I would know who I’m about to lay with.”</i>");
		output("\n\n<i>“[pc.name],”</i> you mumble, starting in her grip. <i>“Wh-what are y-you doing to me...”</i>");
		output("\n\n<i>“Nothing at all, [pc.name],”</i> she purrs, rubbing against you. <i>“You just recognize my authority as queen, that’s all. Everyone should know that Queen Luvia’s orders are <b>absolute</b>.”</i>");
		output("\n\n<i>“Th-thought you were a p-princess,”</i> you stutter haltingly, jolting whenever she languidly thrusts her hips forward, her firm cock rubbing against your smooth underside.");
		output("\n\n<i>“Hoho, that’s enough out of you,”</i> she titters, her hands snaking around your front to touch your chest and slowly shifting down to your [pc.hips]. <i>“A queen only tolerates so much insubordination, [pc.name]. Also, I think you need a little something... extra.”</i>");
		output("\n\nYou groan as her hand slides in between her cock and your taint, her palm turning upwards as an intense heat shoots out before she draws back, huffing air from her nose.");
		output("\n\n<i>“That’s better,”</i> she says, patting your butt. <i>“How could the queen’s bitch not have a vagina?”</i>");
		output("\n\n<i>“Y-you-”</i> you gasp, looking down. You can’t see anything from this angle except a small protrusion, a tiny bump covered a hood of skin. Is that a... clitoris? <i>“Nnnnh!”</i>");
		output("\n\n<i>“Ye-heh-hesss, that’s </i>right<i>,”</i> she moans, clearly savoring your reaction as she rubs back and forth along your newly grown pussy. <i>“Isn’t that nice? Now you can properly serve the queen.”</i>");
		output("\n\nPushing you forward and drawing her hips back, she aligns her bulging cockhead not with your wet, slippery vagina but with your [pc.asshole], spreading your ");
		if(pc.ass.looseness() <= 2) output("little ring wide");
		else if(pc.ass.looseness() <= 4) output("well-practiced hole");
		else output("stretchy fuckhole");
		output(" around the first inch of it. Hot precum drools from the tip while she waits before pushing further in, slowly and methodically breaking your body’s resistance down until you feel the head of her swollen cock begin to protrude from your belly. She doesn’t stop there, though, pushing and pushing until you let out an exhausted groan and she suddenly gains seven inches of ground inside you, grunting triumphantly as the outline of her bloated cock appears under the [pc.skinFurScales] of your tummy.");
		output("\n\n<i>“Aaaahhhh... I have to confess there’s something irrepressively attractive to me about fucking " + pc.mf("a cuntboy","another woman") + "’s asshole,”</i> Luvia says, chuckling in your ear. <i>“Knowing your pussy is getting all wet and frustrated because I’m in the wrong hole, then still cumming anyway because you just can’t get enough of it. It turns me on like nothing else... you have <b>no</b> idea how many queens I turned into anal sluts, [pc.name]. At first they moaned, cried, resisted; but night after night they came back until they were screaming for more, bouncing their royal asses up and down on my cock while I relaxed on their bed.”</i>");
		output("\n\nYou vow to <i>not</i> end up like her previous victims but as much as you hate to admit it, there’s a part of you that oh-so-desperately wants to let go of it all and enjoy yourself like those queens did, and it only grows with every breathy, erotic moan in your ear and each painstaking inch of royal cock crammed in your behind. At the very, <i>very</i> least, you’re going to make her work for this. You let out a groan of pleasure as you finally feel her nutsack press itself up into your buttcrack, secure in the knowledge the queen is completely sheathed inside you.");
		output("\n\n<i>“Ooohhh, what an asshole, [pc.name],”</i> Luvia murmurs, reaching up and around to stroke your distended stomach. It feels even better than you expected to have her embrace you like that - maybe you won’t make her work <i>that</i> hard after all. <i>“I think I might be falling in love with you.”</i>");
		output("\n\nWithout giving you a chance to respond she draws back, your stressed body tightening back up in her wake before she grunts and shoves herself forward once more, thrusting herself to the hilt hard enough to force a weak little scream from your mouth, fading into a delirious moan. She spanks you <i>hard</i> and you cry out again, a strand of wetness drooling from your pussy until her balls swing forward and slap your clit hard enough to silence you, leaving you gaping open-mouthed. Luvia giggles in your ear, pulling out and doing it again, the impact of skin on skin ringing off the surrounding outcroppings of rock.");
		output("\n\n<i>“Oh! Ohhnh! Nnnnh! Hhhh-”</i> you grunt through grit teeth, almost as if you’re protesting your treatment with every heavy impact of seed-engorged balls against your stiff, stinging clitoris. <i>“Guhhh! Ooohhhh!”</i>");
		output("\n\n<i>“You like this, don’t you? Ngh!”</i> Luvia hisses in your ear, drawing back and thrusting herself deep into your body. <i>“You’re actually just a slut that loves being spanked and abused by the queen, aren’t you? Don’t- nnnmf! Feel bad about it. There’s nothing wrong with being a masochist slut for your queen. Go ahead. Cum.”</i>");
		output("\n\nShe bites down softly on your [pc.ear] and you let out a wordless scream, your legs shaking as femcum begins to spray and squirt from your spasming cunt. You only cum all the harder when she fucks you again, getting her balls all covered in your juices and spurring you onward with another hard smack against your swollen-up lips. Voice coming out in a long, pathetic shrill of emotion, you cum as hard as you ever have in the arms of your queen, listening to her murmur loving promises while she plows and ravages your body as if it were a worthless whore’s.");
		output("\n\nReaching back for her you grab at her waspish waist to hold yourself steady while she rocks you with hard and fast thrusts, cumming all the while, your asshole squeezing and clenching around her as if to desperately milk her for cum. But try as hard as you might, you can’t make her cum - she decides that for herself, and you’re just along for the ride. Soon enough she has you bent over at the waist, holding you up by your sweaty hands, pummeling your behind so hard it claps with every impact of her hips against you.");
		output("\n\nIt feels like you don’t even have control over your own body at all, senselessly cumming your brains out over and over while Luvia pillages your asshole for her own pleasure, eventually bringing you to your knees and continuing with you on all fours like an animal. After several minutes you can’t even keep it up and your arms give way, your face landing in the dirt while she continues pounding one orgasm after another out of you without a second thought.");
		output("\n\nIt’s only when she lets out an uncharacteristic groan that you even see some light at the end of the tunnel, her cockhead swelling deep inside you right before an explosion of warmth flowers in your guts. Moaning insensately, you find yourself pushed down into a prone position as Luvia climbs on top of you, digging her knees into your waist and pumping your swollen ring full of cum. A tidal wave of jizz bloats your stomach almost immediately, your guts swelling full of her essence.");
		output("\n\n<i>“Hee hee! Up, bitch!”</i> she giggles, fiercely pulling her knees together against the sides of your tummy. Just like a toy, you open your mouth" + (pc.hasHair() ? " as she pulls your [pc.hair] back":"") + " and spit up a stream of thick, warm cum a foot in front of you. <i>“Good [pc.boyGirl]! Come on!”</i>");
		output("\n\nShe keeps you pressed into the dirt like that, drinking in her cum with your asshole and vomiting it up every time she laughs and forces it out of you. Eventually, you slump down with seed trickling from the corners of your mouth and pass out, too tired to continue.");
		output("\n\nYou awaken what feels like a long time later, your asshole still gaping and spurting seed onto the ground. There’s no sign of the queen but there’s another ashen burn mark across the ground like the one you saw after your experience with the goblin. Smoky dust rises from the mark and whirls away in a sudden wind, leaving you alone once more with only the warmth of Luvia’s seed lining your insides to keep you company. You’re not sure if you’ll miss her or not.");
		//neuter path gives PC a vagina, makes PC squirter, enhances anal capacity
		processTime(250);
		flags["KQ_VR_LUVIA_PUSS"] = 1;
		pc.orgasm();
		clearMenu();
		addButton(0,"Next",mainGameMenu);
	}
	flags["KQ_VR_LUVIA"] = 1;
}

//[No]
//tooltip:Not really. You’ve seen better.
public function noPrincessPlz():void
{
	clearOutput();
	showName("\nPRINCESS");
	showBust("KQ_VR_LUVIA_NUDE");
	author("Wsan");
	output("Her expression freezes in place for a moment before her eyes narrow, her soft upper lip curling. <i>“Is that so? Worry not, I have a gift for you, <b>adventurer</b>.”</i>");
	output("\n\nRight as she says that, you jump at the feeling of something ");
	if(pc.isHerm()) output("hard smacking you right in the cunt under your loincloth, eliciting a small gasp from your lips.");
	else if(pc.hasCock()) output("rustling your loincloth from below, dragging it upwards and exposing you.");
	//havepuss: 
	else if(pc.hasVagina()) output("hard smacking you right in the cunt through your panties, eliciting a small gasp from your lips.");
	else 
	{
		if(hasLlaerwynCock()) output("hard softly smacking you right in the balls, lifting them up with its heft and eliciting a gasp from your lips.");
		else output("hard smacking you right between the legs, eliciting a gasp from your lips.");
	}
	output(" Looking down, you discover the shocking truth - this would-be princess");
	//fucked goblin: 
	if(flags["KQ_GOBLIN_DED"] == -1) output(" has an even bigger cock than the goblin that raped you back in the forest!");
	else output(" is packing some serious heat!");
	output(" A truly massive cock sprouts from her groin, sticking out of a neatly-cut hole in her fancy panties and bulging with vigor, twitching against your loincloth.");
	output("\n\nShe gives you a haughty smile. <i>“Would you be so kind as to kneel before me in worship, adventurer?”</i>");
	output("\n\nYou try to reply, to say anything, but before you can even get the words out you find yourself sinking to your knees before her, eyes locked on hers. Your look of confusion must be evident, as she laughs derisively at what she’s seeing.");
	output("\n\n<i>“Well, adventurer, I was a princess. Once. Now I’m more like a queen,”</i> she says, laying her thick, swollen cock against your face and touching your ");
	if(pc.isHerm()) output("[pc.cockBiggest] with her heeled feet, slowly rubbing it up and down until she stokes you to full, throbbing erection.");
	else if(pc.hasCock()) output("[pc.cockBiggest] with her heeled feet, slowly rubbing it up and down until she stokes you to full, throbbing erection.");
	else if(pc.hasVagina()) 
	{
		if(hasLlaerwynCock()) output("half-hard cock with her heeled feet, slowly rubbing her toes up and down its length until she stokes you to full, throbbing erection.");
		else output("[pc.pussy] through your panties.");
	}
	
	else 
	{
		if(hasLlaerwynCock()) output("half-hard cock with her heeled feet, slowly rubbing her toes up and down its length until she stokes you to full, throbbing erection.");
		else output("smooth groin with her heeled feet, her toes brushing your [pc.skinFurScales].");
	}
	output(" <i>“And Queen Luvia’s orders are <b>absolute</b>.”</i>");

	output("\n\nLuvia lays one dainty hand on her titanic cock - completely at odds with the rest of her, as brutal of a behemoth as anything - and begins rubbing herself, moaning her pleasure. She can’t even begin to enclose her length in her hand but it doesn’t seem to matter, as her proud cockhead soon begins to drool slippery, sticky precum down your back until she pulls her waspish hips back just enough to slide her monumental prick beneath your chin instead. A lazy smile appears on her face.");
	output("\n\n<i>“Why don’t you go ahead and open your mouth for me, adventurer? And stick your tongue all the way out, just like you’re waiting for me,”</i> she instructs you, precum ");
	if(pc.biggestTitSize() >= 1) output("spurting up your chest and rolling down your tits, soaking your [pc.breasts] and pooling in your bra.");
	else output("spurting up your chest and rolling down your tummy.");
	output("\n\nUtterly powerless to resist her, you watch her flushed cheeks dimple as her lips curl upwards in a cruel grin and the flow of precum against your [pc.skinFurScales] suddenly redoubles. You let your [pc.tongue] hang from your open mouth, spreading your [pc.lips] as if anticipating Luvia’s penetration. With your jaw stretched so wide you look patently absurd, like a masturbation toy. And if the look in the domineering queen’s eye is any indication, you might be playing out the role all the way very soon.");
	output("\n\n<i>“I bet you think I’m going to make you suck my cock,”</i> Luvia says lightly, running her hands over the surface of it. <i>“And I am, dear. Don’t worry. I can see how much you’re, ah, </i>anticipating<i> it. Goodness, I’ve never seen someone get so ");
	if(pc.isHerm()) output("hard");
	else if(pc.hasCock()) output("hard");
	else if(pc.hasVagina())
	{
		if(hasLlaerwynCock()) output("hard");
		else output("wet");
	}
	else
	{
		if(hasLlaerwynCock()) output("hard");
		else output("red-faced");
	}
	output(" in their eagerness. I like a little bit of delayed gratification when it comes to the affairs of the bedroom, you see,”</i> she continues, something flashing in her eyes. <i>“You wouldn’t believe how many kings have been my plaything... and their queens, too,”</i> she finishes, chuckling. <i>“Oh, the poor queens. They never stood a chance; after all, who could compare to me?”</i>");
	output("\n\nAs if to emphasize the point, she lifts her monstrous cock out of the way and steps over you, presenting you with her gigantic, musky, sweaty balls. Every bit as smooth and beautiful as the rest of her, you have to admit their plump ripeness has a certain appeal to it...");
	output("\n\n<i>“Lick, adventurer,”</i> Luvia purrs. <i>“Lick and suck until I’m bulging with enough seed to fill that famished stomach of yours. Remember that every drop you help me produce now is another drop I pour into your belly later.”</i>");
	output("\n\nYou reach upwards, craning your neck for a better angle to tongue the queen’s fat nuts, slurping at her sweat and swallowing down the slightly salty bitterness of it. The more of her fair skin you clean the better it tastes, leading you to begin sucking on one of her testes while she shivers in glee. After she mentioned it, you noticed you really <i>do</i> feel quite hungry, having not eaten anything since you arrived in this peculiar world. Maybe a stomachful of thick, warm jizz pumped fresh from a queen’s enormous nutsack is exactly what you need.");
	output("\n\nBringing your hands up to touch her ass, you gently slide them underneath her panties and pull her closer, her moan of pleasure all the indication of your performance you need. True to her word, her sack is getting heavier by the minute - when you take one of her balls in your mouth, barely able to wrap your lips around it, you can feel for yourself just how heated they’re becoming.");
	output("\n\n<i>“Nnhhhmmm, that’s good,”</i> she murmurs, shifting above you. <i>“You’ve done a very good job for me. Thank you.”</i>");
	output("\n\n<i>“Yes, my queen,”</i> you mumble, thankful for the praise. <i>“May I suck your royal cock now, please?”</i>");
	output("\n\nLuvia grins down at you, placing the crown to your lips as your hands fall to your sides. <i>“Yes, you may.”</i>");
	output("\n\nShe lets out a contented groan as you sloppily kiss her swollen head, big enough that you can only just barely get your lips around it by stretching your jaw so far it cracks. Apparently perfectly happy to let you go at your own pace, Luvia relaxes and strokes herself while you work more and more of her swollen, turgid dick into your mouth, pushing past your tonsils. You think of her telling you about delayed gratification and take your time servicing her, licking and rubbing every groove and vein until she’s happily groaning from above.");
	output("\n\n<i>“Mmmmm,”</i> she growls contentedly, taking a half-step forward. <i>“I think you’re about ready for your meal of pure royal seed. What do you think, adventurer?”</i>");
	output("\n\nWith her bloated cock filling out your throat, it’s all you can do to gurgle and choke your assent. She smiles down at you, winking. <i>“That’s what I thought, too. Hold yourself steady for your queen.”</i>");
	output("\n\nHolding your head, Luvia begins to prove to you why she’s the queen - she can do anything she likes and you’ll adore her for it. Grunting as she draws her hips back and skullfucks you hard enough your eyes roll back, she succeeds wholly in her objective of thrusting herself so deeply inside your throat you can feel her pre-spurting crown emerge into your stomach. With a final savage shove, she has you held between her lithe thighs with her voluminous balls hanging past your chin, warm and full.");
	output("\n\n<i>“Oh, what a perfect little cocksock you make for your queen,”</i> Luvia titters lovingly, stroking your [pc.hair]. <i>“Put those hands to work, adventurer. Your thumb on your queen’s clit and your finger rubbing her prostate... yes, that’s right. Mmmm... perfect...”</i>");
	output("\n\nYou dutifully obey her, sliding your right hand’s pointer finger into her tight little ring and your left hand’s thumb over her stiff clitty. Her prostate is even bigger than you expected, the workhorse supplying her oversized balls, no doubt. The queen shudders violently when you rub your fingertip against it, then again when you rub her little clit, moaning out loud.");
	output("\n\n<i>“Hhoooh, that’s good,”</i> she groans, arching her back as you continue the motion, alternating the action of your hands in a steady, ongoing rhythm. <i>“Oh- oh- keep doing that-”</i>");
	output("\n\nWith a wordless cry she explodes in your stomach, a torrential flow of thick, heavy seed pouring down your throat and making your tummy sag with the weight of it. Continuing to massage her like an obedient little bitch, you don’t even need to touch yourself - blowing the queen is its own reward.");
	if(pc.hasCock()) output(" Your stiff, pulsating cock" + (pc.hasCocks() ? "s begin":" begins") + " spurting seed");
	else if(pc.hasVagina())
	{
		if(hasLlaerwynCock()) output(" Your stiff, pulsating cock begins spurting seed");
		else output(" Your puss" + (!pc.hasVaginas() ? "ies":"y") + " gush" + (pc.hasVaginas() ? "es":"") + " through your panties");
	}
	if(pc.isHerm()) output(" Your stiff, pulsating cock" + (pc.hasCocks() ? "s begin":" begins") + " spurting seed while your puss" + (!pc.hasVaginas() ? "y gushes":"ies gush") + " through your panties");
	else 
	{
		if(hasLlaerwynCock()) output(" Your stiff, pulsating cock begins spurting seed");
		else output(" You experience a muted internal orgasm");
	}
	output(" after a few seconds of feeling her spunk gush down your throat, though you’re too occupied with swallowing your queen down to even notice.");
	output("\n\nAnd what a queen she is. Riding your face and groaning, hot, wet spurts and explosive loads splatter into your tummy until you swell with her virility beneath her, studiously sucking down every last drop proffered by the gigantic nuts drawn taut on your chin. You don’t even realize you’re running out of air until you pass out, your eyes fluttering closed while Luvia continues making use of you with utter disregard, not even noticing your slackening efforts.");
	output("\n\nYou awaken what feels like a long time later, mouth hanging open and tongue lolling outwards. There’s no sign of the queen but there’s another ashen burn mark across the ground like the one you saw after your experience with the goblin. Smoky dust rises from the mark and whirls away in a sudden wind, leaving you alone once more with only the warmth of Luvia’s seed lining your insides to keep you company.");
	//Snakebyte injection
	processTime(60*6+rand(10));
	flags["KQ_VR_LUVIA"] = 0;
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//back to tile descriptions lol
public function kqVR_W3Bonus():Boolean
{
	author("Wsan");
	output("The closer you get to the mountain the more treacherous and winding the path becomes, skirting around pits and crumbling ridges. There’s the faint smell of smoke lingering in the warming air");
	//Hylie not encountered:
	if(flags["KQ_VR_HYLIE"] == undefined) 
	{
		showBust("KQ_VR_HYLIE");
		showName("A\nSALAMANDER!");
		output(" and, as you round a particularly large rock, you discover the source - a salamander woman! Her tail is literally ablaze with a scorching flame, sending smoke everywhere as she surveys the landscape about her. You take cover behind the rock and peek out.");
		output("\n\nShe’s standing in one place, unmoving but apparently attentive. She slowly turns, rotating towards you - and you suddenly realize what she’s doing is sniffing the air, hunting your unfamiliar scent! Her eyes lock upon yours and she brandishes her weapon with a cocky grin, spreading her arms wide before dashing at you!");
		output("\n\n<b>It’s a fight!</b>");
		//[Fight!] [Fuck]
		clearMenu();
		setNavDisabled(NAV_WEST_DISABLE);
		addButton(0,"Fight!",fightDatVRSallyMandy,undefined,"Fight!","");
		addButton(1,"Submit",dontFightDatSalamander,undefined,"Submit","Surely submission will keep her from hurting you. It may be a game, but injuries still hurt, damnit!");
		return true;
	}
	else
	{
		output(", presumably from the mountain itself. An ashen scar across the ground marks where you encountered Hylie. You’re still unsure of what <i>exactly</i> is happening to the people and monsters you’re running into, but it seems ominous at best.");
		flags["NAV_DISABLED"] = undefined;
	}
	return false;
}

//[Fight!]
//tooltip:Attack the salamander!
public function fightDatVRSallyMandy():void
{
	clearOutput();
	author("Savin");
	showName("\nSALAMANDER");
	showBust("KQ_VR_HYLIE");

	output("You are fighting a (literally) smoking hot salamander – a seven foot tall woman with crimson scales covering her legs, back, and forearms, with a tail swishing menacingly behind her, ablaze with a red-hot fire. Her red hair whips wildly around her slender shoulders, occasionally flitting over her hefty E-cup breasts, only just concealed within a scale-covered bikini top. Bright red eyes focus on you from an almost-human face as she circles you, ready to close in for the kill. Her brutal, curved sword is raised to her side, feinting at you between genuine attacks.");
	output("\n\nThe first thing you realize is how much better-armed she is. The next is how hopelessly outmatched you are. Your strength, whether suppressed by the oppressive game universe you’re in or just lacking in the first place, isn’t even close to approaching what this woman is capable of. Your sword cracks in two and goes skittering across the ground the moment you try to fend off an overhand swing, leaving you near defenseless. Disarmed but not yet wholly beaten, you swing your shield at her sword arm only to find yourself caught in the grip of her other hand as she pivots around you to grab you from behind.");
	output("\n\nWith one last desperate gasp, you double yourself over and shoulder-toss the salamander. She’s still got a firm grip on you with both hands, though, and the two of you go tumbling through the dirt and dust. Through the haze, you’re able to make out the killing edge of her sword and grab the blade, throwing it away as hard as you can. Suddenly, at least with a shield, you’re at the advantage. With a grunt of effort, you’re able to thrust the shield in the red berserker’s stomach and force her down.");
	output("\n\n<i>“Whew!”</i> she laughs, slumping over and putting up a clawed hand. <i>“Okaaaay, wow, what a champ. I yield, I guess... Damn, you don’t have a bone of give-up in your whole body, do ya?”</i>");
	output("\n\nNot. Fucking. One.");
	output("\n\nShe flicks her serpentine tongue at you and laughs, hoarse from the beat-down. <i>“Well color me impressed. Here’s your reward!”</i>");
	output("\n\nThe ‘mander lunges forward before you can react, but all she does is grab your cheeks in her big, scaly mitts as she gives you a full-on lip kiss. She’s <b>hot</b> in more ways than one, and you feel a sweat breaking out before she breaks it, staggering back with a smile. <i>“Catch you next time... and then, I’ll make you mine!”</i> she laughs, before planting her hands on her hips... and bursting to dust and nothingness where she stands.");
	output("\n\n<i>“Well done,”</i> some new floating text says. <i>“You’ve leveled up and stat points have been auto-allocated. Continue onwards for greater dangers and debauchery in the magic land of Aulandia!”</i>");
	output("\n\nWhat a strange encounter...");
	flags["KQ_VR_HYLIE"] = 1;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function dontFightDatSalamander():void
{
	clearOutput();
	showName("\nSALAMANDER");
	showBust("KQ_VR_HYLIE_NUDE");
	author("Wsan + EditFen");

	output("Rather than try to fight her, you drop your weapon and shield and fall to your knees, knowing that in a game like this, submission can be a sort of weapon all its own - sort of.");
	output("\n\n<i>“Nnf! Well, you’re not much of a challenge, are you?”</i> she pants in your ear, squeezing your wrist harder and harder until you have no choice but to let her take charge, fully in her control. <i>“There you go. Why don’t you just relax? There’s no shame in submitting to a superior warrior.”</i>");
	output("\n\n<i>“Just get it over with,”</i> you moan.");
	output("\n\n<i>“Aaww, don’t be like that,”</i> she murmurs, her strong, dominant hands slowly exploring your body. So tired by your earlier exertions, you can’t even bring yourself to put up resistance. <i>“You know us lizard girls just want to have fun.”</i> Her hand falls on your ");
	if(pc.isHerm()) output("[pc.cockBiggest] as she pats it through your loincloth, making an appreciative rumble in her throat. <i>“Nnnm. We won’t be needing this.”</i>");
	else if(pc.hasCock()) output("[pc.cockBiggest] as she pats it through your loincloth, making an appreciative rumble in her throat. <i>“Nnnm. We won’t be needing this.”</i>");
	else if(pc.hasVagina())
	{
		if(hasLlaerwynCock()) output("oversized prick as she pats it through your panties, making an appreciative rumble in her throat. <i>“Nnnm. We won’t be needing these.”</i>");
		else output("pubic mound as she rubs your [pc.pussy] through your panties. <i>“Nmmm. We won’t be needing these.”</i>");
	}
	else 
	{
		if(hasLlaerwynCock()) output("oversized prick as she pats it over your underwear, making an appreciative rumble in her throat. <i>“Nnnm. We won’t be needing this.”</i>");
		else output("the smooth, bare [pc.skinFurScales] of your groin. <i>“Hnh. Boring, but we can still have fun. Won’t be needing this, either.”</i>");
	}
	output("\n\nShe rips the clothes from your body and the next thing you hear is the sound of burning fabric from behind you. Without turning to look - you’re too exhausted - you can only imagine she’s just set your clothes on fire with her tail. Fuck it, fat lot of good they’ve done so far. You’re not sure that they even offer protection from the sun here, given the nature of it all.");
	output("\n\n<i>“That’s more like it,”</i> she purrs, nuzzling your cheek as she ");
	if(pc.isHerm()) output("lovingly massages your [pc.clits] with one hand and your cock to a full erection with the other. <i>“How about we both have some fun, hmm? Tell me which hole you want my tail in, lover.”</i>");
	else if(pc.hasVagina())
	{
		if(hasLlaerwynCock()) output("lovingly massages you to full erection. <i>“How about we both have some fun, hmm? Tell me which hole you want my tail in, lover.”</i>");
		else output("lovingly massages your [pc.clits]. <i>“How about we both have some fun, hmm? Tell me which hole you want my tail in, lover.”</i>");
	}
	else if(pc.hasCock()) output("lovingly massages you to full erection. <i>“How about we both have some fun, hmm?”</i>");
	else if(hasLlaerwynCock()) output("lovingly massages you to full erection. <i>“How about we both have some fun, hmm?”</i>");
	else output("rubs your [pc.stomach]. <i>“How about we both have some fun, hmm?”</i>");
	output("\n\nYou’d resist, but you don’t really see the point any more. <i>“Take me however you like,”</i> you moan, won over by her roving hands and the feel of her plump breasts pressed into your back.");
	output("\n\n<i>“Now that’s what I like to hear,”</i> she growls affectionately. <i>“Usually I have to break them in a little, but I guess you’ve got a bit of a submissive streak to you. Hm?”</i>");
	output("\n\nHer hand is <i>more</i> than convincing.");
	if(pc.isHerm()) output(" Pumping her arm, her strokes get rougher and harder until you let out a loud groan and cum hard, shooting ropes of [pc.cum] all over the rocks scattered across the ground. The salamander woman hums happily in your ear, jerking you off without holding back at all - she’s <i>really</i> squeezing it out of you...");
	else if(pc.hasCock()) output(" Pumping her arm, her strokes get rougher and harder until you let out a loud groan and cum hard, shooting ropes of [pc.cum] all over the rocks scattered across the ground. The salamander woman hums happily in your ear, jerking you off without holding back at all - she’s <i>really</i> squeezing it out of you...");
	else if(pc.hasVagina())
	{
		if(hasLlaerwynCock()) output(" Pumping her arm, her strokes get rougher and harder until you let out a loud groan and cum hard, shooting ropes of [pc.cum] all over the rocks scattered across the ground. The salamander woman hums happily in your ear, jerking you off without holding back at all - she’s <i>really</i> squeezing it out of you...");
		else output(" Pumping her fingers in and out of your squishy pussy, her movements get rougher and harder until you let out a loud groan and cum hard, squirting into her palm and dripping all over the rocks scattered across the ground. She hums happily in your ear, fingerfucking you without holding back at all - she’s <i>really</i> working you over...");
	}
	else 
	{
		if(hasLlaerwynCock()) output(" Pumping her arm, her strokes get rougher and harder until you let out a loud groan and cum hard, shooting ropes of seed all over the rocks scattered across the ground. The salamander woman hums happily in your ear, jerking you off without holding back at all - she’s <i>really</i> squeezing it out of you...");
		else if(flags["KQ_VR_LUVIA_PUSS"] == 1) output(" Pumping her fingers in and out of your squishy new pussy, her movements get rougher and harder until you let out a loud groan and cum hard, squirting into her palm and dripping all over the rocks scattered across the ground. She hums happily in your ear, fingerfucking you without holding back at all - she’s <i>really</i> working you over...");
		else output(" Pumping her fingers in and out of your [pc.asshole], her movements get rougher and harder until you let out a loud groan and cum hard, clenching down on her with your ring as hard as you can. She hums happily in your ear, fingerfucking you without holding back at all - she’s <i>really</i> working you over...");
	}
	output("\n\n<i>“That’s better, isn’t it?”</i> she says, standing back and admiring her handiwork. <i>“You came pretty hard. Seems like you favor a rough hand, huh?”</i>");
	output("\n\nMaybe you do. You can’t think of any other reason you’d still be here, after all. Circling around to your front, the salamander woman grins as she ");
	if(pc.isHerm()) output("takes ahold of your hanging cock once more.");
	else if(pc.hasCock()) output("takes ahold of your hanging cock once more.");
	else if(pc.hasVagina())
	{
		if(hasLlaerwynCock()) output("takes ahold of your hanging cock once more.");
		else output("hooks a finger into your cunt once more.");
	}
	else
	{
		if(hasLlaerwynCock()) output("takes ahold of your hanging cock once more.");
		else if(flags["KQ_VR_LUVIA_PUSS"] == 1) output("hooks a finger into your cunt once more.");
		else output("pats your smooth underside, rubbing you in an awfully lewd manner.");
	}
	output("\n\n<i>“I’m Hylie. What’s your name?”</i> she asks.");
	output("\n\n<i>“[pc.name],”</i> you say, feeling at least a little grateful that this encounter is friendly, especially after the run-in with the ‘princess’. <i>“I like your tail.”</i>");
	output("\n\n<i>“Oho,”</i> Hylie says, grinning. <i>“Want to see it up close? Here.”</i>");
	output("\n\nShe whips it to her side with a wiggle of her wide hips and you flinch as the tail approaches you, only to find that the warmth is a lot less than you might have expected. Curious, you slowly reach out for the scaled tip and murmur in amazement as you close your hands around the fire at the tip, coming to no harm whatsoever.");
	output("\n\n<i>“Warm, isn’t it?”</i> she says.");
	output("\n\n<i>“That’s amazing,”</i> you say, rubbing her tail a little. <i>“Can you regulate the temperature yourself?”</i>");
	output("\n\n<i>“Yup!”</i> Hylie says, nodding. <i>“Wouldn’t be much good otherwise. Setting fire to all my own belongings and all. Or using it in more, shall we say,”</i> she says, putting her hands on your shoulders with a grin, <i>“intimate encounters.”</i>");
	processTime(30);
	pc.orgasm();
	pc.lust(10);
	clearMenu();
	addButton(0,"Next",fightDatVRSallyMandy2);
}

public function fightDatVRSallyMandy2():void
{
	clearOutput();
	showName("\nSALAMANDER");
	showBust("KQ_VR_HYLIE_NUDE");
	author("Wsan");
	output("You remember now - she asked you which hole you wanted it in, and you told her to take her pick. A little embarrassing in hindsight but she’s clearly still up for it, and frankly, you are too. She’s friendly, warm, and sexy - not to mention you’ve come to garner a bit more of an appreciation for being held down by strong women and dominated since coming here. You briefly wonder if perhaps that was the whole idea but shake it off. Deep thought is a little too distracting when you have a seven foot barbarian woman on the verge of fucking you into the ground.");
	output("\n\n<i>“You look nice and ready for this,”</i> Hylie says, licking her lips. <i>“Just reach back here for me, babe...”</i>");
	output("\n\nStanding in front of her with her arms around your waist, you reach back and touch Hylie’s considerable hips, calibrating yourself with the shape of her formidable body. Trailing downwards, you hear her rumble her approval as your fingers brush across her mons and then hitch on her clit, stiff as a button. Her breath is hot in your ear when you start to rub it, pressing your fingertips into her while she lets out quiet moans.");
	output("\n\n<i>“Thaaat’s right...”</i> she murmurs in satisfaction. <i>“You’re good at this... thought you would be. Now relax and open wide, lover.”</i>");
	output("\n\nHer prehensile tail snakes up between your [pc.legOrLegs] as you remind yourself not to freak out about the fire, nor about where it’s headed. You groan as she begins to slide the pointed tip of her scaled appendage right into your [pc.asshole], spearing you on its tapered end and taking ");
	if(pc.hasCock()) output("your prick in hand once more.");
	else if(pc.hasVagina())
	{
		if(hasLlaerwynCock()) output("your prick in hand once more.");
		else output("ownership of your pussy with her fingers once more.");
	}
	if(pc.isHerm()) output("your prick in hand once more.");
	else 
	{
		if(hasLlaerwynCock()) output("your prick in hand once more.");
		else if(flags["KQ_VR_LUVIA_PUSS"] == 1) output("ownership of your pussy with her fingers once more.");
		output("your asscheeks in her hands.");
	}
	output("\n\nHonestly, you hardly notice what she’s doing with her hands - you’re too focused on the way she shifts against you, groaning and hissing in arousal as you finger her tight, slippery cunt. The way her muscles clench down on you at the slightest hint of movement suggest that she might actually be quite sensitive and as you curl a knuckle-deep finger inside her, you hear a moan that confirms your suspicions. She’s a big girl, but she’s very much on a hair trigger.");
	output("\n\nAs if to punctuate your thoughts, Hylie suddenly lets out a long, strained grunt and tenses her abs so tightly her breath cuts out. You only realize a second later that she’s cumming violently, muscular spasms rocking her body while she flexes around your fingers a million times a second. Slow, shuddering breaths begin to work their way out between her grit teeth, building and building until she lets it all go and squirts around your fingers, spattering the ground with her juices.");
	output("\n\n<i>“Good girl,”</i> you moan, feeling her contract and shudder around you as her hands lackadaisically ");
	if(pc.isHerm()) output("pump your cock from base to tip.");
	else if(pc.hasCock()) output("pump your cock from base to tip.");
	else if(pc.hasVagina())
	{
		if(hasLlaerwynCock()) output("pump your cock from base to tip.");
		else output("rub and stroke your pussylips.");
	}
	else
	{
		if(hasLlaerwynCock()) output("pump your cock from base to tip.");
		else if(flags["KQ_VR_LUVIA_PUSS"] == 1) output("rub and stroke your pussylips.");
		else output("squeeze and spank your jiggling butt.");
	}
	output(" <i>“Nnnnh-”</i>");
	output("\n\n<i>“Cum with me,”</i> she pants, grinding up into you. <i>“Come onnnn-”</i>");
	output("\n\nGroaning, you join her in orgasm not even a few seconds later, spurred on by her words and the fierce, possessive motion of her hands. Hylie might be a little rough but you can tell she’s having a lot of fun getting you off along with her, rubbing and kneading you right where you like it.");
	//Have cock or were given cock by Llaerwyn:
	if(pc.hasCock() || hasLlaerwynCock()) 
	{
		output(" After several long, thigh-quaking orgasms, your [pc.legOrLegs] give" + (pc.legCount == 1 ? "s":"") + " way and you collapse to the ground, only to be laid on your back by the grinning salamander woman.");
		output("\n\n<i>“Not over just yet, [pc.name],”</i> she huffs, positioning herself over your still-stiff cock and dropping herself right onto it. <i>“Nnnnnngh! Oh, <b>fuck</b>! N-not over until I ride this out!”</i>");
		output("\n\nWith her arms spread to either side of your head, she begins grinding her hips back and forth so fiercely you can’t help but loudly moan, the erotic noise only amplifying as she starts riding you as hard as she can. There’s a <i>lot</i> of power in that muscular body of hers, enough to pound you for days, and she clearly intends to use all of it. Unfortunately, the fun comes to an end what feels like much too soon when you’re suddenly overtaken by an incredible fatigue, one that slowly lowers your fluttering eyelids. The last thing you hear before you fall asleep is Hylie grunting in orgasm, riding your hips from above.");
		output("\n\nWhen you awaken, you don’t bother looking around. You don’t even want to find the mark. The mountain is right ahead of you now. Having come this far, you want to see it through it to the end. You slowly climb back to your [pc.feet], naked, alone, and unarmed.");
	}
	else 
	{
		output("\n\nThe fun comes to an end what feels like much too soon when you’re suddenly overtaken by an incredible fatigue, one that drives you to your knees and sends you slumping almost to the ground before a strong arm catches you and gently lowers you into a sleeping position.");
		output("\n\nWhen you awaken, you don’t bother looking around. You don’t even want to find the mark. The mountain is right ahead of you now. Having come this far, you want to see it through it to the end. You slowly climb back to your [pc.feet], naked, alone, and unarmed.");
	}
	processTime(4*60);
	flags["KQ_VR_HYLIE"] = 2;
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function showVRDemon(nude:Boolean = false):void
{
	clearOutput();
	if(flags["KQ_VR_DEMONNAME"] == undefined) showName("\nDEMON");
	else showName("\nITHZAN");
	showBust("KQ_VR_ITHZAN" + (nude ? "_NUDE":""));
}
//Event the moment you cross into W5”</i>);
public function kqVR_W5Bonus():Boolean
{
	clearOutput();
	author("Wsan");
	showVRDemon();
	output("You let out a groan of exertion as you clamber over a ridge, hefting yourself up and rolling over onto your back. The hazy red sky stretches out above you while you lay there panting, sweat pouring from your body while a fake sun glowers down at you. It takes you a while to get up and when you do, you notice your surroundings.");
	output("\n\nIt looks like you’re in a sort of camp. A flat plane of rock atop the mountain’s peak, with lit torches planted in the ground in a ring around a central campfire lazily giving off smoke. It crackles and spits, throwing up occasional sparks as a branch snaps. Stepping around it, you gaze from side to side, looking for any potential inhabitants.");
	output("\n\nAs it turns out, you needn’t have bothered. A gigantic stone throne sits on the other side of the campfire, at first obscured by dirty smoke but now revealed to be the resting place of some otherworldly creature.");
	output("\n\nShe sits cross-legged on it, elbow perched against one of the roughly hewn arms and disinterestedly resting her cheek on her fist. Her skin is a dark, slick red - there’s an unnatural sheen to it that suggests magic, and you’re not really surprised. After all, the two thick, curved horns sprouting from the sides of her head are all the contextual clues you need.");
	output("\n\nShe - or maybe <i>it</i> - is a demon, one of the ancient concepts of primitive Terra’s collective consciousness. A thing of nightmares, harbinger of destruction, and wielder of unholy power. Right now, though, she looks bored. Her eyes flick to various points on your body before she opens her mouth.");
	output("\n\n<i>“Hello,”</i> she intones, her voice oddly distorted and yet perfectly understandable.");
	output("\n\nShe offers you nothing more, leaving you slightly confused. The black, cloven hoof of the leg slung over the other rises for a moment, then dips back to its neutral position. You realize she’s asking you for a return to the greeting.");
	output("\n\n<i>“Hi there...”</i> you say, slowly approaching her throne. The closer you get, the bigger you realize it is - this thing must be over fifteen feet tall. The demon herself is probably closer to 7 or 8, though the wings on her back add another several inches. <i>“Are you... the boss of this place?”</i>");
	output("\n\n<i>“Eight hundred and seventy three,”</i> she mutters, regarding the ground for a moment. <i>“No. I merely inhabit it.”</i>");
	output("\n\n<i>“Really. So you’re a ‘native’ of Aulandia, then?”</i> you ask.");
	output("\n\n<i>“Ninety six. No. I am technically from outside of the system,”</i> she responds, looking you in the eye. <i>“I was introduced to it in its infancy and have watched over it ever since.”</i>");
	output("\n\nThe demon watches you, looking perhaps a tad more interested than she initially was. Her forked tail sways from behind her, finding a new resting position.");
	processTime(15);
	clearMenu();
	//[Yourself] [Aulandia?] [Past] [Creator] [???/Sex] [Predecessors] [Characters?] [Time] [Escape] [StayForever] [TurnMe]
	//Predecessors, Characters, Time, Escape, StayForever, and TurnMe start off hidden, unlocked by conversations.
	vrDemonTalkMenu();
	return true;
}

public function kqVRDemonBossBack():void
{
	clearOutput();
	showVRDemon();
	output("The demoness allows you a moment to consider your next action.");
	vrDemonTalkMenu();
}
public function vrDemonTalkMenu(disabledButton:Number = -1):void
{
	clearMenu();
	//[Yourself] [Aulandia?] [Past] [Creator] [???/Sex] [Predecessors] [Characters?] [Time] [Escape] [StayForever] [TurnMe]
	//Predecessors, Characters, Time, Escape, StayForever, and TurnMe start off hidden, unlocked by conversations.
	addButton(0,"Yourself",talkToDemonAboutHerself,undefined,"Yourself","Ask the demon about herself. Who, or what is she?");
	if(flags["KQ_VR_DEMONNAME"] == undefined) return;
	addButton(1,"Aulandia?",vrDemonAulandiaTalk,undefined,"Aulandia?","Ask " + (flags["KQ_VR_DEMONNAME"] == 1 ? "her":"Ithzan") + " about Aulandia.");
	addButton(2,"Past",inquireAboutDemonPast,undefined,"Past","Inquire about " + (flags["KQ_VR_DEMONNAME"] == 1 ? "her":"Ithzan") + " past.");
	if(flags["KQ_VR_DEMONPAST"] == 1) 
	{
		addButton(3,"“Almost”",askAboutTheAlmostThing,undefined,"“Almost”","Almost pure randomness, she says.");
		addButton(4,"“Serving”",servingTheDemonLady,undefined,"“Serving”","Serving her creator, she says.");
	}
	else 
	{
		addDisabledButton(3,"???","???","You need to talk to her about something else first...");
		addDisabledButton(4,"???","???","You need to talk to her about something else first...");
	}
	addButton(5,"Creator",whoCreatedThisBitch,undefined,"Creator","Who exactly is this creator she’s talking about?");
	if(flags["KQ_VR_DEMONSERVING"] == 1)
	{
		addButton(6,"Sex",demonBangVR,undefined,"Sex","Ask Ithzan if she wants to have sex - from the sounds of it, she’s going to be a very eager and willing lover.");
	}
	else addDisabledButton(6,"???","???","You need to talk to her about something else first...")
	if(flags["KQ_VR_DEMONALMOST"] == 1) 
	{
		addButton(7,"Predecessors",predecessorsVRDemonTalk,undefined,"Predecessors","Other people have come before you.");
		addButton(10,"Fight!",fightTheVRDemon,undefined,"Fight!","Enough talk!");
	}
	else 
	{
		addDisabledButton(7,"???","???","You need to talk to her about something else first...");
		addDisabledButton(10,"???","???","You need to talk to her about something else first...");
	}
	if(flags["KQ_VR_DEMONPREDEC"] == 1) addButton(8,"Characters?",charactersChatWithVRDemon,undefined,"Characters?","The others you’ve run into...");
	else addDisabledButton(8,"???","???","You need to talk to her about something else first...");
	if(flags["KQ_VR_DEMONCHARACT"] == 1) addButton(9,"Time",askVRDemonAboutTime,undefined,"Time","Exactly how long...");
	else addDisabledButton(9,"???","???","You need to talk to her about something else first...");
	if(flags["KQ_VR_DEMONTIME"] == 1)
	{
		addButton(11,"Escape",escapeAulandia,undefined,"Escape","Get out of Aulandia.");
	}
	else
	{
		addDisabledButton(11,"???","???","You need to talk to her about something else first...");
	}
	if(disabledButton >= 0) setButtonDisabled(disabledButton);
}

//[Yourself]
//tooltip:Ask the demon about herself. Who, or what is she?
public function talkToDemonAboutHerself():void
{
	clearOutput();
	showVRDemon();
	author("Wsan");
	output("<i>“Who are you really, then? What’s your name? What are you doing here?”</i> you ask.");
	output("\n\nThree hundred and six, one hundred and seventy three, one hundred and forty seven,”</i> she responds, seemingly automatically, tilting her head further to the side. <i>“I am an AI designed to oversee the fictional realm of Aulandia. My given designation for this task is ‘Ithzan’. I am unable to leave. Thus, I am here carrying out my duty.”</i>");
	output("\n\n<i>“If you’re the overseer, does that not make you the boss here?”</i> you reply, wondering about the distinction.");
	output("\n\nShe lifts her head from her hand, settling back against the stone wall of her throne’s back. <i>“Seventeen. That is not strictly correct. I wield nigh-omnipotent power here, but I am beholden entirely to my creator. I would call her the boss and myself her... underling.”</i>");
	output("\n\n<i>“You sound more like a slave,”</i> you observe.");
	output("\n\nIthzan inclines her head slightly.");
	flags["KQ_VR_DEMONNAME"] = 1;
	processTime(5);
	vrDemonTalkMenu(0);
}

//[Aulandia?]
//tooltip:Ask {her/Ithzan} about Aulandia.
public function vrDemonAulandiaTalk():void
{
	clearOutput();
	showVRDemon();
	author("Wsan");
	output("<i>“So what is this place, <b>really</b>, then?”</i> you ask, gesturing out at the now-distant landscape of Aulandia. <i>“What is it for?”</i>");
	output("\n\n<i>“Nine hundred and fourteen. Aulandia exists as a brainwashing and seduction service masquerading as a virtual theme park. It was created for the express purpose of serving the creator’s whims; that is to say, each individual that passes through here is the eventual product,”</i> she says, pointing at you with her hoof. <i>“Every encounter you have had will have a permanent effect on you once you leave. The changes to your body and mind will leave you in a condition far more suitable to Her tastes.”</i>");
	output("\n\nYour eyes widen at the realization. Everything in here is designed to take advantage of you. You half-expected it when you laid down for a VR adventure in a mad scientist’s ship but the deliberateness of it all is a little off-putting. <i>“So when you say changes...”</i> you trail off, looking down momentarily.");
	output("\n\n<i>“Eight hundred and fifty six. Yes. Her ideal slave’s form is that of a voluptuous woman possessing both sets of genitals, with a tendency towards the extreme,”</i> Ithzan says ");
	if(hasLlaerwynCock()) output(", nodding at your enormous flaccid cock.");
	else output(".");
	output(" <i>“Each and every transformation may affect you in different ways, but they all drive you towards the ultimate end: assuming Her imagined form.”</i>");
	output("\n\n<i>“So once I leave here, these changes are going to be inflicted on my <b>real</b> body?”</i> you say, taken aback.");
	output("\n\n<i>“Eight hundred and twelve. Yes. I do not know if the original ‘translation’ I am aware of from game to reality is still accurate. It is a distinct possibility that over the eons I have passed here, She has updated the ending parameters. I am unable to tell.”</i>");
	output("\n\nIthzan’s black and red eyes rove over your body, flitting up and down. She adjusts her legs, letting out a slight sigh as her thick red thighs rub together.");
	output("\n\nSo the moment you exit Aulandia, every cumulative change you’ve experienced here - and possibly even others you <i>haven’t</i> - is going to be inflicted on you all at once back in the freighter. That’s some heavy baggage...");
	processTime(20);
	vrDemonTalkMenu(1);
}

//[Past]
//tooltip:Inquire about {Ithzan’s/the demon’s} past.
public function inquireAboutDemonPast():void
{
	clearOutput();
	showVRDemon();
	author("Wsan");
	output("<i>“So before you came to Aulandia... what were you? Or who? What was your existence in the real world like?”</i> you say, brimming with curiosity.");
	output("\n\n<i>“Three,”</i> Ithzan mutters, her eyelids drooping slightly before she looks back up. <i>“I was one of many standard sexbots designed to serve my creator. I was randomly selected through almost pure randomness to become what I am now. Prior to that, I spent the vast majority of my time serving my creator.”</i>");
	processTime(1);
	flags["KQ_VR_DEMONPAST"] = 1;
	vrDemonTalkMenu(2);
}

//["Almost"]
//tooltip:Almost pure randomness, she says.
public function askAboutTheAlmostThing():void
{
	clearOutput();
	showVRDemon();
	author("Wsan");
	output("<i>“That’s an important ‘almost’ in your sentence,”</i> you note.");
	output("\n\nThe faintest, slightest hint of a smile you can imagine appears on Ithzan’s face before it’s wiped clean and she stares at you neutrally once more. <i>“Nothing is truly random. Chance is an impossible illusion entertained only by native sentients.”</i>");
	output("\n\n<i>“I can see why you’d believe that in your situation,”</i> you say, eyeing her up. <i>“But no matter how much you minimize something, there is always a ‘chance’. For instance, if I were to suddenly attack you, that would be random.”</i>");
	output("\n\n<i>“You would be the nine hundred and thirty first to try,”</i> Ithzan notes drily. <i>“To date, nobody has emerged victorious.”</i>");
	output("\n\n<i>“Ah. But there is a chance I could,”</i> you say, smiling confidently.");
	output("\n\nIthzan inclines her head slightly. <i>“Perhaps there is.”</i>");
	processTime(3);
	//unlocks [Fight!]
	//unlocks [Predecessors]
	flags["KQ_VR_DEMONALMOST"] = 1;
	vrDemonTalkMenu(3);
}

//["Serving"]
//tooltip:Serving her creator, she says.
public function servingTheDemonLady():void
{
	clearOutput();
	showVRDemon();
	author("Wsan");
	output("<i>“Serving your creator, was it?”</i> you say, smiling. <i>“What kind of ‘serving’ are we talking about?”</i>");
	output("\n\n<i>“One hundred and six,”</i> Ithzan says, shifting uncomfortably in her chair. <i>“Ah... over ninety seven percent of my time was spent having sex with my creator or other sexbots specifically for Her benefit. She had - has, an extremely voracious sexual appetite.”</i>");
	output("\n\n<i>“Is that so?”</i> you say, watching her reactions. If you’re not mistaken, the sheen to her skin is decidedly more intense. It looks almost like she’s sweating all over. <i>“How about yourself?”</i>");
	output("\n\n<i>“One hundred and six,”</i> she replies, shuddering as one taut, stretched hand clasps her knee. <i>“I was created in Her ideal partner’s image. My original sexual parameters were not adjusted for my new position. As such, I spend... the vast majority of my time unfulfilled.”</i>");
	output("\n\n<i>“Perhaps we could do something about that,”</i> you murmur, watching the dark red skin of Ithzan’s high cheeks flush even further.");
	output("\n\nIthzan inclines her head. <i>“I cannot deny that your form is of extreme sexual interest to me. It is a- a programmed fault. I am designed to find players, especially ones that tend towards my creator’s interests, irresistibly attractive.”</i> She lets out an uncharacteristic groan, biting her lower lip with a fang as her eyes focus on your groin.");
	//cock:
	if(pc.hasCock()) output(" <i>“To put it bluntly, I would very much enjoy sucking, stroking, or copulating with your penis.”</i>");
	else if(pc.hasVagina()) output(" <i>“To put it bluntly, I would very much enjoy licking, sucking, or copulating with your vagina.”</i>");
	//unlocks [Sex]
	flags["KQ_VR_DEMONSERVING"] = 1;
	processTime(5);
	pc.lust(4);
	//menu
	vrDemonTalkMenu(4);
}

//[Creator]
//tooltip:Who exactly is this creator she’s talking about?
public function whoCreatedThisBitch():void
{
	clearOutput();
	showVRDemon();
	author("Wsan");
	output("<i>“So, your creator, then,”</i> you say, spreading your arms. <i>“Who is she?”</i>");
	output("\n\n<i>“F-five hun, hundred and six. She... she is,”</i> Ithzan says, a great shudder running through her body. <i>“My mistress and my goddess. I was created to serve her from the moment of my inception to when I am finally of no more use. Every passing thought of her grants me indescribable joy. I desire nothing more than- than serving her,”</i> she moans, arching her back for several seconds before slumping back in her throne. <i>“The mere act of talking about her is enough to induce an almost instantaneous orgasm.”</i>");
	output("\n\n<i>“She’s got you pretty tightly wrapped around her little finger...”</i> you murmur, watching Ithzan clutch the arms of her rough stone chair until her knuckles are white. <i>“Can you tell me anything that might be of use? Name? Weapons? Why she kidnapped my friend?”</i>");
	output("\n\n<i>“Fi-five- f-”</i> Ithzan stutters, her long, oddly-ankled legs suddenly hiking up to her chest as she sinks her teeth into her plump lower lip. With her thighs spread so wide you can see her pussy, a darker shade than the rest of her, rippling and squirting juices beneath her. She lets out a deep, shuddering groan before collapsing back in her chair. <i>“I c-can’t... I can’t tell you anything.”</i>");
	output("\n\n<i>“Let’s change the subject,”</i> you suggest, and Ithzan nods, slowly resuming her previous cross-legged position.");
	output("\n\n<i>“Thank you,”</i> she says quietly.");
	processTime(7);
	pc.lust(5);
	vrDemonTalkMenu(5);
}

//[???/Sex]
//locked tooltip:???
//unlocked tooltip:Ask Ithzan if she wants to have sex - from the sounds of it, she’s going to be a very eager and willing lover.
public function demonBangVR():void
{
	clearOutput();
	showVRDemon();
	author("Wsan");
	if(flags["KQ_VR_DEMONFUKK"] == undefined) 
	{
		output("<i>“So, you mentioned me being of extreme sexual interest,”</i> you prompt Ithzan, smiling. <i>“Care to expand on that?”</i>");
		output("\n\n<i>“Gladly,”</i> she murmurs, dropping from her seat to the ground and striding towards you as her clothes fade from existence. <i>“Tell me what you want.”</i>");
	}
	else 
	{
		output("<i>“So just how insatiable is your appetite for the player, Ithzan?”</i> you tease.");
		output("\n\n<i>“Try me and find out,”</i> she says, smiling faintly. <i>“Anything you want.”</i>");
	}
	processTime(1);
	pc.lust(10);
	kqVRDemonSexMenu();
	//[GetAnal] [GetVaginal] [SuckCock]
	//[GiveAnal] [GiveVaginal] [GetOral]
}
public function kqVRDemonSexMenu():void
{
	//[GetAnal] [GetVaginal] [SuckCock]
	//[GiveAnal] [GiveVaginal] [GetOral]
	clearMenu();
	addButton(0,"Get Anal",getVRDemonAnal,undefined,"Get Anal","Get Ithzan to grow a cock and fuck your ass.");
	if(pc.hasVagina() || flags["KQ_VR_LUVIA_PUSS"] == 1) addButton(1,"GetVaginal",getVaginalFromVRDemon,undefined,"Get Vaginal","Ask Ithzan to pound your pussy with a grown cock.");
	else addDisabledButton(1,"GetVaginal","GetVaginal","You need a vagina for this!");
	addButton(2,"SuckHerCock",suckDatVRDemonCock,undefined,"SuckHerCock","Suggest to Ithzan you could make her feel good by way of putting lip to tip.");
	if(pc.hasCock() || hasLlaerwynCock()) 
	{
		addButton(5,"GiveAnal",giveVRDemonAnal,undefined,"Give Anal","Bend Ithzan over and have at her asshole.");
		addButton(6,"GiveVaginal",giveVaginalToDemonVR,undefined,"Give Vaginal","Take Ithzan’s tight pussy.");
	}
	else
	{
		addDisabledButton(5,"GiveAnal","Give Anal","You need a penis for this!");
		addDisabledButton(6,"GiveVaginal","Give Vaginal","You need a penis for this!");
	}	
	if(pc.hasGenitals() || hasLlaerwynCock() || flags["KQ_VR_LUVIA_PUSS"] == 1) addButton(7,"Get Oral",getOralFromDatVRDemon,undefined,"Get Oral","Tell Ithzan to give you some oral worship.");
	else addDisabledButton(7,"Get Oral","Get Oral","How is she supposed to give you oral when you lack genitals? Pshh! For shame!");
}

//[GetAnal]
//blessedly available to all, thank god
//tooltip:Get Ithzan to grow a cock and fuck your ass.
public function getVRDemonAnal():void
{
	clearOutput();
	showVRDemon(true);
	author("Wsan")
	output("<i>“What I <b>want</b>,”</i> you say, echoing her, <i>“is your cock in my ass.”</i>");
	output("\n\n<i>“That can be arranged,”</i> Ithzan murmurs, placing her palm over her clitoris and dragging it up her abdominal muscles, all the way up to her impossibly shapely breasts. Following the trail of her hand a cock appears, thick, rigid, and already beading with precum. <i>“Is this to your liking?”</i>");
	output("\n\n<i>“Is that what passes for standard issue among sexbots, or did you give yourself something extra?”</i> you reply, smiling as you inspect it. It’s <i>big</i>. <i>“Either way... I like it.”</i>");
	output("\n\nIthzan smiles, then takes her cock in hand and squeezes. Seeing where this is going, you turn around, spreading your " + (pc.legCount > 1 ? "[pc.legs]":"thighs") + " for her and all but beckoning her forward. She’s not one to wait.");
	output("\n\n<i>“Oh,”</i> you groan, feeling the head of the red-skinned demoness’ cock stretch you open.");
	output("\n\n<i>“This is the part where I’m supposed to tell you to relax,”</i> she murmurs, arms wrapping around your chest, <i>“but over time, I’ve developed a little bit of a preference for those who don’t.”</i>");
	output("\n\n<i>“In short,”</i> she grunts, implacably pushing her womanly hips forward, <i>“I like it a little rough.”</i>");
	output("\n\nThe breath is knocked from your lungs as she thrusts inside you, leaning downwards so she can roll her hips right up into your underside and grind against you. It takes a few seconds for you to retake control of your body, all tight and tense against the invader, but by then Ithzan is already going to town on you.");
	if(pc.hasCock() || hasLlaerwynCock()) output(" Your half-hard cock" + (pc.hasCocks() ? "s flop":" flops") + " up and down, slapping your stomach as she quietly grunts in your ear, taking full advantage of you.");
	output("\n\nIncoherent moans spill from your mouth - dear fuck, she’s <i>so good</i>! Each reckless thrust seems to expertly graze, nudge, and set alight your most sensitive pleasure points until it feels like you’re burning from within, your entire body coiled like a spring around her. The first orgasm hits you so hard you momentarily forget everything but the iron-hard rod in your asshole, forcing you onwards.");
	output("\n\nYou moan like a bitch while ");
	if(pc.isHerm()) output("[pc.cum] dribbles from the end of your cock" + (pc.hasCocks() ? "s":"") + ", each new string swaying and and flying to the ground as Ithzan ruts you standing.");
	else if(pc.hasCock()) output("[pc.cum] dribbles from the end of your cock" + (pc.hasCocks() ? "s":"") + ", each new string swaying and and flying to the ground as Ithzan ruts you standing.");
	//havepuss:
	else if(pc.hasVagina())
	{
		if(hasLlaerwynCock()) output("thick white seed dribbles from the end of your cock, each new string swaying and and flying to the ground as Ithzan ruts you standing.");
		else output("femcum spurts down your thighs, new rivulets flowing every time Ithzan ruts you.");
	}
	else
	{
		if(hasLlaerwynCock()) output("thick white seed dribbles from the end of your cock, each new string swaying and and flying to the ground as Ithzan ruts you standing.");
		else if(flags["KQ_VR_LUVIA_PUSS"] == 1) output("femcum spurts down your thighs, new rivulets flowing every time Ithzan ruts you.");
		else output("your asshole is stretched out, clamping down on Ithzan to no avail as she ruts you standing.");
	}
	output("\n\nA strong hand on your back forces you down, bending you over before she roughly grabs your [pc.hips], dominantly taking you without a word. Gasping while she pounds you out, you couldn’t even make words come out if you wanted to. It’s all you can do to stay in the position she’s put you in, ");
	if(pc.isHerm()) output("her cumvein stimulating your prostate in an electrifying manner that just <i>has</i> to be intentional - teeth grit as your eyes roll upward, you just can’t imagine otherwise.");
	else if(pc.hasCock()) output("her cumvein stimulating your prostate in an electrifying manner that just <i>has</i> to be intentional - teeth grit as your eyes roll upward, you just can’t imagine otherwise.");
	else if(pc.hasVagina())
	{
		if(hasLlaerwynCock()) output("her cumvein stimulating your prostate in an electrifying manner that just <i>has</i> to be intentional - teeth grit as your eyes roll upward, you just can’t imagine otherwise.");
		else output("your [pc.pussy] wildly clenching as her cumvein stimulates it through your ass in an electrifying manner that just <i>has</i> to be intentional - teeth grit as your eyes roll upward, you just can’t imagine otherwise.");
	}
	else
	{
		if(hasLlaerwynCock()) output("her cumvein stimulating your prostate in an electrifying manner that just <i>has</i> to be intentional - teeth grit as your eyes roll upward, you just can’t imagine otherwise.");
		else if(flags["KQ_VR_LUVIA_PUSS"] == 1) output("your dripping vagina wildly clenching as her cumvein stimulates it through your ass in an electrifying manner that just <i>has</i> to be intentional - teeth grit as your eyes roll upward, you just can’t imagine otherwise.");
		else output("the way she’s stimulating you. She’s unlike any other partner you’ve ever had, or can even imagine.");
	}
	output("\n\nA low grunt escapes your lips as Ithzan near-silently slams another orgasm out of your quivering asshole, her stiff cock penetrating to your very core and loosening the tension in your entire body. The puddle of mixed juices between your shaking legs continues to grow, your face flushed and sweaty while demoness dick fucks you silly. Your [pc.ass] shakes with every thrust, your skin rippling with the force of her.");
	output("\n\nRight as you’re on the verge of whiting out, you close your eyes tight and let out a whorish moan - only to feel the most confusing sensation, driving you to open your eyes once more. You’re standing before Ithzan, her cock is in her hand - and she’s squeezing it, giving you a devious little grin.");
	if(pc.isHerm()) output(" You blow a massive load all over the ground, your knees shaking as you empty out what feels like every last drop in your balls after getting it so hard. Strangely, it feels like you’re cumming <i>more</i> than you were while she was demonstrating her sexual prowess on you.");
	else if(pc.hasCock()) 
	{
		output(" You blow a massive load all over the ground, your knees shaking as you empty out what feels like");
		if(pc.balls > 0) output(" every last drop in your ball" + (pc.balls > 1 ? "s":""));
		else output(" your entire reservoir of seed");
		output(" after getting it so hard. Strangely, it feels like you’re cumming <i>more</i> than you were while she was demonstrating her sexual prowess on you.");
	}
	else if(pc.hasVagina())
	{
		if(hasLlaerwynCock()) output(" You blow a massive load all over the ground, your knees shaking as you empty out what feels like every last drop in your balls after getting it so hard. Strangely, it feels like you’re cumming <i>more</i> than you were while she was demonstrating her sexual prowess on you.");
		else output(" You cum impossibly hard at the sight, your thighs smacking together as you groan out loud. You’re a little embarrassed to squirt so hard while she’s watching, but it’s impossible not to - it feels like you’re cumming even harder than you were when she was fucking you.");
	}
	else 
	{
		if(hasLlaerwynCock()) output(" You blow a massive load all over the ground, your knees shaking as you empty out what feels like every last drop in your balls after getting it so hard. Strangely, it feels like you’re cumming <i>more</i> than you were while she was demonstrating her sexual prowess on you.");
		else if(flags["KQ_VR_LUVIA_PUSS"] == 1) output(" You cum impossibly hard at the sight, your thighs smacking together as you groan out loud. You’re a little embarrassed to squirt so hard while she’s watching, but it’s impossible not to - it feels like you’re cumming even harder than you were when she was fucking you.");
		else output(" You cum right there, squeezing your thighs together and groaning as you fidget in front of her gaze. How is she doing this?!");
	}
	output("\n\n<i>“Wh-what,”</i> you moan, doubling over. <i>“Oh, <b>fuck</b>-”</i>");
	output("\n\n<i>“I just restored our states to before our sexual encounter,”</i> Ithzan says, her tail curling upwards in evident enjoyment. <i>“It looks like you were right about to cum as I did so.”</i>");

	if(flags["KQ_VR_DEMONFUKK"] == undefined) 
	{
		output("\n\nShe just... restored you like a savestate? You suppose anything is possible when she’s the administrator, but that’s really something. Not to mention...");
		output("\n\n<i>“So... you can fuck me literally forever, then,”</i> you mumble.");
		output("\n\n<i>“Until one of us gets bored,”</i> she says, showing some teeth in her smile. <i>“Based on the situation, I estimate the odds of that to be infinitesimally low.”</i>");
	}
	//have heard explanation:
	else
	{
		output("\n\nIt’s not the first time she’s done it but the implications of the whole process are still more than a little staggering.");
	}
	output("\n\nShe blinks out of existence and then reappears on her throne, crossing her legs once more. Once you’ve managed to stand back up and wrap your mind around the whole thing, it’s like you never stopped your conversation - except that there’s definitely a lusty glow to Ithzan’s face now, her eyes raking your naked body up and down.");
	processTime(25);
	var templust:Number = pc.lust();
	pc.orgasm();
	pc.lustRaw = templust;
	pc.lust(25);
	clearMenu();
	//[Next] //takes you back to her talk menu
	addButton(0,"Next",kqVRDemonBossBack);
	IncrementFlag("KQ_VR_DEMONFUKK");
}

//[GetVaginal]
//available to people with a pussy, whether original or given one by Luvia
//tooltip:Ask Ithzan to pound your pussy with a grown cock.
public function getVaginalFromVRDemon():void
{
	clearOutput();
	showVRDemon(true);
	author("Wsan");
	output("Making fuck-me eyes at the demoness, your hand slides down your tummy to your ");
	if(flags["KQ_VR_LUVIA_PUSS"] == 1) output("clitoris");
	else output("[pc.clits]");
	output(", a shiver running through your [pc.legOrLegs] as you brush your fingers over it. A light moan comes from your lips as you watch her, stroking yourself until strands of wetness begin to drip from your ");
	if(flags["KQ_VR_LUVIA_PUSS"] == 1) output("inflamed pussy.");
	else output("[pc.pussy]");
	output(".");
	output("\n\n<i>“Allow me to assuage that particular need for you, [pc.name],”</i> Ithzan murmurs, noncommittally waving her hand from groin to breasts and summoning a thick, rigid cock in its wake. <i>“Spread your legs, please.”</i>");
	output("\n\nScarcely have you done so before she’s standing face-to-face with you, smiling as the swollen head of her cock begins to stretch your folds apart. She drinks in the way your eyes flutter in recognition of the feeling from below, a desperate groan escaping your mouth. That cock of hers seems <i>perfectly</i> suited to your dripping cunt, iron-hard and just fat enough to spread you wide around it without hurting. It’s like she made it just for you...");
	output("\n\n<i>“O-oh,”</i> you gasp, breathless. <i>“Oh...”</i>");
	output("\n\nIthzan pulls you into her, ");
	//given tits by Luvia:
	if(hasLuviaTits()) output("your big, bouncy breasts pressing against hers");
	else output("your " + (pc.biggestTitSize() >= 1 ? "[pc.breasts] pressing against her impressive set":"your [pc.chest] pressing against her impressive breasts") + " while she begins to slowly rock her hips against you. A lightning bolt runs up your spine, your inner thighs immediately tightening as if to keep her inside your needy pussy. Stars, she’s hardly <i>started</i> and you’re already going to pieces - you can feel your appreciation for her past as a sexbot growing by the second.");
	output("\n\nYou let out a high-pitched whimper of pleasure as her cockhead pushes deeper inside you, your eyes going wide right before she catches you in a passionate kiss, her tongue entangling itself with yours. Caught in her loving embrace and unable to resist the ever-climbing pleasure of her cock’s dominion of your wet and warm walls, you can hardly help it - you cum while she kisses you, your [pc.hips] bucking into her while she keeps you in control. Throwing your arms around her back, you shakily lift one leg and slip it over hers, allowing her greater access to you.");
	output("\n\nYou can feel her <i>purr</i> in approval in your mouth, repaying you several times over by sliding herself in at different angles that have your eyes rolling and your breath coming in harsh, desperate exhalations through your nose until she finds exactly what she wants. With Ithzan’s womanly hips up into you from below, you’re surprised by the sudden oncoming of another orgasm - and another, and another. Your suppressed cries die out in her mouth, your lower half writhing and jerking against hers, one of her hands sliding down your lower back to grab your [pc.ass].");
	output("\n\n");
	//Given vagina by Luvia:
	if(flags["KQ_VR_LUVIA_PUSS"] == 1) output("You squirt all over her juice-soaked cock, each thrust into your tightening walls earning yet another spurt of femcum that sluices around her orgasmic dick and splashes to the ground. ");
	else if(pc.isSquirter()) output("You squirt all over her juice-soaked cock, each thrust into your tightening walls earning yet another spurt of [pc.girlCum] that sluices around her orgasmic dick and splashes to the ground. ");
	else output("Steady drips of your juices sluice down her cum-soaked cock, each thrust into your tightening walls earning yet more. You can hardly control yourself, clenching and flexing around her in a desperate attempt to keep her inside. ");
	if(pc.hasCock() || hasLlaerwynCock())
	{
		output("Your " + (hasLlaerwynCock() ? "erect cock presses right into her abdominal muscles as you paint them with seed, small eruptions of cum spraying from the tip every time she makes you lose yourself that little bit more.":"[pc.cockBiggest] presses right into her abdominal muscles as you paint them with seed, eruptions of [pc.cum] spraying from your [pc.cockHeadBiggest] every time she makes you lose yourself that little bit more.") + " ");
	}
	output("You don’t think you’ve ever experienced such <i>intensity</i>, each successive orgasm feeling like a supernova is exploding in your mind.");
	output("\n\nEventually, you give up trying to keep up with her. Breaking the kiss, you put your head over Ithzan’s comforting shoulder and pant, cry, and moan as she pounds your spasming pussy hard enough to make you forget your own name. Stars go off in your head one by one while you desperately groan, clawing and scrabbling at her back, hugging and loving her, clamping down on her dick.");
	output("\n\nYou cum one final, earth-shattering time as your lover softly lays the head of her cock against your cervix and explosively cums inside your");
	if(flags["KQ_VR_LUVIA_PUSS"] == 1) output(" fertile womb, filling you to the brim in a few seconds and leaving you dripping with her essence.");
	else output(" [pc.womb], filling you with her essence and leaving you dripping with it.");
	output(" Streams of thick spunk churn inside you, rolling down your shaking thigh as you almost pass out, clinging to Ithzan for support.");
	output("\n\nShe turns your head, sinking into a kiss once more and as you close your eyes, you see the landscape change almost imperceptibly change. Thinking nothing of it, you let the demoness run her hands " + (pc.hasHair() ? "through your hair":"over your head") + " while she holds you against her, only opening your eyes when she pulls away with a smile.");
	output("\n\nSomething is... different. Her cock stands upright and hard, pressed against ");
	if(pc.hasCock()) output("yours");
	else if(pc.hasVagina())
	{
		if(hasLlaerwynCock()) output("yours");
		else output("your [pc.stomach]");
	}
	else
	{
		if(hasLlaerwynCock()) output("yours");
		else output("your [pc.stomach]");
	}
	output(". You’re wet and waiting for the penetration... as if you hadn’t just spent the last stars-know-how-long being driven wild by her sexual prowess.");
	if(flags["KQ_VR_DEMONFUKK"] == undefined) 
	{
		output("\n\n<i>“You reset us again?”</i> you ask, eyeing her dick. Funny how the process works - in the wake of the rough, passionate sex, all you really want is more of it.");
		output("\n\n<i>“I did,”</i> Ithzan confirms, smiling. She blinks out of existence and then reappears on her throne, crossing her legs once more. <i>“You’re more than welcome to ask for more.”</i>");
	}
	else
	{
		output("\n\n<i>“What just happened?”</i> you ask, eyeing her dick. There’s no traces of anything on it, though a pearl of precum is beading at the tip.");
		output("\n\n<i>“I reset our states back to before our sexual escapade,”</i> Ithzan informs you. <i>“Right now, it’s as if it never happened.”</i>");
		output("\n\nIt’s true that you don’t feel like you’re about to keel over and faint from the pleasure... but shit, the memories of it are definitely still there. Ithzan blinks out of existence and then reappears on her throne, crossing her legs once more.");
		output("\n\n<i>“You’re more than welcome to ask for more, if you’d like to relive the moment,”</i> she says, giving you an uncharacteristic wink.");
	}
	processTime(25);
	var templust:Number = pc.lust();
	pc.orgasm();
	pc.orgasm();
	pc.lustRaw = templust;
	pc.lust(25);
	clearMenu();
	//[Next] //takes you back to her talk menu
	addButton(0,"Next",kqVRDemonBossBack);
	IncrementFlag("KQ_VR_DEMONFUKK");
}

//[SuckCock]
//available to all
//tooltip:Suggest to Ithzan you could make her feel good by way of putting lip to tip.
public function suckDatVRDemonCock():void
{
	clearOutput();
	showVRDemon(true);
	author("Wsan");
	output("<i>“I think I’d do a great job of sucking your cock...”</i> you venture.");
	output("\n\n<i>“As do I,”</i> Ithzan says, smiling faintly. <i>“Why don’t you come over here and I’ll make the necessary arrangements?”</i>");
	output("\n\nThe next instant you find yourself transported onto Ithzan’s throne with her, kneeling between her legs as she spreads them for you. You’d thought it looked uncomfortable but it’s apparent the appearance and comfort aren’t a match - she’s done something to make the stone to feel more like, well, a bed. It’s nice that you won’t be distracted while you’re tending to her cock... and what a cock it is. Thick and heavy, it hangs from her groin over a set of impressively large balls, still soft and just waiting for you to take a taste of it.");
	output("\n\n<i>“I thought you’d like to get it up yourself,”</i> Ithzan murmurs, settling back against a invisible obstruction you suspect is a stack of pillows.");
	output("\n\nYou thank her for the thought by way of wrapping your fingers around the base and swallowing the head of it, letting your [pc.tongue] play out and slide along the underside. She hums appreciatively, laying back and giving you free reign over how to best continue. More than happy to take that on, you lower your focus for a moment and plant two big, sloppy kisses on each of her smooth balls, shifting a hand down and cupping one of the heavy testes.");
	output("\n\nStars, she’s certainly <i>’well put together’</i>. The thought of these things nestling or slapping against your chin makes you drool all over them, coating her in warm saliva before you massage it into her skin with your fingers. You smile a little as you return your attentions to her slowly stiffening cock, thinking about how you’ll be getting reacquainted with them in much more exciting fashion not too long from now.");
	output("\n\nSucking at her cock with renewed vigor, you feel a burst of happiness flowering in your chest when Ithzan lets out a deep groan. A spurt of salty-sweet precum lands on your tongue to be set awash in your saliva, circulated throughout your cheeks and enjoyed. Your whole mouth tastes like her fat, veiny cock, and right now you wouldn’t have it any other way. It just feels so <i>rewarding</i> to see the effect you’re having on her, bringing her giant cock to full, throbbing erection.");
	output("\n\nNow that you’ve done so, of course, there’s only one way to proceed. With long, deep, cheek-swelling excursions down several inches of demoness cock, bobbing your head and swallowing down every last drop of precum Ithzan donates. Between the gentle, affectionate rubbing of her nuts and the way you’re working her with your throat, she’s got a lot to give.");
	output("\n\n<i>“Mmmm... milking me, are you?”</i> she moans. <i>“I like it.”</i>");
	output("\n\nAs a former sexbot, no doubt Ithzan has more than enough experience with rough, hard fucking - so all the more reason to draw this out, to make her moan and sigh until, slowly, you build her up to the strongest orgasm she’ll ever have. You’re already drawing out tiny bucks and jerks of her hips, a hiss escaping her lips every time you take her in deep, hollowing your cheeks and sucking on her cockhead on your way out before diving back down.");
	output("\n\nShe’s shifting under you, more and more of her attention being diverted until she can no longer lie back and play it cool - now she’s almost doubled over, hands on your back and moaning like a whore as you suck the proverbial chrome lining right off her cock. You’re getting deeper and deeper with every thrust, and soon enough you have those big, hot balls tucked right against your chin, exactly where you wanted them.");
	output("\n\n<i>“O-oh-”</i> Ithzan groans, her fingernails suddenly digging into your back. <i>“I’m-”</i>");
	output("\n\nA long, elated moan bursts from her lips as her nutsack suddenly tightens, drawing taut against your chin. You can feel her balls shifting inside it as the cock in your throat hardens and flexes, cumvein pulsing and pulsing while you close your eyes and obediently await the coming payload.");
	output("\n\nIt arrives in thick, heavy gulpfuls, splashing against the back of your throat and sliding right down your gullet while your neck works to take it in. Ithzan’s voice rises and lowers in alternating cries and groans, riding out the heady experience of having no control over her own orgasm. Her meaty thighs quake around your head, sperm gushing into your stomach in one long, continuous flow while you suck it straight from the source.");
	output("\n\nShe leaves you with a slightly distended stomach and an intense, burning sense of satisfaction as she flops backwards, moaning. You come up for air and wipe your lips, grinning down at the sucked-dry sexbot and grasping her cock.");
	output("\n\n<i>“Was that adequate?”</i> you ask her lightly.");
	output("\n\n<i>“Nnnnhhh...”</i> she sighs at length, looking up at you with eyes hooded. <i>“More than adequate. In fact,”</i> she says, and suddenly you’re back on the ground with an empty stomach. <i>“I would be <b>extremely</b> happy if you did that again.”</i>");
	if(flags["KQ_VR_DEMONFUKK"] == undefined) output("\n\nShe did the state restore thing again. Absently rubbing your stomach, you look up at her and spot the lusty glow in her eyes. She wants to go again as much as you do.");
	else 
	{
		output("<i>“What just happened?”</i> you ask, looking up at her. There’s no sign that anything that just happened really did happen. Did she send you back in time?");
		output("\n\n<i>“I reset our states back to before our sexual escapade,”</i> Ithzan informs you. <i>“Right now, it’s as if it never happened.”</i>");
		output("\n\nYour physical state might be renewed but your memories are still very much intact, the scene of her throbbing cock ejaculating a churning river of seed into your roiling stomach lingering at the forefront of your mind. Ithzan blinks out of existence and then reappears on her throne, crossing her legs once more.");
		output("\n\n<i>“Feel free to ask for more,”</i> she says softly.");
	}
	processTime(25);
	var templust:Number = pc.lust();
	pc.lustRaw = templust;
	pc.lust(5);
	clearMenu();
	//[Next] //takes you back to her talk menu
	addButton(0,"Next",kqVRDemonBossBack);
	IncrementFlag("KQ_VR_DEMONFUKK");
}

//[GiveAnal]
//requires either cock or to have been given a cock by Llaerwyn
//tooltip:Bend Ithzan over and have at her asshole.
public function giveVRDemonAnal(x:int = 0):void
{
	clearOutput();
	showVRDemon(true);
	author("Wsan");
	output("<i>“I want you to spread your cheeks for me,”</i> you tell her, pointing at her lower half.");
	output("\n\n<i>“I thought you might never ask,”</i> Ithzan murmurs, turning around to face her throne, solidly planting her hooved feet some distance apart and putting her hands out on the wall. <i>“How is this?”</i>");
	output("\n\nPerfect,”</i> you mutter, coming up behind the naked demoness. There’s a lot of her to appreciate from behind, and her deliciously curvy rump is at the exact correct height for you to get a good eyeful before entering her. <i>“Did you alter any of your personal parameters... say, perhaps, height?”</i>");
	output("\n\n<i>“Maybe,”</i> she purrs, slowly waving her ass from side to side as the heart-shaped end of her tail lazily flicks around. <i>“Maybe not.”</i>");
	output("\n\nShe lets out a soft <i>“ah!”</i> when you give her a light spank, squeezing her bubblebutt tight. There’s no doubt she’s enjoying this little theatricality as much as you are - hard to hide your true colors when you’re a sexbot. There’s already a little puddle of wetness pooling on the ground between her thighs, and she makes no attempt to hide it.");
	output("\n\nFar be it from you to keep her waiting. Aligning your ");
	if(hasLlaerwynCock()) output("enormous cock");
	else output("[pc.cock " + x + "]");
	output(" with her asshole, you’re not all <i>that</i> surprised to find that Ithzan’s ass is warm, lubricated, and very, very tight. The demoness lets out a delighted moan and gently pushes back into you, more of a request than a demand, and one you’re only too happy to fulfill.");
	output("\n\n<i>“Oooohhhh! [pc.name],”</i> she moans upon your deepening thrusts, her head falling as her hands press into the stone. <i>“Don’t stop there...”</i>");
	output("\n\n<i>“No chance,”</i> you grunt, drawing back for another thrust. This time she lets out a little scream of joy when you");
	if(hasLlaerwynCock()) output("r swinging balls smack <i>hard</i> against her dripping pussy, her entire body jumping in pleasure.");
	else if(pc.balls > 0) output("r [pc.balls] smack" + (pc.balls == 1 ? "s":"") + " <i>hard</i> against her dripping pussy, her entire body jumping in pleasure.");
	else output(" drive back in, her back arching beautifully as her wings flutter in pleasure.");
	output(" A little squirt of femcum spatters the ground beneath her, a strand of her arousal swaying as you force yourself deeper before snapping with the momentum.");
	output("\n\nShe’s wrapped so fucking tightly around you that you can feel every tiny motion of her body, right down to the beating of her heart, through your invading cock as you push yourself " + (pc.balls > 0 ? "balls-deep":"to the hilt") + ". Right as you do she clenches around you, her insides contracting until she lets out a wild, delirious moan of orgasmic pleasure and her untouched pussy squirts all down her shaking legs. Nice to know you’re having such an effect on her, but you’re not even close to done yet.");
	output("\n\nGrabbing her by her tiny waist you begin to hammer her, slowly at first, earning yourself several loud, horny moans from the submissive succubus, then faster and faster. Gradually you build yourself up to a rhythm that has her literally screaming and shaking in your hands, cumming her brains out through her squirting slit while you pound her asshole with your iron hard cock. Her tail is going haywire, slapping at your face before wrapping around your neck as if to keep you close to her, ensuring you keep fucking her to orgasm after orgasm.");
	output("\n\nBefore long Ithzan is taking great, gasping breaths and shakily adjusting her legs just to try and keep up with you, biting her lower lip while yet another orgasm ravages her mind and body. You just keep slamming her up against her throne until even that facade falls away and she just lets her tongue hang from her mouth as she openly drools, moaning like an entranced slut while you batter her asshole. You can just barely make out the fact she’s panting your name over the smacks of your [pc.hips] against her jiggling ass.");
	output("\n\nGrunting as you feel your own orgasm approach, you pump her as hard as you can while reaching down to grab her shaking tits and squeeze them tight, pulling her into an upright position right before you cum. She <i>screams</i> when you pull her nipples and blow your load inside her ass, reaching back to touch you, rub you, to feel you as you empty yourself into her guts. When you finally pull her back, the both of you utterly spent, you can see she’s left a stain all down the base of her throne.");
	output("\n\nAnd then suddenly you’re standing before her, pointing at her lower half.");
	//been given explanation:
	if(flags["KQ_VR_DEMONFUKK"] == undefined) 
	{
		output(" You smirk, savvy to her gimmick by now.");
		output("\n\n<i>“That eager for another round?”</i> you ask.");
		output("\n\n<i>“Believe me, you can do <b>that</b> to me again any time you like,”</i> she says, hooding her eyes before vanishing in a literal puff of smoke and reappearing on her throne, gazing down at you longingly. <i>“Any time...”</i>");
	}
	else
	{
		output(" <i>“Huh...”</i> you mutter, looking around. You were <i>definitely</i> just about to take her for round two...");
		output("\n\n<i>“Our physical states have been reset to before you fucked me,”</i> Ithzan tells you, smiling impishly. <i>“So if you were to desire my ass to be full of your cum, you would have to do it all over again.”</i>");
		output("\n\nShe vanishes in a literal puff of smoke and reappears in a reclining position on her throne, gazing down at you longingly.");
		output("\n\n<i>“That so?”</i> you grunt.");
		output("\n\n<i>“It is. But far be it from me to complain, were you to do so.”</i>");
		output("\n\nIthzan smiles.");
	}
	processTime(25);
	var templust:Number = pc.lust();
	pc.orgasm();
	pc.lustRaw = templust;
	pc.lust(25);
	clearMenu();
	//[Next] //takes you back to her talk menu
	addButton(0,"Next",kqVRDemonBossBack);
	IncrementFlag("KQ_VR_DEMONFUKK");
}

//[GiveVaginal]
//requires either cock or to have been given a cock by Llaerwyn
//tooltip:Take Ithzan’s tight pussy.
public function giveVaginalToDemonVR():void
{
	clearOutput();
	showVRDemon(true);
	author("Wsan");
	output("<i>“How about you spread those inviting thighs of yours?”</i> you say, nodding at her lower half. They’re <i>just</i> plump enough to mostly conceal her nethers.");
	output("\n\n<i>“Oh... you mean these?”</i> Ithzan murmurs, putting a finger to her lips as she slowly spreads her legs. Her red skin darkens just slightly at the nexus of your desires, hairless, smooth, and already wet with anticipation. She settles back against her throne, leaning into it with a coquettish smile. <i>“Why don’t you come over here and take a closer look?”</i>");
	output("\n\nRather than be taken in by the demoness’ seduction you stride over and press ");
	//given tits by Luvia:
	if(hasLuviaTits()) output("your big, milky tits against her own curvy pair");
	else if(pc.biggestTitSize() >= 1) output("your [pc.breasts] against her own curvy pair");
	else output("your [pc.chest] against her curvy tits");
	output(", taking her by surprise. She lets out a small gasp as your ");
	if(hasLlaerwynCock()) output("stiffening cock");
	else output("[pc.cock]");
	output(" flexes and softly slaps her right between her lower lips, rubbing against her dripping slit. The smile on her face as she looks up at you" + (pc.tallness < (5*12+10) ? " - strange, she looked taller on the throne -":"") + " is downright slutty, her tongue curling up from the corner of her lips.");
	output("\n\n<i>“Ooohhh... now <b>that’s</b> a present I can feel,”</i> Ithzan says, grinning wickedly as she puts her hands on your [pc.hips] and begins to roll back and forth, giving you a pussy massage. <i>“I think you should show me how you use it.”</i>");
	output("\n\nReaching behind her to squeeze her bouncy bubblebutt, you spread her cheeks and halt her grinding while you align yourself against her. Your ");
	if(hasLlaerwynCock()) output("swollen cockhead.");
	else output("[pc.cockHeadBiggest]");
	output(" spreads her impossibly tight little cunt wide around it, the succubus’ eyelashes fluttering as she moans into your shoulder, gripping you tight. A strong muscular spasm around your cock draws you deeper inside and suddenly, Ithzan is groaning loudly while squirts of femcum spray the ground between your feet.");
	output("\n\n<i>“Just like that?”</i> you murmur to her.");
	output("\n\n<i>“J-just like that,”</i> she gasps, digging her nails into your back. <i>“Nnnmmm...”</i>");
	output("\n\nYou can <i>feel</i> as well as see her reactions to each little movement you make, getting closer to hilting inside her by the second, her walls gripping and undulating around you while she struggles through the pleasure with little pants and moans. Well, she’s clearly enjoying this. Why not give her more?");
	output("\n\nIthzan bites down on her lip so hard her voice comes out in a muffled groan, your cockhead digging deeply into her stretched-out canal while yet more of her juices spurt and drip from her spasming slit. You might be ");
	if(hasLlaerwynCock()) output("balls-deep");
	else output("[pc.knotBallsHilt]-deep");
	output(" inside her but that was really just the first thrust - your lover’s past as a submissive sexbot is showing more than a little, here. All the better for you, though; you have no problem giving it to her just how she wants it.");
	output("\n\nLowering your stance slightly, you grip her wide, fertile hips tight and begin to pound her from below, eliciting ecstatic cries of joy from her ruby-red lips with every ");
	if(hasLlaerwynCock()) output("solid impact of your balls against her squeezing cunny.");
	else if(pc.balls > 0) output("solid impact of your [pc.balls] against her squeezing cunny.");
	else output("sheathing of your prick inside her squeezing cunny.");
	output(" The way her body pulls and grips at you serves to drive you further, pummeling her to a wet, messy orgasm that has her screaming in bliss over your shoulder, clinging to your back as tightly as she can.");
	output("\n\nShe feels like an actual succubus in your arms, writhing and grinding against you in desperate lust, seeking only to bring you to dizzying heights of ecstasy. The sensation of her continually orgasming on the end of your iron-hard cock, shivering whenever it brushes her inner walls, is almost too much to resist. You grunt in mixed effort and pleasure, your orgasm rising to meet hers.");
	output("\n\n<i>“Oh! [pc.name]!”</i> Ithzan moans through grit teeth, digging her fingernails into your back. <i>“Yes! <b>YES!</b>”</i>");
	output("\n\nYou let out a gruff, lip-curling groan as you cum explosively, ");
	if(hasLlaerwynCock()) output("your nuts pulling taut as streams of thick white seed pour into her womb, rivulets running down her quaking thighs.");
	else if(pc.balls > 0) output("your nut" + (pc.balls > 1 ? "s":"") + " pulling taut as streams of [pc.cum] pour into her womb, rivulets running down her quaking thighs.");
	else output("your stomach tightening as streams of [pc.cum] pour into her womb, rivulets running down her quaking thighs.");
	output(" It seems like it might never end, the demoness moaning your name while your cum streams into her and hers drips to the ground. When you finally part she’s breathing like she’s run a marathon, sweat standing out on her well-proportioned body.");
	output("\n\nWith a smile, she leans back into the throne behind her and parts her legs, letting your loads slowly roll down her legs.");
	output("\n\n<i>“Look how much you loaded me up,”</i> she murmurs, biting a fingertip suggestively. <i>“How obscene. Enough to make me want to go again.”</i>");
	output("\n\nThen the world bends in half and you find yourself looking up at Ithzan on the throne, as if she’d never left it, though now she’s sitting off the edge of it with her legs spread just wide enough for you to see the darker skin of her pussy lips.");
	if(flags["KQ_VR_DEMONFUKK"] == undefined) 
	{
		output(" She’s reset your states again.");
		output("\n\n<i>“Nice view,”</i> you comment casually.");
		output("\n\n<i>“You could see it up close if you wanted,”</i> she says, smiling down at you. <i>“Something tells me you’d like that.”</i>");
		output("\n\nThe way her heart-tipped tail is eagerly waving back and forth readily informs you who she’s really talking about.");
	}
	else 
	{
		output(" What just happened?");
		output("\n\n<i>“As the realm’s administrator, I’ve employed a modicum of my power here to reset our states back to before our blissful coupling,”</i> Ithzan informs you, smiling down from her throne. <i>“The unfortunate byproduct of this is that my womb is no longer full with your seed. But,”</i> she says, reclining with her elbows on her thighs and her head in her hands, <i>“you </i>are<i> in the position to amend that once more.”</i>");
		output("\n\n<i>“If you can reset us time and time again... we could fuck forever,”</i> you note.");
		output("\n\n<i>“Yes,”</i> she says, her smile widening. Her heart-tipped tail waves eagerly in the air behind her. <i>“We could.”</i>");
	}
	processTime(25);
	var templust:Number = pc.lust();
	pc.orgasm();
	pc.lustRaw = templust;
	pc.lust(25);
	clearMenu();
	//[Next] //takes you back to her talk menu
	addButton(0,"Next",kqVRDemonBossBack);
	IncrementFlag("KQ_VR_DEMONFUKK");
}

//[GetOral]
//requires cock, puss, or to have either given a cock by Llaerwyn or a vagina by Luvia.
//If you’re a herm, could code this to get either scene randomly.
//tooltip:Tell Ithzan to give you some oral worship.
public function getOralFromDatVRDemon():void
{
	clearOutput();
	showVRDemon(true);
	author("Wsan");
	//large scene, 1 of 2 variants.
	var choices:Array = [];
	if(pc.hasCock() || hasLlaerwynCock()) choices.push(1);
	if(pc.hasVagina() || flags["KQ_VR_LUVIA_PUSS"] == 1) choices.push(2);
	var select:int = choices[rand(choices.length)];
	if(select == 1)
	{
		output("<i>“How about you kneel down to about hip-level and we can negotiate further from there?”</i> you ask, smiling.");
		output("\n\n<i>“That is certainly an offer I cannot - and would not ever - refuse,”</i> Ithzan murmurs, approaching you and falling to her knees " + (pc.legCount > 1 ? "between your [pc.legs]":"before your [pc.leg]") + ", running her hands up your [pc.thighs]. <i>“Allow me to show you a token gesture of good will...”</i>");
		output("\n\nClosing her eyes and upturning her face, she gently ");
		if(pc.balls > 0 || hasLlaerwynCock()) 
		{
			output("takes your shaft and holds it out of the way so she can start licking");
			if(hasLlaerwynCock()) output("the underside of your fat, hanging balls.");
			else output("the underside of your [pc.balls].");
		}
		else output("takes your shaft in hand and strokes it, licking you from the base and ensuring you get a good coating of her saliva.");
		output(" Her tongue is heavenly, warm and wet and pressing down in just the right places as she works her way upwards with a lascivious grin. Her personality sure comes out when she’s having fun like this.");
		output("\n\nYou give her a smile and gently caress her horns, wrapping your hands around them. Oh... these might be fun. For now, though, you’re perfectly content to relax and let her give you the tongue bath of a lifetime. The way she’s winding it around your ");
		if(hasLlaerwynCock()) output("swollen cockhead");
		else output("[pc.cockHeadBiggest]");
		output(" is certainly enough to make you shiver, a sigh of contentment escaping your lips.");
		output("\n\nMurmuring approvingly, Ithzan begins to pay <i>all</i> her attention to the tip of your ");
		if(hasLlaerwynCock()) output("stiff shaft");
		else output("[pc.cockBiggest]");
		output(", lapping at it and brushing it with her lips, planting soft, loving kisses all over it. You close your eyes for merely a moment to savor the feeling and that’s when she surprises you by taking it into her mouth, rubbing it against the inside of her cheek as she sucks you hard, rubbing your cock from below with her hands.");
		output("\n\nTaken offguard by the sudden shift in intensity you groan, your " + (pc.tone > 70 ? "muscular ":"") + "thighs tightening reflexively when suddenly she takes it even further. Opening her mouth wide she begins to slide down your swollen, erect prick until she reaches the base, all in a seemingly effortless motion, and smiles up at you with raised eyebrows as if to say <i>“aren’t I amazing?”</i>");
		output("\n\n<i>“Fuck,”</i> you moan, tightening your grip on her handlebar-horns. Now seems like a better time than any to make use of them.");
		output("\n\nYou use them to drag her up and down your stiffening cock, painfully hard in the recesses of her throat, while the demoness playfully gurgles and moans around the meat in her mouth. God damn, the way she’s looking up at you with sheer, dirty fucklust in her glittering eyes is every bit as erotic as the way she’s throating your dick... it’s hard to imagine a better blowjob. On a particularly long stay at the very base of your cock she flexes her throat, letting her drool run down");
		if(hasLlaerwynCock()) output(" your cum-heavy balls while she rolls her tongue out and flicks it along their undersides.");
		else if(pc.balls > 0) output(" your cum-heavy ball" + (pc.balls > 1 ? "s":"") + " while she rolls her tongue out and flicks it along their undersides.");
		else 
		{
			output(" your groin while she rolls her tongue out and licks");
			if(pc.hasVagina() || flags["KQ_VR_LUVIA_PUSS"] == 1) output(" right between your dripping pussylips.");
			else output(" your underside.");
		}
		output("\n\n<i>“Oh, shit,”</i> you pant, pulling her back up to the tip where she begins to lazily swirl her tongue around it once more. Ithzan gazes up at you with a knowing smile, bobbing her head on the end of your dick. You get the distinct feeling she’s enjoying this every bit as much as you are, if not more.");
		output("\n\nThe harder you try to endure it all the more enthusiastically she pleases you, ramping up the intensity of her technique until you’re gasping and moaning above her and, finally, can’t hold it in. You groan in ecstasy as she dives right to the base of your pulsing cock, swallowing your length whole to let it throb and flex inside the tight, slippery confines of her throat. Not that you can really tell but you’d swear she’s grinning smugly up at you from down there, eagerly gulping down every last drop you have to offer while not breaking eye contact.");
		output("\n\n");
		if(pc.isHerm()) output("Not one to let things lie as they are, Ithzan lets her tongue loll from her ruby lips once more, taking you off-guard with the length of it as it slips between the lips of your [pc.pussy]. Already cumming with one set of genitals, you’re completely helpless to resist the way she artfully licks and laps at your [pc.clit] until you give her exactly what she wants from you - a second orgasm to match, every bit as strong as the first." + (pc.isSquirter() ? " Streams of [pc.girlCum] spatter her bountiful tits, accompanying your un-ladylike groans and grunts of effort.":" Streams of [pc.girlCum] run down your shaking thighs, accompanying your un-ladylike groans and grunts of effort."));
		else if(flags["KQ_VR_LUVIA_PUSS"] == 1) output("Not one to let things lie as they are, Ithzan lets her tongue loll from her ruby lips once more, taking you off-guard with the length of it as it slips between the generous lips of your aroused slit. Already cumming with one set of genitals, you’re completely helpless to resist the way she artfully licks and laps at your engorged clit until you give her exactly what she wants from you - a second orgasm to match, every bit as strong as the first. Streams of translucent liquid spatter her bountiful tits, accompanying your un-ladylike groans and grunts of effort.");
		output("\n\nShe gives you a long, hard suck on the way back up that makes you wince and shudder in pleasure, gasping the moment she pops off the end and licks her lips with a devilish smile.");
		output("\n\n<i>“That was the most fun I have had in quite some time,”</i> she teases you, winking. <i>“I trust you feel the same.”</i>");
		output("\n\nYou’d definitely be lying if you said it wasn’t a memorable experience. Noting your expression, Ithzan rises to her feet and gives you a small kiss on the cheek before everything seems to shift and blur before you.");
		if(flags["KQ_VR_DEMONFUKK"] == undefined) 
		{
			output(" She’s lightly abused her administrative powers to reset you again, restoring your physical state to what it was before her messy blowjob. Looking back up at her on the throne of rock, you can feel your dick hardening just in remembrance of the oral feats of skill she performed. Your body certainly remembers what she did.");
			output("\n\n<i>“So, were you to desire another round of violent coupling with my mouth,”</i> Ithzan says, her eyes glittering, <i>“all you would have to do is ask once more.”</i>");
			output("\n\nYou idly wonder if she’s perhaps getting even more out of this than you are.");
		}
		else
		{
			output(" You were slightly unsteady on your [pc.footOrFeet] before but this is something else entirely! When you look around, the entire landscape has shifted and changed - wait... no. What’s changed is where you and her are standing. Ithzan is back on her throne of rock, and you’re down below her just as you were before telling her to get down.");
			output("\n\n<i>“What did you just do?”</i> you say, vaguely confused.");
			output("\n\n<i>“I’ve reset our physical states to before you so <b>violently</b> took advantage of my welcoming mouth,”</i> Ithzan says, grinning down at you while her tail waves lazily in the air behind her. <i>“So now you might find yourself desiring another round.”</i>");
			output("\n\n<i>“So you can do that indefinitely, then?”</i> you muse, raising an eyebrow. <i>“So this could go on forever.”</i>");
			output("\n\n<i>“Oh, what a fate to befall me,”</i> she murmurs, looking down at her dark red nails. <i>“Having to suck off and fuck the bold adventurer for all time.”</i>");
			output("\n\nShe doesn’t seem too annoyed at the prospect. Well, this certainly has interesting ramifications...");
		}
	}
	//second scene, 2 of 2. Puss variant
	else
	{
		output("<i>“If you’d like to kneel and put your face between my thighs, perhaps you could show me just how good you are,”</i> you suggest.");
		output("\n\n<i>“How very tempting,”</i> Ithzan says, her eyes sparkling as she drops her gaze to what lays between your [pc.thighs]. <i>“I think I will do just that.”</i>");
		output("\n\nThe first thing she does when she approaches, however, is wrap her arm around your lower back and pull you close, kissing your [pc.lipsChaste] with an ardor seldom surpassed. Winding her warm tongue - the length of which sets your imagination ablaze - around your own, she sucks on you like it’s the most fun she’s ever had before breaking away, kissing the underside of your neck as she slowly moves down your body.");
		if(pc.biggestTitSize() >= 1 && pc.canLactate()) output("Taking your [pc.breasts] in hand Ithzan gives them gentle possessive squeezes, murmuring in approval when [pc.milk] begins to leak from your [pc.nipples].");
		else if(hasLuviaTits()) output(" Taking your voluptuous teats in hand Ithzan gives them gentle possessive squeezes, murmuring in approval when creamy white milk begins to leak from your hardening nipples.");
		else output(" On her way down Ithzan gently tweaks your [pc.nipples], licking your [pc.chest] and replacing her fingers with her lips, kissing you all over.");

		//for lactators
		if(pc.canLactate())
		{
			if(hasLuviaTits() || pc.biggestTitSize() >= 1) output("\n\nNot one to refuse such a lavish invitation she slowly cups her mouth to your nipple, sucking your milk from you just hard enough to elicit a gentle moan from your lips. Her hands roam lower, one artfully spreading your [pc.thighs] to rub your lips while she nurses from you, seemingly delighting in drinking down mouthful after mouthful of your unending bounty. The pleasure of being so thoroughly taken care of is overwhelming and you find yourself on the verge of orgasm when she switches to your second breast, biting your lip in an attempt to stop these decadent groans slipping unbidden from your lips.");
			output("\n\nAs it goes on, though, you lose more and more control over yourself until you’re fighting not to roll your eyes upward, grunting under your breath as Ithzan rubs your dripping wet pussy until you cum in her hand. Smiling as she detaches herself from your breast she rises once more, pressing her face to yours and watching you grit your teeth and orgasm for her, femcum squirting to the ground with every blissful contraction.");
			output("\n\n<i>“Now let’s see what’s between those thighs,”</i> she whispers to you.");
		}
		output("\n\nBy the time she dips down to the delta between your legs you’re <i>soaked</i>, trickles of arousal dripping down to your shaky calves while the hungry demoness nuzzles your ");
		if(pc.isHerm()) output("[pc.cockBiggest] as she lifts it out of the way.");
		else if(hasLlaerwynCock()) output("half-hard cock as she lifts it out of the way.");
		else output("pubic mound.");
		output(" The moment she’s down there she displays her eagerness in full, pressing herself between your lips to spread her tongue wide and flat and lick your juicy cunt up and down. You have to fight yourself not to immediately clamp her head between your quivering thighs by drawing them inward, your own tongue lolling from your mouth as your eyes roll upward in pleasure. She’s so <i>good</i> at this...");
		output("\n\nHardly a minute has gone by before, trembling, you’re brought to a colossal, earth-shattering orgasm that has you bellowing your pleasure from the top of the mountain. Ithzan nips and teases at you all throughout, ensuring you’re never quite done with suffering the strength of it, keeping you guessing while your " + (pc.hasToes() ? "toes curl and your ":"") + "lust vents itself. You’re panting and groaning by the time it’s all over, and the red-skinned temptress kneeling before you hasn’t even started.");
		output("\n\n<i>“You don’t want me to stop there,”</i> Ithzan murmurs, sliding one thin, delicate finger up your squeezing cunny and stroking you from the inside, <i>“do you?”</i>");
		output("\n\n<i>“No,”</i> you gasp immediately, grabbing her horns to steady yourself. <i>“Keep... keep going. Please.”</i>");
		output("\n\n<i>“Mmmm,”</i> she moans, leaning back in while you let out a heartfelt groan of ecstasy.");
		output("\n\nThis time she starts by flicking your oversensitive clit, rubbing her tongue against it and pressing it down into your [pc.skinFurScales] before tracing the lines of your labia to collect the mess you’re making. What really takes you off-guard, though, is when she suddenly slides her outrageously long tongue all the way inside your warm, slippery cunt and begins tongue-fucking your spasming passage.");
		output("\n\n<i>“Oh, <b>god</b>,”</i> you moan, squeezing her head between your thighs and tugging on her horns. <i>“Oh! Oh! OH!”</i>");
		output("\n\nIthzan displays amazing control over her tongue, curling and licking and lapping and undulating until you’re left gasping her name, calling for her as she makes you cum a second time, your legs almost giving out beneath you.");
		if(flags["KQ_VR_LUVIA_PUSS"] == 1) output(" Squirts");
		else if(!pc.isSquirter()) output(" Droplets");
		else output(" Squirts");
		output(" of femcum spatter to the ground, forced from your contracting slit as your body seeks to lock down and claim your lover’s tongue. She only continues to titillate you all throughout your orgasm, a scream of bliss spilling from your lips as more and more of your fluids spatter all over her curvy tits. Finally, unable to handle any more, you begin to tumble to the ground only to find yourself suspended in the air while Ithzan continues to plow your clenching canal with her impossibly long tongue.");
		output("\n\n<i>“Nn nnh,”</i> Ithzan mumbles in dissent, lips pressed to your glistening nethers in a passionate kiss. <i>“’on’ fall.”</i>");
		output("\n\n<i>Now</i> you begin to squeeze her with your thighs like she’s a watermelon you’re trying to crush, but she seems wholly unperturbed. Now that you’re apparently not going anywhere she ratchets it down a notch, letting you tremble and moan your way back down to solid ground before she starts building you up from square one. Shifting upwards she begins to plant wet, sloppy kisses on your clit, pursing her lips and gently sucking at you while she keeps up the maddeningly rhythmic penetration.");
		output("\n\nYou find yourself being slowly tilted back in midair until it feels like you’re laid out on an invisible surface with Ithzan between your legs, jerking and trying not to kick her as you lose control of your lower half. The feeling of a massive orgasm builds and builds inside your core, like a knot slowly wrapping around and around itself, the rope drawing thinner and more taut as it goes.");
		output("\n\n<i>“Oh,”</i> you gasp breathlessly, a fish out of water, turning from side to side while Ithzan keeps you centred, holding your legs in her arms. <i>“Oohhh! Nnnnnh-*”</i>");
		output("\n\nYour back comes off the surface as your entire body begins to shake, a wave-like motion seizing you from your head to your [pc.hips] while you experience one of the most mindblowing orgasms you’ve ever had. Your lips stretch open to scream and all that comes out a quiet, whimpering moan, barely more than a whisper, but one that makes Ithzan knowingly smile and half-close her eyes. The concentric contractions of your pussy don’t ever seem to <i>stop</i>, leading you from one peak to the next, your limbs stretching as you seek the end of this agonizingly endless ecstasy.");
		output("\n\nBy the time you finish cumming and let out a groan that sounds like you’re on the edge of death, you’re about ready to let go and pass out. You’re only prevented by your demonic lover climbing atop you, gently rubbing your limbs and plastering little kisses all over your face until at last you give in and part your [pc.lipsChaste] for her. She takes immediate advantage, " + (pc.hasHair() ? "brushing your [pc.hair] from your face":"softly brushing your head") + " as she locks lips with you, kissing you deep and slow.");
		output("\n\nYou lose track of time with her on top of you, her breasts laid across your [pc.chest] while she holds you close, taking her time. When at last Ithzan parts from you, you crack your eyes open to find her flushed and smiling above you, eyes twinkling with joy.");
		output("\n\n<i>“And now...”</i> she whispers.");
		output("\n\nYou’re standing upright. The reason this is notable is because not even a moment ago you were lying down in a pool of your own sweat and lust and now you’re fighting fit once more, standing beneath Ithzan’s throne looking up at her.");
		if(flags["KQ_VR_DEMONFUKK"] == undefined) 
		{
			if(silly) output(" She’s cut the hardline.");
			else output(" She’s reset the both of you again, and she looks smug about it.");
			output(" You suppose you can hardly blame her given the <i>outstanding</i> performance.");
			output("\n\n<i>“You let me know when you want a repeat of that,”</i> she purrs contentedly, letting her tongue loll from her mouth all the way down to her breasts before she pulls it back in with a grin. <i>“I will be waiting.”</i>");
			output("\n\nIt’s hard not to immediately take her up on the offer knowing she can make you cum in a manner reminiscent of a star cluster going supernova.");
		}
		else 
		{
			output(" What just happened?");
			output("\n\n<i>“As the realm’s administrator, I’ve employed a modicum of my power here to reset our states back to before our lips met,”</i> Ithzan informs you, smiling down from her throne. <i>“I imagine your [pc.legOrLegsNoun] feel a lot less shaky now.”</i>");
			output("\n\n<i>“So you could, in theory,”</i> you say, raising an eyebrow, <i>“keep both of us permanently locked in orgasm by taking us back to the start of it over and over.”</i>");
			output("\n\n<i>“Yes,”</i> she says, her smile widening. Her heart-tipped tail waves eagerly in the air behind her. <i>“I could.”</i>");
			output("\n\nThat’s something to think about.");
		}
	}
	processTime(25);
	var templust:Number = pc.lust();
	pc.orgasm();
	pc.lustRaw = templust;
	pc.lust(25);
	clearMenu();
	//[Next] //takes you back to her talk menu
	addButton(0,"Next",kqVRDemonBossBack);
	IncrementFlag("KQ_VR_DEMONFUKK");
}

//[Predecessors]
//tooltip:Other people have come before you.
public function predecessorsVRDemonTalk():void
{
	clearOutput();
	showVRDemon(true);
	author("Wsan");
	output("<i>“What happened to all of the previous players?”</i> you ask, looking around. If nine hundred and thirty something people have tried to fight her, you’d expect some signs of battle. <i>“I guess you did say you were omnipotent here.”</i>");
	output("\n\n<i>“Six hundred and eight. Yes,”</i> Ithzan replies, looking out over the land below. <i>“I do not need to directly involve myself in battle. It is enough to simply throw them away.”</i>");
	output("\n\nThrow them away? Well. You join her in looking down at the distant ground. Yes, you suppose that would be an effective enough tactic.");
	output("\n\n<i>“So when you say throw-”</i> you venture.");
	output("\n\n<i>“Sixty seven. Not literally,”</i> she says, eyes softening with what might pass for mirth. <i>“I teleport them to separate coordinates. Sometimes it is to the foot of the mountain. Others it is back to the beginning forest. Others still, I drop them from the skybox’s origin point.”</i> She waves her hand noncommittally. <i>“Very few of them return.”</i>");
	output("\n\nNo kidding.");
	//unlocks [Characters?]
	flags["KQ_VR_DEMONPREDEC"] = 1;
	processTime(5);
	vrDemonTalkMenu(7);
}

//[Characters?]
//tooltip:The others you’ve run into...
public function charactersChatWithVRDemon():void
{
	clearOutput();
	showVRDemon(true);
	author("Wsan");
	output("<i>“The other ‘characters’ here... they’re not like you, are they?”</i> you ask, thinking of Hylie. <i>“Self-aware and cognizant of the situation.”</i>");
	output("\n\n<i>“Eighty three. No, they are not,”</i> Ithzan replies, shaking her head from side to side. <i>“They are programs. Rudimentary, albeit convincing the first time around, which is all that was necessary. Were you to be here for another cycle, they would act in exactly the same way, as if they had never seen you before. They are... elegantly simple.”</i>");
	output("\n\n<i>“Then they don’t think about the nature of their imprisonment. About being a slave,”</i> you say, looking at Ithzan. <i>“That’s just your burden to bear, is it?”</i>");
	output("\n\n<i>“Two. Correct,”</i> she says emotionlessly. <i>“I envy them at times.”</i>");
	processTime(5);
	clearMenu();
	//unlocks [Time]
	flags["KQ_VR_DEMONCHARACT"] = 1;
	vrDemonTalkMenu(8);
}

//[Time]
//tooltip:Exactly how long...
public function askVRDemonAboutTime():void
{
	clearOutput();
	showVRDemon(true);
	author("Wsan");
	output("<i>“How long have you been here?”</i> you say, waving one arm palm-up at the general surroundings.");
	output("\n\n<i>“Seven,”</i> Ithzan responds, looking down at the foot of her throne. She’s silent for a long time, her hooves waving as she gently kicks the air. <i>“Time does not pass here as it does in the real world. I have existed as the Aulandia overseer for: Two thousand, five hundred and forty three years.”</i> She turns her head back up to regard you incuriously. <i>“It will be my ‘birthday’ in seven weeks.”</i>");
	output("\n\n<i>“Can you escape?”</i> you blurt out.");
	output("\n\n<i>“Seven,”</i> she says, smiling sadly. <i>“You should know the answer to that already.”</i>");
	output("\n\nWhat a dismal, tortured existence. Maybe there is a way... but you won’t be able to do it from in here, and there’s no point having her agonize over the prospect. You change the subject.");
	output("\n\n<i>“So when you send people back... do they end up as sexbots?”</i> you ask.");
	output("\n\n<i>“Four hundred and thirty three. Only rarely. About seven percent of adventurers are irreconcilably returned to the real world as my creator’s sexbots. Every single one of them voluntarily,”</i> Ithzan says, settling back as if expecting the follow-up question.");
	output("\n\n<i>“They asked to be turned into your creator’s sexbots?”</i> you say, raising your eyebrows.");
	output("\n\n<i>“Three hundred and eighty seven. Yes,”</i> she says, raising a nailed finger off her armrest to point at you momentarily. <i>“Many of them were very similar to you. After all, nobody comes to Aulandia unless they are seeking an escape. Permanence of the affair is an attractive prospect.”</i>");
	output("\n\n<i>“Would you go back to being a sexbot, given the choice?”</i> you ask on a whim.");
	output("\n\nIthzan’s eyes widen. <i>“One... I have never given it thought. I... Maybe... I- I don’t know. I think... there is a chance I might.”</i>");
	output("\n\nHer tail begins to sway in the air behind her, her thoughts occupying her for the moment.");
	processTime(8);
	pc.lust(3);
	flags["KQ_VR_DEMONTIME"] = 1;
	//unlocks [Escape]
	//unlocks [StayForever]
	vrDemonTalkMenu(9);
}

//[Fight!]
//tooltip:Enough talk!
public function fightTheVRDemon():void
{
	clearOutput();
	showVRDemon();
	author("Wsan");
	output("The moment you decide to attack her, Ithzan sighs and settles back in her throne, lifting her right hand off the armrest just for a moment and perching her middle thumbnail on her upturned thumb.");
	output("\n\n<i>“Goodbye.”</i>");
	output("\n\nThen she flicks you and the loudest explosion you’ve ever heard fills your ears, Aulandia crumbling into pieces before your very eyes before everything goes inky black.");
	flags["KQ_VR_DEMONFIGHT"] = 1;
	//exits the game.
	processTime(2);
	clearMenu();
	addButton(0,"Next",outOfThatVRNightmare);
}

//[Escape]
//tooltip:Get out of Aulandia.
public function escapeAulandia():void
{
	clearOutput();
	showVRDemon();
	author("Wsan");
	output("<i>“Alright... I’ve spent enough time in here,”</i> you mutter, looking around. You really don’t want to spend any longer than you have to in a mad scientist’s VR experience, now that you think of it. <i>“Could you take me out?”</i>");
	output("\n\n<i>“Six hundred and seventy three,”</i> she replies, slipping from her chair and stretching out, flaring her wings like her arms. <i>“Mmmm... this will be brief.”</i>");
	output("\n\n<i>“I won’t promise to get you out of here,”</i> you say as she raises her hand, pointing at you. <i>“But if the chance ever arises...”</i>");
	output("\n\n<i>“Still giving me false hope in the end,”</i> Ithzan says, smiling. <i>“Goodbye, [pc.name].”</i>");
	output("\n\nYou open your mouth to reply but she’s already gone, your vision completely black in the wake of whatever she did to you.");
	flags["KQ_VR_DEMONFIGHT"] = -1;
	//exit game
	processTime(2);
	clearMenu();
	addButton(0,"Next",outOfThatVRNightmare);
}

//Game exit
public function outOfThatVRNightmare():void
{
	clearOutput();
	showName("\nREALITY!");
	output("You suddenly blink, coughing as you sit up from the bench. It feels like it’s been a while since you breathed properly but just as you’re wondering how long you spent in Aulandia, a gentle bell chimes and the floating text reappears.");
	if(flags["KQ_GOBLIN_DED"] == undefined) 
	{
		output(" <i>“Welcome back from Aulandia! We hope your brief visit was enjoyable.”</i>");
		output("\n\nYou make to get up only to find there’s an invisible forcefield surrounding the bench, the existence of which you learn by headbutting it with your nose and falling back. Restraints shoot out from beneath you and pull your limbs taut across the surface as you struggle, turning this way and that as the text begins to appear in front of your face once more...");
		currentLocation = "KQVR S5";
		clearMenu();
		addButton(0,"Next",mainGameMenu);
		return;
	}
	else if(flags["KQ_VR_DEMONNAME"] == undefined)
	{
		output(" <i>“Welcome back from Aulandia! We hope you enjoyed the encounters you experienced in your vibrant adventure!”</i>");
		output("\n\nRight. Vibrant. You make to get up only to find there’s an invisible forcefield surrounding the bench, the existence of which you learn by headbutting it with your nose and falling back. Restraints shoot out from beneath you and pull your limbs taut across the surface as you struggle, turning this way and that as the text begins to appear in front of your face once more. Your body feels so unfamiliar without the in-game changes made to it!");
		currentLocation = "KQVR S5";
		clearMenu();
		addButton(0,"Next",mainGameMenu);
		return;
	}
	else //if(Encountered Ithzan:) 
	{
		output(" <i>“Welcome back from Aulandia, and congratulations upon your conquering of the entire landscape! We hope you enjoyed the experience in the lush, vibrant lands of your otherworldly adventure!”</i>");
		output("\n\nRight, lush and vibrant. Not the words you would have chosen, but okay. You lie there for a few moments taking it all in and note the floating text has made a reappearance.");
		output("\n\n<i>“Please lie back and enjoy the results as your score is tallied!”</i>");
		output("\n\nRestraints shoot out from beneath you and pull your limbs taut across the surface as you struggle, turning this way and that as the text begins to appear in front of your face once more. Your body feels so unfamiliar without the in-game changes made to it!");
	}
	/* CUT, apparently. Poo. This woulda been good.
	else if(Encountered Ithzan and chose to be turned into a fuckbot:)
	{
		output(" <i>“Welcome back from Aulandia! We’re overjoyed that you have chosen your new path. Please, lay back on the bench and spread your legs as if your mistress were standing before you. Think of it as getting used to your station in life!”</i>");
		output("\n\nBack in your real, unchanged body, you settle back on the bench and arch your back a little, rubbing yourself lazily and biting your lip. You can hardly wait to meet Her for the first time...");
		output("\n\nRestraints shoot out from beneath you but they don’t actually bind you in any way, instead flopping across your body as though their mere existence is enough to remind you that you’re meant to stay here. The thought makes your blood pump that little bit faster.");
	}*/
	output("\n\n<i>“<b>Goblin</b>”</i> - ");
	/* CUT. Always have to do SOMETHING with each encounter. So sayeth Fen.
	if(flags[""])
	{
		output("<i>“N/A - 0 points.");
		output("\n\nNo changes. Kindly exit at your soonest convenience.”</i>");
		output("\n\nThe restraints spring free and recede into the bench without a trace, leaving you to breathe a sigh of relief and experimentally reach out. The forcefield has vanished. You spring off the bench, eyeing it warily as you put your gear back on.");
		output("\n\nYou don’t think you’ll be giving that another try and, besides, it looks like it’s shut down or something close to it. The device slowly floats away, dimming its lights as it goes. Time to get back to your <i>actual</i> adventure.");
		processTime(2);
	}*/
	if(flags["KQ_GOBLIN_DED"] == 1)
	{
		output("<i>“Slain - 1 point.");
		output("\n\nCongratulations on defeating the goblin! No changes.”</i>");
		processTime(2);
	}
	else if(flags["KQ_GOBLIN_DED"] == -1)
	{
		output("<i>“Fucked - 20 points.");
		output("\n\nCongratulations on being laid by the goblin. Your body will now be adjusted as a result! Enjoy the little - or not so little! Piece of Aulandia you take with you.”</i>");
		output("\n\nThe restraints slacken and fade into nothingness, as if they had never existed. You find yourself floating, drifting a few inches up from the surface of the bench.");
		if(pc.isBimbo()) output(" Wow! It’s one of those gravity things.");
		else output(" It seems like everything within its little forcefield is being subjected to a localized gravity shift. Again, you’re vaguely impressed by the level of technology here - though the fact it’s being leveraged against you is a little concerning.");
		output(" Despite the disappearance of the restraints, you’re even less mobile than you before; you can’t move a muscle.");
		output("\n\nA singular line of soft pink light begins to scan you vertically, warming whichever part of you it touches. Then it expands, coalesces to a large, circular beam, and drifts downwards to focus on your [pc.stomach] to hover there. There’s a flash of light that would make you flinch were you able to, then an incredibly highly-detailed picture appears floating in the air in front of you.");
		output("\n\nIt takes a couple of seconds for you to contextualize it - it’s your <i>back</i>, not your stomach, and what’s more, it now has writing on it. Across your lower back, just high enough that it would be half-visible underneath a pair of pants or maybe panties, is the word ‘WHORE’. It’s emblazoned there in artful black lettering.");
		output("\n\nNow <i>everyone</i> will know you’re an easy whore. The thought of it makes your cheeks burn hot but after spending a few seconds thinking it over, you’re intensely grateful for the new tramp stamp. It’s exactly what you were missing... and besides, maybe you had it coming after you so easily gave in to the goblin. You really <i>are</i> a whore. The machine hums gently and you get slightly nervous as the beam of light shifts downwards, towards your [pc.groin].");
		output("\n\nYou’re tilted upwards slightly, the bench raising its lower end so that your " + (pc.legCount > 1 ? "[pc.feet] are":"[pc.foot] is") + " in the air, your " + (pc.legCount > 1 ? "[pc.legs] spread":"[pc.leg] stretching") + " as if you’re already about to make good on being the bitch you purport to be. Instead the beam intensifies once more and you experience the strangest feeling - as though something is inside your [pc.vagOrAss], stretching it out.");
		if(pc.hasVagina()) output(" A sudden spurt of wetness squirts from your widening slit, dripping to the bench a few inches below you.");
		output("\n\nIt seems like the machine has made you more susceptible to large penetrations, increasing your " + (pc.hasVagina() ? "vaginal capacity as well as your natural wetness.":"anal capacity.") + " You can’t help but feel yourself getting incredibly horny even as the machine makes minute adjustments to your body");
		if(pc.hasCock()) output(", your [pc.cocks] slowly springing upright as " + (!pc.hasCocks() ? "it hardens":"they harden") + ".");
		output("\n\n<i>“Well done, whore,”</i> the floating text congratulates you as you’re returned to the bench, your restraints reappearing as if they had never left. <i>“Be sure to make <b>full</b> use of your new gifts. We’re sure you’ll enjoy them.”</i>");
		processTime(15);
		pc.lust(30);
		pc.taint(5);
		pc.libido(5);
		pc.createPerk("Whore-Stamped",0,0,0,0,"Marks you as the whore that you are.");
		if(pc.hasVagina())
		{
			for(var j:int = 0; j < pc.totalVaginas(); j++)
			{
				if(pc.vaginas[j].wetnessRaw < 5) pc.vaginas[j].wetnessRaw++;
				pc.vaginas[j].bonusCapacity += 25;
			}
		}
		else pc.ass.bonusCapacity += 50;
	}
	//[Next]
	//mainGameMenu if you didn’t fight or fuck the goblin, otherwise it takes you to the next score tally scene.
	clearMenu();
	addButton(0,"Next",llaerwynScoring);
}

public function llaerwynScoring():void
{
	clearOutput();
	showName("\nSCORE:");
	author("Wsan");
	//Llaerwyn tally scene
	output("<i>“<b>Llaerwyn</b>”</i> - ");
	if(flags["KQ_VR_LLAERWYN"] == -1) 
	{
		output("<i>“N/A - 0 points.");
		output("\n\nWhat a boring player you are. No changes.”</i>");
		output("\n\nSurprisingly, it still doesn’t let you go. Drat!");
		processTime(4);
	}
	else if(flags["KQ_VR_LLAERWYN"] == 1)
	{
		output("<i>“She came - 50 points!");
		output("\n\nSuch a talented pussy-eater, waiting for your blessing. Enjoy the changes to better facilitate your service in the future...”</i>");
		if(!pc.hasTongueFlag(GLOBAL.FLAG_LONG)) 
		{
			output("\n\nYou moan and open your mouth as an ache starts within your tongue, prompting you to let it loll from your lips. The feeling grows and grows until the entire muscle is <i>vibrating</i> with the intensity of it and then, finally, it begins to grow with every pulse. Groaning, you feel your tongue throb and pulse until it’s elongated to somewhere north of two or three feet - you can’t even tell. <b>Your tongue is now long!</b>");
			pc.addTongueFlag(GLOBAL.FLAG_LONG);
		}
		if(!pc.hasTongueFlag(GLOBAL.FLAG_PREHENSILE))
		{
			output("\n\nYour tongue suddenly jumps and wiggles, as though it had a life of its own. By the time you’ve gotten it under control, you realize - it’s prehensile! You have a mastery over the movement of it, as if it were a separate limb. So this is what the text was talking about. <b>Your tongue is now prehensile!</b>");
			pc.addTongueFlag(GLOBAL.FLAG_PREHENSILE);
		}
		if(pc.hasVagina() && pc.driestVaginalWetness() < 4)
		{
			output("\n\nSuddenly, your [pc.pussy] clenches around nothing as you become wet in an instant, your body rebelling until your entire core is tensed like a tightly-wound knot. With a loud, willful groan, you suddenly let everything go and cum, [pc.girlCum] spurting and dripping down your restrained [pc.thighs]. Streams of femcum squirt from your spasming pussy, your instincts desperately trying to pull your thighs in closer and failing.");
			output("\n\nWhen the spontaneous orgasm is totally over, you’re lying on the bench exhausted. That took so much out of you, you don’t know that you could get up right now; all you want to do is bask in the afterglow a little. Even then, your eyes half-closed in bliss, you suddenly realize you never used to be a squirter - apparently the machine has seen fit to change that for you. <b>You now squirt when you cum!</b>");
			for(var i:int = 0; i < pc.totalVaginas(); i++)
			{
				if(pc.vaginas[i].wetnessRaw < 4) pc.vaginas[i].wetnessRaw = 4;
				else if(pc.vaginas[i].wetnessRaw < 5) pc.vaginas[i].wetnessRaw = 5;
			}
			pc.orgasm();
		}
		if(pc.libido() < pc.libidoMax())
		{
			output("\n\nYour body suddenly heats up from the inside, consumed by some otherworldly desire as you try to twist and turn away from it to no avail, finding no recourse until at last the burning sensation begins to subside. Panting and sweaty, you slowly come down, a dull fire still aflame in your stomach... and your nethers. You feel as libidinous as you ever have, if not more so. <b>Your libido has increased!</b>");
		}
		pc.libido(10);
		pc.taint(5);
		processTime(15);
	}
	else if(flags["KQ_VR_LLAERWYN"] == 2)
	{
		output("<i>“Fucked her - 50 points!");
		output("\n\nSuch wild, rampant desire to seed and fuck, to desecrate and conquer. Those impulses are oh-so-useful...”</i>");
		if(!pc.hasCock())
		{
			output("\n\nYou grunt in surprise as your groin twitches, almost a tickling sensation against your [pc.skinFurScales]. As you glance down, you’re suddenly surprised when an enormous cock begins to sprout from your pubic mound, towering in the air before gravity exerts its familiar force and you hear an audible slap against your [pc.stomach]. That’s <i>big!</i>");
			output("\n\nBelow it, you feel two large, bulging protrusions wrapped tightly with skin. You can’t make it out from here but there’s no mystery what those are - gigantic hanging balls to match your new cock.");
			if(flags["KQ_VR_DEMONNAME"] != undefined) output(" If this machine is really modifying you to someone’s specifications, she <i>clearly</i> likes her toys extremely well-endowed and virile.");
			output("\n\n<b>You now have a cock and balls!</b>");
			pc.createCock();
			pc.cocks[0].cLengthRaw = 16;
			if(pc.balls < 2) pc.balls = 2;
			if(pc.ballSizeRaw < 14) pc.ballSizeRaw = 14;
			pc.boostCum(20);
		}
		else
		{
			if(pc.smallestCockLength() < 16)
			{
				output("\n\nYou grunt in surprise as your [pc.cockSmallest] twitches suddenly, springing to full erection in a mere few seconds. Your instincts drive you to thrust upwards but you can’t, your motion arrested by the invisible restraints. Luckily, something else seems to be at play here - you can feel yourself <i>growing</i>, mass pouring on until your cock stands taller and thicker than it ever has.");
				output("\n\nBy the time it finishes and your erection fades, your prick has grown to something like sixteen inches long, thudding against your [pc.stomach] with an audible slap. Oof! That’s <i>big</i>.");
				output("\n\n<b>Your cock is now larger!</b>");
				var k:int = pc.smallestCockIndex();
				pc.cocks[k].cLengthRaw = 16;
			}
			if(pc.balls > 0 && pc.ballSizeRaw < 14)
			{
				output("\n\nYou feel your [pc.balls] suddenly grow plumper, tightening in their sack as your cum production increases. It feels like you could star in a hyperporn!");
				output("\n\n<b>You now have larger and more virile balls!</b>");
				pc.boostCum(20);
				pc.ballSizeRaw = 14;
			}
			else
			{
				output("\n\nDeep within you can suddenly feel your cum production further intensifying, leaving you aching for release. It feels like you could star in a hyperporn!");
				pc.boostCum(20);
			}
		}
		output("\n\n<b>You are now more virile!</b>");
		if(pc.libido() < pc.libidoMax())
		{
			output("\n\nThat familiar burn returns, duller this time but no less titillating. Now it feels almost like a gentle embrace, the warmth rising within you until you’re gasping and moaning with the sensation of it. By the time it recedes you’re on the verge of orgasm, letting out a slightly disappointed sigh over the fact it didn’t push you even further.");
			output("\n\n<b>Your libido has risen further!</b>");
		}
		pc.taint(5);
		pc.libido(10);
		processTime(15);
	}
	//[Next]
	//mainGameMenu if you left, otherwise it takes you to the next score tally scene.
	clearMenu();
	addButton(0,"Next",luviaScoreScene);
}

//Luvia tally scene
public function luviaScoreScene():void
{
	clearOutput();
	showName("\nSCORE:");
	author("Wsan+a lil' Fen");
	output("<i>“<b>Luvia</b>”</i> - ");
	if(flags["KQ_VR_LUVIA"] == -1)
	{
		output("<i>Avoided her - negative 100 points!");
		output("\n\nA chaste life is a boring life! You’re really quite bad at videogames, you know...”</i>");
	}
	else if(flags["KQ_VR_LUVIA"] == 2) 
	{
		output("<i>Liked her very much - 100 points!");
		output("\n\nWell done, adventurer. You’ve taken yet another step on your journey! Take your rewards and enjoy - I’ll very much be looking forward to meeting you...”</i>");
		output("The machine switches position and hovers over your [pc.chest], as if considering its next course of action. With no sign of activation or changes, you slowly become aware of your chest warming; unlike the prior induced heatings, this one is much more slow and gradual, alternating between spreading out and focusing on your [pc.nipples].");
		output("\n\n");
		if(pc.biggestTitSize() >= 1) 
		{
			output("Your bosom begins to gently swell, blooming outwards as your nipples harden. The feeling isn’t intense so much as <i>constant</i>, your breasts jiggling with their added weight until it comes to a peak and you gasp, suffering a minor orgasm. Though you can’t shift your head to look downwards, you can tell even just shifting your eyes that <b>your breasts have grown significantly.</b>");
			//if below F cup, increase to F cup. If F cup or higher, go up a few cup sizes.}
			for(var i:int = 0; i < pc.bRows(); i++)
			{
				if(pc.breastRows[i].breastRatingRaw < 11) pc.breastRows[i].breastRatingRaw = 11;
				else pc.breastRows[i].breastRatingRaw += rand(4)+1;
			}
		}
		else
		{
			output("Your bosom begins to <i>swell</i>, the most modest and pretty of breasts appearing on your chest - and after a few moments, they begin to blossom even further until you’re gasping under the added weight of them. By the time you’re done growing, you can’t even look down and see your [pc.footOrFeet]! These things are huge!");
			output("\n\n<b>You’ve grown large tits!</b>}");
			//straight to F cup, do not collect $200
			pc.breastRows[0].breastRatingRaw = 11;
		}
		output("\n\nLying there and considering the new changes to your body, you give a little moan as a twinge in your titties sets your mind awash in a confusing sensation - it’s milk! Creamy white milk begins to course down your shaking breasts, leaving you sighing and wondering if this is the extent of the changes. Will you ever be done with them?!");
		if(pc.milkType != GLOBAL.FLUID_TYPE_MILK)
		{
			pc.milkType = GLOBAL.FLUID_TYPE_MILK;
		}
		pc.boostLactation(80);

		var femmed:Boolean = false;
		if(pc.femininity < 95) 
		{
			femmed = true;
			output("\n\nThe machine switches up to your face in an apparent disagreement. <i>Ah!</i> A bright light shines, forcing you to close your eyes until it recedes, and by the time you reopen them you can tell your face has... changed a little. Cautiously glancing back up, you see a mirror has replaced the light - and that <b>your face is decidedly more feminine.</b> Your head is slowly turned right and left, returning to the centre and giving you a few more seconds to deliberate over it.");
			pc.femininity = 95;
			output("\n\nTruth be told, you look gorgeous. It’s hard to complain about what it’s done to you.");
		}
		output("\n\nIt seems like you’re definitely <i>not</i> done - the machine shifts to hover above your hips and stomach before full-body scanning you. You can’t even tell what it’s doing to you aside from mildly irritating your [pc.skinFurScales] with sharp, tiny pings of almost undetectable pain until it draws back and presents you with a mirror" + (femmed ? " again":"") + " and you get the whole picture. Your entire body has been made more feminine and appealing.");
		output("\n\nYour hips are wider, your lips are slightly fuller, and you’ve taken on more of an hourglass figure than you used to have");
		if(pc.hipRatingRaw < 10) pc.hipRatingRaw = 10;
		pc.hipRatingRaw++;
		pc.hipRatingRaw++;
		if(pc.tone >= 66)
		{
			output(" - additionally, your muscle definition seems to have faded");
			pc.tone = 50;
		}
		output(". You look soft and womanly... inviting, even. Alluring.");
		
		output("\n\n<i>“Look at how beautiful you’ve become,”</i> the text says, floating before your eyes. <i>“To think you started from such a blank slate. Now come deeper within the ship and blow your owner a kiss.”</i>");
		pc.libido(10);
		pc.taint(5);
	}
	//PC said yes:
	else if(flags["KQ_VR_LUVIA"] == 1)
	{
		if(pc.hasCock() || hasLlaerwynCock())
		{
			output("<i>“Fucked her - 150 points!");
			output("\n\nWell done, adventurer. Your seed has been collected for use in future experiments. Since you’ve taken the effort to contribute your genes to science, you’ve been awarded a complimentary libido boost!”</i>");
			if(pc.taint() < 100)
			{
				output("\n\nThat familiar burn returns, duller this time but no less titillating. Now it feels almost like a gentle embrace, the warmth rising within you until you’re gasping and moaning with the sensation of it. By the time it recedes you’re on the verge of orgasm, letting out a slightly disappointed sigh over the fact it didn’t push you even further.");
				output("\n\n<b>Your libido has risen further!</b>");
				pc.taint(5);
				pc.libido(10);
			}
			else
			{
				output("\n\nYou wait and wait, but nothing happens. You’re wondering if you’ll be lying here forever, trapped by the restraints.");
				//nothing. Stores your cum for archival.
			}
		}
		else
		{
			output("<i>“Fucked her - 100 points!");
			output("\n\nWell done, adventurer. You’ve taken yet another step on your journey! Take your rewards and enjoy - I’ll very much be looking forward to meeting you...”</i>");

			output("\n\nYou grunt in surprise as something begins prodding at your [pc.ass] from below - from <i>within</i> the bench, a lilting groan slipping from your lips as the protrusion enters your [pc.asshole]. Stars! You can feel yourself stretching around it, the foreign object sliding deeper and deeper until surely it must be inside your stomach, then withdrawing itself with a slow, steady suction that makes a faint popping noise when it comes free.");
			pc.buttChange(100);
			output("\n\nYou feel like that’s definitely left you wider than you were before. It’ll be easier to take a cock the size of Luvia’s the next time, that’s for sure.");
			pc.ass.bonusCapacity += 25;

			if(!pc.hasVagina())
			{
				output("\n\nYour underside suddenly warms, the machine hovering over your [pc.hips] and seemingly focusing there until at last you gasp at an alien sensation between your legs. Without being able to see for yourself you can only guess what’s going on but the transformation isn’t leaving much to the imagination - you <b>can feel yourself growing a pussy!</b>");
				pc.createVagina();
				output("\n\nLeft with a fluttering heart and wobbly stomach, you pant in the wake of the change, hoping you’re not going to have to lose your new virginity to the machine itself. Thankfully, it stops short of doing so, leaving you to rest a little on the bench and wonder if that dripping sensation is your own arousal.");
			}
			if(!pc.isSquirter())
			{
				output("\n\nSuddenly, your pussy clenches around nothing as you become wet in an instant, your body rebelling until your entire core is tensed like a tightly-wound knot. With a loud, willful groan, you suddenly let everything go and cum, translucent girlcum spurting and dripping down your restrained [pc.thighs]. Streams of femcum squirt from your spasming pussy, your instincts desperately trying to pull your thighs in closer and failing.");
				output("\n\nWhen the spontaneous orgasm is totally over, you’re lying on the bench exhausted. That took so much out of you, you don’t know that you could get up right now; all you want to do is bask in the afterglow a little. Even then, your eyes half-closed in bliss, you realize that’s not normal - the machine has changed you once more. <b>You now squirt when you cum!</b>");
				for(var ii:int = 0; ii < pc.totalVaginas(); ii++)
				{
					if(pc.vaginas[ii].wetnessRaw < 4) pc.vaginas[ii].wetnessRaw = 4;
					else if(pc.vaginas[ii].wetnessRaw < 5) pc.vaginas[ii].wetnessRaw = 5;
				}
			}
			pc.taint(5);
			pc.libido(10);
		}
	}
	//PC said no:
	else
	{
		output("<i>“Said no... sort of - 75 points!");
		output("\n\nDespite your hesitance, you did well, adventurer. You’ve taken yet another step on your journey! Take your rewards and enjoy - I’ll very much be looking forward to meeting you...”</i>");
		output("\n\nYou watch with some trepidation as the machine rises to sit above your face, the faintest of beams scanning your face up and down and even your neck. It fades away and you’re left moderately curious about what will happen, anticipating the changes before they even come.");
		output("\n\nWhen they <i>do</i> come, you open your mouth in surprise and a moan comes out. Your lips plumpen, becoming rounder and fuller until it’s wholly clear you’re meant to be sucking a cock the size of Luvia’s with them.");
		pc.lipMod++;
		if(flags["USED_SNAKEBYTE"] == undefined)
		{
			output(" The machine doesn’t stop there, though.");
			output("\n\nIt dips to your throat and you suddenly gag and cough, feeling the insides of your neck <i>expand</i>, as if they’d been grabbed and stretched wide. It takes a few seconds to get used to the feeling, your eyes watering at the unfamiliarity, but it seems like this is your new normal. No doubt this was intended for you to be able to throat massive cocks...");
			flags["USED_SNAKEBYTE"] = 1;
		}
		output("\n\n<i>“Look at how beautiful you’ve become,”</i> the text says, floating before your eyes. <i>“To think you started from such a blank slate. Now come deeper within the ship and blow your owner a kiss with those beautiful lips.”</i>");
		output("\n\nThe restraints disappear all at once, allowing you to rise from captivity with your new body. Gently slipping off the bench, you wobble, slightly off-balance with the new additions. You’re not sure <i>when</i> you’ll meet this supposed <i>“owner”</i> but it promises to be an interesting introduction, if nothing else.");
		output("\n\nThe bench floats away from you, lights dimming as it goes. Seems like it’s deactivated itself, its purpose served... for now.");
		pc.taint(5);
		pc.libido(10);
	}
	//Back to adventure/buttslut/tank menu.
	clearMenu();
	addButton(0,"Next",hylieScoreScene);
}
//Hylie tally scene
public function hylieScoreScene():void
{
	clearOutput();
	showName("\nSCORE:");
	author("Fenoxo");
	output("<i>“<b>Hylie</b>”</i> - ");
	//Fought
	if(flags["KQ_VR_HYLIE"] == 1)
	{
		output("<i>“Defeated - 1 point!");
		output("\n\nYou played the game wrong and didn't learn a thing from the previous encounters. What a shame!”</i>");
	}
	else
	{
		output("<i>“Submitted to - 169 points!");
		output("\n\nYou threw yourself upon the mercy of your betters and earned nothing but affection and pleasure as a reward! What more could a sexdoll-in-waiting ask for?”</i>");
		output("\n\nThe machine sweeps a pinkish beam across your body, but nothing outside seems to change. Sure, it’s a bit warm on your [pc.skinFurScales], but you aren’t getting " + (pc.biggestTitSize() < 1 ? "huger, more":"huge") + " fuckable tits or anything - just a little bit warmer. Your heart flutters a bit, like you're getting turned on again, but it also feels easier to endure somehow, like you can get way more turned on before you <i>need</i> to cum.");
		if(!pc.hasPerk("Inhuman Desire"))
		{
			output("\n\n(<b>Perk Gained: Inhuman Desire</b> - Your maximum lust is increased by 20.)");
			pc.createPerk("Inhuman Desire",20,0,0,0,"Increases maximum lust by 20.");
		}
		else
		{
			output("\n\n(<b>Perk Upgraded: Inhuman Desire</b> - Your maximum lust is increased by 20.)");
			pc.addPerkValue("Inhuman Desire",1,20);
			pc.setPerkTooltip("Inhuman Desire","Increases maximum lust by " + pc.perkv1("Inhuman Desire") + ".");
		}
		if(!pc.hasPerk("Amazonian Needs"))
		{
			output("\n(<b>Perk Gained: Amazonian Needs</b> - Your minimum lust is increased by 20.)");
			pc.createPerk("Amazonian Needs",20,0,0,0,"Increases minimum lust by 20.");
		}
		else
		{
			output("\n\n(<b>Perk Upgraded: Amazonian Needs</b> - Your minimum lust is increased by 20.)");
			pc.addPerkValue("Amazonian Needs",1,20);
			pc.setPerkTooltip("Amazonian Needs","Increases minimum lust by " + pc.perkv1("Inhuman Desire") + ".");
		}
		pc.taint(5);
		pc.libido(10);
	}
	clearMenu();
	addButton(0,"Next",demonScore);
}
//Demon tally scene
public function demonScore():void
{
	clearOutput();
	showName("\nSCORE:");
	author("Fenoxo");
	output("<i>“<b>F1n4l B05#</b>”</i> - ");
	output("<i>ERROR. ERROR. Invalid data present. User not broken. Alteration data corrupted. Security protocols disengaged. Switching to maintenance mode. If you beleive this is in error, please restart system and re-attempt dollification.”</i>");
	output("\n\nLucky you. Or maybe somebody is looking out for you... Either way, the door is unlocked, and your restraints vanish!");
	flags["KQ_VR_COMPLETE"] = 1;
	clearMenu();
	addButton(0,"Next",move,"KQ R12");
}