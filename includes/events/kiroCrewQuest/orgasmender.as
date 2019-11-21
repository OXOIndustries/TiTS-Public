//[DUN] Healing Consentacle Tank
//Original: Working on idea still, Healing Consentacles, inflation, bukkake, goo, all gender's applicable. The idea is to have a shipboard goo vat (like a star wars bacta tank) but it also has tentacles that move in to 'help the healing process' if you are way over on your lust levels. - Please Send Email to discuss? This request doesn't need to go in immediately at game start.
//Additional: quick layout:
//It involves lots of mechanical tentacles in a healing vat, possibly provided by two OC's I've been concepting in my head.   No interaction, other than them selling you the device is really planned out (their 'personal' services are expensive!) so the whole event would be a repeatable encounter with the device you install in your medical bay with options of 1) 'just heal' 2) 'just massage' 3) 'heal + tentacle massage'  4) 'heal + tentacle orgy'.   the massage in mind is just to help players with copious amounts of breast milk get a good milking and massage (will probably increase lust).  initial calibration scene would be 'heal + massage' with an option to 'test full calibration mode' which would activate the orgy scene.  I could write a fair bit of it myself, but I'm not very talented with a lot of prose and getting the personal descriptors down correctly, so someone would need to come in and edit in all of those parts.  I could probably write it from a futa perspective, but again I'd hope someone could come in and use much better descriptors!
//LastLego/EnderHoof

//Fen Idears:
//Tank initially empty
//Door on side. Names? Organo-tender, Tenta-medic, Orgasmender!
//Holes on the top and bottom open up, pink goo starts flowing in.
//Tentacles come in after?
//Sedation/aphrodisiac tentacle acquires mouth-capture
//Dicks encased. End of tentacles like cock-rings? Squiggly cilia?
//Pussies, buttholes filled with medicinal healing gel. Might feel like cum. Might make you more fertile.
//Lipples/Fucknipples get similarly treated
//Dick-nipples get wrapped up and jerked off (into the PCs face)
//Tail parasites are stung and tranquilized.

public function showOrgasmender():void
{
	showName("\nORGASMENDER");
	showBust("ORGASMENDER");
}
public function healingConsentacleTankBonus():Boolean
{
	if(flags["ORGASMENDER"] == undefined) output("\n\nA sterile-looking, white-rimmed tank sits in the back corner of the room, its transparent aluminum surface stamped with two bright red hearts. In between the cartoonish organs is an airtight door stenciled with a stylized logo reading, <i>“Orgasmender.”</i> You suppose it must be some kind of healing tank.");
	else output("\n\nYou spot the Orgasmender’s sterile-looking, white-rimmed tank in a back corner of the room. You know from an experience that it’s far more full of life than its charming exterior indicates, but it certainly does its job well enough.");
	if(currentLocation != "KQ L28") output(" <b>It seems out of place, like it doesn’t truly belong in this place. Perhaps this is a <i>placeholder</i> location for it?</b>")
	//[Look Closer] [Climb In]
	addButton(0,"Look Closer",lookCloserAtOrgasmender,undefined,"Look Closer","Take a better look at the device before doing anything rash.");
	addButton(1, "Climb In", climbIntoTheDamnedTank, undefined, "Climb In", "Climb inside and activate the device. What could go wrong?");
	return false;
}

//[Look Closer]
public function lookCloserAtOrgasmender():void
{
	clearOutput();
	showOrgasmender();
	output("Closer inspection reveals that the sealed tank definitely serves some kind of medical purpose. The dozens of iris-like metal openings on the top and bottom of the tank ");
	if(flags["ORGASMENDER"] == undefined) 
	{
		output("must be where the medical instruments come out, though you aren’t quite sure why a perfectly sealed tank would be necessary for such a treatment. ");
		if(pc.isBimbo()) output("Maybe it’s like, to keep things clean and stuff.");
		else output("Perhaps to maintain a sterile medical environment?");
		output(" And yet there’s the name: Orgasmender.");
		if(pc.isBimbo()) output(" You lose interest halfway through reading it, but you’re pretty sure this thing’ll make you cum, like super hard... somehow.");
		else output(" There’s no way this thing doesn’t serve some perverse purpose. Perhaps some sex-toys are stored in some of those compartments...");
		output("\n\nThere’s only one way to find out. The one thing you can be sure of is that it will probably heal your injuries... in addition to whatever else it does to you.");
	}
	else
	{
		output("house the tentacles that provided you so much pleasure last time, all while the machine made sure that your wounds were perfectly healed. It’s name, Orgasmender, could not be more appropriate.");
	}
	clearMenu();
	addDisabledButton(0,"Look Closer");
	addButton(1,"Climb In",climbIntoTheDamnedTank,undefined,"Climb In","Climb inside and activate the device. What could go wrong?");
	addButton(14,"Back",mainGameMenu);
}

