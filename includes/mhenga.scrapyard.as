
// Flags:
// SCRAPYARD_SEEN : TODO: FIXME
// MET_GEOFF      : TODO: FIXME
// SEXED_GEOFF    : TODO: FIXME
// 

public function scrapyardMaintenance():void {
	author("Nonesuch");
	if(flags["SCRAPYARD_SEEN"] == undefined) {
		flags["SCRAPYARD_SEEN"] = 1;
		userInterface.showBust("ARTIE");
		userInterface.showName("\nARTIE");
		output("You go through the open gate of the scrapyard and cautiously stick your head around the stone hut’s door. It is, if anything, even more packed with junk than the outside - the room is gloomy with the amount of stuff piled up against the walls and windows. Stands filled with everything from old shoes to busted hologram projectors jostle for room with silent, antiquated robots and mismatched gun racks slithering with spools of power connectors.");
		output("\n\n<i>“Ah! Another adventurer into the cosmic unknown,”</i>  says a reedy voice. <i>“Please, friend- take three steps forward and one to the right.”</i>  You step into the junk shop and, as your eyes adjust to the gloom, take in the curious figure seated in the middle of this empire of crap. He’s a small, middle aged man with walnut skin, completely bald, dressed in sandals and a brown shift which might once have passed for an ancient monk’s cowl, before it got completely covered in oil stains. He is perched cross-legged upon a big shipping crate, surrounded on all sides by meticulously cleaned metal parts and pieces. He looks at you placidly.");
		output("\n\n<i>“And one to the right.”</i>  Baffled, you step to the right and are rewarded with a big, beatific smile spreading across his face.");
		output("\n\n<i>“Ahhhh. That’s it! That’s it. Qi restored. Maybe even better than before you came in. You are a blessed visitor, my friend. Let me explain where you are.”</i>  He lifts his arms and rather theatrically indicates the junk surrounding you. <i>“I accumulate objects for a living. Uncared-for objects, objects thrown away carelessly before their true cosmic value has been established. I pay a small fee related to their monetary value to take such objects off your hands - although a price tag, of course, is in no way related to an item’s true worth! No object comes into this shop by chance. Here, in my constructed universe, they are arranged until I have discerned their true purpose. With a proper amount of meditation, that purpose becomes clear to me...even if it is to depart in somebody else’s hands. Old parts, discarded, brought together, made into something new and more than their sum, leaving in the hands of another, to fit back into life’s giant jigsaw puzzle. A beautiful thing.”</i>");
		output("\n\n<i>“You’re a scrap merchant then,”</i>  you say. He grimaces as if you just caused him considerable pain.");
		output("\n\n<i>“Scrap</i>  dealer. <i>I don’t do anything so base as to buy scrap, I </i>deal<i> with it. Artie is my name, and scrap is my art. Now, my hardnosed friend...”</i>  He clasps his hands in a prayer-like fashion and gazes at you, lazy smile restored. <i>“If you’d like to sell me objects that have fallen into your possession, show them to me and we will discuss their transient worth. If you would like to buy items that by unknowable grace have reconstructed themselves into working order, talk to my nephew Geoff. He’s in the back.”</i>  You were concentrating on the proprietor so much you’re slightly taken aback by the fact there’s somebody else in the shop. The young man cleaning what looks like the innards of a hovercraft is lanky, brown skinned and has dreads tied back in a loose knot, with a flat nose and amiable good looks. He gives you a slightly embarrassed wave.");
		output("\n\n<i>“Good lad, but not terribly clued up on the cosmic side of things,”</i>  Artie says to you, en sotto. <i>“I’m afraid talking to him will not be as spiritual an experience as with me.”</i>");
	}
	else {
		userInterface.showBust("ARTIE");
		userInterface.showName("\nARTIE");
		//Sell/Buy/Leave
		output("Artie nods at you as you enter the scrap yard hut, smiling peacefully as he closes his eyes and goes back to meditating over a large diode. Geoff is busy working on something in the back.");
	}
	shopkeep = geoff;
	this.addButton(0,"Buy",buyFromGeoff);
	this.addButton(1,"Sell",sellToArtie);
}

public function sellToArtie():void {
	author("Nonesuch");
	userInterface.showBust("ARTIE");
	userInterface.showName("\nARTIE");
	sellItem();
}
public function buyFromGeoff():void {
	clearOutput();
	author("Nonesuch");
	userInterface.showBust("GEOFF");
	userInterface.showName("\nGEOFF");
	if(flags["MET_GEOFF"] == undefined) output("You pick your way through the clutter to the back part of the shop. Geoff is seated in front of a wall hung with armor, shields and other durable pieces of technology, evidently reconstructed from scrap. He wipes his hand on a rag as you reach him and then offers you it.\n\n<i>“Hey. Nice to see a new face,”</i>  he says. He grins at you sheepishly. <i>“Uh, everything you can see behind me is for sale. If you want to sell stuff, you’ll have to talk to Artie. The last time I bought something it turned out to have an evil aura, or something.”</i>");
	else if(flags["SEXED_GEOFF"] == 1) output("Geoff smiles at you as you carefully make your way over to him.\n\n<i>“Hey, [pc.name]. Looking to buy something? Or...”</i>  his grin becomes wider. <i>“...do you need a hand with something?”</i>");
	else output("Geoff smiles at you as you carefully make your way over to him.\n\n<i>“Hey, [pc.name]. Looking to buy something?”</i>");
	geoff.keeperBuy = "What would you like to buy?\n";
	flags["MET_GEOFF"] = 1;
	this.clearMenu();
	this.addButton(0,"Buy",buyItem);
	this.addButton(1,"Talk",talkToGeoff);
	if(flags["SEXED_GEOFF"] == 1) {
		if(pc.mfn("","chick","") != "chick" || pc.isTaur() || pc.isNaga()) {
			this.addDisabledButton(3,"Sex","Sex","You aren't feminine enough for sex with Geoff.");
			output("\n\nGeoff doesn't seem interested in sex with the way you look right now...");
		}
		else {
			if(pc.lust() >= 33) this.addButton(3,"Sex",GeoffRepeatFuck);
			else {
				this.addDisabledButton(3,"Sex","Sex","You aren't aroused enough for sex.");
				output("\n\nYou aren't aroused enough for sex.");
			}
		}
	}
	this.addButton(14,"Back",mainGameMenu);
}

