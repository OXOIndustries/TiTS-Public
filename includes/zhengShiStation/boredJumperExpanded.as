import classes.Characters.JumperBored;

/*
By William

Bad End! A bad end is triggered upon losing 5 consecutive times to the Bored Jumpers. 
More loss scenes will be written. Upon a 3rd consecutive loss to the Jumpers, the new loss scenes will play sequentially until the player is Bad Ended. 5th loss is Bad End. Fen's original scenes will play otherwise. If the player wins at any point, the count is reset.
In addition to the Bad End stuff, a new win scene written: [Blow Her]. Bit heavy on the Dom & Mischievous stuff in this, meant to balance out the win scenes I wrote.
Added the Jumper's Red Beret as a potential drop from winning against them.
*/

//Add to Win Scenes 
// A firm, formal blowjob scene, forks for denying her or letting her get off with some extra bits.

//[Blow Her]
// Tooltip: The jumper's cock is bulging so temptingly against the latex. You could teach the libidinous lapine a very <i>blue</i> lesson... or immerse yourself. She does smell good...
// PC will suck off the bored jumper.
// Can choose to deny her, which can possibly tie into the ship scene for some discoverability & fun.
// Can also choose to just indulge your subbiness.

public function blowZatJumpah():void
{
	clearOutput();
	showBoredJumper(true);
	author("William");
	// PC Bimbo
	if(pc.isBimbo()) output("<i>“Aw, how can I leave a sweetie like you in pain?”</i> you grin, rubbing your foot over the laquine’s latex bulge. <i>“I’ll treat you <i>just</i> right, we’ll both get what we want!”</i>");
	// PC Bro
	else if(pc.isBro()) output("<i>“It’s no good being like that.”</i> You scratch your chin thoughtfully, considering how best to handle this pirate. <i>“I’ll give you a hand, babe,”</i> you say, although you can’t shake a different feeling...");
	// PC Kind
	else if(pc.isNice()) output("Your nose tickles as the laquine’s aroma washes through your nostrils. Your eyes zero in on the unmistakable bulge behind her latex suit, and you can’t help but feel like it’d be unkind to leave her in this state. <i>“I’ll help you out...”</i> you whisper to her, a lascivious grin forming on your face, <i>“so long as you’re a good girl.”</i>");
	// PC Misch
	else if(pc.isMischievous()) output("Gasping for air in light of your combat, you succumb to the sweltering haze and laquine musk permeating the soupy air. Your eyes are drawn her prominent bulge, and a devious thought crosses your mind. You say, with a hint of erotic tone, <i>“I think I’ll help you out, I’m feelin’ a bit ready myself...”</i>");
	// PC Hard
	else output("Scoffing at the smell in the air, you scowl at the incorrigible pirate beneath you. The heat alone is enough to erode rationality, but her fertile scent has gotten you ready. A crafty thought crosses your mind, a way to teach her a lesson, <i>if</i> you can hold it together... <i>“Come here”</i> you huff, <i>“I’ll take care of that.”</i>");

	// PC Low Libido (<=33)
	if(pc.libido() <= 33) output("\n\nYou stand over the [enemy.furColor]-furred laquine’s kneeled figure and bend down to her head. Unsure of what you’re intending, she idly rubs her distended crotch whilst your [pc.hands] trail up her abdomen and cup her sizeable tits. Her cute lips curl and spread, a whorish moan of pleasure flowing from her O-mouth when you pinch her bulging nipples outlined perfectly under her sexy, squeaky uniform. Her back arches, thrusting her chest out into your palms, all but begging you for more. Relenting, you drop one hand and let the other rise to the zipper at her neck, tugging it down slowly until her sizeable, sopping chest pops free. Not stopping there, you further unseal her baked body until her [enemy.cock], straining against the rubber barrier, flops out from its pocket of musk.");
	// PC Medium Libido (34-66)
	else if(pc.libido() <= 66) 
	{
		output("\n\nYou turn and straddle the [enemy.furColor]-furred laquine’s head with your [pc.ass], using her as a stool and forcing her to breathe in your scent for a change. Stealing a rough grope at her creamy tit and an almost violent pinch at her suckable nipple, your free [pc.hand] tugs the zipper at her neck down. It takes some doing getting it past her mountainous mammaries, but those baked breasts are soon heaving in full view under the cheap light. Feeling the pirate’s tongue prodding at ");
		if(pc.hasVagina()) output("[pc.oneVagina]");
		else if(pc.balls > 0) output("[pc.balls]");
		else output("[pc.asshole]");
		output(", you twist her nipple until she groans into your [pc.butt] and yank the zipper down past her straining bulge, letting her [enemy.cock] flop out from its musk pocket with a loud ‘eek’ from her mouth.");
	}
	// PC High Libido (>=67)
	else
	{
		output("\n\nStricken with ambient lust, you excitedly frot the [enemy.furColor]-furred laquine’s head with your [pc.groin], rubbing her nose between your [pc.thighs] while clutching her floppy ears, wringing sweat from balmy fur like water from a dishrag. You tell her to get that jumpsuit off while you enjoy yourself, and her frenzied paw darts for the zipper at her neck, doing her best to hold her breath while submerged in your ");
		if(pc.isHerm()) output("hermaphroditic");
		else if(pc.hasCock()) output("masculine");
		else if(pc.hasVagina()) output("feminine");
		else output("bare");
		output(" furnace. The familiar sound of a zip-clasp raking open reaches your [pc.ears], and you look down to see the pirate’s [enemy.cock] flop free of its musk pocket. Satisfied, you slide off and get ready to show her just how horny you are.");
	}
	// Merge
	output("\n\nYour slut-bunny’s hormonal hyperventilations have your head spinning. Her body heat, her pheromones");
	//, pcSweatPheromones:
	if(pc.hasPheromones()) output(", your own lust laced perspirant");
	output(" - it’s all mixing into a cocktail no normal bartender could reproduce. Just soaking in her erotic grovelings and futile thrusts for imaginary relief fuels the commanding fire within you, reminding you just how much control you have over her now. ");
	if(pc.hasVagina()) output("[pc.EachVagina] aches");
	else if(pc.hasCock()) output("[pc.EachCock] throbs");
	else output("Your [pc.asshole] clenches");
	output(" just seeing her imposing, foot-long [enemy.cockNounSimple] twitching, dribbling salty pre like a faulty hydrant all over itself. Her ripe, sweat-drenched body is ready to breed, or be bred; the bunny’s cock stretching out from her musky crotch desires ample respect and adoration. Decisions, decisions!");
	output("\n\nThis rabbit before you is just another toy now, so addled by lust she’s intimately vulnerable to whatever you might have planned, merciful or merciless. Licking your [pc.lipsChaste], you glance at her languid [enemy.eyeColor] eyes and touch your nose to her [enemy.cockHead]. It’s almost magical seeing her tip swell, her urethra bulge, and the veins strain all along her [enemy.cockType] shaft throbbing to the beat of her heart. Every phallic neuron in her brain fires at the sensation that courses through her... and through you. <i>“Y-you could be a bit faster, cutie, but... I-I guess you won h-huh?”</i> the pirate murmurs, still writhing in your agonizingly slow ministrations. <i>“W-w-well it’s all there, you wanna get your present?”</i>");
	output("\n\nYou chuckle softly, feeling her delicate mit on your head now");
	if(!pc.hasNonScritchEars()) output(", scratching expertly at your [pc.ears] in soft, gentle encouragement");
	output(". ");
	if(pc.tailCount > 0) output("Your [pc.tails] wag" + (pc.tailCount == 1 ? "s":"") + " involuntarily. It is, after all, nice to be praised for being a good [pc.boyGirl]. ");
	output("Extending your [pc.tongue], you lap around her tingling cumslit, licking the alien flavored ring of her [enemy.cockHead]. You gently wash the jewel in her crown, eventually trailing down to her " + (!enemy.hasKnot(0) ? "base":"swollen knot") + ". Exhaling hotly, you breathe over her heavy, furry balls, letting your tongue swab the swirled drops of sweat and piquant pre mingling there." + (pc.hasTongueFlag(GLOBAL.FLAG_LONG) ? " As a flourish, you use the endowed length of your tongue to wrap around her cock and balls all at once, jerking and squeezing with a tiny giggle, unwinding to go at her puffy horse-pussy next.":"") + " Your legs squirm and grind together, " + (pc.hasVagina() ? "[pc.eachVagina] leaking":"[pc.eachCock] straining") + " for more action. You savor the zesty tang of laquine perspirant atop her tender, sloshing nuts, close to indulging yourself at your own expense. As <i>hard</i> as it is, you remind yourself to hold on a little longer!");
	output("\n\n<i>“Oohh.. Come on! I know you won but... but.. I neeeeeed you! I want you! Please let me cum! You can ride me until my legs fall off and I’ll cum so hard you won’t get horny for weeks!”</i> she begs. Orally trailing up her cock, inundated with her aroused whimperings, you smile mischievously - your [pc.lips] come so tantalizingly close to wrapping around her [enemy.cockHead]. You could teach this dopey pirate a lesson, get her so close to cumming and deny her until her brain trickles out those big ears of hers, or... you could just suck her off, and give into the swirling effluvium of aerial libido that you’ve immersed yourself in. The urging hand at your head makes the prospect of being ‘kind’ to her all the more mentally pleasing...");
	processTime(20);
	clearMenu();
	addButton(1,"Deny Her",denyThatBunslutHerJustCummuppance,undefined,"Deny Her","Stick with the plan, teach her a lesson! Mess her up so bad that even when she cums it’s going to remind her what happens when someone messes with you!");
	addButton(0,"Suck Her",suckDatBun,undefined,"Suck Her","Forget the plan and just suck her cock.");
}
public function denyThatBunslutHerJustCummuppance():void
{
	clearOutput();
	showBoredJumper(true);
	author("William");
	output("<i>“No,”</i> you say evenly, swatting her fuzzy [enemy.furColor] hand away. Overcoming the mindless lust you’ve been subjected to, you eye her with unyielding confidence, ready to turn the tables. The horny jumper stares nervously into your [pc.eyes], her ordinarily bubbly leporine features shift to blue gloom when she sees the shrewd smile on your [pc.face].");

	// PC Bimbo
	if(pc.isBimbo()) output("\n\n<i>“Right now, this is all about me. Sorry, babe, but you’re not gonna cum in my mouth today!”</i> You wag a finger at her before squeezing the base of her [enemy.cock]. It’s a shame you’ve staunched the flow of cum but she’s gotta learn her place!");
	// PC Bro
	else if(pc.isBro()) output("\n\n<i>“No can do, hon,”</i> you murmur, squeezing the base of her [enemy.cock] just before she blows. <i>“This isn’t about you right now.”</i>");
	// PC Kind
	else if(pc.isNice()) output("\n\nA sinfully lewd smile crests your face as you tighten your grip around her [enemy.cock] just before she cums. <i>“I’m afraid I can’t let you cum, not after what you tried to do. This is only fair, don’t you think?”</i> You give her a casual wink.");
	// PC Misch
	else if(pc.isMischievous()) output("\n\nA toothy grin widens your flushed cheeks as you squeeze the laquine’s [enemy.cock], denying her an explosive orgasm. <i>“Sorry, not sorry. Did you think I forgot what you just tried to do?”</i> You grip her soft balls and flash her a toothy grin.");
	// PC Hard
	else output("\n\n<i>“Did you think I was that easy?”</i> A low cackle rumbles up your throat. You pinch her soft balls and squeeze her [enemy.cock] to block her release. <i>“We’re going to have some real fun now!”</i>");
	// Merge
	output("\n\nMoaning loudly, the laquine barely holds herself up while you jerk her rock hard [enemy.cockType] shaft" + (enemy.hasCock(GLOBAL.TYPE_CANINE) ? ", sometimes caressing her inflated knot with a lurid flair":"") + ". You smirk at her gibbering moans, and at the leaky cum bubbling out of her [enemy.cockHead] like a sputtering hose. She must want to cum badly! You tell her she should have thought about that before hopping you up.");
	output("\n\nAt a loss for words, her baser instincts take over. Her muscled hips buck with all their stored energy in your [pc.hands], using your [pc.skinFurScalesNoun] palms as a makeshift onahole. Oh no she doesn’t!");

	// PC is taur
	if(pc.isTaur()) output("\n\nYou keep one hand gripped around her shaft and push her down. You’re not about to let her get off, especially not before you do. It’s a bit awkward and you have to work fast, but you clamor on top of the laquine and sit yourself down on her. Thanks to her sheer size, you have no trouble attending her crotch while she gets first-class access to yours.");
	// PC is naga
	else if(pc.isNaga()) output("\n\nYou slither the tip of your snake coils under the jumper’s prone form and quickly envelop her in your [pc.leg]. It takes a little doing, but you find a compromising position that gives her access to your [pc.crotch] and you the space to work on hers.");
	// PC is bipedal
	else output("\n\nYou keep one hand gripped around her shaft and push her down. Your own needs come first, <i>maybe</i> you’ll let her get off, but her mouth has an appointment with " + (pc.hasGenitals() ? "your [pc.crotch]":"your [pc.asshole]") + ". Swiveling your [pc.legs], you clamor on top of the soaking, half-clothed bunny, still careful to prevent her from cumming, and pin her under your weight in a sudden sixty nine!");
	// Merge
	output("\n\n<i>“Wahhhaaaa...!”</i> she whimpers, <i>“Let me cum pleaaaaase, don’t edge meee!”</i>");
	output("\n\n<i>“You’re going to have to work for it!”</i> you quip, half smiling. <i>“Let me know just how much you want it, understand?”</i>");
	output("\n\nHaving thrown her the figurative rope, the laquine grips your rocking hips" + (!pc.isCrotchExposed() ? ", pulls aside your [pc.crotchCover],":"") + " and digs in. The warm, thick flesh of her tongue lashes at every drop of " + (pc.hasPheromones() ? "pheromonal ":"") + "perspirant in your nethers like it’s a drop of blessed, liquid relief from the sexual suffering you’re inflicting on her. You stifle a laugh, feeling her whiskers looking for a place to settle in and tend to. The horny jumper embraces her role as your bottom bitch, eagerly ");
	if(pc.hasVagina()) output("sucking your [pc.oneClit]");
	else if(pc.balls > 0) output("sucking your [pc.balls]");
	else output("tonguing your [pc.asshole]");
	output(" in the hope you’ll get her off too.");

	output("\n\nOne eye shut, you refocus on the 13 inches of [enemy.cock] at your nose, ignoring the puffy equine cuntlips beneath her sack. The thrill of teasing her to the end keeps you from falling prey to the sexual saturation sifting into your pores. What you taste in her cock isn’t submissive relish, it’s the <i>taste of victory!</i> And it’s a flavor you like! You proudly bask in the bliss and euphoria of sexual control. The athletic bunny beneath you struggles limply against your spasming body, frantic to satisfy more of you. The thought that you’ll do the same for her carries her through these erotic tribulations. With the heat and musk roiling in your mind, you lift your hips and submerge the rabbit’s flat nose in your loins, ");
	if(pc.hasCock()) output("thrusting " + (pc.cockTotal() > 1 ? "one":"your") + " [pc.cock] down her mouth.");
	else if(pc.hasVagina()) output("drawing her into your [pc.pussy].");
	else output("giving her access to your [pc.asshole].");

	output("\n\nWith her well on the path to pleasing you, you shift the violently twitching tip of her [enemy.cock] to your mouth and bring it past your lips. Draping your [pc.tongue] over her cumslit, you ring her glans and coil around the neck of her cock-head, able to smell her extremely potent seed through the taste of rabbit pre alone, pent up by your devilish service. Keeping your hips busy, you ");
	if(pc.hasCock()) output("plow her face smoothly");
	else if(pc.hasVagina()) output("grind your cunny against her face");
	else output("wiggle your [pc.ass] against her intruding tongue");
	output(", making sure she gets everywhere she needs to be ");
	if(pc.hasCock()) output("on your [pc.cockNounComplex]");
	else if(pc.hasVagina()) output("inside your [pc.pussy]");
	else output("inside your [pc.asshole]");
	output(".");

	output("\n\nHer hands knead your [pc.hips] and squeeze your [pc.ass] tightly; you can hear what sound like excited words" + (pc.balls > 0 ? " reverberating past your [pc.balls]":"") + ". Her vibrator-quality tongue skillfully brings you closer and closer to orgasm, and, she thinks, to her own inside your warm mouth.");
	if(pc.totalVaginas() > 1)
	{
		output(" Seemingly unable to choose from the variety of [pc.eachVagina], you feel her frenzied " + (!pc.hasCock() ? "tongue":"fingers") + " darting between every opening there is, unable to contain the sheer amount of slime coursing down her chin.");
	}
	output("\n\nYou cup her furry nuts, feeling them trembling smoothly in your palms, kneading them as you bob up and down her precipitous shaft. Her groans turn to shrieks with every long rub down her ornery orbs, and you can feel her load leaking up into your mouth. The thick taste of her spatter batter draws a gasp too hot for you to handle, and that abrupt suction has her nearly detonate between your cheeks. Her back arches and she thrusts you upwards, slapping her fuzzy [enemy.furColor] crotch wetly against your chin. Your own arousal peaks, and you push back, squeezing her swelling [enemy.cockNounSimple] with all your might.");

	output("\n\nFinally, the moment is upon you. The time has come... as have you! You cry out - your hands still tight around her [enemy.cock] - and burst." + (pc.hasCock() ? " Hot air flees your swollen lungs as hotter cum surges into the once smug pirate’s mouth.":""));
	// PC cock and vagina
	if(pc.isHerm())
	{
		output("\n\n[pc.EachCock] and [pc.eachVagina] burst simultaneously. [pc.Cum] flows down the hungry herm’s mouth as gushes of [pc.girlCum] leave a permanent scent of you in her perspiring fur." + (pc.cumQ() >= 10000 ? " You spurt so much into her mouth that she can’t swallow the sheer volume of your load. Your [pc.cumVisc] seed spills out from her lips, running down her cheeks and chin.":"") + " The laquine’s eyes roll back into her head, overwhelmed by the many sensations coursing through her edged body.");
	}
	// PC cock
	else if(pc.hasCock()) 
	{
		output("\n\nYou feel your thick load shoot up your [pc.cocks] and straight into the laquine pirate’s gullet. Hot strands of [pc.cumVisc] [pc.cumType] paint her accepting throat [pc.cumColor] and settle in her gurgling stomach.");
		if(pc.cumQ() > 10000) output(" So much flows up her throat that it soon spills out from her lips");
		output(".");
		if(pc.cockTotal() > 1) output(" Your extra cock" + (pc.cockTotal() > 2 ? "s":"") + ", stimulated by her [enemy.furColor] fur, erupt between her chest and your abdomen, mottling her with a [pc.cumColor] puddle that collects under her arms.");
	}
	// PC vagina
	else if(pc.hasVagina())
	{
		output("\n\nYou feel your [pc.pussy] contract around the tip of the laquine’s tongue, and soon your spasming muscles give way to a gushing stream of [pc.girlCum]. [pc.eachVagina] " + (pc.isSquirter() ? "splatters":"coats") + " the pirate herm’s face with " + (pc.isSquirter() ? "a veritable waterfall of [pc.girlCumVisc] [pc.girlCumType], glazing her perspiring fur with your resilient scent.":"a thin coat of [pc.girlCumVisc] [pc.girlCumType] and your own resilient scent."));
	}
	// PC neuter
	else output("\n\nYour [pc.asshole] clenches around her tongue and your body shakes in vigorous orgasm. While you enjoy yours, you prevent hers.");
	// Merge
	output("\n\nRiding the throes of your orgasm, the strength of the laquine’s cock is admirable. Her thrumming heartbeat, felt in your tight stomach and in her engorged dick, is beating double time to keep her conscious and to bring her the release she needs. Maybe you should let her cum? It occurs to you that she worked hard and obediently to get you off...");
	processTime(20);
	pc.orgasm();
	clearMenu();
	addButton(0,"Let Her Cum",letHerCum,undefined,"Let Her Cum","It <i>would</i> be a prick move to leave without letting her get off after that performance.");
	addButton(1,"Watch",watchDatBunBunBun,undefined,"Watch","If you want to leave an impression, you could keep her down until she goes flaccid!");
	addButton(14,"Leave",leaveDatCummerbund,undefined,"Leave","You got what you wanted, let her be!");
}

//[Leave Her]
// Tooltip: You got what you wanted, let her be!
public function leaveDatCummerbund():void
{
	clearOutput();
	showBoredJumper(true);
	author("William");
	output("You hold on tight, keeping her straining sack from depositing its hoard on you and her. You feel her whimper and whine beneath you now, pawing feverishly wherever her hands may rest.");
	output("\n\nBut you don’t let her. <i>“Thanks for the attention, but I’ve got to get going. Don’t you dare cum before I’ve gone!”</i> you warn her.");
	output("\n\nA long, drawn out whine escapes her lungs as her cock settles down again. You slowly rise, keeping your sex-soaked hands around her [enemy.cockType] shaft. It’s hard not to admire the supine slut: her tongue" + (pc.hasCock() ? ", stained with cum,":"") + " is hanging far from her slack jaw. Her wet boobs heave under the dim light, and she deliriously feels out for her priapistic cock, surely aching and numb with unsatisfied lust. <i>“Maybe next time I’ll let you get off. Gotta jump!”</i> you say, scampering off with a cheap laugh.");
	output("\n\nIn the distance, you can hear the simultaneous cries of blue pain and pleasure as the over-aroused jumper works to relieve herself of your indelible dominance.\n\n");
	pc.addMischievous(1);
	CombatManager.genericVictory();
}

//[Let Her Cum]
// Tooltip: It <i>would</i> be a prick move to leave without letting her get off after that performance.
public function letHerCum():void
{
	clearOutput();
	showBoredJumper(true);
	author("William");
	output("Yeah, it wouldn’t be fair to leave her like this. You furiously masturbate her [enemy.cock], feeling it swell up <i>even more</i> in your pumping hands. You wrap your [pc.lips] around her tip again, swirling your tongue over her [enemy.cockHead]. <i>“Go on, cum!”</i> you order.");
	output("\n\nWith a sharp, loud gasp, the jumper’s limbs lose all strength and movement. Her huge hips buck into your face, her ballooning tip ramming the roof of your mouth - she squeals in mind-washed delight that you are finally allowing her to cum. A pained scream heralds the first raging river of jumper’s jism surging up her urethra, taking advantage of the cracks in the dam. Her hot, sticky cum, salty as can be, punches into your throat like a thrown lance, and behind it are three more thick lines, and behind those...");
	output("\n\nShe cums for over a minute straight, moaning and shrieking in blue pain, smoothly pumping her hips up and down, filling your stomach with seemingly endless amounts of searing spunk. You swallow and you swallow, drinking what you can before reaching your limit. When you pop her free of your mouth, you help churn out her last loads, making sure to fully drain her sagging sack of every drop all over your face and herself.");
	output("\n\nSighing contentedly, you wipe your face with her jumpsuit and stand, turning around to admire the supine slut. Her tongue" + (pc.hasCock() ? ", stained with cum,":"") + " hangs far from her slack jaw. Her wet boobs heave under the crappy lights, but she looks satisfied beyond belief and quite ready for a nap. Her cock goes limp, stands of laquine love connecting the crown of her cock to varying parts of her defenseless form.");
	output("\n\n<i>“Let me know next time you’d like to get edged, huh?”</i> you smirk.");
	output("\n\n<i>“Hhhhiii....”</i> she heaves, <i>“Noooo... I hate getting edged... Please no more! It felt great but it hurts so much!”</i> she whines as you kneel next to her, looking for something valuable.");
	output("\n\n<i>“Think about that next time, then!”</i> you give her a tiny finger wave, <i>“Gotta jump!”</i>");
	output("\n\nYou scamper off, hoping that dopey fuckbunny has learned a lesson thanks to your indelible dominance.");
	pc.addNice(1);
	processTime(10);
	pc.loadInMouth(enemy);
	output("\n\n");
	CombatManager.genericVictory();
}

