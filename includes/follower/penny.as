public function pennyCrewDesc():String {
	var buffer:String = "";
	//Badgurquest raygun handoff 
	if(flags["BADGER_QUEST_TIMER"] == -1 && !pc.hasKeyItem("Doctor Badger's Bimbo Raygun - Still programmed for use on Penny.")) 
	{
		buffer += "<b>You got her message, talk to Penny to see how you can <b>turn the tables</b> on Dr. Badger!</b>";
		//addButton(0,"Penny",turnTheTablesOnBadger);
	}
	//Shortcut friend penny if bimboed.
	else if(flags["PENNY_BADGER_BIMBO"] != undefined)
	{
		if(flags["SEEN_BIMBO_PENNY"] == undefined) buffer += "Penny is sitting up straight in her chair, looking fairly perky and attentive, considering her recent transformation into a hyper-sexed, hermaphroditic bimbo.";
		else if(hours >= 8 && hours < 17) buffer += "Penny is at her desk looking a little pent-up - and drinking something suspiciously white from her coffee cup.";
		else buffer += "Penny is slouched with a lazy, half-aware grin on her face. Now that she’s onboard your ship, she has no reason not to indulge herself beneath her desk.";
		buffer += " She doesn’t seem to notice you, that or she can’t see you past all the cum plastered over her fur.";
		//addButton(0,"Approach",approachBimboPenny);
		//return false;
	}
	//Girlfriend penny
	else {
		//Non-Futa
		//Appearance blurb: 
		if(!penny.hasCock()) buffer += "Penny keeps herself busy on your ship. The gene-spliced fennec seems content to pass her time honing her fitness and tending to the various security apparatus onboard. She isn’t all business, however. Sometimes you hear a the garbled voices of an anime, and she frequently favors you with lusty leers in the hallways.";
		//FUTA!
		//Appearance Blurb: 
		else 
		buffer += "Penny keeps herself busy on your ship, though when she sees you, it’s when a knowing smile and a brazen leer. Her nipples are hard enough to jut through whatever she dares to wear, and given that she’s packing sex organs for two, it makes more than a little sense. The fennec tries her best to keep her raging hormones in control, but she can’t quite seem to stifle her wanton moans during her frequent bouts of masturbation.";
	}
	return "\n\n" + buffer;
}

public function approachCrewPenny(back:Boolean = false):void
{
	clearOutput();
	showPenny();
	if(back)
	{
		var greetings:Array = ["Penny tilts her head. <i>“Oh. What else then?”</i>","<i>“Hmmm, anything else then, mate?”</i> Penny asks.","Penny stretches then yawns. <i>“So now what? Mmm?”</i>"];
		//Penny hascock
		if(penny.hasCock()) 
		{
			greetings.push("Penny smirks, <i>“We could always fuck...”</i>");
		}
		//Penny is bimbo
		if(penny.isBimbo()) greetings.push("Penny guides her dick into her mouth, idly sucking. She raises one eyebrow as if to suggest that you should take advantage of the situation.");
		output(RandomInCollection(greetings));
	}
	// (scene: Crewmate Main Menu)
	if(!penny.hasCock())
	{
		author("B");
		output("You knock on the door to Penny’s quarters.");
		output("\n\n<i>“Yep, just a sec!”</i> Penny hollers from inside. In a moment, you hear the sound of her door’s electric lock undoing, and, with a bit of heft, she swings the door open.");
		output("\n\n<i>“Hey there, my " + (penny.armor is UGCCasualOutfit ? "mate":"captain") + ",”</i> she says warmly. She’s wearing " + (penny.armor is UGCCasualOutfit ? "her civilian clothing: the one with the too-small T-shirt with the cartoon character on it and the cut-off jeans":"her police officer’s uniform: in fact, it looks freshly pressed and steamed, and it fits her as perfectly as the day you met her") + ". She doesn’t even hesitate to grab you by the wrist and show you into her quarters. Once you’re inside, she shuts the door, and you two are alone.");
		output("\n\nYou both take a seat on the edge of her bed; she folds one leg and tucks her foot underneath her knee, reclining into a casual sitting position. <i>“Sooooo,”</i> she says lazily, " + (penny.armor is UGCCasualOutfit ? "putting both her hands behind her back for stability – and thrusting out her generous, DD-cup chest, giving you something to ogle":"folding her hands on her lap and keeping her back straight – ever the professional, at least while she’s wearing that uniform") + ", <i>“what can I do for you today?”</i>");
	}
	//Actual Approach:
	else
	{
		author("Fenoxo");
		output("When you enter her chambers, Penny’s fluffy tail wags behind her, faster and faster the closer you come. When you’re right in front of her, she looks up at you with a lusty look and admits, <i>“I was just thinking of how much I enjoyed using this with you, my mate.”</i>");
		//Max size {17-20}
		if(penny.longestCockLength() >= 17) output(" There’s the sound of fabric starting to rip, cut short by the sound of a zipper and the heavy thud of flesh contacting wood. Penny exhales and looks at you meaningfully. <i>“I’m so glad you made it so big...”</i> Her voice trails off for a moment while she brazenly strokes. <i>“It gets hard so easily. All I have to do is think of you, and I have the biggest, hardest, most incredible erection.”</i>");
		//Normal size {10-16”}
		else if(penny.longestCockLength() >= 10) output(" A quiet, stifled groan starts in her throat after her admission, and she squeezes her crotch up to show you the nice, big bulge hidden in her pants. The groan turns into a whimper, and then you hear the zipper on her trousers lowering. Gasping with relief, the fennec makes love to you with her eyes and offers, <i>“Looking for a booty call?”</i>");
		//Small size
		else output(" There’s the quiet sound of a zipper opening. <i>“I’m up for some fun if you are...”</i>");
	}
	if(flags["BADGER_QUEST"] == 1)
	{
		output("\n\n<b>And to think Doctor Badger wanted you to deal with this wondrous specimen. You could talk with Penny about it and see what her opinion is on the subject, or you could just go ahead and zap her.</b>");
	}
	//[=Talk=][=Sex=][=Leave=]
	// end scene (scene: Crewmate Main Menu)
	pennyCrewMenu();
}

public function pennyCrewMenu():void
{
	clearMenu();
	addButton(0,"Talk",pennyCrewTalk,undefined,"Talk","Talk to Penny.");
	if(pc.lust() >= 33) addButton(1,"Sex",pennyCrewSexApproach,undefined,"Sex","Get naughty with your mate.");
	else addDisabledButton(1,"Sex","Sex","You aren’t turned on enough right now.")
	addButton(14,"Back",crew);
}

//[=Talk=]
// (scene: Crewmate Talk Menu)
public function pennyCrewTalk():void
{
	clearOutput();
	showPenny();
	author("B");
	output("You and Penny aren’t too busy at the moment. You just wanted to spend some time with her.");

	output("\n\n");
	if(penny.armor is UGCCasualOutfit) output("Penny ‘humph’s to herself and sits upright, deliberately hefting her chest as she does so and adjusting her top in front of you. Knowing her libido, she was probably hoping for something a little more ‘entertaining.’" + (penny.isHerm() ? " And, from the way one hand slyly snakes between her legs and paws at the brazen bulge between them, she was hoping for it a lot.":""));
	else
	{
		output("Penny grips the top of her uniform and pulls on it, straightening it out and adjusting her prim-and-proper look in front of you. Though, it has the (unintentional, surely) consequence of deepening the cleavage around her boobs – and highlighting the bumps of her nipples through the fabric. Knowing her libido, she might have been hoping for something a little more ‘entertaining.’");
	}
	output(" <i>“Of course; I’m not busy,”</i> she says. <i>“Got anything on your mind?”</i>");
	processTime(2);
	
	pennyFollowerTalkMenu();
}

public function pennyFollowerTalkMenu():void
{
	// end scene (scene: Crewmate Talk Menu)
	// Pretty much all of her in-game talk scenes are contextually dependent on her remaining on Mhen’ga, and they’ll need to be rewritten. I can probably write a few of them myself, but I’d need an increased word cap.
	// [=Her ‘Species’=] requires the least amount of rewriting and probably just needs some editing.
	//[=Her ‘Species’=][=Outfit=][=Other Crew=][=Futanari=][=Buy Throbb?=][=Leave=]
	clearMenu();
	addButton(0,"Species",((flags["PENNY_IS_A_CUMSLUT"] != undefined || flags["PENNY_BIMBO"] != undefined) ? askGFPennyAboutSpecies : talkToPennyAboutSpecies));
	addButton(1,"Outfit",pennyOutfitTalk,undefined,"Outfit","Ask Penny to wear a different set of clothes.");
	if(crew(true) > 1) addButton(2,"Other Crew",otherCrewPennyTalk,undefined,"Other Crew","Ask Penny what she thinks of the fact that you have other crewmates.");
	else addDisabledButton(2,"Other Crew","Other Crew",(silly ? "And here is where you would talk about your other crewmates... IF YOU HAD ANY!!!!":"You don’t have any other crew mates to talk about, so this is a bit of a moot point."));
	addButton(3,"Futanari",futanariTalkWithPenpen,undefined,"Futanari","Talk to her about dickgirls, and becoming one.");
	if(flags["PENNY_THROBB_PURCHASE_UNLOCKED"] == 1) addButton(4,"Buy Throbb",buyCrewPennyThrobb,undefined,"Buy Throbb","Purchase some illegal, dick-growing drug.");
	else addDisabledButton(4,"Disabled","Disabled","You don’t know her well enough for this.");
	addButton(14,"Back",approachCrewPenny,true);
}

//[=Buy Throbb=]
// (scene: Buy Throbb)
public function buyCrewPennyThrobb():void
{
	clearOutput();
	showPenny();
	author("B");
	output("You ask Penny if she still has a hoard of Throbb to pass around with you. You wouldn’t mind passing her a couple hundred credits if she’s willing to share.");
	output("\n\n<i>“Yeah, I have a handful I can pass along,”</i> she says. <i>“I had a huge crate of the stuff back on my station. I couldn’t exactly smuggle the whole thing onboard with me - not discreetly, anyway - but it wouldn’t be too hard to coordinate a shipment from Flahne whenever we land on a new planet to restock.”</i>");
	output("\n\nYou ask her how much she has on her right now. <i>“Trust me, [pc.name], I have as much as you need.”</i> She smiles sincerely, yet, toothily; she apparently enjoyed the implications of her own answer. <i>“Same rate as before, my " + (penny.armor is UGCCasualOutfit ? "mate":"captain") + ".”</i>");
	//throbb menu
	this.clearMenu();
	if(pc.credits >= 300) this.addButton(0,"Buy It",buyThrobbTransact);
	else this.addDisabledButton(0,"Buy It");
	if(pc.credits >= 600) this.addButton(1,"Buy 2",buyThrobbTransact,2);
	else this.addDisabledButton(1,"Buy 2");
	if(pc.credits >= 900) this.addButton(2,"Buy 3",buyThrobbTransact,3);
	else this.addDisabledButton(2,"Buy 3");
	if(pc.credits >= 1200) this.addButton(3,"Buy 4",buyThrobbTransact,4);
	else this.addDisabledButton(3,"Buy 4");
	if(pc.credits >= 1500) this.addButton(4,"Buy 5",buyThrobbTransact,5);
	else this.addDisabledButton(4,"Buy 5");
	if(pc.credits >= 1800) this.addButton(5,"Buy 6",buyThrobbTransact,6);
	else this.addDisabledButton(5,"Buy 6");
	if(pc.credits >= 2100) this.addButton(6,"Buy 7",buyThrobbTransact,7);
	else this.addDisabledButton(6,"Buy 7");
	if(pc.credits >= 2400) this.addButton(7,"Buy 8",buyThrobbTransact,8);
	else this.addDisabledButton(7,"Buy 8");
	if(pc.credits >= 2700) this.addButton(8,"Buy 9",buyThrobbTransact,9);
	else this.addDisabledButton(8,"Buy 9");
	if(pc.credits >= 3000) this.addButton(9,"Buy 10",buyThrobbTransact,10);
	else this.addDisabledButton(9,"Buy 10");

	if(pennyIsCrew()) addButton(14,"Back",approachCrewPenny,true);
	else this.addButton(14,"Back",pennyCrewTalk);
}

