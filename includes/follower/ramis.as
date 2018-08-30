/*  ramis follower expansion

flaggy flags
RAMIS_ONBOARD
RAMIS_RECRUITED
RAMIS_TALKED_ABOUT_TALKING (that is, she mentioned having that booze-making thing)
RAMIS_TALKED_SAGITOM (heard story 4)

things to do (DO NOT PUSH IF THIS IS NOT EMPTY. THIS MEANS YOU, ME.):
higher vag cap
set ramis schedule and kase/shekka interaction
*/

public function ramisRecruited():Boolean
{
	return (flags["RAMIS_RECRUITED"] == 1);
}

public function ramisfmt(femString:String, manString:String, trapString:String):String
{
    if (looksFemaleToRamis(pc)) return femString;
    if (looksTrappyToRamis(pc)) return trapString;
    return manString;
}
public function ramisNickname():String
{
    return ramisfmt("captain", "big lad", "knickers");
}

//Sorely needed, can't use global(-ish) var pc as default, so kludgy solution
public function looksFemaleToRamis(target:Creature = null)
{
    if (!target) target = pc;
    return target.isFemale() || target.isFemHerm() || target.isSexless() || target.isShemale();
}
public function looksTrappyToRamis(target:Creature = null)
{
    if (!target) target = pc;
    return !looksFemaleToRamis(target) && target.isFemboy();
}
public function looksMaleToRamis(target:Creature = null)
{
    if (!target) target = pc;
    return !looksFemaleToRamis(target) && !looksTrappyToRamis(target);
}

public function ramisRecruit():void
{
	clearOutput();
	author("Nonesuch");
	showRamis();
	clearMenu();
    processTime(2);
	
	var isFem:Boolean = looksFemaleToRamis();
	var isFemboy:Boolean = looksTrappyToRamis();
    var offer:String;
    var price:int;
    
    //discounts
    if (!looksFamiliarToRamis()) offer = "default";
    //PC got really drunk with her
    else if (isFem && flags["RAMIS_TIMES_BENDER"] != undefined) offer = "girlee";
    else if (isFemboy && flags["RAMIS_SEXED_TRAP"] != undefined) offer = "boyo";
    else if (pc.hasCock() && flags["RAMIS_SEXED_MAN"] != undefined) offer = "lad";
    else offer = "default";
    
    output("You ask the big kaithrit if she’s willing to be hired.");
    
    switch(offer)
    {
        case "girlee":
            output("\n\n<i>“Aww, Tavros bezzie!”</i> Ramis swivels around on her bar stool and considers you fondly. <i>“You haven’t gotten pissed without me already, have you? Look, if you’re serious, of course I’ll come’n work for you. It’ll be for serious though, not just a booze cruise. I’m a professional.”</i>");
            output("\n\nHer human friend snorts sardonically. She swipes impatiently in his general direction.");
            output("\n\n<i>“I usually ask for 12 grand up front for my contract. But…”</i> she grins at you toothily. <i>“For you I’ll go 10. Deal?”</i>");
            break;
        case "lad":
            output("\n\n<i>“Ooh.”</i> Ramis swivels around on her bar stool and considers you with a coy, flirtatious grin. <i>“So you’ve decided you want all this on demand, have you? Looken to carry me out of here over one shoulder? It’s tempten, not goin’ to lie.”</i> She licks her lips, eyes you up, leaves you hanging for a few moments. <i>“10 grand. That’s what my contract’s worth to you, big lad. For that you’re getten the best gunnery officer in the galaxy… and the best fuck, too. But you already know that.”</i>");
            break;
        case "boyo":
            output("\n\n<i>“Umm. Really, knickers?”</i> Ramis swivels around on her bar stool and considers you with a puzzled, delighted grin. <i>“You want me on your ship? I mean, I am the best gunnery officer in the galaxy, I understand it from <i>that</i> angle, but… hmm. You must really enjoy taken it rough.”</i> She licks her lips, eyes you up, leaves you hanging for a few moments. <i>“Getten my contract is usually 12 grand, but you know what? For you it’s 10 grand. Cuz you are BLUDee adorable.”</i>");
            break;
        default:
            output("\n\n<i>“Well now mate, that depends on who’s asken, doesn’t it?”</i> Ramis swivels around on her bar stool to consider you with a toothy, impartial sneer. <i>“Course you’re wanten the best gunnery officer the galaxy’s ever known on board your tub, of course you do! But I don’t just work for </i>any<i> old spod. What kind of reputation would I have, if I could just be picked up in a bar like...”</i>");
            output("\n\nHer bald-headed human friend has been drifting closer as she’s talked, his eye on you, and now interrupts now by murmuring quietly in one of her blunt, triangular ears. Over the hubbub of the bar you don’t catch exactly what he says, but you definitely hear the phrase ‘Steele Tech’. The ears twitch.");
            output("\n\n<i>“ ...alright then, let’s say I am willen to work for you,”</i> Ramis continues, lips abruptly closing into a polite smile. <i>“12 grand, up front, for the contract. I ent cheap, but… <i>“ She flexes her arms, and laughs. <i>“You’ll be getten the best.”</i>");
            break;
    }
    
    if (offer != "default") price = 10000;
    else price = 12000;

    if (pc.credits < price) addDisabledButton(0, "Deal");
    else addButton(0, "Deal", ramisRecruitDeal, price);
    addButton(1, "No Deal", ramisRecruitNoDeal, offer != "default");
}

