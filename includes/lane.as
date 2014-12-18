const HYPNOSIS_LEVEL_MAX:int = 5;

function isUnderHypnosis():Boolean
{
	if (pc.hasStatusEffect("Lane Hypnosis")) return true;
	return false;
}

function laneHypnosisLevel():int
{
	if (isUnderHypnosis())
	{

	}
	else
	{
		return 0;
	}
}

function enterLanesShop():void
{
	if (flags["MET_LANE"] == undefined) discoverLanesShop();
	else if (flags["LANE_FIRST_HYPNO"] == 1) lanesShopFirstRepeat();
	else if (laneHypnosisLevel() >= HYPNOSIS_LEVEL_MAX) lanesShopFullyUnder();
	else repeatEnterLanesShop();
}

function discoverLanesShop():void
{
	flags["MET_LANE"] = 1;

	clearOutput();
	output("You see a large hut off the beaten pathway of the desert cave’s dirt and sands. The hut is made of hardened mud and stone, but is dressed from top to bottom with fine, lacy fabrics and thin streamers blowing in the calm breeze, making it look quite inviting and standoffish, compared to the blandness of the surrounding area. The hut looks to have three rooms, and is only one story tall. There is a sign nailed above the open, door-less doorway that reads ‘Lane’s Plane: Unlocking the New You.’ Your curiosity is piqued, and you head inside.");
	
	output("\n\nThe first room is really quite plain: there is a small desk to the side, made of concrete but smooth as glass, as well as a pair of chairs on either side, each with a thick, plushy cushion. A small sign on the desk details what services the store provides, but at the top, in huge, bolded letters, are the words ‘No Refunds’. A small bookcase sits behind the desk and faces the inside chair – it’s likely a secretary’s desk or something. Some potted plants, with exotic leaves and stems from parts of the world you’ve yet to explore, sit in the corners. There are no windows. The second half of the room is draped in more of those fabrics and streamers; they don’t conceal what lies beyond them, but they do obfuscate your vision enough to hide the details.");
	
	output("\n\nThere is nobody sitting at the desk to greet you. You hear the sound of bare feet stepping over the stone of the floor beyond the curtains, and you turn to see who is there. On the other side you see a humanoid-shaped person fidgeting with what you assume is some furniture. Whatever it is they’re doing, it appears to be giving regular flashes of red and blue light, dimly illuminating the whole room. They’re not standing profile, so you can’t tell if they have breasts or not, but you can make out the tell-tale sway of a tail reaching down their legs and nearly reaching their ankles.");
	
	output("\n\nWhoever is over there is clearly distracted and hasn’t noticed you yet. You think to clear your throat and call out to them, but, with just the silhouette, you can’t think of which gender-pronoun to address them as. Do you just assume it’s a male, or do you take the chance and assume it’s a female?");

	clearMenu();
	addButton(0, "Male", laneGenderSelect, "male");
	addButton(1, "Female", laneGenderSelect, "female");
}

function laneGenderSelect(g:String):void
{
	if (g == "male")
	{
		lane.configMale();
		meetMaleLane();
	}
	else if (g == "female")
	{
		lane.configFemale();
		meetFemaleLane();
	}
	else
	{
		throw new Error("Invalid gender detected. Wakka wakka.");
	}
}

