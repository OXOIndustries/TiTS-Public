//Ghost Sex Dream
//- Slab Bulkhead

//Overview
//A dream that can happen when Steele sleeps, probably only during Halloween. In the dream, a ghost shows up and initiates sex with Steele, who can choose to go for it or tell the ghost to back off.

//Notes
//The dream should only happen while Steele’s sleeping on their ship.
//During the dream, [pc.cock], [pc.cockHead], and [pc.cockNoun] should reference the dick the ghost gives Steele, not Steele’s regular dick (if there is one). This dick should match Steele’s race the best it can, defaulting to Steele’s starting race if not.

//Dream
public function superGhostioDream():void
{
	clearOutput();
	showName("\nSPOOKY");
	author("Slab Bulkhead");
	output("You open your eyes, but everything seems hazy, and you’re not sure if you’re actually awake or not. There’s a faint light coming from... somewhere, and everything’s quiet. The faintest sensation of someone whispering drifts past your [pc.ear], sending a shiver up your spine.");

	output("\n\nYou look around. ");
	//If Steele was sleeping with someone:
	if(flags["CREWMEMBER_SLEEP_WITH"] != undefined) 
	{
		if(chars[flags["CREWMEMBER_SLEEP_WITH"]] != null) output("There’s no sign of " + chars[flags["CREWMEMBER_SLEEP_WITH"]].nameDisplay() + ", though you know they were here when you went to sleep. ");
	}
	output("Aside from you, the ship’s cabin is empty. Yet you can’t shake the feeling that you’re not alone.");

	output("\n\nThe faint light in the air shifts, and seems to move, gathering itself at the foot of your bed and leaving the room darker in its wake. Slowly, the light comes together, shimmering all along its edges, until a pillar of gleaming mist stands by your bed.");

	output("\n\nThe mist coalesces into a human woman’s shape, tall and slender and partly transparent, with a heart-shaped face and large, dark eyes. Tendrils of pale white hair trail down past her slim waist, the ends curling around her narrow hips. She looks more curious than anything, but when she meets your gaze, her eyes open wide, and she smiles.");
	output("\n\nMaybe she’s happy to see you... or maybe she’s happy you can see her.");

	output("\n\nThe ghostly woman steps forward and kneels on the edge of your bed, leaning forward so her hair spills down over her small breasts. She reaches for you, and her hand brushes the side of your [pc.leg], but passes right through. You shiver again, and she pulls back, frowning.");
	output("\n\nThe ghost’s forehead wrinkles as she concentrates, and her glow pools in her hand. She holds the glow out toward you, and touches you gently on the cheek, leaving behind a spot that’s surprisingly warm. She touches the spot with her other hand, and gently trails her fingers down your cheek, her fingers stroking your [pc.skin] until they pass the place where she touched you with her glow.");
	output("\n\nThe ghost smiles again, looking relieved. She looks down at you, and her smile takes on a mischievous look. She runs her tongue’s shimmering tip over her upper lip, and raises her glowing hand once more, then lowers it until it’s floating over your [pc.crotch].");
	output("\n\nThe look she gives you makes it clear what she wants. But she pauses, waiting for some response from you.");

	pc.changeLust(10);
	clearMenu();
	addButton(0,"Nope",noGhostRapeplz,undefined,"Nope","Dream or not, you’ll stick to the living, thanks.");// Go to [No]
	addButton(1,"Yes",yesGhostRapePlz,undefined,"Yes","Sure. Ghost sex. Why not?");// Go to [Yes]
}