//[=Futanari=]
// This is a rewriting of the PC approaching Penny about the possibility of her becoming a futa, contextualized for her being a crewmate. I’m not going to rewrite all the conversations about making her dick longer because that’ll bloat my wordcount, and they only need some reviewing, not a whole rewrite.
// (scene: Futa First Talk)
public function futanariTalkWithPenpen():void
{
	clearOutput();
	showPenny();
	author("Fenoxo");
	if(flags["PENNY_FUTA_TALK"] == undefined && !penny.hasCock())
	{
		flags["PENNY_FUTA_TALK"] = 1;
		author("Fen&B");
		output("<i>“Grow a dick?”</i> Penny states with a dumbfounded look. Ears flattening back on her head, she admits, <i>“I did mention that, didn’t I? I’m surprised you even remember that.”</i>");
		output("\n\nYou nod expectantly.");
		output("\n\nThe fox-girl snorts and swivels herself to more directly face you. She searches your eyes for something for a long moment before talking. <i>“Yeah, I guess... I was thinking about it....”</i> Penny’s ears gradually rise again. <i>“The girl I told you about at the academy... she had one, and all things considered, she was pretty happy with it. Once we got comfortable, she kept finding excuses to show it to me. She even let me watch her masturbate!”</i>");
		output("\n\nCoughing nervously, the vixen adds, <i>“I thought a vagina was plenty enough to please, but watching her hands dance over two sets of genitals.... I think I might want one too, [pc.name]. It was dirty and decadent and wet in all the right ways. You should see the way she squirted - from both holes!”</i> Penny’s breathing has gotten heavier from recounting this sordid tale. <i>“Could you imagine, mate? Could you see me with a big, throbbing dick" + (pc.hasCock() ? " just cumming all over you while you fuck me":"") + (pc.isHerm() ? " or":"") + (pc.hasVagina() ? " stretching out your twat":"") + "? Fuck, that’s hot!”</i>");
		output("\n\nShe seems excited by the prospect. You tell her that there are plenty of ways in the modern year to change someone’s body. If she wants a cock to play with, it shouldn’t be too hard to find a way, if she wants.");

		output("\n\n<i>“Actually,”</i> she says, laughing sheepishly. <i>“That girl – Kit is her name, by the way – Kit, she had a tailor-made cock that was exactly as long, and as girthy, and as productive–”</i> She trails for a moment, and, completely absent-mindedly, she wipes at her mouth with her wrist. <i>“As she wanted. I used up most of my share of the Oxonium getting myself out of debt, so I can’t afford a custom cock like hers, and I’m not about to ask you to float me for one. So, instead....”</i>");
		output("\n\nShe kicks at her suitcase, lying on the floor between you two. <i>“I, uh, kinda smuggled a few shots of Throbb onboard with me. You must know what Throbb does to a person by now, right? I....”</i> " + (penny.armor is UGCCasualOutfit ? "She puts her two index fingers together, bloats her cheeks, and shies away, unable to look you in the eye.":"Her lips curl inward and her head leans to one side, her body following with it, as she struggles with what she wants to say next.") + " <i>“I was... " + (penny.armor is UGCCasualOutfit ? "sorta wondering":"hoping") + " if you wouldn’t mind if I, uh, used them on myself.”</i>");
		output("\n\nYou ask her how much she packed. <i>“Right now? Only three shots, but I can get more,”</i> she answers. <i>“One for us both, and one for a mutual friend... or an extra one for one of us, if one of gets</i> particularly <i>dominant... or submissive....”</i> Her eyes lock onto yours, and the tip of her pink tongue slips from the corner of her mouth, giving her lips a thin, wet lick. <i>“Or... one of us could take</i> all three<i>... and then–”</i>");
		output("\n\nYou interrupt her, saying she’s clearly put some time into these fantasies of hers. <i>“Uh,”</i> she says, leaning back and sitting on her behind, her fluffy tail swishing excitedly behind her, <i>“yeah, you could say that. But, I didn’t want to jump to conclusions, so I haven’t used them yet.”</i>");
		output("\n\nHer big, green eyes meet yours, and she leans toward you once more; her tail curls up and around herself, coiling around her waist behind her. <i>“What do you think, " + (penny.armor is UGCCasualOutfit ? "my mate":"captain") + "? Being a herm would really open up a lot of sexual options between us, but... do you think I could handle it? Or do you think I shouldn’t? My mods have already made my sex drive pretty high, and Throbb might spiral that out of control pretty quick. But... I don’t know. Just one shot wouldn’t hurt, would it?”</i>");
		processTime(30);
		clearMenu();
		//[=Get A Dick=][=Stay Girl=][=SynthSheathe=]
		// end scene (scene: Futa First Talk)
		// All three of these optional scenes would need reviewing for contextual differences. That’s not my bit, though, so I ain’t doin’ it.
		this.clearMenu();
		this.addButton(0,"Stay Girl",stayAGirlYouBitch);
		this.addButton(1,"Get A Dick",pennySproutsAWeiner);
		if(pc.hasItemByClass(HorseCock)) 
		{
			if(CodexManager.entryUnlocked("SynthSheath")) addButton(2,"SynthSheath",givePennyAHossCawk,undefined,"SynthSheath","Give Penny the Xenogen SynthSheath you found on Tarkus. She’d probably love having a horse-cock.\n\nWho needs Throbb when you can be a stallion?");
			else addButton(2,"Try This",givePennyAHossCawk,undefined,"Try This","Give Penny the horse-cock strap-on you found on Tarkus. You have a hunch it might be more than it seems. You shouldn’t give this to her unless you’re ready for things to get a little out of hand.\n\nIt might also prevent her from getting too into Throbb.");
		}
		else addDisabledButton(2,"Locked","Locked","You don’t have the required item for this option.");
	}
	//Repeat Futanari Talk
	else
	{
		if(penny.hasCock(GLOBAL.TYPE_EQUINE))
		{
			output("<i>“Oh, you mean this show pony you tricked me into getting?”</i> Penny asks with a knowing grin. <i>“I thought Throbb would have me all drippy and horny at all times of the day, but this thing is almost as bad!”</i> She shifts uncomfortably. <i>“I can barely hide the thing, and just thinking about it gets it hard enough to whack into the bottom of my desk.”</i>");
			if(flags["PENNY_THROBB_USES"] >= 3 && flags["PENNY_THROBB_USES"] != undefined)
			{
				output("\n\nThe over-sized futanari fennec shifts to bring the flared head up to her lips. She swiftly slathers it in a fresh layer of spit. <i>“Part of me wants more... but...”</i> She moans, swallowing at least six inches of pulsing meat. When she pulls it back out again her cock is slick and dripping white. <i>“This is just so awesome already.”</i> A pearl-white smile spreads across her face.")
			}
			output("\n\nShe’s no longer interested in taking Throbb.");
			if(flags["PENNY_THROBB_USES"] == undefined || flags["PENNY_THROBB_USES"] == 0) 
			{
				output("\n\n<i>“You know, I’ve actually still got plenty of Throbb left over. If you ever want some, just ask.”</i> Penny glances at your groin and ");
				if(pc.biggestCockLength() >= 15) output("smiles wickedly, licking her lips. <i>“God, imagine you with an even more enormous cock. You’d break my jaw!”</i>");
				else output("smirks knowingly. <i>“Imagine how much harder you could make me drool if we gave you a little boost. Just enough to make your dickgirl mate </i>really<i> whimper.”</i>");
				flags["PENNY_THROBB_PURCHASE_UNLOCKED"] = 1;
			}
			/* CUMSLUT STUFF. NOT ENABLED ATM
			clearMenu();
			if(flags["PENNY_THROBB_USES"] >= 3 && flags["PENNY_THROBB_USES"] != undefined)
			{
				output("\n\nThat said, she’s more than a little pliable with her dick that close to her face, so if you wanted to turn her into an obedient, sex-addicted pet you could probably quite easily work her up into embracing throbb-enhanced horse-dick a little more enthusiastically. Chances are it would still impact on her ability to work, but not as irreversibly pumping her full of more drugs. Teasing her into being more of a orgasm-addicted love pet still wouldn’t exactly be <i>nice</i>, but at least she’d be able to control herself and do work when she absolutely had to.");
				output("\n\nSo, what do you want to do?");
				//[Tell her to calm down] [Have fun with her]
				clearMenu();
				addButton(0,"Calm Down",calmDownYouPennySlut);
				addButton(1,"Tease Her",teasePenny)
			}
			else this.addButton(14,"Back",approachGirlfriendPenny);*/
			this.addButton(14,"Back",approachCrewPenny,true);
		}
		//Not yet futa
		else if (!penny.hasCock())
		{
			output("<i>“Oh, you want to talk about me growing a dick again?”</i> Penny asks. <i>“You know, if I dose myself with Throbb I’m going to wind up horny and dripping more often than normal. My self control will probably slip a little too. However, I’ll be able to fuck you like a freight train, and oh god I bet the orgasms will feel great.”</i>");
			output("\n\nFrom the sounds of it, Penny’s panties are already more than a little moist at the idea. Do you tell her to take some Throbb?");
			//[Stay Girl] [Get A Dick]
			this.clearMenu();
			this.addButton(0,"Stay Girl",stayAGirlYouBitch);
			this.addButton(1,"Get A Dick",pennySproutsAWeiner);
			if(pc.hasItemByClass(HorseCock)) 
			{
				if(CodexManager.entryUnlocked("SynthSheath")) addButton(2,"SynthSheath",givePennyAHossCawk,undefined,"SynthSheath","Give Penny the Xenogen SynthSheath you found on Tarkus. She’d probably love having a horse-cock.\n\nWho needs Throbb when you can be a stallion?");
				else addButton(2,"Try This",givePennyAHossCawk,undefined,"Try This","Give Penny the horse-cock strap-on you found on Tarkus. You have a hunch it might be more than it seems. You shouldn’t give this to her unless you’re ready for things to get a little out of hand.\n\nIt might also prevent her from getting too into Throbb.");
			}
			else addDisabledButton(2,"Locked","Locked","You don’t have the required item for this option.");
		}
		//Already futa
		else
		{
			if(penny.longestCockLength() < 10)
			{
				output("<i>“So you like my dick as much as me, right?”</i> a hopeful Penny asks. <i>“You don’t mind if I take another dose of Throbb, do you? I just want to get a little bit bigger - you know, like a foot long. That way I’d have a cock big enough to get into porn if the whole rush thing falls through.”</i> Her tentpole swells a little at that admission.");
				output("\n\nShe’s as horny as an animal in heat, but she hasn’t had any trouble keeping herself under control thus far. Do you suggest she take it again?");
				this.clearMenu();
				this.addButton(0,"Give Throbb",pennyToBigPenny);
				this.addButton(14,"Back",approachGirlfriendPenny);
				if(pc.hasItemByClass(HorseCock)) 
				{
					if(CodexManager.entryUnlocked("SynthSheath")) addButton(1,"SynthSheath",givePennyAHossCawk,undefined,"SynthSheath","Give Penny the Xenogen SynthSheath you found on Tarkus. She’d probably love having a horse-cock.\n\nWho needs Throbb when you can be a stallion?");
					else addButton(1,"Try This",givePennyAHossCawk,undefined,"Try This","Give Penny the horse-cock strap-on you found on Tarkus. You have a hunch it might be more than it seems. You shouldn’t give this to her unless you’re ready for things to get a little out of hand.\n\nIt might also prevent her from getting too into Throbb.");
				}
				else addDisabledButton(1,"Locked","Locked","You don’t have the required item for this option.");
			}
			//Footlong Penny
			else if(penny.longestCockLength() < 17)
			{
				output("<i>“Ohgod, you want me to get bigger, don’t you?”</i> Penny asks with a full-body shudder. She wraps one hand around her [penny.cock] and begins to languidly stroke it, barely caring that the door is unlocked. Her male endowment is big enough that her fingers can barely wrap around it. <i>“Nnnngh, it’ll feel so good! I... uh... don’t know how I’ll fit in my pants. Fuck, my sheath will probably bulge through even when I’m not horny.”</i> The lust-drunk vixen giggles as she bends double to slurp a drop of pre-cum off her [penny.cockHead]. <i>“Yeaaaah, let’s give me a real monster!”</i>");
				output("\n\nTo say that Penny is enthused by the prospect of a bigger member and a heightened libido would be an understatement. She’s jubilant at the prospect and nearly beyond reason with lust from at the prospect of taking more. With her self-control obviously slipping, do you give her the okay to take another dose?");
				this.clearMenu();
				this.addButton(0,"Give Throbb",pennyBecomesHYPERPENNY);
				if(pc.hasItemByClass(HorseCock)) 
				{
					if(CodexManager.entryUnlocked("SynthSheath")) addButton(1,"SynthSheath",givePennyAHossCawk,undefined,"SynthSheath","Give Penny the Xenogen SynthSheath you found on Tarkus. She’d probably love having a horse-cock.\n\nWho needs Throbb when you can be a stallion?");
					else addButton(1,"Try This",givePennyAHossCawk,undefined,"Try This","Give Penny the horse-cock strap-on you found on Tarkus. You have a hunch it might be more than it seems. You shouldn’t give this to her unless you’re ready for things to get a little out of hand.\n\nIt might also prevent her from getting too into Throbb.");
				}
				else addDisabledButton(1,"Locked","Locked","You don’t have the required item for this option.");
				this.addButton(14,"Back",approachGirlfriendPenny);
			}
			//Hyper Pre-cumslut Penny
			else if (flags["PENNY_IS_A_CUMSLUT"] == undefined) {
				author("Abe E. Seedy");
				output("<i>“MMmoooore?”</i> Penny moans as she starts to masturbate in front of you. Her hand can’t even close around her girth at this point, and the tip is so tall that it smacks her in the chin whenever she gets careless. She grabs hold of it with both hands, one sliding over the half facing you while the other ");
				if(penny.balls > 0) output("cradles her balls");
				else output("dips into her sheath to play with it");
				output(". Her womanly folds are almost entirely forgotten as she babbles, <i>“I think I want more, [pc.name].... I mean, I remember not wanting to turn myself into a hyper-dicked freak, but now... I kind of want to see how big it can get. Each time it feels better!”</i> She slurps at her tip as you consider the situation. <i>“Umph! So good! Come on, give me a monster cock! I promise I won’t split you in half with it!”</i>");

				output("\n\nThinking about it for a moment, you realize that Penny probably wouldn’t be able to handle any more of the drug. Her lust seems to be stoked to a high degree already, and giving her more Throbb would certainly lead to her losing her post.");

				/* CUMSLUT STUFF NOT ENABLED ATM:
				output(" That said, she’s very pliable at the moment, so if you wanted to turn her into an obedient, sex-addicted pet you could probably quite easily work her up into embracing her new assets a little more enthusiastically. Chances are it would still impact on her ability to work, but not as irreversibly as pumping her full of drugs. Teasing her into being more of a orgasm-addicted love pet still wouldn’t exactly be <i>nice</i>, but at least she’d be able to control herself and do work when she absolutely had to.");
				output("\n\nSo, what do you want to do?");
				//[Tell her to calm down] [Have fun with her]
				clearMenu();
				addButton(0,"Calm Down",calmDownYouPennySlut);
				addButton(1,"Tease Her",teasePenny)
				if(pc.hasItemByClass(HorseCock)) 
				{
					if(CodexManager.entryUnlocked("SynthSheath")) addButton(2,"SynthSheath",givePennyAHossCawk,undefined,"SynthSheath","Give Penny the Xenogen SynthSheath you found on Tarkus. She’d probably love having a horse-cock.");
					else addButton(2,"Try This",givePennyAHossCawk,undefined,"Try This","Give Penny the horse-cock strap-on you found on Tarkus. Maybe the randy hermaphrodite could use it as a sex toy.");
				}
				else addDisabledButton(2,"Locked","Locked","You don’t have the required item for this option.");
				addButton(14,"Back",approachGirlfriendPenny);
				*/
				if(pc.hasItemByClass(HorseCock)) 
				{
					if(CodexManager.entryUnlocked("SynthSheath")) addButton(0,"SynthSheath",givePennyAHossCawk,undefined,"SynthSheath","Give Penny the Xenogen SynthSheath you found on Tarkus. She’d probably love having a horse-cock.");
					else addButton(0,"Try This",givePennyAHossCawk,undefined,"Try This","Give Penny the horse-cock strap-on you found on Tarkus. Maybe the randy hermaphrodite could use it as a sex toy.");
				}
				else addDisabledButton(0,"Locked","Locked","You don’t have the required item for this option.");
				addButton(14,"Back",approachCrewPenny,true);
			}
			else 
			{
				output("<i>“Mmmoooore?”</i> Penny moans as she starts to masturbate in front of you. Her hand can’t even close around her girth at this point, and the tip is so tall that it smacks her in the chin whenever she gets careless. She grabs hold of it with both hands, one sliding over the half facing you while the other ");
				if(penny.balls > 0) output("cradles her balls");
				else output("dips into her sheath to play with it");
				output(". Her womanly folds are almost entirely forgotten as she babbles, <i>“I think I want more, [pc.name].... I mean, I remember not wanting to turn myself into a hyper-dicked freak, but now... I kind of want to see how big it can get. Each time it feels better!”</i> She slurps at her tip as you consider the situation. <i>“Umph! So good! Come on, give me a monster cock! I promise I won’t split you in half with it!”</i>");
				output("\n\nPenny will surely lose it if you give her the go ahead to take any more. Her already lustful nature seems to be stoked to a high degree already, and giving her more Throbb would certainly lead to her losing her post. No, she can’t have any more now, and you tell her as much.");
				output("\n\nAmazingly, she actually wilts a little at that. Her masturbation stops as the fennec dreamily says, <i>“Okay, okay, I guess. I’m getting a little out of hand, aren’t I?”</i> You nod. <i>“Good, cause it seems to be keeping you around. I’m going to fuck you so hard as soon as I get caught up on work!”</i> She turns back towards what she was doing while trying to pack her monster dick into her pants. It doesn’t work all that well.");
				this.clearMenu();
				if(pc.hasItemByClass(HorseCock)) 
				{
					if(CodexManager.entryUnlocked("SynthSheath")) addButton(0,"SynthSheath",givePennyAHossCawk,undefined,"SynthSheath","Give Penny the Xenogen SynthSheath you found on Tarkus. She’d probably love having a horse-cock.");
					else addButton(0,"Try This",givePennyAHossCawk,undefined,"Try This","Give Penny the horse-cock strap-on you found on Tarkus. You have a hunch it might be more than it seems. You shouldn’t give this to her unless you’re ready for things to get a little out of hand.");
				}
				else addDisabledButton(0,"Locked","Locked","You don’t have the required item for this option.");
				this.addButton(14,"Back",approachGirlfriendPenny);
			}
		}
	}
}