function meetMaleLane():void
{
	clearOutput();
	outputText("<i>“Excuse me, sir?”</i> you call out, hoping you’ve made the right decision. The figure immediately straightens out, bumping its feet on whatever it was shuffling around, and turns around, towards the curtains. A pair of brown, scaly, webbed, four-fingered ‘hands’ reaches between the gap of the curtains and pulls them wide open: there, a sort of lizard-man greets you, eye-to-eye, looking a little flustered that you had managed to get the drop on him.");

	outputText("\n\n<i>“I’m sorry!”</i> he says, stepping forward and shutting the curtain behind him. <I>“This is embarrassing! I was a little distracted, and I didn’t hear you step in. You haven’t been here for too long, I hope?”</I>");

	outputText("\n\nYou tell him that you had only just walked in. You’re quickly distracted yourself by the lizard-man’s appearance. He’s wearing even more of the white, lacy fabric all over his body, which does a poor job of concealing his skin and his bodily features: he has no nipples on his chest and he has no belly-button, and the whole front of his body appears to have thin, enviously smooth skin. His pelvis is concealed by a much thicker white fabric, concealing his privates and keeping him half-decent. When he first poked his head through the curtains, a pair of large, thin membranes, going from his jaw to his shoulders, seemed to flair wide open for a moment in his surprise before he shut them against his neck again. But the most mesmerizing thing of all is that the lizard-man appears to be... <i>glowing,</i> for lack of a better term. His skin is constantly flashing red and blue, giving away what the pale light from before was.");

	outputText("\n\nHe notices your odd, abject staring at his body, and his lizard-lips curl into a well-meaning smirk. <I>“You must never have seen a Daynar before, I take it?”</i> he asks you, putting his hands on his hips and striking a sassy pose. You hesitate for a moment, trying to find the willpower to break free from the hypnotic glowing underneath his skin, and you nod, confirming his assumption. <i>“Well, there’s a first time for everything.”</i> He reaches forward with his right hand. <i>“My name is Lane. Welcome to my little plane of existence.”</i>");

	outputText("\n\nYou shake his hand and give it a few strong pumps, replying with your own name. He quickly takes his spot behind the concrete desk, pulls his chair forward, and takes a seat, adopting a more professional demeanor for his new customer. <i>“[pc.name] Steele? As in, Steele Tech? Didn’t you inherit that company from your father – may he rest in peace?”</i> You tell him that, yes, of Steele Tech, but no, you haven’t, and that you’re working on it. His eyes wander for the briefest of moments, before he straightens himself out and looks you in the eye. <i>“So, [pc.name] Steele, what can I help you with?”</i>");

	laneShowMenu();
}

function meetFemaleLane():void
{
	clearOutput();
	outputText("<i>“Excuse me, ma’am?”</i> you call out, hoping you’ve made the right decision. The figure immediately straightens out, bumping its feet on whatever it was shuffling around, and turns around, towards the curtains. A pair of brown, scaly, webbed, four-fingered ‘hands’ reaches between the gap of the curtains and pulls them wide open: there, a sort of lizard-woman greets you, eye-to-eye, looking a little flustered that you had managed to get the drop on her.");

	outputText("\n\n<i>“I’m sorry!”</i> she says, stepping forward and shutting the curtain behind her. <I>“This is embarrassing! I was a little distracted, and I didn’t hear you step in. You haven’t been here for too long, I hope?”</I>");

	outputText("\n\nYou tell her that you had only just walked in. You’re quickly distracted yourself by the lizard-woman’s appearance. She’s wearing even more of the white, lacy fabric all over her body, which does a poor job of concealing her skin and her bodily features: she has no nipples on her (rather generous) chest; she has no belly-button; and the whole front of her body appears to have thin, enviously smooth skin. Her pelvis is concealed by a much thicker white fabric, concealing her privates and keeping her half-decent. When she first poked her head through the curtains, a pair of large, thin membranes, going from her jaw to her shoulders, seemed to flair wide open for a moment in her surprise before she shut them against her neck again. But the most mesmerizing thing of all is that the lizard-woman appears to be... <i>glowing,</i> for lack of a better term. Her skin is constantly flashing red and blue, giving away what the pale light from before was.");

	outputText("\n\nShe notices your odd, abject staring at her body, and her lizard-lips curl into a well-meaning smirk. <I>“You must never have seen a Daynar before, I take it?”</i> she asks you, putting her hands on her hips and striking a sassy pose. You hesitate for a moment, trying to find the willpower to break free from the fancy glowing underneath her skin, and you nod, confirming her assumption. <i>“Well, there’s a first time for everything.”</i> She reaches forward with her right hand. <i>“My name is Lane. Welcome to my little plane of existence.”</i>");

	outputText("\n\nYou shake her hand and give it a few strong pumps, replying with your own name. She quickly takes her spot behind the concrete desk, pulls her chair forward, and takes a seat, adopting a more professional demeanor for her new customer. <i>“[pc.name] Steele? As in, Steele Tech? Didn’t you inherit that company from your father – may he rest in peace?”</i> You tell her that, yes, of Steele Tech, but no, you haven’t, and that you’re working on it. Her eyes wander for the briefest of moments, before she straightens herself out and looks you in the eye. <i>“So, [pc.name] Steele, what can I help you with?”</i>");

	laneShowMenu();
}