//[Climb In]
public function climbIntoTheDamnedTank():void
{
	clearOutput();
	showOrgasmender();
	output("The door hisses when you push the single button on the front, whisking open with a blast of pressurized, stale-tasting air.");
	if(!pc.isNude()) 
	{
		output(" A holographic warning appears in front of the door, indicating that you should remove any and all clothing before entering the chamber for proper treatment. You comply ");
		if(flags["ORGASMENDER"] == undefined) output("a little uneasily");
		else output("a little too eagerly");
		output(", stripping nude.");
	}
	output(" You don’t see any indication of where you should stand, so you climb in, letting your [pc.feet] fall where ");
	if(pc.legCount > 1) output("they");
	else output("it");
	output(" may.");
	if(pc.isTaur() || pc.isNaga()) output(" It’s a tight fit for your unusual body shape, but whoever made this designed it to serve all forms of life, from the biggest leithan to the tiniest tove.");
	output("\n\nThe door slaps shut with a final-sounding click. Your ears pop in response to the hissing, pressurizing atmosphere. It’s a little higher than Terran standard, but not uncomfortable once you get used to it. In comparison to some of the harsher worlds, it’s downright pleasant.");
	output("\n\nA soothing, synthesized voice appears out of thin air. <i>“Thank you for choosing the Orgasmender for your medical needs. Please relax, and remember, struggling will only delay your care.”</i>");
	output("\n\n");
	if(flags["ORGASMENDER"] != undefined) output("You smile. Delaying your care means getting to enjoy the tentacles’ affections that much longer.");
	else output("You step back in alarm, bumping into the metallic glass. There’s no button on this side of the door. It would appear you are trapped.");
	output("\n\nYou feel one of the metallic openings dilating under your [pc.foot] before you have time to register the whirring sound it makes - or that the sound is coming from below and <i>above</i>. ");
	if(flags["ORGASMENDER"] == undefined) output("There’s nowhere to go and nowhere to hide. Those openings are everywhere.");
	else output("Here they come!")
	output("\n\nSomething warm and wet hooks around ");
	if(pc.legCount > 1) output("one of ");
	output("your [pc.legOrLegs], slick with viscous slime. You yank back");
	if(flags["ORGASMENDER"] == undefined) output(" playfully");
	else output(" in panic");
	output(", barely managing free yourself before it can climb higher. It’s still there, wiggling its fleshy, purple mass your direction. It looks fairly smooth, so smooth that it gleams in the artificial light. If it were a little shinier, you’d swear it was made from latex, but there can be no doubt to its organic origins. Pinkish slime drips from where it collects on one of the flexing, undulating bends.");
	output("\n\nAnd it isn’t alone.");
	output("\n\nOther tentacles are slithering out of their hidey-holes, just as shiny and purple and bizarre as the first, rubbing against one another as they seek you out. You note that they aren’t all identical. Most are smooth and tapered, but some ending in quivering, dripping orifices. Others are capped by needle-like tips. You even spot some with sucker-shaped tips, semitransparent and throbbing with erotic potential.");
	output("\n\nThen the slime starts to pour in.");
	output("\n\nTiny holes in between the tentacle ports reveal themselves, pouring more of the pink-tinted slime into the chamber. It puddles around your [pc.feet]");
	if(pc.hasToeClaws()) output(", squishing between your claws");
	else if(pc.hasToes()) output(", squishing between your toes");
	output(", rising higher by the second.");
	if(flags["ORGASMENDER"] == undefined)
	{
		output(" Fearing for your life, you tear your way through the tangle of tendrils and pound your fist on the door, slamming ineffectually against the super-strong material. You’re going to drown in here; you’re sure of it. The viscous pink stuff is already ");
		if(pc.hasKnees()) output("up to your knees");
		else output("halfway up your [pc.legOrLegs]");
		output(", slowing any attempt to move.");
	}
	else
	{
		output(" Smiling to yourself, you watch the tendrils rise higher, accompanied by the viscous pink stuff. It’s already ");
		if(pc.hasKnees()) output("up to your knees");
		else output("halfway up your [pc.legOrLegs]");
		output(", making your movements sluggish. Good thing you aren’t really trying to avoid the tentacles at this point. You know what’s coming.");
	}
	output("\n\nThe tentacles, however, have no problem moving through the thick sludge. " + StringUtil.upperCase(num2Text(pc.legCount)) + " of them circle around your legs, gripping you tight in spite of the liquid lubrication, flexing powerfully against your thighs to root you in place. There’s no escaping ");
	if(pc.legCount == 1) output("it");
	else output("them");
	output(" now. More and more of the tentacles pile on while the garish tide climbs up past your [pc.hips]. Your elbows are snagged, then your hands engulfed. The hollow tendrils climb higher, passing your wrists and elbows before rippling up to your shoulders and pulling tight. You can feel thousands of wiggling cilia squirming inside, rubbing the slime into every inch of your [pc.skinFurScales].");
	if(pc.hasCock() && flags["ORGASMENDER"] == undefined) output(" <i>How would they feel against [pc.oneCock]?</i> You can’t help but wonder, in spite of your dire situation.");
	output("\n\nA bigger, fatter tentacle appears in front of your face, tipped with eight smaller legs connected by a transparent membrane. They spread open, wider than your head, then the whole mass thrusts forward, snapping the tips around the back of your head, the membrane sealing around your mouth. A smaller, cylindrical organ slaps off your cheek, then pulls back, pushing against your lips, oozing a sweet-smelling fluid that makes your skin tingle and flush.");
	output("\n\nAnd still the tank fills. The creeping, pink tide has reached your [pc.chest], crested over your [pc.nipples] and is swiftly climbing to your neck. ");
	if(flags["ORGASMENDER"] == undefined) output("You struggle, but it does little more than make tiny ripples in the cresting slime. You cannot escape.");
	else output("You give a fake little struggle, just to feel the tentacles slip on your [pc.skinFurScales].");

	output("\n\nIn ");
	if(flags["ORGASMENDER"] == undefined) output("a panic");
	else output("glorious anticipation");
	output(", you inhale, remembering too late the tentacles have coopted your usual source of air, replacing the tank’s stale air with warm, vaguely chemically-scented oxygen. Your head swims, but you keep your mouth closed, ");
	if(flags["ORGASMENDER"] == undefined) output("denying the rogue tentacle inside your organic mask entrance. It drips sullenly, pouring more of that strange fluid into your mask. You jerk back in shock. If you don’t do something, you’re going to drown on that stuff. You can already feel it creeping up your chin, matching pace with the outside ooze. It’s already most of the way up your neck!");
	else output("playfully denying the rogue tentacle inside your organic mask entrance. It drips sullenly, pouring more of that strange fluid into your mask. Tilting your head, you watch the stuff slosh around inside the mask, building up a nice big pool of it to drink down. Outside, the pink ooze is already most of the way up your neck!");
	output("\n\nYou suppose that this is all by design. Everything from the flooding goo to the tentacle-hose stuck to your face. The mad genius that designed this obviously intended to force you to drink whatever that tentacle is leaking, whether you wanted to or not.");
	output("\n\nSighing heavily, you open your mouth, and the tentacle thrusts inside. It wiggles once, then lies flat against your tongue, drooling bubblegum-flavored goo over your teeth. You swish it around nervously, then shrug (as much as you are able to) and swallow. Outside your facial tendril, the goo rises higher, climbing past your face to the top of your head. If it weren’t for this tentacle, you’d be drowning right now.");
	output("\n\nMaybe it’s the dizzying, medical chemicals slipping into you with every breath and swallow, but you feel ");
	if(flags["ORGASMENDER"] == undefined) output("oddly grateful that the tendril bothered to grab onto your face at all. It’s keeping you alive, at least.");
	else output("kind of euphoric, happy that the creator of this device was so thoughtful as to keep you alive like this.");
	output(" Alive and... warm. Comfortable. Now that you’re fully submerged, you realize that you’re floating in place, kept from drifting away by the tentacles on your arms and legs. It feels nice, relaxing even. Your muscles buzz happily, slackening, letting the tension flow out with every swallow you take. Medical treatment or not, you know there are places that would sell this sort of relaxation for thousands of credits.");
	output("\n\n");
	if(flags["ORGASMENDER"] == undefined) 
	{
		output("With your panic swiftly flowing out of you, ");
	}
	else output("With your anticipation finally starting to calm, ");
	output("you’re free to listen to your body, to hear your swiftly beating heart thrumming in your ears");
	if(pc.HP() < pc.HPMax()) output(", to feel your injuries vanishing, one by one");
	output(", to become acutely, incredibly perceptive of your blood vessels dilating, open wide, suffusing every inch of your body with slack heat... especially your loins. There’s no denying that ");
	if(pc.hasCock()) 
	{
		output("[pc.eachCock] is ");
		if(pc.lust() < 66) 
		{
			output("filling with increasing tumescence, engorging with alarming rapidity. You couldn’t stop ");
			if(pc.cockTotal() == 1) output("it");
			else output("them");
			output(" if you wanted to. Your body won’t allow it, like the mechanism that keeps you from getting a boner when you aren’t aroused is completely, irrevocably broken. And with your newly acquired erection");
			if(pc.cockTotal() > 1) output("s");
			output(" comes an answering surge of lust. Your sensitized flesh can feel every current in the glowing pink slime, sliding across your [pc.cockHead] like a lover’s tongue, smearing sweet saliva over the tender, hungry flesh.");
		}
		else 
		{
			output("is somehow getting even harder. You were horny before, but not like this. Your cock");
			if(pc.cockTotal() > 1) output("s are");
			else output(" is");
			output(" flooding, swelling until ");
			if(pc.cockTotal() == 1) output("it has");
			else output("they have");
			output(" reached ");
			if(pc.cockTotal() == 1) output("its");
			else output("their");
			output(" full potential, rock hard and bulging, pulsating with every beat of your traitorous heart. It’s like the mechanism that controls your arousal is broken. Someone took the knob and broke it clean off, leaving your body to swell hotter and harder second by second. You’re so sensitive that every minor eddy and current in the pink slime feels like a lover’s tongue against your [pc.cockHead], smearing sweet saliva all over your tender, aching flesh.");
		}
	}
	//Still no new PG, just broke for clarity. Cunt stuff.
	//If has cock bits from above too.
	if(pc.hasCock() && pc.hasVagina()) 
	{
		output("\n\nYour male ");
		if(pc.cockTotal() == 1) output("half isn’t the only thing");
		else output("parts aren’t the only things");
		output(" under the bizarre effects of the perverse chemical stew. Y");
	}
	//omni vag. No new line.
	else if(pc.hasVagina()) output("y");
	if(pc.hasVagina())
	{
		output("our [pc.vaginas] ");
		if(pc.totalVaginas() == 1) output("puffs up, so flush and full that you can feel it squeezing back against your thighs, in turn forcing your swollen folds to squish tight around your [pc.clits].");
		else output("puff up, so flush and full that you can feel them squeezing back against your thighs, compressing against one another, in turn forcing your swollen folds to squish tight around your [pc.clits].");
		output(" It’s maddening, feeling your aching bud");
		if(pc.totalClits() > 1) output("s");
		output(" getting so firm and sensitive, caressed by the exterior of your own slit");
		if(pc.totalVaginas() > 1) output("s");
		output(" until it’s impossible to think of anything besides your cunt");
		if(pc.totalVaginas() > 1) output("s");
		if(pc.hasCock())
		{
			output(" and your cock");
			if(pc.totalCocks() == 1) output("s");
		}
		output(". Your whole world is between your legs, focused on the impossible, inexplicably erotic feeling of your organ");
		if(pc.totalGenitals() > 1) output("s");
		output(" filling up, bloated with so much need that it threatens you to undermine your relaxation.");
	}
	//No crotch dick/vag
	if(!pc.hasGenitals())
	{
		output(" your crotch feels strangely swollen, like your body is trying to flood a set of genitals that simple don’t exist, but then you feel it in your [pc.asshole] too, making your ring feel extra sensitive, the crinkled entrance puffing up in anticipation of something, anything sliding inside to claim it. You wonder how it would feel if you had a dick right now, would your ass still be growing so brazenly wanton, or would your body put all its energy into fattening a thick, hard cock? The thought blows away as fast as it came. Your tingling butthole is too distracting, too hungry for stimulation, getting off on any stray current that slips between your cheeks.");
	}
	//Dicknipples
	if(pc.hasDickNipples())
	{
		output("\n\nTickling trickles of sensation in your [pc.chest] grab your brain by the nose and drag it down beneath the ");
		if(pc.biggestTitSize() > 1) output("soft flesh of your chest");
		else output("surface of your [pc.nipples]");
		output(". Something there is getting tight and hot... no, <i>somethings</i> are getting tight and hot, pushing and thrusting against your relaxing teats. You moan into your mask as you feel your chest-mounted pricks push through your nipples, completely on their own, spreading the fake teats they usually lie behind into pebbly sheaths. They throb wantonly, filling you with the pleasure of their tumescence, slipping an inch further out of your chest with every beat of your heart, wobbling in the slippery goo as they achieve full rigidity.");
		output("\n\nThey’re not supposed to do this, are they? They normally don’t emerge without a little effort on your part, but now they’re not taking no for an answer. Your [pc.dickNipples] are rock-hard and jutting, thrusting out into the milk pink stuff, trembling with their own pernicious arousal. You can feel it, spreading through you, infecting every part of your body, begging you to grab hold and pump until you’re spraying [pc.cum] everywhere. You don’t, of course. Making yourself move seems almost impossible, like all the energy in your muscles long since leached away into your [pc.dickNipples]");
		if(pc.hasGenitals()) output(" and loins");
		output(", leaving you simultaneously tranquil and teased.");
	}
	//NippleCunts
	else if(pc.hasNippleCunts())
	{
		output("\n\nYour [pc.nipples] fatten. There’s no other way to describe the way they pudge up, inside and out. The fuckable passages inside are so thickened that they squeeze shut, the walls rubbing sinfully against one another. [pc.Milk] drools out immediately, mixing into the tank’s fluids, milked out by your own internal pressure.");
		output(" You wish you had something to stick inside of them, that one of the tentacles would thrust in and discover just how tight your titty-twats have become, to stroke your sizzling nerves until they’re exploding in bursts of white-hot, titty-jiggling bliss.");
		output("\n\nIt would be perfect, floating and relaxed yet utterly, completely fucked stupid, letting the pleasure course over every inch of exposed flesh as completely as the wound-mending liquid now surrounding you.");
	}
	//Lipples
	else if(pc.hasLipples())
	{
		output("\n\nYour lipples pucker entirely on their own, abruptly feeling tight and fat, like they’re being pumped up from the inside. You can’t see through the mask, but you’re fairly certain from how they feel that they must look absurdly glossy, every wrinkle smoothed away to make a mirror shine. They must look like an invitation for fucking - the slutty ‘fuck-me’ pout couldn’t be read any other way. [pc.Milk] oozes out over the pillowy surface of your lower lips, diffusing into the pink goo, allowing some of the slime to flow deeper into your body.");
		output("\n\nYou nearly cum from that alone, feeling the viscous fluid rolling over your tender flesh, caressing your opened lips inside and out, making them engorge further, inflated beyond good taste. Your chest doesn’t just look like it needs fucked. It needs absolutely plowed, stuffed full of something, anything, until spunk and [pc.milkNoun] are dribbling out. You’d stuff your fingers in if you could. If your arms weren’t bound, or if the muscles worked, or if you could work up the willpower to try.");
	}
	//Lactating normal boobs
	else if(pc.canLactate() || pc.isLactating())
	{
		output("\n\n[pc.Milk] spills out of your [pc.nipples].");
		if(!pc.canMilkSquirt()) output(" You didn’t feel that full when you got in...");
		output(" It feels better than any of your previous milkings. There’s no pain or tenderness, just the simple, relieving feeling of continually venting lactic pressure. The longer it goes on, the more you become aware of your [pc.nipples] swelling, jutting out into the tank like teats, still spilling [pc.milk]. As a matter of fact, you don’t feel any more empty than when you got in. You’re just squirting and squirting, your body somehow drawing nutrients from the pink sludge in order to lactate forever.");
		output("\n\nMoaning into your mask, you try to arch your back in pleasure, to thrust your jetting tits further forward, but all you manage is a slight twitch. Control over your muscles is gone, replaced with the sensory barrage from below and the constant, lovely squirting from your udders. The only thing that would make it better would be if something clamped down on your chest and started to pump you even faster, though whether it takes the shape of a pair of hungry lips or a sucking tendril matters as much to you as the current stock price of JoyCo.");
	}
	//Parasite tail
	if(pc.hasParasiteTail())
	{
		output("\n\nYour parasitic tail");
		if(pc.tailCount > 1) output("s twitch");
		else output(" twitches");
		output(" fitfully, fighting to remain active, perhaps roused by your own arousal. It doesn’t matter, not when a tentacle is looping around it, squeezing it so tightly that it can’t possible move. You feel a pinch, passed your way by your conjoined nervous systems, and then the rogue appendage goes as obligingly limp as the rest of your body. It feels somewhat numb, but that’s fine, there’s so many sensations pouring out of the rest of your body that you’re thankful not to have to endure another source of intense arousal.");
	}
	processTime(14);
	pc.maxOutLust();
	clearMenu();
	addButton(0,"Next",orgasmenderScene2);
}
public function orgasmenderScene2():void
{
	clearOutput();
	showOrgasmender();
	
	var i:int = 0;
	
	output("Suspended by your own buoyancy and the tentacles alike, your vision blocked by the purple mask, you find yourself nearly bereft of every sensation but touch and taste. The touch of the tank’s squirming tendrils is agony, only deigning to restrain you, not to quench the aching, bubbling need that courses through your body. Meanwhile, the taste on your tongue is even more intense than before, the bubblegum sweetness saturating your taste-buds in absolute saccharine satisfaction.");
	output("\n\nIt barely registers to you that more comes out when your tongue moves, or when you give the oozing tube a little suck. Some part of you must be paying attention, because your tongue can’t seem to stop caressing the slickened underside of your oral intruder. Every swallow is punctuated by a hungry little suck that releases more gummy goodness onto your tongue until you can’t even smell the medicinal chemicals lacing your air supply over the aroma of candied sugar. Never mind your swimming, dizzied head; your mouth is on autopilot. It can suck and swallow and breathe while the tentacles dispense their healing pleasure.");
	output("\n\nAnd oh, what magnificent pleasure!");
	//Dick
	if(pc.hasCock())
	{
		output("\n\nWarm flesh presses to your [pc.cocks], spreading over the [pc.cockHeads] more easily than ");
		if(pc.cockTotal() == 1) output("a ");
		output("lube-soaked sex-toy");
		if(pc.cockTotal() > 1) output("s");
		output(". It’s everything you ached for and more. Much like the sleeves on your arms, ");
		if(pc.cockTotal() == 1) output("this one is");
		else output("these ones are");
		output(" textured with thousands of tiny, wriggling nubs, all moving in little circles, writhing ecstatically against your too-hard, too-rigid dick");
		if(pc.cockTotal() > 1) output("s, bathing more exquisitely sensitive prickskin in their embrace by the second as they slowly slide down your length");
		if(pc.cockTotal() > 1) output("s");
		output(". Your body reacts violently to the pleasure, clenching muscles you thought long slackened, flexing your [pc.cocks], making ");
		if(pc.cockTotal() == 1) output("it");
		else output("them");
		output(" jump inside ");
		if(pc.cockTotal() == 1) output("its sleeve");
		else output("their sleeves");
		output(", squeezing fat dollops of pre-cum from your prostate.");
	}
	//Balls
	if(pc.balls > 0)
	{
		output("\n\nNarrow feelers ");
		if(pc.cockTotal() > 0) 
		{
			output("soon follow their larger, cock-thirsty ");
			if(pc.cockTotal() > 1) output("brethren");
			else output("brother");
			output(", at first gingerly touching your [pc.sack], then slowly weaving");
		}
		else output("gingerly touch against your [pc.sack], slowly weaving");
		output(" around it, clutching your [pc.balls] in a slippery, undulating cradle. They do more than support. Sometimes they teasingly stroke. Other times, they squeeze down, massaging your nut");
		if(pc.balls > 1) output("s");
		output(", squeezing ");
		if(pc.balls == 1) output("it");
		else output("them");
		output(" as if to milk the [pc.cum] out, to gently wring every drop out of your balls in preparation of an ejaculation");
		if(pc.hasCock()) output(" so inevitable that even the blind could see it coming.");
		else output(" that can never come, courtesy of your missing phallus.");
	}
	//Vag
	if(pc.hasVagina())
	{
		output("\n\n");
		if(pc.balls > 0 || pc.hasCock()) output("More tentacles pile into your crotch, this time against your [pc.vaginas]. These ones are thick and clumsy feeling, stroking your urgently oozing folds with clumsy but powerful intent.");
		else output("Tentacles pile into your crotch. You can feel them brushing your thighs on their way up, bouncing off their brothers on their climb toward your [pc.vaginas]. These ones are thicker and clumsier than the ones around your arms, but they press against your oozing folds with firm, unyielding intent.");
		output(" They give you exactly what you’ve been craving: the feeling of hot, hard lengths thrusting against you, rubbing on your [pc.clits], wiggling this way and that as they try to find the perfect angle to finally enter you.");
		output("\n\nOh wow, do they! One moment, you’re groaning around the fattening tentacle in your mouth, the next you’re moaning in bliss, unable to contain the pleasure of your penetration.");
		if(pc.hasVirginVagina()) 
		{
			output(" Your hymen is thrust aside, stretched so wide in an instant that it will never interfere again. Part of you is surprised that it didn’t tear from taking such an immense prick, but it’s difficult to worry about when you’re getting fucked so perfectly, finally getting to use your cunt");
			if(pc.totalVaginas() > 1) output("s as they were");
			else output(" as it was");
			output(" meant to be used.");
		}
		else 
		{
			output(" There was no real foreplay, just the feeling of ");
			if(pc.totalVaginas() == 1) output("an ");
			output("immense prick");
			if(pc.totalVaginas() > 1) output("s");
			output(" spreading you open and pouring ");
			if(pc.totalVaginas() > 1) output("themselves");
			else output("itself");
			output(" inside, the shining surface rippling enticingly as it burrows itself fully into your cunt");
			if(pc.totalVaginas() > 1) output("s");
			output(", stuffing you until you’re firmly positioned on the edge of pleasure and pain.");
		}
		pc.cuntsChange(pc.biggestVaginalCapacity()/2);
		output("\n\nA slow build-up doesn’t seem to be what your inhuman lover");
		if(pc.totalVaginas() > 1) output("s have");
		else output(" has");
		output(" in mind. ");
		if(pc.totalVaginas() > 1) output("They reverse");
		else output("It reverses");
		output(" direction, pulling out, coiling in the pink, healing goo, making new eddies and currents in the sludge before " + (pc.totalVaginas() == 1 ? "it thrusts" : "they thrust") + " back in hard enough to rock you in your restraints. Your body shakes and bounces with the force of your fucking, the excess tentacles continuing to slide over your lips and [pc.clits], drowning you in ecstasy inside and out. Internal muscles ripple and clench automatically, seeming to draw strength from the rest of your weakened form, aggressively milking the tentacles.");
		
		for(i = 0; i < pc.totalVaginas(); i++)
		{
			pc.cuntChange(i, (pc.vaginalCapacity(i)/2));
		}
	}
	//No dick or vag, anal slooots
	if(!pc.hasGenitals())
	{
		output("\n\nWarm flesh presses to your [pc.asshole], rubbing slowly but insistently against. It’s bigger than the others you noticed while you could still see, fatter and more clumsy. A few times, it tries to thrust inside but awkwardly deflects off your rim, the discomfort only increasing your anticipation. A bigger, thicker wad of bubble-yummy goodness explodes down your throat, and you relax even more, feeling your sphincter open up, guiding that questing tentacle into your crinkled entrance.");
		output("\n\nYou nearly cum the moment it slides inside, just from the feeling of it passing through your [pc.asshole], but also from how full it makes you feel, how it wriggles in your strangely sensitized guts. The whole tentacle can’t fit in your [pc.asshole] of course, and the extra length coils up against your [pc.butt], writhing against itself. When the tentacle reverses course, you moan into your mask, aching only for it to fill you once more. The rest of your body may as well not even be there for how much attention you give it. Your ass is all the matters, the center of pleasure in your universe.");
		
		pc.buttChange(pc.analCapacity()/2);
	}
	//Dicknipples
	if(pc.hasDickNipples())
	{
		if(pc.hasCock()) output("\n\nMore of those cilia-lined orifices find their way to your [pc.chest] to envelop your [pc.dickNipples].");
		else output("\n\nDeliciously slick, hollow tendrils, just like the ones on your arms, zero in on your [pc.chest], rubbing against your [pc.dickNipples].");
		output(" The moment contact is made with your chest-mounted cocks, they arch and slide forward, completely enveloping your tumescent phalli, ensconcing them from tip to areolae-sheath in an instant. You nearly cream yourself on the spot. Then the cilia inside begin to wiggle, caressing every inch of your [pc.dickNipples], slobbering slime over every inch of pulsing prick, squeezing in concentric ripples along their lengths as if they could milk your spunk as easily as a cow’s milk.");
	}
	//Lipples
	else if(pc.hasLipples())
	{
		output("\n\nYour slutty, aching lipples don’t have to wait long to be taken care of either. Long, fat purple tentacles press against the needy, already parted lips, and once more, you nearly orgasm from that tidbit of sensation alone. They thrust in while you’re still flabbergasted by ecstasy, perfectly shaped and contoured to wiggle all the way into your blowjob-dispensing holes with ease. Blessedly, your lipples do what they made to do with a minimum of conscious effort - suck. And do they ever! The corners quirk up in sensuous smiles now that they’ve been fitted with suitably phallic plugs, matched by similarly stupid grin on your face.");
		output("\n\nYou wish you could see what’s happening down there, but the facial mask forces you to imagine what it must look like... Those thick purple tendrils squirming and writhing in your tits’ mouths, the plush, engorged lips sliding back and forth over the undulating pricks. It’s enough to distract you from the near-constant pleasure pouring out of your ");
		if(pc.hasGenitals()) output("crotch");
		else output("ass");
		output(" and refocus your mind entirely on your fuckable boobs, if only for a minute. It’s heaven, a heaven of nothing but dicks on lips, mated together to produce endless ecstasy.");
	}
	//Fucknipples
	else if(pc.hasNippleCunts())
	{
		output("\n\nYour slutty, aching nipples don’t have to wait long to be taken care of either. Long, fat purple tentacles press against the over-inflated tips, grinding on the entrances to your fuckable chest. It makes your puffed-up walls grind against one another, but it doesn’t seem to have any hope of squeezing inside. You’re too engorged, too swollen for anything to ever squeeze inside.");
		output("\n\nOr so you thought. The tentacles push harder and harder, to the point where you register a hint of pain. Should it be more? You have a hard time remembering. There’s too much pleasure and far too much pink to think of anything besides fucking and sucking. A spike of bliss surges through your [pc.nippleCunt], announcing that one tentacle has found a home at last. It stretches you wide, so wide that it feels like your tit has swollen up to twice its usual size, and the more wriggling flesh that pours inside, the bigger it feels.");
		output("\n\n[pc.Milk] squirts from your other side, cascading into the tank, making the fluid level rise ever so slightly higher, displaced by the wiggling mass of another fuck-hungry tendril.");
		if(pc.totalNipples() > 3) output(" The rest of your [pc.nippleCunts] are soon stuffed in short order, every penetration happening quicker than the last, transforming your chest into a nest of squirming, titty-fucking tendrils.");
		output(" They drill into you, thrusting in and out, squeezing your juices out with every thrust and making your tits radiate jolts of blinding pleasure. It’s like your whole body is getting fucked. Every thrust fills you full-body bliss, a delirious cascade of sensuous delight that seems to rise higher with every beat of your heart.");
	}
	//Lactic Nipples
	else if(pc.canLactate() || pc.isLactating())
	{
		output("\n\nSomething encloses your leaking nipples - something large and hollow. It seals down around your spurting areolae, capturing your [pc.milk] before it can pollute the pink sludge any further. As soon as the seal is secure, they start to suck, yanking on your [pc.nipples], making them longer and fatter, the better to express their lactic cargo. It feels like your boobs are ejaculating, squirting long lances of [pc.milk] into the suck-hungry tentacles, feeding them your endless bounty.");
		output("\n\nIt’s perfect, a sense of constant relief that never gets old mixed with a hint of sensuous delight. You could cum from this alone in time you’re sure, but between this and what’s going on down south, you don’t know how long you can hold onto your sanity. Every caress, every squeeze - it’s all answered by more gushes of milk, drowning out your thoughts in horny yet contented bliss. If you could, you’d sign up to do this every day, just give milk and cum your brains out for the rest of eternity... Stars, you’re so close to cumming!");
	}
	processTime(30);
	pc.lust(2000);
	clearMenu();
	addButton(0,"Next",orgasmenderScene3);
}

