import classes.Characters.MilodanFertilityPriestess;
import classes.Characters.MilodanMaleGroup;

public function GlacialRiftO44():Boolean
{
	if (flags["UVGR_SAVICITE_IDOL"] == undefined)
	{
		output(" You can hear voices ahead, too... somebody’s here!");
	}
	return false;
}

public function GlacialRiftM44():Boolean
{
	/* Flagdef:
		undef, not triggered
		1, player got idol
		-1, triggered, player didn't get idol
	*/
	if (flags["UVGR_SAVICITE_IDOL"] == undefined)
	{
		flags["UVGR_SAVICITE_IDOL"] = -1;

		showBust("MILODAN_PRIESTESS", bustDisplayMilodanMale(), bustDisplayMilodanMale());
		
		output("\n\nYou slowly make your way around the bend in the icy tunnel, following the natural curves of the frigid glacier’s heart until you find yourself stepping into a small, almost perfectly circular chamber at the tunnel’s end. The indistinct voices you heard before echoing throughout the place solidify into those of three figures standing here, chanting and swaying before a solid block of ice, maybe four feet high and perfectly smooth on the top.");

		output("\n\nThe figures are");
		if (CodexManager.entryUnlocked("Milodan")) output(" milodans:");
		else if (flags["ICEQUEEN COMPLETE"] != undefined) output(" the same race as Zaalt:");
		output(" tall, white-furred feline humanoids standing naked despite the intense chill. Two are men -- bigger, broad-shouldered, and muscular -- and the other a woman with broad hips and a shock of ice blue hair, cut into a mohawk that runs down to her shoulders. She’s carrying a staff that looks like something out of a fantasy holo, black as obsidian and tipped with a green savicite stone surrounded by a metal halo. With every refrain of their chant, she cracks the butt of the staff against the cavern floor, and the stone within the halo glows for a moment, as if with some inner light.");

		output("\n\nThankfully, they’re looking away from you when you enter, giving you that moment to get your bearings. They haven’t noticed you for the moment, too absorbed by their strange ritual...");
		
		clearMenu();
		addButton(0, "Next", function():void {
			clearOutput();
			
			if (!CodexManager.entryUnlocked("Milodan"))
			{
				output("From inside your pack, you hear your Codex beeping. You hush it as best you can and take a look once it’s quieted down. Apparently, these creatures are called milodans: a native race that has partially resisted upliftment, causing problems for the locals. Considering where you are and what they’re doing, it doesn’t take much of a leap to figure these are some of those malcontents.");
				output("\n\n");
				CodexManager.unlockEntry("Milodan");
			}
	
			output("For the first time, you notice something on the altar: a shaft of green stone, just like the stone on her staff, about a foot long and as thick as your fist. It’s thicker at the base, and tapers to a slender point at the tip.");
			if (flags["UVETO_HUSKAR_FOURSOME"] != undefined)
			{
				output(" Wait, isn’t that the same sort of idol that the huskar twins back on the station found...?");
			}
			output("\n\nShould you stay and watch this strange ritual, interrupt it, or ignore it altogether?");
			
			clearMenu();
			addButton(0, "Watch", GRM44Watch, undefined, "Watch", "No sense endangering yourself. Let’s see what they’re up to down here.");
			addButton(1, "Interrupt", GRM44Interrupt, undefined, "Interrupt", "Though you doubt they’ll appreciate the interruption, you’ve got your eye on that idol of theirs... if that’s actually pure savicite, it could be worth a fortune.");
			addButton(14, "Leave", function():void {
				currentLocation = "UVGR O44";
				clearOutput();
				
				output("Despite how tempting a sight the milodan are putting on, you think it wise not to get involved. For now...");
				
				flags["UVGR_SAVICITE_IDOL"] = undefined;
				
				clearMenu();
				addButton(0, "Next", mainGameMenu);
			}, undefined, "Leave", "No point getting involved...");
		});
		
		return true;
	}
	if (flags["UVGR_SAVICITE_IDOL"] != undefined)
	{
		output(" There’s no sign of the milodan that you saw here before...");
		if(flags["UVGR_SAVICITE_IDOL"] != 1) output(" or the idol they had with them.");
	}
	return false;
}

public function GRM44Interrupt():void
{
	clearOutput();
	author("Savin");
	showBust("MILODAN_PRIESTESS", bustDisplayMilodanMale(), bustDisplayMilodanMale());

	output("You step out of the shadows and whistle, drawing your [pc.weapon] as you do so. The sharp sound ricochets off the icy walls, mixing with the milodans’ chant until it’s cut off. The trio turn around to face you, scowling, and the woman cracks the butt of her staff down on the ice.");
	
	output("\n\n<i>“What is this?”</i> she barks. The tip of her staff flashes with some inner energy. <i>“An offworlder? Another damn fool treasure hunter, I bet! The ritual is too important to be interrupted... get [pc.himHer] boys!”</i>");
	
	output("\n\nThe males growl and bare their claws and tusk-like fangs. Oh yeah, they’re not happy about you interrupting them...");

	clearMenu();
	addButton(0, "Fight!", GRM44Fight);
}

public function GRM44Watch():void
{
	clearOutput();
	author("Savin");
	showBust("MILODAN_PRIESTESS", bustDisplayMilodanMale(true), bustDisplayMilodanMale(true));
	
	
	output("You hide yourself as best you can in the shadows of the tunnel entrance, content to observe the natives’ ritual from afar.");
	
	output("\n\nThe three cat-folk continue chanting for a minute or so more, too fast and echoing too much for your microbes to get a translation. Suddenly, seemingly without climax, the chant ends and the cave goes silent. The two men look at the woman standing between them, grin, and grab her by the backs of her legs and shoulders, hefting her into the air. She gasps but doesn’t struggle, instead putting her hands on the men’s shoulders for support as they maneuver her over the altar.");
	
	output("\n\n... And over the stone. The men lift their female counterpart up, only to spear her down on the thick green icon atop the ice brick.");
	
	output("\n\nThe cat-woman yelps, a sharp cry of pleasure that bounces off the walls until she’s slid all the way down the rocky rod, completely filling her asshole. Panting from the carnal descent, she glances up at her two males and grins, spreading her legs wide and bracing her heels on the altar’s corners.");
	
	output("\n\nOne of the males immediately steps up, grabbing the woman’s hips and thrusting himself into the sodden slit between her legs. His mate throws her head back and howls in pleasure, digging her claws into the flat plane of the ice beneath her. From where you’re at, you can only catch glimpses of the long, black feline member pumping in and out of her pussy, but that of the other milodan is fully in view: he stands beside the coupling pair, and the female reaches out to grab his dark manhood, stroking it off while she’s pumped full of the other man’s dick.");
	
	output("\n\nThe sounds of the three cat-folks’ coupling echo throughout the strange chamber, a mix of grunts, growls, howls, and the heavy beats of flesh and fur slapping against each other. It isn’t all that long before the first male grunts and lunges forward, digging his teeth into the woman’s shoulder and his claws into her flanks, harsh enough to draw blood. She gasps, locking her legs behind his ass and pulling him closer, forcing him to the hilt inside her. A second later and he staggers back, a slimy bridge of steaming white goo connecting the crown of his tapered prick to the female’s slit.");
	
	output("\n\nThe second male shoves the first aside and takes his place. thrusting himself into the cat-woman’s cum-stuffed quim. She just smiles and strokes his cheek, inviting him inside herself with easy, lustful desire.");
	
	output("\n\nWhile they mate, just as hard and forceful as before, the male who’s just expended himself faces the altar and raises his hands, starting to chant again. With only a single voice to contend with, your translators start going to work:");
	
	output("\n\n<i>“Spirits bless us, empower us, fill our seed with might! Come back, fallen heroes, let your spirits find root inside the holy one’s womb. Return to flesh, and be born anew!”</i>");
	
	output("\n\nHe speaks the words again and again, though as the other two keep going at it, he’s almost drowned out by the rising tempo of moans and growls. At the end of one of the refrains, the milodan female screams and clutches at her paramour, wrapping him in her arms and legs and thrusting his face down into her tits. The man shudders, sighs, and slowly pulls his hips back until his softening cock falls free of her embrace.");
	
	output("\n\n<i>“I can feel the Lost Ones blessing my body already,”</i> the woman purrs, putting a hand on her belly and the other on her staff.");
	
	output("\n\nThe men bow to her and then heft her up, freeing her from the anchor of savicite in her ass. She moans, drooling seed from her black lips. Once they set her down, she slips down to her knees and plants a kiss on the crown of each man’s penis, licking them clean of any excess. Once done, the three turn towards the tunnel’s exit... and your hiding place.");
	
	output("\n\nYou scramble back, looking for some hollow or side-passage to hide yourself in, and find none. Oh, shit.");
	
	output("\n\nThe trio round the first corner of the tunnel, and all but smack into you, sending all four of you reeling backwards in surprise and alarm. The men recover and start to growl, baring their tusk-like fangs and claws, stepping protectively between you and their mate. Before they can lunge for your throat, though, the female puts a hand on each sabertooth’s shoulder and pushes them apart, eyeing you with a mix of interest and disgust.");
	
	output("\n\n<i>“What have we here?”</i> she wonders aloud, planting the butt of her staff in the ice beside her. <i>“A dirty little voyeur?”</i>");

	pc.changeLust(25);
	processTime(15);
	clearMenu();
	addButton(0, "Apologize", GRM44Apologize, undefined, "Apologize", "Sorry about the peeping, miss.");
	addButton(1, "Flirt", GRM44Flirt, undefined, "Flirt", "Let’s see if you can turn this around...");
	addButton(2, "Fight", GRM44Fight, undefined, "Fight!", "You’ll show them what you are alright...");
	addButton(3, "Run", GRM44Run, undefined, "Run!", "Fuck this shit, you’re out!");
}