//[=Outfit=]
// Tooltip: Ask Penny to wear a different set of clothes.
// (scene: Outfit Intro)
public function pennyOutfitTalk():void
{
	clearOutput();
	showPenny();
	author("B");
	output("You look over what Penny is wearing.");
	if(penny.armor is UGCCasualOutfit)
	{
		output("She’s wearing a too-small white T-shirt, with sleeves that reach halfway to her elbows; a hem that reaches just beneath her ribs, exposing her midriff; and clings to her DD-cup breasts, leaving nothing to your imagination. Emblazoned on its front is a cutesy cartoon character – what looks like a pink cat-like creature with <i>huge</i> blue eyes, striking a playful pose, standing on top of some words written in a language you don’t immediately understand. For pants, she’s wearing a pair of cut-off jeans that hug tightly to her thighs; they also only reach halfway to her knees, exposing quite a lot of furry leg to the air of the ship");
		if(penny.isHerm())
		{
			output(" – and, ");
			if(penny.cocks[0].cLength() < 7) output("it does a poor job of hiding her inert package");
			else if(penny.cocks[0].cLength() < 13) output("they strain and creak every time she shifts her weight, trying to maintain her massive package");
			else output("they provide zero cover for her obelisk of a cock and her massive testicles; if she were to get just stiff, they’d start tearing away thread-by-thread");
		}
		output(".\n\nYou’re aware that she packed her officer’s uniform.");
	}
	else
	{
		output("She’s wearing the same U.G.C. officer’s uniform she was wearing when you two first met. The thick, dark material clings to her body very tightly, without restricting her movement and without giving off too much noise whenever she moves. They cover her prim-and-properly, from her neck, to her wrists, to her waist, and to her ankles, exposing nothing in between to the air of the station. Although it’s a very professional uniform, it still does little to disguise her hefty, DD-cup breasts");
		if (penny.hasCock())
		{
			if(penny.cocks[0].cLength() < 7) output(", nor do her pants perfectly conceal the telltale bulge of her currently-inert cock between her legs");
			else if(penny.cocks[0].cLength() < 13) output(", and her pants do little to hide the impressive cock currently sitting flaccid in her sheath, or her big, full, heavy nuts pressing into her thighs");
			else output(", and her uniform is no match for her impressively, embarrassingly large cock and her churning, heavy balls, even as they are, sitting completely flaccid and soft. If she were erect, you doubt even her sturdy uniform would be able to withstand the sheer kinetic force her dick would be outputting");
		}
		output(".\n\nYou’re aware that she packed some civilian clothing} when she joined your crew. You’re sure, if you asked her to change, she’d acquiesce.");
	}
	clearMenu();
	addButton(0,"Ask2Change",ask2ChangePenny);
	addButton(14,"Back",pennyCrewTalk);
}

//[=Ask2Change=]
// (scene: Get Naked, Then Clothed)
public function ask2ChangePenny():void
{
	//UGCCasualOutfit
	//UGCUniform
	clearOutput();
	showPenny();
	author("B");
	output("You ask Penny if she wouldn’t mind changing her clothes. " + (penny.armor is UGCCasualOutfit ? "Her officer’s uniform really gives her a sense of professionalism, something that you feel like your ship is missing sometimes":"As much as you like a girl in a uniform, let’s be real: you run a very loose ship, here, and as long as everyone does their part, you don’t mind everyone wearing their casual clothes") + ".");
	output("\n\n<i>“Hmm,”</i> she hums, placing her left index finger against her bottom lip. <i>“Right nnnnnnnnnow, you mean?”</i>");
	output("\n\n" + (pc.isNice() ? "You tell her that you can leave, if it’ll make her more comfortable... but, you could also stay right where you are.":"Hell yeah, right now. You two can call it a direct order, if it’ll make things more spicy."));
	output("\n\nPenny stands, swishing her hips and her long, fluffy tail as she does; her hands run sensually down her sides as she brings her knees together. <i>“Oh, alright,”</i> she says drearily, as if it were a chore. Her back is toward you as her hands hook around her pants. <i>“But I’m only doing this because you’re my " + (penny.armor is UGCCasualOutfit ? "mate":"captain") + ".”</i>");


	// Civvy clothes, into uniform
	if(penny.armor is UGCCasualOutfit)
	{
		output("\n\nYou hear the click of her button coming undone, and then the zip of a zipper being slowly, teasingly drawn down; then, she reaches behind her, and undoes the denim clasp above her tail, keeping her shorts to her hips. Her formerly tight, clingy, torn jeans come loose, but they don’t fall; she has to give them a slow, methodical yank, down one leg, and then the other, shimmying a slow, snake-like shimmy, letting them naturally drop down her soft, fuzzy, shapely legs.");
		output("\n\nShe’s wearing a red thong that clings to her form, standing apart from her crisp-colored fur. Feeling your eyes on her, she peers over her shoulder and whistles at you, pulling your gaze away from her body. When you look her in the eye, she smirks, and her thumb pulls, then snaps, at her thong – your focus is conflicted, and she smirks wider.");
		output("\n\nWith her shorts laying in a puddle at her feet, she playfully kicks her foot forward, hooking them onto her toe and flinging them in your direction, flopping her shorts against your [pc.chest]. She pivots, facing you, her thumbs still playing at the edges of her thong");
		if(penny.hasCock())
		{
			output(", giving you a full-on view of her package, ");
			if(penny.cocks[0].cLength() < 7) output("barely concealed in the material");
			else if(penny.cocks[0].cLength() < 13) output("the tip of her fuzzy sheath and the edges of her big nuts spilling from the edges around her underwear");
			else output("the material straining to the breaking point, hiding absolutely none of her gargantuan balls and bulging sheathe");
		}
		output(" – but, rather than pull her thong down, she shifts her hands to the hem of her shirt.");
		output("\n\nPenny crosses her arms, gripping the cotton of her shirt, and easily, seamlessly lifts it over her head. Her mohawk hair spills to one side as she lifts her arms; she flicks her head to the other, righting it, and glares her green eyes into yours. She throws her T-shirt towards you, adding it to her shorts, her tongue in her cheek. She’s wearing a cushy, stable sports-bra, in matching red, to support her girls. She’s down to her underwear, standing before you, giving you your show.");
		output("\n\nPlayfully, she puts her foot onto the suitcase, then kicks it behind her. <i>“It’s a combination lock,”</i> she tells you as she pivots, her eyes looking over her shoulder as she does. <i>“Wouldn’t want you to see my password. A girl’s gotta keep a secret.”</i>");
		output("\n\nOf course, it’s just a flimsy excuse for her to slowly, ever so slowly, bend at the hips to reach her suitcase. Her legs are together and straight as could be, and she lifts her tail, draping it over her back –");

		processTime(10);
		pc.lust(5);
		//change clothes here:
		if(penny.armor is UGCCasualOutfit) penny.armor = new UGCUniform();
		else penny.armor = new UGCCasualOutfit();
		// continue here if the PC has 33 Lust or more:
		/* FEN NOTE: Nah. Keep going
		if(pc.lust() >= 33)
		{
			clearMenu();
			addButton(0,"Continue",continueChangingPenny,true,"Continue","Enjoy the show and let her finish.");
			addButton(1,"Interrupt",interruptPennyChanging,undefined,"Interrupt","You’ve seen enough. You need to fuck her.");
			
		}
		else 
		*/
		continueChangingPenny();
	}
	// uniform, moving into civvy clothes
	else
	{
		output("\n\nYou hear the clicks and clacks of her belt being undone, and when the clasp lets loose, her pants sag very slightly, no longer clinging to her form so tightly that you could bounce a coin off her glutes. Followed by that is the sound of two buttons being undone, and then the excruciatingly slow zip of a zipper being drawn down – all the while, Penny is shuffling back and forth on the spot before you, getting her legs together and her butt flexed.");
		output("\n\nOnce her pants are loose, she bends forward at the waist – still keeping her legs locked and straight – and, with her thumbs hooking into her waistband, shimmies her pants down her body: first her right side, then her left, then her right again. Each time she rocks her hips and moves to one side, her pants draw just a little lower down the crescent of her ass, showing you more, fluffy, furry, toned booty.");
		output("\n\nShe’s wearing a red thong, contrasting against the crisp colors of her fur; when the band of her pants gets beneath the moon of her ass, she pauses and glances over her shoulder, one eye catching your stare and hooking it like a fish to a line. She smirks that predatory, toothy smirk of hers, and whistles at you for your attention – when she has it, her thumb hooks into the thin material of her underwear and snaps it against her body. You can’t decide where to look, and it gives her a perverse thrill, knowing she has you so enthralled.");
		output("\n\n<i>“You know,”</i> Penny starts. She bends further forward, still keeping her legs locked and straight, as she pulls her pants those last few inches until they clear the circumference of her ass. Without her natural curvature to support them, they fall to the floor in a loud ‘flump,’ collapsing into a fabric puddle around her ankles, and leaving her lower half totally exposed. <i>“Normally, it’s the</i> officer <i>performing the strip-search on the perp, not the other way around.”</i> She hooks a toe into the waistband of her pants, and, without pivoting and with a dexterous fling of her foot, she catapults her discarded pants onto the bed. <i>“It takes a very</i> special <i>kind of perp to get a cop naked....”</i>");
		output("\n\nNow naked from the waist down, save for a very thin layer of red cotton");
		if(!penny.hasCock())
		{
			output(" protecting her feminine bits from your lecherous eyes (but not the bit of excited dribble staining them burgundy)");
		}
		else if(penny.cocks[0].cLength() < 7) output(" outlining every facet of her bloated-but-inert sheathe" + (penny.balls > 0 ? " and bulging fox balls":""));
		else if(penny.cocks[0].cLength() < 14) output(" straining to contain her impressive manhood, its strands stretched to contain her massive sheathe and backed-up fox balls");
		else output(", which does absolutely nothing to hide her gargantuan sheathe and her massive, bloated nuts, every part of her spilling from the top and the sides (and she isn’t even erect!)");
		output(", she hooks her thumbs beneath the top half of her uniform, beneath the heavier, thicker armor plating that protects her torso. It takes her some effort to pull the unyielding armor up and over her bust, and she struggles – which ruins the show just a little – but, once it’s off, she’s left totally nude, save for a strip of cloth that you could rip apart with your teeth covering her waist, and a red sports bra keeping her girls in position. With a flick of her wrist, the top of her uniform joins her pants on the bed.");
		output("\n\nShe clenches her knees together and presses her arms against her breasts, and she coos to herself, enjoying the tactile sensation of her body against itself while a pair of eyes are watching her.");
		output("\n\nPlayfully, she puts her foot onto the suitcase, then kicks it behind her. <i>“It’s a combination lock,”</i> she tells you as she pivots, her eyes looking over her shoulder as she does. <i>“Wouldn’t want you to see my password. A girl’s gotta keep a secret.”</i>");
		output("\n\nOf course, it’s just a flimsy excuse for her to slowly, ever so slowly, bend at the hips to reach her suitcase. Her legs are together and straight as could be, and she lifts her tail, draping it over her back – ");
		processTime(10);
		pc.lust(5);
		//change clothes here:
		if(penny.armor is UGCCasualOutfit) penny.armor = new UGCUniform();
		else penny.armor = new UGCCasualOutfit();
		// continue here if the PC has 33 Lust or more:
		/* FEN NOTE: Nah. Keep going
		if(pc.lust() >= 33)
		{
			clearMenu();
			addButton(0,"Continue",continuePennyChangingNotOfficer,true,"Continue","Enjoy the show and let her finish.");
			addButton(1,"Interrupt",interruptPennyChanging,undefined,"Interrupt","You’ve seen enough. You need to fuck her.");
			//[=Continue=][=Interrupt=]
		}
		else */
		continuePennyChangingNotOfficer();
	}
}

//[=Interrupt=]
// Tooltip: You’ve seen enough. You need to fuck her.
// Play the <i>“OverDeskFuck”</i> scene or some PC-is-female scene; will require some contextual edits
public function interruptPennyChanging():void
{
	//9999
}