public function ramisRecruitNoDeal(discount:Boolean):void
{
	clearOutput();
	author("Nonesuch");
	showRamis();
	clearMenu();
    processTime(1);

    if (discount) output("<i>“Suit yourself, " + ramisfmt("mate", "mate", "pencil arms") + ",”</i> Ramis sighs, turning back to the bar. <i>“Can’t go lower than that. Bob over if you change your mind, or get the cash.”</i>");
    else output("<i>“Alright!”</i> Ramis flounces, turning back to the bar. <i>“Be a shame if your blaster cannons malfunctioned when you’re bein’ molested by vulkrimi shitbags in some uncharted asteroid belt, but it’s no skin offev my nose!”</i>");
         
    addButton(0, "Next", mainGameMenu);
}

public function ramisRecruitDeal(price:int):void
{
	clearOutput();
	author("Nonesuch");
	showRamis();
	clearMenu();
    processTime(5);
    
    pc.credits -= price;
    flags["RAMIS_RECRUITED"] = flags["RAMIS_ONBOARD"] = 1;
    
    output("Over one of those violently colored cocktails the big kaithrit is so fond of, you summon up a standard private naval contract on a holopad and transfer over the money. Ramis puts a big H RAMIS XXX over the signature line.");
    output("\n\n<i>“Never worked on a private vessel before,”</i> she says, grinning at you.");
    //9999 also for girlees?
    if (flags["RAMIS_SEXED"] != undefined) output(" She impulsively reaches over and plants a big, vodka-scented kiss on your cheek.");
    output(" <i>“It’s goin’ to feel weird to not be part of a squad, taken remote orders from some corpo lanyard. Do you mind if I have a looksee at your ship now?");
    if (flags["RAMIS_TIMES_BENDER"] != undefined) output(" I’ve bin in it before I know, but ummmm, never when I was seein’ straight.");
    output("”</i>");
    output("\n\nShe goes across and says goodbye to her friends - who make her swear she’ll meet up and party with them on Tavros - and then heads out of the exit of Anon’s with you.");
    
    addButton(0, "Next", ramisRecruitDealShip);
}

public function ramisRecruitDealShip():void
{
	clearOutput();
	author("Nonesuch");
	showRamis();
	clearMenu();
    processTime(20);

    moveTo("TAVROS HANGAR");
    
    if (9999 /* Z14 Z-14 casstech */)
    {
        output("Her face falls, her ears droop, when she beholds your trusty, humble Casstech in the hangar.");
        output("\n\n<i>“I would’ve thought a rich playboy’s sprog would have a cool as fuck ride,”</i> she mumbles, <i>“not a piece of junk from the 29th century.");
        if (flags["FALL OF THE PHOENIX STATUS"] == 1) output(" And you’re sayen you’ve gotten into dogfights with that thing?”</i> She grimaces as you relate the daring intervention you led to save Saendra en Illya. <i>“Bloody hell. Black Void are even worse at tearen apart wet tissue paper then I remember.");
        output("”</i> She snaps the straps of her sports bra resolutely. <i>“Right, turnen this thing’s peashooters into catapults is definitely goin’ to keep me occupied. I’ll go and pick my stuff up from the lockers and get to it. I’ll be on board by the time you’re ready to leave… captain.”</i>");
    }
    else
    {
        output("<i>“Nice ride, " + ramisfmt("mate", "big lad", "knickers") + ",”</i> she purrs, eyeing your [pc.ship] up.");
        output("\n\n<i>“Think I saw you comen in on a real piece of junk a couple of times, and I was kind’ve worried you were still floaten around in that.”</i> She tuts and hums as she walks around it, taking in the armaments. <i>“Yeeeaaahhh, but see, these are all calibrated wrong. They produce ‘em like this cuz they’re dead easy to bolt on factory-fresh to a ship like this, you know, but you’re wasten energy and not getten the full ay oh eff when they’re configured like that.”</i> She snaps the straps of her sports bra resolutely. <i>“Plenty to be getten on with! I’ll go and pick my stuff up from the lockers and get to it. I’ll be on board by the time you’re ready to leave… captain.”</i>");
    }
    
    output("\n\nYou watch your new gunnery officer saunter off back towards the lifts, tails curled upwards.");

    //Ramis gets hornocious after 62 hours
    if (!pc.hasStatusEffect("Ramis Sated")) pc.createStatusEffect("Ramis Sated");
    pc.setStatusMinutes("Ramis Sated", 62 * 60);
    
    addButton(0, "Next", mainGameMenu);
}