public function orgasmenderScene3():void
{
	clearOutput();
	showOrgasmender();
	output("Still hanging in the goo, sucking dutifully, you let the tentacles fuck you where and when they please, drowning you in pleasure, leaving no room in your mind for anything but imagining what it must look like - and the feeling of your body rushing to climax. Most of your muscles don’t even twitch, but here and there, your body reacts powerfully, clenching your abdominals, tightening internal muscles in reflexive preparation.");
	output("\n\nWithout warning, the tendril on your tongue begins to jerk and spurt, spraying more of that bubble-gum-flavored goo down your throat, hosing out so much that you have to swallow non-stop or choke on it. It’s too much to handle, really. No sooner than you finish gulping it all down that you totally lose connection with reality. It feels like your brain is sliding down your spine, getting pumped down into your crotch by your hammering heart. A direct line of communication between ");
	if(pc.hasCock()) output("your [pc.cocks]");
	if(pc.hasCock() && pc.hasVagina()) output(" and ");
	if(pc.hasVagina()) output("your [pc.vaginas]");
	if(!pc.hasGenitals()) output("your [pc.asshole]");
	output(" opens up, blasting you with unfiltered, orgasmic delight, short-circuiting synapses and scattering your thoughts beneath the white-hot blossom of your orgasm.");
	//Cocks
	if(pc.hasCock())
	{
		output("\n\n<i>Cum.</i> It isn’t a thought so much as a pure, biological imperative. You need to expel your seed. You need your [pc.balls] to tense and pump out every single drop of primitive, pregnancy-inducing pleasure. The feeling of your [pc.cum] arcing through your internal plumbing, squeezing up into your [pc.cocks], and finally launching out to be captured by the now-sucking tendrils is absolutely sublime. So sublime in fact, that your first ejaculation triggers another on its heels, restarting your orgasm with a sudden, staccato contraction.");
	}
	//Pussies
	if(pc.hasVagina())
	{
		output("\n\nMeanwhile, the tentacle");
		if(pc.totalVaginas() > 1) output("s");
		output(" in your [pc.vaginas] ");
		if(pc.totalVaginas() > 1) output("are");
		else output("is");
		output(" expanding at your entrance, stretching you extra wide before the bulge squishes on inside. A second later, you feel heat explode inside you, detonating in your ");
		if(pc.isPregnant()) output("passage");
		else output("womb");
		if(pc.totalVaginas() > 1) output("s");
		output(" with the force of a sexual atom bomb, flooding every nook and cranny with artificial seed. Your poor puss");
		if(pc.totalVaginas() > 1) output("ies");
		else output("y");
		output(" can’t take it. ");
		if(pc.totalVaginas() > 1) output("They tremble and clench");
		else output("It trembles and clenches");
		output(", inadvertently milking more seed from the beastly invader" + (pc.totalVaginas() == 1 ? "" : "s") + " and over-stimulating " + (pc.totalVaginas() == 1 ? "its" : "their") + " tender nerves at the same time.");
		output("\n\nNo amount of paralytic agents could stop your [pc.hips] from spasming now, from thrusting back against the tentacles, shuddering and blissful. Your cunny-gasm hits your brain with all the force of an out-of-control freighter");
		if(pc.hasCock()) output(", piling on the back of your masculine climax");
		output(", washing away anything in its path. Only pleasure and confused, desperate humping remains: your body’s desire to be impregnated by whatever so completely pleased it.");
	}
	//Nogenitals
	if(!pc.hasGenitals())
	{
		output("\n\n<i>Pleasure</i>. It isn’t a word or a thought to you anymore. It’s a state of being. It’s everything, from the hot, sticky-slick cum pumping into your [pc.asshole] to the way the tentacle feels as it thrusts in and out of you, relentlessly stroking your misfiring nerves inside and out. You are orgasm incarnate, yoked to the rhythm of the tentacle in your ass, bouncing on it like nothing more than a piece of meat designed to climax. If you had an ounce of sapient thought left in your brain, you’d be wishing you could grab your cheeks and spread your ass wider, to get fucked harder, but the best you can manage is to moan and weakly shudder.");
	}
	//Dipples
	if(pc.hasDickNipples())
	{
		output("\n\nThe [pc.milk] squirting from your [pc.dickNipples] into their tendrils seems almost an afterthought, like it’s so far above your loins-lost mind that you can barely perceive it. That doesn’t stop you from cumming up too - far from it. Your [pc.dickNipples] are shooting [pc.milk] like milk, just absolutely hosing it out, providing a bass line to the symphony of your full-body climax, a regular thumping beat beneath the more intense notes.");
	}
	//Lipples
	else if(pc.hasLipples())
	{
		output("\n\nSticky-slick heat explodes behind your [pc.nipples], accompanied by the faint pleasure of your lip-gasms. It seems so distant compared to what’s happening in your loins, but that doesn’t stop you from enjoying it. It doesn’t stop you from loving the way the tentacle-cum feels as it cascades over your bloated lips, or how your cock-loving cushions squeeze and compress around the hard-pumping, thrusting mass. It’s a constant, thumping rhythm layered just behind the more intense jolts of the rest of your climax.");
	}
	//Pusspples
	else if(pc.hasNippleCunts())
	{
		output("\n\nSticky-slick heat explodes behind your [pc.nippleCunts], accompanied by the faint pleasure of your boob-gasms. It seems so distant compared to what’s happening in your loins, but that doesn’t stop you from enjoying it. It doesn’t stop you from loving the way the tentacle-cum feels as it cascades out of your stuffed holes, or how how perfectly your engorged interiors wrap around the hard-pumping, thrusting masses. It’s a constant, thumping rhythm layered just behind the more intense jolts of the rest of your climax.");
	}
	//Lactation!
	else if(pc.canLactate() || pc.isLactating())
	{
		output("\n\nYour [pc.milk] doesn’t slow one bit, not even when you spiral down into absolute depravity. Instead, it continues to pour out, sometimes squirting when the tentacles suck harder. The sensation is so different from your orgasm, like laying down on the universe’s most perfect mattress while an amazon uses your body as her own personal sex-toy. Either is an amazing experience on its own, but together... together they’re perfect. Together they make you feel absolutely content, absolutely blessed and happy to cum and squirt.");
		pc.milked(100);
	}
	//Merge
	output("\n\nSpasms and twitches wrack your body. You can’t stop cumming, not once you started so forcefully. Any refractory period seems completely, totally eliminated, like your body is ready to go again before you’re even halfway through a decent climax. Thankfully, the tentacle in your mouth spends itself, allowing you to dedicate your mouth to whorishly moaning, vocalizing pleasure that only seems to get more intense by the second.");
	processTime(20);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",orgasmenderScene4);
}