//[Watch]
// Tooltip: If you want to leave an impression, you could keep her down until she goes flaccid!
// Shift the PC towards Hard alignment
public function watchDatBunBunBun():void
{
	clearOutput();
	showBoredJumper(true);
	author("William");
	output("No, she doesn’t deserve to get off! And you’re going to make sure this one sticks!");
	output("\n\nYou stay right where you are, restraining the callous pirate. You keep her breeder’s hips pinned and her languid paws away from her [enemy.cockType] dick as it twitches violently in front of your [pc.face]. You don’t dare touch it, you simply admire how her heartbeat slows, and with it, the throbbing in her [enemy.cock]. Cold shivers run through her [enemy.furColor] colored frame, and you see her finally calming down from the fun you’ve both had.");
	output("\n\nThough, in the bunny’s case, her calm is merely a prelude to an inner storm.");
	output("\n\nWhat comes out of her short-muzzled mouth are stunted gasps and whimpers. Her [enemy.cockNounSimple] deflates, shrinks and falls sullen against one sweaty thigh. She shivers again, and you stand, looking down at her heaving, supine body. Her thick thighs clench against her quivering nuts, and she stares at you with a mix of longing and scorn. Even those emotions fast fade in the aftermath of your indelible dominance.");
	output("\n\nYou collect your material reward, watching her thrust helplessly into the air, completely frustrated and broken. As you turn to leave, she sits up and tries to get herself hard again, to cum, to do anything to relieve herself of your cold mark.");
	output("\n\n<i>Doesn’t sound like it’s going too well</i>, you think, already long gone.\n\n");
	pc.addHard(1);
	processTime(5);
	CombatManager.genericVictory();
}

//[Suck Her]
// Tooltip: Forget the plan and just suck her cock.
public function suckDatBun():void
{
	clearOutput();
	showBoredJumper(true);
	output("Ahh... How can you deny this cute bunny now? You went through all this effort and she’s about to blow! Humming to yourself, you give up on the idea of denying her - for now - and decide to give the fussing pirate one hell of an orgasm. Besides, she looks like she’s gotten the message. Giving yourself over to the seductive heat, and to her, the jumper’s moist paw settles deeper on your head" + (pc.hasHair() ? ", fingers threading your [pc.hairs],":"") + " pulling you onto her [enemy.cock] with a gentle ushering. Efflorescent warmth fills you feeling her dainty digits scratching " + (pc.hasNonScritchEars() ? "your scalp":"the delicate skin of your [pc.ears]") + ", her cock musk stoking your feral arousal" + (pc.tailCount > 0 ? " and the furious wagging in your [pc.tails]":"") + ".");
	output("\n\nYou <i>need</i> to suck her cock, and you <i>need</i> her affections.");

	// PC Low Libido (<=33)
	if(pc.libido() <= 33) output("\n\nYour [pc.tongue] gingerly tastes her [enemy.cockHead], drawing her [enemy.cockNounSimple] into your mouth. A long, loud moan escapes the pirate’s [enemy.lipColor] lips as you blow her in earnest, inhaling her [enemy.cockType] shaft like air. She doesn’t force it down your throat, instead letting you set the pace. The horny bunny quickly settles into the glow of having her overteased dick sucked and licked by a skilled, sensual partner.");
	// PC Medium Libido (34-66)
	else if(pc.libido() >= 66) output("\n\nYou gladly work her [enemy.cockHead], drawing her [enemy.cockNounSimple] into your mouth with a greedy suck for air and dick. Loud, pained and pleasured moans escape the pirate’s [enemy.lipColor] lips as you give her the blowjob she was hoping... <i>dying</i> for. She lets you set the pace, and settles into the glow of having her overteased dick tended by your skilled, accepting mouth.");
	// PC High Libido (>=67)
	else output("\n\nWith a hot breath, your [pc.lips] swallow up the laquine’s [enemy.cockHead], slurping her pre-dribbling cumslit loudly before taking her on a pleasure cruise to the back of your mouth. With stars in your lewd eyes, you hollow your cheeks and suck hard on her overteased dick, clenching her as well as any pussy. She lets you set the pace, settling into the glow of finally having her pent up stress relieved. Her happiness is yours.");
	// Merge
	output("\n\nThe laquine’s hips shift and she wraps her legs around your sides, bringing you closer to her hazy crotch, only getting you more and more turned on. Your [pc.tongue] sticks out the bottom of your lower lip, massaging her bulging urethra while you bob up and down on her thick tool, savoring the ambrosial taste of a sexy pirate fuckbunny. Your first movements are soft and replete with sexy kisses, setting a rhythm that will quicken only when your lungs are ready for it. One [pc.hand] drops to the herm’s weighty nads, dripping with sweat and pre, to cup and knead her heavy testes. You smirk at the edge of your mouth hearing - and seeing - the bunny woman arch back and cry out in wild pleasure.");
	output("\n\nHer [enemy.eyeColor] eyes meet with yours, shining with adoration, her cute face begging you for more and more. <i>“Yeah, yeah! That’s awesome, cutie, keep going! You’re just the best ever, I’m sorry I attacked you!”</i>");
	output("\n\nJust seeing her [enemy.cock] so <i>hard</i> and <i>stiff</i> makes you wriggle thinking about doing more with it... Regardless, you may be the one between her legs, but her orgasm is yours to decide, and she knows just what you’re capable of if she doesn’t submit to your methodical ministrations. You pull her dribble-happy cock free of your lips with a wet pop, breathing over her warm, quivering [enemy.cockNounSimple] shaft. You lower your nose to the vast field of ballsflesh again, jerking and squeezing her rod with one [pc.hand] and caressing her fuzzy thigh in the other. Your fingers wring sweat from her [enemy.furColor] fur until it pools and sizzles down her muscular thigh onto the rocks where it evaporates, the laquine cooing in lustful delirium every second.");
	output("\n\n[pc.Face] burrowed in her nuts, you kiss and gently nibble on the slut-bunny’s balls, giving her [enemy.cock] a vigorous jerking the whole time. Your right hand darts to your aroused crotch, ");
	if(pc.hasCock()) output("[pc.eachCock]");
	else if(pc.hasVagina()) output("[pc.eachVagina]");
	else output("[pc.asshole]");
	output(" in desperate need of attention as the fetorous cloud of a lusty laquine flips the last stubborn switches in your brain. If you’re gonna get off, you’ve gotta go hard! You drag your tongue up off her nuts to the underside of her dick, marching back up to the deluge at her [enemy.cockType] tip, and take the leporine lollipop into your mouth again. You wrap both of your [pc.hands] around the base of her shaft and jerk her while you suck her off.");
	output("\n\nThe addled slut cups her tits and pinches her " + (enemy.hasCock(GLOBAL.TYPE_FELINE) ? "pierced ":"") + "nipples, kneading her boobs together and squeezing them as if to squirt milk. Instead, she only squirts sweat that nearly lands on your cheek. Grinning with a mouthful of [enemy.cockType] meat, you raise one hand to her chest and join her. You get a good feel of that bulky, puffy nipple before tugging on it " + (enemy.hasCock(GLOBAL.TYPE_FELINE) ? "and her piercing ":"") + "as hard as possible, letting her malleable marshmallow jiggle and bounce back each time. If this slut’s nipples were any harder, they’d be no different from her cock!");

	output("\n\nPride wells within you with the same viscosity of your building orgasm. You’re close to your breaking point, but you’re also surprised how well you’ve managed to tend this rabbit without letting her cum too early. Your sore jaw, stretched by " + Math.round(enemy.cocks[0].cLength()) + " inches of throbbing laquine dong, has to stretch even further when you take her [enemy.cock] past your tonsil and into your throat. You feel every zap and shock rock her body as you imprison her thumping tool and deepthroat her with a soft squeal.");
	output("\n\nYou nearly gag around her foot long prick, not because of her size, but because of the sheer amount of pre flowing down your burning throat. Tears form at the edge of your eyes attempting to hilt her, a stoic effort to get more of the taste you now desire at a deeper level. Despite how sensitive she is, you manage to take her all the way, your nose submerged in her pheromone-laden abdomen. You hold for a moment before pulling back. A giggle rumbles up from your abused throat; you suppress your gag reflex and torment her just a bit longer with the prospect of filling your stomach with cum.");
	output("\n\nFeeling the building pressure in her supple, creasing sack nuzzling your palm, you know she’s about to <i>explode</i>. The only question you have now... where does she get to cum? You’ll be walking funny if she bloats your belly, but it’d be just as fun to watch her surf on the veritable tide of cum boiling inside her balls. Whilst you feverishly fellate her, a vial filled with cyan liquid slips from one of her bags and plinks against the warm rocks below, giving you one <i>very</i> special idea...");
	processTime(20);
	pc.changeLust(100);
	clearMenu();
	addButton(0,"Inside",insideTheWunderbun,undefined,"Inside","Let her cum inside, feeding you the fruits of your labor.");
	addButton(1,"Outside",jerkOnYouYaDegenerate,undefined,"Outside","Watch her cum all over herself. And you!");
	if(pc.hasItemByClass(Throbb)) addButton(2,"Use Throbb",useThrobbOnBunbun,undefined,"Use Throbb","Stick her with a dose of throbb and see what happens this close to her orgasm.");
	else addDisabledButton(2,"Use Throbb","Use Throbb","You’d need some Throbb in order to use any!");
}

//[Inside]
// Tooltip: Let her cum inside, feeding you the fruits of your labor.
// PC gets ‘Bulky Belly’, ‘Orally Filled’
public function insideTheWunderbun():void
{
	clearOutput();
	showBoredJumper(true);
	author("William");
	output("It’d be a waste to let all that sticky cum just burn out on the hot ground. You " + (pc.hasCock() ? "jerk":"finger") + " yourself vigorously in anticipation of your own climax, keeping the laquine’s [enemy.cockHead] in the center of your mouth where it enjoys the attentions of your [pc.tongue]. You coil around and ring her [enemy.cockHead] with flushed cheeks" + (pc.hasTongueFlag(GLOBAL.FLAG_LONG) && pc.hasTongueFlag(GLOBAL.FLAG_PREHENSILE) ? ", even jerking her whole length with your tongue alone,":"") + " slurping the never-ending supply of pre unloading into your gut. One hand in your nethers and the other on her shaft, you give your slut-bun the non-verbal signal she’s been waiting so patiently for, and allow her to cum. You feel each of her nuts <i>wrestling</i> for the position!");
	output("\n\nYour cheeks puff out instantly, smashed wide by copious amounts of cum blasting from her urethra into your mouth. You don’t even have time to seal it in, cummy saliva already flows from your [pc.lips] like rain. It doesn’t take long before the pooling seed in your mouth needs to go somewhere, and down your throat it trickles into your gurgling gut. You swallow hard and as frequently as possible so as not to waste anymore of her vast, enviable load of tasty, salty rabbit spunk.");
	output("\n\nBut it is a futile effort. With how long you dragged her on and from how backed up she was, you sputter and gag hard around her dick and wrest it from your mouth while your own orgasm rockets up your spine. Her gradually depleting balls deposit the rest of her load all over your face" + (pc.hasHair() ? " and your [pc.hair]":"") + " while you");
	if(!pc.hasCock()) output("r");
	if(pc.hasCock()) output(" jerk jets of [pc.cum] from your [pc.cocks]");
	else if(pc.hasVagina()) output(" [pc.pussy] " + (pc.isSquirter() ? "drenches":"moistens") + " your [pc.thighs]");
	output(" in orgasmic delight. Smeared in laquine cum, ");
	if(pc.libido() <= 33) output(" you breathe deeply in satisfaction.");
	else if(pc.libido() <= 66) output(" you rub it into your pores, cooing all the while.");
	else output(" you happily taste everything that you can, rubbing yourself all over with her cum.");
	output("\n\nThe jumper lets out a deep, stinging sigh as she crumples forward. Her red-tinged face is awash with sweat, and all she can do is pant in the glory that is the climax of galactic proportions you brought her to. The way she sounds and looks right now is an incredibly flattering sight to behold. You were able to keep her going that long and bring her to such a wonderful orgasm through your mouth and hands alone!");
	output("\n\n<i>“G... geez...”</i> she hoarsely mutters, <i>“you really like playing the long game, huh cutie? Gosh... you have the best mouth everrrrr... You make all the slaves feel soooo uselesssss...”</i>");
	output("\n\nYou stand and shrug your shoulders at her, and she falls back with a loud <i>THUD</i>, her drooping cock still leaking cum all over her groin. <i>“I can’t feel my leeeeeggss!”</i> she whines, her lower half completely unresponsive. <i>“But I guess that’s what I get losing to you, huh?”</i>");
	output("\n\n<i>“Thinking of losing again?”</i> you simper.");
	output("\n\nShe grins as you take your material reward from her defenseless form. <i>“No way! I hate getting edged! Even though this was worth it, I’d rather just have some sweaty sex!”</i>");
	output("\n\nTaking her compliment, you yank your well-earned chit from her. Still broiling in bunny batter, you turn to leave, the pitiful laquine’s aftersex groans carrying on even as the minutes go by.");
	output("\n\n");
	processTime(20);
	pc.loadInMouth(enemy);
	pc.loadInMouth(enemy);
	pc.orgasm();
	CombatManager.genericVictory();
}

//[Outside]
// Tooltip: Watch her cum all over herself. And you!
// PC gets ‘Cum Splattered’
public function jerkOnYouYaDegenerate():void
{
	clearOutput();
	showBoredJumper(true);
	author("William");
	output("You pull the jumper’s cock from your mouth and " + (pc.hasCock() ? "jerk":"finger") + " yourself while doing the same for her. " + StringUtil.capitalize(indefiniteArticle(enemy.furColor)) + " paw quickly joins your hand, her [enemy.eyeColor] eyes shut as she works to get herself off with you. Urging her on, you say, <i>“Hurry up and cum! Don’t wanna get edged again, do you?”</i> With your words as ‘positive’ encouragement, both of the laquine’s paws are on her [enemy.cock] pumping so fast they’re a blur of motion and wet schlucks.");
	output("\n\nIt doesn’t take long for her bestial dick to <i>explode</i>. Huge ropes of cum shoot upwards and hit the ceiling. Unlike a human’s, her ejaculation is constant, a sizzling seed shower rains down on both of you, but mostly on her. Certainly an enviable output thanks to her big, churning balls. ");
	if(pc.libido() <= 33) output("You focus on yourself");
	else if(pc.libido() <= 66) output("You try to catch what comes down");
	else output("You open your mouth to catch what you can");
	output(" as your loins burn up and the telltale heat of orgasm blossoms in your brain and in your [pc.groin]");
	if(pc.hasCock())
	{
		output(" - you splatter yourself and the laquine pirate with [pc.cum], shooting ropes of [pc.cumVisc] [pc.cumType] all over her.");
	}
	else if(pc.hasVagina()) output(" - you cry out, feeling your inner thighs glaze with gushes [pc.girlCum].");
	else output(" - you shriek in delirious bliss.");
	output("\n\nRibbons of laquine love drip and fall on your head as the slut-bunny is positively drenched in her own torrential downpour. She flops back with a loud <i>THUD</i> and lets out a long, stinging sigh as her smooth, fuzzy sack is depleted.");
	output("\n\n<i>“I didn’t think I could cum that much... <i>“G... geez... You really like playing the long game, huh cutie?”</i> the laquine hoarsely asks. <i>“Gosh... you have the best mouth everrrrr... You make all the slaves feel soooo uselesssss...”</i>");
	output("\n\nAlthough sexual spillage still drips from your every limb, your head is perfectly clear after your orgasms subside. Unlike her, you can still move your legs!");
	output("\n\n<i>“I can’t moooooveeee!”</i> she whines, her arms making limp attempts to reach out to you. <i>“But I guess that’s what I get losing to you, huh?”</i>");
	output("\n\n<i>“Thinking of losing again?”</i> you coyly ask.");
	output("\n\nShe grins as you take your material reward from her defenseless form. <i>“No way! I hate getting edged! Even though this was worth it, I’d rather just have some sweaty sex!”</i>");
	output("\n\nTaking her compliment, you yank your well-earned chit from her. Still broiling in bunny batter, you turn to leave, the pitiful laquine’s groans carrying on even as the minutes go by.");
	output("\n\n");
	pc.orgasm();
	pc.applyCumSoaked();
	CombatManager.genericVictory();
}

//[Use Throbb]
// Tooltip: Stick her with a dose of throbb and see what happens this close to her orgasm.
// PC gets ‘Cum Splattered’, ‘Orally Filled’
public function useThrobbOnBunbun():void
{
	clearOutput();
	showBoredJumper(true);
	author("William");
	output("A mischievous thrill courses through you, scooping the illicit vial up. The pirate can’t even see what you’re about to do. You peel back from her [enemy.cock] while uncapping the syringe. The cruel shine of the sharp needle aimed at her crotch shines only in your [pc.eyes]. Well, now or never!");
	output("\n\nThe laquine’s shrill voice cries out as she falls back when you stick her. You can’t help but giggle watching her stare at you with abject terror, " + (pc.hasCock() ? "jerking yourself off":"fingering yourself") + " in the meantime. You watch the fat veins on her drugged cock and balls engorge, her sopping groin undergoing a rattling girthquake. True to its effects, you see her already massive dick grow and broaden a few more distending inches. But the greater effect is downstairs at her swelling sack, jostling and boiling from the inside out with unnaturally expanding cum capacity.");
	output("\n\nThis close to her orgasm, you watch the frightened laquine’s [enemy.eyeColor] eyes seal shut, faint suggestions of whimpering escaping her parted mouth. You can see the muscles in her body lock and release, clenching under the effects of this deleterious drug. With what must be the last pockets of air in her lungs, she howls loudly, and her [enemy.cockHead] twitches and <b>bursts!</b>");
	output("\n\nThe poor pirate’s sensitive cock, made a worse mess than ever imagined by the application of throbb, turns into a cum cannon. Unbelievably thick and unending streams of jizz spew from her rent urethra, easily hitting the ceiling and turning this entire cave - hell, <i>the entire station</i> - into the non-sentient victim of sudden bukkake. The sheer force and impact of orgasm jerks her cock every which direction, hosing the walls - and you - with ultraporn levels of cum.");
	if(pc.libido() <= 33) output(" You can’t close your mouth in time, and a huge load makes it past your [pc.lips].");
	else if(pc.libido() <= 66) output(" You open your mouth and drink whatever comes your way.");
	else output(" You gladly take everything that comes your way, making sure anything that might miss you by inches hits true.");
	output("\n\nStill crying out in euphoric bliss, the crushing weight of drug-induced climax washers the slut’s brain out her ears. The laquine’s spunk spewing cock paints primitive figures and markings on the walls for an unknown race to discover and ponder the meaning of in the future when this station gets abandoned and falls onto their home planet. The puddles of cum she’s putting out with no end in sight could be mistaken for a new type of galotian. With how thick they are, there’s no telling if some mutagenic organism could come in contact with them, end up creating a race of cum aliens, and lead to a reenactment of humanity’s first encounter with the galotians!");
	output("\n\nPushing aside the images of an undiscovered species worshiping a horny criminal’s sperm signs, you finally achieve your own orgasm. You fall to your knees as ");
	if(pc.isHerm()) output("your [pc.cocks] and [pc.pussy] coat her and you with [pc.cum] and [pc.girlCum]");
	else if(pc.hasCock()) output("[pc.cum] fires out onto the laquine");
	else if(pc.hasVagina()) output("[pc.girlCum] squirts around your [pc.legOrLegs]");
	else output("your [pc.asshole] clenches around your rapid fingers");
	output(". Hyperventilating, you slump forward near a puddle of cum, the pitiful rabbit’s unceasing moans synced up with her voluminous load. The orgasm she’s having might just put those seen in ultraporn to shame with how long it’s gone on!");
	output("\n\nHalf a minute more passes by, both of you getting drenched by a fulminating thundersperm. Finally, the pirate’s moans die down, and her breaths... well, they don’t normalize, but ragged hyperventilations are a small step up from desperately screaming one’s organs out. Another minute passes and you finally raise your splattered head, shaking it off like a dog would water, and dare to look around.");
	output("\n\nDamn... just about this whole passage is covered in splooge! You’re pretty sure this station doesn’t have janitors, so you probably just created a fucking hazard zone that nobody is going to want to come near again. Wait, you weren’t the one with the fire hose dick!");
	if(flags["MET_ROZ"] != undefined) output(" Then again, you’ve met Roz. If anything, you just provided her a feast that she’ll be busy with for a while! A damned shame she won’t know who to thank for it!");
	output(" Laughing to yourself, you finally stand and wipe the biggest blobs of bunny batter off. The laquine herself, however, has passed out completely, cooking in her own protein sauna.");
	output("\n\nYou rifle through her belongings for anything worth taking and hurry away from this cumbog. It might take more than one shower to get all this gunk off!");
	pc.addMischievous(2);
	pc.orgasm();
	pc.loadInMouth(enemy);
	pc.applyCumSoaked();
	pc.destroyItemByClass(Throbb);
	output("\n\n");
	CombatManager.genericVictory();
}


