/* Aina: Add preg stuff by Gardeford*/

/**
	 * ...
	 * @author DrunkZombie
	 */
/*

New Flags:
	AINA_TOTAL_KIDS //number of kids you and aina have together
	AINA_PREG_TIMER //days aina has been pregnant
	AINA_NUM_BABIES //number of babies in current pregnancy (currently always 1)
	AINA_BABY_GENDERS //array used to track genders of current pregnancy
	AINA_PREG_EMAIL1 //undefined or 0 = unsent, 1 = sent
	AINA_PREG_EMAIL2 //undefined or 0 = unsent, 1 = sent
	AINA_PREG_EMAIL3 //undefined or 0 = unsent, 1 = sent
	AINA_PREG_EMAIL4 //undefined or 0 = unsent, 1 = sent
	AINA_PREG_EMAIL5 //undefined or 0 = unsent, 1 = sent
	AINA_PREG_EMAIL6 //undefined or 0 = unsent, 1 = sent
	AINA_MEETUP //Met with Aina after email #1: undefined or 0 = never sent, 1 = need to meet, 2 = have meet
	AINA_COMFORT //undefined or 0 = locked, 1 = unlocked, 2 = comfort scene 1 done at least once
	AINA_PREGHEATFUCK //times you fucked her while she was pregnant and in heat
	AINA_DEADBEATPC //undefined or 0 = no secret kids, 1+ = kids the pc doesn't know about
	AINA_BIRTHSCENE timestamp to set expiration of showing birth scenes
	AINA_NURSERY timestamp to keep AINA in nursery instead of apartment
	AINA_DIRTY undef/0 = no, 1 = yes aina dirty after sex
	AINA_LACTATING undef/0 = no, 1 = yes aina lactates from late preggers or kid <=12 mo
	AINA_AT_BIRTH undef/0 = no, 1 = yes pc was present at last birth

*/
import classes.GameData.Pregnancy.Child;
import classes.GameData.Pregnancy.Templates.AinaUniqueChild;
import classes.GameData.Pregnancy.UniqueChild;
import classes.GameData.Pregnancy.Containers.Genders;

//show nude and/or preg aina
public function showPregAina(nude:Boolean = false,preg:Boolean = false):void
{
	//NOTE: preg currently set to always false until preg bust are in the game, remove next line of code when they are implemented
	preg = false;
	//
	//passed in preg parameter is just to toggle the check to display or not
	if (preg)
	{
		//set false if not actually showing
		if (!ainaBellyShowing()) preg = false;
	}
	showName("\nAINA");
	if (nude && preg) showBust("AINA_PREG_NUDE");
	else if (nude && !preg) showBust("AINA_NUDE");
	else if (!nude && preg) showBust("AINA_PREG");
	else showBust("AINA");
	author("Gardeford");
}

//This returns your preg score on a scale of 0-99999, or 0%-99.999%
public function ainaKnockupChance():int
{
	var vir:Number;
	var chance:Number = ainaCycle();
	var cumQ:Number = pc.cumQ();	
	
	if(pc.virility() == 0 || aina.fertility() == 0 || chance == 0) return 0;
	
	vir = (pc.virility() + aina.fertility());
	
	//increase base virility by cum volume up to a max of +4 (Aina has a big uterus but at a certain point the rest is just excess and will never get near the egg and is irrelevant for preg chance)
	//plus this keeps player virility more important than volume for large preg change increases
	if (cumQ >= 4000) vir += 4;
	else if (cumQ > 0) vir += cumQ/1000
	
	vir = vir / 2;
	
	return (1 - Math.exp(chance * vir)) * 10000;
}

//returns base preg chance variable based on her cycle
public function ainaCycle():Number {
	var day_met:int = flags["AINA_DAY_MET"];
	var chance:Number = 0;
	
	//Aina is in heat for 7 days, followed by 14 days she is not in heat, her full circle 21 days.
	//Subtracting the day she was met from the current day gives the time the player knew her in days.
	//A modulo operation with 21 gives the days of her new cycle -1 as a remainder. 
	var days_in_new_cycle:int = Math.round((days - day_met) % 21);
	
	//0 to 6 = heat (50% base), 7-9 = post heat (10%), 10-16 (0%), 17-20 = pre-heat (10%) (Math.exp(-.693 * 1) is close to 50% and (Math.exp(-.105 * 1) is close to %10
	if (days_in_new_cycle <= 6) chance = -.693;
	if (days_in_new_cycle >= 7 && days_in_new_cycle <= 9) chance = -.105;
	if (days_in_new_cycle >= 10 && days_in_new_cycle <= 16) chance = 0;
	if (days_in_new_cycle >= 17) chance = -.105
	
	return chance;
}