public function ramisCrewBlurb(crew:Array, partner:String = "none"):String
{
    var blurbs:Array = new Array();

    blurbs.push("Ramis has decked her quarters out in an intimidating display of fitness equipment. On the monitors, you can see she’s on the mat in her spandex underwear, hands behind her head, doing full body sit-ups. Up comes that brown, determined face to one side of her raised knees… down. Up it comes to the other side of her knees… down. Didn’t you read somewhere that sit-ups were bad for your back? Perhaps that’s not a problem for as flexible a race as the kaithrit.");
    blurbs.push("Ramis has decked her quarters out in an intimidating display of fitness equipment. On the monitors, you can see she’s put some fingerless gloves on and is pummeling her zero-grav punch bag. Her taut flesh glows with sweat as she ducks and weaves, laying down jabs so fast that you only see her arm withdrawing, and the bag swinging in response. The big kaithrit is laughing and talking breathlessly as she works out, although you can’t make out what she’s saying.");
    blurbs.push("Ramis has decked her quarters out in an intimidating display of fitness equipment. On the monitors, you can see she’s in her spandex underwear, doing her daily squats. Hands clenching the barbell over her shoulders, she grits her teeth and stands herself up… then with a hefty exhalation, sinks slowly back down. You simultaneously envy and pity the material stretched across her hindquarters, painted over those giant, muscle-packed hills, swelling out mightily whenever she returns to the squatting position.");
    blurbs.push("Ramis is in the battery. On the monitors, you watch her clamber over the bulky, internal components of your weapons, sonic wrench in hand: fiddling within circuitry compartments, rerouting energy cells, dismantling ammunition cylinders, before putting it all back together and summoning up the main holo menu at the front to perform checks. She’s wearing a rather grouchy expression, muttering to herself as she goes about it. You think you catch “...like it’s been calibrated by a bloody anatae”.");
    blurbs.push("It seems to be Ramis’s downtime. On the monitors, you can see she’s at her desk with a flask of whiskey and her lappy holo-device, idly scrolling and tapping away at various social media and vid sites. Kait-Pop is blaring through the speakers. She’s nodding away happily to the nightmarishly manic, screechy racket.");
    if (!pc.hasStatusEffect("Ramis Sated")) blurbs.push("Ramis is dozing in her room, flat out on her bunk with her hands across her taut belly, purring snores periodically rising and falling from a drone to a rumble. On the monitors, the glow of a holo pad near to her bed catches your eye; zooming in reveals it to be ‘Johann’s Big and Burly Bear-annual III’. A couple of Ramis’s fingers gleam with moisture.");
    
    flag["RAMIS_ACTIVITY"] = rand(blurbs.length);
    
    return blurbs[variant];
}
    
public function ramisCrewMenu():void
{
	clearOutput();
	author("Nonesuch");
	showRamis();
	clearMenu();
    processTime(1);
    
    output("<i>“Sup, " + ramisfmt("Captain", " Big Lad", " Knickers") + "!”</i> Ramis grins at you toothily when you approach her. <i>“Were you looken for me?”</i>");
    
    addButton(0, "Talk", ramisLetsDrinkInTheShip);
    addButton(1, "Sex", crew);
    addButton(2, "Work Out", crew);
    addButton(3, "Switch", crew);
    addButton(4, "Sleep With", crew);
    addButton(10, "Appearance", ramisAppearance, 10);
    addButton(14, "Back", crew);
}

public function ramisLetsDrinkInTheShip():void
{
	clearOutput();
	author("Nonesuch");
	showRamis();
	clearMenu();
    processTime(1);

    if (flags["RAMIS_TALKED_ABOUT_TALKING"] == undefined)
    {
        flags["RAMIS_TALKED_ABOUT_TALKING"] = 1;
        processTime(2);
        
        output("“Oh man. Here it comes!” sighs Ramis, rolling her eyes. “The manager wanten to get to know you, cuz [pc.he] wants you to think of [pc.him] as more’ve a friend than a boss, y’see.");
        if (!looksFemaleToRamis() && flags["RAMIS_SEXED"]) output(" As if you didn’t already know the most important things about me, right?” She jerks her hips at you unsubtly. “");
        else if (looksFemaleToRamis() && flags["RAMIS_TIMES_DRINK"]) output(" You’ve been on nights out with me mate, you’ve already gotten to know me the best way possible.");
        output(" Alright, tell you what, " + ramisNickname() + "… “ She gestures at a drink dispenser nearby. It’ll synthesize almost anything, but will have to be recharged when you’re next in port. “ ...get a bottle of scotch. It’ll make this seem less like a job interview. And you’ll <i>definitely</i> get to hear all of my boren stories once I’ve had a few glasses!”");
    }
    else
    {
        output("“You wanna pass the bottle around a bit, get sloppy?” grins Ramis. “Nice. Your ship, your treat, though.”");
    }

    if (pc.credits >= 100) addButton(0, "Ok", ramisCrewTalkStart);
    else addDisabledButton(0, "Ok", "Ok", "100 credits.");
    addButton(1, "Sober", ramisJoinAAAlreadyGeez);
}

public function ramisJoinAAAlreadyGeez():void
{
	clearOutput();
	author("Nonesuch");
	showRamis();
	clearMenu();
    processTime(1);
    
    output("“Sober’s lame,” she yowls, when you say you’d rather talk to her sober. “Particularly when it’s just us two talken. No, sorry [pc.name], but you ent getten anything out of me until you stop bein’ tight and buy a lady a drink.”");
    
    addButton(0, "Next", crew);
}

public function ramisCrewTalkStart():void
{
	clearOutput();
	author("Nonesuch");
	showRamis();
	clearMenu();
    processTime(1);
    pc.credits -= 100;
    
    output("After a few moments of processing, the drinks machine dispenses a spirits bottle, before filling it with a middling approximation of Ur Caledon’s finest. Ramis produces a couple of glasses as if by magic, and a few further moments later you’re watching her slam down a full one in a single gulp. She waits for you to take a sip of the burning fluid before refilling herself.");

    output("\n\n“Alright then, Steele. What do you want to know?”");

    ramisCrewTalkTopics();
}