//[=Continue=]
// Tooltip: Enjoy the show and let her finish
// Don’t display any buttons and don’t interrupt the scene if the PC has 32 Lust or less
public function continuePennyChangingNotOfficer(newScreen:Boolean = false):void
{
	if(newScreen)
	{
		clearOutput();
		showPenny(true);
		author("B");
		output("Y");
	}
	else output("y");
	output("ou have a total, uninterrupted view of her thong-clad, and slightly damp, vixen vagina");
	if(penny.hasCock() && penny.balls > 0) output(", and her thick, full, bouncing balls");
	output("; the only thing sitting between you and one of the greatest shows in space is a flimsy bit of red fabric. You");
	if(pc.lust() >= 33) output(", with some restraint,");
	output(" do nothing but sit and watch.");

	output("\n\n<i>“Here we are,”</i> she muses as she pulls out her civilian clothing, starting with her shorts. Continuing the show, she takes her time putting her two feet into the denim shorts, and when she starts hiking them up, she makes it as much of a struggle as she did getting off her uniform: when the shorts hit the curve of her ass, she has to shake, shimmy, and bounce them up over the swell of her rump.");
	output("\n\nUnlike her uniform, though, her shorts are much tighter, clinging to her body like a second skin and threatening to burst if she were to split her legs just a little too far" + (penny.hasCock() ? " – or if she even got the hint of an erection":"") + ". She teases her zipper lifting into place, but she struggles a little bit getting the front button of her pants into place, and the rear denim clasp up and over her tail.");
	output("\n\nWith just one last piece left, she bends forward (at the waist, of course), to reach into her suitcase and pull out her top: a plain white T-shirt, with a cutesy cartoon character plastered on the front: a pink cat-like creature, striking a playful pose, and standing on top of a phrase written in a language you don’t immediately understand.");
	output("\n\nEven from where you’re sitting, you know that the shirt is too small for her, but she slips it on anyway: the hem is stretched taut to conceal her hefty, DD-cup breasts, and it reaches only to her lower ribs. The sleeves aren’t much better, only going down halfway to her elbows, leaving the rest of her arms bare.");
	output("\n\nFinally, with all that done, she’s back in her civilian clothes, looking just like she did the day she joined your crew. She finishes the ensemble by righting her shirt – which promptly crumples and un-rights itself, mismatched as it is against her body.");
	output("\n\nShe resumes her earlier sitting position next to you. With two fistfuls, she grabs onto both pieces of her now-discarded uniform and flops them onto her open suitcase.");
	output("\n\n<i>“Was there... anything</i> else <i>I can do for you, my mate?”</i> Penny asks you, her tongue licking at her lips.");
	output("\n\nIt’s good to be captain, sometimes.");
	clearMenu();
	processTime(25);
	pc.lust(40);
	pennyCrewMenu();
}

//[=Continue=]
// Tooltip: Enjoy the show and let her finish
// Don’t display any buttons and don’t interrupt the scene if the PC has 32 Lust or less
public function continueChangingPenny(newScreen:Boolean = false):void
{
	if(newScreen)
	{
		clearOutput();
		showPenny(true);
		author("B");
		output("Y");
	}
	else output("y");
	output(" have a total, uninterrupted view of her thong-clad, and slightly damp, vixen vagina");
	if(penny.hasCock() && penny.balls > 0) 
	{
		output(", and her thick, full, bouncing balls}; the only thing sitting between you and one of the greatest shows in space is a flimsy bit of red fabric. You" + (pc.lust() >= 33 ? ", with some restraint,":"") + " do nothing but sit and watch.");
	}
	output("\n\n<i>“Here we are,”</i> she muses as she pulls out her officer’s uniform, starting with her pants. Continuing the show, she takes her time stepping into the leggings; once she has her ankles in the pants, she glances over towards you once again, and then starts shimming her pants up her legs. They’re considerably looser and more form-fitting than her shorts, but she makes a big show of effort getting them up regardless, for your benefit.");
	output("\n\nOnce the waistband of the lower half of her uniform is around her hips, ‘form-fitting’ is right: they were tailor-made specifically for her, and with the way they frame her ass, you bet you could bounce a credit chit right off her cheeks.");
	output("\n\nThe pants come with a belt, which she leaves undone and open for now; instead, she bends forward (at the waist, of course) again and retrieves her upper-half: a thick type of material, almost like armor, overtop a more comfortable silk shirt. It’s not as easy to get on; the armor is inflexible and unforgiving, especially around her chest, and she has to wrestle her arms through the sleeves. It ruins the show a bit, but you won’t complain.");
	output("\n\nFinally, with all that done, she’s back in her officer’s uniform, looking just like she did the day you met her. She finishes the ensemble by tightening and fastening her belt.");
	output("\n\nShe resumes her earlier sitting position next to you. Gingerly, she picks up her now-discarded T-shirt and shorts, pinching them between her fingers, and flops them onto her suitcase.");
	output("\n\n<i>“Was there... anything</i> else <i>I can do for you, captain?”</i> Penny asks you, her tongue licking at her lips.");
	output("\n\nIt’s good to be captain, sometimes.");
	processTime(25);
	pc.lust(40);
	pennyCrewMenu();
}

//Penny Sex Menu
public function pennyCrewSexApproach():void {
	showPenny();
	clearOutput();
	//Non-futa
	if (!penny.hasCock())
	{
		//Horny
		if(penny.lust() >= 66) output("Penny’s ears perk right up when you admit that you want to have sex. She even says, <i>“Ohhh, this is just what I need, [pc.name]!”</i> Out of her seat a moment later, the busty, aroused vixen coos, <i>“So, any preference as to how I take you today, mate?”</i>");
		//Not Horny
		else output("Glancing up at you, Penny sighs, <i>“Right now?”</i> She doesn’t really look up for it right now, but after a moment, a sly look spreads across her face. <i>“I suppose I can </i>squeeze<i> you in.”</i> She shimmies a hand into the waistband of her pants as she lazily stands. Her eyelids drop seductively as she pulls her fingers out, glistening with moisture. <i>“I guess your scent has about as much effect on me as the zil, huh?”</i> she jokes, though you wonder if there’s a bit of truth sliding underneath the jest.");
	}
	//Futa
	else
	{
		output("Penny is up and out of her chair almost as soon as you mention the idea of sex. Her fly is undone, leaving her [penny.cock] to point up at you, almost accusingly. She touches it experimentally and shivers from the rush of pleasure that courses out of it in response. <i>“I think so, [pc.name].”</i> Rubbing it a little faster, the fennec enthusiastically offers, <i>“Does my mate have any preference for how I take " + pc.mf("him","her") + "?”</i>");
	}
	pennyCrewSexMenu();
}

public function pennyCrewSexMenu():void
{
	this.clearMenu();
	
	// I don't THINK these scene is supposed to /require/ the player have a cock; it never once uses any logic or parse tags for the players cock, nor refer to it within the scene text OR the "exit" texts...
	if(penny.hasCock()) this.addButton(0,"Onahole Her",jackinPennyOffWithAnOnahole,undefined,"Onahole","Jerk off Penny’s drug-grown cock with an onahole.");
	else this.addDisabledButton(0, "Onahole Her","Onahole Her","Penny must be a futanari for this scene to work.");
	
	if (pc.hasCock())
	{
		//if(penny.hasCock()) this.addButton(0,"Onahole Her",jackinPennyOffWithAnOnahole);
		//else this.addDisabledButton(0,"Onahole Her");
		//Needs dick or strap-on
		if (pc.cockThatFits(penny.vaginalCapacity(0)*1.5) >= 0) this.addButton(1,"OverDeskFuck",pennyOverTheDeskRoughFuck,undefined,"OverDeskFuck","Bend Penny over the desk and go to town.");
		else this.addDisabledButton(1,"OverDeskFuck","OverDeskFuck","You’re too big to bend her over the desk and fuck her.");
		if(penny.hasCock()) this.addButton(2,"Frottage",pennyFrottage,undefined,"Frottage","Grind dicks with Penny.");
		else this.addDisabledButton(2,"Frottage","Frottage","This scene requires Penny to have a dick.");
		this.addButton(3,"Pawjob",penniliciousPawjob,undefined,"Pawjob","Get a fluffy footjob from Penny.");
		this.addButton(4,"FaceFuckHer",faceFuckPenny,undefined,"FaceFuckHer","Fuck Penny’s face.");
	}
	else 
	{
		this.addDisabledButton(1,"OverDeskFuck","OverDeskFuck","This scene requires you to have a penis.");
		this.addDisabledButton(2,"Frottage","Frottage","This scene requires you to have a penis.");
		this.addDisabledButton(3,"Pawjob","Pawjob","This scene requires you to have a penis.");
		this.addDisabledButton(4,"FaceFuckHer","FackFuckHer","This scene requires you to have a penis.");
	}
	this.addButton(5,"EatHerOut",gardeFordWritesPennySmex,undefined,"EatHerOut","Eat out Penny.");
	if(penny.hasCock() && !pc.isTaur() && !pc.isNaga()) addButton(6,"U.Desk Suck",suckPennyUnderDesk,undefined,"Under Desk Suck","Suck Penny off under her desk.");
	else if(!penny.hasCock()) addDisabledButton(6,"U.Desk Suck","Under Desk Suck","Penny needs to be a hermaphrodite for this.");
	else addDisabledButton(6,"U.Desk Suck","Under Desk Suck","You need to have a body that would fit under Penny’s desk for this.");
	if(penny.hasCock() && pc.hasGenitals()) addButton(7,"Roleplay",pennyRPScene,undefined,"Roleplay","Roleplay a penitent prisoner for Penny to abuse.");
	else if(!penny.hasCock()) addDisabledButton(7,"Roleplay","Roleplay","Penny needs a penis in order to this.");
	else addDisabledButton(7,"Roleplay","Roleplay","You need genitals to roleplay with Penny.");
	

	if(penny.hasCock()) this.addButton(8,"Catch Anal",getAssFuckedByPenny,false,"Catch Anal","Get ass-fucked by Penny.");
	else addDisabledButton(8,"Catch Anal","Catch Anal","Penny needs a dick to fuck you in the ass.");
	
	/*
	if(flags["PENNY_IS_A_CUMSLUT"] != undefined) this.addButton(9,"Selfsuck",pennySelfSuckCumsluttery,undefined,"Selfsuck","Watch Penny suck herself off.");
	else addDisabledButton(9,"Selfsuck","Selfsuck","Penny has to be a futanari cum-slut for this scene.");
	if(flags["PENNY_IS_A_CUMSLUT"] != undefined && pc.hasCock()) this.addButton(10,"Bukkake",bukkakePenny,undefined,"Bukkake","Cooperatively cover Penny in spunk.");
	else addDisabledButton(10,"Bukkake","Bukkake","This requires Penny to be a futanari cum-slut and for you to have a penis.");

	if (flags["FLAHNE_TALKED_ABOUT_CUMSLUTPENNY"] != undefined && flags["PENNY_IS_A_CUMSLUT"] != undefined) addButton(11, "Invite Flahne", pennyVsFlahneWhoWillOutslutWho,undefined,"Invite Flahne","Invite Flahne over for a threesome with Penny.");
	else addDisabledButton(11, "Invite Flahne","Invite Flahne","This scene requires Penny to be a cum-slut and Flahne to have been told about it.");*/
	this.addButton(14,"Back",approachCrewPenny,true);
}

//[=Other Crew=]
// Grey out this button if there are no other crewmates.
// Tooltip: Ask Penny what she thinks of the fact that you have other crewmates.
// Tooltip (no crewmates, not silly): You don’t have any other crew mates to talk about, so this is a bit of a moot point.
// Tooltip (no crewmates, silly): And here is where you would talk about your other crewmates... IF YOU HAD ANY!!!!
// (scene: Other Crew)
public function otherCrewPennyTalk():void
{
	clearOutput();
	showPenny();
	author("B");
	flags["PENNY_OTHER_CREW_TALKED"] = 1;
	output("You ask Penny what her opinion is on the rest of your crew. As the ship’s captain, it’s important to you that your crew’s morale remains high, and if there’s ever a problem, you should try to mediate it and solve it.");
	output("\n\n<i>“They seem to be a pretty nice bunch, to me,”</i> she answers simply. <i>“I don’t have any problems with the rest of them. I’m not too surprised that you managed to charm your way into cajoling some other suckers into working for you.”</i> She laughs, and leans forward, nuzzling her nose against yours. <i>“How much do you pay them? Nothing, right? You filthy little " + (pc.mf("tramp","minx")) + ".”</i>");
	output("\n\nYou relax. It’s good to hear that–");
	output("\n\n<i>“But,”</i> she says. Her tone has dropped; her nuzzling has stopped, but her nose is still against yours; and her eyes are open and narrowed, focused like a laser into you. <i>“I can smell your stink</i> all over <i>them. Maybe you aren’t paying them in money, is that it?”</i>");
	output("\n\nYou freeze. You were hoping that Penny wouldn’t have an issue with you tending to your crew the way you do – trips between planets can get awfully long, and rushing can be difficult, frustrating, lonely work sometimes... you won’t deny that " + (pc.isNice() ? "not everyone in your crew has the same ‘traditional’ needs as some others":"you might have kept your crew in check with ‘alternative’ methods") + ". Whatever keeps their morale high, like you said.");
	output("\n\n<i>“What a load,”</i> she says, her lips lifting to show you her clenched, snarling teeth. <i>“I thought we had something, [pc.name], and here I find out you’ll fuck just about anything with a pretty face.”</i>");
	output("\n\nYou aren’t sure how to reply to that. The seconds tick by tensely.");
	output("\n\n<i>“Hah! I’m just " + (penny.armor is UGCCasualOutfit ? "fuckin’":"messing") + " with you, " + (penny.armor is UGCCasualOutfit ? "my mate":"captain") + ",”</i> Penny laughs, leaning back and punching you in the arm well-meaningly. <i>“I’m not mad. In fact, I would be surprised if you</i> didn’t <i>have a harem of horny beauties following you around!”</i>");
	output("\n\nYou say nothing yet. You’re getting a <b>lot</b> of conflicted messages.");
	output("\n\n<i>“Look, I’ll break it into threes for you. First,”</i> she says, lifting her index finger, <i>“you " + (penny.armor is UGCCasualOutfit ? "fucking":"messing") + " around a lot doesn’t change what you did for me. When we stopped that illegal mining operation and excavated that deposit of Oxonium, I knew what I wanted to do and who I wanted to be with, end of story. Second,”</i> she says, lifting her middle finger, <i>“I’ve seen the way you fuck, you sexy " + (pc.mf("stud","bitch")) + "; if you could rope</i> me <i>into wanting to be with you, well... let’s just say, when it comes to everyone else in your crew, that I get it.”</i>");
	output("\n\n<i>“And finally,”</i> she says, putting her hand down flat onto the bed and leaning back into you, <i>“between you and me... a lot of them seem like a bunch of beta bitches to me. I wouldn’t mind being the alpha bitch.”</i> Her tongue snakes out of her lips and licks them wetly – then, she leans in, bringing her mouth to your [pc.ear]. <i>“I could see myself corralling one or two of them into your quarters, and we could show them how an alpha like yourself treats their pack.”</i> She clinches her statement by nibbling on your ear, her tongue tracing the rim; you can hear and you can feel her breath quickening through her nose and against your neck.");
	output("\n\nJust as suddenly as she starts, she stops, and pulls back, resuming her earlier sitting position. <i>“Something to think about, my " + (penny.armor is UGCCasualOutfit ? "mate":"captain") + ",”</i> she says slyly.");
	output("\n\nIt’s safe to say that she’s okay with your relationship as the captain of your crew.");
	processTime(10);
	pc.lust(20);
	clearMenu();
	addButton(0,"Next",pennyCrewTalk);
	//[=Next=]
	// end scene (scene: Other Crew); increase Lust by 20; return to Talk menu
}

