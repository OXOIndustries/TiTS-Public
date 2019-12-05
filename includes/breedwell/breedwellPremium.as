/* Breedwell Premium Breeder by Nonesuch*/

/**
	 * ...
	 * @author DrunkZombie
	 */
/*
//Note: this is the class for the core functionality of the contract
//see breedwellPremiumBootyCalls.as for the actual booty calls
//
New Flags:
	BREEDWELL_PREM_CNT //number of times has signed contract
	BREEDWELL_PREM_QUOTA //quota required for current contract
	BREEDWELL_PREM_PAYPERIOD //current pay period of contract
	BREEDWELL_PREM_MISS_QUOTA // 1+ = missed quota	
	BREEDWELL_PREM_BACKPAY //pay being held due to missing quota
	BREEDWELL_PREM_TTL_PAY //lifetime pay tracker
	BREEDWELL_PREM_DAY //used to track current day of contract for monthly earning, quota, etc...
	BREEDWELL_PREM_SEX_CNT //used to track number of encounters in current month
	BREEDWELL_PREM_KID_CNT //used to track number of kids birthed in current month
	BREEDWELL_PREM_SEX_CNT_CON //used to track number of encounters in current contract
	BREEDWELL_PREM_KID_CNT_CON //used to track number of kids birthed in current contract	
	BREEDWELL_PREM_SEX_CNT_TTL //used to track number of encounters in total
	BREEDWELL_PREM_KID_CNT_TTL //used to track number of kids birthed in total
	BREEDWELL_PREM_PUNQ_CNT //number of times punished for not meeting quota
	BREEDWELL_PREM_PUNK_CNT //number of times punished for keeping babies
	BREEDWELL_PREM_KEEP_KID //1 = kept kid
	BREEDWELL_PREM_PUN_WARN //1 = warned about punishment
	BREEDWELL_PREM_DONT //number of times decided not to sign
	BREEDWELL_PREM_POD_BAN //1 = steele banned from pods
	BREEDWELL_PREM_CON_BAN //1 = steele banned from premium breeder contracts
	BREEDWELL_PREM_PUN_VISITORS //hours spent visitors punishment
	BREEDWELL_PREM_PUN_STAFF //hours spent staff punishment
	BREEDWELL_PREM_PUN_GUESTS //hours spent guests punishment
	BREEDWELL_PREM_EGG_CAP_BONUS //bonus rahn egg capacity for each womb (this flag value * 2 added to egg max)
	BREEDWELL_PREM_BADEND_COWMAZON //1 = cowmazon badend available
	BREEDWELL_PREM_BADEND_LAVLEV //1 = LavLev badend available
	BREEDWELL_PREM_BC_MHENGA //1 = mhenga booty call last done timestamp
	BREEDWELL_PREM_BC_UVETO //1 = uveto booty call last done timestamp

*/
//check if steele is qualified to become a premium breeder
//set preg to true to toggle preg check, used primarily for "Premium" menu option at breedwell
public function breedwellPremiumIsQualified(preg:Boolean=false):Boolean
{
	if (flags["BREEDWELL_PREM_CON_BAN"] == 1) return false;
	if (breedwellPremiumUnderContract()) return false;	
	if (preg && pc.isPregnant())
	{
		//return false if all wombs are full unless they are all breedwell rahn preg
		if (pc.findEmptyPregnancySlot(1) < 0 && pc.hasPregnancyOfTypeOtherThan("RahnPregnancyBreedwell")) return false;
	}
	if (!pc.hasVagina()) return false;
	if (StatTracking.getStat("pregnancy/rahn eggs/birthed") >= 18) return true;
	//may need to modify this in future if rahn births become possible outside of breedwell
	//perhaps subtract unique births from total. other generic rahn could be a problem though
	
	return false;
}
//invite email
public function breedwellPremiumInviteEmail():String
{
	var eText:String = "";

	eText += "<i>When you open the email, the screen turns pink and an image blossoms out of the centre. It’s of a heart shape, formed from the long tail of a sperm. Words fade in below.</i>";
	eText += "\n\nWe here at Tamani Corp are delighted that you have taken the opportunities provided by the Breedwell Incubation Centre. Through your selfless, rahn-bearing efforts, you have been a part of The Great Effort - and enabled us to produce erotic stimuli and test many prototype fertility treatments, many of which you were probably unaware of!";
	eText += "\n\nWe can see you enjoy working with us. So have you considered upgrading yourself to Premium Breeder status? For substantially better benefits and return, you could become a select, Tamani-endorsed breeder, trusted not only to produce a certain number of rahn per month, but provide first class relief to our rahn friends right across the frontier. You will be the egg-depository of choice to thousands of frustrated gel women, and you’ll receive a fantastic salary to do it! Interested? Visit the front desk today!";
	eText += "\n\n<i>The sperm-heart logo zooms down to land on the cheek of a cartoon ausar girl lounging on a bed. It morphs into a real ausar, who turns to the camera replete with tattoo and says with a bright smile ‘I’m doing my part!’ She’s surrounded by three rahn of different hues, who are merrily removing the ausar’s clothes as well as their own.</i>";

	return doParse(eText);
}
//earning email
public function breedwellPremiumEarningsEmail():String
{
	var eText:String = "";
	var sexRate:int = 130;
	var kidRate:int = 2700;
	var quota:int = flags["BREEDWELL_PREM_QUOTA"];
	var kids:int = flags["BREEDWELL_PREM_KID_CNT"];
	var sex:int = flags["BREEDWELL_PREM_SEX_CNT"];
	var kidPay:int = kidRate * kids;
	var sexPay:int = sexRate * sex;
	
	//check total vs quota
	if (kids >= quota)
	{
		eText += "Hey Premium Breeder!";
		eText += "\n\nThis month you provided us with " + num2Text(kids) + " baby rahn for " + kidPay + " credits. You provided essential relief to " + num2Text(sex) + " subscribers for " + sexPay + " credits.";
		eText += "\n\nYour total earnings this month: " + (kidPay + sexPay) + " credits.";
		if (breedwellPremiumUnderContract()) eText += "\n\nKeep up the great work!";
		else eText += "\n\nYour contract has expired. Visit Breedwell if you’d like to renew. We’ll be eagerly awaiting you!";
		eText += "\n\n<i>The email message ends with a cartoon of CEO Tamani, lounging happily in a big pile of tiny rahn. She’s bouncing one on her lap whilst others play with her hair and crawl all over her.</i>";
		pc.credits += (kidPay + sexPay);
		flags["BREEDWELL_PREM_TTL_PAY"] += (kidPay + sexPay);
	}
	else
	{		
		eText += "Hey Premium Breeder,";
		eText += "\n\nThis month you provided us with " + num2Text(kids) + " baby rahn for " + kidPay + " credits. You provided essential relief to " + num2Text(sex) + " subscribers for " + sexPay + " credits.";
		eText += "\n\nUnfortunately, you did not meet your quota for this month. To receive your earnings, please visit Breedwell so we can first take appropriate disciplinary action.";
		eText += "\n\n<i>The email message ends with a cartoon of CEO Tamani. She smirkingly alternates between wagging her finger at you and swishing a riding crop into her hand suggestively.</i>";
		flags["BREEDWELL_PREM_BACKPAY"] += (kidPay + sexPay);
		IncrementFlag("BREEDWELL_PREM_MISS_QUOTA");
	}

	return doParse(eText);
}
//number of contracts signed
public function breedwellPremiumContractCount():int
{
	var num:int = 0;
	if (flags["BREEDWELL_PREM_CNT"] != undefined)
	{
		num += flags["BREEDWELL_PREM_CNT"];
	}
	return num;
}
//can steele orgasm from giving bj
public function breedwellPremiumCanOrgasmGivingBJ():Boolean
{
	if (pc.lust() >= 75 || pc.isBimbo() || flags["USED_SNAKEBYTE"] != undefined) return true;

	return false;
}
//process anything related to premium breeder contract
public function processBreedwellPremiumBreederEvents(deltaT:uint, doOut:Boolean, totalDays:uint):void
{
	var conTerm:int = 90;
	if (breedwellPremiumContractCount() > 1) conTerm = 180;
	var timeRemaining:int;
	var timeTattoo:int;
	var desc:String = "";
	
	if (flags["BREEDWELL_PREM_DAY"] != undefined) flags["BREEDWELL_PREM_DAY"] += totalDays;
	
	var timestamp:int = GetGameTimestamp() + deltaT;
	
	if(flags["BREEDWELL_PREM_DAY"] != undefined)
	{
		if (breedwellPremiumUnderContract())
		{
			if (flags["BREEDWELL_PREM_PAYPERIOD"] == undefined) flags["BREEDWELL_PREM_PAYPERIOD"] = 1;
			timeTattoo = pc.getStatusMinutes("Premium Breeder Cheek Tattoo");
			timeRemaining = (conTerm - (flags["BREEDWELL_PREM_PAYPERIOD"] * 30)) * 24 * 60;
			//payout every 30 days
			if (timeRemaining > 0 && timeTattoo <= timeRemaining)
			{				
				resendMail("breedwell_premium_earnings", timestamp);
				flags["BREEDWELL_PREM_SEX_CNT"] = 0;
				flags["BREEDWELL_PREM_KID_CNT"] = 0;
				IncrementFlag("BREEDWELL_PREM_PAYPERIOD");
			}
			//if pc gets rid of all wombs end contract immediately
			if (!pc.hasVagina())
			{
				//removing the tattoos will trigger the end of contract code in the else below on the next processTime call
				if (pc.hasStatusEffect("Premium Breeder Cheek Tattoo")) pc.removeStatusEffect("Premium Breeder Cheek Tattoo");
				if (pc.hasStatusEffect("Premium Breeder Crotch Tattoo")) pc.removeStatusEffect("Premium Breeder Crotch Tattoo");
			}
		}
		//this means the contract has ended and should be closed out
		else
		{
			//last payout
			resendMail("breedwell_premium_earnings", timestamp);
			flags["BREEDWELL_PREM_DAY"] = undefined;
			flags["BREEDWELL_PREM_SEX_CNT"] = undefined;
			flags["BREEDWELL_PREM_KID_CNT"] = undefined;
			flags["BREEDWELL_PREM_SEX_CNT_CON"] = undefined;
			flags["BREEDWELL_PREM_KID_CNT_CON"] = undefined;	
			desc = "You feel a faint prickling sensation on your face, as if someone were flicking at your cheek with a brush. A quick check with your mirror app reveals that your Premium Breeder tattoo is fading away, the pink sperm losing their luminescence and disappearing into your [pc.skin].";
			if (breedwellPremiumContractCount() == 1) desc += " You guess this means your Breedwell contract has expired, and you’ll no longer get alerts from horny rahn. Maybe if you went back to Breedwell, you could get a new one.";
			else desc += " It can only mean your Breedwell contract has expired. Time to warp back there and get a new one - if you’re still interested in getting impregnated by big pozzed amoeba babes, that is.";
			AddLogEvent(desc);
			if (breedwellPremiumContractCount() >= 2)
			{
				desc = "There’s a funny tickling sensation on the sensitive spot just above your crotch. It’s your Premium Breeder tattoo fading away, commensurate with the end of your half-year-long contract with Breedwell.";
				if (flags["BREEDWELL_PREM_CON_BAN"] == 1) desc += " You feel despondent, knowing you’ll no longer be an agent of sexual pleasure and bearer of new life. An urge to go back to Breedwell pulls at you, to get a new contract sorted out. Maybe they’ll offer you something even better...";
				else desc += " You guess you’ll have to go back there and sign another, if you want to keep getting alerts from nearby rahn.";
				AddLogEvent(desc);			
			}	
		}		
	}
}
public function breedwellPremiumRecordBirth(kidCnt:int=0):void
{
	flags["BREEDWELL_PREM_KID_CNT"] += kidCnt;
	flags["BREEDWELL_PREM_KID_CNT_CON"] += kidCnt;
	flags["BREEDWELL_PREM_KID_CNT_TTL"] += kidCnt;
}
public function breedwellPremiumRecordSex(sexCnt:int=1):void
{
	flags["BREEDWELL_PREM_SEX_CNT"] += sexCnt;
	flags["BREEDWELL_PREM_SEX_CNT_CON"] += sexCnt;
	flags["BREEDWELL_PREM_SEX_CNT_TTL"] += sexCnt;
}
//[Premium] Quaelle
public function breedwellPremiumGetPremiumQuaelle():void
{
	clearOutput();
	showQuaelle();
	author("Nonesuch");
	
	var conCnt:int = breedwellPremiumContractCount();
	var firstTime:Boolean = true;
	if (flags["BREEDWELL_PREM_CNT"] != undefined) firstTime= false;
	var quaelleReserve:Boolean = false;	
	if (!pc.hasCock() && flags["QUAELLE_FERTILE"] == 1) quaelleReserve = true;
	
	if (firstTime)
	{
		flags["BREEDWELL_PREM_CNT"] = 0;
		if (quaelleReserve)
		{
			output("<i>“You’re interested in that, delectivious Steele?”</i> Quaelle smiles nervously, eyes sinking down to your [pc.belly]. <i>“It’s, hmm, a big commitment. And I, hmm, was hoping a certain amount of space was, that is to say... it may be somnolent for you to... both...”</i>");
			output("\n\nShe spends a few moments straightening her blouse, and then goes on in a more professional tone. <i>“Well. I’ll give you the presentation, and then you can decide for yourself, ok?”</i>");
		}
		else
		{
			output("<i>“Ohh, you’re interested in that are you, splendicant Steele? How tremulous!”</i> Quaelle smiles at you brightly. <i>“We have been told to encourage more volunteers to sign up for that.”</i>");
			if (flags["QUAELLE_TALK_RAHN_P2"] == 1) output("\n\nShe leans forward ponderously, and goes on more quietly. <i>“There’s been a shortfall in rahn young these last few months. Just as the rahn government won rights to another colony! The higher ups are dizzickly about it.”</i>");
		}
		output("\n\n");
		breedwellPremiumPresentationText();
		processTime(2);
		clearMenu();
		addButton(0, "Next", breedwellPremiumGetPremiumQuaelleNext);
	}
	else
	{
		if (conCnt > 0) output("<i>““Ohh, you’re interested in becoming a Premium Breeder again, shiverous Steele?”</i>");
		else output("<i>“Ohh, you’re still interested in becoming one of our Premium Breeders, shiverous Steele?”</i>");
		output(" ask Quaelle brightly, pulling out the holo-contract. <i>“Would you like the presentation again? Or are you happy to just sign, and get your lovely modifications done now?”</i>");

		processTime(2);
		clearMenu();
		addButton(0, "Sign", breedwellPremiumGetPremiumSign, false);
		addButton(1, "Don’t", breedwellPremiumGetPremiumQuaelleDont);
		addButton(2, "Presentation", breedwellPremiumGetPremiumWatchPres, false);
	}	
}
public function breedwellPremiumGetPremiumQuaelleNext():void
{
	clearOutput();
	showQuaelle();
	author("Nonesuch");
	
	output("So you’d be acting as a sort of on-the-go concubine to thousands of rahn, then.");
	output("\n\n<i>“Yes!”</i> beams Quaelle. <i>“You’ll get notifications if a local rahn needs your attentions, hmm hmm, and they’ll be able to see you clearly when you’re out and about once we put the tattoo on you. It’s all to help you achieve a quota of 18 rahn births per month. You’ll get special modding to increase your womb capacity if you need it, and if you meet your commitments, you’ll get triple what you earn now! How mumberfelt!”</i>");
	output("\n\nAnd if you don’t meet your quota?");
	output("\n\n<i>“Emmmmm.”</i> Quaelle fiddles with her stylus. <i>“Well, somnolent Steele, there are penalties worked into any contract. Why, there’s a few right there in your current one, as you’d know if you’d ever tried to keep any of the rahn you incubated. Not that a shiverous being like you would ever do such a thing!”</i>");
	output("\n\nShe pats you on your shoulder and hands you the holo-contract, tapping here and there with the stylus.");
	output("\n\n<i>“See though, it’s only for three months. Finding acres of sexy gel flesh and being stuffed full of eggs at every opportunity a bit exhausting? Just see it out and we’ll call it quits - the tattoo is programmed to go away painlessly. Decide it’s just the thing for you (as you and I know it is, trembulous Steele, hmm hmm)? Why, we can sort out an even juicier contract for you!”</i>");
	output("\n\nShe plops the stylus in your hand.");
	
	processTime(5);
	clearMenu();
	addButton(0, "Sign", breedwellPremiumGetPremiumSign, false);
	addButton(1, "Don’t", breedwellPremiumGetPremiumQuaelleDont);
}
public function breedwellPremiumGetPremiumWatchPres(dohrahn:Boolean=false):void
{
	clearOutput();
	if (dohrahn) quaelleShowDohrahn();
	else showQuaelle();
	author("Nonesuch");
	
	breedwellPremiumPresentationText(dohrahn);
		
	clearMenu();
	if (dohrahn) addButton(0, "Next", breedwellPremiumGetPremiumDohrahnNext);
	else addButton(0, "Next", breedwellPremiumGetPremiumQuaelleNext);
}

public function breedwellPremiumGetPremiumQuaelleDont():void
{
	clearOutput();
	showQuaelle();
	author("Nonesuch");
	
	var quaelleReserve:Boolean = false;	
	if (!pc.hasCock() && flags["QUAELLE_FERTILE"] == 1) quaelleReserve = true;
	
	if (pc.isNice()) output("You politely");
	else if (pc.isMischievous()) output("You smilingly");
	else output("You brusquely");
	output(" put the contract down. This seems a little too extreme for you.");
	
	if (quaelleReserve) output("\n\n <i>“Ohh, ok!”</i> Quaelle looks relieved. <i>“Yes, it’s a little too much right now, isn’t it? My thrombulent Steele.”</i> She strokes your shoulder fondly. <i>“You can always come back to it in a year or so, when your calendar might not be so, hmm, hmm, full. The offer will still be there!”</i>");
	else output("\n\n<i>“Of course, somnolent Steele,”</i> says Quaelle tactfully. <i>“It’s a large commitment, and I would hate to push you into it simply because I have my own quotas to consider. Maybe think about it for a bit and come back when you’re ready, hmm? There’s always time...”</i>");
	
	output("\n\nYou amble back to Reception, and Quaelle tucks the contract away. Notably within reach.");
	output("\n\n<i>“With that out of the way. Was there something else you were after, shiverous Steele?”</i>");
		
	IncrementFlag("BREEDWELL_PREM_DONT");
	
	processTime(3);
	clearMenu();
	addButton(0, "Next", quaelleMainMenu,false);
}	
//premium presentation text
public function breedwellPremiumPresentationText(dohrahn:Boolean=false):void
{
	if (!dohrahn)
	{
		output("She happily oozes out from behind the desk, and beckons you along the corridor to the observation chamber above the waiting lounge adjoining the breeding pods. Once again, you are looking down at the clusters of brightly colored gel women, excitedly chatting with one another as they wait for a coupling session.");	
		output("\n\n<i>“‘Emmmm... I’m afraid we haven’t had a chance to produce a full presentation for the breeders... beyond the email you received, of course,”</i> hums Quaelle. She taps and scrolls at one of the screens. <i>“But, look, you can watch the advert intended for the subscribers. That should make everything clear.”</i>");	
		output("\n\n");	
	}
	output("You sit yourself down and watch.");	
	output("\n\n<i>“Hey there, eager breeder.”</i>");	
	output("\n\nThe words of Tamani, but this time spoken in the slightly wet, girly tones of one of her go’rahn aides from the last video. The white gel girl is dressed in a smart, tight suit and is slowly walking through a large office.");	
	output("\n\n<i>“If you are watching this video, it means you have visited the Breedwell Incubation Centre and have expressed interest in our Premium Breeder program,”</i> she smiles. <i>“Firstly: Thank you for helping us in the Great Effort! Your eggings were gratefully received. But what is the Premium Breeder scheme? Tamani herself would be here to explain it to you. Unfortunately she is currently too full of rahn young to move, so I’m filling in.”</i>");	
	output("\n\nThe go’rahn stops by a white screen, upon which the PB logo is displayed.");	
	output("\n\n<i>“Sisters,”</i> she says, tapping the desk with a pointer with a slightly anguished expression on her pretty, noseless face, <i>“if you are anything like me, at certain times during the week you can get a little... anxious. A need to blow off some steam becomes too difficult to ignore, you know? Particularly if, again like me, you hold that stuffing your business away up inside you is uncomfortable, and a shame to do besides.”</i>");	
	output("\n\nThere is, indeed, a noticeable bulge at groin level on her tight, prim skirt. ");	
	output("\n\n<i>“It causes heartache to us here at Breedwell (in partnership with Tamani Corp) that viable eggs are lost by our sisters, say, cranking one off in the bathroom at work for lack of any other option,”</i> she goes on. <i>“Which is where the Premium Breeder scheme comes in. We’ve selected the most fertile and entertaining incubators that have passed through our doors, and paid for them to be available <b>at all times.</b>”</i>");	
	output("\n\nThe logo shrinks down, doubles itself, and lands itself on the cheek of an outline of a humanoid male and female. You frown. Is there something wrong with the audio? There seems to be a persistent flapping noise coming from somewhere.");	
	output("\n\n<i>“Upgrade to the scheme, and whenever you see this logo on a cute passerby, you’ll be able to ask them to help you out!”</i> the go’rahn continues brightly. <i>“Since they are paid more the more rahn they service, you know you will be getting experienced relief with a smile, however you want it, wherever you want it. It’s great! But don’t take my word for it. Ask Yolawmee, my recently upgraded colleague.”</i>");	
	output("\n\nShe walks on from the screen, and at last the source of the flapping comes into view: The other go’rahn from the first video, twin office gear dishevelled and skirt pulled down, is furiously pounding her hips into the upraised buttocks of a naked, redhead female human.");	
	output("\n\n<i>“And how are things going?”</i> the first rahn queries.");	
	output("\n\n<i>“So... fucking... tight... so... fucking... good!”</i> groans Yolawmee, drool coursing down from one corner of her mouth. She cranes her head back, eyes rolling, there’s a heavy wet sound - she thrusts herself into the redhead emphatically a few more times, drawing a hovering moan and wince from her - and at last the go’rahn relaxes, visibly thinner, and staggers back, drawing her smooth, ten inch long ovipositor outwards as she does.");	
	output("\n\n<i>“Now Yolawmee, I can’t hope but notice that you were fucking that human in the ass,”</i> the first go’rahn says, tapping her chin as she looks down at the girl’s wide, freckled backside. <i>“Is that really allowed under the scheme?”</i>");	
	output("\n\n<i>“You betcha Nihn - whew!”</i> The go’rahn is rearranging her clothes and checking her frondular hair. <i>“Our government wishes to encourage our most successful citizens in the outer territories to seek out relief from safe, vetted, professional sluts. Like Tess here!”</i> She casually slaps the girl on the buttock, drawing a squeak out of her.");	
	output("\n\n<i>“And you’re alright about that, Tess?”</i> Nihn queries, hands on knees.");	
	output("\n\n<i>“Huh? Oh, sure. I mean, obviously I’d prefer she put it up my foof instead of my dirtbox,”</i> replies the human with a grin. She’s got the PB tattoo emblazoned prominently on one of her rosy cheeks. A great load of white fluid oozes onto the pristine floor as she gingerly sits herself down. <i>“But whatever you girls need, I’m down for, y’know? I just want to make as many big-dicked jelly babes as happy as possible.”</i>");	
	output("\n\n<i>“Really?”</i> says Nihn. <i>“You know, it’s been a long morning, and... do you think I could get you to give my pussy a bit of attention?”</i>");	
	output("\n\n<i>“Do it Nihn,”</i> says Yolawmee, leaning on a desk, simmering with post-coital satisfaction. <i>“You won’t believe what this one can do with her tongue.”</i>");	
	output("\n\nStill standing, Nihn shoves her skirt down and, facing the camera, cranes her gently quivering butt backwards; with a happy beam, Tess grips the rahn’s thighs and dives in face first.");	
	output("\n\n<i>“Ooh my,”</i> Nihn coos, dark red eyes crossing slightly. <i>“Aren’t you eager! That’s... uh... some piercing you’ve got...”</i>");	
	output("\n\n<i>“Upgrade today,”</i> says the second rahn, stepping in front of the conjoined pair with a sultry smile. <i>“We have an ever growing number of Premium Breeders across many frontier and outer worlds waiting to satiate your urges today. Support the Great Effort! Have way more sex than any of your colleagues! Visit the BIC site and click on the banner to learn more.”</i>");	
	pc.lust(30);
	processTime(15);
}