function lanesShopFirstRepeat():void
{
	flags["LANE_FIRST_HYPNO_RETURN"] = 2;
	clearOutput();
	outputText("You march right into Lane’s little hut, a hundred angry things to say to [lane.himHer] all at once. [lane.heShe]’s there, lounging at [lane.hisHer] desk and playing with [lane.hisHer] codex, and [lane.heShe] hardly seems phased at all when you start stomping into [lane.hisHer] business with a look like you’re going to rip [lane.hisHer] head off.");

	outputText("\n\n<i>“Lane!”</i> you shout, slapping at [lane.hisHer] desk forcefully, rumbling the little knicks and knacks [lane.heShe] has placed all around it. [lane.HeShe] looks up from his codex and into your eyes, fearlessly.");

	outputText("\n\n<i>“Ah, [pc.name],”</i> [lane.heShe] says nonchalantly. <i>“You must be here because the last hypnosis wore off, and you’re upset that it didn’t last forever.”</i> You’re a bit surprised that [lane.heShe] had deduced it so quickly. <i>“Yeah, that’s happened almost every single time, now. Everyone assumes that it’s a one-pay thing, and then they get the clarity I give them for the rest of their lives.”</i>");

	outputText("\n\nYou’re not the first person to yell at [lane.himHer] for giving you a temporary service? <i>“And I very much doubt you’ll be the last,”</i> [lane.heShe] says. <i>“I can understand why you’d be upset, but think about it from a " + lane.mf("businessman", "businesswoman") + "’s point of view, [pc.name]. Where would I get my money if I didn’t have repeat customers? I can’t survive on just one-offs. I</i> am <i>trying to run a business, here.”</i>");

	outputText("\n\nYou remain indignant and insist that [lane.heShe] could have at least told you beforehand that [lane.hisHer] ‘improvements’ were temporary. In response, [lane.heShe] taps at the bottom line of words at [lane.hisHer] ‘No Refunds’ sign. The font is small, but it clearly says that each service of [lane.hisHers] is strictly temporary and will wear off after twenty-four Terran hours, but can be reinstated the following day at the same charge.");

	outputText("\n\nSheepish, you sit and apologize for your outburst. <i>“Think nothing of it,”</i> [lane.heShe] tells you. <i>“Your response was actually quite contained compared to some of my more... animate customers. Besides, if you’re here, it means you liked my business enough to get yourself into a stink over it.”</i> [lane.HeShe] leans back casually. <i>“Let’s put that all behind us. What can I do for you today?”</i>");

	laneShowMenu();
}

function repeatEnterLanesShop():void
{
	clearOutput();
	outputText("You approach Lane’s Plane, interested in another dose of [lane.hisHer] medicine. You enter [lane.hisHer] familiar hut and you see [lane.himHer], lazily lounging on [lane.hisHer] seat behind [lane.hisHer] desk as usual. [lane.HeShe] perks up, lifting [lane.hisHer] head at the sound of a coming customer’s footsteps, and [lane.hisHer] expression lights right up as soon as you walk into the store. <i>“Welcome again, [pc.name]!”</i> [lane.heShe] says, opening [lane.hisHer] arms warmly to greet you. <i>“Please, have a seat. To what do I owe the pleasure today? How can Lane help you in [lane.hisHer] plane?”</i>");

	outputText("\n\n[lane.HeShe] sits there, crossing [lane.hisHer] arms patiently while you take the seat across from [lane.himHer], and waits for your response.");

	laneShowMenu();
}