/*
//[Discarded] Ship Encounter - Getting On Your Property
// After beating the Jumpers 5 times, the last one the player Sexed (initiated a Win Scene against) will be ‘selected’. This way, the player can choose the dong they want to bed.
// When the player tries to enter their ship, there is a 20% chance that the ‘selected’ Jumper will appear and ask for sexy times.
// PC can decline or accept, and after she’s in the bedroom, the player will have the options of being subby or dommy.
// If the PC has a ‘Leather Leash’, bought from Inessa on Tavros, in their inventory then it will be used on the bunny (if PC is Top) or the PC (If PC is Bottom) for extra detail.
// After a ship encounter, even if the PC declines, they will have to win and sex another laquine to have it trigger again, keeps the player from being spammed.

output("\n\n// First Time");
output("\n\nYou saunter up the ramp to your ship, eyeing the rest of the hangar warily in case any desperate crook tries to get the drop on you. All you can see are shady figures boarding and disembarking in the distance, and Urbolg going about his job nearby. Satisfied, start tapping on the airlock’s keypad, positioned so carefully that no sneaky camera or crook can catch your movements.");

output("\n\nBetween the metallic clamors of Urbolg’s work and distant arguments, a suspiciously familiar sound catches your [pc.ears]. A sound you know all too well now having wandered around the station’s mines. You whip around to see nothing behind you... Nothing out of the ordinary compared to what it looked like a few seconds ago. You turn again and the sound, squeaky as it is, gets louder. Frowning, you turn again and jump down from the ramp, right in front of one of the laquine jumpers!");

output("\n\nThe pirate jumps back with a surprised yip, raising her hands to you. In the brighter lights of the hangar - and the slightly cooler air - she looks a little more relaxed... but no less horny.");

output("\n\n// PC Bimbo");
output("\n\n<i>“D’ya come looking for a good time again?”</i> You rock your hips, eyes locked onto her bulging crotch.");
output("\n\n// PC Bro");
output("\n\n<i>“Followed me home for another round?”</i> You grin stupidly, flexing an arm. <i>“Then you chose correctly.”</i>");
output("\n\n// PC Kind");
output("\n\n<i>“I hope you’re not here to pick a fight.”</i> You fold your arms and frown at her, scanning her voluptuous figure for any malcontent.");
output("\n\n// PC Misch");
output("\n\n<i>“Did you come looking for a fight?”</i> You ask sternly, hand hovering near your [pc.weapon].");
output("\n\n// PC Hard");
output("\n\nYou draw your [pc.weapon] and step back scowling. <i>“I don’t know why you’re here, but give me a reason not to shoot.”</i>");
output("\n\n// Merge");

output("\n\n<i>“Wait!”</i> the [enemy.furColor] furred jumper wriggles her hands. <i>“I’m not on the job right now, and I’m not armed...”</i> She twirls around and shows you she’s got nothing on her, not even a bag or pouch. She waits until you relax, then her lapine face is graced with a cheshire grin. <i>“I saw you heading this way and was wondering if you wanted to fuck without the fight. You’re not like anyone else around here, sex with you is awesome and you’re hot as hell! Your ship, right?”</i>");

output("\n\nShe looks up and down your [pc.ship] and puts her hands on her wide hips. <i>“I’m hot and bothered right now, and I thought we could just have some sweaty fun in the bedroom instead! A nice sexual workout! It sure as hell beats anything else around here...”</i>");

output("\n\nThe laquine jumper’s proposition is a tempting one. Her [enemy.furColor] fur glows with cold perspirant and her suit is obviously soaked from work. She pats her crotch and smiles cutely at you. You’re already getting a little aroused from her stewed body odor alone...");

output("\n\n// Repeat Time");
output("\n\nYour [pc.ears] catch the familiar sound of a squeaky laquine jumper prowling around your ship. You jump down the ramp and look around, spotting the [enemy.furColor] furred slut-bunny a few feet away. She waves at you provocatively.");

output("\n\n<i>“Should I take a guess?”</i> You ask with a grin. She raises her hands and shows that she’s got nothing on her body, belt, or butt. She then provocatively pats the [enemy.cockType] shaped bulge in her crotch.");

output("\n\n<i>“I’ve got a few hours... so uh... you wanna fuck me in bed?”</i> She asks with a cute, sultry smile. <i>“Last time wasn’t enough, so c’mooon I wanna fuck you!”</i> She bounces then looks at you ruefully. <i>“I mean... On your terms, of course. Pleaaase?”</i>");

output("\n\nHer stewed body odor alone is already getting you well aroused...");

output("\n\n[Accept] [Decline]");

output("\n\n[Accept]");
output("\n\n// Tooltip: Invite the laquine aboard and see where the encounter takes you.");

output("\n\nBefore you even open your mouth, the nodding of your head excites the jumper and she bounces up and down. She follows you noisily up the ramp and into your ship where the sweaty squeakiness of her suit becomes a more detailed symphony on the way to your bedroom. Once the door to your quarters shuts, her tail wags behind her as her legs muscled thighs grind together. The slutty bunny’s already moaning and you haven’t even tugged on her zipper yet!");

output("\n\n<i>“Nice bed, cutie. So who’s getting thrown on it?”</i> She asks, groping herself loudly through her moist uniform.");

output("\n\nThat is a good question...");

output("\n\n[You] [Her]");

output("\n\n[You]");
output("\n\n// Position ideas: Blowjob, Doggystyle, Lap Ride, Thigh Sex");
output("\n\n// Short scenes but more interactivity.");
output("\n\n// PC will take on a subbier role; Both forks have foreplay and have choices where she’ll cum or where she can stick it.");

output("\n\nBlushing, you tell her that you’d like to see what she can do with her [enemy.cock], and pass her the reins in this off the clock sexcapade. She smiles even wider, but doesn’t pounce on you straight away.");

output("\n\n// PC not naked (no jumpsuit)");
output("\n\n<i>“You’ve unwrapped me already, lemme see how that feels...”</i> the laquine grips your shoulders, examining your [pc.gear]. Getting a good guess of what keeps your outfit together, she undresses you piece by piece. {pcWearingArmor: She unfastens your [pc.armor] with stimulating grace, exposing your [pc.skinFurScales] a husky huff seconds later.} {pcWearingUnderwear: {pcHadArmor: With your body uncovered,} {T/t}he rabbit slides your [pc.crotchCover] aside while {pcNoBreasts: caressing your [pc.chest] up and down /pcBreasts: pinching at your [pc.nipples] {through your [pc.upperUndergarment}, before sliding that aside too.}}");

output("\n\n{pcHasCock: She gives [pc.eachCock] a friendly squeeze and jerk{, making {it/them} bob up and down distractingly above your [pc.balls]}. /pcHasVagina: She kneels closer to your [pc.pussy] and inhales the heady pheromones tingling around your [pc.clit], pinching you with a giggle. /pcNeuter: She frowns seeing nothing to work with in the front, but shrugs her shoulders. <i>“You’ve still got two holes to use, after all!”</i> She quips.}");
output("\n\n// PC not naked (jumper jumpsuit)");
output("\n\n<i>“That looks sooo good on you!”</i> The laquine says, looking over you in the jumpsuit you’re wearing. <i>“Let’s see how good you look when it comes undone.”</i> You smile like a dope as she pulls on the zipper at your neck, one hand on your [pc.arm]. In the same way you’ve done to her, your body is slowly unsealed from tight, rubbery confinement. {pcHasBreasts: She takes extra special care around your [pc.breasts], savoring the sight of [pc.nipples] and [pc.skinFurScales] gradually becoming exposed to her.}");

output("\n\nYou’re intimately aware of how close she’s coming to your crotch{, pcHasCock: and your [pc.cocks] thrust against your outfit much like hers out of anticipation.}. When she opens up your crotch, {pcHasCock: your [pc.cocksLight] jut{s} out proudly, bobbing up and down {over your [pc.balls]}. /pcHasVagina: the potent air collected in your roiling pheromone pocket swamps the laquine’s nostrils, locking her [enemy.eyeColor] eyes to your [pc.pussy]. /pcNeuter: she frowns but shrugs her shoulders. <i>“You’ve still got two holes to use, after all.”</i> She muses.}");
output("\n\n// Merge");



output("\n\n[Her]");
output("\n\n// Position ideas: 69, Doggystyle, Ride Her, Titfuck");
output("\n\n// Short scenes but more interactivity.");
output("\n\n// PC will take on a dommier role; Both forks have foreplay and have choices where she’ll cum or where she can stick it.");





output("\n\n[Decline]");
output("\n\n// Tooltip: You’ve got better things to do right now than romp in the sheets with a sweaty rabbit.");

output("\n\n<i>“Not today, I’m afraid.”</i> You shake your head. The futa bunny ‘awws’ at your shooing. The moping dope leaves, your eyes on her until she rounds a corner.");
*/

//Bad End and Loss Scenes
// The Jumper who beats the PC takes them as an exclusive slave.
// The loss scenes leading up to the bad end degrade the PC until they’re taken.
// The player has to lose 5 consecutive times to get Bad Ended. Winning against a Jumper will reset the sequence.
// On the third loss when the Bad End path begins, the following scenes should be used.

// Third Loss to Bored Jumper / Crotch Worship
public function loseToJumpersStartBadEndsByWill():void
{
	showBoredJumper(true);
	author("William");
	// HP Loss
	if(pc.HP() <= 1) output("You gasp in shock when a stun dart goes off near your feet, jumbling your head and deafening you. Just after, a sharp kick to the gut has you keel over.");
	// Lust Loss
	else output("You can’t get your hands out of your crotch. Keeling over, you jerk your head away from the glinting glare of the rabbit who’s turned you on too much.");
	// Merge
	output("\n\nFalling to the ground, a hard breath is forced from your sore lungs when you crumple to the cindery rock on your stomach. In the seconds it takes for your vision to realign, you are wholly consumed by the soupy heat squeezing sweat from your pores. A low, ragged breath slips from your sweltering mouth; you groan quietly and reach your hands out, pressing your palms into the ground to stand. Before you can rise, you feel a heavy weight pin you to the ground, something or someone on your back. <i>Sitting</i> on your back.");
	output("\n\n<i>“You sure you’re not a slave? How can someone with a weapon like this have so much trouble?”</i> you hear the sweaty pirate’s acerbic voice in between the sounds of her fidgeting with your [pc.weapon]. <i>“Sure didn’t help you come out on top, which means you must get off on this, huh? That the plan? D’ya like to think you’re tough but you really just want to get taught your place?" + (pc.hasEmoteEars() ? " Kinda fitting for a cute little pet like you.":"") + "”</i>");
	output("\n\nYou can hear her rifling through your belongings, tossing this and that aside in nonchalant disinterest. A dual emotion of anger and self-pity course through you, vying for dominance over your blossoming hormones. <i>“Whatever. I’m happy to be part of your plan, hot stuff! Your plan to... I dunno, get a nasty pirate all worked up and ready to fuck you! Especially after she rubs her balls over your face!”</i>");

	// PC cum covered
	if(pc.hasStatusEffect("Cum Soaked")) output("\n\nA disgruntled inhalation has the rabbit mulling above you. <i>“You might be a bit sticky, but your face looks clean enough. And I haven’t gotten off for a while sooooo...”</i> she muses aloud.");
	// Merge

	if(!pc.isTaur()) output("\n\nYou grimace, thrashing your [pc.legOrLegs] around trying to shake her muscular hips off, only succeeding in getting yourself sweatier.");
	else output("\n\nYou try to stand on all four legs, but you feel your tauric half pushed back down once again, the weight of her hips smashing you.");
	output(" This... this dopey rabbit won again, this is ridiculous! But, you feel two hands " + (!pc.isTaur() ? "press down on your biceps,":"on your shoulders,") + " and a large, wet ear flop on your shoulder. <i>“You seem a lot like a cock hungry slave to me, why else aren’t you trying to get free?”</i> Her huge nipples prod your back, she grinds against you, making sure you feel her tenting dick " + (!pc.isTaur() ? "between your ass cheeks":"on the small of your back") + ". <i>“Just wanting to pick fights so you’ll get stuffed, I guess. So, ready to get that cock you’ve been looking for, slave? I know I’ve been looking for a good mouth!”</i>");
	output("\n\nHer words widen your eyes and you ");
	if(pc.libido() <= 33) output("struggle to flip around and push her off, not willing to be so compliant.");
	else if(pc.libido() <= 66) output("wait passively, expecting her to take care of your heat.");
	else output("grind your [pc.thighs] together, shamelessly excited to see what she has in store for you.");
	if(!pc.isExposed()) output(" Her small but powerful hands quickly and easily divest you of your [pc.gear], making sure to take extra time when revealing your nethers, where she steals a few ignominious gropes on your most vulnerable parts.");

	output("\n\nWithout delay, the laquine pulls your [pc.arms] behind your back, securing your wrists together. It’s not long before you feel a warm pair of metal cuffs slap around them, locking your arms together. An ill wind blows through your chest as you realize how helpless you’ve become, no different from the work-slaves used for dumb labor that are just there to get fucked by these lusty pirates. You can’t help but wince having your [pc.skinFurScales] fully exposed to the elements, already feeling the sharper stones scraping at you. Your inability to move and only wiggle makes your heart sink.");
	output("\n\nThe jumper, not content with that, uncaps something above you. You feel a firm pinch on the side of your neck as the aches inside you melt away into a lewd sustenance that nourishes your arousal. A futile whimper later, your [pc.face] heats up from within and saliva drips from your [pc.lips] like the secretions of fresh fruit. Whatever was in that syringe has gotten you <i>very</i> horny, and you can only think of how badly you want to see your latex clad captor, to be fucked by her, to <i>feel</i> her. Indeed, you can feel her [enemy.cockType] dick already engorged with blood, suggestively prodding you through her suit.");

	// PC Low Libido
	if(pc.libido() <= 33) output("\n\nWrithing in your restraints, you’re determined not to give in to what she wants, but there’s no way out. With the need for release overtaking rationality, you whine and inevitably beg her to get you off.");
	// PC Medium Libido
	else if(pc.libido() <= 66) output("\n\nYou groan and struggle in your restraints, desperate to touch yourself and her, but there’s nothing for it. Only thinking of sex now, you cry out for her to touch you and use you.");
	// PC High Libido
	else output("\n\nYou flail miserably in the throes of lust, your frenzied fingers reaching out for a cock, a pussy, or an ass that just isn’t there. Sweating bullets, you howl for the laquine atop you, begging her to touch and use you.");
	// Merge
	output("\n\n<i>“Mmmm, I like the sound of that, and I like the sound of your mouth too,”</i> the perky pirate purrs. <i>“Let’s do it!”</i>");
	processTime(15);
	pc.changeLust(20);
	clearMenu();
	addButton(0,"Next",loseToJumpersStartBadEndsByWill2);
}

public function loseToJumpersStartBadEndsByWill2():void
{
	clearOutput();
	showBoredJumper(true);
	author("William");
	output("The [enemy.furColor] jumper pulls you to your knees and spins you around, a bit of a task considering how staggered you are. Your [pc.eyes] don’t know where to settle on the short-furred laquine. Her suit doesn’t even seem to be made of latex anymore, the viscous rubber is just another layer of lubricant on her sexy, fit body. Her hardened muscles flex with every movement under the skin-tight suit, and it squeaks loudly the more she rubs herself. She steps back from you with a cute grin on her pretty face, her [enemy.lipColor] lips spreading into a wide smile as she yanks the zipper on her neck down.");
	output("\n\nYou can see the vaporous dew flow out of her suit as her beautiful, pert chest leaps out of isolation. Her huge, bulky nipples begging to be pinched remind your confined hands of what they cannot do. You whimper and moan in stunted gasps, slumping forward when you see her toned midriff, full of moist, suckable [enemy.furColor] fur. Your [pc.tongue] hangs limp from your mouth; She doesn’t even need to get the zipper down to her crotch before her [enemy.cock], well over a foot long, pokes its head out of her sealed crotch, taking the clasp down the rest of the way. She holds her musk-oozing [enemy.cockType] shaft down, aiming the [enemy.cockHead] at you, cooing <i>“Here you go!”</i>, well aware of the small yet insufferable distance you must cross to get your treat. <i>“Look how hot you’ve gotten me. You’re gonna take care of this, right?”</i>");
	// PC Low Libido
	if(pc.libido() <= 33) output("\n\nYou try to keep yourself in place, to not shame yourself further, but the drug running through your body and the venomous hormones strangling your brain move you toward her cock; a delicious dick that is hard only for you... The heat of these caves only makes your mind weaker, and breathing becomes difficult. She needs you, and you need her.");
	// PC Medium Libido
	else if(pc.libido() <= 66) output("\n\nYou shiver and try to move on your knees. You’re red and wet with sweat to the neck but... the call of her cock is irrefusable, and the need burning in your [pc.groin] is unquenchable. You do your best to reach that erotic rabbit, to lick, maybe even suck her off until you’re bloating with cum. With the heat constricting your brain, what else is there to do?");
	// PC High Libido
	else output("\n\nYour [pc.thighs] grind together. You’re so horny and she - no, her needy dick, seems so far away. You drag yourself over the hot coals under your knees, her cock <i>needs</i> your attention, and you’re the only one who can help her! Dripping with sweat and gasping for air in these hot mines, you can only hope she’ll show you the same affection.");

	// PC not ‘taur
	if(!pc.isTaur()) output("\n\nYou needn’t crawl far to reach her. You thrust your knees out, careful not to fall on your side. Your arms locked behind your back make posture easy to maintain, but movement a give and take: the more you stretch, the more you’ll get scraped, and the longer you take, the more turned on you get. Either way, the [enemy.eyeColor] eyed bunny slut enjoys the show as you waddle over.");
	// PC taur
	else output("\n\nYou’re sure there’s disappointment in her [enemy.eyeColor] eyes when you have little trouble waddling over on four powerful legs. She may have bound your arms, but she can’t hogtie you. Still, there is mutual satisfaction when you set down in front of her moist crotch.");
	// Merge
	output("\n\nWhen the tip of your nose is just in front of her [enemy.cockNounComplex], she grabs the side of your head and pulls your cheek against her sweat-drenched leg. You’re right where you need to be: close to her and the pheromonal haze emanating from her magnificent member. Your ");
	if(pc.libido() <= 33) output("mesmerized");
	else if(pc.libido() <= 66) output("thirsty");
	else output("eager");
	output(" tongue, acting of its own accord, hurriedly catches the sweetest drops of her bodily fluid between the base of her [enemy.cockType] tumescence and her heavy nutsack. The taste of her spicy musk and salty sweat together flush whatever pointless resistance remains from your system out with the next layer of perspirant, and free of your obstinacy you feel only comfort being under her control. The only part of your body that needs to move is your tongue, you <i>have</i> to taste more of her, to worship at her altar...");
	output("\n\n<i>“Niiicce!”</i> she moans, petting your head" + (!pc.hasNonScritchEars() ? " and scratching your [pc.ears]":"") + ". <i>“You really love how I smell, don’t you?”</i> You hastily nod your head. The gentle, firm authority in her touch" + (pc.tailCount > 1 && pc.hasTailFlag(GLOBAL.FLAG_LONG) ? ", making your [pc.tails] wag with a happy blur,":"") + " fills you with an obedient warmth. Being held this close to her thick body makes the world around you fade away. <i>“Bet ‘ya can’t wait to taste, huh?”</i> You moan excitedly, still trying to lap up anything you can as she moves your face closer to her balls. <i>“There!”</i> she nearly squeals with a jerking clench of her thighs before planting your face to her sack, both of your [pc.eyes] blinded by the futa-bunny’s overflowing nuts.");
	output("\n\nYou couldn’t be happier: your nose is buried right between her plush pearls. The jumper’s [enemy.cock] rocks distractingly against your scalp" + (!pc.hasNonScritchEars() ? ", bumping against the sides of your [pc.ears]":"") + ". Your [pc.tongue] darts for each fuzzy testicle, wrapping around each of them and cleaning the sweat pooled around their gorgeous measurements. You giggle when you raise them up only for them to sag heavily down again, you can almost hear the bubbling seed inside. Each savory apple is perfectly shaped, each is wrapped in velvety laquine pelt. The short fur bristles along your oral organ with every swab, returning the massage in kind." + (pc.hasTongueFlag(GLOBAL.FLAG_LONG) ? " Thanks to how long your tongue is, you make frequent visits to her marble-sized clit, tasting her equine pussy before worming back around her nads and wrapping around her [enemy.knotOrSheath] too. ‘Ecstatic’ is the most fitting word to describe her tone of voice at being treated so wonderfully.":""));
	output("\n\nSomehow, the rabbit’s taste is more potent than before, and you can’t help but groan and grind as she rubs your head against her slick jewels, giving you little time to attend her in the way you want. Head swimming, your mind is again awash with her unique scent, an erotic and profoundly potent scent that only seems to take up more of your mental capacity. She smells so <i>good</i>, and she tastes even better! You didn’t notice it until now, but her crotch is no different than a five star meal, something to be appreciated and savored as such." + (pc.hasTongueFlag(GLOBAL.FLAG_LONG) ? " Before you’re yanked back, your long tongue is able to curl around both engorged nuts, scraping every last drop on its departure.":""));
	output("\n\n<i>“F-fuck! You’re a gifted ball-slut, you’re way too good at this!”</i> she humps your cheek, rubbing her cock all over your [pc.face] and pressing her buttery balls to your [pc.lipsChaste]. <i>“Annnndd... I bet you’re the kind of slave that loves being on the end of a good dick, right?”</i>");
	output("\n\nThe more she calls you a slave, the warmer - hotter - you feel. You shiver and titter at that word the most. With her [enemy.cock] draped over you, you worry she can’t see your reaction. You mumble something affirmative, and lick the underside of her glorious girth to punctuate it.");

	// PC not taur
	if(!pc.isTaur())
	{
		if(pc.hasCock()) output("\n\nYou soon feel her latex foot rubbing against your [pc.cock], pushing it up against your gut. <i>“Time to have some real fun, slave.”</i>");
		else if(pc.hasVagina()) output("\n\nYou soon feel her latex-wrapped toes prodding at your [pc.clit], so close to the insertion you crave. <i>“Time to have some real fun, slave.”</i>");
		else output("\n\n<i>“Aww, nothing down there, huh? Too bad for you. Unless you’re the kind of slut that gets off just sucking cock,”</i> she smiles. <i>“I think you are, just looking at ‘ya.”</i>");
	}
	// PC taur
	else
	{
		if(pc.hasCock()) output("\n\nYour [pc.cocks], so swollen and erect, throb against your belly and brush painfully against the ground. Just sucking her cock is going to give you an unmatched orgasm...");
		else if(pc.hasVagina()) output("\n\nYour [pc.vaginas], moist with girl slime and potent centaur pheromones, contracts with every breath you take, spasming around an imaginary dick railing you senseless.");
		else output("\n\nYour [pc.asshole] tightens instinctively when thoughts of her mounting you come to mind.");
		output(" <i>“Shame about how ‘ya look, I’d give you a hand otherwise,”</i> the jumper smirks, <i>“but you seem like the type who gets off just sucking cock!”</i>");
	}
	// Merge
	output("\n\nThe laquine drags her balls, freshly coated with your saliva, over your face and back. <i>“You should be upstairs with me so I don’t have to come down here all the time!”</i> she exclaims. Would she really keep you!? Being her ever-present throat-bitch sounds <i>amazing</i>!");
	output("\n\nOn the backstroke, her [enemy.cockHead] rubs against your lips, giving you a wet kiss - a messy one, her ambrosial pre moistens your mouth and slips down your throat, preparing you to take all " + Math.round(enemy.cocks[0].cLength()) + " inches. You know where this is going, but you can’t care hopped up as you are. You may have lost to her, but you’re not about to lose to her dick! Your lips part and you slurp at her tip without a second thought, eliciting a giggle from the rapacious rabbit. Unable to speak, you make every possible effort to indicate your readiness to be the cum-hungry cock-sock that she thinks you are. Proving her right is now your only goal in life!");
	output("\n\nYou widen your mouth and spread your jaw as far as it will go. You don’t care how much this might hurt, or even about your own foaming pleasure. All that matters now is that she thrusts her [enemy.cock] inside and stretches, no, <b>strains</b> your eager mouth. Your [pc.tongue] extends again like a welcome mat, caressing the underside of her crown. <i>“Ohh Ff!!...”</i> the laquine hisses, <i>“Alright, it wouldn’t be fair to keep this from you for any longer!”</i> Finally! She’s pushing her wide hips forward! You can feel the sticky, salty treacle of pre overflowing on your tongue as her [enemy.cockHead] slips past your [pc.lips]. You moan loudly around your [enemy.cockType] intruder, and quickly swish and swash your tongue over its stimulating shape.");
	output("\n\nOnce again, her taste fills your mouth. That taste, like liquid joy, ignites your brain. Nothing has ever felt better or more right than this, and she’s not even at your throat yet! " + (pc.canDeepthroat() ? "You thrill that you don’t have to worry about a gag reflex,":"You control your gag reflex as best you can,") + " staring up at her while your cheeks hollow out and you suck her louder and louder, pulling her deeper. You can see in the laquine’s [enemy.eyeColor] eyes a glimmer of unparalleled satisfaction. One paw behind her head and the other on yours, the bunny’s fragrant dick is already bulging in your throat, spreading an aroma of rut throughout your body. Nearly there, you think, as tears form in your eyes; you’ve nearly taken her to the hilt!");
	output("\n\nAnd just like that, you’re given another noseful of balmy belly fur. You bob your head up and down, massaging her " + (enemy.hasCock(GLOBAL.TYPE_HUMAN) ? "massive":"bestial") + " dick with your tongue, coaxing her to start fucking your throat.");
	if(!pc.isTaur() && pc.hasGenitals()) output(" Meanwhile, you feel her teasing foot at your crotch, " + (pc.hasCock() ? "jerking your [pc.cocksLight]":"rubbing at your [pc.pussy]") + " slowly while she shifts into a more maneuverable position.");

	output("\n\nYou lick and lap as she pulls back and sets her rhythm, swallowing old and fresh sweat in addition to thick globs of waterfalling pre. To her delight, you do it all with a lewd smile etched on your red and wet face. She presses the [enemy.cockHead] against your cheeks, puffing your mouth obscenely, before plumbing your pipe again and again and again. You don’t feel anything but a numbing heat in your esophagus, her [enemy.cock] has stretched you so wide that your maw is nothing but another pussy to her, a hole made just for her and any other rabbit to hibernate in.");
	output("\n\nOn every hump, your sucking gets stronger, every pulse of her heart making it seem like her sizeable cock grows bigger. The giggling pirate keeps your enthusiasm in check, both paws on the side of your head. You’re sure there’s pressure building up in your bound arms and especially down below, but you feel nothing at this point. You taste and see nothing except for her dick. All you hear are the wet sounds of intense oral service, and of her slippery spheres bouncing off your chin with every balls-deep thrust.");
	output("\n\n<i>“Fffffucckkk Yeeeessss!”</i> the jumper howls, her head jerking back, <i>“You’ve got the best mouth ever!! You’re best victory prize I’ve ever had oh my gaaAAhhHH!”</i> the sexy laquine cries, her hips pumping faster" + (!pc.isTaur() ? " and her teasing foot getting rougher":"") + ". The horny pirate’s [enemy.cockHead] balloons between your cheeks, letting you know she’s about to cum. Bubbling at the mouth, you feel her drag your head to her crotch one last time as your own pleasure simmers. You feel her smooth, brimming balls contract and churn against your chin, quickly forcing out their payload of long cum strands into your gullet unimpeded.");
	output("\n\nYou froth and vibrate around her [enemy.cockNounSimple] as a seemingly never-ending orgasm begins to rob you of consciousness. " + (pc.hasVagina() && !pc.isPregnant(0) ? "Her cumming is so powerful that you can feel a phantom bulge in your [pc.womb]. It seems such a waste that her cum isn’t there right now... ":"") + "Vision fading, " + (pc.hasCock() ? "you feel your [pc.cocks] shooting off their own loads between her legs":""));
	if(pc.hasVagina() && !pc.hasCock()) output("you feel your [pc.vagina] squirting violently all over your inner thighs");
	else output("you feel an orgasm of submissive fulfillment wrap around your heart");
	output(". While your belly distends with all the pent up seed of a powerful breeder, the laquine pulls her still cumming cock from your throat, the last dollops of her divine jism bursting out onto your [pc.face] and lolling tongue.");
	output("\n\nHer [enemy.cockHead] pops free from your abused jaw, already going flaccid. She aims your head up to her and strokes your cheek. You swallow before you choke, barely able to make her out, struggling to stay awake. <i>“You know, I think I’ll have to tell the other jumpers about you...”</i>");
	output("\n\nThe others? That’d be... that’d be great! If the others smell - and taste! - just like her... Wait...");
	output("\n\n<i>“About this awesome slut who just wants to be...”</i> are the last words you make out before darkness takes you.");
	processTime(40);
	pc.loadInMouth(enemy);
	pc.applyCumSoaked();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",loseToJumpersStartBadEndsByWill3);
}

