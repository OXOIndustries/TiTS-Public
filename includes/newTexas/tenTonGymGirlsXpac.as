/**
	 * ...
	 * @author DrunkZombie
	 */
/*

New Flags:
NEW_TEXAS_STEP //counts steps in new texas to limit proc of girl encounter (1 per 20)
TTGYM_LOLA_TIMER //when last encountered lola
TTGYM_SIMONE_TIMER //when last encountered lola
TTGYM_BETSY_VICTORIA_TIMER //when last encountered lola
TTGYM_LOLA_SIMONE_TIMER //when last encountered lola
TTGYM_LOLA_HOME //Times went home with lola
TTGYM_SIMONE_HOME //Times went home with simone
TTGYM_BETSY_VICTORIA_HOME //Times went home with betsy and victoria
TTGYM_LOLA_SIMONE_HOME //Times went home with lola and simone
TTGYM_SHOWERED //times showered at TTG
TTGYM_PC_LOCATION //location where pc had encounter with TTG girl
TTGYM_LOLA_POOL //time you fucked lola's pussy in the pool
TTGYM_LOLA_PUSSY //time you fucked lola's pussy at her home
TTGYM_LOLA_ANAL //time you fucked lola in the ass
TTGYM_LOLA_HOTDOG //time you hotdogged lola's ass
TTGYM_LOLA_CUDDLE //time you cuddled with lola
TTGYM_SIMONE_ORAL //time simone gave you oral
TTGYM_SIMONE_ORAL_GIVE //time you gave simone oral
TTGYM_SIMONE_DP_GYM //time you fucked simone's pussy and ass at the gym
TTGYM_SIMONE_FUCKED_PUSSY //time you fucked simone's pussy at her home
TTGYM_SIMONE_DP_HOME //time you fucked simone's pussy and ass at her home
TTGYM_SIMONE_MUTUAL_FAP //time you and simone dildoed each other
TTGYM_BETSY_VICTORIA_NEVER //undefined/0 = meet ok, 1 = disable encounters
TTGYM_BETSY_VICTORIA_SEXSWING //Times had sex with betsy and victoria using the sex swing
TTGYM_LOLA_SIMONE_L_CUN //times licked lola's pussy during threesome
TTGYM_LOLA_SIMONE_S_FIN //times fingered simone's pussy during threesome
TTGYM_LOLA_SIMONE_L_PUSSY //times fucked lola's pussy during threesome
TTGYM_LOLA_SIMONE_S_PUSSY //times fucked simone's pussy during threesome
TTGYM_LOLA_SIMONE_L_ASS //times fucked lola's ass during threesome
TTGYM_LOLA_SIMONE_S_ASS //times fucked simone's ass during threesome
TTGYM_LOLA_SIMONE_DP //times dp'd both of them during threesome
TTGYM_LOLA_SIMONE_DBL_RIDE //times they both rode you at the same time
TTGYM_LOLA_SIMONE_DBL_BJ //times they both gave you a bj at the same time
TTGYM_LOLA_SIMONE_PUSSY_HL //times simone fucked your pussy during threesome
TTGYM_LOLA_SIMONE_PUSSY_LCUN //times lola licked your pussy during threesome
TTGYM_LOLA_SIMONE_PUSSY_SCUN //times simone licked your pussy during threesome
TTGYM_LOLA_SIMONE_COCK_SFAL //times simone sucked your dick during threesome
*/

public function tentongymCanEncounterLola():Boolean
{
	var timeframe:int = 2 * 24 * 60;
	if (flags["SEXED_LOLA"] == undefined || flags["SEXED_LOLA"] < 1) return false;
	if (flags["TTGYM_LOLA_TIMER"] != undefined)
	{
		if (GetGameTimestamp() - timeframe <= flags["TTGYM_LOLA_TIMER"]) return false;
	}
	
	if (pc.cockThatFits(chars["LOLA"].vaginalCapacity(0)) >= 0 || (pc.hasVagina() && pc.hasHardLightEquipped())) return true;
	
	return false;	
}
public function tentongymCanEncounterSimone():Boolean
{
	var timeframe:int = 2 * 24 * 60;
	if (StatTracking.getStat("contests/simone challenge wins") < 1) return false;
	if (flags["TTGYM_SIMONE_TIMER"] != undefined)
	{
		if (GetGameTimestamp() - timeframe <= flags["TTGYM_SIMONE_TIMER"]) return false;
	}
	
	if (pc.cockThatFits(chars["SIMONE"].vaginalCapacity(0)) >= 0 || pc.hasVagina()) return true;
	
	return false;	
}
public function tentongymCanEncounterBetsyVictoria():Boolean
{
	var timeframe:int = 2 * 24 * 60;
	if (flags["TTGYM_BETSY_VICTORIA_NEVER"] == 1) return false;
	if (flags["TTGYM_SHOWERED"] == undefined)
	{
		//update showered flag to true if met shower girls before this xpac
		if (flags["MET_SHOWER_GIRLS"] != undefined) flags["TTGYM_SHOWERED"] = 1;
		else return false;
	}
	if (flags["TTGYM_BETSY_VICTORIA_TIMER"] != undefined)
	{
		if (GetGameTimestamp() - timeframe <= flags["TTGYM_BETSY_VICTORIA_TIMER"]) return false;
	}
	
	if (pc.hasCock()) return true;
	
	return false;	
}
public function tentongymCanEncounterLolaSimone():Boolean
{
	var timeframe:int = 2 * 24 * 60;
	if (flags["TTGYM_LOLA_HOME"] == undefined || flags["TTGYM_LOLA_HOME"] < 1) return false;
	if (flags["TTGYM_SIMONE_HOME"] == undefined || flags["TTGYM_SIMONE_HOME"] < 1) return false;
	if (flags["TTGYM_LOLA_SIMONE_TIMER"] != undefined)
	{
		if (GetGameTimestamp() - timeframe <= flags["TTGYM_LOLA_SIMONE_TIMER"]) return false;
	}
	
	if (pc.cockThatFits(tentongymLolaSimoneSmallestHoleCap()) >= 0 || pc.hasVagina()) return true;
	
	return false;	
}
public function tentongymShowLola(nude:Boolean = false):void
{
	showName("\nLOLA");
	if(!nude) showBust("LOLA");
	else showBust("LOLA_NUDE");	

	author("Slab Bulkhead");
}
public function tentongymShowSimone(nude:Boolean = false):void
{
	showName("\nSIMONE");
	if(!nude) showBust("SIMONE");
	else showBust("SIMONE_NUDE");	

	author("Slab Bulkhead");
}
public function tentongymShowBetsyVictoria(nude:Boolean = false):void
{
	showName("BETSY &\nVICTORIA");
	if(!nude) showBust("BETSY_AND_VICTORIA");
	else showBust("BETSY_AND_VICTORIA_NUDE");	

	author("Slab Bulkhead");
}
public function tentongymShowLolaSimone(nude:Boolean = false):void
{
	//currently no named nude bust so set false
	nude = false;
	//
	showName("LOLA &\nSIMONE");
	if(!nude) showBust("LOLA","SIMONE");
	else showBust("LOLA_NUDE","SIMONE_NUDE");	

	author("Slab Bulkhead");
}

//Lola
public function tentongymEncounterLola():void
{
	clearOutput();
	tentongymShowLola();
	
	output("As you head down the road, a familiar voice calls your name. You turn to see Lola, the redhead from the Ten Ton Gym, heading down the street toward you.");
	output("\n\nNow that she’s not in the pool, she’s wearing a strappy black swimsuit. The top holds her freckled boobs in place while leaving their tops open to the sky, while the bottom has some high straps going above her waist. The bottom might cover most womens’ butts, but on Lola, it’s not much more than a thong. She’s also wearing what would be a pair of denim shorts on most people, but on her it looks like just a cloth band wrapping around her hips and ass, leaving her bulbous rear sticking out above and below the blue jeans. You’re not sure how she got the zipper closed, let alone the button at the top.");
	output("\n\n<i>“Hi there, [pc.name],”</i> Lola says, giving you a smile as she walks up to you. <i>“How you doing?”</i>");
	output("\n\nYou tell Lola how you’ve been, and fill her in on your recent adventures. She nods, looking interested, so you ask her how she’s been.");
	output("\n\n<i>“Doing good, just headed home for now,”</i> she says. <i>“I had a long day at the gym, so I’m ready to relax for a while.”</i> She gives you a look up and down; she’s never been shy about checking you out and that clearly hasn’t changed.");
	if (flags["TTGYM_LOLA_HOME"] == undefined) output(" <i>“But I’m not </i>too<i> tired, if you want to, you know, come on over.”</i>");
	else output(" <i>“But you know me, I’m not </i>too<i> tired, if you want to come on over again.”</i>");
	
	output("\n\nLola shakes her hips at you a few times, then giggles. What do you say to that?");
	
	processTime(3);
	
	flags["TTGYM_LOLA_TIMER"] = GetGameTimestamp();	
	
	clearMenu();
	if (silly) addButton(0,"Fuck the Cow",tentongymLolaHome, undefined, "Fuck the Cow", "DO IT NOW.");
	else addButton(0,"Yes",tentongymLolaHome, undefined);
	addButton(1,"Nope",tentongymLolaNope, undefined);
	
}

public function tentongymLolaHome():void
{
	clearOutput();
	tentongymShowLola();
		
	moveTo("NT TTGG APARTMENT");
	
	if (flags["TTGYM_LOLA_HOME"] == undefined)
	{
		output("You tell Lola yes, you would like to head back to her place. She gives you a bright smile, and takes your hand. <i>“Come on, it’s not far,”</i> she says, leading you down a side street.");	
		output("\n\nThe road takes you farther than you’d expected, a mile or two behind some hills, to a few long blocks of houses and apartments. It’s still pretty rustic, but a little modern, like the rest of New Texas itself. Lola leads you to a small apartment building with a few kids playing in the front yard, and several nursing mothers sitting on a nearby bench. They wave to Lola as she heads in, and she waves back.");
		output("\n\n<i>“It’s a nice little place,”</i> Lola says once you’re inside. The lobby is decorated with what looks like local arts and crafts, and a bored cowgirl sits in the office, porn sounds playing from the tablet she’s holding in one hand. <i>“I work at the gym, so it’s good to live so close by.”</i>");
		output("\n\nYou ask her what she does at the gym, wondering if Quenton lets all the people who work there go around naked or if Lola’s a special case.");
		output("\n\n<i>“A little bit of everything, but mostly cleaning and maintenance,”</i> Lola says with a nod. <i>“I’ve been working there for a while. The pool’s my favorite place, though the cleaning system gets pretty clogged sometimes.”</i> She leads you up a set of stairs to the second floor, and you watch her ass bounce as she climbs. Her denim shorts look like they could split their seams at any moment. <i>“Quenton’s a real sweetheart, though, and I can usually set my own hours.”</i>");
		output("\n\nWhen you reach the second floor, Lola stops at door nine, and presses her thumb to a pad on the lock above the doorknob. The lock beeps, the door unlatches, and Lola smiles at you as she gives it a bump with her hip. The door flies open, and Lola says, <i>“Come on in.”</i>");
		output("\n\nLola has a corner apartment, with windows open wide on two walls, letting in plenty of light for the plants she has potted everywhere. Bright flowers and green leaves fill the place with color, and Lola checks the plants quickly as you walk in, adding a little water to a few of them. She runs a hand down one vine, then turns to look at you. <i>“Do you have any plants on your ship? I’ve read about people who have whole greenhouses on theirs, but I don’t know if that’s your thing.”</i>");
		output("\n\nYou tell her that you do");
		if(azraIsCrew() && flags["AZRA_MHENGAED"] != undefined && flags["AZRA_MHENGAED"] != 0) output(" and");
		else output("n’t, but");
		output(" you can see that she clearly likes growing things.");
		output("\n\n<i>“Oh, I like making all kinds of things grow,”</i> she says with a nod. <i>“Plants, flowers...cocks, hardlights, you know. Things.”</i> She pauses, a thoughtful look on her face. <i>“Do hardlights grow? Kind of, when you turn them on....”</i> She laughs, then smiles at you and points farther into the apartment. <i>“The bedroom’s this way.”</i>");
		output("\n\nYou follow Lola as she heads toward the bedroom. A quick glance into her kitchen shows two counters covered with cooking implements, with pots and ladles hanging from hooks on the walls and an oven that’s clearly seen a lot of use.");
		output("\n\nLola’s bedroom is simple, with a few pictures on the walls and a few plants hanging in the corners. Her cozy-looking bed sits at the middle of one wall, big enough for Lola and a friend but not much more, with messy covers that make it look like she hasn’t made it for a few days. Once you’re inside, Lola stops, then steps back and presses her ass against you.");
	}
	else
	{
		output("You tell Lola yes, you would like to head back to her place again. She gives you a bright smile, and takes your hand, leading you down the long road back to her apartment.");
		output("\n\nOnce you’re there, Lola leads you through her plant-filled living room and past her kitchen, back to her bedroom and its cozy, messy bed.");
		if (flags["TTGYM_LOLA_SIMONE_HOME"] != undefined) output(" You notice one of the dildos Simone kept by her bath is now next to Lola’s bed; it looks like the two of them are a regular thing now.");
		output(" Once you’re inside, Lola stops, then steps back and presses her ass against you.");
	}
	
	output("\n\nLola’s giant rear end squishes against your [pc.hips] as she leans back.");	
	if (pc.hasCock())
	{
		output(" The contact is enough to make [pc.eachCock] start to swell");
		if (!pc.isCrotchExposed() && pc.hasLowerGarment()) output(" inside your [pc.lowerUndergarment]");
		if (pc.hasVagina()) output(", and there’s a sudden surge of wetness in [pc.eachVagina] too");
		output(". Lola rubs her ass against your crotch, and you’re sure she can feel you growing harder.");
	}
	else
	{
		output(" There’s a sudden surge of wetness in [pc.eachVagina]");
		if (!pc.isCrotchExposed() && pc.hasLowerGarment()) output(" within your [pc.lowerUndergarment]");
		output(", and Lola rubs her ass against your crotch, surely knowing the effect she’s having on you.");
	}
	output(" You drop your hands and cup as much of Lola’s ass as you can in each one, stroking the smooth, soft skin, then reach around to her hips and pull her even closer.");
	
	output("\n\n<i>“Mmm,”</i> Lola moans, then");
	if (pc.tallness >= 67) output(" leans her head against your [pc.chest].");
	else output(" leans her head back to rest on your shoulder.");
	
	if (flags["TTGYM_LOLA_HOME"] == undefined)
	{
		output(" She rests her hands on yours, then pulls them around to the front of her barely-fitting jean shorts. <i>“Help me get these off?”</i>");	
		output("\n\n");
	}
	else
	{
		output(" She rests her hands on yours, then pulls them around to the front of her barely-fitting jean shorts. <i>“Think you can get these off faster this time?");
		if (flags["TTGYM_LOLA_SIMONE_HOME"] != undefined) output(" Maybe you can beat Simone’s record, but I don’t know...");
		output("”</i>.");
		output("\n\nChallenge accepted. ");
	}
	output("You reach around to the front of her shorts, which only pushes her butt more against you, her cheeks doing their best to wrap themselves around your [pc.hips]. The sheer strain Lola’s hips are putting on her shorts becomes clear as you try to undo the button -- you have to grab hold of the cloth and give it a good yank to get enough give to get the button undone. Lola lets out a sigh as the denim comes loose, and you slide the zipper down.");
	output("\n\nHer shorts don’t move. They’re still caught on her hips and ass, and you wonder why she even bothered zipping them up, if they’re not going anywhere without help. Lola just giggles again.");
	output("\n\nYou slide your hands back around to her hips and give the shorts a good tug. They move a little, but her ass is still holding them in place. You pull again, jerking them down an inch or two, then take hold of the cloth band around Lola’s butt and yank. Lola yelps, laughing as you struggle with the shorts, slowly squeezing them over her titanic rear until they’re finally free.");
	output("\n\nLola gives her ass a few bounces once it’s out of the shorts, then kicks the overstretched garment across the room. <i>“Now the suit!”</i>");
	output("\n\nWell, this should be easier. You pull Lola’s swimsuit straps down over her shoulders, then undo the catch in the back, setting her bouncy boobs loose. She tosses the top aside, and rubs her tits with both hands, sighing again.");
	if (flags["TTGYM_LOLA_HOME"] == undefined)
	{
		output(" <i>“It’s so much better to have them free,”</i> she says.");
		output("\n\nWhy, you ask as you reach for her swimsuit bottoms, doesn’t she just go around naked if she likes that so much. It’s not like anyone would mind.");
		output("\n\n<i>“I don’t know,”</i> she says as you slide your hands under her bottoms’ straps. <i>“I think I just like putting clothes on so I can get naked again.”</i>");
		output("\n\nThat makes sense, especially for a New Texan. Fortunately, her swimsuit’s a lot stretchier than her shorts were, and you tug the bottom out from between her cheeks as you pull it down. You drop the suit as soon as it’s past her hips, and once Lola’s naked, she turns to face you, her pink nipples and the little tuft of red hair between her legs bare and free.");
		output("\n\nShe giggles. <i>“Your turn!”</i>");
		output("\n\nLola strips you out of your [pc.gear], and gives you a long look up and down once you’re naked. <i>“I did kind of wonder what you’d look like outside the pool,”</i> she says, then smiles at you. <i>“I like it.”</i> She glances toward her bed.");
		output("\n\n<i>“So, do you want to do it like before, or....”</i> She lowers her voice, and blushes, like she’s embarrassed to ask. <i>“Do you want to put it in my butt?”</i>");
	
	}
	else
	{
		output("<i>“Always better to have them free,”</i> she says.");
		output("\n\nWhile she enjoys having her boobs uncovered again, you tug her swimsuit bottom out from between her cheeks as you pull it down. You drop the suit as soon as it’s past her hips, and once Lola’s naked, she turns to face you, her pink nipples and the little tuft of red hair between her legs bare and free.");
		output("\n\nShe giggles. <i>“Your turn!”</i>");
		output("\n\nLola strips you out of your [pc.gear], and gives you a long look up and down once you’re naked, then then smiles at you. She glances toward her bed.");
		output("\n\n<i>“So, do you want to do it like we did in the pool, or....”</i> She grins at you again, and blushes just a little. <i>“Do you want to do butt stuff?”</i>");
	}		
	
	if (flags["TTGYM_LOLA_HOME"] == undefined)
	{
		//1st time set sex count flags to update and reflect correct totals from before this xpac
		flags["TTGYM_LOLA_POOL"] = flags["SEXED_LOLA"];
	}		

	IncrementFlag("TTGYM_LOLA_HOME");
	
	processTime(30);
	pc.changeLust(30);
	
	clearMenu();
	var strapon:Boolean = false;
	if (pc.hasVagina()) strapon = true;
	addButton(0, "Like Before", penisRouter, [tentongymLolaLikeBefore, chars["LOLA"].vaginalCapacity(0), strapon, 0]);
	if (pc.cockThatFits(chars["LOLA"].analCapacity()) >= 0 || pc.hasHardLightEquipped()) addButton(1, "In the Butt", penisRouter, [tentongymLolaInTheButt, chars["LOLA"].analCapacity(), strapon, 0]);
	else addDisabledButton(1, "In the Butt", "In the Butt", "You need a cock small enough for this!");
}
public function tentongymLolaNope():void
{
	clearOutput();
	tentongymShowLola();
	
	if (pc.isAss()) output("You tell Lola to fuck off, you’re busy. She looks a little hurt, but nods.");
	else if (pc.isNice()) output("You thank Lola for the offer, but tell her you’re busy with something else right now, maybe another time. She smiles again, and nods.");
	else output("You give Lola a wink and say you’d love to, but the planet rush worlds won’t conquer themselves. She giggles again, and nods.");
	
	output("\n\n<i>“All right, [pc.name],”</i> Lola says. <i>“Maybe some other time?”</i> She waves, then turns down a side street off the main road, her expansive ass jiggling with every step as she walks away.");
	
	processTime(2);
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}
public function tentongymLolaLikeBefore(kok:int=0):void
{
	clearOutput();
	tentongymShowLola(true);
	
	var vag:int = -1;
	
	if (kok >= 0)
	{
		output("You tell Lola you’d like to do it like you did in the pool, only with a little less floating this time. She smiles at you, then steps closer and drops to her knees, making her ass and thighs stick out over her feet. Then, she puts her face even with your [pc.crotch]. <i>“Can’t do this in the pool,”</i> she says, then gives your [pc.cock " + kok + "] a long lick.");
		output("\n\nA shudder runs through you at the feeling of her soft, wet tongue on your dick, and you groan as you quickly grow stiff. Lola’s tongue strokes up and down your length, and once you’re fully hard, she wraps her lips around your [pc.cockHead " + kok + "] and starts to suck it, her eyes falling closed, her head slowly bobbing forward and back.");
		output("\n\nLola’s tongue strokes all over your [pc.cockHead " + kok + "], her lips held tight around the base of it. She lingers there for a long moment, then leans farther forward, taking more of your [pc.cock " + kok + "] between her lips. She slides your shaft deeper into her mouth, then pulls back to the head again, eyes still closed.");
		output("\n\nA soft moan slips out as Lola does her work, and you match it with one of your own. She keeps up a steady, constant suction on your cock, not too hard or too light, and keeps bobbing her head above your crotch, going just a little bit deeper with every stroke forward.");
		output("\n\nThe sensation is incredible. If you didn’t have plans to fuck her, you could easily just let her do her work until you came down her throat, and it seems like she wouldn’t mind that at all. But you do have other plans. You reach down and cup Lola’s bouncy tits, and give her nipples a little bit of a squeeze.");
		output("\n\nLola’s eyes pop open, and she looks up at you, mouth still full of your [pc.cock " + kok + "], a dizzy expression on her face. She smiles around your shaft, and slowly pulls herself back, leaving your cock warm and slick.");
		output("\n\n<i>“Sorry about that,”</i> Lola says, looking a little sheepish. <i>“I get really into that sometimes.”</i> She gives your [pc.cockHead " + kok + "] another lick. <i>“Especially with a dick this nice.”</i>");
		output("\n\nLola stands, then steps over to her bed and climbs onto it, and gets down on her hands and knees. She thrusts her ass out, making it wobble back and forth, and slowly spreads her thick legs. Her slick, pink-lipped pussy is gleaming wet, as are the sides of her thighs, making her look warm and inviting. She looks over her shoulder at you, and gives her ass another wiggle.");
		output("\n\n<i>“All ready for you,”</i> Lola says, then lifts her tail and giggles.");
		output("\n\nNo need to wait. You step over to the edge of the bed, then stand behind Lola, and drop your [pc.cock " + kok + "] right onto her ass. You give your wet length a few strokes between her cheeks, then point the head down toward her twat. Lola reaches back and holds her lips apart, clearly eager to have you inside.");
		output("\n\nYour [pc.cockHead " + kok + "] slides between Lola’s wet lips with ease, and she gasps as you ease into her, slowly pushing your dick all the way in. Lola leans her head back and moans, and her slick warmth wraps all around you, giving your length a good squeeze all the way to your [pc.sheath " + kok + "]. Her cushy butt squishes against your [pc.hips] as you hilt yourself in her, and you moan again.");
		
		pc.cockChange();
		
		output("\n\nLola’s legs open a little wider, and she pushes back against you as you start to move inside her. You take hold of her ass with both hands, getting a good grip on her jiggling flesh. She’s breathing harder already, and you start to thrust, slowly for now as her pussy tightens its grip on your cock. Lola plants both hands on her bed, clenching the sheets between her fingers, and shoves her ass harder against you, like she’s trying to get even more of your [pc.cock " + kok + "] into her.");
		output("\n\nIf that’s what she wants, that’s what you’ll give her. You pull back as much as you can, then tighten your grip on her butt and pound fast and deep into her, making her shout. After a few more thrusts, the bed starts to shake, and Lola spreads herself wider, her thighs shuddering as she opens herself up for you.");
		output("\n\n<i>“Harder!”</i> Lola cries out. <i>“I want to feel it... deeper....”</i>");
		output("\n\nYou plant your feet and look down at her, watching her rear shake as you pound your [pc.cock " + kok + "] deep into her pussy. Lola looks back at you, and her eyes are half-closed, her mouth hanging open, her face already red. The sound of your [pc.hips] slapping against her ass fills the room, along with her moans, and she lowers herself toward the bed, pressing her boobs against the rumpled sheets. You tilt your hips a little and thrust down into her, remembering what worked well at the pool, and she lets out a moan that turns into a scream.");
		output("\n\n<i>“There,”</i> Lola gasps.");
		output("\n\nAll at once, Lola pushes herself against you again and holds herself there, trapping your dong inside her, barely able to move. Her pussy clenches hard on your [pc.cock " + kok + "], and you squeeze her ass harder and give her some quick, short thrusts, hard as you can into her. Lola’s eyes squeeze shut, and she tilts her head back and screams, her orgasm loud enough to make the windows rattle.");
		output("\n\nYou slow down as Lola goes limp, her legs falling to either side, her twat’s grip on your [pc.cock " + kok + "] loosening. You pull out and pull back, your still-hard dick glistening with her juices. She settles down to the bed, her boobs and thighs spreading out over the sheets, breathing hard with her tongue lolling out of her mouth. <i>“Wow,”</i> she breathes, then looks up at you and laughs, her face all red. <i>“You’re still good for another one, right?”</i>");
		output("\n\nAs always. Lola rolls onto her side, her enormous ass a little red from the grip you had on it, then lifts one leg.");
		output("\n\n<i>“Can we do it like this?”</i> she asks, looking at you from over her shoulder.");
		output("\n\nYou could, but with her leg raised like that, she’s squishing her cheeks together hard, and that gives you another idea.");		
	}
	else
	{
		vag = rand(pc.vaginaTotal());
		output("You tell Lola you’d like to do it like you did in the pool, only with a little less floating this time. You grab your [pc.lowerUndergarment] and pull it back on, then activate the hardlight.");
		output("\n\nLola smiles at you, then steps closer and drops to her knees, making her ass and thighs stick out over her feet. Then, she puts her face even with your [pc.crotch]. <i>“Can’t do this in the pool,”</i> she says, then gives your hardlight a long lick, and slides her hand up your leg to stroke your [pc.vagina " + vag + "].");
		output("\n\nA shudder runs through you at the dual sensation of her soft fingers on your pussy lips and the pressure on your [pc.vagina " + vag + "] from her licking the hardlight, and you let out a groan. Lola’s tongue slides up and down the glowing length, and she wraps her lips around your hardlight and starts to suck it, her eyes falling closed, her head slowly bobbing forward and back.");
		output("\n\nLola’s tongue strokes all over your hardlight, her fingers slowly tracing across your [pc.vagina " + vag + "]. She lingers there for a long moment, then leans farther forward, taking more of the hardlight between her lips and sliding two fingers into your [pc.vagina " + vag + "]. She slides the shaft deeper into her mouth, then pulls back to the head again, eyes still closed.");
		output("\n\nA soft moan slips out as Lola does her work, and you match it with one of your own. Her work on the hardlight keeps up a steady, constant pleasurable pressure on your [pc.vagina " + vag + "], matching her fingering perfectly, and she keeps bobbing her head above your crotch, taking in the dildo just a little bit deeper with every stroke forward.");
		output("\n\nThe sensation is incredible. If you didn’t have plans to fuck her, you could easily just let her do her work until you came, and it seems like she wouldn’t mind that at all. But you do have other plans. You reach down and cup Lola’s bouncy tits, and give her nipples a little bit of a squeeze.");
		output("\n\nLola’s eyes pop open, and she looks up at you, mouth still full of your hardlight, a dizzy expression on her face. She smiles around the shaft, and slowly pulls herself back, leaving your dildo slick.");
		output("\n\n<i>“Sorry about that,”</i> Lola says, looking a little sheepish. <i>“I get really into that sometimes.”</i> She gives your hardlight another lick. <i>“And these things make my tongue feel all tingly.”</i>");
		output("\n\nLola stands, then steps over to her bed and climbs onto it, and gets down on her hands and knees. She thrusts her ass out, making it wobble back and forth, and slowly spreads her thick legs. Her slick, pink-lipped pussy is gleaming wet, as are the sides of her thighs, making her look warm and inviting. She looks over her shoulder at you, and gives her ass another wiggle.");
		output("\n\n<i>“All ready for you,”</i> Lola says, then lifts her tail and giggles.");
		output("\n\nNo need to wait. You step over to the edge of the bed, then stand behind Lola, and drop your hardlight right onto her ass. You give the dildo’s wet length a few strokes between her cheeks, then point the head down toward her twat. Lola reaches back and holds her lips apart, clearly eager to have it inside.");
		output("\n\nYour hardlight’s head slides between Lola’s wet lips with ease, and she gasps as you ease into her, slowly pushing the dildo all the way in. Lola leans her head back and moans, and you push into her as the sweet pressure on your [pc.vagina " + vag + "] grows, massaging you as the dildo slides all the way in. Her cushy butt squishes against your [pc.hips] as you hilt your hardlight in her, and you moan again.");
		output("\n\nLola’s legs open a little wider, and she pushes back against you as you start to move the dildo inside her. You take hold of her ass with both hands, getting a good grip on her jiggling flesh. She’s breathing harder already, and you thrust again, slowly, as her pussy holds the hardlight tighter and makes it a little harder to pull back out. Lola plants both hands on her bed, clenching the sheets between her fingers, and shoves her ass harder against you, like she’s trying to get even more of your dildo into her.");
		output("\n\nIf that’s what she wants, that’s what you’ll give her. You pull back as much as you can, then tighten your grip on her butt and pound fast and deep into her, making her shout. After a few more thrusts, the bed starts to shake, and Lola spreads herself wider, her thighs shuddering as she opens herself up for you.");
		output("\n\n<i>“Harder!”</i> Lola cries out. <i>“I want to feel it... deeper....”</i>");
		output("\n\nYou plant your feet and look down at her, watching her rear shake as you pound your hardlight deep into her pussy. Lola looks back at you, and her eyes are half-closed, her mouth hanging open, her face already red. The sound of your [pc.hips] slapping against her ass fills the room, along with her moans, and she lowers herself toward the bed, pressing her boobs against the rumpled sheets. You tilt your hips a little and thrust down into her, remembering what worked well at the pool, and she lets out a moan that turns into a scream.");
		output("\n\n<i>“There,”</i> Lola gasps.");
		output("\n\nAll at once, Lola pushes herself against you again and holds herself there, trapping your dildo inside her, barely able to move. The pressure against your [pc.vagina " + vag + "] grows, rubbing you even more. You squeeze her ass harder and give her some quick, short thrusts, hard as you can into her. Lola’s eyes squeeze shut, and she tilts her head back and screams, her orgasm loud enough to make the windows rattle.");
		output("\n\nYou slow down as Lola goes limp, her legs falling to either side, her twat’s grip on your hardlight loosening. You pull out and pull back, your still-hard dildo glistening with her juices. She settles down to the bed, her boobs and thighs spreading out over the sheets, breathing hard with her tongue lolling out of her mouth. <i>“Wow,”</i> she breathes, then looks up at you and laughs, her face all red. <i>“You’re still good for another one, right?”</i>");
		output("\n\nAs always. Lola rolls onto her side, her enormous ass a little red from the grip you had on it, then lifts one leg.");
		output("\n\n<i>“Can we do it like this?”</i> she asks, looking at you from over her shoulder.");
		output("\n\nYou could, but with her leg raised like that, she’s squishing her cheeks together hard, and that gives you another idea.");
	}
	
	processTime(10 + rand(10));
	clearMenu();
	var strapon:Boolean = false;
	if (pc.hasVagina()) strapon = true;
	addButton(0, "Hotdog", penisRouter, [tentongymLolaLikeBeforeHotdog, chars["LOLA"].vaginalCapacity(0), strapon, 0]);
	addButton(1, "From Behind", penisRouter, [tentongymLolaLikeBeforeFromBehind, chars["LOLA"].vaginalCapacity(0), strapon, 0]);
	
}