function lanesShopFullyUnder():void
{
	clearOutput();
	outputText("You approach Lane’s Plane, eager for another dose of your "+ lane.mf("master", "mistress") +"’s medicine. [lane.HisHer] hut has been taking on a rather extravagant turn lately, with all that extra money [lane.heShe]’s been siphoning from you. When you enter, you see [lane.himHer] lounging languidly, [lane.hisHer] legs spread and [lane.hisHer] chair leaned back, waiting for some other unlucky- or lucky, from your twisted, controlled perspective- customer to walk into [lane.hisHer] trap.");

	outputText("\n\n[lane.HeShe] smirks that familiar smirk when you walk in, and [lane.heShe] drops his feet to the floor" + lane.mf("", ", making her bust bounce just slightly from the motion and the vibration") + ".");
	outputText(" [lane.heShe] regulates [lane.hisHer] pulse, and already you’re weak in the knees and horny in the loins,");
	if (pc.hasCock() && !pc.hasVagina()) outputText(" your [pc.eachCock] rousing to attention, hoping Lane will provide you some ‘other’ service. Beads of your [pc.cum] begin to stain your clothing as you sit.");
	else if (pc.hasVagina() && !pc.hasCock()) outputText(" your [pc.vagina] moistening in rapt optimism that Lane will use [lane.hisHer] power over to you give you another life-altering orgasm.");
	else if (pc.hasVagina() && pc.hasCock()) outputText(" each and every part of you ready to sink deeper into [lane.hisHer] control, if it means getting off the way only [lane.heShe] can get you off anymore.");
	else outputText(" which only serves to frustrate you, but your waking mind knows that your needs are secondary to [lane.hisHer], and providing yourself to Lane is the greatest pleasure you'll ever need.");

	outputText("\n\n[lane.HeShe] flairs his tassels open, only for a moment, to let you taste of the sweet pleasure you’ve come to [lane.himHer] for. Teasingly, they shut again, and you’re left horny and thirsty for more of [lane.himHer]. <i>“Welcome back, my pet,”</i> [lane.heShe] says sensually, dragging a loving claw gently over your [pc.face]. <i>“Have you come to Lane for more of [lane.hisHer] magic? Or are you here to pay your ‘taxes’?”</i>");

	laneShowMenu();
}

function laneShowMenu():void
{
	clearMenu();
	addButton(0, "Talk", talkToLane);
	addButton(1, "Services", lanesServices);
	addButton(2, "Taxes", lanesTaxes);
	addButton(5, "Appearance", lanesAppearance);
	addButton(14, "Leave", leaveLanes);
}

function talkToLane():void
{
	clearOutput();

	if (isUnderHypnosis())
	{
		outputText("[lane.HeShe] laughs, not derisively, but not amusedly either. <i>“You and I have gotten plenty intimate over your visits. I’ve charmed you quite enough, I think.”</i> [lane.HeShe] flairs his tassels open again, and his power over you is refreshed. If [lane.heShe] doesn’t want to talk, that’s perfectly fine with you. <i>“But,”</i> [lane.heShe] yawns, closing [lane.hisHer] membranes against [lane.hisHer] neck, <i>“you’ve come all this way just to taste of your "+ lane.mf("Master", "Mistress") +"’s voice some more. Who would I be to turn down such a loyal pet?”</i>");
	}
	else
	{
		outputText("\n\n<i>“Oh, this is a social call, is it?”</i> Lane says, trilling amusedly. [lane.HeShe] leans back in [lane.hisHer] chair, slumping and relaxing, stretching [lane.hisHer] limbs out. <i>“Sure, I wouldn’t mind shooting the breeze for a moment. What’s on your mind?”</i>");
	}

	generateLaneTalkMenu();
}

function generateLaneTalkMenu():void
{
	clearMenu();
	
	addButton(0, "Occupation", laneTalkOccupation);
	
	if (flags["LANE_OCCUPATION_TALK"] != undefined) addButton(1, "Daynar", laneTalkDaynar);
	else addDisabledButton(1, "Daynar");

	addButton(2, lane.mf("Him", "Her") + "self", laneTalkThemself);
	
	addButton(14, "Back", laneShowMenu);
}

