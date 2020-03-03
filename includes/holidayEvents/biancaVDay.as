//Bianca V.Day Event
//By William

// Depending on the PC’s relationship with Bianca, one of two things will happen each V.Day, this is a repeatable event as many times as Valentine’s day rolls around.
// The PC must have had sex with Bianca at least three times for the event to proc. If the PC is not on fucking terms (read, past >51 Familiarity) then she will present a letter and some chocolates, then give the PC a chocolate covered blowjob - pussy included, of course.
// If the PC is past that, boning her in an alleyway will one day be possible.
// Option to let Bianca hump you with her ass instead, eating her out while pinned under the doctor’s moons.
// This event will not trigger if the PC does not meet her preferences. Must have a cock and/or pussy, and must not be monoped. Basically, if you can still have sexy times with her, it’ll fire.

//[Happy Valentine’s Day]
// Bianca will approach the PC at >49 Familiarity, and if the PC has sexed her five times; [Eat Her Out] must be unlocked, so set the Familiarity to that, whatever it is in the code.
// If the PC has not [Confront]’d Bianca (which is her xpac stuff, >51 familiarity), then the PC’s sex options are limited to oral, performing on her or getting it.
// I’ll write a sex scene in the future where Bianca bends over and lets you rail her for a third option.
// During the hours of 20:00-23:59, and the PC is on the same planet as her, and in Esbeth, Novahome, or the DMZ, (or Tavros, if biancaIsCrew=true), Bianca can randomly approach the player and wish them a happy Valentine’s day with a letter and some chocolates. You end up eating together and she also produces a small flask of fine wine, which you both share. Wine type determined by PC alignment. Bianca then offers to give you a blowie, or you can ask to eat her pussy. She’ll pin you to the wall with her ass though.


//+=====================+
//| FLAGS               |
//+---------------------+

//BIANCA_VDAY_YEAR: used to detect if the event happened this year
//BIANCA_VDAY_DECLINED: times declined
//BIANCA_VDAYS:	times happened

public function biancaIsCrew():Boolean { return false; }
public function biancaRecruited():Boolean { return false; }

public function biancaVDayHook():Boolean
{
	//VDay only!
	if(!isValentines()) return false;
	//No monopeds or neuts.
	if(pc.legCount == 1 || !pc.hasGenitals()) return false;
	//Cooldown.
	if(pc.hasStatusEffect("BiancaVDRejectCD")) return false;
	//Need "Eat Her Out Unlocked":
	if(flags["BIANCA_SEXED"] < 5 || biancaFamiliarity() < 49) return false;
	//Once a year only!
	if(flags["BIANCA_VDAY_YEAR"] != undefined && flags["BIANCA_VDAY_YEAR"] >= getRealtimeYear()) return false;
	//Crew Bianca needs you on tavros
	if(biancaIsCrew())
	{
		if(getPlanetName().toLowerCase() == "tavros station") 
		{
			biancaVDayStart();
			return true;
		}
		else return false;
	}
	else
	{
		if(biancaPlanet() == getPlanetName().toLowerCase())
		{
			biancaVDayStart();
			return true;
		}
		else return false;
	}
	return false;
}

public function showBiancaVDay(nude:Boolean = false):void
{
	if (biancaFamiliarity() < 10) showName("\nDOCTOR");
	else if (biancaFamiliarity() < 20) showName("\nDR. KETRIA");
	else showName("\nBIANCA");
	if(nude) showBust("BIANCA_NUDE");
	else if(biancaIsCrew()) showBust("BIANCA_WORK");
	else showBust("BIANCA_CASUAL");
	author("William");
}

//Proc only in town. Oh boi. :/
public function biancaVDayStart():void
{
	showName("\nGRABBED!");
	author("William");
	// Bianca non-Crew; Load the ‘bianca_casual’ bust for this sequence.
	if(!biancaIsCrew())
	{
		if(getPlanetName().toLowerCase() == "mhen'ga") output("\n\nEsbeth is almost peaceful in the evening. It’s oddly tranquil, in the sense that you’ve stepped back in time or weren’t on an alien planet.");
		else if(getPlanetName().toLowerCase() == "tarkus") output("\n\nNovahome groans with activity at all hours of the day. The raskvel don’t sleep, and there’s a constant stream of Rushers to entertain the scrappy locals.");
		else if(getPlanetName().toLowerCase() == "myrellion") output("\n\nThe DMZ is never quiet. Rushers, Myr, and U.G.C officials wander the neutral junction in force. Restless tension.");
		output(" Roads curve in every direction, promising vague flickers of discovery. When you focus on it, you can barely hear yourself think. Brushing shoulders with others is the way of things, but certain questions are raised when one gently grabs your [pc.arm] and pulls you out of the traffic.");
	}
	// Bianca non-Crew WORK HOURS, load the 'bianca_work' bust for this sequence
	else if(hours < 20)
	{
		if(getPlanetName().toLowerCase() == "mhen'ga") output("\n\nEsbeth is alive with activity - being one of the very first planets encountered in the Rush, it still sees a great swell of activity that no amount of additional space can keep up with.");
		else if(getPlanetName().toLowerCase() == "tarkus") output("\n\nRaskvel are active at all times. Day, night, there’s no discernible difference in the crowds of bunny-eared lizards peddling scrap to visiting Rushers.");
		else if(getPlanetName().toLowerCase() == "myrellion") output("\n\nHundreds of restless souls sweep through Myrellion’s DMZ on a constant basis, brushing shoulders between a hodgepodge of rest spots wedged into each other. Myr, off-worlders, and others.");
		output(" Your path could take you in any number of directions already being tread. When you think about the chaos of it, it’s easy to lose yourself in the cacophony. Knocking arms with others is inevitable, but having someone grab you aside is cause for concern.");
	}
	// Bianca Is Crew; load the ‘bianca_work’ bust for this sequence.
	else
	{
		output("\n\nTavros is a source of ceaseless turmoil. Unbearable amounts of noise at all times, no matter where you are, representatives of every known race milling through the clatter and argument. It’s expected, given that it is the main hub of the current Planet Rush, but limiting the time spent rubbing arms with strangers every step is the best you can do. Sometimes it’s hard to believe that there can be any guarantee of safety and security here, but between the crowds and above the throngs, watchful eyes are always on you. Do they see the moment you’re pulled from the vein by a firm grip?");
	}
	clearMenu();
	addButton(0,"Next",biancaAmbushesYouForVDayOrSomeShit);
}


public function biancaAmbushesYouForVDayOrSomeShit():void
{
	clearOutput();
	showBiancaVDay();

	//biancaIsCrew,orDuringWorkHours:
	if(biancaIsCrew() || hours < 20) output("You recognize her in a flash.");
	else output("You know who your ‘assailant’ is before she pulls the red hood down.");
	output(" Slitted, glowing purple eyes shine through a pair of eyeglasses, and a lovely length of golden-blonde hair spills over the tall woman’s shoulders. <i>“[pc.name],”</i> Bianca smiles warmly. <i>“I apologize if I’ve startled you. ");
	if(flags["BIANCA_VDAYS"] != undefined) output("Just like last time, right? I hope it is not a problem.");
	else if(hours < 20) output("I usually work at this time, but I thought this surprise would be more... meaningful");
	else output("I would be, in your shoes, but I didn’t want to draw too much attention");
	output(". May I ask you to walk with me?");
	if(flags["BIANCA_VDAY_DECLINED"] != undefined) output(" I understand you were previously unavailable, but perhaps... " + (hours < 17 ? "today":"tonight") + "? Hehe...");
	output("”</i> Dr. Ketria knits her fingers at her waist, tilting her head, a hopeful smile playing upon her lips. Both vulpine ears twitch, listening intently.");
	IncrementFlag("BIANCA_VDAYS");
	flags["BIANCA_VDAY_YEAR"] = getRealtimeYear();
	processTime(2);
	clearMenu();
	var joinBiancaTT:String = "Bianca isn’t the type to ask for something. That alone is worth seeing what this is about.";
	if(pc.isMischievous()) joinBiancaTT = "The good doctor wouldn’t pull you aside on a lark. She has a very good reason she’s keeping close.";
	else if(pc.isAss()) joinBiancaTT = "If you can’t trust Bianca, then you can’t trust anyone. Might be worth hearing her out.";
	addButton(0,"Join Bianca",joinBiancaForVdayBullshit,undefined,"Join Bianca",joinBiancaTT);
	addButton(1,"Turn Down",turnDownBiancaz,undefined,"Turn Down","You can’t make every occasion.");
}

//[Join Bianca]
// Tooltip: {kind: / misch: / hard: }
// be sure to move the PC to the Residential Deck on Tavros, somehow, just for immersion’s sake, during the /tavros or ‘biancaIsCrew’ checks.
public function joinBiancaForVdayBullshit():void
{
	clearOutput();
	showBiancaVDay();
	if(pc.isNice()) output("<i>“Sure,”</i> you answer softly. <i>“I can always make time for you.”</i>");
	else if(pc.isMischievous()) output("<i>“No problem, doc,”</i> you blithely reply. With a smirk, you continue, <i>“You’ve been there for me, I can be there for you.”</i>");
	else output("<i>“I’ve got a little time,”</i> you respond. <i>“Let’s keep it simple.”</i>");

	output("\n\n<i>“Thank you, [pc.name].”</i> Bianca’s multiple tails sweep as she wiggles her hips; the fox-mom extends her elbow, and it takes a moment for you to pick up on the gesture - holding arms, she guides you to a private rendezvous with only the sound of her careful breathing for company.");
	if(getPlanetName().toLowerCase() == "mhen'ga") output("Not even the most curious eyes will look down this alley. It isn’t the most romantic getaway, but there’s a certain cozy charm to being out of sight and mind. Just you and a caring doctor, together in mischievous quietness.");
	else if(getPlanetName().toLowerCase() == "tarkus") output("This disused section of grand Novahome shouldn’t attract any onlookers. Especially not when you close the door! It’s more of a glorified closet with some impressive walk-in space. It’s rather relaxing, especially since it mutes the outside to a faint din. You can focus better on a certain doctor like this.");
	else if(getPlanetName().toLowerCase() == "myrellion") output("The DMZ is littered with unused buildings. Slipping between two of them is a simple matter. The irritable din dies down here, too. Romantic this location isn’t, but it makes you feel... rascally, like you’re up to no good with someone you trust and nobody can stop you.");
	else if(getPlanetName().toLowerCase() == "tavros station") output("Walking through the residential deck’s meticulously maintained garden-plus-park endows you with a special kind of serenity. Walking alongside a lover like Bianca, arm-in-arm is why it’s breathtaking. What you’re doing hits all at once, and you can’t help but gasp.");

	if(pc.libido() < 33) output("\n\nAdmittedly, there’s something a bit arousing - in the good way, not the skeptical or cynical kind - being led to a secluded place by someone like Bianca. One only knows what she has planned.");
	else if(pc.libido() < 66) output("\n\nPart of you just knows there’s more to this meeting than platonic greeting. You could get dirty and filthy here, and no one would be the wiser.");
	else output("\n\nBianca has other plans - you feel it in your gut. Your heart rate quickens as a result, and you, like her, are starting to pick up on... other things.");
	output(" Flushed to a vinaceous tinge, the physician slips a hand into her coat and your anticipation heightens to a keen pinpoint. In her grasp is a gold and red envelope. High-quality stationery, the kind only used by government or military officials.");

	output("\n\n<i>“I would be delighted for you to receive this,”</i> she says, slowly, like she’s exerting a lot of control over some part of herself. <i>“On Earth, a certain holiday is being celebrated as we speak, and I am glad to honor it with you. Please open the letter.”</i> Bianca’s cherry lips stretch into full excitement. White-gold tails swish joyfully behind her, adding a cool contrast to the maternal warmth she radiates. <i>“I... understand that we could be on your ship, perhaps. But I’ve always been... mm, a certain kind of adventurous. Please humor me...”</i> She glances around and titters. <i>“...This. {repeat: Like before, ehe.}”</i>");
	output("\n\nAn ornate wax seal is all that stands between you and the contents of the elegantly-prepared missive. You detect a faint scent of expensive perfume exuding from the envelope. Opening it should be simple. You’ve read a lot of notes, emails... but your [pc.hands] quiver. Pulling out the paper inside, the relaxing fragrance strengthens. It’s nothing out of the ordinary, just a very pleasant smell that, when you look back at Bianca and associate it with her, feel so at ease.");
	output("\n\nAnd that youthful curiosity has you open the folded memo, beautifully-made with a decorative trim. A single paragraph of immaculate handwriting awaits.");
	// first time
	if(flags["BIANCA_VDAYS"] == 1)
	{
		output("\n\n\t<i>Dear [pc.name], I wish you a very happy Valentine’s Day. I never thought you and I would become as close as we have. That we have is a miracle. Of the few memories we’ve made, I cannot wait to make more.");
		if(flags["BIANCA_CONFRONTED"] == undefined || flags["BIANCA_CONFRONTED"] == 0) output(" Until you appeared in my life, I was unaware of the toll that working on the frontier had taken on me. You showed an interest in me that nobody else had, and it helped me more than you know. I will never forget the things that you’ve made me feel, and I hope that we can continue - together.");
		else output(" Words are insufficient to convey my gratitude to you. For all that you’ve done for me. You saved me from myself, and showed me that I have a reason to keep living. You are important to me, more than you can know.");
		output(" <b>-Bianca</b></i>");
	}
	// repeat
	else
	{
		output("\n\n\t<i>Dear [pc.name], I wish you another very happy Valentine’s Day. It gave me a thrill last time that kept my spirits up through the whole year when you spent time with me. Whilst we all cannot make every occasion, I simply wished for you to know that you mean the universe to me. Thank you. I hope that we will remain close, and that you remain in good health. <b>-Bianca</b></i>");
	}
	output("\n\nIt takes all your effort not to look at Bianca right away. You gingerly fold the paper, re-set it in the envelope, and pocket it. Then you look at her, heart audibly pouding, and there’s a single tear running down her cheek. <i>“My, it <b>has</b> been... " + (flags["BIANCA_VDAYS"] == 1 ? "a long time since I was able to do that for someone":"some time since we did this before...") + "”</i> She sighs heavily, a great emotional weight lifting from her shoulders. Then, the fox-doctor’s arms spread in wide invitation. <i>“I’m here. If it pleases you...”</i>");

	processTime(5);
	clearMenu();
	addButton(0,"Hug Her",hugBiancaVday,undefined,"Hug Her","Keep it friendly and simple.");
	addButton(1,"Hug Tight",hugTightBaincaLetsGooo,undefined,"Hug Tight","Roses are red; you’re not close enough. Go have a squeeze and huff all that fluff.");
	addButton(2,"Kiss Her",kissDatFoxBitch,undefined,"Kiss Her","Take her by surprise. It can’t be Valentine’s Day without a kiss, right?");
}

//[Hug Her] [Hug Tight] [Kiss Her]
// Hug her is very friendly and light. Hug Tight is lewd. Kiss her is v. lewd.

//[Hug Her]
// Tooltip: Keep it friendly and simple.
public function hugBiancaVday():void
{
	clearOutput();
	showBiancaVDay();
	output("The omnipresent ache for tender companionship blossoms in your heart. You [pc.move] to Bianca, softly, entering her foxy embrace");
	if(pc.tallness < 72) output(", standing on your tiptoes and dissolving into her thick, sheltering sweater");
	else if(pc.tallness < 80) output(", winding your [pc.arms] around her waist and interlocking your [pc.hands] just above her butt, just holding her");
	else output(", leaning down as she stands on her tiptoes to pull her into your [pc.chestNoun]");
	output(". Her hands close around your nape, fingers stroking");
	if(pc.hasHair()) output(" through your [pc.hair] at the sensitive places underneath");
	else output(" sensitive places on your scalp");
	output(", focused around the undersides of your [pc.ears], injecting pure, undiluted <i>wellness</i>. White-tipped golden fluff weaves in and closes securely around your middle, " + (biancaLover() ? "three":"two") + " lustrous, gleaming tails insulating the milfy warmth at the center.");
	if(pc.hasTailFlag(GLOBAL.FLAG_LONG) && pc.hasTailFlag(GLOBAL.FLAG_PREHENSILE)) output(" Reciprocating her prehensile affections, you wrap your own [pc.tails] around her in a truly sublime hug.");
	else if(pc.tailCount > 0) output(" Your [pc.tails] wag" + (pc.tailCount == 1 ? "s":"") + ", noisily shifting air as natural reactions to TLC bloom under your [pc.skinFurScalesNoun].");

	output("\n\nBianca gradually pushes your [pc.face] into ");
	if(pc.tallness < 72) output("the underside of");
	else output("the top shelf of");
	output(" her cleavage, allowing you to melt against the melty fullness of heavy, motherly breasts. ");
	if(biancaLover()) output("<i>“I love you, [pc.name]. Thank you. For everything. For everything...”</i> she whispers.");
	else output("<i>“I’m happy to have met you, [pc.name]. I’m happy we can be together...”</i> she whispers.");
	output(" Embosomed by sumptuous tits, the galaxy at large is massaged away by delicate fingers. and the sounds of a big heart beating away behind the softest pillows you’ve ever lain your head upon. Luxuriating in the pampering, you think only of how fortunate you are to share this intensely pleasurable moment with her. Inhaling her rich, natural, and undeniably <b>female</b> scent lends a dreamy quality to the heat of her form. Hers is the smell of a dutiful caretaker; a wife and mother built to be the progenitor of a great dynasty.");
	output("\n\nGood things like this are taken for granted in the real world. They’re easy to forget. Sincere devotion like Bianca’s is a rare thing. Her presence, her calming aura... this is what being loved and content feels like. No lewdness required, no sex needed. Simply... good memories. Moments to cherish for the rest of your life.");
	output("\n\n<i>“I will be there for you... whenever you need me...”</i> she says, protectively nuzzling her " + (pc.tallness < 72 ? "boobs":"chin") + " into your head.");
	output("\n\nHere, " + (pc.tallness < 72 ? "underneath a fox-mom’s eclipsing cleavage, ":"") + "there is no task, no worry, no ship. Simply you and Bianca. You don’t make any moves on her, just... revel in it all. Breathe in the sunshine of feminine fox, indescribable goodness swallowing your senses. Exhalations are, in a word, rejuvenating - you start to feel lighter. Muscles go dormant. You’re sure you yawn. It’d be so easy to fall asleep here, if she stroked a little slower... carried you into rest...");
	output("\n\nBianca lifts you by the chin, exhaling. The sound is like a gentle breeze, and it glides over your [pc.skinFurScalesNoun]. <i>“You’ll pass out if you don’t cycle oxygen.”</i> She giggles. The mask of professional etiquette has fallen from her face, revealing the alluring creature beneath it. Squeezable cheeks, kissable lips, and moist eyes - shining amethysts floating in water. <i>“But, I have another gift I was able to procure.”</i> Her genuine expression gets so happy that it’s difficult to comprehend. <i>“Shall we partake? Afterwards, we can decide on... further activity.”</i>");
	output("\n\nThat suggestive bat of the eyes cannot be interpreted platonically.");
	processTime(15);
	pc.changeLust(15);
	clearMenu();
	addButton(0,"Next",chocolatesWithBianca);
}

