public function showAraKei():void
{
	showBust("ARAKEI");
	showName("AMBASSADOR\nARA KEI");
	author("Nonesuch");
}

public function bothriocEmbassyFunc():Boolean
{
	showBust("ARAKEI");
	author("Nonesuch");

	if (flags["BOTHRIOC_EMBASSY_ENTERED"] == undefined)
	{
		if (!CodexManager.entryUnlocked("Bothrioc"))
		{
			output("\n\nAs you step through the doorway of the main office, you’re greeted by a strange sight. Scurrying about are a bunch of insectile people, all of them androgynous and clearly not myr. Dominating the area is a seven foot tall blue-black member of the species, idly writing out something on a sheaf of paper as another member of the species polishes the bureaucrat’s four chitin-clad legs with their tongue. Your codex pipes up: <i>“<i>Bothrioc detected! Bothrioc are classified extremely dangerous and should be avoided where possible. A full entry has been downloaded.</i>”</i>");

			output("\n\nThe dominant one laughs heartily, one of four hands partially covering a rather alarmingly wide smile. <i>“My, my. Offworlder technology certainly has a lot to say about us. It is also loud and insensitive. Welcome to the Bothrioc Embassy. I am your host and chief diplomat, Ara Kei Enya. Don’t be shy.”</i>");

			CodexManager.unlockEntry("Bothrioc");
		}
		else
		{
			output("\n\nStepping into the bothrioc embassy is a fairly intimidating experience after crossing paths with the species before. There are so many scurrying about and performing various bureaucratic tasks that you’d struggle to count them. Not all of them are bothrioc, either.");
			
			output("\n\nStanding mostly to the fore and off to one side by a counter is an extremely tall bothrioc, who on account of having four legs seems to have skipped the customary bureaucrat’s office chair, opting instead to simply nestle down amidst their legs.");
			
			output("\n\nIf there were any remaining doubt that this is the person in charge, the sight of a submissive bothrioc carefully polishing the dominatrix’s legs with their tongue removes it. Moreover, they’ve already concluded the immediately pressing point of the paperwork they were handling, one of their arms gently setting it down, to regard you.");
			
			output("\n\n<i>“Ah, no elaborate, loud warning about my species from a newcomer? Either you’ve got a better grasp of your thinking machine’s functions than the average offworlder or you’ve already met us. That is peculiar, as very few newcomers pass through without meeting me and I remember every last one of you. Regardless, I am Ara Kei Enya, and welcome to the Bothrioc Embassy. Don’t be shy.”</i>");
		}

		flags["BOTHRIOC_EMBASSY_ENTERED"] = 1;
	}
	else
	{
		if (flags["MET_ARAKEI"] == undefined)
		{
			output("\n\nYou step once more into the Bothrioc Embassy, greeted again by the sight of the tall one called Ara Kei being attended by a gaggle of underlings. The ambassador regards you unblinkingly, perhaps a bit miffed by your prior decision to depart without saying a word? After a long moment, Ara Kei speaks first.");
			
			output("\n\n<i>“Hello again, offworlder. Gotten over your fear of... Charles! What did you say we resemble?”</i>");
			
			output("\n\nA ginger head pops out from paperwork going on in the background.");
			
			output("\n\n<i>“Spiders. Wee eight-legged predators, trappers or ambushers.”</i>");
			
			output("\n\nThe host nods, granting the young man a beaming smile for his thorough and quick explanation. <i>“That’s the one. Yes. Welcome back to the spider’s web, offworlder.”</i>");
		}
		else
		{
			output("\n\nStepping into the Bothrioc Embassy armed with your knowledge about the bothrioc is quite a different experience as you realize the vast majority of Ara Kei’s underlings scurrying about - mostly two-legged bothrioc, but some four-legged, some of the other native species, and even some offworlders - must in some way be a part of the gleaming dominatrix’s harem.");
			
			output("\n\nStanding for the most part head and shoulders above the crowd is Ara Kei [ara.himself]. If you couldn’t tell by the deference of the underlings, the faded blue hair cascading off [ara.his] head makes it unmistakable just which tall bothrioc is Ara Kei Enya, and [ara.his] pitch black eyes are instantly upon you with laser focus. You’d like to think that’s because Ara Kei wants to keep an eye on you, but it’s just as possible Ara Kei simply makes a point of identifying every visitor.");
			
			output("\n\n<i>“Hello again, Steele. Come to visit your favorite ambassador, have you? Come closer, let me get a good look at you.”</i> Ara Kei chimes airily.");
			flags["ARAKEI_INVITED"] = 1;

			araKeiSpecialGreetings();
		}
	}

	addButton(0, "Ara Kei", approachAraKei);
	if (flags["ARAKEI_TALKED_BOTHRIOC"] != undefined) addButton(1, "Charles", );

	return false;
}