function laneTalkOccupation():void
{
	flags["LANE_OCCUPATION_TALK"] = 1;
	clearOutput();
	outputText("You ask Lane what [lane.hisHer] occupation is, out here in the middle of the Venar desert, setting up shop in some little mud hut. Beyond the codex lying atop [lane.hisHer] desk, [lane.hisHer] business seems very… rustic. There’s very little in the way of modernization here.");

	outputText("\n\n<i>“Yeah, you’re right,”</i> [lane.heShe] says proudly. <i>“I know my way around the modern world about as well as anyone else, but I try to keep my house, and my business, as down-to-earth as possible. I specialize in....”</i> [lane.HeShe] pauses, tapping a claw against [lane.hisHer] chin. <i>“‘Spiritualistic medicine,’ is one way of putting it.”</i> You ask {him} to elaborate.");

	outputText("\n\n<i>“Well, think about it. Say you don’t like something about yourself – maybe you’re too meek, or shy, or you have a nervous tic, or something. Maybe you’re just depressed. Today, most of those things can be fixed with a bottle of pills, or the push of a button, or a needle in your arm. Modern medicine is all well and good, and if I ever get sick with the pony pox, you’ll find me elbow-deep in my medicine cabinet. But maybe you have something a pill can’t fix, or maybe you’re not a fan of putting things in your body. That’s where I can help out.”</i>");

	outputText("\n\nA pair of thin, fleshy membranes unstick from the sides of [lane.hisHer] neck and flare open. They reach from the very edges of [lane.hisHer] shoulders to the bottom of [lane.hisHer] jaw on either side of [lane.hisHer] head. They have some markings and piercings on them, but they’re so thin that the glowing from the inside of [lane.hisHer] body is especially intense on them. <i>“I specialize in hypnosis,”</i> [lane.heShe] says, after letting you gawk at the red-and-blue flashing of [lane.hisHer] thin skin a bit. [lane.HeShe] presses the membranes flat against [lane.hisHer] neck again, stopping the light show. <i>“I can hypnotize anybody.”</i>");

	outputText("\n\nYou shake the lights from your eyes, and you scoff at {him}. Hypnosis? You’d have thought something as archaic as that would have phased out centuries before the first Great Planet Rush.");

	outputText("\n\n<i>“A lot of people thought so,”</i> [lane.heShe] said, lifting up [lane.hisHer] codex and pressing a few buttons on its screen. [lane.HeShe] then turned it towards you. <i>“Here are some customer testimonials if you’re unconvinced.”</i> On the bright screen was a sort of guestbook: different names and handwriting from every unique customer Lane ever had was there, and each of them sang [lane.hisHer] praises, assuring whoever read them that Lane was the real deal. [lane.HeShe] turns towards his bookcase. <i>“I also have a work permit, and a certification of guaranteed quality from the UGC, if you’d like.”</i> From its top shelf, [lane.heShe] pulls out two certificates, both of them framed, stamped, and signed. You can’t deny it – Lane is running a real, legitimate business in hypnotism.");

	outputText("\n\nYou return his codex to {him} and, intrigued, you ask {him} how hypnosis works, and how [lane.heShe] can use it as a business. <i>“The most important part is that the customer has to want it. If, say, you came to me complaining about your depression and you paid me to hypnotize it out of you, but you didn’t actually want it, then it would fail.”</i> [lane.HeShe] nods to the sign on [lane.hisHer] desk, tapping at the top line of the sign: the big words that say ‘No Refunds.’ <i>“That’s why there are no refunds. As soon as you give me the credits, I’m not giving them back. If nothing else, it provides a good incentive for people to want to get their money’s worth.”</i>[if {PC’s personality is ‘Mischievous’}[pg]You lean back in your chair and you smirk at {him}. If the customer really has to want it, then [lane.heShe] can’t exactly just walk down the street and hypnotize the money out of people’s wallets, then. <i>“Unfortunately, no,”</i> [lane.heShe] says, laughing with you. <i>“If I could do something like that, then I’d have taken up a job as a politician, or a news anchor; something to get me in front of a camera. But unless every single person watching me wants me to hypnotize them, all they’d see is a Daynar with a bunch of tattoos on [lane.hisHer] tassels. I’m afraid universal domination isn’t really in my schedule.”</i> You tell {him} that [lane.heShe] must be heartbroken, and [lane.heShe] just waves you off.]");

	outputText("\n\n<i>“So, are you convinced?”</i> [lane.heShe] asks, opening [lane.hisHer] hands to you. <i>“Would you like to give it a try? Or is there something I can help you further with?”</i>");

	generateLaneTalkMenu();
	addDisabledButton(0, "Occupation");
}

