
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
		output("You go through the open gate of the scrapyard and cautiously stick your head around the stone hut’s door. It is, if anything, even more packed with junk than the outside - the room is gloomy with the amount of stuff piled up against the walls and windows. Stands filled with everything from old shoes to busted hologram projectors jostle for room with silent, antiquated robots and mismatched gun racks slithering with spools of power connectors.");
		output("\n\n<i>“Ah! Another adventurer into the cosmic unknown,”</i> says a reedy voice. <i>“Please, friend - take three steps forward and one to the right.”</i> You step into the junk shop and, as your eyes adjust to the gloom, take in the curious figure seated in the middle of this empire of crap. He’s a small, middle aged man with walnut skin, completely bald, dressed in sandals and a brown shift which might once have passed for an ancient monk’s cowl, before it got completely covered in oil stains. He is perched cross-legged upon a big shipping crate, surrounded on all sides by meticulously cleaned metal parts and pieces. He looks at you placidly.");
		output("\n\n<i>“And one to the right.”</i> Baffled, you step to the right and are rewarded with a big, beatific smile spreading across his face.");
		output("\n\n<i>“Ahhhh. That’s it! That’s it. Qi restored. Maybe even better than before you came in. You are a blessed visitor, my friend. Let me explain where you are.”</i> He lifts his arms and rather theatrically indicates the junk surrounding you. <i>“I accumulate objects for a living. Uncared-for objects, objects thrown away carelessly before their true cosmic value has been established. I pay a small fee related to their monetary value to take such objects off your hands - although a price tag, of course, is in no way related to an item’s true worth! No object comes into this shop by chance. Here, in my constructed universe, they are arranged until I have discerned their true purpose. With a proper amount of meditation, that purpose becomes clear to me... even if it is to depart in somebody else’s hands. Old parts, discarded, brought together, made into something new and more than their sum, leaving in the hands of another, to fit back into life’s giant jigsaw puzzle. A beautiful thing.”</i>");
		output("\n\n<i>“You’re a scrap merchant then,”</i> you say. He grimaces as if you just caused him considerable pain.");
		output("\n\n<i>“Scrap</i> dealer. <i>I don’t do anything so base as to buy scrap, I </i>deal<i> with it. Artie is my name, and scrap is my art. Now, my hardnosed friend...”</i> He clasps his hands in a prayer-like fashion and gazes at you, lazy smile restored. <i>“If you’d like to sell me objects that have fallen into your possession, show them to me and we will discuss their transient worth. If you would like to buy items that by unknowable grace have reconstructed themselves into working order, talk to my nephew Geoff. He’s in the back.”</i> You were concentrating on the proprietor so much you’re slightly taken aback by the fact there’s somebody else in the shop. The young man cleaning what looks like the innards of a hovercraft is lanky, brown skinned and has dreads tied back in a loose knot, with a flat nose and amiable good looks. He gives you a slightly embarrassed wave.");
		output("\n\n<i>“Good lad, but not terribly clued up on the cosmic side of things,”</i> Artie says to you, en sotto. <i>“I’m afraid talking to him will not be as spiritual an experience as with me.”</i>");
	}
	else {
		userInterface.showBust("ARTIE");
		//Sell/Buy/Leave
		output("Artie nods at you as you enter the scrap yard hut, smiling peacefully as he closes his eyes and goes back to meditating over a large diode. Geoff is busy working on something in the back.");
	}
	addButton(0,"Buy",buyFromGeoff);
	addButton(1,"Sell",sellToArtie);
}