public function orgasmenderScene4():void
{
	clearOutput();
	showOrgasmender();
	output("You aren’t sure why or when your memory of the events in the tank cut off. You may have lost consciousness or simply been overwhelmed by the inhuman amounts of pleasure coursing through your body.");
	output("\n\nOne thing is for sure, though. The tentacles are gone, and there is no trace of the goo that once filled the tank. The door is open, and you’re laying on the floor");
	if(pc.HP() < pc.HPMax()) output(", completely healed");
	output(", nude, and kept comfortably warm by gentle puffs of air from the pod’s heated floor.");
	if(flags["ORGASMENDER"] != undefined) output(" You’re not sure you’ll ever get tired of that. Maybe you can get one of these for your ship someday?");
	else output(" Well... it may not have been what you expected, but the Orgasmender certainly delivered on its name.");
	processTime(60);
	
	var x:int = 0;
	for(x = 0; x < 10; x++)
	{
		pc.orgasm();
	}
	//Use Nayna for cumshots for cheap, excessive, non-impregnating jizz
	var pp:PregnancyPlaceholder = getNaynaPregContainer();
	if(pc.hasVagina())
	{
		for(x = 0; x < pc.totalVaginas(); x++)
		{
			pc.loadInCunt(pp, x);
		}
	}
	pc.loadInAss(pp);
	if(pc.hasLipples() || pc.hasNippleCunts())
	{
		pc.loadInNipples(pp);
	}
	pc.HP(pc.HPMax());
	pc.energy(40);
	pc.taint(3);
	IncrementFlag("ORGASMENDER");
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}