public function approachAraKei():void
{
	IncrementFlag("MET_ARAKEI");

	araKeiMenu();
}

public function araKeiMenu(lastF:Function = null):void
{
	clearOutput();
	
	addButton(0, "Talk", araKeiTalk);
	
	if (flags["ARAKEI_TALKED_BOTHRIOC"] == undefined) addDisabledButton(1, "Flirt", "Flirt", "You don’t know this being well enough to try.");
	else if (flags["ARAKEI_FLIRTED"] != undefined && pc.isTaur()) addDisabledButton(1, "Flirt", "Flirt", "Being a centaur displeases the bothrioc, for some reason. You won’t get any further with [ara.him] whilst you are one.");
	else gatedButton({ 
		id: 1,
		lbl: "Flirt", 
		f: araKeiFlirt,
		arg: undefined, 
		ttH: "Flirt",
		ttB: bothriocAddiction() >= 100 
				? "Debase yourself in front of this perfect being. (You probably don’t want to be anywhere anytime soon if you’re choosing this.)")
				: bothriocAddiction() >= 50
					? "Perhaps if you displayed your devotion enough..."
					: "Hey, it’s worth a short."
	});
	
	addButton(10, "Appearance", araKeiAppearance);
	addButton(14, "Leave", function():void { 
		currentLocation = "603";
		flags["ARAKEY_INVITED"] = undefined;
		mainGameMenu();
	});
}

public function araKeiAppearance():void
{
	clearOutput();
	showAraKei();

	output("Ara Kei Enya is easily seven feet tall standing, but is currently squatted down amongst four relatively thin and nimble legs, serenely passing on orders to her many underlings. The legs end in feet that are like some sort of chitinous boot. It is segmented and jointed, but has the overall shapes of toe, ball, instep, and heel that you’re familiar with. It is a heeled boot thanks to an upward bite of the chitin, you’d hazard an adaptation for resting comfortably on a web. The chitin in question is black, but under the gas lamps that seem to be preferred in the bothrioc office, it shimmers with deep blue tones. A gauzy, elegant grey shift drapes down from the creature’s upper shoulders down to four gleaming thighs.");
	
	output("\n\nThe face is pale with an angular look to it that suggests predatory intent and is framed by long, loose pale-blue hair neatly tucked behind chitin-shelled ears. Not far behind the hairline is a pair of firm, unbending antennae. There aren’t any eyebrows, merely a ridge where you feel like they should be. Beneath that ridge are a pair of eyes that are slightly larger than human standard, but pulled tight. Somewhat unexpectedly, they do have eyelashes atop actual eyelids. The eyes, however, are black as pitch, the particular shade which makes it hard to identify their shape and depth. There’s nothing breaking up the distance between eyes and mouth. The distance isn’t quite as vast as it would normally be if there was a nose, which seems to be largely due to how big the eyes and mouth are. The mouth is thin, seemingly permanently compressed or pursed, but it is wide, and when Ara Kei speaks it splits open hugely, revealing a massive set of teeth and a long tongue.");
	
	output("\n\nBehind the pair of legs not facing you is the quadomme’s abdomen; at least as big as a gold myr’s, it is clad entirely in black, pliable latex-like chitin. The bothrioc could be described as toned, in the small expanse of stomach that is snow-white skin rather than chitin, unlike the rest of the lower body. Even that gives the impression of someone tuned for combat by genetics rather than training, however.");
	
	output("\n\nAltogether, the bothrioc ambassador gives off the impression of intellect and good manners lightly coating a highly evolved and utterly assured rapacity.");
}