public function tentongymLolaLikeBeforeHotdog(kok:int=0):void
{
	clearOutput();
	tentongymShowLola(true);
	
	var vag:int = -1;
	
	if (kok >= 0)
	{
		output("You slide onto the bed behind her, and rub your [pc.cock " + kok + "] all along Lola’s slippery pussy. You’re already good and wet from the fucking, but with what you have in mind, you want as much lube as you can get.");
		output("\n\nLola makes a soft moan as you rub yourself on her, and grinds her ass back against your [pc.hips]. After a moment, she looks back over her shoulder at you. <i>“You’re going to put it in, right?”</i>");
		output("\n\nYou tell her where you’re going to put it, and Lola giggles. She reaches back and lifts up half of her ass, hefting the thick globe. <i>“We can definitely do this again,”</i> she says.");
		output("\n\nAfter another few long strokes along Lola’s snatch, you pull back and slip your [pc.cock " + kok + "] between Lola’s cheeks. She drops the half-globe she holds as soon as your dong’s in place, wrapping you in soft, warm flesh.");
		
		if (pc.cocks[kok].girth() >= 5) output("\n\nEven Lola’s ass can’t wrap more than halfway around your [pc.cock " + kok + "]’s immense girth, but the pressure on your enormous shaft is enough to make you groan.");
		else if (pc.cocks[kok].girth() >= 3) output("\n\nYour [pc.cock " + kok + "] is wide enough that Lola’s ass doesn’t quite fit all the way around it, but the pressure on your thick shaft is enough to make you groan.");
		else output("\n\nLola has more than enough ass to completely fit your [pc.cock " + kok + "] between her cheeks, and it disappears into her ass, the sudden pressure making you groan.");
		output(" Your [pc.cock " + kok + "] feels like it’s trapped in a smooth, slick vise, the pressure building as Lola clenches her butt around your length, squeezing you right down to your [pc.base].");
		
		output("\n\nLola grins back at you, then starts pumping her ass against you again, her tanlined skin slapping against your [pc.skinFurScalesNoun]. She releases her hold on her butt for a second, then grabs your hand and pulls it around to her crotch, pressing your fingers to her dripping cunt. You slip two fingers into her, and she moans again.");
		output("\n\n<i>“More,”</i> Lola gasps. <i>“If you’re not fucking me... more fingers...”</i>.");
		output("\n\nYou push a third finger into her, and curl it to rub on her little clit, and Lola cries out. She slaps her hand back down on her ass, trapping your [pc.cock " + kok + "] harder between her cheeks, and you keep on thrusting. The friction from her ass on your [pc.cock " + kok + "] is amazing, and you can already feel your orgasm starting to build. You thrust harder, and dig your fingers deeper into her pussy, flicking her clit faster and faster.");
		output("\n\n<i>“I’m,”</i> Lola gasps, <i>“I’m gonna–”</i>");
		output("\n\nYou thrust as much of your [pc.cock " + kok + "] as you can between Lola’s cheeks, and that last hard squeeze along your entire length is enough to drive you over the edge. She screams again as the two of you come together, [pc.cum] squirting up from between her cheeks to splatter across her back and your [pc.chest].");
		if (pc.cumQ() >= 1000) output(" You shoot off stream after stream over the two of you, and soon her back and your [pc.chest] are painted [pc.cumColor] with your seed.");
		output(" You keep on thrusting and fingering, slowing it a little with every stroke as Lola’s leg drops.");
		
		output("\n\n<i>“Moooooo....”</i> Lola moans, and rolls back against you, breathing hard. <i>“Oh, wow, I needed that...”</i>.");
		output("\n\n[pc.Cum] drips from the tip of your [pc.cock " + kok + "] as you slowly pull it free from her butt, and she reaches down and wipes your fluid from it, then licks off her fingers. From the smile she gives you, it’s clear she likes the taste.");
		if (pc.cumQ() >= 1000) output(" And she’s got plenty to lick off of you if she wants more.");		
		output(" It takes her a moment, but Lola turns over and leans up on one arm.");
		
		output("\n\n<i>“Let’s clean up the bed, then we can get a shower,”</i> Lola says, then giggles. <i>“I like that we don’t get all sticky in the pool, but that was worth it.”</i> You nod, and the two of you head to her shower.");
		output("\n\nAfter scrubbing each other down");
		if (pc.cumQ() >= 1000) output(" and Lola scrubbing your [pc.chest] free of all your [pc.cum]");		
		output(", you and Lola dry each other off, and she gives you a look that’s strangely shy for you two having just fucked.");
		
		output("\n\n<i>“If you have to go, that’s okay,”</i> Lola says, and brushes a lock of wet hair out of her eyes. <i>“But if you want to stay here and cuddle, I’d like that too.”</i>");
		output("\n\nWhat do you say?");			
	}
	else
	{
		vag = rand(pc.vaginaTotal());
		output("You slide onto the bed behind her, and rub your hardlight all along Lola’s slippery pussy. Your dildo is already good and wet from the fucking, but with what you have in mind, you want as much lube as you can get.");
		output("\n\nLola makes a soft moan as you rub the hardlight on her, and grinds her ass back against your [pc.hips]. After a moment, she looks back over her shoulder at you. <i>“You’re going to put it in, right?”</i>");
		output("\n\nYou tell her where you’re going to put it, and Lola giggles. She reaches back and lifts up half of her ass, hefting the thick globe. <i>“We can definitely do this again,”</i> she says.");
		output("\n\nAfter another few long strokes along Lola’s snatch, you pull back and slip your dildo between Lola’s cheeks. She drops the half-globe she holds as soon as the fake dick’s in place, wrapping it in soft, warm flesh.");
		output("\n\nLola has more than enough ass to completely fit your hardlight between her cheeks, and it disappears into her ass, leading to a sudden pressure on your [pc.vagina " + vag + "] that makes you groan. You run a hand down Lola’s round, smooth ass, and the pressure builds as Lola clenches her butt around your dildo, squeezing it right down to the base.");
		output("\n\nLola grins back at you, then starts pumping her ass against you again, her tanlined skin slapping against your [pc.skinFurScalesNoun]. She releases her hold on her butt for a second, then grabs your hand and pulls it around to her crotch, pressing your fingers to her dripping cunt. You slip two fingers into her, and she moans again.");
		output("\n\n<i>“More,”</i> Lola gasps. <i>“If you’re not fucking me... more fingers...”</i>.");
		output("\n\nYou push a third finger into her, and curl it to rub on her little clit, and Lola cries out. She slaps her hand back down on her ass, trapping the hardlight harder between her cheeks, and you keep on thrusting. The friction from the hotdogging on your [pc.vagina " + vag + "] is amazing, and you can already feel your orgasm starting to build. You thrust harder, and dig your fingers deeper into her pussy, flicking her clit faster and faster.");
		output("\n\n<i>“I’m,”</i> Lola gasps, <i>“I’m gonna–”</i>");
		output("\n\nYou pump the entire hardlight between Lola’s cheeks, hard as you can, and that last rush of pressure against your [pc.vagina " + vag + "] is enough to drive you over the edge. She screams again as the two of you come together, both of you shaking hard as you ride out your orgasms.");
		if (pc.girlCumQ() >= 1000) output(" Stream after stream of [pc.girlcum] splatters out of [pc.eachVagina], drenching Lola’s thick thighs and your [pc.thighs] with sticky fluid.");
		output(" You keep on thrusting and fingering, slowing it a little with every stroke as Lola’s leg drops.");
		
		output("\n\n<i>“Moooooo....”</i> Lola moans, and rolls back against you, breathing hard. <i>“Oh, wow, I needed that...”</i>.");
		output("\n\nYour hardlight is covered in Lola’s slippery girlcum as you slowly pull it out of her, and she reaches down and wipes her fluid from the tip, then licks off her fingers. From the smile she gives you, it’s clear she likes the taste. It takes her a moment, but Lola turns over and leans up on one arm.");
		output("\n\n<i>“Let’s clean up the bed, then we can get a shower,”</i> Lola says, then giggles. <i>“I like that we don’t get all sticky in the pool, but that was worth it.”</i> You nod, and the two of you head to her shower.");
		output("\n\nAfter scrubbing each other down");
		if (pc.girlCumQ() >= 1000) output(" and making sure to clean your [pc.girlcum] off of her legs and yours");		
		output(", you and Lola dry each other off, and she gives you a look that’s strangely shy for you two having just fucked.");
		
		output("\n\n<i>“If you have to go, that’s okay,”</i> Lola says, and brushes a lock of wet hair out of her eyes. <i>“But if you want to stay here and cuddle, I’d like that too.”</i>");
		output("\n\nWhat do you say?");	
	}
	
	processTime(10 + rand(10));
	pc.orgasm();
	pc.shower();	
	processTime(20);
	
	IncrementFlag("SEXED_LOLA");
	IncrementFlag("TTGYM_LOLA_HOTDOG");	
	
	clearMenu();
	addButton(0, "Cuddles", tentongymLolaCuddles, undefined);
	addButton(1, "No Cuddles", tentongymLolaNoCuddles, undefined);
	
}

public function tentongymLolaLikeBeforeFromBehind(kok:int=0):void
{
	clearOutput();
	tentongymShowLola(true);
	
	var vag:int = -1;
	
	if (kok >= 0)
	{
		output("With an ass like hers, it might be a challenge, but you’re already up for it. You slide onto the bed behind her, and slap your [pc.cock " + kok + "] between her cheeks again, making her laugh. Then, you angle your length down beneath her ass, and she reaches down to guide your [pc.cockHead " + kok + "] back into her.");
		output("\n\nLola’s slick depths pull you inside again, and she feels tighter from this angle. She starts gasping right away, and her ass presses hard against you as you push your full length into her. You take hold of her jiggly thigh and pound in deep, and she turns herself halfway back to look at you, her eyes half-closed, her boobs shaking with every thrust.");
		output("\n\nThe slapping sound of Lola’s ass against you only grows louder in this position, and you thrust in as deep as you can, your [pc.cock " + kok + "] pounding into Lola’s slippery snatch. After a moment, Lola hooks her leg back over your [pc.thigh], then wraps her arm back around toward you, pressing her hand onto the back of your head. You lean forward, wrapping an arm around her narrow waist, pinning her giant ass between the two of you.");
		output("\n\nLola’s breaths come faster and faster, and she lifts the leg she has hooked over you up higher, pointing her foot toward the ceiling. You pound as deep into her as you can, and feel your orgasm building at the base of your [pc.cock " + kok + "], driven on by Lola’s pussy squeezing your length over and over again. Lola cries out again, and you make yourself hold on, determined not to come before she does.");
		output("\n\nShe grabs your hand and holds it to one of her swinging boobs, and you take hold, rolling her nipple between two fingers as you keep thrusting. Lola cries out, and she pushes her ass harder against you once more, moaning with every breath.");
		output("\n\n<i>“I’m,”</i> Lola gasps, <i>“I’m gonna–”</i>");
		output("\n\nYou slam your [pc.cock " + kok + "] deep into Lola, hard as you can, and her twat’s sudden squeeze along your entire length is enough to drive you over the edge. She screams again as the two of you come together, [pc.cum] squirting into her depths.");
		if (pc.cumQ() >= 1000) output(" You shoot off stream after stream into her, and soon her belly’s grown as round as her ass, swollen with your seed.");
		output(" You keep on thrusting, slowing it a little with every stroke as Lola’s leg drops.");
		
		output("\n\n<i>“Moooooo....”</i> Lola moans, and rolls back against you, breathing hard. <i>“Oh, wow, I needed that...”</i>.");
		output("\n\n[pc.Cum] drips from the tip of your [pc.cock " + kok + "] as you slowly pull it out of her, and she reaches down and wipes your fluid from it, then licks off her fingers. From the smile she gives you, it’s clear she likes the taste.");
		if (pc.cumQ() >= 1000) output(" And she’s got a whole bellyful of it if she wants more.");
		output(" It takes her a moment, but Lola turns over and leans up on one arm.");
		
		output("\n\n<i>“We can get a shower if you want,”</i> Lola says, then giggles. <i>“I like that we don’t get all sweaty in the pool, but that was worth it.”</i> You nod, and the two of you head to her shower.");
		output("\n\nAfter scrubbing each other down");
		if (pc.cumQ() >= 1000) output(" and Lola letting all the [pc.cum] you shot into her spill out");		
		output(", you and Lola dry each other off, and she gives you a look that’s strangely shy for you two having just fucked.");
		
		output("\n\n<i>“If you have to go, that’s okay,”</i> Lola says, and brushes a lock of wet hair out of her eyes. <i>“But if you want to stay here and cuddle, I’d like that too.”</i>");
		
		output("\n\nWhat do you say?");	
		
		processTime(10 + rand(10));
		chars["LOLA"].loadInCunt(pc,0);
	}
	else
	{
		vag = rand(pc.vaginaTotal());
		output("With an ass like hers, it might be a challenge, but you’re already up for it. You slide onto the bed behind her, and slap your sticky hardlight between her cheeks again, making her laugh. Then, you angle the dildo’s length down beneath her ass, and she reaches down to guide the hardlight’s head back into her.");
		output("\n\nLola’s slick depths pull the dildo inside again, and it’s a harder push from this angle. She starts gasping right away, and her ass presses hard against you as you slam the full length into her. You take hold of her jiggly thigh and pound in deep, and she turns herself halfway back to look at you, her eyes half-closed, her boobs shaking with every thrust.");
		output("\n\nThe slapping sound of Lola’s ass against you only grows louder in this position, and you thrust in as deep as you can, your hardlight pounding into Lola’s slippery snatch. After a moment, Lola hooks her leg back over your [pc.thigh], then wraps her arm back around toward you, pressing her hand onto the back of your head. You lean forward, wrapping an arm around her narrow waist, pinning her giant ass between the two of you.");
		output("\n\nLola’s breaths come faster and faster, and she lifts the leg she has hooked over you up higher, pointing her foot toward the ceiling. You pound as deep into her as you can, and feel your orgasm building within your [pc.vagina " + vag + "], driven on by Lola’s pussy and ass making the hardlight rub you over and over again. Lola cries out again, and you make yourself hold on, determined not to come before she does.");
		output("\n\nShe grabs your hand and holds it to one of her swinging boobs, and you take hold, rolling her nipple between two fingers as you keep thrusting. Lola cries out, and she pushes her ass harder against you once more, moaning with every breath.");
		output("\n\n<i>“I’m,”</i> Lola gasps, <i>“I’m gonna–”</i>");
		output("\n\nYou slam your hardlight deep into Lola, hard as you can, and the sudden increase in pressure is enough to drive you over the edge. She screams again as the two of you come together, [pc.girlcum] flowing out around your [pc.lowerUndergarment].");
		if (pc.girlCumQ() >= 1000) output(" Stream after stream of [pc.girlcum] gushes from your [pc.vagina " + vag + "], splattering over Lola’s thighs and ass, covering your [pc.thighs] as well.");
		output(" You keep on thrusting, slowing it a little with every stroke as Lola’s leg drops.");
		
		output("\n\n<i>“Moooooo....”</i> Lola moans, and rolls back against you, breathing hard. <i>“Oh, wow, I needed that...”</i>.");
		output("\n\nYour hardlight is covered in Lola’s sticky girlcum as you slowly pull it out of her, and she reaches down and wipes her fluid from the tip, then licks off her fingers. From the smile she gives you, it’s clear she likes the taste. It takes her a moment, but Lola turns over and leans up on one arm.");
		output("\n\n<i>“We can get a shower if you want,”</i> Lola says, then giggles. <i>“I like that we don’t get all sweaty in the pool, but that was worth it.”</i> You nod, and the two of you head to her shower.");
		output("\n\nAfter scrubbing each other down");
		if (pc.girlCumQ() >= 1000) output(" and making sure to clean your [pc.girlcum] off of her legs and yours");		
		output(", you and Lola dry each other off, and she gives you a look that’s strangely shy for you two having just fucked.");
		
		output("\n\n<i>“If you have to go, that’s okay,”</i> Lola says, and brushes a lock of wet hair out of her eyes. <i>“But if you want to stay here and cuddle, I’d like that too.”</i>");
		output("\n\nWhat do you say?");	
		
		processTime(10 + rand(10));
	}
	
	pc.orgasm();
	pc.shower();	
	processTime(20);
	
	IncrementFlag("SEXED_LOLA");
	IncrementFlag("TTGYM_LOLA_PUSSY");
	
	clearMenu();
	addButton(0, "Cuddles", tentongymLolaCuddles, undefined);
	addButton(1, "No Cuddles", tentongymLolaNoCuddles, undefined);
	
}

