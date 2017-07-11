//Expeditions:
//Button disabled if no expedition on current world or already done - unless first time intro needs doing! If talked about expeditions, skip first-time intro.

//Mhenga idea: botanical fuck-flower being displaced by invasive cunt-snakes. Grows in a thicket near a large zil settlement to the south. Fight naleen brothers armed with bottled zilmusk, then fight 9x cuntsnake infested zil (ZILSUNE) while she harvests a flower.

//Alt Tarkus: - Slutshrooms (+moderate libido, moderate fertility, +wet if fertile enough) ? Spunkshrooms (+moderate libido, moderate fertility, +balls? +cumstorage)? Motherhusk (Accelerates pregnancy)

//<i>“Munitions”</i> plant on Myrellion. Bloated pepper-like growths that are under high pressure. If squeezed or thrown, they puff in a neurotoxic seed cloud that leaves the victim hypersensitive to even slight touches.


public function azraExpeditionAvailable():Boolean
{
	//"new texas", "tarkus", "phaedra", 
	if(getPlanetName().toLowerCase() == "mhen'ga")
	{
		if(flags["AZRA_MHENGAED"] == undefined) return true;
	}
	return false;
}

//Rush Expedition Introduction
public function azraExpeditionStartup():void
{
	clearOutput();
	showAzra();
	//Too Advanced (Gotta go in order for Fen’s sanity) (Or planet doesn’t have one available)
	if(!azraExpeditionAvailable())
	{
		output("You let Azra know that you’re ready to help her with her next expedition.");
		output("\n\n<i>“I’m not,”</i> Azra replies. <i>“My research into the local biomes leads me to believe that we would be better served spending our time on another world until we are more prepared for the dangers ahead.”</i>");
		processTime(1);
		azraMenu();
	}
	//Failure Introduction
	else if(flags["AZRA_EXP_FAILED"] == getPlanetName().toLowerCase())
	{
		output("You let Azra know you’re ready to help her with an expedition.");
		output("\n\n<i>“Really?”</i> Azra looks at you uncertainly. <i>“I’d rather not risk it if things are just going to go sideways again. Are you sure?”</i>");
		//[Yep] [Nope]
		clearMenu();
		addButton(0,"Yep",actuallyGoOnMhengaExpedition,true,"Yep","Go on an <i>ADVENNNNTUUUUUURRRRRRRE</i>");
		addButton(1,"Nope",nopeOutOfAdventures,undefined,"Nope","Maybe you should prepare first.");
	}
	//If not on Mhen'ga, go straight to the hot shit.
	else if(getPlanetName().toLowerCase() != "mhen'ga") 
	{
		adventureStartRouter();	
	}
	else
	{
		output("<i>“Need help gathering samples?”</i> you say.");
		output("\n\n<i>“Seriously?”</i> Azra places her palm on her armored hip. <i>“You’re not pulling my wings?”</i>");
		//Misch
		if(pc.isMischievous()) output("\n\nYou grab hold of one and give it a little tug. <i>“Well now I am now, but not about this.”</i>");
		//Bimbo
		else if(pc.isBimbo()) output("\n\n<i>“Nopitty nope nope!”</i>");
		//Else
		else output("\n\n<i>“Of course not.”</i>");
		//Merge
		output("\n\nAzra’s ink-black lips curl in a slight smile. <i>“Then I should prepare a plan before begin. Allow me a few seconds to search my database. I’ve flagged thousands of potential reports of unique species on Rush worlds for further investigation.”</i> She picks up her codex and rapidly taps on the screen. <i>“");

		output("Ah yes... this one could be fun for both of us. Ready to get the ball rolling?");
		output("”</i>");

		processTime(3);
		clearMenu();
		addButton(0,"Ready",adventureStartRouter,undefined,"Ready","Go on an expedition with Azra.");
		addButton(4,"Back",nopeOutOfAdventures);
	}
}
public function adventureStartRouter():void
{
	if((getPlanetName().toLowerCase()) == "mhen'ga") actuallyGoOnMhengaExpedition();
	else output("ERRORRRRRRRRRRRR NO EXPEDITION FOUND");	
}
	
//Nope:
public function nopeOutOfAdventures():void
{
	clearOutput();
	showAzra();
	output("You change your mind.");
	output("\n\n<i>“Okay. Let me know when you’re ready,”</i> Azra says. <i>“Really ready.”</i>");
	processTime(1);
	azraMenu();
}
/*
public function actuallyGoOnTarkusExpedition():void
{
	clearOutput();
	showAzra();
	if(9999) output("You let Azra know you’re ready to help her with an expedition on Mhen'ga.");
	else output("You tell her in no uncertain terms that are you really ready. No room for failure on this trip!");

	output("\n\n<i>“Fantastic!”</i> Azra exclaims, grabbing her codex and her usual pack full of scientific miscellany. <i>“Luckily, we don’t have to save anything from extinction. The species that survived this planet’s cataclysmic history are more than robust enough to survive colonization by rogue core elements.”</i> Azra gives you a serious look. <i>“But that does not mean that there aren’t discoveries to be made. I’ve found three.”</i>");
	output("\n\n<i>“Three?”</i> You raise an eyebrow. Finding one flower was hard enough{, even if the payoff turned out to be really, really plant sex}.");
output("\n\n<i>“Correct. I’ve identified three species of plants with highly mutagenic properties that grow in the areas surrounding Novahome.”</i> Azra pulls up a holographic display of smallish, pink-colored mushroom. <i>“The locals call these ‘Slutshrooms.’ Libertine name aside, these mushrooms cause a variety of poorly-understood mutations in those who consume them, resulting in increased libido and vaginal secretions. Further study could reveal a number of genetic optimizations for modern marital aids.”</i>");
output("\n\nYou nod. Xenogen and TamaniCorp would both be interested.");
output("\n\nAzra switches the hologram to display a set of craggy, hollow tubes. <i>“These are known to the locals as Motherhusks, and they’re the real potential prize of this expedition. Preliminary reports indicate that prolonged contact increases fertility while simultaneously speeding the development of any offspring in the womb. Both attributes are highly sought after in present day gene mods and would be worth a fortune if safely isolated.”</i>");
output("\n\nYou lean close for a better look. They don’t look very palatable, but you suppose they’d come in handy {to relieve you of your gravid state/if you ever wound up pregnant{, somehow}}.");
output("\n\n<i>“My last target is...”</i> Azra clears her throat. <i>“Spunkshrooms.”</i> The display changes to show a squat mushroom with a droopy top that slouches all the way down to touch the ground. <i>“These things reportedly release spores that can increase sperm production, though data is more sparse than on the other two.”</i> She closes the hologram and pockets her tablet. <i>“Orbital biosign scans have pinpointed a region to the southwest where a population of each can be found in close proximity. Two or three hundred meters apart at most.”</i>");
output("\n\nYou ask her if it happens to be next to a tribe of angry aliens.");
output("\n\n<i>“Nope,”</i> Azra counters. <i>“That region contains low amounts of sapients and fauna in general relative to the rest of the planet");
*/

//Mhen'ga Expedition
public function actuallyGoOnMhengaExpedition(warned:Boolean = false):void
{
	clearOutput();
	showAzra();
	if(!warned) output("You let Azra know you’re ready to help her with an expedition on Mhen'ga.");
	else output("You tell her in no uncertain terms that are you really ready. No room for failure on this trip!");
	output("\n\n<i>“Superb,”</i> the shark-like alien exclaims, grabbing her codex and a pack stuffed with all manner of scientific implements. <i>“I think you’re going to like this one.”</i> She grins at you. <i>“It was too dangerous to pursue by myself, but the prize... ohhh the prize.”</i> She steeples her fingers together. <i>“You see, Mhen'ga is famous for its fuck-hungry locals and sexually voracious flora. Venus Pitchers in particular. It isn’t the pitchers that interest me, however. It’s a smaller, more benign plant that grows almost exclusively in areas densely populated by zil.”</i>");
	output("\n\nYou adjust your own gear and ask her what makes it so interesting.");
	output("\n\n<i>“Well, rushers who’ve come across them have taken to calling them Fuck Lilies.”</i> Azra folds her arms across her chest. <i>“Preliminary reports indicate that they survive almost entirely upon the sugary secretions of the zil, not the overcrowded soils below. And they do it without any identifiable hint of coercion. No restraining tentacles, no venomous injections. The zil just fuck them instead of masturbating, because it feels so good.”</i> Her tail wiggles excitedly. <i>“Think of the potential uses! The credits we could make! They could be sold as masturbation aids-slash-houseplants, or used to refine new lubricants, sensation-enhancers, or even texture-creating cellulose structures.”</i>");
	output("\n\nYou nod");
	if(pc.libido() >= 50) output(" and try really hard to not imagine how it must feel");
	if(pc.libido() >= 75) output(". You fail hard, but Azra doesn’t seem to notice");
	output(".");
	output("\n\n<i>“The only problem an invasive species is displacing them. Cunt-snakes are slithering into that ecological niche, attaching themselves to naleen, zil, and damn near everything else on the planet. And when you’ve got a fuck-hungry pussy attached to your spine, demanding you sate it morning, noon, and night, you’re not going to go visit your friendly flower patch.”</i> Azra gestures imploringly to you. <i>“We aren’t just picking up pet fuck-plants to exploit. We are potentially saving a species from extinction!”</i>");
	processTime(15);
	//[Sure] [Eh...]
	clearMenu();
	addButton(0,"Sure",sureLetsDoThisMhengaThing);
	addButton(1,"Eh...",ehLetsNotDoThisMhengaThing);
}

//Eh...
public function ehLetsNotDoThisMhengaThing():void
{
	clearOutput();
	showAzra();
	output("<i>“Sounds like you’re justifying a lot.”</i>");
	output("\n\nAzra shrugs. <i>“Hey, you’re the one plundering undeveloped planets for their resources. Yes, I’m going to derive no small amount of pleasure from keeping my samples suitably nourished, but there are meritorious arguments for this course of action. Now come on. I can’t do this alone.”</i> She makes for the door, explaining as she goes. <i>“I pinpointed a large patch of them on last week’s satellite surveillance data, though evidence of an in-progress die-off is visible.”</i>");
	output("\n\nAt least this ought to be interesting.");
	processTime(2);
	clearMenu();
	addButton(0,"Next",movingOnOutToMhengaExp);
}

//[Sure]
public function sureLetsDoThisMhengaThing():void
{
	clearOutput();
	showAzra();
	output("<i>“Sure thing,”</i> you agree.");
	output("\n\nAzra smiles warmly, <i>“Then let’s be on our way. Science waits for no man or woman.”</i> She makes for the door, explaining as she goes. <i>“Satellite data from a week ago has pinpointed a large patch not too far from Esbeth, though signs of a die off were already present. We must hurry if we are to save this flower.”</i>");
	output("\n\nThis should be interesting...");
	processTime(2);
	clearMenu();
	addButton(0,"Next",movingOnOutToMhengaExp);
}