public function noGhostRapeplz():void
{
	clearOutput();
	showName("NO\nTHANKS");
	author("Slab Bulkhead");
	output("You look the ghost in the eye and shake your head, indicating you’re not interested in sex with her. Her smile fades, and her shoulders slump, but she pulls away, the glow disappearing from her hand.");
	output("\n\nThe ghost starts to fade from her feet up, her legs swiftly turning into glowing mist. Before she disappears completely, she leans in once more and kisses you gently on the cheek, right where she touched you with her glow. The oddly warm feeling of her lips remains as she fades into mist, then light, then disappears.");
	output("\n\nYou blink a few times, then realize you’re awake. The light in your ship’s cabin is normal again, and you hear all the usual ship sounds you’ve gotten used to hearing.");
	//If Steele was sleeping with someone:
	if(flags["CREWMEMBER_SLEEP_WITH"] != undefined) 
	{
		if(chars[flags["CREWMEMBER_SLEEP_WITH"]] != null) output(" " + chars[flags["CREWMEMBER_SLEEP_WITH"]].nameDisplay() + " sleeps quietly next to you.");
	}
	output(" One of your cheeks feels weird, and you reach up to touch it.");

	output("\n\nThere’s a strangely sticky feeling on your [pc.skin] where the ghost touched you. Was that really a dream? Or were you just drooling in your sleep?");

	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Yes
public function yesGhostRapePlz():void
{
	clearOutput();
	showName("YES\nPLEASE!");
	author("Slab Bulkhead");
	output("You give the ghost a grin and a nod. This should be interesting.");
	output("\n\nThe ghost grins right back at you, utter joy on her face, and she pulls herself up onto the bed, straddling your [pc.legs]. Both her legs pass right through yours, but she’s not focusing there. Her hair falls in white waves all around you as she leans forward, both her hands glowing bright. She trails her fingertips over your [pc.face] and down your neck, her glow leaving a warm sensation in its wake, and leaving her able to touch you.");
	output("\n\nAs she reaches your [pc.chest], she begins to work faster, covering you with her warm glow. Once she’s done her work from the waist up, she pauses, then leans forward and embraces you.");
	output("\n\nShe feels solid. She feels real. You wrap your arms around her, returning the hug, and she shudders. Though when she pulls back, you wonder if it was more like a giggle, as the ecstatic look on her face makes it seem like she’s absolutely thrilled at what’s happening.");
	output("\n\nThe ghostly woman continues spreading her glow over you, covering your [pc.hips] and all the way down your [pc.legs], until only your crotch is left untouched. She looks you over, then gets a wicked smile on her face.");
	//apply dick here! 6"
	pc.cocks.splice(0,0,new CockClass());
	pc.setNewCockValues(0);
	pc.cocks[0].cLengthRaw = 6;

	output("\n\nShe holds her hands together, the glow building between them until it’s nearly bright enough to blind, then presses them down onto your crotch. You gasp as a sudden sensation rips through you, and you feel something there that wasn’t there before. When the ghost pulls her hands back, a glowing male organ stands where there once was nothing. She’s given you a ghostly [pc.cock], about six inches long and an inch wide, and when she trails her fingertips over it, you can feel it as though it was your own. The ghost runs her hand down to your glowing base, and you shiver as she cups and strokes the ghostly testicles she gave you to go along with it.");
	if(pc.cockTotal() > 1) output("\n\nWhy she gave you a ghost dick when you’ve already got one she can use, you’re not sure. But she hasn’t said a word, so it doesn’t seem like she would answer if you asked.");
	output("\n\nThe ghost seems pleased with her work and your reaction, and leans down to give your glowing dick a kiss, then wraps her lips around your [pc.cockHead]. She pulls the first inch of your [pc.cock] into her mouth, and it’s kind of strange to watch, as the glow from your ghostly cock is bright enough to light her up from the inside. You can see your [pc.cockNoun] through the ghost’s pale lips and cheeks.");

	output("\n\nOdd sight or not, the ghost bobs her head as she goes farther down on you, her tongue working away at your head and shaft, and you let out a long sigh. Everything she’s doing feels real, and if it wasn’t for the glow, you’d swear she was sucking on ");
	//If Steele has a penis:
	if(pc.cockTotal() > 1) output("your actual cock");
	else output("a real cock you’d grown just for the occasion");
	output(".");

	output("\n\nThe ghost pauses, and her dark eyes rise to meet yours. She smiles at you around your tingling [pc.cockNoun], then maintains eye contact as she sucks your entire dick into her mouth. Her lips tighten around your base, and her sparkling tongue lashes out to give your glowing sack a long lick, stroking across your ghostly balls. She doesn’t need to breathe, you realize, and she can’t choke, so she can keep your entire [pc.cock] in your mouth for as long as she wants.");

	output("\n\nHer mouth feels electric around your dick, her touch sending sparkling sensations all along your shaft, and you realize that no matter how long she can keep sucking you, you might not last long enough to enjoy all of it. You clench your fists into the bedsheets as the ghost continues to bob her head, your ghostly [pc.cockNoun] lighting her up from the inside as she does her work. A ");
	//If Steele has a penis:
	if(pc.cockTotal() > 1) output("familiar ");
	output("sensation builds in the base of your cock, and soon, there’s no holding back.");

	output("\n\nYou tilt your head back and moan as the orgasm hits you, and your [pc.cock] twitches between the ghost woman’s lips, and you feel something rushing through you. A glowing light fills the ghost’s entire head as your cum spurts into her mouth, making her eyes shine silver. The ghost’s tongue slips up and down your shaft, coaxing out every gleaming drop. She gives you one last long lick, then rises, leaning back to crouch at the foot of your bed.");
	output("\n\nThat definitely felt real. You’re breathing hard, and feeling slightly drained, but your ghost [pc.cock] is still standing straight up, ready for another round.");
	output("\n\nThe ghost woman closes her eyes and shudders, and the glow from your cum slowly spreads throughout her entire body, making her brighter and more solid. After a moment, she’s a lot less transparent, and when she opens her eyes, they aren’t as dark as before. She folds both hands over her chest and looks down at you, then gives you a delighted grin.");
	output("\n\nAs you watch, the ghost’s figure starts to shift. Her narrow hips widen, giving her slim figure a bit of a curve, and her breasts swell from her chest, taking her from barely-there to palm-sized. She smirks down at you, and gives herself half a twist to show you her ass has grown as well, a nice curve resting above her slender thighs. After taking a moment to admire herself, she kneels between your legs again, and reaches for your [pc.cock].");
	output("\n\nYou’re good to go again if she is, but....");

	pc.orgasm();
	clearMenu();
	addButton(0,"Next",moreGhostLuving);
}

public function moreGhostLuving():void
{
	clearOutput();
	showName("\nMORE!");
	author("Slab Bulkhead");
	output("The ghost’s hands glow again as she presses your shaft between her palms, and your [pc.cock] tingles as the light passes into it. Your cock swells, rising up and out from your crotch with new growth, until it’s about eight inches long and two inches wide. The ghost looks at her work, then nods, clearly pleased, and cups your balls in her glowing hands. Your sack swells as well, until the balls within are about three inches across.");
	//8" long!
	//3" wide ballsu
	pc.cocks[0].cLengthRaw = 8;

	output("\n\nIt’s a heady sensation, suddenly having that much more dick, and you can’t help but grin as the ghost woman strokes your new length and girth, her hands smooth and warm on your shaft. But some of her new glow has faded, leaving nearly as transparent as she was when she first appeared.");

	output("\n\nIs that what she’s here for? To get your cum, even if it’s ghostly, to make her more solid?");

	output("\n\nBefore you can ask, the ghost slips her legs forward and straddles your [pc.hips], sliding up until her pussy’s slick, glowing lips reach your swollen balls. You might have questions, but she’s clearly not here to talk. She grinds herself against your [pc.cock] a few times, leaving a trail of warm wetness up your shaft, then slides herself forward.");

	output("\n\nHer pussy lips slip around your [pc.cockHead], and you can’t help moaning as an intense tingling sensation fills your entire body. She’s as warm inside as any human, but there’s a kind of electric feeling to being inside her, and it only grows stronger as she slides herself all the way down your length. Your ghostly girth stretches her a little, but she takes you in with ease, and gives you a blissful look as her lips kiss the base of your cock.");

	output("\n\nThe ghost-girl wiggles her shapely hips as she settles herself down, and leans forward, her hair falling down all around you. When she presses her hands to your [pc.chest], you feel her touch, but she doesn’t actually weigh anything. Whether she’s trying to hold you down or just enjoys being able to touch you, you can’t be sure.");

	output("\n\nAnd then, she starts to grind. It’s slow at first, barely moving her hips back and forth, back and forth, sliding your [pc.cockNoun] just a bit out of her pussy, like she’s getting used to being able to fuck again. She closes her eyes, mouth falling open as she starts moving faster, and her hands tighten their grip on you.");

	output("\n\nYou reach up and run your hands over her thighs, a faint shiver passing through your fingers as you stroke her. She squeezes her legs tighter around your [pc.hips], and adds some force to her grind, bouncing just a little on your lap. Your hands roam up her sides, and you cup her small boobs, then stroke your fingertips over her hard nipples.");

	output("\n\nThe ghost’s pussy clenches around your [pc.cock], and you grunt in surprise. She shoves herself down harder on you, her thighs slapping against your [pc.legs], and she throws her head back, her mouth open. If she needed to breathe, it looks like she’d be gasping by now. You keep fondling her tits, fingers tracing circles over them as she rides you.");

	output("\n\nThe tight, tingling wetness surrounding your [pc.cockNoun] is pulling you toward another orgasm; you can feel it building in the base of your ghostly dick. You thrust your [pc.hips] in time with the ghost’s movements, and she arches her back in response, shoving her boobs harder into your hands.");

	output("\n\nA few more thrusts, and the ghost’s pussy squeezes hard around you. She opens her mouth wide, her whole body clenching. You come barely a second after she does, spurts of light bursting into her from your glowing cock, jet after jet filling her and making her look more solid again. You slump back onto the bed, dropping your arms to your sides, breathing hard as the sensation of orgasm fades.");

	pc.orgasm();
	clearMenu();
	addButton(0,"Next",yetMoreGhostLuv);
}

public function yetMoreGhostLuv():void
{
	clearOutput();
	showName("\nMOOOORE!");
	author("Slab Bulkhead");
	output("Once you’ve taken a moment to recover, you realize two things. First, your cock is still hard, and still buried all the way inside the ghostly woman. Second, she’s smirking down at you, and when she sees that you’re watching, she starts to change again.");
	output("\n\nThe ghost’s hips and ass swell, widening to give her a curvy figure, smooth lines that would give her a swaying, enticing walk. She runs her hands up her sides and cradles her boobs in both hands, then shudders as they start to grow, filling her hands and peeking out the top of her impromptu hand-bra, until she has a full, bouncy pair that makes her look more like a swimsuit model than... than whoever she is or used to be.");
	output("\n\nWith that change done, the ghost woman has only faded a little, and she turns her attention to your [pc.cock]. Without even pulling you out of her, she slips her glowing fingers into her pussy, sliding them around your base. You groan as your ghostly [pc.cockNoun] swells and bulges again, and you watch the glowing dong within her grow, until it’s a full foot long. She licks her upper lip as your cock widens again, stretching her shimmering cunt as it reaches three inches wide.");
	//footlong dongus!
	pc.cocks[0].cLengthRaw = 12;

	output("\n\nShe pulls her fingers out of herself, then reaches behind her curvy ass and cradles your ghostly balls. The weight between your legs grows heavier, and your balls grow again. Once she’s done, you drop a hand down there and take a quick feel. The balls she gave you are now easily five inches across, and feel as full as they did when she first started. How much cum does she want from you?");

	//Big ol balls :3

	output("\n\nThe ghostly woman wastes no time and starts bouncing on your newly enlarged dong, the glowing length going deeper and deeper into her with every thrust. She grabs your hands and puts them on her tits, and you give her bouncing mounds a squeeze. Her mouth falls open, her eyes squeeze shut, and she shoves herself harder onto you. After a moment, she lifts her feet up and plants them on your [pc.thighs], her toes curling in to rub against your ghostly balls.");

	output("\n\nWrapped in tingling warmth, your [pc.cock] feels like it’s going to explode again, but you manage to hold back. You wrap your hands around to the ghost woman’s back and pull her down to you, and she presses her boobs against your [pc.chest], her face inches from your own. Her mouth hangs open, her eyes half-closed, and if she needed to breathe, it looks like she’d be gasping with every thrust. Her hair hangs down on either side, spilling across your ship’s bed.");

	output("\n\nYou feel her pussy clench again, and she screws her eyes shut tight. There’s no reason to hold back now. Again, you let yourself go along with her sudden squeeze, and the two of you shudder together as you both orgasm. Your ghostly dick pours out cum in great gouts, the glowing light blazing within her as a dozen or more streams from your swollen balls splash into her. You cum for what feels like a solid minute, and when you’re finally done, she looks entirely solid, still glowing a brilliant silver.");

	pc.orgasm();

	output("\n\nBreathing hard, you slow down your thrusting, then settle back onto the bed. Your ghost dick is still hard, but the rest of you feels like you just ran up twenty flights of stairs. When she opens her eyes again, she looks dizzy and dazed.");

	output("\n\nShe looks at you, silver light shining in her eyes, and mouths one unmistakable word. <i>More.</i>");
	clearMenu();
	addButton(0,"Next",ohnoGhostSexOverload);
}
public function ohnoGhostSexOverload():void
{
	clearOutput();
	showName("\nBIGGER!")
	author("Slab Bulkhead");
	output("The ghostly woman leans back, then grabs hold of your shoulders and pulls you up with her, swinging her legs out and winding them around your back as you sit up. She presses her chest to yours, and you reach around to take hold of her curvy ass. Both her boobs and butt start to swell again, until your hands are filled with a wide, bouncy booty, and her tits bulge out until they’re the size of her head.");

	output("\n\nShe lets go of you for just a moment, dropping her hands to your glowing cock and sack again, and you grit your teeth and groan as the swelling overtakes you. Your dick bulges up to a full fifteen inches long, adding another inch of girth in the process, and your balls refill and keep growing until they’re each seven inches across.");
	//fifteen inch dongu
	pc.cocks[0].cLengthRaw = 15;

	output("\n\nYou lean back for a second, looking beneath her enormous glowing tits to your ghostly cock trapped inside her. She’s stretched wide enough to make her hips crack, but she’s still taking your [pc.cock] with ease. Being a ghost clearly has some advantages.");

	output("\n\nShe takes hold of you and presses you to her, and you notice she’s gone slightly transparent again from the growth she inflicted on you and herself. But she still feels warm and real, and it’s hard to think about anything else with the way she’s grinding against you, her legs wrapped tight around you, her squishy boobs pressed against your [pc.chest]. Her slick, tingling cunt squeezes hard around your glowing dick, and it’s all you can do to keep from coming again.");

	output("\n\nThe ghostly woman hammers herself against your [pc.hips] over and over, her head thrown back, her mouth moving like she’s shouting with every thrust. You caress her expansive rear, slide your hands up her sides and run your fingertips over her boobs, then take the massive globes in hand and give them a good squeeze. She clenches around you again, her speed increasing, but you keep yourself from coming this time. Every orgasm you have feels like it’s draining you more and more, and you want to hold on as long as you can.");

	output("\n\nFinally, she throws her head forward and presses her lips to yours, a kiss that sends a tingling shock all through you. She shoves her tongue into your mouth, and her arms and legs squeeze tight, pulling her to you as hard as she can. You kiss her back, your [pc.lipsChaste] pushing against hers, your [pc.tongue] dancing around her own.");

	output("\n\nThen, her pussy clenches around your [pc.cock], and you force yourself not to let go, riding out her orgasm as she shudders atop you. She slumps against you, and slowly pulls back, her lips quivering as she stares at you. She looks happy and exhausted, and gives you a silly smile. Then, she glances down to where your crotches meet, and raises her head to give you a curious look.");

	output("\n\nYou shrug, and try your best to indicate you’re good to keep going.");

	output("\n\nShe gives you a mischievous smirk, and slowly leans back, then lifts herself up off of your mammoth glowing dong. It takes a moment, and she’s nearly standing up by the time your [pc.cockHead] slips out from between her glowing, glistening lips. She motions for you to scoot back on your bed, and once you’re sitting at the head of the bed, she lays down in front of you, and flops her giant tits around your ghostly cock.");

	output("\n\nThe grin she gives you suggests she’s going to enjoy this as much as you are.");

	output("\n\nThe ghost woman raises one hand and gives your gleaming length a few strokes, then stares at it for a moment. Laying down as she is, the head’s too far away for her to suck it. She wraps her hand around your [pc.cockNoun], and its glow slowly slips back into her, your cock shrinking until it fits comfortably between her huge boobs, with a few inches of respectably girthy dong still sticking up out of her cleavage.");

	output("\n\nThen, she slips her glowing hand under her boobs and caresses your ghostly sack. You feel your balls bulge and grow, until it feels like they’re nearly as big as the boobs resting on them. It looks like she wants one last load from you, and it’ll be a big one.");

	output("\n\nShe meets your gaze and holds it, her eyes glowing silver, and lowers her lips to your [pc.cockHead]. You moan softly as your head’s wrapped in slick, wet warmth, her tongue running slow circles all around it. She works her boobs around your shaft as well, their plush softness wrapping your dick up completely.");

	output("\n\nYou gently stroke her boobs as she works, running your hands across the globes and stroking her nipples, sending little shudders through her. She slowly waves her round ass back and forth, swaying it as she sucks you. And all the while, her gaze never leaves yours, silently begging you to come, to give her what she wants.");

	output("\n\nIt’s all you can do to hold back. Her tongue works faster and faster, swirling around your [pc.cockHead] in a never-ending loop, driving you closer and closer to orgasm. She squeezes her tits around your shaft in perfect rhythm, and you find yourself thrusting your hips in time, pressing your [pc.cockNoun] just a little deeper into her mouth. She takes it, lowering her head more, until she’s down far enough to kiss her own boobs.");

	output("\n\nFinally, you can’t keep it in any longer. You throw your head back and cry out as your ghostly [pc.cock] erupts, a steady gusher of glowing cum barreling between the ghostly woman’s lips. Your whole body quakes as the stream keeps going and going, until you’re shaking enough to make her boobs jiggle around your cock, which only makes you come harder. She reaches down and squeezes your ghostly balls, helping them to drain faster, while you gasp hard and fight to keep breathing.");

	output("\n\nShe doesn’t cease in her sucking until you’re completely empty, a process that feels like it takes several minutes. When it’s done, you slump against the wall, utterly spent.");

	output("\n\nThe ghostly woman slowly stands, and brushes her long hair back behind her shoulders, then runs her hands down her shapely figure. She looks completely solid now, gleaming silver, with a light in her eyes bright as any star. And more than anything, she looks pleased, content... happy.");

	pc.orgasm();

	output("\n\nShe leans forward and rests a hand on your ghostly dick, making you twitch. The glowing organ fades into mist, which flows back into her");

	//Remove dat fake cock
	pc.removeCock(0,1);
	
	output(", leaving only your [pc.crotch] behind. She glances down to her own crotch, and looks like she’s considering something, then shrugs and leans down toward you.");

	output("\n\nThe ghost woman gives you a gentle kiss on the cheek, right where she first touched you, then whispers in your ear, a sound you feel as much as hear.");

	output("\n\n<i>“Thank you... I’ve missed this so much....”</i>");

	output("\n\nShe smiles at you again, presses two fingers to her mouth and blows you a kiss, then slowly fades away. After a moment, all the light is gone, like she was never there.");

	output("\n\nYou blink a few times, and realize you’re awake in your ship’s cabin. The light is normal again, and you hear all the usual ship sounds you’ve gotten used to hearing.");
	//If Steele was sleeping with someone:
	if(flags["CREWMEMBER_SLEEP_WITH"] != undefined) 
	{
		if(chars[flags["CREWMEMBER_SLEEP_WITH"]] != null) output(" " + chars[flags["CREWMEMBER_SLEEP_WITH"]].nameDisplay() + " sleeps quietly next to you.");
	}
	output(" And you feel . . . sticky.");

	if(pc.cockTotal() > 1) 
	{
		output("\n\nNot only are you sweaty and in need of a shower, that dream made you cum all over yourself. You’ve splattered all over your [pc.thighs], and ");
		//depending on amount of cum Steele makes:
		var cumQ:Number = pc.cumQ();
		if(cumQ < 50) output("halfway across your [pc.belly]");
		else if(cumQ < 150) output("covered yourself from your [pc.belly] to your [pc.chest]");
		else output("sprayed across your [pc.belly], [pc.chest], and [pc.face]");
		output(" as well. What a strange thing to dream of, and it felt so real....");
		pc.applyCumSoaked();
	}
	//If Steele has a vagina but no penis:
	else if(pc.hasVagina()) 
	{
		output("\n\nNot only are you sweaty and in need of a shower, that dream got you seriously wet. You’ve splattered all over your [pc.thighs], and halfway across your [pc.belly].");
		if(!pc.isSquirter()) output(" You didn’t even know you could make that much fluid.");
		output(" What a strange thing to dream of, and it felt so real....");
		pc.applyPussyDrenched();
	}
	else output("\n\nThat dream left you all sweaty and in need of a shower. What a strange thing to dream of, and it felt so real....");

	//[Done] [-50 Energy] [Add “Covered in Cum” tags as appropriate]
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}