/* Roxy by SheepPun & William*/

/**
	 * ...
	 * @author DrunkZombie
	 */
/*

New Flags:
	ROXY_TOTAL_KIDS //number of kids you and roxy have together
	ROXY_TOTAL_LITTERS //number of litters you and roxy have together
	ROXY_FIRST_KIDS_TIMER //timestamp of first kids birth
	ROXY_FIRST_KIDS_DAY //day of first kids birth
	ROXY_PREG_TIMER //days bored jumper has been pregnant
	ROXY_BIRTH_SCENE //should jumper birth scene trigger undef/0 no, 1 yes
	ROXY_BIRTH_SCENE_FURCOLOR1 //one fur color
	ROXY_BIRTH_SCENE_FURCOLOR2 //second fur color if applicable
	ROXY_BIRTH_SCENE_HAIRCOLOR1 //one hair color
	ROXY_BIRTH_SCENE_HAIRCOLOR1 //second hair color if applicable
	ROXY_BIRTH_SCENE_BOYS //count of sons for birth scene
	ROXY_BIRTH_SCENE_GIRLS //count of daughters for birth scene
	ROXY_BIRTH_SCENE_HERMS //count of herms for birth scene
	ROXY_MISSED_BIRTH //pc missed roxy birth scene undef/0 no, 1 yes
	ROXY_NUM_BABIES //number of babies in current pregnancy (2-8)
	ROXY_BABY_GENDERS //array used to track genders of current pregnancy
	ROXY_MET //undef/0 unmet, 1 met
	ROXY_SEX //counter for total sex
	ROXY_DOGGY_LAST //last doggy style method 0 = vag, 1 = ass, 2 = dp 2 dicks, 3+ = dp 3+ dicks
	ROXY_DOGGY_VAG //counter for doggystyle vag sex
	ROXY_DOGGY_ANAL //counter for doggystyle anal sex
	ROXY_DOGGY_DP //counter for doggystyle dp sex
	ROXY_MISSIONARY //counter for pet play sex
	ROXY_COWGIRL_FIRST //counter for cowgirl, steele came first
	ROXY_COWGIRL_HOLD //counter for cowgirl, roxy came first
	ROXY_BJ //counter for cowgirl, roxy came first
	ROXY_BREED //counter for rut sex
	ROXY_SPOON //counter for spoon sex
	ROXY_RVS_COWGIRL //counter for rvs cowgirl sex
	ROXY_PREG_INTRO //does pregnant intro need to trigger 1 = yes
	ROXY_RUT_INTRO //flag if post rut intro needs to play 1 = yes
	ROXY_RUT_REJECT //flag if you first rut reject needs to play 1 = yes
	ROXY_IDEA //flag if ‘idea’ blurb needs to play 2 yes, -1 = has played
	ROXY_IDEA_REFUSE //flag if steele refused 1 yes
	ROXY_TALK_HERSELF //flag if have talked about "herself" 1 = yes
	ROXY_TALK_STADIUM //flag if have talked about "stadium" 1 = yes
	ROXY_TALK_FETISH //flag if have talked about "fetish" 1 = yes
	ROXY_TALK_CHILDREN //flag if have talked about "children" 1 = yes
	ROXY_TALK_PREG //flag if have talked about "preg" 1 = yes
	ROXY_TALK_PLANS //flag if have talked about "plans" 1 = yes
	ROXY_TALK_SEX //flag if have talked about "sex" 1 = yes
	ROXY_TALK_SEX_NODICK //flag if rejected for not having a dick 1 = yes
	ROXY_STERILEX //flag if roxy is on sterilex 1= yes
	ROXY_HEAT_SEX// set this to 1 right before roxy.loadInCunt to turn on 100% preg chance (will be turned off automatically inside Roxy.loadInCunt)
	ROXY_TONE //tracks last tone level of pc, 0 = soft, 1 = firm, 2 = muscly
	ROXY_JILLING_TIMER //timestamp for roxy off jilling herself after refuses rut sex
	ROXY_PREG_EMAIL //preg email sent 1 = yes
	ROXY_MOVE_EMAIL //move email sent 1 = yes
	ROXY_KID_FL_SIZE //size of first litter
	ROXY_KID_NAME //array of names of first litter
	ROXY_KID_SEX //array of sexes of first litter	
	ROXY_CUDDLES_TIMER //timer for last cuddles event
	ROXY_CUDDLES_REFUSE //time if cuddles refused
	ROXY_CUDDLES //counter for cuddles
	ROXY_RE_CHILDREN //1 = has seen
	ROXY_RE_FOYER //1 = has seen
	ROXY_RE_COMMON //1 = has seen
	ROXY_RE_VISIT//which re this visit
	ROXY_RE_DONE //1 = if re seen this visit
*/
import classes.GameData.Pregnancy.Child;
import classes.GameData.Pregnancy.Templates.RoxyUniqueChild;
import classes.GameData.Pregnancy.UniqueChild;
import classes.GameData.Pregnancy.Containers.Genders;

//show nude, tits and/or preg bust
public function showRoxy(nude:Boolean = false,preg:Boolean = false):void
{
	var tits:Boolean = false;
	//passed in preg parameter is just to toggle the check to display or not
	if (preg)
	{
		//set false if not actually showing
		if (roxyPregTrimester() < 2) preg = false;
	}
	if (roxyGetNumLitters() > 0 && !preg) tits = true;
	
	if (flags["ROXY_MET"] == 1) showName("\nROXY");
	else showName("SPORTY\nLAQUINE");
	showBust("ROXY" + (tits ? "_TITS" : "") + (preg ? "_PREG" : "") + (nude ? "_NUDE" : ""));
	author("SheepPun & William");
}
//is roxy at the stadium
public function roxyIsInStadium():Boolean
{
	if (roxyIsInNursery()) return false;
	if (roxyIsVisitingKids()) return false;
	if (flags["ROXY_JILLING_TIMER"] != undefined)
	{
		if (GetGameTimestamp() > (flags["ROXY_JILLING_TIMER"] + (24 * 60))) flags["ROXY_JILLING_TIMER"] = undefined;
		else return false;
	}
	if (hours >= 12 && hours <= 16) return true;
	
	return false;
}
//is roxy in nursery
public function roxyIsInNursery():Boolean
{
	if (roxyPregTrimester() > 1) return true;
	
	return false;
}
//is roxy in temp house tile
public function roxyIsInTempHousing():Boolean
{
	if (!roxyIsInNursery()) return false;
	if (flags["ROXY_BIRTH_SCENE"] == 1) return false;
	if (roxyIsAsleep()) return true;
	if ((hours >= 9 && hours <= 10) || (hours >= 12 && hours <= 17) ||(hours >= 19 && hours <= 20)) return true;
	
	return false;
}
//is roxy asleep in temp housing
public function roxyIsAsleep():Boolean
{
	if (!roxyIsInNursery()) return false;
	if (hours >= 21 || hours <= 6) return true;
	
	return false;
}
//is roxy in cafeteria tile
public function roxyIsInCafeteria():Boolean
{
	if (!roxyIsInNursery()) return false;
	if (flags["ROXY_BIRTH_SCENE"] == 1) return false;
	if (hours == 8 || hours == 11 || hours == 18) return true;
	
	return false;
}
//is roxy in cafeteria tile
public function roxyIsExercising():Boolean
{
	if (!roxyIsInNursery()) return false;
	if (flags["ROXY_BIRTH_SCENE"] == 1) return false;
	if (hours == 7) return true;
	
	return false;
}
//returns 0-3 for no preg or preg trimester
//set know to true if it only matters if steele knows about it
public function roxyPregTrimester(know:Boolean=false):int
{
	var tri:int = 0;
	//keep it as 0 if steel doesn’t know yet
	if (flags["ROXY_PREG_EMAIL"] != 1 && know) tri = 0;
	else if (flags["ROXY_PREG_TIMER"] != undefined)
	{
		if (flags["ROXY_PREG_TIMER"] >= 120) tri = 3;
		else if (flags["ROXY_PREG_TIMER"] >= 60) tri = 2;
		else tri = 1;
	}
	
	return tri;
}
//returns true if it has been one week since first litters birth
public function roxyHasVisitedKids():Boolean
{
	if (flags["ROXY_FIRST_KIDS_TIMER"] != undefined)
	{
		if (GetGameTimestamp() > (flags["ROXY_FIRST_KIDS_TIMER"] + (7 * 24 * 60))) return true;
	}
	return false;
}
//number of litters have had with roxy
public function roxyGetNumLitters():int
{
	var numLitters:int = 0;
	if (flags["ROXY_TOTAL_LITTERS"] != undefined)
	{
		numLitters += flags["ROXY_TOTAL_LITTERS"];
	}
	return numLitters;
}
//returns true if steeles has phermones
public function roxySteeleHasPheremones():Boolean
{
	if (pc.hasPerk("Musky Pheromones")) return true;
	if (pc.hasPerk("Jungle Queen Scent")) return true;
	if (pc.hasPerk("Pheromone Cloud")) return true;
	if (pc.hasPerk("Alpha Scent")) return true;
	//note Pheromone Sweat is purposefully left out
	return false;
}
//This returns your preg score on a scale of 0-99999, or 0%-99.999%
public function roxyKnockupChance():int
{
	var vir:Number;
	var chance:Number = -.356; //this gives a base 30% preg chance
	var cumQ:Number = pc.cumQ();
	
	//if have not talked about her fetish and set sterilex on or off, she is inconsistant about birth control and base chance is %15
	if (flags["ROXY_TALK_FETISH"] != 1) chance = -.162;
	
	if(pc.virility() == 0 || roxy.fertility() == 0 || chance == 0) return 0;
	
	vir = (pc.virility() + roxy.fertility());
	
	//increase base virility by cum volume up to a max of +2 (at a certain point the rest is just excess and will never get near the egg and is irrelevant for preg chance)
	//plus this keeps player virility more important than volume for large preg change increases
	if (cumQ >= 2000) vir += 2;
	else if (cumQ > 0) vir += cumQ / 1000;
	
	vir = vir / 2;
	
	return (1 - Math.exp(chance * vir)) * 10000;
}
//Return value of true if she gets impregnated, else false
public function tryKnockUpRoxy(heatSex:Boolean=false):Boolean
{
	var chance:Number;
	var minBabies:Number = 2;
	var kidSex:int;
	
	//If pc is infertile, roxy is on sterilex (and not rut sex) or is already preggo return false
	if(pc.virility() == 0 || flags["ROXY_PREG_TIMER"] != undefined || (flags["ROXY_STERILEX"] == 1 && !heatSex)) return false;
	
	chance = roxyKnockupChance();
	//rand returns 0 to 9999, chance returns 0 to 9999, 0 chance will never result in pregnancy obviously
	if(rand(10000) < chance || heatSex)
	{
		//succesful impregnation
		flags["ROXY_PREG_TIMER"] = 0;
		//2-8 babies
		flags["ROXY_NUM_BABIES"] = rand(7) + 2;
		//increase number of babies based on virility and cum volume
		minBabies += Math.round(pc.virility() - 1);
		minBabies += Math.round(pc.cumQ() / 1000);
		if (minBabies > 8) minBabies = 8;
		
		//if this is first preg, min kids is 4
		if (flags["ROXY_TOTAL_KIDS"] == undefined && minBabies < 4) minBabies = 4;
		
		if (flags["ROXY_NUM_BABIES"] < minBabies) flags["ROXY_NUM_BABIES"] = minBabies;
		
		flags["ROXY_BABY_GENDERS"] = new Array();

		//Lets roll for genders 33/33/33
		for(var i:int = 0; i < flags["ROXY_NUM_BABIES"]; i++)
		{
			kidSex = rand(3);
			if(kidSex == 0) flags["ROXY_BABY_GENDERS"].push("M");
			if(kidSex == 1) flags["ROXY_BABY_GENDERS"].push("F");
			else flags["ROXY_BABY_GENDERS"].push("H");
		}

		pc.clearRut();
		
		flags["ROXY_PREG_INTRO"] = 1;
		
		return true;
	}
	else return false;
}
//process any preg events for roxy
public function processRoxyPregEvents(deltaT:uint, doOut:Boolean, totalDays:uint):void
{
	var pregTerm:int = 182;
	
	if(flags["ROXY_PREG_TIMER"] != undefined) flags["ROXY_PREG_TIMER"] += totalDays;
	
	var timestamp:int = GetGameTimestamp() + deltaT;
	
	if(flags["ROXY_PREG_TIMER"] != undefined)
	{
		if(flags["ROXY_PREG_EMAIL"] == undefined && flags["ROXY_PREG_TIMER"] >= 1)
		{
			if (flags["ROXY_TALK_FETISH"] == 1) resendMail("roxy_preg", timestamp);

			flags["ROXY_PREG_EMAIL"] = 1;
			flags["ROXY_MISSED_BIRTH"] = undefined;
		}
		if (flags["ROXY_MOVE_EMAIL"] == undefined && roxyPregTrimester() >= 2)
		{
			resendMail("roxy_move", timestamp);
			flags["ROXY_MOVE_EMAIL"] = 1;
		}
		if (flags["ROXY_PREG_TIMER"] >= pregTerm && flags["ROXY_BIRTH_SCENE"] == 1)
		{
			timestamp = (GetGameTimestamp() + deltaT - (flags["ROXY_PREG_TIMER"] * 24 * 60) + (pregTerm * 24 * 60));
			flags["ROXY_MISSED_BIRTH"] = 1;
			roxyBirth(timestamp);
			if (roxyGetNumLitters() == 1) roxyMissedBirthNameKids();
			resendMail("roxy_missedbirth", timestamp);
		}
		else if (flags["ROXY_PREG_TIMER"] >= 181 && flags["ROXY_BIRTH_SCENE"] == undefined)
		{
			resendMail("roxy_birth", timestamp);
			flags["ROXY_BIRTH_SCENE"] = 1;
		}
	}
}

//make the kids for roxy birth
public function roxyBirth(birthTimestamp:int = -1):void
{
	if(birthTimestamp < 0) birthTimestamp = GetGameTimestamp();
	
	var traitChar:Creature = chars["PC_BABY"];
	var c:UniqueChild;
	var i:int = 0
	var skipSex:Boolean = true;
	var firstLitter:Boolean = true;
	if (roxyGetNumLitters() > 0) firstLitter = false;
	
	flags["ROXY_BIRTH_SCENE_FURCOLOR1"] = undefined;
	flags["ROXY_BIRTH_SCENE_FURCOLOR2"] = undefined;
	flags["ROXY_BIRTH_SCENE_HAIRCOLOR1"] = undefined;
	flags["ROXY_BIRTH_SCENE_HAIRCOLOR2"] = undefined;
	flags["ROXY_BIRTH_SCENE_EYECOLOR1"] = undefined;
	flags["ROXY_BIRTH_SCENE_EYECOLOR2"] = undefined;
	flags["ROXY_BIRTH_SCENE_BOYS"] = 0;
	flags["ROXY_BIRTH_SCENE_GIRLS"] = 0;
	flags["ROXY_BIRTH_SCENE_HERMS"] = 0;

	if (firstLitter)
	{
		flags["ROXY_KID_NAME"] = new Array();
		flags["ROXY_KID_SEX"] = new Array();
		flags["ROXY_KID_FL_SIZE"] = flags["ROXY_NUM_BABIES"];
		
		for(i = 0; i < flags["ROXY_NUM_BABIES"]; i++)
		{
			c = new RoxyUniqueChild(); 
					
			c.RaceType = GLOBAL.TYPE_LAPINE;
		
			if (flags["ROXY_BABY_GENDERS"][i] == "M")
			{
				c.NumMale += 1;
				IncrementFlag("ROXY_BIRTH_SCENE_BOYS");
			}
			else if (flags["ROXY_BABY_GENDERS"][i] == "F")
			{
				c.NumFemale += 1;
				IncrementFlag("ROXY_BIRTH_SCENE_GIRLS");
			}
			else
			{
				c.NumIntersex += 1;
				IncrementFlag("ROXY_BIRTH_SCENE_HERMS");
			}
			// Race modifier (if different races)
			c.originalRace = c.hybridizeRace(c.originalRace, pc.originalRace, true);
			// Adopt father’s colors at random (if applicable):
			if(rand(2) == 0) c.skinTone = traitChar.skinTone;
			if(rand(2) == 0) c.lipColor = traitChar.lipColor;
			if(rand(2) == 0) c.nippleColor = traitChar.nippleColor;
			if(rand(2) == 0) c.eyeColor = traitChar.eyeColor;
			if (traitChar.hairColor != "NOT SET" && rand(2) == 0) c.hairColor = traitChar.hairColor;
			if (rand(2) == 0)
			{
				if(traitChar.furColor != "NOT SET") c.furColor = traitChar.furColor;
				else if (traitChar.hairColor != "NOT SET") c.furColor = traitChar.hairColor;
			}			
			c.MaturationRate = 1.0;
			c.BornTimestamp = birthTimestamp;
			ChildManager.addChild(c);
			if (flags["ROXY_BIRTH_SCENE_FURCOLOR1"] == undefined) flags["ROXY_BIRTH_SCENE_FURCOLOR1"] = c.furColor;
			else if (flags["ROXY_BIRTH_SCENE_FURCOLOR1"] != c.furColor) flags["ROXY_BIRTH_SCENE_FURCOLOR2"] = c.furColor;
			if (flags["ROXY_BIRTH_SCENE_HAIRCOLOR1"] == undefined) flags["ROXY_BIRTH_SCENE_HAIRCOLOR1"] = c.hairColor;
			else if (flags["ROXY_BIRTH_SCENE_HAIRCOLOR1"] != c.hairColor) flags["ROXY_BIRTH_SCENE_HAIRCOLOR2"] = c.hairColor;
			if (flags["ROXY_BIRTH_SCENE_EYECOLOR1"] == undefined) flags["ROXY_BIRTH_SCENE_EYECOLOR1"] = c.eyeColor;
			else if (flags["ROXY_BIRTH_SCENE_EYECOLOR1"] != c.eyeColor) flags["ROXY_BIRTH_SCENE_EYECOLOR2"] = c.eyeColor;
		}
	}
	else
	{
		//determine how many of each sex
		for(i = 0; i < flags["ROXY_NUM_BABIES"]; i++)
		{
			if (flags["ROXY_BABY_GENDERS"][i] == "M")
			{
				IncrementFlag("ROXY_BIRTH_SCENE_BOYS");
			}
			else if (flags["ROXY_BABY_GENDERS"][i] == "F")
			{
				IncrementFlag("ROXY_BIRTH_SCENE_GIRLS");
			}
			else
			{
				IncrementFlag("ROXY_BIRTH_SCENE_HERMS");
			}
		}
		//loop through the sexes
		for(i = 0; i < 3; i++)
		{
			skipSex = true;
		
			if (i == 0)
			{
				if (flags["ROXY_BIRTH_SCENE_BOYS"] > 0) skipSex = false;
			}
			else if (i == 1)
			{
				if (flags["ROXY_BIRTH_SCENE_GIRLS"] > 0) skipSex = false;
			}
			else if (i == 2)
			{
				if (flags["ROXY_BIRTH_SCENE_HERMS"] > 0) skipSex = false;
			}
			
			if (!skipSex)
			{
				c = new RoxyUniqueChild();
				
				c.RaceType = GLOBAL.TYPE_LAPINE;
				
				if (i == 0) c.NumMale += flags["ROXY_BIRTH_SCENE_BOYS"];
				else if (i == 1) c.NumFemale += flags["ROXY_BIRTH_SCENE_GIRLS"];
				else if (i == 2) c.NumIntersex += flags["ROXY_BIRTH_SCENE_HERMS"];
				// Race modifier (if different races)
				c.originalRace = c.hybridizeRace(c.originalRace, pc.originalRace, true);

				// Adopt father’s colors at random (if applicable):
				if(rand(2) == 0) c.skinTone = traitChar.skinTone;
				if(rand(2) == 0) c.lipColor = traitChar.lipColor;
				if(rand(2) == 0) c.nippleColor = traitChar.nippleColor;
				if(rand(2) == 0) c.eyeColor = traitChar.eyeColor;
				if (traitChar.hairColor != "NOT SET" && rand(2) == 0) c.hairColor = traitChar.hairColor;
				if (rand(2) == 0)
				{
					if(traitChar.furColor != "NOT SET") c.furColor = traitChar.furColor;
					else if (traitChar.hairColor != "NOT SET") c.furColor = traitChar.hairColor;
				}			
				c.MaturationRate = 1.0;
				c.BornTimestamp = birthTimestamp;
				ChildManager.addChild(c);
				if (flags["ROXY_BIRTH_SCENE_FURCOLOR1"] == undefined) flags["ROXY_BIRTH_SCENE_FURCOLOR1"] = c.furColor;
				else if (flags["ROXY_BIRTH_SCENE_FURCOLOR1"] != c.furColor) flags["ROXY_BIRTH_SCENE_FURCOLOR2"] = c.furColor;
				if (flags["ROXY_BIRTH_SCENE_HAIRCOLOR1"] == undefined) flags["ROXY_BIRTH_SCENE_HAIRCOLOR1"] = c.hairColor;
				else if (flags["ROXY_BIRTH_SCENE_HAIRCOLOR1"] != c.hairColor) flags["ROXY_BIRTH_SCENE_HAIRCOLOR2"] = c.hairColor;
				if (flags["ROXY_BIRTH_SCENE_EYECOLOR1"] == undefined) flags["ROXY_BIRTH_SCENE_EYECOLOR1"] = c.eyeColor;
				else if (flags["ROXY_BIRTH_SCENE_EYECOLOR1"] != c.eyeColor) flags["ROXY_BIRTH_SCENE_EYECOLOR2"] = c.eyeColor;
			}
		}
	}
	StatTracking.track("pregnancy/roxy sired", flags["ROXY_NUM_BABIES"]);
	if(flags["ROXY_TOTAL_KIDS"] == undefined) flags["ROXY_TOTAL_KIDS"] = 0;
	flags["ROXY_TOTAL_KIDS"] += flags["ROXY_NUM_BABIES"];
	IncrementFlag("ROXY_TOTAL_LITTERS");
	IncrementFlag("ROXY_PREG_NEW");
	
	StatTracking.track("pregnancy/total sired", flags["ROXY_NUM_BABIES"]);
	StatTracking.track("pregnancy/total day care", flags["ROXY_NUM_BABIES"]);

	if (flags["ROXY_FIRST_KIDS_TIMER"] == undefined) flags["ROXY_FIRST_KIDS_TIMER"] = birthTimestamp;
	if (flags["ROXY_FIRST_KIDS_DAY"] == undefined) flags["ROXY_FIRST_KIDS_DAY"] = days;
	flags["ROXY_PREG_TIMER"] = undefined;
	flags["ROXY_NUM_BABIES"] = undefined;
	flags["ROXY_BABY_GENDERS"] = undefined;
	flags["ROXY_BIRTH_SCENE"] = undefined;
	flags["ROXY_STERILEX_OVERRIDE"] = 0;
	flags["ROXY_PREG_EMAIL"] = undefined;
	flags["ROXY_MOVE_EMAIL"] = undefined;
}

public function roxyGreet():void
{	
	clearOutput();
	showRoxy(false, true);
	var firstTime:Boolean = true;
	var steeleRut:Boolean = pc.inRut();
	var roxyIdea:Boolean = false;
	
	if (flags["ROXY_MET"] >= 1) firstTime = false;
	
	//special intro for post rut sex on first meet
	if (flags["ROXY_RUT_INTRO"] == 1)
	{
		flags["ROXY_RUT_INTRO"] = 0;
		flags["ROXY_PREG_INTRO"] = 0;
		flags["ROXY_PREG_EMAIL"] = 1;
		flags["ROXY_MISSED_BIRTH"] = undefined;
		output("You know the brown-furred laquine’s name to be Roxy, and there she is on that bench again. Now that your head is mercifully clear of the influence of apocalyptic breeding desires, you can probably have an actual conversation with her!");
		output("\n\nSo you sidle up to her, and she analyzes you with narrowed eyes. Her pupils pinpoint you quickly, and she hops up excitedly. <i>“Hey there, [pc.name]! Good timing!”</i>");
		output("\n\nGood timing?");
		output("\n\nShe simpers, <i>“Yeah, uhh, you might wanna have a seat...”</i>");
		output("\n\n<i>“You remember pretty vividly how our first time together went, yeah?”</i> Roxy tilts her head adorably, like a punished child trying to soften the blow of discipline. <i>“Definitely not gonna forget that myself!”</i>");
		output("\n\nYou ask her to get to the point.");
		output("\n\n<i>“Shit. Well, umm...”</i> She looks down, pressing both hands to her tummy. <i>“[pc.name], I’m pregnant... I mean... I told you it was gonna happen, and everything you did was incredibly hot, and... yeah. These kids are definitely going to be yours.”</i>");
		output("\n\nWas she expecting you to be angry? Of course you’re elated! You knew full well what you were getting into, and hell, the fact it worked should have been obvious when your thoughts stabilized! You slap her on the back, a big smile on your face, telling her how happy you are it took and that you can’t wait to see ‘em.");
		output("\n\n<i>“W-Wow... seriously? I was just gonna...”</i> She shakes her head. <i>“Well, fuck, I planned an explanation and I’m not gonna just let it die. I owe you that much.”</i>");
		output("\n\nShe looks out to the stadium wistfully. <i>“I was gonna tell you, and try to be a little bit more tactful about it... but yeah, I really loved everything you did. I’ve wanted to get pregnant for a really long time, and I’ve had a lot of bad sex trying to get there. I always make myself out to be the biggest slut when I’m taking dick. The thought that someone could rise to my level, pound my bratty ass into the floor, and have the chance of making me a mom? I’ve always sought it out.”</i>");
		output("\n\nLooks like she found it.");
		output("\n\n<i>“Yep!”</i> she chirps, but immediately regrets it. <i>“S-Sorry, it’s still kinda shitty to just spring it on you like this. I couldn’t help myself. You come wandering in here smelling like </i>the Big Lurch<i> and I just lost control. I wanted you all to myself. You did not disappoint even once.”</i> She smooches you on the cheek. <i>“But yeah, I’ve wanted to be a mom all my life. Not sure if it was the hormones though. My younger sisters and my mothers have been on my case about it forever cause I’m in my late twenties... they hold it against me, and then my ‘dad’ is all about this fertility plague going on-”</i>");
		output("\n\nShe snaps upwards and bites her lip. <i>“Fuck, sorry, that came out really wrong. I don’t wanna be a mom just to satisfy my family! I’ll even pinky swear on that!”</i> You nod lightly. <i>“But yeah, yeah... I want to be a mom with a big, happy family. Having great sex is part of my life. Thinking about being able to raise a cheery buncha kids as a result of it makes it all the sweeter.”</i>");
		output("\n\nHer shoulders shiver and she looks down, both legs kicking forwards and backwards. <i>“That’s all. I’m glad we did that and all, but umm... I really hope I haven’t fucked your life or anything. I’m not gonna be a deadbeat mom. I plan on putting every credit towards their future.”</i> Her trembling fingers drum against her thigh. <i>“Anyway... I just hope there won’t be anything bad between us because of this. I’m glad you’re happy so, if I could ask-”</i>");
		output("\n\nYou stop her right there.");
		if (pc.isBimbo()) output(" <i>“Chill out, hunny-bun!”</i> you pat her shoulder. <i>“I’ve got a nursery, and we can take our kids there! They’ll, like, they’ll get smart, they’ll be taken care of, whatever we need! We can even get you a room in the apartments!”</i>");
		else if (pc.isBro()) output(" <i>“Don’t get so stressed, sweetie.”</i> You stroke Roxy’s cheek. <i>“I’ve a nursery we can take them to. They’ll get everything they need growing up. You too. There’s an apartment upstairs, good, quiet place for you to stay nice and close to me.”</i>");
		else if (pc.isNice()) output(" <i>“It’s not a problem at all,”</i> you smile squeezing her paw. <i>“My dad left me a nursery, just for this type of situation. Our kids will be cared for, protected, educated... you can even get a room in the attached apartment. You don’t have to worry about anything, Roxy.”</i>");
		else if (pc.isMischievous()) output(" <i>“Hang on, hang on,”</i> you pat her shoulder, stroking her ear. <i>“Don’t you go having any doomsday thoughts. See, I’ve got a nursery, fully equipped, fully staffed. Our kids will be taken care of in every possible way, and there’s even an attached apartment you can shack up in if you need a good, warm place to stay. Always wanted a bun next door.”</i>");
		else output(" <i>“Quiet down,”</i> you whisper, stroking her cheek. <i>“I’ve got a nursery. You aren’t in any danger, and you don’t have to worry about their health. Our kids will be safe, and they’ll grow up healthy as can be. You can get a room in the adjacent apartment too, if you need it. I’d rather you stay close.”</i>");
			
		output("\n\n<i>“H-Holy shit... really!?”</i> she hops up, both balled fists held to her close. She bounces up and down in place excitedly. <i>“We can keep having kids, and they’ll all be cared for!?”</i>");
		output("\n\nWell, in a manner of speaking, yes.");
		output("\n\n<i>“Shit, shit, shit... okay, no problem! But, hey, can I get your email first? I think I’d like to take you up on that offer when time comes ‘n all.”</i>");
		output("\n\nSure. Roxy pulls out a PDA of sorts and jots down your contact information, no doubt a useful thing to have when she eventually checks in. All while she hums and chatters idly about her growing litter, the biggest, happiest smile is planted on your face.");
		output("\n\n<i>“Well, until I get too heavy to do anything, I’ll have to tell coach I’m out of the game for a bit. Doesn’t mean we can’t keep having a good fuck, [pc.name],”</i> Roxy purrs. <i>“Don’t worry. I’m a tough bitch, contact sports for a living, we can get a bit vicious. Least until my belly plumps up!”</i>");
		output("\n\nWell, now that that’s settled, you wonder if you should take her up on the offer or get to know her a bit more..");
	
		processTime(5);
	}	
	//if steele in rut, not taur and roxy is not preggers
	else if (steeleRut && !pc.isTaur() && flags["ROXY_PREG_TIMER"] == undefined)
	{
		if (firstTime && flags["ROXY_RUT_REJECT"] != 1)
		{
			output("On your approach, you’re not sure if you should be surprised that a spry and young-looking bunny-girl is squirming and fidgeting obsessively with obvious need. Even from here you can see her gold eyes glazing over, her upright ears folding, a cold shiver running through her nerves. Perky lapine chest juts forward and taut, fuzzy butt thrusts out, both in an automatic instinct to present to a nearby mate who broadcasts the most primal desire to bone. Those breedable curves are cocked aggressively, yet the face she makes is flabbergasted and confused.");
			output("\n\nWhen she spots you, a husky groan vibrates across her lips. <i>“F-Fuck...”</i> she grunts, looking even ‘worse’ after drinking in your pheromone-ridden form. The earthen-furred rabbit, dressed in a sporty attire, starts openly touching herself, cramming a hand past her denim and into her pussy. <i>“What the hell drugs are you on? Because I fucking love all the signals you’re sending, hot-stuff...”</i>");
			output("\n\nHopping to her feet, she launches forward and slams into your [pc.chestNoun], grinding all over your body like a one-chit whore desperate for a fix of dick. Her nose twitches to an absolute blur, inhaling and getting drunk on every single overcharged molecule billowing from your pores. The horny laquine’s long, furry equine tail is wagging wildly just above her gropeable tush, waving her mounting arousal around.");
			output("\n\nIt’s not long before people start staring, wondering if you two are lovers with a blatant fetish for exhibitionism.");
			output("\n\n<i>“You wanna fuck right? I smell that, I can smell all of that, and you know what?”</i> The rabbit-woman wraps her arms around you in an ultra possessive fashion. <i>“I want to fuck even harder,”</i> she hisses in your [pc.ear]");
			if (pc.tallness >= 69) output(", standing on her tiptoes to reach it");
			output(". <i>“I don’t even care that I don’t know your name, but you can fill me with kids. I’m the easiest lay you’ll ever find, and I’m the kinda bitch who <b>wants</b> to get knocked up. ‘Sides, you’re kinda cute too, whoever you are... you sexy, horny little [pc.raceCuteShort]!”</i>");
			output("\n\nBeing in rut has its blessings and its curses, and you’re more than willing to count this as a random benefit. Your loins are fucking <i>screaming</i> to take her up on that offer. Your mind and body are united in the willingness and readiness to breed, and you’ve stumbled upon someone else who shares that sentiment.");
			output("\n\nWill you make this random bunny the mother of a few half-laquines?");
		}
		else if (firstTime && flags["ROXY_RUT_REJECT"] == 1)
		{
			output("You can’t say you’re surprised when that laquine from before, attuned to your fragrance, bounces up the second she catches a whiff of your virile aroma. She zeroes in on you and gives you the most scornful look imaginable. <i>“You again...”</i> she huffs, her bikini stretching out around those erecting tits. <i>“Don’t you fucking dare tell me you’re not here for a fuck when you’ve got <b>that</b> going on!”</i>");
			output("\n\nYou can’t tell if she actually wants to hump all over you, but she is. The dumbly horny laquine is smooching you with an aggressive want for cock, groping your [pc.cocks]");
			if (!pc.isCrotchExposed()) output(" through the material of your [pc.crotchCoverUnder]");
			output(". <i>“Don’t make me walk away from this dick again, c’mon, I know good places...”</i>");
			output("\n\nSo long as you’re in rut, you’re probably not gonna be able to talk to whoever this is normally. Do you take her offer and make her the mother of your laquine babies?");
		}
		else
		{
			output("Roxy’s ears lilt in your presence. She doesn’t even have to look at you to start whimpering, fidgeting, obsessively smacking her feet against the floor. Her chest instinctively pushes out and her taut laquine butt thrusts backwards, an automatic self-position for breeding. There’s nobody else she could possibly be reacting to but you and your overcharged rut-scent. Her hazy golden eyes finally land on you, and she seems practically blinded by the sight, to say nothing of your smell.");
			output("\n\n<i>“F-Fuck, what the hell are you on, [pc.name]?”</i> She leaps up, bounding into you so hard that you nearly stumble over. Her twitchy bunny nose dilates and inhales deeply. <i>“Oh hell, you’ve got <b>that</b> smell... You smell so goooood...”</i>");
			output("\n\nHer pussy is wet. You can <i>taste</i> it through the denim. Of course, one of her paws is in there, frigging away at the black button capping it, gushing out more of that sugary and strongly scented femininity. <i>“God damn it... I want you to just push me down and fuck me right here in front of everyone, make me the happiest mom with the biggest belly, I... I-HiKK!”</i>");
			output("\n\nRoxy squeaks and her entire body convulses. Eyes rolling back, her legs thrust forward, wave after wave of syrupy succor sloughing inside her pants and spilling from the brim in her ‘ready to be fucked full of children’ posture. She looks <i>ravishing</i>, and you want nothing more than to push her down, make her into a complete slut for your dick, make her into a broodmother too heavy and hopped up on hormones to care about anything but giving birth to <i>your kids and doing it all over again.</i>");
			output("\n\nIf you took Roxy right now, you’re probably (most definitely) going to knock her up and be the " + pc.mf(" father"," sire") + " to a healthy litter of laquines. It’s an overriding need almost impossible to resist. But you weren’t planning on doing that, right? There’s a godly breeder hammering your [pc.cocks] into a perfectly ready state <i>right now!</i> You’re so unthrobbingly <b>hard</b> that you-");
			output("\n\nWhat do you do!?");
		}
		processTime(3);
	}
	//special intro 24 hr after a preg
	else if (flags["ROXY_PREG_INTRO"] == 1 && flags["ROXY_PREG_EMAIL"] == 1)
	{
		flags["ROXY_PREG_INTRO"] = 0;
		
		if (flags["ROXY_TALK_FETISH"] == 1)
		{
			if (roxyGetNumLitters() > 0)
			{
				output("<i>“Steele!”</i> Roxy bellows. <i>“Come on over!”</i>");
				output("\n\nYou take a seat next to Roxy, eyeing her slightly larger tummy. You don’t need to guess or be told what’s got her so excited.");
				output("\n\n<i>“Yep, pregnant again. Just wanted to get happy about it... and I fucking LOVE that smile on your face, it’s just as cute as last time.”</i> She kisses you on the cheek. <i>“So, aside from that, anything going on? Wanna fuck off and fuck?”</i>");
			}
			else
			{
				output("Roxy spots you before you ever get close, waving with both arms like you’ve just stepped off a packed transport of sailors returning home. <i>“Heyyy, [pc.name]!”</i>");
				output("\n\nYou take your seat,");
				if (MailManager.isEntryViewed("roxy_preg")) output(" having a good idea of what’s got her so hyper.");
				else output(" wondering what’s got her so amped.");
				output("\n\nThe bunny beams you a glorious smile. <i>“I’m pregnant. Test came back positive, so you’re gonna be the " + pc.mf(" dad"," sire") + " to a buncha laquines! Little rabbit-eared Steeles runnin’ around, it’s gonna be so cute!”</i>");
				output("\n\nDamn straight.");
				if (!MailManager.isEntryViewed("roxy_preg")) output(" You are slightly surprised, but you remember the email she sent that you didn’t read...");
				output("\n\n<i>“Anyway, just cause I’m pregnant I’m not gonna stop wanting sex. You come to me if you wanna bone or talk. I can’t play games like this anyway, so keep me company, </i>" + pc.mf("papa","mama") + " <i>[pc.name]!”</i> she gestures expansively, finally hugging you again. <i>“Well, until my belly gets big, then I’ll go and shack up on Tavros with ‘ya.”</i>");
			}			
		}
		else
		{
			flags["ROXY_TALK_FETISH"] = 1;
			
			output("Roxy is clawing at her own fingers and fidgeting like an obsessive madwoman. Normally alert and upraised rabbit’s ears are folded and she looks... disturbed. Taking a seat next to her, she hardly registers that you’ve come by, reacting with a yelp and skyward bounce. <i>“Fuck! How’d you sneak up on me like that, [pc.name]?”</i>");
			output("\n\nYou answer with your own question: what’s got her so tilted?");
			output("\n\nThe laquine seats herself and crosses her legs pretzel-style. Whatever’s bothering her, it’s got her acting like an impatient tween. <i>“[pc.name]... I like you.”</i> She tilts her head innocently. <i>“Seriously, you’re amazing with that dick, and uhh...”</i> she blinks. <i>“I’m pregnant.”</i>");
			output("\n\nBoth eyebrows raise and, and the revelation fills you with a distinct thrill! The glow on your [pc.face] bewilders her.");
			output("\n\n<i>“Umm, aren’t you pissed? I didn’t tell you I wasn’t on contraceptives, didn’t tell you I was fertile...”</i>");
			output("\n\nYou remind her that you didn’t either, and she laughs and finally loosens up.");
			output("\n\n<i>“Well, damn, I had a big explanation planned. Might as well tell you what’s up.”</i> She winks. <i>“You probably figured from how many times we’ve gone at it, but I’ve got a thing for getting bred. I wanna get pregnant, knocked up, whatever!”</i>");
			output("\n\nShe scans the stadium, continuing. <i>“I’ve wanted to be a mom for a long time, but I could never tell if it was the hormones... or my family pestering me. My younger sisters have kids already, my mom and my ‘father’ are on my back cause I’m getting older and still don’t, and then my ‘dad’ is also talking up a storm about the fertility plague and I just can’t deal with it sometimes-”</i>");
			output("\n\nRoxy gasps and looks at you nervously. <i>“Fuck! Sorry, that wasn’t what I meant to say, errr, I don’t want to have kids just to appease my family, I really do want kids, I want a big, happy family. I’ll pinky swear on that, [pc.name]!”</i> She eases up again when you give her a light nod. <i>“I wanna be a great mom, and I wanna keep having great sex. Getting pregnant’s always been part of it. Kinda surprised you didn’t ask me about it either...”</i>");
			output("\n\nWell, there’s nothing for that then.");
			output("\n\n<i>“I’m not gonna be a deadbeat either, but at the same time... I guess you really wanted to have kids with me if you kept going right? I mean that smile you gave was somethin’ else. I just hope this won’t fuck up your life or anything.”</i>");
			if (pc.isBimbo())
			{
				output("\n\n<i>“Noo, we’re gonna be just fine!”</i> you sing. <i>“We can take those little miracles to my nursery. It even has an attached apartment, so you can go and rest up there if you need to! I’d love to have you around!”</i>");
				output("\n\nRoxy’s eyes cross into sharp points, in total disbelief as you go into more detail.");
			}
			else if (pc.isBro())
			{
				output("\n\n<i>“Nope,”</i> you respond brusquely. <i>“I’ve got a nursery, and any children of mine can be moved there and taken care of until they’re of age. You can also get a room in the apartment, if you need it.”</i>");
				output("\n\nShe looks a lot calmer now, especially as you go into detail.");
			}
			else if (pc.isNice())
			{
				output("\n\nYou take Roxy’s hand and squeeze it tight, looking her straight in the eye. <i>“Neither of us will suffer for it. I have a nursery to take care of any children I may bring into the galaxy, and I plan to take responsibility for them all. They’ll be taken care of, educated, protected, and you can move into the apartments there if you want to stay close.”</i>");
				output("\n\nAn extremely touched expression is visible on Roxy’s face.");
			}
			else if (pc.isMischievous())
			{
				output("\n\nRoxy’s ears fold in deference when you pet them. The giggle you give makes her smile again. <i>“I’m not worried, it’s all covered. See, I’ve got a nursery, and we can take care of our kids there. They’ll be safe, warm, educated, and cared for until they’re adults. Even got an attached apartment if you wanna get off Uveto for a bit. I could use a cute bun like you next door.”</i>");
				output("\n\nShe blinks. Trepidation, awe, and happiness are sparking across her face.");
			}
			else
			{
				output("\n\n<i>“We’re going to be okay,”</i> you sigh. <i>“I’ve got a nursery. My kids can be taken there. Keeps track of them, gets them education, support, you name it. There’s an apartment up there you can use too. I’d rather you not carry my kids around this frozen hell.”</i>");
				output("\n\nShe looks taken aback.");
			}
			output("\n\nOnce anxious, she bounces up in glee. <i>“That’s awesome! So we can just keep having raunchy sex and lots of kids!?”</i> She sits herself down regretfully. <i>“Wow, that was kinda weird.”</i>");
			output("\n\nBut you also thought it was kinda hot.");
			output("\n\n<i>“Well, pass me your contact info, [pc.name]. I’ll need it. Gotta prove to Charlie I’m not fucking around and I’ll need some kinda proof to actually get that apartment.”</i>");
			output("\n\nRoxy whips out a PDA and takes down your email address, hugging you tightly afterward. <i>“Well, I’m pregnant... but that doesn’t mean I can’t tango. You wanna talk or fuck, just come see me! Least til my belly gets heavy, heh heh.”</i>");
			output("\n\nWhat now?");
		}		
	}
	//normal first meet
	else if (firstTime)
	{
		output("When you’re only a few steps from the laid-back laquine, she’s spotted you, perking up expectantly.");
		output("\n\n<i>“Hm? You want an autograph?”</i> she asks, golden eyes roving actively across your form. You tell her no with a lopsided smile; one eyebrow arches in surprise on her face. Her gradual confusion intensifies while you explain your curiosity away: you were only wondering who she was.");
		output("\n\nHer torpid expressions finally make way for a certain kind of showy confidence. <i>“Roxy!”</i> she fist pumps. <i>“Rox ‘em Sox ‘em Roxy of the Pinup Punks,”</i> she declares. <i>“I’m a roller derby player here. Though I guess if you don’t know that, it’s safe to say that you’re new here or you just come here for the race track... or both.”</i>");
		output("\n\nRoxy crosses her arms. <i>“Now I’m curious; here, have a seat.”</i> She jerks her head at the spot next to her.");
		if (pc.isTaur()) output(" Mindful of your body shape, you simply sit next to it.");
		else output(" It’s an invitation you accept.");
		if (flags["ROXY_RUT_REJECT"] == 1)
		{
			output("\n\n<i>“Ah, shit, now I recognize you. The [pc.raceShort] I pounced on. Looks like you got over your bit of rut, huh?”</i>");
			output("\n\nYou nod.");
			output("\n\n<i>“Should’a worked it out in me,”</i> she says, sighing. <i>“We can talk about that later, though.”</i>");
		}
		output("\n\n<i>“This stadium’s most known for high-stakes ‘taur racing... but if you haven’t noticed the place is massive. It hosts an array of sports and events. Something for everyone. Like I said, I work here. In a sense.”</i> She stretches her neck. <i>“Roller derbies aren’t the </i>most<i> popular thing ever sadly...”</i> Her smile brightens when she leans down slightly, expanding the seam of her cleavage, <i>“...but it makes it even more sweeter when I meet a fan. You should go see one if you haven’t before.”</i> Roxy blinks. <i>“I didn’t ask for your name did I? Sorry about that.”</i>");
		if (pc.isBimbo())
		{
			output("\n\n<i>“[pc.name] Steele!”</i> you announce, reciprocating her openness in the only way you know how. <i>“[pc.name] for my friends, ”</i> you finish with a purr");
			if (pc.hasTits()) output(", positioning yourself in a way to show off a little of your own [pc.breasts]");
			output(".");
		}
		else if (pc.isBro()) output("\n\n<i>“[pc.name] Steele,”</i> you start. <i>“But you can call me [pc.name],”</i> you finish, comically winking.");
		else if (pc.isNice()) output("\n\n<i>“[pc.name] Steele,”</i> you smile back, shaking her paw amiably. <i>“[pc.name] is fine.”</i>");
		else if (pc.isMischievous()) output("\n\nIt’s your turn to grin. <i>“[pc.name] Steele,”</i> you say. <i>“But the cute girls get to call me [pc.name].”</i>");
		else output("\n\nWith a light nod you simply say, <i>“[pc.name] Steele”</i> on autopilot. <i>“Just [pc.name].”</i>");
		
		output("\n\n<i>“Sounds good. Alright [pc.name],”</i> Roxy gives a smug smile, <i>“I’ll </i>try<i> to remember it.”</i>");
		if (pc.isAss()) output(" She laughs at her own practical humor.");
		else output(" You laugh with her.");
		output(" <i>“Okay, okay. Anything else you wanna know, or just wanna talk? I can ramble about sports later.”</i>");
		processTime(5);
	}
	//one time scene after two doggystyle fucks to intro "idea" button
	else if (flags["ROXY_IDEA"] >= 2 )
	{
		roxyIdea = true;
		flags["ROXY_IDEA"] = -1;
		output("<i>“Yo, [pc.name],”</i> Roxy waves you over. <i>“Wanting another round already?”</i> she elbows you in your bicep. <i>“Hey, you fuck good, but I was thinking I could show you somethin’ else, maybe show you how I do. You got me thinkin’ it’s only fair you get a chance to see what I can do. Let me know if you wanna see my little ‘idea’, a’ight?”</i> she smiles, eyes closed.");
		output("\n\nShe leans forward, putting her pert cleavage on display. <i>“Kay, what’s up? Anything on your mind, or you wanna just get to the action?”</i>");
		processTime(2);
	}
	else
	{		
		output("Roxy gives her usual self-assured smile as she notices you approaching. <i>“Well if it isn’t");
		if (flags["ROXY_SEX"] >= 1) output(" [pc.name].");
		else output(" Steele.");
		output(" How’re ‘ya doing?”</i>");
		if (pc.hasStatusEffect("Roxy Style Collar Mark")) output("\n\nShe looks closely at your neck, her lips forming into a razor thin grin when she sees the bright red mark her collar left on your windpipe. <i>“That looks tender,”</i> she puts it lightly. <i>“Gotta admit though, that gets me all hot and bothered. Thinking about you coming and getting me back for that... mmf...”</i>");
		if (steeleRut && flags["ROXY_PREG_TIMER"] != undefined) output("\n\nShe sniffs you up, maintaining her cool mind. <i>“Damn, you smell like you could put a baby in anyone with a single drop of cum. Sorry, you got me filled nice and good. Maybe a leithan around here could use a wet fuck? Hah hah, but... what’s on your mind?”</i>");
	
		processTime(2);
	}
	
	if(!CodexManager.entryUnlocked("Laquines")) 
	{
		output("\n\nYour codex beeps to inform you it’s identified the Laquine race.");
		CodexManager.unlockEntry("Laquines");
	}
	
	clearMenu();
	
	if (roxyIdea) addButton(0, "Next", roxyGreet);
	else if (steeleRut && !pc.isTaur() && flags["ROXY_PREG_TIMER"] == undefined)
	{
		if (firstTime)
		{
			if (pc.cockThatFits(roxy.vaginalCapacity(0)) >= 0) addButton(0, "Yes", penisRouter, [roxyBreedHer, roxy.vaginalCapacity(0), false, 0], "Yes", "Yes. How the fuck could you say no?");
			else if (!pc.hasCock()) addDisabledButton(0,"Yes","Yes","You need a dick to breed the bunny!");
			else if (pc.cockThatFits(roxy.vaginalCapacity(0)) < 0) addDisabledButton(0, "Yes", "Yes", "Your dicks are too big to breed the bunny!");
			addButton(1, "No", roxyDontBreedHer, undefined, "No", "H-hold on, it’s hot and all, but maybe you should show some restraint?");
		}
		else
		{
			if (pc.cockThatFits(roxy.vaginalCapacity(0)) >= 0) addButton(0, "Breed Her", penisRouter, [roxyBreedHer, roxy.vaginalCapacity(0), false, 0], "Breed Her", "Of course you were going to do this!");
			else if (!pc.hasCock()) addDisabledButton(0,"Breed Her","Breed Her","You need a dick to breed the bunny!");
			else if (pc.cockThatFits(roxy.vaginalCapacity(0)) < 0) addDisabledButton(0, "Breed Her", "Breed Her", "Your dicks are too big to breed the bunny!");
			addButton(1, "Show Restraint", roxyDontBreedHer, undefined, "Show Restraint", "ARE YOU FUCKING SERIOUS!?!?!?!?!");
		}
	}
	else
	{
		flags["ROXY_MET"] = 1;
		addButton(0, "Appearance", roxyAppearance, undefined, "Appearance", "Get a good look at the bouncy bunny.");
		addButton(1, "Talk", roxyTalk, undefined, "Talk", "Have a chat with Roxy.");
		if (!pc.hasCock() && flags["ROXY_TALK_SEX"] == 1 && flags["ROXY_SEX"] == undefined) addDisabledButton(2,"Sex","Sex","Roxy’ll only play ball if you have a penis.");
		else if (pc.isTaur() && flags["ROXY_TALK_SEX"] == 1 && flags["ROXY_SEX"] == undefined) addDisabledButton(2,"Sex","Sex","Roxy’d play ball if only you weren’t a taur.");
		else if (flags["ROXY_TALK_STADIUM"] != 1) addDisabledButton(2,"Sex","Sex","First, try to get to know the people you wanna spread legs with!");
		else if (flags["ROXY_TALK_SEX"] != 1) addButton(2, "Sex", roxySex, undefined, "Sex", "With how cavalier she is, she’d probably be down for a proverbial roll in the hay with someone she barely knows!");
		else addButton(2, "Sex", roxySex, undefined, "Sex", "Roxy’s always ready for a go. Are you?");
		addButton(3, "Leave", roxyTalkLeave);
	}	
}
public function roxyAppearance():void
{	
	clearOutput();
	showRoxy(false, true);
	var pregTri:int = roxyPregTrimester();
	
	output("The laquine Roxy stands at an average five-foot-eight, occasionally bouncing from one energetic paw to the other even whilst sat. Through her milky-caramel fur you can identify the flexing of idle muscles beneath a hint of sweat. It’s not clear whether she’s pumping herself up before the excitement, or riding out an adrenaline high.");
	output("\n\nTwo large, upraised bunny ears jut skyward, folding and craning to the surrounding hustle and bustle. Neck-length, dark brown hair fills the space between them, and the front bangs, streaked with bright gold, sweep along her cheeks and around her topaz-yellow eyes, matching the punky theme of her sporty aesthetic.");
	output("\n\nAround her lighter-colored middle she wears a");
	if (pregTri >= 2)
	{
		output(" simple t-shirt bearing the name and logo of her team, the Pinup Punks, and her formerly unobtrusive C-cups have swelled into");
		if (pregTri == 3) output(" milky DDs.");
		else output(" heavy Ds.");
	}
	else output(" black hoodie with bright yellow lining that barely passes her waist -- the sleeves are rolled up to her elbows. The top is zipped up only slightly, revealing a black bikini top that covers the pert and perky swells of her breasts, C-cups at best, capped with dark brown nipples the same color as her lips.");
	if (pregTri == 3) output(" The unmistakable bulge of pregnancy dominates Roxy’s middle-half. Her stomach has swollen up to an extreme degree, pressing out against her top and announcing the imminent birth of her children.");
	else if (pregTri == 2) output(" Roxy’s stomach has lost all of its physical definition, her muscles having disappeared into a visible pregnant baby bump.");
	else if (pregTri == 1) output(" Roxy’s well-defined gut-muscles are vanishing under a swelling tummy, indicating the beginnings of pregnancy.");
	else output(" When your eyes descend, her softly-muscled tummy is visible to all who look just a little bit harder, defined exquisitely by routine core exercises.");
	
	if (roxyGetNumLitters() >= 1) output("\n\n<i>“Are you just gonna sit there all day, [pc.name]?”</i> she asks, a lopsided smile on her face. <i>“Why look when we can touch?”</i>");
	else if (flags["ROXY_SEX"] >= 1)
	{
		if (rand(2) == 0) output("\n\n<i>“Sizing up the goods huh? Can’t blame ‘ya. I’m getting an eyeful myself!”</i>");
		else output("\n\n<i>“Uveto to Steele,”</i> Roxy quips, smiling curiously at your intense focus.");
	}
	else output("\n\n<i>“If you want to look that much you should see me in action,”</i> she grins.");
	
	if (pregTri >= 2) output("\n\nA long, comfy pair of black sweatpants hugs to her waist, extending down to her ankles. A much more conservative look than her usual attire.");
	else output("\n\nGirding her waist is a roughed up pair of denim shorts that accentuate her unsurprisingly thick and powerful lapine legs -- arching across her sides are two black thong-strings.");
	if (flags["ROXY_SEX"] >= 1)
	{
		output(" You know that behind the crotch is her winking, black horse-pussy.");
		if (pregTri >= 1) output(" Even covered up you can smell that ripe and thick scent of rubbery mare-twat, stronger than it was before her pregnancy.");
	}	
	output(" An equine-like tail pokes out from the brim of her firm bottom, long enough to reach her knees. The downy hair is naturally colored and looks delightfully soft to the touch");
	if (flags["ROXY_SEX"] >= 1) output("-- it often wags with a blur when you’re around!");
	else output(".");
	output(" Her uncovered calves have longer, lighter hair than the rest of her body. That ‘sock’ of sorts");
	if (CodexManager.entryViewed("Laquines")) output(" indicates that she prefers an untrimmed style unlike most laquines.");
	else output(" is rather unusual, but it must certainly help on this cold moon.");
	output(" Finishing her ensemble are two simple black shoes that she’s stuffed her feet into.");
	
	if (pregTri >= 2) output("\n\nRoxy stretches her legs and arms out, cracking her neck for good measure. <i>“Enjoying the fruits of my labor?”</i> she giggles.");
	else
	{
		output("\n\nRoxy arches back and knocks the backpack at her feet, containing her helmet, pads, and whatever other gear she might need.");
		if (roxyGetNumLitters() >= 1) output(" <i>“Now that you’re done staring, let’s talk about what you’re really after,”</i> she simpers.");
		else if (flags["ROXY_SEX"] >= 1) output(" <i>“Hope you enjoyed the eyeful, [pc.name],”</i> she whips her head in your direction.");
	}
	
	processTime(3);
	setButtonDisabled(0);
}
public function roxyTalk(quip:int=0):void
{	
	clearOutput();
	showRoxy(false, true);
	
	if (quip == 1) output("Roxy gives you the inquisitive eye, waiting to hear more.");
	else output("Roxy huffs. <i>“A chat huh? Sure, I’ve got time. What’s on your mind?”</i>");
	
	processTime(1);
	clearMenu();
	addButton(0, "Herself", roxyTalkHerself, undefined, "Herself", "Get to know more about the derby-playing bunny.");
	addButton(1, "Stadium", roxyTalkStadium, undefined, "Stadium", "Ask about the stadium.");
	
	if (flags["ROXY_TALK_FETISH"] == 1)
	{
		//our requirement has nothing to do with rut itself, but canRut checks for both cock and virility > 0, so suits our needs
		if (!pc.canRut()) addDisabledButton(2,"Contraceptives","Contraceptives","No reason to ask Roxy about contraceptives. You will never knock her up!");
		else if (flags["ROXY_PREG_TIMER"] != undefined) addDisabledButton(2,"Contraceptives","Contraceptives","No reason to ask about this. Roxy’s already got a litter!");
		else if (flags["ROXY_STERILEX"] != 1) addButton(2,"Contraceptives", roxyTalkContraceptives, undefined,"Contraceptives","Ask Roxy to get on contraceptives.");
		else addButton(2,"Contraceptives", roxyTalkContraceptives, undefined,"Contraceptives","Ask Roxy to get off contraceptives.");
	}
	else if (flags["ROXY_SEX"] == undefined) addDisabledButton(2,"Fetish","Fetish","You need to bone her first before thinking to ask about this.");
	else if (flags["ROXY_TALK_HERSELF"] != 1) addDisabledButton(2,"Fetish","Fetish","You should really have lengthier conversation with the people you bone before getting to deeper topics.");
	else addButton(2, "Fetish", roxyTalkFetish, undefined, "Fetish", "Roxy’s <i>very</i> big on something specific. Maybe have a talk with her about it?");
		
	if (roxyHasVisitedKids()) addButton(3, "Children", roxyTalkChildren, 0, "Children", "Ask Roxy how the kids are doing!");
	else addDisabledButton(3,"???");
	addButton(4, "Back", roxyGreet);
}
public function roxyTalkHerself():void
{	
	clearOutput();
	showRoxy(false, true);
	var firstTime:Boolean = true;
	if (flags["ROXY_TALK_HERSELF"] == 1) firstTime = false;
	flags["ROXY_TALK_HERSELF"] = 1;
	
	output("As simply as you can, you ask Roxy about herself.");
	if (firstTime) output(" What’s under that protective helmet?");
	else output(" Sure, you asked before, but you’d like a refresher.");
	
	output("\n\nHer ears lilt down and flick upwards at the question. <i>“Don’t always get asked that question, uhhh, well... I’m just a girl who likes full contact sports,”</i> she shrugs, eyes dimming for a moment of thought. <i>“I’ve always been into sports. Used to watch ‘em with my family.”</i> Her tail brushes to the right. <i>“I guess the term is ‘adrenaline junky’? Though that makes it sound like I do more crazy shit then beat other girls in a rink.”</i>");
	output("\n\nRoxy takes the bewildered look on your face as a cue to laugh out loud; she swivels forwards and backwards over the rimless furniture in the excitement.");
	output("\n\n<i>“I’m a professional roller derby player,");
	if (flags["ROXY_SEX"] >= 1) output(" [pc.name]");
	else output(" Steele");
	output("- it’s my job!”</i> she exclaims.");
	
	output("\n\n<i>“Okay, I mean, they’re not gladiator fights or wrestling matches. It’s just a sport where you need to be aggressive and play aggressive to win. Naturally, accidents happen ‘cause of it. You can’t actually hurt the other players intentionally.”</i>");
	output("\n\nNodding lightly, you hope out loud that she hasn’t gotten badly hurt herself.");
	output("\n\n<i>“Nahhhh,”</i> she groans out, sounding stoic. <i>“It’s just like any other sport. Well, any other sport that isn’t like boxing where you’re </i>meant<i> to hurt others. Say...”</i> she shifts closer to you, <i>“one of these days you should you see one of my matches with the Pinup Punks.”</i> She pulls back, one eye shut cutely. <i>“You know, if you ever get the chance.”</i>");
	output("\n\nYou just might. In the meantime, you ask her how she feels being on Uveto, noting her fluffier, unshorn coat compared to others.");
	output("\n\n<i>“Hm,”</i> she rolls her eyes, her head following the movements of her irises. <i>“I don’t hate Uveto. It’s damn cold, sure, but thank you to the geniuses behind indoor heating!”</i> She chuckles. <i>“Some of my teammates aren’t big on the place, and I can understand that. I sure as hell didn’t expect to get moved out to some frigid moon. I doubt any of the athletes here really expected to.”</i> Roxy shrugs. <i>“But the money is here and I get paid on time, so I can’t complain.”</i>");
	output("\n\nHer head tilts, one ear slumps, and she smirks mischievously. <i>“‘Least that’s what my contract says.”</i>");
	output("\n\n<i>“I guess the other downside of living on Uveto is I’m not a hop-skip-and-a-jump away from family anymore. Like, I still keep in touch with my mom, mother, and siblings. I kinda just miss getting to physically see them. Wouldn’t want them struggling against the cold here just for that, though.”</i>");
	output("\n\nRoxy places her hands on her hips when you give her a quizzical look. <i>“That face your making is about my use of words ‘mom’ and ‘mother’ right? My parents are both herms, girly as can be. I grew up calling the one who gave birth to me ‘mom’ and my sire ‘mother’. Easy as that.”</i>");
	if (CodexManager.entryViewed("Laquines")) output("\n\nNot too surprising, really. Laquines have an even split of males, females, and natural hermaphrodites in their race.");
	else output("\n\nYou nod, thanking her for explaining.");
	
	output("\n\nRoxy ‘umms’, looking you in the eye. <i>“Well, that about sums me up! So, what about you, huh");
	if (flags["ROXY_SEX"] >= 1) output(" [pc.name]?");
	else output(" Steele?");
	if (firstTime) output(" Come to think of it, that’s the company behind one of the local offices. Met one of the employees a while back. You work there?");
	else output(" Anything going on with the company?");
	output("”</i>");
	
	if (firstTime)
	{
		if (pc.isBimbo()) output("\n\n<i>“Nope,”</i> you say in a dramatically low voice, building up to the reveal. <i>“I’m gonna run Steele Tech someday! Just have to go out and earn it like dad wanted! It’s the best! Meeting all sorts of cute guys and girls is just one of the perks.”</i>");
		else if (pc.isBro()) output("\n\n<i>“Not yet,”</i> you smile proudly, <i>“but I’ll be in charge someday. Dad’s got me running around to win the company, but none of that is as interesting as the people I meet getting there.”</i>");
		else if (pc.isNice()) output("\n\n<i>“I am ‘that’ Steele,”</i> you simper, <i>“my dad was the CEO, but I’m not in charge yet. I’ve been traveling the frontier in that endeavor. Someday I’ll run the place.”</i>");
		else if (pc.isMischievous()) output("\n\n<i>“Oh yeah, I ‘work’ there,”</i> you grin, <i>“but not in any official capacity. For now. Gotta earn the company first before I go around saying I’m a bigshot CEO.”</i>");
		else output("\n\n<i>“Not quite. My dad was Victor Steele, and I’m his " + pc.mf(" son"," daughter") + ". I’ll be in charge of the company someday, and they’ll be working for me,”</i> you explain rather bluntly.");
	}
	else
	{
		output("\n\nNothing yet. You’re still on the trail to claiming it, and it’s going to be a long road.");
		if (flags["ROXY_SEX"] > 0 ) output(" Fortunately, that journey is made a lot easier knowing you have a certain laquine to come back to any time you need a little stress relief!");
		else output(" Fortunately, the journey is made a lot easier knowing you have a certain laquine to come back to any time!");
	}
	
	if (firstTime) output("\n\n<i>“Woah, you sure don’t look like a busybody executive. I’d know one, you should have seen my seventh agent.”</i>");
	else output("\n\n<i>“Yeah I’ll bet... gotta have goals to aim for, though.”</i>");
	output(" Roxy nods, bouncing a little faster than before. <i>“Nothing like a chat with a friend,”</i> she says, excitable as ever, mimicking a few silly gestures, <i>“beats the usual ‘can I have an autograph?’ stuff!”</i>");
	
	processTime(10);
	clearMenu();
	
	if (firstTime)
	{
		output("\n\nShe pauses, looking at you rather intently. <i>“Say, what about your family? Anything going on there? Miss anyone?”</i>");
		output("\n\nYour lips spread to automatically answer, but you realize that’s a bit of a loaded question for you. Roxy stares expectantly, awaiting any type of answer.");
		addButton(0, "Answer", roxyTalkHerselfAnswer, undefined, "Answer", "Tell her how things are going, getting a bit personal.");
		addButton(1, "Don’t Answer", roxyTalkHerselfDontAnswer, undefined, "Don’t Answer", "That’s something you’d rather stay tight-lipped on.");
	}
	else
	{	
		output("\n\n<i>“Welp,”</i> Roxy’s thin lips smack, <i>“that about covers that I think. Anything else on your mind,");
		if (flags["ROXY_SEX"] >= 1) output(" [pc.name]?”</i>");
		else output(" Steele?”</i>");
		addButton(0, "Next", roxyTalk, 1);
	}		
}
public function roxyTalkHerselfAnswer():void
{	
	clearOutput();
	showRoxy(false, true);
	var shadeSis:Boolean = shadeIsSiblings();
	var shadeFriend:Boolean = shadeIsFriend();
		
	output("You take a deep breath and relax, hoping nobody overhears this somehow.");
	output("\n\n<i>“Hey, you don’t have to answer if you don’t wanna. What’s between us stays ‘tween us,”</i> Roxy says in a lighter, more reassuring voice.");
	if (pc.isBimbo())
	{
		output("\n\n<i>“Daw, it’s no big deal. Not much to say either. My mom’s not around, haven’t seen her in a really long time. My dad’s </i>really<i> gone, too, and all I’ve got is a mean cousin ‘n uncle !”</i> You look downcast at saying that, but perk right back up when Roxy pats your shoulder.");
		if (shadeSis)
		{
			output(" <i>“Even met a sister I never knew recently,");
			if (shadeFriend) output(" and we’re on great terms!”</i>");
			else output(" but we’re not really friends.”</i>");
		}
	}
	else if (pc.isBro())
	{
		output("\n\n<i>“I wouldn’t worry about it, there’s little to say. Haven’t seen my mom in a long time, and my dad’s already buried and gone,”</i> you look wistfully to the side, a rush of memories coming back, only to break free when Roxy knocks your shoulder playfully. <i>“Guess’ve got a cousin too, but I try not to think about ‘em.”</i>");
		if (shadeSis)
		{
			output(" Smiling again, you continue. <i>“Not all bad, though. Met my half-sister in my journeys,");
			if (shadeFriend) output(" and being able to connect with her was worth the dangers.”</i>");
			else output(" unfortunately... we’re not exactly close right now.”</i>");
		}		
	}
	else if (pc.isNice())
	{
		output("\n\n<i>“It’s alright,”</i> you start, inhaling and relaxing. <i>“I had a great relationship with my family growing up, but I haven’t seen mom in a long time. My dad’s passed on, wasn’t too long ago either. And then there’s my ‘cousin’...”</i> In a liquid movement too smooth to see, Roxy pats your shoulder sympathetically.");
		if (shadeSis)
		{
			output(" <i>“I was surprised to meet a half-sister I never knew, though.");
			if (shadeFriend) output(" I’m glad I was able to meet her, too. Knowing I have family to turn to means a lot to me.”</i>");
			else output(" Sadly, we’re not what you’d call close. I’m hoping it doesn’t stay like that forever.”</i>");
		}		
	}
	else if (pc.isMischievous())
	{
		output("\n\n<i>“No biggie,”</i> you say, looking across the room. <i>“Haven’t seen mom in a really long time, but I’m sure she’s doing fine. My dad’s passed on already. Wasn’t too long ago, still kinda missing him. Only immediate family who’s around is my jerk-ass cousin.”</i> You’re taken by surprise when Roxy pats your shoulder empathically.");
		if (shadeSis)
		{
			output(" <i>“It’s not so bad, though. Met a half-sister for the first time even more recently.");
			if (shadeFriend) output(" She and I make great friends. Couldn’t ask for more.”</i>");
			else output(" Though, well, maybe it is kinda bad. We’re not seeing eye-to-eye right now.”</i>");
		}		
	}
	else
	{
		output("\n\n<i>“Won’t bother me,”</i> you shrug. <i>“All there is to say is my mom’s been out of my life for a long time. Don’t know where she is. Dad’s gone for good, though, leaving me with an asshole cousin.”</i> Roxy nods along with your words, tapping your shoulder sympathetically.");
		if (shadeSis)
		{
			output(" <i>“Recently met a half-sister of mine.");
			if (shadeFriend) output(" I’m just glad she’s not as bad as my uncle.”</i>");
			else output(" Hate to say that our relationship’s in a ditch though.”</i>");
		}		
	}
	
	if (shadeSis)
	{
		if (shadeFriend) output("\n\n<i>“Nice! Guess your old man liked to sleep around, huh? Hope you two stay friends.”</i>");
		else output("\n\n<i>“That sucks, I’d hate finally meeting a sibling after so long and not being able to hit it off. I won’t pry, but I hope it works out someday.”</i>");
	}
	else output("\n\n<i>“I’d hate to be in that position. I love my family too much.”</i>");
	output(" Roxy hums again, another question loaded on her tongue. <i>“What’s that about your cousin anyway?”</i>");
	
	if (pc.isBimbo()) output("\n\n<i>“[rival.HeShe]’s just stupid! Always getting in my way, calling me names, and trying to steal the company from me. My uncle’s worse!”</i>");
	else if (pc.isBro()) output("\n\n<i>“[rival.HeShe]’s a brat. No respect, no empathy. Just as greedy as [rival.hisHer] dad, stepping on people everywhere [rival.heShe] goes. We’ll leave it at that.”</i>");
	else if (pc.isNice()) output("\n\n<i>“My cousin [rival.name] is...”</i> You give an elongated sigh. <i>“...I admit I have nothing good to say about [rival.himHer] right now. [rival.HeShe]’s been hounding me on my travels, trying to steal the company for my uncle, just like he stole money from my dad.”</i>");
	else if (pc.isMischievous()) output("\n\n<i>“My cousin’s a real " + rival.mf(" dick"," bitch") + ", trying to claim my inheritance for [rival.hisHer] dad - my uncle. Did I mention he stole money from my dad, too? Not in a good spot there at all...”</i>");
	else output("\n\n<i>“My cousin’s a pest whose name isn’t worth speaking. Let me just put it this way, if I had the option of leaving them stranded somewhere, I’d do it.”</i>");
	
	output("\n\n<i>“Geez...”</i> Roxy grimaces, chewing her lip. <i>“Didn’t mean to bring that up. I really can’t imagine being in that kinda position. No offense, but I’m glad I’m not you right now. Wouldn’t wish that kinda stress on anyone either.”</i>");
	if (pc.isAss()) output("\n\nYou sigh, simply remarking ‘it is what it is’.");
	else output("\n\nYou apologize, simply remarking ‘it is what it is’.");
	
	output("\n\n<i>“Yep, let’s move on from that then!”</i> Roxy laughs. <i>“Anything else on your mind,");
	if (flags["ROXY_SEX"] >= 1) output(" [pc.name]?”</i>");
	else output(" Steele?”</i>");
	
	processTime(10);
	clearMenu();
	
	addButton(0, "Next", roxyTalk, 1);
}
public function roxyTalkHerselfDontAnswer():void
{	
	clearOutput();
	showRoxy(false, true);
	
	output("Roxy gets the hint when you stare at her tight-lipped, explaining that your family is not a subject worth bringing up right now. To your relief, she’s rather accepting of it.");
	output("\n\n<i>“I feel ‘ya. If it’s touchy I don’t wanna kill the mood for it.”</i>");
	output("\n\nYou still thank her for not being annoyed with you; she answered your questions, after all.");
	output("\n\n<i>“Naw, no love lost. You don’t look like you need any extra stress, ‘ya know?”</i> She cracks her knuckles. <i>“So! Anything else on your mind?”</i>");
	
	processTime(2);
	clearMenu();
	addButton(0, "Next", roxyTalk, 1);
}
public function roxyTalkStadium():void
{	
	clearOutput();
	showRoxy(false, true);
	
	flags["ROXY_TALK_STADIUM"] = 1;
	
	output("Curious as to what goes on around the stadium, you ask about the inner workings, who runs the place, what else takes place besides the races.");
	output("\n\n<i>“The stadium, huh?”</i> Roxy tilts her head grunting cutely from a stretch. <i>“It’s a big place sponsored by big companies. With all the money to be made around here, not just at the stadium, it’s been growing.”</i> She looks to the furthest corner of the room at a small window. <i>“‘Sides, gotta keep people’s minds off the storms somehow. What better way than a bunch of guys and girls sweatin’ for entertainment?”</i>");
	output("\n\nMakes sense; you gesture for her to go on.");
	output("\n\n<i>“There are a lot of games that go on around here. Race track’s the crowd favorite right now.”</i> Roxy leans in with an unimpressed look on her face, <i>“Which if you ask me is mainly ‘cause you can bet on those races. </i>Bet you,<i> heh, a lot of sports would be more popular if the laws on gambling weren’t so wonky. Eh, but I don’t think I’d like the pressure of knowing someone else’s money rides on my performance. Last thing I need is some dick taking his bad decisions out on me or my team.”</i>");
	output("\n\nYou nod. <i>“And you’re one of many floppy-eared athletes around here, yeah?”</i>");
	output("\n\n<i>“Yep, and I’m a pro! Right now I’m all about roller derbies; used to do a bit of rugby. The union kind, if that means anything to you.”</i> You can think of a few things. <i>“I’m definitely one of the reasons people come here. Well,”</i> her ears twitch frustratedly, <i>“</i>some<i> people. Roller derby’s not super popular right now.”</i>");
	output("\n\nHopefully she’s making enough to support herself.");
	output("\n\n<i>“Oh, that’s not a problem. Usually.”</i> She chuckles nervously. <i>“Roller derbies are a year-round sport. Every month we have at least one game, hopefully two, so I kinda live monthly paycheck to monthly paycheck.”</i> She errantly scratches the back of her head. <i>“I live off as little as I can in case of a rainy day. If money ever got tight I’d just take a few sewing jobs. Haven’t had to do that yet, so I must be doin’ somethin’ right.”</i>");
	output("\n\nRoxy closes her eyes to think. You take this as a cue to ask about the other people who work here.");
	output("\n\n<i>“More than I can rifle off: tons of athletes and even more workers. Still, the only people I interact with on a day to day basis are the other Pinup Punks. There’s that cute cashier up ahead, too. For as easy as I can be, even I’m surprised how tongue tied I can get around her.”</i> Roxy’s cute laugh following that casual admittance is telling,");
	if (pc.libido() >= 66 || pc.isBimbo() || pc.isBro()) output(" and you couldn’t be more delighted with that fact.");
	else if (pc.libido() >= 33) output(" and you’re already thinking of how best to use that information.");
	else output(" and your eyebrow is already curiously quirked.");
	
	output("\n\n<i>“That all said, you gotta find the place pretty impressive, right? I mean, this massive stadium on such a nowhere moon like Uveto, </i>and<i> it has <b>great</b> heating!”</i>");
	output("\n\nOh yeah, on that you’re in complete agreeance.");
	
	processTime(10);
	clearMenu();
	addButton(0, "Next", roxyTalk, 1);
}
public function roxyTalkFetish():void
{	
	clearOutput();
	showRoxy(false, true);
	var pregTri:int = roxyPregTrimester();
	
	flags["ROXY_TALK_FETISH"] = 1;
	flags["ROXY_STERILEX"] = 0;
	
	output("After having gone a round with the fiery jock-rabbit, something’s been on your mind. You tap her shoulder and look her dead in the eye, asking if she really is fertile, if she really is <i>that</i> keen on having kids.");
	output("\n\n<i>“So you noticed, huh?”</i> She laughs and leans back and forth like a swivel, an uncharacteristically bashful look flashing across her short muzzle. <i>“Well, I’m glad it wasn’t hard to. Would have to question your state of mind if you didn’t!”</i> She elbows you playfully. <i>“Yeah. I wanna get pregnant... I wanna get knocked up. Yep...”</i> her head rotates, <i>“I’ve got a thing- a big thing, for getting bred.”</i>");
	output("\n\nShe crosses her arms, looking at you seriously. <i>“I want to be a mom, and that’s probably my biggest goal in life.”</i> Roxy swallows, chewing her lip for a second. <i>“Maybe a bit of it is hormones. Maybe it’s because my younger sisters already have kids and I’m still single and only meeting people who cum tiny ropes as big as their little twigs. Maybe it’s cause they, mom, and my other mom hold it against me.”</i>");
	output("\n\nShe sighs regretfully. <i>“You should see how my ‘dad’ gets when talking about the fertility plague going on...”</i>");
	output("\n\nFor a moment she looks to be in despair, but the bunny-girl suddenly shoots up and grabs you by the shoulder, realizing what she let slip out. <i>“D-Don’t worry, it’s not about proving my family wrong, and it’s not because of the plague, I’ll pinky swear on that. I really do wanna be a good mom with a big family. Having great sex is just part of my life. The idea that I can raise an amazing and happy buncha kids from it just makes it all the sweeter.”</i>");
	output("\n\nThe laquine eases up when you give her a light nod, waiting for her to continue.");
	output("\n\n<i>“Well, [pc.name]. Are you asking for the reason I hope you are? I’ll be honest, I haven’t had a lay nearly as good as you in a long time. Uh, shit, that doesn’t sound right, but you get me don’t you?”</i> You smirk. <i>“The way you use your dick, how you keep up with me so well... I’ve really gotten to like you.”</i>");
	output("\n\nShe exhales nervously, wheeling fingers drumming against her thigh. <i>“Either way, I mean... as much as I want kids I don’t want to bring ‘em into the galaxy if I can’t take care of them. That’s not fair to anyone, least of all you.”</i> Her eyes seem almost teary when she looks at you now. <i>“I’m sorry, [pc.name]. I should have told you I’m fertile, but I kinda lumped you in with my past encounters. Didn’t think you’d have done that well... look what I’m trying to get at is... is this gonna be a bad thing between us?”</i>");
	if (roxyNoVagSex())
	{
		output("\n\nNah, it won’t. There was a reason you decided to ream her the first time anyway. She glowers, unenthused at your back door joke. Her shoulders sink and she sighs, every muscle visibly loosening in her fuzzy body. <i>“Alright, yeah, that’s fine. At least now you have warning in case you knock me up or something. You are fertile right?”</i>");
		output("\n\nOh, yeah...");
		if (pc.cockTotal() > 1) output("\n\n<i>“And you’ve got two dicks... wouldn’t mind getting both of those sometime!”</i>");
		else ("\n\n");
		output("Roxy grins. <i> “Guess that means there’s always a chance for you to make me a stupid simpering pregnant slut, heh heh... right? I mean... if it’s not gonna trouble you or anything, but you,”</i> she leans closer, a passionate glint in her eye, <i>“have no idea how much I’d like that... if it were okay.”</i>");
	}
	if (pc.hasPerk("Infertile"))
	{
		output("\n\nYou explain that you are firing blanks, and could never impregnate her even if you tried. Even the ripest and most blessedly fertile pussy couldn’t bear life with your seed. After revealing that, Roxy’s shoulders sink and she sighs. <i>“Well, that’s a fucking sad life... not gonna be able to pass on your genes or anything...”</i>");
		output("\n\nShe shakes her head. <i>“Oh, fuck, sorry, I’m just being an asshole now. Well, that’s unfortunate, to say the least. Still... I’m always down for a fuck. Long as you don’t mind I act like a slut from time to time.”</i>");
		output("\n\nYou won’t.");
		output("\n\n<i>“Well... huh. Anything else on your mind, Steele?”</i>");
		
		processTime(5);
		clearMenu();
		addButton(0, "Next", roxyTalk, 1);
	}
	else
	{
		if (pc.virility() <= 0 && pregTri < 1)
		{
			output("No, it’s not going to be a problem, because unlike her <i>you</i> practice safe sex habits! She slaps you on the back and lets out a deep sigh. <i>“Damn, [pc.name], I don’t even know how to respond to that. Hey, better than some people, especially for a few unlucky laquines. Not being able to pass on your genes would fucking suck.”</i>");
			output("\n\nHer head shakes rapidly. <i>“Sorry, I’m being a jerk. Lemme know if you ever get tired of being on the pill, maybe we can give it a real shot now that we’re on the square... but... crap, yeah, I better not ask, the last place to take care of a litter’s in my home. Got nowhere to send them. Best you stay on whatever it is you’re on. I’m just sorry if you’re mad, I’m the one who got into a lazy habit.”</i>");
		}
		else
		{
			output("\n\nThat’s not important. Is she pregnant now?");
			//for jackasses that get her preg and then take sterilex...
			if (pc.virility() <= 0 && pregTri > 0 ) output(" You weren’t firing blanks at the time...");
			if (pregTri > 0)
			{
				output("\n\nRoxy pats her belly, and its circular surface gives away the onset of new life forming inside her.");
				output("\n\nShe then looks at you anxiously. <i>“Yeah... I’m sorry, if you’re mad or anything it’s my fault.”</i>");
			}
			else
			{
				output("\n\nRoxy pats her belly, and it’s looking as flat and taut as when you first met her. Nope. Doesn’t look like it...");
				output("\n\nShe then looks at you relieved. <i>“Not this time... I’m sorry, if you’re mad or anything it’s my fault.”</i>");
			}
		}
		if (pc.isBimbo())
		{
			output("\n\n<i>“It’s not a problem hunny-bun!”</i> you gleefully respond, not at all upset. Sure she didn’t tell you at first, but that’s no big deal! Dad left you just what you need out here in the galaxy. <i>“My dad left me a nursery, in case I ever made any miracles with anyone while I’m out and about!");
			if (pregTri > 0) output(" It even has an attached apartment, so you can go and rest up there if you need to!");
			output("”</i>");
			output("\n\nRoxy’s eyes cross into sharp points, in total disbelief as you go into more detail.");
		}
		else if (pc.isBro())
		{
			output("\n\n<i>“Don’t you worry about that,”</i> you say stoically, rubbing her stomach. <i>“I have a nursery, left to me by my father. Any children of mine can be moved there and taken care of until they’re of age.");
			if (pregTri > 0) output(" You can also get a room in the apartment, if you need it.");
			output("”</i>");
			output("\n\nShe looks a lot calmer now, especially as you go into detail.");
		}
		else if (pc.isNice())
		{
			output("\n\nYou take Roxy’s hand and squeeze, smiling broadly. <i>“I’m not upset, and I’m not afraid. I have a nursery to take care of any children I may bring into the galaxy, and I plan to take responsibility for them all. They’ll be taken care of, educated, protected...");
			if (pregTri > 0) output(" and you can move into the apartments there if you want to stay close.");
			output("”</i>");
			output("\n\nRoxy looks very close to tears after your explanation.");
		}
		else if (pc.isMischievous())
		{
			output("\n\nRoxy’s ears fold in deference when you pet them. The giggle you give makes her smile again. <i>“Well, it’s not an easy situation, but I’ve got it covered. See, I’ve got a nursery, and we can take care of our kids there. Any kids I have can be brought there. They’ll be safe, warm, educated, and cared for until they’re adults.");
			if (pregTri > 0) output(" Even got an attached apartment if you wanna get off Uveto for a bit. I could use a cute bun like you next door.");
			output("”</i>");
			output("\n\nShe blinks. Trepidation, awe, and happiness are sparking across her face.");
		}
		else
		{
			output("\n\n<i>“You should have said something, but that’s alright,”</i> you sigh. <i>“I’ve got a nursery. My kids can be taken there. Keeps track of them, gets them education, support, you name it.");
			if (pregTri > 0) output(" There’s an apartment up there you can use too. I’d rather you not carry my kids around this frozen hell.");
			output("”</i>");
			output("\n\nShe looks taken aback.");
		}	
		
		output("\n\n<i>“W-Wow... so there’s no reason to hold back!?”</i> She perks up and squeals. <i>“You can fuck me so hard as much as you want, and we can bring in lots of kids!?”</i>");
		output("\n\nWoah woah; you tell her to dial it back a bit.");
		output("\n\n<i>“Sorry, sorry... seriously, I am... but hey, I trust you, [pc.name]. I sure as hell trust the way you can breed me.”</i> She reaches into her pocket, pulling out a little PDA. <i>“Hook me up with your email address at any rate.");
		if (pregTri > 0) output(" I’ll probably take you up on that room and board.”</i>");
		else output(" That way if it does happen I can reach you.”</i>");
		
		output("\n\nAfter spelling out your contact information she hugs you tightly. <i>“Thanks, [pc.name].");
		if (pregTri > 0) output(" When I start getting heavy I’ll move in ASAP. Having a litter of bunnies on a frozen moon ain’t my idea of motherhood!”</i>");
		else output(" If we end up having kids I promise I’m not some deadbeat, brainless breeder. I’ll make any payment required, and I’ll visit often.”</i>");
		
		output("\n\nThat’ll have to do for now.");
		
		processTime(10);
		clearMenu();
			
		if (pregTri >= 0)
		{
			addButton(0, "Next", roxyTalk, 1);
		}
		else
		{
			output("\n\n<i>“But... if you want, I mean, coach gives us all some cheapo birth control, we can avoid kids if it’s not your thing. Just let me know, alright? I don’t wanna lose out on how good you make me feel either way.”</i>");
			output("\n\nYou’ll let her know.");
			addButton(0, "Next", roxyTalk, 1);
		}		
	}
}
public function roxyTalkContraceptives():void
{	
	clearOutput();
	showRoxy(false, true);
	
	if (flags["ROXY_STERILEX"] == 1)
	{
		output("You bring up Roxy’s contraceptive use, and ask aloud how eager she is to get off the birth control.");
		output("\n\n<i>“Fucking ecstatic, if it’s for you, [pc.name]. Knowing that I could get pregnant at any time is what makes sex so great, especially with an animal like you!”</i>");
		output("\n\nWill you ask Roxy to go off birth control?");
		
		processTime(1);
		clearMenu();
		addButton(0, "Yes", roxyTalkContraceptivesYes);
		addButton(1, "No", roxyTalkContraceptivesNo);
	}
	else
	{		
		output("You ask the bunny-jock if she’s still carrying around any pregnancy preventatives.");
		output("\n\n<i>“Ayup,”</i> she beams, <i>“guess you don’t wanna try for kids? I can start taking it, if you really want. It’s free to athletes anyway...”</i>");
		output("\n\nWill you ask her to go on the pill?");
		
		processTime(1);
		clearMenu();
		addButton(0, "Yes", roxyTalkContraceptivesYes);
		addButton(1, "No", roxyTalkContraceptivesNo);
	}	
}
public function roxyTalkContraceptivesYes():void
{	
	clearOutput();
	showRoxy(false, true);
	
	if (flags["ROXY_STERILEX"] == 1)
	{
		output("<i>“Fuck yes... thank you, [pc.name]!”</i> she fist pumps. <i>“Just give it a day to wear off, and we can start trying again!”</i>");
		output("\n\n<b>Roxy is now fertile.</b>");
		flags["ROXY_STERILEX"] = 0;
	}
	else
	{
		output("<i>“Alright, [pc.name]... if it’s for you, it’s worth it. Here’s to wet but sabotaged, unfulfilling pussy...”</i> she drones, immediately throwing one pill back and gulping.");
		output("\n\n<b>Roxy is now infertile.</b>");
		flags["ROXY_STERILEX"] = 1;
	}
	
	processTime(3);
	clearMenu();
	addButton(0, "Next", roxyTalk, 1);
}
public function roxyTalkContraceptivesNo():void
{	
	clearOutput();
	showRoxy(false, true);
	
	if (flags["ROXY_STERILEX"] == 1)
	{			
		output("<i>“Damn...”</i> she sighs. <i>“Oh well, your call. Just let me know when I can be your useless, milky laquine broodmother.”</i>");
		output("\n\n<i>“Fucking tease.”</i>");
	}
	else
	{
		output("<i>“Would that I could throw it out, but my coach insists. Well... if you don’t wanna try for kids, just let me know. ‘Til then, I’m gonna try and get as many as I can.”</i> She winks.");
	}
	
	processTime(1);
	clearMenu();
	addButton(0, "Next", roxyTalk, 1);
}
public function roxyTalkChildren(loc:int=0):void
{	
	clearOutput();
	showRoxy(false, true);
	var sel:Array = [];
	var i:int;
	var rn:int;
	var kidName:String;
	var kidSex:String;
	var kidMale:Boolean = false;
	var numLitters:int = roxyGetNumLitters();
	var pregTri:int = roxyPregTrimester();
	var inNursery:Boolean = roxyIsInNursery();
	var firstTime:Boolean = true;
	if (flags["ROXY_TALK_CHILDREN"] == 1) firstTime = false;
	flags["ROXY_TALK_CHILDREN"] = 1;
	
	
	if (pc.isBimbo()) output("<i>“You see our little happy bunnies lately?”</i> you simper.");
	else if (pc.isBro()) output("<i>“Been to the nursery recently?”</i> you ask.");
	else if (pc.isNice()) output("<i>“How are our kids doing, Roxy?”</i> you inquire.");
	else if (pc.isMischievous()) output("<i>“Do any child rearing in the past week or two?”</i> you smirk.");
	else output("<i>“Been back to our kids yet?”</i> you murmur.");
		
	if (inNursery)
	{
		output(" Roxy puts down what’s in her hand and clasps her fingers together in deep though. <i>“Odd question, you could just look at ‘em, you know?”</i>");
		output("\n\nYes, but she <i>is</i> the mom around here...");
		output("\n\n<i>“Yeah yeah, I see your point. Oh boy what has been going on, hmmm...”</i> she monologues.");
	}
	else
	{
		output(" Roxy kicks her legs upwards and straddles the bench, looking at you and drumming her hands to the sides of the bench. <i>“Yep,”</i> she says flatly, a chaste smile beaming across. <i>“Checking in on the mom, huh?”</i>");
		output("\n\nIn a manner of speaking.");
		output("\n\nBoth ears flopping, Roxy inhales.");
	}
	if (firstTime)
	{
		output("\n\n<i>“They’re doing great!”</i> she booms, shouting you down with positive, maternal energy. <i>“I’ve got Briget on speed dial, and I’ve gotten Charlie to give me a day off every week to go see ‘em. I kinda feel bad that I’m not there all the time, you know?”</i> She rocks back and forth, humming quietly. <i>“But I’ve got a job to do. Can’t be a deadbeat mom now. Can’t be a deadbeat just because it’s coming out of your company’s wallet.”</i>");
		output("\n\nShe smirks. <i>“That is a nice bonus, to be honest.”</i>");
		output("\n\nYour bun stops, scratches her cheek. An uncharacteristic sheepishness crawls all over her muzzle. <i>“But I still send as much money as I can.”</i>");
		output("\n\nConfused, you tell her that sending money isn’t necessary. The nursery is operating at efficiency and, like she just said, Steele Tech is dealing with the bureaucracy. Even more than that, you don’t want her having to live paycheck-to-paycheck.");
		output("\n\nHer cheeks puff up, <i>“It makes me feel better, alright?”</i>");
		output("\n\nShe exhales. <i>“I have to know that what I’m doing is helpful. I have to know that I’m actually doing something to help. And you never have enough credits right?”</i>");
		if (pc.credits >= 500001) output("\n\nYou choose to say nothing, thinking about what sum you have now...");
		else output("\n\nYou simply shrug your shoulders.");
		output("\n\n<i>“Anyway, don’t forget to visit them yourself. Maybe we’ll see each other.”</i> Roxy leans forward to kiss you on the nose. <i>“They will miss you... and so will I.”</i>");
		output("\n\nYou clutch her paw and promise to make that time.");
	}
	else
	{	
		sel.push(1);
		sel.push(2);
		if (flags["ROXY_PREG_TIMER"] == undefined) sel.push(3);
		if (numLitters > 1) sel.push(4);
		if (numLitters > 1) sel.push(5);
		if (numLitters > 2) sel.push(6);
	
		i = sel.length;
	
		if (i > 0)
		{
			rn = rand(i);
		}
		
		if (sel [rn] == 1)
		{
			kidSex = roxyGetKidSex(-1);
			kidName = roxyGetKidName(-1,kidSex);
			output("\n\n<i>“Well, " + kidName + "’s been fighting for attention a lot. It’s not that big but since you asked, I’ve been having to baby that little " + (kidSex == "M" ? "boy" : "girl") + ", just won’t stay away from his mom! Hope he isn’t growing up to be the bashful type, because I don’t want any of my kids feeling weak, scared, or helpless...”</i>");
			output("\n\nYou’ll have to keep your eye on the floppy-eared scamp, too.");
			output("\n\n<i>“That’s all I’ve got to say at the moment, haha, I dunno what you wanted but that’s the scoop. What matters is they’re all doing well, right?”</i>");
		}
		else if (sel [rn] == 2)
		{
			kidSex = roxyGetKidSex(-1);
			kidName = roxyGetKidName(-1,kidSex);
			output("\n\n<i>“I’ve been having some problems keeping " + kidName + " out of... uh, well, not me, Briget really. " + (kidSex == "M" ? "He" : "She") + "’s not being bad or anything but we’ve got a little explorer on our hands, and " + (kidSex == "M" ? "he" : "she") + " really likes sticking " + (kidSex == "M" ? "his" : "her") + " little nose in places " + (kidSex == "M" ? "he" : "she") + " shouldn’t be going.”</i> Roxy pauses to laugh. <i>“We’ve got a hide and seek champion in the making, I think. When I was there took me a goddamn hour to find " + (kidSex == "M" ? "him" : "her") + ", and where else but hiding under <b>your</b> bed!”</i>");
			output("\n\nThat sounds a lot like your children. Maybe " + kidName + " is inheriting a little Steele?");
			output("\n\n<i>“Aw fuck, don’t give me conniptions!”</i> your bun waves off. <i>“Anyway, they’re doin’ good. I love ‘em. Nothing much else to say right now!”</i>");
		}
		else if (sel [rn] == 3)
		{
			output("\n\n<i>“Been making a lot of toys recently, and my team keeps giving me shit for it. I’m kinda hoping you get me pregnant again just so I can knock that douchey grin off Charlie’s face again. Hadn’t been knitting for a while but having kids has given me a lot of time to get really good. Last time I was there, they loved all the new toys I brought, and... yeah, sorry it’s not much more interesting than that. Sometimes parenthood’s a little mundane, you know?”</i>");
			output("\n\nBoy, that’s true.");
			output("\n\n<i>“Everybody’s a healthy boy and girl, [pc.name]. Don’t worry about a thing. You do what you have to do and I’ll just keep visiting and stuff!”</i>");
		}
		else if (sel [rn] == 4)
		{
			output("\n\n<i>“Hehe, our family’s grown a lot. " + num2Text(numLitters, true) + " pregnancies, " + num2Text(numLitters) + " litters...");
			if (flags["ROXY_PREG_TIMER"] != undefined) output(" and now a " + num2Ordinal(numLitters + 1) + " on the way! Y");
			else output(" y");
			output("ou have no idea how much I love that you love me.”</i> She tilts her head left and right, rattling her brain for something to respond with. <i>“For some reason they know how to organize in a big group like that. Don’t ask me how, but I swear they’re going to get more rebellious as they get older. I’m actually kinda scared, I don’t want any of them fighting. Sibling rivalry’s good and all - was for me anyway - but I hope they don’t come to step on each other or anything...”</i>");
			output("\n\nYou’ll have to do your best to steer them away from such tendencies. For now, they’re just a bunch of tykes who like smiling and laughing! Best to focus on that rather than the future paranoias, right?");
			output("\n\n<i>“Yeah... Well, all’s good otherwise. Was just feeling a bit nervous. You take care of yourself okay?”</i>");
			output("\n\nA stroke to the cheek sets Roxy right.");
		}
		else if (sel [rn] == 5)
		{
			kidSex = roxyGetKidSex(-1);
			kidName = roxyGetKidName(-1,kidSex);
			output("\n\n<i>“Last time I was there, man, you would not believe what they all get up to. Having had " + num2Text(numLitters) + " litters of kids, like, damn. Hope they don’t go setting up a hierarchy or anything, but it’s really nice to see them all connecting and bonding. Being an only child would just suck ass. No brothers or sisters to lean on, nobody to have your back, nobody to play with... damn, it actually makes me kinda sad to think about, especially since we’re both not full-time parents!”</i>");
			output("\n\nThat’s probably not the most positive thing she’s had to say...");
			output("\n\n<i>“Huh? Oh, well, ummm, " + kidName + "... I almost wanted to spank " + (kidSex == "M" ? "him" : "her") + "! Throwing stuff everywhere, laughing when we clean it up! Bad behavior!”</i> She folds her arms in a cute manner.");
			output("\n\nShe softens up after a nice, long kiss though.");
		}
		else if (sel [rn] == 6)
		{
			output("\n\n<i>“You know, I really don’t know what to say. You’ve gotten me pregnant so many times at this point I feel like I may end up losing track of my kids. But hell, it’s the hottest thing I could think of.”</i> Roxy looks at you, flashing an expression that is strangely arousing. <i>“I mean... just fucking me stupid, knocking me up until I’m just a useless den mother who only exists to spread her legs and keep having kids... fuck that’s hot. The things you do to me-”</i>");
			output("\n\nShe stops herself, shaking her head. <i>“Sorry, I guess I should save that talk for when I’m getting some, right? Anyway, don’t you go worrying your head off. My sexual thrills aside, I ain’t forgetting a single name. However big you want this family, let’s fucking do it.”</i> She hops forward to hug you, to bring her dusky lips close to your ear. <i>“Emphasis on ‘fucking’...”</i>");
			output("\n\nHo boy. You’ll let her know -- for now, she simply slides off you, winking temptingly...");
		}
		//safety catch
		else
		{
			kidSex = roxyGetKidSex(-1);
			kidName = roxyGetKidName(-1,kidSex);
			output("\n\n<i>“Well, " + kidName + "’s been fighting for attention a lot. It’s not that big but since you asked, I’ve been having to baby that little " + (kidSex == "M" ? "boy" : "girl") + ", just won’t stay away from his mom! Hope he isn’t growing up to be the bashful type, because I don’t want any of my kids feeling weak, scared, or helpless...”</i>");
			output("\n\nYou’ll have to keep your eye on the floppy-eared scamp, too.");
			output("\n\n<i>“That’s all I’ve got to say at the moment, haha, I dunno what you wanted but that’s the scoop. What matters is they’re all doing well, right?”</i>");
		}
	}
	processTime(10);
	clearMenu();
	if (loc == 1) addButton(0, "Next", roxySpareAptTalk, true);
	else if (loc == 2) addButton(0, "Next", roxyCafeteriaTalk, true);
	else addButton(0, "Next", roxyTalk, 1);
}
public function roxyTalkLeave():void
{	
	clearOutput();
	showRoxy(false, true);
	
	var	kidSex:String = roxyGetKidSex(-1);
	var kidName:String = roxyGetKidName(-1,kidSex);
	var numLitters:int = roxyGetNumLitters();
	
	output("You tell Roxy that you’ve gotta go, and she nods swiftly. <i>“No prob, [pc.name],”</i> Roxy waves.");
	if (numLitters > 0) output(" <i>“Say hi to " + kidName + " for me! " + (kidSex == "M" ? "He" : "She") + " needs to be spoiled a bit!”</i>");
	output("\n\nYou wave back, heading to the center of the room.");
	
	processTime(1);
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}
public function roxySex():void
{	
	clearOutput();
	showRoxy(false, true);
	var pregTri:int = roxyPregTrimester();
	var firstTime:Boolean = true;
	if (flags["ROXY_TALK_SEX"] == 1) firstTime = false;
	flags["ROXY_TALK_SEX"] = 1;
	
	var kok:int = 0;
	
	if (!pc.hasCock() && !pc.isTaur())
	{
		flags["ROXY_TALK_SEX_NODICK"] = 1;
		//used to have one but not now...
		if (flags["ROXY_SEX"] > 0)
		{
			output("With as much obviousness as is possible given the circumstances, you put a [pc.hand] on Roxy’s paw, asking her if she’s ready for another go. Without so much as a grunt she’s groping at your crotch all over again, a simmering expression gradually freezing over with dismay.");
			output("\n\n<i>“Wait, where’s your dick? I’d gotten used to there being something here...”</i> she says, voice dripping disappointment. You’ve no choice but to tell her your dick’s gone, and hope that she’s still interested.");
			output("\n\nIt’s your turn to feel let down. <i>“Sorry, [pc.name], but I just don’t get any enjoyment out of pinching buttons, ‘ya know? I like someone giving it to me hard and fast. Lemme know if you get another.”</i>");
			output("\n\nDamn.");
		}
		else
		{
			output("Roxy’s paw is planted firmly in the space between you and her. Making your intentions obvious, you place your [pc.hand] on hers and ask if she was really joking around when she said she was easy. Her words, not yours.");
			output("\n\n<i>“Heh heh,”</i> she grins. <i>“Sure am.”</i> Her right arm speeds towards your crotch.");
			if (pc.hasVagina()) output(" Parting the lips of your [pc.pussyNoun 0], she roughly brushes [pc.oneClit], making you squeak on the spot.");
			output(" <i>“...But only for guys and gals packing real heat.”</i>");
		
			if (pc.isBimbo()) output("\n\n<i>“Aww!”</i>");
			else if (pc.isBro()) output("\n\n<i>“You’re kidding.”</i>");
			else if (pc.isNice()) output("\n\n<i>“That’s a shame...”</i>");
			else if (pc.isMischievous()) output("\n\n<i>“That’s no fun!”</i>");
			else output("\n\n<i>“Really?”</i>");
		
			output("\n\n<i>“Ayup, sorry");
			if (pc.tallness >= 69) output(" big ");
			else output(" play-");
			output("[pc.guyGirl],”</i> she pulls back");
			if (pc.hasVagina()) output(" just as you were getting oiled. The disappointment doesn’t prickle you as much as the desire for more of her fingerwork, how can she just- fuck! Oh well...");
			else output(". Oh well...");
		}
	}
	else if (pc.isTaur())
	{
		//wasn’t a taur before but now...
		if (flags["ROXY_SEX"] > 0)
		{
			output("<i>“You know, I thought something was off, but you went and changed your body around, [pc.name],”</i> Roxy arches an eyebrow in your direction, giving you a disappointed look. <i>“I can at least guess at that look, but let me stop you there. I like getting with people on my level,");
			if (pc.hasCock()) output(" sorry to say that I don’t feel good taking it from someone of your current style.”</i>");
			else output(" and you don’t have a dick anymore either...”</i>");
			output("\n\nHead lowering, you sigh and shrug.");
			output("\n\n<i>“Yeah, I don’t mean to be rude... but that’s just what I want out of a partner. You could always go find one of the racers. I’ve seen how they fuck once or twice; be right up your alley.”</i>");
		}
		else
		{
			output("No sense beating around the bush, and Roxy, in her own words, said she’s easy. You grip her paw and ask if she’s interested in a little break-time rendezvous. A knowing, erotic expression formed, only to quickly dissipate the more she looked you over.");
			output("\n\n<i>“Not to sound weird or anything, and I think you’re nice and all, but I prefer sex with people on my level.");
			if (pc.hasCock()) output(" And I don’t like my odds of being on the end of a dick from someone your style.”</i>");
			else output(" And I like being on the end of a dick, which, well, I can tell you’re not packing.”</i>");
			output("\n\nYou sigh disappointedly.");
			output("\n\n<i>“Sorry, Steele. You’d do better flirting with one of the racers. They’re always so backed up after a few rounds.”</i>");
		}		
	}
	else if (pc.hasCock() && flags["ROXY_TALK_SEX_NODICK"] == 1)
	{
		flags["ROXY_TALK_SEX_NODICK"] = undefined;
		output("<i>“You said you’d be down if someone was packing ‘real heat’...”</i> you grin, guiding Roxy’s paw to your crotch. You don’t have to take her all the way before she’s");
		if (pc.isCrotchExposed()) output(" wrapping her hand around your erecting [pc.cockNoun].");
		else output(" grope-fucking your bulge.");
		output("\n\n<i>“Damn straight I did, and I can feel it already...”</i> she happily replies. <i>“Thinking of putting it to use yet? Hey, since this is new... does that mean I get to take this for its first ride?”</i>");
		if (pc.hasVirginCock()) output("\n\nYes, yes it does!");
		else output("\n\nYou’ll leave that a mystery for now...");
		output("\n\n<i>“How’re we gonna do this, sweetcheeks?”</i> she asks. <i>“I don’t think you’re gonna be holding this back now!”</i>");
	}
	else if (firstTime)
	{
		output("Glancing downward, you see Roxy’s paw splayed out on the bench between you two, inching ever slightly closer. If you didn’t know better you’d probably miss a lusty laquine’s cue. When her knuckles lurch again you drop your palm on them and <i>squeeze,</i> flashing a grin at the same time she does.");
		output("\n\n<i>“Right,”</i> you start, locking your [pc.eyes] to hers, <i>“what was that about you being easy?”</i>");
		output("\n\n<i>“Worst kept secret here,”</i> Roxy snickers, springing up. In the same motion, her right arm surges for your crotch");
		if (!pc.isNaga()) output(", diving between your [pc.thighs]");
		output(". The sporty-bun’s finger-strokes to your");
		if (!pc.isCrotchExposed()) output(" underwear-tenting");
		output(" [pc.cocksLightIsAre] rough and delightfully arousing, leaving nothing to the imagination of a few passers-by who spot the act.");
		output("\n\n<i>“Think I can help you warm up for the next game,”</i> you manage to force out, <i>“I have a ship-”</i>");
		output("\n\n<i>“No.”</i> Roxy grips your half-erect boner tightly; the inches adding to its throbbing shape spread her vice wider. <i>“Getting dressed for the cold, waiting in an elevator for an hour, taking it all off... doing all that twice sounds like effort better spent right ‘here’,”</i> she smiles, jacking your burgeoning shaft from neck to [pc.knotOrSheath " + kok + "]. <i>“Cold kills my mood, and there’s plenty of places around here to get steamy.”</i> She closes the distance, bumping hard into your shoulder. <i>“And I know ‘em all.”</i>");
		output("\n\nHer ardor makes you wonder if she’s pounce on you right here, right now. <i>“So what’re you signing up for?”</i>");
	}
	else
	{		
		output("In the tried-and-true manner, you signal your horniness to Roxy with a paw-squeeze and shoulder-rub. <i>“You look like you could use a warm-up.”</i>");
		output("\n\nShe’s pushing back right away, matching your bottled up desires with a toothy snicker. <i>“Careful [pc.name], I know that kinda touch all too well,”</i> she purrs, cheeks raising. <i>“What’s on the agenda?”</i>");
	}
	
	processTime(3);
	clearMenu();
	if (pc.hasCock() && !pc.isTaur())
	{
		if (pc.cockThatFits(roxy.vaginalCapacity(0)) >= 0)
		{
			if (flags["ROXY_DOGGY_VAG"] == undefined && flags["ROXY_DOGGY_ANAL"] == undefined && flags["ROXY_DOGGY_DP"] == undefined) addButton(0, "Doggystyle", roxySoxyTakesYourCoxyInHerBoxy, true, "Doggystyle", "What better way to break the ice?");
			else addButton(0, "Doggystyle", roxySoxyTakesYourCoxyInHerBoxy, false, "Doggystyle", "Good old doggystyle.");
			
			if (flags["ROXY_IDEA"] == -1)
			{
				if (pregTri > 1)
				{
					if (flags["ROXY_MISSIONARY"] >= 1) addDisabledButton(1, "Missionary", "Missionary", "It’d be hard to fuck Roxy like this with her belly in the way, and knowing what she likes, this’d be too strenuous for her children!");
					else addDisabledButton(1, "Idea", "Idea", "You will have to wait until she is less pregnant to do this.");
				}
				else if (flags["ROXY_MISSIONARY"] >= 1) addButton(1, "Missionary", roxySexMissionaryPrep, undefined, "Missionary", "Fuck Roxy missionary style. Or rather, ‘Roxy Style’. She’ll be guiding your dick with a collar on your neck. Could be strenuous!");
				else addButton(1, "Idea", roxySexIdea, undefined, "Idea", "Roxy wanted to try something new. Humor her.");
			
			}
			else addDisabledButton(1,"???");
		 
			if (flags["ROXY_SEX"] >= 3) addButton(2, "Cowgirl", roxySexCowgirl, undefined, "Cowgirl", "Save a horse, ride a Steele.");
			else addDisabledButton(2, "???");
			
			if (roxyGetNumLitters() >= 1)
			{
				if (flags["ROXY_BJ"] >= 1) addButton(3, "Get Blown", penisRouter,[roxySexQuickie,99999,false,0], "Get Blown", "See if Roxy’ll bend the rules of privacy for another oral experience!");
				else addButton(3, "Quickie", penisRouter,[roxySexQuickie,99999,false,0], "Quickie", "See if Roxy’s up for something quick and rough.");
			}
		}
		else
		{
			addDisabledButton(0,"Doggystyle","Doggystyle","You can’t fuck Roxy with your size! Even laquines have their limits!");
			if (flags["ROXY_IDEA"] == -1 && flags["ROXY_MISSIONARY"] >= 1) addDisabledButton(1, "Missionary","Missionary","You can’t fuck Roxy with your size! Even laquines have their limits!");
			else if (flags["ROXY_IDEA"] == -1) addDisabledButton(1, "Idea", "Idea", "You can’t fuck Roxy with your size! Even laquines have their limits!");
			else addDisabledButton(1, "???");
			if (flags["ROXY_SEX"] >= 3) addDisabledButton(2, "Cowgirl", "Cowgirl", "You can’t fuck Roxy with your size! Even laquines have their limits!");
			else addDisabledButton(2, "???");
			if (roxyGetNumLitters() >= 1)
			{
				if (flags["ROXY_BJ"] >= 1) addButton(3, "Get Blown", penisRouter,[roxySexQuickie,99999,false,0], "Get Blown", "See if Roxy’ll bend the rules of privacy for another oral experience!");
				else addButton(3, "Quickie", penisRouter,[roxySexQuickie,99999,false,0], "Quickie", "See if Roxy’s up for something quick and rough.");
			}
			addButton(4, "Back", roxyGreet);
		}
	}
	else addButton(4, "Back", roxyGreet);
	
}
//doggystyle, named as requested by William :)
public function roxySoxyTakesYourCoxyInHerBoxy(firstTime:Boolean=false):void
{	
	clearOutput();
	showRoxy(false, true);
	if (flags["ROXY_IDEA"] != -1) IncrementFlag("ROXY_IDEA");
	
	var blurb:int = rand(3);
	
	if (firstTime) 
	{
		output("You want her on all fours baring her butt for your crotch. Those weren’t your exact words, but that’s what she heard.");
		output("\n\n<i>“Speaking my language, Steele...”</i> she purrs, hoisting her bag. <i>“Got just the place for a dirty [pc.guyGirl] like you. We’ll do our ‘warm up’ in the Pinup Punk’s locker room; they’ll give us space.”</i> And if they don’t? <i>“You let me worry about that, champ,”</i> she giggles, pulling you off the bench by your wrist.");
		output("\n\nYou can’t help but");
		if (pc.exhibitionism() >= 33) output(" perk up at the idea");
		else output(" get slightly pale at the idea");
		output(", neglecting to ask if she really intends to fuck right in front of her teammates.");
		
		output("\n\nHeld by the [pc.arm] you’re drawn deeper into the stadium through the assorted crowds and celebrities. Roxy leads you down corridors way too big and long, the energizing trek ending at a door simply marked <i>Locker Room</i>. The tail-wagging bun lets you go long enough to fumble with a card and swipe it impatiently at the reader. A blast of simmering, foggy white air washes over you when it slides noisily to the left.");
		output("\n\nRoxy then tugs you into the combined locker <i>and</i> shower room.");
		output("\n\nGiven the mess of discarded clothes, the aptly-named Punks don’t seem to be ones for cleaning up. Blue lockers line the room with various crude messages and doodles scribbled on them. Bathroom stalls delineate the left wall and the entirety of its other half is dedicated to hygiene modest and immodest.");
		if (pc.isNude()) output(" Good thing you were already undressed, because it’s like you’re not on Uveto anymore.");
		else output(" Just standing here is making you want to strip down.");
		
		output("\n\nA booming laughter breaks the white noise of hissing water. <i>“Ay, Rox’ brought a " + pc.mf(" dude"," chick") + "!”</i> a statuesque gryvain woman announces, the viridian scales on her muscly thighs clinking in a presenting motion.");
		output("\n\n<i>“Oh, wow!”</i> chirps a smaller kaithrit, both chestnut tails clicking and wrapping around her own waist.");
		output("\n\n<i>“Don’t act so thrilled. She does this a lot,”</i> dismisses a... well you’re not sure <i>what</i> she is.");
		output("\n\nThe noisy girls chatter away, their dialogue ranging from catcalls to out-loud thoughts about sticking around to watch. They’re all in varying states of undress, not a hint of shame to be found in the presence of you, a complete stranger.");
		if (pc.libido() >= 66 || pc.isBimbo() || pc.isBro()) output(" You’re almost considering asking them to join in. You’d love to see how that stacked gryvain could handle a dick, not to mention that... uh, that girl with the big tongue!");
		else if (pc.libido() >= 33) output(" You’re not feeling much shame either. Why would you, when you’re surrounded by three attractively toned beauties?");
		else output(" You can’t quite say the same, but that gryvain lady has boobs she could smother someone’s head in...");
		
		output("\n\nRoxy taps her foot to the ground like a scolding mom, folding her arms and clearly not having any of this. <i>“Alright, pipe down. I’m taking over the place.”</i> She jabs a thumb to the door. <i>“Get out. Don’t try and cockblock me,”</i> she laughs, <i>“you won’t like what happens.”</i>");
		output("\n\n<i>“It’s like you’re asking me to try!”</i>");
		output("\n\n<i>“No. Out, girl.”</i> Roxy snags a nearby towel and playfully cracks it off the kaithrit’s waist.");
		output("\n\nDespite their bellyaching, you can see that Roxy and her team share a deep enough camaraderie to rib each other, and are friendly enough they get dressed with a soldierly diligence, high five Roxy on their way, and clear out like they were never here. The brown-bunny gives you a goofy smile, <i>“I love those gals. They bring in guys and babes too so it ain’t too weird for us give up the locker room.”</i>");
	}
	else
	{
		output("Doggystyle, just like your first time.");
		output("\n\n<i>“Hrmmm,”</i> Roxy husks in your [pc.ear], <i>“that’s what I’m talking about, [pc.name]. No sense in holding this bad boy up.”</i> She rubs over your");
		if (pc.isCrotchExposed()) output(" erecting [pc.cocksLight]");
		else output(" bulging-out [pc.cocksLight]");
		output(". <i>“You’re gonna need to get a bit harder for me though. Don’t worry, I’ll coach you through it.”</i>");
		output("\n\nEven though you might know your way around, she’s still leading you on with a bounce to her lapine step, dragging you down the corridors all-too-eager for another go. Time passes by in the kind of adrenaline-fueled blur she probably enjoys in the middle of a game. The sweaty air of a steamy shower room is soon washing over your [pc.skinFurScalesNoun], and you find yourself back in the Punks’ locker room.");
		
		if (blurb == 0) output("\n\n<i>“Hey Roxy!”</i> the gryvain calls. <i>“Hey Rock-seee!”</i> sings the kaithrit. Your laquine companion doesn’t have to say anything, merely flick thumb and neck towards the door, and her team are out before you know it.");
		else if (blurb == 1) output("\n\nHer teammates are curiously absent this time, but they’ve left behind all their gear as usual. Must be nice only having to worry about where your feet are and not your belongings!");
		else output("\n\n<i>“Back for another round, stranger?”</i> asks the girl with a modified form you can’t identify. <i>“Oh well, was just leaving anyway,”</i> she says, shutting a locker on her way to the door. <i>“Try not to make a mess.”</i>");
		
		output("\n\nGoofily grinning the grinniest grin, your bunny-girl looks you up and down, already shucking her kit now that the peanut gallery’s vacated.");
	}
	processTime(15);
	clearMenu();
	addButton(0, "Next", roxySoxyTakesYourCoxyInHerBoxyNext, firstTime);
}

public function roxySoxyTakesYourCoxyInHerBoxyNext(firstTime:Boolean=false):void
{	
	clearOutput();
	showRoxy(true, true);
	
	var steeleTone:int = 0;
	if (pc.tone >= 75) steeleTone = 2;
	else if (pc.tone >= 50) steeleTone = 1;
		
	output("Roxy only needs a second to unzip her hoodie and fling it at your head;");
	if (pc.RQ() >= 60) output(" you reflexively swat the airborne article away, earning a tiny facial tic of praise from the laughing laquine.");
	else output(" the airborne article lands clean on your face, filling your nostrils with a few days worth of bunny-girl sweat scent. You toss it aside with a huff, meeting the laughing laquine’s hooding eyes.");
	
	output("\n\nFlicking her hips side to side, Roxy shimmies out of her denim shorts, and the small strings of her tight black thong fill out into the garment at large. Or small, really.");
	output("\n\nSwaying left and right, she kicks her shoes off in your direction with a flourish and a snerk, but the footwear’s aimed well away from your [pc.legOrLegs]. When they rebound off the metal cabinets, you mind where they land and get back to watching her rocking hips.");
	output("\n\n<i>“Hey, help me with my top, will you?”</i> Roxy invites, already fidgeting at her bikini bra. When you [pc.walk] over, she swirls around in a natural movement, slamming her butt into your crotch and sheathing");
	if (!pc.isCrotchExposed())
	{
		if (pc.cockTotal() > 1) output(" the bulges of");
		else output(" the bulge of");
	}
	output(" [pc.eachCock] in the caramel-colored cleavage of her ass.");
	if (firstTime) output(" You grunt, and your [pc.fingers] jut outwards in sudden stimulation");
	else output(" You catch her by her muscle-packed waistline, humping in the opposite direction");
	output(", all while her soft fur nuzzles your [pc.cockType] meat into raw and ready ableness.");
	
	output("\n\n<i>“Eager?”</i> Roxy smiles at you over her shoulder, ");
	if (pc.tallness >= 69) output(" looking up");
	else if (pc.tallness == 68) output(" glancing at you");
	else output(" glancing down");
	output(" with the sexiest look on her face. From the way she’s working her deliciously wide thighs, she’s already panting, and you can see (and hear) the beginnings of excitement slipping out of her mouth in pleasant-sounding grunts and groans.");
	
	output("\n\nAll it takes is a firm yank and the spaghetti-string garment floats to the floor on humid wind. That act bids Roxy to turn, agile fingers");
	if (!pc.isChestExposed()) output(" already fidgeting with your kit, freeing your [pc.chest] one piece at a time");
	output("; dark nipples grow erect before your eyes. Tender caresses begin at one of your shoulders, drawing across your");
	if (steeleTone == 2) output(" muscly");
	else if (steeleTone == 1) output(" firm");
	else output(" soft");
	output(" neckline, exploring your body. Her lips part into an exhilarated ‘O’ the more she squeezes and gropes.");
	
	if (pc.hasTits()) 
	{
		output("\n\nThe sporty-bun cups your [pc.breasts] together to lift them, her rough fondlings making you whimper and squirm. The jock-rabbit’s fingers sink into your plush mounds, making you twitch with the slightest movements. In an instant she releases her grip, watching them");
		if (pc.biggestTitSize() >= 15) output(" flop wildly");
		else if (pc.biggestTitSize() >= 5) output(" drop heavily");
		else output(" wobble pertly");
		output(" without support, delighting in the jiggly shuddergasm she sets off in you. <i>“Damn, [pc.name]... you’re definitely more sensitive than I am!”</i> she exclaims, pinching a [pc.nipple]");
		if (pc.isLactating()) output(", only to let out a surprised ‘oooh’ when an arc of [pc.milk] shoots out into her absorbent pelt");
		output(".");
	}
	output("\n\nRoxy’s hands touch down on your belly, and you’re left gasping from her massages. It’s almost like a current is passing through your nervous system, and it loops until your gut is swimming in pleasure, all the vulnerabilities in your physique marked with goal posts in advance of a full-frontal frolic.");
	if (firstTime)
	{
		if (steeleTone == 2) output(" <i>“Lookin’ to impress someone?”</i> she asks, slapping her palm off your [pc.belly]. <i>“Because it’s working. I’m gonna give you one free tip: I’m <b>three times</b> the usual laquine when it comes to sex. Not sure if you fucked one before, but you’re in for it now.”</i>");
		else if (steeleTone == 1)
		{
			output(" <i>“Nice, good to know you’re not a flimsy");
			if (pc.tallness <= 62) output(" little");
			output(" [pc.raceCuteShort],”</i> she giggles. <i>“When I fuck, I’m <b>three times</b> the regular rabbit.”</i> A mischievous expression blossoms on her lapine features. <i>“Even this may not be enough though. That’s okay, you’ll get a good work out.”</i>");
		}
		else output(" <i>“Hmmm...”</i> She sounds mildly disappointed. <i>“Hope you’ve got something underneath this softness,”</i> she giggles. <i>“If you’ve ever fucked a laquine before- eh, let me put it this way: when it comes to sex, <b>I’m three times</b> the usual laquine. It’ll be a good workout for you, Steele. Maybe a good learning experience!”</i>");
	}
	else if (flags["ROXY_TONE"] != undefined && flags["ROXY_TONE"] != steeleTone)
	{
		if (steeleTone == 2) output(" <i>“Been hitting the gym, [pc.name]? Great results. Now you might actually hold your own with me!”</i> she laughs.");
		else if (steeleTone == 1)
		{
			if (flags["ROXY_TONE"] > steeleTone) output(" <i>“Lost some definition... hope you’re not developing a bad habit, [pc.name]. Still, good enough for me.”</i> she huffs.");
			else output(" <i>“Oohh, feeling a little bit firmer there, [pc.name]. Wonder if you did that for me...”</i> she huffs.");
		}
		else output(" <i>“Get some bad habits, [pc.name]? All soft and mushy now, like you’ve been hitting the energy drinks too hard. Hope you don’t think that means I’m gonna go easy on ‘ya.”</i> she grins.");
	}
	else
	{
		if (steeleTone == 2) output(" <i>“Rock hard, rock steady. Bet you love it when someone’s ass is bouncing off this,”</i> Roxy claps her digits across your abdominals. <i>“I love it, too.”</i>");
		else if (steeleTone == 1) output(" <i>“Seems about right, I swear this little guy’s gotten stronger though,</i> she pinches one of your flexing belly-muscles hard enough to make you flinch, then rubbing her palm over it towards your [pc.cocksLight]. <i>“Isn’t sex great? Building stamina, technique, and muscle too!</i>");
		else output(" <i>“Feels a teeeeensy bit stronger than last time. Hope you’ve got the same strength as before, ‘cause I’m not going easy on you, [pc.name].</i>");
	}
	
	output("\n\nThe moist rabbit");
	if (pc.tallness >= 69) output(" lifts herself to the tips of her toes in order to wrap her arms around your neck");
	else if (pc.tallness <= 67) output(" leans forward to wrap her arms around your neck");
	else output(" wraps her arms around your neck");
	output(", smushing her toned body against yours and touching the tip of her twitchy nose to your own, murmuring lustful desire.");
	output("\n\nHer bright golden eyes are filled with <i>want</i> for you. They jitter slightly, locked on almost unerringly to your [pc.eyes]. You’re falling awake in her topaz-colored irises, letting out a growl as your body tightens from her touch, her signature... luxuriating in her closeness. You’re very much appreciating that she can be as affectionate as she is relentless.");
	output("\n\nRoxy gingerly slides her arms down your glutes, the silky softness of her fur wringing just a bit more pleasure out of you. She plants her tongue to your [pc.skinFurScalesNoun] and slicks it to one side, lapping up a load of accrued, [pc.raceShort]-flavored sweat, her motions intensifying at your waistline. She squeezes you hard enough that it is a little painful, but you do the same, taking one hand-filling asscheek into each palm and giving some back, watching her mouth open agasp.");
	output("\n\nBefore it escalates, Roxy thrusts into you before stepping out of your grasp on the inertia, thumbs hooking into her thong and yanking it off in one quick motion. Your sense of smell is rammed by the heady aroma of a horny bunny. The scintillating scent of a fecund laquine is amplified by the soggy atmosphere. In the rush to identify and <i>know</i> it, you catch the spicy note of girlish musk and a fresh, earthy fragrance.");
	output("\n\nThe cock-twitching source is dribbling right in front of you: thick, shimmery, black pussylips beading femcum. It drips from the peak of her throbbing clit, polishing the floor with a sweet, livid stripe of excitement.");
	output("\n\nWith a confident grin, Roxy splits two fingers around her steaming mare-cunt, polishing its puffy exterior with crystalline lubricant, mowing rhythmically over her incredibly engorged button.");
	if (firstTime)
	{
		output(" <i>“Like the smell? Call me a slut, but I’m always ready for a go. Can’t help myself when a cute [pc.guyGirl] like you comes up to me all");
		if (pc.isBimbo()) output(" ready");
		else if (pc.isBro()) output(" ready");
		else if (pc.isNice()) output(" innocent");
		else if (pc.isMischievous()) output(" mischievous");
		else output(" serious");
		output(" ‘n willing.”</i>");
	}
	else output(" <i>“I’ve seen how hard you get from my smell. Felt it too,”</i> she winks, <i>“can’t wait for you to get that way all over again!”</i>");
	
	output("\n\nShe balls and throws her thong over your neck, its pheromone trail giving you a sample of what her ebony-lipped cunt promises.");
	if (firstTime) output(" <i>“I wonder what </i>you<i> smell like.”</i>");
	else output(" <i>“I can’t wait for yours to make me go wild again!”</i>");
	
	processTime(10);
	addButton(0, "Next", roxySoxyTakesYourCoxyInHerBoxyBJ, firstTime);
}
	
public function roxySoxyTakesYourCoxyInHerBoxyBJ(firstTime:Boolean=false):void
{	
	clearOutput();
	showRoxy(true, true);
	
	var steeleTone:int = 0;
	if (pc.tone >= 75) steeleTone = 2;
	else if (pc.tone >= 50) steeleTone = 1;
	
	var kok:int = pc.biggestCockIndex(); //biggest cock overall, used for bj
	var kok2:int = pc.cockThatFits(roxy.vaginalCapacity(0)); //biggest cock that will fit in her vag (could be same as above)
	var kok3:int = -1;
	if (pc.cockTotal() > 1) kok3 = pc.cockThatFits(roxy.analCapacity(), "volume", [kok2]); //if more than one cock, will other fit in her ass?
		
	var pheromone:Boolean = roxySteeleHasPheremones();
	var venomDickFirst:Boolean = true;
	if (flags["ROXY_VENOMDICK"] == 1) venomDickFirst = false;
	
	output("Licking at her lush lips, Roxy knee-slides down to your loins,");
	if (pc.isCrotchExposed()) output(" eyeing your proud tumescence.");
	else output(" dragging your [pc.crotchCoverUnder] in the descent and allowing your proud tumescence to spring out.");
	
	output(" She grabs your [pc.cockBiggest] and gives it a firm squeeze, and your [pc.cockType " + kok + "] shaft throbs demandingly in return. The laquine muzzle-nuzzles your meat, inhaling audibly right from the musk-spurting source at the top,");
	if (pheromone)
	{
		output(" your unnaturally potent scent smashing her brain with a hit of thought-eradicating horniness. <i>“W - woah...");
		if (firstTime) output(" wasn’t expecting that...");
		else output(" always gives me a hell of a rush...");
		output("”</i>");
	}
	else output(" giving a dreamy sigh.");
	
	if (pc.hasPerk("Musky Pheromones"))
	{
		output("\n\nShe sniffs again, whole face lighting up.");
		if (firstTime)
		{
			output(" <i>“I’d never mistake that scent. You smell");
			if (pc.race() == "laquine") output(" like you’ve");
			else output(" exactly like a laquine whose");
			output(" had a few kids... like you’re meant to have them with everyone you meet. Can’t believe you don’t have a few humping your leg everywhere you go!”</i>");
		}
		else output(" <i>“I don’t know how or where you got yourself to smell like this, but I love it. It’s like you were born to mate laquines like me. I really can’t believe you don’t have a bunch of rabbit-eared sluts clinging to you... like, fucking shocked that you don’t waddle around with four bitches begging to get railed like braindead cumdumps on a daily basis!”</i>");

		output("\n\nYou ask her if she’d like to be the first.");
		output("\n\nBlinking, she takes an ascending whiff of your [pc.cock " + kok + "], totally enthralled. <i>“");
		if (flags["ROXY_TOTAL_KIDS"] == undefined && flags["ROXY_PREG_TIMER"] == undefined) output("Get me pregnant first, then we’ll see.");
		else output("Get me pregnant again and I might start thinking about it.");
		output("”</i>");
	}
		
	output("\n\nShe plants two wet kisses to [pc.eachCockHead]");
	if (pc.cocks[kok].hasFlag(GLOBAL.FLAG_FORESKINNED)) output(", sliding your foreskin back,");
	output(" and then to your [pc.knotOrSheath]. Spittle runs down her chin, plastering the fur around her lips to her skin before attaching itself to your swelling length in ruddy strings, all for the goal of getting your dick" + (pc.hasCocks() ? "s":"") + " to drool as messily as she does. [pc.CumColor] preseed beads at your summit, forming a dollop that is lapped up before it sags. The laquine visibly shudders, all sorts of sensations firing in her crossing eyes and aroused nerves. For a few seconds all she can do is stroke her cheek across the underside of your [pc.cocksLight].");
	
	
	if (pc.cocks[kok].cType == GLOBAL.TYPE_EQUINE) output("\n\n<i>“Tryin’ to break every bitch you lay, [pc.name]?”</i> Roxy asks, inhaling more musk from your beefy, turgid tool. <i>“Mmf, big fat pony-mounter like this, can’t wait to see every vein standing out. You came well equipped for a laquine; no dick like horsedick!”</i>");
	else if (pc.cocks[kok].cType == GLOBAL.TYPE_CANINE) output("\n\n<i>“Teasing knots is fun, makes them extra solid, keep all that cum inside. You’re gonna stand a better chance than most at breeding me, [pc.name]. How does that make you feel?”</i> You can’t quite answer when she drums her tongue against your cumslit before hold it in place, backing up some pre. <i>“Can’t wait to feel it!”</i>");
	else if (pc.cocks[kok].cType == GLOBAL.TYPE_FELINE) output("\n\n<i>“Always had a soft spot for these kitty dicks. All these nice ‘n soft nubs rubbing off a clit...”</i> she brushes your sensitive barbs with her palm, <i>“frees up your hands for more important work. And the feel inside... Yeah, I’ll think of this as a gift, [pc.name]!”</i>");
	else if (pc.cockCanSting(kok))
	{
		if (venomDickFirst) output("\n\n<i>“What’s with the tendrils?”</i> She experimentally tugs one, but you manage to keep your venom in with monumental effort, wanting to save it for later. It’ll be a surprise! <i>“Huh, can’t hurt. Bet it feels fucking awesome when they’re pressing for space in there, too.”</i>");
		else output("\n\n<i>“These bad boys are carrying a little more. I should be mad at you for not telling me...”</i> She strokes the stinger-lined base of your tool. <i>“But whatever it is they do inside, I love it. Don’t you dare hold back, [pc.name].”</i>");
	}
	else output("\n\n<i>“Gotta love dick, ‘ya know? Gets all nice and hard just seeing a girl, then it gets all wet like a pussy when it gets even an ounce of attention.”</i> Roxy smiles, licking you through one particularly vigorous lurch.");
	
	output("\n\nYou think about making a move, but when your hands close in she bats them away, licking skyward against your cumvein before stretching her lips at the [pc.cockHead " + kok + "]. <i>“Don’t move,”</i> she simpers, curling her tongue around your crown and pushing down. She assaults you with supreme pleasure before sitting you at the best seat in her mouth: on top of her tongue, pressed to the roof of her mouth, both hollowed cheeks rippling around the sensitive crown which lets out a torrent of backed-up goo along her taste buds.");
	output("\n\nBoth hands planted to your thighs,");
	if (pc.cockTotal() > 1)
	{
		if (pc.cockTotal() > 2) output(" she casually ignores the frustrated bobs of your extra pricks while starting");
		else output(" she casually ignores the frustrated bobs of your extra prick while starting");
	}
	else output(" she steadies herself to start");
	output(" you off with a few laps and suckles. Roxy worms her tongue around one side and then the other, finding a comfortably coiled position to suck down more of your flowing spooge.");
	if (pc.biggestCockLength() >= 11)
	{
		output(" You get the idea this isn’t her first time giving a blowjob with the ease she handles your sizable schlong. She can’t quite take it all the way, but she does reach your");
		if (pc.cocks[kok].cType == GLOBAL.TYPE_EQUINE) output(" medial ring.");
		else output(" [pc.knotOrSheath " + kok + "], giving herself a pretty neck-swell with your shape.");
	}
	else if (pc.biggestCockLength() >= 5) output(" A pleased-sounding groan vibrates through your rod when her uvula hugs the [pc.cockHead " + kok + "] of your dick, and you feel like you could cum if she clamped down just a bit tighter.");
	else output(" Inching forward, she groans around your member when her lips land on your groin. The emitted groan suggested disappointment with the size of your tool.");
	output(" The horse-bunny manages an upwards look, staring at you with familiar cheekiness.");
	
	output("\n\nA mixed gasp-grunt tears through your throat when Roxy’s head begins to slide back and forth, those expressive lips tight enough to squelch on movement. She keeps her glimmering eyes locked with yours, almost taunting you to just try and break contact or even take over.");
	output("\n\nWith nothing but her head in arms reach, you run your [pc.fingers] down her ear until your [pc.hand] rests on her head in quiet appreciation. [pc.Hips] jerking forward, you whisper <i>“Harder, please.”</i> Your begging elicits another dick-pleasing laugh from her lungs, and then the voracious bunny clamps down harder around your seething phallus.");
	output("\n\nFrom the way Roxy’s tongue coddles your [pc.dickSkin " + kok + "] to the lewd noises her mouth makes, holding limp instead of battering her brainless becomes a Herculean labor. She told you not to move, and the desire to fuck back is a bastard imp on your shoulder. Having her savor you is enjoyable but-");
	output("\n\nThe more stubborn she feels you getting, the firmer her hold on your [pc.thighs] becomes...");
	output("\n\nIn the squishy embrace of her wonderfully warm mouth, the direct command to cum rises up and echoes through you. She’s slurping around your [pc.cockNoun " + kok + "] with alternating forces, saliva hanging in thick cords when she withdraws for air.");
	output("\n\nShe buries your lube-slick bone in her throat with an ear-pleasing pop, long enough for her throat to clench, and then she pulls out only to scissor your member in the passionate squeezes of her throat-hole. Hoarse breaths slither past your lips;");
	if (pc.balls > 0) output(" your seed-laden nutsack sloshes inches from her jaw;");
	output(" now it’s not just eagerness showing plainly in your eyes, but lustful vacancy.");
	
	if (pc.cockCanSting(kok))
	{
		output("\n\nHolding back your venomous side is no longer a possibility.");
		if (venomDickFirst) output(" Roxy didn’t know what your dick-tendrils were capable of, but she’s getting an intimate experience of it when they lash out at her palate. Her leporine face twists from the forceful injection of oversensitizing venom, like her cheeks were just victim to a syrupy piledriver, and she’s at a total loss for words when she realizes how much control it sends your way.");
		else output(" Roxy knows what your dick-tendrils are capable of, and she’s getting an intimate reminder of it when they lash out at her palate. Her leporine face twists from the forceful injection of oversensitizing venom, like her cheeks were just victim to a syrupy piledriver, and she’s at a total loss for words when she realizes how impossible it is to adapt to it.");
	}
	
	output("\n\nYour grip on Roxy’s head stiffens as her blissful rhythm accelerates, your other hand darting down to join the first. No longer able to restrain yourself, you shove yourself deep down her throat.");
	output("\n\nFor whatever reason, probably because she’s cock-drunk, the fiery bun surrenders to your avid facefucking. Roxy closes her eyes to better enjoy the desperate thrusts of your vigorous [pc.cockBiggestNoun] sliding over her sex-moistened prick-pillows");
	if (pc.balls > 0) output(" and the clap of your [pc.balls] against her relishing chin");
	output(".");
	
	output("\n\nWith each [pc.knotBallsHilt " + kok + "]-deep pump into Roxy’s mouth, your balance falters, and you only regain it by taking a moment to savor the involuntary bucking of her neck. Her huskily moaning voice only makes the velvet-soft glove of her phallic-stuffed neck more enjoyable. The laquine’s bluster is <i>twapped</i> away by your feverish mind; the movements generating sounds of noisy wetness as your subconscious nears the release it craves.");
	output("\n\nYour shaky balance makes you all the more determined to engorge her esophagus with seed. It isn’t until she tries to pull away for precious oxygen that you realize she feels it coming, but your peaking lust will not be denied");
	if (pc.cockTotal() > 1) output(", not even those of your unholstered [pc.cocksLight], content with sliding lewdly across her ears and brow");
	output(".");
	
	if (firstTime) output("\n\nPart of you wonders if she’s merely allowing this. Everything up to this point suggested she would be in control. Your train of thought is cut short by another halting suction.");
	else output("\n\nThis is just the beginning, you know that now. She sleeves herself on your cock to test your endurance. You’re going to show this rough and tumble laquine what you’ve got as many times as it takes!");
	
	output("\n\nTaking her invitation, regardless of its origins, your restraint vanishes and your hold on her head only grows firmer. Your hips ride on a savage wave, propelling your [pc.cockBiggest] in and out of the punky prickholster who’s surrendered to your livid facefucking.");
	if (pc.balls > 1) output(" Your gurgling [pc.ballsNoun] jostle with soon-to-be-deposited seed, and it’s a sign Roxy takes with no lack of enthusiasm, fondling the underside of your taut sack.");
	else if (pc.balls > 0) output(" Your gurgling [pc.ballsNoun] jostles with soon-to-be-deposited seed, and it’s a sign Roxy takes with no lack of enthusiasm, fondling the underside of your taut sack.");
	if (pc.hasVagina()) output(" There’s nothing your [pc.cocksLight] would like more than to cum, but the rabbit-girl is seeing that your reflexively convulsing [pc.pussyNoun 0] gets that extra bit of stimulation it needs, easily thrusting one finger in and out of your [pc.vaginaColor 0]-lipped cunt until it’s coating itself in [pc.girlCum].");
	
	output("\n\nPleasure cresting, Roxy’s final gasp is voided around her lotus-colored lips, muffled by your jaw-buffeting [pc.cockBiggestNoun], and then totally silenced by the onset of [pc.cumVisc] orgasm");
	if (pc.hasKnot(kok)) output("- if your inflated breeding bulb driving through her lips to seal the [pc.cumVisc] urgency in wasn’t enough");
	output(". Your body takes the reins and you pump hard into that wet and waiting suckhole...");
	
	var cumQ:Number = pc.cumQ();
	if (cumQ >= 7000)
	{
		output("\n\nMoaning blissfully in shudderingly hot release, your trembling");
		if (pc.balls > 1) output(" [pc.ballsNoun] churn");
		else if (pc.balls > 0) output(" [pc.ballsNoun] churns");
		else output(" cock churns");
		output(" out the first fat rope of [pc.cumVisc] [pc.CumNoun]. Your urethra strains wider to handle the deluge of seed-filled spooge, but you’re too enraptured by the warmth of her mouth contrasting with the magma-like warmth of the belly-distending nut you’re blasting into Roxy. Rivers of the stuff backwash almost immediately around your [pc.knotBallsHilt " + kok + "], gouts of spunk rushing down Roxy’s chin like the frothing spittle. The beatings of your heart add circumference to her cum-filled gut one jerky motion at a time; your consciousness fades into lust-colored afterimages.");
		if (pc.cockTotal() > 1) output(" Concerningly strong aches of flaring virility overwhelm your mind as the same amount of gooey gunk fires up into the air and lands with a ‘splat’ on her head, painting the laquine’s hair with a new set of [pc.cumColor] highlights that you think go well with the gold-on-brown.");
	}
	else if (cumQ >= 500)
	{
		output("\n\n[pc.EachCockHead] balloons as climax explodes out of you in long, thick ropes, stuffing the laquine’s throat with [pc.cum]. Eruption after [pc.cumVisc], visceral eruption fires off, flying on momentums of inertial bliss. Roxy spasms on the spot, lightheaded from lack of oxygen, lamely swallowing every hot drop that funnels back up, sucking it down while sucking more out.");
		if (pc.cockTotal() > 1) output(" Throbbing flashes of masculine pressure shunt the last of your urethra-swelling loads onto her head, giving her a brand new set of [pc.cumColor] highlights that you think go well with the gold-on-brown.");
	}
	else
	{
		output("\n\nRopes of [pc.cum] spurt out into the complaisant rabbit’s throat, painting lines against her tonsil that trickle down into her belly. A few things tell you she was braced for a greater load than what you’re giving, and it’s only a few short seconds before your climax reduces to a few tenses of oozing pleasure.");
		if (pc.cockTotal() > 2) output(" Most of your load was saved for her stomach, leaving very little spooge for your other dicks to dump in her hair.");
		else if (pc.cockTotal() > 1) output(" Most of your load was saved for her stomach, leaving very little spooge for your other dick to dump in her hair.");
	}
	
	output("\n\nWhen you pull your still-cumming cock from her lips");
	if (pc.hasVagina())
	{
		if (pc.vaginaTotal() > 1) output(", your [pc.pussies] finishing their own tiny, pitiful orgasms");
		else output(", your [pc.pussies] finishing its own tiny, pitiful orgasms");
	}
	output(", a final shot lines the space between her flaring nostrils and wanton ‘O’-shaped lips. You take a moment to catch your breath with her, but unsurprisingly, the competitive laquine has already shaken the stupor. <i>“We’re nowhere near done yet, [pc.name].");
	if (firstTime) output(" Consider your test passed; I might like giving a good blowjob, but I’m gonna need a lot more than that.”</i>");
	else output(" Now come and show me how you </i>really<i> feel!”</i>");
	
	output("\n\nRoxy bounces up and hops for the nearest bench. The perky bunny sits down with her back to you, then leans forward, presenting the rich fur of her broad ass like a professional stripper. Her hand <b>slaps</b> shamelessly off her own wiggly backside not once... but thrice. The little wobbles and marshmallow-like depressions they made captivated you instantly, bringing your [pc.cocks] back to a state of leaky excitement, something the jock-rabbit’s eyes greatly approve of.");
	
	if (firstTime) 
	{
		output("\n\n<i>“Lookie here,”</i> she runs a hand down her crack towards her soaked mare-mound. <i>“S’time for you to give me something.”</i>");
		output("\n\nYou ask her what that is exactly, barely managing an ounce of wit.");
		output("\n\n<i>“Guess.”</i> Roxy’s lips curl into a sultry smile.");
	}
	else
	{
		//1 dick, pussy last time
		if (flags["ROXY_DOGGY_LAST"] == 0 && pc.cockTotal() == 1)
		{
			output("\n\n<i>“Alright, [pc.name],”</i> she cups her plump, oval vulva and squishes the opposing slopes together, squeezing out a few droplets of dripping desire. <i>“You know what to do,”</i> she finishes, smiling cutely.");
			output("\n\nDo you?");
		}
		//1 dick, ass last time
		else if (flags["ROXY_DOGGY_LAST"] == 1 && pc.cockTotal() == 1)
		{
			output("\n\n<i>“Maybe this time you’ve got your head on right, [pc.name],”</i> Roxy intones mockingly, sliding a hand past her asshole to her wonderfully aroused horse-pussy. <i>“Can’t poossssibly imagine where I want it, can you?”</i>");
			output("\n\nNope. But can she say the same about you?");
		}
		//multi dick now, not last time
		else if (pc.cockTotal() > 1 && flags["ROXY_DOGGY_LAST"] < 2 && kok3 >= 0)
		{
			output("\n\n<i>“You know what...”</i> she mutters, looking at your [pc.multiCocks]. <i>“I’d get a bit pissed if you stuck it in my ass and left my pussy all alone, but you’ve got");
			if (pc.cockTotal() > 2) output(" that many");
			else output(" two");
			output(" dicks for a reason. Doesn’t take a galotian to figure that out. C’mon,”</i> she slaps her ass one more time, <i>“rock my world, [pc.name]!”</i>");
		}
		//multi dick now, but cant fit both holes
		else if (pc.cockTotal() > 1 && kok3 < 0)
		{
			output("\n\n<i>“You know, I’d love to get");
			if (pc.cockTotal() > 2) output(" two");
			else output(" both");
			output(" of those at once, but somethin’ tells me you’re a bit too big for both holes. Not to worry, [pc.name],”</i> she snickers, <i>“laquine vag is good for the biggest dicks, and laquine ass is great for bustin’ a fat nut on!”</i> She slides a finger over her buxom slit. <i>“C’mon, just breed me!”</i>");
		}
		//multi dick now and did multi last time
		else if (pc.cockTotal() > 1 && flags["ROXY_DOGGY_LAST"] > 1)
		{
			output("\n\n<i>“Mmm, think I’m really starting to love all that dick you’ve got, [pc.name],”</i> Roxy grins, shaking her thick derriere in your direction. She pulls one cheek apart, giving you an unobstructed view of her glistening mare-pussy and slightly loosened asshole. <i>“You know I want everything out of you,”</i> she slaps her rump one more time, <i>“and I want it <b>now.</b>”</i>");
		}
		//1 dick now, but did multi last time
		else if (pc.cockTotal() == 1 && flags["ROXY_DOGGY_LAST"] > 1)
		{
			output("\n\n<i>“Havin’ " + flags["ROXY_DOGGY_LAST"] + " dicks too much for ‘ya, [pc.name]?”</i> she giggles. <i>“Looks like you’ve got a choice now,”</i> she says, rubbing a paw over her mare-pussy. <i>“I think you know what I need most.”</i>");
			output("\n\nOh, yeah, you do.");
		}		
	}
	
	flags["ROXY_TONE"] = steeleTone;
	
	processTime(10 + rand(10));
	roxy.loadInMouth(pc);
	pc.orgasm();
	
	clearMenu();
	//no point in using cockRouter since if the pc has multi dicks, there is a special scene to use them and will only get the single dick use scene 1 time
	if (pc.cockTotal() > 1 && (flags["ROXY_DOGGY_VAG"] >= 1 || flags["ROXY_DOGGY_ANAL"] >= 1))
	{
		if (flags["ROXY_DOGGY_DP"] >= 1) addButton(0, "Next", roxySoxyTakesYourCoxyInHerBoxyDP, undefined, "Next","You’re not going to keep her waiting. That would be dishonest!");
		else addButton(0, "Next", roxySoxyTakesYourCoxyInHerBoxyDP, undefined, "Next","Her world is going to be more than rocked when you’re through.");
	}
	else
	{
		addButton(0, "Vaginal", roxySoxyTakesYourCoxyInHerBoxyVag, undefined, "Vaginal","Ooo! Ooo! You know this one.");
		if (pc.cockThatFits(roxy.analCapacity()) >= 0) addButton(1, "Anal", roxySoxyTakesYourCoxyInHerBoxyAnal, undefined, "Anal", "Probably not what she wants... but you were never good at guessing");
		else addDisabledButton(1, "Anal","Anal","You can’t fuck Roxy here with your size! Even laquines have their limits!");
	}	
}

public function roxySoxyTakesYourCoxyInHerBoxyVag():void
{	
	clearOutput();
	showRoxy(true, true);
		
	var kok:int = pc.cockThatFits(roxy.vaginalCapacity(0));
	if (kok < 0) kok = 0;
	var firstTime:Boolean = true;
	if (flags["ROXY_DOGGY_VAG"] >= 1) firstTime = false;
	var knowName:Boolean = false;
	if (flags["ROXY_SEX"] >= 1) knowName = true;
	var venomDickFirst:Boolean = true;
	if (flags["ROXY_VENOMDICK"] == 1) venomDickFirst = false;
	var pregTri:int = roxyPregTrimester(true);
	
	output("Ebony-black horse-pussy calls out to you, drooling thin streams of clear lubricant down its radiant surface. The way she’s positioned makes it the most obvious target, the easiest guess. It’s like she’s set herself up for an own goal. The hypnotic shake of her butt is one thing, but the way that dewy mound gushes the longer you stare is... amazing. Your [pc.cockType " + kok + "] firmness agrees.");
	output("\n\nThat fat-lipped pheromone mitten is built to take insertions people think only leithans could handle. Vertically, that supple gash extends further than the average pussy, making it abundantly clear what kind of girth it’s willing to accommodate. It looks and smells sweeter than fine, rich chocolate. The syrupy mess it makes is what all lovers look like when their passions have exhausted.");
	output("\n\nYou gulp, licking your lips, catching another breath of the girlmusk emitting from the heated, nectar-lubed hole in front of you. Her ears perk up, tilting left and right in symmetrical rhythm. Scoring this easily anywhere else would be impossible, and that’s just what she wants you to realize.");
	if (pc.inRut()) output(" How appropriate that you’re in the hyper-endowed state of arousal and breeding necessary to breed a laquine the way she deserves.");	
	else output(" <b>If you were in rut, you bet this slut-rabbit would just throw herself on you without a second thought, without even blinking.</b> She’d confine herself to a bedroom with you until all pheromone production had ceased.");
	output("\n\n<i>“Oh, I don’t know,”</i> you finally speak, voice bone dry, [pc.moving] towards her. When you sidle up behind the prostrate laquine, she hums quietly at the touch of your [pc.skinFurScales] against her back");
	if (pc.hasTits()) output(", and the weight of your [pc.breasts] contouring to her body");
	output(". <i>“Must be this.”</i>");
	
	output("\n\nRoxy bites her lower lip when you slap the topside of your [pc.cock " + kok + "] into the slightly parted lips of her bare twat, pressing against her latex-like barrier. The touch of hypersensitive feminine skin is enough to control all the rapacious urges the sight of it inspired. Her fluffy tail wags to a blur in the valley between your bodies, and when you caress her thigh and grip her tail-fluff she slams herself against your crotch, letting out a frustrated groan.");
	output("\n\n<i>“Don’t you dare get all teasy now,");
	if (knowName) output(" [pc.name]");
	else output(" Steele");
	output("!”</i> she barks.");
	if (pc.isPregnant()) output(" <i>“I get that you’ve got a little weight in your gut, but that’s not an excuse to be slow now.”</i>");
	else output(" <i>“I love when someone’s on my back fucking me with all their strength, not making love to me. We’re past that part now, if you hadn’t noticed.”</i>");
	
	output("\n\nAn immediate shudder crawls up Roxy’s spine when you align your [pc.cock " + kok + "] with her juice-streaming pussy. The temperature radiating from it gives your twitching length a taste of ripe, fertile laquine and your nose all the freshest, pre-provoking scents it could need. Firm tweaks to her bloated clitty have her holding back a whine. You slide your [pc.cockHead " + kok + "] through her folds, lathering your [pc.cockType " + kok + "] mast in all her pregnable incandescence.");
	output("\n\nThe bunny-girl tries to spear herself on your rod, nearly succeeding in doing so. Instead, your rock-hard member slides between her fuzzy thighs while her toned derriere crashes into your abdomen,");
	if (pc.cockTotal() > 2) output(" cradling your extra schlongs,");
	else if (pc.cockTotal() > 1) output(" cradling your extra schlong,");
	output(" unceremoniously drenching you with pheromones. The furry pressure and stimulation of her leg");
	if (pc.cockTotal() > 1) output(" and ass");
	output(" cleavage has you wailing in pleasure, struggling to grip her hips and push back.");
	
	output("\n\n<i>“Dammit, I told you- noooTTtt...”</i> Roxy groans in frustration, sitting up only for you to wrap your [pc.arms] around her belly and push back down, mounting her like an animal. <i>“There! That’s more like it!”</i> she grunts, hips writhing. <i>“Don’t fucking tease me. Fucking breed me, ");
	if (knowName) output(" [pc.name]");
	else output(" Steele");
	output("!”</i> she mewls in your grasp. <i>“Come on!”</i>");
	
	output("\n\n");
	if (firstTime) output("She wants to get bred that badly? ");
	if (pc.isBimbo()) output("<i>“Can do, babe!”</i> you reply enthusiastically, keeping a tight hold on your stubborn bun.");
	else if (pc.isBro()) output("<i>“Can do, babe!”</i> you reply enthusiastically, keeping a tight hold on your stubborn bun.");
	else if (pc.isNice()) output("<i>“I will, just at my own pace,”</i> you respond. Roxy growls, pushing up against your chest again. Your hold tightens, and you add a little more assertiveness to your voice, <i>“at <b>my pace</b>,”</i> you say, and she purrs.");
	else if (pc.isMischievous()) output("<i>“Yeah, I’ll fucking breed you, and I’ll do it at <b>my pace</b>,”</i> you assert, meeting her aggression. She purrs in your tight grip, not entirely subdued.");
	else output("<i>“Yeah, I’ll fucking breed you, and I’ll do it at <b>my pace</b>,”</i> you assert, meeting her aggression. She purrs in your tight grip, not entirely subdued.");
		
	output("\n\nOutstroke - your hands are back on Roxy’s waist. You lean up long enough to press your tender [pc.cockHeadNoun " + kok + "] to her glove and glide inside, encountering no resistance from her willing walls. When you’ve taken the first step, a small pinch summons an airy giggle from Roxy’s lips, and she’s bucking her hips back to sheath more of your meat. ");
	output("\n\n<i>“Fuck it,”</i> you say, slapping her butt and pulling back just to hammer her with all you’ve got.");
	if (pc.cocks[kok].cLength() >= 14)
	{
		output(" Roxy squeals in bliss, one small hiccup stopping it when you");
		if (pregTri > 0) output(" batter her womb");
		else output(" near her cervix");
		output(". You’re fully inserted into her cunt, taking up all available space");
		if (pc.cocks[kok].cLength() >= 17) output(", but a few inches remain unpacked outside of her sopping wet box");
		output(".");
	}
	else if (pc.cocks[kok].cLength() >= 8) output(" It’s not as much as it could be, but her sheltering tunnel is wrapping you in its cum-milking embrace, and Roxy is certainly placated by the collision of crotches.");
	else output(" Which isn’t much, but she’s not complaining. The collision of crotches placates her long enough to not notice that you’re not filling her as well as you could be.");
	
	pc.cockChange();
	
	output("\n\n<i>“[pc.name]... You can do better than that,”</i> she laughs. Taking that as a challenge, you hammer into her like the feral savage she wants you to be, squeezing so hard on her sensitive tits that her eyes roll back and she yelps out a relieved <i>“Yes!”</i> Her fingers clench the bench underneath, plateauing pleasure curling her fingers and toes into rigid hooks. At a taunting pace you lurch in and out, keeping her relatively pacified with a flick and slam when her unruly side shows.");
	output("\n\n<i>“Steeeeele, don’t make me tell you three times!”</i> the plaintive equine-rabbit whines; at the same time, she’s wriggling you deeper into her pussy.");
	output("\n\nRoxy’s satiny walls close in on your member like she has mental control over the vaginal nerves, and you find your [pc.cock " + kok + "] under a directed onslaught of penis trapping pressure that upsets your rump-pumps.");
	if (pc.balls > 0) output(" Your cumpouch twitches heavily against her clit; her slutbutton throbs communicatively to your trembling [pc.ballsNounSimple], expediting the request for a [pc.cumVisc] filling.");
	
	if (pc.cocks[kok].cType == GLOBAL.TYPE_EQUINE)
	{
		output("\n\nYour musky horse-prick leaves its mark on its biologically assigned mate: a horse cock for a horse cunt. <i>“Damn, I just LOVE it when someone brings me your kinda dick! <b>No cock like horsecock,</b> and I’m not singing that ‘cuz I’m a laquine.”</i> Roxy’s slavish depths inhale the entirety of your turgid, bestial length; she squeaks ever so slightly when your big, juicy medial ring pops through her puffed out labia. It makes her wetter than usual, and she’s pouring out enough girljizz to substitute for a broken-down shower and enough pheromones to trash the filtration system.");
		output("\n\nDamn. The thought that this place could permanently smell like you after you’re done was way hotter than you’d have given it credit for.");
	}
	if (pc.cockCanSting(kok))
	{
		flags["ROXY_VENOMDICK"] = 1;
		output("\n\nSpurred into action, your alien biology does its work: the tendrils lining your [pc.cock " + kok + "] latch to her sensitive innards, stinging Roxy’s horse-pussy with ample amounts of chemical lust. <i>“Oh g-g-geez,");
		if (venomDickFirst) output(" what’s up with that? Wow, that stuff’s messing with my head!”</i>");
		else output(" fffuck, I don’t think I’ll- ever- ah- get used to that!”</i>");
		output(" She’s hyperventilating now, losing her inhibitions and control to a sanity-eroding dose of pleasure-spiking venom.");
	}
	output("\n\nBeating back her body’s orgasmic spasms, you interlock your [pc.hands] around Roxy’s chest and nibble on her neck, grinding your crotch against hers while your voice ripples through her dermis. The more of her searingly warm pocket you inhabit, the more your vocals stumble, and the more your");
	if (pc.cocks[kok].cType == GLOBAL.TYPE_EQUINE) output(" properly flaring tip");
	else output(" ballooning tip");
	output(" spurts hot globs of pre that make the subsequent humps easier... faster.");
	
	output("\n\nWhen you rail your bunny-rabbit’s desperately shuddering sex, it only seems to energize her. Rather than sit there moaning like a slut and taking it, Roxy is matching your thrusts with carefully timed blowbacks. Her tailbone bounces powerfully off your abdominals with enough strength that if she hit you anywhere else it might hurt, or at least knock the air out of your lungs.");
	output("\n\nBut it makes an appreciable difference in the goings on, more than being hyper-aware of her fathomless textures and mast-hugging folds. You could find some two-chit whore anywhere, fuck her until she’s heavy with child, but Roxy’s fucking you back. <i>And she’s laughing about it.</i>");
	output("\n\n<i>“Yeah! Fuck me hard enough I’ll feel it tomorrow, [pc.name]!”</i> the adrenaline-junkie cries. <i>“Fuck me so hard that my pussy is molded... to- y-y-your...”</i> You thrust, thrust, ‘slap’, <b>slap,</b> <i>slap</i> - <i>“...then- come back- and DO IT AGAIN!”</i>");
	output("\n\n");
	showImage("RoxyDoggyCummy");
	output("Molten-hot muscles stroke your laquine-taming [pc.cockNoun " + kok + "]");
	if (pc.cockTotal() > 2) output("; the others flop around uselessly, smacking cummy reminders into her assfur");
	else if (pc.cockTotal() > 1) output("; the other flops around uselessly, smacking cummy reminders into her assfur");
	output(". Roxy’s voice slithers between clenched teeth now, her honeypot clutching around all the sunken [pc.cockColor " + kok + "] inches you’ve permanently housed. Each time you pound home now, you’re doing it with a deep set and primitive passion, treating her like little more than an uncooperative mate.");
	output("\n\n<i>“Fuck, do it like this, NOW!”</i> she screams and writhes, and while she humps you even harder than before, your subconscious finally realizes it needs to punish her pussy twice as strong. Her pleasure-hole relaxes to let you deeper inside, and your backstrokes are now little strands of heaven that you want to experience for longer and longer and longer...");
	output("\n\nIt figures the moment that you both lose yourself to reckless abandon, humping away like beasts, growing numb from the repeat thunderous impacts of [pc.raceShort] against laquine, all of your awareness draining out the more you pound her sable cunt like a jackhammer...");
	output("\n\n...That someone walks in. <i>“Woah.. Uh, sorry, you guys still aren’t done?”</i>");
	output("\n\n<i>“GET OUT!”</i> Roxy howls, not deigning to look. Neither do you, still furiously savaging the bunny-bitch’s flooding fuck-hole. There’s a tiny ‘yip’ before the door slides closed again, sealing the sodden air back in. Copious juices spray your crotch with hot reminders of what you’re both working towards. Numbness fades into familiar heat when her inner muscles clench hard, and you’re twitching inside on the rise to cunt-stuffing climax.");
	output("\n\nWhoever the mystery ‘punk’ was, you’re not about to let that distraction kill your mood. <i>“That’s right, don’t you dare let that stop us. You’ve got a job to do right now, [pc.name],”</i> she says, entirely enthused and barely keeping herself from laughing, <i>“and that’s FUCKING ME INTO THIS BENCH!”</i> There’s another sound at the door, it opens and immediately closes, and with the sweat dripping from ");
	if (pc.hasHair()) output(" your hair-tips");
	else output(" your head");
	output(", you can’t stifle it...");
	
	output("\n\n...You both burst into a fit of sloven laughter, praising each other’s performance with gusto.");
	output("\n\nIt’s at this point that you discover you are about to cum, and you’re only able to growl that out in words missing crucial syllables. Roxy gets it, though: she was doing the same seconds before you realized your burgeoning cumslit was readying itself for the paces of orgasm. The friction on your mast impels you to greater speeds, triggered by one overriding biological impulse: to breed.");
	if (pc.cocks[kok].cLength() >= 14) output(" An alien heat abuses your lust-sore [pc.cockHead " + kok + "], and you realize it to be the crushing depth of her very womb.");
	if (pc.cocks[kok].cLength() >= 8) output(" You’re pushing so deep into her quivering quim that you get nearer to the cervical ring at her core.");
	else output(" If only you were bigger... you’d be pushing deep enough to award yourself VIP access to her womb.");
	
	output("\n\nYou launch into a straining rhythm now, trying to squeeze your [pc.knotOrSheath " + kok + "] into her pussy, working to both impress her and fulfill her request. If she wants to get bred, then you’ve got all this cum stored away for that sole reason.");
	if (pc.cumQ() >= 500 && pc.balls > 0) output(" You wonder if she can smell it all behind your taut ballflesh, if she can feel the pressure in your spunk-tanks waiting to be released.");
	if (pc.hasKnot(kok)) output(" The way your bulbous breeding knob bulges tells you that orgasm is but a thrust or two away, and that you need to lock yourself to her <b>soon</b> before it grows too large.");
	
	output("\n\nShe’s close too, and it’s only a matter of pushing your lover over that edge- No, no! It’s only a matter of <b>soaring into euphoria with her.</b> The real matter is <i>how</i> to do it. You can fill her with all the dick you have, make her spasm with its amazing pulses, bend her cunt to your will, bring orgasm after sweet, nerveless orgasm down on her until her juices are shining you with an everlasting reminder of her hypnotizing fragrance.");
	if (pc.isBimbo() || pc.isBro() || !pc.isAss()) output("\n\nWithout a second thought, you grab Roxy’s head, inching forward and turning her to face you. A look of shock adds to her blissed out features, but it vanishes when you press your [pc.lipColor] lips into hers, pulling her into a spit-spattered kiss that melts her into a Roxy-shaped puddle. What’s not relaxing is her pussy, and when it clamps down on your cock one last powerful time, the sensation drives you to cum.");
	else
	{
		output("\n\nYou crush Roxy’s body against your own, pulling her close enough that you can sink your teeth into her neck, biting all around a spot of soft, spongy fur. She’s too fuck-drunk to complain, mewling louder with each nip. It only drives her pussy to clamp down on your cock once again, this time with absolute authority. The sensation drives you to cum");
		if (pc.hasVagina())
		{
			output(" and [pc.eachPussy] are shining splendidly with");
			if (pc.isSquirter()) output(" flooding and squirting obscene amounts of");
			else if (pc.wettestVaginalWetness() >= 2) output(" and drooling fresh strings of");
			else output(" a new coat of");
			output(" [pc.girlCum]");
		}
		output(".");
	}
	
	processTime(15 + rand(15));
	
	if (pc.hasKnot(kok)) output("\n\nIt takes one... two thrusts, and your [pc.knot " + kok + "] finally pops inside at the same time your [pc.cockHead " + kok + "] inflates for the churning of your [pc.cumFlavor] seed. Inside Roxy’s magnificently chubby laquine womanhood, warm seed begins to flow.");
	else output("\n\nTwo thrusts more you hilt yourself in the laquine, her magnificently chubby cunt handling it from there.");
	output(" Hoarse screams tear their way out of Roxy’s throat; her nerves ripple wildly and her fingers spasm against whatever’s in grasping range.");
	
	var cumQ:Number = pc.cumQ();
	if (cumQ >= 10000)
	{
		output("\n\nYou’re not sure who gasped harder and more depthlessly in your moment of sizzling-hot orgasm -- an orgasm that manifested itself around you and crammed your entire soul into that needful nook.");
		output("\n\nIt’s probably safe to say it was you, because the two of you lurch when the first torrent of geysering [pc.cumNoun] blasts through your rod, cascading out in an almost unbroken stream like water from a firefighting hose. Roxy’s horse-pussy is an inferno to be quenched by it. Its inside is entirely filled with [pc.cum], not one inch, not one ounce of pretty nerves left unfilled or unpainted with [pc.cumColor] spooge.");
		output("\n\nYou’re still cumming. Of course you’re nowhere near finished. Long goopy ribbons spray out into her womb, her cervix inviting every single drop to take its place in the race to her baby factories. Laquine belly expands to make room for the tremendous, [pc.cumVisc] nut you’re busting. Out of faint instinct she tries to slip away from the strangeness spreading inside her, but you hold the bun tighter, burying deeper, feeling the pressure explode outwards");
		if (pc.hasKnot(kok)) output(" around your knot");
		output(" against your crotch, the whole time thinking about how good it feels to be a dominant sire.");
		if (pc.cockTotal() > 1) output("\n\nWhat you’re doing outside of her pussy is just as depraved. You’re leaving a musky reminder on the lockers, the floor, hell, it’s great that you’re in a shower room, but you doubt they’ll get the smell out that fast. Same goes for Roxy: she’s practically a goo-laquine now, blanketed under a potent load of [pc.cumNoun], sure to discolor her fur [pc.cumColor] unless she washes right away.");
		pc.applyCumSoaked();
	}
	else if (cumQ >= 6000)
	{
		output("\n\nYou bury every tenderized inch of your [pc.cock " + kok + "] as deeply as possible into Roxy’s sense-shattering cunt, just in time for the first massive shot of [pc.cum] to surge through your cum-vein. The laquine hiccups and hisses through her teeth when it batters past her cervix and into her womb, another gigantic rope barreling behind it and slamming into her feminine core like a ballista bolt. All the spooge you pump into her - inflate her with, even - backblasts out of her funneling pussy");
		if (pc.hasKnot(kok)) output("- even your knot can’t trap it");
		output(".");
		output("\n\nHer taut tummy loses some of its definition as it rounds out to handle the sheer amount of [pc.cumVisc] nut you’ve busted in her pregnable puss, <i>and you keep going.</i> If Roxy isn’t feeling more [pc.cumNoun] than laquine now, then you’ve done your job poorly. But deep down, you know that with every ovary-drowning shot, you’ve gone above and beyond; you’ve given the blissful, bubbly, breed-hungry bunny exactly what she wanted, and good news for her: your torrential waves have yet to recede.");
		if (pc.cockTotal() > 1) output("\n\nThat goes for outside too. A blanket of sperminess shoots out with enough force to hit some lockers, the floor, but mostly puddle prettily all over her spine.");
		pc.applyCumSoaked();
	}
	else if (cumQ >= 3000)
	{
		output("\n\nWhen the longest hairs of her tail brush against your");
		if (pc.balls > 0) output(" [pc.balls]");
		else output(" [pc.base]");
		output(" your body starts the process of letting loose your sack-straining load. All the liquid weight your loins carried here pumps out in long, thick spurts of [pc.cum] greater than the average man’s climax. Your [pc.hips] automatically lurch forward to bury as much [pc.cockNoun " + kok + "] inside as is physically possible, to let your [pc.cumVisc] [pc.cumNoun] erupt in peace and utter bliss, feeling her cervix open to accept your virility, feeling her belly round out with copious amounts of jism.");
		if (pc.cockTotal() > 2) output(" Your unholstered pricks shoot out torrents of the stuff while Roxy’s howls crescendo, feeling all that magma-hot spooge spattering across her form.");
		else if (pc.cockTotal() > 1) output(" Your unholstered prick shoots out torrents of the stuff while Roxy’s howls crescendo, feeling all that magma-hot spooge spattering across her form.");
	}
	else if (cumQ >= 500)
	{
		output("\n\nWhen you cum, you do so with the knowledge that plugging a pussy full [pc.cum] feels very, very good, and that the all-consuming pleasure and simplicity of it will never lose its [pc.cumVisc] lustre. Thick ropes pump into Roxy’s womb, her cervix half-vanishing in a [pc.cumNoun]-accepting yawn");
		if (pc.cocks[kok].cLength() >= 14) output(" that you easily slide through");
		else if (pc.cocks[kok].cLength() < 8) output(" that you can’t quite reach");
		output(". White-hot wads of jism spurt straight into her accepting core");
		if (pc.cockTotal() > 1) output(" and all over her back, reaching her ears, her hair, wherever they need to go to give her espresso-flavored fur a [pc.cumColor] reminder of your presence");
		output(".");
	}
	else
	{
		output("\n\nThe familiar, creamy tensing in your");
		if (pc.balls > 0) output(" testicular");
		output(" core is prelude to a relaxing but unfulfilling orgasm. The affections of her mare-pussy allow you to revel in its many mesmeric arms, but you offer up only a few thin ropes and copious dribbles of [pc.cum] to satisfy its desires");
		if (pc.cockTotal() > 1) output(", to say nothing of the middling amounts you pour out on her backside");
		output(". What little you pump into her is guided straight into her boundless reaches, and you wonder, while her tail coils and strokes around you, if you should get a few mods to up your output...");
	}	

	pc.exhibitionism(1);
	roxy.loadInCunt(pc, 0);
	pc.orgasm();
	clearMenu();
	addButton(0, "Next", roxySoxyTakesYourCoxyInHerBoxyVagNext,kok);
}
public function roxySoxyTakesYourCoxyInHerBoxyVagNext(kok:int=0):void
{	
	clearOutput();
	showRoxy(true, true);
	var firstTime:Boolean = true;
	if (flags["ROXY_DOGGY_VAG"] >= 1) firstTime = false;
	var pregTri:int = roxyPregTrimester(true);
	
	output("Roxy is still conscious, but whatever control she had has been stolen by her cum-hungry cunt in its need to cream your [pc.cock " + kok + "] in sparkling waves of laquine nectar. Even after your orgasm fades into benignness, her pussy is still milking you");
	if (pc.hasKnot(kok)) output(", and you have nowhere to go so long as you stay knotted");
	output(". Although though her mind’s gone into rest mode, her body knows what it wants");
	if (pc.hasVagina())
	{
		if (pc.vaginaTotal() > 1) output(" just like [pc.eachVagina], which clench desperately, flexing out pitiable amounts of [pc.girlCumNoun] since they’d gone unloved the whole time");
		else output(" just like [pc.eachVagina], which clenches desperately, flexing out pitiable amounts of [pc.girlCumNoun] since it’d gone unloved the whole time");
	}
	output(".");
	output("\n\nYou slump forward on top of the punky laquine, needing to catch your breath after fucking your heart out to creampie this potent slut-bun. <i>“Damn, damn, damn...”</i> Roxy mutters, <i>“that was fucking great. Can’t believe two people tried to walk in though, hah hahaaaaa...”</i> her tired voice trails off.");
	if (pc.hasKnot(kok)) output("\n\nOnce your knot deflates");
	else output("\n\nGiving her some room");
	output(", you pull out, strands of virile [pc.cumNoun] attaching your [pc.cockHead " + kok + "] to her cunt. When you sit down proper you’re still heaving, and she’s still oozing. You’re both unwilling to move, luxuriating in the glorious heat you exchanged.");
	output("\n\n<i>“Can’t get over that fact, holy shit. Seriously though,");
	if (firstTime) output(" didn’t expect to go that long with you. You know how to use that dick, [pc.name]. I respect that.”</i>");
	else output(" I don’t care we go so long. Better than someone humping three times and cumming. Trust me, I’ve had my fair share of that, and I’ve stomped away pissed every time.”</i>");
	
	output("\n\nShe finally sits up, cracking her neck and shuffling towards you, planting a kiss on your [pc.face]. <i>“You come back, alright?");
	if (pregTri > 0) output(" Just cause I’m pregnant doesn’t mean I don’t need a good dick in me!”</i>");
	else output(" Gonna need another load if this one doesn’t take. Gonna need your skills in either case, too.”</i>");
	
	output("\n\nSure, but for now, you’re getting your things together and moving on. Roxy is the first to wash up, get dressed, and leave with a casual whistle. You note that, on her exit, long lines of [pc.cumColor] spunk were dripping down her legs. Aliens with keen noses are going to see and smell all of what you did to her.");
	output("\n\nTo your delight, they’re going to smell <i>you</i>, and they’ll stay away from <i>your bun.</i> You shake your head after that, wondering if you’d gotten too carried away.");
	
	output("\n\nAnyway, you have to wonder if she just likes to use the idea of being impregnated to get hornier... or she might actually get pregnant. You may end up being the " + pc.mf(" father"," sire") + " to some laquines if the latter’s true...");
	if (pregTri > 0) output(" Anyway, she’s already pregnant, but the thought that you can easily do it again, with that same kind of vigor, isn’t lost on you. Part of you can’t wait for that to happen, either.");
	else if (pc.virility() <= 0) output(" Anyway, she’s not gonna get pregnant, you’re infertile, after all...");
	else if (flags["ROXY_STERILEX"] == 1) output(" Anyway, she’s not gonna get pregnant, but... shit... now you kinda wanna ask her to get off the pill...");
	else if	(!firstTime)
	{
		output(" Anyway, you have to wonder if you actually succeeded in knocking her up. Hopefully you’ll find out soon if you’re about to bring some");
		if (flags["ROXY_TOTAL_KIDS"] > 0) output(" more");
		output(" laquines into the Steele family tree...");
	}
	
	flags["ROXY_DOGGY_LAST"] = 0;
	IncrementFlag("ROXY_SEX");
	IncrementFlag("ROXY_DOGGY_VAG");
	processTime(15 + rand(15));
	pc.shower();
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}
public function roxySoxyTakesYourCoxyInHerBoxyAnal():void
{	
	clearOutput();
	showRoxy(true, true);
	
	var kok:int = pc.cockThatFits(roxy.analCapacity());
	if (kok < 0) kok = 0;
	var firstTime:Boolean = true;
	if (flags["ROXY_DOGGY_ANAL"] >= 1) firstTime = false;
	var knowName:Boolean = false;
	if (flags["ROXY_SEX"] >= 1) knowName = true;
	var pregTri:int = roxyPregTrimester(true);
	var venomDickFirst:Boolean = true;
	if (flags["ROXY_VENOMDICK"] == 1) venomDickFirst = false;
	var noPreg:Boolean = false;
	if (pc.virility() <= 0 || flags["ROXY_STERILEX"] == 1) noPreg = true;
	
	output("It’s doubtful Roxy wanted a reaming, but it’s what you want. Considering the leeway she’s given you here, all the buildup for <i>you</i> to take charge, then there’s nothing wrong with exercising that control.");
	if (firstTime && !noPreg) output(" Besides, you’re not keen on knocking up this rabbit today.");
	else output(" When she’s willing to present like that, she’s got no room to complain.");
	
	output("\n\nYou sidle up behind Roxy, doing your damndest to resist the siren call of her ebony-lipped horse-twat. The touch of your [pc.cocks] to her backside causes a visible shudder in the gasping laquine. Steaming rabbit-pussy gushes another runnel of fem cum that dribbles down her legs, pressing ochre fur to flesh like improperly used dye.");
	if (firstTime) output(" It’s safe to say that her backdoor’s probably tighter than her pussy.");
	else output(" Her backdoor’s a bit of a tighter fit than her pussy, and you can’t wait to get at it again.");
	output("\n\nDroplets of sweat launch when you shake her tempting warren from your mind. Her pussy winks at the same time her tailhole loosens. The more glistening dick you rub at her barren burrow the more her body subconsciously recognizes your intent. Her hairy equine tail stops wagging, fitting itself into her crack to obscure that vulnerable flesh simultaneously leaving her juicy cunt in full view.");
	output("\n\nAfter slathering yourself in her natural lubricant, you put your mischievous plan into motion. Yanking that stubborn tail gives it all away. <i>“Hey,");
	if (firstTime) output(" what the hell are you doing");
	else output(" are you seriously pulling that again");
	output("?”</i> the concerned bun asks. <i>“First off, we’re past the fucking lovemaking, second, you better not be thinking of using my ass.");
	if (!firstTime) output(" Last time was enough, this ain’t nearly as good as getting a raging womb-stuffing!");
	output("”</i>");
	
	if (pc.isBimbo() || pc.isBro()) output("\n\nYou only hum quietly.");
	else if (pc.isNice() || pc.isMischievous()) output("\n\nYou don’t offer an answer, but your coy smile says it all.");
	else output("\n\nYou don’t grace her with an answer.");
	output(" You thrust through her fuzzy canyon, smearing her taint. When you look down, the visual stimulation amplifies the throbbing and drooling of your cock, and its slime mixes with her arousal to create a slippery russet passage. Successive rubs over her anus make it more likely that you’ll slide in by accident now.");
	
	output("\n\nRoxy is of course displeased with the idea.");
	output("\n\n<i>“[pc.name], don’t use my ass, use my pu-”</i>");
	output("\n\nHer complaints halt the second you knock your [pc.cockHead " + kok + "] to her entrance. Roxy’s lapine features shiver; her ears instantly flop and her digits curl; it intensifies per the glistening [pc.cockColor " + kok + "] inches you socket inside. Around your twitching [pc.cockNoun " + kok + "] her obdurate asshole clenches in resistance, one last bodily effort to persuade you, <i>‘turn around,");
	if (pregTri > 0) output(" give me more babies");
	else output(" give me a baby instead");
	output("! Repopulate my entire race!’</i>");
	
	output("\n\nIgnoring the plea (which is really, REALLY hard) you power on, pushing in as far as");
	if (pc.cocks[kok].cLength() >= 8) output(" her body will allow");
	else output(" your body will allow");
	output(". Roxy’s body obeys your physical demands and you take up that space, hugging her back and contouring your [pc.chest] to the shape of her torso.");
	
	output("\n\nThe laquine throws her head back and ups the volume to her once-low husky moan, squeaking at the end when your [pc.hips] land on hers and your fingers tug on her lust-engorged black nipples, reveling in their rough, creasy textures.");
	output(" The pressure on your urethra relaxes, and a torrent of dick-goo finally flows through her innards, sloughing in her colon and giving you the feel you’ve stuck your ripened organ in a pool. More, far more prejizz flows afterward, moistening her cavern as well as the pussy creaming your");
	if (pc.balls > 0) output(" [pc.sack]");
	else output(" crotch");
	output(" with musky, fertile pheromones.");
	
	pc.cockChange();
	
	output("\n\nWhen you forcibly adjust her body for a proper fucking, when you begin to slide out for the first slam, Roxy purrs out her");
	if (firstTime) output(" newfound appreciation with anal");
	else output(" her begrudging adoration for anal");
	output(", settled nicely into the bench below. Her puckered prison imploring you to explore its uncharted depths and replace its emptiness with all the [pc.cockType " + kok + "] meat and [pc.cumVisc] spooge you’ve got.");
	
	output("\n\n<i>“Ummm, mmmfuck it...”</i> Roxy murmurs, her hips bracing in a satisfied gestalt of gracious eroticism. <i>“[pc.name], I’m gonna fucking hurt you bad if you don’t make the best of this, so you better take control and make me scream, you got it!?”</i>");
	output("\n\nFuck yeah you do! You’re squeezing her so tight you’re leaving imprints on her pelvis!");
	output("\n\nTaking the athletic bun by surprise, you yank her body upwards into you. A breathless gasp tears through her throat, piercing the empty air while you fondle her chest and rub down her muscles with sensual delight. You push her back down and fall on her, not so much a thrust as it is an animalistic display of control and dominance. Only then do you begin, rearing back to the fan of her wagging tail to pump in and out, moaning at how you never hit the same spot of inner flesh twice.");
	if (pc.cocks[kok].cType == GLOBAL.TYPE_EQUINE)
	{
		output("\n\n<i>“Oh f-fuck yes...");
		if (firstTime) output(" Never had a horse dick in my butt before, feels just as good as where it really belongs!");
		else output(" [pc.name], only thing saving your ass is the horse dick in mine!");
		output("”</i> she growls out, the veins of your bestial mast bulging out against vulnerable nerves on each thrust. When your medial ring knocks at her anus, she clenches up harder than ever. It takes all your strength not to cum after forcing your fat cock-halo inside, but you <i>swear she did.</i>");
	}
	if (pc.cockCanSting(kok))
	{
		flags["ROXY_VENOMDICK"] = 1;
		output("\n\nYour phallic stingers lash perniciously at her anal walls, offloading potent loads of craze-inducing venom. Roxy");
		if (venomDickFirst) output(" finally understands what those do, but she can’t find the words to comprehend the effect.");
		else output(" knew it was coming, but as she’s learning now, there’s no getting used to the overwhelmingly powerful sensitivity it induces.");
		output(" Even you begin to grunt, feeling some of it bleed back through into your loins. It takes a rather long time for the two of you to stop undulating madly with the mutual loss of muscle control and consciousness-edging tightness.");
	}
	output("\n\nRoxy twists ferociously in your grip, her fingers clutching tight to the rims of the seat. Her back legs rise up in strain and excitement, giving you more of a downward trajectory to fuck. On the outstroke she shakes and shudders, and when you’re plowing back inside she’s moaning and grinding, jerking your cock a few inches to the side with a squirm of the waist.");
	output("\n\nSweet nothings pour out of her mouth when you realize that she’s getting into this. Even you start to feel startlingly empty on those reverses, and you’re subtly reducing the amount of dick that remains outside of her chestnut cave.");
	output("\n\n<i>“D-dammit!”</i> Roxy grunts, slamming her fists into the cushion. Her digitigrade feet bend awkwardly around your [pc.thighs], like she’s trying to plow you harder into herself. <i>“You’re going too slow, [pc.name]! Don’t- make me-!”</i>");
	output("\n\nThat complaint, too, is silenced by another crash of your hips to her wanton bunny-hole. Reacting butt-walls tighten, spasming around your swelling member and expanding in fewer intervals. You heave back and rail her once more, bracing yourself to launch into an even faster pace that has her doing what you hoped. What you do is lance right through her tightest contraction, establishing dominion in a place she so adamantly defies pleasure from.");
	output("\n\nShe’s screaming now");
	if (pc.balls > 0) output(", especially loud when your [pc.sack] bounces wetly off her pussy");
	output(". <i>“THAT’S IT, STEELE! Just like that you sexy fucking [pc.raceShort]! Stuff your dick so deep- it-”</i>");
	
	output("\n\nThe breed-hungry bun bites down on her cheek; your [pc.hips] are hauling and driving [pc.cockNoun " + kok + "] into her faster than before. With the way you’re mounted on her, groping one sweaty boob and pinch-snagging the other ardor-imbued nipple, there’s nothing for the nubile fuckbunny to feel but happiness.");
	output("\n\nAll her body can do is accept the erect shaft of its fierce mate. For her, maybe it’s the wrong hole, but for you it’s the buzz of dominant assertion becoming a state of pure, breathy bliss, and while fucking Roxy is an exhausting task, the energies swirling around you in coital haze ensure there’s no stopping until the bunny’s been bred, regardless of what orifice you do it in.");
	output("\n\nNervelessness gives way to a blossoming warmth in your crotch, your body acting on its own now. You’re certain she can feel it too - the voices she makes are unmistakably orgasmic. Her succulent lips open into a broad ‘O’ shape that sparkles with pearlescent euphoria. When you look down past her thick leg you can see both of her paws at work on her cunt, viciously grappling with her mare-clit and jilling her drizzling fuckbox, dragging her further into incoherent ecstasy.");
	output("\n\nNot that you could claim to be any better off. You’re screwing her sphincter harder and harder, fucking her with such reckless abandon");
	if (pc.inRut()) output(" that you may satisfy your rut in her barren cavity.");
	else output(" that you look - and sound - to be in rut.");
	output(" You marvel at how her trim and fit ass cheeks can ripple like a cowgirl’s after every bone-burying thrust. When your hammer strikes, you meet her insistent pelvic grind with your own");
	if (pc.hasSheath(kok)) output(", threatening to drive your sheath in there too");
	else if (pc.hasKnot(kok)) output(", your bulged out knot giving her an idea of where all that cum is staying");
	output(".");
	
	output("\n\n<i>“Come on, come on...”</i> you hear Roxy whispering, nibbling at her lower lip. <i>“So close...”</i>");
	output("\n\nShe’s going to cum, and after all the unwillingness! Your lips spread into a wide grin after the next thrust. You lower your [pc.face] into her neck and bite down. <i>“Why are you being so <b>mean,</b> [pc.name]?”</i> she moans. <i>“Let me cum!”</i>");
	output("\n\nYou pinch her nipples on a slow reverse, leaving only the [pc.cockHead " + kok + "] to stretch her oval gap. <i>“S-Steele!! I’m almost there, d-don’t stop!”</i>");
	output("\n\n<i>“Why is that?”</i> you");
	if (pc.isBimbo() || pc.isBro() || pc.isNice()) output(" ask");
	else output(" snark");
	output(". Roxy groans again, trying to thrust backwards, but with your hands on her waist she can do naught but struggle and whimper in defeat.");
	
	output("\n\n<i>“Because it feels good!”</i> she surrenders. <i>“If you’re going to be like this,”</i> she pounds her fists against the bench again, <i>“then fuck me until I cum my brains out. That’s all I ahhh... ummm... all I waaaaant right now!”</i>");
	output("\n\nYou give another powerful thrust into her ass, hornier than ever after that tiny lull. Her tail weaves around your waist like a lasso, but there’s not much strength in downy fur. Enough pre is leaking from Roxy’s ass that you’d be forgiven for thinking it was a self-lubricating cavern. The ring of pregnable muscle dilates ever so slightly as her acceptance for anal joy elevates, and you’re filling that seething hole with all the ");
	if (pc.hasVagina()) output("herm-");
	output("meat you’ve got.");
	output("\n\nTrapped [pc.knotBallsHilt " + kok + "]-deep, you’re about to cum. Her moans, her cries, her drenching, violent orgasms are punctuated by tiny tremors. The laquine pleasure-seizes, all the liquid inside swirling around your [pc.cockHead " + kok + "] like a monster’s bending tongue. When another batch of laquine girlcream marks your");
	if (pc.balls > 0) output(" [pc.sack]");
	else output(" crotch");
	output(" with her scent, the pulls of her unconsecrated ground strum you into orgiastic baseness.");
	
	output("\n\nThere’s no way you can stop now, you’re going to orgasm right through your resumed, feverish humps. You just want to rail her, make her realize how good this feels, and how you can bring her to climax no matter what you do.");
	output("\n\nThe first masculine torrent surges through your body. Your swollen urethra, readied by the sex up to this point, is more than ready to handle it. You grab those pert, slutty tits of hers, groping a stronger feminine crash from Roxy, easing out a butt-stuffing orgasm from the twitching [pc.cockHead " + kok + "] plunging in and out.");
	output("\n\nHer tail goes limp; your eyes roll back; vision fading into coffee-flavored hues, you pump that rump so hard");
	if (pc.balls > 1) output(" that your tightening [pc.ballsNoun] slap painfully to her puffy vulva");
	else if (pc.balls > 0) output(" that your tightening [pc.ballsNoun] slaps painfully to her puffy vulva");
	output(".");
	if (pc.hasSheath(kok)) output(" Your sheath slips through her ring");
	else if (pc.hasKnot(kok)) output(" Your knot pops past her ring");
	else output(" Your [pc.base] locks to her entrance");
	output(", making sure the first shot goes deep with her head cradled to your neck, perfectly synced with her.");
	if (pc.hasVagina())
	{
		if (pc.isSquirter()) 
		{
			if (pc.vaginaTotal() > 1) output(" [pc.EachPussy] squirt");
			else output(" [pc.EachPussy] squirts");
			output(" floor-soaking erotic missiles of [pc.girlCum] at the apex of bliss.");
		}
		else
		{
			if (pc.vaginaTotal() > 1) output(" [pc.EachPussy] flush");
			else output(" [pc.EachPussy] flushes");
			output(" tiny, mound-coating streams of [pc.girlCum] in distant girly release.");
		}
	}
	
	processTime(15 + rand(15));
	
	if (pc.cumQ() >= 10000)
	{
		output("\n\nThe first vibrant load of [pc.cum] that blasts through your [pc.cock " + kok + "] like a volcanic detonation of masculinity. Her asshole is incandescent with ecstasy, and so is your [pc.cockColor " + kok + "] rod. You let your glazing eyes drift ashut on a staccato of [pc.legsNoun]-writhing pleasure. Her anus, her entire body, for all its anti-anal grumblings, is guzzling your [pc.cumFlavor] spooge down. Acquiescence doesn’t spare her ring from further torture -- the sheer weight, force, and strength of your [pc.cumVisc], busting nut spreads her slightly wider to handle it.");
		output("\n\nIt’s no surprise that it blasts back out around your [pc.knotOrSheath " + kok + "]. Her whole body lifts shakily on a fast distending belly, the difference in weight hosing your abdomen with your own goopy load. In the space of only a few cumshots, your ribbony pulses are just throwing it all through what available internal space there is... or all over your crotch.");
		if (pc.cockTotal() > 1) output("\n\nSomeone’s going to be mad as hell when they get back and find the floor (and their clothes) totally blanketed in a [pc.cumColor] tide of sperminess. And yet more still surges through your extra equipment. You could probably cover a playing field with the stuff and ruin games for a day. As it is, you’re only ruining the aggressive laquine under your body.");
		pc.applyCumSoaked();
	}
	else if (pc.cumQ() >= 6000)
	{
		output("\n\nIt takes a grit of the teeth and a bit of mental pressure on your cum-plumbing to kick it into high gear. The obstruction cleared, [pc.cum] erupts in long, flexing, orgasmic columns. [pc.CumVisc] hardness flows into her rippling intestines and then her rounding stomach, taking the scenic route through her body before adding liquid circumference to her once toned and defined belly. Roxy’s stomach swells into a large, attractive bubble of sloshy [pc.raceShort]-cream that’d others would think marks the beginning of pregnancy.");
		output("\n\nTo her chagrin, it doesn’t.");
		if (pc.cockTotal() > 1) output(" The sheer amount of [pc.cumFlavor] jizz you’re painting her whole body with will leave no doubt what she gets up to in her spare time, and for anyone using this room later it’ll be an obvious reminder of your inordinate virility.");
		pc.applyCumSoaked();
	}
	else if (pc.cumQ() >= 3000)
	{
		output("\n\nA supreme sensation of tranquility and rightness bubbles through your brain-box as the the first girthy pillar of [pc.cum] crashes into Roxy’s colon. The bunny-girl’s shudders intensify, her hands eagerly rubbing across her fur to relax, to help more of that urethral straining orgasm enter her body. So much [pc.cumVisc] spunk pools inside that it only has two directions to go when your [pc.cock " + kok + "] pulses: further into her intestine toward her rounding spunk-gut, or back out against your crotch, into your groin.");
		if (pc.cockTotal() > 2) output(" Wherever it chooses to trickle, you know that her exterior isn’t spared from this critical moment: your extra dicks pneumatically pump load after load into her hair, against her spine, all over her ass cheeks, slicking so much of the stuff that it outlines the bench’s shape below.");
		else if (pc.cockTotal() > 1) output(" Wherever it chooses to trickle, you know that her exterior isn’t spared from this critical moment: your extra dick pneumatically pumps load after load into her hair, against her spine, all over her ass cheeks, slicking so much of the stuff that it outlines the bench’s shape below.");
	}
	else if (pc.cumQ() >= 500)
	{
		output("\n\nEnviable ejaculation flows in short columns, and it’s everything Roxy was hoping for. [pc.Cum] foams at [pc.eachCockHead], launching in thick colon-searing lassos, making her shut down a bit tighter to milk it all out. [pc.CumVisc] spooge doesn’t pour back out, storing away in a laquine’s tight bum. Of all the sensations coursing through your mind, the one that matters most is how good it feels to leave a nice, churning reminder of yourself in someone.");
		if (pc.cockTotal() > 2) output(" And on them, too! [pc.CumNoun] leaks down Roxy’s side, sticking to your belly on its trickle to the floor, your extra dicks putting the dregs of your orgasm where they need to be.");
		else if (pc.cockTotal() > 1) output(" And on them, too! [pc.CumNoun] leaks down Roxy’s side, sticking to your belly on its trickle to the floor, your extra dick putting the dregs of your orgasm where they need to be.");
	}
	else
	{
		output("\n\nHappy feelings course through your mind and down your spine. Small ropes of [pc.cum] shoot out from your [pc.cockHead " + kok + "], webbing through your cumslit in breathtakingly smooth throbs. Every spurt is easy, relaxing, and heralded with appreciative grunts from you and the satisfied laquine, though part of you wonders if she’s truly pleased with your middling output.");
		if (pc.cockTotal() > 1) output(" It’ll have to do, though. You’re certain likes what’s dribbled down her buttcheeks from your unholstered [pc.cocksLight].");
	}	
	
	output("\n\nWhen the hew of release fades, leaving you in a shimmery, giggly afterglow, you withdraw your quivering [pc.cockNoun " + kok + "] from Roxy’s asshole");
	if (pc.hasKnot(kok)) output(" after your knot deflates");
	output(". Her rear still languishes in the air, rocking back and forth with a twitch-provoking sway. [pc.CumNoun] bubbling out of her bum like a sieve, oozing down across her pussy in some sort of ironic display.");
	output("\n\nAnother spurt of femcum spits out of her pussy when the trickle touches her clit.");
	output("\n\nShe finally collapses, still hyperventilating. You’re doing much the same, but even though you can’t speak, you’re still looking over each other with sexy ‘fuck me again’ eyes, already wondering how next time is gonna go.");
	output("\n\nRoxy barrels upwards on a font of adrenaline, cracking her stiff neck and back and slapping you on the shoulder. <i>“Loved that, [pc.name].”</i> She grips your [pc.ass]. <i>“But next time, seriously, breed the <b>right hole</b>, you fucking dork. And if you think about using that hole again,”</i> she says, standing, already back to her usual self, <i>“...then you better fuck it as good as this time or better, because you’re gonna regret what happens if you don’t put up.”</i>");
	output("\n\nYou watch Roxy hose herself down in a shower, shaking the moisture (and your cum out) before redressing. <i>“");
	if (flags["ROXY_STERILEX"] == 1) output("Seriously, asking me to take the pill and then fucking my ass, that’s a bit mean... Well, like I said, you’re good at what you do. ");
	output("See ‘ya. Don’t be a stranger. Not a lot of good fucks around here,”</i> she casually congratulates, whistling on her way out the door.");
	output("\n\nAbout time you get going, too.");
	
	flags["ROXY_DOGGY_LAST"] = 1;
	IncrementFlag("ROXY_SEX");
	IncrementFlag("ROXY_DOGGY_ANAL");
	roxy.loadInAss(pc);
	pc.orgasm();
	pc.shower();
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}
public function roxySoxyTakesYourCoxyInHerBoxyDP():void
{	
	clearOutput();
	showRoxy(true, true);
	
	var kok:int = pc.cockThatFits(roxy.vaginalCapacity(0));
	if (kok < 0) kok = 0;
	var kok2:int = pc.cockThatFits(roxy.analCapacity(), "volume", [kok]);
	if (kok2 < 0) kok2 = 0;
	var kok3:int = -1;
	if (pc.cockTotal() > 2) pc.cockThatFits(roxy.vaginalCapacity(0), "volume", [kok, kok2]);
	var firstTime:Boolean = true;
	if (flags["ROXY_DOGGY_DP"] >= 1) firstTime = false;
	var knowName:Boolean = false;
	if (flags["ROXY_SEX"] >= 1) knowName = true;
	var pregTri:int = roxyPregTrimester(true);
	var venomDickFirst:Boolean = true;
	if (flags["ROXY_VENOMDICK"] == 1) venomDickFirst = false;
	
	if (firstTime) output("Her world is going to be more than rocked when you’re through.");
	else output("You’re not going to keep her waiting. That would be dishonest!");
	
	output("\n\nWith all haste you seat yourself behind the unashamed slut-bun,");
	if (pc.cockTotal() > 2) output(" your chosen [pc.cocksLight]");
	else output(" both [pc.cocks]");
	output(" throbbing hard in the warm presence of her puddling horse-cunt and winking ring of anal muscle. You grip both of your ready rods together, adding a few inches, expanding them with a little finger pressure, sliding the [pc.cockHeads] across Roxy’s rubbery, drizzling slit.");
	if (pc.cockTotal() > 3) output(" The others bounce away, all the [pc.cumColor] prejizz they leak sliding down the laquine’s asscheeks.");
	else if (pc.cockTotal() > 2) output(" The third bounces away, all the [pc.cumColor] prejizz it leaks sliding down the laquine’s asscheeks.");
	
	if (firstTime)
	{
		output("\n\n<i>“I’ve never let someone do this before, but after last time I want to see how you do at your best, [pc.name],”</i> she groans out, a husky little vocalization of her fluttering desire. <i>“Maybe I’ll let you use both from now on if you don’t fuck up.”</i>");
		output("\n\nYou grin at her grin, making no promises. After all, who better to decide if two dicks are fucking awesome than the one about to take ‘em?");
	}
	else
	{
		output("\n\n<i>“You’re gonna fuckin’ ruin me for anyone else with those things.”</i> Roxy moans that husky little number you know her for. <i>“Can’t complain. Not every day that someone, like say a lucky laquine, gets both holes filled <b>and</b> gets a shot at giving birth!”</i>");
		if (flags["ROXY_STERILEX"] == 1)
		{
			output("\n\nShe laughs. <i>“Well, she would, if a certain ");
			if (pc.hasVagina()) output("herm-");
			output("[pc.raceCuteShort] didn’t want her on the morning-after. Fucker,”</i> she playfully ribs you with an elbow, <i>“better make me forget I thought about that!”</i>");
		}
		else output("\n\nShe laughs. <i>“What are you waiting for? Stuff me, [pc.name]!”</i>");
	}
	
	output("\n\nYou draw your");
	if (pc.cocks[kok].cType == pc.cocks[kok2].cType) output(" matched");
	else output(" mixed");
	output(" cocks close to Roxy’s radiant femininity, prodding at her mare-button with either cock head in alternating thrusts, fingering one end of her red-hot gash. It’s like you’re humping against latex; those rubbery folds of horse-pussy eagerly supplicate, trying to absorb you into their sinfully sweet, warm crevices. Your pupils stretch into ocular dinner plates; the time spent staring at her musky, glossy pocket only amplifies the desire to cum helplessly on the spot.");
	output("\n\nClear torrents of rabbit-girlspunk ooze as seconds pass, splitter-splattering when you spank her ass; you lewdly slap [pc.eachCockHead] to her anticipatory quim, slathering your tools in that potent and roiling texture. The more you tease her sparkling labia, the more you swirl her clitoral hood, the more inconsolable she becomes.");
	output("\n\n<i>“C’monnnnn [pc.name]..!”</i> she groans rasply.");
	if (firstTime) output(" <i>“I can’t stand the teasing, just rail me into this bench so hard it snaps!”</i>");
	else output(" <i>“You know how much I hate the teasing. Is sucking your dick not good enough now?”</i>");
	output("\n\n<i>“Calm down,”</i> you gurgle out a half-laugh, finally stopping and aligning your quaking crowns with her dual orifices. <i>“We’re getting there, and we’re getting there at <b>my pace.</b>”</i> You punish her asscheek one more time and lean forward, mounting the rabbit,");
	if (pc.tallness >= 70) output(" obscuring her under your body.");
	else output(" hugging her lower waist.");
	output(" Roxy purrs to your assertive languages, chewing her lip while rocking her deliciously curvy bottom into your crotch.");
	
	output("\n\nIn a once-gentle embrace, you pinch Roxy’s teats between two fingers and two thumbs, growling into the back of her neck, letting your sexually-charged breath wash across her nape toward her trembling lips. She braces - when you throb again, you slam forward, spearing the laquine on your tingling and rigid cocks.");
	output("\n\nYour first [pc.cockHead " + kok2 + "] plows through her anus like a battering ram -- her head rockets up, her ears flick heavily, and a hoarse yelp tumbles from her lips. Your second [pc.cockHead " + kok + "] wiggles through her inundating pussylips, nectar bursting over its");
	if (pc.cocks[kok].cType != GLOBAL.TYPE_HUMAN) output(" bestial");
	output(" shape on the trip to her core. Rhythmic bliss shockwaves through your mind, overwhelming you with senseless need.");
	output("\n\n<i>“Ahhh!”</i> she howls, tongue lolling; you pinch at her tits harder, giving an animalistic ‘bark’ when you force your [pc.knotBallsHilt " + kok + "] up against her labia. There’s a moment she turns to you with a minimum of concern writ upon her muzzle, but in her glowing, horny eyes, you see only adoration, love, and cum-hungry desperation for your veiny hardons. Before you’ve bottomed out, you map the spaces of her pussy and ass, realizing this is a lot like walking through the gates of paradise.");
	output("\n\nWho knew heaven was just through a bunny-girl’s backside?");
	
	pc.cockChange();
	
	output("\n\nHooked by her raw, inhuman vagina and tensing tailhole, you cannot go slow - <b>you will NOT be compelled by inferior urges.</b> Roxy rocks back and forth at the sudden uncaring pace you launch into. <i>“W-woah,”</i> she murmurs, sex-juices splattering against her butt and spraying in circular arcs from the force of your bunny-breeding plunges. You thumb her nipples, attached to her like a primitive animal, fulfilling every single one of her innate, base desires.");
	if (pc.cocks[kok].cType == GLOBAL.TYPE_EQUINE && pc.cocks[kok2].cType == GLOBAL.TYPE_EQUINE) output("\n\nYour bestial horse-cocks drill in and out of Roxy’s holes hard enough that your medial rings push their way in, coming out gleaming with dick or pussy slime. Something tells you she appreciates nothing more than that now, that nothing else in the galaxy can quite compare to this moment for her, being double stuffed by two, fat, turgid stallion-pricks. Her pussy was made for no other dick. Her ass... well, she’s a laquine.");
	if (pc.cockCanSting(kok) || pc.cockCanSting(kok2))
	{
		flags["ROXY_VENOMDICK"] = 1;
		output("\n\nRoxy’s lavish interior is stung by the uncontrollable urges of your venom-bearing dick tendrils. An astonishing, lung-rending rush of liquid lust courses through her veins, being delivered to the most sensitive regions of her body. Her cock-gnashing bubble-butt yields unceremoniously to your weight now, her holes suckling in spectacular ecstasy.");
	}
	output("\n\nNot to be outdone, the blissed-out rabbit closes her eyes and lurches backwards when you withdraw. In this position she’s not able to meet your thrusts stroke for stroke, but she can keep you guessing as to <i>when</i> her ass is going to crash into your abdominals. The whiplash of muscly bun-butt combined with the olfactory assault of mixed, musky lubricants make you feel way too good, way too soon.");
	output("\n\nHonestly, you’re wondering who’s galvanizing the other: whose pelvis is losing a little bone density? Whose senses are being lost to the rapid, slapping strokes?");
	output("\n\nThe pleasure of pussy and ass is a series of spiking pleasures -- <b>intense,</b> skeleton-rattling pleasures. You <i>love</i> those flashes the most, when both cocks are plunged deep inside for that brief, transient moment that vibrates her entire lower half. At that precious second they simultaneously throb, reveling in the feel of the other through the thin, rippling muscles separating them, and her glossy twat puffs out a little more. All the pre and pussy juice dribbling out, and the stability of the bench, makes screwing the fuck-happy laquine even easier.");
	output("\n\n<i>“H-h-holy s-s-sshhhh,”</i> Roxy whimpers, <i>“you’re really going- at- it- [pc.name]-!”</i> Your ultra-hard erections dominate her psyche while her vaginal nerves reflexively scissor them deeper. Coffee-colored fur bristles with sweat and intense focus; you pinch her nipple long enough to force her into a gasp, stopping only to let her inhale, and then you’re fucking it all out of her again. The only question now is when you’ll cum, when you’ll give her what she wants, when you gift her holes with the first, freshest loads.");
	output("\n\n<i>“S... Steeleeeeee!”</i> All she can accomplish is moan, and that’s something she’s doing with flying stars. You’re seeing stars, for that matter, an oversized grin on your face. One [pc.hand] still on her tit, you grab Roxy by the ears and turn her face towards you, an idiotic smile on her muzzle.");
	output("\n\nHer deep moans are only broken by the impact of your");
	if (pc.balls > 0) output(" supple cumsack");
	else output(" [pc.base]");
	output(" against her pulsing clitoris, is firmness felt easily through the softness of your [pc.skinFurScalesNoun]. She’s just howling like a cat in heat, not even able to look at you, squeezing your [pc.cocks] like the rabbit-eared fucktoy you’ve moulded her into.");
	
	output("\n\nWagging with a blur, fluffy equine tail snaps back and forth. The tension on your back drains when you shift a lot of the weight to her, crushing her between the bench");
	if (pc.hasTits()) output(", your [pc.breastsNoun],");
	output(" and your two hyper hard schlongs. You pound her like a jackhammer, sawing her colon in half while negotiating entrance to her womb.");
	if (pc.cocks[kok].cLength() >= 8) output(" Fortunately, you’ve got the length to get there despite her capacity, and you can feel that gate opening to your [pc.cockNoun " + kok + "].");
	else output(" Given your size, you probably won’t make it, but your sperm will.");
	
	output("\n\nIt takes a lot of willpower to keep your eyes from rolling back like hers. It’s a constant struggle with the demands of your loins, your [pc.cocksLight], her holes, her body... and the need to know what’ll happen when you breed this rabbit like the bitch you’re making her out to be.");
	output("\n\n<i>“G-God! Damn, fuck!”</i> Roxy wails, pounding her fists into the bench, gripping its rims. <i>“THIS IS THE BEST!”</i> she screams, wanting everyone to hear her. <i>“[pc.name]! You’re the best!! You’re the absolute best, now don’t you fucking dare slow down, YOU KEEP THIS GOING THE REST OF THE WAY!”</i>");
	output("\n\nYou’re going at it like, well, a pair of bunnies. Your savage thrusts into Roxy’s body are breathless; your eyes shut to better enjoy the pressurized spasms around your [pc.cocks] and the keen drip-drip-drip of every crystalline bodily fluid. You can’t hope to come up with comparisons that do justice for the blissful, colorful circles dominating your sightlessness.");
	output("\n\n<i>“Aaacchhhfffffff...”</i> Roxy groans, her moistened hair throwing sweat everywhere. The raunchy rabbit is cumming her brains out around both silk-sheathed cocks, clenching down and coming so very close to proper squirts. Even her ass is ‘cumming’ in its own way, but it’s all your [pc.cumColor] pre trickling back out of those muscled folds.");
	output("\n\nYou carry on fucking her properly (<i>very properly</i>) through that acute, orgasmic susceptibility, <b>smashing</b> your way back in through all the natural bodily resistance. It only makes her fountain your abdomen with small jets of girlcum, splattering across your [pc.legOrLegs] with heedless abandon. Every time you plow through her walls she sings a praise or, like now...");
	output("\n\n<i>“T-Tha...”</i> Roxy lifts up a tiny bit, pushing herself into your back just to agitate your ecstatic resolve. A backwash of femslime causes you to gasp and she takes the opportunity granted by your inaction. <i>“THAT ALL YOU GOT?”</i> she snarks, gripping your hands and squeezing hard enough to break your bones. <i>“I-I’m not gonna g-g-go just like that!”</i>");
	output("\n\nSuddenly all of her strength wanes -- all it took was");
	if (pc.hasKnot(kok) || pc.hasKnot(kok2)) 
	{
		if (pc.hasKnot(kok) && pc.hasKnot(kok2)) output(" the grind of your [pc.knots] to her holes");
		else if (pc.hasKnot(kok)) output(" the grind of your [pc.knot " + kok + "] to her hole");
		else output(" the grind of your [pc.knot " + kok2 + "] to her hole");
	}
	else if (pc.balls > 0) output(" the slap of your [pc.sack] to her black pearl");
	else output(" another taut pump of turgid cock");
	output(" to shove her forcefully back into her rightful place. <i>“Ooh,”</i> she coos, her tail wagging harder and harder, excessive lust setting her teeth achitter.");
	output("\n\nIt’s almost like her leporine musk has induced a tiny bit of lagomorphic rut in you.");
	if (pc.inRut())
	{
		output(" Not that it matters. You’re so far into a primitive urge to breed that it’s merely a draft against the raging inferno that is your want to knock her up.");
		if (flags["ROXY_STERILEX"] == 1) output(" You know that she can’t get pregnant, but it’s the thought that counts");
	}
	else output(" You don’t care what it is, she’s yours right now.");
	output(" She pointed her ass at your [pc.cocks], and she’s going to get the creampies she <i>deserves.</i>");
	
	output("\n\nTo make sure Roxy doesn’t defy you anymore, you slide your [pc.arms] under hers and around the back of her neck like a well-oiled machine, clasping your [pc.fingers] and adding a little more weight to the unruly derby-bun. Your vigorous thrusts are now rewarded with the largest shockwaves of girlcum. Her sweat-impregnated fur fans spongily when you hammer home; slathering laquine walls ruthlessly batter your gemini girths.");
	if (kok3 >= 0)
	{
		output("\n\nIt’s quite surprising you find the time and sense to realize you could be doing just a bit more for Roxy. Her hungry twat is large, and your one [pc.cockNoun " + kok + "] is doing fine... but you have");
		if (pc.cockTotal() > 3) output(" an extra");
		else output(" another");
		output(" that could be there with it. You act quickly, that second [pc.cock " + kok3 + "] inside and stuffing her with two pricks at once even while her ass is brimming with ");
		if (pc.hasVagina()) output("herm-");
		output("meat. <i>“F-fuck! Did you j-j... ooohhh you’re a GENIUS [pc.name]!!”</i>");
	}
	output("\n\nYour mind is stepping naked into the inferno of explosive, life-seeding orgasm. Fuck-crazed pussy nerves are intent on milking your cock of all the cum sealed away. Quite frankly she’s got the firmness of a knot!");
	if (pc.balls > 0) output(" Even her clit, pulsing with incredible pleasure, is dedicating its existence to brewing up a fat load in your [pc.balls] when they come to microseconds of rest on her delicate vaginal plateau.");
	output(" All of Roxy’s sass dissipates into fuel for the sense-annihilating ecstasy skewering her from behind.");
	output("\n\nPast the breaking point, your own jaw clenches from the cascades her regularly-climaxing body puts on you. Any muscle not used for the purpose of sex, any nerve online that isn’t part of the act, those all shut down. Dots of sexual light brighten the moments of darkness, and your vision dissipates into a gold and brown hue even when you’re not blinking.");
	output("\n\nSo much juice is pouring from Roxy’s ardent cocksheaths and your throbbing rods that you feel like you’re fucking her in shallow water. This whole place could be flooding, you could be drowning, and none of that would matter one stars-damned bit. You’re asserting on a sex-happy rabbit-girl with all your strength, and <i>she’s loving every second of it.</i>");
	output("\n\nMuscles aching all over, you do anything in your power to molest other sounds of euphoria from her: mauling her boobs, pinching her tits, and thrusting as viciously as you can.");
	output("\n\n...The door slides open. <i>“O-oh, s-shit, sorry, I didn’t-”</i>");
	output("\n\n<i>“G-GET THE HELL OUT!”</i> Roxy bellows.");
	output("\n\nThe door doesn’t close right away, and then there’s a catcalling whistle. <i>“‘Ey, ROX! TAKE THOSE DICKS YA SLUT!”</i>");
	output("\n\nYou almost get distracted enough to offer up an insult of your own, but your fuzzy bunny slams the bench and twists her head. <i>“ALREADY DOING THAT, FUCK OFF AND GET YOUR OWN!”</i>");
	output("\n\nThe door finally slides shut, and the steamy air is sealed back in. You realize you slowed down. You’re laughing, because your punky laquine is too. <i>“I can’t BELIEVE that shit. They know I last longer than they do! And what do- you-”</i> she pauses, and elbowing you in the gut. <i>“Speed the fuck up, [pc.name], how can you be slowing down after all that!?”</i>");
	output("\n\nHer wish is your command. You take a deep breath, assured it’s going to be the last one you get for a time, and build back up to the pace from before, clutching one fertile thigh and one perky boob. You’re not sure what to feel. For how hard you rail the vivacious hare, the job never seems like one you can succeed at.");
	output("\n\nThat’s what you get, you suppose, for going at it with a laquine.");
	if (pc.balls > 0) output("\n\nYour [pc.balls]");
	else output("\n\nYou");
	output(" begin the process of releasing your load, and it’s with the game winner’s enthusiasm you claim your trophy. Roxy’s greatest orgasm is certainly upon her too. The sounds she makes when you growl in her ear are to be <i>loved.</i> There’s this kind of lilt to them, they slump a bit in a show of subservience before bouncing back up when you let her get too aggressive.");
	
	output("\n\nSweltering cock-hungry folds methodically press upon what’s claimed them so thoroughly, and the subsequent sensory collapse is something you enthusiastically embrace. On your final, thunderous thrust, you cradle Roxy’s head to your neck, arm pressed perniciously to her throat");
	if (pc.hasKnot(kok) || pc.hasKnot(kok2)) 
	{
		if (pc.hasKnot(kok) && pc.hasKnot(kok2)) output(", cum-corks sliding into place in her bunny-holes");
		else if (pc.hasKnot(kok)) output(", cum-cork sliding into place in her pussy");
		else output(", cum-cork sliding into place in her ass");
	}
	output(".");	
	processTime(15 + rand(15));
	if (pc.cumQ() >= 10000)
	{
		output("\n\nYou can feel the heat of your orgasm long before it pumps out of your molten-hot rods. You and Roxy shake violently when the first voluminous pillars of [pc.cum] geyser, not a moment of rest allotted before the rest come. The laquine’s body may be suitable for your breeding rods, but it is certainly not built to naturally handle the [pc.cumFlavor] torrent of seed-filled spooge");
		if (pc.balls > 0) output(" packed away in your [pc.balls]");
		output(", a womb- and intestine-stuffing gush of spunk that’d shame a large percentage of her race.");
		
		output("\n\nYou swallow, and you find that your mouth is bone dry. Cum is everywhere");
		if (pc.hasKnot(kok) || pc.hasKnot(kok2)) 
		{
			if (pc.hasKnot(kok) && pc.hasKnot(kok2)) output(", and your knots are helpless to seal it in");
			else output(", and your knot is helpless to seal it in");
		}
		output(". You’re like a hydrant smashed apart by a drunk driver, just splashing Roxy with fat [pc.cumColor] wads of boiling jism that spread her clinched walls apart - and your cum-vein too - on each shot. It’s a force of masculinity that can not be denied in any way, shape or form, and it’s taking a part of your soul with it.");
		
		output("\n\nIt keeps going. You’re still cumming. It’s obvious you’ve completely inflated the poor bunny - she’s balancing precariously on a huge, bubbly tummy, all of its muscles absorbed into a spherically pudgy mess of [pc.cumGem] nut. There’s no way she’s not feeling more musk than laquine right now, and while you flex out the last of your double eruption and splatter your entire lower half with your own flood, you gurgle out a half giggle when you caress her big round stomach, knuckles gone white from holding on so tight.");
		if (pc.cockTotal() > 2) 
		{
			output(" When you’re able to open your eyes, you see that your unslotted dick");
			if (pc.cockTotal() > 3) output("s have");
			else output(" has");
			output(" deposited a comical spooge-tsunami on roxy and the rest of the room. A cartoonishly thick blanket of sperm covers the floor, has hit several lockers, and left no doubt as to who this [pc.cumColor]-painted rabbit belongs to. What muscles and curves remain on her do little to impede the flow of your excess [pc.cumNoun].");
		}
		pc.applyCumSoaked();
	}
	else if (pc.cumQ() >= 6000)
	{
		output("\n\n[pc.Cum] firehoses into Roxy’s waiting womb and erupts powerfully into her colon. You pound a fist to the bit of seat in front of her face, biting your lip.");
		output("\n\nIn the space of three cumshots you’re both dizzied by the sheer strength of your undeniably feral orgasm, throwing out gallons of geysering goop. The laquine might quip about your virility mods if she wasn’t left agasp at being stuffed so hard and so fast that it backwashes against your groin like an obscene water spout. It’s the kind of orgasm that’d leave a simpering bimbo drooling off to the side eagerly waiting for you to come and give her the same if she wasn’t scooping it all off the ground like a cum thirsty mop. ");
		output("\n\nNot only do you drown Roxy’s ovaries in [pc.cumVisc] spooge, but you swell her taut tummy into a small sphere that only make her shake with an extra climax.");
		if (pc.cockTotal() > 2) output(" Then you finally turn your attention to the outside, not ignoring that you’ve busted one hell of a nut all over her body and the rest of the locker room. It’s in her hair, sliding down her glutes, and of course, absorbing nicely into her fur. Hopefully your scent won’t wash out. You like that her clit is wearing a [pc.cumGem] crown of it too.");
		pc.applyCumSoaked();
	}	
	else if (pc.cumQ() >= 3000)
	{		
		output("\n\nShuddering gasps tear through your throat as the first columns of [pc.cum] blast through your rod, spraying Roxy’s innards with fat wads of bubbly jizz, filling every crease of vaginal and anal interior. Your position atop her, and her upraised ass, ensure that your funneling, [pc.cumVisc] spooge only goes down toward her womb, past her dilated cervix and towards her waiting ovaries. The rest of it travels through her intestine, only adding to the trembling stomach bloat.");
		output("\n\nAll that matters is that at the end of your puddling spout she has a gut nicely rounded by your virile and debilitating release");
		if (pc.cockTotal() > 3) output(", and that her caramel fur is now a distinct shade of [pc.cumColor] thanks to the payloads your unslotted dongs have dutifully pumped into it");
		else if (pc.cockTotal() > 2) output(", and that her caramel fur is now a distinct shade of [pc.cumColor] thanks to the payload your unslotted dong has dutifully pumped into it");
		output(".");
	}
	else if (pc.cumQ() >= 500)
	{		
		output("\n\n[pc.EachCockHead] inflates, your cumslits flare, and the first thick lassos of [pc.cum] surge through your spunk-swollen rods. You and Roxy moan softly, both enjoying the gush of overflowing spunk relieving into two places, that delightful warmth that plasters <i>those</i> spots inside. You’re providing her womb and colon an equal amount of [pc.cumVisc] treat, the result of your hard-fucked lusts. Those little mewls coming from her indicate no displeasure whatsoever.");
		if (pc.cockTotal() > 3) output(" Long lines of the [pc.cumFlavor] jism pool onto Roxy’s back, pumped out by your unholstered dongs. You take a moment to rub some of it in, hoping the scent sticks.");
		else if (pc.cockTotal() > 2) output(" Long lines of the [pc.cumFlavor] jism pool onto Roxy’s back, pumped out by your unholstered dong. You take a moment to rub some of it in, hoping the scent sticks.");
	}
	else
	{
		output("\n\nA light outpouring of [pc.cum] surges through your [pc.multiCocks], spurting into the she-rabbit’s womb and colon in equally middling amounts. Your [pc.hips] wiggle around automatically, flexing out thin ropes onto her G-spot, and <i>that</i> wonderful zone in her asshole. You’re not sure if your [pc.cumVisc] payload will have the effect she wants, but the delightful release on your mind, of giving both sensitive ends one-hundred-percent, is the one you wanted. ");
		if (pc.cockTotal() > 2) output("\n\nAnd you’re sure the few erotic [pc.cumColor] lines you’re painting her back with are good enough consolation!");
	}
	output("\n\nA few tense, relaxing spurts later, you withdraw from Roxy’s abused holes and the rabbit slumps");
	if (pc.cumQ() >= 3000) output(", her spunk-belly depressing into the bench and geysering a gratuitous spillage from her butt. You also squirt out a few more loads that make her pussy spurt on contact");
	output(".");
	output("\n\n<i>“O-oh... wow...”</i> she nuzzles her cheek into the bench, tongue hanging. When she finally reels it back in, she tries to lift up, whole body writhing in lust-drunk haze. <i>“D-damn, [pc.name]...”</i>");
	output("\n\nYou’re trying hard to catch your breath just a few inches away, waiting for your messy cocks to soften. It takes you off guard when the tough-talking rabbit swirls around and crawls over to polish your [pc.cocksLight]");
	if (pc.balls > 0) output(" and ballsack");
	output(". You’re not sure if she did that for your sake or hers, because it perks her right back up. <i>“Nice work,”</i> she mumbles, butting shoulders with you.");
	if (pc.cumQ() >= 3000)
	{
		if (pregTri > 0) output(" <i>“You trying to add to the litter?”</i> she inquires.");
		else output(" <i>“Man, it’s like I’m pregnant already!”</i> she giggles.");
		output("\n\nYou pat her belly and shrug, feeling swollen, tender, but somehow ready for another go.");
	}
	else output("\n\nYou pat her shoulder and shrug, feeling swollen, tender, but somehow ready for another go.");
	
	output("\n\n<i>“I don’t need to tell you that was fucking awesome,”</i> Roxy stands. Just doing that looked exhausting, though she tries to hide it. <i>“You tell me when you want another go,”</i> she waves, stepping towards a shower.");
	output("\n\nAs Roxy washes up, you briefly wonder");
	if (pregTri > 0) output(" if you overdid it, but she, and her babies, seem alright.");
	else if (flags["ROXY_STERILEX"] == 1) output(" if you should ask her to get off contraceptives.");
	else if (pc.virility() > 0) output(" if she’s going to get pregnant.");
	else output(" if you overdid it, but she seems alright.")
	
	output("\n\n<i>“See ‘ya [pc.name],”</i> she pecks you on the cheek, whistling on her way out of the locker room a new bun. When you can finally stand on your own [pc.legOrLegs], you rinse");
	if (!pc.isNude()) output(", dress,");
	output(" and get back to the stadium.");
	
	//set this to cock total so we know how many dicks steele had for this in dialogue
	flags["ROXY_DOGGY_LAST"] = pc.cockTotal();
	IncrementFlag("ROXY_SEX");
	IncrementFlag("ROXY_DOGGY_DP");
	pc.exhibitionism(1);
	roxy.loadInCunt(pc,0);
	roxy.loadInAss(pc);
	pc.orgasm();
	pc.shower();
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function roxyBreedHer(kok:int=0):void
{	
	clearOutput();
	showRoxy(true, true);
	
	var firstTime:Boolean = true;
	if (flags["ROXY_BREED"] >= 1) firstTime = false;
	var knowName:Boolean = false;
	if (flags["ROXY_SEX"] >= 1) knowName = true;
	var knowRoxy:Boolean = false;
	if (flags["ROXY_MET"] == 1) knowRoxy = true;
	var onPill:Boolean = false;
	if (flags["ROXY_STERILEX"] == 1) onPill = true;
	
	//set to one so special rut intro will play on next meeting
	if (flags["ROXY_MET"] != 1) flags["ROXY_RUT_INTRO"] = 1;
	//set rut reject to 0 in case it was set to 1 somewhere else
	flags["ROXY_RUT_REJECT"] = 0;
	//this skips the normal talk as it is in the special rut intro instead and sets her to fertile
	flags["ROXY_TALK_FETISH"] = 1;
	//set to off pill because she is guaranteed to get pregnant and set birth control override flag
	if (onPill)
	{
		flags["ROXY_STERILEX"] = 0;
		flags["ROXY_STERILEX_OVERRIDE"] = 1;
	}
	else flags["ROXY_STERILEX_OVERRIDE"] = 0;
	
	output("On one hand you could sit in your ship doing nothing, waiting for this thought-obstructing rut to go away, just thinking about all the waiting, willing pussies out there needing to be pumped full of sperm. All those rippling muscles with unending depths and a bottomless appetite for cum taking the tidal wave of heavy, thick virility you’ve got bubbling inside your");
	if (pc.balls > 0) output(" trembling [pc.ballsNoun]...");
	else output(" crotch...");
	
	output("\n\nBut you don’t have to think now, because you’ve found the only pair of legs you need to pry apart:");
	if (knowRoxy) output(" Roxy, literally humping your leg like an animal in heat.");
	else output(" this laquine’s, whoever she is.");
	output(" The molten pressure of her crotch against yours could make you shoot out all those [pc.cumGem] ropes <i>outside</i> her cunt, wasting them forever. Every [pc.cumVisc] drop of needful nut you’ve got <i>has</i> to fill her. Why the fuck are you just standing here thinking about it?!");
	
	if (knowRoxy) output("\n\n<i>“Let’s go!”</i> Roxy");
	else output("\n\n<i>“Let’s go!”</i> the slut-bunny");
	output(" grips you by the shoulders. <i>“I know the right room, just keep it");
	if (pc.isCrotchExposed()) output(" from hitting anything");
	else output(" in your pants");
	output("! If you blow early </i><b>I’ll END you.</b><i>”</i>");
	output("\n\nAfter grabbing her bag, she snaps her fingers in front of your [pc.eyes]. <i>“Don’t glaze over yet. You can do that when my pussy’s making you forget who you are");
	if (knowName) output(", [pc.name]");
	output("”</i>.");
	
	output("\n\nYou’re not sure (nor is anyone else) who’s carrying who down the hall. Once or twice you’ve had to stop to just hump like an idiot against her, but the way she shudders and cries out in bliss drains your willpower faster than a galotian could hope to drain your loads. The miserable whimpers she makes when she’s disconnected from you for any amount of time are painful to hear.");
	output("\n\nThankfully people kept their phones away. Last thing you both need is a video circulating.");
	output("\n\nThe stadium begins to disappear in that moment, and all you can really make out are the walls and the absence of her bent over, plump and plush puss exposed, being hammered by you, being flooded with [pc.cumNoun]...");
	output("\n\n<i>“Stop, just... fuck, gimme one second, ONE SECOND!”</i> she barks, keeping you away with one hand, hyperventilating, fumbling with a card. On one side you see a picture of the caramel laquine looking smug, snarky... but the reality of it contains none of overridden personality. Before the door finishes sliding open, you plow into and thrust her inside, belongings included.");
	output("\n\nEmpty though this room may be, sterile and clean, waiting for an off-season game to fire up, you can’t think of it as anything but a blank space waiting to be marked. When someone steps in here later, they’re only going to find an utter mess. They’ll think it was an orgy. They’ll think that half a dozen sluts came in here for a party, brought in by some victorious play. But you");
	if (knowRoxy) output(" and Roxy");
	output("’ll know the truth.");
	
	output("\n\nThis place is going to smell like sex for weeks, or weeks of sex. Maybe it’ll just be tainted with the aftermath of a reproductive tryst for all time and have to be condemned. <i>Worth it,</i> though, to put some babies in the bunny-girl pawing feverishly at your [pc.chestNoun].");
	output("\n\nAfter pushing her against the locker, rattling the entire line of property cages. Her nails dig into your neck and rake down to your [pc.nipples]. You lean in and bite down on her neck, [pc.cocksLight] vigorously throbbing");
	if (pc.isCrotchExposed()) output(" against her pre-coated bellyfur.");
	else output(" behind your [pc.crotchCover].");
	
	output("\n\n<i>“This whole room’s gonna fucking stink when we’re done, and that... that’s making me wanna cum so bad right now. The way you smell has fucking ruined this entire outfit for me, but that’s okay...”</i> She encloses your");
	if (pc.isCrotchExposed()) output(" [pc.cocksLight]");
	else output(" monster bulge");
	output(" between her thighs. <i>“...because I needed an excuse to get some new clothes.”</i>");
	
	if (knowRoxy)
	{
		output("\n\nFibrous, sweat-slickened laquine fur rubs frictiously against your [pc.skinFurScales], gushing with all the salt her hot body’s built up from the sheer anticipation of being made a bunny-mom. <i>“You’re gonna get me pregnant.”</i> She says that so matter-of-factly, like it’s true. Like every honored fertility god or goddess has come together to bless this coupling. It’s going to happen.");
		if (onPill) output(" Her birth control isn’t going to stop you.");
		output(" <i>“How’s that make you feel?”</i>");
		output("\n\nYour body answers for you. A body-thumping heartbeat pulses through your [pc.cockBiggest], making her flinch from its hedonistic power, and squirting out a [pc.cumGem] wad of prejizz.");
		if (onPill) output(" You’re going to be breeding her <i>and</i> fighting the effects of her contraceptives. <i>You can’t wait to prove yourself an unmatched bunny-breeder.</i>");
		output(" <i>“Yeah, that’s what I thought, [pc.name]. Gonna make me give birth to");
		if (flags["ROXY_TOTAL_KIDS"] > 0) output(" more");
		else output(" the");
		output(" heirs of your company? Gonna have a bunch of laquines bouncing around the office when you’re trying to work?”</i>");
		
		output("\n\nShe laughs uproariously. <i>“Hey I’m just trying to get you all bothered. I’m serious.");
		if (flags["ROXY_TOTAL_KIDS"] > 0) output(" I want a big family, even more than what we’ve got now");
		else output(" I want kids");
		output("! Don’t you worry about anything except exploding inside me like you just scored a game-winning goal!");
		if (knowName) output(" I’ve seen how you bust, but this one is going to make every other feel like SPIT!”</i>");
		else output(" I’ve never seen you bust before, but this is gonna be the best one of your life. I can’t fucking wait to see it!”</i>");
	}
	else
	{
		output("\n\nThe laquine’s paws slip down to your [pc.cocks]. The overcharged heat of her nectarous and fertile cleft is ruinously arousing. Her knee jerks up into your [pc.belly], and she captures your attention for a brief revelation, <i>“One thing, I don’t like getting wrecked by people I’m not on a name basis with. When you cum, when you start crying, you be sure to yell out <b>Roxy</b>. Roxy, you get me?”</i> she growls, <i>“ROXY!”</i>");
		output("\n\n<i>“[pc.name]!</i> you bellow. She needs to know yours too, and you get her fur all bristly when you whisper <i>[pc.name] Steele</i> hotly into that big, pettable ear.");
	}
	
	output("\n\nRoxy grunts, <i>“Get this crap off me,”</i> one finger going to the center string of her bra and tugging angrily. <i>“You can’t make someone dressed like me into a stupidly gravid slut.”</i> The thin-stringed garment floats to the ground on pheromone-spiked air, followed by the zipper-split hoodie. She shakes her hair out,");
	if (pc.isCrotchExposed()) output(" rubbing your [pc.cocks] across her taut tummy.");
	else output(" ripping your [pc.crotchCovers] out of the way and digging out your [pc.cocks].");
	
	output("\n\nThe only two things in the way of slamming Roxy’s " + (silly ? "clam" : "cunt") + " are her juice-drenched and crotch-plastered denim and the high-string thong below it. You can only imagine what that thing looks like, resembles, or if it got pulled into her cleft. If it did, pulling it out would be great: she’d cum. Of course, the bunny-bitch’s ebullience could spray just from having her legs spread at this point. Everything about her has become so sensitive after inhaling your studly scent.");
	output("\n\nIt takes more than a few wiggling fingers to get to your faintly pulsating prize. Roxy’s uncooperative hips <i>do not</i> stop rocking for anything. The lust-overflowing laquine probably has no control of herself anymore, not with that innate laquine desire to breed unlocked. There are tiny sparks in her golden eyes that you spot when your musk scent collides with her brain, emptying her mind until all its capacities are filled with the ecstasy of impending motherhood.");
	output("\n\nReaching for her pussy is like an expedition to the center of a sun, but you’ll settle for the center of Uveto. When your [pc.finger] breaks that suffocating cloud of white-hot air, Roxy’s head jerks back so hard it slams into the locker; stannic impact reverberates through the room. And then you feel an <i>even hotter</i> wash of slime coat your digits. Amazingly violent orgasm drenches your [pc.hand] in scalding hot femspunk, and it’s fast puddling against the sopping-wet sponge of her thoroughly soaked underwear. Holy fuck.");
	output("\n\n<i>“PULL IT OFF!”</i> she screams.");
	output("\n\nA tug to the zipper and a bullish yank, not even realizing your strength, you split her undergarment in two and fling it against the opposite locker rack. Her panties don’t stand a chance either, but the fetor of laquine fuckscent you reveal melts you down into baser components. She gasps, but not as loudly as you. For a second you feel like you’re being strangled. Breathing becomes difficult trying to cope with all of that all-natural aroma you stoked.");
	output("\n\nHer whole body is quivering beautifully. Roxy’s eyes lazily blink and her tongue slicks aimlessly over her dusky lips. Long, pearlescent strings of femspunk leak to the floor, puddling around her rumbling paw-feet. The room suddenly reeks of horse-bunny cunt, and the longer you stare at the plump, onyx lips of her fountaining twat the more it enthusiastically declares its readiness, squeezing out more of her silk-textured lubricant microcentimers away from [pc.eachCockHead].");
	output("\n\nThe lagged laquine loses all grip, her entire body going nerveless for a hot minute. You have to hold her up. The way you do it isn’t quite normal, but it works: you’re pressed up against her, jerkily working your hips against her inky entrance,");
	if (pc.race() == "laquine") output(" hopping like the bunny you are");
	else output(" hopping like a laquine yourself");
	output(". <i>“B - buh... Fuck - KK”</i> she winces, strength suddenly returning to push back.");
	
	output("\n\nRoxy’s muzzle twists into a pout while you stumble down on top of the cushioned bench, gripping her waist. <i>“Do it, take me. Treat me like a fucking useless bitch too fat to fucking play games anymore! Make me a fucking trophy slut-wife,”</i> Roxy grins, grinding your backside into the furniture. <i>“Take me! Make me yours! You see this!?”</i>");
	output("\n\nShe leans back, exhaling, slipping two fingers into her gorgeously lubed sex, all the silky fur at its glistening edges matted down by climax after primal climax. <i>“Ensure your genes, right here... [pc.name].”</i>");
	output("\n\nIf that’s how she can look and smell, if the room is this thick with her flavor, then what’s going to happen when you stick it in?");
	if (firstTime) output("\n\nWhat’s going to happen to you?");
	else output("\n\nSex to shame the most famous porn stars.");
	
	processTime(10);
	clearMenu();

	addButton(0, "Next", roxyBreedHerNext, kok);
}
public function roxyBreedHerNext(kok:int=0):void
{	
	clearOutput();
	showRoxy(true, true);
	showName("\nROXY");
	
	output("It’s time to find out.");
	output("\n\n<i>“On <b>my</b> terms”</i> you huff, knuckles pressuring the surface of her pelvis. You push back on Roxy, taking her to the ground missionary style, collapsing on her with all the weight of a hungry sire. There’s this annoying ache, overlaid with pins and needles. You don’t know where the urges to breed end and your cock begins, but you give a long, happy sigh when your [pc.cockHead " + kok + "] grazes her oily labia.");
	output("\n\nHer, too.");
	output("\n\nPushing your crotch into hers, you glide your girth around her lust-matted fur, teasing your already rigid rods into greater, springy tumescence and sending spikes of thrill up your torso.");
	output("\n\nBy far the greatest pleasure comes from slipping through the waterfalling nook of her nectar-glazed slit, always on the cusp of entering her. Restless Roxy tries to follow your movements, hoping to position herself (it’s probably not even her doing it) in a way that bids you to slip and plunge inside her writhing warren. All you’re interested in doing at the moment is slathering your [pc.cocks] in the succulent heat of her marvelously textured mound of womanly flesh.");
	output("\n\nWhile she enjoys the teasing, Roxy stares at you unhappily. <i>“No games, no gloating, no gentleness. I just want all you’ve got. I want you to be an animal.”</i>");
	output("\n\nShe bounces up to plant a wet smooch on your chin, missing your [pc.lipColor] lips. <i>“Until you came along with that scent, I didn’t know how badly I wanted to be one either.”</i> She locks her legs around your [pc.hips] and her hands behind your neck. <i>“I just want you to have me. I want your kids. Make it happen. Don’t you dare pull out until it’s done.”</i>");
	output("\n\nThe surprising mildness with which she speaks makes your heart flutter in all the right ways, and somehow, matches the tempo of its beats to hers. It’s the kind of comfortable complacency one achieves when they sit staring out at the horizon, feeling all of their goals in life have been completed.");
	output("\n\nYet, there will be aggression to match warrior kings of ages past, there will be sexual savagery spoken of in low whispers throughout this colosseum... Right now, just knowing that she’s given herself to you, that she is bared only to you, that she is yours...");
	output("\n\nFuck. It’s just powerful.");
	output("\n\n");
	showImage("RoxyDoggy");
	output("And that’s why you need to forge that into her sloppy little bunny brain. That’s why you need to print your initials on her walls. That’s why you need to pound her nerves and batter her womb so hard that no other dick can hope to please this pussy. You utter mental prayers to any cosmic entity that might hear them, and ask for all the stamina you’ll need to fuck this laquine full of hundreds of children. Making her bear hundreds, maybe thousands of bunnies for you, repopulating her race, defeating their fertility plague, and ensuring your bloodline for the generations to come...");
	output("\n\nWhat were biological needs kept locked tight in the recesses of your mind are now flaring proudly. You’re boiling with the intensity of a star going nova. You’re braced so tight that dust and chips of bonemeal are shaking free of your skeleton. When you hammer your [pc.cock " + kok + "] into her pussy she is going to feel it in every fiber of her musculature. After you’re through, there’s nothing that Roxy is going to be able to do that doesn’t make her recall the force at which you are going to sire life in her waiting womb.");
	output("\n\nYou’ll never forget the way Roxy’s face lights up when you slow to a crawl and plant your [pc.cockHead " + kok + "] to the center of her musky horsecunt, its lips fattened by the accumulation of lust, matching the slight bulge of your cumslit which sits dilated, allowing the free flow of pre.");
	output("\n\nAnd then you meet her expectation in the only way possible. At the gate of her midnight mound you pull back and drive ferociously into that plump valley with all your pooled strength. The taut tunnel of laquine vagina squeezes down in an extremely virginal manner, a delightful quality no doubt brought on by your addled presence. It’s not a canyon nor a chasm, it’s an exquisitely tight passage of undulating muscle, of clenching nerves sucking your");
	if (pc.cocks[kok].cLength() >= 14) output(" [pc.cockType " + kok + "] length past the slightly yawning opening of her womb.");
	else if (pc.cocks[kok].cLength() >= 8) output(" [pc.cockType " + kok + "] breeding tool to the gagging ring of her cervix.");
	else output(" modest mast as deep as its [pc.cockType " + kok + "] shape allows.");
	
	
	output("\n\nGroaning and heaving, you give a successful, ear shattering scream");
	if (pc.cocks[kok].cLength() >= 14) output(" feeling your [pc.cock " + kok + "] slide right into her womb, the [pc.cockHead " + kok + "] surrounded by the inner organs dedicated to healthy childbirth. Even those are prepped and ready for what promises to be a tremendous offering.");
	else
	{
		output(" when her thighs seize up and she pulls you inside so hard that");
		if (pc.hasKnot(kok)) output(" your [pc.knot " + kok + "] stretches through her broadening hole, swelling itself in her heavenly cream.");
		else output(" you feel like your crotch is disappearing into her.");
	}
	
	pc.cockChange();
	
	output("\n\n<i>“Ach,”</i> she winces, <i>“Ok you-”</i>");
	output("\n\n<i>“Say nothing,”</i> you hush, dragging yourself back out from her vaginal embrace.");
	output("\n\nMaintaining a steady pace is not what you’re here to do. At this point your willpower has completely faded, and your [pc.hips] are slamming fiercely into hers. Gone is your restraint and willpower. Ripples fan out from one chocolatey side of her waist to the other. The alarming crack of your whip-like thrusts has her arresting biology clamp down on you with an internal milking that hurts until it drains the feeling from your upper body.");
	output("\n\nThe hold doesn’t relax, no matter how much attention you lavish Roxy with, or abuse her with. She just moans, explodes in orgasm (seems she can squirt only when she’s this horny!) and begs you to plow her hefty snatch. You can’t look away from her. You school your [pc.eyes] on hers, every erotic expression flashing across her muzzle fascinating in its own unique, head-swimming way.");
	if (pc.balls > 0)
	{
		output("\n\nTrembling against sensitive lips, your sumptuous ballsack and the ");
		if (pc.balls > 1) output(num2Text(pc.balls) + " virile orbs");
		else output(" virile orb");
		output(" inside audibly gurgle. An immense tightness builds inside your spunk-bunkers, threatening to explode outwards before you’re ready. Every full thrust bounces your cum-pouch off her lust-swollen lips, and the desire to release all the roiling [pc.cumNoun] bloating your pre-coated teste");
		if (pc.balls > 1) output("s");
		output(" is one that you struggle with all your might not to indulge in just yet. Every wrinkle and crease on your");
		if (pc.ballSize() >= 8) output(" tremendous");
		else if (pc.ballSize() >= 4) output(" heavily sagging");
		else output(" weighty");
		output(" maleness disappears under the weight of a rapidly brewing load.");
	}
	
	output("\n\nNo matter what you do, you can’t stop a premature nut from busting, and Roxy can feel it. You spunk her with a column of [pc.cumNoun]. The passage of [pc.cumVisc] nut superheats your rod and causes Roxy to bounce heavily -- a small squirt of girlcum bastes your abdomen. You hold a lot tighter, feeling your dilated urethra open up to its fullest, flooding her mesmeric channel with more prejizz than before.");
	output("\n\n<i>“[pc.name]... More... please!”</i> she whines, her eyes narrowing. <i>“No games... no fighting... just pack me with cummm!”</i>");
	output("\n\nWith white-knuckled pain and a cry of oversexed bliss, you grip painfully to her handles and slow to shallow strokes. Dizziness assails you as your holstered [pc.cockNoun " + kok + "] plunges in and pumps her full of that requested delivery, passing thick gobs of seed. Your eyes roll back from the tide of liquid volume pouring through your internal plumbing and racing out your straining, oval cockslit.");
	output("\n\nFuck! It can’t end this quick or peak right here!");
	output("\n\nYou drag your plowing [pc.cockNoun " + kok + "] out and grip Roxy’s ankles, throwing them over her head and spreading her crotch in a perfect example of the mating press. Bracing her feet against your shoulders you ram back in, punching your balled fists to either side of her head, utterly consumed. You did that, and you’re doing even more, all while your powered-up virility was spurting and spurting, washing her cunt with [pc.cumColor] streamers of ceaseless spooge.");
	output("\n\n<i>“Yes!”</i> she cries, <i>“[pc.name]!! You will get me pregnant, you can do this!”</i>");
	output("\n\nHer encouragements rebuild your pace; there’s a momentary spike of pain in your tightening [pc.ballsNoun]");
	if (pc.balls > 0) output("; the spongy sack rebounds off her gloriously warm entrance, amplifying the overload");
	output(". If anyone saw you now, heard you even, you’d be mistaken for a dog");
	if (pc.race() != "ausar") output(" even though you look nothing like one");
	output(". <i>Hey, look at that [pc.guyGirl], like someone replaced [pc.hisHer] brain with an animal’s!</i>");
	
	output("\n\nAre you still cumming? Probably, but your potent rut makes sure there’s no such thing as capacity when fulfilling your true calling as a mindless womb-seeding beast. Every part of your body feels overwhelmed and swollen. Now, past all the musk, the pheromones, the foreplay, the domination, there’s a phallic revelry the likes of which so few in this galaxy must get to enjoy. You’re performing a ritual dance that will save her race, honoring her genes and whatever major deities the laquines must have worshiped in their naissance.");
	output("\n\nSpine-twisting pleasures flex through your arteries and veins. You’re addicted to the sheer savagery you’re capable of, something hidden away, something that could only come out right now. Those inner walls you conquer one womb-knocking thrust at a time are trembling in awe and reverence of your [pc.cock " + kok + "]. The oscillations of her breasts are a consistent perpetual motion created by the relentless rate that you fuck her baby-bag.");
	output("\n\nCould anyone else handle you like this? You decide that’s a question that’s not worth answering. Why think of anyone else but Roxy? Looking at her, so many things are sprinting through your cerebrum. After this, she’s always going to be yours. She’s going to mother your children. This laquine is going to <i>belong</i> to you. She’s thinking of only you, and you want to believe deep down she has found her one true mate.");
	output("\n\nMate... that’s exactly what you are. You are everything she could need, and she is everything you could want. Endless amounts of ejaculate spray back out on your brief withdrawals, splattering across the room like hosed water. Her cheek fur is colored red, and her glossy lips are spread in a heart-clenchingly satisfied smile. She can’t say anything, but she’s saying all that matters right now.");
	output("\n\nYour [pc.cocks], your [pc.hips], even your [pc.hands] are throbbing in massive amounts of pain. How close to exhaustion you must be, cumming and cumming, and yet you never feel drained. It never feels like it’s enough.");
	if (pc.cockTotal() > 1)
	{
		if (pc.hasTits()) output(" You’ve busted so much nut that your [pc.chestNoun] are covered in gunk and her tits are leaking it like milk.");
		else output(" You’ve busted so much nut that your [pc.chestNoun] is covered in gunk and her tits are leaking it like milk.");
		pc.applyCumSoaked();
	}
	
	output("\n\nBut Roxy’s face, fuck, fuck fuck fuck, it’s <i>magnificent</i>... it glows. It shines. It’s refulgent, like a distant constellation the galaxy can admire. That is what your rampant coupling is! Nobody else knows. Maybe someone somewhere hears. Maybe your combined wails have carried through the ventilation system. Maybe someone followed you, and is listening in through the door.");
	output("\n\nIf they are... you hope they are supremely jealous of what you’re giving Roxy.");
	output("\n\nAll of a sudden your body locks into place");
	if (pc.hasKnot(kok)) output(", your knot having been fucked well into the bunbun’s hole by this point");
	output(". You hilt yourself in her plump cleft, bellowing out, gripping to her head until you can see a tear form at the edge of her eye. A real, explosive orgasm is upon you, one that miraculously built despite all the stomach-swelling gouts that came before it.");
	if (pc.cumQ() >= 10000)
	{
		output("\n\nThe womb-crushing bulk of your moon-cracking climax bulges your [pc.cocks] with the pussy-cramming load it deserves. Your [pc.eyes] shut at the moment of orgasm, thumbs sinking into Roxy’s neck almost too tight. Her confused and bloating horsecunt tightens helplessly, the inconceivable volume you’re spilling into it detonating outwards against you in rich helpings. Tiny strokes in and out of her pussy only push more of the gunk back out. Although the laquine’s nervous system is not something you can interface with, you know, you know beyond the shadow of a doubt that her eggs have been utterly vanished in a tide of [pc.cumGem].");
		output("\n\nYou only hope that her body does its job, turning each and every cell you’ve pumped into her into healthy baby laquines.");
	}
	else output("\n\n[pc.Cum] bursts from [pc.eachCockHead] in furious ropes, each one thicker than an average orgasm. The sheer amount of nut you are busting into this rabid rabbit is divine. Seed blasts her in canal-filling amounts, the sequential shots shoving the preceding loads deeper into her body, deeper into her womb. Even though her internal functions are not your own, you can feel her ovaries accepting it. You know that her eggs are being showered in your hot burden. If her body knows what’s good for it, it’ll make each and every sperm cell into a healthy baby laquine.");
	
	output("\n\nThis isn’t enough. Once your brain registers the bred bunny and her vacant features, it also swiftly recognizes how <i>full of [pc.cumNoun] your loins still are.</i>");
		
	processTime(10 + rand(10));
	
	flags["ROXY_HEAT_SEX"] = 1;
	roxy.loadInCunt(pc,0);
	pc.orgasm();
	pc.applyPussyDrenched();
	
	clearMenu();
	addButton(0, "Next", roxyBreedHerNext2, kok);
}
public function roxyBreedHerNext2(kok:int=0):void
{	
	clearOutput();
	showRoxy(true, true);
	showName("\nROXY");
	
	var kok2:int = pc.cockThatFits(roxy.analCapacity(), "volume", [kok]);
	
	output("The laquine is silent when you pull your slimy [pc.cockNoun " + kok + "] out, obesity-causing puddles of goo oozing out of her gaped gash. Exhaling (which, to be honest, sounds more like a monster grunting), you grab the limp laquine’s feet and turn her over. The circumference of her belly decreases when you prop her up against a bench and mount her back. She is yours to do with as you please.");
	output("\n\nHer cute paws curl from the bliss of impregnation, and she looks back to you with a small smirk, nodding. Your libido hasn’t diminished in the slightest after that, and, really, it only gets <i>inflamed</i> seeing all of those potential kids pouring out like rain. You’re gonna have to fix that.");
	output("\n\nShe gasps at your touch to her ochre tush, and cries out in ecstasy when you press your [pc.cocksLight] to her hole");
	if (kok2 >= 0) output("s; you intend to treat her asshole just like you treated her womb. Another place to empty your [pc.cumVisc] deluge.");
	else output(".");
	output(" When you’re done, she’s going to know what it’s like to be your slut, your litter-bearing laquine.");
	output("\n\nThe ease at which you thrust inside and reclaim your lashing pace is phenomenal. You airily run your hands across her wettest spots, building an arousing friction in the gaps of your digits. Laquine honey hasn’t stop squirting but once since you started, and when the lusty slut-bun’s slime polishes your boner you feel all the strain disappear.");
	output("\n\nCivilized thoughts are purged by your body, devoting all faculties to breeding those cum-starved channels. Her eyes seal shut. So do yours. The appreciative whimpers she makes aren’t even done in the voice she started with. Horsepussy reacts euphorically to your rebuilt tempo, and with more room to maneuver you hit all those unreachable areas, exciting yourself and Roxy further with squishing sounds and the promise of more baby batter for her well-stocked oven.");
	output("\n\n[pc.EachCock] blow");
	if (kok2 < 0) output("s");
	output(" again. It’s probably unhealthy how much you’re shooting.");
	output("\n\nWhat does it matter?");
	output("\n\nShe’s yours.");
	
	//4 to 9 times
	var cnt:int = 4 + (rand(6))
	for (var i:int = 0; i < cnt; i++)
	{
		processTime(10 + rand(10));
		roxy.loadInCunt(pc,0);
		if (kok2 >= 0) roxy.loadInAss(pc);
		pc.orgasm();
	}
	
	clearMenu();
	addButton(0, "Next", roxyBreedHerNext3, kok);
}
public function roxyBreedHerNext3(kok:int=0):void
{	
	clearOutput();
	showRoxy(true, true);
	showName("\nROXY");
	
	var firstTime:Boolean = true;
	if (flags["ROXY_BREED"] >= 1) firstTime = false;
	var knowRoxy:Boolean = false;
	if (flags["ROXY_MET"] == 1) knowRoxy = true;
	flags["ROXY_MET"] = 1;
	
	output("<i>“Hey...?”</i>");
	output("\n\nWhose voice is that?");
	output("\n\n<i>“Hey... are you there?”</i>");
	output("\n\nRoxy?");
	output("\n\n<i>“C’mon, you there, [pc.name]?”</i>");
	output("\n\nLike the flash of an enabled display your eyelids split and the bright light of a tainted locker room sears your retinas. You gurgle out a miserable groan, feeling lightheaded. Or light-bodied, rather. Are you sleeping on a cloud?");
	output("\n\n<i>“Hey... I can’t move...”</i> the laquine’s voice reaches you again. <i>“[pc.name], you awake yet? Sounds like it... hurry up already...”</i>");
	output("\n\nFinally, your stupid stiff neck can move! And now you realize where you are, what position you’re in. You’ve passed out for an unknown time on top of Roxy, pinning the spunk-filled bun to the floor");
	if (pc.tallness >= 78 || pc.thickness >= 75) output(" beneath your massive frame.");
	else if (pc.tallness < 68) output(" despite your smaller size.");
	
	output("\n\nThough they feel like noodles, your [pc.arms] respond and flail dumbly while");
	if (pc.isNaga()) output(" you unwrap her from your snake tail");
	else output(" you roll off her");
	output(", and that brings its own issues.");
	output("\n\nAn incredible soreness is triggered in your [pc.cocksLight] when they slide free of Roxy’s sloven tunnel, and you squeal in pain.");
	output("\n\n<i>“Fuck, that stings...”</i> she grunts, at last making eye contact. She’s balanced on a bit of a pudgy cum-belly, grinning happily at you. <i>“That was the fucking hottest sex I have ever had, and I’ve had a lot of sex. [pc.name]... just fuck... I’d say let’s do that again sometime, but I think I’d wanna prepare for the kinda sexual juggernaut you are! You must have cum like seven times... I lost track after the fourth.”</i>");
	output("\n\nYou and Roxy just laugh. That kinda hurts too.");
	if (firstTime)
	{
		output("\n\n<i>“Well uh... I can’t move. Looks like you can’t either. I guess we should get to know each other? I can tell your rut’s over with.”</i> She giggles, flopping onto her back as well. <i>“My name’s Roxy, and I’m a sports player here. I can ramble about all that later, but yeah... just a roller derby girl. Love contact sports. Love sex even more.”</i>");
		output("\n\nShe winks at you. <i>“I’m sure you can see how easy I am. Best thing to do on this shitty cold moon.”</i>");
		output("\n\nYou reintroduce yourself as [pc.name] Steele, barely managing a pinky-shake with her.");
		output("\n\n<i>“About halfway through getting turned into a cum-bunny, I put two and two together. You the boss of that lab in town?”</i>");
		output("\n\nYou nod, but there’s more to it than that, and so you fill her in on your heritage.");
		output("\n\n<i>“Yeah... thought as much. I think that turned me on way more, thinking I would become the mother for a big shot CEO’s kids!”</i> she laughs, rubbing her stomach.");
		output("\n\nYou explain you’re not in charge of Steele Tech, or the lab nearby, just yet, but may go into more detail later. For now, you ask if she thinks it took.");
		output("\n\n<i>“Fuck yeah it did, sweet-cheeks!”</i> she lurches upwards. <i>“I’ve wanted to be a mom for so long. Nobody’s ever bred me. I’ve had a lot of lousy fucks in the past, but that was <b>art</b>. You deserve a medal for it!”</i>");
		output("\n\nThankfully, you can sit up too.");
	}	
	else
	{
		output("\n\n<i>“There’s no way it didn’t take,”</i> Roxy smiles at you happily. <i>“I’m gonna be a mom to your kids. You’re gonna have a buncha rabbit-eared babies to inherit things for ‘ya. I mean... if you want them. I’ll still take care of them...”</i>");
		output("\n\nYou grip Roxy’s paw and pull her closer, giving her an angry look. Of course you want them! Would you have done this if not to get her pregnant for that express intent!?");
		output("\n\n<i>“...Sorry, I thought I was just being selfish. I love great sex, and I really");
		if (flags["ROXY_TOTAL_KIDS"] >= 1 ) output(" love to be a mom.");
		else output(" want to be a mom.");
		output(" Sooo...”</i> she grins again, <i>“think of any names?”</i>");
		output("\n\nWhen it’s time. For now, you’re happy just to be able to sit up.");
	}
	output("\n\nThis locker room is an absolute fucking disaster. You have no Uvetan-idea how there’s [pc.cumNoun] dripping from the ceiling and splattered across every locker door like this is a murder scene, but it happened. You can hardly see any gaps in the [pc.cumColor] puddles flooding the ground. It’s even into the showers. Now that your sense of smell registers, you cough, starting to feel aroused.");
	output("\n\nRoxy falls into you though, filling your nostrils with herself instead. She lays the fattest kiss imaginable on your [pc.lipsChaste], moaning sweet-nothings past your teeth while locking you in a bone-crushing hug. It doesn’t last long enough.");
	output("\n\n<i>“Fuck, we better clear out. I’m not taking the rap for this.”</i>");
	output("\n\nNo shit!");
	output("\n\nAfter getting a quick shower and wiping down your belongings as best you can, you and Roxy ghost, fleeing the site of the fuckcrime, promising on your separation to meet up.");
	if (knowRoxy) output("\n\nYou can’t wait to find out how many she’ll be carrying!");
	else output("\n\nYou might want to tell her about your nursery soon...");
	
	processTime(60 + rand(60));

	IncrementFlag("ROXY_SEX");
	IncrementFlag("ROXY_BREED");
	soreDebuff(1);
	pc.shower();
 
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}
//what kind of fucking idiot are you?
public function roxyDontBreedHer():void
{	
	clearOutput();
	showRoxy(false, true);
	var firstTime:Boolean = true;
	if (flags["ROXY_BREED"] >= 1) firstTime = false;
	flags["ROXY_RUT_REJECT"] = 1;
	
	if (firstTime)
	{
		output("You grip the horny bunny’s shoulders and push her back, not quite understanding why you’re turning down the chance to fuck her so hard that her pussy never recovers from your presence.");
		output("\n\n<i>“Are you FUCKING SERIOUS?”</i> she growls. <i>“Fuck! Now I have to go and masturbate! You fucking PUSSYTEASE!”</i>");
		output("\n\nOnce she’s screamed her peace, she snags her bag and charges down the corridor towards the sports rooms, whimpering on the way. God damn, you could follow that thick scent trail all the way to wherever it is she’s run. Will you see her again? Better leave, though: everyone’s watching now.");
		output("\n\nAnd more than a few are ruining their pants.");
	}
	else
	{
		output("Roxy’s mouth opens to scream but she stops herself just in time, howling into her fuzzy palms. You pushing her back and stepping off was the absolute worst thing you could have done to her.");
		output("\n\nThe word <i>“FUCK!”</i> thrums between her fingertips in a supremely frustrated tone of heart-pounding displeasure. <i>“Fuck! [pc.name], what the fuck!? After all we’ve done and-”</i>");
		output("\n\nShe stops herself again, bending down to grab her bag. She jabs a finger into your [pc.chestNoun], an enormous, feral scowl splitting her muzzle. <i>“Don’t you FUCKING DARE...”</i> she hisses through clenched teeth, <i>“...come back here smelling like that. I wanna get fucking BRED! Don’t waste my time like this again, I will FFFFffff-”</i>");
		output("\n\nBody quaking, the laquine grimaces and runs off whimpering, desperate to relieve whatever internal function you triggered. You can see that same arousal winding around the cocks, clits, and spines of everyone around you. Pants are splitting and wettening in your totem-erecting presence. While you shuffle out to avoid attracting the wrong attention, you get the feeling Roxy is not going to be around today after a display like that...");
	}
	processTime(10);
	
	clearMenu();
	flags["ROXY_JILLING_TIMER"] = GetGameTimestamp();
	addButton(0, "Next", move, "UVI STADENTRY");
	
}

public function roxySexIdea():void
{	
	clearOutput();
	
	var steeleTone:int = 0;
	if (pc.tone >= 75) steeleTone = 2;
	else if (pc.tone >= 50) steeleTone = 1;
	var noPreg:Boolean = false;
	if (pc.virility() <= 0 || flags["ROXY_STERILEX"] == 1) noPreg = true;
	var pregTri:int = roxyPregTrimester(true);
	
	if (flags["ROXY_IDEA_REFUSE"] == 1)
	{
		showRoxy(false, true);
		output("<i>“So...”</i> you start,");
		if (pc.isBimbo() || pc.isBro() || pc.isNice()) output(" chewing your lip");
		else output(" flattening your lips");
		output(". <i>“Your idea of " + (noPreg ? "fucking" : "breeding") + ", with the collar-”</i>");
		output("\n\n<i>“Oh, come around on it, [pc.name]?”</i> she leans in, grinning smugly. <i>“I’m not mad. I don’t give up, after all.”</i>");
		output("\n\nThat’s all well and good. But you know the onus is on you.");
		output("\n\n<i>“Tell me right here, right now,”</i> Roxy’s breath is on your neck. <i>“...if you wanna breed me on my terms. Maybe tell me you want me, too,”</i> the laquine winks cutely, <i>“...but that sounds unfair in the moment.”</i>");
	
		processTime(3);
		clearMenu();
		addButton(0, "Yeah", roxySexIdeaYes, undefined,"Yes","Now that you know what you’re in for, you agree. See where it goes!");
		addButton(1, "Nah", roxySexIdeaNo, undefined,"No","Be a pricktease and wuss out. Again.");
	}
	else
	{		
		showRoxy(true, true);
		output("<i>“So, what’s this idea of yours?”</i> you ask, and before you even finish your sentence the laquine perks up. Her ears twitch cutely and a big huge grin blossoms across her muzzle. She gives no answer except the physical kind, hopping up, grabbing her bag, and dragging you through the crowds.");
		output("\n\nThe multiracial throngs thin out towards the far end where the teams hang out. Roxy drags you towards a series of locker rooms, though this area is distinctly different from the hall where the Pinup Punks hang their jackets. Curiously, the doors here are just as lazily labeled ‘Locker Room’. Like before, Roxy only stops long enough to pull out her card.");
		output("\n\n<i>“The doors need keycard locks to keep out the worst fans.”</i> You point to the other label making it clear that this is not her team’s sport, and Roxy only laughs. <i>“Yeah, it’s a locker room belonging to a team that plays a sport that, well,”</i>");
		output("\n\n<i>Hiss</i>- and the door opens. <i>“...is outta season.”</i> You are, naturally, dragged inside.");
		output("\n\nThis locker room, unused as it is, is unmarked, standard, and temperate. No steamy air to wring the sweat right out of your [pc.skinFurScales]. Rows of lockers divide up space with benches between them. The only sign of a mess is the one Roxy makes when she oh-so-gracefully discards her backpack onto the floor. The impact was enough to make you jump.");
		output("\n\n<i>“Don’t worry about interruptions, [pc.name], ‘cause this entire wing is devoted to something nobody’s playing and they’re all watching reruns of it on holo-TV,”</i> she explains, throwing off her hoodie and beckoning you with a finger. When you get close, she pushes you down on the bench, seating herself in your lap, wrapping her paw-feet around your waist. She seats her pheromonally-drenched twat right on your [pc.cockBiggest], wettening her denim with a little bump and grind. <i>“And, if you get me, I’m never outta season...”</i>");
		output("\n\nKnowing where to go from here, you tear off the bikini top she wears, flinging the article into another aisle. You had to be quick to meet her ferocious kiss. While her hands dip towards your [pc.ass], yours do the same, already working that high-string thong out of the way, wanting another touch of that black-lipped pussy aching for a plowing. You could sink into it effortlessly, all the heat and moisture flushing your [pc.skinFurScalesNoun] with the beginnings of arousal.");
		output("\n\nDark brown nipples grow beautifully erect against your [pc.chestNoun]");
		if (!pc.isNude()) output("; Roxy works you out of your [pc.armor], pulling it away one piece at a time");
		output(".");
	
		if (pc.isChestExposed()) output("\n\nHer agile hands are roving across your [pc.skinFurScales], seeking unseen erogenous pathways.");
		else
		{
			output("\n\nHer nimble fingers have your");
			if (!pc.isChestExposedByUpperUndergarment()) output(" [pc.chestCoverUnder]");
			else if (pc.hasTits()) output(" breasts");
			else output(" pecs");
			output(" exposed in record time -- she’s gotten as good as you at handling your gear.");
		}
		
		output("\n\n<i>“Mnf,”</i> Roxy grunts, pulling back, shuddering when you get a second to flick her sensitive black pearl. She’s not going anywhere with her arms around your neck and yours hers. One furry limb comes back around to your chest, exploring your");
		if (steeleTone > 0) output(" chiseled exterior.");
		else output(" soft exterior.");
	
		if (pc.hasTits())
		{
			if (pc.cockTotal() > 1) output("\n\n<i>“Tits and cocks, great combination sometimes.”</i>");
			else output("\n\n<i>“Tits and a cock, great combination sometimes.”</i>");
			output(" Roxy palms your [pc.breasts].");
			if (pc.biggestTitSize() >= 10)
			{
				output(" <i>“How do you even get around with these things?”</i> Roxy lifts your [pc.breasts] and lets them sag, laughing at the effect. <i>“I can’t imagine them being much bigger! Hope I don’t swell up like this");
				if (noPreg) output(" if I ever get pregnant.");
				else
				{
					if (pregTri > 0) output(" later in the pregnancy.");
					else
					{
						output(" when you knock me up");
						if (flags["ROXY_TOTAL_KIDS"] > 0) output(" again");
						output(".");
					}
				}
				output("”</i>");
			}
			else output(" <i>“Especially for you, [pc.name].”</i>");
		}	
	
		output("\n\nRoxy hops to her feet, unzipping her shorts and stepping out of them. <i>“Guess I should tell ‘ya why we’re here. You fuck good, so I figured I owed ‘ya some privacy.”</i> She smirks, bending over to her bag, giving you a beautiful, hip-rocking display of taut laquine assflesh. You can’t see what she’s digging out");
		if (pc.isCrotchExposedByLowerUndergarment()) output(" but [pc.eachCock] " + (pc.cockTotal() > 1 ? "are" : "is") + " squirming skyward in anticipation.");
		else output(" but she’s doing a heck of a job digging [pc.eachCock] out from your [pc.crotchCoverUnder].");
		
		output("\n\nAfter rooting through her stuff she rises, and a long, black lead follows her ascent. When Roxy turns around, she yanks a black collar out from her bag. It pops up, spins around, and is finally clutched in her hand, presenting you a leathery petmaker. The face you make must be to her liking, because she’s sneering in a way that only adds to your bewilderment.");
		output("\n\n<i>“This thing,”</i> she unclasps the back and looks at you smarmily, <i>“your neck,”</i> closes it again, <i>“this in my hand,”</i> she pulls up the leash, <i>“...and you aren’t walking away ‘til I’m so heavy with");
		if (noPreg || pregTri > 0) output(" cum");
		else output(" kids");
		output(" that I can’t even stand straight!”</i>");
	
		output("\n\nShe smiles brightly. <i>“You’re tough enough to take the lead, but do you wanna try me for real, [pc.name]?”</i> She tilts her head left and right, starting to hop. <i>“C’monnnn it’ll be fiiine. And fun!");
		if (pc.cockTotal() > 1) output(" Those guys look like they’re ready to");
		else output(" That guy looks like its ready to");
		if (pc.virility() <= 0 || flags["ROXY_STERILEX"] == 1) output(" go");
		else output(" breed");
		output(" for hours,”</i> she finishes, gazing at [pc.eachCock] adoringly. <i>“You in?”</i>");
		
		processTime(10);
		clearMenu();
		addButton(0, "Yes", roxySexMissionary, undefined,"Yes","Hell yes you’re in!");
		addButton(1, "No", roxySexIdeaNo, undefined,"No","No way!");
	}
	
}
public function roxySexIdeaYes():void
{	
	clearOutput();
	showRoxy(true, true);
	
	var kok:int = rand(pc.cockTotal());
	
	output("The blush brightening your [pc.face] tells Roxy everything before you even open your mouth. She puts a finger to your [pc.lipColor] lips and leans in, the toothiest, most predatory grin on her face. <i>“About time, ‘ya pussytease.”</i> One bunny-paw darts for your [pc.cockNoun " + kok + "], gripping the shaft");
	if (!pc.isCrotchExposed()) output(" through your [pc.crotchCover]");
	output(". The ravenous rabbit kicks her bag upwards to fish through it while pushing more of herself on you.");
	
	output("\n\n<i>“And just to make sure you don’t fuck me off this time,”</i> she husks, producing the black leather collar and its jingling metal bits, <i>“... a little insurance.”</i>");
	output("\n\nYou don’t stop her from slapping that soft hoop around your neck and buckling it tight. You probably would have tried... <i>if you realized she just did that in front of a couple hundred people.</i> Backpack in paw, Roxy stands and tugs firmly on the swirled lead, gold eyes glowing lustfully when you stagger to your [pc.footOrFeet]. <i>“C’mon, [pc.name],”</i> she jerks her head to the distant corridor, voice lilting deeply. <i>“You wanna put me in my place? All ‘ya gotta do is follow like a good [pc.raceCuteShort]!”</i>");
	output("\n\nYour throat knots when she gives a triumphant ‘hmm-hmph’.");
	output("\n\nA mixture of shame and emasculation cloaks you when you pass through laughing ausar and catcalling kaithrits. Roxy pulls on you like an owner would a stubborn dog, and for a moment you think of pinning her against the wall and giving her a taste of what you’re feeling.");
	output("\n\n...On the other hand, the erotic sensations spreading through your body are difficult to ignore. Somehow you maintain a sober state of mind despite the pervasive warmths crisscrossing your nerves, swallowing your pride -- and your lusts; [pc.eachCock] are throbbing demandingly,");
	if (pc.isCrotchExposed())
	{
		if (pc.cumQ() >= 3000) output(" squirting");
		else if (pc.cumQ() >= 1000) output(" spurting");
		else output(" beading");
		output(" [pc.cumColor] slime on every step.");
	}
	else output(" soaking your [pc.crotchCoverUnder] with [pc.cumColor] slime.");
	
	output(" Your [pc.nipples] work themselves into a state of extremely teasable erection");
	if (pc.isChestExposedByUpperUndergarment()) output(" pulsing against the crisp stadium air.");
	else output(", rubbing against your [pc.chestCoverUnder].");
	
	output("\n\nMaybe part of you <i>likes being seen as a pet.</i> Yeah... joke’s on them. <b>You’re going to make Roxy a pet.</b> There’s nothing wrong with this after all! Anyone can see how passionately hard you’ve gotten, that look of agitation in your eyes. You’re the one with");
	if (pc.cockTotal() > 1) output(" erections so adamantine they’re capable of knocking some poor sap out right now, and they’re aimed at the wide-thighed laquine feeding your desire in few, frustrating increments.");
	else output(" an erection so adamantine it’s capable of knocking some poor sap out right now, and its aimed at the wide-thighed laquine feeding your desire in few, frustrating increments.");
	
	output("\n\nBy the time you’re at the not-so-steamy rendezvous point, you’re whimpering from lust, barely holding back while Roxy swipes the card over the door. When it opens, you push her inside this time. You’re moving towards the nearest bench, but the laquine manages to turn the tables, instead landing crotch-first on your midriff. You sprawl on the cushiony furniture when your aggressive lover yanks on your neck.");
	output("\n\n<i>“Yeah, thought you might try that. See, you’re getting into it!”</i> Holding the leash at the same time, her nimble fingers");
	if (pc.isNude()) output(" are tracing over your [pc.cocks], smearing the first hot loads of pre along " + (pc.cockTotal() > 1 ? "their lengths" : "its length") + ".");
	else output(" have your clothes off in record time, allowing your [pc.cocks] to spring free.");
	
	output("\n\nAnytime you show a bit of resistance she puts you back in your place with one firm tug and a shift of bunny-weight. You’re subject to her merciless, teasing whims, grinding against her sinfully soft bellyfur, soaking your cock-musk into it until it plasters against her skin and you’re throbbing with the flustered need to spray [pc.cumNoun] and flutter away on the inertia.");
	output("\n\nA huge wet spot forms on her denim, soaking right through the pheromone-washed thong you want to snap off. The scent of laquine girljizz is highly noticeable in an empty room, and it makes the swivels of her groin from [pc.cockHead " + kok + "] to [pc.knotOrSheath " + kok + "] more stimulating than you can handle. The very air surrounding your girth");
	if (pc.cockTotal() > 1) output("s");
	output(" steams with the mixing of your smells, and your body reacts with incredible pulses of pleasure to the tiniest of caresses.");
	output("\n\nYou’re not sure if she wanted you to beg, but you do. You cry out deliriously,<i>“");
	if (pc.isBimbo()) output(" Pleeease, let me fuck you already!");
	else if (pc.isBro()) output(" I thought you weren’t the teasing type...?");
	else if (pc.isNice()) output(" A-are you going to start yet? This doesn’t suit you!");
	else if (pc.isMischievous()) output(" Thought you... hated the fuckin’ teasing...!");
	else output(" Get on with it!");
	output("”</i> Your [pc.hips] squirm around, pinned beneath the leaper’s legs. Her biological prowess for breeding, for selecting a proper mate, mercifully abates.");
	
	output("\n\n<i>“D’aww,”</i> she leans forward. <i>“Consider that your only favor, [pc.name]!”</i> She rips both her top garments off in one fluid motion. <i>“‘Sides, can’t have you wasting any of that on my body. Just accept that you’re my piece of fuckable meat right now.”</i>");
	
	processTime(10);
	pc.exhibitionism(1);
	clearMenu();
	addButton(0, "Next", roxySexMissionary);
}

public function roxySexIdeaNo():void
{	
	clearOutput();
	showRoxy(false, true);
	
	if (flags["ROXY_IDEA_REFUSE"] == 1)
	{
		output("You tell her no, and she leans back, rolling her eyes a few cycles. <i>“[pc.name], geez, so indecisive. I wonder if you’re just trying to piss me off at this point.”</i> Roxy raises an eyebrow, finding the silver lining in that. <i>“Ooh, I like that idea, you just want me to go extra hard.”</i>");
		output("\n\nNothing to say, you watch her exhale sharply. <i>“Whatever. I’m always listening. Anything else on your mind, Steeley [pc.boyGirl]?”</i>");
	}
	else
	{	
		output("You shake your head, still hoping that you can just get to the fucking without any toys.");
		output("\n\n<i>“Egh, really?”</i> Roxy huffs in disappointment. <i>“Damnit,”</i> her tongue clicks, <i>“and we got so close.”</i> She jokingly throws her hands over her head. <i>“But it wasn’t to be, I guess. I thought you’d like it. Hell, I thought you’d be into it, the way you go at me.”</i>");
		output("\n\nShe walks up and pecks you on the forehead. <i>“If you ain’t up for it, you ain’t up for it,”</i> Roxy states bluntly, shrugging her shoulders, beginning to redress.");
		output("\n\nWait, she’s leaving? The hell, you’ve got " + (pc.cockTotal() > 1 ? "these raging boners" : "this raging hardon") + "!");
		output("\n\n<i>“I was bent on the idea, [pc.name],”</i> she says from the other aisle, voice flat- <i>“and I’m not gonna force you to do it.”</i> She zips up her hoodie. <i>“The mood, at least for me, is gone, so...”</i> she trails off.");
		output("\n\nNow fully clothed, the laquine stops at the door. <i>“Don’t worry, I’ll try again. Or maybe next time you’ll grow a backbone and ask me again. Maybe you’re just not into surprises.”</i>");
		output("\n\nA casual whistle fades into the background. Roxy leaves as if she hadn’t just stood someone up in the middle of an empty locker room.");
		output("\n\nDammit.");
	}
	
	processTime(5);
	pc.changeLust(60);
	clearMenu();
	if (flags["ROXY_IDEA_REFUSE"] == 1) addButton(0, "Next", roxyGreet);
	else
	{
		flags["ROXY_IDEA_REFUSE"] = 1;
		addButton(0, "Next", mainGameMenu);
	}
}
public function roxySexMissionaryPrep():void
{	
	clearOutput();
	showRoxy(false, true);
	
	var kok:int = 0;
	
	if (pc.isBimbo()) output("<i>“I’m up for a little rough love today, if you know what I mean!");
	else if (pc.isBro()) output("<i>“How about something tough today?");
	else if (pc.isNice()) output("<i>“How... rough are you feeling today, Roxy?");
	else if (pc.isMischievous()) output("<i>“I’m feeling dirty today. How about you?");
	else output("<i>“Today’s a rough day. You understand?");
	output("”</i> The caffeine-flavored laquine’s ears flutter at your words.");
	
	output("\n\n<i>“You sure? You’re not leaving until I get every last drop");
	if (pc.balls > 0) output(" in your balls");
	else output(" down there");
	output(",”</i> she winks, tendril-like fingers grabbing your [pc.knotBallsHilt " + kok + "]. <i>“Don’t care if you pass out, [pc.name].”</i>");
	output("\n\nSame to her!");
	output("\n\nWithout another word, Roxy kicks her bag up and fishes out the black collar from before, planting a paw to your shoulder and buckling the leather loop to your [pc.skinFurScales]. She does that right in front of the hundreds milling about. The pain of shame lasts for a microsecond before you channel all the instilled passion and anger to your [pc.cocks].");
	if (pc.hasStatusEffect("Roxy Style Collar Mark")) output(" Having done this not too long ago, its presence begins to antagonize the loop of tenderized [pc.skinFurScalesNoun] left behind after her exceedingly rough treatment. For now, the material feels soothingly cool against your injury, like it always belonged there, but when she starts pulling the agony of ecstasy is drawn up from the well.");
	output("\n\nLust-heated pangs of urgency scour lines through your [pc.skinFurScales]. She just wants you to get riled and pop off.");
	output("\n\nIt’s working.");
	output("\n\n<i>“C’mon then, ‘ya cute little [pc.raceCuteShort]!”</i> Roxy hops up, tugging you to your [pc.footOrFeet]. <i>“You want me, then you’ve got me. ‘Course, right now, I’ve got you.”</i> She laughs, already moving forward. <i>“Okay, okay. Mind your manners, </i>Steele<i>.”</i>");
	output("\n\nOn the way to another unused locker room you weather the jeers and the catcalls, maintaining a sober state of mind for what you’re about to do. <i>This is just what Roxy wants,</i> you remind yourself. You keep that fact close to your pounding heart,");
	if (pc.isCrotchExposed())
	{
		output(" throbbing out another");
		
		if (pc.cumQ() >= 3000) output(" squirt");
		else if (pc.cumQ() >= 1000) output(" wad");
		else output(" spurt");
		output(" of [pc.cumColor] prejizz.");
	}
	else output(" feeling your [pc.cocksLight] oozing against your [pc.crotchCover].");
	output(" Your [pc.nipples] glow with bliss");
	if (!pc.isChestExposedByUpperUndergarment()) output(", rubbing against your [pc.chestCoverUnder]");
	output(". All of this arousal is fed by the slutty rabbit dragging you on like an unruly pet.");
	
	output("\n\nYou don’t even realize you’ve reached the room, and when Roxy fumbles with the card, you push her inside. Before you manage to pin the laquine under a bench, she whirls around in a dexterous feat that puts you in the bottom position. The fuckbunny seats her simmering crotch on yours, leaning down and growling");
	if (!pc.isNude()) output(" while she unfastens your clothing");
	output(". <i>“Not this time, [pc.name]. My pace. Better get used to it,”</i> she simpers, rubbing her pheromone-drenched denim against your exposed shaft" + (pc.cockTotal() > 1 ? "s" : "") + ".");

	output("\n\n<i>“Or don’t. I like watching you struggle.”</i>");
	output("\n\nRoxy gets you ready in a short amount of time, but your brain can’t realize that. Her ruthless teasing seems to last an eternity, its passage marked by her clothed crotch grinding from [pc.cockHead " + kok + "] to [pc.knotOrSheath " + kok + "], slickening her bellyfur down with copious pre. When you get too stubborn or dare to reach up for her, there’s a tug on the leash, choking you for a brief second, and she finishes the punishment by slapping her weight down upon you in heated relish.");
	output("\n\n<i>“Man you look good like this, not gonna lie.”</i> Roxy leans forward, planting your mast" + (pc.cockTotal() > 1 ? "s" : "") + " between your connected navels. <i>“Why don’t you beg");
	if (flags["ROXY_MISSIONARY"] > 0) output(" just like last time");
	output("?");
	if (flags["ROXY_STERILEX"] == 1) output(" It’s the least you could do for making me take anti-baby pills just to get your dick.");
	output("”</i>");
	output("\n\nThere’s a moment you consider defying the request. It was spoken innocuously, hinting that maybe you could get away with not doing it.");
	output("\n\nBut deep down, you both know that you can’t ignore it. You’re boiling from the inside out with the kind of unsated arousal that would leave you shouting and swearing later if nobody was there to take care of it. Right now you’re on the verge of cursing her name, verbally tearing her down, fighting for control...");
	output("\n\nBut you can’t, and like the juicy piece of fuckable meat you are right now, you end up crying out for her. <i>“");
	if (pc.isBimbo()) output("Please let me fuck you, Roxy! I can’t take this anymore!");
	else if (pc.isBro()) output("I want you, more than anything. Is it not obvious!?");
	else if (pc.isNice()) output("I-I need you, let me show you. I’ll do anything for it!");
	else if (pc.isMischievous()) output("Of course! I’ll follow you any time, just let me fuck you already!");
	else output("F-fine. Fine! Just tell me what to do!");

	output("”</i>");
	output("\n\n<i>“Haa, look at me, leading a big-shot executive [pc.guyGirl] like you around literally with a leash!”</i> Roxy snarks. <i>“But, hell, that was hot. Why don’t you get me out of these damn shorts before I ruin ‘em?”</i>");
	
	processTime(10);
	pc.exhibitionism(1);
	clearMenu();
	addButton(0, "Next", roxySexMissionary);
}
public function roxySexMissionary():void
{	
	clearOutput();
	showRoxy(true, true);
	var firstTime:Boolean = true;
	if (flags["ROXY_MISSIONARY"] > 0) firstTime = false;
	var noPreg:Boolean = false;
	if (pc.virility() <= 0 || flags["ROXY_STERILEX"] == 1) noPreg = true;
	var pregTri:int = roxyPregTrimester(true);
		
	if (firstTime)
	{
		if (flags["ROXY_IDEA_REFUSE"] == 1)
		{
			output("The thought that you’re little more than a breeding stud for some smarmy, punky, sports playing slut-rabbit was at first excruciating, shameful... but then you realized it doesn’t matter one bit. You’ve got");
			if (pc.cockTotal() > 2) output(" a bunch of hard dicks, and they’re gonna be stuffing her squeezing depths.");
			else if (pc.cockTotal() > 1) output(" two hard dicks, and they’re gonna be stuffing her squeezing depths.");
			else output(" one hard dick, and its gonna be stuffing her squeezing depths.");
			output("\n\nYou’re gonna fuck her so hard, collared or not,");
			if (noPreg) output(" going to look like a thoroughly bred bitch.");
			else if (pregTri > 0) output(" look like even more of a thoroughly bred bitch.");
			else output(" and she’s going to bear your kids.");
			output(" Why worry about anything but doing just that? Let her think she has the lead.");
			output("\n\n<i>“Now how about you get me out of these shorts? Really show me how you feel, [pc.name],”</i> Roxy simpers. <i>“Not gonna lie, you look good like this too. Better act fast before I sorta lose control!”</i>");
		}
		else
		{
			output("Tinges of erotic crimson light up your face. You swallow a lump before nodding, raising your chin with a dopey smile on your face. Whatever she wants to do, you’re in, because the outcome is something you both have a vested interest in. Hopping forward, no doubt feeling the same pervasive warmth you are, Roxy slides the simple black loop around your [pc.skinFurScalesNoun], tightening it to the point that your breathing is noticeably impacted.");
			output("\n\nBut part of you just can’t care. All the excitement hitting your nerves is near-orgasmic. You can’t wait to <i>unleash</i> it on her. <i>“Looks good... now how about you get me out of these shorts?”</i>");
		}
	}
	else
	{
		output("You’re just a laquine’s breeding stud. You’re just a pet for a smarmy slut rabbit, and <i>you couldn’t imagine amounting to much more than that in your life.</i> She’s got you where she wants you, wanting to fuck her, wanting to take out your anger and all your accrued lust. All you have to do is get those damn shorts out of the way, and you’ll be fulfilling the only purpose that matters to you now. ");
		if (pregTri > 0) output("\n\nPregnancy only means her needs are greater than ever. It’s a fact you keep close to your chest.");
	}
	
	output("\n\nRoxy gives you the space you need to sit up and fidget with her zipper. You move quick, yanking the fastener down and sinking both sets of [pc.fingers] into the gap, pulling the outfit apart so hard that you tear a few threads. <i>“Just remember who’s holding the leash here, [pc.name],”</i> she laughs in your [pc.ear].");
	output("\n\nShe said that the moment her musky horse-pussy revealed itself to you, glistening like sweat-caked latex, emitting the kind of pheromones that make your [pc.cocks] twitch harder");
	if (pc.balls > 0) output(" and the [pc.cumVisc] contents of your cum-stocked [pc.ballsNounSimple] roil");
	output(".");
	
	output("\n\n<i>‘Just remember whose dicks are aimed at whose crotch,’</i> you mentally utter.");
	output("\n\nYour face contorts with ecstasy the longer you look, and it takes the masterful laquine’s tug on your leash to change your course. Roxy pushes up off you when you reach out for a touch of athlete’s quim, dragging on the lead hard enough that you tumble to your knees in front of that molten-hot honeypot, salivating close to her gently sopping vulva. Her black pearl pulses its way out of the peak of her shimmery slit, bared to you like the prize in an opened oyster.");
	output("\n\n<i>“Not gonna waste this opportunity. Hope you don’t mind I want your tongue in there for a bit. Gotta get me nice and ready to handle all of this,”</i> she says, touching her foot to your [pc.cockBiggest]");
	if (pc.cockTotal() > 2) output(", and then the others next to it");
	else if (pc.cockTotal() > 1) output(", and then the other next to it");
	output(". <i>“They’ll each get a go. Need to figure out which one I like best!”</i>");
	
	output("\n\nYou gasp, fluids squirting from your shudderingly hot");
	if (pc.hasVagina()) output(" genitals.");
	else output(" [pc.cocksLight].");
	output(" At first it soothes you, and then it agitates you. You’re totally entranced with it, happily coiling your [pc.arms] around her waist and diving into that immaculately ripe crease. Sweet little murmurs float from your lips when your [pc.tongue] unravels");
	if (pc.hasLongTongue()) output(" far enough to reach your crotch");
	output(". The tip of your maw-muscle doesn’t have to wiggle long to squeeze into Roxy’s plush folds, instantly showering in a drizzle of sweet, feminine treat.");
	
	output("\n\n<i>Yank.</i> <i>“Don’t be so damn slow, Steele. Shove it all the way in me!”</i>");
	output("\n\nYou gladly obey, jerking upwards to shine your spear in leporine syrup before packing her pussy with every inch of your tongue");
	if (pc.hasLongTongue()) output(" - of which you have plenty. The length and width of your oral organ would shame a lot of dicks out there!");
	else output(".");
	output(" Roxy’s fingers slither");
	if (pc.hasHair()) output(" through your [pc.hair]");
	else output(" across your scalp");
	if (pc.hasEmoteEars()) output(" and across your [pc.ears]");
	output(", demanding you thrust -- you do, vigorously.");
	
	output("\n\nSwallowing air is made difficult by the tautness of the collar and the position you’re in: rapidly stroking her sapphic skin in fat, nirvana-seeking licks. Muscles once strained and reflexively tight relax and you’re able to bob your head back and forth, gurgling and suckling excitedly. It’s hard to believe how sexually frustrated you were just moments ago, and now your whole body has been tamed by the infinite power of girlspunk.");
	output("\n\nRoxy scythes your head between her thick-furred thighs, blocking off even more air while thumbing one of her nipples. It’s not long before her soaked, unfurled cunt locks itself against your [pc.lips], depositing a fresh, jaw-clenching orgasm onto your taste buds. Ribbons of hot bunny-girl tang trickle down your esophagus, warming your throat on the way to your tingling stomach. You can identify a little sweat in her rich flavor, and no shortage of mind-muddling fragrance");
	if (pregTri > 0) output(" magnified by the first trimester of pregnancy");
	output(".");
	output("\n\n<i>“Shit, [pc.name], you keep that up and I’m gonna start wondering why the hell I don’t hire you as a post-game pussylicker,”</i> she snerks, tightening her thighs around your head. <i>“Aw fuck, I better not get too attached to that idea. I don’t want any of the other girls finding out you’re this good. Let’s just keep this between us, eh?”</i>");
	output("\n\nHer pussy smashes against your face, and all of her leaking juices seep into your");
	if (pc.hasFur()) output(" fur");
	else output(" pores");
	output(". <i>“Fucking makes me even more jealous of the Talenter’s captain though, that bitch has two catsluts to eat her out every day!”</i> You ease out those snaking streams with several gropes to her butt, tickling her hypersensitive clit with the flat of your tongue. The tip of your fleshy length stretches deep into Roxy’s pussy,");
	if (pc.hasLongTongue()) output(" pressing against her cervix");
	else output(" unable to reach her womb");
	output(". Her grip on your head");
	if (pc.hasEmoteEars()) output(" and [pc.ear]");
	output(" tightens hard enough to make you wince and yelp into her intoxicating box.");
	if (pc.hasLongTongue()) output(" <i>“But I think the faces I’m making prove I’ve got the better puss pleaser!”</i>");
	
	output("\n\nShe rocks back and forth against you");
	if (pc.hasMuzzle()) output(", gently fucking herself on your muzzle");
	output(". Your nose deflects off her swollen, lube-slathered fuckbutton, making her squeak right back. If she didn’t step away from you, leaving your clit-sucking face a complete mess of girlcum, then you might have forgotten that you were here to fuck her. The coldness you feel outside of her ruinous, sopping mare-twat is at first miserable...");
	output("\n\n...and then agitating, even angering.");
	output("\n\n<i>“Mmh, c’mere [pc.name], about time you get to work. Once you’re in, you ain’t leaving until I say so. This game doesn’t have a clock.”</i>");
	if (silly)
	{
		output("\n\nWhat, is she a hotel from hell? <i>“Oh yeah, you check in and you never leave; that’s the dream!”</i>");
		output("\n\nOh boy.");
	}

	processTime(10 + rand(10));
	pc.applyPussyDrenched();
	clearMenu();
	addButton(0, "Next", penisRouter,[roxySexMissionaryNext,roxy.vaginalCapacity(),false,0]);
}

public function roxySexMissionaryNext(kok:int=0):void
{	
	clearOutput();
	showRoxy(true, true);
	var firstTime:Boolean = true;
	if (flags["ROXY_MISSIONARY"] > 0) firstTime = false;
	var noPreg:Boolean = false;
	if (pc.virility() <= 0 || flags["ROXY_STERILEX"] == 1) noPreg = true;
	var pregTri:int = roxyPregTrimester(true);
	var cumQty:int = pc.cumQ();
	
	if (kok < 0) kok = 0;
	var hole:int = 0;
	
	output("Stepping around you, Roxy kicks her shorts and thong off, lying back with a pleasant huff. Lapine legs spread, giving you a wholly unobstructed view of her slickened muff, glowing with magma-like bliss and plumped by breed-hungry elation. You quiver on the spot, gulping, staring down the bridge of your nose and the line of your leash, straight into her dusky interior. <i>“Up and at it, [pc.name]!”</i>");
	output("\n\nInstead of shuffling, you clamber over your holder, eager to restore what little dignity you can, to try and make your presence known. The firm grip on your neck prevents you from absolutely dominating her, but it’s a necessary feeling of control you hold onto the way she holds onto your [pc.chestNoun].");
	output("\n\nYou know that it’s all you’re going to be allowed, too.");
	output("\n\nThe potency of her pussy is indescribable. The literal haze of horniness you immerse yourself in makes you gasp. You lean closer to her face, drawn in to the point you can’t see your [pc.cocks] past her jutting breast. You can feel exactly where they are though, perfectly aligned, and quaking in emitted excitement, their urges impossible to calm.");
	output("\n\nRoxy’s cheeks raise, yours flush. Every cunt-stained word that comes out of your mouth is an unintelligible mess of pleasure-drunk vocabulary, but it all means the same thing: you want to fuck her, you want her, you <i>beg for it.</i>");
	output("\n\nBetween your legs is a red-hot sopping mess of womanly warmth. You marvel at the shudders pulsing through the healthy veins on your [pc.cocksLight], [pc.eachCockHead] swimming in her overwhelming currents.");
	if (pregTri > 0) output(" She’s already pregnant, but that only makes her essence stronger. She’s the mother of your children, and simply by parting her legs in your vicinity she can control you...");
	else if (!noPreg) output(" She’s ripe, fertile, opened to you in pregnable bliss. The blanket-like texture of her fur invites you to submit and fulfill your role.");
	
	output("\n\nYou could sit here shaking magnificently for all eternity, relishing that primal emotion. But really, you know the only reason you’re bracing is because you know exactly what she’s capable of. You’ve seen her stamina for yourself");
	if (pregTri > 0) output("; pregnancy will do nothing to hamper it");
	output(".");
	
	output("\n\nAnd now you’re about to <i>experience</i> it");
	if (!firstTime) output(" all over again");
	output(".");
	
	output("\n\nWhen her errant groping ends, she gives you her best bedroom eyes. <i>“Now now, I’m already ready. You don’t have permission!”</i> Her free hand trails down to your [pc.hip] in the shadow of a moany lip-bite. You try to touch her back, but her legs and fingers squeeze down on you. <i>“No touching. See, that’s what the leash is for,”</i> she pulls your face closer, <i>“I’m the good girl teaching the <b>bad little [pc.raceCuteShort]-[pc.boyGirl]</b> some manners.”</i>");
	output("\n\nYou rest your [pc.cock " + kok + "] against her drenched labia, at the spot that will take you all the way through in one thrust. Unapologetically lewd moans spiral down your [pc.ears] when Roxy gives another tug, egging you on.");
	output("\n\n<i>“Go!”</i> she yells, patting your [pc.knotBallsHilt " + kok + "]. Her permission unlocks the booting on your [pc.hips] and they fall forward. You meet her gaze with a steady stare, savoring the sauna-like compression on your [pc.cockColor " + kok + "] cockflesh");
	if (pc.cockTotal() > 1) output(" and the rub of her dickslimed thighfur against your extra equipment");
	output(". She takes you with prepared ease, her lips squelching against your rod");
	if (pc.cocks[kok].cLength() >= 14) output(" as it batters against her womb, further advancement biologically impossible.");
	else if (pc.cocks[kok].cLength() >= 8) output(" as it press firmly against the entrance to her womb.");
	else output(" while you hilt yourself some distance from her womb.");
	output("\n\nRoxy begins to whisper, her voice lilting in tune with the contractions of her pony-puss. <i>“Mmmmm, something even better about that than regular sex. Don’t tell me you’re goin’ soft just because you’re bein’ my pet...”</i>");
	output("\n\nYou exhale over her neck through gritted teeth, stabilizing your chin and gripping tight to her waist. <i>“Ooh?”</i> she coos, <i>“is that your backbone showing?”</i> Roxy’s body exerts a vice-like grip on your [pc.cock " + kok + "]; the first suckling sounds of intertwined lovemaking fill the room.");
	if (pregTri > 0) output(" <i>“Don’t worry. Just ‘cause my kids are starting to grow doesn’t mean you can’t be a little rough!”</i>");
	output("\n\nBefore she says anything else, your waist snaps back and you ram into her equine honeypot. She won’t let you settle into that intense rhythm yet, so you settle on rebellious, impactful strokes, hammering her pelvis with enough strength to hurt. You too. Her muscles are so well-defined by a life of contact sport that even though she’s not actively thrusting against you, Roxy’s able to give some back.");
	output("\n\n<i>“Hands off, Steele. First order: go slower,”</i> she whispers, and you do so. Roxy knows how to reward you, and get you to work for those rhapsodizing rewards: she chokes you for air, and when you shift your grip to the cold metal of the bench rims, she eases up, gifting you cold, vital oxygen. Your [pc.lipColor] lips pucker into a panting grimace and then an automatic, languid smile.");
	
	if (pc.hasVagina()) output("\n\nRoxy’s vagina and yours spasm in rippling unison; her slick channel grinds against you with methodical pressure, yet to be broken down into peaking wildness. On the other hand, your [pc.pussiesIsAre] oozing helplessly, wishing for insertion that never manifests, for stimulation that never comes."); 
	else output("\n\nRoxy’s vagina spasms in rippling unison; her slick channel grinds against you with methodical pressure, yet to be broken down into peaking wildness.");
	output(" Gyrating is almost impossible like this, and so your one-track mind devotes itself to the tentative pounding of your engorged crotch to hers, plumbing her taut, clenching depths, marvelling at the ecstatic strain arcing through your nervous system.");
	
	if (pc.cockCanSting(kok)) output("\n\nThe tendrils lining your [pc.cock " + kok + "] thrash against the crushing interior, unloading copious amounts of chemical lust into Roxy’s groin. <i>“Aw fuck-KK!”</i> she glowers, a too-long groan pressing from her lungs. <i>“Don’t think... that’s gonna help...”</i> she winces, but her voice and the air she’s breathing have gotten heavier.");
	
	output("\n\nYou moan and swear, then moan again, voice fading to tiny gasps and sighs when her silken interior clamps down on you, contracting to pinpoint regions of your swollen member. Climax flickers in the back of your mind, bubbling up from your [pc.ballsNoun]... but it doesn’t come. While you hoped it’d be a male orgasm to end all others, the only thing that happens is you vibrate on the precipice, glittering beads of sweat dripping from your [pc.face]");
	if (pc.hasHair()) output(" and hair tips");
	output(".");
	
	output("\n\nHer smooth fuckball of a clit throbs and thrums against your [pc.belly] on the deepest insertions. Femcum splatters above it on the hits. Roxy shakes from multiple, sequential climaxes, and you soon realize that’s the only time you feel any sort of relief. Accepting that her pleasure matters in this livid moment is crucial. The more you properly please her cloying pussy, the closer you get to the greatest reward: release.");
	output("\n\nThe slut-rabbit knows how to push your buttons too.");
	if (pc.hasVagina())
	{
		output(" Her free left paw dives between your legs, fidgeting with your [pc.clits] and rubbing small circles of ecstasy into your");
		if (pc.vaginas[hole].type == GLOBAL.TYPE_EQUINE || pc.vaginalPuffiness(hole) >= 2) output(" puffed-out");
		output(" mound. She never penetrates you, intent on coaxing out groans of frustration.");
	}
	if (pc.hasTits()) 
	{
		output(" When the laquine cups one of your [pc.breasts], she happily swirls her fingers around its");
		if (pc.biggestTitSize() >= 15)
		{
			output(" tremendous shape, enjoying the feel of her fingers vanishing into your expanse of");
			if (pc.hasFur()) output(" fuzzy");
			else if (pc.hasScales()) output(" scaly");
			else if (pc.hasChitin()) output(" chitinous");
			else if (pc.hasGooSkin()) output(" gooey");
			output(" titflesh.");
		}
		else if (pc.biggestTitSize() >= 5) output(" wobbly shape.");
		else output(" pert shape.");
		if (pc.isLactating()) output(" When she squeezes, a highly pressurized rope of [pc.milk] fires out, splattering her from the neck down, and your eyes nearly roll back on account of lactic orgasm. <i>“Nice.”</i>");
	}
	
	output("\n\nShe massages away little kinks in your [pc.skinFurScalesNoun], preparing you for the inevitability that you’ll destabilize and fuck her so hard that the stadium will hear it and shake for it.");
	output("\n\n<i>“Now...”</i> Roxy purrs, moving her hand to the back of your head, drawing your [pc.lipsChaste] closer to hers, <i>“...fuck me, [pc.name]. If you hold back, you’ll regret it. Give me all your cum.");
	if (noPreg) output(" If you can’t get me pregnant, then you’re gonna make me feel like it. I’m not leaving until my belly wobbles like a water balloon!");
	else if (pregTri > 0) output(" Show me what a stud you are, show me that you’re really the " + pc.mf("father", "sire") + " to my litter!");
	output("”</i>"); 
	
	output("\n\nHer legs rocket up and lock around your waist in a small change of position that affords you more maneuverability than before. The numb strain you felt disappears, and the first thing you feel is your [pc.knotBallsHilt " + kok + "] wetly slapping against her tunnel. Shuddering ankles press to your [pc.ass].");
	if (pregTri > 0) output(" <i>“Show me again... show me how easily you can make bitches like me into moms!”</i>");
	else if (!noPreg) output(" <i>“Give me babies. Make me a mom!”</i>");
	
	pc.cockChange();
	
	output("\n\nThat damn grin, that cocksure smile, that smug smirk... those <b>words!</b> Her muzzle settles on a single, brilliant expression that compels you into retaliation, like it slaps you with its existence! With permission, you launch into an erratic rhythm that’s only broken up by the occasional leash-pull or scritch");
	if (pc.hasEmoteEars()) output(" behind the [pc.ears].");
	else output(" on the back of your head.");
	
	output("\n\nWith nothing to hold you back now, you parade through Roxy’s fat-lipped cunt. Its cock-stretched flesh massages you at a pace to match your unleashed desires, squeezing out your capacity for cogent thought. She wants you to spunk her, to savor her, to put her in her place. Screeches of pleasure carry as much stimulating weight as a grope to your ass or a jerk to [pc.oneCock].");
	output("\n\nAll of this collar business, the mocking, the diminishment of you was to rouse the absolute stud within. The husky grunts and groans spilling from her lips break down the wall she erected. Her act fades with the inflating of your [pc.cockHead " + kok + "]. You hit <i>that</i> spot over and over, fervently pumping her pussy like it was made for you. Streamers of mixed dick-drool and girly lube pour from her simmering cunt, flushing your lower half in delicious slickness.");
	output("\n\nBreathing becomes a rescinded privilege after your most powerful thrust, Roxy reacting intimately to the feel of her cervix");
	if (pregTri > 0) output(" being battered, holding strong to protect the precious life inside.");
	else if (pc.cocks[kok].cLength() >= 14) output(" opening to your cock’s savagings.");
	else output(" opening from the pleasure.");
	output(" <i>“Mmhh!”</i> she husks again, her voice reaching a howling volume. <i>“YES!”</i> she forces out, hyperventilating");
	if (pc.balls > 0) output(" from the feel of your [pc.ballsNoun] churning against her slippery opening");
	output(". <i>“STEELE! DO <b>NOT GO SLOW!</b>”</i> comes her ferocious cry.");
	
	output("\n\nYou bite down on her neck, peppering that perspiring cluster with nibbles and pecks. Roxy does the same between feral roars, handling your leash while you breed her like the animal she’s turned you into. Her thick legs latch urgently to your waist, clutching you close on your pushes and letting go on your outstrokes, adding to the relentless force you buffet her with.");
	output("\n\nAs the minutes of violent fucking pass and you’re pulled into a kiss, even the reactive rabbit can’t match you. [pc.EachCockHead] flare");
	if (pc.cockTotal() > 1) output("s; your cumslits dilate");
	else output("; your cumslit dilates");
	output(", having dribbled so much precum that you could pass a waterfall through your plumbing. Roxy’s gleaming eyes shut and her moans turn to long, raspy purrs of pleasure, her tongue wrestling yours for dominance.");
	if (pc.hasLongTongue()) output(" It’s a contest you easily succeed in. The sheer amount of [pc.tongue] you’ve got overpowers hers in a tiny example of why longer is always better.");
	
	output("\n\nUpraised bunny ears flick against your scalp, slumping nervelessly as her sponging quim steals control from the rest of her body. Thick, fur-matting secretions coat you and Roxy in smears of fresh juices, a huge web of gratuity connecting your warring loins with several sticky strings that duplicate in your furious, jackhammering pace.");
	output("\n\nHer head bobs excitedly and you struggle for every breath. She winds the leash around her wrist so many times that her hand hovers inches from your head; it’s behind it now, holding you up, squeezing the life out of you in sadistic fashion. Asphyxiation sets in when blood stops flowing through your face: a loss of feeling in your lips and inability to swallow -- <b>you fuck on! </b> It’s just a challenge!");
	output("\n\n<i>“BREED ME, STEELE!”</i> she yells again, and you’re certain you’re gonna have a mark after this is over. <i>“ALL OF IT!”</i> You indulge her and yourself with great long thrusts of overtender dick, lifting the two of you off in the bench until you finally ram into place");
	if (pc.hasKnot(kok)) output(", locking her down with your knot,");
	output(" shuddering and vocally clawing for oxygen, feeling the merciful process of searingly-hot ejaculation begin");
	if (pc.balls > 0) output(" within your burbling nutsack");
	output(" as Roxy goes numb at the apex.");
	
	if (cumQty >= 10000)
	{
		output("\n\nIn the cushy embrace of Roxy’s rubbery horse-twat you can glory in the heat of your inhuman expulsions. She blinks in shock when the first torrent of [pc.cum] stretches your urethra to a wincing limit, then even stretches her apart to claim its space, distending your rod with its [pc.cumGem] volume. It doesn’t care that she yielded biologically. Even your cum shows the same kind of aggressive functions that your body does, and the enormous, [pc.cumVisc] nut you bust into her");
		if (pregTri > 0) output(" baby-filled");
		else output(" fertile");
		output(" cunt backwashes in the space of three pulses.");
		output("\n\nOr, more appropriately, back<i>blasts.</i>");
		output("\n\nYour [pc.ballsNoun] clench tight, working overtime to stuff this horny laquine’s pussy with columns of fluid that will soak into her well-fucked nerves so well that her body will instinctively decline entrance to lesser mates. Piles of gunk accumulate from the spunky goo spilling back out when you pulse inside, your [pc.cock " + kok + "] automatically lurching even as a [pc.cumColor] river runs below it, creating a warm, thick mess. Even this position");
		if (pc.hasKnot(kok)) output(" and even your [pc.knot " + kok + "] do nothing to keep it in.");
		output("\n\nBut while it may be unfortunate that millions of potential children aren’t getting their chance in the great race, the incredible size of her expanded gullet speaks volumes of your incredible release. When she rubs it absent-mindedly, it sloshes and jiggles like a milk-bloated tit. She finds the strength to squeeze you in a bit deeper, maximizing your relief. You’ve gone above and beyond her request, and you could not be happier.");
		pc.applyCumSoaked();
	}
	else if (cumQty >= 6000)
	{
		output("\n\nLong ribbons of [pc.cum] spray into Roxy’s interior in erupting rhythm. She visibly recoils from the force of your ejaculation against her most sensitive flesh, against every nerve not meant to be treated so roughly. The fuck-drunk laquine drops the leash and gives a moan, her paws instead tugging on your shoulders when you throb out another pillar of pussy-filling spooge");
		if (pc.hasKnot(kok)) output(" that your [pc.knot " + kok + "] is unable to seal inside");
		output(". It all backwashes from her overfull cunt, splashing your groin like a [pc.cumGem] fountain. You both whimper at the thought that");
		if (pregTri > 0) output(" your sperm isn’t staying lodged inside");
		else output(" some of your sperm isn’t going to take part in that all important race");
		output(", but you satisfy yourself with the sight of her taut tummy bloating with torrents of [pc.cumFlavor] spunk, turning into a beautiful cum-bubble that wobbles and sloshes at the tiniest provocations. [pc.CumVisc] [pc.cumColor] streamers arc across the floor near your shrieking finality, and after a whole minute of cunt-inundating pleasure, you know you’ve done your job well.");
		pc.applyCumSoaked();
	}
	else if (cumQty >= 3000)
	{
		output("\n\nA powerful drone in the back of your mind overwhelms you on your climax. You’d scream something if you weren’t so exhausted, if the sweat wasn’t pouring from your facial peaks. Roxy shudders, almost losing grip of the leash, all of your erupting [pc.cum] gushing out in uninterrupted gallons, taking up whatever space it can around your [pc.cockType " + kok + "] club of meat. You can see her taut tummy rounding a little bit with the sheer volume you pump into her");
		if (pc.hasKnot(kok)) output(", and you’re shooting so much that a bit is funneling back out around your breeding knob");
		output(". An uncertain amount of time passes while you spunk her with long, thick wads of [pc.cumVisc] [pc.cumNoun], swiftly saturating her belly. You sigh airily, thinking you’ve succeeded, thinking she should be satisfied with that nice little cum bump in her womb.");
		if (pregTri <= 0) output(" You’ve soaked her ovaries to their cores.");
		output("\n\nYou look up, all the strain in your neck telling you to rest, and find that Roxy is only staring back with arched eyebrow. The expression is... curiously disciplinary.");
		output("\n\n<i>...she’s not satisfied...</i>");
	}
	else if (cumQty >= 500)
	{
		output("\n\nWhat’s at first subtle becomes mind-numbingly ecstatic! [pc.Cum] surges through your raw-fucked rods in arrows of above-average volume. While the dappled sweat drips from your head and your [pc.balls] contract");
		if (pc.balls < 2) output("s");
		output(" in rhythmic release, you think you’ve succeeded. You think you’ve pleased Roxy thoroughly. How could she not be satisfied with the ampleness of your [pc.cumVisc] loads?");
		output("\n\nHowever, there’s a chilling moment when you look up to her grinning at you. You can feel all your hot cum sloughed around your slotted [pc.cockNoun " + kok + "], dripping deeper, you’re sure you’ve gotten to her womb... but she doesn’t look at all satisfied...");
	}
	else output("\n\nYour mind is blown away by the rhythmic pulse of orgasm, but for how wonderful you feel... Roxy’s not going to be satisfied. [pc.Cum] spurts in tiny, soft-hitting ropes that her pussy drinks up. You pound your fists to the bench, willing your jizz to hit her capacious depths harder. While the dappled sweat drips from your face and your body flexes out a few pitiable dregs of [pc.cumVisc] jizz, she glowers at you. Her knuckles jut with the tightening of her balling fist. She’s more than displeased.");
	
	processTime(15 + rand(15));
	roxy.loadInCunt(pc, 0);
	pc.orgasm();
	clearMenu();
	addButton(0, "Next", roxySexMissionaryNext2,[kok,cumQty]);
}

public function roxySexMissionaryNext2(arg:Array):void
{	
	clearOutput();
	showRoxy(true, true);
	
	var kok:int = arg[0];
	var cumQty:int = arg[1];
	
	var firstTime:Boolean = true;
	if (flags["ROXY_MISSIONARY"] > 0) firstTime = false;
	var noPreg:Boolean = false;
	if (pc.virility() <= 0 || flags["ROXY_STERILEX"] == 1) noPreg = true;
	var pregTri:int = roxyPregTrimester(true);
	
	var kok2:int = -1;
	var kok3:int = -1;
	if (pc.cockTotal() > 1) kok2 = pc.cockThatFits(roxy.vaginalCapacity(0), "volume", [kok]);
	if (pc.cockTotal() > 2) kok3 = pc.cockThatFits(roxy.vaginalCapacity(0), "volume", [kok, kok2]);
	
	if (cumQty >= 6000)
	{
		if (cumQty >= 10000)
		{
			output("<i>“Holy shit, are you trying to ruin me for sports?”</i> Roxy pants, laughs, and caresses her cum - belly. You smile at her, hoping it’s over. <i>“What are you giving me that face for?”</i>");
			output("\n\nIt’s not.");
		}
		else output("<i>“Oh fuck, I think you might have been trying!”</i> Roxy pants, and you look at her with a smile that quickly turns upside down. <i>“I think you can go one more time, just to make sure.”</i>");
		
		output("\n\nWith a whimper you try to pull out of her creampied cunny, only for Roxy to smush you back into herself and squeeze out another arc of [pc.cumNoun]. <i>“Where’re you going?”</i> she grins. <i>“");
		if (kok3 >= 0) output("You’ve still got other dicks that haven’t had their go!”</i>");
		else if (kok2 >= 0) output("You’ve still got a dick that hasn’t had its go!”</i>");
		else output("Once more, [pc.name], then maybe I’ll let you go.”</i>");
		
		output("\n\nTaking Roxy by the shoulders you withdraw, only for her to grab yours and thump her crotch against yours. <i>“AGAIN!”</i> she barks, bumping your forehead to hers with a sharp tug on the leash. <i>“Againagainagain!”</i> she giggles joyfully.");
		output("\n\nRabbit femcum splashes over your");
		if (kok2 >= 0) output(" [pc.cock " + kok2 + "] when you thrust your next prick in, cramming through your own sloppy mess.");
		else output(" [pc.cock " + kok + "] when you reluctantly push back into her cum-clogged hole.");
		output(" Your pale, torpid hands sink into Roxy’s fur, a long whimper flowing from your [pc.lipColor] lips. It hurts at first, and none of her fresh heat or the extra lubrication of your minutes old seed makes this easier.");
		output("\n\nUninterested in a slow pace, the power-bottom laquine wallops your pelvis. She teases you with mocking words, trying to build your boner back to full mast from its sore, tender, soft state. It occurs to you that her cunt never loosened, only tightened harder to keep all the cum in -- and your [pc.cocksLight] too. Lewd squishing sounds from her rewettening snatch shatter your sense of coherency after a minute or two of hot flashes.");
		output("\n\nYou came again, at some point. You didn’t really feel it. What you did feel was your [pc.balls] shriveling up. Roxy is milking you. Your entire body is bombarded with a sensory assault that drives it into reclusiveness. You fire off load after messy load, and soon lose the ability to rationally comprehend what you’re seeing.");
		if (kok3 >= 0)
		{			
			output("\n\nYou only last one more round before entering a world of darkness.");
			processTime(10 + rand(10));
			roxy.loadInCunt(pc, 0);
			pc.orgasm();
		}
		else output(" You only last one more mighty orgasm before succumbing to her desires.");
		
		processTime(10 + rand(10));
		roxy.loadInCunt(pc, 0);
		pc.orgasm();
		
	}
	else
	{
		if (cumQty >= 3000) output("<i>“[pc.name], I think you’re holding out on me... And you know what I do to people who hold out?");
		else if (cumQty >= 500) output("<i>“Mmmm, not quite there, you know? I think you can do better than that.");
		else output("<i>“The fuck was that, [pc.name]? I get you to bust the best nut of your life and that’s all I get?");
		output("”</i> Roxy smiles, pulling a pained yelp from you with another leash-yank. <i>“Again, [pc.name].”</i>");
		
		output("\n\nAgain!?");
		output("\n\n<i>“AGAIN!”</i> she growls.");
		if (kok3 >= 0) output(" <i>“And, you’ll be using the rest of your dicks. Now’s the time to make up for your disappointment. Ain’t I thoughtful?”</i>");
		else if (kok2 >= 0) output(" <i>“And, you’ll be using your other dick. Now’s the time to make up for your disappointment. Ain’t I thoughtful?”</i>");
		
		output("\n\nRoxy’s teasing laughter does nothing to assuage your pain, but you can’t get away.");
		if (kok2 >= 0) output(" You’re only allowed to pull out to slot your next cock inside.");
		else output(" You try to pull out only to be slapped back in.");
		output(" There’s a brief softness that even laquine girlhoney can’t massage into hardness, making you whimper when you’re forced to cram your raw, tender cock back in for another go. Only broken breaths tumble out of your lips when you try to get back into a rhythm, and you find that it at least gets easier when she starts getting horny all over again.");
		output("\n\nBunny-slime washes over you, easing the pain, bringing you back to a sense of hardness. It does almost nothing for the");
		if (pc.balls > 0) output(" contents of your [pc.sack]");
		else output(" internal soreness near your prostate");
		output(" though. She picks back up, even humps you back, rocking your world the way you thought you’d rocked hers. Anyone else would have been satisfied after a fuck like that.");
		
		output("\n\nBut not Roxy.");
		output("\n\nThere’s no chance of communicating with her now as a newfound tempo flattens out your lungs. Her tail manages to wag");
		if (pc.hasTail()) output(" while yours stays limp");
		output(". You’re not sure if her cradling your head as you soporifically thump at her crotch is an affection or possession.");
		output("\n\nRoxy’s pussy erupts in another thigh-soaking show of passion, and now you’re at least certain there’s no feasible end to her stamina, her endurance, and certainly not her juices. Wherever you still have feeling your body there’s only a burning pain of worn out muscles begging for rest that never comes. You came in her again, shriveling your maleness up in the process");
		if (kok3 >= 0) output(" just before being told to swap to your next unused cock.");
		else output(" just before being told to go again.");
		
		output("\n\nHer insatiable ardor leads you on. Your groin is completely numb to the point that you feel none of your orgasms now, but your [pc.cocks] lead");
		if (kok2 < 0 ) output("s");
		output(" you on...");

		processTime(10 + rand(10));
		roxy.loadInCunt(pc, 0);
		pc.orgasm();
		processTime(10 + rand(10));
		roxy.loadInCunt(pc, 0);
		pc.orgasm();
	}
		
	processTime(10 + rand(10));
	pc.applyPussyDrenched();
	clearMenu();
	addButton(0, "Next", roxySexMissionaryAfter);
}
public function roxySexMissionaryAfter():void
{	
	clearOutput();
	showRoxy(true, true);
	
	var firstTime:Boolean = true;
	if (flags["ROXY_MISSIONARY"] > 0) firstTime = false;
	var noPreg:Boolean = false;
	if (pc.virility() <= 0 || flags["ROXY_STERILEX"] == 1) noPreg = true;
	var pregTri:int = roxyPregTrimester(true);
	
	output("You’re stuck in some half-aware state, not sure what your brain is telling you is real. One eye open and the other shut, the gentle little caresses to your temple coax you from what is an insufferable and uncertain state of mind. Swallowing is nearly an impossible task, your innards so dried up after being used as little more than");
	if (pc.cockTotal() > 1) output(" dicks that just happen");
	else output(" a dick that just happens");
	output(" to have [pc.aRaceShort] attached to them.");
	output("\n\n<i>“Hey, [pc.name], hey, c’mon, it’s over...”</i> Roxy whispers warmly into your [pc.ear], and for the first time since this all began you finally feel serenity. You pull your head from Roxy’s perky cleavage, meeting a rare and almost maternal smile. <i>“Shh, I know it kinda hurts, just... try to pull out slowly, okay?”</i>");
	output("\n\nFuck, it does. Your mouth stretches into a wide expression. It feels like your dick, soft as it is, coated in ludicrous amounts of effluence, is pulling itself off your body. You remove yourself from Roxy with a loud, wet pop that makes your heart sink in some way. The rubs to your shoulder and the nuzzle to your cheek from makes it vanish quick as it came.");
	output("\n\nOnly one question’s on your mind: <i>“Can I relax?”</i>");
	output("\n\n<i>“Just hold still so I can get the collar off,”</i> she says softly. The paralysis in your [pc.legOrLegs] means you’re not doing much but crawling around like you don’t have a [pc.leg] to stand on. Libidinous stupefaction is all you know, but fortunately there’s a sexy rabbit there to keep you upright and soothe your aches and pains. There’s a snap when she unhooks the leash; the unbuckling of your collar is sweet anodyne for being appreciably ridden.");
	output("\n\nIt’s the first real relief you’ve had since she pulled you into this locker room. Roxy looks just as tired as you do, finally sitting up, but in a way that keeps cum from leaking out. All you want to do is fall on the floor and chill.");
	output("\n\nLuckily, she feels the same way, wrapping her arms around you and plunging to the cold ground with a weary laugh, her legs interlocking around yours. Your voice joins Roxy’s in room-filling chorus. Blood starts to flow through your extremities again. The onset of needles and pins is from neck to [pc.foot] is masochistically blessed.");
	output("\n\nYou run a few fingers around your neck, the delicate [pc.skinFurScalesNoun] bruised by her previous roughness and thinned to acute sensitivity.");
	if (pc.hasFur()) output(" You can’t see it, but you know that the skin under your fur is bright red and sore. The depression of your fur is proof of it.");
	else if (pc.hasScales()) output(" You can’t see it, but you know that the skin under your scales is bright red and sore. The depression of your scales is proof of it.");
	else if (pc.hasChitin()) output(" You can’t see it, but you know that the skin under your chitin is bright red and sore. The depression of your chitin is proof of it.");
	else output(" You can’t see it, but you know there’s a bright red mark around the diameter of your neck.");
	output("\n\nRoxy runs a finger over the circular outline, leaning in for a cool kiss there and on your [pc.lipsChaste]. <i>“I know I’m a rough kinda slut, but you did amazing, [pc.name]. Don’t ever let anyone tell you you’re shit or something. Think I might actually not be horny for a few days with this much in me,”</i> she pats her stomach. <i>“And I gotta say, it’s kinda nice seeing that big ‘ol mark on you. Makes me feel like I’ve got my own personal [pc.boyGirl]-toy.”</i>");
	output("\n\nShe distributes soft kisses across your neck");
	if (pc.hasFur()) output("-fur");
	else if (pc.hasScales()) output("-scales");
	output(", all appreciations focused on that lingering halo of control. Fatigued sighs drift from your lips, this physical pampering a lot like coming home after eighteen hours of work and jumping straight into bed.");
	if (pc.hasEmoteEars()) output(" You especially like it when she plays with your [pc.ears], scratching behind the vulnerable skin before pinching the tips.");
	if (pc.virility() > 0)
	{
		output("\n\nHer gentle (and surprisingly chaste) ministrations don’t seem to last long enough, especially while you chitter-chatter about");
		if (pregTri > 0) output(" how you’re gonna get her pregnant all over again.");
		else if (flags["ROXY_STERILEX"] == 1) output(" how you should just ask her to get off birth control so the next time you do this will matter.");
		else output(" how she’ll definitely be knocked up after this.");
	}
	output("\n\nYour laquine lover presses her forehead to yours");
	if (pc.hasHorns()) output(", mindful of your horns");
	output(". <i>“[pc.name], I mean it when I say it, you’re awesome. I hope you don’t think I’m a bitch or something. I mean, I kinda am, but I mean uh... nobody else really holds up. Anyway, yeah, that’s all I wanted to say, thanks for sticking through.”</i>");
	output("\n\nA coffee-colored paw strokes your cheek from brow to chin");
	if (pc.race() == "feline") output(", and you respond automatically with a body-rumbling purr, earning yourself a fixated petting");
	output(". She isn’t the most refined masseuse, but she’s working out the stiffness one knot at a time");
	if (pc.hasWings()) output(", even going so far as to brush your wings and their sensitive foundations");
	output(". Stretching out is easy after you lose track of the time spent being loved and... tickled!");
	output("\n\nRoxy can only laugh.");
	output("\n\n<i>“Alright, we should be outta here...”</i> she says, helping you to stand. Both of you wobble under the weight of complete sexual exhaustion. <i>“Take it easy for a bit. And next time you’re feeling horny as hell, there’s a certain laquine you can <b>always</b> come back to.");
	if (flags["ROXY_STERILEX"] == 1) output(" Hopefully you’ll ask a certain laquine to stop taking no-kid-drugs so she can have some babies...");
	output("”</i>");
	output("\n\nYou both laugh, kiss, and make use of the showers. Roxy is first to leave, but not before giving you the biggest hug and a pat on the butt. When you collect yourself and peek at your codex, you’re not sure if you should be surprised that <b>you were little more than a prostate to be milked for the last four hours.</b>");
	
	IncrementFlag("ROXY_SEX");
	IncrementFlag("ROXY_MISSIONARY");
	processTime(180 + rand(60));
	pc.shower();
	soreDebuff(2);
	setRoxyStyleCollarMark();
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}	

public function roxySexCowgirl():void
{	
	clearOutput();
	showRoxy(true, true);
	
	var firstTime:Boolean = true;
	if (flags["ROXY_COWGIRL_FIRST"] > 0 || flags["ROXY_COWGIRL_HOLD"] > 0) firstTime = false;
	var pregTri:int = roxyPregTrimester(true);
	
	if (firstTime)
	{
		output("You flick a finger at the brim of Roxy’s ear to catch her attention. The jock-rabbit’s response is to whip her gaze at you and lean in for a quick and forceful kiss. <i>“That what you wanted? People who touch my ears usually wanna fuck, and you had that puckered up look for a sec.”</i>");
		if (pc.isBimbo()) output("\n\nI did! And I also wanna have a go. Somethin’ new this time too, hunny bunny!");
		else if (pc.isBro()) output("\n\nYeah, and I wanna try something new this time, babe.");
		else if (pc.isNice()) output("\n\nWasn’t expecting that, but how about something new this time?");
		else if (pc.isMischievous()) output("\n\nIt’s part of what I wanted. Wanna do somethin’ new?");
		else output("\n\nI’ll have that and something else.");
		
		output("\n\n<i>“Oohhh, and what’s on your mind, Steeley-[pc.boyGirl]?”</i> Roxy’s legs kick back and forth, one in front of the other.");
		output("\n\nIn your own way, you tell her you want her on top, to ride you like a racehorse. She’s smiling the whole time you talk, only letting out a squeal of joy when you go into clit-drumming detail about how hot and sweaty she’s going to look mounted on your cock, shining like a prize trophy while she wins every [pc.cumVisc] drop of [pc.cumNoun] you’ve got.");
		output("\n\n<i>“That sounds fucking ace to me,”</i> Roxy says in a blend of sultry excitement, <i>“and I know just the place for us to kick off.”</i>");
		output("\n\nLike every time before, you’re off with the eager bunny-girl, pushing your way through the crowds on lapine energy. Her ears twitch with the excitement of what you’ve proposed. Part of you wonders if it was a good idea to hit her with it, but what can go wrong having a sexy slut-rabbit bouncing on your crotch? Sure she might grind your pelvis up a little bit but what’s a week of numb crotch when you’ve got a girl like her?");
	}
	else
	{
		output("Seeing how it worked so well last time, you flick your [pc.finger] at Roxy’s ear and kiss her before she kisses you. For a few minutes you make out like lovers on the bench, almost making the mistake of groping each other in front of a passing security guard. <i>“Love it, [pc.name], you know how to get me going. I think I know what you want again. Me sitting on your dick and flying your ship?”</i>");
		output("\n\nYou husk through her lips a simple ‘yes’, slapping her on the fuzzy ass to get going. She grabs your [pc.hand] and her bag, already butting through the crowds with that self-assured energy guiding the way.");
		if (pregTri > 0) output("\n\n<i>“Just mind my belly, alright?”</i>");
	}
	
	output("\n\nEyes on Roxy, you’re not paying any attention to where she takes you, only concerning yourself with the squish of her poorly hidden ass and the ropiness of her exposed muscles. The lithe laquine, as always, let’s you go to slam a dinky keycard against a reader, almost having no time to pocket it when you’re barreling inside with her in your arms.");
	output("\n\n<i>“What’s got you so amped?”</i> she quips, gripping your sides. <i>“Not that I’m complaining, but don’t forget what you asked, yeah?”</i>");
	output("\n\nThat’s no problem, but first things first! You unzip Roxy’s barely stitched hoodie and yank it off her arms. You do that, then tear her bra off, availing yourself of ample titflesh with a few nipple-nibbles and plenty of hungry licks. All this, and she’s grinning and ushering you in for more, purring in your [pc.ear] from all the rough attention you lavish her with.");
	if (pc.hasArmor())
	{
		output(" It’s then her turn to discard your [pc.armor]");
		if (!pc.isChestExposedByUpperUndergarment()) output(", taking her time with your [pc.chestCoverUnder]");
		output(".");
	}
	if (pc.hasTits())
	{
		output("\n\nYour mammaries are subject to the same desperate hunger, starting with your [pc.nipples],");
		if (pc.hasInvertedNipples()) output(" urging them from their [pc.nippleColor] lairs with forceful, blissful strokes.");
		else output(" licking them until they’re firmly erect and glowing in red-hot bliss.");
		if (pc.biggestTitSize() >= 19) output(" <i>“Fuck me, if I push my face into these - which I’m gonna - all people are gonna remember of me are my ears poking out! Oh, and nice tits, [pc.name]!");
		else if (pc.biggestTitSize() >= 11)
		{
			output(" <i>“Shit, [pc.name], you tryin’ to be some team’s practice equipment with these");
			if (pc.isLactating()) output(" milky");
			output(" mommas? Dunno how you get around like this. Must suck not being able to see whoever or whatever’s on their knees for ‘ya!");
		}
		else if (pc.biggestTitSize() >= 4) output(" <i>“Mmmh, I’m not really into playing with boobs, but there’s something to be said about a herm with big ‘ol soft titties like these.");
		else output(" <i>“Yep, still hoping I stay like these. Small, nice ‘n round, all perky, not in the way. I don’t understand how those moo-girls handle big knockers.");
		
		output("”</i> Roxy grins, licking from one teat to the other, traveling over your");
		if (pc.biggestTitSize() >= 11) output(" vast");
		else if (pc.biggestTitSize() < 4) output(" limited");
		output(" expanse of");
		if (pc.hasFur()) output(" fluffy");
		else if (pc.hasScales()) output(" scaly");
		else output(" smooth");
		output(" boob. Her dusky lips imprison one [pc.nipple], and your eyes roll back when she inhales.");
		if (pc.isLactating()) output(" [pc.Milk] sprinkles into her mouth, surprising her with a good taste of [pc.milkFlavor] nourishment.");
		output(" If the sporty-bun ever leaves your sumptuous breasts, it’ll be too soon.");
	}
	output("\n\nInspired now, the espresso rabbit massages you in her tried-and-true way, starting from your vulnerable sides, maneuvering towards your [pc.hips], unknotting your stiff muscles and adding inches to your growing erection");
	if (pc.cockTotal() > 1) output("s");
	output(". She leans forward, pressing her cheek to the");
	if (pc.hasTits()) output(" top of your boob-shelf");
	else output(" flat of your [pc.chestNoun]");
	output(", allowing your quickening heartbeats to ripple through her head. From there, she takes you all in, always coming close but not quite to brushing");
	if (pc.isCrotchExposed()) output(" [pc.eachCock].");
	else output(" your extending bulge.");
	
	output("\n\n<i>“Alright, enough fuckin’ around,”</i> Roxy chimes, breaking free from your [pc.hands] and sliding around you, maintaining a closeness that warms your body from the friction of her gliding fur.");
	output("\n\nYour back is now firmly to the bench you had her held near. In the same motion Roxy shoves you down, she reaches");
	if (pc.isCrotchExposed()) output(" for your [pc.cocks]");
	else output(" under your drenched fabric");
	output(" and collects a palmful of [pc.cumColor] slickness, bringing that hand to her heaving chest once she seats her denim-hidden netherlips firmly on your loins. <i>“That’s more like it,”</i> she sighs, both ears wobbling and tail wagging.");
	if (pc.isNude()) output(" <i>“Why you walk around Uveto naked I’ll never know. But hey, more power to ‘ya. I fuckin’ hate the cold.”</i>");
	
	output("\n\nHer wide hips rock atop you, kneading your springy urethra");
	if (pc.cockTotal() > 1) output("s");
	if (pc.balls > 0) output(" and swelling your [pc.balls] with what she craves the most");
	output(". The undersides of her chestnut haunches massage your [pc.knotBallsHilt] with the supple sensuality absent from her dick-dominating marecunt.");
	
	output("\n\nPlanted to your belly, your [pc.cocksLight]");
	if (pc.isCrotchExposed()) output(" dribble freely across your [pc.skinFurScales]");
	else output(" poke out from your undergarment");
	output(" unable to achieve full mast but also unable to lose any arousal. The incredibly horny bunny-girl on top of you presses so hard on your poor shaft");
	if (pc.cockTotal() > 1) output("s");
	output(" that precum backs up and your eyes nearly roll back from the subsequent venting of penile pressure.");
	
	output("\n\nLaughing at the ecstatic contortions of your face,");
	if (pc.isCrotchExposed()) output(" and the pretty, [pc.cumGem] puddles funneling into your navel before trickling down your glutes");
	else output(" and the increasingly ruined state of your clothes");
	output(", Roxy grinds your manhood");
	if (pc.cockTotal() > 1) output("s");
	output(" into higher levels of laquine-ready stiffness, doing so with an attitude so unconcerned that it’s like she wants you to bust");
	if (pc.isCrotchExposed()) output(" all over yourself.");
	else output(" inside your [pc.crotchCoverUnder].");
	
	output("\n\nThe pleasure goes both ways: Roxy’s blue short-shorts are so wet and plastered by copious lubricant that you can see her plump pussy outlined through the fabric. The rabbit-slut swats your [pc.hand] away; the other makes it to her crotch, unzipping that useless thing and yanking it aside, releasing her scent along with an enthusiastically expelled stripe of fragrant desire. She leans back, paws on your [pc.thighs], juices warming your locked legs, shuddering in uplifted joy.");
	output("\n\n<i>“[pc.name], you keep coming around, you keep making me feel this good, I’m gonna start wondering why I’m not shacked up with you...”</i> she purrs, one final pearlescent sheen of girlcum dripping down to the floor.");
	output("\n\nFluidly but not gracefully, Roxy lifts herself up and stretches one leg, kicking out of her smeared clothing");
	if (!pc.isCrotchExposed()) output(" and yanking yours aside");
	output(" before smushing her black-lipped twat to your turgid manhood");
	if (pc.cockTotal() > 1) output("s, hugging them");
	else output(", hugging it");
	output(" deeply between muscly thigh-cleavage and entertaining the");
	if (pc.isCrotchExposed()) output(" exposed");
	else output(" obscured");
	output(" [pc.cockHeads] with short, jittery strokes.");
	
	output("\n\n<i>“Always so hard for me...”</i> she says vacantly, holding your [pc.cocks] so tight that her whole arms quiver from your needy throbs");
	if (pc.cockTotal() > 1) output(", singling [pc.oneCock] out for the action");
	output(". <i>“I really like that, you know? More than anyone else I’ve ever been with, there’s something really cool about you. You can handle me for who I am, all smiles... and your fucking hot dick");
	if (pc.cockTotal() > 1) output("s are");
	else output(" is");
	output(" always rock hard...”</i>");
	
	output("\n\nSmirking back, you tell her to get going before you get bored. Winking, Roxy lifts up, telling you to watch the attitude when you put your [pc.arms] behind your head in a mocking display -- she came, not you. Despite your moment of mischief, the height she gains is suddenly off-putting. Looming higher... and higher, nothing about this looks natural and you briefly wonder if this is a good idea for either of you.");
	output("\n\nFor Roxy, though, it’s the (best) only idea.");
	output("\n\n<i>“Ready or not, [pc.name]...”</i> she inhales, and like an avalanche she comes crashing down. <i>“Here I come!”</i>");

	processTime(15);
	clearMenu();
	addButton(0, "Next", penisRouter,[roxySexCowgirlNext,roxy.vaginalCapacity(),false,0]);
}
public function roxySexCowgirlNext(kok:int=0):void
{	
	clearOutput();
	showRoxy(true, true);
	
	var firstTime:Boolean = true;
	if (flags["ROXY_COWGIRL_FIRST"] > 0 || flags["ROXY_COWGIRL_HOLD"] > 0) firstTime = false;
	var noPreg:Boolean = false;
	if (pc.virility() <= 0 || flags["ROXY_STERILEX"] == 1) noPreg = true;
	var pregTri:int = roxyPregTrimester(true);
	var venomDickFirst:Boolean = true;
	if (flags["ROXY_VENOMDICK"] == 1) venomDickFirst = false;
	var steeleCumFirst:Boolean = true;
	//willpower check with max 90%
	if (rand(100) < Math.min(pc.WQ(),90)) steeleCumFirst = false;
	
	output("Roxy’s hips <b>smash</b> into yours and you bounce upwards, gasping sharply as you stare into her shiny white teeth and try to cope with destructive coital impact. Her waist struck hard enough to ripple through your soul. Instead of savoring her ebony embrace, you split it wide open, and a steady trickle of juice begins to flow. The percussion didn’t offer much in the way of sound, but its effect was felt everywhere in your body, keenly in your mind.");
	
	pc.cockChange();
	
	output("\n\nShe gives an ear-shattering screech when every muscle in her body locks at once and she bucks, lurching forward to steady herself on your shoulders. The crashing of crotches drove her to a mini-orgasm, though you can’t tell if it was purely physical.");
	if (pc.cocks[kok].cLength() >= 14) output(" It probably was... you felt your [pc.cockHead " + kok + "] slam off her cervix.");
	output(" <i>“Oomph, felt like I bounced off the BA goalie, that guy’s built like a fucking mountain. Only unmodded behemoth I know.”</i>");
	output("\n\nIn Roxy’s sweltering pot you feel her pussy-walls acclimating to you [pc.cockType " + kok + "] shape. The bunbun’s plump and cushy tunnel undulates madly with the effort of somehow squeezing you deeper despite the fact you’re burrowed [pc.knotBallsHilt " + kok + "]-deep in swampy laquine cunt. Firm and violent tugs of her white-hot nerves tenderize your [pc.cockHead " + kok + "], building off the damage of her first collision.");
	output("\n\n<i>“Hope you’re not getting comfortable there, sweet-cheeks, because we’re just getting started.");
	if (pregTri > 0) output(" Guess I gotta mind the extra weight in my gut, but they’re my kids. They’ll be big ‘n strong like mom!”</i>");
	else if (flags["ROXY_TOTAL_KIDS"] > 0) output(" You’ve yet to get me pregnant again, and this is gonna be the one that takes!”</i>");
	else output(" You haven’t gotten me pregnant yet, and this is gonna be the one that takes!”</i>");
		
	output("\n\nYou idly remind her she already finished a few minutes ago. Roxy throws her head back in laughter, sweat flinging from the tips of her fuzzy ears. <i>“That’s what you think.”</i>");
	output("\n\nYou’re put back in your place when Roxy gingerly slides forward, the texture of your [pc.cock " + kok + "], tracing her fingers over your [pc.skinFurScalesNoun]");
	if (pc.hasTits())
	{
		output(" before gripping your [pc.breasts] by their [pc.nippleColor]");
		if (pc.isLactating()) output(" and leaky caps");
		else output(" caps");
	}
	output(". Your adamantine boner holds the line, keeping her juicy cunt spread for ease of squelching passage. For a moment, you lose yourself to the slow slide of her forward motion, moaning happily with shut eyes until your [pc.cockHead " + kok + "] is all that’s left inside.");
	
	if (pregTri > 0) output("\n\n<i>“Hey, [pc.name]...”</i> Roxy strains, her baby-burdened belly wobbling between you. <i>“C’mon, don’t look so sleepy, we’re trying to have some fun!”</i>");
	else output("\n\n<i>“Now who’s gonna cum?”</i> she snarks. <i>“Remember who’s on top here, [pc.name], and remember who’s gonna be carrying your kids!”</i>");
	output("\n\nThe boner-mounted jock grinds back, eyes aflutter with a slit full of [pc.cockNoun " + kok + "]");
	if (pc.cockTotal() >= 4) output("; your extra dicks rub into her thighs, and, being the considerate bun she is, Roxy jerks them all equally");
	else if (pc.cockTotal() >= 3) output("; your extra dicks rub into her thighs, and, being the considerate bun she is, Roxy takes two into her hands");
	else if (pc.cockTotal() >= 2) output("; your extra dick rubs into her thighs, and, being the considerate bun she is, Roxy takes it in both hands");
	output(". Every outstroke elicits the cutest moans from her, and you wonder if she’s as absorbed into the tactile act as you are. On her muzzle is a wide, ear-to-ear smile. After a few seconds of staring at that, you lean up a bit to grip her curvy hips, thrusting up to match her gyrations, doing everything you can to stimulate her exterior and yours.");
	
	output("\n\nTongue lolling, Roxy groans, using your stomach for support as she thumps your crotch, slamming into you with all the leaper’s and breeder’s strength innate to her race. Belatedly, you realize that she’s been aiming your [pc.cock " + kok + "] at her G-spot the whole time, ignoring the rest of her hole in favor of that selfish, vivacious unity.");
	output("\n\nNot keen on sitting back, you decide to fill out that plush pussy, jerking the sweaty, rippling bunny, destroying her rhythm with unfelt pleasure. <i>“Oohh.. Ooh, that’s nice!”</i> Roxy tilts her head, a uniquely maternal smile cresting her blissed out features. The shockwaves continue, spraying her sweet torrents in coronal arcs. One particularly concussive cycle of bunny-hips send a wad of femcum up to break apart on your [pc.face].");
	output("\n\n<i>“HA! Suck it, [pc.name],”</i> Roxy howls in laughter. While you wipe your brow, one eye webbed shut by girlmusk, she’s slowly revealing that either she was holding back this whole time or she’s gotten pumped up by something else.");
	if (pc.cockCanSting(kok)) 
	{
		flags["ROXY_VENOMDICK"] = 1;
		if (venomDickFirst) output("\n\nThat’s not going unpunished!");
		else output("\n\nDid she forget what your dick can do? Nah, you know her too well.");
		output("\n\nYour [pc.fingers] dig into her taut waist, yanking her forward and uttering a mental command to your venom-bearing dick-tendrils. The stingers at the foot and crest of your [pc.cock " + kok + "] unleash their venomous payloads in that instant, injecting Roxy’s cum-hungry nerves with potent hits of sensory wiping bliss. <i>“Wahhyeaaaaaah! Fuckfuckfuck YES!”</i> she wails, rocking to the left and to the right.");
	}
		
	output("\n\nNothing you do can be easy with her, because now she’s grinding those swollen, shimmery pussylips to your [pc.knotOrSheath " + kok + "],");
	if (pc.hasKnot(kok)) output(" threatening to take your knot before it’s fully inflated.");
	else output(" allowing her sizzling hot cream to infiltrate the space between your cock and its scabbard.");
	output(" Roxy’s dusky cunt makes the best noises, especially when her lips ‘pop’ around the [pc.cockHead " + kok + "]. It’s like a hammer to the knee, always making you thrust up, slam her into the air... just to have her crash back down to planet Steele. The exertion is hell on your tendons, and you’re grunting like a bodybuilder trying to reach the next level.");
	
	output("\n\nIt feels too good to stop now, and despite the strain of having your [pc.legsNoun] off to the side of a narrow piece of furniture, you’re meeting the rabbit’s happy strokes. She yanks up, you pound home, again, and again, and again. The friction of movement and the heat of her fertile womb-musk overwhelm you. Roxy is just as overwrought with the joy of taking your dick, gripping her tits now, squeezing on them as if to force out some milk. She tugs forward so fiercely that she yelps in pain, only to moan and purr when you wash away it with a good, hard dicking.");
	output("\n\n<i>“So-!”</i> Roxy stops abruptly, her pussy clutching your rod adoringly. That vice-like tunnel relaxes and tightens in smooth, unflagging motions, slathering your meat with enough lube to install a desire to rut. <i>“How about we see who cums first. Whaddaya say, [pc.name]? Bet you can’t hold back. Bet you wanna cum inside me while I laugh at you for how quick a shot you are, you look like the needy type!”</i>");
	output("\n\nYou open your mouth only for Roxy to fall forward, shifting your heavy, rigid member with her. The shift of penile weight silences your vocabulary into a heated huff against the joyful bun’s sex-coated hand. <i>“What happened before doesn’t fuckin’ count. Neither of us have cum from the real stuff. Anyway, let’s see if you’ve got what it takes, Steeley-[pc.boyGirl]!”</i>");
	output("\n\nThe athletic laquine lifts herself again, paws locked to your love handles, pushing you deeper while her tail curls possessively around a [pc.thigh]. <i>“Now it’s time for me to get serious. All that was just for fun, now...”</i> She presses her feet to the floor and lifts up, all the ligaments in her lapine limbs flexing powerfully. <i>“...now it’s");
	if (pregTri > 0) output(" time for you to show me why I like you.”</i>");
	else output(" time for me to get pregnant.”</i>");
	
	output("\n\nSome part of you wants to let go right away, but she just threw down gauntlet -- the gauntlet’s her clitty in this case but whatever. ");
	output("\n\nHer velvet tunnel, soaked in the combined slimes of two lovers, grips you harder than ever before. If you wanted to erupt, now’s not the time anyway. Your eyes keep trying to roll back when her new, much more rapid pace reaches consistency. Roxy’s efforts intensify, and in contrast, yours begin to fade into half-lidded and feverish attempts to remain lucid.");
	output("\n\nRoxy’s lips open wide, air coming out so hot in the rising temperature that it visibly steams. Again, you’re in the same place as before, staring at her enamored. No words came from her mouth, only smoky vocals that scorch the air. Her form is impossibly well-trained, admirable in every respect.");
	if (pregTri > 0) output(" She’s a wonderful specimen of her race, heavy with child, yet captivating, in control, totally complete with the round belly to prove it.");
	else if (flags["ROXY_TOTAL_KIDS"] > 0) output(" She’s a creature ripe to be bred, to be made into a mother anew.");
	else output(" She’s a creature ripe to be bred, to be made into a mother.");
		
	output("\n\nThere’s an appeal to her, an animalistic magnetism that slowly but surely restores your willpower, to be more than a fucktoy for her to ride. After all, that’s not what she likes about you. She likes you fighting back, taking control, tempering her sexual charisma with your unwillingness to surrender. Your jaw locks and your heart lurches, the beginnings of spectacular orgasm melting your common sense into a puddle of fuck-glaze.");
	output("\n\nFor the rest of your wild frolic, you’re powering into Roxy’s cunt with all the fervor you’ve built up until now, dotting the floor with effluence and furiously driving your hips to match her in the race. You’re going to <b>make</b> her cum first. You’re going to beat her without an ounce of passivity. Boiling in her fiery muff, you promise yourself you’re not going to be the tortoise to her hare.");
	
	if (steeleCumFirst)
	{
		output("\n\n<i>“You can’t... You can’t win, [pc.name],”</i> Roxy says, not looking so strong herself. You’ve got this!... As long as you breathe. Why the fuck is it so hard... Fuck, she’s riding you harder than before? How is that even possible!? Lewd discolorations creep in on the edge of your vision, and as much as you don’t want to admit it, you do feel a little bit... well, you’re not able to match her as well as before. From the way you’re moaning, you’re having the time of your life.");
		output("\n\nSo is Roxy. She’s gripping you tight, hard enough to leave marks on your [pc.skinFurScalesNoun]. Yes, you’re hyperventilating, and yeah, your whole body’s trembling up. That vibration? That’s... that’s Roxy! That’s not you. You’re definitely not pleasure seizing, it’s her, she’s just cumming so hard it’s set off a quakegasm of epic proportions.");
		output("\n\n...Every vein on your [pc.cock " + kok + "] is standing out, straining unhealthily to hold back an orgasm battering at the inner gate. The whole stadium is shaking, it’s not you, <b>it’s not you, it’s her!</b> She’s wringing fat drops of pre out because she’s cumming, not you!!");
		output("\n\n<i>“Steele... JUST FUCKING CUMALREADYICAN’THOLDANYMOREYOULOSTJUSTBLOATMEEEEEEE!!”</i>");
		output("\n\nFuck... You can’t deny it. <b>It’s you who’s cumming.</b>");
	}
	else
	{
		output("\n\n<i>Inhale.</i> You muffle her puddly exhortations under your loud, throaty exhalation. Roxy squirms a little bit painfully in your titanium-strong grip. Low whimpers barrel from her opened lips, your hands tight on her boob and waist, squeezing strong enough that she can’t help but mewl and cry out. The bunny-girl’s streaming slit declares its desire for more of that rough treatment, her nervous system short circuiting on your deepest and most savage strokes.");
		output("\n\nYou’re in control. You have no idea how that’s possible, but your willpower is defeating hers. Climax shakes her brain into a blurry rattle: Roxy explodes on your crotch, her held back juices crashing outwards in a groin-smearing splatter. <i>“Nooo...”</i> she whines, smiling, eyes closed, close to giggling. <i>“Making me cummm, so gooooood...”</i>");
		output("\n\nRoxy rocks to and fro, swaying on you, helplessly thrashing on your [pc.cocks]");
		if (pc.balls > 0) output(", your [pc.ballsNoun] gurgling on the precipice of release");
		output(". Beautiful spasms vibrate her from ear to toe with every suck for oxygen. She’s gasping now, lollard tongue sliding across her parched lips. <i>“[pc.name], I want your cummm! Cum! Cum! Right now’s thetimeit’ssohotohmygodCUMALREADY!”</i> she arches back and wails.");
		output("\n\n[pc.EachCockHead] swell, matching your spunk-tube");
		if (pc.cockTotal() > 1) output("s");
		output(" in diameter, the onset of orgasm claiming you as easily as it took her. You give her a slow, gentle massage, achieving orgasm at the apex of your pleasure, releasing your load into the fuck-drunk laquine’s prick-flattened interior");
		if (pc.hasKnot(kok)) output(" after slamming your [pc.knot " + kok + "] past her labia to seal in all of your precious seed");
		output(".");
	}
	
	var cumQ:Number = pc.cumQ();
	if (cumQ >= 10000)
	{
		output("\n\nThe sharp spike of your inhuman orgasm hits so hard that you nearly shoot Roxy clean off your [pc.cock " + kok + "]. [pc.Cum] rushes with all the strength of your previous fucking, and you barely feel the cold sweat coating your [pc.skinFurScales].");
		output("\n\nEnormous columns of [pc.cumVisc] spooge blast through your overtender flesh, adding some kind of pain to your cumslit on the way out. Dicks just weren’t made for this kind of orgasm, but this kind of creampie was baked special for the needy laquine on your length, slumping and growing instantly");
		if (pregTri > 0) output(" more");
		output(" gravid from the [pc.cumVisc] loads you’re drowning her inner nerves in, coating every inch and microcentimeter of incandescent womanhood in [pc.cumGem] spunk.");
		output("\n\nThat sweet smile on Roxy’s face burns itself into your mind, that hyper-happy grin of being filled in a way that only you can provide. You’re fucking your heart out and jizzing your soul out, and all of that effort is going to");
		if (pregTri > 0) output(" keep Roxy your personal breeding bitch for all time.");
		else output(" spawn new life.");
		output(" You can’t wait to see it. You can’t wait to do this all over again.");
		if (pc.cockTotal() > 1) 
		{
			output(" Pillars of [pc.cumColor] launch against the ceiling, breaking apart it like stadium-busting missiles of erotic relief. What doesn’t hit comes slamming down with the dribbles, plastering you and Roxy in a breathtaking example of amazing sex.");
			pc.applyCumSoaked();
		}
	}
	else if (cumQ >= 6000)
	{
		output("\n\nWhen the first pussy-stuffing eruption of [pc.cum] surges through your [pc.cock " + kok + "], Roxy bucks upwards from the impact of your pussy-cramming load. There’s something so very right about this, and of course <i>very tight.</i> You’re a font of [pc.cumNoun], blasting her womb with enough seed that her belly inflates");
		if (pregTri > 0) output(" to extra circumference.");
		else output(" outwards.");
		output("\n\nMuscles once coiled and stiff relax like slackening springs, pressing out more and more over the minute of your comfortable orgasm.");
		if (pc.cockTotal() > 1)
		{
			if (pc.cockTotal() > 2) output(" Your extra cocks");
			else output(" Your extra cock");
			output(" make their mark too, aimed skyward, blasting thick ropes of [pc.cumGem] gunk into the air, hitting the ceiling, but it all comes falling or dripping back down in a [pc.cumFlavor] torrent of seed-filled goodness, plastering you and your bun with sex.");
			pc.applyCumSoaked();
		}
	}
	else if (cumQ >= 3000)
	{
		output("\n\nYour [pc.cocks] erupt, and what a sensational moment it is. [pc.Cum] fires off in perfect shots, aimed directly for Roxy’s baby-making core. You can’t imagine existing any other way over the next half minute, shooting, shooting, cradling your spasming partner while you pump her full of [pc.cumVisc] spooge. It’s a lot like falling in love, really, that slow, sensual rounding to her belly");
		if (pregTri > 0) output(" that’s noticeable even through the circumference added by pregnancy");
		output("...");
		if (pc.cockTotal() > 1)
		{
			output("and then, of course, there’s all those beautiful, [pc.cumGem] fountains launching into the air and coming down in a sparkly torrent of seed-filled fluid, plastering you and your bun...");
			pc.applyCumSoaked();
		}
	}
	else if (cumQ >= 500)
	{
		output("\n\nVariable colors light up your climactic dark as the first [pc.cumVisc] wad of [pc.cumNoun] rockets through your dilated spunk-tube. The change from complete fullness to total emptiness rocks you so thoroughly you feel like the matter making your body up is phasing through the bench and you’re descending into a void. Roxy’s cunt holds you tight, milking your [pc.ballsNoun] dry until you’re sighing happily on the cummy come-down.");
		if (pc.cockTotal() > 1) output(" Quite literally, what with a few [pc.cumColor] wads dripping down her fuzzy thighs.");
	}
	else
	{
		output("\n\nYou cum, powerfully, but its volume is lacking relative to the iron heave in your brain. Tiny spurts of [pc.cum] are not what this kind of sex deserved. The satisfaction of relieving your");
		if (pc.balls > 0) output(" [pc.balls]");
		else output(" loads");
		output(" helps you ignore that tiny detail at least. Long after your [pc.cumVisc] reserve is milked dry, you’re still twitching and dribbling a happy, [pc.cumGem] drop into Roxy’s cunt");
		if (pc.cockTotal() > 2) output(" while your extra dicks shoot a few [pc.cumColor] ropes onto her fuzzy thighs");
		else if (pc.cockTotal() > 1) output(" while your extra dick shoots a few [pc.cumColor] ropes onto her fuzzy thighs");
		output(".");
	}
	
	output("\n\nRoxy slumps forward and you catch her in your [pc.arms], holding tight. She does too. Before she says anything, she smacks a few kisses along your neck, rubbing insistently into your [pc.face]. <i>“That was... Oh hell, that was just the best...”</i> she groans, and... nothing.");
	output("\n\nShe’s passed out! You briefly consider joining her, but the riot of sensory data from her still-squirming muscles and the trickle of [pc.cumNoun] dripping down your [pc.knotBallsHilt " + kok + "] keeps you from rest. Really, you feel <i>fired up!</i>");
	output("\n\nBut lie still you must, for your sleeping bun needs her rest.");
	if (pc.isNaga()) output(" Fortunately, you can give her the best hug of all time with your [pc.leg]!");
	
	IncrementFlag("ROXY_SEX");
	if (steeleCumFirst) IncrementFlag("ROXY_COWGIRL_FIRST");
	else IncrementFlag("ROXY_COWGIRL_HOLD");
	processTime(15 + rand(15));
	roxy.loadInCunt(pc, 0);
	pc.orgasm();
	pc.applyPussyDrenched();
	clearMenu();
	addButton(0, "Next", roxySexCowgirlAfter, pregTri);
}
public function roxySexCowgirlAfter(pregTri:int = 0):void
{	
	clearOutput();
	showRoxy(true, true);
	
	var noPreg:Boolean = false;
	if (pc.virility() <= 0 || flags["ROXY_STERILEX"] == 1) noPreg = true;
	
	output("<i>“Steele...”</i> Roxy shoots up, shaking her head rapidly. She can’t move much, cradled in your arms. <i>“I kinda gave up on the rough act. I just started feeling something sitting on you like that, didn’t have it in me to get all hot headed. Eh- mostly. Anyway...”</i> she hums, pulling you into the perfect kiss, running her paws over your head");
	if (pc.hasHair()) output(" and through your hair");
	output(".");
	output("\n\n<i>“[pc.name], you’re the best fuck ever. I kinda feel bad thinking about you as a notch on the figurative bedpost, seriously. Let’s keep doing this. And hey...”</i> she leans up, patting her belly. <i>“");
	if (noPreg) output("Just think about all the kids you could put in here if you weren’t being so boring!");
	else if (pregTri > 0) output("Gonna give you some more kids soon!");
	else if (flags["ROXY_TOTAL_KIDS"] > 0) output("Gonna get me all knocked up after this, we’re gonna have ourselves a big, happy family!");
	else output("Bet I’m finally gonna have some kids soon!");
	output("”</i>");
	output("\n\nAfter a few minutes of idle banter and sweet cuddling, Roxy finally dismounts, stroking your cheek as she goes to take advantage of the showers. You do the same, cleaning the grime and sweat of your rendezvous before meeting one last time, kissing, and leaving the room with both hands interlocked. Of course you have to separate at some point. ");
	output("\n\nRoxy gets back to her bench, and you’re left in the middle of a throng to decide what next to do.");
	
	processTime(60 + rand(60));
	pc.shower();
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function roxySexQuickie(kok:int = 0):void
{	
	clearOutput();
	showRoxy(false, true);
	author("William");
	
	var firstTime:Boolean = true;
	if (flags["ROXY_BJ"] > 0) firstTime = false;
	var noPreg:Boolean = false;
	if (pc.virility() <= 0 || flags["ROXY_STERILEX"] == 1) noPreg = true;
	var pregTri:int = roxyPregTrimester(true);
	
	if (firstTime)
	{
		output("<i>“How about something... <b>quick</b>?”</i> you ask, tracing a [pc.finger] near her lips.");
		output("\n\n<i>“Hrmmhm,”</i> she bubbles, posturing her wide hips enticingly, <i>“what’s on your mind then, [pc.name]? Thinking of pushing me down and having your way with me all over again? Right here, in front of everyone?”</i>");
		output("\n\nWhile she traces a nimble finger through her silken cleavage, you explain you’d like her to be rougher than ever, that what you want this time isn’t necessarily a chance to breed her.");
		output("\n\nAt least... not in the usual places.");
		output("\n\n<i>“You know what, I think I’m starting to put two and two together here.”</i> She stares bright-eyed at");
		if (pc.isCrotchExposed()) output(" your elongating [pc.cocksLight]");
		else output(" the ballooning bulge in your crotch");
		output(". <i>“Get up, and let’s get some privacy.”</i>");
	}
	else
	{
		output("<i>“How about a blowjob today?”</i> you simper, stroking her face. In no uncertain words you tell her you’d like some Roxy-brand oral aid.");
		output("\n\nThe laquine straightens and nods in agreement, grinning devilishly, speaking with a creamy tone: <i>“Say no more, [pc.name].”</i>");
	}
	
	output("\n\nRoxy has her bag and you firm in hand, already directing you onward. You’re maneuvering through the crowds as usual, heading down one of the connecting passages to a wing of arranged locker rooms.");
	if (firstTime)
	{
		output("\n\nOnce you’ve rounded the corner and ducked down the declining ramp, what happens next catches you completely off guard. Roxy hucks her bag against the wall and shoves you against it, pinning you to the plain barrier");
		if (pc.tallness >= 69) output(" while standing on her tiptoes to press");
		else output(" pressing");
		output(" her lips into your chin. <i>“Right here’s good enough.”</i> She cracks her neck, sticking her butt out mirthfully. <i>“You wanted it quick right? How about we change things up a bit... who knows who’ll come down here?”</i>");
		output("\n\nHer legs drag back and forth across your lap. <i>“Did I pick a sport in season... or are we near the racer’s stable?”</i>");
		output("\n\nShe drops to her knees in front of your crotch while you shake off the dizzying suddenness of her aggression. You’re in no position to stop her from commandeering your [pc.cocks]");
		if (!pc.isCrotchExposed()) output(", having torn your [pc.crotchCover] away like paper");
		output(". Whatever protest forming on your tongue drowning at the very real possibility you could be caught. <i>“Oh yes!”</i> Roxy licks her lips, stealing a lick at your stiffened [pc.cockColor " + kok + "] flesh. <i>“Just what I was after!”</i>");
		if (pc.exhibitionism() >= 33) output("\n\n If someone caught you... maybe they’d keep quiet if you exposed yourself to pictures and video? Now you’re kinda hoping for it... and hoping stadium security doesn’t chance upon you...");
		else output("\n\nAn instant blush paints your [pc.face] red, and your heart quickens. Not only could someone see what you’re getting up to, maybe take pictures or video, but you’re not at all optimistic about stadium security’s reaction if they find you...");
	}
	else
	{
		output("\n\nAround the corner and down a familiar ramp, you know what’s coming. Being prepared for Roxy’s eagerness dulls the pain of being shoved back into a wall, at least. <i>“I love that we can fucking do stuff like this ‘n keep getting away with it!”</i> she laughs, licking across your neck. <i>“Look at you acting like that, moaning so cutely!”</i> It’s true, your body clenches and muscles pop out violently to the adrenaline-shunting effect of pernicious stimulation. <i>“Don’t even try to think of where we are, because, fun fact, I’m a bit lost myself. Dick has a way of... affecting the mind, y’know?”</i>");
		output("\n\nSinking to her knees, words begin to fail the cock-infatuated sports-bun.");
		if (!pc.isCrotchExposed()) output(" She pulls apart the tented clothing in her way, allowing your [pc.cocks] to spring forth without dropping anything.");
		output(" <i>“Fucking yes!”</i> the pheromone-drunk athlete barks; your loins throb;");
		if (pc.cockTotal() > 1) output(" blood feeds into your phallic growths, swelling your reproductive organs into their ripened forms.");
		else output(" blood feeds into your phallic growth, swelling your reproductive organ into its ripened forms.");
		output(" Veins flare along your [pc.dickSkin " + kok + "], reacting exquisitely to the erotic exhalations across your icon of masculinity.");
	}
	output("\n\nYour heart is pounding so fast that your hips violently thrust to the dick-bulging tempo. Misfiring synapses hit your brain with anxiety, lust, fear, and desire all at once. Your thoughts trail off from what is actually going on when you glance nervously to the direction you came from. <i>Just around that L-shaped bend there are crowds innumerable.</i> The cheers and murmurs of that many gathered people swim down this hall like a stressful current.");
	output("\n\n<i>“Hey, eyes on me!”</i> Roxy shouts, snapping you back to sudden awareness. Your uncooperative waist is tamed by both her paws gripping your twitching pillar, jacking all " + num2Text(pc.cocks[kok].cLength()) + " inches of your quivering rod. <i>“There ‘ya go,”</i> she smiles, watching you relax against the cold surface, <i>“don’t worry about that, you just think about me.”</i>");
	output("\n\nHer tongue drags across the [pc.cockHead " + kok + "] of your [pc.cock " + kok + "], traveling the broadside of your [pc.cockType " + kok + "] shaft and halting at your [pc.knotOrSheath " + kok + "].");
	if (pc.cocks[kok].hasFlag(GLOBAL.FLAG_FORESKINNED)) output(" She takes a delightful moment to peel your foreskin back as slowly as possible.");
	if (pc.hasVagina()) output(" Pussy juice drips in thin cords from your [pc.pussiesLight], but neither you nor Roxy pay it much attention.");
	output(" Dusky lips pepper your fervor-flush flesh with on the reverse, ending with a groan-worthy smooch-slash-inhalation at the narrow slit of your urethra. [pc.CumColor] pre blasts out when she backs it up with the flat of her oral organ, squirting across her sluttily suckling face.");
	if (pc.balls > 0) 
	{
		output("\n\nAfter coming up for air, Roxy dives straight back into your nethers, submerging her keen nose in the [pc.cumNoun]-plumped");
		if (pc.hasFur()) output(" fur");
		else if (pc.hasScales()) output(" scales");
		else output(" flesh");
		output(" of your [pc.sack], breathing deeply of your ballmusk. She runs a thumb along");
		if (pc.balls > 1) output(" one of the orbs");
		else output(" the orb");
		output(" inside, all the way down to the taut underside. On the opposite end of your sack her tongue follows suit, curtaining your eastern");
		if (pc.balls > 1) output(" moon");
		else output(" hemisphere");
		output(" with a warm coat of mouth-slime. You can’t resist stroking her flicking ears and patting her head, encouraging more worshipful fondles, sucks, and nibbles on your slippery sphere");
		if (pc.balls > 1) output("s");
		output(".");
		if (pc.ballSize() >= 12)
		{
			output("\n\n<i>“F-F-Fuck...”</i> Roxy looks up, barely able to mouth that awed slur. Golden eyes glaze over with vacancy, and from the look she gives you moments before turning back to your weighty [pc.ballsNoun], her head is melting. There are no sharp pinches to your majestically endowed nuts, only luxuriously smooth rubs and squeezes to your pulsing spunk-reactors. They throb with immense load they carry. Behind");
			if (pc.balls > 1) output(" their");
			else output(" its");
			if (pc.hasFur()) output(" fuzzy");
			else if (pc.hasScales()) output(" scaly");
			output(" wall, your hefty [pc.ballsNounIsAre] engorging with roiling seed, indicated by a sensuous and gentle tingle that brings the contents to a boil.");
			output("\n\nRoxy strains her jaw to open as wide as it can, firming her lips to your testicles");
			if (pc.ballSize() >= 22) output(" which are even larger than her head");
			output(", flavoring the air she breathes with the incredibly virile musk of her rightful mate.");
		}
	}
	output("\n\n<i>“Mmmmmh,”</i> the slut-bunny moans. She’s jacking you with hard, fast strokes, soaking your [pc.cocksLight] in [pc.cumFlavor] seepage. Your head swims from the warmth along your shiny schlong" + (pc.cockTotal() > 1 ? "s" : "") + ", and you only manage one dry-hump before she shoulder tackles you back into the wall again. <i>“Sit the fuck still!”</i> she growls, <i>“so I can suck your dick" + (pc.cockTotal() > 1 ? "s" : "") + " raw!”</i>");
	output("\n\nHer predatory hands move past your [pc.knotOrSheath " + kok + "] to rest on your hips; she lines your flexing [pc.cock " + kok + "] to her dark lips. Roxy’s short muzzle puckers up, and when she pushes forward insistently, voraciously, your [pc.cockHead " + kok + "] parts her prick-pillows into a gloving ‘O’ shape. The shuddering crown of your [pc.dickSkin " + kok + "] makes the pleasurably moist trip toward her throat, halting at the center of her maw for a few greedy laps.");
	output("\n\nYour [pc.legOrLegs] shake and begin to buckle, but you brace your [pc.footOrFeet], nails digging into the wall propping you up. Roxy’s not even trying to keep you afloat, that’s all on you. If you happen to fall, she’d keep sucking. Leporine cheeks hollow down, coming close enough to hug your mast like a pair of pussy walls. Her lips seal down harder too, pulling you deeper. Now you’re getting used to it, she’s giving you time to adjust! The bunny-babe doesn’t gag-");
	output("\n\n<i>You do.</i> Wait- ");
	output("\n\nAir catches in your throat like lumps of food too large for your esophagus. Starbursts of sexual heat spark in your eyes, asserting with unmistakable authority on your retinas like a sudden shift in reality or a glitch in");
	if (silly) output(" the matrix.");
	else output(" virtual reality.");
	output(" Closing your eyes does nothing to dull the contact of her moist mouth against your lust-fattened girth. And then there’s the rippling muscles of her throat, squirming and shifting around the [pc.cockHead " + kok + "], imploring you to unload straight into the laquine’s gut.");
	output("\n\nYou whimper at the consistent, painful intake of air. She’s sucking so hard that she’s either a milker in disguise or she’s actually trying to take your dick! Either answer seems appropriate with every [pc.cockColor " + kok + "]-hued inch of rigid mast that vanishes into her accommodating throat.");
	if (pc.cocks[kok].cLength() >= 11)
	{
		output("\n\nRoxy’s eyes wince and her neck bulges with the amount of [pc.cockNoun " + kok + "] she’s taken; the progress of her lips is arrested by her biology");
		if (pc.cocks[kok].cType == GLOBAL.TYPE_EQUINE) output(" just past your medial ring");
		else output(" where your [pc.knotOrSheath " + kok + "] begins");
		output(". Although the neck-bulged she-rabbit can’t fit anymore of your magnificent cock inside, she can wiggle her tongue against the pre-bloated flesh of your urethra. She tilts her head, massaging more of your [pc.cumFlavor] drool into her stomach, the edges of her phallic-stretched lips quirked upwards in a happy smile.");
	}
	else
	{
		output("\n\nIt’s then she takes you to the hilt,");
		if (pc.cocks[kok].cType == GLOBAL.TYPE_EQUINE) output(" passing your medial ring and");
		output(" swallowing up your [pc.knotOrSheath " + kok + "]. Spattered lapine lips quirk upwards in a victorious little smile; the she-rabbit tilts her head left and right, wiggling her tongue against the spongy flesh of your distending cumvein. Pre flows freely down to her stomach, all the slow movements now dedicated to milking out as much of it as possible.");
	}	
	
	output("\n\nPart of you wants to move, to facefuck her, but all of your strength is devoted to just remaining upright. The pressured grimace hasn’t left your [pc.face] for one second. Roxy’s back and forth sucks and blows eventually reveal the reason why you’re straining. It’s the attempt to hold your voice in, to not scream out, to not alert anyone to your ‘predicament’. [pc.ChestNoun] heaving, you lurch upward and place a hand on her head...");
	output("\n\n...only to have it batted away.");
	
	if (pc.cocks[kok].cType == GLOBAL.TYPE_FELINE) output("\n\nYou’re not sure if she’s deriving more pleasure than you are right now, but the soft, bristling nubs lining your feline endowment deliver the most exquisitely pleasurable sensation when they rake her windpipe in short, shallow strokes. Stimulation comes from impossible angles, every single barb reacting to the constant swirl of her glossing tongue. Premature ejaculation seems an inevitability now, and you can’t keep your voice from whistling past your teeth in an embarrassing fashion. Roxy’s craning ears drink in that sound with glee.");
	else if (pc.cocks[kok].cType == GLOBAL.TYPE_EQUINE) output("\n\nOnly a master cocksucker could handle a horsecock the way Roxy is right now, pumping your stallion rod through her molded channel with innate ecstasy. She focuses solely on the flesh of your ferally musky meat, eyeing every vein in advance of tonguing them over when she slaps her nose to your [pc.belly]. The flare sealing her throat shut slows the passage of your girthy rod, but she doesn’t seem to mind. Really, you’re the one struggling; your voice floats between your teeth like the muffled wail of a banshee. Her upraised ears eagerly listen for those sounds.");
	else if (pc.cockCanSting(kok))
	{
		flags["ROXY_VENOMDICK"] = 1;
		output("\n\nRoused by the oral ravishing, your venomous cock-tendrils reach out to sting at Roxy’s face, inside and outside. You expected the rush of a potent payload to have given you an advantage, to have slowed her merciless treatment.");
		output("\n\n<b>You were dead wrong.</b> It causes her to redouble her efforts. She’s not about to release the reins of your virile shaft. Incidentally, the stingers at the base of your member end up hitting <i>you,</i> and what mixed with her saliva spills into your taut loins, intensifying your ‘displeasure’. Her jaw oscillations continue energized, and ghostly wails seep through your [pc.lipColor] lips. Her ears strain to listen for those the most.");
	}
	else output("\n\nHer adroit tongue focuses on your [pc.cockHead " + kok + "], swirling the hypersenistive ovaltine loop of delicate nerves. Her head sways in a wide arc of enjoyment, glossing your crown and prodding centimeters of flesh past the ever-oozing cumslit. Biting down is all you can do not to scream now, but you can’t stop your voice from whistling out past your teeth in an embarrassingly dominated fashion. Roxy’s craning ears seem to approve of that the most.");
	
	if (pc.cockTotal() > 1)
	{
		output("\n\nBeing the skillful laquine she is, Roxy is happy to jack your");
		if (pc.cockTotal() > 2) output(" other cocks, alternating tugs and boner-thumping squeezes along your tensing masts. Once or twice she swaps to the others, warming them in the enclosure of her intimate, silky mouth before shifting back.");
		else output(" extra cock, alternating tugs and boner-thumping squeezes along your tensing mast. Once or twice she swaps, warming it in the enclosure of her intimate, silky mouth before shifting back.");
		output(" Before long, every hand and lip pump is accompanied by a backwash of cummy saliva, many strings hanging from your [pc.multiCocks] like the lights on a chandelier.");
	}
	if (pc.hasSheath(kok)) output("\n\nFew lovers could pay attention to every intricacy presented by your crotch. Now it seems you’re just a game for her to play, with so many buttons to press and options to explore. Her latest target becomes the sheath of your [pc.cock " + kok + "]. A knowing scream builds in the back of your throat watching her hands move towards it, but you can’t hope to stop her fingers from digging into a space never meant to be explored. Bunny-fingers wiggle into the protective skin of your cock-scabbard, racing circuits (and sparking them) around the loop of animal flesh.");
	
	output("\n\nShifting to a squat, Roxy’s throat finishes stretching. Anxious hyperventilations cyclone around her [pc.skinFurScalesNoun]-twapping ears, followed by helpless congratulations for her dong-pleasing expertise. Her head rapidly flows from tip to [pc.base " + kok + "], always staying for a second to wiggle her snout into your navel.");
	if (pc.cockTotal() > 2) output(" Her hands are never far from your unsucked schlongs, making sure they stay as hot and compressed in her palms as if they were in a pussy, ass... or mouth.");
	else if (pc.cockTotal() > 1) output(" Her hands are never far from your unsucked schlong, making sure it stays as hot and compressed in her palms as if it were in a pussy, ass... or mouth.");
	
	output("\n\nSomehow, you’ll never know how, but she knows how to turn you into a virgin getting their first blowjob. Your mind fails to process the sensory overflow of");
	if (pc.balls > 0) output(" nut-");
	else output(" prostate-");
	output("clenching talent. Your [pc.legOrLegs] shake, the whole stadium feels like it’s coming down. The world as you know it is collapsing.");
	
	output("\n\n<i>Your dick is no longer yours.</i> It belongs to her.");
	if (pc.hasVagina()) output(" All it takes is a whimsical flick to [pc.oneClit] and your feminine release comes crashing up, damaging your balance further.");
	
	output("\n\nTwitching and fluttering in her collaring lips, you’re just a dildo she’s practicing her skills on. You break the unwritten rule, looking away, glad to see nobody’s come by yet (and hoping against hope it stays that way), and then your sight goes white in the midst of the loudest <i>schluck...</i>");
	output("\n\nA palm batters against your stomach; you look back down, and Roxy is glowering indignantly. She rears back, inhales one last time, and rams your prick down her throat");
	if (pc.hasKnot(kok)) output(", locking herself to your inflating knot");
	output(". A wordless and near silent scream (a desperate gasp) is all you can give. You don’t scream or moan as one might expect from receiving vigorous fellatio.");
	if (pc.balls > 0) output(" One overriding sensation surfaces through the others: a powerful, possessive vice-like press on your [pc.ballsNoun].");
	
	output("\n\nA split-second later, an enormous male orgasm drives through your cum-plumbing, racing towards Roxy’s gullet. Your loins vibrate like a malfunctioning machine. Visible lumps flow through your spunk-vein; climax explodes out of you.");
	
	if (pc.cumQ() >= 6000)
	{
		output("\n\nA time-dilating moment of reason sees you lean forward and brace yourself via Roxy’s ears, firming yourself for the oceanic tide of [pc.cumGem] virility launching through your [pc.cocksLight] like an enormous wave of city-destroying size. Liquid volume flows in belly-burrowing lumps, immediately straining her gut with [pc.cumFlavor] nut. Streamers of spooge flow out from her flared nostrils, wettening your abdomen in places the backwash can’t. The pressure of each subsequent shot pushes the last one further down, but the excess spills back up, choking he sperm-clogged laquine in the only fulfilling fightback your body has shown since this started.");
		if (pc.cockTotal() > 2) output(" Orgasm doesn’t end in Roxy’s belly, however. Your unsleeved dicks are bouncing to the pillars of [pc.cumColor] ejaculate geysering out, bukkakeing the opposite walls and the ceiling too with the strength of your enviable orgasm. The hallway serves as much an excellent reminder of your fountaining release as Roxy’s cum-plumped curves do!");
		else if (pc.cockTotal() > 1) output(" Orgasm doesn’t end in Roxy’s belly, however. Your unsleeved dick is bouncing to the pillars of [pc.cumColor] ejaculate geysering out, bukkakeing the opposite walls and the ceiling too with the strength of your enviable orgasm. The hallway serves as much an excellent reminder of your fountaining release as Roxy’s cum-plumped curves do!");
	}
	else if (pc.cumQ() >= 3000)
	{
		output("\n\nOrgasmic aches throb out curve-expanding columns of [pc.cum] in urethra-straining bulges of masculine majesty. [pc.CumGem] lances break against the spasming walls of Roxy’s seizing nervous system, and droplets leak form her nostrils like a faucet knob not fully turned off. [pc.CumNoun] chokes her while it spreads her gut into a suitable domicile, rounding it into the familiar shape of pregnancy. Spermy ejaculation lasts almost a minute, and it’s about the only fightback your body has, cramming her insides with a load that’d shame the boosted males of her race.");
		if (pc.cockTotal() > 2) output(" Molten ropes of spooge blast out from your unslotted [pc.cocksLight], urged out by her jacking palms. The strength of your cumshots reaches the opposite wall, and makes a hell of a mess across the floor.");
		if (pc.cockTotal() > 1) output(" Molten ropes of spooge blast out from your unslotted cock, urged out by her jacking palms. The strength of your cumshots reaches the opposite wall, and makes a hell of a mess across the floor.");
	}
	else if (pc.cumQ() >= 500)
	{
		output("\n\nFresh gouts of [pc.cumGem] semen burst loose into Roxy’s gurgling gut, your [pc.ballsNoun] churning out lassos of spermy [pc.cumNoun]. The sheer volume you’re pumping into the rabbit girl’s gullet rises back up to meet your tip, eventually receding into her unimaginably molten depths. She keeps your orgasm down, though the effort looks to have noticeably strained her, and her cum-filled gut has pushed out in an effort to house your belly-stuffing climax.");
		if (pc.cockTotal() > 1) output(" Stripes of body-jolting ejaculation shoot from your extra [pc.cocksLight], bukkakeing the floor and leaving a mess you sure as hell aren’t going to clean up.");
	}
	else
	{
		output("\n\nYour [pc.ballsNounIsAre] work hard to give Roxy her deserved reward. Her throat soothes your tender flesh, expressing warm, [pc.cumVisc] [pc.cumNoun] straight into her waiting belly. Modest spurts pump into the bunny girl, staying right where it needs to be. A distant part of you is mildly disappointed in it. Maybe you should invest in some virility mods, maybe you’ll see some of the seed spill out of her nose?");
		if (pc.cockTotal() > 2) output(" Until you make that decision, you’ll have to settle for the [pc.cumGem] lines your extra cocks contribute to her impromptu dyejob.");
		else if (pc.cockTotal() > 1) output(" Until you make that decision, you’ll have to settle for the [pc.cumGem] lines your extra cock contributes to her impromptu dyejob.");
	}
		
	output("\n\nBy the time your orgasm runs dry, Roxy slips off and you collapse into a tired, [pc.raceShort]-shaped heap of oscillating thought. <i>“Hey, at least you stayed on your feet!”</i> Roxy laughs, looking around. <i>“Fuck, you have no idea how hard my heart was beating,”</i> she laughs, wiping her face of a spunk stripe, leaning in. <i>“Had plenty idea what yours was like though.”</i>");
	output("\n\nShe kisses you on the cheek, grabs her bag, and stands. <i>“I’m outta here,”</i> she declares");
	if (pc.cockTotal() > 1) output(", patting her belly and looking around the cum-splattered corridor. <i>“I’m not cleaning this shit up!”</i>");
	else output(".");
	output("\n\nThe bun gets out of sight by the time you’re able to scramble to your feet");
	if (!pc.isCrotchExposed()) output(" and fix your clothes");
	output(". Panting against the wall, you collect yourself and");
	if (pc.hasTail()) output(" literally");
	output(" high-tail it out of here before anyone catches you, wondering if the stress was worth that kind of reward...");
	output("\n\nYeah. It fucking was.");
	
	processTime(10 + rand(10));
	IncrementFlag("ROXY_SEX");
	IncrementFlag("ROXY_BJ");
	pc.exhibitionism(1);
	roxy.loadInMouth(pc);
	pc.orgasm();
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}
//preg email
public function roxyPregEmail():String
{
	var cnt:int = roxyGetNumLitters();
	if (cnt >= 7) cnt = 1 + rand(6);
	var bcOver:Boolean = false;
	if (flags["ROXY_STERILEX_OVERRIDE"] == 1) bcOver = true;
	var eText:String = "";
	
	if (cnt == 0)
	{
		eText+= "Guess who’s pregnant thanks to you? Me!";
		eText+= "\n\nI’m excited [pc.name]! Course I’m not too thrilled that my doc said no more roller derbying for the next 6 months, but what are you gonna do? Oh and Charlie, our team leader, is pissed at you for this lol.";
		eText+= "\n\nSee you round Steele. Don’t go running off now that I’m knocked up, okay?";
		if (bcOver) eText+= "\n\n<i>Looks like you proved yourself superior to some shitty birth control. Nice.</i>";
	}
	else if (cnt == 1)
	{
		eText+= "Insert fanfare here, I’m pregnant again!";
		eText+= "\n\nAs usual, no more sports for the next 6 months, yadda yadda, Charlie is ready to snap you in half, yadda yadda.";
		eText+= "\n\nSee you round Steele. Don’t go running off now that I’m knocked up, okay?";
		if (bcOver) eText+= "\n\n<i>Looks like whatever contraceptive she was on wasn’t a match for your godlike virility!</i>";
	}	
	else if (cnt == 2)
	{
		eText+= "Yep, it’s Roxy! And soon there’ll be new Roxy Steeles! ";
		eText+= "\n\nYou shoulda seen Charlie’s face. He’s so pissed, I think I heard him tear a locker in half. That’s what happens when the best bunny gets benched by her stud :3";
		eText+= "\n\nSee you soon!";
		if (bcOver) eText+= "\n\n<i>Does she even remember you asked her to go on birth control? Ah well. It lost, and the two of you won.</i>";
	}	
	else if (cnt == 3)
	{
		eText+= "Steeeeele I’m pregnant again! At this rate you’re gonna flood the nursery.";
		eText+= "\n\nOh yeah, and my coach is angry. But he’s always mad. Not my fault he doesn’t help train someone else to replace the best bunny on the team :)";
		eText+= "\n\nCan’t wait to give these new boys and girls some names. Try to think of some, alright?";
		eText+= "\n\nAnd come see me! I love seeing u";
		if (bcOver) eText+= "\n\n<i>You wonder how many other people could beat birth control through sheer virility. Roxy deserves some credit too.</i>";
	}	
	else if (cnt == 4)
	{
		eText+= "fuck charlie’s here";
		eText+= "\n\nbtw im pregnat again, good work u virile slut!";
		eText+= "\n\nguess i don’t have room to talk though lolllll";
		if (bcOver) eText+= "\n\n<i>Hopefully her boss doesn’t find out you still got her pregnant on contraceptives. Otherwise he might get the good stuff!</i>";
	}	
	else if (cnt == 5)
	{
		eText+= "I’m pregnant, [pc.name]! But you’re not surprised I bet. You have no fucking idea how awesome you are. Come see me soon okay";
		eText+= "\n\nshit, coach is around, talk soon <3";
		if (bcOver) eText+= "\n\n<i>You have an idea of how awesome you are, considering you conquered her ovaries regardless of the birth control!</i>";
	}	
	else
	{
		eText+= "<i>There’s no message in this email, just an attached picture of Roxy’s tits. Some writing has been edited on the image, declaring that she is pregnant again (little hearts dot the i’s in the message) and some poorly drawn milk droplets coming from her onyx nipples. The little minx!</i";
		if (bcOver)eText+= "\n\n<i>Also, there’s something pointing to her abdomen, reading, <b>“What good is birth control anyway?”</b></i>";
	}	
	
	return doParse(eText);
}
//birth email
public function roxyBirthEmail():String
{
	var eText:String = "";
	var cnt:int = roxyGetNumLitters();
	
	if (cnt > 0)
	{
		eText+="I’m gonna go into labor again soon. All the pain is gonna be worth it when I see all my new sons and daughters!";
		eText+="\n\nOurs I mean please come be there I really need you!";
		eText+= "\n\nPlease";
		eText+= "\n\nI think it’s sta";
	}
	else
	{
		eText+="So like, I can go into labor any minute now as of writing this. I’m excited nervous thrilled terrified!!1";
		eText+="\n\nIt’s... I think it’s starting, but I’m not so sure. Anyway keeping this short like my other emails, but it’d mean a lot to me if you were here. When it happens. ";
		eText+= "\n\nPlease?";
	}
	
	return doParse(eText);
}
//preg move email
public function roxyPregMoveEmail():String
{
	var eText:String = "";
	var cnt:int = roxyGetNumLitters();
	
	if (cnt > 0)
	{
		if (rand(2) == 0)
		{
			eText+="Hey [pc.name], just letting you know I’m going to your nursery again -_-";
			eText+="\n\nMy gut’s so noisy and heavy, and i’m getting colder than usual. Can’t stand uveto sometimes.";
			eText+= "\n\nPlz come see me soon. Usual room.";
		}
		else
		{
			eText+="It’s me again [pc.name]. Fucking stomach is killing me, so I’m going to the nursery again.";
			eText+="\n\nBelly’s so heavy and hard to handle, and the cold is really getting to me. Uveto fucking sucks...";
			eText+= "\n\nYou don’t though... please come see me soon :)";
			eText+= "\n\nHugs kisses and laquine loveeeeee!";
		}
	}
	else
	{
		eText += "Yo [pc.name]. I’ve entered the second trimester of my pregnancy, so I’m gonna move into the nursery on Tavros. So don’t freak out if you can’t find me on Uveto.";
		eText += "\n\nI’ll be in the temp housing according to Briget. She’s nice.";
		eText += "\n\nHope you visit me.";
	}
	
	return doParse(eText);
}
//missed birth email
public function roxyMissedBirthEmail():String
{
	var eText:String = "";
	var kidsMale:int = 0;
	var kidsFemale:int = 0;
	var kidsHerm:int = 0;
	var kidsTotal:int = 0;
	var cap:Boolean = true;
	
	if (flags["ROXY_BIRTH_SCENE_BOYS"] != undefined) kidsMale = flags["ROXY_BIRTH_SCENE_BOYS"];
	if (flags["ROXY_BIRTH_SCENE_GIRLS"] != undefined) kidsFemale = flags["ROXY_BIRTH_SCENE_GIRLS"];
	if (flags["ROXY_BIRTH_SCENE_HERMS"] != undefined) kidsHerm = flags["ROXY_BIRTH_SCENE_HERMS"];
	kidsTotal = kidsMale + kidsFemale + kidsHerm;
		
	eText+="Too bad you missed the babie’s births. I get it, it was gross tbh. And painful. And I’m a huge bitch when I’m in pain like that. But it was worth it, fuck, it was worth all of it!";
	eText += "\n\nWe, as a team, brought in " + num2Text(kidsTotal) + " kids. ";
	if (kidsMale > 0)
	{
		eText += num2Text(kidsMale, cap) + " boys";
		cap = false;
	}
	if (kidsFemale > 0)
	{
		if (!cap)
		{
			eText += ", ";
			if (kidsHerm <= 0) eText += "and ";
		}
		eText += num2Text(kidsFemale, cap) + " girls";
		cap = false;
	}
	if (kidsHerm > 0)
	{
		if (!cap)
		{
			if (kidsFemale > 0 && kidsMale > 0)	eText += ", and ";
			else eText += " and ";
		}
		eText += num2Text(kidsHerm, cap) + " hermaphrodites";
	}	
	eText += ". Look, most of ‘em got " + flags["ROXY_BIRTH_SCENE_FURCOLOR1"] +" fur! Nice going, " + pc.mf("dad","<i>mom</i>") + "!"
	eText+= "\n\n<i>Attached is a photo of a smiling, but definitely tired Roxy holding your newborns wrapped in homemade blankets. Your chest swells with pride!";
	eText+= "\n\nGotta go meet ‘em soon!</i>";
	
	return doParse(eText);
}
//determine preg email subject, do in order then randomize after all shown once
public function roxyPregEmailSubject():String
{
	var cnt:int = roxyGetNumLitters();
	var subj:String = "Pregnant!!";
	
	if (cnt >= 7) cnt = 2 + rand(5);
	
	if (cnt == 0) subj = "Pregnant!!";
	else if (cnt == 1) subj = "Pregnant!!";
	else if (cnt == 2) subj = "Guess what!";
	else if (cnt == 3) subj = "u know what this is!";
	else if (cnt == 4) subj = "HEY!";
	else if (cnt == 5) subj = "SURPRIIIISEEE well not really";
	else if (cnt == 6)subj = "Heyyyy studddd";

	return subj;
}
//determine birth email subject
public function roxyBirthEmailSubject():String
{
	var cnt:int = roxyGetNumLitters();
	var subj:String = "Any time now!!";
	
	if (cnt > 0) subj = "More kiddos!";

	return subj;
}
//determine preg move email subject
public function roxyPregMoveEmailSubject():String
{
	var cnt:int = roxyGetNumLitters();
	var subj:String = "Moving";
	
	if (cnt > 0) subj = "Moving again";
	
	return subj;
}
public function roxyBirthScene():Boolean
{	
	clearOutput();
	showBriget(false);
	author("SheepPun & William");
	var readEmail:Boolean = MailManager.isEntryViewed("roxy_birth");
	
	output("Head nurse Briget is standing in front of her desk expectantly, mechanical features spinning into alertness when she spots you.");
	if (readEmail)
	{
		output("\n\n<i>“Good timing, [pc.name], I’ve-”</i>");
		output("\n\nYou raise your hand and meet her sight, eyebrows narrowing. <i>“Just take me to Roxy,”</i> you say, and she nods without another word. Though, to be honest, you don’t think you’ll need a guide, what with the storm being cursed up in the distance.");
	}
	else
	{
		output("\n\n<i>“Good timing, [pc.name]. I’ve been waiting for you -- you’ll be happy to know that Mrs. Aiken is due to deliver. She’s gone into labor, and told me to expect you.”</i>");
		output("\n\nWoah, really!? Maybe you should have checked that email more thoroughly, you didn’t think she’d be giving birth! As flat as a brick you blurt out, <i>“Take me to Roxy!”</i> and the gynoid nods her head smoothly.");
		output("\n\n<i>“Right this way.”</i>");
		output("\n\nYou almost run ahead. That distant cursing can’t be missed!");
	}
	
	processTime(2);
	roxyBirth(GetGameTimestamp());
	clearMenu();
	addButton(0, "Next", roxyBirthSceneNext, undefined);
	return true;
}
public function roxyBirthSceneNext():void
{	
	clearOutput();
	showRoxy(false, true);
	var steeleHadKid:Boolean = false;
	if (StatTracking.getStat("pregnancy/total births") > 0) steeleHadKid = true;
	var kidsMale:int = 0;
	var kidsFemale:int = 0;
	var kidsHerm:int = 0;
	var kidsTotal:int = 0;
	var firstLitter:Boolean = true;
	if (roxyGetNumLitters() > 1) firstLitter = false;
	
	if (flags["ROXY_BIRTH_SCENE_BOYS"] != undefined) kidsMale = flags["ROXY_BIRTH_SCENE_BOYS"];
	if (flags["ROXY_BIRTH_SCENE_GIRLS"] != undefined) kidsFemale = flags["ROXY_BIRTH_SCENE_GIRLS"];
	if (flags["ROXY_BIRTH_SCENE_HERMS"] != undefined) kidsHerm = flags["ROXY_BIRTH_SCENE_HERMS"];
	kidsTotal = kidsMale + kidsFemale + kidsHerm;

	output("Roxy’s booming voice is bouncing off every wall of the upstairs corridor. Her belabored screams are following its trail. You make your way to the delivery room, finding your derby-playing bun on her back in bed, refusing something in one of the staff’s hands. <i>“Fuck that! I’m not getting knocked out for this. It fucking hurts, but it’s not fucking worth it! And [pc.name] will be here soon anyway!”</i>");
	output("\n\nSpeaking of! You press into the room, Briget moving quickly to the laquine’s bedside.");
	output("\n\n<i>“[pc.name]!”</i> she cries. <i>“Fuck, you’re here, finally! My water broke and-”</i>");
	output("\n\nStill as silent as a stone, you take up position right near your litter-bearing rabbit and reach for her arm. Her paw snaps shut like a handcuff to your wrist, all her fingers pressing like a vice into your palm. Roxy’s death grip is squeezing so tight that you swear she’s trying to shatter your bones!");
	if (steeleHadKid) output(" She can’t be blamed, though. Being in labor is one of the worst pains a living being can ever experience, and you know that first hand.");
	else output(" Hopefully it gets easier as it goes on, these first steps are always the hardest to endure.");
	output(" <i>“Don’t let go, just hold tight!”</i> she says.");
	
	output("\n\nOne of the nurses relays that birthing is about to begin, calmly reminding you that Roxy has been carrying a litter of no less than " + num2Text(kidsTotal) + " children.");
	if (kidsTotal >= 6)
	{
		output(" She’s got a full house");
		if (kidsTotal < 8 ) output(" almost");
		output("!");
	}
	output(" Your laquine’s hyperventilating grunts cease for a precious moment when she grabs you by the jaw and kisses you too forcefully for it to be enjoyable. <i>“I’m- glad- ffffuck... you’re here!”</i>");
	
	output("\n\nLegs spread, her agony intensifies, and you watch the juncture between her thighs closely. You don’t doubt she’s on some painkillers, but they certainly don’t seem to be doing any good here. Even for a laquine, an alien race capable of handling so many children, this isn’t an easy process. Would that it could be a more arousing and less grotesque one...");
	output("\n\nStill, what you’re both waiting on is worth every second of this suffering.");
	if (pc.isBimbo()) output("\n\n<i>“Push push push!”</i> you sing to her.");
	else if (pc.isBro()) output("\n\n<i>“Push harder!”</i> you shout at her.");
	else if (pc.isNice()) output("\n\n<i>“You’re fine. I’m here! Just push!”</i> you reassure her.");
	else if (pc.isMischievous()) output("\n\n<i>“C’mon, push ‘em all out, where’s the bunny-babe I know?”</i> you laugh at her.");
	else output("\n\n<i>“Unless you’re gonna beg for anesthetic, push!”</i> you grin at her.");
	
	output("\n\nThe sporty bun screams. You have to hold her hand with both of yours, because she’s gripping so tight now that you are very worried she might break your wrist!");
	output("\n\nHowever, more important than your momentary woe, the very first of your rabbit-eared kids is entering the universe! Two ears jut out from Roxy’s vagina, followed by a spill of amniotic fluids, each contraction bringing the first floppy munchkin closer to the light. Colorful towels are laid out all throughout the space, and the medical professionals are standing by for delivery.");
	output("\n\nYour first child slips out of her widespread labia, too covered in gore for you to make out much. He or she is quickly wrapped in a blanket and cleaned. Your voice ends up joining the chorus of ‘push, push’, but you’re not saying anything, only giving tiny squeals of happiness. It happens automatically! There’s an added thump in your heart, like an extra weight that comes from the seconds your children exist. <i>You can’t wait to hold them.</i>");
	
	if (firstLitter)
	{
		output("\n\nAnother kiddo is admitted to the increasingly dirtied nexus of Roxy’s nethers. Then another half-laquine emerges, closely following the second pair of ears. It makes you laugh, but you think she hurts you just a bit more for deriving humor in it. Three have been born so far, and her belly is beginning to deflate. How many more will she have? That question, among others, dominates your synapses.");
		if (kidsTotal >= 7)
		{
			output("\n\nEven though the staff told you how many kids Roxy was going to have, it still throws you for a loop seeing it all happen. Four kids, five kids, they flop out into the waiting arms of your retainers, expressed away for quick health checks. The sixth gets stuck for a few seconds too long, Roxy driving herself to tears just to push it out. Her once prominent gut is receding into taut muscle again, but there’s still one coming down the line... seven kids!");
			if (kidsTotal >= 8) output(" Your eyes cross and your whole [pc.arm] goes numb from her painful treatment, but an eighth and final newborn is brought into the galaxy, ending Roxy’s pregnancy!");
			else output(" That seems to be it... her breathing stabilizes, and her pregnancy comes to an end.");
		}
		else if (kidsTotal >= 6) output("\n\nIt’s almost impossible to contain your excitement when you see one bunny more come out, then another... and a sixth! There’s a sixth! You have to hold Roxy’s leg and pull it back so she doesn’t crush the poor thing out of reflex! That said, it seems to be over, and she’s given birth to two sets of triplets!");
		else if (kidsTotal >= 5) output("\n\nFrom the bulge in her tummy, you’d say that two bunnies vying for space to be born. Indeed it’s true, as they are both born within a second of each other. Afterward, her abdomen recedes, the pain of birthing compressing away.");
		else output("\n\nIn some small way you find it disappointing that Roxy’s pregnancy ends at the fourth birth, her stomach finally relieved of its mewling payload.");
	}
	else
	{
		output("\n\nInto the amniotic-washed nexus between Roxy’s nethers a second, gore-covered child is deposited, wrapped and taken for a brief health check and quick clean.");
		if (kidsTotal >= 7)
		{
			output("\n\nEven though the staff told you how many kids Roxy was going to have, the passage of time and their bodies throws you for a loop all over again. Two kids, three kids, they flop out into the waiting arms of your retainers, expressed away for genial purpose. Roxy is in tears, crying her heart out now as four and five make their way into the galaxy. You clutch her paw tight -- there goes the sixth! Her once prominent gut is receding into taut muscle again, but there’s still one coming down the line... seven kids!");
			if (kidsTotal >= 8) output(" Your eyes cross and your whole [pc.arm] goes numb from her painful treatment, but an eighth and final newborn is brought into the galaxy, ending Roxy’s pregnancy!");
			else output(" That seems to be it... her breathing stabilizes, and her pregnancy comes to an end.");
		}
		else if (kidsTotal >= 6) output("\n\nIt’s almost impossible to contain your excitement when you see one bunny more come out, then another...! Four... five... six! Somehow for Roxy, passing six half-laquines was easy! Her abdomen deflates into its natural state, ending her labor.");
		else if (kidsTotal >= 5) output("\n\nFrom the bulging in her tummy, you’d say that two bunnies vying for space to be born. Indeed it’s true, as they are both born within a second of each other. Three so far, and still more coming! Four, then five! Afterwards, her belly recedes, the suffering compressing away.");
		else if (kidsTotal >= 4) output("\n\nChild after child flops out of Roxy’s dirtied canal, two, three, and finally a fourth. When her quintuplets have been birthed, her tummy recedes into natural, muscly flatness, signaling the end of her labor.");
		else if (kidsTotal >= 3) output("\n\nYour laquine lover’s stomach flattens out with the birth of a second, and completely compresses as a third and final bulge makes its way through her dirtied tunnel, bringing her pregnancy to its close.");
		else output(" You’re left feeling genuinely disappointed that her pregnancy ends so abruptly, having given birth to twins!");
	}
	
	output("\n\n<i>“Oh my... fuck fuck aaahahhhh...”</i> Roxy pants, chest heaving against her simple shirt. <i>“Ffffff it hurts, it feels so... empty now...”</i> Gods, she looks like she’s about to cry!");
	output("\n\nThere’s only one thing you can do now: hug her!");
	output("\n\n<i>“Woah!”</i> she gasps when you cradle her to your [pc.chestNoun], telling her how proud you are to share this moment. <i>“F-Fuck! [pc.name], stop that, at least wait until we, you know...”</i>");
	output("\n\n<i>“Here you go, dears.”</i> You both look up to see Briget and the staff, holding your babies. <i>“Congratulations Roxy, [pc.name]. You’ve made " + num2Text(kidsTotal) + " miracles possible.");
	if (kidsTotal == 2) 
	{
		if (kidsMale == 2) output(" Two boys have been safely born.");
		else if (kidsFemale == 2) output(" Two girls have been safely born.");
		else if (kidsHerm == 2) output(" Two hermaphrodites have been safely born.");
		else if (kidsMale == 1 && kidsFemale == 1) output(" One boy and one girl have been safely born.");
		else if (kidsMale == 1 && kidsHerm == 1) output(" One boy and one hermaphrodite have been safely born.");
		else if (kidsFemale == 1 && kidsHerm == 1) output(" One girl and one hermaphrodite have been safely born.");
		else output(" Two kids have been safely born.");
	}
	else if (kidsMale == 1 && kidsFemale == 1 && kidsHerm == 1 ) output(" You’ve given safe birth to one healthy boy, one beautiful girl, and one special child with a little of both.");
	else
	{
		output(" Your litter of ");
		if (kidsMale > 0) output(num2Text(kidsMale) + " sons");
		
		if (kidsFemale > 0)
		{
			if (kidsMale > 0 && kidsHerm > 0) output(", ");
			else if (kidsMale > 0) output(" and ");
			output(num2Text(kidsFemale) + " daughters");
		}
		
		if (kidsHerm > 0)
		{
			if (kidsMale > 0 && kidsFemale > 0) output(", ");
			if (kidsMale > 0 || kidsFemale > 0) output(" and ");
			output(num2Text(kidsHerm) + " hermaphrodites");
		}
		output(" has been born successfully and with no complications.");
	}
	output("”</i>");
	if (flags["ROXY_BIRTH_SCENE_EYECOLOR1"] == pc.eyeColor || flags["ROXY_BIRTH_SCENE_EYECOLOR2"] == pc.eyeColor) output(" <i>“I think they have your " + pc.eyeColor + " eyes, [pc.name],”</i> she winks, smile broadening.");
	output("\n\n<i>“Please! Give them here..!”</i> Roxy ecstatically extends her arms, and");
	if (kidsTotal == 2) output(" the two");
	else output(" all of the");
	output(" wiped-down bundles of fuzzy, mewling joy are gently cradled to her perspiring breast. <i>“Omigosh...”</i>");
	
	output("\n\nTears are flowing down the jock-bunny’s face as she strokes one of their cheeks. She falls back into her pillows, clutching them all with protective maternal instinct. For your part, you’re just stunned. Feelings of paternal pride well up within you like a building geyser, and when its pressure releases, you finally lean forward to take one of them into your [pc.hands], to finally touch that shivering beacon of light you made possible with her.");
	output("\n\n<i>“[pc.name], [pc.name], [pc.name]...”</i> Roxy sobs. <i>“They’re sooo cute! I... Ughh, I can’t believe this!");
	if (firstLitter) output(" They’re the best, they’re just the best! We’re the best!!”</i>");
	else output(" Look at what we’ve done again, and it’s... it’s just as beautiful as before! We’re the best...! Look at our children!”</i>");
	
	output("\n\n<i>Would you like a picture?</i> asks one of the staff. When the wires connect in your mind you just about toss your codex into the tiny hands of your cute aide. You lean in close to Roxy, matching her big, dopey grin, holding");
	if (kidsTotal == 2) output(" one");
	else output(" some");
	output(" of your tykes and facing the staff. After a mechanical chime, she hands your gadget back, an ultra high resolution image of you and Roxy together on the bed, smiling with your children.");
	
	if (!pc.hasKeyItem("Picture of Roxy and Newborns")) pc.createKeyItem("Picture of Roxy and Newborns", 0, 0, 0, 0, "A picture of you and Roxy holding your newborn bunny kids.");
	
	output("\n\n<i>“Send me a copy of that,”</i> she says, nuzzling your cheek. <i>“I better get them fed...”</i>");
	output("\n\nThe staff have long since cleared out, giving you a magical and silent period to enjoy just about... everything going on here. Roxy rips her shirt out of the way, her milk-fattened boobs practically sloshing against her spry chest. After seating the neonate buns in her lap, she guides them two at a time to her teats with your help. They suckle almost the same amount of times, drawing out creamy nourishment. ");
	output("\n\nIt’s muted enough that you can hear their gulps, their inhalations, even the twitches of their whiskery noses. You count down the amount of times their little cheeks hollow and pull. When they’re done feeding, when they’ve fallen into a long nap, she hands them to you");
	if (kidsTotal >=4) output(" and moves on to the next pair.");
	else if (kidsTotal == 3)output(" and moves on to the next bun.");
	else output(" and lets out a sigh.");
		
	processTime(60 + ((rand(10) + 5) * kidsTotal));
	clearMenu();
	if (firstLitter)
	{
		output("\n\n<i>“Hey... so, [pc.name]... we’ve got " + num2Text(kidsTotal) + " kids... what do we name them? I can’t think straight right now and I want this to be special...”</i>");
		output("\n\nLooking at your bunny babies, you put the proverbial thinking cap on, leaning back, and looking them over individually...");
		addButton(0, "Enter Name", roxyNameYourLilBuns, 0);
	}
	else
	{		
		output("\n\n<i>“Mmmm... I’ll give them names later...”</i>");
		output("\n\n<i>“Gosh... that was rough...”</i>");
		output(" Roxy huffs, dozing off with her litter close to her breast, fast asleep, making the cutest noises. <i>“Well... I guess you gotta go..? I’m gonna be in bed for a few days, and then I guess it’s up to the nursery... theeen back to Uveeeetoooo...”</i>");
		output("\n\nYou can stay just a bit longer. After hopping into bed with her, propped up on your elbow, you let her know that you’ll make the time. The only difficulty now is focusing on Roxy and your children.");

		processTime(10);
		addButton(0, "Next", roxyBirthSceneNext2, undefined);
	}	
}

public function roxyNameYourLilBuns(kiddo:int = 0):void
{
	clearOutput();
	showRoxy(false, true);
	clearMenu();
	
	var children:Array = listBabiesOfParent("Roxy");
	var child:UniqueChild;
	var c:UniqueChild;
	if (kiddo < 0) kiddo = 0;
	
	if (children != null && children.length > 0)
	{
		child = children[0];
		if (kiddo < children.length)
		{
			c = children[kiddo] as UniqueChild;
			
			output("\n\nRoxy presents one of your");
			if (c.NumMale > 0)
			{
				output(" sons. His eyes are shut tight, but you bet he has " + c.eyeColor + " eyes. He also has " + c.furColor + " fur. What would you like to name him?");
				flags["ROXY_KID_SEX"][kiddo] = "M";
			}
			else if (c.NumFemale > 0)
			{
				output(" daughters. Her eyes are shut tight, but you bet she has " + c.eyeColor + " eyes. She also has " + c.furColor + " fur. What would you like to name her?");
				flags["ROXY_KID_SEX"][kiddo] = "F";
			}
			else
			{
				output(" hermaphrodite children. Her eyes are shut tight, but you bet she has " + c.eyeColor + " eyes. She also has " + c.furColor + " fur. What would you like to name her?");
				flags["ROXY_KID_SEX"][kiddo] = "H";
			}
			displayInput();
			userInterface.textInput.text = "";
			userInterface.textInput.maxChars = 20;
			output("\n\n\n");
			addButton(0, "Next", roxyNameYourLilBunsCheckName, kiddo);
		}
		else
		{
			//now that we have the names lets update them all
			for(var i:int = 0; i < children.length; i++)
			{
				c = children[i] as UniqueChild;
				c.Name = flags["ROXY_KID_NAME"][i];
			}
			output("<i>“Hehe... I like it... oh man, I can’t wait til they can walk...”</i>");
			output(" Roxy huffs, dozing off with her litter close to her breast, fast asleep, making the cutest noises. <i>“Well... I guess you gotta go..? I’m gonna be in bed for a few days, and then I guess it’s up to the nursery... theeen back to Uveeeetoooo...”</i>");
			output("\n\nYou can stay just a bit longer. After hopping into bed with her, propped up on your elbow, you let her know that you’ll make the time. The only difficulty now is focusing on Roxy and your children.");

			processTime(10);
			addButton(0, "Next", roxyBirthSceneNext2, true);
		}
	}
}
public function roxyNameYourLilBunsIllegalInput(kiddo:int = 0):void
{
	clearOutput();
	showRoxy(false, true);
	
	output("<b>Illegal input. Try again.</b>");
	
	removeInput();
	clearMenu();
	addButton(0, "Enter Name", roxyNameYourLilBuns, kiddo);
}
public function roxyNameYourLilBunsBadName(kiddo:int = 0):void
{
	clearOutput();
	showRoxy(false, true);
	
	output("<i>“[pc.name]... the hell are you on? Think of something normal, you weirdo.”</i>");
	
	removeInput();
	clearMenu();
	addButton(0, "Enter Name", roxyNameYourLilBuns, kiddo);
}
public function roxyNameYourLilBunsGoodName(kiddo:int = 0, name:String = ""):void
{
	clearOutput();
	showRoxy(false, true);
	
	flags["ROXY_KID_NAME"][kiddo] = name;
	removeInput();
	clearMenu();

	if (kiddo + 1 >= flags["ROXY_KID_FL_SIZE"])
	{
		output("<i>“I like that...”</i>");
		addButton(0, "Next", roxyNameYourLilBuns, ++kiddo);
	}
	else
	{
		output("<i>“I like that... how about this one?”</i>");
		addButton(0, "Enter Name", roxyNameYourLilBuns, ++kiddo);
	}
}
public function roxyNameYourLilBunsNameOK(name:String = ""):Boolean
{
	name = name.toLowerCase();
	if (name == "fuck") return false;
	if (name == "tit") return false;
	if (name == "bitch") return false;
	if (name == "ass") return false;
	if (name == "slut") return false;
	if (name == "whore") return false;
	if (name == "butt") return false;
	if (name == "dick") return false;
	if (name == "piss") return false;
	if (name == "shit") return false;
	if (name == "cock") return false;
	if (name == "cunt") return false;
	if (name == "cum") return false;
	if (name == "pussy") return false;
	if (name == "wank") return false;
	if (name == "faggot") return false;
	if (name == "asshole") return false;
	if (name == "dickhead") return false;
	if (name == "buttslut") return false;
	
	return true;
}
//just a passthrough function but I think this is cleaner and easier to maintain than having roxyNameYourLilBuns self reference itself and having a bunch of branching if statements cluttering it up
public function roxyNameYourLilBunsCheckName(kiddo:int = 0):void
{
	if (hasIllegalInput(userInterface.textInput.text)) roxyNameYourLilBunsIllegalInput(kiddo);
	else if (!roxyNameYourLilBunsNameOK(userInterface.textInput.text)) roxyNameYourLilBunsBadName(kiddo);
	else roxyNameYourLilBunsGoodName(kiddo, userInterface.textInput.text);
}

public function roxyBirthSceneNext2(firstLitter:Boolean = false):void
{	
	clearOutput();
	showRoxy(false, true);
	
	output("<i>“They’re all settled in then? I’ll be coming around every week. You know, unless I need to live here again.”</i>");
	output("\n\n<i>“Correct,”</i> Briget responds, handing Roxy digipad to sign. <i>“Your name, please.”</i>");
	output("\n\nAfter dotting the i in her last name, the laquine returns the pad and grabs her stuff. <i>“Well, [pc.name], I gotta get back to Uveto. You’ll know where to find me if you wanna talk or fuck,”</i> she grins. <i>“Man, feels so much better being over the pregnancy. Being in bed for days on end just sucks ass. I could use a game or two...”</i>");
	output("\n\nWhile you escort Roxy to the elevator, you tell her to take it easy at the very least.");
	output("\n\n<i>“Fuck that, way too young to be rocking in a chair all day.”</i> She laughs, smacking her fist to your shoulder. <i>“Anyway, I’ll be coming out weekly. Don’t worry, I’m making coach Charlie pay for that.");
	if (firstLitter && roxyGetKidName(0, "FH") != "") output(" You keep an eye on " + roxyGetKidName(0, "FH") + ", I think " + (roxyGetKidSex(0) == "M" ? "he" : "she") + "’s gonna be the most stubborn of the litter!”</i>");
	else output("\n\nKeep an eye on those kids, I think they all had a bit too much of me in ‘em.”</i>");
	output("\n\nYou slap her ass and she whips around, hopping up and falling on you in a hug that nearly smashes you into the floor. <i>“You fucking take care of yourself, alright? I don’t want to be a single parent. And come by soon, kay?”</i>");
	output("\n\n<i>Kiss.</i> She parts from you, bounding into the elevator and waving you off with two fingers. <i>“See ya, [pc.name]. Love you!”</i> she makes a heart gesture with her hands.");
	output("\n\nThe doors shut, and you’re left alone in the nursery entrance.");
	output("\n\nLooking back on it, those were hard days, and the exhaustion sort of creeps on you. You exhale and look out the window, watching the elevator carrying your laquine to the next ship off station, thinking about what to do next.");
	output("\n\n<i>It’ll be awhile before they’re jumping all over the place,</i> you mutter to yourself.");
	output("\n\nBetter get ready for that day...");
	
	processTime(240 + rand(60));
	restHeal();
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}
//-1 returns random name else name correspondeding to kid number
//sex "" = any, M = male, F = female, H = herm, FH female or herm
public function roxyGetKidName(kid:int = -1, sex:String = ""):String
{
	var kidName:String = "";
	var numKids:int = 0;
	if (flags["ROXY_KID_FL_SIZE"] != undefined) numKids = flags["ROXY_KID_FL_SIZE"];
	var sel:Array = [];
	var len:int;
	var rn:int;
	
	if (kid >= 0 && kid < numKids) kidName = flags["ROXY_KID_NAME"][kid];
	else
	{
		for(var i:int = 0; i < numKids; i++)
		{
			if (sex == "") sel.push(flags["ROXY_KID_NAME"][i]);
			else if (sex == "FH" && (flags["ROXY_KID_SEX"][i] == "F" || flags["ROXY_KID_NAME"][i] == "H")) sel.push(flags["ROXY_KID_NAME"][i]);
			else if (sex == "H" && flags["ROXY_KID_SEX"][i] == "H") sel.push(flags["ROXY_KID_NAME"][i]);
			else if (sex == "F" && flags["ROXY_KID_SEX"][i] == "F") sel.push(flags["ROXY_KID_NAME"][i]);
			else if (sex == "M" && flags["ROXY_KID_SEX"][i] == "M") sel.push(flags["ROXY_KID_NAME"][i]);
		}
		
		len = sel.length;
		
		if (len > 0)
		{
			rn = rand(len);
			kidName = sel [rn];
		}
	}

	return kidName;
}
//-1 returns random sex else sex correspondeding to kid number
public function roxyGetKidSex(kid:int = -1):String
{
	var sex:String = "";
	var numKids:int = 0;
	if (flags["ROXY_KID_FL_SIZE"] != undefined) numKids = flags["ROXY_KID_FL_SIZE"];
	var rn:int;
	
	if (kid >= 0 && kid < numKids) sex = flags["ROXY_KID_SEX"][kid];
	else
	{				
		if (numKids > 0)
		{
			rn = rand(numKids);
			sex = flags["ROXY_KID_SEX"][rn];
		}
	}

	return sex;
}
//create collar mark status
public function setRoxyStyleCollarMark():void
{
	var time:int = 2 * 24 * 60;
	var desc:String;
	
	desc = "A bright red loop of collar-tenderized skin is visible on your neck";
	if (pc.hasFur()) desc += " below your fur";
	desc += ", proof of Roxy’s lasting";
	if (silly) desc += " snu-snu.";
	else desc += " domination.";
	
	if (pc.hasStatusEffect("Roxy Style Collar Mark")) pc.setStatusMinutes("Roxy Style Collar Mark", time);
	else pc.createStatusEffect("Roxy Style Collar Mark", 0, 0, 0, 0, false, "Icon_Crying", desc, false, time,0xFF0000);
}
public function roxyCurrentLocation():String
{
	var loc:String = "Unknown";
	
	if (roxyIsInStadium()) loc = "Stadium";
	else if (roxyIsInNursery())
	{
		if (roxyIsInCafeteria()) loc = "Nursery Cafeteria";
		else if (roxyIsInTempHousing()) loc = "Nursery Spare Apts";
		else if (roxyIsExercising()) loc = "Nursery Common Area";
		else if (flags["ROXY_BIRTH_SCENE"] == 1) loc = "Nursery Natal Unit";
	}
	else if (roxyIsVisitingKids()) loc = "Nursery Visiting";
	
	return loc;
}
public function roxyIsVisitingKids():Boolean
{
	if (roxyIsInNursery()) return false;
	if (roxyGetNumLitters() > 0)
	{
		var visitCycle:int = Math.round((days - flags["ROXY_FIRST_KIDS_DAY"]) % 7);
		if (visitCycle == 6 && (hours >= 8 && hours < 20)) return true;
		else
		{			
			flags["ROXY_RE_VISIT"] = 0;
			flags["ROXY_RE_DONE"] = 0;
		}
	}
	
	return false;
}
// Put her room on second floor of Nursery
public function roxyInSpareAptBonus(btnSlot:int = 0):String
{
	var bonusText:String = "";
	
	bonusText += "\n\nRoxy’s apartment is clearly marked by a holo-tag above the keypanel. The door is unlocked, so you could enter at any time.";
	
	if (roxyCuddleRefused()) addDisabledButton(btnSlot, "Roxy", "Roxy", "Roxy is not available right now.");
	else if (roxyIsInTempHousing()) addButton(btnSlot, "Roxy", roxySpareAptGreet, undefined, "Roxy", "Pay Roxy a visit.");
	else addDisabledButton(btnSlot, "Roxy", "Roxy", "Roxy is not in her room currently.");
	
	return bonusText;
}

public function roxySpareAptGreet():void
{
	clearOutput();
	showRoxy(false, true);
	
	if (rand(4) == 0 && roxyCanTriggerCuddleEvent()) roxySpareAptCuddle();
	else
	{
		if (roxyIsAsleep()) output("Roxy is fast asleep, curled up in sheets that could keep someone toasty in the direst of winters. The quiet hums of flying cars and civilian-shunting turbolifts can be heard at varying distances beyond the comfy enclosure of this room’s walls - white noise thrums that soothe you into a half-fugue state. Just standing here in near darkness makes you want to fall asleep. How fortunate that your bedded bun has plenty of room to spare.");
		else
		{
			if (roxyGetNumLitters() > 0) output("You find Roxy knitting alone in <i>that</i> spot. She seems a lot more relaxed than she was during her first stay at the nursery. The lighting is cozy and inviting, and your pregnant bun looks to be more than satisfied, having adapted well to her peaceful surroundings. That smug smile you know her for is flashed your way when her radar-like ears zero in on you. <i>“Hey, about time you showed up!”</i>");
			else
			{
				output("The space given to your pregnant lover isn’t lavish, but it is most assuredly a cozy one. Fresh-scented wood floors end at conservatively designed walls. A few soundproof windows with fancy blinders look out into Tavros at large -- currently, they’re shut. In a comfy chair you see Roxy, two needles in either hand. She’s knitting, occasionally grimacing from a random tummy ache.");
				output("\n\nHer radar-like ears zone in on you and she gives you a relieved smile. <i>“Hey, [pc.name]... what’s up?”</i>");
				output("\n\nWhile it’s quiet and homely here, she seems a bit on edge.");
			}
		}	
		processTime(1);
		clearMenu();
		if (roxyIsAsleep())
		{
			addDisabledButton(0, "Roxy", "Roxy", "Roxy is asleep.");
			addButton(1, "Sleep With", roxySpareAptSleepWith, true, "Sleep With", "Slide into bed as the big spoon, and keep your bun safe and secure for the night.");
		}
		else
		{
			addButton(0, "Roxy", roxySpareAptMainMenu, undefined, "Roxy", "Chat with Roxy");
			if (hours >= 19 && hours <= 20) addButton(1, "Sleep With", roxySpareAptSleepWith, false, "Sleep With", "Slide into bed as the big spoon, and keep your bun safe and secure for the night.");
			else addDisabledButton(1, "Sleep With", "Sleep With", "It isn’t Roxy’s bedtime yet.");
		}
		addButton(14, "Leave", mainGameMenu);
	}
}
public function roxySpareAptMainMenu(skip:Boolean=false):void
{
	clearOutput();
	showRoxy(false, true);
	
	if (skip) output("Roxy gives you the inquisitive eye, waiting to hear more.");
	else
	{
		if (roxyGetNumLitters() > 0)
		{
			output("<i>“Oh there you are again, [pc.name],”</i> Roxy grins. <i>“Yeah, I’m not one for unpacking, but believe me, I’m settled in. The near-silence is kind of addicting in its own way. Like a vacation!”</i>");
			output("\n\nShe knits away while you take a seat across from her, finding yourself becoming addicted to her continued presence. Who knew having a bun close this often was so therapeutic?");
		}
		else
		{
			output("<i>“Hey, [pc.name]. Glad to see you. Just got settled in... nevermind the unopened boxes. Nice place you’ve got here. Kinda forgot what it was like to live somewhere quiet.”</i>");
			output("\n\nYou take a seat across from her, wondering if you’ve anything to articulate. But, then again, just being in her gravid presence is enough, strangely...");
		}
	}
	processTime(1);
	clearMenu();
	addButton(0, "Appearance", roxyAppearance, undefined, "Appearance", "Get a good look at the bouncy bunny.");
	addButton(1, "Talk", roxySpareAptTalk, false, "Talk", "See what’s on Roxy’s mind.");
	if (!pc.hasCock()) addDisabledButton(2,"Sex","Sex","You don’t have a dick, and therefore forfeit your right to please the pregnant bun.");
	else if (pc.isTaur()) addDisabledButton(2, "Sex", "Sex", "You are a taur, and therefore forfeit your right to please the pregnant bun.");
	else if (pc.cockThatFits(roxy.vaginalCapacity(0)) >= 0) addButton(2, "Sex", roxySpareAptSex, undefined, "Sex", "Although pregnant, Roxy’s need for relief has not diminished in the slightest. Where she goes, you’re inclined to follow that trail of pheromones...");
	else addDisabledButton(2, "Sex", "Sex", "You can’t fuck Roxy here with your size! Even laquines have their limits!");
	addButton(3, "Intimacy", roxyIntimacyMenu, 0);
	addButton(4, "Leave", mainGameMenu);
}
public function roxyIntimacyMenu(loc:int=0):void
{
	clearOutput();
	showRoxy(false, true);
	
	clearMenu();
	if (loc == 0) addButton(0, "Sit Together", roxyIntimacySitWith, loc, "Sit Together", "Roxy could use some special company.");
	else addDisabledButton(0, "Sit Together", "Sit Together", "You’ll want to wait ‘til Roxy’s eaten before doing this.");
	addButton(1, "Rub Tummy", roxyIntimacyRubTummy, loc, "Rub Tummy", "Roxy’s wobbly belly is filled with your future, it deserves to be rubbed as much as possible!");
	if (loc == 0) addButton(2, "Back", roxySpareAptMainMenu, true);
	else addButton(2, "Back", roxyCafeteriaGreet, true);
}
public function roxySpareAptTalk(skip:Boolean = false):void
{
	clearOutput();
	showRoxy(false, true);
	
	
	if (skip) output("Roxy gives you the inquisitive eye, waiting to hear more.");
	else
	{
		output("<i>“Mind if we have a talk?”</i> you ask.");
		output("\n\n<i>“Sure, yeah, sounds great,”</i> Roxy sighs, <i>“anything to take my mind off this.”</i>");
	}
	
	processTime(1);
	clearMenu();
	addButton(0, "Pregnancy", roxySpareAptTalkPreg, false, "Pregnancy", "Ask Roxy how she’s holding up.");
	addButton(1, "Plans", roxySpareAptTalkPlans, false, "Plans", "Ask Roxy what she’s going to do after having your kids.");
	if (roxyHasVisitedKids()) addButton(2, "Children", roxyTalkChildren, 1, "Children", "Ask Roxy how the kids are doing!");
	else addDisabledButton(2, "???");
	addButton(3, "Back", roxySpareAptMainMenu, true);
}
public function roxySpareAptTalkPreg(cafe:Boolean=false):void
{
	clearOutput();
	showRoxy(false, true);
	var firstTime:Boolean = true;
	if (flags["ROXY_TALK_PREG"] == 1) firstTime = false;
	flags["ROXY_TALK_PREG"] = 1;
	var pregTri:int = roxyPregTrimester();
	var numKids:int = flags["ROXY_NUM_BABIES"];
	var rn:int = rand(2);
	
	output("You lean back, staring blatantly at her stomach, asking simply how she’s feeling.");
	if (firstTime && roxyGetNumLitters() < 1)
	{
		output("\n\n<i>“Just...oof, dandy. This is a lot harder than I thought it’d be. Like, physically and mentally. I mean, physically ‘cause I got a couple kits in me and it’s killing my back. Mentally, well, I don’t do well when I can’t do anything.”</i> She breathes an exaggerated sigh.");
		output("\n\n<i>“So I’ve been stuck knitting onesies for the babies");
		if (numKids >= 6) output(", and because </i>someone<i> likes their virility mods, I got my work cut out for me");
		output("”</i>. She taps a finger to her face and leans forward, grunting from another kick to her stomach. <i>“Before you say anything, yeah, it’s a bit... outdated I guess, and yeah, the nursery provides... but it doesn’t feel right not showing some love too. Besides, gonna want a lot of pictures to shove in my sister’s faces!”</i>");
		if (pc.hasVagina() && pc.mf("m", "f") == "f")
		{
			output("\n\nRoxy’s eyes are darting up and down your body. <i>“You know...”</i> she squints, <i>“who’s </i>mom<i>? Like, between the two of us?”</i>");
			output("\n\nWhoever’s pushing out the kids, you think aloud.");
			output("\n\n<i>“Ehh, I can buy that. As long as they don’t call me ‘mother’ or something. That’s way too formal.”</i> The laugh you give tells her not to worry overmuch.");
			if (ChildManager.numChildren() > 0) output("\n\n<i>“What do your other kids call you? The ones that </i>can<i> talk anyway.”</i> She doesn’t seem all that allayed by your explanation that your kids call you how they see you: mommy. <i>“Huh. Guess I didn’t fall too far from my parent’s tree then, heh heh.”</i>");
			else output("\n\n<i>“Guess it’s up to the kids then,”</i> Roxy tilts her head inquisitively. <i>“Well, when they’re able to talk.”</i>");
		}
		output("\n\nShe smiles in a way that puts her bunny tooth on full display. <i>“Oh, and I don’t plan on learning any of their genders before they’re born. Laquines come in all flavors, so I’m looking forward to being surprised!”</i> She crosses her arms and laughs. <i>“It’s a weird thing, yeah, but hey, I gotta find something to smile about.”</i>");
		output("\n\nOn that, you can agree.");
		output("\n\n<i>“Oh, and we’ll come up with names when they’re born. I expect you to come up with some good ones, [pc.name].”</i> Her wink makes your heart vibrate.");
	}
	else
	{
		if (pregTri >= 3 && roxyGetNumLitters() > 0 && rn == 1)
		{
			output("\n\n<i>“This is the worst part, this is always the worst part, so close to giving birth and yet not quite...”</i> Roxy’s eyes seal shut and you [pc.move] to comfort her, running both [pc.hands] across her gut. <i>“Thanks... it’s, like... I can’t stop thinking about sex, I can’t stop getting pissed off at everything, can’t stop being in pain...”</i>");
			output("\n\nShe looks up to you and lunges for a kiss. <i>“But I’d do it all again, and again, as many times as you want, because every time I look at our kids, every time I look at you [pc.name], I feel like I’ve found my only reason for living. It’s a reason that I couldn’t be happier with.”</i>");
			output("\n\nYou seat yourself again, fingers clasped, looking at her with all due empathy. <i>“Feeling a bit better now, but they’re all kicking too hard. Fuckers,”</i> she laughs, wiping knuckles to furled brow.");
			if (numKids >= 6) output(" <i>“And you, as usual, are too damn virile. Oh well, my mom and my other mom’ll be ecstatic that I’m having so many kids.”</i>");
			else output(" <i>“Could be a bit more agonizing, but I’ve got all this around me, I’ll be fine.”</i>");
			output("\n\nIf she’s okay, then you’ll be okay. You pull her into another kiss, making that thought clear as day.");
			
		}
		else
		{
			output("\n\n<i>“It’s going. You knocking me up");
			if (roxyGetNumLitters() > 0) output(" again");
			output(" is hot and all, but I think this is always going to be my least favorite part. Trudging around with all this added weight, fuuuck, I hate being slowed!”</i> she whines.");
			output("\n\nNot gonna be doing much hopping like this, is she?");
			output("\n\n<i>“Ah ha ha ha, very funny.");
			if (pc.race() == "laquine") output(" You’re one to fucking talk!");
			output("”</i> Roxy rolls her eyes and looks back down. <i>“But, I’m fine, it’s going. Gonna have " + num2Text(numKids) + " kids according to the doc.");
			if (numKids >= 6) output(" Maybe lay off the fucking Priapen when you’re fucking me, ‘ya slut.”</i>");
			else output(" Least it’s not a full litter, things’d be way harder to deal with.”</i>");
			output("\n\nAll’s good then. That’s all that matters.");
			if (roxyGetNumLitters() > 0) output("\n\n<i>“Oh, and I’ll be naming these ones. You took too long last time,”</i> she snarks, as if that was the reason.");
		}
	}
	
	processTime(3);
	clearMenu();
	if (cafe) addButton(0, "Next", roxyCafeteriaTalk, true);
	else addButton(0, "Next", roxySpareAptTalk, true);
}
public function roxySpareAptTalkPlans(cafe:Boolean=false):void
{
	clearOutput();
	showRoxy(false, true);
	var firstTime:Boolean = true;
	if (flags["ROXY_TALK_PLANS"] == 1) firstTime = false;
	flags["ROXY_TALK_PLANS"] = 1;
	
	if (firstTime && roxyGetNumLitters() < 1)
	{
		output("It’s been at the front of your mind for a while. What’s Roxy going to do when she has kids?");
		output("\n\n<i>“Ask me a harder question one day!”</i> Roxy chirps, gesturing expansively. <i>“Oh, I’ll just be doing what I always do. Unless you knock me up again. Right now I’m gonna enjoy the hell out of my maternity leave, then I’m gonna go back to enjoying my sports... then I’m gonna go back to enjoying you knocking my slutty ass up all over so we can do this again and you can ask me the same questions.”</i>");
		output("\n\nOne eyebrow raised, you exhale and giggle simultaneously.");
		output("\n\n<i>“You laugh, but I’m serious. I’m a simple gal. And you better believe my future plans include plenty of visits. I’m going to be in their lives as much as possible. Gonna get their rooms set up with video calls to me, gonna tell ‘em all about my hobbies, gonna steer ‘em into physical activity, we’re gonna raise the best laquines!”</i>");
		output("\n\nYou’re just glad she’s so happy about it. The whole time she talks you’ve got the silliest smirk on your face, a smile that lasts long enough to hurt.");
		output("\n\n<i>“But let’s focus on the now, hmm?”</i> she folds her arms.");
	}
	else
	{
		if (roxyGetNumLitters() > 0) output("You ask Roxy if her plans have changed with repeat impregnation.");
		else output("You ask Roxy if her plans have changed with impregnation.");
		output("\n\n<i>“Didn’t you ask me this before?”</i> she laughs. <i>“Same as I told you, [pc.name]! Gonna keep playing sports, gonna keep visiting, gonna keep raising the best laquines with you! You don’t have to worry about me. Simple bun with simple needs here!”</i>");
		output("\n\nAs long as she’s happy.");
		output("\n\n<i>“Yep. Hell yes I am, [pc.name], because you’re here. I wouldn’t want to have kids with anyone else.”</i>");
	}
	
	processTime(3);
	clearMenu();
	if (cafe) addButton(0, "Next", roxyCafeteriaTalk, true);
	else addButton(0, "Next", roxySpareAptTalk, true);
}
public function roxySpareAptSleepWith(isAsleep:Boolean=false):void
{
	clearOutput();
	showRoxy(false, true);
	var sleepTime:int;
	
	if (isAsleep)
	{
		output("[pc.Walking] softly to Roxy’s bed, you look down at her sympathetically");
		if (pc.hasArmor()) output(" while shucking your [pc.armor]");
		output(". She looks to be in pain even in her sleep, and the sheets are wrinkled and barely on her. You don’t even have to think about what you’re doing, crawling in next to her, flipping that velveteen blanket back over the two of you. It takes some doing to wriggle your [pc.arm] under her right side, but you are successful, and you don’t wake her.");
		output("\n\nSnuggling up as the big spoon");
		if (pc.tallness < 68) output("- rather, the little spoon -");
		output(" you hold Roxy tight, feeling the tension drain and her tiny spasms disappear, vanquished by your love and affection. The stresses of the day vanish, and a long, warm sigh exits your [pc.lipColor] lips, washing over her neck, making her body shudder a tiny bit.");
		output("\n\nMatching your oxygen intake to hers is easy, especially after she calms down. In a safe, quiet space like this, with the mother of your children, falling asleep is even easier. Just before your consciousness fades, you hope that your dreams somehow catch each other in the cosmic space, and your thoughts and feelings intertwine...");
	}
	else
	{
		output("[pc.Walking] around Roxy’s chair, you put a hand on her shoulder and signal to the voice-activated lights you’d like them to begin dimming. The perky rabbit looks up to you, an unenviable weariness marring once-aggressive and vivacious lapine features. <i>“Humm?”</i> she moans quietly. <i>“What’s on your mind, [pc.name]?”</i>");
		output("\n\n<i>Sleep,</i> you chirp, wearing the kind of goofy smile one inevitably gets when they’re about to take their lover to bed. Now that it’s clear to her, Roxy puts down her tailor’s kit and stands -- with her hand held tight in yours, of course.");
		output("\n\n<i>“That sounds good to me,”</i> she nods reciprocally. Mindful of her precious cargo you guide her to bed and help tuck her in on the right side closest to the wall");
		if (pc.hasArmor()) output(", disrobing your [pc.armor] in the process");
		
		output(". Afterward, you crawl in next to her, [pc.face]-to-muzzle with the exhausted bunny.");
		output("\n\nThe exhalations you both make indicate a powerful bedgasm. The stresses of the day drain in total darkness, and in a safe, quiet space like this, with the mother of your children, you couldn’t imagine being anywhere else right now. Her arms wrap around your body, and yours latch to her back, rubbing small, blissful circles into her fur rich, silken fur.");
		output("\n\nMatching your breathing to hers is a cinch. An accomplished sportsbun like Roxy knows how to control her oxygen cycle, knows how to reduce it to a sensual and pleasing level like this. She plants tiny kisses all over your cheek, whispering sweet-nothings into your [pc.ear]. <i>“I’m glad you’re here. I wish you... I wish <b>we</b> could stay like this forever. But I’ll take what I can get, hehe...”</i>");
		output("\n\nOne [pc.finger] trails across her cheek, and she sucks on it before letting it go. A smug little wink sees it off. Your wet finger mats a few tufts of face-fuzz on its way. That solitary digit becomes five, and your caressing palm is sending every soft signal in the book, touring her head from jaw, to chin, and then to her ear for a nice, playful pinch.");
		output("\n\n<i>“This is... so nice...”</i> Roxy whispers, eyes fluttering and fast shutting. She’s already gone!");
		output("\n\nWell, you were only a second behind...");
	}
	output("\n\nYou can’t quite remember the last time you slept so well. The task of claiming your inheritance seemed to be a dream within an extraordinarily pleasant dream. You were bouncing across an elysian field, innumerable tiny jackalopes and bunnies hopping through fields of comically bright flowers, their fur bristling like the blades of healthy grass to the gentle breezes that kissed their bodies and yours.");
	output("\n\nSitting next to you under a tree was Roxy, her head resting on your shoulder. Having to face the waking universe seems a punishment or a crime after that lucid fantasy, but face it you must.");
	output("\n\nThe fucking alarm is so loud here!!");
	output("\n\nFortunately, it was smashed by the callused hand of your laquine lover. Roxy is there when you open your [pc.eyes], staring deep enough to get lost in them. She leans forward without a sound, without a word, kissing you on the nose and then your lips. <i>“This is why being a mother is worth it. For these moments, and for so much more. [pc.name]... thank you.”</i>");
	output("\n\nWhile the station and the nursery light up and begin their work routines anew, you and Roxy luxuriate in the presence of each other, holding closer and tighter, both hating the idea that you’re going to have to get up eventually.");
	output("\n\nThat eventual parting isn’t easy, but at least it wasn’t as painful as you mentally groaned. After helping the heavy laquine to her feet and into the shower, you wait for her to finish. She cracks the fabric off your back, brushing her tail against you on her way into the room again completely naked, looking so inconceivably gorgeous as she goes.");
	output("\n\n<i>“Gonna go get breakfast soon, but a shower always gets me in the mood for something. Dunno what. Got any ideas, [pc.name]?”</i> she grins.");
	output("\n\nA few!");
	
	//always wakeup at 7
	if (hours >= 7) sleepTime = 6 + (24 - hours);
	else sleepTime = 6 - hours;
	sleepTime = (sleepTime * 60) + (60 - minutes);
	processTime(sleepTime);
	dailyAutoSleep(sleepTime);
	clearMenu();
	addButton(0, "Next", roxySpareAptTalk, true);
}
// Put her in cafeteria
public function roxyInCafeteriaBonus(btnSlot:int = 0):void
{
	if (roxyGetNumLitters() > 0)
	{
		output("\n\nAt the nicest table, Roxy is sitting, a big plate of healthy oats and greens in front of her. She’s knocking back a large glass of water and chowing down. Occasionally a nurse checks up on her. Seems she’s grown accustomed to service like this!");
		if (!roxyCuddleRefused()) output(" <i>“Hiya, [pc.name]!” </i> she calls, waving, then resuming her gluttonous behavior.");
		output(" Athletes need all the calories they can get. Especially the pregnant ones.");
	}
	else
	{
		output("\n\nRoxy is seated in the nicest place of the cafeteria, right next to a large playground for kids to work off their calories. One nurse and several robots are seeing to her needs. The medic checking her pulse, among other things, and the ‘bots providing all the healthy food she’ll need to make it through her infant tribulation. From here, you can see how confused she is by all the attention, clearly not used to this kind of VIP treatment. Ironic.");
		if (!roxyCuddleRefused()) output(" She waves at you when she sees you, because her mouth is full of oats.");
	}
	
	if (roxyCuddleRefused()) addDisabledButton(btnSlot, "Roxy", "Roxy", "Roxy isn’t in a good mood.");
	else addButton(btnSlot, "Roxy", roxyCafeteriaGreet, false, "Roxy", "Pay Roxy a visit.");
}
public function roxyCafeteriaGreet(skip:Boolean=false):void
{
	clearOutput();
	showRoxy(false, true);
	
	if (skip) output("Roxy gives you the inquisitive eye, waiting to hear more.");
	else
	{
		if (roxyGetNumLitters() > 0)
		{
			output("<i>“Hey babe, hope you’re doing better than me!”</i> Roxy quips, nuzzling into you when you sit next to her. <i>“Come to check up on me? You’re so kind!”</i>");
			output("\n\nYou while away a few minutes asking her how her day is, how she’s holding up, quickly running out of idle chit-chat. Is there anything specific on your mind?");
		}
		else
		{
			output("You take a seat next to Roxy, patting her back and ushering the staff away. A long sigh passes over her food-speckled lips. <i>“Thanks, [pc.name]. Come to check up on me?”</i>");
			output("\n\nYep. After you go over the usual idle banter about what she’s eating, how people are treating her, etcetera etcetera, you wonder if there’s anything more specific to ask...");
		}
		processTime(10);
	}
	clearMenu();
	addButton(0, "Appearance", roxyAppearance, undefined, "Appearance", "Get a good look at the bouncy bunny.");
	addButton(1, "Talk", roxyCafeteriaTalk, true, "Talk", "See what’s on Roxy’s mind.");
	addButton(2, "Intimacy", roxyIntimacyMenu, 1);
	addButton(3, "Leave", mainGameMenu);
}
public function roxySpareAptSex():void
{
	clearOutput();
	showRoxy(false, true);
	
	output("You stand and [pc.walk] to Roxy’s side, threading her gold and brown hair between your [pc.fingers] -- it’s a gesture that turns into a long stroke of her sensitive outer ear. <i>“So... how do you feel about a roll in the hay?”</i> you ask");
	if (pc.hasArmor()) output(", removing your [pc.armor]");
	output(".");
	
	output("\n\nThe horny bunny grabs your [pc.arm] and tugs you into her chest, assaulting you with sordid smooches and off-target licks. Her vice-like grip burns your bicep while her steamy voice tickles your eardrum.");
	output("\n\n<i>“" + RandomInCollection(["It took you so fucking long to ask!","About time. You’re missing so many signals lately!","Fucking joyful!"]) + "”</i>");
	
	processTime(2);
	clearMenu();
	addButton(0, "Bed Sex", roxyBedSex, undefined);
}
public function roxyBedSex():void
{
	clearOutput();
	showRoxy(true, true);

	var pregTri:int = roxyPregTrimester();
	
	if (pc.isBimbo()) output("<i>“You just let me handle this!”</i> you sing");
	else if (pc.isBro()) output("<i>“Hold still,”</i> you murmur");
	else if (pc.isNice()) output("<i>“Let me get you started then,”</i> you whisper");
	else if (pc.isMischievous()) output("<i>“Me first!”</i> you smirk");
	else output("<i>“Stay there,”</i> you say");

	output(", sinking between Roxy’s legs.");
	
	output("\n\nOn your descent you brush your [pc.face] against the laquine’s fetally-distended belly. Stretched strands of fur soothe your [pc.skinFurScalesNoun], creating a lovely friction. The beating of Roxy’s heart can be felt along the circumference of her half-hidden gut, and underneath that, if you listen real close, you can hear the tiny cardiac tempos of her unborn children. There’s even a hit to her gut that reverberates through, traveling across your nervous system.");
	output("\n\nShe pulls her shirt up, revealing the pregnancy-enlarged mounds of boob and the dark nipples");
	if (pregTri >= 3) output(" bubbling with nourishing cream.");
	else output(" yet to start leaking milk.");
	output(" Roxy tosses the article away and spreads her legs, a sigh reminiscent of lifted weight pressing out across her smiling lips. You’re welcomed back home to the potent, wafting scents of arousing sexuality. It takes only a short tug to pull her sweatpants out of the way, revealing a midnight-black pair of panties that you discard with building hunger.");
	output("\n\n<i>“Anything you can do down there, but I want... something slow at first, to ease me into this okay?”</i> she asks, and her words empower the");
	if (pc.hasVagina())
	{
		output(" dual erections of [pc.oneClit] and [pc.oneCock], hardening your hermhood into self-lubing arousal and bunny-breeding stiffness");
		if (!pc.isCrotchExposed()) output(" beneath your [pc.crotchCoverUnder]");
		output(".");
	}
	else
	{
		output(" erection of your [pc.cocks], hardening you into bunny-breeding stiffness and self-lubricating arousal");
		if (!pc.isCrotchExposed()) output(" while pitching a strong tent in your [pc.crotchCoverUnder]");
		output(".");
	}
	
	output("\n\nRoxy’s scent was always finely tuned to draw you in and keep you in there, but now that she’s in her " + num2Ordinal(pregTri) + " trimester, what was merely potent is now transcendent. Warm femme cum dribbles from the parted space of her well-fucked pussy. The refulgent, lust-slick lips of her oily labia inspire gluttony. Hers is the aroma of a claimed woman. This fragrant pussy, glowing with undiminished need, is <i>yours,</i> and only yours.");
	output("\n\n<i>And you are hers.</i>");
	output("\n\nIf you tried to resist her magnified musk now, you would go insane a day later. Your [pc.lipColor] lips break through her rapturous fog like an icebreaker shearing caps atop the water, opening and firmly sealing across as much of that soft slit as they can, tiny, hot exhalations stimulating the exterior. Luminescent cunt sparkles with desire when you pull away, brightening under a fresh coating of warm spittle. <i>“Oooh-oh... [pc.name], that’sssss like we’re swimming. Oh man I feel suddenly tired...”</i> she moans, her voice cracking at high pitches of peaking bliss.");
	output("\n\nYour bun wanted it slow, and you don’t intend to disappoint.");
	output("\n\nHer keening voice rises and falls in sensual choir; aimless paws run across her belly and then");
	if (pc.hasHair()) output(" through your [pc.hairColor] [pc.hairs]");
	else output(" your scalp");
	if (pc.hasEmoteEars()) output(", turning into long, loving touches around your [pc.ears]");
	output(". <i>“Right the- Hic!”</i> Roxy’s breath catches; your [pc.tongue] dives into her crevice, into that dark interior you’ve mapped so thoroughly, seeking the treasures therein.");
	output("\n\nSmooth oral flesh drags over tensing and relaxing nerves of pussy-flesh, being rinsed and eventually caked in the hot flavor of a hypersexual bunny-girl. She rocks backwards and then forwards on restless inertia to give you more room, only pinging her black pearl off the tip of your nose. Into the chair her marvelous moistness collects, leaks, and spills from when it can longer settle into the material.");
	if (pc.hasLongTongue())
	{
		output("\n\nThere’s no reason to hold back, and with as much gentleness as you can manage (to avoid plunging her into an instant, pleasure-seizing wreck), you unfurl your endowed tongue until you’re packing her pussy to the cervix. Although you can’t exercise the most muscle control like this, you are pushing against her deepest nerves. <i>“I’ll... I’ll never get tired of that!”</i> she squeaks, <i>“Oh, this is everything I needed!”</i>");
		output("\n\nThat makes you happy.");
	}
	output("\n\nClosing in around your spear, her cushioning cunt presses down on your [pc.tongue] with great pressure; a scaldingly hot discharge seeps around the usable space in her tunnel. From plump, quivering muff to throat, a neck-distending orgasm rains into your wide open mouth. Even as she’s cumming, clinging to you with foot and finger, you suckle her through this electrifying orgasm, gulping calmly from her pliant pussy.");
	output("\n\n<i>“S-Stop that’s... Fuck! [pc.name]- I can’t-”</i> Roxy’s trembling voice lances your eardrums. A quick drum to <i>that</i> spot unearths the climax she was holding back! Howls of vigorous delight scrape the walls of the room when you push up, spread her hips wider, and <i>harvest</i> spurts of sticky laquine honey from her convulsing horsepuss.");
	output("\n\nA cast of girlcum sheens every inch of your [pc.face] in warm gushing orgasm. Fluid webs shut your [pc.eyes] and drips from your chin in large, bulbous droplets. Her pussy is like the river atop a cliff, the chair the rockface, and you the lake at formed at the bottom, catching it all like the natural landmark your creator wanted you to be. She’s spasming now, seizing up, wrenching you away long enough to catch a glimpse of her arcing jets glistening in their floorbound trajectories.");
	output("\n\n<i>“I f-fuck... I said slow at first!”</i>");
	output("\n\n<i>“I was!”</i> you protest playfully, wiping the mess from your face, patting her belly, bringing her to a series of cute moans after a few good rubs.");
	output("\n\n<i>“Guess I’m just... fucking pent up then...”</i> she exhales and sinks into her chair. <i>“Oh my god that was the best though. Nobody else, [pc.name]... nobody else can make me feel like that...”</i>");
	output("\n\nBet she’s not satisfied with a little lip service though!");
	output("\n\nRoxy nearly headbutts you in her lunge for a kiss, sampling her own juices on the");
	if (pc.lipRating() >= 3) output(" plump");
	else if (pc.lipRating() >= 2) output(" full");
	else output(" thin");
	output(" slopes of your lips. <i>“No... no. Honestly, that tongue of yours just made it worse. I think you owe me something a bit <b>harder.</b>”</i>");
	
	output("\n\nOnly question is, how are you going to iron out her agitating wrinkles? You can answer that in a second, for now...");
	output("\n\n<i>“Hey, woah!”</i> Roxy cries out, moaning when you pick her up out of the chair and carry her to bed. Oh if she weren’t pregnant you’d throw her right down...");
	output("\n\n<i>“" + pc.mf("Gentleman","Charmer") + "...”</i> she pouts, a blush visible through the fur of her cheeks. Now, what can you do with a heavy hare?");
	
	processTime(10 + rand(10));
	pc.girlCumInMouth(roxy);
	pc.applyPussyDrenched();
	pc.changeLust(30);
	clearMenu();
	addButton(0, "Spoon Her", penisRouter,[roxyBedSexSpoonHer,roxy.vaginalCapacity(),false,0], "Spoon Her", "Take Roxy slowly, be the big spoon that shows their lover what it truly means to be cared for.");
	addButton(1, "Rvs Cowgirl", penisRouter,[roxyBedSexRvsCowgirl,roxy.vaginalCapacity(),false,0], "Reverse Cowgirl", "Mount Roxy and let her have a little fun. Remind her what it’s like when she’s not pregnant!");
}
public function roxyBedSexSpoonHer(kok:int = 0):void
{
	clearOutput();
	showRoxy(true, true);
	var firstTime:Boolean = true;
	if (flags["ROXY_SPOON"] > 0) firstTime = false;
	var pregTri:int = roxyPregTrimester();
	var sleep:Boolean = false;
	var kok2:int = -1;
	if (pc.cockTotal() > 1) kok2 = pc.cockThatFits(roxy.analCapacity(), "volume", [kok]);
	
	output("Yeah, that’ll do just fine: slow, but no less hard.");
	if (!pc.isCrotchExposedByLowerUndergarment() || !pc.isChestExposedByUpperUndergarment()) output(" First things first, yanking your pesky undergarments way and joining the bunny-mom in liberating nudity!");
	output("\n\n<i>“I’ll never get tired of seeing you like this,”</i> Roxy smiles; you lean down and kiss her on the cheek, stroking her face and nuzzling into her forehead.");
	if (firstTime) output(" <i>“You know, the first time I saw your cock, saw you naked, I was gonna treat you like a fun fuckbuddy, but here we are...”</i>");
	else output(" <i>“I love seeing how hard you get just for me, how beautiful and ready you look. I dunno if you’ve ever played sports, but to me, you’re a champion. Don’t forget that.”</i>");
	
	output("\n\nCaressing her bicep, you instruct Roxy to turn around -- you help her do just that, turning her to face away from you on your crawl into the bed. <i>“Aw... I thought you wanted to look at me, fuck me in a way we can see each other...”</i>");
	output("\n\n<i>“We still can,”</i> you whisper, leaning forward (and it comes with a bit of strain) to exchange sight of each other through peripheral and slightly beyond. Though her glimmering eyes won’t be dead set on you, it doesn’t matter -- nibbling her neck and feeling her gooseflesh swell is good enough!");
	output("\n\nShe will <i>know</i> in every intimate detail where you are and what you’re doing");
	if (pregTri >= 3) output(", and you know that she’s loving what happens when you milk her tits of their pearlescent bounty");
	output(".");
	
	output("\n\n<i>“Haha, better give this bad boy some love soon. ‘Fore it goes soft anyway,”</i> Roxy winks, leaning back to press her heated lips to your nape.");
	output("\n\nShe’s sandwiched your [pc.cock " + kok + "] between her thighs, though given her position she can’t really do much other than rock her hips, giggle, and tickle the [pc.cockHead " + kok + "] with her clit and fingertips. <i>“Yeah, you like that, dont’cha?”</i> she titters, groping one tit at the same time. <i>“Sorry, not one for slut talk. I just wanna yell for you to breed me but... being pregnant and all I guess I gotta hold back.”</i>");
	if (pc.balls > 0)
	{
		output("\n\nA sudden lurch back and the laquine matron’s earthen haunches slap into your cumsack. Stimulating pressure wraps like a pillowly glove around your [pc.sack], gripping the [pc.ballsNoun] inside with palpating precision, stirring the orb");
		if (pc.balls > 1) output("s");
		output(" inside to produce a heavier load of [pc.cumNoun]. For a second your sperm-stash wobbles, tenses, but Roxy’s doughy nethers invite it inward to experience more admiration. With some effort her hand wiggles in there after her left hindleg raises, squeezing, rubbing, and rolling your");
		if (pc.ballSize() >= 8) output(" tremendous");
		else if (pc.ballSize() >= 4) output(" fat");
		else output(" ample");
		output(" maleness in slow pleasant circles.");
		output("\n\n<i>“Don’t waste any of this... I can feel how packed you are now...”</i> she says.");
	}
	output("\n\nYou sink your fingers into the malleable surface of Roxy’s multigrade limb, keeping it raised and ensuring the velvety maretwat below is exposed to your engorged shaft. The healthiest veins atop your girth owe their proactive states to the unrestrained appetite of that plump pussy creaming your breeder’s mass in anticipation of receiving another pussy-puffing load of [pc.cumVisc] thickness.");
	output("\n\n<i>“Take me, [pc.name]. I’m yours!”</i> Roxy whimpers, squeezing the hand you have on her chest.");
	output("\n\nShe knows what to say, what to do, to make you happy. While you wonder if you’ve really fallen in love with this lapine spitfire, you’re withdrawing your [pc.hips] and resting your [pc.cockHead " + kok + "] to her vulva");
	if (kok2 >= 0) output(" and the [pc.cockHead " + kok2 + "] to her asshole");
	output(", ready to widen");
	if (kok2 >= 0) output(" those anxious gloves and wear her like a cock-sock all over again.");
	else output(" that anxious glove and wear those chubby lips like a cock-sock all over again.");
	if (pc.cockTotal() >= 4) output(" Your extra [pc.cocksLight] will find their pleasure sliding across her pre-matted thighfuzz.");
	else if (pc.cockTotal() >= 3) output(" Your extra [pc.cocksLight] will find its pleasure sliding across her pre-matted thighfuzz.");
	
	output("\n\nWhen you finally push your [pc.cockNoun " + kok + "] into her suckling muscles, the familiar rippling sensations fan across your [pc.dickSkin " + kok + "]. [pc.CumColor] precum mixes with the steady trickle of Roxy’s juices. Accustomed to you in every possible way, she inhales calmly and exhales a special kind of contentment");
	if (kok2 >= 0) output("; but that falls apart into back-arching bliss when your anally holstered cock throbs");
	output(". Her left arm crooks and its hand firms into the back of your head. She’s quick to make an awkward kiss.");
	output("\n\nBut it’s also quick to break when you bottom out [pc.knotBallsHilt " + kok + "]-deep in marecunt");
	if (pc.cocks[kok].cLength() >= 14) output(", hitting the tightly sealed entrance of her womb");
	output(". <i>“I love that. That feeling, knowing you have me...!”</i> Roxy’s eyes tear up, and she grasps desperately for your [pc.hand]. <i>“[pc.name], that’s the most powerful thing... I...”</i>");
	
	pc.cockChange();
	
	output("\n\nHer usually strict and commanding tone has vanished completely into a unique loyalty and love, breaking down into joyful sobs that fast fade into impassive moans as you pump your meat in and out of her all over again, whispering sweetly into her ear. Two of your fingers shift to her jutting teat, twisting the rough, creased surface of her swelling bosom.");
	if (pregTri >= 3)
	{
		output("\n\nOut pops the cork under your ministrations, and your [pc.skinFurScalesNoun] is wettened and washed in white cream meant for the burgeoning life inside her. Rather than let it stain her bed, you rub it into her fur, letting it soak in, giving her pelt an attractive third color. <i>“Hey, don’t waste it- all... Hic!”</i> she muses. <i>“I’m not that big, and I gotta have plenty for them...”</i>");
		output("\n\nShe licks one of your fingers clean and you take the rest. She’ll have plenty. The flavor pours into and dyes your soul with its divine taste and nutritious sweetness.");
	}
	output("\n\n<i>“Hey, let me hold that,”</i> Roxy says, gripping her dexterous thigh unsteadily. By doing so, she enables you to take full possession of her fertility-fattened thighs while you drive your endowment into her yielding cunt one luscious pump at a time. Her tail’s contributions merely manifest as tiny twitches you feel around your waist where its long, flowing hairs have wrapped or clung to by virtue of sweat.");
	output("\n\nKeeping yourself from going all in would be an impossible task, but it’s the knowledge that your children there, growing in her core, that maintains your rational pace. Mentally patting yourself on the back also helps. Either way, it allows you to experience the exquisite bliss of her [pc.cockNoun " + kok + "]-stuffed tightness... lets you shudder with her, mutually relishing the throbs and clenches in each other’s vitalities.");
	if (pc.cocks[kok].cType == GLOBAL.TYPE_EQUINE) output("\n\nRoxy’s derriere smushes indulgently against your loins, but you know her simmering slit is doing more than basking in your equine prong. Ambrosial nectar is pouring from her infernal folds, her pussy kicked into overdrive by the bestial cock plunging in and out. There’s a pure blast of infatuation when your medial ring squelches through her chubby vulva on every thrust. Your horsecock, your fine piece of musky meat, is to her pussy what you are to her. It has a place as significant as the one you have in her heart.");
	else if (pc.cockCanSting(kok)) output("\n\nIn the taut, ambrosial channel of Roxy’s, you give up control on the venom-bearing tendrils lining your alien dick. The pregnant bun is lashed mercilessly by your lust-infusing payload. Her eyes roll back, and every fluid-producing gland is hypercharged by the acute sensitivity it brings. You would love to rail her into this bed, but all you know, even as some of it bleeds karmically into your own system, is that what you’re doing now is good enough.");
	
	output("\n\nSliding in and out is as easy moving your body through the galaxy around yourself. Roxy’s sex is so wide and stretched by her frequent lovemaking with you that it struggles restlessly to suck you inside and keep you there forever. The way it pleases you as its rightful mate, quite simply, doesn’t get old. It’s not supplication, it’s not surrender, it’s <i>respect.</i> Her child-bearing muff is gushing now, winding its penis-pounded nerves around your [pc.cockNoun " + kok + "] in the hopes of a [pc.cumVisc] gift before too long.");
	output("\n\n<i>“[pc.name] I’m... I’m gonna cum really hard if you- hit that- too much!”</i>");
	output("\n\nThat’s the plan.");
	output("\n\nShe wiggles and squirms, slowly losing the strength to keep her leg up. Like a scything pendulum it comes down further and further, compressing your agitated [pc.cock " + kok + "] with greater amounts of laquine muscle. Your shared lusts are puddling in the bridged gap where your bodies meet, pounding her with only a little more speed than what you started.");
	output("\n\nThe gravity of pounding this curvaceous mother’s pussy and rocking her feminine cradle disrupts your thoughts, ushering them out with the excess of throaty satisfaction you derive and voice. Just thinking about shooting your load early is enough to make you want to rut her mindlessly. It accelerates your passion, but you remain, under duress, in control.");
	output("\n\nThough you’ve begun moving faster, you don’t forget to route all of your strength into each ass-hammering skewer. Your [pc.cockHead " + kok + "] is aimed directly at the unbreakable entrance to her womb. When you cum, it won’t be siring new life... it’ll all spill out, it’ll all be wasted-");
	output("\n\nNo, it won’t be wasted. It will be a reminder to her of how well you can please her whenever you want. It will be a reminder of how you made her into the litter-burdened bunny she is right now...");
	output("\n\nAnd most importantly, she’s going to cum her brains out!");
	output("\n\nHer libido reasserts itself in defiance of maternal hormones, and Roxy urgently bucks her hips back into yours. Adrenaline scours through your nervous system, aiming all available energies towards your loins. The laquine’s trembling and tightening maximizes, the gradual, groan-worthy moments of minutes ago now over with. Waves of spasming bliss charge and seemingly crackle around your [pc.cock " + kok + "] like a gun ready to fire.");
	if (pc.balls > 0) output(" Renewed breeding desires grow in your seed-sloshing sack like a garden under fertilizing rain. You’re hitting her so hard now that the impacts of your [pc.ballsNoun] to her cunt are dizzying.");
	
	output("\n\n<i>“Please, I’m gonna go crazy! [pc.name], cum! I want it!”</i>");
	output("\n\nNow that her climactic contractions have begun, she turns into a sweaty, cummy wreck. Her needy voice fills your [pc.ears] as your own orgasm begins, expedited by her endless amounts of ecstasy.");
	if (pc.hasVagina()) output(" The walls of your [pc.pussies] tighten and rub against each other, depositing a fresh spurt of [pc.girlCumNoun] that you ignore in favor of an undeniably male orgasm.");
	output("\n\nSuperheated release gains passage through the innumerable tubes making up your masculine plumbing; you hug Roxy tight enough to add that last bit of pressure to your surging release, which even now pushes past every fecund obstruction to spurt and gush into happy, pregnant laquine puss");
	if (kok2 >= 0) output(" and cavernous bunny bum");
	output(".");
	if (kok2 >= 0)
	{
		if (pc.hasKnot(kok) || pc.hasKnot(kok2)) 
		{
			if (pc.hasKnot(kok) && pc.hasKnot(kok2)) output(" Your [pc.knots] don’t make it in on the first thrust, but you manage to lock her down on the final push.");
			else output(" Your [pc.knot " + kok + "] doesn’t make it in on the first thrust, but you manage to lock her down on the final push.");
		}
	}
	else if (pc.hasKnot(kok)) output(" Your [pc.knot " + kok + "] doesn’t make it in on the first thrust, but you manage to lock her down on the final push.");
	
	if (pc.cumQ() >= 6000)
	{
		output("\n\nGalotians would be lining up to suck straight from your tap and climb inside to finish the job. Titanic gouts of [pc.cum] blast out and strike demandingly against Roxy’s cervix, uncaring that she’s already pregnant, that it doesn’t need to fulfill that particular job this time.");
		output("\n\nThe sheer volume of [pc.cumColor] spunk you’re putting out is enough to flood this room, but as it stands, it’s flooding her. It’s not long before her admirable capaciousness is stuffed full of hot, [pc.cumVisc] nut, and it’s not long before she starts looking even bigger and heavier trying to house all of what’s geysering out of your [pc.cockHeads].");
		if (kok2 >= 0) output(" Her ass is an entirely different story, and after the third or fourth ejaculation it’s started to flow back outward, puddling between your crotches.");
		output("\n\nOnce the laquine’s room-rumbling screams begin to fade, just in time with your receding orgasm, your legendary [pc.cumNoun] reservoir finally empties into the stretched and straining confines of Roxy’s instinctively posturing body. A lot is spilling out... but even more is staying in.");
		pc.applyCumSoaked();
	}
	else if (pc.cumQ() >= 3000)
	{
		output("\n\nRather than fuck her through this climax, you ram into her and hold still, bracing your entire body against the rabbit’s cocoa hind. Fluid pressure jolts out of your loins; [pc.cum] buffets Roxy’s internals, near endless streams of a proper mate’s [pc.cumColor] seed seeking unseen spaces to pack full of spooge");
		if (kok2 >= 0) output(", both in her cunt and in her colon");
		output(". A bed-rattling cry of bliss breaks from Roxy’s mouth");
		if (kok2 >= 0) output(" and yours too");
		output(" when she realizes the nut you’re busting is nowhere near over with even after half a minute passes. Her lower end seems fatter and even more prepared for bearing a sizable litter now that she’s housing your [pc.cumGem] superfluity in her begging nethers.");
		output("\n\nYou can safely say that her pussy has been trained well, the way its muscles fight to keep your [pc.cumNoun] from puddling out. Even when you shuffle and pull out a few inches, it tightens up and her posture shifts instinctively to keep that soothing sperm inside.");
	}
	else if (pc.cumQ() >= 500)
	{
		output("\n\nYou take a deep breath during the first voluminous gout of [pc.cum]. Movements ceasing, you give 100% of this creampie to Roxy’s pussy, biting down hard and forcing out the [pc.cumVisc] deluge. The [pc.cumGem] nut you’re busting in the womb-stuffed laquine takes over every available inch of space not crammed full of cock, a few lines of [pc.cumColor] superfluity dribbling back out once there’s nowhere left to settle.");
		if (kok2 >= 0) output(" Her ass is a different story, and although you’ve spunked its interior thoroughly, it manages to stay in.");
	}
	else
	{
		output("\n\n[pc.Cum] vents into the ardorous folds of a mom-rabbit, oozing towards a cervix that’s already been impregnated. That doesn’t stop you from giving it your all, emptying your modest, [pc.cumVisc] climax into the laquine’s depths, repainting her walls with [pc.cumGem] seed and quenching her need in the only way it can be. Shallow strokes see the rest of your spunk deposited where it belongs, combating her heat without much hassle or mess.");
		if (kok2 >= 0) output(" What’s discharged into her intestine isn’t much, but it makes her release that much more impressive.");
	}
	
	processTime(10 + rand(10));
	roxy.loadInCunt(pc, 0);
	if (kok2 >= 0) roxy.loadInAss(pc);
	pc.orgasm();
	IncrementFlag("ROXY_SEX");
	IncrementFlag("ROXY_SPOON");
	
	if (hours >= 7 && hours < 19)
	{
		output("\n\n<i>“Hooooo....”</i> Roxy huffs, collapsing into the blankets and pillows. <i>“I definitely needed that,”</i> her quailing voice stumbles over the words, and her own need for oxygen. <i>“I don’t wanna get up...”</i>");
		output("\n\nWithout much input from you, she wedges herself deeper into your torso, trying to put herself lower than you. In you, she finds sanctuary. <i>“Let’s just... lay right here,”</i> she yawns, <i>“and make sure your");
		if (kok2 >= 0) output(" dicks stay warm...”</i>");
		else output(" dick stays warm...”</i>");
	
		output("\n\nNo argument here!");
		if (kok2 >= 0) 
		{
			if (pc.hasKnot(kok) || pc.hasKnot(kok2)) output(" Besides, with her knotted, it’s not like you’d be going anywhere for a while!");
		}
		else if (pc.hasKnot(kok)) output(" Besides, with her knotted, it’s not like you’d be going anywhere for a while!");
		output(" Sleep comes easy, especially after such a powerful orgasm.");
		if (pc.isNaga()) output(" You wrap her up in your snake coil as best you can, though the position means you only get half of her lower end...");
	}
	else
	{
		output("\n\n<i>“Oh... fuck... ffuuuck...</i> Roxy gormlessly huffs, the blankets and pillows absorbing her into themselves. <i>“Oh damn... I needed that so bad,</i> she grunts, her quailing voice dry from lack of oxygen.");
		output("\n\nWithout saying anything, she wriggles herself against you, placing herself lower than you while affording herself the sanctuary of your entire body. The act is enough to rouse you back into fuck-readiness, but her clamped cunt denies a coital restart. ");
		output("\n\n<i>“I was gonna go to bed soon anyway... let’s just stay like this until morning, okay [pc.name]..?”</i> she asks, clutching your [pc.hand].");
		output("\n\nYou don’t have any problem with that. You squeeze her back, too.");
		sleep = true;
	}	
	
	clearMenu();
	addButton(0, "Next", roxyBedSexWake, sleep);
}
public function roxyBedSexWake(sleep:Boolean=false):void
{
	clearOutput();
	showRoxy(true, true);
	var sleepTime:int;
	
	output("<i>“Heyyy, sleepyhead, I wanna get up and get something to drink!”</i>");
	output("\n\nRoxy’s voice pierces the coverings of post-orgasmic sleep, bringing you back into reality with a knee-jerk response to thrust your flaccid [pc.cocksLight] against her. <i>“Hey, you already had a go, [pc.raceCute]-[pc.boyGirl]!”</i> she laughs. <i>“Lemme get a shower too.”</i>");
	output("\n\nIn no particular order you shake your head, kiss Roxy on the cheek, slide your tender dong");
	if (pc.cockTotal() > 1) output("s");
	output(" out of her, unravel from her, and get off the bed to stretch out. Feels pretty damn good, actually! Reinvigorated, Roxy also hops out of bed, does a few things also in not much of an order, and races to the shower.");
	output("\n\nNot to be left out, you join her. It’s not as lewd as it could have been, but having the chance to get cleaned with the laquine wasn’t one you were going to miss. Five minutes later you step out, try to beat each other to the obligatory ass slap, and get dressed.");
	output("\n\n<i>“Gonna get some grub, need a bite after that. And a drink. Come by soon, okay, [pc.name]? I’ll need more of that.”</i>");
	output("\n\nYou promise, and she steps out.");
	
	if (sleep)
	{
		//always wakeup at 7
		if (hours >= 7) sleepTime = 6 + (24 - hours);
		else sleepTime = 6 - hours;
		sleepTime = (sleepTime * 60) + (60 - minutes);
		processTime(sleepTime);
		dailyAutoSleep(sleepTime);
	}
	else
	{
		processTime(120);
		restHeal();
	}
	pc.shower();
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}
public function roxyBedSexRvsCowgirl(kok:int = 0):void
{
	clearOutput();
	showRoxy(true, true);
	var firstTime:Boolean = true;
	if (flags["ROXY_RVS_COWGIRL"] > 0) firstTime = false;
	var pregTri:int = roxyPregTrimester();
	var sleep:Boolean = false;
	var kok2:int = -1;
	if (pc.cockTotal() > 1) kok2 = pc.cockThatFits(roxy.analCapacity(), "volume", [kok]);
	
	output("Roxy, helpful laquine that she is, slowly moves aside when you slide into bed, back against the headboard");
	if (!pc.isCrotchExposedByLowerUndergarment() || !pc.isChestExposedByUpperUndergarment()) output(", and undergarments completely discarded");
	output(". You motion to your [pc.cocks] and encourage your pregnant bun to take you for a ride.");
	output("\n\n<i>“M-Me on top? Really? I thought you were gonna-”</i>");
	output("\n\n<i>That doesn’t sound at all like the bun I love</i> you recite in your own way. Roxy’s thin lips open in shock and she bites down on her cheeks.");
	output("\n\n<i>“Fucker, how can you say things like that with a straight face!?”</i> she punches your shoulder, already accepting the invitation. <i>“Yeah... what am I thinking, of course I can handle this much!”</i> she laughs, pinning your [pc.legOrLegs] and thrusting her cocoa-flavored haunches into your [pc.cocksLight], drawing the shaft");
	if (pc.cockTotal() > 1) output("s");
	output(" into her crack.");
	
	output("\n\n[pc.CumColor] pre");
	if (pc.cumQ() >= 3000) output(" squirts");
	else if (pc.cumQ() >= 500) output(" spurts");
	else output(" oozes");
	
	output(" immediately into her fur, and the gravid girl takes a deep breath, slowly maneuvering her sweat-slick rump up and down with excruciating speed. Her playfully indignant glare over the shoulder causes you to throb out another runnel of cock-slime into her doughy buttcheeks, and you happily rub that frantically wiggling derriere until her pussylips touch down on your [pc.knotBallsHilt " + kok + "].");
	output("\n\n<i>“I’m gonna lead, so... please do what I say,”</i> Roxy smiles, one ear lowering demurely.");
	output("\n\nAsking nicely? That’s not like her!");
	output("\n\n<i>“[pc.name], it’s exhausting...”</i> she whines. <i>“Please just... roll with it, okay?”</i>");
	output("\n\nGrinning, you tap her butt and buck upwards, making her heavy stomach wobble. So be it, you’ll play the part of the defenseless stud for her. All it takes to placate (and ease her!) is a nod of the head, and she’s back to moving herself further into your lap. Roxy’s rump has done an admirable job of getting your [pc.cocks] ready, smearing itself in copious lubricant and helping spread it along your needy girths.");
	output("\n\nThe feathery texture of her ass, the quiet gasps and breaths she takes, the sensation of her recently pleased horsecunt gliding over your [pc.dickSkin " + kok + "]... she’s doing her best to be sensual, and her best to not get tired before you’ve fucked her. You take a moment to admire her hips, marveling at their feel, mindlessly thinking about how wider she’ll get after birthing. Her rounded abdomen juts out when her progress is arrested by the security of your hot, relishing embrace.");
	output("\n\n<i>“Before we start, can you tell me something?”</i> she asks innocuously.");
	output("\n\nFirst things first, you stroke her stomach, you kiss her on the neck, her chin, and then on the lips. What does she want to know?");
	output("\n\n<i>“Just... can you say something?”</i> she replies, sandwiching your [pc.cocks] between her legs and pleasuring them asymmetrically. <i>“I wanna hear your voice. I wanna hear you say...something... just, how you feel.”</i>");
	if (pc.isBimbo()) output("\n\n<i>“I love ‘ya babe! I’m not going anywhere, so let’s have some fun!”</i> you sing, petting her ears and nuzzling her hair.");
	else if (pc.isBro())
	{
		output("\n\n<i>“I’ll be your one and only. I’m happy to have you, and I’ll always be there to satisfy you when you most need it,”</i> you murmur, tugging on her two");
		if (pregTri >= 3) output(" milky");
		output(" nipples.");
	}
	else if (pc.isNice()) output("\n\n<i>“I feel like I wouldn’t want to be anywhere else right now, Roxy. I hope you’re not worried that I’m going to up and vanish on you...”</i> you giggle, hugging her a bit tighter.");
	else if (pc.isMischievous()) output("\n\n<i>“Like I’m about to have my pelvis shattered by a burdensome bunny,”</i> you laugh. She whips around just in time to hear you finish: <i>“But I don’t mind - she’s the bunny I’ll provide for as long as she needs it.”</i>");
	else output("\n\n<i>“I don’t want to let you go,”</i> you say flatly, exhaling with some amount of bewilderment. <i>“I don’t plan on ever letting go.”</i>");
	
	output("\n\n<i>“Thanks,”</i> she looks at you with misty eyes. Once her forearm slides across her brow, she clears her throat and lifts her body. <i>“Now let’s get");
	if (kok2 >= 0) output(" those dicks warm!”</i>");
	else output(" that dick warm!”</i>");
	output("\n\n[pc.Hand] firmly at the [pc.base " + kok + "] of your [pc.cock " + kok + "] next to Roxy’s, you groan in satisfaction when her sticky pussy-cream trickles down on to the [pc.cockHead " + kok + "], some slipping into your dilated urethra only to spurt back out as part of an agitated wad of pre.");
	if (kok2 >= 0) output(" Your second [pc.cockNoun " + kok2 + "] is directed to her winking anus. Her ring opens and closes, eventually yawning long enough to permit entrance.");
	output(" The bun’s balance gives away, and she falls upon your");
	if (kok2 >= 0)
	{
		output(" twin spears");
		if (pc.cockTotal() > 3) output(", clamping the rest somewhere in her pheromone-ridden taint.");
		else if (pc.cockTotal() > 2) output(", clamping the third somewhere in her pheromone-ridden taint.");
		else output(".");
	}
	else
	{
		output(" spear");
		if (pc.cockTotal() > 2) output(", clamping the rest somewhere in her pheromone-ridden taint.");
		else if (pc.cockTotal() > 1) output(", clamping the second somewhere in her pheromone-ridden taint.");
		else output(".");
	}
	
	output("\n\nLike a fruit splitting open, Roxy’s latex-textured cunt widens and sucks your [pc.cockNoun " + kok + "] inside");
	if (kok2 >= 0) output(" while her rippling rear absorbs the other");
	output(". Her ears go flopping like crazy when her head is thrown back from the fall, urgent tendrils of lust crackling across her body and scouring through yours.");
	
	pc.cockChange();
	
	output("\n\nAlthough she seems out of it, and though she’s moaning mindlessly, she still finds the sense to lift up and drag you forward by the dick, planting you on your back to more properly use you like a penis-equipped stool.");
	output("\n\n<i>“There we go,”</i> Roxy sighs, her dusky ring");
	if (kok2 >= 0)
	{
		output("s");
		if (pc.cockTotal() > 2) output(" smothering most of");
		else output(" totally engulfing");
	}
	else
	{
		if (pc.cockTotal() > 1) output(" smothering most of");
		else output(" totally engulfing");
	}
	output(" your [pc.dickSkin].");
	
	output("\n\nTo emphasize her point she grips your [pc.hip] with one paw and her belly the other, rising a few inches before falling down upon you with another loud squelch. Juice splatters and flies out from between your crotches");
	if (pregTri >= 3) output(", and a stream of milk arcs from her overfull tits");
	output(". <i>“Mmh, I almost forgot what it was like before... I was pregnant...”</i> she sighs stressfully, holding her head. <i>“God, this pressure...”</i>");
	
	output("\n\n<i>“Easy now,”</i> you whisper, taking hold of her hips and lending her the strength to ride you.");
	output("\n\nPlump pussy");
	if (kok2 >= 0) output(" and trained tush");
	output(", stuffed with cock, grip tight. The pleasure coursing through Roxy must be near the limit she can handle, but your laquine’s determined to make the most of her opportunity. She huffs, rises, and you both marvel at the friction it causes. Your entire body shudders warmly, gasping with the unmistakable heaviness of being a mother in control.");
	if (pc.cocks[kok].cType == GLOBAL.TYPE_EQUINE) output("\n\n<i>“I love that fat fucking horse cock you have, I just can’t... GET ENOUGH OF IT!”</i> Roxy yelps, declaring loudly and lewdly her appreciation for your musky member when the medial ring forces its way in. <i>“Like a fucking... good dick... it has a halo, too. Just a big, nice dick that knows how to please sluts like me!”</i> Your tip begins to flare at her commentary, and you know she feels that in her furthest depths.");
	else if (kok2 >= 0)
	{
		if (pc.cocks[kok2].cType == GLOBAL.TYPE_EQUINE) output("\n\n<i>“I love that fat fucking horse cock you have, I just can’t... GET ENOUGH OF IT!”</i> Roxy yelps, declaring loudly and lewdly her appreciation for your musky member when the medial ring forces its way in. <i>“Like a fucking... good dick... it has a halo, too. Just a big, nice dick that knows how to please sluts like me!”</i> Your tip begins to flare at her commentary, and you know she feels that in her furthest depths.");
	}
	if (pc.cockCanSting(kok)) output("\n\nA sultry sounding coo drifts out of Roxy’s maw when her interior is slapped by the stingers lining your alien rod. Her quailing voice crescendos to its highest pitch when lust-venom maximized her sensitivity and capitalizes on that newfound vulnerability. It suddenly becomes harder for the tongue-lolling bun to keep going. Her enhanced bosom bounces up and down when she jerks and spasms. You’d feel content, but then karma strikes, and a little bit of your payload seeps out into you as well.");
	else if (kok2 >= 0)
	{
		if (pc.cockCanSting(kok2)) output("\n\nA sultry sounding coo drifts out of Roxy’s maw when her interior is slapped by the stingers lining your alien rod. Her quailing voice crescendos to its highest pitch when lust-venom maximized her sensitivity and capitalizes on that newfound vulnerability. It suddenly becomes harder for the tongue-lolling bun to keep going. Her enhanced bosom bounces up and down when she jerks and spasms. You’d feel content, but then karma strikes, and a little bit of your payload seeps out into you as well.");
	}
	
	output("\n\nNo matter how many deep breaths she takes, it’s abundantly clear that although she’s enjoying her tentative cycles, it’s causing her a kind of pain that you direly wish to heal; however, you opt to hold back. Roxy’s a tough bun. She plays contact sports for a living.");
	if (roxyGetNumLitters() > 0) output(" This isn’t her first pregnancy either!");
	output(" If anyone can soldier through something, it’s definitely her.");
	
	output("\n\nTo your delight, you start to sense the fight in her. Her lips close, and her air flows only through her nose. Pretty soon she’s bouncing her bubbly butt off your lap on her own strength, little giggles rumbling inside her throat. Lying down like this turns out to be just as hot as holding her in your arms. You watch your [pc.cockColor " + kok + "]-hued meat vanish into her channel of nectar-raining muscle. The trip she takes you on through her equine valley");
	if (kok2 >= 0) output("s");
	output(" is something you savor.");
	output("\n\nIt’s like she was made for you, but you know that it was only by your repeat frolicking that it seems so.");
	if (kok2 >= 0) output(" Her holes are molded to your shapes.");
	else output(" Her hole is molded to your shape.");
	output(" Nobody else could ever hope to please her. Gazing steadfastly at her wagging tail, you imagine a kind of scenario... if someone ever came up to you and said they got her off, you’d laugh them off as the shitty liar they were.");
	
	if (pc.balls > 0)
	{
		output("\n\nRoxy’s throbbing clitoris isn’t getting much love in this position, but in an unlikely way it manages to please itself and you. Every time she impales herself on your maleness, your [pc.sack] bounces up, and the");
		if (pc.hasFur()) output(" buttery pelt");
		else if (pc.hasScales()) output(" smooth scales");
		else output(" buttery flesh");
		output(" sag down with an imprint of her nerve-buzzer in itself. Her posterior absorbs the shock of every impact, and your quavering [pc.ballsNoun] use that moment to drum a testicular beat against her labial hood. Sweet torrents of girl cream flow, and your");
		if (pc.ballSize() >= 8) output(" tremendous");
		else if (pc.ballSize() >= 4) output(" weighty");
		else output(" ample");
		output(" nutsack swells with more roiling [pc.cumNoun] than before.");
	}
	
	output("\n\nLaquine curves scythe down on your pillar");
	if (kok2 >= 0) output("s");
	output(", preparing to screw themselves on you even faster. Smiling from ear-to-ear, Roxy glances down and leans forward, steadying herself on");
	if (pc.isNaga()) output(" the mattress");
	else output(" your knees");
	output(", switching to fiercely dogged bucks that make her luscious curves shake and her generous ass eagerly clench and relax. A burst of speed, perhaps from an inner focus (but certainly a challenger’s mindset) leads to a skeleton-rattling vibration to begin at your holstered [pc.cocksLight] and spread through your loins.");
	
	output("\n\nIf you weren’t a dedicated lover, you’d seem a virginal mate by cumming to this tidal wave of pleasure generated by her satiny rear. And then she rocks to the sides, applying another layer of pressure -- now it’s not just the hungry squeezes of her lust-fattened entrance");
	if (kok2 >= 0) output("s, it’s the shift of pressure to your adamantine boners.");
	else output(", it’s the shift of pressure to your adamantine boner.");
	
	output("\n\n<i>“Hey... you can sit up now,”</i> she says tersely, boobs wobbling attractively after hilting herself on your");
	if (kok2 >= 0) output(" [pc.cocks]");
	else output(" [pc.cock " + kok + "]");
	output(" again. <i>“I just wanted to see you on your back all subby.”</i> She laughs. <i>“C-C’mon, I’m not fragile goods... even like this...”</i>");
	
	output("\n\nCan’t disagree with that!");
	output("\n\nSo you sit up, claiming her again as you always have: passionately and emphatically. Globules of pre force their way out of [pc.eachCockHead] and her pussy rains like a sieve coming up from the water. She kisses you artlessly, bending an elbow around to clutch your head and stroke your");
	if (pc.hasHair()) output(" [pc.hair]");
	else output(" scalp");
	output(" comfortingly. Every pulsating inch of your [pc.cocksLightIsAre] rendering her breathless, denying her a chance to inhale when you thrust your [pc.tongue] into her mouth");
	if (pc.hasLongTongue()) output(" and fuck her throat with its extended length");
	output(".");
	output("\n\n<i>“Fuck me raw”</i> are Roxy’s last words.");
	output("\n\nBeing the dick-toting [pc.raceShort] you are, being as hard as stone, you have no choice but to slam yourself back in. Your nostrils flare their desire.");
	if (pc.cocks[kok].cLength() >= 13)
	{
		output(" Were she not pregnant you’d be able to see your [pc.cockHead " + kok + "] outlined against her tummy. Still, Roxy is unable to do anything but experience the pleasure of being fucked to hilt over and over again");
		if (kok2 >= 0) output(" in both of her holes");
		output(".");
		if (pc.balls > 0) output(" A wet, meaty sound from below pushes through the groans and slaps of [pc.skinFurScalesNoun] against fur. Though you can’t look to see, you can feel it in your spunk-stuffed [pc.ballsNoun]. The overfull load they’re carrying is bubbling like molten liquid. There’s an endless squirm in Roxy’s thighs, and it only gets worse when she is reminded of what kind of load you’re packing.");
	}
	else
	{
		output(" Despite your size, you stretch her further, treating her hole");
		if (kok2 >= 0) output("s");
		output(" like a sheath for your inexorably expanding girth.");
	}
	
	output("\n\n<i>“I hate when you pull back. I wish you could just fuck me without leaving..!”</i> Roxy cries in agonizing hollowness.");
	output("\n\nShe’s an easily pleasured thing, so aroused, twitching so much that she couldn’t hope to fuck you back now. The realization that you can- <b>have</b> to keep using her is one that fixes firmly in your pulsating meat. Drilling in and out of her, you aim to bring her to climax, knowing she’s been holding it back until now. What she feels without your presence is dull and mood-killing in comparison.");
	output("\n\nRivers of sexual effluvia soak into the sheets. You wonder how often they’re cleaned, how long Roxy might sleep here and be forever who reminded of you, how many times she’ll want to fingerfuck herself and not be able to get off. She’ll be thinking of you. She’ll be lonely without you. Tightening down on your");
	if (kok2 >= 0) output(" [pc.cocks]");
	else output(" [pc.cock " + kok + "]");
	output(" is a delight you’ve trained her body to appreciate more than anything else.");
	
	output("\n\nWhen you slap deliciously to her taint, you feel a missile of pre squirt against her already conquered gates. Her climax is sudden; she writhes, splashing you with miniature squirts that speak of her most well-developed orgasm to date. She’s cumming for your turgid [pc.cockNoun " + kok + "]. It’s a textbook explosive climax that is snuffed by a urethral straining surge from your sawing hips. A long pulse of pleasure trails along like a sparkling trail, and you stabilize her for your slavish, liquid release");
	if (kok2 >= 0) 
	{
		if (pc.hasKnot(kok) && pc.hasKnot(kok2)) output(", popping your [pc.knots] into her sodden nethers at the very last second");
		else if (pc.hasKnot(kok) || pc.hasKnot(kok2)) output(", popping your [pc.knot " + kok + "] into her sodden nethers at the very last second");
	}
	else if (pc.hasKnot(kok)) output(", popping your [pc.knot " + kok + "] into her sodden nethers at the very last second");
	output(".");
	
	if (pc.hasVagina()) output("\n\nNot before your femininity is done though. Your [pc.pussiesIsAre] detonating helplessly with [pc.girlCumNoun], but it’s a distant and gray climax compared to the excellence of masculine release.");
	
	if (pc.cumQ() >= 6000)
	{
		output("\n\nYou don’t scream or moan as you expected to, joining Roxy in an utterly exhilarating orgasm. You just nibble and slobber all over her neck, slobbering across her lips and suckling on her lips.");
		output("\n\nInstead, it’s Roxy who screams. You seriously hope this room is soundproofed both ways, because that yell would terrify the rest of the nursery. Endless, boiling-hot columns of [pc.cum] fill the laquine’s canal, though it’s blocked form her occupied womb by an adamantly defiant cervical ring. Her belly gurgles, expanding even with a litter of children thanks to the gut-stuffing nut you’re busting in");
		if (kok2 >= 0) output(" both her marecunt and asshole");
		else output(" her marecunt");
		output(". Capacious though she may be, even Roxy can’t hold in all of the [pc.cumVisc], curve-fattening deluge.");
		output("\n\nBut you’re fine with that. All that matters is that Roxy is one of the people out there who can appreciate the enormous reservoir you carry around. You know that she loves, more than most, having her quivering quim buffeted with expulsions so magnificent that others could prematurely ejaculate from seeing it in action.");
		pc.applyCumSoaked();
	}
	else if (pc.cumQ() >= 3000)
	{
		output("\n\nEndless amounts of [pc.cumColor] ejaculate spew forth from [pc.eachCockHead], plastering Roxy’s quim");
		if (kok2 >= 0) output(" and colon");
		output(" twitch after twitch. Her middle noticeably plumps despite the fact her womb is occupied, an enormous amount of cum cramming her insides with gooey goodness. [pc.CumGem] gouts of semen plug up all the inches that your");
		if (kok2 >= 0) output(" [pc.cocks] don’t, backwashing sloppily from her strained-wide holes.");
		else output(" [pc.cock " + kok + "] doesn’t, backwashing sloppily from her strained-wide hole.");
		output(" If you were to pull out, every freed up inch would be taken by the pulses of [pc.cumVisc] pleasure.");
		output("\n\nBlinking blearily, you note that your orgasm has yet to stop, and your [pc.thighs] squirm; your belly and heart flutter from the pleasure and warmth of impregnating your bun all over again. Well, in spirit anyway...");
		pc.applyCumSoaked();
	}
	else if (pc.cumQ() >= 500)
	{
		output("\n\nA raging [pc.cumColor] deluge of [pc.cumNoun] looses in ropes, each thicker than the average man’s cumshot. Roxy’s entire body curls in bred bliss, her toes digging into the sheets. The volume of jizz you’re pumping out would bulge her stomach with a temporary ornament of your virility. As it is, you’ve got one a lot longer lasting in there right now. Despite the intense volume of your incredible virile musk, not a drop of it pours back out of her fully nutted horsepussy");
		if (kok2 >= 0) output(" nor her siphoning sphincter");
		output(".");
	}
	else
	{
		output("\n\n[pc.CumColor] cream spills forth, soothing your tenderized breeding flesh with the warm rush of [pc.cumVisc] [pc.cumNoun]. Compared to the estrus of Roxy’s fertile and always-ready marecunt, your modest orgasm is docile. Still, every [pc.cumGem] spurt that flies from your spunk vein does its part in fighting the fire burning inside her.");
		if (kok2 >= 0) output(" The little pumps of alabaster into her colon are a good end to the looping fits of her milking muscles.");
	}
	
	output("\n\nSpent and dreary, you fall back with Roxy wrapped in your arms. She paws over your knuckles, humming happily in the aftermath. All the cum stuffed in there keeps her feeling full, and will so long as you stay like this.");
	output("\n\nAnd you don’t plan on moving");
	if (pc.isNaga()) output(" nor do you want her to go anywhere. It takes some effort, but you are able to wrap her up nice and tight in your snake tail");
	output(".");
	output("\n\n<i>“I’m... beat... just hold me, I wanna stay like this...”</i> Roxy muses thankfully. <i>“You filled me jusshh welll...”</i>");
	
	pc.applyPussyDrenched();
	processTime(10 + rand(10));
	roxy.loadInCunt(pc, 0);
	if (kok2 >= 0) roxy.loadInAss(pc);
	pc.orgasm();
	IncrementFlag("ROXY_SEX");
	IncrementFlag("ROXY_RVS_COWGIRL");
	if (hours >= 7 && hours < 19)
	{
		output("\n\nA short nap will do you both some good after that steamy round. Sleep comes easily, your whole body throbbing to the exhausting motions of post-coital haze.");
	}
	else
	{		
		output("\n\nIt is pretty late, and fortunately, this room is heated appropriately. Not being able to pull the blankets over should be fine. Not that you could hope to move a finger, the post-coital haze and dregs of your liquid weight throbbing out soothing you into unconsciousness.");
		sleep = true;
	}		
	clearMenu();
	addButton(0, "Next", roxyBedSexWake, sleep);
}
public function roxyCanTriggerCuddleEvent():Boolean
{
	if (flags["ROXY_CUDDLES_TIMER"] == undefined) return true;
	if (GetGameTimestamp() > (flags["ROXY_CUDDLES_TIMER"] + (60 * 24 * 60))) return true;
	
	return false;
}
public function roxyCuddleRefused():Boolean
{
	if (flags["ROXY_CUDDLES_REFUSE"] == undefined) return false;
	if (GetGameTimestamp() < (flags["ROXY_CUDDLES_REFUSE"] + (3 * 60))) return true;
	else flags["ROXY_CUDDLES_REFUSE"] = undefined;
	
	return false;
}
public function roxySpareAptCuddle():void
{
	clearOutput();
	showRoxy(false, true);
	var pregTri:int = roxyPregTrimester();
	
	flags["ROXY_CUDDLES_TIMER"] = GetGameTimestamp();
	
	output("Finding Roxy pacing around the room isn’t the most comforting sight to walk into. Her shaky fingers are quivering painfully against her");
	if (pregTri >= 3) output(" distended belly");
	else output(" swollen gut");
	output("; the laquine’s face is twisted into something of a grimace. She looks ready to snap -- correction, she was ready to snap. She heard you coming and whipped her head in your direction, an angry scowl on her muzzle.");
	output("\n\nOh, she looks peeved.");
	output("\n\n<i>“What are you looking at?”</i> Roxy raises her voice, <i>“Fucking answer me! You fucking sneak piece of shit, just watching a girl waddle around in pain!”</i>");
	output("\n\nShe props herself against the wall with a loud grunt. <i>“Urgh, these kids are killing me and giving me stretch marks and making me crave weird things!”</i> She continues to rant at you, getting up close to end with, <i>“It’s all your fault!”</i>");
	output("\n\nYou inhale deeply and approach slowly, a livid image of whiplash still visible on your [pc.face]. A regretful countenance soon replaces her angered visage, and she props herself against the wall with a whimpery grunt.");
	output("\n\n<i>“I... Ugh... I’m sorry.”</i> Roxy grabs her head, <i>“I’ve just been stuck in here for what feels like forever. I haven’t gotten much sleep. I know it’ll be");
	if (pregTri >= 3) output(" soon when the kids are born");
	else output(" a couple more months until the kids are born");
	output(" but man, I need a break already...”</i>");
	output("\n\nFlopping down on a chair, Roxy exhales frustratedly. <i>“How the hell can we have all this tech and nothing makes this shit any easier... I just... don’t get it...”</i>");
	output("\n\nWell, there is <i>something</i> you can do...");
		
	processTime(5);
	clearMenu();
	addButton(0, "Cuddle", roxySpareAptCuddleOfCourse, undefined, "Cuddle", "This calls for a soft touch!");
	addButton(1, "Too Bad", roxySpareAptCuddleTooBad, undefined, "Too Bad", "While you could spend some time with her...");
}
public function roxySpareAptCuddleOfCourse():void
{
	clearOutput();
	showRoxy(false, true);
	var pregTri:int = roxyPregTrimester();
	var firstTime:Boolean = true;
	if (flags["ROXY_CUDDLES"] > 0) firstTime = false;
	IncrementFlag("ROXY_CUDDLES");
	
	moveTo("NURSERYG4");
	
	output("You waltz right over and pick Roxy up - gently, of course - and hug her, very mindful of her burdensome belly. <i>“Woah, fuck, that’s what the doctor ordered...”</i> Her voice is muffled in your shoulder.");
	output("\n\n<i>“Let’s go somewhere nicer...”</i> you whisper.");
	output("\n\n<i>“Mmmthatsoundsgood,”</i> Roxy clutches your arm like it’s the only thing keeping her above water. Or standing, in this case.");
	if (firstTime) output(" <i>“Wherever’s fine, long as you’re there.”</i>");
	else output(" <i>“Your room again, please?”</i>");
	
	output("\n\nYou escort Roxy to your private apartment, a room just as quiet as hers but with <i>you</i> decorating its walls, dressers, chairs... and bed. Her eyes are scanning everything, lips slightly parted, ears perking and swiveling all around.");
	//temp change output("\n\nYou escort Roxy through the nursery, up to your private apartment, a room just as quiet as hers but with <i>you</i> decorating its walls, dressers, chairs... and bed. Her eyes are scanning everything, lips slightly parted, ears perking and swiveling all around.");
	if (firstTime) output(" <i>“Your room? Wow... think I just learned a lot about you. I mean, this room is so... you,”</i> she giggles.");
	else output(" <i>“Being here makes me feel safe. Besides, what’s better than bringing a tired rabbit back to your little slice of the universe? So cozy here...”</i> she murmurs.");
	output("\n\nYou’re quick to bring Roxy to your bed, sitting her on the edge next to you. In turn, she’s quick to wrap her arms around your shoulder, resting her head on your [pc.arm] and letting out a long, whimpery moan. The weight of pregnancy, the stress of childbearing, it all falls on you like Sisyphus’ boulder... but you don’t falter. You endure it, wear it like a second skin -- you are indomitable for it.");
	output("\n\nShe can let it all go, she can let it all out, and you won’t budge one inch.");
	output("\n\nWater leaks from the corners of her misty eyes, and she looks up to you with an expression that could melt the cold exteriors of the galaxy’s most fearsome pirates. <i>“I’m so... so tired... being right here with you, [pc.name]... this is what motherhood’s all about.”</i>");
	output("\n\nTurning towards your bun, you maneuver your left arm around her back and pull her in tighter");
	if (pc.hasTits()) output(", pressing her boobs to your [pc.breastsNoun]");
	else output(", close enough that you can feel her heartbeat overlaid on yours");
	output(". <i>“I’m here,”</i> you say, running the back of a [pc.finger] across her cheek, wiping away those tears of emotional needfulness, dropping to stroke the full radius of her stomach.");
	output("\n\nYou’re here, orbiting her like a moon locked in a gravitational field, and your assiduous alignment is unflaggingly precise. To her, you’re the only port of rest in a terrible storm.");
	output("\n\n<i>“Hearing you say that");
	if (!firstTime) output(" again");
	output("-”</i> Roxy hiccups, both topaz eyes clenching shut and pouring tears. <i>“[pc.name]... hearing you say that,”</i> she nestles her head");
	if (pc.hasTits()) output(" further into your cleavage");
	else output(" firmly to your pecs");
	output(", <i>“oh, fuck, look at me, I’m a mess just because of that.");
	if (firstTime) output(" I-I didn’t think you’d-”</i>");
	else output(" You’re so good with-”</i>");
	
	output("\n\nShushing her, you bring her into an invulnerable embrace, every vein in your limbs standing out from the infangible strain on your muscles. Such aches are more than acceptable if it means comforting the protected laquine. It’s an act of devoted passion, one that relishes her closeness, and one that declares to her that you will protect her, now, and forever. The imprint of your affection shines in her eyes, and will likely remain lodged in her heart and soul for the rest of her life.");
	output("\n\n<i>“Can we... you know...”</i>");
	output("\n\nYou shuffle up to the two pillows on your bed, drawing the lovely laquine closer. With all care for her growing litter you set her down in front of you, facing you, nose-to-nose, then pull her closer. While you can’t get the bedsheet over yourself, it’s perfectly warm in here as is, and the material is feather-light. The mattress and its blankets absorb you until one eye vanishes beneath the folds.");
	output("\n\nShe only hums in response, cooing happily as your [pc.hands] work their magic, running through her infant-taut fur. Bubbly feelings flash across her muzzle as rich, creamy happiness takes root, blossoms, and glows in her mind. Roxy’s calling your name, very little gap between the letters that construct it. Her breathy vocals fade into restfulness just as you turn your adventurous digits to her");
	if (pregTri >= 3) output(" milky");
	output(" chest.");
	
	output("\n\nThen you realize, she’s snoring -- Roxy’s fallen asleep!");
	output("\n\n<i>Maybe she really needed a nap,</i> you simper. As much as you’d like to grope her a bit longer, there’s no point if she’s asleep. Giving her lewd dreams isn’t good enough! ");
	output("\n\nLetting your hands settle on her");
	if (pregTri >= 3) output(" baby bump");
	else output(" swollen belly");
	output(", your limbs settle into an automatic rhythm of gentle rubs. You fondly regard your soon-to-be children, feeling your eyes slowly seal");
	if (roxyGetNumLitters() > 0) output(" as your mind drifts to the other half-laquines you’ve helped bring into this galaxy");
	output(".");
	
	processTime(10 + rand(10));
	clearMenu();
	addButton(0, "Next", roxySpareAptCuddleOfCourseNext, undefined);
}
public function roxySpareAptCuddleOfCourseNext():void
{
	clearOutput();
	showRoxy(false, true);
	
	output("Oh geez, you didn’t mean to pass out, but the moment was just too good!");
	output("\n\nBefore your [pc.eyes] reopen you inhale; twice you blink.");
	output("\n\nRoxy’s staring back at you, little rumbly laughs vibrating through her body. <i>“You fell asleep, you dork.”</i>");
	output("\n\nYou respond that she did too -- and she did it first!");
	output("\n\n<i>“I felt it, you know. Felt you rubbing my tummy. It was nice,”</i> she beams. Roxy grabs your hands in hers and guides them to her swell. <i>“I’d like it if you would keep going.”</i>");
	output("\n\nYou can’t bring yourself to say no to her right now, launching back into that strain-soothing massage anew and with the vigor of... however many minutes or hours of power rest you both earned. Roxy’s joy-inundated nervous system is putty in your hands as you find the tenderest regions of her midriff to palm over.");
	if (pc.isPregnant()) output(" Her soft paws rub your belly back; the laquine touches you as if she had a part in creating the life inside of you right now.");
	output("\n\nThe two of you spend hours laughing, cuddling, falling in and out of naps... who cares if there’s an inheritance out there for you to earn. Who cares that you have a whole frontier to explore.");
	output("\n\nAll you need is right here, and that floppy eared lovebun will <i>always</i> be there...");
		
	processTime(120 + rand(120));
	restHeal();
	clearMenu();
	addButton(0, "Next", roxySpareAptCuddleOfCourseNext2, undefined);
}
public function roxySpareAptCuddleOfCourseNext2():void
{
	clearOutput();
	showRoxy(false, true);
	
	output(RandomInCollection(["<i>“...and then Charlie threw him right across the field. That’s what I love about the game.”</i>","<i>“...should have seen the goalie after that, guy’s pants were ripped all the way open!”</i>","<i>“...man that was the best game of that year, me ‘n Charlie hucking the other team lead through their own goal!”</i>","<i>“I slipped one time and accidentally pantsed some girl on the enemy team. Didn’t get called though. Guess the ref liked purple puss!”</i>"]));
	output(" You and Roxy are laughing so uproariously by now that you’ve forgotten to snuggle. <i>“[pc.name],”</i> she says, stroking your cheek, <i>“I feel a lot better. Thanks for spending some time with me.”</i>");
	output("\n\nRejuvenated and reenergized, Roxy rises and extricates herself from your bed, slapping your [pc.ass] as she hops off. <i>“Come back soon, alright? Gonna get some grub. See ‘ya.”</i>");
	output("\n\nShe steps out quickly. Now that you’re thinking about it, you could use a bite to eat, too...");
	
	processTime(10);
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}
public function roxySpareAptCuddleTooBad():void
{
	clearOutput();
	showRoxy(false, true);
	
	flags["ROXY_CUDDLES_REFUSE"] = GetGameTimestamp();
	
	if (pc.isAss()) output("<i>“What can you do?”</i> you stolidly state.");
	else output("<i>“I see...”</i> you whisper, offering to help her up.");
	output("\n\n<i>“Don’t strain yourself helping others, Steele,”</i> she sighs and struggles a bit getting back up");
	if (pc.isNice() || pc.isMischievous()) output(" waving you off when you try to help");
	output(".");
	output("\n\n<i>“I’m going for a walk, don’t wait up.”</i> Roxy leaves in a huff. <i>“At least I had someone to talk to...”</i>");
	
	processTime(5);
	clearMenu();
	addButton(0, "Next", mainGameMenu);
}

public function roxyNurseryRandomEvents(loc:String=""):Boolean
{
	if (!roxyIsVisitingKids()) return false;
	
	//get roxy kids age ranges 0-12 months, 1 - 18 yrs, 18+
	var inf:int = ChildManager.numOfUniqueTypeInRange(RoxyUniqueChild, 0, 11);
	var kids:int = ChildManager.numOfUniqueTypeInRange(RoxyUniqueChild, 12, 216);
	var kids2:int = ChildManager.numOfUniqueTypeInRange(RoxyUniqueChild, 12, 18);
	var kids3:int = ChildManager.numOfUniqueTypeInRange(RoxyUniqueChild, 19, 216);
	var kids4:int = ChildManager.numOfUniqueTypeInRange(RoxyUniqueChild, 35, 216);
	var old:int = ChildManager.numOfUniqueTypeInRange(RoxyUniqueChild, 217, -1);
	var ttl:int = inf + kids;
	var	kidSex:String = roxyGetKidSex(-1);
	var kidName:String = roxyGetKidName(-1, kidSex);
	var	kidSex2:String = roxyGetKidSex(-1);
	var kidName2:String = roxyGetKidName(-1, kidSex2);
	var firstTime:Boolean = true;
	
	if (flags["ROXY_RE_VISIT"] == undefined) flags["ROXY_RE_VISIT"] = 0;
	if (flags["ROXY_RE_DONE"] == undefined) flags["ROXY_RE_DONE"] = 0;
	//if the on a different day then when the last event play, zero out
	if (flags["ROXY_RE_DONE"] != days)
	{
		flags["ROXY_RE_VISIT"] = 0;
		flags["ROXY_RE_DONE"] = 0;
	}
	if (flags["ROXY_RE_VISIT"] == 0)
	{
		var sel:Array = [];
		var i:int;
		var rn:int;
	
		if (ttl > 0) sel.push("children");
		if (kids2 > 0) sel.push("foyer");
		if (kids4 > 0) sel.push("common");

		i = sel.length;
	
		if (i > 0)
		{
			rn = rand(i);
			flags["ROXY_RE_VISIT"] = sel [rn];
		}		
	}
	if (loc == "children" && flags["ROXY_RE_VISIT"] == "children")
	{		
		if (flags["ROXY_RE_DONE"] > 0) return roxyNurseryRandomEventBlurb(loc);
		clearOutput();
		showRoxy(false, true);
		if (flags["ROXY_RE_CHILDREN"] > 0) firstTime = false;
		flags["ROXY_RE_CHILDREN"] = 1;
		output("Stepping into the caretaking area, you’re pleasantly surprised to find Roxy here, and she’s the center of attention to your kids");
		if (ChildManager.numChildren() > ChildManager.numOfType(GLOBAL.TYPE_LAPINE)) output(", mostly the laquines");
		output(". She’s focused completely on them, and doesn’t notice your entrance.");
		if (pc.isMischievous()) output("\n\nYou seize the opportunity laid before you to quietly walk behind her and pinch her fluffy tail. Roxy seizes up, biting her tongue to kill a surging yelp. Your bun puts on her best death glare before turning around; her face softens when she identifies you as the perpetrator.");
		else
		{
			if (pc.isAss()) output("\n\nYou curtly");
			else output("\n\nYou gently");
			output(" tap the reactive rabbit’s shoulder and she whips around fearsomely, mouth open about to say something. Something aggressive most likely as Roxy sheepishly turns her head back to the children.");
		}
		if (kids > 0) output("\n\nYour older kids certainly get a kick out of her reaction!");
		output("\n\n<i>“[pc.name]. Of course it’s you,”</i> she jitters cutely. <i>“Came to visit the kids too?”</i>");
		output("\n\nMore or less. You’re just a bit disappointed she didn’t tell you she was coming! ");
		output("\n\n<i>“I was gonna but then I was too excited and caught up doing other stuff to remember. I was uh, sewing some toys for the kids. My teammates gave me a bit of sh-,”</i> she catches herself, <i>“-of hard time over it but I went through with it.”</i>");
		output("\n\nNow that she’s told you what seems a little different here, you notice that all the children in the room have specially made toys in hand. They regard them as they would anything else: inquisitively, playfully. They really love to hug them, too! Wait, doesn’t that one look a bit like you..?");
		output("\n\n<i>“They’re very popular with them!”</i> Roxy smugly intones, only to have the look drop as one of your kids throws one of the plush toys at the back of her head. You try to hold back your laughter as the tricksy rabbit-");
		if (kidSex == "M") output("boy");
		else output("girl");
		output(" giggles, but then everyone else starts laughing, unstucking your meager restraints.");
		output("\n\n<i>“Don’t encourage them!”</i> Roxy chides, turning to face her diminutive assailant. <i>“And you, " + kidName + ", shouldn’t throw things.”</i>");
		if (kids > 0) output("\n\nWhile Roxy turns her attention back to the babies, one of the older tykes waddles over to you, handing over one of the homemade toys. Getting to look closer at it you find that");
		else output("\n\nYou pick up the thrown toy to inspect it and ");
		if (firstTime) output(" they’re surprisingly well stitched for being shapeless masses with embroidered faces on them. They’re also soft to a ridiculous degree.");
		else output(" they seem a lot smaller than the ones you saw the first time. Much less of a choking hazard...");
		output("\n\nAnd... they also kind of look like you.");
		if (firstTime) output(" They’re looking even closer to what you’ve seen in the mirror!");
		output(" Those [pc.ears] are unmistakable.");
		output("\n\n<i>“What? Disappointed?”</i> Roxy chuckles at you. <i>“Only so much you can do with fabric, [pc.name]. I was a tailor before I became an athlete. Kinda need to know how to do that and do it well to get paid.”</i>");
		output("\n\nYou hum in response, watching one of your children try to stuff one of the toys into their mouth. You instinctively go grab at the toy - <i>“Wait, I got that!”</i> Roxy yelps; no, <i>you do!</i> Somehow you end up racing Roxy to the task and falling all over each other in an effort not to collapse on your");
		if (kidSex2 == "M") output(" son");
		else output(" daughter");
		output("! The room lights up with laughter while you help each other back to rationality.");
		
		output("\n\n<i>“That’s parenthood, right?”</i> Roxy grins.");
		output("\n\nThe two of you pass the time playing with your kids, a knot gently unraveling in your chest. Being here is a blessing and a privilege. It’s a miracle. You try to come up with more ways to feel good about it, and find yourself lost in a field of celandines. It’s funny, in a way. You’re supposed to be out there seeing the universe... but you don’t want to. You don’t want to leave this room, you don’t want to leave the giggles, the tiny little grasps at your hand, the gleaming smiles on your children’s faces...");
		output("\n\n<i>“You know, I’ve got this covered. I’ll be here for a little longer. I’m just glad we caught up is all.”</i> Roxy slaps your shoulder. <i>“If you got places to be don’t waste time on my account, [pc.raceCute]-[pc.boyGirl].”</i>");
		output("\n\nCheeks raised, you lean in for a smooch on her twitchy nose and stand. Until next time then.");
		if (firstTime) 
		{
			output("\n\n<i>“But one thing while I’m here, no sex. This is for the kids, got it?”</i>");
			output("\n\nGot it.");
		}
		else
		{
			output("\n\n<i>“Just remember, this ain’t a booty call, [pc.name]. I’m here on downtime for the kids.”</i>");
			output("\n\nUnderstood.");
		}	
		processTime(60 + rand(60));
		flags["ROXY_RE_DONE"] = days;
		clearMenu();
		addButton(0, "Next", mainGameMenu);
		return true;
	}
	else if (loc == "foyer" && flags["ROXY_RE_VISIT"] == "foyer")
	{		
		if (flags["ROXY_RE_DONE"] > 0) return roxyNurseryRandomEventBlurb(loc);
		clearOutput();
		showRoxy(false, true);
		if (flags["ROXY_RE_FOYER"] > 0) firstTime = false;
		flags["ROXY_RE_FOYER"] = 1;
		
		output("There’s a bona fide field trip in the nursery today, led by none other than Roxy. She’s cheering exuberantly for one of her children, her voice one of many in an encouraging chorus.");
		output("\n\n<i>“Hey, [pc.name]. Look the kids can walk on their own now!");
		if (kidSex == "M") output(" He");
		else output(" She");
		output("’s taking her first steps, look, look!”</i> she gestures energetically. <i>“Hey, kids, there’s " + pc.mf("dad","mom") + ", right there, go say hi! Show " + pc.mf("‘em","‘er") + " what you learned!”</i>");
		output("\n\nYou can see that plain as day, a few of the kids have rushed to your feet while others crawl or waddle unsteadily, getting used to the fact their unique biology allows them to walk on their heels or toes. Various attempts of success at " + pc.mf("dad","mom") + " are called out to you. Roxy grins goofily the whole time. <i>“Now try to walk across the room,”</i> she snerks, pulling out a codex. <i>“I want to see this.”</i>");
		output("\n\nYou hope she’s joking.");
		output("\n\n.......");
		output("\n\nShe’s not joking.");
		output("\n\nSliding to the side only has the fluffle of half-laquines follow suit");
		//check if first litter has aged out of these scene
		if (kids3 < 1) output(", namely " + kidName + ", " + kidName2);
		output("... Maybe you can just shimmy yourself across the room! The munchkins are swarming your lower half, hopping up and down and trying to climb all over you. You plan your moves and take what little ground you can without harming them, only to hear a loud snort. Roxy has her gadget pointed up at you, clearly recording this whole event.");
		output("\n\nYou make sure to glare for the camera as she says, <i>“I won’t post it, don’t worry.”</i>");
		output("\n\nThe tone of her voice says otherwise! Oh god, and she’ll name the video something embarrassing!!");
		output("\n\nBut if you’re going to do anything about it, you’re gonna have to get over to Roxy first. And your kids are <i>not</i> helping, bless their little hearts.");
		if (kids2 >= 3) output("\n\nThey’re too big to pick up all at once now so that’s not an option and trying to step over the group won’t work.");
		else output("\n\nThe pair are guaranteed to make it too hard to pick them up and trying to step over them won’t work.");
		output(" A part of you wishes <i>someone</i> would help you, but that <i>someone</i> is too busy filming you. Briget is curiously absent, and none of the nursery staff, biological or mechanical, are around.");
		output("\n\nShit. But you’re [pc.name] Steele. You can do this.");
		output("\n\nSomehow, through a mix of shuffling and awkward steps, you maneuver to Roxy with a crowd of wibbly-wobbly ears around your feet. She only laughs harder at you.");
		output("\n\n<i>“Oh come on, Steele. They do this to me too, it’s about time you got to see what it’s like to be a " + pc.mf("dad","mom") + ". It means they love you, doofus!”</i> Shoving her codex in her pocket, Roxy grabs ahold of you in a large hug. Taking the cue from their");
		if (pc.hasVagina()) output(" birth");
		output(" mother, your kids latch on to you too.");
		output("\n\nIt’s nice to know you have Roxy around, and moments like these make it all so worth it to be a parent.");
		output("\n\n<i>“I’m so going to post the video online though.”</i>");
		processTime(15 + rand(15));
		flags["ROXY_RE_DONE"] = days;
		clearMenu();
		addButton(0, "Next", mainGameMenu);
		return true;
	}
	else if (loc == "common" && flags["ROXY_RE_VISIT"] == "common")
	{
		if (flags["ROXY_RE_DONE"] > 0) return roxyNurseryRandomEventBlurb(loc);
		clearOutput();
		showRoxy(false, true);
		if (flags["ROXY_RE_COMMON"] > 0) firstTime = false;
		flags["ROXY_RE_COMMON"] = 1;
		
		output("<i>“Think fast!”</i>");
		output("\n\nYou barely do, avoiding the untrained roller blading of one of your eldest laquine children. Roxy is here too, you’d know that gleeful giggling anywhere. She’s wearing her roller blades, skating around the room and wowing all of your kids. Everyone’s assembled on one side, the entire common area modified to support her dangerous little game. <i>“Heya, [pc.name]! Check this out!”</i>");
		output("\n\nThe athletic bun is handling herself as gracefully and magnificently as you would expect, rolling around the room and pulling off moves you’d described as sick (and possibly too nasty), impressing her children and nearly colliding with things several times. To be fair, she’s probably doing that for dramatic effect. It eventually becomes clear that she’s too much of a pro and much too used to that style of movement to be done in by a few tipped tables.");
		output("\n\n<i>“I’m gonna teach this class how to skate one day, all of ‘em! They don’t need to follow in momma’s footsteps, buuuut it couldn’t hurt to have something in common!”</i> she bellows, stopping in front of you. <i>“Look at what " + kidName + " can do, too! Watch,”</i>");
		if (kidSex == "M") output("\n\nYour son, " + kidName + " is holding steady, barely keeping his balance. Roxy’s there to baby him, and you eventually join the arrayed children, watching your laquine walk your child through the motions, how to bend the body just right, how to stay on your feet, how to accelerate and decelerate without falling. Any time he looks like he’s about to fall, your lovebun steadies him.");
		else output("\n\nYour daughter, " + kidName + " is holding steady, barely keeping her balance. Roxy’s there to baby her, and you eventually join the arrayed children, watching your laquine walk your child through the motions, how to bend the body just right, how to stay on your feet, how to accelerate and decelerate without falling. Any time she looks like she’s about to fall, your lovebun steadies her.");
		
		output("\n\n<i>“See? Just like that, now, why don’t you try to get used to that before we give someone else a shot, hmmm?”</i> Roxy pats " + kidName + "’s head and glides on over to you with a kick of her lapine legs, laughing at what she sees.");
		output("\n\nAll of your kids have surrounded and begun to climb all over you, vying and begging for attention. You didn’t even realize it at some point, so enamored with watching the motherly sports-bun instruct one of the youngest roller bladers of all time. <i>“Looks like you’re having fun!”</i>");
		output("\n\nShe yanks you out of the pile and brings you into the firmest hug of all time. <i>“Sorry you don’t have much to offer up here, and I only got one extra pair of roller blades, kid sized.”</i> She scratches her head, nuzzling into your [pc.chestNoun]. <i>“But hey, glad you’re still visiting and all that.”</i>");
		if (kidSex == "M") output("\n\nThere’s a crash and a sudden bout of crying. Roxy’s head whips around and she sees her son fallen to the ground and beginning to cry. Poor thing lost his balance! <i>“Daww... well, you can’t stand unless you’ve fallen! Hey, I’ve got this taken care of, don’t mind me. And, hey, don’t tell Briget!”</i>");
		else output("\n\nThere’s a crash and a sudden bout of crying. Roxy’s head whips around and she sees her daughter fallen to the ground and beginning to cry. Poor thing lost her balance! <i>“Daww... well, you can’t stand unless you’ve fallen! Hey, I’ve got this taken care of, don’t mind me. And, hey, don’t tell Briget!”</i>");
		output("\n\nSure... can do.");
		output("\n\nIn mere seconds Roxy (and some of the others) have huddled around the sobbing rookie. In as little time, they’re back to laughing and cheering.");
		output("\n\nLike nothing bad ever happened.");
		processTime(15 + rand(15));
		flags["ROXY_RE_DONE"] = days;
		clearMenu();
		addButton(0, "Next", mainGameMenu);
		return true;
	}

	return false;
}
public function roxyNurseryRandomEventBlurb(loc:String=""):Boolean
{
	if (loc == "children")
	{
		output("\n\nRoxy’s here playing with her children");
		if (ChildManager.numChildren() > ChildManager.numOfType(GLOBAL.TYPE_LAPINE)) output(", and the others you’ve had as well when they show interest");
		output(". It gives you a warm, fuzzy feeling, knowing that you’ve met someone as loyal and devoted as her, knowing that she’ll be there for them as much as she will be for you.");
	}
	else if (loc == "foyer")
	{
		output("\n\nRoxy is present, leading a lot of your kids around like a school teacher, helping them take their first steps in the galaxy. A powerful swell in your chest explodes like a pinata of delirium-causing happy feelings. It’s just too adorable.");
		output("\n\n");
	}
	else if (loc == "common")
	{
		output("\n\nRoxy is still skating around the room, training for a few minutes at a time each one of the children present. Only the ones old enough get to have a go in those trainee roller blades! Now that they have full attention, there are no more unfortunate crashes.");
	}	
	
	return false;
}
public function roxyExcerciseBlurb():void
{
	output("\n\nNo surprise that Roxy’s wandering around the nursery this early. She waves at you casually, but keeps to herself on a rather strict-looking exercise regimen. It looks much harder with the presence of her child-laden belly, but knowing her, she isn’t the type to ever enjoy sitting around doing nothing.");
}
public function roxyCafeteriaTalk(skip:Boolean = false):void
{
	clearOutput();
	showRoxy(false, true);
	
	if (skip) output("Roxy gives you the inquisitive eye, waiting to hear more.");
	else
	{
		output("<i>“Mind if we have a talk?”</i> you ask.");
		output("\n\n<i>“Sure, yeah, sounds great,”</i> Roxy sighs, <i>“anything to take my mind off this.”</i>");
	}
	
	processTime(1);
	clearMenu();
	addButton(0, "Pregnancy", roxySpareAptTalkPreg, true, "Pregnancy", "Ask Roxy how she’s holding up.");
	addButton(1, "Plans", roxySpareAptTalkPlans, true, "Plans", "Ask Roxy what she’s going to do after having your kids.");
	if (roxyHasVisitedKids()) addButton(2, "Children", roxyTalkChildren, 2, "Children", "Ask Roxy how the kids are doing!");
	else addDisabledButton(2, "???");
	addButton(3, "Back", roxyCafeteriaGreet, true);
}
//if steele missed first birth, roxy names the kids
public function roxyMissedBirthNameKids():void
{
	var children:Array = listBabiesOfParent("Roxy");
	var child:UniqueChild;
	var c:UniqueChild;
	var boyNames:Array = ["Max", "Peter", "Nate", "Nick", "Michael", "Ken", "Gabriel", "Derrick"];
	var girlNames:Array = ["Katreena", "Evelyn", "Joan", "Jessica", "Mary", "Amai", "Tia", "Lystra"];
	
	for(var i:int = 0; i < children.length; i++)
	{
		c = children[i] as UniqueChild;
		if (c.NumMale > 0)
		{
			flags["ROXY_KID_SEX"][i] = "M";
			flags["ROXY_KID_NAME"][i] = boyNames[i];
		}
		else if (c.NumFemale > 0)
		{
			flags["ROXY_KID_SEX"][i] = "F";
			flags["ROXY_KID_NAME"][i] = girlNames[i];
		}
		else
		{
			flags["ROXY_KID_SEX"][i] = "H";
			flags["ROXY_KID_NAME"][i] = girlNames[i];
		}
		c.Name = flags["ROXY_KID_NAME"][i];
	}
}
public function roxyNoVagSex():Boolean
{
	if (flags["ROXY_DOGGY_VAG"] > 0) return false;
	if (flags["ROXY_DOGGY_DP"] > 0) return false;
	if (flags["ROXY_MISSIONARY"] > 0) return false;
	if (flags["ROXY_COWGIRL_FIRST"] > 0) return false;
	if (flags["ROXY_COWGIRL_HOLD"] > 0) return false;
	if (flags["ROXY_BREED"] > 0) return false;
	if (flags["ROXY_SPOON"] > 0) return false;
	if (flags["ROXY_RVS_COWGIRL"] > 0) return false;

	return true;
}

public function roxyIntimacySitWith(loc:int=0):void
{
	clearOutput();
	showRoxy(false, true);
	var pregTri:int = roxyPregTrimester();
	
	output("<i>“Want some company?”</i> you ask, leaning against the armrest of Roxy’s chair. She puts her sewing kit down on the nearby stand and nods, looking up with needy eyes.");
	output("\n\n<i>“Yeah, this chair’s pretty big, and it’s pretty comfy... I could use some us time on it.”</i>");
	if (pc.tallness >= 72)
	{
		output("\n\nYour coffee-colored bun scooches to make some room, but you take her off guard by lifting her up off the chair. She freaks, arms flailing until wrapping tight around your shoulder. <i>“Wait, I thought-”</i>");
		output("\n\nHold on!");
		output("\n\nYou whip around and fall [pc.butts] first back into the comfy couch, letting Roxy use your superior stature as a literal full-body pillow. Her tummy wobbles obligingly against your [pc.belly]. The sheer heaviness of her life-filled womb dominates your personal space. You can feel all the tiny thumps and kicks from within, of all the children you put there squirming, growing...");
		output("\n\nFuck, that’s wonderful.");
		output("\n\n<i>“I... I’m not disappointed,”</i> Roxy grins, <i>“this ain’t so bad...”</i>");
		output("\n\nShe kisses you right away, but it’s an artless affection that breaks apart with firm, thick rubs to her taut gut. You keep her held upright and pressed to your [pc.lipColor] lips, concentrating on coaxing moans and throaty purrs out of her, reveling in the heat of ultra soft bunnyfur sliding between your [pc.fingers]. The kids she’s nourishing are <i>yours.</i> She’s the mother of your kids... gosh, you just can’t stop playing that fact back.");
		output("\n\nRoxy’s carrying your babies. She’s the fertile meadow you’ve begun a family of laquines upon. Her field stretches to the infinite horizon, every inch of it fertile. In her eden, you tell her, you’ve found a garden you want to fill with flowers. As many times as she wants, as many times as you want.");
		output("\n\nRoxy gasps and turns away, a massive burgundy blush writ upon her muzzle.");
		output("\n\n<i>“What the fff... how can you so easily say things like that!?!”</i> she screams, nails digging into your [pc.skinFurScales], body shivering. You don’t wince. <i>“I’m gonna...”</i> she hiccups, <i>“you can’t just make me cry like that...”</i>");
		output("\n\nD’aw.");
	}
	else if (pc.tallness >= 64)
	{
		output("\n\nRoxy moves to give you half the chair, and you flop down in the comfy cushion [pc.butts] first, immediately wrapping an arm around her shoulder and tugging her close. There’s a super cute pouty look on her muzzle looking up to you from your [pc.chestNoun]");
		if (pc.hasTits()) output(", her cheek smushed into your left tit");
		output(". <i>“Hey... overeager much?”</i>");
		output("\n\nShe sits up and elbows you in the arm, but joins you in a laugh, eventually cuddling up a lot more appropriately. No better time now with your pregnant bunny wrapped around you to rub that infant-inflated tummy!");
		output("\n\nThe dutiful mom-bun carrying and incubating your children moans right away, purring in your grasp. You grope at her ass, pat, and lightly smack her wobbly womb, enjoying the feel of all that ultra-soft fur filtering between your [pc.fingers]. New life squirms and kicks inside the laquine, growing atop the fertile meadow that you ploughed.");
		output("\n\nShe’s carrying these children for you... and for herself. You inundate her with praise, with love, clutching her paws tight enough to hurt. This moment couldn’t make you happier.");
		output("\n\n<i>“God damn it... what the fuck is that kind of talk...?”</i> Roxy whips her head away, both ears dropping low enough to smack into your nose. <i>“You...”</i> she hiccups, <i>“you can’t go making girls cry like that!”</i>");
	}
	else
	{
		output("\n\nShe moves to make some space, but you drop down on her lap regardless. Your smaller size makes it easy to nestle yourself in against her distended belly, makes it easy to rub all over it with [pc.hand] and [pc.face]. <i>“Fuckin’... don’t stop,”</i> Roxy purrs, eyes shutting in pleasure.");
		output("\n\nYou don’t so much sit down as you just take every opportunity presented to rub in how heavy you’ve made her. All the life squirming around in her incubating stomach came from you. You’re the one who sowed the seeds of life upon her meadow, and she’s the dutiful mom-bun carrying them for you.");
		output("\n\nFor the both of you -- you tell her that, you thank her for that, clutching her hands while resting your head atop the baby-bloated womb.");
		output("\n\n<i>“You tryin’ to make me cry?”</i> Roxy says, stony faced. She quivers, and hiccups. <i>“Because... fucking... you make me feel a lot of things, y’know?”</i>");
	}
	
	output("\n\nYou did kind of just stray into her arms like the original vagabond, bursting onto her scene, becoming the answer to her deepest wishes and desires. Looking back on it, it’s hard to believe how quickly you’ve gotten to this point, nabbing yourself a hot, fertile laquine like Roxy and making her <i>yours.</i> Regret swells inside from your moment of objectification... but that’s just her rubbing off on you.");
	output("\n\nAnd rubbing you. The slutty brood-bun can’t keep her hands to herself! She’s groping at your");
	if (pc.hasVagina()) output(" groin");
	else output(" [pc.cocksLight]");
	output(", scratching your head softly. Of course you return the favors, raising her tone by another octave.");
	
	output("\n\nThe high pitched voices she makes during sex, everything you’ve heard her say, fuck, she’s got a way of transmitting all those habits. You’d have it no other way, though. Rubbing her tummy is the best thing ever. You can feel the kicks of her numerous children inside, waiting to be born into the galaxy. If you focus hard enough you can feel each of their individual heartbeats -- Roxy’s is always hitting the hardest over it.");
	if (pregTri >= 3)
	{
		output("\n\nDark discolorations form against her top, and you lift her shirt and bra away to reveal the pregnancy-swelled mounds of laquine boob. Milk is leaking from outjutting, dusky nipples, and you can’t resist sealing your O-lips to one and suckling. <i>“Hey... not too much, okay? Our kids will need that...”</i>");
		output("\n\nIn response, you suck a little harder, feeling the pressure release inside and splash your entire mouth. The bunny-girl’s rich, savory bounty puffs out your cheeks, forcing you to gulp down the treat while more and more flows gently across your palate like nurturing irrigation. <i>“Well... you better finish the job then, c’mere...”</i>");
		output("\n\nYour head is guided by a paw to eagerly nurse from the other teat. <i>“Didn’t think my big [pc.raceCuteShort] slut was a fuckin’ baby too,”</i> Roxy snickers, pinching your [pc.ear]. <i>“Have your fun, ‘cuz I’ve got a lot. Might as well make yourself useful around here!”</i>");
		output("\n\nAgreed!");
	}
	output("\n\nRoxy may protest, may swear at you, and no doubt have her moments of overburdened rage... but she loves you, she loves the way you make her feel, and above all she loves seeing how much you enjoy <i>her.</i> Being with her, playing with her... where are the minutes and hours going? ");
	output("\n\nThey’re all spent having a polite rest that shifts some of the mental and emotional weight into storage, leaving you free to relax contented in each other’s embrace,");
	if (pc.tallness >= 72)
	{
		output(" her head resting");
		if (pc.hasTits()) output(" in your cleavage");
		else output(" against your pecs");
		output(".");
	}
	else if (pc.tallness >= 64) output(" resting on each other’s shoulders.");
	else output(" your head resting in her cleavage.");
	
	output("\n\n<i>“If I were so rich, I’d love us to do this every day. No sports, no stadiums... I could get used to this, I really could, [pc.name]...”</i> Roxy whispers. The water in her irises makes her eyes look like citrine pearls. <i>“Our family would be the biggest of all... fuck... I hope you’ll come do this again later.”</i>");
	output("\n\nThe two of you begin to disentangle, realizing the time for closeness is up. For now. ");
	output("\n\n<i>“Promise me?”</i> she whispers.");
	output("\n\nIt’s a promise.");
	output("\n\nAnd it was your pleasure.");
	
	clearMenu();
	processTime(60 + rand(60));
	pc.changeLust(30);
	addButton(0, "Next", roxyIntimacyMenu, loc);
}
public function roxyIntimacyRubTummy(loc:int=0):void
{
	clearOutput();
	showRoxy(false, true);
	var pregTri:int = roxyPregTrimester();
	
	if (loc == 0) output("[pc.Walking] up to Roxy, you squat down, staring at her belly with the silliest grin on your face.");
	else output("Scooting closer to Roxy, you stare down at her belly with the silliest grin on your face.");
	
	output("\n\n<i>“What’s on your mind, [pc.name]? Are-”</i>");
	output("\n\nYour [pc.hand] plants to her large belly; she squeaks out an inarticulate affection, voice reducing to a light giggle. <i>“That tickles, stop! No! That’s not fair!”</i> she fires off like a lewd pistol. It only encourages you to get more deliberate, and get <i>both</i> [pc.hands] on it! Silky soft, fibrous laquine fur feels wonderful gliding across your caressing fingers. It’s an addictive pleasure to you, and further exasperation for her.");
	if (pregTri >= 3)
	{
		output("\n\nYou could never hope to map every inch of Roxy’s heavily pregnant belly, a massively swollen gut full of children nearing their term. It’s proof of your union, proof of her position as a dutiful, healthy broodmother. It’s proof of your virility too, which is perhaps why it feels so <i>warm</i> to the touch. Something buzzes faintly in the back of your mind when you feel your babies kick against her protective walls.");
		output("\n\nIt’s... it’s a moving feeling. Water develops in your eye, feeling the heartbeats, the stirrings and pulsings of your offspring...");
	}
	else output("\n\nRoxy’s belly in its second trimester is a beautiful beginning to the miracle of childbirth -- of cross-species childbirth at that! Tiny thumps from within hint at the life being nurtured inside, lives that you spawned, that she carries... it’s a wonderfully shaped tummy, swollen with the kind of litter a real broodmom deserves.");
	
	output("\n\n<i>“That feels good. I’ll let you have your fun, [pc.raceCuteShort]-[pc.boyGirl],”</i> Roxy quips, voice unsteady. She’s gritting her teeth and sticking her belly out in your direction, demanding more playful touches, and clearly thinking that she’s adjusting to the affable onslaught.");
	output("\n\nInstead, you fall face-first into her gut, [pc.tongue] dancing out to lick at a tummy once defined by muscles now");
	if (pregTri >=3) output(" fit to burst");
	else output(" expanded");
	output(" with prenatal laquines. <i>“Nooooo!!!”</i> Roxy growls out, head arching back, panting madly. You lick and you lick, nibbling once or twice before massaging your love marks away. All of your attentions are focused on her tummy, which you rub, and rub, and rub...");
	output("\n\n<i>“Stop, it’s too much!”</i> she cries deliriously, eyes crossed with pleasure.");
	output("\n\nNow, maybe you should... but maybe just another minute in selfish glory? She looks this way because of you. These wonderful kids, who will go on to lead amazing lives... they’re going to be born because of you. There’s no mischief in what you do, least you like to think so. You’re just admiring the woman bearing your burden, the fecund laquine who was happy to receive <i>your seed,</i> start <i>your family...</i>");
	output("\n\nIt’s with enthusiasm you tease her for the last thirty seconds, making your reluctance obvious when you withdraw. Roxy is a quivering wreck");
	if (loc == 1) output(", and her food’s gone cold");
	output(". <i>“G-Geez... some warning next time...”</i> she pouts.");
	output("\n\nAll you can do is hug her. Hug her, kiss her, and settle her down.");
	output("\n\nYou don’t intend to give advance warning for that kind of attention, though.");

	clearMenu();
	processTime(10 + rand(10));
	pc.changeLust(5);
	addButton(0, "Next", roxyIntimacyMenu, loc);
}