public function araKeiTalk():void
{
	if (flags["ARAKEY_TALKED"] == undefined)
	{
		clearOutput();
		showAraKei();

		if (flags["ARAKEY_INVITED"] == undefined)
		{
			output("\n\nYou approach the one clearly in charge");
		}
		else
		{
			output("\n\nYou step forward in acceptance of the ambassador’s invitation");
		}
		output(". Your gaze slowly sweeps up and down, trying to take it all in. You’re already well used to meeting strange new life forms, but the mixture of new and familiar that this bothrioc has in spades makes it hard to pin down where to start.");

		output("\n\nAra Kei arches one hairless eyebrow.");
	
		output("\n\n<i>“Well, dearest visitor, are you quite done gawking? Let me guess, my gender is throwing you off?”</i>");
		
		output("\n\nYou nod. It’s not the only thing, but it’s certainly high on the list.");
		
		output("\n\n<i>“That’s quite alright, let me help you settle the issue. Observe.”</i> The delicate grey shift draped about Ara Kei’s wide hips is gently pulled aside by one of the lower arms, revealing a completely featureless, hairless mound, topped by a chitin plate that smoothly separates the legs. No genitals. At all. <i>“There, see? Bothrioc don’t have genders or any of the charming parts that accompany them. We have a cloaca and an ovipositor, which makes us functional hermaphrodites. You’ll forgive my modesty if I don’t show them to you without even knowing your name, stranger. Has that helped you land upon an appropriate pronoun? Do let me know what you think it is. I always find it fascinating.”</i>");
	
		output("\n\nAn opinion on gender is slowly forming in your head.");

		// [They] [He] [She]
		clearMenu();
		addButton(0, "They", setAraKeiGender, 0, "They", "The safe choice. Potentially the wise choice.");
		addButton(1, "He", setAraKeiGender, 1, "He", "It's a he, right? Obviously a he.");
		addButton(2, "She", setAraKeiGender, 2, "She", "It's a she, right? Obviously a she.");
		return;
	}

	araKeiTalkMenu();
}

public function setAraKeiGender(genderType:uint):void
{
	clearOutput();
	showAraKei();

	araKei.setStatusValue("Forced Gender", genderType);

	switch (genderType)
	{
		case 0:
		default:
			output("\n\nYou communicate your acceptance of the ambiguity, and throw in a full introduction while you’re at it. Ara Kei chuckles.");
			output("\n\n<i>“Well, aren’t you the cagey type. Allow me to reintroduce myself. I am Ara Kei Enya. I rule this harem and represent the bothrioc before the galaxy as our ambassador. My goal is to drag my species kicking and screaming into the light of civilization.”</i>");
			break;

		case 1:
			output("\n\nYou communicate that ultimately you think of Ara Kei as male, and that your name is [pc.name] Steele. This seems to give him pause.");
			output("\n\n<i>“Farlanders are full of surprises. The myr tend to think of us as female, given their cultural obsession with the idea of female power. Perhaps the men are the powerful ones where you’re from, hm? Perhaps... ah, well, allow me to reintroduce myself. I am Ara Kei Enya. I am the master of this harem, and the ambassador of the bothrioc before the entire galaxy. My goal is to drag my species kicking and screaming into the light of civilization.”</i>");
			break;

		case 2:
			output("\n\nYou communicate that ultimately you think of Ara Kei as female, and that your name is [pc.name] Steele. She nods, amused.");
			output("\n\n<i>“That’s the standard line around here. Most every other species likes to think of us as female - even if it is usually they who bear our young. Ah, but we’ll get to that. Allow me to reintroduce myself. I am Ara Kei Enya. I am the mistress of this harem, and the ambassador of the bothrioc before the entire galaxy. My goal is to drag my species kicking and screaming into the light of civilization.”</i>");
			break;
	}

	output("\n\nThe fabric of [ara.his] shift hisses softly as "+ ara.mfn("he repositions", "she repositions", "they reposition") + " [ara.himself]. The submissive waits patiently on their hands and knees until a new leg is presented to them, at which point the tongue-polishing continues unabated.");
	
	output("\n\n<i>“Since you have assuaged my curiosity, I shall do the same for you,”</i> the tall piebald being goes on. <i>“That is what I am here to do, after all. Nothing shall improve for our people unless someone stands here and talks to every visitor who wishes to get to know us, as wearisome as that may be. So what would you like to know?”</i>");
}