public function ramisCrewTalkTopics(ramisDrinksAndDisable:Array = {-1, -1}):void
{

    //Every time a talk scene ends, take a drink
    //ramisDrinks starts from -1 so the initial scene keeps the pc sober
    var ramisDrinks:int = ramisDrinksAndDisable[0] + 1;
    if (ramisDrinks > 0) pc.imbibe(20);
    //if (ramisDrinks > 4) mainGameMenu();? Gotta give the player alcohol poisoning somehow.
    
    var disable:int = ramisDrinksAndDisable[1];
    if (disable == 0) addDisabledButton(0, "Background");
    else addButton(0, "Background", ramisTalkBackground, {ramisDrinks, 0}, "Background", "Ask where she came from.");
    if (disable == 1) addDisabledButton(1, "Adult Life");
    else addButton(1, "Adult Life", ramisTalkLife, {ramisDrinks, 1}, "Adult Life", "Ask how she got onto the Frontier.");
    if (disable == 2) addDisabledButton(2, "Mercing");
    else addButton(2, "Mercing", ramisTalkWork, {ramisDrinks, 2}, "Mercing", "She could surely tell you a few hair-raising tales.");
    if (disable == 3) addDisabledButton(3, "Hobbies");
    else addButton(3, "Hobbies", ramisTalkHobbies, {ramisDrinks, 3}, "Hobbies", "Which does she enjoy the most - clubbing, working out or doing boys?");
    addButton(14, "Back", crew); //9999
}

public function ramisTalkBackground(RDAD:Array):void
{
	clearOutput();
	author("Nonesuch");
	showRamis();
	clearMenu();
    processTime(15);
    
    var ramisDrinks = RDAD[0];
    
    output("You ask where she was born.");

    output("\n\n“Don’t know mate,” the big kaithrit replies. “I’m an orphan. My mum left me on Newydd Casnewydd. Not offended you don’t know it, don’t worry - it’s a Snugglé agriworld. The corporation adopted and raised me. The second name you get is just the batch you were raised in, 29 other people my age out there called Ramis. Because it was Snugglé, if you were a boy your first name was a fruit, if you were a girlee a flower. So my first name is Hyacinth. Which you’re not ever goen to use,” she adds warningly.");

    output("\n\nYou watch her take a pull on her scotch.");

    output("\n\n“It’s quite common in kaithrit territory, y’know. The girls want to do whatever they want with the guys, the herms get to do whatever they want with anyone, and then the girls want to keep on keepen on, don’t they? Particularly with the Rush on, kaithrit are <i>mad</i> for it. The Roshan Hegemony have a deal with a bunch of mega companies. Soft-claw tax and OHS laws, in exchange for them taken in any littel bundles of joy left on their doorsteps. Works out pretty nice for the corporations: More profit, <i>and</i> a child labor force.”");

    output("\n\nYou ask what it was like, being raised by a corporation.");

    output("\n\n“Boren,” Ramis says ruminatively, and then laughs. “Really fucken boren. It could’ve been way worse, you hear stuff about the Xenogen and ApoSynthesis orphanages that makes your blood run cold. So thanks for abandoning me on a planet where I just had to pick beans every day between the ages of 6 and 15, mum! They taught us and kept us clean and stuff as well, don’t get me wrong. Also, because I got big fast nobody tried picking on me and my friends after I got to about 12. Could definitely have been worse.");
    if (ramisDrinks < 2) output(" But… y’know.” Ramis taps a claw on the table surface, looking at her glass. “It is difficult when you’re a sprog, if nobody cares. The orphanage’n field staff <i>cared</i>, but they <i>cared</i> in the same way you care about a parcel you’re deliveren, y’know? You’re an item they’re processen through the system. And, once I got big, I had to be the tough one for all the smaller kids. I never… had anyone. I didn’t really know that, think about it as… somethen missen about me, until I met a few people with kids.”\n\nShe sniffs snottily, before hitting the glass back again.");
    else output("”");
    
    ramisCrewTalkTopics(RDAD);
}