//Return value of true if she gets impregnated, else false
public function tryKnockUpAina():Boolean
{
	var chance:Number;
	
	//If pc is infertile or aina is already preggo return false
	if(pc.virility() == 0 || flags["AINA_PREG_TIMER"] != undefined) return false;
	
	chance = ainaKnockupChance();
	
	//rand returns 0 to 9999, chance returns 0 to 9999, 0 chance will never result in pregnancy obviously
	if(rand(10000) < chance)
	{
		//succesful impregnation
		flags["AINA_PREG_TIMER"] = 0;
		flags["AINA_NUM_BABIES"] = 1;
		//only 1 baby at a time currently but set up as array in case that changes
		flags["AINA_BABY_GENDERS"] = new Array();
		//first kid is Nina
		if (flags["AINA_TOTAL_KIDS"] == undefined) flags["AINA_BABY_GENDERS"].push("F");
		else{
			//Lets roll for genders 50/50
			for(var i:int = 0; i < flags["AINA_NUM_BABIES"]; i++)
			{
				if(rand(2) == 0) flags["AINA_BABY_GENDERS"].push("M");
				else flags["AINA_BABY_GENDERS"].push("F");
			}
		}
		pc.clearRut();
		
		return true;
	}
	else return false;
}
public function processAinaPregEvents(deltaT:uint, doOut:Boolean, totalDays:uint):void
{
	if(flags["AINA_PREG_TIMER"] != undefined) flags["AINA_PREG_TIMER"] += totalDays;
	
	var timestamp:int = GetGameTimestamp() + deltaT;
	
	//aina Preg email stuff
	//6 repeatable emails each kid
	if(aina.isPregnant())
	{
		//first email will occur randomly the first 3 days after she gets pregnant
		if(flags["AINA_PREG_EMAIL1"] == undefined && flags["AINA_PREG_TIMER"] > rand(3))
		{
			if (ainaKids() > 0) resendMail("aina_preg1_again", timestamp);
			else
			{
				resendMail("aina_preg1", timestamp);
				flags["AINA_MEETUP"] = 1;
			}
			flags["AINA_PREG_EMAIL1"] = 1;			
			flags["AINA_AT_BIRTH"] = undefined;
			
		}
		if(flags["AINA_PREG_EMAIL2"] == undefined && flags["AINA_PREG_TIMER"] >= 15)
		{
			timestamp = (GetGameTimestamp() + deltaT - (flags["AINA_PREG_TIMER"] * 24 * 60) + (15 * 24 * 60));
			if (flags["AINA_MEETUP"] > 1) resendMail("aina_preg2", timestamp); //only send further emails if pc meets aina, otherwise just progress things behind the scenes
			flags["AINA_PREG_EMAIL2"] = 1;
		}
		if(flags["AINA_PREG_EMAIL3"] == undefined && flags["AINA_PREG_TIMER"] >= 30)
		{
			timestamp = (GetGameTimestamp() + deltaT - (flags["AINA_PREG_TIMER"] * 24 * 60) + (30 * 24 * 60));
			if (flags["AINA_MEETUP"] > 1) resendMail("aina_preg3", timestamp);
			flags["AINA_PREG_EMAIL3"] = 1;
			if (ainaKids() == 0) flags["AINA_COMFORT"] = 1; //this is only set to 1 the first time, it stays set after that
		}
		if(flags["AINA_PREG_EMAIL4"] == undefined && flags["AINA_PREG_TIMER"] >= 45)
		{
			timestamp = (GetGameTimestamp() + deltaT - (flags["AINA_PREG_TIMER"] * 24 * 60) + (45 * 24 * 60));
			if (flags["AINA_MEETUP"] > 1) resendMail("aina_preg4", timestamp);
			flags["AINA_PREG_EMAIL4"] = 1;
		}
		if(flags["AINA_PREG_EMAIL5"] == undefined && flags["AINA_PREG_TIMER"] >= 60)
		{
			timestamp = (GetGameTimestamp() + deltaT - (flags["AINA_PREG_TIMER"] * 24 * 60) + (60 * 24 * 60));
			if (flags["AINA_MEETUP"] > 1) resendMail("aina_preg5", timestamp);
			flags["AINA_PREG_EMAIL5"] = 1;
		}
		//check lactaction settings
		ainaSetLactation();
		if(flags["AINA_PREG_EMAIL6"] == undefined && flags["AINA_PREG_TIMER"] >= 75)
		{
			timestamp = (GetGameTimestamp() + deltaT - (flags["AINA_PREG_TIMER"] * 24 * 60) + (75 * 24 * 60));
			//only send email here for first kid. otherwise email is sent after the day pc has chance to be at the birth in aina's apartment (done in ainaBirthScene())
			if (flags["AINA_MEETUP"] > 1 && ainaKids() < 1) resendMail("aina_preg6", timestamp);
			flags["AINA_PREG_EMAIL6"] = 1;
			if (flags["AINA_MEETUP"] > 1) ainaBirth(timestamp);
			else ainaDeadBeatPC();
		}

	}
	//this is just to get the email #6 sent if the player misses the 24 hour window in her apartment
	ainaBirthScene();
}
//emails
public function ainaPregEmail1():String
{
	var eText:String = "";
	if (ainaKids() > 0)
	{
		eText+="Hey! I’m gonna have another baby. At this point I’m pretty sure you’re ok with it, so I’m gonna send you all the status updates :). I hope it’s another girl, but a boy might be fun too. I don’t know which one I want more!";	
	}
	else
	{		
		eText+="Hey [pc.name], There’s something I really need to talk with you about. If you could meet me at my place as soon as you can it’d be really cool. It won’t take long, I promise.";	
		eText+="\n\nSincerely, Aina";
	}
	
	return doParse(eText);
}
public function ainaPregEmail2():String
{
	var eText:String = "";
	eText+="Hey [pc.name]! Thought you’d want to know I’ve started showing. It’s not much right now but it’s just enough to be noticeable. Oh god, am I gonna have to stop eating junk food now? I didn’t even think about that :(";	
	eText+="\n\n(A picture is included, with Aina’s midsection appearing slightly larger than the last time you saw her.)";
	
	return doParse(eText);
}
public function ainaPregEmail3():String
{
	var eText:String = "";
	eText+="Agh, at this point I think I should be able to tell between pregnancy and just extra weight, but I just feel like a tubby horse :( You should come visit some time, maybe we can watch a movie or something and take my mind off it ;)";	
	eText+="\n\n(A picture is included, Aina’s belly is noticeably larger than the last picture)";
	
	return doParse(eText);
}
public function ainaPregEmail4():String
{
	var eText:String = "";
	eText+="Baby started kicking at 3 am and decided it was wake up time for mom :( on the upside my boobs are getting bigger :D no milk yet but it should be coming soon.";	
	if (flags["AINA_TOTAL_KIDS"] == undefined) eText+=" I still can’t believe it sometimes, soon I’ll be a parent.";
	
	return doParse(eText);
}
public function ainaPregEmail5():String
{
	var eText:String = "";
	eText+="I was talking about the milk last time. Now it won’t stop coming. I woke up and the bed was soaking wet! Everything’s sensitive too, and not in the good way :( Well sometimes in the good way too, but that’s beside the point. I feel like the baby will come soon.";	
	
	return doParse(eText);
}
public function ainaPregEmail6():String
{
	var eText:String = "";
	if (flags["AINA_TOTAL_KIDS"] == undefined) eText+="It happened so fast! One second I was thinking about this paper I have to write and the next my water broke. I managed to make it up to that nursery you mentioned, and this nice robot nursemaid helped me deliver. You should come up quick if you’re nearby, I’m sure you’ll want to see!";	
	else eText+="Our newest child is resting comfortably in the nursery. You should come up if you’re nearby, I’m sure you’ll want to see!";	
	
	return doParse(eText);
}
public function ainaPregMeetUpCheck():Boolean
{
	if (flags["AINA_MEETUP"] == undefined) return false;
	if (flags["AINA_MEETUP"] == 1) return true;
	
	return false;
}