//[Hug ‘Tight’]
// Tooltip: Roses are red; you’re not close enough. Go have a squeeze and huff all that fluff.
public function hugTightBaincaLetsGooo():void
{
	clearOutput();
	showBiancaVDay();
	output("There’s a reason Bianca brought you here, and it’s pounding in your chest. A hug’s not the only thing on offer. With relish, you [pc.move] to her, and lay your hands on her pillowy bosom. Sinking into her sweater puppies, your [pc.fingers] give the doctor’s bust a long, lingering squeeze.. <i>“O-Oh...!”</i> she gasps, thrusting her mountainous chest into your [pc.face] for maximum enjoyment. That’s when you hug her, wrapping an [pc.arm] around her waist and frocing her against the wall, burrowing mouth- and nose-deep into her covered titties.");
	output("\n\n<i>“A-Ahh... that’s lovely...”</i> she sighs, not resisting in the slightest. When you look up from her toasty-warm boobs, you find her gazing back with an expression of wonderful, assenting maternity. <i>“Hm?”</i> she hums. <i>“I didn’t think you’d be done already, [pc.name].”</i> Ruby lips open in a winning smile. <i>“If it’s what you want, play with them as long as you’d like.”</i> At that, she hefts her sprawling rack and you squeeze them again. You squeeze so hard that it must hurt, but all she does is moan and tell you how good it feels.");
	output("\n\nSucculent teacup nipples bulge against her thick clothing. Having them press against your palms ignites your libido - you pluck them, grope them, and massage them until they’re hard as gemstones, glowing spots of sheerest ecstasy. <i>“Yes... that’s good, [pc.name]...”</i> Bianca titters, bliss etched on her face. Enormous tracts of milkless flesh distort and squish around your grasps; prude modesty only fuels your imagination. Dense, firm, and heavy, these two jiggling jugs sitting so high on her chest... you just want to make her squirm, pull her closer.");
	output("\n\nRoaming your way down her hips, desire inspired by the silken touch of foxen fluff, you thread around to the rolling slopes of her gigantic ass. Bound by tight pants and a struggling belt, Bianca’s aft-quarters project a defiant volume of plumpness that you growl for. Military-grade fatigues are no match for her shapely bottom’s blatant, uncontrollable weight. To help you appreciate it, she thrusts her hips backwards, simultaneously forcing your head deep into the sanctuary of her chest. Melting into one another, she whispers praises and compliments, while you, hungrily molesting her constrained curves, experience a rapidly-mounting arousal that won’t be denied.");
	output("\n\nOf all three deliciously round parts of foxen physician, it’s impossible to decide what you like most. Naturally gifted in every department, her sensuality is incredible. Pliant yet firm buttocks, mesmerizing boobs, and vast, kit-bearing hips and thighs that could smother you to obscurity. Touching this prodigious fertile-figure becomes a need greater than any other base requirement, and then there’s her refreshing scent - feminine attraction made an uplifting aroma. You’re incapable of going easy like this. There’s so much Bianca to grope and not enough time!");
	output("\n\n<i>“My my, that energy of yours is delightful!”</i> Bianca exclaims, fastening her hands to your wrists and taking them back up to her tits to roost. <i>“But this wasn’t <b>all</b> I wanted to bring you here for.”</i> Her lips have never looked more kissable. Her amethyst eyes are moist, and her cheeks are tomato red. <i>“I wish to share with you another gift that I was able to procure. On short notice, I may add!”</i> The doctor, you swear, has never looked so happy. <i>“Shall we partake? I think you’ll enjoy it. Afterwards... we can think about picking up where we leave off...”</i>");
	processTime(20);
	pc.changeLust(15);
	clearMenu();
	addButton(0,"Next",chocolatesWithBianca);
	//[Next] \\ Go to ‘Chocolates!’
}