public function loseToJumpersStartBadEndsByWill3():void
{
	clearOutput();
	showBoredJumper(true);
	author("William");
	output("You sputter awake some time later, your belongings " + (!pc.isChestExposed() && !pc.isCrotchExposed() ? "and clothes ":"") + "thankfully still nearby, though scattered around. You resign yourself to the reality that you’ve probably been looted once or twice, but...");
	output("\n\nThe scintillating smell of the jumper still lingers around you... and in you. Thankfully, you’re no longer cuffed. Feeling returns to your sore wrists to inform you of that fact. Your face is coated with cum and you’re resting in a puddle of sweat." + (!pc.isChestExposed() && !pc.isCrotchExposed() ? " Maybe you shouldn’t put your clothes back on for a bit..?":""));
	output("\n\nWhen you stand and get ready to go, you can’t help but think about the rabbit-woman again, her hypnotic glow still vivid in your mind and her roiling odor well-entrenched in your senses...\n\n");
	processTime(60);
	restHeal();
	CombatManager.genericLoss();
}

// Fourth Loss to Bored Jumper / Sex Pet
public function fourthLossToBoredJumperBadEndProggo():void
{
	showBoredJumper(true);
	author("William");

	// HP Loss
	if(pc.HP() <= 1) output("You stumble backwards from the lawless laquine and fall to your knees, the resistance knocked out of you. She hops around like a silly dope before holstering her empty dart gun.");
	// Lust Loss
	else output("You’re too aroused to keep fighting. You fall to your knees and grit your teeth, masturbating while the ravenous rabbit hops around you like a silly dope.");
	// Merge
	output("\n\nYou drop your [pc.weapon] and groan. You lost to another jumper. <i>Again</i>. The sex-seeking slut will soon claim her prize. The strain of anticipation is intolerable...");
	output("\n\nHer pleasant smell reaches your nose again and your body reacts with instinctual lust. You half gasp and shiver as a synesthetic sensation courses through you. The taste of her musk and sweat fills your mouth as her sweet, salubrious stench flows past your nose hairs like a breeze over fertile grass. Even though you’ve lost, her arousing presence is enough to erase the memory of your defeat and replace it with ever more desire for her.");
	if(!pc.isTaur())
	{
		output(" Unbidden, your masturbatory [pc.hands] dart for " + (pc.hasGenitals() ? "your [pc.crotch]":"[pc.asshole]"));
	}
	else output(" Your [pc.crotch] " + ((pc.cockTotal() + pc.totalVaginas() + pc.balls) <= 1 ? "is":"are") + " alight with need, and you’re in no position to help yourself like this");
	output("; your tongue lolls from your slack mouth as your body is sparked to action.");

	output("\n\n<i>“I heard about you,”</i> the jumper’s hot voice tickles your [pc.ear], a light hissing following immediately after. You recoil in shock, realizing she’d been bent over just behind you, and she’d just given you another dose of that lust toxin they carry. Now it’s not just her frisky taste prancing on the tongues of your five senses you have to worry about. Arousal blooms throughout your body; liquid lust relaxes every muscle and quells every resistant urge... and you’re in the same suppressed position as before.");

	// PC cum covered
	if(pc.hasStatusEffect("Cum Soaked")) output("\n\n<i>“You’re a mess but that’s fine, I think I can overlook that considering who you are,”</i> the rabbit muses with a bit of disgust.");
	// Merge

	output("\n\nSpinning around, hand on your neck, you look at her twirling something around her rubbery finger. <i>“A slave who pretends they’re not a slave. Or... A slave trying to get attention. I forget...”</i> Your eyes squint and lock on to the black hoop she’s toying with. The faint sound of metal clapping reaches your ears. That stannic sound fills you with dread, and then you see the long chain against the cheap lamp light. She’s holding a leash, or at least, some restraints cobbled together to resemble one.");
	output("\n\n<i>“Makes me glad I found you first, I got <i>so</i> fucking turned on just <i>thinking</i> about getting worked up by that oh... so... troublesome slave... Apparently you can’t be subdued! Well, I came equipped!”</i>");
	output("\n\nShe holds up your new restraint proudly.");

	// PC Low Libido
	if(pc.libido() <= 33) output("\n\nYou stagger backwards and away from her, trying to put that smell out of your mind, but you don’t get far before a gripping paw is on you. The leather collar speeds toward you and clasps tightly around your neck. Already, you feel her tugging you by the short chain onto all fours.");
	// PC Medium Libido
	else if(pc.libido() <= 66) output("\n\nYou can’t bring yourself to try and flee, her powerful presence wreaking havoc on your body. You shiver and reach out to touch her as the leather clasps around your neck and you’re forced on your knees like a pet.");
	// PC High Libido
	else output("\n\nSpittle flows from your mouth, your tongue hangs out. You watch with bated breath the laquine kneel down in front of you and fasten the collar around your neck. Your uncontained lust bids you steal a grope on her bulging nipples, prompting her to yank you forward on all fours.");
	// Merge
	output("\n\n<i>“Fuck, I didn’t think you’d look that sexy...”</i> the jumper moans, the perspirant on her floppy [enemy.furColor] ear landing " + (!pc.hasHair() ? "on your head":"in your [pc.hair]") + ". <i>“I heard you love sucking cock too. Well, too bad!”</i> she giggles, <i>“I’m gonna take you with me on my shift!”</i>");

	output("\n\nShe’s going to walk you around like this!? You could cum just from <i>thinking</i> about touching her!");
	if(pc.libido() <= 33) output(" Couldn’t she just fuck you and get this over with?");
	else if(pc.libido() <= 66) output(" That means you and her will be working up an amazing sweat... Which means...");
	else output(" You groan out, looking up and urging her to fuck you" + (pc.tailCount > 0 && pc.hasTailFlag(GLOBAL.FLAG_LONG) ? " as your [pc.tails] wag":"") + ".");
	output("\n\n<i>“C’mooon... I’ve got a loooot to do today. Maybe you’ll get just what you want, cutie.”</i> You feel her tugging on your neck, a possessive glint in her [enemy.eyeColor] eyes. Stars... ");
	if(pc.hasVagina()) output("your [pc.pussy] is flooding your " + (!pc.isCrotchExposed() ? "clothes":"[pc.legOrLegs]"));
	if(pc.isHerm()) output(" and ");
	if(pc.hasCock()) output((!pc.hasVagina() ? "T":"t") + "he pre from your [pc.cocks] is boiling against your crotch.");
	if(!pc.hasGenitals()) output("Your legs quake as you struggle to move with her.");
	output(" You feel like a blob of lust trapped inside a bottle. You have no way to get yourself off and you’re to be paraded around these mines like a pet!");
	if(!pc.isCrotchExposed() && !pc.isChestExposed() && !pc.isAssExposed()) output("\n\n<i>“Mmm... That won’t do.”</i> The plundering pirate tears your coverings off, tossing it all aside to your horror. When... <i>If</i> you get free, hopefully you’ll be able to find your way back here. <i>“That’s better, that way everrryoneee can see how hot you are.”</i>");

	if(!pc.isTaur()) output("\n\nWincing for the first few steps, the pain of degradation replaces that of your [pc.skinFurScales] dragging against the rough ground.");
	else output("\n\nThe jumper hops up on your back and yanks on the chain, telling you in a sing song voice to get going. The pain of degradation soon replaces that of her grinding against your spine.");

	processTime(20);
	pc.changeLust(150);
	clearMenu();
	addButton(0,"Next",fourthLossToBoredJumperBadEndProggo2);
}

public function fourthLossToBoredJumperBadEndProggo2():void
{
	clearOutput();
	showBoredJumper(true);
	author("William");
	// PC not taur
	if(!pc.isTaur()) output("All you hear being walked like a dog down the mineral-rich mining tunnels are distant sounds of excavation and, more importantly, the sound of your lop captor’s waxing suit. Every rubbery squirm reminds you of your unslaked and unquenchable thirst for her. You steal glances at her curvy figure, hoping you’ll catch sight of the bulge in her crotch, but your only ‘treats’ so far are her pheromones egging you on, keeping you on edge. Right now, this laquine is more than your owner... she’s the carrot on your stick.");
	// PC taur
	else output("All you hear trudging down the mineral-riching mining tunnels are distant sounds of excavation and, more importantly, the sound of your lop captor’s waxing suit. She’s handcuffed you again for extra measure, using you like a prize pony. Every rubbery squirm on your back reminds you of your unslaked and unquenchable thirst for her. You can’t even see her like this. Though that is upsetting, the drug she’s spiked you with makes sure your only reaction is to get more and more turned on. Right now, this laquine is more than your owner... she’s the carrot on your stick.");
	// Merge
	output("\n\nYou pass by two mining bots hard at work on their pre-programmed tasks, carving colorful gems and valuable ores out of the walls. Up ahead, to your impending " + (pc.exhibitionism() < 66 ? "shame":"joy") + ", are a group of figures in orange and dark blue suits. Slaves... and another one of the roving rabbits sauntering around." + (pc.exhibitionism() < 66 ? " The red shade on your face deepens and your heart drops like a rock at the thought of being seen so vulnerable, even by others in a similar position.":" As excruciating as it is, you can’t help but feel a greater excitement at being seen by others in your vulnerable state.") + " You hope, however, more than anything else, that one of these sexy bunnies will fuck you. Every breath you take stings your crotch with another branding dagger of need. You want so badly to be fucked, orally, anally... it doesn’t matter!");
	output("\n\nWhimpering and panting, caked with sweat" + (pc.hasStatusEffect("Cum Soaked") ? " and sexual effluvium":"") + ", you cry out to your mistress - Wah... wait...");

	// PC not taur
	if(!pc.isTaur()) output("\n\nShe turns to you expectantly as a lump forms in your throat. Everything in your sight that isn’t a beautiful, glowing rabbit fades to black until she’s one of the few things left. That’s fine, she’s all that matters. That stupid, sexy, sweat-drenched bunny... Damn it she’s all that matters! You <i>need</i> to touch her, to taste her again! You look at her with that aggressive need in your [pc.eyes]" + (pc.tailCount > 0 && pc.hasTailFlag(GLOBAL.FLAG_LONG) ? ", [pc.tails] wagging behind you with a feverish blur.":""));
	// PC taur
	else output("\n\nShe grabs your arm and jumps down from you, stepping around to your front. Finally, the only thing - person that matters is visible again! Your vision fades to black until she’s the only object of clarity. That stupid, sexy, sweat-drenched bunny... Damn it she’s all that matters! You <i>need</i> to touch her, to taste her again! You look at her with aggressive need" + (pc.tailCount > 0 && pc.hasTailFlag(GLOBAL.FLAG_LONG) ? ", [pc.tails] wagging behind you with a feverish blur.":""));
	// Merge
	// PC Low Libido
	if(pc.libido() <= 33) output("\n\n<i>“I... I need you to fuck me. Please!”</i> You whine, your body rocking seductively thanks to the lust drug coursing through your veins.");
	// PC Medium Libido
	else if(pc.libido() <= 66) output("\n\n<i>“Pleeeease! Just fuck me, I can’t wait anymore!”</i> You cry, raising your hands like paws" + (!pc.isTaur() ? " and exposing your crotch":"") + ".");
	// PC High Libido
	else output("\n\n<i>“M...Mis... Please please fuck me! I need it badly, I don’t care anymore, I need you so much!”</i> You paw" + (!pc.isTaur() ? " at your groin":"in the direction of your groin") + " and defy the collar on your neck for a brief, relieving moment.");
	// Merge
	output("\n\n<i>“Ohh?”</i> She looks " + (pc.tallness+12 < enemy.tallness ? "down ":"") + "at you with a cocked eyebrow. <i>“Right here?”</i>");
	if(pc.libido() <= 33) output("Whatever it takes!");
	else if(pc.libido() <= 66) output("Hell yeah, right here!");
	else output("Fuck yes, who cares! They could all have you as long as she’s in charge!");

	output("\n\nNervous glances from the multiracial laborers are cast at you. Perhaps some of them envying or sympathising with your position. Likely the latter, considering they’re all chained up to the ceiling anchors. The other jumper down the passage has taken note of your plight, and you can hear the familiar creaking of rubbery laquine as she, too, comes to loom over you. Both of them together glisten like twin suns, their gravitational gorgeousness pulling your taxed sight in two directions. You have no idea where you’re heading, but you’re sure the destination doesn’t matter.");

	output("\n\nYou can’t hear their conversation for the assaulted rock and your own pounding heart. As you dip in and out of focus, shuddering in ecstasy, you do make out some sentences. Their conversation about you being a unique slave trails off.");

	var jumper2:Creature = new JumperBored();
	output("\n\n<i>“This one?”</i> The second laquine looks " + (pc.tallness+12 < enemy.tallness ? "down ":"") + "to you, a silly grin writ upon her short-muzzled face. Your breaths deepen as she leans closer, bringing her cock closer to you by proxy. <i>“Nice catch!" + (pc.isTaur() ? " Your birthday came early, a pony already?":"") + "”</i>");
	output("\n\n<i>“Wanna use [pc.himHer]? Heard [pc.heShe] <b>loves</b> cock, that [pc.heShe] just can’t help but look for more! That’s why it wasn’t so hard to get " + pc.mf("’em","‘er") + " under control!”</i> Your [enemy.furColor]-furred holder says, a gloved hand running through her slick fur, and especially over her yummy bulge.");
	output("\n\n<i>“Okay, I was just looking for someone right now!”</i> The second breathily intones, to your joy. Holy shit, you are the luckiest slut ever! <i>Two</i> laquines about to stuff your throat and-and maybe more! A wet smile forms on your [pc.lips]; you look up to her eagerly" + (pc.tailCount > 0 && pc.hasTailFlag(GLOBAL.FLAG_LONG) ? " and wag your [pc.tails] like a loyal, obedient little slave":"") + ". The knowledge that you’re about to be used, to be touched, by one of them has another layer of sweat thrust out of your pores. It was just taking up space meant for her anyway! Whatever’s left of you in there needs to make way for her, wherever she’s going!\n\n");
	if(pc.isTaur()) output("You fall to your belly.");
	output(" You can’t contain your excitement seeing her kneel down in front of you. Her gloved hand has trouble just gripping you. Two fingers probe your mouth, coming away encased in salivated amber. Sultry huffs follow the jumper as she stands higher and higher over your prostrate form. You squeal at a distracting volume just watching her tug at the zipper on her uniform, sliding it down over her inhaling chest. Her " + jumper2.cockDescript() + ", gleaming in the light, doesn’t wait long, it takes the zipper down past her crotch as she kneels back down in front of you.");
	output("\n\nAnd you, for your part, don’t wait long to suck it. Propelled by your addiction to the laquine pirate’s smells and tastes, and addled by the drug stimulating your pleasure centers, you devour her " + jumper2.simpleCockNoun(0) + " before she can even take your reins. You don’t even roll out the welcome mat until she’s burrowed deep in your throat. Your guiding chain eases up when you take the bored jumper’s dick to the hilt, your previous def... ‘encounter’ making you all the more capable of handling their generous, filling endowments.");
	output("\n\n<i>“Woooww,”</i> she leans back, thrusting her crotch out more so that your hungry mouth can reach every inch, <i>“[pc.heShe] really is a nice catch! Do you think the overseer would miss [pc.himHer]? We could probably keep [pc.himHer]! Think about that,”</i> the rabbit looks down to you with sultry eyes, <i>“our gang’s best pet, we’ll all take turns fucking you in every hole every day, you’ll get to suck each one of us off. Gosh... The way you’re going at it now, you’d probably do it right through the suit someday!”</i>");
	output("\n\nHastened by the slut-bun’s stimulating praise, you quicken your pace. If she’s happy, that only means more of her taste will flow through you! You can enjoy your place beneath her and she can enjoy you! More of them would come and cum, and you could suck all of them off one by one! Your lips seal around her " + jumper2.cockShape(0) + " shaft, blocking any fluid from leaking out, and you thrust your head all the way to her snuggly belly, grinding your nose against the sopping sheen of her " + jumper2.furColor + " fur. Before you can truly lose yourself in mindless fellatio, the jumper draws your head back, keeping her " + jumper2.cockHead(0) + " warm atop your tongue. She looks up to your mistress, whose [enemy.cock] stretches painfully against her suit, asking, <i>“Why not t-take a break yourself? Look how insatiable [pc.heShe] is!”</i>");

	if(pc.tailCount > 0 && pc.hasTailFlag(GLOBAL.FLAG_LONG)) output("\n\nWordlessly, your laquine captor slips behind you and grips your wagging [pc.tails], pulling " + (pc.tailCount == 1 ? "it":"them") + " up to lift your [pc.ass].");
	else output("\n\nWordlessly, your laquine captor slips behind you and grips your [pc.hips], pulling them up to lift your [pc.ass].");
	output(" Your ");
	if(pc.hasGenitals()) output("your [pc.crotch] " + (pc.cockTotal() + pc.vaginaTotal() + pc.balls <= 1 ? "is":"are") + " fully exposed to her.");
	else output("subtly contracting [pc.asshole] is laid bare to her.");
	output(" While your " + (pc.hasTongueFlag(GLOBAL.FLAG_LONG) ? "long tongue enswathes the " + jumper2.cockDescript() + " in your mouth,":"[pc.tongue] lashes at the " + jumper2.cockDescript() + " in your mouth,") + " you hear the first laquine’s zipper scraping open tooth by metal tooth, and soon, you feel her [enemy.cock] thrusting between your [pc.thighs]. She humps you hard, sending ripples through the softest parts of your body. The tremors even reach the cock in your mouth, only adding to the spitroast pleasure.");

	output("\n\nYou feel a pair of exploratory whiskers tickle your ass. The laquine’s skilled tongue lunges for your [pc.asshole]" + (pc.buttRating() >= 10 ? ", her hands spreading your wide cheeks to get in":"") + ". You grind your hips against her face as she caresses your thighs. Two furry fingers slip easily into your butt next to her tongue, spreading your hole wide. Apparently satisfied with how lubed you are now, she pulls her tongue back, licking at the sweat streaking down your [pc.skinFurScales] before nestling her [enemy.cock] in your canyon.");

	// PC Butt <=5
	if(pc.buttRating() <= 5) output("\n\nYou can feel two delicate hands tracing over your modest rump, almost certain her [enemy.eyeColor] eyes are boring a new hole straight through you. <i>“A little small, but we can change that!”</i> she remarks. <i>“Still, everyone’ll be able to see you stretching inch by inch.”</i>");
	// PC Butt 6-12
	else if(pc.buttRating() <= 12) output("\n\nA number of loud slaps to your [pc.ass] has you moaning around the " + jumper2.simpleCockNoun(0) + " oozing sticky pre in your mouth. <i>“Can’t tell you how hard it was holding back when you have an ass like this!”</i>");
	// PC Butt >=13
	else output("\n\n<i>“Fuck yes... [pc.HeShe] should be upstairs with an ass like this!”</i> the gloved hands of the laquine behind you knead ample amounts of [pc.race] assflesh into her musky member, using the globes of your delicious derriere as a pair of pillows. She punctuates her lackadaisical molestations with a few loud slaps that have you drooling up a storm over the " + jumper2.simpleCockNoun(0) + " in your mouth. <i>“Sooo hot... And [pc.heShe]’s such a good slave!”</i>");
	// Merge

	output("\n\nThe " + jumper2.cockHead(0) + " of her ready rod " + (pc.hasVagina() ? "rubs against your [pc.pussy] before pressing":"presses") + " against your [pc.asshole]. You shake your [pc.ass] for her, trying to draw her in yourself. Her penetration into your " + (pc.ass.looseness() < 3 ? "tight":"loose") + " butt is painless. Instead, every sensation surging up and down your spine are each a manifestation of pure bliss. Your back arches and the edges of your [pc.lipsChaste] contort into a smile, a smile that widens with your stretching ass. These ultra horny cum-spewing rabbits are giving you what you want! If your old life doesn’t pan out, then you could find unending comfort skewered on meaty laquine cock.");
	pc.buttChange(jumper2.cockVolume(0));

	output("\n\nShe doesn’t wait for you to adjust, using you like she would any other slave. Vitiated by the venom and innervated by the dual sensations of your mouth and [pc.asshole] being claimed and molded into the perfect sleeves for these horny herms, you help the [enemy.cock] behind you probe ever deeper into your colon with eager bucks of your [pc.hips]. Simultaneously, you loudly slurp the " + jumper2.cockDescript(0) + " between your lips, enjoying each jumper’s squealing praises all the while. At first you felt nothing but shame, but even the slaves nearby are surely jealous of how you feel right now, and of how good you’re making these rutting rabbits feel!");
	output("\n\nHer " + jumper2.cockHead(0) + " ballooning in your mouth, the second laquine’s orgasm is upon her. Her head jerks back and she howls in delight, running her sticky, gloved fingers " + (pc.hasHair() ? "through your [pc.hair]":"over your head") + " as her full furry sack sloshes audibly on your chin. She thrusts in as far as she can in your submissive form and unloads strand after rope of white hot cum into your empty stomach. Her spurting cum seems more like a stream than it does a normal climax, and your belly is soon bulking up that you look to be in early pregnancy.");
	output("\n\nEvery pain receptor in your body has been coded only to produce pleasure, and what you feel in your lower half is just that. Numb and burning with need, the stench of yummy leporine musk in the air, you mewl around a messy cock for her to cum too. The only sensations you feel of her penetration are the seisms in your legs and torso from every clap of her crotch against your [pc.ass]. The wet sounds of her reaming you are at odds with the squeaking of her suit, grinding against her leaper’s legs.");
	output("\n\nPre flows like a river through the valley of your assflesh, and a torrential storm swirls inside as she, too, cums inside your vexed body. Like a clap of thunder, cum surges from the laquine’s vellicating [enemy.cockHead] into your lusty loins. Your surroundings seem to fade away utterly, leaving you floating on a warm cloud of euphoria. The stink of lecherous laquine hugs you like the layers of an atmosphere. Reality is scrubbed, and it drains from your [pc.ears]. You can only smile languidly with bunny batter dripping down your [pc.lips] and leaking from your [pc.asshole], looking no different than a worthless whore: a real pleasure-slave.");

	// PC not taur
	if(!pc.isTaur()) output("\n\nYou don’t even recognize the slaves or the mines in this entranced fug, you can only see... <i>feel</i> the laquine leading you on again, humming a content praise for you. You follow along like an orbiting moon, trailing after the mist and dew of her figure...");
	// PC taur
	else output("\n\nThe mine, this station, your life are all unrecognizable concepts. Lost in an entranced fug, you can only see... <i>feel</i> the laquine riding you again, humming a content praise for you. You glide onward like an orbiting moon, following the sound of her voice in whatever ear she leans next to.");
	processTime(50);
	pc.orgasm();
	pc.loadInMouth(enemy);
	pc.loadInAss(jumper2);
	clearMenu();
	addButton(0,"Next",fourthLossToBoredJumperBadEndProggo3);
}