public function araKeiTalkMenu(lastF:Function = null):void
{
	clearMenu();

	gatedButton({ 
		id: 0, 
		lbl: "Bothrioc", 
		f: araKeiTalkBothrioc, 
		arg: undefined, 
		ttH: "Bothrioc", 
		ttB: "Let’s hear the truth about talking spiders from the head talking spider.", 
		prevF: lastF
	});

	gatedButton({ 
		id: 1, 
		lbl: "Ambassador", 
		f: araKeiTalkAmbassador, 
		arg: undefined, 
		ttH: "Ambassador", 
		ttB: "Ask about [ara.his] role here.", 
		prevF: lastF 
	});

	gatedButton({ 
		id: 2, lbl: "History", 
		f: araKeiTalkHistory, 
		arg: undefined, 
		ttH: "History", 
		ttB: "How do the bothrioc fit into the grander scheme of Myrellion?", 
		prevF: lastF 
	}, flags["ARAKEI_TALKED_AMBASSADOR"] == undefined);

	gatedButton({ 
		id: 3, 
		lbl: "Other B.ric", 
		f: araKeiTalkOtherBothrioc, 
		arg: undefined, 
		ttH: "Other Bothrioc", 
		ttB: "Ask whether the other bothrioc are on board with [ara.his] plans.", 
		prevF: lastF
	}, flags["ARAKEI_TALKED_HISTORY"] == undefined);

	addButton(14, "Back", araKeiMenu);
}

public function araKeiTalkBothrioc():void
{
	clearOutput();
	showAraKei();

	output("<i>“I’m afraid I simply haven’t the time to explain every intricacy of our species, but I can certainly outline some very important things to bear in mind. Now...”</i> one of Ara Kei’s fingers taps a chin in thought. <i>“Where to start...”</i>");
	
	output("\n\n<i>“We used to be the boogiemen of this planet. Before the myr really got going; before they became boogiemen unto themselves. To this day though, when a myr mother wants her rebellious spawn to behave, she threatens that the bothrioc will take her away and keep her in a harem, stuffed full of children that aren’t hers.”</i>");

	output("\n\n"+ ara.mfn("He laughs", "She laughs", "They laugh") + " when "+ ara.mfn("he catches", "she catches", "they catch") +" your expression. "+ ara.mfn("He displays", "She displays", "They display") + " a lot of teeth when "+ ara.mfn("he does", "she does", "they do") +" that.");

	output("\n\n<i>“Effective, isn’t it? Don’t worry, I’m not going to fill your head with lies, nor stuff your belly with spawn. Our reproductive system is unique though, and I readily admit is an easy source of fascination and revulsion.”</i> The four-legged bothrioc makes a sweeping gesture that takes in everyone in the embassy. <i>“As you can see, we all have an abdomen at the base of our torso. That is the ovipositor. It creates eggs and a fertilizing oil. We exchange the oil to fertilize eggs, and then plant the eggs in another’s orifices using the tube. Usually this is an intra-bothrioc matter, but we’re quite capable of both implanting in and being fertilized by others. That is where the fear and fascination a boogieman needs is sourced.”</i>");
	
	output("\n\nAra Kei coos down at the dutiful harem member still polishing [ara.his] leg chitin to a gleaming shine, pointing out a few spots that need special attention. <i>“We can put life in barren soil, but to the other species, that life is alien. We can be a mother where mothers are slim, and a father where the inverse is true. However, because it doesn’t have their genes and their eggs it is somehow not theirs when they bear it. There would probably be a strong tendency to abandon our young if not for the other little peculiarity of our breeding.”</i>");
	
	output("\n\nThe ginger human busily eroding a mountain of paperwork into a hill gives a long drooping whistle from across the room, of the <i>“here comes the big one”</i> variety. The look Ara Kei gives him is nothing short of venomous, and all the more backed up by the incredible chitinous physiology on display.");
	
	output("\n\n<i>“Thank you, Charles, your commentary is appreciated.”</i> You’re not sure what the dynamic between the two of them is. Charles is clearly human, but he’s definitely working largely for Ara Kei. He’s not a harem boy, you think, but that’s all the conclusion you can draw.");

	processTime(5+rand(3));
	clearMenu();
	addButton(0, "Next", araKeiTalkBothrioc);
}

