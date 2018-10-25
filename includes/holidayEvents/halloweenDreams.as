//Dullahan Spoopy Times
//A Halloween 2018 Contest Submission
//By: Lkynmbr24
//available to PCs with a penis.
//triggers when sleeping in the PC's ship during the Halloween season.
//excludes taurs.

public function dullahanSpoops():void
{
	clearOutput();
	showName("\nAWAKE...");
	author("Lkynmbr24");
	output("A chilly draft blowing past your face rouses you awake. In your drowsiness, you shift under the covers and pull them over your head to keep the cold away. You groan in annoyance at being woken up and attempt to fall back asleep.");
	output("\n\nAfter a few minutes pass without another disturbance to wake you. You’re at the brink of falling asleep once more when the soft hiss of your cabin door opening and closing is heard; ");
	if(crew(true) == 0) output("which is strange considering there’s nobody else onboard the ship other than yourself.");
	else 
	{
		output("which is strange since you weren’t expecting any other visitors.");
		if(getSleepingPartnerName() != "") output(" Come to think of it, " + getSleepingPartnerName() + " isn’t anywhere to be seen in your room.");
	}
	output("\n\nConcerned, you pick yourself up from the bed, sleepily checking the keypad by your door. After testing it a few times, you conclude that nothing is seemingly out of order with the opening mechanism, when an oddly loud clatter rings out from your ship’s commons. With your curiosity piqued, you carefully exit your quarters.");
	output("\n\nWhen you reach the darkened commons area, you nearly stumble over a metallic object, which makes a loud noise when you bang it against your foot. Cursing a mile a minute while in enormous amounts of pain, you fumble around, looking for the button to activate the lights. When you finally reach the light switch, you are alarmed to find that the mechanism is completely trashed; in fact that very part of the wall is partially caved in! You feel your way around the commons, using the available security lights to find your way around until you manage to find a small flashlight, and shine it towards the center of the room.");
	output("\n\nThe entire area is a complete mess. Just about everything that’s not nailed down is thrown haphazardly around the room. Multiple drawers are ajar with their contents completely emptied out and spilled onto the floor. You notice that a number of spherical items, fairly large in size, lay in a stacked pile on top of the center table.");
	output("\n\nYou wrack your brain trying to figure out who or what made this mess of your ship when another deafening boom brings you back to your senses. While pointing your flashlight at your feet to avoid stepping on anything dangerous, you quickly make your way toward the source of the noise; the galley.");
	clearMenu();
	addButton(0,"Next",dullahanSpoops2);
}

public function dullahanSpoops2():void
{
	clearOutput();
	showName("\nA G-GHOST!");
	author("Lkynmbr24");
	output("Once you enter the doorway, you are greeted with a ghastly sight. In front of the wide-open refrigerator door is a petite, though feminine figure clad in dark clothing. You can’t see the details of her garb very well from her silhouette, but the thing that stands out most about her is that she appears to have <i>no head at all!</i> A wispy vapor rises like an eerie steam from the small stub of her neck. As much as you try to rub out the incredulous sight, nothing changes about her. More importantly, this isn’t anybody that you immediately recognise!");
	output("\n\nBefore you’re able to speak up to the intruder, a bone-chilling shudder runs through your back as a soft, but menacing voice resonates through the room.");
	output("\n\n<i>“Not... it...”</i> The figure slowly turns to you, holding something large and rounded in shape. <i>“Not my head... You. Give it back,”</i> she demands, stalking menacingly towards you.");
	output("\n\nThe figure lets go of the object in her hand, letting it fall to the floor with a sickening squelch. Pieces of what looks like watermelon fly everywhere, spattering against the nearby wall, and your [pc.legOrLegs]. You back away, frantically looking around for anything you can use as an improvised weapon while inwardly cursing yourself for leaving your gear in your chambers.");
	output("\n\n<i>“Your head... will do,”</i> the headless woman declares, drawing closer to you.");
	output("\n\nShe lunges out, making a grab at you once she is within striking distance. You narrowly dodge out of the way in time, though you don’t do so without slipping on a piece of watermelon, thanks to the mess that this interloper created. Attempting to catch yourself and failing, you tumble backwards, hitting the wall behind you with a sickening thud, nearly knocking the wind out of your lungs.");
	output("\n\nIn desperation, you blindly reach out and grab the nearest thing you can find, readying it to hurl at your attacker when she stops dead in her tracks. In your dazed state, you carefully observe the headless figure, who remains unmoving. This awkward ‘stare-down’ lasts for the better part of a few moments until she raises her arms and waves them towards you, and then herself. Confused, you shine your flashlight at the body in front of you, then towards your cocked arm.");
	output("\n\nBeneath a tangled mess of hair, a pair of bright eyes stares right back at you, wearing a wan smile to match.");
	output("\n\n<i>“You found me!”</i> The dismembered head squeaks.");
	clearMenu();
	addButton(0,"Next",dullahanSpoops3);
}

public function dullahanSpoops3():void
{
	clearOutput();
	showName("\nA DULLAHAN!");
	author("Lkynmbr24");
	output("Holy shit!");
	output("\n\nThe sight of her head in your [pc.hand] nearly makes you jump clean out of your [pc.skinFurScales]. In your shock and surprise, you jump, nearly drop the head onto the floor. Once you’ve calmed down enough, questions begin to flood into your head like a broken dam. The first of which trickles through your mouth soon enough.");
	output("\n\n<i>“Who are you?”</i>");
	output("\n\n<i>“Oh... just a passing spirit, nobody important. If you really want to know, I’m a dullahan... kind of a ditzy one on top of that. While I was living, my folks would always tell me that I’d lose my head if it weren’t attached... Well, I guess there was some truth to those words.”</i> The girl giggles sheepishly.");
	output("\n\nA pair of questions swim to the top amidst a flurry of others, <i>“Why here? Why me?”</i>");
	output("\n\n<i>“Eh... somewhere in the spiritual plane, I ‘ran out of energy’ is my best guess. Normally I don’t have any problems losing my head over anything like this, though existing on that side of the spectrum is kinda... exhausting.”</i> Her body shrugs. <i>“Once I run out of juice, it’s kinda hard to hold myself together, both physically and mentally, as you could tell. I might wind up anywhere in the living plain when I do. Sorry for barging in on you unexpectedly,”</i> the woman apologizes.");
	output("\n\nLooking at the girl in your hands, you find that she is very beautiful now that you have a good look at her. She has bright amethyst eyes that match her pale purple skin and silver, wispy hair. Two stubby, demoniac horns sprout from the bed of hair, betraying her otherwise human features. Her body isn’t half-bad either. A torn, violet nightgown hugs her form seductively, showing off her feminine figure to its fullest. It flows very elegantly around her hips and legs, rippling at even the slightest breeze.");
	output("\n\n<i>“Well... how do we go about getting you back to your world then?”</i> You look her square in her eyes, waiting for her answer. Her expression lights up into a coy smile at your question.");
	output("\n\n<i>“Thankfully, I’m no stranger to this happening to me. It’s actually really simple. I would just need to take in the essence of someone from the living realm...”</i> The woman is quick to elaborate when you make a questioning expression at this information. <i>“Doesn’t necessarily have to be ‘spiritual’ essence. Sexual essence works just as well too. A quick refill from a little romp usually does the job... and it’s pleasurable for both parties involved. It’s a win-win!”</i> she happily chimes.");
	output("\n\nWhile you’re distracted by processing all of this new information, the dullahan takes the opportunity to bite at your pajama bottoms. After a few attempts, she clenches the zipper in her teeth and yanks downward, fully exposing your manhood.");
	output("\n\n<i>“Well well... this certainly looks impressive.”</i> The girl licks her purple lips in anticipation. It slides out to an inhuman length as her mouth hangs agape. <i>“So... let’s give it a try! I scratch your itch and you scratch mine!”</i>");
	clearMenu();
	addButton(0,"Next",dullahanSpoops4);
}

public function dullahanSpoops4():void
{
	clearOutput();
	showName("\nA DULLAHAN!");
	author("Lkynmbr24");
	output("As weird as this is, if all it takes is a little cum from you to help out the strange gal, then that isn’t anything that you shouldn’t be able to handle. Just as you are about to propose how you’d like to go about doing things, you feel the dullahan’s long tongue wrap around your cock head. You half expect her to feel cold to the touch, being a spirit. On the contrary, she is quite warm, and pleasantly so! You sigh in comfort, laying back against the wall and letting her oral muscle wrap around the full length of your member.");
	output("\n\nHer coiled tongue rhymically slides up and down your pole, while her lips peck whatever parts are exposed to the chilled air. She keeps a medium grip on you; not too tight to disrupt the blood flow, but loose enough for you to not come too quickly to orgasm. Her breath is hot against your lap, heating the very air around your shaft.");
	output("\n\nLooking upward, in the dim light you see her body’s hand reaching under her now hiked up dress. She reaches between her svelte thighs towards the pale rosebud in between. Her legs are already visibly coated in the sweet nectar that have spilled from her reddening pussy lips. Two of her fingers wrap delicately around her clit and slowly rotate it around, prompting more of her girlish liquids to seep down her legs.");
	output("\n\n<i>“You know...”</i> The dullahan murmurs, bringing your attention back to her head. She meets your gaze with a lusty smile, her extensive tongue still enveloping your turgid rod. <i>“You don’t have to be gentle for my sake. In fact, I’d love it if you just... grab me by the horns and <b>fuck my face.</b> Like... <b>hard,</b>”</i> she throatily purrs, positively dribbling around your [pc.cockNounSimple] in excitement.");
	output("\n\nA looming shadow turns your focus back to her body, which is practically hovering over you right now. When did she suddenly get so close? Her dress still hiked up, revealing her wet and aroused mons.");
	output("\n\n<i>“Though I think my body is craving for some of this too... you don’t mind returning the favor meanwhile, would you, dear?”</i> You aren’t given much time to get in your say-so before she drapes her dress over you, rendering you completely blind. Your sense of smell is heightened to compensate despite this. A mix of lavender from her dress, and the sweet scent of her sex assaults your nostrils, sending you into an aromatic bliss.");
	output("\n\nFeeding off of your ever-growing amativeness, you feel around for the dulla-girl’s stubby horns on the top of her head, gripping them firmly once you find them. With a fierce pull, you ram her head into your groin, taking her to the hilt in one swift movement. A stifled moan reverberates along your length, stimulating it with her gentle vibrations.");
	output("\n\nAt this same moment, her body’s knees buckle, placing her mons directly in front of your face... at least as far as you can tell from the now overwhelming scent of her seductive syrup. You lash out with your tongue in the dark, brushing the tip of it against her sensitive button. The moment that you make contact, a louder moan rings out in the near-silence, and her hips pin your head back against the wall. You struggle to breathe, attempting to take in a gasp of pheromone-rich air before you dive tongue-first into her engorged muff.");
	output("\n\nIn earnest, you bring the hammer down on your lap like she requested, rhythmically pistoning your arms, using her like the oral onahole that she is. Her tongue works furiously whether inside of her mouth or out, never losing its grip and working in concert with your own thrusts. Even in your awkward position against the wall, you push your glutes upwards, rocking your hips upward to get that extra inch or two inside of her.");
	output("\n\nHer pussy crushing your head against the wall doesn’t help much in this endeavor. She is pressing herself <i>hard</i> on your face, making breathing near impossible. Your tongue alternates between circling her sensitive bud and tunneling into her velvety folds, depending on how hard she is pushing them into you.");
	output("\n\nWhen you finally feel the pressure against the back of your head subside substantially, you can feel one of her hands snake in behind it, adding at least some sort of a cushion against the wall. At the moment that she fully has her hand between you and the hard wall, her hips crash against your face again, spearing her lower lips on your tongue again. Before you can recover from the blow, she rears her pelvis backwards and drives forward once more, absolutely battering you into seeing stars. Several times you almost bite your tongue from the force of each thrust, but the increased juice flow make the pain almost worth it.");
	output("\n\nBefore long, you’re at the precipice of your impending orgasm; a few thrusts away from blowing your load. Even though she has a mouthful of dick, you can hear her voice resonate through the room.");
	output("\n\n<i>“C’mon, do it... fill me with your essence,”</i> she coos.");
	output("\n\nDespite the enormous amount of pressure against the back of your head, you lift up a free arm, snaking it between the slender girl’s legs and grab hold of a buttock, pressing her vagina hard into your face. With your other hand, you slam her head down your length at just about the same time the first spurt of your seed sprays down her gullet.");
	output("\n\nThe dullahan squeezes her mouth and throat hard, her tongue milking you all the while for all you are worth through your climax. Your " + (pc.legCount > 1 ? "[pc.legs] clench around her head,":"[pc.leg] clenches") + " with the rest of your body going rigid from the strength of your ejaculation. The last of your tongue maneuvers also sets your otherworldly partner off, as a deluge of girlcum splashes into your mouth. Now with both of her hands behind your head, you hang on for dear life while she fucks your face through her orgasm, just like you are with hers.");
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",dullahanSpoops5);
}