public function fourthLossToBoredJumperBadEndProggo3():void
{
	clearOutput();
	showBoredJumper(true);
	author("William");
	output("You’re " + (!pc.isTaur() ? "led":"ridden") + " around the mines for hours, " + (!pc.isTaur() ? "following after":"directed by") + " the woman holding your leash. She patrols the more active areas of the mines, past hundreds of slaves digging out the treasures these pirates want. Whatever their reasons might be, they’re not your business. You only concern yourself with being a good slave for your mistress. She seemed very happy when you called her that after she fucked you.");
	output("\n\nWhen you pass by other members of her gang on patrol, you are offered to them. They use your mouth, mostly. " + (pc.biggestTitSize() >= 6 ? "Some use your [pc.breasts], careful not to cum all over you. It belongs in your stomach. ":"") + "The rest use your [pc.asshole]. It’s an awkward sense of pride, you think, knowing you’ve left a trail of slime and love in your wake. It leaves you smiling beatifically the whole way...");
	output("\n\nYou struggle to " + (pc.isTaur() ? "walk":"crawl") + " through the warrens in your fatigued state. Your rationality slowly but steadily returns to you as the saccharine heat and sexual mellow bring you to complete and utter exhaustion.");
	processTime(180);
	pc.loadInMouth(enemy);
	pc.loadInMouth(enemy);
	pc.loadInAss(enemy);
	pc.loadInAss(enemy);
	pc.loadInAss(enemy);
	pc.applyCumSoaked();
	for(var i:int = 0; i < 10; i++)
	{
		pc.orgasm();
	}
	clearMenu();
	addButton(0,"Next",fourthLossToBoredJumperBadEndProggo4);
}

public function fourthLossToBoredJumperBadEndProggo4():void
{
	clearOutput();
	showBoredJumper(true);
	author("William");
	output("When you wake, you have no idea where you are. Gently, your mind reasserts itself and you stagger upward on trembling limbs, lying on your hip. You groan and scan your surroundings carefully, feeling like you just woke up from a long dream. You become mindful of the dried cum all over your body. Your knuckles and knees are scraped with blood and covered in soot." + (!pc.isNude() ? " You’re naked, too, and you frantically look around for your clothes and other gear.":""));
	output("\n\nWhat happened to you is now vivid in your mind. You feel around your neck, happy that the collar isn’t there anymore... but also a little... mournful? Aimless? Regardless, you seem to be back where you’d lost to the laquine who bandied you about like a pet. Your belongings are scattered around the tunnel. You quickly collect everything to find that you’re only short a few credits, thankfully.");
	output("\n\nAfter gathering yourself, you shiver thinking about the laquines again. Their presence alone is having a deleterious effect on your willpower, not to mention the drug they’ve been using to sap you of free thinking. You’re not sure if they were joking about taking you as a slave for themselves, or if they were merely jesting about a bet based on you. Whether or not those threats were flaccid, you can’t help but think that a life of obedience to one of those fuckbunnies doesn’t sound half bad... Yes...");
	output("\n\nNo! You shake your head with a low-growl, feeling an aching arousal the longer you conjure their short-muzzled countenances, the shapes of their bestial cocks, their luscious breeding figures-");
	output("\n\nYou hurry away, soaked with the aftermath of your debauched tribulations, contemporaneous feelings of longing, desire, fear, and nervousness hounding your steps. It shakes you that, in some part of your mind, you <i>want</i> to be a slave to them, nothing but an eager, obedient ball-slut that-");
	output("\n\nYou smack yourself and breathe.");
	output("\n\n<b>If you lose to another Jumper, you may never recover. You should try to win, at least once, or embrace being a futa fuck-bunny’s slut.</b>");
	processTime(60);
	restHeal();
	output("\n\n");
	CombatManager.genericLoss();
}

// Bad Ends
// Variants for each Jumper variant (horse, dog, cat, human)
public function badEndToThatJumperFinally():void
{
	showBoredJumper(true);
	// HP Loss
	if(pc.HP() <= 1) output("A loud <i>BOOM</i> blinds and deafens you momentarily before you feel your strength wane. You’re kicked in the stomach - <i>hard</i> - and can only crumple to your knees in defeat. The sudden distinction of no longer being able to fight drains the color from your world...");
	// Lust Loss
	else output("A sudden distinction drains the color from your world... You can’t keep fighting. You can’t fight the tickle in your taste buds, you can’t resist the burning need in your loins, and you most certainly can’t stop the tugging in your heart any longer. You fall to your knees with resignation.");
	// Merge
	output("\n\nYou stare up forlornly at the glossy pirate, expecting her at any moment to use you, or-");
	output("\n\n<i>“Aren’t you tired of this?”</i> she asks levelly, her voice coming out like airy vapor. <i>“Just about everyone knows about you now, and if you keep at this you’re just gonna end up dead, especially if anybody else finds you! You’re too hot to end up cold, cutie. Guess I won the bet!”</i>");
	output("\n\nWait... What bet? With the last force you can muster, you force your head away and clutch an arm. You’re already shivering from the effect her odor and proximity to you. Unimportant things are getting thrown out with a layer of cold sweat as her scent throws the new switches in your mind. You can already feel the heat between your [pc.thighs] and a ghostly stretching sensation in your [pc.butt]. Even now, that unique, alien taste is dancing on your palate, spreading through your uvula, and then through every flaring nerve in your body.");
	output("\n\nIt’s an addiction you can’t survive without appeasing. Already, you feel wild... You <i>want</i> to suck her cock, you <i>want</i> to be claimed, you <i>want</i> to be nestled beneath her... any bunny would do, but this is <i>her</i> victory, and hers alone. You are her [pc.race] prize, and you will be her-");
	output("\n\n<i>“...<b>slave</b>,”</i> she finishes, but you have no idea what she was saying beforehand. <i>“It went something like this, between all of us...”</i> she runs a glove over her ear, a tide of sweat brushing up against her latex finger, <i>“the next one who finds that lost little slave gets to keep [pc.himHer]. Even better, you don’t look like you’d mind at all!”</i>");
	output("\n\nThere’s no outward malice on display in the pirate bunny’s [enemy.eyeColor] eyes. She stretches idly, craning her lapine body with an utterly assured belief that you can do nothing about what she has in store for you. But you’re not at all focused on that, because you can’t budge your stare from her crotch. You cross your eyes and for a second, just one second, you can see past it! You can see her [enemy.cockType] dick, slathering itself in pirate pre, twitching violently against its confines... and you can feel yourself drooling up an overheated storm at the thought of being her cock holster again... and again...");
	output("\n\nIn her, you don’t see another dopey rabbit wandering these warrens, you can only see your new mistress. Your task calls out to you from the distant recesses of your mind, your quest to inherit dad’s company" + (crew(true) > 0 ? ", the fate of your crew":"") + ", and the fear of what might happen to you...");
	output("\n\nBut it’s all so... quiet. The sounds those thoughts make are nothing compared to that of rubber against rubber. The laquine saunters up knowingly, savoring her victory and sexy prize with humping glances. " + (!pc.isNude() ? "She kneels down and peels off your equipment piece by piece, exposing your [pc.skinFurScales] to the uncomfortably warm air. ":"") + "She rifles through your belongings for a while, taking whatever seems interesting before throwing the rest aside like trash meant for a bin.");
	
	// Horse Jumper
	// [Yes!!] is the PC willingly becoming the jumper’s live-in cock holster and bed warmer.
	// [Wait...] will have the PC brainwashed and turned into a loyal love slave.
	if(enemy.hasCock(GLOBAL.TYPE_EQUINE))
	{
		output("\n\nBefore she does anything else, the gray-muzzled laquine pirate regards you with a different expression, one that is friendlier, warmer, and irresistibly attractive. She smiles, <i>“You know, there’s something about you that makes me want to ask something. You’re a real champ at sucking dick, and you’ve been looking for us as much as we’ve been looking for a quick fuck! Just what are you doing here?”</i>");
		output("\n\n<i>“I... I don’t know...”</i> you stammer and blush bright, shuddering in a half-blissed state. All the while, you can’t bear to look away from her crotch, imagining how painful every pulse of her [enemy.cockType] meat must be in the confines of that inky suit, how much it <i>needs</i> attention, and how much tasty, delicious laquine pre it must be slathering itself with...");
		output("\n\n<i>“Oh come on, what kinda answer is that? Wandering around a station like this... I think... you’ve just been looking for a good cock, haven’t you? That’s why you were so belligerent! You just wanted someone to take care of you, right? And not like the <i>Vipers</i>.”</i> The rabbit puts an arm around you, licking your cheek possessively, whispering into your [pc.ear], <i>“So you’re not a slave, but you <i>wanted</i> to be one, is that it? And not just any slave...”</i>");
		output("\n\nShe glances down, then guides your [pc.hand] to her prominent bulge. <i>“You just wanted this, right?”</i>");
		processTime(20);
		pc.changeLust(100);
		clearMenu();
		addButton(0,"Yes!!",yesToBeingHorseJumpersSlut,undefined,"Yes!!","That’s <i>exactly</i> what you want! What you <i>need</i>!");
		addButton(1,"Wait...",waitToBeAHorseJumperSlut,undefined,"Wait...","No... you’re not a slave! ...Right?");
	}
	// Dog, Cat, Human-dicked Jumpers
	// Go straight to Bad Ends 2, 3, or 4 depending on Jumper.
	else
	{
		output("\n\n<i>“You won’t be needing this stuff anymore. Allll right! Time to go!”</i>");
		output("\n\nThe [enemy.furColor] furred rabbit puts a paw on your shoulder and digs through a concealed pouch on the back of her wide hip. She soon reveals another vial: you’re sure it’s the same drug as before and you brace for the worst. The second it clicks and hisses against your neck, your vision darkens immediately. The tranquilizing payload works fast, and your last sight of her is that ubiquitous laquine grin.");
		processTime(15);
		pc.changeLust(25);
		clearMenu();
		if(enemy.hasCock(GLOBAL.TYPE_CANINE)) addButton(0,"Next",jumperDogGangsPet);
		else if(enemy.hasCock(GLOBAL.TYPE_FELINE)) addButton(0,"Next",badEndToCatJumpey);
		else addButton(0,"Next",badEndToHumanJumper);
	}
}

// Bad End 1 (jumperHorse - Bed Warmer)
// PC will become a loyal love slave for the jumper to enjoy forever.

//[Yes!!]
// Tooltip: That’s <i>exactly</i> what you want! What you <i>need</i>!
public function yesToBeingHorseJumpersSlut():void
{
	clearOutput();
	showBoredJumper(true);
	output("<i>“Yes! Yes!!”</i> you shout. <i>“I’m...”</i>");
	output("\n\n<i>“Oohhh, you’re just a cock-hungry slave, huh? A real ball-slut, a dutiful cocksucker? One taste and you were already hooked?”</i> she looks you straight in your [pc.eyes], her playful [enemy.eyeColor] eyes only tearing down whatever walls were left standing in your heat-addled mind.");
	output("\n\n<i>“Yes!”</i> you nod furiously, smiling earnestly. <i>“I’m... I’m your slut! Please, I want your [enemy.cock]! More than anything else. Every day, whenever you want, I’ll suck your cock, I’ll deepthroat it, and I’ll take it! I want you to use me, and only me!”</i>");
	output("\n\n<i>“Is that so?”</i> she strokes your cheek, but you can tell she can’t keep up the smooth charade much longer. <i>“You wanna come with me? Be my cock holster by day and my bed-warming lover at night?”</i>");
	output("\n\nYour heart about leaps out of your chest. Every muscle clenches in the infinitesimally small moments passing over your eyes and through your ears, your breath catches in your throat and in your lungs, swirling, cycloning. Your fingers curl and only the faintest squeak escapes your [pc.lipsChaste]. Why are you tensing up? Because for an attosecond you thought about saying <i><b>no</b></i>.");
	output("\n\n<i>“Fuck yes! Yes yes yes!”</i> you cheerily exclaim.");
	output("\n\nWith a squeal, the jumper does exactly what you were hoping for: one finger and one thumb clasp around her zipper and tug it down. Salivating like the slovenly slut you are, you can’t help but aid your lop-eared mistress undo her creasing suit, taking it down until the [enemy.cockHead] pokes out like the familiar face of a long-gone lover. Before her shaft even reveals itself, your eyes cross at the size of her cock and you pry apart the splitting metal teeth, tearing her uniform open to inhale her [enemy.cock] as fast as you can. Your gag reflex, once as rebellious as your old thoughts, has been vanquished by her fat, meaty horse dick, the bulging veins in her chocolaty mast massage your throat as you start to bob slowly, your nose buried in her musky crotch.");
	output("\n\nNo part of your obedient body dares to deny its sexy purpose, nor does it attempt to suggest to your conquered mind what it’s doing is wrong. You pull back just enough to stare into the folds of her sheath adoringly, your hands already tending the dangling apples straining the tight, fuzzy sack beneath her [enemy.cockType] slab. <i>“Oohhh, that’s fucking hot!”</i> the laquine rubs your head" + (pc.hasHair() ? ", gripping tufts of [pc.hair]":"") + ". <i>“I was right about you, huh? This is what you wanted so badly? Why didn’t you say anything? I can guarantee... uh, <i>almost</i> guarantee the first one of us you asked would have been all too happy to give you a permanent place between their legs!”</i>");
	output("\n\n<i>“Almosht?”</i> you murmur inquisitively.");
	output("\n\n<i>“Well...”</i> the rabbit giggles, pushing you down on her cock again, gyrating her wide hips. <i>“Not everyone, I guess. Some of ‘em are a couple of bitches, but that’s mostly because they overdose on energizing drugs. ‘Sides, you don’t need to worry about them, not since you belong to me now. You just keep swallowing that dick!”</i>");
	output("\n\n<i>“Yesh mishtresh!”</i> you squeal, your [pc.tongue] " + (pc.hasTongueFlag(GLOBAL.FLAG_LONG) ? "wrapped around her shaft, jerking as you suck":"pinned beneath her mighty member") + ". Your velvety cheeks hollow around that intoxicating cock. You withdraw slowly, massaging the broad sides of her tasty tool with your suctioning cheeks, the flare of her tip sealing your throat closed for a second. You don’t even cough, delirious as you are just to be in the place you belong. Everytime you jerk forward, you feel a lovely, tightening twinge in your chest. Sweat pours down your [pc.face], pooling around the inches of her cockflesh when you’re not burying her bone in your gullet.");
	output("\n\n<i>“Uhnnmm...”</i> the laquine moans, groping her chest with both hands. She pinches her bulky, munchable nipple, tugging her tits and laughing before she looks down to you. She thrusts into your mouth and grips your head, locking your face to her groin. <i>“Those lips you’ve got, cutie, ohhhhh... No slave on this station even comes close. No slut in any brothel hopped up on any amount of fuckin’ mods can match you. You’ve just got the best mouth ever, I just can’t believe that mouth is only going to be on <i>my cock</i>!”</i>");
	output("\n\nYou feel incredibly turned on with every word tumbling out of her fuzzy mouth, and your burning arousal helps you ignore the need for oxygen. Your groans only vibrate the laquine’s cock, keeping her nice and comfortable where she is. You look up to her twitching lapine nose, tickled by the scent of ");
	if(pc.hasCock()) output("your throbbing [pc.cocksLight]");
	else if(pc.hasVagina()) output("tingling [pc.pussies]");
	else output("your sweat");
	output(". She purrs with every trace of her paw over your head" + (pc.hasHair() && pc.hairLength >= 4 ? ", and you tense up in buttery warmth when your delighted mistress threads [pc.hair] between her digits and idly plays with your [pc.hairs]":"") + ".");
	output("\n\n<i>“But you know what? I think you’ve been neglecting a part of me. Two very important parts of me...”</i> she simpers.");
	output("\n\nThe horny humper has to drag you off her [enemy.cockNounSimple]. You whine in response, thrusting your needy tongue out to her [enemy.cockHead] just before you’re sat up" + (pc.hasKnees() ? " on your knees":"") + ". The rabbit stands up over you, and you quickly realize just how right she is, and you soon hate that you begrudged her for stopping your devoted deepthroat. She hefts her massive cock above you as if to allow you to inspect your handiwork, shading your eyes from what little light there is. From here, somehow, she looks <i>sooo much bigger</i>.");
	output("\n\nYour eyes dilate beneath the shadow of her throbbing dick which only seems to grow larger with every blink, with every pulse, with every impactful heartbeat. Your genuflecting [pc.tongue] spills from your mouth" + (pc.hasTongueFlag(GLOBAL.FLAG_LONG) ? ", hanging past your [pc.chest]":"") + ". You gasp quietly in awe of her dick, only shaken from your cocknosis when it smacks wetly against your cheek. <i>“You know what I mean, cutie,”</i> she giggles before lifting her shaft again, though potently musky cords of pre and ejaculate still connect you to her prick.");
	output("\n\nYour eyes are finally drawn to the place they’re meant to go. And <i>damn</i> does the sight just about short circuit your brain. Her huge sack dangles attractively beneath her sheath, burdened by two giant testicles sloshing in a sea of pent up laquine love. Each sumptuous nut could fill your [pc.hand] on its own, with plenty of furry ballflesh to spill between your fingers. It’s an erotic, juicy sight of otherworldly make.");
	output("\n\nYou waste no more time. You dive into her fuzzy sack tongue first, immediately - <i>needfully</i> - appreciating the weight of her nuts on your welcome mat. They shake and jostle with every eager lap, beads of sweat - liquid musk - dripping from the tips of her short fur like gleaming droplets of water from the blades of grass. The diameters of her apple-sized testes are fields for your [pc.tongue] to play on, wide open terrain that spurs the desire to run. Her weighty balls are no different than the dishes on a scale. When you try in vain to raise one on your [pc.tongue], the other sags down on your nose, directly impressing its powerful, dominant scent onto your brain. You submissively nibble her sack, playfully and tenderly tending the laquine balls within, nearly cumming from the feeling of supple, taut skin massaging your [pc.lips].");
	output("\n\nHer body... the distinction is sudden. Her body is ideal, gorgeous, smoking hot, and it naturally rewards you for your obedient service. Where your tongue laps on her crotch, her cock, her delicious fuzzy sack, it is obliged: her gray fur bristles against your thick flesh with every lick, and every fat dollop of laquine pre is a warm reward to your mind and body. It helps you realize there’s no other place to be, that you will be taken care of if only you keep serving. The hand on your head, ushering you to hitherto unlicked places helps you finally realize your only place in the galaxy. There’s...");
	output("\n\nYou can’t hold back anymore, and neither can she. You sense her orgasm immediately - the next twitch of her cock bounces it up stronger than any before it. You pull back, and with a happy murmur, deepthroat her again. The blunt tip of her cock flares in your throat, not quite as strong as a knot, but it ensures no drop of rabbit spunk splatters anywhere but your gurgling gut. With both hands on your head, she thrusts in your face, clapping her spit-shined and clenching nuts against your chin, and slowly empties her fat loads right where they belong. The taste of her cum excites your body, and you cum with her");
	if(pc.hasCock()) output(", your [pc.cocks] firing off [pc.cum] in long ropes between her legs.");
	else if(pc.hasVagina()) output(" your [pc.pussies] " + (!pc.isSquirter() ? "drizzling":"squirting") + " fresh feminine fluid all over your [pc.legOrLegs].");
	else output(" your whole body rattling like a port in a storm, vibrating her cock like one.");
	output("\n\n<i>“O...ohhh, damn...”</i> she murmurs, withdrawing her cock from your fuckdrunk face. <i>“With you around... oh fff... Good [pc.boyGirl]...”</i>" + (pc.tailCount > 0 && pc.hasTailFlag(GLOBAL.FLAG_LONG) ? " Your [pc.tails] wag as you clean her cock of cum, drinking the tangy cocktail of cum and sweat down with eager gulps.":""));
	output("\n\nWhen she opens her [enemy.eyeColor] eyes, she sighs down at you. <i>“You ready to go, slave?”</i>");
	output("\n\n<i>“Yeah!”</i> you cry, nodding happily as you nuzzle her softening [enemy.cockNounSimple], fully submitting yourself to a life of cumsluttery. Doubt, fear, and resignation swam away a long time ago with the minutes-old sweat.");
	output("\n\nEven though you know full well what you’re giving up, you don’t care one bit... Because this jumper’s cock is all yours... and <i>you</i> are all hers...");
	processTime(30);
	pc.loadInMouth(enemy);
	clearMenu();
	addButton(0,"Next",yesToBeingHorseJumpersSlut2);
}