public function ainaPregMeetUp():void
{
	clearOutput();
	showPregAina(false, false);
	
	//set flag to have meet about pregnancies
	flags["AINA_MEETUP"] = 2;
	
	output("Aina trots over when she sees you enter, looking a little haggard. Her normally bound hair is hanging free and unkempt, with a few strands poking out haphazardly. The lace ribbon that normally holds it up is intertwined in her fingers, and she fidgets with the soft fabric as she approaches you.");
	output("\n\n<i>“I-I’m glad you came. A-actually that’s what I needed to talk with you about. I’m not gonna beat around the bush, I’m p-pregnant. You’re the only person I’ve ever had sex with, so that means you’re the dad. I won’t ask you to marry me or anything archaic like that, but I’m keeping the baby and I thought you’d want to know,”</i> she gushes, growing red-faced and flustered as she speaks.");
	
	output("\n\nThe impulsive centaur girl trots in place as you approach her, unable to look at you in her embarrassment. Before things can grow too awkward you");	
	if (pc.isNice()) output(" throw your arms around her");
	else output(" conk her gently on the head");	
	output(", eliciting a surprised yelp and a confused look.");	
	
	output("\n\n<i>“Of course I’d want to know, ");
	if (pc.isAss()) output(" stupid");
	else output(" silly");
	output("”</i>, you whisper as she melts into your embrace. When you pull back, taking her hands in yours, you find her holding back tears with the help of a giant grin. Her pale hands are shaking as she finally meets your gaze, eyes full of joyous tears that won’t quite fall.");
	
	output("\n\n<i>“If you have trouble taking care of the baby, don’t be afraid to let the nursery up top take care of things. Even if it’s just dropping the kid off for daycare while you do schoolwork. My dad left the place specifically for this kind of thing; it’s got teachers and everything,”</i> You explain, wanting to make sure the soon-to-be new mom is as prepared as she can be.");
	output("\n\n<i>“O-ok. I was prepared to drop out, but that sounds a lot better. Not to mention that seems like it wouldn’t give my parents an even bigger heart attack. I’m sure I’ll be able to do most of the work, but having that nursery should be really helpful. You don’t know how happy I am that you had a plan for this kind of thing, cause I was really just winging it and had no real idea what I was gonna do,”</i> Aina admits, wiping her blurry eyes on the sleeve of her sweater.");
	output("\n\n<i>“Now come on, let’s get you showered up and feeling better. I could use a wash anyway,”</i> You beckon, pulling the tired college student toward her shower.");

	processTime(5);
	
	clearMenu();
	addButton(0,"Next",ainaPregShower,undefined);
}

public function ainaPregShower():void
{
	clearOutput();
	showPregAina(true, true);
	
	output("The two of you step into her spacious shower, turning the settings to warm and letting the clear water cascade over you. Aina grabs a bottle of sapphire blue body wash and squirts a large glob into her palm. Sparkling liquid drips from her hand and circles the drain, blossoming into suds. The centaur college student scrubs the wash over your body, leaving you coated in a thin layer of azure bubbles. She lets out a giggle as you drape your arms over her tauric hindquarters, brushing the cleansing soap into her hair.");
	
	output("\n\nThe shower pauses as you lather up, resuming when the two of your are fully covered in blue bubbles. Water resumes flowing, shearing the cobalt coat and leaving you sparkling clean. You give one of her breasts a playful squeeze as she dries her face with a towel, and she jumps in place, but laughs when she brings the towel down, tossing it at you. You dry yourself with a separate towel");
	if (pc.isTaur()) output(" before joining her in a section that");
	else output(" while she enters a section that");
	output(" cleans the tauric portions of the body.");	
	
	output("\n\nAina grins as she re-dresses, her hair back to its normal ponytail. You feel as refreshed as she looks, ready to face the universe again.");
	
	processTime(15 + rand(15));	
	pc.changeLust(25 + rand(10));
	pc.shower();
	flags["AINA_DIRTY"] = 0;
	
	clearMenu();
	addButton(0,"Next",ainaMenu,undefined);
}
//intro text if shower with aina is chosen from her menu
public function ainaDirtyShowerIntro():void
{
	clearOutput();
	showPregAina(false, true);
	
	output("You ask Aina if she’d like to join you in the shower.");
	output("\n\n<i>“Sure! I need to clean up anyway,”</i> she replies, quickly trotting ahead of you to reach her shower.");

	clearMenu();
	addButton(0,"Next",ainaPregShower,undefined);
}
//make aina dirty from sex
public function ainaMakeDirty():void
{
	flags["AINA_DIRTY"] = 1;
}
//check if aina is dirty
public function ainaIsDirty():Boolean
{
	if (flags["AINA_DIRTY"] == 1) return true;	
	return false;
}
//get num kids
public function ainaKids():int
{
	if (flags["AINA_TOTAL_KIDS"] == undefined) return 0;
	
	return flags["AINA_TOTAL_KIDS"];
}
//check if aina belly showing
public function ainaBellyShowing():Boolean
{
	if (flags["AINA_PREG_TIMER"] != undefined && flags["AINA_PREG_TIMER"] >= 30) return true;

	return false;
}