public function sellToArtie():void {
	author("Nonesuch");
	shopkeep = geoff;
	sellItem();
}
public function buyItemFromGeoff():void {
	author("Nonesuch");
	shopkeep = geoff;
	buyItem();
}
public function buyFromGeoff():void {
	clearOutput();
	author("Nonesuch");
	userInterface.showBust("GEOFF");
	userInterface.showName("\nGEOFF");
	if(flags["MET_GEOFF"] == undefined) output("You pick your way through the clutter to the back part of the shop. Geoff is seated in front of a wall hung with armor, shields and other durable pieces of technology, evidently reconstructed from scrap. He wipes his hand on a rag as you reach him and then offers you it.\n\n<i>“Hey. Nice to see a new face,”</i> he says. He grins at you sheepishly. <i>“Uh, everything you can see behind me is for sale. If you want to sell stuff, you’ll have to talk to Artie. The last time I bought something it turned out to have an evil aura, or something.”</i>");
	else if(flags["SEXED_GEOFF"] == 1) output("Geoff smiles at you as you carefully make your way over to him.\n\n<i>“Hey, [pc.name]. Looking to buy something? Or...”</i> his grin becomes wider. <i>“...do you need a hand with something?”</i>");
	else output("Geoff smiles at you as you carefully make your way over to him.\n\n<i>“Hey, [pc.name]. Looking to buy something?”</i>");
	geoff.keeperBuy = "What would you like to buy?\n";
	flags["MET_GEOFF"] = 1;
	this.clearMenu();
	this.addButton(0,"Buy",buyItemFromGeoff);
	this.addButton(1,"Talk",talkToGeoff);

	if(flags["SEXED_GEOFF"] == 1) 
	{
		if (pc.isMasculine() && flags["SEXED_GEOFF_MASC"] == undefined || pc.isTaur() || pc.isNaga())
		{
			addDisabledButton(3,"Sex","Sex","You aren’t feminine enough for sex with Geoff.");
			output("\n\nGeoff doesn’t seem interested in sex with the way you look right now...");
		}

		if (pc.lust() >= 33)
		{
			if ((pc.isMasculine() && flags["SEXED_GEOFF_MASC"] == 1) || pc.isFeminine())
			{
				addButton(3, "Bottom", GeoffRepeatFuck);
				if (pc.hasCock()) addButton(4, "Top", dudesTopGeoff);
			}
		}
		else
		{
			addDisabledButton(3,"Sex","Sex","You aren’t aroused enough for sex.");
			output("\n\nYou aren’t aroused enough for sex.");
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
	if(flags["SEXED_GEOFF"] == undefined || (pc.isMasculine() && flags["SEXED_GEOFF_MASC"] == undefined)) 
	{
		output("You ask the lanky, dreadlocked young man what brought him out to the frontier.");
		output("\n\n<i>“Tuition fees,”</i> he says simply, as he goes on cleaning engine parts. <i>“I grew up on Sigius VI and wanted to go into engineering. Got the grades, but my folks don’t have the money. When my dad mentioned my uncle was going to come out here with a business and was looking for an assistant, it seemed to me like a win-win: make the money I need, and see the stars. Once in a century opportunity for a hell of a gap year, man.”</i> He sighs. <i>“I, uh, kinda forgot what my uncle is like.”</i>");
		output("\n\nYou ask if he regrets taking the job.");
		output("\n\n<i>“Oh no, don’t get me wrong, I’m not complaining! I’m not earning as fast as I’d hoped, but it’s great out here. It’s nice to be in a place where the sun’s not coming through a blanket of smog, the people you meet in this job you wouldn’t believe, and the natives here are friendly. Uh. Real friendly.”</i> His eyes glaze slightly, and you have to cough to make him focus back on you. <i>“And Uncle Artie might be... Uncle Artie... but he’s got me doing what I like doing. I love working with my hands, it’s what got me into engineering in the first place. Taking a broken thing apart, working out how it functions and putting it back together so it works, there’s nothing more satisfying than that.”</i> He does sound genuinely impassioned when he says that, gripping the air with his strong but smooth hands as he talks.");
		processTime(3);
		this.clearMenu();
		if(pc.lust() >= 33)
		{
			addButton(0,"Flirt",flirtWithGeoff);
		}
		else 
		{
			output("\n\nIf you were more turned on, you could flirt with him.");
			this.addDisabledButton(0,"Flirt");
		}
		this.addButton(14,"Back",buyFromGeoff);
	}
	else {
		//Talk:
		output("You say you’d just like to shoot the breeze with him. Shrugging amiably, the young mechanic points you to a shipping crate similar to the one his uncle is currently perched upon.");
		output("\n\nYou spend a pleasant half an hour seated in the back of the scrap hut chatting with Geoff as he continues dismantling pieces of machinery. He’s heard of your father, and is eager to hear any story you can possibly tell him about Steele, hero of the frontier. In return he tells you his own experiences in Esbeth. He says both the proprietor of the Mead Hall and Officer Penny are quite nice once you get to know them, although you get the distinct impression he’s rather intimidated by them both. After you’re done kicking your heels back you let him get back to it and head out of the scrapyard’s clutter.");
		processTime(30+rand(4));
		this.clearMenu();
		this.addButton(0,"Next",mainGameMenu);
	}
}

public function flirtWithGeoff():void {
	clearOutput();
	author("Nonesuch");
	userInterface.showBust("GEOFF_NUDE");
	userInterface.showName("\nGEOFF");

	output("You smile suggestively and ask if he’s that good with his hands, perhaps he could give you a personal demonstration?");
		
	// Genderless & Not Bipeds get fucked off
	if (!pc.isBiped() || (!pc.hasCock() && !pc.hasVagina()))
	{
		output("\n\n<i>“Sure!”</i> beams Geoff. <i>“Whenever you have a free afternoon, come around. I’ve got to get used to guys watching me dismantle engines and guns and stuff, right?”</i>");

		output("\n\nYou decide you’re better off not explaining what you actually meant.");
		addButton(0, "Next", buyFromGeoff);
		return;
	}

	// Masculine players who haven't flirted harder with him get options.
	if (pc.isMan() && flags["SEXED_GEOFF_MASC"] == undefined)
	{
		output("\n\n<i>“Sure!”</i> beams Geoff. <i>“Whenever you have a free afternoon, come around. I’ve got to get used to guys watching me dismantle engines and guns and stuff, right?”</i>");

		addButton(0, "Flirt More", flirtMoreWithGeoff);
		addButton(1, "Never Mind", buyFromGeoff);
		return;
	}
	
	output("\n\n<i>“You?... I, uh.”</i> says Geoff. He blushes, but then a wide grin breaks out on his long, pleasant face and he meets your eye. <i>“No, I could probably take a few minutes out to, uh, demonstrate a few things.”</i> He slides his warm hand into yours before turning and leading you out into the shop’s back lot.");
	output("\n\n<i>“I told you you wouldn’t gain anything spiritual talking to him...”</i> a reedy, sighing voice follows you out.");
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
		
		if (pc.isFeminine() && flags["SEXED_GEOFF"] == undefined && flags["SEXED_GEOFF_MASC"] == undefined)
		{
			output("\n\n<i>“Woah, woah, woah,”</i> he cries out, taking half a step back. <i>“You’re a guy?!”</i>");
		}
		else
		{
			output("\n\nHis eyes fall upon your burgeoning length");
			if (pc.cocks.length > 1) output("s");
			output(" and he falters momentarily.");
		}
		
		output(" You can’t help but giggle at the expression of complete bewilderment which has replaced the look of deep concentration - and yet you can’t also help but notice the fervent bulge which has been steadily growing in his own jeans over the last couple of minutes hasn’t abated. You wriggle, letting the sinuous movements of your girl-boy body drop your underclothes away, and when he doesn’t move, his eyes frozen on your form, step into him and begin to move your hands along their own slow path of seduction.");
	
		output("\n\nYou murmur into his ear that he shouldn’t worry about what you are, as you move your hands downwards, enjoying the pockets of softness to be found upon his frame here and there, ameliorating his firm, bony form. He doesn’t stop you and he groans softly as your hand slides into his pants and finds his hardening, sturdy six inch prick. After all, this guy isn’t, you say softly, grinning as you move your hand over and around his prick before focusing on his raphe, stroking it gently until he is straining.");
		output("\n\nAll reservations replaced by pulsing need, Geoff moves into you, his ragged breath harsh upon your face as he pushes into you, using his tight mass to push you against the wall. As you pull off his belt and let his faded jeans fall, he pauses - as unsure about what to do with you as if you’d handed him a strange new machine - before his hands form around your [pc.butt] and he rolls your hips so your [pc.asshole] faces outwards. He squeezes your ass and you laugh as you stroke his nape and fuzzy hair - clearly there’s at least one part of your body he’s reasonably assured about. You close your eyes as you feel his bulging hardness press against your sphincter.");
		output("\n\n<i>“Are you sure this is-?”</i> he mumbles. <i>“I don’t want to-“</i> Insistently, you tell him to keep going. The humid atmosphere, the slow movement of his hands and now his strong, wiry mass bent into you have made you feel soft and warm, your [pc.cock] still standing to attention. Given fresh purpose by the urgency in your voice, he pushes forward, penetrating you slowly.");
		output("\n\nYou grit your teeth as his un-lubed head pushes you wide and, wary of your sudden tension, he slows almost to a halt, waiting for you to get used to his hardness, with tiny movements of his hips working you loose enough for him to sink more of himself into your depths. You both sigh with satisfaction as he gets his head all the way past your sphincter, and you grip him tighter as you feel him push further and further into your back passage, filling and rubbing your sensitive tunnel with dick. Slowly but surely he gets into it, any awkwardness burnt away by the urge to bury himself into your willing boypussy. Without lube he can’t pound you so instead he stays at a slow, sensual pace, holding your ass tight as he brings himself out until only his head is inside you before sighing and pushing all the way inside again. Obviously a novice to this kind of thing, he only occasionally brushes and bumps against your prostate with his measured thrusting, sending the odd shiver of intense pleasure through you and making your own [pc.cock] bulge as it bumps against his tight stomach. This serves to tease you, the frustration making you feel more sensitive and turned on, and you moan into his shoulder, trying to force him to go faster.");
		pc.buttChange(geoff.biggestCockVolume());
		
		output("\n\nHe doesn’t, but he does begin to move his hands again. Unsure or unwilling to do anything with your dick, he instead focuses his attention upon your lips - using one hand to support you he uses his other set of fingers to circle them for a while before moving downwards, touching your chin before falling upon your nipples.");
		//Cunt nips:
		if(pc.hasFuckableNipples()) output(" He circles the pink fringes of one of your cunt nipples as he continues to push in and out of you, before sliding a finger into its soft, wet hole. You gasp at the intense double sensation of being penetrated doubly, dick and hands rubbing insistently upon the most sensitive parts of your anatomy.");
		else if(pc.hasDickNipples()) output(" He circles each slowly and then pauses, dumbfounded, as your prick teats push uncontrollably outwards from the pleasurable stimulation.\n\n<i>“Man, you are just full of surprises, aren’t you?”</i> he mutters, and you laugh despite yourself. He’s too into it to stop now, and a moment later he goes back to pushing in and out of you, circling the base of your subsidiary dicks enough for them to swell with arousal, making you gasp with the intense double sensation, before sliding his hand down your stomach.");
		//Normal nips: 
		output(" He circles each slowly as he continues to push in and out of you, before shifting his thumb over your sensitive nubs until they are straining outwards and you are gasping from the intense double sensation of his dick and hands rubbing insistently over the most sensitive parts of your anatomy.");
		
		output("\n\nPanting now, you use the wall against your back to thrust back against him, squeezing at his dick, and as he responds by clutching you hard and thrusting into you hard enough for his tight balls to bat into your [pc.butt], you respond by wrapping your [pc.hips] around his thin waist and squeezing hard. It’s too much for him and with a series of ragged gasps he cums, his firm stomach and clenching balls battering into you as he fills you with wet, white warmth. Sweat and moisture mingle and drip off you both as you clutch at his back and continue to squeeze at him, forcing him to ride his orgasm on you, your own [pc.cocks] kneading against his stomach as he thrusts.");
		output("\n\nAfter he’s finished and withdraws from you, you spend a long minute gathering your breath, enjoying the feeling of each other’s bodies and the sticky humidity, the hissing steam continuing to billow around you indifferently. You’re slightly worried that the young mechanic will be pissed once he’s out of the moment because of the impromptu deception you played on him, but that seems to be the least of his concerns.");
		output("\n\n<i>“That was - uh. Wow.”</i> Something occurs to him which deflates the huge, gleeful grin he’s radiating at you. <i>“Was it all right for you? You didn’t... I mean...”</i> It was pretty good sex coming from a startled novice of a college kid, but no, you didn’t orgasm; you feel reamed but still needy, the hot weight which has built up in your loins untapped. You stroke his arms and tell him soothingly that he did fine, but perhaps if you do this again, he could locate some lube first?");
		output("\n\n<i>“Yeah! There will be another time, right? I mean, yeah, I can do that. Find some, I mean. Probably.”</i> You laugh; his good natured awkwardness fits his lanky physique perfectly somehow. You give him a bit more of a cuddle before putting your clothes on and leaving the scrapyard through the back. Although you’re more than a bit damp, the hot sun will quickly take care of that.");
		pc.loadInAss(chars["GEOFF"]);
		pc.lustRaw += 25;
	}
	//Female:
	else if(pc.hasVagina() && !pc.hasCock()) {
		output("\n\nIt’s quite pleasant being weighed, unfurled and mapped out like this, and [pc.eachVagina] is already softened and beading with moisture when Geoff slides his hand down your [pc.butt] and touches it with the tips of his fingers. He traces the periphery of your wet opening backwards, and as you wet from the delicious sensation he sinks first one and then two fingers into you, stroking the sensitive entrance of your tunnel as he tests you.");
		output("\n\n<i>“You know,”</i> he murmurs into your ear as your breath comes quicker, <i>“I’m kinda surprised you aren’t, you know, packing down there.");
		if(pc.isFeminine()) output(" You hear these crazy stories about girls on the frontier... not that you.");
		output(" Uh. I don’t mean to say that. It’s not that you’re-”</i> you silently tell him to let his body do the talking for a while by putting a finger on his lips. He grins and moves into you, pushing you up against the wall");
		if(pc.hasClit()) output(" as his fingers drift onto your [pc.clit] and begins to circle it,");
		output(" working with greater intent now. You move your hands down from his face to do some exploring of your own, enjoying the pockets of softness to be found upon his frame here and there, ameliorating his firm, bony form. He groans softly as, grinning, your hand slides into his pants and finds his hardening, sturdy six inch prick. You move your hand over and around his length before focusing on his frenulum, stroking it gently whilst he continues to frig you");
		if(pc.hasClit()) output(", bending fingers into you as he flicks your [pc.oneClit] insistently with his thumb");
		output(" until your juices are leaking down your [pc.butt].");
	}
	else {
		output("\n\nIt’s quite pleasant being weighed, unfurled and mapped out like this, and [pc.eachVagina] is already softened and beading with moisture when Geoff slides his hand down your [pc.butt] and touches it with the tips of his fingers. He pauses slightly when he slips your underclothes down and your [pc.cocks] spring");
		if(pc.cockTotal() == 1) output("s");
		output(" upwards to greet him, however he doesn’t look all that surprised.");
		
		output("\n\n<i>“You wouldn’t believe the number of girls on Sigius VI looking to come out here who were talking about getting one of those,”</i> he says in an undertone, as he gently fingers your outer lips. <i>“Getting the whole experience, or something. I don’t think I’d be brave enough.”</i> Small veins of pleasure coursing up from your female sex with his movements, you tell him insistently to concentrate on what he’s doing. He grins and moves into you, pushing you up against the wall");
		if(pc.hasClit()) output(" as his fingers drift onto [pc.oneClit] and begins to circle it");
		output(", working with greater intent now. He traces the periphery of your wet opening tracing the periphery backwards and forwards, and as you wet from the delicious sensation he sinks first one and then two fingers into you, stroking the sensitive entrance of your tunnel as he tests you. Panting slightly now, you move your hands down from his face to do some exploring of your own, enjoying the pockets of softness to be found upon his frame here and there, ameliorating his firm, bony form. He groans softly as, grinning, your hand slides into his pants and finds his hardening, sturdy six inch prick. You move your hand over and around his length before focusing on his raphe, stroking it gently whilst he continues to frig you");
		if(pc.hasClit()) output(", bending fingers into you as he flicks [pc.oneClit] insistently with his thumb");
		output(" until your juices are leaking down your [pc.butt]. [pc.EachCock] hardens and bulges to the sensations inundating your female sex.");
	}
	if(pc.hasVagina()) {
		output("\n\nYou play with each other, each working the other into a furious lather until at last Geoff can’t take it anymore. He unfastens his belt and lets his faded jeans fall as he pushes into you, using his tight mass to push you against the wall, and you can’t help but cry out as he penetrates you in one go, his head pushing you wide before surging into your wet tunnel. The humidity and your own arousal make the sex liquid, his dick encountering barely any resistance as he rubs and fills you, and he almost immediately begins to fuck you with a frenetic eagerness, pushing you firmly into the wall as he thrusts his unyielding, lean hips into your softness, the flat lake of his stomach batting into your own. You thrust back into him, squeezing him with your [pc.hips], the wetness and pleasure you feel urging you to try and make him pound you even harder. When he tenses up moments later, gasping to your movements and clutching your back, you feel a sudden wish you hadn’t excited him as much as you have; he is pretty young, after all.");
		pc.cuntChange(0,geoff.biggestCockVolume());
		output("\n\nGeoff manages to pull himself back from the brink however, and after gathering his breath for a few moments, carries on at a more sedate, sensual pace, holding your [pc.butt] tight as he brings himself out until only his head is inside you before sighing and pushing all the way inside again. As he slides in and out of you he sends one hand roaming up your front, touching your chin for a second before drifting downward, cupping your [pc.chest] for a long moment before placing his fingertips on your nipples. ");
		
		//Cunt nips: 
		if(pc.hasFuckableNipples()) output("He circles the pink fringes of one of your cunt nipples as he continues to push in and out of you, before sliding a finger into its soft, wet hole. You gasp at the intense double sensation of being penetrated doubly, dick and hands rubbing insistently upon the most sensitive parts of your anatomy.");
		else if(pc.hasDickNipples()) output("He circles each slowly and then pauses, dumbfounded, as your prick teats push uncontrollably outwards from the pleasurable stimulation.\n\n<i>“Man, you are full of surprises, aren’t you?”</i> he mutters, and you laugh despite yourself. He’s too into it to stop now, and a moment later he goes back to pushing in and out of you, circling the base of your subsidiary dicks enough for them to swell with arousal, making you gasp with the intense double sensation, before sliding his hand down your stomach.");
		//Normal nips:
		else output("He circles each slowly as he continues to push in and out of you, before shifting his thumb over your sensitive nubs until they are straining outwards and you are gasping from the intense double sensation of his dick and hands rubbing insistently over the most sensitive parts of your anatomy.");
		
		output("\n\nPanting now, you use the wall against your back to thrust back against him, wringing his dick, and as he responds by clutching you hard and thrusting into you hard enough for his tight balls to bat into your [pc.butt], and falling uncontrollably now towards your O, you respond by wrapping your [pc.hips] around his thin waist and squeezing hard. You cry out as you orgasm, your tunnel seizing and spurting juices deliriously around his hard meat.");
		//Herm:
		if(pc.hasCock()) output(" [pc.EachCock], bumped and ground between you, responds to the pleasure gripping your body by surging to climax as well, spurting ropes of cum onto your groin and belly.");
		
		output("\n\nYour thrashing is too much for Geoff and with a series of ragged gasps he cums seconds later, his firm stomach and clenching balls battering into you as he fills you with wet, white warmth. Sweat and moisture mingle and drip off you both as you clutch at his back and ride it out together.");
		
		output("\n\nAfter he’s finished and withdraws from you, you spend a long minute gathering your breath, enjoying the feeling of each other’s bodies and the sticky humidity, the hissing steam continuing to billow around you diffidently.");
		output("\n\n<i>“That was - uh. Wow,”</i> says Geoff eventually. Something occurs to him which deflates the huge, gleeful grin he’s radiating at you. <i>“Was it all right for you? I never know if... I mean...”</i> You laugh - his good natured awkwardness fits his lanky physique perfectly somehow. You tell him he did fine. Honestly, for a college kid he <i>is</i> pretty good with his hands. You give him a bit more of a cuddle before putting your clothes on and leaving the scrapyard through the back. Although you’re more than a bit damp, the hot sun will quickly take care of that.");
		pc.loadInCunt(chars["GEOFF"], 0);
		pc.orgasm();
	}

	flags["SEXED_GEOFF"] = 1;
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
		output("\n\nHe moves his hands with care but sureness, shifting his warm grasp to your arms, your ribs, your stomach as he disrobes you - although he’s done this before now he doesn’t seem to lose any will to explore and measure you like this. Although he’s wiped his hands clean, the grease he works with every day is ingrained into his whorls, allowing them to move with less friction than they normally would, the oil and moisture turning his grip into a warm glissade that is gently taking your clothes off. You sigh as he brushes your sensitive [pc.nipples], ");
		if(!pc.hasFuckableNipples()) output("hardening");
		else output("moistening");
		output(" eagerly with just the barest of touches.");
		output("\n\nIt’s quite pleasant being weighed, unfurled and mapped out like this, and [pc.eachVagina] is already softened and beading with moisture when Geoff slides his hand down your [pc.butt] and touches it with the tips of his fingers. He strokes your outer lips gently, tracing the periphery backwards and forwards, and as you grow wet from the delicious sensation he sinks first one and then two fingers into you, stroking the sensitive entrance of your tunnel as he tests you.");
		
		output("\n\nHe moves into you as you begin to pant slightly, pushing you up against the wall");
		if(pc.hasClit()) output(" as his fingers drift onto [pc.eachClit] and begins to circle it");
		output(", working with greater intent now. You move your hands down from his face to do some exploring of your own, enjoying the pockets of softness to be found upon his frame here and there, ameliorating his firm, bony form. He groans softly as, grinning, your hand slides into his pants and finds his hardening, sturdy six inch prick. You move your hand over and around his length before focusing on his sternum, stroking it gently whilst he continues to frig you");
		if(pc.hasClit()) output(", bending fingers into you as he flicks your [pc.eachClit] insistently with his thumb");
		output(" until your juices are leaking down your [pc.butt].");
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
		
		output("\n\n<i>“That was - uh. Wow,”</i> says Geoff eventually. Something occurs to him which deflates the huge, gleeful grin he’s radiating at you. <i>“Was it alright for you? I never know if... I mean...”</i> You laugh, and ask him exactly how many times are you going to need to tell him he does fine. You do come back, after all. You give him a bit more of a cuddle before putting your clothes on and leaving the scrapyard through the back. Although you’re more than a bit damp, the hot sun will quickly take care of that.");
		pc.loadInCunt(chars["GEOFF"],0);
	}
	//Male first repeat:
	else if(flags["GEOFF_FUCKED_DUDES_TWICE"] == undefined) {
		flags["GEOFF_FUCKED_DUDES_TWICE"] = 1;
		output("\n\n<i>“I thought about what you said,”</i> says Geoff, as he leads you back into the billowing heat and moisture of the garage. The robot is still hard at work back here, and you catch yourself wondering if Geoff keeps it on now deliberately to maintain the sauna-like atmosphere it generates. <i>“I was going to ask around the Mead Hall about good lubrication, but...“</i> He lets the embarrassed silence finish the sentence. He lets go of your hand to rummage around in a large tool case. <i>“But, uh. I go to a few gear-head forums on the extranet, and there’s this rumour... I dunno if it’s true or not, but...”</i> he straightens up and, with a grin, brandishes a large blue tube of - you squint - ‘Blastrol Ship Oil 5000’.");
		output("\n\n<i>“It’s not the really hardcore stuff you use for ship engines. You want the 4000 series or Vulvoline for that,”</i> says Geoff with authority. As long as he’s talking about machines and not sex with you, he’s got all the confidence in the world. <i>“This is the stuff you use to make sure the parts of the ship the crew are likely to come into contact with are protected from wear and move smoothly - doors, monitor casing, that kind of thing. Because of that it’s supposed to be, uh. Kind to the skin. As well as smooth. I know it smells quite nice,”</i> he finishes lamely, bouncing the tube against his narrow thigh as if he’s half-convinced himself this was a dumb idea. You laugh - there’s no way industrial space grease would make for a good lubricant, surely? You find yourself weirdly flattered he put any amount of thought into it, though. You slide your arms around him reassuringly and say, why not? What’s the worst that c... well, you’d like to try anyway.");
		
		output("\n\nGiven courage by your approval, Geoff grins back at you shyly and then bends into you, backing you up slowly towards the wall as he begins to explore your body afresh, moving his strong hands down you as he begins to unfurl you. Moisture beads upon your skin as he finally presses you into a free space on the wall, his gleeful grin replaced by an expression of concentration as he slides his hands over your skin, his breath coming heavier as he begins to remove your clothing and his fingers come into contact with the warmer, softer parts of your body. You smile, hang your arms around his skinny shoulders, and let him do the work.");
		
		output("\n\nHe moves his hands with care but sureness, shifting his warm grasp to your arms, your ribs, your stomach");
		if(!pc.isNude()) output(" as he disrobes you");
		output(" - although he’s done this before now he doesn’t seem to lose any will to explore and measure you like this. He’s wiped his hands clean of the grease he works with every day but it’s ingrained into his whorls, allowing them to move with less friction than they normally would, the oil and moisture turning his grip into a warm glissade that is gently taking your clothes off. You sigh as he brushes your sensitive nipples, ");
		if(pc.hasFuckableNipples()) output("moistening");
		else output("hardening");
		output(" eagerly with just the barest of touches. You wriggle, letting the sinuous movements of your girl-boy body drop your underclothes away at the same time as pushing your flesh more firmly into his hands, before moving your own down his body.");
		
		output("\n\nYou move your hands downwards, enjoying the pockets of softness to be found upon his frame here and there, ameliorating his firm, bony form. He groans softly as your hand slides into his pants and finds his hardening, sturdy six inch prick. You grin as you move your hand over and around his prick before focusing on his sternum, stroking it gently until he is straining.");
		output("\n\nAll reservations replaced by pulsing need, Geoff almost completely forgets his agonized preparations, and has already hooked his belt and faded jeans off when he remembers. Hampered by his own burgeoning erection, he retrieves the blue tube from across the room and unloads some of its contents onto his palm. It is a golden color and has the consistency of shampoo, quickly oozing off his hands to dollop onto the floor. Blushing deeply, he holds your gaze as he lets his boxers fall and massages some into his stiff, unpretentiously human length.");
		output("\n\n<i>“Feels warm,”</i> he murmurs. <i>“Would you like some?”</i> You take the tube off him and, with exaggerated slowness, squeeze and swirl it over your hand until it’s dripping trails of the honey colored stuff. You give him the doe eyes as you turn, displaying your [pc.butt] to him as you press your oozing fingers against your [pc.asshole], closing your eyes and moaning softly as you penetrate yourself. He’s right - the stuff is warm and coating, smelling rather like ginger with a slight, high solvent edge. You push your fingers in up to the base, sighing as you slather your sensitive passage in warmth.");
		output("\n\nHis overwhelming need restored by your wanton show, Geoff moves into you, his straining, oily dick sliding through your butt cheeks and pressing urgently against your back. Grinning, you turn and put your arms around his neck - looking at his face as he goes about you is at least half of the fun on offer here. His ragged breath is harsh upon your face as he pushes into you, using his tight mass to push you against the wall, his hands forming around your [pc.butt] and he rolls your hips so your [pc.asshole] faces outwards. He squeezes your ass and you laugh as you stroke his nape and fuzzy hair; clearly there’s at least one part of your body he’s reasonably assured about. You close your eyes as you feel his bulging hardness press against your sphincter before he penetrates you slowly.");
		pc.buttChange(geoff.biggestCockVolume());
		
		output("\n\nThis is much better. His un-lubed head pushing you wide is intense as ever, but the coating oil bonding the two of you together makes it far easier, far more pleasurable. He gasps, almost laughing, at how easy it is to slide his hard length into you, and you clutch your back as he fills more and more of you, stopping only when his balls bump into your [pc.butt]. He stops there for a moment, and then slowly withdraws to the head before with a sigh pushing irresistibly in again, thrusting into each time with a bit more power, fucking you with long, sure strokes. He rubs your oiled yet tender tunnel and pushes against your prostate and goddamn... you can’t help moan into his shoulder, your own dick straining between you, trying to force him to go faster.");
		output("\n\nHe doesn’t, but he does begin to move his hands again. He first focuses his attention upon your lips - using one hand to support you he uses his other set of fingers to circle them for a while before moving downwards, touching your chin before falling upon your nipples.");
		//Cunt nips:
		if(pc.hasFuckableNipples()) output(" He circles the pink fringes of one of your fuckably slick nipples as he continues to push in and out of you, before sliding a finger into its soft, wet hole. You gasp at the intense double sensation of being penetrated doubly, dick and hands rubbing insistently upon the most sensitive parts of your anatomy.");
		//Dick nips: 
		else if(pc.hasDickNipples()) output(" He circles each slowly and then pauses, dumbfounded, as your prick teats push uncontrollably outwards from the pleasurable stimulation.\n\n<i>“Man, I am never gonna get used to that,”</i> he mutters, and you laugh despite yourself. He’s too into it to stop now, and a moment later he goes back to pushing in and out of you, circling the base of your subsidiary dicks enough for them to swell with arousal, making you gasp with the intense double sensation, before sliding his hand down your stomach.");
		//Normal nips:
		else output(" He circles each slowly as he continues to push in and out of you, before shifting his thumb over your sensitive nubs until they are straining outwards and you are gasping from the intense double sensation of his dick and hands rubbing insistently over the most sensitive parts of your anatomy.");
		
		output("\n\nPanting now, you use the wall against your back to thrust back against him, squeezing at his dick, and as he responds by clutching you hard and thrusting into you hard enough for his tight balls to bat into your [pc.butt], pounding you now. Pinprick stars beginning to float in your eyes, you feel yourself being pushed uncontrollably upwards and unable to help yourself you wrap your [pc.hips] around his thin waist and squeeze hard, crying out as you cum. You buck against him as you spurt line after line of jizz against both him and yourself. It’s too much for your partner and with a series of ragged gasps he orgasms seconds later, his firm stomach and clenching balls battering into you as he fills you with wet, white warmth. Sweat and moisture mingle and drip off you both as you clutch at his back and continue to squeeze at him, forcing him to ride his orgasm on you, [pc.eachCock] kneading against his stomach as he thrusts.");
		
		output("\n\nAfter he’s finished and withdraws from you, you spend a long minute gathering your breath, enjoying the feeling of each other’s bodies and the sticky humidity, the hissing steam continuing to billow around you indifferently. After you’ve come back to Terra a bit you smile at him and say, <i>“well, that was a bit better, wasn’t it?”</i>");
		
		output("\n\n<i>“J-just a bit. Wow.”</i> You cannot help but laugh at the huge, gleeful grin he’s radiating at you. You have to admit, for a kid fresh out of college, he is pretty good with his hands. You give him a bit more of a cuddle before putting your clothes on and leaving the scrapyard through the back. Although you’re more than a bit damp, the hot sun will quickly take care of that.");
		pc.loadInAss(chars["GEOFF"]);
	}
	else {
		output("\n\nAs soon as you’re in the back area and the hissing steam has encompassed you, Geoff heads straight for his storage cabinet. You look over his shoulder as he opens and laugh - it’s packed to the brim with blue tubes. He turns and shrugs with smiling embarrassment when he sees you looking.");
		output("\n\n<i>“Well... it is pretty useful stuff.”</i> Still grinning shyly, he slides his arms around you, backing you up slowly towards the wall as he begins to explore your body afresh, moving his strong hands down you as he begins to unfurl you. Moisture beads upon your skin as he finally presses you into a free space on the wall, his smile replaced by an expression of concentration as he slides his hands over your skin, his breath coming heavier as he begins to remove your clothing and his fingers come into contact with the warmer, softer parts of your body. You smile, hang your arms around his skinny shoulders, and let him do the work.");
		output("\n\nHe moves his hands with care but sureness, shifting his warm grasp to your arms, your ribs, your stomach as he disrobes you - although he’s done this before now he doesn’t seem to lose any will to explore and measure you like this. He’s wiped his hands clean of the grease he works with every day but it’s ingrained into his whorls, allowing them to move with less friction than they normally would, the oil and moisture turning his grip into a warm glissade that is gently taking your clothes off. You sigh as he brushes your sensitive [pc.nipples], ");
		if(!pc.hasFuckableNipples()) output("hardening");
		else output("moistening");
		output(" eagerly with just the barest of touches. You wriggle, letting the sinuous movements of your girl-boy body drop your underclothes away at the same time as pushing your flesh more firmly into his hands, before moving your own down his body.");
		
		output("\n\nYou move your hands downwards, enjoying the pockets of softness to be found upon his frame here and there, ameliorating his firm, bony form. He groans softly as your hand slides into his pants and find his hardening, sturdy six inch prick. You grin as you move your hand over and around his prick before focusing on his sternum, stroking it gently until he is straining.");
		
		output("\n\nAll reservations replaced by pulsing need, Geoff almost completely forgets his preparations, and has already hooked his belt and faded jeans off when he remembers. Hampered by his own burgeoning erection, he retrieves the blue tube from across the room and unloads some of its contents onto his palm. It is a golden color and has the consistency of shampoo, quickly oozing off his hands to dollop onto the floor. Blushing deeply, he holds your gaze as he lets his boxers fall and massages some into his stiff, unpretentiously human length. You take the tube off him and, with exaggerated slowness, squeeze and swirl it over your hand until it’s dripping trails of the honey colored stuff. You give him the doe eyes as you turn, displaying your [pc.butt] to him as you press your oozing fingers against your [pc.asshole], closing your eyes and moaning softly as you penetrate yourself. It always comes as a pleasant surprise just how nice this stuff is - warm and coating, smelling rather like ginger with a slight, high solvent edge. You push your fingers in up to the base, sighing as you slather your sensitive passage in warmth.");
		
		output("\n\nHis overwhelming need restored by your wanton display, Geoff moves into you, his straining, oily dick sliding through your butt cheeks and pressing urgently against your back. Grinning, you turn and put your arms around his neck - looking at his face as he goes about you is at least half of the fun on offer. His ragged breath is harsh upon your face as he pushes into you, using his tight mass to push you against the wall, his hands forming around your [pc.butt] and he rolls your hips so your [pc.asshole] faces outwards. He squeezes your ass and you laugh as you stroke his nape and fuzzy hair - clearly there’s at least one part of your body he’s very assured about. You close your eyes as you feel his bulging hardness press against your sphincter before he penetrates you slowly.");
		pc.buttChange(geoff.biggestCockVolume());
		output("\n\nHis un-lubed head pushing you wide is intense as ever, but the coating oil bonding the two of you together makes it far easier, far more pleasurable. He gasps, almost laughing, at how easy it is to slide his hard length into you, and you clutch your back as he fills more and more of you, stopping only when his balls bump into your [pc.butt]. He stops there for a moment, and then slowly withdraws to the head before with a sigh pushing irresistibly in again, thrusting into each time with a bit more power, fucking you with long, sure strokes. He rubs your oiled yet tender tunnel and pushes against your prostate and goddamn... you can’t help moan into his shoulder, your own dick straining between you, trying to force him to go faster.");
		
		output("\n\nHe doesn’t, but he does begin to move his hands again. He first focuses his attention upon your lips- using one hand to support you he uses his other set of fingers to circle them for a while before moving downwards, touching your chin before falling upon your nipples. ");
		//Cunt nips:
		if(pc.hasFuckableNipples()) output("He circles the pink fringes of one of your cunt nipples as he continues to push in and out of you, before sliding a finger into its soft, wet hole. You gasp at the intense double sensation of being penetrated doubly, dick and hands rubbing insistently upon the most sensitive parts of your anatomy.");
		else if(pc.hasDickNipples()) output("He circles each slowly and then pauses, dumbfounded, as your prick teats push uncontrollably outwards from the pleasurable stimulation.\n\n<i>“Man, I am never gonna get used to that,”</i> he mutters, and you laugh despite yourself. He’s too into it to stop now, and a moment later he goes back to pushing in and out of you, circling the base of your subsidiary dicks enough for them to swell with arousal, making you gasp with the intense double sensation, before sliding his hand down your stomach.");
		//Normal nips:
		else output("He circles each slowly as he continues to push in and out of you, before shifting his thumb over your sensitive nubs until they are straining outwards and you are gasping from the intense double sensation of his dick and hands rubbing insistently over the most sensitive parts of your anatomy.");
		
		output("\n\nPanting now, you use the wall against your back to thrust back against him, squeezing at his dick, and as he responds by clutching you hard and thrusting into you hard enough for his tight balls to bat into your [pc.butt], pounding you now. Pinprick stars beginning to float in your eyes, you feel yourself being pushed uncontrollably upwards and unable to help yourself you wrap your [pc.hips] around his thin waist and squeeze hard, crying out as you cum. You buck against him as you spurt line after line of jizz against both him and yourself. It’s too much for your partner, and with a series of ragged gasps, he orgasms seconds later, his firm stomach and clenching balls battering into you as he fills you with wet, white warmth. Sweat and moisture mingle and drip off you both as you clutch at his back and continue to squeeze at him, forcing him to ride his orgasm on you, [pc.eachCock] kneading against his stomach as he thrusts.");
		
		output("\n\nAfter he’s finished and withdraws from you, you spend a long minute gathering your breath, enjoying the feeling of each other’s bodies and the sticky humidity, the hissing steam continuing to billow around you indifferently. After you’ve come back to Terra a bit you smile at him. There’s no real need to say anything anymore, and you just grin at each other like idiots. You give him a bit more of a cuddle before putting your clothes on and leaving the scrapyard through the back. Although you’re more than a bit damp, the hot sun will quickly take care of that.");
		pc.loadInAss(chars["GEOFF"]);
	}
	if(pc.isFeminine() && flags["SEXED_GEOFF_MASC"] == 1 && flags["SEXED_GEOFF"] == 1) { /* Not sure why this check is here... */ }
	processTime(45+rand(10));
	pc.orgasm();
	geoff.orgasm();
	this.clearMenu();
	this.addButton(0,"Next",mainGameMenu);
}