//Talk
public function talkToGeoff():void {
	clearOutput();
	author("Nonesuch");
	userInterface.showBust("GEOFF");
	userInterface.showName("\nGEOFF");
	if(flags["SEXED_GEOFF"] == undefined) {
		output("You ask the lanky, dreadlocked young man what brought him out to the frontier.");
		output("\n\n<i>“Tuition fees,”</i>  he says simply, as he goes on cleaning engine parts. <i>“I grew up on Sigius VI and wanted to go into engineering. Got the grades, but my folks don’t have the money. When my dad mentioned my uncle was going to come out here with a business and was looking for an assistant, it seemed to me like a win-win: make the money I need, and see the stars. Once in a century opportunity for a hell of a gap year, man.”</i>  He sighs. <i>“I, uh, kinda forgot what my uncle is like.”</i>");
		output("\n\nYou ask if he regrets taking the job.");
		output("\n\n<i>“Oh no, don’t get me wrong, I’m not complaining! I’m not earning as fast as I’d hoped, but it’s great out here. It’s nice to be in a place where the sun’s not coming through a blanket of smog, the people you meet in this job you wouldn’t believe, and the natives here are friendly. Uh. Real friendly.”</i>  His eyes glaze slightly, and you have to cough to make him focus back on you. <i>“And Uncle Artie might be... Uncle Artie... but he’s got me doing what I like doing. I love working with my hands, it’s what got me into engineering in the first place. Taking a broken thing apart, working out how it functions and putting it back together so it works, there’s nothing more satisfying than that.”</i>  He does sound genuinely impassioned when he says that, gripping the air with his strong but smooth hands as he talks.");
		processTime(3);
		this.clearMenu();
		if(pc.lust() >= 33) this.addButton(0,"Flirt",flirtWithGeoff);
		else {
			output("\n\nIf you were more turned on, you could flirt with him.");
			this.addDisabledButton(0,"Flirt");
		}
		this.addButton(14,"Back",buyFromGeoff);
	}
	else {
		//Talk:
		output("You say you’d just like to shoot the breeze with him. Shrugging amiably, the young mechanic points you to a shipping crate similar to the one his uncle is currently perched upon.");
		output("\n\nYou spend a pleasant half an hour sat in the back of the scrap hut chatting with Geoff as he continues dismantling pieces of machinery. He’s heard of your father, and is eager to hear any story you can possibly tell him about Steele, hero of the frontier. In return he tells you his own experiences in Esbeth. He says both the proprietor of the Mead Hall and Officer Penny are quite nice once you get to know them, although you get the distinct impression he’s rather intimidated by them both. After you’re done kicking your heels back you let him get back to it and head out of the scrapyard’s clutter.");
		processTime(30+rand(4));		
		this.clearMenu();
		this.addButton(0,"Next",mainGameMenu);
	}
}