//watch movie together
public function ainaPregComfort1():void
{
	clearOutput();
	showPregAina(false, true);
	
	output("<i>“How about we snuggle up on the couch and watch a movie?");
	if (ainaKids() >= 2) output(" The kids can join in too if they want,");
	else if (ainaKids() == 1) output(" Nina can join in too if she wants,");
	output("”</i> you suggest, bringing a smile to the");
	if (flags["AINA_PREG_EMAIL1"] == 1) output(" pregnant");
	output(" centaur’s face.");
	
	output("\n\n<i>“That would be awesome. A movie’s just what I need right now,”</i> she says, taking your hand as you walk over to a large couch in front of the tv. She plops down, lying back on the cushions and patting the spot in front of her");
	if (ainaBellyShowing()) output(" pregnant belly");
	output(".");
	
	if (pc.hasLegs()) output(" You take a seat");
	else output(" You snuggle up");
	output(" in front of her, watching contentedly as she starts up an action-filled childrens drama movie. You give her an incredulous glance.");
	
	output("\n\n<i>“What? This is my favorite movie, and");
	if (ainaKids() >= 2) output(" the kids love it too");
	else if (ainaKids() == 1) output(" Nina loves it too");
	else output(" I hope to make it the kids favorite as well.");
	output("”,</i> she says with a grin. You settle in, watching");
	if (ainaKids() >= 2) output(" as your kids dash to find places to sit before the movie starts.");
	else if (ainaKids() == 1) output(" as Nina dashes in to find a good place to sit before the movie starts.");
	else output(" the movie begin and settling in for the long haul.");
	if (flags["AINA_COMFORT"] > 1) output(" The movie is actually pretty entertaining, regardless of how many times you’ve seen it.");
	else output(" Despite your initial misgivings the movie is actually pretty entertaining.");
	
	if (ainaKids() >= 1)
	{
		output("\n\nYou watch the movie through to the end, cozily tucked between your lover and");
		if (ainaKids() >= 2) output(" your children. You jokingly cover Aina’s eyes during an exaggerated scare scene, prompting a stream of laughter from the kids.");
		else output(" Nina. You jokingly cover Aina’s eyes during an exaggerated scare scene, prompting a round of giggles from your daughter.");
		output(" After the movie, you usher");
		if (ainaKids() >= 2) output(" the kids");
		else output(" Nina");
		output(" into the kitchen for ice cream. Aina holds you back for a moment, and you help her get to her feet.");
	}
	else
	{
		if (ainaBellyShowing())
		{
			output("\n\nYou watch the movie through to the end, staying cozily tucked up against your lover’s belly. At one point the baby kicks, distracting you from the explosions and excitement for a moment. Aina giggles as you brush your hand over the soft hair on her equine half. Before you know it the movie is over, leaving you to stretch and assist the pregnant centaur in standing up.");
		}
		else
		{
			output("\n\nYou watch the movie through to the end, staying cozily tucked up against your lover. Aina giggles as you brush your hand over the soft hair on her equine half. Before you know it the movie is over, leaving you to stretch and assist the centaur in standing up.");
		}
	}
		
	output("\n\n<i>“Thanks for this,”</i> she says, pulling you into a long, sensual kiss. When she pulls back her eyes are full of the same heated gleam that started this whole situation.");
	output("\n\n<i>“Maybe if you come back later we can do something a little more fun,”</i> she gives you a wink, making sure you get a good view of her backside on the way into the kitchen");
	if (ainaKids() < 1) output(" to get ice cream");	
	output(". The ice cream is delicious, and gone before you know it. You give");
	if (ainaKids() >= 2) output(" everyone in the room");
	else if (ainaKids() == 1) output(" Nina and Aina");
	else output(" Aina");
	output(" a goodby kiss before heading back to Tavros proper.");
	
	flags["AINA_COMFORT"] = 2;
	
	processTime(100);	
	pc.changeLust(20);
	
	clearMenu();
	addButton(0,"Next",mainGameMenu,undefined);
}

//have breakfast together
public function ainaPregComfort2():void
{
	clearOutput();
	showPregAina(false, true);
	
	if (pc.isNice()) output("<i>“Hey there, beautiful.");
	else output("<i>“Hey there.");
	output(" I thought you could use some company for breakfast,”</i> you say as you take a place next to her at the counter.");
	
	output("\n\n<i>“That would be awesome.");
	if (ainaKids() >= 2) output(" The kids are still sleeping, so I usually use this time for school stuff,");
	else if (ainaKids() == 1) output(" Nina is still sleeping, so I usually use this time for school stuff,");	
	output("”</i> She responds, pouring an extra bowl of");
	if (silly) output(" Semen-O’s");
	else output(" cereal");	
	output(" for you. The two of you eat in peace, sharing in the luxury of a quiet moment. You’re");
	if (pc.hasFeet() && pc.isTaur()) output(" almost knocked off your feet");
	else output(" surprised momentarily");	
	output(" when the tauric woman leans against you, sighing contentedly. Her hair smells like fresh berries, the product of good grooming and excellent shampoo.");
	
	output("\n\n<i>“Thanks for this. I know you’re busy with adventuring stuff,”</i> she says. You pause in eating, leaning over to give her a quick peck on the ear.");
	output("\n\n<i>“I can always make time to stop by. A relaxing breakfast beats getting shot at any day, and getting to see you makes it even better,”</i> you say. Your tauric partner beams as the two of you resume eating. When you finish, Aina pushes the dishes over to her sink before pulling you into a kiss. The fruity taste of her cereal lingers on her tongue.");
	
	if (ainaKids() >= 2) output("\n\n<i>“You should get going before the kids wake up. I’ve gotta drop them off at daycare in less than an hour,”</i> she says.");
	else if (ainaKids() == 1) output("\n\n<i>“You should get going before Nina wakes up. I’ve gotta drop her off at daycare in less than an hour,”</i> she says.");
	
	output("\n\n");
	if (ainaKids() >= 2) output("<i>“Maybe I’ll visit them later, check in with Bridget and all that,”</i> you reply with a smile. ");
	else if (ainaKids() == 1) output("<i>“Maybe I’ll visit her later, check in with Bridget and all that,”</i> you reply with a smile. ");	
	output("You gather your wits, giving Aina one last peck on the lips before heading out to face the universe.");
	
	processTime(20 + rand(10));	
	eatHomeCooking(30);
	pc.changeLust(10);
	
	clearMenu();
	addButton(0,"Next",mainGameMenu,undefined);
}
//enter Aina's bedroom
public function ainaPregComfort3():void
{
	clearOutput();
	showPregAina(true, true);
	
	output("You don’t see Aina around at first, but soon enough you hear a noise from her bedroom and head over to investigate. You lean on the doorframe when you arrive, waiting for her to see you before you enter. The tauric beauty is in the process of undressing for bed, giving you a fantastic view of her chest and human belly as she pulls her shirt over her head.");
	if (flags["AINA_LACTATING"] == 1) output(" Her full breasts bounce gently as she pulls her shirt over her head, contained by a cream colored maternity bra.");
	else output(" Her breasts bounce cutely as she tugs the shirt over her head, it looks like she went commando today.");
	output(" She sees you as the obstructing garment clears her head, looking surprised but doing nothing to cover herself.");
	
	output("\n\nHer surprise turns to a wide smile in moments, and she finishes undressing by unhitching the snaps on her skirt and pulling off the hair-tie on her tail. All the shed clothing falls into a conveniently placed hamper, ready to be taken away at her leisure.");
	output("\n\n<i>“Did you stop by to chat, or something more fun? I was just about to tuck in for the night,”</i> she says, tracing a finger up her stomach.");
	output("\n\n<i>“For now, I’d be fine with a good rest,”</i> you reply happily. Your tauric lover crawls up onto the bed and plops down on her side, opening her arms invitingly.");
	
	if (pc.isTaur())
	{		
		output("\n\nYou strip down to your [pc.underGarments], stepping around and up onto the bed behind Aina. Honey blonde curls tickle your nose as you snuggle up behind her. She pulls a large, warm comforter over the two of you, all the way up to your necks. You gently brush the chestnut hair below her human waist with one hand, basking in the cozy heat provided by the two of your bodies beneath the covers.");
	}
	else
	{		
		output("\n\nYou strip down to your [pc.underGarments], hoisting yourself onto the centaur sized bed. Aina hugs you around the back as you scoot in close, rubbing her nose with yours and staring into her tawny eyes. She pulls a large, warm comforter over the two of you, all the way up to your necks. You share in each-others cozy heat");
		if (pc.isNaga()) output(", wrapping your tail around her tauric half");
		else if (pc.hasLegs()) output(", brushing your legs against her warm tauric body");
		if (ainaBellyShowing()) output(", careful to avoid being too rough on her pregnant belly");
		output(".");
	}
	
	output("\n\nAina drifts off first. You can feel muscle slacken, her arms falling in a restful wreath around yours. A brief moment later, you feel a similar weight dragging at your eyes, and let yourself be drawn into a deep slumber beside your tauric lover. Your sleep is deep and uninterrupted, save for some uncatchable impressions of a field and");
	if (pc.isTaur()) output(" running.");
	else output(" riding.");
	
	
	output("\n\nYou sleep for what feels like a day, finding Aina up and dressed by the time you wake. She leans onto the bed in front of you and smiles wistfully.");
	output("\n\n<i>“You look extra " + pc.mf("handsome","beautiful") + " when you’re sleeping. I’m jealous,”</i> she says. You chuckle, rolling into a kneeling position and stretching. She admires you from the bed for a moment longer before standing and gathering the gear you’d discarded the night before. Once you’re dressed, you follow her into the living room, stopping just before the door.");
	
	output("\n\n<i>“Stay safe out there");
	if (silly) output(", space cowboy");	
	output("”,</i> she says, squeezing your hand one last time before letting you go. You give her one last short kiss");
	if (ainaBellyShowing()) output(", and a pat on the belly,");	
	output(" before heading back out to Tavros proper.");
	
	//Upate the last time Aina was met (has to bee done here since the standard menu path is skipped for this scene)
	flags["AINA_LAST_DAY_MET"] = days;
			
	genericSleep();
	pc.changeLust(20);
	
	clearMenu();
	addButton(0,"Next",mainGameMenu,undefined);
}