public function yesToBeingHorseJumpersSlut2():void
{
	clearOutput();
	showBoredJumper(true);
	author("William");
	// PC not bipedal
	if(pc.isTaur() || pc.isNaga()) output("Before you embraced your new place in life, you were asked by your mistress to undergo a little change. You said yes without hesitation, giving up your " + (pc.isTaur() ? "tauric":"naga") + " frame to better enmesh with her daily routine, and to not take up so much room on their ship.\n\n");
	// Merge
	output("You awaken in a familiar bed, lying naked with a thin, black sheet draped over you up to your neck. Stars, that smell is wonderful. You’re awake, but your eyes aren’t open just yet. Why bother? You’ve got your special someone with you.");
	output("\n\nYou’ve been in space for... some amount of time. You quickly learned that you didn’t have to pay attention to things like that. Though, geez... it’s been a long time since you left Zheng Shi, and a longer time still from when you left your old life behind." + (crew(true) > 0 ? " Your generous mistress allowed you to warn your friends, and they took your ship and fled the sector back then, leaving you behind, but not alone.":""));
	output("\n\nBut that’s all in the past.");
	output("\n\nYou abruptly open your eyes when you clench your hands, finally realizing something is missing from your bed. You grumble and groan as you come to, slipping the blanket off and stretching groggily. You slide out of the bunk into a rectangular domicile, the barracks where you and your lover sleep. Plenty of other beds line the bulkheads down to some bare necessities, including a sink - you head there immediately to wash your [pc.face]. The [pc.manWoman] looking back to you in the mirror is the same as [pc.heShe]’s always been: joyous! But a little disappointed... Your mistress was supposed to have the day off!");
	output("\n\nYou rinse your cottonmouth and [pc.walk] to the uniform sitting at the foot of your bed. You slide that tight-fitting catsuit on with a few flexes" + (pc.isGoo() ? ", your goo filling it out that you start walking upright again like someone made of flesh and bone":"") + ". Time to find your gray-furred lover, wherever she’s gone!");
	output("\n\nWhen you step near the door, it opens with a pneumatic hiss at your proximity. Or so you think. Before you can even adjust to what’s on the other, well-lit side, you’re crushed by a firm hug against two big boobs and a thick bulge below. <i>“Heya, [pc.name]!”</i> comes the voice you recognize most. Now that you have established sight and touch, you soon establish scent. A mind-washing fragrance runs over you as you’re pulled back to the bed in the arms of your athletic, musky lover, whose aroma hasn’t dulled for lack of wandering around sweaty in some dark mineshafts.");
	output("\n\n<i>“You just wake up?”</i> she asks breathily.");
	output("\n\nYou nod, kneeling between her legs, wondering more if her suit is about to come undone.");
	output("\n\n<i>“Bet you were worried where I was, huh?”</i> she smirks, wrapping her legs around you. You smirk and start giggling, telling her you were, but you knew she’d be back as soon as she could.");
	output("\n\n<i>“How about we do something different today?”</i> she asks, running a provocative finger over the clasp of your zipper. Something different!? Hell yes! You yank your suit off again and bare yourself to your laquine who does the same. With her tumescent horse-cock on display again, you instinctively go to fellate her.");
	output("\n\nBut she stops you with an ‘uh-uh’. Confused, you pull back, your ready tongue sticking between your [pc.lips].");
	output("\n\n<i>“Come here!”</i> she says, grabbing you under your arms and lifting you up on her lap.");
	output("\n\nSurprised, excited, and keen all at once, you moan happily upon realizing her intentions. You wrap your legs around her waist and your arms around her neck.");
	if(pc.hasCock()) output(" Your [pc.cocksLight], erect and dribbling now, rub" + (pc.cockTotal() == 1 ? "s":"") + " against her own.");
	else if(pc.hasVagina()) output(" [pc.EachVagina], tingling, drooling, and oozing, has never been readier.");
	output("\n\n<i>“You’ve been a good little cock-slave all month, I think a real reward is long overdue, [pc.name]. I love having you around, and I know it’s hard to show it sometimes...”</i> she says, licking your cheek and caressing your [pc.arms].");
	output("\n\nYou thank her profusely, slipping a finger to your [pc.vagOrAss] and giving her an erecting jerk in the process. <i>“Whenever you want...”</i> you murmur, holding back your voice for when the action starts. The day has barely begun and you’re being given a gift! And not just the usual gifts she showers you with for servicing her. Your eyes cross as her musk fills the room - that’ll surely get the other bunnies jealous later!");
	output("\n\nThe pirate herm lifts your [pc.thighs] and aligns her [enemy.cock] with your " + (pc.hasVagina() ? "gushing slit":"tight pucker") + ". You’ve gulped down load after load of her cum, but now she’s going to claim you wholly. You’ve worked so hard for this! When you feel your " + (pc.hasVagina() ? "[pc.pussy]":"[pc.asshole]") + " stretching, you lock lips with hers straight away. You moan - scream even - into her mouth as her cock slips " + (pc.hasVagina() ? "between your labia":"through your butt") + ", making an exquisitely pleasurable journey to the center of you.");
	output("\n\nAll of a sudden, you’re pulled back into the bunk and put on your back. Your legs flail but quickly re-lock around the laquine now on top of you, hungrily licking your neck and your cheek. She growls as she thrusts the last few inches in, " + (pc.hasVagina() ? "pressing her flare to your cervix":"hilting herself in your ass") + ".");
	output("\n\n<i>“What do you think? How about I start giving back from now on?”</i> she asks, stroking your cheek. <i>“You do what you do in the day... and at night, I’ll fill you up.”</i>");
	output("\n\nYou kiss her again, telling her that sounds amazing. And as she fucks you senseless today, tomorrow night, and all the nights to come, you think to yourself... she truly is the greatest gift of all. You may never claim the legacy your father left you now, but that all stopped mattering the day you were claimed as this horny bunny’s untiring slut.");
	output("\n\nOne thing’s for sure: you wouldn’t give this up for anything in the universe...");
	processTime(60*72);
	badEnd();
}

//[Wait...]
// Tooltip: No... you’re not a slave! ...Right?
public function waitToBeAHorseJumperSlut():void
{
	clearOutput();
	showBoredJumper(true);
	author("William");
	output("<i>“N-no, that’s not it!”</i> you exclaim, pulling your hand back. A long, disappointed sigh reaches your [pc.ears], and you feel yourself pushed down to your back, the lawless laquine looming above. <i>“Guess that’ll always be a mystery, but, cutie...”</i>");
	output("\n\nShe rummages through the bags on her back, a smirking ‘ah-ha!’ squeaking out a few seconds later. <i>“You’re still a prize I’m not letting go of!”</i>");
	output("\n\nShe soon showcases another vial: you’re sure it’s the same drug as before and you brace for the worst. The second it clicks and hisses against your neck, your vision darkens immediately. The tranquilizing payload works fast, and your last sight of her is that ubiquitous laquine grin.");
	processTime(10);
	clearMenu();
	addButton(0,"Next",waitToBeAHorseJumperSlut2);
}

public function waitToBeAHorseJumperSlut2():void
{
	clearOutput();
	showBoredJumper(true);
	pc.femininity = 80;
	pc.faceType = GLOBAL.TYPE_LAPINE;
	pc.faceFlags = [GLOBAL.FLAG_FURRED,GLOBAL.FLAG_MUZZLED];
	pc.earType = GLOBAL.TYPE_LAPINE;
	pc.hairType = GLOBAL.HAIR_TYPE_HAIR;
	pc.hairLength = 14;
	pc.hairColor = enemy.hairColor;
	author("William");
	output("Your sleep is black. Discomfort needles at you from every angle, each squeeze and depression against your formless body a thin blade of fatal exhaustion. It’s almost like you’ve been submerged in something so hot that it’s rapidly dissolving your state of being. The disquieting stabs, cuts and nicks vex you until you scream, yet there is no sound. When you act, it all fades... and you float again in a featureless sea of frightening loneliness.");
	output("\n\nAt some point, you awaken in a cold room, lying naked in a bunk. Just the act of opening your eyes is exculpating, being <i>awake</i> is a long awaited lustration. A thin, black sheet is draped over you up to the shoulder. You look out to the small, indistinct room itself, seeing a few other bunks stacked. You’re in a barracks? Or crew quarters? You crawl out of bed, already chilled by the air, and look around the rectangular domicile. A mirror hangs on the wall above a sink, recently cleaned by the sterile smell of it.");
	output("\n\nThe reflection is... you! Your [pc.face] is just like you... remembered it? Something primordial in nature, very deep in your gut tells you you’ve always had those bunny ears, those [pc.hairs], and most definitely those stylish piercings in your ears. A faint headache suppresses suspicion at what is a wrong... <i>an obvious truth</i>. Shaking your head, you look down with a quiet moan." + (pc.biggestTitSize() != 4 ? " You find that you have a perfect rack. Your breasts are just the right size at DD-cups. Were they always like this?":""));
	output("\n\nYour hips and thighs are probably just the way you left them too. They’re nice, curvy, and soft. Not too wide but they flare out very well. ");
	if(pc.isHerm()) output("Your [pc.crotch] are... intact. Your [pc.cocksLight] and [pc.eachVagina] sit where they’ve always been, warm and ready for action. ");
	else if(pc.hasVagina()) output("[pc.EachVagina] is there, warm and slightly wet. ");
	else if(pc.hasCock()) output("[pc.EachCock] is there, flaccid and warm. ");
	else output("Your barren crotch is there, devoid of the galaxy’s preferred means of sex. ");
	output("All in all, you look incredibly attractive. It occurs to you that you’d pass for the ideal partner romantically and sexually, and <i>that</i> is a dreamy thought...");
	output("\n\nYou notice a pair of simple clothes near the bunk you slept in and [pc.walk] towards them." + (pc.isTaur() ? " The act of walking has you stumbling oddly. Why is that? Just moving four legs should be easy. But you have two? Another headache purges that thought as well.":"") + " You throw the outfit on, following a perfunctory routine your mind doesn’t know but your body does. These clothes are tight but warm, and they accentuate your frame." + (pc.isGoo() ? " Even better, they help you take on a more humanoid shape as your goo fills the pants out.":""));
	output("\n\nFeeling confident now, you walk to the metal door, and it slides open with a <i>thunk</i> at your proximity. You peer out meekly into the hallway, the faint hum of inner circuitry and distant machinery vibrating the corridor. You’re on a ship? You see a couple figures trotting down the passages in the distance.");
	output("\n\nYou try to speak or call out, and no words come to your mouth. A firm hand claps on your shoulder.");
	output("\n\n<i>“Up already?”</i> a bubbly, rich voice asks as you’re ushered back in. <i>“You were so tired last night, let’s see...”</i>");
	output("\n\nThe woman, dressed in a familiar black zipsuit forces you back to the bunk you slept in and runs her grey paws over your cheeks. Words get waylaid en route to your [pc.lipsChaste], exiting as exasperated pants. <i>“Still can’t talk, huh? That’ll pass, too. Hopefully today!”</i>");
	output("\n\nWhen you look over her cute face and into her violet eyes you relax almost immediately, feeling a strong urge to reach out to her. She seems so familiar...");
	output("\n\n" + (pc.tailCount > 0 && pc.hasTailFlag(GLOBAL.FLAG_LONG) ? "[pc.Tails] wagging, Y":"y") + "ou wrap your [pc.arms] around her waist and hug her, burying your head into her plush chest, her rubbery suit squeaking against your [pc.skinFurScalesNoun]. Seemingly surprised, the bunny just giggles and pets your head. Her tender affections allow feelings of being protected and loved to ripple through you. After that awful nightmare, you can’t help but think of her as a guardian angel sent to comfort you.");
	output("\n\n<i>“Well, come on, I’ve got stuff to do around here and I’d hate for you to be sitting here all alone.”</i> She smiles cutely.");
	processTime(60*24);
	clearMenu();
	addButton(0,"Next",waitToBeAHorseJumperSlut3);
}

public function waitToBeAHorseJumperSlut3():void
{
	clearOutput();
	showBoredJumper(true);
	author("William");
	output("Ushered on by the lop-eared woman, someone you can’t bear the thought of being far from for more than a second, you walk close to her as she makes her rounds on the ship. The other members of the crew, each a big-eared laquine share the same uniform spelling ‘jumper’ on the thigh. Some of the hornier among them try to take you away from her, but she shoves the few who dare to try.");
	output("\n\n<i>“Spoilsport! You win one bet and you think that puts you above us!”</i> Comes a clamor, but your [pc.ears] are nearly deaf to that bickering. You dutifully follow your [enemy.furColor]-furred lover. Her next stop is Storage & Armory, according to the light above the sliding double-door.");
	output("\n\nYou walk into the spacious but oddly empty room. She bounds around the tables, a variety of weapons and items lined up on them. You quietly look around, seeing the gear the laquines use, and to the familiar equipment on the big table. Some things you think you recognize, like the [pc.rangedWeapon] and [pc.meleeWeapon]. Shrugging your shoulders, you hurriedly return to the bouncy bunny’s side, content just to be near her.");
	output("\n\nAfter leaving the room, your [pc.ears] catch faint conversations. Some of the other crew talk about their successful job, some brag about the ‘unaffiliated ship’ they robbed back on some station" + (crew(true) > 0 ? ", and the money they made off the heads aboard.":"") + " A few barbed strings tighten around your heart hearing that, for some reason.");
	output("\n\nEventually, you both find yourself on the bridge of the ship. The laquine gives an odd salute to the captain, but nobody regards you with much interest as they banter back and forth on matters unimportant to you. It makes you feel worried just being here, it’s clearly an important place. You walk down the ramp to the panels and other sensitive electronics that manage the ship and all its functions, a giant window giving sight to the infinite space beyond. A few other ships sit idle out there in an asteroid field, but nothing seems to be going on. At the nadir of the CIC, you watch as your careful sweetheart has a few routine conversations with everyone else here.");
	output("\n\nThe captain bellows from her chair a series of orders with such volume that you shrink back into the hand that’s guiding you out of the room now.");
	output("\n\nThe long minutes turn to longer hours. The monotonous patrol your leading laquine is assigned ends, and she takes you back to the room you woke up in, still empty of the rest of its occupants. You make out a low, worrying moan from her as she sits down on her bed. <i>“Finally. I miss the mines.”</i> Her voice is clear and jovial. <i>“Was easier to sneak off for rest but now I’m back on this boat and I can’t have any time to myself when I feel like it!”</i>");
	output("\n\n<i>“At least I’m not alone.”</i> She stares at you with a mix of lust and infatuation, puffing her chest out as she gets undressed. You watch the zipper descend over her chest, both mouthwatering mammaries popping free of her suit moistened with sweat. The second her odor reaches you, you begin to drool and your knees disappear out from under you. You smile happily just nestling between her powerful legs, staring up at her as her swelling bulge is on the verge of bursting through the seal of her suit.");
	output("\n\nJust below her cleavage, the flat head of her [enemy.cock] is already poking out, watery pre moistening her crown before sliding down her [enemy.cockType] length. <i>“And this is why I’m happy you’re here, we can do this every night. You’ll enjoy that, right?”</i>");
	output("\n\n<i>“Y-yes!”</i> You finally form a word. The realization makes you blush " + (pc.tailCount > 0 && pc.hasTailFlag(GLOBAL.FLAG_LONG) ? "and wag your [pc.tails] ":"") + "furiously. [pc.Eyes] blinking and curving seductively, you say nothing more as you dive into her musky crotch, helping free her plump balls from confinement. Your nose is already buried between her heavy nuts. Her deepest scent excites you more and more, readying your body and mind to service her. You kiss each seed-swollen teste, savoring the sheer weight of her fuzzy spheres as your tongue feathers their delectable diameters. She must not have cum for a long time!");
	output("\n\nYou travel up her meaty length, lapping at the drops of sweat and precum flowing from her [enemy.cockHead]. Your mind is overwhelmed by so many warm, tingly feelings - her every cute moan, every twitch in her delicious [enemy.cockNounSimple], every heartbeat you feel through your mouth around its flared tip... This is your place. Sucking and bobbing on her dick is the reward you receive, and will always receive, for staying with her whenever and wherever she goes. The taste, the feeling of her being in you feels so familiar, so <i>correct</i>, like this is what you were born to do.");
	output("\n\nYour energetic efforts don’t go unrewarded. The laquine’s delicate paw rubs your head{, scratching at your animal ears}, pulling you further down her equine hermhood. Like an elastic material, your throat stretches easily, coaxing her delicious dick all the way in until it bulges obscenely against your neck. You don’t even come close to choking! You moan and salivate all over it, a content smile on the edges of your lips.");
	output("\n\nHer grip tightens, and she cries out <i>“Cumming!”</i>. You’re ready for this: your [pc.hands] sink into her thighs and your knees plant. You groan throatily as torrential waves of cum surge through her dick and shoot into your gut. With your mouth firmly around the base of her bestial cock, you can feel your belly bloat from her hyper output. Feeling her orgasm ending, not a drop spilled, you wash her thick tool with your [pc.tongue] as she pulls out.");
	output("\n\n<i>“Ahhh...”</i> She moans and leans back. <i>“Waiting for you to get better made that soooo worth it!”</i> She beams at you. <i>“Now, we don’t have a lot of time before everyone <i>else</i>”</i> she rolls her eyes <i>“starts piling back in. So let’s get to bed. I’ve got plenty of time tomorrow to show you just how grateful I am!”</i>");
	output("\n\nSwallowing the last of her cum, you wait for her to peel off her uniform and stuff it on the other side of the bed against the bulkhead. You disrobe quickly and crawl under the sheets with her as others return and do the same, settling in for curfew. You can feel the ship rattle smoothly like you’re riding on a wave, the shifting colors outside a small window creating a little rave in the room that a few other bunnies grouse about. The growling thrusters propelling the ship are a bit loud, but they don’t make the prospect of sleep a difficult one.");
	output("\n\nEspecially not with this lovely laquine who holds you close to her. For as long as her eyes are open, yours are locked almost unblinking to them. You enjoy a tender pillow talk as she casually caresses and gropes your body. You snuggle against her neck as your last few seconds awake pass in reverence for her. She looks deeply in your eyes, and her quiet voice surrounds you.");
	output("\n\nWherever those pernicious thoughts and pains came from earlier, they are now as distant as the field of stars you once traversed in search of your father’s legacy.");
	output("\n\nAnd you feel it’s worth it, just to kiss her goodnight. Now, and forever onward.");
	badEnd();
}

// Bad End 2 (jumperDog - Gang’s Pet)
// PC is taken as a fuck toy by a particularly dommy rabbit and used by the entire gang.
public function jumperDogGangsPet():void
{
	clearOutput();
	showBoredJumper(true);
	author("William");
	output("You can’t see anything, wherever you’ve awoken. You can hear electrical hums and distant bangs and drills against rock. Heavy footsteps thump all around you, but nothing is <i>here</i>. Your [pc.feet] dangle above the ground. " + (pc.isTaur() ? "You don’t see your tauric half either, and your body feels dry. It explains the stings you felt even in your unconscious state. ":"") + "You’re suspended by your wrists, hanging from the ceiling with your [pc.arms] stretched to the border of tearing." + (pc.isGoo() ? " Your restraints hold tight even against your slimy limbs.":"") + " Now, all you feel is crippling need, being oppressed by the suffocating temperature of this cramped, inky black chamber. Here, it smells too much like the rutting rabbits whose very presence ignites your ravenous side.");
	output("\n\nA bar of light flickers on the floor. Light in another room? The door swings open, dusty air billowing with the shift in wind. A lop-eared figure enters, a hand on her squeaky waist and the other scratching the back of her head. She stretches idly against the light, nothing but a shadow in your position. <i>“Heya, awake yet? Seems like it. We’ve got work to do!”</i>");
	output("\n\nHer sticky feet clap against the crummy floor beneath, louder and louder until a rough, gloved hand is on your [pc.face]. You can only see the moistness of her [enemy.eyeColor] eyes, and the silhouettes of her whiskers against the sun-bright room behind her. <i>“You’re gonna be busy today, slave. Everyone’s on the job, so I hope you’ve got it in you.”</i> She smirks, her voice light and airy. <i>“Maybe I’ll even give you a treat at the end.”</i>");
	output("\n\nHer words drag across your [pc.skinFurScales] like a barbed chain. For better or worse, you haven’t had your memory wiped, but on the other hand... her smell...");
	output("\n\nYour eyes squint when she raises her arms over your head and undoes your bindings, her odor hitting the submissive buttons emblazoned in your brain by their repeated dominance of you. You fall to the ground like a rock, breathing with the strength of one. While you suck for air, a long, black line slithers to the ground, the cable coiling into a neat pile near you. Tiny metal clinks and clicks alert you to a troubling predicament above. You feel a foot plant on your chest and shove you back, the laquine jumper falling on you like a predatory animal.");
	output("\n\n<i>“I managed to get this from the overseer.”</i> She displays a fanciful collar to you. <i>“This is juuust for you. Once it’s on, it’s never coming off!”</i> Leather on the outside with strips of metal in the center, she unclasps it and zeroes in on your neck. Unable to push her back, it locks around your throat with ease, and worse, seems to tighten of its own accord.");
	output("\n\nWhen you pull on it, you feel a circular pinch of metal all around your throat. When you gasp, it tightens just a bit more like some horrific ouroboros squeezing the life out of you. It lightens automatically sensing obvious distress, and settles into a narrow width that hardly allows one finger through. Grinning, the laquine pirate then pulls out a vial from her pouch and sticks you with it. The rush of chemical arousal on top of her intoxicating pheromones destroys your sense of being in mere seconds, turning you into her perfect, salivating slave-pet.");
	output("\n\nThe slave driving rabbit stands and yanks on the leash, pulling you onto all fours. <i>“You’ll have to get used to things around here until... whatever the hell the bosses want done. But you’ll make the wait so... much... better....”</i> she moans while squeezing her bulge.");
	output("\n\n<i>“Time for you to get to work!”</i> she cheerily declares, pulling on you like a resistant puppy.");
	processTime(30);
	clearMenu();
	addButton(0,"Next",jumperDogGangsPet2);
}