public function tentongymLolaCuddles():void
{
	clearOutput();
	tentongymShowLola(true);
	
	output("You tell Lola that yes, you’d like to cuddle. She says <i>“Oh, yay!”</i>, and gives you a huge smile as she leads you back to her bed. The covers are still all messed up, but she lays down on top of them and pats the bed next to her. The bed’s small enough that, if you’re going to share it with her, you’ll have to get close.");
	output("\n\nYou lie down next to her, and she turns on her side, the whole bed shaking as she drops her thighs and ass down hard. She curls herself up a little, a clear invitation for you to be the big spoon if you’ve ever seen one, so you turn onto your side and curl up against her. Your [pc.thighs] rub up against her soft thighs as she leans back just a little, her massive booty pressing against your [pc.crotch] again.");
	output("\n\nLola wiggles against you as she adjusts herself, her tan-lined back resting on your [pc.chest], and she lets out a long sigh. You prop up your head with one arm, then drape the other over her, letting it hang over her narrow waist for a moment before sliding it down to rest atop her thigh.");
	output("\n\nShe giggles. <i>“You good, [pc.name]?”</i> You tell her you are, and she snuggles further back into you, making sure there’s no space between the two of you. She’s soft and warm, and laying there with her feels calm and comforting. She leans her head back, and rests it against your shoulder.");
	output("\n\n<i>“Don’t get me wrong,”</i> Lola says, sounding sleepy. <i>“I like sex as much as anyone else. And you’re really good at it,”</i> she adds with another giggle. <i>“But sometimes it’s nice to just be held for a little bit afterward.”</i> She yawns. <i>“It kind of makes everything better.”</i>");
	output("\n\nLaying there with her against you, it’s hard to argue with that. You gently stroke one hand along the side of her thick thigh, and she makes a quiet sound, clearly enjoying it. After a moment, and because there’s no way you’d do otherwise, you rub your hand on her ass, slowly circling your palm over and around her giant cheek. Lola sags against you, and after a few minutes of that, starts breathing deeply.");
	output("\n\nShe’s sound asleep. You give her butt a few more strokes, then wrap your arm around her middle again, and close your eyes. Everything is soft and comfortable, and it’s easy for you to just drift off.");
	output("\n\nYou wake a few hours later, feeling rested and refreshed. Lola’s stirring, her eyes still sleepy. When she sees that you’re awake, she turns over and hugs you, rubbing her head against your [pc.chest]. You give her ass another good squeeze, and hold it until the two of you separate.");
	output("\n\n<i>“Thanks, [pc.name],”</i> Lola murmurs. She’s blushing a little. <i>“Come by again sometime, so we can do this again? All of this?”</i>");
	output("\n\nYou tell her that you will, and that you hope to run into her again soon. The two of you slowly get up, and you gather your [pc.gear] and bid her goodbye.");
	output("\n\nYou head out of Lola’s apartment, back to the streets of New Texas.");
	
	IncrementFlag("TTGYM_LOLA_CUDDLE");
	
	//rest plus walk back to city proper
	processTime(210 + rand(15));
	restHeal()
	clearMenu();
	addButton(0, "Next", move, "503");	
	
}
public function tentongymLolaNoCuddles():void
{
	clearOutput();
	tentongymShowLola(true);
	
	if (pc.isAss())
	{
		output("You tell Lola you don’t do cuddles, who the fuck does she think you are?");
		output("\n\nShe just sort of shrugs, and says, <i>“Okay. I’ll see you some other time, [pc.name]. You can let yourself out.”</i>");
	}
	else if (pc.isNice())
	{
		output("You tell Lola that sounds really nice, but unfortunately, you have to go.");
		output("\n\nShe gives you a sweet smile, and pulls you into a quick hug, nudging your hands down to grab her butt. <i>“Okay, [pc.name]. Thanks for coming over, I had a really good time.”</i>");
	}
	else
	{
		output("You tell Lola you’d love to stick around and cuddle, but you’ve got a planet rush to do, a ship to maintain, your cousin to outwit... frankly, you’re swamped.");
		output("\n\nShe giggles again, and pulls you into a quick hug. You take hold of her booty and squeeze her tight against you. <i>“Okay, [pc.name]. Thanks for coming over, I had a really good time.”</i>");
	}
	output("\n\nYou head out of Lola’s apartment, back to the streets of New Texas.");
	
	//have to walk back to city proper
	processTime(35 + rand(10));
	clearMenu();
	addButton(0, "Next", move, "503");	
	
}
public function tentongymLolaInTheButt(kok:int=0):void
{
	clearOutput();
	tentongymShowLola(true);
	
	var vag:int = -1;
	
	if (kok >= 0)
	{
		output("You tell Lola you’d like to put it in her butt. She gives you a smile and a giggle, then says, <i>“Going to need some lube for this one,”</i> and ducks into her bathroom. She returns a moment later with a bottle that has a happy cowgirl’s face on the label, and kneels in front of you, then pops open the cap.");
		output("\n\nLola drizzles a healthy amount of lube onto her hand, then drops the bottle and rubs her palms together. She takes your [pc.cock " + kok + "] between her palms, sliding the slippery stuff from head to base, making sure you’re completely covered in lube. Your [pc.cock " + kok + "] stiffens and rises between her hands as she works, and she keeps on stroking you even once you’re fully lubed, staring at your dick the entire time.");
		output("\n\nIt feels damn good, but her hands aren’t what you’re here for. You reach down to her swaying boobs and give her nipples a gentle tweak, just enough to make her yelp a little. She blinks up at you, then laughs. <i>“What?”</i> she asks. <i>“Lubing you up is fun, okay?”</i>");
		output("\n\nLola gives you a few more good strokes, just to make sure, then stands and steps over to her bed. She lays down on top of it, slides a little so her giant ass is right at the edge, then swings her thick thighs open and grabs hold of her knees, pulling herself open wide. Her pink-lipped pussy is gleaming wet, her girlcum dripping just a little to the dark hole beneath, her cow-tail hanging down below.");
		output("\n\nIt doesn’t look like Lola does anal a whole lot, but then again, her pussy looks small and tight and it fits you in easily. You walk over to the bed, then lean in and rub your [pc.cock " + kok + "] across her twat, adding her fluids to the lube and making her shudder.");
		output("\n\nAfter only a few strokes, Lola’s nipples are standing up hard, and she says, <i>“Come on... stop teasing me, put it in!”</i>");
		output("\n\nYou drag your [pc.cock " + kok + "] down her lips one last time, just to draw it out, then pull back and aim your [pc.cockHead " + kok + "] at her asshole. You press the head against her rear entrance, then slowly push, feeling her give way around your dick.");
		output("\n\nLola leans her head back and moans as your [pc.cockHead " + kok + "] slides into her ass, and your cock’s wrapped in a hot, tight tunnel, the lube helping you slip right in. You keep it slow, but there’s almost no resistance, and Lola starts to gasp as you push your dick all the way in.");
		
		pc.cockChange();
		
		output("\n\nAfter a single long thrust, you hilt yourself in Lola’s ass. She’s breathing hard, biting at her lower lip, her face and boobs both flushed red. Both her hands are shaking, her grip on her thick thighs threatening to come loose. You pull your [pc.cock " + kok + "] out, slowly again, until just the head is still in her.");
		output("\n\nBefore you can start to push in again, Lola gasps, <i>“No, more,”</i> and lets go of her legs. Her calves wrap around your back, and she pulls you in again, your [pc.cock " + kok + "] sliding all the way back into her asshole as she cries out. Your [pc.hips] smack into Lola’s giant butt as she pulls you in tight, her legs crossing at the small of your back, your [pc.cock " + kok + "] trapped deep in her ass.");
		output("\n\nYou have just enough room to thrust, so you start pumping your dong in and out of her asshole, making her cry out every time. Lola’s boobs shake and wobble as you drive yourself into her, her legs holding tight around you, the red tuft of hair between her legs slick with her fluids. You lean forward over her, shoving your dick in deeper, and Lola reaches up to grab your shoulder, her fingers digging into your [pc.skinFurScales]. She wraps her other hand into her tumbled bedsheets, clenching her fist into the cloth.");
		output("\n\nLola’s ass squeezes hard around your [pc.cock " + kok + "], and you shove down on the rising sensation, determined to ride this out until she comes. It doesn’t look like she’s far off, either, her gasps growing louder with every thrust. You take hold of her hips and pound harder, slamming her ass into her bed, and Lola arches her back, her mouth hanging open wide, her cow-ears flopping against her sheets.");
		output("\n\n<i>“Gonna,”</i> Lola gasps, <i>“I’m gonna...”</i>");
		output("\n\nHer voice fails her for a second, and then her asshole squeezes your [pc.cock " + kok + "] hard enough to hold it in place as Lola screams, her orgasm making her entire body shake. You hold on as hard as you can, and endure her legs squeezing tight around your [pc.hips] as you ride out Lola’s shaking.");
		output("\n\nAfter a moment, Lola sags against her bed, breathing hard. She moans as you slide your still-hard cock out of her, leaving her asshole red and slick");
		if (pc.cocks[kok].girth() >= 2) output(" and gaping from your girth");
		output(". She stares up at you, looking dizzy and tired, then laughs.");		
		
		output("\n\n<i>“So good,”</i> Lola drawls, then lets out a quiet <i>“Moooo...”</i>. She takes a deep breath, then says, <i>“I... I want another one. Can I get on top this time?”</i> If she wasn’t red-faced already, you think she’d be blushing. <i>“I don’t usually like being on top, but it feels really good in my ass like that.”</i>");
	}
	else
	{
		vag = rand(pc.vaginaTotal());
		output("You tell Lola you’d like to put it in her butt. She gives you a smile and a giggle, then says, <i>“Going to need some lube for this one,”</i> and ducks into her bathroom. She returns a moment later with a bottle that has a happy cowgirl’s face on the label, and kneels in front of you, then pops open the cap.");
		output("\n\nLola drizzles a healthy amount of lube onto her hand, then drops the bottle and rubs her palms together. She takes your hardlight between her palms, sliding the slippery stuff from head to base, making sure the dildo’s completely covered in lube. Her constant pushing on the hardlight makes it rub against your [pc.vagina " + vag + "] as she works, and she keeps on stroking it even once it’s fully lubed, staring at the dildo the entire time.");
		output("\n\nIt feels damn good, but her hands aren’t what you’re here for. You reach down to her swaying boobs and give her nipples a gentle tweak, just enough to make her yelp a little. She blinks up at you, then laughs. <i>“What?”</i> she asks. <i>“Lubing this up is fun, okay?”</i>");
		output("\n\nLola gives the dildo a few more good strokes, just to make sure, then stands and steps over to her bed. She lays down on top of it, slides a little so her giant ass is right at the edge, then swings her thick thighs open and grabs hold of her knees, pulling herself open wide. Her pink-lipped pussy is gleaming wet, her girlcum dripping just a little to the dark hole beneath, her cow-tail hanging down below.");
		output("\n\nIt doesn’t look like Lola does anal a whole lot, but then again, her pussy looks small and tight and it fits your dildo in easily. You walk over to the bed, then lean in and rub your hardlight across her twat, adding her fluids to the lube and making her shudder.");
		output("\n\nAfter only a few strokes, Lola’s nipples are standing up hard, and she says, <i>“Come on... stop teasing me, put it in!”</i>");
		output("\n\nYou drag your dildo down her lips one last time, just to draw it out, then pull back and aim the hardlight’s head at her asshole. You press the head against her rear entrance, then slowly push, the pressure building on your [pc.vagina " + vag + "] as her asshole gives way around your dildo.");
		output("\n\nLola leans her head back and moans as your hardlight slides into her ass, the lube helping it slip right in. You keep it slow, but there’s almost no resistance, and Lola starts to gasp as you push your dildo all the way in.");
		output("\n\nAfter a single long thrust, you hilt the hardlight in Lola’s ass. She’s breathing hard, biting at her lower lip, her face and boobs both flushed red. Both her hands are shaking, her grip on her thick thighs threatening to come loose. You pull your dildo out, slowly again, until just the head is still in her.");
		output("\n\nBefore you can start to push in again, Lola gasps, <i>“No, more,”</i> and lets go of her legs. Her calves wrap around your back, and she pulls you in again, your hardlight sliding all the way back into her asshole as she cries out. The sudden pressure on your [pc.vagina " + vag + "] makes you gasp as well, and your head spins a little at the sensation. Your [pc.hips] smack into Lola’s giant butt as she pulls you in tight, her legs crossing at the small of your back, your dildo trapped deep in her ass.");
		output("\n\nYou have just enough room to thrust, so you start pumping your hardlight in and out of her asshole, making her cry out every time. Lola’s boobs shake and wobble as you drive into her, her legs holding tight around you, the red tuft of hair between her legs slick with her fluids. You lean forward over her, shoving your dildo in deeper, and Lola reaches up to grab your shoulder, her fingers digging into your [pc.skinFurScales]. She wraps her other hand into her tumbled bedsheets, clenching her fist into the cloth.");
		output("\n\nLola’s ass squeezes hard around your hardlight, making it rub harder against your [pc.vagina " + vag + "], and you shove down on the rising sensation, determined to ride this out until she comes. It doesn’t look like she’s far off, either, her gasps growing louder with every thrust. You take hold of her hips and pound harder, slamming her ass into her bed, and Lola arches her back, her mouth hanging open wide, her cow-ears flopping against her sheets.");
		output("\n\n<i>“Gonna,”</i> Lola gasps, <i>“I’m gonna...”</i>");
		output("\n\nHer voice fails her for a second, and then her asshole squeezes your hardlight hard enough to hold it in place as Lola screams, her orgasm making her entire body shake. You hold on as hard as you can, and endure her legs squeezing tight around your [pc.hips] as you ride out Lola’s shaking.");
		output("\n\nAfter a moment, Lola sags against her bed, breathing hard. She moans as you slide your still-hard dildo out of her, leaving her asshole red and slick. She stares up at you, looking dizzy and tired, then laughs.");
		output("\n\n<i>“So good,”</i> Lola drawls, then lets out a quiet <i>“Moooo...”</i>. She takes a deep breath, then says, <i>“I... I want another one. Can I get on top this time?”</i> If she wasn’t red-faced already, you think she’d be blushing. <i>“I don’t usually like being on top, but it feels really good in my ass like that.”</i>");
	
	}
	
	processTime(10 + rand(10));
	clearMenu();
	var strapon:Boolean = false;
	if (pc.hasVagina()) strapon = true;
	addButton(0, "On Top", penisRouter, [tentongymLolaInTheButtOnTop, chars["LOLA"].analCapacity(), strapon, 0],"On Top","Let Lola take you for a ride.");
	addButton(1, "From Behind", penisRouter, [tentongymLolaInTheButtFromBehind, chars["LOLA"].analCapacity(), strapon, 0],"From Behind","Turn Lola over and go at her from behind.");
}
public function tentongymLolaInTheButtOnTop(kok:int=0):void
{
	clearOutput();
	tentongymShowLola(true);
	
	var vag:int = -1;
	
	if (kok >= 0)
	{
		output("You sit down on the bed next to her, and tell Lola she can ride you as much as she wants. She gives you a dizzy smile, then slowly gets to her feet, moaning a little.");
		output("\n\n<i>“I’ll be walking funny tomorrow,”</i> she says, then giggles. <i>“Let’s see if we can make that last two days.”</i>");
		output("\n\nShe motions for you to sit at the edge of the bed, then turns her enormous ass toward you, and steps backward until your [pc.cock " + kok + "] is planted between her cheeks. Then, with a quick heft of her giant booty, Lola spreads herself and plants her asshole right on your [pc.cockhead " + kok + "].");
		output("\n\n<i>“Ooh!”</i> Lola cries, and eases herself down onto your cock, sliding your length up into her in one long, smooth stroke. The full weight of her ass and thighs slams down hard onto you, and your lap is full of her butt, her legs crushing your [pc.legs] beneath them.");
		output("\n\nShe eases herself back onto you, breathing hard, and you realize that her feet have left the floor. As short as she is, when Lola sits on your lap on the bed, her legs dangle down, meaning your [pc.cock " + kok + "] is all that’s holding her up. She starts grinding her ass against you, her cow-tail winding up and back to rest against your neck, her head tilted back as she moans.");
		output("\n\nYou push back against her, shoving your dick deeper and deeper into her ass, working to get in as much as you can. The hot, slick tunnel around your [pc.cock " + kok + "] only grows tighter as Lola bounces on top of you, her giant ass slapping hard against your [pc.skinFurScales].");
		output("\n\nLola cries out, and for a moment you think she’s going to come again, but she leans back against your [pc.chest] and plants her hands on the bed to either side of you, giving herself leverage to bounce on your [pc.cock " + kok + "]. Her ass smashes harder into your [pc.hips], driving you down into the bed as she hammers your dick even deeper up her asshole.");
		output("\n\nYou grab hold of her hips and ass and push against her, slapping her thick thighs and bulging ass as she bounces, making her yell again. She clenches down on your [pc.cock " + kok + "], gasping with every breath and thrust.");
		output("\n\nIt’s not going to be much longer before she comes, and you’re not far behind. The utter pounding your [pc.cock " + kok + "] is taking, buried deep within her ass and constantly getting hammered in harder, has you about ready to blow your load. You give Lola’s ass another big squeeze and hold on tight, then hear her breath catch as her asshole clenches down on you one last time.");
		output("\n\nLola screams out as she comes, her legs and ass quivering, and your [pc.cock " + kok + "] fires off jet after jet of [pc.cum] as your orgasm hits at the same time.");
		if (pc.cumQ() >= 1000) output(" The sheer volume of [pc.cum] you pour into her makes her belly bulge, rounding her out as you fill her up.");
		output(" You groan as the two of you shake against each other, and you hold tight to her as the sensation fades, then fall back onto the bed, tired and slowly going limp within her.");
		output("\n\nShe falls backwards against you, and lays there panting for a moment, then rolls off and lets your dick fall out of her ass. It takes her a moment before she can sit up, and she looks at you, dazed and happy. <i>“That was amazing,”</i> she says, sounding out of breath. <i>“Thanks for letting me go on top.”</i>");
		output("\n\nAfter a moment, Lola slowly gets to her feet, and says, <i>“I think we both need a shower.”</i> She holds out one hand to you, though as tired as you both are, she’s not much help in getting you to your feet.");
		output("\n\nThe two of you take a rather wobbly shower together, and you give her big, round ass a thorough cleaning");
		if (pc.cumQ() >= 1000) output(", making sure all the [pc.cum] you spewed into her gets washed out");
		output(". Once you’re both done and have dried off, Lola gives you a shy kind of look.");
		
		output("\n\n<i>“If you have to go, that’s okay,”</i> Lola says, and brushes a lock of wet hair out of her eyes. <i>“But if you want to stay here and cuddle, I’d like that too.”</i>");
		output("\n\nWhat do you say?");			
		
		processTime(10 + rand(10));
		
		chars["LOLA"].loadInAss(pc);
	}
	else
	{
		vag = rand(pc.vaginaTotal());
		output("You sit down on the bed next to her, and tell Lola she can ride you as much as she wants. She gives you a dizzy smile, then slowly gets to her feet, moaning a little.");
		output("\n\n<i>“I’ll be walking funny tomorrow,”</i> she says, then giggles. <i>“Let’s see if we can make that last two days.”</i>");
		output("\n\nShe motions for you to sit at the edge of the bed, then turns her enormous ass toward you, and steps backward until your slick hardlight is planted between her cheeks. Then, with a quick heft of her giant booty, Lola spreads herself and plants her asshole right on your dildo.");
		output("\n\n<i>“Ooh!”</i> Lola cries, and eases herself down onto your hardlight, sliding its length up into her in one long, smooth stroke. The full weight of her ass and thighs slams down hard onto you, making the hardlight rub again on your [pc.vagina " + vag + "], and your lap is full of her butt, her legs crushing your [pc.legs] beneath them.");
		output("\n\nShe eases herself back onto you, breathing hard, and you realize that her feet have left the floor. As short as she is, when Lola sits on your lap on the bed, her legs dangle down, meaning your dildo is all that’s holding her up. She starts grinding her ass against you, her cow-tail winding up and back to rest against your neck, her head tilted back as she moans.");
		output("\n\nYou push back against her, shoving your hardlight deeper and deeper into her ass, working to get in as much as you can. The maddening pressure against your [pc.vagina " + vag + "] only grows greater as Lola bounces on top of you, her giant ass slapping hard against your [pc.skinFurScales].");
		output("\n\nLola cries out, and for a moment you think she’s going to come again, but she leans back against your [pc.chest] and plants her hands on the bed to either side of you, giving herself leverage to bounce on your dildo. Her ass smashes harder into your [pc.hips], driving you down into the bed as she hammers the hardlight even deeper up her asshole.");
		output("\n\nYou grab hold of her hips and ass and push against her, slapping her thick thighs and bulging ass as she bounces, making her yell again. She gasps with every breath and thrust, and you join her, the rubbing against your [pc.vagina " + vag + "] growing even more fervent.");
		output("\n\nIt’s not going to be much longer before she comes, and you’re not far behind. The utter pounding your hardlight is taking, buried deep within her ass and constantly getting hammered in harder, has it rubbing against you hard enough to drive you over the edge. You give Lola’s ass another big squeeze and hold on tight, then hear her breath catch as she slams herself down on you one last time.");
		output("\n\nLola screams out as she comes, her legs and ass quivering, and your [pc.vagina " + vag + "] shudders and twitches as your orgasm hits at the same time.");
		if (pc.girlCumQ() >= 1000) output(" [pc.Girlcum] splatters out across your [pc.legs], a sticky mess that covers Lola’s thighs and ass too.");
		output(" You groan as the two of you shake against each other, and you hold tight to her as the sensation fades, then fall back onto the bed, feeling like you just tried to break down a building with only your [pc.hips].");
		
		output("\n\nShe falls backwards against you, and lays there panting for a moment, then rolls off, making the dildo pop out of her ass. It takes her a moment before she can sit up, and she looks at you, dazed and happy. <i>“That was amazing,”</i> she says, sounding out of breath. <i>“Thanks for letting me go on top.”</i>");
		output("\n\nAfter a moment, Lola slowly gets to her feet, and says, <i>“I think we both need a shower.”</i> She holds out one hand to you, though as tired as you both are, she’s not much help in getting you to your feet.");
		output("\n\nThe two of you take a rather wobbly shower together, and you give her big, round ass a thorough cleaning");
		if (pc.girlCumQ() >= 1000) output(", making sure all the [pc.girlcum] you splashed across her thighs gets washed off.");		
		output(" Once you’re both done and have dried off, Lola gives you a shy kind of look.");
		
		output("\n\n<i>“If you have to go, that’s okay,”</i> Lola says, and brushes a lock of wet hair out of her eyes. <i>“But if you want to stay here and cuddle, I’d like that too.”</i>");
		output("\n\nWhat do you say?");	
		
		processTime(10 + rand(10));
	}
	
	pc.orgasm();
	pc.shower();	
	processTime(20);
	
	IncrementFlag("SEXED_LOLA");
	IncrementFlag("TTGYM_LOLA_ANAL");
	
	clearMenu();
	addButton(0, "Cuddles", tentongymLolaCuddles, undefined);
	addButton(1, "No Cuddles", tentongymLolaNoCuddles, undefined);
}
public function tentongymLolaInTheButtFromBehind(kok:int=0):void
{
	clearOutput();
	tentongymShowLola(true);
	
	var vag:int = -1;
	
	if (kok >= 0)
	{
		output("You tell Lola that if she wants another round, you want to go at her ass from behind. She nods quickly, and rolls over, then gets up on her hands and knees.");
		output("\n\n<i>“That’s good too,”</i> she says. <i>“I’m all ready for more.”</i>");
		output("\n\nYou take a good look at her wide, round ass, ready and open for you, and her still-slick asshole, then line up your [pc.cock " + kok + "] with her rear entrance. Taking hold of her wide hips, you slip your [pc.cockHead " + kok + "] back into her, and slowly start pushing in again.");
		output("\n\nLola makes a long moan as you slide your length inside her, her hands clenching the bedsheets. Once you’re all the way in, you hold it there for a moment, reveling in the feeling of Lola’s tight, warm tunnel surrounding your dong. She starts pushing her ass against your [pc.hips] after a moment, and you give her booty a good slap.");
		output("\n\n<i>“Aah!”</i> Lola gasps, then looks over her shoulder at you and giggles. <i>“Do that again!”</i>");
		output("\n\nYou pull your [pc.cock " + kok + "] almost all the way out, then slide in quick and give Lola’s ass another smack. She yelps, her asshole clenching around your girth, and slaps her ass against your [pc.hips]. You pull halfway out and drive in again, then slap her other cheek, leaving two red handprints across her tanlined flesh.");
		output("\n\nLola pushes back against you, harder this time, and you take hold of her wide hips and drive your [pc.cock " + kok + "] in, filling her to the hilt. She spreads her thick legs a little wider, and matches your thrusts with her own, gasping with every one.");
		output("\n\n<i>“Harder,”</i> Lola gasps, and pushes her ass against your hips, hardly giving you room to thrust. Her cow-tail bats against your [pc.chest]. <i>“More!”</i>");
		output("\n\nYou lean forward, driving your [pc.cock " + kok + "] down and in, and Lola cries out. Her legs start shaking, and the smack of her skin on your [pc.skinFurScales] echoes all through her bedroom. She yelps with every thrust, and after a moment, her arms give out.");
		output("\n\nLola slides forward, landing prone on her bed, pulling herself off of your cock. You ask if she’s all right, and she gasps a few times, then turns her head and looks at you. <i>“I’m okay”</i>, she says, then reaches back and spreads her cheeks with both hands. <i>“Get back in there!”</i>");
		output("\n\nYou crawl on top of Lola and slide your [pc.cock " + kok + "] right back into her, and she lets out a moan that makes her whole body shudder. She props herself up on her arms, but you keep hammering away at her, driving your dick into her ass as she lies prone. Lola spreads her thick legs wide, letting you thrust in even deeper, hilting yourself in her again.");
		output("\n\nThe sensation of Lola’s asshole squeezing your entire [pc.cock " + kok + "] is almost too much to bear. She’s moaning and gasping beneath you, and then you feel her whole body tense. The sudden squeeze on your dong is what drives you over the edge.");
		output("\n\nYou and Lola come together, her scream loud enough to rattle her windows, your [pc.cock " + kok + "] firing jet after jet of [pc.cum] into her. You collapse atop her, tired and sweaty, and Lola keeps gasping, trying to catch her breath.");
		output("\n\nAfter a moment, you’re able to roll off of her, slowly pulling your softening [pc.cock " + kok + "] out of Lola’s ass. She lets out one last groan, and turns herself over.");
		if (pc.cumQ() >= 1000) output(" The load of [pc.cum] you pumped into her was enough to make her belly bloat.");		
		output(" She gives you a dizzy look, and says, <i>“Moooo...”</i>, then blinks a few times.");
		
		output("\n\n<i>“That was amazing,”</i> she says, sounding half-dazed. <i>“I’m going to be walking funny for... at least two days, I think.”</i>");
		output("\n\nAfter a moment, Lola slowly gets to her feet, and says, <i>“I think we both need a shower.”</i> She holds out one hand to you, though as tired as you both are, she’s not much help in getting you to your feet.");
		output("\n\nThe two of you take a rather wobbly shower together, and you give her big, round ass a thorough cleaning");
		if (pc.cumQ() >= 1000) output(", making sure all the [pc.cum] you spewed into her gets washed out");
		output(". Once you’re both done and have dried off, Lola gives you a shy kind of look.");
		
		output("\n\n<i>“If you have to go, that’s okay,”</i> Lola says, and brushes a lock of wet hair out of her eyes. <i>“But if you want to stay here and cuddle, I’d like that too.”</i>");
		output("\n\nWhat do you say?");			
		
		processTime(10 + rand(10));
		
		chars["LOLA"].loadInAss(pc);
	}
	else
	{
		vag = rand(pc.vaginaTotal());
		output("You tell Lola that if she wants another round, you want to go at her ass from behind. She nods quickly, and rolls over, then gets up on her hands and knees.");
		output("\n\n<i>“That’s good too,”</i> she says. <i>“I’m all ready for more.”</i>");
		output("\n\nYou take a good look at her wide, round ass, ready and open for you, and her still-slick asshole, then line up your hardlight with her rear entrance. Taking hold of her wide hips, you slip your dildo’s head back into her, and slowly start pushing in again.");
		output("\n\nLola makes a long moan as you slide the length inside her, her hands clenching the bedsheets. Once you’re all the way in, you hold it there for a moment, reveling in the sweet pressure the hardlight puts on your [pc.vagina " + vag + "]. She starts pushing her ass against your [pc.hips] after a moment, and you give her booty a good slap.");
		output("\n\n<i>“Aah!”</i> Lola gasps, then looks over her shoulder at you and giggles. <i>“Do that again!”</i>");
		output("\n\nYou pull your dildo almost all the way out, then slide in quick and give Lola’s ass another smack. She yelps, her asshole clenching around the hardlight, and slaps her ass against your [pc.hips]. You pull halfway out and drive in again, then slap her other cheek, leaving two red handprints across her tanlined flesh.");
		output("\n\nLola pushes back against you, harder this time, and you take hold of her wide hips and drive your hardlight in, filling her to the hilt. She spreads her thick legs a little wider, and matches your thrusts with her own, gasping with every one.");
		output("\n\n<i>“Harder,”</i> Lola gasps, and pushes her ass against your hips, hardly giving you room to thrust. Her cow-tail bats against your [pc.chest]. <i>“More!”</i>");
		output("\n\nYou lean forward, driving your dildo down and in, and Lola cries out. Her legs start shaking, and the smack of her skin on your [pc.skinFurScales] echoes all through her bedroom. She yelps with every thrust, and after a moment, her arms give out.");
		output("\n\nLola slides forward, landing prone on her bed, pulling herself off of your hardlight. You ask if she’s all right, and she gasps a few times, then turns her head and looks at you. <i>“I’m okay,”</i>, she says, then reaches back and spreads her cheeks with both hands. <i>“Get back in there!”</i>");
		output("\n\nYou crawl on top of Lola and slide your dildo right back into her, and she lets out a moan that makes her whole body shudder. She props herself up on her arms, but you keep hammering away at her, driving your hardlight into her ass as she lies prone. Lola spreads her thick legs wide, letting you thrust in even deeper, hilting the dildo in her again.");
		output("\n\nThe sensation of the hardlight’s base pressing against your [pc.vagina " + vag + "] is almost too much to bear. Lola’s moaning and gasping beneath you, and then you feel her whole body tense. The sudden squeeze on the hardlight hits you hard, and the pressure drives you over the edge.");
		output("\n\nYou and Lola come together, her scream loud enough to rattle her windows, your [pc.vagina " + vag + "] twitching in orgasm.");
		if (pc.girlCumQ() >= 1000) output(" [pc.Girlcum] splatters out across your [pc.thighs] and Lola’s thighs, enough to stick the two of you together.");		
		output(" You collapse atop her, tired and sweaty, and Lola keeps gasping, trying to catch her breath.");
		
		output("\n\nAfter a moment, you’re able to roll off of her, slowly pulling your still-hard dildo out of Lola’s ass. She lets out one last groan, and turns herself over. She gives you a dizzy look, and says, <i>“Moooo...”</i>, then blinks a few times.");
		output("\n\n<i>“That was amazing,”</i> she says, sounding half-dazed. <i>“I’m going to be walking funny for... at least two days, I think.”</i>");
		output("\n\nAfter a moment, Lola slowly gets to her feet, and says, <i>“I think we both need a shower.”</i> She holds out one hand to you, though as tired as you both are, she’s not much help in getting you to your feet.");
		output("\n\nThe two of you take a rather wobbly shower together, and you give her big, round ass a thorough cleaning");
		if (pc.cumQ() >= 1000) output(", making sure all the [pc.girlcum] you splashed across her thighs gets washed off");
		output(". Once you’re both done and have dried off, Lola gives you a shy kind of look.");
		
		output("\n\n<i>“If you have to go, that’s okay,”</i> Lola says, and brushes a lock of wet hair out of her eyes. <i>“But if you want to stay here and cuddle, I’d like that too.”</i>");
		output("\n\nWhat do you say?");	
		
		processTime(10 + rand(10));
	}
	
	pc.orgasm();
	pc.shower();	
	processTime(20);
	
	IncrementFlag("SEXED_LOLA");
	IncrementFlag("TTGYM_LOLA_ANAL");
	
	clearMenu();
	addButton(0, "Cuddles", tentongymLolaCuddles, undefined);
	addButton(1, "No Cuddles", tentongymLolaNoCuddles, undefined);
}
//simone
public function tentongymEncounterSimone():void
{
	clearOutput();
	tentongymShowSimone();
	
	output("As you head down the road, you see someone you know up ahead. It’s Simone, from the Ten Ton Gym, clad in her usual pink workout gear and looking like she just spent a damn long time lifting. There’s a fine sheen of sweat on her muscular build, and she looks a little tired. Her expression brightens when she sees you, and she waves.");
	output("\n\n<i>“Heeyy, [pc.name],”</i> Simone says, and gives you a smirk as she walks up to you. <i>“How you doing?”</i>");
	output("\n\nYou tell Simone how you’ve been, and talk a little about your recent adventures. She nods, then dabs at her forehead with her sweatband.");
	output("\n\n<i>“Sounds like you’ve been busy,”</i> she says. She gives you a quick look up and down, then gives her shoulders a rolling shrug, making her gigantic boobs lift and jiggle as they fall. <i>“You busy now? Because I just finished my set, kind of wore myself out. A shower’s not going to cut it for this kind of sore, so I’m heading home to relax in the bath.”</i>");
	output("\n\nSimone looks you in the eye. <i>“Want to join me?”</i>");
	if (flags["TTGYM_SIMONE_HOME"] != undefined) output(" She slips out her wide tongue and licks her lips. <i>“Since it went so well last time.”</i>");
	
	output("\n\nThat was blunt, but no different than you’d expect from a New Texan. What do you say?");
	
	processTime(3);
	
	flags["TTGYM_SIMONE_TIMER"] = GetGameTimestamp();	
	
	clearMenu();
	if (silly) addButton(0,"Fuck the Cow",tentongymSimoneHome, undefined, "Fuck the Cow", "DO IT NOW.");
	else addButton(0,"Yes",tentongymSimoneHome, undefined);
	addButton(1,"Nope",tentongymSimoneNope, undefined);
	
}
public function tentongymSimoneHome():void
{
	clearOutput();
	tentongymShowSimone();
		
	moveTo("NT TTGG APARTMENT");
	
	if (flags["TTGYM_SIMONE_HOME"] == undefined)
	{
		output("Simone grins at you, then waves for you to follow her. <i>“You have no idea what kind of day I’ve had,”</i> she says as you both head down a side street, then down a long road toward a few blocks of homes and apartment buildings hidden behind the hills. <i>“My boss has been on my ass about a missing file for a week, kept pinging me when I was working out.”</i> She stretches her muscular arms out to either side, making her giant boobs stick out, her nipples poking up from beneath her top’s stretchy fabric. <i>“Can’t even get in a good workout when I’ve got to keep telling him I don’t know what happened.”</i>");
		output("\n\nShe looks over at you once she’s done, and lets her arms drop to her sides. You’re pretty sure she wasn’t putting herself on display like that on accident, and she gives you a look that says she knows you were watching. She looks right at your [pc.chest] in return, and chuckles under her breath.");
		output("\n\nYou ask where she works, if her boss keeps bothering her while she works out. You’ve only ever seen her at the gym, so it sounds like she doesn’t work local.");
		output("\n\n<i>“Nah, I work online,”</i> Simone says, turning a corner and leading you along a street with small houses on both sides. <i>“The hours are great, and I can work out or go for a hike whenever I want.”</i> She rubs at one small cow-ear, and grimaces a little. <i>“But the boss doesn’t get the whole ‘working hours’ thing, and I swear he always waits until I finish my shift to ask me anything. It’s damn annoying.”</i>");
		output("\n\nSimone glances down again, this time eyeing your crotch. You look down at hers as you walk, to her thick pussy lips pushing against her pink workout shorts. Clothing that tight must be rubbing against her all the time. No wonder she likes working out so much, if just wearing the shorts rubs her right.");
		output("\n\nWhen you raise your gaze, Simone meets your eyes and smirks again. <i>“Almost there,”</i> she says, her voice low.");
		output("\n\nAfter about another half a block, Simone says, <i>“This is it,”</i> and leads you to a small house, then takes you down a stone path that leads around to the side. <i>“I don’t have the whole place, just the rear half, and it’s all closed off from the front half. I haven’t met the housemates, but I hear them through the wall sometimes.”</i> She chuckles. <i>“They sound like they’re having a good time.”</i>");
		output("\n\nSo they won’t mind hearing her have a good time, you ask, and she laughs.");
		output("\n\n<i>“Wouldn’t be the first time they heard it, if they’re around,”</i> Simone says as she unlocks the door. <i>“Won’t be the last.”</i>");
		output("\n\nShe lets you in, and the first thing you see is a large workstation, with two monitors and a 3D display, clearly where Simone does her job. The rest of the place looks clean, with fitness and nature posters on the walls, and a weight machine in one corner with free weights stacked on a rack next to it. There are also several full-length mirrors, which make the place seem bigger than it is.");
		output("\n\nSimone gestures to her home, a proud smile on her face. <i>“Not bad, huh? Rent’s a little high, but I need my space.”</i> She looks you in the eye. <i>“And it’s hard to find an apartment with a bath big enough to really relax in. C’mon, I’ll show you.”</i>");
		output("\n\nShe leads you past a small kitchen with a giant bag of protein powder on the counter to her bedroom, which has mirrors on most of the walls and a bed big enough for three. Pictures of Simone with other New Texans sit on the nightstands on either side of the bed. From there, she walks into the bathroom, and you follow.");
		output("\n\nThe bathroom’s a little cramped, mostly taken up by a small shower and a large, deep bathtub. The tub is clearly the focus, sitting right in the middle of the back wall, and a dozen bottles of lotions and hair products sit around the edges, along with four or five dildos of different shapes and sizes. Simone leans over the edge, and turns on the hot water.");
		output("\n\nYou take a moment to admire Simone’s toned ass, and don’t bother hiding that when she turns around. She squeezes by you to the other side of the bathroom, and squeezes your [pc.ass] as she reaches into a cloth bag next to the shower.");
		output("\n\nSimone pulls out a bright pink ball of some kind of crumbly material, and drops it into the tub with a splash. The water immediately starts turning pink, and a relaxing scent rises along with the steam. She takes a deep breath, and sighs.");
		output("\n\n<i>“Bath bomb,”</i> she says. <i>“A friend of mine turned me on to them, it’s good for sore muscles.”</i> She glances at the tub, then looks to you. <i>“Now, that’s going to fill up quick so...”</i> She winks at you. <i>“Get naked.”</i>");
		output("\n\nNo surprise she wants you to strip first. You work your way out of your [pc.gear], doing the best you can to make it look good in the bathroom’s close confines. Once you’re standing there nude, Simone gives you a long look up and down, and nods once she meets your eyes again.");
		output("\n\n<i>“Not bad, [pc.name],”</i> she says. <i>“Pretty damn good, I’ve got to say.”</i> She gestures for you to step back, then starts stripping.");
		output("\n\nSimone whips off her headband and tosses it aside, and her tight top is the next to go. She reaches under her boobs to find the lower hem, then pulls it hard to get it around her giant globes. Slowly, she reveals more and more of her dark skin and darker nipples, the peaks already jutting out hard from her tits. Her boobs hardly sag as they come free, and her arms and shoulders flex as she pulls her top the rest of the way off.");
		output("\n\nShe drops her top to the floor, and tightens her abs as she bends down a little to reach for her shorts, then twists herself around as she yanks then down over her round, toned ass. She’s got on a pink thong beneath it, and she slaps one cheek hard once her shorts are off. Fit as she is, her ass doesn’t so much wiggle as quiver, and the slap echoes throughout the bathroom. She pulls down her thong, her legs flexing as she drops it down, then turns around.");
		output("\n\nSimone stands before you, toned muscles gleaming in the bathroom lights, and poses for you, holding her arms in a way that lets her flex and stick out her chest at the same time. She turns, giving you a glimpse of her thick-lipped pussy as she moves from flexing one leg to the other. It seems like she’s practiced posing like this, because she clearly knows exactly how good she looks.");
		output("\n\nYou tell her so, and she laughs again. <i>“You know it. Always good to have someone appreciate the time I spend on this body, though.”</i> She leans over the tub again, then turns the faucet off and steps into the pink water.");
		output("\n\n<i>“Ooh...”</i> Simone moans as she sinks into the tub, a blissful look spreading across her face. <i>“This is perfect. Get in here.”</i>");
		output("\n\nYou step into the bathtub, carefully so you don’t step on Simone’s legs, and sink into the steaming water. You let out a sigh as the heat seeps right into you, and you feel yourself loosen up right away, muscles you hadn’t even known needed to rest sagging with sudden relief. The scent from the bath bomb is definitely relaxing, and you feel your head clearing, the stress and pressure of your journey across the stars slowly fading away.");
		output("\n\nYou and Simone soak in silence for a moment, the only sound your quiet breathing. Then, you feel Simone’s leg rubbing against your [pc.leg], and meet her eyes. She runs her thick cow-tongue over her lips, and gently brushes her foot against your [pc.crotch]. A wicked smile spreads across her face.");
		output("\n\nSimone sits up, the pink water dripping off of her giant boobs in long trickles. <i>“Well, [pc.name],”</i> she says, <i>“now that I’ve got you here, how about we finish what we started at the gym?”</i>");
		output("\n\nShe rubs her foot against your [pc.crotch] again, her touch firm enough to");
		if (pc.hasCock()) output(" make blood rush to your [pc.cocksLight], and you feel yourself getting hard.");
		else output(" send waves of pleasure from [pc.eachVagina] radiating through you.");
		
		output("\n\nThat, and a sultry stare from Simone, is all you need.");

	}
	else
	{
		output("Simone grins at you, then waves for you to follow her. <i>“I swear, the crap from my job never ends,”</i> she says as you both head down a side street, then down the long road toward where she lives. <i>“My boss still doesn’t get that if I’m not signed in, I’m not on the clock, so he needs to leave me alone.”</i> She stretches her muscular arms out to either side, making her giant boobs stick out, her nipples poking against her top’s stretchy fabric. <i>“Can’t even get in a good workout when he keeps bugging me.”</i>");
		output("\n\nShe looks over at you once she’s done, and lets her arms drop to her sides. You’re pretty sure she wasn’t putting herself on display like that on accident, and she gives you a look that says she knows you were watching. She looks right at your [pc.chest] in return, and chuckles under her breath.");
		output("\n\nAfter about another half a block, Simone leads you to her small house, and takes you down a stone path that leads around to the side. She lets you in, and leads you past her workstation and weight bench, past the pictures and mirrors on the walls, through her bedroom and to the bathroom.");
		if (flags["TTGYM_LOLA_SIMONE_HOME"] != undefined) output(" You see a few plants in Simone’s bedroom near the window; it looks like they might be from Lola’s place.");
		
		output("\n\nOnce you’re in there, Simone leans over the bathtub’s edge, and turns on the hot water. You take a moment to admire Simone’s toned ass, and don’t bother hiding that when she turns around. She squeezes by you to the other side of the bathroom, and squeezes your [pc.ass] as she reaches into a cloth bag next to the shower.");
		output("\n\nSimone pulls out another bright pink bath bomb, and drops it into the tub with a splash. The water immediately starts turning pink, and a relaxing scent rises along with the steam. She takes a deep breath, and sighs.");
		output("\n\n<i>“I swear,”</i> she says, <i>“I need this thing so much on a day like this.");
		if (flags["TTGYM_LOLA_SIMONE_HOME"] != undefined) output(" Lola loves them too, but she likes the bath more after after we fuck.");		
		output("”</i> She glances at the tub, then looks to you and winks. <i>“Now, let’s get naked.”</i>");
		
		output("\n\nYou work your way out of your [pc.gear], doing the best you can to make it look good in the bathroom’s close confines. Once you’re standing there nude, Simone gives you a long look up and down, and nods once she meets your eyes again.");
		output("\n\n<i>“You still look good, [pc.name],”</i> she says. <i>“Always good to see you keep yourself in shape.”</i> She gestures for you to step back, then starts stripping.");
		output("\n\nSimone whips off her headband and tosses it aside, and her tight top is the next to go. She reaches under her boobs to find the lower hem, then pulls it hard to get it around her giant globes. Slowly, she reveals more and more of her dark skin and darker nipples, the peaks already jutting out hard from her tits. Her boobs hardly sag as they come free, and her arms and shoulders flex as she pulls her top the rest of the way off.");
		output("\n\nShe drops her top to the floor, and tightens her abs as she bends down a little to reach for her shorts, then twists herself around as she yanks then down over her round, toned ass. She’s got on a pink thong beneath it, and she slaps one cheek hard once her shorts are off. Fit as she is, her ass doesn’t so much wiggle as quiver, and the slap echoes throughout the bathroom. She pulls down her thong, her legs flexing as she drops it down, then turns around.");
		output("\n\nSimone stands before you, toned muscles gleaming in the bathroom lights, and poses for you, holding her arms in a way that lets her flex and stick out her chest at the same time. She turns, giving you a glimpse of her thick-lipped pussy as she moves from flexing one leg to the other. It seems like she’s practiced posing like this, because she clearly knows exactly how good she looks.");
		output("\n\nYou tell her so, and she laughs again. <i>“You know it. Always good to have someone appreciate the time I spend on this body, though.”</i> She leans over the tub again, then turns the faucet off and steps into the pink water.");
		output("\n\n<i>“Ooh...”</i> Simone moans as she sinks into the tub, a blissful look spreading across her face. <i>“This is perfect. Get in here.”</i>");
		output("\n\nYou step into the bathtub, carefully so you don’t step on Simone’s legs, and sink into the steaming water. You let out a sigh as the heat seeps right into you, and you feel yourself loosen up right away, muscles you hadn’t even known needed to rest sagging with sudden relief. The scent from the bath bomb is definitely relaxing, and you feel your head clearing, the stress and pressure of your journey across the stars slowly fading away.");
		output("\n\nYou and Simone soak in silence for a moment, the only sound your quiet breathing. Then, you feel Simone’s leg rubbing against your [pc.leg], and meet her eyes. She runs her thick cow-tongue over her lips, and gently brushes her foot against your [pc.crotch]. A wicked smile spreads across her face.");
		output("\n\nSimone sits up, the pink water dripping off of her giant boobs in long trickles. <i>“Well, [pc.name],”</i> she says, <i>“I think we’ve relaxed long enough, don’t you?”</i>");
		output("\n\nShe rubs her foot against your [pc.crotch] again, her touch firm enough to");
		if (pc.hasCock()) output(" make blood rush to your [pc.cocksLight], and you feel yourself getting hard.");
		else output(" send waves of pleasure from [pc.eachVagina] radiating through you.");
		
		output("\n\nThat, and a sultry stare from Simone, is all you need.");
	}	
	if (flags["TTGYM_SIMONE_ORAL"] == undefined) flags["TTGYM_SIMONE_ORAL"] = 0;
	if (flags["TTGYM_SIMONE_ORAL_GIVE"] == undefined) flags["TTGYM_SIMONE_ORAL_GIVE"] = 0;
	if (flags["TTGYM_SIMONE_DP_GYM"] == undefined) flags["TTGYM_SIMONE_DP_GYM"] = 0;
	if (flags["TTGYM_SIMONE_HOME"] == undefined && (flags["TTGYM_SIMONE_DP_GYM"] + flags["TTGYM_SIMONE_ORAL"] + flags["TTGYM_SIMONE_ORAL_GIVE"] < flags["SEXED_SIMONE"]))
	{
		//1st time try to set sex count flags to update and reflect correct totals from before this xpac
		if (StatTracking.getStat("contests/simone challenge losses") > 0) flags["TTGYM_SIMONE_ORAL_GIVE"] = StatTracking.getStat("contests/simone challenge losses")
		if (pc.cockTotal() > 1) flags["TTGYM_SIMONE_DP_GYM"] = flags["SEXED_SIMONE"] - (flags["TTGYM_SIMONE_ORAL"] + flags["TTGYM_SIMONE_ORAL_GIVE"]);
		else flags["TTGYM_SIMONE_ORAL"] = flags["SEXED_SIMONE"] - (flags["TTGYM_SIMONE_DP_GYM"] + flags["TTGYM_SIMONE_ORAL_GIVE"]);
	}
	
	IncrementFlag("TTGYM_SIMONE_HOME");
	
	processTime(30);
	pc.changeLust(30);
	
	clearMenu();	
	if (pc.cockThatFits(chars["SIMONE"].vaginalCapacity(0)) >= 0) addButton(0, "Next", penisRouter, [tentongymSimoneHomeNextCock, chars["SIMONE"].vaginalCapacity(0), false, 0]);
	else addButton(0, "Next", vaginaRouter, [tentongymSimoneHomeNextVag, 0, 0, 0]);
	
}
public function tentongymSimoneHomeNextCock(kok:int=0):void
{
	//see if there is a second cock that will fit in her ass
	var kok2:int = pc.cockThatFits(chars["SIMONE"].analCapacity(), "volume", [kok]);
	if (kok2 >= 0) tentongymSimoneHomeNextCockMulti(kok,kok2);
	else tentongymSimoneHomeNextCockSingle(kok);
}
public function tentongymSimoneHomeNextCockSingle(kok:int=0):void
{
	clearOutput();
	tentongymShowSimone(true);
	
	output("Simone leans forward, dipping the bottoms of her tits into the pink water again as she leans toward you. She reaches out beneath the water, and her hands find your [pc.cock " + kok + "]. You feel her fingers wrap around your [pc.base], and you start to grow harder.");
	output("\n\nShe scoots toward you in the tub, spreading her legs out to either side, until she has to hook one leg up on the bath’s edge. <i>“Come on, [pc.name],”</i> she says, giving your [pc.cock] a squeeze. <i>“You’ve got hands too, don’t you?”</i>");
	output("\n\nIt might be nice to just lean back and let her jerk you off, but she clearly wants more, and you don’t want her to stop. You lean forward and stroke your fingers down the insides of Simone’s toned thighs, and soon reach her puffy pussy lips. Simone takes a deep breath as you run your fingertips down the sides of her twat, gently rubbing them along her lips, and she starts stroking her hands up and down your length.");
	output("\n\n<i>“Just like that,”</i> she says. After a few more strokes from both of you, she slides further forward, until her pussy is barely an inch away from your [pc.crotch]. With her that much closer, you slip two fingers into her, and she sucks in a breath, then puts both hands on your [pc.cock " + kok + "] and takes you in a firm grip.");
	output("\n\nSimone rubs your [pc.cock " + kok + "] from base to head, her strong hands making your [pc.cockHead " + kok + "] bulge as she squeezes it upward, the entire shaft rapidly growing stiff between her palms. You rub her pussy from inside and out, two fingers sliding up and down within while you rub her thick lips with a finger and thumb. Simone’s dark nipples stand out hard from her giant boobs, and she breathes deeper, moaning a little.");
	output("\n\nOnce you’re fully hard, Simone eases up on her grip a little, her strokes keeping you stiff as she exults in your handiwork on her cunt. Her clit grows to full size, a hard knob sticking out between the top of her pussy lips, and you start to stroke your fingers along its sides.");
	output("\n\nSimone’s breath hisses as she sucks it in, and she leans back, pushing her chest toward you. <i>“Gently,”</i> she gasps, and squeezes your [pc.cock " + kok + "] again, then gives you a look that’s a little sheepish. <i>“Got to be careful with that when we’re just getting started,”</i> she says. <i>“Once we get going, you can go for it.”</i> She tugs your dong a few more times, then rubs her palm over your [pc.cockHead " + kok + "]. <i>“And this feels like you’re ready.”</i>");
	output("\n\nShe rises from the water, pink drops falling from her boobs and trailing down her toned abs, all the way down her muscular legs. Simone’s pussy is dripping wet from both the bath and her own fluids, her clit poking out at least an inch. She gestures for you to lean back, and you slide back to rest against the side of the bath, your [pc.cock " + kok + "] standing up straight.");
	output("\n\nSimone looks down at you, and smirks as she flicks one of her nipples. <i>“It’s not a weight bench,”</i> she says, smirking again, <i>“but I do like seeing you beneath me like this.”</i>");
	output("\n\nWithout another word, Simone straddles you and drops herself down, aiming her thick-lipped pussy right at your dick. She squats down on you like you’re part of her workout, and slips your [pc.cockHead " + kok + "] right into her, her thighs flexing as she descends. A long moan escapes her as you slide inside, and she holds herself there for a moment.");
	
	pc.cockChange();
	
	output("\n\nSimone looks down at you, then squeezes her lips around your [pc.cockHead " + kok + "], making you jump. She laughs, then stands up, freeing you for just a second before dropping down again. Her puffy lips swallow up your [pc.cock " + kok + "], and you groan as Simone settles herself atop you, her toned legs clenching your [pc.hips] between them, her huge boobs right in your face.");
	output("\n\nThat looks like an invitation. You lean forward and wrap your [pc.lips] around Simone’s hard, dark nipple, and she yelps, then grabs the back of your head with one hand and holds you tight to her tit.");
	output("\n\n<i>“Off to a good start,”</i> Simone says, then laughs again. She starts to work herself forward and back on your [pc.cock " + kok + "], squeezing your length tight. It feels like she’s as strong inside as she is outside, and she knows how to massage your dong, her inner walls clenching and releasing your [pc.cock " + kok + "] in time with her ride.");
	if (pc.cocks[kok].girth() >= 2) output(" Even as girthy as you are, it feels like she could wrap around you tight and work your shaft all day.");
	
	output("\n\nShe leans forward, pressing more of her big round boob against you, and you lean back a little as the mass of her tit threatens to crush your face. Simone seems to take this as an invitation, and pushes forward even more, then starts bouncing on your dick. The pink water splashes against the bathtub’s sides, small waves crashing against you and her both.");
	if(pc.hasKnot(kok)) output("\n\nAfter a few more bounces, Simone pushes herself down hard on you, her pussy lips squeezing tight around your [pc.knot]. You cry out as she clenches your knot with her thick lips, and then she takes it in, moaning hard.");
	
	output("\n\nYou reach around and grab Simone’s toned ass, taking hold of her firm cheeks as she rides you, and start thrusting up into her. It’s a little awkward, stuck beneath her as you are in the bathtub, but she groans, so you know it’s working. She grinds back on you, and plants her hands on the bath’s edge to either side. Her arms flex, making her muscles stand out, as she shoves her tits even harder onto you.");
	output("\n\nAfter only a moment of that, you have to set her nipple free, as the sheer amount of boob in your face is making it hard to catch your breath. Simone chuckles at you, and pushes her cleavage into your face. You don’t even get a chance to protest as she shoves her hips harder against you, her pussy squeezing your entire [pc.cock] at once");
	if(pc.hasKnot(kok)) output(", her thick lips still holding tight around your [pc.knot]");
	output(".");
	
	output("\n\nWater splashes harder against the tub, but it’s muffled now, with your head halfway trapped between Simone’s tits. You feel your orgasm growing closer, as Simone’s work on your dong never stops, but she looks like she’s doing just fine. Time to change that.");
	output("\n\nYou pull your head back and take hold of Simone’s nipples with both hands, and she yelps again. Rolling them both between your fingers makes her moan, and you push harder up into her, slamming your [pc.hips] against her as much as you can.");
	output("\n\n<i>“Mmmh...”</i> Simone moans, biting at her lower lip. <i>“Keep going...”</i>");
	output("\n\nYou lean forward, swapping your fingers on one nipple for your lips, sucking the hard nub again. Simone grabs the back of your head, holding herself up with one arm as she pounds you into the bottom of the bathtub. The water’s splashing all the way up both sides now, about to spill over.");
	output("\n\nThen, you reach down and start to stroke Simone’s clit. It’s bulging out now, easily as big as your thumb and as hard as your [pc.cock]");
	if(pc.hasKnot(kok)) output(", sticking out even farther than usual thanks to her lips squeezing around your [pc.knot]");
	output(". Simone cries out, and you slide two fingers up both sides of her clit, just short of jerking it off. Her pussy clenches on your cock, and she shoves her chest harder into your face, her hips pounding against you with short, strong thrusts.");
	
	output("\n\nThe hold she has on your [pc.cock " + kok + "] is about to be too much. You feel an orgasm building in your [pc.base], and struggle to hold it back. Another few quick strokes on Simone’s clit, and she’s gasping out every breath, her eyes squeezed shut.");
	output("\n\nFinally, Simone throws her head back and shouts, her pussy squeezing your [pc.cock " + kok + "] like she’s trying to break it, and she thrusts hard enough to send water splashing out over the bath’s edges as her orgasm hits. Yours comes barely a second after her, the sensation hitting you all at once, your [pc.cock " + kok + "] spasming as you shove it into her, spewing out [pc.cum] deep into Simone.");
	if (pc.cumQ() >= 1000) 
	{
		if (pc.hasKnot(kok)) output(" Shot after shot of [pc.cum] fires into her, and your [pc.knot] traps it all inside, making her toned stomach bulge.");
		else output(" Shot after shot of [pc.cum] fires into her, and starts leaking out from between her thick lips, despite her pussy’s grip on your dong. Soon, the water is as much [pc.cumColor] as pink, your sticky fluid enough to make the tub overflow.");
	}
	
	output("\n\nSimone groans, breathing hard, and sags atop you, leaning back as your [pc.cock " + kok + "] slowly starts to go limp. She leans forward, and catches herself on the tub’s edge before she crashes into you, but not before slapping her boobs into your face again. <i>“Damn,”</i> Simone breathes. <i>“If I’d known you could do that, I’d have fucked you on the bench instead of waiting to bring you home.”</i>");
	output("\n\nIt takes her a moment, but she pulls herself off of you,");
	if(pc.hasKnot(kok)) output(" setting your [pc.knot] free with a pop and a yelp and letting all the [pc.cum] you shot into her spill out of her pussy,");	
	output(" then looks around at the mess you made. Pink water still drips down the bathtub’s sides, pooling on the floor, and some of it also splattered on the walls.");
	if (pc.cumQ() >= 1000) output(" Your [pc.cum] has turned the tub itself into a swamp, and");
	output(" Simone looks around as she gets to her feet.");
	
	output("\n\n<i>“You’re helping me clean this up,”</i> she says with a laugh. <i>“But damn, I’m sore all over again. Once we’re done, how about you give me a rubdown, and then I’ll do you?”</i>");
	output("\n\nYou and Simone clean up each other and the bathroom, then rub each other down at her direction, strokes she knows to ease sore muscles and relieve tension. After that, the bath, and the orgasms, you and Simone are both feeling well and truly relaxed. She smirks at you once you’re both done.");
	output("\n\n<i>“That,”</i> she says, <i>“was a damn good time, [pc.name].”</i> She takes a deep breath and lets it out slowly. <i>“I need to get some sleep, but we need to do this again sometime soon, yeah?”</i>");
	output("\n\nThat definitely sounds like a plan. You gather your [pc.gear] and bid Simone goodbye, then return to the streets of New Texas.");

	processTime(15 + rand(15));
	
	chars["SIMONE"].loadInCunt(pc, 0);
	pc.orgasm();
	pc.shower();	
	if (pc.statusEffectv1("Sore Counter") > 1 ) soreChange(-3);
	
	IncrementFlag("SEXED_SIMONE");
	IncrementFlag("TTGYM_SIMONE_FUCKED_PUSSY");
	
	processTime(90 + rand(30));
	clearMenu();
	addButton(0, "Next", move, "503");	
}
public function tentongymSimoneHomeNextCockMulti(kok:int=0, kok2:int=0):void
{
	clearOutput();
	tentongymShowSimone(true);
	
	output("Simone leans forward and takes your [pc.cock " + kok + "] in one hand and your [pc.cock " + kok2 + "] in the other, and gives you a wicked grin. <i>“Been looking forward to having these in me again,”</i> she says. She starts stroking her hands up your lengths, pulling up from base to tip, her strong grip getting you harder fast.");
	output("\n\nYou shift forward as well and take her boobs in both hands, stroking down their curved sides, sliding your fingers across her flesh and rubbing your thumbs over her hard nipples. Simone gasps a little, then moans as you work on her nipples, flicking them back and forth in time with her strokes.");
	output("\n\n<i>“We could just keep this up, you know,”</i> Simone says, her voice low and breathy. <i>“I think I could come if you keep playing with my nipples like that, and I know I’ll get you off.”</i> She smirks. <i>“But that’s not what either of us wants, is it.”</i>");
	output("\n\nNot at all. But before you can answer, Simone lets go of your cocks, then reaches for a bottle on the tub’s edge with a happy cowgirl’s face on the label, and says, <i>“Get up.”</i>");
	output("\n\nIt’s pretty clear what she has in mind, so you pull yourself up and kneel, your [pc.cocksLight] dripping pink water as they rise from the tub. Simone opens the bottle and squirts some lube on both hands, then starts stroking your [pc.cock " + kok + "] and [pc.cock " + kok2 + "] again, sliding the slippery stuff down your lengths.");
	output("\n\n<i>“Not that this one needs lube,”</i> Simone says with a chuckle, giving your [pc.cock " + kok + "] an extra squeeze. <i>“Not as wet as I am right now. But I need this one going in right.”</i> She squeezes your [pc.cock " + kok2 + "] this time. <i>“And if you’re going to lube up one dick, might as well do the other one.”</i>");
	output("\n\nCan’t argue with that. You tilt your head back and moan as Simone’s strong hands continue their work, sliding from your cocks’ bases to their heads, making sure they’re completely covered in slippery lube. Once that’s set, Simone wipes off the excess lube on her boobs, leaving them slick and shiny, then gets on her knees and turns around.");
	output("\n\nThe water comes up to just below Simone’s hips, and she leans forward, sliding her toned ass halfway out of the pink bathwater. She hikes up her hips, exposing both her dark asshole and the very bottom of her thick pussy lips, waiting and ready.");
	output("\n\n<i>“Slide on in, [pc.name],”</i> Simone says, looking at you over her shoulder. <i>“Do it.”</i>");
	output("\n\nYou move forward until you’re close enough, then align your cocks with Simone’s holes. Once you’ve got your [pc.cock " + kok + "] aimed at her cunt and your [pc.cock " + kok2 + "] pointed right at her asshole, you take hold of her hips and slowly push forward, sliding your lengths right into her.");
	output("\n\nSimone lets out a strained moan as you penetrate her. Her pussy is slick and takes you in easily, but her ass is hot and tight, squeezing hard around your [pc.cock " + kok2 + "] as you push it in. You keep it slow, angling your [pc.hips] so both of your cocks push into her at the same pace, hands still on her hips as you press forward.");
	
	pc.cockChange();
	
	output("\n\n<i>“Mmmh,”</i> Simone groans as your dicks slide deeper into her. She’s already trembling, her cunt and ass squeezing tight around your [pc.cock " + kok + "] and [pc.cock " + kok2 + "], making it harder for you to get all the way in. Simone gasps with every inch you shove into her, until you’re in as far as you can go.");
	output("\n\nYou can’t get either cock all the way in, but that doesn’t seem to bother Simone at all. Once you’ve filled her with as much dick as you can, she finally catches her breath, and starts pushing back against you, her muscular thighs splashing in the water, sending small waves crashing against you.");
	output("\n\n<i>“That’s it,”</i> Simone breathes, <i>“now go harder!”</i>");
	output("\n\nYou get a better grip on Simone’s hips and shove your cocks into her, leaning forward to slam your [pc.cock " + kok2 + "] deeper into her ass. She shouts, and clenches herself around both cocks, her giant knob of a clit rubbing against your [pc.cock " + kok + "]. You drop one hand from her hip and reach down under her, stroking her clit as she slams herself against you.");
	output("\n\nSimone screams, leaning her head back as her pussy clenches around your [pc.cock " + kok + "]. The muscles in her back stand out as she arches it, dropping her tits down into the water, sending splashes everywhere. You keep rubbing, and lean forward just a little more, trying to get your entire [pc.cock " + kok2 + "] into her ass. Her toned cheeks slap against your [pc.hips], and she gasps and goes tense again, then shouts as she comes, her pussy squeezing your [pc.cock " + kok + "] hard enough to make you groan.");
	output("\n\nThe dark-skinned cowgirl slows her thrusting against you, breathing hard, her head drooping down. You slow as well, letting her recover. She’s breathing hard, but turns and gives you a grin over her shoulder. Looks like she’s not letting that orgasm stop her.");
	output("\n\n<i>“That’s intense,”</i> she says, <i>“getting it on my clit when I’m filled like this.”</i> She groans again, then plants her hands on the bathtub’s rim and pushes down and back against you, changing the angle your [pc.cock " + kok + "] fits into her pussy. <i>“Ah,”</i> she gasps, <i>“right there.”</i>");
	output("\n\nWith her hands on the tub’s edge, Simone’s giant tits are out of the water and slapping freely against her chest, so you slide your hands up her sides and take hold of them both. You give her soft flesh a squeeze, making her moan, then grab her nipples between finger and thumb and tweak them both.");
	output("\n\nSimone yelps, her holes squeezing your cocks again, and slaps her ass harder into your [pc.hips]. <i>“Don’t let go,”</i> she gasps, <i>“until we’re done!”</i>");
	output("\n\nYou can do that. You push harder against and into her, sliding your [pc.cock " + kok + "] in and out of her pussy while your [pc.cock " + kok2 + "] stays trapped deep in her ass, the sensation on your slick dicks driving you closer and closer to coming. Simone pants and gasps with every thrust, and moans as you hammer away at her, her nipples hard as rocks between your fingers.");
	output("\n\nSimone’s thick cunt lips squeeze hard on your [pc.cock " + kok + "], and her giant clit rubs against your shaft. Water splashes up between the two of you as you fuck, the waves rising higher and higher, and you thrust faster, pulling Simone closer to you as the two of you start moaning together. You’re close now, and so is she, just a little more–");
	output("\n\nWith a shout loud enough to echo, Simone comes all at once, her holes giving your cocks one last hard squeeze. This drives you over the edge, your [pc.cock " + kok + "] and [pc.cock " + kok2 + "] squirting streams of [pc.cum] deep into her, and you let out a long groan as the orgasm sends shudders all through you.");
	if (pc.cockTotal() >= 4) output(" Your unused cocks fire off across Simone’s back, splattering her toned skin with [pc.cumColor].");
	else if (pc.cockTotal() == 3) output(" Your unused cock fires off across Simone’s back, splattering her toned skin with [pc.cumColor].");
	if (pc.cumQ() >= 1000) output(" [pc.Cum] spurts out in streams from Simone’s pussy and ass, leaking out around your dicks to splatter across her and you and her bathtub, staining the pink water [pc.cumColor].");
	
	output("\n\nThe two of you slowly stop thrusting against each other, and Simone groans as you pull your dicks free, [pc.cum] leaking from both her holes. She sags back against you, breathing hard.");
	output("\n\n<i>“Wow,”</i> Simone gasps. <i>“I am never going to get tired of that.”</i> She laughs a little, and looks at you over her shoulder. <i>“I don’t know how you ended up with all those dicks, [pc.name], but I’m glad you did.”</i>");
	output("\n\nIt takes her a moment, but she pulls herself off of you,");
	output(" then looks around at the mess you made. Pink water still drips down the bathtub’s sides, pooling on the floor, and some of it also splattered on the walls.");
	if (pc.cumQ() >= 1000) output(" Your [pc.cum] has turned the tub itself into a swamp, and");
	output(" Simone looks around as she gets to her feet.");
	
	output("\n\n<i>“You’re helping me clean this up,”</i> she says with a laugh. <i>“But damn, I’m sore all over again. Once we’re done, how about you give me a rubdown, and then I’ll do you?”</i>");
	output("\n\nYou and Simone clean up each other and the bathroom, then rub each other down at her direction, strokes she knows to ease sore muscles and relieve tension. After that, the bath, and the orgasms, you and Simone are both feeling well and truly relaxed. She smirks at you once you’re both done.");
	output("\n\n<i>“That,”</i> she says, <i>“was a damn good time, [pc.name].”</i> She takes a deep breath and lets it out slowly. <i>“I need to get some sleep, but we need to do this again sometime soon, yeah?”</i>");
	output("\n\nThat definitely sounds like a plan. You gather your [pc.gear] and bid Simone goodbye, then return to the streets of New Texas.");

	processTime(15 + rand(15));
	chars["SIMONE"].loadInCunt(pc, 0);
	chars["SIMONE"].loadInAss(pc);
	pc.orgasm();
	pc.shower();	
	if (pc.statusEffectv1("Sore Counter") > 1 ) soreChange(-3);
	
	IncrementFlag("SEXED_SIMONE");
	IncrementFlag("TTGYM_SIMONE_DP_HOME");
	
	processTime(90 + rand(30));
	clearMenu();
	addButton(0, "Next", move, "503");	
}
public function tentongymSimoneHomeNextVag(vag:int=0):void
{
	clearOutput();
	tentongymShowSimone(true);
	
	output("Simone licks her upper lip again, then gestures to her collection of dildos on the tub’s edge. <i>“Why don’t you pick one of those?”</i> she says. <i>“I’ll use it on you, and then, we swap.”</i>");
	output("\n\nSounds like a plan. Simone’s collection has some variety going – she’s got a horsecock, of course, along with one shaped like a kaithrit dong, with soft nubs all up and down the shaft. A human-dick dildo has an overly large set of balls attached to the bottom, and there’s something with a bunch of bumps and wiggles to it that might or might not be based off of any actual creature’s penis.");
	output("\n\nYou pick the one you want and hand it to Simone, who gives you a smirk, then slides the dildo into her mouth. Her wide tongue slips out and wraps around the fake dong’s lower half, the upper half sliding between her lips, her eyes closing as she gives the dildo an epic blowjob. Your [pc.nipples] grow hard watching her, and you feel yourself getting even wetter.");
	output("\n\nAfter making sure the whole dildo is lubed and ready, Simone slides it out of her mouth, then gets up on her knees, pink water dripping down her toned sides, only the top half of her ass rising out of the bath. <i>“All right, [pc.name],”</i> Simone says, her voice low and a little bit commanding, <i>“turn around and get on your knees.”</i>");
	output("\n\nHer bath, her rules. You turn yourself over and lift your [pc.ass] out of the water, presenting it to Simone as you slowly rise up. Simone gives your butt a few good smacks as you get up, and laughs. Once you’re ready, she slides forward, and presses her huge boobs against your back, her nipples hard against your [pc.skinFurScales]. Simone wraps one arm around your waist, and slides it up to your [pc.chest], fondling you and giving one of your hard [pc.nipples] a good flick. You gasp, and Simone chuckles.");
	output("\n\n<i>“You ready for this?”</i> Simone asks, and slides the wet dildo down your [pc.chest], aiming its head toward [pc.vagina " + vag + "]. She flicks your nipple again, clearly enjoying herself. As close as she’s leaning against you, you can feel her pussy’s thick lips against your [pc.ass], her bulbous clit pressing between your cheeks.");
	output("\n\nYou tell Simone to get to it, and she lowers the dildo down to your crotch, and rubs its length against [pc.vagina " + vag + "]. It’s slick and warm from her mouth, and a shudder runs through you at the touch, your [pc.girlcum] dripping out to add more lube to its shaft.");
	output("\n\nSimone slowly rubs one fingertip around your [pc.nipple], and slips the dildo’s head between [pc.vagina " + vag + "]’s lips, easing it into you. You let out a moan at the slow penetration, and press yourself back against her, squishing her boobs harder against your back. She runs her tongue down the side of your neck, her breath hot against your [pc.skinFurScales].");
	output("\n\nOnce the dildo’s all the way inside you, Simone slowly starts working it in and out, pulling it until only the head is in you and driving it back in until your lips kiss the base, never ceasing her nipple play. Your [pc.hips] tremble as pleasure radiates through you, and you urge her to speed up.");
	output("\n\n<i>“Nope,”</i> Simone says with another chuckle, and runs the tip of her thick tongue along the edge of your [pc.ear], making you gasp again. <i>“Just ride it out, babe. No need to rush this.”</i>");
	output("\n\nSimone twists the dildo within you, and you moan, leaning your head back against her. This brings a ridge down the dildo’s underside in line with your [pc.clit " + vag + "], and she angles the dildo so the raised part rubs against your clit, then gives it a long, slow pull out.");
	output("\n\nThe soft but insistent friction on your [pc.clit " + vag + "] makes you cry out, and Simone pinches your [pc.nipple] as she slides the dildo back into you, picking up her pace a little. She’s breathing harder now, though nowhere near as hard as you, and grinding her hips against your [pc.ass]. [pc.Girlcum] leaks out of you with every thrust, keeping the dildo well-lubed and spilling over onto Simone’s wet hand.");
	output("\n\n<i>“Someone’s getting close,”</i> Simone whispers, and you can’t say she’s wrong. You reach back and take hold of her firm ass with one hand, urging her on, your breath coming in gasps. She licks along the side of your neck again, sending new shivers through you, and starts to flick your [pc.nipple] back and forth, faster with every push of the dildo into [pc.vagina " + vag + "].");
	output("\n\nFinally, you can’t hold back any longer. You cry out that you’re going to come, and Simone doesn’t change her pace at all, but keeps doing what’s driven you so close to the edge. After another few thrusts of her dildo, [pc.vagina " + vag + "] twitches and you shout out in orgasm, your whole body shaking, Simone holding you up as your quivering sends ripples all through the pink bathwater.");
	if (pc.girlCumQ() >= 1000) output(" [pc.Girlcum] floods out from [pc.vagina " + vag + "], spilling into the water and squirting out all around the dildo, splashing against the bathtub’s sides.");
	
	output("\n\nAfter you manage to catch your breath, Simone slowly pulls the dildo out of you, leaving you feeling empty and tired. She lifts up the dildo and licks it off, making pleased noises at the taste. Then, she sets the fake dong aside and picks up a different one from beside the tub, bright red and shaped like an ausar dick, with a big round knot at the base.");
	output("\n\n<i>“This one’s my favorite,”</i> Simone says, giving the tapered head a kiss. She points it at you, and you give it the full oral treatment, making sure it’s good and lubed for Simone’s thick-lipped pussy. Once she’s sure it’s wet enough for her, Simone hands you the dildo, and the two of you turn around until she has her toned back to you.");
	output("\n\nShe looks over her shoulder at you and says, <i>“Slide that bad boy on in,”</i> then grins. <i>“All the way. The knot’s the best part.”</i>");
	output("\n\nYou position yourself behind Simone, sliding up to her until her firm butt rests against your crotch. Then, you reach around her and trail the red dildo down between her giant boobs, leaving a wet trail down the middle of her six-pack, until it reaches the thick, slick lips of her cunt.");
	output("\n\nBefore slipping it in, you reach around and run your hand up Simone’s abs, then slide your hand up the curve of her boob and take hold of one dark nipple. Simone starts to say something, but you push the dildo’s pointed head between her lips, and her words are lost in a sharp gasp.");
	output("\n\nThe bright red toy slips between Simone’s puffy lips all at once, and you push it in past the head. She takes it with ease, and her breath catches once along the way, so you give her nipple a squeeze. Simone makes a <i>“Mmmh!”</i> noise, then tilts her hips forward, making it easier for you to drive the dildo into her.");
	output("\n\nYou slide it deep inside Simone until the knot reaches her lips, then slowly, slowly pull it out, giving her nipple a long tug the entire time. She cries out, her pussy squeezing hard on the slick dildo, so you have to pull a little harder to get it free. Once just the tip is still in her, you shove it back in quickly, all the way to the knot again, and Simone gasps.");
	output("\n\n<i>“Yes,”</i> Simone breathes. <i>“Keep doing that...”</i>");
	output("\n\nAll this attention to her pussy has brought Simone’s clit to full attention, and the rosy bud pokes up from the top of her cunt, jutting out above your hand. You push the dildo deep back into her, and right as she moans again, you twist your hand around and rub at her clit with your thumb, rolling her nipple between your fingers with your other hand.");
	output("\n\nSimone leans her head back against you and cries out again, breathing hard. <i>“The knot,”</i> she gasps. <i>“Give me... the knot!”</i>");
	output("\n\nNot quite yet. You give her clit a few more rubs, then slowly pull the dildo from her, until it’s all the way out. Then, before she can catch her breath, you push it in hard and fast, and keep pushing as the knot rubs against her puffy lips. She gasps and starts moaning again, and only grows louder as you slide the knot between her lips, slow and steady as her clit starts to visibly throb.");
	output("\n\nWith a faint ‘pop’ sound, the dildo’s knot slides between Simone’s lips, and she lets out a scream. You leave the dildo in place, as it’s clearly not going anywhere, and start rubbing her clit, running your fingers up and down its pulsing length, making Simone shriek and gasp with every touch.");
	output("\n\nHow she hasn’t come yet, you don’t know, but you can tell she’s not far off. Both her nipples are hard and swollen, and she’s bucking her hips back against you, making it hard to keep your hand on her clit. You keep rubbing her, rolling her nipple and squeezing her boob, until the dildo jerks in place as Simone’s pussy clenches tight around it.");
	output("\n\nHer orgasm makes her entire body shake, and you hold on as best you can, her toned ass quivering against you, the mound of boobflesh in your hand jiggling like crazy. It takes a moment to pass, and when it does, Simone sags against you, breathing hard.");
	output("\n\n<i>“Damn, [pc.name],”</i> Simone says, and braces herself against the side of the bath with one hand. <i>“You’re good with this thing, you know that?”</i>");
	output("\n\nYou laugh, and slowly work the dildo free of Simone’s cunt’s grip, easing the knot from between her thick lips and pulling the red shaft out of her. She licks it clean once you’re done, then looks at you and sighs.");
	output("\n\n<i>“I don’t know about you, but I needed that,”</i> she says. <i>“Still kind of sore, though. How about you give me a rubdown, and then I’ll do you?”</i>");
	output("\n\nYou and Simone rub each other down at her direction, strokes she knows to ease sore muscles and relieve tension. After that, the bath, and the orgasms, you and Simone are both feeling well and truly relaxed. She smirks at you once you’re both done.");

	output("\n\n<i>“That,”</i> she says, <i>“was a damn good time, [pc.name].”</i> She takes a deep breath and lets it out slowly. <i>“I need to get some sleep, but we need to do this again sometime soon, yeah?”</i>");
	output("\n\nThat definitely sounds like a plan. You gather your [pc.gear] and bid Simone goodbye, then return to the streets of New Texas.");

	processTime(15 + rand(15));
	
	pc.orgasm();
	pc.shower();	
	if (pc.statusEffectv1("Sore Counter") > 1 ) soreChange(-3);
	
	IncrementFlag("SEXED_SIMONE");
	IncrementFlag("TTGYM_SIMONE_MUTUAL_FAP");
	
	processTime(90 + rand(30));
	clearMenu();
	addButton(0, "Next", move, "503");		
}
public function tentongymSimoneNope():void
{
	clearOutput();
	tentongymShowSimone();
	
	if (pc.isAss())
	{
		output("You tell Simone to fuck off, you’re busy. She scoffs a little, then turns around and walks off.");
		output("\n\nAfter a few steps, Simone calls back over her shoulder. <i>“Your loss, [pc.name]. And I’ll kick your ass in the gym next time!”</i>");
	}
	else if (pc.isNice()) 
	{
		output("You tell Simone that sounds good, but you’re busy with something else right now, maybe another time.");
		output("\n\nSimone smirks again. <i>“I get you,”</i> she says. <i>“I’ll see you again sometime, stay safe out there.”</i> She starts walking off, then looks back over her shoulder. <i>“Keep lifting, I like it when you’re a challenge!”</i>");
	}
	else
	{
		output("You give Simone a wink and say you’d love to, but the planet rush worlds won’t conquer themselves.");
		output("\n\nSimone smirks again. <i>“I get you,”</i> she says. <i>“I’ll see you again sometime, unless all your adventures keep you away from the gym.”</i> She starts walking off, then looks back over her shoulder. <i>“Keep lifting, I like it when you’re a challenge!”</i>");
	}
	
	processTime(2);
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}
//betsy & victoria
public function tentongymEncounterBetsyVictoria():void
{
	clearOutput();
	tentongymShowBetsyVictoria();
	
	if (flags["MET_SHOWER_GIRLS"] == undefined)
	{
		output("As you head down the road, you hear someone call out behind you, <i>“Hey there, cutie!”</i> You don’t recognize the voice, so you turn around and look.");
		output("\n\nTwo cowgirls are walking toward you, their arms around each other. One of them is a tanned blue-eyed blonde with a figure so much the New Texas ideal she could have stepped off of a travel brochure, her huge tits almost impossibly perky, her hips wide and curvy. Her hair’s pulled back in low pigtails dangling past her shoulders. She’s wearing a flowered sundress that barely comes down far enough to cover her ass and puts her cleavage on full display.");
		output("\n\nThe other has long black hair with bangs trimmed straight above her eyebrows, and stands taller and a little less curvy, but with quite a bit more tone, clearly no stranger to the gym. She’s wearing a tight white tank top that hugs her boobs and flat stomach, and a pair of denim jeans fitted to show off the bulge between her legs.");
		output("\n\n<i>“My name’s Betsy,”</i> the blonde says, then giggles as she looks you over. <i>“And this–”</i> She pauses to squeeze her partner’s ass, prompting the other girl to spank her, hard enough to get a good smack even through Betsy’s dress. <i>“–is Victoria.”</i>");
		output("\n\n<i>“Hi,”</i> Victoria says, and gives you an appraising look. Her eyes are heavy-lidded, but she looks like she likes what she sees. <i>“We’ve seen you at the gym, but we didn’t get a chance to talk to you.”</i>");
		output("\n\nYou introduce yourself, and ask if the two are gym regulars. You think you’ve seen them, maybe in the showers.");
		output("\n\n<i>“Yep, that was us,”</i> Betsy says. She twirls a strand of hair idly around one finger. <i>“I wanted to see if you were looking for some fun there, but I wasn’t really sure.”</i>");
		output("\n\nVictoria chuckles. <i>“Quenton keeps telling us we have to leave people alone if it looks like they’re just there to use the shower.”</i>");
		output("\n\n<i>“Stupid Quenton,”</i> Betsy mutters. <i>“What’s the point of just being in there to shower?”</i>");
		output("\n\nYou start to get the idea of what these two usually do in the shower, and ask if that’s the sort of thing they do all the time.");
		output("\n\n<i>“If we feel like it, and if we feel like sharing,”</i> Victoria says. It looks like she’s about to say something more when Betsy reaches over and rubs her hand across Victoria’s crotch, making the bulge there grow.");
		output("\n\n<i>“Which is most of the time,”</i> Betsy says with a grin, <i>“ever since Vicky grew this big ol’ thing.”</i> She giggles as Victoria smiles, looking rather proud. <i>“We used to use a strapon, but I kept breaking them. I, um, get a little rough sometimes.”</i>");
		output("\n\nYou stare at Betsy for a moment, and hope she’s talking about low-tech strapons. If the girl has a habit of breaking hardlights, you might be in for a rough time.");
		output("\n\n<i>“And,”</i> Victoria says, ”</i>I always wondered what it felt like to have a cock. So I thought I’d give it a try.”</i> She strokes a hand over her bulge, with Betsy doing the same on the other side. <i>“I wouldn’t give up this thing for the world.”</i>");
		output("\n\n<i>“Sooooo,”</i> Betsy says, looking at you again, <i>“we were wondering if you wanted to come play with us. We just got a sex swing, and it’s a lot of fun, so... what do you say? You can pick who gets to be in the middle.”</i>");
	
		flags["MET_SHOWER_GIRLS"] = 1;
	}
	else
	{
		output("As you head down the road, you hear someone call out behind you, <i>“Hey there, cutie!”</i> You recognize the voice, so you turn around and look.");
		output("\n\nBetsy and Victoria are walking toward you, their arms around each other. Betsy’s wearing a flowered sundress that barely comes down far enough to cover her ass and puts her cleavage on full display, and she’s smiling at you. Victoria is wearing a tight white tank top that hugs her boobs and flat stomach, and a pair of denim jeans that seem to be fitted to show off the bulge between her legs.");
		output("\n\n<i>“How’re you doing, [pc.name]?”</i> Betsy asks, then giggles as she looks you over. <i>“It took me a second to realize that was you, since you’re not all wet and naked.”</i>");
		output("\n\n<i>“Not yet, anyway,”</i> Victoria says, and gives you a smile. Her heavy-lidded eyes only make her look more amused. <i>“How’s life?”</i>");
		output("\n\nYou tell them how you’ve been, and fill them in a little on some of your adventures. They look interested, but you can tell that there’s something else on their minds.");
		
		if (flags["SHOWER_SANDWICH"] == undefined && flags["TTGYM_BETSY_VICTORIA_HOME"] == undefined)
		{
			output("\n\n<i>“We were wondering if you weren’t just a tease,”</i> Victoria says, while Betsy sticks her tongue out at you. <i>“And if you wanted to come back to our place.”</i>");
			output("\n\n<i>“And,”</i> Betsy says, looking at you with bright eyes, <i>“we just got a sex swing. It’s a lot of fun, so... what do you say? You can pick who gets to be in the middle.”</i>");
		}
		else if (flags["TTGYM_BETSY_VICTORIA_HOME"] == undefined)
		{
			output("\n\n<i>“We were wondering if you wanted to come back to our place,”</i> Victoria says. <i>“You showed us a good time in the shower, and we want more.”</i>");
			output("\n\n<i>“And,”</i> Betsy says, looking at you with bright eyes, <i>“we just got a sex swing. It’s a lot of fun, so... what do you say? You can pick who gets to be in the middle.”</i>");			
		}
		else
		{
			output("\n\n<i>“You feel like coming back to our place again?”</i> Victoria asks. <i>“We’re always up for another round with the swing, if you are.”</i>");
			output("\n\nBetsy looks at you with bright eyes, and nods. <i>“So... what do you say? You can pick who gets to be in the middle again.”</i>");			
		}
	}
	
	processTime(5);
	
	flags["TTGYM_BETSY_VICTORIA_TIMER"] = GetGameTimestamp();	
	
	clearMenu();
	if (silly) addButton(0,"Fuck the Cows",tentongymBetsyVictoriaHome, undefined, "Fuck the Cows", "DO IT NOWS.");
	else addButton(0,"Yes",tentongymBetsyVictoriaHome, undefined);
	addButton(1,"Nope",tentongymBetsyVictoriaNope, undefined,"Nope","Tell the girls you’re not interested right now, but you might be some other time.");
	addButton(14,"Never",tentongymBetsyVictoriaNever, undefined,"Never",((flags["TTGYM_BETSY_VICTORIA_HOME"] != undefined ? "You’ve changed your mind... " : "") + "Tell the girls they’re not your type. They won’t bother you ever again."));
}
public function tentongymBetsyVictoriaNope():void
{
	clearOutput();
	tentongymShowBetsyVictoria();
	
	output("You tell the girls you’re not up for that right now.");
	
	if (pc.isAss())
	{
		output(" But you tell them to make sure they keep their cunts wet, so they’re ready when you want it.");
	}
	else if (pc.isNice()) 
	{
		output(" But you’re flattered, and make sure they know you might be good to join them some other time.");
	}
	else
	{
		output(" But you just might be good to join them some other time, if they’re lucky.");
	}
	
	output("\n\n<i>“Aww, that’s too bad,”</i> Betsy says, then looks to Victoria, her eyes suddenly bright. <i>“Hey, if we’re not bringing [pc.himHer] home, can we use that other thing you just bought?”</i>");
	output("\n\n<i>“Yes, yes we can,”</i> Victoria says, then takes hold of her girlfriend’s ass again as they walk away. <i>“We’ll see you some other time, [pc.name], in case you change your mind.”</i>");
	
	processTime(2);
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}
public function tentongymBetsyVictoriaNever():void
{
	clearOutput();
	tentongymShowBetsyVictoria();
	
	if (flags["TTGYM_BETSY_VICTORIA_HOME"] != undefined) output("Even after trying the goods, you have decided to change your mind... ");
	
	if (pc.isAss())
	{
		output("You tell the cowgirls to fuck off and not bother you again. You don’t want to fuck them now or ever.");
		output("\n\n<i>“Well, shit,”</i> Victoria says, frowning at you as Betsy lowers her eyes. <i>“If I’d known you were such an asshole, I wouldn’t have asked.”</i> She and Betsy turn and walk away without another word.");		
	}
	else if (pc.isNice()) 
	{
		output("You tell Betsy and Victoria that you’re really flattered, but they’re not your type, and you’re not interested in having sex with them.");
		output("\n\n<i>“Aww, that’s too bad,”</i> Betsy says, sticking out her lower lip as she pouts. <i>“I thought you looked like a lot of fun.”</i> She waves to you as she and Victoria walk off.");		
	}
	else
	{
		output("You tell the girls that it’s really flattering that they came to you out of everyone on New Texas, but you’re just not into them. It’s not them, it’s you.");
		output("\n\n<i>“Aww, that’s too bad,”</i> Betsy says, sticking out her lower lip as she pouts. <i>“I thought you looked like a lot of fun.”</i> She waves to you as she and Victoria walk off.");
	}

	flags["TTGYM_BETSY_VICTORIA_NEVER"] = 1;
	
	processTime(2);
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}
public function tentongymBetsyVictoriaHome():void
{
	clearOutput();
	tentongymShowBetsyVictoria();
	
	moveTo("NT TTGG APARTMENT");
	
	if (flags["TTGYM_BETSY_VICTORIA_HOME"] == undefined)
	{
		output("The two cowgirls share a devious look after you say you’ll help them test the swing, and for a moment you wonder what you’ve gotten yourself into. You don’t have much time for that, though, as they each take hold of one of your arms and lead you down a nearby street, off down a long road that leads behind the hills and toward a few blocks of houses and apartment buildings.");
		output("\n\n<i>“You’re going to lo–ove this thing, [pc.name],”</i> Betsy says, her boob squishing against your arm as she leans against you. <i>“We got it about a week ago, and Vicky’s had me in it every morning.”</i> She pauses. <i>“And some nights. Not every night, because we don’t want to get tired of the swing when it’s still new.”</i>");
		output("\n\n<i>“Good thing it’s got strong ropes,”</i> Victoria says, and chuckles a little. Her hand slides down your back to your [pc.ass], and stays there as the three of you walk toward a pale tan tower, the girls’ apartment building.");
		output("\n\nThey lead you through the lobby, where there’s a desk sitting empty and the sound of skin smacking on skin coming from an open door behind it. Right as you reach the elevators, a cowgirl’s moan comes out of the office, and Betsy and Victoria both laugh.");
		output("\n\n<i>“Wonder who the manager’s got in the office this time,”</i> Betsy says with a giggle. <i>“I’m still kind of sad he wouldn’t join us.”</i>");
		output("\n\nWait, another local didn’t want a threesome with them? That’s a surprise, so you ask about it.");
		output("\n\nVictoria grabs at her crotch with her free hand, squeezing her cock through her jeans. <i>“He’s kind of a picky guy. He couldn’t deal with anyone else in the room having a dick.”</i>");
		output("\n\nBetsy laughs, leaning against you harder, her thick thigh rubbing against you. <i>“I think he was just mad yours is bigger.”</i>");
		output("\n\nThe elevator arrives, and the three of you step into it, and Victoria tells it to take you to the sixth floor. As soon as the doors close, she turns and moves in close to you, pressing her chest against your [pc.chest], her nipples sticking out beneath the white fabric. Betsy steps behind you and wraps her arms around your [pc.hips], her boobs rubbing against your back.");
		output("\n\n<i>“How many times have we fucked in this elevator, Vicky?”</i> Betsy asks, somehow making it sound like a normal, everyday thing to say. Which it probably is for them.");
		output("\n\n<i>“Not sure, babe,”</i> Victoria says, so close you can feel her breath on your [pc.ear]. <i>“But we’ve lived here long enough, I think we’ve fucked in all the elevators.”</i>");
		output("\n\nBeing stuck between the two cowgirls is making your [pc.nipples] hard, and from the look on Victoria’s face, you know she can feel them poking into her boobs, just as you can feel hers. Blood surges into [pc.eachCock], and you start to grow hard. Betsy’s hands drift toward your crotch as Victoria rubs her own hardening cock against your [pc.thigh].");
		output("\n\nThe elevator dings, and the doors slide open. Victoria turns away from you and takes your arm again, and Betsy slides aside, rubbing her tits on you again as she holds onto your other arm. The three of you step into the hallway, you and Victoria both sporting obvious bulges.");
		output("\n\nBetsy opens the door to their apartment, and you step inside, right into what looks like a porn shoot set inside a sex shop. Most of the place is taken up by their living room, which is decorated with porn star posters on the walls. One wall is nothing but a shelf displaying dildos of all colors, shapes, and sizes, organized from small to ridiculously huge, ranging from human and horse-shaped to shapes so bizarre you’re not sure what creature’s dick they’re supposed to look like, if anything.");
		output("\n\nA 3D-holo system sits in one corner, surrounded by two couches and a chair, with a menu displayed that shows a long list of porn titles. There’s also some kind of recording device attached to it, and you wonder if they make their own porn as well. The small kitchen is littered with barbeque and pizza boxes, making it clear that neither of them cooks and why they both spend a lot of time at the gym.");
		output("\n\nThe entire place smells like sex, like they’ve fucked on every available surface and against most if not all of the walls. It seems like whenever they move out, the apartment will have to be cleaned with some kind of nanotech to get their scents out of it.");
		output("\n\n<i>“Home sweet home,”</i> Betsy says, giving your arm another boob-squeeze as she walks through the door. <i>“You like it, [pc.name]?”</i>");
		output("\n\nBefore you can answer, Victoria plants her hand on your [pc.ass] again, and gives you a little bit of a push. <i>“[pc.HeShe] can check out our collection later,”</i> she says. <i>“Let’s show [pc.himHer] the swing.”</i>");
		output("\n\nBetsy nods rapidly, and the two cowgirls lead you through the door to their bedroom. A giant bed takes up about half the room, big enough for four people, with blankets and sheets strewn everywhere. Two nightstands sit on either side of the bed, one with a foot-long horsecock dildo sitting on it, the other with a foot-long onahole laying there.");
		output("\n\nOnce you’re inside, Victoria points to one corner of the room, where an arrangement of straps, loops, and pads hangs from the ceiling. The sex swing’s clearly made to hold just one person, and it looks more comfortable than you expected, though you can tell getting into it is going to be interesting.");
		output("\n\n<i>“There it is,”</i> Betsy says with a giggle. <i>“Oh, this is going to be fun.”</i> She steps toward the swing, then grabs the bottom hem of her dress and yanks it up over her head, revealing she was completely naked underneath. Her tanned body seems like nothing but curves, from her shapely thighs to her bouncy butt to her plump, fat tits and their pink nipples. She swishes her tail back and forth, then turns and walks toward you, running her fingers over both her nipples.");
		output("\n\n<i>“Well?”</i> Betsy asks, looking back and forth between you and Victoria. <i>“I’m waiting!”</i>");
		output("\n\nYou strip out of your [pc.gear] as quickly as you can, and watch Victoria pull her tank top over her head, revealing her round, firm boobs and fit figure beneath. She looks you in the eye as she reaches for her jeans and pulls open the fly, her horsedong still bulging beneath the denim. She drops her jeans all at once, letting them slide down her toned thighs and crumple to the floor. Her cock, free from her pants, rises slowly to point at you, grown to a full foot and full hardness.");
		output("\n\n<i>“So, [pc.name],”</i> Victoria says, <i>“we’ll let you pick. Who’s in the swing? So long as you know, if it’s you, you get to suck me off.”</i> She grins, and Betsy giggles, looking back and forth between the two of you as she waits for you to decide.");
	}
	else
	{
		output("The two cowgirls share a devious look after you say you’re up for another round with the swing with them. They each take hold of one of your arms and lead you down a nearby street, then down the long road that goes behind the hills.");
		output("\n\nBy the time you reach their apartment building, they each have a hand on one half of your [pc.ass], and their hard nipples are sticking out. They lead you through the lobby, where there’s a desk sitting empty and the sound of skin smacking on skin coming from an open door behind it. Right as you reach the elevators, a cowgirl’s moan comes out of the office, and Betsy and Victoria both laugh. Sounds like the manager’s got someone in there, as usual.");
		output("\n\nThe elevator arrives, and the three of you step into it, and Victoria tells it to take you to the sixth floor. As soon as the doors close, she turns and moves in close to you, pressing her chest against your [pc.chest], her nipples sticking out beneath the white fabric. Betsy steps behind you and wraps her arms around your [pc.hips], her boobs rubbing against your back.");
		output("\n\n<i>“Sure you don’t want to take [pc.name] in the elevator, Vicky?”</i> Betsy asks, somehow making it sound like a normal, everyday thing to say. Which it probably is for them.");
		output("\n\n<i>“Not this time, babe,”</i> Victoria says, so close you can feel her breath on your [pc.ear].");
		output("\n\nBeing stuck between the two cowgirls is making your [pc.nipples] hard, and from the look on Victoria’s face, you know she can feel them poking into her boobs, just as you can feel hers. Blood surges into [pc.eachCock], and you start to grow hard. Betsy’s hands drift toward your crotch as Victoria rubs her own hardening cock against your [pc.thigh].");
		output("\n\nThe elevator dings, and the doors slide open. Victoria turns away from you and takes your arm again, and Betsy slides aside, rubbing her tits on you again as she holds onto your other arm. The three of you step into the hallway, you and Victoria both sporting obvious bulges.");
		output("\n\nBetsy opens the door to their apartment, and you step inside, to the living room decorated with porn posters and the wall of dildos. The entire place still smells like sex, like they’ve fucked on every available surface and against most if not all of the walls. By now, it’s familiar, and you wonder if it’ll start smelling like you too if you come here often enough.");
		output("\n\n<i>“Home sweet home,”</i> Betsy says, giving your arm another boob-squeeze as she walks through the door. <i>“Let’s hit the swing!”</i>");
		output("\n\nVictoria plants her hand on your [pc.ass] again, and the two cowgirls lead you through the door to their bedroom. The familiar arrangement of straps, loops, and pads hangs from the ceiling in one corner.");
		output("\n\n<i>“Here we go,”</i> Betsy says with a giggle. She steps toward the swing, then grabs the bottom hem of her dress and yanks it up over her head, revealing she was completely naked underneath. Her tanned body seems like nothing but curves, from her shapely thighs to her bouncy butt to her plump, fat tits and their pink nipples. She swishes her tail back and forth, then turns and walks toward you, running her fingers over both her nipples.");
		output("\n\n<i>“Well?”</i> Betsy asks, looking back and forth between you and Victoria. <i>“I’m waiting!”</i>");
		output("\n\nYou strip out of your [pc.gear] as quickly as you can, and watch Victoria pull her tank top over her head, revealing her round, firm boobs and fit figure beneath. She looks you in the eye as she reaches for her jeans and pulls open the fly, her horsedong still bulging beneath the denim. She drops her jeans all at once, letting them slide down her toned thighs and crumple to the floor. Her cock, free from her pants, rises slowly to point at you, grown to a full foot and full hardness.");
		output("\n\n<i>“So, [pc.name],”</i> Victoria says, <i>“time to pick. Who’s in the swing? Just remember, if it’s you, you get to suck me off.”</i> She grins, and Betsy giggles, looking back and forth between the two of you as she waits for you to decide.");
	}	
	
	IncrementFlag("TTGYM_BETSY_VICTORIA_HOME");
	
	processTime(30);
	pc.changeLust(30);
	
	clearMenu();	
	addButton(0, "Betsy", penisRouter, [tentongymBetsyVictoriaHomeBetsy, 99999, false, 0]);
	addButton(1, "Victoria", penisRouter, [tentongymBetsyVictoriaHomeVictoria, 99999, false, 0]);
	addButton(2, "Me", penisRouter, [tentongymBetsyVictoriaHomeSteele, 99999, false, 0]);	
}
public function tentongymBetsyVictoriaHomeBetsy(kok:int=0):void
{
	clearOutput();
	tentongymShowBetsyVictoria(true);	
	
	output("You tell the girls you want Betsy to be on the swing. She looks at Victoria, and asks with an eager smile, <i>“Face up or face down?”</i>");
	output("\n\n<i>“Face down, babe,”</i> Victoria says, and holds two of the swing’s straps in place. <i>“You know how this one goes.”</i>");
	output("\n\n<i>“Yes I do,”</i> Betsy says with a giggle, and slips under Victoria’s arms to get herself into the swing. She lays down flat on the main pad, then slides her thick thighs into place beneath the straps Victoria’s holding, leaving her legs spread to either side. Her boobs hang down, her nipples hard, and she slips her arms into the swing’s other two straps, leaving her suspended from the ceiling.");
	output("\n\nVictoria gives Besty a little push, making her swing forward and back, and Betsy laughs, her boobs and butt jiggling the entire time. Then, as Betsy’s swinging back toward her, Victoria holds her hand even with Betsy’s crotch, two fingers extended.");
	output("\n\n<i>“Oooohh...”</i> Betsy moans as Victoria’s fingers slide into her, the swing taking her right back onto her girlfriend’s hand. Victoria gives you a smile as Betsy swings toward you, and motions for you to get into place on Betsy’s other end.");
	output("\n\n<i>“She’s only going to swing harder once we get going,”</i> Victoria says as you position yourself, close enough for Betsy to reach you but not so close that she crashes into you. Once you’re there, Victoria adjusts the swing’s upper straps, putting Betsy at the right angle so her face is right in line with your erect [pc.cock " + kok + "].");
	output("\n\n<i>“Hello there,”</i> Betsy says with another giggle, and gives your [pc.cockHead " + kok + "] a kiss as she swings toward it. Her tongue trails off of it as she swings away, and she moans again as Victoria slides three fingers into her this time.");
	output("\n\nVictoria catches Betsy with one hand on her round ass, then pulls her fingers free and rubs Betsy’s fluids up and down her horsecock. She looks at you to make sure you’re in place, then plants her other hand on Betsy’s hip and slides herself in.");
	output("\n\nBetsy gasps, her voice breaking for a second as Victoria’s foot-long dick slips between her pussy lips all at once. Victoria’s hips slap against Betsy’s ass, sending her swinging forward, bringing her lips right up to your cock again.");
	output("\n\nBetsy wraps her lips around your [pc.cockHead " + kok + "] as soon as she’s close, her tongue sliding over the tip. She has just enough time to close her eyes and look like she’s enjoying it before she swings back, Victoria’s cock filling her once again.");
	output("\n\nYou need more of that. You take a step forward, and catch Betsy’s tits when she swings toward you again, stroking her plush boobs and bringing your [pc.cock " + kok + "] closer to her. She takes your [pc.cockHead " + kok + "] into her mouth again, and her jugs fly forward, sliding around your shaft for just a second before she swings back.");
	output("\n\n<i>“Aww...”</i> Betsy’s dismay turns into another moan as she takes Victoria up to the hilt again, and she says, <i>“Move closer, Vicky, I can’t give [pc.himHer] a good titf–”</i>");
	output("\n\nYour [pc.cockHead " + kok + "] popping between Betsy’s lips again keeps her from finishing her sentence, but Victoria steps forward, shoving her horsecock in deep again and keeping Betsy from swinging back and forth so much.");
	output("\n\nBetsy moans around your head, and you hold her tits loosely around your [pc.cock " + kok + "]. She swings back again, but not as much, so she doesn’t lose her lips’ hold on your dong. Victoria starts pounding into Betsy’s pussy, shorter and faster thrusts now, sending Besty’s tits slapping against your crotch, your [pc.cock " + kok + "] caught between her tanned globes.");
	output("\n\nThat’s more like it. Betsy’s eyes close as she bobs her head up and down on your [pc.cockHead " + kok + "], her tongue hard at work all over it, and you give her nipples a pinch every time she swings forward, making her moan. Victoria’s tight abs flex as she fucks her girlfriend, half of her horsecock slamming into Betsy over and over again, the motion making Betsy titfuck you with every thrust.");
	output("\n\nBetsy makes a <i>“mmmmm”</i> sound, and pulls her arms free of the swing’s straps, reaching down past her boobs to your [pc.sheath " + kok + "]. She strokes along the bottom of your [pc.cock " + kok + "], squeezing you with every slide forward. Your entire cock is caught up in three different sensations – her hot, slick lips and tongue on your head, her soft tits on your shaft, and her fingers massaging your [pc.sheath " + kok + "]. You groan, and thrust harder between her boobs, pushing more of your [pc.cockHead " + kok + "] into her mouth.");
	output("\n\nVictoria’s hands clench on Betsy’s bouncy butt, and she takes a deep breath, then leans forward and starts thrusting harder. Betsy yelps around your [pc.cockHead " + kok + "], her eyes snapping open, her mouth opening wider. She swings forward again, driven by Victoria’s hips slamming against her ass, and you squeeze her tits harder around your shaft as more of it disappears into her mouth.");
	output("\n\nBetsy releases your [pc.sheath " + kok + "] and reaches down, taking hold of her own tits and pressing them even tighter around your dick. She lifts her head up, and smiles up at you.");
	output("\n\n<i>“Pull my hair back!”</i> she says, her voice shaky from Victoria’s pounding, then licks her lips. <i>“If you’re gonna come in my mouth, it feels soooo much better when you do that!”</i>");
	output("\n\nVictoria chuckles, and grins at you when you look at her. There’s a fine sheen of sweat on her firm boobs and toned body, and her thrusts never stop, only growing more and more intense. <i>“Girl’s got her little kinks,”</i> she says.");
	output("\n\nThe extra squeeze Betsy’s putting on your [pc.cock " + kok + "] with her tits is only bringing you closer to coming, so you take hold of the blonde’s pigtails and pull them back. Betsy moans again as she slurps your [pc.cockHead " + kok + "] back between her lips, and she closes her eyes, a look of utter bliss on her face.");
	output("\n\nAcross from you, Victoria starts to gasp, and the look of concentration on her face makes you think she’s getting close. You’re not too far behind, and there’s no telling where Betsy is, though her moaning around your [pc.cock " + kok + "] seems like a good sign. You thrust harder between her boobs and into her mouth, and she starts making short, high sounds, her tongue never stopping as it massages your [pc.cockHead " + kok + "].");
	output("\n\nFinally, Victoria’s whole body tenses, and she slams her hips against Betsy’s ass once, twice, a third time, then shouts out as she comes, making Betsy shake against you with her rapid thrusts. The motion makes Betsy cry out around your cock, shaking and moaning as her orgasm hits her, and that’s enough to drive you over the edge.");
	output("\n\nYour whole body shivers as your [pc.cock " + kok + "] twitches between Betsy’s boobs, and your [pc.cockHead " + kok + "] explodes into her, shooting a long stream of [pc.cum] down her throat. Betsy pulls back after the first stream, and catches the second one on her tits, splattering her giant boobs with sticky [pc.cumColor].");
	if (pc.cumQ() >= 1000) output(" Your [pc.cock " + kok + "] keeps shooting off, stream after stream, until you’ve completely covered Betsy’s tits and face. She drops her head back down to suck up more of your [pc.cum], but even she can’t swallow it all.");
	
	output("\n\nIt takes a long moment and a few more swinging thrusts from Victoria before all three of you catch your breath. [pc.Cum] drips from Betsy’s boobs, and long streams of Victoria’s cum slide out of her pussy, staining the floor on both ends of her. Victoria pulls out of her with a long sigh, her horsecock slowly wilting.");
	output("\n\n<i>“Now that’s a workout,”</i> Victoria says, then takes a deep breath and laughs. <i>“You all right, babe?”</i>");
	output("\n\n<i>“That felt sooooo good, Vicky,”</i> Betsy says, sounding out of breath. <i>“You too, [pc.name].”</i> She hefts one of her boobs up to her mouth, licking more of your [pc.cum] off of it. <i>“So good....”</i>");
	output("\n\nYou and Victoria help Betsy out of the swing, and since she’s a little wobbly, you help hold her up while Victoria licks the rest of your [pc.cum] off of her tits.");
	if (pc.cumQ() >= 1000) output(" There’s no way they could get up all the [pc.cum] you spilled all over the floor, though.");
	
	output("\n\nThe three of you help each other get cleaned up, and once you’re done, Betsy looks to have recovered a little. <i>“Can we do that again, [pc.name]? Sometime soon?”</i> Victoria nods, and gives you a questioning look.");
	output("\n\nYou tell them that you definitely will. You gather your gear and head out, back to the streets of New Texas.");
		
	processTime(10 + rand(10));
	
	chars["BETSY"].loadInMouth(pc);
	pc.orgasm();
	
	IncrementFlag("TTGYM_BETSY_VICTORIA_SEXSWING");
	
	processTime(30 + rand(15));
	clearMenu();
	addButton(0, "Next", move, "503");	
}
public function tentongymBetsyVictoriaHomeVictoria(kok:int=0):void
{
	clearOutput();
	tentongymShowBetsyVictoria(true);	
	
	output("You tell the girls you want Victoria to be on the swing. Betsy laughs out loud, and rubs her palms together, a giddy look on her face.");
	output("\n\n<i>“Oooh, good,”</i> she says. <i>“You two get ready. I’m gonna get Mister Nubby.”</i> She runs out of the bedroom, her tanned ass bouncing with every step.");
	output("\n\nYou give Victoria a curious look, but she just chuckles. <i>“You’ll see when she gets back,”</i> she says. Victoria starts pulling herself into the swing, sliding onto the main pad and slipping her legs through the two larger loops, which have pads for supporting her calves. Her horsecock wobbles back and forth as she gets herself set, and then she leans back, sliding her arms into the swing’s smaller loops.");
	output("\n\nOnce Victoria’s in place, her head is on the same level as your crotch, and she tilts her head back toward you. Victoria plants a kiss right on your [pc.cockHead " + kok + "], and licks all the way across and around it, making you groan. She shifts her weight, making herself swing toward you, and holds her tongue out to run it down the length of your [pc.cock " + kok + "], all the way to your [pc.sheath " + kok + "].");
	output("\n\nYou get yourself positioned behind Victoria, so she can slide your dick right into her mouth, and she nods her approval. She leans back farther, kissing along your [pc.sheath " + kok + "]");
	if (pc.balls > 0) output(", then running her tongue back and forth over your [pc.balls]");
	output(". Your [pc.cock " + kok + "] stands up straight, hard as it’s ever been, and you reach down and take hold of Victoria’s firm, round tits, stroking them as she licks and kisses over every inch of your [pc.crotch]. She licks her way back up your shaft, moaning with every breath as you massage her chest.");
		
	output("\n\n<i>“Okay, got him!”</i> Betsy runs back into the room holding a dildo that’s about ten inches long and easily three inches wide, covered with flexible nubs that stick out all over it. In her other hand, she has some kind of heavy-duty thong with a ring on the front of it. <i>“You ready for this, Vicky?”</i>");
	output("\n\nVictoria gives your [pc.cock " + kok + "] a final slurp and looks up at Betsy. <i>“For that thing, babe? Always,”</i> she says, and spreads her legs apart, her cock bobbing above her crotch.");
	output("\n\nBetsy giggles, then tucks the dildo between her tits and pulls on the other item. It’s some kind of dildo harness, and as she prepares it, you see a round, wide ball on the inside, made to fit into her pussy when she’s wearing it. Sure enough, there’s a wet *pop* sound as Betsy pulls the harness all the way on, and she lets out a moan and giggle, then reaches down to her crotch and fiddles with the thing for a second.");
	output("\n\nA faint humming rises from Betsy’s harness. The ball must be vibrating. She pulls the bumpy dildo out from between her boobs, and mounts it on the front of her harness, then runs her hands up and down its thick length. <i>“Hope so,”</i> she says, <i>“because he’s all ready for you!”</i>");
	output("\n\nVictoria laughs, then leans her head back again and takes your [pc.cockHead " + kok + "] between her lips, sucking on it as Betsy moves into place between her legs. You give Victoria’s boobs another squeeze, then start rubbing her nipples as Betsy moves in.");
	output("\n\nBetsy lifts up Victoria’s foot-long horsedong and tucks its head between her tits, then shifts her curvy hips forward and slides the nubby dildo into Victoria’s pussy, tilting her head back and moaning as it goes inside. Victoria makes a deep, low sound around your cock’s head, her lips squeezing it tight, her eyes going half-closed.");
	output("\n\nSuspended as she is, Victoria swings toward you as Betsy penetrates her, and your [pc.cock " + kok + "] slips deeper into her mouth, your length sliding into her as you groan. Betsy pushes her dildo all the way into Victoria, her hands holding tight to Victoria’s hips, her arms squishing her huge boobs out in front of her and mashing Victoria’s cock between them.");
	output("\n\nIt takes her a few strokes to get a rhythm going, but soon the two of you have Victoria swinging back and forth on the two dicks, your length slipping in and out of her mouth up to the head and back, Betsy’s bumpy dildo going deep into Victoria’s cunt and coming halfway out again, the raised parts rubbing her sticky lips with every thrust. Victoria moans again and again around your [pc.cock " + kok + "], her tongue thrashing up and down your shaft. She drops one hand from holding onto the sex swing’s ropes and reaches around to grab your [pc.ass], squeezing it hard as she pulls herself closer to you, taking more of your [pc.cock " + kok + "] down her throat.");
	output("\n\n<i>“That looks so good,”</i> Betsy breathes, and picks up her pace, pushing harder and deeper into her girlfriend. She lowers her head and sticks her face between her tits, licking Victoria’s cock-head as she thrusts. Victoria lets out a long moan, her whole mouth vibrating around your [pc.cock " + kok + "]. She starts thrusting her hips, trying to better get titfucked and sucked while she’s getting fucked at the same time.");
	output("\n\nYou keep up your squeezing on Victoria’s boobs and nipples, and add your moan to the girls’, exulting in the sensation of Victoria’s tongue and lips hard at work on your cock. The back-and-forth of the sex swing means she never stays too long on any one area, going from shaft to head and back again in a constant motion, always finding new places to focus on.");
	output("\n\nAcross from you, Betsy keeps thrusting the nubby dildo deep into Victoria, her hips slapping against her girlfriend’s toned legs as she pounds away, her hands holding tight to Victoria’s hips. She keeps her face buried in her own cleavage, and you watch as she lavishes attention on Victoria’s horsecock, the flat head shiny with spit, Betsy gasping softly as she licks away.");
	output("\n\nVictoria’s fit abs flex as she holds herself in place, her grip tightening on your [pc.ass] as she swings back and forth, pulling still more of your [pc.cock " + kok + "] into her mouth. Getting deep-throated from this position feels amazing, and you feel your orgasm building at your base. You give Victoria’s nipples another squeeze and focus, determined to hold on.");
	output("\n\nBetsy starts to breathe faster, then moans again, louder and louder as her pace picks up. Between the three of you, she’s going to come first? It looks that way, as she’s hammering the dildo into Victoria with a frenzy, her face still stuck between her own tits. Victoria gasps around your dick, her legs quivering.");
	output("\n\nFinally, Betsy slams her hips hard against Victoria, then throws her head back and screams, her whole body shaking, her eyes squeezed shut. Victoria groans around your [pc.cock " + kok + "] a moment later, and her cock sprays out from between Betsy’s tits, shooting streams of white all over Betsy’s face and tanned globes. She gives you one last hard suck, and that’s enough to drive you over the edge.");
	output("\n\n<i>“Pull out, [pc.name]! Come on her!”</i> Betsy says, and you have just enough control to do that.");
	output("\n\nYou whip your [pc.cock " + kok + "] out of Victoria’s mouth and barely have time to aim it at her firm boobs before you explode, your whole body shaking as the orgasm hits you, [pc.cum]");
	if (pc.cumQ() >= 1000) output(" splattering all over Victoria’s tits, then spraying on to cover Betsy as well, leaving both cowgirls drenched and dripping [pc.cumColor].");
	else output(" splattering all over Victoria’s tits, dripping down toward her shoulders as she hangs there in the swing.");
		
	output("\n\nThe three of you stand there for a moment, all breathing hard, until Victoria finally groans and pulls herself up, [pc.cum] dripping all down her. <i>“Oh, fuck yeah,”</i> she breathes, then leans forward and gives Betsy a messy kiss. The two of them start licking Victoria’s cum and yours off of each other, and the sight’s nearly enough to make you hard again.");
	if (pc.cumQ() >= 1000) output(" It takes them a while to get anywhere near clean, and they’re both dripping your [pc.cum] all over the floor, but they don’t seem to mind at all.");
	
	output("\n\nBetsy slowly pulls the bumpy dildo out of Victoria and turns off the harness’s vibrator, then gives you a dazed look. <i>“That was sooooo good,”</i> she breathes, then hefts up one of her boobs and licks off a splash of cum that Victoria missed. <i>“The swing was a good idea, wasn’t it, [pc.name]?”</i>");
	output("\n\nYou’re still trying to catch your breath, but you can tell them that yes, you think the swing was a great idea. Victoria chuckles at you, and licks her lips as she looks at Betsy.");
	output("\n\n<i>“I think everybody likes the swing, babe,”</i> she says, then looks at you. <i>“You going to come by and give it another round sometime?”</i>");
	output("\n\nYou tell them that you definitely will. The three of you finish cleaning each other up, and you gather your gear and head out, back to the streets of New Texas.");
	
	processTime(10 + rand(10));
	
	pc.orgasm();
	
	IncrementFlag("TTGYM_BETSY_VICTORIA_SEXSWING");
	
	processTime(30 + rand(15));
	clearMenu();
	addButton(0, "Next", move, "503");	
}
public function tentongymBetsyVictoriaHomeSteele(kok:int=0):void
{
	clearOutput();
	tentongymShowBetsyVictoria(true);	
	
	output("You tell the girls you want to be on the swing. Victoria lets out a low chuckle, then pats the side of her fully-engorged horsecock. <i>“All right then, [pc.name]. Hope you’re thirsty.”</i>");
	output("\n\nBetsy giggles, and heads for the bedroom door. <i>“Help [pc.himHer] into the swing, okay? I’m gonna get Mister Knotty.”</i>");
	output("\n\nVictoria helps you get into the swing, starting with you laying face-down on the main pad and getting your [pc.legs] into the straps, which leaves you hanging there in midair. [pc.EachCock] hangs down, hard and swinging");
	if (pc.balls > 0)
	{
		output(", and your [pc.balls] dangle freely behind");	
		if (pc.cockTotal() > 1) output(" them.");
		else output(" it.");
	}
	output(" You’re right on the level with Victoria’s chest, and once you’re stable, she presses your face right between her boobs and holds you there for a moment.");
	
	output("\n\n<i>“Been looking forward to this,”</i> she says, squeezing you between her firm, bouncy tits. You flick out your [pc.tongue], running it over her soft skin, but there’s not much you can do, trapped in her cleavage as you are.");
	output("\n\nVictoria only chuckles again, then frees you from her chest as Betsy hurries back into the room, jiggling with every step. She’s holding a long, thick dildo with three knots, bigger toward the base and going smaller as it heads toward a tapered tip. It looks like it’s based off a kui-tan penis, though seeing one without the race’s giant balls beneath looks kind of odd.");
	output("\n\n<i>“Don’t start without me,”</i> Betsy says as she walks over to Victoria, a teasing tone in her voice. She steps between the two of you, then bumps Victoria back with her butt. <i>“Slide this in for me, Vicky?”</i>");
	output("\n\nYou pull back as much as you can, so you don’t miss the show. Victoria takes the knotty dildo from Betsy and slides it down between her girlfriend’s huge boobs, the knots popping through her cleavage and making her bounce. Then, she presses the pointed tip against Betsy’s pussy and slowly pushes it into her.");
	output("\n\nBetsy starts to moan as soon as it’s inside, and her voice hitches as the first knot passes between her lips. Her pink nipples get harder. Victoria tweaks one of them as she pushes the dildo in farther, Betsy’s lips parting to take in the second knot. She gasps, but it goes in without even slowing down, her pussy stretching around it with ease. Betsy leans back against Victoria, and lifts one leg, spreading herself wider.");
	output("\n\nWith one final shove, Victoria slides the knotty dong all the way into Betsy’s twat, where a wide flare keeps it in place. Betsy’s whole body shudders as she moans again, and Victoria reaches around the dildo’s base, her fingers questing. There’s a faint ‘click’, and then a humming sound rises from the dildo. Betsy shivers as the thing starts vibrating in her, and giggles again.");
	output("\n\n<i>“Thank you!”</i> She gives Victoria a quick kiss, first on the lips and then on the head of her dick, then turns to you. <i>“She’s all yours now, [pc.name].”</i> You can hear the lust in her voice, and you wonder how long she’ll keep that buzzing, knotty dong up in her without coming.");
	output("\n\nVictoria helps you get your arms into the swing’s straps, and adjusts the height and angle, bringing your head from being level with her cleavage to level with her cock. You end up with her foot-long horsedong right in your face, the flat head wet from Betsy’s kiss. A quick glance up at Victoria shows she’s got a pleased smile on her face, like she can’t wait to watch you get started.");
	output("\n\nOnce you’re in place, Betsy kneels under you, and starts to lick all up and down your [pc.cock " + kok + "]. Her tongue slides up and down your shaft, then down to your [pc.cockHead " + kok + "], and she moans as her lips slip around it, starting you off with a good, hard suck.");
	output("\n\nYou open your mouth to moan, and Victoria takes that as an invitation, pressing her cock’s head against your [pc.lips] and into your mouth. The smell is intoxicating, musk and sexy cowgirl mixed together, and you open wide, taking her head in and running your [pc.tongue] all over it, mimicking what Betsy’s doing to your [pc.cockHead " + kok + "]. Victoria lets out her breath, and runs a hand over your [pc.hair], then plants her hand on the back of your head and steps closer, sliding more of her dong into your mouth.");
	output("\n\nBeneath you, Betsy suckles away at your [pc.cockHead " + kok + "], moaning around your length as her knotty dildo buzzes away inside her. She has the whole head inside her mouth, and is working her way up your shaft, taking more of you into her a little at a time, keeping up a steady sucking.");
	output("\n\nVictoria’s grip on you isn’t a strong one, so you start bobbing your head forward and back, getting some motion going from the swing. It feels like floating, like only her cock in your mouth is holding you up, and you let it slide in and out in slow strokes, your tongue whipping around the head as it goes in, your [pc.lips] closing tight around the flat head when that’s all you can reach.");
	output("\n\n<i>“Not bad, [pc.name],”</i> Victoria says, her voice lower than usual as you keep sucking her. <i>“Now let’s take it up a notch.”</i>");
	output("\n\nVictoria takes hold of the swing’s ropes and pulls you forward, sliding even more of her horsecock into your mouth, the head passing your tongue as she tries to make you deep-throat her. Betsy gasps as more of your own [pc.cock " + kok + "] gets pushed into her mouth, and you feel her gasp and struggle around your shaft, sending waves of pleasure through you even as you try to catch your breath.");
	output("\n\n<i>“Deeper’s always better,”</i> Victoria says, tilting her head back and sighing. <i>“Keep going!”</i>");
	output("\n\nNot like you can go anywhere, not hanging from the ceiling with your own cock trapped deep in Betsy’s mouth. She moans again around your [pc.cock " + kok + "], hands stroking at your [pc.base]");
	if (pc.balls > 0) output(" and [pc.balls]");
	output(", and the buzzing from her dildo never stops. You can feel your orgasm building, but you don’t want to blow it just yet. Your [pc.hips] thrust a little, driving your dong deeper into her.");
	
	output("\n\nVictoria has the same idea, flexing her toned stomach and swinging her hips toward you, and you open wider to fit more of her cock into your mouth. All you can do right now is suck on the shaft and lavish your [pc.tongue]’s attention on it, but her heavy breathing shows that it’s working. Both her nipples are hard as rocks, and her hand clenches in your [pc.hair], urging you on.");
	output("\n\nBetsy moans around your [pc.cock " + kok + "] again, her voice higher, her gasping growing more rapid. It feels like she has your entire dong down her throat, but you can’t be sure, not suspended the way you are. But she keeps sucking, clearly intent on draining you dry.");
	output("\n\nVictoria cries out, and pulls back on your [pc.hair], her eyes squeezed shut. It looks like she’s about to cream, but–");
	output("\n\n<i>“Mmmph!”</i> Betsy’s tongue shakes and shudders against your [pc.cock " + kok + "] as she comes, but her sucking never stops. If anything, she sucks harder, her own orgasm spurring you on toward your own.");
	output("\n\nRight as Betsy’s sucking sets you off, yours does the same for Victoria, and her horsecock explodes between your lips, salty cum spraying down your throat and filling up your mouth. It’s a struggle to swallow it all, and a few long streams of white trickle out of your mouth, trailing down your chin. You feel your cock shoot off down Betsy’s throat, [pc.cum] spurting over and over as she sucks it down.");
	if (pc.cumQ() >= 1000) output(" The sheer amount of [pc.cum] you make is too much for her, and you feel it spilling out between her lips, torrents of fluid pouring out of her mouth around your shaft.");
	output(" Victoria moans as you finish sucking her off, giving you a few more good thrusts and jets of cum as you manage to swallow the last of it.");
		
	output("\n\nFinally, Victoria pulls away from you, her slick cock just starting to go soft, one last stream of cum dribbling out of her flat head. Beneath you, Betsy slides your [pc.cock " + kok + "] out of her mouth and gives your [pc.cockHead " + kok + "] a sticky kiss, then stands up and walks over to Victoria’s side, her legs a little shaky and her dildo still buzzing away.");
	if (pc.cumQ() >= 1000) output(" Now that she’s in front of you, you can see how your [pc.cum] spilled out and all over Betsy. Her huge boobs are dripping [pc.cumColor], and it’s plastered all over her face. She looks like she enjoys it, though.");
	
	output("\n\n<i>“You know, babe, I kind of like having [pc.himHer] hanging here like this,”</i> Victoria says. <i>“Think we can keep [pc.himHer]?”</i>");
	output("\n\n<i>“Sounds like fun,”</i> Betsy says, then wipes some cum from the tip of Victoria’s cock and licks off her fingers. <i>“But I’m sure [pc.name] can’t just stay here and play with us all the time.”</i> She pouts a little. <i>“Too bad.”</i>");
	output("\n\nAs much as you’d like to hang around, Betsy has it right. The two cowgirls help you down and out of the swing, and the three of you get each other cleaned up. Once everyone’s done, you gather your gear and head out, back to the streets of New Texas.");
	
	processTime(10 + rand(10));
	
	chars["BETSY"].loadInMouth(pc);
	pc.loadInMouth(chars["VICTORIA"]);
	pc.orgasm();
	
	IncrementFlag("TTGYM_BETSY_VICTORIA_SEXSWING");
	
	processTime(30 + rand(15));
	clearMenu();
	addButton(0, "Next", move, "503");	
}
public function tentongymBetsyVictoriaGymShowerHomeSexText():void
{
	var kok:int = rand(pc.cockTotal());
	
	output("<i>“Why hello there again, cutie,”</i> Betsy says, stepping forward to press her large chest against your [pc.chest]. She slips to your right, wrapping her boobs around your arm, as Victoria moves in from your left. She glances down at [pc.eachCock]. <i>“You happy to see us again?”</i>");
	output("\n\n<i>“Looks like it,”</i> Victoria says. She slides up against you, her dong rubbing up against your [pc.thigh], its slowly increasing length reminding you that Victoria is more a grower than a shower. <i>“And we’re always glad to see you again.”</i>");
	
	if (flags["SHOWER_SANDWICH"] == undefined)
	{
		output("\n\nBetsy giggles. <i>“Especially if you keep bringing this around,”</i> she says, reaching down and wrapping one hand around the base of your [pc.cock " + kok + "]. Victoria’s hand joins her a moment later, stroking down along your shaft. <i>“So, you want to play with us, [pc.name]? You can choose who’s in the middle.”</i>");
	}
	else
	{
		output("\n\nBetsy giggles. <i>“Especially if you keep bringing this around,”</i> she says, reaching down and wrapping one hand around the base of your [pc.cock " + kok + "]. Victoria’s hand joins her a moment later, stroking down along your shaft. <i>“So, you up for another sandwich, [pc.name]? You can choose who’s in the middle again.”</i>");
	}
}
public function tentongymBetsyVictoriaGymShowerNotNow():void
{
	clearOutput();
	tentongymShowBetsyVictoria(true);
	
	output("You give the two cowgirls a smile, and tell them you’re just here to shower. It’s a flattering offer, but you’re not actually looking for sex right now.");
	output("\n\n<i>“Aww, too bad,”</i> Betsy says, and pouts a little, though it doesn’t look like she means it.");
	output("\n\nVictoria gives her a swat on her butt, and points over to another part of the showers. <i>“What about her?”</i> she asks Betsy.");
	output("\n\n<i>“Ooh, I like,”</i> Betsy says. The two lovers wander off toward their new potential partner.");
	
	processTime(10);
	pc.changeLust(30+rand(20));
	pc.exhibitionism(1);
	pc.shower();
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}
//Lola & simone
public function tentongymEncounterLolaSimone():void
{
	clearOutput();
	tentongymShowLolaSimone();
	
	if (flags["TTGYM_LOLA_SIMONE_TIMER"] == undefined)
	{
		output("As you head down the road, you see Lola, the redhead from the Ten Ton Gym, walking down the street toward you. She’s wearing her usual black swimsuit and what was once a normal pair of denim shorts before her ass stretched them out, and she waves as you approach, looking happy to see you.");
		output("\n\n<i>“Hi there, [pc.name],”</i> Lola says, giving you a smile as she walks up to you. <i>“How are you?”</i>");
		output("\n\nBefore you can answer, you hear someone else call your name, and you and Lola both turn to see who it is. Simone, another of the gym regulars, smiles as she walks up to the two of you.");
		output("\n\n<i>“Heeyy, [pc.name],”</i> Simone says, and smirks at you and Lola both. <i>“Who’s your friend?”</i>");
		output("\n\n<i>“Oh, I know you,”</i> Lola says before you can get a word out. <i>“I’ve seen you at the gym, right? You look familiar.”</i> She tilts her head a little as she gives Simone a look up and down. <i>“And pretty strong.”</i>");
		output("\n\nSimone nods. <i>“That’s right, I knew I’d seen you somewhere before,”</i> she says. <i>“Like when I went by the pool, or in the showers.”</i>");
		output("\n\n<i>“I’m usually at the pool, yeah,”</i> Lola says, leaning a little toward Simone. <i>“Do you ever go swimming?”</i>");
		output("\n\n<i>“Nah, not my thing,”</i> Simone says, and flexes her arms a little, which also makes her chest jiggle. You can’t help looking, and catch Lola staring as well. <i>“Swimming doesn’t give me the workout I need.”</i>");
		output("\n\n<i>“You should come by sometime,”</i> Lola says, and slowly raises her gaze from Simone’s chest to her face. <i>“It’s okay if you don’t have a swimsuit, you know.”</i>");
		output("\n\nSimone looks from you to Lola and back again, and another smirk slowly makes its way across her face. Her nipples harden beneath her pink workout top. <i>“So you two know each other,”</i> she says, then runs her wide tongue over her upper lip. <i>“Do you know [pc.name] like I know [pc.name], Lola?”</i>");
		output("\n\n<i>“Mm-hmm,”</i> Lola says, then bumps your [pc.hip] with her own. <i>“I was just going to see if [pc.heShe] wanted to come back to my place.”</i>");
		output("\n\n<i>“You should both come back to mine,”</i> Simone says with a grin. <i>“I’ve got a bed big enough for three.”</i>");
		output("\n\nLola nods. <i>“I like that.”</i> She gives Simone a nudge with her hip, and the two cowgirls look at you. <i>“What about you, [pc.name]?”</i>");
		output("\n\nIt looks like you’ve walked right into a threesome. What do you say?");		
	}
	else
	{
		output("As you head down the road, you hear familiar voices behind you. You look over your shoulder, and see Simone and Lola walking together. Simone has one hand on Lola’s ass, and Lola has her arm around Simone’s waist. When they see you, Simone waves with her free hand, then leans in closer and whispers something into Lola’s floppy ear. Lola’s cheeks turn red, but she nods quickly.");
		output("\n\n<i>“Heeyy, [pc.name],”</i> Simone says as the two of them walk up to you. <i>“How you doing?”</i>");
		output("\n\nYou tell them how you’re doing, and Lola leans against Simone as you talk. It looks like the two of them are a regular thing now. But from the way they’re both looking at you, it’s clear they’re up for bringing you in for another round.");
		output("\n\n<i>“We’re headed back to her place,”</i> Lola says, drumming her fingers on Simone’s toned side. She giggles. <i>“You want to come too?”</i>");
		output("\n\nWhat do you say?");
	}
	processTime(5);
	
	flags["TTGYM_LOLA_SIMONE_TIMER"] = GetGameTimestamp();	
	
	clearMenu();
	if (silly) addButton(0,"Fuck the Cows",tentongymLolaSimoneHome, undefined, "Fuck the Cows", "DO IT NOWS.");
	else addButton(0,"Yes",tentongymLolaSimoneHome, undefined);
	addButton(1,"Nope",tentongymLolaSimoneNope, undefined,"Nope","Tell the girls you’re not interested right now, but you might be some other time.");
	
}
//tell lola and simone you aren't interested in a thressome you idiot
public function tentongymLolaSimoneNope():void
{
	clearOutput();
	tentongymShowLolaSimone();
		
	if (pc.isAss())
	{
		output("You tell them to fuck off, you’re busy.");
	}
	else if (pc.isNice()) 
	{
		output("You thank Simone and Lola for the offer, but tell them you’ve got too much going on to head home with them right now, maybe another time.");
	}
	else
	{
		output("You give the girls a wink and say you’d love to, but the spacefaring life is a busy one, and you’ve still got worlds to explore and conquer.");
	}
	
	output("\n\n<i>“Too bad, [pc.name],”</i> Simone says. <i>“But we’ll have a good time without you.”</i> She and Lola walk away. The last thing you hear is them talking about hardlights and favorite positions.");
	
	processTime(2);
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}
//find smallest hole capacity between lola and simone
public function tentongymLolaSimoneSmallestHoleCap(anal:Boolean = false):int
{
	var smallestHole:int = 0
	if (chars["LOLA"].vaginalCapacity(0) <= chars["SIMONE"].vaginalCapacity(0)) smallestHole = chars["LOLA"].vaginalCapacity(0);
	else smallestHole = chars["SIMONE"].vaginalCapacity(0);
	
	if (anal)
	{
		if (chars["LOLA"].analCapacity() < smallestHole) smallestHole = chars["LOLA"].analCapacity();
		if (chars["SIMONE"].analCapacity() < smallestHole) smallestHole = chars["SIMONE"].analCapacity();
	}
	
	return smallestHole;
}
//see if steele has a second cock that will fit in lola and simone's asses
public function tentongymLolaSimoneSecondCock(kok:int=0):int
{
	var kok2:int = pc.cockThatFits(tentongymLolaSimoneSmallestHoleCap(true), "volume", [kok]);
	return kok2;
}
//home
public function tentongymLolaSimoneHome():void
{
	clearOutput();
	tentongymShowLolaSimone();
		
	moveTo("NT TTGG APARTMENT");
	
	if (flags["TTGYM_LOLA_SIMONE_HOME"] == undefined)
	{
		output("You tell the two cowgirls that yes, you would like to head back to Simone’s place with them both. Simone gives you a wicked grin, while Lola just giggles.");
		output("\n\nLola steps forward and puts an arm around your [pc.hips], then one around Simone’s as well. <i>“You lead,”</i> Lola says to her, and Simone smiles down at her. <i>“Where do you live, anyway?”</i>");
		output("\n\n<i>“This way,”</i> Simone says, and leads you down the long road to the more residential area where she lives. You know the route, so it’s easy to just follow along and pay more attention to the two of them than where you’re going.");
		output("\n\nAs you walk, Simone drapes her toned arm over Lola’s tanned shoulders, and reaches over to rest her hand on your shoulder. Lola’s ass rubs against your [pc.hip] with every step, and you know Simone must be getting the same treatment as well.");
		output("\n\n<i>“So, where did you two meet?”</i> Simone asks, looking over at you and Lola. <i>“I’m guessing the pool?”</i>");
		output("\n\n<i>“Of course,”</i> Lola says. <i>“[pc.Name] bumped into me when I was swimming. It’s how I meet a lot of people.”</i>");
		output("\n\nSimone smirks. <i>“So that’s how you know each other,”</i> she says. <i>“Right there in the pool?”</i>");
		output("\n\nLola stares up at Simone, her eyes wide. <i>“You’ve never fucked someone while you’re floating? It’s amazing. You have to come by and try it sometime.”</i> She pauses. <i>“Bring your hardlight and I’ll show you.”</i>");
		output("\n\nSimone licks her lips again, clearly liking the idea. You’re not sure how these two haven’t hooked up already if they saw each other at the gym and they’re ready to fuck right after they met, but you get the feeling Simone has some pool workouts in her future.");
		output("\n\nThe three of you arrive at Simone’s house, and Lola looks around as you walk in. <i>“I like it,”</i> she says after a moment. <i>“You’ve got lots of room, but I think a place like this would be way too big for me.”</i>");
		output("\n\n<i>“That’s why I bring people over,”</i> Simone says with a wink. She leads you both toward the bedroom, Lola still holding her arms around your waist and Simone’s.");
		output("\n\n<i>“So many mirrors,”</i> Lola says once the three of you reach the bedroom, looking around with wide eyes. Then, her gaze falls on the bed, and she smiles. <i>“Yeah, that’s definitely big enough for three,”</i> she says, her voice going low. She steps away from you and Simone, then slowly turns, hooking her fingers under her swimsuit top’s straps. <i>“You two gonna help me take this off?”</i>");
		output("\n\nSimone steps behind Lola and grabs the redhead’s boobs, squishing them against her as she pulls Lola close. Lola’s eyes open wide as her back collides with Simone’s chest, and she says, <i>“Wow, you’re really big,”</i> as Simone reaches down to the bottom of Lola’s top. Simone chuckles, then leans in and gives the side of Lola’s neck a long lick.");
		output("\n\nLola moans, and you move in, reaching down to the front of her tight-stretched jean shorts. You remember how long it can take to get them unfastened, so better to start now while Simone works on her top. You struggle with the over-strained button while Simone tugs Lola’s suit off of her, revealing Lola’s tan-lined, freckled tits. Lola giggles, then rubs her back against Simone’s chest, making her own boobs wobble.");
		output("\n\nAfter a a few good tugs on the denim, you get Lola’s shorts unbuttoned, but as usual, they don’t even move after you pull down the zipper. Simone looks down at the tight garment, then at you, disbelief on her face. You tell her that, yes, you have to yank the shorts down hard.");
		output("\n\n<i>“How do you even get those things on,”</i> Simone muses, and takes hold of the shorts with her hands on Lola’s hips. She tugs down, and they start to move, but not much.");
		output("\n\n<i>“Lots of practice,”</i> Lola says with a giggle. <i>“And lots of shaking.”</i>");
		output("\n\nYeah, that makes sense. You pull down on Lola’s shorts from the front, while Simone works on the sides, slowly easing them down over Lola’s flared hips. Once they’re free, you pull them the rest of the way down, while Simone grabs Lola’s swimsuit bottoms and yanks them off, leaving the big-butted cowgirl naked.");
		output("\n\nLola lets out a cheer, then turns to you. <i>“Your turn!”</i>");
		output("\n\nSimone and Lola both strip you out of your [pc.gear], with a lot of touching and comments about the parts of your body they like, mostly focused on your [pc.crotch]. Once you’re naked, Lola reaches over and grabs the bottom of Simone’s workout top, then pulls it up hard.");
		output("\n\nSimone’s boobs fly free all at once, sending them shaking up and down as Lola laughs. Her nipples are fully hard, and you slip around behind her and pull her pink shorts and thong down both at once, revealing her toned ass and thick, slick pussy lips.");
		output("\n\n<i>“Nice,”</i> Simone says, licking her lips as she looks at you and Lola both. <i>“Let’s get started–”</i>");
		output("\n\nBefore she can say anything more, Lola drops to her knees in front of Simone, and presses her face to the dark cowgirl’s chest.");
	}
	else
	{
		output("You tell the two cowgirls that another round with the two of them sounds like a good time. Simone gives you a wicked grin, while Lola just giggles.");
		output("\n\nLola steps forward and puts an arm around your [pc.hips], pulling Simone along with her. <i>“Let’s go,”</i> Lola says, and the three of you head back to Simone’s place.");
		output("\n\nOnce you arrive, you all head into the bedroom. Lola steps away from you and Simone, then slowly turns, hooking her fingers under her swimsuit top’s straps. <i>“You two know how this goes, right?”</i>");
		output("\n\nSimone steps behind Lola and grabs the redhead’s boobs, squishing them against her as she pulls Lola close. Lola closes her eyes and leans back as she collides with Simone’s chest, mumbling, <i>“So big,”</i> as Simone reaches down to the bottom of Lola’s top. Simone chuckles, then leans in and gives the side of Lola’s neck a long lick.");
		output("\n\nLola moans, and you move in, reaching down to the front of her tight-stretched jean shorts. You remember how long it can take to get them unfastened, so better to start now while Simone works on her top. You struggle with the over-strained button while Simone tugs Lola’s suit off of her, revealing Lola’s tan-lined, freckled tits. Lola giggles, then rubs her back against Simone’s chest, making her own boobs wobble.");
		output("\n\nAfter a a few good tugs on the denim, you get Lola’s shorts unbuttoned, but as usual, they don’t even move after you pull down the zipper. Simone looks down at the tight garment, then laughs.");
		output("\n\n<i>“It still amazes me that you can fit into that thing,”</i> Simone muses, and takes hold of the shorts with her hands on Lola’s hips. She tugs down, and they start to move, but not much.");
		output("\n\n<i>“Really?”</i> Lola asks with a giggle. <i>“But you’ve helped me put them on!”</i>");
		output("\n\nIt sounds like they’re used to this. You pull down on Lola’s shorts from the front, while Simone works on the sides, slowly easing them down over Lola’s flared hips. Once they’re free, you pull them the rest of the way down, while Simone grabs Lola’s swimsuit bottoms and yanks them off, leaving the big-butted cowgirl naked.");
		output("\n\nLola lets out a cheer, then turns to you. <i>“Your turn!”</i>");
		output("\n\nSimone and Lola both strip you out of your [pc.gear], with a lot of touching and comments about the parts of your body they like, mostly focused on your [pc.crotch]. Once you’re naked, Lola reaches over and grabs the bottom of Simone’s workout top, then pulls it up hard.");
		output("\n\nSimone’s boobs fly free all at once, sending them shaking up and down as Lola laughs. Her nipples are fully hard, and you slip around behind her and pull her pink shorts and thong down both at once, revealing her toned ass and thick, slick pussy lips.");
		output("\n\n<i>“Nice,”</i> Simone says, licking her lips as she looks at you and Lola both. <i>“Let’s get started–”</i>");
		output("\n\nBefore she can say anything more, Lola drops to her knees in front of Simone, and presses her face to the dark cowgirl’s chest.");
	}
		
	processTime(30);
	pc.changeLust(30);
	
	clearMenu();	
	if (pc.cockThatFits(tentongymLolaSimoneSmallestHoleCap()) >= 0) addButton(0, "Next", penisRouter, [tentongymLolaSimoneHomeStart, tentongymLolaSimoneSmallestHoleCap(), false, 0]);
	else addButton(0, "Next", vaginaRouter, [tentongymLolaSimoneHomeStart, 0, 0, 0]);
}
public function tentongymLolaSimoneHomeStart(kok:int=0):void
{
	clearOutput();
	tentongymShowLolaSimone(true);	
	
	var vag:int = kok;
	var kok2:int = -1;
	var useKok:Boolean = false;
	if (pc.cockThatFits(tentongymLolaSimoneSmallestHoleCap()) >= 0) useKok = true;
	
	output("Lola latches her lips onto Simone’s right nipple, and her eyes go half-closed as she starts to suck. Her hands wrap around Simone’s leg, stroking her toned thigh, slowly tracing her fingers up and down. Simone lets out a long sigh, then rests her hand on the back of Lola’s head and looks at you, then holds up her left tit.");
	output("\n\nLooks like she knows what she wants. You kneel next to Lola and take Simone’s other nipple in your mouth, running your [pc.tongue] over the stiff peak. Simone gasps, and puts her hand on the back of your head as well, running her fingers through your [pc.hair].");
	output("\n\nYou pull all of Simone’s nipple into your mouth, your [pc.lipsChaste] kissing the smooth skin of her giant boob. Next to you, Lola starts bobbing her head forward and back, just enough to squish Simone’s tit against her chest again and again. You mimic her, and Simone moans, then laughs a little.");
	output("\n\n<i>“You two,”</i> she says, breathing hard, <i>“keep that up as long as you want.”</i> The only response from Lola is a soft <i>“mmm”</i>, muffled against Simone’s chest.");
	output("\n\nSimone’s definitely enjoying this, but you can take it up a notch. You run one hand up the inside of her dark thigh, and stroke your fingers over her slippery pussy lips. A little rub is enough to make her gasp again, and you slide your hand back and forth, rubbing both her thick lips, spreading her girlcum all over herself. Her hand tightens in your [pc.hair], and she whispers, <i>“More.”</i>");	
	output("\n\nLola moves her hand up Simone’s other leg, and slips two fingers between yours, pushing them into Simone’s pussy. Simone cries out as Lola’s fingers disappear into her, and you pull your hand back to the top of Simone’s cunt, where her bulging clit is already sticking out.");
	output("\n\nSimone moans again as you start to rub her clit, your free hand tracing up and down her thigh and reaching around to stroke her ass. You and Lola never let up on her nipples, and Simone’s pussy only grows wetter from the attention it’s getting, her breaths coming faster and faster. Her clit hardens as you stroke it, jutting out from beneath her hood to stand proudly above her thick lips.");
	output("\n\n<i>“Keep going,”</i> Simone gasps, and it sounds like that’s all she can manage right now.");
	output("\n\nLola moans into Simone’s tit again, and slides a third finger into the dark cowgirl, Simone’s girlcum dripping down her hand. She looks like she’s in utter bliss, like she could keep sucking and fingering Simone for a long, long time.");
	output("\n\nYou give Simone’s nipple a little bite, just enough to make her gasp again, and focus your attention on her throbbing clit. Her bud has grown as big as her nipple, and you run one fingertip up and down its length, stroking faster and faster.");
	output("\n\nSimone’s fingers clench in your [pc.hair], and she starts panting, her mouth hanging open. Her hips thrust, grinding her pussy against you and Lola’s hands, and you can tell she’s close. You suck her nipple as hard as you can, and take her clit between two fingers, giving it a little squeeze with every stroke. Lola’s hand keeps working beneath your own, her fingers buried deep in Simone, spreading her lips wide as they work away inside her.");
	output("\n\nFinally, Simone throws her head back and screams, pulling you and Lola hard against her chest, burying both your faces in her boobs as she comes. You struggle to breathe, and keep tugging on her clit, riding out the buff cowgirl’s orgasm as if you were fucking her. After a moment, Simone shudders and slowly lets go, then takes a step back, breathing hard.");
	output("\n\nLola looks at you, a dazed expression on her face, and holds out a sticky hand for you to lick. You run your [pc.tongue] over her hand, tasting Simone all over her, and give her your hand in return. Lola sucks off your fingers, closing her eyes and moaning at the taste. Once she’s done, she leans back and licks her lips, looking very pleased.");
	output("\n\n<i>“Damn, you two,”</i> Simone says, catching her breath. She gives herself a shake, then gestures to you and Lola both. <i>“Stand up, both of you,”</i> she says, a grin slowly spreading across her face. <i>“I can’t just let that go, so it’s your turn.”</i>");
	output("\n\nYou and Lola both stand up, and Simone slowly gets to her knees in front of the two of you. Lola moves close to you, her hip nudging against your [pc.hip], and giggles as she looks down at Simone.");
	if (flags["TTGYM_LOLA_SIMONE_HOME"] == undefined) output(" <i>“I don’t usually get to be like this,”</i> she says.");
	else output(" <i>“Ooh, this again,”</i> she says, sounding like she’s looking forward to it.");
	
	output("\n\nSimone leans forward toward you, and plants a kiss just above your [pc.crotch], then leans over and does the same to Lola, kissing the little patch of red hair above Lola’s twat. <i>“Hope you two are ready for this,”</i> Simone says, then licks her lips.");
	if (flags["TTGYM_LOLA_SIMONE_HOME"] == undefined) output(" <i>“I’m not sure,”</i> Lola says, <i>“I usually like to be penet–OOOOOHHH”</i>");
	else output(" <i>“Ooh, yes, do that aga–AAAAaaahhh...”</i>");
	
	output("\n\nSimone slides her wide cow-tongue across Lola’s pussy, covering her lips all at once, and making her moan in sudden bliss. She pulls back, and presses her tongue’s tip right up against Lola’s lower lips, pushing a few inches of it into her. She holds her tongue there for a moment, letting it work its magic on her, making Lola’s eyes roll back as she gasps. Then, Simone pulls away, and turns her attention to you.");
	
	if (useKok) output("\n\nSimone licks all the way down your [pc.cock " + kok + "], from base to tip, then back up again, sliding her tongue back and forth along your length. You were already halfway hard just from being here with her and Lola, and her oral attentions bring you to full mast with only a few wet strokes. She finishes it off by giving your [pc.cockHead " + kok + "] a long kiss, then turns back to Lola.");
	else output("\n\nSimone presses her mouth to your [pc.vagina " + vag + "], and rubs her wide tongue against your lips, sucking gently on you and making you get even wetter. The tip of her tongue rubs up and down against one lip, then the other, sending pleasure all through you. After a few more licks, she pulls back from you, then turns back to Lola.");
	
	output("\n\nSimone sticks her tongue all the way out, and Lola makes an <i>“oooo”</i> noise, then yelps as Simone slips the entire thing up and into Lola’s pussy. She presses her mouth to Lola’s muff, and Lola grabs the back of Simone’s head and pulls her even closer, her eyes shut tight, her breath coming in quick gasps. You reach over and squeeze Lola’s giant ass, urging her along as Simone’s oral work continues. Right as Lola looks like she’s about to come, Simone pulls back, and gives Lola a sly smile.");
	output("\n\nSuch a tease. Simone leans back over to you, and");
	if (useKok) output(" wraps her lips around your [pc.cockHead " + kok + "], then sucks her way down your [pc.cock " + kok + "], her tongue wrapping around your shaft as she goes. You can’t help groaning at her expert oral work, and with every suck and squeeze, you feel your orgasm coming closer. She stops when she’s about halfway down, and bobs her head back and forth, her tongue wrapped around your head. Right as you feel an orgasm starting to build at your base, Simone pulls back, then turns to Lola again, a grin on her face.");
	else output(" sticks her tongue all the way out again, right before sliding it into your [pc.vagina " + vag + "]. You groan at the feeling of her slipping into you, her long tongue bending back and forth, seeking out the places she knows will make you come. She pushes her lips against yours again, and presses the base of her tongue against the top of your [pc.vagina " + vag + "], letting her lips tease your [pc.clit " + vag + "]. Right as you feel an orgasm starting to build within you, Simone pulls back, then turns to Lola again, a grin on her face.");
	
	output("\n\nSimone can barely get her tongue in place before Lola takes hold of her head again and pulls her to her crotch. Lola moans and keeps moaning as Simone’s tongue does its work within her, and her wide hips buck, her thick thighs slapping against Simone’s cheeks. Simone reaches around and grabs Lola’s ass, squeezing it hard as her tongue keeps working away. After a moment, Lola’s hips stop thrusting, and she cries out, her whole body shaking. She goes limp all at once, and Simone helps her to the ground as she flops down, her eyes unfocused.");
	output("\n\nSimone licks her lips, and laughs a little. <i>“You need a second?”</i> she asks Lola, who barely nods. Without another word, Simone leans over to you, lips aimed right at your [pc.crotch].");
	
	if (useKok)	output("\n\nShe takes your hard [pc.cock " + kok + "] into her mouth again, and sucks in as much as she can, her tongue whipping around your shaft and squeezing it tight. It’s all you can do to keep breathing as Simone works your dong without mercy, her eyes closed in concentration. You feel your orgasm building, way too quickly, and try to hold on, to no avail. Your whole body shakes as you come, [pc.cum] spurting out of your [pc.cockHead " + kok + "], jetting down Simone’s throat as the two of you both moan. Simone sucks down all that she can, and when you’re done, licks the last of your [pc.cum] off of your tip.");
	else output("\n\nShe plants her mouth on your [pc.vagina " + vag + "] again, and slides her tongue up into you with a fury, the tip probing into you until it finds your g-spot. You yelp as the sudden pleasure rockets through you, and it’s all you can do not to come right away. Simone’s lips and tongue massage your [pc.clit " + vag + "] as well, and the dual sensation is too much for you to bear. Your orgasm hits you all at once, and you cry out, your whole body shaking. Simone rides it out with her face still pressed to your crotch, and once you’re done, she leans back and licks your [pc.girlcum] from her lips.");
		
	output("\n\n<i>“Nice,”</i> Simone breathes, and wipes at her lips as she looks at you and Lola both. Lola has recovered from her orgasm, but she’s flushed red and still looks a little dazed. <i>“You’re both good for another round, right?”</i>");
	output("\n\n<i>“Oh, yeah,”</i> Lola says. She takes a deep breath, then giggles. <i>“I didn’t think we were going to stop at just one.”</i>");
	
	IncrementFlag("TTGYM_LOLA_SIMONE_HOME");	
	IncrementFlag("TTGYM_LOLA_SIMONE_S_FIN");
	
	if (useKok)
	{
		IncrementFlag("TTGYM_LOLA_SIMONE_COCK_SFAL");
		chars["SIMONE"].loadInMouth(pc);
	}
	else
	{
		IncrementFlag("TTGYM_LOLA_SIMONE_PUSSY_SCUN");
		chars["SIMONE"].girlCumInMouth(pc);
	}
	
	processTime(30 + rand(15));
	pc.orgasm();
	
	if (useKok)
	{
		//check if second cock that fits in their asses is available
		if (pc.cockTotal() > 1) kok2 = tentongymLolaSimoneSecondCock(kok);
		if (kok2 >= 0)
		{
			output("\n\nSimone gets to her feet, then reaches down and starts stroking your [pc.cocks]. <i>“Only room for one of these in my mouth at a time,”</i> she says, smirking at you, <i>“but I’ve been looking forward to another good ride. And we can definitely share.”</i>");
			output("\n\n<i>“Ooh,”</i> Lola says.");
			if (flags["TTGYM_LOLA_SIMONE_DP"] == undefined)
			{
				output("\n\n<i>“I haven’t done this with [pc.himHer] before. I’m usually a one hole at a time kind of girl, if I’m only with one person. Otherwise I get worn out too quick.”</i>");
				output("\n\nSimone chuckles. <i>“I think [pc.name] can keep us both going with these,”</i> she says. <i>“Now how about you get up on the bed and prove it?”</i>");
			}
			else
			{
				output("\n\n<i>“I’ve been wanting to do this again. I don’t usually like being on top, but this is worth it.”</i>");
				output("\n\n<i>“Riding on these is always worth it,”</i> Simone says with a chuckle. <i>“Now get your ass up on the bed, [pc.name].”</i>");
			}			
			
			clearMenu();
			addButton(0, "Next", tentongymLolaSimoneHomeCockMulti, [kok,kok2]);	
			
		}
		else
		{
			output("\n\nSimone gets to her feet. <i>“Do you want me to get my hardlight?”</i> she asks. <i>“Not that I don’t like what we’ve got, but I’m thinking we could use some variety.”</i>");
			output("\n\n<i>“I’m good either way,”</i> Lola says, then looks at your crotch. <i>“We’ve got [pc.name]’s cock, but I won’t say no if you want one too.”</i>");
			output("\n\nThe two cowgirls look at you. What do you say?");
			
			clearMenu();
			addButton(0, "No Hardlight", tentongymLolaSimoneHomeCockSingleNoHL, kok);	
			addButton(1, "Hardlight", tentongymLolaSimoneHomeCockSingleHL, kok);			
		}
	}
	else
	{
		output("\n\nSimone gets to her feet. <i>“Do you want me to get my hardlight?”</i> she asks. <i>“Not that it’s no good without one, but I’m thinking we could use some variety.”</i>");
		output("\n\n<i>“Yes, please,”</i> Lola says before you can say anything. <i>“Your tongue’s amazing, but I like to be penetrated. A lot.”</i>");
		output("\n\nSimone steps into her bathroom, and comes back out a moment later wearing a black thong. You and Lola watch as she presses a button on the side, and a ten-inch bright pink hardlight horsecock glows to life over her thick lips. Lola giggles again.");
		output("\n\n<i>“All right,”</i> Simone says, stroking one hand down her glowing length. <i>“Both of you, bend over.”</i>");
		
		clearMenu();
		addButton(0, "Next", vaginaRouter, [tentongymLolaSimoneHomePussy, 0, 0, 0]);
	}	
}
//simones hardlight volume
public function tentongymBetsyVictoriaHardlightVolume():int
{
	return 25;
}
//hardlight into steele's selected pussy
public function tentongymLolaSimoneHomePussy(vag:int=0):void
{
	clearOutput();
	tentongymShowLolaSimone(true);	
	
	output("Lola stands, then bends over Simone’s bed, shaking her wide ass at you and Simone both. You bend over next to her, raising your [pc.ass] in the air for Simone. Simone lets out a low chuckle as she walks over to the two of you, and takes hold of your [pc.ass] and Lola’s at the same time, giving both of you a squeeze.");
	output("\n\n<i>“Now,”</i> she says, <i>“who to start...”</i>");
	output("\n\nSimone steps over and takes hold of Lola’s wide hips, then slides her pink hardlight up into the tanlined cowgirl, and Lola lets out a long moan as Simone penetrates her. You watch as Simone squeezes Lola’s hips and ass, thrusting slowly at first, pushing in the glowing dildo’s entire length. Lola takes it with ease, moving back against Simone, her ass wobbling with every thrust.");
	output("\n\nAfter a few good strokes, Simone slowly pulls the hardlight out of Lola and steps over to you, then pushes the dildo’s flat, slippery head against your [pc.vagina " + vag + "]. She takes hold of your [pc.hips] and slips the hardlight up into you, and you moan as you feel it slide in.");
	if (pc.vaginas[vag].looseness() <= 2) output(" As tight as you are, it takes her some pushing to get all ten inches into you, but Simone’s more than up for the challenge.");	
	output(" You feel Simone bottom out within you, the glowing dick spreading your lips with every thrust.");
	
	pc.cuntChange(vag, tentongymBetsyVictoriaHardlightVolume());
	
	output("\n\nSimone thrusts into you a few more times, barely getting you started, before she pulls out, leaving you feeling a little empty. Next to you, Lola’s already holding her lips open, eager for another fucking, and Simone gives it to her, harder than before. Lola gasps as Simone thrusts into her, both of them picking up the pace, Simone’s toned thighs flexing as she buries the dildo deep. Lola’s tail curls up above her, the tuft at the end brushing against Simone’s huge boobs, swiping back and forth over her nipples.");
	output("\n\nRight as Lola’s gasps start to get higher-pitched, Simone pulls out, and Lola lets out a moan that sounds a little like a whine. It sounds like she was getting close, and Simone’s clearly not ready to let her come yet. But she steps over and thrusts the dildo hard back into you, shoving you forward a little as it slides up your [pc.vagina " + vag + "].");
	output("\n\nYou push yourself back against Simone, shoving your [pc.ass] against her hips, taking as much of the dildo into yourself as you can. You moan as it goes deep, and angle your [pc.hips] to get the angle just right, your breathing going faster as pleasure radiates through you. Simone squeezes your [pc.hips] tight with her strong hands, and leans down over you, until you can feel her heavy tits rest on your back. You push back harder, feeling your orgasm approaching fast.");
	output("\n\nWhich makes Simone pull out of you all at once, leaving you gasping. Simone steps over and pounds the dildo hard into Lola’s waiting cunt, making the big-assed cowgirl cry out, her mouth hanging open. Simone leans over her too, bouncing her boobs off of Lola’s back as she thrusts, Lola’s tail caught between the two of them. Lola’s breathing comes faster and faster, her ass bouncing off of Simone’s thighs, and right before she’s about to come, Simone pulls out again.");
	output("\n\n<i>“Not fair,”</i> Lola gasps.");
	output("\n\nSimone just laughs, and slams the hardlight hard into you, enough to make you yell. She grabs your [pc.hips] again and hammers away, the hardlight horsecock sliding in and out of you at a frantic pace. It’s all you can do to hold yourself upright, and you push hard back against Simone, your [pc.ass] slapping against her dark skin. Simone’s breathing hard too, and you feel your orgasm building, but you know she’s going to pull out.");
	output("\n\nSure enough, right as you start to moan again, Simone pulls her dildo free, then steps back, looking at you and Lola. She wipes a drop of sweat from her forehead, then strokes one hand down the soaked dildo and licks it off, her eyes closing as her long cow-tongue cleans the mixed girlcum from you and Lola off her hand.");
	output("\n\n<i>“So,”</i> Simone says once her hand’s clean, <i>“who wants to be in the middle so I can finish you off?”</i>");
	output("\n\nLola’s still breathing hard, and it doesn’t look like she’s going to answer. What do you say?");
	
	processTime(10 + rand(10));
		
	clearMenu();
	addButton(0, "Lola", tentongymLolaSimoneHomePussyLola, vag);	
	addButton(1, "Me", tentongymLolaSimoneHomePussySteele, vag);	
}
public function tentongymLolaSimoneHomePussyLola(vag:int=0):void
{
	clearOutput();
	tentongymShowLolaSimone(true);	
	
	output("You say Lola should get to be in the middle. Lola looks over at you and giggles, then rolls over onto her back. Her ass spreads out beneath her, and she opens her thick thighs wide, stroking the red tuft of hair above her pussy. <i>“Please?”</i> she says to Simone.");
	output("\n\nThe word’s barely out before Simone steps forward and slides the slick hardlight back between Lola’s lips, driving it in up to the hilt, making its base press against her thick-lipped pussy. Lola arches her back as she moans, her pink nipples pointing toward the ceiling, her hands clenching in the bed’s covers.");
	output("\n\nLola’s legs wrap around Simone’s toned hips, holding her close like she did to you in the gym pool. Simone laughs, and reaches down to take hold of Lola’s legs, planting her hands on the other cowgirl’s wide hips and slamming her dildo in over and over again.");
	output("\n\n<i>“Don’t just watch, [pc.name],”</i> Simone says, starting to breathe harder. <i>“Get on her!”</i>");
	output("\n\nYou glance at Lola, who licks her lips, and that’s all you need. You climb all the way onto the bed and stand over Lola, then turn and kneel down over her face, bringing your [pc.vagina " + vag + "] right onto her lips. Lola moans into your [pc.vagina " + vag + "], and you feel her tongue sliding up and down, licking you from clit to entrance as she reaches up and takes hold of your [pc.ass].");
	output("\n\n<i>“That’s it,”</i> Simone says, giving you a wink. She keeps hammering away, though she can’t pull out very far with Lola’s legs locked around her.");
	output("\n\nYou rest your hands on Lola’s wobbling tits, tweaking both her nipples as she eats you out, and her moans and little yelps into your [pc.vagina " + vag + "] only drive you closer to orgasm. Her tongue’s thrashing back and forth and in and out of your [pc.vagina " + vag + "], and it feels like she can’t focus thanks to the pounding Simone’s giving her pussy, but it feels damn good no matter what. Simone herself is dripping sweat down her massive cleavage, her eyes half-closed, her hips moving like a piston to drive the dildo into Lola.");
	output("\n\nAfter Lola moans into your [pc.vagina " + vag + "] again, you decide you want some more focus on your [pc.clit " + vag + "], and lean forward toward Simone. This puts her chest within reach, and you lean your head down and catch one of her dark nipples between your [pc.lips]. Simone moans as you start to suck, and you feel Lola’s tongue start working your [pc.clit " + vag + "], making you groan into Simone’s tit.");
	output("\n\nFinally, Lola’s grip on your [pc.ass] tightens, and she moans hard into your [pc.vagina " + vag + "], her whole body shaking as she comes. You suck harder on Simone’s nipple, and the dark cowgirl keeps thrusting deep into Lola, until she throws her head back and cries out, her hips’ frantic thrusting going even faster as her orgasm hits. Lola doesn’t stop, her tongue massaging your [pc.clit " + vag + "] over and over, and finally, it’s enough to drive you over the edge.");
	output("\n\nYou come with a shudder that nearly shakes you off of Lola, moaning hard into Simone’s boobs, her nipple still hard in your mouth.");
	if (pc.girlCumQ() >= 1000) output(" [pc.Girlcum] splatters out of you all at once, soaking your [pc.thighs] and coating Lola’s face, dripping down to drench Simone’s bed.");
	else output(" [pc.Girlcum] drips down your [pc.thighs], leaving long, sticky trails down Lola’s cheeks.");	
	output(" You take a few deep breaths as the orgasm passes, and slowly roll off of Lola, then flop down on Simone’s bed.");
	
	output("\n\n<i>“Wow,”</i> Simone breathes, wiping sweat from her forehead. <i>“Looks like I got in two workouts today.”</i> She laughs, looking down at the two of you, a triumphant expression on her face.");
	output("\n\n<i>“Mooooooo...”</i> Lola moans, then wipes her cheeks off and licks her fingers. She rolls onto her side, then scoots forward and starts licking off Simone’s dildo, kissing the flat head when it’s all clean. <i>“That felt so good,”</i> she says, then giggles. <i>“We need to do this again sometime.”</i>");
	output("\n\nSimone nods. <i>“Yeah, we do,”</i> she says, then turns off her hardlight. <i>“But let’s get cleaned up first.”</i>");
	output("\n\nThe three of you clean each other off. Simone looks a little tired, but otherwise fine, while Lola’s unsteady on her feet and flops back down on Simone’s bed once you’re done. You tell the two cowgirls that you’ll see them again sometime soon, and head out, back to the streets of New Texas.");
	
	processTime(10 + rand(10));
	
	chars["LOLA"].girlCumInMouth(pc);
	pc.orgasm();
	
	IncrementFlag("TTGYM_LOLA_SIMONE_PUSSY_LCUN");
	
	processTime(30 + rand(15));
	clearMenu();
	addButton(0, "Next", move, "503");	
}
public function tentongymLolaSimoneHomePussySteele(vag:int=0):void
{
	clearOutput();
	tentongymShowLolaSimone(true);	
	
	output("You say that you want to be in the middle. Lola looks at you and giggles, then gets to her knees and crawls across the bed, until she’s sitting in front of you. She swings her hips forward and spreads her legs, pointing her slippery pussy with its little tuft of red hair right at you. Her big, round ass spreads out beneath her, and she licks her lips as she looks at you.");
	output("\n\n<i>“Use your fingers too, okay?”</i> Lola says.");
	output("\n\nCan’t say no to that. You prop yourself up on your elbows, lowering your head toward Lola’s cunt, and give it a good, long lick. The scent of her makes your [pc.nipples] even harder, and you’re not quite sure how to describe her taste, but you already want more.");
	output("\n\nLola moans, and takes hold of both her boobs, tweaking her pink nipples between her fingers. <i>“That’s good,”</i> she breathes. <i>“More!”</i>");
	output("\n\nYou slide your [pc.tongue] over her pussy again, and right as you’re going in for a third lick, Simone’s hardlight presses against your [pc.vagina " + vag + "]. You moan into Lola’s cunt as Simone slides the dildo right back into you, and you feel the strong cowgirl’s hands on your [pc.hips], squeezing you hard as she fucks you again.");
	
	pc.cuntChange(vag, tentongymBetsyVictoriaHardlightVolume());
	
	output("\n\n<i>“Come on, [pc.name]”</i> Simone says with a laugh, quickly picking up the pace. <i>“Give her what she wants!”</i>");
	output("\n\nYou make yourself focus on Lola’s twat, no easy task with Simone driving that dildo into you over and over again. The pleasure from your [pc.vagina " + vag + "] getting so thorougly fucked ripples through you, and you slip your [pc.tongue] between Lola’s lips, flicking it up and down as it slides into her pink pussy. Lola moans again, and thrusts her wide hips at you, slapping her lips against your own.");
	output("\n\nBehind you, Simone picks up her pace, her hips smacking into your [pc.ass] with every thrust, her breathing coming faster. She leans forward over you like she did before, pressing her boobs onto your back, and you feel her hard nipples against your [pc.skinFurScales].");
	output("\n\nYou slide your [pc.tongue] to the top of Lola’s pussy, and rub the tip against Lola’s little clit, making her cry out. Then, you stick two fingers in between her lips, just like she asked, and press them in as deep as you can. Lola yelps, and her thick thighs move closer together, pressing against your cheeks.");
	output("\n\n<i>“Careful, [pc.name],”</i> Simone says with a chuckle, her lips right by your [pc.ear]. <i>“Thighs like that could crush you pretty easy.”</i>");
	output("\n\nYou keep licking Lola’s clit as she gasps, her eyes rolling back into her head. She lets go of one of her nipples and runs her fingers through your [pc.hair], holding your head harder against her crotch. Your fingers work away, covered in Lola’s slippery girlcum. From the way she’s gasping, she’s got to be close.");
	output("\n\nAnd if Simone’s heavy breathing above you is any sign, she’s not too far off either. It’s hard to focus, but you push your [pc.hips] back against her as she fucks you, which makes her moan but also drives the hardlight horsecock even deeper into you, and you groan against Lola’s clit. Lola throws her head back, her fingers tightening in your [pc.hair], her tongue hanging out as she pants.");
	output("\n\nYou push a third finger into Lola, and give her clit a good, hard suck. That drives her over the edge, and her thighs close around your face as she comes, bucking her hips against you and smearing her girlcum all over your mouth. She flops back down to the bed after a moment, freeing you from her legs’ grip. The dazed, happy look she gives you makes nearly getting crushed between her thighs worth it.");
	output("\n\nSimone reaches around from behind you and takes hold of your [pc.chest], pinching both of your [pc.nipples] as she pants in your [pc.ear]. The feeling of her against you, and the never-ending pounding of her hardlight into your [pc.vagina " + vag + "], is too much to hold back.");
	output("\n\nYou and Simone both come together, her thrusting never letting up as she cries out above you, your [pc.vagina " + vag + "] twitching and shivering around her dildo.");
	if (pc.girlCumQ() >= 1000) output(" [pc.Girlcum] splatters out of you all at once, soaking your [pc.thighs] and Simone’s as well, dripping down to drench Simone’s bed.");
	else output(" [pc.Girlcum] drips down your [pc.thighs], dripping down Simone’s dildo to mix with her own fluids.");
	output(" You let out a long, low groan as Simone pulls the hardlight out of you, leaving you worn-out and feeling all kinds of empty, then sit up, breathing hard.");
	
	output("\n\n<i>“Wow,”</i> Simone breathes, wiping sweat from her forehead. <i>“Looks like I got in two workouts today.”</i> She laughs, looking down at the two of you, a triumphant expression on her face.");
	output("\n\n<i>“Mooooooo...”</i> Lola moans, then wipes her cheeks off and licks her fingers. She rolls onto her side, then scoots forward and starts licking off Simone’s dildo, kissing the flat head when it’s all clean. <i>“That felt so good,”</i> she says, then giggles. <i>“We need to do this again sometime.”</i>");
	output("\n\nSimone nods. <i>“Yeah, we do,”</i> she says, then turns off her hardlight. <i>“But let’s get cleaned up first.”</i>");
	output("\n\nThe three of you clean each other off. Simone looks a little tired, but otherwise fine, while Lola’s unsteady on her feet and flops back down on Simone’s bed once you’re done. You tell the two cowgirls that you’ll see them again sometime soon, and head out, back to the streets of New Texas.");
	
	processTime(10 + rand(10));
	
	pc.girlCumInMouth(chars["LOLA"]);
	pc.orgasm();
	
	IncrementFlag("TTGYM_LOLA_SIMONE_L_CUN");
	IncrementFlag("TTGYM_LOLA_SIMONE_PUSSY_HL");
	
	processTime(30 + rand(15));
	clearMenu();
	addButton(0, "Next", move, "503");	
}
public function tentongymLolaSimoneHomeCockSingleNoHL(kok:int=0):void
{
	clearOutput();
	tentongymShowLolaSimone(true);	
	
	output("You tell Simone that she won’t need her hardlight, you’ve got all the dick they need. With the two of them ready for you, a few strokes is all it takes to get your [pc.cock " + kok + "] on the way to being hard again. You look back and forth between the two of them as you rub it, showing that you’re good to go.");
	output("\n\nSimone gives you a grin, then licks her lips and looks at Lola. <i>“You first,”</i> she says.");
	output("\n\nLola giggles, then climbs up onto Simone’s bed, gets on her knees and puts her round, jiggling rear in the air. <i>“Best position,”</i> she says, then reaches back and smacks her own ass. <i>“Come on!”</i>");
	output("\n\nYou step up behind Lola and rub your [pc.cock " + kok + "] between her thick thighs and against her slippery pussy. It only takes a few strokes for you to get fully hard, but you give it a few more, enough to make Lola moan a little from the thighjob. Simone climbs up onto the bed in front of her, rubbing at her nipples as she watches.");
	output("\n\nOnce your [pc.cock " + kok + "] is ready, you pull back and aim your [pc.cockHead " + kok + "] at Lola’s twat, then slide it into her depths, all the way into her with one solid shove. Lola moans as you fill her up, pushing back against you as she takes you to the hilt. Her ass slaps against your [pc.hips], hard enough to make you step back, and you step forward again and slam your dong into her, making her yelp.");
	output("\n\nYou take hold of Lola’s wide hips and start pounding away, watching her tanlined ass shake with every thrust, the sound of her skin slapping against you echoing throughout Simone’s bedroom. Simone rubs at her thick-lipped pussy, her big knob of a clit sticking out from between her fingers, moaning with every breath.");
	output("\n\n<i>“Come on, girl,”</i> Simone says, leaning in closer to Lola. <i>“Spread those legs wide for me.”</i>");
	output("\n\nLola slides her legs apart, and the feeling of her cunt wrapped around your [pc.cock " + kok + "] changes, her slick depths squeezing you in a new way. You adjust your angle just a little, plowing down into her like you did at the pool, making her moan again. Across from you, Simone licks her lips again, and says, <i>“Wider!”</i>");
	output("\n\n<i>“Can’t... go any... wider...”</i> Lola gasps, sounding like she can hardly talk.");
	output("\n\nYou reach down and grab one of Lola’s legs, lifting it up as you pound into her, and she babbles and moans, but keeps her balance. Simone says <i>“Hold that!”</i> and drops to the bed, then flips over onto her back and slides under Lola.");
	output("\n\nThe sound of your [pc.cock " + kok + "] slamming into Lola’s twat over and over is soon joined by the sound of Simone kissing, licking, and sucking her way down Lola’s body, moving toward the redhead’s crotch. Lola keeps moaning and gasping, sounding like she’s getting closer to coming, and then you feel Simone’s lips on your dick.");
	output("\n\nLola cries out, her whole body shivering, as Simone starts to give both of you oral at once. Her long cow-tongue lashes over your [pc.base] and Lola’s pussy, the extra attention making you both moan together. Lola ducks her head down and gives Simone’s pussy a few licks, but she’s gasping too much to keep at it for long.");
	output("\n\nSimone’s lips and tongue swap between Lola’s cunt and your [pc.cock " + kok + "] over and over,");
	if (pc.balls > 0) output(" and she slides it over your [pc.balls] along the way,");
	output(" driving the two of you even closer to orgasm. You force yourself to hold back, but Lola’s too far gone. Her twat clenches hard around your [pc.cock " + kok + "], and you hold tight to her ass and thigh as she screams, her orgasm making her whole body shake.");
	
	output("\n\nYou slowly let Lola’s leg down once she stops shuddering, and Simone slides out from under her, licking her lips. <i>“Not bad, you two,”</i> she says, and gives one of Lola’s tits a squeeze as the big-butted cowgirl flops over onto her side. <i>“But it’s my turn to ride, [pc.name].”</i> She winks at you again. <i>“Where do you want me?”</i>");
	
	IncrementFlag("TTGYM_LOLA_SIMONE_L_PUSSY");
	
	processTime(10 + rand(10));
	clearMenu();
	addButton(0, "Let Her Ride", penisRouter, [tentongymLolaSimoneHomeCockSingleNoHLLetHerRide, chars["SIMONE"].vaginalCapacity(0), false, 0]);
	if (pc.cockThatFits(chars["SIMONE"].analCapacity()) >= 0) addButton(1, "Fuck Her Ass", penisRouter, [tentongymLolaSimoneHomeCockSingleNoHLFuckHerAss, chars["SIMONE"].analCapacity(), false, 0]);
	else addDisabledButton(1, "Fuck Her Ass", "Fuck Her Ass", "You need a cock small enough for this!");
}
public function tentongymLolaSimoneHomeCockSingleNoHLLetHerRide(kok:int=0):void
{
	clearOutput();
	tentongymShowLolaSimone(true);	
	
	output("You tell Simone that if she wants a ride, she’s got one. She laughs, then pulls you onto her bed, making Lola scramble to get out of the way. You land on your back, [pc.cock " + kok + "] sticking up toward the ceiling, and Simone pops your [pc.cockHead " + kok + "] between her lips. She gives it a long suck, her eyes closing as she licks up Lola’s girlcum, then pulls back with a grin.");
	output("\n\n<i>“Hope your hips can handle this,”</i> Simone says, then hefts herself up and drops her twat down onto your dick.");
	output("\n\nSimone’s thick pussy lips squeeze your [pc.cock " + kok + "] between them all the way in, from head to shaft to base, and the two of you both moan as it slides up inside. She takes a deep breath once you’re all the way in, then shifts her hips forward and back, like she’s trying to find the way you feel best inside her. Next to you, Lola slowly sits up, a dreamy look on her face, and blinks a few times.");
	output("\n\n<i>“Mooooo...”</i> Lola moans. <i>“More?”</i>");
	output("\n\n<i>“Always,”</i> Simone says, then squeezes your [pc.hips] between her toned thighs. <i>“And [pc.heShe]’s got another place to ride, if you’re not done yet.”</i>");
	output("\n\nSimone starts pumping herself up and down on your [pc.cock " + kok + "], her abs flexing as she squeezes you hard, making you groan. She looks down at you, and takes her nipples in both hands, clenching them between her fingers. Sweat beads on her forehead, and she bounces harder on you, driving you into the bed.");
	output("\n\nLola watches the two of you for a moment, then giggles and rises to her knees. Without another word, she slings one thick thigh over your face, and slowly lowers her red-tufted pussy toward your [pc.lips].");
	output("\n\nYou slide your [pc.tongue] across Lola’s slippery pussy, and reach up to fondle her bouncy boobs. Her thighs crush in against your cheeks, and your tongue finds her little clit as quickly as it can. It doesn’t take long for her to start moaning, but trapped between her legs like this, you’re not sure how long you can hold out.");
	output("\n\nAnd with the pounding Simone’s pussy is giving your [pc.cock " + kok + "], you’re not sure how much longer it can take her either. She’s slamming herself down hard onto your dong now, her legs crushing against your [pc.hips] with every bounce, her thick lips squeezing your shaft the entire time. You feel her bulging clit rubbing against your [pc.base] every time she slams herself down, and she’s moaning loud, almost shouting.");
	output("\n\nAbove you, Lola keeps gasping, then suddenly stands up, leaving your tongue sticking up. She looks down at you, then turns around and drops down again, trapping you beneath her enormous ass. You take hold of her round, jiggling cheeks, and frantically lick at her clit over and over, hoping she comes before she crushes you.");
	output("\n\nFrom the squeezing she’s giving you, it sounds like Simone’s not far off. You thrust as hard as you can, bucking your [pc.hips] against her, and you can hear her boobs smacking her chest as she comes down onto you. Above you, Lola shifts forward, pressing her pussy harder against your lips. You feel her boobs land on your [pc.belly], and then hear Simone shout out loud.");
	output("\n\nThat sucking sound can only be Lola’s lips hard at work on Simone’s clit. Simone stops her frenzied pounding onto your [pc.cock " + kok + "], and instead jiggles her hips up and down on you in short, quick bursts, keeping her pussy in place so Lola can suck her throbbing nub. You work harder at Lola’s clit, squeezing her massive ass and giving it a few good smacks.");
	output("\n\nSimone’s frantic bouncing on your [pc.cock " + kok + "] has you about to go over the edge, and you hold back as long as you can, but it’s too much. You feel your orgasm building at your base, and slam your dong into Simone a few more times, just enough for her pussy to clench hard around you as she screams.");
	output("\n\nYou and Simone come together, her thick-lipped cunt squeezing so hard around your base you’re surprised you can even squirt into her. But [pc.cum] blasts out of your [pc.cock " + kok + "] in hot streams, your [pc.hips] slamming into her toned thighs as your dong shudders inside her.");
	if (pc.cumQ() >= 1000) output(" More and more [pc.cum] splatters into Simone, and you feel it flood out of her and pour across her thighs and yours, spilling out to cover her bed in [pc.cumColor].");
	
	output("\n\nIt’s all you can do to keep your tongue going against Lola’s clit through all this, but her thighs squeeze around your face after another few moments, and she moans hard as her third orgasm hits, her sticky cunt twitching against your lips. She tumbles off of you, breathing hard, her eyes rolled back.");
	output("\n\nSimone pulls herself up and off of your [pc.cock " + kok + "], [pc.cum] leaking out of her. She wipes sweat from her forehead, and takes a deep breath. <i>“Damn, you two,”</i> she says, and gives you a tired smile. <i>“Now that was a ride.”</i>");
	output("\n\n<i>“Mooo...”</i> Lola moans. It doesn’t seem like she can say much else right now.");
	output("\n\nThe three of you clean each other off. Simone looks a little tired, but otherwise fine, while Lola’s unsteady on her feet and flops back down on Simone’s bed once you’re done. You tell the two cowgirls that you’ll see them again sometime soon, and head out, back to the streets of New Texas.");
	
	processTime(10 + rand(10));
	
	chars["SIMONE"].loadInCunt(pc,0);
	pc.girlCumInMouth(chars["LOLA"]);
	pc.orgasm();
	
	IncrementFlag("TTGYM_LOLA_SIMONE_L_CUN");
	IncrementFlag("TTGYM_LOLA_SIMONE_S_PUSSY");
	
	processTime(30 + rand(15));
	clearMenu();
	addButton(0, "Next", move, "503");	
}
public function tentongymLolaSimoneHomeCockSingleNoHLFuckHerAss(kok:int=0):void
{
	clearOutput();
	tentongymShowLolaSimone(true);	
	
	output("You tell Simone you want to put it up her ass. She gives you a challenging look, then laughs and says, <i>“Well, you’re already lubed up, so let’s give that a go. Sit here.”</i> She pats the corner of the bed.");
	output("\n\nYou sit down on the corner of the bed, one leg to either side, your [pc.cock " + kok + "] sticking up and ready");
	if (pc.balls > 0) output(", your [pc.balls] hanging down off the bed’s edge");
	output(".");	
	
	output("\n\nLola sits up as you’re getting situated, looking a little dazed but ready for more. Once you’re in place, Simone turns her back to you, then starts to step backward, lowering her round, toned ass toward your [pc.cock " + kok + "].");	
	output("\n\nSimone moans as your [pc.cockHead " + kok + "] presses against her dark asshole, and Lola’s girlcum makes it easy for you to slip into her. It’s hot and tight inside, and she groans as she slowly, slowly slides herself down your shaft.");
	output("\n\nYou clench your hands into the bed’s covers, holding back as hard as you can as your [pc.cock " + kok + "] goes inch by inch into Simone’s muscled ass. Lola sits up behind you and presses her boobs to your back, rubbing at your [pc.chest], tweaking your [pc.nipples] and making you gasp.");	
	output("\n\n<i>“Lower,”</i> Lola says with a giggle, urging Simone on. <i>“Lower!”</i>");
	output("\n\n<i>“Almost... got it,”</i> Simone breathes, her thighs flexing as she squats down just a little lower. A single drop of sweat trails down her toned back, and she groans as she takes the last of your [pc.cock " + kok + "] up in her asshole, her fit ass finally reaching your crotch.");	
	output("\n\nSimone lets out a long, low moan, and you reach around to take hold of her huge boobs, squishing the globes against her as you pull her back toward you. She yelps as this pushes your [pc.cock " + kok + "] even farther into her ass, as much as you can possibly fit. Slowly, you start to pump your [pc.hips], moving just enough to get her going.");
	output("\n\n<i>“Ooh, that’s good,”</i> Simone says, leaning back against you. <i>“I don’t do this all the time, but damn, I should do it more...”</i>");	
	output("\n\nAfter a few more slow thrusts, Simone grinds her dark ass against you, and you pick up the pace. You plant your [pc.feet] on the floor and push up into her, and she groans again, one hand dropping down to squeeze your [pc.thigh].");
	output("\n\nLola lets go of your [pc.nipples] and rolls off the bed, then crouches down in front of Simone. She plants her face between Simone’s fit thighs, and Simone cries out as Lola starts licking her thick-lipped pussy, her tongue sliding all the way up to run across Simone’s throbbing clit.");	
	output("\n\n<i>“Oh,”</i> Simone gasps, her breath catching. <i>“That’s – aaah!”</i> She shouts, her whole body shaking as the sudden orgasm hits her. The combination of Lola’s tongue and your cock was too much for her, but she didn’t say to stop.");
	output("\n\nYou take that as an invitation to keep going, and thrust harder into her. Simone can only gasp as you shove your [pc.cock " + kok + "] into her ass again and again, making her butt bounce against your [pc.thighs] and grinding her twat against Lola’s face. Lola never stops licking Simone’s lower lips, her tongue darting out to slide up and down Simone’s giant clit again and again.");	
	output("\n\nThe sound of Simone’s flesh slapping against your [pc.skinFurScales] fills the room, accompanied by her moaning. After a moment, Lola starts sucking on Simone’s clit, and Simone’s gasps come faster and faster. Sweat drips down her skin, and her boobs bounce in your hands, her nipples hard as rocks.");
	output("\n\nThe constant squeezing and bouncing on your [pc.cock " + kok + "] has you getting closer and closer to another orgasm with every thrust. You force yourself to hold on, but with the moaning cowgirl on your lap, it’s not going to take you much longer.");	
	output("\n\n<i>“Aaaaah!”</i> Simone shouts, her nails digging into your [pc.thigh] as she bounces atop you. <i>“Gonna–”</i>");
	output("\n\nSimone comes all at once, her second orgasm making her shake and quiver as she rides you, her ass clenching your cock tight and deep within it. You keep thrusting into her the entire time, and Lola keeps licking away, until Simone lets her breath out all at once, then goes limp. She falls back against you, barely able to moan.");	
	output("\n\nAnother few thrusts into her, and you’re ready to burst, so you let it go. You groan loudly as the orgasm hits you, your [pc.cock " + kok + "] twitching and squirting up Simone’s ass, [pc.cum] blasting into her and coloring her insides [pc.cumColor].");
	if (pc.cumQ() >= 1000) output(" Stream after stream of [pc.cum] pours into Simone as your [pc.cock " + kok + "] keeps on coming, until it drips down out of her asshole to pool across the floor.");
		
	output("\n\nLola leans back from Simone’s crotch, licking her lips. <i>“I think she liked that,”</i> she says with a giggle.");	
	output("\n\nSimone moans again, and slowly pulls herself off of your softening [pc.cock " + kok + "], [pc.cum] dripping out of her ass. <i>“That was amazing,”</i> she says, then drops to the floor, breathing hard. After a moment, she sits up, then looks over at Lola. <i>“Damn,”</i> she says. <i>“I owe you an orgasm or two.”</i>");
	output("\n\nLola smiles. <i>“Okay!”</i>");	
	output("\n\nThe three of you clean each other off. Lola looks a little tired, but otherwise fine, while Simone’s unsteady on her feet and flops back down on her bed once you’re done. You tell the two cowgirls that you’ll see them again sometime soon, and head out, back to the streets of New Texas.");
	
	processTime(10 + rand(10));
	
	chars["SIMONE"].loadInAss(pc);
	pc.orgasm();
	
	IncrementFlag("TTGYM_LOLA_SIMONE_S_ASS");
	
	processTime(30 + rand(15));
	clearMenu();
	addButton(0, "Next", move, "503");	
}
public function tentongymLolaSimoneHomeCockSingleHL(kok:int=0):void
{
	clearOutput();
	tentongymShowLolaSimone(true);	
	
	output("You tell Simone to grab her hardlight. She gives you a wicked grin, then says, <i>“You two get started. I’ll be right back.”</i>");
	output("\n\nLola gets onto Simone’s large bed and motions for you to do the same, then gets on her hands and knees in front of you. She ducks her head down, aiming for your [pc.cock " + kok + "], then leans back. <i>“Can you lie down?”</i> she asks, looking up at you. <i>“I need to get you hard again, and it’ll be easier that way.”</i>");
	output("\n\nCan’t say no to that. You lie down with your [pc.legs] stretched out in front of you, and Lola moves in, dropping her head down. She gives your [pc.cock " + kok + "] a long lick from head to base and back again, her soft tongue swiping back and forth all the way down your length. You feel your cock start to get hard again, and you let out a soft groan, still sensitive from coming just a minute or two ago.");
	output("\n\nLola pops your [pc.cockHead " + kok + "] into her mouth and sucks on it, looking up at you as she does, her lips massaging you as you grow slowly stiffer. You reach forward and stroke Lola’s hanging boobs, running your fingers along their soft sides as she sucks on you, and she bobs her head down lower.");
	output("\n\nJust as you and Lola are really starting to get into the blowjob, Simone steps out of her bathroom wearing a black thong, the front of it squeezed between her thick pussy lips. She flicks a switch on the side, and a bright pink ten-inch hardlight horsecock springs up.");
	output("\n\nSimone looks at you and Lola and licks her lips. <i>“Now that’s what I like to see,”</i> she says, and walks to the edge of her bed. Without another word, she grabs hold of Lola’s big, round butt and shoves her hardlight deep into the redhead’s pussy.");
	output("\n\nLola moans hard around your [pc.cock " + kok + "], her eyes closing as her mouth drops open, leaving her gasping around your [pc.cockHead " + kok + "]. Simone’s abs flex as she slams the dildo hard into Lola, starting off fast, making Lola’s tits and ass bounce.");
	output("\n\nThe sight is enough to drive your dick closer to full hardness, and you give Lola’s tits another squeeze. She bobs her head back down, her eyes hanging half-open, and she moans around your [pc.cock " + kok + "] every time Simone thrusts into her. Simone’s hips slap into Lola’s ass again and again, and she gives the tan-lined cowgirl a hard swat on her rear, making her squeal.");
	output("\n\n<i>“Keep it up down there,”</i> Simone says with a laugh, then spanks Lola again. Her huge boobs bounce as she thrusts, slapping against her dark skin, her nipples hard and jutting out. There’s a fine sheen of sweat on her forehead, but she looks like she could keep this up as long as she wants.");
	output("\n\nLola’s moaning grows deeper, and she seems like she’s having trouble focusing on your [pc.cock " + kok + "]. You slide yourself down the bed and slip your dong between her bouncing tits, leaving the head free for her to lick. She drops her head down lower and runs her tongue over your [pc.cockHead " + kok + "], her eyes rolling back in her head from Simone’s non-stop fucking.");
	output("\n\nBehind her, Simone’s toned arms and thighs shine with sweat, and she never breaks her rhythm, keeping up a fast, hard pounding into Lola’s cunt. She’s breathing harder now, but it doesn’t seem like she’s in danger of coming right away.");
	output("\n\nLola, however, is another story. She’s barely licking your [pc.cockHead " + kok + "] now, and she looks dizzy and distracted, her eyes rolling back. You pump your [pc.cock " + kok + "] between her boobs, timing your thrusts with Simone’s, tweaking Lola’s nipples with your thumbs. That only makes her cry out more, and she pushes back against Simone, breathing hard.");
	output("\n\n<i>“She close?”</i> Simone asks you, and you nod. <i>“Damn, girl,”</i> Simone says, laughing a little. <i>“It’s like you–”</i>");
	output("\n\nLola moans again, loud enough to drown out Simone, then tilts her head back and cries out as she starts to shake. Her orgasm sends her tits bouncing hard around your [pc.cock " + kok + "], making them slap against your shaft as she comes. She shudders, then starts moaning again, because Simone doesn’t let up on her for a second.");
	output("\n\nYour cock’s fully hard again, but it doesn’t look like you’re going to get much more out of Lola, not as fuck-drunk as she looks. You could slide under her and fuck her, and Simone would probably be good to swap to Lola’s ass. Or you could fuck Simone instead, though her hardlight’s covering up her pussy, so you’d have to go for her ass.");

	processTime(10 + rand(10));

	clearMenu();
	addButton(0, "DP Lola", penisRouter, [tentongymLolaSimoneHomeCockSingleHLDPLola, chars["LOLA"].vaginalCapacity(0), false, 0]);	
	if (pc.cockThatFits(chars["SIMONE"].analCapacity()) >= 0) addButton(1, "Fuck Simone", penisRouter, [tentongymLolaSimoneHomeCockSingleHLFuckSimone, chars["SIMONE"].analCapacity(), false, 0]);
	else addDisabledButton(1, "Fuck Simone", "Fuck Simone", "You need a cock small enough for this!");
}
public function tentongymLolaSimoneHomeCockSingleHLDPLola(kok:int=0):void
{
	clearOutput();
	tentongymShowLolaSimone(true);	
	
	output("You and Simone are already sharing Lola, might as well go all the way. You slide yourself under Lola, and her tits slap against your [pc.hips] and [pc.chest] as you go. When you’re almost to her crotch, you tell Simone to switch it up, and she laughs.");
	output("\n\nSimone pulls out as your [pc.cock " + kok + "] rubs against Lola’s slippery twat, and Lola gasps. You grab hold of Lola’s wide hips and slide your dick up into her, her slippery depths taking you to the hilt all at once. Lola moans above you, and her thick thighs slap down onto your [pc.hips] as she hits home. You groan as she settles herself down on you. That’s a lot of hips and ass on you all at once.");
	output("\n\nShe might not normally like being on top, but Lola clearly has no trouble with it, grinding herself against you in long, slow strokes. You reach up and take hold of her tits again, rubbing her nipples between your fingers and making her squeal. Then, you hear Simone’s deep chuckle, and Lola goes tense all at once.");
	output("\n\nLola’s moan starts off low and quickly gets higher and higher as Simone slides her pink hardlight horsecock right up Lola’s ass. The double penetration makes Lola arch her back, shoving her bouncy boobs into your hands, and Simone takes hold of Lola’s hips and squeezes hard.");
	output("\n\nYou feel the pressure from Simone’s hardlight inside Lola on your [pc.cock " + kok + "], and adjust your angle, then keep pumping away. Lola’s slick depths wrap tight around your cock as Simone pounds into her, and Lola’s head drops down, her mouth hanging open, a look of utter bliss on her face.");
	output("\n\nAbove you, Simone picks up her pace, hammering her dildo into Lola’s ass with ease, until she’s going as fast and hard as she was into Lola’s pussy. The woman has no mercy with that thing. She lifts one leg up onto the bed next to your [pc.legs], and mounts Lola, driving her hardlight deeper and deeper into the redhead’s giant ass.");
	output("\n\nLola’s gasping now, sounding like she can hardly catch her breath, her nipples hard against your palms from the double pounding she’s getting. <i>“Mooooo,”</i> she moans, and you can’t tell if she’s about to come again or just can’t even come close to forming words.");
	output("\n\nSimone somehow goes even faster, and she starts to gasp, her thighs slapping against Lola’s ass over and over. The increased pressure on your [pc.cock " + kok + "] makes you thrust harder into Lola’s cunt, and you feel your orgasm building at your base again, your [pc.cock " + kok + "] already almost ready to burst. You try to fight it off, but you know you can’t hold on much longer.");
	output("\n\nLola gasps out one quick <i>“Moo,”</i> then another, then a third and starts babbling, and her pussy clenches hard around your [pc.cock " + kok + "] as she comes again, her whole body shaking once more. Behind her, Simone shouts, and you feel her slam into Lola even harder than before.");
	output("\n\n<i>“[pc.Name]!”</i> Simone shouts. <i>“Come with me!”</i>");
	output("\n\nYou squeeze Lola’s boobs hard and let yourself go, and your [pc.cock " + kok + "] twitches as you drive yourself into Lola one last time. You and Simone come together, her dark, toned thighs slapping against Lola’s ass over and over as she screams, barely keeping her balance with one leg on the bed. Your [pc.cock " + kok + "] spurts [pc.cum] into Lola as your orgasm rips through you, streams shooting deep in her tight, slippery depths.");
	if (pc.cumQ() >= 1000) output(" The sheer amount of [pc.cum] you make is enough to make Lola’s belly bulge, and it swells against your [pc.belly]. A few streams shoot out of her, making a mess on you and Lola both and splattering all over Simone’s legs.");
		
	output("\n\nLola collapses on top of you, breathing hard, her eyes out of focus. She moans as Simone pulls the hardlight out of her, and slowly rolls off of your [pc.cock " + kok + "], [pc.cum] dripping out of her. She mumbles <i>“Mooooo...”</i> one last time, then her eyes slowly shut, and she falls fast asleep.");
	output("\n\nSimone laughs, then turns off her hardlight and looks down at you. <i>“Looks like we wore her right out,”</i> she says, shaking her head. <i>“Not the first time I’ve done that, won’t be the last.”</i> She holds out a hand to you. <i>“Come on, [pc.name]. She can sleep it off, but let’s get cleaned up.”</i>");
	output("\n\nYou and Simone clean each other up, and do the best you can for Lola, trying not to wake her. She hardly stirs, and it looks like she’ll stay asleep for a good long time. Simone says she’ll take care of her.");
	output("\n\nYou Simone that you’ll see them again sometime soon, and head out, back to the streets of New Texas.");
	
	processTime(10 + rand(10));	
	
	chars["LOLA"].loadInCunt(pc,0);
	pc.orgasm();
	
	IncrementFlag("TTGYM_LOLA_SIMONE_L_PUSSY");
	
	processTime(30 + rand(15));
	clearMenu();
	addButton(0, "Next", move, "503");	
}
public function tentongymLolaSimoneHomeCockSingleHLFuckSimone(kok:int=0):void
{
	clearOutput();
	tentongymShowLolaSimone(true);	
	
	output("Lola’s getting the penetration she likes, but why should she have all the fun? You press gently on the back of Lola’s head, making her suck more of your [pc.cock " + kok + "], making sure you’ve got enough lube for Simone’s ass. She slides her tongue up and down your length, but she still seems too distracted by Simone’s non-stop pounding to give you a real blowjob.");
	output("\n\nAfter a little more of that, you decide it’ll do, and slide out from under her. You stand, your hard [pc.cock " + kok + "] pointing toward Simone, and walk around behind her. She looks over her shoulder, her hips never missing a stroke, and smirks as you slap your [pc.cock " + kok + "] against her toned ass.");
	output("\n\n<i>“Where you gonna put that,[pc.name]?”</i> she asks, and gives you a wink. She leans forward over Lola, dropping her huge tits onto Lola’s tanlined back, and raises her hips toward you.");
	output("\n\nIt looks like you were right about her thong – it’s covering up her pussy too much for you to fit inside. So, you pull the black strap to one side, then press your [pc.cockHead " + kok + "] against her dark asshole.");
	output("\n\n<i>“Oh,”</i> Simone breathes, and her thrusting slows, her grip on Lola’s ass growing tighter. <i>“Go slow, I don’t do that all the time,”</i> she says.");
	output("\n\nYou take hold of Simone’s hips and slide your [pc.cockHead " + kok + "] into her ass, Lola’s spit making it easy for you to go in. Simone groans hard, and she stops thrusting entirely, pushing herself back against your [pc.cock " + kok + "].");
	output("\n\nHer ass is hot and tight, and you take your time sliding into her, slowly pressing your length in between her cheeks. You reach around and take hold of her huge tits, squeezing them against her chest as your [pc.cock " + kok + "] works all the way into her asshole, until your [pc.hips] touch her toned ass.");
	output("\n\nSimone moans, and you start to thrust together, your dong driving into her as she pounds her hardlight horsecock up Lola’s twat. Lola looks back over her shoulder, a dizzy expression on her face.");
	output("\n\n<i>“Moo,”</i> Lola breathes, then manages to say, <i>“Harder!”</i>");
	output("\n\n<i>“Doing the best I can with a cock in my ass,”</i> Simone says, her breath catching. She gives Lola’s giant ass another good squeeze, then chuckles, and pushes back against you.");
	output("\n\nYou groan as Simone’s ass shoves you back hard, and push against her, burying your [pc.cock " + kok + "] completely in her depths. She pushes down on Lola’s hips, and you realize what she’s doing. You watch as she pulls the hardlight out of Lola, and you pull about halfway out of her, ready for the next thrust.");
	output("\n\nSimone shoves her dildo hard up Lola’s big, round ass, driving ten inches of horsecock into her. Lola arches her back and cries out, and you pound your [pc.cock " + kok + "] right back into Simone’s ass, making her moan to match Lola. For a moment, all three of you stop thrusting as everyone adjusts, until Simone groans and slams into Lola as hard as she can.");
	output("\n\nLola rears back, and Simone reaches around and takes hold of Lola’s boobs, squeezing them just like you’re squeezing hers. The cowgirls’ gasps and moans fill the room, and you pound harder into Simone’s ass, your every thrust driving her dildo deeper into Lola’s ass. In return, Lola shoves her butt harder back against Simone, pushing her against you and making you fuck her even deeper.");
	output("\n\nWith the three of you ass-fucking each other all at once, you’re not sure how much longer you can hold on, and you’re not the only one. All three of you are breathing hard, and Simone’s nipples are hard as rocks between your fingers. She and Lola are both sweating, and Lola’s head lolls back against Simone’s shoulder as the dark-skinned cowgirl fucks her silly.");
	output("\n\nFinally, Simone shouts and clenches around you, and the hot tightness around your [pc.cock " + kok + "] is more than you can take. The two of you come at the same time, your dong twitching as streams of [pc.cum] pour into her ass, your [pc.hips] hammering hard against her toned ass.");
	if (pc.cumQ() >= 1000) output(" Your [pc.cock " + kok + "] fires off jet after jet of [pc.cum], and it squirts out from her asshole, covering her ass and your crotch in [pc.cumColor] and dripping down to pool on the floor.");
	output(" Lola’s whole body starts to shake a moment later, and she screams, her ass slapping against Simone as the orgasm hits her.");
	
	output("\n\nSlowly, the three of you stop thrusting into and against each other, all breathing hard and shaky. You slowly pull your [pc.cock " + kok + "] out of Simone’s ass, [pc.cum] dripping from your length, and step back so she can pull out of Lola. Simone frees her hardlight from Lola’s ass, then turns it off and takes a deep breath.");
	output("\n\nLola rolls over onto her side, looking dizzy and happy. <i>“And that’s why threesomes are the best ever,”</i> she says, and giggles.");
	output("\n\n<i>“No kidding,”</i> Simone says with a chuckle, then wipes sweat from her forehead. <i>“We need to get cleaned up, but we have got to do this again.”</i>");
	output("\n\nThe three of you clean each other off. The two of them both look tired, and they flop back down on Simone’s bed once you’re done. You tell them both that you’ll see them again sometime soon, and head out, back to the streets of New Texas.");
	
	processTime(10 + rand(10));
	
	chars["SIMONE"].loadInAss(pc);
	pc.orgasm();
	
	IncrementFlag("TTGYM_LOLA_SIMONE_S_ASS");
	
	processTime(30 + rand(15));
	clearMenu();
	addButton(0, "Next", move, "503");	
}