public function araKeiTalkBothriocII():void
{
	clearOutput();
	showAraKei();

	output("<i>“Yes,”</i> sighs Ara Kei theatrically, <i>“this is what has us classed by your thinking machines as not merely dangerous, but to be avoided at all costs. Our fertilizing slime has a variety of hormones in it. They serve to signal a bothrioc in submission that their time as a dominant is through. Their abdomens begin to swell more with fertile oil than eggs, that we may bathe larger batches of eggs in it, before depositing them. In species with biological sexes, it is feminizing, as the trigger to change to fertilization production is the same hormone mixture that turns girls into women. The real prize, however, is that it brings them to love their role as an incubator and to be naturally led by the dominant partners. It also tends to make them a bit absent-minded. If you watch closely, it takes my lovely harem here a good deal of concentration to handle all of this paperwork.”</i>");
	
	output("\n\nAt [ara.his] invitation, you take in the harem a bit more closely. Charles is sharp and on tack, but the bothrioc around the place are, while certainly seemingly competent, also working very hard to be. One bothrioc is filling out forms with a tongue stuck out and their face inches from the paper, contorted in concentration. Another, seeming lost in thought, is gently pulled toward a back room while another is brought in to take their place. Ara Kei regards [ara.his] harem warmly.");
	
	output("\n\n<i>“You see, the impression is that our oil makes you stupid. No, that is not the case. Rather, your priorities are reoriented, and between our love and our oil, you come to love your new place in life, to the point of excluding most other cares or concerns. My darlings are working so hard because this is important to me, and they wouldn’t be motivated by anything less.”</i> This last statement is accompanied by an encompassing gesture of [ara.his] arms.");
	
	output("\n\nTurning [ara.his] gaze once more to you, Ara Kei adds, <i>“And that is what you are told to fear. You see me before you, and I don’t attack you, or try to deceive you. However, the rules in the caverns we call home are not the ones I have embraced here, in order to state our case. Down there, the pidemmes and quadommes still consider any wanderer fair game. Consider that the real warning.”</i>");

	//Unlocks “Charles” option in Embassy main menu
	processTime(10 + rand(3));

	flags["ARAKEI_TALKED_BOTHRIOC"] = 1;
	araKeiTalkMenu(araKeiTalkBothrioc);
}

public function araKeiTalkAmbassador():void
{
	clearOutput();
	showAraKei();

	output("<i>“What exactly are you aiming to achieve up here?”</i> you ask. Ara Kei gazes at you silently for a few moments.");
	
	output("\n\n<i>“Perhaps you do not know?”</i> "+ ara.mfn("he says", "she says", "they say") +", seemingly mostly to [ara.himself]. <i>“Yes, likely. Something always taken for granted... well, who are we to judge such an attitude, after all.”</i>");
	
	output("\n\n<i>“It is both straightforward and very complicated, Steele,”</i> "+ ara.mfn("he goes", "she goes", "they go") +" on in louder tones. <i>“When your U.G.C. first stepped down from the stars to greet us, I was at first elated, and not just because they postponed the myr destroying the world. Here, at last, was an opportunity to get my race equal representation on Myrellion - to speak for our needs and wishes, instead of living forever in helpless fear of what the myr might do next. For surely if I presented our plight to these enlightened beings, they would help us?”</i>");
	
	output("\n\nAra Kei’s long, elegant face twists wryly.");
	
	output("\n\n<i>“Alas. It turns out aliens are turned just as cruel by bureaucracy and ulterior motive as the myr are. Did you know that your U.G.C’s legal protections for planetary sovereignty doesn’t merely require sapience? Merely existing and thinking do not satisfy the requirements for citizenship in this galaxy; it also requires a demonstration that the species has contributed meaningfully to the planet, through cultural or technological innovation. They tell me this clause exists to prevent warlike and savage species from being uplifted before they are capable of integration. From my brief exposure to this Xenogen organization and their fur-thing friends, however, I suspect the </i>real<i> reason is that it allows for the casual exploitation of races who are helpless to resist. Is that an unfair assumption to make, starwalker?”</i>");
	
	output("\n\nYou shrug uncomfortably. Ara Kei sighs, absently ruffling the hair of the haremling dutifully polishing [ara.his] chitin.");
	
	output("\n\n<i>“Unfortunately, the bothrioc’s very nature means we have extremely little to show for our long history, and the myr leadership will not hesitate to see us bereft of those protections. Therefore, I am the ambassador for my people out of a necessity of which most aren’t even aware. Oh, if I could make them see how precarious it all is, that would surely unite them like nothing ever has.”</i>");
	
	output("\n\n"+ ara.mfn("He smiles", "She smiles", "They smile") +" down lovingly.");
	
	output("\n\n<i>“At least my little ones support my endeavours, even if the rest of the species is too ill-informed.”</i>");

	processTime(5 + rand(3));
	flags["ARAKEI_TALKED_AMBASSADOR"] = 1;
	araKeiTalkMenu(araKeiTalkAmbassador);
}