public function jumperDogGangsPet2():void
{
	clearOutput();
	showBoredJumper(true);
	author("William");
	output("You’ve been here before, and you’ve always hit the floor. Your [pc.tongue] is like a melting candle, hanging limp with saliva pouring like syrup on breakfast. All you can think about is cock. Laquine cock. You want hers, but you’d settle for any of the others. The greatness of your need has disabled your ability to feel pain in your hands and knees. The discomforting warmth of the mines has the same effect on you as it does its roving rabbits. Perspirant pools and plummets from the tip of your nose, sizzling against the crags underfoot.");
	output("\n\nBut the worst feelings are tremors in your [pc.legOrLegs]. The quakes magnify the more you think about one of these horny bunnies fucking you like one. You <i>need</i> their taste on your tongue, you can’t imagine surviving without it any longer. But she’s not keen on giving you what you want. Not by a long shot. Every heinous pheromone wafting off her strangles the life out of every rational cell in your brain before moving in, settling down, and breeding more of themselves.");
	output("\n\nIn the Zheng Shi hangar, the cooler air outlines goosebumps on your [pc.skinFurScales], provoking a shuddering groan from you. Your fingers curl and clench when you see a distant conflict near what was once your ship. A bunch of tall and small figures are crawling all over the hull of your vessel, marching in empty-handed and out with whatever loot they could grab. Backbiting arguments flare up all too often." + (crew(true) > 0 ? " A procession line of figures you can’t make out are led deeper into the facility or on to other ships. Restraints, however, are made obvious by dangling links between unwilling hands and feet.":""));
	output("\n\nIf not for your shattered coherency, it might have brought you to tears, but you can’t dig out such emotions. Especially not with your nonchalant owner pulling you along into the mines.");
	processTime(500);
	clearMenu();
	addButton(0,"Next",jumperDogGangsPet3);
}

public function jumperDogGangsPet3():void
{
	clearOutput();
	showBoredJumper(true);
	author("William");
	output("Your day is filled with the sex your body craves. Behind the slaves, handcuffed for pleasure, against the walls, and even <i>with</i> a few slaves, you are used by the pirates who keep the wealth and cum flowing in equal amounts. Your new mistress makes sure everyone gets a ride on the bike that is you, the exclusive bottom bitch of the top gang on Zheng Shi. Onwards you crawl through the warrens, the sounds of forced labor and wanton indulgence fast becoming the only things you’re going to hear for the rest of your life.");
	output("\n\nAs for what you feel... <i>indescribable bliss</i>. You passionately service every rutting rabbit that comes near who deigns to unzip her rank suit, recharging your libidinous brain through odor alone. The musky stench of your captors is no different than an invigorating wave of warmth that washes over you, always keeping you ready to take a menagerie of cocks. Horse cock, human cock, cat cock, dog cock... The latter would be <i>much</i> better if they could knot you, but you’ve got so many places to be!" + (pc.hasVagina() ? " Your owner makes sure your [pc.pussy] is left alone, curiously enough!":""));
	output("\n\nYou’re always easy to find. If not your scent, it’s the cum leaking from your [pc.asshole] and [pc.lips], a trail of treats for any hungry, bored criminal to track straight to a pliant slave to pass the time with under supervision. You squeal with delight as your belly grows and shrinks over the uncountable hours, slowly turning into what you’re displayed as: a pleasant, fuckable pet, whose individuality is eroded over the regular application of mind-altering chemicals. Whatever was left of ‘you’ faded away watching your livelihood be plundered in the hangar.");
	output("\n\nYour mistress’ day comes to an end, and you’re tugged back to the cramped living quarters. Heckled by the officers and mooks who’ve taken up here tonight, other laquines and weirder figures sneer and jeer at your passing. Whatever, they’re just jealous of your owner! You’re pulled into the cramped room again, panting like mad. The leash falls to the ground near you as the moaning laquine grumbles and stretches. She flops to her bubbly butt against the wall, the stresses of the day falling off her like an unclasped cloak.");
	output("\n\nSeeing her obvious need, you move your wriggling, spunk-stained form closer to her. You’ve been waiting for her all day, and now she’s all alone with you. She’s got the perfect opportunity to reward you for doing such a good job, she hadn’t used you but once today! The huge bulge in her crotch is threatening to burst through the latex itself. It looks like it could damage the zipper irreparably! You coo and moan watching her come undone, luxuriating in her steam. Your eyes widen in unfettered glee as the [enemy.cockHead] of her foot long [enemy.cockNounSimple] lunges out. You lick your [pc.lips] seeing her moist, fuzzy sack swell out at the bottom, [pc.eyes] firmly locked on her dick.");
	output("\n\nShe extends her hand out to you, saying, <i>“Come heeere!”</i>");
	output("\n\nMotioning you forward, the laquine spins you around and sits your [pc.ass] on her bouncy lap, barely containing herself from fucking you into the floor. Her [enemy.cock] nestles between your cheeks, spurting pre all over your back");
	if(pc.hasTail()) output(" and your [pc.tails]");
	output(" while she hotdogs you.");

	// PC has no vagina
	if(!pc.hasVagina()) 
	{
		output("\n\nHer penetration into your well-stretched anus is unannounced and undeniably pleasurable. Your screams undoubtedly reach the rest of the pirates in the connecting rooms, hopefully bothering them, hopefully letting them know that they can’t have what you have now: A hot rabbit who thrusts into your [pc.asshole] balls deep. With reckless abandon, she grinds her knot against your messy butt, threatening to ram the huge swell inside.");
		pc.buttChange(enemy.cockVolume(0));
	}
	// PC has vagina
	else
	{
		output("\n\nYou feel the tip of her [enemy.cockNounSimple] rub against your [pc.pussy], slick with femjuice and enshrouded by an irradiating warmth that beckons her in. Her penetration into your drooling cunt is unannounced and unspeakably satisfying. You’re sure your screams are reaching the pirates in the other rooms, hopefully bothering them, hopefully letting them know that they can’t have what you have now: A hot rabbit who thrusts into your cunt balls deep. She pokes at the entrance to your womb in one powerful thrust, and many times more after that.");
		pc.cuntChange(0,enemy.cockVolume(0));
	}
	// Merge
	output("\n\nBut the pirate carries on just a little longer, groping aimlessly on your body to see what makes you scream louder. Your muscles spasm and constrict all around her invading bitch-breaker, fast bringing her close to an orgasm that she’s been saving just for you. You whine for her to cum inside you, to give you the taste that <i>you</i> have been waiting all day for. She responds by wrapping her arms around your abdomen and pulling you down so hard that her fleshy knot pops in.");
	output("\n\nThe forceful spread shocks every working receptor left in your body, and you " + (pc.hasVagina() ? "slather her cock with a fresh load of [pc.girlCum]":"squeeze her dick almost painfully.") + " At the same time, her full balls churn out your reward for the day. Jets of white hot laquine spunk ram into your " + (pc.hasVagina() ? "womb":"colon") + " and fill out your " + (pc.hasVagina() ? "drizzling muff":"sloppy bum") + ". Each ejaculation sparks a backblast that is kept in place by her buried knot and your clenching body, making sure her seed stays where it belongs. Yet, with every seismic tremble, your whole body seizes in the abrupt pleasure it brings.");
	output("\n\nAs you sink back into the bunny domme, your eyes shut hard hearing her whisper into your [pc.ear]. Whatever she says makes you happy, and what else matters besides that?");
	output("\n\nYour final seconds awake pass in euphoria, snuggled up with your new owner. You declare your love for her, your loyalty, your obedience, that you are nothing but a valuable slave, and she quietly giggles to you. She lets you in on a few raunchy details, giving you a few exciting hints of your days to come as the premiere pleasure slave on Zheng Shi.");
	output("\n\nBefore you slip into unconsciousness again, a laugh escapes your lips. You don’t quite know why you’re laughing. But as that expelled air drifts off to nothingness, so too does the last thought of your old life, now as distant as the field of stars you once traversed in search of your father’s legacy.");
	output("\n\nAnd so, you drift off into a gentle, perpetual pleasure...");
	processTime(300);
	badEnd();
}

// Bad End 3 (jumperCat - Property)
// PC is used as a regular slave, a choice fuck toy, and is sold at the end of usefulness.
public function badEndToCatJumpey():void
{
	clearOutput();
	showBoredJumper(true);
	author("William");
	output("You wake up among a crowd of uniformed men and women of varying descents. They’re all dressed in orange and dark blue suits, and as you look into their sullen or lustful eyes, you only see the misery of their lot in life etched in the creases and wrinkles on their smooth or furry cheeks. None say a word as they shuffle irritably around the confines of this terrible pen.");
	if(flags["MAIKE_SLAVES_RELEASED"] == 1 || flags["MAIKE_SLAVES_RELEASED"] == 2) output(" It seems they’ve all been rounded up again, you included, in spite of your chivalrous act. Security certainly looks stronger...");
	output("\n\nYou hurriedly look over yourself - you’re completely naked, but... covered in cum? From the smell of it, it’s jumper’s jism.");
	pc.applyCumSoaked();
	if(pc.isTaur()) output("\n\nAnd worse... you seem to have changed. Your tauric half has vanished, in its place only two regular legs are there for you to walk on. The realization makes you stumble to and fro as your brain struggles to correct itself.");
	output("\n\nYou scrape yourself off as best you can, but only succeed in smearing the nocuous scent into your " + (pc.isGoo() ? "body":" pores") + ". Shuddering, you wrap your arms around your [pc.skinFurScales] and push your way to the entrance of the pen. Closer to the somewhat lit gate, you then see something around your neck just below nasal peripheral. Terror stabs at you. Instinctively, you try to yank on the discolored metal ring clinging to your throat.");
	output("\n\nAn electric sizzle assaults your nervous system from the neck down, bringing you to your knees. Thinking you might even die, you nearly scream before the sundering pain ceases. Gasping in horror, the reality of your situation begins to settle in. You’re trapped, collared, and penned in with the cowed laborers, with nothing you recognize at hand.");
	output("\n\nHopelessness falls on you gently at first, like snowflakes in a tundra, but then crashes upon you like an avalanche. You pound at the door once, the sexual effluence on your body starting to activate the addiction you’ve become afflicted with. You have to get out... but you also can’t shake the need to get fucked. Is this the collar’s doing, or a drug’s?");
	output("\n\nThe imposing gate hisses loudly as the bar slides out of the way. Bolts unpin and steam flows between the widening gap between the doors. As the way opens, a voice comes over a loudspeaker.");
	output("\n\n<i>“The project resumes. Follow the project leads and do your part! Here on Zheng Shi station, we value efficiency and teamwork. Be safe, be industrious.”</i> The emotionless robotic voice echoes through the room.");
	output("\n\nAll of the slaves behind you line up, some tucking in their dicks or finishing a fuck in the corners. As the door finally jams open, a large gang of pirates - some jumpers, some others, - stand bored and idle on the other side, preening and stretching. Out of all of them, one approaches you in particular, thrusting a uniform into your hands. <i>“Get dressed,”</i> she orders, then winks. <i>“Cutie.”</i>");
	output("\n\nYou recognize her immediately as the one who put you in this situation. The mere thought of lashing out at her is met with a bone-scraping shock from the collar. With no other recourse, and with the hope that something might still change, you throw on the work outfit, grateful at least to no longer be exposed.");
	processTime(20);
	clearMenu();
	addButton(0,"Next",badEndToCatJumpey2);
}

public function badEndToCatJumpey2():void
{
	clearOutput();
	showBoredJumper(true);
	author("William");
	output("You and the others of your group are led down another featureless passage, recently dug by the random conversations you eavesdrop on. The jumpers around you boast about the haul from an ‘unaffiliated ship’ in the hangar" + (crew(true) > 0 ? ", and the potential amount of money they’ll make off the crew among other lurid details that crush your heart...":""));
	output("\n\nYou’re made to line up at the wall, shining with ores and minerals. You’re given a pickaxe and a chain is hooked to your back, anchoring you to the ceiling. You’re not going to go far if, for some reason, you decided to shirk your indentured servitude - the snake-like figures make sure of that.");
	output("\n\nYou feel a slap at the back of your head. <i>“You only get the orientation once, cutie.”</i> A familiar voice, simultaneously cute and firm, speaks behind you. <i>“You’ll get us our gems, and you’ll get a meal and shower at the end of the day. But for you...”</i>");
	output("\n\nYou feel a hand on your [pc.ass] and another slither under your arm, groping at your [pc.chest]. A big, warm figure squeezes into you, groping you like you’re a brothel whore. <i>“You and I will get to have some fun before bed, every day. Work hard, and you’ll ‘eat’ a little more than the others. Oh, and <i>you</i> don’t get a shower...”</i>");
	output("\n\nA soul-scorching giggle reverberates through your delicate [pc.ear]. Is this your fate? To be used as slave labor and fucked like a toy..? It’s gut wrenching. The loss of your freedom and individuality, your self-esteem" + (crew(true) > 0 ? ", and the fate of your friends":"") + "... And you can’t get her out of your head. Unfortunately, the sweat doesn’t wash you clean. Instead, it mingles with the dry spunk glazed over your [pc.skinFurScales] and goes airborne. Before you’ve even begun, you’re victim to an obdurate morass of laquine spunk.");
	output("\n\nYour first trembling swings are limp wristed. The cold thoughts of imprisonment, of being nothing but [pc.aRace] toy for a pirate, just being part of the stock, make you shiver worse than the ubiquitous thought of being fucked by another laquine. You can’t help the tears forming in your [pc.eyes] just thinking about what you’ve lost, too. It scares you to think of this becoming a routine, of this getting easier and easier to do. On the frontier, there’s no hope of the U.G.C. stumbling upon your predicament. If there was...");
	output("\n\nYou hardly move in the hours that pass. You and the other slaves pool your gains in a metal cart. The gleam of wealth, even in the dim light, begins to blind you whenever you look back over to it, what with your eyes having adjusted only to the dim. You’re baking in your own sweat, too. Your arms and shoulders beg for rest in light of the unceasing work you’ve put into the walls, and your [pc.legOrLegs] burn" + (pc.legCount == 1 ? "s":"") + " worse than what the collar put you through before.");
	output("\n\nBut you know what will happen if you falter. You can hear the screams in the distance, the pained yells, and sometimes pleasured yips. Jumpers that pass by you on guard also steal gropes at your body, threatening to fuck you silly if you don’t work harder, and when you fail to work after that, to fuck you even harder before letting the other slaves go to work on you. But their ultimate reactions are all the same: they sniffle in disgust, knowing you’re claimed by the layer of crusted cum on your [pc.skinFurScalesNoun].");
	output("\n\nTheir ideas seem much more appealing than another minute of this. Their pheromones excite you even now, making you yearn unnaturally." + (pc.hasGenitals() ? " Your [pc.crotch] " + (pc.cockTotal() + pc.totalVaginas() + pc.balls <= 1 ? "is":"are") + " sore with fevered need.":" Your body begs to be used, your mouth waters thinking about the laquine’s cock again..."));
	processTime(30);
	clearMenu();
	addButton(0,"Next",badEndToCatJumpey3);
}

public function badEndToCatJumpey3():void
{
	clearOutput();
	showBoredJumper(true);
	author("William");
	output("You can’t swing anymore, but a sensory echo that you can’t make out in your exhaustion gives you hope. The rest of the group all drop their tools and wait for the ceiling restraint to be undone. When you feel the chain drop, you dare to sigh in relief, but are immediately on edge when the familiar jumper comes by again, gazing at you knowingly and hungrily. The group is led off, but you are kept at the back. A black gloved hand grips your shoulder and yanks you toward a wall. The same rapacious hand wanders assertively over you with aimless lust.");
	output("\n\n<i>“Didn’t think I’d be this horny holding it back for so long, but you... You’re fuckin’ hot for being a labor slave, you know that? At first I didn’t really care about the bet, but seeing you work up a sweat, I don’t think you understand how hard it was not to fuck your brains out on the spot!”</i> She husks, flipping you around. <i>“Or maybe it’s just because you’re some weird thrill seeker from the core, stumbling around the frontier and being a problem... And being an obstacle for us!”</i>");
	output("\n\nYou groan with her hand between your legs, ");
	if(pc.hasCock()) output("jerking [pc.eachCock]");
	else if(pc.hasVagina()) output("forcefully rubbing [pc.eachVagina]");
	else output("searching for your [pc.asshole]");
	output(" through the thick fabric. <i>“Being able to put you in your place was fun, and, mmm...”</i> She presses her whole body into you, grinding boob and bulge into your [pc.skinFurScales]. Your eyes dim against her wet uniform, rubbing pheromones and musk into your ");
	if(pc.hasFur()) output("spongy fur");
	else if(pc.skinType != GLOBAL.SKIN_TYPE_GOO) output("damp skin");
	else output("gooey form");
	output(". You can feel the crotch of her suit distending, her cock starting to hump between your [pc.thighs]. For as sore and tired as you are, you can’t deny this is getting you turned on. Working all day in your condition only got you ready for this frisky futa.");
	output("\n\n<i>“And that smell... mmmffff...”</i> She inhales sharply, licking your [pc.face]. <i>“Even when I wasn’t around I could smell you from anywhere. I could almost <i>taste</i> the way I left you... And your own stink was getting me so wild I almost came in my suit!”</i>");
	output("\n\nShe pulls back and just about rips her zipper off, exposing her gorgeous body - and oozing cock - to you. The soft ‘barbs’ up and down her girth bristle with every lazy motion. It bobs up and down almost hypnotically, begging to be touched and sucked. Unable to hold yourself back, you allow yourself to fall to your knees, lip to [enemy.cockHead]. Watery pre and a day’s worth of pungent sweat drip down her cock, making it look like a poorly licked lollipop.");
	output("\n\n<i>“You’ll only be tasting <i>my</i> cock from now on, slave. I’ve heard you’re really good at it! Don’t disappoint me now, work-slut,”</i> she sings.");
	output("\n\nShe " + (pc.hasHair() && pc.hairLength >= 3 ? "grabs the thickest locks of your [pc.hair]":"grabs the side of your head") + " and forces the [enemy.cockHead] past your [pc.lipsChaste]. ");
	if(pc.libido() <= 33) output("You barely catch your breath before she invades your throat.");
	else if(pc.libido() <= 66) output("You stick your tongue out just before she thrusts in.");
	else output("You open wide and give yourself over to her, hopeful that she’ll return the favor.");
	output(" The [enemy.furColor]-furred laquine doesn’t wait for you to adjust, she glides over your [pc.tongue] and into your throat until her balls caress your chin. You catch a whiff of her sopping belly and groan loudly all around her pulsing dick.");
	output("\n\nShe coos when you reach your hands up to her thumping thighs to hold on, trying to position yourself more comfortably. Surprisingly, she begins to show a little mercy while she deepthroats you, her pace transitioning from jagged to smooth. The fleshy spines on her morphed cock massage your [pc.lips] with every pump while bubbling, salty pre paints your throat and stomach white.");
	if(pc.biggestTitSize() >= 1) output(" As she pistons, she keeps a rough hand on one of your tits, rolling the [pc.nipple] between her fingers.");
	output(" This continues for only a minute longer, when she suddenly pulls out, leaving you feeling empty.");

	output("\n\nShe kneels down and spreads your legs forcefully, undoing the crotch covering of your uniform with practiced efficiency.");

	// PC has vagina
	if(pc.hasVagina()) output("\n\nThe slut bunny thrusts a whole row of fingers into your [pc.pussy]" + (pc.balls > 0 ? " just under your [pc.balls]":"") + ", their insertion aided by every fluid under the lamp. Your [pc.hands] join hers, rubbing at your warm muff" + (pc.hasCock() ? " and stretching [pc.cocksLight],":" and") + " thumbing at your [pc.clit] with a delirious look on your face. You lap at the lapine’s airborne sex drive, the taste of her dick still fresh on your [pc.tongue].");
	// PC no vagina
	else output("\n\nThe slut bunny presses into you like a coat, her engorged nipples prodding at your torso while both hands explore your [pc.ass]. She kneads your butt roughly before sliding her fingers into your [pc.asshole] - a trivial insertion thanks to all the lube on her fingers. In your delirium, you reach your [pc.hands] to her chest and pinch her nipples, provoking a moan from the pirate while she stretches your tailhole wider and wider.");
	// Merge
	output("\n\n<i>“Haa, damn... You’re a real slut at heart, huh?”</i> she crows. <i>“Don’t be so down! We’re gonna have some good sex every day if you keep this up. Just accept your place and I’ll take gooood care of you, you cute slave!”</i>");
	output("\n\nYou pant hard as your body shivers from orgasm. The jumper takes this as her cue, gripping your [pc.hips] and forcing you " + (pc.hasVagina() ? "up onto your feet, rubbing her [enemy.cockHead] against your [pc.pussy].":"into doggystyle position, already prodding against your [pc.asshole] with her [enemy.cockHead].") + " Slathered as she is, the slut-bun faces no resistance from your hole as she hilts you with ease.");
	if(pc.hasVagina()) pc.cuntChange(0,enemy.cockVolume(0));
	else pc.buttChange(enemy.cockVolume(0));
	output("\n\nFirst she claimed you as a prize, then she rightfully claimed your " + (pc.hasVagina() ? "pussy":"ass") + ". Your whole body quakes and thrums around her [enemy.cockType] rod even while she thrusts in defiance of your latest orgasm, refusing to let you catch your breath. You grip her " + (!pc.isTaur() ? "shoulders":"the rocks") + ", digging your nails in, finally losing the will to refrain from encouraging her. You begin to shout and beg for more, her stimmed up sex drive finally overtaking your mind until all you can comprehend is being a rippling fuck puppet gaped by " + Math.round(enemy.cocks[0].cLength()) + " inches of [enemy.cock].");
	output("\n\nSeconds turn to minutes of you basking in her lecherous exhortations, moaning under her obscene molestations, until your overworked body can take no more. You cum again with a hoarse yell as your " + (pc.hasVagina() ? "[pc.pussy]":"[pc.asshole]") + " clenches around its dribbling invader and greedily drinks all of the backed up laquine spooge spilling out of your abused body. The slow contractions of her emptying sack bring you to an exhausted stupor that does so very little to act as anodyne to your crushing situation." + (pc.hasCock() ? " In the aftermath, your knees slump and splash in a puddle of your own [pc.cum].":""));
	output("\n\nYou feel the laquine pull out of your body with a messy pop, sighing a deep, carnal sigh of incomparable satisfaction. <i>“Yeahhh... You’ll do. Now, let’s make sure the others don’t touch you...”</i>");
	output("\n\nShe pulls your head closer to her [enemy.cockHead], jerking herself off until a few loads of bunny batter splatter your face. You lap at what lands around your mouth to slake your stoked addiction while she leans closer and cums inside your suit, making sure to smear your [pc.skinFurScales] with jizz. Whatever you can drink you do, and the rest marks your body.");
	output("\n\n<i>“I’ll always be able to smell my way back to you, my pretty... little... <b>slave</b>...”</i>");
	output("\n\nShe giggles again while you’re pulled to your feet and marched down the passage back to your pen...");
	processTime(30);
	pc.applyCumSoaked();
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",badEndToCatJumpey4);
}

