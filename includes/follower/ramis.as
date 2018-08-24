/*  ramis follower expansion

things to do (DO NOT PUSH IF THIS IS NOT EMPTY. THIS MEANS YOU, ME.):
higher vag cap
*/

public function ramisfmt(femString:String, manString:String, trapString:String):String
{
    if (pc.isFemale() || pc.isFemHerm() || pc.isSexless() || pc.isShemale()) return femString;
    else if (pc.isFemboy()) return trapString;
    return manString;
}

public function ramisRecruit():void
{
	clearOutput();
	author("Nonesuch");
	showRamis();
	clearMenu();
    processTime(2);
	
	var isFem:Boolean = (pc.isFemale() || pc.isFemHerm() || pc.isSexless() || pc.isShemale());
	var isFemboy:Boolean = pc.isFemboy();
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
            output("\n\n<i>“Well now mate, that depends on who’s asken, doesn’t it?”</i> Ramis swivels around on her bar stool to consider you with a toothy, impartial sneer. <i>“Course you’re wanten the best gunnery officer the galaxy’s ever known on board your tub, of course you do! But I don’t just work for <\i>any<i> old spod. What kind of reputation would I have, if I could just be picked up in a bar like...”</i>");
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

    addButton(0, "Next", mainGameMenu);
}