public function flirtMoreWithGeoff():void
{
	clearOutput();
	author("Foxxling");
	userInterface.showBust("GEOFF_NUDE");
	userInterface.showName("\nGEOFF");

	if (pc.isBro())
	{
		output("You look at Geoff’s lips, those luscious lips that would go perfect on your... everything. The smooth brown skin, the lean musculature and even his long dreads have your body heating up. You watch him as he chatters on while moving around. You don’t pay any attention to what he’s doing, you just rub your crotch as you watch him bend this way and that. When he raises his arms to get something high up you get a good view of his bronzed lower back and the little dimples located there. There is something about the way his ass looks in those faded jeans, the way his soft cock shifts the material as he moves.");
		
		output("\n\n<i>“Uh...”</i> he says, suddenly noticing the way you’re rubbing [pc.eachCock]. You look up at his long, pleasant face and there you see confusion, <i>“What are you doing?”</i>");
		
		output("\n\nTo which you answer, <i>“Thinking about fucking you.”</i>");
		
		output("\n\n<i>“Oh,”</i> is all he says as his lips curl and his head cocks to the side. The look he gives you is one of bewilderment but not disgust... so that’s saying something.");
	}
	if (pc.isNice())
	{
		output("You look at Geoff’s smile, trying to judge if he seriously has no clue what you were talking about. When he begins chattering about his job you come to the only logical conclusion: he doesn’t.");
		
		output("\n\nAs he keeps talking about you watching him work he isn’t even looking at you. He moves around: cleaning, adjusting inventory, organizing tools and being restless in general.");
		
		output("\n\nSo, as he passes, you reach out and take his chin in your hand and say, <i>“Actually, I was trying to let you know that I think you’re cute.”</i>");
		
		output("\n\nHis mouth falls open as his eyebrows raise in a classic expression of complete surprise. Then a smile spreads across his now laughing face as <i>“Thanks”</i> comes from his lips in a rush of air.");
	}
	else if (pc.isAss())
	{
		output("You can’t help but stare at Geoff’s face as he chatters on about... well... nothing. In all honesty you have to admit that you aren’t exactly being forward and the kid is obviously quite naive.");
		
		output("\n\nOnce you’ve grown annoyed with his sudden idiocy you slam your hand into the wall right in front of his face, halting his incessant chatter and restless movement as he jumps out of his skin.");
		
		output("\n\n<i>“Newsflash...”</i> you calmly say, your face an inch from his, <i>“I want to fuck you.”</i>");
		
		output("\n\nHis face screws up in incredulous surprise for a moment before a bark of laughter sends his handsome features into relieved merriment. <i>“Dude you scared me half to death, I thought you were going to hurt me.”</i> He chuckles.");
		
		output("\n\n<i>“Well...”</i> you say with a devilish grin, <i>“I might.”</i> This stops his laughter, but from the way he bites his lip you know he’s turned on.");
	}
	else
	{
		output("You look at Geoff’s lips. Your initial purpose was to try and gauge if he honestly doesn’t know you are flirting with him but it is forgotten when you imagine those lips on your body. As he casually talks about his job you figure he mustn’t know your true intentions. What kind of crazy person would pass up a hot [pc.raceShort] like you?");
		
		output("\n\nSo as the oblivious college student continues talking about junk he moves around: adjusting inventory, organizing tools, cleaning and being restless in general. You can’t help but notice the way his little ass looks in those jeans, the way his soft cock shifts as he moves. You lick your lips as thoughts of making him moan so loud his weirdo uncle blushes stream through your mind.");
		
		output("\n\nWhen he suddenly stops you look up at his face to find his eyes on you. From the way his eyebrows are raised in surprise you know you’ve been caught ogling his goodies. Unabashed and unashamed you let your eyes make one more luxurious round trip before returning to his face.");
		
		output("\n\n<i>“Oh,”</i> is all he says as his lips curl and his head bows in embarrassment.");
	}

	output("\n\n<i>“Well?... I, uh....”</i> Geoff stammers, his hand flying up to muss his hair with a huge embarrassed smile that puts his alabaster teeth on prominent display, <i>“I’ve.. uh... I’ve never... you know... with a guy.”</i> Despite the sheepishness with which he approaches the situation he doesn’t seem closed to the idea.");

	if (pc.isNude())
	{
		output("\n\nHe is, however, regarding [pc.eachCock] with an understandable mixture of excitement and trepidation.");
	}
	else
	{
		output("\n\nHe is, however, looking at your concealed cock");
		if (pc.cocks.length > 1) output("s");
		output(" with an understandable mixture of curiosity and trepidation.");
	}

	flags["SEXED_GEOFF_MASC"] = 1;

	clearMenu();
	if (pc.hasCock()) addButton(0, "Top", dudesTopGeoff, undefined, "Top", "Capitalize on this opportunity and get a taste of Geoff’s virgin ass.");
	else addDisabledButton(0, "Top", "Top", "If you had a cock you could probably take the initiative and fuck Geoff in the ass.")
	if (flags["SEXED_GEOFF"] == undefined) addButton(1, "Bottom", flirtWithGeoff, undefined, "Bottom", "Let Geoff take the reins and do what comes naturally.");
	else addButton(1, "Bottom", GeoffRepeatFuck, undefined, "Bottom", "Let Geoff take the reins and do what comes naturally.");
}

