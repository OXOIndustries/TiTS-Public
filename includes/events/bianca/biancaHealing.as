public function canBiancaTreatPC():Boolean
{
	if (hasAkanaEffects(false)) return true;
	else if (pc.HPQ() < 100) return true;
	else if (pc.statusEffectv1("Sore Counter") > 0) return true;
	else if (pc.hasSSTD()) return true;
	return false;
}

// Heals player, removes soreness, always ends encounter under 51 familiarity.
// Bianca will react to both SSTDs and Parasites. Bianca recommends immediate parasite removal and will offer SSTD cures for 350 credits. 250 if the player has multiple infections.
public function getSomeFoxMilfHealing(inBooth:Boolean):void
{
	clearMenu();
	clearOutput();
	showBianca((inBooth ? "COAT" : "WORK"));
	author("William");
	if (pc.HPQ() < 100) processTime(2);
	if (pc.statusEffectv1("Sore Counter") > 0) processTime(3);

	if (inBooth) output("Now that the moment of adulation has passed, the state of your health has caught up with you. Bianca looks down at you with a taciturn patience, waiting for you to tell her where it hurts.");
	else output("You could use a pick-me-up. The state of your health is obvious " + (pc.isNude() ? ", exposed as you are" : "through your clothes") + ". Sitting down, Bianca’s bespectacled eyes follow your [pc.hands] with refined composure, waiting for you to explain your needs.");

	// Check HP and Soreness First, then SSTDs.
	// PC has Akane's Effects: Tenderized, Lash Marks, Sore Tubes
	// Bianca will reduce the duration of these effects by 75%.
	// CHECK FOR THESE ISSUES FIRST. Heals HP/Soreness; not detailed tho.
	if (hasAkanaEffects(false))
	{
		if (flags["BIANCA_EXPLAINED_AKANA"] == undefined) output("\n\nYou’re not entirely sure how you’re going to explain to Bianca the aftermath of Akane’s BDSM treatment, but she’s going to notice it either way. " + (pc.hasArmor() ? "You’re naked, making it plain for all to see whose plaything you are." : "You remove your [pc.armor], exposing your abused form to the adroit fox."));
		else output("\n\nAkane’s left her nigh-indelible marks on your body and mind again. Bianca’s going to have her work cut out for her, should you choose to request treatment for it.");
		if (pc.HPQ() < 100 || pc.statusEffectv1("Sore Counter") > 0) output(" You could also stand to get a regular bit of healing, too.");
		output("\n\n<i>“[pc.name]...”</i> she murmurs in a low voice,");
		if (pc.hasStatusEffect("Sore Tubes") && pc.hasStatusEffect("Tenderized") && pc.hasStatusEffect("Lash Marks")) output(" giving you a dismayed look as she inspects the sadistic scorings on your body as you explain that it’s also an internal issue too.");
		else if (pc.hasStatusEffect("Sore Tubes")) output(" looking genuinely peeved by the explanation you give for your... internal plumbing issues.");
		else output(" gingerly running her fingers over the brutal marks left in the wake of your encounter with the crime boss.");
		if (flags["BIANCA_EXPLAINED_AKANA"] == undefined) output("\n\n<i>“These are... professional. These injuries are precise, without error. You did not receive these from a fight,”</i> she muses, <i>“...I see. You have met a particularly fierce individual, then?”</i>");
		else output("\n\n<i>“I see that you have very particular desires with a particularly fierce person. This is the same as last time...”</i> she muses.");
		output("\n\nMore or less.");
		output("\n\n<i>“I do not like seeing anyone in pain");
		if (biancaFamiliarity() >= 50) output(", especially you");
		output(". But I understand that these types of wounds are kept as a reminder of a <b>particular</b> relationship, and so, if you wish it, I will provide a deep level of care. But I will tell you, [pc.name], the immaculate harm afflicted to you is grievous, on the knife’s edge of life-threatening.”</i> The word ‘knife’ certainly brings back a memory or two. <i>“On the edge, but not quite. Whomever has done this has a bottomless well of experience and a true understanding of anatomy. It’s your choice, I cannot force you to accept anything.”</i>");
		output("\n\nWill you ask Dr. Ketria to expedite your masochistic recovery?");

		flags["BIANCA_EXPLAINED_AKANA"] = 1;

		processTime(5+rand(5));
		addButton(0, "Yes", biancaHealingAkanafflictions, inBooth, "Yes", "Whether or not Akane would be disappointed, you have your reasons for this.");
		addButton(1, "No", tellBiancaYouWannaKeepTheLashes, inBooth, "No", "Akane would approve of your loyalty, at any rate!");
		return;
	}
	// PC under 100% HP And/Or Sore && PC has 'Gel Body'
	else if (pc.statusEffectv1("Gel Body") > 0)
	{
		processTime(2+rand(2));
		output("\n\n" + (inBooth ? "Sure enough, you do need a little pick-me-up. You explain that you are feeling worse for the wear, though the doctor’s keen" : "You remark that you’re feeling a bit weak and need a little attention, if she can offer it. Bianca’s lavender") + " eyes hint at a hidden sadness " + (inBooth ? "when she analyzes" : "as she looks over") + " your gelatinous form. <i>“I’m afraid I can’t be too personal in your treatment, but I have a" + (inBooth ? " special" : "") + " medicine that can reconstitute your body and " + (inBooth ? "do" : "heal") + " away any" + (inBooth ? " ‘soreness’ or" : "") + " ailment you may be experiencing.”</i>");
		if (inBooth) output("\n\nThat’ll have to do. Within four steps she’s at her counter and back again with");
		else
		{
			output("\n\nYou tell her that would be just fine for now.");
			output("\n\nBianca produces");
		}
		output(" a dark blue canister that she vigorously shakes" + (inBooth ? ". She" : ", uncaps, then") + " holds the nozzle up to your transparent frame" + (inBooth ? " and " : ". She ") + " sprays the contents into your biomass, letting a cerulean goo dissipate into your [pc.skinColor] puddle. Whatever it is, it works fast: relief surges back into your body. " + (inBooth ? "Your s" : "S") + "trength and motivation return so fast and to such an extent that the hardest-hitting energy drink on the market should be scared of the competition.");
		output("\n\nIf only you could convince her to do more...");
		if (inBooth) output(" alas, not as you are.");
	}
	// PC HP is under 100% and Sore | Non-Gel
	else if (pc.HPQ() < 100 && pc.statusEffectv1("Sore Counter") > 0)
	{
		processTime(5+rand(5));
		if (inBooth)
		{
			output("\n\nEnervated as you are, you groan with weary lassitude and mention how hard you’ve pushed yourself recently, in addition to being scratched up. Your caring physician pays rapt attention to your explanation, her unblinking gaze easing the flow of your brief descriptions.");
			output("\n\nAfter indicating to her where you feel the most pain, you’re asked to");
			if (pc.hasArmor()) output(" remove your [pc.armor] and");
			output((pc.isTaur() ? " hold very still" : " lie on your back") + " while she collects her supplies and a pair of disposable gloves.");
			if (pc.exhibitionism() < 33) output(" When you do so, you become aware that you’ve " + (pc.hasArmor() ? "disrobed" : "presented yourself") + " in front of a dozen other amorous and outright horny men and women who are ogling you just as much as they are the busty doctor. Your face reddens, but Bianca reassures you with a pat on the head and a few gentle words.");
		}
		else
		{
			output("\n\nBianca caresses your shoulder down to your wrist and you half grunt. You sit down slowly, telling her, frankly, you’re a total mess. Your devitalized muscles are burning and your enfeebling injuries are pushing in, but you’re glad that your favorite doctor is out here to fix all of your problems.");
			output("\n\nDr. Ketria chuckles softly, pressing her hands to your forehead.");
			output("\n\n" + (pc.hasArmor() ? "She asks you to take off your [pc.armor] while S" : "s") + "he produces the necessary medicines from her bags, laying it all out beside you. The crisp air breezes over your exposed [pc.skin] and prods irritably at your wounds.");
			if (pc.HPQ() < 50) output(" <i>“[pc.name], you are more beaten up than anyone else I’ve met out here. I hope you plan on taking better care of yourself.”</i> Bianca frowns at you as you laugh it off. These things happen, after all! But, to be fair, these are some nasty injuries you’ve sustained...");
		}
		output("\n\n<i>“" + (inBooth ? "Speeding up natural healing always comes with its own tribulations." : "Medicine is a wonderful thing, but it’s never without its own concerns.") + "”</i> The attentive fox starts by rubbing a sterile smelling paste into your sore joints with careful rubs");
		if (pc.hasScales()) output(" while looking for openings between your [pc.skinFurScales]");
		output(". <i>“This" + (inBooth ? " medicine" : "") + " will be absorbed into your skin and act on your muscles directly. When it sets in, I’ll apply these cold patches to offset the pains that come with it,”</i> she says with an enchanting smile, showing you everything that she is using on you. <i>“Please bear with it, you should feel it soon.”</i>");
		output("\n\nBianca’s enchanting smile, while sedating, doesn’t make it much easier to handle what comes next. Your pores are suffused with red-hot, numbing pain, like an ember crackled from a fire burst out and embedded itself into you! For a few seconds you shimmy about in thickening discomfort until an icy chill bites into the searing sensation. Ghostly fingers dig into, pry apart, and tease out your inner suffering. A nebulous blanket of satisfaction is pulled over you, like there was a third, magical step to the process.");
		output("\n\nAnd quite honestly, the full-body wellness that subsumes you was <i>worth</i> the ordeal! <i>“Feeling better already?”</i> Bianca exhales. <i>“Looks like it. You’re a healthy [pc.manWoman], [pc.name].”</i>");
		output("\n\nWhile your muscles go swimming in bubbly niceness, Bianca disinfects, cleans, and bandages the cuts on your body, spreading a warm, bluish gel on your bruises that takes the edge off. All of these are insignificant details to the bubbly goodness revitalizing your very soul. Hell, you think you could get addicted to someone like her looking after you!");
		// PC is Very Sore or Worn Out
		if (pc.hasStatusEffect("Very Sore") || pc.hasStatusEffect("Worn Out"))
		{
			output("\n\nDuring the last moments of your ironically enjoyable processing time, Bianca leans over you to begin massaging your shoulders as best she can, careful not to disturb her previous work. She illustrates a level of care and finesse");
			switch (flags["PC_UPBRINGING"])
			{
				case GLOBAL.UPBRINGING_PAMPERED: output(" that reminds you of the professionals hired by dad a long time ago during your childhood"); break;
				case GLOBAL.UPBRINGING_ATHLETIC: output(" that reminds you of your parent’s attention after you practiced too hard in your youth"); break;
				case GLOBAL.UPBRINGING_BOOKWORM: output(" what reminds you of a very popular romance novel from your bookish days that influenced your ideas of intimacy"); break;
				case GLOBAL.UPBRINGING_AUSTERE: output(" that reminds you of the immutable value of comfort after many hard days of work and responsibility in your earliest years"); break;
				case GLOBAL.UPBRINGING_BALANCED: output(" that brings back warm memories of spending time with mom and dad in your pre-teen years"); break;
			}
			output(". <i>Is this doctor a goddess?</i> You find yourself thinking that. You don’t feel like a VIP availing [pc.himHer]self to the finest things in life -- you feel like you’ve <i>ascended!</i>");
		}
		if (inBooth)
		{
			output("\n\nThe enamored tones of those behind you suggest more than a few are envious of your position");
			if (pc.femininity > 80) output(" and maybe of <i>you</i>, too");
			output(".");
		}
		else output("\n\n");
		output("Your physician’s tranquilizing ministrations are so calming that you nearly fall asleep. But just before you hit the threshold of indulgent, inviting rest, she peels the patches away with a sharp, stinging yank and sprinkles them to a bin. Finished with your tender love and care, Dr. Ketria pats your shoulder, and you rise feeling like nothing can or ever will hold you back again!");
	}
	// PC under 100% HP | Non Gel
	else if (pc.HPQ() < 100)
	{
		processTime(5+rand(5));
		if (inBooth) output("\n\nYou explain that you’ve been in a few scrapes that need some devoted care, and your devoted doctor asks you to " + (pc.hasArmor() ? "remove your [pc.armor]." : "sit still."));
		else
		{
			output("\n\nYou remove your [pc.armor] and tell your persistent physician you’ve gotten a bit scratched up recently, pointing out a few abrasions and cuts on your [pc.arms] and [pc.chestNoun].");
			output("\n\n<i>“I’ll have it taken care of no problem!”</i>");
		}
		output("\n\nHer dainty hands and twinkling eyes are soon tracing across your [pc.skinFurScales] from top to bottom again, checking for bruises, lacerations, and damages of any kind. When her exploratory prods press on hidden soreness her ears twitch and she smiles apologetically, waiting a few seconds before drawing another pattern down your [pc.hips] and your [pc.legs].");
		output("\n\nWith a mental note of all your problem areas, Bianca " + (inBooth ? "paces to the counter and collects a jar thick with labels" : "unzips a bag and reveals a thick jar"));
		if (pc.HPQ() < 60) output(" and " + (inBooth ? "some bandages for the worse injuries" : "a roll of bandages"));
		output(". She dons a pair of disposable gloves and rubs dollops of the warm paste to your bruises and cuts");
		if (pc.HPQ() < 60) output(" then applies a clean bandage to the more grievous wounds");
		output(".");
		output("\n\nYou brace yourself for cold medicine as she dons a pair of disposable gloves and rubs the (thankfully) warm paste to your throbbing bruises and cuts");
		if (pc.HPQ() < 60) output(" then wraps a clean cloth slathered in a pleasantly-cool fast-acting gel to more grievous and unclosed wounds");
		output(".");
		// PC under 50% HP
		if (!inBooth && pc.HPQ() < 50)
		{
			output("\n\n<i>“Ahh, [pc.name]... you look like all the soldiers I’ve ever treated in the past,”</i> she says in her soothing voice. <i>“Don’t worry, you’ll soon feel like this never happened.”</i>");
			output("\n\nGauze is used on the freshest wounds, absorbing trickles of blood between your cold gasps. Bianca apologizes every time you grunt or yelp in pain. It gets... easier to endure overtime, but then she’s spreading her healing gel into the core of your gore-wounds. Although her medicine is fully capable of dealing with your injuries on its own, you find yourself enjoying, in a way, the methodical level of care she offers, how she treats you like a mother would their hurt child.");
		}
		output("\n\nMere moments after her exemplary treatment, a pleasant, persistent placidity spreads through your body, overwhelming your prickling discomfort. The inner contentment forces you to let out a too-pleased sigh, a sudden blend of strength and clarity making itself known at the end.");
	}
	// PC is Sore | Non-Gel
	else if (pc.statusEffectv1("Sore Counter") > 0)
	{
		processTime(5+rand(5));
		if (inBooth)
		{
			output("\n\nYou <i>are</i> feeling a bit stiff, and not in the good way. If there’s anyone who could help with that, it’s her. Bianca listens patiently, nodding and humming as you tell her where you feel cramped, where it hurts the most");
			if (pc.hasArmor()) output(" before asking you to remove your [pc.armor]");
			output(".");
		}
		else
		{
			output("\n\nYou mention to Bianca that your muscles are cramped and you’ve exerted yourself too much.");
			output("\n\n<i>“Don’t worry, [pc.name]. I can take care of that no problem!”</i>");
		}
		output("\n\nThe demure doctor " + (inBooth ? "collects from her booth" : "reveals") + " a box of square paper packets and a jar of faintly red paste.");
		if (pc.isTaur()) output(" You’re asked to hold very still while she rips " + (inBooth ? "a few open." : "open a few of them."));
		else
		{
			output(" While she rips into the paper she asks you to")
			if (inBooth)
			{
				output("lay face down on the bench like you’re about to receive a full-body massage.");
				if (pc.exhibitionism() < 33) output(" Your cheeks flush as you realize your body is" + (pc.isCrotchExposed() ? "" : " nearly") + " bare not just to her, but to everyone else as well. Sensing your embarrassment, Bianca whispers gently in your [pc.ear] and strokes your head reassuringly.");
			}
			else output("straighten your body out.");
		}
		output("\n\n<i>“Treating locked and singed muscles is not a comforting process, [pc.name],”</i> Bianca starts, daubing a dollop of cold, sterile smelling paste on each of your sore spots");
		if (pc.hasScales()) output(", looking for openings between your [pc.skinFurScales]");
		output(". <i>“It’ll take a minute or two to finish. The paste is rapidly absorbed into your skin and begins working on your muscles immediately. You should feel it soon, so please bear with it.”</i>");
		output("\n\nAn uncomfortable " + (inBooth ? "white-hot" : "dagger of") + " pain " + (inBooth ? "lights up" : "thrusts into") + " your tenderest areas, so hot a glob of molten rock must have seeped into your singed pores! This incandescent thickness locks your whole body down until what feels like Winter itself sinking its fangs into your nervous system. Invisible fingers dig through the openings and unwind your body with indelicate artfulness. The heat abates as quick as it came, morphing into a nebulous coat of chemical satisfaction that’s not <i>entirely</i> unpleasant...");
		output("\n\nIt actually feels really good. So good in fact that you’re shuddering" + (inBooth ? "." : " blissfully."));
		output("\n\n<i>“By Core World standards, my methods " + (inBooth ? "are certainly outmoded" : "aren’t efficient") + ",”</i> Bianca simpers, <i>“but I promise they are no less effective.”</i>");
		output("\n\nShe never loses that affectionate smile on her light, rosy lips");
		if (!inBooth) output(", and to be honest, you’re finding yourself enjoying the sensations of being treated by the motherly doctor");
		output(".");
		// PC Very Sore or Worn Out
		if (pc.hasStatusEffect("Very Sore") || pc.hasStatusEffect("Worn Out"))
		{
			output("\n\nDuring the eye-fluttering processing time, Bianca " + (inBooth ? "kneels and leans over you, massaging" : "massages") + " your back and shoulders with a level of care and finesse");
			switch (flags["PC_UPBRINGING"])
			{
				case GLOBAL.UPBRINGING_PAMPERED: output(" that reminds you of the professionals hired by dad a long time ago during your childhood"); break;
				case GLOBAL.UPBRINGING_ATHLETIC: output(" that reminds you of your parent’s attention after you practiced too hard in your youth"); break;
				case GLOBAL.UPBRINGING_BOOKWORM: output(" what reminds you of a very popular romance novel from your bookish days that influenced your ideas of intimacy"); break;
				case GLOBAL.UPBRINGING_AUSTERE: output(" that reminds you of the immutable value of comfort after many hard days of work and responsibility in your earliest years"); break;
				case GLOBAL.UPBRINGING_BALANCED: output(" that brings back warm memories of spending time with mom and dad in your pre-teen years"); break;
			}
			output(". The additional level of intensive care goes a long way to soothing your worst conditions, with the not-unwelcome bonus of making you feel like a VIP.");
		}
		if (inBooth)
		{
			output("\n\nThe enamored tones of those behind you suggest more than a few are envious of your position");
			if (pc.femininity > 80) output(" and maybe of <i>you</i>, too");
			output(".");
		}
		else output("\n\n");
		output("Your physician’s tranquilizing ministrations are so calming that you nearly fall asleep, having forgotten you were ever in pain. But just before you hit the threshold of indulgent, inviting rest, she peels the patches away with a sharp, stinging tug and sprinkles them");
		if (inBooth) output(" to a bin.");
		else output(" into the air for her drone to collect. <i>“I hope you’ll take better care of yourself after this.”</i>");
		output((inBooth ? " " : "\n\n") + "After your pampering concludes and Bianca’s finished, you feel ready to win every test of strength!");
	}
	else
	{
		output("\n\nThere is... something amiss, and maybe she can check you out for it. When you try to find the words for it, the malaise strikes again.");
	}
	IncrementFlag("BIANCA_TREATMENT");
	biancaTreatmentEnd(inBooth);
}