public function movingOnOutToMhengaExp():void
{
	clearOutput();
	showNaleenBros();
	showName("FIGHT:\nNALEEN BROS");
	currentLocation = "OVERGROWN ROCK 3";
	generateMap();
	output("Azra directs you to the jungle but wisely stays in the rear, leaving you to push your way through the thick, alien foliage. At every strange sound or cracking twig, she tenses up. Her wings catch on vines numerous times, leading the fiery-haired siren to noisily grumble and groan as she picks leaves from her mane.");
	output("\n\n<i>“What an inhospitable planet. I can’t believe anyone actually lives here, interesting flora or not!”</i>");
	output("\n\nYou shrug and do your best to keep your eyes open and alert. No journey through Mhen'ga is likely to end without at least one hostile encounter, and this one is no exception.");
	output("\n\nTwo figures slither out of bioluminescent bushes with nary a sound, one to each side of your small party.");
	if(CodexManager.hasUnlockedEntry("Naleen")) output("\n\nYour Codex pings, <i>“Warning, Naleen detected. These snake-like felines should be avoided if possible. Beware their venom.”</i>");
	else output("\n\nThey’re naleen!");
	output("\n\n<i>“Oh brother... look what we have here,”</i> the leftmost one says, cat-like ears flicking playfully.");
	output("\n\nThe other’s ears go flat as he bares his fangs. <i>“A metal fish and foolish sky-creature, lost in the woods.”</i>");
	output("\n\n<i>“We should teach them a lesson.”</i>");
	output("\n\n<i>“We should.”</i>");
	output("\n\n<i>“We shall.”</i>");
	output("\n\n<b>It's a fight!</b>");
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc,azra);
	CombatManager.setHostileActors(new NaleenBrotherA, new NaleenBrotherB);
	CombatManager.victoryScene(winVsNaleenBros);
	CombatManager.lossScene(loseToNaleenBros);
	CombatManager.displayLocation("NALEEN BROS");
	clearMenu();
	addButton(0,"Next",CombatManager.beginCombat);
}

/*Naleen Brothers Fight:
//Naleen A: Zilmusk bombs.
//Beaten by Physical or psychic only.
A naleen circles on the right. His build is typical of the kitty-snakes of Mhen'ga: snake from the waist down and furry, humanoid feline from the waist up. Sharp-clawed fingers wiggle eagerly at the sight of you, darting to a bandoleer of amber-colored bottles that ring his torso as if he cannot wait to unleash whatever is contained within. His ears are alert and playful. His dicks are too, jutting free from a reptilian slit to stab accusingly in your direction.

//Naleen B:
//Beaten by lust. Resistant to physical and psychic.
One of the naleen brothers holds the left flank of the jungle against you and Azra. He appears genuinely irritated by your presence, his ears flat back against his jet-black hair. His claws and fangs are clearly visible, brandished in an attempt to cow you into submission by threat alone. Behind him, his tail swishes angrily. A satchel bounces on his far hip, and judging by the way he holds it, he wants to keep it far from your reach.
*/

public function showNaleenBros():void
{
	showBust("NALEEN_BROTHER_A","NALEEN_BROTHER_B");
	showName("NALEEN\nBROS");
}

//Lose The Fight
public function loseToNaleenBros():void
{
	clearOutput();
	showNaleenBros();
	output("The naleen close in. One for you, one for Azra");
	if(azra.lust() >= 100) output(", who is frantically jacking off an enormous boner.");
	else output(", who is still too dazed to protest the removal of her crotch plate or the sudden erectness of her enormous boner.");

	output("\n\nAn uncorked bottle hits the ground next to you. Then another. Then another. Yellowish mist issues forth from each, swaddling you in a lingering, sweet scent. The scent of concentrated zil pheromones is inescapable");
	if(pc.lust() >= pc.lustMax()) output(", not that it matters, aroused as you already are. You flare your nostrils and drink it in, openly touching yourself and looking up in undisguised lust.");
	else 
	{
		if(pc.hasAirtightSuit()) output(", especially once your [pc.armor] is pulled back to exposed your head.");
		else output(".");
		output(" You hold your breath for a few seconds before simply giving in, breathing deep of the corrupted atmosphere. Stars, does it make your <i>horny</i>. Your blood burns. Your loins enflame. A blizzard could roll in, and you wouldn’t feel the snow for how wantonly aroused you have become.");
	}
	output(" He... can fuck you if he wants. Your mouth, your ass");
	if(!pc.hasVagina()) output(", whatever");
	else output(", your [pc.vaginas]");
	output(". He can have you anywhere, so long as you do something to sate this molten desire.");
	output("\n\n<i>You need it.</i>");
	output("\n\nHalfway hidden behind a tree, you hear that Azra is in a similar state. She pants and moans, lilting voice raises in mixed sounds of protest and pleasure... then apology. She’s apologizing for invading the naleens’ planet even as she strips out of her armor, leaning how whimpering lips against one of his doubled dicks, the glossy curve of her inky maw begging for mercy with tender touches to his purple cock.");
	output("\n\nThe savage naleen groans in pleasure, whispering something as he nods his head.");
	output("\n\nAzra goes right to work with a bright red organ - her tongue, you belatedly realize. It slithers out and wraps around one cock, then the other, revealing another inch of gleaming shaft-slurping muscle with every passing second. It forms a twisted helix around both members, weaving them closer and closer together until thin bands of tongue are grinding against both, slipping and sliding in alternating directions. It is the naleen’s turn to groan in mindless bliss, this time.");
	output("\n\nAzra, through it all, masturbates herself, at first stroking her dick, then diving deeper, hands disappearing below her pendulous balls. Her arms flex with the effort of savaging her pussy. You can only assume she’s at least three digits deep inside herself. Ribbons of pre cascade from the rounded crown of her dick. The tendrils around it, upon contact with the sloppy lubricant, go wild, slapping into the shaft. They must be stinging it; it grows harder and firmer before your eyes, and Azra’s wantonly curling tongue accelerates at the same pace.");
	processTime(25);
	pc.lust(200);
	clearMenu();
	addButton(0,"Next",loseToNaleenBrosHarder);
}
public function loseToNaleenBrosHarder():void
{
	clearOutput();
	showNaleenBros();
	output("A bottle is uncorked under you nose, and you nearly cum from the smell alone. That rapturous, sweetened gas has you shivering with excitement, and what’s happening to Azra isn’t helping any. You’re too addled to care that you didn’t have a choice in the matter, that she didn’t either. All you can see is the sinful exchange of bodily fluids, the way her tongue makes one dick after another bob into her mouth so that she can harvest the creamy drippings from the tips.");
	output("\n\nUntil your sight is blocked by cock. Not just one, but two. Your naleen has grown impatient, his dicks woefully unsucked.");
	if(pc.isBimbo()) output(" Your mouth waters so heavily that drool slips from the corner of your [pc.lips]. They look so fucking good. Why aren’t they inside you already?");
	else if(pc.isBro()) output(" You grunt in instinctive appreciation, mouth watering. Dick wouldn’t usually get you going this easily, but these ones look pretty cute, all things told.");
	else output(" You feel like you shouldn’t be quite so excited at the prospect of getting them in your lips, but then the overwhelming arousal wads that idea up and tosses it in the wastebin.");
	output(" You look up in time for the kitty-snake to put his hand on your head and guide you forward. First one pointed tip meets your [pc.lips], then the other. Each time, you offer nothing but encouragement, opening wide to take them deep, humming in near contentment at the opportunity to wiggle your tongue against the musky jungle rod.");
	output("\n\nThere’s no balls to fondle, but there is something else, something your nose dips into every time you take him to the base: his slit. The naleen’s slit is even muskier than his lengths, laden with different, more bestial pheromones. You flick your [pc.tongue] in the next time you slide down a shaft, and the naleen smashes your head hard against his scaled waistline, giving you a deeper sample. He all but loses control at the slightest probing into his twin-cocks’ home. When you thrust your tongue... or a finger... in, he cries out and falls to the floor, dragging you with him.");
	output("\n\nYou wouldn’t have it any other way now that you’re focused utterly on sucking snake-dick. From atop him, you can bob your head however you want, kiss his concealing slit with your lips, even finger him if you want. And you do. You stuff two digits into his hole, one above and one below, then work your tongue back and forth between them, circling around his quaking cock-flesh. The naleen’s smooth-scaled hips lurch upward, but you ride him with like your [pc.lips] are sewed to his needy loins, either incapable or unwilling to be bucked off.");
	processTime(20);
	pc.lust(20);
	clearMenu();
	addButton(0,"Next",loseToNaleenBrosHardest);
}

public function loseToNaleenBrosHardest():void
{
	clearOutput();
	showNaleenBros();
	output("Azra goes off well before you or either naleen. You can hear it, barely, over the sounds of your frenzied face-fucking. The loud wet slap of volleys of seed impacting tree bark is unmistakable. So is the keening wail of a woman who is cumming so hard she’s liable to get addicted to it.");
	output("\n\nYou look, out of the corner of your eyes.");
	output("\n\nThe siren’s thighs are slick with her girlcum. Her eyes have rolled back, overwhelmed by the feelings her quivering body is experience. Her cock is still shooting too. Creamy spunk messily slops everywhere, falling in small Azra-made lakes on the forest floor. She seems like she could orgasm forever, the way she is carrying on. Somehow, the twirling length of her tongue keeps moving, though it is no longer sliding about in a sensuous cock-massage. It is tweaking and jerking, violently jacking off a naleen who looks like he’s incapable of understanding how he’s feeling so much pleasure.");
	output("\n\nThe cat-snake’s eyes roll back a moment before one of his purplish shafts sprays onto Azra’s shoulder, painting her golden skin and glimmering locks in liquid ivory. Her throat bobs, swallowing the rest while her own turgid shaft leaks its last few droplets.");
	processTime(4);
	pc.lust(20);
	clearMenu();
	addButton(0,"Next",loseToNaleenBrosHardestWithAVengeance);
}