public function dudesTopGeoff():void
{
	if (flags["GEOFF_TOPPED"] == undefined) dudesTopGeoffFirstTime();
	else dudesTopGeoffRepeat();
}

public function dudesTopGeoffFirstTime():void
{
	clearOutput();
	author("Foxxling");
	userInterface.showBust("GEOFF_NUDE");
	userInterface.showName("\nGEOFF");

	flags["GEOFF_TOPPED"] = 1;

	output("You slide your hand into his, and without a word the two of you debunk to the humidity and steam in the back.");
	
	output("\n\n<i>“I told you you wouldn’t gain anything spiritual talking to him...”</i> a reedy, sighing voice follows you out.");
	
	output("\n\nThe back lot is a sprawling, open-air garage-like area, dominated by a stationary robot wrapping a large hovercraft in cleansing steam. The hissing will certainly mask any noise either of you might make. Feeling increasingly eager you deliberately press yourself into the young mechanic, feeling his tight, firm flesh warm against you. He chuckles at this, holding on to you for balance as your unexpected advanced almost knocks him over. You take the opportunity to reach down and get a good grip of his ass; the unexpected contact causes him to flinch.");

	if (pc.isBro())
	{
		output("\n\nHis ass is soft as you spread his cheeks through his pants. You lick, kiss and suckle his neck as you grab and grope the virgin’s ass; you can’t help but feel excited about fucking it soon. He fidgets under your hungry fingers.");
	}
	if (pc.isNice())
	{
		output("\n\nDespite the pleasantly surprised smile on his face you can tell the guy is a little nervous about taking a dick for the first time. You take the time to gently rub his ass and kiss his neck to show him you’re capable of taking your time. He is suddenly putty in your hands.");
	}
	else if (pc.isMischievous())
	{
		output("\n\nThe guy is obviously nervous. In response you grope his ass and kiss his neck in an attempt to get him into the mood. It works, somewhat, although from the way he begins to grind forward you suspect he’d rather be in your position.");
	}
	else if (pc.isAss())
	{
		output("\n\nThe guy is obviously nervous. Ignoring this you grab his ass possessively, indicating that you are in charge. As you push your hips forward and pull him into you you kiss his neck, causing him to groan.");
	}

	output("\n\nThe garage is shielded from the worst of the hot sun by a metal roof, but sunlight still stubbornly pushes through its grimy skylights. Geoff’s long fingertips begin to explore your body, growing more bold as the two of you continue to make out. He makes sure to rub your [pc.ass], possibly wondering what happened that he isn’t going to get the chance to be the one doing the fucking this time. The humidity couples with the haze of water in the air to give the place a sauna-like atmosphere, despite the smell of oil and machines in the air. Moisture begins to bead against your skin as you take Geoff by his slender waist and silently indicate that its time for the back door virgin to turn around, which he does with a minimal amount of hesitation.");
	
	output("\n\nSo you press Geoff into a free space on the wall, his nervous grin replaced by an expression of slight apprehension as he does his best to poke what little ass he has out for you. The position is a little awkward until you push that weird bend out of his back, making him toot his little ass up the right way. Biting your lip you rub your [pc.cocksLight] against his still clothed backside. He trembles as you grind against him for a second. His deep breaths become ragged huffs as you begin to tug at his clothes. At first he tries to help you disrobe him but all it takes is for you to simply say, <i>“Let me”</i> to get him to stop.");
	
	output("\n\nYour hands rub his thin body as you slide his shirt up, his nipples becoming erect as your fingers graze them. When the simple fabric gets tangled in his dreads you both can’t help releasing a quick chuckle as his hands rise to help you. Once the shirt is gone you slide your hands across every inch of his exposed upper half, enjoying the pockets of softness you find here and there before kissing the area between neck and shoulder. Then your hands glide down his warm body to the front of his pants, which fall as soon as they are undone. You take his slim waist and pull his cute little round rump back until your [pc.cock] slides up his hot crack. With your [pc.chest] resting against his back you grind against him, enjoying the softness of his cute little butt.");
	
	output("\n\nThen you begin pulling off your [pc.gear]. Geoff watches you intently, lip bitten as he waits for you to finish.");
	
	output("\n\nHe looks down at [pc.eachCock], his expression thoughtful. <i>“I can’t believe I’m doing this with a dude.”</i> His eyes widen as he looks up. <i>“Uh... I mean... Not that you aren’t... What I mean to say is....”</i>");
	
	output("\n\nAs he stammers to clarify himself you step forward and shush softly into his ear. He nods, and after gulping back the desire to say something more, he takes the initiative and reaches down to stroke your erection.");

	var tCock:int = pc.cockThatFits(geoff.analCapacity());
	if (tCock == -1) tCock = pc.smallestCockIndex();
	var tLength:Number = pc.cocks[tCock].cLength();

	if (tLength < 6)
	{
		output("\n\nHe handles your [pc.cock " + tCock + "] with ease, grinning from ear to ear as his warm hands cause you to shudder. <i>“This won’t be so bad,”</i> he says as he continues to massage your [pc.cockNounComplex " + tCock + "]");
	}
	else if (tLength < 7)
	{
		output("\n\nHe handles your [pc.cock " + tCock + "] with ease, grinning from ear to ear as his warm hands softly jerk your dick. <i>“Well...”</i> he says as he rubs his thumb across your [pc.cockHead " + tCock + "] to collect your pre, <i>“I guess I should at least be able to take a dick that’s as big as my own... right?”</i>");

		output("\n\nYou nod, that seems more than reasonable.");
	}
	else if (tLength < 8)
	{
		output("\n\nHe looks at your [pc.cock " + tCock + "] with a furrowed brow. Then he looks up. <i>“It’s... big,”</i> is all he says as he squeezes your cock. He lifts it and flattens his palm, almost as if trying to gauge its weight.");

		output("\n\nYou ask him if he is having second thoughts.");

		output("\n\nHe looks into your [pc.eyes] and smiles. <i>“Well... not really. I should be able to handle it... I think... I hope.”</i>");
	}
	else
	{
		output("\n\nHe gawks as he handles your [pc.cock " + tCock + "], his head tilting to the side as if to get a better view. <i>“Is this even going to fit?”</i> he says, his warm hand, slickened by the humidity, still massaging your cock as he complains. <i>“I mean, does it even really need to be this big?”</i>");
		
		output("\n\nYou ask him if he’s having second thoughts.");
		
		output("\n\nHe avoids your gaze as he says, <i>“Yes... but, I guess. I mean, I can try at least... right?”</i> You don’t answer, you simply grin, feeling relieved that your size hasn’t completely scared the virgin off.");
	}

	output("\n\nWhen you twirl your fingers, he drops your [pc.cock " + tCock +"] and turns around. Geoff releases a soft groan as you lift his dreadlocks and begin to plant a trail of wet kisses down his neck. You rub your [pc.cockNounSimple " + tCock + "] against his ass, hotdogging his smooth virginal entrance.");
	
	output("\n\n<i>“Mmmmm,”</i> you breathe into his ear as one hand slides from his slender waist to his semi-hard six-inch cock. The moment you wrap your hand around it you hear a sharp gasp and feel him back his soft cheeks up into you. The hand that isn’t rubbing his now-leaking cock roves his body, massaging his flesh and occasionally tweaking his hard nipples. He reaches back, rubbing your [pc.legs] as he squeezes his tight little ass against your [pc.cock]. When you lean in to taste him he tastes you, a wet tongue tunneling into your [pc.ear] as you kiss his trapezius.");
	
	output("\n\nThe two of you continue to touch and tease, each working the other into a furious lather until at last you can’t take it anymore. You reach down and take your [pc.cock] in hand.");
	if (!pc.cocks[tCock].hasFlag(GLOBAL.FLAG_LUBRICATED)) output(" In the absence of synthetic or biological lubricant you work up a good glob of spit and open your [pc.lips] to let it fall to your [pc.cockHead " + tCock + "].");
	output(" Tightening your grip, you press your cockhead against his winking entrance.");

	if (tLength < 6)
	{
		output("\n\nHe grunts as you increase the pressure on his virginal back door, using your weight to keep him pinned to the wall. When your [pc.cock " + tCock +"] pops into him he actually growls.");
		pc.cockChange();
		geoff.buttChange(pc.cockVolume(tCock));
		output("\n\n<i>“I’m good, I’m gooood,”</i> he says, talking more to himself than he is to you. The humidity and lubricant help to make the sex liquid. Your [pc.cockHead " + tCock + "] is able to slide through the squeezing tunnel with relative ease. As you gently work yourself in and out of him his breath rushes out out, accompanied by an almost musical note of pleasure. Now that he can handle it, you begin to eagerly fuck his tight ass and he takes every inch you have to offer and you fuck him hard against the wall.");
	}
	else if (tLength < 8)
	{
		output("\n\nHe growls as you increase the pressure on his little virgin back door, using your weight to keep him pinned against the wall. It takes a little effort, but thanks to your lube you find yourself sliding into his hot untouched rectal tunnel.");
		pc.cockChange();
		geoff.buttChange(pc.cockVolume(tCock));
		output("\n\n<i>“Shiiiiiit!”</i> he snaps as you split him open. Your [pc.cockHead " + tCock + "] is able to slide halfway into the uncooperative anal passage. When you try to continue Geoff yelps, his hands flying down to your [pc.thighs] in an attempt to slow your advance. His back bends at an odd angle as he squirms, each involuntary motion an attempt to dislodge your [pc.cockNounSimple " + tCock + "]. You have to hold tight onto him in order to stay inside. Soon enough he has given up trying to dance away from the pressure of your dick filling his ass you steady yourself.");
		
		output("\n\n<i>“It feels weeeiiiird,”</i> he complains. You take a moment to massage the odd hump out of his back, telling him he’ll get used to the sensation if he just sticks with it. Then you move and he releases a sharp gasp as you completely hilt him, holding your full [pc.cockNounComplex " + tCock + "] inside his quivering anal sleeve.");
		
		output("\n\n<i>“Relax,”</i> you whisper into his ear as you press him full against the wall. He nods to the wall and presses back, legs tensed for what is to come. Good thing too, because the slickness of his lubed passage combined with the milking sensation caused by the flexing of his rectal muscles is making you crazy. Try as you might there is little you can do to stop your [pc.legs] from shoving the full length of your hard cock into the virgin. So if he isn’t ready, he better get ready because the tempo of your thrusts is slowly increasing. Soon your ass-slapping thrusts have fucked Geoff flat against the wall where he howls and groans, each sound dripping with equal shares of pleasure and pain. The sounds of pain soon die off, replaced with sexy groans of pure ecstasy. He even pushes back against your thrusts, giving you deeper access as he finally gets into the swing of things.");
	}
	else
	{
		output("\n\nHe whines as you increase the pressure on his little virgin back door, using your weight to keep him pinned against the wall. It is hard work penetrating a virgin with a cock as big as yours but with equal measures patience, persistence and spit you find the uncooperative opening grudgingly allowing your [pc.cockNounComplex " + tCock +"] access.");
		pc.cockChange();
		geoff.buttChange(pc.cockVolume(tCock));
		output("\n\n<i>“FUCK!”</i> Geoff curses to the heavens as you stretch his virgin hole wide. Your [pc.cockHead " + tCock +"] is barely able to make headway due to the crushing tightness of his rectal sleeve. His hands grab your [pc.thighs] as he tries to squirm away from the intense pressure of your hot cock spearing his insides. Thanks to the wall and your hands you manage to stay inside him, allowing him to adjust and experiment until he becomes comfortable. His back is bent at an odd angle but he has stopped trying to dislodge so that’s something at least. You begin the slow work of massaging that fucking hump out of his back while whispering soft affirmations of how good he is doing into his ear.");
		
		output("\n\n<i>“Ouch,”</i> he jests, a soft single word dropped in a deep voiced whisper. You tell him he’ll get used to it as you feed more dick into his brown buns.");
		
		output("\n\n<i>“Uggghhhh,”</i> he goes as he forces himself to remain in place while you rearrange his bowels. Its slow work but the sounds he keeps making more than make up for the pace.");
		
		output("\n\n<i>“Very good,”</i> you whisper into his ear once you’ve somehow managed to fully submerge your [pc.cock " + tCock +"] in his tight back door. He looks back, his face covered in sweat and wearing a pained expression, and tries to smile. You force yourself to stay here with your cock being so tightly gripped by his cute ass. Tension travels through his back in a visible ripple of contorting muscle and yet he holds himself on your dick.");
		
		output("\n\nHe grunts as you begin moving through him. His legs suddenly go straight, forcing you to wrap your arms around his slim waist. He clutches at your arms, his body twisting against you as you begin to really fuck. The tempo of your thrusts increases with every thrust until your trunk is slapping against his bare butt. He howls in a voice fueled by both pleasure and pain as you take him. Yet as you continue to batter his back door with your long dick the pain slowly leaves his voice, replaced by groans of pure ecstasy. Your [pc.cockNounSimple " + tCock +"] feels like it’s in heaven as you force it in and out of Geoff’s hot hole, relishing in the amazing tightness as you fuck the now ex-virgin with jackhammer intensity.");
	}

	output("\n\nYou roughly pound him, listening to those sexy sounds he makes as you fuck him into the wall. Then he is throwing his brown ass back against the [pc.skinFurScales] of your trunk as he fucks himself on your dick. So you sit back as he explores the urge to be fucked, his asshole wringing your dick as his soft ass bounces against your thighs. He makes the sexiest noises as he fucks himself on your dick and soon the way he is fucking your cock pushes you over the edge.");
	
	output("\n\nWith a deep groan that reverberates in your chest your [pc.cock] explodes. [pc.Cum] violently fires from you as your sudden ejaculation causes you to fully hilt Geoff and hold, forcing him flat against the wall once more. You hold him close as his fluttering rectal cavity milks you of every drop of your [pc.cumColor] seed.");
	
	output("\n\nOnce your orgasm has subsided you withdraw from him and collapse, angling your body towards a low metallic wall you decide to use as a seat. Geoff simple crumples to the floor, the [pc.cumVisc] mess of your orgasm falling from his wrecked hole. It takes a second for the two of you to catch your respective breaths as the hissing steam continues to billow around you.");
	
	output("\n\nGeoff stands first and looks over at you. <i>“I... uh... was I good? I mean, you came but... like...”</i> You interrupt him, telling him it was great. Then you laugh - his good-natured awkwardness fits his lanky physique perfectly somehow. You rise and give him a quick peck on the lips before grabbing your [pc.gear] and leaving the scrapyard through the back. Although you find yourself more than a bit damp from the physical exertion and sauna-like atmosphere, the hot sun will quickly take care of that.");

	processTime(45+rand(10));
	pc.orgasm();
	geoff.orgasm();
	this.clearMenu();
	this.addButton(0,"Next",mainGameMenu);
}