public function ramisTalkLife(RDAD:Array):void
{
	clearOutput();
	author("Nonesuch");
	showRamis();
	clearMenu();
    processTime(15);
    
    var ramisDrinks = RDAD[0];
    
    output("“Getten off Newydd Casnewydd was tough,” Ramis says. “Snugglé land you with a bunch of debt once you reach 16, the cost of your upbringing. It’s great bein’ a corporate orphan, you know: the prezzie you get when you become’n adult is a bank statement five figures in the red. It’s part of the whole graft - by that point you’re sort’ve a unique asset to them, somebody young on-site who knows all of their systems instinctively, they want you to stay. So they immediately offer you a job to work off the debt, ‘n then they’ll offer you some <i>more</i> debt so they can sponsor you through higher education… fuck that. Fuck ALL of that.” She bangs her glass down vehemently. “I didn’t care how dirty or dangerous it was, I wanted off that fucken sterile green rock so bad I cried until one of the staff drove me down to the spaceport and left me there. Like my mum, only in reverse.”");

    output("\n\nYou ask how she proceeded from there.");

    output("\n\n“With the first vessel who were willen to listen to a broke, pleaden teenager. Bunch of pirates who were there maken a bulk purchase of plonk. Once we were off-world they passed me around a bit, couple of gangbangs when the drink really flowed. I didn’t mind; they sort of made clear from the get go what they umm, saw my ship role as bein’.” She makes a wry face. “They were kind in other ways. Certainly generous with the drink. And I picked up a few things about ships and weapons. Slipped off when we were docked at a big spaceport, and there I signed on with a merc company. Pretenden to be way older and experienced than I was.” She leans back, flexes her arms, and grins. “Bein’ a big wun has its perks.”");

    output("\n\nYou ask if she’s paid off what she owed Snugglé.");

    output("\n\n“Bloody hell, yeah,” the kaithrit replies, shaking her head. “Took the most dangerous and sketchiest work I could, lived in a hotel compartment slightly longer than I am for the best part of 3 years, just so I could afford the payments. No way was I getten some dead-eyed bounty hunter on my tail, draggen me back to that bloody planet-wide farm.”");


    if (ramisDrinks > 2)
    {
        output("\n\nShe smacks her lips appreciatively as she sips her scotch.");

        output("\n\n“You know every month when I paid them their pound of flesh, they sent me back a message detailen job opportunities?” she slurs. “Given me updates about where all my old friends were, and how easy it would be to see them again if I just came back? Like, they worked out I was worken as a merc almost straight away, and started senden me stuff about their security division and prison work schemes? Mega-corps fucken hate it when you walk away from them. Hate it, don’t understand it. Once they get their umm, mosquito-nose into you, they expect it to be there for good.” She laughs. “I’d like to load a surface buzzer up with lava missiles, then do exactly what they want, go back to Newydd Casnewydd. If I could do it without hurten anyone, I’d be there in an instant. Sow those fields of beans ‘n adverts ‘n debt with fire. Bloody hell that would be satisfyen!”");

        output("\n\nShe flings her arms out, goes ‘Woosh’ and then laughs even more heartily - until her gaze returns to you and she bites down on it a bit.");

        output("\n\n“Uhh… just somethen to think about, captain. When you’re the owner of that massive minen company of yours, like.”");
    }
    
    ramisCrewTalkTopics(RDAD);
}