public function loseToNaleenBrosHardestWithAVengeance():void
{
	clearOutput();
	showNaleenBros();
	//Hascock
	if(pc.hasCock())
	{
		output("Fuuuuuck, your [pc.cocks] ");
		if(pc.cockTotal() == 1) output("is");
		else output("are");
		output(" jumping wildly, flexing and relaxing, trying to squeeze the [pc.cumNoun] out of your [pc.balls] in a final moment of hands-free orgasm. You’re so hard that it feels more like you’ve got ");
		if(pc.totalCocks() == 1) output("an iron bar");
		else output("iron bars");
		if(pc.legCount > 1) output(" between your [pc.legs]");
		else output(" down below");
		output(". You hollow your cheeks and suck, flexing your [pc.cocks] at the same time. It’s incredible, being so hard and so full of dick, feeling the pre dribble out of you and into your mouth, like you’re just a tube connecting one dick to another, taking in and putting out [pc.cumVisc] juices.");
		if(pc.hasVagina()) output("\n\n");
	}
	//Vagina
	if(pc.hasVagina())
	{
		if(pc.wettestVaginalWetness() >= 4) output("[pc.GirlCum] is getting everywhere. You feel like a faucet, like someone turned you on and just left you running forever without putting a dick in the right hole to plug you up... plug you up so fucking good. You’re more pussy-juice than [pc.boyGirl] now, more aching quim and everlasting desire than person. You rock your [pc.hips], leaking and fountaining, on the edge of orgasm. The humid air blowing across your lips is enough to make you release tiny squirts. The contractions of your hungry muscles rubbing your lips together to the timing of your sucks... It’s too much.");
		else output("Feminine moisture is getting everywhere. You feel broken, like you don’t remember how to be anything other than being turned on. Like you’d let him fuck you in the pussy right now. Like you’re so wet anyone could fuck. Bareback, condom, whatever, just so long as somebody fucks you. The air itself feels like it fucks you. The smallest humid breeze is a tongue on your [pc.clit]. The spasmodic clenching of your thighs squeezing your netherlips together is like world-class oral. You can hardly stand how good it feels.");
	}
	//Merge any genitals.
	if(pc.hasGenitals()) 
	{
		output("\n\n");
		output("The naleen grabs your arm. You aren’t sure where he got the strength, and he bites you, hard. Needle-like fangs sink into your flesh, pumping his venom into you. Your muscles slacken. Your pulse races. Your [pc.lips] feel like pussy lips all their own, pointlessly guarding the wide-open muscles of your throat. Swallowing him up, you feel your [pc.crotch] quiver in aphrodisiac-induced ecstasy, and then you cum.");
		output("\n\nYou cum at the taste of cock on your tongue. You cum at the feeling of naleen venom coursing into you. You cum at the way ");
		if(pc.isBimbo()) output("his dick slides inside you without a hint of gag reflex");
		else output("his venom obliterates your gag reflexes");
		output(". It’s such a powerful orgasm that for a moment you forget how to suck, but soon enough you recover. You put every ounce of orgasmic energy into pleasing your naleen lover, doing everything you can to share the blissful experience with him.\n\n");
	}
	//No genitals start here.
	output("Feverishly jacking off the naleen with one hand, you continue to fingerfuck him with the other. Your [pc.lips] slide back and forth, your [pc.tongue] plunging deep");
	if(pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output(" before looping around him, sliding over every inch of hypersensitive slit");
		output(". It this is how the naleen intended to teach you a lesson, they’ve either failed or taught you that sucking cock is really, really fun.");
	if(pc.isBimbo()) output(" Joke’s on them, you’ve always known that. Dick is the best!");

	output("\n\nHe locks up, back arching, lifting you into the air. His creamy kitty-seed pours into your vacuously sucking throat to be happily devoured, the spare dick spraying the rest across your face.");
	if(pc.isBimbo()) output(" You make sure to get some in your hair too. That’ll be like, way hotter.");
	output(" You don’t stop sucking, not until he stops feeding you cum and pulls himself out from beneath you.");
	if(pc.isSquirter() || (pc.hasCock() && pc.cumQ() >= 1000)) output(" Wow, the ground is really soggy.");
	applyCumSoaked(pc);
	output("\n\nYou close your eyes from exhaustion, just for a minute.");
	processTime(20);
	pc.loadInMouth(enemy);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",loseToNaleenBrosEpilogue);
}

public function loseToNaleenBrosEpilogue():void
{
	clearOutput();
	showAzra();
	output("Azra shakes you awake some time later. <i>“Come on, we have to go.”</i>");
	output("\n\nYou stumble up, still covered in naleen-spunk, noting that she’s just as messy.");
	output("\n\n<i>“No way we can pull this now. Let’s head back to the ship and regroup. We can try again later.”</i>");
	if(pc.isBimbo()) output("\n\nAwww, but you just gotta suck a dick! <i>“Fiiine.”</i>");
	else output("\n\n<i>“Yeah,”</i> you agree.");

	//bimbo
	if(pc.isBimbo()) output("\n\nShe doesn’t stop you from licking the excess off her, though her blush is a sight to see.");
	currentLocation = "SHIP INTERIOR";
	generateMap();
	flags["AZRA_EXP_FAILED"] = getPlanetName().toLowerCase();
	azra.azraCombatCleanup();
	CombatManager.genericLoss();

}

//Win vs NaleenBros
public function winVsNaleenBros():void
{
	clearOutput();
	showNaleenBros();
	showName("VICTORY:\nNALEEN BROS");
	output("The last naleen goes down in the dirt at last.");
	if(azra.HP() <= 1) output(" Azra struggles up to her feet, rubbing the back of her neck in pain. <i>“Good job.”</i> She puts a green-colored ointment on a bruise. <i>“I knew this had to be a team effort.”</i>");
	else if(azra.lust() >= azra.lustMax()) output(" With the fighting over, Azra slowly comes to her senses. You aren’t sure how she packs her pant-ripping python back into her armor without some kind of pocket dimension to store it in, but she does. <i>“Sorry about that, Captain,”</i> Azra says, blushing. <i>“I don’t know what would have happened if you weren’t here to protect me.”</i>");
	else
	{
		output(" Azra ");
		if(azra.hasStatusEffect("cock out")) output("tucks away her dick and ");
		output("nods respectfully. <i>“Good thing I had an ace in my back pocket, eh Captain?”</i>");
	}
	output("\n\nYou nod. <i>“");
	if(pc.lust() >= 50 && pc.HP()/pc.HPMax() < 0.5) output("I’m going to need a minute.");
	else if(pc.lust() >= 50) output("I’m going to have to let off some stress before we move on...");
	else if(pc.HP()/pc.HPMax() < 0.5) output("Those two packed a punch. Got anything in that pack of yours to get me back on my feet?");
	else output("So what’s next?");
	output("”</i>");

	//Uninjured/Lowlust:
	if(pc.lust() < 50 && pc.HP()/pc.HPMax() >= 0.5) output("\n\nAzra positively beams. <i>“So you’re courageous on top of being good in a fight? I like that.”</i> She she steps over one of the defeated naleen and into the jungle, glancing back over her shoulder to watch you. <i>“We find the Fuck-Lilies. Come on, we’re close.”</i>\n\n");
	//Else
	else
	{
		output("\n\nThe sharky scientist reaches into her bag. <i>“I have just the thing.”</i> She pulls out ");
		if(pc.HP()/pc.HPMax() < 0.5) 
		{
			output("an ointment");
			if(pc.lust() >= 50) output(" and ");
		}
		if(pc.lust() >= 50) output("a stoppered vial");
		output(". <i>“");
		if(pc.HP()/pc.HPMax() < 0.5) 
		{
			output("This ought to patch up your wounds. A rare extract I isolated from a carnivorous plant. Don’t worry, I isolated it from the poisonous contaminants.");
			if(pc.lust() >= 50) output(" Now the vial...");
		}
		else output("This vial...");
		if(pc.lust() >= 50) output(" it has a sample of a rather... pungent pollen. I wouldn’t recommend sniffing it in ordinary circumstances, but it ought to clear your head.");
		output("”</i>");
		output("\n\nYou hesitantly accept the gift");
		if(pc.lust() >= 50 && pc.HP()/pc.HPMax() < 0.5) output("s");
		output(". <i>“You sure this is safe?”</i>");
		output("\n\n<i>“Positive,”</i> Azra retorts. <i>“Tested ");
		if(pc.lust() >= 50 && pc.HP()/pc.HPMax() < 0.5) output("them");
		else output("it");
		output(" myself.”</i>");
		output("\n\nOn that ringing endorsement, you make use of her ");
		if(pc.HP() / pc.HPMax() < 0.5)
		{
			output("ointment");
			if(pc.lust() >= 50) output(" and ");
		}
		if(pc.lust() >= 50) output("smelling... pollen");
		output(".");
		if(pc.lust() >= 50) output(" That smell... that smell will haunt your dreams. It punches you square in the nose and knocks you off your feet. You nearly sick up a time or two, but at least you aren’t so turned on any more.");
		else output(" While the ointment does seem to mend your wounds, the greasy texture is something you could do without. The scent of half-rotten grass clippings is far from appealing.");
		output("\n\n<i>“Come on,”</i> Azra bids, stepping over one of the defeated naleen. <i>“We’re getting close.”</i> She lifts a frond and looks back over her shoulder. <i>“I doubt I’ll make it without my protector.”</i>\n\n");
		pc.HP(pc.HPMax());
		pc.lust(-55);
		processTime(5);
	}
	processTime(4);
	azra.azraCombatCleanup();
	CombatManager.genericVictory();
	eventQueue.push(neinNeinNeinTailsFight);
}

//9-Tails Protection Fight
public function neinNeinNeinTailsFight():void
{
	clearOutput();
	showBust("AZRA", "ZIL9TAIL");
	showName("9-TAILED ZIL\nENCOUNTER");
	output("Clinging vines and tangles of narrow tree trunks give way at last to a wide clearing filled with strange-looking flowers - and crude huts on the other side. This must be the flower patch you were looking for, but it’s in rough shape. The Fuck Lilies are almost universally brown and wilted. Their stalks are spindly. The soil below is brackish. There’s only one place where they have a healthy pink glow: on the edge of the village.");
	output("\n\nAzra creeps up next to you. <i>“Oh no...”</i> she whispers, aghast. <i>“I was right. They’re dying faster than I thought too.”</i> Her eyes flick toward the village. <i>“Cunt snakes alone couldn’t have done this. Why aren’t the zil feeding them?”</i>");
	output("\n\nThe answer reveals itself a minute later in the form of a swaggering zil male. A bundle of nine voracious cunt-snakes have affixed themselves to his ass. Even now, one of the pussy-packing tentacle tails is curled to reach between his legs where it vigorously milks him of his sugary sap. With that many parasitic seed-drinkers affixed to him, he must be servicing the entire tribe, a role he relishes, judging by the contented look on his face. No wonder the flowers are starving!");
	output("\n\n<i>“I was right! Sort of...”</i> Azra looks like she isn’t sure to be proud of her deductions or saddened by the loss of a native species. <i>“We have to save them, [pc.name]!”</i>");
	output("\n\nYou point out that she can’t save anything with that Zil there.");
	output("\n\n<i>“Then you distract him while I transplant a few samples. Use that charm of yours. Maybe you can keep him from summoning the entire tribe.”</i> Azra implores, <i>“This is for science, Steele!”</i>");
	output("\n\nThat sounds like a terrible plan, but there aren’t many other options. How do you want to play this? You could try to distract him with conversation, attack him, ");
	if(pc.hasCock()) output("offer to feed him your delightful off-world seed, ");
	output("or try to lead him into the jungle on a wild zil chase.");

	processTime(10);
	//[Talk] [Attack] [Feed] [Jungle]
	clearMenu();
	addButton(0,"Talk",nineTailZilIntro,"talk");
	addButton(1,"Attack",nineTailZilIntro,"attack");
	if(pc.hasCock()) addButton(2,"Feed",nineTailZilIntro,"feed");
	else addDisabledButton(2,"Feed","Feed","You need a penis for this.");
	addButton(3,"Jungle",nineTailZilIntro,"jungle");
}

//All choices intro:
public function nineTailZilIntro(choice:String = "talk"):void
{
	clearOutput();
	show9Tail();
	output("You nod to Azra and circle closer to the village, distancing yourself to give her some cover before you emerge. Dessicated flowers crackle under your [pc.feet] as you close in, and the infested zil sultrily spins about. He’s handsome, for a zil, his armor plates fully retracted to expose as much of his svelte form as possible.");
	output("\n\n<i>“Need some rel-hey hey hey! Whoa!”</i> He steps back, tail slipping off his dick to join its sisters in waving behind in him alarm. <i>“You trespass upon our grounds! This is a violation of the Behrt accord!”</i> He starts to raise his hand to his mouth.");

	//Attack
	if(choice == "attack")
	{
		output("\n\n<i>“Oh, you’re too much of a wimp to take on one single off-worlder? Did gluing all of those pussies on your ass turn you into one too?”</i>");
		output("\n\nHe slowly lowers his hand. His face settles into a scowl. <i>“When I’m done with you, you’ll wish I had summoned my village.”</i> A stun-gun slips into his hand from somewhere. <i>“And when your spirit is broken, you can house more of my pets. Yes...”</i>");
		output("\n\nWhile the angrily buzzing alien closes in on you, Azra circles to the other side of the clearing to approach a particularly vibrant flower specimen. You’d better win, for both sakes.");
		//Fite me bro
		processTime(3);
		zil9tailFightGo();
	}
	//Jungle
	else if(choice == "jungle")
	{
		output("\n\n<i>“Fuck your accords. Now that I’ve found your village, I’m going to bring an army back with me to torch it!”</i> You turn tail and sprint for the jungle edge.");
		output("\n\n<i>“No!”</i> screams the zil, moments before he takes the bait. His chitinous feet thump heavily through the flower patch as he chases you into the woods.");
		//Low reflexes
		if(pc.reflexes() + rand(20) + 1 < 10+8)
		{
			output("\n\nHe’s fast. Faster than you could’ve imagined with all the extra weight on his ass. He doesn’t quite fly, but his fluttering wings give him the extra edge to run you down before you get very far. You make one last attempt to zig and zag between two moss-covered trees, but he’s more maneuverable by far and shoulder checks you before you can round the second one.");
			output("\n\nYou tumble through enough dead leaves and dirt to make you look like a long-dead tree when you stagger up to your [pc.feet]. The snake-infested zil is brandishing a stun gun and blocking your escape, but at least you’re far enough from the village that he can’t call for help.");
			output("\n\nYou’ll have to fight him to buy Azra time.");
			processTime(3);
			zil9tailFightGo();
		}
		//High reflex
		else
		{
			output("\n\nHe’s fast. In the open, he closes most of the distance, aided by the fluttering of his wings. You make it into the forest before his chitinous claws can latch onto you. With the trees in abundance, you use their bulk to deny him his advantage in raw speed by rapidly changing direction, forcing him spring between them to keep up. Still, he remains hot on your heels, the incessant buzzing of his wings a constant reminder that the angry alien could catch you at any moment.");
			output("\n\nFrom that terror comes adrenalin, and with adrenalin comes speed. You double your evasive tactics, springing from tree to tree. When that doesn’t work, you slide under low vines and duck into denser foliage where his wings will count for nothing. There, you finally have the advantage. His footfalls sound farther and farther away as you plunge deeper and deeper into the dense jungle.");
			output("\n\nA few minutes later, you’re relatively sure you’ve lost him. You double back around, using your Codex to keep from getting lost. You jump at every buzzing insect that flies by, but the infested zil is well and truly behind you.");
			output("\n\nYou emerge from the woods to find Azra in the middle of packing away a brightly colored flower.");
			output("\n\n<i>“[pc.name]! I was so worried he was going to catch you,”</i> Azra says, scaled tail wagging behind her. <i>“Let’s get out of here before he comes back.”</i>");
			output("\n\nYou give her an affirmative nod and leave for Mhen'ga. On your way back, you wonder if the zil will figure out that it was all a ruse. Probably not. He didn’t seem like the type to miss one flower.");
			processTime(30);
			clearMenu();
			addButton(0,"Next",azraMhengaMissionEpilgue);
		}
	}
	//Talk
	else if(choice == "talk")
	{
		output("\n\n<i>“Wait!”</i> You hold your arms out apologetically.");
		//No new PG. Intelligence fork.
		if(pc.intelligence() + rand(20) + 1 < 10+3)
		{
			output(" <i>“Uh....”</i> You rack your brain for something to say. <i>“Well... uh... Huh. I really should have thought about this in advance.");
			if(pc.isBimbo()) output(" You’re sexy, though!");
			output("”</i>");
			output("\n\nInstead of calling for help, the zil slaps his palm into his face, chitin clacking noisily. Behind him, the tails hungrily slide against one another, and when his fingers fall away, he’s smiling devilishly. <i>“You’re too stupid to be a threat to us.”</i> He steps closer. <i>“And if I take you down myself, I can keep you as my toy. You could be a good host, tend to my brothers while I rest, so many of my children nesting on you. Yes...”</i> He pulls out a stun gun. Where did he get that?");
			output("\n\nAzra made good use of your distraction to approach the flower patch from the other side, and she gestures for you to keep stalling as she nods next to a particularly vibrant specimen.");
			output("\n\nYou’ll have to fight!");
			processTime(3);
			zil9tailFightGo();
		}
		//Success!
		else
		{
			output(" <i>“I had to get a closer look at you. I’ve never seen anyone quite like you before.”</i> You gesture at him, waving your hand at his tails. <i>“What you have done with those snakes... it’s incredible. How did you get so many? I thought they limited themselves to one to a host?”</i>");
			output("\n\nThe zil leans back, eyes wide. <i>“You... approve?”</i> His antennae twitch, and his expression twists into a sly smile. <i>“I suppose even a skyling can see the beauty in this.”</i> One slavering cunt-snake slurps its way back down his dick while he talks, lending his voice a small hitch of pleasure. <i>“I can feel more pleasure than any creature in the jungles. Only the predator pitchers are my equals, barely. And I can give my tribe relief. My entire tribe, with just me.”</i>");
			output("\n\nNow that he’s talking to you, the words spill out of the infested zil. He goes on to describe just how he’s gotten so many snakes attached to himself. Apparently the secret is to hand-raise the offspring, then entice themselves to attach alongside their mother. It can be a trying process, but one that results in the <i>most amazing</i> orgasms ever.");
			output("\n\nYou feign interest. It isn’t hard; his bragging is packed full of information on the parasites that wouldn’t show up in any extranet article.");
			output("\n\nMeanwhile, Azra has finished extracting the plant. She slips the containment vessel into her pack, flashes you a thumbs up, then fades into the foliage. For a big girl, she’s surprisingly good at hiding.");
			output("\n\n<i>“Perhaps you should come to the village, starling. We could have-”</i>");
			output("\n\n<i>“No thanks,”</i> you interject, giving him a friendly wave. <i>“I just remembered I left my ship idling. Have fun!”</i>");
			output("\n\n<i>“You can’t... just... wait!”</i> He calls after you, though he makes no move to pursue you.");
			processTime(20);
			clearMenu();
			addButton(0,"Next",azraMhengaMissionEpilgue);
		}
	}
	//Feed - reqs penor
	else if(choice == "feed")
	{
		output("\n\n<i>“But I have so much to feed you.”</i>");
		if(!pc.isCrotchExposed()) output(" You thrust your hips at him.");
		else output(" You pull your [pc.crotchCovers] open.");
		output(" <i>“The way I see it, you could use all the dick you can get.”</i>");
		
		//1 penor fail:
		if(pc.cockTotal() == 1)
		{
			output("\n\n<i>“You think to tempt me with a single offering when I have the bounty of my village at my beck and call?”</i> He steps closer, tails waving menacingly. <i>“You think that your sexual submission would lead to me standing idly by? You think that I can’t come up with a better plan for you?”</i> All nine tails spread out in a fan, like a peacock’s. <i>“You could be a good host. Our village is growing. Once the snakes have you, you will see your place.”</i> He pulls out a stun gun. Where did he get that?");
			output("\n\nAzra made good use of your distraction to approach the flower patch from the other side, and she gestures for you to keep stalling as she kneels next to a particularly vibrant specimen.");
			output("\n\nYou’ll have to fight!");
			processTime(3);
			zil9tailFightGo();
		}
		//2+ dix
		else
		{
			flags["FED_9TAIL"] = 1;
			output("\n\n<i>“Oh.”</i> He tilts his head, eyes flicking back and forth between your [pc.cocks]. <i>“That is impressive.”</i> The parasitic tails strain toward you. <i>“Very impressive.”</i> His hips lurch, more beholden to the impulses of his sinuous passengers this his own nervous system. You spot a trickle of pre-cum oozing down the length of his dick. <i>“Yes, yes... okay. I can overlook your transgressions... for a price.”</i> The chitin-armored boy-toy licks his lips as if he’s the one thirsting for jizz, not his tails. <i>“Kneel.”</i>");
			output("\n\nAzra makes good use of your distraction to circle around to approach the flower patch from the other side, and though she quirks an eyebrow at your tactic, she gestures for you to keep him busy as she kneels next to a particularly vibrant specimen.");
			output("\n\nYou drop to your knees as you are bid. There’s no hint of deception in the zil’s expression, only lust. Stroking your [pc.cocks] slowly, you tease the poor guy, caressing one hard dick-tip, then another");
			if(pc.cockTotal() > 2) output(", and so on");
			output(", feeding him one enticing visual after another.");
			output("\n\nInsatiable, alien desires grab the infested zil by the balls and drag him right up to you, leaking and swaying, nine tails thrashing against one another for the first shot at your [pc.cock]. He runs his hands from his chest down to his crotch, stopping to give his bunched foreskin a playful tug. Trickles of honey leak out of it.");
			output("\n\n");
			if(pc.isBimbo()) output("You lick your [pc.lips]. His sweet-smelling dick is right in front of your nose. How could you <i>not</i> suck it? He gasps in that delightful way that boys do when you seal your mouth around his manhood, but he doesn’t protest. They never do, especially not when you’re slipping your tongue out to lovingly cradle their balls. Mmm... balls.");
			else output("His sweet-smelling dick is right in front of your face, practically swimming in weaponized pheromones. If you thought you were hard before, you were wrong. Your [pc.cocks] are iron bars, heaving powerfully with each breath of the zil’s powerful aroma. Whatever your thoughts on dicks, you find yourself quite liking this one. You rub your cheek against it, sniffing deep into his crotch. The super-concentrated pheromones leave you dizzy and whimpering.");
			output("\n\nIt comes as a small surprise when a tight tunnel of warm, wet tailcunt envelops your [pc.cock]. Not enough to stop you{ from bobbing back and forth on his yummy honey-cock, of course. You just moan into the dick, letting your ecstatic vibrations help him along on his journey to a thick, creamy orgasm./ from nuzzling into his crotch, though you do let out a brazen moan.} You tip your head back as a second coils around your [pc.cock " + 1 + "].");
			if(pc.cockTotal() > 2) output(" A third slithers over your [pc.cock " + 2 + "].");
			if(pc.cockTotal() > 4) output(" You lose count not soon after, aware that succulent folds are sliding over your [pc.cocks] but unable to identify any particular sensation as the arrival out of the all-consuming pleasure.");
			output(" They pound back and forth on your manhoods with zero coordination. Each of the snakes has its own rhythm, listening to nothing but its individual desire to swallow your jizz. Inside, their flesh undulates in incredible waves, rolling from the bases of your tail-bound phalli to their throbbing tips, milking you as only a creature that evolved to harvest seed possibly could.");
			output("\n\nYou try to hold out as long as possible, but there’s no chance. Not with your nose full of the zil’s scintillatingly erotic scent and dicks pumping your [pc.cocks] with near-mechanical efficiency. Dribbles of girlish goo");
			if(pc.balls > 0) output(" roll down your [pc.sack]");
			else output(" trickle down your thighs");
			output(" from the frenzied snake-sucking. Your [pc.cocks] do what they were meant to do: throb and ache. Cumming is inevitable. They flex, drooling pre, and the urge to dump a huge load of [pc.cumNoun] into the slithering succubi manifests in one penultimate spasm.");
			//Less than ‘uge
			if(pc.cumQ() < 2000) 
			{
				output("\n\nMuscular contractions carry your [pc.cumNoun] along length of the snakes. You can make out the bulges where the tubular parasites have isolated a wad of your load to transport deeper into themselves, devouring your genetic material like a tasty snack. The portions embedded on you force themselves down harder, splaying their entrances against your crotch so that every single inch of spurting dick can be efficiently milked. Not a single drop of your release is wasted, not even as the snakes withdraw.");
				output("\n\nYour spent members glisten with a coating of the snakes’ juices in the open air.");
			}
			//Big jizzm
			else
			{
				output("\n\nThe snakes are woefully unprepared for your first eruption of [pc.cum]. Their bodies distend cartoonishly, deformed into spunk-balloons midway down their lengths. That doesn’t stop them from siphoning off what they can. Smaller bulges of your [pc.cumVisc] relief travel along their bodies, but not fast enough. No matter how they clench around your bases, they can’t hold back the [pc.cumColor] tide, not after you fire off spurts two and three, each voluminous enough to turn a traditional condom into a stretched-out balloon. Your hyper-virile [pc.cumNoun] backwashes down your [pc.legs]. It’s a relief, finally spurting out what feels like gallons, reveling in the gurgling sounds of your incredible discharges. Never mind that you’re soaking yourself in spilled seed. <i>It feels good.</i>");
				output("\n\nWhen the snakes withdraw, splashes of excess [pc.cumNoun] drop out of the gaped pussy-snakes. They spasm weakly, then drool some more, unable to capture a single sperm, let along your voluminous deposits.");
			}
			//Merge cummyshotsies.
			//Bimbobeej
			if(pc.isBimbo())
			{
				output("\n\nThrough it all, you never stop sucking. Why would you, when the taste of dick on your tongue makes your own climaxes that much more <i>erotic</i>. You don’t even need the snakes. You could get off on polishing his taste and smell alone. His scent fills your head. The throbbing of his member upon your tongue is mirrored in your own tumescent flesh. When he spurts into the back of your throat, the flavor sets of a second orgasm, smaller than the first but still powerful enough to make your exposed [pc.cocks] erupt with a small, wasted ejaculated. You catch some in your hand to mix with the zil’s honey-spunk. Yum!");
			}
			//Ech
			else 
			{
				output("\n\nYou’re too spent to care when the infested zil has an orgasm of his own, painting your cheek in amber honey. You blink your eyes closed before his neck rope splashes across your nose and forehead. He finishes himself off by dumping a thick wad of the stuff ");
				if(pc.hasHair()) output("into your [pc.hair]");
				else output("on your head");
				output(", a satisfied smile on his face. He pumps his foreskin along his length as his orgasm winds down. Some of the seed collects inside, only to be devoured moments later when a snake throws itself onto his leaking dong.");
			}
			//Merge
			processTime(35);
			pc.orgasm();
			if(pc.isBimbo()) 
			{
				pc.orgasm();
				pc.loadInMouth(zil9tails);
			}
			clearMenu();
			addButton(0,"Next",nineTailBJEpilogue);
		}
	}
}

public function zil9tailFightGo():void
{
	flags["FOUGHT_9TAIL"] = 1;
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(new Zil9Tail);
	CombatManager.victoryScene(CombatManager.genericVictory);
	CombatManager.lossScene(loseToCunnerSnakers);
	CombatManager.displayLocation("9-TAILED ZIL");
	clearMenu();
	addButton(0,"Next",CombatManager.beginCombat);
}

public function show9Tail():void
{
	showBust("ZIL9TAIL");
	showName("9-TAILED\nZIL");
}

public function nineTailBJEpilogue():void
{
	clearOutput();
	showBust("AZRA", "ZIL9TAIL");
	showName("\nSUCCESS!");
	output("<i>“Not bad,”</i> the infested zil pants as he attempts to master himself. <i>“Perhaps you could be of use. My pets could use a plentiful food source for their children... and you fit the bill perf-”</i>");
	output("\n\nA branch breaks across the back of his head. He drops to the ground like a bag of wet noodles, assuming nine of the noodles were still wriggling afterward.");
	output("\n\n<i>“Come on! We’ve gotta go!”</i> Azra pulls you to your feet, then steps back after a quick glance to your soiled loins. She radiates discomfort for a long moment, then turns away, loping back toward Esbeth on long, loping strides.");
	output("\n\nYou take off after her, leaving the unconscious zil alone with his cummy tail snakes. One is pumping his dick, even now.");
	//Escape! epilogue
	processTime(4);
	clearMenu();
	addButton(0,"Next",azraMhengaMissionEpilgue);
}

//Lose to Snaek Bad End
public function loseToCunnerSnakers():void
{
	clearOutput();
	show9Tail();
	output("You collapse");
	if(pc.lust() >= pc.lustMax()) output(" in a heap of writhing, unsatisfied need");
	else output(" under the weight of your injuries");
	output(".");
	output("\n\nThe gloating zil looms over you. <i>“See what your arrogance has brought?”</i> He lifts his foot, then a flash of pain into nothingness.");
	processTime(1);
	clearMenu();
	addButton(0,"Next",nineTailZilBadEnd);
}

public function nineTailZilBadEnd():void
{
	clearOutput();
	show9Tail();
	output("Overwhelming sweetness greets your return to wakefulness - that and the remnants of a nasty headache. More pressingly, you are aroused. Achingly, monstrously aroused, though you lack any understanding as to <i>why</i>. Gasping on your way to full wakefulness, you suck in a lungful so impregnated with rampant honey musk that it makes you cough.");
	if(pc.cockTotal() > 0)
	{
		output(" Your [pc.cocks] trembles");
		if(pc.cockTotal() == 1) output("s");
		output(" in response.");
	}
	else if(pc.hasVagina())
	{
		output(" A ");
		if(pc.wettestVaginalWetness() < 3) output("trickle");
		else if(pc.wettestVaginalWetness() < 4) output("stream");
		else output("gush");
		output(" of girlish excitement leaks out from the scent alone.");
	}
	output(" You moan and reach for your loins");
	if(!pc.hasGenitals()) output(", finding them to be quite bare");
	else output(", discovering your body to be completely bare");
	output(".");
	output("\n\nThe room itself is dark, but you are far from alone. The soft slap of fists pumping foreskin-clad flesh can be heard from all sides, accompanied by muted moans and half-whimpered groans of delight. When you shift position, your hands fall in pools of half-cooled honeyspunk, fragrant and viscous. You swoon, eyes slowly adjusting in time to see a yellow-skinned prick thrusting your way, drooling amber from the copious dickskin.");
	//Bimbo:
	if(pc.isBimbo()) 
	{
		output("\n\nYay! Dick! You should probably be worried about Azra, but you’re just <i>too horny</i> to care, and that cock looks too fucking yummy not to suck. You roll your tongue out like a red carpet and squeak with delight when the anonymous male obliges your dickthirst by pushing his glossy yellow tool inside. He tastes <i>divine</i>: sweet and musky in all the right ways. He’s hard and excited. When you seal your lips around him, his heart beats faster than an out-of-control train, throbbing its passionate tempo through the bulging of his veins upon your tongue. You find out why when you bob your head back and forth on him: he cums.");
		output("\n\nSyrupy wasp-goo pours into your throat, so you take him deep, grabbing him with your slimy hands so that you can thrust his dick directly into your throat. While your esophagus hugs his spurting member like a long lost lover, your eyes roll back in what is sure to be the first of many orgasms. Nothing gets you off quite so easily as being well and truly used, smothered in musky zil-crotch, your cheeks baptized in his pheromones. And there’s so many others. You can hear them, beating off to the sight of you so eagerly debasing yourself.");
		output("\n\nBetter still, you never stop feeling immensely horny, never stop experiencing that desperate urge to consume even more cock. The overwhelmingly potent zilmusk in this room gets stronger with every passing second, and your honey-drizzled maw sags open, begging for the next dick.");
	}
	//Nonbimbo
	else
	{
		output("\n\nYou want to be offended, to turn away or find some way to show your disgust, but you’re too turned on for any such restraint. The soup of pheromones bathing has you so aroused that the oozing prick looks positively appetizing. Sucking it off actually seems... fun... to your ardor-addled mind. You want to lick it, to see if it tastes as good as it looks. You want to suck it, to see if that will cool the raging inferno inside you. Part of you wants to press your nose to his crotch and see if inhaling even more of his cloying pheromones will help you cum.");
		output("\n\nIt comes as no small surprise when the mystery dick slides right through your [pc.lips], nor when you find yourself humming in pleasure at the taste of it - all sweet with a slight undercurrent of tangy salt. What does come as a surprise is the way it throbs within its sperm-soaked sleeve of clinging foreskin, the way its owner groans when you tip forward to fall face-first into his crotch. You can’t help it. You need <i>more</i>. You need to slurp and suck, and suddenly, he’s cumming. Rope after rope of sugary ambrosia is spraying into the back of your throat, forcing you to gulp it down or drown in alien spunk.");
		//Any genitals
		if(pc.hasGenitals())
		{
			output("\n\nFamiliar wetness splashes on your [pc.legs] in the aftermath of the first of what is sure to be many orgasms.");
			if(pc.isSquirter() && pc.hasVagina()) output(" You came so hard you squirted, and still you keep sucking.");
			output(" Any relief it provides is short lived. In your next breath, you slide right back into the grip of desperate lust. Your eyes cross from the overwhelming potency of zilmusk, and your cum-filled mouth sags open, allowing the satisfied male to exit.");
		}
	}
	//Merge bimbo/non forks
	output("\n\nTwo more cocks appear in the periphery of your vision as your eyes adjust to the darkness. You grab them in each hand, double-fisting palmfuls of lusty xeno-dick. They’re already slick with leaking pre or the leftovers of previous orgasms. You’re in no condition to judge, not even when you slip your thumbs inside to smear their juicy leftovers over the trembling crowns. Soft gasps reach your ears just as you’re able to make out their faces. Both are shaking from pleasure, a sight that has you moaning right back at them.");
	output("\n\nFortunately another penis presents itself to you before you’re forced to choose between the two sides. You plunge onto it, any subtlety forgotten in your eagerness to please. You don’t even look up to see what its owner looks like. You just start sucking cock, gripping it with your [pc.lips], sliding your tongue out to caress the cute little balls just below until they pull tight inside their spit-slicked sack.");
	output("\n\n<i>“I knew you belonged on your knees when we met,”</i> a familiar voice says.");
	output("\n\nYou look up, still sucking, to discover that you’re blowing the nine-tailed zil. You don’t stop. Especially not when his pre-cum is so sweet. Behind him, the parasitic pussies thrust outward, each securely ensconcing a zil’s rigid member its silky folds. Still, you keep sucking; your hands keep stroking. <i>These ones are yours.</i> He can’t have them.");
	//Cunt tail
	if(pc.hasCuntTail()) 
	{
		output("\n\n<i>“And you’ve already done me the favor of acquiring a snake of your own. How lovely.”</i>");
		output("\n\nOne of the eager zil takes hold of your tail-mounted vagina and thrusts inside. You nearly bite down on the cock in your mouth in shock but catch yourself at the last moment. <i>Stars, it feels good.</i> Your tongue and hands go wild in response, but it’s your tailpussy that truly occupies your mind. As horny as you are, every thrust inside is an orgasm. Every inch of the zil’s prick feels like it presses in on your mind, leaving an imprint of its veiny features for you to remember for the rest of your days.");
	}
	//No cunt tail
	else
	{
		output("\n\n<i>“And you’re going to look so nice with your new tails.”</i>");
		output("\n\nNew tails? Something sharp bites into you at the end of your spin, and for a moment you nearly bite down on the cock in your mouth. Arousal wins out over pain, however, twisting the unpleasant sensation into something else... something that makes you ever more eager to take in a load, wherever you can. Any place will do, but... behind seems like the way you want it. In your butt or... a tail rears up next to you... your tail. <b>You’ve got a tailcunt now!</b>");
		output("\n\nIt’s ripped out of your vision by an eager zil, something that only bothers you up until the point that his cock slips inside with a lurid squelching sound. <i>Stars, it feels good.</i> Your tongue and hands go wild in response, but it’s your tailpussy that truly occupies your mind. It’s like every thrust inside is an orgasm. Every inch of the zil’s prick feels like it presses in on your mind, leaving an imprint of its veiny features for you to remember for the rest of your days.");
	}
	//Merge
	output("\n\nThe zil on your left cums, and you cum right along with him. His sweet spooge splatters across your naked body. You smear it across your [pc.skinFurScales] in ecstasy. Looking at yourself in the dim light, you look like a glittering golden god" + pc.mf("","dess") + ", an image that solidifies itself when more cum spills onto you from the right. Excess honeyspunk slides between your knuckles, the better to rub onto your other side.");
	output("\n\n<i>“Good pet,”</i> the nameless, nine-tailed zil coos as he too goes off, pulling himself out of your mouth so that he can be the one to paint your face, anointing you with waves of amber ambrosia. He does you the favor of smearing his musky tool over your features, spreading his seed into every crease and pore.");
	if(pc.hasHair()) output(" Your [pc.hair] slicks back under its weight.");
	output(" A mask of golden cum slowly hardens on your face as he withdraws, and it makes the pounding you’re taking from behind so much hotter.");
	output("\n\nYou pant like a dog in heat.");
	if(!pc.inHeat()) output(" For that matter you <b>are in heat</b>");
	else output(" For that matter, you sink deeper into your heat. You aren’t sure if you’ll ever find your way out, no matter how much dick you take.");
	output(" You want to get fucked, and suck, more than anything. Dicks in your mouth, cum in your hair. You want to get up in the morning smelling like half the tribe’s crotches and screw until you smell like the other half’s.");
	output("\n\nCum shoots into your tail, and your eyes cross. You collapse, any control over your motions abandoned in the wake of your parasite’s pleasure. It’s getting pregnant with it; you’re sure of it. Especially now that another zil is taking a turn. They seem endless, parading their hard penises in an endless circle around you. Some of them fuck your friend’s cunt-snakes, but most seem more interested in using you. Waves of syrupy jism cascade over your body. Fuck-hungry boys line up for turns at your creampied tailcunt, yet the insatiable parasite never seems to tire of wringing out more.");
	output("\n\nYou can barely breathe without whimpering and cumming, let alone think. You act on instinct, and your tail’s instincts seem so much strong on your own... Time passes in a sea of climaxes and waves of honey, your body used a receptacle for an entire populace’s lust...");
	processTime(230);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",zil9TailFullGameOver);
}
public function zil9TailFullGameOver():void
{
	clearOutput();
	show9Tail();
	output("When you regain consciousness, you’re somewhere else. Your belly is bloated from all the honey you swallowed, and your tail is swollen and leaking, so fattened that you can only imagine how many eggs are stuffed inside it. With that thought comes a sense of pride, and idle lust.");
	output("\n\nIt’s fortunate that a zil enters your hut, his crotch plates retracting to fill the confined space with your new favorite scent. You’ll find your way out of here after one more fuck... just one more.");
	processTime(200);
	clearMenu();
	addButton(0,"Next",zil9TailFullGameOver2);
}
public function zil9TailFullGameOver2():void
{
	clearOutput();
	show9Tail();
	output("Months crawl by, and more cunt-snakes are affixed to you, usually after you’ve been fucked into unconsciousness. That’s fine though, the new parasites can help you satisfy your growing desires. Sometimes they even let you fuck that suula girl you got caught with so that you can sample a different flavor of jizz. She’s been pretty consistently pregnant ever since they figured out that the kids come out more zil than suula.");
	output("\n\nLife as a fuck-toy is sort of degrading, but you’re taking care of. You don’t need to worry about responsibility or planning. You can content yourself with effortless climaxes and an ever-increasing addiction to honey-cum.");
	//[Bad End]
	kGAMECLASS.badEnd("GAME OVER.");
}

//Zilscunnies Defeated!
public function spankDatZilBut():void
{
	clearOutput();
	showAzra();
	output("As the infested zil ");
	if(enemy.lust() >= enemy.lustMax()) output("sinks to the ground, overwhelmed by the passionate impulses you’ve stirred within him");
	else output("drops to the ground, too well and truly beaten to remain upright");
	output(", Azra trots up, satchel of samples in hand. <i>“Let’s get out of here before any more show up.”</i>");
	output("\n\nShe’s right");
	if(pc.lust() >= 60) output(", much as it pains you to admit it. You’ll have to put your needs on hold till after you get back to safety");
	output(". The entire village could descend upon you in an angry swarm at any time, and that fight was far from silent.");
	output("\n\n<i>“All right, let’s go.”</i>");
	processTime(10);
	azra.azraCombatCleanup();
	output("\n\n");
	CombatManager.genericVictory();
	eventQueue.push(azraMhengaMissionEpilgue);
}

public function azraMhengaMissionEpilgue():void
{
	clearOutput();
	showAzra();
	output("Together, you and Azra beat a hasty retreat through the jungle. Most of the natives seem hesitant to tangle with a pair, and the few that do rise to the challenge are left in the dust. As for the tribe, ");
	if(flags["FOUGHT_9TAIL"] == undefined) output("you see neither chitin nor hair of the aggressive zil. Either they didn’t care to pursue you or haven’t noticed.");
	else output("you doubt anyone will know to look for you for a few hours yet.");

	output("\n\nWhen the clearing surrounding Esbeth comes into view, you both gasp sighs of relief, silently thankful to be under the watchful gaze of ");
	if(flags["MET_PENNY"] != undefined) output("Penny’s auto turrets");
	else output("Esbeth’s automated turrets. Whoever put those up is a saint");
	output(".");
	output("\n\n<i>“That... let’s not do... that again,”</i> Azra pants with exhaustion.");
	output("\n\nYou nod. <i>“The expedition or fighting next to a whole city of potentially angry aliens?”</i>");
	output("\n\nAzra straightens at your question. <i>“The hostile village thing. I’d never leave an entire species all alone, defenseless against extinction. Come on, let’s get back to the ship. I want to give these things a more thorough examination.”</i>");
	currentLocation = "EAST ESBETH";
	generateMap();
	clearMenu();
	addButton(0,"Next",azraMhengaMissionEpilgue2);
}

public function azraMhengaMissionEpilgue2():void
{
	clearOutput();
	showAzra();
	currentLocation = "SHIP INTERIOR";
	generateMap();
	output("Azra unpacks efficiently. Her bag of supplies is dropped into an empty corner. The sample pouch is placed into a vacant spot on her desk perfectly shaped to accept it. You get the impression that she’s spent more than a little time organizing her room to make the most of every meter. She sighs contently once her things are stored and turns to face you, smiling beatifically. <i>“");
	if(flags["FED_9TAIL"] == undefined) output("You were magnificent. I never could’ve done this without you.");
	else output("It means a lot to me that you were willing to do... that for my research. I couldn’t have.”</i> Her eyes flit to your well-used crotch as her cheeks color. <i>“I’d be too embarrassed.");
	output("”</i>");
	output("\n\nSavoring the compliment, you reply, <i>“");
	if(pc.isBimbo()) output("Ooooh, you’re just too cute! Like, isn’t exploring sexy jungles what I’m supposed to be doing anyway? Did you see the dicks on those naleen? Wow. If we get to meet guys like that on every trip, I am sold, sister!");
	else if(pc.isBro()) output("No problem. I get to try those flowers out, right?");
	else if(pc.isNice()) output("It was my pleasure. Somebody has to watch out for the little guys.”</i> You look back at the nine-foot tall giant of a scientist. <i>“And the not-so-little girls.");
	else if(pc.isMischievous()) output("I’m only a part-time rusher. The rest of the time I’m a certified badass, adventure hero, and " + pc.mf("handsome","talented") + " escort to beautiful science-maidens. It’s basically my job to help you out./You’d be surprised what you can do, but don’t sweat it. Having fuckable flowers onboard is sure to be a treat.");
	output("”</i>");
	output("\n\nAzra sweeps you up into a hug. <i>“Of course!”</i> Her golden cheeks flush brilliant orange as she embraces you. <i>“Thank you. Thank you so much.”</i> She pauses, searching your face with her wide, expressive eyes, then makes up her mind about something. That something turns out to be kissing you. The affectionate suula leans in, her plump black lips pressing against yours, gently at first, then with increasing forcefulness. She’s warm and faintly sweet-tasting. Do you resist her advances or welcome them? You aren’t sure how she’ll handle being pushed away.");
	processTime(8);
	pc.lust(3);
	clearMenu();
	//[Resist] [Welcome]
	addButton(0,"Resist",resistAzrasAdvancesYouMonster);
	addButton(1,"Welcome",welcomeToAzraSmoochesBuddy);
}

//Resist:
public function resistAzrasAdvancesYouMonster():void
{
	clearOutput();
	showAzra();
	output("You break away before things can get any more heated. <i>“Whoah, whoah! I didn’t intend... I didn’t want this.”</i>");
	output("\n\nAzra’s arms go limp, dropping you");
	if(pc.tallness < 78) output(" to the floor");
	output(". <i>“Of course. How foolish of me.”</i> She looks away. <i>“It was nothing anyway. I was just a little too excited over our success. Give me some time to make sure the samples are in good shape for transport, and you’re welcome to inspect them yourself.”</i>");
	output("\n\nYou get the sense she’s done talking to you for the time being. <b>Your relationship with Azra is strictly professional.</b>");
	processTime(3);
	flags["AZRA_MHENGAED"] = -1;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
	pc.createStatusEffect("Azra Plant CD");
	pc.setStatusMinutes("Azra Plant CD",60);
}

//Welcome
public function welcomeToAzraSmoochesBuddy():void
{
	clearOutput();
	showAzra();
	output("You push back into her, extending your [pc.tongue] to better taste her. Azra’s lips are so incredibly soft, like luscious pillows, and they taste so very pleasant that you find yourself thrusting deep into her mouth. She responds in kind, and soon the two of you are passionately french-kissing, entwining your tongues as you noisily make out. The more mature woman knows what she’s doing. Her muscular organ seems to know how to respond to your own to make the kiss better... hotter. You rake your hands through her vibrant hair, and she hugs you tighter.");
	output("\n\nAzra breaks to gasp for breath first, and when she does, her eyes suddenly bolt wide open. She abruptly lets you go and staggers back, absolutely crimson in shame. <i>“I’m sorry, I didn’t mean to...”</i>");
	output("\n\nYou shut her up with another kiss, pushing her up against the wall in your eagerness. Azra moans into your mouth as you pin her wrists at her side so that you can do more of what you know you both want, and the kiss continues once more. For a respectable woman, Azra is perfectly wanton. The suula’s wings wrap around your back to hold you in place. They’re soft, warm, and powerful enough to keep you from escaping without a struggle. Not that you would. The only struggling you’re doing is to try and make her moan again, but her armor keeps you from teasing any other part of her body.");
	output("\n\n<i>“C-c-captain!”</i> Azra whimpers, twisting her head to the side while you continue to pepper her with more kisses. <i>“We.. I.. please. A moment.”</i>");
	output("\n\nYou kiss her once more, with enthusiasm");
	if(pc.hasCock() && pc.isCrotchExposed()) 
	{
		output(", grinding your exposed member");
		if(pc.cockTotal() > 1) output("s");
		output(" against her armor");
	}
	else if(pc.hasVagina()) output(", grinding your well-moistened loins against her armor");
	output(", then step back, face flushed red enough to match her own.");
	output("\n\n<i>“Wow.”</i> Azra smoothes her tousled hair. <i>“I liked that. I liked that a lot, but... ummm...”</i> She giggles. <i>“Wow. You must have a lot of practice at that.”</i> The suula coughs and tries to master her surging hormones long enough to properly express her feelings. <i>“But we can’t just start fucking like animals in here");
	if(pc.hasFur()) output(", even if you’ve got enough fur to be counted as a part of the animal kingdom");
	output(". For one, I’m not that kind of girl. Secondly, these samples need proper care and nutrition to keep them from dying. I won’t risk extinction for a fling, no matter how pleasant.”</i>");
	output("\n\nThat sounds perfectly reasonable no matter how your base impulses disagree.");
	output("\n\n<i>“Finally, neither of us will accomplish anything if our faces are glued together for the entire rush, so I propose a more measured solution,”</i> Azra calms, back on familiar ground. Sadly, the cute blush she was wearing for so long has faded like a passing sunset. <i>“We continue to work together for the duration of the rush. Celebratory kisses are fine, but idle salaciousness is straight out.”</i>");
	output("\n\nYou can’t hide your frown at that. You’d like to do more than kiss her someday.");
	output("\n\nAzra gives you a peck on the nose. <i>“And as we accomplish more, maybe we can... afford to spend more time celebrating. In other ways.”</i> She clears her throat. <i>“But for now, just kissing, I think.”</i>");
	output("\n\nYou ");
	if(pc.tallness < 84) output("jump up to ");
	output("grab her by the neck and forcefully kiss her once more, though only for a few seconds this time.");
	output("\n\nBlinking in confusion, Azra’s flush returns. <i>“What was that for?”</i>");
	output("\n\n<i>“Just celebrating an agreement with a very talented suula.”</i>");
	output("\n\nThe grinning scientist’s tail slams into a wall hard enough to bang it like a drum, but she barely reacts to that. She’s too busy grinning like a teenager driving her first hover-car. <i>“Mmmhmm... I should really get these plants taken care of. Once I have them settled in, feel free to inspect them.”</i>");
	output("\n\nYou wave and step out, wondering what other excuses you can find to kiss the motherly suula.");
	processTime(23);
	clearMenu();
	flags["AZRA_MHENGAED"] = 1;
	addButton(0,"Next",mainGameMenu);
	pc.createStatusEffect("Azra Plant CD");
	pc.setStatusMinutes("Azra Plant CD",60);
}

//Azra’s Samples~!
//Plant Samples:
public function azraPlantSamples(back:Boolean = false):void
{
	clearOutput();
	showAzra();
	if(back) output("You change your mind. Is there a different plant you'd like to interact with?");
	else
	{
		output("You let Azra know that you’d like to take a look at some of her samples.");
		//Kissy Azra:
		if(flags["AZRA_MHENGAED"] == 1) 
		{
			output("\n\nGoing beet red, the shark-girl nods. <i>“I’m going to uh... go for a quick walk then. Be gentle, okay?”</i>");
			output("\n\nYou nod.");
			output("\n\n<i>“Okay... I’ll be back in thirty minutes!”</i> The suula scientist sets her watch on the way out.");
			output("\n\nThe door hisses closed behind her. At last, you’re alone. What do you want to inspect?");
		}
		//Fucky Azra
		else
		{
			output("\n\nFanning herself, the shark-girl nods. <i>“I just a feeding myself. I don’t think suula seed is perfect for them, but it does in a pinch.”</i> She glances at her codex. <i>“Thirty minutes ought to be more than enough for my dashing Captain. I barely made it ten.”</i>");
			output("\n\nAzra kisses you on the forehead on her way out the door, tail swishing happily behind her. <i>“Just don’t spend too much time thinking about me while you’re playing with our floral friends.”</i>");
			output("\n\nThe door hisses shut behind her.");
		}
		processTime(2);
	}
	clearMenu();
	addButton(0,"Fuck Lillies",approachFuckLillies);
	addButton(14,"Leave",mainGameMenu);
}

//Fuck Lilies
public function approachFuckLillies():void
{
	clearOutput();
	showAzra();
	output("Since being placed in specially mixed soil, the Fuck Lilies have sprouted like weeds. You select one in particular to approach. The stalk itself is waist-high and extraordinarily sturdy looking, more like a small tree trunk than a flower’s stalk. Atop it sits a huge, violet bloom. The obscene flower looks positively female in every sense, right down to a clit-shaped bump and moist, gently parted lips. Inside that central passage, you can see a bevy of wiggling staman surrounding a larger, flared stalk. The scent that wafts out of that opening is sweet and floral, but undoubtedly sexual. It looks like a carefully designed organic sex toy more than a naturally occurring flower, nevertheless, nature on Mhen'ga has provided it to you.");
	if(pc.lust() < 33)
	{
		output("\n\n<b>You weren't very aroused when you arrived, but the sight and smell has you ready to go.");
		pc.lust(33);
	}
	processTime(1);
	clearMenu();
	if(pc.cockThatFits(700) >= 0 && pc.hasCock()) addButton(0,"FuckWithDick",fuckTheFuckLily,undefined,"Fuck With Dick","Fuck them with your penis.");
	else if(pc.hasCock()) addDisabledButton(0,"FuckWithDick","FuckWithDick","Your member is too monstrous for the smaller flower.");
	else addDisabledButton(0,"FuckWithDick","FuckWithDick","Your need a penis for this.");
	if(pc.hasVagina()) addButton(1,"FuckWithCunt",rideDatFuckLily,undefined,"FuckWithCunt","Ride those wiggly stamen with your pussy.");
	else addDisabledButton(1,"FuckWithCunt","Fuck With Cunt","You need a vagina for this.");
	addButton(14,"Back",azraPlantSamples,true);
}

//Fuck It!
public function fuckTheFuckLily():void
{
	clearOutput();
	showName("FUCK\nLILIES");
	showBust("FUCKLILLIES");
	var x:int = pc.cockThatFits(700);
	if(x < 0) x = pc.smallestCockIndex();
	if(!pc.isCrotchExposed()) output("Undoing your [pc.crotchCover]");
	else output("Hefting [pc.oneCock]");
	output(", you approach the pulsating plant with one thought in mind: fucking it. At the sight of [pc.eachCock], the petals flutter happily, their surface glimmering with moisture in an instant, slick and wet for your pleasure. You lean down to inhale the sweet yet sensual nature of the flower’s aroma, letting it tickle your nostrils as you idly fondle [pc.oneCock]. Your maleness quickly assumes ");
	if(pc.isBimbo()) output("your favorite state");
	else if(pc.libido() < 50) output("an aroused state");
	else output("its favorite state");
	output(" - hard and sensitive, ready to plunge into the nearest set of wet lips with the reckless abandon. At the same time, you can see the wriggling tendrils inside the flower’s vase waving about hungrily.");
	output("\n\nYou ");
	if(pc.isNice()) output("smile");
	else if(pc.isMischievous()) output("chuckle");
	else output("laugh");
	output(" in amusement; who are you to deny it the creamy treat it so richly deserves? Letting go of your [pc.cock " + x + "], you reach around the soft petals to the harder, central bud and slide yourself through the honeyed embraced into the pulsating, tentacled flower-core. Juicy warmth snuggles about your dick, the velvet-soft chamber immediately tightening up while the petals fold in, crossing over one another until they form a tube long enough to swallow you whole. Gentle suction begins to rhythmically tug at your [pc.cockHead " + x + "], swelling you larger and more sensitive inside. Immediately, the tiny tendrils you saw swarming around earlier reach up to massage your cock, slithering across your skin like tiny, sinuous snakes.");
	pc.cockChange();
	output("\n\nIt’s enough to make your [pc.legs] quake, and you slowly slide to the ground. The flower, now a tightly-sealed bulb, sucks hard enough to stay latched onto you as you recline. It bends the stem double, but the resilient plant seems to handle the strain with ease. Rivulets of clear slime escape from the tight seal to run down your ");
	if(pc.balls > 0) output("[pc.balls]");
	else output("[pc.legs]");
	output(" and form a sticky puddle. Now moaning, you grab the stem and start to pump the sheath up and down, using the plant like the cock-toy it was bred to be. Lewd, wet squishes ring out through the air,");
	if(pc.exhibitionism() < 33) output(" and you timidly look around, hoping the sounds don’t carry through the door.");
	else if(pc.exhibitionism() < 66) output(" and you worriedly glance around, hoping yet terrified that Azra will walk in on you at your most depraved.");
	else output(" and you glance around, hoping Azra will walk in on the sexy show you’re making.");
	output("\n\nNow panting with unbearable lust and undeniable levels of pleasure, you give up all sense of propriety and resort to fucking wildly, [hips] jumping inches off into the air. The flower’s interior is a slick, silky heaven for your [pc.cock " + x + "], a sucking, squeezing hole of seemingly infinite pleasure. Inside its gluttonous gullet, the numerous tentacles twist around, the longest ones circling the base of your shaft");
	if(pc.hasSheath(x)) output(" inside your violated sheath");
	output(". With so much blood trapped in your [pc.cock " + x + "], it’s bigger and harder than ever, twitching valiantly against its restraints with every beat of your heart.");
	output("\n\nOne of the tentacles circles your [pc.cockHead " + x + "] for a moment, and without much warning or pause, it lances forward to bury itself into your vulnerable cum-slit. Your preconceptions are turned on their head when there’s a complete lack of pain from the abrupt penetration. If anything, it actually feels kind of good... like there’s a warm, slippery finger caressing your penis from the inside out. It slithers in and out of you, pumping you inside, burrowing pleasure into your center even while stroking you from without. Your body, burning from the exertion of fucking the flower’s pod and the constantly-rising tidal wave of lust, begins to twitch spasmodically,");
	output("\n\nThe internal suction spikes as your dick bloats larger, and with a roar of bestial pleasure, you arch your back, hands pushing your [pc.cock " + x + "] as deep into the plant’s gullet as possible. ");
	if(pc.balls > 0) 
	{
		if(pc.balls > 1) output("Your [pc.balls] gurgle, a surprisingly happy sound, and cling tight to your loins. ");
		else output("Your [pc.balls] gurgles, a surprisingly happy sound, and clings tight to your loins. ");
	}
	output("Inside you, you can feel the liquid heat of your spurting release exploding out, melting everything before it with liquid, orgasmic bliss. A low moan bursts from your lips when the sounding tentacle pulls out of your sloppy cock-slot, and the rushing tide of bubbling cum follows it, bursting into the sweet, suckling nectar-pot.");
	if(pc.cumQ() >= 500) output(" You pour forth your prodigious essence without pause or fail, and the plant immediately begins to drink it down, the stem bulging with rounded balls of sperm that it carries into its root system.");
	if(pc.cumQ() >= 2000) output(" Soon, the meager stem cannot swallow it all. Spunk froths and squirts out around the base of your tool for a moment, and then a veritable tide of the stuff gushes out to soak you and Azra’s floor. Whoops.");
	output("\n\nSatisfied or exhausted, you slump down and release your grip on the creampied fuck-flower. It slowly, laboriously removes itself from around your orgasm-bloated shaft, cleaning the sperm from it as it goes. There’s a visible swallowing motion, and a globular bulb moves down the stalk into the ground. Once upright, the petals bloom back into the flower, the only hint of your tryst a milky-white sheen upon the purple petals.");
	output("\n\nYou have just enough time to clean up before Azra returns. Whew.");
	processTime(35);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",fuckFlowerEpilogue);
}

public function fuckFlowerEpilogue():void
{
	clearOutput();
	showAzra();
	output("Azra ");
	if(flags["AZRA_MHENGAED"] == -1) output("hesitantly re-enters");
	else output("barges into the room in a rush, hoping to catch you mid-coitus");
	output(". <i>“I see you’ve finished your ‘inspection’.");
	if(flags["AZRA_MHENGAED"] == 1) output(" Maybe you’d like to inspect something else?");
	else output(" Is there anything else I can help you with, Captain [pc.name]?");
	output("”</i>");
	processTime(1);
	azraMenu();
}

//Ride It (skimmed)(coded)
public function rideDatFuckLily():void
{
	clearOutput();
	showName("FUCK\nLILIES");
	showBust("FUCKLILLIES");
	output("You ");
	if(!pc.isCrotchExposed()) output("shuck your [pc.crotchCovers] and ");
	output("slowly ease yourself towards the violet-hued creature. As soon as you get within a few feet, the flower’s bulb angles toward you, the petals wiggling slightly along with the stamen inside. A few of them even stretch out towards you like longing fingertips, shaking slightly from the effort before sliding back inside. The dull ache in your [pc.vaginas] grows a few degrees hotter at the display, your body growing flush with excitement for the coming copulation. Throwing caution to the wind, you move forward with a confident sway of your [pc.hips]. It’s time to get pollinated.");
	output("\n\nGrabbing hold of the plant, you tug it up against your mons and sigh. The silky-smooth petals flatten against your thighs, the tips curling over to touch the sides of your [pc.butt], slicking it with lubricating moisture. You let go, and the flower holds fast to your [pc.hips], firmly embracing you as its stamen begin to roam across your vulva. Slowly, an intrepid tentacle ventures between your labia, into the slick passageway you’re so ready to fill with wiggly delight. A dribble of fresh fluid rushes out at those first, hesitant touches, and encouraged by its success, the stamen’s brothers join in on the slippery party, plunging into your box and immediately swirling over your inner walls.");
	output("\n\nDriven mercilessly by the sudden onslaught of sensation, you flop back onto the ground, but the flower comes with you, latched onto your [pc.hips] with no sign of releasing. The swirling tentacles twist around inside you in a tornado of ecstasy, and the pleasure, that awful, unstoppable pleasure, it twists your muscles into knots, instinctively convulsing to raise your lower lips higher, as if that would somehow propagate even deeper penetration. One of the tentacles retracts, drawing a burst of slick cunt-lube with it. Then, it twists around [pc.oneClit], tightening up on the over-sensitive bud until it feels like it could pop.");
	if(pc.clitLength > 3) output(" Your heavy buzzer is so big that the flexible plant-cock has plenty of room to curl around it, and if you could see it, your clit would look look almost like a candy-cane (if one set of stripes was jerking off the cane beneath).");
	if(pc.hasCock()) output(" [pc.EachCock] soon has its own partner twisting around it, a pussy-slicked vine to jerk and twine about its girth.");
	output("\n\nWith nothing to occupy your roving hands, you let the slide up your [pc.skinFurScales] to your ");
	if(pc.bRows() > 1) output("lowest row of tits, cupping them before going to your top row of breasts");
	else output("[pc.chest]");
	output(", caressing the swell as you search for the lust-tightened skin of your [pc.nipples]. They seem almost as sensitive as little clits, and as soon as you find them, you immediately set to circling them slowly, occasionally tugging and twisting when you a particularly powerful sensation works through your pleasure-wracked body.");
	if(pc.isLactating())
	{
		output(" One after the other, they begin to ");
		if(!pc.canMilkSquirt()) output("leak");
		else output("spray torrents of");
		output(" [pc.milkNoun].");
	} 
	output(" You moan in unabashed delight, your mouth hanging open in a mindless, blissful ‘o’ in between vocalizations. If your Azra could see you know, writhing on the deck, face open in simple, animal pleasure, and perhaps worst of all, fucking a plant, you’d die of ");
	if(pc.exhibitionism() < 50) output("embarrassment");
	else output("lust");
	output(".");
	output("\n\nWith that thought somehow staying firmly in your battered consciousness, you reach a climax of mind-breaking proportion, eyes rolling wildly as every muscle locks in one united twitch of rapture.");
	if(pc.hasCock()) output(" [pc.EachCock] explodes in release, pumping heavy flows of seed into the petals, even as y");
	else output(" Y");
	output("our quivering pussy, already sopping wet, releases the last of your juices in a soaked ");
	if(pc.wettestVaginalWetness() < 2) output("drizzle");
	else if(pc.wettestVaginalWetness() < 4) output("stream");
	else if(pc.wettestVaginalWetness() < 5) output("spray");
	else output("torrent");
	output(". The tentacles inside you curl in on themselves and slowly pull back from the well-creamed quim, scraping out as much fluid as possible from your oversensitive honey-pot. The binding on your [pc.clit] releases, which of course sets off a whole new wave of rippling pleasure-contractions in your cunt.");
	output("\n\nYou swoon from it all, your body slowly relaxing, sinking back to the ground. The fuck-flower visibly swallows your juices, a bulge visible on the stem. It detaches with a hungry pop, strands of its slime webbing the space between person and plant for a second before it withdraws completely. Slowing gradually, the corrupt greenery resumes its formerly placid, open state, aimed at the lights. You can see the tentacle-like stamen still wiggling inside, but they seem a little more lethargic now. Your [pc.vagina] twitches in rememberence of their caresses, and you wonder when you’ll take advantage of this wondrous plant next.");
	//[Next] - to fuck-flower epilogue
	processTime(35);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",fuckFlowerEpilogue);
}