public function flirtWithGeoff():void {
	clearOutput();
	author("Nonesuch");
	output("You smile suggestively and ask if he’s that good with his hands, perhaps he could give you a personal demonstration?");
	
	//PC is andro/masculine male/herm OR centaur/some other stupid shape with the genitals on the back:
	if(pc.mfn("","chick","") != "chick" || pc.isTaur() || pc.isNaga() || (!pc.hasCock() && !pc.hasVagina())) {
		userInterface.showBust("GEOFF");
		userInterface.showName("\nGEOFF");
		output("\n\n<i>“Sure!”</i> beams Geoff. <i>“Whenever you have a free afternoon, come around. I’ve got to get used to guys watching me dismantle engines and guns and stuff, right?”</i>");
		output("\n\nYou decide you’re better off not explaining what you actually meant.");
		this.clearMenu();
		this.addButton(0,"Next",buyFromGeoff);
		return;
	}
	flags["SEXED_GEOFF"] = 1;
	userInterface.showBust("GEOFF_NUDE");
	userInterface.showName("\nGEOFF");
	output("\n\n<i>“You?... I, uh.”</i>  says Geoff. He blushes, but then a wide grin breaks out on his long, pleasant face and he meets your eye. <i>“No, I could probably take a few minutes out to, uh, demonstrate a few things.”</i>  He slides his warm hand into yours before turning and leading you out into the shop’s back lot.");
	output("\n\n<i>“I told you you wouldn’t gain anything spiritual talking to him...”</i>  a reedy, sighing voice follows you out.");
	output("\n\nThe back lot is a sprawling, open-air garage-like area, dominated by a stationary robot wrapping a large hovercraft in cleansing steam. The hissing will certainly mask any noise of your own you will make, and increasingly eager, you deliberately press into the tall young mechanic, feeling his tight, firm flesh warm against you. Laughing, he responds by sending his hand roaming down your side, sliding down until he finds and cups your [pc.butt]. The garage is shielded from the worst of the hot sun by a metal roof, but sunlight still stubbornly pushes through its grimy skylights. The humidity couples with the haze of water in the air to give the place, for all that it smells of oil and metal, a sauna-like atmosphere. Moisture beads upon your skin as Geoff presses you into a free space on the wall, his gleeful grin replaced by an expression of concentration as he slides his hands over your skin, his breath coming heavier as he begins to remove your clothing and his fingers come into contact with the warmer, softer parts of your body. You smile, hang your arms around his skinny shoulders, and let him do the work.");
	output("\n\nHe obviously feels you’ve set him something of a challenge and he moves his hands carefully but confidently, shifting his warm grasp to your arms, your ribs, your stomach as he disrobes you - it’s as if he can’t really make proper sense of you until he’s touched and felt each part for himself. Although he’s wiped his hands clean, the grease he works with every day is ingrained into the whorls of his palms, allowing them to move with less friction than they normally would, the oil and moisture turning his grip into a warm glissade that is gently taking your clothes off. You sigh as he brushes your sensitive [pc.nipplesNoun], causing them to ");
	if(pc.hasFuckableNipples()) output("moisten");
	else output("harden");
	output(" eagerly with just the barest of touches.");
	
	if(pc.hasCock() && !pc.hasVagina()) {
		output("\n\nIt’s quite pleasant being weighed, unfurled and mapped out like this, however all Geoff’s sureness disappears in an instant when he finally ");
		if(pc.armor.shortName == "" && pc.lowerUndergarment.shortName == "") output("gets down to your crotch and your ");
		else output("takes your bottoms off and your ");
		output("[pc.cocks] spring");
		if(pc.cockTotal() == 1) output("s");
		output(" outwards impatiently.");
		
		output("\n\n<i>“Woah, woah, woah,”</i>  he cries out, taking half a step back. <i>“You’re a guy?!”</i>  You can’t help but giggle at the expression of complete bewilderment which has replaced the look of deep concentration - and yet you can’t also help but notice the fervent bulge which has been steadily growing in his own jeans over the last couple of minutes hasn’t abated. You wriggle, letting the sinuous movements of your girl-boy body drop your underclothes away, and when he doesn’t move, his eyes frozen on your form, step into him and begin to move your hands along their own slow path of seduction.");
		output("\n\nYou murmur into his ear that he shouldn’t worry about what you are, as you move your hands downwards, enjoying the pockets of softness to be found upon his frame here and there, ameliorating his firm, bony form. He doesn’t stop you and he groans softly as your hand slides into his pants and finds his hardening, sturdy six inch prick. After all, this guy isn’t, you say softly, grinning as you move your hand over and around his prick before focusing on his raphe, stroking it gently until he is straining.");
		output("\n\nAll reservations replaced by pulsing need, Geoff moves into you, his ragged breath harsh upon your face as he pushes into you, using his tight mass to push you against the wall. As you pull off his belt and let his faded jeans fall, he pauses- as unsure about what to do with you as if you’d handed him a strange new machine - before his hands form around your [pc.butt] and he rolls your hips so your [pc.asshole] faces outwards. He squeezes your ass and you laugh as you stroke his nape and fuzzy hair - clearly there’s at least one part of your body he’s reasonably assured about. You close your eyes as you feel his bulging hardness press against your sphincter.");
		output("\n\n<i>“Are you sure this is-?”</i>  he mumbles. <i>“I don’t want to-“</i>  Insistently, you tell him to keep going. The humid atmosphere, the slow movement of his hands and now his strong, wiry mass bent into you have made you feel soft and warm, your [pc.cock] still standing to attention. Given fresh purpose by the urgency in your voice, he pushes forward, penetrating you slowly.");
		output("\n\nYou grit your teeth as his un-lubed head pushes you wide and, wary of your sudden tension, he slows almost to a halt, waiting for you to get used to his hardness, with tiny movements of his hips working you loose enough for him to sink more of himself into your depths. You both sigh with satisfaction as he gets his head all the way past your sphincter, and you grip him tighter as you feel him push further and further into your back passage, filling and rubbing your sensitive tunnel with dick. Slowly but surely he gets into it, any awkwardness burnt away by the urge to bury himself into your willing boypussy. Without lube he can’t pound you so instead he stays at a slow, sensual pace, holding your ass tight as he brings himself out until only his head is inside you before sighing and pushing all the way inside again. Obviously a novice to this kind of thing, he only occasionally brushes and bumps against your prostate with his measured thrusting, sending the odd shiver of intense pleasure through you and making your own [pc.cock] bulge as it bumps against his tight stomach. This serves to tease you, the frustration making you feel more sensitive and turned on, and you moan into his shoulder, trying to force him to go faster.");
		pc.buttChange(geoff.biggestCockVolume());
		
		output("\n\nHe doesn’t, but he does begin to move his hands again. Unsure or unwilling to do anything with your dick, he instead focuses his attention upon your lips - using one hand to support you he uses his other set of fingers to circle them for a while before moving downwards, touching your chin before falling upon your nipples.");
		//Cunt nips:
		if(pc.hasFuckableNipples()) output(" He circles the pink fringes of one of your cunt nipples as he continues to push in and out of you, before sliding a finger into its soft, wet hole. You gasp at the intense double sensation of being penetrated doubly, dick and hands rubbing insistently upon the most sensitive parts of your anatomy.");
		else if(pc.hasDickNipples()) output(" He circles each slowly and then pauses, dumbfounded, as your prick teats push uncontrollably outwards from the pleasurable stimulation.\n\n<i>“Man, you are just full of surprises, aren’t you?”</i>  he mutters, and you laugh despite yourself. He’s too into it to stop now, and a moment later he goes back to pushing in and out of you, circling the base of your subsidiary dicks enough for them to swell with arousal, making you gasp with the intense double sensation, before sliding his hand down your stomach.");
		//Normal nips: 
		output(" He circles each slowly as he continues to push in and out of you, before shifting his thumb over your sensitive nubs until they are straining outwards and you are gasping from the intense double sensation of his dick and hands rubbing insistently over the most sensitive parts of your anatomy.");
		
		output("\n\nPanting now, you use the wall against your back to thrust back against him, squeezing at his dick, and as he responds by clutching you hard and thrusting into you hard enough for his tight balls to bat into your [pc.butt], you respond by wrapping your [pc.hips] around his thin waist and squeezing hard. It’s too much for him and with a series of ragged gasps he cums, his firm stomach and clenching balls battering into you as he fills you with wet, white warmth. Sweat and moisture mingle and drip off you both as you clutch at his back and continue to squeeze at him, forcing him to ride his orgasm on you, your own [pc.cocks] kneading against his stomach as he thrusts.");
		output("\n\nAfter he’s finished and withdraws from you, you spend a long minute gathering your breath, enjoying the feeling of each other’s bodies and the sticky humidity, the hissing steam continuing to billow around you indifferently. You’re slightly worried that the young mechanic will be pissed once he’s out of the moment because of the impromptu deception you played on him, but that seems to be the least of his concerns.");
		output("\n\n<i>“That was- uh. Wow.”</i>  Something occurs to him which deflates the huge, gleeful grin he’s radiating at you. <i>“Was it alright for you? You didn’t...I mean...”</i>  It was pretty good sex coming from a startled novice of a college kid, but no, you didn’t orgasm; you feel reamed but still needy, the hot weight which has built up in your loins untapped. You stroke his arms and tell him soothingly that he did fine, but perhaps if you do this again, he could locate some lube first?");
		output("\n\n<i>“Yeah! There will be another time, right? I mean, yeah, I can do that. Find some, I mean. Probably.”</i>  You laugh; his good natured awkwardness fits his lanky physique perfectly somehow. You give him a bit more of a cuddle before putting your clothes on and leaving the scrapyard through the back. Although you’re more than a bit damp, the hot sun will quickly take care of that.");
		pc.loadInAss(chars["GEOFF"]);
		pc.lustRaw += 25;
	}
	//Female:
	else if(pc.hasVagina() && !pc.hasCock()) {
		output("\n\nIt’s quite pleasant being weighed, unfurled and mapped out like this, and [pc.eachVagina] is already softened and beading with moisture when Geoff slides his hand down your [pc.butt] and touches it with the tips of his fingers. He strokes your outer lips gently, tracing the periphery backwards and forwards, and as you wet from the delicious sensation he sinks first one and then two fingers into you, stroking the sensitive entrance of your tunnel as he tests you.");
		output("\n\n<i>“You know,”</i> he murmurs into your ear as your breath comes quicker, <i>“I’m kinda surprised you aren’t, you know, packing down there. You hear these crazy stories about girls on the frontier... not that you. Uh. I don’t mean to say that. It’s not that you’re-”</i>  you silently tell him to let his body do the talking for a while by putting a finger on his lips. He grins and moves into you, pushing you up against the wall as his fingers drift onto your [pc.clit] and begins to circle it, working with greater intent now. You move your hands down from his face to do some exploring of your own, enjoying the pockets of softness to be found upon his frame here and there, ameliorating his firm, bony form. He groans softly as, grinning, your hand slides into his pants and finds his hardening, sturdy six inch prick. You move your hand over and around his length before focusing on his frenulum, stroking it gently whilst he continues to frig you, bending fingers into you as he flicks your [pc.oneClit] insistently with his thumb until your juices are leaking down your [pc.butt].");
	}
	else {
		output("\n\nIt’s quite pleasant being weighed, unfurled and mapped out like this, and [pc.eachVagina] is already softened and beading with moisture when Geoff slides his hand down your [pc.butt] and touches it with the tips of his fingers. He pauses slightly when he slips your underclothes down and your [pc.cocks] spring");
		if(pc.cockTotal() == 1) output("s");
		output(" upwards to greet him, however he doesn’t look all that surprised.");
		
		output("\n\n<i>“You wouldn’t believe the number of girls on Sigius VI looking to come out here who were talking about getting one of those,”</i>  he says in an undertone, as he gently fingers your outer lips. <i>“Getting the whole experience, or something. I don’t think I’d be brave enough.”</i>  Small veins of pleasure coursing up from your female sex with his movements, you tell him insistently to concentrate on what he’s doing. He grins and moves into you, pushing you up against the wall as his fingers drift onto [pc.oneClit] and begins to circle it, working with greater intent now. He traces the periphery of your wet opening tracing the periphery backwards and forwards, and as you wet from the delicious sensation he sinks first one and then two fingers into you, stroking the sensitive entrance of your tunnel as he tests you. Panting slightly now, you move your hands down from his face to do some exploring of your own, enjoying the pockets of softness to be found upon his frame here and there, ameliorating his firm, bony form. He groans softly as, grinning, your hand slides into his pants and finds his hardening, sturdy six inch prick. You move your hand over and around his length before focusing on his raphe, stroking it gently whilst he continues to frig you, bending fingers into you as he flicks [pc.oneClit] insistently with his thumb until your juices are leaking down your [pc.butt]. [pc.EachCock] hardens and bulges to the sensations inundating your female sex.");
	}
	if(pc.hasVagina()) {
		output("\n\nYou play with each other, each working the other into a furious lather until at last Geoff can’t take it anymore. He unfastens his belt and lets his faded jeans fall as he pushes into you, using his tight mass to push you against the wall, and you can’t help but cry out as he penetrates you in one go, his head pushing you wide before surging into your wet tunnel. The humidity and your own arousal make the sex liquid, his dick encountering barely any resistance as he rubs and fills you, and he almost immediately begins to fuck you with a frenetic eagerness, pushing you firmly into the wall as he thrusts his unyielding, lean hips into your softness, the flat lake of his stomach batting into your own. You thrust back into him, squeezing him with your [pc.hips], the wetness and pleasure you feel urging you to try and make him pound you even harder. When he tenses up moments later, gasping to your movements and clutching your back, you feel a sudden wish you hadn’t excited him as much as you have; he is pretty young, after all.");
		pc.cuntChange(0,geoff.biggestCockVolume());
		output("\n\nGeoff manages to pull himself back from the brink however, and after gathering his breath for a few moments, carries on at a more sedate, sensual pace, holding your [pc.butt] tight as he brings himself out until only his head is inside you before sighing and pushing all the way inside again. As he slides in and out of you he sends one hand roaming up your front, touching your chin for a second before drifting downward, cupping your [pc.chest] for a long moment before placing his fingertips on your nipples. ");
		
		//Cunt nips: 
		if(pc.hasFuckableNipples()) output("He circles the pink fringes of one of your cunt nipples as he continues to push in and out of you, before sliding a finger into its soft, wet hole. You gasp at the intense double sensation of being penetrated doubly, dick and hands rubbing insistently upon the most sensitive parts of your anatomy.");
		else if(pc.hasDickNipples()) output("He circles each slowly and then pauses, dumbfounded, as your prick teats push uncontrollably outwards from the pleasurable stimulation.\n\n<i>“Man, you are full of surprises, aren’t you?”</i>  he mutters, and you laugh despite yourself. He’s too into it to stop now, and a moment later he goes back to pushing in and out of you, circling the base of your subsidiary dicks enough for them to swell with arousal, making you gasp with the intense double sensation, before sliding his hand down your stomach.");
		//Normal nips:
		else output("He circles each slowly as he continues to push in and out of you, before shifting his thumb over your sensitive nubs until they are straining outwards and you are gasping from the intense double sensation of his dick and hands rubbing insistently over the most sensitive parts of your anatomy.");
		
		output("\n\nPanting now, you use the wall against your back to thrust back against him, wringing his dick, and as he responds by clutching you hard and thrusting into you hard enough for his tight balls to bat into your [pc.butt], and falling uncontrollably now towards your O, you respond by wrapping your [pc.hips] around his thin waist and squeezing hard. You cry out as you orgasm, your tunnel seizing and spurting juices deliriously around his hard meat.");
		//Herm:
		if(pc.hasCock()) output(" [pc.EachCock], bumped and ground between you, responds to the pleasure gripping your body by surging to climax as well, spurting ropes of cum onto your groin and belly.");
		
		output("\n\nYour thrashing is too much for Geoff and with a series of ragged gasps he cums seconds later, his firm stomach and clenching balls battering into you as he fills you with wet, white warmth. Sweat and moisture mingle and drip off you both as you clutch at his back and ride it out together.");
		
		output("\n\nAfter he’s finished and withdraws from you, you spend a long minute gathering your breath, enjoying the feeling of each other’s bodies and the sticky humidity, the hissing steam continuing to billow around you diffidently.");
		output("\n\n<i>“That was- uh. Wow,”</i>  says Geoff eventually. Something occurs to him which deflates the huge, gleeful grin he’s radiating at you. <i>“Was it alright for you? I never know if...I mean...”</i>  You laugh - his good natured awkwardness fits his lanky physique perfectly somehow. You tell him he did fine. Honestly, for a college kid he <i>is</i> pretty good with his hands. You give him a bit more of a cuddle before putting your clothes on and leaving the scrapyard through the back. Although you’re more than a bit damp, the hot sun will quickly take care of that.");
		pc.loadInCunt(chars["GEOFF"]);
		pc.orgasm();
	}
	processTime(15+rand(10));
	this.clearMenu();
	this.addButton(0,"Next",mainGameMenu);
}