public function tentongymLolaSimoneHomeCockMulti(choices:Array):void
{
	clearOutput();
	tentongymShowLolaSimone(true);	
	
	var kok:int = choices[0];
	var kok2:int = 0;
	if (choices.length > 1) kok2 = choices[1];
	
	output("You climb onto Simone’s huge bed, then lean back and make yourself comfortable. Lola joins you a moment later, but Simone pauses as she’s about to do the same.");
	output("\n\n<i>“Get [pc.himHer] going,”</i> Simone says, and heads for her bathroom. <i>“There’s something we’ll need.”</i>");
	output("\n\nLola sits down next to you and stares down at your dicks. You’re not hard yet thanks to the blowjob Simone just gave you, but the thought of going another round with her and Lola has you eager to get ready again. Lola giggles, then starts stroking you, a cock in each hand, her touch smooth as she runs her hands up and down your lengths.");
	output("\n\nAnd damn, that feels good. Lola’s giving you just enough of a squeeze to get you going again. She licks her lips as your cocks start to swell, her eyes focused on your crotch the entire time.");
	output("\n\nThen, Simone steps out of her bathroom, holding a bottle of lube with a happy cowgirl’s face on it and a box of cleaning wipes. <i>“Got to keep you clean if we’re both going for a ride,”</i> she says, then steps over and jumps onto the bed.");
	output("\n\nSimone drops the wipes and pumps some lube onto her palm, then rubs her hands together. She joins Lola’s work, running her lubed hands up and down your dicks, giving you a harder squeeze and slicking you up.");
	output("\n\nWith the cowgirls’ four hands at work, it doesn’t take long until you’re fully hard again, lubed up and ready to go. Lola doesn’t even pause in her work, just keeps stroking even when your cocks’ heads are pointed at the ceiling. Simone wipes her hands on her own tits, then nudges Lola.");
	output("\n\n<i>“You up for going first?”</i> she asks. She nudges Lola again, who blinks a few times before nodding.");
	output("\n\n<i>“Sure,”</i> Lola says, then reaches over and wipes off her hands on Simone’s boobs, making her laugh. Lola slowly gets to her feet, her boobs and ass wobbling as she balances on Simone’s bed, and stands over you, then spreads her thick thighs wide.");
	output("\n\nLola aims her red-tufted pussy at your [pc.cock " + kok + "], then slowly squats down, bringing her slick lips toward your head. Simone grabs your [pc.cock " + kok2 + "] and points it right at Lola’s ass, bringing it in line as Lola descends.");
	output("\n\nYour [pc.cockHead " + kok + "] slides between Lola’s lips with ease, and she lets out a slow moan, then gasps as your [pc.cock " + kok2 + "] pops between her cheeks and right into her tight little asshole. Her eyes open wide, and she freezes for a second, her face bright red.");
	output("\n\n<i>“All the way down,”</i> Simone says, and chuckles as Lola eases herself down onto your cocks. Her dark nipples are hard and gleaming with lube, and she starts rubbing herself as she watches you and Lola fuck.");
	output("\n\nLola moans loudly as she takes your cocks all the way up into her, and her thighs hit home on either side of your [pc.hips], fully penetrated in both holes. She’s breathing hard already, and you thrust your hips, making her jump and squeal. She drops her hands to your [pc.chest], pushing down on you as she starts working herself back and forth, squeezing your dicks inside her.");
	output("\n\nSimone laughs again. <i>“Not going to last long like that, are you?”</i> she asks, then straddles your [pc.legs] behind Lola. She reaches around and grabs Lola’s boobs, her dark hands giving them a squeeze.");
	output("\n\nLola moans again, leaning back against Simone, her eyes rolling up in their sockets. You keep thrusting into her, her slick pussy and tight asshole clenching down hard on your cocks, and Simone gives her a long lick along the side of her neck.");
	output("\n\nA few more thrusts, and Lola’s just about done for. She pants and moans atop you, her tongue hanging out, her tits slapping against her chest with every thrust. Finally, her pussy squeezes hard on your [pc.cock " + kok + "], and she leans back against Simone, then screams as her orgasm hits. Lola’s whole body shakes on top of you, slamming your cocks back and forth inside her. She wobbles back and forth, then collapses, her bouncy boobs squishing against your [pc.chest] as she lets out an exhausted <i>“Moooo...”</i>");
	output("\n\nLola rolls off of you a moment later. <i>“I told you,”</i> she says, still breathing hard, <i>“taking two dicks like that wears me out.”</i> She shivers, a pleased smile on her face. <i>“Worth it...”</i>");
	output("\n\nWithout missing a beat, Simone grabs the cleaning wipes and rubs your [pc.cock " + kok + "] and [pc.cock " + kok2 + "] with them, leaving your dicks clean and shiny. She pumps out some more lube and rubs you up once more, then grins down at you once your cocks are glistening again.");
	output("\n\n<i>“Always look forward to this part,”</i> Simone says, then hops up and straddles you and points your cocks toward her crotch and ass.");
	output("\n\nYour [pc.cock " + kok + "] slides between Simone’s thick lips all at once, and she leans back and takes your [pc.cock " + kok2 + "] into her hot, tight asshole, then lets out a long moan. <i>“Damn, that’s good,”</i> she breathes.");
	output("\n\nYou reach up and take hold of Simone’s lubed-up tits, rubbing the slick stuff all over her huge globes. Remembering what she liked from your time in the gym, you squeeze both her nipples, and she shouts, shoving herself down harder onto your cocks. Both your lengths are caught deep within her, and she clenches herself around your dicks, then starts hammering herself hard down on to you.");
	output("\n\nThe bed shakes as Simone’s fit hips pound you into it, her toned thighs squeezing your [pc.hips] as she does her best to ride you right down to the floor. You give her nipples another pinch and thrust back up into her, your [pc.cock " + kok + "] pounding into her pussy, your [pc.cock " + kok2 + "] squeezed tight into her ass as you try to shove in more of it.");
	output("\n\nShe groans again, and grabs your hands on her tits, her arms flexing as she holds you and her boobs in place. She’s sweating already, small drops trailing down her forehead and chest and abs, and while she might last longer than Lola, it’s clear she’s already working her way toward another orgasm.");
	output("\n\nAfter another dozen thrusts, Lola stirs beside you, then rolls over onto her side and watches you and Simone for a moment. She giggles, then says, <i>“Boobs,”</i> and slowly sits up. Lola slides over the bed and straddles your [pc.legs], her thick thighs sliding up them, until she’s behind Simone.");
	output("\n\nSimone’s breaths come faster and faster, and she moans every thrust or two, then yells as Lola’s hands come around her from behind and latch onto her boobs. Simone’s tits are large enough for six hands on them, and she groans as you and Lola massage her globes, giving her nipples and cleavage and sides all the attention she could want.");
	output("\n\n<i>“Harder!”</i> Simone shouts, and you hammer into her as hard as you can. After only a few more thrusts, she tilts her head back and shouts, her cunt and asshole clenching hard around you she comes, her grind against you turning into a long, rough shake.");
	output("\n\nAfter riding out her orgasm, Simone slowly eases herself off of you, sweaty and breathing hard. She and Lola clean off your dicks, and she gives you a look. <i>“Damn, [pc.name], you didn’t come from all that?”</i>");
	output("\n\nYou tell her you’re used to having this many dicks by now, and can handle getting off with more than one. And she did just blow you not long ago, so you can hold off for a while longer.");
	output("\n\nLola giggles. <i>“Only a little longer?”</i>");
	output("\n\n<i>“Sounds like a challenge to me,”</i> Simone says with a chuckle. She gives you a sultry look. <i>“We’ll let you pick how, but let’s see how you handle both of us at once.”</i>");	
	output("\n\nHow do you want them?");
	
	processTime(15 + rand(15));
	
	IncrementFlag("TTGYM_LOLA_SIMONE_DP");
	
	clearMenu();
	addButton(0, "Get Rode", tentongymLolaSimoneHomeCockMultiGetRode,[kok,kok2]);	
	addButton(1, "Get Blown", tentongymLolaSimoneHomeCockMultiGetBlown,[kok,kok2]);	
}
public function tentongymLolaSimoneHomeCockMultiGetRode(choices:Array):void
{
	clearOutput();
	tentongymShowLolaSimone(true);	
	
	var kok:int = choices[0];
	var kok2:int = 0;
	if (choices.length > 1) kok2 = choices[1];	
	
	output("You tell the girls you want them both to ride at once. Lola’s eyes open wide, and Simone laughs. <i>“Sure, if you feel like getting your hips crushed,”</i> she says.");
	output("\n\nWorth it, you say.");
	output("\n\nLola looks back and forth between you and Simone for a moment, then gets to her feet again, though she’s wobbly and looks tired. <i>“If I have to be on top,”</i> she says, <i>“I want this one.... in my ass!”</i>");
	output("\n\nBefore you can move, Lola reaches down and takes hold of your [pc.cock " + kok2 + "], then squats her massive booty down on top of you and shoves your length up into her ass. She moans hard as she leans her ass back, taking you deep into her, until her butt slaps down onto you.");
	output("\n\nSimone straddles you again a second later, taking hold of [pc.cock " + kok + "] and pushing it back up between her thick pussy lips. You fill her to the hilt again, and she reaches forward to grab Lola’s boobs, squishing her own massive, slick tits against Lola’s back. The redhead cowgirl leans right up against Simone, hardly any space between them. ");
	if (pc.cockTotal() >= 4) output(" Your unused dicks are caught between them, trapped against Lola’s expansive asscheeks. Simone’s pussy lips rub against them, her throbbing knob of a clit bumping your dicks’ bases with every motion.");
	else if (pc.cockTotal() == 3) output(" Your only unused dick is caught between them, trapped between Lola’s expansive asscheeks. Simone’s bulbous clit rubs against it, the throbbing knob massaging your dick’s base with every motion.");
	
	output("\n\nIt takes a moment for the girls to get themselves situated, but they both start grinding against you and each other, and you let out a long groan at the mixed sensation and the feeling of having the two cowgirls on top of you. You thrust, but it feels like you can hardly move, not with both of them straddling your [pc.hips].");
	output("\n\nSimone laughs, and looks down at you over Lola’s shoulder. <i>“Too much for you to handle, [pc.name]?”</i> She gives Lola’s boobs another squeeze, making her moan.");
	output("\n\nLola looks dazed already, and keeps pushing her ass down onto you, like she’s trying to take as much of your prick into her as she can. She rubs at her pussy with a free hand, and as you watch, Simone’s hands squeeze both of her nipples, making her gasp.");
	output("\n\nSimone’s thighs are clenched around your [pc.thighs], and she shoves herself down onto you as hard as she can, making the bed creak and shake. You feel your orgasm building at the base of your [pc.cocks], and wonder if you’ll come before the bed breaks beneath the three of you.");
	output("\n\nIt already looks like Lola’s not far from coming. Her eyes are rolled back again, and her hand works furiously between her legs, her tight asshole squeezing your dong without mercy. You pump harder into the two cowgirls, making Simone groan again, and keep it up as long as you can, feeling the inevitable pressure of [pc.cum] deep within you urging to be released.");
	output("\n\nSimone shifts forward and cries out, her pussy squeezing hard on your dick, her hands working away at Lola’s boobs. <i>“Gonna,”</i> she moans. <i>“Damn, too quick!”</i>");
	output("\n\nA few more squeezes on both of your tightly-bound dicks, and it’s all you can do to hold on until the girls come. But another few thrusts is enough for both of them.");
	output("\n\nYou don’t know who comes first, or if you all come at once, or if it even matters. The room fills with screams and moans as everyone orgasms in the space of a few seconds, Lola shaking above you again, Simone shouting toward the ceiling. Your [pc.cocks] fire off over and over, [pc.cum] filling Simone’s pussy and Lola’s ass in long streams");
	if (pc.cockTotal() >= 4) output(", more shots bursting up from between the two girls to splatter [pc.cum] all over them both");
	output(".");
	if (pc.cumQ() >= 1000) output(" By the time you’re done, there’s [pc.cum] dripping from between their legs and splattered all over the bed, dripping down to the floor.");
		
	output("\n\nIt’s a long moment before you or either of the cowgirls can move or speak again. Simone slowly pulls herself free first, [pc.cum] spilling down her toned legs. Lola groans as she flops down on top of you, [pc.cum] leaking from her ass as your dick pops out, and she lets out a quiet <i>“Mooo...”</i> as she goes limp.");
	output("\n\nOnce she’s caught her breath, Simone just says <i>“Damn,”</i> and gives herself a good shake. <i>“Okay. Rest first, then we have got to get this cleaned up.”</i>");
	output("\n\nThe three of you take a few minutes to recover, and get both the bed and each other cleaned up once you can move again. Lola falls asleep once you’re done, and Simone laughs, then says she’ll take care of her.");
	output("\n\nYou gather your gear, tell her you’ll definitely have to do this again, then head out to the streets of New Texas.");
	
	processTime(10 + rand(10));
	
	chars["LOLA"].loadInAss(pc);
	chars["SIMONE"].loadInCunt(pc,0);
	pc.orgasm();
	
	IncrementFlag("TTGYM_LOLA_SIMONE_DBL_RIDE");
	
	processTime(30 + rand(15));
	clearMenu();
	addButton(0, "Next", move, "503");	
}
public function tentongymLolaSimoneHomeCockMultiGetBlown(choices:Array):void
{
	clearOutput();
	tentongymShowLolaSimone(true);	
	
	var kok:int = choices[0];
	var kok2:int = 0;
	if (choices.length > 1) kok2 = choices[1];
	
	output("You tell the girls that since you just got both of them off, you’d love for them to blow you. And since you’ve got enough dicks for both of them, why not?");
	output("\n\n<i>“Oh, we can do that,”</i> Lola says, then giggles and stretches out on the bed next to you, flopping down on her stomach. This brings her tits in right next to your crotch, and she props herself up on her elbows, then starts licking your [pc.cock " + kok + "].");
	output("\n\nSimone chuckles. <i>“This would be easier on the weight bench, but I think I’ll manage.”</i> She steps over to your other side, and lays down next to you like Lola did, then gives your [pc.cock " + kok2 + "] a long kiss on the head.");
	output("\n\nYou could definitely get used to this. You prop your head up on your arms, and watch the girls get to work.");
	output("\n\nLola bows her head over your [pc.cock " + kok + "], her lips wrapped around the head, slowly bobbing up and down as she sucks it about halfway into her mouth. Her tongue sways back and forth, up and down along your shaft, and she takes in a little more of you each time she drops her head down");
	output("\n\nNext to her, Simone looks right at you as her long cow-tongue wraps around your [pc.cock " + kok2 + "] head, gently tugging on it. She slides her tongue further down your shaft, and presses her lips to your head, a gentle pressure that she slowly increases until she’s got the entire head in her mouth.");
	output("\n\nYou groan at the dual sensation, and do your best to hold on. Even though you’re used to having more than one dick, there’s only so much you can do when they’re getting this much attention.");
	output("\n\nLola slides forward a little, and pushes her head down onto the cock she’s sucking, sliding more and more of it between her lips. She moans around your [pc.cock " + kok + "], and bobs her head up and down, going farther up and then as far down as she can get, passing more and more of your [pc.cock " + kok + "] between her lips every time.");
	output("\n\nSimone slides her wide tongue all the way out and lashes it back and forth, up and down your shaft, then sits up a little and shoves her tits forward, wrapping her huge globes around your [pc.cock " + kok2 + "]. She lets out a low chuckle as you moan, the sudden sensation of having your dick wrapped in that much boob making it even harder for you to hold back.");
	output("\n\nNot to be outdone, Lola pulls her own tits forward, and slides your wet dick in between them. The two girls start bobbing up and down until their lips kiss their own boobs, utterly engulfing your cocks.");
	if (pc.cockTotal() >= 4) output(" After a moment, Simone grabs hold of one of your untouched cocks and shoves it between her boobs, making it poke out in front of the one she’s sucking. Lola follows suit a moment later, trapping you in a quadruple titfuck.");
	else if (pc.cockTotal() == 3) output(" After a moment, Simone grabs hold of your one untouched cock and shoves it between her boobs and Lola’s, giving it a titfuck from both of them.");
	
	output("\n\nIt’s all you can do to hold on, and as much as you’d like to, you know you can’t last much longer. After you fight to hold back another moan, Simone chuckles again, and sucks harder on your [pc.cock " + kok2 + "], smashing her tits against you as much as she can. Lola just keeps bobbing up and down, intent on the cock in her mouth and nothing else, her eyes half-closed and a blissful look on her face.");
	output("\n\nFinally, you can’t take it anymore. You warn the girls you’re about to come, and neither of them stop for a second. The pressure at the base of your [pc.cocks] overwhelms you, and your whole body tenses for a few blissful seconds before your cocks explode.");
	output("\n\nStream after stream of [pc.cum] floods the cowgirls’ mouths as your orgasm slams into you, and both of them moan in pleasure, their sucking never ceasing.");
	if (pc.cockTotal() >= 4) output(" More [pc.cum] shoots forth from between the girls’ tits, splattering all over their globes and dripping down between them, leaving both of them with sticky chests.");
	if (pc.cumQ() >= 1000) output(" The sheer amount of [pc.cum] you make is too much for Lola and Simone both, and it floods out of their mouths and across their boobs and all over Simone’s bed, leaving the two of them and the covers and the floor covered in [pc.cumColor].");
		
	output("\n\nYou lay there gasping for a moment as the girls pull away. Both of them lick [pc.cum] off of their lips, and they look very pleased with themselves. Simone leans over and kisses Lola on the lips, and the two of them lick off each others’ faces, then lean down to catch the [pc.cum] dripping down each others’ boobs.");
	output("\n\nThe two of them clean you off, and each other, and you all take a few minutes to recover once everything’s done. By then, Lola has fallen asleep, and Simone laughs, then says she’ll take care of her.");
	output("\n\nYou gather your gear, tell her you’ll definitely have to do this again, then head out to the streets of New Texas.");
	
	processTime(10 + rand(10));
	
	chars["SIMONE"].loadInMouth(pc);
	chars["LOLA"].loadInMouth(pc);
	pc.orgasm();
	
	IncrementFlag("TTGYM_LOLA_SIMONE_DBL_BJ");
	
	processTime(30 + rand(15));
	clearMenu();
	addButton(0, "Next", move, "503");	
}