//[Kiss Her]
// Tooltip: Take her by surprise. It can’t be Valentine’s Day without a kiss, right?
public function kissDatFoxBitch():void
{
	clearOutput();
	showBiancaVDay();
	// pc Confronted Bianca (>51 Familiarity)
	if(flags["BIANCA_CONFRONTED"] == 1)
	{
		output("Valentine’s Day is a romantic affair that you’d be doing an injustice if you didn’t kiss the beautiful woman confessing her feelings to you. There’s no inner deliberation, only a shedding of restraint and distracting thoughts as you [pc.walk] close to Bianca, meet her shimmery gaze, and instead of embrace, spread your own [pc.arms] out, interlock your [pc.fingers] with hers, and move in. But you don’t stop - you gently push the vulpine mom back into a wall");
		if(pc.tallness < 72) output(", at once rising to your tiptoes and pulling her down");
		else if(pc.tallness < 80) output(", melt into the distorting fabric of her breast-pumped sweater");
		else output(", lean down");
		output(" and press your [pc.lipColor] lips to hers in a sensual kiss that ignites a conflagration of sweltering tenderness.");
		output("\n\n<i>“[pc.name]...”</i> she murmurs, eyes drifting shut, glowing a little hotter.");
		output("\n\nIt’s a fiery kiss that starts with a spark: quick, flirty pecks to cherry-velvet texture. <i>I love you,</i> they say. Bianca plants your [pc.hands] on her cushiony butt and reciprocates, pulling you into her velvet cleavage. Utilizing decades of expert lovemaking, she gives you a soulful, aching kiss, desperate to tie tongues and swap spit. It’s hard to tell who is enjoying this the most. It becomes a friendly competition, sort of - who can make the other feel good, who can show the other how happy and glad they are.");
		if(pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output(" Having a long tongue offers no advantage when pashing with a woman thrice your age.");
		output(" She tastes of ripe fruit perfectly preserved; milfy vulpine flavor");
		if(pc.hasFur()) output(" soaks into your [pc.furColor] fur");
		else output(" dribbles down your chin");
		output(" as the frenching turns to open-mouthed slobbering.");

		output("\n\nThat’s how badly you want each other. The aching in your crotches, the unrestrained touches, the fierce groping. It’s only a matter of time before the two of you tumble to the ground and go at it like laquines.");
		output("\n\nBianca is unlike any other woman. She’s honored her roles as loyal mother and infallible caregiver, endured a history of hardship. Opening up to you allowed her to work past the pain. Her passion burns again, all for you, making further thought impossible. You want her. You want her to feel what she makes you feel: protected, safe. Loved. Your tongues loop inside her mouth, then yours, squeezing tight, <i>achingly</i> tight - there it is, the intense scent and taste of prime maternity. Luscious, shapely lips seal on yours, whines and pants of pleasure abound, and then the kiss breaks - you both reel back, gasping for breath. Beads of sweat roll down the vixen’s crimsoned cheeks.");
		output("\n\nStrings of wet kisses are laid upon your jaw, your neck, and then your lips; lustful promises and sultry whispers wash warmly over your mind. It restarts, giddiness fluttering over your heart. Neither of you relent to the other’s desire. It’s mutual, designed to elevate them to the highest peaks. Your hands mould the fertile, doughy flesh of her seam-destroying ass whilst her skillful fingers dance around your inner thighs");
		if(pc.hasGenitals()) output(", building your body’s lust in that agitating way of hers");
		output(".");
		if(pc.hasCock()) output(" Your [pc.cocksLightIsAre] already hard, but she pokes and prods around the [pc.knotOrSheath], feeling out the virile strength of your physiological urges" + (pc.hasKnot() ? ", possessively concentrating on your knot":"") + ".");
		else if(pc.hasVagina()) output(" You’ve already gotten a bit wet down there, but still she presses your [pc.clits], coyly circling the spot" + (pc.totalClits() > 1 ? "s":"") + " of feminine joy.");
		output("\n\n<i>“[pc.name]...”</i> Bianca sighs, and hugs you tight. You do the same. For a very long, fulfilling moment, you forget the outside galaxy, cherishing the fuzzy wonder surrounding you. <i>“[pc.name]... that was more than I could have asked for.”</i> Her giggle is so infectious that you echo it, daring to stroke her cheek. She allows it, and the tactile sensation blows you away. <i>“But I also brought something else I wanted to share. Shall we partake?”</i> She wipes a large glob of slobber from her chin. <i>“Then... maybe we can see where things go...”</i>");
	}
	// Else
	else
	{
		output("Bianca’s not a stranger to you... but she is married. She’s taken. You’re aware of it. Yet here she is making a heartfelt confession and giving you an opportunity others would cry and scream and kick the walls for. You’re also no stranger to intimacy with this voluptuous vixen. Also-also, it’s Valentine’s Day. Maybe it wouldn’t be so bad. Just a chaste exchange of affection. That’s fair, right? So, instead of going for a hug, you [pc.walk] forward, heart pounding, staring into the calm face of impartial maternity, and lunge.");
		output("\n\n<i>“O-Oh!”</i> Bianca gasps in surprise when you very insistently urge her back to the nearest wall and ");
		if(pc.tallness < 72) output("tug her down into a kiss");
		else if(pc.tallness < 80) output("draw her into a needy kiss");
		else output("lean down and go straight for a kiss");
		output(". Luscious, cherry lips press to yours in a hot, plush connection; your [pc.tongue] slips past them to rouse hers to action, tasting the tender heat of her wet muscles. Pearly beads of indecent moisture roll out from her lips as you take her, telling yourself it’s all to pay her tender affections back. Just for a bit. Your technique is fretful and panicked, and her muscles don’t invite. Both of her hands touch down on your temples, pulling you back.");
		output("\n\n<i>“[pc.name]...”</i> she smiles knowingly. There’s no admonishment, no disappointment, just... doting loveyness. She blinks, and her beaming expression intensifies subtly. Even the glow in her amethyst eyes. <i>“...You can’t force something like that, you know. There’s nothing to worry about. Here, follow my lead. Just let it happen,”</i> she breathes, passion washing down your neck like a soft, velvet curtain; her head tilts, <i>“...let our bodies talk...”</i>");
		output("\n\nFeel-good brain juices spill out as you’re locked in a deep, impassioned kiss. Bianca leads you, calling upon her storied history of lovemaking to show you how a real lover does it. It starts with little slurps and suckles, tiny nibbles on your lower lip pulling on sensitive, thirsty flesh. Then, with a humming pant, she clutches the back of your head, stroking behind your [pc.ears], pushing into the inviting dampness of your quivering cheeks. You grab her matronly hips to steady yourself, following her nimble tongue’s sweeping, tingling motions, enthusiasm blooming upon your mouth.");
		output("\n\nThe good doctor quells your rising restlessness by withdrawing, laying a smooch on the tip of your nose, and restarting, coaxing your [pc.tongue] to action. Aided by the tip of the more skilled muscle, yours lifts up and takes its hand, so to speak, joining it in an exhilarating dance. They stretch around one another, squeezing tight, tighter... it’s so hot that the pain and the slight numbness, the <b>coiling</b>...! ...It all feels better than you can believe. This is what it means to make out with a woman. All the while, she pets you, sharing her boundless capacity for togetherness one blissful caress at a time.");
		output("\n\nWhen you part from her, it’s a moment to savor. The kiss was incredible, but this part, breathing in, <i>relishing</i> her taste and her scent... it’s indescribable. The tips of Bianca’s fingers stroke down your [pc.face]. <i>“Did you like that, [pc.name]? Hehe...”</i> Again, she pets you, makes you nuzzle into her palm. <i>“...I admit, I was not expecting that. But I’m glad you care about me that much. Thank you, [pc.name]. Now,”</i>");
		output("\n\nBianca has you step back. <i>“I brought another gift I’d be overjoyed to share with you. Afterwards, we can decide on something fun to do. Shall we partake, [pc.name]?”</i>");
	}
	//[Next] \\ Go to ‘Chocolates!’
	processTime(15);
	pc.changeLust(15);
	clearMenu();
	addButton(0,"Next",chocolatesWithBianca);
}

// Chocolates!
public function chocolatesWithBianca():void
{
	clearOutput();
	showBiancaVDay();
	output("Bianca reaches into a hidden coat pocket, producing two small boxes of which look expensive even before you’ve read the words on the front. Chocolates. The first one reads <i>Silk-flake Golden Chocolat Prundeme</i>, and the second, ‘Subahi’s Vanilla Truffle Dark-Chocolate’. Going off the packaging, these were made on Earth itself. <i>“It was... troublesome to ship these to the frontier. Normally, items like these only exist in the Core systems. But, such acquirings are not beyond my means to finance.”</i> A very satisfied wink. <i>“Come, let’s sit.”</i>");
	if(biancaIsCrew()) output("\n\nYou find a secluded bench to sit at. Nobody could hope to tell which of you was cuddling with the other first.");
	else 
	{
		output("\n\nBefore you can sit, the vigilant fox-mom divests her coat and lays it out under you. ");
		if(pc.isMischievous()) output("Eh, she won’t need it - she’s got plenty of padding down there anyway!");
		else output("It almost makes you feel ashamed for not having something to give her.");
	}
	output(" A tail swoops around your shoulders like a heavenly backdrop. <i>“Let’s start with this - my favorite. ");
	if(flags["BIANCA_VDAYS"] == 1) output("Abilaine’s Silk-flake delicacy is unlike anything you’ve ever tried. I’m sure of it.");
	else output("I remember how well you enjoyed Abilaine’s Silk-flake sweets last time, too!");
	output("”</i> You can scant imagine the cost of this particular brand - the wooden box is draped in embroidered silk, and makes the most satisfying sound when the top clicks open and reveals eight round, gleaming chocolate spheres centered around a fancy decoration. The rich scent of a billionaire’s treat tantalizes; sugary fineness in hand-crafted form. <i>“Four, for each of us. Hehe. This comes straight from Lucerne.”</i>");
	output("\n\nWhen you go to reach for one, Dr. Ketria shoos your hand away and carries one up to your lips. <i>“Let me,”</i> she smirkingly answers with a tasteful bite of the lip. <i>“Say ‘ahh’.”</i> ");
	if(pc.isAss()) output("You sigh, humoring her.");
	else output("If she insists!");
	output(" <i>“The gold-wrapping is edible, by the way. Let it melt in your mouth.”</i>");
	output("\n\nShe sets the gold orb on your taste buds and tickles your tongue with a leaving caress. Once you bring it into your mouth, subtle hints of flavor burst into acute, delectable sensations. It feels like a cloudless, tropical night simmering on your [pc.tongue]. As many ingredients as calories, too many to reasonably identify - sheer decadence. You feel bubbly and light-headed swirling the vaguely sticky substance around your mouth, crunching on the mildly al-dente covering that’s broken down to reveal the moist, cool cream packing the dark pearl’s core. For a second, you can see yourself on a chair next to the lapping waves of a faraway ocean, staring up into space, untroubled, and keen.");
	output("\n\nCuriously, no unique aftertaste. A consistent enjoyment of fancy vanilla-chocolate from start to finish.");
	output("\n\nThe vulpine milf watches your reaction with tell-tale gratification, doing her best to be polite while enjoying one herself. She swallows the same time you do. <i>“What does it make you think of, [pc.name]?”</i>");
	output("\n\n");
	if(pc.isNice()) output("That’s a simple question. <i>“Of the good times we’ve spent together,”</i> you answer, finding her hand and squeezing it. She does the same.");
	else if(pc.isMischievous()) output("<i>“Quite a bit,”</i> you smile, so very sly. <i>“...But I’m only thinking of us right now... and where <b>we</b> could be, in the future.”</i>");
	else output("<i>“That’s not an easy question to answer,”</i> you sigh. She definitely spent too much on this. But you’re not going to kill the mood. <i>“It makes me think of what might happen, when all this Rush business is over with.”</i> You clench your fist around her hand, staring into slitted violet eyes. <i>“That I’d like to experience more.”</i>");
	output("\n\n" + (biancaIsCrew() ? "<i>“You say that with such a straight face,”</i> she giggles. <i>“You look cute when you do that.”</i>":"<i>“I wonder if our lives could be any more intertwined.”</i> She giggles, but looks away for a hot second. <i>“Still, if nobody else takes care of you, I will. Promise.”</i>"));
	output("\n\nOnly a minute or two has passed and Abilaine’s certainly-very-expensive desserts are all gone, deliciousness settling in your bellies. Before bringing out the other box, Bianca gives you a small, featureless metallic flask, liquid jostling inside. <i>“How about a sip? A sampling of wine is best in the interim. It comes from home, just like our treats.”</i>");
	output("\n\nYou give the ebullient fox a grin as you accept the thing, uncapping it and bringing it to your lips. Her ears are twitching very fast. ");
	if(pc.isNice()) output("Icy sweetness washes over your gums, revitalizing your palate with the taste of chilled sugar. <i>“When grapes are exposed to Winter’s whims, a syrupy liquid of pure sugar is squeezed from the fruit to create this rare blend,”</i> she explains. <i>“It’s soft... like you, [pc.name].”</i>");
	else if(pc.isMischievous()) output("Versatile acidic flavors of wild berries and spicy peppercorn lightly sting your gums, washing your palate of any residual sweetness, replacing it with a medium, lingering goodness. <i>“These days, wines produced in Lucerne have taken on very natural ingredients and tastes. One such company has gained galactic renown for this flavor, enjoyed in all U.G.C Parliament retreats,”</i> Bianca simpers. <i>“I thought it perfect for a young [pc.manWoman] like you, [pc.name].”</i>");
	else output("A fruity sharpness hits your gums right away. Black currant, dry berries, and the underlying taste of red meat make this dark wine one of the strongest you’ve ever had. <i>“Cabernet sauvignons have been a setting on candlelit dinner tables since humanity’s 19th century, but it takes a true master to refine them for those of exacting tastes. They become stronger, harder, strike your tongue with a taste of power.”</i> Bianca smiles, eyeing you fiercely. <i>“I could think of no better for you, [pc.name].”</i>");
	output(" As expected, she takes a sip immediately after you do. <i>“Having a dash of [pc.name] makes it taste even better,”</i> she laughs good-naturedly, tousling a lock of golden hair.");
	output("\n\nYou end up laughing too, and the whimsy ratchets up. Emboldened by a slight buzz, you reach out for those large ears and pet them until they fold." + (pc.hasEmoteEars() ? " Then it’s your turn.":"") + " More laughter. Grabbing her free tail, you bury your nose in the forest of finely-groomed floof and huff that earthy aroma - Bianca’s animal side, highly-concentrated. <i>“That’s lewd, even for you, [pc.name].”</i> She bites her lip then, simply, pecks you repeatedly on the face. More perverted kisses.");
	if(pc.hasTailFlag(GLOBAL.FLAG_FLUFFY) && pc.tailCount > 0) output(" Again, it’s your turn - she finds your [pc.tails], sliding her flared nostrils across the surface, another layer of bliss to her mood.");
	output(" <i>“Come now, before we get distracted.”</i>");
	output("\n\nTruffles in any form are a hallmark of fine-dining cuisine, so it’s no surprise that Subahi’s vanilla-infused delicacy is a feast for the senses. Dark ganache chocolate, impossibly sweet and thick, waxes over your teeth. You could spend upwards of an hour trying to lick them clean! Fortunately, there’s plenty of wine, and with a bit of liquid assistance, you identify the truffle oil binding this chocolatier’s profound effort in the back of your throat. Thinking in images becomes so easy that you default to it. You can see yourself on a veranda, looking over a great horizon, standing with someone you care about, taking it all in.");
	output("\n\nThe more the two of you eat and drink, the more intense that imagination becomes.");
	output("\n\nOnly one chocolate remains. Bianca takes it between thumb and finger and looks up to you, then sticks out her tongue. Setting the treat on hers, she quickly closes in - another kiss, dripping with sticky accent. Gluey murmurs vibrate through your cheeks, your wet lips clinging to each other, adhered by gooey enjoyment. A ripe woman sugar-coated, beatific and misty-eyed, lost in making love. You mindlessly snuggle and nudge and brush and fondle, stroke, hug and love, tessellating in the warmth and sensuality, neediness and lust and happiness burning together in your titillated loins.");
	output("\n\nYou wish this night would never end.");
	output("\n\nBianca pulls away again, visibly sweating, shuddering, and very clearly turned on. <i>“I... I do not want this to sound untoward.”</i> Her ears have folded to her scalp - adorable. So fucking adorable. <i>“But if you would like to have me, too... I...”</i> She radiates pure consent. She doesn’t need to say it. <i>“Let’s make it a night to remember. If you wish. Shall I tend to you, [pc.name]...?”</i>");
	processTime(35);
	pc.changeLust(15);
	clearMenu();
	var oralTT:String = "";
	if(pc.isHerm()) oralTT = "Your [pc.cocksLight] and your [pc.pussiesLight] - you need her there. From the way she sounds, she’s of a mind, too.";
	else if(pc.hasCock()) oralTT = "Your [pc.cocksIsAre] fit to explode. Best they do it inside her mouth.";
	else oralTT = "You want her eating you out, kissing your [pc.pussies] like she does your lips!";
	addButton(0,"Get Oral",getOralFromBianca,undefined,"Get Oral",oralTT);
	if(pc.hasCock()) addButton(1,"Buttjob",buttjobFromBianca,undefined,"Buttjob","Bianca’s big ass makes your breath catch every time you see it. Burying your [pc.cocks] between it would be the perfect capstone to this evening...");
	else addDisabledButton(1,"Buttjob","Buttjob","Damn. <b>You don’t have a penis,</b> so you can’t get a buttjob from the fat-assed milf. That’s very unfortunate!");
	addButton(2,"LickHerCunt",lickFoxCunt,undefined,"Lick Her Cunt","If she wants a night to remember, you’re ready to make it so.");
	addButton(3,"Decline",declineTheKinkyWithTheStinky,undefined,"Decline","It’s unfortunate, but you just don’t have time to make with the kinky.");

	//[Get Oral] [Buttjob] [Lick Fox Cunt] [Decline]
	// Adding a 4th event in the future when you can penetrate her. Will remember.
	// Load ‘bianca_lingerie’ bust in all of these. That’s her half-naked bust.
}

//[Get Oral]
// Tooltip: {isHerm: Your [pc.cocksLight] and your [pc.pussiesLight] - you need her there. From the way she sounds, she’s of a mind, too./ hasPussy: You want her eating you out, kissing your [pc.pussies] like she does your lips!/ hasCock: Your [pc.cocksIsAre] fit to explode. Best they do it inside her mouth.}
// Bianca kneels and succs. Ball worship & knot love.

public function getOralFromBianca():void
{
	clearOutput();
	showBiancaVDay();
	//By custom request.
	showBust("BIANCA_LINGERIE");
	output("The prospect of Bianca using her mouth to lavish you with orgasm after orgasm is too good to pass up.");
	//hermOrCockOnly:
	if(pc.hasCock()) 
	{
		output("Liquid iron, boiling with the heat of pre-fellatio mania, rushes into your [pc.cocks].");
		if(pc.hasVagina()) output(" Even your [pc.pussiesLightIsAre] stealing some of the flow, plumping red with pleasure.");
	}
	else if(pc.hasVagina()) 
	{
		output("The plush, female slopes around your [pc.pussies] engorge" + (!pc.hasVaginas() ? "s":"") + ", blood rushing south to prepare you for a luscious tongue polishing.");
	}

	if(pc.isNice()) 
	{
		output(" <i>“Will you suck");
		if(pc.isHerm()) output(" me");
		else if(pc.hasCock()) output(" my cock");
		else output(" my pussy");
		output(" -”</i> You pause, a palpitating tremor of embarrassment rippling across your heart. Saying something like that to her should be easy, but there’s some other element about it that gets to you and amuses her. <i>“-I’d like that,”</i> you finish with a blushing smile.");
	}
	else if(pc.isMischievous())
	{
		output(" <i>“Hey, if you’re offering, I’d love that mouth of yours down there!”</i> you giggle. Though you don’t say anything, she can see the mild embarrassment blooming bright red on your face. <i>“My");
		if(pc.isHerm()) output(" cock" + (pc.hasCocks() ? "s":"") + " and my puss" + (!pc.hasVaginas() ? "y":"ies"));
		else if(pc.hasCock()) output(" cock" + (pc.hasCocks() ? "s":""));
		else if(pc.hasVagina()) output("puss" + (pc.hasVaginas() ? "ies":"y"));
		output("... er, if that’s okay with you.”</i>");
	}
	//isHard:
	else
	{
		output(" <i>“Yes, you shall,”</i> you focus intently on her face, then cast your eyes downwards. <i>“Suck ");
		if(pc.isHerm()) output("me off");
		else if(pc.hasCock()) output("my dick" + (pc.hasCocks() ? "s":""));
		else output("my puss" + (!pc.hasVaginas() ? "y":"ies"));
		output(",”</i> you finish, giving her a dominant little grin.");
	}
	output("\n\nMiss Ketria’s delicate hand falls to your crotch");
	if(!pc.isCrotchExposed()) output(", stroking the swell of genitalia therein");
	else output(", feather fingertips grazing the shapes of your burgeoning genitalia");
	output(", making ");
	if(pc.cockTotal() + pc.totalVaginas() > 1) output("them");
	else output("it");
	output(" nice and wet. Staring into your [pc.eyes], emitting warm consent, she replies, <i>“I would love that, [pc.name].”</i> To your incredulity, " + (biancaIsCrew() ? "she springs off the bench":"she rises high on her feet") + ". <i>“But let me make sure you get the most enjoyment out of it.”</i>");
	output("\n\nBianca unlatches her belt. Both ends dangle around her hips. Then, she pulls her sweater out from the once-pressured band, high over her boobs, uncovering her reinforced bra and the twin burdens it bears. <i>“Mmahh...”</i> she titters, feeling around her succulent bosom before using her thumb to unclasp the heavy-duty button at the center. Melonous, high-set breasts flop out, with a planet-shaking wobble, fat pink nipples capturing your attention. The tranquilizing sway of her erect titflesh occupies the entire front half of your brain. <i>“The reason for this is simple, [pc.name],”</i> she says, flicking one in an upwards motion - a cute moan.");
	output("\n\nThen she pivots, yanking her pants down with a low whine. <i>“B-Because, I... nng,”</i> she grunts, the act of altering reality ever an exhaustive one. The bubbles of her pillowy posterior gradually swell out of the fabric. <i>“I think - you’ll like - me naked and... shameful!”</i> Successfully yanking the oppressive legwear down, you’re awash in a fog of pheromones. The olfactory assault brings you to the cusp of absolute arousal. Bianca bends forward so that you have the pleasure of taking in the high-quality vista of her immense ass, the shapely heft as prideful as the flagship of a great fleet.");
	output("\n\nDropping to her knees and shuffling for your groin, the good doctor presses her head between your [pc.legs] and plants her nose to your ");
	if(!pc.isCrotchExposed()) output((!pc.hasCock() ? "pubic ":"") + "bulge");
	else output((pc.hasCock() ? "[pc.base]":"crotch"));
	output(", inhaling with a deep sniff, and letting it go. <i>“Ah... mm...”</i> she blinks slowly, coyly glancing upwards.");

	// pc Crotch Not Exposed
	if(!pc.isCrotchExposed())
	{
		output("\n\nInvigorated by the promises your pheromones speak to her, she learns the lay of your gear and undoes your modesty in meticulous inches.");
		if(pc.hasCocks()) 
		{
			output(" Springing out from confinement, a coo slips from her lips when your [pc.cockHeads] bat into her chin. Already stroking your [pc.cocks] around the [pc.knotOrSheath], she inflates your virile meat to full, visage-masking bulk, slurping up that first [pc.cumGem] " + (pc.cumQ() < 1000 ? "drop":"blob") + " of sagging precum. <i>“Delicious,”</i> she remarks.");
			if(pc.balls > 0)
			{
				output(" She then dives into your [pc.sack], laying a kiss" + (pc.balls == 1 ? " on your single ball":" in the center crease") + ". <i>“This too.”</i>");
			}
			if(pc.hasVagina()) output(" And, knowing you well enough, she scopes out the places deeper in your nethers, discovering your [pc.pussiesLight] and waking your femininity with loving touches.");
			output(" <i>“I’m so glad to have it all to myself...”</i>");
		}
		else output(" Revealed with a tiny flex and leak of juice, your [pc.pussies] " + (!pc.hasVaginas() ? "is":"are") + " enviously teased into wetly creasing up. Cute kisses are laid on your [pc.clits], firm [pc.vaginaColor] incandescence alighting with great delight. <i>“You’re so adorable when you’re horny, [pc.name],”</i> Bianca giggles, sliding a fingertip through your muff-trench. <i>“I can’t wait to make you squirm; any chance to show you how well a pussy works when properly pleased is... quite thrilling...”</i>");
	}
	// pc Crotch Exposed
	else
	{
		output("\n\nHer civility and etiquette cast aside, Bianca breathes in your crotch-scent until her lush, cherry lips shine like wet rubies. <i>“Mmmf, there’s no better place for me to be. It’s like a reward after a long week of overtime and sleeping in-hospital.”</i>");
		if(pc.hasCock()) 
		{
			output(" Bianca pumps your [pc.cocks] by the [pc.base] until " + (pc.cockTotal() == 1 ? "it darkens":"they darken") + " her face in the shadow of hard, round muskiness. <i>“I love cock, you know that, right?”</i> she giggles, kissing your [pc.cockHeads]" + (pc.balls > 0 ? " and your [pc.ballsNoun]":"") + ". <i>“But I have to love the person carrying it more. Like my husband’s, or like yours... I love to see the faces you make while I bathe in your scent and power... hehe.”</i>");
			if(pc.hasVagina()) output(" A finger digs downwards, locating your [pc.pussiesLight]. <i>“That you’re a hermaphrodite makes it all the better. So many places to tease - and so many flavors to enjoy.”</i>");
		}
		else output(" As she exhales, Bianca laps up the whole of your [pc.vaginaColor] quim, setting spreading pleasure-juice around the velvet surface. <i>“Haaa... until you, [pc.name], I’ve never gone down on another woman. Indeed, I mimic the way my husband came at me, slobbering and bestial and aggressive.”</i> She kisses your [pc.clits]" + (pc.totalClits() > 1 ? " one-by-one":"") + ". <i>“I could not have asked for a better trainer.”</i>");
	}
	// Merge
	output("\n\n<i>“So, how would you like me to start, [pc.name]?”</i> she grins. <i>“Say whatever comes to mind. Or ‘do’.”</i> A breathy laugh. <i>“Tell me where to begin, my valentine, and I’ll eat you right up.”</i>");

	processTime(20);
	pc.changeLust(pc.lustMax());
	clearMenu();
	if(pc.hasCock()) addButton(0,"Next",oralFromBiancaForDickyWickies);
	else addButton(0,"Next",biancaPussLickinChickin);
	//[Next] \\ Go to appropriate scenes.
	// sceneTag: PC lust maximizes
}

// pc Has Cock (priority, includes herm check)
public function oralFromBiancaForDickyWickies():void
{
	clearOutput();
	showBiancaVDay();
	//By custom request.
	showBust("BIANCA_LINGERIE");
	// pc Kind
	if(pc.isNice()) 
	{
		output("<i>“The head" + (pc.hasCocks() ? "s":"") + ", if that’s okay - please lick " + (!pc.hasCocks() ? "it":"them") + ", then move down,”</i> you gingerly request. The extra-strong beats of your heart cause your erection" + (pc.hasCocks() ? "s":"") + " to sway in front of her like a hypnotist’s watch. <i>“Then... whatever else you can think of.”</i>");
		output("\n\nBianca’s neck cranes upwards and she bobs obediently around the [pc.cockHeads] per your request, weaving her tongue around <i>" + (!pc.hasCocks() ? "that spot":"those spots") + "</i> right below the glans. Fruit-red lips softly slide down, treating your veiny girth" + (pc.hasCocks() ? "s":"") + " with sweet, lusciously-textured kisses. The lady Ketria’s lascivious hums feed pleasurable vibration into your glazed rigor, coaxing hot [pc.cumColor] precum from your semi-dilated cumslit" + (pc.hasCocks() ? "s":"") + ". Lubed with your taste, she spreads fresh testosterone across her lips and peppers the scope of your [pc.cocks] in the horniest of ways, gently squeezing fingers imprinting on your wettening bulk. Truly, a cocksucking professional!");
	}
	// pc Misch
	else if(pc.isMischievous())
	{
		output("Before saying anything, you grab " + (pc.hasCocks() ? "one":"your") + " shaft and rub the [pc.cockHead] into her cheek then across her lips, tasting the carnal heat of her shameless, lusty breaths. <i>“");
		if(pc.balls > 0)
		{
			output("Don’t think I didn’t notice you staring at my sack,”</i> you wink. <i>“Work your way up. You know you want to.");
		}
		else if(pc.hasKnot()) output("You’ve been eyeing my knot since we got kinky. Go ahead - you know you want it.");
		else output("From the root up to the summit. Starting below is nicer, isn’t it?");
		output("”</i>");

		output("\n\nBianca’s expression turns thankful as she nuzzles into your");
		if(pc.balls > 0) output(" [pc.sack], kissing the spherical contents and lapping up the fattest trickles of nutsweat");
		else if(pc.hasKnot()) output(" [pc.knot], lavishing the bulbous magnitude of your spunk-plug in drooling desire");
		else output(" [pc.base], tongue looping around the rigid, cylindrical foundation of your manhood" + (pc.hasCocks() ? "s":""));
		output(". Watching her head bob obediently makes you clench up, and then she ascends by the tip of her tongue, climbing to " + (pc.hasCocks() ? "a":"your") + " peak and worshiping it in open-mouthed wantonness. Your hips wiggle of their own accord and she slides down, playfully nibbling parts of your [pc.dickSkin] between her lips, using their fuck-glossed texture to massage your [pc.cocks]. Her natural subservience to dick - <b>your dick</b> - is a sexual rush you aren’t prepared for.");
	}
	// pc Hard
	else
	{
		output("For a second you simply stare at her, considering your words, growing harder with each passing moment. Then, you grab " + (pc.hasCocks() ? "one of your shafts":"your shaft") + " and smack the [pc.cockHead] to her cheek. [pc.CumColor] precum splatters, and you throb out a tiny squirt that glues to her hair. <i>“Suck the tip and get me ready.”</i> You sound calm and collected, doing it one more time. <i>“Before I get bored. You wouldn’t want my cock to go soft, would you, doctor?”</i>");
		output("\n\nHearts in her glowing eyes, Bianca obediently wraps her succulent cherry lips around your [pc.cockHead] and <b>sucks.</b> You can feel a shot of [pc.cumVisc] slickness fill her cheeks, and then, she slides down, taking you to the back of her mouth before popping free and going at you with a cock-slave’s desperation. Nuzzling your girth, she kisses your penis from peak to root");
		if(pc.balls > 0 && pc.hasKnot()) output(", taking time to worship your [pc.knot] and [pc.ballsNoun] like she should");
		else if(pc.hasKnot()) output(", subserviently preparing your knot for further affection");
		else if(pc.balls > 0) output(", suckling and sniffing your nutsack and going cross with fellatio bliss");
		output(". Slitted eyes watch you for approval, moistening when you give it. When she’s done glazing your length in submissive slaver, you grab the side of her head and force her nose into your muskiest parts - good girl. Now she may begin.");
	}
	// merge
	var knotChecked:Boolean = false;
	// pc Horsecock
	if(pc.cocks[0].cType == GLOBAL.TYPE_EQUINE)
	{
		output("\n\n<i>“Mmmfff...”</i> You can hear and sometimes see the exact moments when Bianca’s higher functions cease to function. Sloven in comparison to her usual self, she tongues your equine pole until cummy spittle drips from her chin. She lingers around the medial ring and the fattest, juiciest parts of your fragrant horsemeat, panting heavily. <i>“Horsecock... musk... you spoil me, [pc.name]...”</i> Wedging her nose into the median space, she sniffs obscenely, profound enjoyment boiling in her lungs, causing your pony-wrecker’s mesa to flare outwards, revealing once-concealed pleasure zones that she dutifully encircles. <i>“I’m so glad I get to have it. To have its wonderful power in my hands. I love your cock so much. So... primal, and bestial. Having it rub against my skin and my hair, blind me in its scent...!”</i> The fox-slut kisses your sheath{ and then your balls again}, sweating profusely. <i>“I need it - I want it!”</i>");
	}
	// pc Humancock
	else if(pc.cocks[0].cType == 0)
	{
		output("\n\nYou have to catch yourself before you start braying like an animal. There’s a sultry, sensual, and devoted technique Bianca employs against your penis that makes it want to rut as powerfully as any beast-like race’s. <i>“I know everything about human cocks, [pc.name],”</i> she purrs, clamping your girth between her palms and rubbing the tip of her nose around your tip" + (pc.cocks[0].hasFlag(GLOBAL.FLAG_FORESKINNED) ? ", peeling back your protective foreskin with her tongue":"") + ". <i>“And I love the way yours smells,”</i> she says with a steam gasp, identifying vulnerable veins and squeezing the pulmonary ducts until you arch back in bliss. <i>“I can’t wait for you to cum. I’ll take this into my mouth and you’ll get to paint my throat in your hot, hot seed...”</i>");
	}
	// pc Canine/Vulpine Cock
	else if((pc.cocks[0].cType == GLOBAL.TYPE_CANINE || pc.cocks[0].cType == GLOBAL.TYPE_VULPINE) || (pc.hasKnot() && pc.cocks[0].hasFlag(GLOBAL.FLAG_TAPERED)))
	{
		knotChecked = true;
		output("\n\n<i>“Nnmyessssss...”</i> Bianca huffs your canid scent with innate enthusiasm, looking more happy to be pleasuring the throbbing [pc.cockColor] mass of your pointed hound-cock than she is serving perverted Rushers at her field clinic. <i>“You’re not just my valentine, [pc.name], not " + (hours < 17 ? "today":"tonight") + "...”</i> Capturing your taper between the plush peaks of her lips, gravity drags her firmed mouth down your shaft until it pokes the rear of her throat. Ascending and withdrawing, the knot-idolizing fox clutches the radius of your spunk-sealing girth, content to smear herself into it, wrap it in her lips, and hold it there, enjoying the woodsy musk it gives off. <i>“You’re my alpha...”</i> Only after kissing it about a dozen times does she finally move upwards. <i>“And you’re going to breed my mouth like one. I’ll make sure you get to feel your knot pressing against my lips, breaking me apart!”</i>");
	}
	// pc Feline Cock
	else if(pc.cocks[0].cType == GLOBAL.TYPE_FELINE || pc.cocks[0].hasFlag(GLOBAL.FLAG_NUBBY))
	{
		output("\n\n<i>“I’ll never tire of these rubbery spines,”</i> Bianca simpers, licking and smiling along the barbed circumference of your feline penis. <i>“They’ll feel wonderful in my throat, swabbing my esophagus, scrubbing out any and all thought that I’m a good girl.”</i> Squeezing your [pc.knotBallsHilt], her ruby mouthpiece glides around the peak, stroking the most sensitive nerve-endings of your dick, aggravating you to the borders of becoming her pet fuck-beast.  Her strawberry-scented breath brushes over your urethra. <i>“Even after you’re done, I’ll be thinking of these, of your cock, stretching me out, making me remember who gave it to me so very strongly...”</i>");
	}
	// pc Suula Cock
	else if(pc.cocks[0].cType == GLOBAL.TYPE_SUULA)
	{
		output("\n\n<i>“Ehe,”</i> titters the fox, poking at the prehensile stingers projecting from your cock’s upper and lower regions. <i>“Suula venom - you know, if you give me too much of this stuff, I may get stuck to your penis, [pc.name].”</i> Bianca pumps your alien shaft, an exotic leisure experience. But there’s evil torment in the motions - she eludes the grasping stings and the doses of lust-venom for now. <i>“I won’t turn down this challenge,”</i> she closes her eyes, serene and fuckable. You just want to cum all over her and her glasses! Your [pc.cockColor] turgidity pulses violently in her grip, and she pulls gently at the swollen dickflesh. <i>“No cock you can wield will be a match for me, hehe.”</i>");
	}
	// pc Else
	else
	{
		output("\n\n<i>“Dick,”</i> Bianca murmurs, pathing the angriest, most swollen of your [pc.cockNoun]’s veins with the tracing suction of her beautiful lips, crowding her maw with your scent and taste. <i>“Delicious cock. Do you feel that?”</i> she asks, two fingers working your [pc.cockHead] and the rest your lower shaft. Three sensual angles with the sultriest tones trapping ecstasy in the excited flesh of your phallus. <i>“I’m making you ready to burst. You don’t even know it. When you cum, you’ll feel it in your entire body - it will feel like you’re on fire. My husband always screamed and howled, like a wolf at the moon... when I did this to him...”</i>");
	}
	// merge
	output("\n\nThe slutsune impales herself on your thick dick, bringing you past her throat just a bit before repeating the motion. She does this a lot, and does it slowly, shifting her tongue around your outsized cum-tube to maximize the [pc.cumVisc] spatter she gets as reward. Your thighs clench and you buck forward, pushing a little deeper, and then she comes up for air, more foreplay, more creamy, tantalizing cock worship. Patient lilts, squelchy sucks, and tender squeezes - she does it all");
	if(pc.hasCocks()) output(" and then some, ensuring your extra " + (pc.cockTotal() == 2 ? "penis gets the stimulation it craves":"penises get the stimulation they crave"));
	output(". Tension bubbles up your mast" + (pc.hasCocks() ? "s":"") + ", unbroken streams of venting relief, and you lie back, body heat comfortably increasing, letting out a sigh.");

	// pc Has Knot (don’t append this if PC’s Canid dick is checked)
	if(pc.hasKnot() && !knotChecked)
	{
		output("\n\nOf course Bianca would play unto your [pc.knots]. Shudderingly sweet pleasure shoots through the bulky ring" + (pc.hasKnots() ? "s":"") + ", and you’re seeing stars when she sucks hard on " + (!pc.hasKnots() ? "it":"them") + ". <i>“This is my favorite part, [pc.name]. Make sure you get very hard and swollen here. A full knot is a happy knot, and a happy knot gets to pressure a certain doctor!”</i> The sudden squeeze to that place knocks the wind out of you, and your diaphragm goes numb - blinding bliss.");
	}
	// pc Has Balls
	else if(pc.balls > 0)
	{
		output("\n\nSquishing her face into your sweaty ballsack, Bianca whispers hot excitement into the churning orb" + (pc.balls > 1 ? "s":"") + ". <i>“You’ll cum everything for me, right?”</i> Gently hefting your " + (pc.hasFur() ? "spongy":"doughy") + ", sweltering musk cushion" + (pc.balls > 1 ? "s":"") + ", wet, pouting lips press against your bliss-tender diameters, kissing, smooching, pashing, licking for long, long moments. Her jaw spreads wider and wider, the puffy softness of her insensate mouth aggravating the sperm-packed tsunami tucked behind the rippling swell of your testicle{s}. Brimming, teeming with cream just out of reach, your ballsack teases her with the promise of a mighty ejaculation. From the glint in her purple eye, you know she doesn’t intend to waste a single drop.");
	}
	// pc Has Sheath
	else if(pc.hasSheath())
	{
		output("\n\nOral caresses to the slippery skin of your sheath play upon exceeding amounts of sensitivity. The tips of her fingers slip into the folded outer skin and caress circuits across your [pc.cockNoun]’s concealed flesh. You cry with delight, tongue lolling, the hidden paths reacting to rare affection with enough stimulus to cause a leithan to collapse in a heap of shorted-out bliss. Bianca smiles knowingly before tasting the obscene flavor of musk that she brought out, barely looking any different from you.");
	}
	// merge
	output("\n\n<i>“Thank you for the meal,”</i> the well-mannered fox trills before glomming down your meat");
	if(pc.cocks[0].cLength() < 7) output(", " + (pc.cocks[0].cType == GLOBAL.TYPE_EQUINE ? "sliding past the medial ring with a juicy smush and ":"") + "easily swallowing your [pc.cockType] mass to the [pc.knotBallsHilt]");
	else if(pc.cocks[0].cLength() < 14) output(", wincing and sputtering around your [pc.cockType] endowment as it reshapes her throat with quaking tension" + (pc.cocks[0].cType == GLOBAL.TYPE_EQUINE ? ". The medial ring of your equine schlong was the real motivator, and now it rests as a sort of capping boundard against her esophageal topside":""));
	else if(pc.cocks[0].cLength() < 20) output(" with a grunt and hack of significant effort. The sheer immensity of your [pc.cockType] mouth-wrecker breaks her jaw in to the aching nature of serving highly-enhanced dickmeat" + (pc.cocks[0].cType == GLOBAL.TYPE_EQUINE ? ". Your medial ring sits outside her lips; however, following a surge of adrenaline, she happily seats the leathery loop within her slavering suck-hole":""));
	else output(" as far as she can. You’re pulsing hotly in all the accommodating inches of your foxen throat-slut’s esophagus; her ears go flat and her tails bristle from the turgid immensity expanding her neck into a fat, tube-shaped onahole custom-made for your cock");
	output(".");
	output("\n\nBefore you, the vulpine doctor rises and falls with the indefatigable resolve of a servile cocksucker. Her voice has been repurposed into another pleasure delivery method, moans and groans and tiny whimpers vibing into your length. You start to buck into the pressurized embrace of her fervid throat, feeding her bottomless carnal appetite as prejizz and other effluent fluids stream from her gob. Spooge trails from your [pc.cockHeads] in thick ropes, lacquering her face in [pc.cumColor]" + (pc.hasCocks() ? " and lathering in her Midas-touched locks":"") + ". That wondrous feeling of being trapped in the heat of her bloated neck, hot, wriggling, writhing muscles savoring the tautness of your [pc.cockNoun], deserves a reward.");
	output("\n\nReaching over, you tousle Bianca’s hair into a handhold and start petting the bitch behind her ears. If she’s willing to debase herself, and get off to it (there’s a very good reason she took off her pants) then you’ll help maximize it. Good girl. That’s what you murmur, and groan, her ardor-inflamed interior more capable than the finest sex-aids on the market. Receiving headpats and praise");
	if(pc.cocks[0].cType == GLOBAL.TYPE_SUULA || pc.cocks[0].hasFlag(GLOBAL.FLAG_STINGER_BASED) || pc.cocks[0].hasFlag(GLOBAL.FLAG_STINGER_TIPPED)) output(" and too much dick-venom to be healthy");
	output(", Bianca is free to gorge herself on the wondrous, breed-ready hardness vanishing into her gullet, all while her twisting tongue waggles under the beefy [pc.cockColor] firmness sweeping through the silken curves of her fuck-cushions, passion-red pillows begging to be impregnated.");
	output("\n\nDr. Ketria gargles the unswallowed effluence pooling in her maw. All she can gulp is your cock, and the way she’s positioned ensures that it doesn’t spill - much. It’s smooth sailing for you, though - your [pc.cockHead] plows through the liquid pockets, freshly glazing itself every time it dips and plunges through her conquered neck. Gripping tighter, you force Bianca");
	if(pc.cocks[0].cLength() < 20) output("’s nose into the center of your sweat-caked pubic mound, holding her at the base of your crotch for no more than five seconds");
	else output(" down the pillar of your virility - she’s simply not built to take all of it, but take most of it she does, with a painful gurgle");
	output(". As she blows you" + (pc.balls > 0 ? ", rolls your [pc.ballsNoun] between her fingers":"") + ", maintains perfect eye contact, you admire her. In all walks of life, she is a professional, and there’s nothing hotter in a woman.");
	output("\n\nBianca’s pussy-wetted hand comes up - she’s been masturbating. Flavoring your [pc.cocksLight] with the hormonal discharge, you sense new energy in her movements. Hands on your [pc.thighs], lips bending and bowing around the words she writes on your phallus, she nods and bobs and <b>thrusts</b> her neck as if this were an exercise routine. Simultaneously, her wobbly ass floats up in the background like a rising sun as she sinks lower in grandiose supplication, lathing your inseminator with her tongue, erotically fixated on being facefucked that she seems barely conscious of you, shuddering in orgasm");
	if(pc.hasCocks()) output(" as your other" + (pc.cockTotal() > 2 ? "s":"") + " bounce and rub against her head");
	output(". She looks happier than a service-slut.");

	output("\n\nMilf cunt-stench hits your olfactory sense a moment later, the whole pistoning gyration of her body simulating procreative doggystyle. You ram forward, bucking into her jaw, powered by animalistic stubbornness. " + (pc.hasKnot() ? "Your [pc.knot] batters against the tender rim of her mouth with conquering force. ":"") + "Rivers of slime spray from the corners of her upquirked mouth. Purple pupils twitch in the haze, thin lines of violet shine lingering on your retinas. You mentally recoil as the thirsty suction of Bianca’s mouth closes around your penis, clamping down in a noisy slosh, cheeks hollowing in an elongated suck that breaches your restraint. Vision-darkening sensations of intense pleasure leave you frozen in a soporific state, paralyzed by urgent bliss to the point you can only manage a single tiny gasp that doesn’t register. Frenzied climax does, and the wind-up - Bianca pulls away, lets your [pc.cock] throb in the air, and impales herself on it in those moments before ejaculation.");
	// pc Cum Low
	output("\n\n[pc.Cum] distends the size of your socketed dick");
	if(pc.hasCocks()) output(" and " + (pc.cockTotal() == 2 ? "the one":"those") + " unsheathed");
	output("; grasping waves of tension wash through your [pc.cocksLight], spurting delicious tendrils of [pc.cumFlavor] seed past the doctor’s blushing lips, her satiny tongue frantically whipping the [pc.cumVisc] globs from your spearing prick. Her oral interior clenches like a blissfully-bred twat before slackening exhausted, only occasionally squirming.");
	if(pc.hasCocks()) output(" Hot, thick ropes of arcing spooge nestle in her hair and in the fuzz of her ears, long strings of orgasm dripping from her gorgeous features.");
	output(" You thwack her in the face," + (pc.balls > 0 ? " churning out the [pc.cumGem] contents of your nutsack":" ramming her full of [pc.cumGem] nut") + ", eliciting squeals of happiest appreciation. Back, and in again, the physician’s elasticity contracts into ‘harvest all of my lover’s spunk’ mode, all while you drift back, amethyst glow tinting your shut-eyed darkness.");
	// pc Cum High (add-on to Low)
	if(pc.cumQ() >= 4000)
	{
		output("\n\nYou find your voice again, another suck renewing the gushing of sperm-packed gallons. You jolt open to find Bianca closer than before, hugging your waist. The torrential volume of your seed saturates every ounce of her digestible tract. [pc.CumColor] cream spills into her expanding body, swelling outside the range of a healthy BMI. [pc.CumGem] fountains of fox-glossing volume squirt and rage from her lips in [pc.cumVisc], the excess dribbling from her nostrils. For the first time since starting, Bianca’s brow furls in stress, yet she refuses to give any ground, refuses to waste anymore. Watching it helps you reach your absolute apex, and your cumslit explodes like a volcano, the thickest lines of sperm yet rocketing into her belly with impacts that reinforce the potency of your virility, pumping out of all control.");
		// pc Cum Hyper (add-on to High)
		if(pc.cumQ() >= 10000)
		{
			output("\n\nExtremely filled, indescribably ravished, Bianca can’t maintain grip. A pained yelp breaks through the cock-sludge stuffing her fattened midsection and the channel connecting to it. Before she chokes, she pulls herself off your [pc.cockType] member and sputters, your gooey issue still firing on all batteries. Thinking fast, Bianca catches her second wind and hefts her bosom to catch the spatter, wrapping your cock-skin in passion-tinged maternity, letting it burst out in her cleavage and all over it. She actually giggles, sighing in contentment, quietly waiting out the magnificent shower of your hypersexual cumsplosions, cocooning her in every last drop of your completely empty " + (pc.balls > 0 ? "[pc.ballsNoun]":"loins") + ".");
		}
	}
	// merge
	output("\n\nBy the time you’ve calmed down, you’ve gone soft in");
	if(pc.cumQ() >= 10000) output("Bianca’s mouth");
	else output("Bianca’s breasts");
	output(". When she ");
	if(pc.cumQ() >= 10000) output(" recedes and ");
	output("opens her eyes");
	if(pc.cumQ() >= 10000) output("... well, you don’t see them, because you’ve drenched her glasses. Fortunately, she takes them off - now you can, and she looks very pleased!");
	else output(", the fox-mom looks incredibly pleased");
	output(". <i>“My, you must have been very pent-up, [pc.name],”</i> she laughs, kissing your [pc.cockHead]. <i>“Or were you just that happy? Well... let’s get cleaned up. As best we can, of course...”</i>");
	output("\n\nHer tits jiggle, and you let out a wheezy gasp.");
	output("\n\nShe’s the best. Do you even deserve her?");
	processTime(25);
	bianca.loadInMouth(pc);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

// pc Has Pussy Only
public function biancaPussLickinChickin():void
{
	clearOutput();
	showBiancaVDay();
	//By custom request.
	showBust("BIANCA_LINGERIE");

	// pc Kind
	if(pc.isNice()) 
	{
		output("<i>“Your fingers - please, start slow, and... build up,”</i> you ask, [pc.thighs] tightening up with every word. <i>“Then... blow my mind.”</i>");
		output("\n\nLifting her chin, Bianca nods with a libidinous glint in her eyes. Sweet torrents of [pc.girlCumFlavor] girl-musk trickle from your [pc.pussies] the moment her finger touches down, like she just connected you to an electrical current. It starts slow and ramps up, artfully twirling fingers unraveling your thoughts like holiday ribbons. It’s completely overwhelming and she hasn’t even gone inside - that’s because she’s focusing on your [pc.clits], and the outer brim of your [pc.vaginaColor] femininity. You can hear her giggle when you bite down on your lower lip, trembling bonelessly, blissful sparks playing across your glistening mons.");
	}
	// pc Misch
	else if(pc.isMischievous())
	{
		output("<i>“Weelll, I think your tongue will be perfect for this part!”</i> You grin a silly grin. There’s no hiding the [pc.girlCumVisc] lubricant coursing down your inner thighs. <i>“You said you wanted to eat me right up, so why wait?”</i>");
		output("\n\nBianca licks at her lips, ears folding back. Diving into your groin, a dog-like lick hungrily laps northwards on your [pc.vagina]");
		if(pc.hasVaginas()) output(" and then the other" + (pc.totalVaginas() > 2 ? "s":""));
		output(", flicking off your [pc.clits]. Slender fingers cup around your lust-swollen mound" + (pc.hasVaginas() ? "s":"") + ", squeezing the bundle" + (pc.hasVaginas() ? "s":"") + " of vaginal nerves together; Dr. Ketria audibly slurps at your [pc.vaginaColor] slit, and you nearly lose it, feeling her breath and her tongue slithering up the latex-sensitive parts of your muff’s exterior; rhythmic suckles to the opening make you whimper in enjoyment. As she flosses your cunt, a needful whine bursts from your throat - you quiver in your seat on the verge of cumming.");
	}
	// pc Hard
	else
	{
		output("<i>“I don’t care how you start, but I want your all,”</i> you say, injecting ample authority into the request. <i>“I want it hard and fast.”</i>");
		output("\n\nThe fox-mom cocks her head to the side, bright smile widening. Your facade ruptures when she stabs her tongue into your [pc.pussy] without any warning or buildup. Before your body can register the penetration with a tight clenching, she’s already thrashed your sensitive clusters into leaking [pc.girlCumFlavor] sex-juice. Shockwaves of bliss catch up in short order; her tongue isn’t modified, it’s a normal human organ, but the way it deflects and twists and twines and coils inside puts longer, bestial endowments to shame. Still not satisfied, Bianca’s cunt-licking swells from merely riding the edge to orgasmic staccato, cunnilingual talent discovering your voice.");
	}
	// merge
	output("\n\n<i>“Mwah!”</i> Milf-flavored kisses are planted on the outskirts of your spit-soaked delta. <i>“Did you like that?”</i> Bianca asks idly, head rocking from side to side; her fingers follow the motion, slowly sliding towards the bottom and up, and then the top and down; her eyes gleam in anticipation. <i>“You don’t need to tell me - your body already is. If only you could see what I see.”</i> Presses, touches, little squeezes. Lusty fondles. <i>“The way your vagina shines. How wet it is. My my, [pc.name],”</i> she samples the freshest fruits, forefinger flourishing around the hood. <i>“You’re a horny [pc.boyGirl].”</i>");

	// pc Canine/Vulpine/Korgonne Pussy
	if(InCollection(pc.vaginas[0].type,[GLOBAL.TYPE_CANINE,GLOBAL.TYPE_VULPINE,GLOBAL.TYPE_KORGONNE]))
	{
		output("\n\nHotter, and hotter - your canid cunt swells up before the dilated eyes of a giddy caregiver. <i>“Ooh, the best part!”</i> Bianca’s knuckles provoke a pussy plumpening the likes of which steal the air out of your lungs, abusing your extra-needy gash. <i>“A canine pussy; you know, I could have gotten one like this, but I chose not to. There was a very good reason I didn’t, and it was... difficult. These pussies have a wonderful smell, and are perfect for taking knots!”</i> She hisses the last word, bobbing her tongue around your blooming petals. <i>“Well, I liked mine better, for starters!”</i> A laugh, and more teasing. <i>“But also, because I wanted my husband to <b>work</b> for it. You’re a very naughty [pc.boyGirl]...”</i>");
		output("\n\nThe look she gives you is sexually ominous.");
	}
	// pc Feline Pussy
	else if(pc.vaginas[0].type == GLOBAL.TYPE_FELINE)
	{
		output("\n\nA single finger quests into the vice-like tightness of your [pc.vagina], testing its firmness and elasticity. <i>“Mmm, kaithrit vagina... always a treat. It seems so harmless and innocent from the outside, plain and featureless, small" + (pc.vaginalPuffiness(0) > 0 ? "... err, usually, but I can tell you’ve been up to some plumping shenanigans, [pc.name]":" and provocative") + "!”</i> Her efforts excite without overt stimulation - she’s so unhurried, looks so in control. It frustrates you terribly. <i>“Its evolved so nicely next to the women of their race. If you want to breed it, you have to be strong and determined. But, I don’t breed like that, [pc.name],”</i> Bianca glares, full of pride. <i>“I know <b>exactly</b> how to overcome it, <b>and</b>...”</i> At the nadir of your pussy, she whispers, <i>“...overwhelm it.”</i>");
	}
	// pc Equine Pussy
	else if(pc.vaginas[0].type == GLOBAL.TYPE_EQUINE)
	{
		output("\n\nBianca’s smile turns upside down when she wedges her nose against your [pc.clit] and sniffs from the hood of your musky mare muff. Then she sniffs again. Saliva drools from her lips. Again. <i>“Mmff...”</i> she huffs, heavy sweat moistening her front fringe of hair. <i>“Equine vagina - a staple of laquines,”</i> she sighs dreamily, running her fingers across the [pc.vaginaColor] lips of your impassioned horsecunt. <i>“Those pheromones have the same effect on everyone, whether or not they carry a penis. It’s so... powerful. And I love it.”</i> Eye contact is impeccably maintained as she kisses your latex-smooth trench up and down; the sensation causes you to ");
		if(!pc.isSquirter()) output("cum a little");
		else if(pc.wettestVaginalWetness() < 5) output("spurt");
		else output("squirt");
		output(" on her face. A thumb rises to collect it, and then it’s sucked clean. <i>“I can’t wait to have it all over me.”</i>");
	}
	// pc Gryvain Pussy
	else if(pc.vaginas[0].type == GLOBAL.TYPE_GRYVAIN)
	{
		output("\n\nPlanting a palm to the mouth of your clit-less cunt, Bianca inquisitively pressures the inner walls with a single probing finger, finding one of the many interior nubs texturing your dragon-slit - more potent than a regular clitoris. <i>“Hee hee,”</i> she giggles, pushing on it as though it were the comical big red button that should never be touched, thus encroaching the rest of your special muscles. <i>“Gryvain vaginas... you’re in for a treat, [pc.name]. In fact, I think you’re in for a mental breakdown.”</i> The doctor growls cutely and detonates another cache of sexual euphoria. <i>“Mmhm, I didn’t mean that to sound so cruel. But, you <b>are</b> the one with a very... particular pussy...”</i>");
	}
	// pc Suula Pussy
	else if(pc.vaginas[0].type == GLOBAL.TYPE_SUULA)
	{
		output("\n\nSaucy, knowing purrs wash over the springy exterior of your aquatic cooze, an erotic undercurrent to the faintly swishing venomous stingers reaching out for Bianca’s fingers. Up ‘til now, they haven’t been able to match her vulpine wiles. <i>“Suula biology, oh me oh my, [pc.name],”</i> she muses, elusively tracing the outline of your sharpy-snatch. <i>“I think... you’ll cum first. No matter how much of this aphrodisiac you spike my mouth and hands with, I won’t lose to it.”</i> The doctor yanks away before a sneaky tendril can get close enough. <i>“Considering how lovely it smells, I don’t think I’ll even notice, hehe.”</i>");
	}
	// pc Else
	else output("\n\nBianca loves you for who you are, or, specifically, what you are: an incredibly sensitive instrument. With finger and tongue and lip, she gorges herself on your [pc.vaginaColor] vagina, slurping at the sweet [pc.girlCumColor] flumes of girly-jizz burning into the softest parts of your inner thighs. <i>“This is what I was made to feel every night my husband and I made love. I can’t do to you what he did to me afterwards,”</i> she smiles simply, <i>“but I can make you feel like you are the most loved [pc.boyGirl] in the universe.”</i> The fox-woman spreads your opening with a powerful flex, and you swallow hard, eyes crossing from the pleasure. Visible fuck-fog rises from your over-aroused hole. <i>“Just you wait, [pc.name]. What’s about to happen to you will be the best orgasm you’ve had all year. And maybe next year... I can do it again, heheh.”</i>");
	// merge
	output("\n\nMapping the shape of your" + (pc.vaginalPuffiness(0) > 0 ? " obese":"") + " quim, Bianca closes in from the outskirts, as if ushering all the heat and pleasure towards the center of your crotch. The vixen physician lays her tongue flat against " + (pc.hasVaginas() ? "a":"the") + " slit and starts slow again, bristling organ swabbing the outside clean of sweat and juice. Glottal hums coax your [pc.pussiesLight] into swelling a bit thicker. This is real stimulation - it’s more than exciting. It’s a consistent, concentrated effort that’s gradually pushing you upwards, taking your hand and ascending to the peak of ecstasy, sharing your temperature unto herself. In other words, the prognosis is good.");

	// has Suula Pussy
	if(pc.vaginas[0].type == GLOBAL.TYPE_SUULA)
	{
		output("\n\nWell, it would have been, had you not gotten yourself hooked up with a suula’s cunt. A forest of vacillating cilia lay into the plush, eminent slopes of Bianca’s slobber-slathered lips. Small squeals rebound through your cunt, fresh loads of spittle streaming out around your trick genitalia. Now spiked with chemical lust and getting a higher dose by the second, Dr. Ketria’s libido ignites, and she goes at you with an inexpressible fervor, losing herself to the brilliant, blissful sensations.");
	}
	// merge
	// pc Multivagina
	if(pc.hasVaginas())
	{
		output("\n\n<i>“More than one - more than one vector,”</i> Bianca giggles, plastering your assortment of pussies in saliva-covered marks. Wet little kisses that reek of pussy-licking. You squeal from the multi-pronged assault, from the fingers in both holes, working in alternating patterns, and the tong, darting from [pc.clit] to [pc.clit]. Everything is <b>heaving</b> and <b>wetness</b> and swooning, but the lusty fox gives no quarter. Occupying the front and back half of your brain is a sensory experience that crashes the limits of your system. Rapid and feverish shudders rip through your body as you ");
		if(!pc.isSquirter()) output("paint");
		else if(pc.wettestVaginalWetness() < 5) output("spray");
		else output("squirt");
		output(" her with your [pc.girlCumFlavor] approval.");
	}
	// pc Pussy Pumped (must have a flag)
	if(pc.vaginas[0].hasFlag(GLOBAL.FLAG_PUMPED) || pc.vaginas[0].hasFlag(GLOBAL.FLAG_SLIGHTLY_PUMPED) || pc.vaginas[0].hasFlag(GLOBAL.FLAG_HYPER_PUMPED))
	{
		output("\n\n<i>“Haaa, there’s just so much [pc.name] I can’t decide where to go and what to do!”</i> huffs the feminine caretaker. You lack the mindspace to puzzle out her concerns because of the great volume of sexual information it’s forced to read. Yes, your [pc.pussiesLightIsAre] fat, chubby, and deliciously aroused, and ");
		if(!pc.hasVaginas()) output("its");
		else output("their");
		output(" sheer resolution is capable of bombarding you with the greatest amount of bliss from the tiniest brushes with tender flesh. Gentle kisses are planted over your mons; cherry-red lips flit across your labia; the texture your hole" + (!pc.hasVaginas() ? " is":"s are") + " able to comprehend is out of this world, and only reinforces the joy of having <i>more.</i>");
	}
	// merge
	output("\n\nWhite-tipped fox ears twitch to a happy blur, practically vibrating as Bianca sinks into your slopsome depths. [pc.VaginaColor] pussy-walls, saccharine with hot goo, part for the doctor’s insistent thrusts. The way she drums your outermost brim causes you to thrash and flail, grabbing onto those big, pettable ears for dear life. Given something to do while she eats you the hell out, the lady Ketria plays you like a fiddle, now aware that pleasing you better leads to better enjoyment for herself. Your [pc.fingers] dig into the bases of her ears, scratching and pressing. Base animal pleasures interweave, and you shake in another small orgasm.");
	output("\n\nDazzling cherry lips press against you from every angle, deep tongue-strokes rubbing them hard against your lust-swollen nethers. They gleam, attracting all the light unto themselves. Ruby shine mixes with the amaranth glow a few meters above them, impossible to ignore. Bianca knows how to purse them, how to clench them, how to make those o-shaped pillows suck with the right amount of organic pressure that copious ear pampering seems insufficient as a reward. They’re so pouty, so <b>silky smooth</b> that you’d love to feel them all over [pc.skinFurScales] too. Dr. Ketria is a kisser with few equals, that much is true - but you weren’t prepared for it down there. You can never be.");
	output("\n\nYour [pc.eyes] cross, stunning ecstasy intensifying down there. Her tongue is everywhere, working like your pleasure is the only thing that matters. [pc.Thighs] quivering, you lock your [pc.thighs] around her head and burying her face in beautifully-soaked pussy; she has no trouble supporting your weight, grabbing hold of your hips and, with a deep, guttural growl, hefting you upwards. Crotch splayed in the air, you lose all sense of self-control and presence in the moment. Your pussy is all that exists. Maybe it’s the only part that has.");

	// pc Has Breasts
	if(pc.biggestTitSize() >= 1) output("\n\nDazed and on the verge of collapse, you quickly grab hold of something else that’s hard and firm - your [pc.nipples]. The rough groping gradually moves to encompass your [pc.breasts]. [pc.Fingers] squeeze into the jiggly flesh of your [pc.skinFurScalesColor] chestflesh, inelegant technique filling your head with the magic of titty delight. Her giddy tongue forces your over-stimulated body to orgasm on command, and the ooey-gooey feeling in your head melts like wax down the walls. Oozing, sweltering ecstasy.");
	// pc Milky
	if(pc.isLactating()) output("\n\nClimax gets wetter. Boobs like to have fun, too. That’s why the [pc.milk] sloshing around inside finally bursts free on the next release. Sweet arcs of [pc.milkFlavor] bounty squirt across Bianca’s brow, webbing in her hair like some kind of perverse conditioner. Seeing how good you’re starting to feel, she, of course, ruthlessly assaults your orgasm-taut body into doing that some more. Pretty soon, [pc.milkGem] torrents fountain from your boobs, flumes of profound pleasure, and you cradle your chest as she drains you above and below.");
	// merge
	output("\n\nBianca’s hug around your lower section tightens into a vice, the cunt-milking tip of her tongue curling around your G-spot. It’s at this point her eyes shut tight in absolute concentration; undulating tingles shiver towards your womb, like a jacuzzi on slow-jet mode. As all affections before it, this ramps up slow, and then quickly, brilliant writhing velvet connecting your core to this circuit of glee. You can’t be blamed for the sounds you make - not even the most in-control courtesans could maintain an air of propriety. Your willpower splinters faster than most, Bianca gulping your eddying flows in lurid gulps, searching for the real orgasm tucked away inside you, gradually emerging at the skillful urgings of her flicks, sucks, and coils.");
	output("\n\nA sensation occurs here and now that you didn’t even know <i>could.</i> You suffer a moment of hearing loss as time dilates. You’re sure you inhale at the same time, but you can’t let it go. You can’t exhale. You become like a still painting - and then, your body lets something else go.");
	// pc Is Squirter
	if(pc.isSquirter()) output("\n\n[pc.GirlCum] explodes from your [pc.pussies], pheromone-charged arousal spraying with wanton force. The ecstasy of climaxing cunt bathes Bianca’s calm visage in powerful, brain-locking gouts. Avalanches of [pc.girlCumVisc] release pump into and onto the fox’s face; you achieve a sort of zen-like state of mind, throbbing and pulsing, bleary-eyed as nerve-packed flesh sprays with explosive force. Her cheeks bulge with the output, and the hellish chain of sapphic excess further erodes your paralyzed consciousness. [pc.GirlCumGem] cascades hang and drip and swing from the doctor’s face, transforming her into a modern art piece. Helpless, you practically ragdoll, no escape from your one and only sensation: gushing.");
	// pc Is Medium Wetness
	else if(pc.wettestVaginalWetness() >= 3) output("\n\nThe first shot of [pc.girlCum] is a squirt, conjuring up emotions of great, shocked shame and total embarrassment. You’re not a natural squirter. You know that. But Bianca’s aroused you to the point it was possible - the steady, gushing flows of [pc.girlCumFlavor] ambrosia that follow seem hollow and weak in comparison to that, and having splattered her with a thick burst of girlish lust was better than you could have otherwise believed. <i>Now you want to be a squirter.</i> You want to coat her in your output, do more than make her slurp and gulp. As you sag into your seat, trembling in overwhelming ecstasy, your conscience becomes unbalanced. You can still feel her tongue tracing in and out, ensuring that your spasms never cease. Not until you run dry, a midden lump of sapphic exhaustion.");
	// pc Is Not Very Wet
	else output("\n\n[pc.GirlCum] dribbles appreciatively, not a single drop missed by the fox-slut’s accurate tongue. Keeping your snatch impaled, Bianca quaffs the [pc.girlCumFlavor] nectar even as she harvests more. Pneumatic shockwaves of directed force thread into your core, igniting fireworks of bliss; your eyelids close, the only control left in your body being used to recede into a darkness where there is only ecstasy, climax, and [pc.girlCumGem] euphoria. The purple haze of Bianca’s glowing eyes follows you hear, tinging the void with spasms of color; the happiness you feel being milked brings you down gently.");
	// merge
	output("\n\nRealigning with reality, Bianca is there to greet you when you ‘awaken’, goofy grin and narrowed eyes. She wears your [pc.girlCumNoun] like a supermodel trying out the latest in fragrant, sparkling masks. Before long, your breathing steadies... and then she wordlessly crawls up on you and brings you into a kiss, hugging you so very close.");
	output("\n\nIt brings a small tear to your eye. To be so loved. To be so protected.");
	output("\n\nTo be so wanted.");
	processTime(35);
	bianca.girlCumInMouth(pc);
	pc.orgasm();
	pc.orgasm();
	pc.orgasm();
	//[Next] \\ Go to [FINISHED]
	// sceneTag: processTime
	// sceneTag: PC Orgasms
	clearMenu();
	addButton(0,"Next",finishUpWithBianca);
}

//[Buttjob]
// Tooltip1: Bianca’s big ass makes your breath catch every time you see it. Burying your [pc.cocks] between it would be the perfect capstone to this evening...
// Tooltip2: Damn. <b>You don’t have a penis,</b> so you can’t get a buttjob from the fat-assed milf. That’s very unfortunate!!
// PC pushes Bianca against a thing and strips her down, then fucks her ass cleavage. Cums all over her plump cheeks and in her tails.
public function buttjobFromBianca():void
{
	clearOutput();
	showBiancaVDay();
	//By custom request.
	showBust("BIANCA_LINGERIE");
	output("Bianca watches silently as you crawl up on her lap and reach your [pc.arms] under hers, stroking down her waist and filling your [pc.hands] with the immensity of her peach-shaped tush. A distinct, juicy hardening process is going on in your [pc.cocks], once-repressed urges inflating your ");
	if(pc.hasCocks()) output("multiple members");
	else output("[pc.dickSkin]");
	output(". ");
	if(pc.isNice()) output("<i>“Will you use your ass, Bianca?”</i> you request with a lopsided smirk. <i>“Squeeze me between your cheeks, and let me cum all over you. Is... that too much?”</i>");
	else if(pc.isMischievous()) output("<i>“I have an idea,”</i> you grin, delivering an open-palmed slap to one hemisphere. <i>“I want my cock between these...”</i> For some reason, your breath catches. Asking the question leaves you feeling hornier than a kaithrit futazon in rut. <i>“...It’ll be fine, right? " + (silly ? "My anaconda wanting":"Sticking my dick between") + " your big, beautiful buns...”</i>");
	else output("<i>“I’d love a woman with your kind of ass slapping bouncing on my lap,”</i> you grin, slapping one of the hills to a jello-quake. <i>“I want my cock between these. You can do that, right?”</i>");
	output("\n\nThe fox-mom raises her elegantly-trimmed eyebrows. <i>“My my, [pc.name].”</i> She simply takes off her glasses and sets them on her discarded coat, leaning in to kiss your forehead. <i>“Of course I’ll do that for you.”</i> Like a sleeping soldier hearing the morning reveille, Bianca bolts upright, pushing you back into the");
	if(biancaIsCrew()) output(" bench");
	else output(" wall");
	output(" with a sturdy knee. <i>“Let’s get ready, then.”</i> Skillful hands roam across your [pc.belly], rubbing at too-sensitive places. <i>“You first.”</i>");

	// pc Crotch Not Exposed
	if(!pc.isCrotchExposed())
	{
		output("\n\nBianca breathes over the bulge in your [pc.crotchCovers], cheeks turning pink. <i>“I wouldn’t dream of having you undress on your own, if I can help it. I love... this part so much. But you knew that, ehe...”</i> The glow from her eyes intensifies, radiating pure, wanton cock-lust as her digits travel the mound of confined virility. Quickly discerning the make of your gear, she opens your groin with absolute reverence, breathing in the first notes of " + (pc.isHerm() ? "herm-":"") + "musk filtering out. <i>“Mmmm... your smell always pleases me, [pc.name].”</i>");
		if(pc.cocks[0].cLength() < 7) output(" Your [pc.cocksLight], once stuck to your thigh, throb upwards and out of imprisonment, wet and rock-hard in a half-glaze of [pc.cumColor] prenut.");
		else if(pc.cocks[0].cLength() < 14)
		{
			if(pc.cocks[0].cLength() < 12) output("Nearly a");
			else if(pc.cocks[0].cLength() > 12) output("Over a");
			else output("A");
			output(" foot of [pc.cockType] meat bursts out, [pc.cockHead] bopping her on the chin with a glob of [pc.cumColor] precum.");
		}
		else output("Your pleasure-fattened girth grinds its way out without help, ripening into an oversized pole of inseminating power, beading fat wads of [pc.cumColor] oil.");
		if(pc.balls > 0) output(" She pulls your gear down the rest of the way so that your [pc.sack] and its " + (pc.balls > 1 ? num2Text(pc.balls) + " passengers":"single passenger") + " can slip out.");
	}
	// pc Crotch Exposed
	else
	{
		output("\n\nNowhere near erect enough for her, Bianca takes charge of your [pc.cocksLight] and captures the [pc.base] in the middle gap of her fingers, stroking your twitching boner" + (pc.hasCocks() ? "s":"") + " to full, upright mast");
		if(pc.balls > 1) output(", rolling your [pc.balls] in her separate hand");
		output(". <i>“I love cock, [pc.name]. I would never deny it. The hot, hard feeling in my palms, the sweet, rich scent, like rain on molten rock - it’s always a delight.”</i>");
		if(pc.hasCocks()) output(" The ambidextrous doctor makes sure " + (pc.cockTotal() == 2 ? "both of your":"each of your several") + " tools are brought to full mast.");
		//biggestCockSize<7: 
		if(pc.cocks[0].cLength() < 7) output(" Your [pc.dickSkin] swells to complete rigidity, an obviously-pleased glow in your lover’s eyes.");
		else if(pc.cocks[0].cLength() < 14) 
		{
			output(" [pc.DickSkin] swells ");
			if(pc.cocks[0].cLength() < 12) output("close to");
			else if(pc.cocks[0].cLength() == 12) output("to");
			else output("over");
			output(" a foot in length, high enough for her to lay a kiss on the [pc.cockHead] - her glowing eyes cross in distracted bliss.");
		}
		else output(" Rising above her station, your [pc.cockNoun] casts a musky, aromatic shadow of thick maleness across the fox-slut’s fervor-flush visage. Her tongue flits out for a tiny taste - she loves it.");
		if(pc.balls > 0) output(" A teasing finger strokes the diameter of your ballsack, collecting a shimmering bead of nut-scented sweat for her efforts - watching her slurp it up causes an ejaculatory <b>tic.</b>");
	}
	// merge
	output("\n\n<i>“There,”</i> she husks, <i>“that’s what I wanted to see. My dear [pc.name] all hard and potent, showing me [pc.hisHer] expression of powerful lust.”</i> She sniffs right from the center of your semi-dilated urethra, quivering red lips warring against her teeth. <i>“Now, don’t look away,”</i> she winks. <i>“I’m going to do my best to ruin other girls’ butts for you.”</i> She strokes your sensitive flesh up. <i>“I want you to paint my cheeks in your virile [pc.raceShort] seed.”</i> Down - her hands go down...! <i>“I want you to get it in my tails.”</i> Up! <i>“I want there to be webs of <b>your sperm</b> clinging to my fur. I want to <b>smell it</b> when I wake up and step into a shower.”</i>");
	output("\n\n[pc.CumGem] spheres of slippery dribble into a slippery slurry, oiling your [pc.cocksLight] in feverish lust. Now that the sensual, sultry cock-fiend has turned you into a beast immobilized by [pc.hisHer] animal urges, she stands up all the way and pivots in preparation, agonizing you with long strokes of her divine derriere. She takes great pleasure in everything, even bending back to fill your field of view with the mind-melting vista of foxen rump. <i>“Watch me closely, [pc.name], hmhmhm,”</i> she titters, <i>“watch me properly. Stare at it like you want it more than anything else.”</i>");
	output("\n\nSlitted violet eyes peer over her shoulder as she unfastens her belt and goes through the visibly arduous process of pulling her extremely tight pants down. As volumes of tension ease off Bianca’s bulging rear, more glorious, champagne-hued detail is revealed, like darkness being vanquished by morning light. The strap of her black and pink-lace undies comes into view, and you blush madly, unable to look away from the spellbinding sway of her maternity-fattened curviness. <i>“Nnmm, it’s always... so difficult... but worth it...! Ah!”</i> With one final, relishing tug, the enormous mounds of Dr. Ketria’s enormous, buttery behind burst free, tasting freedom with a galaxy-class wobble. <i>“Ahhh... and now...”</i>");
	output("\n\nA happy twinkle brightens the golden fox’s radiant eyes as her ascending fingers, sunken halfway into the pliant, firm flesh of her generous posterior, hook into the straps of her pussy-juice soaked undies and drag them down with considerably less effort. Being halfway to seven-feet tall and enduring the stresses of motherhood makes the full appearance of her sweat-dappled crack a shock strong enough to cause heart failure. Quivering, gapless thighs hover mere inches away from swallowing your [pc.cocksLight], perfect round ham-jiggle titillating your loins with breeding instinct. <i>“I’m not embarrassed at all for you to see me like this, [pc.name],”</i> Bianca says, leaning into an appealing L-shape so that you can admire the texture of her blessed thickness, golden tail-fluff indiscreetly fanning her pheromones around. <i>“Are you ready?”</i>");
	output("\n\nRocking in reverse, the fox-themed woman’s exaggerated heft begins to smush against your undergirth. Oh fuck. <i>“I want to hear you say it.”</i> It’s impossible! Not when she’s cocking her hips like that! Each movement against your fervid meat mimics the foam-crashing lap of an ocean wave! <i>“You could see how soft it is - now you can feel it. Look how close it is to making you feel good. Doesn’t that please you, [pc.name]...?”</i> Yes! Yes it does! <i>“Please say it...”</i> Hypnotic, twerking swivels - she knows how to shake it. She’s an all-natural stripper giving you a free lapdance, emphasizing once-compressed birth-ready proportions. There’re so many reasons she <i>has</i> to keep her power level limited.");
	output("\n\nYou finally muster the words. <i>“");
	if(pc.isNice()) output("I need your butt, please!");
	else if(pc.isMischievous()) output("Sit on me, I need it!");
	else output("Take me already! I can’t wait any longer!");
	output("”</i>");
	output("\n\n<i>“Hee hee,”</i> one of her tails tickles your [pc.cockHeads], provoking a passionate splurt. <i>“I hope you don’t mind if I sit here, then.”</i>");
	processTime(35);
	pc.changeLust(pc.lustMax());
	clearMenu();
	addButton(0,"Next",biancaButtjobberduo);
}

public function biancaButtjobberduo():void
{
	clearOutput();
	showBiancaVDay();
	showBust("BIANCA_LINGERIE");

	output("Bianca’s lower ass presses to the top of your [pc.thighs] and wiggles, sliding your [pc.cocks] atop the great divide separating her yielding bubble-cheeks. <i>“Mmm,”</i> she hums with a broad smile, small, sensual, <b>clapping</b> whirls of her enormous posterior gradually drawing your girth" + (pc.hasCocks() ? "s":"") + " into the soft vale of her pristine buttocks. More of her tugging and teasing weight shifts onto your [pc.legOrLegs] over time until she’s firmly sat in your lap, grinding into your body with carefully controlled desire until your");
	if(pc.cocks[0].cLength() < 14) output(" [pc.cocksLight] vanish into her rolling ampleness");
	else output(" [pc.cocksLight] are resting against her taint, [pc.cockHeads] jutting out from her crack and brushing into her tails’ base");
	output(".");

	output("\n\n<i>“Does it feel good?”</i> Bianca asks, moving her floof out of the way, letting you enjoy the pudgy squish of her plentiful backside as it humps in up-and-down motions, too slow for real stimulation, but fast enough to drive you insane. <i>“I’m going to milk you, [pc.name]. I can’t wait to feel you cumming there, between my ass cheeks...”</i> By now you’re so aroused that you’re practically streaming precum, and it’s coating the fleshy globes of her butt in a shiny [pc.cumGem] gloss.");
	if(pc.cockTotal() >= 3) output(" Whilst the first two of your phalli can fit comfortably in her vast mass of ass, it’s your " + (pc.cockTotal() == 3 ? "third":"others") + " that get to take a trip between her thighs - there’s some leveraging ache, but fucking hell, the sensations are out of this world.");
	output(" <i>“Shall I start? Oh - please feel free to touch. I want you to enjoy my butt.”</i>");
	output("\n\nAnother soul-tickling giggle and you immediately arch back, groaning in oboe pleasure. Bianca puts her ripe heinie to work, cycling through an aggressive series of bounces and claps and other");
	if(pc.balls > 0) output("ball-busting");
	else output("prostate-milking");
	output(" patterns. Her jouncing bulk hits you with the right amount of chunk and force that you can feel bolts of lust rip through your limbs, feel your fingers jut out. Each tumescent pump through the fox-woman’s fathomless chassm massages your cumvein into spitting streamers of bubbly prenut used to enhance the next thrust. You’re mercilessly teased in one of the most procreative positions there is, drooling from above and below as the convivial doctor’s tranquilizing gyrations soothe you into mirthy euphoria.");

	// pc Has Horsecock
	var knotStuff:Boolean = false;
	if(pc.cocks[0].cType == GLOBAL.TYPE_EQUINE) output("\n\n<i>“Horsecock... mmffmm, that strong, proud shape. I can feel the flare folding inside me every time I move. I can feel the slippery folds of your sheath at the very bottom of my butt, [pc.name].”</i> Bianca looks over her shoulder, panting - at the same time, your mare-member’s fleshy mesa swabs through her crevice. <i>“It’s going to cum so hard that I’ll probably get turned on by the phantom sensation.”</i> It’s a wonder how you keep your head in the face of her sincere dirty talk. It’s all obvious, but she really does make it seem like your pleasure, and your orgasm, are all that matters. <i>“I love your cock, [pc.name],”</i> she giggles, clenching her fat expanse on the nerve-tender terrain of your stallion shaft. <i>“Everything about it. It makes me feel like I deserve to be bred, and that you’re the one who’s going to do it. Don’t let me down, okay?”</i>");
	// pc Has Canine/Vulpine Cock
	else if(pc.cocks[0].cType == GLOBAL.TYPE_CANINE || pc.cocks[0].cType == GLOBAL.TYPE_VULPINE) 
	{
		knotStuff = true;
		output("\n\n<i>“Haayesss, canid cock! That knot - you’re already so strong right there, I can feel it every time I move!”</i> Bianca looks over her shoulder, eagerness writ upon her shimmery visage. When her colossal, impassioned weight crashes down, it’s all centered on that piece of you. <i>“You beast, you animal! I’m little more than a slut for a knot - it’s true! I get so wet just feeling it, and I have you all to myself!”</i> Your [pc.cockColor] rocket’s throbbing is so deliriously wonderful, but the fox-whore hyper-focuses on your animal anatomy, wiggling around the bulb of your knot, caressing the many colorful veins lacing its propagative magnitude. <i>“Please - please, [pc.name], when you do me, I want to feel that battering into me! Smash your knot into me and breed my ass cheeks, it doesn’t matter!”</i> Her eyes widen and her entire pelvis quakes from orgasm. <i>“Give it to me! I need it!!”</i>");
	}
	// pc Has Feline Cock
	else if(pc.cocks[0].cType == GLOBAL.TYPE_FELINE)
	{
		output("\n\n<i>“Those nodules on your penis, [pc.name] - goodness, like a " + (pc.cocks[0].cLength() < 12 ? "hundred":"thousand") + " fingertips rubbing me all at once! I never - I never...!”</i> Thoroughly aroused, she breaks her gentle pace and goes into crotch-battering mode, vigorously fucking herself on the deluxe design of your feline dick. <i>“It tickles a bit, but the... I wish... this was in me. Will you rub against my pussy too, when you take me? When you make me yours?”</i> Bianca bobs haltingly on your shaft, the deep softness of her ass rewarded by your teeming, turgid cock. <i>“Please, use me, I want to feel every part of you cumming, I want you to cum all over me, go deep, make me quake, go crazy!”</i>");
	}
	// pc Has Suula or Stinger-flagged Cock
	//Fen note: Just Suula since it uses Suula by name.
	else if(pc.cocks[0].cType == GLOBAL.TYPE_SUULA) output("\n\nThe anemone stingers lacing your alien prong inject the hungry fox’s lower body with a libido-amping cocktail of chemical bliss. <i>“A-Aahh... Suula venom... that... that cock! [pc.name]...!”</i> She’s not at all surprised, but her rationality dissolves into pure sluttery. She screams loudly from the constant, indelicate lashings spiking her with ardor-toxin. <i>“I’m... you’ll... oh, [pc.name]!”</i> Furiously, she bounces, bashing you with all her strength, like it’s all too hot and she’s desperate to find cool relief. There is no oasis, however, only your too-hard dick impaling the furrow of her tightly-squeezing pleasure-passage. <i>“When you - you’ll have to p-pound... me! Hard... haaaaaard! Mmmmhaaa... I can’t wait... I’ll get you ready, and you’ll take me!”</i>");
	// Else
	else output("\n\n<i>“Mmhhff... humm...”</i> Bianca’s building speed swings her lower body into you, eliciting moans from your slackened mouth. It feels like, at any moment, the last vestiges of your willpower could be knocked loose at any time. <i>“Your cock is so hard, [pc.name]. Turgid, full of blood, strong enough to bend iron... and it’s bending my butt around itself, pumping into a lovely hole that my body makes!”</i> The carnal music of her cadent hot-doggings fills your ears with a throbbing bass beat. Each time, one of her tails tickles you out of your reverie. Either way, your vision is never far from her overflowing ass. <i>“I can’t wait for you, [pc.name]. You can cum all over me, whenever you want. It’s all that matters, okay? Please, cum as hard as you can. Shower me in your vim and vigor!”</i>");
	// pc Has Knot (use on all EXCEPT for Canine/Vulpine cock!)
	if(pc.hasKnot() && !knotStuff)
	{
		output("\n\n<i>“Nngh! Yes! I can feel it! Your knot, it’s swelling! That’s wonderful, [pc.name]! That’sssshh... mmmm! Nff!”</i> Cordial etiquette breaks down into a series of yips and yelps, Bianca’s dizzying hindquarters slamming into your [pc.knots] with all possible force. The multicolored veins lacing your bitch-tying bulb pulse with the unleashed desire of a male’s instinct to sire children. Six and a half feet of titanic milf barrels down on that spot, once, twice, slap, thwump, oomph! All for the knot, and the ever-present promise of pregnancy! <i>“You have to hit me with that, every time! Go deep, make my whole body feel what it’s like to give birth again! It makes me feel like a mom-to-be again! Give me that, [pc.name]!”</i> The grit doctor’s incisors grind into her red lips. <i>“Use me, feel nice and tight, and when you cum, imagine it! Me swollen, and heavier, with an even bigger ass to use on you to start again!!”</i>");
	}
	// merge
	output("\n\nForced to move with the sway of Bianca’s hips, pliantly acquiescing to your simple need to cum, you growl savagely and start thrusting." + (pc.balls > 0 ? " You slap your [pc.balls] into her ass hard as you do, sending ripples through the tides.":"") + " <i>“[pc.name]...! Take me! Please!”</i> It’s not out of exhaustion that the lust-lost wife begs you to take the reins, but because she senses you rousing from the stupor she inflicted. She shudders and shakes when you grab her by the shoulders, feeling down to her wrists and yanking back, falling on her. Face-down, ass-up, that’s the way you fuck her now.");
	output("\n\n<i>“Yes! This is how it has to be done, [pc.name]!”</i> she praises. You let go of her hands and devote yourself to humping, knowing that she is obedient to your dominance. You draw back and thrust, slamming your [pc.knotBallsHilt] into the brim of her crack and your [pc.cocks] all the way through" + (pc.hasCocks() ? " their respective entrances":"") + ". She’s practically burning, writhing beneath you, struggling with her sweater and bra, working to exposed as much of her untainted skin as possible. The many cording details of her back revealed, you pump her ass-cleavage mercilessly, sloughed cock-sludge spattering her sloppy form, your pistoning phall" + (pc.hasCocks() ? "i":"us") + " making her into a simmering mess.");
	if(pc.cocks[0].cLength() > 14) output(" At the apex of every penetration, your [pc.cockHead] brushes into the muscular base of her tails, the deluge of pleasure to your glans forcing a spurt of premature orgasm each time.");

	// pc Has Balls
	if(pc.balls > 0)
	{
		output("\n\nThe weight of your [pc.sack] collides with Bianca’s bubble-butt. Despite the copious amount of cushioning down there to soften the blows, you’re still left feeling light-headed and dizzy, railing the feel-good hole her buns make around your members. She’s long since cast aside words for horny cries, and you sense the volume dialing up with each hit. You’ll spunk all over her. You have a rhythm down now, and it always stops just for a bit at the apex, just so that she has the pleasure of feeling the supple diameters of your churning cum-tanks gurgling against the fattest part of her reddening ass.");
	}
	// merge
	output("\n\nA new urge burgeons inside, and you don’t think twice about heeding the call. You raise your hand and imprint a red tattoo of your hand on Bianca’s right ass cheek. Then, you switch, spanking the other; her pheromone signature in the air strengthens, and a translucent puddle of expands under the arch she makes in this feral posture. The more you strike her, the more she trembles, and the more eager she gets to prove how suitable a cocksheath she really is.");
	// pc Multicock
	if(pc.hasCocks())
	{
		output("\n\nMultiple endowments almost seem necessary when making love to Bianca. While you enjoy the malleability of her supple peach, you have another dick in hand that can plow through the battleship mass of her thighs and grind directly over the top of her bare twat. <i>“Euk!”</i> squeaks the doctor. <i>“Mmmm! Yes! Right there!”</i> Who are you to deny her? Hot passion gutters on your topside, your fully-dilated urethra rebounding off the marble-head of her vaginal hood." + (pc.cocks[0].hasFlag(GLOBAL.FLAG_NUBBY) ? " Your rubbery barbs viciously scrub that spectacular junction, enviously teasing the fuck-broken mother’s baby-hole.":"") + (pc.hasKnot() ? " To her great delight, your juiced-up knot drives in, wearing her labial opening like a very strange and sloppy hat. That makes her cum harder.":""));
	}
	// Else
	else
	{
		output("\n\nYou can’t in good conscience leave her pussy unloved. Departing from the cozy bed of her ass, you screw into Bianca’s thighs, urgency crackling across your body. WIthin moments you’re teasing her cunt with heedless abandon, hyper-slick, feverish folds clinging to your top-girth like it’s begging for babies. Shimmery milf-goo leaks out around your [pc.knotBallsHilt], submissive downpours of instant orgasm polishing your maleness. <i>“Yees! Thank you so much!”</i> the doctor wails, all that friction motivating you to ");
		if(pc.cocks[0].hasFlag(GLOBAL.FLAG_NUBBY)) output("scrub her cunt with the rubbery spines of your shaft");
		else output("pump her sopping nexus properly");
		output("." + (pc.hasKnot() ? " You’ve never heard her so loud until you just grinded your [pc.knot] into that special place.":""));
		output("\n\nStill, this is a buttjob - time to go back!");
	}
	// merge
	output("\n\n<i>“Ah - Ah...!”</i>");
	output("\n\nYou don’t even notice when she cums sans playful punishment. You mould her like pastry around your breeding mass{es}, and it feels like the whole galaxy is tightening against your [pc.cocksLight]. You moan, clench your teeth, and fill your palms with the silky-smooth texture of your valentine’s shameless butt. Inner tubes unclench to handle the gushing bulk of fluid burden racing to paint this slutsune’s body. With white-knuckled relish, you bury yourself in her backside and unload in a delicious, lustful haze, riding the gouts of [pc.cumVisc] jizz surging through your [pc.cocksLight].");
	// pc Cum Low
	if(pc.cumQ() < 1000)
	{
		output("\n\nThick ropes of [pc.cum]");
		if(pc.cocks[0].cLength() < 14) output(" develop into chunky pockets of pooling sludge that finally become too big for her derriere to contain. The next ejaculation causes a forward-facing explosion that plasters Bianca’s tails and back in seed.");
		else output(" arc through the phallus-charging channel of Bianca’s bottom cleavage, tendrils of release weaving around the bases of her tails and drawing lines across her back.");
		output(" Jism flows in undulating ecstasy, and then you pull out, jerking out fat wads of gurgling [pc.cumNoun] across her plump cheeks, slapping your [pc.cockHeads] to the hills, and aiming your lancing loads wherever they need to go. [pc.CumFlavor] seed drips form her curves, fountaining splurts reinforcing the pools of nut trickling down all directions. The sight of her ass plastered in <b>your cum</b> is incredible, and ensures you spend every drop enhancing the image." + (pc.hasCocks() ? " Those noises she makes as you hit her from multiple angles at once are inexpressibly arousing.":""));
	}
	// pc Cum High
	else
	{
		output("\n\nThe sheer volume of your volcanic climax is far greater than the sensory resolution of your crotch can handle. Within the moment, a columnal burst of [pc.cum] bursts from your lust-sore [pc.cockHeads]");
		if(pc.cocks[0].cLength() < 14) output(", so strong it even though you’re totally submerged in her backside it’s able to lance free");
		output(". Thick cum paints the fox’s floof, their wild wagging sending fat liquid streams in all directions - a cascade of DNA that helps you accomplish the task of covering her in [pc.cumVisc] [pc.cumNoun]. [pc.CumFlavor] spunk splashes the twin hills of her ass with an impact that depresses their inordinate pliancy. Hot seed pools in all the recesses and dimples of her back, slips back into her bottom cleavage, overflowing excess.");
		output("\n\nYou regrettably pull free of her canyon and stand, painting the physician’s entire torso in a sopping [pc.cumColor] overcast. [pc.CumGem] deluge bathes her touch-sensitive curves in a deluge of steaming-hot seed. Skittering electric pleasure overloads your mind seeing her fat fucking ass dripping messily <b>with your jizz</b> and you resolve to spend every thick drop of nut in rewarding this amazing woman.");
		// pc Cum Hyper (add-on to High)
		if(pc.cumQ() >= 5000) 
		{
			output("\n\nIt’s far from over! Eruptive geysers of [pc.cumVisc] seed cocoon the vanilla peaks of the foxen’s rump, her lower body jolting from the collisions of your hosing cum. Your mutual vocalizations aren’t words, just bestial grunts of an alpha and [pc.hisHer] bitch who’ve yet to be sated. You grab hold of your [pc.cocksLight] and return to hot-dogging her, using her body to maximize the strength of your virile wash. Slickness fountains in ultra-porn magnitude, almost totally concealing the fox-mom under a lake’s worth of jism. To her, it’s paradise.");
			output("\n\nTo you, it’s painful exhaustion.");
		}
	}
	// merge
	output("\n\nBianca is a fucking mess. Webs of [pc.cumNoun] decorate her tails like obscene Christmas trees. It’s everywhere on her back. Her ass is so wonderfully drenched; you really made it yours; nobody can deny it." + (pc.cumQ() >= 5000 ? " Nobody is going to want to clean this mess up, either. Least of all you!":""));
	output("\n\n<i>“[pc.name],”</i> she sputters. <i>“That was... so good...”</i> She rolls over, scooping up a handful of spunk and stuffing it down her gob. <i>“Mmm...”</i>");
	output("\n\nThe unmistakable desire to do that again is already stoked. Damn teasing foxes!");

	//[Next] \\ Go to [Finished]
	// sceneTag: processTime
	// sceneTag: PC Orgasms
	// sceneTag: PC becomes ‘Sweaty’
	// sceneTag: Raise Bianca Familiarity by +15 (future proof for xpac territory)
	processTime(35);
	sweatyDebuff(1);
	biancaFamiliarity(15);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",finishUpWithBianca);
}

//[Lick Fox Cunt]
// Tooltip: If she wants a night to remember, you’re ready to make it so.
// Standard pussy-eating, but if the PC has let her facesit before, then she changes it up halfway and pins you to the wall her tremendous proportions.
public function lickFoxCunt():void
{
	clearOutput();
	showBiancaVDay();
	//By custom request.
	showBust("BIANCA_LINGERIE");
	if(pc.isNice()) output("<i>“Let me lick your pussy,”</i> you say firmly. <i>“I can’t think of a better way to thank you for the evening.”</i>");
	else if(pc.isMischievous()) output("<i>“A night to remember, huh?”</i> you say, fuzzy wonder swaddling your mind. <i>“Let me eat you out. I’ll give you an orgasm you won’t forget.”</i>");
	else output("<i>“I want your pussy - with my mouth,”</i> you grunt, grabbing a tit. <i>“I want to make you scream.”</i>");

	output("\n\n<i>“A-Are you sure? I wanted this to be about you,”</i> Bianca smiles shyly. <i>“");
	if(flags["BIANCA_SEXED_LICK_HER"] != undefined) output("W-Well, I can’t decline. You’re... very good at that, hehe.");
	else output("W-Well, then... let me get ready. Besides, I love when you tell me exactly what you want.");
	output("”</i> Agile fingers hook into her belt and yank out the hem of her long, cozy sweater, lifting it until her ballistic boobflesh spills out, shouldered by a black and pink reinforced bra. <i>“Ahhh...”</i> she sighs, standing up against " + (biancaIsCrew() ? "a nearby light pole":"the wall") + ". <i>“Please look at me. I want you to see me shameful and dirty. If you don’t watch, I’ll get upset.”</i>");
	output("\n\nIn light of her cutesy trill, you opt to do more than watch - you get right up in between her legs, picking out the faint notes of strawberry arousal through durable fabric. The horny medic goes for her belt, unlatching the clinking metal and easing the great tension on her hips. Mouth watering, you watch the great vanilla hills swell outward uncontained. <i>“Mmf,”</i> Bianca winces, giving the sides of her too-tight pants hard, muscle-straining yanks. <i>“It always... takes... a bit! ...But it feels so good when it comes off...”</i> Pheromone saturation hits you like a jumping freighter to the face, exquisite milf-twat saturating the air. Bianca’s bulging ladyhood is visible against the pussy-drenched material of her undies, rendered against the puffy cradle. Thin streams of lubricant drool between the threads, puddling in her fallen pants. <i>“Can you smell me, [pc.name]?”</i> she asks in a saucy, magical voice. <i>“I hope so... can you see how wet I am? See, from every angle, look deeply at how shameful I am...”</i>");
	output("\n\nThe lady Ketria slides her thumbs past the side-strings of her padded panties and goes to pull them down, corkscrewing the silk over the alluring slopes of her thighs. The front of her pink-laced lingerie detaches from her cunt with a sopping-wet squelch and, for some reason, that makes you snap and want to dive in.");
	output("\n\nYour [pc.hands] urgently grab hers - she squeaks - and then you take over, rolling the useless article down the girth of her matronly fatness. Every neurotransmitter in your head must have released at the moment you laid eyes on her ruby-red jewel. The curves and dimples of her vaginal wonderland are steep as mountain roads. They glisten under a veneer of feminine desire. Overcome by visual ecstasy, your eyes cross and you gasp, unable to stop trembling at the sight and <i>stench</i> of a desperate female.");
	output("\n\nNot just any, but one who has given birth to a whole family.");
	output("\n\nGolden tails cloak you in cloudy embrace; her nether regions steam from contact with the air, need made into veils of musky vapor. It’s utterly filthy and debauched. It still trickles, anxiously. It makes you salivate; you can’t wait to taste her. <i>“It’s all yours, [pc.name],”</i> Bianca beams, opening her swampy delta wider, spreading her legs out. <i>“Satisfy yourself with me,”</i> the fox continues in a libido-amped tone, taking ample pride in the full-course buffet she’s presented to you.");
	output("\n\nWith her pussy exposed and her decency obliterated, Bianca shudders as you grab her and thrust your [pc.face] through a solid wall of animal magnetism. Immediately her hand comes to rest on your head, patting and scratching, encouraging you to slobber and thrash from the get-go. Your [pc.tongue] lashes out and drapes across her pleasure-plumped flesh, wires of fragrant soak clinging to the flexing organ. <i>“Y-Yeesss...”</i> she hisses, throwing her glasses onto her discarded coat. Child-bearing hips shudder as you lap at her deliciously-aroused vulva, licking at it like a dog would a plate. Currents of bliss tingle across the yielding folds of her blushing labia. You suckle at the fox’s bulbous clit, earning a steady, streaming rush of excitement from inside. <i>“You’re so good at that...”</i>");
	output("\n\nThe slickness of her lust sticks to you like morning dew; you explore a buxom mother’s furrow in a serpentine path, harvesting all the pussy-cream you could ever want. <i>“I wonder if I deserve this,”</i> she says in a musical voice. <i>“Nnhmm, ahh... [pc.name]... please lick my clit more - y-yesha... haahh...”</i> Granting the physician’s dearest wish, you slather that firm gumball in spit and bliss. <i>“Aaah!”</i> comes a piercingly-loud voice, and the full weight of your tall companion bucks into you, smearing your [pc.hairNoun] and brow in orgasmic quim.");
	output("\n\nFemme-cum gathers around where your tongue swirls. Using it as friction, you slide faster, harder, and more aggressively around her throbbing exterior, delighting in the indescribably fine, smooth, non-bitter taste of Bianca’s voluptuous muff. It’s as gluttonous as you are, demanding it rougher and faster from your mouth. You don’t have time to reflect on what kind of stimulation a woman like her needs, only that you need to keep providing, do your very best, and feel her backed-up loads paint your [pc.skinFurScales].");
	output("\n\nWarm femme-cum, rosy nectar, settles in your gullet. Your dopamine levels are critically high; her scarlet slit happily rewards when kissed. Hazy and coated in cunt, your [pc.lipsChaste] feel like sex-organs, prickly bliss intensifying when you full-on smooch the smooth, glittery texture of her mons. That fruity taste, that plump, flavorful, <b>savory taste!</b> At once refreshing and enervating! You swim through the folds, guzzle her heat, and squirm. You find her clit, clasping that electric button between your lips and pulling on it, grinding it softly against the bottom of your front teeth. Pretty soon, your upper body wears her musk like a blanket.");
	output("\n\nShe can’t resist the [pc.raceShort] [pc.boyGirl] playing over the most sensitive parts of her body, but her seasoned pussy that has needs and desires of its own - it <b>demands</b> the highest level of worship.");
	if(pc.hasCock()) output(" Your [pc.cocks] endure the struggle of untapped loneliness, steadily squirting " + (!pc.hasCocks() ? "its":"their") + " desire for release in thickening volume.");
	else if(pc.hasVagina()) output(" Your [pc.pussies] ooze" + (!pc.hasVaginas() ? "s":"") + " enough cream that you feel like Bianca down there - that this distinctly juicy feeling is going unappreciated is a malus that you’ll have to endure for now. She’ll get you off later!");

	// pc Did Facesitting (or, did [Pull Her Down] in the regular sex scenes)
	if(flags["BIANCA_SEXED_LICK_HER"] != undefined)
	{
		output("\n\n<i>“All this and you still haven’t gotten inside... oh, [pc.name], [pc.name] [pc.name] [pc.name].”</i> Bianca halts your licking. Looming overhead is a mischievous mom, whose glowing pupils reflect your cunt-drunk image. <i>“I think I know how to energize you. It slipped my mind up ‘til now, so let me help you... help me... hehehe.”</i>");
		output("\n\nGliding over you, Bianca’s thigh swings you [pc.face]-first against the " + (biancaIsCrew() ? "pole":"wall") + " she stood at. You manage to catch yourself, but the moment you spin around, you’re flattened, squeaking, against the surface by the full moons of her glorious ass. <i>“There,”</i> the doctor chimes triumphantly, humping your [pc.face] to nestle you deep in the wide, sweaty chasm of her hefty buttocks, porcine fecundity blotting out your vision. <i>“I love to smother you, [pc.name]. And besides, you were very kind to make this about me. So please; as they say...”</i> Another hump, and you’re engulfed in pillowy darkness, only a carefree laugh and the juiciest human puss to comfort you. <i>“...Dig in.”</i>");
		output("\n\nBianca isn’t a naturally dominant woman, which is why having her pin you in the sweltering vale of her vanilla-hued ass cheeks, having her shimmering folds spreading over your [pc.lips], enmeshing you in her needy wetness, fills you with profound pleasure. Dizzy and struggling for air, you get down to business, packing your tongue in muscled foxhole, every inner nerve clinching tight in rapid succession. Her body trembles - she cums all over you, spasming, sangria-tinted heaven mashing hard into your skull, silken pressure venting.");
		output("\n\nYou groan into the dommy doctor’s soaking, drooling cooze, kneading with white-knuckled enthusiasm the torso-sized marshmallows squishing over your obscured features. Sprays of effervescent arousal soothe your jaw in lakes of sensual friction. When your tongue gets tired, you rest it deep inside, paddling inside her beautiful twat. The proof of her femininity and motherhood ebbs against your overheated brain; you probe it, gently, roughly, mixing it up, drowning in scrumptious sex-juice. Pleasing it is the most important role you’ve ever played in life, and trapped in a fissure teeming with her slutsune fuck-scent, that’s just fine by you.");
		output("\n\n<i>“Aaaah... ahh... yes, yes yes... [pc.name]...”</i> Bianca moans, another bone-battering buck of that opulent derriere puts you in your place; you smooch her clit, burrowing and writhing within a pool of fresh ladyspunk, learning to breathe as you perform. <i>“I still think back to the first time you did that... made me sit on you... and I think about it so much before bed. I feel like I’m taking too much, being unreasonable...!”</i> Another rough horizontal motion submerges your " + (pc.hasMuzzle() ? "muzzle":"nose and mouth") + " far into her cunt. Steamy suffocation. You wiggle so that you can squeeze yourself into her furthest recesses{ longTongue:, deploying the maximum length of your [pc.tongue] to find her womb and swab distant nerves expecting dick and getting the next best thing}. <i>“But I... I like this - a lot. I would have never thought about it, had you not... s-s-shown me.”</i> Barely, you discern a shift in the outside world, and her voice comes clearer. As does a headpat. <i>“I’m so glad you like my butt, because I want to try to surprise you with it more often. Okay? I want you to spank me later, teach me a lesson for being so bad and presumptuous... and then rub it, lick it, and suckle at my vagina... just like this... mm!”</i>");
		output("\n\nThat would be wonderful.");
	}
	// pc Didn’t Do Facesitting
	else
	{
		output("\n\n<i>“Please... I need more now, [pc.name]. If you keep me going like this, then...”</i> Bianca’s grip fastens to your [pc.ear]. Her rare forcefulness shocks you into action, and, murmuring your assent, you raise your nose and cup her snatch with your [pc.lipsChaste], catching all the drippings; rolling your [pc.tongue] around the outside in multi-direction strokes, you lick her exterior clean and find an opening to penetrate. Sharp pleasure hisses out of her mouth. <i>“Y-Yes! Oh... [pc.name]... I... can’t hold myself back... please make me cum hard...!’");
		output("\n\nBianca grabs the sides of your head and sways against your suckling maw. The stunning beauty of her pussy takes on a new hypnotic quality as she gently rocks to the left and the right, riding your face. Her shuddering twat teems with fresh sex-juices, pooling around your immersed muscle and funneling down your useless throat. Vocal cords can’t produce cogent dialogue when drowned in ladyspunk, but they can vibrate the air you breathe, and by doing so, greatly please the puffy quim enmeshing you in cunnilingual euphoria. That it’s a certain, loving fox-mom is why it’s special. Not because it’s the fattest, squishiest, yummiest cunt, but because you’re being entrusted with it.");
		output("\n\nHer fertile figure is too wide to hug entirely from down here. Instead, you take hold of her wobbling ass-cheeks, lovingly caressing the round, moon-sized bubbles of her curvesome backside. Sweat dapples your [pc.hands], trailing down the distorting squish of her warm, blushing butt, as they massage sweet, tickling moans out of her. Down in front, you dive into her furthest recesses" + (pc.hasTongueFlag(GLOBAL.FLAG_LONG) ? " sweeping your strong, invasive tongue’s full length over the highest points of vaginal bliss":"") + ". Rivulets of soothing femme-cum lacquer your [pc.face] in the heated animal fuck-scent that could only be generated by her slutsune transformation.");
		output("\n\nShe’s on the verge of screaming, giving you away. That’s something to work towards.");
		output("\n\n<i>“N-nnhmm...! All the way, please...!”</i> she begs, knees giving out. Gravity stuffs her muscled cunt full of you. " + (pc.hasMuzzle() ? "Muzzle":"Nose") + "-deep in suffocating milf-pussy, quaking heavily at your touch. Changing tactics, you maneuver in the opposite direction of her moving hips, fondling the ginormous spheres; she coos with delight, pinching a nipple through her bra, your rhythms gradually erased by anxious, ecstatic delight. <i>“I’mmm... [pc.name]... [pc.name], [pc.name]...!”</i>");
		output("\n\nA ripple of powerlessness quivers through the fox’s hole, driving you wild in those split seconds before a spray of gummy estrus blinds you. Not wet enough to be a full-time squirter, but when so aroused... mmm. Waves of pheromone-imbued desire wash over you, the hot need to prolong her desire burning brighter. Your [pc.skinFurScales] prickles, and, immersed as you are in her vaginal depths, you cling to consciousness by the end of your wet, serpentine tongue, swirling, kissing, quaffing her frantic emissions in undulating gulps.");
	}
	// merge
	if(pc.hasTongueFlag(GLOBAL.FLAG_APHRODISIAC_LACED)) output("\n\nBianca isn’t prepared for the waking havoc that an introduction of salival venom brings. A high-pitched squeal of paralyzed bliss slips from her lungs as her defenseless womanhood is injected with more lust than it knows what to do with. A deluge of horniness-made-liquid fills a puddle around you - there isn’t a part of the dripping [pc.manWoman] named [pc.name] not sodden.");
	output("\n\n<i>“I can’t...!”</i>");
	output("\n\nThe warning comes as a breathy murmur" + (!pc.hasEarFlag(GLOBAL.FLAG_LONG) ? " that somehow reaches you even with your [pc.ears] lost south of the doctor’s buttery thighs":"") + ". Your [pc.tongue] pumps deeper into the bowed woman’s orgasm-taut tunnel. It’s back to cumming just seconds later, trying to relieve the excitement that you’ve been building towards. Nearly there - almost there - you give back with all your strength until your [pc.skinFurScales] reaches an ardent fever.");
	output("\n\nPressing firmness and a gush of oily polish signal her ejaculation." + (flags["BIANCA_SEXED_LICK_HER"] != undefined ? " That, and the fact she just bounced against you again.":"") + " <i>“A-Ah! That’s... that’s! Wonderful!”</i> It’s like she’s struggling to breathe, every ounce of [pc.raceShort]-anointing lust condensing down into the pussy you lick through its final orgasm. Hotness gutters out faster than you can catch it. The deep, roiling sumptuousness strangles your supple organ, consecrating it in voluminous output. Released in increments by her contracting folds, It eventually goes limp and falls back into your mouth, but, of course, your paralyzed jaw can’t keep it there.");
	output("\n\nBetween the " + (flags["BIANCA_SEXED_LICK_HER"] != undefined ? "major":"minor") + " lack of oxygen, the wine, and the fancy chocolate, you slip back, propped up by your tiring elbows. Bianca slumps to her knees on top of you, and without a word, just closes in and kisses you.");
	if(pc.hasCock()) output(" Before you know it, she’s " + (!pc.isCrotchExposed() ? "fished out your":"grabbed hold of your") + " [pc.cocks] and begun jerking them to an instant orgasm. Under a masterful mommy’s assault, your penis" + (pc.hasCocks() ? "es":"") + " jet [pc.cum] in splattery torrents, grateful for release.");
	else output(" Pleasure bursts from your lips when suddenly the fox-mommy finds your [pc.pussies] and fingers them to an abrupt detonation. Euphoria and bliss scour through you as she fondles your [pc.clits], bringing you to " + (!pc.isSquirter() ? "shuddering":"spraying") + " climax.");
	output("\n\nNow you can rest.");
	processTime(35);
	pc.orgasm();
	pc.girlCumInMouth(bianca);
	pc.applyPussyDrenched();
	sweatyDebuff(1);
	biancaFamiliarity(15);
	clearMenu();
	addButton(0,"Next",finishUpWithBianca);
	//[Next] \\ Go to [Finished]
	// sceneTag: processTime
	// sceneTag: PC Orgasms
	// sceneTag: PC becomes ‘Pussy Drenched’
	// sceneTag: PC becomes ‘Sweaty’
	// sceneTag: Raise Bianca Familiarity by +15 (future proof for xpac territory)
}

// [FINISHED]
public function finishUpWithBianca():void
{
	clearOutput();
	//By custom request.
	showBust("BIANCA_LINGERIE");
	if(hours < 4) output("It’s well past midnight");
	else output("It’s well into the evening");
	output(" when you’ve both recovered from your tryst, sweaty, exhausted, and mostly (seriously, where does she get all the wet naps?) cleaned up. The inexpressible joy of being with Bianca under the light of" + (biancaIsCrew() ? " an artificial moon":" a moon") + " makes the inevitable parting much more difficult. But then she’s there to kiss you on the forehead, rub around your [pc.ear], and whisper to you her plans for future naughtiness. You listen closely to the kinkiness described, sharing the same affection.");
	output("\n\n<i>“Thank you again, [pc.name],”</i> Bianca says, tracing a finger around your jaw, enjoying the ways you react to her gentle caresses. <i>“This has done more for me than I can be expected to explain in a succinct time frame.”</i> She giggles. <i>“Now, I think we should both retire for the night, yes?”</i> Her head tilts, and one ear lowers.");

	// bianca Is Crew
	if(biancaIsCrew()) 
	{
		output("\n\nTaking her by the arm again, the journey back to your ship passes in the blink of an eye. Back in your room, you lay her out on your bed and tear every last bit of clothing from her body and go down on her until you’re both passed out naked under the sheets. The love you made to her probably kept a few others awake, and if anyone listened in, they’ll be speaking of it in whispers for the rest of their lives. You had no idea, none, of the kind of woman you brought into your life.");
		output("\n\nIt was utterly exhausting and you’re worn out by the end of it, yet you throbbed in delight every time you give it to her, or she, occasionally, gave it to you. When she acted, it was only to give you a much needed energy boost, train your body for the lengthy lovemaking that she required, and you lack the time or wherewithal to reflect on how that was even possible. Her stamina is unending, and like the carnal creature she is, Bianca matched you at every pace, never pushing too far or slacking behind. The whole bed reeked of your combined smells, a creaky pleasure-pit that she promised to replace before the day is out.");
		output("\n\nIn the morning, you’re made a familiar, hearty breakfast that revitalizes you, served fresh with a side of love. And then, because you both agree last night wasn’t enough, a morning quickie where you bend her over the table and make a huge mess is in order. Satisfaction okay, you clean up, and finally get your day started after a hot, relaxing shower, being washed by her breasts and doted upon before you’re allowed out of the fizzy bathroom.");
		output("\n\nThings have gotten so much easier with Bianca around. It’s hard to believe where you both were not long ago.");
		output("\n\nAnd now here you are, with a true companion that will see the end of this long journey by your side. When you take a peek at the letter she gave you again, smell the perfume on it, you feel...");
		output("\n\n...empowered.");
	}
	// Else
	else
	{
		output("\n\nAlas, it’s true.");
		output("\n\n<i>“I’ll walk back to your ship with you, if that’s fine,”</i> she offers.");
		output("\n\nHappily taking her arm again, the trip back to your vessel is short and quiet, just two people exchanging kind words and impish banter. It’s hard to believe what you got up to not too long ago. As you try to let go of her arm, she grabs your hand and pulls you into another chest-smushing kiss. Not too deep, lest you begin again, but enough that you’ll be sleeping with her on your lips as well as in your thoughts. <i>“Good night, [pc.name]. I’ll see you again. I know it. Above all, be safe.”</i>");
		output("\n\nThe glow of her eyes streaks when she turns her head and walks off on her own. You stand there contemplating what had occurred, pulling out the letter she had given you, staring at the decorative paper and breathing in its faint scent.");
		output("\n\nIt makes you feel...");
		output("\n\n...empowered.");
	}
	output("\n\n(<b>Gained Key Item: Bianca’s Valentine Letter!</b>)");
	//KEY ITEM: Bianca’s Valentine Letter
	pc.createKeyItem("Bianca’s Valentine Letter",0,0,0,0,"Bianca wished you a happy Valentine’s Day with this heartfelt letter. The crisp scent of maternal fox still exudes from the supernal stationery.");
	processTime(45);
	moveTo("SHIP INTERIOR");
	//[Next] \\ Back to game, put PC on Ship Tile of wherever they are
	// sceneTag: processTime
	// sceneTag: Clean any cum soak/sweat effects.
	// sceneTag: Gain Key Item ‘Bianca’s Valentine Letter’
	pc.shower();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Decline]
// Tooltip: It’s unfortunate, but you just don’t have time to make with the kinky.
public function declineTheKinkyWithTheStinky():void
{
	clearOutput();
	showBiancaVDay();
	if(pc.isNice()) output("Not wanting to turn her down bluntly, you instead sweep Bianca into a tight hug and give her a kiss on the lips. <i>“I can’t " + (hours < 17 ? "today":"tonight") + ",”</i> you say. You know it will hurt her - it doesn’t matter how much, but it doesn’t have to be done flippantly. <i>“But next time? Let’s make time.”</i>");
	else if(pc.isMischievous()) output("You give a sulky sigh that Bianca’d be remiss to not understand. Before saying anything, you grab the sides of her head and give her a kiss goodnight, petting her ears. <i>“I’m sorry, doc. I won’t be needing that service " + (hours < 17 ? "today":"tonight") + ". But next time?”</i> You smile, and kiss again. <i>“Count on it.”</i>");
	else output("<i>“I-”</i> You start, but realize the tone you’d chosen would have been genuinely harmful. For Bianca, you clear your throat and bring her into a firm hug, sheltering" + (pc.tallness < 80 ? " yourself in her body":" her in your body") + ". <i>“It can’t be " + (hours < 17 ? "today":"tonight") + ", but there’ll be another time,”</i> you murmur, some unhappiness visible in your expression.");
	output("\n\nBianca swallows and nods after a pregnant pause. <i>“I understand, [pc.name]. Besides,”</i> she grins, <i>“I still had fun tonight. Please allow me to accompany you back to your ship, at least.”</i>");
	output("\n\nSure.");
	clearMenu();
	addButton(0,"Next",biancaStrongArmsYouOntoYourShipForSomeReason);
}

public function biancaStrongArmsYouOntoYourShipForSomeReason():void
{
	clearOutput();
	showBiancaVDay();
	output("The return trip to the [pc.ship] is uneventful, but oh-so romantic. You hold her arm the entire way, absolutely no consciousness that you aren’t some kind of big shot already, and not a Rusher-slash-corporate-scion trying to pull [pc.himHer]self up by the bootstraps. Kind words are exchanged between jabs of impish banter. At your destination, you go to let go of Bianca, but she simply pulls you into one last chocolate-flavored kiss.");
	output("\n\n<i>“Good night, [pc.name]. We will see each other again soon. I know it.”</i> She pats you on the head, hugging you straight into her big warm boobs. <i>“I’ll be waiting. So please, be safe.”</i>");
	output("\n\nShe lets go, the glow of her eyes streaking, and vanishes around a corner.");
	output("\n\nReaching into your pocket, you pull out the decorative letter she gave you, staring at it, taking in the demure scent that clings to it. Your past times with good company come rushing back in the moment.");
	output("\n\nIt’s... empowering.");
	output("\n\n(<b>Gained Key Item: Bianca’s Valentine Letter!</b>)");
	//KEY ITEM: Bianca’s Valentine Letter
	pc.createKeyItem("Bianca’s Valentine Letter",0,0,0,0,"Bianca wished you a happy Valentine’s Day with this heartfelt letter. The crisp scent of maternal fox still exudes from the supernal stationery.");
	moveTo("SHIP INTERIOR");
	//[Next] \\ Back to game, put PC on Ship Tile of wherever they are
	// sceneTag: processTime
	// sceneTag: Clean any cum soak/sweat effects. - FEN NOTE: No. You didn't take no showers or nothin.
	// sceneTag: Gain Key Item ‘Bianca’s Valentine Letter’
	processTime(25);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//[Turn Down]
// Tooltip: You can’t make every occasion.
public function turnDownBiancaz():void
{
	clearOutput();
	showBiancaVDay();
	if(pc.isNice()) output("<i>“I’m sorry, Bianca. I don’t have the time right now. It’s a hectic day...”</i> you answer sadly, scratching your nape.");
	else if(pc.isMischievous()) output("<i>“No can do, Bianca,”</i> you reply with a sigh. <i>“" + (hours < 17 ? "Today":"Tonight") + "’s not good for me...”</i>");
	else output("<i>“I can’t right now.”</i> You shake your head.");
	output("\n\nBianca takes the news strongly, not even the slightest miffed tic in her vulpine features. Her head bows respectfully. <i>“I understand. It is out of the blue, after all.”</i> The doctor touches your hand gently, gathering up your [pc.fingers] and squeezing. <i>“I would like to try again another time, if that’s okay. It is not important... but... it is important to me.”</i> Letting go, she steps back and pulls her hood back up. <i>“Please be safe, [pc.name],”</i> she murmurs, disappearing from view.");
	output("\n\n");
	if(pc.isNice()) output("For some reason, you feel really bad right now. Best to perish the thought ASAP.");
	else if(pc.isMischievous()) output("That knocked the wind out of her sails. No reason to linger here. Doesn’t matter how old you are, those emotions fester.");
	else output("Her disappointment was apparent. Age isn’t much of a help in concealing human emotion.");
	pc.addHard(4);
	processTime(34);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
	//[Next] \\ Back to game
	// sceneTag: processTime
	// sceneTag: Bianca will retry the V-Day event in 48 in-game hours.
	pc.createStatusEffect("BiancaVDRejectCD");
	pc.setStatusMinutes("BiancaVDRejectCD",48*60);
	IncrementFlag("BIANCA_VDAY_DECLINED");
}