// Heals everything, reduces all currently existing Akane effects by 75%. If you want to be complicated then have it also halve the damages you take from those effects.
public function biancaHealingAkanafflictions(inBooth:Boolean):void
{
	clearMenu();
	clearOutput();
	showBianca((inBooth ? "COAT" : "WORK"));
	author("William");
	processTime(3+rand(4));

	if (inBooth) output("Nodding, you leave your wounds in Bianca’s hands, and she strides to her counter with a gladdened look in her eye and a serious hop to her step.\n\nWhen the anxious vixen returns, she has several jars and pill bottles in her arms, which she lets fall all over the rug below. While she prepares her medicine and dons a disposable pair of gloves, you’re asked to scoot forward and spread your [pc.arms] out.");
	else output("Nodding, you leave your wounds in Bianca’s hands, and the anxious physician dumps the contents of several bags all around you. Several jars and pill bottles are organized at the front while she picks through her inventory in search of gloves and necessity.");

	// Tenderized
	if (pc.hasStatusEffect("Tenderized") && pc.statusEffectv4("Tenderized") == 0)
	{
		output("\n\nYou would think Akane’s neural shockplay impossible to treat through conventional means, but the inflammation it’s caused is something she zeroes in on. She silently provides you a set of colorful pills and a flask of water. " + (inBooth ? "As you’re gulping them down" : "After swallowing it") + ", she’s applying a bean-colored paste to the bright spots on your [pc.skinFurScalesNoun]. You’re not entirely sure how, but the miracle that is Core world medicine kicks in straight away, and the heavy aches plaguing your mind " + (inBooth ? "unlatch and lift like a plastic lid." : "lift like a lid."));
		output("\n\nShe continues for a while longer, kneading more around your scalp and through your hair. There’s still a pervasive soreness within, but the worst of it’s been soothed away by insistent fox-woman fingers.");
	}
	// Lash Marks
	else if (pc.hasStatusEffect("Lash Marks") && pc.statusEffectv4("Lash Marks") == 0)
	{
		output("\n\nThe lacerations of a whip would not be so different from any other cut or gash you suffer in the field. But from Akane, her masterful technique was enough to carve her name into your muscular system, if not your bones outright. They’re unbleeding wounds that won’t simply knit back together from stitching or fancy gel.");
		output("\n\nIt’s fortunate that Bianca knows what she’s doing, then. In the hands of anyone else, your pain would jump from lingering, twingy burns to full-on inescapable agony and torment. There’s always a wince when she touches " + (inBooth ? "down" : "on") + " with a supremely cold gel, tracing the outlines of your guiltless distress with a green " + (inBooth ? "spread" : "gum") + " and then striping your opened muscle with a yellowish goo. The scorch of the whip " + (inBooth ? "flashes" : "shines") + " in your mind, then evaporates like morning dew, leaving behind a coldness that makes you shiver to think about.");
		output("\n\nAnd in that newfound placidity, the strains of your rough treatment begin to fade. When you move you still feel the irritations, the cramps, the tiny spikes... but it’s " + (inBooth ? "far" : "far, far") + " more reduced. Going forward, this’ll be a lot more bearable on top of healing faster.");
	}
	// Sore Tubes
	else
	{
		output("\n\nBianca pops four different pill bottles and spills six multi-colored capsules of varying design into your palm, ordering you to take them all at once. That done, she’s staring at your crotch, bringing to bear a large jar of honey-hued gel. It takes her some effort to twirl the " + (inBooth ? "cap" : "lid") + " off, but when she does, it smells... rank.");
		output("\n\nPutting it lightly.");
		output("\n\nShe dips one entire hand in it and positions herself in a way that hides your groin from the line, moving that slathered mit closer");
		if (!pc.isCrotchExposed()) output(" while parting your [pc.crotchCoverUnder]");
		output(". <i>“Please hold still...”</i> she whispers.");
		output("\n\nIt can’t be-");
		output("\n\nOh. It is.");
		output("\n\n<b>It’s fucking cold!!</b> You gasp through every tooth and jerk forward, your " + (pc.isHerm() ? "herm boners" : (pc.hasCock() ? (pc.hasCocks() ? "boners" : "boner") : "ladyboner" + (pc.hasVaginas() ? "s" : ""))) + " kept entirely flaccid by the numbing soothness absorbing into your sensitive [pc.skinFurScalesNoun]. It’s incredibly fast acting, however, and you settle down soon enough. Your teeth are still rattling.");
		output("\n\nBut she wipes that stuff all over your " + (pc.isHerm() ? "[pc.cocksLight] and [pc.pussyNoun]" : (pc.hasVagina() ? "[pc.pussyNoun]" : "[pc.cocksLight]")) + " until " + (pc.isHerm() ? "they feel like an icicle and an igloo" : (pc.hasVagina() ? (pc.hasVaginas() ? "they feel like igloos" : "it feels like an igloo") : (pc.hasCocks() ? "they feel like icicles" : "it feels like an icicle"))) + ". Fortunately, the ambient heat around here helps you settle down just minutes after. What you felt before was a searing agony only a professional could have dealt with. Now you won’t be wincing every time you think about cumming.");
	}
	// HP and/or Soreness
	if (pc.HPQ() < 100 || pc.statusEffectv1("Sore Counter") > 0)
	{
		output("\n\nWith that out of the way, Bianca sees to your other injuries where appropriate, dabbing cold " + (inBooth ? "liquids" : "pastes") + " and spreading fast-acting gels across fresh and old injuries alike. The process is " + (inBooth ? "thankfully short." : "much shorter than the others."));
		if (pc.statusEffectv1("Sore Counter") > 0) output(" Your aching muscles are seen to as well, and after a brief massage, you’re feeling as right as can be given the circumstances.");
	}
	output("\n\n<i>“There...”</i> Bianca " + (inBooth ? "disposes her gloves to a bin" : "pitches her gloves into a hazard bag") + " and sets her medicines aside. <i>“You should be feeling a lot better, but I warn you... do not engage in anything overtly strenuous. As easy as it might seem to heal wounds, they can still be reopened with but a thought. I implore you, [pc.name], take some time off and rest.");
	if (inBooth) output(" However...”</i>\n\nShe stands and smiles, <i>“You will make a full recovery.”</i>");
	else output("”</i>\n\nShe stands and smiles. <i>“However, you will make a full recovery.”</i>");

	// Heals everything, reduces all currently existing Akane effects by 75%. If you want to be complicated then have it also halve the damages you take from those effects.
	for each (var statusName:String in ["Lash Marks", "Sore Tubes", "Tenderized"])
	{
		if (!pc.hasStatusEffect(statusName) || pc.statusEffectv4(statusName) > 0) continue;
		pc.setStatusMinutes(statusName, Math.ceil(pc.getStatusMinutes(statusName)/4));
		pc.setStatusValue(statusName,4,1);
	}
	IncrementFlag("BIANCA_TREATMENT");
	biancaTreatmentEnd(inBooth);
}