public function araKeiTalkHistory():void
{
	clearOutput();
	showAraKei();

	output("<i>“History? You ask for history from a species with no written records, no architecture, only the technology required to trap, eat and breed?”</i> Ara Kei sneers in apparent disbelief - however, the way [ara.his] eight limbs tremble slightly with restless energy telegraph "+ ara.mfn("he’s", "she’s", "they’re")+ "pleased you’ve brought this topic up.");
	
	output("\n\n<i>“We have history, Steele, but not as you understand it. Imagine that the only unspoken descriptions that existed of you were written by someone else - someone who was at best ambivalent to you, at worst an enemy.”</i> "+ ara.mfn("He watches", "She watches", "They watch") +" your expression closely with those big, black eyes of "+ ara.mfn("his", "hers", "theirs") +". <i>“Yes, there is someone, isn’t there? Not such a pleasant thought, is it. That is why I am here - to fight against my race being a scribbled footnote in somebody else’s tragedy. In order to apply for legal protection within the U.G.C.”</i>");
	
	output("\n\nA gleaming black arm is swept at the rows of bothrioc busying themselves over the books and reams of paper that are piled on the tables all around.");
	
	output("\n\n<i>“Even before the farlanders arrived, I - that is to say, me and my harem - collected and scoured the records of both sets of myr, tracking down every single mention of our race that we could find. It has been fascinating - and incredibly frustrating.”</i> A single index finger is pointed downwards. With a sigh of pleasure, the tongue polisher envelopes it in their mouth. Ara Kei’s attention and fervency are entirely directed at you. <i>“It is like a single bright thread woven into a vast garment, constantly disappearing from sight, reappearing where you wouldn’t expect - but definitively there. We had empires, you know. Bothrioc sometimes stood at the head of red myr armies. Some legends even had them as kings to gold myr queens. But it’s all so vague, so often contradictory, because of course the myr do not often waste print talking about us. WE are not THEY. Ah!”</i>");
	
	output("\n\nThere is a distinct, wet <i>“pop”</i>, and the submissive looks vaguely confused as all four of Ara Kei’s hands go up into the air, giving voice to pure exasperation.");
	
	output("\n\n<i>“My people! So assured that they would forever be the top pods on Myrellion that they never even noticed the myr building, and developing, and growing, until their factories and palaces were being built right on top of them. Now the myr are bent on destroying the world, a world that we happen to be on, but have no say in the running of. I will not have it, Steele.”</i> "+ ara.mfn("He wags", "She wags", "They wag") +" a stern, spit-polished finger at you, as if you had disagreed. <i>“The work I am doing here will prove the bothrioc are a distinct culture - one that deserves to be recognized and given a say in how this planet is developed. We shall not wallow in ignorance and shy away from the light, as the wetraxxal and the ganrael do; nor shall we bend our knees to the Federation, as some of the nyrea have chosen. We shall come to the galactic table on our own terms, as a result of our own hard work, with our heads held high!”</i>");
	
	output("\n\n<i>“Or at least some of us will,”</i> "+ ara.mfn("he amends", "she amends", "they amend") +", gazing at the hive of activity around [ara.him] serenely. <i>“Some of us will come kissing the ground upon which the others walk. But you get the idea.”</i>");

	processTime(5+rand(3));
	flags["ARAKEI_TALKED_HISTORY"] = 1;
	araKeiTalkMenu(araKeiTalkHistory);
}