public function dudesTopGeoffRepeat():void
{
	clearOutput();
	author("Foxxling");
	userInterface.showBust("GEOFF_NUDE");
	userInterface.showName("\nGEOFF");

	if (flags["GEOFF_TOPPED"] == 1)
	{
		flags["GEOFF_TOPPED"] = 2;
	
		output("Geoff smiles when you ask him if he wants to go out back again. <i>“Alright,”</i> he says. <i>“But this time I’m ready for you.”</i>");

		if (pc.isBro() || pc.isBimbo())
		{
			output("\n\n<i>“Gee I sure hope so! Virgins is nice but there’s something about putting mah dick in a guy who knows how to take it that really gets my gears goin!”</i>");
			
			output("\n\nHe does this cute little eye roll and turns around. When you slap his ass he releases this weird chuckle.");
		}
		else if (pc.isNice())
		{
			output("\n\n<i>“Oh really?”</i> you say, [pc.lips] spreading into a grin before you ask him if he’s been practicing.");
			
			output("\n\nThat’s when he gets all embarrassed again. <i>“Well... kind of? Like when I’m... you know... by myself I play with it now, sometimes. Its like... I don’t know. I didn’t know it could feel good before... you know.”</i> He chuckles at the end. Then you notice the soft mound of his bulge lengthening in his faded jeans and decide its time to get this road on the show.");
			
			output("\n\nSo you glance at the back door than at Geoff himself. <i>“Well... lets go make you feel good again.”</i>");
		}
		else if (pc.isMischievous())
		{
		
			output("\n\n<i>“Are you now?”</i> you say. Before he can say much else you shove him up against the counter and kiss him deeply. Your hands explore his body once again, caressing his tall form and pulling him against you body, exciting him until you feel his hard terran cock pressing against yours. Your lips grind against him as you hold the lanky boy against you. Then you pull back and for a moment he looks dazed.");
			
			output("\n\n<i>“Were you ready for that?”</i> you say, teeth bared in a mischievous smile. He grins sheepishly as he shakes his head. He chuckles as he disentangles himself from your arms and heads towards the backdoor.");
		}
		else if (pc.isAss())
		{
			output("\n\n<i>“I’ll be the judge of that,”</i> you say as you fix Geoff with a cold stare. Despite the big smile on his face he visibly cringes under your gaze. You point your gaze at the back door and then look him in the face.");
			
			output("\n\n<i>“Oh... yeah... right.”</i> He says as he rushes towards the back door.");
		}
	}
	
	output("\n\nGeoff leads you out of the shop and to the usual spot where the garage is shielded from the worst of the hot sun by an old metal roof. Once the two of you are there Geoff takes the initiative and wraps his long arms around your waist, pulling you into a kiss. As your [pc.lips] move against his his hands begin to explore your body, growing more bold as the two of you continue to make out. He makes sure to rub your [pc.ass], silently expressing his preference for the position you’ll be taking this bout.");
	
	output("\n\nThen the two of you break apart. Unlike the first time you do not make a ceremony of disrobing and neither does he. You pull your [pc.gear] off and set it aside and when you look up he is shoving his pants toward the ground, his hard brown cock bobbing in the air as he exposes himself to the open air.");
	
	output("\n\nThe planet’s humidity couples with the haze of water in the air to give the place a sauna-like atmosphere, despite the smell of oil and machines in the air. Moisture begins to bead against your skin as you twirl your finger, indicating to Geoff that he should turn around. He bends at the waist, pressing himself chest first against the wall and poking his cute brown ass in your direction.");
	
	output("\n\nYou close the small distance between Geoff and yourself. With a smile you plant a trail of wet kisses down his neck while grinding your [pc.cockNounSimple] against his ass.");
	
	output("\n\n<i>“Mmmmm,”</i> you breathe into his ear as one hand slides from his slender waist to his semi-hard six-inch cock. The moment you wrap your hand around it you hear a sharp gasp and feel him back his soft cheeks up into you. The hand that isn’t rubbing his now-leaking cock roves his body, massaging his flesh and occasionally tweaking his hard nipples. He reaches back, rubbing your [pc.legs] as he squeezes his tight little ass against your [pc.cock].");
	
	output("\n\nThe two of you continue to touch and tease, each working the other into a furious lather until at last you can’t take it anymore. You reach down and take your [pc.cock] in hand.");
	
	var tCock:int = pc.cockThatFits(geoff.analCapacity());
	if (tCock == -1) tCock = pc.smallestCockIndex();
	var tLength:Number = pc.cocks[tCock].cLength();

	//if (pc.cock =/= self lubing):
	if(!pc.cocks[tCock].hasFlag(GLOBAL.FLAG_LUBRICATED)) output(" In the absence of synthetic or biological lubricant you work up a good glob of spit and open your [pc.lips] to let it fall to your [pc.cockHead].");
	output(" Tightening your grip, you press your cockhead against his winking entrance.");

	if (tLength < 6)
	{
		output("\n\nYou spread the soft warm cleft of his ass as you drive your hips forward. His hot little hole opens up to accept your [pc.cockHead " + tCock + "], its owner releasing a soft gasp as he is penetrated.");
		pc.cockChange();
		geoff.buttChange(pc.cockVolume(tCock));
		output("\n\nGeoff pushes back into you as you bury your bone in his proverbial backyard. The combination of humidity and your natural lubricant help to make the sex liquid. Your [pc.cockHead " + tCock + "] is able to slide through the squeezing tunnel with ease.");
		
		output("\n\nAs you slide your [pc.cockNounSimple " + tCock + "] in and out of him Geoff’s hard breaths are accompanied by an almost musical note of pleasure. You grin as you grab him by the waist and begin to eagerly fuck his tight ass. He takes your passionate sex like a champ as you pound him hard against the wall.");
	}
	else if (tLength < 8)
	{
		output("\n\nYou hold yourself against the soft warm cleft of his ass, tightening your grip on your [pc.cock " + tCock + "] as you increase the pressure until your [pc.cockHead " + tCock + "] sinks into his tight hole. Geoff grunts when you fully hilt him in one fluid motion. His insides are a hot tight sleeve that massages your dick.");
		pc.cockChange();
		geoff.buttChange(pc.cockVolume(tCock));
		output("\n\n<i>“Fuck.”</i> he gasps as you hit his little ass with another sharp thrust. He claws at the wall as you begin to really pound his quivering hole inward. Each of your full length thrusts bring another curse from his lips. Soon your ass-slapping thrusts have fucked Geoff flat against the wall where he howls and groans, each sound dripping with a pleasure so intense it causes your [pc.chest] to swell with pride. Geoff even presses back against your thrusts, giving you deeper access as you fuck him with everything you’ve got.");
	}
	else
	{
		output("\n\nHe grunts as you increase the pressure on his little back door, using your weight to keep him pinned against the wall. Despite his not being a virgin anymore you still have to be careful here since you’re so big. Knowing this you begin to rock back and forth, adding plenty of oral lube to the process until your [pc.cockHead " + tCock + "] is able to properly penetrate him.");
		pc.cockChange();
		geoff.buttChange(pc.cockVolume(tCock));
		output("\n\n<i>“Fuh...”</i> Geoff groans as you work yourself into him. Slowly your patience and persistence are rewarded as you sink into the tight, hot ass before you.");
		
		output("\n\n<i>“Oh damn!”</i> Geoff suddenly groans as you stretch his tight hole wide. Your [pc.cockHead " + tCock + "] slowly advances inch by inch. His body goes flat against the wall as he does everything he can to not squirm away from the intense pressure of your hot cock spearing his insides. Then your trunk softly presses against his brown buns. You hold yourself inside of Geoff until he gets used to the sensation of your [pc.cock " + tCock +"] rearranging his bowels.");
		
		output("\n\nHe grunts when you begin to move through him. His legs suddenly go straight, prompting you to wrap your arms around his slim waist. He has to force himself to remain stationary. The tempo of your thrusts increases with every thrust until your trunk is slapping against his bare butt. As you continue to batter his back door with your long dick he begins to press back against you like a good little bottom. Your [pc.cockNounSimple " + tCock +"] feels like it’s in heaven as you force it in and out of Geoff’s hot hole, relishing in the amazing tightness as you fuck him with jackhammer intensity.");
	}

	output("\n\nYou watch Geoff as reaches between his legs and begin to furiously jerk his terran cock. An idea occurs to you and you begin working to synchronize your thrusts with his arm. When a deep chested groan rends the air you know that you did the right thing. From the way he arches his back and spreads his legs while still jerking his cock you can tell he is falling in love with the dual sensations.");
	
	output("\n\nAfter you’ve fucked him like that for a while you grab his hips and pull him back until his back is horizontal. As you continue roughly taking his ass you reach forward and grab a handful of his long dreads. The sound of your hips hitting his upturned ass is music to your ears as you roughly pound him. Then his knees buckle and the two of you end up on the floor.");
	
	output("\n\nYou release his hair and make his voice climb to the sky as you roughly dominate the sexy college student. Then you feel a familiar sensation building in your [pc.groin].");
	
	output("\n\nWith a deep groan that reverberates in your chest your [pc.cock " + tCock + "] explodes. [pc.Cum] violently fires from you as your sudden ejaculation causes you to fully hilt Geoff and hold, pressing him into the garage floor as you shiver with the intensity of the sensations coursing through your being. You hold him close as his fluttering rectal cavity milks you of every drop of your [pc.cumColor] seed.");
	
	output("\n\nFor a moment you sit there, cock softening as you allow yourself to recover both physically and sexually from the mind blowing fuck. When you rise you see Geoff tug a cum covered hand from beneath him, having came while you were fucking him.");
	
	output("\n\nHe reaches for you with his cum covered hand and you grab it without hesitation, helping him up on wobbly legs. It takes a second for the two of you to catch your respective breaths as the hissing steam continues to billow around you.");
	
	output("\n\nThe two of you have a nice little conversation as you grab your [pc.gear] and he pulls on his pants. Once the post-sex conversation has run its course you say your goodbyes and Geoff, like a perfect gentleman, limps over to the back door and holds it open for you. As you go through the door you give him a quick peck on the lips before leaving. You do, however, find yourself more than a bit damp from the physical exertion and sauna-like atmosphere. Luckily the hot sun will quickly take care of that.");

	processTime(45+rand(10));
	pc.orgasm();
	geoff.orgasm();
	this.clearMenu();
	this.addButton(0,"Next",mainGameMenu);
}
