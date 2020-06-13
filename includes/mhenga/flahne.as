/*Notes:
G-cup for great! Nipples are extra soft and squishy.
16” ovipositor grows out of her clit.
Flahne eats so many sugary snacks that her fluids are sweet in flavor, which often leads to her consuming the sexual excess from her ovipositor numerous times a day, in turn causing her to retain a larger size than would otherwise be normal for her race.
The above has caused her to be much more... soft and squishy than normal.
A touch obsessed with her ovipositor.
Honey-colored body/skin/hair.
Hair is just past shoulder length and appears to have a bun on top.
Pointed floppy ears.
NO BELLY BUTTON!*/

// Flags:
// FLAHNE_DESK_DISABLED      		: TODO - FIXME
// FLAHNE_LIKE_OVIPOSITOR    		: TODO - FIXME
// FLAHNE_PISSED            		: TODO - FIXME
// FLAHNE_SEXED             		: TODO - FIXME
// MET_FLAHNE                		: TODO - FIXME
// TALKED_ABOUT_FLAHNES_RACE 		: TODO - FIXME
// FLAHNE_TALKED_ABOUT_CUMSLUTPENNY : Player has seen the one-off scene about Flahne discussing pennys cumsluttery
// 

public function flahneNameDisplay():void
{
	if(flags["MET_FLAHNE"] == undefined) showName("GEL\nWOMAN");
	else showName("\nFLAHNE");
}
public function showFlahne(nude:Boolean = false):void
{
	flahneNameDisplay();
	showBust(flahneBustDisplay(nude));
}
public function flahneBustDisplay(nude:Boolean = false):String
{
	var str:String = "FLAHNE";
	
	if(nude)
	{
		if(flags["FLAHNE_LIKE_OVIPOSITOR"] > 0) str += "_OVI";
		str += "_NUDE";
	}
	return str;
}

public function flahneFuckCounter(arg:int = 0):Number {
	if(flags["FLAHNE_SEXED"] == undefined) flags["FLAHNE_SEXED"] = 0;
	if(arg != 0) flags["FLAHNE_SEXED"] += arg;
	return flags["FLAHNE_SEXED"];
}

public function flahneDickOut():Boolean {
	if(flags["FLAHNE_LIKE_OVIPOSITOR"] > 0) return true;
	return false;
}

//Meeting Her:
public function flahneInOffice():Boolean {
	if(hungryFlahneWithBimboPenny()) return false;
	return true;
}
public function meetingFlahne(outputT:Boolean = true):Boolean {
	CodexManager.unlockEntry("Rahn");
	trace("FLAHNE OVI STATUS: " + flags["FLAHNE_LIKE_OVIPOSITOR"]);
	if(flags["FLAHNE_LIKE_OVIPOSITOR"] < 1) trace("NO DICK OUT");
	else if(flags["FLAHNE_LIKE_OVIPOSITOR"] > 0) trace("DICK OUT");
	else trace("NEITHER DICK OPTION");
	
	if(flags["MET_FLAHNE"] == undefined)
	{
		showFlahne();
		flags["MET_FLAHNE"] = 1;
		output("\n\nSome kind of amber, gel-like material in the shape of a woman is sitting behind the desk, fiddling with paperwork. Upon seeing you, she withdraws the remains of a sucker from her mouth, tosses it in a waste bin full of similar candied sticks, and says, <i>“Hi there! I just need you to fill out some paperwork about your business on planet!”</i>");
		output("\n\nA rickety-looking chair is the only available seating, ");
		if(!pc.isTaur()) output("so you sit down on it as gingerly as possible");
		else output("so you swat it aside and try to remain comfortable standing");
		output(". The gel-woman extends her hand in greeting, and you take it, introducing yourself.");
		output("\n\nShe smiles back, <i>“Call me Flahne. I’m the official U.G.C. contact here in Esbeth and on Mhen’ga as a whole. It’s a thankless job, but somebody has to keep all the paperwork straight until we can smooth over relations with the natives and get a real civilization going here.”</i>");
		output("\n\nYou spend much of the time marvelling at the gelatinous woman’s appearance. Her hair is the same honeyed color as the rest of her, and it isn’t even real hair - just transparent, amber gel done up in a stylish bun that perches atop shoulder-length tresses. Two long ears protrude from the sides of her head, each about as wide as her face and narrowing to points at the tips. Her eyes are a stunning, mischievous violet. One glaring absence is the lack of a nose under them; she has no olfactory organ whatsoever, unless it is hidden elsewhere on her person. The pouting lips help to draw your eye away, and you can’t help but glance lower into the barely-concealed cleavage her half-buttoned top is struggling to contain. The elastic white fabric just doesn’t seem up to containing what must be G-cups.");
		output("\n\n<i>“Ahem.”</i> Flahne clears her throat with a twinkle in her eyes. <i>“These are pretty standard forms. You can fill them out on the workstation over there or your computing device of choice.”</i>");
		output("\n\nYou nod and produce your codex, busily filling out forms as Flahne makes small talk. Seeing the odd looks you give her, she explains that she is a rahn, specifically a loo’rahn, as determined by her coloration. Numerous interruptions dot the conversation as she consumes stick after stick of candy, sucking long and hard on each and then resuming her instructions as if she had never paused at all. Flahne apparently has a monstrous sweet tooth.");
		output("\n\n<i>“Once you’ve finished up, just go ahead and transfer the files over,”</i> the gracious, soft-looking secretary bubbles. At that, you realize that you are finished and press the send button; the codex actually has tactile screen deformation to give the buttons an edge you can feel, not at all like those cheap touchscreens you find everywhere for a few credits. <i>“Oh, absolutely perfect! You’ve got a head for this stuff, sugar.”</i> She chews on the candy as she looks over the forms, and a long prehensile tongue dangles out of her mouth, curling around the stick to hold it while she types away at an ancient-looking keyboard.");
		output("\n\nFlahne’s computer chimes merrily, and she announces, <i>“All done! Now, since you’re such a cutie, I’d like to tell you to watch out if you go outside of town. A fair portion of the natives here are aggressive and more than a little sexually active... if you catch my meaning. I’d hate to see someone as " + pc.mfn("handsome","pretty","unique") + " as you go out and get accosted by those devilish zil!”</i> she shudders. <i>“Besides, if you’re going to have a little fun with anyone, it ought to be someone nice and soft.”</i>");
		output("\n\n<b>Your codex quietly displays a message that the available information on the rahn race has been aggregated.</b>");
		//Pass 10 minutes.
		//Room options without description.
		processTime(10);
		flahneMenu();
		return true;
	}
	else if(flags["SEEN_BIMBO_PENNY"] != undefined)
	{
		//Flahne busy with Penny IF TIME IS BETWEEN 0800 AND 1700
		if(flahneInOffice())
		{
			showBust(flahneBustDisplay(false));
			output("\n\nFlahne is at her desk, but although her figure looks a little curvier and her flesh a little lighter than normal, she looks surprisingly normal given her activities with Penny. She must be putting all that mass somewhere,");
			//IF PC HAS TALKED TO FLAHNE ABOUT HER OVIPOSITOR
			if(flags["FLAHNE_LIKE_OVIPOSITOR"] != undefined) output(" so you have to assume there’s some massive pile of eggs hidden somewhere nearby.");
			else output(" but you have no idea where.");
			
			addButton(0, "Flahne", flahneApproach);
		}
		//IF TIME IS BETWEEN 1701 AND 0759
		else
		{
			//showName("\nROBOT");
			showBust("ESBETH_DROID");
			output("\n\nThere’s another sign on the desk that says simple ‘Out - Be Back At 08:00.’ Standing next to the desk is what appears to be a very simple droid, doing its best to handle the customs process in Flahne’s absence. Thankfully you don’t have to deal with it yourself as you’ve already come through officially, so you walk right past the small crowd of annoyed-looking travelers.");
			//[Remove ‘TALK’ and ‘SEX OPTIONS’ buttons when Flahne is not present]
			addDisabledButton(0,"Robot");
		}
	}
	else if(flags["FLAHNE_PISSED"] > 0 || pc.hasStatusEffect("Flahne_Extra_Pissed"))
	{
		showBust(flahneBustDisplay(false));
		output("\n\nFlahne doesn’t look like she wants anything to do with you right now.");
		addDisabledButton(0,"Flahne");
	}
	else if(flags["FLAHNE_MAKEUP"] == 1) 
	{
		extranetFlahneConsequencesMakeup();
		return true;
	}
	else if(flags["FLAHNE_EXTRANETTED"] == 1)
	{
		extranetFlahneConsequences();
		return true;
	}
	else if(flags["FLAHNE_GALLINKED"] == 1) 
	{
		galLinkConsequence();
		return true;
	}
	else
	{
		showBust(flahneBustDisplay(false));
		output("\n\nFlahne is at her desk, looking as sweet as ever.");
		addButton(0, "Flahne", flahneApproach);
	}
	
	vendingMachineButton(1, "J'ejune");
	return false;
}
public function flahneApproach():void
{
	clearOutput();
	showFlahne();
	
	// Penny stuff
	if(flags["SEEN_BIMBO_PENNY"] != undefined)
	{
		output("Flahne unbuttons part of her top as you approach, licking her lips lewdly. <i>“I’m not sure I could thank you enough for your work with Penny, but I’m willing to try if you are.”</i> Pouting, she offers a little less excitedly, <i>“Or did you just want to talk?”</i>");
		output("\n\nWhat did you want with Flahne?");
	}
	else if (flags["FLAHNE_TALKED_ABOUT_CUMSLUTPENNY"] == undefined && pennyIsCumSlut())
	{
		flahneTalksAboutCumslutPenny();
		return;
	}
	//Repeat Flahn Approaches
	//Haven’t fucked her
	else if(flags["FLAHNE_SEXED"] == undefined)
	{
		output("Flahne looks up at you with a smile on her juicy, amber lips. <i>“Well, what can I do for you today, " + pc.mf("Mister","Miss") + " Steele?”</i> Her big, bouncy breasts are straining her top as hard as ever, though the way she has almost half the buttons undone isn’t helping.");
		output("\n\nWhat do you do with the curvy rahn secretary?");
	}
	//Fucked her
	else if(flags["FLAHNE_LIKE_OVIPOSITOR"] != 1)
	{
		output("Flahne’s honey-colored skin blushes orange at your approach, and she asks, <i>“Hey there cutie, come back for a little more sugar? I could use a snack.”</i> Her tongue snakes out to lick her lips before curling around her sucker and slowly pumping it in and out of her mouth. She leans down over her desk, pressing her big, soft breasts against the table so that they strain at the side seams of her shirt. <i>“Or did you just want a peep?”</i>");
		output("\n\nThe curvy rahn seems happy with either option, though you could probably just talk too. What did you want to do with Flahne?");
	}
	//Fucked her and like the ovipositor
	else {
		output("Flahne’s honey-colored skin blushes orange at your approach, though a big smile spreads across her plump lips. She gives a little shiver and sighs with slow relief as an oblong distention lifts her skirt higher and higher. Flahne coos, <i>“Guess who’s happy to see you?”</i> She unbuttons part of her top while licking a lollipop rather lewdly. <i>“So, wanna have some more fun?”</i> Pouting, she offers a little less excitedly, <i>“Or did you just want to talk?”</i>");
	}
	flahneMenu();
}
public function flahneMenu():void
{
	clearMenu();
	
	addButton(0,"Talk",talkToFlahne);
	if(pc.lust() >= 33) addButton(1,"Sex Options",flahneSexMenu);
	else {
		output(" You aren’t aroused enough for sex with her right now.");
		addDisabledButton(1,"Sex Options");
	}
	if(hasACumBubble()) addButton(2,"Cum Bubble",giveFlahneATreatSetup,undefined,"Cum Bubble","Give the rahn a gift of sealed cum.");
	else addDisabledButton(2, "Locked", "Locked", "You do not have the item required for this scene. Purchasing a Bubble Buddy may be a good place to start...");
	
	addButton(14, "Back", mainGameMenu);
}

//Talk to Flahne
public function talkToFlahne():void {
	clearOutput();
	showFlahne();
	output("Flahne ");
	if(flags["FLAHNE_SEXED"] > 0) {
		output("seems a little saddened that you aren’t interested in debauchery at the moment, but she closes one of her buttons");
		if(flags["FLAHNE_LIKE_OVIPOSITOR"] > 0) output(" and tries to ignore the bulge in her skirt");
		output(" for you");
	}
	else output("seems genuinely excited to talk to you again");
	output(". <i>“So, what did you want to talk about, " + pc.mf("Mister","Miss") + " Steele? God, I love that name. It sounds so... firm.”</i> She blushes and continues, <i>“Sorry, maybe I ought to stick to calling you cutie, since you are... what did you want to talk about?”</i>");
	processTime(1);
	talkToFlahneMenu();
}
public function talkToFlahneMenu():void {
	clearMenu();
	addButton(0,"Her Race",talkToFlahneAboutHerRace);
	if(flags["TALKED_ABOUT_FLAHNES_RACE"] == 1) addButton(1,"Her Subrace",flahnesSubRace);
	if(flags["FLAHNE_LIKE_OVIPOSITOR"] != undefined) addButton(2,"Ovipositor",flahnesOvipositor);
	addButton(3,"The Locals",theLocals);
	// Thare Plantation Quest
	if(CodexManager.entryUnlocked("Zil") && flags["THARE_MANOR_ENTERED"] != undefined && flags["PQ_FLAHNE_TALKED"] == undefined)
	{
		if(flags["PQ_RESOLUTION"] == 1 && flags["PQ_PEACE_TIMESTAMP"] + 24*60 < GetGameTimestamp()) addButton(4,"Zil?",flahnePostPQZilTalk,undefined,"Zil?","Ask if she’s talked to Quinn’s people yet.");
		else if(flags["PQ_RESOLUTION"] == 1) addDisabledButton(4,"Zil?","Zil?","Give the Zil some time to meet the citizens of Esbeth before talking to them!");
		else if(flags["PQ_RESOLUTION"] != undefined) addDisabledButton(4,"Zil?","Zil?","There is no peace with the Zil, and nothing to talk about.");
		else if(pc.level < 6) addDisabledButton(4,"Zil?","Zil?","Something else has to happen for this... something that you probably ought to be level six for.");
		else addDisabledButton(4,"Zil?","Zil?","Relations will the zil would need to be more peaceful for this. Perhaps something involving Thare Plantation...");
	}
	addButton(14,"Back",flahneMenu);
}

//[Zil?]
public function flahnePostPQZilTalk():void
{
	clearOutput();
	showFlahne();
	output("You ask if any zil have been in town recently.");
	output("\n\n<i>“Yes!”</i> she squeaks, long ears perking up. <i>“This... I suppose </i>delegation<i> is the only way to describe them, really. " + (pennyIsCrew() ? "A Peacekeeper officer" : "Officer Penny") + " brought them up here, and once we got the air conditioning on full blast, we had a long talk with them. How did you know about that, [pc.name]?”</i>");
	output("\n\nYou briefly describe your confrontation with Quinn’s tribe, how you talked them out of terrorizing Thare Plantation and persuaded them to talk to the people of Esbeth instead. ");
	if(pc.isBimbo()) output("Your account is heavy on the <i>smell</i> and the <i>cuteness</i> of zil boys and oh Void you just wanna eat them up, though that doesn’t seem to turn Flahne off much.");
	else if(pc.isBro()) output("Your account is heavy on how superfine the zil honeys were and just how many of them you laid, though that doesn’t seem to turn Flahne off much.");
	else if(pc.isNice()) output("You stoically play down your own heroism - not that that dissuades Flahne much.");
	else if(pc.isMischievous()) output("Your account is heavy on the razor-like wit you used to completely destroy RK Lah.");
	else output("You briskly present the story as simple cause and effect; you saw what had to be done, and so did it.");
	output("\n\n<i>“So we have </i>you<i> to thank for this!”</i> she exclaims, eyes wide. <i>“You made something really remarkable happen, [pc.name]. No natives have ever approached us like that before - making understandable demands, offering peaceful trade and stuff. It’s the first step in the uplifting process we U.G.C. first contact reps are supposed to look out for, and I’m sooooo pleased the zil cuties have taken it!”</i>");
	output("\n\nYou ask whether these understandable demands of theirs are achievable.");
	output("\n\n<i>“Maybe,”</i> sighs Flahne, expression turning significantly gloomier. <i>“</i>Very<i> maybe. It seems likely that Snugglé will want to expand their operation here, and once they do that, a full scale agri-forming won’t be far behind. If the colonists are overwhelmingly against that - as well as the natives - then they might think twice. But being an independent planet is tough, [pc.name]. If they leave then somebody else is likely to step in, and if they don’t then we’re likely to be harassed by pirates and other meanie heads. Couple of years of that, and even the zil might be begging Snugglé to come back.”</i>");
	output("\n\nShe sucks on her current lollipop morosely.");
	output("\n\n<i>“I’ve committed myself to looking at ways of getting Snugglé to pack up and go elsewhere, because I love those snugglebugs so much and want to do right by them, but...”</i> she sighs heavily. <i>“Sometimes I think I’m not cut out for making these kinds of big decisions.”</i>");
	processTime(5);
	flags["PQ_FLAHNE_TALKED"] = 1;
	talkToFlahneMenu();
}

//Her Race
public function talkToFlahneAboutHerRace():void {
	clearOutput();
	showFlahne();
	flags["TALKED_ABOUT_FLAHNES_RACE"] = 1;
	output("Flahne perks up at that. She’s obviously pleased at the chance to talk about her people and launches straight into a little lecture. <i>“Well, it’s understandable that you’d be curious. As I said earlier, I’m a rahn. A lot of people call us gel-girls for, well... obvious reasons.”</i> She pokes at her chest, sinking her finger a few inches into the fluffy boob without issue. When she pulls away, the divot slowly springs back into shape. <i>“Most of us don’t mind. I mean, I used to call humans ‘spinelings’ when I was young and sheltered. Boy, did that ever cause me trouble!”</i> Flahne pops her sucker back in her mouth for a moment and takes a few long licks on it. <i>“Anyway, I know better now. As a matter of fact, I can recite the proper names of most galactic races from memory.”</i> She beams at that.");
	output("\n\nThe curvy secretary pulls the half-dissolved remains of her lollipop out and tosses it aside, unwrapping a fresh one as she gets back on track, <i>“We got discovered in the last planet rush. We were barely tribal back then I’m told, simple predators hunting the smaller beasts of our world.”</i> Flahne makes a mock, scary face at you and growls, a sound that reminds you more of a bubbling brook than a fierce predator.");
	output("\n\nYou " + pc.mf("chuckle while she starts to giggle at that","both break into giggles at that") + ". <i>“It seems so silly in hindsight. Somebody saw some potential in us and helped us adapt to technology instead of living like savages. I wish I knew who, I’d like to give them a big ol’ hug!”</i> Flahne sighs dreamily until you prod her to finish. <i>“Oh, right... so we got full acceptance into the U.G.C. about thirty standard years back, and ever since, we’ve been trying to do right by the galaxy as a whole. Our intelligence is right around the galactic standard, we don’t need much to eat, and we’re pretty darn tough to kill. Not to mention that we’re sociable and less inclined to violence than most carbon-based lifeforms.”</i>");
	output("\n\nFlahne seems very proud of that last statement, even puffing her chest out a bit and straightening her posture, which of course makes her breasts bounce. She even adds, <i>“We’re pretty good about breeding, too. It’s really easy for us to control whether we actually reproduce or not, so overpopulation is something we’ve never had a problem with. Of course, cum is way better-tasting than meat, so we tend to eat that in whatever hole we can get it in now.”</i> Flahne licks her lips without meaning to as her expression saddens. <i>“Some people have started treating us like brainless sluts, just because we prefer our meals to come from our friends and get turned on easily, but unlike other species, getting horny doesn’t impact our cognitive abilities much. If I didn’t care to make my partners squirt out as much yummy jizz as possible, I could probably get a lot of work done at the same time.”</i>");
	//No fucks yet
	if(flags["FLAHNE_SEXED"] == undefined) output("\n\nThe curvy gel-woman smiles a little lewdly at you. <i>“I hope that doesn’t bother you. We rahn aren’t very modest by nature, and sexuality is just another source of pleasure and food for us.”</i> She sucks on her lolly and admits, <i>“I tend to be a rather hungry woman.”</i>");
	//Ovipositor Okay’ed + fucked
	else if(flags["FLAHNE_LIKE_OVIPOSITOR"] > 0) output("\n\nThe curvy gel-woman’s bulge stiffens a little at the thought, and she glances meaningfully down as her skirt begins to stain, radiating the same sweet scents as her lollipops. Flahne eyes you lecherously as she says, <i>“You know that all too well, cutie. Just let me know if you want to have some fun later.”</i>");
	//Fucked her
	else output("\n\nThe curvy gel-woman smiles at you. <i>“You know I’ve always given you my full attention. Let me know if you want to have any fun, by the way.”</i>");
	//If fucked
	if(flags["FLAHNE_SEXED"] > 0 || flags["KIRO_ORGIED"] != undefined) {
		output("\n\nYou ");
		if(pc.isNice()) output("politely ");
		else if(pc.isMischievous()) output("playfully ");
		output("thank her");
		if(pc.isAss()) output(" a little dismissively");
		output(" for the offer, informing her that you want to know more before you get down.");

		//Ovipositor not yet talked about
		if(flags["FLAHNE_LIKE_OVIPOSITOR"] == undefined) {
			output("\n\nFlahne appears very nervous as she goes back into discussing her race’s sexuality, but she pushes ahead regardless, <i>“My favorite part about my race is our... well, ovipositors.”</i> She looks meaningfully at you. <i>“Our dicks, to oversimplify it. Well, not really dicks, but they kind of look like human penises, only we lay eggs through them into our partners when we want to have kids.”</i>");
			output("\n\nYour thoughts are evidently written across your face; Flahne smirks mirthfully at you.");
			output("\n\n<i>“It doesn’t hurt at all! Our outer membranes are very strong but very elastic, allowing us such delightfully stretchiness. We can even slowly reshape our bodies into the shape we wish to have.”</i> The rahn smiles and rushes through the rest, <i>“Most of us only really have them come out when we’ve got fertilized eggs we want to lay in someone, but we can usually control it. Personally, I really like mine and learned how to make it come out even when I’m not ready to lay.”</i> She looks at you meaningfully and follows up, <i>“I can also make it stay in all the time too. It’s just that once it slips out, I can’t really get it to go away without...”</i> She makes an up-and-down stroking motion with her hand.");
			output("\n\n<i>“Would me letting it out bother you?”</i>");
			processTime(10);
			clearMenu();
			addButton(0,"Let It Out",pushDatOvipositorOut);
			addButton(1,"Keep It In",ovipositorInFlahne);
			return;
		}
	}
	processTime(10);
	//clearMenu();
	//addButton(0,"Next",talkToFlahne);
	talkToFlahneMenu();
}
//[Let it Out] [Keep In] Redirects to followups for Ovipositor discussion.
//Ovipositor Out
public function pushDatOvipositorOut():void {
	clearOutput();
	showFlahne();
	flags["FLAHNE_LIKE_OVIPOSITOR"] = 1;
	output("Flahne sighs rather comfortably after noticing that the room is empty and flips back her skirt to show you the big, chubby girl-boner she’s grown. <i>“Our ovipositors are my favorite part about us. I even grew mine to be extra big, so there’d be more to stroke. I guess all the sweets I eat have made it so that my cum and lubricants are as sweet as candy. That’s another good reason for making it big right there.”</i> Flahne traces a finger across the top of it, sighing and shuddering from the pleasure with such enthusiasm that ripples run from her thick thighs all the way to her enormous tits. A dollop of whitish cream forms atop the wobbling prick’s peak, and she scoops it up on her finger, swallowing it before you can react. She smooths her skirt back into place a moment later, accompanied by a full-body orange blush.");
	output("\n\n<i>“Not much more to tell, really. We grow up quick, so if I were to " + pc.rawmf("have you father some children","have you bear my children") + ", they’d be able to care for themselves in short order.”</i> Flahne says with one last smile, <i>“I’m glad you take interest in me for more than just the sex. It’s refreshing.”</i>");
	processTime(1);
	//clearMenu();
	//addButton(0,"Next",talkToFlahne);
	talkToFlahneMenu();
}