public function tellBiancaYouWannaKeepTheLashes(inBooth:Boolean):void
{
	clearMenu();
	clearOutput();
	showBianca((inBooth ? "COAT" : "WORK"));
	author("William");
	processTime(2+rand(3));

	output("Shaking your head, you tell Bianca you’d prefer to keep what you have. Wearing these scars is exactly the reason you consented to such activity. Although she understands and respects your decision, she still looks agonized by your willingness to continue under the strain.");
	// HP and/or Soreness.
	if (pc.HPQ() < 100 || pc.statusEffectv1("Sore Counter") > 0)
	{
		output("\n\nWith that out of the way, Bianca sees to your other injuries where appropriate, dabbing cold pastes and spreading fast-acting gels across fresh and old injuries alike. The process is much shorter than the others.");
		if (pc.statusEffectv1("Sore Counter") > 0) output(" Your aching muscles are seen to as well, and after a brief massage, you’re feeling as right as can be given the circumstances.");
	}

	biancaTreatmentEnd(inBooth);
}

public function biancaTreatmentEnd(inBooth:Boolean):void
{
	if (inBooth)
	{
		output("\n\nBefore you’re allowed to " + (pc.HPQ() < 100 || pc.statusEffectv1("Sore Counter") == 0 ? "stand" : "go on") + ", Bianca keeps her eyes and hands on you. She’s analyzing your movements, your eyes, your breathing, all without saying a word.");
		if (pc.hasSSTD())
		{
			output(" Her brow furrows and she leans in closer to you. What is she looking for?");
			biancaTreatmentSSTDFollowup(inBooth);
		}
		else
		{
			output(" She seems curiously satisfied being unable to locate what she sought.");
			addButton(0, "Next", backToBiancaBoothMenu, 0);
		}
	}
	else
	{
		// PC has a Visible Parasite (Cunt&Cock tails, mimbranes etc? Not butt bugs tho)
		if (pc.hasParasiteTail() || attachedMimbranes() > 0)
		{
			output("\n\nDr. Ketria clears her throat just when you thought she was finished. <i>“As a licensed U.G.C. medical doctor, I’m duty-bound to remind you, <b>[pc.name]</b>,”</i> she glowers infernally despite her stoic mien, <i>“that you are bonded with a dangerous parasite. Whilst such a vitiating creature may be effective in the bedroom, it is still a harmful symbiote that must be removed.");
			if (silly) output(" I do not say this because the writer has a mild dislike for it.");
			output("”</i>");
			output("\n\nHer voice retains its terseness like a sponge retains water. <i>“JoyCo offers the service for free at their clinics, and I recommend you have it removed as soon as possible.");
		}

		if (pc.hasSSTD())
		{
			// Familiarity <50, has SSTD
			if (biancaFamiliarity() < 50) output("\n\nWhile you do feel a lot better having had Bianca look you over, something’s... still amiss. She kneels back down at your behest, beginning a more thorough inspection.");
			// Familiarity <51, has SSTD
			else output("\n\n<i>“There, looks like... mmm, something’s still wrong...”</i> Bianca looks closely in your eye, tilting her head inquisitively. <i>“Hold still, [pc.name]...”</i>");
			biancaTreatmentSSTDFollowup(inBooth);
		}
		// Familiarity <50, no SSTD
		else if (biancaFamiliarity() < 50)
		{
			output("\n\n<i>“Alright, [pc.name], you should be alright from here. Take care of yourself out here, okay?”</i> Bianca smiles at your affirmation, quickly fading away on the search for her next patient. A few minutes later, you’re as ready to go as you’ll ever be.");
			addButton(0, "Next", biancaEncounterEnd);
		}
		// Familiarity <51, no SSTD; Bianca stays, return other menus.
		else
		{
			output("\n\n<i>“Hee hee, looks like you’re going to make it. I bet you were worried!”</i> Bianca laughs, sitting next to you. <i>“Do you have to go? I can spare some more time, if you’d like me to stay...”</i>");
			biancaEncounterMenu(true);
		}
	}
	
	var cost:int = 0;
	if (pc.HPQ() < 100) cost += 50;
	if (pc.statusEffectv1("Sore Counter") > 0) cost += 50;
	if (inBooth && (flags["MET_BIANCA"] & 4) != 0) pc.credits -= cost;
	pc.maxOutHP();
	soreDebuff(-pc.statusEffectv1("Sore Counter"));
}