//pregnant heat scene
public function ainaPregHeatSex():void
{
	clearOutput();
	showPregAina(false, true);
	
	//find if pc has a cock that will currently fit in aina
	var kok:int = pc.cockThatFits(2000);
	
	output("When you walk through the door you’re immediately treated to the musky scent of Aina’s heat. She teeters behind the counter, eyeing you with a purely animal lust momentarily before coming back to her senses. Her needful gaze fills with purpose, no longer simple greed.");
	output("\n\n<i>“Hey [pc.name], Bridget is bringing Nina");
	if (ainaKids() > 1) output(" and the others");
	output(" over for a visit, and of course the universe picks now to send me into heat. I think the pregnancy makes it worse. I really don’t want to have to deal with this with them around, so could you do me a favor and help me ‘fix’ this problem? But if you’re gonna be here when they arrive I don’t want you completely covered in juices.”</i>");
		
	output("\n\nYou briefly consider mounting her anyway, but admit to yourself that it would be bad for");
	if (ainaKids() > 1) output(" the kids");
	else output(" Nina");
	output(" to walk in on you. Not that you’ll let your disappointment show too much. You can work plenty of magic with your fingers, especially on her heat sensitized pussy. She braces herself against the computer before you even touch her, clenching up when her swishing tail brushes against her exposed sex. The engorged organ is nearly as puffy as her pregnant belly, winking needfully in a call for something to fill it.");
	output("\n\nNot one to ignore a girl in need, you dip 3 fingers in right off the bat. Aina shudders, not even attempting to stifle a hearty moan as she cums from the penetration. She’s got it bad.");
	
	if (pc.hasCock() && pc.hasVagina()) output(" Your twin sexes twang in sympathy, sad over being left out.");
	else if (pc.hasCock())
	{
		output(" Your [pc.cocks] throb");
		if (pc.cockTotal() > 1) output("s");
		output(" sympathetically, sad over being left out.");		
	}
	else if (pc.hasVagina()) 
	{
		output(" Your [pc.pussys] twitch");
		if (pc.vaginaTotal() > 1) output("es");
		output(" in sympathy, sad over being left out.");		
	}
	output(" The wet heat of Aina’s cunt radiates in your arm, sucking your other finger and the thumb into her depths.");
	
	if (kok >= 0 && (pc.lust() >= 90 || pc.inRut()))
	{
		output("\n\nYou can’t resist the need any longer, impending visit be damned. With one hand on her sizeable equine ass, you pull your hand away with a wet pop. Before your");
		if (pc.inRut()) output(" rut");
		else output(" lust");		
		output(" crazed brain has you going all out to impregnate the delicious equine slit laid bare in front of you, some part of it remembers that you’ve already succeeded on that venture. This thought is far from enough to stop you, but a more gentle approach is needed.");
		
		output("\n\nHer winking hole is already drenched with enough natural lubricant to drown in, but enough is never enough. You dive in, mixing up her thick, musky love juice with your [pc.tongue]. An involuntary spasm runs through her thighs, and she backs up a little in an attempt to drive your tongue deeper inside. When you’re finally satisfied with her thorough soaking, you pull away for long enough to bite one of her prodigious flanks.");
		output("\n\n<i>“Ooooh. Hey, they’re gonna get here soon,”</i> she whinnies, looking back at you over her shoulder and stamping one of her hooves in an attempt to re-assert herself. You hardly hear her, wiping poignant slut-sap off your chin with one hand. You line up your [pc.cock " + kok + "] with her heat engorged cunt and use every ounce of self control you have to slip it in without mashing your hips");
		if (silly) output(" like a tidal wave against a small, defenseless beach town.");
		else output(" like a breeding stallion.");
		
		output("\n\n<i>“Wait. You weren’t supposed to... nnn... actually fuck me... oh god!”</i> Hot fire spreads in your mind as you painstakingly inch your way into Aina’s depths. With each orgasmic twitch of her insides your length is drawn further and further inside, only to be pushed back as she stiffens with each new sensation. You steady your hips just enough to deny the outward movement, giving one final slow push to");
		if (pc.cocks[kok].cLength() >= 12) output(" reach the deepest point of her cunt.");
		else output(" hilt yourself inside her.");
		
		output("\n\nYour breath comes in ragged bursts as you struggle to maintain a soft, rhythmic pattern of thrusting. The primary thing keeping your wild instinct at bay is the ceaseless string of incomprehensible moans issuing from your pregnant centaur slut. You can feel her swollen clit throb every time your movements bring it into contact with");
		if (pc.balls > 0) output(" your [pc.balls].");
		else if (pc.hasClit() > 0) output(" your [pc.clit].");
		else output(" the base of your [pc.cock " + kok + "].");
		
		output("\n\nAll four of Aina’s legs tremble with effort as she does her best to stay standing. A trickling stream of mixed pre and femcum soaks the hair of her hindquarters, all the way from haunch to hoof. She looks over her shoulder as your ecstasy reaches a climax, her eyes burning with ardor.");
		output("\n\n<i>“I can... Feel it coming. Your cock is getting even bigger inside me, just let it out inside. Nnn- like I’m getting pregnant all over again,”</i> she pants, the need evident in her stare as she grinds against you. Unable to resist the heated request, your pent-up lust culminates in a pleasurable jolt of energy that draws itself into your [pc.cock " + kok + "]. [pc.Cum]");
		if (pc.cumQ() >= 1000) output(" gushes");
		else output(" spurts");
		output(" into her needful slit. She gives a final braying moan as her legs give out, sliding to her knees and then gently out to rest on her front half, her butt and pregnant belly still scarce inches from the floor.");
		
		if (pc.cockTotal() > 1)
		{
			output("\n\n[pc.EachCock] throb in unison, and as the lucky one slides from her slit with a slick pop,");	
			if (pc.cockTotal() > 2) output(" two spurts of cum spatter onto");
			else output(" one spurt of cum spatters onto");
		}
		else output("\n\n[pc.EachCock] continues to throb even as it slides from her slit with a slick pop. The remainder of the torrent paints");		
		output(" her back as your [pc.cock " + kok + "] is left hanging in the open air. When the blissful energy fades you slump down to join her on the floor. The position gives you a perfect view of your potent seed dripping from the well-fucked centaur’s over-filled cunt.");
				
		output("\n\nEventually Aina recovers enough for you to carefully lead her to the shower, wobbling all the way. The doorbell rings just as she gets inside. So you forego the shower, in favor of a quick rinse in the sink, before greeting Bridget and");
		if (ainaKids() > 1) output(" the kids");
		else output(" Nina");		
		output(" at the door. Aina emerges from the shower a few minutes later, looking much cleaner and under control of her faculties. After making herself presentable, she hoists Nina into a hug and looks to you with a grin.");
		
		IncrementFlag("AINA_PREGHEATFUCK");
		processTime(20 + rand(15));
		ainaSexed(1);		
		aina.loadInCunt(pc, 0); //overridden function in Aina.as
		pc.orgasm();
		flags["AINA_DIRTY"] = 0;
	}
	else
	{
		output("\n\nYou’re forced to take a grip on her plush ass with your other hand to keep up the pace of your fisting thrusts. With each push inward, the tauric strength of her insides attempts to lock you in, sucking you up to the elbow regardless of your intentions. She shouts a wordless request for more with each withdrawal, but each shuddering orgasm she goes through grows further and further apart. Eventually you’re able to return to using just three fingers, leaving only the musky mare juice dripping down her thighs and your arm to remind you of the sudden heat. Just as the throes of orgasm work their way through Aina’s body the door opens on Bridget and");
		if (ainaKids() > 1) output(" the children.");
		else output(" Nina.");		
		output(" You immediately pull your fingers from the centaur snatch, feeling [pc.eachCock] throb mournfully at the missed opportunity. You swiftly wash your arm in the sink to clean the thick musk. ");
		
		output("\n\nYou grin devilishly as you see Aina struggle to mask the last shudders of her heat induced euphoria. She settles into heavy breathing, and you assist her in wiping down with a towel before she heads over to enjoy some time with");
		if (ainaKids() > 1) output(" the kids.");
		else output(" Nina.");	
		output(" You join her, hoisting Nina into a hug and spinning her round before returning her to the ground.");	
		
		processTime(10 + rand(15));
		applyAinaMareMuskEffect();
		pc.changeLust(30);
	}
		
	output("\n\n<i>“You wanna stay and watch a movie? I got the latest senseless action flick,”</i> Aina asks hopefully. You could stay and watch, or head out before it starts.");
	
	clearMenu();
	addButton(0,"Stay",ainaPregComfort1,undefined);
	addButton(1,"Go",ainaPregHeatSexGo,undefined);
}
//post pregnant heat scene gotta go
public function ainaPregHeatSexGo():void
{
	clearOutput();
	showPregAina(false, true);
	
	output("<i>“Sorry, I’ve got something I need to do,”</i> you apologize, getting ready to head out. Aina looks a little sad, but nods and corrals");
	if (ainaKids() >= 2) output(" the kids");
	else output(" Nina");	
	output(" over to the couch. You head out the door, ready to return to your adventures.");
	
	clearMenu();
	addButton(0,"Next",mainGameMenu,undefined);
}
public function ainaBirth(birthTimestamp:int = -1):void
{
	if(birthTimestamp < 0) birthTimestamp = GetGameTimestamp();
	
	var traitChar:Creature = chars["PC_BABY"];
	var c:UniqueChild = new AinaUniqueChild();
	
	c.RaceType = GLOBAL.TYPE_HUMAN;

	//cycle through kids and increment gender stats
	for(var i:int = 0; i < flags["AINA_NUM_BABIES"]; i++)
	{
		if (flags["AINA_BABY_GENDERS"][i] == "M")
		{
			c.NumMale += 1;
			StatTracking.track("pregnancy/aina sons", 1);
		}
		else if (flags["AINA_BABY_GENDERS"][i] == "F")
		{
			c.NumFemale += 1;
			StatTracking.track("pregnancy/aina daughters", 1);
		}
		else c.NumIntersex += 1; //shouldn't happen with aina's kids, just an error catch
	}
	// Race modifier (if different races)
	c.originalRace = c.hybridizeRace(c.originalRace, pc.originalRace, true);
	
	// Adopt father's colors at random (if applicable):
	if(rand(2) == 0) c.skinTone = traitChar.skinTone;
	if(rand(2) == 0) c.lipColor = traitChar.lipColor;
	if(rand(2) == 0) c.nippleColor = traitChar.nippleColor;
	if(rand(2) == 0) c.eyeColor = traitChar.eyeColor;
		
	if (ainaKids() < 1)
	{
		c.Name = "Nina";
		c.hairColor = "auburn";
	}
	else
	{
		if(traitChar.hairColor != "NOT SET" && rand(2) == 0) c.hairColor = traitChar.hairColor;
		//25% chance of getting fur from Aina's tfs
		if (rand(4) == 0)
		{
			c.furColor = aina.furColor;
			if (traitChar.furColor != "NOT SET" && rand(2) == 0) c.furColor = traitChar.furColor;
		}
	}
	
	c.MaturationRate = 1.0;
	c.BornTimestamp = birthTimestamp;
	ChildManager.addChild(c);	

	StatTracking.track("pregnancy/aina sired", flags["AINA_NUM_BABIES"]);
	StatTracking.track("pregnancy/total sired", flags["AINA_NUM_BABIES"]);
	StatTracking.track("pregnancy/total day care", flags["AINA_NUM_BABIES"]);
	
	flags["AINA_BIRTHSCENE"] = birthTimestamp;	

	if(flags["AINA_TOTAL_KIDS"] == undefined) flags["AINA_TOTAL_KIDS"] = 0;
	flags["AINA_TOTAL_KIDS"] += flags["AINA_NUM_BABIES"];
	flags["AINA_PREG_TIMER"] = undefined;
	flags["AINA_NUM_BABIES"] = undefined;
	flags["AINA_BABY_GENDERS"] = undefined;
	flags["AINA_PREG_EMAIL1"] = undefined;
	flags["AINA_PREG_EMAIL2"] = undefined;
	flags["AINA_PREG_EMAIL3"] = undefined;
	flags["AINA_PREG_EMAIL4"] = undefined;
	flags["AINA_PREG_EMAIL5"] = undefined;
	flags["AINA_PREG_EMAIL6"] = undefined;
	//note: AINA_MEETUP is not reset, pc only needs to meet her the first time
}