//Ovipositor In
public function ovipositorInFlahne():void {
	clearOutput();
	showFlahne();
	flags["FLAHNE_LIKE_OVIPOSITOR"] = 0;
	output("Flahne nervously admits, <i>“Okay... I promise I won’t let it out around you. I wouldn’t want to make you uncomfortable about me, and most rahn can’t even bring them out unless they have eggs ready to lay. I’m still 100% girl!”</i>");
	output("\n\nThe amber gel-woman jiggles her breasts to help change the topic. <i>“Let’s see, what else... oh, we grow up pretty quick, comparatively, so if you ever wanted kids, we aren’t much work to raise.”</i> Flahne smiles happily. <i>“It’s nice to have someone get to know you instead of expecting you to immediately get naked, ya know?”</i>");
	//Unlocks ovipositor talk and subrace talk
	processTime(1);
	//clearMenu();
	//addButton(0,"Next",talkToFlahne);
	talkToFlahneMenu();
}

//Her Subrace
public function flahnesSubRace():void {
	clearOutput();
	showFlahne();
	output("You mention that you’d like to know more about her subspecies in particular.");
	output("\n\nFlahne lights up with delight as you broach that topic. <i>“Well, you know about the rahn, so I guess I could explain a bit about what it means to be a loo’rahn.”</i> She smiles up at you and peels back one of the sleeves on her button-down shirt, exposing the honeyed flesh beneath. <i>“As you can see, I’m semi-transparent, like all rahn, but I’m yellowish in color. Rahn almost always produce the same color offspring, unless it is a pairing of two different colored rahn. Our colorization forms in response to our characteristics, with each color having different advantages.”</i>");
	output("\n\nRolling her sleeve back down, Flahne continues, <i>“Loo’rahn tend to be less durable than the other types, but we make up for it in other ways. Our tongues are longer and more nimble. We can be even softer than our sisters, who are already far more plush than a human girl could ever be.”</i> She gingerly pushes her hand into the heaving curve of her breast, slowly depressing it until she’s swallowed up to the wrist in boobflesh. <i>“An upside of this is that we can reshape our bodies more easily than other rahn in order to assume new shapes or forms. It still takes a good while, but it can have its advantages.”</i>");
	output("\n\nYou nod, easily seeing how the ability to alter one’s form could have immense uses, even if you couldn’t change the color of your body.");
	output("\n\n<i>“It does have its downsides. It’s hard to keep all the excess nutrition I hold inside myself from settling into unattractive areas. I really should cut down on the sugar, but it’s just so good! It tastes even better in my cum, too, so I just keep drinking it and never really lose it.”</i> Flahne stands up out of her seat and pivots around, showing just how thick and juicy her hips and bosom truly are. <i>“It’s good to have this much control over my body, huh?”</i>");
	output("\n\nFlahne settles down, her soft bottom lewdly squishing and stretching at the hem of her skirt when her thick thighs compress. She looks up with a proud smile, and admits, <i>“Don’t get me wrong, some of the other rahn have some pretty great things that they can do. Red rahn can secrete all kinds of disabling chemicals on their surface. White ones are super efficient at absorbing nutrients, but that means they have more leftovers to let out. They leak like faucets when they masturbate or get too turned on. The green and blue ones are mega tough. I’ve seen one of those turn their skin hard enough to stop a bullet.”</i> She seems a little out of breath after rattling all that off. Settling down for a moment to lick at her candy gives her a second to settle down.");
	output("\n\n<i>“I guess that’s it,”</i> she says at last, <i>“but I’d be happy to talk about my people as much as you like.”</i>");
	//Pass 10 minutes.
	processTime(10);
	//clearMenu();
	//addButton(0,"Next",talkToFlahne);
	talkToFlahneMenu();
}

//Her Ovipositor
public function flahnesOvipositor():void {
	clearOutput();
	showFlahne();
	output("You mention her ovipositor, ");
	if(!flahneDickOut()) output("<b>currently hidden.</b>");
	else output("<b>currently dangling free whenever the mood strikes her.</b>");
	output("\n\n<i>“Well, what do you want to know about it?”</i> Flahne asks ");
	if(!flahneDickOut()) output("curiously");
	else output("coyly");
	output(".");
	processTime(1);
	//[About It] [Keep It In/Let It Out]
	clearMenu();
	if(flags["FLAHNE_LIKE_OVIPOSITOR"] > 0) addButton(1,"Put It Away",keepDatOvipositorIn);
	else addButton(1,"Let It Out",popOviOut);
	addButton(0,"About It",aboutDatOvipositorOut);
	addButton(14,"Back",talkToFlahneMenu);
}