//Sex: 
public function GeoffRepeatFuck():void {
	clearOutput();
	author("Nonesuch");
	userInterface.showBust("GEOFF_NUDE");
	userInterface.showName("\nGEOFF");
	output("You return his grin and slide your hand into his, and without a word the two of you debunk to the humidity and steam in the back.");
	
	//Female/Herm Repeat: 
	if(pc.hasVagina()) {
		output("\n\nThe robot is still hard at work back here, and you catch yourself wondering if Geoff keeps it on now deliberately to maintain the sauna-like atmosphere it generates. You press into the tall young mechanic, feeling his tight, firm flesh under your arms. Laughing, he responds by sending his hand roaming down your side, sliding down until he finds and cups your [pc.butt]. Moisture beads upon your skin as Geoff presses you into a free space on the wall, his gleeful grin replaced by an expression of concentration as he slides his hands over your skin, his breath coming heavier as he begins to remove your clothing and his fingers come into contact with the warmer, softer parts of your body. You smile, hang your arms around his skinny shoulders, and let him do the work.");
		output("\n\nHe moves his hands with care but sureness, shifting his warm grasp to your arms, your ribs, your stomach as he disrobes you - although he’s done this before now he doesn’t seem to lose any will to explore and measure you like this. Although he’s wiped his hands clean the grease he works with every day is ingrained into his whorls, allowing them to move with less friction than they normally would, the oil and moisture turning his grip into a warm glissade that is gently taking your clothes off. You sigh as he brushes your sensitive [pc.nipples], hardening/moistening eagerly with just the barest of touches.");
		output("\n\nIt’s quite pleasant being weighed, unfurled and mapped out like this, and [pc.eachVagina] is already softened and beading with moisture when Geoff slides his hand down your [pc.butt] and touches it with the tips of his fingers. He strokes your outer lips gently, tracing the periphery backwards and forwards, and as you grow wet from the delicious sensation he sinks first one and then two fingers into you, stroking the sensitive entrance of your tunnel as he tests you.");
		
		output("\n\nHe moves into you as you begin to pant slightly, pushing you up against the wall as his fingers drift onto [pc.eachClit] and begins to circle it, working with greater intent now. You move your hands down from his face to do some exploring of your own, enjoying the pockets of softness to be found upon his frame here and there, ameliorating his firm, bony form. He groans softly as, grinning, your hand slides into his pants and finds his hardening, sturdy six inch prick. You move your hand over and around his length before focusing on his sternum, stroking it gently whilst he continues to frig you, bending fingers into you as he flicks your [pc.eachClit] insistently with his thumb until your juices are leaking down your [pc.butt].");
		if(pc.hasCock()) output("[pc.EachCock] hardens and bulges to the sensations inundating your female sex.");
		
		output("\n\nYou play at each other, each working the other into a more furious lather until at last Geoff can’t take it anymore. He unfastens his belt and lets his faded jeans fall as he pushes into you, using his tight mass to force you against the wall, and you can’t help but cry out as he penetrates you in one go, his head pushing you wide before surging into your wet tunnel. The humidity and your own arousal make the sex liquid, his dick encountering barely any resistance as he rubs and fills you, and he almost immediately begins to fuck you with a frenetic eagerness, pushing you firmly into the wall as he thrusts his unyielding, lean hips into your softness, the flat lake of his stomach batting into your own. You thrust back into him, squeezing him with your [pc.hips], the wetness and pleasure you feel urging you to try and make him pound you even harder. When he tenses up moments later, gasping to your movements and clutching your back, you then feel a sudden wish you hadn’t gotten him as excited as you have; he is only a kid fresh out of college, after all.");
		pc.cuntChange(0,geoff.biggestCockVolume());
		output("\n\nGeoff manages to pull himself back from the brink however, and after gathering his breath on you for a few moments, carries on at a more sedate, sensual pace, holding your [pc.butt] tight as he brings himself out until only his head is inside you before sighing and pushing all the way inside again. As he slides in and out of you he sends one hand roaming up your front, touching your chin for a second before drifting downward, cupping your [pc.chest] for a long moment before placing his fingertips on your nipples.");
		//Cunt
		if(pc.hasFuckableNipples()) output(" He circles the pink fringes of one of your cunt nipples as he continues to push in and out of you, before sliding a finger into its soft, wet hole. You gasp at the intense double sensation of being penetrated doubly, dick and hands rubbing insistently upon the most sensitive parts of your anatomy.");
		else if(pc.hasDickNipples()) output(" He circles each slowly and then pauses, dumbfounded, as your prick teats push uncontrollably outwards from the pleasurable stimulation.\n\n<i>“I don’t think I’m ever gonna get used to that,”</i> he mutters, and you laugh despite yourself. He’s too into it to stop now, and a moment later he goes back to pushing in and out of you, circling the base of your subsidiary dicks enough for them to swell with arousal, making you gasp with the intense double sensation, before sliding his hand down your stomach.");
		//Normal nips:
		else output(" He circles each slowly as he continues to push in and out of you, before shifting his thumb over your sensitive nubs until they are straining outwards and you are gasping from the intense double sensation of his dick and hands rubbing insistently over the most sensitive parts of your anatomy.");
		
		output("\n\nPanting now, you use the wall against your back to thrust back against him, wringing his dick, and as he responds by clutching you hard and thrusting into you hard enough for his tight balls to bat into your [pc.butt], and rising uncontrollably now towards your O, you respond by wrapping your [pc.hips] around his thin waist and squeezing hard. You cry out as you orgasm, your tunnel seizing and spurting juices deliriously around his hard meat.");
		//Herm:
		if(pc.hasCock()) output(" [pc.EachCock], bumped and ground between you, responds to the pleasure gripping your body by surging to climax as well, spurting ropes of cum onto your groin and belly.");
		
		output("\n\nYour thrashing is too much for Geoff and with a series of ragged gasps he cums seconds later, his firm stomach and clenching balls battering into you as he fills you with wet, white warmth. Sweat and moisture mingle and drip off you both as you clutch at his back and ride it out together.");
		
		output("\n\nAfter he’s finished and withdraws from you, you spend a long minute gathering your breath, enjoying the feeling of each other’s bodies and the sticky humidity, the hissing steam continuing to billow around you indifferently.");
		
		output("\n\n<i>“That was - uh. Wow,”</i> says Geoff eventually. Something occurs to him which deflates the huge, gleeful grin he’s radiating at you. <i>“Was it alright for you? I never know if... I mean...”</i>  You laugh, and ask him exactly how many times are you going to need to tell him he does fine? You do come back, after all. You give him a bit more of a cuddle before putting your clothes on and leaving the scrapyard through the back. Although you’re more than a bit damp, the hot sun will quickly take care of that.");
		pc.loadInCunt(chars["GEOFF"],0);
	}
	//Male first repeat:
	else if(flags["GEOFF_FUCKED_DUDES_TWICE"] == undefined) {
		flags["GEOFF_FUCKED_DUDES_TWICE"] = 1;
		output("\n\n<i>“I thought about what you said,”</i>  says Geoff, as he leads you back into the billowing heat and moisture of the garage. The robot is still hard at work back here, and you catch yourself wondering if Geoff keeps it on now deliberately to maintain the sauna-like atmosphere it generates. <i>“I was going to ask around the Mead Hall about good lubrication, but...“</i>  He lets the embarrassed silence finish the sentence. He lets go of your hand to rummage around in a large tool case. <i>“But, uh. I go to a few gear-head forums on the extranet, and there’s this rumour...I dunno if it’s true or not, but...”</i>  he straightens up and, with a grin, brandishes a large blue tube of- you squint - ‘Blastrol Ship Oil 5000’.");
		output("\n\n<i>“It’s not the really hardcore stuff you use for ship engines. You want the 4000 series or Vulvoline for that,”</i>  says Geoff with authority. As long as he’s talking about machines and not sex with you, he’s got all the confidence in the world. <i>“This is the stuff you use to make sure the parts of the ship the crew are likely to come into contact with are protected from wear and move smoothly - doors, monitor casing, that kind of thing. Because of that it’s supposed to be, uh. Kind to the skin. As well as smooth. I know it smells quite nice,”</i> he finishes lamely, bouncing the tube against his narrow thigh as if he’s half-convinced himself this was a dumb idea. You laugh - there’s no way industrial space grease would make for a good lubricant, surely? You find yourself weirdly flattered he put any amount of thought into it, though. You slide your arms around him reassuringly and say, why not? What’s the worst that c... well, you’d like to try anyway.");
		
		output("\n\nGiven courage by your approval, Geoff grins back at you shyly and then bends into you, backing you up slowly towards the wall as he begins to explore your body afresh, moving his strong hands down you as he begins to unfurl you. Moisture beads upon your skin as he finally presses you into a free space on the wall, his gleeful grin replaced by an expression of concentration as he slides his hands over your skin, his breath coming heavier as he begins to remove your clothing and his fingers come into contact with the warmer, softer parts of your body. You smile, hang your arms around his skinny shoulders, and let him do the work.");
		
		output("\n\nHe moves his hands with care but sureness, shifting his warm grasp to your arms, your ribs, your stomach");
		if(!pc.isNude()) output(" as he disrobes you");
		output(" - although he’s done this before now he doesn’t seem to lose any will to explore and measure you like this. He’s wiped his hands clean of the grease he works with every day but it’s ingrained into his whorls, allowing them to move with less friction than they normally would, the oil and moisture turning his grip into a warm glissade that is gently taking your clothes off. You sigh as he brushes your sensitive nipples, ");
		if(pc.hasFuckableNipples()) output("moistening");
		else output("hardening");
		output(" eagerly with just the barest of touches. You wriggle, letting the sinuous movements of your girl-boy body drop your underclothes away at the same time as pushing your flesh more firmly into his hands, before moving your own down his body.");
		
		output("\n\nYou move your hands downwards, enjoying the pockets of softness to be found upon his frame here and there, ameliorating his firm, bony form. He groans softly as your hand slides into his pants and find his hardening, sturdy six inch prick. You grin as you move your hand over and around his prick before focusing on his sternum, stroking it gently until he is straining.");
		output("\n\nAll reservations replaced by pulsing need, Geoff almost completely forgets his agonised preparations, and has already hooked his belt and faded jeans off when he remembers. Hampered by his own burgeoning erection, he retrieves the blue tube from across the room and unloads some of its contents onto his palm. It is a golden color and has the consistency of shampoo, quickly oozing off his hands to dollop onto the floor. Blushing deeply, he holds your gaze as he lets his boxers fall and massages some into his stiff, unpretentiously human length.");
		output("\n\n<i>“Feels warm,”</i> he murmurs. <i>“Would you like some?”</i> You take the tube off him and, with exaggerated slowness, squeeze and swirl it over your hand until it’s dripping trails of the honey colored stuff. You give him the doe eyes as you turn, displaying your [pc.butt] to him as you press your oozing fingers against your [pc.asshole], closing your eyes and moaning softly as you penetrate yourself. He’s right - the stuff is warm and coating, smelling rather like ginger with a slight, high solvent edge. You push your fingers in up to the base, sighing as you slather your sensitive passage in warmth.");
		output("\n\nHis overwhelming need restored by your wanton show, Geoff moves into you, his straining, oily dick sliding through your butt cheeks and pressing urgently against your back. Grinning, you turn and put your arms around his neck - looking at his face as he goes about you is at least half of the fun on offer here. His ragged breath is harsh upon your face as he pushes into you, using his tight mass to push you against the wall, his hands forming around your [pc.butt] and he rolls your hips so your [pc.asshole] faces outwards. He squeezes your ass and you laugh as you stroke his nape and fuzzy hair; clearly there’s at least one part of your body he’s reasonably assured about. You close your eyes as you feel his bulging hardness press against your sphincter before he penetrates you slowly.");
		pc.buttChange(geoff.biggestCockVolume());
		
		output("\n\nThis is much better. His un-lubed head pushing you wide is intense as ever, but the coating oil bonding the two of you together makes it far easier, far more pleasurable. He gasps, almost laughing, at how easy it is to slide his hard length into you, and you clutch your back as he fills more and more of you, stopping only when his balls bump into your [pc.butt]. He stops there for a moment, and then slowly withdraws to the head before with a sigh pushing irresistibly in again, thrusting into each time with a bit more power, fucking you with long, sure strokes. He rubs your oiled yet tender tunnel and pushes against your prostrate and goddamn... you can’t help moan into his shoulder, your own dick straining between you, trying to force him to go faster.");
		output("\n\nHe doesn’t, but he does begin to move his hands again. He first focuses his attention upon your lips - using one hand to support you he uses his other set of fingers to circle them for a while before moving downwards, touching your chin before falling upon your nipples.");
		//Cunt nips:
		if(pc.hasFuckableNipples()) output(" He circles the pink fringes of one of your fuckably slick nipples as he continues to push in and out of you, before sliding a finger into its soft, wet hole. You gasp at the intense double sensation of being penetrated doubly, dick and hands rubbing insistently upon the most sensitive parts of your anatomy.");
		//Dick nips: 
		else if(pc.hasDickNipples()) output(" He circles each slowly and then pauses, dumbfounded, as your prick teats push uncontrollably outwards from the pleasurable stimulation.\n\n<i>“Man, I am never gonna get used to that,”</i> he mutters, and you laugh despite yourself. He’s too into it to stop now, and a moment later he goes back to pushing in and out of you, circling the base of your subsidiary dicks enough for them to swell with arousal, making you gasp with the intense double sensation, before sliding his hand down your stomach.");
		//Normal nips:
		else output(" He circles each slowly as he continues to push in and out of you, before shifting his thumb over your sensitive nubs until they are straining outwards and you are gasping from the intense double sensation of his dick and hands rubbing insistently over the most sensitive parts of your anatomy.");
		
		output("\n\nPanting now, you use the wall against your back to thrust back against him, squeezing at his dick, and as he responds by clutching you hard and thrusting into you hard enough for his tight balls to bat into your [pc.butt], pounding you now. Pinprick stars beginning to float in your eyes, you feel yourself being pushed uncontrollably upwards and unable to help yourself you wrap your [pc.hips] around his thin waist and squeeze hard, crying out as you cum. You buck against him as you spurt line after line of jizz against both him and yourself. It’s too much for your partner and with a series of ragged gasps he orgasms seconds later, his firm stomach and clenching balls battering into you as he fills you with wet, white warmth. Sweat and moisture mingle and drip off you both as you clutch at his back and continue to squeeze at him, forcing him to ride his orgasm on you, [pc.eachCock] kneading against his stomach as he thrusts.");
		
		output("\n\nAfter he’s finished and withdraws from you, you spend a long minute gathering your breath, enjoying the feeling of each other’s bodies and the sticky humidity, the hissing steam continuing to billow around you indifferently. After you’ve come back to Terra a bit you smile at him and say, <i>“well, that was a bit better, wasn’t it?”</i>");
		
		output("\n\n<i>“J-just a bit. Wow.”</i>  You cannot help but laugh at the huge, gleeful grin he’s radiating at you. You have to admit, for a kid fresh out of college, he is pretty good with his hands. You give him a bit more of a cuddle before putting your clothes on and leaving the scrapyard through the back. Although you’re more than a bit damp, the hot sun will quickly take care of that.");
		pc.loadInAss(chars["GEOFF"]);
	}
	else {
		output("\n\nAs soon as you’re in the back area and the hissing steam has encompassed you, Geoff heads straight for his storage cabinet. You look over his shoulder as he opens and laugh - it’s packed to the brim with blue tubes. He turns and shrugs with smiling embarrassment when he sees you looking.");
		output("\n\n<i>“Well... it is pretty useful stuff.”</i>  Still grinning shyly, he slides his arms around you, backing you up slowly towards the wall as he begins to explore your body afresh, moving his strong hands down you as he begins to unfurl you. Moisture beads upon your skin as he finally presses you into a free space on the wall, his smile replaced by an expression of concentration as he slides his hands over your skin, his breath coming heavier as he begins to remove your clothing and his fingers come into contact with the warmer, softer parts of your body. You smile, hang your arms around his skinny shoulders, and let him do the work.");
		output("\n\nHe moves his hands with care but sureness, shifting his warm grasp to your arms, your ribs, your stomach as he disrobes you - although he’s done this before now he doesn’t seem to lose any will to explore and measure you like this. He’s wiped his hands clean of the grease he works with every day but it’s ingrained into his whorls, allowing them to move with less friction than they normally would, the oil and moisture turning his grip into a warm glissade that is gently taking your clothes off. You sigh as he brushes your sensitive [pc.nipples], ");
		if(!pc.hasFuckableNipples()) output("hardening");
		else output("moistening");
		output(" eagerly with just the barest of touches. You wriggle, letting the sinuous movements of your girl-boy body drop your underclothes away at the same time as pushing your flesh more firmly into his hands, before moving your own down his body.");
		
		output("\n\nYou move your hands downwards, enjoying the pockets of softness to be found upon his frame here and there, ameliorating his firm, bony form. He groans softly as your hand slides into his pants and find his hardening, sturdy six inch prick. You grin as you move your hand over and around his prick before focusing on his sternum, stroking it gently until he is straining.");
		
		output("\n\nAll reservations replaced by pulsing need, Geoff almost completely forgets his preparations, and has already hooked his belt and faded jeans off when he remembers. Hampered by his own burgeoning erection, he retrieves the blue tube from across the room and unloads some of its contents onto his palm. It is a golden color and has the consistency of shampoo, quickly oozing off his hands to dollop onto the floor. Blushing deeply, he holds your gaze as he lets his boxers fall and massages some into his stiff, unpretentiously human length. You take the tube off him and, with exaggerated slowness, squeeze and swirl it over your hand until it’s dripping trails of the honey colored stuff. You give him the doe eyes as you turn, displaying your [pc.butt] to him as you press your oozing fingers against your [pc.asshole], closing your eyes and moaning softly as you penetrate yourself. It always comes as a pleasant surprise just how nice this stuff is - warm and coating, smelling rather like ginger with a slight, high solvent edge. You push your fingers in up to the base, sighing as you slather your sensitive passage in warmth.");
		
		output("\n\nHis overwhelming need restored by your wanton display, Geoff moves into you, his straining, oily dick sliding through your butt cheeks and pressing urgently against your back. Grinning, you turn and put your arms around his neck - looking at his face as he goes about you is at least half of the fun on offer. His ragged breath is harsh upon your face as he pushes into you, using his tight mass to push you against the wall, his hands forming around your [pc.butt] and he rolls your hips so your [pc.asshole] faces outwards. He squeezes your ass and you laugh as you stroke his nape and fuzzy hair- clearly there’s at least one part of your body he’s very assured about. You close your eyes as you feel his bulging hardness press against your sphincter before he penetrates you slowly.");
		
		output("\n\nHis un-lubed head pushing you wide is intense as ever, but the coating oil bonding the two of you together makes it far easier, far more pleasurable. He gasps, almost laughing, at how easy it is to slide his hard length into you, and you clutch your back as he fills more and more of you, stopping only when his balls bump into your [pc.butt]. He stops there for a moment, and then slowly withdraws to the head before with a sigh pushing irresistibly in again, thrusting into each time with a bit more power, fucking you with long, sure strokes. He rubs your oiled yet tender tunnel and pushes against your prostrate and goddamn... you can’t help moan into his shoulder, your own dick straining between you, trying to force him to go faster.");
		
		output("\n\nHe doesn’t, but he does begin to move his hands again. He first focuses his attention upon your lips- using one hand to support you he uses his other set of fingers to circle them for a while before moving downwards, touching your chin before falling upon your nipples. ");
		//Cunt nips:
		if(pc.hasFuckableNipples()) output("He circles the pink fringes of one of your cunt nipples as he continues to push in and out of you, before sliding a finger into its soft, wet hole. You gasp at the intense double sensation of being penetrated doubly, dick and hands rubbing insistently upon the most sensitive parts of your anatomy.");
		else if(pc.hasDickNipples()) output("He circles each slowly and then pauses, dumbfounded, as your prick teats push uncontrollably outwards from the pleasurable stimulation.\n\n<i>“Man, I am never gonna get used to that,”</i>  he mutters, and you laugh despite yourself. He’s too into it to stop now, and a moment later he goes back to pushing in and out of you, circling the base of your subsidiary dicks enough for them to swell with arousal, making you gasp with the intense double sensation, before sliding his hand down your stomach.");
		//Normal nips:
		else output("He circles each slowly as he continues to push in and out of you, before shifting his thumb over your sensitive nubs until they are straining outwards and you are gasping from the intense double sensation of his dick and hands rubbing insistently over the most sensitive parts of your anatomy.");
		
		output("\n\nPanting now, you use the wall against your back to thrust back against him, squeezing at his dick, and as he responds by clutching you hard and thrusting into you hard enough for his tight balls to bat into your [pc.butt], pounding you now. Pinprick stars beginning to float in your eyes, you feel yourself being pushed uncontrollably upwards and unable to help yourself you wrap your [pc.hips] around his thin waist and squeeze hard, crying out as you cum. You buck against him as you spurt line after line of jizz against both him and yourself. It’s too much for your partner, and with a series of ragged gasps, he orgasms seconds later, his firm stomach and clenching balls battering into you as he fills you with wet, white warmth. Sweat and moisture mingle and drip off you both as you clutch at his back and continue to squeeze at him, forcing him to ride his orgasm on you, [pc.eachCock] kneading against his stomach as he thrusts.");
		
		output("\n\nAfter he’s finished and withdraws from you, you spend a long minute gathering your breath, enjoying the feeling of each other’s bodies and the sticky humidity, the hissing steam continuing to billow around you indifferently. After you’ve come back to Terra a bit you smile at him. There’s no real need to say anything anymore, and you just grin at each other like idiots. You give him a bit more of a cuddle before putting your clothes on and leaving the scrapyard through the back. Although you’re more than a bit damp, the hot sun will quickly take care of that.");
		pc.loadInAss(chars["GEOFF"]);
	}
	processTime(45+rand(10));
	pc.orgasm();
	geoff.orgasm();
	this.clearMenu();
	this.addButton(0,"Next",mainGameMenu);
}