public function badEndToCatJumpey4():void
{
	clearOutput();
	showBoredJumper(true);
	author("William");
	output("The arduous days turn to bitter, torturous weeks. You aren’t told or given any indication of how much time has passed, but all your bewildered brain is aware of on the daily grind is that you are to do your job... and then service your [enemy.furColor]-furred mistress. You don’t go to sleep without the smell of oversexed jumper forcing lucid, smutty dreams on you. When you eat, when you rest, when you merely wait, there is no escaping the effect she has on you.");
	output("\n\nEven to this day, you aren’t sure if you like it, and that only gets you more turned on somehow.");
	output("\n\nYou’ve fallen in with the crowd, and you line up as is your given task. The gates to the pen open, but rather than be led like a chain gang to the mines, you’re faced with many new, unrecognizable, and perturbing figures. <i>Frightening figures</i>. Pirates you’ve never seen before, not part of Zheng Shi’s operations, are there, and many more armed for subdual tower behind them. A new voice comes over the raspy loudspeaker. <i>“Your work here’s over, rabble. You’re being moved on to greener pastures. Thanks for everything,”</i> the girlish voice snickers at the end before it clicks off with an ear-scraping whistle.");
	output("\n\nAll of the slaves before you are being rounded up in groups and caged, being taken elsewhere to continue their servitude. Staying in the back only delays the inevitable. The jumper who’s used you since the beginning comes to find you personally. She takes one last wistful whiff of you and shrugs her shoulders. <i>“I’m not interested in keeping you, cutie, I don’t need the baggage. But you’ll do fine wherever it is you’re going. I will miss your mouth, that’s for sure...”</i>");
	output("\n\nShe gives you a condescending pat on the head and trots off, her plump hips and floppy ears vanishing into the anarchic crowd. You don’t have time to even take all of this in before two bruisers approach you menacingly, crackling prods sizzling in their hands. They strike you on either shoulder and you fall instantly in a midden heap, already robbed of your senses.");
	output("\n\nBefore you completely black out, you hold on to one final thought: The memory of your old life. A memory that will soon be as distant as the field of stars you once traversed in search of your father’s legacy.");
	output("\n\nWherever you’re going, your new owners will see to it that you are thoroughly broken...");
	badEnd();
}

// <i>“Bad”</i> End 4 (jumperTerran - Gift)
// PC is given as a gift to the Jumper captain, and can become a useful member... with a special surprise
public function badEndToHumanJumper():void
{
	clearOutput();
	showBoredJumper(true);
	author("William");
	output("You stagger awake with a gasp. Surprisingly, you have a clear mind but not clear sight. Chill nips at your [pc.skinFurScales] as you look around to find two faint bars of light on the slits of a door. You hurry over and look out but can’t find any way to open it. You curse and pound at your prison, trying to digest your predicament.");
	output("\n\nA heavy rattling followed by an electronic <i>DING</i> signals the sliding of the door. You shield your [pc.eyes] from the bright glare, but adjust quick enough to see a laquine standing there with a hand on her hip. She twirls a pair of grav cuffs around her finger and says, <i>“Sorry cutie, procedure on board. Put ‘em on or you’re gonna have to stay here. And that’d make someone very mad.”</i>");
	output("\n\nYou catch the cuffs as they’re tossed at you, staring at them with trepidation. Her voice comes again, <i>“I could just march you through the ship but this’ll make things easier. Also, don’t try to run. I went through a lot of trouble and I’d rather you not get yourself killed.”</i> Swallowing slowly, you attach the cuffs to your wrists at the front and meet the pirate’s grin as she points you into the hall.");
	output("\n\nGroaning from the cool air, you’re led through the corridors of a ship, the circuits and machinery vibrating the floor under your [pc.feet]. Embarrassingly, you’re taken through a large break room and ogled by other horny rabbits at rest, but they, thankfully, keep it short. You’re brought into a lift - the laquine hits a button and your stomach sinks momentarily as you ride to the upper deck, labeled ‘Command’ on the flecked green panel.");
	output("\n\nThankfully, on this floor, it’s a little warmer. It makes you a little more aware of your laquine guide’s pheromonal sweat, though you, oddly, don’t feel very aroused considering past experiences...");
	output("\n\nThe jumper stops at one of the doors at the end of a hall, a strip reading ‘Captain’ on the panel next to it. Instead of typing in anything, she bangs on it four times with her [enemy.furColor] paw. Just like that, it opens, and she has you walk in first. There’s a heady perfume-like smell to the room, some cheap brand or, perhaps, an expensive one that only smells good because it was priced higher than everything else. It’s a rather cozy room, all told. Insignias and emblems of the jumpers are positioned around the room and a large flag hangs behind a desk and chair where a tall, rabbit-eared woman is sitting.");
	output("\n\nThat is a pretty neat flag though, crossbones under a skull with rabbit ears...");
	output("\n\nThe woman looks up to you under the brim of a wide hat with a stern look in her dark eyes. She’s dressed a little ostentatiously, not something someone could get away with lest they were in charge of a large ship and crew. Both of her tawny ears flick, she glowers at you with stoic authority. Shutting the book she was reading, she brushes her side plait hair as she stands.");
	output("\n\n<i>“[pc.name] Steele.”</i> She rasps, clearing her throat. <i>“The sire of a shitheel company traipsing around frontier space for whatever inane reason.”</i> She raises her hand, <i>“Don’t tell me why. I don’t care, and it doesn’t matter. That’s not why you’re here in front of me.”</i>");

	// PC Bimbo
	if(pc.isBimbo()) output("\n\n<i>“Then why ooohhh why am I here? To get a taste of the captain’s log?”</i> You lick your [pc.lips] seductively.");
	// PC Bro
	else if(pc.isBro()) output("\n\n<i>“If that’s not why I’m here, clearly it’s for a good time, right?”</i> You grin like a fool, enjoying the annoyed expression on her face.");
	// PC Kind
	else if(pc.isNice()) output("\n\n<i>“Whatever the case, I don’t suppose it involves giving me a chance to leave?”</i> You ask tacitly.");
	// PC Misch
	else if(pc.isMischievous()) output("\n\n<i>“If it doesn’t matter, then why <i>am</i> I here?”</i> You scowl, tapping your foot petulantly at the pirate.");
	else output("\n\n<i>“Then you should shoot me now.”</i> You growl at her.");
	// Merge
	output("\n\nThe woman walks out from behind her desk and approaches you with a menacing march-like walk, her pert chest jiggling under her light raiments. Her voice is a low, husky bellow almost. <i>“You are here because of an infantile bet that your presence caused in my crew. My subordinate, who incidentally won that insipid wager, decided that her prize - <i>you</i> - should be <i>my</i> prize. With that in mind, I looked up exactly who you were.”</i>");

	// PC Mercenary
	if(pc.characterClass == GLOBAL.CLASS_MERCENARY) output("\n\nShe looks over you with a discerning stare. <i>“You were trained as a soldier. Curiously, I learned that you were and still are a skilled mercenary. At least, that’s what the records I could find state. I like that in a person.”</i>");
	// PC Smuggler
	else if(pc.characterClass == GLOBAL.CLASS_SMUGGLER) output("\n\nShe looks over you with a strangely respectful nod. <i>“You were a smuggler in your youth as I understand it. I was able to get in touch with one of your old contacts. According to them, you’re an elusive, wily person. Not unlike us. But not a match for us, apparently.”</i>");
	// PC Tech Specialist
	else output("\n\nShe eyes you with a thoughtful grin. <i>“You are a talented specialist, I’ve learned. Graduated top of an illustrious academy, learning a lot about engineering, hardware, software... Things useful to know when working on a ship. As I understand it, you’re very reliable.”</i>");
	// Merge

	if(pc.isBimbo() || pc.isBro()) output("\n\n<i>“I <i>can</i> be very reliable in other ways, too...”</i> you murmur.");
	else if(pc.isNice()) output("\n\n<i>“Get to the point, please,”</i> you shake your head.");
	else if(pc.isMischievous()) output("\n\n<i>“Beating around the bush, huh?”</i> you grin.");
	else output("\n\n<i>“What is the point of this questioning?”</i> You ask curtly.");

	output("\n\n<i>“Look at this,”</i> she barks, pointing you towards a screen on the left side of the room before hitting a button on the remote.");
	output("\n\nA video feed blinks to life on the flat screen, showing your ship still in Zheng Shi hangar, and surrounded by the station’s inhabitants. " + (crew(true) > 0 ? "Another video feed pops up picture-in-picture style, showing " + (crew(true) == 1 ? "your crewmate":"members of your crew") + " being held up. The sight of it makes you jump, but the grav cuffs lighten your frame ever so slightly...":""));
	output("\n\n<i>“I’m going to make you an offer. Because my subordinate decided that you are now my responsibility - and while I appreciate the gesture nonetheless,”</i> she winks with a light smile on her dry lips at the rabbit behind you, <i>“this is my ultimatum: Your old life is gone, kid. Whatever brought you out here, you can forget about it" + (crew(true) > 0 ? ", and you can forget about your crew":"") + ".”</i>");
	output("\n\nShe folds her arms and stares at you pointedly, her large eyes penetrating your [pc.skinFurScales]. <i>“I give you a choice: You may join my crew and enjoy a position in my cabinet...”</i>");
	output("\n\nShe walks up to you and traces a small finger up your cheek. <i>“Or...”</i> she whispers, her subtly shifting facial features making your heart sink, <i>“you can take a nude walk out the airlock" + (crew(true) > 0 ? ", and I’ll leave your subordinate’s fate" + (crew(true) > 1 ? "s":"") + " to chance. If you join us, I’ll see to it they’re sent back to the safety of the core":"") + ".”</i>");
	output("\n\nYou gulp with slightly wide eyes. Such an offer can’t be that bad if it means you aren’t made some sex slave, right? At least you’ll still have your wits. If she can even be trusted... Then again, you do feel perfectly fit and fine to make this decision, the laquine aroma you’ve succumbed to before does nothing to you now.");
	if(crew(true) > 0) output("\n\nYour " + (crew(true) > 1 ? "friends lives hang":"friend’s life hangs") + " on this choice too...");
	processTime(30);
	clearMenu();
	addButton(0,"Join",joinDemJumpersSloot,undefined,"Join","Fall in with the pirate gang, and whatever illicit deeds that might entail...");
	addButton(1,"Don’t Join",keepYoDignity,undefined,"Don’t Join","Keep your dignity, no matter how lethal it is to you.");
}

//[Join]
// Tooltip: Fall in with the pirate gang, and whatever illicit deeds that might entail...
public function joinDemJumpersSloot():void
{
	clearOutput();
	showBoredJumper(true);
	author("William");
	output("You sigh in resignation, then meet the captain’s eyes. Your lips tremble at first, but you growl, <i>“Fine. I’ll join you.”</i>" + (crew(true) > 0 ? " Shaking your head, you just about yell it once more: <i>“I’ll join your crew, so don’t hurt mine!”</i>":""));
	output("\n\nOddly, the laquine captain seems to lighten up at your answer. She raises both eyebrows contemplatively then smiles invitingly. <i>“An intelligent decision. You were too useful to just kill off. Were you neither useful nor interesting, we would not have had this conversation at all.”</i>");
	output("\n\nWhile you attempt to come to terms with what you just agreed to, the video feed " + (crew(true) == 0 ? "flickers off":"shows your ship leaving and departing Zheng Shi station unharmed before flickering off") + ". You feel the cuffs unlocking from your hands and falling to the floor, scooped up by the laquine behind you. In their place a sleek uniform is given by the same victorious jumper.");
	// PC is goo
	if(pc.isGoo()) output("\n\n<i>“Hmm...”</i> The captain looks over your gelatinous form with some disappointment. <i>“Even though you’re a slimeball, you can still act the part.”</i> She puts a fake pair of bunny ears on your head with a barely contained smile, satisfied with just that.");
	// PC is any other race:
	else output("\n\n<i>“You will need to look the part of one of us. Don’t waste your time with those ear headbands, I don’t need you trying to fuck every one of us for a month straight. I’ll sort out your mod work in due time.”</i> The captain grins. <i>“Though, there will be plenty of <b>that</b> in due time as well...”</i> She pats her crotch with a blush...");
	// Merge
	output("\n\nYou close your eyes and steel yourself for whatever may come now...");
	processTime(30);
	clearMenu();
	addButton(0,"Next",joinDemJumpersSloot2);
}

public function joinDemJumpersSloot2():void
{
	clearOutput();
	showBoredJumper(true);
	author("William");
	output("Your acceptance into the Jumpers is greeted with suspicion, infatuation, and excitement in equal measure.");

	// If PC is neuter, they are given a vagina.
	if(!pc.hasGenitals())
	{
		output("\n\nTrue to her word, your new captain prepared a thorough mod treatment to change you into a laquine. The process was easy thanks to the advanced suite of microbots running through your veins. In less than a day, you became one of them: a lop-eared laquine dressed in the same, skin-tight uniform they all wear. It took some getting used to the fur, your new legs, and especially your equine genitals. You’ve inherited the insatiable laquine sex drive as well as their sultry work ethos.");
	}
	// Merge
	output("\n\nYou remain on Zheng Shi for a while, living and training with the other jumpers, and managing the slaves. It irks you at first, but you remind yourself that you could have been in their position... or even worse. You wander the mines and the halls like they do, working up an awful sweat that is frustrating to get used to when your spongy fur and suit bake you alive everywhere you go. But you manage, thanks to the help of the others. Curiously, you’re aided most by the one who brought you aboard in the first place.");
	output("\n\nThat sexy rabbit in particular always make sure to take care of your sexual frustrations when you need a good fuck, too...");
	output("\n\nOn the ship, you are given your own room on the upper decks, three doors from the captain’s quarters, and are allowed to roam freely. Despite their overactive behaviors, you make easy conversation and plenty of friends among the crew who each lead their own remarkably ‘normal’ lives. You decide it’s best to build bridges early, in case you ever get free of your illegal obligations. The captain is rarely seen, though you do catch sight of her bickering and fighting with the other VIPs aboard the station. Even now, you still have little idea of what their plan entails.");
	output("\n\nAs the weeks turn into months, you settle into a few distinct roles in the crew.");
	// PC Mercenary
	if(pc.characterClass == GLOBAL.CLASS_MERCENARY) output("\n\nYour skills as a soldier make you the drill instructor your captain always needed. Whilst the laquines are reactive and flexible, they aren’t the most well trained bunch in the galaxy. You put your experience and practice to the test, conjuring up your past strengths and teaching them the finer points of a hand-to-hand brawl, and how best to use their bodies when the going gets tough.");
	// PC Smuggler
	else if(pc.characterClass == GLOBAL.CLASS_SMUGGLER) output("\n\nEven among skilled thieves, you have a few tricks and secrets of your own to impart to the jumpers. You help them better understand the finer points of infiltration, teamwork, and special tactics when outnumbered. They each become more accurate, more aware, and far more effective under fire thanks to your charmed tutelage, though you’re not sure if that’s something to be proud of yet.");
	// PC Tech Specialist
	else output("\n\nYou become a valued quartermaster, assistant engineer, and are named a navigator, although the latter role is yet to be needed. You are given access to the armory and storage room where you maintain and modify the crew’s arsenal as needed. Other days, you work with the chief engineer and markedly improve the state of the ship, feeling a little pride getting the place cleaned up bit by bit.");
	// Merge
	output("\n\nDespite being a pirate yourself now, the work is smooth and rewarding. It’s a rhythmic routine that has slowly taken you out of your path as a business magnate in the making. Although you still pine for your old life, you aren’t unhappy with your position. You’re treated close to a first mate by the captain, and she watches out for you when others question your talents. Your friends ask you often about your old life, what you were like growing up, and even what your goal was. As you open up, they do too, and you feel an odd peace when you sympathize with them and why they chose their path.");
	output("\n\nBut all of this is besides one unique perk to being a jumper: the ship-wide orgies. When the monotony is too great to bear, when the dull ache of patrolling a run down station frays at the edges of the crew’s minds, you can relax in the best way possible by coming together. Quite literally. Your favorite nights are when the captain asks for your company. Each of those is a night to remember thanks to the hours of wanton sex, sex enabled by laquine biology.");
	output("\n\nThe jumper who brought you aboard often shares in the excess, and you each go at it in a variety of obscure and obscenely pleasurable ways, the three of you being filled to the breaking point well after curfew.");
	processTime(45);
	clearMenu();
	addButton(0,"Next",joinDemJumpersSloot3);
}

public function joinDemJumpersSloot3():void
{
	clearOutput();
	showBoredJumper(true);
	author("William");
	output("As operations on Zheng Shi come to a close, you’re often on patrol in proximity to the station. One day, a lone, intruding ship is picked up on sensor. Not part of the U.G.C, it’s a sizeable ship nonetheless. With orders to take it, the captain leads you into an ambush, launching you and others in a surprise boarding raid from around the asteroids. Their weapons don’t even have time to fire up before the other pirates set upon it like predators.");
	output("\n\nLeading your own team, you burst into this unidentified ship and easily subdue the personnel aboard. Heavily armed on the outside, but lightly armed inside, oddly enough. It’s a casual thrill the way you and the others shoot and hop through the corridors, destroying security systems and bringing down the security team with frightening efficiency. Your girls have learned well from you!");
	output("\n\nAided by your jump jets and hours of diligent exercise, the ship is soon quieted. One room yet remains. Locked tight, you set a breaching charge and blow your way into the captain’s quarters. A large, extravagant bed sits in one corner of this gaudy room, and the owner of the room, a blonde " + rival.mf("man","woman") + ", cowers in the center as " + rival.mf("he’s","she’s") + " surrounded by pirates.");
	output("\n\n[rival.HeShe] begs and screams for their life, calling out to whatever bodyguards might remain, before shifting to fatalist insults and warnings of what will happen to all of you for this. But something about this person eludes you... You kneel down to their face and finally recognize them. <i>It’s your cousin.</i> [rival.name] obviously doesn’t recognize the new you, and you’re not about to spoil the surprise.");
	output("\n\nYour captain enters the room. <i>“Good work. What have we here?”</i> She asks you, a wide grin cresting your fuzzy face. You step over to your cousin’s desk and collect [rival.hisHer] codex and quickly tap through the contacts list until you settle on a very specific name.");
	output("\n\nToggling the video record mode, you hold the codex up to your cousin. <i>“[rival.HeShe]’s valuable. Take [rival.himHer].”</i> You command, and immediately your cousin is hoisted up and dragged kicking and screaming out of the room. Satisfied, you save the clip and attach it to an e-mail message. Subject: <i>Long time, never see</i> The destination? Maximilian Steele.");
	output("\n\nAfter hitting send, you can’t help but enjoy a refreshing laugh. Promising to explain later, you fix your beret and head back to your ship.");
	output("\n\nYou didn’t think your old life would crop up again like that. It’s made your new path all the better. Now a respected member of the crew, you tell them of the wealth that only you and your cousin knew about, and how your gang could claim it.");
	output("\n\nAnd set off you do after the remaining probes, looking forward to claiming your father’s legacy unimpeded. Even if you fail to claim it in the exciting weeks to come, at least the only other person who could have snatched it is out of the picture.");
	output("\n\nAnd that, quite frankly, is good enough.");
	badEnd();
}

//[Don’t Join]
// Tooltip: Keep your dignity, no matter how lethal it is to you.
public function keepYoDignity():void
{
	clearOutput();
	showBoredJumper(true);
	author("William");
	output("<i>“No.”</i> You blurt to her. <i>“I won’t join up with a gang of pirates.”</i> The laquine captain cocks an eyebrow at you and scowls, perhaps not expecting that response at all.");
	output("\n\n<i>“You have no reason to resist. No Peacekeeper for light years gives shit about you. You <i>will</i> die if you pursue this foolishness." + (crew(true) > 0 ? " Do your friends not really matter that much to you? Will you really inflict more harm on them than your death?":"") + "”</i>");
	output("\n\nThe imposing captain taps her foot loudly and folds her arms. <i>“One more time, then, if you are set on this lunacy.”</i>");
	processTime(3);
	clearMenu();
	addButton(0,"Join",joinDemJumpersSloot,undefined,"Join","Fall in with the pirate gang, and whatever illicit deeds that might entail...");
	addButton(1,"No",noIWannaDie,undefined,"No","Your mind is made up.");
}

//[No]
// Tooltip: Your mind is made up.
public function noIWannaDie():void
{
	clearOutput();
	showBoredJumper(true);
	author("William");
	output("<i>“No.”</i> You say again, and close your [pc.eyes].");
	output("\n\nAn aggravated sigh follows your audacity. <i>“Contemptible child. The only one you spite is yourself. I thought you were smarter than this, and I thought you were useful to keep alive, but you don’t seem to grasp the situation. Fine.”</i> She barks at the laquine behind you, <i>“Be rid of [pc.himHer]. <b>Now.</b>”</i>");
	output("\n\nYou’re dragged from the room by the links in your cuffs. Soon, the pirate captain will make good on her word. As you’re pulled to one of the ship’s entry points, you exhale quietly and distract yourself with thoughts of your old task. Soon, your old life in search of your father’s legacy will be as distant a memory as you...");
	processTime(5);
	badEnd();
}

/*

output("\n\nAdd Beret Accessory");

output("\n\n// Full Name: Red Beret");
output("\n\n// Inventory Name: RedBeret");
output("\n\n// Accessory");
output("\n\n// Dropped by: Bored Jumper");
output("\n\n// Price: 2900 credits");
output("\n\n// Special Effect");
output("\n\n+8 Willpower, +5 Crit Chance");
output("\n\n// Tooltip:");
output("\n\nThis red beret, brimming with authority and smelling slightly of sex, belonged to a laquine pirate, and now it belongs to you. Not many people can rock a beret look, and while others may think you look more or less attractive, you’ll definitely feel like a seasoned professional wearing it.");

output("\n\n// Equipping");
output("\n\nYou fit the used beret to your head, feeling it sit firmly on your scalp. Grinning, you put your hands behind your back and then on your hips, trying to appear rough and tough. You think you look alright, holding your codex up to see yourself, but more than that, you feel <i>capable</i>; you feel more reactive and confident. It’s a powerfully distinct feeling...");
*/