public function ramisTalkWork(RDAD:Array):void
{
	clearOutput();
	author("Nonesuch");
	showRamis();
	clearMenu();
    processTime(15);
    
    var ramisDrinks = RDAD[0];
    
    output("You ask about her mercenary career.");
    output("\n\n“You want to hear about some guts’n glory, do you?” Ramis laughs. She swirls her scotch, gazes into the roiling amber. “Hmm. Let me have a think…”");
    
    switch(ramisDrinks)
    {
        case 0:
            output("\n\n“Would you like to hear about my very first mission?” she says. “First mission, they always tell you: take some corpo guard duty. Get signed on to a merchant convoy. The pay’ll be piss, but you’ll learn the ropes, make some mates, get the sense of how bloody boring 90% of the work is. Get yourselve experienced. Me?” She turns her big, gleaming, fanged smile on you. “I joined a joint company expedition, taken out a major pirate base in an unclaimed, uncharted system.”");
            output("\n\n“The mad lads had built their gaff into a giant asteroid, right in the middle of a belt. They had a custom AI in there which mapped the belt and auto-navigated their ships out of there, bloody impossible to get in or out otherwise. They must’ve thought nobody could get at them - ‘ticularly given the way they spread their raids out, bloody hell. We had to blast our way in with nukes and kinetic cannons, all the while they were firing missiles and laser discharge out in every direction. Bloody amazen light show.”");
            output("\n\nShe pauses, takes a sip.");
            output("\n\n“The ship to portside of the one I was in took a hit, slap on the bridge, made it lurch toward us. In a panic I shouted at our pilot to boost us forward, which he did - right into a small asteroid. The armor held. No reason it should have. Doing that meant a missile aimed at us missed, hit the other ship instead. No-one on board survived. Well, we got the pirates in the end, brought in most of them alive even. It didn’t feel like much of a victory to me... but the rest of the crew celebrated like it was. I went along with it, and I guess after a few drinks it did.” She shrugs. “Learned a hard lesson that day, " + ramisNickname() + ": You can be as skillful’n experienced as much as you like. Once the shooten starts, whether you survive or not is mostly down to luck. That’s why I live the way I do - in every fucken moment.”");
            break;
        case 1:
            output("\\n“My last big mission! Ohh " + ramisNickname() + ", I lived off’ve that for months!” Ramis cries, eyes gleaming like marbles in the dark. “After you’ve been in the business as long as I have, you get to learn which jobs are bad, ‘n which ones’ll be good, just from who’s payen, how much, and what they DON’T put in the description. This one was posted by a local colonial government - good, not corpos - looken for someone to bust up a slaven ring - good, get to take down real trash - and they DIDN’T ask for a certified company. Which meant that somebody like Black Void was involved, so nobody big’n established was willen to touch it.”");
            output("\n\nTails lashing, Ramis positions cutlery and glasses on the table, so you can see exactly how things played out. She’s well into this.");
            output("\n\n“I got my best crew together, we scouted that rodenian colony out, and we worked out how things must be goen down - the slavers’d paid off a couple of peeps in the spaceport to look the other way, and then they were snafflen workers and travellers off-world in one unmarked tanker or another. I almost didn’t blame them. Those wee little mice…” she bats a salt-shaker back and forth. “You just want to play with them, y’know?”");
            output("\n\n“Anyways. We staked that place out well secretly like, had our ship in low orbit cloaked’n watchen. I was off the sauce the whole time, believe it or not! We caught them in the act - a daynar girlee, a tarratch ‘n a gryvain, done up to the nines and showing off their bits, flashin’ colors, transfixen mice’n then getting at that suggest-y spot they’ve got at the back of their bonces. When I came out with a chain laser cannon, you know what they did? Tried it on with me!” Ramis laughs harshly, banging her glass. “Guess they worked out I’m not into girlees when I atomized the daynar.”");
            output("\n\n“The Black Void lot completely lost the plot after that. Half uvvem started shooten up the place, a bunch of them ran into the tanker and scarpered. I left my crew to deal with the ones on the ground, buzzed our pilot to come pick me up, and then we tailed the tanker. Fucken muppets led us straight to their orbital slave pen!”");
            output("\n\nThe kaithrit finger guns the room, swivelling in her seat, taking careful aim with her claws and thumping her arms back with imaginary recoil.");
            output("\n\n“They thought they could drive us off with half a dozen plasma launchers. They might’ve done… except if you’re packing that much firepower AND you’ve got a slave grid, your generator is probably overclocked to the bloody max. Just needed to get two clean shots on that to shut the whole station down… then I took out their emplacements, one by one.”");
            output("\n\nShe beams at you, rosy-cheeked.");
            output("\n\n“Bloody amazen result, captain. We got most of the rodenians back, didn’t take one casualty, merked a dozen of the worst scumbags in the galaxy, decked a whole bunch of Void hardware AND got paid premium to do it all. The party we had afterwards!” She swigs her glass of scotch, bangs it down with a sigh. “Course, the Void who surrendered got one guy to carry the can ‘n the rest got off on technicals thanks to their legal department, and they made sure to blacklist me afterwards so I can’t work for any of the major merc companies now even if I wanted to. I’m more’n happy about that.”");
            break;
        case 2:
            output("\n\n“After that first bloody mission of mine went tits up, I went in for more safe work for a bit,” Ramis sighs. “Began thinken about all my debt, decided I needed steady work anyway. Supply convoys want merc crews with them on the frontier, no matter how much of a milk run it is - pirates’ve gone crazy in this Rush, so many reports of bad stuff happenen out on remote colonies’n systems. Works out alright for me, cuz then I get paid to just stare at space elevators in a corvette for twenty hours.”");
            output("\n\nShe laughs with an uncharacteristically bitter edge.");
            output("\n\n“Took me a while to figure out the two were linked. Merc companies worken with peeps like the Black Void, runnen protection rackets, everyone gets a cut. You don’t get in on that shite until you’ve been worken with one crew or another for a while. I suppose I got too distracted to put two ‘n two together at the time.” She smiles more warmly. “Cuz you get to spend downtime on those distant stations ‘n mining platforms. And my word, are the worken boyos ‘n girlees happy to see anyone new. Oh, we had some amazen parties back then, drunker then I’ve ever been!");
            output("\n\n“Spacewalks whilst half-cut, chucken conc grenades into zero grav minen shafts, tryen out the weirdest temporary TF combos we could think of… we were so lucky we didn’t kill ourselves,” the kaithrit reminisces happily, leaning back on her chair. ”And, of course, I had the pick of the boyos. I’d have a fit lad on Saturday, a sissy on Sunday, back on board ‘n back to port on Monday, never hear from either again. What a life.” She sips her drink. “If the pay wasn’t so shite, and it wasn’t so bloody boren the rest of the time, I’d probably still be doin’ that.”");
            break;
        case 3:
            output("\n\n“Every bounty hunter’s got the story of the one that got away,” Ramis declares, yellow pupils now thoroughly dilated. “They’re talken shite, there’s always more’n one, no job involven a dozen secondary school dropouts armed to the teeth goes ezackly smoothly. I’ve got one story I always tell, though… this shipping company operating out of the Nokador Sector sent out an APB for any mercs willen to take down this one pirate who kept raiden their stuff. I normally wouldn’t’ve taken it, bounty hunten’s for mums, but they were offeren an arm’n a leg for a successful capture. Whoever it was must’ve really been taken the piss.");
            output("\n\n“So there was about twenty’ve us. Cyrilians, cundarians, all sorts, we agreed that whoever got the final shot on this kui-tan piece of work got a third of the bounty, en everyone else would share the rest. Fair craic. We used shippen logs to track her, hunted her down to this knocken shop in a hive city on Sigius VI.” Ramis lowers her voice, getting into her retelling. “Five of us went inside, the rest surrounded the building, dismal fucken place in the lower strata. I s’pose somebody must’ve tipped her off, cuz just as we were about to burst into her room she jumped out of the window bollock naked, the only really good look I got of her was her tail and arse disappearen through the curtains, the pro she had bin with screamen fit to burst.”");
            output("\n\nThe kaithrit guffaws, spilling her drink as her muscles wriggle, reliving the chase. “She got past the boys we posted outside somehow, don’t ask me how, and we wound up chasen that stark naked little slag across half the lower levels of the hive. Best fun I’ve ever had on a job, bloody hell, how did she do it? Jumpen across buildens, snatchen onto auto-trams and then button-hooken into sub-tunnels, all with that ridiculass willy of hers wagglen everywhere like an elephant’s trunk!”");
            output("\n\nShe mimics the movement with her forearm, laughing, before framing the situation firmly in front of her face as soberly as she can.");
            output("\n\n“So. Me’n the rest, we got our heads together, sent people ahead, eventually cornered her in a warehouse right on the very wall of that filthy hive. There was no way she was getten out this time, it was deserted for yards all around, and we really had it bare surrounded this time. We combed it, nice’n methodical, floor by floor. We knew she’d be in the cellar. We were ready for a real fight.”");
            output("\n\nShe leaves you hanging for a few seconds, swirling her scotch.");
            output("\n\n“Nobhead wasn’t in there, was she? Worked out eventually she’d wriggled her way right out of the city through a sewer pipe. Two feet wide and almost a mile long it was, so caked in filth we didn’t even spot it until it was too late. Un-fucken-believable.” She takes a big gulp, shaking her head with a wry grin after she’s swallowed down the burning liquid. “We <i>did</i> put the wind up her enough to stop raiden that sector, so after a lot of wranglen we did get the company to stump up half of the bounty. Which shared around twenty bods was roughly nothen.”");
            output("\n\nRamis taps her empty glass wistfully.");
            output("\n\n“I’d love to get another go at punchen that kui-tan’s ticket, whoever she was. Not cuz I resent her or anythen. Just chasen her was one of the funnest things I’ve ever done.”");
            break;
        case 4:
            output("\n\n“Hmm.” Ramis twists her glass round and around, her yellow eyes on the glittering crystal and booze. She’s good and drunk now, and you sense a secret inside her beginning to yaw open, like a gate off the latch. “Did I ever tell you I used to work for SagiTom, " + ramisNickname() + "?”");
            if (flags["RAMIS_TALKED_SAGITOM"] == undefined) output("\n\n“SagiTom?”");
            else output("\n\nYou nod at her to continue.");
            output("\n\n“They’re a mercenary group, one of the best - or dead professional, anyway,” Ramis says. “They don’t let just any random spod join, you’ve got to have years of work behind you, and even then they vet you very carefully. I was dead chuffed when I was approached. I thought I was finally maken my way in the work.”");
            output("\n\nShe flexes out all the claws in one hand, examining them silently. For a few moments you think she’s not going to continue.");
            output("\n\n“My first mission was to deal with these terrorists who were targeten a synth template plant on some core world. I suppose that should’ve been my warnen - what kind’ve terrorists target corpos? But the whole operation was so slick and well-organized, we all knew exactly what our roles were, the tech we had so bang new it seemed impossible anythen would go wrong. Some of the officers, the serious business ones with the tats and implants, they had secondary orders us grunts didn’t get to know - you’d see them in tactical after we’d finished goen over stuff after we’d finished - but in the moment, you know, that just impressed me. Like, it was such a carefully arranged plan there were moven parts that us soldiers didn’t have to think about, right?");
            output("\n\n“So we get to that sodden planet, we come in on our lander, we’re all done up in our fancy armor and our heads-up feeden us everything, all of us primed like nades in the tube, the doors open and… “ Ramis swings her fist slowly through the air, opens it with a poof of her cheeks. “It ent terrorists. It’s a protest. Street filled right back with people, all ages, all races, homemade placards, holo-boomers en the lot. Corny handpainted slogans on their signs about not wanten their world taken over by ApoSynthesis, color drainen from all their faces as they looked at us. And then we piled into them.”");
            output("\n\nRamis drains the whole glass in one gulp. Drink pours in, words pour out.");
            output("\n\n“I don’t know why I didn’t - we were <i>told</i> there were goen to be civilians in the vicinity en to remain calm, but not <i>specifically</i>... but what did I do? I did my job. Whole thing went like clockwork, slick machine, like we’d practiced. Like I <i>wanted</i> it to. Beaten back mobs of screamen, frightened people, some fallen over and breaken bones, formen that cordon of kinetic shields so the secondary crew could ‘neutralise the terrorists’.” She bitterly air-quotes with two pairs of claws. “The protest organizers en union reps. Think I heard one of them ask about their rights before she got beaten to the ground. I didn’t even see what happened to ‘em - there was a second lander, the one the higher ups came in, and that’s the one the organizers were taken off in.”");
            output("\n\nShe stares into the middle distance, tails lashing.");
            output("\n\n“And the whole time I was doin’ it, beneath the ‘stay calm, keep focused, stay calm’ beaten through my mind, I was thinken about how much I hated Snugglé. All the shite they do, the way they do just take over planets and give two fingers to anyone on them who doesn’t happen to like it. How I’d done everythen possible not to just become one of their drones, taken a nice pay-packet and not thinken about where it came from. And… there I was. Breaken up an anti-corpo demonstration, breaken students’ teeth. Bloody hell, I got a fucken <b>commendation</b> for it.” She spits the word. “Operation scored 98% in the evaluation, all of us wet-behind-the-ears got a clap on the back and a small bonus. I went to the trouble of looken up the extranet reports of what’d happened. ‘Police Forced Into Action After Extremists Instigate Riot’. Fuck me.”");
            output("\n\n“I’m guessing you stopped working for SagiTom,” you say.");
            output("\n\n“Ooh, you’re a quick one, aren’t you " + ramisNickname() + "?” the big kaithrit replies, a glimmer of good humor returning to her ruddy complexion. “I worked out afterwards that them droppen you into stuff like that as your first mission is ackshullee the last part of their vetten process. Maybe you got the stats but not the mindset, right? Well - I definitely didn’t. I quit the very next day. Been an indie ever since. Doesn’t pay anywhere near as well, but I’m not in it for the money anymore. And it does mean that sometimes… “ She spreads her arms, indicating the room and you, grinning toothily. “ ...you happen on really magic gigs.”");
            output("\n\nYou grin back, and click your glass into hers.");
            
            flags["RAMIS_TALKED_SAGITOM"] = 1;
            break;
        default:
            output("\n\nRamis is so drunk she only manages to mumble something about you notifying the developers about an error in her talk scenes.\n\n<b>Maybe you should please do that.</b>");
            break;
    }
    
    ramisCrewTalkTopics(RDAD);
}