public function biancaTreatmentSSTDFollowup(inBooth:Boolean):void
{
	var cost:int = 350;
	// PC has SSTD | Add-on to others if SSTD is present. SSTD is checked last.
	output("\n\n<i>“[pc.name],”</i> Bianca huffs in a perturbed voice. Half-inquisitive and half-nervous, she claps her hands on her thighs; she bends low, quizzing your slightest tics down to individual electrical signals from your brain. Occasionally she gropes a part of your body, zeroing in on her suspicion with unyielding authority. When her eerily extreme examination resolves into truth, it leaves her with a lowset and sharply concerned expression.");
	// PC has Multiple SSTDs
	if (pc.sstdTotal() > 1)
	{
		output("\n\nQuite frankly, you’re a mess. The tall fox lays you down forcefully, feeling out your temperature and more. Pulling up her codex, she taps away frantically with one hand while guiding an attached, colorful loop around your [pc.hand]. Vibrant colors probe your veins, running an infallible diagnostic.");
		output("\n\nWhatever result it gave certainly smacked her in the face - it was the equivalent to a ship flying out of the screen the way she reacted to it. <i>“[pc.name]!”</i> Bianca nearly yells, her eyes squinting and her cheeks twitching. <i>“You’ve contracted not one but " + num2Text(pc.sstdTotal()) + " sexually transmitted diseases! And worse,”</i> she puts her codex down and takes on a " + (inBooth ? "harsher tone" : "tone that makes you feel like a suspended student") + ", <i>“the unclassified microsurgeon suite in your body wasn’t able to handle " + (pc.sstdTotal() == 2 ? "either" : "any") + " of them.”</i>");
		output("\n\nShe can’t figure out whether to chide you further in the midst of her confusion.");
		output("\n\n<i>“You need a cure, and I am willing to offer a further discount than what is available in the clinics: two-hundred fifty credits. Please, [pc.name], think of your health. You cannot go on like this!”</i>");
		cost = 250;
	}
	// PC has Furpies
	if (pc.hasSSTD("Furpies", true))
	{
		output("\n\nAn erratic series of movements in your glassy eyes and unusual, involuntary stares towards furrier figures prompts Bianca to grip and shake you back to focus. <i>“What were you doing just now?”</i>");
		output("\n\nYou realize that you can’t quite say. Hurriedly bringing her codex out, the fox wraps a small, dangling hoop around your wrist, tapping away quickly on the gadget while a miniature light show flashes within the attached ring.");
		output("\n\nWhen it comes chirping back about something serious, she grunts. <i>“A man-made virus is lying inside of you, what is known as ‘Furpies’,”</i> she explains intensively. <i>“");
		if (pc.statusEffectv1("Gel Body") == 0) output(" I’m deeply concerned that the unmarked microsurgeon suite in your body couldn’t defeat it; certainly, this is a deleterious pathogen, and you are carrying one of its worst strains.");
		output(" Furpies is a dangerous infection that will erode your physical faculties and change your body for the worst, [pc.name].”</i>");
		output("\n\nShe pockets her codex and " + (inBooth ? "knits" : "clasps") + " her hands together.");
		output("\n\n<i>“I can provide you the cure for a lower price than what JoyCo’s clinics do. Would that I could offer it for free, but it’s presently the best countermeasure available. Three-hundred fifty credits will suffice.”</i>");
	}
	// PC has Locofever
	else if (pc.hasSSTD("Locofever", true))
	{
		output("\n\nNot satisfied with her hands, Bianca presses her lithe arms to your forehead. <i>“Your body temperature is too high. How are you feeling, [pc.name]? Tell me anything that comes to mind.”</i>");
		output("\n\nYou explain that as of late you’ve felt <i>perversely</i> debilitated -- " + (silly ? "like a well-done steak" : "feverishly aroused") + ". Pulling up her codex, the vulpine physician wraps a dangling rubbery hoop around your wrist and taps away at the keys while a bunch of colorful lights flash within the band.");
		output("\n\nWhen it slings her an answer, she sighs: <i>“[pc.name], it’s not a mere fever. You are stricken with Locofever, a mutation of such a condition that will affect your libido adversely.”</i>");
		output("\n\nRight... you must have caught it from that Raskvel.");
		if(pc.statusEffectv1("Gel Body") == 0) output(" <i>“I’m... surprised... that the unknown microsurgeon suite in your body couldn’t defeat it, and that means this strain is more virulent than most.”</i>");
		output(" Her torrid tone is as hot as you feel right now.");
		output("\n\n<i>“I can sell you the cure for a lower price than what you would be offered at JoyCo’s clinics. Would that I could offer it for free, but I make an effort to have the best countermeasures available. Three-hundred fifty credits.”</i>");
	}
	// PC has Sneezing Tits
	else if (pc.hasSSTD("Sneezing Tits", true))
	{
		output("\n\nYour abnormally congested voice makes your sickly state all too obvious. You stifle the next sneeze out of courtesy, but Bianca has wasted no time drawing her codex. She slides an attached band around your wrist and taps away quickly at the buttons as colorful as the lights probing at you beneath the loose-fitting ring.");
		output("\n\nWhen it squawks about finding something foreign in your system, Dr. Ketria exhales and explains. <i>“[pc.name], you have contracted the mammovirus. If untreated it will swell your breasts unnaturally and inevitably lead to great complications; not to mention, it will undoubtedly compromise your biology.");
		if (pc.statusEffectv1("Gel Body") > 0) output(" I find it disturbing that the unidentified microsurgeon suite in your body couldn’t defeat it... which means that this strain is particularly potent.");
		output("”</i>");
		output("\n\nShe gestures urgingly. <i>“I can offer you the cure at a lower price than a clinic. Would that I could give it away for free, but I have to charge three-hundred fifty credits to make up the cost for having the best countermeasures available.”</i>");
	}
	else
	{
		output("\n\nWhatever malady squeezes the life out of your veins and the motivation from your soul, Bianca is determined to identify it. The fox-lady finishes your physical and has you hooked up to her codex’s diagnostic attachment. Luminous colors prod against your [pc.skinFurScalesNoun], stroking at the internals behind, soon providing an answer that leaves Dr. Ketria in dismay.");
		output("\n\n<i>“Unknown... hmmm, it’s an SSTD, it has all the makings... but it’s yet to be archived. This data will come in handy, and, fortunately, it doesn’t seem to be resistant to common cures.”</i> She leans closer. <i>“I suggest you take this right away. There is no telling what mutation it might undergo should you allow it to remain in your body. Whatever you think it does for you in any thrilling capacity, I’d put it out of mind, [pc.name],”</i> she glowers. <i>“I implore you, think of your health, and accept this medicine regardless of its price. If I discover you’ve become patient zero for a widespread endemic...”</i> she closes her eyes, pausing. <i>“...You do not want that.”</i>");
		output("\n\nThe hard edge in her tone could be classified as predatory mercantilism! But she’s got a point...");
	}

	if (pc.credits >= cost)
	{
		output("\n\n<i>Will you spend " + cost + " credits to cure your sickness?</i>");
		addButton(0, "Cure", biancaGetsYouFuckreadyButNotLikeThat, inBooth, "Cure", (cost == 250 ? "Spend 250 credits to cure multiple SSTDs." : "Spend 350 credits to cure your SSTD."));
	}
	else
	{
		output("\n\nUnfortunately, even if you wanted to, you simply can’t afford this.");
		addDisabledButton(0, "Cure");
	}

	addButton(1, "No Cure", tellBiancaYouLikeYourSSTDs, inBooth, "Do Not Cure", "You’re going to have to deal with it.");
}