function laneTalkDaynar():void
{
	flags["LANE_DAYNAR_TALK"] = 1;
	clearOutput();

	outputText("You ask {him} about his species. When you first met, {he} introduced himself as a ‘Daynar’. <i>“That’s correct,”</i> {he} says, crossing {his} arms. <i>“We’re one of the many races natively found on the planet Venar. I’m told we closely resemble a common lizard on the planet Terra.”</i> You confirm. <i>“We’re big fans of hot, dry places, like the desert we’re under. We evolved from a smaller, more… beastly, single-minded creature only a few millenniums ago. A blink of an eye, in geological terms.”</i> {He} scratches the top of {his} bald, scaly head. <i>“Our evolution was natural for the most part, until aliens like yourself started showing up and polluting our sands with your biogenetic drugs. Not that I’m complaining, myself.”</i>");

	outputText("\n\nYou ask {him} if all the Daynar have blood that glows. You find it awfully distracting in a pleasant way. <i>“Oh, yes. It’s another evolutionary advantage, one we still use today. How brightly it glows is an indicator of the individual’s health and sexual potency – [if {Lane is male}the brighter it is on a male, for instance, then the healthier he is, and the more virile his sperm is.][if {Lane is female}the brighter it is on a female, for instance, then the healthier she is, and she’ll lay a larger, healthier clutch of eggs than others.] The way the blood pulses can also be a signal if a female Daynar is in heat.”</i> {He} looks away and sighs, twirling a claw on {his} desk. <i>“Back when we were still a fledgling species, we were hunted quite a bit for our blood. They were used for fancy baubles and knick-knacks: tacky, expensive glowsticks and the like. That stopped in a hurry, thankfully, once we learned how to talk. The UGC didn’t like the idea of hunting a sapient species, and made it outlawed.”</i>");

	outputText("\n\nYou look at Lane’s neck and chest, watching {his} blood course, {his} skin glowing an iridescent red and then a melancholy blue. [if {PC’s personality is not ‘Mischievous’}An obvious, quite personal question comes to mind, but you decide not to embarrass the poor thing.][if {PC’s personality is ‘Mischievous’}You ask {him} what {his} own glowing means for {his} health. <i>“I’m not asked that too often,”</i> {he} notes, looking down at {his} chest. <i>“I</i> feel <i>fine… I’m hardly a fitness nut, but I usually start my mornings with a set of [if {Lane is male}push-ups][if {Lane is female}crunches]. I think I’m about average.”</i> And, you ask... what about {his} ‘sexual potency?’ [if {PC is not hypnotized}The colour of {his} eyes change from brown to a rosy red, and {he} just chuckles and looks away.][if {PC is hypnotized} <i>“I should think you’d know,”</i> {he} says, flaring open {his} tassels for a moment, <i>“but I can give you a reminder a little later, pet.”</i> You feel something of yours flaring between your legs as well.]]");

	outputText("\n\nYou ask Lane about the weird membranes connecting {his} jaw to {his} shoulders. <i>“Oh, these,”</i> {he} says, flapping them open. Your eyes are caught on them, watching how {his} blood glows brightest through them, and how the veins in {his} skin work with the tattoos on – {he} closes them before you get a little <i>too</i> distracted. <i>“We Daynar call them ‘tassels’. They’re used to regulate our body temperature, and, if we’re in the middle of a fight, we can open them in a flash to scare our opponent. In today’s modern world, though, with air-conditioning, climate control, and not much in the way of natural predators, they don’t see much use anymore.”</i>");

	outputText("\n\n{He} opens his eyes wide – unusually wide, making you fidget in your seat – and, just like that, the colour of Lane’s irises begin to change, into every colour you can imagine. <i>“Daynar don’t have the best night vision, so we can open our eyes really wide to draw in more light to compensate. As for the irises… nobody is really sure why we can do that. Our best guess is to unnerve predators: to make us look sickly and unappetizing. Whatever the purpose, they sure make my job easier.”</i> {He} points to the sides of {his} head. <i>“Our ears are pretty plain,”</i> {he} begins. You have to lean forward to see where {his} ears even are: they’re just a pair of holes in {his} head, nothing more. <i>“But we have</i> great <i>hearing. Some Daynar pick up jobs as interpreters because we have an easier time picking up different languages than most.”</i>");

	outputText("\n\n{He} leans forward in {his} seat. <i>“There’s just one more thing I want to mention. It’s about Steele Tech.”</i> You match {his} posture, interested. <i>“I don’t know if you knew this, but most Daynar on the planet are employed by Steele Tech. Venar, it turns out, has a lot of minerals and ores that the rest of the universe is interested in, but no other race can withstand the harsh climate of the hot desert or the planet core like a Daynar can. Which makes us</i> highly <i>desirable for a mining company. Your dad paid us pretty well, and his stickler for safety carried over to Venar; there isn’t a Daynar here that wouldn’t mind calling you ‘boss’ if you kept up his legacy, [pc.name].”</i>");

	outputText("\n\nYou shift in your seat, uncomfortable with the sudden pressure, but you assure {him} that you’ll do what you can. Lane leans back, relaxing. <i>“That about covers it, I think. Is there anything else I can help you with?”</i>");
}

function laneTalkThemself():void
{

}