public function ramisTalkHobbies(RDAD:Array):void
{
	clearOutput();
	author("Nonesuch");
	showRamis();
	clearMenu();
    processTime(15);
    
    var ramisDrinks = RDAD[0];
    
    output("You ask what she enjoys doing the most.");

    if (ramisDrinks > 1)
    {
        if (looksTrappyToRamis() && 9999 /* bottom */) output("\n\n“You, mostly,” she replies with a big grin. You roll your eyes; you should have seen that coming. “It’s great to be worken on a ship where I can get my teeth into a mincen little sissy whenever I want. And most home boyos only let me do it to them once! You’re the best boss I ever had, Steele.”");
        else if (looksMaleToRamis() && 9999 /*toppo*/ output("\n\n“You, mostly,” she replies with a big grin. You roll your eyes; you should have seen that coming. “Most guys talk a good game, but’d rather hide in the bogs then take me on. So all I get are kui-tan girls tryen their luck, cuz they think they can shag anythen! You, though: you do it like you mean it. Then you’re just a mate afterwards. You’re the best boss I ever had, Steele.”");
    }

    output("\n\nShe sips her scotch and thinks about it for a bit.");
    output("\n\n“I dunno, it’s all kind’ve the same thing to me,” she replies. “I work out so I have enough energy’n strength to do my job but also really go to town when I’m in port, and I do that so I ent sad when I sign on for a dangerous mission. No regrets, see? If my AVP gets hit by a remote plasma det in some armpit of a warzone, or the fly boy doesn’t carry the one and FTLs our bird into an asteroid, it’ll be fine. I’ll have lived the life I wanted to live, seen bloody loads, not leave anythen behind except a great fucken body. Not bad for an orphan who started with less then nothen.");
    output("\n\n“I kind of feel sorry for you in a way, " + ramisNickname() + "...” Ramis waggles an empty glass at you, smiling lopsidedly. “You’ve got all this bollocks to think about, this mental scavenger hunt your dad put together’n this giant company of yours you’re supposed to take over, <i>as well as </i> runnen this ship and tryen not to die out here.");

    if (ramisDrinks < 4)
    {
        output(" I’ll take bein’ the dumb muscle any day of the week.”\n\n“You don’t actually feel sorry for me,” you say, raising your own glass. “Do you?”\n\n“With that nursery and hangar of yours? Fuck no,” Ramis replies, laughing as she pours herself another.");
        
        ramisCrewTalkTopics(RDAD);
    }
    else
    {
        output(" We’ve had a few now captain, so tell me honestly.” Wag wag goes the glass, narrowly avoiding a spill. “Do you really want to be in charge of Steele Tech, once all this is over?”");

        addButton(0, "Yes", ramisCompanyReply, true);
        addButton(1, "No", ramisCompanyReply, false);
    }
}

//'Cause I don't wanna make two functions. Sue me.
public function ramisCompanyReply(wantit:Boolean):void
{
	clearOutput();
	author("Nonesuch");
	showRamis();
	clearMenu();
    processTime(5);

    if (wantit)
    {
        output("The life of an itinerant frontiersperson has its moments, but you also know it isn’t exactly sustainable. You’ve seen enough out here to know you’re extremely lucky to have your inheritance, and you absolutely intend to take up the reigns of the family business as Victor wanted. It’s not as if you can’t still have fun, is it? As best you can with the amount of scotch currently circulating your system, you put all of that to Ramis.");
        output("\n\n“Fair fucken points,” she replies slowly. “I guess I’ve never imagined having a goal like that in life - at least not once I paid off all of my debt.” She smiles at you. “I suppose it’s nice to have someone in charge who’s driven like that. We’re goen to get your dad’s silver, and no-one’s going to stand in your way, are they " + ramisNickname() + "? Here’s to you.”");
        output("\n\nShe gives you a lusty salute with her glass, and this time the amber fluid <i>does</i> slop everywhere.");
    }
    else
    {
        output("You’ve known this quest was total nonsense, right from the start. What could surviving out here on the frontier possibly teach you about running a mega corporation like Steele Tech? Frankly, the only reason you’re doing it is to stop your rotten cousin from grabbing it - and to hang on to some of the most valuable assets Victor left you, like the incredible nursery and hangar on Tavros. Once you’ve succeeded, you fully intend to immediately step down as CEO, then carry on the exciting, fulfilling, sexy life you’ve found for yourself out here.");
        output("\n\nAs best you can with the amount of scotch currently circulating your system, you put all of that to Ramis.");
        output("\n\n“I knew it!” she cheers loudly. “You’re like ME " + ramisNickname() + ", liven in the moment rather than dreaming of fucken boardrooms, ‘n money you won’t even know what to do with. You’ll keep me on, once you <i>do</i> get off the company leash, right? Oh, we’re goen to have so much <i>fun</i>!”");
        output("\n\nShe lustily bangs her glass into yours, and this time the amber fluid <i>does</i> slop everywhere.");
    }
    
    ramisCrewTalkTopics(RDAD);
}