public function biancaGetsYouFuckreadyButNotLikeThat(inBooth:Boolean):void
{
	clearMenu();
	clearOutput();
	showBianca((inBooth ? "COAT" : "WORK"));
	author("William");
	processTime(2+rand(2));

	if (inBooth)
	{
		output("Before you even finish agreeing, Bianca provides you three pills - white, pink, red - and a flask of water. You take what’s offered and gulp it down right away. A few minutes later, a gurgling sound ripples up from your belly, coursing upwards and colliding with your brain, sending out a broadcast of something <i>cleansing.</i> Seconds after, you feel perked up, the invisible weight of infection lifted.");
		if (pc.sstdTotal() > 1) { }
		else if (pc.hasSSTD("Furpies", true)) output(" A low growl and a sudden realization of your former infatuation with furrier men and women signals the end of your Furpies Infection. Somehow it’s rather relieving to look at that kui-tan male in line and not think about becoming his live-in cock milker.");
		else if (pc.hasSSTD("Locofever", true)) output(" The swampy heat in your crotch clears up as the fever breaks and your body thrusts out a layer of cold sweat. The bacterial lust wreaking havoc on your mind is expelled, and Bianca wipes your moistened brow with a wet towel.");
		else if (pc.hasSSTD("Sneezing Tits", true)) output(" Your nose clears up in the most satisfyingly crisp way possible. Neither nasal passage is congested and now you feel no insistently creeping urge to sneeze. All you can do is inhale deeply and exhale happily.");
		output("\n\nDr. Ketria gives you a firm nod and lets out the breath she held, very much relieved that you took her up on the offer.");
		addButton(0, "Next", backToBiancaBoothMenu, 1);
	}
	else
	{
		output("Bianca provides you three pills - white, pink, red - and a drink of water. You take the medicine straight away, swallowing the pills audibly. A few minutes later, a distinct feeling courses through you again, something <i>cleansing</i>, and you already feel yourself perking up again. Your vulpine doctor gives you a firm nod and lets out the breath she held, very much relieved that you are fine.");
		// Familiarity <50
		if (biancaFamiliarity() < 50)
		{
			output("\n\n<i>“Alright, [pc.name], you should be alright from here. Take care of yourself out here, okay?”</i> Bianca smiles at your affirmation, quickly fading away on the search for her next patient. A few seconds later, you’re as ready to go as you’ll ever be.");
			addButton(0, "Next", biancaEncounterEnd);
		}
		// Familiarity <51
		else
		{
			output("\n\n<i>“Hee hee, looks like you’re going to make it. I bet you were worried!”</i> Bianca laughs, sitting next to you. <i>“Do you have to go? I can spare some more time, if you’d like me to stay...”</i>");
			biancaEncounterMenu(true);
			addDisabledButton(1, "Treatment");
		}
	}
	IncrementFlag("BIANCA_TREATMENT");
	pc.credits -= (pc.sstdTotal() > 1 ? 250 : 350);
	pc.removeSSTDs();
}