public function GRM44Run():void
{
	clearOutput();
	author("Savin");
	showBust("MILODAN_PRIESTESS", bustDisplayMilodanMale(true), bustDisplayMilodanMale(true));

	output("You look between the naked males, the cum-stuffed woman, and the strange cock-like stone on the altar... and decide that discretion is the better part of valor. You turn and book it down the tunnel, back the way you came. There’s no time to look over your shoulder, but you hear uproarious laughter echoing behind you, and the scraping of claws on the ice.");

	flags["UVGR_CLIMB_ATTEMPTED"] = 2;
	output("\n\nTime to leave. You grab the rope and haul yourself out of the cave, bracing your [pc.feet] on the ice. It’s a slow, laborious journey upwards that leaves you gasping for breath and shivering in the oppressive cold by the time you near the top.");

	output("\n\nAnd then you hear a <b>snap</b> from above. Oh, shit.");

	output("\n\nYou have just enough time to grab a handhold in the ice before a rain of snow, ice, and rope comes crashing down on your head. Fuck! You hug the cliffside tight until the deluge passes by you, crashing down into the water below. Luckily, you’re near enough to the top that it’s easy to climb the rest of the way yourself, but there’s no going back down there unless you");
	if (pc.hasWings()) output(" use your");
	else output(" sprout");
	output(" wings.");
	
	currentLocation = "UVGR Q40";
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function GRM44Fight():void
{
	IncrementFlag("FERTILITY_PRIESTESSES_FOUGHT");
	
	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors([new MilodanFertilityPriestess(), new MilodanMaleGroup(), new MilodanMaleGroup()]);
	CombatManager.victoryCondition(CombatManager.ENTIRE_PARTY_DEFEATED);
	CombatManager.lossCondition(CombatManager.SPECIFIC_TARGET_DEFEATED, pc);
	CombatManager.encounterTextGenerator(function():String {
		var s:String = "You’re fighting a Fertility Priestess, a female milodan standing tall and nude before you, wielding a long black staff tipped with a glowing green crystal. She’s got a decidedly fertile figure, with broad hips and large breasts, each capped with a bone-pierced black nipple, with all her sensuous curves covered in a thick layer of spotted white fur. A streak of ice-blue hair adorns her head, shaved down to run between her pointed feline ears and trail down her back.";

		var en:Array = CombatManager.getHostileActors();
		
		var fem:MilodanFertilityPriestess;
		var m1:MilodanMaleGroup;
		var m2:MilodanMaleGroup;

		for (var i:int = 0; i < en.length; i++)
		{
			if (en[i] is MilodanFertilityPriestess)
			{
				fem = en[i];
			}
			else if (m1 == null)
			{
				m1 = en[i];
			}
			else
			{
				m2 = en[i];
			}
		}
		
		if (fem.malesRan)
		{
			s += "\n\nThe male milodans have booked it, leaving the priestess alone!";
		}
		else if (!m1.isDefeated() || !m2.isDefeated())
		{
			s += "\n\nStanding defensively between you and the female";
			if (!m1.isDefeated() && !m2.isDefeated())
			{
				s += " are a pair of male milodans, baring their claws at you.";
			}
			else
			{
				s += " is the last milodan male left standing."
			}
		}

		return s;
	});
	CombatManager.victoryScene(pcDefeatsFertilityPriestess);
	CombatManager.lossScene(pcDunkedByFertilityPriestess);
	CombatManager.displayLocation("MILODAN TRIO");
	
	CombatManager.beginCombat();
}

public function pcDefeatsFertilityPriestess(isRepeat:Boolean = false):void
{
	userInterface.hideNPCStats();
	userInterface.leftBarDefaults();
	generateMap();
	
	if (!isRepeat)
	{
		clearOutput();
		showBust("MILODAN_PRIESTESS");
		author("Savin");

		output("With a gasp, the milodan priestess collapses onto her knees,");
		if (enemy.HP() <= 0) output(" wincing in pain");
		else output(" panting with lust");
		output(". Her staff clatters to the side, and her huge breasts heave with her gasping breath.");
		
		output("\n\n<i>“You... you...”</i> she gasps, finally getting enough control of herself to look you in the eye. <i>“You’re even more powerful than you look. The spirits have spoken: I yield, off-worlder. Do with me as you wish.”</i>");
		
		var mfem:MilodanFertilityPriestess = enemy is MilodanFertilityPriestess ? enemy as MilodanFertilityPriestess : null;
		if (mfem != null && !mfem.malesRan) output("\n\nWhile you’re distracted with the priestess, the pair of males make a break for it. You lunge after them, but slip on the ice and your grab comes off short. They scarper off down the cavern, shouting back that they’ll find help. Guess you’d better finish up here quickly...");
	}
	output("\n\n");

	//[Fuck her] [Get Licked] [Take Idol] [Leave]
	clearMenu();
	if (pc.hasCock() || pc.hasHardLightAvailable()) addButton(0, "Fuck Her", fertilityPriestessFuckHer, undefined, "Fuck Her", "This priestess seemed interested in one thing: rutting like an animal. Maybe you should give her what she wants.");
	if(pc.hasVagina() && pc.blockedVaginas() > 0) addDisabledButton(1,"Get Licked","Get Licked","This scene is not compatible with blocked vaginas.");
	else addButton(1, "Get Licked", fertilityPriestessGetLicked, undefined, "Get Licked", "Make the slutty priestess put that rough tongue of hers to use.");
	if(!isRepeat && flags["UVGR_SAVICITE_IDOL"] != 1) addButton(2, "Take Idol", fertilityPriestessTakeIdol, undefined, "Take the Idol", "First thing’s first: this savicite idol has to be worth a fortune.");
	addButton(14, "Leave", CombatManager.genericVictory);
}

public function fertilityPriestessGetLicked():void
{
	clearOutput();
	showBust("MILODAN_PRIESTESS");
	author("Savin");

	output("You stride towards the defeated milodan, shoving her back down onto the ice with");
	if (pc.legCount > 1) output(" a [pc.foot]");
	else output(" the tip of your [pc.tail]");
	output(". She grunts, thrashing her tail and scouring the ice with her claws... but all her wiggling just makes her huge, heavy breasts bounce and jiggle in the most alluring ways.");

	output("\n\nSome submissive instinct in her kicks in as you approach, though, and her legs spread apart, revealing the black slit of her pussy for your inspection. You brush your fingers through the gulf between her lips as you go, straddling her flanks and planting your [pc.butt] on her chest. All you need to do is point down at your [pc.vagOrAss] to get your desires across. The milodan snickers and plants her hands on your [pc.hips], licking her chops like a hungry animal.");

	output("\n\n<i>“We of the fertility cult have plenty of experience with this,”</i> she boasts, flicking her tongue along your thigh. It’s soft but just a little rough around the tip, making you shiver when it passes over your [pc.skinFurScales]. That’s the stuff! You grin down and run a hand appreciatively through the priestess’s shock of icy hair, guiding her little muzzle towards your crotch.");
	if (!pc.isNude() && pc.hasVagina()) output(" She peels aside your gear, staring hungrily at the bared slit of your sex.");
	else if (!pc.isNude() && !pc.hasVagina())
	{
		output(" The tigress peels aside your gear, giving you a curious look when she sees no vagina on offer.");
		if (pc.hasCock()) output(" <i>“Wouldn’t you rather fuck me with that?”</i> she asks.");

		output("\n\nYou just grin and point below your shaft. It’s not your dick you’re interested in getting wet today.");

		output("\n\nThe priestess’s lips curl up, but you roughly push her snout into your groin and rub your [pc.asshole] against her little pink nose.");
	}

	output("\n\nYou guide her right where you want her to go, and sure enough, you soon feel a wet, probing muscle pressing against your [pc.vagOrAss]. Relaxing yourself, you let her tongue slip inside you, flicking across your inner walls. It’s just the right combination of rough, wet, and soft to make you shiver and gasp with pleasure. Your fingers clutch at the priestess’s hair, driving her deeper and deeper until she has to struggle to come up for breath.");

	output("\n\nYour " + (pc.legCount == 1 ? "[pc.leg] clenches around her shoulder" : "[pc.legs] clench around her shoulders") + ", making sure she doesn’t stray too far from her task, leaving your hands free to wander. They find right where to go: the priestess’s quivering jugs, jiggling with every labored breath beneath your [pc.butt]. Your fingers close around the black peaks of her teats, tweaking and tugging on them until a muffled moan emanates from your backside.");

	if (pc.hasTailCock())
	{
		output("\n\nShe’s being such a good girl, you decide you ought to reward her somehow... and your [pc.tail] agrees. Your sinuous, cock-tipped tail slithers back along the priestess’s belly and down to the gap between her thighs. The priestess gasps, her tongue shooting straight into you as your [pc.cockTail] finds its way to the saber-tooth slut’s black slit, flicking across the charcoal bud of her clit before the promise of a warm reprieve from the cold prompts you to jam your tail straight into the sodden slit.");

		output("\n\n<i>“Oooh! That’s more like it!”</i> the priestess purrs, rolling her tongue around the");
		if (pc.hasVagina()) output(" lips");
		else output(" rim");
		output(" of your [pc.vagOrAss]. <i>“At least you know how to motivate a woman...”</i>");
	}
	else
	{
		output("\n\nGiving her bone piercing a little tweak, you start to play your hands down her taut, fluffy belly towards the cleft of her sex. The priestess gasps, her tongue shooting straight into you as your thumb circles the charcoal bud of her clit. Slipping a brace of fingers inside just makes her licking all the more feverish, thrusting into your [pc.vagOrAss].");
	}

	output("\n\nHer hands grope blindly at your [pc.hips], claws gently raking your [pc.skin]. Beneath you, her huge jugs shift and quake with her quickening breath, a full-body response to your thrusting into her twat that grows more pronounced the deeper your");
	if (!pc.hasTailCock()) output(" fingers go");
	else output(" cock-tail goes");
	output(". You can hear her tail swishing against the ice, feel her tongue thrashing amidst moans and gasps. Now that’s more like it!");

	output("\n\nYou reward her efforts with soft moans, rocking your [pc.hips] against her mouth and stroking her hair. <i>“Good girl,”</i> you murmur, already feeling that familiar height of pleasure starting to mount inside you. She’s finding every sweet spot with unerring accuracy, swirling her tongue around inside your [pc.vagOrAss] to the same beat that you pleasure the sabertooth’s pussy. You’ve got a good lead on her, though, in the steady race to climax. With a gasping cry, you throw your head back and push the priestess’s little muzzle as deep into your [pc.vagOrAss] as you can, riding it to orgasm.");

	output("\n\nThe priestess squirms under you, thrashing her legs and tail while you abuse her face, but you pay her no mind.");
	if (pc.hasVagina()) output(" Pussyjuice runs down her furry face in musky rivers, practically steaming in the Uvetan chill.");
	if (pc.hasCock()) output(" Your untouched dick, only half-hard in the cold, bubbles with a frothy [pc.cumColor] spurt of pre before erupting into the priestess’s hair.");
	if (pc.hasTailCock()) output(" Your [pc.tailCock] throbs inside the fluffy slut’s tight little fuckhole, bulging with seed before pumping her womb with its load.");

	output("\n\nThe cat-woman finally frees herself from your [pc.vagOrAss] as your orgasm subsides, coming up for gasping breaths. <i>“Ah! I’m a mess!”</i> she snarls, baring her fangs... right up until you reach down and boop her on the nose, telling her she");
	if (pc.isBimbo() || pc.isMisc()) output(" is a good girl");
	else output(" did good");
	output(". You pull out of her pussy at the same time, making her gasp and squirm until you’re well out of reach, gathering your gear and leaving the woman to her lonely orgasm.");
	output("\n\n");

	processTime(10+rand(5));

	pc.orgasm();

	clearMenu();
	CombatManager.genericVictory();
}

public function fertilityPriestessFuckHer():void
{
	clearOutput();
	showBust("MILODAN_PRIESTESS");
	author("Savin");

	output("You stride over to the defeated tigress and give her a rough, playful push down onto her back. She hisses as her fur graces the frigid ice, but she’s clearly used to the Uvetan cold: the only sign she feels it is in the two big, black nipples jutting up from her snowy fur. Or maybe she’s just turned on by losing, you wonder aloud. The prideful priestess snarls, baring her fangs at you... but one of her hands instinctively goes to the dark slit between her legs, and another gropes at one of her weighty breasts, pinching around the bone piercing through her teat. As you approach, you pull aside your gear and");
	if (!pc.hasCock()) output(" activate your hardlight cock. The translucent rod springs to life in a rush of sensation, shaping itself into the familiar shape of your nerve-linked toy.");
	else output(" wrap your fingers around the [pc.knot] of your steadily-stiffening cock, letting the priestess’s alluring body stoke the fires of your lust.");

	if (!pc.hasCock())
	{
		output("\n\n<i>“W-what is that?”</i> the priestess gasps, eyes widening as your holographic dick springs to life. <i>“Magic! Offworlder sorcery!”</i>");
		
		output("\n\n<i>“It is pretty magic,”</i> you tell her with a laugh. <i>“And it feels even better than a real one.”</i>");
		
		output("\n\nThe priestess licks her lips, eyeing your glimmering rod hungrily. Something tells you that there won’t be any resistance from her now...");
	}
	else output("\n\n<i>“Ah, I see what you want,”</i> the priestess purrs. A pair of her fingers spread her lower lips apart, revealing a glistening onyx sheath that mists in the chill, beckoning your naked manhood to come rest within her depths. <i>“Perhaps the spirits are kind, after all. Let’s see what you off-worlders call fucking!”</i>");

	output("\n\nYou slip down over the milodan woman, running your hands through the thin veneer of fur coating her luscious breasts. A purr hums in the back of her throat, and her legs spread around your [pc.hips], wrapping her satin-soft paws around your backside and guiding you in. Your [pc.cockOrStrapon] brushes through the cleft of her sex, and the priestess moans into your ear.");

	output("\n\n<i>“Offworlder or tribesman, it makes no difference to me,”</i> she murmurs as your shaft spreads open her lower lips. <i>“I came here for one thing: to be filled with seed.”</i>");

	output("\n\n");
	if (!pc.hasCock()) output("You shy away from telling her that she’s not going to get her wish - even if you wanted to, a hardlight’s got no way of impregnating her.");
	else output("You suppose, this time, your goals are aligned...");
	output(" Grinning down at her, you thrust your [pc.cockOrStrapon] into the priestess’s waiting slit.");
	
	if (pc.hasCock()) pc.cockChange();
	
	output(" The pervasive cold of Uveto seems to melt away in an instant, replaced by a resplendent warmth radiating from your throbbing dickmeat as you slide into the welcoming embrace of the sabertooth slut’s pussy. Her back arches off the ice and her mammoth tits press against your [pc.chest], tickling your [pc.nipples] with her velvety fur.");

	output("\n\nYour hands naturally find their way from her chest to her cheeks, pulling her into a fierce kiss - as much to share the warmth of her breath as anything. Regardless of your motives, her fluffy tail swishes across the ice, and her quim clenches wonderfully around your prick. She’s a beast! The priestess thrusts her tongue into your mouth, scouring your [pc.tongue] with the rough tip. Your hips start to move, and her clawed paws wrap around your back, digging into your [pc.skinFurScales]. The sudden rush of pain subsides into a heady mix of pleasure and warmth, wrapped in the cum-hungry alien’s embrace.");

	output("\n\n<i>“So gentle for an offworlder,”</i> she murmurs, breaking the kiss and licking at your cheek. <i>“How boring.”</i>");

	output("\n\nOh, that’s how it is, huh? She smirks up at you, challenging you even in her state of defeat. Well, you can’t let that slide...");

	//[Switch Anal] [Go Hard]
	clearMenu();
	addButton(0, "Switch Anal", fertilityPriestessFuckHerSwitch, undefined, "Switch Anal", "If the breed-hungry slut’s gonna be like that, maybe you oughtta deprive her of her greatest desire... and sample some forbidden fruit while you’re at it.");
	addButton(1, "Go Hard", fertilityPriestessFuckHerGoHard, undefined, "Go Hard", "If she wants it rough, you’re more than able to give it to her.");
}

public function fertilityPriestessFuckHerGoHard():void
{
	clearOutput();
	showBust("MILODAN_PRIESTESS");
	author("Savin");

	output("If that’s what she wants...");

	output("\n\nYou hook your hands under the tiger-slut’s furry legs and heft them up over your shoulders. The priestess gives you a toothy grin, thrusting her huge chest up to give you something to sink your hands into while you thrust your [pc.hips] against her jiggling ass. You start hammering as hard as you can, using her tits as leverage to push deeper and deeper into the slavering warmth of the cat-woman’s cunt.");
	
	output("\n\n<i>“That’s more like it!”</i> she howls, laughing and moaning all at once. Her claws score your [pc.skin], raking along your back while her padded feet wrap around your [pc.butt], wrapping you in the soft, furry heat of her body. You feel her tongue flicking across your cheek, and one of her hands working");
	if (pc.hairLength > 2) output(" through your [pc.hair]");
	else output(" across your scalp");
	output(". Her little claws grab the back of your head, guiding it down towards the jutting point of one of her charcoal-black teats. Your [pc.lips] lock around her nipple, letting the bone piercing poke out on either side of your mouth as you start to suck.");

	output("\n\nAnd, to your surprise, your mouth is filled with a cool, sweet cream.");

	output("\n\n<i>“What did you expect?”</i> the priestess chortles, meeting your shocked expression with a smile. <i>“Tits don’t get this big without a few litters under your belt.”</i>");

	output("\n\nThat certainly explains her figure, wantonly advertising her fertility to anyone who looks her way. She snickers and squeezes you between her thighs. <i>“Next one’s yours... I can feel it! Give it to me, spacer - let me see just how strong your seed really is.”</i>");

	if (!pc.hasCock()) output("\n\nWell, she’ll see <i>something</i> alright...");
	else output("\n\nToo late to back out now - not with her begging for your cum, and her pussy doing everything it can to milk it all out.");
	output(" You grit your teeth and hammer your hips, pounding away at that plump derriere until the familiar rush of pleasure tightens in your loins.");
	if (pc.hasCock() && pc.balls > 0) output(" You feel a churning in your [pc.balls], full of [pc.cum] ready to flood the sabertooth slut’s waiting womb.");

	output("\n\n<i>“Give it to me!”</i> she barks, squeezing your [pc.cockOrStrapon] hard, working her muscles from");
	if (!pc.hasCock()) output(" base to crown.");
	else output(" [pc.knot] to [pc.cockHead].");

	if (pc.hasCock())
	{
		output("\n\nYou do exactly what she wants: your [pc.cock] clenches, then erupts in a fountain of [pc.cumNoun] right into the priestess’s lurid fuckhole. She howls in pleasure, throwing her head back and holding you tight through the spasms of orgasm. Your [pc.hips] keep pounding away until every last drop is spent, packing her pussy");
		if (pc.cumQ() <= 500) output(" with your [pc.cum].");
		else if (pc.cumQ() <= 5000) output(" with a flood of steaming seed.");
		else output(" until her belly has to stretch to accommodate your inhuman load, swelling until she looks positively pregnant already!");

		output("\n\n<i>“Oooh, that’s the stuff!”</i> the priestess purrs, wrapping her hands around her packed belly. <i>“I can feel your little swimmers working already. Ah, strong enough to defeat me... strong enough to give me a litter of mighty kits!”</i>");

		var tEnemy:Creature = CombatManager.getEnemyOfClass(MilodanFertilityPriestess);
		var priestess:MilodanFertilityPriestess = tEnemy is MilodanFertilityPriestess ? tEnemy as MilodanFertilityPriestess : null;
		if (priestess != null) priestess.loadInCunt(pc, 0);
		
		if (pc.virility() <= 0) output("\n\nWell, maybe not. But no need to tell her that!");
		else pc.clearRut();
	}
	else
	{
		output("\n\nYou can’t give the priestess exactly what she wants, but you <i>can</i> cum for her - your hardlight isn’t giving you much of a choice. Every nerve buzzes with pleasure, making you gasp and shiver with the simulated climax rushing through your loins. The priestess at first moans and clutches you tight, murmuring into your [pc.ear], but when nothing comes out of your glimmering prick, her lips twist into a snarl of confusion, and her quim clenches around your hardlight shaft as if searching for what should be there.");

		output("\n\n<i>“W-what’s wrong with you!?”</i> the priestess asks, as much concerned as angry. <i>“Where’s your seed?”</i>");

		if (pc.isNice() || pc.isBimbo()) output("\n\nFlushing with embarrasment");
		else output("\n\nShrugging");
		output(", you explain that hardlight dicks aren’t real - so no cum for her. The priestess huffs and crosses her arms, scowling right up until you pull yourself out of her - that, at least, brings a smile and a moan back to her lips.");
	}

	output("\n\nYou grin down and plant a parting kiss on her dusky lips before grabbing your gear and turning to leave.");
	output("\n\n");

	processTime(15+rand(5));
	pc.orgasm();
	IncrementFlag("FERTILITY_PRIESTESSES_FUCKED");
	
	CombatManager.genericVictory();
}

public function fertilityPriestessFuckHerSwitch():void
{
	clearOutput();
	showBust("MILODAN_PRIESTESS");
	author("Savin");

	output("You grin down at her and hook your hands under her arms. In one thrust, you pull your [pc.cockOrStrapon] from her slavering slit and roll the tiger-like alien over, shoving her face in the ice and hiking her ass in the air. The priestess yips in surprise, but her tail starts swishing eagerly. She reaches back and spreads her pussylips for you, inviting you back into the warm embrace of her sex. But you have other plans.");

	output("\n\nGrabbing her ass with one hand, you take your [pc.cockOrStrapon] in the other and thrust it into the gulf between her cheeks. She purrs and moans, pushing back against your shaft, begging you with her body for more. And you give it to her... just not the way she wants. You angle your cock up from its natural sheath and press the crown against a puffy dark ring just above it, oh so tight but oh so alluring.");

	output("\n\n<i>“Wait, that’s-”</i> the priestess starts to say. Her voice breaks into a sharp, echoing cry, though, piercing the frigid heavens. Your [pc.cockOrHardlight] rams against the clenching ring of her pucker, forcing the thick ring of flesh to spread open around your turgid crown. Her claws dig into the ice, and her tail shoots out straight behind her, slapping your cheeks with thrashing fluff. No way that’s slowing you down, though: not with the first inches of your dick sliding into the gripping vice of the milodan’s ass.");

	output("\n\nAll she can do is grit her teeth and groan, growling curses at you between ragged breaths. That only makes you harder, though. Grinning, you sink your fingers into the cat-woman’s lush fur and ample curves, enjoying the heave of her breasts in your hands, or the jiggles of her ass as your hips butt up against it.");
	
	output("\n\n<i>“D-damn offworlder!”</i> the tiger-slut grunts between thrusts so hard that her whole body jerks forward. <i>“This is blasphemous!”</i>");
	
	output("\n\nYou slap her ass, extricating a long, low moan from deep in her throat. <i>“Oh, really? Then why does it feel so good?”</i>");
	
	output("\n\nShe snarls, swatting at your [pc.face] with her furball of a tail. <i>“It does n- it... ah, damn you!”</i> the priestess howls, thrusting back on your shaft and burying her fingers into her leaking quim, adding to the growing puddle between her legs.");

	output("\n\nThat’s what you thought! And now, to cement your victory over this newly-made anal slut. You squeeze her lush ass in both hands, pulling her back against on your [pc.cockOrHardlight] until");
	if (pc.hasCock() && pc.hasKnot()) output(" her anus is splayed around your [pc.knot], tying her like the bitch she is. She throws her head back and screams in pleasure,");
	else output(" she’s putting up against your hips, her belly so full of cock that she can’t help but scream to the void above, thrashing her tail and");
	output(" squirting a messy orgasm of her own all across the ice.");

	if (!pc.hasCock())
	{
		output("\n\nThe sudden tightness brought on by the sabertooth’s climax pushes you right over the edge with her. Your hardlight garment thrums with energy, feeding back lightning bolts of pleasure through your loins. Gasping and moaning, you press your [pc.chest] into the kitty-slut’s back and let the technological marvel of your strapon give you the closest thing to a cock’s ejaculation that you could ever hope for.");
		
		output("\n\nToo bad for the fertile kitten that you’ve got nothing to pump that puffy little ass of hers with.");
	}
	else
	{
		output("\n\nA moment of tightness in your [pc.balls] presages your own impending climax. Gritting your teeth and thrusting in as deep as you can, you let loose the first [pc.cumVisc] spurts of seed erupting into her bowels. The priestess’s back arches with a long, lurid moan.");
		if (pc.hasKnot())
		{
			output(" Not one drop escapes her abused anus thanks to your [pc.knot]. You can feel the liquid load sloshing around just around your bitch-breaker before slowly draining into her belly.");
			if (pc.cumQ() >= 5000) output(" and t");
		}
		else output(" T");
		if (pc.cumQ() >= 5000)
		{
			output("he sheer volume of spunk you pour into her fills her belly in the blink of an eye. Before your orgasm passes, her belly’s bloated as if she were pregnant. Her fur drags along the ice underneath her, letting the ground handle some of the excess weight you’ve left her with.");

			output("\n\n<i>“Too bad. You feel more virile than any male I’ve met,”</i> the priestess sighs, tweaking one of her nipples and shivering as your [pc.cock] shifts inside her.");
		}

		var tEnemy:Creature = CombatManager.getEnemyOfClass(MilodanFertilityPriestess);
		var priestess:MilodanFertilityPriestess = tEnemy is MilodanFertilityPriestess ? tEnemy as MilodanFertilityPriestess : null;
		if (priestess != null) priestess.loadInAss(pc);
	}
	output(" The cat-woman goans underneath you, starting to lick her fingers clean of her pussy-juices.");
	if (pc.hasCock() && pc.hasKnot())
	{
		output(" All you can really do is lean against her, waiting for the [pc.knot] to deflate...");

		output("\n\nYour tie takes its sweet time, giving you ample opportunity to grope the priestess’s motherly bosom or rub your [pc.face] and hands through her soft, silvery fur. When you finally free yourself, you end up leaving her asshole visibly agape, its puffy black rim winking at you with just the sheerest veneer of [pc.cumColor] around the edges. Nice.");
	}
	else
	{
		output("\n\nSlowly, you lean back and pull out of her");
		if(pc.hasCock()) output(", letting loose a deluge of pent-up [pc.cumNoun] from her ass that joins the juicy mess on the ground");
		output(". She shudders at the sensation, tongue lolling from the side of her mouth. Now <i>that</i>’s a good look for her...");
	}

	output("\n\nYou rise up and give the winded cat a parting slap on the ass. What little strength she had left fails her, and the priestess’s legs and arms go splaying out to either side of her. <i>“Oof! You might be a deviant, but at least you fuck like a warrior... could have been worse,”</i> she grunts, giving you a wolfish grin over her shoulder. <i>“Just be careful it’s not you bending over for my staff next time!”</i>");

	output("\n\n");
	if (pc.isAss()) output("We’ll see about that.");
	else output("Uh-huh.");
	output(" You grab your gear and step away, leaving her to recover on the ice.");
	output("\n\n");

	processTime(10+rand(5));
	pc.orgasm();

	CombatManager.genericVictory();
}

public function fertilityPriestessTakeIdol():void
{
	clearOutput();
	showBust("MILODAN_PRIESTESS");
	author("Savin");

	pc.addHard(2);

	output("Before you decide what to do with the priestess, your gaze settles on the pillar of green stone she was handling. You gingerly pick it up, but the second you get near it, you feel an almost electric pulse run through your [pc.arm]. You gasp, clutching the obelisk until the sensation passes.");
	if (flags["UVETO_HUSKAR_FOURSOME"] != undefined)
	{
		output(" Feels just like that weird dildo the twins on the station found... actually, now that you have it in hand... it looks almost the same, too. It’s definitely shaped like a dick, with a bulbous base like a knot and balls, and tapered to a point like a milodan dick.");
	}
	else
	{
		output(" Now that you have a second to look, you realize that is undoubtedly a dildo: shaped like a cock and balls, smoothed to a polish and just ever-so-slightly soft to the touch.");
	}
	output(" Dirty girl.");
	
	output("\n\n<i>“No! No, you can’t!”</i> the defeated feline snarls, trying to rise before you push her back down, kicking her staff well away from her. <i>“The Spiritstone is sacred! You will defile it!”</i>");
	
	output("\n\nActually, you’ll sell it. You flip the idol in your hands and stow it in your backpack. The priestess growls, but is far too");
	if (enemy.lust() >= enemy.lustMax()) output(" turned on");
	else output(" battered");
	output(" to put up any kind of resistance. Now, back to the matter at hand.");

	processTime(3);
	flags["UVGR_SAVICITE_IDOL"] = 1;
	addDisabledButton(2, "Take Idol");
}

public function pcDunkedByFertilityPriestess(isRepeat:Boolean = false):void
{
	userInterface.hideNPCStats();
	userInterface.leftBarDefaults();
	generateMap();
	
	var tEnemy:Creature = CombatManager.getEnemyOfClass(MilodanFertilityPriestess);
	var priestess:MilodanFertilityPriestess = tEnemy is MilodanFertilityPriestess ? tEnemy as MilodanFertilityPriestess : null;

	if (!isRepeat)
	{
		clearOutput();
		showBust("MILODAN_PRIESTESS", bustDisplayMilodanMale(true), bustDisplayMilodanMale(true));
		author("Savin");

		if (pc.lust() >= pc.lustMax())
		{
			output("The desire these cat-folk have inflicted upon you is too much to bear. Gasping, skin flushing, you slump to your [pc.knees] and start tearing at your gear, trying to get at your equipment to find some kind of release. The priestess grins and sets her staff aside.");
		}
		else
		{
			output("Pain and fatigue overwhelms you, forcing you down");
			if (pc.hasKnees()) output(" onto hands and knees");
			else output(" onto the ground");
			output(". Gasping for breath, you force yourself to look up at the victorious cat-girl striding towards you, a cocky smile upon her face.");
		}

		output("\n\n<i>“So falls our interloper. How sad you aliens are, when your weapons and magics fail you!”</i> the cat-woman declares. She grabs your chin and forces your gaze up, making you look her in the eye. <i>“Now it’s time to fulfil this ritual... one way or another.”</i>");
		if (priestess != null && priestess.malesRan)
		{
			output("\n\nThe woman <i>tsk</i>s her tongue, glancing around the barren chamber. Her male companions are nowhere to be seen. At least you managed that small victory before succumbing to her. Growling, the milodan woman grabs and throws you onto the altar, face-up and [pc.legOrLegs] flailing over the edge.");
		}
		else
		{
			output("\n\n<i>“Get [pc.himHer] up,”</i> the woman snaps, and her male servators instantly move to grab you, dragging you onto the altar and pinning your hands down on either side of you, forcing you to stare up as the priestess saunters up, a smug grin on her black lips.");
		}

		output("\n\n<i>“Much better,”</i> she purrs, setting her staff aside and crawling up onto the ice overtop you. Her knees come to rest against your [pc.hips], and the succulent mounds of her chest nearly brush your [pc.face] before she rises up, planting her hands on your [pc.chest]. Her thick, furry tail brushes along your thighs, curling around your [pc.leg]. <i>“Now stay down, and let me show you the path of the spirits...”</i>");
	}

	if (pc.hasCock() && (!pc.hasVagina() || isRepeat || rand(3) != 0))
	{
		var cockIdx:int = pc.biggestCockIndex();
		// PC gains a moderate, permanent bonus to Virility. 

		pc.cumQualityRaw += 0.25;

		output("\n\nAs she speaks, the cat-girl’s razor claws play across your chest, tracing so close to your throat that your heart seizes up in terror. But her touch is surprisingly gentle, even as one hand closes around your throat, and the other begins worrying at your gear, pulling it away and wrapping her fingers around your [pc.cock "+ cockIdx +"]. An involuntary shiver rocks through you, but blood rushes to your prick nevertheless, drawn to your endowment");
		if (pc.cocks.length > 1) output("s");
		output(" by the milodan’s sensual touch.");

		output("\n\n<i>“This is mine now,”</i> the cat-girl purrs, stroking your burgeoning erection from stem to crown. <i>“A proper tool of worship, this is. It deserves respect... and a sheath to keep it warm.”</i>");

		output("\n\nShe grins, and her fingers shift from your throbbing dick to her own black slips. She spreads them apart, letting you see them glistening with her own arousal before her hips rise and fall, planting your [pc.cockHead "+cockIdx+"] against her steaming opening. Her fertile hips sway above you for a long moment, suspended in that moment of anticipation, before the priestess lets herself fall into your lap, taking your [pc.cock "+cockIdx+"] in one long, fluid descent.");
		
		output("\n\nYou gasp as your manhood is enveloped in a warmth unlike anything you could have imagined on this cold, inhospitable world. Above you, the cat-girl moans softly, little more than an eager purr in the back of her throat as she adjusts to your size. It only takes a few moments for her to settle in, rocking her hips in your lap and starting to work your shaft within the strong, firm grasp of her pussy.");
		
		output("\n\n<i>“Now then, one more thing before we begin,”</i> she murmurs, reaching beside you to the dark green stone idol on the altar beside you. Now that you’re so close to it, the shape the stone been chiseled into is glaringly obvious: it’s a dick. A great big stone cock nearly the size of your forearm. She traces her fingers lovingly along its length, dragging her claws across the smooth stone. Even her razor-like paws can’t leave the faintest mark on the alien rock. Nevertheless, she wraps her fingers around the phallic symbol’s base and hefts it up, staring at it with a mixture of awe and desire written across her snowy features.");

		output("\n\nAs if it were the most natural thing to do, sitting atop her defeated foe with your cock buried in her twitching quim, the feline temptress rises on her knees and reaches back, planting the base of the idol on the altar");
		if (pc.legCount == 2) output(" right between your legs, its tip nearly touching your slick shaft");
		else if (pc.legCount > 2) output(" beside your lower body, nearly close enough to touch your slick shaft");
		output(". With a smile and a purring moan, the kitty slinks back down, taking your shaft to the hilt again as she glides down the polished-smooth alien dildo. Her breath catches when she bottoms out, arching her back and clawing gently at your [pc.skinFurScales].");
		
		pc.cockChange();

		output("\n\nYou guess this must be some part of her ritual... but there’s not a lot of room for thought when there’s a rock-solid cock pressing against your own through the thin walls of the kitten’s inner depths, With the added girth stretching her out, it’s suddenly so much tighter inside her - her muscles clamp hard around your [pc.cock "+cockIdx+"], milking your cumstick with contractions like rippling waves. Her charcoal lips kiss your [pc.knot "+cockIdx+"], drawing you deep into her hungry passage before she rises up again, drawing both shafts out of her body in one long, languid motion, before dropping down on them again.");
		
		output("\n\nAnd again, and again. The kitty-cat priestess starts bouncing, riding the twinned cocks inside her with eager desire. Her hands pinch and tweak her nipples, twisting the bone pierces running through the black promontories until she throws her head back with a howl of pleasure. Her grip on your dick tightens, and you feel a rush of heat - not just from the cat-woman herself, but somewhere closer to your thighs, radiating up and through her in throbbing pulses. Your [pc.cock "+cockIdx+"] tenses, feeling the surge of energy from the [pc.knot "+cockIdx+"] spreading her lips straight to your [pc.cockHead "+cockIdx+"], nestled deep in the pussy’s slit.");
		
		output("\n\nThe alien energy demands one thing, and one thing only: an inexorable compulsion that your body cannot deny. Every muscle in your body tenses, culminating in a burst of sensation around your [pc.cock "+cockIdx+"]. [pc.Cum] surges through your shaft, erupting into the cat-woman’s waiting womb.");
		
		output("\n\nShe gasps, smiles, and rests a hand on her belly. A purr rumbles in the back of her throat, and her thick-furred tail brushes heavily against your [pc.legOrLegs]. Every twitch and throb of your dick is echoed by the grip of her pussy, refusing to let a single drop of your load escape");
		if (pc.hasKnot(cockIdx)) output(" despite your [pc.knot "+cockIdx+"] lodged between her lips");
		output(", bottling all that bubbling spunk up inside to make absolutely sure it takes.");
		
		output("\n\n<i>“Oh, the spirits are pleased, I think,”</i> the milodan purrs, tracing a pair of claws around the twitching entrance of her sex. <i>“Our fallen will return to the tribe thanks to you. A fine mate you make, after all...”</i>");
		
		output("\n\nThe priestess leans down and runs her tongue across your cheek, grinning as she slips off of you.");
		if (pc.hasKnot(cockIdx)) output(" Your thick tie comes free with an audible slurp, dislodging a small waterfall of your mixed juices onto your groin. The woman laughs, giving your cock and affectionate pat as it wilts.");
		output(" Thigh-fur stained with your seed, the cat-like alien takes her idol and withdraws into the icy chill");
		if (!isRepeat && priestess != null && !priestess.malesRan) output(", taking her two minions with her");
		output(", seemingly contented by your dick’s offering. You’re left alone to recover your stamina... and your dignity.");
		output("\n\n");

		processTime(30+rand(15));
		IncrementFlag("FERTILITY_PRIESTESSES_FUCKED");

		if (priestess != null) priestess.loadInCunt(pc, 0);
		pc.orgasm();
		pc.clearRut();
		CombatManager.genericLoss();
		return;
	}
	else if (!isRepeat && pc.hasVagina() && pc.findEmptyPregnancySlot(Creature.PREGSLOT_VAG) >= 0 && pc.blockedVaginas() == 0)
	{
		var vagIdx:int = pc.findEmptyPregnancySlot(Creature.PREGSLOT_VAG);

		pc.fertilityRaw += 0.25;

		output("\n\nThe carnal priestess picks up the dark idol from the altar beside you, running her rough tongue across its polished smooth length from flared base to tapered crown. Now that you’re so close to it, the shape the stone been chiseled into is glaringly obvious: it’s a dick. A great big stone cock nearly the size of your forearm. Even her razor-like paws can’t leave the faintest mark on the alien rock as she handles it. Nevertheless, she wraps her fingers around the phallic symbol’s base and hefts it up, staring at it with a mixture of awe and desire written across her snowy features.");

		output("\n\n<i>“I’m afraid I’ll have to pass up the honor, this time,”</i> the alien sighs. <i>“But you... I hope you’re strong of will, or I don’t know what this will do to your mind. So much pleasure all at once... I envy you.”</i>");
		
		output("\n\nThe cat-like alien grins and wraps her tongue around the tapered cockhead of the stone idol, bathing it in a mist of warmth. Her other hand closes around your neck, pinning you down against the ice. Her talons grip your [pc.skinFurScales] dangerously tight, scoring the tips across your throbbing veins. Your heart hammers in your chest, a mix of terror and arousal at seeing the woman fellate her alien idol.");
		
		output("\n\nWhen she’s finished, the crown is coated with a glistening sheen, bridged to her black lips by drooping bridges of steaming saliva. Still smiling, the priestess pulls aside your");
		if (pc.isNude()) output(" gear");
		else
		{
			if (pc.hasArmor()) output(" [pc.armor]");
			if (pc.hasArmor() && pc.hasLowerGarment()) output(" and");
			if (pc.hasLowerGarment()) output(" [pc.lowerUndergarment]");
		}
		output(", flicking the smooth curve of a claw through the cleft of your pussy, teasing your [pc.clit] until your back arches, a yelp of pleasure escaping your lips.");

		output("\n\nSomething electric touches your pussy, sending a shock of pleasure up you that resolves into a pulsing, throbbing heat of arousal. You glance down your body, trying to figure out what’s going on: the cat-woman has pressed the dildo against your loins, rubbing the smooth head against your flesh.");
		if (flags["UVETO_HUSKAR_FOURSOME"] != undefined)
		{
			output(" So it <i>is</i> savicite! Just like the ausar twins back on the station have!");
		}
		else
		{
			output(" What in the world...?");
		}
		output(" Your flesh feels like a hundred vibrators are running all across your body, making your breath come ragged and your pussy drool with needy desire.");

		output("\n\nBut the closer the dildo gets, the more you realize she’s not going to give you what you’ve suddenly come to want. As realization dawns on you, the priestess’s grin only grows wider - and soon, you feel a pressure against your [pc.asshole]. <i>“The ritual demands your womb be open and receptive, but the Spiritstone must be near. Relax yourself. I don’t want to hurt you by accident.”</i>");

		output("\n\nReflexes force you to clench");
		if (pc.hasPlumpAsshole() || pc.ass.looseness() >= 4) output(" but your [pc.asshole] is more than up to swallowing her stony shaft no matter how much your might want to resist.");
		else output(" The tip of the rock-hard rod presses against your [pc.asshole], and though your body resists as fiercely as it can, you inevitably feel the tip of the prick sliding into your ass.");
		output(" Your fingers claw at the ice underneath you, trying to find some semblance of purchase as the cat-woman violates you. The electric heat from the alien stone makes your muscles relax, acting like some sort of contact anesthetic that melts away your resistance. Your ass swallows up the first inches of turgid Uvetan stone, giving you a sense of incredible fullness and stretching out your anal passage. A scream of mind-shattering pleasure echoes through the cavern, sounding like it’s from some feral fuck-beast - your mind barely recognizes it as your own voice.");
		
		pc.buttChange(1000);
		
		if (priestess != null && priestess.malesRan)
		{
			output("\n\nSomehow over the racket, you hear footsteps approaching.");

			output("\n\n<i>“Ah, you’re back,”</i> the priestess growls over her shoulder. <i>“Feel guilty about abandoning me with your tails tucked? Or embarrassed that I defeated [pc.himHer] all by myself?”</i>");

			output("\n\nShe <i>tsk</i>s her tongue as the two males come back into view. Now their previous hostility is replaced by blatant arousal: a pair of black cocks jut out from their snowy fur, aimed at you with obvious desire. The priestess reaches out and cups one of the cat’s hefty ballsacks, rolling the fuzzy orbs between her fingers. The other milodan whines, prompting the priestess to crook her finger at him. He approaches, and the female leans down, arching her back and taking his cock into her mouth. She suckles on its tapered crown, kissing and licking all the way down to the knotty base. When she comes back up, her breath is coming harder than before, and you can see her black nipples peeking out rock-hard through her fur.");

			output("\n\n <i>“Very well, I forgive you,”</i> she teases. <i>“We have a ritual to complete, boys. You first.”</i>");
		}
		else
		{
			output("\n\n<i>“[pc.HeShe] is ready,”</i> the cat-woman purrs, rising up and beckoning to the males. They release your hands and step around the altar, coming into view. Their black, feline-esque cocks are rock hard now, jutting out from their snowy fur. The priestess grins and wraps her fingers around both shafts, giving her men each a loving stroke before returning her attentions to you.");

			output("\n\n<i>“Now the fun begins.”</i>");
		}

		output("\n\nShe gives the first of the males a squeeze on his sack, just enough to make him yip and shoot his tail out straight behind him. In any other situation, you might try to struggle, to resist what’s coming... but the soothing radiance of the dildo lodged in your ass leaves you all but ready to beg for it, your [pc.cunt "+vagIdx+"] drooling with need. The basest, most primitive parts of your brain have long since overwhelmed your senses now, and the mix of penetration, pleasure, and the growing musk of the men leaves you with one need: the need to breed. You reach down and spread your pussylips, shuddering with pleasure. Every inch of your loins feels like one big clit now - even the slightest touch nearly sets you off. Oh, god, if they actually fuck you...");

		output("\n\nThe priestess steps aside, caressing your thigh as she goes, making way for one of the burly saber-toothed men. The lumbering cat grabs your [pc.legOrLegs] and drops his black rod onto your thigh, letting the kitty-bristles along his crown tease your [pc.skinFurScales] until the tapered tip presses against your [pc.cunt "+vagIdx+"]. Your heart tightens in your chest; every nerve is already tense from anticipation and the pleasure of his touch across your over-stimulated flesh.");
		
		pc.cuntChange(vagIdx, chars["MILODAN_MALE"].cockVolume(0));
		
		output("\n\n<i>“May you be a fertile vessel,”</i> the priestess murmurs, placing a hand on your [pc.belly]. The carven head of her staff glows radiantly, distracting you from the beast-man just as he thrusts in. Your back arches, [pc.chest] thrusting to the heavens as thick, throbbing milodan cockmeat slips between your drenched lips and into your hungry slit. The bestial cat drives himself in almost to the hilt in one mighty thrust, stopping only when his a knotty bulge at his cock’s base presses against you. The priestess grabs his shoulder, pulling him back before he can tie you.");

		output("\n\n<i>“Don’t be selfish,”</i> she coos, reaching down and slapping his ass. <i>“Your brother needs a turn, too.”</i>");

		processTime(10+rand(2));
		pc.maxOutLust();

		clearMenu();
		addButton(0, "Next", fertilityPriestessPcKnockUpII, vagIdx);
		return;
	}
	else
	{
		output("\n\nThe prideful cat sneers down at you, pulling aside your [pc.gear]... and settling her eyes on your");
		if (!pc.hasVagina()) output(" crotch.");
		else output(" belly.");

		output("\n\n<i>“What.... what am I supposed to do with this, though?”</i> she wonders aloud, eyes wandering across your body. After a long moment, she <i>tsk</i>s her tongue and rises to her feet, stepping away from you. <i>“Perhaps I wasn’t so lucky to find you after all. Stay down for a few minutes like a good [pc.boyGirl]... and never again trespass on our sacred grounds.”</i>");

		output("\n\nThe priestess huffs and turns, striding out of the cave with her alien idol tucked under one arm. You flop back against the altar and sigh, a sense of relief");
		if (pc.lust() >= pc.lustMax()) output(" and blue-balled desire");
		output(" overtaking you. Well, it could have been worse...");
		output("\n\n");

		processTime(10+rand(5));
		CombatManager.genericLoss();
		return;
	}
}

public function fertilityPriestessPcKnockUpII(vagIdx:int):void
{
	clearOutput();
	showBust("MILODAN_PRIESTESS", bustDisplayMilodanMale(true), bustDisplayMilodanMale(true));
	author("Savin");

	output("The cat-man laughs, sending vibrations from his belly through his dick. <i>“As you say,”</i> he says, groping one of her bone-pierced breasts before returning his hands to your [pc.hips].");

	output("\n\nSomewhere between the tip and the knot touching your lips, your [pc.tongue]’s drooped out of your mouth, and your vision’s gone hazy. Pleasure ripples through you, making your breath come in uneven gasps. You feel so close to the edge of orgasm from just the first thrust alone! Feeling him start to pull back, to slide that nubby, knotty kitty-cock back through your [pc.cunt "+vagIdx+"] leaves you screaming your sudden climax to the heavens. Your twat squeezes hard around the two turgid rods invading your holes, trying at once to draw them deeper and push them out - to make them do <i>something</i> to make you feel even better.");
	
	pc.orgasm();
	
	output("\n\nThe stone rod remains passive, lodged in your ass; the milodan man, though, is more than happy to oblige. After his rough entrance, there’s no chance he’s going to be gentle now: the bestial sabertooth starts thrusting his hips, vigorously pumping his nubby shaft through your tunnel. Between every thrust, the burly man grunts and huffs. His black lips are twisted in a grimace of effort, and clouds of mist billowing between his tusk-like teeth.");
	
	output("\n\nIt doesn’t take long for him to reach his peak, but you can hardly complain: you’ve cum once just from his entrance, and the actual act has nearly brought you to the edge again. A sudden rush of musky heat flooding into your [pc.cunt "+vagIdx+"] is exactly what you need to find that glorious peak of ecstasy once again.");
	
	pc.maxOutLust();
	
	output("\n\n<i>“Take it. Take it all!”</i> the milodan man grunts, coming so close to knotting himself between spurts that the priestess has to grab hold of his cock, wrapping the bitch breaker in her fist. At the apex of one of his pelvic thrusts, the priestess pulls him back by the shoulders. He stumbles back, dragging his cock right out of your well-fucked pussy and causing a parting arc of white to shoot from his crown across your [pc.belly].");
	
	pc.orgasm();
	
	output("\n\nAll you can manage is to moan weakly, trembling with the aftershocks of orgasm and leaking the alien’s seed from your [pc.cunt "+vagIdx+"]. The other male gives his comrade a rough but playful punch on the shoulder and takes his place. You gasp as a hard, hot slab of alien dickmeat flops onto your thigh, rubbing its crown in the pool of juices basting your loins before pressing into your still-gaping fuckhole.");
	
	pc.cuntChange(vagIdx, chars["MILODAN_MALE"].cockVolume(0));
	
	output("\n\n<i>“I’m amazed a weak little off-worlder has lasted so long,”</i> the priestess teases, running a hand across your [pc.chest] before leaning down and licking the cum off your belly. You shudder from the touch of her rough, feline tongue and the simultaneous intrusion of the male’s thick dick. The alien stone in your ass grows even warmer, radiating all throughout your body now. Every nerve feels like it’s ready to erupt - to explode in pleasure.");
	
	pc.maxOutLust();
	
	output("\n\n<i>“You’re stronger than I expected,”</i> the priestess continues, tracing her tongue down and down your body. <i>“You’ll be sure to conceive great warriors... new hosts for the lingering spirits of our ancestors. They must approve of you, to let you see the end of things.”</i>");

	output("\n\nHer words come to an end as her tongue finds your [pc.clit], flicking across the rosey bulb before she starts to suckle on it. You scream again, arching your back off the ice and flailing your [pc.legOrLegs]. Your hands grasp futilely at the Priestess’s hefty chest, accomplishing nothing more than a weak grope at her pierced nipples. She returns the gesture with a wink, wagging her snowy tail and circling your [pc.clit] with her tongue, over and over again.");

	output("\n\nBetween dildo, cock, and tongue, you’re treated to orgasm after orgasm. Each climax comes on the heel of the last, overwhelming what little sense you have with a miasma of pleasure. The only thing that brings you back to the present is the now-familiar spreading warmth of another seeding. Above you, the milodan male grunts and pumps his hips forward, hammering his knot into the gaping, drooling lips. You’re too hoarse now to scream, to do anything but gasp and moan as yet another load of kitty-cream floods your womb. Not one drop escapes this time, packed in by the milodan’s decidedly un-feline knot.");
	
	for(var i:int = 0; i < 3; i++)
	{
		pc.loadInCunt(chars["MILODAN_MALE"], vagIdx);
		pc.orgasm();
	}

	output("\n\nThe priestess rights herself and picks up her staff once again. One of her hands rests on your [pc.belly], and you watch as the staff-head pulses with a dull green glow.");

	output("\n\n<i>“The spirits are pleased. A healthy warrior will soon join our bloodline once again. Our thanks, offworlder, for surrendering your flesh. Now rest... and never again defile our sacred grounds.”</i>");

	output("\n\nShe waves her hand over your [pc.face], and suddenly you feel very, very sleepy...");

	processTime(8+rand(5));

	clearMenu();
	addButton(0, "Next", fertilityPriestessPcKnockUpIII, vagIdx);
}

public function fertilityPriestessPcKnockUpIII(vagIdx:int):void
{
	clearOutput();
	showBust("MILODAN_PRIESTESS", bustDisplayMilodanMale(true), bustDisplayMilodanMale(true));
	author("Savin");

	output("You gasp and shoot straight up, glancing around in a panic. What the... what just happened to you? The ice is all around you, reeking of sex and sweat... but the milodan are gone. You’ve been cleaned up since your encounter, though your ass and pussy both feel loose and tender from the fucking. You have no doubt that the males’ cum has settled deep inside you by now, and that woman’s “ritual”... You shudder, wrapping your arms around your bare chest.");
	
	output("\n\nAnd, of course, that dildo-like idol is gone. A small fortune in savicite, that was... Damn.");
	output("\n\n");

	pc.orgasm();

	processTime(180);

	var miloMale:MilodanMale = new MilodanMale();
	pc.loadInCunt(miloMale, vagIdx);

	CombatManager.genericLoss();
}

public function GRM44Flirt():void
{
	clearOutput();
	author("Savin");
	showBust("MILODAN_PRIESTESS", bustDisplayMilodanMale(true), bustDisplayMilodanMale(true));

	output("Flashing your best Steele smile, you put your hands up in a sign of peace and say that sure, you were watching. How could you not, with so much beauty and passion on display just a few minutes ago. That was quite the show they put on, you add - you enjoyed it quite a bit.");
	
	output("\n\n<i>“Is that right?”</i> the female milodan coos, brushing her snowy fingers across your chin.");
	if (pc.hasCock()) output(" <i>“You should have joined in, then. All seed is welcome, even that of an alien, in restoring the Lost Ones. Perhaps next time.”</i>");
	
	output("\n\nShe smiles and slips past you, followed by her mates. They march out of the cavern, back the way you first came from. One of them, you note, has the green stone curled up in his fist, carrying it off with them.");

	processTime(3);
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function GRM44Apologize():void
{
	clearOutput();
	author("Savin");
	showBust("MILODAN_PRIESTESS", bustDisplayMilodanMale(true), bustDisplayMilodanMale(true));

	output("You blush and apologize, saying you hadn’t come here intending to peep on her and... whatever it was they were doing.");
	
	output("\n\nShe smiles and puts a hand on her hip. <i>“You’re lucky our rituals are not some closely guarded secret... nor is my modesty. Be careful next time, off-worlder... or I might make you join in!”</i>");
	
	output("\n\nThe woman gives your cheek something between a pat and a slap, and beckons her menfolk to follow her out. They march out of the cavern, back the way you first came from. One of them, you note, has the green stone curled up in his fist, carrying it off with them.");

	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function soloFertilityPriestessFight():void
{
	clearOutput();
	author("Savin");
	
	showBust("MILODAN_PRIESTESS");
	//showName("MILODAN\nPRIESTESS");
	
	output("As you’re wandering through the snowy wastes of the Rift, you catch sight of a figure moving towards you across the plains. Whoever they are, they’re wrapped up in a heavy, hooded fur coat that billows in the wind, and carry a staff that guides them through the shin-high banks of snow. You have just a moment to ready yourself before a familiar form saunters up through the snow, throwing aside her cloak to reveal the amazonian physique of a milodan woman, baring her saber-tooth fangs... and so much more -- she was naked under that cloak, and now a pair of mammoth breasts, a set of hips made for mothering, and a pair of black pussylips glistening with her shameless desire.");

	output("\n\n<i>“I thought it might be you!”</i> she snarls, twirling her staff until its gemstone head is levelled at your [pc.chest]. <i>“My sister");
	if (flags["FERTILITY_PRIESTESSES_FOUGHT"] != undefined && flags["FERTILITY_PRIESTESSES_FOUGHT"] > 1) output("s have");
	output(" mentioned you.");
	if (flags["UVGR_SAVICITE_IDOL"] != undefined && flags["UVGR_SAVICITE_IDOL"] == 1) output(" This for stealing from our clan!");
	else if (flags["FERTILITY_PRIESTESSES_FUCKED"] != undefined && flags["FERTILITY_PRIESTESSES_FUCKED"] >= 1) output(" I hear you’re a good fuck. And I’m not taking no for an answer.");
	else output(" Let’s see what you’ve got, alien!");
	output("”</i>");

	CombatManager.newGroundCombat();
	CombatManager.setFriendlyActors(pc);
	CombatManager.setHostileActors(new MilodanFertilityPriestess());
	CombatManager.victoryCondition(CombatManager.ENTIRE_PARTY_DEFEATED);
	CombatManager.lossCondition(CombatManager.SPECIFIC_TARGET_DEFEATED, pc);
	CombatManager.encounterTextGenerator(function():String {
		var s:String = "The Fertility Priestess, a female milodan, stands tall and nude before you, wielding a long black staff tipped with a glowing green crystal. She’s got a decidedly fertile figure, with broad hips and large breasts, each capped with a bone-pierced black nipple, with all her sensuous curves covered in a thick layer of spotted white fur. A streak of ice-blue hair adorns her head, shaved down to run between her pointed feline ears and trail down her back.";
		return s;
	})
	CombatManager.victoryScene(pcRepeatFertilityPriestessVictory);
	CombatManager.lossScene(pcRepeatFertilityPriestessLoss);
	CombatManager.displayLocation("PRIESTESS");
	
	IncrementFlag("FERTILITY_PRIESTESSES_FOUGHT");
	
	clearMenu();
	addButton(0, "Fight!", CombatManager.beginCombat);
}

public function pcRepeatFertilityPriestessVictory():void
{
	userInterface.hideNPCStats();
	userInterface.leftBarDefaults();
	generateMap();
	
	clearOutput();
	author("Savin");
	showBust("MILODAN_PRIESTESS");

	//Reset loss tracking for bad end:
	flags["MILODAN_FERTILITY_REPEAT_LOSSES"] = undefined;

	output("<i>“Gah!”</i> the priestess grunts, falling to a knee and clutching at her staff. <i>“Alright, I yield! I yield!”</i>");

	output("\n\nShe whines and");
	if (enemy.HP() <= 0) output(" rubs her head, trying to shake off the damage you’ve done. <i>“Enough with the hitting - I get the idea. Maybe... maybe make it up to you, huh?”</i> she says, flashing you a wry little smile.");
	else output(" clenches her legs together, trying to hide just how wet and ready you’ve left her. <i>“Just... just fuck me already. Please! Sun and spirits, I need it!”</i>");

	pcDefeatsFertilityPriestess(true);

}

public function pcRepeatFertilityPriestessLoss():void
{
	IncrementFlag("MILODAN_FERTILITY_REPEAT_LOSSES");
	if(flags["MILODAN_FERTILITY_REPEAT_LOSSES"] >= 4)
	{
		milodanPriestessBadend();
		return;
	}
	clearOutput();
	author("Savin");
	showBust("MILODAN_PRIESTESS");

	output("You stumble back, planting your ass in the snow");
	if (pc.lust() >= pc.lustMax()) output(" and desperately clawing at your gear, groping at yourself");
	else output(" and reeling from the pain");
	output(". The priestess howls with the victory, throwing her head back and laughing. As she does so, she plants her staff in the snow and turns her attentions fully to you, licking her lips with predatory desire.");

	output("\n\n<i>“Now, let’s see what we have here...”</i> she rubs her hands together, tail swishing eagerly behind her.");
	if (flags["FERTILITY_PRIESTESSES_FUCKED"] != undefined) output(" <i>“For your sake, I hope my sister wasn’t exaggerating about your sexual prowess like she did your skill in battle!”</i>");

	if (!pc.hasCock())
	{
		userInterface.hideNPCStats();
		userInterface.leftBarDefaults();
		generateMap();
		
		output("\n\nThe priestess makes short work of your [pc.gear], tearing enough of your kit aside to get a good look at your");
		if (pc.HP() <= 0) output(" battered");
		else output(" desperately lusty");
		output(" body. Her victorious grin turns sour, though, when her gaze wanders down");
		if (pc.legCount >= 2) output(" between your legs");
		else output(" to your loins");
		output(" and sees your [pc.groin]. Scrunching her little pink nose, the priestess crosses her arms underneath her monumental bosom and scowls down at you.");

		output("\n\n<i>“All that fuss, and you don’t even have a nice dick to make it worth my trouble? I thought all you aliens had huge, throbbing cocks! Oh, I don’t know what my sister saw in you...”</i>");

		output("\n\nShe <i>tsk</i>s her tongue and shifts her hands down to her hips. Striding forward, the priestess plants a furry paw on your crotch,");
		if (pc.hasCock()) output(" one of her claws teasing dangerously close to your [pc.clit]");
		else output(" rubbing the bare flesh with the padded heel of her foot");
		output(". <i>“Well... the right of conquest is mine, so I suppose I must find something for you to do.”</i>");

		if (pc.isMisc()) output("\n\n<i>“T-that’s really not necessary...”</i>");
		else output("\n\n<i>“Oh, shit,”</i>");
		output(" you whine as the priestess stalks forward, grabbing her cloak from the snowy ground and throwing it over her shoulders while she slinks down onto her knees, planting her dark pussylips tantalizingly close to your [pc.face] - so close that you can feel the sultry heat radiating off her plump pussylips. Her heavy fur cloak settles over the rest of your body, shielding both of you from the cold in a wave of sweet relief.");

		output("\n\nBut the sense of safety the furs provide is short-lived, as you realize you’re trapped beneath it and the buxom tiger-girl both. You get the feeling she’s grinning down at you now, but you can barely make out her face through the nearly nonexistant gap between her beachball bosoms. From high above, you hear her bark, <i>“Lick, dog.”</i>");

		output("\n\nYou grumble, but there’s not much you can do but comply");
		if (!pc.hasHeatBelt()) output("... and having her furry ass planted on you is about the only thing keeping the incessant chill at bay");
		output(". You lean up and extend your tongue to the steamy slit between the priestess’s meaty thighs, only to have your [pc.face] grabbed by one of her fuzzy paws and pushed back into the snow.");

		output("\n\n<i>“Not there, dog,”</i> she smirks, shifting forward on her knees. <i>“Only aliens that bring me a nice, thick cock to drain get to play with </i>that<i> hole.”</i>");

		output("\n\nThe milodan gives herself a rough slap on the ass, making the rounded peak jiggle before she spreads her cheeks, showing off a bright pink pucker wobbling over your face.");

		output("\n\n<i>“Cockless weaklings are only fit to service a priestess of fertility’s tailhole. So get to cleaning, or else you’re going ass-up in the snow and we’ll see how far my staff goes up yours.”</i>");

		output("\n\nYou’re... mostly sure she’s teasing, but the threat is enough to convince you to obey. That, and the way she sways her hips seductively, winking her hole at you with enough control to tell you that she’s had plenty of experience. Reluctant as you might be, you reach your [pc.tongue] out and flick the tip across the pink tailhole hovering over your face. The taste comes in a rush of bitterness, earthy and just a bit salty with the sweat of your battle. The priestess’s tail thumps hard against your [pc.belly], and you’re fairly sure you hear a little gasp escape her lips before she stifles it.");

		output("\n\n<i>“Keep going!”</i> she orders, reaching down and pinching one of your [pc.nipples] when you pause to savor her pleasured sounds. Dammit. You reach up and dig your hands into her furry flanks, getting yourself some leverage on those massive thighs. The priestess just laughs and pushes her ass further on your face, giving you no choice but to get back to work. Your tongue runs through the valley of her ass’s ample cleavage, working until the slender stretch of furless ass-flesh glistens with a sheen of saliva. Between long licks, you circle her pink hole with your [pc.tongue], teasing the rim and putting just the barest hint of pressure on her ass, threatening to penetrate.");

		output("\n\nRather than squirm, or recoil, or whatever you might have expected, the sultry priestess relaxes her muscles, and you find your tongue slipping an inch into the squeezing confines of her asshole. That draws a long, lurid moan out of her at last, along with a rapid-fire series of clenches that completely trap your tongue inside her. Her muscles pull your [pc.tongue] out from between your [pc.lips], refusing to let go as if you’d licked a lamppost in winter.");

		output("\n\n<i>“Get in there, [pc.boyGirl],”</i> the milodan growls. She’s starting to rock her hips now, riding your face in the absence of a cock in your loins. <i>“Make it shine down there!”</i>");
		
		output("\n\nEven as she’s saying it, though, you can hear her breath coming a little quicker. Something wet, steamy-hot, and sweet smelling drools onto your forehead. Your eyes are drawn upwards, back to the full charcoal lips nestled between the buxom winter amazon’s thighs - now splayed over around a pair of fuzzy fingers thrusting in and out to the same tempo as your tongue’s squirming.");
		
		output("\n\n<i>“That’s it. Just like that!”</i> the priestess howls, bouncing on her knees and driving your tongue deeper and deeper into her ass. Her fingers drill into her sodden quim and tease her clit, giving herself as much pleasure as you are. Now she’s just shamelessly getting off on your humiliating submission, too, leering down at you with a self-gratified smile.");

		output("\n\nHer orgasm can’t");
		if (silly) output(" cum");
		else output(" come");
		output(" soon enough.");

		output("\n\nWhen it does, your [pc.belly] is battered by her thick tail, and your [pc.face] is showered in a hot mist of femcum. The priestess howls with pleasure, digging her clawed hands into your [pc.hair] as her voice lilts into a log, ragged stream of laughter.");

		output("\n\n<i>“Haha! You offworlders think you’re so tough, coming here and ruining our world... taking everything as if you own it. But look at you, shivering in the cold and licking ass like a good little "+ pc.mf("fuck-boy", "bitch") +".”</i>");

		output("\n\nStaggering to her feet, the priestess dusts herself off her runs a hand through her fur. <i>“Now why don’t you head back to your big city in the west like all the other aliens with your tail tucked between your legs.”</i>");

		output("\n\nShe sneers down at you and grabs her cloak and staff, turning back to the frozen wastes of the north and leaving you to scramble for your gear to keep warm...");
		output("\n\n");

		processTime(10+rand(5));
		pc.orgasm();

		CombatManager.genericLoss();
	}
	else
	{
		pcDunkedByFertilityPriestess(true);
	}
}

//Milodan Priestess bad end
//Lose 5 times without winning
public function milodanPriestessBadend():void
{
	showBust("MILODAN_PRIESTESS");
	author("Wsan");
	var x:int = 0;
	if(pc.hasCock()) x = pc.biggestCockIndex();
	output("<i>“Well, well, you just can’t win at all, can you?”</i> the priestess crows, looking down at your " + (pc.HP() > 1 ? "lust-addled":"battered") + " form with a triumphant smirk. <i>“I’ve heard about you from my sisters; you’ve become somewhat of a campfire story. The stalker alien that can’t fight to save [pc.hisHer] life.”</i>");
	output("\n\n<i>“I’m not </i>stalking<i> you,”</i> you protest, cheeks flushing. <i>“You just keep showing up when I’m exploring!”</i>");
	output("\n\n<i>“Hmm,”</i> she replies, looking unimpressed. <i>“But it’s true that you can’t fight. Not like we do. Really, you’re hopeless.”</i>");
	output("\n\nYou look down bitterly as the curvy woman clicks her tongue, shaking her head before continuing. <i>“I think there’s only one way left to prove yourself, alien. As a breeder for the tribe.”</i>");
	if(pc.lust() >= 75) 
	{
		output("\n\nConsequences be damned, you’re so full of lust right now in front of this sexy woman that you can’t even bring yourself to object as her expression shifts to a snarling grin. <i>“Now strip, brat.”</i>");
		output("\n\nYou sullenly strip your equipment off, acknowledging your defeat. Besides, you’ve been in this situation before - you know getting naked in front of this proud priestess is just a prelude to the main event.");
	}
	else
	{
		output("\n\nAs battered as you are, you can’t hope to put up a fight against the priestess, but you’ll try it anyway. A foot planted on your chest brings you roughly to the ground the moment you try to move, stymying any chance you might have had.");
		output("\n\n<i>“Too bad,”</i> the milodan woman sighs, pressing down. <i>“I’ll strip you off myself.”</i>");
		output("\n\nShe unceremoniously rips your equipment off, leaving you stark naked while she stands above you with a salacious smirk curling her lips.");
	}
	output(" She kneels before you and runs her delicate fingers down your [pc.chest], stopping to lightly squeeze a [pc.nipple] before she");
	if(pc.biggestTitSize() >= 1 && pc.hasVagina())
	{
		if(pc.biggestTitSize() <= 2) 
		{
			output(" cups your modest breasts and hums good-naturedly like she’s considering clothing at a store.");
			output("\n\n<i>“These ought to swell up after you’ve been bred with a few litters,”</i> she surmises. <i>“You might not ever match mine, but you’re so young... you’ve got real potential.”</i>");
		}
		else if(pc.biggestTitSize() <= 7)
		{
			output(" cups one of your considerable breasts and jiggles it, humming in approval.");
			output("\n\n<i>“These aren’t bad,”</i> she coos. <i>“They might even swell up as big as mine after you’ve been knocked up with a few litters.”</i>");
		}
		else if(pc.biggestTitSize() <= 17)
		{
			output(" bounces one of your big, soft breasts up and down making noises of approval.");
			output("\n\n<i>“Oh, you’re going to make a </i>fantastic<i> breeder,”</i> she purrs. <i>“Look at these. Just perfect.”</i>");
		}
		else
		{
			output(" sinks a hand into one of your soft, massive breasts with a growl of approval.");
			output("\n\n<i>“You need to be bred immediately to put these to good work,”</i> she croons, squeezing you. <i>“There’ll be enough milk in here to nurse an entire tribe of kits.”</i>");
		}
		if(pc.hasCock())
		{
			output("\n\n<i>“You’ve even got a cock of your own to help out,”</i> she continues with a grin. <i>“Perfect.”</i>");
			output("\n\nYou grunt at the sudden touch.");
		}
		if(pc.isLactating()) output("\n\n<i>“Oh,”</i> she murmurs in surprise as [pc.milk] begins to leak from the nipple she tweaked, <i>“looks like you’ve gotten a head start for us, even. Good for you.”</i>");
	}
	//else:
	else
	{
		if(pc.hasCock()) 
		{
			output(" grabs your [pc.cockBiggest].");
			if(pc.cocks[x].cLength() < 5) output("\n\n<i>“Hmm,”</i> she mutters, holding it between her forefinger and thumb. <i>“Not winning any honor with this, that’s for sure. But you can still breed.”</i>");
			else if(pc.cocks[x].cLength() <= 8) output("\n\n<i>“This is big enough to breed with,”</i> she says, rubbing you. <i>“You’re going to be </i>very<i> busy.”</i>");
			else if(pc.cocks[x].cLength() <= 14) output("\n\n<i>“Oh, this is perfect breeding size,”</i> she purrs, admiring your length in her hands. <i>“You’re going to make my sisters and I <i>so</i> happy, I can tell.”</i>");
			else if(pc.cocks[x].cLength() <= 20) output("\n\n<i>“Now this is more like it,”</i> she says, grinning. <i>“You might not be able to fight, but you can definitely </i>fuck<i>.”</i>");
			else if(pc.cocks[x].cLength() <= 27) output("\n\n<i>“Big [pc.boyGirl], aren’t you?”</i> she mutters, holding your slab of meat in her hand and rubbing you. <i>“The more experienced sisters are going to </i>love<i> this...”</i>");
			else output("\n\n<i>“Oh- wow, I always thought the stories about aliens having massive cocks were...”</i> she trails off, staring at the gigantic prick in her hand. <i>“The younger sisters are going to have to do some serious stretching.”</i>");
			if(pc.cockTotal() > 1) output("\n\n<i>“Oh?”</i> she says, raising her eyebrows. <i>“You even have a second one. Now I’m interested in seeing if they both work... you could be our best breeder yet.”</i>");
		}
		else if(pc.hasVagina())
		{
			output(" runs her hand down your groin to find [pc.oneClit] and tweak it with a grin.");
			output("\n\n<i>“You’ll be using this aaaall the time soon enough.”</i>");
		}
		else
		{
			output(" rubs her fingers across your curiously smooth groin and grunts in irritation.");
			output("\n\n<i>“Damn aliens...”</i> she growls. <i>“Don’t think I won’t find a use for you, brat. Either as a cocksheath for the men or as my servant.”</i>");
		}
	}
	output("\n\nShe steps over you, idly rubbing her clitoral hood before sinking to her knees above your face, leaving aside her staff and planting her hands on your chest to present you with her slick, glistening slit. Droplets of arousal gleam in her dusky folds, all but inviting you to drink your fill of her. Then she drops her wide, curvy ass on your face and presses her sweet snatch against your mouth, grinding into you.");
	output("\n\n<i>“Hold my waist,”</i> she commands you, grabbing your hands and planting on her wide pup-bearing hips. <i>“You’re going to have to learn how to </i>truly<i> please a woman from beneath her when you return with me, but don’t worry. You’ll have ample opportunity to learn.”</i>");
	output("\n\nDespite her harsh words, you can feel - taste - how aroused she is on your [pc.tongue]. Her haughty demeanor melts away as you ply her fertile pussy with your mouth, sucking on her labia and dipping your tongue into her tight slit while your nose grinds against her little clitty. You already know that you’re going to have to get her off before even thinking about what comes next, let alone resistance. Gripping her by the hips, you start to tongue-fuck the slutty priestess while she moans and yowls in approval.");
	output("\n\n<i>“Oh, that’s </i>so<i> much better,”</i> she moans, rolling her slit across your face. <i>“You were never cut out for this fighting nonsense in the first place. Mmmf! Ooh, you’re so much better at this!”</i>");
	output("\n\nAs shameful as it is, you have to admit she might be right. You haven’t had any luck trying to fight her but now that you’ve got her thick, curvy ass seated on your face, she’s rocking and moaning like a whore, revelling in the pleasure. Rubbing her glistening onyx sheath against your [pc.lipsChaste], she starts to let out the sweetest pleasure-tinged moans, her wide, strong thighs drawing inwards until she lets out a girly scream of delight.");
	output("\n\n<i>“Yes! Yeessss,”</i> she groans, squeezing your head between her sweaty thighs as she cums all over your face. <i>“Uuugggh, fuck...”</i>");
	output("\n\nHer juices squirt across your lips and tongue, running down your chin and leaving you with a taste reminiscent of berries in your mouth. She lets out a gigantic satiated sigh when she stops shivering, relaxing her grip and deliberately pushing off your chest to stand back up, lifting her hands above her head and bending her wide hips to the side to stretch.");
	output("\n\n<i>“Nnnn... good enough,”</i> she says, beckoning you with a finger. <i>“Come on, [pc.boyGirl]. Walk close to me or you’ll die in this cold. Up!”</i>");
	output("\n\nShe forces you back onto your [pc.feet], surprising you with both the willingness with which she pulls you closer and the warmth of her massive fluffy tail wrapping around your body. She’s like a furnace! You find yourself leaning closer for comfort and she chuckles indulgently, putting an arm around your [pc.hips].");
	output("\n\n<i>“At least you’ve got </i>some<i> smarts for an alien,”</i> she says, reaching down to");
	if(pc.hasCock()) output(" squeeze your [pc.cockHead " + x + "]. <i>“You’ll be doing a lot of making up for lost time, [pc.boyGirl]. Don’t expect many breaks.”</i>");
	else if(pc.hasVagina()) output(" smoothly slide one finger right up into your [pc.pussy]. <i>“Don’t worry. The men of our tribe are </i>extremely<i> passionate lovers... you’ll be well taken care of.”</i>");
	else output(" squeeze your [pc.ass]. <i>“You’re going to make for some </i>wonderful<i> stress relief for the men and women of our tribe.”</i>");
	processTime(30);
	pc.lust(15);
	clearMenu();
	addButton(0,"Next",milodanPriestessBadend2);
}

public function milodanPriestessBadend2():void
{
	clearOutput();
	showBust("MILODAN_PRIESTESS");
	author("Wsan");
	output("The journey back to the priestess’ village is brief, though she makes sure to keep you pent-up and lusty on the way. By the time you arrive ");
	if(pc.isHerm()) output("sticky, translucent precum is running all down your shaft" + (pc.cockTotal() > 1 ? "s":"") + " with more beading at the head" + (pc.cockTotal() > 1 ? "s":"") + ", and your [pc.thighs] are a damp, drippy mess.");
	else if(pc.hasCock()) output("sticky, translucent precum is running all down your shaft" + (pc.cockTotal() > 1 ? "s":"") + " with more beading at the head" + (pc.cockTotal() > 1 ? "s":"") + ", her thumb pressed tightly against your length.");
	else if(pc.hasVagina()) output("your [pc.thighs] are a damp, drippy mess, glistening strands of arousal snapping as she brusquely withdraws her finger and pops it in your mouth.");
	else output("you’re burning with the desire to be fucked, anything to be rid of this seemingly endless arousal.");

	output("\n\nThe introductions are very short. Before you’re a breeder you’re still a new, novel alien to taste and experience, and that’s exactly how you’re used.");

	if(pc.isHerm()) 
	{
		output("\n\nYou have a strong, virile milodan male hurriedly pounding his studly cock into your wet cunt within seconds of meeting him, so eager to fuck you that he doesn’t even bother to push you to the ground, instead");
		if(pc.isTaur()) output(" hopping across your back and thrusting into you standing.");
		else if(pc.isNaga()) output(" lifting your coils with absurd, lust-driven strength and thrusting into you.");
		else output(" just lifting your leg over his shoulder and thrusting into you standing.");
		output(" You cum <i>well</i> before he does, groaning and panting as your half-hard cock throbs and spurts ropes of wasted seed onto the ground. The milodan doesn’t even notice, too enchanted by the prospect of fucking the hell out of your sexy alien pussy.");
		pc.cuntChange(0,250);
		output("\n\nSome time after your third rough, forced orgasm, a priestess enters the tent and immediately admonishes the male taking you, whacking him on the head with her staff. You get a fleeting break, collapsing to the ground and moaning in the wake of it all while she browbeats your very willing partner. Soon enough, though, you find him");
		if(pc.isTaur()) output(" pushing you onto your side, showing off your underslung cock to the woman accompanying him.");
		else if(pc.isNaga()) output(" pushing you onto your back, allowing the priestess access to your stiffening cock.");
		else output(" pushing you down and rolling you on top of him, his swollen, dripping cock resting against your inflamed pussylips. Your stiffening cock is presented to the priestess, utterly defenseless.");
		output("\n\nShe licks her lips.");

		output("\n\nHer moan of delighted bliss drowns out your groan of despair as the dual action of her rapidly bouncing atop you and the male beneath you pounding you breathless forces another orgasm from your aching body. Your back arches so hard your [pc.ass] momentarily comes off the male’s groin before he’s deep inside you once more, your [pc.cum] shooting deep into the priestess’ womb as she croons in pleasure.");
		pc.cockChange();
		output("\n\n<i>“Perfect,”</i> she sighs over the dull, frenzied slaps of fur on [pc.skinFurScales] and your animalistic grunts. <i>“Don’t get too worn out, now. The news of your arrival’s spread through the entire tribe by now, and </i>everyone<i> wants a turn.”</i>");
		output("\n\nYou don’t even have time to comprehend what she’s saying before another woman has entered the tent, looking down at you with bright, lusty eyes and tight, dripping pussy. You groan in despair.");
	}
	else if(pc.hasCock())
	{
		output("\n\nThere’s a beautiful milodan woman fucking the hell out of you seconds after she enters the tent, bouncing on your groin and yowling like a wildcat while she holds you down with surprising strength. She’s very easy to please, cumming multiple times before she finally wrings an orgasm out of you with her rippling cunt and a happy moan, licking your face before stepping away. Then there’s another... and another, and more in their wake. Soon you’re literally surrounded by pent-up, breed-hungry milodan women, the largest of which holds your head between her thick thighs, grinding her dripping cunt all over your lips while another pounds her butt into your groin in search of your next orgasm.");
		pc.cockChange();
		output("\n\nIt’s not long in coming. You empty your" + (pc.balls > 0 ? " [pc.balls]":" self") + " up into her greedy womb, your cock flagging before you find a potion pressed to your lips and poured down your throat. It burns bitterly on the way down, the warmth spreading from your tummy and coalescing in your groin. Suddenly you find yourself hornier than ever before, the women stuffing leafen herbs in your mouth as your cock grows and throbs, hardening until it feels like you have a steel rod protruding from your body.");
		output("\n\nThey’re quick to capitalize. You’re ravaged by an ever-growing crowd of horny milodan, grabbing your hands and thrusting your fingers up their cunts while they wait their turn to bounce on your cock and milk you for your [pc.cum]. The priestess that brought you in merely watches with a smug, triumphant grin and fingerfucks her pussy, all but gloating over your defeat. When at last the crowd begins to disperse and you’re left groaning and aching, she bends over and smiles fiercely.");
		output("\n\n<i>“And now you’ll keep me company all night, wanderer.”</i>");
	}
	else if(pc.hasVagina())
	{
		output("\n\nThere’s a massive, throbbing kittycock occupying your");
		var tightyWhitey:Number = pc.vaginas[0].looseness();
		if(tightyWhitey < 3) output(" tight little slit");
		else if(tightyWhitey < 4) output(" your whorishly loose slit");
		else output(" your gaping cunt");
		output(" within seconds of a milodan man’s entry into the tent, holding you tight while he spreads you wide around his prickly cock. The spines might be annoying were he taking it slow but when he’s pounding you so fucking hard like this - you grit your teeth, feeling an uncomfortably strong orgasm rising within you.");
		output("\n\n<i>“Fffuck!”</i> you gasp, panting as your core tenses up, slapping ineffectually at his muscular furred arms. <i>“Fuck! Fuh- fuuuck, FUCK!”</i>");
		output("\n\n<i>“Such a limited vocabulary,”</i> the priestess coos, watching you while she masturbates to the sight of your violent orgasm. Your back would be arched like a horseshoe if not for the incredible strength with which the milodan holds you in place. <i>“Fret not, wanderer. Soon you’ll be calling out ‘yes, master, please’... but maybe not tonight.”</i> She grins savagely. <i>“You’ll be too tired to talk, after all.”</i>");
		output("\n\nYou contort in the impossibly strong grip of the milodan, gasping like a fish out of water as wave after wave of pleasure rocks you until you can contain the scream of pleasure no longer. What comes from your mouth is nothing less than the sound of utter defeat, a complete admission of the sheer pleasure you’re being forced to experience. Your lover responds by grasping you tightly, squeezing you so fiercely the air rushes from your lungs and you’re left panting and dizzy while he fucks your spasming slit so hard you can feel the thudding impact of his hefty balls against your [pc.skinFurScales].");
		pc.cuntChange(0,250);
		output("\n\n<i>“Perfect!”</i> the priestess cries, her knees knocking together in delight, thighs quivering as femcum steadily drips from between her legs. <i>“Yes, yes, yes! Breed [pc.himHer]! Make [pc.himHer] cum all over your cock!”</i>");
		output("\n\nThe barbarian is way ahead of her. You couldn’t stop if you fucking tried, his body wrapped around yours so thoroughly you stand no chance of extricating yourself or trying to resist the pleasure. There’s no escape, and already your deep, groaning screams of hopeless agonized bliss are drawing more men into the tent...");
	}
	else
	{
		output("\n\nThere’s a massive, throbbing kittycock occupying your");
		if(pc.ass.looseness() < 3) output(" tight little asshole");
		else if(pc.ass.looseness() < 4) output(" your whorishly loose asshole");
		else output(" your gaping asshole");
		output(" within seconds of a milodan man’s entry into the tent, holding you tight while he spreads you wide around his prickly cock. The spines might be annoying were he taking it slow but when he’s pounding you so fucking hard like this - you grit your teeth, feeling an uncomfortably strong orgasm rising within you.");
		pc.buttChange(250);
		output("\n\n<i>“Fffuck!”</i> you gasp, panting as your core tenses up, slapping ineffectually at his muscular furred arms. <i>“Fuck! Fuh- fuuuck, FUCK!”</i>");
		output("\n\n<i>“Such a limited vocabulary,”</i> the priestess coos, watching you while she masturbates to the sight of your violent orgasm. Your back would be arched like a horseshoe if not for the incredible strength with which the milodan holds you in place. <i>“Fret not, wanderer. Soon you’ll be calling out ‘yes, master, please’... but maybe not tonight.”</i> She grins savagely. <i>“You’ll be too tired to talk, after all.”</i>");
		output("\n\nYou contort in the impossibly strong grip of the milodan, gasping like a fish out of water as wave after wave of pleasure rocks you until you can contain the scream of pleasure no longer. What comes from your mouth is nothing less than the sound of utter defeat, a complete admission of the sheer pleasure you’re being forced to experience. Your lover responds by grasping you tightly, squeezing you so fiercely the air rushes from your lungs and you’re left panting and dizzy while he fucks your spasming body so hard you can feel the thudding impact of his hefty balls against your [pc.skinFurScales].");
		output("\n\n<i>“Perfect!”</i> the priestess cries, her knees knocking together in delight, thighs quivering as femcum steadily drips from between her legs. <i>“Yes, yes, yes! Fuck [pc.himHer]! Make [pc.himHer] cum all over your cock!”</i>");
		output("\n\nThe barbarian is way ahead of her. You couldn’t stop if you fucking tried, his body wrapped around yours so thoroughly you stand no chance of extricating yourself or trying to resist the pleasure. There’s no escape, and already your deep, groaning screams of hopeless agonized bliss are drawing more men into the tent...");
	}
	output("\n\n-");
	output("\n\nA life of rough passion spent in the arms of others is all that awaits you in this village. Unable to flee with your lack of appropriate clothing and now missing any kind of map, there’s no need for the tribe to keep you bound or restrained. Instead you’re confined to a warm tent, not because you’re being guarded but because you never have to leave - the tribe comes to you, not the other way around.");
	if(pc.hasVagina()) 
	{
		output("\n\nIn time your belly grows heavy with child, the women of the tribe clustering around you in congratulations" + (pc.hasCock() ? " and to remind you of your duties to them at night so that they might do the same":"") + ". You’re taken on all fours gasping and panting at the fall of every night, the men of the tribe lusting after you after they learn of your fertility." + (pc.hasCock() ? " After they tire of you, you serve the women well into the early hours of the morning until they, too, are sated and you finally earn your rest.":""));
		output("\n\nIt’s not the ending you imagined when you first set out but as you sit wrapped in the furred warmth of your many lovers and absentmindedly rub your swelling tummy, you find that you don’t mind at all. Your children - quintuplets, if the priestesses are to be believed - are due in scarcely a month, and your breasts are swollen almost painfully with milk. The men are more than happy to relieve you of the burden themselves and though you shyly admonish them for doing so, you’re secretly overjoyed to have them suckle from your oversized teats.");
		output("\n\nYou fall asleep bathed in the heat of the fire, a strong male’s arm your pillow for the night, secure in the knowledge that your life here is truly meaningful to your tribe.");
	}
	else
	{
		if(!pc.hasCock()) 
		{
			output("\n\nThough you offer no intrinsic value to the tribe owing to your lack of genitals, that doesn’t stop them from using you - roughly and thoroughly. From being enthusiastically fingerfucked while you tongue a nubile young priestess’ slit to being roughly plowed and left with your ass dripping with spunk by the men, you’re a popular item. Make no mistake, though - you are an <i>item</i>, to be used and fucked and filled with spunk and thrown in a corner when you’re no longer desired.");
			output("\n\nMost days, you find yourself occupied with ‘tending’ to the priestesses’ needs between their legs until the men return from a hunt, sweaty and breathing hard and you’re pulled away, slammed onto a hard cock and pounded for hours until they tire of the entertainment. You have to admit, it’s not the life you envisioned when you first set out... but there’s a certain pleasure in finding yourself so profoundly desired.");
		}
		else
		{
			output("\n\nYou quickly become a valued member of the village, siring an inordinate amount of strong, healthy children with women of the tribe and priestesses both. The couplings are common and intensely aggressive, your partners often visiting you twice or more a night for extra rounds. The meat-rich hunting diet is the only thing that keeps you going, leaving you rugged and capable in the harshness of permanent winter.");
			if(pc.mf("","f") == "f" && pc.biggestTitSize() >= 1)
			{
				output("\n\nEven particularly adventurous men take you as their partner occasionally, sharing the newfound love of alien sex and your unfamiliar techniques. Sometimes you find yourself in a spontaneous threesome, your feminine partner crying out as the prostate stimulation from the male pounding your backside sends spurts of seed into her cunt unbidden. ");
			}
			else output("\n\n");
			output("Though you wouldn’t call it a harem owing to your lack of belonging and the dirty way some of the males look at you, you’ve even started to learn some of the language - albeit mostly through passionate whispers, pants, and moans. It shouldn’t be too hard to pick up on it given that you’ll be spending the rest of your foreseeable future here, siring kits and hunting all for the good of the tribe...");
		}
	}
	pc.orgasm();
	pc.libido(30);
	pc.taint(25);
	badEnd();
}