public function dullahanSpoops5():void
{
	clearOutput();
	showName("\nA DULLAHAN!");
	author("Lkynmbr24");
	output("After both yours and the dullahan’s climaxes fizzle out, she slumps down, straddling your lap. When you throw her dress off of your face, you fully expect to see a mess from your tryst, but instead, a [pc.cumColor] mist surrounds the both of you. You look up to see that the girl’s head has reattached onto her neck, beaming at you with zero traces of your seed on her face.");
	output("\n\n<i>“Thank you so much kind " + pc.mf("sir","ma’am") + ". This should be more than enough to get me back to my plane of existence!”</i> She leans forward, locking lips with you once she reaches. Even though you can’t see it, you can still very much taste your own sex, and you’re pretty sure that she can too. You can also feel her hot vulva against your spent tool, subtly grinding against the underside as if trying to goad a second round out of it. Once she breaks the kiss, she brings a hand to your cheek, stroking it softly.");
	output("\n\n<i>“Maybe if I somehow get to meet you again, I’d like to continue where we left off. I really owe you, {Mr./Ms.}...”</i> she pauses for you to introduce yourself.");
	output("\n\n<i>“Steele,”</i> you finish.");
	output("\n\n<i>“Steele... mmm. Nice ring to it.”</i> She sighs dreamily. Before long, the dullahan girl feels lighter on your lap, and she grows steadily translucent.");
	output("\n\n<i>“I’m not long for this world, unfortunately. This is where we’ll have to say goodbye... hopefully for now.”</i> The dulla-girl smiles wistfully before slowly rising from your lap. She is all but transparent at this point; you reach out to her to make contact with her hand, but your hand only sinks through her.");
	output("\n\n<i>“Farewell, [pc.mister] Steele, and thank you. I enjoyed my short time with you,”</i> she calls out to you before completely fading from sight...");
	output("\n\nYou quickly jerk awake, not quite sure if you’re still dreaming or not. Everything about that experience felt surreal. You’re pretty sure you can even still taste the dullahan girl’s sweet juices in your mouth... At least at first. When you rub your tongue against the roof of your mouth, all you can taste is the sourness of having your mouth open for too long without cleansing it.");
	output("\n\nWith a tired grunt, you rise from the bed, only to find that your nethers are quite heavily stained with pre and cum. Well... you suppose that checks out. You take a moment to " + (!pc.isCrotchExposed() ? "shed your clothing to speed wash, ":"") + "freshen up and take a long shower. Once finished, you retrieve your now-clean gear, ready to tackle whatever comes your way.");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//By Linarahn
//Some monster, I guess?
//Bipedal Pcs only (Sorry! Couldn't really think of a way to make this titillating for taurs as well)
//male, female, herm

public function linsMonster():void
{
	clearOutput();
	showName("A\nFESTIVAL...?");
	author("Linarahn");
	output("The soft ring of a wind chime is the first thing you consciously perceive. As if waking from a deep slumber, you open your eyes to the sight of a bustling night market. The chime you heard, you find as you turn your head, is not too far away from you, happily making its music in a gentle evening breeze. There are stands upon stands of wares around you and even more people in between them. Market criers praise what they have to offer. The chatter of the other market goers quickly transforms into a humming buzz, making it difficult to hear anything but the criers clearly – and somewhere deep within, it excites you as fond childhood memories flood back to you.");
	output("\n\nAs you look down, you realize you’re not wearing your equipment");
	output(" and instead, for some reason you can’t quite discern, have come to wear ");
	if(pc.femininity >= 50) output("an elegant kimono with long sleeves, baring your shoulders and showing off your [pc.chest] tastefully, leaving just enough to the imagination to titillate onlookers" + (pc.exhibitionism() >= 66 ? ", much to your enjoyment":"") + ".");
	//if pc femininity 0-50: 
	else output("a light jinbei, leaving plenty of room to move around in even while it underlines your masculine" + (pc.hasPerk("Perma-cute") ? " boyish,":"") + " good looks. You can’t remember how you got here or when you put these clothes on – or if you own clothes like these at all- but that doesn’t bug you much, for the time being. Instead, your attention is rapidly swallowed up by the strings of red paper lanterns flaring up one after the other, as if on a secret signal. A gaze upward tells you just what the signal was: the last rays of the sun disappear behind slanted, tiled rooftops.");

	output("\n\nNow basked in an atmosphere somewhere between a festival and a <b>very</b> busy red-light district, you saunter along, stopping here and there to check out a food stand or take a closer look at the sheer variety of other goods on display. Between fairly benign items such as everyday clothes and hand-crafted decorations, you spot a few raunchier ones. Quality sex toys and fetish gear at a place like this? You give a light, amused shrug. It’s not entirely unexpected. You make a note of those stands in your head, for later.");
	output("\n\nAs you continue to walk, your gaze is inexplicably drawn to one specific person, just a few paces away from you. From what you can make out in the crowd, it’s a young woman, wearing " + (pc.femininity >= 50 ? "a similarly styled kimono like the one you’re donning,":"an elegant kimono with long sleeves,") + " baring her shoulders and showing off her ample, soft bosom tastefully, leaving just enough to the imagination. Her skin appears nicely tan, matching the silky hair as black as the void between the stars, practically flowing from her head. It’s so long that it cascades down to her waist and across her chest, like a frame highlighting her assets even more. In a delicate hand, you notice, she’s holding a paper lantern of her own, decorated with a peony. Through a trick of the light, the flower changes color depending on how you look at it; between its owner and the lantern itself, both are eye-catching for entirely different reasons.");
	output("\n\nShe turns as you stare, giving you a good look of her face – soft, rounded features that give her the air of someone in need of protection contrast with heavy-lidded eyes, shimmering like polished onyx gems, staring back at you, accentuated with deeply saturated red makeup. A smile forms at her lips, accompanied by the tilt of her head. A nod to follow, perhaps? You give yourself an encouraging nod. What’s the worst that could happen, wake up without a credit to your name?");
	clearMenu();
	addButton(0,"Next",linarahnStuff2);
}

public function linarahnStuff2():void
{
	clearOutput();
	showName("A\nFESTIVAL...?");
	author("Linarahn");
	output("You find yourself in a room lit only by candles, resting on a rather large bed – much too big for a single person. Your mind feels hazy and your limbs heavy as you struggle to recall how you ended up here, but that battle quickly fades as you breathe in a sweet scent of herbs and a bit of smoke. With all the effort you can muster, you turn your head, only to spot a sand-filled pot next to the bed. Several sticks poke out of it, each gleaming with embers as thin slivers of smoke weave and snake in the air. Perhaps it is your sluggish mind, but they start to look like exotic dancers, enthralling you with their ethereal, weightless movements. The more you look, the more <i>firm</i> they seem to become solid, forming small, smoke-shrouded men and women putting on a performance just for you, artfully flashing a breast or granting you a fleeting glimpse at a shapely derrière or a half-erect cock.\n\nYou’d shake your head if you could, but it’s to no avail. Even with how heavy your body feels, you’re acutely aware of every little bit of you and the waves of heat rolling through you from head to toe. Unconsciously, you’ve begun to breathe deeper, inhaling more of the smoke and it’s clearly doing <i>something</i> to you. A light, pleasant shiver runs through your body as the waves of warmth ebb and flow in the rhythm of the undulating smoke dancers and with each pulse, your desire to reach out and touch them only grows. Your lips part, your mouth feels dry as you pant, gasping, grasping for more than the teasing presence just out of reach. You want, you need <b>more</b>!");
	if(pc.biggestTitSize() >= 1) output("\n\nYour [pc.breasts] feel strangely hot and heavier than you’re used to. You’d squirm if you could, reach up, soothe your achingly stiff nipples and do whatever you could to abate the relentless, heated, electrifying, wanton desire radiating from your heart outward. You can feel it thumping hard, enough to make your bust jiggle even if you’re lying completely still. A soft gasp escapes your lips as you’re audibly begging for a touch, any touch. Even a cool, stiff breeze would do, but you’re left to simmer in warmth and immobility.");
	if(pc.hasCock()) output("\n\nYour [pc.cocks] stand" + (pc.cockTotal() == 1 ? "s":"") + " to attention; only now you notice that no fabric is restraining them, and yet, somehow you feel restrained all the same. You feel your shaft" + (pc.cockTotal() > 1 ? "s":"") + " throb as hard as your heart is hammering a steady beat of desire against your ribs. You can tell, of course, but ");
	if(pc.cumQ() < 1000) output("adjusting your head slightly allows you to see the head" + (pc.cockTotal() > 1 ? "s":"") + " of your [pc.cocks] glisten with pre in the candlelight.");
	else output("given the nature of your usual output, watching that steady stream of pearly pre, practically shimmering in the room’s lighting and feeling it slowly slide down your [pc.cocks] is more painfully arousing than you’d thought.");
	output("\n\nIf only someone would touch you!");

	if(pc.hasVagina()) output("\n\nBeing unable to move has rarely been worse! Your feeble attempts at moving your arms, your fingers or thighs all amount to nothing. You’re all too aware of the pulsating, radiating heat that mercilessly spreads from your womb outward, forcing you to suffer every single grasp of your muscles at a cock that isn’t there, forcing you to hear, as clearly as can be. You’re wetter than you think you’ve ever been" + (!pc.isSquirter() ? ". You feel like you’ve turned into a humanoid river at this point.":", but no matter what you try to get yourself to move, you’re left to wallow in your juices, like ripe meat that’s been left to marinate."));
	output("\n\nA sudden thump of wood on wood catches your attention. You’re moving so reflexively that you only notice you’ve actually sat up, startled as you were, after you’ve already done so. Across from you is the young woman you’d seen before. You watch, your mind still foggy, as she slips out of the wooden plateau sandals and how she, standing on one leg without even the slightest waver in her balance, slips off the short toe-socks. She smiles at you, sending a shiver down your spine; you can’t tell if that’s supposed to be good or bad. The woman reaches behind herself, undoing the firmly wrapped cloth belt holding her kimono together with practiced motions, then crosses her arms in front of her chest, her left hand on her right shoulder and vice versa. Slowly, teasingly, she pushes her kimono down, baring herself inch by delightful inch. The candles illuminate her toned, curvy form. For her overall slim frame, her hips are alluringly wide, swaying with each measured step she takes toward you from the moment the silken garment hit the floor.");
	output("\n\nAs the candles illuminate her from behind, you can’t make out much more of her front, though her silhouette outlines her ample chest for you, especially as she reaches up to run a hand through her hair. Your heart feels like it’ll jump out of your chest more and more the closer she gets, and you hope sincerely she’ll help you with your needs. You’re so fixated on her shadow-framed form that you barely realize something soft and silky slithering around your wrists and ankles until it’s too late.");
	output("\n\nThe woman’s hair has elongated beyond what you’d seen previously, restraining you without effort. Somehow, you’re not sure you could’ve put up more of a struggle against her hair if you’d been fully there and considerably less horny. With a wide, predatory smile, the woman crawls onto the bed and presses her lips firmly onto yours.");
	pc.lust(100);
	//If PC has two dicks
	if(pc.cockTotal() > 1)
	{
		output("\n\nNow that she’s so close, brushing up against you, you feel light relief. She’s warm, yes, but noticeably cooler than the heat you yourself feel burning within you, especially in your aching cock glistening with pre. You gasp as she breaks the kiss she forced on you, watching as a silvery strand of saliva glistens between the two of you. She lightly pulls her head back, causing it to break, while a delicate hand with fingers so soft you’re sure she never worked manually for a single day in her life run across your jaw, down your neck and over your clavicle. Tender caresses, a drop of water on a boiling rock. She straddles you as she begins to explore your upper body with her hands in such detail that you’d think she was blind – following and tracing your musculature with extra focus on your [pc.chest], circling your nipples with a single digit. To your heated self, it’s a blessing – an ice cube-like blessing that makes you shiver in pleasure you’ve awaited with bated breath and try to express as much in as soft a coo as you can manage with your dry throat.");
		output("\n\nWith her sitting on your belly, you’re keenly aware of the neatly kempt, similarly soft and silky bush of midnight black between her legs, left to its natural state. From your point of view, her groin is a shimmering pit of darkness radiating warmth inferior to your own and promising slick relief – if her inner thighs and the soft squishing noises she makes as she playfully paints you with her <i>“brush”</i>. A part of you is almost disappointed her <i>“ink”</i> isn’t of the permanent sort.");
		output("\n\nShe exhales softly as she leans in once more to lock lips with you, demanding your full attention. She takes your face between her hands, shifting you, commanding you with her lips and tongue and delicate touch, making you see the outline of her hips rising up. Something silky wraps around your aching, straining [pc.cocks], though it brings little relief on its own. Being touched by something other than this woman’s skin can’t possibly begin to help sate the desires that have been stoked within you.");
		output("\n\nA deep sigh, caught between your locked lips escapes your captor just as you feel the head of your first [pc.cock] part her juicy, plump lips while its brother prods against the woman’s warm, equally plump backdoor, pining to be let in while it smears your pre all over the puckered star, as though that’d help somehow. You return a growl of frustration as you’re stopped by the silken <i>“hands”</i> guiding you, allowing your pre-coated tips to just barely kiss the entrance to your personal paradise for just a little longer. You glare at her, trying to wiggle your hips, push upward, anything to find even a modicum of relief, but a single glance from her has you lying still like a puppy who’s proud to have learned how to play dead. She runs a hand " + (pc.hasHair() ? "through your [pc.hair],":"across your bald head,") + " as if in reward of your unquestioning obedience. You feel her tongue caressing yours with more directed intent than before. Once. Twice. Thrice. On the third brush, after what felt like an eternity of torment just shy of the pearly gates to you, she finally deigns to lower herself fully, impaling herself on your waiting [pc.cocks].");
		output("\n\nIf you’d been a lesser [pc.manWoman], you would’ve probably happily drained yourself dry right that instant, but through some miracle, you hold out. You draw the heavy, warm air that permeates the room in sharply, once more raising the intensity of the pulsating heat coursing through you, blissfully unaware that the silken <i>“hand”</i> that previously held your cock up for its owner is, gently but firmly, squeezing the base of your first cock to prevent an early end. You’re free to enjoy the silky-smooth pussy enveloping you, coating you in its love. As she raises her hips for the first time, you tense. Her inner walls are far smoother than anything you’ve experienced so far, but so is her control. You’d reach underneath your head and grab a pillow to bite if you could. Every inch of your [pc.cock] gets squeezed with such precision at just the right moment, with just the right amount of force, without anything other than the silky, slick sensation all around you, nothing to distract you even remotely from just how alien she feels to you – the closest thing you could compare her to would be a galotian, and even that’s a stretch at this point!");
		output("\n\nHer anus, by comparison, is just a little less smooth, as its texture seems meant to bring a different kind of pleasure – as though it’s meant to bring people with cocks to a less involved, swifter orgasm – that is, if it’s owner so chooses. You grit your teeth at the greater warmth of the woman’s ass; somehow, it’s just as easy going in as her pussy. Much to your surprise, as she raises her hips for the first time, you realize her control back here isn’t any less than her control up front; you couldn’t tell the difference even if you tried, texture and temperature aside. If you weren’t aware, you could’ve sworn you were being treated to a pair of pussies instead, ripe and wanting to be painted in your [pc.cum] for all you’re worth.");
		output("\n\nWithout missing a beat, without having the slightest bit of mercy for your overworked state, for your ever building, increasingly desperate need to cum, she brings her hips back down with an audible smack. You’d be willing to bet her ass jiggled from the impact if you weren’t busy feeling like a living, breathing sex toy to the woman, with nothing to offer but your mouth and your cock, torn between what you should focus on more.");
		clearMenu();
		addButton(0,"Next",geishaDreamDubCock2);
	}
	//If PC has a dick
	else if(pc.hasCock()) 
	{
		output("\n\nNow that she’s so close, brushing up against you, you feel light relief. She’s warm, yes, but noticeably cooler than the heat you yourself feel burning within you, especially in your aching cock glistening with pre. You gasp as she breaks the kiss she forced on you, watching as a silvery strand of saliva glistens between the two of you. She lightly pulls her head back, causing it to break, while a delicate hand with fingers so soft you’re sure she never worked manually for a single day in her life run across your jaw, down your neck and over your clavicle. Tender caresses fall like a drop of water on a boiling rock. She straddles you as she begins to explore your upper body with her hands in such detail that you’d think she was blind – following and tracing your musculature with extra focus on your [pc.chest], circling your [pc.nipples] with a single digit. To your heated self, it’s a blessing – an ice cube-like blessing that makes you shiver in pleasure you’ve awaited with bated breath and try to express as much in as soft a coo as you can manage with your dry throat.");
		output("\n\nWith her sitting on your belly, you’re keenly aware of the neatly kempt, similarly soft and silky bush of midnight black between her legs, left to its natural state. From your point of view, her groin is a shimmering pit of darkness radiating warmth inferior to your own and promising slick relief – if her inner thighs and the soft squishing noises she makes as she playfully paints you with her <i>“brush”</i>. A part of you is almost disappointed her <i>“ink”</i> isn’t of the permanent sort.");
		output("\n\nShe exhales softly as she leans in once more to lock lips with you, demanding your full attention. She takes your face between her hands, shifting you, commanding you with her lips and tongue and delicate touch, making you see the outline of her hips rising up. Something silky wraps around your aching, straining [pc.cock], though it brings little relief on its own. Being touched by something other than this woman’s skin can’t possibly begin to help sate the desires that have been stoked within you.");
		output("\n\nA deep sigh, caught between your locked lips escapes your captor just as you feel the head of your dick part her juicy, plump lips and you return a growl of frustration as you’re stopped by the silken <i>“hand”</i> guiding you, allowing your pre-coated tip to just barely kiss the entrance to your personal paradise. You glare at her, trying to wiggle your hips, push upward, anything to find even a modicum of relief, but a single glance from her has you lying still like a puppy who’s proud to have learned how to play dead. She runs a hand " + (pc.hasHair() ? "through your [pc.hair],":"across your bald head,") + " as if in reward of your unquestioning obedience. You feel her tongue caressing yours with more directed intent than before. Once. Twice. Thrice. On the third brush, after what felt like an eternity of torment just shy of the pearly gates to you, she finally deigns to lower herself fully, impaling herself on your waiting [pc.cock].");
		output("\n\nIf you’d been a lesser [pc.manWoman], you would’ve probably happily drained yourself dry right that instant, but through some miracle, you hold out. You draw the heavy, warm air that permeates the room in sharply, once more raising the intensity of the pulsating heat coursing through you, blissfully unaware that the silken <i>“hand”</i> that previously held your cock up for its owner is, gently but firmly, squeezing the base of your cock to prevent an early end. You’re free to enjoy the silky-smooth pussy enveloping you, coating you in its love. As she raises her hips for the first time, you tense. Her inner walls are far smoother than anything you’ve experienced so far, but so is her control. You’d reach underneath your head and grab a pillow to bite if you could. Every inch of your [pc.cock] gets squeezed with such precision at just the right moment, with just the right amount of force, without anything other than the silky, slick sensation all around you, nothing to distract you even remotely from just how alien she feels to you – the closest thing you could compare her to would be a galotian, and even that’s a stretch at this point!");
		output("\n\nWithout missing a beat, without having the slightest bit of mercy for your overworked state, for your ever building, increasingly desperate need to cum, she brings her hips back down with an audible smack. You’d be willing to bet her ass jiggled from the impact if you weren’t busy feeling like a living, breathing sex toy to the woman, with nothing to offer but your mouth and your cock, torn between what you should focus on more.");
		clearMenu();
		addButton(0,"Next",geishaDreamCock2);
	}
	//If PC has vagina
	else
	{
		output("\n\nYour eyes widen in shock at the sudden kiss, the closeness of another person so unexpectedly; you want to struggle, to wiggle free, but you can’t. Something about her touch, the way she feels wonderfully cool against you, the gentle way her lips play with yours and her ample bosom pressing against your [pc.chest] has your feeble resistance melt away like butter in the summer sun. You catch yourself wriggling into a better, more accepting position for her and gazing into those onyx eyes framed with red, quietly asking, nay, begging for her to do anything but pull away from you. You <i>need</i> this closeness right now. She’s practically covering you with her body, her hair acting almost like a blanket along with herself, providing a sense of warmth and security that’s only offset by the fact she’s got you bound and pinned. It does make you nervous, but to your own mild frustration, less than it should. You feel...strange. Loved and welcomed, adored, desired and loving, welcoming, adoring and desiring in return. Like a lost pet who’s found someone to keep it safe and happy forever. You close your eyes and exhale deeply, like a heavy weight has been lifted off your shoulders. The scent of incense lingers in the air and fills your nose anew as you draw breath yet again, alongside your captor’s own scent – a sweet fragrance, vanilla and honeysuckle. To you, it’s olfactory bliss, as gentle on your nose as her roaming hands across your [pc.chest] and the slow, careful grind of her thigh against your [pc.vagina].");
		output("\n\nEach motion, each caress is deliberate, like you’re being tested, read, played piece by piece as though the woman covering you in little kisses and brushes of her fingertips is having a game of chess against your body. A circling of your nipple, the touch oddly cold to you, like an ice cube; the tip of her index brushes the stiff nub, makes you shiver in delight; there’s goosebumps on your [pc.skin], you just know it. Her sharp, pointy teeth graze at the skin on your neck. They don’t draw blood, but you wouldn’t care if they did, not right now. You’ve never felt so sensitive, so aware of every fiber of your being as far as you can remember – or want to remember. You softly smile at the sensation of your captor’s neat, silky pubic hair tickling you, just a little, she smiles back. Her lips against yours, a determined push, lips part, her taste fills your mouth. A hint of cherry, tea perhaps?");
		output("\n\nYou writhe under her, hot, bothered, sweat beading on your body, making you glisten in the candlelight like you’re her treasure. Maybe you are? If you are, she’s as kind an owner as she’s cruel; her thigh, the gentle kisses of her skin to your clit isn’t enough, not nearly enough! You need more! Much more! A soft whimper as your lips part, your eyes seek hers, begging, demanding, then quiet. She’s met your lips again, soft pillows that demand your silence for now. You arch your back for her as she starts to kiss a trail down your body. Your chin, your jaw, a playful nip to your [pc.ear], a little nibble to your throat. Her arms wrap around you as you push your chest toward her, she’s holding you safely. Like a summer rain, her kisses pepper your [pc.chest], first left, then right, then inbetween, stoking the flames of your want, your desire, but offering no relief again.");
		output("\n\nShe lowers you back down, smiles, asks a question. You nod or shake your head, you’re not entirely sure. Your head swims with excitement and unrepentant pleasure, so keenly aware of her body, and yours, and the velvety bed you’re resting on, and nothing else. No dancers in the smoke, nothing, just her. You’d want to be filled with her, by her, if you could, more than you already are. Her fingers trail across your belly, marking the way for your captor’s lips; she lingers at your mons, not moving further. You groan in frustration! Deliberately, she avoids what you want her to do, graces your inner thighs with her lips, licks up some of your sweat just a hair’s breadth away from your labia while her hair holds you more firmly than you’d have thought possible. There’s no wiggling your way to the pleasure you seek like this.");
		output("\n\nFinally, her breath on your pussy, cool like a spring breeze, here to quell the flames burning inside you since earlier. A languid lick of her tongue, tasting you. Smacking of lips, a soft <i>“Mhh”</i>. It sounds positive! More, soft licks follow, your labia first, then along your slit as a whole, as though she’s cleaning your mess up, just a little. A mischievous twinkle from between your legs as she suckles on your clit, a delicate finger circling your entrance. You’d draw the digit right in if you could, but you can’t, you don’t. Patience. Your heart hammers in your chest, the weight of your need almost too much to bear when weighed against what little relief she offers, like taking a watering can to fight a raging wildfire.");
		output("\n\nAnother question, this time it registers fully. <i>”</i>Do you long to be filled”</i>, she asks, her voice warm, smooth like clear, golden honey spread over your breakfast bread, <i>filled with my essence? Or do you prefer me the way I am now?”</i>");
		clearMenu();
		addButton(0,"Fill Me!",fillMeWithYourGooooooooo);
		addButton(1,"As You Are",asYouArePussStuff);
	}
}

public function geishaDreamCock2():void
{
	clearOutput();
	showName("\nFUCKING...");
	author("Linarahn");
	output("As if something – your eager partner or something else – had been waiting for you to feel that way, you momentarily feel yourself getting tugged in two directions. A moment of panic flashes through your sex-addled mind, then it passes, just like that. Confused, you blink as she relents on your lips, then voice a cry that’s supposed to express surprise, but it dies midway through and is reborn as a deep, primal moan of purest pleasure. On each side of the woman is another you, unbound; but from their expressions, even you in your current state can determine what you must look like; there’s nothing but lust to be seen, as pure as a valuable, cut gem.");
	output("\n\nYour rider beckons the one on your right, having [pc.himHer] move closer, ever closer while she’s now sitting upright. With a little nudge and one or two words of guidance, your other self has its cock right at the height of her face – and you get to watch as she dives for it, swallowing it in one gulp like it’s a piece of candy she’s been pining for. At the same time, you’re bucking, fighting against your restraints – you’re fully aware of her! Even though you’re absolutely positive where <i>“you”</i> are at in the room and with regards to your captor, you can <i>feel</i> it all – her tongue, her teeth, the way she playfully brushes over your urethra, all the while being wrapped in her pussy, where she clearly thinks you rightfully belong.");
	output("\n\nA soft, wet noise barely registers because of that; if you’d been aware, you’d have pegged it for someone opening their mouth after a long while of keeping their trap shut. All the more for you to panic and struggle as you witness what you’d thought unthinkable: a second set of lips and sharp teeth, even a long, undulating tongue at the back of that woman’s head! A tongue that, without getting any resistance from the third you, pulls the final copy of you close by the dick. Were you not split between a delicious mixture of fear and pleasure, you might’ve had a quip ready; as that’s not the case, you’re subjected and subjugated, down to your very core, not only by your captor’s pussy, but also by a duo of languid, teasing and undoubtedly well-practiced blowjobs at the same time – so much so, in fact, that even the thought of her second mouth’s sharp teeth does little to take away from the pleasure overload your synapses are delivering straight to your brain.");
	output("\n\nThat you’ve endured this far is a feat in and of itself, but you’ve long passed the threshold of what should be humanly possible in the presence of this woman. You feel your prostate ache and churn [if pc has balls: and your balls tighten], more than ready to give at least a little back; if you can do so while sating your primal urge to seed this monster woman’s womb and have her bear your child, then so be it! Both her mouths get treated to much of the same. In your mind, you can practically see the thick coating of your cum on her tongues, the way her throat moves as she swallows what you’ve got to give....and the satisfied smile on her face as she pops off your cocks and smacks her lips like she’s just tasted a fine wine.");

	if(pc.hasVagina()) output("\n\nAs is the nature of your anatomy, your [pc.vaginas] cum" + (pc.totalVaginas() == 1 ? "s":"") + " in tandem with its manly neighbors, sending shocks of yet more pleasure to your brain. You’re glad to be lying down; you’re not sure you could take this much extra being the active party, not after the treatment she just gave you. With a cheeky, exhausted smirk, you let yourself sink into the pillows as far as you can.");
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",wakeyWakeyFromCloningDream);
}

public function geishaDreamDubCock2():void
{
	clearOutput();
	showName("\nFUCKING...");
	author("Linarahn");

	output("As if something – your eager partner or something else – had been waiting for you to feel that way, you momentarily feel yourself getting tugged in two directions. A moment of panic flashes through your sex-addled mind, then it passes, just like that. Confused, you blink as she relents on your lips, then voice a cry that’s supposed to express surprise, but it dies midway through and is reborn as a deep, primal moan of purest pleasure. On each side of the woman is another you, unbound; but from their expressions, even you in your current state can determine what you must look like; there’s nothing but lust to be seen, as pure as a valuable, cut gem.");
	output("\n\nYour rider beckons the one on your right, having [pc.himHer] move closer, ever closer while she’s now sitting upright. With a little nudge and one or two words of guidance, your other self has its second cock right at the height of her face – and you get to watch as she dives for it, swallowing it in one gulp like it’s a piece of candy she’s been pining for. At the same time, you’re bucking, fighting against your restraints – you’re fully aware of her! Even though you’re absolutely positive where <i>“you”</i> are at in the room and with regards to your captor, you can <i>feel</i> it all – her tongue, her teeth, the way she playfully brushes over your urethra, all the while being wrapped in her pussy and restrained in the tight confines of her asshole, where she clearly thinks you rightfully belong. The first dick, meanwhile, so as to not be left out of the fun, finds itself wrapped in strands of silky hair forming a hand, giving slow, measured pumps that work entirely against the rhythm of either your lover’s hips or her mouth, for that matter, messing with your perception. Perhaps she’s aware her hair feels less pleasurable to you and is trying to make up for it? You wouldn’t know. All you know is that whichever of your double’s cocks is currently being wrapped in hair is just being kept ready for your captor’s mouth to enjoy.");
	output("\n\nA soft, wet noise barely registers because of that; if you’d been aware, you’d have pegged it for someone opening their mouth after a long while of keeping their trap shut. All the more for you to panic and struggle as you witness what you’d thought unthinkable: a second set of lips and sharp teeth, even a long, undulating tongue at the back of that woman’s head! A tongue that, without getting any resistance from the third you, pulls the final copy of you close by one of its dicks. Were you not split between a delicious mixture of fear and pleasure, you might’ve had a quip ready; as that’s not the case, you’re subjected and subjugated, down to your very core, not only by your captor’s pussy, but also by a duo of languid, teasing and undoubtedly well-practiced blowjobs at the same time – so much so, in fact, that even the thought of her second mouth’s sharp teeth does little to take away from the pleasure overload your synapses are delivering straight to your brain.\n\nThe second mouth opens wide, like it’s yawning – still holding that one cock with its tongue – then pulls your second double forward, opening wide enough to swallow both shafts at once, seemingly without issue. As you can feel though, it’s a little too cramped after all. A soft huff through the nose escapes your captor. Apparently, that wasn’t quite what she’d planned. What follows is the tongue-lashing of a lifetime! You feel the slippery appendage worm between your cocks, slither along their lengths as far as the prehensile muscle can manage, wrap around one to stroke it...and there’s just something so delightfully perverted about having both your urethras treated to a teasing, languid lick at the same time – and in the same mouth, no less!");
	output("\n\nThat you’ve endured this far is a feat in and of itself, but you’ve long passed the threshold of what should be humanly possible in the presence of this woman. You feel your prostate ache and churn [if pc has balls: and your balls tighten], more than ready to give at least a little back; if you can do so while sating your primal urge to seed this monster woman’s womb and have her bear your child, then so be it! Both her mouths get treated to much of the same. In your mind, you can practically see the thick coating of your cum on her tongues, the way her throat moves as she swallows what you’ve got to give....and the satisfied smile on her face as she pops off your cocks and smacks her lips like she’s just tasted a fine wine. Your other cock, buried snugly within her backdoor, is just as eager as its brother to seed the ground it had been chosen to plow, uncaring how much she’d been filled already and naturally unaware that its endeavor was bound to be fruitless; nevertheless, from how your captor squeezes down on it, trying to wring out every last drop to coat her bowels, she’s thoroughly enjoying every second.");
	if(pc.hasVagina()) output("\n\nAs is the nature of your anatomy, your [pc.vaginas] cum" + (pc.totalVaginas() == 1 ? "s":"") + " in tandem with its manly neighbors, sending shocks of yet more pleasure to your brain. You’re glad to be lying down; you’re not sure you could take this much extra being the active party, not after the treatment she just gave you. With a cheeky, exhausted smirk, you let yourself sink into the pillows as far as you can.");
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",wakeyWakeyFromCloningDream);
}

//Want to be filled:
public function fillMeWithYourGooooooooo():void
{
	clearOutput();
	showName("\nFUCKING...");
	author("Linarahn");
	output("Your answer is barely a whisper, but she nods in understanding, smiles, rubs your left outer thigh as she accommodates. You watch as her other hand dives between her legs, stroking noisily. Gasps of pleasure escape even her as her fingers dig into her body. The slick, squishy noises and her gasps fill your ears, you close your eyes; it’s music to you, right here, right now.");
	output("\n\nAs you open them up, you see her face, flustered, panting, then a smack of something you know belongs to her, but it’s hard, then another smack, both against your thigh; something warm splatters across it, warm and sticky. Your eyes widen as she presents a pair of human cocks to you, a roguish smile on her lips. Your mouth waters at the sight; even if you didn’t like cock at all, you’d want to suck on these all day; plump and juicy, not too big, not too short; perfect for a woman of her proportions. You think that, even if they were soft and you weren’t this horny, they’d look really good on her. She plants a final kiss on your pussy, making you shudder, then you see her crawling upward, toward you. Her lips meet yours; cherry mingled with your feminine flavor. She breaks away, straddles you, playfully waggles her lower cock at you, wraps you in her hair to help you up just enough, hold you in comfort.");
	output("\n\nEagerly, your lips part, your nose filled with the musky scent of dick, incense and the warm, less aggressive fragrance of your captor’s own pussy drip-drip-dripping onto your chest. That she wants you this much fills you with pride, but you’re not sure she wants you as much as you want her right then and there.");
	output("\n\nHer dick fills your mouth near completely. It’s got more give, more softness to it than a man’s of comparable size, but it’s more fulfilling to you; even with how it smells, it’s somehow quintessentially feminine, a little spongy. You lick it, swirl your tongue across the head, gather up the pre. It’s delicious to you! Her hands grasp your head, she moves her hips, holds you steady while she thrusts. Her other cock drools its pearly goop into your hair, but you don’t protest; all you can think about is her, her dick, her fragrance and body taking up all your senses. You gaze up at her; you’d smile if it wasn’t so difficult with a mouth full of cock. She smiles back, pulls back her cock, lets you have the other while a hand brushes over your forehead. You spot a pearly dollop, she licks it up, then grins at you. Even she thinks she’s delicious!");
	output("\n\nWhat wouldn’t you give to have her just cum down your throat, but you know she has other plans. Once she’s satisfied with your lubricating work, she scoots down, kisses you again, a little longer than she’d intended originally; you’re too sweet to her to resist. She kneels between your legs and you spread them as wide as her hair bindings allow; she allows you more room, helps you get comfortable. Finally, your legs rest on her shoulders while her cocks kiss your entrances. She grabs you by the hips and tugs you down, closer to her. Hands formed from her hair hold her twins while her real hands interlace their fingers with yours. You can see how her heart pounds in her chest, almost in tandem with yours now as she pushes forward, ever so carefully so as not to hurt you.");
	if(!pc.hasPerk("Buttslut")) output("\n\nYour ass is slower going, resisting the intrusion initially, even though you know you want her; she helps with a set of fingers made of hair, massages your tight ring, keeps on pushing slowly until, finally, you feel her sink into you.");
	else output("\n\nYour ass is just as easy, if not easier, as your pussy is. You can see the flash of surprise on her face at the realization and, if not outwardly, at least inwardly grin from ear to ear. Your anal experience had to catch someone off guard sooner or later!");
	output("\n\nYou cry out in delight, not entirely certain if it’s because of the penetration or because it’s her giving you even a modicum of pleasure. To you, it’s as though the first of your thirst is being quenched at last by a helping hand. You wiggle your legs a little, causing your captor to smile and keep you closer as she begins to move her hips, rolling them forward, letting her cocks brush across your roof; you bite your lower lip as you feel those shafts move in unison, separated by so little of you; two sets of throbs, twice the cooling, soothing trails of pre painted inside your body, like a landing strip for that which will save you from your personal pleasure hell.");
	output("\n\nAs if she’s responding more to your own needs than what she wants at this point, your lover quickens her pace, never giving you her entire length, instead focusing more on the entrances of both your holes. You love how she pulls back so far you’re afraid she’d slip out and leave you empty for just a moment before relief at the contrary being true sets in. The exchange between lustful fear and your lusts being tended to is steadily becoming too much, far less bearable than the stewing you’ve suffered up until now. You let your legs drop off her shoulders, shakily, one by one, then wrap them around her hips, pull her close as best you can. She understands, smiles, hugs you tight as her rhythm increases, directed by the crescendo of your voice, the intensity with which you clamp down on the pair of cocks. You writhe in her embrace, feel your fingers dig into the skin of her back, shudder at the throbs of her twins within you, then – release, like a jump head first into a cool ocean after running through the desert for hours, being served the refreshment you’ve been pining for for ages. As you pant and shiver in her grasp, eyes squeezed shut and sweat dripping off of you, a gentle warmth blossoms inside you; a pair of alabaster flowers filling you utterly with a certain kind of devoted affection; one you wouldn’t mind taking a long-term souvenir away from.");
	if(pc.hasCock()) output("\n\nYou barely register as your [pc.cocks] join" + (pc.cockTotal() == 1 ? "s":"") + " your lover’s in their purpose, covering your chest and face in your own [pc.cum] like the brave soldier" + (pc.cockTotal() > 1 ? "s they are":" it is") + ". She smiles and leans in, licking a particularly thick wad off your cheek and rolls it around in her mouth to savor the taste.");
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",wakeyWakeyFromCloningDream);
}

//[Choice: As you are]
public function asYouArePussStuff():void
{
	clearOutput();
	showName("\nFUCKING...");
	author("Linarahn");
	output("Your answer is barely a whisper, but she nods in understanding, smiles, rubs your left outer thigh as she accommodates. As soon as you give your response, she dives back in, burying her face between your legs. Her petite nose draws in air as deeply as you did the incense before; judging by the sigh that follows, she’s in heaven with your fragrance. You feel your cheeks heat up; is it warm in here? It sure is, isn’t i- mmmmh, that tongue is phenomenal! You’d grip the bedsheets if you could just move your hands, but alas, no such luxury for you. You close your eyes and clench your hands into fists as you’re caught in a pincer attack – a finger softly beginning to probe your depths while that wicked set of lips and tongue suckles and swirls around your clit.");
	output("\n\nYour captor’s lips form a seal around your pleasure pearl, as far as you can tell with little more than what you feel to go on, light suction keeping it primed and ready for some loving tongue abuse, getting covered in the warm, wet muscle over and over, coated in warmth – until that feeling is no more. You pout, bite your lower lip as you try to right yourself and see what in the world your lover is doing, only to lose that drive as soon as you’d formulated whatever much of a plan that had been. The woman’s already cool breath caresses your bold little bean, coated in saliva; the cold feels good, perhaps too good! A second light blow has you wiggle deeper into the bed; a gentle kiss to your lower lips makes you squirm just that much more.");
	output("\n\nMeanwhile, that digit probing your depths had done little beyond making sure you were stimulated at all times, even when the woman’s mouth wasn’t messing with you, but now, it had plans of its own. The woman scoots off to the side and leans in, gracing the lips on your face briefly for a tender peck before she moves just a little further down again so her arm would be in a more comfortable position; you lick your lips as you taste yourself. Slowly, just as carefully as before, it’s now her middle finger that pushes into you, the underside facing the roof of your pussy. You bite your lower lip, bracing yourself as you have an inkling for what she’s about to do. You’re not convinced that helps much, however, not with the way she now curls her digit, allowing it to travel along as far as it can, on the hunt for a certain spongy spot that, judging by your own moans and quivering hips, is quite successful indeed!");
	output("\n\nSuddenly, you feel oddly constrained; you open your eyes, look at yourself. There’s nothing, how strange. As you look up, you see something even stranger. Yourself! Bound in...your lover’s hair? From what you can tell, it’s a skilled bondage hold, the entire upper body bound deliciously, your other self’s [pc.chest] on full display and its legs held open, giving yourself a full view of what your [pc.vagina] looks like to others, without the help of a mirror. A squelching noise reaches your ears and you look around, confused. Then, you see it: a long, wiggling tongue emanating from the back of your captor’s head, giving that copy of yours a good, long lick. You can feel it, somehow. Your pucker clenches involuntarily. It’s not wet, except from your own sweat, but you’re confident you’d just been licked all the way from your ass up. Whatever kind of trick that was, it was neat...not that you’re really fit for critical thought in your current state, anyhow.");
	output("\n\nAs you are now, everything around you is so clear to you. The scent of vanilla and honeysuckle, the incense’s smoke still burning in your lungs. The texture of the bed, the sweat drenching it; you recall your own taste after the last kiss. That hint of salt, a little sweat mixed with your own <i>“special sauce”</i> you’ve been marinating in for who knows how long. Given the chance, you’d love to return the favor, but already you don’t think you have the strength left. Briefly, you wonder if she tastes as much of vanilla and honeysuckle as she smells of the stuff, seek her eyes, reach out with a hand. Her fingers on yours, between yours, interlaced, the soft squeeze, your skin glistens with sweat, hers does now, too. Thanks to you? Not sure, not important, she’s here with you, helping, relieving, her cool presence the antithesis of the raging fire in your loins and the insatiable heat in your fruitful center. You feel it clear as day, careful, probing, a second finger, one thrusts, one curls. How does she even do that?! They switch, a gasp. Both thrusting at the same time, a deep groan. A single, light spread; scissors. Does river of pussy juice beat scissors? Then, nothing, no coherent thought, just the sound of your voice and the sound of her fingers moving in and out of you, squish, squish, squish, like a staccato, your breath comes faster, faster, heavier, deep breaths, your palm is sweaty. One hand still clenched, can’t open it anymore, shuddering, squirming......!");
	output("\n\nYou open your eyes, after what feels like an eternity later, watching as your lover leisurely licks her fingers clean, savoring the flavor you so kindly spread all over her hand. It glistens in the candlelight; you smile. She’s happy, you can tell. And you’d be damned if you weren’t happy, too.");
	if(pc.hasCock()) output("\n\nYou barely register as your [pc.cocks] join" + (pc.cockTotal() == 1 ? "s":"") + " your lover’s in their purpose, covering your chest and face in your own [pc.cum] like the brave soldier" + (pc.cockTotal() > 1 ? "s they are":" it is") + ". She smiles and leans in, licking a particularly thick wad off your cheek and rolls it around in her mouth to savor the taste.");
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",wakeyWakeyFromCloningDream);
}

public function wakeyWakeyFromCloningDream():void
{
	clearOutput();
	author("Linarahn");
	output("She comes to rest beside you, at eye level. There are no words that need to be spoken, not now. She is content, and so are you, you can tell. Whatever she is, for whatever reason she brought you here – well, other than to have sex with you – she’s not that bad, in your book. A bit on the monster side, maybe, but that’s fine with you right now. You feel your eyelids getting heavy and see her nod in encouragement. You lean in, helping yourself to a last kiss, then nestle your head against her chest, falling asleep to her breathing and the way her fingers " + (pc.hasHair() ? "comb through your [pc.hair]":"caress across your bare dome") + ".");
	output("\n\nYour eyes snap open all of a sudden. You feel drained and sluggish, like you’d been awake all night. As you try to move, you wince. How are you so sore? Did you drink too much the day before and then have some kind of sex marathon?");
	output("\n\nThe scent of vanilla and honeysuckle catches you. A dash of incense, a faint memory of a candlelit room. As you look around, you sigh, as though you realized you lost something precious to you. You keep your blanket wrapped tightly around you for a while, to stave off the sudden cold.");
	pc.energy(-10);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//As of yet untitled Halloween Dream Event
//GothPastel
//It’s good gay shit and the PC gets fucked by a buff werewolf and a femboy vampire lmao

//Triggers
//Male PC (just dick, but not a dickgirl - cutting down on variants is fun)
//Has lost anal virginity
//It’s around Oct 31st IRL
//And then whatever random chance the mods wanna give it
//PC is bipedal

//Content goes below here
public function gothPastelSpookDream():void
{
	clearOutput();
	showName("WANDERING\nOFF...");
	author("GothPastel");
	output("Oh, strange. You don’t remember waking up. It must be late, still dark out - everything appears in shades of grey.");
	output("\n\nIt’s cold too - not altogether unpleasantly so, but enough to make a few sparse goosebumps spring up on your arms.");
	output("\n\n...Wait, shouldn’t your ship take care of the temperature? Is the thermostat broken?");
	output("\n\nNo.");
	output("\n\nThis isn’t your ship. Where are you?!");
	output("\n\nYou spin around, trying to get a look around you to determine your location, but an ice cold, iron grip seals its way around your shoulder before you can get very far.");
	output("\n\nBefore you can panic, soft yet freezing lips brush your neck, and a soothing voice echoes through the room. <i>“Pet, you wandered off again, didn’t you?”</i>");
	output("\n\nThe silly thought about a ship is gone in an instant as your master’s fangs scrape across your neck - sudden, but oh so gently - and you mewl, pleasured.");
	output("\n\n<i>“Hm, I’m not hungry... And yet you need punished for wandering against permission.”</i>");
	output("\n\nYou <i>know</i> he can feel how your pulse is thundering through every vessel in your body, and you wonder what he has in store for you.");
	output("\n\nSlender hands slip from your shoulders, down your trembling form, but stop just short of your crotch and you whine, trying desperately for his touch. Wide but firm hips press against your ass, a sizable bulge along with them, and you quiet. Master will tend to you eventually.");
	output("\n\n<i>“Your fellow pet is rather worked up, given the season. I think I’ll have you visit him. Follow.”</i>");
	output("\n\nA set of gleaming crimson eyes meet yours, and you’re compelled to do exactly as you’re told, even as your [pc.legOrLegs] tremble" + (pc.legCount == 1 ? "s":"") + " in anticipation.");
	output("\n\nSoon enough, you’re stumbling into a room far less empty than the rest you’ve passed through - thanks to the rather huge wolf-man occupying it.");
	output("\n\nThe creature - no, he - waves at you almost sheepishly, standing to attention, and as your eyes wander, you notice that so does his cock.");
	output("\n\n<i>“Go fetch, pet.”</i> Murmurs your vampiric master, and you fall to your knees before the other man, saliva wetting your lips at the sight of the thick red rocket before you.");
	output("\n\nStrange, you think as your lips wrap around the tapered head, that the only color you’ve seen clearly so far has been red. Almost as if you’re dreaming.");
	output("\n\nYou’re not given long to entertain the thought. As you sink about halfway down the length presented to you, a second one presses against your [pc.asshole], and it flutters from your mind in an instant.");
	output("\n\nSoon, you’re impaled from both ends, firm human cock buried to its hilt in your ass as you" + (pc.canDeepthroat() ? "easily":"struggle to") + " deepthroat the animalistic one. Slender fingers tightening their grip on your [pc.hips] is the only warning you’re given before both of them give a sharp thrust, pushing deeper into you and making you give a muffled cry of pleasure.");
	output("\n\nA single second of respite is all you’re allotted, before the pair are pounding into you with barely a thought for your own enjoyment. Caught up in the moment as you are though, your [pc.cocks] throb regardless, and you race towards your peak.");
	output("\n\nThe cock behind you batters into your prostate, and it’s all you can take, [pc.cum] spraying across the floor.");
	output("\n\nYou feel twitching as the two men fucking you become more and more erratic in their thrusts, but before anything can happen, your perspective suddenly pitches and shifts.");
	output("\n\n...Is that the ceiling of your room? Damn. You’ve got some cleaning up to do.");
	//[Next] {aaaaaand back to ship menu or whatever}
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Halloween Event Submission, Pumpkin Patch <i>“Nightmare”</i>
//Dream sequence, only triggers for bipedal PCs who have lost their anal virginity. Must have genitals

public function pumpkinPatchNightmare():void
{
	clearOutput();
	showName("A\nPATH");
	author("H3X");
	output("You suddenly startle awake to the sounds of wind howling through trees and plants, the rustling of all the leaves surprising you with its volume. Rubbing the sleepiness out of your [pc.eyes], you survey your surroundings and find that you are now on the ground in a small clearing, surrounded by a thick underbrush of dark green thorny plants and dead, scraggly trees that have suspiciously thick vines growing up their trunks. The sky is the deep purple of twilight that indicates it is late, but still not too dark to see. To the south, there is a small path that works its way through the thick undergrowth. Not wanting to push through large amounts of thorns, since you now realize you are naked, you decide to make your way down the path.");
	clearMenu();
	addButton(0,"Next",fuckPumpkinStuff);
}

public function fuckPumpkinStuff():void
{
	clearOutput();
	showName("PUMPKIN\nPATCH");
	author("H3X");
	output("After a short walk around a few bends, the path opens up to a much larger clearing. Roughly the size of a cruiser’s cargo bay, the ground here is almost entirely covered with a viney plant. It has large heart-shaped leaves, some of which are as big as dinner plates. The vines also seem to be producing, as there are many round veggies around; the bigger ones have turned orange. <b>You’re in a pumpkin patch!</b>");
	output("\n\nAcross the clearing, you spy the continuation of the path you were on earlier. Eager to continue, you begin crossing the patch. You make it about halfway before " + (pc.legCount > 1 ? "one of your [pc.feet]":"your [pc.foot]") + " catches on something, causing you to cry out as you tumble to the ground face-first in a heaping mess! Before you can pick yourself up however, you hear several quick snaps as a green vine whips itself into place around each of your wrists and ankles. You struggle against the vines in an attempt to free yourself, but they are surprisingly strong, and with all of your limbs held, there’s no way to unwrap them. You are stuck spread-eagle, completely at the mercy of whatever has you.");
	output("\n\nAs you come to this realization, another much larger vine snakes out and wraps itself around your [pc.belly]. Together with the vines holding your limbs, it lifts you a few feet off the ground, while rotating you so you are again facing forward. A large mass of vines has piled up just a few feet away, forming a stack about the same height as you. On top sits what appears to be the largest pumpkin in the patch, roughly the size of a beach ball. Red light glows from within it in several spots, forming a simple face with a sinister grin. Seemingly from all around you, you hear a deep voice boom “<i>HAHAHA... FINALLY</i>”");
	output("\n\nWith that, many more vines begin reaching for you, some as thin as a pencil, others as thick as your wrist, complete with rounded, suspiciously dick-shaped ends. They begin caressing your [pc.thighs], [pc.butt], and [pc.fullChest], clearly intent on using you for the creature’s pleasure. It isn’t long before your nervousness and fear has been replaced with pleasurable sighs. Several smaller vines are exploring your crotch, another is tickling your [pc.asshole], while the ones at your [pc.fullChest] continue to writhe and grope what they can. Just as you are starting to relax, you feel");
	//if pc has a vagina
	if(pc.hasVagina()) output(" a somewhat large vine with a bulbous head begin to rub and push into the lips of your [pc.vagina]. As soon at it moistens, owing to your excitement, it wastes no time in pushing its way forward into you where it quickly begins thrusting and writhing away. You moan at the strange sensation. The vine doesn’t have the firmness of a normal dick, but it still manages to work every bit of pleasure out of you, its excited thrusting hitting you in all the right spots.");
	//if pc has both vagina and penis
	if(pc.isHerm()) output("\n\nAt the same time, you feel");
	//if pc has a penis
	if(pc.hasCock())
	{
		output(" another larger vine reach out and begin exploring your [pc.cockBiggest]. After bumping and nudging it’s own rounded mushroom against your [pc.cockHeadBiggest] a few times, it seems to realize the problem. After a moment, the end splits into four even segments, which peel back like a banana, revealing a smooth, round opening.");
		//if thickness of largest cock is less than or equal to 5 inches
		if(pc.biggestCockThickness() <= 5) output(" You can’t tell if it more closely resembles an anus or puckered lips, not that you have time to examine it, as the vine quickly envelops your [pc.cockHeadBiggest]. It is apparently extremely hungry for your seed, as it begins quickly pumping your cock, massaging it with unseen internal ribs and lubrication to attempt to quickly bring you to your peak.");
		//if thickness of largest cock is greater than 5 inches
		else output(" You can’t tell if it more closely resembles an anus or puckered lips, not that you have time to examine it, as the vine quickly attempts to envelop your [pc.cockHeadBiggest] again. However, finding your girth too extreme, the vine gives up trying to cram you inside, and instead closes back up and coils around your [pc.cockBiggest] once again. It starts giving you what can only be described as the greatest “hand”-job of all time, pumping madly to attempt to quickly bring you to your peak.");
	}
	output("\n\nThis continues for several moments, the incredible pleasure you are being provided quickly increasing your lust. The creature must be enjoying itself as well, as you suddenly notice that all the vines around you that don’t have a bit of you to interact with are thrashing around wildly. Several make contact with each other, and after a bit of exploratory probing,");
	//if pc has a penis
	if(pc.hasCock()) output(" one head of each pair opens up to reveal its hole to the other.");
	//if pc doesn’t have a penis
	else output(" the end of one of the vines in each pair splits into four even segments, which peel back several inches like a banana, revealing a smooth, round opening.");
	output("\n\nThe pairs of vines then begin vigorously fucking each other! This thing is so pent up it’s actually fucking <i>itself.</i> You don’t have much time to dwell on this, however, as you feel a new sensation: there’s a new vine pressing insistently at your [pc.asshole]. Bound as you are, there isn’t anything you can do as this invader pushes its way past your ring to begin thrusting and exploring. At first you are slightly relieved that the vine isn’t huge, but that feeling is washed away when you feel the vine tickle its way deeper and deeper into your bowels, to depths you aren’t sure have ever been plumbed before. This strange but not uncomfortable feeling, mixed with all the other lewd ministrations is getting you so close. As you feel the familiar growing wave of orgasm creeping ever closer, you throw your head back to moan out in pleasure.\n\nTaking advantage of this new opening, <i>another</i> vine appears from behind your head and quickly plunges into your mouth, ignoring your [pc.tongue] to head straight down your throat. This vine also seems to be focused more on distance than just getting its head in something, as it too goes deeper and deeper with each thrust until you’re confident it is down your throat and poking its way into your stomach.");
	clearMenu();
	addButton(0,"Next",pumpkinFuckerPt2);
}
public function pumpkinFuckerPt2():void
{
	clearOutput();
	showName("FUCKIN'\nPATCH");
	author("H3X");
	output("You begin to wonder why you aren’t gagging or having issues breathing, but that thought disappears when the vine in your [pc.asshole] and the one in your mouth stop thrusting. You can still feel a strange tickling and rustling in your [pc.belly]. After a pause, there’s a weird, small expanding feeling before the vines each push forward a little more and begin wildly thrusting again. Are they doing what you think they’re doing?! This thing is so horny that its vines are actually fucking each other <i>inside you!</i> The sensations of these two going at it, along with");
	//if pc has dick
	if(pc.hasCock()) output(" the vine excitedly milking your [pc.cockBiggest],");
	//if pc has vagina
	if(pc.hasVagina()) output(" the one lovingly plunging in and out of your [pc.vagina],");
	output(" and those that are caressing and groping your [pc.fullChest] are enough to send you over the edge. You tense up with an incredibly powerful orgasm, seeing stars as");
	//if pc has cock that was too big earlier
	if(pc.hasCock())
	{
		if(pc.biggestCockThickness() > 5) output(" your [pc.cockBiggest] powerfully launches rope after rope of [pc.cum] over the vines and ground in front of you. You even manage to splatter some of the large leaves with your spray. The vine wrapped around your member throbs several times itself before launching a gooey orange liquid all over you and the ground in front you.");
		//if pc has cock that fit earlier
		else output(" your [pc.cockBiggest] powerfully launches rope after rope of [pc.cum] into the waiting hole of the vine that has enveloped it, as it hungrily whisks away every ounce of fluid you put out.");
	}
	//if pc has vagina
	if(pc.hasVagina())
	{
		if(pc.hasCock()) output(" Y");
		else output(" y");
		output("our [pc.vagina] clamps down on its viney mate, trying to squeeze every bit of baby batter out of it possible. This results in the vine swelling slightly a few times as it unloads its warm, syrupy payload straight into your womb. Your [pc.belly] sticks out just a little more after it is finished.");
	}
	output("\n\nAs the vine down your throat throbs a few times, you can feel it moving several loads through your mouth and into you, eager to inseminate its partner. A few moments later, the one in your [pc.asshole] swells as you feel it suck the creature's cum back out of you. Apparently no more than a flesh tunnel for the thing to fuck through, you feel a strange sensation when all the vines begin sliding their way out of you. The ones on the ground spew a few more healthy squirts on or into each other. The creature apparently satisfied, it lets you sag to the ground as the last vine pops out of your [pc.asshole] with a wet 'schlick.' The lights within the large pumpkin fade while it slumps to the ground, and all the vines slither back into the leaves like retreating snakes. The last thing you see as your eyes close is a few smaller, green pumpkins growing larger and turning orange as your [pc.face] sinks into the pumpkin cum puddle...");
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",pumpkinFuckOver);
}
public function pumpkinFuckOver():void
{
	clearOutput();
	showName("A\nDREAM?");
	author("H3X");
	output("You startle awake, kicking the sheets off you in the process. You’re back in your bed on your ship. That was an...interesting dream. Maybe you shouldn’t have been thinking about Halloween before falling asleep...");
	//[NEXT] //clear lust, increment orgasm counter, and if pc has penis, apply <i>“cum covered”</i> status.
	if(pc.hasCock() && pc.cumQ() >= 500) pc.applyCumSoaked();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Gardeford’s College Goblin Slut Trick-or-Gangbang
//happen when pc fall aslep
//Dickgirl wiv tiddie biguns
//7777 contendah!
public function gardefordsCollegeGoblinSlutTrickOrTreatbang():void
{
	clearOutput();
	author("Gardeford");
	showName("HALLOWEEN\nGOBLINS");
	output("The ring of a doorbell snaps you back to reality.\n\nHow long have you been asleep? You stretch frantically, adjusting your glasses and regaining your bearings. Did you really nod off? Ugh. Back in college you used to party and fuck all the way through to the first. The bell’s still ringing, and you snap out of your memories long enough to fumble around searching for the bucket of sweet candies. You find it on the kitchen counter, agonizing for a second before popping a small chocolate into your mouth. Fuck the diet, it’s halloween.");
	output("\n\nYou open the door, and are greeted with a sight that brings you right back to your earlier college fantasies. Seven pint-sized, green-skinned women dressed in pointy hats and skimpy robes crowd around the door, holding sacks filled to the brim with various sugary treats. Goblins! It would be utterly impossible to mistake any one of the group for trick-or-treating children, especially with what the brisk holiday night air is doing to their nipples. They must be transfer students.");
	output("\n\n<i>“Trick or Treat! ‘Know it’s late but you gotta have </i>somethin<i>’ left, right?”</i> the foremost goblin pipes up while you’re still ogling her friends. She has a shock of bright blue hair, and a rack that makes your knees weak. You can plainly see the imprint of stud-pierced nipples through the sheer fabric of her robe. Her blatant display makes your own underwear suddenly feel much tighter. The lot of them smile brightly, waiting expectantly for your answer. You should really just send them on their way with an extra helping of candy.");
	output("\n\n<i>“Oh, I must have something for you girls, but it looks a bit chilly out there. Wouldn’t you come in and warm up a bit before I send you on your way?”</i> The words tumble from your lips, directly at odds with the thoughts running through your head. You don’t do this kind of thing anymore, and besides it’s been way too long. The cyan haired shortstack gives you a further looking over, and her smile gains a knowing mien. With a blush, you realize your cock is straining against your jeans, all but ready to snap the button off.");
	output("\n\n<i>“Hey guys, isn’t it really cold out? This nice lady wants to help us warm up, and it’d be super dumb to just ignore her,”</i> she makes an exaggerated show of shivering, a motion that only makes her ginormous tits jiggle enticingly. You back through the door to let them in, your eyes lingering a little too long on each as they pass by. A perfect ass on one, the perfect lips on another. It’s hard to hold back your rampaging fantasies as you make space for them in the living room and slip into the kitchen. Maybe making some cocoa will help you settle down a little.");
	output("\n\n<i>“Hurry! We don’t have a lot of time,”</i> comes a voice from behind you. You spin on your heels, gasping when you see the blue-haired leader of the goblin bunch. Her robe is totally undone, hanging on her shoulders like a coat, and she’s wearing absolutely nothing beneath it. Earthy green skin and even duskier emerald nipples draw your eyes and fuel your lusts. Her breasts are almost as big as yours, proportionally of course, and what you mistook for studs are a pair of pumpkin shaped shield piercings that glisten brightly in the dim light. A garden of olive colored fuzz betrays her hair’s true color, twisting in tantalizing whorls away from a slit that matches her nipples. The sight of her naked body is too much for your jeans, which pop open with an audible snap. Every inch of your foot long shaft pushes its way into the open air, and it’s the college slut’s turn to gasp.");
	output("\n\n<i>“W-wh-w-whu-hat are you doing”</i> is what you try to say, but while you’re still stumbling over your words the pint-sized slut crosses the gap between you and plants her lips on your cock. A brief moan escapes your lips before you clap a hand over your mouth. What if the rest of them heard you? What if the six young, eager things in the other room heard you moaning like a whore. Your heart pounds in your chest, pumping blood straight to your crotch, and the girl at your waist hums appreciatively.");
	output("\n\n<i>“Fuck, it gets even bigger? I lucked out! Now come on, where do you want me? The table? A chair? Over the counter?”</i> She asks, pulling back to look up at you as her hands work your length with rough tugs. It’s not too late to tell her to stop, but your eyes flit to the table, and it’s too late. The thought of her lying on the tablecloth with her legs open and begging for your cock is too much. She smiles another knowing smile, guiding you cock first to the table and scooting herself up. She spreads herself face down, robbing you of your imagined scenario, but with her ass hovering in the air you can’t bring yourself to complain.");
	output("\n\n<i>“Just... I’ll get uhh... condom,”</i> You start, staring at her open emerald slit as you speak. It’s drawing you in, dripping with sexual excitement that drops from her thighs onto the tablecloth. She’s so ready for you, and god do her folds feel good on your cockhead. You rub the tip against her clit, relishing the brief gasps and moans that come from beneath you. She looks back over her shoulder, fixing you with a lusty glare.");
	output("\n\n<i>“I’ll get you my number before I go. I could be your condom any day!”</i> she says, shaking her hips to get a little closer. Fuck it. You take hold of her ass, thrusting as deeply as you can into the grinning goblin with one measured push. She takes you deeper than you would’ve thought, going all the way to the hilt with ease. With that knowledge you lose the thin veneer of control you’d been maintaining, you pull back, slamming your full length back into her cunt hard enough to push her further onto the table. Her eyes roll back, and you lean forward onto the cloth covering. You meant to lean in for a kiss, but she’s far too short, and her head only comes up to your chest.");
	output("\n\n<i>“F-fuck! You’re so tight,”</i> you half whisper, kneading her ass with both hands as you fight to keep a steady pace. You know there’s no way you’ll be able to hold in your voice if you really let yourself go. A brief grunt is all you get in response, and you can see the woman’s arms splayed out in front of her, gripping the cloth with clenched fists. God is she hot, too. If she’d been cold outside at all it doesn’t show, and her feverish warmth spreads right on into you. The effect makes your top feel so tight, and you can’t help but pull yourself free of its constraints. Your G-cups jiggle in your bra for a moment before that’s gone as well, shucked and discarded onto the kitchen floor.");
	output("\n\nThe stacked goblin gives a muffled moan as you drop back on top of her, picking up your pace to make up for the lost time. Her small frame, even with the thick hips and amazing rack, is totally engulfed by yours. You can feel her moaning beneath you more than hear it, and each shudder as you pound her pussy spreads more warmth through your body. The skin to skin contact is innervating, filling you with the desires you tried so hard to suppress. Fuck! How many times can you fuck her before her friends get suspicious? If it’s just the one you’ve gotta make it count.");
	output("\n\n<i>“Wow. you must not get it a lot out here, lady,”</i> she breathes as you flop her onto her back. Her chest heaves, and her body glistens with sweat. You don’t grace her with a response, opting to tweak those dusky emerald nipples instead. Her piercings seem almost designed with pinching in mind, letting your thumb and forefinger slip through each to get at the puffy nubs. She squeals with pleasure, and her insides tighten delightfully around your cock. You want desperately to see her reactions as you fuck her, but the noise won’t do. Unless...");
	output("\n\n<i>“Shh, you wanted me all to yourself, didn’t you?”</i> you say, popping one of your heavy tits into her open mouth. She goes to work sucking immediately, rolling your nipple around with her tongue and kneading your other breast with a free hand. In this new position she’s free to lock her legs around your waist, or at least around your hips. Her ankles stop just short of your butt, anchoring her to you with sex fueled strength. As if you’d let her off your cock even without the extra help.");
	output("\n\nYour hands explore the smooth curves of her thighs and stomach as you resume your thrusting. The urge to let go is all but impossible to resist now, and you barely notice as your motions begin to shake the tableware. Plates and glasses clink together and fall over as you aggressively mash your hips into the smaller woman. Your balls, ripe with seed, slap against her ass with each pounding smack. A ragged moan escapes your lips as you toss your reservations out the window. Her friends can listen if they want. In fact, you want them to </i>hear</i> you fill the blue haired slut with little goblin babies. The thought of her pregnant and still coming over every night for a fuck, or even better, making good on her promise and being your live-in goblin condom, is too much.");
	output("\n\nYou collapse atop her, feet almost slipping on the tile floor as you push as deep as you can. The curvy cutie’s body tenses up as you finally cum, accepting every spurt of your seed with a shuddering micro-orgasm. She buries her face into your cleavage, but can’t mask her brain-melting bliss any better than you can quiet yours. When her womb is full, there’s no place for your jizz to go except back out onto the tablecloth, dripping down over her ass and your balls in a steady stream. You stay connected for what seems like an eternity after you stop cumming, letting the greedy goblin cunt milk every last drop from your cock.");
	output("\n\nWhen she finally relaxes, you push yourself up on shaky legs, leaning down one last time to pull her into the kiss you missed out on at the start. She returns it wholeheartedly, exploring your mouth with her wide tongue. Her saliva is sweet as candy, and you don’t want to stop kissing any more than you wanted to stop fucking. You force yourself to pull away first, staring into her deep brown eyes as the two of you catch your breaths. The cups and decorations that litter your table are in various states of disarray. The bowls are fine, but your candelabra and most of the cups are knocked clean on their sides.");
	output("\n\n<i>“Wow lady. Never thought I’d find something this good in a town like this. I hope you’re good to do that, like, six or seven more times,”</i> she gasps, grinning wide. Six or seven more..? You look towards the kitchen door, and are greeted by the other girls you never really believed had been waiting patiently in the living room. All are undressed or in the process of undressing, and each shares a hungry look as they eye your cum-slicked shaft...");
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",gardeGobboEpilogue);
}

public function gardeGobboEpilogue():void
{
	clearOutput();
	author("Gardeford");
	showName("\nHALLOWEEN");
	//next if no mitzi
	if(!mitziIsCrew())
	{
		output("You bolt upright in bed, gasping for breath. Phantom kisses and tongues still play your skin, feeling almost real. ");
		if(pc.skinType == GLOBAL.SKIN_TYPE_SKIN) output("That dream felt so real, but you you’re awake now. ");
		else output("Wait, you don’t even have skin, or at least not the kind you swear you were feeling. ");
		output("You pull away the blankets, sighing as you see");
		if(pc.isHerm()) output(" the double coating of sexual fluid that covers your body. You’ll need to wash the sheets, and the blanket, and probably take a shower.");
		else if(pc.hasCock()) output(" the coating of [pc.cum] you’ve given your stomach." + (pc.cumQ() >= 1000 ? " You’re gratefully surprised there isn’t more. With your usual load size you could’ve been swimming in the stuff.":""));
		else if(pc.hasVagina()) output(" the slick of [pc.girlCum] coating your thighs. You’ll need to wash the sheets, and maybe take a shower." + (pc.isSquirter() ? " You’re gratefully surprised it isn’t worse. Usually your orgasms open the floodgates.":""));
		else output(" the coating of sweat that’s soaked into the sheets and blanket. Ugh, you need a wash.");
	}
	//If mitzi crewmate
	else
	{
		output("You try and gasp in a breath, and are sequestered by... something!? Something warm, wet, and familiarly sweet. You sit up, and Mitzi rolls off your face and down onto the cabin floor. She doesn’t appear the least bit disturbed, moaning softly in her sleep and rubbing her fem-cum soaked thighs together. Well, that’s one way to explain the dream you just had. The feeling of sticky wetness beneath your covers is hard to ignore, but hey; that’s a problem for morning [pc.name]. You hoist Mitzi by the arms, pulling your goblin cumslut back up onto the bed and tucking her in right next to you. Who needs dream goblins when you’ve got one of your own? You give her a tweak on one nipple before squeezing her tight and drifting back to sleep.");
	}
	//merge and end
	//(pc gets cumcovered)(wakes up right away if no mitzi, otherwise sleeps more. If mitzi has some kinda wake up BJ/eatout scene maybe start that. It sounds like something she’d have but if not :()
	//Fen note: neither scene seemed to have enough girlcum to drench the PC in it, actually. :thumbs_up:
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Happy Halloween! If you’ve ever had sexy thoughts about the wall of hands in Labyrinth, then this is the encounter for you! I’ve also mixed in a common superstition ("hagging" or "choking ghosts") to make sure the haunting lingers a bit.
//Foragpus’s
public function handsDreamFromFrogapus():void
{
	clearOutput();
	showName("\nDREAM...");
	author("Frogapus");
	output("You drift off into sleep, feeling the world falling away beneath you. As blissful unconsciousness takes you, you are dimly aware of a faint touch against your body as you drift off.");
	output("\n\nYour eyes snap open.");
	output("\n\nThere’s something heavy pressing down on your chest. You try to make it out in the darkness, but can’t see much more than the shape of something shadowy sitting atop your reclined body.");
	output("\n\nYou try to sit up, but something holds you fast. Something’s pinning you down-you can feel hands gripping you shoulders, your wrists, ");
	if(pc.isTaur()) output("and all four of your legs.");
	else if(pc.isNaga()) output("and down the entire length of your body.");
	else output("your knees and your ankles.");
	if(pc.tailCount > 0 && pc.hasTailFlag(GLOBAL.FLAG_LONG)) output(" Even your tail is caught in some iron grip.");
	output(" You open your mouth to yell, but can’t seem to find the breath for it. You’re aware of cold thighs pressed against your sides, and squint at the shadow on your chest, realizing that it’s something straddling you.");
	output("\n\nThere’s a dim, gray light coming from somewhere, and as you struggle against the figure pressing down on you. It looks vaguely female with long, black hair framing a featureless face. Your eyes adjust and you begin to make out a slim frame, white skin, and small, bare breasts. She’s leaning forward, her hands pinning down your shoulders. Something about her arms seem <i>wrong</i>, though, as if she has too many elbows.");
	output("\n\nPinned beneath her, you can only gape in mute horror as her blank face splits open, revealing a glowing-red eye. You shout and struggle against the invisible grip on you, trying to break free. Her wrong-way arms push you down and you feel yourself sinking, sinking into the ground.");
	clearMenu();
	addButton(0,"Next",handsDreamFromFrogapus2);
}

public function handsDreamFromFrogapus2():void
{
	clearOutput();
	showName("\nHANDS");
	author("Frogapus");
	output("Helpless, you sink through the floor, pulled down, down down by the hands into darkness. As your eyes adjust, you become aware of movement all around you. In the wan, nowhere-light, you become aware of your surroundings. You’re in some sort of vertical shaft, stretching both up and down to an impossible distance. And the walls... your breath catches in your throat and you lurch backward.");
	output("\n\nThe walls are covered in hands!");
	output("\n\nReaching, grasping, flexing, thousands upon thousands of hands line the walls, running down to the endless darkness and up towards the distant light. The nearest ones seem to sense you, and reach towards you. You can feel their warm touch against your [PC.skin], grasping and holding you. You struggle, finding no purchase against the countless hands-they simply give way if you kick or shove, going slack if you pull." + (pc.canFly() ? " There’s not even enough room in here to fly away.":""));
	output("\n\nAs panic begins to set in, you become aware that the hands aren’t just holding you in place. The majority of them are starting to roam over your body. You shiver at their touch-warm palms cupping your cheek, light fingertips tracing along your [PC.ears]. Thumbs brush down your [pc.lips] as a trio of hands " + (pc.hasHair() ? "run through your Pc.hair, toying gently with it.":"run gently over your head.") + " Touches dance across your shoulders, while soft caresses run down your sides, from your ribs down to your [PC.hips].");

	output("\n\nYou moan involuntarily, as the countless hands explore your body. ");
	if(pc.biggestTitSize() <= 3) output("No less than four hands are splayed across your [PC.breasts]. Two of them mirror each other, caresses the subtle curves of your chest, while the other two pluck lightly at your nipples.");
	else if(pc.biggestTitSize() < 20) output("A half dozen hands cup and caress your breasts, warm palms pressed against them and massaging them gently, while others trace slow circles around your areola, fingernails delicately dragging over their stiffening tips.");
	else output("No less than a dozen hands are deployed across your massive jugs, pressing into your soft pillowness, swirling incomprehensible patterns across your areola, tugging and teasing at your nipples.][More than one row of breasts: It’s difficult to count the hands arrayed across your breasts, as their light touches alternate and overlap. It could be two or two dozen, cupping, caressing, teasing, and tugging.");
	output(" They slide their way down your thighs. You bite your lip as they grasp and squeeze the inner parts of your [Pc.thigh], sending shivers throughout your body. You can feel your resistance weakening, and it seems the hands can feel it as well.");

	//Dick
	if(pc.hasCock()) 
	{
		output("\n\nAt the first brush of a palm against your stiffening shaft [PC.cock] you flinch, feeling a globule of pre slowly ooze its way up your length. The moment it squeezes out against the questing hands, they redouble their efforts, smearing it down along your length, coaxing more oozing heat from your shaft.");
		//Dick>12 inches
		if(pc.cocks[0].cLength() > 12) output(" Another hand joins it,a subtle counter-rhythm that works your dick in time with the other, prompting a low moan from somewhere deep inside you.");
		//Multidick
		if(pc.cockTotal() > 1) output(" Soon, there are hands sliding up and down " + (pc.cockTotal() == 2 ? "both":"all") + " of your shafts at different speeds. You throw your head back, drowning in the pleasure flooding your brain.");
	}
	output("\n\nYou buck your hips, feeling two slim hands grasp your [Pc.butt] as you do, helping you push in time to the other hands. Even here, the hands massage and explore, pushing in deeply, squeezing your [PC.ass].");
	//Vagoo
	if(pc.hasVagina())
	{
		output("\n\nA solitary fingertip grazes up along your slit, and you shiver, a whimper of pleasure escaping your lips. More follow it, tracing, prodding, and exploring, your warming cunt. Your whole body convulses as fingers spread you wide, tracing up and down your sensitive inner folds. Shivers of pleasure radiate outwards, heating you up from head to toe. Your thighs shiver, as a finger, slick with your juices begins to probe inward.");
	}
	output("\n\nYou yelp in surprise as a finger presses against your butthole. You writhe briefly, unsure of where the hand is going, but the swarm of hands offers you no escape. All you can do is moan softly as a finger probes its way gently into your ass. A single digit, strangely slick, works its way in as other hands firmly grip your ass, keeping you from wriggling away. The same grip is mirrored by the hands holding your [PC.thighs] in place, countered by the delicate, feather-like touches against the inner portions of your thighs.");
	output("\n\nThere’s far too much to keep track of, and you surrender to the host of gray-lit hands and the flood of sensation washing over you. A thumb runs delicately across your lips, leaving a tingle in its wake. ");
	if(pc.hasCock())
	{
		if(pc.cocks[0].cLength() < 12) output("No less than three hands are working your dick now, two pumping in counter rhythm to each other, while another squeezes your balls in time to the other two. ");
		else output("There’s at least a half dozen hands working your massive shaft, each one stroking, teasing, and tugging in unison. ");
		if(pc.cockTotal() > 1) output(" A parade of hands is working your shafts, seemingly switching out between one another, stroking and working your dicks in a complex, sensual rhythm. ");
	}
	output(" Warm palms press against the small of your back, sending happy shivers up and down your spine.");
	if(pc.hasVagina()) output(" So many fingertips are playing with your cunt, tracing down your lips, teasing their ways in and out, and one relentless digit pushes against your clit, rubbing it in quickening circles.");

	output("\n\nBlindly exploring, hands run up and down your sides, while fingernails trace up and down your front, following the curves and lines of your body, lingering at just the right spots to make you squeak and pant. ");
	if(pc.biggestTitSize() <= 3) output("Light squeezes and playful grips play across your chest, groping your [PC.breasts] in irregular tandems.");
	else if(pc.biggestTitSize() <= 8) output("A host of hands descend on your breasts, each one of them stimulating you in a particular way. Warm palms cup beneath them, following the lush curve of your melons. Other trace the edges of your areola, fingernails teasingly close to your nipples. Soft grips alight here and here, attending to your jugs, leaving no square inch unattended for very long.");
	else output("It doesn’t make sense for so many hands to be covering your breasts, teasing, tugging, and caressing. There’s no way they could fit into the space, but yet they persist, fingertips tracing warm, sensual circles, palms rubbing, massage-light against your lush curves, fingernails dragging lovely lines across your globes.");
	output(" There are hands at your neck, controlling and firm. Some hands grabs your arms, holding them in place, while others run up and down your shoulders and forearms, matched in pace by the grips against your legs. There are two fingers probing your ass now, gently thrusting in and out, oblivious to the hungry whimpering spilling from your lips. A fingertip brushes back and forth along your taint. Firm grips lightly massage your [pc.footOrFeet]. A hand works two fingers into your drooling mouth, working in and out against your tongue as you groan in debauched abandon.");
	output("\n\nThere’s too much going on. You feel like you should be blacking out from the bombardment of sensation. Your breath comes fast as you rock in the grip of the hands, no longer desperate for escape, but for release. The hands seem to respond in kind, redoubling their efforts over your body, stroking and teasing until you’re squirming and moaning in mindless pleasure.");
	//Dicks
	if(pc.hasCock())
	{
		output("\n\nYou’re so overwhelmed that you almost don’t realize you’ve started cumming. All the pleasure on your body contracts to a single point as your " + (pc.cockTotal() == 1 ? "cock jumps":"cocks jump") + " and your whole body lurches. You gasp in the darkness as you release a thick, hot jet against the ministrating hands. The mess is hard to see in the wan light, but you can hear the cum splatter against several of them, and the hollow dripping noise as it rains down on the ones below.");
	}
	//Vagoo
	if(pc.hasVagina())
	{
		output("\n\nYour thighs feel like they’re dissolving under the onslaught of stimulation. When it finally builds to a peak, you’re almost thankful for the hands holding you in place to keep you from flailing your legs nervelessly. A rising tide of pleasure radiates out through you, making you toss your head back as your back arches. The fingers below you are drenched in a sudden gush of your pussy juices as you cum all over them. The mindless things don’t stop, though-they continue their work, coaxing another crashing climax from you. You howl in pleasure into the darkness as you cum again, and again, and again.");
	}
	output("\n\nBy the time three fingers work their way into your ass, you’re nearly insensate, half-broken by the continuous manipulation by the endless hands. It’s only the firm grip of the hands that keeps you from curling up into a ball as the fingers drive deep inside you, rubbing and probing at the slick walls of your ass, pushing you closer and closer to climax. With a soundless gasp, you buck against the hands, nearly dislodging yourself, but too lost in pleasure to care. The orgasm hits you hard, and the grip of the hands tighten, keeping you suspended in a dendritic sea as you thrash and groan in pleasure.");
	output("\n\nThey don’t stop. The pleasure doesn’t stop. You lose all sense of time, surrounded by infinite hands. Mindless and almost mechanical, they coax climax after climax out of you. The last, broken part of your brain wonders if this how you’ll spend eternity, caught in the grips of endless orgasm until the end of time.");
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",handsDreamFromFrogapus3);
}

public function handsDreamFromFrogapus3():void
{
	clearOutput();
	showName("\nA DREAM!");
	author("Frogapus");
	output("You lurch forward, gasping. The darkness is gone, and with it, the endless hands. You’re right where you fell asleep, blinking in the light. You whip around, half-expecting to see the bizarre cyclopean woman again, but finding nothing out of the ordinary.");
	output("\n\nYou wipe a damp smear of drool from your cheek, rubbing your eyes to clear them. It had seemed so real-<i>felt</i> so real. Your body is still tingling from the nightmare.");
	if(pc.hasGenitals()) output(" You glance down and note the still-warm puddle between your legs as sticky testament to the dream.");
	output(" It had to be a dream, though.");

	//First time:
	if(flags["FROG_HANDS_DREAM"] == undefined)
	{
		output("\n\nAs you get up to put yourself in order, your Codex squawks. You glance down at it, expecting an email notification, instead getting an eyeful of nonsense.");
		output("\n\nThe holographic display flickers, nonsense symbols and words scrawling across each other.");
		output("\n\n<i>“mA.re+++sayaa44null((REM sleep latency-GAWI nulim@@@dip-non-rapid-iiiiii_ogun_oru**”</i>");
		output("\n\nYou give your codex a shake, surprised at the sudden malfunction. The gibberish scrolls faster, and your codex squawks again, the display now dominated by a large, holographic eye. It flickers from side to side before snapping up to focus on you. Your breath catches in sudden recognition before the eye cuts out.");
		output("\n\nYou tap your codex again, quickly running through screens, dreading the recurrence of the eye. Thankfully, you don’t see it again.");
		output("\n\nYou take a deep breath and spend the next few minutes trying to shake off the clammy fear wrapping tight around you.");
	}
	//Second time:
	else if(flags["FROG_HANDS_DREAM"] == 1)
	{
		output("\n\nYou feel a cold shiver of fear running up your spine. Not again!");
		output("\n\nThe codex flashes static, displaying overlapping strings of nonsense.");
		output("\n\n<i>“..div_id: seroto||nergic_HAGHAGHAGHAGHAGHAGEOG traces shows that eye movement++liliyyotNOSCRIPT&&neural populations::dream-space=”</i>");
		output("\n\nYou know it’s coming, but still can’t stifle a shudder as the holographic eye appears again, focusing on you before winking out.");
		output("\n\nYou check your codex again, once more finding nothing. You frown, still shaking from the haunting glitch, and initiate a self-diagnostic.");
	}
	//Third time
	else
	{
		output("\n\nYou feel your skin crawl as your Codex lights up.");

		output("\n\n<i>“Characteristic+{cambion{{ fragBAKHTAKmentation+ofMARAselective_sera0000tonin_<i>malleus</i>reuptake_<i>malificarum</i>inhibitors<i>?subirse el muerto@@</i>”</i>");
		output("\n\nThe eye appears briefly, then flickers rapidly before dissolving into a shower of pixels.");
		output("\n\nYour codex goes blank for a moment, then plays a pleasant tune. A friendly message informs you that the codex has just encountered an unexpected error and needed to reboot.");
		output("\n\nYou eye the device warily as it goes silent once more. You’re not entirely sure what just happened.");
		//output("\n\nYou nearly jump out of your skin when your codex beeps again, informing you of a new entry.");
		output("\n\nYou nearly jump out of your skin when your codex beeps again.");
	}
}

/* Fen note: cut all this. I’m not having an empty codex spot in the sidebar all year for some halloween stuff. Hot scene tho.
Codex Entry: Kama-tanha

Name (Singular & Plural): Kama-tanha

Sexes: Female?

Height: variable

Weight: [error]

Hair: All incidents report black hair.

Eyes: Singular, red and illuminated. Victims report that this is the kama-tanha’s only distinguishing facial feature. This singularprettyeye takes up the entirety of the face.

Ears: none

Features
Reports indicate a humanoid structure, with often-uncomfortable variance. Some encounters report disproportionate limbs, tails, wings, or multiple legs. Some constant features are: pale-to-white skin (often reported as cold), visible breasts, black hair, and a singular eyeamwatching.

Reproduction
Unknown. All victims report a sexual nature to the encounter, but range++eattheirpleasure=. Some victims recount intercourse with the kama-tanha itself, reporting a variety of genitalia. Others indicate that the kama-tanha is incidental to a dreamed or hallucinated sexual encounter

Encounters
Kama-tanha encounters are of questionable veracity, as many describe the encounters as dreams, or "dream-like," leading many xenobiologists to suspect that that the creature is a hoax or some kind of universal myth. Many point to roughly-parallel folklore present on most planets regarding sleep paralysis and REM states, implying thatkama-tanhaisreal+hangupsidedownfromdreams+fall&dig&leftwhisperleftleftalwaysleft_intonighhtlickyyoutouchyouinsideheads_showyou[pc.name]&againagaini.find_u
*/

//Witch’s Kitten
//By: ThereWasAnAttempt
//For Dickhaving PCs
//7777 real winner contendah!
public function witchsKittenScene():void
{
	clearOutput();
	showName("THE\nWITCH...");
	author("ThereWasAnAttempt");
	output("The memory of how you heard of, let alone came to, the witch’s hut is already blurry in your mind, like it never happened, the details misting over in a vague sense of uncertainty. But the here, the now, that’s becoming more and more real as you squat before the woman who isn’t like any witch you’ve imagined. Dasima lounges in the corner of her hut, her gown the diaphanous silver of spider web, and about as revealing too. Through the thin silver strands you can nearly make out the hard nipples of her glorious mounds, her soft lips painted red and smirking at you while her eyes, golden as a cat’s, watch you. Tangled black hair descends to her knees, surrounding her like a shroud of darkness. She leans on the skull of a man, watching you from across the flames burning in the middle of her crowded hut. The smell of the herbs hung all around to dry waft to you, tantalizing and sweet.");
	output("\n\n<i>“You want to know about the crypt in the east?”</i> Dasima purrs, the sound singing up your spine to tingle in your hardening nipples and cock.");
	output("\n\n<i>“Ah, yes,”</i> you say, recovering a little as you look back into her eyes, trying not to stare as she shifts her legs, uncrossing them and revealing quite definitely that underwear is not a factor here. <i>“The one just outside Old Oak crossing. What do you know about it?”</i>");
	output("\n\n<i>“Enough to know a pretty young thing like you doesn’t stand much of a chance getting through it,”</i> she says.");
	output("\n\nYou flush a little, though feel a tingling in your groin as she talks down to you. <i>“I can take care of myself.”</i>");
	output("\n\n<i>“Of course you can, sweet thing,”</i> the witch giggles, her long finger stroking the skull resting near her hand. You feel oddly aware of the slow, lazy movement. <i>“I believe you.”</i>");
	output("\n\nYou swallow thickly, looking back to her shining golden eyes. <i>“Then you know a way in?”</i>");
	output("\n\n<i>“I do. I’ve gone in there a few times. You need a... special key to open those old locks.”</i>");
	output("\n\n<i>“You have it?”</i>");
	output("\n\nShe smiles, her red, red lips a cupid’s bow of amusement. <i>“Certainly. But nothing in life is free, little boy.”</i>");
	output("\n\nYou shift, your pants growing increasingly tight as she shifts, baring a bit more of her breast through the silver fabric. <i>“I... look. Can you stop calling me that?”</i>");
	output("\n\n<i>“Hmm. I’ll think about it.”</i>");
	output("\n\nYou sigh, letting it go. <i>“How do you open the crypt?”</i>");
	output("\n\nShe giggles. <i>“Hmm. Well, it’s a bit... different for everyone, little boy. For that, we’re going to have to use a special spell of mine, with the help of my familiar. Are you up for it?”</i>");
	output("\n\n<i>“I... guess...”</i>");
	output("\n\nShe smiles again. She does have a lovely smile... <i>“Good,”</i> she purrs, her voice stroking you so wonderfully. <i>“Now, we’re going to have to go into a trance. Can you do that for mommy?”</i>");
	output("\n\n<i>“I can... Sorry, what?”</i>");
	output("\n\n<i>“Nothing,”</i> she giggles, shifting. The front of her robe slips open a little more, and you catch yourself staring at the beginnings of a pearly white breast. <i>“Nothing, sweetie. Now. Look into the flames...”</i>");
	output("\n\nYou’re a little more wary now, but can’t muster up the grit to say no. It’s hard to say no to Dasima. You look down at the dancing flames as she tosses some powder onto the fire, smoke billowing up into the air, the flames turning a lurid red. You inhale a gust of the smoke, your head spinning. You blink rapidly, smacking your lips.");
	output("\n\n<i>“Good boy,”</i> Dasima breathes, a gentle breeze brushing your face. <i>“Just look into the fire. Listen to my voice. Are you listening, little boy?”</i>");
	output("\n\n<i>“Yeah...”</i> you murmur, staring into the writhing flames.");
	output("\n\n<i>“That’s it. Look deep. Let your thoughts drift away. Open yourself to my voice. Listen closely. Closer...”</i>");
	pc.lust(10);
	clearMenu();
	addButton(0,"Next",witchsKittenScene2);
}

public function witchsKittenScene2():void
{
	clearOutput();
	showName("THE\nWITCH...");
	author("ThereWasAnAttempt");
	output("You blink, your eyelids drooping. Your head feels... heavy. Like someone was winding string around your brain...");
	output("\n\n<i>“Are you listening?”</i>");
	output("\n\n<i>“Yeah,”</i> you moan softly.");
	output("\n\n<i>“Good boy,”</i> she breathes, and her breath stirs the hairs at the back of your neck. When did she get behind you? She must have snuck around. Snuck around while you were listening to her voice. While you stared into the flames...");
	output("\n\n<i>“What a pretty boy you are. Has anyone ever told you that?”</i>");
	output("\n\n<i>“Yes... You did...”</i>");
	output("\n\nShe giggles again, and light fingers touch your sides, fluttering up your ribs like butterfly wings. <i>“I know that, silly little boy. But I mean others. Have others told you what a pretty boy you are? How slim and young. You look almost like a girl. Oh,”</i> she breathes, and your breath hitches as she grasps your tenting cock. <i>“But this says otherwise.”</i>");
	output("\n\n<i>“Mnnn,”</i> you moan weakly.");
	output("\n\n<i>“You’re so pretty and sweet,”</i> she murmurs, and you feel your shirt open, pulled away, baring your thin chest. <i>“So young and sexy and slim. Like a pretty kitty. Are you my pretty kitty?”</i>");
	output("\n\nSome vestige of masculine pride tingles in your head. <i>“I... I’m...”</i>");
	output("\n\n<i>“Now now,”</i> she breathes, you gasp, your pants opening, your cock stiffening in the warm air. <i>“Kitties don’t talk. Kitties just... mew...”</i>");
	output("\n\nHer slim fingers wrap around your manhood, and you moan weakly as she teasingly runs her fingers up and down your thickening shaft. Your head pounds, wrapped in a cloying fog of the smoke, of her words, wrapping you up tighter and tighter until you feel like your head could burst.");
	output("\n\n<i>“Pretty kitties shouldn’t come all alone to meet with pretty witches. But you’re so brave, aren’t you, kitty?”</i>");
	output("\n\n<i>“Mmmn,”</i> you moan weakly, your hips twitching as she slowly pumps your cock.");
	output("\n\n<i>“That’s a good kitten. Only mews now. Pretty little meows that tell me what a slutty, pretty kitty you are. And every witch needs her cat, you know. Are you my pretty kitty?”</i> You feel her hot lips against your neck. You moan as her tongue slides along the sensitive flesh. <i>“Are you?”</i>");
	output("\n\nYou’re panting, gasping, trembling at the heat that suffocates the little hut. <i>“I... I’m..”</i>");
	output("\n\n<i>“Turn around.”</i>");
	output("\n\nYou do, and come face to face with her golden eyes. She smiles broadly, then leans back so you can see her more thoroughly. Her long black hair frames her pale body starkly. Her spiderweb dress has slipped aside fully now, baring the immense globes of her breasts. Your breath deepens as you stare at those heavy mammaries, nipples dark, hard, and jutting. Lower still lies the pink gash of her pussy, damp with dewy desire.");
	output("\n\nShe cups her breasts, giving them a gentle squeeze. <i>“Mmm. I think kitty likes seeing Mistress like this,”</i> the witch giggles as she lazily lifts and squeezes her fat teats together, her fingers spreading your shining pre all over the glorious orbs. <i>“I think my slutty little kitty would like nothing more than to lick and kiss Mommy’s breasts. Doesn’t he?”</i>");
	output("\n\nYour thoughts are so twisted around you can only nod, taking her words as fact. And why shouldn’t you? Mommy is so smart and sexy and knows just what you want.");
	output("\n\n<i>“That’s a good kitty,”</i> she purrs, and your body sings to her tune. <i>“That’s a very good kitty. And what does a kitty get as a treat?”</i>");
	output("\n\nYou stare, breathless with anticipation. What? What does a good kitty get? She edges you like that for a terrible minute, all the while massaging her big, pale, wonderful tits.");
	output("\n\n<i>“Kitty,”</i> she breathes, her fingers closing on her hardened nipples. <i>“Gets cream.”</i>");
	output("\n\nHer fingers squeeze. The witch shudders, her lips parting in a heavy moan as a sudden spurt of milk jets from her nipples. The warm milk splashes on your legs. You mewl desperately. Mommy giggles again and opens her arms. <i>“Come to Mommy, Kitty.”</i>");
	output("\n\nYou surge across the floor and into her arms. You bury your face in the heavy orbs of her milky teats, your lips latching onto a jutting nipple. Hungrily you suck.");
	output("\n\nBliss bursts through you as that wonderful milk touches your tongue. You mewl, sagging, weakening in her arms as your lips hungrily suckle her gushing cream. Mommy moans, hugging you to her fat teat.");
	output("\n\n<i>“Ooooh yessss kitty. Mmnnn. Yes. Suck M-Mommy’s milk. That’s it... Ah... oooh, such a good kitty for Mommy. So... ah... good...”</i>");
	output("\n\nYou mewl with pleasure as her warm cream soothes away the pain in your head, washing away anything but your love for your Mommy. Every good kitty loves their Mommy, and yours is so wonderful. You gasp weakly as she touches your hips, pulling you nearer. Your cock is enveloped in velvety softness, and with a sigh you begin to thrust.");
	output("\n\n<i>“Yessss kitten. That’s it... that’s good. Yes. Ah... yes... Sweet thing. That’s my good kitten. Mnnn... that’s a very good kitty...”</i>");
	output("\n\nYou bury your face deeper in her teat, lazy pleasure roiling through your svelte form as you pump into her hungry cunt. Oh it feels so good. So wonderful to be Mommy’s sweet kitty. To be wrapped in her arms, buried in her cunt.");
	output("\n\n<i>“That’s right. Let it all slip away, kitten. Drink up. Drink. Let everything just... fade... everything but being Mommy’s slutty kitty. Mommy’s needy... ah... thirsty kitten...”</i>");
	output("\n\nYou pant, gasping as Mommy’s cunt ripples around you, as she gasps, her orgasm threading through her and making her shudder around you. The sensation pushes you past the edge. With a cry you cum, your cock pumping your slutty seed into her.");
	output("\n\n<i>“Ooooh that’s it kitten. Yessss!”</i>");
	output("\n\nYou keep pumping. Keep going. Surrounded by her flesh, your face buried in the pillowy softness of her tits. You feel weak. Soft. Vulnerable. But you don’t worry. Mommy is here to protect you. Mommy has you now. Once, you vaguely think, you would have tried to protect yourself. But that’s in the past. That would take away from your servicing Mommy. From obeying mistress.");
	output("\n\nYou feel her hands move, and then something wraps around your throat. You lift your lips from mommy’s teat for a moment and look down at the black collar around your neck. A golden bell dangles from it.");
	output("\n\n<i>“For Mommy’s precious kitty,”</i> she says with a warm smile.");
	output("\n\n<i>“Mew,”</i> you whimper.");
	output("\n\nMommy giggles. <i>“Good boy. Now, I think you have another job.”</i>");
	output("\n\nYou don’t need to wonder. Don’t even need to think, for Mommy at once moves your head towards her other breast. With gusto you suck at her hard nipple, suckling at her sensitive breast, delighting at how she quivers and moans and shudders, how in turn her pussy squeezes and massages your cock as you lazily pump in and out of her.");
	output("\n\n<i>“That’s... ah... it... kitten... So... so good. M-mooore. Moooooore!”</i> she moans.");
	output("\n\nYes. More. As much as she wants. For as long as she wants. Kitten will always be there for mommy. Will always be her eager tit slave.");
	output("\n\n<b>At least... until you wake in the morning with the sheets " + (pc.cumQ() < 100 ? "wet":"soaked") + "... What a dream!</b>");
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Demon Sera Ship Rape
//By Hatchford
//Requires been intimate with Sera, have crewmembers, have crew Anno, crew Sera, and 4+ crew
public function demonSeraShipRape():void
{
	clearOutput();
	author("Hatchford");
	showBust(seraBustDisplay(true))
	showName("\nA DEMON!");
	output("Foggy-headed, you trudge up to your ship, exhausted from a long, hard day of fucking the natives silly. Visions of a hot meal and warm bath dance before you as you mechanically enter the code. The door doesn’t budge. Cursing, you attempt to focus and re-enter the code. Shit! You enter it again, this time with exaggerated slowness, feeling like an idiot. ‘1’, ‘2’, ‘3’, ‘4’, ‘5’, ‘6’...fuck. You headbutt the door in a foolish fit of rage. If this is another of Sera’s fucking pranks...");
	output("\n\nSuddenly, the door whips open and an impossibly large form ducks through and forces you backwards with its bulk. It straightens and rises...and rises...and rises, looming over you. You gulp in fear as you try to tell yourself that you’re hallucinating the twenty-foot tall demon that’s grinning evilly down at you. Your vocal chords try futilely to say something, anything, as you fumble for your weapon, but before you can manage it the demon chuckles and spreads its wings. You’re buffeted by a wall of air and driven to your knees as it lifts off and streaks into the sky.");
	output("\n\nRegaining yourself, you stumble through the door and try to slow your pounding heart. The power has apparently been shut down and the emergency lighting pulses faintly, giving the passage way an eerie feeling that keeps your pulse elevated. The normal sounds of the ship are gone as well, there’s no hum of the systems, no chatter from your crew...what in blazes did that demon do?");
	output("\n\nYou go searching for some explanation, but every compartment is empty and no system will respond to your attempts to restore it. Finally, you approach your quarters, the last stop on your ‘tour’. A faint slapping noise can be heard through the door. You shudder in relief as your growing fear that the demon had wiped out your crew is assuaged.");
	output("\n\nRushing through the door, you fall flat on your face as you trip over the legs of ");
	//[a crew member]
	var crewNames:Array = getCrewOnShipNames();
	var x:int = 0;
	var crewName:String = "";
	//Pick a random crew member. If it’s a restricted on, toss ’em and loop again, then set the name.
	while(crewName == "" && crewNames.length > 0)
	{
		x = rand(crewNames.length);
		if(crewNames[x] == "Sera" || crewNames[x] == "Anno") crewNames.splice(x,1);
		else crewName = crewNames[x];
	}
	output(crewName + ". Dazed, you scan the room and gaze in wonder. The back of your mind does a roster check as you try to comprehend what you’re seeing. They’re all here, thank the heavens for that at least. Here, and sprawled, butt-naked on the floor in a haphazard pile. Every damn one of them has a goofy expression of bliss painted on their face and cum splattered over their faces and leaking from every orifice.");
	output("\n\nThe fuck?");
	output("\n\nThe slapping noise again intrudes on your befuddled mind and directs your attention to the only two people not in a lust-induced coma. Anno is bent over your bed, ass in the air and a dreamy smile on her cute face as she’s jolted again and again, her luscious flesh jiggling in a way that makes your body heat up despite the oddness of the situation.");
	output("\n\nBehind her, one hand gripping that lovely ass and the other planted firmly in Anno’s upper back, pinning her to the bed, is Sera. You get the feeling that she’s aware of your undignified entrance, but she doesn’t acknowledge you and continues to abuse Anno’s hole with vigor until she hilts herself completely and begins to spasm into the ausar. You can easily imagine the delightfulness of that hot juice squirting into Anno and she evidently shares your feelings, groaning something unintelligible as her eyes roll back into her head, body quivering.");
	output("\n\nSera pulls out with a wet ‘schlorp’ and lets Anno’s now boneless form slide gently to the floor to doze quietly amongst her similarly fucked-out crewmates. The smirk on her face as she turns to you sparks an indignant rage and you start to rise to confront her properly, but before you can blink Sera...shifts and is instantly behind you, stiletto heel planted firmly in your back.");
	output("\n\n<i>“Fun’s over, meat.”</i>");
	output("\n\nHer tail wraps securely around your neck as she lifts her heel off of you and rips your clothes to shreds. As she works she begins to explain just what the demon visitor gifted her and outlines her plans for the future and for you. Your horror grows to the point that even if she released her tail your frozen limbs would keep you presenting yourself to her. It’s only when her demonic cock rams into your traitorous and welcoming asshole that you’re brought back to the present from the vision she’s painted.");
	output("\n\n<i>“Your ass is now mine.”</i>");
	output("\n\nA part of your mind rebels at that, but the roiling sensations of a foot-long cock speared in your guts overwhelms you and you decide that you’ll allow this wonderfulness to continue until she’s done. And <i>then</i>, then she’ll get what she deserves...");
	pc.lust(20);
	clearMenu();
	addButton(0,"Next",demonSeraShipRape2);
}

public function demonSeraShipRape2():void
{
	clearOutput();
	showBust(seraBustDisplay(true));
	showName("DEMON\nSERA");
	author("Hatchford");
	output("Sera doesn’t even give you the dignity of dragging you to the bed, but instead keeps you in the pile of crew, occasionally, and forcefully, pushing you into whatever overflowing pussy or ass is in reach until your face is as smeared with sperm and girlcum as are your insides. Hours pass with her rock hard meat plunging into you until your brain is disintegrating with cocklust...that’s when the training really begins.");
	output("\n\nIt doesn’t take long in the end. A few weeks of nothing but drinking down demon cum and having your holes blasted with cock eventually transforms you into the willing cock sleeve she always wanted you to be. You remain as CEO of Steele Tech, but only as a figurehead, Mistress now wields the real power. But that’s okay, you’re plenty busy keeping your master’s cock well-pleased, in addition to caring for the demon babies she continually plants in your " + (!pc.hasVagina() ? "new":"") + " womb.");
	//output("\n\nUsing her knowledge of modding to ensure they gestate and grow to maturity rapidly, Mistress enrolls them in what she calls the Institute. She runs classes to mold them in her image, passing on her skills and beliefs while installing you as the graduation exam. Broken as your mind is, and devoted to your Mistress as you’ve now become, there’s still a tiny part of you that recoils when your firstborn daughter commands you to suck her cock. There’s no question of disobeying, however, and you quickly jump into your new duties with a passion, bursting with pride as your progeny skillfully and completely dominate you as they stuff you full of their demon cockmeat and leave you sprawled and dripping with their yummy cum.");
	output("\n\nIt’s a gift, really, to be allowed to be a part of this and you make certain thank your Mistress nightly, eagerly slurping her magnificent rod and sucking down her cum as she drifts into sleep, proud to help her get her rest and keep strong on her quest.");
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Cum Monsters
//By Foxxing
//Note: Submission for the halloweiner contest. Premise is the player is cum filled (vaginally, orally or analy) and somehow that cum gains mass and sentience (is a mystery) before rocking the pc’s world. I initially was going to make it all a single scene with variation for different types of cum but decided to make each one its own self contained thing to make coding each variant of the scene easier.

//Oral Cum Event
public function foxxlingsOralCumDream():void
{
	showName("\nCUM");
	author("Foxxling")
	/*
	output("As you try to fall asleep you can’t seem to get quite as comfortable as you want. First you’re twisting and repositioning, then you’re stretching and leaning in an attempt to find that perfect position. " + (silly ? "The crazy thing is that sleep is normally as easy as pressing a button for you but for some reason you just can’t get there.":"You irritably wonder what kind of evolutionary advantage insomnia could possibly have and why no species has evolved past it."));
	output("\n\nAfter a while your ceaseless efforts are rewarded as you find a reasonably comfortable position and try to drift off... but, of course, you’re suddenly thirsty. You don’t want to get up just to get a mouth full of water from your ship’s tank so you try to ignore the feeling and begin thinking about your day.");
				Maybe cut before this? */
	output("Suddenly there’s a very familiar taste on your [pc.lipsChaste] and the back of your throat. When you take a moment to consider the oral nature of your recent activities, it makes sense that you would taste such a thing.... Actually come to think of it, that is something you never should have stopped tasting. After all, cum doesn’t just disappear and reappear like that. With a shrug, you dismiss the thought and snuggle back into bed, happy that you’re, so conveniently, no longer thirsty.");
	output("\n\nAs you close your eyes, your [pc.belly] begins to feel a bit more squirmy than usual. You try to ignore the feeling until you feel your [pc.lipsChaste] getting wet, as if you’re drooling for some reason. It’s very odd considering how parched you were a second ago. Feeling more than a little annoyed, you sit up and turn on the lights.");
	output("\n\nWait... that doesn’t taste like spit.");
	output("\n\nPutting your hand to your [pc.face] you reel back in surprise as the ejaculate in your throat begins to fall from your lips like a waterfall. Somehow it isn’t obstructing your breathing, but stars! Where the fuck is all that even coming from? When you think to go grab a bucket, you slip in the mess streaming from your lips and fall. You brace yourself to hit the floor but instead are engulfed by a pool of spunk. As the bottomless lake of jizz absorbs your momentum, you can’t help but wonder how did this puddle become an ocean? There is no way you swallowed this much cum.");
	output("\n\nSuspended in the liquid, you thrash around for a moment only to realize that somehow you’re still able to breathe... that is until you feel the all too familiar feeling of a cock being shoved down your throat.");
	output("\n\nThe cock-shaped cum unceremoniously travels down your gullet, becoming one with the reservoir of semen spewing from your maw which forms into bigger, thicker version of its former self. You hear a gasp of contentment from somewhere above as you begin to suck. You feel yourself getting aroused, your hand reaching down to rub your [pc.groin] in that weightless sea of cum. You relax, the slow repetitive task of a lazy suck combining with a soft arousal. Yawning around the cock in your mouth, you can’t help but think, <i>“Now this is comfortable.”</i>");
	output("\n\nYou awake with a start, and then can’t help but chuckle at yourself for dreaming such lewd things. As you recount the events it becomes more and more obvious that it was a dream. You’ve never even seen that bedroom before. As you rise to get your day started, though, you almost slip on what looks like a few droplets of the cum from that very dream. Strange.");
	pc.lust(20);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Anal Cum Monster
public function analButtCumMonster():void
{
	showName("\n...CUM...");
	author("Foxxling");
	output("Before you get into that deep, second stage of slumber, you feel something on your [pc.ass]. Unwilling to deal with whatever it is, you wiggle your butt in an attempt to get away from the offending sensation. When it stops, you simply smile and try to doze off again.");
	output("\n\nThat’s when a very wet slap lands on your [pc.ass].");

	//if pc is naga:
	if(pc.isNaga())
	{
		output("\n\nYour [pc.eyes] snap open as you hurl yourself away from that slap, not that it hurt. Your lower half has become wrapped in the blanket, so you take a second to disentangle yourself, your [pc.ass] hitting the air as you do. Looking down at your lower half, you feel like something is a little... off. However you can’t seem to remember if you were naked when you went to bed.");
		output("\n\nYou shrug off the odd feeling and glance around the room, rising onto your coils you make yourself taller in an attempt to see if there is anyone hiding and playing a prank on you. Suddenly you feel strong slimy hands bending you over, smashing your [pc.face] into the bed. Glancing back, you see that the hands forcing you down are not only dripping, gooey limbs, but they’re also coming from your [pc.ass]!");
		output("\n\nThe creature ignores your confusion as it forces you back down. Inside your [pc.asshole], you feel a something long and phallic forming, most likely from the remnants of all the cum that has been buried in your back door. A gooey creature grows and shifts from the jizz, becoming an androgynous humanoid, and once it has feet, it uses them to drill its thick cock deeper into you. You squirm in an attempt to lessen your discomfort but instead end up hanging off the edge of the bed. As you try to relax, it begins to grow, gaining in length and girth until you feel so full you might break. In the end you can’t help but wrap your [pc.legOrLeg] around its legs. The creature simply puts its feet together and begins fucking downward, that giant dick giving you every inch you could possibly handle.");
		output("\n\nSoon the androgynous cum monster is railing you good, its legs being bound by yours only serves to make it fuck you even harder. With every thrust, its trunk wetly claps against your [pc.thighs]. Despite how big it feels, you can’t help but love every second of it. The creature knowns your [pc.asshole] almost as well as you do, which makes sense considering where it came from.");
	}
	//if pc is taur:
	else if(pc.isTaur())
	{
		output("\n\nYour [pc.eyes] snap open as you twist around and heave yourself up, all the while casting around to see who the fuck just slapped you on the ass. Figuring it must be some asshole playing a prank, you canter about the large room, keeping your bed to one side as you search. Yet as you circle around to your starting position, you notice you’re leaving a very thick trail of... is that jizz?");
		output("\n\nYou twist in an attempt to see what is going on with your back half. Did you even go to sleep naked like this? You honestly can’t recall, but you certainly remember how some cum would have gotten in your [pc.asshole]. As you think about how much spunk is sitting in your hole, you see something move out the corner of your eye. You take a few steps back only to see that the cum you’re leaking is suddenly coming straight at you!");
		output("\n\nYou yelp as the spunky aberration hoists you up, transforming from a wave of spunk into strong gooey hands that painlessly support your weight despite your thrashing. You kick at the goo for a moment until you feel something long and phallic forming inside your [pc.asshole]. It moves through your insides, becoming an ever-expanding, slimy steel rod as it grows and grows. You can’t help but moan as the hands that once held you up put you down and slide up your flank, combining with the tool growing out of your [pc.ass] to form an androgynous centaur.");
		output("\n\nThe taur-like cum-monster wastes no time, ramming its rod into you with a thrust of its powerful hips. It’s forehooves become forearms, holding you and pulling your entire body back toward its trusts. Its long strokes are punctuated by a wet staccato rhythm as its giant stallion-cock beats your [pc.asshole] inward.");
		output("\n\nSoon, your androgynous creampie-born aberation is railing you good, its humanoid half squealing with glee above you. The arms in place of its front legs continue yanking your body back as it stabs your insides with a now a cacophony of erotic violence. You’re being stretched to the max and you can’t help but love every second of it. The creature seems to know your [pc.asshole] almost as well as you do, which you guess makes sense considering where it came from.");
	}
	//if pc is biped:
	else
	{
		output("\n\nYour [pc.eyes] snap open as you fly out of your perfectly perfect sleeping position, still under the covers as you cast about for whatever jackass is fucking with you. There is no way you could have imagined such a sensation, yet someone could always be playing a prank on you. In an effort to find answers, you lean over and check to see if someone is hiding under the bed. As you do, you feel your blanket sliding off, fresh air hitting your [pc.ass] in the process. This causes you to pause for a second because something feels... off. However you can’t seem to remember if you were even naked when you went to bed.");
		output("\n\nShrugging off the weird feeling, you go ahead and check under the bed only to find absolutely nothing there. That is when your [pc.leg] slides against something wet. Before you can get up there to see what the fuck that was, you feel two goopy hands hit your lower back, holding you down as something wet, slimy and erect forms inside your [pc.asshole].");
		output("\n\nLooking over your shoulder, you watch in horror as a gooey monster forms, an androgynous humanoid that appears to be made of all the spunk you’ve had deposited deep into your back door. Stars that thing’s cock is huge too, filling you up and gaining in both length and girth until you’re so stuffed that you have to spread your legs to let it grow.");
		output("\n\nSoon, the androgynous cum monster is railing you good, hands snatching you back as every thrust propels you forward. Its trunk wetly claps against your [pc.thighs] as your hole is stretched to the max, and you can’t help but love every second of it. The creature knowns your [pc.asshole] almost as well as you do, which makes sense considering where it came from.");
	}
	output("\n\nAs the gooey cum-beast continues to pound you into senselessness, you feel gravity shift, and suddenly you’re falling... until your head hits the floor of your room. Looking up, you realize you’ve hit the deck, quite literally. With a chuckle you figure it must have all been a dream and silently smile at the crazy things the mind is capable of coming up with. As you get up and dust yourself off a bit, though, you find remnants of spunk on your fingertips, the very same cum that the creature from your dream was made of.");
	pc.lust(10);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}



/* UNCODED: Vaginal cum dream by Foxxling. His writing needs plenty of touching up and there’s others I’d rather pursue first. Maybe ’cum’ back to later?

output("\n\n");
output("\n\nVaginal Cum Beast");
output("\n\n{if pc is vaginally filled:");
output("\n\nFeeling heavy with exhaustion you decide it is time to go to sleep, good thing you’re already in a nice and cozy bed. With a yawn you take a second to relax, getting more comfortable and finding that perfect position. You’re settling in for a relaxing slumber when, suddenly, you feel wide awake. With an irritated huff you stubbornly snuggle deeper into the very inviting bed. It takes a second to realize you’re really just not feeling it anymore. It is crazy because you were dog tired literally a few moments ago but now no matter how comfortable you get you just can’t drift off into the sweet land of dreams. So you figure you’ll wait, silently with your [pc.eyes] closed, and maybe you’ll just go.");

output("\n\n{if pc is biped:");
output("\n\nWith an irritated grunt you cross your arms, flat out refusing to get out of the comfy bed as you roll onto your back. As you lay there stubbornly trying to will yourself asleep your mind wanders and you fondly begin to remember some of your recent, adult-oriented activities with a grin.");

output("\n\nJust at the memory of your [pc.pussy] being filled you begin to gush a bit beneath the covers. That is when you realize, for the first time, that you’re as naked as the day you were born. Funny... you can’t seem to remember whether you went to sleep nude or not, but you shrug it off because apparently you did.");

output("\n\nAll in all it isn’t hard to figure out that the reason you suddenly can’t sleep is because you’re way hornier than you initially thought you were. If the puddle of wetness spreading around your [pc.ass] is any indication you desperately need to pleasure yourself. As the thought occurs to you your mind fills with thoughts of skilled tongues and hard cocks, thoughts that are so strong you can practically feel a tongue caressing your sensitive feminine opening.");

output("\n\nWith a soft moan you reach down to rub your [pc.clit] only to connect with something gooey and round.");

output("\n\nWith a yelp you throw off the covers and attempt to scramble away from whatever the fuck that is. Its strong arms hook around your [pc.legs], holding them open as the mouth gently licking your [pc.pussy] stops with the romantic foreplay and begins to really go to town. You watch as more of the creature’s body spills out of your vagina, realizing with horror that it is forming from all of the cum that has been deposited inside of you. The creature grows until it is just a head, humanoid torso and arms. Its lower half is just a blob, as if it doesn’t need to form legs, like some kind of slime monster made out of cum.");

output("\n\nYour disbelieving [pc.eyes] watch as the the creature’s head distorts, before it violently slams its face into your groin. You gasp as something phallic forms deep inside of you, combining with the rest of the creature. Yet even with that dick stretching your [pc.vagina] it never stops licking.");

output("\n\nThe cum creature must no longer feel the need to restrain you as you open your [pc.legs] wider to let it in. The androgynous half-formed blob simultaneously licks your most tender folds while fucking them with its face cock. Every thrust and lick combines into a masterful cacophony of sensation that burns out every other sensation. You watch as the cum monster begins to head bang, as if it were listening to some demented carnal song, which may very well be your voice from the way you scream and squeal at the odd but satisfying sensation of combined cunilingus and penetration.");

output("\n\nTears are flowing down your [pc.face] as the pleasure becomes more and more intense. You can’t breathe and you’re suddenly cumming. Your mind tries to make sense of the never ending orgasm but all you can do is convulse. Sensations like a lovely fire flows through you as you desperately claw at the cum monster’s head, yet you’re not sure if you’re trying to push the dick tongued androgynous creature deeper or pull it off. Soon you’re just screaming, [pc.legs] forming a wide V as [pc.girlcum] continuously flows out of you like a burst dam.");

output("\n\n/if pc is naga:");
output("\n\nWith an irritated grunt you cross your arms and refuse to get out of the comfy bed, despite having rolled onto your back. As you sit there stubbornly trying to will yourself asleep your mind wanders and you begin to fondly remember the more adult-oriented activities you’ve been getting into lately.");

output("\n\nJust at the thought of your [pc.pussy] being filled you begin to gush a bit beneath the covers, your [pc.leg] getting wet as you spill what you assume to be [pc.girlCum] all over it beneath the covers. Funnily enough you can’t seem to remember if you went to sleep naked or not but something feels a little... off.");

output("\n\nWith a shrug you figure the reason you can’t get to sleep is because you’re a lot hornier than you thought you were. The puddle of wetness is sliding down your sides, practically encasing you. That is when you feel yourself being lifted and pulled, as if the lady juices were, instead, a pair of arms.");

output("\n\nWait... that’s not right.");

output("\n\nThrowing the covers off you almost scream when you see some sort of gooey cum creature flowing from your vaginal opening like a torrent. The thing wraps its androgynous, aberrant self around your lower half, shifting into a torso and head with four pairs of arms.");

output("\n\nThat head forms right on top of your [pc.pussy] and instantly begins to lick and suck your sensitive vaginal walls, arms lifting and pulling your [pc.legs] to get a better angle. As it does you can’t help but think about how that damn thing is really good at this, it’s tongue and lips making your heart flutter.");

output("\n\n and damn that thing has latched onto you tightly as it makes your heart flutter with some of the best oral you’ve ever had.");

output("\n\nAs if to prove itself to you the creature lifts its head, a cock forming smack dab in the middle of its featureless face, and then slams that face cock first into you.");

output("\n\nThe simultaneous sensations of expert cunnilingus and being pounded by a perfectly sized shaft sends you into rapid convulsions. You can’t help but scream to the stars as [pc.girlCum] gushes from you like you’ve become some waterfall of carnality. The sensations are almost too intense and you feel yourself clawing at the creature’s head, which only distorts under your fingers but never lets up its near violent assault on your nether region. You’re also not quite sure if you’re trying to pull the thing off or push it in deeper. Soon you’re just howling like a madman, your [pc.leg] pushing your [pc.ass] off the bed’s surface as you cum again and again from the oral machinations of this monster made of semen.");

output("\n\n/if pc is taur:");
output("\n\nWith an irritated grunt you cross your arms and refuse to get out of the comfy bed, instead rolling your body so that you may stretch each leg one by one. Then you lay your head on your crossed arms, stubbornly trying to will yourself asleep. Instead of drifting off your mind wanders, finding its way to your recent adult-oriented activities and causing you to smile to yourself.");

output("\n\nJust at the memory of your [pc.pussy] being filled you begin to gush a bit beneath the covers. Funnily enough you can’t seem to remember if you went to sleep naked or not but that is neither here nor there. You figure the reason you can’t get any sleep is that you’re a lot hornier than you thought you were. If the cascade of wetness trailing down your [pc.legs] is any indication you desperately need to masturbate. Unbidden thoughts of cunnilingus and intercourse are so strong in your mind’s eye you can practically feel a gooey tongue and lips licking and kissing your vaginal lips with an almost sacred reverence.");

output("\n\nSlowly you begin to realize that that sensation isn’t in your head at all. Something is down there actually licking your pussy and doing a damn good job.");

output("\n\nWhipping the blanket off you twist around only to see some androgynous, gooey face look up for a second, it’s featureless face realizing the jig is up. Before you can even react it is shoving its face back into your [pc.vagina]. Where before it was gently savoring each lick, now it is greedily devouring your feminine folds in a way that makes it hard to concentrate. You attempt to roll yourself onto your wobbly legs only to find your [pc.knees] weak.");

output("\n\nTendrils of jizz shoot out from that cum blob in an attempt to keep it secured onto you, its tongue making you moan, gasp and curse. As your pussy is greedily eaten you make the cognitive leap required to realize just where this creature had to come from, your [pc.pussy] itself. Somehow it must have formed from the remnants of all the cum you had in there. Now like some pleasure parasite it is attempting to make you cum even more.");

output("\n\nThe tendrils lock your [pc.legs] together, rooting you on the spot. You begin to feel something phallic growing inside of you, spreading your feminine folds as wide as it can and, yet, you’re still being licked.");

output("\n\nThe creature goes the fuck off. It hammers your pussy with its cock tongue and forces you to scream as you reach climax. The moment you begin to cum you don’t stop, agonized pleasure made to last an eternity by the creature’s carnal machinations. You thrash and howl until your voice goes hoarse.");
output("\n\n}");

output("\n\nYour [pc.eyes] suddenly snap open. Whoa that dream was intense and you chuckle in response to dreaming such things. You wipe your [pc.face] only to feel something wet clinging to your fingers. Looking down you see your hand is covered in the very same cum from your dream.");
output("\n\n}");

*/