public function tellBiancaYouLikeYourSSTDs(inBooth:Boolean):void
{
	clearMenu();
	clearOutput();
	showBianca((inBooth ? "COAT" : "WORK"));
	author("William");
	processTime(2+rand(2));

	if (inBooth)
	{
		output("You tell her no, curing yourself isn’t your goal right now. Even though what’s coursing through your veins inflicts a few detrimental effects, it’s something you’re willing to put up with.");
		output("\n\n<i>“I see...”</i> Bianca looks down, struggling with her manners. <i>“[pc.name], you cannot allow yourself to remain infected!”</i> She balls her hands into fists and bites her lip. <i>“I...”</i> She sighs exasperated. <i>“I can’t force you to take medication. But do not get the idea that you can outlast " + (pc.sstdTotal() == 1 ? "this contagion" : "these contagions") + " into your head. You must cure yourself soon!”</i>");
		output("\n\nShe calms down quickly enough...");
		addButton(0, "Next", backToBiancaBoothMenu, 2);
	}
	else
	{
		output("<i>“I see...”</i> Bianca looks down, struggling with her manners. <i>“[pc.name], you cannot allow yourself to remain infected! I can’t force you to take medication, but please... have yourself cured as soon as possible!”</i>");
		// Familiarity <50
		if (biancaFamiliarity() < 50)
		{
			output("\n\n<i>“Alright, [pc.name]. Aside from... that... you’re in good condition. Take care of yourself out here, okay?”</i> Bianca smiles at your affirmation, quickly fading away on the search for her next patient. A few seconds later, you’re as ready to go as you’ll ever be.");
			addButton(0, "Next", biancaEncounterEnd);
		}
		// Familiarity <51
		else
		{
			output("\n\n<i>“Hee hee, looks like you’re going to make it. I bet you were worried!”</i> Bianca laughs, sitting next to you. <i>“Do you have to go? I can spare some more time, if you’d like me to stay...”</i>");
			biancaEncounterMenu(true);
			addDisabledButton(1, "Treatment");
		}
	}
}