public function araKeiTalkOtherBothrioc():void
{
	clearOutput();
	showAraKei();

	output("<i>“Do you have the support of the other bothrioc?”</i> you ask.");
	
	output("\n\n<i>“It is an up-hill struggle securing that if I am to be honest with you, Steele,”</i> Ara Kei sighs. <i>“The problem is that the dominants innately distrust one another. If your haremlings give you everything you need, why would you be reaching out to another, except to try and steal their prizes? Outside of our lovers we are a solitary species, always have been; wider organization is a difficult thing to sell. It does not help that I have the single largest harem of any bothrioc known. I keep an even forty, which has slaked my thirst for more lovers.”</i> "+ ara.mfn("He laughs", "She laughs", "They laugh") +", again with that wry note. <i>“But try explaining that to other quadommes! They just think I’m particularly greedy and untrustworthy. And it’s no good me applying for citizenship on my own. I need as many other quadommes as possible to step forward, if my plan has any chance of succeeding.”</i>");

	// 9999 Diplomacy mission goes here
	processTime(3+rand(2));
	araKeiTalkMenu(araKeiTalkOtherBothrioc);
}

public function araKeiFlirt():void
{
	clearOutput();
	showAraKei();

	if (flags["ARAKEI_FLIRTED"] == undefined)
	{
		output("An eight-limbed "+ ara.mfn("dom", "domme", "dom") +" with a 40-strong harem? You reckon Ara Kei must be something else in bed. The question is - how to get [ara.him] there?");

		if (pc.isBimbo())
		{
			output("\n\n<i>“I bet you’re really good at snugglings,”</i> you say brightly. <i>“I’m really good at snuggling too. Wanna compare notes?”</i>");
		}
		else if (pc.isBro())
		{
			output("\n\n<i>“All this talk, "+ ara.mfn("dude bro", "baby doll", "baby dude bro doll") +"!”</i> you complain with mocking exasperation. <i>“Why don’t you show me where the money is?”</i>");
		}
		else
		{
			output("\n\n<i>“It seems as if there’s a lot about the bothrioc that has to be experienced to be properly understood,”</i> you grin, rocking your [pc.hip] gently. <i>“Perhaps you could give me a little personal demonstration?”</i>");
		}

		output("\n\nAra Kei gazes at you with silent incomprehension.");
		
		output("\n\n<i>“Are you... trying to flirt with me?”</i> "+ ara.mfn("he says", "she says", "they say") +" at last, touching [ara.his] long neck. <i>“Are those your people’s body signatures? How droll! I guess what they say is true - the outside galaxy is a fantastically promiscuous place.”</i> For a moment Ara Kei looks at you with [ara.his] big, black eyes as if you were the only person in the room, the sole focus of [ara.his] attention, and something turns in your gut. The thought that maybe, just maybe, you have bitten off more than you can chew flies through your head....");
		
		output("\n\nThe next moment [ara.his] gaze turns away to take in the bustle all around you again, and you breathe.");

		if (!pc.isTaur())
		{
			output("\n\n<i>“I’m flattered, Steele,”</i> "+ ara.mfn("he says", "she says", "they say") +" airily, <i>“but I have 40 people to take care of my needs. I have nothing to gain from rolling around on the floor with you. You run along down to Gildenmere - you should be able to find plenty of willing gold myr to see to you there.”</i>");
		}
		else
		{
			output("\n\n<i>“I’m flattered, Steele,”</i> "+ ara.mfn("he says", "she says", "they say") +" airily, <i>“but I have 40 people to take care of my needs. Your cumbersome body shape would present certain difficulties for me, moreover. You prance along down to Gildenmere - you should be able to find plenty of willing gold myr to see to you there.”</i>");
		}

		output("\n\nOh well. Nothing ventured, nothing gained.");

		araKeiMenu();
		return;
	}
	else if (bothriocAddiction() <= 24)
	{
		output("<i>“Don’t be tiresome, Steele,”</i> says Ara Kei sharply, antennae twitching, before you even open your mouth. <i>“I have zero interest in weekending farlanders looking for an exotic screw. When you have gained a little more insight into my people - then we’ll see.”</i>");
		araKeiMenu(araKeiFlirt);
		processTime(1);
		return;
	}
	else if (bothriocAddiction() <= 59 || flags["ARAKEI_FLIRTED_59_ADDICTION"] == undefined)
	{
		IncrementFlag("ARAKEI_FLIRTED_59_ADDICTION");

		output("<i>“Perhaps - we could - ?”</i> you say haltingly.");
		
		output("\n\n<i>“Hmm,”</i> murmurs Ara Kei, the sound trailing off into a whispery, silky susurration. <i>“A little reward, perhaps? For taking a step towards true understanding?”</i>");
		
		output("\n\n<i>“Yeah!”</i> you say eagerly. The big quadomme gazes at you, and again you have that sense of being the centre of something incredibly powerful’s attention - a thrilling fright tightening up your chest.");
		
		output("\n\n<i>“Let me be crystal clear about this, Steele,”</i> "+ ara.mfn("he says", "she says", "they say") +" briskly, breaking the spell by turning [ara.his] face back to the maid fervently polishing [ara.his] chitin. <i>“So you do not feel led on. I will never be your master. Forty is a challenge to manage, particularly with the amount of work that I have undertaken, and I will not deny my loved ones by taking on board more submissives than I can manage. So the things you really crave - being controlled, the bliss of submission, a loving boot pressing your face to the floor - are not things I can give you. I am sorry.”</i>");
		
		output("\n\nIt’s difficult, in the presence of the towering bothrioc, not to feel a slumping misery about this.");
		
		output("\n\n<i>“But - <i>“ Ara Kei goes on, with a slight musical undercurrent, and your [pc.ears] perk up. <i>“But. I am not averse to giving obedient incubators little rewards. IF, Steele. If you finish the path you have undertaken, and do as I ask. And only then.”</i>");
		processTime(5 + rand(3));
		araKeiMenu(araKeiFlirt);
		return;
	}
	else if (bothriocAddiction() <= 99 || flags["ARAKEI_FLIRTED_99_ADDICTION"] == undefined)
	{
		IncrementFlag("ARAKEI_FLIRTED_99_ADDICTION");
		output("<i>“Please, Ara Kei,”</i> you say breathlessly. You don’t have to say anything else; the quadomme’s merciless, gleaming chitin and [ara.his] long, plump abdomen dominates your vision, and your [pc.skinFurScales] cries out to have it pressed hard against you, making passionate use of your tender flesh.");
		
		output("\n\n<i>“You do beg awfully sweetly, Steele,”</i> says the blue-haired bothrioc with amused diffidence, gazing down. <i>“I very much hope there’s someone else out there that knows that.”</i> "+ ara.mfn("He sighs, and shoos his maid away", "She sighs, and shoos her maid away", "They sigh, and shoo their made away") +". You watch as four, heeled boots slowly clack towards you, until the elegant, black-and-white monster towers over you.");
		
		if (flags["ARAKEI_FLIRTED_99_ADDICTION"] <= 1)
		{
			output("\n\nFirst: <i>“Very well,”</i> Ara Kei whispers. <i>“Let’s see how much you truly want this, little one. My second left leg has not been polished in at least four hours. You may begin.”</i>");
		}
		else
		{
			output("\n\nRepeat: <i>“I shouldn’t need to tell you, little one,”</i> Ara Kei whispers. <i>“Just looking should tell you which of my legs is in need of polishing. And then... maybe then.”</i>");
		}

		processTime(3+rand(3));
		// [Polish] [No]
		clearMenu();
		addButton(0, "Polish", araKeiPolishBooties);
		if (pc.lust() < 90) addButton(1, "No", araKeiNoPolishBooties, undefined, "No", "No... it may be difficult, but you're not quite willing to abase yourself THAT much");
		else addDisabledButton(1, "No", "No", "You can't bring yourself to say no... not with this amount of lust in your system.");
		return;
	}
}

public function araKeiPolishBooties():void
{

}

public function araKeiNoPolishBooties():void
{
	clearOutput();
	showAraKei();

	output("You take big, sucking gulps of air. It takes a while, but at last the imperative urge to obey the dominant... to sink into the soft, sweet, fuzz of obedience... fades, and you can voice the words, as unpleasant and bitter as they are.");

	output("\n\n<i>“No. I don’t want to, Ara Kei.”</i>");

	output("\n\nThe maid knelt nearby utters a wordless sound of frightened incomprehension to this.");

	output("\n\n<i>“This far, and still you clutch on to an utterly outmoded concept of dignity!”</i> sighs Ara Kei in exasperation, stepping back from you. <i>“I can hear, I can taste how unhappy it makes you, this obstruction you’ve designed for yourself. Until you break that down we can go no further, [pc.name]. I cannot show someone true paradise if they aren’t willing to take their hands away from their eyes.”</i> "+ ara.mfn("he points", "she points", "they point") +" silently, and the maid immediately scoots over and, with a sigh of bliss, resumes licking.");

	processTime(2+rand(2));
	araKeiMenu();
}

public function placeholder():void {}