//if pc ingores Aina's first email of first pregnancy for entire 75 day term, come here and reset eveything like it never happened except for incrementing secret deadbeat flag
//kid shipped off to parents never to be spoken of again? unless the deadbeat flag is used someday...
public function ainaDeadBeatPC():void
{
	if(flags["AINA_DEADBEATPC"] == undefined) flags["AINA_DEADBEATPC"] = 0;
	flags["AINA_DEADBEATPC"] += flags["AINA_NUM_BABIES"];
	flags["AINA_PREG_TIMER"] = undefined;
	flags["AINA_NUM_BABIES"] = undefined;
	flags["AINA_BABY_GENDERS"] = undefined;
	flags["AINA_PREG_EMAIL1"] = undefined;
	flags["AINA_PREG_EMAIL2"] = undefined;
	flags["AINA_PREG_EMAIL3"] = undefined;
	flags["AINA_PREG_EMAIL4"] = undefined;
	flags["AINA_PREG_EMAIL5"] = undefined;
	flags["AINA_PREG_EMAIL6"] = undefined;
	flags["AINA_COMFORT"] = undefined;
	flags["AINA_MEETUP"] = undefined;	
}

//birth of nina
public function ainaFirstBirth():Boolean
{
	clearOutput();
	showPregAina(false, false);
	
	//note: kid will already be added to stats, so kid total checks need to take that into account	
	output("You rush into the nursery, seeing Aina and Bridget");
	if (StatTracking.getStat("pregnancy/total day care") > 2) output(", alongside a number of curious kids,");
	else if (StatTracking.getStat("pregnancy/total day care") == 2) output(", alongside a curious kid,");
	output(" standing together in a bedded corner of the room. Relieved to see her ok, you walk over to join them. You gasp excitedly when you see what they’re standing in front of. Out of a small, tightly wrapped cloth blanket pokes a tiny face with a swath of dark hair. A particularly strong kick knocks the bundle apart and identifies this as your");
	if (StatTracking.getStat("pregnancy/total day care") > 1) output(", or Aina’s at least,");	
	output(" firstborn daughter!");
	
	output("\n\n<i>“Sorry I didn’t have time to call you to be there, but it was over really quickly. I’m not jumping on that natural 11 hour birth experience any time soon, and Bridget really knew what she was doing. The whole thing took just a couple of hours, and I mailed you right after. But look! Isn’t she so cute?!”</i> The new mother exclaims, looking a bit haggard but otherwise none the worse for wear. You sweep a strand of blond hair out of her face and lean in to give her a short, simple kiss. She beams when you pull away, tossing her arms around you in a hug.");
	
	if (pc.isBimbo()) output("\n\n<i>“She’s so scrumptiolicious! I wanna, like, eat her up!”</i>");
	else if (pc.isNice()) output("\n\n<i>“Don’t be sorry. We made something perfect.”</i>");
	else if (pc.isMisc()) output("\n\n<i>“You worry too much! she’s adorable.”</i>");
	else output("\n\n<i>“She makes up for you not calling me.”</i>");	
	output(" you reply, leaving an arm around her shoulder. Aina takes a few minutes to nurse the baby girl till she falls asleep, wrapped safely in a new bundle.");
	
	output("\n\n<i>“I want to name her Nina, after my mom. Let her know I still care, even if she’s distant,”</i> she says, looking from the sleeping baby to you. ");
	output("\n\n<i>“Sounds good to me, but I want her middle name to be Victoria,”</i> you respond. Gotta carry the name somehow if she’s not gonna have your last name.");
	output("\n\n<i>“Nina Victoria Berkanis, She’ll be the envy of the station’s school children,”</i> she muses, looking suddenly tired herself. You give her a fortifying shoulder squeeze.");
	output("\n\n<i>“You should get some sleep too. I’ll leave you alone with her for now and stop in later,”</i> you say, standing to leave. Aina nods in response, settling into brushing Nina’s hair as she nods off into a deep slumber. You smile as you head out, getting back to the galaxy at large.");
	
	processTime(60 + rand(30));	
	
	flags["AINA_BIRTHSCENE"] = undefined;
	flags["AINA_NURSERY"] = GetGameTimestamp();
	flags["AINA_AT_BIRTH"] = 1;
	
	clearMenu();
	addButton(0, "Next", mainGameMenu, undefined);
	
	return true;
}
//birth of 2nd + kids
public function ainaRepeatBirth():void
{
	clearOutput();
	showPregAina(false, false);	
	
	moveTo("NURSERYG14");
	
	output("You’re in the process of preparing a strawberry-banana smoothie for Aina when you hear a short gasp and a splash from the living room. You rush over to find her standing in a puddle of sticky fluids. It looks like her water has broken!");
	if (pc.isNice()) output(" <i>“What do you need me to do?”</i> you ask, rushing to her as she steps out of the wet spot.");
	else output(" <i>“Aren’t you a little old to be wetting yourself?”</i> you can’t help but snark, even as you rush up to help.");
	
	if (pc.isNice()) output("\n\n<i>“I hadn’t been paying attention! Just help me get to Bridget. We’ve got like twenty minutes before the baby comes, and don’t want it to happen in my living room, she explains, already on her way out the door.”</i>");
	else output("\n\n<i>“Now’s not the time for jokes, stupid,”</i> she scolds, looking flustered. <i>“Help me get to the nursery, cause I don’t want to have this kid in my living room and we have maybe twenty minutes.”</i>");
	output(" You hold her arm as the two of you exit her house and head to the elevator. Her breathing grows heavier as you push the button to move to the nursery, and you give her hand a squeeze.");
	
	output("\n\nBridget gives you a small smile as she sees you come in, but jumps into action upon seeing Aina. She leads the expecting mother over to a cushioned section of the nursery, one you remember as being the place where Nina was born. You wander over when it looks like they’re situated,");
	if (pc.isNaga()) output(" coiling up");
	output(" kneeling down");
	output(" in front of Aina.");
	
	output("\n\n<i>“I’m glad you could be here this time. It’s not that bad actually, but it’s still reassuring to have you here,”</i> she says, and then melts into your arms as Bridget injects her with an anaesthetic hypospray. Her eyes glaze over and she leans dreamily onto your shoulder, but her hand manages to stay loosely intertwined with yours.");
	output("\n\n<i>“I don’t know why humans took so long to improve birthing assistance drugs. The old methods seem so barbaric in comparison,”</i> she smirks, discarding the injector and giving Aina a reassuring rub on the flank. Her grip hardly gets tighter on your hand as her body works its way through the birth, with Bridget on hand to make sure nothing goes wrong.");
	output("\n\nBy the occasional soft utterances in your ear you’d sooner think the pregnant centaur was getting a pleasurable massage than going through childbirth. Your robotic nursemaid scoots over to catch the baby before it can drop out, and you hear a burst of faint crying as the process finishes its course. Bridget coos quietly as she tucks the newborn into a tiny swaddle, cleaning it at the same time.");
	output("\n\nWhen she finishes she pulls a large body length cushion over to Aina, placing it beside her body so that her weight sits mostly against it. You pull her gently off your shoulder, giving her a kiss that she returns with all the enthusiasm she can muster before collapsing onto the pillow. Bridget places the child down next to her, placed for easy access to breastfeeding while not being too cloistered.");
	output("\n\n<i>“It might not have sounded or felt like it, but even with the advanced medicine birth is still an exhausting process. She’ll be all better by tomorrow, but for now she needs rest more than anything,”</i> Bridget explains. You nod and give Aina a kiss on the forehead, also softly brushing the mop of hair on your new baby’s head.");
	output("\n\n<i>“I’ll see you both soon, but I’m gonna head out for now,”</i> you say quietly, getting a nod in response from the tired centaur. You head back to your adventures, smiling as you think of your family and its newest addition.");
	
	processTime(30 + rand(30));	
	
	flags["AINA_BIRTHSCENE"] = undefined;
	flags["AINA_NURSERY"] = GetGameTimestamp();
	flags["AINA_AT_BIRTH"] = 1;
	
	clearMenu();
	addButton(0,"Next",mainGameMenu,undefined);
}
//check if aina birthscenes are available to trigger
public function ainaBirthScene():Boolean
{		
	if (flags["AINA_BIRTHSCENE"] == undefined) return false;
	
	var dnum:int;
	
	//available for a week for Nina, otherwise just 1 day
	if (ainaKids() > 1) dnum = 1;
	else dnum = 7;
	
	var timeframe:int = dnum * 24 * 60;
	
	if (GetGameTimestamp() - timeframe < flags["AINA_BIRTHSCENE"]) return true;
	else
	{
		flags["AINA_BIRTHSCENE"] = undefined;
		//send email if pc missed birth scene of repeat kids
		if (ainaKids() > 1 && flags["AINA_AT_BIRTH"] != 1) resendMail("aina_preg6", GetGameTimestamp());
	}
	
	return false;
}
//check to see if aina is in her apartment or at the nursery
public function ainaAtNursery():Boolean
{	
	//with first kid aina will be in the nursery for up to a week or until the player shows to see her first birth scene (than 24 more hours)
	if (ainaKids() == 1 && ainaBirthScene()) return true;
	
	if (flags["AINA_NURSERY"] == undefined) return false;
	
	var timeframe:int = 24 * 60;
	
	if (GetGameTimestamp() - timeframe < flags["AINA_NURSERY"]) return true;
	else flags["AINA_NURSERY"] = undefined;
	
	return false;
}
//text for nursery in nursery.as
public function ainaBabyBlurbs():void
{	
	if (ainaKids() > 0)
	{
		//get aina kids age ranges 0-12 months, 1 - 18 yrs, 18+
		var inf:int = ChildManager.numOfUniqueTypeInRange(AinaUniqueChild,0,12)
		var kids:int = ChildManager.numOfUniqueTypeInRange(AinaUniqueChild,13,216)
		var old:int = ChildManager.numOfUniqueTypeInRange(AinaUniqueChild, 217, -1)
		var ttl:int = inf + kids;
		
		if (ttl > 0)
		{			
			output("\n\nYour children with Aina");
			if (inf > 0 && kids > 0) output(" run and crawl");
			else if (inf > 0) output(" crawl");
			else output(" run");
			if (ChildManager.numChildrenAtNursery() > ttl) output(" around with the other kids.");
			else output(" around the nursery.");
			if (old >= 1)
			{
				if (ttl == 1) output(" Currently it’s just one kid, but that could change.");
				else output(" The oldest heads the herd, doing laps around a patient Bridget. An odd assortment of horselike ears or tails separate them into their own group.");
			}
			else
			{
				if (ttl == 1) output(" So far it’s just Nina, but that could change.");
				else output(" Nina heads the herd, doing laps around a patient Bridget. An odd assortment of horselike ears or tails separate them into their own group.");				
			}
			output(" Aina’s centaur transformatives didn’t bleed through entirely, but it looks like some of the minor details slipped in.");
		}		
	}
}
//set lactation
public function ainaSetLactation():void
{
	var inf:int = 0;
	if (ainaKids() > 0)
	{
		inf = ChildManager.numOfUniqueTypeInRange(AinaUniqueChild, 0, 12)
	}
	//is lactating if email5 sent for current pregnancy or has a kid 1 yr or younger
	if ((flags["AINA_PREG_EMAIL5"] == 1 || inf > 0)) flags["AINA_LACTATING"] = 1;
	else flags["AINA_LACTATING"] = 0;
	
}