/*
output("\n\n[=Cuddle=]");
output("\n\n// Tooltip (Penny is not bunking with you): Invite Penny to non-sexually share your bed at night. A girl with that much fluff is sure to help keep it warm!");
output("\n\n// Tooltip (Penny is currently bunking with you): Ask Penny to give you some space for the night. She’ll take it well, surely.");
output("\n\n// Continue from here if the PC is inviting Penny to their bed.");
output("\n\n// (scene: Penny Bunking)");

output("\n\n{Not a bimbo:You tell Penny, with your authority as the ship’s captain, that you are, until further notice, putting her under voluntary hot-bunking protocol, provided she voluntarily hot-bunks with the captain of the ship.}{Bimbo:You tell Penny that she’s like, real fluffy, and you think she’d be great to hold at night when you’re trying to sleep. But she doesn’t hafta sleep in your bed if she doesn’t wanna. Oh, maybe you can call that a thing – the ‘I Want You To Sleep In My Bed But You Don’t Hafta If You Don’t Wanna’... thing.}");

output("\n\nShe giggles, her tail swishing behind herself in amusement. <i>“Look, [pc.name], if all you wanted was for me to {bang/sleep with} you during the night, you could have just asked.”</i>");

output("\n\nYes, you <i>could</i> have. But you chose to exercise your rights as the ship’s captain, and give her an order to follow.");

output("\n\n<i>“So, I could voluntarily hot-bunk with anyone in this ship, ‘until further notice,’”</i> she says, putting a finger under her chin and smiling wryly, <i>“provided it’s either you, or nobody.”</i>");

output("\n\nYou tell her that that’s correct. In all honesty, you just want to go to sleep with a cuddly, foxy woman in your arms at night. {Not a bimbo:Whether it goes in any other direction, well... that’ll be up to the moment, wouldn’t it?}{else:Sex is great fun and all, but sometimes, having a good nap is great, too, and Penny herself is great, and you wanna put two great things together.}");

output("\n\n<i>“Okay, {‘captain,’/captain,}”</i> she giggles. <i>“I’ll be reporting to my station for my rounds at twenty-two-hundred sharp.”</i> Her tail flicks behind her in your direction, almost accusatorily. <i>“Don’t leave me to my post all alone tonight, you hear me?”</i>");

output("\n\nYou’ll be sure to make time in your busy captain’s schedule to get some sleep.");

output("\n\n[=Next=]");
output("\n\n// end scene (scene: Penny Bunking); return to [=Talk=] menu");

output("\n\n// Continue from here if the PC is kicking Penny out of their bed");
output("\n\n// (scene: Penny Debunking)");

output("\n\nYou stiffen a little bit, unsure of how Penny is going to take what you’d like to say. But, still, you feel the need to say it. You tell her that her voluntary hot-bunking protocol has concluded, and that she may return to her regular sleeping quarters, effective immediately.");

output("\n\nPenny tilts her head in confusion. <i>“Something the matter, cap{tain}?”</i> she asks, her expression a cross between hurt and bewildered. <i>“Am I not fluffy enough for you anymore?”</i>");

output("\n\nThere’s a good chance she’d never have to worry about that in her life, that’s for sure. You’d simply like to return to a more ‘professional’ sleeping arrangement for now. It’s nothing personal.");

output("\n\nUnexpectedly, Penny laughs. <i>“So, just how hard is it to kick a girl out of your bed, but still {fuck/mate with} her on the side?”</i>");

output("\n\n<i>“Very,”</i> you reply.");

output("\n\n<i>“Don’t worry about it,”</i> she says, slapping you well-meaningly on your [pc.thigh]. <i>“If I know you like you know me, we’re gonna keep {fucking/mating} on the side. Only now, I can spend my nights catching up on my manga!”</i>");

output("\n\nYou can’t tell if she’s being sincere, or if she’s hurt and she’s trying to mask it. If she <i>is</i> upset, though, she’s hiding it rather well.");

output("\n\n<i>“You let me know when that big-ass bed of yours starts to get a little cold again, eh?”</i> she says. <i>“I’ll come running.”</i>");

output("\n\nAll told, that conversation went better than you had expected.");

output("\n\n[=Next=]");
output("\n\n// end scene (scene: Penny Debunking); return to [=Talk=] menu");

output("\n\n// Continue here if the PC goes to bed anytime between 20:00 and 02:00 while Penny is sharing their bed");
output("\n\n// (scene: Bed Time)");

output("\n\n{PC is clothed:Just as you begin to strip down to get ready for bed}{else:Just as you get ready for bed}, you hear a knock on the door to your quarters. You have a good idea who it is.");

output("\n\nYou answer the door, undoing the electric lock and sliding the heavy door out of place, and there is Penny – wearing absolutely nothing. Everything is on display, all the way down to {her pussy, exposed to the air of the ship}{her limp cock and plump balls, flaccid inside her sheath and dangling between her legs, respectively/her oversized cock, limp-but-chubby, and massive balls, batting against her thighs with her every heartbeat}, free to see for anyone that might come by.");

output("\n\nShe has a blue pillow tucked underneath one arm, and with the other, she covers her mouth, stifling a long yawn through her fingers. <i>“Hey, cap’n,”</i> she says through a tired, chewy mouth. She doesn’t wait for you to invite her in and pushes you aside. <i>“Boy, I’m bushed. ‘nother day down, am I right?”</i>");

output("\n\n{First time:You loudly suppose that Penny must sleep in the nude.\n\n<i>“Yeah. Don’t you?”</i>}{else:By now you’ve gotten used to the sight of having to answer the door to a naked, foxy lady.}");

output("\n\nPenny doesn’t waste any time making herself at home. At the sight of your larger bed, rounds herself to its left-hand side and places the pillow down, fluffing it for her head. You take a moment longer, bringing yourself to the opposite side – you can’t help but steal glances at Penny’s shamelessly naked form from time to time, and you aren’t particularly stealthy about it.\n\n<i>“Come on, cap’n, you’ve seen me naked before,”</i> she says playfully. <i>“What’s so surprising about seeing me in the buff now?”</i>");

output("\n\nThere’s nothing ‘surprising’ about it. Can’t you just ogle a pretty lady from time to time?\n\n <i>“Hah! You’ve already got me naked and in your room, [pc.name]; I think we’re a bit beyond the pick-up lines.”</i> Despite the dismissal, her gaze is cast downward, and you see a small smile play on the corners of her lips. Who doesn’t like being complimented now and again?");

output("\n\nYou both pull the sheets back on your bed at the same time. <i>“Hope you don’t mind,”</i> Penny says as she climbs into the bed, sliding one foot underneath the covers and shuffling her butt into place. <i>“But I’m a bit of a clingy cuddler. Hope you know what you’re getting into.”</i>");

output("\n\nHaving a pretty lady hold you at night is exactly what you wanted when you asked her to join you. <i>“Just letting you know what you’re getting into, cap’n,”</i> she laughs.");

output("\n\nYou shuffle yourself into your bed once you’ve deactivated the lights, worming your way across the soft fabrics until you’re right next to Penny. The total darkness of the room is offset by a some low-frequency lights leading from the bed to the door, in case of an emergency; it’s enough to let you see silhouettes without interrupting your sleep.");

output("\n\nNot that you have to see what happens next: as soon as your [pc.skinFurScales] make{s} contact with Penny’s, she rotates onto her side, facing you, and immediately wraps limbs around your body, gripping you tightly and holding you to her. Your physical world is swaddled in soft downy fur, pressing against you, covering you, and keeping you even warmer than the sheets would by themselves. To top it off, you feel her drape her long, bushy tail across her thighs and yours, idly swishing its fluffiness against you.");

output("\n\nShe’s very careful with where she touches, and with what – especially with her claws, and <i>especially</i> with her {pussy/sheath}, careful to not steal any sleep from the night – but, you couldn’t get away from her if you tried.");

output("\n\nIt actually reminds you of the day you had asked Penny to join you on your crew: the way she hugged you and refused to let go, or even ease up her grip, for a surprising amount of time. It inspires you that, maybe, Penny is hoping you’d reciprocate, so you do: you lean towards her and wrap your arms and [pc.legs] around hers, locking her against you the same way she’s doing to her.");

output("\n\nYou tell her that you’re not going to go anywhere. You’re nice and snug, just where you are.");

output("\n\n<i>“Good,”</i> she replies – and you can feel her sigh as she rests her chin against your shoulder. It was exactly what she had wanted to hear.");

output("\n\nContented, you soon fall asleep.");

output("\n\n// Continue here if the PC goes to bed anytime between 02:01 and 08:00 while Penny is sharing their bed");

output("\n\nIt’s late as hell. You’ve spent too long between rests, and now you’re pulling in at this unholy hour. And the fact that you asked Penny to join you hasn’t left your thoughts; you wonder how badly you’re going to get chewed out for this one.");

output("\n\nYour bedroom is separate from your quarters – a perk of being the ship’s captain. When you open the door to your bedroom, you see, in the dim light, a body, all hunkered and cozy beneath the covers of your bed. You can’t make out too many details, of course, but the telltale red mohawk and giant, fuzzy fox ears give away who’s in there right away. It seems Penny didn’t feel the need to wait. You <i>had</i> given her permission, after all.");

output("\n\nYou enter the room and close the door behind you, putting you in total darkness, save for a set of low-frequency lights running from your bed to the door. {PC is clothed:You strip naked, then you}{else:You’re already naked, so you just} feel your way to the bed, and you show yourself in.");

output("\n\nPenny stirs when you slide yourself in. Her body moves and shuffles towards you, her hand outstretched and sleepily searching for something to touch. <i>“Mmmmbuh,”</i> she mumbles incoherently. <i>“[pc.name]?”</i>");

output("\n\nYou take your hand in hers and shush her back to sleep. <i>“Mmmkay,”</i> she mutters, then goes still, her breath steadying once more as sleep regains its hold on her.");

output("\n\nIt’s up to you to do the cuddling for you both: you move towards her, and you wrap your arms and [pc.legs] around her, gently, sharing your body heat with her. Her body is very soft, particularly her fur: you run your fingers through it, enjoying the soft swish of her fur between your digits, and you rest your thigh against hers, pushing against her like a big, cuddly pillow.");

output("\n\n<i>“Mmmmm,”</i> she moans as she subconsciously inches toward you just a little more.");

output("\n\nYou take after her lead, and fall asleep.");

output("\n\n[=Next=]");
output("\n\n// end scene (scene: Bed Time); go to (scene: Wake Up)");

output("\n\n// (scene: Prelude)");
output("\n\n// Continue here if the PC had 50 Energy or more when they went to sleep");

output("\n\nYou wake up a little bit before your alarm. You weren’t all that tired when you slept, so you aren’t too surprised that you woke up ahead of schedule.");

output("\n\nThat said, though, as soon as you try to move any part of your body, you’re reminded that you have a guest with you. Lying beside you and snoring lightly is Penny, her body leaning against yours, but facing away from you – it seems, in your sleep, you both positioned yourselves around so that her back is against your front, your [pc.chest] into her back and your [pc.crotch] up against her butt. Her long, fluffy tail lays limp overtop you both.");

output("\n\nYou run your fingers through Penny’s fur, appreciating how soft, yet full-bodied, she keeps it. She clearly takes her fur’s health and hygiene very seriously.");

output("\n\nAs your hands travel, they come across her taut belly, and you can feel just how toned and packed her body is underneath the fur there – a form like hers comes as a prerequisite with a job like hers. They continue traveling northwards, to the underside of her full, heavy breasts; at first, you nudge them with the backs of your hands, hefting and testing their weight. When Penny doesn’t stir any more than usual, you daringly run your thumb over one of her nipples.");

output("\n\nPenny snorts, and then mumbles something under her breath, but she’s still out cold.");

output("\n\nYour [pc.legOrLegs] {is/are} entwined with hers, wrapping your lower bodies in a mess of limbs that you couldn’t hope to pull apart without waking her. Growing bolder, you thrust your [pc.hips] forward, {PC has a cock:dragging your flaccid [pc.cock] into the valley of her tight ass, nestling it somewhere cozy and warm, not unlike your own bed}{else:rubbing your [pc.crotch] against the firmness of her ass and the fineness of her fur back there, giving you a bit of tactile pleasure}.");

output("\n\nYour fingers make another lap down her leg, gently raking through her fur there and its varying degrees of fineness: from thick as could be at her thigh, to thin and sensitive at her knee, then back again. You can feel just how tight her body is{has cock:– and would be –} with your motions, and, knowing her, she probably wouldn’t mind waking up to a very special ‘good morning.’");

output("\n\nYou could have her right here and now. Question is... do you?");

output("\n\n[=Fuck Her=][=LetHerSleep=]");

output("\n\n// Continue here if the PC had 49 Energy or less when they went to sleep");

output("\n\nYou’re standing in a small, one-room log cabin; behind you is the door to the building, and in front of you is a glass window. There’s a double-wide bed underneath the bed, and a counter along the left-hand wall. It’s a beautiful late-summer day; sunlight is streaming in through the window, and from where you’re standing, you can see thick forest surrounding your little slice of paradise just outside.");

output("\n\nIt’s warm, befitting the season. <i>Rather</i> warm. Warm enough that you decided to get naked a while ago. In fact, you don’t remember what your clothes look like, or where you put them. There aren’t any dressers in the cabin.");

output("\n\nA pair of furry palms wrap around you from behind, and a furry leg {PC is bipedal:slides in between yours}{PC is naga:wraps around your long tail}. What feels like a warm breeze caresses your neck; the leg {against/around} you shuffles a little bit, and a sudden weight lurches onto your back. A heavy pair of breasts, with erect nipples, press insistently into your [pc.skinFurScales].");

output("\n\n<i>“[pc.name],”</i> you hear Penny whisper into your ear. Penny is with you, you knew that – did you know that? Well, she’s here, with you, in this warm, cozy, one-room cabin in the middle of nowhere. You turn your head to see her, but you don’t really <i>see</i> her so much as <i>picture</i> her, in stunning detail: everything from the way her mohawk hairdo leaning to one side, to the tone of her fur along her front and how it contrasts to her arms and legs, to her {Penny is vanilla:puffy vixen’s pussy, melding against you and stretching every time Penny humps against your nude form a bit}{Penny is a herm:plump {fox/horse} sheath, her cock’s head peeking from the cozy comfort of its wet, moist, fleshy home to insistently jab you in the [pc.vagOrAss].}");

output("\n\nYou think she asks you a question. For some reason, it goes in one ear and right out the other. You think you mumble a response, but it could just as well have been you flapping your mouth and exhaling at the same time, ultimately saying nothing.");

output("\n\nPenny’s hips press into you, a little more forcefully than the last few times. One of her hands dips between your legs, and, with absolutely zero foreplay, {PC has a cock:her fingers wrap themselves around your own [pc.base], gently, warmly, stroking you. You get hard in record time}{else:her fingers splay around your [pc.vagina], one finger to each lip of your vulva, and begins stroking you, with an unusual earnest, even for her}. Of course, it might just be a distraction, because{Penny is vanilla: her humping grows far more forceful, more <i>needy</i>, and her hot cunt begins to soak as it grinds against the fat of your [pc.thigh]}{Penny is a herm:, with another, heavier, thrust, her {penny.cockHead} thrusts against your [pc.vagOrAss] hard enough that you can feel yourself begin to yield}. The floorboards creak noisily, and Penny stamps her foot impatiently, with every thrust of her body against yours.");

output("\n\nSomething... isn’t quite right. It’s tough to say what, though. Your mind feels kind of fuzzy, like, what you’re feeling doesn’t <i>quite</i> match up with... something else, and your head is trying to fill in the blanks. When did you get a cottage in the middle of the woods? Is that important?");

output("\n\nMaybe you should–");

output("\n\n[=Wake Up=][=Dream On=]");
output("\n\n// end scene (scene: Prelude); increase Lust by 20");

output("\n\n[=LetHerSleep=]");
output("\n\n// (scene: Let Her Sleep)");

output("\n\nShe’s tired, and frankly, she looks like she’s at such peace, sleeping there. You wouldn’t want to interrupt a girl’s beauty rest.");

output("\n\nYou drape your limbs around her, assuming the role of big spoon, and keep her close to your body. You hear her sigh in contentment. You’re not particularly tired, but maybe you can catch another wink or two while you wait for her to wake up.");

output("\n\n...");

output("\n\nAbout an hour passes. You never really fall back asleep; you just lay there, holding Penny in your arms, occasionally stroking at her fur or at the hair on her head. You don’t think about any one thing in particular the whole time, but most of your thoughts <i>do</i> lead back to Penny in some form or another.");

output("\n\nEventually, Penny moans and lifts her head. She’s facing away from you, but, when she tries to move her arms and finds herself locked steadily against you, she turns her head, her body following, trying to roll onto her back. You let her, and you’re nose-to-nose with your hot-bunking bunkmate.");

output("\n\nShe smiles at you, and you smile back. Neither of you say anything for a few moments; you just stare into each other’s eyes in the dim light of your quarters. Then, she leans forward, rubbing her nose against yours a few times, and then closes the distance with a gentle kiss, hers on your [pc.lipsChaste].");

output("\n\n<i>“Good morning,”</i> she says.");

output("\n\n// Continue here if it’s 11:59 or earlier");

output("\n\nYou wish her a good morning, herself.");

output("\n\nShe lifts her left arm around you, returning the hug you’ve been giving her the past hour. She nuzzles her cheek against yours and gives you another kiss on the cheek. <i>“Sleep well, cap’n?”</i> she asks.");

output("\n\nYou respond that you’ve never slept better.");

output("\n\n<i>“Same. I wouldn’t mind spending another few minutes here with you.”</i>");

output("\n\nIt would be an abuse of your privileges as captain if you deliberately slept in longer than your duty allows.");

output("\n\n<i>“So, yeah, we’re sleeping in, right?”</i> she giggles.");

output("\n\nYou don’t answer; instead, you lay there, holding Penny against you. You both touch and pinch at each other in various spots; from your upper backs, to your thighs, and, of course, a few mischievous times, you each sneak in a grope on the other’s ass. She coos every time you touch her in a new spot, and she does her best to make you moan when she does the same thing in return.");

output("\n\nAs much as you’d like to keep it up, though, unfortunately, you both <i>do</i> have a job to do. <i>“That’s easy,”</i> she says, her grip on you only getting tighter, <i>“your job is to stay in bed and cuddle me for another hour or two.”</i>");

output("\n\nThen, she laughs. <i>“I’m kidding. As much as I like staying in bed with you, my mate, I’ve kind of gotten used to being an early bird, after my time in the academy and my work on Mhen’ga.”</i>");

output("\n\nWith a swish of her arm, the cover of the bed is whisked off you both, exposing you both to the sudden chill of the air. With energy you hadn’t expected coming from a woman prodding you to stay in bed longer, Penny practically leaps to her feet, bounding on her toes and stretching her arms, first both together, then one after the other.");

output("\n\n<i>“Up and at ‘em, captain!”</i> she says, pivoting on the spot and putting a foot on the bed, stretching her long, slender, toned leg. As she does, you’re given an unabashed, unrestricted view at her {Penny is vanilla:pussy, on display, just for you}{Penny is herm:sheathed cock and fluffy balls, dangling and flaunting on display, just for you}.");

output("\n\n<i>“Enjoying the show?”</i> she asks, thrusting her pelvis in your direction.");

output("\n\nYou are, in fact. You pat the now-vacant spot on the bed, inviting her back, and offer to make this morning a <i>really</i> good one.");

output("\n\n<i>“Tempting,”</i> she laughs, and repeats the stretching with her other leg on the bed, <i>“but, if we’re going to spend the hours fucking on your ship, we might as well do it on the clock.”</i>");

output("\n\nWith her morning routine completed, Penny grabs her pillow and makes for the room of your quarters. Her long, fluffy tail swishes in circles behind her, lifting up as high as her shoulder, giving you a few, tantalizing teases of her pert ass as she walks out. <i>“I’ll be ready when you are, captain,”</i> she says sensually, before disengaging the electric lock and heading into the hallway, as naked as when she entered your quarters.");

output("\n\nIncentivized, you leave the bed yourself. {PC is naked:You aren’t intimidated by her brazen nudity, and you leave your quarters, just as naked as she was – besides, you get the feeling that clothing would just get in your way, in a few moments.}{else:You strap your [pc.gear] back on, readying yourself for the day – although, you get the feeling that they’re just going to get in the way in a few moments. Still, it’s the thought that matters.}");

output("\n\nYou’re back in your ship, facing a new day.");

output("\n\n// Continue here if it’s 12:00 or later");

output("\n\nYou inform Penny that it actually isn’t morning. You two have slept past noon.");

output("\n\nPenny’s eyes go wide, and her smile disappears. <i>“What?!”</i> she hollers, bolting upright on the bed and searching for a clock in the room. There’s a digital one built into your bed’s headboard; sure enough, it’s past noon.");

output("\n\n<i>“Gods, it is!”</i> she says, then practically vaults off the bed, flinging the cover off both of you. She stretches both her arms above her head, and then one after the other, but the motion is so quick and flustered that you doubt her limbs are getting the stretching they need. <i>“How could I let this happen? I gotta–”</i>");

output("\n\nYou stop her by grabbing onto her fluffy tail and giving it a squeeze (you’re careful not to give it a yank). You ask her what the big rush is.");

output("\n\n<i>“The rush is that–”</i> she starts, whipping around on the spot and glowering down at you from her position. But, once she sees you, she relaxes. She eyes the bed, from the headboard to its end, then she looks around the dimly lit room, remembering where she is and what she’s doing.");

output("\n\nAfter a moment, Penny sits on the bed with a laugh. <i>“Sorry,”</i> she says sheepishly. <i>“I’m, uh, still adjusting to life outside of my responsibility on Mhen’ga. My training and my work made me into a bit of a morning person.”</i>");

output("\n\nYou stroke at her tail, preening it with your fingers and matting down the fur after it’s all stood on end from her panic. You tell her that it’s okay – you expect your crew to have responsibilities, but you can’t very well expect them to have Penny’s work ethic if you, the captain, can’t haul your ass out of bed before noon.");

output("\n\n<i>“I suppose not,”</i> she says, swishing her tail in your grip. She leans in towards you and kisses you on the forehead. <i>“It’s probably going to take a while to beat my ‘morning person’ ethic out of me, if this is going to be our regular schedule.”</i>");

output("\n\nYou pat the bed, in the now-vacant spot, and invite her back in. Now that she’s up and she’s got her blood pumping properly, you two could make this afternoon all the better before you both report to your stations.");

output("\n\n<i>“Oooh,”</i> she coos, running her hand from your head, to your shoulder, to the swell of your [pc.ass] and down your [pc.thigh], admiring what she’s seeing. <i>“It’s not a bad offer, cap’n.”</i> She bites into her lower lip, fantasizing about crawling back into bed with you. But, before she gets too carried away, she stops, and pulls her hand away. <i>“But, I’d feel like an asshole if I didn’t at least check in this late in the day. If we’re gonna fuck, we might as well do it on the clock, at this point.”</i>");

output("\n\nWith that said, she stands and redoes her stretches from the beginning: first both her arms, then one after the other, and then both her legs. <i>“You’ll know where to find me when you’re ready to get today ‘started,’”</i> she tells you. Then, she picks up her pillow and leaves your quarters, as naked as when she entered.");

output("\n\nShe’s right, you tell yourself: that’s enough sleeping in for now. You’ve abused your privileges as captain enough.");

output("\n\nYou kick the sheets off your body, then, after your own stretches, {PC is naked:you make your way for the ship’s corridors, ready to start your day}{else:you reattach your [pc.gear] (as unnecessary it might be in just a moment, if you decide to chase after Penny), and then make for the corridors of the ship, ready to start your day}.");

output("\n\n[=Next=]");
output("\n\n// return the PC to the ship’s main menu; increase Lust by 20; advance clock by eight hours");

output("\n\n[=Wake Up=]");
output("\n\n// (scene: Cockblock)");

output("\n\nYour mind wakes up before your eyes. Through your eyelids, you see a dim darkness, and you’re still too out of it to put your thoughts in any coherent order. But, what you <i>feel,</i> far clearer than you think you ought to, is Penny humping against you.");

output("\n\nYou turn your head and try to wink your eyes open. Your vision is a little blurry from the sleep, but you make out her features well enough, even in the dim light. Her lower lip is curled inwards, and her jaw moves slightly as she nibbles on it. Her eyes are narrowed, and her hands are still – she’s looking like a kid that got caught with their hand in the cookie jar. You don’t chastise her, of course. It takes you a moment to realize what you would even chastise her for.");

output("\n\nInstead, you break the tension she’s clearly having by wishing her a good morning.");

output("\n\n<i>“Good morning to you too, cap’n,”</i> she says, exhaling. Her limbs tighten around you, holding you closer to her, and she plants two kisses on your neck. <i>“Gods, I slept like a rock. How about you?”</i>");

output("\n\nYou had slept about as well, and you ask when she woke up.");

output("\n\n<i>“Not too long ago, only a few minutes before you.”</i> Her expression cracks a bit. <i>“I didn’t wake you, did I?”</i>");

output("\n\nYou lie and tell her that she didn’t.");

output("\n\n<i>“Great. I was worried all my shuffling and restlessness might have, you know, woken you up.”</i> Her readjusts against yours, trying to get comfortable in the cramped bed. {Penny is vanilla:Her crotch grinds against you once more as she does, and the unmistakable damp gash spreads once more.}{Penny is herm:Her dick bumps up into the crease of your [pc.ass], frotting itself and making itself nice and snug in there.} She keeps her face still like a stone, but it doesn’t take a genius to know what she was doing, whether you were asleep or not.");

output("\n\nPenny takes a deep breath through her nose. <i>“Anyway!”</i> she starts with a high, cheery tone. <i>“I think we’ve taken enough advantage of your captain’s privileges, [pc.name]. Time to rise and shine!”</i>");

output("\n\nWith that, she lets go of you and throws the sheets off you both, suddenly exposing you to the comparatively chill air of the quarters. Exerting a surprising amount of energy and pep, she hefts herself off the bed and onto her feet, and begins her morning routine of waking herself up:");

output("\n\nFirst, she lifts both arms up and above her head, stretching them there; then, she stretches one across her chest before the other. <i>“Before the academy, I was always a bit of a late riser,”</i> she says to you, making conversation as she moves. <i>“But my time as a cadet and my job on Mhen’ga worked that out of me real good. Now I feel like a lazy asshole if I sleep in past ten in the morning.”</i>");

output("\n\nPenny pivots on the spot, facing toward you, and lifts her left leg onto the bed to stretch it. As she squats and stretches it, you’re given an uncensored, unabashed look at her {Penny is vanilla:puffy, neglected pussy; the fur around it is thin enough for you to see its skin, and, from the looks of how red and needy it is, she was <i>really</i> hoping you’d pretend to stay asleep.}{Penny is herm:{penny.cock}, throbbing and erect, just a foot and a half away from you. Her precum dribbles just a little bit from her tip, and her balls bounce with every squat – from the looks of it, she was <i>really</i> hoping you’d pretend to stay asleep.}");

output("\n\nYou tell her that you aren’t really an ‘anything’ person. Your primary job as a Planet Rusher doesn’t afford you the convenience of a regular sleep schedule: you sleep when you need to, and when you can. Hell, you could probably fall asleep again for another eight hours, right here and now, if you wanted.");

output("\n\nShe frowns. <i>“Not the healthiest of lifestyles, is it?”</i> she asks rhetorically.");

output("\n\nWhen Penny finishes her stretches, she picks up her pillow and heads for your door. <i>“Hey, though,”</i> she starts, wiggling her waist towards you, swishing her large, fluffy tail in a lazy circle. <i>“If you ever need any incentive to get out of bed in the morning, well... one of them is just down the hall and in her quarters.”</i>");

output("\n\nWith that, she leaves your room, as naked as when she first entered.");

output("\n\nNow that you’re alone, you pull yourself out of bed (with some lazy effort, naturally). {PC is naked:Owning to your nudist tendencies, you follow Penny into the halls of the ship, completely nude,}{else:You re-equip your [pc.gear], getting yourself as presentable as ever, before heading into the halls of the ship,} ready to face a new day.");

output("\n\n[=Next=]");
output("\n\n// end scene (scene: Let Her Sleep); return the PC to the ship’s main menu; increase Lust by 20; advance clock by eight hours");

output("\n\n[=Fuck Her=]");
output("\n\n// (scene: Somnophiliacs Rejoice)");

output("\n\n// Continue here if the PC has a dick");

output("\n\nYou can’t help yourself. Penny is <i>right there,</i> in all her nakedness, with her ass pressed right up against your [pc.cock]. Surely, she wouldn’t mind – she trusts you enough to get naked and into the same bed as you, and she loves you enough to leave her job to be with you. And, besides, you doubt she would have as much restraint if your positions were reversed. And if they <i>were,</i> you certainly wouldn’t mind.");

output("\n\nYou grip your [pc.cock] by the [pc.base], lifting your shaft upward and prodding your [pc.cockHead] against the yielding flesh of her spongy pussy. You trace your tool along her vulva, feeling its heat and collecting the occasional bead of dew onto your sensitive head.");

output("\n\nPenny hums and shifts in her sleep, her body wiggling a little bit to get into a more comfortable position – which, notably, involves bringing her knees upward slightly, and thrusting her ass towards you. It almost seems like too deliberate an action for her to be asleep, but at the same time, maybe her body just knows what it wants.");

output("\n\nYou have to be gentle. You don’t want to wake her; you just want her to have some pleasant dreams and to wake up to a ‘good morning.’ You resist your urge to thrust home and fuck her silly, and instead, you slide yourself forward, half an inch at a time, gradually introducing yourself into her. Her body melds around the head of your shaft smoothly, and you pause, letting her sleepy body acclimate to your tip.");

output("\n\nYou inch forward, sinking deeper into her. <i>“Ooooh,”</i> she hums, and she buries her head into her pillow, rocking it back and forth, her body pushing back against yours. Her tail swishes elegantly between you, twitching from the pleasure. Far be it from you to deny a woman’s body what it wants, so you sink yourself in a little deeper.");

output("\n\n//pc.cockChange();");

output("\n\nPausing, you reach around with your right arm, rubbing at her ribs just beneath her breasts, and making lazy circles down her furry, taut stomach, towards her crotch. Once you reach the valley between her legs, you buck into her, gently as could be, and you lightly {Penny is vanilla:flick at her clit at the same time, massaging it downward, towards your intruding member}{Penny is herm:grasp at her cock, still mostly tucked into her sheath, and pump it along your palm, her [penny.cockHead] is already poking out, and you run your thumb along its head, feeling it get harder and longer as you do}.");

output("\n\nShe winces in pleasure through her nose, but remains otherwise still, and she doesn’t say anything in her sleep. So, you keep it up: you keep yourself wrapped around her, keeping to your Big Spoon position, embracing her wholly, and every thrust into and out of her is only an inch or so at a time. It’s hardly enough to pleasure your [pc.cock] the way it knows it wants to be pleasured, but this isn’t about you; you’d rail the shit out of her if this was about busting a nut, but you’re trying to give Penny a damn good dream.");

output("\n\n<i>“Ah,”</i> Penny yips through chewy, gummed-up cottonmouth. <i>“Mmmm, fuck,”</i> she continues – from the sounds of it, you’re succeeding.");

output("\n\nYou can feel her get wetter as time goes on: initially, she was fairly dry, but the more you fuck her, the slicker it gets, if you needed any further confirmation that she’s enjoying it. You time the pumps of your [pc.hips] with {Penny is vanilla:your fingers making a shallow circle with her clit; with every rotation}{Penny is herm:another jerk of your hand against her rapidly-stiffening cock; with every pull}, her body shudders and clenches on you, and she exhales through her nose.");

output("\n\n<i>“[pc.name],”</i> she utters under her breath. It’s a boost to the ego, knowing that she’s dreaming about you, and you almost want to start fucking her harder. But, her moans and her delirious sleep-talking are too cute for you to risk like that, so, you maintain the course.");

output("\n\nIt’s nice, being there in the comfort of your bed, in the privacy of your room, in the security of your ship, gently making love to your lover and influencing her dreams. Penny is one of your more aggressive lovers, typically; maybe you could convince her to take it more slowly from time to time, so she can enjoy this while she’s awake.");

output("\n\n<i>“Fuck yeah,”</i> Penny mumbles, and her body shakily bucks backward into you, shucking more of your cock into her. You’ll take that as her agreeing with you.");

output("\n\nThe build-up is very slow, almost torturously so, given how slowly and shallowly you’re taking her. At one point, you start to wonder if you’ll even finish without going in a little deeper and risking waking her. Unfortunately for you, you don’t get to decide, and, as you make another buck into her welcoming pussy, your pelvis pushing into the downy fur of her ass, your body betrays you, and you unintentionally push in deeper than you meant.");

output("\n\n<i>“Oooh yeahhhhh,”</i> Penny sighs, and her body relaxes and reclines against you in response. <i>“Come on, buhhhhh,”</i> she slurs, then goes silent for another few thrusts. <i>“Gimme... cum. Gonna... gimme....”</i>");

output("\n\nFrom the sounds of things, she’s close – then, on one more thrust, accompanied with another {Penny is vanilla:deliberate grind of your fingers against her button}{Penny is herm:gentle yank along her mostly-hard-and-stiff cock}, she cums, her body tensing and shaking against yours and milking what bit of cock is stuffed inside of her{Penny is herm:, and her cock shudders and quakes in your grip, bloating with her seed and shooting it onto the sheets in front of her}. <i>“Ssssssshhhhhhhh,”</i> she winces, followed by a weird, high-pitched moan she’s never made before.");

output("\n\nShe asked you to ‘give her cum,’ and the feel of her sleeping body being wracked with pleasure against you is enough to close the gap you didn’t think you could close: nestling yourself as deep as you’re comfortable with, you tense yourself, and you feel your [pc.cumNoun] pump into her body.");

output("\n\nIt takes a surprising amount of willpower to not just hilt yourself and seed her like you want her pregnant: you stay where you are, only half-buried into her gushing gash, responding to her orgasm with your own and giving her the cum she asked for. Without you being deep inside her, it inevitably {cum quantity < 500:dribbles back out against you, seeping into the fur of her leg and out onto the sheet of the bed}{cum quantity >= 500:sprays back against you; you don’t have the stability to contain your wildly-orgasming cock, and you leave more than a few shots against her bare ass}.");

output("\n\n// Continue here if the PC does not have a dick");

output("\n\nPenny would want you to enjoy yourself. She agreed to join you in bed, understanding that it might take a turn for the sexy. And, as an added bonus, maybe her dreams would get a little saucy, too.");

output("\n\nIt’s awkward, though: it’s not like you have a dick to properly fuck her with, and if you’re going to be making love to her while she’s asleep, you want it to be good for her, too. So, you finagle yourself into a peculiar, and somewhat graceless, position: your [pc.legsOrLegs] {is/are} already entwined with hers, so you slide your [pc.hips] forward and lift at the knee, until the fat of your thigh is pressed gently against Penny’s quim{Penny is a herm:, lifting her fuzzy nuts out of the way carefully}. Simultaneously, you gently guide her tail downward, and you slip it and its fluff between your own, right up against your crotch.");

output("\n\nPenny hums and shifts in her sleep a bit; she buries her face into her pillow, and moves her right hand to lie against her leg. Her lower body sidles a bit to get into a more comfortable position, which, notably, tucks your [pc.leg] more snuggly against her cooch. You haven’t even started yet, and she’s already trying to make the most out of it for herself.");

output("\n\nYou have to be gentle: you don’t want to wake her, but you still have to be thorough enough that it gives her a damn good dream, and that she wakes up to a hell of a ‘good morning.’ You experimentally shuffle forward, dragging your leg through the valley of her clenched thighs and against her dampening pussy, while, at the same time, dragging her fluffy, cushiony tail against your own.");

output("\n\n<i>“Mmm,”</i> Penny moans out, and her body reacts on its own, bucking backwards against you, trying to take more of some phantom cock into itself. Your sentiments exactly: it’s not the most hardcore tribbing you’ve ever done, but hell, it feels great, so you’re not about to stop. And if it feels great for you, it must feel great for her. You’re determined to make it better.");

output("\n\nYou reach over her with your right hand, gently palming at her ribs just beneath her breasts. You rub her stomach in slow, sensual circles, making your way down, towards her crotch. When you get there, you {Penny is vanilla:align your fingers against her clit, pressing into her button. Whenever you grind yourself forward, you pull at her, lifting it up and towards her stomach, and when you recede, you push down on it, guiding it with you and your movements}{Penny is a herm:gently tickle and press at her flaccid-but-bulging sheathe; you experimentally circle your fingers around the fat pocket, squishing it into your palm and tugging it forward when you grind into her. Your every motion gets her cock just a little stiffer, a little thicker, and her head eventually begins to poke out, waking up long before Penny does}.");

output("\n\nThat’s what your sex is: every time you move your [pc.hips], you ride your [pc.vagina] along the thick downy fur of Penny’s bushy tail, feeling her every individual hair tickle at your sensitive folds. And every time you move, your hand glides along with you, {Penny is vanilla:stimulating her throbbing little clit}{Penny is a herm:jerking her cock and getting it longer, fatter, and hornier}.");

output("\n\n<i>“Mmmm, ffffffffuck yeeeaaahhh,”</i> Penny slurs, taking a deep breath through her nose. Her head moves along her pillow, back and forth, suddenly having a hard time getting comfortable. <i>“Fuck that... mouth of yours, [pc.name]....”</i>");

output("\n\nFrom the sounds of it, she’s dreaming about you going down on her. You almost wish you could – it’d certainly be less awkward than the mess of legs and limbs you’ve got going on right now, but, all the same, your efforts are working fairly well for you both. It’s not the hardest, fastest orgasm you’re ever going to get, but it’s coming along nicely, and the tradeoff of giving Penny a sex dream about you is all the more empowering.");

output("\n\nYou lean forward, and you start to kiss at her neck and her cheek, leaving little love-marks against her fur while you have your way with her. Her body responds, relaxing her head and giving you easier access to her neck for you to kiss.");

output("\n\nThe build-up is slow, but it’s thorough and fulfilling; you don’t need to fuck her like you’re both some horny beasts, and having her body against yours, her tail stimulating you the way it is, is actually a nice break from the rampant, demanding sex that Penny is often capable of. It’s nice to just lay in the comfort of your bed and have some slow, sensual sex with your lover. You’ll make a note to pitch the idea of taking it slowly to her when she wakes up.");

output("\n\n<i>“Gonna,”</i> she whimpers suddenly, and her hips buck on their own against you, pressing into your [pc.leg] more urgently. <i>“The thinggggg... it’s gonna come, an’....”</i> Penny raspberries her lips in her sleepy, pre-orgasmic stupor. <i>“Fuckin’... big one....”</i>");

output("\n\nFrom the sounds of things, she’s getting awfully close – then, after another few grinds and pushes, with your [pc.vagina] riding along the furry length of her now-damp tail, and her own moist cunt gliding against your thigh, she cums, her body shaking and becoming tense, her pussy gushing its payload along the meat of your [pc.leg], {Penny is vanilla:and every time you rock her clit from one side to the other, she gushes a second time, soaking your [pc.skinFurScales] and dribbling it down into the sheets of your bed}{Penny is a herm:and every time you jerk her erect, stiff cock in time with your pseudo-fucking her pussy, she shoots a shot of her foxy cum into your palm; what you aren’t dexterous enough to catch, sprays onto the cloth of your bed}. <i>“Fffffffff,”</i> she winces through clenched teeth, her breathing coming raggedly through her nose all the while.");

output("\n\nYou weren’t too far behind her, and you orgasm right alongside her: feeling her body tense and quake in pleasure brings you over your own edge, and you reflexively clamp your [pc.thighs] down onto Penny’s tail, your [pc.vagina] gushing your [pc.girlCum] along its fluffy, furry length. In some part of your head, you hope you aren’t clenching down on her too hard, but the rest of your head is too preoccupied with the fact that you’re cumming. You feel your juices leak and dribble down your leg, as far down as your knees, before finally dripping onto the sheets as well.");

output("\n\n[=Next=]");
output("\n\n// end scene (scene: Somnophiliacs Rejoice); reduce Lust to 0; go to (scene: Fucked Penny)");

output("\n\n[=Dream On=]");
output("\n\n// (scene: Sleeping Beauty)");

output("\n\nWhatever, you sure it isn’t important.");

output("\n\nPenny pushes into you, a little more forcefully, and you stumble forward. You put your hands on the bed for stability, and you let Penny have her way with you: her breathing grows more excited – not quite haggard or exhausted, not yet, but she’s on her way. {Vanilla:Every time she grinds herself forward, she draws her pussy what feels like all the way up to your hip, before sliding it back down, and you can feel every nerve she bathes in her pussy’s heat on the way.}{Herm:She isn’t quite erect, but she’s hard and stiff enough to start properly penetrating you: she’s ginger and hesitant, like you’re made of glass and you’ll shatter if she pushes into you just a little too hard, but your body unmistakably bends and succumbs to her advances, and her {penny.cock} embeds itself into your [pc.vagOrAss].}");

output("\n\nIt feels different, somehow; this is hardly the first time you’ve fucked{Vanilla: – although, she’s taking a rather... unique approach to it this time} – but every sensation feels <i>off,</i> in some perturbing way. It’s too warm for the season; you can picture Penny like she’s right in front of you, but you can’t <i>see</i> her; the feel of her body {against/inside} yours is far more electric than usual (not that you’re complaining). You can’t help but thrust yourself back against her, giving her more of your body for her to use as she likes. Your movements feel sluggish, heavy, and labored, like something other than Penny is weighing you down, but you want her to hump you, damn it, and your body will obey.");

output("\n\nThe motion seems to catch her off-guard, and she hesitates, but she continues after a moment, at the same relaxed-but-persistent pace as before. You can feel {Vanilla:every cell of your [pc.leg] that her pussy touches get hot and wet, and you can feel it build and build with her every hump; it turns your leg itself into an impromptu erogenous zone, and, knowing that she’s getting so much pleasure from the act of humping your leg like some kind of mutt serves to turn you on just as much}{Herm:every inch, vein, and contour of her {penny.cock} slide itself into your [pc.vagOrAss]; she goes for only an inch, give or take, then stops and pumps only that deep for a thrust or two, then proceeds and pushes herself in deeper. To you, every inch feels like a tree log, and your body is limitless in its capacity; you are capable of taking her <i>every</i> inch, and you want them <i>all</i>}.");

output("\n\nAnd, of course, her hand doesn’t stop working you over itself: {PC has a cock:every time she humps her hips against yours, her hand travels the entire length of your [pc.cock], stroking it to its full mast. Your dick feels immeasurably larger somehow – either that, or her fingers have a way of making you feel like every stroke, from your [pc.base] to your [pc.cockHead], takes a pleasurable eternity. Either way, you’re hard as metal, and you’d fuck her hand if moving your body wasn’t so weirdly difficult}{else:she shuffles her fingers, introducing her third finger to the party, and resumes her earlier heavy, wet petting, stroking your vulva with her first and third, and teasing your [pc.clit] with her middle. You beg her to fingerfuck you, but then you remember that your [pc.vagina] is stuffed with her cock, and you’re pretty sure your words came out like a drunken, swollen slur anyway. Either way, you’re wet as a lake, and you’d hump her hand if moving your body wasn’t so weirdly difficult}.");

output("\n\nAnd that’s what your life is, for the next for minutes – or for the next thousand years, given how specifically you can feel everything. Time feels like it hasn’t really moved since you two started. But, hey, you’d be okay with standing there, with Penny {Vanilla:humping your leg}{Herm:unendingly introducing herself into your body, with inches turning to miles,} and her hand constantly {jerking your cock/fingering your cunt} the whole time through. Frankly, it feels like you could do this forever.");

output("\n\n{Vanilla:Penny moans herself, her motions getting harsher and more ragged over time. What feels like a rash starts to form from the constant scrubbing of her pussy against your [pc.leg], but you don’t care. Penny moans your name, and then says a few words – or just one really long one, you couldn’t really tell. Even in your fuzzy, unclear state, it’s easy to tell that she’s getting pretty close, and you tell her that you want it: you love her, and you want her to cum from humping your leg. At least, you’re <i>pretty</i> sure you said that. You might have slurred a word or two, but the message should be clear.}");

output("\n\n{Herm:Eventually, though, {dogcock:you feel a larger, fatter obstruction press into your [pc.vagOrAss]. It’s her knot. Though your body is starting to feel a little full from the heft of her cock, you maintain that, given how fuzzy you feel, you could take more of herself into you, and you tell her as much: you glance over your shoulder (or, at least, you try to do that) and you beg her to knot you (or, at least, you think you said that). Penny pauses, and then starts again, at a more demanding pace than before, her meaty knot battering into you, just as you wanted. She’ll pop into you soon, and you can hardly wait}{horsecock:you feel her hips clap against your own; she’s bottomed out inside you, and you’ve taken everything she has into your body. Though your body is starting to feel the strain from containing such a monumental amount of horsecock-on-a-vixen, you nonetheless maintain that you could take a cock two or three times larger. You’re not sure where this is coming from – maybe it’s because she went so slowly, or maybe the fuzziness pervading your body has something to do with it – but, that’s how you feel, and you tell her as much}.}");

output("\n\nYour encouragement has a positive effect (or, you like to think), and, with just a few more haggard thrusts of her body against yours, {Vanilla:her thighs clamp down on your own, and you feel what must be an absolute <i>ocean</i> of fennec fox girlcum just <i>wash</i> down your [pc.leg]. Penny huffs and snorts in your ear from the exertion, her whole body quaking in pleasure as she absolutely inundates your lower body with her juice. You must be sexier than you thought!}{Herm:she thrusts a few more times, then{dogcock:, with one last, elongated push, ties herself to you, just like you wanted}{horsecock:hilts herself at last, letting your body surround hers completely}. She tenses, sighs, and shakes, as her {penny.cock} unloads what feels like whole <i>pools</i> of fennec fox cum into your [pc.vagOrAss]. She pumps and pumps, filling what little parts of your body that she couldn’t with her cock, with her seed. Throughout it all, you can only think to yourself that, surely, you must have room to spare in there, still.}");

output("\n\nAt the feel of her succumbing to her body’s needs, you can’t help but submit to your own. Her hand goes still in her orgasm, but you do not: {PC has a cock:your own [pc.cock] bloats with your [pc.cum], spraying from you in either dozens of waves, or one single long one, it’s difficult to say in your haze. She doesn’t so much jerk you off as you do fuck her hand, with some difficulty, given how heavy your body feels, but even the smallest bit of pleasure rocks you like a bombshell every time}{else:your [pc.vagina] spasms, clenching and spraying your [pc.girlCum] {onto the creaky floorboards beneath you}{all over Penny’s invading cock, bathing it in yourself}. You experience orgasm after orgasm after orgasm – or maybe just one single, long orgasm that lasts a lifetime, it’s difficult to say in your haze. Your [pc.hips] jerk back and forth impotently, eking out whatever pleasure they can from any angle; every time you move just a little, Penny’s inert middle finger brushes against your [pc.clit], and another bomb goes off in your pussy}.");

output("\n\n[=Next=]");
output("\n\n// end scene (scene: Sleeping Beauty); reduce Lust to 0; go to (scene: Fucked By Penny)");

output("\n\n// (scene: Fucked Penny)");

output("\n\nPenny stirs, and lifts her head from the pillow. Frankly, you’d be surprised if <i>anyone</i> could truly stay asleep through something like that.");

output("\n\n<i>“Mmmm, fuck,”</i> Penny says, moving her jaw and chewing at nothing. You don’t move – not because you’re worried you might give yourself away, since she’s going to figure it out in a few moments if she hadn’t already, but because, well, you’re comfortable where you are. You just busted a good {girl-}nut, and you’re still enjoying your own afterglow.");

output("\n\nPenny twists her upper body to face you. Her vision is having trouble focusing on you; her eyes dart around the room, before settling on yours. <i>“[pc.name],”</i> she says sensually, her lips still cottony and her speech still slurred. <i>“I just had the most</i> amaaaaaaaaaazing <i>dream....”</i>");

output("\n\nYou ask her to tell you about it.");

output("\n\n<i>“Mmmm, well,”</i> she says, twisting her head back around and lowering it back onto the pillow. She wiggles her hips against you, pressing her beautiful ass up against your pelvis. Her tail swishes from side to side accusatorily. <i>“Long story short, I dreamt that I got fucked real good.”</i> You say nothing as she giggles to herself. <i>“Any idea what could have given me a dream like that?”</i>");

output("\n\n{Nice:You’re too embarrassed to say anything in your defense. Penny, without looking at you, picks up on that. <i>“Don’t be shy, [pc.name]. I got naked and jumped into your bed with you. Go ahead and,”</i> she says, wiggling her ass on you once more, <i>“have a little fun.”</i>}{Else:Hell, you’re caught; might as well own up to it. You tell her it’s because you helped yourself while she was asleep. <i>“Mmph, am I glad you did,”</i> she sighs, wiggling her ass on you once more. <i>“I feel great. And that was one of my kinkiest dreams ever. Go ahead and do it again if you get the chance.”</i>}");

output("\n\nWith that said, Penny takes a deep breath through her nose, and then, with a surprising amount of pep, throws the bedsheets off you both, and springs to her feet. <i>“Damn, do I ever feel like a million credits!”</i> she says, immediately launching into her morning-routine stretches: first, both arms over her head, then one after the other across her chest. <i>“That was one hell of a ‘good morning’ to wake up to, cap’n. I should see if I can’t return the favor tomorrow or something!”</i>");

output("\n\nShe spins around, facing you, and puts her left leg on the bed, stretching it. You’re given a full-on view of her {Vanilla:puffy-but-satisfied pussy, throbbing gently between her legs, and looking like it wouldn’t mind a round two}{Herm:cock, exposed but receding into her sheathe, a clear drop of her cum dangling from her tip. You’re sure it wouldn’t be hard to coerce her into a second round}.");

output("\n\n<i>“I’d offer to repay the favor right now, actually,”</i> she says, noticing your stare. As she drops her leg and lifts the other, she thrusts her pelvis towards you, {Vanilla:flaunting her pussy for you to gawk at}{Herm:flapping her half-hard cock towards you, flinging the drop of cum in your direction}. <i>“But, my time in the academy, and my time working on Mhen’ga, has really hammered some habits into me. If I don’t at least make the effort to clock in, I’ll feel like a useless asshole all day.”</i>");

output("\n\nWhen she’s done, she picks up her pillow and makes for the door to your quarters, a particular bounce in her step the whole way. <i>“But, if you don’t think you can wait until tomorrow morning,”</i> she says, her tail swishing in a lazy, inviting circle, <i>“you know where I’ll be.”</i> And with that, she disappears into the halls of the ship, as naked as when she entered your quarters.");

output("\n\nYou’re alone in your bed. There’s nothing left for you here: you follow Penny’s example, and you get out of bed. {PC is naked:And, following her example further, you step into the halls of your ship, completely nude.}{Else:You appropriate your [pc.gear] until you’re as equipped as you were, and you step out into the halls of your ship.");

output("\n\nAfter all that, you’re ready to take on the next day of your adventure.");

output("\n\n// end scene (scene: Fucked Penny); return the PC to the ship’s main menu; increase Lust by 10; advance clock by eight hours");

output("\n\n// (scene: Fucked By Penny)");

output("\n\nYou stir, running your hand over the fabric of your sheets. You feel kind of sore, especially around your [pc.vagOrAss], but other than that... you actually feel <i>amazing.</i>");

output("\n\nYou hear Penny gasp in surprise as you lift your head, and she says nothing when you glance over your shoulder towards her. She’s clamped tightly to your body, holding you close to hers{Herm:, and, from the feel of things, she hasn’t totally vacated your [pc.vagOrAss] just yet}. You have a hard time focusing on her at first, and your vision is attracted to other things in the room before finally settling on her.");

output("\n\nFrom the way her heart is hammering into your back, and from the way {Vanilla:her thighs are still wetly clamped to your [pc.leg],}{Herm:her {penny.cock} is still lodged inside you – but softening quickly –} even your sleepy, hazy mind could put two and two together. Still, you humor her, and, instead of chastising her, you tell her that you had the most <i>wonderful</i> dream.");

output("\n\n<i>“Oh yeah?”</i> Penny asks nonchalantly. You tell her that she was in it. <i>“That’s, uh, sweet of you to say. It’s nice to know that you’re keeping me in your dreams.”</i> She pauses awkwardly for a bit before her curiosity gets the better of her: <i>“What, uh... what was it about?”</i>");

output("\n\n{Nice:You tell her that you dreamt you and she had built a cozy little hideaway in the middle of the woods. It wasn’t very big, and it didn’t have a lot in it, but you had each other. And you celebrated having built the cottage by making love.}{Else:You tell her, straight and honestly, that you two fucked. Or, more specifically, <i>she</i> fucked <i>you.</i> It was pretty intense, actually.}");

output("\n\nYou wiggle your [pc.ass] towards her, feeling how {Vanilla:rough and beaten up your [pc.leg] feels from Penny humping it}{Herm:sore you are, in all the right ways, from having her cock pounding into you}. <i>“Uh,”</i> she laughs, knowing she’s caught, <i>“I guess I wasn’t as discrete as I thought.”</i>");

output("\n\nYou tell her not to worry; you doubt anyone could have slept through that without figuring it out eventually. {Nice:And besides, you invited her into your bed. She’s your lover. You trust her, and you don’t mind if she enjoys herself a little when you’re not wholly available to entertain her yourself.}{Else:And besides, you wouldn’t have invited her into your bed if you didn’t expect to have a little bit of fun. The next time she gets a little horny, she has your permission to do what she needs to blow off some steam.}");

output("\n\nPenny smirks, then leans into you, kissing you on the cheek lovingly. <i>“That’s my mate,”</i> she whispers, then nuzzles her cheek lovingly against yours.");

output("\n\nWith that said, Penny takes a deep breath through her nose, and then, with a surprising amount of pep, throws the bedsheets off you both, and springs to her feet. <i>“Damn, do I ever feel like a million credits!”</i> she says, immediately launching into her morning-routine stretches: first, both arms over her head, then one after the other across her chest. <i>“That was one hell of a ‘good morning’ to wake up to, cap’n. You should give it a try yourself sometime!”</i>");

output("\n\nShe spins around, facing you, and puts her left leg on the bed, stretching it. You’re given a full-on view of her {Vanilla:puffy-but-satisfied pussy, throbbing gently between her legs, and looking like it wouldn’t mind a round two}{Herm:cock, exposed but receding into her sheathe, a clear drop of her cum dangling from her tip. You’re sure it wouldn’t be hard to coerce her into a second round}.");

output("\n\n<i>“I’d offer to go another round right now, actually,”</i> she says, noticing your stare. As she drops her leg and lifts the other, she thrusts her pelvis towards you, {Vanilla:flaunting her pussy for you to gawk at}{Herm:flapping her half-hard cock towards you, flinging the drop of cum in your direction}. <i>“But, my time in the academy, and my time working on Mhen’ga, has really hammered some habits into me. If I don’t at least make the effort to clock in, I’ll feel like a useless asshole all day.”</i>");

output("\n\nWhen she’s done, she picks up her pillow and makes for the door to your quarters, a particular bounce in her step the whole way. <i>“But, if you don’t think you can wait until tomorrow morning,”</i> she says, her tail swishing in a lazy, inviting circle, <i>“you know where I’ll be.”</i> And with that, she disappears into the halls of the ship, as naked as when she entered your quarters.");

output("\n\nYou’re alone in your bed. There’s nothing left for you here: you follow Penny’s example, and you get out of bed. {PC is naked:And, following her example further, you step into the halls of your ship, completely nude.}{Else:You appropriate your [pc.gear] until you’re as equipped as you were, and you step out into the halls of your ship.");

output("\n\nAfter all that, you’re ready to take on the next day of your adventure.");

output("\n\n// end scene (scene: Fucked By Penny); return the PC to the ship’s main menu; increase Lust by 10; advance clock by eight hours");
*/