//Keep Ovipositor In
public function keepDatOvipositorIn():void {
	clearOutput();
	showFlahne();
	output("You ask Flahne if she’d mind keeping it in.");
	output("\n\n<i>“Awww, what made you change your mind about it? It’s fun and tasty!”</i> she protests.");
	output("\n\nYou explain to her that if you fuck her, you’d like to do it without a sixteen inch tallywhacker prodding at your orifices, gesticulating none too subtly with your arms for emphasis.");
	output("\n\nThe honey-hued gel-girl sighs and says, <i>“Okay, fine. Just let me get rid of it. Do you want to watch?”</i>");
	flags["FLAHNE_LIKE_OVIPOSITOR"] = 0;
	processTime(1);
	clearMenu();
	addButton(1,"No",dontWatchOvipositorGoAway);
	addButton(0,"Yes",watchFlahne);
}
//[Watch/Don’t]
//Don’t Watch Ovi Go Away
public function dontWatchOvipositorGoAway():void {
	clearOutput();
	showFlahne();
	output("You inform Flahne that you have no desire to watch and step out of the room before she tends to it.");
	output("\n\nFlahne harrumphs, rising from her desk and flouncing around to lock the other doors. She closes one behind you and settles back in at her desk, the wheels on her chair creaking noisily as she slides back. Lurid slurps combine with muffled ‘mmmm’s with such eagerness that you can put together a decent mental picture of just what’s going on in there, even if you don’t want to. A full ten minutes pass like this until an ecstatic, muffled moan interrupts the tempo. That drags on for almost a full minute, and then... silence.");
	output("\n\n<i>“Come iiiiiin,”</i> a satisfied-sounding Flahne calls. You walk back in and find her back behind her desk, snappily dressed with a fresh skirt and a smile. <i>“Let me know if you ever change your mind, cutie, and I’ll share some of my candy with you. She pops a sucker into her mouth with a sassy smile.");
	output("\n\n<i>“I guess you’d rather talk about something else then?”</i>");
	//pass 10 minutes.
	processTime(10);
	//Display talk menu
	//clearMenu();
	//addButton(0,"Next",talkToFlahne);
	talkToFlahneMenu();
}
//Watch Ovi Go Away
public function watchFlahne():void {
	clearOutput();
	showFlahne();
	output("You smile and let Flahne know that you wouldn’t mind watching her suck one last load out of her ovipositor.");
	output("\n\nShe winks and coos, <i>“I thought so,”</i> as she fishes the big floppy shaft out of her skirt, turning the rumpled fabric back up against her torso, her strings of milky-white pre connecting the leaky tip to stained cloth. Flahne looks up at you with a nervous smile and asks, <i>“Are you sure? I’m gonna miss being able to play with this.”</i>");
	output("\n\nSighing wistfully, you answer that you would prefer she keep it in around you for the foreseeable future.");
	output("\n\n<i>“Spoilsport,”</i> Flahne playfully growls as she takes the full, gelatinous tool in the palm of her hand and begins to stroke, the motions made exceedingly sloppy by the thick film of sweet-smelling pre she’s secreted all over her masculine genitalia. <i>“Ahhh, that’s the stuff.”</i> Bending slightly, she brings her face down to the drooling rod, a few inches away from making contact with her lips. She inhales, obviously savoring an aroma she enjoys greatly before parting her lips and diving down, just the tip pressing into her maw while her tongue corkscrews around the first few inches, sliding up and down the floppy ovi-dick with great enthusiasm. A muffled ‘mmm’ escapes her lips in between lewd sucks.");
	output("\n\nFlahne stops slobbering on her swollen ovipositor for a moment, regarding the swelling gel with unrepentant hunger as it thickens in her busily stroking hand. Flicking her tongue back out, she presses into the oozing slit, channeling sweet, whitish creme directly into her throat. Her neck bobs noticeably as she swallows down her pre-load, pushing more and more of her tongue directly down her lusty organ’s urethra. Trickles of clearer moisture are running out of her puffy, swollen pussy below, but Flahne does not leave it neglected for long. She strokes the base of her ovipositor with her thumb, and slides the first two fingers on her left hand into the sopping, slippery sex.");
	output("\n\nCurvy gold boobs jiggle as a powerful shudder works through the voluptuous girl, accompanied by a high-pitched whine from Flahne. She pushes her other two fingers of her hand in to the knuckle, her eyes scrunching shut powerfully. The gel-girl’s mouth stretches into an wide-open ‘O,’ then she compulsively jams the bloating tool into her cum-hungry lips with her tongue still impaled inside it. Her eyelids part enough for you to see her purple eyes rolling back. Her cheeks bulge. Messy girl-cum soaks her hand, dripping onto her seat. Flahne swallows, but then her cheeks fill again. Luckily, she’s more than happy to gulp the thick load down again and again, fingering herself until her seat has soaked with her other secretions.");
	output("\n\nTrickles of thick ivory cum have oozed out the corners of Flahne’s mouth, beading towards her chin by the time she finally pulls free. The glutinous girl tosses her head back and sighs happily, withdrawing her squelching fingers from her abused honeypot. <i>“Ahhhhh,”</i> she breathes with a satisfied grin. Languidly dabbing at the corners of her mouth, she sucks down the few escaped runnels of her cum and says, <i>“It’s so sweet! I don’t know how anyone could let it go to waste.”</i>");
	output("\n\nWhile she is talking, Flahne’s spent ovipositor slowly begins to shrink. Rather than wilting like most male organs do when unerect, the softening tool merely diminishes in size, becoming smaller, and smaller... and smaller. It is so tiny that you can’t even see the urethra anymore, and it reduces yet further, becoming no larger than a clit... well, it is a clit now, jutting just barely past Flahne’s luscious pussy-lips.");
	output("\n\nGiggling, Flahne admits, <i>“I’ll be sure to hold it in around you from now on.”</i> She grabs a new skirt from her desk. The old one goes in a different drawer while the new one is put on, and a moment later, she’s sitting back down on her soaked seat, releasing a puff of her fresh, sweet aroma into the air. Perhaps the lollipops aren’t the only things to be blamed for the sugariness that clings to her like a cloud.");
	output("\n\nYou smile and thank her for being so accommodating, a bit turned on from the show.");
	
	//Boost lust
	pc.changeLust(10);
	//Pass 10 minutes.
	processTime(10);
	//Out to room.
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Pop Ovi Out
public function popOviOut():void {
	clearOutput();
	flags["FLAHNE_LIKE_OVIPOSITOR"] = 1;
	showFlahne();
	output("You mention that you wouldn’t care if Flahne wanted to have her ovipositor out around you.");
	output("\n\n<i>“Really?”</i> the soft-as-sin secretary breathes, <i>“You mean it?”</i>");
	output("\n\nYou nod, a little amused at her eagerness.");
	output("\n\nFlahne leans back in her chair and stretches, commenting, <i>“You have no idea how much I’ve been hoping to hear you say that, cutie!”</i> She fans herself, causing her breasts to visibly quake with her exciting motions, and licks her lips, watching you expectantly. Her skirt makes a barely audible rustling noise, drawing your attention over the obstructing furniture and down to her loins. A fold of fabric is slowly rising from between her legs, lifting higher and higher. It passes four inches quickly. Six inches is up in the next heartbeat. The phallic distention reaches eight inches without pausing, throbbing larger with each second.");
	output("\n\nFlahne is breathing a bit more heavily by now, and her eyes have fallen down to the swelling protrusion. Her ovipositor has stretched her skirt over a foot high, lifting the hem high enough that were it not for the desk, anyone across from her would see the phallic organ. She moans, her fingers scrabbling at the hardwood desktop in an attempt to keep them out of her crotch, that tall tower of pulsating gel slowly growing to its full, sixteen-inch length. Flahne sighs after that performance, sagging back as she gulps for air. After cooling down, she gives a happy wiggle and asks, <i>“What do you think? I like mine big, it lets me keep tasting the sugar over and over again!”</i>");
	output("\n\nRealizing what she just said, she blushes orange and changes the subject, suggesting, <i>“I know! Since you’ve gotten me to let it out, why don’t you help me tend to it?</i> Her foot appears under the desk to rub your [pc.leg]. She pouts knowingly at you, her arms pressing down on either side of her bosom such that it practically boils out of her top.");
	//5 minutes pass
	processTime(5);
	//choose sex menu
	pc.changeLust(5);
	flahneSexMenu(false);
}

//About Ovipositor
public function aboutDatOvipositorOut():void {
	clearOutput();
	showFlahne();
	output("You tell her that you actually wanted to hear about her ovipositor - how does it work?");
	output("\n\nFlahne smiles cheekily and asks, <i>“A little curious, " + pc.mf("Mister","Miss") + " Steele?”</i> She winks. ");
	if(!flahneDickOut()) output("<i>“I can pull it out for you sometime, if you ever want to inspect it.”</i>");
	else output("<i>“You’ve already seen it, but I’d be happy to give you a closer look.”</i>");
	output("\n\nYou stare blankly at her, waiting for her to get back on-topic.");
	output("\n\nFlahne harrumphs at your lack of response. <i>“Okay, okay. I told you earlier that we lay eggs through them, but that’s not all they’re good for. When we orgasm or give birth, lots of whitish lubricants come out with it, like what you might call cum.”</i> Flahne smiles again. <i>“I kind of like to call it cum, too, even though mine is as sweet as candy.”</i>");
	output("\n\n<i>“Why is that?”</i> you ask.");
	output("\n\nPlopping her sucker back into her mouth, the gel-woman explains in between licks, <i>“Well, when we have too much mass, we secrete it as sexual fluids. It’s kind of useful - if one of us is eating really well, we can share the nutrition with our friends that way. I eat so much candy that I’m pretty much filled to the brim with sugary goodness, even though we don’t really use it for anything.”</i> Flahne tilts her head to the side and whispers one last bit, <i>“Since it tastes so good and I like my ovipositor so much, I usually eat it right up, which is why I’m so much more voluptuous than most rahn.”</i>");
	output("\n\nYour sugared companion continues. <i>“I’m all for accepting people for who they are, but I understand how it’s possible to like everything about a person except for one thing. That’s why I don’t mind keeping it tucked away for cute " + pc.mfn("boys","girls","people") + " like you, if you want. In a nutshell, most of us just use it for laying eggs, but it makes a pretty damned good stand-in for a cock. I’ve never had any complaints from any of the ladies brave enough to sit in my lap, anyway.”</i>");
	output("\n\nShe must see the look on your face, because she colors orangish and quietly says, <i>“Well, a few walked kind of funny and were rather sore... still, they didn’t complain! Not seriously, anyway.”</i> Flahne twirls her lollipop in her mouth as she racks her brain - or whatever rahn use to think - for more information. <i>“I nearly forgot! Some of us grow them above our clits, and some of us grow them from our clits. Mine grows out of my clit, so it’s extra sensitive!”</i> she proudly declares.");
	
	output("\n\nWell, that explains why she’s so enamored of it.");
	output("\n\n<i>“Annnnnnd, that’s it! Nothing else to say about it unless you want to inspect it personally, which you already declined,”</i> Flahne says. <i>“So, anything else you want me to do with it?”</i>");
	//Pass 5 minutes, go back to Flahne ovipositor menu
	processTime(5);
	clearMenu();
	addButton(0,"Next",flahnesOvipositor);
}

//The Locals
public function theLocals():void {
	clearOutput();
	showFlahne();
	output("You ask her if she could tell you a little bit more about the locals.");
	output("\n\nFlahne brushes a strand of floppy, gelatinous hair to the side and says, <i>“First off, there are the zil. They’re pretty much the only form of intelligent life out there worth talking to in my opinion. Unfortunately, they’re pretty tribal and in their culture, when they meet someone from another tribe out in the jungle, it’s traditional for them to fight for dominance and fuck. Male or female, they don’t really care. To them it isn’t really that bad of a thing, just a way to decide who’s on top. From what I’ve heard they both usually walk away smiling. The loser almost always gives up before they get hurt too bad.”</i>");
	output("\n\n<i>“Why is that?”</i> you ask curiously.");
	output("\n\nFlahne giggles, <i>“That’s the best part! They’ve got super potent pheromones they can release at will. I’m told that smelling them turns you on like crazy and makes you just want to fuck them in whatever way they prefer.”</i> Her lips color orange with nervousness. <i>“I hope you won’t tell anybody about me cussing like that; I’m not supposed to on the job.”</i>");
	output("\n\nYou idly wonder if she’s supposed to be flirting either, but dismiss it as she prattles on.");
	output("\n\n<i>“So, they look kinda like wasps with all the chitin covering them, but they pull it back and they have the cutest cocks... at least the men do, anyways. The girls have these juicy-looking snatches and breasts that can drip honey. I’ve been hoping a pretty, civilized one would come through</i>");
	if(pc.femininity >= 75) output("<i>, but then I met you! You’re so cute that those silly bugs don’t stand a chance</i>");
	output("<i>. So far, a few of the males have come into town to try and drive us off. Penny disabled two of them pretty easily before the others ran off. I gotta admit, I started dripping when their combined smells wafted over here,”</i> the curvy woman says while wiggling uncomfortably in her chair.");
	
	output("\n\nTossing a spent sucker into her waste bin, she grabs a new one and plops it between her plump lips, sucking noisily in between sentences. <i>“I think they’re in jail till Penny figures out what to do with ‘em. She installed some remote auto-turrets afterward. All it’ll take is a call to her and they’ll light up any nasties she tags.”</i>");
	
	output("\n\nSentry turrets? Talk about overkill. Is there something worse out there?");
	output("\n\nFlahne nonchalantly pops out her sucker and says, <i>“Oh no. All things considered, Mhen’ga is a pretty nice planet. The worst we have are cunt snakes, and some infested asshole brought those in from offworld. We still haven’t gotten a decent body scanner in yet, so now we’ve got parasitic snakes out there, adapting to the planet. They’ll probably have acclimated fully before we can get any decent gas treatments for them in.”</i> Flahne sighs. <i>“They’re kind of gross, I think. I mean, they’ve got lust-inducing venom that they use to incapacitate their victims – usually males – and then they’ll use the vagina they’ve got on their other end to feed. Girls usually get left alone. Sometimes, if they take a liking to their victim, they’ll wait until she’s asleep and then bite into the base of the spine. They do some kind of crazy metamorphosis and meld into the victim’s body, so when they wake up, they’ve got a pussy tail with a powerful thirst for cum.”</i>");
	
	output("\n\nYou shiver");
	if(pc.hasCuntTail()) output(" with lust, your thoughts returning to your tail at the mention of it. It’s a shame that it sounds like Flahne doesn’t want anyone to drain her with one.");
	else output(" at the odd mental picture.");
	output("\n\n<i>“Yeah, they only eat the cum. They actually have dozens of species worth of DNA stored inside them and use the biology of their host to determine the most appropriate mutations to impose upon their young. It’s really quite clever, even if they are little more than dumb snakes that eventually turn into unthinking, tail-based breeding machines. They aren’t even from here, so you can’t blame the jungle for them!”</i> Flahne says, with a note of pride in her voice.");
	
	output("\n\nYou ask if she’s attached to this planet.");
	output("\n\nThe amber woman nods. <i>“You bet I am! I’ve been here since the planet was declared colonist-ready and the first buildings were raised. It’s a tough planet, but a sweet one.”</i> She sucks on her candy. <i>“We just go together so well!”</i>");
	output("\n\nYou ");
	if(pc.isAss()) output("force a ");
	output("laugh at Flahne’s weak joke, then ask if there’s anything else out there.");
	output("\n\nHer expression darkens. <i>“Yeah, there are the venus pitchers, too. We don’t have to worry about them in town; they only grow in the darkest, most lightless parts of the jungle. They’re plants, but they’re as sentient as you or me. They just don’t have interest in anything that isn’t extracting fluids from their prey.”</i> Flahne mouths a single word: ‘lazy’. It’s cute, but surprisingly difficult to make out coming from orange lips on a yellow face. <i>“So they just stand there with these hidden, subterranean pods below. That’s where all their tentacles are. And they look like these sexy, curvy women to lure in zil or whoever else wanders out there. When someone gets too close, they fall into the pod or get pulled in, and then they’re forced to cum for hours until they’re damn near dry. At that point, the pitchers toss them out and close up, sealing themselves off until they’re hungry again.”</i>");
	
	output("\n\n<i>“Why don’t they just eat the person?”</i>");
	output("\n\nFlahne taps her chin in thought. <i>“You know... I never really thought about that. Some people that have... ‘met’ them say that they dream of being inside the pods afterward. Most of the people that spoke up about that aren’t around anymore. I guess the jungle claimed them?”</i>");
	
	output("\n\nThe gluttonous gel doesn’t seem that sure of the last point. <i>“Not much else to say about it, really. Anything else I can help you with, " + pc.mf("Mister","Miss") + " Steele?”</i>");
	//10 minutes, back to talk menu
	processTime(10);
	//clearMenu();
	//addButton(0,"Next",talkToFlahne);
	talkToFlahneMenu();
}

//Sex Menu
public function flahneSexMenu(display:Boolean = true):void {
	if(display) {
		clearOutput();
		//Not yet sexed
		if(flags["FLAHNE_SEXED"] == undefined) {
			output("Making love to a curvy, eager woman wouldn’t be so bad.");
			if(pc.isMischievous()) output(" With a disarming smile, you ask her if she knows any. She frowns in thought for a moment before she catches on to the joke.\n\n<i>“Oh, you’re blind? You didn’t mark that on your paperwork.”</i>");
			output("\n\nThe full-bodied secretary giggles, a high-pitched, bubbly sound. <i>“If that’s the case, we can have some fun.”</i> The last word is said with such sultry delight that it’s practically purred. She opens a button, causing her mountainous melons to visibly quake and jostle against each other when she leans toward you.");
			output("\n\n<i>“So... how do you want it?”</i> Flahne asks as her top compresses against the desk, hinting at her intentions.");
		}
		//Sexed
		else if(!flahneDickOut()) {
			output("You tell Flahne that you wouldn’t mind a little bit of sugar. The curvy loo’rahn graces you with a radiant smile as she unfastens the top button of her blouse and arches her back to push her chest in your direction. The two heavy melons wobble and bounce off each other with every motion, unbounded by bra or modesty.");
			output("\n\n<i>“So, " + pc.mf("Mister","Miss") + " Steele, how does my favorite cutie want it today?”</i>");
		}
		//Sexed and Ovipositor Out
		else {
			output("You tell Flahne that you’re up for a little bit of fun if she is.");
			output("\n\nFlahne glances down at her tented skirt. <i>“I think you know the answer to that, [pc.name].”</i> Backing her chair up with a seductive shimmy, the curvy secretary catches her ovipositor on the edge of the desk. She groans as she scrapes it free, then with a blush and a smile of concession, lifts the obscuring veil of the skirt high enough to proudly display both of her dripping tools.");
			output("\n\n<i>“See something you like, cutie?”</i> Flahne’s voice practically oozes over to you, liquid with desire to use her pent-up sex.");
		}
	}
	showFlahne(true);
	//if quadruped, all branches output:
	if(pc.isTaur()) output("\n\nYour body length, while impressive, sadly limits your options in this tiny office. You’ll be able to do her over the desk, but that’s about it.");
	processTime(1);
	//goto choices
	clearMenu();
	
	//Fuck n’ Suck (Flahne Autofellates)
	//requires ovipositor OK’d, ovipositor out
	if(flags["FLAHNE_LIKE_OVIPOSITOR"] > 0 && !pc.isTaur() && pc.hasCock()) addButton(0,"Fuck N Suck",fuckAndSuckWithFlahne,undefined,"Fuck And Suck","Fuck Flahne while she self-sucks her ovipositor.");
	else addDisabledButton(0,"Fuck N Suck","Fuck And Suck","This scene requires Flahne’s ovipositor to be out and the PC to have a phallus. It does not accomodate taurs.");
	//Desk Munchies
	//Requires rahn race discussion has taken place
	if(flags["TALKED_ABOUT_FLAHNES_RACE"] > 0 && flags["FLAHNE_DESK_DISABLED"] != 1 && !pc.isTaur()) addButton(1,"Under Desk",flahneDeskMunchies,undefined,"Under Desk","Climb under Flahne’s desk and give her some oral pleasure.");
	else addDisabledButton(1,"Under Desk","Under Desk","This scene requires that you not be a taur, that you’ve talked about Flahne’s race with her, and that you haven’t somehow pissed her off into forbidding this act.");
	//Get Box Munched
	//You suggest that Flahne could take a few licks and see just how long it would take to get to your center... Turns out its 3 bites.
	if(pc.hasVagina() && !pc.isTaur()) addButton(2,"GetEatenOut",flahneMunchesBoxesMetalBawkses,undefined,"GetEatenOut","Get Flahne to eat you out.");
	else addDisabledButton(2,"GetEatenOut","Get Eaten Out","This scene requires you to have a pussy and not be a centaur.");
	
	//Rahn Suppository (All Sexes, or lack thereof; needs Ovi; Savin's Fault)
	if(flags["FLAHNE_LIKE_OVIPOSITOR"] > 0 && !pc.isTaur()) addButton(3,"Get Stuffed",rahnSuppository,undefined,"Get Stuffed","Take Flahne’s ovipositor anally.");
	else addDisabledButton(3,"Get Stuffed","Get Stuffed","This scene requires Flahne to have her ovipositor out. Taurs cannot get this scene.");
	
	//Bend her Over (Dickwielders; Savin wrote dis)
	if(pc.hasCock() && pc.cockThatFits(flahne.vaginalCapacity()) >= 0) addButton(4,"Bend Her Over",bendFlahneOver,undefined,"Bend Her Over","Bend her over and fuck the slutty rahn secretary.");
	else addDisabledButton(4,"Bend Her Over","Bend Her Over","This scene requires you have a dick that would fit inside Flahne’s vagina.");

	//Gardeford's Exhibitionism Scenes
	if(flags["FLAHNE_EXHIBITIONISM_UNLOCKED"] == 1 && flags["FLAHNE_DESK_DISABLED"] != 1)
	{
		if(pc.cockThatFits(chars["FLAHNE"].vaginalCapacity()) >= 0 && pc.hasCock()) 
			addButton(5,"(M)Exhibition",flahneIfMalesFitTheySitExhibitionism,undefined,"(M)Exhibition","Get Flahne to try some exhibitionism and get your rocks off in the process.");
		else addDisabledButton(5,"(M)Exhibition","(M)Exhibition","This scene requires you to have a penis that would fit inside Flahne’s vagina.");
		if(pc.hasVagina()) addButton(6,"(F)Exhibition",flahneExhibitionHugsGirls,undefined,"(F)Exhibition","Get Flahne to try some exhibitionism and involve your girl parts in the process.");
		else addDisabledButton(6,"(F)Exhibition","(F)Exhibition","This scene requires you to have a vagina.");
	}
	else {
		addDisabledButton(5,"(M)Exhibition","(M)Exhibition","This scene requires you to have interested Flahne in exhibitionism.");
		addDisabledButton(6,"(F)Exhibition","(F)Exhibition","This scene requires you to have interested Flahne in exhibitionism.");
	}
	//Available for anybody with a cunt between their legs OR taurs with back-mounted cunts. 
	//DA SCENE - Swap Oral
	if(pc.hasVagina()) addButton(7,"Swap Oral",flahneEatOutSwapMeatPussiesYouKnowWhatIMean,undefined,"Swap Oral","Eat Flahne out, then see if the busty rahn can make a meal out of your own pussy - fun for everyone!");
	else addDisabledButton(7,"Swap Oral","Swap Oral","You need a vagina to swap oral with Flahne!");
	//Flahne Cunt Snake Scene
	//Requires ovi out, not currently mad. Cunt snake does not get pregged from this obvs
	if(pc.hasCuntTail() && pc.hasParasiteTail() && flags["FLAHNE_LIKE_OVIPOSITOR"] > 0) addButton(8,"Cunttail",flahneCuntSnake,undefined,"Cunttail","Teach Flahne how fun having a cuntsnake can be.");
	else addDisabledButton(8,"Cunttail","Cunttail","You need a parasitic vagina-tail to do this.");

	addButton(14,"Back",mainGameMenu);
}

//Bend her Over (Dickwielders; Savin wrote dis)
//don’t forget to italicize the dialogue when you code -Z
public function bendFlahneOver():void {
	clearOutput();
	author("Savin");
	showFlahne(true);
	var x:int = pc.cockThatFits(flahne.vaginalCapacity());
	output("You slip your arms around the bubbly, affectionate rahn, letting your hands play across her gel-like skin, squeezing and caressing her many curves. Flahne coos as your fingers worship at the temple of her curvaceous body, groping a big handful of her ass under her skirt, drifting under her clothes, across her tremendous ass and thick thighs.");
	if(flags["FLAHNE_LIKE_OVIPOSITOR"] > 0) output(" Her ovipositor leaps to attention, nearly striking you.");
	output(" You sink into Flahne’s yielding flesh, and she gives a little gasp as your hands disappear into her butt, pulling her so close to you that [pc.eachCock] is prodding her belly through her clothes.");
	output("\n\n<i>“Feeling a little bottled up, sugar?”</i> the rahn teases, stroking you");
	if(pc.armor.shortName != "") output(" through your [pc.armor]");
	output(". <i>“Let’s get you taken care of, hmm?”</i>");
	
	output("\n\nThe squishy secretary gives you a lusty wink and leads you in a slow tango around the room; stopping at the nearest door and raising one hand to cover the panel, she guides yours into her skirt with the other, right ");
	if(!flahneDickOut()) output("down to her small, pert clit");
	else output("around her twitching ovipositor");
	output(". <i>“We’ll need to lock these doors so nobody interrupts our fun - you should be able to feel a button - that’ll do it.”</i> She winks at you");
	if(pc.tallness >= 55) output(", then kisses you wetly on the cheek,");
	output(" spurring you to play along.");
	
	output("\n\n[pc.EachCock] begins to drool as you finger the civil servant’s slippery sex; when you gently rub her ");
	if(flahneDickOut()) output("ovipositor");
	else output("clit");
	output(", she moans quietly and palms the door lock, securing this portal. Flahne steps backward to the next one, dragging you along by the hand tucked into her waistband. Each door is a destination in your dirty dance, shutting with a ‘snick’ as you stimulate your lover.");
	
	output("\n\n<i>“Mmm... you really know how to operate, [pc.name],”</i> she puns. <i>“But we’re locked in now... I think we can be a bit naughtier.”</i> She pulls you from her skirt and slips down, her descending form slipping between your hands until you’ve got a good grip in her soft shoulders, guiding her in as she ");
	if(pc.armor.shortName != "") output("unfastens your [pc.armor], letting your stiff prick pop free into her waiting mouth.");
	else if(pc.lowerUndergarment.shortName != "") output("unfastens your [pc.lowerUndergarment], letting your stiff prick pop free into her waiting mouth.");
	else output("wraps her fingers around your stiff prick, guiding you into her gooey mouth like a fleshy sucker.");
	output(" As her lips wrap around your head, Flahne hums a delighted, soft <i>“Mmmm,”</i> rolling across your glans, wrapping your member in soft, wet tongue. You let out a heavy, contented sigh as Flahne goes to work, putting all her candy-sucking skills to use on her newest treat, fellating you with expert precision. Your grip tightens on her shoulder, guiding her head further and further down your " + pc.cockDescript(x) + " until her lips press against your ");
	if(pc.hasSheath(x)) output("sheath");
	else if(pc.hasKnot(x)) output("knot");
	else if(pc.balls > 0) output("[pc.balls]");
	else output("base");
	output(", the tip of her tongue flicking out to give ");
	if(!pc.hasSheath(x) && !pc.hasKnot(x) && pc.balls > 1) output("them");
	else output("it");
	output(" a quick lick that sends a deep shiver of pleasure up your spine.");
	
	output("\n\nAs her mouth escorts your prick to a whole new realm of pleasure, compressed and engulfed in the soft, delightfully elastic flesh of her body, Flahne’s hands go to work as well. She unbuttons her shirt, already strained against the massive G-cups practically bursting from the fabric; the massive mammaries flopping down to sway hypnotically beneath your gel-slicked prick. She cups her heavy orbs under an arm, squeezing them just enough that they seem to swell even bigger, flowing over her grip until her big, squishy nipples brush your [pc.skinFurScales], making their owner shudder in delight.");
	
	output("\n\nWhile you could easily lean back and cum just from Flahne’s oral expertise, you ");
	if(pc.isTaur()) output("shuffle away and ");
	output("grab the curvy rahn under her arms instead, pulling her off your " + pc.cockDescript(x) + " and pushing her back against her desk. She gives a surprised yelp as you turn her around, bending her over until her ass is on full display, two huge mounds of butt tilting up at you with her wide and ready cunt poking out between them, just begging for dick. But not yet...");
	
	output("\n\nYou thrust quickly, pushing your prick up between Flahne’s awesome anal cleavage. <i>“Oooh, up for a little hot-dogging, captain?”</i> she giggles, wiggling her hips for you. Her ass wobbles around your prick, flesh jiggling rhythmically against your unsuspecting prick; your breath catches and you nearly cum on the spot. You grab her butt, fingers sinking deep into the alien flesh of the cock-craving cutie, holding her steady as you recover - though that doesn’t entirely stop her. She happily hums as she shifts, flesh quivering at every little move she makes. You groan and gasp, only moving your own [pc.hips] the slightest bit, allowing the rahn girl’s reversal, enjoying the incredible feeling of her alien body on your " + pc.cockDescript(x) + ".");
	
	output("\n\nAs a reward for her exceptional talents, you reach around ");
	if(flahneDickOut()) output("and grab the dangling mass of girthy rahn-prong hanging between her thick thighs. Flahne gasps with surprise - and no little pleasure - as your fingers encircle her engorged member, gently stroking it. <i>“Oh, [pc.name]... mmm, don’t stop,”</i> she breathes huskily, shivering as you start to jerk her off.");
	else output("and scoop her tits up off the desk, digging into the squishy mammary mounds, pinching and tugging at her big, soft teats. <i>“Oh, [pc.name]!”</i> she groans, fingers digging into the faux-wood. <i>“D-don’t stop... so good....”</i>");
	output(" With your fingers tightly locked into her sensitive, membranous skin, Flahne wiggles happily in your grasp, fucking you with her big, soft ass as you work to pleasure her with your dexterous hands.");
	
	output("\n\nYou barely notice when a shake of Flahne’s ass drags your " + pc.cockDescript(x) + " into her warm, wet hole, but the same can’t be said of Flahne, who gasps as you slip into her. Her voice relaxes into a low, lusty moan when the next thrust of your hips pushes you deep into her amber depths. <i>“Don’t hold back, sweet thing... give me a nice cuntful of your cum,”</i> she moans, thrusting her hips back against you expectantly. A hard swat to her big bubble butt puts an end to that; you’re not letting her get what she wants so easily. She’s gonna have to work for this treat!");
	pc.cockChange();
	
	output("\n\nStill, seeing her ass jiggling and swaying after that smack and feeling the tight embrace of her creamy cunt clamping down on your cock gives you an idea. Another whack sets her whole ass to shaking and elicits a shrill yelp from the thick gel girl. Her slit’s like a wet vice around your " + pc.cockDescript(x) + ", almost sucking you in as you hammer her juicy cunt. Your hands grip her tits, squeezing and pulling the dark caps of her massive bust, enjoying the sway of her chest with every thrust of your hips into her big, plush bottom. Kneading her boobs pulls another cry from Flahne’s lips, this time a shrill moan of unbridled pleasure. She pushes back against your " + pc.cockDescript(x) + ", jiggling all over as you twist and flick her teats.");
	
	output("\n\n<i>“Oh yeah, that’s good!”</i> Flahne cries, a hand vanishing between her legs to ");
	if(!flahneDickOut()) output("tease her clit");
	else output("take over stroking her girthy ovipositor, stroking as you squeeze her breasts");
	output(". You redouble the pace, grabbing her hips for added support as you jackhammer into her gooey box, slapping again and again into the big curves of her huge, luscious ass.");

	output("\n\nWhen she cums, Flahne’s cunt squeezes down on you like a glove, sucking with potent force.");
	if(flahneDickOut()) output(" Her body twitches as her ovipositor practically pops with a flood of thick, creamy rahn spooge.");
	output(" You groan and grit your teeth, digging your fingers deep into her wide, pliant hips. You push in hard before you blow your load, getting every inch of your " + pc.cockDescript(x) + " into Flahne’s beautiful, glorious hole. With another spasm of her gel-like body, your cock responds by shooting a thick glob of [pc.cum] into Flahne’s womb, filling her with spurt after spurt of musky spunk");
	if(pc.cumQ() >= 2000) output(" until your seed begins to press against her skin, coloring her [pc.cumColor] and swelling her form");
	if(pc.cumQ() >= 10000) output(". So much seed vanishes into the girl’s golden gap that halfway through your climax, she’s already doubled in size, splayed liberally over the desk like a spilled custard");
	output(". Her body is quick to engulf the offering, never letting a drop escape her slick depths.");
	processTime(20 + rand(10));
	output("\n\nYour hips pound into her a few last times as your " + pc.cockDescript(x) + " empties, panting and heaving as you collapse and sink into your gel-lover. She giggles playfully, reaching a hand back around to pull your prick from her hole, still twitching and dribbling - until she gets down on her knees to clean you up, lapping up every last drop. You rest your arms on her desk, examining the spilled coffee, papers, and pens strewn across her workspace. She sure made a mess....");
	
	output("\n\nRunning a hand across Flahne’s gooey hair, you give her a gentle push off of your dick, letting it come free with a wet, squishy pop. The curvy rahn licks her lips, chest jiggling as she wipes a little stray cum from the tops of her ");
	if(pc.cumQ() >= 2000) output("swollen, near-[pc.cumColor] ");
	output("tits.");
	if(pc.cumQ() <= 10000) {
		output("\n\n<i>“Mmm, what a tasty snack!”</i> Flahne grins, bounding over to you, reeking of the cum already circulating in her");
		if(flahneDickOut()) output(" as her ovipositor throws strings of her ejaculate onto the floor and her thighs");
		output(". <i>“Your cum’s sooo sweet, [pc.name]. Can I call you up for delivery sometime?”</i>");
		
		output("\n\nYou reach around and give her a big squeeze, making the jiggly secretary squeal happily as she unlocks the door to let you out and then turns to straighten up her desk... making sure to bend over as she does so, giving you one last look at that big, beautiful ass.");
	}
	//(huge cum only)
	else {
		output("\n\n<i>“Oh my God, I’ve never been so full!”</i> Flahne marvels. She looks like she wants to prance over and hug you, but she’s absorbed so much of your cum that her head bumps against the ceiling - she can’t even stand up straight! <i>“Ugh, ouch,”</i> she says, smiling good-naturedly to show that her gooey head isn’t really hurt. <i>“I guess I’ll have to take an extra-long break and get rid of all this nutrition...”</i>");
		
		output("\n\nWith a wink, Flahne reaches out an enormous, off-[pc.cumColor] arm, unlocking the door nearest to you. <i>“Heehee, I’d ask you to stay and watch, but it’s going to take a long time and get very messy in here,”</i> she laughs, ");
		if(!flahneDickOut()) output("diddling her little clitoris until it begins to swell and elongate");
		else output("stroking her half-limp ovipositor until it returns to full size");
		output(". <i>“I hope I have the self-control to keep it out of my mouth the whole time...”</i> Getting the idea, you take one last look at the room-filling gel woman, drinking in the sight of breasts and thighs as big as you are, and then turn to leave.");
		
		output("\n\n<i>“Bye cutie!”</i> Flahne calls after you. <i>“I hope you’ll come in here again!”</i> You can almost hear the snicker in her voice at the double entendre.");
	}
	pc.orgasm();
	flahne.loadInCunt(pc, 0);
	flahneFuckCounter(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Rahn Suppository (All Sexes, or lack thereof; needs Ovi; Savin's Fault)
//lacking in brevity and variety - it’s just ‘she puts it in your butt and comes’ in 1400 words of bloat
//also totally incompatible with quadrupeds despite being about anal sex -Z
//also needs italics tags
public function rahnSuppository():void {
	clearOutput();
	author("Savin");
	showFlahne(true);
	
	output("Pulling Flahne close, your hands dig in deep to her malleable amber flesh, cupping and kneading her big ass cheeks. As if on cue, the object of your desires peeks through your bodies: Flahne’s huge, girthy ovipositor tents her skirt, pressing into your [pc.skin]. With a low, sensual growl, you grab the phallic member and giving it a languid stroke. <i>“Oooh, careful sweet thing,”</i> the squishy secretary giggles, <i>“you don’t wanna start something you can’t finish with my big... sensitive... oh-so-stretchy ovi-cock.”</i>");
	
	output("\n\nThat’s about as clear an invitation as you could hope for. Another stroke brings a shiver to the woman, and the shaft in your hand drools a thick stream of lubricant. <i>“My goodness, [pc.name], at least let me lock the doors,”</i> your lover sighs. She takes a step away from you, and you let the ovipositor slip from your hand... but make sure to give the sensitive, oozing end a final stroke, setting it to bobbing and flicking strings of Flahne’s fluid all over the floor. She moans, open-mouthed, and looks at you as though deciding whether to keep her word or just jump you right now. Reason wins out by a hair, and she reluctantly makes a round of the room, closing each of the entrances and returning to stand eagerly in front of you again.");
	
	output("\n\n<i>“There, was that so much effort?”</i> you tease. Given a little push, Flahne flops down in her chair with an <i>“Oomph,”</i> pseudo-cock wobbling like a flagpole as her huge tits sway, barely contained by her straining shirt. You leap onto her with predatory grace, pulling off your [pc.gear]");
	if(pc.biggestTitSize() >= 1) output(", letting your [pc.chest] free, pressing them hard against Flahne’s own prodigious bosom, trapping her organ");
	output(". The gel girl gasps as you straddle her, and as you lean in to plant a long, deep kiss on her full lips, her swivel chair tilts so far back that you nearly flip over. She moans into your mouth, tongue playing across yours as her hands drift down to your [pc.butt]. Her fingers are deft and swift, crossing your skin and spreading your ass cheeks, brushing across your puckered hole. Your breath catches when one gooey grope practically pours into your [pc.asshole], teasing your sphincter with a deep, swirling probe that leaves your mouth agape with pleasure.");
	
	output("\n\n<i>“Mmmm, ready for a little rahn suppository, cutie?”</i> Flahne winks, popping her rod between your");
	if(pc.legCount > 1) output(" [pc.legs] to rest between your");
	output(" ass cheeks. You wiggle your hips, dragging her gooey prick through your crack.");
	//If PC has a cock:
	if(pc.hasCock()) output("\n\nYour own cock presses into Flahne’s belly, and she’s quick to free her mountainous tits, letting them flop free and envelop [pc.eachCock]. You rock your hips forward, hot-dogging Flahne as you fuck her tits. She kisses you harder as you move, wrapping her long, prehensile tongue around yours and squeezing rhythmically to the beat of your thrusting into her bust. <i>“Mmm... double the pleasure, double the fun,”</i> Flahne giggles, pumping her finger in your ass, <i>“Now just keep going, and I’ll get you nice and ready for your surprise inspection...”</i>");
	else output("\n\nFlahne groans as your ass squeezes and wrings her prick, massaging a thick dollop of fluid from her engorged alien member, smearing it into your ass like lube. She licks her lips, hands gripping your [pc.hips] to steady you as you hump her. <i>“Mmm, you’re good, [pc.name]. You must want my big gel-cock bad, huh? Having a little craving, are we?”</i>");
	output("\n\nYou give her a harsh kiss, grinding your ass on her cock and pumping the finger she’s got buried deep in your [pc.asshole]. With her getting you nice and ready, your hole starts to relax around the intruding finger as she swirls and pumps it around your [pc.asshole]. You groan as she inches it back out of you, leaving you with a deeply empty feeling in your bowels - a feeling that’s soon to be filled as she grabs her throbbing gelcock and bends it down toward your pucker. <i>“Open wide for a tasty treat,”</i> Flahne giggles and jiggles, as her tip pushes up against your ass.");
	pc.buttChange(flahne.cockVolume(0));
	
	output("\n\n<i>“Oooooh,”</i> she groans, breath catching as her huge cock head pushes through your finger-widened ass. <i>“Honey, let me get used to you...”</i>");
	
	output("\n\nAs the ovipositor spreads your ");
	if(pc.ass.looseness() >= 3) output("loose ");
	else if(pc.ass.looseness() <= 1) output("tight ");
	output("walls wide, conforming to your shape and size while surging inward, you groan, trying to stay relaxed and loose. You hug the rahn close, pulling her against yourself until your head is practically buried in her tremendous bosom, breath coming ragged as you’re speared by inch after inch of gooey cock. <i>“Easy, sweet thing. I know I’m... well endowed, but I’ve got a lot of experience. Just relax, lean in and rest your head. I’ll take care of everything.”</i>");
	
	output("\n\nYou groan, trying to keep your asshole calm as your muscles spasm around Flahne’s prick, milking it with every gasping breath you take. She eases in slowly, giving both of you plenty of time to get adjusted to her girth. You barely notice, but it looks like the busty Rahn’s just as sexually riveted as you are, her chest heaving around your buried head as her hands gently hug and caress your ass, hugging you tight to herself as her cock finally hilts you.");
	
	//If PC has a cock: 
	if(pc.hasCock()) {
		output("\n\nWith such a massive, girthy intrusion pressing down on your prostate, your cock, still buried between Flahne’s tits, twitches and spurts, staining her cleavage [pc.cumColor] with your [pc.cumVisc] seed. With a sly grin, the rahn girl wipes up a bit and licks it sensually from her fingertips. Her cock twitches in your ass, pressing down hard on your sore, battered prostate; you cum instantly, whining as your cock");
		if(pc.cumQ() < 2) output(" shudders and fails to express more than a single drop of [pc.cum].");
		else output(" spurts, shooting a streak of [pc.cumColor] so powerful that it blasts onto Flahne’s chin before dribbling down into her cleavage, pooling around your tip.");
	}
	output("\n\n<i>“Mmm, that’s good,”</i> Flahne grins, licking her lips. <i>“But I’m not done with you yet, my sweet.”</i>");
	
	output("\n\nShe grins and stands, and you find yourself on your back, lying sprawled out on her desk, bodily pushing aside stacks of forms and pens. Flahne lifts your [pc.hips], groping your upturned ass as your [pc.legOrLegs] hook");
	if(pc.legCount == 1) output("s");
	output(" around her waist, pulling her into you. She’s not nearly done yet, if that lusty look she’s giving you is half a sign. You grip the edges of the table as she starts to move, and your teeth grit, breath catching while the rahn starts to well and truly pound your [pc.asshole], stuffing you with thick ovi-cock time and time again");
	if(pc.hasCock()) output(" until your spent prostate screams with pleasure and pain, plaintively spurting milky pre onto your belly");
	output(".");
	
	output("\n\n<i>“Oh, fuck,”</i> Flahne groans, biting her lower lip as she hilts you again, sixteen inches of thick, gelcock buried deep in your ass, <i>“S-so good. You’re amazing, [pc.name]. Best ass I’ve had in ages! Oh, you’ve gotta let me go again. Pretty please?”</i>");
	
	output("\n\nYou groan in dread at the merest thought of taking her cock again, barely able to withstand the current anal assault. But you don’t seem to have much longer: Flahne’s chest is heaving, her breath ragged as she reams you, and her moans grow ever more shrill until she’s crying her pleasure to the heavens, blasting a thick, creamy ooze deep in your bowels. You scream, arching your back as the rahn girl fills you with her eggs and goo, blasting so much into you that it feels as though it ought to be squirting out around her cock - if it weren’t much too thick to let that happen. Instead your belly grows, pumped full of spurt after massive spurt of alien gel-cock ejaculate until you look positively gravid, stomach churning from the unexpectedly massive load being shot into you.");
	
	output("\n\nWith a flourish, Flahne pulls out, grabbing her prong and aiming it dead at your face for the last load. You try to shield yourself, but too late; a nice, thick load of steaming rahn-spooge hits you right on the cheek and dribbles down your face in hot, sticky rivulets.");
	
	output("\n\n<i>“Mmm, now that </i>was<i> a treat!”</i> Flahne cheers, planting a kiss on your cheek - and licking her own eggs right off. <i>“I want you again, [pc.name]... but you need to rest after that... and maybe let some of my cum back out. Don’t want to get too full of me, do you?”</i>");
	
	output("\n\nShe giggles, laughing so hard that her huge tits bounce on her chest");
	if(pc.hasCock() && pc.cumQ() > 2) output(", flicking a bit of your seed off onto the floor");
	output(". You groan in agony at your stomach and her joke, rolling off the desk and leaking everywhere as you search around for your gear. Flahne gives you a little wave as you stagger back, even blowing you a kiss - arms squeezing her boobs enticingly, almost begging you to come back soon and fuck her.");
	processTime(20 + rand(5));
	pc.orgasm();
	pc.loadInAss(flahne);
	flahneFuckCounter(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Get Box Munched
//You suggest that Flahne could take a few licks and see just how long it would take to get to your center... Turns out its 3 bites.
//also incompatible with quadrupeds -Z
public function flahneMunchesBoxesMetalBawkses():void {
	clearOutput();
	showFlahne(true);
	output("Pulling Flahne close, you whisper your request into her ear. The woman blushes, but then smiles coyly. <i>“I don’t mind - I can get you nice and wet,”</i> she returns, rubbing the membranous skin of her lips and drawing her hand away with a strand of moisture to prove her point. She rubs it into your cheek softly, trailing the sweet fluid to your lips, before speaking again. <i>“Just... let me lock these doors and then we’ll have our fun.”</i> She pulls away, her hand lingering on your face until the last, and then walks to each door, proofing it against intrusion.");
	output("\n\n<i>“Let’s get this started then, cutey,”</i> Flahne says as she pops her buttons open one at a time, revealing inch after inch of jiggling boob. When the last fastener is slipped open, the top springs apart completely, falling open to her sides, exposing her nipples in their complete, honeyed glory. The smooth buds, like dark-colored caps, jut just so from the surrounding surface in a way that invites you to touch and squeeze them. Flahne drops her arms and lets the stretched-out shirt slide down to collect in a rumpled pile on the floor.");
	output("\n\nYou let your eyes play over her exposed skin");
	if(!pc.isNude()) output(" while you join her in nudity");
	output(", admiring the smooth expanse of gropable membrane. Flahne’s skirt digs slightly into her body above her expansive hips, giving her a squishy little muffin-top. She sighs as you press gently against her middle, sliding across her slightly-moist skin; brushing the swollen underside of her tits, you heft their weight in your palms while your fingertips disappear into the squishy surface.");
	output("\n\nFlahne wraps her arms around you to pull you close, pressing her tits into ");
	if(pc.biggestTitSize() >= 1) output("yours");
	else output("your chest");
	output(", pinning your hands between your lusty, nude forms. She runs a hand ");
	if(pc.hasHair()) output("through your hair");
	else output("across your head");
	output(" and nuzzles at your neck, extending the barest tip of her tongue to lick your neck, tasting your [pc.skinFurScales]. You feel a telltale ");
	if(pc.wetness() <= 1) output("moisture");
	else if(pc.wetness() <= 3) output("slipperiness");
	else output("drip");
	output(" from your hungry pussy. Flahne breathily whispers, <i>“Please... undo my skirt,”</i> before planting slow kisses up to your jaw.");
	
	output("\n\nThanks to the clasps on the side, the task is more difficult than you would have thought. Then again, perhaps half the challenge is the result of focusing on manual dexterity when your steaming-hot twat is demanding most of your attention. <i>“Come on....”</i> Flahne coos");
	if(pc.isTaur()) output(" as she circles beside you, forcing you to twist to stay with her");
	output(", and one of her hands squeezes your [pc.butt] while the other dives down ");
	if(pc.isTaur()) output("under ");
	output("your [pc.belly] and into your needy box");
	if(pc.hasCock()) output(", narrowly avoiding your [pc.cocks]");
	output(", slipping and sliding all over [pc.eachClit] and outer lips without ever properly penetrating. The pleasure is just too great. You shudder and lose your grip, sagging into Flahne’s heavenly tits for support, their mass bouncing gently around you.");
	
	output("\n\n<i>“I take it you like this?”</i> the overly-endowed creature titters as she guides you towards her recently-vacated chair. You whimper and let your head tip back, allowing her better access to your neck. Spasms press your aching-hot sex against Flahne’s ");
	if(!pc.isTaur()) {
		output("silk-");
		if(flahneDickOut()) output("girded bulge");
		else output("skirted sex");
	}
	else output("palm");
	output(", causing you to grind your ");
	if(pc.hasCock()) {
		output("[pc.cocks] against ");
		if(flahneDickOut()) output("hers");
		else output("her squishy body");
	}
	else {
		output("[pc.clits] as hard as possible against her");
		if(flahneDickOut()) output(" veiled cock");
		if(pc.wetness() >= 2) output(", staining her skirt with your juices");
		if(pc.wetness() >= 4) output(", so much so that your [pc.girlCum] is dripping from the hem down to the floor");
	}
	output(".\n\nFlahne is suddenly pushing you down into her chair. It’s still warm from her body heat, and the cushion squishes wetly beneath you, adhering to your [pc.butt] as you settle in.");
	if(pc.isTaur()) output(" Unfortunately, your body doesn’t fit in a traditional chair very well, and you soon slide out of it. You clamber up and straddle across it, spreading your rear [pc.legs] to give Flahne a decent path of access.");
	output(" The eager gel-girl kneels below you, taking her skirt off without the need for any assistance. She winks as it drops away, exposing her rounded hips");
	if(flahneDickOut()) output(", throbbing cock-like ovipositor,");
	output(" and plump derriere to your roving eyes. Then, her attention turns back to the matter at hand: your hungry quim.");
	//Dick
	if(pc.hasCock()) {
		output("\n\n<i>“I hope </i>");
		if(pc.cockTotal() == 1) output("<i>this</i>");
		else output("<i>these</i>");
		output(" will cum with the rest of you. I’m ravenous,”</i> Flahne teases, licking encouragingly. Tilting down, her mouth leaves your poor boner wet and wanting, but you soon forget about that when her breathing turns on [pc.oneVagina]. [pc.EachCock] is draped across her hair, sinking partway into the soft gel as her movements inadvertently stroke the underside");
		if(pc.cockTotal() > 1) output("s");
		output(".");
	}
	//No Dicks
	else {
		output("\n\n<i>“Too bad there’s no dick here, I could have used a proper snack with this drink,”</i> Flahne teases, licking along the inside edge of your thigh encouragingly. <i>“That doesn’t mean I don’t like a pretty pussy like this one though!”</i> She comes closer and closer until her lips are just inches away; her breath washes across your mons in tantalizing waves, causing your body to spasm and your hips to lurch against her, but she holds you still while she works you to a frenzy.");
	}
	//Merge
	output("\n\nYou paw at your [pc.fullChest], unable to keep your hands still yet unable to find a proper place for them, letting them trace along your [pc.nipples] in idle self-pleasure. <i>“Are you ready?”</i> she breathes, blowing gently across your [pc.clit].");
	
	output("\n\nYou moan, and Flahne doesn’t delay further. The pouty pussy-licker closes the intervening distance with swiftness born of hunger, clamping down around your mound with enthusiasm, lightly sucking while ");
	if(pc.clitLength >= 5) output("[pc.oneClit] burrows down her throat");
	else if(pc.clitLength >= 1.5) output("[pc.oneClit] fills her mouth");
	else output("she brushes against your [pc.clits]");
	output(". You sigh as you finally get the sensuous reward you’ve been craving for the past few minutes, spreading yourself as wide as possible to allow her easier access. The busty gel secretary pushes her tongue between your labia, lapping noisily through your slick passage");
	if(pc.wetness() >= 3) output(" and drinking the heady fluid you freely exude");
	output(".");
	output("\n\nYour body responds to the attentions in the only way possible: twitching your hips with ardent passion, fucking yourself on Flahne’s mouth and tongue. She holds as tightly to your [pc.butt] and [pc.hips] as possible, and her tongue pushes further and further in, coiling around the outer edges of your channel until it forms a tantalizing helix. Flahne pulls her tongue in and out with slow strokes, scraping her flexible organ over every sensitive nerve, methodically finding every single sensitive spot. Whenever she finds a good location and your body juices in her mouth, her eyes twinkle merrily and she moves on, looking for more.");
	
	//Nice
	if(pc.isNice()) output("\n\n<i>“Oh fuck yes, thank you Flahne! Please, lick me harder! Faster!”</i> you beg.");
	//Mischievous
	else if(pc.isMischievous()) output("\n\n<i>“Come on, lick me harder Flahne! Faster! Show me what that tongue can do!”</i> you cajole.");
	//Mean
	else output("\n\n<i>“Faster! Come on, facefuck my cunt! Lick it! Suck it! Make me cum!”</i> you demand.");
	//Merge, no new PG.
	output(" Your hands drift away from your [pc.fullChest] towards her shoulders, and you squeeze them encouragingly. Flahne gives you a knowing look and circles one arm around you to hold you still. With the other, she reaches up to your [pc.nipple]");
	if(pc.hasFuckableNipples()) output(", slipping it inside the moist entrance with a little trepidation. She soon acclimates to your anatomy, matching the motions of her fingerfuck to the rhythm of her tongue");
	else {
		output(", pinching and pulling on it with confident motions. She’s obviously no stranger to nipple play");
		if(pc.hasNippleCocks()) output(", pulling on it until the concealed cock within erects, parting the sensitive skin to bob heavily upon her chest. Flahne wraps her gooey fingers around it begins to stroke it, smoothly polishing your rod to the tempo her tongue has set");
		else if(pc.canMilkSquirt()) output(", and she soon has you squirting and dripping [pc.milk]");
	}
	output(". She goes faster and faster with each passing second. At times, her tongue is pulled out to wrap around your [pc.clit], rolling in circles around the oversensitive organ until you’re seeing white and your eyes have rolled halfway back in their sockets.");
	
	output("\n\nStarbursts of ecstasy are firing off one after another inside your skull, and you’re wondering how much more you can take before you hit the orgasm you so crave. That question is answered when Flahne begins to hum a low note deep in her throat, vibrating her lips ever-so-subtly against your vulva. Your clit is treated to the sensations as well, and when they travel down her tongue and straight into the most sensitive spot Flahne could find, the starbursts turn into a supernova of bliss. A ragged moan tears its way out of your throat. It is unmistakably a sound of exquisite pleasure but at the same time a feral, animalistic enunciation. You scream yourself hoarse, your body quaking in the chair, filling the air with the scent of your [pc.girlCum]. Your convulsions do a fine job of squeezing out the accumulated fluids Flahne soaked into her squishy, soaked seat. Her unmistakably sweet aroma soon joins yours, while droplets of liquid lust splatter on the floor.");
	// Dicks
	if(pc.hasCock()) {
		output("\n\nThe way Flahne’s attacking your [pc.vaginas], she barely notices your [pc.cocks] expanding in her hair, first dripping pre-cum and then lurching, firing long jets of [pc.cum] into squishy curls.");
		if(pc.cumQ() < 25) output(" You quickly spend your phallic passion in her hair, turning it into a slippery, [pc.cumColor] mess.");
		else if(pc.cumQ() < 100) output(" Your lust is slow to ebb, and by the time it recedes, Flahne’s hair is dripping with phallic passion, turning it into a slippery, [pc.cumColor] mess that drips everywhere.");
		else output(" Your virility seems almost boundless. You soak her hair with lewd, [pc.cumColor] ropes. The spunky mess is only just getting started. Her entire head becomes wreathed with jizz. A river of the stuff runs down her back, pooling above her wobbling butt before a trickle slides through her asscrack.");
		if(pc.cumQ() >= 500) output(" You can hear it dripping off of her and onto a puddle on the floor.");
	}
	// Nipplecunt
	if(pc.hasFuckableNipples()) {
		output(" Your [pc.nipple] drips around her fingers in an imitation of your primary pussy, matched in moisture by the other empty one");
		if(pc.totalNipples() > 2) output("s");
		output(". Flahne playfully pulls it out and squeezes on the outside of your areola, milking the slick secretions from your strangely-positioned honeypot.");
	}
	// Nippledicks
	else if(pc.hasNippleCocks()) {
		output(" Your [pc.nippleCocks] spasm at the same time, firing lances of [pc.cum] out with aplomb. They rain down over Flahne as she tends to [pc.eachVagina], splattering across her forehead. She closes her eyes and simply enjoys it, letting her face be painted with the [pc.cumColor] mess.");
		if(pc.cumQ() >= 100) output(" Even after it looks like she’s wearing a spunky mask, you keep shooting, forming a massive puddle beneath her where it drips from her oversized tits.");
	}
	// Milk
	else if(pc.canMilkSquirt()) {
		output(" Your [pc.nipples] abruptly begin to ");
		if(pc.lactationQ() <= 5) output("leak");
		else if(pc.lactationQ() <= 250) output("drip");
		else if(pc.lactationQ() <= 500) output("squirt");
		else if(pc.lactationQ() <= 1000) output("spray");
		else output("unleash");
		output(" [pc.milk] into the air. It falls down onto Flahne’s forehead as she tends to your [pc.vaginas], but she doesn’t mind. If anything, you swear you can see the corners of her mouth quirk enthusiastically");
		if(pc.lactationQ() >= 500) output(", at least, until they’re concealed in [pc.milk]");
		output(".");
	}
	// merge
	output("\n\nFlahne eventually flops back onto her butt, connected to [pc.oneVagina] by a few strings of your [pc.girlCum]. She breaks those with a finger, slurps them down, and then proceeds to lick her plump lips clean with lewd enthusiasm. Her palm slides out of her own stretched slit");
	if(flahneDickOut()) output(" while her wilting ovipositor slowly receeds. The undersides of her tits have been liberally splattered with her sweet spooge");
	output(".");
	output("\n\n<i>“Ahh, nothing like a snack and a cum.”</i> She sets to cleaning up");
	if(pc.wetness() >= 3 || (pc.hasCock() && pc.cumQ() >= 25)) output(", crawling around to lap every drop of fluid up");
	output(". ");
	if((pc.hasCock() && pc.cumQ() >= 25) || pc.hasNippleCocks() || pc.canMilkSquirt()) output("The fluid covering her slowly vanishes, absorbed directly through her skin-like membrane. ");
	output("You nervelessly flop off the chair and onto the floor, but Flahne comes right over, vacuuming up every bit of swampy sex-juice from your body. The gel-woman is happy to help you up, and before long, the two of you are giggling and smiling, flush-faced after having sex in such an unconventional place. Flahne’s juicy ass barely fits back into her skirt, but she manages somehow. She does need your help with her shirt, and you’re happy to help her with the buttons. Unsurprisingly, you can’t manage to button it any higher than it was when you first met. Flahne doesn’t mind.");
	output("\n\nA tingle of fresh lust stirs in your well-fucked vagina as you handle your lover’s big bust, but you manage to suppress it for now. Flahne seems to be flushed a little more orange than normal as well.");
	//Pass 20 minutes
	processTime(20);
	//Cum
	pc.orgasm();
	//Small lust boost.
	pc.changeLust(5);
	flahneFuckCounter(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Desk Munchies
//Requires rahn race discussion has taken place
//Crawl under Flahne’s desk and service her while she deals with other folks.
public function flahneDeskMunchies():void {
	clearOutput();
	showFlahne(true);
	output("Saying nothing, you advance on the endowed woman. Before she can get out of her chair, you pull it away from the desk, leaning over and resting your own hands on her damp armrests to pin the secretary in her seat.");
	output("\n\n<i>“Getting a good look?”</i> she teases. The buxom gel pushes her chest even farther, ");
	if(!pc.canMilkSquirt()) {
		if(pc.biggestTitSize() >= 1) output("almost touching yours");
		else output("almost touching your [pc.chest]");
	}
	else output("touching your [pc.chest] with her nipples as fluid begins to leak from them, turning her shirt translucent");
	output(". Keeping your plan in mind, you slip a hand up to touch her areolae, distracting her as you slowly turn the chair around until you’re between your quivering lover and the desk. Your arms draw back, pulling the chair forward and its occupant into you, and you savor the closeness of your lover as it drives her bouncy melons into your [pc.skinFurScales].");
	
	output("\n\n");
	if(!flahneDickOut()) showImage("FlahneUnderDesk");
	else showImage("FlahneUnderDeskFuta");
	output("Crouching, you slide under the desk, then pull the secretary’s legs in after you, concealing your presence. <i>“[pc.name], what in the hell are you doing?”</i> she asks, clearly perplexed by your hide-and-seek. Instead of replying, you push her knees apart and slip two fingers into her wet snatch, leaning in to slide your tongue ");
	if(!flahneDickOut()) output("over her erect clit");
	else output("halfway up her erect, dribbling ovipositor");
	output(". <i>“Woah, hold up!”</i> the woman gasps. <i>“Someone might come in! Let me go so I can lock the doors!”</i>");
	output("\n\n<i>“Why?”</i> you counter. <i>“It’s not like anyone can see me, and you did say you could get a lot of work done during sex if you didn’t have to focus on your partner.”</i>");
	
	output("\n\n<i>“Did I say anything like that? Oh dear...”</i> Flahne moans, open-mouthed with arousal. <i>“Fine, have it your way.”</i> She scoots forward vigorously, and her body is positioned so closely that you can see her belly being creased inward by the edge of the desk. Obviously, she does not want to get caught screwing around on the job. The smell of sugar hits you a second later, carried from the sodden slit that lies squarely ahead. Up close and personal, you can see that her glossy amber snatch is covered with beads of moisture");
	if(!flahneDickOut()) output(", and the clit is peeping out, fully erect and ready to be stimulated again");
	else output(", and the clit has transformed into a half-floppy prong that would make a whore blush. It’s about twelve inches long now and thick like an over-stuffed sausage. Whitish pre-cum oozes out of her opening already. Unlike a human’s penis, the urethra is perched on a secondary bump atop her glans");
	output(". You’re just starting to run your fingertips up her thighs, tracing gentle touches across the increasingly sensitive flesh, when you hear one of the doors open. Even from down here, you can see Flahne’s skin turn orange with embarrassment, but much to her credit she shows no other reaction.");
	output("\n\n<i>“How may I help you, ma’am?”</i> Flahne asks with a fairly level voice.");
	
	output("\n\nDamn, she’s good. You accelerate your pace, pushing a finger back into her honeyed folds. Flahne starts to groan in response, but she turns it into a cough. Her companion does not seem to notice.");
	if(flahneDickOut()) {
		output(" The neglected ovipositor jerks, dropping a fat wad of pre onto your [pc.face], almost spiteful for being ignored thus far. From down here, you could eat her out or polish her rod");
		if(pc.isAss()) output(", or you could tease her prick until it pops and have a little fun screwing with the new person who showed up too");
		output(".");
	}
	flahneFuckCounter(1);
	clearMenu();
	if(!flahneDickOut()) addButton(0,"Next",eatFlahneOutUnderDesk);
	//[Eat Out] [Suck&Swallow] [Play&Spray(only for semi-bastards)]
	else {
		//Eat Out
		addButton(0,"Eat Out",eatFlahneOutUnderDesk,undefined,"Eat Out","Eat Flahne out from underneath the desk.");
		//Suck off
		addButton(1,"Suck Off",flahneGetsSuckedAndSwallowed,undefined,"Suck Off","Suck off Flahne from underneath the desk.");
		//Play&Spray
		if(pc.isAss()) addButton(2,"PlayNSpray",playAndSpray,undefined,"PlayNSpray","Make a mess and probably get Flahne in trouble. <b>She might not like this very much,</b> but it’ll be fun.");
	}
}

//Eat Out
//If she has a dong, surprise desk bukkake drip.
public function eatFlahneOutUnderDesk():void {
	clearOutput();
	showFlahne(true);
	output("You pry apart Flahne’s dripping entrance while the newcomer drones on about her situation, completely oblivious to the libertine delights going on just below the desk. ");
	if(flags["FLAHNE_LIKE_OVIPOSITOR"] > 0) output("Her ovipositor stiffens at your touches, rising higher and higher, until it stops at a 45 degree angle, smearing her sticky efflux across the hardwood surface above. When she cums, she’s probably going to soak the whole thing, and you. ");
	output("Slowly pulling your fingers free of her glossy entrance, you smear the soaked digits across her mound, squeezing her fat vulvae together so that they form a lusty crease. Your [pc.tongue] comes out almost of its own accord, and you lick across the cunt-cleavage, tasting the sugary sweetness of Flahne’s sticky juices. Somehow, she keeps it together.");
	output("\n\n<i>“...yes, uhmm, just fill me- uh, I mean these forms out, and send them back to me for review...”</i> The last word trickles away into nothing, and you get the idea that Flahne’s eyes must have drifted partway closed during that statement, relaxing as you taste her lewdest orifice. You’ve yet to even touch her ");
	if(flags["FLAHNE_LIKE_OVIPOSITOR"] > 0) output("ovipositor");
	else output("clit");
	output(", instead watching the rivulets of lust soak into her sopping-wet seat, squeezed out of her horny pussy thanks to your grip. You release her sensitive pussy and begin to gently massage her mons, running your lubricated digits down to slip and slide across her labia. Your palm catches on ");
	if(!flahneDickOut()) output("her clit");
	else output("the top of her powerfully engorged, egg-laying boner");
	output(", eliciting a low purr of pleasure from the back of the thick-thighed secretary’s mouth.");
	
	output("\n\nThe sound of the newcomer’s heels clicking away from the desk can be heard, followed by the creak of her seating herself in another chair. Ticks and taps are audible, indicating that she’s elected to deal with her paperwork in this same room. It’s time to try and truly fluster the unflappable rahn.");
	
	output("\n\nSpreading Flahne’s orange-flushed lips apart, you take a good look at her interior, studying the features before you properly begin to pleasure it. Her snatch is slightly darker colored than the rest of her, at least on the inside, and thanks to her body’s semi-transparency you can actually make out a tiny entrance buried deep within it, perhaps an analogue for a cervix. There’s no urethra that you can see, but the walls are sweating lubricant so fast that a tiny stream has formed on the bottom of her channel, trickling out to soak your hand along with her seat. Her interior contracts from time to time, hungrily trying to contact something, anything to squeeze.");
	
	output("\n\nYou give her exactly what she wants when you push a finger inside. As soon as your make contact with her smooth, moist innards, Flahne’s pussy transforms from pliant fuckhole into a squishy organic vise, wrapping your finger in smothering, hot pressure. You’ve no doubt that if you had a dick in there");
	if(!pc.hasCock()) output(" (or one at all)");
	output(", you’d be unable to restrain yourself. Flahne’s pussy sucks around your proffered finger, hungrily drawing it deeper. Though she has squeezed tight around it, you push a second finger inside, finding that there’s plenty of give when it comes to adding to the gel-woman’s penetration. Her ");
	if(!flahneDickOut()) output("clit puffs up a little in response");
	else {
		output("ovipositor squirts out a rope of slimy pre-jizz ");
		if(!pc.hasHair()) output("onto your head");
		else output("into your [pc.hair]");
	}
	output(". Flahne’s whole body is blushing brighter and brighter orange with each touch.");
		
	output("\n\n<i>“Miss... Flahne. It is Flahne right? Are you okay?”</i> a feminine voice asks.");
	output("\n\nYour efforts must be having some kind of visible effect. Flahne gurgles out, <i>“I... ooohhuummm... I’ll be o-ooohhhhh-kay. D-don’t worry.”</i> Since it sounds like she’s starting to lose it, you push a third finger into the juiced-up snatch to reward her. She grunts noisily, rocking in her chair at the sudden penetration.");
	
	output("\n\nThe voice sighs and says, <i>“No, I don’t think you are. I’ve met other rahn before, and you’ve turned bright orange since I’ve been here. You’ve got to be coming down with something. Why don’t we go find a nurse droid, and I can finish the paperwork while she checks you over.”</i>");
	
	output("\n\nWith a bemused smile, you lean down and slide your [pc.tongue] up one slippery, peach-hued fold to her ");
	if(!flahneDickOut()) output("clit. You let your moist muscle roll across her bud again and again, sometimes sliding it down to join your fingers,");
	else output("phallic tool. You let your moist muscle slide up and down the first few inches of it, polishing it with your saliva, sometimes sliding back down to join your fingers in her swampy crevice,");
	output(" collecting her oozing honey for a sweet swallow. Flahne’s lust runs more and more freely");
	if(flags["FLAHNE_LIKE_OVIPOSITOR"] > 0) output(", and the sticky droplets of her pre-cum seem to be falling in a steady stream");
	output(". She’s getting close... all you need to do is go a little bit faster and she’s going to be putty in your hands.");
	
	output("\n\nFlahne tries to protest, <i>“Please... please more... uhh,”</i> She collects her thoughts. <i>“I mean, please, fill out all your forms. Ooooohhhh!”</i> A sucker falls from her slack jaw onto the floor nearby.");
	output("\n\n<i>“No. Come on,”</i> comes the voice again, <i>“There’s something wrong with you.”</i> Heels clatter closer to you, so you begin to thrust your fingers to the timing of each footstep. Flahne slouches down in her chair, scooching her cunt closer to you, eager for more. It seems she’s given up all sense of propriety by this point. She’s grunting and groaning low in her throat. Her thick thighs are trembling to either side of you, so you grow more aggressive in your busy tonguing of her syrupy slit.");
	
	output("\n\nThe footsteps are almost there. ");
	if(flags["FLAHNE_LIKE_OVIPOSITOR"] > 0) output("You grab Flahne’s dick and start jacking it, flicking your tongue back and forth where it emerges from her swollen twat.");
	else output("You suck Flahne’s clit into your mouth and begin to flog it, lashing your tongue back and forth across it, battering it with oral attention.");
	output("\n\n<i>“Whaaa...”</i> the voice starts, trailing off almost immediately. Flahne cries out and lifts her hips clear of the seat, allowing you to see how soaked she’s made the cushion. Strings of her lubricant hang between her butt and the chair, breaking one after another from Flahne’s orgasmic convulsions. Puffing up, her pussy begins to gush lubricants over your hand and mouth, leaking a steady stream of her honeyed ladyspunk with abandon. Flahne’s arms flail, knocking over some of the things on her desk, and she babbles, <i>“Harder! Harder!”</i>");
	
	output("\n\nA shadow falls across your source of light, ");
	if(!flahneDickOut()) output("and you briefly make eye contact with a purple-skinned alien. You manage to smile around the mouthful of quim.");
	else output("but sixteen inches of quivering, ejaculating orange tool block your view of the figure, and vice versa.");
	output(" She stammers, <i>“I-I... I... ummm... I’ll be back later! Sorry!”</i> and darts away.");
	
	output("\n\nFlahne moans loudly, and gushes again, shaking from head to toe. It’s marvelous to watch, as her semi-fluid body undulates rather pleasantly through her orgasm.");
	if(flags["FLAHNE_LIKE_OVIPOSITOR"] > 0) 
	{
		output(" Above, her cock-like organ bloats and explodes, pumping huge blasts of white-hued cum out like some kind of cannon. The jizz-bombs splatter off the top of your enclosure, sticking to the underside of the desk briefly before raining spunk over your entire body. You ignore the one-woman bukkake show and keep going, ensuring that Flahne has as torturously long an orgasm as possible.");
		pc.applyCumSoaked();
	}

	output("\n\nHer thighs clamp down on either side of you, surrounding you in squishy, jiggling flesh, compressing your mouth even harder against her gooey mound. Closing your eyes, you drink her girlish ejaculate until her body relaxes and releases you.");
	
	output("\n\nPushing out from under the desk, you stretch out with a satisfied grin on your face. Flahne is panting, her eyes heavy and lidded. She whimpers softly as she turns to regard you. <i>“I might have been exaggerating about my focus... a little.”</i> You smile up at her");
	if(flags["FLAHNE_LIKE_OVIPOSITOR"] > 0) output(" as she steps up after you, immediately licking her spattered ejaculate off your body. <i>“So yummy....”</i>");
	
	if(flags["FLAHNE_LIKE_OVIPOSITOR"] > 0) output("\n\nTen minutes of cleaning later...");
	else output(".");
	
	output("\n\nFlahne rolls her skirt back down and suggests, <i>“I guess we just need to practice this a little more often.”</i>");
	
	output("\n\nBuzzing a little from all the sugar you just swallowed, you enthusiastically agree.");
	
	//Unlock Gardeford's Exhibitionism Fucks
	flags["FLAHNE_EXHIBITIONISM_UNLOCKED"] = 1;

	//+lust, big MP gain
	pc.changeLust(5+rand(5));
	pc.exhibitionism(1);
	//Just grabbing a random girl to squirt some ladycum on in...
	pc.girlCumInMouth(chars["KIRO"]);
	//Pass 20 minutes + 10 if she licks you clean.
	processTime(20);
	if(flags["FLAHNE_LIKE_OVIPOSITOR"] > 0) processTime(10);
	clearMenu();
	addButton(0,"Next",mainGameMenu)
}

//Suck&Swallow
public function flahneGetsSuckedAndSwallowed():void {
	clearOutput();
	showFlahne(true);
	output("You squeeze her shaft right around the base to remind it who’s boss before taking pity on it, relaxing your grip and arching it down to be properly tended to. It wouldn’t do to have her burst all over the bottom of her desk, creating a rain of white that would completely cover you. Well, that might not be too bad, but you’re not gonna let that happen today.");
	output("\n\nFlahne’s flexible boner is easy to wrangle up to your mouth. It even drips a few strands of white onto your lips, growing a bit fatter in your hand as you hold it. Its owner shudders slightly, sending a ripple through her luxurious thighs all the way down to her feet, shifting position so that her wet gash hangs just over the edge of the seat, its golden lips still expanding with lust. You rub her twat with one hand while slowly beginning to pump her cock-like ovipositor with the other, testing the gel-woman’s self-control as well as you can.");
	output("\n\nThroughout this, she’s still carrying on a conversation with an unnamed woman, though the first stroke along her dick causes her to pause for a deep breath of air.");
	output("\n\n<i>“...yes, just fill out these uhm, forms and send them back to me for review...”</i> The last word trickles away into nothing, and you get the idea that Flahne’s eyes must have drifted partway closed during that statement, relaxing as you masturbate her. You’ve yet to actually put her ovipositor into your mouth at all, instead watching her drip whilst manipulating her genitals, collecting it in the palm of your hand for lubrication. Jacking her off like that does make audible squishing noise that you hope isn’t too loud up above... but then again, who cares? You squeeze her tool a little more firmly and gently guide the tip up to your lips, puckering up as it presses against you for a wet, messy cock-kiss.");
	output("\n\nFlahne’s latest customer can be heard walking over to another chair, seating herself and humming softly to herself as she clicks away. You let your mouth part into a tiny ‘o’ as you accept part of your gel-girl lover’s cock into your mouth.");
	output("\n\n<i>“Oooohhhh,”</i> Flahne groans.");
	output("\n\nYou can almost picture the woman across the room looking up as she asks, <i>“Flahne, was it? Are you okay? Do I need to find a nurse droid?”</i>");
	output("\n\n<i>“I’ll be... I’ll be okay,”</i> Flahne mutters, aiming a light kick at you. Her leg is so soft and squishy that it doesn’t really do much but cause the parts of her cock you’ve swallowed to halfway escape. You lunge back down far enough to suitably engulf it again, which predictably causes Flahne to quietly whimper once more.");
	
	output("\n\n<i>“Are you sure you’re okay?”</i> the mystery person asks. Her chair creaks when she rises, obviously standing up");
	output("\n\nYou slide two fingers into her slit and begin to rub your palm across her entrance, curling your digits to press against her walls. <i>“I-I’m tuh... totally... f-fine!”</i> Flahne protests while rocking her hips closer, pushing another inch of cock into your mouth. <i>“Just... ohhh, uh... fine. Feeling a little faint is all.”</i> You flatten your tongue, pushing it back and forth along the underside of six inches or so you’ve taken inside you. Your other hand continues to work the remaining ten inches of shaft, though with less area to work with, you’re forced to make shorter, faster motions. Pre-cum is running almost continually from her tip at this point, forcing you to swallow and gulp to avoid letting it flood down your throat.");
	
	output("\n\nThe female voice asserts, <i>“Look, I’ve met a couple rahn before, and what’s going on here isn’t normal. You’re a loo’rahn, right? You’re very flushed, and quite frankly, it sounds like you’re about to pass out. Come on, let’s get you to the doctor. I’ll finish the forms while I wait on you, okay?”</i>");
	
	output("\n\n<i>“N-n-noooo,”</i> Flahne stutters as her thighs spread wider of their own accord. <i>“Just, fill out t-the formmmm... uh.”</i> You slip a third finger inside her vagina while moving your other hand even faster. ");
	if(pc.hasFaceFlag(GLOBAL.FLAG_MUZZLED)) output("Thanks to your muzzle, you don’t have much problems accepting a few more inches into your mouth. ");
	output("Her member is getting thicker and bobbing every second or two, while her slit squeezes down around your fingers like a nicely-padded vise. She’s just about to pop.");
	output("\n\nFootsteps begin coming closer. With each percussive step, Flahne’s body becomes more tense, and her phallic organ grows thicker, though it remains softer and pudgier than you would have thought. It’s now or never. You slip your pinky inside her and slide your tongue from side to side, starting to gently suck on it, trying to draw the cum out of her by using your mouth like some kind of spunky vacuum cleaner. Flahne groans.");
	output("\n\nThe other woman isn’t far away. Maybe two or three steps. You hear her heels click alongside the desk.");
	
	output("\n\n<i>“You aren’t oka...”</i> The words trail into nothingness. Flahne is looking right at her, but you see the rahn’s eyes suddenly flutter closed. She lurches her hips powerfully, ramming an extra two inches into you, pushing straight into your throat. At the same time, the base swells, and hot globules of jizz pass through it, coming out in one huge, throat-filling surge of spooge. You try not to gag while she pumps into you, swallowing as fast as you can, dimly aware of a cute alien peering around the edge of the desk to watch you suck cock. Somehow, you keep your movements going, stroking her off to keep the cum coming.");
	
	output("\n\n<i>“I... I’ll come back later,”</i> comes the embarrassed voice. Flahne loses it at that point and grabs your head, pulling you down to the base, her dick easily deforming to slide the whole way down your throat. She moans loudly, and you hear the sound of retreating footsteps. Cum pours into your belly in an unrelenting tide, sugary and sweet, practically making your head swim with the sheer amount of energy forced into your digestive system.");
	
	output("\n\n<i>“Oh, OH FUCK YES! Swallow it! Drink that cum!”</i> Flahne cries as she slowly throat-fucks you, spending nearly twenty seconds filling you with eggs. Immediately after, her ovipositor yanks out, stringing long syrupy strands behind it as it dwindles down to the size of a clit. You swallow the leftovers and gasp for your breath. Flahne is so orange that she’s nearly red and hyperventilating, slowly fingering her pussy as she moans incoherently to herself. Her eyes are half-rolled back, but when you climb out from under the desk, she shudders and glances your way with a pout.");
	output("\n\n<i>“Okay, maybe I exaggerated my abilities a little.”</i>");
	output("\n\n<i>“A little?”</i> you ask.");
	output("\n\nFlahne rolls her skirt back down, barely caring that the bottom of it is as soaked as her seat. She shivers and answers, <i>“Well, maybe we just need to practice a little more?”</i>");
	output("\n\nMaybe...");
	//+lust, big MP gain
	
	//Unlock Gardeford's Exhibitionism Fucks
	flags["FLAHNE_EXHIBITIONISM_UNLOCKED"] = 1;
	pc.exhibitionism(1);
	//Pass 20 minutes.
	processTime(20+rand(3));
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Play&Spray
public function playAndSpray():void {
	clearOutput();
	showFlahne(true);
	output("A devilish idea takes shape as you hear the door behind you slide open and high-heeled footsteps click across the floor. Taking Flahne’s dangling organ in hand, you stroke it languidly, collecting moisture from the tip and smearing it along the length. You can see her seat shift uneasily as you work the shaft in time to the visitor’s footsteps.");
	
	output("\n\n<i>“Welcome to the Mhen’ga Port Authority, Esbeth Station,”</i> the slightly-stricken secretary says. <i>“Have you filled out your visitor’s paperwork yet?”</i>");
	output("\n\n<i>“Ah, no. I need to do that. Can you send the forms to my PDA?”</i> the newcomer answers. Its on-edge feminine voice only heightens your anticipation.");
	
	output("\n\n<i>“Very good, I’ll transmit them. You may fill them out here or return to your ship.”</i> Flahne’s voice is still somewhat level, and you slide two fingers cruelly into her pussy to break her concentration; beads of sweat form on the rahn’s chubby thighs, demonstrating the effect you’re having despite her attempt to remain in control. The footsteps withdraw, but no door sound announces the departure of the guest. Apparently it’s decided to fill out the forms here in the office. Leaning low while working the gel’s hole, you peek under the edge of the desk; a slim pair of light blue legs is sitting in a chair, emerging from a gray skirt and tucking into a pair of low heels. Of the face you can see nothing, but judging by the posture of the presumably female alien, she’s completely immersed in the paperwork.");
	
	output("\n\nTaking that as your cue, you unbend and return to the rahn’s pseudo-cock, now firm and spanning its entire 16-inch length. You playfully bend it low and give the head several kisses under the pretense of pleasing your lover, all the while eyeballing its angle and testing its flexibility. Satisfied that your plan will work, you return to stroking the shaft as you roll the head on your tongue, intent on bringing the overconfident rahn off before her guest can leave.");
	
	output("\n\nA soft moan issues from above the desk, and you can hear the blue woman adjust herself in the chair. <i>“Excuse me... are you all right? Your color has shifted quite a bit since I’ve come in.”</i>");
	
	output("\n\n<i>“N-no,”</i> your plaything answers, <i>“I’m fine. D-do you have any questions about the forms?”</i>");
	
	output("\n\nOh, clever bitch! She’s trying to distract herself from your ministrations with boring office minutiae. Escalating your efforts, you pop the crown of her ovipositor into your mouth, rolling it around and provoking a shudder from your tormented victim. The visitor unknowingly helps you, mumbling a negative reply to Flahne’s question, and you up the pace of your strokes. The slutty secretary drools a few more drops of her lubrication from her rod, and you rub your tongue into the slit, causing her to squeeze her knees together with a low hum. The yielding goo of her thighs presents little resistance, and you intensify the search of her pussy as well.");
	
	output("\n\n<i>“G-god,”</i> Flahne whispers, a little too loudly. <i>“Too much...”</i>");
	
	output("\n\n<i>“Pardon?”</i> comes the voice of the newcomer.");
	
	output("\n\n<i>“I s-said, I know it can seem like too muh-much at once, but having these forms on file is essential if something should happen to you on the planet - bad or goo-ood!”</i> Your plaything’s voice peaks on the last word as she tries to cover her outburst, and you can hear the visitor shift uneasily in her chair.");
	
	output("\n\n<i>“Yes, I know that; standard affair. But I do think you should let me call for some assistance... you’re almost red and shivering quite badly.”</i> As well she should be; you’ve shifted gears and have slid ");
	if(pc.biggestTitSize() >= 1) output("her pseudo-prick between your [pc.chest]");
	else output("a finger slowly into her stretchy urethra");
	output(".");
	
	output("\n\nFlahne slurs her answer unconvincingly and loudly as you fuck the slick, oozing rod with your ");
	if(pc.biggestTitSize() >= 1) {
		if(pc.hasFuckableNipples()) output("tits, slipping the head into one of your drooling nipplecunts");
		else output("tits, teasing it with your pressed-together [pc.nipples]");
	}
	else output("finger, rubbing it from the inside");
	output(". <i>“Not... not necessary. I’m fine, really. I’ve never f-felt better. Ohh, I feel so good I could just die!”</i>");
	
	output("\n\n<i>“Yes, that’s what I’m worried about!”</i> says the newcomer. Flahne’s poor word choice returns to vex her as the woman gets out of her chair and approaches the desk again. You can hear her setting her PDA down above you, and the desk jars slightly. <i>“You need to come with me so we can get you some medical attention!”</i>");
	
	output("\n\n<i>“L-let me go!”</i> Flahne cries, twisting at the waist. <i>“I won’t... I won’t come!”</i> Her throbbing prick tells another story; you can feel it twitch in your hand as it gets ready to unload. Leaning down and aiming it through the crack at the woman’s legs, you stroke your hardest, forcing the rahn to climax. <i>“Stop! No, nononono-”</i>");
	
	output("\n\nHer voice trails off into a long ‘oh’ as her spasming ovipositor erupts with sticky white cum, spraying it out of the gap, and the visitor’s becomes a shriek as you cover both her calves in Flahne’s jizz. <i>“What the- woah!”</i> she cries, trying to step back from the sudden warmth but slipping on the slimy goo. With a grunt, she lands on her butt, planting her hands on the floor and spreading her legs for stability.");
	
	output("\n\nIt’s doubtful she would have done so if she knew you were there, because the sight that greets you as her skirt rides up is pristine; the alien visitor is wearing no panties either, and a smooth blue pussy peeks out at you from between her thighs. It’s no wonder she was so uptight and nervous - she likely took them off for a cheap thrill!");
	if(pc.hasCock()) output(" With [pc.EachCock] rock-hard at the sight, you lose yourself in the heat of the moment; y");
	else if(pc.hasVagina()) output(" With [pc.eachVagina] hot with your own desires but too awkward to reach, you focus on the proxy in front of you; y");
	else output(" Y");
	output("ou bend and stretch Flahne’s ductile rod as low and as far forward as it will go, nearly brushing the blue slit with her head, and her next squirt of cum is aimed right between the woman’s legs and into her cute little pussy, coating her labia. Three strokes fire into it before the woman reacts, knocking Flahne’s ovipositor away with her hand and covering herself.");
	
	output("\n\n<i>“What...”</i> the blue visitor begins, pulling her hand back up to her face as Flahne’s extended prick squirts the last of her orgasm. <i>“...is this cum? Did you just cum on me? Oh my God, did you get it inside me? What the FUCK!?”</i>");
	
	output("\n\n<i>“N-no,”</i> Flahne replies in a startled voice that suggests her eyes are as wide as plates.");
	
	output("\n\n<i>“Oh my God,”</i> repeats the woman, not hearing a word as she slides her jizz-covered fingers thoughtlessly inside her pussy. <i>“You did! You fucking came inside me! What if I get pregnant from this, you stupid bitch?”</i> The irate blue girl grabs the end of Flahne’s prick, which responds by squirting weakly on her wrist and then shrinking. <i>“Is this a dick? I thought you were a woman! What kind of freak are you that you rub one out and come inside some woman who walks into your office to do business?”</i>");
	
	output("\n\n<i>“It’s not cum,”</i> the secretary says nervously, <i>“so relax. It’s just lubrication and unfertilized eggs. You can’t get pregnant from it... sorry, but I’ve been feeling bothered since you came in. Er, maybe it’s an allergic reaction?”</i>");
	
	output("\n\nThe blue visitor seems to calm down at Flahne’s misdirection. <i>“Not cum? So it’s safe?”</i> Visible only to you, her hand slips down to her pussy and begins rubbing the soaked labia. <i>“Well, I should say you’re lucky! If I had gotten knocked up, I’d be back here with your baby in one arm and a policeman on the other! You really ought to see a medic about that.”</i> Her fingers plunge deep into her pussy, forcing the warm, false cum deeper inside herself even as she pretends to be upset. What a piece of work!");

	output("\n\n<i>“Yes, I’ll do that,”</i> Flahne responds. The blue girl works her opening a bit more, but when it becomes apparent that the fake argument won’t last any longer, she pulls her hand away reluctantly. With a slippery scramble, she gets to her feet and pulls her skirt back down, then snatches her PDA off the desk and turns for the door.");
	
	if(pc.personality <= 90) output("\n\nWell, that went in a strange direction. As Flahne scoots her chair out, you extricate yourself without a word. She responds with the same silence until you’re on your feet again.");
	else output("\n\nAs Flahne scoots her chair out, you dutifully force yourself to ");
	if(pc.hasCock() || pc.hasVagina()) {
		output("stop touching your ");
		if(pc.hasCock()) output("erect [pc.cocks]");
		else output("drooling [pc.vaginas]");
		output(", ");
	}
	output("suppress your giggles");
	if(pc.hasCock() || pc.hasVagina()) output(",");
	output(" and give her your best doe-eyed innocent face. She doesn’t even say a word until you extricate yourself from the desk and perch on the edge of it.");
	
	output("\n\n<i>“Dammit, [pc.name], you stupid...”</i> Flahne swears, in an uncharacteristic breach of her cheerful character. <i>“Of all the things you could have done... don’t think I’ll be speaking to you any time soon! Get out of my office so I can clean up and try to salvage my professional pride.”</i>");

	output("\n\nWith nothing else to say, you dutifully exit the office and are not terribly surprised when you hear the click of the door right behind you.");
	
	//gain like 100 lust and some lib, become slightly meaner in personality, Flahne gets mad and won’t talk to you for a while, Play&Spray is off-limits for a good long while/permanently (or maybe even all the desk-play is similarly restricted if you want to be thorough)
	pc.changeLust(10000);
	pc.libido(2);
	processTime(20+rand(10));
	//100 hours of pissed!
	flags["FLAHNE_PISSED"] = 100;
	flags["FLAHNE_DESK_DISABLED"] = 1;
	currentLocation = "ESBETH'S NORTH PATH";
	pc.exhibitionism(2);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Fuck n’ Suck (Flahne Autofellates)
//Written by Gardeford1
//Autofelatio option:
//requires ovipositor OK’d, ovipositor out
public function fuckAndSuckWithFlahne():void {
	clearOutput();
	showFlahne(true);
	author("Gardeford");
	output("<i>“I know something fun,”</i> you tease, sliding a finger down Flahne’s straining cleavage. <i>“But you should probably lock the doors unless you don’t mind more people joining in.”</i>");
	
	output("\n\nFlahne colors a bit as her hand slides between her breasts to cup yours. <i>“Oh nooo, that would be awful. I’m a one-" + pc.mf("man","woman") + " rahn, through and through,”</i> she giggles, answering in a sing-song voice that drips with insincerity. She pulls your finger free and licks it salaciously, then releases you and steps over to the door. With a click, she locks each one via the panel, and then returns to you. <i>“I’m all yours, you greedy " + pc.mf("boy","girl") + ".”</i>");
	output("\n\n");
	
	showImage("FlahneRecliningFuta");
	output("You reach around the wonderfully soft gel secretary rubbing against you and grasp her plushy butt with both hands. Her ovipositor pokes your stomach as you gently lift her to sit on her desk. The translucent amber shaft oozes slightly at the tip, letting you know that it’s ready and raring to go. You don’t really feel like making use of the magnificent member yourself, but an interesting idea stirs on your mind. You ");
	if(!pc.isNude()) output("strip out of your [pc.gear], revealing [pc.oneCock] and grinning at the prone beauty.");
	else output("slide your hands sensually down your body, rubbing [pc.oneCock] till it hardens nicely.");
	
	output("\n\n<i>“Did you want me to put my ovipositor away?”</i> Flahne asks you with a curious look. She rubs the pulsing ovi-cock, causing a dollop of pre to leak out and trickle down to her waiting fingers. With a sly smile, you brush a finger from its tip down to the base, then push it between her enormous tits. The gold-hued girl shivers and grins with delight, stroking it to free her first secretions as she unbuttons her shirt, then parting her legs to reveal her lust-inflamed pussy.");
	
	output("\n\nYou move up to the desk and lean in close, helping to undo the last few buttons on the gel girl’s top. As soon as you finish the last straining one, the massive globes fall free. Your first hand catches one of the breasts as it falls, sinking into the heavenly soft mass, while the other slides down to her waiting slit. The soft flesh parts easily as you trace your fingers around the entrance to her vagina; her slick juices coat them and you can smell the sugars permeating the air around the two of you.");
	
	output("\n\nFlahne moans as you rub in circles around the base of her clit-dick. You move the hand that was caressing her tit-flesh, tugging on the nipple before moving to hold her hip and line your " + pc.cockDescript(x) + " up with her waiting slit. Rubbing around the edges, you make sure her sugary lube coats you for the coming penetration. Flahne’s breathing has become heavy, and she tightly grips her own member, squeezing the squishy prick and slowly sliding her hands up and down.");
	
	var x:int = pc.cockThatFits(flahne.vaginalCapacity());
	if(x < 0) x = 0;
	output("\n\nYou lean back and line your " + pc.cockDescript(x) + " up with the entrance to her depths. The head pushes apart her labia and rubs at the hole. <i>“" + pc.mf("Mister","Miss") + " -ahh- Steele, stop teasing and stick it in already,”</i> the gel girl whimpers, spreading her legs wider. You grin at her and sink both of your hands into her plush assflesh, pulling yourself into her. Her pussy yields as you sink into it; the slick juices lining her walls make it easy to push as far as you want. As you sink deeper, you begin to rock your hips, sliding in and out of the tightening hole. Flahne begins to moan, increasing in volume as you continue. Her ovipositor is now leaking a steady stream of pre, causing her hands to slide faster and faster as time passes.");
	pc.cockChange();
	
	output("\n\nAfter a few more thrusts it seems her hands alone aren’t enough, and Flahne slips the tip of her ovipositor into her mouth to catch the sweet liquids before they escape. Her amber rod muffles her moans, but you can feel the vibrations of her voice traveling through her jiggling body. Whenever her mouth slides up to wring out the candy-flavored precum her pussy tightens in unison. The juices from her gash drip, wasted, onto the desk and permeate the air with her sweet smelling fragrance.");
	
	output("\n\nYou quickly move some important-looking papers away from the expanding puddle of gel fluids as you continue to plumb Flahne’s deepest parts. With every thrust your [pc.hips] slap against Flahne’s jiggling butt, causing small splashes to coat your [pc.legOrLegs], and with every outward pull the entrance of her vagina sucks at you, wringing your " + pc.cockDescript(x) + " for all it’s worth. On the way back in, her insides wrap your member in velvety softness. Every few moments you see Flahne’s long tongue snake into the translucent golden shaft and return with a glob of its pearly liquids.");
	
	output("\n\nThe gel secretary removes her hands from her ovipositor in favor of sliding more of it into her mouth. Her lips form a suction hold on her shaft that you imagine feels much like the one her vagina is giving yours. Flahne’s arms transition to holding her legs up and apart while you squeeze her plush ass harder. You increase the speed of your thrusts, sliding into the gel-pussy with fervor, and slide your hands slowly across the gel girl’s squooshy alien flesh, savoring the feeling against your [pc.skinFurScales] as you make your way toward her chest.");
	
	output("\n\nYou inch your hands up and around her tantalizingly soft breasts, squeezing them as she bobs up and down from her blowjob and your pounding. Brushing the sides with your fingers, you eventually reach the squishy nipples. With a soft tug her G-cups fluff around and encase her shaft completely. You begin to rub them up and down against the twitching ovi-cock. Flahne’s eyes begin to lose focus as her massive tits engulf her equally massive member, and the flow of juices issuing from her nethers increases even further.");
	
	output("\n\nIn short time, you feel the pressure welling up in your ");
	if(pc.balls > 0) output("[pc.balls]");
	else output("groin");
	output(" and thrust as deep into Flahne’s jelly-like box as you can muster. [pc.OneCock] explodes inside her ");
	if(pc.cumQ() <= 200) output("lining her walls with your [pc.cumColor] jizz.");
	else output("distending her stomach with your [pc.cum].");
	//if multicocks:
	if(pc.cockTotal() > 1) {
		if(pc.cockTotal() == 2) output(" Your unused cock sprays its load into Flahne’s face and legs.");
		else output(" Your unused cocks spray their loads into Flahne’s face and legs.");
	}
	output(" The butterscotch beauty’s rod erupts like a volcano in her throat. Her eyes roll back in her head as she swallows as much as she can, but despite her best efforts, some of the gooey rahn cum spills out of her mouth and drips down her cock.");
	if(pc.cumQ() >= 1000) output(" Your dream-like virility erupts over and over from your [pc.cocks], and each fresh glob of semen is quickly sucked up by the rahn’s greedy pussy. Even as you spray enough cum into her to double her volume, her ovipositor’s orgasm keeps pace, pumping her own sexual fluids back out in a perverse osmosis. Rather than swallow it all, the groaning woman quickly gives up and points it over her head, allowing her egg-cum to cover her hair and the ground behind her with sticky ropes. Her prick continues to spasm as long as yours, barely maintaining her size - though not her color, as she’s thoroughly [pc.cumColor] by the end.");
	
	//if knot
	if(pc.hasKnot(x)) {
		output("\n\nYour knot engorges within the snug ring of her sex, preventing you from pulling out. Every time you attempt it a little more of your jizz spurts into Flahne’s belly, causing aftershocks to travel up her ovipositor and down her throat. You spin around for better leverage, moving the swivel chair beneath the two of you. Flahne slides off her desk when you pull and lands on the seat cushion. Your knot pops out of the amber-colored girl with a loud, wet sucking sound");
		if(pc.cumQ() >= 500) output(", and jizz follows from her abused hole, leaking around your shaft and pooling on the chair");
		output(".");
	}
	else output("\n\nYou pull free of the gel secretary’s hole and she lets her legs fall; small globs of your cum escape from her hole, but her body rushes to absorb it and most disappear before leaving her skin.");
	output(" She lifts her head as soon as the flow from her ovipositor stops, and it droops to one side. Insatiable, her lips wrap around [pc.eachCock] to suck out any remaining jism. <i>“Mmmm, your cum’s much better than a sucker, [pc.name]. You’d better be back soon,”</i> she says. Flahne pulls a new skirt and a small towel out of a drawer in her desk; you take the towel and mop up as much of the fluid-stained desk ");
	if(pc.cumQ() >= 500) output("and floor ");
	output("as you can while Flahne changes into her new skirt.");
	flahneFuckCounter(1);
	pc.orgasm();
	flahne.loadInCunt(pc, 0);
	processTime(30+rand(10));
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}


//Female: hugz
public function flahneExhibitionHugsGirls():void {
	clearOutput();
	author("Gardeford");
	showFlahne(true);
	output("You revel in the feeling of the gel girl embracing you and ");
	if(pc.isNaga()) output("slither");
	else if(pc.isGoo()) output("ooze");
	else output("stand");
	if(!pc.isTaur()) output(" from your chair");
	else output(" move from your place");
	output(" to return her affections. Giving her a sly look, you ");
	//if first time:
	if(flags["HUGGED_FLAHNE"] == undefined) {
		output("mention that she didn’t seem particularly upset when someone walked in on the two of you having sex. You run a finger along the bottom of her gooey hair and ask if she has a bit of an exhibitionist streak.");
	}
	//after times:
	else {
		output("ask if she’s up for more exhibition, since the last time went so well after all.");
	}
	output(" You walk to the door and undo the locks before sauntering seductively to Flahne’s desk-chair");
	if(!pc.isNude()) output(", dropping your clothing as you go");
	output(". When you reach the chair you swivel to face her and crook your finger to beckon her over. The luscious gel-girl glances nervously at the door for a moment before walking slowly to stand before you.");

	output("\n\n<i>“Don’t worry about the door for now. Just sit here with me and I’ll make you forget it,”</i> you say, giving Flahne your best bedroom eyes. The nervousness begins to fade as she hooks her legs through the chair’s arms to sit on your lap. Her goldenrod flesh is warm against your [pc.skinFurScales], and as you undo her top her breasts press against your [pc.chest] like soft pillows. You slip your hand between her parted legs and dip two fingers into her pliant gelpussy, ");
	if(!flahneDickOut()) output("using your thumb to rub her budding clit.");
	else output("rubbing your thumb against the base of her ovipositor.");
	output(" Flahne moans loudly, but covers her mouth and looks over her shoulder at the door, her lack of nerve still apparent.");

	output("\n\nUsing your other hand, you turn the gel-girl’s face back to you and give her a big kiss. Her saliva tastes as sweet as the candy she eats, and her worries seem to melt as her tongue swirls around with yours. Flahne wraps her arms around your shoulders and presses herself tightly against your body, her G-cups mashing against your [pc.chest]. The horny secretary moans into your mouth as your fingers rub the inner walls of her vagina. You guide one of her hands down to [pc.oneVagina]");
	if(pc.hasCock()) output(", sliding it against your hardening [pc.cockNounSimple] as you do so");
	output(". Her fingers feel cool as they enter you, eliciting a small gasp followed by a sigh of pleasure.");

	output("\n\nYou lift one of Flahne’s wonderful golden pillows to your mouth, reveling in their softness. The feeling of pure bliss as your fingers sink into the honey colored gel is heavenly. Giving the gel-girl a seductive look, you take one of her coppery nipples and roll it around your tongue. She returns your gaze and coos quietly as her nipple is pulled around by the suction of your lips. You make a satisfied hum and press your face into her chest, breathing in her fruity scent as your tongue plays around with her teat. Flahne pulls her hand up from your sex");
	if(pc.hasCock()) output(" - sliding it along your throbbing member as it goes -");
	output(" and licks her fingers with an exaggerated hum of pleasure before returning the hand to your pleasure hole.");

	output("\n\nPulling your face back from the gel-girl’s cushiony breast, you slide your mouth toward her cleavage, and kiss the center of her chest. She shivers and sighs with approval, but you change direction, making light kisses up her neck and ");
	if(!pc.isAss()) output("playfully nibbling");
	else output("biting");
	output(" her lower lip. The leather of the chair beneath you is slick with your combined juices, and Flahne begins to slide back and forth on your hips as her pelvis gyrates around your fingers. A steady stream of her liquid sugar dribbles down your hand to drip from your wrist, and you mimic her earlier action, licking the sweet juices from your fingers before returning them to her nethers.");
	if(!flahneDickOut()) output(" As you lower your hand you slide your palm along her twitching ovipositor, a steady trickle of candied pre-cum making it extra slippery. You circle a finger teasingly around her cumslit before continuing downward.");

	output("\n\nThe pleasure of Flahne’s fingers is beginning to get to your head, but not so much so that you can’t hear the dull tap of heels clicking outside. The pleasure drunk secretary doesn’t seem to notice, and you bite your lip to stifle a ");
	if(pc.isAss()) output("slightly sadistic");
	else output("playful");
	output(" giggle. You move your face close to the gel-girl’s elongated ear, ");
	if(!pc.isAss()) output("biting");
	else output("nipping");
	output(" the tip with your lips and licking down its length untill your mouth is close enough to whisper. <i>“There’s someone at the door,”</i> you tell her just as the handle jiggles across the room. Flahne’s head swivels to look at the door, and a hundred different things seem to catch in her throat as her pussy tightens around your fingers. You slide them out momentarily, moving your hand round to her backside and pulling her soft body in tight against your [pc.skinFurScales]. You squeeze one of her plush asscheeks before slipping your fingers into her cunt from behind, picking up the pace from before as you kiss the side of her neck. The office door opens to reveal a short, thin woman of moderate attractiveness, and she drops a clipboard as a look of shock covers her features. Her face flushes beet red as she stoops to pick up the clipboard and leaves as quickly as she can, stuttering apologies as she shuts the door.");

	output("\n\nAs soon as the door is closed Flahne lets out a long moan, and her pussy tightens like a vice around your fingers. Her body shudders as she cums, liquid dripping off the already soaked chair. Her fingers ");
	//if low capacity:
	if(pc.vaginalCapacity() < 20) output("try to ");
	output("splay out inside you, and you let your own orgasm rock your body as you scream into the gel-girl’s shoulder.");
	if(flahneDickOut()) {
		output(" Flahne’s ovipositor plasters the underside of your [pc.chest], giving you a creamy sugar coating that drips down your belly.");
	}
	if(pc.hasCock())
	{
		output(" Your [pc.cum] bursts from your [pc.cockBiggest] with a wave of pleasure, blasting the underside of Flahne’s breasts like a firehose and spattering down her stomach.");
		if(pc.cockTotal() > 2) output(" Your unused cocks spurt their loads");
		else if(pc.cockTotal() == 2) output(" Your unused cock spurts its load");
		if(pc.cockTotal() > 1) output(" against her hips and arms, giving her a coating of [pc.cumColor] nutrition.");
	}
	output(" After the feelings have mostly passed you help the now-slick secretary up from the chair. For a moment her legs are too weak, and she slumps down to her knees, rubbing against you and kissing your body with her soft lips");
	if(flahneDickOut()) output(", licking her sugary cream from your body as she goes");
	output(". When she can stand, she helps you up and gives you a long kiss followed by an embarrassed look.");

	if(flags["HUGGED_FLAHNE"] == undefined) output("<i>“M-maybe I do have just a little exhibition streak,”</i> ");
	else output("<i>“C-come back again soon,”</i> ");
	output(" she says with a small smile. You giggle and give her a quick kiss. Her smile widens and a blush blooms that turns her face the color of butterscotch before she goes to get a few towels and a change of clothes. The towels handle most of the assorted fluids, and she assures you as you leave that she can get the rest with a mop.");
	flags["HUGGED_FLAHNE"] = 1;
	flahneFuckCounter(1);
	pc.exhibitionism(2);
	processTime(15+rand(15));
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Male: If I fits, you sits
public function flahneIfMalesFitTheySitExhibitionism():void {
	clearOutput();
	author("Gardeford");
	showFlahne(true);
	var x:int = pc.cockThatFits(chars["FLAHNE"].vaginalCapacity());
	if(x < 0) x = pc.smallestCockIndex();
	output("You revel in the feeling of the gel girl embracing you and stand from your chair to return her affections. Giving her a sly look, you ");
	if(flags["HUGGED_FLAHNE"] == undefined) output("mention that she didn’t seem particularly upset when someone walked in on the two of you having sex. You run a finger up her neck all the way to her chin and playfully ask if she has a bit of an exhibitionist streak.");
	else output("ask if she’s up for more exhibition, since the last time went so well after all.");
	output(" You walk to the door and undo the locks before striding proudly to Flahne’s desk chair");
	if(!pc.isNude()) output(", dropping your clothing as you go");
	output(". When you reach the chair you swivel to face her and beckon her with one hand. The luscious gel-secretary glances nervously at the door for a moment before walking slowly to stand before you.");

	output("\n\nYou lean back in the chair and give Flahne a coy smile. <i>“You worry too much. Come, sit, and we’ll forget all about the door,”</i> You say as you reach out and slowly pull down the gel-girl’s skirt, ");
	if(!flahneDickOut()) output("planting a kiss on her pelvis");
	else output("kissing the underside of her hardening ovipositor");
	output(" as she steps out. Worries of being caught seem to be forgotten as you turn the flavescent beauty around. You cup her amber assflesh in both hands and squeeze lightly as you lower her into position above [pc.oneCock]. Flahne exhales softly as you rub your [pc.cockHead " + x + "] against her moist opening, biting her lower lip when you pull her slowly down until you can’t go any further.");
	if(pc.cockTotal() > 2) output(" Your unused cocks harden as they are sandwiched beneath the gel-girl’s sizeable tush.");
	else if(pc.cockTotal() == 2) output(" Your unused cock hardens as it is sandwiched beneath the gel-girl’s sizeable tush.");

	output("\n\nHer silken insides feel wonderful around your [pc.cock " + x + "], and you slide your hands sensually up her body, reveling in the feeling of her squishy flesh. When your hands reach her breasts, you squeeze the wonderful globes, letting your hands sink into the succulent tit-flesh as you kiss the nape of the gel-secretary’s neck. Flahne’s moans grow louder as you massage the sides of her gooey G-cups, rolling her coppery nipples between two fingers before tugging them softly. You move one of your hands up to the gel-girl’s mouth, slipping a few fingers inside and letting her tongue wet them. You draw your digits out and trace them down the middle of her chest until it lies between her legs.");

	output("\n\nAs you lower your hand you start to rock your hips back and forth, not yet thrusting but rubbing your [pc.cock " + x + "] around inside Flahne’s sopping box. Your saliva-wetted fingers ");
	if(!flahneDickOut()) output("rub against her rigid clit");
	else output("lubricate her rigid gel-pole");
	output(" with sexual fervor. The curvy secretary begins to grind her own hips in circles to quicken the rubbing, and your moans join hers. You turn her head around and give the gel-girl a deep kiss that is returned in kind, her long tongue wrapping around yours. When you break the kiss, you drag her tongue out of her mouth for a moment, sucking her sugary saliva off of it as you let it slide from your mouth with a small popping noise. One of her hands squeezes your arm as you ");
	if(!flahneDickOut()) output("put more effort into playing with her clit");
	else output("work harder at jerking her slick love banana");
	output(".");

	output("\n\nThe feeling of Flahne’s insides is beginning to get to you, but not so much so that you can’t hear the soft thudding of footsteps outside the door. The busty secretary appears to be too drunk with pleasure to notice the noise, and you grin ");
	if(pc.isAss()) output("wickedly");
	else output("playfully");
	output(" behind her back. You move your face close to her elongated ear, making small mock bites and kisses down its length until you are mere inches from her face, breath caressing her cheek. <i>“There’s someone at the door,”</i> you whisper quietly just as the handle jiggles on the other side of the room. Flahne gasps and focuses on the door; and a hundred different excuses seem to catch in her throat as her pussy tightens around your throbbing member, and her hand clutches harder to your arm. You heed none of her attempted warnings as you pick up speed ");
	if(!flahneDickOut()) output("rubbing her clit, twisting it lightly");
	else output("sliding your hand up and down her golden ovi-cock, stopping at the tip and swirling your palm around it");
	output(" while you kiss the side of her neck. The office door opens and a short stocky alien in a black business suit shuffles in. The man takes one look at the scene beyond and backs out of the room, spewing flustered apologies as he shuts the door behind him.");

	output("\n\nAs soon as the door shuts, Flahne lets out a moan that sputters out as she comes, her whole body shuddering as her pussy tightens around your [pc.cock " + x + "]. You cum along with her, your [pc.cock " + x + "] splattering her insides with [pc.cumColor] spooge as you hug her tight to your body");
	if(pc.biggestTitSize() >= 1) output(", your [pc.chest] pressing into her back");
	output(".");
	pc.cockChange();
	if(pc.cockTotal() > 1)
	{
		if(pc.cockTotal() > 2) output(" Each of your unused cocks");
		else output(" Your unused cock");
		output(" joins in the fun, painting her thighs, the back of her knees, and a little of the floor around you with jizz.");
	}
	if(pc.hasVagina())
	{
		output(" Your unused [pc.vaginas] orgasm");
		if(pc.vaginaTotal() == 1) output("s");
		output(" as well, further drowning the poor desk chair with fluids.");
	}
	if(flahneDickOut()) output(" Flahne’s ovipositor spurts against your hand like a fire hydrant. You move back down to squeeze it as ropes of sugary cream spurt onto the desk. The flow finally dies down to a small trickle as her rod softens.");
	output(" After you stop filling her loins you help the golden secretary to a standing position, holding her aloft till her legs can support her. After she can stand on her own she gives you a long kiss and an embarrassed look.");

	if(flags["HUGGED_FLAHNE"] == undefined) output("\n\n<i>“M-maybe I do have just a little exhibition streak,”</i>");
	else output("\n\n<i>“C-come back again soon,”</i>");
	output(" she says with a small smile. You giggle and give her a quick kiss. Her smile widens and a blush blooms that turns her face butterscotch before she goes to get a few towels and a change of clothes. The towels clean up most of the assorted fluids, and she assures you as you leave that she can get the rest with a mop.");
	flags["HUGGED_FLAHNE"] = 1;
	flahneFuckCounter(1);
	pc.exhibitionism(2);
	processTime(15+rand(15));
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function flahneTalksAboutCumslutPenny():void
{
	clearOutput();
	author("Abe E. Seedy");
	showFlahne();

	// Set flag so we never see this again
	flags["FLAHNE_TALKED_ABOUT_CUMSLUTPENNY"] = 1;

	// Figure out which variant we're gonna shit out

	// Keep it in your pants Penny!
	if (flags["PENNY_HIDING_CUMSLUTTERY"] != undefined || pennyIsCrew())
	{
		output("Flahne looks up at you as you enter with an unusual twinkle in her eyes. <i>“Well, well, well,”</i> she says, <i>“look who it is. You wouldn’t happen to have any idea what’s up with Penny, would you?”</i>");
		output("\n\nDeciding to play it casual, you shrug and nonchalantly respond that you don’t have any idea what she’s talking about.");
		output("\n\nFlahne snorts derisively, although her unique physiology means that it sounds more like someone blowing bubbles in reverse. It must have been an expression she picked up from hanging around humans, but it gets her point across despite the oddness of how it sounds.");
		output("\n\n<i>“Sure you don’t, champ. Don’t get me wrong – I’m not mad, if anything, I’m impressed. I’ve been trying forever to get her to embrace her cocklust, with no results. Then you show up, and all of a sudden ");
		if(pennyIsCrew()) output("I can see her sucking dick on my computer at almost any time, day or night.”</i>");
		else output("I have to knock before I try to see her or there’s a lot of flailing and... spillage.”</i>");
		output("\n\nYou give her a quizzical look, and her face slides into a lascivious grin. <i>“" + (!pennyIsCrew() ? "I don’t exactly have the most noticeable of footsteps,":"I know my way around the extranet,") + " you see?”</i> She indicates " + (pennyIsCrew() ? "her terminal":"what passes for her feet, pressing them softly and silently against the ground") + " to illustrate her point. <i>“I </i>may<i> have caught " + (pennyIsCrew() ? "her off-guard a couple of times.":"a particularly... effusive session.") + "”</i>");
		output("\n\nBefore you can start attempting to justify your actions, her smile gets wider, and it becomes clear she’s hardly upset about the changes you’ve made to the local law enforcement.");
		output("\n\n<i>“We can always do with some more entertainment" + (!pennyIsCrew() ? " around here":"") + ",”</i> she adds, <i>“and I don’t think I’m ever going to get tired of ‘accidentally’ " + (pennyIsCrew() ? "clicking back to that tab.":"walking in on her.") + " I only wish she’d let me help her out myself – she’s going at it so much lately that just " + (pennyIsCrew() ? "the thought of ":"") + "being in the same room as her... the scent of it " + (pennyIsCrew() ? "would be":"all is") + " enough to get me drooling. But still she pretends that nothing’s happening" + (pennyIsCrew() ? " when she sends me messages":"") + ". Maybe some day...”</i>");
		output("\n\nShe trails off for a moment, her gaze drifting upwards and her hand moving unconsciously down below her desk. Before things can go any further you give a polite cough, and she reluctantly brings her attention back to the present.");
		output("\n\n<i>“Oh, right. Just... promise to put a word in for me when you get a chance, okay? Now, what can I do for you?”</i>");
	}
	// Look, but no touchin'
	else if (flags["PENNY_LETTING_OTHERS_WATCH_CUMSLUTTERY"] != undefined)
	{
		output("Flahne looks up at you as you enter with an unusual twinkle in her eyes. <i>“Well, well, well,”</i> she says, <i>“look who it is. I hear we have you to thank for Penny’s new... community outreach program?”</i>");
		output("\n\nUnsure of entirely how to react, you start to work on a plausible defence, but Flahne raises her hands to forestall your attempt.");
		output("\n\n<i>“Relax! I’m not mad. Come on, have you met me? Flahne? Yellow gel-creature who loves sucking on her own sugary cock? I’m hardly going to get mad about someone else getting in on the fun, am I?”</i>");
		output("\n\nYou find yourself almost deflating; having been caught by surprise by the exact opposite of the telling off you were expecting. Seeing you flounder to regain your footing in the conversation, Flahne takes the opportunity to continue.");
		output("\n\n<i>“Don’t get me wrong, it was certainly a surprise. I’ve been trying to interest Penny in sucking </i>my<i> cock for forever, so imagine my surprise when I walked in to find her quite happily sucking on her own! I had my suspicions of course – she always seemed to perk up whenever I teased her by talking about my own... activities, and the way she watched me sucking on these suckers....”</i> She pauses to reach for a fresh one, smacking her lips around it and sucking happily for a few seconds before continuing. <i>“Well, it didn’t take a genius to figure out what was going through her head. And yet she never said or did anything herself – not till you showed up, and all of a sudden she’s finding all kinds of excuses to call me over and show me both paperwork and her new, impressive cock.”</i> She sighs, taking the lollipop out of her mouth for a moment and staring wistfully at it. <i>“I just wish she’d let me actually join in. Apparently it’s all look but don’t touch for some reason. I’ve actually had to pass on her invitations a few times, just because I can’t stand to just watch without having any of her cum myself.”</i>");
		output("\n\nShe frowns, throwing the spent stick of her sweet into the nearby overflowing bin. <i>“It’s greedy, that’s what it is. Maybe she’ll come around soon though. She’s already come a lot further than I was expecting, that’s for sure.”</i> She looks back up, seemingly remembering about you for the first time in a while. <i>“Say, you started this – you couldn’t put in a good word for me, could you? The thought of all that delicious cum, and she can’t possibly eat it </i>all<i>...”</i>");
		output("\n\nShe trails off for a moment, her gaze drifting upwards and her tongue unconsciously licking her lips. Before things can go any further you give a polite cough, and she reluctantly brings her attention back to the present.");
		output("\n\n<i>“Oh, right. Just... promise to put a word in for me when you get a chance, okay? Now, what can I do for you?”</i>");
	}
	// Sharing is Caring Penny.
	else if (flags["PENNY_BEING_A_PUBLIC_CUMSLUT"] != undefined)
	{
		output("Stepping into Flahne’s office, you look up to see the amber-colored girl suddenly launch herself off her chair, throwing herself at you and bowling the two of you over backwards before you can react. Instinctively you prepare yourself for a fight, but before things go that far you register her wildly smiling face, and the fact that her ‘battlecry’ was just her endlessly repeating <i>“thankyouthankyouthankyou!”</i>");
		output("\n\nAfter a few moments of untangling confused limbs, you manage to unwrap Flahne from around yourself and get the both of you back to your feet in the hopes of an explanation. She wipes a hand over her face to calm herself down, and although she’s still wearing a big dopey grin, she settles down enough to move back behind her desk and sit down.");
		output("\n\n<i>“Sorry”</i>, she starts meekly. <i>“I’m just- I’m pretty happy with you, y’know? Thanks, and that? You ever have a dick you need to get sucked, you just let me know!”</i>");
		output("\n\nThat offer strikes you as absolutely bizarre, not least because she’s hardly been withholding on that subject before now anyway. You respond in the most appropriate manner you can think of, which is to say that you have absolutely no idea what to respond to that with, so you can only look at her with an expression of complete confusion.");
		output("\n\nSeeing your lack of comprehension, Flahne speaks up again. <i>“Penny?”</i> she prompts. <i>“I’ve been trying </i>forever<i> to get her to reconcile with her desire to have a big, active cock, and no success. Then you show up, and suddenly it’s open season on the hottest new stud in town.”</i>");
		output("\n\nIt finally occurs to you that Flahne looks even fuller than you’re normally used to seeing her. Her extra mass is no doubt the reason she was so able to throw you to the ground before – you’re not used to there being so much of her to throw around.");
		output("\n\nNoticing your look, Flahne gives you a shy smile. <i>“I... might have indulged a little? Penny was more than happy to let me make up for lost time. Although...”</i> A cloud passes over her face, her features flashing momentarily downcast. <i>“It’s... don’t get me wrong, it’s great but... it turns out she’s not the best sharer? I mean, I can certainly understand getting addicted to your own, uh, supply – but she goes after cum like a girl possessed! I don’t know what got into her! I always suspected she had a secret desire for something like my lovely ovipositor – the way she got so cutely worked up whenever I talked about the fun I had with mine was a big clue, especially whenever she had to suddenly leave the room to take care of a ‘police emergency’, and then I could swear I’d catch her still reeking of sex hours later. But even so – I never expected her to be this... enthusiastic! She laps up both hers </i>and<i> mine, and even after that she still has half the town lined up outside her office for more.”</i>");
		output("\n\nShe pauses for a moment to pull out a sucker and stick it in her mouth, working it fiercely with her tongue before continuing. <i>“It’s just a little... greedy! I’ve only managed to get so much when I can keep her distracted by sucking on my ovipositor directly, and believe me, it’s </i>hard<i> to keep my wits about me enough to get a feed of my own when there’s a soft pair of lips wrapped around my little friend here.”</i>");
		output("\n\nHer gaze drifts upwards as she seems to drift away for a moment, continuing quietly to herself. <i>“Still, the taste of her is </i>amazing<i>. Not as sweet as mine, obviously, but... powerful, somehow. I just... I just want more of it. I can’t seem to get enough....”</i>");
		output("\n\nYou notice that she’s almost shaking, sucking her sweet so energetically that in seconds she’s having to throw away the spent stick. You take the opportunity of her reaching for another one to cough politely, and reluctantly she swings her attention back to you.");
		output("\n\n<i>“Oh, right, right, sorry. Hey, you’re the one who started all this after all – could you maybe convince her to be a little more... generous? I just... I can’t get the thought of it out of my head. Just... put a word in for me, will you?”</i> She shakes her head briefly, then looks back at you with a less hazy expression. <i>“Right, what can I do for you, anyway?”</i>");
	}

	processTime(5 + rand(3));
	flahneMenu();
}


//Available for anybody with a cunt between their legs OR taurs with back-mounted cunts. 
//DA SCENE - Swap Oral
//Eat Flahne out, then see if the busty rahn can make a meal out of your own pussy - fun for everyone! 
public function flahneEatOutSwapMeatPussiesYouKnowWhatIMean():void
{
	clearOutput();
	showFlahne(true);
	author("Savin");
	//if Taur:
	if(pc.isTaur())
	{
		output("With the gel-like secretary’s truly impressive rack suddenly on almost-complete display, it takes you a moment to churn through your options. If you ");
		if(pc.hasCock()) output("were in the mood to use your [pc.cocks]");
		else output("had a nice, big cock for her");
		output(", you might just bend the giggly gel-girl over her desk and mount her like a proper mare... though you’re not sure the flimsy desk could actually support your weight, much less the thrusting. The cramped little office doesn’t offer a lot of alternatives though, and with a body like yours... well, making love in tight quarters requires more finesse than you’re able to produce when you’ve got a set of G-cups almost in your face.");
	}
	//if not taur: 
	else
	{
		output("With the gel-like secretary’s truly impressive rack suddenly on almost-complete display, it takes you a moment to churn through your options. After seeing her long, writhing tongue play around the candies the secretary’s always sucking on, you can’t wait to see what it could do to your [pc.vaginas]. Then again, those huge tits of hers are swaying hypnotically in your face, making you think of all the things you could do to a rack like that...");
	}
	output("\n\n<i>“Cat got your tongue, cutie?”</i> Flahne teases. As she speaks, though, the amber-hued secretary hops up from her swivel chair and slips around to your side of her desk, working through the remaining buttons of her shirt until it slips off her shoulders completely.");
	output("\n\nYou nod at her question, completely entranced by the hypnotic sway of her huge tits, and the suggestive sashay of her wide hips underneath her skirt. <i>“Well, ask your kitty friend if I can borrow it for a while,”</i> she coos, hefting herself up onto the edge of the desk and spreading her legs. You’re not surprised to see she’s not wearing any panties under that sinfully short bottom of hers, and your eyes are instantly drawn to the glistening, golden honeypot tucked between her thick thighs.");
	output("\n\nShe gives you a look with a mischievous glint in her amethyst eyes and pats her thighs invitingly, a silent offer for you to dig in. As her hands impact her alien flesh, her whole lower body seems to tremble with the shock, reacting just like gelatin and quaking in ways that send the most awe-inspiring shockwaves all the way to her pendulous breasts.");

	output("\n\nYou don’t have to be asked twice.");

	//if taur:
	if(pc.isTaur())
	{
		output("\n\nSitting down on your bestial lower body brings you down to eye-level with Flahne’s rack, almost eye to eye with her big, stiff, off-brown nipples.");
	}
	else output("\n\nYou slink down onto your [pc.knees], putting your face right on level with the jiggling gel’s huge tits.");
	output(" From there, it’s just a little bit of leaning ");
	if(pc.isTaur()) output("your humanoid half down ");
	output("to nestle yourself between her meaty legs, close enough to smell the sugary musk wafting up from the slit of Flahne’s sex. You’d almost think the curvaceous gel-girl was <i>made</i> of sweets!");

	output("\n\n");
	if(flags["FLAHNE_LIKE_OVIPOSITOR"] == 1) showImage("UpCloseFlahnePuss");
	output("Eager to see if Flahne’s pussy tastes as good as it smells, you");
	if(flags["FLAHNE_LIKE_OVIPOSITOR"] == 1) output(" lift the meaty shaft out of the way and");
	output(" flick your [pc.tongue] out along one of her outer lips, running it from the bottom of her twat to the hood of her clit. The taste is intoxicating, like the sweetest, sugariest candy you’ve ever eaten in the form of a molten liquid that’s the perfect balance between sticky and creamy. You eat it up, letting the sweet stuff spur you on to licking deeper and faster into the giggling rahn’s cunt.");

	output("\n\n<i>“Ooh, that’s the spot!”</i> she purrs, digging her soft digits into the lip of her desk and moaning with pleasure. Her hips wiggle happily, sending quaking sways through her huge tits - the sight of them going wild is too much to bear, and you find yourself reaching up to grab the massive mounds. Your fingers sink into them, all but vanishing into the soft gold gel that makes up Flahne’s bust. Flahne giggles and shakes her shoulders, making you cling hard to her tits or be shaken off. The harder you squeeze, the more she moans - and the more of her sweet nectar you’re able to lick out of her drooling cunt.");

	output("\n\nWith a bit of pressure, your tongue’s able to peel her pussylips apart, gaining access to the perfectly-formed passage between them. <i>“Oh, oh gosh,”</i> Flahne murmurs as your tongue squirms its way ever so slowly into her, spreading her soft, sodden slit nice and wide. <i>“Eat it up, sugar. Eat it </i>all<i> up!”</i>");

	output("\n\nYou’d laugh at the corny pillow-talk if you weren’t chin-deep in alien pussy. As it stands, you eagerly follow your giggly lover’s instruction, licking your way around her cunny’s walls and lapping up all her sweet juices. ");
	//if Flahnepositor Out: 
	if(flags["FLAHNE_LIKE_OVIPOSITOR"] == 1) output("The rahn’s big, tumescent ovipositor throbs over you, tenting her skirt and plopping firmly onto the top of your head. Your lover giggles, her amber cheeks turning a darker orange. <i>“Sorry,”</i> she purrs, hefting the great big egg-layer off of you... and right up between her hefty tits. You take the hint and squeeze her boobs together, tight around the shaft of her ovi-cock, and start to massage them up against each other. You’re almost immediately rewarded with a geyser of creamy pre that squirts up from her cleavage to splatter across the tops of her breasts. Flahne makes a hell of a show licking up every drop of it.\n\n");
	output("You can tell she’s getting close now! You lick and squeeze more fiercely, driving Flahne’s pleasure ever higher until she lets out a sharp gasp, and you feel her thighs clench around your [pc.face]. A thick squirt of her candy-like juices presages an orgasm that has you fighting to catch your breath between wet surges and Flahne trying to bury you between her thick, soft thighs - a demise you honestly can’t say you’d be opposed to, if it feels anywhere near as nice as her skin does against yours, rubbing wetly but softly all over you.");

	output("\n\nFinally, you manage to break away from Flahne’s death-grip and catch your breath. Without anything to cling to, the amber rahn flops onto her back and lets out a huge sigh. She looks utterly sated, eyes fluttering closed and hands ");
	if(flags["FLAHNE_LIKE_OVIPOSITOR"] == 1) output("idly playing with her squirting ovipositor, stroking the shaft so that it dribbles its load into her waiting mouth");
	else output("massaging her well-eaten pussy");
	output(".");

	output("\n\n<i>“Oh, I needed that, sweetheart,”</i> Flahne coos, slowly forcing herself to prop up on her arms. <i>“Aww, you look so flustered you’re about to burst! Why don’t you just turn around and let me return the favor, sugar?”</i>");

	output("\n\nNow that’s an offer you can’t refuse! ");
	if(pc.isTaur()) output("You awkwardly turn your big, bestial body around, trying not to knock too much over in Flahne’s cramped little office. She giggles, just ducking under one of your legs as you try and get yourself angled so she’s got easy access to your [pc.vaginas]. When you’re finished, you’re treated to the feeling of Flahne’s soft fingers on your [pc.butt], rubbing and massaging the inhuman arrangement of your backside.");
	else output("At a word from Flahne, you turn around and bend over, shaking your [pc.butt] at her and bracing your arms on your [pc.legs], your [pc.vaginas] on full display for her.");
	output("\n\nSlowly but surely, her fingers work their way in towards [pc.oneVagina]. You shiver in anticipation, clawing ");
	if(pc.legCount > 1) output("one of ");
	output("your [pc.legs] along the floor as your lover draws ever closer to your cunt.");


	output("\n\nYou hear Flahne giggling behind you, punctuated by the feeling of one of her smooth, gel-like digits circling [pc.oneClit]. You gasp, and again when her long, probe-like tongue flanks your pleasure-buzzer, lapping across the bud while her fingers teases back the hood. You have to admit, you want to feel that writhing tongue of hers inside you");
	if(pc.tailCount > 1 && pc.hasTailFlag(GLOBAL.FLAG_PREHENSILE) && pc.hasTailFlag(GLOBAL.FLAG_LONG)) output(", and your tail seems to agree, wrapping lazily around Flahne’s shoulders and pulling her closer");
	output(".");

	output("\n\nWiggling your [pc.hips] to get Flahne’s attention, ");
	var x:int = -1;
	for(var y:int = 0; y < pc.totalVaginas(); y++)
	{
		//If a horsecunt or leithan cunt, set it
		if(pc.vaginas[y].type == GLOBAL.TYPE_EQUINE || pc.vaginas[y].type == GLOBAL.TYPE_LEITHAN) x = y;
	}
	if(x == -1) x = rand(pc.totalVaginas());
	//Taurs with winkypuss!
	if(pc.isTaur() && (pc.vaginas[x].type == GLOBAL.TYPE_EQUINE || pc.vaginas[x].type == GLOBAL.TYPE_LEITHAN)) output("you make your [pc.vagina] wink enticingly at her, trying to draw her in");
	else output("you reach back and spank your ass enticingly");
	output(". She makes you wait an agonizingly long moment, long enough to plant a wet kiss on ");
	if(pc.vaginas[x].clits > 1) output("a");
	else output("your");
	output(" [pc.clit] before she moves her tongue down to your ");
	if(pc.isTaur() && (pc.vaginas[x].type == GLOBAL.TYPE_EQUINE || pc.vaginas[x].type == GLOBAL.TYPE_LEITHAN)) output("animalistic ");
	output("hole. She moves with easy confidence, using her fingers to spread your pussy lips nice and wide to give herself easy access to your [pc.cuntColor " + x + "] slit. It feels like ");
	if(silly) output("something out of an ultraporn! Her tongue is like ");
	output("a tentacle sliding into you. Your whole body goes rigid in response, every hair standing on-end as the alien appendage squirms and writhes inside you. Gasping and panting, you grab the far wall for support and try to hold on for dear life - or at least, try not to scream under the alien sensations crawling through you.");
	//if Flahne exhibitionist:
	if(flags["HUGGED_FLAHNE"] == 1) output(" As much as you’re sure Flahne would just <i>love</i> someone to come bursting in on you, you don’t want anything to interrupt the incredible pussy-eating you’re getting!");

	output("\n\nFlahne’s tongue can do incredible things, you’re quick to find out. Long and sinuous and dexterous, her writhing amber appendage seems to hone in on every sensitive spot you’ve got until you’re moaning and trembling, struggling to stay on your ");
	if(!pc.isTaur()) output("[pc.feet]");
	else output("bestial legs");
	output(".");
	if(pc.hasTailFlag(GLOBAL.FLAG_LONG) && pc.tailCount > 0)
	{
		output(" Your [pc.tails] ");
		if(pc.tailCount > 1) output("twist and curl");
		else output("twists and curls");
		output(" behind you, spasming in reaction to shockwaves of pleasure - all the while trying to pull Flahne closer and deeper into your cunt.");
	}
	output(" You buck your [pc.hips] back against her smooth face, grinding and humping to trying to fuck Flahne’s tongue deeper into your [pc.vagina " + x + "].");

	output("\n\n<i>“Gonna... gonna...”</i> you moan, fingers scrabbling against the wall. Flahne answers with her fingers suddenly back around your clit, massaging your buzzer in time with her tongue’s ministrations. That’s just the push you need to slide over the edge, hurling you into the throes of pleasure. Your cunt squeezes hard around Flahne’s tongue, squirting thick rivulets of [pc.girlCumNoun] across Flahne’s cheeks. You can’t help but cry out now, no matter how hard you try not to: a booming moan of pleasure that you’re sure anyone outside Flahne’s office can hear as clear as day. Nothing can stifle you once the dam’s been broken, and you’re moaning like a bitch in heat as Flahne licks and massages you through your climax.");
	output("\n\nA moment passes, and you all but fall onto your [pc.knees] when Flahne’s tongue slithers out of you. You spend a moment catching your breath, trembling with the aftershocks of your orgasm. Flahne giggles and licks her lips, murmuring <i>“Now that was a treat!”</i> and looking around for wherever her shirt fell.");

	output("\n\nAs soon as your [pc.legs] are steady again, you get up and grab your [pc.gear], grinning at the amber gel-girl. She blows you a kiss between licking your juices off her cheeks.");
	processTime(33);
	flahneFuckCounter(1);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Flahne Cunt Snake Scene
//Requires ovi out, not currently mad. Cunt snake does not get pregged from this obvs
public function flahneCuntSnake():void
{
	clearOutput();
	showFlahne(true);
	author("Nonesuch");
	//First
	if(flags["FLAHNE_CSNAKED"] == undefined)
	{
		output("You keep your eyes fixed on the plump, merry loo’rahn’s features as you release your [pc.cuntTail] and allow it to swing into view around your flank. As you anticipated, her face is a picture - from an eager, soft grin to a flustered gawk in moments.");
		output("\n\n<i>“You’re infested, [pc.name]!”</i> she cries, shooting her chair back from her desk. <i>“Didn’t I warn you about cunt snakes? Ooh, I should have told you to be more careful!”</i> She drums her hands on her desk rapidly. <i>“Come on, we’ll get you to the med-bay across town. The V-Ko there can get this sorted out -”</i>");
		output("\n\n<i>“Calm down, Flahne,”</i> you urge. With tenses of the lithe muscles that run along its length, you drift the cunt-tail closer, so that she can see its moist opening in detail. You allow your gaze to run along her extremely generous curves, a quivering orange blancmange embodiment of female fertility, and arousal shivers up your appendage, spreading its glistening entrance readily. The loo’rahn is frozen, staring at it uncertainly.");
		output("\n\n<i>“It’s just my little friend,”</i> you go on. <i>“And it wants to say hi! Ever since I got it, we’ve been having ever so much fun.”</i> You drift it closer, drawing it over the desk, dabbing its moist hole on her incredibly soft membrane. Flahne shies from it slightly - but she just doesn’t bat it away, and you can’t help notice a certain redness to her face. Is that a lump forming in her skirt...?");
		output("\n\n<i>“You shouldn’t encourage these creatures, [pc.name],”</i> she scolds. <i>“They’re a serious problem here. They get everywhere because of careless spacers like you - littering.”</i> She’s upset enough that she doesn’t laugh at her own joke.");
		output("\n\n<i>“But where’s the problem when it’s just you and me, Flahne?”</i> you tease. You decide to take a risk - moving behind her desk, you reach down and pull her skirt up her thick, round thighs. She gasps as her big, long ovipositor leaps upwards from her mound, erect and raring to go. You can smell the slightly sugary scent that accompanies it - and you have to exercise all of your restraint to stop your [pc.cuntTail] from immediately honing in on the giant, juicy phallus.");
		output("\n\n<i>“Oh, look what you’ve done now!”</i> she wails, stuffed bust quivering. <i>“You’ve got me all worked up with that pesky parasite of yours and now, now I’m going to have to go jerk off or this work’s never going to get done!”</i>");
		output("\n\n<i>“Why can’t you see what I’m trying to tell you?”</i> you say gently. You let the dripping entrance of your cunt-tail land on the blunt end of the orange ovi-dick and murmur with pleasure as hungry, alien lust pulses up your spine. <i>“It needs SPERM in order to breed. All those poor, pent up eggs of yours - they won’t do anything.”</i> Flahne doesn’t reply; still lent back, she seems paralysed with lust, mouth slightly ajar. <i>“And this is a much better way of getting rid of them than jerking off,”</i> you go on, grin widening. Without any further ado you thrust your [pc.cuntTail] downwards, engulfing her ovipositor in hot, wet paradise.");
	}
	//Repeat
	else
	{
		output("<i>“You really are bad for not getting that thing sorted out, [pc.name],”</i> Flahne scolds as you rear your [pc.cuntTail] into view. She’s smiling coquettishly though; you won the argument here, and you both know it. You just feel too goddamn good.");
		output("\n\n<i>“I guess you don’t want to help me, then,”</i> you sigh, playing up to it. You allow your gaze to run along her extremely generous curves, a quivering orange blancmange embodiment of female fertility, and arousal shivers up your appendage, spreading its glistening entrance readily. Poor thing never learns. <i>“Guess I’ll have to go find some unsuspecting penis-owner and pollute Mhen’ga with even more cunt snakes.”</i>");
		output("\n\n<i>“Well now, let’s not get carried away...”</i> the rahn does not resist when you drift behind her desk and hike her skirt up her thick, round thighs. <i>“I always help friends who are in need. Just - make sure it’s the last time, ok?”</i> She sighs as her big, long ovipositor leaps upwards from her mound, erect and raring to go. You can smell the slightly sugary scent that accompanies it - and you have to exercise all of your restraint to stop your [pc.cuntTail] from immediately honing in on the giant, juicy phallus. Instead, knowing full well how soft and sensitive she is, you drift its moist opening down her skin, flicking over an erect nipple, touching her supple paunch and inner thigh, waiting until that delightful, open mouthed expression of dozy lust has settled upon her face. Only then do you lay the dripping entrance of your cunt-tail land on the blunt end of the orange ovi-dick and, with hungry, alien lust pulsing up your spine, you thrust it firmly downwards, engulfing her ovipositor in hot, wet paradise.");
	}
	output("\n\nYour breath catches in your throat as you push your tail-cunt further and further down Flahne’s shaft, sensation shimmering up its body as its smooth hardness rubs over its tender walls. You don’t have to direct its movements at all; driven by greedy lust, it stuffs itself as full as it can, gorging itself on the thick ovipositor, more and more nerve endings lighting up down your tail as it is stretched open.");
	output("\n\nSighing beatifically, you ");
	if(!pc.isTaur()) output("sit yourself down on Flahne’s desk");
	else output("lean yourself against Flahne’s desk");
	output(" so that you can drink in the rahn’s reaction to it. She grips the desk and squirms in her chair with thighs splayed, producing brisk squeaks as her chubby frame wobbles up and down, eyes closed and biting her lip, cute little gasps escaping her mouth as your appendage assiduously milks her.");
	output("\n\nThe taste of sweetness makes you lick your [pc.lips] reflexively; the sugary leak of Flahne’s pre excites the [pc.cuntTail] beyond belief, making it rear up and down her egg-cock ever more frenetically, fluids leaking down its girth. The bulge near its head ripples up and down the tightened up tail, sending pleasure sparking through you.");
	output("\n\n<i>“Oh stars above [pc.name], you horrible, naughty [pc.boy]!”</i> the rahn cries out deliriously, a button popping off her shirt as she bounces up and down ever more violently. <i>“Give it to me! Give all of that filthy thing to me!”</i> Heady lust throbbing through you, you can’t resist that heaving bosom in front of you anymore; you reach beneath the stretched fabric and grope a plush, pendulous boob, sinking your fingers deep into her as you rub over its protuberant nipple. At the same time, with an ecstatic groan, you drive your tail-cunt all the way down her ovipositor, gloving every glorious, chubby inch of it, juices foaming at its mouth.");
	output("\n\nFlahne flails in her chair, fat legs waggling, and wails as her ovipositor bulges up and flumes a jet of slick, sweet rahn eggs deep in your parasite’s maw. Ecstasy shifts up and down that dripping tunnel as she thrust into it repeatedly, driving out her pent up juices into it until you feel utterly gorged on her sugary seed, the body of your tail swollen up with it. Hand still deeply impressed in her breast, you reach forward and mash her soft lips against your own, wrapping your [pc.tongue] around her own long, lithe tongue, passionately and sloppily frenching as she pulses out her girly load until it oozes down her gelatinous flesh.");
	output("\n\nYou withdraw at last, drawing your [pc.cuntTail] up and off her wilting ovipositor, tingling all the way. You know innately that the thing is displeased - it can tell now that what you’ve fed it is the wrong type of gamete, and it throbs with resentment. The rest of you, looking down at the flushed, leaking mess of a rahn you’ve created, couldn’t care less.");
	output("\n\n<i>“You really are a bad [pc.boyGirl], [pc.name],”</i> she says at last. She makes no attempt to wipe the big grin off her face. <i>“I KNOW you aren’t using that thing on just me and other rahns.”</i>");
	output("\n\n<i>“I promise that whenever the urge gets too much, I’ll come here and milk your bulging, pent-up ovipositor for every last drop,”</i> you say, with a noble air.");
	output("\n\n<i>“I... good,”</i> replies Flahne, tucking it away, rearranging her clothes primly and fetching a lollipop out of the drawer. <i>“That’s what I like to hear.”</i>");
	//Normalise PC alignment towards Mischievous by 1 point
	pc.addMischievous(1);
	flahneFuckCounter(1);
	pc.loadInCuntTail(chars["FLAHNE"]);
	IncrementFlag("FLAHNE_CSNAKED");
	processTime(17);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}