//[Premium] Dohrahn
public function breedwellPremiumGetPremiumDohrahn():void
{
	clearOutput();
	quaelleShowDohrahn();
	author("Nonesuch");
	
	var conCnt:int = breedwellPremiumContractCount();
	var firstTime:Boolean = true;
	if (flags["BREEDWELL_PREM_CNT"] != undefined) firstTime= false;
	
	if (firstTime)
	{
		flags["BREEDWELL_PREM_CNT"] = 0;
		output("<i>“You interested?”</i> the purple rahn says, perking up a bit. <i>“That’s good. Great. Let me just... I’ll give you the Premium presentation after I...”</i>");
		output("\n\nShe spends a minute or so rapping out orders to the rest of the staff, and then briskly leads you into the breeding pod observation area. Once again, you are looking down at the clusters of brightly colored gel women, excitedly chatting with one another as they wait for a coupling session.");
		output("\n\n‘They still haven’t provided us with a proper vid for the breeders,”</i> scowls the do’rahn. She taps and scrolls at one of the screens. <i>“But, look, you can watch the advert intended for the subscribers. That should make everything clear.”</i>");	
		output("\n\n");
		breedwellPremiumPresentationText(true);
		clearMenu();
		addButton(0, "Next", breedwellPremiumGetPremiumDohrahnNext);
	}
	else
	{
		output("<i>“You genuinely interested? Or just want to be a pest again?”</i> queries the receptionist. She waves her arms defeatedly. <i>“Ah, whatever. Do you want the presentation again, or can we skip that and get to you signing the thing?”</i>");
		processTime(2);
		clearMenu();
		addButton(0, "Sign", breedwellPremiumGetPremiumSign,true);
		addButton(1, "Don’t", breedwellPremiumGetPremiumDohrahnDont);
		addButton(2, "Presentation", breedwellPremiumGetPremiumWatchPres,true);
	}
}
public function breedwellPremiumGetPremiumDohrahnNext():void
{
	clearOutput();
	quaelleShowDohrahn();
	author("Nonesuch");
	
	output("So you’d be acting as a sort of on-the-go concubine to thousands of rahn, then.");
	output("\n\n<i>“Pretty much,”</i> says the receptionist. <i>“You’ll get notifications if a local rahn needs your attentions, and they’ll be able to see you clearly when you’re out and about once we put the tattoo on you. It’s all to help you achieve a quota of 18 rahn births per month. You’ll get special modding to increase your womb capacity if you need it, and if you meet your commitments, you’ll get triple what you earn now. As well as a bonus for every rahn you, uh, satisfy.”</i>");
	output("\n\nAnd if you don’t meet your quota?");
	output("\n\n<i>“We’ll lock you in a breeding pod for 12 hours of free service.”</i> The do’rahn looks at you poker-faced. <i>“");
	if (flags["BREEDWELL_PREM_PUNK_CNT"] > 0) output("That’s right, the same as what happened when you decided to keep those babies for yourself. ");
	output("Company the size of T. Corp don’t mess around, kid. I might get commission for getting you to sign up, but I’m not gonna bullshit you. It’s a great scheme - if you’re up to it.”</i>");
	output("\n\nShe hands you the holo-contract and the stylus.");
	output("\n\n<i>“Three months and you’re done. If it goes well, you’ll get an offer for an even better contract after that. So. You up to it?”</i>");
	
	processTime(5);
	clearMenu();
	addButton(0, "Sign", breedwellPremiumGetPremiumSign,true);
	addButton(1, "Don’t", breedwellPremiumGetPremiumDohrahnDont);
}
public function breedwellPremiumGetPremiumDohrahnDont():void
{
	clearOutput();
	quaelleShowDohrahn();
	author("Nonesuch");	
	var firstTime:Boolean = true;
	if (flags["BREEDWELL_PREM_DONT"] > 0) firstTime = false;
	IncrementFlag("BREEDWELL_PREM_DONT");
	
	if (pc.isNice()) output("You politely");
	else if (pc.isMischievous()) output("You smilingly");
	else output("You brusquely");
	output(" put the contract down. This seems a little too extreme for you.");

	if (firstTime)
	{
		output("\n\n<i>“Fine. No, really. I don’t mind you completely wasting my time. It’s what I’m here for, after all. You can always come back and waste even more, if you like.”</i>");
		output("\n\nYou [pc.move] back to reception with the scowling do’rahn, and watch her shove the contract away.");
		output("\n\n<i>“I’m hoping you’re done with me, now,”</i> she sighs.");
	}
	else
	{
		output("\n\nThe do’rahn glares knives at you, and tucks the contract away silently.");
		output("\n\nIt is actually quite fun annoying her.");
	}
	
	processTime(3);
	clearMenu();
	addButton(0, "Next", quaelleApproachDohrahn);
}
public function breedwellPremiumUnderContract():Boolean
{
	if (pc.hasStatusEffect("Premium Breeder Cheek Tattoo")) return true;
	if (pc.hasStatusEffect("Premium Breeder Crotch Tattoo")) return true;
	return false;
}
public function breedwellPremiumGetPremiumSign(dohrahn:Boolean=false):void
{
	clearOutput();
	if (dohrahn) quaelleShowDohrahn();
	else showQuaelle();
	author("Nonesuch");
	
	var eggMax:Boolean = false;
	if (flags["EGG_TRAINING"] >= 5) eggMax = true;
	
	moveTo("BREEDWELL_MOD_BAY");
	
	IncrementFlag("BREEDWELL_PREM_CNT");
	
	output("Your gut leaps a little bit as you pick up the stylus. It’s certainly a big commitment... but c’mon, being a rahn slut whilst getting state-of-the-art mods AND getting paid more for the privilege? How is this not a win-win situation? ");
	if (dohrahn) output("\n\n<i>“Great,”</i> says the do’rahn, giving you a hearty smile for once as she watches you sign the three month contract. <i>“I’ll take you across to the modding bay right away.”</i>");
	else output("\n\n<i>“Ooh I’m so quiverful, Steele,”</i> coos Quaelle, as she watches you sign the three month contract. <i>“I just know this is a perfect career for you! Come on - we’ll go along to the modding bay right away.”</i>");
	
	output("\n\nBreedwell’s modding bay is a gleaming white and steel lab, the only color provided by the rahn aides, researchers and medics in their Tamani Corp jumpsuits. They greet you enthusiastically, and sit you down in a padded, dentist-like chair. The light of a scanner plays up and down your body.");
	
	processTime(2);
	clearMenu();
	if (eggMax)
	{
		output("\n\n<i>“Alright then Steele,”</i> smiles the consultant, a loo’rahn, <i>“It doesn’t look like we’re going to have to make any modifications to your womb. You’re as well trained an incubator as they come! So the only modification you require is our prototype pregnancy speeder. It should reduce rahn gestation for you, with no side effects.");
		if (pc.vaginaTotal() >= 3) 
		{
			addButton(0, "Next", breedwellPremiumGetPremiumSurgery,false);			
		}
		else
		{	
			output("\n\nWe also offer an optional modification to our Premium volunteers: We can induce you to grow another fully functioning vagina, potentially increasing how many babies you can carry. Would you like that?”</i>");
					
			addButton(0, "Yes", breedwellPremiumGetPremiumSurgery,true);	
			addButton(1, "No", breedwellPremiumGetPremiumSurgery,false);	
		}
	}
	else
	{
		output("\n\n<i>“Alright then Steele,”</i> smiles the consultant, a loo’rahn, <i>“the first modification we’re going to give you is going to increase the capacity and elasticity of your womb. It’ll increase how many eggs you can carry at a time. The second is our prototype pregnancy speeder. It should reduce rahn gestation from two weeks down to ten days, with no side effects.");
		if (pc.vaginaTotal() >= 3) 
		{
			addButton(0, "Next", breedwellPremiumGetPremiumSurgery,false);			
		}
		else
		{				
			output("\n\nFinally, we also offer an optional modification to our Premium");	
			if (pc.isCuntboy()) output(" cunt boys");
			else if (pc.hasCock()) output(" herms");
			else output(" girls");
			output(": We can induce you to grow another fully functioning vagina with no other side effects, potentially increasing how many babies you can carry. Would you like that?”</i>");
			addButton(0, "Yes", breedwellPremiumGetPremiumSurgery,true);	
			addButton(1, "No", breedwellPremiumGetPremiumSurgery,false);	
		}		
	}
}
public function breedwellPremiumGetPremiumSurgery(addVag:Boolean=false):void
{
	clearOutput();
	showBust("");
	showName("\nSURGERY");
	author("Nonesuch");
	
	var ttl:int = pc.totalVaginas();
	var vag:int = rand(ttl);
	var time:int;
	var desc:String = "";
	
	if (flags["EGG_TRAINING"] == undefined || flags["EGG_TRAINING"] < 5) flags["EGG_TRAINING"] = 5;
	//create new vag from random exising one
	if (addVag && pc.totalVaginas() < 3)
	{
		pc.createVagina();
		pc.copyVagina(ttl, vag);
		pc.vaginas[ttl].hymen = true;
		ttl += 1;
	}
	if (!pc.hasPerk("Rahn Super Incubator")) pc.createPerk("Rahn Super Incubator", 0, 0, 0, 0, "[altTooltip RahnSuperIncubator]");
	
	output("They put you under, and you wake under the sterile lab lights a little later, feeling groggy. The consultant hands you a mirror, and you consider the neon pink, heart-shaped tattoo formed by a long-tailed sperm that is now on your left cheek. Well... you guess that’s you, for the next three months. ");
	output("\n\nYou pass your hand over your [pc.belly]. There’s a faint, warm, glowy sensation in there - a suggestion of springiness, and fresh space perhaps, eager to be filled.");
	if (addVag)
	{
		output("\n\nFinally, you sink your hand between your [pc.thighs] and find that, yep, there’s another pair of lips guarding a moist tunnel down there now, right behind your");
		if (ttl > 2) output(" others. Having so many");
		else output(" first. Having two");
		output(" breeding bays, each with the desire to be packed out with hard, fertile cock - or ovipositor - gives you a little shiver, erotic whispers of potential murmuring in your mind.");
	}
	output("\n\n<i>“You’re entered into the Premium Breeder database now, " + pc.mf("Mr.","Ms.") + " Steele,”</i> the consultant tells you, handing you a glass of water. <i>“You will be pinged through your wrist device when nearby subscribers desire your company. You’ll be given a stipend for each encounter they give us a thumbs up from, regardless of whether they impregnated you. And, of course, you are still more than welcome to receive your eggings here! Just remember...”</i>");
	output("\n\nShe smiles at you briskly. ");
	output("\n\n<i>“We need 18 rahn babies out of you every 30 days. If you don’t manage that, we’ll find alternative ways for you to meet your quota. Now, off you go! Find some nice healthy rahn friends that can help you on your way! We’ll hopefully talk again in 3 months time.”</i>");
	
	processTime(60);
	time = 90 * 24 * 60;
	desc = "You have the tattoo of a Premium Breeder. This is the length of time remaining on your current contract."
	//pc shouldn't have existing status but just in case...
	if (pc.hasStatusEffect("Premium Breeder Cheek Tattoo")) pc.setStatusMinutes("Premium Breeder Cheek Tattoo", time);
	else pc.createStatusEffect("Premium Breeder Cheek Tattoo", 0, 0, 0, 0, false, "Icon_Sperm_Hearts", desc, false, time, 0xFF33AF);
	flags["BREEDWELL_PREM_QUOTA"] = 18;
	
	flags["BREEDWELL_PREM_DAY"] = 1;
	flags["BREEDWELL_PREM_BACKPAY"] = 0;
	flags["BREEDWELL_PREM_SEX_CNT"] = 0;
	flags["BREEDWELL_PREM_KID_CNT"] = 0;
	flags["BREEDWELL_PREM_SEX_CNT_CON"] = 0;
	flags["BREEDWELL_PREM_KID_CNT_CON"] = 0;
	flags["BREEDWELL_PREM_PAYPERIOD"] = 1;
	if (flags["BREEDWELL_PREM_SEX_CNT_TTL"] == undefined) flags["BREEDWELL_PREM_SEX_CNT_TTL"] = 0;
	if (flags["BREEDWELL_PREM_KID_CNT_TTL"] == undefined) flags["BREEDWELL_PREM_KID_CNT_TTL"] = 0;
	if (flags["BREEDWELL_PREM_TTL_PAY"] == undefined) flags["BREEDWELL_PREM_TTL_PAY"] = 0;

	clearMenu();
	addButton(0, "Next", move,"BREEDWELL_RECEPTION");
}
public function breedwellPremiumNeedPunish():Boolean
{
	if (flags["BREEDWELL_PREM_KEEP_KID"] == 1) return true;
	if (flags["BREEDWELL_PREM_MISS_QUOTA"] >= 1) return true;

	//retroactive check for keeping kids before this xpac
	//will need to be changed or removed if other genric rahn births are added
	if (flags["BREEDWELL_PREM_PUN_WARN"] != 1)
	{
		if (StatTracking.getStat("pregnancy/rahn eggs/birthed") > StatTracking.getStat("pregnancy/rahn eggs/tamani"))
		{
			flags["BREEDWELL_PREM_KEEP_KID"] = 1;
			return true;
		}
	}
	
	return false;
}
public function breedwellPremiumPunishScene():Boolean
{
	clearOutput();
	
	var dohrahn:Boolean = quaelleReplacedWithDohrahn();
	var justWarn:Boolean = true;
	if (flags["BREEDWELL_PREM_PUN_WARN"] == 1) justWarn = false;
	var keepKids:Boolean = false;
	if (flags["BREEDWELL_PREM_KEEP_KID"] == 1) keepKids = true;
	
	if (dohrahn) quaelleShowDohrahn();
	else showQuaelle();
	author("Nonesuch");
	
	processTime(10);
	clearMenu();
	if (keepKids && (flags["BREEDWELL_PREM_MISS_QUOTA"] == undefined || flags["BREEDWELL_PREM_MISS_QUOTA"] < 1))
	{
		if (justWarn)
		{
			flags["BREEDWELL_PREM_PUN_WARN"] = 1;
			flags["BREEDWELL_PREM_KEEP_KID"] = undefined;
			if (dohrahn)
			{
				output("<i>“[pc.name] Steele? A moment, please.”</i>");
				output("\n\nThe do’rahn reception head continues to tap away at her keyboard as she talks to you.");
				output("\n\n<i>“You took rahn kids, instead of giving them to the drone,”</i> she says bluntly. <i>“Don’t do that. This isn’t an art insem clinic. Next time you do, we’re gonna be obliged to do something about it. Either tearing up your contract, or a sanction.”</i>");	
				output("\n\nShe looks up at you knowingly.");	
				output("\n\n<i>“You might enjoy the sanction, you incubators, I dunno. But don’t do it anymore. Save me the paperwork, k?”</i>");	
				output("\n\nShe dismisses you with a flick of her cilia hair.");	
			}
			else
			{
				output("<i>“Fluctilious Steele! Could I talk to you for a moment?”</i>");
				output("\n\nQuaelle calls over to you the moment you step into the humid hush of Breedwell’s reception. She has that expression of patient, professional concern native to HR managers about to administer the Quiet Word, and it cannot fail to seed dread in your heart. You follow the roehm into the leafy sitting area.");
				output("\n\n<i>“The incubator drone we sent you told us that you have an, emmmmm, alternative arrangement set up,”</i> she says, knitting her fingers beneath her bosom and gazing at you placidly. <i>“That’s nice! And I understand, pulsiment Steele, I genuinely do.”</i> She pats you on the hand. <i>“If I were the one bearing cute little baby rahn, I do not think I could bear to let them go either. I would keep them all for myself too!”</i>");	
				output("\n\n<i>“Buuut. You can’t do that. You must let us have the babies. You know we look after them well, right? I can show you around the living complexes here, if you like.”</i> Quaelle smiles at you patiently. <i>“If you do it again, then... the matter will be out of my hands. We will either have to void your incubator rights, or sanction you. Sanctioning... well, Breedwell will make sure you produce the babies you agreed you would, put it that way.”</i>");	
				output("\n\nShe pats you on the hand again.");	
				output("\n\n<i>“But it won’t come to that, will it? Because you’re a numiliant [pc.boy]. Emmmm, unless you want it to, I suppose. Hmm, hmm, hmm. No more stealing rahn, ok?”</i>");	
			}
			addButton(0, "Next", mainGameMenu);
		}
		else
		{
			if (dohrahn)
			{			
				output("<i>“Steele.”</i>");
				output("\n\nThe do’rahn receptionist calls you over the moment you enter the room.");
				output("\n\n<i>“You did it again, didn’t you?”</i> she chides. <i>“Those babies weren’t yours to take. So now you have to choose. Either we tear up your contract, or you get the sanction.”</i>");
				output("\n\nSanction?");
				output("\n\n<i>“12 hours of breeding.”</i> She smiles at you coolly. <i>“Staff, guests, visitors, they can all get a piece, however they like it. There’ll also be some training involved. Not sure what that’ll be.”</i>");
				output("\n\nThe purple rahn gazes at you over her screen.");
				output("\n\n<i>“So which is it going to be?”</i>");
			}
			else
			{
				output("<i>“Lambinious Steele!”</i>");
				output("\n\nQuaelle calls to you the moment you enter reception.");
				output("\n\n<i>“You took babies again!”</i> she exclaims. <i>“After I told you not to! Oh dear, oh jidderation. I wish you hadn’t made me do this.”</i>");
				output("\n\nThe colorful gastropod sighs, fiddling with her charm bracelets fretfully.");
				output("\n\n<i>“You have two choices,”</i> she says at last. <i>“You can forego being an incubator. That means");
				if (breedwellPremiumUnderContract()) output(" your Premium Breeder contract will be cancelled, and");
				output(" you won’t be able to use the breeding pods again. Oorrrr... you can accept the sanction.”</i>");
				
				output("\n\nSanction?");
				output("\n\n<i>“12 hours of breeding,”</i> sighs Quaelle. <i>“Staff, guests, visitors will have free use of you in that time. There will be some, emmmm, training involved as well. To try and avoid a repeat.”</i> ");
				output("\n\nShe pauses, still shifting her baubles around uncomfortably.");
				output("\n\n<i>“Which will it be?”</i>");			
			}
			
			if (!pc.hasVagina())
			{
				addButton(0, "Void", breedwellPremiumVoidContract, true,"Void","You removed your female sex, making this Breedwell’s only recourse.");
				addDisabledButton(1, "Sanction", "Sanction", "You removed your female sex!");
			}
			else
			{
				addButton(0, "Void", breedwellPremiumVoidContract, true,"Void","Stop being an incubator for Breedwell.");
				addButton(1, "Sanction", breedwellPremiumSanction, false);
			}
		}
	}
	else
	{

		if (dohrahn)
		{				
			output("<i>“Steele.”</i>");
			output("\n\nThe do’rahn receptionist calls you over the moment you enter the room.");
			output("\n\n<i>“You didn’t meet your premium breeder quota last month, says here,”</i> she chides. <i>“So now you’ve got to choose. Either take the sanction and get paid - or cancel your contract and don’t.”</i>");
			output("\n\nSanction?");
			output("\n\n<i>“12 hours of breeding.”</i> She smiles at you coolly. <i>“Staff, guests, visitors, they can all get a piece, however they like it. There’ll also be some training involved. Not sure what that’ll be.”</i>");
			output("\n\nThe purple rahn gazes at you over her screen.");
			output("\n\n<i>“So which is it going to be?”</i>");
		}
		else
		{				
			output("<i>“Lambinious Steele! I need to talk to you for a moment.”</i>");
			output("\n\nQuaelle is wearing her serious-PR-manager expression as she motions you into the sitting alcove. She fiddles with her charm bracelets as she speaks.");
			output("\n\n<i>“You didn’t meet your premium breeder quota last month,”</i> she says. <i>“That means I have to give you two choices. You can forego the pay, and we’ll cancel the contract. Or, emmm, you can take the sanction, and then get paid.”</i>");
			output("\n\nSanction?");
			output("\n\n<i>“12 hours of breeding,”</i> sighs Quaelle. <i>“Staff, guests, visitors will have free use of you in that time. There will be some, emmmm, training involved as well. To try and avoid a repeat.”</i>");
			output("\n\nShe pauses, still shifting her baubles around uncomfortably.");
			output("\n\n<i>“Which will it be?”</i>");
		}
		if (!pc.hasVagina())
		{
			addButton(0, "Void", breedwellPremiumVoidContract, false,"Void","You removed your female sex, making this Breedwell’s only recourse.");
			addDisabledButton(1, "Sanction", "Sanction", "You removed your female sex!");
		}
		else
		{
			addButton(0, "Void", breedwellPremiumVoidContract, false,"Void","Stop being a premium breeder. You’ll still get to use the pods.");
			addButton(1, "Sanction", breedwellPremiumSanction, true);
		}
	}
	return true;
}
public function breedwellPremiumVoidContract(closePods:Boolean=false):void
{
	clearOutput();
	
	var dohrahn:Boolean = quaelleReplacedWithDohrahn();
	var justWarn:Boolean = true;
	if (flags["BREEDWELL_PREM_PUN_WARN"] == 1) justWarn = false;
	var keepKids:Boolean = false;
	if (flags["BREEDWELL_PREM_KEEP_KID"] == 1) keepKids = true;
	var desc:String = "";
		
	if (dohrahn) quaelleShowDohrahn();
	else showQuaelle();
	author("Nonesuch");
		
	if (dohrahn)
	{
		if (closePods)
		{
			output("Breedwell and Tamani can fuck off, you didn’t do anything wrong by choosing to raise the jelly babies you bore yourself. You sign the annulment the do’rahn hands you.");
			output("\n\n<i>“No more going to the pods, then.”</i> The do’rahn looks at you with a quirk of the lip. <i>“Hope those kids make you happy, for what it’s worth.”</i>");
		}
		else
		{
			output("Breedwell and Tamani can fuck off, you never signed up for this. You sign the annulment the do’rahn hands you. There’s a tickling sensation on your cheek; you fetch a mirror in time to see the last of the pink tattoo fade away.");
			output("\n\n<i>“You can still use the pods, if you like.”</i> The do’rahn looks at you with a quirk of the lip. <i>“So long as you don’t steal any");
			if (flags["BREEDWELL_PREM_PUN_WARN"] == 1) output(" more");
			output(" kids.”</i>");
		}
	}
	else
	{
		if (closePods)
		{
			output("Breedwell and Tamani can fuck off, you didn’t do anything wrong by choosing to raise the jelly babies you bore yourself. You sign the annulment Quaelle hands you.");
			output("\n\n<i>“Well, emmm, that’s that.”</i> The roehm looks at you with a reluctant admiration.");
			if (flags["QUAELLE_LOVER"] == 1) output(" <i>“I suppose I get you all to myself now, right? Hmm. Hmm. Hmm.”</i>");
			else output(" <i>“You are naughty, Steele, don’t think you aren’t, buuuuut... as I said before. I do understand.”</i>");
		}
		else
		{
			output("Breedwell and Tamani can fuck off, you never signed up for this. You sign the annulment Quaelle hands you. There’s a tickling sensation on your cheek; you fetch a mirror in time to see the last of the pink tattoo fade away.");
			output("\n\n<i>“Well, emmm, that’s that.”</i> The roehm looks at you with a reluctant admiration.");
			if (flags["QUAELLE_LOVER"] == 1) output(" <i>“I suppose I get you all to myself now, right? Hmm. Hmm. Hmm.”</i>");
			else output(" <i>“You are naughty, Steele, don’t think you aren’t, buuuuut... I admire your, emm, steeliness. Hmm.”</i>");
		}
	}
	
	if (pc.hasStatusEffect("Premium Breeder Cheek Tattoo"))
	{
		pc.removeStatusEffect("Premium Breeder Cheek Tattoo");
		desc = "You feel a faint prickling sensation on your face, as if someone were flicking at your cheek with a brush. A quick check with your mirror app reveals that your Premium Breeder tattoo is fading away, the pink sperm losing their luminescence and disappearing into your [pc.skin].";
		desc += " You feel despondent, knowing you’ll no longer be an agent of sexual pleasure and bearer of new life. An urge to go back to Breedwell pulls at you, to get a new contract sorted out. Maybe they’ll offer you something even better...";
		AddLogEvent(desc);
	}
	if (pc.hasStatusEffect("Premium Breeder Crotch Tattoo"))
	{
		pc.removeStatusEffect("Premium Breeder Crotch Tattoo");
		desc = "There’s a funny tickling sensation on the sensitive spot just above your crotch. It’s your Premium Breeder tattoo fading away, commensurate with the end of your half-year-long contract with Breedwell.";
		desc += " You feel despondent, knowing you’ll no longer be an agent of sexual pleasure and bearer of new life. An urge to go back to Breedwell pulls at you, to get a new contract sorted out. Maybe they’ll offer you something even better...";
		AddLogEvent(desc);	
	}
	
	flags["BREEDWELL_PREM_KEEP_KID"] = 0;
	flags["BREEDWELL_PREM_MISS_QUOTA"] = 0;	
	flags["BREEDWELL_PREM_CON_BAN"] = 1;
	if (closePods) flags["BREEDWELL_PREM_POD_BAN"] = 1;
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}
public function breedwellPremiumSanction(quotaPun:Boolean=false):void
{
	clearOutput();
	
	var dohrahn:Boolean = quaelleReplacedWithDohrahn();
	var punHours:int = 12;
	
	if (quotaPun)
	{
		//punHours *= flags["BREEDWELL_PREM_MISS_QUOTA"];
		flags["BREEDWELL_PREM_MISS_QUOTA"] = undefined;	
		IncrementFlag("BREEDWELL_PREM_PUNQ_CNT");
	}
	else
	{
		flags["BREEDWELL_PREM_KEEP_KID"] = undefined;
		IncrementFlag("BREEDWELL_PREM_PUNK_CNT");
	}
		
	if (dohrahn) quaelleShowDohrahn();
	else showQuaelle();
	author("Nonesuch");
	
	if (flags["BREEDWELL_PREM_PUN_VISITORS"] != undefined) flags["BREEDWELL_PREM_PUN_VISITORS"] = 0;	
	if (flags["BREEDWELL_PREM_PUN_STAFF"] != undefined) flags["BREEDWELL_PREM_PUN_STAFF"] = 0;	
	if (flags["BREEDWELL_PREM_PUN_GUESTS"] != undefined) flags["BREEDWELL_PREM_PUN_GUESTS"] = 0;	
	
	output("You sigh, steel yourself, and say you’ll take the sanction.");
	if (dohrahn) output("\n\nThe do’rahn");
	else output("\n\nQuaelle");
	output(" leads you to a room off the incubator pods. It’s a changing area, sterile white like the rest of the station. Hanging from a rack is a skintight bodysuit: White, except for green and purple touches around the arms and thighs. <b>Tamani Public Service Operative</b> is written across the shoulders. Seated on the bench next to the suit is a round, bulky helmet, with a slim, purple visor across the eyes.");
	if (dohrahn) output("\n\n<i>“The helmet will explain everything,”</i> says the do’rahn. <i>“Have a nice time getting fucked.”</i> She strides out.");
	else output("\n\n<i>“The helmet will explain everything,”</i> says Quaelle, laying a soothing, slimy hand on your shoulder. <i>“Good luck, mellificent Steele. I’ll make some tea for you afterwards, if you like.”</i> She slithers out.");
	output("\n\nYou climb out of your [pc.gear], store it in a locker, and pull on the suit. It clings to your [pc.skinFurScales] tightly, but it’s very elastic: you experimentally pull the material over your [pc.belly] and find you can easily stretch it out by several feet before it snaps right back. It’s also very thin, and shifts over your flesh with each movement you make, a constant source of tactile stimulation. You’d put it down to the fine, glossy material... but it also feels like it has a mind of its own, and it’s touching your form with interest.");
	output("\n\nYou shiver slightly, then don the helmet, clicking the purple visor into place. It completely blocks your sight.");
	output("\n\n<i>“Hey there, eager breeder.”</i> ");
	output("\n\nA cartoon CEO Tamani, pink-skinned, green-haired and boisterous, appears on the visor. She pouts at you, and wags her finger.");
	output("\n\n<i>“If you’re hearing this, it’s because you’ve not met your Premium Breeder quota, or you have committed a serious contractual offense. Naughty [pc.boy]! As stipulated in your contract, this means that for the next 12 hours, your body is legally the property of Tamani Corp. And we’re gonna have <i>such</i> fun with it!”</i> She looks down and wiggles her eyebrows. <i>“Let’s have a feel, shall we?”</i>");
	output("\n\nYou gasp and start as your suit vibrates around your groin, the material shivering of its own volition, invisible, magic fingers working their way up your [pc.thighs] and into [pc.eachVagina]. The material planes over your labia and [pc.eachClit], only grasping closer as they moisten with [pc.femcum]. The movement works over");
	if (pc.hasCock())
	{
		if (pc.cockTotal() > 1) output(" [pc.eachCock], quickly making them tumescent, and then back over");
		else output(" [pc.eachCock], quickly making it tumescent, and then back over");
	}
	output(" the hills of your [pc.ass] and your [pc.anus].");
	if (pc.hasCock())
	{
		if (pc.biggestCockLength() >= 6) output("\n\nOoh, a lovely big fuck stick!");
		else output("\n\nAw, a chubby little cum pump!");
		output(" Cartoon Tamani bites her lips, seemingly looking down at");
		if (pc.cockTotal() > 1) output(" them");
		else output(" it");
		output(". <i>“Such a shame we won’t be using");
		if (pc.cockTotal() > 1) output(" them");
		else output(" it");
		output(" today - or at least, not mainly.”</i> You huff as the vibrations run up and down [pc.eachCock], making");
		if (pc.cockTotal() > 1) output(" them");
		else output(" it");
		output(" thicken and throb, and she giggles. <i>“But you make sure to bounce along to the extraction pods afterwards and gimme all that nice, rich cum in there, ok? My swimming pool always needs refills.”</i>");
	}
	if (pc.vaginaTotal() > 1)
	{
		output("\n\n<i>“Mmm,”</i> Toon Tamani purrs, and you grit your teeth as the vibrations move back to your pusses - all of them at once, devilish pleasure wiggling its way inside, setting your tunnels aquiver. <i>“I love a");
		if (pc.isCuntboy()) output(" cuntboy");
		else if (pc.hasCock()) output(" herm");
		else output(" girl");			
		output(" who makes the effort to grow out more than one dripping, fertile pussy. Perfect for milking thick cock and swelling your body out with lots of cute babies.");
		if (pc.hipRating() > 10) output(" And you’ve got the hips to bear them, too!”</i> The material grabs hold of your [pc.hips], tightening to give them a squeeze.");
		output(" You’ve got all the tools to be an A class breeder. So why aren’t you?”</i>");
		
	}
	else
	{		
		output("\n\n<i>“Only one?”</i> Toon Tamani laughs, head puffing up, hand waving contemptuously.");
		if (quotaPun) output(" <i>“No wonder you aren’t meeting your quota!");
		else output(" <i>“Very vanilla. Very boring, too.");
		output(" Don’t you want to be able to ride two or three thick, juicy cocks at once? Get multiple wombs stuffed full of eggs, swelling you out like a lovely big mom-balloon? Yeah, you do.”</i> Her head deflates, the air seeming to transfer to her gut, swelling her out until her little legs collapse under the weight. She groans happily, running her hands over her tautened stomach and smirks at you. <i>“By the end of today you will, anyway.”</i>");
	}
	output("\n\nThe pink-and-green gremlin sticks a hard hat on and pulls a giant wrench out from behind her back. A head appears next to her with the scalp off, revealing clockwork turning away inside.");
	output("\n\n<i>“We’re gonna be doing a bit of tinkering in here today, make a couple of improvements. Nothing too serious... <i>“ She climbs up to her butt inside the head, tightening a bolt vigorously. A giant, red balloon labeled BREED steadily inflates from inside, until it dominates the entire contraption. Tamani clamps the scalp back on with difficulty, patting her hands with satisfaction. <i>“...but I’m sure you’ll be pleased with the results. Now!”</i>");
	output("\n\nA cut-out of a space station appears. It fills with lines of stick figures of three different colors: red, blue and yellow.");
	output("\n\n<i>“Both visitors and privileged guests are welcome at Tamani Corp, and we employ many hardworking staff as well. It’s quite the bustle around here, as I’m sure you’ve noticed! Because of the nature of the work we do - and the experimental things we put in the atmosphere - they can all get... a little frustrated.”</i>");
	output("\n\nThe image on the visor zooms in on a single blue figure, who swells out into the hourglass outline of a rahn. She puts her figurine hands between her thighs, blush lines appear on her face, and little sweat drops pop out of her head.");
	output("\n\n<i>“We’d hate any one of them to feel like they were underappreciated. Or to lose their precious sexual fluids. That’s where you come in!”</i>");
	output("\n\nA figure in white with purple-and-green touches on their hips and arms moves in from the right. The blue rahn raises her arms in delight, then bends the public service operative over, and energetically bumps her groin against their butt. A few sweat-drops later, the operative’s belly takes on a bit of a swell, and the rahn outline happily slides off the screen. They are replaced by a yellow human, and then by a red rahn, each repeating the same action, as if on a treadmill. The operatives winds up sat down, clutching a very heavily swollen gut. The suit gently nibbles the folds of [pc.eachVagina] as you watch.");
	output("\n\n<i>“Get the picture?”</i> Tamani appears again, gesturing at a blue, red and yellow orb above her. <i>“Over the next " + num2Text(punHours) + " hours, you’ll be assigned as a service operative to two of these groups, whilst receiving vital breeder training AND a thorough impregnating to make up for");
	if (quotaPun) output(" your shortfall");
	else output(" the babes you took");
	output(". Three balls, one hole!”</i>");
	output("\n\nThe orbs swoop down and disappear behind the toon’s round, perky ass. She jumps, and her eyes cross.");
	output("\n\n<i>“Oop! But I’m a big softie really. So I’m gonna let you choose which groups you’ll be assigned to. Which first, eager breeder?”</i>");
	output("\n\nWhen you direct the visor downwards, you see three virtually generated box options near your fingertips.");

	pc.lust(60);
	//double libido here	
	clearMenu();
	addButton(0, "Visitors", breedwellPremiumSanctionVisitors,undefined);
	addButton(1, "Staff", breedwellPremiumSanctionStaff,undefined);
	addButton(2, "Guests", breedwellPremiumSanctionGuests,undefined);
}

public function breedwellPremiumSanctionVisitors():void
{
	clearOutput();
	showName("FEATURELESS\nCUBICLE");
	showBust("");
	author("Nonesuch");
	
	var ppRandom:PregnancyPlaceholder = breedwellPremiumGetRandomCock(1);
	var firstTime:Boolean = true;
	if (flags["BREEDWELL_PREM_PUN_VISITORS"] != undefined) firstTime = false;
	flags["BREEDWELL_PREM_PUN_VISITORS"] = 0;
	
	output("<i>“Ooh, the complementary alleviation orifice,”</i> Tamani croons. <i>“You lucky [pc.boy]!”</i> A virtual yellow line appears on the floor in front of you. A sharp buzz on your [pc.ass] makes you jump. Quickly, you get up and follow the line, through employee-only corridors towards the loading bay where your own ship is docked. The rahn employees you pass smirk at your uniform, but none stop you. ");
	output("\n\nThe yellow line leads into an unmarked door: It hisses open as you approach, revealing a featureless cubicle. The door clicks shut behind you, and a sultry, purple light bathes your body.");
	output("\n\nThe room isn’t quite featureless, it turns out. There’s a hole on the opposite wall about 3 feet up, surrounded by glossy padding. Similarly glossy padding cushions the floor directly beneath.");
	output("\n\n<i>“It’s important that our breeders know how to orally satisfy our sperm donors,”</i> Tamani’s bubbly voice sounds in your ear, <i>“not just because it will encourage them to return - but so you can get all the nutrition a heavily pregnant mother needs. And there’s no better nutrition than cum!”</i>");
	if (firstTime)
	{
		output("\n\nSomething is nagging you, a kind of fretful headache. You should sit down on the cushion and push your lips through the hole. You turn and look at the door you came in through; there’s no handle or button. A digital readout above it reading 06:00. You really should sit down on the cushion, get your mouth into position. The clock changes to 05:59. You <b>must</b> sit down on the cushion and present your mouth to the hole. It’s <b>really</b> important that y-");
	}
	output("\n\nYou put your [pc.knees] on the padded floor and push your [pc.lips] through the plush, supple hole. The relief is instant and overwhelming, like a warm cloth spreading over your body.");
	output("\n\nA panorama view of a room appears on the visor: It’s that of a large, unisex public bathroom, utilitarian and clean. On the wall opposite the exit is a round hole about three feet off the ground, in the centre of which are a pair of lips. Instinctively you wet your [pc.lips], and a funny, vicarious thrill runs down your spine as you watch the mouth mimic the action. It looks... inviting. ");
	output("\n\nThere’s a hand-wipe dispenser beside it and a brass plaque above. COMPLEMENTARY ALLEVIATION ORIFICE, you read. GIVE GENEROUSLY.");
	output("\n\nYou jump slightly as a gryvain spacer strides in. You should really lick your lips again. Present yourself. You blink and shake your head, muddled. The gryvain quickly uses a urinal and leaves. You feel that aching, fretful feeling again as she does. You <i>really</i> need to do better, make sure the public knows that sweet relief is on hand. You <i>thirst</i> to do better. ");
	output("\n\nThe entrance bumps open again, and this time you lick your [pc.lips] and extend your [pc.tongue], glossy and inviting. The burly saurmorian who’s just walked in pauses, green reptilian eyes on the hole. He slowly slopes off to the stalls... but when he comes back, and you repeat the action, he grunts with lusty amusement and approaches, unzipping his trousers and allowing his sturdy, ridged member to flop outwards.");
	output("\n\nThat soothing balm you felt earlier enfolds you, only this time it’s even stronger, happy warmth running slowly down your body, concentrating itself finally over [pc.eachVagina]; you sigh with bliss, puffing over the big reptile’s dick as he hefts it and bumps its blunt, musky head against your [pc.lips].");
	output("\n\nYou make its passage inside the alleviation orifice smooth and pliant, easily allowing him to bump his ridges over your bottom lip and fill your mouth with his texture and filthy taste. He grunts with approval as he pulls slowly backwards and fills you pull wetly at him, begging him to fill your mouth with it again. ");
	output("\n\nYou should really use your tongue, lick along his underside when he feeds it into you. The saurmorian is starting to get into a rhythm now, sighing with pleasure as he screws his powerful hips into the wall, tail twitching. You <i>really</i> sh- you rub your [pc.tongue] along his shaft, and practically whimper with delight when you’re rewarded with sumptuous vibrations and fondlings inside [pc.eachVagina] and up your [pc.chest], making you drip. Already you’re learning to instinctively follow the directions you’re being fed, eager for the rewards they give and keen to avoid the punishment for not.");
	output("\n\n<i>“Oh!”</i> says someone new a few moment later. <i>“I’m sorry, I thought this was -”</i>");
	output("\n\n<i>“Nah man, it’s cool, it’s cool,”</i> groans the saurmorian. He’s thrusting his cock into your mouth now with rough urgency, and you’re doing your best to keep your [pc.lips] a nice, tight, wet o-shape for him. <i>“It’s an, uh... allevy hole thing. You have a slash or whatever, don’t mind... uh. Uhh!”</i> ");
	output("\n\nA gout of hot cum floods into your mouth, and you are seized by a intense desire to seize it, drink it down, don’t let a single drop of it go to waste. You hollow your cheeks powerfully around his jolting dick, obscene slurps and slaps echoing in your head as your throat works around his heavy load. Fingers massage your scalp and [pc.belly], and it’s as if you’ve taken a big gulp of alcohol, satisfying, refreshing, heady yet also incredibly sexual.");
	if(pc.hasCock()) output(" Your [pc.cock] is rock-hard, straining against the shifting material.");
	output(" [pc.eachVagina] floods with [pc.femcum], soaking your uniform.");
	
	pc.lust(30);
	pc.loadInMouth(ppRandom);
	if (breedwellPremiumCanOrgasmGivingBJ()) pc.orgasm();
	
	clearMenu();	
	output("\n\nHe groans his last down your throat and then withdraws his ridged member; you suck him all the way, and feel a pang of disappointment when a drool of cum escapes down the other side of the hole.");
	output("\n\n<i>“Oh man,”</i> you hear the saurmorian groan, and gratification floods you when you hear the slightly bruised pleasure in his voice. <i>“You should give this a try if you’ve got the time, buddy. It’s like a goddamn vacuum.”</i>");
	output("\n\n<i>“Um?”</i> It’s a wiry looking jumpsuited ausar, you can see on the visor. <i>“I... don’t generally take sex advice from guys I meet in public bathrooms. But, ah, what the hell.”</i>");
	
	flags["BREEDWELL_PREM_PUN_VISITORS"] += 120;
	processTime(120);
	addButton(0, "Next", breedwellPremiumSanctionVisitorsNext,firstTime);
}
public function breedwellPremiumSanctionVisitorsNext(firstTime:Boolean=false):void
{
	clearOutput();
	showName("FEATURELESS\nCUBICLE");
	showBust("");
	author("Nonesuch");
	var ppRandom:PregnancyPlaceholder = breedwellPremiumGetRandomCock(2);
	var rn:int = 10 + rand(10);
	
	output("You obediently kneel in front of the hole and suck the hot, red cock that’s shoved through it next, as you do the next, and the next, and the next. Breedwell’s main loading bay is well-frequented, and there’s a constant stream of over-sexed males and hermaphrodites coming in here.");
	output("\n\nYou had a worry that this would get boring. It doesn’t. Hard cock is wonderful - the shifting texture of it over your [pc.lips] and [pc.tongue], the flavor which fills your head and makes you so thirsty and needy, the inexpressible joy of thick, hot cum spurting out over your face and filling your throat. You only want more of it even as your tummy presses against the tight material of your costume, swelling out with sloshing, goopy semen.");
	output("\n\nAnd they have so many different kinds, how could you possibly get tired of them? Smooth blue ones, rough, red ones, studded ones, ones with bloated balls and ones that sprout out of vaginas, ones that cum honey and others that cum rich purple. Ones that belong to cute twinks that cum with a girly moan the moment you start sucking on them, ones that belong to seasoned breeders that require long, long minutes of blowing and throating in order for them to bloat your cheeks with what you need.");
	output("\n\nAnd they all belong to studs - studs with prize sperm who deserve to use your mouth, to groan with gratification at the things you can do with it. You deserve to be on your knees, making them feel so good, and the more you think that the better you feel, vibrations reaching deep, deep into [pc.eachVagina], endorphins flooding your bloodstream. As you allow your mind to dissolve and sink deep into a submissive state, you orgasm repeatedly to the sensation of dick pushing into your face, your");
	if (pc.vaginaTotal() > 1) output(" pussies");
	else output(" pussy");
	output(" shivering and guttering [pc.femcum] as the suit fingers you sumptuously.");
	pc.lust(30);
	pc.loadInMouth(ppRandom);
	if (breedwellPremiumCanOrgasmGivingBJ()) pc.orgasm();
	for(var y:int = 0; y < rn; y++)
	{
		ppRandom = breedwellPremiumGetRandomCock(-1);
		pc.lust(30);
		pc.loadInMouth(ppRandom);
		if (breedwellPremiumCanOrgasmGivingBJ()) pc.orgasm();
	}
	output("\n\nYou find you can turn the view of the bathroom on and off with a shift of your head. After a while, you turn it off. The anonymity makes it more fun, and in a weird way you feel like you don’t deserve to see who’s using your mouth. You are being punished, after all, and you are just an anonymous, juicy mouth for the studs to empty their balls into. You shiver at the thought.");
	output("\n\nYou’re shaken out of your bliss-like trance many hours later by a long finger tracing your [pc.lips].");
	output("\n\n<i>“Oh my,”</i> says a deep, calm, feminine voice.");
	if (flags["LANDED_ON_TEXAS"] == 1) output(" You recognise the drawl of a New Texan Cowmazon.");
	else output(" It’s the drawl of a working country lady.");
	output(" <i>“A complementary gloryhole. And here’s me that’s just spent the last few hours lookin’ at rahn fillin’ out their clothes in that mighty fine way of theirs.”</i>");
	output("\n\nThere’s a rustle and unbuttoning, and you can’t help but gulp as you feel a flat, oozing tip a good three inches wide butt against your opened, waiting lips.");
	output("\n\n<i>“Hope you’re ready for this, whoever you may be,”</i> she rumbles. <i>“I ain’t gonna be gentle, and I ain’t gonna be quick.”</i>");
	output("\n\nSoothing calmness brushes its way down you as the massive, light pink horse shaft is fed into your face, your jaw cracking, holding your [pc.lips] open as far as they will go. She grunts as she bumps against your tonsils. Void, it’s so big... and the swarming, bestial <i>smell</i>... and the sinful taste, dripping down your throat... you orgasm with a muffled moan, a wet explosion in [pc.eachVagina], and you shudder mightily around the massive, unyielding beast-cock packing out your maw.");
	output("\n\n<i>“Ooh, I felt that,”</i> your partner laughs. She draws back, and you can’t do anything but give her the tightest squeeze, because it <i>is</i> the tightest squeeze. Once that flat tip is pulling at your lips, she shoves her way back in firmly, pure, meaty, sexual force. <i>“You like the taste of me, " + pc.mf(" boy"," girl") + "? Good. Cuz you ain’t gonna be tasting anythin’ other for the next lil while.”</i>");
	output("\n\nThe bulky cowmazon is true to her word. She takes her time building herself up, sampling your mouth, lips and tongue dragging over her smooth cock-flesh as her lust builds and she begins to push into the wall harder, claiming your throat as well with her impossibly big, pink, juicy bull dick. Again that wave of sensuous calm, artificial but undeniable: quelling your gag reflex, keeping you open and still even as she draws obscene, wet sounds out of your gullet, saliva and pre drooling down your chin and onto your [pc.chest].");
	output("\n\nOther people come in and out of the restroom - you vaguely hear a few exclamations - but the hugely endowed amazon doesn’t care; she’s locked into a single-minded tryst with your mouth, her musclebound hips and bloated balls slapping against the wall, husky groans and mild curses vibrating through the wall as she fucks your throat with pumped up abandon.");
	output("\n\nYou are transfixed on her, mouth and gullet rigid with dick, when thick warmth gouts into your gut. She keeps thrusting into your hole, apparently unconcerned that she is now cumming, spurting thick cowmazon seed into your mouth and down your throat, drooling and spewing out over your [pc.lips]. The only change is a ratcheting up of her groans and sighs, her giant balls pulsing teeming, liquid sex up her long shaft and delivering it with one firm, wall-shaking ram to the wet squeeze of your mouth pussy.");
	output("\n\n<I>Drink it down,</i> is the firm command in your melted, woozy brain. <i>It’s your reward, and stud cum belongs inside a breeder’s belly.</i> You do the best you can, though your [pc.belly] swells hugely outwards as you gulp the surges of delicious stud-seed down, and so much it winds up dripping down you, and the sensual delight that envelopes you is something else; it’s as if every nerve ending near your [pc.skinFurScalesNoun] is delicately massaged. Despite how your throat and mouth ache, you find yourself pushing back against the pistoning bull cock, eager for even more. Your spine tingles with joy.");
	output("\n\nBut, finally, amazingly, there is no more. The amazon exits your mouth with a spit-choked ‘pop’, and pumps herself twice more, grunting as she bathes your face and helmet in goopy, pearl seed. She murmurs her approval as you lick her tip and dilated cock vein clean with the tip of your [pc.tongue].");
	output("\n\n<i>“Damn,”</i> she says at last, thick pink cock flopping out of the hole, <i>“And here was me thinkin’ I was gonna have to go back to NT half done. Those canisters you got are mighty small!”</i> She booms with mellow laughter. <i>“But you’re almost as good as a Treated for lettin’ a girl work her feelins out, whoever you are.”</i>");
	
	ppRandom = breedwellPremiumGetRandomCock(3);
	pc.loadInMouth(ppRandom);
	if (breedwellPremiumCanOrgasmGivingBJ()) pc.orgasm();
	
	if (pc.isTreatedCow()) 
	{
		output("\n\n<i>“Actually, um, I am,”</i> you feel compelled to say. It’s the first thing you’ve said in many hours, and it’s responded to with more peals of laughter.");
		output("\n\n<i>“These rahn ladies know who’s good for what job, at least!”</i>");
	}
	if (!firstTime)
	{
		output("\n\nShe inserts her long finger again, stretching out towards you. You let her trace your [pc.lips] slowly and fondly.");
		output("\n\n<i>“That’s a pretty mouth,”</i> the cowmazon says at length. <i>“Doesn’t deserve to be a hole in the wall’ve a bathroom. Left my details at the front desk. You come’n find me on the frontier if you ever fancy puttin’ a bell on and bein’ my cup of sugar for keeps. You know I’m a lil rough, but still: I reckon I can treat you better’n these folks are.”</i>");
		flags["BREEDWELL_PREM_BADEND_COWMAZON"] = 1;
	}
	output("\n\nShe buttons herself up and strides away. As if on cue, the clock behind you beeps, and the door clicks open. You groan as you get to your [pc.feet], warm semen oozing down your visor, face and [pc.chest], feeling the weight of your packed [pc.belly] slosh.");
	
	flags["BREEDWELL_PREM_PUN_VISITORS"] += 240;
	processTime(240);
	pc.applyCumSoaked();
	clearMenu();
	if (flags["BREEDWELL_PREM_PUN_STAFF"] > 0 || flags["BREEDWELL_PREM_PUN_GUESTS"] > 0)
	{
		output("\n\n<i>“Time’s up!”</i> Tamani gushes in your ear. <i>“And it looks like your tour as a Tamani Corp public service operative is, too. Great job! Head back to the changing room for debriefing.”</i>");
		addButton(0, "Next", breedwellPremiumSanctionDebrief,undefined);
	}
	else
	{
		output("\n\n<i>“Time’s up!”</i> Tamani gushes in your ear. <i>“I hope you’ve learned a lot from this experience, and you’re nice and full! You’ve earned a five minute break. Then you can choose how you will spend the rest of your day as a Tamani Corp public service operative!”</i>");
		output("\n\nThere’s a shower room out here, and you spend the five minutes cleaning the copious amounts of cum off you. You hope your body will get to work metabolizing what you’ve imbibed soon - it’s like you’re");
		if (pc.isPregnant()) output(" even more pregnant than normal, your body cavity utterly stuffed with cum and growing life.");
		else output(" six months pregnant at the moment.");
		output("\n\nTwo buttons, blue and red, suddenly appear before you. A sharp zap to your [pc.ass] tells you to make your choice quickly.");
		
		pc.shower();
		addButton(0, "Staff", breedwellPremiumSanctionStaff,undefined);
		addButton(1, "Guests", breedwellPremiumSanctionGuests,undefined);
	}
}
public function breedwellPremiumSanctionGuests():void
{
	clearOutput();
	showName("VIP\nLOUNGE");
	showBust("");
	author("Nonesuch");
	var firstTime:Boolean = true;
	if (flags["BREEDWELL_PREM_PUN_GUESTS"] != undefined) firstTime = false;
	flags["BREEDWELL_PREM_PUN_GUESTS"] = 0;
	
	output("<i>“So you fancy working as a Nourishment Transferral Agent, do you?”</i> Tamani says. <i>“Classy [pc.boy]! Ok then!”</i>");
	output("\n\nA red line appears before you, painted onto the floor by the VR headset. A sharp jolt down your spine quickly gets you onto your [pc.feet] and following it, further into the station.");
	output("\n\nIt leads you into a kitchen adjoining the lounge where the rahn guests mingle before the breeding pods: chatting, drinking, examining the catalogues of breeders. Here, there are plenty of rahn too: Breedwell staff, hurrying back and forth with trays and holopads. There’s massive glass canisters along walls filled with alabaster fluid and fitted with taps, from which the waiting staff are constantly decanting glasses. There’s labels: Human, Kui-Tan, Lucky Dip...");
	output("\n\n<i>“On your sanction?”</i> says a zel’rahn. She hands you a tray laden with flute glasses, some wine, some cum. <i>“Great, we need more of you. Go out from here onto the gallery. You’re serving the VIPs - the ones who’ve paid for intimate service. Laugh at their jokes, do what they want with a smile, you’ll be fine.”</i>");

	clearMenu();	
	addButton(0, "Next", breedwellPremiumSanctionGuestsNext,firstTime);
}
public function breedwellPremiumSanctionGuestsNext(firstTime:Boolean=false):void
{
	clearOutput();
	showName("VIP\nLOUNGE");
	showBust("");
	author("Nonesuch");
	
	var hole:int = pc.findEmptyPregnancySlot(1);
	if (hole < 0) hole = rand(pc.vaginaTotal());
	var ppRahn:PregnancyPlaceholder = getBreedwellRahnPregContainer(1);
	
	output("You do as you’re told, walking out into the lounge filled with the slightly moist tinkling of rahn laughter and chatter with the tray. You feel very exposed in your skin-tight suit with the words PUBLIC SERVICE OPERATIVE boldly displayed on your shoulders, and you feel many eyes crawling over your back and [pc.ass] as you climb up the stairs to the gallery.");
	output("\n\nThere are some sleek, very well-dressed rahn up here, in widely spaced and plush seating areas before a screen displaying the spectacular sight of Wistral and Planet 4. They are talking and drinking with leisured urbanity, some of them even lying on couches, being attended to by rahn staff and other helmeted, body-suited PSOs like you. Pleasant electronica gusts over proceedings.");
	output("\n\n<i>You should walk so you are displaying your hips and");
	if (pc.hasTits()) output(" breasts");
	else output(" butt");
	output(".</i> You blink. Where did that come from? You place the drinks down and depart, and as you do you feel a nagging, headache-y feel, something prickling tetchily at your neck.");
	output("\n\nYou ascend up the stairs with another tray of drinks. <i>This time, you must do your best to display your assets to their best advantage. It is <b>imperative</b> you do this.</i> Without thinking, you flare your [pc.hips] and walk with an exaggerated sway, letting your curves do plenty of talking. A svelte zel’rahn in a ludicrously intricate medici-like outfit grins as she watches you approach, nakedly appreciating your body. The headache-y feeling immediately dissipates and a wave of sensuous relaxation flows down your body, so powerful you sigh.");
	if (pc.isPregnant()) output("\n\n<i>“You already look like you’ve seen plenty of action, [pc.boy],”</i> she titters as you hand her a fresh glass of semen. She lays her soft hand on your [pc.belly], rubbing forwards and backwards. <i>“How many of those downstairs have you lain to get that? Two? Three? Ten?”</i>");
	else output("\n\n<i>“You don’t look like you’re carrying any eggs, [pc.boy],”</i> she titters as you hand her a fresh glass of semen, eyes on your [pc.belly]. They narrow. <i>“I guess I’ll have to put some in there. For the Great Effort, and all.”</i>");
	output("\n\nShe raises the glass to her lips, pauses, and then tips it to you.");
	output("\n\n<i>“Here. Don’t swallow.”</i>");
	output("\n\nThe red, costumed rahn watches, enjoying every moment, as she tips the glass over your [pc.lips] and slips the warm, musky goop into your mouth. She keeps going until your cheeks bulge with it.");
	output("\n\n<i>“Now kiss me,”</i> she breathes. Her slim arms encircle you as you dip forward and press your lips to hers, releasing the payload into her mouth, [pc.tongue] gently playing with yours. Little pulses of motion go off in [pc.eachVagina], your suit playing with you, making you wet as you perform this strange, decadent act.");
	output("\n\n<i>“Mmm,”</i> she breathes when you break, a little pearl drop escaping down her chin. <i>“Imagine doing something as vulgar as sucking a dick, when you can take it like that.”</i>");
	output("\n\nShe sinks down on her back on her couch, parting her multi-tiered dress, her long, blunt-barbed ovipositor sliding outwards like a conductor out of the curtains.");
	output("\n\n<i>“Now ride me,”</i> she orders. <i>“Work it hard. Show me how much you want my eggs.”</i>");
	output("\n\nYou do so, clambering onto her lap and kneeling over her ruby red erection, and your suit peels away around [pc.eachVagina], parting of its own volition so that you can spread yourself around her, gasping slightly as her blunt spines bump over your [pc.clit " + hole + "] and then over your walls as you sink down the warm, gooey shaft.");
	
	pc.cuntChange(hole, ppRahn.cockVolume(0));
	
	output("\n\nShe watches with silent approval, murmuring with approval as you begin to jerk your [pc.hips], obeying the subliminal instruction and receiving a superb shiver all over your form as you do so, your [pc.nipples]");
	if (pc.isLactating()) output(" moistening");
	else output(" hardening");
	output(" with delight.");
	output("\n\n<i>“Are you really going to let that one have your eggs, Moa-zalla?”</i> yawns a large, plump do’rahn, laid on a sedan whilst a boyish PSO feeds her fruit. <i>“I thought you might wait until second dessert at least.”</i>");
	output("\n\n<i>“Don’t you ever open the society tabs?”</i> One hand clutching your [pc.thigh], she chucks a holopad catalogue with your face on it at the do’rahn. <i>“That’s [pc.name] Steele. Heir to the Steele fortune! Riding my poz for credits like a little whore.”</i>");
	output("\n\n<i>“Oooh...”</i> The do’rahn eyes light up, fixed on you riding her friend with one juicy thrust of your [pc.hips] after another.");
	output("\n\n<i>“How’d it happen, [pc.name]?”</i> Moa-zalla coos, wicked eyes on your face, hands plastered around your [pc.ass]. <i>“Few bad decisions on the market, and now you’re having to work it to get the cruiser out of repo? Or is this tourism? Finding out what being a corpo-whore is like before you go back to the swimming pool? No...”</i> she reaches out and places a finger on your [pc.lips]. <i>“...I don’t want to know. It’s much better that way.”</i>");
	output("\n\nYou couldn’t answer her even if you wanted to; those barbs of hers running up and down the insides of your pussy are so delicious, the only thing coming out of your mouth is gasps of delight. The helmet is making you clamp down on them, ride her harder and harder, milking her relentlessly for her eggs. Waves of motion travel up the zel’rahn’s jelly body, her eyes rolling backwards and her mouth opens with delight, and you feel a surge of ecstasy, a lightning bolt up your spine, as her ovipositor bulges up and releases a fat surge of goopy, egg-ridden love into your [pc.vagina " + hole + "].");
	output("\n\n<i>“Mmm...”</i>“ she sighs, hand drifting towards another glass of cum. <i>“And anyway, I can always make a few more.”</i>");
	
	breedwellPremiumCreampie(hole);
	pc.loadInCunt(ppRahn, hole);
	pc.orgasm();
	
	flags["BREEDWELL_PREM_PUN_GUESTS"] += 120;
	processTime(120);
	clearMenu();	
	addButton(0, "Next", breedwellPremiumSanctionGuestsNext2,firstTime);
}
public function breedwellPremiumSanctionGuestsNext2(firstTime:Boolean=false):void
{
	clearOutput();
	showName("VIP\nLOUNGE");
	showBust("");
	author("Nonesuch");
	
	var hole:int = pc.findEmptyPregnancySlot(1);
	if (hole < 0) hole = rand(pc.vaginaTotal());
	var ppRahn:PregnancyPlaceholder = getBreedwellRahnPregContainer(1);
	var rn:int = 10 + rand(10);
	
	output("The next few hours are exhausting. You alternate between running up and down the stairs fetching this high crust of rahn society their drinks, food and entertainment, and being the entertainment yourself. The generously sized go’rahn makes use of you next, holding her pale drumstick up so that you can lick the plump, loose folds of her pussy whilst folding bowlfuls of fruit into her mouth with her long tongue, oozing sweet lube like a broken ice-cream machine.");
	if (pc.hasCock())
	{
		output("\n\nShe then has you clamber up and rail her with your [pc.cockNoun]");
		if (pc.biggestCockLength() >= 8) output(", your big cock perfect for spreading her pudgy pussy and filling her up, her eyes rolling upwards in decadent delight as you palpitate her soft body with one urgent thrust after another.");
		else
		{
			output(". She leers at you patronizingly as you lose yourself entirely in her pudgy, spacious pussy, barely able to touch her sides.");
			output("\n\n<i>“Yes,”</i> she sighs, plucking at some grapes in boredom as you cum with a moan, squirting [pc.cum] into her sticky morass. <i>“I can see why you stick to getting your ass bent over, Steele.”</i>");
		}
		pc.orgasm();
	}

	output("\n\nAlcohol and barely legal stimulants flow liberally, and the party atmosphere gets giddier; you find yourself sucking and fucking with increasing frequency. The suit and helmet soothes you through-out, calming you with coolness and hushed sound when you are on your [pc.knees] wiping spilled drink, semen and rahn fluids up, and spurring you on with devilish vibrations, fondles and endorphin rushes when a thick, oozing ovipositor is being thrust between your [pc.thighs] or [pc.lips]. ");
	output("\n\nThe more you zone out and let the impulses that the suit is training into you, the easier it becomes. You coo and orgasm when another rich load of rahn eggs is shoved into your [pc.vagina " + hole + "], swelling out your [pc.belly] even more, and when you turn and pout your [pc.lips] at the gel lady who delivered them, silently asking if there’s any other way you can be of service to them, your suit shudders all across your [pc.skinFurScales].");
	for(var y:int = 0; y < rn; y++)
	{
		ppRahn = getBreedwellRahnPregContainer(rand(8));
		if (rand(3) == 0)
		{
			pc.lust(30);
			pc.loadInMouth(ppRahn);
			if (breedwellPremiumCanOrgasmGivingBJ()) pc.orgasm();
		}
		else
		{
			hole = pc.findEmptyPregnancySlot(1);
			if (hole < 0) hole = rand(pc.vaginaTotal());
			pc.cuntChange(hole, ppRahn.cockVolume(0));
			breedwellPremiumCreampie(hole);
			pc.loadInCunt(ppRahn, hole);
			pc.orgasm();
		}
	}
	ppRahn = getBreedwellRahnPregContainer(1);
	hole = pc.findEmptyPregnancySlot(1);
	if (hole < 0) hole = rand(pc.vaginaTotal());
	pc.cuntChange(hole, ppRahn.cockVolume(0));
	breedwellPremiumCreampie(hole);
	pc.loadInCunt(ppRahn, hole);
	pc.orgasm();
	flags["BREEDWELL_PREM_PUN_GUESTS"] += 240;
	processTime(240);
	clearMenu();
	output("\n\n<i>“I’m done, you thirsty slut,”</i> Moa-zalla laughs urbanely, dragging her wilted ovipositor out of your gaping, gooey [pc.vaginaNoun " + hole + "]. <i>“Also, your helmet is flashing. I think you are, too.”</i> She relaxes back onto her divan, looking thoroughly pleased with herself. <i>“See you around... Steele.”</i>");
	
	if (flags["BREEDWELL_PREM_PUN_STAFF"] > 0 || flags["BREEDWELL_PREM_PUN_VISITORS"] > 0)
	{
		addButton(0, "Next", breedwellPremiumSanctionDebrief,undefined);
	}
	else
	{	
		addButton(0, "Staff", breedwellPremiumSanctionStaff,undefined);
		addButton(1, "Visitors", breedwellPremiumSanctionVisitors,undefined);		
	}	
}
public function breedwellPremiumSanctionStaff():void
{
	clearOutput();
	showName("\nBOOTH");
	showBust("");
	author("Nonesuch");
	var firstTime:Boolean = true;
	if (flags["BREEDWELL_PREM_PUN_STAFF"] != undefined) firstTime = false;
	flags["BREEDWELL_PREM_PUN_STAFF"] = 0;
	
	output("<i>“Fancy ourselves a union [pc.boy], do we?”</i> titters Tamani. <i>“That’s sweet! As long as you don’t actually try and form a union. Then I’ll have to sanction you, again. Follow the line, please!”</i>");
	output("\n\nThe visor paints a blue line on the floor in front of you. You get up and follow it, down some stairs into the bowels of the space station, where the employees of Breedwell rest and reside. The rahn you pass grin and giggle when they see you coming, in your skin-tight suit with the bold lettering on the shoulders; you blush and concentrate on the line.");
	output("\n\nIt leads you into a spacious staff room, modestly furnished with vid screens, seating areas, nutrient dispensers and a small public bath, everything walking amoebas might need or want on their break.");
	output("\n\n<i>“PSO? Over there. Good luck,”</i> a bookish go’rahn says, indicating a closed booth in one corner with her holo-pad. It has a screen with Toon Tamani’s face on the side facing the room; currently she has a sad face and her word balloon is saying CLOSED. ");
	output("\n\nYou enter the booth. On the wall opposite is a padded hole, maybe two feet wide.<i>You should slide yourself through it.</i> Next to it a wet-wipe dispenser, and above it is a brass plaque that reads HERE TO HELP. GIVE HARD, GIVE GENEROUSLY! <i>You should push the upper half of your body through the hole. It is imperative you do this. You <b>must</b> - </i>");
	output("\n\nYou bend and push your arms and head through the smooth, padded aperture, and groan with joy: the relief you feel is instant, washing right down your body, ending with pleasant little nibbles over your [pc.clit]");
	if (pc.hasCock()) output(" and [pc.eachCock]");
	output(". There’s an identical booth on the other side of the wall. From the sound of the foot traffic, it’s situated in a major corridor in the lower station.");
	
	output("\n\nYou squeak as the hole scrunches up around you, tightening up securely around your waist. You bat against it with your palms, finding you are quite firmly stuck, with your head and [pc.chest] on one side, your [pc.ass] and [pc.legs] on the other. You hear a click on the side of the booths.");
	output("\n\n<i>“Oh sweet. We got a relief op in?”</i> It’s the muffled, girly sound of a rahn on the staff room side. <i>“It’s been waaayyy too long.”</i> The booth door opens and closes behind you.");
	output("\n\n<i>“Oh wow!”</i> You gasp as a hand lands sharply on your [pc.ass]. <i>“What an ass they got in for us today! Mmm...”</i> They’ve drawn away, and a moment later you feel why - of its own volition, your suit is peeling away, exposing the [pc.skinFurScales] on your backside to the cool air, and the lustful gaze of the unseen rahn. <i>“...oh, I’m going to go <i>nuts</i> on you, you naughty [pc.boy]!”</i>");

	clearMenu();	
	pc.lust(60);
	flags["BREEDWELL_PREM_PUN_STAFF"] += 60;
	processTime(60);
	clearMenu();	
	addButton(0, "Next", breedwellPremiumSanctionStaffNext,firstTime);
}
public function breedwellPremiumSanctionStaffNext(firstTime:Boolean=false):void
{
	clearOutput();
	showName("\nBOOTH");
	showBust("");
	author("Nonesuch");
	
	var hole:int = pc.findEmptyPregnancySlot(1);
	if (hole < 0) hole = rand(pc.vaginaTotal());
	var ppRahn:PregnancyPlaceholder = getBreedwellRahnPregContainer(rand(8));
	
	output("You huff and shiver, hands clutching at the other side of the wall as you feel the round, wet end of an ovipositor being poked around the sensitive opening of your [pc.vaginaNoun " + hole + "]. Strong, moist hands plaster themselves around your [pc.thighs] and you groan, a lewd, helpless sound, as the unseen rahn shoves herself into your innards deep. Quiet sound mutters in your ears and fingers massage your scalp and you are compelled to clamp down on her <i>hard</i>, dragging the smooth egg-cock intently along your walls. Wonderful shivers run up through your suit as you do, tiny fingers playing over your");
	if (pc.hasInvertedNipples()) output(" puffy");
	output(" erect");
	output(" [pc.nipples], rewarding your action with a full body massage over your [pc.skinFurScales].");
	
	pc.cuntChange(hole, ppRahn.cockVolume(0));
	
	output("\n\n<i>“Unf! God I love breeder pussy,”</i> cries the rahn, jelly thighs slapping against your raised [pc.butt] as she thrusts her thick, malleable sex into you joyously. <i>“Nobody - uh! - wants it in quite the same way...”</i>");
	output("\n\n<i>“Oh hey. I think I know you.”</i> You start as the door in front of you opens, and a curvy fuu’rahn technician sidles in. <i>“Sucks that they do this kind of thing to you, huh?”</i> She rather shyly unbuttons her skirt, revealing the smooth, soft delta beneath... all the while you are being made to clamp down and <i>milk</i> that ovipositor spreading your sweltering pussy beyond the wall for all you are worth. <i>“Do you think you could give me a lick? My boyfriend won’t do it. He only ever wants the poz.”</i>");
	output("\n\n<i>Open your mouth and present your tongue for use.</i> You do it, and this time you’re rewarded with a full-blown orgasm, pleasure shuddering into your core, [pc.femcum]");
	if (pc.isSquirter(hole)) output(" spurting");
	else output(" dribbling");
	output(" out of your packed entrance.");	
	output("\n\n<i>“Oh, you’re getting... the other side, right now?”</i> giggles the fuu’rahn, as she steps inwards, curling a hand around your [pc.hair] and presenting her prim cleft to your lips. She sighs as you delve inside with your [pc.tongue], tracing her sweet-tasting hole. <i>“That’s pretty hot. Up now... right there. Oh, that’s nice.”</i>");
	
	clearMenu();	
	flags["BREEDWELL_PREM_PUN_STAFF"] += 180;
	processTime(180);
	clearMenu();	
	addButton(0, "Next", breedwellPremiumSanctionStaffNext2,firstTime);
}
public function breedwellPremiumSanctionStaffNext2(firstTime:Boolean=false):void
{
	clearOutput();
	showName("\nBOOTH");
	showBust("");
	author("Nonesuch");
	
	var hole:int = pc.findEmptyPregnancySlot(1);
	var hole2:int = 0;
	if (hole < 0) hole = rand(pc.vaginaTotal());
	var ppRahn:PregnancyPlaceholder = getBreedwellRahnPregContainer(rand(8));
	var rn:int = 10 + rand(10);
	var rn2:int;
	
	output("The rahn tailgating you cums whilst you’re still nose deep in the turquoise gel girl, the inexpressibly pleasurable feeling of getting your [pc.vagina " + hole + "] packed full of warm, fertile eggs made even more intense by the way the suit makes you knead her like a good breeder for every last drop. She slaps your [pc.ass] as way of thank you, making you squeak into the technician’s mound. Soon afterwards, you feel fresh air wafting over your [pc.legs] as another client steps into the booth; after vocally considering the mess the last one made of your [pc.vagina " + hole + "], she opts to insert her bendy, nubby egg-tube into");
	
	breedwellPremiumCreampie(hole);
	pc.loadInCunt(ppRahn, hole);
	pc.orgasm();
	
	if (pc.vaginaTotal() > 1)
	{
		hole2 = pc.findEmptyPregnancySlot(1);
		if (hole2 < 0) hole2 = rand(pc.vaginaTotal());
		if (hole == hole2 && hole == 0) hole2 = 1;
		else if (hole == hole2) hole2 = 0;
	}
	else hole2 = -1;
	ppRahn = getBreedwellRahnPregContainer(rand(8));
	
	if (hole2 < 0)
	{
		output(" your [pc.anus] instead.");
		pc.buttChange(ppRahn.cockVolume(0));
		pc.loadInAss(ppRahn);
	}
	else
	{
		output(" your [pc.vagina " + hole2 + "] instead.");
		pc.cuntChange(hole2, ppRahn.cockVolume(0));
		breedwellPremiumCreampie(hole2);
		pc.loadInCunt(ppRahn, hole2);
	}
	pc.orgasm();
	
	output("\n\nBoth sides of you do a brisk trade, over the next few hours. There are little waves of activity, as staff come off shift and back on, so sometimes you can be left for many minutes, with little to do but feel egg-semen drool down your [pc.thighs] from your gaped holes; other times actual queues form outside your booths, rahn bustling in and unzipping themselves impatiently, looking for a quick, sweet appointment with your mouth or butt before they have to go back to work again.");
	output("\n\nThe suit and visored helmet work on you throughout. You might try and resist the delicate shivers that run up your sides and over your erogenous areas so delectably whenever you obey the subliminal impulses they are feeding into you.");
	if (pc.WQ() >= 75) output(" It’s in your nature to do so, and through sheer determination you hold out against it for a couple of hours.");
	output("\n\nUltimately though, you’re stuck in a wall, the padded hole holding you fast, and obeying it does just make the time go so much easier... so much sweeter. You thrust back into the rahn using your rear eagerly, and moan with pleasure as this bestows a sensational glow running from your core right out to your fingertips. You learn to");
	if (pc.hasTits()) output(" cup your [pc.boobs] and");
	output(" open your mouth, presenting your [pc.tongue] and throat for use to every horny gel girl that lets herself into your booth, and [pc.eachVagina]");
	if (pc.isSquirter()) output(" drools");
	output(" dribbles");
	output(" [pc.femcum]. You are nothing but an eager receptacle for sugary, slimy rahn love, something they use to work off their steam, and Void you learn to love it so much.");
	
	for(var y:int = 0; y < rn; y++)
	{
		ppRahn = getBreedwellRahnPregContainer(rand(8));
		rn2 = rand(4);
		if (rn2 == 0)
		{
			pc.lust(30);
			pc.loadInMouth(ppRahn);
			if (breedwellPremiumCanOrgasmGivingBJ()) pc.orgasm();
		}
		if (rn2 == 1)
		{
			pc.buttChange(ppRahn.cockVolume(0));
			pc.loadInAss(ppRahn);
			pc.orgasm();
		}
		else
		{
			hole = pc.findEmptyPregnancySlot(1);
			if (hole < 0) hole = rand(pc.vaginaTotal());
			pc.cuntChange(hole, ppRahn.cockVolume(0));
			breedwellPremiumCreampie(hole);
			pc.loadInCunt(ppRahn, hole);
			pc.orgasm();
		}
	}
		
	flags["BREEDWELL_PREM_PUN_STAFF"] += 120;
	processTime(120);
	clearMenu();	
	addButton(0, "Next", breedwellPremiumSanctionStaffNext3,firstTime);
}
public function breedwellPremiumSanctionStaffNext3(firstTime:Boolean=false):void
{
	clearOutput();
	showName("\nBOOTH");
	showBust("");
	author("Nonesuch");

	var ppRahn:PregnancyPlaceholder = getBreedwellRahnPregContainer(rand(8));	
	var allDone:Boolean = false;
	if (flags["BREEDWELL_PREM_PUN_GUESTS"] > 0 || flags["BREEDWELL_PREM_PUN_VISITORS"] > 0) allDone = true;
	
	output("<i>“Time’s up!”</i> trills Tamani in your ear, snapping you out of the blank, sexual daze. <i>“Ooh. I see you’re busy.”</i> You huff around the red, opaque gel-cock currently holding your [pc.lips] open, whilst another is being fervently pumped into your [pc.ass]. <i>“Well, once you’re done, you can");
	if (allDone) output(" head back to the changing room for debriefing");
	else output(" catch a break");
	output(". Good work!”</i>");
	output("\n\nThe zel’rahn scientist moans sweetly, boobs heaving as she unloads another torrent of sexual fluids down your gullet.");
	
	pc.lust(30);
	pc.loadInMouth(ppRahn);
	if (breedwellPremiumCanOrgasmGivingBJ()) pc.orgasm();
	
	ppRahn = getBreedwellRahnPregContainer(rand(8));
	pc.buttChange(ppRahn.cockVolume(0));
	pc.loadInAss(ppRahn);
	
	output("\n\n<i>“Just the ticket. Thanks [pc.boy]friend,”</i> she sighs as she withdraws over your lips. She tinkles with laughter when she notices you’re still juddering away, hands clutching at the wall. <i>“Still getting your butt reamed? I bet that’s Pahndee, she always takes her sweet time. Hey Pahndee!”</i> she yells, slapping on the wall. <i>“Let a poor [pc.boy] go on her break, huh? That ass belongs to someone!”</i>");
	output("\n\n<i>“Oh, you should feel it though...”</i> moans your partner orgasmically. You shudder as her hips meet your [pc.ass] again and again, thrusting that thick, malleable girl-club into your bowels. <i>“The candy they got us this time... oh! Ohhh!”</i>");
	output("\n\nYou bite your lip as you feel your bowels being packed with even more rahn batter, your [pc.belly] growing even more distended. The rahn leave you, one with an affectionate face stroke and the other with a regretful squeeze of your heinie, and at long last the aperture releases its grasp on your waist.");
	output("\n\nYou pool messily onto the floor of the staff room, groaning woozily as you clutch your massively rotund belly. Warm alabaster egg-seed gushes out of [pc.eachVagina] in a thick ooze, like an upended bowl of cake batter - it barely makes a difference to your size. Your womb");
	if (pc.vaginaTotal() > 1) output("s");
	output(", your stomach, and your intestines have all been utterly bloated with rahn ovum, and when you finally get up and waddle out of the booth you do so feeling more goop than [pc.race].");
	output("\n\n<i>“You were great,”</i> sighs a rather chubby go’rahn beatifically, relaxing in a seating pod nearby. <i>“You’ll do some more crimes and come back, right?”</i> ");
	
	clearMenu();
	if (allDone)
	{
		addButton(0, "Next", breedwellPremiumSanctionDebrief,undefined);
	}
	else
	{	
		output("\n\nShe points you to a shower room, and you spend the five minutes cleaning yourself up, taking deep breathes and rubbing your [pc.belly]. You’re still oozing thick, warm fluid from [pc.eachVagina], though, when two VR-generated buttons, blue and yellow, suddenly appear before you. A sharp zap to your [pc.ass] tells you to make your choice quickly.");
		addButton(0, "Guests", breedwellPremiumSanctionGuests,undefined);
		addButton(1, "Visitors", breedwellPremiumSanctionVisitors,undefined);		
	}	
}
public function breedwellPremiumSanctionDebrief():void
{
	clearOutput();
	var dohrahn:Boolean = quaelleReplacedWithDohrahn();		
	if (dohrahn) quaelleShowDohrahn();
	else showQuaelle();
	author("Nonesuch");
	
	var punCnt:int = 0;
	if (flags["BREEDWELL_PREM_PUNQ_CNT"] != undefined) punCnt += flags["BREEDWELL_PREM_PUNQ_CNT"];
	if (flags["BREEDWELL_PREM_PUNK_CNT"] != undefined) punCnt += flags["BREEDWELL_PREM_PUNK_CNT"];
	
	output("You slowly waddle back to the changing room, picking up looks and giggles as you go. The bottom of your suit is sticky with the constant ooze of rahn goo emanating from [pc.eachVagina], the front of it stretched way out as though you already were ten months pregnant. You are utterly gorged and exhausted, your [pc.groin] and throat throbbing mightily from the pounding they’ve taken over the last twelve hours.");
	output("\n\n<i>“Congratulations Public Service Operative, you completed your sanction!”</i> cheers Toon Tamani on the visor, once you’ve plonked yourself down on a bench. You glower at her as she bounces up and down and lets off party poppers. <i>“If you are a premium breeder, you have now been credited your salary. Isn’t it great to make soooo many people happy whilst being trained to be a better employee in the future? I think so! Let’s recap, so you can avoid having to do this again (unless you want to, of course!)”</i> This last is added in a stagey whisper and wink.");
	output("\n\nA whiteboard appears behind her, and a mortarboard drops onto her head, a pointer into her hand. Numbered points appear on the board, and she taps them as they appear.");
	output("\n\n<i>“1. Don’t steal rahn babies! 2. If you are a Premium Breeder, meet your quota every month! 3. Suck plenty of dick! That last one’s more of a suggestion.”</i> She retracts the pointer. <i>“Got that? Great! You may take the helmet off, and head back to the public area. Go forth and multiply, eager breeder!”</i>");
	output("\n\nYou take the helmet and skintight suit off, revelling in finally being free of them, and put your [pc.gear] back on.");
	
	if (punCnt >= 3)
	{
		output("\n\nYour head doesn’t throb at the end of these sessions anymore - you’ve let go of the bad, ungrateful thoughts, and everything is much, much easier and pleasurable.");
		if (!dohrahn) output(" You still accept the tea from Quaelle, though. She’s such a sweetie.");
		output("\n\nYou feel nothing but a wonderful glow of satisfaction at servicing so many of Breedwell’s staff and guests, being a lovely, sexy hole for them to bust their sumptuous sexual fluids into, from which you can grow wonderful and big with their babies, engorged with pregnancy at all times like a rahn bottom bitch ought to be.");
		output("\n\nYou sigh with delight at the thought, passing your hand over your [pc.belly], and it’s only with reluctance that you tear your mind away from thoughts of luscious, thick poz and back to where you should be going next.");

		if (pc.libido() < 100) pc.libido(2);			
	}
	else
	{
		output("\n\nYour head throbs, and you pass your hand over your brow as you [pc.move] back to reception");
		if (!dohrahn) output(", gratefully accepting the steaming cup of green tea Quaelle presses upon you");
		output(". You <i>should</i> feel angry about how Breedwell abused you there - but it’s hard to sustain the anger. What you feel instead is a low glow of satisfaction and pleasure from servicing so many sexy people, and the great load of eggs you harvested into your womb");
		if (pc.vaginaTotal() > 1) output("s ");
		output(", soon to be bloating you out with new life. Isn’t that the life for you? No, wait - you’re definitely outraged. You shake the confusing thoughts away, and try to concentrate on where you’re going next.");

		if (pc.libido() < 70) pc.libido(1);		
	}
	
	if (flags["BREEDWELL_PREM_BACKPAY"] != undefined)
	{
		pc.credits += flags["BREEDWELL_PREM_BACKPAY"];		
		flags["BREEDWELL_PREM_TTL_PAY"] += flags["BREEDWELL_PREM_BACKPAY"];
	}
	flags["BREEDWELL_PREM_BACKPAY"] = 0;
	breedwellPremiumEnsureMaxEggs();
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}
// Create random visitor
public function breedwellPremiumGetRandomCock(randomType:int = -1):PregnancyPlaceholder
{
	var ppRandom:PregnancyPlaceholder = new PregnancyPlaceholder();
	var rn:int;
	
	ppRandom.removeCocks();
	switch(randomType)
	{
		case 1:
			ppRandom.originalRace = "saurmorian";
			ppRandom.createCock(12, 3);
			ppRandom.shiftCock(0, GLOBAL.TYPE_SAURMORIAN);
			ppRandom.cocks[0].addFlag(GLOBAL.FLAG_RIBBED);
			ppRandom.cocks[0].addFlag(GLOBAL.FLAG_BLUNT);
			ppRandom.cocks[0].cockColor = "black";
			ppRandom.cumMultiplierRaw = 100;
			ppRandom.cumType = GLOBAL.FLUID_TYPE_CUM;
			ppRandom.impregnationType = "";
			break;
		case 2:
			ppRandom.originalRace = "ausar";
			ppRandom.createCock(8, 1.25);
			ppRandom.shiftCock(0, GLOBAL.TYPE_CANINE);
			ppRandom.cocks[0].addFlag(GLOBAL.FLAG_KNOTTED);
			ppRandom.cocks[0].cockColor = "red";
			ppRandom.cumMultiplierRaw = 50;
			ppRandom.cumType = GLOBAL.FLUID_TYPE_CUM;
			ppRandom.impregnationType = "";
			//ppRandom.impregnationType = "AusarPregnancy";
			break;
		case 3:
			ppRandom.originalRace = "human";
			ppRandom.createCock(36, 3);
			ppRandom.shiftCock(0, GLOBAL.TYPE_EQUINE);
			ppRandom.cocks[0].addFlag(GLOBAL.FLAG_FLARED);
			ppRandom.cocks[0].cockColor = "pink";
			ppRandom.cumMultiplierRaw = 2000;
			ppRandom.cumType = GLOBAL.FLUID_TYPE_CUM;
			ppRandom.impregnationType = "";
			break;
		case 4:
			ppRandom.originalRace = "cundarian";
			ppRandom.createCock(10, 1.5);
			ppRandom.shiftCock(0, GLOBAL.TYPE_EQUINE);
			ppRandom.cocks[0].addFlag(GLOBAL.FLAG_FLARED);
			ppRandom.cocks[0].cockColor = "blue";
			ppRandom.cumMultiplierRaw = 1000;
			ppRandom.cumType = GLOBAL.FLUID_TYPE_CUNDARIAN_SEED;
			ppRandom.impregnationType = "";
			break;
		default:
			rn = rand(4);
			if (rn == 0)
			{
				ppRandom.originalRace = "saurmorian";
				ppRandom.createCock(8 + rand(12), 1 + (rand(6) * .5));
				ppRandom.shiftCock(0, GLOBAL.TYPE_SAURMORIAN);
				ppRandom.cocks[0].addFlag(GLOBAL.FLAG_RIBBED);
				ppRandom.cocks[0].addFlag(GLOBAL.FLAG_BLUNT);
				ppRandom.cocks[0].cockColor = "black";
				ppRandom.cumMultiplierRaw = 50 + rand(100);
				ppRandom.cumType = GLOBAL.FLUID_TYPE_CUM;
				ppRandom.impregnationType = "";
			}
			else if (rn == 1)
			{
				ppRandom.originalRace = "ausar";
				ppRandom.createCock(6 + rand(12), .5 + (rand(4) * .5));
				ppRandom.shiftCock(0, GLOBAL.TYPE_CANINE);
				ppRandom.cocks[0].addFlag(GLOBAL.FLAG_KNOTTED);
				ppRandom.cocks[0].cockColor = "red";
				ppRandom.cumMultiplierRaw = 25 + rand(100);
				ppRandom.cumType = GLOBAL.FLUID_TYPE_CUM;
				ppRandom.impregnationType = "";
				//ppRandom.impregnationType = "AusarPregnancy";
			}
			else if (rn == 2)
			{
				ppRandom.originalRace = "human";
				ppRandom.createCock(12 + rand(12), 1 + (rand(6) * .5));
				ppRandom.shiftCock(0, GLOBAL.TYPE_EQUINE);
				ppRandom.cocks[0].addFlag(GLOBAL.FLAG_FLARED);
				ppRandom.cocks[0].cockColor = "pink";
				ppRandom.cumMultiplierRaw = 500 + rand(2000);
				ppRandom.cumType = GLOBAL.FLUID_TYPE_CUM;
				ppRandom.impregnationType = "";
			}
			else
			{
				ppRandom.originalRace = "human";
				ppRandom.createCock(4 + rand(18), .5 + (rand(6) * .5));
				ppRandom.cocks[0].cockColor = "pink";
				ppRandom.cumMultiplierRaw = 25 + rand(1000);
				ppRandom.cumType = GLOBAL.FLUID_TYPE_CUM;
				ppRandom.impregnationType = "";
			}
			break;
	}
	return ppRandom;
}
public function breedwellPremiumCreampie(vag:int=0):void
{
	var maxEggs:int = 2;
	maxEggs *= breedwellBreederLevel();	
	
	if(InCollection(pc.pregnancyData[vag].pregnancyType, ["RahnPregnancy", "RahnPregnancyBreedwell"])) 
	{
		if (pc.pregnancyData[vag].pregnancyQuantity < maxEggs)
		{
			addRahnEgg(vag);		
		}
	}
}
public function breedwellPremiumEnsureMaxEggs():void
{
	var maxEggs:int = 2;
	maxEggs *= breedwellBreederLevel();	
	var vagCnt:int = pc.vaginaTotal();
	var numEggs:int = 0;
	
	for(var vag:int = 0; vag < vagCnt; vag++)
	{
		if(InCollection(pc.pregnancyData[vag].pregnancyType, ["RahnPregnancy", "RahnPregnancyBreedwell"])) 
		{
			numEggs = maxEggs - pc.pregnancyData[vag].pregnancyQuantity;
			if (numEggs > 0) addRahnEgg(vag, numEggs);
		}
	}	
}
//[Renew?]
public function breedwellPremiumRenewPremium():void
{
	clearOutput();	
	var dohrahn:Boolean = quaelleReplacedWithDohrahn();		
	if (dohrahn) quaelleShowDohrahn();
	else showQuaelle();
	author("Nonesuch");	
	
	var conCnt:int = breedwellPremiumContractCount();
	var firstTime:Boolean = true;
	if (conCnt >= 2) firstTime = false;
	var otherBadEnd:Boolean = false;
	
	if (firstTime)
	{
		if (dohrahn)
		{
			output("You ask about your Premium Breeder status. Your contract has expired, you remember that from the last email - is it possible to renew it?");
			output("\n\n<i>“Damn. I meant to tell you...”</i> The purple receptionist rummages through her desk. <i>“Tamani Corp were impressed enough with how many sprogs you popped for them, that they want to offer you an improved contract. Six months long, this time, and you’ll get another free modification that’ll boost the capacity of your womb");
			if (pc.vaginaTotal() > 1) output("s");
			output(". Sound good?”</i> She pushes you a holopad contract and a stylus. <i>“Just sign the dotted line.”</i>");
		}
		else
		{
			output("You ask about your Premium Breeder status. Your contract has expired, you remember that from the last email - is it possible to renew it?");
			output("\n\n<i>“I was going to tell you shiverous Steele, Tamani Corp are fulminous with how you did,”</i> the roehm says brightly. She rummages through her desk, and presents you with a holopad, covered in tight writing. <i>“So much so, they want to offer you an improved contract! Six months long, this time, with another free modification to boost how many cute rahn babies you can carry. Sounds wonderful to me!”</i> She present a stylus to you. <i>“What do you say?”</i>");
		}	
		
		processTime(3);
		clearMenu();
		addButton(0, "Yes", breedwellPremiumRenewPremiumYes);
		addButton(1, "No", breedwellPremiumRenewPremiumNo);	
	}
	else
	{	
		/*
		if (conCnt == 2)
		{
		*/
			if (dohrahn)
			{
				output("You ask about your Premium Breeder status, barely able to restrain your eagerness to get back to spreading them for lovely, sexy gel ladies. Your contract has expired, you remember that from the last email - is it possible to renew it?");
				output("\n\n<i>“Uh. Yes,”</i> says the do’rahn, with unusual hesitancy. <i>“Yes, you can.”</i> ");
				output("\n\nShe brings out a holopad, pushes it over to you. <b>This one has an awful lot of fine print.</b>");
				output("\n\n<i>“I’ve been told to offer this you. It gets offered to all premium breeders that really impress Tamani, actually. You’d be working in their RnD department, their breeding pens... and with their advertisers I think.");
				if (otherBadEnd) output(" You’ve actually got multiple offers. Turns out a lot of people are interested in your ass. You can make a decision, once you sign.");
				output("”</i>");
				output("\n\nShe holds your eye as she passes you the stylus.");
				output("\n\n<i>“Only sign this one if you really want to, Steele.”</i>");
			}
			else
			{
				output("You ask about your Premium Breeder status, barely able to restrain your eagerness to get back to spreading them for lovely, sexy gel ladies. Your contract has expired, you remember that from the last email - is it possible to renew it?");
				output("\n\n<i>“Eeeehhhhhhhmmm.”</i> Quaelle hums for at least twenty seconds, double-pupiled eyes fixed on you, wringing her hands. <i>“I’ve been... instructed to offer you a new contract, yes, humberfelt Steele. Ummmm, ordered to, actually.”</i>");
				output("\n\nShe slowly presents a holopad, with Tamani Corp’s logo at the top. <b>This one has an awful lot of fine print.</b>");
				output("\n\n<i>“Tamani Corp want to offer you a permanent contract,”</i> the colorful roehm says. <i>“They do that, with the most impressive, judicirous premium breeders. You’d be working in their RnD department, their breeding pens... and with their advertising department, I think. Emmm.");
				if (otherBadEnd) output(" Other parties have made... offers. You are very popular, fulliscent Steele.");
				output("”</i>");
				output("\n\nShe taps the holopad with her stylus.");
				output("\n\n<i>“Only sign this one if you reeeeaaaaaallly want to. Ok?”</i> Her tone is almost pleading.");
			}
			
			processTime(10);
			clearMenu();
			addButton(0, "Sign", breedwellPremiumRenewLifetimeYes);
			addButton(1, "Don’t", breedwellPremiumRenewLifetimeNo);	
		/*
		}
		else
		{
		}
		*/
	}

}
//[Renew no]
public function breedwellPremiumRenewPremiumNo():void
{
	clearOutput();	
	var dohrahn:Boolean = quaelleReplacedWithDohrahn();		
	if (dohrahn) quaelleShowDohrahn();
	else showQuaelle();
	author("Nonesuch");	

	IncrementFlag("BREEDWELL_PREM_DONT");
	
	processTime(1);
	clearMenu();
	if (dohrahn)
	{
		output("<i>“Suit yourself,”</i> the do’rahn shrugs, putting the contract away. <i>“It’s there if you ever change your mind.”</i>");
		addButton(0, "Next", quaelleApproachDohrahn);
	}
	else
	{
		output("<i>“That’s fine. I wouldn’t want you to feel pressured, locquscious Steele,”</i> Quaelle says easily, putting the contract away. <i>“You’ve already done so much for The Great Effort. It’ll be on the table if you ever change your mind.”</i>");
		addButton(0, "Next", quaelleMainMenu, false);		
	}

}
//[Renew yes]
public function breedwellPremiumRenewPremiumYes():void
{
	clearOutput();	
	var dohrahn:Boolean = quaelleReplacedWithDohrahn();		
	if (dohrahn) quaelleShowDohrahn();
	else showQuaelle();
	author("Nonesuch");	
	
	var conCnt:int = breedwellPremiumContractCount();
	var firstTime:Boolean = true;
	if (conCnt > 1) firstTime = false;
	
	moveTo("BREEDWELL_MOD_BAY");
	
	output("This is barely a choice. Being a rahn incubator is wonderful, getting paid to do it is even better. A mod to make your body even more fertile and capacious? The cherry on top. You sign with a flourish.");
	if (dohrahn) output("\n\n<i>“You really love this line of work, huh?”</i> says the do’rahn, watching you sign the dotted line. <i>“Gimme a sec, and I’ll take you over to the modding suite.”</i>");
	else output("\n\n<i>“What a giving person you are, hoverful Steele,”</i> coos Quaelle, as she watches you sign the dotted line. <i>“How many rahn were given the gift of life because of you! Come on - let’s go straight over to the modding suite, shall we?”</i>");
	output("\n\nOnce again, you’re whisked to Breedwell’s gleaming white and steel Modding Bay, where the sleek, smiling loo’rahn consultant is ready to greet you enthusiastically, and sit you down in a padded, dentist-like chair. ");
	output("\n\n<i>“Willing, healthy breeders like you are priceless, Steele,”</i> she says. <i>“You keep this up and Tamani will be forced to offer you a permanent role.”</i>");
	output("\n\nThey put you under, and you wake under the sterile lab lights a little later, feeling groggy. The consultant hands you a mirror. The heart shaped emblem on your cheek is back, and... you train the mirror down further, onto the faintly luminescent pink heart tattoo that you now sport just above your crotch. You pass your hand over your [pc.belly]. The warm glow in there has intensified, emanating from your ovaries, the steady pulse of");
	if (pc.vaginaTotal() > 1) output(" multiple thirsty baby factories eager to start production.");
	else output(" a thirsty baby factory eager to start production.");	
	output("\n\nThe glow seems to rise up right to your brain, murmuring of a deep need to breed, to present [pc.eachVagina] to strong, virile mates, to hunt and milk poz and cock as a matter of urgency, to be stretched out and full of child as much as possible. You shiver at the thought of having such potency planted within you, and being marked in such a way that everyone will be aware of it.");
	output("\n\n<i>“You should see an uptick in your overall fertility,”</i> the consultant tells you, handing you a glass of water, <i>“as well as an increase in your capacity. <i>“You’re back on the PB database, " + pc.mf("Mr.","Ms.") + " Steele, and you’ll be pinged whenever a nearby subscriber desires your company. As before, you’ll be given a stipend for each encounter they give us a thumbs up from, regardless of whether they impregnated you. And, of course, you are still more than welcome to receive your eggings here! Just remember...”</i>");
	output("\n\nShe smiles at you briskly.");
	output("\n\n<i>“We need 22 rahn babies out of you every 30 days. If you don’t manage that, we’ll find alternative ways for you to meet your quota. Off you go! There’s a galaxy full of willing rahn out there, as you know. We’ll hopefully talk again in 6 months time.”</i>");
	
	flags["BREEDWELL_PREM_EGG_CAP_BONUS"] = 2;
	pc.fertilityRaw += .5;
	processTime(60);
	breedwellPremiumRenewSurgery();
	
	clearMenu();
	addButton(0, "Next", move,"BREEDWELL_RECEPTION");
}
//do mods for 6 month contract
public function breedwellPremiumRenewSurgery():void
{
	var desc:String;
	var time:int = 180 * 24 * 60;
	
	IncrementFlag("BREEDWELL_PREM_CNT");
	flags["BREEDWELL_PREM_QUOTA"] = 22;
	
	desc = "You have the tattoo of a Premium Breeder. This is the length of time remaining on your current contract."
	//pc shouldn't have existing status but just in case...
	if (pc.hasStatusEffect("Premium Breeder Cheek Tattoo")) pc.setStatusMinutes("Premium Breeder Cheek Tattoo", time);
	else pc.createStatusEffect("Premium Breeder Cheek Tattoo", 0, 0, 0, 0, false, "Icon_Sperm_Hearts", desc, false, time, 0xFF33AF);
	//pc shouldn't have existing status but just in case...
	if (pc.hasStatusEffect("Premium Breeder Crotch Tattoo")) pc.setStatusMinutes("Premium Breeder Crotch Tattoo", time);
	else pc.createStatusEffect("Premium Breeder Crotch Tattoo", 0, 0, 0, 0, false, "Icon_Sperm_Hearts", desc, false, time, 0xFF33AF);				
	
	flags["BREEDWELL_PREM_DAY"] = 1;
	flags["BREEDWELL_PREM_BACKPAY"] = 0;
	flags["BREEDWELL_PREM_SEX_CNT"] = 0;
	flags["BREEDWELL_PREM_KID_CNT"] = 0;
	flags["BREEDWELL_PREM_SEX_CNT_CON"] = 0;
	flags["BREEDWELL_PREM_KID_CNT_CON"] = 0;
	flags["BREEDWELL_PREM_PAYPERIOD"] = 1;	
}
//[Renew lifetime no]
public function breedwellPremiumRenewLifetimeNo():void
{
	clearOutput();	
	var dohrahn:Boolean = quaelleReplacedWithDohrahn();		
	if (dohrahn) quaelleShowDohrahn();
	else showQuaelle();
	author("Nonesuch");	

	processTime(60);
	clearMenu();
	addButton(0, "Next", move, "BREEDWELL_RECEPTION");
	
	output("Yeah... the way she’s talking about this has gotten your wind up. You’ll pass putting your name to that, as enticing a prospect as it might be.");

	if (dohrahn)
	{
		output("\n\nThe do’rahn pulls the contract away with a carefully neutral expression.");
		output("\n\n<i>“Ok,”</i> she says. <i>“I have to offer you that at the end of each six month contract, just so you know. Now you’ve turned it down, I’m authorized to offer you a six month extension to your existing contract. How does that sound?”</i>");
	}
	else
	{
		output("\n\nQuaelle looks very relieved.");
		output("\n\n<i>“I think that’s a smart decision, erratisome Steele,”</i> she says, patting your hand. <i>“I’m obliged to offer every premium breeder that, at the end of each six month spell. Now you’ve said no, I can offer you a six month extension to your existing contract. How about that?”</i>");
	}
	processTime(2);
	clearMenu();
	addButton(0, "Yes", breedwellPremiumRenewSixMonthYes);
	addButton(1, "No", breedwellPremiumRenewSixMonthNo);	
}
//[Renew lifetime no 6 months no]
public function breedwellPremiumRenewSixMonthNo():void
{
	clearOutput();	
	var dohrahn:Boolean = quaelleReplacedWithDohrahn();		
	if (dohrahn) quaelleShowDohrahn();
	else showQuaelle();
	author("Nonesuch");	
	
	output("<i>“Fair enough,”</i> she says. <i>“It’ll always be on the table if you change your mind.”</i>");
	
	processTime(1);
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}
//[Renew lifetime no 6 months yes]
public function breedwellPremiumRenewSixMonthYes():void
{
	clearOutput();	
	var dohrahn:Boolean = quaelleReplacedWithDohrahn();		
	if (dohrahn) quaelleShowDohrahn();
	else showQuaelle();
	author("Nonesuch");	
	
	output("After carefully scrutinising the contract to make sure it’s the same as the one you signed before, you scribble your signature. Another six months of rahn love, heading your way. You feel heat bloom on your cheek and crotch - your advertising tattoos, lighting up once again.");
	output("\n\n<i>“Perfect,”</i> grins the receptionist. <i>“Remember - we need 22 rahn out of you every month. Any less, and you get the sanction.”</i>");
		
	processTime(70);
	breedwellPremiumRenewSurgery();
	
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}
//[Renew lifetime yes]
public function breedwellPremiumRenewLifetimeYes():void
{
	clearOutput();	
	var dohrahn:Boolean = quaelleReplacedWithDohrahn();		
	if (dohrahn) quaelleShowDohrahn();
	else showQuaelle();
	author("Nonesuch");	
	
	var btn:int = 0;
	
	var punCnt:int = 0;
	if (flags["BREEDWELL_PREM_PUNQ_CNT"] != undefined) punCnt += flags["BREEDWELL_PREM_PUNQ_CNT"];
	if (flags["BREEDWELL_PREM_PUNK_CNT"] != undefined) punCnt += flags["BREEDWELL_PREM_PUNK_CNT"];
	
	var guestPunish:Boolean = false;
	if (flags["BREEDWELL_PREM_PUN_GUESTS"] != undefined) guestPunish = true;
	
	var cowmazonBadend:Boolean = false;
	if (flags["BREEDWELL_PREM_BADEND_COWMAZON"] == 1) cowmazonBadend = true;
	var lavlevBadend:Boolean = false;
	if (flags["BREEDWELL_PREM_BADEND_LAVLEV"] == 1) lavlevBadend = true;
	
	output("You only hesitate over the dotted line for a moment. The more you’ve done this job, the more you’ve taken sweet ovipositor deep inside you and had it swell out your wombs with new life");
	if (punCnt > 0) output(", the more you’ve gladly accepted Breedwell’s sanctions and had those slutty, lovely thoughts slipped fast between the sheets of your mind,");
	output(" the more you’ve become convinced this is the life you were born to lead. You sign with a flourish.");
	if (dohrahn) output("\n\n<i>“Go through into the VIP lounge,”</i> the receptionist says. <i>“They’re waiting for you there. See you around, Steele.”</i>");
	else
	{
		output("\n\n<i>“Weeellll... if it is what you want... I can’t sit in your way.”</i> The roehm smiles at you");
		if (quaelleIsLover()) output(" with a touch of melancholy");
		output(". <i>“Go through into the VIP lounge, mumberlous Steele. They’re waiting for you there. Good luck.”</i>");
	}
	output("\n\nAbove the hubbub of the incubation lounge, where the rahn guests chatter and wait for an incubator volunteer to become available, there’s a fancy VIP section.");
	if (guestPunish) output(" It’s strange to be here not serving as a skin-suited PSO. Several of the immaculately dressed rahn smirk at you in recognition.");
	output("\n\nAt a table you recognize the loo’rahn consultant who has been implementing your breeder mods, sat with a suited, androgynous vildarii with slicked back hair.");
	output("\n\n<i>“[pc.name] Steele! I’ve heard so much about you,”</i> smiles the red-skinned shapeshifter, raising their glass to you. <i>“I’m very pleased to meet our corporation’s newest piece of intellectual property.”</i>");
	output("\n\nIntellectual property?");
	output("\n\n<i>“Of course!”</i> The vildarii looks professionally bemused by your questioning tone. <i>“Within you are contained several prototype pieces of Tamani Corp bio-engineering. Very expensive ones, all of which you agreed to install inside you. Really, that piece of paper you signed is a simple confirmation of what’s been true for a while - Tamani Corp own you, and your lovely body, in perpetuity.”</i>");
	output("\n\nOh.");
	if (lavlevBadend) output("\n\n<i>“You’re a highly sought after piece of property, I may say,”</i> the Tamani representative says. They indicate the documents in front of them. With a tightening of the chest, you recognize Lavender Leverage’s logo. <i>“LavLev have a buyout offer placed, were you ever to take the final step. A <i>substantial</i> buyout offer. How did you ever get tangled up with those crooks? Anyway, I am authorized to accept it... if you’d prefer to be owned by them.”</i> They smile at you urbanely. <i>“Your happiness is a priority.”</i>");
	if (cowmazonBadend)
	{
		output("\n\n<i>“You do have another option, Steele...”</i> the consultant butts in.");
		output("\n\n<i>“Na-zee...”</i> drawls the vildarii, with a hint of warning.");
		output("\n\n<i>“A sperm donor left their details at the front desk,”</i> the loo’rahn pushes on. <i>“It seems you, uh, impressed her when you were working as a PSO for us. We were supposed to hand the details over if you ever got into trouble.”</i> She fiddles with her napkin. <i>“I’m strictly forbidden from doing that of course, but... perhaps if something were to drop on the floor...”</i>");
		output("\n\n<i>“There’ll be trouble about this, Na-zee,”</i> the rep sighs, with the air of a chiding parent. They look at you. <i>“We take run-away pieces of property quite seriously, Steele. Do be aware.”</i>");
	}
	processTime(30);
	clearMenu();
	if (lavlevBadend || cowmazonBadend)
	{
		output("\n\nIt seems as if you do have a choice here - although all of them, you suspect, are going to be permanent assignations. Blissfully permanent.");
		if (cowmazonBadend)
		{
			addButton(btn, "Details", breedwellPremiumBadEndCowmazon, undefined, "Details", "Press Na-zee to give you the cowmazon’s coordinates.");
			btn ++;
		}
		if (lavlevBadend)
		{
			addButton(btn, "LavLev", breedwellPremiumBadEndLavLev,undefined,"LavLev","");
			btn ++;
		}
		addButton(btn, "Tamani", breedwellPremiumBadEndTamani,true,"Tamani","Accept a permanent role with the biggest fertility company in the galaxy.");
	}
	else
	{
		output("\n\n<i>“Please don’t be alarmed,”</i> they say, accepting a refill of champagne. <i>“We treat our stock well - of all kinds, haha. We wouldn’t be doing this if we weren’t certain that you were perfect for an internal role at Tamani.”</i> The vildarii rep smiles at you over the brim. <i>“You’re going to love it, Steele.”</i>");
		addButton(0, "Next", breedwellPremiumBadEndTamani, false);
	}	
}
//[Tamani Bad End]
public function breedwellPremiumBadEndTamani(chosen:Boolean=false):void
{
	clearOutput();	
	showBust("");
	showName("TAMANI\nBROODMARE");
	author("Nonesuch");	
	
	if (chosen) 
	{
		output("<i>“Please don’t be alarmed,”</i> the vildarii says, accepting a refill of champagne. <i>“We treat our stock well - of all kinds, haha. We wouldn’t be doing this if we weren’t certain that you were perfect for an internal role at Tamani.”</i> The vildarii rep smiles at you over the brim. <i>“You’re going to love it, Steele.”</i>");
		output("\n\n");
	}
	output("Perhaps you knew that this was where all of your professional whoring, incubating and experimental fertility treatments was headed. Whatever the case, accepting that Tamani Corp owns you now is easier than you expected.");
	output("\n\nPart of the reason for that is that they make it easy. You are transported to their research headquarters, a space station twice the size of Breedwell, and are there provided with pleasant quarters, access to the on-site gym and park, and an exquisite diet. It’s important that you are in the best of health for the rigors of your job, as you soon discover.");
	if (pc.vaginaTotal() > 1) output("\n\nAll of the modifications Breedwell gave you previously were but a primer, preparation for the intense gene treatments that are now tested weekly upon your body. [pc.eachVagina] puff up " + (pc.puffiestVaginalPuffiness() >= 2 ? "even more " : "") + "over the course of several weeks, becoming incredibly soft and padded organs with folds upon folds of delicate, supple flesh that can take even the largest, most brutal poundings - as you find out, over many, many rigorous days of testing in the robotic penetration labs.");
	else output("\n\nAll of the modifications Breedwell gave you previously were but a primer, preparation for the intense gene treatments that are now tested weekly upon your body. [pc.eachVagina] puffs up " + (pc.puffiestVaginalPuffiness() >= 2 ? "even more " : "") + "over the course of several weeks, becoming an incredibly soft and padded organ with folds upon folds of delicate, supple flesh that can take even the largest, most brutal pounding - as you find out, over many, many rigorous days of testing in the robotic penetration labs.");
	
	if (pc.vaginaTotal() > 1) output("\n\nYour kegel muscles are elongated and rounded out, making your pussies incredibly powerful phallus milking machines.");
	else output("\n\nYour kegel muscles are elongated and rounded out, making your pussy an incredibly powerful phallus milking machine.");
	output(" Clenching up around any kind of penetration provides you with mind-blowing, inhuman amounts of pleasures, invariably driving you to an incredible orgasm. Which is a feature - orgasm now <i>grips</i> with those new sheaths of muscle as well as producing litres of pheromonal lubricant, ensuring any prick or ovipositor that enters you isn’t leaving until it’s been utterly drained dry. Lab assistants and volunteers leave your quarters knock-kneed and pale.");
	output("\n\nFurther inside, your ovaries are coaxed into splitting first once, then twice, then each doubling in size, six overclocked egg machines " + (pc.vaginaTotal() >= 2 ? "for each womb " : "") + "that fill your veins with intoxicating, hormonal urge. You are deprived of stimulation for a week, at the end of which a supposedly sterile kaithrit male is pushed into your pen. Before he’s even got a word out of his mouth you’ve pinned him beneath you, driven by your heat to rip his pants off and clasp his lovely barbed kitty cock deep inside you. Overwhelmed by the pheromones you now produce in waves from your pores, he can’t do anything but cum, and cum, and cum. Your womb bears four kits from his supposedly still seed.");
	if (pc.hasCock())
	{
		output("\n\nBy rights the floods of estrogen pouring through your veins now should make [pc.eachCock] shrivel up and disappear like melting ice. The research teams don’t mind you keeping " + (pc.cockTotal() >= 2 ? "them" : "it") + " though. Indeed, they provide you Virection supplements so that you can maintain your male sex in order to test what effect the cocktail of gene treatments you are undergoing might have on hermaphrodites.");
		output("\n\nIt is decided the fact you tend to spontaneously orgasm with [pc.eachCock] whenever something penetrates your over-sensitive twat" + (pc.vaginaTotal() >= 2 ? "s" : "") + ", [pc.cum] spraying out in throbbing sympathy to the incredible stimulation and the pressure your multiple pregnancies put upon your prostate, can be marketed as a feature rather than a bug.");
	}
	output("\n\nYou prefer to <i>be</i> bred though: for primal studs, insatiable hermaphrodites, eerily alluring insect queens to push you down and fuck you senseless with thick, dripping cock or ovipositor, use that immaculately crafted female sex for what it was made to do, having huge broods of eggs and babies swell into your thirsty, spacious womb" + (pc.vaginaTotal() >= 2 ? "s" : "") + ", practically immobilising you with pregnancy.");
	output("\n\nPart of the reason for that is the persistent subliminal training you undergo: the visored helmet, the smooth, quiet voice in your ear as you sleep. Again, all of your experience with Breedwell was merely a foundation, upon which a glowing skyscraper of lust, allure and urge to breed is now constructed. Your empathy becomes such that, at a glance, you can tell what soothing words, which teasing laughs, what little gusts of pheromones and stroking touches, will reduce the shyest soul into a raging paramour in your bedroom, desperate to ravish and impregnate you.");
	output("\n\nIt’s not lost upon the corporation what a powerful advertising tool owning the pampered scion of a famous explorer-entrepreneur is. Once your mind and body are thoroughly conditioned, you participate in regular film shoots. TAMANI TESTED - STEELE APPROVED! Is a consistent tag-line, usually whilst the next generation of dildo is being simultaneously pumped into your pussy and between your smiling [pc.lips]. Your [pc.ass], with the Tamani logo tattooed on it, becomes well known, usually whilst it’s jiggling away as you ride a supposedly stone-cold impotent volunteer senseless. Many wealthy partners are provided with children they otherwise couldn’t have, thanks to the kind efforts of Broodwhore Steele. You lose memory of what it was ever like to not carry around a big baby bump " + (pc.hasTits() >= 2 ? "and full, milk-swollen tits " : "") + "at all times.");
	output("\n\nThe pinnacle of your career arrives when scientists discover a single member of a species of space-faring leviathan, thought long extinct, frozen into a meteorite. A program is quickly set up to clone the unfathomably alien but clearly sapient creature, but the effort is futile unless somewhere in the galaxy there is a mate adaptable and elastic enough to bear a viable new generation.");
	output("\n\nYou spend long months in the whale-like being’s pen spitted on the thing’s huge, prehensile, studded cock, heavy fuck sessions that go on for many hours until you are slathered in sweat and utterly stuffed with cool, blue semen, ecstasy and exhaustion throbbing all the way through you. You are pipe-fed nothing but the thing’s musky, vaguely grape-flavoured cum in that time, in order that you properly scented and marked as his mate, and once you are, he is deeply protective of and eye-rollingly enthusiastic with you.");
	output("\n\nThe pregnancy takes, bloating you out beyond anything you’ve ever known before, utterly immobilizing you with a belly packed and trembling with a pod of leviathan babies. Which is fine - your mate is quite happy to keep you fed, stretching out your throat with the thick, studded might of his cock, thrusting out more thick grape seed into your gut with his strange, lonesome groans shaking the walls.");
	output("\n\nIt’s a long, long time before you get out of there - there’s three leviathan children to nurse, after all - but by the time you do, you’re famous far beyond what you were before. Broodmare Steele, a ride with a nature and cunt so sweet it can save entire species. People attain fortunes on the stock market, in the casino, on the frontier just to spend it on a single night in your embrace.");
	output("\n\nSuffice to say, Tamani has done very well out of you. And your career as their giddily gleeful ultra-fertile slave is really only just beginning.");
	
	clearMenu();
	badEnd("THE END");
}
//[Cowmazon Bad End]
public function breedwellPremiumBadEndCowmazon():void
{
	clearOutput();	
	showBust("");
	showName("\nCOWMAZON");
	author("Nonesuch");	
	
	var lavlevBadend:Boolean = false;
	if (flags["BREEDWELL_PREM_BADEND_LAVLEV"] == 1) lavlevBadend = true;
	
	output("You ask if you can go to the bathroom, clear your head a little, before making a decision.");
	output("\n\n<i>“Of course,”</i> the vildarii says, eyes wandering across to two pretty go’rahn sisters at the next table. The red androgyne probably guesses your intentions, and either they don’t mind... or don’t think you’re going to get very far. <i>“Take all the time you need.”</i>");
	output("\n\nYou deliberately use the bathroom near the hangar, where you came in, and where you spent some of your sanctioning. You gaze down at the rubbery hole in the wall, unoccupied currently, remembering a wide, brawny set of hips, and a thick, pale pink horse dick stretching your mouth open. It’s hardly the best way of getting to know someone, but you remember the tenderness in her tone - and the thought of becoming a lab-rat " + (lavlevBadend ? "or a sadistic business exec’s plaything " : "") + "makes you shudder. Any port in a storm.");
	output("\n\nThe door swings, and Doctor Na-zee bustles in.");
	output("\n\n<i>“Here,”</i> she says, flicking out a small data-bead. <i>“They are quite serious, you know: You’ve got a lot of biotech inside of you that doesn’t belong to you. You’re going to have to go completely off the grid for a long time, if you don’t want to be dragged back here. I would get moving, and tell your big friend the same thing when you find her. Good luck.”</i>");
	
	processTime(30);
	clearMenu();
	addButton(0, "Next", breedwellPremiumBadEndCowmazonNext);
}
//[Cowmazon Bad End]
public function breedwellPremiumBadEndCowmazonNext():void
{
	clearOutput();	
	showBust("");
	showName("\nPATRONELLA");
	author("Nonesuch");	
	
	moveTo("TAVROS HANGAR");
	
	output("You shoot back into your [pc.ship] and head out of Wistral as fast as you can. An official communication from Breedwell tells you that you are unauthorized to use the warp gate and to turn back immediately just as you’re approaching it. It’s co-signed by the local U.G.C. authority.");
	output("\n\nYou’re in a panic by the time you land in Tavros docking bay. You’re certain you see uniformed peacekeepers approaching your ship as you head up the escalator; you’ll have to ditch it.");
	if (crew(true, false) > 0) output(" You duck into Anon’s and compose a hurried email to your crew, telling them that you’ve had to scarper, that they are not to look for you, and the ship is theirs to do with as they choose.");
	output("\n\nIt’s only then, huddled in a dark corner of a bar, that you look at the message the cowmazon left you. PATRONELLA. COME FIND ME, K SUGARLIPS? I CAN LOOK AFTER YOU. XXX. There’s some coordinates, which punched into your codex reveals a virtually uninhabited moon in a virtually uninhabited system, as far out in the current planet rush as it’s possible to be.");
	output("\n\nYou carefully ask around amongst the spacers in the bars and brothels of the commercial deck, and eventually manage to find someone who’s willing to zip you out to Verono III without putting your name into any flight record. You were on the ball enough to load up some credit chits while you were still at Breedwell, and you pay your pilot with those; a quick check of your bank account reveals that it has been frozen.");
	
	processTime(600);
	clearMenu();
	addButton(0, "Next", breedwellPremiumBadEndCowmazonNext2);
}
//[Cowmazon Bad End]
public function breedwellPremiumBadEndCowmazonNext2():void
{
	clearOutput();	
	showBust("");
	showName("\nPATRONELLA");
	author("Nonesuch");	
	
	output("So it is that you find yourself on the sandy, windblown heaths of Verono III, watching a ship swiftly depart beyond the orange clouds, with nothing to the name of [pc.name] Steele except the gear [pc.he]’s standing up in. ");
	output("\n\nYou [pc.move] through the rough vegetation, wind whipping around your [pc.hair], until a building appears over the horizon. It’s a farm building, a generic synthetic autossembler, heavily modified and decorated; it features a lot of hanging flowers and wind ornaments. There’s a large, brown figure outside, at work in a vegetable patch.");
	output("\n\n<i>“Yes?”</i> Patronella says, straightening formidably up once you reach the gate. <i>“Do I know you?”</i> Her dark brown eyes move to your [pc.lips]. <i>“Oh.”</i> A big, toothy smile breaks out over her broad, pleasant features. <i>“Ohhhh!”</i>");
	output("\n\nYou have plenty of time to properly take the person you’re throwing yourself upon the mercy of as she disposes of her work gloves and lumbers across. And there’s a lot to take in. From her feet up to the sharp, curving tips of her horns she’s easily eight foot tall, and just as big as she is tall: slabs of muscle bulge in her huge thighs and sunburnt arms, and her full, watermelon-like breasts loom out in front of her, the outline of her thumb-sized nipples visible against her stretched, gingham shirt. And, of course, in the crotch and halfway down the length of her worn, mucky jeans, there is a hefty bulge.");
	output("\n\n<i>“So let me guess,”</i> she says, as she leans on the fence next to you with a creak, tail swishing. You’re hit by the smell of a cowmazon who’s just spent most of the morning in the garden, and you’re practically rocked back by it; salt overlaying warm, bestial musk, overwhelming and undeniable, the scent of an alpha throbbing with health and virility.");
	if (pc.vaginaTotal() > 1) output(" [pc.eachVagina] puff up and trickle [pc.femcum] of their own accord as she speaks.");
	else output(" [pc.eachVagina] puffs up and trickles [pc.femcum] of its own accord as she speaks.");
	output("\n\n<i>“The nice folks there at Breedwell kept offering you nice little freebies to keep working for ‘em. But it turns out they weren’t no freebies, and then they made you an offer you couldn’t refuse. Then you ran all the way here. That about right?”</i>");
	output("\n\n<i>“Yes,”</i> you mutter. You realize how hopeless and ludicrous the situation you’ve found yourself in is, the blur of the last 24 hours and everything you’ve lost weighing onto your shoulders. Some of it must show on your face, because Patronella immediately unlatches the gate and gathers you into her brown, bulky arms for a hug. It’s only moderately bone-crushing.");
	output("\n\n<i>“Aw no, don’t be like that! It happens to the best of us. See, this?”</i> She moves your hand down to the thick, warm bulge in her pants. <i>“I took one of Tamani’s dang treatments myself. Jacked my lil guy up so I could get all the credits I needed using their extractor thingies. I wanted to afford to do... this.”</i> She swings you around bodily so you can see the handsome farmhouse. <i>“But it’s so difficult to control now. I need milkings, daily, or I can’t think straight. Course Tamani would prefer me that way. They hoped I’d spend the rest of my days giving ‘em lakes of cum.”</i>");
	output("\n\n<i>“But did I let ‘em? Naw!”</i> Patronella squeezes you again, head firmly wedged between the warm softness of her breasts. The smell of her envelopes your senses: concentrated, untamed sex. <i>“I did what I wanted to do, and no matter how pent up I get, I c’n tell myself I stuck it to those bastards. And you did the same thing. They don’t own you. Nobody owns you. ‘Cept me.”</i>");
	output("\n\nYou look up to find her grinning down at you knowingly. Beneath your hand the bulge throbs, and [pc.eachVagina] practically soak");
	if (pc.vaginaTotal() > 1) output(" themselves, delirious with the amazon pheromones you’re drenched in.");
	else output("s itself, delirious with the amazon pheromones you’re drenched in.");
	output("\n\n<i>“Or I will, anyway,”</i> she goes on in a lower tone, once again raising her finger to your mouth to trace your [pc.lips]. You let her do it, entranced by the gentle yet assertive movement. <i>“I ain’t no corpo bloodsucker, you c’n decide. You can stay here, so long as you do as I say, and you can take all the time you want decidin’ whether or not this is the bolthole for you. For now...”</i>");
	output("\n\nThe cowmazon releases you to step back and unzip her pants. You can’t stop a groan bubbling up as the undiluted smell of her pink, sheathed bull-cock, all three feet of it, swings down between her thighs like a pendulum, flanked by two heavily swollen balls.");
	output("\n\n<i>“...you can get on your [pc.knees], and remind me how we got to know each other in the first place.”</i>");

	processTime(720);
	pc.maxOutLust();
	clearMenu();
	addButton(0, "Next", breedwellPremiumBadEndCowmazonNext3);
}
//[Cowmazon Bad End]
public function breedwellPremiumBadEndCowmazonNext3():void
{
	clearOutput();	
	showBust("");
	showName("\nPATRONELLA");
	author("Nonesuch");	
	
	output("After that first time, Patronella, pragmatic beast that she is, spends the rest of the day carefully tidying up her small farm and stocking its larder with enough food for two days. Then she spends those two days fucking you, working out whole weeks’ worth of pent up seed.");
	output("\n\nShe hikes your [pc.legs] up against the barn door and thrusts her pink horse cock into your [pc.vagina 0] until it streams [pc.femcum] and you are screaming her name; then she pushes you onto your [pc.knees] and muffles your pants with it, large hand wrapped around your [pc.hair] as she stretches your throat out with dripping bull dick. Then she bends you over a table and");
	if (pc.vaginaTotal() > 1) output(" helps herself to your [pc.vagina 1].");
	else output(" pulverizes your pussy some more.");
	output(" On and on it goes.");
	output("\n\nSometimes she cums, swelling out your gut and womb with vast amounts of cowmazon cum, spewing out over your back and face and [pc.chest] until you’re painted cream from top to bottom. It barely slows her down, only makes her grunt with approval, continuing to thrust her hosing cock into your [pc.anus], her warm, brown mass pinning your sweaty frame to the bed.");
	output("\n\nIt’s utterly exhausting and your holes ache fiercely, but the farm bakes in the smell of her, salty and musky and crudely enthralling in a way that makes you arch your back and mewl in her presence, keeps you from ever tapping out. And your body has been adapted to take this. Your womb");
	if (pc.vaginaTotal() > 1) output("s throb in delight to the regular bathings in stud seed they receive. Your tummy greedily metabolizes the buttery lashings of seed it gets stuffed with, growls for more. [pc.eachVagina] stretch out heroically, becoming the kind of softened, large, elastic fuck-holes a big-dicked, oversexed cowmazon requires on a frequent basis. You dimly realize that she reached out to you for a reason.");
	else output(" throbs in delight to the regular bathings in stud seed it receives. Your tummy greedily metabolizes the buttery lashings of seed it gets stuffed with, growls for more. [pc.eachVagina] stretches out heroically, becoming the kind of softened, large, elastic fuck-hole a big-dicked, oversexed cowmazon requires on a frequent basis. You dimly realize that she reached out to you for a reason.");
	output("\n\nYou orgasm until you are senseless, you see her brown brawn and vast curves catching the light of the orange sun and your mouth waters, and so it is at the end of two days you are looking up her rippled abdomen, lapping the sweat off her apple-sized testicles, cum pouring out of your gaped pussy, returning her calm gaze with nothing but adoration.");
	output("\n\n<i>“Mmm. That’s what I wanted to see,”</i> Patronella murmurs. <i>“My dad always said you ain’t earned the right to stick a bell on ‘em until they’ve started suckin your balls whilst lookin at you like that.”</i>");
	
	processTime(2 * 24 * 60);
	clearMenu();
	addButton(0, "Next", breedwellPremiumBadEndCowmazonNext4);
}
//[Cowmazon Bad End]
public function breedwellPremiumBadEndCowmazonNext4():void
{
	clearOutput();	
	showBust("");
	showName("\nPATRONELLA");
	author("Nonesuch");	
	
	output("So you put the slim metal collar on with the sweet little bell inscribed with ‘Property of Patronella’, and accept life as a cow bitch under the orange skies of Verono III. You worry for a long time that Tamani Corp will, eventually, work out where you went, but they never seem to: you are, as that loo’rahn doctor advised, completely off the grid on this sparsely populated, scrubby rock at the back end of beyond.");
	output("\n\nYou do make yourself miserable, particularly in the tough first couple of months, thinking about the glamorous life you threw away by signing that stupid dotted line. It makes you toss and turn in bed, thinking about it. But the exhausting, fulfilling life of both managing a farm and being Patronella’s dedicated cumdump leaves little time for reflection. And, ultimately, how happy would have finding your father’s fortune made you? Happiness is filling your mouth with the juicy, girthy, flat-tipped cock of your Mistress every morning. Happiness is coaxing green, nourishing life out of the moon’s begrudging soils. Happiness is going to sleep with your head wedged between a pair of huge breasts and a strong hand clasped around your [pc.ass] every night. Happiness is your belly quickly taking on a growing, gravid curve");
	if (pc.hasTits()) output(", your [pc.boobs] swelling with [pc.milk]");
	output(".");
	output("\n\nPatronella is a tender individual under her rough, assertive manner, and she drops railing you like a frenzied piston as soon as you become noticeably pregnant, as tough as that is for her. Fortunately, she knows exactly how to acquire another outlet for her insatiable libido. Qanda is an ausar employee of Carver Catering Company who became addicted to pleasure patches and wound up signing her whole life away. When you see her at the gate - pretty, svelte, sandy-furred thing with hollow eyes, uncertainly clutching a data bead - you see yourself a year ago.");
	output("\n\nMistress patiently dries her out over the course of a month, and subsequently you get a harem mate, a funny, energetic one with a waggy tail whom it is a pleasure to worship a big, pheromone-perfumed amazon cock with. With two of you, things become far easier: one of you sees to the kitchen and a shared, growing brood, their belly taut and heavy with the next addition, whilst the other acts as Mistress’s dedicated ball-drainer, making her groan with deep gratification as she bounces your head against the backboard, your [pc.thighs] clutched around her broad, dense waist, moulding your body around her thick, dripping phallus, rubbing and stuffing you in that way that makes you cum again, and again, and again.");
	output("\n\nYou bear down with your [pc.thighs] and strain one child after another into existence, big, ruddy, bawling, healthy babies with tiny, blunt horns, all of your breeder experience making the experience easy and instinctive. And why shouldn’t you? This is a world that needs populating, after all, and Patronella is a tireless worker, constantly expanding the farm. The three of you begin to discuss adding a third member to the harem, finding another lost soul out there who’ll exchange corporate slavery for a bell around their neck and little hands tugging at their clothes for attention.");
	output("\n\nA hard and simple life, is what you’ve found out here. But a good one.");

	clearMenu();
	badEnd("THE END");
}
//[LavLev Bad End]
public function breedwellPremiumBadEndLavLev():void
{
	clearOutput();	
	showBust("");
	showName("\nLAVLEV");
	author("Nonesuch");	
	
	output("Maybe being a business rahn’s toy is more alluring, less frightening to you than being a lab rat. Maybe you crave the discipline, thirst the domineering firmness those do’rahn showed you. Maybe you don’t have a choice. The memory of that <i>smell</i>, those pheromones drifting into your nostrils and make you weak and pliant and obedient, fills your mind, and in a daze you find yourself begging the vildarii to send you to Lavender Leverage.");
	output("\n\n<i>“Really?”</i> they reply, registering polite surprise. <i>“They must have left quite the impression upon you, Steele. I won’t pretend to not be disappointed: you would have been a fine acquisition for Tamani. But: they made a very reasonable offer, and as said, your happiness is tantamount.”</i> ");
	output("\n\nA flute glass of champagne is placed in front of you, and the red androgyne raises theirs to you.");
	output("\n\n<i>“Here’s to your future, Steele. And ours.”</i>");
	output("\n\nYou take a polite sip of the fizz, and instantly feel drowsy...");
	
	processTime(10);
	clearMenu();
	addButton(0, "Next", breedwellPremiumBadEndLavLevNext);
}
//[LavLev Bad End]
public function breedwellPremiumBadEndLavLevNext():void
{
	clearOutput();	
	showBust("BREEDWELL_DOHRAHN_BUSINESS");
	showName("\nLAVLEV");
	author("Nonesuch");	
	
	output("You awake in a cramped, dark space, your [pc.knees] wedged up against your [pc.chest]. A few grunting movements inform you that you are naked aside from red ribbon that firmly ties your wrists");
	if (!pc.isNaga()) output(" and your ankles");
	output(" together, is looped around your [pc.chest], and wrapped between your teeth, gagging you.");
	output("\n\nYou feel like you’re being moved around, the sides of your vessel leaning this way and that. Your stomach flutters as your unseen voyage comes to an end with a hard thump beneath your [pc.ass].");
	output("\n\n<i>“You Ms. Fahl-Zeen? Parcel for you. Sign here.”</i>");
	output("\n\nThere’s the snip of a scissor, the ceiling above you bends away, and blinding light pours in.");
	output("\n\n<i>“Oh my,”</i> coos your purple rahn performance reviewer, tipping her holo-glasses to peer in at you. <i>“It’s what I always wanted.”</i>");
	
	processTime(1200);
	clearMenu();
	addButton(0, "Next", breedwellPremiumBadEndLavLevNext2);
}
//[LavLev Bad End]
public function breedwellPremiumBadEndLavLevNext2():void
{
	clearOutput();	
	showBust("BREEDWELL_DOHRAHN_BUSINESS");
	showName("\nLAVLEV");
	author("Nonesuch");	
	
	output("You are put to work in your new, permanent role as office relaxer immediately. Whilst you belong to Mistress Fahl-Zeen, it is her wish that you get plenty of experience aiding the entire enterprise of Lavender Leverage, at least to begin with. Every day is a blur of mundane office work, deep sucking smooth, juicy ovipositor under desks and other, more exotic tasks. Each executive has their own particular needs and desires, whether it’s watching you make out with one of the company’s VI androids, getting paddled over the desk after a deal falls through, or simply acting as an impromptu therapist in this fractious, highly-charged environment. You learn to be adaptable and flexible, in mind and body.");
	output("\n\nThe pheromones help with that. You have to guess that the most elevated of LavLev’s employees are all on some sort of supplement or gene-mod which turbocharges the do’rahn’s natural ability to produce pheromones that arouse and subdue others, just one way this utterly ruthless corporation goes about its business. Knowing it doesn’t stop it affecting you; you feel peaceful, soft and incredibly horny around your rahn superiors, sweetness filling your head and [pc.femcum] moistening your panties. After a few days of ceaseless exposure, when they order you to do something it’s like somebody is yanking a ring through your nose, and it’s a pleasure, a deep, profound pleasure, to follow it.");
	output("\n\nFahl-Zeen spends plenty of time with you though, more as you become accustomed to being her squeeze ball. You quickly find out that beyond a panel in her immaculate, penthouse office there is a door to a windowless, matt-black dungeon, filled with all sorts of interesting ways of inflicting pain and torment. It is her pleasure to spend her evenings in there reviewing your performances, tying you to the ceiling or putting you into a gimp suit, describing all the ways you didn’t complete a task in time, didn’t quite please a colleague fully, or just plain fucked up whilst applying the riding crop, the electric current, the clamps, the vibrator to your helpless body. The room is thoroughly soundproofed, and the pear-shaped rahn who never raises her voice encourages you to scream and beg for mercy, because doing so gets her wet.");
	output("\n\nYou come to accept and love it, crave the discipline, delight in Mistress’s sadism, beg her to whip your bare [pc.ass] for some minor miscalculation, lick her high-heels afterwards in worshipful thank you. It’s not enough for Fahl-Zeen that you be broken, turned into her servile pain-pet, though. She wants a quick mind too, an assistant who understands the labyrinthine financial trickery of LavLev and helps run it with gusto. All of her training is aimed at that, and once your mind is broken it is slowly built back into a form she desires.");
	output("\n\nOnce you see how the do’rahn’s ice-cold diabolism runs through everything she does, from the boardroom to the bedroom, you fall helplessly in love with it, and set about making her fantastically richer at the expense of many others. Void, being the willing instrument and accomplice of a completely evil bitch... It makes you feel dirty. It makes you desire a long, purifying session in the dungeon, begging for mercy that you neither deserve nor receive. On and on it goes, eroding away everything you once knew like sugar-laced acid.");

	clearMenu();
	addButton(0, "Next", breedwellPremiumBadEndLavLevNext3);
}
//[LavLev Bad End]
public function breedwellPremiumBadEndLavLevNext3():void
{
	clearOutput();	
	showBust("BREEDWELL_DOHRAHN_BUSINESS");
	showName("\nLAVLEV");
	author("Nonesuch");	
	
	output("It’s a morning like any other, many years later. Fahl-Zeen has long since earned the money necessary to purchase a penthouse suite in one of the more absurdly expensive floating condominiums on the lush leisure world of Quorido IV, and she is currently engaged in fucking in one of her favorite positions: you face and [pc.chest] pushed against the glass of the window, soft thighs slapping against your [pc.ass], ovipositor deep in your bowels.");
	output("\n\n<i>“Isn’t it a great view?”</i> she groans, the soft lusciousness of her tits pressing against your back as she delivers one firm thrust after another past your [pc.anus]. You are privileged to not have the gimp mask on today so you can agree that yes, the aerial, sun-kissed view of the miles of beach, parks and pleasure palaces is certainly something. <i>“Isn’t it great to take it in whilst...uff... I screw piggy’s tight little ass...”</i>");
	output("\n\nShe subsides into hot, hard exhalations, warming your neck as she pounds herself to orgasm. You sigh with delight, shivering as you feel another steaming helping of Mistress’s eggs fill your back passage. You never get tired of that sensation. Which is good, because when she withdraws her long, tubular egg-cock with a gratified sigh, she squeezes your buttplug back in and zips that part of your latex suit back up, ensuring the warm, gloopy, full feeling will be with you for as long as she deems fit. You’re in the voice-activated tactile suit today, one of your favorites. At a single word from Mistress, it can fill [pc.eachVagina] with succulent vibration, pinch your [pc.nipples] sharply, tickle you into a screaming, thrashing mess... the only limitation is the owner’s imagination, and Fahl-Zeen imagination is a bottomless pit.");
	output("\n\n<i>“Good,”</i> she says, as if she’s just finalised an important transaction, crisply checking her frondular hair and glasses, and striding over to the desk. <i>“I’m going to send you the first item for today. We’ve identified weaknesses in this company’s recent activities. You are to lay out an initial plan for its leveraged buyout.”</i>");
	output("\n\nYou swiftly head over to your own holo lap device on the bed, delighting at the swirl of egg-cum in your bowels with every step. You click open Mistress’s forwarded email, and pause for a long moment when the Steele Tech logo fills the screen.");
	output("\n\n<i>“Problem?”</i> the do’rahn says, peering at you expressionlessly over her glasses.");
	output("\n\n<i>“No... Mistress.”</i> You sigh, closing your eyes for a moment. <i>“Could I... may I have the vibes as I do it?”</i>");
	output("\n\n<i>“Of course.”</i> She fires off one of her brief, bright smiles, sunbeam glancing off ice. <i>“I know how piggy likes being teased as [pc.he] works.”</i>");
	output("\n\nThe suit buzzes over [pc.eachVagina], invisible fingers flicking at [pc.eachClit] and reaching deep into your tender insides, and you bite your [pc.lips] in delight as you begin the process of destroying your father’s company for the glory of your Mistress.");
	
	clearMenu();
	badEnd("THE END");
}
//checks for booty call availability for the square this is called from, loc is planet
public function breedwellPremiumBootyCallCheck(loc:String = "",bcScene:int=0):Boolean
{
	if (!pc.hasVagina()) return false;
	if (!breedwellPremiumUnderContract()) return false;
	
	var timeframe:int = 30 * 60; //30 hours
	
	switch(loc)
	{
		case "tavros station":
			if (bcScene == 2)
			{
				if ((flags["BREEDWELL_PREM_BC_TAVROS_LAVLEV"] == undefined || GetGameTimestamp() - timeframe >= flags["BREEDWELL_PREM_BC_TAVROS_LAVLEV"]) && flags["BREEDWELL_PREM_BADEND_LAVLEV"] != undefined) return true;
			}
			else if (bcScene == 1)
			{
				if (flags["BREEDWELL_PREM_BC_TAVROS_AUSAR"] == undefined || GetGameTimestamp() - timeframe >= flags["BREEDWELL_PREM_BC_TAVROS_AUSAR"]) return true;
			}
			else
			{
				if (flags["BREEDWELL_PREM_BC_TAVROS_COUPLE"] == undefined || GetGameTimestamp() - timeframe >= flags["BREEDWELL_PREM_BC_TAVROS_COUPLE"]) return true;
			}
			break;
		case "mhen'ga":
			if (bcScene == 1)
			{
				if ((flags["BREEDWELL_PREM_BC_MHENGA_FLAHNE"] == undefined || GetGameTimestamp() - timeframe >= flags["BREEDWELL_PREM_BC_MHENGA_FLAHNE"]) && flags["FLAHNE_LIKE_OVIPOSITOR"] > 0 && rand(4) == 0) return true;
			}
			else
			{
				if (flags["BREEDWELL_PREM_BC_MHENGA_FUURAHN"] == undefined || GetGameTimestamp() - timeframe >= flags["BREEDWELL_PREM_BC_MHENGA_FUURAHN"]) return true;
			}
			break;	
		case "myrellion":
			if (flags["BREEDWELL_PREM_BC_MYRELLION"] == undefined || GetGameTimestamp() - timeframe >= flags["BREEDWELL_PREM_BC_MYRELLION"]) return true;
			break;	
		case "tarkus":
			if (bcScene == 1)
			{
				if (flags["BREEDWELL_PREM_BC_TARKUS_MERCS"] == undefined || GetGameTimestamp() - timeframe >= flags["BREEDWELL_PREM_BC_TARKUS_MERCS"]) return true;
			}
			else
			{
				//if in coastal squares
				if (InCollection(currentLocation, ["226","227","228","229","230","231","232","233","234"]))
				{
					if ((flags["BREEDWELL_PREM_BC_TARKUS_STACEY"] == undefined || GetGameTimestamp() - timeframe >= flags["BREEDWELL_PREM_BC_TARKUS_STACEY"]) && pc.hasKeyItem("Arbetz Travel Agency Membership") && arbetzActiveHours()) return true;
				}				
			}
			break;	
		case "uveto station":
		case "uveto vii":
		case "uveto":
			if (flags["BREEDWELL_PREM_BC_UVETO"] == undefined || GetGameTimestamp() - timeframe >= flags["BREEDWELL_PREM_BC_UVETO"])
			{
				if (hours >= 8 && hours <= 17) return true;
			}
			break;
		case "zheng shi":	
		case "zheng shi station":
			if (flags["BREEDWELL_PREM_BC_ZHENGSHI"] == undefined || GetGameTimestamp() - timeframe >= flags["BREEDWELL_PREM_BC_ZHENGSHI"]) return true;
			break;	
		default:
			// no content for location specified
			break;
	}
	
	return false;
}
//give player message about getting pinged and option to respond
public function breedwellPremiumBootyCallPing(bcScene:int=0):Boolean
{
	clearOutput();	
	showBust("");
	showName("PREMIUM\nBREEDER");
	author("Nonesuch");	
	
	var loc:String = getPlanetName().toLowerCase();
	
	output("<b>Your codex vibrates. The screen turns red and displays the same heart-shaped sperm that’s emblazoned on your face.</b>");
	output("\n\n<i>Premium Breeder,</i> says the codex in Tamani’s excited, girly tones, <i>a nearby rahn subscriber is requesting your company! The coordinates are loaded. Go get ‘em, eager breeder!</i>");
	
	processTime(1);
	clearMenu();
	
	switch(loc)
	{
		case "tavros station":
			if (bcScene == 1)
			{
				flags["BREEDWELL_PREM_BC_TAVROS_AUSAR"] = GetGameTimestamp();
				addButton(0, "Respond", breedwellPremiumBootyCallsTavrosAusar);
			}
			else if (bcScene == 2)
			{
				flags["BREEDWELL_PREM_BC_TAVROS_LAVLEV"] = GetGameTimestamp();
				addButton(0, "Respond", breedwellPremiumBootyCallsTavrosDomme);
			}
			else
			{
				flags["BREEDWELL_PREM_BC_TAVROS_COUPLE"] = GetGameTimestamp();
				addButton(0, "Respond", breedwellPremiumBootyCallsTavrosCouple);
			}
			break;
		case "mhen'ga":
			if (bcScene == 1)
			{
				flags["BREEDWELL_PREM_BC_MHENGA_FLAHNE"] = GetGameTimestamp();
				addButton(0, "Respond", breedwellPremiumBootyCallsFlahne);
			}
			else
			{
				flags["BREEDWELL_PREM_BC_MHENGA_FUURAHN"] = GetGameTimestamp();
				addButton(0, "Respond", breedwellPremiumBootyCallsPheromonalFuurahn);
			}
			break;	
		case "tarkus":
			if (bcScene == 1)
			{
				flags["BREEDWELL_PREM_BC_TARKUS_MERCS"] = GetGameTimestamp();
				addButton(0, "Respond", breedwellPremiumBootyCallsTarkusMercs);
			}
			else
			{
				flags["BREEDWELL_PREM_BC_TARKUS_STACEY"] = GetGameTimestamp();
				addButton(0, "Respond", breedwellPremiumBootyCallsTarkusStacey);
			}
			break;	
		case "myrellion":
			flags["BREEDWELL_PREM_BC_MYRELLION"] = GetGameTimestamp();
			addButton(0, "Respond", breedwellPremiumBootyCallsMyrellionQuickie);
			break;	
		case "uveto station":
		case "uveto vii":
			flags["BREEDWELL_PREM_BC_UVETO"] = GetGameTimestamp();
			addButton(0, "Respond", breedwellPremiumBootyCallsUvetanExplorer);
			break;	
		case "new texas":
			break;		
		case "zheng shi station":
			flags["BREEDWELL_PREM_BC_ZHENGSHI"] = GetGameTimestamp();
			addButton(0, "Respond", breedwellPremiumBootyCallsZhengShiTwofer);
			addButton(1, "Don’t", mainGameMenu);
			return true;
			break;	
		default:
			// no content for location specified
			break;
	}
	
	addButton(1, "Don’t", mainGameMenu);
	return false;
}